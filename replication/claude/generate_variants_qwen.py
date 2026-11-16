#!/usr/bin/env python3
"""
Generate function variants with Qwen3.6-27B (or any model) served through an
OpenAI-compatible endpoint such as vLLM, and write them exactly where, and in
exactly the form, Galapagos' own scripts/generate_variants.py wrote them.
Everything after this step is the unchanged Galapagos pipeline
(split_variants.py, template_variants.py, compile_variants.py, tests.usecase,
validation_table.py), run with ./run_galapagos.sh as before.

  python3 generate_variants_qwen.py --condition baseline --run qwen-baseline-r1

It shares the prompt building, Galapagos' parse_response(), the split check and
the "don't mix runs" check with generate_variants_claude.py (imported from it),
so both models get identical prompts and identical handling of their replies.
The only difference is how the prompt is sent: one chat-completions request
per function (system prompt "You are a helpful assistant.", then the prompt),
instead of `claude -p`.

For every C function in functions/<project>/functions_info.json it:
  1. builds the prompt from prompts/<condition>.txt and functions/<project>/<i>_<name>.c
  2. sends it to the model in one request (no conversation history)
  3. applies Galapagos' parse_response() to the reply's answer text
  4. writes functions/<project>/variants/c/<i>_<name>.c.variants   <- what Galapagos reads next

Record kept (not read by Galapagos), same layout as the Claude runs:
  runs/<run>/prompts/<project>/<i>_<name>.txt            exact prompt
  runs/<run>/replies/<project>/<i>_<name>.txt            the model's answer text
  runs/<run>/replies/<project>/<i>_<name>.reasoning.txt  its thinking, only with --thinking on
  runs/<run>/replies/<project>/<i>_<name>.meta.json      model, tokens, time, finish reason, split check
  runs/<run>/generation.json                             server, model, sampling settings

Thinking is off by default: the CoT conditions then test the reasoning the prompt
asks for (the // comments) on its own. With --thinking on, the model's thinking is
kept out of the reply Galapagos sees (vLLM's --reasoning-parser qwen3 separates it)
and saved next to it.

Sampling defaults follow Qwen's recommendations for Qwen3.6, except presence_penalty,
which is 0 instead of 1.5: each reply repeats the same function signature ten times,
and a presence penalty pushes the model to vary repeated tokens, i.e. the signature
Galapagos needs unchanged. Whatever you choose, keep it the same for every run.

Safe to stop (Ctrl+C) and re-run: functions that already have a reply in this run
are skipped. The server is free to use: QWEN_API_KEY, if set, is only the password
you gave your own vLLM server (vllm serve --api-key), not a paid account.
"""
import argparse
import glob
import hashlib
import json
import os
import sys
import time
import urllib.error
import urllib.request

from generate_variants_claude import (CONDITIONS, HERE, N_VARIANTS, PROJECTS, SYSTEM_PROMPT, build_prompt,
                                      check_clean, default_galapagos, galapagos_split_check, load_template, now,
                                      parse_response, variants_path, work_items)

DEFAULT_MODEL = "Qwen/Qwen3.6-27B"
# Qwen3.6 model card: thinking (precise coding) and non-thinking (instruct) settings;
# presence_penalty 0 in both (see the docstring).
SAMPLING = {
    "off": {"temperature": 0.7, "top_p": 0.8, "top_k": 20, "min_p": 0.0,
            "presence_penalty": 0.0, "repetition_penalty": 1.0, "max_tokens": 16384},
    "on": {"temperature": 0.6, "top_p": 0.95, "top_k": 20, "min_p": 0.0,
           "presence_penalty": 0.0, "repetition_penalty": 1.0, "max_tokens": 32768},
}
SAMPLING_KEYS = ("temperature", "top_p", "top_k", "min_p", "presence_penalty", "repetition_penalty", "max_tokens")


class ServerError(Exception):
    pass


