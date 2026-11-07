# Partner snapshot and alignment audit

Snapshot: `1188d270` (pulled November 4, 2026). Counts below use only the first three reference functions in each dataset. They describe checked-in evidence, not rerun experiments.

| Run | Saved prompts | Saved replies | Subset result records | Compile alone | Compile in project | Tests recorded true | Verified |
|---|---:|---:|---:|---:|---:|---:|---:|
| baseline-r1 | 30 | 30 | 180 | 180 | 173 | 173 | 152 |
| context-r1 | 18 | 18 | 180 | 180 | 180 | 180 | 160 |
| cot-r1 | 18 | 18 | 0 | 0 | 0 | 0 | 0 |
| pilot | 30 | 30 | 0 | 0 | 0 | 0 | 0 |
| pilot-context | 5 | 0 | 0 | 0 | 0 | 0 | 0 |

Missing records do not establish a measured failure. The original baseline and pilot can contain replies for five functions per library; only their first-three subset is counted above. OpenSSL test flags represent skipped tests in the configured pipeline, not observed test executions.

## Alignment changes

- Current metadata now explicitly selects the first three functions per dataset.
- OpenSSL enables `-no-asm`, so keccak1600.c produces the required compiler artifacts.
- The libgcrypt submodule revision changed to `005292cf...`, following the upstream README workaround.
- `cot` and `context_cot` now request short approach/equivalence comments. Older stronger prompt versions are retained under `prompts/blocked-v1` and `blocked-v2`. Do not combine results from different prompt versions without labeling them.
- `count_results.py` counts the same four stages as the upstream table and now covers all six libraries. Our summary uses the same positive-count rule, adds missing-result labels and skipped-test policy, and filters to each run selection.
- Our baseline pilot remains unchanged and labeled as a one-function preliminary run, not a full repetition of the reduced study.

## Result retention and progress

Lincoln moves shared live folders into each run archive. Our runs use an independent workspace from the start, then copy outputs to their own `galapagos/` archive. Existing different evidence is never overwritten. Both layouts retain the scientific results; our layout also prevents stale build copies from crossing conditions.

The live viewer shows the stage, active function/variant, completed result records, elapsed time, CPU/disk/log activity, and a possible-stall warning after ten minutes without observed work. A separate stale-heartbeat warning detects a monitor that stopped updating. These are warnings, not proof of a hang. Monitoring does not change compiler, test, or verification options.

Detailed per-function counts, saved generation settings, and template-hash comparisons are in `partner-audit.json`. No experiments were launched by this audit.