# Generating the variants with Qwen3.6-27B

Only the generation step changes. It runs on Nova as one batch job: the job starts Qwen
on a GPU node, sends it all the prompts, saves the replies and stops. You copy the replies
to your laptop, and from there everything is the same as for the Claude runs:
`run_galapagos.sh`, `count_results.py`, `archive_run.sh` and Galápagos itself.

| | Claude runs | Qwen runs |
|---|---|---|
| Generator | `generate_variants_claude.py` (`claude -p`, on the laptop) | `generate_variants_qwen.py` (vLLM, on a Nova GPU node) |
| Prompts | `prompts/*.txt` | the same four files |
| Reply handling | Galápagos' `parse_response`, split check | identical (imported from the Claude generator) |
| System prompt | "You are a helpful assistant." | the same |
| Thinking | Claude Code `--effort medium` (hidden) | off |
| Sampling | can't be set | temperature 0.7, top_p 0.8, top_k 20, min_p 0, presence_penalty 0, repetition_penalty 1.0, max_tokens 16384 |
| Run names | `baseline-r1` … | `qwen-baseline-r1` … |

Thinking is off so that the CoT conditions test the reasoning the prompt asks for (the `//`
comments) on its own. The sampling values are Qwen's recommended non-thinking settings,
except presence_penalty: Qwen suggests 1.5, but each reply repeats the same signature ten
times, and a presence penalty pushes the model to vary repeated text, i.e. the signature
Galápagos needs unchanged. All settings are recorded in `runs/<run>/generation.json`, and
the generator refuses to continue a run with different ones.

## 1. One-time setup on Nova

vLLM (about 10–15 GB installed) and the model (about 55 GB) don't fit in a Nova home
folder's quota, so they go in your group's work folder. Call it `WORKDIR`.

In a Nova shell (login node):
```bash
export WORKDIR=/work/<group>/<netid>   # your space in your group's work folder (ls /work; ask your advisor)
mkdir -p $WORKDIR
module avail python                 # pick a Python 3.10–3.12 module, e.g.:
module load python/3.11             # (use the exact name module avail shows)
python3 -m venv $WORKDIR/vllm-env
source $WORKDIR/vllm-env/bin/activate
pip install --no-cache-dir --upgrade pip
pip install --no-cache-dir "vllm>=0.19.0" huggingface_hub
export HF_HOME=$WORKDIR/hf-cache
hf download Qwen/Qwen3.6-27B        # once; compute nodes may have no internet
```
`--no-cache-dir` stops pip from keeping a copy of every download in your home folder.

## 2. Copy the generation files to Nova

The job needs the generator, the prompts and the reference functions, and nothing else
from Galápagos. In WSL on your laptop, pack them:
```bash
cd ~/galapagos-replication
tar czf ~/galapagos-qwen.tgz functions/*/functions_info.json functions/*/[0-9]_*.c \
  replication/claude/generate_variants_qwen.py replication/claude/generate_variants_claude.py \
  replication/claude/qwen_generate.sbatch replication/claude/prompts
```
Copy `galapagos-qwen.tgz` to your Nova home folder, either with
`scp ~/galapagos-qwen.tgz <netid>@nova.its.iastate.edu:~/` or with however you normally
move files to Nova. To get it into Windows first: `cp ~/galapagos-qwen.tgz /mnt/c/Users/linco/Downloads/`.
Then, on Nova:
```bash
mkdir -p ~/galapagos-qwen && tar xzf ~/galapagos-qwen.tgz -C ~/galapagos-qwen
cd ~/galapagos-qwen/replication/claude
python3 generate_variants_qwen.py --condition cot --run qwen-check --dry-run   # "18 prompts written": files are in place
rm -rf runs/qwen-check
```
This keeps the same folder layout as on your laptop, so nothing needs a path setting.

## 3. Generate all four conditions (one job)

On Nova, from that folder. Pass the same `WORKDIR` and Python module as in step 1. The job
keeps vLLM's caches there too:
```bash
cd ~/galapagos-qwen/replication/claude
WORKDIR=/work/<group>/<netid> PYMODULE=python/3.11 sbatch qwen_generate.sbatch
squeue -u $USER                     # PD = waiting for a GPU, R = running
tail -f qwen-gen-<jobid>.log        # Ctrl+C stops watching, not the job
```
The log shows the model loading (5–10 minutes), then one line per prompt, as on your laptop.
After the first `ok`, check that the first reply looks right:
```bash
head -25 runs/qwen-baseline-r1/replies/alsa-lib/0_alaw_to_s16.txt   # C functions, no other text
```
If it doesn't, cancel with `scancel <jobid>`.

