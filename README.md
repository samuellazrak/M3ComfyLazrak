# ComfyUI with Open-Sora Setup

This repository contains a complete setup for running ComfyUI with the Open-Sora custom node for video generation.

## What's Included

- **ComfyUI**: The main ComfyUI installation with all required dependencies
- **Open-Sora Custom Node**: Enables video generation capabilities
- **Conda Environment**: Isolated Python environment with all dependencies
- **Apple Silicon Optimized**: Configured for M1/M2/M3 Macs

## Quick Start

### Option 1: Using the Start Script (Recommended)
```bash
./start_comfyui.sh
```

### Option 2: Manual Start
```bash
# Activate the conda environment
conda activate ./env

# Navigate to ComfyUI directory
cd ComfyUI_main

# Start ComfyUI
python main.py --cpu --port 8188
```

## Accessing ComfyUI

Once started, ComfyUI will be available at:
- **Web Interface**: http://localhost:8188
- **API**: http://localhost:8188/api

## Features

- **Video Generation**: Use the Open-Sora nodes to generate videos
- **CPU Mode**: Optimized for Apple Silicon (M1/M2/M3) without requiring GPU
- **Custom Nodes**: Open-Sora integration for advanced video generation

## Directory Structure

```
LocalGpt/
├── env/                    # Conda environment with all dependencies
├── ComfyUI_main/          # Main ComfyUI installation
│   └── custom_nodes/
│       └── ComfyUI-Open-Sora/  # Open-Sora custom node
├── start_comfyui.sh       # Convenience script to start ComfyUI
├── setup_comfyui_env.sh   # Environment setup script
└── run_comfyui.sh         # Environment info script
```

## Dependencies Installed

- PyTorch 2.5.1 (CPU/Metal backend for Apple Silicon)
- ComfyUI Frontend Package
- Open-Sora custom node
- All required ML libraries (transformers, diffusers, accelerate, etc.)

## Notes

- The setup is optimized for Apple Silicon Macs
- Some packages like xformers, flash-attn, and apex were skipped due to Apple Silicon incompatibility
- The system runs in CPU mode for maximum compatibility

## Troubleshooting

If you encounter issues:

1. **Environment Activation**: Make sure you're using bash/zsh, not fish shell
2. **Port Conflicts**: If port 8188 is busy, use a different port: `python main.py --cpu --port 8189`
3. **Memory Issues**: The system uses CPU mode, so generation may be slower but more stable

## Open-Sora Usage

Once ComfyUI is running, you can use the Open-Sora nodes to:
- Generate videos from text prompts
- Control video generation parameters
- Export videos in various formats

The Open-Sora nodes will appear in the ComfyUI interface under the custom nodes section. # M3ComfyLazrak
