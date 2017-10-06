@ECHO OFF
cls
COLOR A
:start
for /L %%i in (1,1,%n%) do echo !array[%%i]!
ECHO 1. Extend the display
ECHO 2. Extend display and switch to Aero theme.
ECHO 3. Extend display and switch to Basic theme. Good for different hz.
ECHO 4. Switch to Aero theme.
ECHO 5. Switch to Basic theme.
ECHO.
ECHO This is meant for Windows 7.
ECHO.
set choice=
set /p choice=Please select an option.
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto Extend
if '%choice%'=='2' goto ExtendA
if '%choice%'=='3' goto ExtendB
if '%choice%'=='4' goto Aero
if '%choice%'=='5' goto Basic
ECHO "%choice%" is not valid, try again
ECHO.
goto start
:Extend
ECHO Extend selected.
DisplaySwitch.exe /extend
goto end
:ExtendA
ECHO Extend/Aero selected.
DisplaySwitch.exe /extend
rundll32.exe %SystemRoot%\system32\shell32.dll,Control_RunDLL %SystemRoot%\system32\desk.cpl desk,@Themes /Action:OpenTheme /file:"C:\Windows\Resources\Themes\aero.theme"
goto end
:ExtendB
ECHO Extend/Basic selected.
DisplaySwitch.exe /extend
rundll32.exe %SystemRoot%\system32\shell32.dll,Control_RunDLL %SystemRoot%\system32\desk.cpl desk,@Themes /Action:OpenTheme /file:"C:\Windows\Resources\Ease of Access Themes\basic.theme"
goto end
:Aero
ECHO Windows Aero theme selected.
rundll32.exe %SystemRoot%\system32\shell32.dll,Control_RunDLL %SystemRoot%\system32\desk.cpl desk,@Themes /Action:OpenTheme /file:"C:\Windows\Resources\Themes\aero.theme"
goto end
:Basic
ECHO Windows Basic theme selected.
rundll32.exe %SystemRoot%\system32\shell32.dll,Control_RunDLL %SystemRoot%\system32\desk.cpl desk,@Themes /Action:OpenTheme /file:"C:\Windows\Resources\Ease of Access Themes\basic.theme"
goto end
:end
pause
