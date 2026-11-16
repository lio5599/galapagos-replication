#!/usr/bin/env python3
"""
Where each library stands in the current run (read-only).
Counts only the functions listed in functions/<project>/functions_info.json.

  python3 galapagos_status.py

"done" needs every compiled variant to have a complete result. When tests.usecase is
stopped (Ctrl+C), Galapagos still writes a result file for every variant, including the
ones it hadn't finished testing or verifying; those are reported as incomplete, and the
library has to be cleaned up and run again.
"""
import glob
import json
import os
import subprocess

G = os.environ.get("GALAPAGOS") or os.path.abspath(os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", ".."))
CLONES = os.path.expanduser("~/galapagos-clones")
PROJECTS = ["alsa-lib", "ffmpeg", "libgcrypt", "liboqs", "libsodium", "openssl"]


def incomplete(r):
    """Why a result file is unfinished (the run was stopped before this variant was done), or None."""
    if r.get("python_error_msg"):
        return None                      # a real failure, recorded by Galapagos
    if not r.get("compiled"):
        return "stopped while building"
    if "changes" not in r:
        return "stopped while comparing"
    if r.get("preserved_in_ex") and "pass_tests" not in r:
        return "stopped during tests"
    if r.get("pass_tests") is True:
        want = {os.path.basename(p[0]) for p in (r.get("changes") or {}).get("bitcodes") or []}
        if not want <= set((r.get("verification") or {}).keys()):
            return "stopped during alive-tv"
    return None


if __name__ == "__main__":
    running = subprocess.run(["pgrep", "-af", "tests.usecase"], capture_output=True, text=True).stdout
    print(f"{'Library':10s} {'replies':>7s} {'split':>5s} {'templ':>5s} {'compiled':>8s} {'copies':>6s} {'results':>7s}  status")
    for p in PROJECTS:
        info = json.load(open(os.path.join(G, "functions", p, "functions_info.json")))
        fids = [f"{i}_{fn['name']}" for i, fn in enumerate(info)]
        n = 10 * len(fids)
        v = os.path.join(G, "functions", p, "variants", "c")
        count = lambda pattern: sum(len(glob.glob(os.path.join(v, pattern.format(fid=f)))) for f in fids)
        replies = count("{fid}.c.variants")
        raw = count("{fid}_[0-9].c.raw")
        templ = count("{fid}_[0-9].c")
        comp = count("{fid}_[0-9].bc")
        copies = sum(len(glob.glob(os.path.join(CLONES, f"{p}-{f}-*-c"))) for f in fids)
        files = [x for f in fids for x in glob.glob(os.path.join(G, "scripts", "out", p, "c", f, f"{f}*.json"))]
        results = len(files)
        unfinished = 0
        for x in files:
            try:
                unfinished += incomplete(json.load(open(x))) is not None
            except (OSError, ValueError):
                unfinished += 1
        if f"tests.usecase {p} " in running + " ":
            status = "RUNNING (tests.usecase)"
        elif unfinished:
            status = f"STOPPED EARLY: {unfinished} results incomplete; clean up and rerun this library"
        elif templ and results >= templ:
            # tests.usecase gives every templated variant a result
            status = "done" if templ >= n else f"done (only {templ} of {n} variants: some replies didn't split into 10)"
        elif raw == 0 and results == 0:
            status = "not started" if replies else "no variants generated"
        else:
            status = "stopped partway"
        print(f"{p:10s} {replies:7d} {raw:5d} {templ:5d} {comp:8d} {copies:6d} {results:4d}/{n:<3d} {status}")
