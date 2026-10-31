#!/usr/bin/env python3
"""
Generate function variants with Claude Code on your Claude subscription, and
write them exactly where, and in exactly the form, Galapagos' own
scripts/generate_variants.py wrote them. Everything after this step is the
unchanged Galapagos pipeline (split_variants.py, template_variants.py,
compile_variants.py, tests.usecase, validation_table.py).

  python3 generate_variants_claude.py --condition baseline --run baseline-r1 --model opus --effort medium

For every C function in functions/<project>/functions_info.json it:
  1. builds the prompt from prompts/<condition>.txt and functions/<project>/<i>_<name>.c
  2. sends it in one fresh `claude -p` run (no tools, one turn, nothing saved)
  3. applies Galapagos' parse_response() to the reply (same regex, copied verbatim)
  4. writes functions/<project>/variants/c/<i>_<name>.c.variants   <- what Galapagos reads next

It also keeps a record of everything it sent and received (not read by Galapagos):
  runs/<run>/prompts/<project>/<i>_<name>.txt       exact prompt
  runs/<run>/replies/<project>/<i>_<name>.txt       Claude's raw reply
  runs/<run>/replies/<project>/<i>_<name>.meta.json model, tokens, time, split check
  runs/<run>/generation.json                        exact settings

Safe to stop (Ctrl+C) and re-run: functions that already have a reply in this
run are skipped. Waits and retries when your plan's usage limit is reached.
Refuses to run if Claude Code would bill an API key or a cloud provider, and
stops if a reply comes from a different model than the one you asked for.
"""
import argparse
import datetime as dt
import hashlib
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
import time

HERE = os.path.dirname(os.path.abspath(__file__))
PROJECTS = ["alsa-lib", "ffmpeg", "libgcrypt", "liboqs", "libsodium", "openssl"]
CONDITIONS = ["baseline", "context", "cot", "context_cot"]
N_VARIANTS = 10            # Galapagos config.toml: n_variants = 10
SYSTEM_PROMPT = "You are a helpful assistant."
# Environment variables that make Claude Code bill an API key or a cloud provider, or send
# requests somewhere other than Anthropic. Removed from every run this script starts.
BILLING_VARS = ("ANTHROPIC_API_KEY", "ANTHROPIC_AUTH_TOKEN", "ANTHROPIC_BASE_URL",
                "CLAUDE_CODE_USE_BEDROCK", "CLAUDE_CODE_USE_VERTEX", "CLAUDE_CODE_USE_FOUNDRY")
SUBSCRIPTION_AUTH = ("claude.ai", "oauth_token")


# ---------------------------------------------------------------------------
# Copied verbatim from Galapagos scripts/generate_variants.py (parse_response),
# applied to the reply text instead of resp.choices[0].message.content.
# ---------------------------------------------------------------------------
def parse_response(text):
    parsed = re.sub(r'```[CcGg][CcOo]?[Pp]?[Pp]?', '', text).replace('\\"', '"').replace('```', '')
    return parsed


def galapagos_split_check(data, ret):
    """Read-only replay of Galapagos scripts/split_variants.py for one C function.

    Returns (number_of_variants, problem). split_variants.py itself is what
    Galapagos runs later; this only warns early when it would not find exactly
    10 variants (template_variants.py then stops on the missing files) or
    would crash.
    """
    start = data.find(ret)
    it = 0
    while start != -1:
        count = 1
        end = data.find('{', start)
        if end == -1:
            return it, "return type found but no '{' after it (split_variants.py would misbehave)"
        while count > 0:
            end += 1
            if end >= len(data):
                return it, "unbalanced braces (split_variants.py would crash with IndexError)"
            if data[end] == '{':
                count += 1
            if data[end] == '}':
                count -= 1
        start = data.find(ret, end)
        it += 1
        if it > 20:
            return it, "more than 20 matches (split_variants.py calls exit(-1))"
    return it, None


