# 1. Make sure the Microsoft App Installer is installed: https://www.microsoft.com/en-us/p/app-installer/9nblggh4nns1
# 2. Run this script as administrator.

Write-Output "Installing Apps"
$apps = @(
    # Essentials
    @{name = "7zip.7zip" },
    @{name = "VideoLAN.VLC" },
    @{name = "Google.Chrome" },
    @{name = "qBittorrent.qBittorrent" },
    @{name = "IObit.AdvancedSystemCare" },
    # @{name = "IObit.Uninstaller" },
    # @{name = "Piriform.CCleaner" },

    # Programming
    @{name = "Microsoft.VisualStudioCode" },
    @{name = "Oracle.JDK.18" },
    @{name = "ApacheFriends.Xampp" },
    @{name = "Python.Python.3" },
    @{name = "msys2.msys2" },
    @{name = "Git.Git" },
    @{name = "MongoDB.Server" },
    @{name = "MongoDB.Compass.Full" },
    @{name = "Notepad++.Notepad++" },
    @{name = "Google.AndroidStudio" },

    # Extensions
    @{name = "Microsoft.DirectX" },
    @{name = "Microsoft.VC++2005Redist-x64" },
    @{name = "Microsoft.VC++2008Redist-x64" },
    @{name = "Microsoft.VC++2010Redist-x64" },
    @{name = "Microsoft.VC++2012Redist-x64" },
    @{name = "Microsoft.VC++2013Redist-x64" },
    @{name = "Microsoft.VC++2015-2019Redist-x64" },
    @{name = "Microsoft.VC++2015-2022Redist-x64" },
    @{name = "Microsoft.VC++2015Redist-x64" },
    @{name = "Microsoft.VC++2017Redist-x64" },
    @{name = "Microsoft.DotNet.DesktopRuntime.3_1" },
    @{name = "Microsoft.DotNet.DesktopRuntime.5" },
    @{name = "Microsoft.DotNet.DesktopRuntime.6" },
    @{name = "9PMMSR1CGPWG"; source = "msstore" } # HEIF-PictureExtension
    @{name = "9N4WGH0Z6VHQ"; source = "msstore" } # HEVC-Video Extension
    @{name = "9MVZQVXJBQ9V"; source = "msstore" } # AV1 Video Extension
    @{name = "9NCTDW2W1BH8"; source = "msstore" } # Raw Image Extension
    @{name = "9N95Q1ZZPMH4"; source = "msstore" } # MPEG-2 Video Extension
    @{name = "9PG2DK419DRG"; source = "msstore" } # Webp Image Extensions
    @{name = "9MVZQVXJBQ9V"; source = "msstore" } # AV1 Video Extension

    # Power Users
    @{name = "Microsoft.PowerToys" },
    @{name = "CPUID.CPU-Z" },
    @{name = "Hirschmann.NotebookFanControl" },
    @{name = "BlenderFoundation.Blender" },
    @{name = "OBSProject.OBSStudio" },
    @{name = "JRSoftware.InnoSetup" }
    Pause
);

Foreach ($app in $apps) {
    $listApp = winget list --exact -q $app.name
    if (![String]::Join("", $listApp).Contains($app.name)) 
    {
        Write-host "Installing: " $app.name
        winget install -e -i --accept-source-agreements --accept-package-agreements --id $app.name 
    }
    else 
    {
        Write-host "Skipping: " $app.name " (Already installed)"
    }
}