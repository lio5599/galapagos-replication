# Replication scripts

This folder holds the scripts for replicating Galápagos with variants written by Claude in
a chat. Nothing here calls a model API. You paste prompts into Claude chats by hand, and the
scripts run the authors' own validation pipeline on the replies.

```
make_prompts.py -> [you: Claude chat] -> ingest_variants.py -> run_validation.sh -> tabulate.py
```

## 1. One-time setup (WSL, Ubuntu 22.04)

The pipeline only runs on Linux. In PowerShell:

```powershell
wsl -d Ubuntu-22.04
```

Then in Ubuntu:

```bash
bash /mnt/c/COMS6650/Galapagos/replication/setup_wsl.sh
```

`setup_wsl.sh` does everything below. Each step is skipped if it's already done, so if it
stops, fix the problem and run the same command again.

1. Checks the machine: WSL, Ubuntu 22.04, x86-64, memory and disk.
2. Installs build tools and library dependencies with `apt`. It asks for your Ubuntu password.
3. Clones `github.com/lio5599/galapagos-replication` into `~/galapagos-replication`, in
   Linux's own folders with Linux line endings. Then downloads the submodules (LLVM, alive2,
   the six libraries) over https.
4. Copies this `replication/` folder into the clone and applies `galapagos-replication.patch`.
5. Creates a Python environment, `~/galapagos-venv`, with the requirements and CMake 3.25 or
   newer (liboqs needs it; Ubuntu 22.04 ships 3.22).
6. Builds LLVM + clang and alive2, with the options from `scripts/verifier/build.sh`.
7. Builds LLVM release/17.x and the function linker (`linker/build_deps.sh` and `build.sh`).
8. Writes `~/galapagos-env.sh`.
9. Checks the result and compiles GPT-4o's 50 ffmpeg variants as a quick test.

The builds take a few hours. Keep the window open and the laptop plugged in and awake.
Everything is logged to `~/galapagos-setup.log`.

Before starting, give WSL enough memory if you can. Create `C:\Users\<you>\.wslconfig` with
the lines below, then run `wsl --shutdown` in PowerShell:

```
[wsl2]
memory=12GB
swap=16GB
```

**Every new terminal:** `source ~/galapagos-env.sh`. This puts LLVM 17 first on your PATH,
activates the Python environment and sets `GALAPAGOS`.

**Check that it reproduces the authors' results** (30–90 minutes):

```bash
source ~/galapagos-env.sh
bash ~/galapagos-replication/replication/smoke_test.sh            # alsa-lib iec958_parity
bash ~/galapagos-replication/replication/smoke_test.sh ffmpeg mix  # any other C function
```

This runs the full pipeline on one function with GPT-4o's own variants from
`gpt4o-originals/` and prints your counts next to the authors'.

From now on, work in `~/galapagos-replication` inside Ubuntu. The Windows copy
(`C:\COMS6650\Galapagos`) is just your archive. Commit and push from the Ubuntu clone, and
open its files from Windows at `\\wsl.localhost\Ubuntu-22.04\home\<you>\galapagos-replication`.

## 2. What the patch changes

The patch touches only `scripts/`. The validation logic itself (compile, put the variant into
the library, run its tests, run alive-tv) is unchanged.

| file | change |
|---|---|
| `generate_variants.py` | your stub, plus the one place that sets where variants are read from (`$GALAPAGOS_VARIANTS`) and where results are written (`$GALAPAGOS_RESULTS`). Both are required, so nothing falls back to another folder. |
| `split_variants.py`, `template_variants.py`, `compile_variants.py`, `tests/usecase.py` | use those two settings instead of `functions/<project>/variants/<lang>` and `scripts/out` |
| `split_variants.py` | no longer re-runs when other scripts import it (it overwrote the `.raw` files) |
| `compile_variants.py` | when a variant fails to compile, also deletes an older `.bc` of the same name, which would otherwise be tested as this variant |
| `tests/usecase.py` | keeps at most 2 library copies at a time (`GALAPAGOS_MAX_LIVE_COPIES`) and deletes each copy once its result is saved (`GALAPAGOS_KEEP_COPIES=1` keeps them). The original made a copy for every variant at once. Only disk use changes; the heavy steps already ran one at a time. Each result also records its variant number and language. |
| `usecases/case.py` | library copies go to `$GALAPAGOS_CLONES` (default `~/galapagos-clones`), not the authors' `/mnt/ssd1/javier/...`; linker and helper paths are relative to the repo; a copy left by an earlier run is replaced, not reused |

