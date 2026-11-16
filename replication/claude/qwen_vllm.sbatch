#!/bin/bash
# Serves Qwen3.6-27B with vLLM on one Nova GPU node, as an OpenAI-compatible API on port 8000.
# generate_variants_qwen.py on your laptop reaches it through an SSH tunnel (see QWEN.md).
#
# Submit from a Nova login node, with the password you chose for the server:
#   QWEN_API_KEY=<your password> sbatch qwen_vllm.sbatch
# Stop it when you're done generating:   scancel <job id>
#
# Check Nova's documentation for the exact GPU request syntax; Nova's Slurm code for its
# A100 80GB GPUs is "a100" (one GPU is enough: the model is about 55 GB in bf16).
#SBATCH --job-name=qwen-vllm
#SBATCH --nodes=1
#SBATCH --gres=gpu:a100:1
#SBATCH --cpus-per-task=8
#SBATCH --mem=96G
#SBATCH --time=08:00:00
#SBATCH --output=qwen-vllm-%j.log

set -eo pipefail
: "${QWEN_API_KEY:?Submit with: QWEN_API_KEY=<your password> sbatch qwen_vllm.sbatch}"

WORKDIR=${WORKDIR:-$HOME}              # where vllm-env, hf-cache and caches live (QWEN.md, step 1)
VENV=${VENV:-$WORKDIR/vllm-env}        # the venv with vllm installed
export HF_HOME=${HF_HOME:-$WORKDIR/hf-cache}   # where the model was downloaded
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$WORKDIR/.cache}
export TRITON_CACHE_DIR=${TRITON_CACHE_DIR:-$XDG_CACHE_HOME/triton}
export HF_HUB_OFFLINE=1                # use the downloaded copy; compute nodes may have no internet

if [ -n "${PYMODULE:-}" ]; then module load "$PYMODULE"; fi   # the Python module the venv was made with
source "$VENV/bin/activate"
echo "Node: $(hostname)   Tunnel from WSL: ssh -N -L 8000:$(hostname):8000 <netid>@nova.its.iastate.edu"
nvidia-smi --query-gpu=name,memory.total --format=csv || true
python -c "import vllm; print('vLLM', vllm.__version__)"

# --language-model-only: skip the vision encoder (text only), leaving more GPU memory for the KV cache.
# --reasoning-parser qwen3: keeps any thinking out of the answer text (only matters with --thinking on).
# --max-model-len 40960: prompt (~2k tokens) + up to 32768 output tokens.
# --host 0.0.0.0: so the SSH tunnel through the login node can reach it; --api-key keeps others out.
exec vllm serve Qwen/Qwen3.6-27B \
  --host 0.0.0.0 --port 8000 \
  --max-model-len 40960 \
  --language-model-only \
  --reasoning-parser qwen3 \
  --api-key "$QWEN_API_KEY"