def check_clean_strict(g, projects, run_dir):
    """check_clean() from the Claude generator, plus: every .variants file already in Galapagos'
    folders must be exactly the one this run's saved reply produces. With --replies-only, a later
    run can hold replies for the same functions while another run is still in Galapagos' folders;
    file names alone can't tell them apart, so compare the contents."""
    check_clean(g, projects, run_dir)
    problems = []
    for project in projects:
        vdir = os.path.join(g, "functions", project, "variants", "c")
        if not os.path.isdir(vdir):
            continue
        for name in os.listdir(vdir):
            if not name.endswith(".c.variants"):
                continue
            with open(os.path.join(run_dir, "replies", project, name[:-len(".c.variants")] + ".txt")) as f:
                expected = parse_response(f.read())
            with open(os.path.join(vdir, name)) as f:
                if f.read() != expected:
                    problems.append(os.path.join(vdir, name))
    if problems:
        sys.exit("Galapagos' folders hold .variants files from another run:\n  " + "\n  ".join(problems[:10])
                 + "\nArchive that run first (./archive_run.sh <that-run>), then re-run this command.")


def http_json(url, key, body=None, timeout=60):
    data = None if body is None else json.dumps(body).encode()
    req = urllib.request.Request(url, data=data, method="GET" if body is None else "POST")
    req.add_header("Content-Type", "application/json")
    if key:
        req.add_header("Authorization", f"Bearer {key}")
    try:
        with urllib.request.urlopen(req, timeout=timeout) as resp:
            return json.loads(resp.read().decode())
    except urllib.error.HTTPError as e:
        detail = e.read().decode(errors="replace")[:500]
        if e.code == 401:
            sys.exit(f"\nThe server refused the key (HTTP 401). Set QWEN_API_KEY to the same value you gave "
                     f"`vllm serve --api-key`.\n{detail}")
        raise ServerError(f"HTTP {e.code}: {detail}")
    except (urllib.error.URLError, TimeoutError, ConnectionError, OSError) as e:
        raise ServerError(f"can't reach {url}: {e}. Is the vLLM job running and the SSH tunnel open?")


def check_server(base_url, key, model):
    try:
        models = [m.get("id") for m in http_json(f"{base_url}/models", key).get("data", [])]
    except ServerError as e:
        sys.exit(str(e))
    if model not in models:
        sys.exit(f"The server at {base_url} serves {models}, not {model!r}. Use --model with one of those.")
    version = None
    try:
        version = http_json(base_url.rsplit("/v1", 1)[0] + "/version", key, timeout=10).get("version")
    except (ServerError, SystemExit, ValueError):
        pass
    return models, version


