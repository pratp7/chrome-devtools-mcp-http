# Use Node.js 20 slim base
FROM node:20-slim

# Install Chromium and required dependencies
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
    libgl1 \
    libegl1 \
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
    libxtst6 \
    libxext6 \
    libxfixes3 \
    libxshmfence1 \
    wget \
 && rm -rf /var/lib/apt/lists/*

# Set environment variable for Chromium binary
ENV CHROME_BIN=/usr/bin/chromium

# Install supergateway globally
RUN npm install -g supergateway

# Set working directory
WORKDIR /app

# Copy your app files and entrypoint script
COPY . .
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose port for MCP server
EXPOSE 8000

# Start the MCP server
CMD ["/entrypoint.sh"]
