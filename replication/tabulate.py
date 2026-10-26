#!/usr/bin/env python3
"""
Count variants passing each Galápagos validation filter (paper Table 4):
  Comp. Isol.  -> a <i>_<name>_<j>.bc exists after compile_variants.py
  Comp. Proj.  -> result.json has "compiled": true
  Test         -> result.json has "pass_tests": true
  Verif.       -> some verified bitcode has "correct transformations" > 0

The counting rules copy scripts/validation_table.py from the Galápagos repo so
your numbers stay comparable with the paper. Two extra columns are added:
  verif_strict -> also requires 0 incorrect / 0 failed-to-prove / 0 Alive2 errors
  missing      -> variants the model never produced (ingest wrote a placeholder)

Usage
  # one of your runs (layout written by run_validation.sh)
  python3 tabulate.py --run runs/claude-baseline-r1

  # the GPT-4o results the authors committed (sanity check against Table 4)
  python3 tabulate.py --repo ~/Galapagos

Writes a CSV next to the run (or to --csv) and prints totals per language.
"""
import argparse
import csv
import glob
import json
import os
import sys

PROJECTS = ["alsa-lib", "ffmpeg", "libgcrypt", "liboqs", "libsodium", "openssl"]


def default_galapagos():
    """$GALAPAGOS, else the repo this folder sits in, else ~/Galapagos."""
    if os.environ.get("GALAPAGOS"):
        return os.environ["GALAPAGOS"]
    parent = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    if os.path.isdir(os.path.join(parent, "functions")):
        return parent
    return os.path.expanduser("~/Galapagos")
LANGS = ["c", "go"]


def load_functions(galapagos, project):
    with open(os.path.join(galapagos, "functions", project, "functions_info.json")) as f:
        return json.load(f)


def count_row(variant_dir, out_dir, i, name, missing_list):
    fid = f"{i}_{name}"
    # Same glob as validation_table.py, minus *.strip.bc leftovers from other scripts.
    bcs = [p for p in glob.glob(os.path.join(variant_dir, f"{fid}_*.bc"))
           if not p.endswith(".strip.bc")]
    results = []
    for p in glob.glob(os.path.join(out_dir, fid, f"{fid}_*.result.json")):
        with open(p) as g:
            results.append(json.load(g))

    compiled = sum(1 for r in results if r.get("compiled") is True)
    tested = sum(1 for r in results if r.get("pass_tests") is True)
    equiv = strict = 0
    for r in results:
        ver = r.get("verification") or {}
        if any(v.get("correct transformations", 0) > 0 for v in ver.values()):
            equiv += 1
        # Unchanged bitcodes report all zeros, so "strict" = at least one proof and
        # no bitcode with a counterexample, timeout/memout, or Alive2 error.
        if any(v.get("correct transformations", 0) > 0 for v in ver.values()) and not any(
            v.get("incorrect transformations", 0) > 0
            or v.get("failed-to-prove transformations", 0) > 0
            or v.get("Alive2 errors", 0) > 0
            for v in ver.values()
        ):
            strict += 1
    return {
        "comp_isol": len(bcs),
        "comp_proj": compiled,
        "test": tested,
        "verif": equiv,
        "verif_strict": strict,
        "results_found": len(results),
        "missing": sum(1 for m in missing_list if m.startswith(fid + "_")),
    }


def tabulate(galapagos, variants_root, out_root, missing):
    rows = []
    for project in PROJECTS:
        info_path = os.path.join(galapagos, "functions", project, "functions_info.json")
        if not os.path.exists(info_path):
            continue
        for i, fn in enumerate(load_functions(galapagos, project)):
            for lang in LANGS:
                vdir = variants_root(project, lang)
                odir = os.path.join(out_root, project, lang)
                if not os.path.isdir(vdir) and not os.path.isdir(odir):
                    continue
                row = {"project": project, "function": fn["name"], "lang": lang}
                row.update(count_row(vdir, odir, i, fn["name"], missing.get((project, lang), [])))
                rows.append(row)
    return rows


def print_summary(rows):
    for lang in LANGS:
        sub = [r for r in rows if r["lang"] == lang]
        if not sub:
            continue
        n = 10 * len(sub)
        print(f"\n[{lang}] {len(sub)} functions, {n} variants expected")
        for key in ["comp_isol", "comp_proj", "test", "verif", "verif_strict", "verif_final", "missing"]:
            if key not in sub[0]:
                continue
            tot = sum(r[key] for r in sub)
            print(f"  {key:13s} {tot:4d}  ({100.0 * tot / n:5.1f}%)")
        # Functions whose variants compiled in isolation but have no results yet
        # (tests.usecase not run, or crashed) - worth a look before reporting.
        no_results = [f'{r["project"]}/{r["function"]}' for r in sub
                      if r["results_found"] == 0 and r["comp_isol"] > 0]
        if no_results:
            print(f"  NOTE: {len(no_results)} functions compiled in isolation but have no result.json: "
                  + ", ".join(no_results[:6]) + (" ..." if len(no_results) > 6 else ""))


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    g = ap.add_mutually_exclusive_group(required=True)
    g.add_argument("--run", help="run directory produced by run_validation.sh")
    g.add_argument("--repo", help="Galápagos checkout; tabulates functions/*/variants and scripts/out in place")
    ap.add_argument("--galapagos", default=default_galapagos(),
                    help="Galápagos checkout (for functions_info.json); default $GALAPAGOS or the repo this folder is in")
    ap.add_argument("--csv", help="where to write the per-function CSV")
    ap.add_argument("--eq-variants", help="optional eq_variants.json-style file (the authors' final, re-checked "
                    "list of equivalent variants); adds a verif_final column")
    args = ap.parse_args()

    missing = {}
    if args.repo:
        galapagos = os.path.abspath(args.repo)
        variants_root = lambda p, l: os.path.join(galapagos, "functions", p, "variants", l)
        out_root = os.path.join(galapagos, "scripts", "out")
        csv_path = args.csv or "table4_repo.csv"
    else:
        galapagos = os.path.abspath(args.galapagos)
        run = os.path.abspath(args.run)
        variants_root = lambda p, l: os.path.join(run, "variants", p, l)
        out_root = os.path.join(run, "out")
        csv_path = args.csv or os.path.join(run, "table4.csv")
        rep = os.path.join(run, "ingest_report.json")
        if os.path.exists(rep):
            with open(rep) as f:
                for entry in json.load(f):
                    missing.setdefault((entry["project"], entry["lang"]), []).extend(entry.get("missing_ids", []))

    rows = tabulate(galapagos, variants_root, out_root, missing)
    if not rows:
        sys.exit("No variants or results found. Check the paths.")
    if args.eq_variants:
        with open(args.eq_variants) as f:
            eq = json.load(f)
        for r in rows:
            r["verif_final"] = len(eq.get(r["project"], {}).get(r["function"], {}).get(r["lang"], []))
    with open(csv_path, "w", newline="") as f:
        w = csv.DictWriter(f, fieldnames=list(rows[0].keys()))
        w.writeheader()
        w.writerows(rows)
    print_summary(rows)
    print(f"\nPer-function table written to {csv_path}")


if __name__ == "__main__":
    main()
