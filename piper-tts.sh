#!/bin/sh
# Start Piper TTS HTTP server on port 5000 (local dev, macOS/Linux only)
# For Windows or Docker — use: docker compose up piper
# Requires: pip install piper-tts (Python 3.9–3.12)
VOICES_DIR="$(dirname "$0")/piper-voices"

echo "Starting Piper TTS server on http://localhost:5000"
echo "Voice: en_GB-alan-low  |  Data dir: $VOICES_DIR"
exec python3 -m piper.http_server \
  --model en_GB-alan-low \
  --port 5000 \
  --host 0.0.0.0 \
  --data-dir "$VOICES_DIR"
