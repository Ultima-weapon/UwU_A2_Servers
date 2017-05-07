@echo off

:: CONFIGURATIONS FOR YOUR SETUP HERE.
::
::    DO NOT LEAVE SPACES BETWEEN = AND EXTENSIONS.
::     EXAMPLE: EPOCH=@DayZ_Epoch
::
:: Your Arma 2 Operation Arrowhead directory goes here.
set A2OA=C:\Program Files (x86)\Steam\steamapps\common\Arma 2 Operation Arrowhead
:: Your Arma 2 directory goes here.
set A2=C:\Program Files (x86)\Steam\steamapps\common\Arma 2

:: Your DayZ mods folder names go here.
set EPOCH=@DayZ_Epoch1051
set OVERWATCH=@DayzOverwatch
set ORIGINS=@DayzOrigins179

:: Your Map folder names go here.
set JADE=@Panthera;@jade

:: END CONFIGURATIONS, EDITING ANYTHING BELOW MIGHT BREAK THE LAUNCHER.

color 0c
title RVN Launcher V0.2

:::
:::  .--.      .-'.      .--.      .--.      .--.      .--.      .`-.      .--.
::: :::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\
:::'      `--'      `.-'      `--'      `--'      `--'      `-.'      `--'      `
:::
:::       _   _ _ _   _             __      __                          
:::      | | | | | |_(_)_ __  __ _  \ \    / /__ __ _ _ __  ___ _ _  ___
:::      | |_| | |  _| | '  \/ _` |  \ \/\/ / -_) _` | '_ \/ _ \ ' \(_-<
:::       \___/|_|\__|_|_|_|_\__,_|   \_/\_/\___\__,_| .__/\___/_||_/__/
:::                                                  |_|                
:::     
:::                        DayZ Launcher by Cyber 
:::                     *DON'T FORGET TO CONFIGURE*
::: 
:::  .--.      .-'.      .--.      .--.      .--.      .--.      .`-.      .--.
::: :::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\
:::'      `--'      `.-'      `--'      `--'      `--'      `-.'      `--'      `
:::
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
ECHO.
ECHO A2: %A2%
ECHO A2OA: %A2OA%
ECHO Epoch: %EPOCH% / Overwatch: %OVERWATCH% / Origins: %ORIGINS%
ECHO.

:restart
SET /p server="Select your server. (1 = Tavi, 2 = Taki, 3 = Napf, 4 = Jade Groove)"
ECHO.
IF /i "%server%" == "1" GOTO tavi
IF /i "%server%" == "2" GOTO taki
IF /i "%server%" == "3" GOTO napf
IF /i "%server%" == "4" GOTO jade
ECHO Invalid server choice, please try again.
ECHO.
GOTO restart

:tavi
ECHO.
ECHO Joining Ultima Weapons Online Taviana...
set CI=24.255.57.159
set CP=10000
start ""  "%A2OA%\ArmA2OA_BE.exe" 0 0 -skipintro -mod=%ORIGINS%;%OVERWATCH%;%EPOCH% -noSplash -noPause -noFilePatching -world=empty -connect=%CI% -port=%CP% "-mod=%A2%;expansion;"
GOTO end

:taki
ECHO.
ECHO Joining Ultima Weapons Online Takistan...
set CI=24.255.57.159
set CP=20000
start ""  "%A2OA%\ArmA2OA_BE.exe" 0 0 -skipintro -mod=%ORIGINS%;%OVERWATCH%;%EPOCH% -noSplash -noPause -noFilePatching -world=empty -connect=%CI% -port=%CP% "-mod=%A2%;expansion;"
GOTO end

:napf
ECHO.
ECHO Joining Ultima Weapons Online Napf...
set CI=24.255.57.159
set CP=50000
start ""  "%A2OA%\ArmA2OA_BE.exe" 0 0 -skipintro -mod=%ORIGINS%;%OVERWATCH%;%EPOCH% -noSplash -noPause -noFilePatching -world=empty -connect=%CI% -port=%CP% "-mod=%A2%;expansion;"
GOTO end

:jade
ECHO.
ECHO Joining Ultima Weapons Online Jade Groove...
set CI=24.255.57.159
set CP=55000
start ""  "%A2OA%\ArmA2OA_BE.exe" 0 0 -skipintro -mod=%JADE%;%ORIGINS%;%OVERWATCH%;%EPOCH% -noSplash -noPause -noFilePatching -world=empty -connect=%CI% -port=%CP% "-mod=%A2%;expansion;"
GOTO end

:end
ECHO.
cls
ECHO.
ECHO Thanks for playing on the Ultima Weapons Universe servers!
timeout 5
EXIT