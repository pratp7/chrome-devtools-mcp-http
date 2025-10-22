FROM node:20-slim

# Install Chrome dependencies
RUN apt-get update && \
    apt-get install -y wget gnupg2 && \
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' && \
    apt-get update && \
    apt-get install -y google-chrome-stable && \
    rm -rf /var/lib/apt/lists/*

# Install supergateway globally
RUN npm install -g supergateway

WORKDIR /app

# Expose the port (Railway sets $PORT)
EXPOSE 8000

# Start the server
CMD supergateway --stdio "npx -y chrome-devtools-mcp@latest --headless=true" --outputTransport streamableHttp --stateful --sessionTimeout 60000 --port ${PORT:-8000}