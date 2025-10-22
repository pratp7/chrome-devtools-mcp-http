#!/bin/sh
supergateway --stdio "npx -y chrome-devtools-mcp@latest \
  --headless=true \
  --executablePath=/usr/bin/chromium \
  --chromeFlags='--no-sandbox --disable-dev-shm-usage --disable-gpu --remote-debugging-port=9222 --remote-debugging-address=0.0.0.0'" \
  --outputTransport streamableHttp \
  --stateful \
  --sessionTimeout 60000 \
  --port ${PORT:-8000}
