#!/usr/bin/env bash
# Runs the published Galapagos pipeline, unchanged, on the C variants that
# generate_variants_claude.py wrote. This script only calls the authors'
# scripts, in the order of their scripts/compile.sh and README (C only):
#
#   python split_variants.py c <project>      .c.variants -> 10 .c.raw files
#   python template_variants.py c <project>   wraps each in functions/template.c
#   python compile_variants.py c <project>    compile in isolation -> .ll / .bc
#   python3 -m tests.usecase <project> c      compile in project, test suite, alive-tv
#   python validation_table.py                Table 4 counts (run after all projects)
#
# Usage:  ./run_galapagos.sh <run> [project ...]
#   e.g.  ./run_galapagos.sh baseline-r1
#         ./run_galapagos.sh pilot alsa-lib
# Logs go to runs/<run>/logs/. Galapagos writes its own outputs where it always
# does: functions/<project>/variants/c/ and scripts/out/<project>/c/.
set -u
RUN=${1:?usage: ./run_galapagos.sh <run> [project ...]}
shift
PROJECTS=${*:-alsa-lib ffmpeg libgcrypt liboqs libsodium openssl}
HERE=$(cd "$(dirname "$0")" && pwd)
G=${GALAPAGOS:-$(cd "$HERE/../.." && pwd)}
PY=${PYTHON:-python3}
LOG="$HERE/runs/$RUN/logs"
mkdir -p "$LOG"
[ -d "$G/scripts" ] || { echo "No Galapagos scripts/ folder at $G (set GALAPAGOS=...)"; exit 1; }
cd "$G/scripts"

step() {  # step <log-name> <command...>
  local name=$1; shift
  echo "\$ $*" | tee "$LOG/$name.log"
  "$@" >>"$LOG/$name.log" 2>&1
  local rc=$?
  [ $rc -eq 0 ] && echo "  ok" || echo "  exit code $rc (see $LOG/$name.log)"
  return $rc
}

# Like the authors' compile.sh, every step runs even if an earlier one failed:
# a crash in template_variants.py at one function leaves the earlier functions
# templated, and compile_variants.py / tests.usecase use whatever files exist.
for p in $PROJECTS; do
  echo "=== $p"
  step "$p-1-split"    "$PY" split_variants.py c "$p"
  step "$p-2-template" "$PY" template_variants.py c "$p"
  step "$p-3-compile"  "$PY" compile_variants.py c "$p"
  step "$p-4-usecase"  "$PY" -m tests.usecase "$p" c
done

echo "=== Table 4 counts"
step "validation_table" "$PY" validation_table.py
echo "Counts: $LOG/validation_table.log"
echo "When you're done with this run: ./archive_run.sh $RUN"
