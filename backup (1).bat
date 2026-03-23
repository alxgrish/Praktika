@echo off
echo Начало резервного копирования %date% %time% >> C:\Backup\backup_log.txt
mysqldump -u root -p password database_name > C:\Backup\backup_%date:~-4,4%%date:~-7,2%%date:~-10,2%.sql
echo Резервное копирование завершено %date% %time% >> C:\Backup\backup_log.txt