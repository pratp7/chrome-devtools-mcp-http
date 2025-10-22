#!/bin/bash
set -e

echo "Starting Chrome DevTools MCP server..."
echo "Node version: $(node -v)"
echo "Chromium version: $($CHROME_BIN --version)"

PORT=${PORT:-8000}

supergateway --stdio "chrome-devtools-mcp \
  --headless=true \
  --executablePath=$CHROME_BIN \
  --chromeFlags='--no-sandbox --disable-dev-shm-usage --disable-gpu --ignore-certificate-errors --allow-insecure-localhost --remote-debugging-port=9222 --remote-debugging-address=0.0.0.0'" \
  --outputTransport streamableHttp \
  --stateful \
  --sessionTimeout 60000 \
  --port $PORT
