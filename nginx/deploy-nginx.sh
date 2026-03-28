#!/usr/bin/env bash
set -euo pipefail

ENVIRONMENT="${1:-}"

if [ -z "$ENVIRONMENT" ]; then
  echo "Usage: $0 {prod|staging}"
  exit 1
fi

case "$ENVIRONMENT" in
  prod)
    SRC="nginx/prod.conf"
    DEST="/etc/nginx/conf.d/default.conf"
    ;;
  staging)
    SRC="nginx/staging.conf"
    DEST="/etc/nginx/conf.d/default.conf"
    ;;
  *)
    echo "Usage: $0 {prod|staging}"
    exit 1
    ;;
esac

if [ ! -f "$SRC" ]; then
  echo "Fichier introuvable: $SRC"
  exit 1
fi

sudo cp "$SRC" "$DEST"
sudo nginx -t
sudo systemctl reload nginx

echo "Déploiement NGINX terminé pour: $ENVIRONMENT"