# Replication problems and observations

Working evidence log for the replication study. Keep failed attempts separate from usable measurements.

## FFmpeg baseline repetition 1 — Texinfo compatibility failure

- **Symptom:** All 30 variants compiled in isolation. The unmodified FFmpeg reference build then stopped while generating `doc/ffmpeg.html`, before any project validation records were produced.
- **Cause:** The installed `makeinfo` failed to load FFmpeg's `doc/t2h.pm` because the module called the unavailable `Texinfo::Config::set_from_init_file` routine.
- **Fix and recheck:** The local runner passes `--disable-doc` to FFmpeg's configure step. The recheck uses the same saved variants. Use the recheck for baseline repetition 1 once validation and archive checks pass. Keep the original attempt as evidence of a build compatibility failure and exclude it from the variant pass rate.

Evidence: [original build log](replication/codex/runs/corey-study-ffmpeg-baseline-r1/logs/ffmpeg-usecase.log), [local runner fix](replication/codex/prepare_pipeline.py).

## liboqs baseline repetition 2 — CMake paths break after relocating builds

- **Symptom:** All 30 variants compiled in isolation, but CMake failed during project compilation for all 30. The archive passed its checksum checks. The 0/30 verification count reflects a build infrastructure failure.
- **Cause:** Galápagos removed every occurrence of `/build` when deriving the variant source directory. Our replication runner placed variant workspaces under `build-copies`, so the rewrite changed that directory to `-copies`. CMake then looked for source files at a path that did not exist. The path rewrite came from Galápagos, and our workspace layout exposed the bug.
- **Fix and recheck:** The local runner now takes the parent of liboqs's CMake build directory, preserving `build-copies`. The recheck reused the saved generation inputs and verified 26 of 30 variants, with no infrastructure or pipeline errors. All 169 archived files matched their checksums.
- **Reporting:** Use `corey-study-liboqs-baseline-r2-recheck` as the official baseline repetition 2 result. The batch and cleanup runners use this archive. Keep the original `corey-study-liboqs-baseline-r2` archive as evidence of the build failure and exclude it from prompt comparisons.

Recheck evidence: [counts](replication/codex/runs/corey-study-liboqs-baseline-r2-recheck/summary.json), [archive manifest](replication/codex/runs/corey-study-liboqs-baseline-r2-recheck/archive-manifest.json).

Evidence: [original CMake log](replication/codex/runs/corey-study-liboqs-baseline-r2/logs/liboqs-usecase.log), [original counts](replication/codex/runs/corey-study-liboqs-baseline-r2/summary.json), [local runner fix](replication/codex/prepare_pipeline.py).

## 2026-11-08 — libgcrypt context output exposes a splitter limitation

- **Symptom:** The reference passed, but all ten `ctz` variants failed isolated compilation. The other 20 variants passed all stages. The archive contains all 30 records and passed checksum verification.
- **Cause:** The saved `ctz` reply contains `#include <stdint.h>` before function bodies. The splitter searches for the return-type substring `int` and can match it inside `stdint.h`, leaving an invalid `int.h>` fragment in the C file. Clang rejects it, and the later missing-bitcode errors are downstream effects.
- **Reporting:** Keep the original end-to-end result (20/30 verified) and report the ten rejections as extraction/compilation failures, not semantic failures. No manual repair or regeneration was performed. Any evaluation with a corrected splitter should be reported separately and applied consistently across conditions.

Evidence: [raw reply](replication/codex/runs/corey-study-libgcrypt-context-r1/replies/libgcrypt/1_ctz.txt), [compile log](replication/codex/runs/corey-study-libgcrypt-context-r1/logs/libgcrypt-compile_variants.log), [run counts](replication/codex/runs/corey-study-libgcrypt-context-r1/summary.json).

## 2026-11-08 — libgcrypt test failures caused by copied Git metadata

- **Symptom:** In `corey-study-libgcrypt-baseline-r1`, all 30 variants compiled in isolation and 29 compiled in libgcrypt, but none passed the project tests. The unmodified reference also failed 31 of its 36 executed tests, with two more not run. Repeated errors reported a version mismatch.
- **Diagnosis:** The copied submodule's `.git` file pointed to `../../.git/modules/use_cases/libgcrypt`. That relative path no longer resolved from the temporary build directory. libgcrypt's Autotools version generation could not read the pinned Git revision, and the resulting `VERSION` and `GCRYPT_VERSION` definitions were empty. A read-only check supplying the original Git directory restored version `1.11.0` for pinned revision `005292cf`.
- **Fix:** In the local runner's libgcrypt reference build copy, use an absolute pointer to the pinned submodule's Git metadata. Run the unmodified reference through the same test suite before testing any variants; stop if the reference fails. No generated code, prompts, pinned commit, test rules, or Alive2 settings were changed.
- **Retest:** `corey-study-libgcrypt-baseline-r1-recheck` reused byte-identical prompts, replies, and variant inputs. The reference passed. Of 30 variants, 30 compiled alone and 29 compiled in the project, passed the suite, and verified equivalent. The remaining `ctz` variant failed during IR assembly with `llvm-as`, before testing. All 169 files in the recheck archive matched their saved checksums.
- **Reporting:** Use the recheck as libgcrypt baseline repetition 1. Retain the initial zero-verification archive as an infrastructure failure, excluded from prompt comparisons and repetition counts.
- **Replication lesson:** A build can compile even when source version metadata is broken. Run a reference control before testing generated code, and account for Git submodule metadata when relocating source trees.

Evidence: [original log](replication/codex/runs/corey-study-libgcrypt-baseline-r1/logs/libgcrypt-usecase.log), [recheck log](replication/codex/runs/corey-study-libgcrypt-baseline-r1-recheck/logs/libgcrypt-usecase.log), [recheck counts](replication/codex/runs/corey-study-libgcrypt-baseline-r1-recheck/summary.json), [recorded harness changes](replication/codex/runs/corey-study-libgcrypt-baseline-r1-recheck/validation-workspace.json).

## 2026-11-07 — Build-copy retention and WSL storage pressure

- The Ubuntu WSL image reached about 129 GiB while saved Windows scripts and run files were only about 143 MiB. The image contains other Ubuntu data, so these figures are not a project-only disk measurement.
- Each validation run retained temporary copies of the library builds. Archiving results did not remove those copies, so disk demand accumulated across runs. WSL also became intermittently unresponsive; the cause of the startup hang was not established.
- Preserve archived results and interrupted-run evidence. Verify checksums before removing disposable copies from completed runs. Use one condition/repetition at a time and check host free space in between; this changes scheduling, not the experiment design.
