Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1

winget install LGUG2Z.whkd
winget install LGUG2Z.komorebi

mkdir "$Env:USERPROFILE\.config" -ea 0
mkdir "$Env:USERPROFILE\.config\komorebi" -ea 0
mkdir "$Env:USERPROFILE\.config\wkhd" -ea 0

iwr https://raw.githubusercontent.com/LGUG2Z/komorebi/v0.1.19/komorebi.example.json -OutFile "$Env:USERPROFILE\.config\komorebi\komorebi.json"
iwr https://raw.githubusercontent.com/LGUG2Z/komorebi/v0.1.19/whkdrc.sample -OutFile "$Env:USERPROFILE\.config\wkhd\whkdrc"

komorebic fetch-app-specific-configuration

Write-Host "DONE. Create a Scheduled Task with the following command arguments:"
Write-Host "cmd.exe /C komorebic start -c ""$Env:USERPROFILE\.config\komorebi\komorebi.json"" --whkd"
