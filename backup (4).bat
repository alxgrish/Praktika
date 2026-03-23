@echo off
mysqldump -u root -p password database_name > C:\Backup\backup_%date%.sql
pause