#!/usr/bin/env python3
"""
Write the prompt for every target function so you can paste it into a Claude
chat by hand. No API calls are made anywhere in this folder.

  python3 make_prompts.py --run runs/claude-chat-baseline-r1 --condition baseline \
      --model "Claude <model name shown in the chat>"

Creates
  runs/<run>/prompts/<project>/<lang>/<i>_<name>.txt     paste this into a NEW chat
  runs/<run>/responses/<project>/<lang>/<i>_<name>.txt   empty; paste the whole reply here
  runs/<run>/run_config.json                             what you used, for the write-up
  runs/<run>/CHECKLIST.txt                               one line per chat to do

Then: python3 ingest_variants.py --run runs/<run>
"""
import argparse
import datetime as dt
import json
import os
import sys

from prompts import CONDITIONS, build_prompt

PROJECTS = ["alsa-lib", "ffmpeg", "libgcrypt", "liboqs", "libsodium", "openssl"]


def default_galapagos():
    """$GALAPAGOS, else the repo this folder sits in, else ~/Galapagos."""
    if os.environ.get("GALAPAGOS"):
        return os.environ["GALAPAGOS"]
    parent = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    if os.path.isdir(os.path.join(parent, "functions")):
        return parent
    return os.path.expanduser("~/Galapagos")
LANG_NAMES = {"c": "C", "go": "Go"}


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--run", required=True)
    ap.add_argument("--galapagos", default=default_galapagos())
    ap.add_argument("--condition", choices=CONDITIONS, default="baseline")
    ap.add_argument("--model", required=True, help="model name exactly as shown in the chat UI")
    ap.add_argument("--langs", nargs="+", choices=["c", "go"], default=["c", "go"])
    ap.add_argument("--projects", nargs="+", default=PROJECTS)
    ap.add_argument("--functions", nargs="*", help="restrict to these function names (pilot)")
    ap.add_argument("--feedback-dir", help="context conditions: <project>/<lang>/<i>_<name>.txt with "
                    "errors from an earlier round, appended to the context notes")
    ap.add_argument("--notes", default="", help="free text for run_config.json (settings used in the chat)")
    args = ap.parse_args()

    run = os.path.abspath(args.run)
    os.makedirs(run, exist_ok=True)
    cfg_path = os.path.join(run, "run_config.json")
    cfg = {"condition": args.condition, "model": args.model, "langs": args.langs,
           "projects": args.projects, "functions": args.functions, "notes": args.notes,
           "generation": "manual, Claude chat UI",
           "created_at": dt.datetime.now(dt.timezone.utc).isoformat()}
    if os.path.exists(cfg_path):
        with open(cfg_path) as f:
            old = json.load(f)
        if (old.get("condition"), old.get("model")) != (args.condition, args.model):
            sys.exit(f"{run} was set up for {old.get('model')!r} / {old.get('condition')!r}; use a new --run.")
    else:
        with open(cfg_path, "w") as f:
            json.dump(cfg, f, indent=2)

    todo = []
    for project in args.projects:
        fdir = os.path.join(args.galapagos, "functions", project)
        with open(os.path.join(fdir, "functions_info.json")) as f:
            info = json.load(f)
        for i, fn in enumerate(info):
            if args.functions and fn["name"] not in args.functions:
                continue
            fid = f"{i}_{fn['name']}"
            with open(os.path.join(fdir, f"{fid}.c")) as f:
                code = f.read()
            for lang in args.langs:
                feedback = None
                if args.feedback_dir:
                    fb = os.path.join(args.feedback_dir, project, lang, f"{fid}.txt")
                    if os.path.exists(fb):
                        with open(fb) as f:
                            feedback = f.read()
                prompt = build_prompt(code, "C", LANG_NAMES[lang], 10, args.condition, feedback)
                pdir = os.path.join(run, "prompts", project, lang)
                rdir = os.path.join(run, "responses", project, lang)
                os.makedirs(pdir, exist_ok=True)
                os.makedirs(rdir, exist_ok=True)
                with open(os.path.join(pdir, f"{fid}.txt"), "w") as f:
                    f.write(prompt)
                rpath = os.path.join(rdir, f"{fid}.txt")
                if not os.path.exists(rpath):
                    open(rpath, "w").close()
                if os.path.getsize(rpath) == 0:
                    todo.append(f"[ ] prompts/{project}/{lang}/{fid}.txt  ->  responses/{project}/{lang}/{fid}.txt")

    with open(os.path.join(run, "CHECKLIST.txt"), "w") as f:
        f.write(f"{args.model} / {args.condition}: one NEW chat per line\n\n" + "\n".join(todo) + "\n")
    print(f"{len(todo)} chats to do; see {os.path.join(run, 'CHECKLIST.txt')}")


if __name__ == "__main__":
    main()
