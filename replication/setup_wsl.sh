#!/usr/bin/env bash
# One-time setup of the Galápagos replication inside WSL (Ubuntu 22.04).
#
#   In PowerShell:   wsl -d Ubuntu-22.04
#   Then in Ubuntu:  bash /mnt/c/COMS6650/Galapagos/replication/setup_wsl.sh
#
# What it does (each step is skipped if already done, so re-running after an
# interruption picks up where it stopped):
#   1. checks the machine (WSL, Ubuntu 22.04, x86-64, memory, disk)
#   2. installs the build tools and library dependencies with apt (asks for your password)
#   3. clones your GitHub repo into ~/galapagos-replication (Linux line endings)
#      and downloads the submodules (LLVM, alive2, the six libraries) over https
#   4. copies this replication/ folder into the clone and applies galapagos-replication.patch
#   5. creates a Python environment (~/galapagos-venv) with the requirements and CMake >= 3.25
#   6. builds LLVM + clang for alive2, then alive2       (same options as scripts/verifier/build.sh)
#   7. builds LLVM release/17.x for the function linker, then the linker (linker/build_deps.sh + build.sh)
#   8. writes ~/galapagos-env.sh  (run `source ~/galapagos-env.sh` in every new terminal)
#   9. checks the result and compiles GPT-4o's ffmpeg variants as a quick test
#
# The builds take a few hours. Keep the window open and the laptop awake.
# Everything is logged to ~/galapagos-setup.log.
#
# Settings you can override:  REPO_URL, REPO, VENV, JOBS (parallel compile jobs)
set -euo pipefail

