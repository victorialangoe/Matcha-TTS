#!/bin/bash
#SBATCH --job-name="matcha_tts_training"
#SBATCH --partition=a100q  # Choose the appropriate partition
#SBATCH --time=7-00:00:00  # Set the time to 7 days
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --gres=gpu:1  # Request 1 GPU
#SBATCH --output=matcha_tts_training_%j.out
#SBATCH --error=matcha_tts_training_%j.err

# Load CUDA module (adjust version if needed)
module load cuda11.8/toolkit/11.8.0

# Ensure Conda is properly initialized
eval "$(conda shell.bash hook)"

# Activate your Python virtual environment (using conda activate)
conda activate matcha-tts-v2

export CUDA_LAUNCH_BLOCKING=1
export ESPEAK_PATH=/home/victoria/.local/bin/espeak
export LD_LIBRARY_PATH=/home/victoria/.local/lib:$LD_LIBRARY_PATH


# Run the training script for Matcha-TTS
python /home/victoria/Matcha-TTS/matcha/train.py experiment=multispeaker