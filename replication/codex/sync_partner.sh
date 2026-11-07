#!/usr/bin/env bash
# Align source/data revision; preserve built tools, local header fixes and saved runs.
set -euo pipefail
SOURCE=/mnt/c/COMS6650/FinalProject
REPO=$HOME/galapagos-replication
cd "$REPO"
git -c fetch.recurseSubmodules=false fetch "$SOURCE" main
git -c submodule.recurse=false merge --ff-only --no-stat FETCH_HEAD
git -c url.https://github.com/.insteadOf=git@github.com: submodule update --init use_cases/libgcrypt
cp -a "$SOURCE/replication/codex/." "$REPO/replication/codex/"
python3 - "$REPO" "$SOURCE" <<'PY'
import hashlib, json, pathlib, subprocess, sys
base, source = map(pathlib.Path, sys.argv[1:])
files = ['scripts/tests/usecase.py','scripts/split_variants.py','scripts/template_variants.py',
         'scripts/compile_variants.py','scripts/usecases/case.py','scripts/verifier/verification.py']
matches = {p: (base/p).read_text() == (source/p).read_text() for p in files}
record = dict(revision=subprocess.check_output(['git','rev-parse','HEAD'], cwd=base,text=True).strip(),
              core_pipeline_matches=matches,
              libgcrypt_revision=subprocess.check_output(['git','rev-parse','HEAD'], cwd=base/'use_cases/libgcrypt',text=True).strip(),
              note='No builds or experiments started. Existing Alive2 header fixes and run workspaces retained.')
(source/'replication/codex/alignment.json').write_text(json.dumps(record,indent=2))
print(json.dumps(record,indent=2))
if not all(matches.values()):
    raise SystemExit('Pipeline source mismatch: inspect before any new experiments')
PY