REPO_URL=${REPO_URL:-https://github.com/lio5599/galapagos-replication.git}
REPO=${REPO:-$HOME/galapagos-replication}
VENV=${VENV:-$HOME/galapagos-venv}
ENVFILE=$HOME/galapagos-env.sh
HERE=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
LOG=$HOME/galapagos-setup.log
exec > >(tee -a "$LOG") 2>&1

step() { echo; echo "=== [$(date '+%H:%M')] $*"; }
warn() { echo "WARNING: $*"; }
die()  { echo "ERROR: $*"; echo "(full log: $LOG)"; exit 1; }
CMAKE=/usr/bin/cmake   # Ubuntu's CMake for the LLVM builds; the venv's newer one is for liboqs

# ---------------------------------------------------------------- 1. checks --
step "1/9 Checking this machine"
grep -qi microsoft /proc/version || warn "this does not look like WSL"
. /etc/os-release
[ "${VERSION_ID:-}" = "22.04" ] || warn "this setup is written for Ubuntu 22.04; you are on ${PRETTY_NAME:-unknown}"
[ "$(uname -m)" = "x86_64" ] || die "Galápagos builds LLVM for x86-64 only; this machine is $(uname -m)"
case "$REPO" in /mnt/*) die "REPO must be inside the Linux home folder, not on the Windows drive ($REPO)";; esac
MEM_GB=$(awk '/MemTotal/ {printf "%d", $2/1024/1024}' /proc/meminfo)
SWAP_GB=$(awk '/SwapTotal/ {printf "%d", $2/1024/1024}' /proc/meminfo)
DISK_GB=$(df -BG --output=avail "$HOME" | tail -1 | tr -dc '0-9')
CPUS=$(nproc)
if [ -z "${JOBS:-}" ]; then JOBS=$(( MEM_GB / 2 )); [ "$JOBS" -lt 1 ] && JOBS=1; [ "$JOBS" -gt "$CPUS" ] && JOBS=$CPUS; fi
echo "CPUs: $CPUS   memory: ${MEM_GB} GB   swap: ${SWAP_GB} GB   free disk: ${DISK_GB} GB   parallel jobs: $JOBS"
[ "$MEM_GB" -ge 12 ] || warn "less than 12 GB of memory for WSL; LLVM builds may run out. Raise 'memory' in C:\\Users\\<you>\\.wslconfig"
[ "$DISK_GB" -ge 100 ] || warn "less than 100 GB free; the builds and library copies need a lot of space"
echo "Note: WSL's free space is limited by free space on C:, which may be less than shown above."

# ------------------------------------------------------------------ 2. apt --
step "2/9 Installing build tools and library dependencies (apt)"
PKGS=(
  build-essential git cmake ninja-build clang python3-pip python3-venv rsync file
  re2c z3 libz3-dev zlib1g-dev                                    # alive2 / LLVM
  unzip wget autoconf automake libtool libtool-bin gettext pkg-config texinfo   # autotools builds
  nasm yasm meson libass-dev libfreetype6-dev libgnutls28-dev libmp3lame-dev libsdl2-dev
  libva-dev libvdpau-dev libvorbis-dev libxcb1-dev libxcb-shm0-dev libxcb-xfixes0-dev   # ffmpeg
  libssl-dev astyle xsltproc doxygen graphviz valgrind            # liboqs
  fig2dev libgpg-error-dev                                        # libgcrypt
)
sudo apt-get update
AVAIL=(); MISSING=()
for p in "${PKGS[@]}"; do
  if apt-cache show "$p" >/dev/null 2>&1; then AVAIL+=("$p"); else MISSING+=("$p"); fi
done
sudo apt-get install -y "${AVAIL[@]}"
[ ${#MISSING[@]} -eq 0 ] || warn "not available on this Ubuntu, skipped: ${MISSING[*]}"

# ------------------------------------------------------- 3. clone + submodules --
step "3/9 Cloning $REPO_URL into $REPO"
if [ ! -d "$REPO/.git" ]; then
  git clone "$REPO_URL" "$REPO"
else
  echo "already cloned"
fi
cd "$REPO"
# Several submodules use git@github.com: addresses; fetch them over https
# without changing your global git settings.
GH=(-c url.https://github.com/.insteadOf=git@github.com:)
echo "Downloading submodules (LLVM is large; this can take a while)"
if ! git "${GH[@]}" submodule update --init --recursive --depth 1; then
  warn "shallow submodule download failed; retrying with full history"
  git "${GH[@]}" submodule update --init --recursive
fi

# --------------------------------------------------- 4. toolkit + patch --
step "4/9 Adding the replication scripts and applying the patch"
if [ "$HERE" != "$REPO/replication" ] && [ ! -d "$REPO/replication" ]; then
  rsync -a --exclude runs "$HERE/" "$REPO/replication/"
  echo "copied $HERE -> $REPO/replication"
fi
if grep -q "def variants_dir" scripts/generate_variants.py; then
  echo "patch already applied"
else
  git apply --check replication/galapagos-replication.patch \
    || die "the patch does not fit this version of the repo (were scripts/ files changed?)"
  git apply replication/galapagos-replication.patch
  echo "patch applied (git status will show the changed scripts; commit them when you are ready)"
fi

# ------------------------------------------------------------- 5. python --
step "5/9 Python environment at $VENV"
[ -x "$VENV/bin/python" ] || python3 -m venv "$VENV"
"$VENV/bin/pip" install -q --upgrade pip
"$VENV/bin/pip" install -q -r scripts/requirements.txt "cmake>=3.25,<3.28"
"$VENV/bin/pip" install -q -e scripts
echo "installed: $("$VENV/bin/cmake" --version | sed -n 1p)"

# ------------------------------------------------- 6. LLVM + alive2 --
LLVM_SRC=$REPO/scripts/verifier/llvm
ALIVE=$REPO/scripts/verifier/alive
[ -f "$LLVM_SRC/llvm/CMakeLists.txt" ] || die "LLVM submodule is empty ($LLVM_SRC)"
[ -f "$ALIVE/CMakeLists.txt" ] || die "alive2 submodule is empty ($ALIVE)"

step "6/9 Building LLVM + clang for alive2 (the longest step)"
# Same options as scripts/verifier/build.sh. Differences: no 'ninja install'
# (it needs root and stops that script before alive2 is built) and a limit on
# parallel link jobs to save memory; neither changes what is built.
mkdir -p "$LLVM_SRC/build"
if [ ! -f "$LLVM_SRC/build/build.ninja" ]; then
  (cd "$LLVM_SRC/build" && "$CMAKE" -GNinja -DLLVM_ENABLE_RTTI=ON -DLLVM_ENABLE_EH=ON -DBUILD_SHARED_LIBS=ON \
     -DCMAKE_BUILD_TYPE=Release -DLLVM_TARGETS_TO_BUILD=X86 -DLLVM_ENABLE_ASSERTIONS=ON \
     -DLLVM_ENABLE_PROJECTS="llvm;clang" -DLLVM_PARALLEL_LINK_JOBS=2 ../llvm)
fi
ninja -C "$LLVM_SRC/build" -j"$JOBS"

echo "Building alive2"
mkdir -p "$ALIVE/build"
if [ ! -f "$ALIVE/build/build.ninja" ]; then
  (cd "$ALIVE/build" && "$CMAKE" -GNinja -DCMAKE_PREFIX_PATH="$LLVM_SRC/build" -DBUILD_TV=1 -DCMAKE_BUILD_TYPE=Release ..)
fi
ninja -C "$ALIVE/build" -j"$JOBS"

# ---------------------------------------------- 7. linker + its LLVM --
step "7/9 Building LLVM release/17.x for the function linker, then the linker"
# linker/build_deps.sh clones all of llvm-project and builds clang, lld,
# compiler-rt and clang-tools-extra too. The linker only uses LLVM's IR
# libraries (see linker/lib, linker/tools), so this builds just LLVM from a
# shallow clone of the same branch, with the same compile flags.
DEPS=$REPO/linker/deps
if [ ! -d "$DEPS/llvm-project/llvm" ]; then
  git clone --depth 1 --branch release/17.x https://github.com/llvm/llvm-project.git "$DEPS/llvm-project"
fi
mkdir -p "$DEPS/llvm-Release-build" "$DEPS/llvm-Release-install"
if [ ! -f "$DEPS/llvm-Release-build/build.ninja" ]; then
  (cd "$DEPS/llvm-Release-build" && "$CMAKE" "$DEPS/llvm-project/llvm" -G Ninja \
     -DCMAKE_INSTALL_PREFIX="$DEPS/llvm-Release-install" -DLLVM_ENABLE_ASSERTIONS=OFF -DLLVM_FORCE_ENABLE_STATS=ON \
     -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_Z3_SOLVER=OFF -DLLVM_ENABLE_PROJECTS="llvm" \
     -DLLVM_TARGETS_TO_BUILD=X86 -DLLVM_PARALLEL_LINK_JOBS=1 \
     -DCMAKE_CXX_FLAGS="-DDISABLE_WRONG_OPTIMIZATIONS_DEFAULT_VALUE=true -DDISABLE_PEEPHOLES_DEFAULT_VALUE=true")
fi
ninja -C "$DEPS/llvm-Release-build" -j"$JOBS"

echo "Building the function linker"
mkdir -p "$REPO/linker/build"
(cd "$REPO/linker/build" && "$CMAKE" -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_CXX_COMPILER=clang++ ../ >/dev/null && make -j"$JOBS")

# ----------------------------------------------------------- 8. env file --
step "8/9 Writing $ENVFILE"
cat > "$ENVFILE" <<EOF
# Galápagos replication environment. Run this in every new terminal:
#   source ~/galapagos-env.sh
export GALAPAGOS=$REPO
export GALAPAGOS_CLONES=\${GALAPAGOS_CLONES:-\$HOME/galapagos-clones}
# LLVM 17 (the version alive2 is built on) must come first for clang/opt/llvm-dis/...
export PATH=$LLVM_SRC/build/bin:\$PATH
# Python packages and CMake >= 3.25 (needed by liboqs)
source $VENV/bin/activate
EOF
echo "written"

# -------------------------------------------------------------- 9. checks --
step "9/9 Checking the installation"
# shellcheck disable=SC1090
set +u; source "$ENVFILE"; set -u
ok=1
CLANG_V=$(clang --version 2>/dev/null || true)
[[ "$CLANG_V" == *"version 17"* ]] && echo "ok  clang is LLVM 17: $(command -v clang)" || { echo "BAD clang on PATH is not LLVM 17"; ok=0; }
[ -x "$ALIVE/build/alive-tv" ] && echo "ok  alive-tv built" || { echo "BAD alive-tv missing"; ok=0; }
[ -x "$REPO/linker/build/linker" ] && echo "ok  function linker built" || { echo "BAD linker missing"; ok=0; }
CMAKE_V=$(cmake --version 2>/dev/null | sed -n 1p || true)
[[ "$CMAKE_V" =~ 3\.(2[5-9]|[3-9][0-9]) ]] && echo "ok  $CMAKE_V (for liboqs)" || { echo "BAD CMake older than 3.25: $CMAKE_V"; ok=0; }
(cd "$REPO/scripts" && GALAPAGOS_VARIANTS=/tmp/gv GALAPAGOS_RESULTS=/tmp/gr python3 -c "import generate_variants, usecases.case, verifier, toml, yaml") \
  && echo "ok  Python packages and patched scripts import" || { echo "BAD Python imports failed"; ok=0; }

echo "Quick test: compiling GPT-4o's 50 ffmpeg C variants in isolation (paper: 50 of 50)"
T=$(mktemp -d)
src=$(ls -d "$REPO"/gpt4o-originals/ffmpeg*/variants/c 2>/dev/null | head -1 || true)
if [ -n "$src" ]; then
  mkdir -p "$T/variants/ffmpeg/c" && cp "$src"/*.c.raw "$T/variants/ffmpeg/c/"
  (cd "$REPO/scripts" && export GALAPAGOS_VARIANTS=$T/variants GALAPAGOS_RESULTS=$T/out \
     && python3 template_variants.py c ffmpeg && python3 compile_variants.py c ffmpeg >/dev/null 2>&1) || true
  n=$(ls "$T"/variants/ffmpeg/c/*.bc 2>/dev/null | wc -l)
  [ "$n" -eq 50 ] && echo "ok  $n of 50 compiled" || { echo "BAD only $n of 50 compiled"; ok=0; }
else
  echo "skipped (gpt4o-originals/ffmpeg* not found)"
fi
rm -rf "$T"

echo
echo "Not built: gollvm (needed only for the C-to-Go half; no script in the repo builds it)."
if [ $ok = 1 ]; then
  echo "Setup finished. Next:"
  echo "  source ~/galapagos-env.sh"
  echo "  bash $REPO/replication/smoke_test.sh     # full pipeline on one function with GPT-4o's variants"
else
  echo "Setup finished with problems (see BAD lines above and $LOG)."
  exit 1
fi
