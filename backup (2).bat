@echo off
echo Начало восстановления %date% %time% >> C:\Backup\restore_log.txt
mysql -u root -p password database_name < C:\Backup\backup.sql
echo Восстановление завершено %date% %time% >> C:\Backup\restore_log.txt
pause