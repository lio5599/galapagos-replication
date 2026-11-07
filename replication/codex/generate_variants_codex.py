"""Isolated Codex CLI generation using the partner's exact prompt templates.

No API SDK; requires existing ChatGPT CLI login. One fresh session per function.
Outputs stay in replication/codex/runs; never touch the partner's active variants.
"""
import argparse
import datetime as dt
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import tempfile
import time

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
spec = importlib.util.spec_from_file_location("partner_generator", ROOT / "replication/claude/generate_variants_claude.py")
partner = importlib.util.module_from_spec(spec)
spec.loader.exec_module(partner)


def sha(data):
    return hashlib.sha256(data.encode()).hexdigest()


def stamp():
    return dt.datetime.now(dt.timezone.utc).isoformat()


def find_codex(lookup=None, environ=None, user_home=None):
    """Find the desktop-bundled CLI even in a normal terminal without app PATH entries."""
    lookup = lookup or shutil.which
    environ = os.environ if environ is None else environ
    override = environ.get('GALAPAGOS_CODEX_EXE')
    if override:
        path = Path(override).expanduser()
        if not path.is_file():
            raise FileNotFoundError('GALAPAGOS_CODEX_EXE does not point to an existing executable')
        return str(path)
    on_path = lookup('codex') or lookup('codex.exe')
    if on_path:
        return on_path
    home = Path.home() if user_home is None else Path(user_home)
    roots = [home / 'AppData/Local/OpenAI/Codex/bin']
    for key, suffix in (('LOCALAPPDATA', 'OpenAI/Codex/bin'), ('USERPROFILE', 'AppData/Local/OpenAI/Codex/bin')):
        if environ.get(key):
            roots.append(Path(environ[key]) / suffix)
    candidates = {p for root in roots for p in root.glob('*/codex.exe') if p.is_file()}
    if candidates:
        return str(max(candidates, key=lambda p: p.stat().st_mtime_ns))
    return None


