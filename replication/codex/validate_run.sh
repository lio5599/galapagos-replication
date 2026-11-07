#!/usr/bin/env bash
# Validate exactly one existing generated run; no model calls or study loop.
set -euo pipefail
RUN=${1:?Pass a generated run name}
[[ "$RUN" =~ ^[A-Za-z0-9_-]+$ ]] || { echo 'Invalid run name'; exit 1; }
HERE=/mnt/c/COMS6650/FinalProject/replication/codex
source "$HOME/galapagos-env.sh"
python3 "$HERE/verify_alignment.py"
python3 "$HERE/prepare_pipeline.py" --base "$HOME/galapagos-replication" --run-dir "$HERE/runs/$RUN" --jobs 2 --execute
python3 "$HERE/summarize_run.py" "$HERE/runs/$RUN"
