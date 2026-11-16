#!/bin/bash
# Clear one library's Galápagos results and copies so it can be run again from scratch.
#   bash reset_library.sh <library> [--reference]   (--reference also rebuilds its reference copy)
P=${1:?usage: bash reset_library.sh <library> [--reference]}
if pgrep -f "tests.usecase $P " >/dev/null; then echo "$P is still running; stop it first (Ctrl+C in its tmux session)."; exit 1; fi
for p in $(pgrep -u $USER); do d=$(readlink /proc/$p/cwd 2>/dev/null); case "$d" in */galapagos-clones/$P|*/galapagos-clones/$P/*|*/galapagos-clones/$P-*) kill $p;; esac; done
find ~/galapagos-clones -mindepth 1 -maxdepth 1 -name "$P-*-c" -exec rm -rf {} +
rm -rf ~/galapagos-replication/scripts/out/$P/c
[ "$2" = "--reference" ] && rm -rf ~/galapagos-clones/$P
if ls -d ~/galapagos-clones/$P-*-c >/dev/null 2>&1; then echo "Some $P copies are still there."; else echo "$P cleared. Next: ./run_galapagos.sh <run> $P"; fi
