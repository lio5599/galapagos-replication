#!/usr/bin/env python3
"""
Where each library stands in the current run (read-only).
Counts only the functions listed in functions/<project>/functions_info.json.

  python3 galapagos_status.py
"""
import glob
import json
import os
import subprocess

G = os.environ.get("GALAPAGOS") or os.path.abspath(os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", ".."))
CLONES = os.path.expanduser("~/galapagos-clones")
PROJECTS = ["alsa-lib", "ffmpeg", "libgcrypt", "liboqs", "libsodium", "openssl"]

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
    results = sum(len(glob.glob(os.path.join(G, "scripts", "out", p, "c", f, f"{f}*.json"))) for f in fids)
    if f"tests.usecase {p} " in running + " ":
        status = "RUNNING (tests.usecase)"
    elif results >= n:
        status = "done"
    elif raw == 0 and results == 0:
        status = "not started" if replies else "no variants generated"
    else:
        status = "stopped partway"
    print(f"{p:10s} {replies:7d} {raw:5d} {templ:5d} {comp:8d} {copies:6d} {results:4d}/{n:<3d} {status}")
