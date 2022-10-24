@echo off
color 3
echo version 1.1.0
echo please visit our repo https://www.github.com/shourgamer2/TempFileRemover
echo Temp File deleter
title Temp File deleter
cd /D %temp%
for /d %%D in (*) do rd /s /q "%%D"
del /f /q *
echo Temp Files Have Been Deleted
start https://www.github.com/shourgamer2/TempFileRemover
pause
