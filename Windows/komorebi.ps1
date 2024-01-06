Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1

winget install LGUG2Z.whkd
winget install LGUG2Z.komorebi

mkdir "$Env:USERPROFILE\.config" -ea 0
mkdir "$Env:USERPROFILE\.config\komorebi" -ea 0
mkdir "$Env:USERPROFILE\.config\wkhd" -ea 0

iwr https://raw.githubusercontent.com/LGUG2Z/komorebi/v0.1.19/komorebi.example.json -OutFile "$Env:USERPROFILE\.config\komorebi\komorebi.json"
iwr https://raw.githubusercontent.com/LGUG2Z/komorebi/v0.1.19/whkdrc.sample -OutFile "$Env:USERPROFILE\.config\whkd\whkdrc"

komorebic fetch-app-specific-configuration

komorebic enable-autostart --config $Env:USERPROFILE\.config\komorebi\komorebi.json --whkd

# Set WHKD custom config location
[System.Environment]::SetEnvironmentVariable("WHKD_CONFIG_HOME", "$Env:USERPROFILE\.config\whkd\", "User")
