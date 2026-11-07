# Galapagos replication: progress and pause checkpoint

**Initial setup and pilot completed at 9:06 p.m. November 3, 2026. Nothing is building or running now.** Scope remains: stop for Corey's review; do not start the full study or generate additional conditions. Latest machine-readable status: `replication/codex/pipeline-status.json`; setup log: `~/galapagos-setup.log` in Ubuntu.

## Initial result ready for review

November 4 alignment check completed after the app interruption: Windows and Ubuntu copies are at partner revision `1188d270`; all six checked pipeline source files match after normalizing CRLF/LF. libgcrypt is at `005292cf...`, OpenSSL's `-no-asm` change is present, and the metadata contains the first three functions per dataset. Ten integrity tests passed inside Ubuntu. No new experiment was started. The complete old pilot archive contains 67 preserved files with hashes.

Live progress and archive improvements are now implemented for future runs. See `RUNNING_IN_TERMINALS.md` for the one-condition launcher and independent progress viewer. The launcher preview was tested and confirms ALSA-only scope: three functions, 30 variants, one condition, one repetition. All ongoing work from this chat is stopped; run the launcher yourself when ready.

All final toolchain checks passed: LLVM/Clang 17, Alive2, custom linker, environment and Python imports. Both verifier controls passed (equivalent accepted; deliberately different rejected).

Baseline pilot: ALSA `alaw_to_s16`, requested model `gpt-6-astra`, medium effort, ten generated variants. All ten split and compiled in isolation. Seven compiled inside ALSA, passed its enabled test suite, and were verified equivalent. Three failed at the `llvm-as` project-integration stage and did not reach the later checks; these are not evidence of semantic inequivalence. See the run's `summary.json`, ten result records, and `logs/alsa-lib-usecase.log` before deciding whether to expand. No generated function bodies were repaired. No additional prompt conditions or full study were run.

## What is saved locally

- Project folder: `C:\COMS6650\FinalProject`, cloned from https://github.com/lio5599/galapagos-replication.
- Partner revision inspected: `28b91bcb` (October 31). Later work on the partner's machine is not visible here.
- Original `C:\COMS6650\Galapagos` and proposal/paper files remain untouched.
- New local scripts are under `replication/codex/`. These additions have not been pushed or committed.

## Partner's progress: evidence versus plans

The partner implemented a Claude Code subscription bridge, four prompt templates, WSL compiler setup, a pipeline runner, an archiver, and a progress utility. Generation uses fresh sessions, no tools, a neutral system instruction, fixed medium effort, ten requested variants per reference function, and saved prompts/replies/metadata. Temperature is not controlled. Metadata identifies the responding model as `claude-opus-5-5`.

The saved `baseline-r1` run contains 30 prompts and 30 replies: all five reference functions from all six libraries. Its saved validation logs cover ALSA and FFmpeg. The table reports:

| Library | Requested variants | Compile alone | Compile in project | Test pass recorded | Equivalent in saved table |
|---|---:|---:|---:|---:|---:|
| alsa-lib | 50 | 40 | 36 | 36 | 36 |
| ffmpeg | 50 | 50 | 47 | 47 | 20 |

These are the partner's saved table counts, not independently rerun results. The active result directories contain 40 ALSA and 50 FFmpeg JSON records. They are consistent with partial baseline validation but should be linked explicitly to the run before final analysis. Do not treat absent results for other projects as measured failures.

`pilot` also contains 30 baseline replies. `pilot-context` contains five prepared prompts and no replies. There is no checked-in evidence here of completed context, cot, or context_cot experiments, Qwen experiments, or new-model diversity/harnessing/miscompilation evaluations. Existing compiler-bug folders and GPT-4o archives include inherited artifacts and do not establish new experimental progress.

## What the counts mean

FFmpeg and ALSA are libraries/datasets, not individual functions. Each currently has five selected reference functions.

- Six libraries x five functions x ten variants = **300 variants per condition per model**.
- Six libraries x three functions x ten variants = **180 variants**, not 150.
- Six libraries x two functions x ten variants = **120 variants**.
- Exactly 150 variants would mean 15 reference functions in total, if keeping ten variants each.
- Four conditions multiply those counts by four; three repetitions multiply them by three again.

No reduced-function manifest was found in the partner snapshot: all metadata lists still have five functions per library, and baseline-r1 contains all 30 generation prompts. Corey has now confirmed the agreed subset: **the first three reference functions in each library's metadata list**. `replication/codex/selection-proposed-three.json` contains exactly that selection and is now confirmed. Use the same selection for both models and recompute the GPT-4o comparison on that subset.

## Local work completed

