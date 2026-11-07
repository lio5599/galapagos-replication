"""Wait for the active setup, then run controls and ONLY the saved baseline pilot.

No variant generation, study loops, model calls, or automatic code repairs.
Writes pipeline-status.json so progress survives a long compiler build.
"""
import argparse
import datetime as dt
import json
import os
from pathlib import Path
import subprocess
import sys
import time

HERE = Path(__file__).resolve().parent
RUN = HERE / "runs/corey-pilot-baseline"
STATUS = HERE / "pipeline-status.json"
BASE = Path.home() / "galapagos-replication"


def save(state, **extra):
    data = dict(state=state, updated_at=dt.datetime.now(dt.timezone.utc).isoformat(),
                scope="ONLY saved baseline pilot: alsa-lib/alaw_to_s16, ten variants", **extra)
    tmp = STATUS.with_suffix(".tmp")
    tmp.write_text(json.dumps(data, indent=2))
    tmp.replace(STATUS)
    print(json.dumps(data), flush=True)


def setup_processes():
    found = []
    for p in Path('/proc').glob('[0-9]*'):
        try:
            argv = (p / 'cmdline').read_bytes().split(b'\0')
            if len(argv) > 1 and argv[0].endswith(b'bash') and argv[1].decode() == str(BASE / 'replication/codex/setup_build_only.sh'):
                found.append(int(p.name))
        except (OSError, UnicodeError):
            continue
    return found


def main():
    if os.name == 'nt':
        raise SystemExit('Run in Ubuntu')
    log = Path.home() / 'galapagos-setup.log'
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--setup-pid', type=int)
    args = ap.parse_args()
    active = [args.setup_pid] if args.setup_pid else setup_processes()
    if len(active) != 1:
        raise SystemExit(f'Expected one active setup process, found {active}; inspect before starting')
    pid = active[0]
    while True:
        try:
            os.kill(pid, 0)
        except ProcessLookupError:
            break
        tail = log.read_text(errors='replace').splitlines()[-1:] if log.exists() else []
        save('building_toolchain', setup_pid=pid, latest_build_line=tail[0] if tail else '')
        time.sleep(30)
    tail = log.read_text(errors='replace').splitlines()[-20:]
    if not any(line.startswith('Setup finished. In every new terminal:') for line in tail):
        save('setup_failed_or_interrupted', log=str(log), last_lines=tail)
        return 1
    env = Path.home() / 'galapagos-env.sh'
    if not env.exists():
        save('setup_failed', reason='environment file missing')
        return 1
    steps = [
        ('verifier_controls', ['python3', str(HERE / 'verify_controls.py'), '--alive',
            str(BASE / 'scripts/verifier/alive/build/alive-tv'), '--output', str(RUN / 'verifier-controls.json')]),
        ('validating_pilot', ['python3', str(HERE / 'prepare_pipeline.py'), '--base', str(BASE),
            '--run-dir', str(RUN), '--jobs', '2', '--execute']),
        ('summarizing_pilot', ['python3', str(HERE / 'summarize_run.py'), str(RUN)])]
    logs = RUN / 'logs'
    logs.mkdir(exist_ok=True)
    for name, cmd in steps:
        save(name)
        with (logs / (name + '-driver.log')).open('w') as output:
            # Fixed environment file; argv passed positionally to avoid shell interpolation.
            p = subprocess.run(['bash', '-c', 'source "$1"; shift; exec "$@"', 'pilot', str(env), *cmd],
                               stdout=output, stderr=subprocess.STDOUT)
        if p.returncode:
            save('pilot_check_failed', stage=name, exit_code=p.returncode,
                 log=str(logs / (name + '-driver.log')))
            return p.returncode
    save('pilot_finished_ready_for_review', summary=str(RUN / 'summary.json'),
         note='No other conditions or full study started. Inspect summary and detailed logs before proceeding.')
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