It runs baseline, context, cot and context_cot in turn (72 prompts; probably a few hours)
and stops the server at the end. If it runs out of time or stops, submit it again: saved
replies are skipped. Watch for `WARNING` lines: a reply that won't split into 10 variants,
or one cut off at max_tokens. `vllm-<jobid>.log` has the server's own log if loading fails.

## 4. Copy the replies to your laptop

On Nova:
```bash
cd ~/galapagos-qwen/replication/claude
tar czf ~/qwen-runs-r1.tgz runs/qwen-*-r1
```
Copy `qwen-runs-r1.tgz` to your laptop (`scp <netid>@nova.its.iastate.edu:~/qwen-runs-r1.tgz ~/`,
or your usual way), then in WSL:
```bash
tar xzf ~/qwen-runs-r1.tgz -C ~/galapagos-replication/replication/claude
ls ~/galapagos-replication/replication/claude/runs     # qwen-baseline-r1 … qwen-context_cot-r1
```
If you downloaded it into Windows, use `/mnt/c/Users/linco/Downloads/qwen-runs-r1.tgz` instead of `~/qwen-runs-r1.tgz`.

## 5. Each condition through Galápagos (laptop)

One condition at a time, as for the Claude runs. The first command writes Galápagos'
`.variants` files from the saved replies. It contacts no server:
```bash
cd ~/galapagos-replication/replication/claude && source ~/galapagos-env.sh
python3 generate_variants_qwen.py --condition baseline --run qwen-baseline-r1   # "All 18 replies are already saved"
```
Then run the three tmux sessions:
```bash
./run_galapagos.sh qwen-baseline-r1 ffmpeg                       # g1
./run_galapagos.sh qwen-baseline-r1 openssl alsa-lib libsodium   # g2
./run_galapagos.sh qwen-baseline-r1 libgcrypt liboqs             # g3
```
When all six are done, count, archive and reset:
```bash
python3 count_results.py --csv runs/qwen-baseline-r1/table4.csv | tee runs/qwen-baseline-r1/table4.txt
./archive_run.sh qwen-baseline-r1
find ~/galapagos-clones -mindepth 1 -maxdepth 1 -name '*-c' -exec rm -rf {} +
cp -r runs/. /mnt/c/Users/linco/Documents/galapagos-runs/
```
Repeat for `context`, `cot` and `context_cot`. The first command refuses to start while
another run's files are still in Galápagos' folders.

## If some replies don't split into 10 variants

The job log marks them with `WARNING: Galapagos' splitter would find …`. Galápagos'
`template_variants.py` stops at the first function with fewer than 10 variants, so every
later function in that library loses its variants too. To ask again only for those replies
(up to 3 attempts in total, the same as a run started with `--max-attempts 3`), submit the
job again with:
```bash
GEN_ARGS="--max-attempts 3 --retry-unsplit" WORKDIR=... PYMODULE=... sbatch ... qwen_generate.sbatch
```
Each original reply is kept as `<function>.attempt1.txt` (and `.attempt1.meta.json`), and the
change is recorded in `generation.json` (`max_attempts_history`). On the laptop, step 5 then
needs `--max-attempts 3` as well.

## Checks

On the laptop, after step 4:
```bash
grep -H -E '"(condition|model_requested|thinking)"' runs/qwen-*/generation.json
grep -h -A8 '"sampling"' runs/qwen-*/generation.json | sort | uniq -c   # every value 4 times
grep -H -E '"(galapagos_split_count|finish_reason)"' runs/qwen-*/replies/*/*.meta.json | grep -v -E ': 10,|"stop"'
```
The last command prints only replies that won't split into 10 variants or didn't finish
normally. An empty result means all 72 are fine.

## For the write-up

Model `Qwen/Qwen3.6-27B` in bf16 on one A100 80GB, served by vLLM (the version is in the job
log). Thinking off, one request per function, the system prompt "You are a helpful assistant.",
the sampling settings above, no seed. The prompts and the reply handling are identical to the
Claude runs. Unlike the Claude runs, the sampling settings could be set and no hidden
reasoning was used.

## Alternative: generate from the laptop through an SSH tunnel

`qwen_vllm.sbatch` only starts the server. With an SSH tunnel from WSL
(`ssh -N -L 8000:<node>:8000 <netid>@nova.its.iastate.edu`) you can then run
`generate_variants_qwen.py` on the laptop with `QWEN_API_KEY` set to the password the job
was started with. That needs SSH from WSL to Nova. The batch job above doesn't.
