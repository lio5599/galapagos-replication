#!/usr/bin/env bash
# Usage: bash galapagos_progress.sh <project> [run]
P=${1:?project}; RUN=${2:-baseline-r1}
LOG=~/galapagos-replication/replication/claude/runs/$RUN/logs/$P-4-usecase.log
copies=$(ls -d ~/galapagos-clones/$P-*-c 2>/dev/null | wc -l)
tests=$(grep -c "Testing with command" "$LOG" 2>/dev/null || echo 0)
results=$(find ~/galapagos-replication/scripts/out/$P/c -name '*.result.json' 2>/dev/null | wc -l)
now=$(pgrep -a "make|alive-tv|opt" | head -1 | cut -c1-150)
echo "$(date +%H:%M)  $P: copies built $copies | test runs started $tests | variants finished $results"
echo "        running now: ${now:-nothing}"