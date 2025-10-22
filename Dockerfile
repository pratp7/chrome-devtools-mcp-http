FROM node:20
WORKDIR /app
COPY . .
RUN npm install -g supergateway
EXPOSE 8000
CMD ["supergateway", "--stdio", "npx -y chrome-devtools-mcp@latest --headless=true", "--outputTransport", "streamableHttp", "--stateful", "--sessionTimeout", "60000", "--port", "8000"]
