#!/bin/bash
set -e

if [ ! -f /app/api/src/models/v1_0/kokoro-v1_0.pth ]; then
  echo "Model not found, downloading..."
  python download_model.py --output /app/api/src/models/v1_0
fi

exec uv run --extra $DEVICE --no-sync python -m uvicorn api.src.main:app --host 0.0.0.0 --port 8880 --log-level debug
