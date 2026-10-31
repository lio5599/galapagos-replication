#!/usr/bin/env bash
# Moves one run's Galapagos outputs out of the Galapagos folders and into
# runs/<run>/galapagos/, so the next condition starts from empty folders.
# Galapagos always writes to the same places, so without this the next run
# would overwrite (or mix with) this one. Nothing is deleted; files are moved.
#
#   functions/<project>/variants/c/  ->  runs/<run>/galapagos/functions/<project>/variants/c/
#   scripts/out/<project>/c/         ->  runs/<run>/galapagos/out/<project>/c/
#
# Usage:  ./archive_run.sh <run>
set -eu
RUN=${1:?usage: ./archive_run.sh <run>}
HERE=$(cd "$(dirname "$0")" && pwd)
G=${GALAPAGOS:-$(cd "$HERE/../.." && pwd)}
DEST="$HERE/runs/$RUN/galapagos"
[ -d "$HERE/runs/$RUN/replies" ] || { echo "No run called '$RUN' in $HERE/runs"; exit 1; }

moved=0
for p in alsa-lib ffmpeg libgcrypt liboqs libsodium openssl; do
  for pair in "functions/$p/variants/c:functions/$p/variants/c" "scripts/out/$p/c:out/$p/c"; do
    src="$G/${pair%%:*}"; dst="$DEST/${pair##*:}"
    [ -d "$src" ] || continue
    if [ -e "$dst" ]; then echo "$dst already exists; not overwriting."; exit 1; fi
    mkdir -p "$(dirname "$dst")"
    mv "$src" "$dst"
    echo "moved ${pair%%:*}"
    moved=$((moved + 1))
  done
done
echo "$moved folders moved to $DEST"
