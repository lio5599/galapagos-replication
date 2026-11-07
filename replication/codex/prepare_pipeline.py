"""Create a separate Linux validation workspace for a generated run.

Preserves original function indices; records scheduling/selection patches.
Never changes the partner's checked-in outputs or generated function bodies.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
from archive_run import archive
from progress import run_stage, write_json, utc


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--run-dir", type=Path, required=True)
    ap.add_argument("--base", type=Path, required=True, help="Linux copy with built tools/submodules")
    ap.add_argument("--jobs", type=int, default=2, choices=range(1, 5))
    ap.add_argument("--execute", action="store_true")
    args = ap.parse_args()
    if os.name == "nt":
        ap.error("Run this inside Ubuntu, after compiler setup")
    base = args.base.resolve()
    run = args.run_dir.resolve()
    manifest = json.loads((run / "generation.json").read_text())
    selection = manifest["selection"]
    if len(run.parts) < 3 or not (base / "scripts/tests/usecase.py").exists():
        ap.error("Invalid run or base directory")
    dest = Path.home() / "galapagos-corey-runs" / run.name
    if dest.exists():
        ap.error(f"Workspace already exists: {dest}. Keep it for diagnosis; use a new run id to rerun.")
    for tool in ("clang", "llvm-dis", "llvm-link", "opt"):
        if not shutil.which(tool):
            ap.error(f"Missing {tool}; source ~/galapagos-env.sh first")
    for binary in (base / "scripts/verifier/alive/build/alive-tv", base / "linker/build/linker"):
        if not binary.is_file():
            ap.error(f"Tool not built: {binary}")
    for project, names in selection.items():
        info = json.loads((base / f"functions/{project}/functions_info.json").read_text())
        if len(names) != len(set(names)) or not names or set(names) - {fn['name'] for fn in info}:
            ap.error(f"Invalid selection for {project}: {names}")
        for i, fn in enumerate(info):
            if fn["name"] in names:
                reply = run / f"variants/{project}/{i}_{fn['name']}.c.variants"
                if not reply.exists():
                    ap.error(f"Generation incomplete: {reply}")
        if not (base / f"use_cases/{project}/.git").exists():
            ap.error(f"Submodule not initialized: {project}")
    dest.mkdir(parents=True)
    scripts = dest / "scripts"
    scripts.mkdir()
    for p in (base / "scripts").iterdir():
        if p.is_file() and p.suffix in (".py", ".sh", ".toml", ".txt"):
            shutil.copy2(p, scripts / p.name)
    for directory in ("usecases", "tests", "verifier"):
        target = scripts / directory
        target.mkdir()
        for p in (base / "scripts" / directory).glob("*.py"):
            shutil.copy2(p, target / p.name)
    (scripts / "verifier/alive").symlink_to(base / "scripts/verifier/alive", target_is_directory=True)
    (dest / "use_cases").symlink_to(base / "use_cases", target_is_directory=True)
    (dest / "linker").symlink_to(base / "linker", target_is_directory=True)
    (dest / "functions").mkdir()
    shutil.copy2(base / "functions/template.c", dest / "functions/template.c")
    # All metadata entries retained, so indices still match partner and original GPT-4o data.
    ids = {}
    for project, names in selection.items():
        target = dest / "functions" / project
        target.mkdir()
        original = base / "functions" / project
        shutil.copy2(original / "functions_info.json", target / "functions_info.json")
        info = json.loads((target / "functions_info.json").read_text())
        ids[project] = [i for i, fn in enumerate(info) if fn["name"] in names]
        for p in original.glob("*.c"):
            shutil.copy2(p, target / p.name)
        variants = target / "variants/c"
        variants.mkdir(parents=True)
        for p in (run / "variants" / project).glob("*.c.variants"):
            shutil.copy2(p, variants / p.name)
    patches = []
    # Selection is outside function code and leaves index/return-type metadata untouched.
    for filename, loop in (("split_variants.py", "    for i, fn in enumerate(info):"),
                           ("template_variants.py", "        for i, v in enumerate(variants):"),
                           ("compile_variants.py", "    for i, v in enumerate(variants):")):
        p = scripts / filename
        text = p.read_text()
        assert loop in text, f"Upstream changed: {filename}"
        indent = loop[:len(loop) - len(loop.lstrip())]
        replacement = loop + "\n" + indent + "    if i not in " + repr(ids) + ".get(project, []):\n" + indent + "        continue"
        p.write_text(text.replace(loop, replacement))
        patches.append(f"{filename}: skip unselected reference indices; preserve original indices")
    p = scripts / "usecases/case.py"
    lines = p.read_text().splitlines()
    lines = ["CLONE_PATH = " + repr(str(dest / "build-copies")) if x.startswith("CLONE_PATH = ") else x for x in lines]
    p.write_text("\n".join(lines) + "\n")
    (dest / "build-copies").mkdir()
    patches.append("case.py: per-run build-copy directory; prevents stale builds across conditions")
    p = scripts / "tests/usecase.py"
    text = p.read_text()
    text = text.replace("    async def compare(original_folder, shadow1, original, variant, n):",
                        "    async def original_compare(original_folder, shadow1, original, variant, n):")
    marker = "    async def main():"
    wrapper = (f"    gate = asyncio.Semaphore({args.jobs})\n"
               "    async def compare(*args):\n"
               "        async with gate:\n"
               "            return await original_compare(*args)\n\n")
    assert marker in text
    text = text.replace(marker, wrapper + marker)
    # Observability only: markers run immediately before the same original checks.
    event_helper = '''    def progress_event(action, variant=None):
        print("GALAPAGOS_PROGRESS " + json.dumps({"project": LIBRARY,
            "function": getattr(variant, "real_name", None),
            "variant": getattr(variant, "version", None), "action": action}), flush=True)

'''
    text = text.replace('    async def original_compare(', event_helper + '    async def original_compare(', 1)
    text = text.replace('            await variant.compile(variant_shadow)',
                        '            progress_event("compile_in_project", variant)\n            await variant.compile(variant_shadow)', 1)
    text = text.replace('                    pass_test = asyncio.create_task(variant.run_tests(variant_shadow))',
                        '                    pass_test = asyncio.create_task(tracked_tests(variant, variant_shadow))', 1)
    text = text.replace('asyncio.create_task(verif.async_verify(', 'asyncio.create_task(tracked_verify(variant, ')
    text = text.replace('        shadow_original = await original_uc.shadow(project_folder, name=f"{LIBRARY}")',
                        '        progress_event("build_reference_project")\n        shadow_original = await original_uc.shadow(project_folder, name=f"{LIBRARY}")', 1)
    tracked = '''    async def tracked_tests(variant, shadow):
        progress_event("test_suite", variant)
        return await variant.run_tests(shadow)

    async def tracked_verify(variant, *args, **kwargs):
        progress_event("equivalence_check", variant)
        return await verif.async_verify(*args, **kwargs)

'''
    text = text.replace(marker, tracked + marker, 1)
    p.write_text(text)
    patches.append('tests/usecase.py: flushed progress events before build/test/verification; same check calls')
    patches.append(f"tests/usecase.py: bound existing variant concurrency to {args.jobs}; checks unchanged")
    # Original helper changes source timestamps; preserve its executable bit.
    for p in scripts.glob("*.sh"):
        p.chmod(p.stat().st_mode | 0o100)
    provenance = dict(selection=selection, original_indices=ids, patches=patches,
                      base=str(base), source_run=str(run), concurrency=args.jobs,
                      source_revision=subprocess.check_output(['git', '-C', str(base), 'rev-parse', 'HEAD'], text=True).strip()
                          if (base / '.git').exists() else 'unversioned test fixture',
                      metadata_sha256={p: hashlib.sha256((dest / 'functions' / p / 'functions_info.json').read_bytes()).hexdigest()
                                       for p in selection},
                      note="No generated body edits; no automatic repair or regeneration")
    (dest / "local_changes.json").write_text(json.dumps(provenance, indent=2))
    (run / "validation-workspace.json").write_text(json.dumps(dict(path=str(dest), **provenance), indent=2))
    print(dest, flush=True)
    if not args.execute:
        return
    logs = run / "logs"
    logs.mkdir(exist_ok=True)
    steps = []
    for project in selection:
        for script in ("split_variants.py", "template_variants.py", "compile_variants.py"):
            steps.append((project + "-" + script[:-3], [sys.executable, script, "c", project]))
        steps.append((project + "-usecase", [sys.executable, "-m", "tests.usecase", project, "c"]))
    status = []
    for name, cmd in steps:
        print(name, flush=True)
        rc = run_stage(cmd, scripts, logs / (name + ".log"), run, name,
                       expected=sum(len(v) for v in selection.values()) * 10)
        status.append(dict(step=name, command=cmd, exit_code=rc))
        (run / "validation-steps.json").write_text(json.dumps(status, indent=2))
        if rc:
            archive(dest, run, selection, complete=False)
            print(f"Stage failed ({rc}); inspect {logs}. Stopping to avoid misleading partial totals.")
            raise SystemExit(rc)
    # Archive by copying; keep build workspace for reproducibility/debugging.
    for project in selection:
        isolation = run / "isolation" / project
        isolation.mkdir(parents=True, exist_ok=True)
        for p in (dest / "functions" / project / "variants/c").glob("*.bc"):
            shutil.copy2(p, isolation / p.name)
    for project in selection:
        src = scripts / "out" / project
        if src.exists():
            shutil.copytree(src, run / "results" / project, dirs_exist_ok=True)
    saved = archive(dest, run, selection, complete=True)
    write_json(run / 'progress.json', dict(state='completed', stage='archived; ready for review',
        heartbeat_at=utc(), expected_variants=sum(len(v) for v in selection.values()) * 10,
        result_records=len(list((run / 'results').glob('*/c/*/*.result.json'))), archived_files=saved))
    print("Validation stages completed and archived; use summarize_run.py for per-function evidence.")


if __name__ == "__main__":
    main()