## 3. Running the study

One run = one prompt condition × one repetition, in its own folder under `replication/runs/`.

```bash
source ~/galapagos-env.sh
cd ~/galapagos-replication/replication

# a) prompts and empty reply files (start with C only: 30 chats)
python3 make_prompts.py --run runs/baseline-r1 --condition baseline --langs c \
    --model "Claude <model name as shown in the chat>" --notes "extended thinking off; web search off"

# b) for each line of runs/baseline-r1/CHECKLIST.txt: open a NEW Claude chat, paste the prompt,
#    copy the whole reply (copy button under the message) into the matching responses/ file

# c) replies -> exactly 10 variant files per function
python3 ingest_variants.py --run runs/baseline-r1

# d) validate, project by project (--isolation-only first for a quick look)
for p in alsa-lib ffmpeg libgcrypt liboqs libsodium openssl; do
  ./run_validation.sh runs/baseline-r1 $p c
done

# e) counts per function, in the same columns as the paper's Table 4
python3 tabulate.py --run runs/baseline-r1
```

The conditions are `baseline`, `context`, `cot` and `context_cot`, defined in `prompts.py`.
`baseline` matches the original prompt exactly (`python3 prompts.py` checks this). The
`context` and `cot` texts are drafts for your team to edit and then freeze. For a pilot on one
function, use `--functions mix` on `make_prompts.py` and `--function mix` on
`run_validation.sh`.

**Keep chat runs comparable:**
- Use a new chat per prompt, with no Project, custom instructions, style or memory.
- Use the same model and extended-thinking setting throughout, and record them with `--notes`.
- The chat has no temperature control (the paper used 1.0). Report that as a deviation.
- Repeat each condition in separate run folders (`-r1`, `-r2`, `-r3`).

## 4. What `ingest_variants.py` handles

The original splitter finds variants by searching for the function's return type (e.g.
`static int`) or the word `func`. Explanations in a reply break it, and every
chain-of-thought reply contains them. `ingest_variants.py`:

- takes code from fenced blocks and saves the remaining text to `explanations/`
- splits at real function definitions, starting each variant where the original splitter
  would have. On GPT-4o's 600 replies it reproduces the authors' split files exactly, and the
  C half then compiles 298 of 300, as in Table 4.
- counts every top-level function toward the 10, so helpers and renamed copies still fail
  later, as in the paper. Missing variants become placeholders that fail to compile, so they
  are counted as failures.
- for Go, renames functions whose names differ from the expected Go name
  (`fn_bc_name_go`, which the authors took from GPT-4o's own spellings) only in case or
  underscores, and logs each rename in `ingest_report.json`. `--no-go-rename` turns this off.

## 5. Notes for the write-up

- The paper's "Verif." column comes from a stricter recheck recorded in
  `scripts/eq_variants.json` (97 C / 73 Go). The automated alive-tv check in the pipeline
  gives 122 / 112 for GPT-4o. Compare models on the automated number. Table 4's C column also
  adds up to 102 while the text says 97.
- C-to-Go needs gollvm's `llvm-goc` at `linker/deps/llvm-Release-build-go/bin/`, and no script
  builds it. gollvm supports only x86_64 and aarch64 Linux.
- `setup_wsl.sh` builds the linker's LLVM with only the parts the linker uses (LLVM's IR
  libraries, x86 target). It skips clang, lld, compiler-rt and clang-tools-extra to save
  hours; the linker code doesn't use them.

## Files

| file | role |
|---|---|
| `setup_wsl.sh` | one-time setup in WSL |
| `smoke_test.sh` | full pipeline on one function with GPT-4o's variants, compared with the authors' results |
| `make_prompts.py` | prompt files, empty reply files and a checklist |
| `prompts.py` | baseline prompt (exact copy of the original) plus draft context/CoT text |
| `ingest_variants.py` | replies -> 10 `.raw` files per function, plus `ingest_report.json` |
| `run_validation.sh` | runs the authors' validation for one run, project and language |
| `tabulate.py` | Table-4-style counts -> CSV |
| `galapagos-replication.patch` | the `scripts/` changes listed above, made for this repo |
