"Starting Script"
cd $Env:userprofile
dir
start powershell {.\AppData\Roaming\change-status.ps1}

"Script Over"
Start-Sleep 5
