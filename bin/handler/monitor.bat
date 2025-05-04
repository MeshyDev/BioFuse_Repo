:: Right, this will loop every 2 seconds.
@echo off
@mode con: cols=70 lines=30
:mainLoop

(
set /p win11bypass=
set /p musicToggle=
set /p voiceToggle=
)<bin/config.mini
:: Forcibly load data from config to populate variables that don't want to change

cls
echo PLEASE DONT CLOSE THIS BEFORE THE CLIENT!! Also read below. 
echo (These windows automatically close when the client is closed or crashes)
echo (which coincidentally is what this "process" does)
echo Please make sure that you DONT HAVE ANY OTHER COMMAND PROMPTS OPEN. 
echo I am definitely open to help though! If you can provide a way where 
echo this could close it based on PID that'd be awesome. 
echo.
echo Don't worry! Nothing in this game will tamper with any important files.
echo I need to launch these windows because of the way Batch works. 
echo Kind of like how Chrome will launch a million different versions of 
echo itself to "run faster". If you don't believe me you can peruse the 
echo contents of my files, they are readable from notepad. 
echo.
echo ...totally could've not had them minimize on launch, but that's ugly.

if %win11bypass% == 0 goto stopSound

:el_loopay

(
set /p win11bypass=
set /p musicToggle=
set /p voiceToggle=
)<bin/config.mini
:: Forcibly load data from config to populate variables that don't want to change

if %win11bypass% == 0 goto stopSound
tasklist /fi "WINDOWTITLE eq BioFuse"  | find /i "cmd.exe" >nul
if %errorlevel% == 1 del bin\aud\loop.guru && taskkill /f /im wscript.exe && taskkill /f /im cmd.exe >nul
ping localhost -n 2 >nul
goto el_loopay

:stopSound
echo User has stopped music! Checking every 10 seconds until 
echo choice has changed.
ping localhost -n 10 >nul
goto mainLoop
