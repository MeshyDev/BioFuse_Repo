:: Right, this will loop every 2 seconds.
@echo off
@mode con: cols=70 lines=30


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


:el_loopay
tasklist /fi "WINDOWTITLE eq BioFuse"  | find /i "cmd.exe" >nul
if %errorlevel% == 1 del bin\aud\loop.guru && taskkill /f /im wscript.exe && taskkill /f /im cmd.exe >nul
ping localhost -n 2 >nul
goto el_loopay