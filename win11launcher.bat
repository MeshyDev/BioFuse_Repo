@echo off
title BioFuse Win11 Launcher
:startagain
cls
echo The fact that this needs to be made makes me sad.
echo.
echo What this does is start BioFuse in minimized mode to force Windows 11 to
echo launch a normal console instance. I first discovered this when I noticed
echo my music monitor and audioHandler were launching normally as they should.
echo.
echo What this means is that you have to go into the taskbar and select the 
echo Biofuse window itself. This should allow you to have music functionality
echo without strange crashing. It's a convoluted workaround but it works.
@start /min "Biofuse" biofuse.bat
pause
:misinput
cls
echo Relaunch?
echo.
echo 1) Yes
echo 2) No
echo.
set /p relaunch=:: 
if %relaunch% == 1 goto startagain
if %relaunch% == 2 exit
goto misinput