# Created By Richu Antony 
Write-Host "Author: Richu Antony"

$graphical = @(
	@{ name = "7zip.7zip" },
	@{ name = "VideoLAN.VLC" },
	@{ name = "Google.Chrome" },
	@{ name = "qBittorrent.qBittorrent" },
	@{ name = "IObit.AdvancedSystemCare" },
	@{ name = "CPUID.CPU-Z" }
	@{ name = "OBSProject.OBSStudio" }
	@{ name = "Microsoft.VisualStudioCode" }
	@{ name = "Oracle.JDK.18" }
	@{ name = "ApacheFriends.Xampp" }
	@{ name = "Python.Python.3" }
	@{ name = "msys2.msys2" }
	@{ name = "Git.Git" }
	@{ name = "Google.AndroidStudio" }

	# @{name = "IObit.Uninstaller" },
	# @{name = "Piriform.CCleaner" },
	# @{name = "Microsoft.PowerToys" }
	# @{name = "Hirschmann.NotebookFanControl" }
	#@{name = "BlenderFoundation.Blender" }
	
	# @{name = "JRSoftware.InnoSetup" }
	
	# @{name = "MongoDB.Server" }
	#@{name = "MongoDB.Compass.Full" }
	#@{name = "Notepad++.Notepad++" }
	
	# @{name = "9NCBCSZSJRSB"; source = "msstore" } # Spotify
	# @{name = "9NKSQGP7F2NH"; source = "msstore" } # Whatsapp Desktop
	# @{name = "9WZDNCRFJ3TJ"; source = "msstore" } # Netflix
	# @{name = "9P6RC76MSMMJ"; source = "msstore" } # Prime Video
);

# These apps are installed silently for all users 
# For msstore apps you need to specify the source like below
$apps = @(
	@{ name = "Microsoft.DirectX" }
	@{ name = "Microsoft.VC++2005Redist-x64" }
	@{ name = "Microsoft.VC++2008Redist-x64" }
	@{ name = "Microsoft.VC++2010Redist-x64" }
	@{ name = "Microsoft.VC++2012Redist-x64" }
	@{ name = "Microsoft.VC++2013Redist-x64" }
	@{ name = "Microsoft.VC++2015-2019Redist-x64" }
	@{ name = "Microsoft.VC++2015-2022Redist-x64" }
	@{ name = "Microsoft.VC++2015Redist-x64" }
	@{ name = "Microsoft.VC++2017Redist-x64" }
	@{ name = "Microsoft.DotNet.DesktopRuntime.3_1" }
	@{ name = "Microsoft.DotNet.DesktopRuntime.5" }
	@{ name = "Microsoft.DotNet.DesktopRuntime.6" }
	@{ name = "9PMMSR1CGPWG"; source = "msstore" } # HEIF-PictureExtension
	@{ name = "9N4WGH0Z6VHQ"; source = "msstore" } # HEVC-Video Extension
	@{ name = "9MVZQVXJBQ9V"; source = "msstore" } # AV1 Video Extension
	@{ name = "9NCTDW2W1BH8"; source = "msstore" } # Raw Image Extension
	@{ name = "9N95Q1ZZPMH4"; source = "msstore" } # MPEG-2 Video Extension
	@{ name = "9PG2DK419DRG"; source = "msstore" } # Webp Image Extensions
	@{ name = "9MVZQVXJBQ9V"; source = "msstore" } # AV1 Video Extension
);

