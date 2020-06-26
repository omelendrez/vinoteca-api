@echo off
rem echo %DATE%
rem echo %TIME%

rem set year=%DATE:~5,4%
rem set month=%DATE:~8,2%
rem set day=%DATE:~0,2%
rem set hour=%TIME:~0,2%
rem set minute=%TIME:~3,2%

rem set backuptime=%year%%month%%day%%hour%%minute%
echo %backuptime%

set backuptime=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%
"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysqldump" -u %VINOTECA_DB_USER% --routines --column-statistics=0 --no-create-db -h %VINOTECA_DB_SERVER% --password=%VINOTECA_DB_PASSWORD% %VINOTECA_DB_DATABASE% > %backuptime%.sql
