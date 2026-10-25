# Mission 10: The Enterprise Cloud Architect

## Project Overview

This project deploys a multi-tier web application on Ubuntu Server using Docker Compose. It uses Nextcloud as the web application and MariaDB as the database service.

## Technologies Used

- Ubuntu Server
- VirtualBox
- Docker
- Docker Compose
- Nextcloud
- MariaDB
- Bash scripting
- Cron scheduling
- UFW firewall

## System Components

| Component | Purpose |
|---|---|
| Nextcloud | Web application |
| MariaDB | Database service |
| Docker Compose | Runs and manages the containers |
| Docker volumes | Persistent application and database data |
| `backups.sh` | Database backup script |
| Cron | Schedules daily backups |
| UFW | Controls host firewall traffic |

## Security Configuration

UFW was configured to allow SSH traffic on port 22 and application traffic on port 8080. MariaDB should remain accessible only through the internal Docker network unless external access is explicitly required.

## Database Backup

A database backup was created at `~/mission10/backups/database_backup.sql`. The backup file was approximately 3.6 MB during testing.

A cron job was configured to run the backup script daily at 2:00
