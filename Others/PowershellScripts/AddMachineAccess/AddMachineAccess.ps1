param ([string]$machine)

$Uname = 'root'
$Password = 'password'
$Pwd = ConvertTo-SecureString -AsPlainText $Password -Force
$Cred = New-Object System.Management.Automation.PSCredential -ArgumentList $Uname,$Pwd

try
{
Invoke-Command -ComputerName $machine -ScriptBlock { Add-LocalGroupMember -Group "Administrators" -Member "domain\user1","domain\user2"} -Credential $Cred
Write-Host "Added Successfully!"
}
catch
{

}
