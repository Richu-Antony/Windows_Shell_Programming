@echo off
Title TMS Fix
mode con:cols=125 lines=40
COLOR 17
@ECHO off

ipconfig /flushdns
klist purge
nbtstat -rr

cls

echo '-----------------------------------------------------------------------------------------
echo ' NAME     		: 	TMS FIX
echo ' AUTHOR	                    :                   ISIT Service Desk
echo ' DATE     		: 	09-July-2016
echo ' PURPOSE  		:	Fix TMS Issue 
echo ' REVISIONS		: 	1.0
echo '-----------------------------------------------------------------------------------------
echo. FIX COMPLETED!
echo. Please SAVE ll open documents!. Computer will reboot in 2 minutes!

Pause>nul
