#!/bin/bash

set -e

# 1. Create conda env if it doesn't exist
if [ ! -d "./env" ]; then
    echo "Creating conda environment in ./env with Python 3.11..."
    conda create -p ./env python=3.11 -y
else
    echo "Conda environment ./env already exists."
fi

# 2. Activate the environment
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate ./env

echo "Installing pip dependencies..."
pip install packaging ninja

# 3. Install PyTorch for Apple Silicon (no CUDA)
echo "Installing torch, torchvision, torchaudio for Apple Silicon (M1/M2/M3)..."
pip install torch torchvision torchaudio

echo "[WARNING] Skipping flash-attn and apex: these are not supported on Apple Silicon (M1/M2/M3)."
echo "[WARNING] Skipping xformers: not compatible with Apple Silicon due to OpenMP compilation issues."

# 4. Clone and install ComfyUI-Open-Sora custom node
if [ ! -d "ComfyUI/custom_nodes" ]; then
    mkdir -p ComfyUI/custom_nodes
fi
cd ComfyUI/custom_nodes
if [ ! -d "ComfyUI-Open-Sora" ]; then
    git clone https://github.com/chaojie/ComfyUI-Open-Sora
fi
cd ComfyUI-Open-Sora
pip install -v .

# 5. Done
echo "ComfyUI environment setup complete! (Apple Silicon)"
echo "Note: xformers, flash-attn, and apex were skipped due to Apple Silicon incompatibility." 