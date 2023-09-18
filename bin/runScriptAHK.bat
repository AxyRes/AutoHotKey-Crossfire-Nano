@echo off
set PressControlAHK=..\script\Duplicate_Control.ahk
set Marco6Nong=..\script\Marco_6_nong.ahk

:menu
cls
echo Options:
echo 1. Increase Press Control
echo 2. Macro 6 Nong Vip
echo 3. Add all funtions
echo 4. Exit

set /p choice=Enter your choice (1/2/3/4): 

start "" "%USERPROFILE%\Desktop\AutoHotkey\AutoHotkeyU64.exe" "%PressControlAHK%"

if "%choice%"=="1" (
    start "" "%USERPROFILE%\Desktop\AutoHotkey\AutoHotkeyU64.exe" "%PressControlAHK%"
)

if "%choice%"=="2" (
    start "" "%USERPROFILE%\Desktop\AutoHotkey\AutoHotkeyU64.exe" "%Marco6Nong%"
)

if "%choice%"=="3" (
    for %%f in (script\*.ahk) do (
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