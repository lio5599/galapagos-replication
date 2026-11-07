"""Independent pilot check: compare all 256 unsigned-char inputs, not a Galapagos result.

Compiles each saved alaw_to_s16 variant separately. Only the function identifier
is renamed inside the temporary test harness. No saved model reply is edited.
"""
import argparse
import importlib.util
import json
from pathlib import Path
import re
import shutil
import subprocess
import tempfile

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location("bridge", HERE / "generate_variants_codex.py")
bridge = importlib.util.module_from_spec(spec)
spec.loader.exec_module(bridge)


def split(text, ret):
    parts = []
    start = text.find(ret)
    while start >= 0:
        end = text.find("{", start)
        depth = 1
        while depth:
            end += 1
            if text[end] == "{":
                depth += 1
            elif text[end] == "}":
                depth -= 1
        parts.append(text[start:end+1])
        start = text.find(ret, end)
    return parts


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--run", type=Path, default=HERE / "runs/corey-pilot-baseline")
    args = ap.parse_args()
    compiler = shutil.which("clang")
    if not compiler:
        ap.error("clang missing")
    root = HERE.parents[1]
    original = (root / "functions/alsa-lib/0_alaw_to_s16.c").read_text()
    raw = (args.run / "replies/alsa-lib/0_alaw_to_s16.txt").read_text()
    parts = split(bridge.partner.parse_response(raw), "static int")
    rows = []
    with tempfile.TemporaryDirectory(prefix="galapagos-smoke-") as tmp:
        tmp = Path(tmp)
        for i, variant in enumerate(parts):
            renamed = re.sub(r"\balaw_to_s16\b", "candidate", variant)
            harness = original + "\n" + renamed + "\n#include <stdio.h>\nint main(void) {\n" \
                "for (int i=0; i<256; ++i) { if (alaw_to_s16((unsigned char)i) != candidate((unsigned char)i)) { printf(\"%d\\n\",i); return 1; }} return 0; }\n"
            source = tmp / "check.c"
            binary = tmp / "check"
            source.write_text(harness)
            for optimization in ("-O0", "-O2"):
                p = subprocess.run([compiler, optimization, str(source), "-o", str(binary)], capture_output=True, text=True)
                row = dict(variant=i, optimization=optimization, compiled=p.returncode == 0)
                if p.returncode:
                    row["compiler_error"] = p.stderr
                else:
                    test = subprocess.run([str(binary)], capture_output=True, text=True, timeout=15)
                    row.update(all_256_inputs_match=test.returncode == 0, output=test.stdout)
                rows.append(row)
    result = dict(kind="supplemental exhaustive finite-domain smoke check; NOT Galapagos validation",
        compiler=subprocess.run([compiler, "--version"], capture_output=True, text=True).stdout.splitlines()[0],
        rows=rows)
    (args.run / "smoke.json").write_text(json.dumps(result, indent=2))
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
