# Run and watch one condition in your own terminals

## Study runs: one dataset at a time

In two PowerShell terminals, start in `C:\COMS6650\FinalProject`. In the first terminal run `.\replication\codex\Run-Dataset.ps1 -Dataset alsa-lib`. In the second run `.\replication\codex\Run-Dataset.ps1 -Dataset alsa-lib -Watch`. Replace `alsa-lib` in both commands with `ffmpeg`, `libgcrypt`, `liboqs`, `libsodium`, or `openssl` for the other datasets. Add `-Preview` to the first command to print the plan without starting or writing anything.

Each dataset runs four prompt conditions, three repetitions, and ten variants for each of its three functions: 12 archived runs and 360 requested variants per dataset. The model is `gpt-6-astra` at medium effort. Run names include the dataset, condition, and repetition. The previous ALSA test run stays separate. The watcher follows the current run automatically.

Reissuing a stopped batch with the same arguments keeps completed archives and resumes matching saved generation. An interrupted validation workspace is retained and requires inspection before retrying. Use `-Series <new-name>` on both commands only when you want an independent new series. Keep the experiment terminal open and run one dataset at a time.

The application interruption did not erase the local setup or saved pilot. Your partner's latest source is checked out at `1188d270`; the final line-ending-normalized alignment check is recorded in `replication/codex/alignment.json`. No new experiment was launched while preparing these instructions.

## Terminal 1: the experiment

Open a **new PowerShell tab in Windows Terminal**. Run:

```powershell
cd C:\COMS6650\FinalProject
.\replication\codex\Run-Condition.ps1 -Condition baseline -Run corey-alsa-baseline-r1
```

This example runs only the first three ALSA functions, ten variants each, for one baseline repetition: **30 variants**. It generates via your existing ChatGPT/Codex login, validates through the built Ubuntu toolchain, archives the outputs, writes the summary, and stops. It does not run the other conditions or all six datasets. Run the command yourself only when ready to begin that experiment.

To see the plan without generating, compiling, or writing anything, add `-Preview`.

To run another condition later, change both `-Condition` and `-Run`. Conditions: `baseline`, `context`, `cot`, `context_cot`. Use a unique run name for each condition and repetition. Keep the model and effort fixed across comparable runs. The default selection is `replication/codex/selection-alsa.json`; the confirmed six-dataset selection is a separate file and is never selected automatically.

Keep this terminal open and the computer awake. The run is launched from your terminal rather than this chat; a chat interruption does not intentionally stop it. Closing the run terminal or sleeping/restarting the PC can interrupt local work. Nothing is uploaded or pushed to GitHub by this launcher.

The bridge discovers Codex from PATH or the desktop app's installation directory. You do not need to edit your system PATH. To check discovery and the existing ChatGPT login without sending a prompt, run `python .\replication\codex\check_codex.py`. A launch that stopped with "Codex CLI missing" made no model calls; rerun the same command and run name after updating the bridge.

## Terminal 2: live progress

Open another PowerShell tab:

```powershell
cd C:\COMS6650\FinalProject
python .\replication\codex\progress.py .\replication\codex\runs\corey-alsa-baseline-r1 --watch
```

Use the same run name as Terminal 1. You can open the viewer before the run starts. It only reads progress and never starts or changes an experiment.

- During generation: number of saved replies (three replies, each requesting ten variants).
- During Galapagos: current stage, dataset/function/variant, finished result records, elapsed time, and time without observed work.
- After completion: final state. The viewer exits when a completed/failed run is observed.
- A possible-stall warning appears after ten minutes with no observed log growth, new result, CPU activity, or disk activity.
- A stale-heartbeat warning means the monitor has not updated for over 30 seconds. Check Terminal 1; this can also happen if the computer slept.

Quiet logs alone do not mean a hang: compiler or solver CPU/disk work counts as activity. The warnings are signals to investigate, not proof of a stuck process. The viewer never kills or regenerates anything automatically.

## Inspect logs and results

Each run lives in `replication/codex/runs/<run>/`:

| Item | Purpose |
|---|---|
| `progress.json` | Latest validation state |
| `progress-events.jsonl` | Stage/function/variant event history |
| `logs/` | Full command output for diagnosis |
| `summary.json` | Counts at compilation, project integration, tests, equivalence |
| `prompts/`, `replies/` | Exact prompts, raw model replies, settings and hashes |
| `galapagos/` | Archived source/compiled variants and individual result records |
| `archive-manifest.json` | Saved file hashes and whether stages completed |

For a log that is currently growing, use the path printed by the viewer. For the ALSA project-validation stage, for example:

```powershell
Get-Content .\replication\codex\runs\corey-alsa-baseline-r1\logs\alsa-lib-usecase.log -Tail 25 -Wait
```

Press Ctrl+C to stop watching that log; this does not stop Terminal 1's experiment. Similarly, closing only Terminal 2 does not stop the experiment.

Earlier runs are not overwritten: each gets an independent Ubuntu workspace and its own Windows archive. If validation is interrupted, retain the logs/workspace and diagnose it before retrying; the launcher deliberately refuses to reuse an existing validation workspace. Generation alone can resume matching saved replies, with hash checks.
