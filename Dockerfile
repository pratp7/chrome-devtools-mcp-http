FROM node:20
WORKDIR /app
COPY . .
# install chromium and required libs for headless chrome
RUN apt-get update && apt-get install -y \
    chromium \
    ca-certificates \
    fonts-liberation \
    libasound2 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libc6 \
    libcairo2 \
    libdbus-1-3 \
    libexpat1 \
    libfontconfig1 \
    libgbm1 \
    libgdk-pixbuf2.0-0 \
    libglib2.0-0 \
    libgtk-3-0 \
    libnspr4 \
    libnss3 \
    libpango-1.0-0 \
    libstdc++6 \
    wget \
 && rm -rf /var/lib/apt/lists/*
RUN npm install -g supergateway
ENV CHROME_BIN=/usr/bin/chromium
EXPOSE 8000
CMD ["sh", "-c", "supergateway --host 0.0.0.0 --stdio 'npx -y chrome-devtools-mcp@latest --headless=true' --outputTransport streamableHttp --stateful --sessionTimeout 60000 --port ${PORT:-8000}"]