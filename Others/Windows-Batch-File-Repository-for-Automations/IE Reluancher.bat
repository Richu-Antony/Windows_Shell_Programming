@ECHO OFF
Title IE Reluancher
color 1f
Echo --------------------------------------------------------------------
ECHO This will close Internet Explorer reopen SeadrillIntranet website.
echo --------------------------------------------------------------------
pause
taskkill /F /im iexplore.exe /T
call "C:\Program Files\Internet Explorer\iexplore.exe" https://google.com/

