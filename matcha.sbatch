#!/bin/bash
#SBATCH --job-name="matcha_tts_training"
#SBATCH --partition=hgx2q        # partition name
#SBATCH --gres=gpu:a100:1  
#SBATCH --time=7-00:00:00  # 7 days
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --output=matcha_tts_training_%j.out
#SBATCH --error=matcha_tts_training_%j.err

module load cuda11.8/toolkit/11.8.0

eval "$(conda shell.bash hook)"

conda activate matcha-tts-v2

export CUDA_LAUNCH_BLOCKING=1
export ESPEAK_PATH=/home/victoria/.local/bin/espeak
export LD_LIBRARY_PATH=/home/victoria/.local/lib:$LD_LIBRARY_PATH


# Run the training script for Matcha-TTS
python /home/victoria/Matcha-TTS/matcha/train.py experiment=multispeaker 