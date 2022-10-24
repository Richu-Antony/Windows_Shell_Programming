"Checking domain..."
$domain = "$env:COMPUTERNAME.$env:USERDNSDOMAIN"
$Logfile = "\\FBESERVER\Data2\royce\logs\$(gc env:computername)-domain.log"
$oldLogfiles = "\\FBESERVER\Data2\royce\logs\old"

Function LogWrite
{
   Param ([string]$logstring)

   Add-content $Logfile -value $logstring
}


function countLines {
  if (!(Test-Path $logfile)) {
    Write-Warning "Log file does not exist."
    Write-Warning "Creating new file..."
    domainController
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
    domainController
  }
  else{
  Write-Warning "Something is wrong."
  }
}



LogWrite "==========Starting domain check========="
function domainController {
	$royce = Test-NetConnection -ComputerName 192.168.0.223 -InformationLevel Quiet
	if($royce -eq "True") {
		Write-Host "Can connect to domain controller" -ForegroundColor green
		LogWrite "Can connect to domain controller"
		$didPortTest = 1
	}
	if($royce -ne "True") {
		"Cannot connect to domain controller"
		$portStatus = "Cannot connect to domain controller"
		LogWrite "$portStatus"
		"$portStatus"
		$didPortTest = 2
	}
	if("$domain".Contains('.INTERNAL.FBELECTRIC.COM') -eq "True") {
		LogWrite "You are connected to the domain as $domain"
		Write-Host "You are connected to the domain as $domain" -ForegroundColor green
	}
	else {
		LogWrite You do not seem to be connected to the domain! Connected as $domain
		Write-Warning "You do not seem to be connected to the domain!"
		Write-Warning "You are connected as $domain"
	}
}
countLines