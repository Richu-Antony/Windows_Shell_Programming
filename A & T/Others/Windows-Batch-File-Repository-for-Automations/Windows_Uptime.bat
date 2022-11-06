@echo off
echo.
echo.
echo The line below indicates this machine's uptime
echo.
net stats srv | find "since"
echo.
echo.
pause