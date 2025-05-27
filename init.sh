#!/bin/sh
set -e

WP_PATH=/var/www/html
URL=${WORDPRESS_URL:-http://localhost:8000}
TITLE=${WORDPRESS_TITLE:-WordPress}
ADMIN_USER=${WORDPRESS_ADMIN_USER:-admin}
ADMIN_PASSWORD=${WORDPRESS_ADMIN_PASSWORD:-admin}
ADMIN_EMAIL=${WORDPRESS_ADMIN_EMAIL:-admin@example.com}

# Wait for WordPress files to be available
tries=0
while ! wp --path="$WP_PATH" core version --allow-root >/dev/null 2>&1; do
  if [ "$tries" -ge 10 ]; then
    echo "WordPress files not found." >&2
    break
  fi
  echo "Waiting for WordPress files..."
  sleep 3
  tries=$((tries + 1))
done

if ! wp --path="$WP_PATH" core is-installed --allow-root >/dev/null 2>&1; then
  echo "Installing WordPress..."
  wp --path="$WP_PATH" core install \
    --url="$URL" \
    --title="$TITLE" \
    --admin_user="$ADMIN_USER" \
    --admin_password="$ADMIN_PASSWORD" \
    --admin_email="$ADMIN_EMAIL" \
    --skip-email \
    --allow-root
fi

wp --path="$WP_PATH" plugin activate my-custom-block --allow-root || true
