#!/usr/bin/env bash
# Explicit continuation after approval: builds may take hours. No model calls.
set -euo pipefail
SOURCE=/mnt/c/COMS6650/FinalProject
REPO=${REPO:-$HOME/galapagos-replication}
export REPO
export JOBS=${JOBS:-4}
if [ ! -d "$REPO/.git" ]; then
  git clone --no-hardlinks "$SOURCE" "$REPO"
  git -C "$REPO" remote set-url origin https://github.com/lio5599/galapagos-replication.git
fi
mkdir -p "$REPO/replication/codex"
cp -a "$SOURCE/replication/codex/." "$REPO/replication/codex/"
# System dependencies were installed separately with explicit approval. Avoid an
# interactive sudo prompt when resuming the long user-owned builds.
python3 - "$REPO" <<'PY'
import pathlib, sys
root = pathlib.Path(sys.argv[1])
text = (root / 'replication/claude/setup_wsl.sh').read_text()
start = text.index('sudo apt-get update')
end = text.index('# ------------------------------------------------------- 3. clone + submodules')
text = text[:start] + 'echo "System packages installed separately; skipping apt in build phase"\n\n' + text[end:]
marker = 'LLVM_SRC=$REPO/scripts/verifier/llvm'
text = text.replace(marker, 'python3 "$REPO/replication/codex/apply_build_fixes.py" "$REPO"\n' + marker, 1)
(root / 'replication/codex/setup_build_only.sh').write_text(text)
PY
bash "$REPO/replication/codex/setup_build_only.sh"
