FROM nginx:alpine

RUN apk add --no-cache curl

COPY index.html /usr/share/nginx/html/index.html
COPY css/ /usr/share/nginx/html/css/

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD curl -f http://localhost || exit 1