def now():
    return dt.datetime.now(dt.timezone.utc).isoformat()


def default_galapagos():
    if os.environ.get("GALAPAGOS"):
        return os.environ["GALAPAGOS"]
    for cand in (os.path.join(HERE, "..", ".."), os.path.join(HERE, "..")):
        if os.path.isdir(os.path.join(cand, "functions")):
            return os.path.abspath(cand)
    return os.path.expanduser("~/galapagos-replication")


def clean_env():
    env = dict(os.environ)
    for v in BILLING_VARS:
        env.pop(v, None)
    env["CLAUDE_CODE_DISABLE_TERMINAL_TITLE"] = "1"
    return env


def subscription_auth(exe, env):
    """Stop unless Claude Code is signed in with a Claude subscription (not an API key,
    an API key helper, or a cloud provider). Called at start and before every prompt."""
    st = subprocess.run([exe, "auth", "status"], capture_output=True, text=True, env=env)
    try:
        status = json.loads(st.stdout)
    except json.JSONDecodeError:
        status = {}
    method = status.get("authMethod", "")
    if not status.get("loggedIn") or method not in SUBSCRIPTION_AUTH:
        sys.exit(f"\nClaude Code is signed in with '{method or 'nothing'}', not your Claude subscription; "
                 "stopping before sending anything. Run `claude auth logout`, then `claude` and choose "
                 "your Claude account (Pro/Max). Replies saved so far are kept.")
    return method


def check_claude(env):
    exe = shutil.which("claude")
    if not exe:
        sys.exit("Claude Code isn't installed (no `claude` on PATH). See README.md, step 1.")
    version = subprocess.run([exe, "--version"], capture_output=True, text=True, env=env).stdout.strip()
    return exe, version, subscription_auth(exe, env)


def build_cmd(exe, args, prompt):
    cmd = [exe, "-p", prompt,
           "--system-prompt", SYSTEM_PROMPT,
           "--tools", "", "--disallowedTools", "mcp__*", "--strict-mcp-config",
           "--safe-mode", "--no-session-persistence", "--max-turns", "1",
           "--permission-prompts", "none",
           "--model", args.model, "--output-format", "json"]
    if args.effort:
        cmd += ["--effort", args.effort]
    return cmd


def model_ok(requested, model_usage):
    """True if the requested model produced the reply."""
    req = requested.lower()
    for name, u in (model_usage or {}).items():
        out_tokens = (u or {}).get("outputTokens", 0) or 0
        if out_tokens > 0 and (req == name.lower() or req in name.lower()):
            return True
    return False


def is_limit(out):
    text = str(out.get("result", "")).lower()
    return (out.get("api_error_status") == 429 or "usage limit" in text or "hit your limit" in text
            or "rate limit" in text or "rate_limit" in text)


def ask_claude(exe, args, prompt, env, workdir):
    """Returns (reply, meta, status); status is ok / limit / auth / wrong_model / error."""
    t0 = time.time()
    try:
        p = subprocess.run(build_cmd(exe, args, prompt), capture_output=True, text=True,
                           env=env, cwd=workdir, timeout=args.timeout)
    except subprocess.TimeoutExpired:
        return None, {"error": f"timed out after {args.timeout}s"}, "error"
    try:
        out = json.loads(p.stdout)
    except json.JSONDecodeError:
        return None, {"error": "no JSON from claude", "stdout": p.stdout[-2000:],
                      "stderr": p.stderr[-2000:], "exit": p.returncode}, "error"
    usage = out.get("usage") or {}
    meta = {
        "requested_at": now(),
        "seconds": round(time.time() - t0, 1),
        "model_usage": out.get("modelUsage"),
        "input_tokens": usage.get("input_tokens"),
        "output_tokens": usage.get("output_tokens"),
        "num_turns": out.get("num_turns"),
        "stop_reason": out.get("stop_reason"),
        "session_id": out.get("session_id"),
        # Claude Code's estimate at API list prices. Not billed on a subscription login.
        "api_list_price_estimate_usd": out.get("total_cost_usd"),
    }
    if out.get("is_error") or out.get("subtype") != "success":
        meta["error"] = str(out.get("result", ""))[:2000]
        meta["api_error_status"] = out.get("api_error_status")
        if is_limit(out):
            return None, meta, "limit"
        low = meta["error"].lower()
        if "login" in low or "auth" in low or out.get("api_error_status") in (401, 403):
            return None, meta, "auth"
        return None, meta, "error"
    if not model_ok(args.model, out.get("modelUsage")):
        meta["error"] = f"reply not produced by '{args.model}': {list((out.get('modelUsage') or {}).keys())}"
        return None, meta, "wrong_model"
    return str(out.get("result", "")), meta, "ok"