$bloatware = @(
	# default Windows 11 apps
	"MicrosoftTeams"
	"Microsoft.Todos"
	# "Microsoft.PowerAutomateDesktop"
	"Microsoft.BingWallpaper"
	
	# default Windows 10 apps
	"Microsoft.UpdateAssistant"
	"Microsoft.549981C3F5F10" # Cortana Offline
	"Microsoft.OneDriveSync" # Onedrive
	"Microsoft.3DBuilder"
	"Microsoft.BingFinance"
	"Microsoft.BingNews"
	"Microsoft.BingSports"
	"Microsoft.BingTranslator"
	"Microsoft.BingWeather"
	"Microsoft.FreshPaint"
	"Microsoft.MicrosoftOfficeHub"
	"Microsoft.MicrosoftPowerBIForWindows"
	# "Microsoft.MicrosoftSolitaireCollection"
	# "Microsoft.MicrosoftStickyNotes"
	"Microsoft.MinecraftUWP"
	"Microsoft.NetworkSpeedTest"
	"Microsoft.Office.OneNote"
	# "Microsoft.People"
	# "Microsoft.Print3D"    
	# "Microsoft.WindowsAlarms"
	# "microsoft.windowscommunicationsapps"    # Mail and Calender     
	# "Microsoft.WindowsMaps"
	"Microsoft.SkypeApp"
	"Microsoft.Wallet"
	# "Microsoft.WindowsSoundRecorder"
	"Microsoft.ZuneVideo"
	# "Microsoft.YourPhone"
	# "Microsoft.MSPaint"     # Paint & Paint3D
	# "Microsoft.ZuneMusic"   # New Media Player in Windows
	
	# Xbox Apps
	# "Microsoft.Xbox.TCUI"
	# "Microsoft.XboxApp"
	# "Microsoft.XboxGameOverlay"
	# "Microsoft.XboxGamingOverlay"
	# "Microsoft.XboxIdentityProvider"
	# "Microsoft.XboxSpeechToTextOverlay"
	
	# Threshold 2 apps
	# "Microsoft.GetHelp"
	# "Microsoft.Getstarted"
	"Microsoft.Messaging"
	"Microsoft.Office.Sway"
	# "Microsoft.OneConnect"
	# "Microsoft.WindowsFeedbackHub"
	
	# Creators Update apps
	# "Microsoft.Microsoft3DViewer"
	
	#Redstone apps
	"Microsoft.BingFoodAndDrink"
	"Microsoft.BingHealthAndFitness"
	"Microsoft.BingTravel"
	"Microsoft.WindowsReadingList"
	
	# Redstone 5 apps
	#"Microsoft.MixedReality.Portal"
	"Microsoft.Whiteboard"
	
	# non-Microsoft
	# "4DF9E0F8.Netflix"
	# "SpotifyAB.SpotifyMusic"
	"2FE3CB00.PicsArt-PhotoStudio"
	"46928bounde.EclipseManager"
	"613EBCEA.PolarrPhotoEditorAcademicEdition"
	"6Wunderkinder.Wunderlist"
	"7EE7776C.LinkedInforWindows"
	"89006A2E.AutodeskSketchBook"
	"9E2F88E3.Twitter"
	"A278AB0D.DisneyMagicKingdoms"
	"A278AB0D.MarchofEmpires"
	"ActiproSoftwareLLC.562882FEEB491"
	"CAF9E577.Plex"
	"ClearChannelRadioDigital.iHeartRadio"
	"D52A8D61.FarmVille2CountryEscape"
	"D5EA27B7.Duolingo-LearnLanguagesforFree"
	"DB6EA5DB.CyberLinkMediaSuiteEssentials"
	# "DolbyLaboratories.DolbyAccess"
	# "DolbyLaboratories.DolbyAccess"
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
);

#############################################################################################
################################ Don't change anything below ################################
#############################################################################################

### Install WinGet ###
# Based on this gist: https://gist.github.com/crutkas/6c2096eae387e544bd05cde246f23901
$hasPackageManager = Get-AppxPackage -Name 'Microsoft.Winget.Source' | Select Name, Version
$hasVCLibs = Get-AppxPackage -Name 'Microsoft.VCLibs.140.00.UWPDesktop' | Select Name, Version
$hasXAML = Get-AppxPackage -Name 'Microsoft.UI.Xaml.2.7*' | Select Name, Version
$hasAppInstaller = Get-AppxPackage -Name 'Microsoft.DesktopAppInstaller' | Select Name, Version
$DesktopPath = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::Desktop)
$errorlog = "winget_error.log"

