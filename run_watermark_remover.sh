#!/bin/bash

# 1. Check if the user provided input and output directories
if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <docker-image-tar-file> <input-folder-path> <output-folder-path>"
  exit 1
fi

TAR_FILE=$1
INPUT_DIR=$2
OUTPUT_DIR=$3

# 2. Check if the Docker image file exists
if [ ! -f "$TAR_FILE" ]; then
  echo "Docker image file '$TAR_FILE' not found."
  exit 1
fi

# 3. Check if input and output directories exist
if [ ! -d "$INPUT_DIR" ]; then
  echo "Input folder '$INPUT_DIR' does not exist."
  exit 1
fi

mkdir -p "$OUTPUT_DIR"  # Create output dir if it doesn't exist

# 4. Load the Docker image from the .tar file
echo "Loading Docker image from $TAR_FILE..."
docker load -i "$TAR_FILE"

# 5. Extract image name from tar (just in case you change it later)
IMAGE_NAME=$(docker image ls --format "{{.Repository}}" | grep watermark-remover | head -n 1)

if [ -z "$IMAGE_NAME" ]; then
  echo "Failed to detect the image name from $TAR_FILE."
  exit 1
fi

# 6. Run the container with volume mappings
echo "Running Docker container..."
docker run --rm \
  -v "$INPUT_DIR":/app/source \
  -v "$OUTPUT_DIR":/app/output \
  "$IMAGE_NAME"
