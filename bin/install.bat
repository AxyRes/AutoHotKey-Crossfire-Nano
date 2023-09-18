@echo off
set InstallerURL=https://www.autohotkey.com/download/2.0/AutoHotkey.zip
set AHKScriptPath=..\script\Duplicate_Control.ahk

echo Checking internet connection...

curl --head --fail --silent --show-error %InstallerURL% > nul

if %errorlevel%==0 (
    echo Connected to the internet.
) else (
    echo Not connected to the internet or unable to access %InstallerURL%.
    echo Exiting the script.
    exit /b 1
)

echo Installing AutoHotKey...
powershell -Command "(New-Object Net.WebClient).DownloadFile('%InstallerURL%', 'AutoHotkey.zip')"
powershell -Command "Expand-Archive -Path .\AutoHotkey.zip -DestinationPath .\AutoHotkey"
echo Installing Done.

timeout /t 10 /nobreak > nul

echo Running AutoHotKey script as admin...
start "" "AutoHotkey\AutoHotkeyU64.exe" "%AHKScriptPath%"

echo Cleanup...
del AutoHotkey.zip
pause