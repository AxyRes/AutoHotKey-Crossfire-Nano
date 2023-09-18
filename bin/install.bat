@echo off
set InstallerURL=https://www.autohotkey.com/download/ahk.zip
set SevenZipPath="C:\Program Files\7-Zip\7z.exe"
set "SourceFolder=..\script"
set "DestinationFolder=%USERPROFILE%\Desktop\AutoHotkey\script"

echo Checking internet connection...

curl --head --fail --silent --show-error %InstallerURL% > nul

if %errorlevel%==0 (
    echo Connected to the internet.
) else (
    echo Not connected to the internet or unable to access %InstallerURL%.
    echo Please try connect to internet to continue this steps
    echo Exiting the script.
    pause
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
curl -o AutoHotkey.zip -L %InstallerURL%
%SevenZipPath% x AutoHotkey.zip -o%USERPROFILE%\Desktop\AutoHotkey -y

if %errorlevel%==0 (
    echo Installation Done.
) else (
    echo Installation failed.
    echo Exiting the script.
    pause
    exit /b 1
)

echo It almost complete. But we need to check some thing more

mkdir "%DestinationFolder%" 2>nul
xcopy "%SourceFolder%" "%DestinationFolder%" /E /I /Y

timeout /t 10 /nobreak > nul

echo Checking Done. 

echo Running AutoHotKey script as admin...
call runScriptAHK.bat

echo Cleanup...
del AutoHotkey.zip
pause