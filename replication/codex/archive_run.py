"""Preserve run outputs without moving, deleting, or overwriting earlier evidence."""
import hashlib
import json
from pathlib import Path
import shutil


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
