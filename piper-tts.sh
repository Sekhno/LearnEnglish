#!/bin/sh
# Start Piper TTS HTTP server on port 5000
# Voice: en_GB-alan-low
VOICES_DIR="$(dirname "$0")/piper-voices"
MODEL="$VOICES_DIR/en_GB-alan-low.onnx"

echo "Starting Piper TTS server on http://localhost:5000"
echo "Voice: en_GB-alan-low"
exec /opt/homebrew/bin/python3 -m piper.http_server \
  --model "$MODEL" \
  --port 5000 \
  --host 0.0.0.0 \
  --data-dir "$VOICES_DIR"
