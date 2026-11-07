"""Read-only source/version verification, normalizing Windows/Linux line endings."""
import json
from pathlib import Path
import subprocess

base = Path.home()/'galapagos-replication'
source = Path(__file__).resolve().parents[2]
files = ['scripts/tests/usecase.py','scripts/split_variants.py','scripts/template_variants.py',
         'scripts/compile_variants.py','scripts/usecases/case.py','scripts/verifier/verification.py']
matches = {p: (base/p).read_text() == (source/p).read_text() for p in files}
record = dict(revision=subprocess.check_output(['git','rev-parse','HEAD'],cwd=base,text=True).strip(),
              core_pipeline_matches=matches,
              comparison='Source text with CRLF/LF normalized; no semantic changes ignored',
              libgcrypt_revision=subprocess.check_output(['git','rev-parse','HEAD'],cwd=base/'use_cases/libgcrypt',text=True).strip(),
              note='No builds or experiments started. Alive2 standard-header fixes retained.')
(source/'replication/codex/alignment.json').write_text(json.dumps(record,indent=2))
print(json.dumps(record,indent=2))
if not all(matches.values()):
    raise SystemExit('Actual source mismatch: inspect before experiments')
