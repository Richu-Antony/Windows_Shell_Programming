@echo off
break off
title Terminal
cls

:cmd
set /p cmd=C:\Enter CMD:

%cmd%
echo.
goto cmd