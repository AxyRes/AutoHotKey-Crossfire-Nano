@echo off
:: Check for administrator rights
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system" && (
    echo Running with administrative privileges...
    goto runscript
) || (
    echo Requesting administrative privileges...
    :: Request administrative privileges and re-run this script
    powershell -command "Start-Process '%0' -Verb RunAs"
    exit /b 0
)
set PressControlAHK=Duplicate_Control.ahk
set Marco6Nong=Marco_6_nong.ahk
set "DestinationFolder=%USERPROFILE%\Desktop\AutoHotkey\script"

:menu
cls
echo Options:
echo 1. Increase Press Control
echo 2. Macro 6 Nong Vip (Beta)
echo 3. Add all funtions
echo 4. Exit

set /p choice=Enter your choice (1/2/3/4): 

if "%choice%"=="1" (
    start "" "%USERPROFILE%\Desktop\AutoHotkey\AutoHotkeyU64.exe" "%DestinationFolder%\%PressControlAHK%"
)

if "%choice%"=="2" (
    start "" "%USERPROFILE%\Desktop\AutoHotkey\AutoHotkeyU64.exe" "%DestinationFolder%\%Marco6Nong%"
)

if "%choice%"=="3" (
    for %%f in (%DestinationFolder%\*.ahk) do (
        start "" "%USERPROFILE%\Desktop\AutoHotkey\AutoHotkeyU64.exe" "%%f"
    )
)

if "%choice%"=="4" (
    goto end
)

echo Invalid choice. Please try again.
pause
goto menu

if %errorlevel%==0 (
    echo Running script done. Kindly access to url: https://keytest.vn to test
) else (
    echo Have something error to running. PLease check again script AHK and run script runScriptAHK.bat again.
    echo Exiting the script.
    pause
    exit /b 1
)