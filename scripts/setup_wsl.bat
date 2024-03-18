@echo off

rem Add a file to WSL environment
wsl.exe pwd
wsl.exe -u root cp "./templates/wsl.conf.temp" "/etc/wsl.conf"

rem Terminate WSL environment
wsl.exe --terminate %1

echo Added wsl.conf options.
pause