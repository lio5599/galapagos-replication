"""Preserve run outputs without moving, deleting, or overwriting earlier evidence."""
import hashlib
import json
from pathlib import Path
import shutil


def clean_archived_builds(workspace, run, expected_records):
    """Remove reference builds only after a complete archive passes hash checks."""
    expected_workspace = Path.home().resolve() / 'galapagos-corey-runs' / run.name
    if workspace != expected_workspace or workspace.resolve() != expected_workspace:
        raise ValueError(f'Unexpected validation workspace: {workspace}')
    builds = workspace / 'build-copies'
    if builds.resolve() != builds or not builds.is_dir():
        raise ValueError(f'Unexpected build-copy directory: {builds}')
    manifest = json.loads((run / 'archive-manifest.json').read_text())
    entries = manifest['files']
    records = sum(name.endswith('.result.json') for name in entries)
    if not manifest['validation_stages_completed'] or records != expected_records:
        print('Build copies retained: archive has incomplete validation records.', flush=True)
        return
    archive_root = (run / 'galapagos').resolve()
    for name, expected_hash in entries.items():
        file = (archive_root / name).resolve()
        if not file.is_relative_to(archive_root) or hashlib.sha256(file.read_bytes()).hexdigest() != expected_hash:
            raise ValueError(f'Archive integrity check failed: {name}')
    shutil.rmtree(builds)
    print('Verified archive hashes; removed completed run build copies.', flush=True)


def archive(workspace, run, projects, complete):
    archive_root = run / 'galapagos'
    for project in projects:
        pairs = [(workspace / 'functions' / project, archive_root / 'functions' / project),
                 (workspace / 'scripts/out' / project, archive_root / 'out' / project)]
        for source, target in pairs:
            if not source.exists():
                continue
            for p in source.rglob('*'):
                if not p.is_file():
                    continue
                dest = target / p.relative_to(source)
                dest.parent.mkdir(parents=True, exist_ok=True)
                if dest.exists():
                    if dest.read_bytes() != p.read_bytes():
                        raise FileExistsError(f'Refusing to overwrite different archived evidence: {dest}')
                else:
                    shutil.copy2(p, dest)
    hashes = {str(p.relative_to(archive_root)): hashlib.sha256(p.read_bytes()).hexdigest()
              for p in archive_root.rglob('*') if p.is_file()}
    manifest = run / 'archive-manifest.json'
    record = dict(validation_stages_completed=complete, files=hashes,
                  note='Independent run directory; original workspace retained; no prior run overwritten')
    if manifest.exists() and json.loads(manifest.read_text()) != record:
        raise FileExistsError('Archive manifest would change; inspect before replacing evidence')
    manifest.write_text(json.dumps(record, indent=2))
    return len(hashes)