function install_winget
{
	Clear-Host
	Write-Host -ForegroundColor Yellow "Checking if WinGet is installed"
	if (!$hasPackageManager)
	{
		if ($hasVCLibs.Version -lt "14.0.30035.0")
		{
			Write-Host -ForegroundColor Yellow "Installing VCLibs dependencies..."
			Add-AppxPackage -Path "https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx"
			Write-Host -ForegroundColor Green "VCLibs dependencies successfully installed."
		}
		else
		{
			Write-Host -ForegroundColor Green "VCLibs is already installed. Skip..."
		}
		if ($hasXAML.Version -lt "7.2203.17001.0")
		{
			Write-Host -ForegroundColor Yellow "Installing XAML dependencies..."
			Add-AppxPackage -Path "https://github.com/Kugane/winget/raw/main/Microsoft.UI.Xaml.2.7_7.2203.17001.0_x64__8wekyb3d8bbwe.Appx"
			Write-Host -ForegroundColor Green "XAML dependencies successfully installed."
		}
		else
		{
			Write-Host -ForegroundColor Green "XAML is already installed. Skip..."
		}
		if ($hasAppInstaller.Version -lt "1.16.12653.0")
		{
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
	else
	{
		Write-Host -ForegroundColor Green "WinGet is already installed. Skip..."
		# Fix for hangup on first start
		winget -v
		Write-Host
	}
	Pause
	Clear-Host
}

### Install Apps with GUI ###
# Based on this gist: https://gist.github.com/Codebytes/29bf18015f6e93fca9421df73c6e512c
function install_gui
{
	Write-Host -ForegroundColor Cyan "Installing New Apps with GUI"
	Foreach ($gui in $graphical)
	{
		$listGUI = winget list --exact -q $gui.name
		if (![String]::Join("", $listGUI).Contains($gui.name))
		{
			Write-Host -ForegroundColor Yellow "Install: " $gui.name
			if ($gui.source -ne $null)
			{
				winget install --exact --interactive --accept-package-agreements --accept-source-agreements $gui.name --source $gui.source
				if ($LASTEXITCODE -eq 0)
				{
					Write-Host -ForegroundColor Green $gui.name "Successfully installed."
				}
				else
				{
					$gui.name + " Couldn't be installed." | Add-Content "$DesktopPath\$errorlog"
					Write-Host
					Write-Host -ForegroundColor Red $gui.name "couldn't be installed."
					Write-Host -ForegroundColor Yellow "Write in $DesktopPath\$errorlog"
					Write-Host
					Pause
				}
			}
			else
			{
				winget install --exact --interactive --accept-package-agreements --accept-source-agreements $gui.name
				if ($LASTEXITCODE -eq 0)
				{
					Write-Host -ForegroundColor Green $gui.name "Successfully installed."
				}
				else
				{
					$gui.name + " Couldn't be installed." | Add-Content "$DesktopPath\$errorlog"
					Write-Host
					Write-Host -ForegroundColor Red $gui.name "couldn't be installed."
					Write-Host -ForegroundColor Yellow "Write in $DesktopPath\$errorlog"
					Write-Host
					Pause
				}
			}
		}
		else
		{
			Write-Host -ForegroundColor Yellow "Skip installation of " $gui.name
		}
	}
	Pause
	Clear-Host
}

### Install Apps silent ###
function install_silent
{
	Write-Host -ForegroundColor Cyan "Installing New Apps"
	Foreach ($app in $apps)
	{
		$listApp = winget list --exact -q $app.name
		if (![String]::Join("", $listApp).Contains($app.name))
		{
			Write-Host -ForegroundColor Yellow  "Install: " $app.name
			# MS Store apps
			if ($app.source -ne $null)
			{
				winget install --exact --silent --accept-package-agreements --accept-source-agreements $app.name --source $app.source
				if ($LASTEXITCODE -eq 0)
				{
					Write-Host -ForegroundColor Green $app.name "Successfully installed."
				}
				else
				{
					$app.name + " Couldn't be installed." | Add-Content "$DesktopPath\$errorlog"
					Write-Host
					Write-Host -ForegroundColor Red $app.name "Couldn't be installed."
					Write-Host -ForegroundColor Yellow "Write in $DesktopPath\$errorlog"
					Write-Host
					Pause
				}
			}
			# All other Apps
			else
			{
				winget install --exact --silent --scope machine --accept-package-agreements --accept-source-agreements $app.name
				if ($LASTEXITCODE -eq 0)
				{
					Write-Host -ForegroundColor Green $app.name "Successfully installed."
				}
				else
				{
					$app.name + " Couldn't be installed." | Add-Content "$DesktopPath\$errorlog"
					Write-Host
					Write-Host -ForegroundColor Red $app.name "Couldn't be installed."
					Write-Host -ForegroundColor Yellow "Write in $DesktopPath\$errorlog"
					Write-Host
					Pause
				}
			}
		}
		else
		{
			Write-Host -ForegroundColor Yellow "Skip installation of " $app.name
		}
	}
	Pause
	Clear-Host
}

### Debloating ###
# Based on this gist: https://github.com/W4RH4WK/Debloat-Windows-10/blob/master/scripts/remove-default-apps.ps1
function debloating
{
	Write-Host -ForegroundColor Cyan "Remove bloatware"
	Foreach ($blt in $bloatware)
	{
		Write-Host -ForegroundColor Red "Removing: " $blt
		Get-AppxPackage -AllUsers $blt | Remove-AppxPackage
	}
	Pause
	Clear-Host
}

### Register Taskjob ###
function taskjob
{
	$taskname = 'WinGet AutoUpgrade & Cleanup'
	Write-Host -ForegroundColor Yellow "Checking for Taskjob..."
	if ($(Get-ScheduledTask -TaskName $taskname -ErrorAction SilentlyContinue).TaskName -eq $taskname)
	{
		Unregister-ScheduledTask -TaskName $taskname -Confirm:$False
		Write-Host -ForegroundColor Yellow "Taskjob already exists. Update to newer version..."
		[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
		Invoke-WebRequest -Uri https://github.com/Kugane/winget/raw/main/WinGet%20AutoUpgrade%20%26%20Cleanup.xml -OutFile '$taskjob'
		Register-ScheduledTask -xml (Get-Content '$taskjob' | Out-String) -TaskName $taskname
		Write-Host -ForegroundColor Green "Taskjob Successfully updated."
	}
	else
	{
		Write-Host -ForegroundColor Yellow "Installing taskjob..."
		[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
		Invoke-WebRequest -Uri https://github.com/Kugane/winget/raw/main/WinGet%20AutoUpgrade%20%26%20Cleanup.xml -OutFile '$taskjob'
		Register-ScheduledTask -xml (Get-Content '$taskjob' | Out-String) -TaskName $taskname
		Write-Host -ForegroundColor Green "Taskjob Successfully installed."
	}
	Pause
	Clear-Host
}

### Updated All Apps and programs ###
function update_list
{
	winget.exe upgrade --all
}

### Get List of installed Apps ###
function get_list
{
	$timestamp = get-date -Format dd_MM_yyyy
	$newPath = "$DesktopPath\" + "winget_" + $env:computername + "_$timestamp" + ".txt"
	Write-Host -ForegroundColor Yellow "Generating Applist..."
	winget list > $newPath
	Write-Host -ForegroundColor Magenta "List saved on $newPath"
	Pause
}

### Finished ###
function finish
{
	Write-Host
	Write-Host -ForegroundColor Magenta  "Installation finished"
	Write-Host
	Pause
}

### Menu For what to do ###
function menu
{
	[string]$Title = 'Menu: Please Read before you choose'
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
	Write-Host "`n"
	Write-Host "`t   0: Quit" -ForegroundColor Magenta
	Write-Host "`t   2: Just install winget"
	Write-Host "`t   3: Install Apps under graphical"
	Write-Host "`t   4: Install Apps under apps"
	Write-Host "`t   5: Remove bloatware"
	Write-Host "`t   6: Install Taskjob for automatic updates"
	write-Host "`t   7: Updated All Apps and programs"
	Write-Host "`t   8: Get List of all installed Apps"
	Write-Host "`t   1: Do all steps below"
	Write-Host "`n"
	
	$actions = "0"
	while ($actions -notin "0..8")
	{
		$actions = Read-Host -Prompt 'What you want to do?'
		if ($actions -in 0 .. 8)
		{
			if ($actions -eq 0)
			{
				exit
			}
			if ($actions -eq 1)
			{
				install_winget
				install_gui
				install_silent
				debloating
				taskjob
				update_list
				finish
			}
			if ($actions -eq 2)
			{
				install_winget
				finish
			}
			if ($actions -eq 3)
			{
				install_winget
				install_gui
				finish
			}
			if ($actions -eq 4)
			{
				install_winget
				install_silent
				finish
			}
			if ($actions -eq 5)
			{
				debloating
				finish
			}
			if ($actions -eq 6)
			{
				taskjob
				finish
			}
			if ($actions -eq 7)
			{
				update_list
				finish
			}
			if ($actions -eq 8)
			{
				install_winget
				get_list
			}
			menu
		}
		else
		{
			menu
		}
	}
}
menu