#!/bin/bash
set -euo pipefail

echo "Adding permissions"
chown -R www-data:www-data /var/www/html/wp-content
echo "Permissions added"

exec docker-entrypoint.sh "$@"