- Inspected the notes PDF, proposal, first three substantive sections of `sigconf.tex`, partner scripts, saved runs, and upstream differences.
- Ubuntu WSL is installed as **Ubuntu**, running **24.04.1**, whereas the partner describes Ubuntu 22.04. Record this environment difference.
- Ubuntu has approximately 15 GiB RAM, 20 logical CPUs, and ample virtual-disk free space.
- Installed the basic compiler/library build packages in Ubuntu. This installation finished before the pause.
- Confirmed Windows Codex CLI is installed and logged in using ChatGPT.
- Implemented an isolated Codex CLI bridge. It uses the partner's exact prompt templates, a neutral replacement instruction, fixed effort, fresh ephemeral sessions, read-only permissions, disabled shell/search, no API keys, and logs prompts, replies, events, usage, and settings. It rejects observed tool use. This is a Codex CLI session, not a continuation of this desktop conversation.
- **Completed one generation pilot:** `replication/codex/runs/corey-pilot-baseline`, using requested model `gpt-6-astra`, medium effort, ALSA's `alaw_to_s16`. The original-style splitter check finds **10/10 variants**. This establishes generation/formatting only: no compilation, equivalence, or diversity claim yet.
- Prepared `prepare_pipeline.py` for isolated validation workspaces, selection without renumbering functions, and bounded variant concurrency. It is not yet executed or integration-tested.
- Prepared `summarize_run.py`, a pilot selection, the now-confirmed first-three-per-library selection, and `setup_local.sh`.
- Six integrity tests pass inside Ubuntu: prompt assembly across all four conditions, saved pilot hashes/splitting, missing-result handling, skipped OpenSSL test labeling, explicit CLI settings, and preparation of a subset workspace preserving a nonzero function index and separate build paths.
- Independently confirmed the pilot prompt exactly matches Lincoln's saved baseline prompt for this function.
- Supplemental smoke check: all ten generated variants compile and match the reference for all 256 possible unsigned-char inputs at both `-O0` and `-O2`, using Ubuntu Clang 18.1.3. These 20 checks are not a Galapagos pipeline result and do not replace Alive2 verification.

## Setup not completed

Update after the first completed compiler build: LLVM/Clang finished successfully. At 6:39 p.m. November 3, Alive2 stopped on a missing `<cstdint>` include in `smt/smt.h` under GCC 13. A minimal, recorded compatibility patch adds that standard header; it does not change verification algorithms or generated code. Setup was resumed using the completed LLVM outputs, and the existing-pilot follow-on check was reattached. The second LLVM tree/custom linker and formal pilot results are still pending. The live `pipeline-status.json` remains the source for subsequent progress.

The earlier Linux-copy request was declined before the pause. After resumption, Corey authorized continued setup. The Linux build copy now exists at `/home/cbh/galapagos-replication`. Pinned verifier and benchmark submodules were downloaded; the source compiler builds are in progress. The user-owned build wrapper skips the already-completed system package installation. `finish_initial_pilot.py` is waiting for the active setup; after successful setup it runs verifier controls, validates the saved pilot, writes `summary.json`, and stops. A setup failure/interruption or failed pilot stage stops the follow-on check and is recorded in `pipeline-status.json`. No full-study loop or model generation is in that script. Toolchain readiness and formal validation are still pending, so no formal verification results should be claimed yet.

## Important experiment details

- The partner's notes explicitly say OpenSSL's test suite is disabled. Label it **skipped**, even if the published script records a true flag. Do not claim an actual test pass or assume the historical paper setup solely from these notes.
- ALSA `val_seg` has a reference/metadata return-type mismatch that can cause the splitter to find zero variants. Distinguish pipeline extraction problems from model semantic errors; decide and document a common policy before full comparisons.
- The authors' template/split scripts expect every metadata function and exactly ten variants. Subset runs need explicit selection handling; merely asking for three functions is insufficient.
- The original validation script schedules variants with asyncio, but blocking subprocess calls can serialize much of the work; compiler subprocesses also use `make -j4`. More concurrency can increase memory/disk pressure. The local wrapper caps outstanding variant tasks at two and uses separate run build directories. This is a scheduling limit, not demonstrated true parallel speedup.
- Existing library-copy directories can be reused by upstream code. Separate per-run directories prevent stale variant builds from contaminating later conditions.
- Original `validation_table.py` covers only four libraries and both languages. It is not a complete six-library, C-only subset report.
- `scripts/generate_variants.py` in the partner repo is a three-line constants shim, not the original generation implementation. Downstream imports currently use its constants. Some diversity scripts may depend on functions removed from that module; audit before expanding the evaluation.
- The final paper has initial project sections but still contains template content, placeholder authors/citations, unfilled results, and imprecise framework descriptions. No paper text was changed. Document the actual model/transport/setup once measured; do not assume the requested model label alone proves a resolved server model version.

## Resume order

1. Confirm reduced function names, repetitions, retry policy, exact prompts/model settings, and whether the newest partner results need to be pushed.
2. Finish the Linux copy and pinned toolchain setup after permission to resume. Keep source/control files under this Windows project folder, with build-heavy files inside Ubuntu.
3. Run syntax/unit checks on new scripts; test isolation, resume behavior, prompt parity, and result counting. Confirm the CLI configuration really excludes unintended tools/instructions.
4. Validate the saved ten-variant ALSA pilot end to end; include known-equivalent and deliberately non-equivalent controls for the verifier.
5. Inspect failures and report generated, split, compiled, tested/skipped, verified, and infrastructure-error counts separately.
6. Freeze an agreed selection manifest before running the four conditions. Keep raw replies immutable and avoid manual model-code repairs.
7. Add subset-matched GPT-4o baseline counts and, if included in final scope, diversity measurements. Harnessing, compiler-bug mitigation, and overhead are separate tasks; generation/verification alone does not replicate all paper claims.

## Sources

- Partner repository and local snapshot: https://github.com/lio5599/galapagos-replication
- `Proposal/COMS6650FinalProjectRandomNotes.pdf`
- `Proposal/proposal.txt`
- `Proposal/sigconf.tex`
- Codex non-interactive documentation: https://learn.chatgpt.com/docs/non-interactive-mode
- Codex configuration documentation: https://learn.chatgpt.com/docs/config-file/config-reference

This is a working project handoff, not final-paper prose.
