# Operational Manual

## 1. Purpose

This manual explains how to start, monitor, back up, and troubleshoot the Mission 10 application.

## 2. System Requirements

- Ubuntu Server running in VirtualBox
- Docker installed and running
- Docker Compose plugin
- Nextcloud application container
- MariaDB database container

## 3. Start the Application

Open the Ubuntu Terminal and enter the project directory:

```bash
cd ~/mission10
```

Start the services:

```bash
sudo docker compose up -d
```

Check the containers:

```bash
sudo docker compose ps
```

## 4. Access Nextcloud

The application uses port 8080. Open `http://localhost:8080` from a browser that can reach the VM's published port. When using a browser on the Mac host, configure VirtualBox networking or port forwarding if necessary.

## 5. View Logs

Check application logs:

```bash
sudo docker compose logs --tail=50
```

Check container status:

```bash
sudo docker compose ps
```

## 6. Database Backup

The backup script is located at:

`~/mission10/scripts/backups.sh`

Run a manual backup:

```bash
bash ~/mission10/scripts/backups.sh
```

Check the backup files:

```bash
ls -lh ~/mission10/backups/
```

Confirm that the SQL file is non-empty before relying on it.

## 7. Scheduled Backup

Review the cron schedule:

```bash
crontab -l
```

The configured schedule is intended to run the backup script every day at 2:00 AM. Review `~/mission10/backups/cron.log` after a scheduled run to confirm whether it completed successfully.

## 8. Firewall

Check the firewall configuration:

```bash
sudo ufw status verbose
```

The configured rules allow SSH on port 22 and the application on port 8080. MariaDB should not be exposed publicly.

## 9. Troubleshooting

### Containers are stopped

```bash
sudo docker compose ps
sudo docker compose logs --tail=100
```

### Docker permission error

Use `sudo` with Docker commands if the current account lacks Docker permissions.

### Backup file is empty

Run the backup script manually and inspect its output. Verify that the database container is running and that its credentials are configured correctly.

### Application is inaccessible

Check container status, published ports, UFW rules, and VirtualBox network configuration.

## 10. Security and Recovery

- Keep `.env` private.
- Never publish database passwords or other secrets.
- Keep MariaDB accessible only through the intended Docker network.
- Store an additional copy of important backups securely.
- Test database restoration before relying on a backup for disaster recovery.

## 11. Current Verification Status

The Nextcloud and MariaDB containers were observed running during testing. A database backup file of approximately 3.6 MB was created. A daily cron schedule and UFW rules were configured. Successful scheduled execution and restoration still need verification.
