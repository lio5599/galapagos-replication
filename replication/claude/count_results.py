#!/usr/bin/env python3
"""
Read-only Table 4 counts for one run, for all six projects.

Uses exactly the counting rules of Galapagos' scripts/validation_table.py:
  Comp. Isol.  number of functions/<p>/variants/c/<i>_<name>*.bc files
  Comp. Proj.  result.json files with "compiled": true
  Test         result.json files with "pass_tests": true
  Verif.       result.json files where some bitcode has "correct transformations" > 0
validation_table.py itself only covers alsa-lib, ffmpeg, libsodium and openssl and prints a
nested dictionary; this script covers all six and prints a table. It only reads files.

  python3 count_results.py                  # results still in the Galapagos folders (before archiving)
  python3 count_results.py --run baseline-r1  # an archived run (runs/baseline-r1/galapagos/...)
  python3 count_results.py --run baseline-r1 --csv baseline-r1.csv
  python3 count_results.py --run baseline-r1 --details ffmpeg   # one line per variant for a project

On the authors' own published folders the Comp. Isol. column comes out above 10 for some
functions, because those folders also hold leftover *.strip.bc files from other scripts (the
same glob in validation_table.py counts them). The C-to-C pipeline you run doesn't create them.
"""
import argparse
import csv
import glob
import json
import os
import re

HERE = os.path.dirname(os.path.abspath(__file__))
PROJECTS = ["alsa-lib", "ffmpeg", "libgcrypt", "liboqs", "libsodium", "openssl"]
COLS = ["comp_isol", "comp_proj", "test", "verif"]


def default_galapagos():
    if os.environ.get("GALAPAGOS"):
        return os.environ["GALAPAGOS"]
    return os.path.abspath(os.path.join(HERE, "..", ".."))


def count_function(vdir, odir, fid):
    isol = len(glob.glob(os.path.join(vdir, f"{fid}*.bc")))
    results = []
    for p in glob.glob(os.path.join(odir, fid, f"{fid}*.json")):
        with open(p) as f:
            results.append(json.load(f))
    proj = sum(1 for r in results if r.get("compiled") is True)
    test = sum(1 for r in results if r.get("pass_tests") is True)
    verif = sum(1 for r in results
                if any((v or {}).get("correct transformations", 0) > 0
                       for v in (r.get("verification") or {}).values()))
    return {"comp_isol": isol, "comp_proj": proj, "test": test, "verif": verif, "result_files": len(results)}


