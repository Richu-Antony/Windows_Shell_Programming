param (
[Parameter(Mandatory=$true)]
[string] $uninstallName,
[string] $elevated
)
if($elevated -eq "True") {
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }
}
if($elevated -eq "False") {
"ELEVATION not required"
}


$Logfile = "\\FBESERVER\Data2\royce\logs\$(gc env:computername)-uninstall.log"
$pathtolog = "\\FBESERVER\Data2\royce\logs"

$computer_name = $(gc env:computername)
$current_time = Get-Date -Format G
$secure_name = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name

Function LogWrite
{
   Param ($logstring)

   Add-content $Logfile -value $logstring
}


LogWrite "Removing $uninstallName on $computer_name ($secure_name) at $current_time"s

$myVer = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall  |
    Get-ItemProperty |
        Where-Object {$_.DisplayName -match "$uninstallName" } |
            Select-Object -Property DisplayName, UninstallString

ForEach ($ver in $myVer) {

    If ($ver.UninstallString) {

        $uninst = $ver.UninstallString
        $uninst = $uninst.Replace('{',' ').Replace('}',' ')
        logWrite $uninst
        Start-Process -FilePath $uninst /S
    }

}

LogWrite "============ Uninstalling Complete ======================"
Start-Sleep 10
LogWrite "========================================================="
LogWrite "========== Generating Chart After Uninstall ============="
LogWrite "Complete"