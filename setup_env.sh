#!/bin/bash

# Tạo virtual environment bằng Python venv
#python3 -m venv latentsync_env
#source latentsync_env/bin/activate

# Cập nhật pip
pip install --upgrade pip

# Cài ffmpeg qua apt
apt-get update
apt-get install -y libgl1 libglib2.0-0 ffmpeg

# Cài dependencies Python
pip install -r requirements.txt

# Cài Hugging Face CLI
pip install huggingface_hub

# Tạo thư mục lưu checkpoint
mkdir -p checkpoints

# Tải checkpoint từ Hugging Face
huggingface-cli download ByteDance/LatentSync-1.6 whisper/tiny.pt --local-dir checkpoints
huggingface-cli download ByteDance/LatentSync-1.6 latentsync_unet.pt --local-dir checkpoints
