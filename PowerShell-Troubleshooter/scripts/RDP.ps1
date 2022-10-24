$Logfile = "\\FBESERVER\Data2\royce\logs\$(gc env:computername)-rdp.log"
$oldLogfiles = "\\FBESERVER\Data2\royce\logs\old"
$computer_name = $(gc env:computername)
$current_time = Get-Date -Format G
$secure_name = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
$accountInfo = "Account Name: $env:UserName || Domain: $env:UserDomain || It is currently $current_time"

Function LogWrite
{
   Param ([string]$logstring)

   Add-content $Logfile -value $logstring
}
function testPort {
	$royce = Test-NetConnection -Port 3389 -ComputerName $(gc env:computername) -InformationLevel Quiet
	if($royce -eq "True") {
		"Default RDP port is active."
		$portStatus = "Default RDP port is active."
		LogWrite "$portStatus"
		$didPortTest = 1
	}
	if($royce -ne "True") {
		"Default RDP port is inactive."
		$portStatus = "Default RDP port is inactive."
		LogWrite "$portStatus"
		"$portStatus"
		$didPortTest = 2
	}
}
function countLines
{
	if (!(Test-Path $logfile)) {
  		Write-Warning "Log file does not exist."
  		Write-Warning "Creating new file..."
		isRDP
	}
	if(Test-Path $logfile){
		$measure = Get-Content $Logfile | Measure-Object 
		$lines = $measure.Count
		"Number of lines in log file: $lines"

		if($lines -gt 100){
			Write-Warning "Moving current log file to /old/"
			LogWrite "\\END//"
			Move-Item $logfile $oldLogfiles -Force
			startCheck
		}

		isRDP
	}
	else{
	Write-Warning "Something is wrong."
	}
}

Function startCheck {
	"Starting Script..."
	LogWrite "================= $secure_name ================="
    LogWrite "$accountInfo"
	testPort
	countLines
}

function resultDisplay {
	"Complete."
}

Function isRDP {
	if ((Get-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server').fDenyTSConnections -eq 1)
          {"RDP connections are not allowed on $computer_name"

          LogWrite "RDP connections are not allowed"
          LogWrite "================== End Script =================="
          LogWrite " "}

	elseif ((Get-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp').UserAuthentication -eq 1) {
         "Only Secure RDP Connections are allowed on $computer_name"

         LogWrite "Only Secure RDP Connections are allowed on $computer_name"
         LogWrite "================== End Script =================="
         LogWrite " "} 

 		else {
 		 "All RDP Connections are allowed on $computer_name"

         LogWrite "All RDP Connections are allowed on $computer_name"
         LogWrite "================== End Script =================="
         LogWrite " "}
	Start-Sleep 5
	resultDisplay
} 
startCheck