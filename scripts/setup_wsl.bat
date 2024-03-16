@echo off

rem Add a file to WSL environment
(
echo [automount]
echo enabled = true
echo root = /
echo options = "metadata"
echo mountFsTab = true
) | wsl.exe -u root tee /etc/wsl.conf > nul

rem Shutdown WSL environment
wsl.exe --shutdown

echo Added wsl.conf options.
pause
