#!/bin/bash

# Script to activate conda environment and run ComfyUI
# Usage: ./run_comfyui.sh

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ENV_PATH="$SCRIPT_DIR/env"

echo "Activating conda environment at: $ENV_PATH"

# Activate the conda environment
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate "$ENV_PATH"

# Check if activation was successful
if [ $? -eq 0 ]; then
    echo "Conda environment activated successfully"
    echo "Python version: $(python --version)"
    echo "PyTorch version: $(python -c 'import torch; print(torch.__version__)')"
    echo ""
    echo "Installed packages:"
    echo "- PyTorch (CPU/Metal backend for Apple Silicon)"
    echo "- ComfyUI-Open-Sora custom node"
    echo "- All required dependencies (accelerate, diffusers, transformers, etc.)"
    echo ""
    echo "Note: xformers, flash-attn, and apex were skipped due to Apple Silicon incompatibility."
    echo ""
    echo "To run ComfyUI, you need to:"
    echo "1. Clone ComfyUI repository: git clone https://github.com/comfyanonymous/ComfyUI"
    echo "2. Copy the custom_nodes folder to ComfyUI/custom_nodes/"
    echo "3. Run: python main.py"
    echo ""
    echo "Environment is ready!"
else
    echo "Failed to activate conda environment"
    exit 1
fi 