#!/usr/bin/env bash
# One-time setup for running the published Galapagos pipeline (C-to-C) in WSL
# (Ubuntu 22.04). The only change to the Galapagos code is one line that says where
# library copies are built (CLONE_PATH in scripts/usecases/case.py).
#
#   bash ~/galapagos-replication/replication/claude/setup_wsl.sh
#
# Each step is skipped if it's already done, so it's safe to re-run.
#   1. checks the machine
#   2. installs build tools and the six libraries' dependencies (apt; asks for your password)
#   3. clones your repo and its submodules (LLVM, alive2, the six libraries), if not there yet
#   4. Galapagos code as published, apart from CLONE_PATH:
#        - undoes galapagos-replication.patch if it was applied
#        - sets CLONE_PATH to ~/galapagos-clones (the published value is the authors' own disk)
#        - compares the pipeline code with the authors' GitHub repository and lists any differences
#        - links ~/Galapagos to your repo (the code runs the linker from ~/Galapagos/...)
#   5. Python environment with Galapagos' requirements, plus CMake >= 3.25 (liboqs) and json2latex
#      (validation_table.py)
#   6. builds LLVM + clang, then alive-tv                  (options of scripts/verifier/build.sh)
#   7. builds LLVM release/17.x, then the authors' linker  (flags of linker/build_deps.sh)
#   8. writes ~/galapagos-env.sh (run `source ~/galapagos-env.sh` in every new terminal)
#   9. checks that everything Galapagos needs is in place
#
# Log: ~/galapagos-setup.log. Overridable: REPO_URL, REPO, VENV, JOBS.
set -euo pipefail

