#!/bin/bash
set -e

cd "$HOME/mission10"
mkdir -p "$HOME/mission10/backups"

echo "Starting database backup..."

sudo docker compose exec -T db sh -c 'mariadb-dump -u root -p"$MYSQL_ROOT_PASSWORD" --all-databases' > "$HOME/mission10/backups/database_backup.sql"

if [ -s "$HOME/mission10/backups/database_backup.sql" ]; then
    echo "Backup completed successfully!"
    ls -lh "$HOME/mission10/backups/database_backup.sql"
else
    echo "Backup failed: SQL file is empty."
    exit 1
fi
