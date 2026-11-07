#!/usr/bin/env bash
# One command: finish setup, check controls, validate the saved pilot, stop.
set -u
HERE=/mnt/c/COMS6650/FinalProject/replication/codex
bash "$HERE/setup_local.sh" > "$HERE/setup-driver.log" 2>&1 &
setup_pid=$!
python3 "$HERE/finish_initial_pilot.py" --setup-pid "$setup_pid"
pilot_rc=$?
wait "$setup_pid"
setup_rc=$?
if [ "$setup_rc" -ne 0 ]; then exit "$setup_rc"; fi
exit "$pilot_rc"
