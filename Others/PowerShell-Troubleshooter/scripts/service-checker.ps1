param (
[Parameter(Mandatory=$true)]
[string] $ServiceName
)
$Logfile = "\\FBESERVER\Data2\royce\logs\$(gc env:computername)-service.log"
$oldLogfiles = "\\FBESERVER\Data2\royce\logs\old"
$computer_name = $(gc env:computername)
$current_time = Get-Date -Format G
$secure_name = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
$accountInfo = "Account Name: $env:UserName || Domain: $env:UserDomain || It is currently $current_time"

if ($ServiceName -eq "Spooler") {
  $PublicName = "Print Spooler"
  Write-Host "Checking $PublicName service." -ForegroundColor green
}
if ($ServiceName -eq "TermService") {
  $PublicName = "Remote Desktop"
  Write-Host "Checking $PublicName service." -ForegroundColor green
}
if ($ServiceName -eq "SsPaAdm") {
  $PublicName = "Symantec.cloud Cloud Agent"
  Write-Host "Checking $PublicName service." -ForegroundColor green
}
if ($ServiceName -eq "ssSpnAv") {
  $PublicName = "Symantec.cloud Endpoint Protection"
  Write-Host "Checking $PublicName service." -ForegroundColor green
}

Function LogWrite
{
   Param ([string]$logstring)

   Add-content $Logfile -value $logstring
}

function countLines
{
  if (!(Test-Path $logfile)) {
    Write-Warning "Log file does not exist."
    Write-Warning "Creating new file..."
    serviceCheck
  }
  if(Test-Path $logfile){
    $measure = Get-Content $Logfile | Measure-Object 
    $lines = $measure.Count
    "Number of lines in log file: $lines"

    if($lines -gt 100){
      Write-Warning "Moving current log file to /old/"
      LogWrite "\\END//"
      Move-Item $logfile $oldLogfiles -Force
    }
    serviceCheck
  }
  else{
  Write-Warning "Something is wrong."
  }
}

function serviceCheck {
  LogWrite "==== $secure_name on $computer_name at $current_time ===="
  Start-Sleep 2
  if (Get-Service $ServiceName -ErrorAction SilentlyContinue)
    {
      if ((Get-Service -Name $ServiceName).Status -eq 'Running')
        {
          $ServiceStatus = (Get-Service -Name $ServiceName).Status
          Write-Host $ServiceName "-" $ServiceStatus "-" $PublicName
          LogWrite "$ServiceName - $ServiceStatus - $PublicName"
          Start-Sleep 1
        }
      elseif ((Get-Service -Name $ServiceName).Status -eq 'Stopped')
        {
          $ServiceStatus = (Get-Service -Name $ServiceName).Status
          Write-Host $ServiceName "-" $ServiceStatus "-" $PublicName
          LogWrite "$ServiceName - $ServiceStatus - $PublicName"
          Start-Sleep 1
        } 
      else
        {
          $ServiceStatus = (Get-Service -Name $ServiceName).Status
          Write-Host $ServiceName "-" $ServiceStatus "-" $PublicName
          LogWrite "$ServiceName - $ServiceStatus - $PublicName"
          Start-Sleep 1
        }
    }
  else
    {
      Write-Host "$ServiceName not found"
      LogWrite $ServiceName not found
      Start-Sleep 1
    }
}
countLines