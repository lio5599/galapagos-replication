"""Archive the already-completed pilot; no compilation or model calls."""
import json
from pathlib import Path
from archive_run import archive

run = Path(__file__).resolve().parent / 'runs/corey-pilot-baseline'
workspace = Path(json.loads((run/'validation-workspace.json').read_text())['path'])
stages = json.loads((run/'validation-steps.json').read_text())
assert stages and all(s['exit_code'] == 0 for s in stages), 'Pilot stages not completed'
selection = json.loads((run/'generation.json').read_text())['selection']
print('Archived existing pilot files:', archive(workspace, run, selection, complete=True))
