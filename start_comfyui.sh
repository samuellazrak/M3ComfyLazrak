#!/bin/bash

# Script to start ComfyUI with the conda environment
# Usage: ./start_comfyui.sh

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ENV_PATH="$SCRIPT_DIR/env"
COMFYUI_PATH="$SCRIPT_DIR/ComfyUI_main"

echo "Starting ComfyUI..."
echo "Environment path: $ENV_PATH"
echo "ComfyUI path: $COMFYUI_PATH"

# Activate the conda environment
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate "$ENV_PATH"

# Check if activation was successful
if [ $? -eq 0 ]; then
    echo "Conda environment activated successfully"
    echo "Python version: $(python --version)"
    echo "PyTorch version: $(python -c 'import torch; print(torch.__version__)')"
    echo ""
    echo "Starting ComfyUI server..."
    echo "ComfyUI will be available at: http://localhost:8188"
    echo "Press Ctrl+C to stop the server"
    echo ""
    
    # Change to ComfyUI directory and start the server
    cd "$COMFYUI_PATH"
    python main.py --cpu --port 8188
else
    echo "Failed to activate conda environment"
    exit 1
fi 