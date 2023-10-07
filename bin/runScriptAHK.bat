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

:runscript
set PressControlAHK=Duplicate_Control.ahk
set Marco6Nong=Marco_6_nong.ahk
set "DestinationFolder=%USERPROFILE%\Desktop\AutoHotkey\script"

:menu
cls
echo Options:
echo 1. Increase Press Control
echo 2. Macro 6 Nong Vip (Beta)
echo 3. Add all functions
echo 4. Exit

set /p choice=Enter your choice (1/2/3/4): 

if "%choice%"=="1" (
    start "" "%USERPROFILE%\Desktop\AutoHotkey\AutoHotkeyU64.exe" "%DestinationFolder%\%PressControlAHK%"
    timeout /t 3 /nobreak > nul
    if %errorlevel%==0 (
        echo Running script %PressControlAHK% done. Kindly access to URL: https://keytest.vn to test
        timeout /t 5 /nobreak > nul
        goto end
    ) else (
        echo There was an error while running the script. Please check your AHK scripts and run the 'runScriptAHK.bat' again.
        echo Exiting the script.
        pause
        exit /b 1
    )
)

if "%choice%"=="2" (
    start "" "%USERPROFILE%\Desktop\AutoHotkey\AutoHotkeyU64.exe" "%DestinationFolder%\%Marco6Nong%"
    timeout /t 3 /nobreak > nul
    if %errorlevel%==0 (
        echo Running script %Marco6Nong% done. Kindly access to URL: https://keytest.vn to test
        timeout /t 5 /nobreak > nul
        goto end
    ) else (
        echo There was an error while running the script. Please check your AHK scripts and run the 'runScriptAHK.bat' again.
        echo Exiting the script.
        pause
        exit /b 1
    )
)

if "%choice%"=="3" (
    for %%f in (%DestinationFolder%\*.ahk) do (
        echo Install %%f
        start "" "%USERPROFILE%\Desktop\AutoHotkey\AutoHotkeyU64.exe" "%%f"
    )
    timeout /t 3 /nobreak > nul
    if %errorlevel%==0 (
        echo Running script done. Kindly access to URL: https://keytest.vn to test
        timeout /t 5 /nobreak > nul
        goto end
    ) else (
        echo There was an error while running the script. Please check your AHK scripts and run the 'runScriptAHK.bat' again.
        echo Exiting the script.
        pause
        exit /b 1
    )
)

if "%choice%"=="4" (
    goto end
)

echo Invalid choice. Please try again.
pause
goto menu
