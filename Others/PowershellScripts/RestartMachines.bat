:: How to run ?
:: Enter machine names and double click this file to run.

TIMEOUT /T 120

:: /r - For restart
:: /f - Force kill all running application
:: /m \\machinename - Implies we are gonna pass a remote machine name
:: /t x - Timer in seconds
:: /d [u][p] :xx:yy

:: List the reason code for the shutdown or restart. The following table lists the different values.
::    p will list a Planned reason code.
::    u will list a User Defined reason code.
::    If neither p nor u is specified the restart or shutdown is unplanned.
::    xx = The Major reason code (0-255)
::    yy = The Minor reason code (0-65535)
:: 4:1 - For application maintenance
:: Refer for more information: https://ss64.com/nt/shutdown.html


shutdown /r /f /m \\MachineName1 /t 1 /d P:4:1
shutdown /r /f /m \\MachineName2 /t 1 /d P:4:1
shutdown /r /f /m \\MachineName3 /t 1 /d P:4:1

pause
