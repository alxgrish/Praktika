@echo off
net stop MySQL
xcopy /E /I /Y "C:\ProgramData\MySQL\MySQL Server X.X\Data\database_name" "C:\Backup\database_name"
net start MySQL
echo Резервная копия создана %date% %time% >> C:\Backup\log.txt
pause