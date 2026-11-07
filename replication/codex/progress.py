"""Live stage/variant progress, separate from scientific pass/fail counting."""
import argparse
import datetime as dt
import json
import os
from pathlib import Path
import subprocess
import time


def utc():
    return dt.datetime.now(dt.timezone.utc).isoformat()


def write_json(path, value):
    temp = path.with_suffix('.tmp')
    temp.write_text(json.dumps(value, indent=2), encoding='utf-8')
    temp.replace(path)


def process_activity(pid):
    """CPU ticks + disk IO of the stage and descendants, not monitor activity."""
    procs = {}
    for path in Path('/proc').glob('[0-9]*'):
        try:
            fields = (path / 'stat').read_text().rsplit(')', 1)[1].split()
            procs[int(path.name)] = (int(fields[1]), int(fields[11]) + int(fields[12]))
        except (OSError, ValueError, IndexError):
            pass
    descendants = {pid}
    while True:
        added = {p for p, (parent, _) in procs.items() if parent in descendants} - descendants
        if not added:
            break
        descendants |= added
    cpu = sum(procs.get(p, (0, 0))[1] for p in descendants)
    io = 0
    for p in descendants:
        try:
            for line in Path(f'/proc/{p}/io').read_text().splitlines():
                if line.startswith(('read_bytes:', 'write_bytes:')):
                    io += int(line.split()[1])
        except OSError:
            pass
    return cpu, io, len(descendants)


def counts(workspace):
    out = workspace / 'scripts/out'
    result_files = list(out.glob('*/c/*/*.result.json'))
    return dict(result_records=len(result_files),
        compiled_files=len(list((workspace / 'functions').glob('*/variants/c/*_[0-9].bc'))))


def run_stage(command, cwd, log, run, stage, expected, idle_warning=600, poll_interval=5):
    """Return exit code. Quiet busy tools stay active; inactivity is a warning, not a kill."""
    state_path = run / 'progress.json'
    event_path = run / 'progress-events.jsonl'
    start = last_activity = time.monotonic()
    previous = None
    cursor = 0
    latest_event = {}
    with log.open('w', encoding='utf-8') as output:
        env = dict(os.environ, PYTHONUNBUFFERED='1')
        proc = subprocess.Popen(command, cwd=cwd, stdout=output, stderr=subprocess.STDOUT, env=env)
        try:
            while True:
                now = time.monotonic()
                cpu, io, nproc = process_activity(proc.pid)
                counters = counts(cwd.parent)
                size = log.stat().st_size
                fingerprint = (size, cpu, io, counters['result_records'], counters['compiled_files'])
                if fingerprint != previous:
                    last_activity = now
                previous = fingerprint
                with log.open(encoding='utf-8', errors='replace') as stream:
                    stream.seek(cursor)
                    new_text = stream.read()
                    cursor = stream.tell()
                for line in new_text.splitlines():
                    if line.startswith('GALAPAGOS_PROGRESS '):
                        try:
                            latest_event = json.loads(line.split(' ', 1)[1])
                            with event_path.open('a', encoding='utf-8') as events:
                                events.write(json.dumps(dict(observed_at=utc(), **latest_event)) + '\n')
                        except json.JSONDecodeError:
                            pass
                rc = proc.poll()
                quiet = int(now - last_activity)
                state = dict(state='running' if rc is None else ('stage_finished' if rc == 0 else 'failed'),
                    stage=stage, active=latest_event, stage_pid=proc.pid, heartbeat_at=utc(),
                    elapsed_seconds=int(now - start), idle_seconds=quiet,
                    warning='No log, result, CPU or disk activity; inspect this stage' if quiet >= idle_warning else None,
                    descendant_processes=nproc, process_cpu_ticks=cpu, process_disk_bytes=io,
                    expected_variants=expected, log=str(log), exit_code=rc, **counters)
                write_json(state_path, state)
                if rc is not None:
                    return rc
                time.sleep(poll_interval)
        except BaseException:
            proc.terminate()
            proc.wait()
            write_json(state_path, dict(state='interrupted', stage=stage, heartbeat_at=utc(), log=str(log)))
            raise


def snapshot(run):
    path = run / 'progress.json'
    if path.exists():
        return json.loads(path.read_text())
    steps = run / 'validation-steps.json'
    summary = run / 'summary.json'
    if steps.exists() and summary.exists():
        rows = json.loads(summary.read_text())
        stages = json.loads(steps.read_text())
        return dict(state='completed' if stages and all(s['exit_code'] == 0 for s in stages) else 'failed',
                    stage='saved results', result_records=sum(r['validation_records'] for r in rows),
                    expected_variants=sum(r['requested'] for r in rows), verified=sum(r['verified'] for r in rows))
    manifest = run / 'generation.json'
    if manifest.exists():
        data = json.loads(manifest.read_text())
        expected = sum(len(v) for v in data['selection'].values())
        replies = len(list(run.glob('replies/*/*.meta.json')))
        return dict(state='generation incomplete' if replies < expected else 'generation complete; validation pending',
                    stage='variant generation', generation_replies=replies, expected_replies=expected,
                    note='Counts show saved replies; incomplete generation may be running or stopped. See the run terminal.')
    return dict(state='not started', stage='waiting for run to be created')


def render(data):
    lines = [f"State: {data['state']}", f"Stage: {data.get('stage', '-')}"]
    active = data.get('active') or {}
    if active:
        lines.append('Working on: ' + ' / '.join(str(active.get(k, '-')) for k in ('project', 'function', 'variant', 'action')))
    if 'result_records' in data:
        lines.append(f"Finished variant records: {data['result_records']}/{data.get('expected_variants', '?')} (includes rejected variants)")
    if 'generation_replies' in data:
        lines.append(f"Saved model replies: {data['generation_replies']}/{data['expected_replies']}")
        lines.append(data['note'])
    if 'elapsed_seconds' in data:
        lines.append(f"Stage elapsed: {data['elapsed_seconds']}s; time without observed work: {data['idle_seconds']}s")
    heartbeat = data.get('heartbeat_at')
    if heartbeat and data['state'] == 'running':
        age = (dt.datetime.now(dt.timezone.utc) - dt.datetime.fromisoformat(heartbeat)).total_seconds()
        if age > 30:
            lines.append(f"WARNING: monitor has not updated for {int(age)} seconds; check whether it stopped or the PC slept")
    if data.get('warning'):
        lines.append('WARNING: ' + data['warning'])
    if data.get('log'):
        lines.append('Log: ' + data['log'])
    return '\n'.join(lines)


if __name__ == '__main__':
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('run', type=Path)
    ap.add_argument('--watch', action='store_true')
    args = ap.parse_args()
    while True:
        data = snapshot(args.run)
        if args.watch:
            print('\033[2J\033[H', end='')
        print(render(data), flush=True)
        if not args.watch or data['state'] in ('completed', 'failed', 'interrupted'):
            break
        time.sleep(5)
