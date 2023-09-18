set AHKScriptPath=..\script\Duplicate_Control.ahk

start "" "%USERPROFILE%\Desktop\AutoHotkey\AutoHotkeyU64.exe" "%AHKScriptPath%"
if %errorlevel%==0 (
    echo Running script done. Kindly access to url: https://keytest.vn to test
) else (
    echo Have something error to running. PLease check again script AHK and run script runScriptAHK.bat again.
    echo Exiting the script.
    pause
    exit /b 1
)