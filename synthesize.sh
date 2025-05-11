#!/bin/bash
#--checkpoint_path /home/victoria/Matcha-TTS/logs/train/multispeaker/runs/trondelag3/checkpoints/checkpoint_epoch=1631.ckpt \
# --checkpoint_path /home/victoria/Matcha-TTS/logs/train/multispeaker/runs/vestland2/checkpoints/checkpoint_epoch=389.ckpt \
matcha-tts --text "nårr kjæmm du på kontore eller ska du heim" \
           --checkpoint_path /home/victoria/Matcha-TTS/logs/train/multispeaker/runs/trondelag3/checkpoints/checkpoint_epoch=1631.ckpt \
           --spk 0 \
           --output_folder /home/victoria/Matcha-TTS/audio_files/test\
           --vocoder hifigan_univ_v1

