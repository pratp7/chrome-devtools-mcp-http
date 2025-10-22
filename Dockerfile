# Start from browserless/chrome for stable headless Chrome
FROM browserless/chrome:latest

# Switch to root to install Node.js 20+
USER root

# Install Node.js 20 using NodeSource
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g supergateway --unsafe-perm=true && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy your app files and entrypoint script
COPY . .
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose the port
EXPOSE 8000

# Switch back to non-root user for security
USER chrome

# Start the MCP server
CMD ["/entrypoint.sh"]