def show_details(g, p, vdir, odir, where):
    """One line per variant: compiled alone, compiled in project, tests, alive-tv verdict, error."""
    with open(os.path.join(g, "functions", p, "functions_info.json")) as f:
        info = json.load(f)
    print(f"{p}, {where}: one line per variant (the variant number comes from the result's shadow_folder)\n")
    print(f"{'Function':26s} {'Var':>3s}  {'Isol':4s} {'Proj':4s} {'Test':4s}  alive-tv (correct/incorrect/failed/errors)  error")
    for i, fn in enumerate(info):
        fid = f"{i}_{fn['name']}"
        by_var = {}
        copy_re = re.compile(rf"{re.escape(p)}-{re.escape(fid)}-(\d+)-c")
        for k, path in enumerate(sorted(glob.glob(os.path.join(odir, fid, f"{fid}*.json")))):
            with open(path) as f:
                r = json.load(f)
            # The variant number is in the copy folder's name: in shadow_folder, or, for a variant
            # that failed before shadow_folder was recorded, in the error message.
            text = " ".join(str(r.get(x) or "") for x in ("shadow_folder", "python_error_msg", "python_error_trace"))
            m = copy_re.search(text)
            j = m.group(1) if m else f"?{k}"
            by_var[j] = r
        variants = sorted(set(by_var) | {str(j) for j in range(10)}, key=lambda x: (not x.isdigit(), int(x) if x.isdigit() else 0))
        for j in variants:
            isol = "yes" if os.path.exists(os.path.join(vdir, f"{fid}_{j}.bc")) else "no"
            r = by_var.get(j)
            if r is None:
                print(f"{fn['name']:26s} {j:>3s}  {isol:4s} {'-':4s} {'-':4s}  (no result file)")
                continue
            yn = lambda x: "yes" if x is True else ("no" if x is False else "-")
            ver = r.get("verification") or {}
            verdict = ", ".join(f"{os.path.basename(b)} {v.get('correct transformations', 0)}/{v.get('incorrect transformations', 0)}/"
                                f"{v.get('failed-to-prove transformations', 0)}/{v.get('Alive2 errors', 0)}"
                                for b, v in ver.items() if v) or "-"
            err = re.sub(r"/\S*?/galapagos-clones/", ".../", (r.get("python_error_msg") or "").replace("\n", " "))[:110]
            print(f"{fn['name']:26s} {j:>3s}  {isol:4s} {yn(r.get('compiled')):4s} {yn(r.get('pass_tests')):4s}  {verdict:42s} {err}")


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--run", help="read an archived run from runs/<run>/galapagos/ (default: the live Galapagos folders)")
    ap.add_argument("--galapagos", default=default_galapagos(), help="Galapagos repo (default: two folders up)")
    ap.add_argument("--csv", help="also write the per-function counts to this CSV file")
    ap.add_argument("--details", metavar="PROJECT", choices=PROJECTS,
                    help="list every variant's result for one project instead of the table")
    args = ap.parse_args()

    g = os.path.abspath(args.galapagos)
    if args.run:
        base = os.path.join(HERE, "runs", args.run, "galapagos")
        if not os.path.isdir(base):
            raise SystemExit(f"{base} doesn't exist (archive the run first, or leave out --run).")
        vroot = lambda p: os.path.join(base, "functions", p, "variants", "c")
        oroot = lambda p: os.path.join(base, "out", p, "c")
        where = f"archived run '{args.run}'"
    else:
        vroot = lambda p: os.path.join(g, "functions", p, "variants", "c")
        oroot = lambda p: os.path.join(g, "scripts", "out", p, "c")
        where = "live Galapagos folders"

    if args.details:
        show_details(g, args.details, vroot(args.details), oroot(args.details), where)
        return

    rows, totals, n_functions = [], dict.fromkeys(COLS, 0), 0
    print(f"Table 4 counts (C-to-C), {where}\n")
    print(f"{'Project':10s} {'Function':26s} {'Comp.Isol':>9s} {'Comp.Proj':>9s} {'Test':>5s} {'Verif':>5s}")
    for p in PROJECTS:
        with open(os.path.join(g, "functions", p, "functions_info.json")) as f:
            info = json.load(f)
        vdir, odir = vroot(p), oroot(p)
        if not os.path.isdir(vdir) and not os.path.isdir(odir):
            print(f"{p:10s} {'(not run yet)':26s}")
            continue
        for i, fn in enumerate(info):
            fid = f"{i}_{fn['name']}"
            c = count_function(vdir, odir, fid)
            rows.append({"project": p, "function": fn["name"], **c})
            for k in COLS:
                totals[k] += c[k]
            n_functions += 1
            note = "" if c["result_files"] or not c["comp_isol"] else "  (no result files yet)"
            print(f"{p:10s} {fn['name']:26s} {c['comp_isol']:9d} {c['comp_proj']:9d} {c['test']:5d} {c['verif']:5d}{note}")
    if n_functions:
        n = 10 * n_functions
        print(f"\n{'Total':37s} {totals['comp_isol']:9d} {totals['comp_proj']:9d} {totals['test']:5d} {totals['verif']:5d}"
              f"   (out of {n} variants, {n_functions} functions)")
        print(f"{'%':37s} " + " ".join(f"{100.0 * totals[k] / n:{w}.1f}" for k, w in zip(COLS, (9, 9, 5, 5))))
    if args.csv and rows:
        with open(args.csv, "w", newline="") as f:
            w = csv.DictWriter(f, fieldnames=list(rows[0].keys()))
            w.writeheader()
            w.writerows(rows)
        print(f"\nPer-function counts written to {args.csv}")


if __name__ == "__main__":
    main()
