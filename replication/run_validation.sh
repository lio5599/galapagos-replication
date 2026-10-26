#!/usr/bin/env bash
# Run the Galápagos validation pass (compile in isolation -> compile in project
# -> test suite -> alive-tv) on one run folder, for one project and language.
#
#   ./run_validation.sh <run_dir> <project> <c|go> [--isolation-only] [--function NAME]
#                       [--keep-isolation-failures]
#
# Needs galapagos-replication.patch applied (setup_wsl.sh does this). The patch makes the pipeline read
# variants from $GALAPAGOS_VARIANTS and write results to $GALAPAGOS_RESULTS;
# this script points both at the run folder:
#   <run_dir>/variants/<project>/<lang>/   (from ingest_variants.py)
#   <run_dir>/out/<project>/<lang>/        (result JSONs, read by tabulate.py)
# The authors' GPT-4o files in functions/*/variants and scripts/out are never touched.
#
# Env: GALAPAGOS (default: the repo this folder is in), GALAPAGOS_CLONES (default ~/galapagos-clones)
set -euo pipefail

RUN=$(cd "$1" && pwd); P=$2; L=$3; shift 3
ISO_ONLY=0; ONE_FN=""; KEEP_FAILS=0
while [ $# -gt 0 ]; do
  case $1 in
    --isolation-only) ISO_ONLY=1 ;;
    --keep-isolation-failures) KEEP_FAILS=1 ;;
    --function) ONE_FN=$2; shift ;;
    *) echo "unknown option $1" >&2; exit 2 ;;
  esac
  shift
done

HERE=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
if [ -n "${GALAPAGOS:-}" ]; then G=$GALAPAGOS
elif [ -d "$HERE/../functions" ]; then G=$(cd "$HERE/.." && pwd)
else G=$HOME/Galapagos; fi
export GALAPAGOS_VARIANTS="$RUN/variants" GALAPAGOS_RESULTS="$RUN/out"
VDIR="$GALAPAGOS_VARIANTS/$P/$L"
LOG="$RUN/logs"; mkdir -p "$LOG"

die() { echo "ERROR: $*" >&2; exit 1; }
grep -q "def variants_dir" "$G/scripts/generate_variants.py" \
  || die "apply replication/galapagos-replication.patch to $G first (setup_wsl.sh does this)"
ls "$VDIR"/*."$L".raw >/dev/null 2>&1 || die "no variants in $VDIR (run ingest_variants.py first)"

# --- toolchain sanity -------------------------------------------------------
CLANG_MAJOR=$( (clang --version 2>/dev/null || true) | sed -n 's/.*version \([0-9]*\).*/\1/p' | awk 'NR==1')
[ "$CLANG_MAJOR" = "17" ] || echo "WARNING: clang on PATH is LLVM $CLANG_MAJOR; alive2 here is built on LLVM 17." \
  "Put \$GALAPAGOS/scripts/verifier/llvm/build/bin first on PATH or bitcode may not load." >&2
if [ "$L" = go ]; then
  [ -x "$G/linker/deps/llvm-Release-build-go/bin/llvm-goc" ] \
    || die "Go variants need gollvm's llvm-goc at linker/deps/llvm-Release-build-go/bin (not built by any repo script)"
fi
if [ $ISO_ONLY = 0 ]; then
  [ -x "$G/scripts/verifier/alive/build/alive-tv" ] || die "alive-tv not built (scripts/verifier/build.sh)"
  [ -x "$G/linker/build/linker" ] || die "function linker not built (linker/build_deps.sh && linker/build.sh)"
fi

# --- compile in isolation ----------------------------------------------------
cd "$G/scripts"
python3 template_variants.py "$L" "$P" 2>&1 | tee "$LOG/$P-$L-template.log"
python3 compile_variants.py "$L" "$P" 2>&1 | tee "$LOG/$P-$L-compile.log"
echo "compiled in isolation: $(ls "$VDIR"/*.bc 2>/dev/null | wc -l) of $(ls "$VDIR"/*."$L".raw | wc -l)"
[ $ISO_ONLY = 1 ] && exit 0

# A variant with no .bc can only fail in-project (the linker step needs its
# .bc), but tests.usecase would still copy the whole built library for it
# first. Renaming its templated source hides it from tests.usecase; the counts
# are the same because tabulate.py only counts result.json with "compiled": true.
if [ $KEEP_FAILS = 0 ]; then
  for src in "$VDIR"/*."$L"; do
    [ -e "${src%.$L}.bc" ] || mv -f "$src" "$src.isolation-failed"
  done
fi

# --- compile in project, run tests, verify --------------------------------
python3 -m tests.usecase "$P" "$L" $ONE_FN 2>&1 | tee "$LOG/$P-$L-usecase.log"
echo "results in $GALAPAGOS_RESULTS/$P/$L; summarise with: python3 tabulate.py --run $RUN"
