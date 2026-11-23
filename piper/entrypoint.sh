#!/bin/sh
set -e

VOICE="en_GB-alan-low"
DATA_DIR="/piper-voices"

if [ ! -f "$DATA_DIR/$VOICE.onnx" ]; then
  echo "Downloading voice model: $VOICE (~63 MB, first run only)..."
  python -m piper.download_voices --download-dir "$DATA_DIR" "$VOICE"
  echo "Voice model ready."
fi

exec python -m piper.http_server \
  --model "$VOICE" \
  --port 5000 \
  --host 0.0.0.0 \
  --data-dir "$DATA_DIR"
