@echo off
echo Начало восстановления %date% %time% >> C:\Backup\restore_log.txt
net stop MySQL
rmdir /S /Q "C:\ProgramData\MySQL\MySQL Server X.X\Data\database_name"
xcopy /E /I /Y "C:\Backup\database_name" "C:\ProgramData\MySQL\MySQL Server X.X\Data\database_name"
net start MySQL
echo Восстановление завершено %date% %time% >> C:\Backup\restore_log.txt
pause