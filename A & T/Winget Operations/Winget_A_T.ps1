$host.UI.RawUI.WindowTitle = "All in one Software Solution V29.10.22 8.34"

################################ Don't change anything below ################################

### Install WinGet ###
$hasPackageManager = Get-AppxPackage -Name 'Microsoft.Winget.Source' | Select-Object Name, Version
$hasVCLibs = Get-AppxPackage -Name 'Microsoft.VCLibs.140.00.UWPDesktop' | Select-Object Name, Version
$hasXAML = Get-AppxPackage -Name 'Microsoft.UI.Xaml.2.7*' | Select-Object Name, Version
$hasAppInstaller = Get-AppxPackage -Name 'Microsoft.DesktopAppInstaller' | Select-Object Name, Version
$DesktopPath = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::Desktop)
$errorlog = "winget_error.log"

function install_winget {
	Clear-Host
	Write-Host -ForegroundColor Yellow "Checking if WinGet is installed"
	if (!$hasPackageManager) {
		if ($hasVCLibs.Version -lt "14.0.30035.0") {
			Write-Host -ForegroundColor Yellow "Installing VCLibs dependencies..."
			Add-AppxPackage -Path "https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx"
			Write-Host -ForegroundColor Green "VCLibs dependencies successfully installed."
		}
		else {
			Write-Host -ForegroundColor Green "VCLibs is already installed. Skip..."
		}
		if ($hasXAML.Version -lt "7.2203.17001.0") {
			Write-Host -ForegroundColor Yellow "Installing XAML dependencies..."
			Add-AppxPackage -Path "https://github.com/Kugane/winget/raw/main/Microsoft.UI.Xaml.2.7_7.2203.17001.0_x64__8wekyb3d8bbwe.Appx"
			Write-Host -ForegroundColor Green "XAML dependencies successfully installed."
		}
		else {
			Write-Host -ForegroundColor Green "XAML is already installed. Skip..."
		}
		if ($hasAppInstaller.Version -lt "1.16.12653.0") {
			Write-Host -ForegroundColor Yellow "Installing WinGet..."
			$releases_url = "https://api.github.com/repos/microsoft/winget-cli/releases/latest"
			[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
			$releases = Invoke-RestMethod -Uri "$($releases_url)"
			$latestRelease = $releases.assets | Where-Object { $_.browser_download_url.EndsWith("msixbundle") } | Select-Object -First 1
			Add-AppxPackage -Path $latestRelease.browser_download_url
			Write-Host -ForegroundColor Green "WinGet Successfully installed."
		}
		# Fix for hangup on first start
		winget -v
		Write-Host
	}
	else {
		Write-Host -ForegroundColor Green "WinGet is already installed. Skip..."
		# Fix for hangup on first start
		winget -v
		Write-Host
	}
	Pause
	Clear-Host
}

### Finished ###
function finish {
	Write-Host
	Write-Host -ForegroundColor Magenta  "Task Successfull Completed"
	Write-Host
	Pause
}

### Updated All Apps and programs ###
function update_apps {
	winget.exe upgrade --all
}

### Debloating ###
function debloating {
	$bloatware = @(
		"Microsoft.Todos"
		"Microsoft.BingWallpaper"
		"Microsoft.UpdateAssistant"
		"Microsoft.549981C3F5F10" # Cortana Offline
		"Microsoft.Appconnector"
		"Microsoft.BingFinance"
		"Microsoft.BingNews"
		"Microsoft.BingSports"
		"Microsoft.BingTranslator"
		"Microsoft.BingWeather"
		"Microsoft.FreshPaint"
		"Microsoft.MicrosoftOfficeHub"
		"Microsoft.MicrosoftPowerBIForWindows"
		"Microsoft.MinecraftUWP"
		"Microsoft.NetworkSpeedTest"
		"Microsoft.Office.OneNote"
		"Microsoft.SkypeApp"
		"Microsoft.Wallet"
		"Microsoft.CommsPhone"
		"Microsoft.ConnectivityStore"
		"Microsoft.Office.Sway"
		"Microsoft.OneConnect"
		"Microsoft.BingFoodAndDrink"
		"Microsoft.BingHealthAndFitness"
		"Microsoft.BingTravel"
		"Microsoft.WindowsReadingList"
		"Microsoft.ScreenSketch"
		# "Microsoft.3DBuilder"
		# "Microsoft.MicrosoftSolitaireCollection"
		# "Microsoft.MicrosoftStickyNotes"
		# "Microsoft.People"
		# "Microsoft.Print3D"
		# "Microsoft.Windows.Photos"
		# "Microsoft.WindowsAlarms"
		# "Microsoft.WindowsCalculator"
		# "Microsoft.WindowsCamera"
		# "microsoft.windowscommunicationsapps"
		# "Microsoft.WindowsMaps"
		# "Microsoft.WindowsPhone"
		# "Microsoft.WindowsSoundRecorder"  
		# "Microsoft.Xbox.TCUI"
		# "Microsoft.XboxApp"
		# "Microsoft.XboxGameOverlay"
		# "Microsoft.XboxGamingOverlay"
		# "Microsoft.XboxIdentityProvider"
		# "Microsoft.XboxSpeechToTextOverlay"
		# "Microsoft.GetHelp"
		# "Microsoft.Getstarted"
		# "Microsoft.Messaging"
		# "Microsoft.WindowsFeedbackHub"
		# "Microsoft.Microsoft3DViewer"
		# "Microsoft.MSPaint"
		# "Microsoft.MixedReality.Portal"
	
		# non-Microsoft
		"2FE3CB00.PicsArt-PhotoStudio"
		"46928bounde.EclipseManager"
		"4DF9E0F8.Netflix"
		"613EBCEA.PolarrPhotoEditorAcademicEdition"
		"6Wunderkinder.Wunderlist"
		"7EE7776C.LinkedInforWindows"
		"89006A2E.AutodeskSketchBook"
		"9E2F88E3.Twitter"
		"A278AB0D.DisneyMagicKingdoms"
		"A278AB0D.MarchofEmpires"
		"ActiproSoftwareLLC.562882FEEB491" # next one is for the Code Writer from Actipro Software LLC
		"CAF9E577.Plex"  
		"ClearChannelRadioDigital.iHeartRadio"
		"D52A8D61.FarmVille2CountryEscape"
		"D5EA27B7.Duolingo-LearnLanguagesforFree"
		"DB6EA5DB.CyberLinkMediaSuiteEssentials"
		"Drawboard.DrawboardPDF"
		"Facebook.Facebook"
		"Fitbit.FitbitCoach"
		"Flipboard.Flipboard"
		"GAMELOFTSA.Asphalt8Airborne"
		"KeeperSecurityInc.Keeper"
		"NORDCURRENT.COOKINGFEVER"
		"PandoraMediaInc.29680B314EFC2"
		"Playtika.CaesarsSlotsFreeCasino"
		"ShazamEntertainmentLtd.Shazam"
		"SlingTVLLC.SlingTV"
		"TheNewYorkTimes.NYTCrossword"
		"ThumbmunkeysLtd.PhototasticCollage"
		"TuneIn.TuneInRadio"
		"WinZipComputing.WinZipUniversal"
		"XINGAG.XING"
		"flaregamesGmbH.RoyalRevolt2"
		"king.com.*"
		"king.com.BubbleWitch3Saga"
		"king.com.CandyCrushSaga"
		"king.com.CandyCrushSodaSaga"
		# "SpotifyAB.SpotifyMusic"
		# "DolbyLaboratories.DolbyAccess"
	);
	Write-Host -ForegroundColor Cyan "Remove bloatware"
	net start AppXSvc
	Foreach ($blt in $bloatware) {
		Write-Host -ForegroundColor Red "Removing: " $blt
		Get-AppxPackage -AllUsers $blt | Remove-AppxPackage
	}
	Pause
	Clear-Host
}

### Install Apps silent basic ###
function install_silent_basic {
	$apps = @(
		@{ name = "RARLab.WinRAR" },
		@{ name = "VideoLAN.VLC" },
		@{ name = "Google.Chrome" },
		@{ name = "qBittorrent.qBittorrent" },
		@{ name = "Microsoft.VisualStudioCode" },
		# @{ name = "Microsoft.DirectX" },
		# @{ name = "9N4WGH0Z6VHQ"; source = "msstore" }, # HEVC-Video Extension
		@{ name = "9PMMSR1CGPWG"; source = "msstore" }, # HEIF-PictureExtension
		@{ name = "9MVZQVXJBQ9V"; source = "msstore" }, # AV1 Video Extension
		@{ name = "9NCTDW2W1BH8"; source = "msstore" }, # Raw Image Extension
		@{ name = "9N95Q1ZZPMH4"; source = "msstore" }, # MPEG-2 Video Extension
		@{ name = "9PG2DK419DRG"; source = "msstore" }, # Webp Image Extensions
		@{ name = "9MVZQVXJBQ9V"; source = "msstore" } # AV1 Video Extension
	);

	Write-Host -ForegroundColor Cyan "Installing New Apps"
	Foreach ($app in $apps) {
		$listApp = winget list --exact -q $app.name
		if (![String]::Join("", $listApp).Contains($app.name)) {
			Write-Host -ForegroundColor Yellow  "Install: " $app.name
			# MS Store apps
			if ($null -ne $app.source) {
				winget install --exact --silent --accept-package-agreements --accept-source-agreements $app.name --source $app.source
				if ($LASTEXITCODE -eq 0) {
					Write-Host -ForegroundColor Green $app.name "Successfully installed."
				}
				else {
					$app.name + " Couldn't be installed." | Add-Content "$DesktopPath\$errorlog"
					Write-Host
					Write-Host -ForegroundColor Red $app.name "Couldn't be installed."
					Write-Host -ForegroundColor Yellow "Write in $DesktopPath\$errorlog"
					Write-Host
					Pause
				}
			}
			# All other Apps
			else {
				winget install --exact --silent --scope machine --accept-package-agreements --accept-source-agreements $app.name
				if ($LASTEXITCODE -eq 0) {
					Write-Host -ForegroundColor Green $app.name "Successfully installed."
				}
				else {
					$app.name + " Couldn't be installed." | Add-Content "$DesktopPath\$errorlog"
					Write-Host
					Write-Host -ForegroundColor Red $app.name "Couldn't be installed."
					Write-Host -ForegroundColor Yellow "Write in $DesktopPath\$errorlog"
					Write-Host
					Pause
				}
			}
		}
		else {
			Write-Host -ForegroundColor Yellow "Skip installation of " $app.name
		}
	}
	Pause
	Clear-Host
}

### Install Apps silent Full ###
function install_silent_full {
	$apps = @(
		@{ name = "RARLab.WinRAR" },
		@{ name = "VideoLAN.VLC" },
		@{ name = "Google.Chrome" },
		@{ name = "qBittorrent.qBittorrent" },
		@{ name = "Microsoft.VisualStudioCode" },
		@{ name = "CPUID.CPU-Z" },
		@{ name = "IObit.AdvancedSystemCare" },
		@{ name = "OBSProject.OBSStudio" },

		@{ name = "Python.Python.3.10" },
		@{ name = "Oracle.JDK.19" },
		@{ name = "ApacheFriends.Xampp.8.1" },
		@{ name = "msys2.msys2" },
		@{ name = "Git.Git" },
		@{ name = "Google.AndroidStudio" },

		@{ name = "Microsoft.PowerToys" },
		@{ name = "Microsoft.Sysinternals.Autoruns" },

		# @{ name = "Microsoft.DirectX" },
		# @{ name = "9N4WGH0Z6VHQ"; source = "msstore" }, # HEVC-Video Extension
		@{ name = "9PMMSR1CGPWG"; source = "msstore" }, # HEIF-PictureExtension
		@{ name = "9MVZQVXJBQ9V"; source = "msstore" }, # AV1 Video Extension
		@{ name = "9NCTDW2W1BH8"; source = "msstore" }, # Raw Image Extension
		@{ name = "9N95Q1ZZPMH4"; source = "msstore" }, # MPEG-2 Video Extension
		@{ name = "9PG2DK419DRG"; source = "msstore" }, # Webp Image Extensions
		@{ name = "9MVZQVXJBQ9V"; source = "msstore" } # AV1 Video Extension
	);

	Write-Host -ForegroundColor Cyan "Installing New Apps"
	Foreach ($app in $apps) {
		$listApp = winget list --exact -q $app.name
		if (![String]::Join("", $listApp).Contains($app.name)) {
			Write-Host -ForegroundColor Yellow  "Install: " $app.name
			# MS Store apps
			if ($null -ne $app.source) {
				winget install --exact --silent --accept-package-agreements --accept-source-agreements $app.name --source $app.source
				if ($LASTEXITCODE -eq 0) {
					Write-Host -ForegroundColor Green $app.name "Successfully installed."
				}
				else {
					$app.name + " Couldn't be installed." | Add-Content "$DesktopPath\$errorlog"
					Write-Host
					Write-Host -ForegroundColor Red $app.name "Couldn't be installed."
					Write-Host -ForegroundColor Yellow "Write in $DesktopPath\$errorlog"
					Write-Host
					Pause
				}
			}
			# All other Apps
			else {
				winget install --exact --silent --scope machine --accept-package-agreements --accept-source-agreements $app.name
				if ($LASTEXITCODE -eq 0) {
					Write-Host -ForegroundColor Green $app.name "Successfully installed."
				}
				else {
					$app.name + " Couldn't be installed." | Add-Content "$DesktopPath\$errorlog"
					Write-Host
					Write-Host -ForegroundColor Red $app.name "Couldn't be installed."
					Write-Host -ForegroundColor Yellow "Write in $DesktopPath\$errorlog"
					Write-Host
					Pause
				}
			}
		}
		else {
			Write-Host -ForegroundColor Yellow "Skip installation of " $app.name
		}
	}
	Pause
	Clear-Host
}

### Install Programming Apps silent ###
function install_silent_programming_apps {
	$apps = @(
		@{ name = "RARLab.WinRAR" },
		@{ name = "VideoLAN.VLC" },
		@{ name = "Google.Chrome" },
		@{ name = "Microsoft.VisualStudioCode" },
		@{ name = "Python.Python.3.10" },
		@{ name = "Oracle.JDK.19" },
		@{ name = "ApacheFriends.Xampp.8.1" },
		@{ name = "msys2.msys2" },
		@{ name = "Git.Git" },
		@{ name = "Google.AndroidStudio" },
		@{ name = "Microsoft.PowerToys" },
		@{ name = "Microsoft.Sysinternals.Autoruns" }
	);

	Write-Host -ForegroundColor Cyan "Installing New Apps"
	Foreach ($app in $apps) {
		$listApp = winget list --exact -q $app.name
		if (![String]::Join("", $listApp).Contains($app.name)) {
			Write-Host -ForegroundColor Yellow  "Install: " $app.name
			# MS Store apps
			if ($null -ne $app.source) {
				winget install --exact --silent --accept-package-agreements --accept-source-agreements $app.name --source $app.source
				if ($LASTEXITCODE -eq 0) {
					Write-Host -ForegroundColor Green $app.name "Successfully installed."
				}
				else {
					$app.name + " Couldn't be installed." | Add-Content "$DesktopPath\$errorlog"
					Write-Host
					Write-Host -ForegroundColor Red $app.name "Couldn't be installed."
					Write-Host -ForegroundColor Yellow "Write in $DesktopPath\$errorlog"
					Write-Host
					Pause
				}
			}
			# All other Apps
			else {
				winget install --exact --silent --scope machine --accept-package-agreements --accept-source-agreements $app.name
				if ($LASTEXITCODE -eq 0) {
					Write-Host -ForegroundColor Green $app.name "Successfully installed."
				}
				else {
					$app.name + " Couldn't be installed." | Add-Content "$DesktopPath\$errorlog"
					Write-Host
					Write-Host -ForegroundColor Red $app.name "Couldn't be installed."
					Write-Host -ForegroundColor Yellow "Write in $DesktopPath\$errorlog"
					Write-Host
					Pause
				}
			}
		}
		else {
			Write-Host -ForegroundColor Yellow "Skip installation of " $app.name
		}
	}
	Pause
	Clear-Host
	
}

### Install Graphical Apps silent ###
function install_silent_graphical_apps {
	$apps = @(
		@{ name = "RARLab.WinRAR" },
		@{ name = "VideoLAN.VLC" },
		@{ name = "Google.Chrome" }
	);

	Write-Host -ForegroundColor Cyan "Installing New Apps"
	Foreach ($app in $apps) {
		$listApp = winget list --exact -q $app.name
		if (![String]::Join("", $listApp).Contains($app.name)) {
			Write-Host -ForegroundColor Yellow  "Install: " $app.name
			# MS Store apps
			if ($null -ne $app.source) {
				winget install --exact --silent --accept-package-agreements --accept-source-agreements $app.name --source $app.source
				if ($LASTEXITCODE -eq 0) {
					Write-Host -ForegroundColor Green $app.name "Successfully installed."
				}
				else {
					$app.name + " Couldn't be installed." | Add-Content "$DesktopPath\$errorlog"
					Write-Host
					Write-Host -ForegroundColor Red $app.name "Couldn't be installed."
					Write-Host -ForegroundColor Yellow "Write in $DesktopPath\$errorlog"
					Write-Host
					Pause
				}
			}
			# All other Apps
			else {
				winget install --exact --silent --scope machine --accept-package-agreements --accept-source-agreements $app.name
				if ($LASTEXITCODE -eq 0) {
					Write-Host -ForegroundColor Green $app.name "Successfully installed."
				}
				else {
					$app.name + " Couldn't be installed." | Add-Content "$DesktopPath\$errorlog"
					Write-Host
					Write-Host -ForegroundColor Red $app.name "Couldn't be installed."
					Write-Host -ForegroundColor Yellow "Write in $DesktopPath\$errorlog"
					Write-Host
					Pause
				}
			}
		}
		else {
			Write-Host -ForegroundColor Yellow "Skip installation of " $app.name
		}
	}
	Pause
	Clear-Host
	
}

### Register Taskjob ###
function taskjob {
	$taskname = 'WinGet AutoUpgrade & Cleanup'
	Write-Host -ForegroundColor Yellow "Checking for Taskjob..."
	if ($(Get-ScheduledTask -TaskName $taskname -ErrorAction SilentlyContinue).TaskName -eq $taskname) {
		Unregister-ScheduledTask -TaskName $taskname -Confirm:$False
		Write-Host -ForegroundColor Yellow "Taskjob already exists. Update to newer version..."
		[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
		Invoke-WebRequest -Uri https://github.com/Kugane/winget/raw/main/WinGet%20AutoUpgrade%20%26%20Cleanup.xml -OutFile '$taskjob'
		Register-ScheduledTask -xml (Get-Content '$taskjob' | Out-String) -TaskName $taskname
		Write-Host -ForegroundColor Green "Taskjob Successfully updated."
	}
	else {
		Write-Host -ForegroundColor Yellow "Installing taskjob..."
		[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
		Invoke-WebRequest -Uri https://github.com/Kugane/winget/raw/main/WinGet%20AutoUpgrade%20%26%20Cleanup.xml -OutFile '$taskjob'
		Register-ScheduledTask -xml (Get-Content '$taskjob' | Out-String) -TaskName $taskname
		Write-Host -ForegroundColor Green "Taskjob Successfully installed."
	}
	Pause
	Clear-Host
}

### Get List of installed Apps ###
function get_list {
	$timestamp = get-date -Format dd_MM_yyyy
	$newPath = "$DesktopPath\" + "winget_" + $env:computername + "_$timestamp" + ".txt"
	Write-Host -ForegroundColor Yellow "Generating Applist..."
	winget list > $newPath
	Write-Host -ForegroundColor Magenta "List saved on $newPath"
	Pause
}

function install_gui_basic_apps {
	$graphical = @(
		@{ name = "RARLab.WinRAR" },
		@{ name = "VideoLAN.VLC" },
		@{ name = "Google.Chrome" },
		@{ name = "qBittorrent.qBittorrent" },
		@{ name = "Microsoft.VisualStudioCode" },
		# @{ name = "Microsoft.DirectX" },
		# @{ name = "9N4WGH0Z6VHQ"; source = "msstore" }, # HEVC-Video Extension
		@{ name = "9PMMSR1CGPWG"; source = "msstore" }, # HEIF-PictureExtension
		@{ name = "9MVZQVXJBQ9V"; source = "msstore" }, # AV1 Video Extension
		@{ name = "9NCTDW2W1BH8"; source = "msstore" }, # Raw Image Extension
		@{ name = "9N95Q1ZZPMH4"; source = "msstore" }, # MPEG-2 Video Extension
		@{ name = "9PG2DK419DRG"; source = "msstore" }, # Webp Image Extensions
		@{ name = "9MVZQVXJBQ9V"; source = "msstore" } # AV1 Video Extension
	);
	Write-Host -ForegroundColor Cyan "Installing New Apps with GUI"
	Foreach ($gui in $graphical) {
		$listGUI = winget list --exact -q $gui.name
		if (![String]::Join("", $listGUI).Contains($gui.name)) {
			Write-Host -ForegroundColor Yellow "Install: " $gui.name
			if ($null -ne $gui.source) {
				winget install --exact --interactive --accept-package-agreements --accept-source-agreements $gui.name --source $gui.source
				if ($LASTEXITCODE -eq 0) {
					Write-Host -ForegroundColor Green $gui.name "Successfully installed."
				}
				else {
					$gui.name + " Couldn't be installed." | Add-Content "$DesktopPath\$errorlog"
					Write-Host
					Write-Host -ForegroundColor Red $gui.name "couldn't be installed."
					Write-Host -ForegroundColor Yellow "Write in $DesktopPath\$errorlog"
					Write-Host
					Pause
				}
			}
			else {
				winget install --exact --interactive --accept-package-agreements --accept-source-agreements $gui.name
				if ($LASTEXITCODE -eq 0) {
					Write-Host -ForegroundColor Green $gui.name "Successfully installed."
				}
				else {
					$gui.name + " Couldn't be installed." | Add-Content "$DesktopPath\$errorlog"
					Write-Host
					Write-Host -ForegroundColor Red $gui.name "couldn't be installed."
					Write-Host -ForegroundColor Yellow "Write in $DesktopPath\$errorlog"
					Write-Host
					Pause
				}
			}
		}
		else {
			Write-Host -ForegroundColor Yellow "Skip installation of " $gui.name
		}
	}
	Pause
	Clear-Host
}

function install_gui_programmer_apps {
	$graphical = @(
		@{ name = "RARLab.WinRAR" },
		@{ name = "VideoLAN.VLC" },
		@{ name = "Google.Chrome" },
		@{ name = "Microsoft.VisualStudioCode" },
		@{ name = "Python.Python.3.10" },
		@{ name = "Oracle.JDK.19" },
		@{ name = "ApacheFriends.Xampp.8.1" },
		@{ name = "msys2.msys2" },
		@{ name = "Git.Git" },
		@{ name = "Google.AndroidStudio" },
		@{ name = "Microsoft.PowerToys" },
		@{ name = "Microsoft.Sysinternals.Autoruns" }
	);
	Write-Host -ForegroundColor Cyan "Installing New Apps with GUI"
	Foreach ($gui in $graphical) {
		$listGUI = winget list --exact -q $gui.name
		if (![String]::Join("", $listGUI).Contains($gui.name)) {
			Write-Host -ForegroundColor Yellow "Install: " $gui.name
			if ($null -ne $gui.source) {
				winget install --exact --interactive --accept-package-agreements --accept-source-agreements $gui.name --source $gui.source
				if ($LASTEXITCODE -eq 0) {
					Write-Host -ForegroundColor Green $gui.name "Successfully installed."
				}
				else {
					$gui.name + " Couldn't be installed." | Add-Content "$DesktopPath\$errorlog"
					Write-Host
					Write-Host -ForegroundColor Red $gui.name "couldn't be installed."
					Write-Host -ForegroundColor Yellow "Write in $DesktopPath\$errorlog"
					Write-Host
					Pause
				}
			}
			else {
				winget install --exact --interactive --accept-package-agreements --accept-source-agreements $gui.name
				if ($LASTEXITCODE -eq 0) {
					Write-Host -ForegroundColor Green $gui.name "Successfully installed."
				}
				else {
					$gui.name + " Couldn't be installed." | Add-Content "$DesktopPath\$errorlog"
					Write-Host
					Write-Host -ForegroundColor Red $gui.name "couldn't be installed."
					Write-Host -ForegroundColor Yellow "Write in $DesktopPath\$errorlog"
					Write-Host
					Pause
				}
			}
		}
		else {
			Write-Host -ForegroundColor Yellow "Skip installation of " $gui.name
		}
	}
	Pause
	Clear-Host
}

function install_gui_graphical_apps {
	$graphical = @(
		@{ name = "RARLab.WinRAR" },
		@{ name = "VideoLAN.VLC" },
		@{ name = "Google.Chrome" }
	);
	Write-Host -ForegroundColor Cyan "Installing New Apps with GUI"
	Foreach ($gui in $graphical) {
		$listGUI = winget list --exact -q $gui.name
		if (![String]::Join("", $listGUI).Contains($gui.name)) {
			Write-Host -ForegroundColor Yellow "Install: " $gui.name
			if ($null -ne $gui.source) {
				winget install --exact --interactive --accept-package-agreements --accept-source-agreements $gui.name --source $gui.source
				if ($LASTEXITCODE -eq 0) {
					Write-Host -ForegroundColor Green $gui.name "Successfully installed."
				}
				else {
					$gui.name + " Couldn't be installed." | Add-Content "$DesktopPath\$errorlog"
					Write-Host
					Write-Host -ForegroundColor Red $gui.name "couldn't be installed."
					Write-Host -ForegroundColor Yellow "Write in $DesktopPath\$errorlog"
					Write-Host
					Pause
				}
			}
			else {
				winget install --exact --interactive --accept-package-agreements --accept-source-agreements $gui.name
				if ($LASTEXITCODE -eq 0) {
					Write-Host -ForegroundColor Green $gui.name "Successfully installed."
				}
				else {
					$gui.name + " Couldn't be installed." | Add-Content "$DesktopPath\$errorlog"
					Write-Host
					Write-Host -ForegroundColor Red $gui.name "couldn't be installed."
					Write-Host -ForegroundColor Yellow "Write in $DesktopPath\$errorlog"
					Write-Host
					Pause
				}
			}
		}
		else {
			Write-Host -ForegroundColor Yellow "Skip installation of " $gui.name
		}
	}
	Pause
	Clear-Host
}

function install_gui_full_apps {
	$graphical = @(
		@{ name = "RARLab.WinRAR" },
		@{ name = "VideoLAN.VLC" },
		@{ name = "Google.Chrome" },
		@{ name = "qBittorrent.qBittorrent" },
		@{ name = "Microsoft.VisualStudioCode" },
		@{ name = "CPUID.CPU-Z" },
		@{ name = "IObit.AdvancedSystemCare" },
		@{ name = "OBSProject.OBSStudio" },

		@{ name = "Python.Python.3.10" },
		@{ name = "Oracle.JDK.19" },
		@{ name = "ApacheFriends.Xampp.8.1" },
		@{ name = "msys2.msys2" },
		@{ name = "Git.Git" },
		@{ name = "Google.AndroidStudio" },

		@{ name = "Microsoft.PowerToys" },
		@{ name = "Microsoft.Sysinternals.Autoruns" },

		# @{ name = "Microsoft.DirectX" },
		# @{ name = "9N4WGH0Z6VHQ"; source = "msstore" }, # HEVC-Video Extension
		@{ name = "9PMMSR1CGPWG"; source = "msstore" }, # HEIF-PictureExtension
		@{ name = "9MVZQVXJBQ9V"; source = "msstore" }, # AV1 Video Extension
		@{ name = "9NCTDW2W1BH8"; source = "msstore" }, # Raw Image Extension
		@{ name = "9N95Q1ZZPMH4"; source = "msstore" }, # MPEG-2 Video Extension
		@{ name = "9PG2DK419DRG"; source = "msstore" }, # Webp Image Extensions
		@{ name = "9MVZQVXJBQ9V"; source = "msstore" } # AV1 Video Extension
	);
	Write-Host -ForegroundColor Cyan "Installing New Apps with GUI"
	Foreach ($gui in $graphical) {
		$listGUI = winget list --exact -q $gui.name
		if (![String]::Join("", $listGUI).Contains($gui.name)) {
			Write-Host -ForegroundColor Yellow "Install: " $gui.name
			if ($null -ne $gui.source) {
				winget install --exact --interactive --accept-package-agreements --accept-source-agreements $gui.name --source $gui.source
				if ($LASTEXITCODE -eq 0) {
					Write-Host -ForegroundColor Green $gui.name "Successfully installed."
				}
				else {
					$gui.name + " Couldn't be installed." | Add-Content "$DesktopPath\$errorlog"
					Write-Host
					Write-Host -ForegroundColor Red $gui.name "couldn't be installed."
					Write-Host -ForegroundColor Yellow "Write in $DesktopPath\$errorlog"
					Write-Host
					Pause
				}
			}
			else {
				winget install --exact --interactive --accept-package-agreements --accept-source-agreements $gui.name
				if ($LASTEXITCODE -eq 0) {
					Write-Host -ForegroundColor Green $gui.name "Successfully installed."
				}
				else {
					$gui.name + " Couldn't be installed." | Add-Content "$DesktopPath\$errorlog"
					Write-Host
					Write-Host -ForegroundColor Red $gui.name "couldn't be installed."
					Write-Host -ForegroundColor Yellow "Write in $DesktopPath\$errorlog"
					Write-Host
					Pause
				}
			}
		}
		else {
			Write-Host -ForegroundColor Yellow "Skip installation of " $gui.name
		}
	}
	Pause
	Clear-Host
}


### Menu For what to do ###
function menu {
	# Created By Richu Antony 
	Write-Host "`n"
	Write-Host "`t   Author: Richu Antony"
	[string]$Title = 'Please Read before you choose'
	Clear-Host
	Write-Host "`n"
	Write-Host "`t   RRRRRRRRRRRR  IIIIIIIIIIIIIII CCCCCCCCC    AAAAAAA      " -ForegroundColor Magenta
	Write-Host "`t   RRR      RRRR     IIIIIII    CCCC         AAAAAAAAA     " -ForegroundColor Blue
	Write-Host "`t   RRR      RRRR      IIIII    CCCC         AAAA   AAAA    " -ForegroundColor Green
	Write-Host "`t   RRR     RRRR        III    CCCC         AAAAAA AAAAAA   " -ForegroundColor Gray
	Write-Host "`t   RRRRRRRRRR          III    CCCC         AAAAAAAAAAAAA   " -ForegroundColor Yellow
	Write-Host "`t   RRR    RRRR        IIIII    CCCC        AAAAA   AAAAA   " -ForegroundColor Red
	Write-Host "`t   RRR     RRRR      IIIIIII    CCCCC      AAAA     AAAA   " -ForegroundColor DarkBlue
	Write-Host "`t   RRR      RRRR IIIIIIIIIIIIIII CCCCCCCCC AAA       AAA   " -ForegroundColor Magenta
	Write-Host "`n"
	Write-Host "`t   ================ $Title ================"
	
	Write-Host
	Write-Host "`t   Standard Choice" -ForegroundColor Magenta
	Write-Host "`t   0: Quit" -ForegroundColor Red 
	Write-Host "`t   1: (Required) Just install Winget"
	Write-Host "`t   2: (Non-Essentials) Remove bloatware"
	Write-Host "`t   3: (User: Basic) Automation Installation Without User interaction"
	Write-Host "`t   4: (User: Full kit) Automation Installation Without User interaction" 
	write-Host "`t   5: Update All the installed Apps"
	Write-Host "`t   6: Taskjob for automatic updates"
	Write-Host "`t   7: Get the List of all installed Apps"
	Write-Host "`t   8: Recommended Automation (Basic User: 1, 2, 3, 5, 6)"
	Write-Host "`t   9: Recommended Automation (Advanced User: 1, 2, 4, 5, 6, 7)"

	Write-Host "`t   Recommended Choice" -ForegroundColor Magenta
	Write-Host "`t   10: (User: Programmer) Automation Installation Without User interaction" 
	Write-Host "`t   11: (User: Graphical) Automation Installation Without User interaction" 

	Write-Host "`t   Not Recommended Choice" -ForegroundColor Magenta
	Write-Host "`t   12: (User: Basic) With User interaction"
	Write-Host "`t   13: (User: Programmer) With User interaction"
	Write-Host "`t   14: (User: Graphical) With User interaction"
	Write-Host "`t   15: (User: Full kit) With User interaction"

	Write-Host "`n"

	$actions = "0"
	while ($actions -notin "0..15") {
		$actions = Read-Host -Prompt 'What you want to do? '
		if ($actions -in 0 .. 15) {
			if ($actions -eq 0) {
				exit
			}
			if ($actions -eq 1) {
				install_winget
				finish
			}
			if ($actions -eq 2) {
				debloating
				finish
			}
			if ($actions -eq 3) {
				install_winget
				install_silent_basic
				finish
			}
			if ($actions -eq 4) {
				install_winget
				install_silent_full
				finish
			}
			if ($actions -eq 5) {
				update_apps
				finish
			}
			if ($actions -eq 6) {
				taskjob
				finish
			}
			if ($actions -eq 7) {
				get_list
			}
			if ($actions -eq 8) {
				install_winget
				debloating
				install_silent_basic
				update_apps
				taskjob
				finish
			}
			if ($actions -eq 9) {
				install_winget
				debloating
				install_silent_full
				update_apps
				taskjob
				get_list
				finish
			}
			if ($actions -eq 10) {
				install_winget
				debloating
				install_silent_programming_apps
				update_apps
				taskjob
				get_list
				finish
			}
			if ($actions -eq 11) {
				install_winget
				debloating
				install_silent_graphical_apps
				update_apps
				taskjob
				get_list
				finish
			}
			if ($actions -eq 12) {
				install_winget
				debloating
				install_gui_basic_apps
				update_apps
				taskjob
				get_list
				finish
			}
			if ($actions -eq 13) {
				install_winget
				debloating
				install_gui_programmer_apps
				update_apps
				taskjob
				get_list
				finish
			}
			if ($actions -eq 14) {
				install_winget
				debloating
				install_gui_graphical_apps
				update_apps
				taskjob
				get_list
				finish
			}
			if ($actions -eq 15) {
				install_winget
				debloating
				install_gui_full_apps
				update_apps
				taskjob
				get_list
				finish
			}
			menu
		}
		else {
			menu
		}
	}
}
menu
