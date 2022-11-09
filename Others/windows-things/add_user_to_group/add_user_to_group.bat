@ECHO OFF
chcp 65001

REM Created by github.com/olback

REM ----- Groups -----
REM Admin (Swedish OS): administratörer
REM Admin (English OS): administrators


REM ----- Set the user, domain and localgroup here -----
SET user=
SET domain=
SET group=



REM ----- Do not edit below this line -----

net localgroup %group% %domain%\%user% /add

echo %domain%\%user% Is now added to the group %group%

