npx -y supergateway \
  --stdio "npx -y chrome-devtools-mcp@latest --headless=true" \
  --outputTransport streamableHttp \
  --stateful \
  --sessionTimeout 60000 \
  --port ${PORT:-8000}