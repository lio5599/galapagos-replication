# Galápagos replication with Claude Code (C-to-C)

Only one step here is new: **generating the variants**. `generate_variants_claude.py` writes
the same file, in the same place and form, that the authors' `scripts/generate_variants.py`
wrote. Everything after that is the published Galápagos code. The one exception is a single
line, `CLONE_PATH` in `scripts/usecases/case.py`, changed from the authors' disk
(`/mnt/ssd1/javier/galapagos-clones`) to `~/galapagos-clones`. It changes where library copies
are built, not how anything is compiled, tested or verified. Report it as a path change.

| Step | Code | Output |
|---|---|---|
| Generate 10 variants per function | **`generate_variants_claude.py` (new)** | `functions/<project>/variants/c/<i>_<name>.c.variants` |
| Split into 10 variants | Galápagos `split_variants.py` | `…/variants/c/<i>_<name>_<j>.c.raw` |
| Wrap in a test file | Galápagos `template_variants.py` | `…/variants/c/<i>_<name>_<j>.c` |
| Compile in isolation | Galápagos `compile_variants.py` | `…/variants/c/<i>_<name>_<j>.ll`, `.bc` |
| Compile in project, run tests, alive-tv | Galápagos `tests.usecase` | `scripts/out/<project>/c/<i>_<name>/*.result.json` |
| Table 4 counts | Galápagos `validation_table.py` | printed (saved in `runs/<run>/logs/`) |

The shell scripts don't do any Galápagos work themselves:
- `setup_wsl.sh` (once) installs and builds what Galápagos needs, and makes the `CLONE_PATH`
  change. It leaves the rest of the code as published.
- `run_galapagos.sh` types the five Galápagos commands above for you, in the authors' order.
- `archive_run.sh` moves a finished run's outputs out of the Galápagos folders, so the next
  condition starts empty. Galápagos always writes to the same folders.

`prompts/` holds the four C-only prompts, one file per condition. `<REFERENCE FUNCTION>` is
replaced with `functions/<project>/<i>_<name>.c` and `<NUMBER>` with 10. With the baseline
file, the prompt is identical to what `generate_variants.py` built for C-to-C, except that
"int in C is equal to int32 in Go." is removed.

## 1. One-time setup (Ubuntu)

**Claude Code, signed in with your subscription:**
```bash
curl -fsSL https://claude.ai/install.sh | bash   # then open a new terminal
claude                                           # choose your Claude account (Pro), finish sign-in, /exit
claude auth status                               # "authMethod": "claude.ai"
echo "$ANTHROPIC_API_KEY"                        # must print an empty line
```
On claude.ai, check that **Settings > Usage > Usage credits** is off. If it's on, Claude Code
keeps going past your plan's limit and bills API rates. The generator refuses to run on an API
key or a cloud-provider login, checks this again before every prompt, and removes those
variables from every run it starts.

**Galápagos:** run `bash setup_wsl.sh` once. It skips anything already built. It also:
- undoes `galapagos-replication.patch`
- sets `CLONE_PATH` to `~/galapagos-clones` and creates that folder
- checks the pipeline code against the authors' GitHub repository. The `CLONE_PATH` line should
  be the only difference.
- links `~/Galapagos` to your repo, because the code runs the authors' linker from
  `~/Galapagos/linker/build/linker`
- adds `json2latex` for `validation_table.py`

**Keep `scripts/generate_variants.py` in place.** `split_variants.py`, `template_variants.py`
and `compile_variants.py` import it, so if it was moved to `gpt-4o-originals`, copy it back.
Importing it never calls OpenAI.

In every new terminal, run `source ~/galapagos-env.sh` first.

## 2. Pilot: one project

`split_variants.py` processes every function of a project, so pilot on a whole project
(5 prompts):
```bash
cd ~/galapagos-replication/replication/claude
python3 generate_variants_claude.py --condition baseline --run pilot --model opus --effort medium --projects alsa-lib
./run_galapagos.sh pilot alsa-lib
./archive_run.sh pilot
```
Check `runs/pilot/replies/alsa-lib/*.meta.json`: `model_usage` shows which model answered.

## 3. The study

Use the same `--model` and `--effort` for every run. Each run is generate, then Galápagos,
then archive:
```bash
for r in 1 2 3; do
  for cond in baseline context cot context_cot; do
    run=$cond-r$r
    [ -d runs/$run/galapagos ] && continue      # already finished and archived
    python3 generate_variants_claude.py --condition $cond --run $run --model opus --effort medium || break 2
    ./run_galapagos.sh $run
    ./archive_run.sh $run || break 2
  done
done
```
If the loop stops partway (Ctrl+C, or the usage limit didn't reset within 8 hours), run the
same loop again. Archived runs are skipped, and the unfinished run continues from its last
saved reply.
The generator can be stopped (Ctrl+C) and re-run, and it continues where it stopped. At your
plan's usage limit it waits 20 minutes and retries, for up to 8 hours in total. It refuses to start
while another run's files are still in the Galápagos folders.

## What each run folder keeps

| Path | Contents |
|---|---|
| `runs/<run>/prompts/<project>/<i>_<name>.txt` | the exact prompt sent |
| `runs/<run>/replies/<project>/<i>_<name>.txt` | Claude's raw reply |
| `runs/<run>/replies/<project>/<i>_<name>.meta.json` | model, tokens, time, how many variants Galápagos' splitter will find |
| `runs/<run>/generation.json` | Claude Code version, model, effort, all flags |
| `runs/<run>/logs/` | output of each Galápagos step, including the Table 4 counts |
| `runs/<run>/galapagos/` | Galápagos' variant and result folders, after `archive_run.sh` |

## Things to know

- **Galápagos' splitter needs exactly 10 functions per reply.** `template_variants.py` stops at
  the first function with fewer, and functions after it in that project aren't templated. If
  the splitter crashes on a reply (unbalanced braces, or more than 20 matches), the whole
  project gets no compiled variants, because `template_variants.py` and `compile_variants.py`
  re-run the splitter when they start. The
  generator warns when this will happen. `--max-attempts 2` asks again in that case, keeping
  every attempt. The default is 1, which never asks again. Pick one and use it for every run.
- **`val_seg` (alsa-lib) can't be split as published.** `functions_info.json` says its return
  type is `static inline int`, but `functions/alsa-lib/4_val_seg.c` says `static int`.
  GPT-4o's variants happened to use `static inline int`. If Claude keeps the reference's
  signature, the splitter finds 0 variants and all 10 count as failures.
- **`validation_table.py` counts only 4 projects:** alsa-lib, ffmpeg, libsodium and openssl.
  libgcrypt and liboqs are left out unless you add them to its `projects` list.
- **This isn't the paper's API call.** Temperature can't be set. Each prompt runs in a fresh
  `claude -p` with a one-line system prompt ("You are a helpful assistant."), no tools, and
  one turn. Report this setup in your write-up.
