@echo off

title Seadrill ISIT Service Desk - Clearing DNS Cache
color 1f
mode con:cols=125 lines=40
@echo off
ECHO ---------------------------------------------------------------------------------------------------------------------
ECHO 						Copyright (C) 2016 Jeffrey Cayao  All rights reserved.
Echo THIS PROGRAM IS CONFIDENTIAL AND AN UNPUBLISHED WORK AND TRADE SECRET OF THE COPYRIGHT HOLDER, AND DISTRIBUTED ONLY 
Echo UNDER RESTRICTION. EXCEPT AS EXPLICITLY STATED IN A WRITTEN AGREEMENT BETWEEN THE PARTIES, THE SOFTWARE IS PROVIDED
echo AS-IS, WITHOUT WARRANTIES OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF 
echo MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, NONINFRINGEMENT, PERFORMANCE, AND QUALITY.
echo ---------------------------------------------------------------------------------------------------------------------
echo ...
echo ....
echo Clearing the DNS cache can fix 'cannot find selected webpage errors'...
echo .....

ipconfig /flushdns

echo The DNS has been successfully flushed, either type 'y' or manually close this window...

set /p var=Close?
IF '%var%' == 'y' GOTO end

pause>nul
:end
exit