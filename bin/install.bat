@echo off
set InstallerURL=https://www.autohotkey.com/download/2.0/AutoHotkey.zip
set AHKScriptPath=..\script\Duplicate_Control.ahk
set SevenZipPath="C:\Program Files\7-Zip\7z.exe"

echo Checking internet connection...

curl --head --fail --silent --show-error %InstallerURL% > nul

if %errorlevel%==0 (
    echo Connected to the internet.
) else (
    echo Not connected to the internet or unable to access %InstallerURL%.
    echo Exiting the script.
    exit /b 1
)

echo Checking Tool Requiredment...

if exist %SevenZipPath% (
    echo All tool is already. Proceeding with installation...
) else (
    echo Some missing tool. Downloading and installing...
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://www.7-zip.org/a/7z1900-x64.exe', '7z.exe')"
    start /wait 7z.exe /S   REM Install 7-Zip silently
    del 7z.exe
)

echo Installing AutoHotKey...
powershell -Command "(New-Object Net.WebClient).DownloadFile('%InstallerURL%', 'AutoHotkey.zip')"
%SevenZipPath% x AutoHotkey.zip -oAutoHotkey

if %errorlevel%==0 (
    echo Installation Done.
) else (
    echo Installation failed.
    echo Exiting the script.
    exit /b 1
)

timeout /t 10 /nobreak > nul

echo Running AutoHotKey script as admin...
start "" "AutoHotkey\AutoHotkeyU64.exe" "%AHKScriptPath%"

echo Cleanup...
del AutoHotkey.zip
pause