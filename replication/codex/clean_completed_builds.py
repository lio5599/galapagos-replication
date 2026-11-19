"""Reclaim Ubuntu build copies for completed, archived study runs."""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess
import sys


WORKER = r'''
import shutil
import sys
from pathlib import Path

def main():
    workspace = Path.home().resolve() / 'galapagos-corey-runs'
    if not workspace.is_dir() or workspace.resolve() != workspace:
        raise SystemExit(f'Expected a real workspace directory: {workspace}')
    targets = []
    allowed = {f'corey-study-{d}-{c}-r{r}' for d in ('alsa-lib', 'libsodium', 'libgcrypt', 'liboqs', 'ffmpeg')
               for c in ('baseline', 'context', 'cot', 'context_cot') for r in range(1, 4)}
    allowed.remove('corey-study-libgcrypt-baseline-r1')
    allowed.add('corey-study-libgcrypt-baseline-r1-recheck')
    allowed.add('corey-study-liboqs-baseline-r2-recheck')
    allowed.add('corey-study-liboqs-cot-r3-retry')
    allowed.add('corey-study-ffmpeg-baseline-r1-bounded-retry')
    for name in sys.argv[2:]:
        if name not in allowed:
            raise SystemExit(f'Unexpected run name: {name}')
        target = workspace / name / 'build-copies'
        if target.resolve() != target:
            raise SystemExit(f'Unexpected linked workspace: {target}')
        if not target.exists():
            continue
        if not target.is_dir():
            raise SystemExit(f'Not a directory: {target}')
        targets.append(target)
        print(f'Eligible: {target}', flush=True)

    if sys.argv[1] != 'apply':
        print(f'Preview only: {len(targets)} build-copy folders eligible; nothing deleted.')
        return
    for proc in Path('/proc').glob('[0-9]*/cmdline'):
        try:
            argv = proc.read_bytes().split(b'\0')
        except OSError:
            continue
        if any(x.rsplit(b'/', 1)[-1] in (b'prepare_pipeline.py', b'validate_run.sh', b'tests.usecase') for x in argv):
            raise SystemExit('Validation is active. Stop it before cleaning up.')
    for target in targets:
        if target.resolve() != target:
            raise SystemExit(f'Workspace changed during review: {target}')
        print(f'Removing: {target}', flush=True)
        shutil.rmtree(target)
        print(f'Removed: {target}', flush=True)
    print(f'Removed {len(targets)} build-copy folders. Saved archives are unchanged.')


main()
'''


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument('--apply', action='store_true', help='Remove the reviewed Ubuntu build-copy directories')
    mode.add_argument('--archives-only', action='store_true', help='Check archives on Windows without starting Ubuntu')
    args = parser.parse_args()
    if sys.platform != 'win32':
        parser.error('Run with Windows Python from PowerShell, not inside Ubuntu')
    runs = Path(__file__).resolve().parent / 'runs'
    verified = []
    for dataset in ('alsa-lib', 'libsodium', 'libgcrypt', 'liboqs', 'ffmpeg'):
        for condition in ('baseline', 'context', 'cot', 'context_cot'):
            for rep in range(1, 4):
                name = f'corey-study-{dataset}-{condition}-r{rep}'
                if name in ('corey-study-libgcrypt-baseline-r1', 'corey-study-liboqs-baseline-r2'):
                    name += '-recheck'
                if name == 'corey-study-liboqs-cot-r3':
                    name += '-retry'
                if name == 'corey-study-ffmpeg-baseline-r1':
                    name += '-bounded-retry'
                saved = runs / name
                if dataset in ('liboqs', 'ffmpeg') and not (saved / 'archive-manifest.json').is_file():
                    continue
                manifest = json.loads((saved / 'archive-manifest.json').read_text())
                summary = json.loads((saved / 'summary.json').read_text())
                if not manifest['validation_stages_completed'] or sum(row['validation_records'] for row in summary) != 30:
                    raise SystemExit(f'Incomplete archive: {name}')
                archive = (saved / 'galapagos').resolve()
                entries = manifest['files']
                if sum(p.endswith('.result.json') for p in entries) != 30:
                    raise SystemExit(f'Missing archived result records: {name}')
                for relative, expected in entries.items():
                    file = (archive / relative).resolve()
                    if not file.is_relative_to(archive) or hashlib.sha256(file.read_bytes()).hexdigest() != expected:
                        raise SystemExit(f'Archive integrity check failed: {name}/{relative}')
                verified.append(name)
                print(f'Archive verified on Windows: {name}', flush=True)
    if args.archives_only:
        print(f'{len(verified)} archives verified. Ubuntu was not started.')
        return
    print('Checking Ubuntu build paths (no archive reads from Ubuntu)...', flush=True)
    result = subprocess.run(['wsl.exe', '-d', 'Ubuntu', '--exec', '/usr/bin/python3', '-S', '-',
                             'apply' if args.apply else 'preview', *verified], input=WORKER.encode('ascii'))
    raise SystemExit(result.returncode)


if __name__ == '__main__':
    main()
