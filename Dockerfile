FROM node:20
WORKDIR /app
COPY . .
RUN npm install -g supergateway
EXPOSE 8000
CMD ["supergateway", "--config", "./mcp.json", "--outputTransport", "streamableHttp", "--stateful", "--sessionTimeout", "60000", "--port", "8000"]
