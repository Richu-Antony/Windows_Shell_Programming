#
#   Powershell profile by olback
#   github.com/olback/windows-things
#

# Clear the Powershell terminal
Clear-Host

# Print some info about the environment
Write-Output "`n"
Write-Output "  Powershell v$($PSVersionTable.PSVersion.ToString())`n"

Write-Output "  Hostname : $env:ComputerName"
Write-Output "  Username : $env:UserName"
Write-Output "  Local IP : $(Test-Connection -ComputerName (hostname) -Count 1  | Select -ExpandProperty IPV4Address)"
#Write-Output "  PublicIP : $(curl https://whois.olback.net/raw.php?myip)"
Write-Output "  Location : $pwd"
Write-Output "  Is Admin : $(([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))`n`n"

# Set aliases
Set-Alias c clear
Set-Alias p powershell
