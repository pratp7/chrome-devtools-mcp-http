FROM node:20-slim

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
    libx11-xcb1 \
    libxcomposite1 \
    libxrandr2 \
    libxi6 \
    libxdamage1 \
    libxss1 \
    libxtst6
    wget \
 && rm -rf /var/lib/apt/lists/*
RUN npm install -g supergateway
ENV CHROME_BIN=/usr/bin/chromium

WORKDIR /app

COPY . .
COPY entrypoint.sh /entrypoint.sh

# Expose the port (Railway sets $PORT)
EXPOSE 8000

# Start the server
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]