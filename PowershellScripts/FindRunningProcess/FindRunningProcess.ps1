# Purpose:
# To find  if specific processes is running in a machine.
# Useful if you wish to check for one and start if the processes is not running.
# You could schedule a task for the same using this script as a trigger.

$Uname = 'Domain\UserName'
$Password = 'Password'

$Pwd = ConvertTo-SecureString -AsPlainText $Password -Force
$Cred = New-Object System.Management.Automation.PSCredential -ArgumentList $Uname,$Pwd

Invoke-Command -ComputerName "MachineName1" -ScriptBlock{(Get-Process | Where -Property ProcessName -eq "devenv.exe" | Select-Object -ExpandProperty Path)} -Credential $Cred > "C:\Processes1.txt"
Invoke-Command -ComputerName "MachineName2" -ScriptBlock{(Get-Process | Where -Property ProcessName -eq "devenv.exe" | Select-Object -ExpandProperty Path)} -Credential $Cred > "C:\Processes2.txt"
