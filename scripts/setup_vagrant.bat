@echo off
setlocal

REM Set path for requirements file
set dir=%~dp0
set filename=requirements.txt
set requirementsfile="%dir:"=%%filename:"=%"
echo %requirementsfile%

REM Check if %requirementsfile% exists
if not exist %requirementsfile% (
    echo %requirementsfile% not found.
    exit /b 1
)

REM Install Vagrant scripts specified in %requirementsfile%
for /f "usebackq delims=" %%i in (%requirementsfile%) do (
    vagrant plugin install %%i
	if errorlevel 1 (
        echo Failed to install %%i
        exit /b 1
    )
)

echo Vagrant scripts installed successfully.

:end
