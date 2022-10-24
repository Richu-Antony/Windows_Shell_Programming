@echo off

title Cleans Temporary Files
echo Deletes files from Local User Temporary Files
del C:\Users\%Username%\AppData\Local\Temp\* /q
REM subdirectories are not deleted yet - todo
pause