def ask_model(args, sampling, prompt, key):
    body = {"model": args.model,
            "messages": [{"role": "system", "content": SYSTEM_PROMPT}, {"role": "user", "content": prompt}],
            **sampling,
            "chat_template_kwargs": {"enable_thinking": args.thinking == "on"}}
    if args.seed is not None:
        body["seed"] = args.seed
    t0 = time.time()
    out = http_json(f"{args.base_url}/chat/completions", key, body, timeout=args.timeout)
    choice = (out.get("choices") or [{}])[0]
    msg = choice.get("message") or {}
    content = msg.get("content") or ""
    reasoning = msg.get("reasoning_content") or msg.get("reasoning") or ""
    stripped = False
    if "</think>" in content:
        # Thinking that the server didn't separate (started without --reasoning-parser qwen3).
        head, _, content = content.rpartition("</think>")
        reasoning = (reasoning + "\n" + head.replace("<think>", "")).strip()
        stripped = True
    usage = out.get("usage") or {}
    meta = {"model": out.get("model"), "finish_reason": choice.get("finish_reason"),
            "input_tokens": usage.get("prompt_tokens"), "output_tokens": usage.get("completion_tokens"),
            "seconds": round(time.time() - t0, 1), "finished_at": now(), "request_id": out.get("id"),
            "thinking": args.thinking, "reasoning_chars": len(reasoning), "think_tags_stripped": stripped,
            # same shape as the Claude runs' meta, so the same checks work on both
            "model_usage": {out.get("model") or args.model: {"inputTokens": usage.get("prompt_tokens"),
                                                             "outputTokens": usage.get("completion_tokens")}}}
    return content.strip("\n"), reasoning, meta


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--condition", required=True, choices=CONDITIONS)
    ap.add_argument("--run", required=True, help="name for this run, e.g. qwen-baseline-r1")
    ap.add_argument("--model", default=DEFAULT_MODEL, help=f"model name the server serves (default {DEFAULT_MODEL})")
    ap.add_argument("--base-url", default=os.environ.get("QWEN_BASE_URL", "http://localhost:8000/v1"),
                    help="OpenAI-compatible endpoint (default http://localhost:8000/v1, i.e. the SSH tunnel)")
    ap.add_argument("--thinking", choices=["off", "on"], default="off",
                    help="Qwen's built-in thinking mode (default off); same for every run")
    for k in SAMPLING_KEYS:
        ap.add_argument("--" + k.replace("_", "-"), type=int if k in ("top_k", "max_tokens") else float,
                        help=f"default: {SAMPLING['off'][k]} with thinking off, {SAMPLING['on'][k]} with it on")
    ap.add_argument("--seed", type=int, help="per-request sampling seed (default: none)")
    ap.add_argument("--projects", nargs="+", default=PROJECTS, choices=PROJECTS)
    ap.add_argument("--functions", nargs="*", help="only these function names")
    ap.add_argument("--galapagos", default=default_galapagos(), help="Galapagos repo (default: two folders up)")
    ap.add_argument("--max-attempts", type=int, default=1,
                    help="ask again (up to this many times in total) when Galapagos' splitter would not find "
                         "exactly 10 variants; every attempt is kept. Default 1 = never ask again")
    ap.add_argument("--sleep", type=float, default=2, help="seconds between prompts (default 2)")
    ap.add_argument("--timeout", type=int, default=1800, help="seconds allowed per prompt (default 1800)")
    ap.add_argument("--dry-run", action="store_true", help="write the prompts only; send nothing")
    ap.add_argument("--retry-unsplit", action="store_true",
                    help="with a higher --max-attempts than the run used so far: ask again only for saved "
                         "replies that won't split into exactly 10 variants (each original is kept as "
                         "<function>.attempt1.*). Same result as having started the run with that --max-attempts.")
    ap.add_argument("--replies-only", action="store_true",
                    help="save the replies under runs/<run>/ but don't write Galapagos' .variants files yet, so "
                         "all four conditions can be generated in one server session. Later, run the same "
                         "command without this flag to write them; that step needs no server.")
    args = ap.parse_args()
    args.base_url = args.base_url.rstrip("/")
    sampling = {k: (getattr(args, k) if getattr(args, k) is not None else SAMPLING[args.thinking][k])
                for k in SAMPLING_KEYS}

    g = os.path.abspath(args.galapagos)
    if not os.path.isdir(os.path.join(g, "functions")):
        sys.exit(f"{g} doesn't look like the Galapagos repo (no functions/ folder). Use --galapagos.")
    run_dir = os.path.join(HERE, "runs", args.run)
    if os.path.isdir(os.path.join(run_dir, "galapagos")):
        sys.exit(f"Run '{args.run}' is already archived (runs/{args.run}/galapagos). Pick a new --run name.")
    template = load_template(args.condition)
    items = work_items(g, args.projects, args.functions)

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

    def has_reply(it):
        p = os.path.join(run_dir, "replies", it["project"], f"{it['fid']}.txt")
        return os.path.exists(p) and os.path.getsize(p) > 0

    def earlier_attempts(it):
        rdir = os.path.join(run_dir, "replies", it["project"])
        return len(glob.glob(os.path.join(rdir, f"{glob.escape(it['fid'])}.attempt*.meta.json")))

    # --retry-unsplit: a saved reply that won't split into exactly 10 variants, and that hasn't used
    # all --max-attempts yet, becomes an earlier attempt (renamed, never deleted) and is asked again.
    # This is the same procedure as a run started with that --max-attempts: the first attempt is kept
    # when it splits into 10, otherwise the model is asked again.
    retry = []
    if args.retry_unsplit:
        for it in items:
            meta_p = os.path.join(run_dir, "replies", it["project"], f"{it['fid']}.meta.json")
            if not (has_reply(it) and os.path.exists(meta_p)):
                continue
            with open(meta_p) as f:
                m = json.load(f)
            if m.get("galapagos_split_count") == N_VARIANTS and m.get("galapagos_split_problem") is None:
                continue
            k = m.get("attempt") or earlier_attempts(it) + 1
            if k < args.max_attempts:
                retry.append((it, k))
    retry_ids = {id(it) for it, _ in retry}
    todo = [it for it in items if not has_reply(it) or id(it) in retry_ids]
    if not args.replies_only:
        check_clean_strict(g, args.projects, run_dir)
    key = os.environ.get("QWEN_API_KEY", "")
    # The server is only needed when something is left to ask.
    served, version = check_server(args.base_url, key, args.model) if todo else (None, None)

    gen = {"tool": "OpenAI-compatible chat completions (vLLM)", "base_url": args.base_url,
           "server_version": version, "served_models": served, "condition": args.condition,
           "model_requested": args.model, "thinking": args.thinking, "sampling": sampling, "seed": args.seed,
           "system_prompt": SYSTEM_PROMPT, "prompt_template_sha256": hashlib.sha256(template.encode()).hexdigest(),
           "n_variants": N_VARIANTS, "max_attempts": args.max_attempts, "galapagos": g, "started_at": now()}
    gen_path = os.path.join(run_dir, "generation.json")
    if os.path.exists(gen_path):
        with open(gen_path) as f:
            old = json.load(f)
        for k in ("condition", "model_requested", "thinking", "sampling", "seed", "system_prompt",
                  "prompt_template_sha256"):
            if old.get(k) != gen.get(k):
                sys.exit(f"Run '{args.run}' was started with {k}={old.get(k)!r}, now {gen.get(k)!r}. "
                         "Use the same settings within a run, or pick a new --run name.")
        if old.get("max_attempts") != args.max_attempts:
            if not (args.retry_unsplit and args.max_attempts > (old.get("max_attempts") or 1)):
                sys.exit(f"Run '{args.run}' was started with max_attempts={old.get('max_attempts')!r}, now "
                         f"{args.max_attempts!r}. Use the same value (raising it is only allowed together with "
                         "--retry-unsplit), or pick a new --run name.")
            old.setdefault("max_attempts_history", []).append(
                {"from": old.get("max_attempts"), "to": args.max_attempts, "at": now(), "server_version": version})
            old["max_attempts"] = args.max_attempts
            with open(gen_path, "w") as f:
                json.dump(old, f, indent=2)
            print(f"max_attempts raised from {old['max_attempts_history'][-1]['from']} to {args.max_attempts} "
                  "(recorded in generation.json)")
    else:
        with open(gen_path, "w") as f:
            json.dump(gen, f, indent=2)
    for it, k in retry:
        stem = os.path.join(run_dir, "replies", it["project"], it["fid"])
        for suffix in (".txt", ".meta.json", ".reasoning.txt"):
            if os.path.exists(stem + suffix):
                os.rename(stem + suffix, f"{stem}.attempt{k}{suffix}")
    if retry:
        print(f"Asking again for {len(retry)} saved replies that won't split into {N_VARIANTS} variants "
              "(each kept as an earlier attempt): " + ", ".join(f"{it['project']}/{it['fid']}" for it, _ in retry))
    if todo:
        print(f"Server {args.base_url} (vLLM {version or 'version unknown'}); model {args.model}, "
              f"thinking {args.thinking}, condition {args.condition}")
        print("Sampling: " + ", ".join(f"{k}={v}" for k, v in sampling.items()))
    else:
        print(f"All {len(items)} replies are already saved in runs/{args.run}; no server needed.")

    fails, done, warnings = 0, 0, []
    try:
        for n, it in enumerate(items, 1):
            rdir = os.path.join(run_dir, "replies", it["project"])
            reply_path = os.path.join(rdir, f"{it['fid']}.txt")
            vpath = variants_path(g, it["project"], it["fid"])
            if has_reply(it):
                # Already answered in this run: (re)write the Galapagos file from the saved reply.
                if not args.replies_only:
                    with open(reply_path) as f:
                        parsed = parse_response(f.read())
                    os.makedirs(os.path.dirname(vpath), exist_ok=True)
                    with open(vpath, "w") as f:
                        f.write(parsed)
                continue
            attempt = earlier_attempts(it) + 1   # never overwrite an earlier attempt's files
            while True:
                label = f"[{n}/{len(items)}] {it['project']}/{it['fid']}" + (f" (attempt {attempt})" if attempt > 1 else "")
                print(f"{label} ... ", end="", flush=True)
                try:
                    reply, reasoning, meta = ask_model(args, sampling, it["prompt"], key)
                except ServerError as e:
                    print(f"failed: {str(e)[:300]}")
                    fails += 1
                    if fails >= 3:
                        sys.exit("Three failures in a row; stopping. Check the server, then re-run to continue.")
                    time.sleep(30)
                    continue
                if meta["model"] and meta["model"] != args.model:
                    sys.exit(f"\nReply came from {meta['model']!r}, not {args.model!r}. Stopping so the study "
                             "doesn't mix models. Nothing was saved for this function.")
                if not reply.strip():
                    print(f"failed: empty answer (finish_reason={meta['finish_reason']})")
                    fails += 1
                    if fails >= 3:
                        sys.exit("Three failures in a row; stopping. Re-run to continue.")
                    time.sleep(30)
                    continue
                fails = 0
                parsed = parse_response(reply)
                n_split, problem = galapagos_split_check(parsed, it["fn"]["return"])
                meta.update({"attempt": attempt, "model_requested": args.model,
                             "galapagos_split_count": n_split, "galapagos_split_problem": problem})
                ok_split = n_split == N_VARIANTS and problem is None
                os.makedirs(rdir, exist_ok=True)
                if not ok_split and attempt < args.max_attempts:
                    stem = os.path.join(rdir, f"{it['fid']}.attempt{attempt}")
                    with open(stem + ".txt", "w") as f:
                        f.write(reply)
                    if reasoning:
                        with open(stem + ".reasoning.txt", "w") as f:
                            f.write(reasoning)
                    with open(stem + ".meta.json", "w") as f:
                        json.dump(meta, f, indent=2)
                    print(f"splitter would find {n_split} variants{'; ' + problem if problem else ''}; asking again")
                    attempt += 1
                    time.sleep(args.sleep)
                    continue
                with open(reply_path, "w") as f:
                    f.write(reply)
                if reasoning:
                    with open(reply_path[:-4] + ".reasoning.txt", "w") as f:
                        f.write(reasoning)
                with open(reply_path[:-4] + ".meta.json", "w") as f:
                    json.dump(meta, f, indent=2)
                if not args.replies_only:
                    os.makedirs(os.path.dirname(vpath), exist_ok=True)
                    with open(vpath, "w") as f:
                        f.write(parsed)
                notes = []
                if not ok_split:
                    notes.append(f"WARNING: Galapagos' splitter would find {n_split}" + (f" ({problem})" if problem else ""))
                    warnings.append(f"{it['project']}/{it['fid']}: {n_split} variants" + (f", {problem}" if problem else ""))
                if meta["finish_reason"] == "length":
                    notes.append(f"WARNING: cut off at max_tokens={sampling['max_tokens']}")
                    warnings.append(f"{it['project']}/{it['fid']}: reply cut off at max_tokens")
                if meta["think_tags_stripped"]:
                    notes.append("thinking text moved out of the answer (start vLLM with --reasoning-parser qwen3)")
                print(f"ok, {meta.get('output_tokens')} output tokens, {meta['seconds']}s"
                      + ("  " + "; ".join(notes) if notes else ""))
                done += 1
                break
            if n < len(items):
                time.sleep(args.sleep)
    except KeyboardInterrupt:
        print("\nStopped. Re-run the same command to continue where it left off.")

    left = [it for it in items if not has_reply(it)]
    print(f"\nDone: {done} new replies, {len(left)} still to do.")
    if warnings:
        print("Replies to note (template_variants.py stops at the first function with fewer than 10 variants):")
        for w in warnings:
            print("  " + w)
    if left:
        sys.exit(2)
    if args.replies_only:
        print(f"Replies saved in runs/{args.run}; Galapagos' folders untouched. When it's this condition's turn:\n"
              f"  python3 generate_variants_qwen.py --condition {args.condition} --run {args.run}"
              + (f" --max-attempts {args.max_attempts}" if args.max_attempts != 1 else "")
              + f"   (no server needed)\n  ./run_galapagos.sh {args.run}")
    else:
        print(f"Next: ./run_galapagos.sh {args.run}")


if __name__ == "__main__":
    main()