def command(exe, model, effort, instructions, output):
    return [exe, "exec", "--ignore-user-config", "--ephemeral", "--skip-git-repo-check",
            "--sandbox", "read-only", "--model", model, "--json", "--color", "never",
            "-c", 'model_provider="openai"', "-c", f'model_reasoning_effort="{effort}"',
            "-c", "model_instructions_file=" + json.dumps(str(instructions)),
            "-c", 'web_search="disabled"', "-c", "features.shell_tool=false",
            "-c", "features.apply_patch_freeform=false", "-c", "features.view_image=false",
            "-c", "features.multi_agent=false", "-c", "features.apps=false",
            "-c", "features.memories=false",
            "-c", "project_doc_max_bytes=0", "-c", 'approval_policy="never"',
            "--output-last-message", str(output), "-"]


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--condition", required=True, choices=partner.CONDITIONS)
    ap.add_argument("--run", required=True)
    ap.add_argument("--model", required=True, help="Exact accessible Codex model id; recorded verbatim")
    ap.add_argument("--effort", default="medium", choices=["low", "medium", "high", "xhigh", "max"])
    ap.add_argument("--selection", type=Path, default=HERE / "selection-pilot.json")
    ap.add_argument("--dry-run", action="store_true")
    ap.add_argument("--timeout", type=int, default=900)
    ap.add_argument("--codex", help="Optional executable path; otherwise auto-detect PATH or desktop installation")
    args = ap.parse_args()
    if not re.fullmatch(r"[A-Za-z0-9_-]+", args.run):
        ap.error("run must contain only letters, digits, underscore or hyphen")
    selection = json.loads(args.selection.read_text())
    template = partner.load_template(args.condition)
    items = []
    for project, names in selection.items():
        found = partner.work_items(str(ROOT), [project], names)
        if len(names) != len(set(names)) or {it["fn"]["name"] for it in found} != set(names):
            ap.error(f"Unknown or duplicate selection in {project}: {names}")
        items.extend(found)
    if not items:
        ap.error("empty selection")
    run = HERE / "runs" / args.run
    run.mkdir(parents=True, exist_ok=True)
    settings = dict(condition=args.condition, model_requested=args.model, effort=args.effort,
                    selection=selection, template_sha256=sha(template), n_variants=10,
                    max_attempts=1, system_prompt=partner.SYSTEM_PROMPT,
                    transport="Codex CLI with saved ChatGPT login; not this chat's history")
    manifest = run / "generation.json"
    if manifest.exists():
        old = json.loads(manifest.read_text())
        if any(old.get(k) != v for k, v in settings.items()):
            ap.error("Run settings differ. Use a new run name.")
    else:
        manifest.write_text(json.dumps({**settings, "created_at": stamp()}, indent=2))
    for it in items:
        prompt = partner.build_prompt(template, Path(it["src"]).read_text())
        folder = run / "prompts" / it["project"]
        folder.mkdir(parents=True, exist_ok=True)
        path = folder / (it["fid"] + ".txt")
        if path.exists() and path.read_text() != prompt:
            ap.error("Reference/prompt changed since run creation")
        path.write_text(prompt, encoding="utf-8")
    print(f"Prepared {len(items)} prompts / {len(items)*10} requested variants in {run}", flush=True)
    if args.dry_run:
        return
    exe = args.codex or find_codex()
    if not exe:
        ap.error("Codex CLI not found on PATH or in the desktop installation. Set --codex to the full codex.exe path.")
    print(f"Using Codex: {exe}", flush=True)
    env = dict(os.environ)
    for key in ("OPENAI_API_KEY", "CODEX_API_KEY", "OPENAI_BASE_URL"):
        env.pop(key, None)
    auth = subprocess.run([exe, "login", "status"], env=env, capture_output=True, text=True)
    if auth.returncode or "ChatGPT" not in auth.stdout + auth.stderr:
        ap.error("ChatGPT CLI login required; API-key login is not used by this bridge")
    version = subprocess.run([exe, "--version"], env=env, capture_output=True, text=True).stdout.strip()
    # Empty working directory prevents project instructions and access to other variants.
    with tempfile.TemporaryDirectory(prefix="galapagos-codex-") as tmp:
        tmp = Path(tmp)
        instructions = tmp / "neutral.txt"
        instructions.write_text(partner.SYSTEM_PROMPT, encoding="utf-8")
        for it in items:
            out = run / "replies" / it["project"]
            out.mkdir(parents=True, exist_ok=True)
            reply = out / (it["fid"] + ".txt")
            meta_file = out / (it["fid"] + ".meta.json")
            if reply.exists() and meta_file.exists():
                saved = json.loads(meta_file.read_text())
                raw = reply.read_text(encoding="utf-8")
                prompt_saved = (run / "prompts" / it["project"] / (it["fid"] + ".txt")).read_text()
                if saved.get("reply_sha256") != sha(raw) or saved.get("prompt_sha256") != sha(prompt_saved):
                    raise SystemExit("Saved prompt/reply changed; refusing to resume")
                variants = run / "variants" / it["project"]
                variants.mkdir(parents=True, exist_ok=True)
                (variants / (it["fid"] + ".c.variants")).write_text(partner.parse_response(raw), encoding="utf-8")
                print(f"Resume: keeping {it['project']}/{it['fid']}", flush=True)
                continue
            if reply.exists() or meta_file.exists():
                raise SystemExit("Incomplete saved reply/metadata pair; inspect before restarting")
            prompt = (run / "prompts" / it["project"] / (it["fid"] + ".txt")).read_text()
            result_file = tmp / "last.txt"
            if result_file.exists():
                result_file.unlink()
            cmd = command(exe, args.model, args.effort, instructions, result_file)
            print(f"Generating {it['project']}/{it['fid']}", flush=True)
            started = time.monotonic()
            proc = subprocess.run(cmd, input=prompt, text=True, encoding="utf-8", env=env,
                                  cwd=tmp, capture_output=True, timeout=args.timeout)
            (out / (it["fid"] + ".events.jsonl")).write_text(proc.stdout, encoding="utf-8")
            (out / (it["fid"] + ".stderr.txt")).write_text(proc.stderr, encoding="utf-8")
            events = []
            for line in proc.stdout.splitlines():
                try:
                    events.append(json.loads(line))
                except json.JSONDecodeError:
                    pass
            completed = [e for e in events if e.get("type") == "turn.completed"]
            tool_items = [e for e in events if e.get("type") == "item.completed"
                          and e.get("item", {}).get("type") not in ("agent_message", "reasoning")]
            if proc.returncode or not completed or tool_items or not result_file.exists():
                raise SystemExit(f"Generation failed or used tools: inspect {out}. No retry or validation performed.")
            raw = result_file.read_text(encoding="utf-8")
            if not raw.strip():
                raise SystemExit("Empty reply; stopping")
            parsed = partner.parse_response(raw)
            count, problem = partner.galapagos_split_check(parsed, it["fn"]["return"])
            reply.write_text(raw, encoding="utf-8")
            variants = run / "variants" / it["project"]
            variants.mkdir(parents=True, exist_ok=True)
            (variants / (it["fid"] + ".c.variants")).write_text(parsed, encoding="utf-8")
            meta_file.write_text(json.dumps(dict(model_requested=args.model, effort=args.effort,
                cli_version=version, seconds=round(time.monotonic()-started, 2), requested_at=stamp(),
                prompt_sha256=sha(prompt), reply_sha256=sha(raw), galapagos_split_count=count,
                galapagos_split_problem=problem, usage=completed[-1].get("usage"), flags=cmd[1:],
                resolved_model_note="Requested id recorded; see stderr header for server-resolved id"), indent=2))
            print(f"Saved reply; original splitter finds {count}/10 variants", flush=True)


if __name__ == "__main__":
    main()
