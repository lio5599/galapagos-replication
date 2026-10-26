#!/usr/bin/env bash
# End-to-end check of the whole pipeline on ONE function, using GPT-4o's own
# variants from gpt4o-originals/, and a comparison with the authors' results.
#
#   source ~/galapagos-env.sh
#   bash ~/galapagos-replication/replication/smoke_test.sh [project] [function]
#
# Default: alsa-lib iec958_parity (C), one of the quicker libraries to build.
# The authors' results for it: 10 compile in isolation, 8 compile in the
# project, 8 pass the tests, 8 pass alive-tv (automated check; the paper's
# stricter final count for this function is 4). If your numbers match, your
# setup reproduces theirs and you can trust it with Claude's variants.
set -euo pipefail
P=${1:-alsa-lib}; FN=${2:-iec958_parity}; L=c
HERE=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
G=${GALAPAGOS:-$(cd "$HERE/.." && pwd)}
[ -n "${VIRTUAL_ENV:-}" ] || { echo "Run 'source ~/galapagos-env.sh' first."; exit 1; }

src=$(ls -d "$G"/gpt4o-originals/"$P"variant*/variants/"$L" 2>/dev/null | head -1 || true)
[ -n "$src" ] || { echo "GPT-4o variants for $P not found under $G/gpt4o-originals"; exit 1; }

RUN=$HERE/runs/gpt4o-smoke-$P-$FN
rm -rf "$RUN"; mkdir -p "$RUN/variants/$P/$L"
# all of the project's variants: template_variants.py expects every function;
# only $FN is built into the library and tested
cp "$src"/*."$L".raw "$RUN/variants/$P/$L/"

echo "Running the pipeline for $P/$FN with GPT-4o's 10 variants."
echo "This builds $P once, then rebuilds and tests it for each variant; expect 30-90 minutes."
"$HERE/run_validation.sh" "$RUN" "$P" "$L" --function "$FN"
python3 "$HERE/tabulate.py" --run "$RUN" --galapagos "$G" >/dev/null

python3 - "$RUN/table4.csv" "$P" "$FN" <<'EOF'
import csv, sys
path, project, function = sys.argv[1:]
# GPT-4o's C results as committed by the authors (comp_isol, comp_proj, test, alive-tv pass)
EXPECTED = {
    ("alsa-lib", "alaw_to_s16"): (10, 10, 10, 1),
    ("alsa-lib", "iec958_parity"): (10, 8, 8, 8),
    ("alsa-lib", "add"): (10, 9, 9, 9),
    ("alsa-lib", "ulaw_to_s16"): (10, 10, 10, 9),
    ("alsa-lib", "val_seg"): (10, 10, 10, 2),
    ("ffmpeg", "flac_get_max_frame_size"): (10, 10, 9, 4),
    ("ffmpeg", "mix"): (10, 10, 10, 6),
    ("ffmpeg", "vp5_adjust"): (10, 10, 10, 0),
    ("ffmpeg", "weight"): (10, 10, 10, 10),
    ("ffmpeg", "int_sin"): (10, 10, 10, 10),
    ("libgcrypt", "barrett_reduce"): (10, 10, 0, 0),
    ("libgcrypt", "ctz"): (10, 10, 10, 10),
    ("libgcrypt", "int16_t_negative_mask"): (9, 9, 7, 7),
    ("libgcrypt", "int16_t_nonzero_mask"): (10, 10, 7, 7),
    ("libgcrypt", "montgomery_reduce"): (10, 10, 6, 4),
    ("liboqs", "fpr_half"): (10, 10, 10, 2),
    ("liboqs", "fpr_lt"): (9, 9, 9, 0),
    ("liboqs", "modp_montymul"): (10, 10, 10, 2),
    ("liboqs", "modp_norm"): (10, 10, 7, 0),
    ("liboqs", "int16_nonzero_mask"): (10, 10, 10, 3),
    ("libsodium", "b64_byte_to_char"): (10, 8, 8, 0),
    ("libsodium", "b64_byte_to_urlsafe_char"): (10, 8, 8, 0),
    ("libsodium", "b64_char_to_byte"): (10, 7, 0, 0),
    ("libsodium", "b64_urlsafe_char_to_byte"): (10, 10, 0, 0),
    ("libsodium", "fBlaMka"): (10, 10, 10, 9),
    ("openssl", "icbrt64"): (10, 10, 10, 10),
    ("openssl", "BitDeinterleave"): (10, 10, 10, 3),
    ("openssl", "BitInterleave"): (10, 10, 10, 4),
    ("openssl", "_booth_recode_w5"): (10, 10, 10, 2),
    ("openssl", "_booth_recode_w7"): (10, 10, 10, 0),
}
row = next((r for r in csv.DictReader(open(path))
            if r["project"] == project and r["function"] == function and r["lang"] == "c"), None)
if row is None:
    sys.exit("No results found; check the logs in the run folder.")
mine = tuple(int(row[k]) for k in ("comp_isol", "comp_proj", "test", "verif"))
theirs = EXPECTED.get((project, function))
labels = ("compile in isolation", "compile in project", "pass tests", "pass alive-tv")
print(f"\n{project}/{function} (C), GPT-4o variants:")
print(f"  {'':22s} {'yours':>6s} {'authors':>8s}")
for lab, a, b in zip(labels, mine, theirs or (None,) * 4):
    print(f"  {lab:22s} {a:6d} {('' if b is None else b):>8}")
if theirs is None:
    print("No reference numbers for this function.")
elif mine == theirs:
    print("Match: your setup reproduces the authors' results for this function.")
else:
    print("Differs from the authors' results. Small differences can come from test or alive-tv timeouts;")
    print("a 0 in a column where they have 10 points to a setup problem (see the logs in the run folder).")
EOF
