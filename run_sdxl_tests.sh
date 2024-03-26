#!/bin/bash

# For CN
export HF_ENDPOINT="https://hf-mirror.com"

MODEL_PATH=$(python3 -c "from huggingface_hub import snapshot_download; repo_id='siliconflow/sdxl-base-1.0-onediff-enterprise-v2'; int8_folder = snapshot_download(repo_id=repo_id); print(int8_folder)")

OUTPUT_DIR="your path"

python3 text_to_image_sdxl_enterprise_quality_benchmark.py --model $MODEL_PATH --image_path $OUTPUT_DIR
python3 text_to_image_sdxl_enterprise_quality_benchmark.py --model $MODEL_PATH --image_path $OUTPUT_DIR --deep_cache False
python3 text_to_image_sdxl_quality_benchmark.py --image_path $OUTPUT_DIR
python3 text_to_image_sdxl_quality_benchmark.py --image_path $OUTPUT_DIR --deep_cache False
python3 text_to_image_sdxl_quality_benchmark.py --image_path $OUTPUT_DIR --compile False --deep_cache False