REPO_URL=${REPO_URL:-https://github.com/lio5599/galapagos-replication.git}
REPO=${REPO:-$HOME/galapagos-replication}
VENV=${VENV:-$HOME/galapagos-venv}
UPSTREAM=https://github.com/ASSERT-KTH/Galapagos.git   # the authors' published repository
ENVFILE=$HOME/galapagos-env.sh
LOG=$HOME/galapagos-setup.log
exec > >(tee -a "$LOG") 2>&1

step() { echo; echo "=== [$(date '+%H:%M')] $*"; }
warn() { echo "WARNING: $*"; }
die()  { echo "ERROR: $*"; echo "(full log: $LOG)"; exit 1; }
CMAKE=/usr/bin/cmake   # Ubuntu's CMake for the LLVM builds; the venv's newer one is for liboqs

# ---------------------------------------------------------------- 1. checks --
step "1/9 Checking this machine"
[ "$(uname -m)" = "x86_64" ] || die "Galapagos builds LLVM for x86-64 only; this machine is $(uname -m)"
case "$REPO" in /mnt/*) die "REPO must be inside the Linux home folder, not on the Windows drive ($REPO)";; esac
MEM_GB=$(awk '/MemTotal/ {printf "%d", $2/1024/1024}' /proc/meminfo)
DISK_GB=$(df -BG --output=avail "$HOME" | tail -1 | tr -dc '0-9')
CPUS=$(nproc)
if [ -z "${JOBS:-}" ]; then JOBS=$(( MEM_GB / 2 )); [ "$JOBS" -lt 1 ] && JOBS=1; [ "$JOBS" -gt "$CPUS" ] && JOBS=$CPUS; fi
echo "CPUs: $CPUS   memory: ${MEM_GB} GB   free disk: ${DISK_GB} GB   parallel jobs: $JOBS"
[ "$MEM_GB" -ge 12 ] || warn "less than 12 GB of memory for WSL; LLVM builds may run out"
[ "$DISK_GB" -ge 100 ] || warn "less than 100 GB free; Galapagos copies a whole library for every variant it tests"

# ------------------------------------------------------------------ 2. apt --
step "2/9 Installing build tools and library dependencies (apt)"
PKGS=(
  build-essential git cmake ninja-build clang python3-venv                     # general
  re2c z3 libz3-dev zlib1g-dev                                                 # LLVM / alive2
  autoconf automake libtool libtool-bin gettext pkg-config texinfo unzip wget  # autotools builds
  nasm yasm meson libass-dev libfreetype6-dev libgnutls28-dev libmp3lame-dev libsdl2-dev
  libva-dev libvdpau-dev libvorbis-dev libxcb1-dev libxcb-shm0-dev libxcb-xfixes0-dev   # ffmpeg
  libssl-dev astyle xsltproc doxygen graphviz valgrind                         # liboqs
  fig2dev libgpg-error-dev                                                     # libgcrypt
)
sudo apt-get update
AVAIL=(); MISSING=()
for p in "${PKGS[@]}"; do
  if apt-cache show "$p" >/dev/null 2>&1; then AVAIL+=("$p"); else MISSING+=("$p"); fi
done
sudo apt-get install -y "${AVAIL[@]}"
[ ${#MISSING[@]} -eq 0 ] || warn "not available on this Ubuntu, skipped: ${MISSING[*]}"

# ------------------------------------------------------- 3. clone + submodules --
step "3/9 Repository and submodules"
if [ ! -d "$REPO/.git" ]; then git clone "$REPO_URL" "$REPO"; else echo "already cloned: $REPO"; fi
cd "$REPO"
GH=(-c url.https://github.com/.insteadOf=git@github.com:)   # some submodules use git@ addresses
if ! git "${GH[@]}" submodule update --init --recursive --depth 1; then
  warn "shallow submodule download failed; retrying with full history"
  git "${GH[@]}" submodule update --init --recursive
fi

# --------------------------------------------- 4. Galapagos code as published --
step "4/9 Galapagos code: as published, apart from where library copies are built"
[ -f scripts/generate_variants.py ] || die "scripts/generate_variants.py is missing. split_variants.py, \
template_variants.py and compile_variants.py import it, so copy it back (e.g. from your gpt-4o-originals folder) and re-run."

# 4a. Undo the old patch (it redirected where variants are read and results written).
PATCH=$REPO/replication/galapagos-replication.patch
if grep -q "def variants_dir" scripts/generate_variants.py; then
  [ -f "$PATCH" ] || die "the old patch is applied, but $PATCH is missing, so it can't be undone automatically"
  git apply -R --check "$PATCH" || die "the old patch is applied, but undoing it doesn't fit (were those files edited since?). Look at: git diff"
  git apply -R "$PATCH"
  echo "undid galapagos-replication.patch (git status shows the restored files)"
else
  echo "galapagos-replication.patch is not applied"
fi

# 4b. The one change to the published code. Line 12 of scripts/usecases/case.py,
#       CLONE_PATH = f"/mnt/ssd1/javier/galapagos-clones"      (the authors' disk)
#     becomes
#       CLONE_PATH = f"{os.environ['HOME']}/galapagos-clones"  (same style as the file's other paths)
#     It changes only where tests.usecase builds library copies, not how anything is
#     compiled, tested or verified.
OLD_CLONE_LINE='CLONE_PATH = f"/mnt/ssd1/javier/galapagos-clones"'
NEW_CLONE_LINE="CLONE_PATH = f\"{os.environ['HOME']}/galapagos-clones\""
if grep -qxF "$NEW_CLONE_LINE" scripts/usecases/case.py; then
  echo "CLONE_PATH is already ~/galapagos-clones"
else
  grep -qxF "$OLD_CLONE_LINE" scripts/usecases/case.py \
    || die "scripts/usecases/case.py doesn't contain the published line '$OLD_CLONE_LINE'; look at it before going on"
  sed -i "s|^CLONE_PATH = f\"/mnt/ssd1/javier/galapagos-clones\"\$|$NEW_CLONE_LINE|" scripts/usecases/case.py
  echo "set CLONE_PATH to ~/galapagos-clones in scripts/usecases/case.py"
fi

# 4c. Compare the pipeline code with the authors' repository. Reports only; changes nothing.
CODE=(scripts/generate_variants.py scripts/split_variants.py scripts/template_variants.py
      scripts/compile_variants.py scripts/validation_table.py scripts/distance_utils.py
      scripts/sed-same-timestamp.sh scripts/requirements.txt scripts/setup.py
      scripts/tests/usecase.py scripts/usecases/case.py scripts/verifier/__init__.py
      scripts/verifier/verification.py functions/template.c
      linker/CMakeLists.txt linker/lib linker/tools linker/include
      ':(glob)functions/*/functions_info.json' ':(glob)functions/*/[0-9]_*.c')
if git fetch -q --depth 1 "$UPSTREAM" main 2>/dev/null; then
  DIFFS=$(git diff --name-only FETCH_HEAD -- "${CODE[@]}")
  # case.py is expected to differ in the CLONE_PATH line, and nowhere else.
  CASE_OTHER=$(git diff -U0 FETCH_HEAD -- scripts/usecases/case.py | grep -E '^[-+]' \
               | grep -vE '^(\+\+\+ |--- )' | grep -v '^[-+]CLONE_PATH = ' || true)
  [ -z "$CASE_OTHER" ] && DIFFS=$(echo "$DIFFS" | grep -vx 'scripts/usecases/case.py' || true)
  if [ -z "$DIFFS" ]; then
    echo "pipeline code and reference functions match $UPSTREAM (main), apart from the CLONE_PATH line"
  else
    warn "these files differ from the authors' repository:"
    echo "$DIFFS" | sed 's/^/    /'
    echo "  See a difference:  git diff FETCH_HEAD -- <file>"
    echo "  Restore a file:    git checkout FETCH_HEAD -- <file>"
    echo "  (If the authors changed their repository after you copied it, a difference can come from their side.)"
  fi
else
  warn "couldn't reach $UPSTREAM; skipped the comparison"
fi

# 4d. Paths the code uses.
#     - the linker and sed-same-timestamp.sh are run from ~/Galapagos/...
if [ ! -e "$HOME/Galapagos" ] || [ -L "$HOME/Galapagos" ]; then
  ln -sfn "$REPO" "$HOME/Galapagos"
  echo "~/Galapagos -> $REPO"
elif [ "$(cd "$HOME/Galapagos" && pwd -P)" != "$(cd "$REPO" && pwd -P)" ]; then
  die "~/Galapagos exists and isn't your repo. Move it away, then re-run."
fi
#     - library copies. Must be a real folder, not a link: for liboqs, Galapagos rewrites
#       build paths by matching this exact path.
CLONES=$HOME/galapagos-clones
[ -L "$CLONES" ] && die "$CLONES is a link; it must be a real folder"
mkdir -p "$CLONES"
echo "library copies are built in $CLONES"
if [ -d /mnt/ssd1/javier/galapagos-clones ]; then
  echo "Note: /mnt/ssd1/javier/galapagos-clones (made by the previous version of this script) is no longer used."
  echo "      Remove it (only works while it's empty): sudo rmdir /mnt/ssd1/javier/galapagos-clones /mnt/ssd1/javier /mnt/ssd1"
fi

# ------------------------------------------------------------- 5. python --
step "5/9 Python environment at $VENV"
[ -x "$VENV/bin/python" ] || python3 -m venv "$VENV"
"$VENV/bin/pip" install -q --upgrade pip
"$VENV/bin/pip" install -q -r scripts/requirements.txt "cmake>=3.25,<3.28" json2latex
"$VENV/bin/pip" install -q -e scripts          # as the Galapagos README says
echo "installed: $("$VENV/bin/cmake" --version | sed -n 1p)"

# ------------------------------------------------- 6. LLVM + alive2 --
LLVM_SRC=$REPO/scripts/verifier/llvm
ALIVE=$REPO/scripts/verifier/alive
[ -f "$LLVM_SRC/llvm/CMakeLists.txt" ] || die "LLVM submodule is empty ($LLVM_SRC)"
[ -f "$ALIVE/CMakeLists.txt" ] || die "alive2 submodule is empty ($ALIVE)"
step "6/9 LLVM + clang for alive2, then alive2 (skipped if already built)"
# Options of scripts/verifier/build.sh, without its 'ninja install' (needs root) and with fewer
# parallel link jobs (saves memory). Neither changes what is built.
mkdir -p "$LLVM_SRC/build"
if [ ! -f "$LLVM_SRC/build/build.ninja" ]; then
  (cd "$LLVM_SRC/build" && "$CMAKE" -GNinja -DLLVM_ENABLE_RTTI=ON -DLLVM_ENABLE_EH=ON -DBUILD_SHARED_LIBS=ON \
     -DCMAKE_BUILD_TYPE=Release -DLLVM_TARGETS_TO_BUILD=X86 -DLLVM_ENABLE_ASSERTIONS=ON \
     -DLLVM_ENABLE_PROJECTS="llvm;clang" -DLLVM_PARALLEL_LINK_JOBS=2 ../llvm)
fi
ninja -C "$LLVM_SRC/build" -j"$JOBS"
mkdir -p "$ALIVE/build"
if [ ! -f "$ALIVE/build/build.ninja" ]; then
  (cd "$ALIVE/build" && "$CMAKE" -GNinja -DCMAKE_PREFIX_PATH="$LLVM_SRC/build" -DBUILD_TV=1 -DCMAKE_BUILD_TYPE=Release ..)
fi
ninja -C "$ALIVE/build" -j"$JOBS"

# ---------------------------------------------- 7. linker + its LLVM --
step "7/9 LLVM release/17.x for the linker, then the linker (skipped if already built)"
# linker/build_deps.sh builds all of llvm-project; the linker only uses LLVM's IR libraries,
# so this builds just LLVM, from the same branch with the same compile flags.
DEPS=$REPO/linker/deps
[ -d "$DEPS/llvm-project/llvm" ] || git clone --depth 1 --branch release/17.x https://github.com/llvm/llvm-project.git "$DEPS/llvm-project"
mkdir -p "$DEPS/llvm-Release-build" "$DEPS/llvm-Release-install"
if [ ! -f "$DEPS/llvm-Release-build/build.ninja" ]; then
  (cd "$DEPS/llvm-Release-build" && "$CMAKE" "$DEPS/llvm-project/llvm" -G Ninja \
     -DCMAKE_INSTALL_PREFIX="$DEPS/llvm-Release-install" -DLLVM_ENABLE_ASSERTIONS=OFF -DLLVM_FORCE_ENABLE_STATS=ON \
     -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_Z3_SOLVER=OFF -DLLVM_ENABLE_PROJECTS="llvm" \
     -DLLVM_TARGETS_TO_BUILD=X86 -DLLVM_PARALLEL_LINK_JOBS=1 \
     -DCMAKE_CXX_FLAGS="-DDISABLE_WRONG_OPTIMIZATIONS_DEFAULT_VALUE=true -DDISABLE_PEEPHOLES_DEFAULT_VALUE=true")
fi
ninja -C "$DEPS/llvm-Release-build" -j"$JOBS"
mkdir -p "$REPO/linker/build"
(cd "$REPO/linker/build" && "$CMAKE" -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_CXX_COMPILER=clang++ ../ >/dev/null && make -j"$JOBS")

# ----------------------------------------------------------- 8. env file --
step "8/9 Writing $ENVFILE"
cat > "$ENVFILE" <<EOF
# Galapagos environment. Run in every new terminal:  source ~/galapagos-env.sh
export GALAPAGOS=$REPO
# LLVM 17 (the version alive2 is built on) first, for clang / opt / llvm-dis
export PATH=$LLVM_SRC/build/bin:\$PATH
# Galapagos' Python packages, CMake >= 3.25 (liboqs), json2latex
source $VENV/bin/activate
EOF
echo "written"

# -------------------------------------------------------------- 9. checks --
step "9/9 Checking"
set +u; source "$ENVFILE"; set -u
ok=1
check() { if eval "$2"; then echo "ok   $1"; else echo "BAD  $1"; ok=0; fi; }
check "clang on PATH is LLVM 17"                      '[[ "$(clang --version 2>/dev/null)" == *"version 17"* ]]'
check "alive-tv built"                                '[ -x "$ALIVE/build/alive-tv" ]'
check "linker built, at ~/Galapagos/linker/build/linker" '[ -x "$HOME/Galapagos/linker/build/linker" ]'
check "~/Galapagos/scripts/sed-same-timestamp.sh runs" '[ -x "$HOME/Galapagos/scripts/sed-same-timestamp.sh" ]'
check "CLONE_PATH in case.py is ~/galapagos-clones"   'grep -qxF "$NEW_CLONE_LINE" scripts/usecases/case.py'
check "$CLONES is a writable folder"                  '[ -d "$CLONES" ] && [ -w "$CLONES" ] && [ ! -L "$CLONES" ]'
check "CMake >= 3.25 (liboqs)"                        '[[ "$(cmake --version | sed -n 1p)" =~ 3\.(2[5-9]|[3-9][0-9]) ]]'
check "old patch not applied"                         '! grep -q "def variants_dir" scripts/generate_variants.py'
check "Galapagos scripts and packages import"         '(cd scripts && python3 -c "import generate_variants, usecases.case, verifier, toml, yaml, json2latex")'

echo
if [ $ok = 1 ]; then
  echo "Setup finished. In every new terminal: source ~/galapagos-env.sh"
  echo "Then see $REPO/replication/claude/README.md"
else
  echo "Setup finished with problems (BAD lines above; full log: $LOG)."
  exit 1
fi
