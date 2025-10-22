#!/bin/bash
set -e

echo "Starting Chrome DevTools MCP server..."
echo "Node version: $(node -v)"
echo "Chromium version: $($CHROME_BIN --version)"

PORT=${PORT:-8000}

$CHROME_BIN \
  --headless=true \
  --no-sandbox \
  --disable-gpu \
  --disable-dev-shm-usage \
  --disable-background-networking \
  --remote-debugging-address=0.0.0.0 \
  --remote-debugging-port=9222 \
  --user-data-dir=/tmp/chrome-profile & 

  until curl -s http://localhost:9222/json/version > /dev/null; do
    echo "Waiting for Chrome to start..."
    sleep 0.5
  done

supergateway --stdio "npx -y chrome-devtools-mcp@latest \
  --browserUrl='ws://localhost:9222'" \
  --outputTransport streamableHttp \
  --stateful \
  --sessionTimeout 60000 \
  --port $PORT
