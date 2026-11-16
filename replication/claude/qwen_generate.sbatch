#!/bin/bash
# One Nova job that does all of the Qwen generation, with no SSH tunnel or laptop connection:
#   1. starts Qwen3.6-27B with vLLM on this GPU node (reachable only from this node),
#   2. runs generate_variants_qwen.py --replies-only for each condition,
#   3. stops the server.
# The replies land in runs/qwen-<condition>-r1/ next to this script. Copy those folders back
# to your laptop, where the Galapagos part runs as before (QWEN.md).
#
# Submit from the folder that holds this script and generate_variants_qwen.py:
#   sbatch qwen_generate.sbatch
# Optional settings, put before sbatch:
#   WORKDIR=/work/<group>/<netid>   where vllm-env, hf-cache and caches live (default: your home folder)
#   PYMODULE=python/3.11            the Python module the venv was made with
#   RUN_SUFFIX=r2   CONDITIONS="cot context_cot"   (defaults: r1, all four)
#   GEN_ARGS="--max-attempts 3"     extra options for generate_variants_qwen.py (same for every condition)
# If the job ends before every reply is saved, submit it again: saved replies are skipped.
#
# Check Nova's documentation for the exact GPU request syntax; Nova's Slurm code for its
# A100 80GB GPUs is "a100" (one GPU is enough: the model is about 55 GB in bf16).
#SBATCH --job-name=qwen-gen
#SBATCH --nodes=1
#SBATCH --gres=gpu:a100:1
#SBATCH --cpus-per-task=8
#SBATCH --mem=96G
#SBATCH --time=08:00:00
#SBATCH --output=qwen-gen-%j.log

set -eo pipefail
JOB=${SLURM_JOB_ID:-local}
RUN_SUFFIX=${RUN_SUFFIX:-r1}
CONDITIONS=${CONDITIONS:-"baseline context cot context_cot"}
echo "Generator options: --replies-only ${GEN_ARGS:-(none)}"
WORKDIR=${WORKDIR:-$HOME}                  # QWEN.md, step 1
VENV=${VENV:-$WORKDIR/vllm-env}            # the venv with vllm installed
export HF_HOME=${HF_HOME:-$WORKDIR/hf-cache}   # where the model was downloaded
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$WORKDIR/.cache}   # vLLM's compile caches, kept out of a small home quota
export TRITON_CACHE_DIR=${TRITON_CACHE_DIR:-$XDG_CACHE_HOME/triton}
export HF_HUB_OFFLINE=1                    # use the downloaded copy; compute nodes may have no internet
PORT=${PORT:-8000}

cd "${SLURM_SUBMIT_DIR:-$PWD}"
if [ ! -f generate_variants_qwen.py ] || [ ! -f generate_variants_claude.py ]; then
  echo "Submit this from the folder that holds generate_variants_qwen.py and generate_variants_claude.py."; exit 1
fi
if [ -n "${PYMODULE:-}" ]; then module load "$PYMODULE"; fi   # the Python module the venv was made with
source "$VENV/bin/activate"

# A fresh password that only this job knows, so other users of the node can't use the server.
export QWEN_API_KEY=$(python3 -c "import secrets; print(secrets.token_hex(16))")
export QWEN_BASE_URL=http://127.0.0.1:$PORT/v1

echo "Job $JOB on $(hostname), $(date)"
nvidia-smi --query-gpu=name,memory.total --format=csv,noheader || true
python3 -c "import vllm; print('vLLM', vllm.__version__)"

# --language-model-only: skip the vision encoder (text only), leaving more GPU memory for the KV cache.
# --reasoning-parser qwen3: keeps any thinking out of the answer text (only matters with --thinking on).
# --max-model-len 40960: prompt (~2k tokens) + up to 32768 output tokens.
vllm serve Qwen/Qwen3.6-27B \
  --host 127.0.0.1 --port "$PORT" \
  --max-model-len 40960 \
  --language-model-only \
  --reasoning-parser qwen3 \
  --api-key "$QWEN_API_KEY" > "vllm-$JOB.log" 2>&1 &
VLLM_PID=$!
trap 'kill $VLLM_PID 2>/dev/null || true' EXIT

echo "Loading the model (server log: vllm-$JOB.log) ..."
ready=0
for i in $(seq 1 180); do                  # up to 30 minutes
  if ! kill -0 "$VLLM_PID" 2>/dev/null; then
    echo "vLLM stopped while loading. Last lines of vllm-$JOB.log:"; tail -30 "vllm-$JOB.log"; exit 1
  fi
  if python3 -c "
import os, urllib.request
r = urllib.request.Request(os.environ['QWEN_BASE_URL'] + '/models',
                           headers={'Authorization': 'Bearer ' + os.environ['QWEN_API_KEY']})
urllib.request.urlopen(r, timeout=5)" 2>/dev/null; then ready=1; break; fi
  sleep 10
done
if [ "$ready" != 1 ]; then echo "The server wasn't ready after 30 minutes; see vllm-$JOB.log."; exit 1; fi
echo "Server ready, $(date)"

unfinished=""
for c in $CONDITIONS; do
  echo; echo "=== $c ($(date +%H:%M))"
  python3 generate_variants_qwen.py --condition "$c" --run "qwen-$c-$RUN_SUFFIX" --replies-only $GEN_ARGS \
    || unfinished="$unfinished $c"
done

echo; echo "Finished $(date)"
if [ -n "$unfinished" ]; then
  echo "Not finished:$unfinished. Submit the job again to continue (saved replies are skipped)."
  exit 2
fi
echo "All replies saved. Copy these folders to your laptop:"
for c in $CONDITIONS; do echo "  runs/qwen-$c-$RUN_SUFFIX"; done
