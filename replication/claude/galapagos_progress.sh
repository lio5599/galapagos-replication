#!/bin/bash
# Progress of one library's tests.usecase step:  bash galapagos_progress.sh <library> [run]
P=${1:?usage: bash galapagos_progress.sh <library> [run]}; RUN=${2:-baseline-r1}
LOG=~/galapagos-replication/replication/claude/runs/$RUN/logs/$P-4-usecase.log
copies=$(ls -d ~/galapagos-clones/$P-*-c 2>/dev/null | wc -l)
tests=$(grep -c "Testing with command" "$LOG" 2>/dev/null); tests=${tests:-0}
results=$(find ~/galapagos-replication/scripts/out/$P/c -name '*.result.json' 2>/dev/null | wc -l)
UPID=$(pgrep -f "tests.usecase $P " | head -1)
if [ -z "$UPID" ]; then now="(no tests.usecase running for $P)"
else now=$(ps -o pid=,etime=,args= --ppid "$UPID" | head -1 | cut -c1-150); now=${now:-"(Galapagos itself: comparing or saving)"}; fi
echo "$(date +%H:%M)  $P: copies built $copies | test runs started $tests | variants finished $results"
echo "        running now (pid, running for, command): $now"
