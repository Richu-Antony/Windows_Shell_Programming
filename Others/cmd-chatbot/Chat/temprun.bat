@echo off
setlocal EnableDelayedExpansion
set a=!random!%%10
echo !a! %a%
goto eof
Set var1=Hello how are you?
Set var1=!var1:?=63!
Echo !var1!
:eof
pause