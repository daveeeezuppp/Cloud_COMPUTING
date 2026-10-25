# Project Reflection

## Introduction

Mission 10 provided practical experience in deploying a multi-tier application using Ubuntu Server and Docker Compose.

## Skills Learned

I learned how to manage Docker containers, deploy Nextcloud with MariaDB, configure persistent storage, and inspect application logs. I also practiced creating database backups with a Bash script and scheduling tasks using cron.

## Challenges Encountered

One challenge was resolving Docker permission errors. Another was troubleshooting the backup script and ensuring that the SQL backup file contained data. I also learned that firewall rules must be configured carefully to preserve required access.

## Security and Reliability

The project demonstrated the importance of limiting network access, protecting environment variables, keeping the database internal, and checking backup files. A scheduled backup should be tested to ensure it runs successfully, and a restore test is needed to confirm recoverability.

## Conclusion

This project improved my understanding of containerized deployments, database management, backup automation, and basic Linux firewall security. These skills are useful for operating and maintaining cloud-based applications.

## Future Improvements

Future improvements include verifying automatic backup execution, testing database restoration, retaining multiple backup versions, and completing a documented recovery procedure.
