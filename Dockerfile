FROM browserless/chrome

RUN npm install -g supergateway
WORKDIR /app
COPY . .
COPY entrypoint.sh /entrypoint.sh
EXPOSE 8000
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]