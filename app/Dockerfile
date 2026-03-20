FROM nginx:alpine

# installer curl pour le healthcheck
RUN apk add --no-cache curl

# copier ton site
COPY index.html /usr/share/nginx/html/index.html

# exposer le port
EXPOSE 80

# healthcheck
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD curl -f http://localhost || exit 1