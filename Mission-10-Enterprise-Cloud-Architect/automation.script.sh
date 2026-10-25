
#!/bin/bash

# Mission 10: The Enterprise Cloud Architect
# Automated MariaDB database backup

set -Eeuo pipefail

PROJECT_DIR="/home/cloudnova/mission10"
BACKUP_DIR="$PROJECT_DIR/backups"
BACKUP_FILE="$BACKUP_DIR/database_backup_$(date +%Y%m%d_%H%M%S).sql"
LOG_FILE="$BACKUP_DIR/backup.log"

mkdir -p "$BACKUP_DIR"

log_message() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

cd "$PROJECT_DIR"

log_message "Starting database backup..."

if docker compose exec -T db sh -c \
    'exec mariadb-dump -u root -p"$MYSQL_ROOT_PASSWORD" --all-databases' \
    > "$BACKUP_FILE" 2>> "$LOG_FILE"; then

    if [ -s "$BACKUP_FILE" ]; then
        log_message "Backup completed successfully: $BACKUP_FILE"
        ls -lh "$BACKUP_FILE" | tee -a "$LOG_FILE"
    else
        rm -f "$BACKUP_FILE"
        log_message "ERROR: Backup file is empty."
        exit 1
    fi
else
    rm -f "$BACKUP_FILE"
    log_message "ERROR: Database backup failed."
    exit 1
fi