def load_template(condition):
    with open(os.path.join(HERE, "prompts", f"{condition}.txt")) as f:
        return f.read().rstrip("\n")


def build_prompt(template, code):
    # Same assembly as generate_variants.py: '\n'.join([intro, code, instructions, ...])
    return template.replace("<NUMBER>", str(N_VARIANTS)).replace("<REFERENCE FUNCTION>", code)


def work_items(g, projects, functions):
    items = []
    for project in projects:
        with open(os.path.join(g, "functions", project, "functions_info.json")) as f:
            info = json.load(f)
        for i, fn in enumerate(info):
            if functions and fn["name"] not in functions:
                continue
            fid = f"{i}_{fn['name']}"
            src = os.path.join(g, "functions", project, f"{fid}.c")
            if not os.path.exists(src):
                sys.exit(f"Missing reference function {src}")
            items.append({"project": project, "fid": fid, "fn": fn, "src": src})
    return items


def variants_path(g, project, fid):
    return os.path.join(g, "functions", project, "variants", "c", f"{fid}.c.variants")


def check_clean(g, projects, run_dir):
    """Refuse to mix runs: Galapagos' variant and result folders must hold only this run's files."""
    problems = []
    for project in projects:
        vdir = os.path.join(g, "functions", project, "variants", "c")
        if os.path.isdir(vdir):
            for name in os.listdir(vdir):
                fid = name[:-len(".c.variants")] if name.endswith(".c.variants") else None
                reply = fid and os.path.join(run_dir, "replies", project, f"{fid}.txt")
                if not (reply and os.path.exists(reply)):
                    problems.append(os.path.join(vdir, name))
        odir = os.path.join(g, "scripts", "out", project, "c")
        if os.path.isdir(odir) and os.listdir(odir):
            problems.append(odir)
    if problems:
        sys.exit("Galapagos' folders still hold files from another run:\n  "
                 + "\n  ".join(problems[:10]) + ("\n  ..." if len(problems) > 10 else "")
                 + "\nArchive that run first (./archive_run.sh <that-run>), then re-run this command.")


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--condition", required=True, choices=CONDITIONS)
    ap.add_argument("--run", required=True, help="name for this run, e.g. baseline-r1")
    ap.add_argument("--model", required=True, help="e.g. opus, sonnet or a full model name; same for the whole study")
    ap.add_argument("--effort", choices=["low", "medium", "high", "xhigh", "max"],
                    help="thinking effort; set it and keep it the same for every run")
    ap.add_argument("--projects", nargs="+", default=PROJECTS, choices=PROJECTS)
    ap.add_argument("--functions", nargs="*", help="only these function names")
    ap.add_argument("--galapagos", default=default_galapagos(), help="Galapagos repo (default: two folders up)")
    ap.add_argument("--max-attempts", type=int, default=1,
                    help="ask again (up to this many times in total) when Galapagos' splitter would not find "
                         "exactly 10 variants; every attempt is kept. Default 1 = never ask again")
    ap.add_argument("--sleep", type=float, default=10, help="seconds between prompts (default 10)")
    ap.add_argument("--limit-wait", type=float, default=20, help="minutes to wait at the usage limit (default 20)")
    ap.add_argument("--max-wait-hours", type=float, default=8, help="stop after waiting this long in total")
    ap.add_argument("--timeout", type=int, default=900, help="seconds allowed per prompt (default 900)")
    ap.add_argument("--dry-run", action="store_true", help="write the prompts only; send nothing")
    args = ap.parse_args()

    g = os.path.abspath(args.galapagos)
    if not os.path.isdir(os.path.join(g, "functions")):
        sys.exit(f"{g} doesn't look like the Galapagos repo (no functions/ folder). Use --galapagos.")
    run_dir = os.path.join(HERE, "runs", args.run)
    if os.path.isdir(os.path.join(run_dir, "galapagos")):
        sys.exit(f"Run '{args.run}' is already archived (runs/{args.run}/galapagos). Pick a new --run name.")
    template = load_template(args.condition)
    items = work_items(g, args.projects, args.functions)

    # Write every prompt first (also the record of exactly what is sent).
    for it in items:
        with open(it["src"]) as f:
            it["prompt"] = build_prompt(template, f.read())
        p = os.path.join(run_dir, "prompts", it["project"], f"{it['fid']}.txt")
        os.makedirs(os.path.dirname(p), exist_ok=True)
        with open(p, "w") as f:
            f.write(it["prompt"])
    print(f"{len(items)} prompts written to {os.path.join(run_dir, 'prompts')}")
    if args.dry_run:
        return

    check_clean(g, args.projects, run_dir)
    env = clean_env()
    exe, version, method = check_claude(env)

    gen = {"tool": "Claude Code non-interactive mode (claude -p)", "claude_code_version": version,
           "auth_method": method, "condition": args.condition, "model_requested": args.model,
           "effort": args.effort, "system_prompt": SYSTEM_PROMPT,
           "prompt_template_sha256": hashlib.sha256(template.encode()).hexdigest(),
           "flags": build_cmd("claude", args, "<prompt>")[1:], "n_variants": N_VARIANTS,
           "max_attempts": args.max_attempts, "galapagos": g, "started_at": now()}
    gen_path = os.path.join(run_dir, "generation.json")
    if os.path.exists(gen_path):
        with open(gen_path) as f:
            old = json.load(f)
        for k in ("condition", "model_requested", "effort", "system_prompt", "prompt_template_sha256",
                  "max_attempts"):
            if old.get(k) != gen.get(k):
                sys.exit(f"Run '{args.run}' was started with {k}={old.get(k)!r}, now {gen.get(k)!r}. "
                         "Use the same settings within a run, or pick a new --run name.")
    else:
        with open(gen_path, "w") as f:
            json.dump(gen, f, indent=2)
    print(f"Claude Code {version}, signed in via {method}; model {args.model}, "
          f"effort {args.effort or 'default'}, condition {args.condition}")

    workdir = tempfile.mkdtemp(prefix="galapagos-claude-")
    waited, fails, done, warnings = 0.0, 0, 0, []
    try:
        for n, it in enumerate(items, 1):
            rdir = os.path.join(run_dir, "replies", it["project"])
            reply_path = os.path.join(rdir, f"{it['fid']}.txt")
            vpath = variants_path(g, it["project"], it["fid"])
            if os.path.exists(reply_path) and os.path.getsize(reply_path) > 0:
                # Already answered in this run: (re)write the Galapagos file from the saved reply.
                with open(reply_path) as f:
                    parsed = parse_response(f.read())
                os.makedirs(os.path.dirname(vpath), exist_ok=True)
                with open(vpath, "w") as f:
                    f.write(parsed)
                continue
            attempt = 1
            while True:
                label = f"[{n}/{len(items)}] {it['project']}/{it['fid']}" + (f" (attempt {attempt})" if attempt > 1 else "")
                subscription_auth(exe, env)  # re-checked before every prompt, in case the sign-in changed
                print(f"{label} ... ", end="", flush=True)
                reply, meta, status = ask_claude(exe, args, it["prompt"], env, workdir)
                if status == "limit":
                    if waited / 3600 >= args.max_wait_hours:
                        sys.exit("\nUsage limit still reached. Re-run the same command later to continue.")
                    print(f"usage limit reached; waiting {args.limit_wait:.0f} min (Ctrl+C to stop, re-run later)")
                    time.sleep(args.limit_wait * 60)
                    waited += args.limit_wait * 60
                    continue
                if status == "auth":
                    sys.exit(f"\nClaude Code lost its sign-in. Run `claude`, sign in, then re-run.\n{meta.get('error', '')}")
                if status == "wrong_model":
                    sys.exit(f"\n{meta['error']}\nStopping so the study doesn't mix models. Nothing was saved for "
                             "this function. Check that your plan includes this model.")
                if status == "error":
                    print("failed: " + str(meta.get("error", ""))[:300].replace("\n", " "))
                    fails += 1
                    if fails >= 3:
                        sys.exit("Three failures in a row; stopping. Re-run to continue.")
                    time.sleep(30)
                    continue
                fails = 0
                parsed = parse_response(reply)
                n_split, problem = galapagos_split_check(parsed, it["fn"]["return"])
                meta.update({"attempt": attempt, "model_requested": args.model, "effort": args.effort,
                             "claude_code_version": version, "galapagos_split_count": n_split,
                             "galapagos_split_problem": problem})
                ok_split = n_split == N_VARIANTS and problem is None
                if not ok_split and attempt < args.max_attempts:
                    # Keep the rejected attempt for the record, then ask again.
                    os.makedirs(rdir, exist_ok=True)
                    with open(os.path.join(rdir, f"{it['fid']}.attempt{attempt}.txt"), "w") as f:
                        f.write(reply)
                    with open(os.path.join(rdir, f"{it['fid']}.attempt{attempt}.meta.json"), "w") as f:
                        json.dump(meta, f, indent=2)
                    print(f"splitter would find {n_split} variants{'; ' + problem if problem else ''}; asking again")
                    attempt += 1
                    time.sleep(args.sleep)
                    continue
                os.makedirs(rdir, exist_ok=True)
                with open(reply_path, "w") as f:
                    f.write(reply)
                with open(reply_path[:-4] + ".meta.json", "w") as f:
                    json.dump(meta, f, indent=2)
                os.makedirs(os.path.dirname(vpath), exist_ok=True)
                with open(vpath, "w") as f:
                    f.write(parsed)
                note = "" if ok_split else f"  WARNING: Galapagos' splitter would find {n_split}" + \
                    (f" ({problem})" if problem else "")
                if not ok_split:
                    warnings.append(f"{it['project']}/{it['fid']}: {n_split} variants" + (f", {problem}" if problem else ""))
                print(f"ok, {meta.get('output_tokens')} output tokens, {meta['seconds']}s{note}")
                done += 1
                break
            if n < len(items):
                time.sleep(args.sleep)
    except KeyboardInterrupt:
        print("\nStopped. Re-run the same command to continue where it left off.")
    finally:
        shutil.rmtree(workdir, ignore_errors=True)

    left = [it for it in items if not os.path.exists(os.path.join(run_dir, "replies", it["project"], f"{it['fid']}.txt"))]
    print(f"\nDone: {done} new replies, {len(left)} still to do.")
    if warnings:
        print("Replies where Galapagos' splitter won't find exactly 10 variants "
              "(template_variants.py stops at the first missing file):")
        for w in warnings:
            print("  " + w)
    if left:
        sys.exit(2)  # non-zero so a study loop doesn't go on to Galapagos with missing replies
    print(f"Next: ./run_galapagos.sh {args.run}")


if __name__ == "__main__":
    main()
