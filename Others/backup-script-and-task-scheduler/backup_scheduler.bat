:: Author Jan Wądołowski
:: 2021-02-10

@echo off

:: Add scheduler task to launch this script once every day
:: /tr path must reflect path where you store this script on your hard drive
schtasks.exe /create /tn backup-task /sc daily /st 13:00 /tr "D:\Desktop\backup_script.bat"

exit 0