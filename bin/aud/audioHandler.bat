:: This creates a lightweight VBS script to handle audio. It will pose no harm to your computer.
@echo off
@mode con: cols=70 lines=30

echo PLEASE DONT CLOSE THIS BEFORE THE CLIENT!! Also read below. 
echo (These windows automatically close when the client is closed or crashes)
echo.
echo Don't worry! Nothing in this game will tamper with any important files.
echo I need to launch these windows because of the way Batch works. 
echo Kind of like how Chrome will launch a million different versions of 
echo itself to "run faster". If you don't believe me you can peruse the 
echo contents of my files, they are readable from notepad. 
echo.
echo This window is for audio and will routinely relaunch when a new 
echo audio is needed. Seriously, read my code it was annoying to even
echo get it to work without using that old OLD method with like that 
echo audio thing that was from XP and prior. I'm kinda impressed it did 
echo work though. 
echo.
echo Playing: %clientSound%
set "file=bin/aud/%clientSound%"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo Sound.Settings.Volume = 30
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >audioHandlerChild.vbs
move audioHandlerChild.vbs "bin\aud" >nul
:loop
if exist bin/aud/loop.guru start "" /wait /min bin/aud/audioHandlerChild.vbs
if not exist bin/aud/loop.guru exit
:: I put this ping here because Lua taught me that you always need a small break somewhere.
timeout /t 1 /nobreak
goto:loop
