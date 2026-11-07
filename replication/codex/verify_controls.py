"""Check that the built verifier accepts an equivalent pair and rejects a changed one."""
import argparse
import json
from pathlib import Path
import re
import subprocess
import tempfile


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--alive", type=Path, required=True)
    ap.add_argument("--output", type=Path, required=True)
    args = ap.parse_args()
    source = "define i8 @f(i8 %x) {\nentry:\n ret i8 %x\n}\n"
    equivalents = "define i8 @f(i8 %x) {\nentry:\n %r = add i8 %x, 0\n ret i8 %r\n}\n"
    different = "define i8 @f(i8 %x) {\nentry:\n %r = add i8 %x, 1\n ret i8 %r\n}\n"
    results = []
    with tempfile.TemporaryDirectory(prefix="galapagos-verifier-controls-") as tmp:
        tmp = Path(tmp)
        src = tmp / "source.ll"
        src.write_text(source)
        for name, target, expected in (("equivalent", equivalents, "correct"), ("different", different, "incorrect")):
            tgt = tmp / (name + ".ll")
            tgt.write_text(target)
            p = subprocess.run([str(args.alive), "--src-fn=f", "--tgt-fn=f", "--src-unroll=2", "--tgt-unroll=2",
                                "--smt-to=300000", str(src), str(tgt)], capture_output=True, text=True, timeout=60)
            match = re.search(r"(\d+) " + expected + r" transformations", p.stdout)
            results.append(dict(control=name, expected=expected, passed=bool(match and int(match[1]) > 0),
                                exit_code=p.returncode, stdout=p.stdout, stderr=p.stderr))
    args.output.write_text(json.dumps(results, indent=2))
    print(json.dumps(results, indent=2))
    if not all(row["passed"] for row in results):
        raise SystemExit("Verifier controls failed; do not interpret study verification results")


if __name__ == "__main__":
    main()
