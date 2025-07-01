# fresh.ps1 - Winget install script for fresh Windows installs

function Install-App {
    param (
        [string]$Id,
        [string]$Name = $null,
        [switch]$Exact
    )

    if (-not $Name) {
        $Name = $Id
    }

    Write-Host "`nInstalling: $Name..."

    $args = @("install", "--id=$Id", "--silent", "--accept-package-agreements", "--accept-source-agreements")

    if ($Exact) {
        $args += "-e"
    }

    try {
        winget @args
    } catch {
        Write-Warning "Failed to install $Name"
    }
}

# Apps to install
$apps = @(
    @{ Id = "VideoLAN.VLC"; Name = "VLC" },
    @{ Id = "Bitwarden.Bitwarden"; Name = "Bitwarden" },
    @{ Id = "Anysphere.Cursor"; Name = "Cursor" },
    @{ Id = "Mozilla.Firefox"; Name = "Firefox" },
    @{ Id = "Discord.Discord"; Name = "Discord" },
    @{ Id = "Notepad++.Notepad++"; Name = "Notepad++" },
    @{ Id = "Microsoft.SysinternalsSuite"; Name = "SysInternals" },
    @{ Id = "Seelen.SeelenUI"; Name = "SeelenUI"; Exact = $true },
    @{ Id = "7zip.7zip"; Name = "7zip" },
    @{ Id = "RARLab.WinRAR"; Name = "WinRAR" },
    @{ Id = "Microsoft.PowerToys"; Name = "PowerToys" },
    @{ Id = "Python.Python.3"; Name = "Python" },
    @{ Id = "Docker.DockerDesktop"; Name = "Docker Desktop" },
    @{ Id = "OpenJS.NodeJS.LTS"; Name = "NodeJS" },
    @{ Id = "Oracle.JavaRuntimeEnvironment"; Name = "Java JRE" },
    @{ Id = "Oracle.JavaDevelopmentKit.21"; Name = "Java JDK" },
    @{ Id = "Obsidian.Obsidian"; Name = "Obsidian" },
    @{ Id = "Flow-Launcher.Flow-Launcher"; Name = "Flow Launcher" },
    @{ Id = "Malwarebytes.Malwarebytes"; Name = "MalwareBytes" },
    @{ Id = "Git.Git"; Name = "Git" }
)

# Loop through and install each
foreach ($app in $apps) {
    Install-App @app
}

Write-Host "`nAll installations attempted."
