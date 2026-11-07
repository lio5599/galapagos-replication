# Corey's local Codex experiment

Start with [the project status report](../../PROJECT_STATUS.md). This folder is separate from Lincoln's Claude runs and never writes into his active `functions/*/variants` or `scripts/out` folders.

For a run in your own terminal, follow [Running in terminals](../../RUNNING_IN_TERMINALS.md). The launcher defaults to the three ALSA functions and one condition/repetition. Nothing runs until you invoke it.

## Layout

- Windows source and saved results: `C:\COMS6650\FinalProject`
- Ubuntu toolchain and pinned library sources: `/home/cbh/galapagos-replication`
- Ubuntu per-run validation workspaces: `/home/cbh/galapagos-corey-runs/<run>`
- Codex outputs: `replication/codex/runs/<run>` in the Windows source copy

The Windows CLI uses the existing ChatGPT sign-in. It does not automate clicking this conversation or inherit this chat's messages. It starts one fresh CLI session per reference function. The pilot uses the configured family `gpt-6-astra`, explicit medium effort. CLI inference still uses plan allowance and may hit usage limits. Temperature is not set. This is not an exact replacement for the paper's API transport; report the harness difference.

## Setup / resume build

From PowerShell:

```powershell
wsl -d Ubuntu -- bash /mnt/c/COMS6650/FinalProject/replication/codex/setup_local.sh
```

This creates a Linux build copy, reuses the already-installed system dependencies, and invokes the partner's build steps. It downloads pinned submodules and builds two LLVM trees, Alive2, and the custom linker. Expect a substantial build. Logs: `~/galapagos-setup.log`. If interrupted, rerun the same command. It skips existing build outputs. After completion, check every final status line; absence of an error is not enough if a check is marked BAD.

## Generation

From `C:\COMS6650\FinalProject`:

```powershell
python replication/codex/generate_variants_codex.py --condition baseline --run corey-pilot-baseline --model gpt-6-astra --effort medium --dry-run
python replication/codex/generate_variants_codex.py --condition baseline --run corey-pilot-baseline --model gpt-6-astra --effort medium
```

The existing baseline pilot is already generated, so repeating the command preserves it. Each raw reply has a hash. There is one attempt per function; the bridge does not regenerate bad code automatically. `--dry-run` only prepares prompts. Other conditions: `context`, `cot`, `context_cot`. Pick a new run name for each condition/repetition. Do not reuse a run name with different settings.

`selection-pilot.json` contains one ALSA function. Corey confirmed that the study subset is the first three metadata functions in each library; `selection-proposed-three.json` contains that list. The name is retained for compatibility. Six libraries times three reference functions times ten variants gives 180 variants per condition/model/repetition. The full study has not been authorized to run yet.

## Current initial-check job

The toolchain build is running in Ubuntu. `finish_initial_pilot.py` waits for that active setup to finish, then runs a known-equivalent and known-different verifier control, the existing baseline pilot, and its summary. It makes no model calls and contains no study loop. Its live state is saved in `pipeline-status.json` beside this README. A failed/interrupted setup or failed stage stops the job and records the log location. Do not launch a second copy while one is running.

## Validation

Once setup checks pass, from Ubuntu:

```bash
source ~/galapagos-env.sh
python3 /mnt/c/COMS6650/FinalProject/replication/codex/prepare_pipeline.py \
  --base ~/galapagos-replication \
  --run-dir /mnt/c/COMS6650/FinalProject/replication/codex/runs/corey-pilot-baseline \
  --jobs 2 --execute
```

This makes an isolated workspace, retains original function indices, filters unselected functions in the original split/template/compile loops, and caps concurrent variant tasks. The generated function bodies are not edited. All local changes are recorded in `validation-workspace.json` and the Linux workspace's `local_changes.json`.

Upstream uses asyncio tasks but also blocking subprocess calls. A task limit prevents excessive overlap; it does not promise a twofold speedup. Do not run multiple conditions in a shared working directory. A failed stage stops this wrapper and preserves logs/workspace for diagnosis.

## See progress while validation runs

Double-click `Watch-Progress.cmd` to view the saved pilot. For any future run, from the project folder:

```powershell
python replication/codex/progress.py replication/codex/runs/RUN-NAME --watch
```

It refreshes every five seconds and shows the current stage, function/variant, completed result records (including rejections), elapsed time, and activity. Ten minutes without observed log/result/CPU/disk progress produces a possible-stall warning. A stale heartbeat produces a separate warning that the monitor itself stopped updating. Neither proves a hang, and the viewer never kills or restarts an experiment automatically. It only reads status; opening it does not start a run. A completed run displays its final state and exits.

Future validation automatically saves a full `galapagos/functions/.../variants/c` and `galapagos/out/.../c` archive under its own run directory, plus a hash manifest. Existing different evidence cannot be overwritten. The Linux workspace is retained. Even a failed stage preserves available partial outputs and is labeled incomplete. The old pilot has also been archived without rerunning it.

## Count saved results

```powershell
python replication/codex/summarize_run.py replication/codex/runs/corey-pilot-baseline
python replication/codex/test_local.py
```

Keep generated, split, compilation, tests run/skipped, equivalence, and infrastructure errors distinct. OpenSSL's configured test result is skipped, not an observed pass. Missing validation records are NOT VALIDATED. The original paper's four-project table is not suitable as-is for a six-library reduced subset.

Do not hand-edit generated variants, discard difficult functions after seeing outcomes, or compare a selected subset to the original paper's whole-dataset totals. Keep fixes to the harness separate and apply the same documented policy to all models and conditions.
