@echo off

set /p filename="enter file name: "

for /F "tokens=*" %%A in (%list%) do (
	rem test password and suppress output, then echo the password if successful:
	rar.exe t -p%%A -y %filename% >nul 2>&1 && (echo password is %%A && exit /b 0)
)