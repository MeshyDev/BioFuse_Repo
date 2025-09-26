@echo off

set version=1.10.0
set vmsg=There's a special project a cooking... keep an eye out for it.
set vmsg2=Seriously, it's about Biofuse.

:: DEFINE VARIABLES 

set resetSwitch=0 
title BioFuse
:redef
set scalingfactor=2
set dmg=5
set item=0
set nodes=0
set xnodes=0
set level=1
set exp=0
set expToNextLevel=100
set currentHP=100
set maxHP=100
set currentEP=100
set maxEP=100
set healthStatus=Healthy
set opt_diff=Normal
set loc=Home
set eloc=0
set eppot=3
set hppot=3
set defense=12
set blockcnce=75
set critcnce=75
set critMult=2
set evadecnce=50
set mDmg=10
set eppower=12
set adventure=0
set versionnum=%version%
set weaponzero=1
set weaponone=0
set weapontwo=0
set weaponthree=0
set weaponfour=0
set weaponfive=0
set weaponsix=0
set weaponseven=0
set weaponeight=0
set weaponarray=0
set weaponname=Fists
set weapondmg=0
set weaponmod=Nothing
set scene=0

set canCastLvl=0
set enemySpell=nul

if %resetSwitch% == 1 exit /b

setlocal
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if "%version%" == "10.0" mode 800 
if "%version%" == "6.3" mode con: cols=70 lines=60 
if "%version%" == "6.2" mode con: cols=70 lines=60 
if "%version%" == "6.1" mode con: cols=70 lines=60 
if "%version%" == "6.0" mode con: cols=70 lines=60
endlocal

:: Music prerequsites

:: The important variable of the 3 is win11bypass.
:: Functionally, it's the only one doing anything. I'm too afraid to actually
:: strip them out of the game since it's working on Win10

@set win11bypass=0
@set musicToggle=Musicing
@set voiceToggle=nul
if not exist "bin/config.mini" (echo 0) > bin/config.mini && (echo Musicing) >> bin/config.mini && (echo Blabbing) >> bin/config.mini

(
set /p win11bypass=
set /p musicToggle=
set /p voiceToggle=
)<bin/config.mini


@start /min "biofuse_client_monitor" bin\handler\monitor.bat
REM I NEED TO STRESS THAT MONITOR.bat IS LITERALLY JUST TO KILL THE AUDIO WHEN
REM CLOSED BY THE X BUTTON. I have this feeling people would get mad if I didn't
REM include something like this because people are irrational and some aren't 
REM computer savvy. Seriously, I had to learn about PID's. (process identification) 
(echo plsstopmusicing) > bin\aud\loop.guru
if %musicToggle% == Musicing set clientSound=null.mp3
if %musicToggle% == Muted set clientSound=MUTED
@start /min "audioHandler" bin\aud\audioHandler.bat

set nulbool=0
::SETLOCAL ENABLEEXTENSIONS
::if errorlevel 1 echo Unable to enable extensions && ping localhost -n 2 >nul

set EmaxHP=10

set /a expGained=%RANDOM% * %EmaxHP% / 32768 + 1
set /a nodesGained=%RANDOM% * %EmaxHP%  / 32768 + 1

if not exist bin md bin
if not exist bin\sav md bin\sav

cls
echo. 
echo.

set TAB=	
echo                   A game developed by Exabyte/ExaDev
echo.
echo.
ping localhost -n 5 >nul
:start
color 0F
cls 
type MENUMOD.MOD
echo.
echo Welcome to BioFuse %version%. 
echo -%vmsg%-
echo -%vmsg2%-
if %nulbool% == 1 echo %expGained% %nodesGained%
echo.
echo.
set /p MainMenuInput=::
if %MainMenuInput% == 1 set resetSwitch=1 && goto createGame
if %MainMenuInput% == 2 goto loadGame
if %MainMenuInput% == 3 goto infoBlock
if %MainMenuInput% == 4 goto musicToggle
if %MainMenuInput% == 5 exit
echo Sorry, but I don't understand that. Could you try that again please?
pause
cls
goto start

:musicToggle
cls
echo                           Music Toggle
echo.
echo Want music? Toggle it here to enable it! Just a heads up though, Win 11
echo has something called Windows Terminal and it IS NOT compatible with it.
echo.
echo There is an included launcher called "win11launcher.bat", this will allow
echo Windows 11 users to use the music feature without issues. 
echo.
if %win11bypass% == 0 echo Music is off.
if %win11bypass% == 1 echo Music is on.
echo.
echo 1) Turn music ON
echo 2) Turn music OFF
echo 3) Return to Title Screen
set /p toggleMusic=:: 
if %toggleMusic% == 1 (if %win11bypass% == 1 (echo Music is already on. && pause && goto musicToggle) else (set win11bypass=1 && (echo 1) > bin/config.mini && (echo Musicing) >> bin/config.mini && (echo Blabbing) >> bin/config.mini && goto musicToggle))
if %toggleMusic% == 2 (if %win11bypass% == 0 (echo Music is already off. && pause && goto musicToggle) else (set win11bypass=0 && (echo 0) > bin/config.mini && (echo Musicing) >> bin/config.mini && (echo Blabbing) >> bin/config.mini && goto musicToggle))
if %toggleMusic% == 3 goto start
goto musicToggle

:infoBlock
cls
::                                  I MIDDLE
echo                           Information
echo                  Main Dev:          Exabyte/ExaDev
echo              Title Screen:          RAPIX Interactive
echo            Nodes Adoption:          Meshcaid Inc.
echo.
echo         Hello^! I appreciate you coming in and looking over just
echo            what i've been working on these past few years.
echo.
echo Honestly, it took me some time to realize that I just needed to work
echo with what I've got. I felt like I was pushing myself to strive for 
echo something that I couldn't do at this time or in the past. So here we go^!
echo.
echo I hope you guys can appreciate what %version% can offer. Because it 
echo               sure as hell took me long enough, right? 
echo. 
pause
goto start

:loadGame
if %resetSwitch% == 1 call :redef 
set resetSwitch=0
cls
echo Please enter in your character's name. 
set /p lbnam=What's your name?::
if not exist "bin/sav/%lbnam%.set" (
echo Sorry, %lbnam%, we don't know you^!
echo You essentially don't exist - no offense^!
echo But, if you do want to exist, go to the 'new game' area^!
pause
cls
goto start
)
echo Welcome back, %lbnam%! Please wait while we load your data...
(
set /p lbnam=
set /p dmg=
set /p item=
set /p nodes=
set /p xnodes=
set /p level=
set /p exp=
set /p expToNextLevel=
set /p currentHP=
set /p maxHP=
set /p currentEP=
set /p maxEP=
set /p healthStatus=
set /p opt_diff=
set /p loc=
set /p eloc=
set /p eppot=
set /p hppot=
set /p defense=
set /p blockcnce=
set /p critcnce=
set /p critMult=
set /p evadecnce=
set /p mDmg=
set /p eppower=
set /p adventure=
set /p versionnum=
set /p weaponzero=
set /p weaponone=
set /p weapontwo=
set /p weaponthree=
set /p weaponfour=
set /p weaponfive=
set /p weaponsix=
set /p weaponseven=
set /p weaponeight=
set /p weaponarray=
set /p weaponname=
set /p weapondmg=
set /p weaponmod=
set /p scene=
)<bin/sav/%lbnam%.set
:: Sets scaling factor right away. Redundant, but works.
set /a scalingfactor=2+((%level%-30)/3)
ping localhost -n 2 >nul
if not %versionnum% == %version% goto outdated 
echo Load was successful.
pause
goto MainScreen

:loadGame.notfound
echo Sorry there, %lbnam%. We don't know you^!
echo You essentially - no offense - don't exist.
echo But if you do want to exist, go to 'new game' next time.
pause
cls
goto start


:createGame
call :redef
set resetSwitch=0
cls
echo Welcome to BioFuse. 
echo Your adventure will start soon^!
echo There's just one simple thing though...
echo.
set /p lbnam=What is your name?::
if /i exist bin/sav/%lbnam%.set goto loadFound
if /i not exist bin/sav/%lbnam%.set goto gameCreation

:loadFound
echo.
echo Hey again %lbnam%, nice seeing you. But maybe you should 
echo continue on into the 'load game' section. That is, you've been there
echo and still didn't 'exist'. Oh well, try again^!
pause
goto start

:gameCreation
::                                                                        i < line limit 
cls
echo You have 5 stat points to divide up throughout your stats. 
echo Choose a stat to add a point to^! 
echo.
echo 1:DAMAGE  %tab% %dmg%
echo 2:HEALTH  %tab% %maxHP%
echo 3:MAGIC   %tab% %maxEP%
echo 4:MAGIC DMG%tab% %mDmg%
set /p input=Select a stat to increase by one point:: 
if /i %input%==1 (
set /a dmg=%dmg%+1
)
if /i %input%==2 (
set /a maxHP=%maxHP%+5
)
if /i %input%==3 (
set /a maxEP=%maxEP%+1
)
if /i %input%==4 (
set /a mDmg=%mDmg%+1
)
cls
echo You have 4 stat points to divide up throughout your stats. 
echo Choose a stat to add a point to^! 
echo.
echo 1:DAMAGE  %tab% %dmg%
echo 2:HEALTH  %tab% %maxHP%
echo 3:MAGIC   %tab% %maxEP%
echo 4:MAGIC DMG%tab% %mDmg%
set /p input=Select a stat to increase by one point:: 
if /i %input%==1 (
set /a dmg=%dmg%+1
)
if /i %input%==2 (
set /a maxHP=%maxHP%+5
)
if /i %input%==3 (
set /a maxEP=%maxEP%+1
)
if /i %input%==4 (
set /a mDmg=%mDmg%+1
)
cls
echo You have 3 stat points to divide up throughout your stats. 
echo Choose a stat to add a point to^! 
echo.
echo 1:DAMAGE  %tab% %dmg%
echo 2:HEALTH  %tab% %maxHP%
echo 3:MAGIC   %tab% %maxEP%
echo 4:MAGIC DMG%tab% %mDmg%
set /p input=Select a stat to increase by one point:: 
if /i %input%==1 (
set /a dmg=%dmg%+1
)
if /i %input%==2 (
set /a maxHP=%maxHP%+5
)
if /i %input%==3 (
set /a maxEP=%maxEP%+1
)
if /i %input%==4 (
set /a mDmg=%mDmg%+1
)
cls
echo You have 2 stat points to divide up throughout your stats. 
echo Choose a stat to add a point to^! 
echo.
echo 1:DAMAGE  %tab% %dmg%
echo 2:HEALTH  %tab% %maxHP%
echo 3:MAGIC   %tab% %maxEP%
echo 4:MAGIC DMG%tab% %mDmg%
set /p input=Select a stat to increase by one point:: 
if /i %input%==1 (
set /a dmg=%dmg%+1
)
if /i %input%==2 (
set /a maxHP=%maxHP%+5
)
if /i %input%==3 (
set /a maxEP=%maxEP%+1
)
if /i %input%==4 (
set /a mDmg=%mDmg%+1
)
cls
echo You have 1 stat points to divide up throughout your stats. 
echo Choose a stat to add a point to^! 
echo.
echo 1:DAMAGE  %tab% %dmg%
echo 2:HEALTH  %tab% %maxHP%
echo 3:MAGIC   %tab% %maxEP%
echo 4:MAGIC DMG%tab% %mDmg%
set /p input=Select a stat to increase by one point:: 
if "%lbnam%" == "TheLoof" echo A little spice for your nice! && set /a dmg=%dmg%+50 && set /a mDmg=%mDmg%+50 && set /a maxHP=%maxHP%+300 && set /a maxEP=%maxEP%+300 && ping localhost -n 5 >nul
if /i %input%==1 (
set /a dmg=%dmg%+1
)
if /i %input%==2 (
set /a maxHP=%maxHP%+5
)
if /i %input%==3 (
set /a maxEP=%maxEP%+1
)
if /i %input%==4 (
set /a mDmg=%mDmg%+1
)
echo Give us a second, %lbnam%, we are going to set up your game for you.

if exist bin/sav (
(echo %lbnam%) > bin/sav/%lbnam%.set
(echo %dmg%) >> bin/sav/%lbnam%.set
(echo %item%) >> bin/sav/%lbnam%.set
(echo %nodes%) >> bin/sav/%lbnam%.set
(echo %xnodes%) >> bin/sav/%lbnam%.set
(echo %level%) >> bin/sav/%lbnam%.set
(echo %exp%) >> bin/sav/%lbnam%.set
(echo %expToNextLevel%) >> bin/sav/%lbnam%.set
(echo %currentHP%) >> bin/sav/%lbnam%.set
(echo %maxHP%) >> bin/sav/%lbnam%.set
(echo %currentEP%) >> bin/sav/%lbnam%.set
(echo %maxEP%) >> bin/sav/%lbnam%.set
(echo %healthStatus%) >> bin/sav/%lbnam%.set
(echo %opt_diff%) >> bin/sav/%lbnam%.set
(echo %loc%) >> bin/sav/%lbnam%.set
(echo %eloc%) >>bin/sav/%lbnam%.set
(echo %eppot%) >> bin/sav/%lbnam%.set
(echo %hppot%) >> bin/sav/%lbnam%.set
(echo %defense%) >> bin/sav/%lbnam%.set
(echo %blockcnce%) >> bin/sav/%lbnam%.set
(echo %critcnce%) >> bin/sav/%lbnam%.set
(echo %critMult%) >> bin/sav/%lbnam%.set 
(echo %evadecnce%) >> bin/sav/%lbnam%.set
(echo %mDmg%) >> bin/sav/%lbnam%.set
(echo %eppower%) >> bin/sav/%lbnam%.set
(echo %adventure%) >> bin/sav/%lbnam%.set
(echo %versionnum%) >> bin/sav/%lbnam%.set
(echo %weaponzero%) >> bin/sav/%lbnam%.set
(echo %weaponone%) >> bin/sav/%lbnam%.set
(echo %weapontwo%) >> bin/sav/%lbnam%.set
(echo %weaponthree%) >> bin/sav/%lbnam%.set
(echo %weaponfour%) >> bin/sav/%lbnam%.set
(echo %weaponfive%) >> bin/sav/%lbnam%.set
(echo %weaponsix%) >> bin/sav/%lbnam%.set
(echo %weaponseven%) >> bin/sav/%lbnam%.set
(echo %weaponeight%) >> bin/save/%lbnam%.set
(echo %weaponarray%) >> bin/sav/%lbnam%.set
(echo %weaponname%) >> bin/sav/%lbnam%.set
(echo %weapondmg%) >> bin/sav/%lbnam%.set
(echo %weaponmod%) >> bin/sav/%lbnam%.set
(echo %scene%) >> bin/sav/%lbnam%.set
ping localhost -n 2 >nul 
echo Game successfully made and saved.
)

:MainScreen
cls
if %currentHP% LSS 0 ( 
::                                                                        i < line limit 
echo Soft error - Save State
echo.
if %nulbool% == 1 echo SAVE STATE HP STATES CURRENTHP IS %currentHP%
echo It seems like there was a snafu in the save file. 
echo It could have happened due to a mis-edit of a save file, or Exabyte
echo may have accidentally goofed something. 
echo.
pause
goto start
)
if %exp% GEQ %expToNextLevel% goto levelUp
echo %lbnam%, Level %level%
echo EXP: %exp% / %expToNextLevel%
echo HP: %currentHP% / %maxHP%
echo EP: %currentEP% / %maxEP%
echo Status: %healthStatus%
echo Location: %loc%
echo.
echo 1:Actions
echo 2:Save Game
echo 3:Character Stats
echo 4:Toggle Music
set /p input=Choice?::
if %input%==1 goto A_Menu
if %input%==2 goto q_SAV
if %input%==3 goto C_Menu
if %input%==4 goto musicToggleGame
echo Sorry, I don't understand that. Could you try again?
pause
cls
goto MainScreen



:musicToggleGame
cls
echo                           Music Toggle
echo.
echo Want music? Toggle it here to enable it! Just a heads up though, Win 11
echo has something called Windows Terminal and it IS NOT compatible with it.
echo.
echo I recommend looking up a tutorial to change your Terminal behavior to
echo Windows Console Host. Once that's done everything should work normally.
echo.
if %win11bypass% == 0 echo Music is off.
if %win11bypass% == 1 echo Music is on.
echo.
echo 1) Turn music ON
echo 2) Turn music OFF
echo 3) Return to Home
set /p toggleMusic=:: 
if %toggleMusic% == 1 (if %win11bypass% == 1 (echo Music is already on. && pause && goto musicToggleGame) else (set win11bypass=1 && (echo 1) > bin/config.mini && (echo Musicing) >> bin/config.mini && (echo Blabbing) >> bin/config.mini && goto musicToggleGame))
if %toggleMusic% == 2 (if %win11bypass% == 0 (echo Music is already off. && pause && goto musicToggleGame) else (set win11bypass=0 && (echo 0) > bin/config.mini && (echo Musicing) >> bin/config.mini && (echo Blabbing) >> bin/config.mini && goto musicToggleGame))
if %toggleMusic% == 3 goto MainScreen
goto musicToggleGame

:C_Menu
set /a statThrow=%DMG%+%weapondmg%
set /a statThrow2=%statThrow%*%critMult%
set /a scalingfactor=2+((%level%-30)/3)
cls
echo Status: %healthStatus%
echo HP: %currentHP% / %maxHP%
echo EP: %currentEP% / %maxEP%
echo Nodes: %nodes%  XNodes: %Xnodes%
echo EXP: %exp% / %expToNextLevel%
echo Weapon: %weaponname%
echo Weapon Mod: %weaponmod%
if %level% GEQ 30 echo Enemy Aggravation Level: %scalingfactor%
echo.
echo Damage: %DMG%
echo Total Possible Damage: %statThrow%
echo Max Possible Crit Damage: %statThrow2%
echo Defense: %defense%
echo Block Chance: %blockcnce% (Lower is better)
echo Crit Chance: %critcnce% (Lower is better)
echo Crit Multiplier: %critMult%
echo Evade Chance: %evadecnce%
echo Magic Damage: %mDmg% 
echo EP Power: %eppower%
echo.
pause
cls
goto MainScreen

:A_Menu 
if "%enemy%" == "Mr. President" set clientSound=nullPresident.mp3 && set enemy=nul
if "%enemy%" == "The President" set clientSound=nullPresident.mp3 && set enemy=nul
if %clientSound% == nullPresident.mp3 set clientSound=null.mp3 && call bin\handler\jukebox.bat
::Backup check to see if music is still playing, and to kill it
if not %clientSound% == null.mp3 set clientSound=null.mp3 && call bin\handler\jukebox.bat
cls
if %currentHP% LEQ 0 set currentHP=1 
if %loc% == Home goto Home_Menu
if %loc% == Outside goto Outside_Menu
if %loc% == Flatlands goto Flatlands_Menu
if %loc% == Forest goto Forest_Menu
if %loc% == JunkYard goto JunkYard_Menu
if %loc% == TrainYard goto Trainyard_Menu
if %loc% == DeepForest goto DeepForest_Menu
if %loc% == President goto President_Menu
if %loc% == Shop goto Shop_Menu
if %loc% == DBMENU goto Debug_Menu
echo Interesting, you seem to have gotten yourself trapped
echo between dimensions^! An error may have occured in your
echo save file. 
echo.
echo It also could've happened with saving, or you
echo simply hacked your save, essentially saying you
echo hacked your life. What a shame...
echo We're going to send you home now, with the benefit 
echo of the doubt. :)
pause
cls
set loc=Home
set eloc=0
goto A_Menu
:Home_Menu
cls
echo HP: %currentHP% / %maxHP%
if %currentHP% GTR %maxHP% set currentHP=%maxHP%
echo EP: %currentEP% / %maxEP%
echo Status: %healthStatus%
echo Location: %loc%
echo.
echo 1) Take a nap (Restores HP)
echo 2) Take EP Potion (%eppot% energy potions left) (Restores EP)
echo 3) Change Location
echo 4) Equip Items
echo 5) Back
echo.
set /p H_Inp=::
if %H_Inp% == 1 goto H_Nap
if %H_Inp% == 2 goto H_EPOT
if %H_Inp% == 3 goto Map
if %H_Inp% == 4 goto H_Equip
if %H_Inp% == 5 goto MainScreen
:H_Nap
if %currentHP% GEQ %maxHP% (
echo You're not tired. Actually, you feel great^!
if not %healthStatus% == Healthy (
if %healthStatus% == Burning echo You douse your smoldering body in water. && set healthStatus=Healthy
if %healthStatus% == Battered echo You apply guaze to your wounds and rest for a bit. && set healthStatus=Healthy 
if %healthStatus% == Sick echo You take some antibiotics, it helps your sickness after a while. && set healthStatus=Healthy 
if %healthStatus% == Dying echo Death himself knocked at your door, but you refused to answer. && set healthStatus=Healthy
if %healthStatus% == Corrupted echo The mirror reached out toward you, but the arm shattered before it could reach. && set healthStatus=Healthy
if %healthStatus% == Presidential-Corruption echo The walls felt like they were caving in toward you, dark hands reaching for your soul. && set healthStatus=Healthy
)
pause
goto A_Menu
)
set /a currentHP=%maxHP%
cls
echo You're taking a nap... HP Restored to Full.
if %healthStatus% == Burning echo You douse your smoldering body in water before taking your nap. && set healthStatus=Healthy
if %healthStatus% == Battered echo Your injuries heal during your nap. && set healthStatus=Healthy 
if %healthStatus% == Sick echo Despite your sickly nap, you feel well rested after it all. && set healthStatus=Healthy 
if %healthStatus% == Dying echo You met death during your nap, but pursuaded him out if it. && set healthStatus=Healthy
if %healthStatus% == Corrupted echo The twitching darkness visited you in your sleep, but you snap out of it. && set healthStatus=Healthy
if %healthStatus% == Presidential-Corruption echo Dark, twitching faces with their faces distorted in a horrible scream left your ears in pain. It was hard to sleep through this one. && set healthStatus=Healthy
pause
goto A_Menu

:H_EPOT
if %currentEP% GEQ %maxEP% (
echo You have plenty of energy points^! Any more, you'll burn up^!
pause
goto A_Menu
)
if %eppot% LEQ 0 (
echo You have no Energy Point Potions left^!
pause
goto A_Menu
)
set /a eppot=%eppot%-1
echo That Energy Potion really pumped you up^! (EP restored)
set /a currentEP=%maxEP%
pause
goto A_Menu
)
:H_Equip
cls
echo %lbnam%'s Equipment Room
echo #---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#
call bin/item/equipMsg.bat
echo Equipment Description:&& call bin/item/checkArray.bat 
echo Current weapon modifier is: %weaponmod%
echo #---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#
echo You can currently equip the following: 
if %weaponzero% == 1 echo (Fists) Nothing, just your fists. 
if %weaponone% == 1 echo (Dagger) A fine steel dagger. +5 DMG
if %weapontwo% == 1 echo (Sword) A large steel sword. +10 DMG
if %weaponthree% == 1 echo (Flaming Sword) A sword made of flames. +15 DMG
if %weaponfour% == 1 echo (Rocket Launcher) Who let you buy this? +35 DMG
if %weaponfive% == 1 echo (Death Machine) Remember me? +65 DMG
if %weaponsix% == 1 echo (Bot Buster) It's a cannon! +115 DMG
if %weaponseven% == 1 echo (Portable Death Laser) Whoa... +750 DMG
if %weaponeight% == 1 echo (Gods Finger) This might break crits. + 3500 DMG
if %weaponzero% == 1 echo (Back) Go back to the last menu
echo.
echo (Please note, syntax is important otherwise you may risk a crash)
set /p equipRm=Please type in the item name you wish to equip:: 
echo.
if "%equipRm%" == "Fists" set weaponarray=0 && echo You screw in your hands. && pause && goto H_Equip
if "%equipRm%" == "fists" set weaponarray=0 && echo You screw in your hands. && pause && goto H_Equip
if "%equipRm%" == "Dagger" set weaponarray=1 && call bin/item/checkArray.bat && goto H_Equip
if "%equipRm%" == "dagger" set weaponarray=1 && call bin/item/checkArray.bat && goto H_Equip
if "%equipRm%" == "Sword" set weaponarray=2 && call bin/item/checkArray.bat && goto H_Equip
if "%equipRm%" == "sword" set weaponarray=2 && call bin/item/checkArray.bat && goto H_Equip
if "%equipRm%" == "Flaming Sword" set weaponarray=3 && call bin/item/checkArray.bat && goto H_Equip
if "%equipRm%" == "flaming sword" set weaponarray=3 && call bin/item/checkArray.bat && goto H_Equip
if "%equipRm%" == "Flaming sword" set weaponarray=3 && call bin/item/checkArray.bat && goto H_Equip
if "%equipRm%" == "flaming Sword" set weaponarray=3 && call bin/item/checkArray.bat && goto H_Equip
if "%equipRm%" == "Rocket Launcher" set weaponarray=4 && call bin/item/checkArray.bat && goto H_Equip
if "%equipRm%" == "rocket rauncher" set weaponarray=4 && call bin/item/checkArray.bat && goto H_Equip
if "%equipRm%" == "Rocket launcher" set weaponarray=4 && call bin/item/checkArray.bat && goto H_Equip
if "%equipRm%" == "rocket Launcher" set weaponarray=4 && call bin/item/checkArray.bat && goto H_Equip
if "%equipRm%" == "Death Machine" set weaponarray=5 && call bin/item/checkArray.bat && goto H_Equip
if "%equipRm%" == "death machine" set weaponarray=5 && call bin/item/checkArray.bat && goto H_Equip
if "%equipRm%" == "Death machine" set weaponarray=5 && call bin/item/checkArray.bat && goto H_Equip
if "%equipRm%" == "death Machine" set weaponarray=5 && call bin/item/checkArray.bat && goto H_Equip
if "%equipRm%" == "Bot Buster" set weaponarray=6 && call bin/item/checkArray.bat && goto H_Equip
if "%equipRm%" == "bot buster" set weaponarray=6 && call bin/item/checkArray.bat && goto H_Equip
if "%equipRm%" == "Bot buster" set weaponarray=6 && call bin/item/checkArray.bat && goto H_Equip
if "%equipRm%" == "bot Buster" set weaponarray=6 && call bin/item/checkArray.bat && goto H_Equip
if "%equipRm%" == "Portable Death Laser" set weaponarray=7 && call bin/item/checkArray.bat && goto H_Equip
if "%equipRm%" == "portable death laser" set weaponarray=7 && call bin/item/checkArray.bat && goto H_Equip
if "%equipRm%" == "Portable death laser" set weaponarray=7 && call bin/item/checkArray.bat && goto H_Equip
if "%equipRm%" == "portable Death Laser" set weaponarray=7 && call bin/item/checkArray.bat && goto H_Equip
if "%equipRm%" == "Portable death Laser" set weaponarray=7 && call bin/item/checkArray.bat && goto H_Equip
if "%equipRm%" == "Portable Death laser" set weaponarray=7 && call bin/item/checkArray.bat && goto H_Equip
if "%equipRm%" == "portable Death laser" set weaponarray=7 && call bin/item/checkArray.bat && goto H_Equip
if "%equipRm%" == "Gods Finger" set weaponarray=8 && call bin/item/checkArray.bat && goto H_Equip
if "%equipRm%" == "gods Finger" set weaponarray=8 && call bin/item/checkArray.bat && goto H_Equip
if "%equipRm%" == "Gods finger" set weaponarray=8 && call bin/item/checkArray.bat && goto H_Equip
if "%equipRm%" == "gods finger" set weaponarray=8 && call bin/item/checkArray.bat && goto H_Equip
if "%equipRm%" == "Back" goto Home_Menu 
if "%equipRm%" == "back" goto Home_Menu
goto H_Equip 

:Outside_Menu
if %exp% GEQ %expToNextLevel% goto levelUp
cls
echo HP: %currentHP% / %maxHP%
if %currentHP% GTR %maxHP% set currentHP=%maxHP%
echo EP: %currentEP% / %maxEP%
echo Weapon: %weaponname%
echo Status: %healthStatus%
echo Location: %loc%
echo.
echo 1: Search for Mob
echo 2: Change Location
echo 3: Back
set /p O_Inp=::
if %O_Inp% == 1 goto Ene_HUB_O
if %O_Inp% == 2 goto Map
if %O_Inp% == 3 goto MainScreen
echo I don't understand that. Could you try again?
pause
cls
goto Outside_Menu

:Flatlands_Menu
if %exp% GEQ %expToNextLevel% goto levelUp
cls
echo HP: %currentHP% / %maxHP%
if %currentHP% GTR %maxHP% set currentHP=%maxHP%
echo EP: %currentEP% / %maxEP%
echo Status: %healthStatus%
echo Location: %loc%
echo.
echo 1: Search for Mob
echo 2: Change Location
echo 3: Back
set /p O_Inp=::
if %O_Inp% == 1 goto Ene_HUB_Fl
if %O_Inp% == 2 goto Map
if %O_Inp% == 3 goto MainScreen
echo I don't understand that. Could you try again?
pause
cls
goto Flatlands_Menu

:Forest_Menu
if %exp% GEQ %expToNextLevel% goto levelUp
cls
echo HP: %currentHP% / %maxHP%
if %currentHP% GTR %maxHP% set currentHP=%maxHP%
echo EP: %currentEP% / %maxEP%
echo Status: %healthStatus%
echo Location: %loc%
echo.
echo 1: Search for Mob
echo 2: Change Location
echo 3: Back
set /p F_Inp=::
if %F_Inp% == 1 goto Ene_HUB_Fr
if %F_Inp% == 2 goto Map
if %F_Inp% == 3 goto MainScreen
echo Invalid option.
pause
goto Forest_Menu

:JunkYard_Menu
if %exp% GEQ %expToNextLevel% goto levelUp
cls
echo HP: %currentHP% / %maxHP%
if %currentHP% GTR %maxHP% set currentHP=%maxHP%
echo EP: %currentEP% / %maxEP%
echo Status: %healthStatus%
echo Location: %loc%
echo.
echo 1: Search for Mob
echo 2: Change Location
echo 3: Back
set /p O_Inp=::
if %O_Inp% == 1 goto Ene_Hub_Jy
if %O_Inp% == 2 goto Map
if %O_Inp% == 3 goto MainScreen
echo I don't understand that. Could you try again?
pause
cls
goto Junkyard_Menu

:Trainyard_Menu
if %exp% GEQ %expToNextLevel% goto levelUp
cls
echo HP: %currentHP% / %maxHP%
if %currentHP% GTR %maxHP% set currentHP=%maxHP%
echo EP: %currentEP% / %maxEP%
echo Status: %healthStatus%
echo Location: %loc%
echo.
echo 1: Search for Mob
echo 2: Change Location
echo 3: Back
set /p O_Inp=::
if %O_Inp% == 1 goto Ene_HUB_Ty
if %O_Inp% == 2 goto Map
if %O_Inp% == 3 goto MainScreen
echo I don't understand that. Could you try again?
pause
cls
goto Trainyard_Menu

:DeepForest_Menu
if %exp% GEQ %expToNextLevel% goto levelUp
cls
echo HP: %currentHP% / %maxHP%
if %currentHP% GTR %maxHP% set currentHP=%maxHP%
echo EP: %currentEP% / %maxEP%
echo Status: %healthStatus%
echo Location: %loc%
echo.
echo 1: Search for Mob
echo 2: Change Location
echo 3: Back
set /p O_Inp=::
if %O_Inp% == 1 goto Ene_HUB_Df
if %O_Inp% == 2 goto Map
if %O_Inp% == 3 goto MainScreen
echo I don't understand that. Could you try again?
pause
cls
goto DeepForest_Menu

:President_Menu
if %exp% GEQ %expToNextLevel% goto levelUp
cls
echo HP: %currentHP% / %maxHP%
:: No, I'm allowing overheal here.
echo EP: %currentEP% / %maxEP%
echo Status: %healthStatus%
echo You are outside the President's office.
echo.
echo 1: Enter the President's office.
echo 2: Change Location
echo 3: Back
set /p Pr_Inp=::
if %Pr_Inp% == 1 goto Ene_HUB_President
if %Pr_Inp% == 2 goto Map
if %Pr_Inp% == 3 goto MainScreen
echo This isn't the time to flub your inputs.
echo The President is nearby.
pause
cls
goto President_Menu

:Debug_Menu
set debugEnemySelect=None
set debugEnemyStatus=None
cls
echo HP: %currentHP% / %maxHP%
echo EP: %currentEP% / %maxEP%
echo Status: %healthStatus%
echo EXP: %exp%/%expToNextLevel%
if %exp% GEQ %expToNextLevel% echo Level up available.
echo You are in the Debug Room. Very serious.
echo You can fight custom enemies here, if that's your jam
echo.
echo 1: Set Custom Enemy Stats
echo 2: Set SPECIFIC variable
echo 3: Teleport Home
echo 4: Fight Yourself
echo 5: Add 50k XP
echo 6: Actions/Main Screen
echo 7: Test CustomDeathMessage
if %exp% GEQ %expToNextLevel% echo 8: Level up
echo Save: BE CAREFUL WITH THIS IF YOUVE BEEN PLAYING WITH VARIABLES
echo.
set /p dbmenu=:: 
if %dbmenu% == 1 goto debugCustomStat
if %dbmenu% == 2 goto debugSetVar
if %dbmenu% == 3 set loc=Home && goto A_Menu
if %dbmenu% == 4 goto debugFightYourself
if %dbmenu% == 5 goto XP_Menu
if %dbmenu% == 6 goto MainScreen
if %dbmenu% == 7 goto TestCDM
if %exp% GEQ %expToNextLevel% if %dbmenu% == 8 goto levelUp
if %dbmenu% == Save goto q_SAV
goto Debug_Menu

:TestCDM
set enemy=Gerald
set /a CDMRand=%RANDOM% * 100 / 32768 + 1
set /a CDMRand2=%RANDOM% * 5 / 32768 + 1
:: Induce randomization despite not actually running CDM
:: Prevents repeat responses
cls
echo I made this to test through different levels without 
echo having to do anything super fancy. 
echo.
echo Also the name of the enemy is Gerald. Poor Gerald :(
echo 1) Stage 1 CDM 
echo 2) Stage 2 CDM
echo 3) Stage 3 CDM
echo 4) Stage 4 CDM
echo What stage?
set /p dbmenucdm=:: 
echo *shaka
ping localhost -n 1 >nul
echo       shaka*
echo your death message is:
echo.
if %dbmenucdm% == 1 goto CDMStage1
if %dbmenucdm% == 2 goto CDMStage2
if %dbmenucdm% == 3 goto CDMStage3
if %dbmenucdm% == 4 goto CDMStage4
goto TestCDM

:XP_Menu
cls
echo 50000 XP added.
set /a exp=%exp%+50000
pause
goto Debug_Menu

:debugCustomStat
set plrMusic=nul
cls
echo There is a possible Missing Operand bug somewhere here
echo But this is debug mode, so I don't care.
set /p enemy=Enemy Name: 
set /p canCast=Can it cast? (0/1): 
set /p castLvl=Cast level 0-6: 
set /p EmaxHP=Max HP: 
set /p EmaxEP=Max EP: 
echo I wouldn't recommend setting this one too high, or you're gonna die
set /p Edmg=Max regular Damage:
echo Burning -- EP induced long-period damage 
echo Sick -- Activates when enemy has sickness
echo Battered -- Only activates during low health
echo Dying -- Only activates during last 10 health 
echo Corrupted -- Only activates randomly in robots
echo Infected -- Only activates randomly in robots
echo Presidential -- Applies to the President, does ESick Damage
echo Presidential-Corruption - Random chance to get president corrupted. 
echo SyNtAx is important!
echo.
set /p EhealthStatus=Status?: 

set EcurrentEP=%EmaxEP%
set EcurrentHP=%EmaxHP%
set /p plrMusic=Music?(0/1): 
if %plrMusic%==1 echo DO NOT INCLUDE .mp3 EXTENSION
if %plrMusic%==1 set /p clientSound=MP3 MUST EXIST OR RISK A CRASH:: 
if %plrMusic%==1 set clientSound=%clientSound%.mp3
echo Pausing for dramatic effect... 
ping localhost -n 3 >nul
if %plrMusic%==1 call bin\handler\jukebox.bat
cls
goto Battle

:debugSetVar
cls
echo Be VERY careful, and know what you're doing with this.
set /p selectedVar=Which variable:: 
set /p SetVarTo=Set it to:: 
:dbSetVarRepeat
echo CONFIRM, You want to set %selectedVar%=%SetVarTo%
set /p dbSetVar=(Y/N):: 
if %dbSetVar%==Y set %selectedVar%=%SetVarTo% && goto A_Menu
if %dbSetVar%==y set %selectedVar%=%SetVarTo% && goto A_Menu
if %dbSetVar%==N goto A_Menu
if %dbSetVar%==n goto A_Menu
set dbSetVar=bruh
goto dbSetVarRepeat

:debugFightYourself
cls
echo Processing...
set enemy=%lbnam%
set canCast=1
set castLvl=4
set EcurrentHP=%maxHP%
set EmaxHP=%maxHP%
set EcurrentEP=%maxEP%
set EmaxEP=%maxEP%
set /a Edmg=%dmg%+%weapondmg%
set EhealthStatus=Healthy
echo Processed! Pausing for dramatic effect.
ping localhost -n 2 >nul
set clientSound=ExaDevLowFid4.mp3
call bin\handler\jukebox.bat
goto Battle

:q_SAV
cls
if not exist bin/sav echo FATAL ERROR 4, system cannot save. && echo This means your SAV folder has gone missing^! && ping localhost -n 3 >nul && echo Deploying auto-fix. && if not exist bin\sav md bin\sav
(echo %lbnam%) > bin/sav/%lbnam%.set
:legacyReset
(echo %dmg%) >> bin/sav/%lbnam%.set
(echo %item%) >> bin/sav/%lbnam%.set
(echo %nodes%) >> bin/sav/%lbnam%.set
(echo %xnodes%) >> bin/sav/%lbnam%.set
(echo %level%) >> bin/sav/%lbnam%.set
(echo %exp%) >> bin/sav/%lbnam%.set
(echo %expToNextLevel%) >> bin/sav/%lbnam%.set
(echo %currentHP%) >> bin/sav/%lbnam%.set
(echo %maxHP%) >> bin/sav/%lbnam%.set
(echo %currentEP%) >> bin/sav/%lbnam%.set
(echo %maxEP%) >> bin/sav/%lbnam%.set
(echo %healthStatus%) >> bin/sav/%lbnam%.set
(echo %opt_diff%) >> bin/sav/%lbnam%.set
(echo %loc%) >> bin/sav/%lbnam%.set
(echo %eloc%) >>bin/sav/%lbnam%.set
(echo %eppot%) >> bin/sav/%lbnam%.set
(echo %hppot%) >> bin/sav/%lbnam%.set
(echo %defense%) >> bin/sav/%lbnam%.set
(echo %blockcnce%) >> bin/sav/%lbnam%.set
(echo %critcnce%) >> bin/sav/%lbnam%.set
(echo %critMult%) >> bin/sav/%lbnam%.set 
(echo %evadecnce%) >> bin/sav/%lbnam%.set
(echo %mDmg%) >> bin/sav/%lbnam%.set
(echo %eppower%) >> bin/sav/%lbnam%.set
(echo %adventure%) >> bin/sav/%lbnam%.set
(echo %versionnum%) >> bin/sav/%lbnam%.set
(echo %weaponzero%) >> bin/sav/%lbnam%.set
(echo %weaponone%) >> bin/sav/%lbnam%.set
(echo %weapontwo%) >> bin/sav/%lbnam%.set
(echo %weaponthree%) >> bin/sav/%lbnam%.set
(echo %weaponfour%) >> bin/sav/%lbnam%.set
(echo %weaponfive%) >> bin/sav/%lbnam%.set
(echo %weaponsix%) >> bin/sav/%lbnam%.set
(echo %weaponseven%) >> bin/sav/%lbnam%.set
(echo %weaponeight%) >> bin/sav/%lbnam%.set
(echo %weaponarray%) >> bin/sav/%lbnam%.set
(echo %weaponname%) >> bin/sav/%lbnam%.set
(echo %weapondmg%) >> bin/sav/%lbnam%.set
(echo %weaponmod%) >> bin/sav/%lbnam%.set 
(echo %scene%) >> bin/sav/%lbnam%.set
echo Saving your game... don't close^!
ping localhost -n 2 >nul
echo Save complete.
ping localhost -n 2 >nul
goto MainScreen


:Map
cls
echo Location List:
echo 1. Home
echo 2. Outside
echo 3. Flatlands
echo 4. Forest
echo 5. Deep Forest
echo 6. Junkyard
echo 7. Trainyard
echo 8. Shop
if %level% GEQ 30 echo 9. President's Office
if %nulbool%==1 echo 10. Debug/Fight Menu
set /p M_Inp=::
if %M_Inp% == 1 (
set loc=Home
goto A_Menu
)
if %M_Inp% == 2 (
set loc=Outside
goto A_Menu
)
if %M_Inp% == 3 (
set loc=Flatlands
goto A_Menu
)
if %M_Inp% == 4 (
set loc=Forest
goto A_Menu
)
if %M_Inp% == 5 (
set loc=DeepForest
goto A_Menu
)
if %M_Inp% == 6 (
set loc=JunkYard
goto A_Menu
)
if %M_Inp% == 7 (
set loc=TrainYard
goto A_Menu
)
if %M_Inp% == 8 (
set loc=Shop
goto A_Menu
)
if %level% GEQ 85 if %M_Inp% == 9 (
set loc=President
goto A_Menu
)
if %nulbool%==1 if %M_Inp% == 10 (
set loc=DBMENU
goto A_Menu
)
echo Invalid Choice. Try again.
pause
goto Map

:Ene_HUB_O
cls
SET /a RANval=%RANDOM% * 10 / 32768 + 1

if %RANval% GTR 5 goto Outside_EnemyFind
if %RANval% LEQ 5 cls && echo You didn't find an enemy... && pause && goto A_Menu

:Ene_HUB_Fl
cls
set /a RANval=%Random% * 10 / 32768 +1

if %RANval% GTR 3 goto Flatlands_EnemyFind
if %RANval% LEQ 3 cls && echo You didn't find an enemy... && pause && goto A_Menu
:Ene_HUB_Fr
cls
set /a RANval=%random% * 15 / 32768 + 1

if %RANval% GTR 8 goto Forest_EnemyFind
if %RANval% LEQ 8 cls && echo You didn't find an enemy... && pause && goto A_Menu

:Ene_HUB_Jy
cls
set /a RANval=%random% * 30 / 32768 + 1

if %RANval% GTR 15 goto Junkyard_EnemyFind
if %RANval% LEQ 15 cls && echo Despite the clanging of nearby junkbots, && echo you didn't find an enemy... && pause && goto A_Menu

:Ene_HUB_Ty
cls
set /a RANval=%random% * 30 / 32768 + 1

if %RANval% GTR 15 goto Trainyard_EnemyFind
if %RANval% LEQ 15 cls && echo This place feels incredibly unsafe. && echo You didn't find anything in this part of the Railyard. && pause && goto A_Menu

:Ene_HUB_Df
cls
set /a RANval=%random% * 30 / 32768 + 1

if %RANval% GTR 24 goto DeepForest_EnemyFind
if %RANval% LEQ 24 cls && echo You can hear distant birds && echo You didn't find an enemy... && pause && goto A_Menu

:Ene_Hub_President
cls
goto President_EnemyFind
:: Yep, 100% chance of finding the president.

:Outside_EnemyFind
call bin/battle/b_var/outside.bat
if %level% GEQ 30 call bin/battle/getScaling.bat
if "%enemy%" == "BlotBlot" set clientSound=ExaDevLowFid.mp3 && call bin\handler\jukebox.bat
goto Battle

:Flatlands_EnemyFind
call bin/battle/b_var/flatlands.bat
if %level% GEQ 30 call bin/battle/getScaling.bat
goto Battle

:Forest_EnemyFind
call bin/battle/b_var/forest.bat
if %level% GEQ 30 call bin/battle/getScaling.bat
goto Battle

:Junkyard_EnemyFind
call bin/battle/b_var/junkyard.bat
if %level% GEQ 30 call bin/battle/getScaling.bat
if "%enemy%" == "Government Patrol Assembly" set clientSound=ExaDevBeats.mp3 && call bin\handler\jukebox.bat
goto Battle

:Trainyard_EnemyFind
call bin/battle/b_var/trainyard.bat
if %level% GEQ 30 call bin/battle/getScaling.bat
if "%enemy%" == "Military Government Patrol Assembly" set clientSound=ExaDevByte0.mp3 && call bin\handler\jukebox.bat
goto Battle

:DeepForest_EnemyFind
call bin/battle/b_var/deepforest.bat
if %level% GEQ 30 call bin/battle/getScaling.bat
if "%enemy%" == "Wendigo" set clientSound=ExaDevLowFid4.mp3 && call bin\handler\jukebox.bat
goto Battle

:President_EnemyFind
call bin/battle/b_var/president.bat
if %level% GEQ 30 call bin/battle/getScaling.bat
if "%enemy%" == "Mr. President" set clientSound=ExaDevSillicone.mp3
if "%enemy%" == "The President" set clientSound=ExaDevBeats2.mp3
if "%enemy%" == "Deprecated President" set clientSound=ExaDevLowFid6.mp3
call bin\handler\jukebox.bat
goto Battle


:Battle
if %castLvl% == 0 (
    set enemySpell=Nothing
) else if %castLvl% == 1 (
    set enemySpell=Heal spell
) else if %castLvl% == 2 (
    set enemySpell=Sick spell
) else if %castLvl% == 3 (
    set enemySpell=Superheated Air
) else if %castLvl% == 4 (
    set enemySpell=Lifedrain Fireballs
) else if %castLvl% == 5 (
    set enemySpell=Orbital Death Laser
) else if %castLvl% == 6 (
    set enemySpell=Meteor
)
if %currentHP% LSS 1 (
if "%enemy%" == "Mr. President" set clientSound=nullPresident.mp3
if "%enemy%" == "The President" set clientSound=nullPresident.mp3
if "%enemy%" == "Deprecated President" set clientSound=nullPresident.mp3 
set clientSound=ExaDevTheHeist.mp3
call bin\handler\jukebox.bat && set clientSound=null.mp3
color 4F
if "%enemy%" == "Deprecated President" echo Deprecated President: Weak. And you really thought you could defeat me. && echo.
if "%enemy%" == "Mr. President" echo Mr. President: Your only achievement is making it this far. Remember that. && echo.
if "%enemy%" == "The President" echo The President: You're only here because we allowed you to be. && echo.
if "%enemy%" == "%lbnam%" echo You really were your own worst enemy, weren't you?
echo Ouch, %lbnam%, it looks like that %enemy% bested you. Luckily for you,
echo I can allow you to load from another save. You can even load your
echo previous save if you like. I'm going to return you to the load screen now...
pause
cls
color 0F
set resetSwitch=1
call bin\handler\jukebox.bat
goto loadGame
)
if %EcurrentHP% LSS 1 call bin/battle/checkVar.bat && goto A_Menu
if %EcurrentHP% == 0 echo %enemy% didn't hear no bell. It seems like it wants one last shot at you.
if %EcurrentHP% LEQ -1 goto CustomDeathMessage
if %currentHP% GTR %maxHP% (
set currentHP=%maxHP%
)
echo %lbnam%
echo HP: %currentHP% / %maxHP%
echo EP: %currentEP% / %maxEP%
echo Status: %healthStatus%
echo Weapon: %weaponname%
echo Weapon Mod: %weaponmod%
echo.
echo %enemy%
echo HP: %EcurrentHP% / %EmaxHP%
echo EP: %EcurrentEP% / %EmaxEP%
echo Status: %EhealthStatus%
echo Spell: %enemySpell%
echo.
echo 1. Attack
echo 2. EP Powers
echo 3. Item
echo 4. Run
set /p input=Choice?::
if %input%==1 goto Battle_Attack
if %input%==2 goto EPATK
if %input%==3 goto Battle_Inventory
if %input%==4 goto FleeBattle
if %input%==debugmode set nulbool=1 && cls && goto Battle
if %input%==BOLSTER set EmaxHP=100001 && set EcurrentHP=100001 && set EmaxEP=200 && set EcurrentEP=9001 && set EhealthStatus=Sick && cls && goto Battle
if %input%==SICK set EmaxHP=9001 && set EcurrentHP=9001 && set EmaxEP=15 && set EcurrentEP=15 && set EhealthStatus=Sick && cls && goto Battle
if %input%==CORRUPT set EhealthStatus=Corrupted
if %input%==FAILFLEE set flee=4 && goto DebugFleeBattle
if %input%==nobugmode set nulbool=0 && cls && goto Battle
echo I'm sorry, I didn't get that. Could you repeat that please?
pause
cls
goto Battle

:CustomDeathMessage
cls
if not %clientSound% == null.mp3 (ping localhost -n 1 >nul)
if not %clientSound% == null.mp3 (set clientSound=null.mp3 && call bin\handler\jukebox.bat && goto CustomDeathMessageBypass)
:: Gotta make sure any music from special mobs is killed here.
:: But also, flavor text for special mobs MUST go underneath CDM bypass. It's just how things work, okay?
:CustomDeathMessageBypass
set /a CDMRand=%RANDOM% * 100 / 32768 + 1
set /a CDMRand2=%RANDOM% * 5 / 32768 + 1
:: Boss death flavor text
if "%enemy%" == "BlotBlot" echo What... even IS a BlotBlot to begin with?? && pause && goto A_Menu
if "%enemy%" == "Government Patrol Assembly" echo They really upgraded their defenses for a Junkyard... && pause && goto A_Menu
if "%enemy%" == "Military Government Patrol Assembly" echo The President must've sent that one just for you. && pause && goto A_Menu
if "%enemy%" == "Wendigo" echo That THING was fierce! The shriek will haunt your dreams. && pause && goto A_Menu
if "%enemy%" == "Mr. President" echo The President's clone was defeated... the real fight is yet to begin. && pause && goto A_Menu
if "%enemy%" == "The President" echo You did it. && ping localhost -n 5 >nul && echo You defeated The President. && ping localhost -n 5 >nul && echo Enjoy the rewards you reap. && ping localhost -n 3 >nul && pause && if "%nulbool%" == "TheLoof" goto extraspecialmessage && goto A_Menu
if "%enemy%" == "Deprecated President" echo Huh... didn't that one look like the last president? && pause && goto A_Menu
if "%enemy%" == "%lbnam%" echo Like fighting a mirror, isn't it? && pause && goto A_Menu

if %level% GEQ 200 goto CDMStage4
if %level% GEQ 100 goto CDMStage3
if %level% GEQ 50 goto CDMStage2

:: Generic/Flavored flavor text <3
:: Stage one stays a little wtf
:CDMStage1
:: Putting this here to help with the debug room
if %CDMRand% == 1 echo %enemy%'s corpse slumps over, utterly evicerated. && pause && goto A_Menu
if %CDMRand% == 2 echo %enemy%'s corpse falls over unceremoniously. As it should. && pause && goto A_Menu
if %CDMRand% == 3 echo Wow, you obliterated %enemy%. Well done. && pause && goto A_Menu
if %CDMRand% == 4 echo It is dead, not big surprise. && pause && goto A_Menu
if %CDMRand% == 5 echo I hope its family didn't see that. && pause && goto A_Menu
if %CDMRand% == 6 echo You monster, it was its birthday today. && pause && goto A_Menu
if %CDMRand% == 7 echo Oh my god was that Hollywood Superstar Steve Buscemi? && echo Nope, just the annihilated remains of %enemy%. && pause && goto A_Menu
if %CDMRand% == 8 echo Okay, now %enemy% had it coming. It owed me $25 bucks. && pause && goto A_Menu
if %CDMRand% == 9 echo Okay, now %enemy% had it coming. It looked at you funny. && pause && goto A_Menu
if %CDMRand% == 10 echo Okay, now %enemy% had it coming. Almost spilled yo mama's curry. && pause && goto A_Menu
if %CDMRand% == 11 echo Aww, and it was having such a good day too. && pause && goto A_Menu
if %CDMRand% == 12 echo Secretly, that %enemy% was named Joe. && pause && echo Rest in pieces, Joe. && pause && goto A_Menu
if %CDMRand% == 13 if %EmaxHP% LSS 30 echo ...cmon, was it really a threat? && pause && goto A_Menu
if %CDMRand% == 13 if %EmaxHP% GTR 30 echo ...I SUPPOSE its okay now. && pause && goto A_Menu
if %CDMRand% == 14 if %EmaxHP% GEQ 100 echo Now that's a fight! %enemy% falls to pieces. && pause && goto A_Menu
if %CDMRand% == 14 echo %enemy% looks like mashed grapes. && pause && goto A_Menu
if %CDMRand% == 15 echo Secretly, that %enemy% was named Mitchel. && pause && echo Ripperoni in pepperoni, Mitchel. && pause && goto A_Menu
if %CDMRand% == 16 echo Secretly, that %enemy% was named Mitchell. && pause && echo Buh bye, Mitchell. && pause && goto A_Menu
if %CDMRand% == 17 echo Secretly, that %enemy% was a mass murderer. && pause && echo Well, Karma was out for it, I guess. && pause && goto A_Menu
if %CDMRand% == 18 echo Are you surprised that %enemy% died? && pause && echo Me too, the trail of dead in your wake is rooting for you. && pause && goto A_Menu
if %CDMRand% == 19 echo Secretly, that %enemy% was named Meshel. && pause && echo Meshel will return. && pause && goto A_Menu
if %CDMRand% == 20 echo Secretly, that %enemy% was named Meshel. && pause && echo Meshel came back. && pause && goto A_Menu
if %CDMRand% == 21 if %EmaxHP% LSS 30 echo HOW COULD YOU KILL SOMETHING SO CUTE? && pause && echo YOU MONSTER! && pause && goto A_Menu
if %CDMRand% == 21 if %EmaxHP% GTR 30 echo It had ugly genes anyway. && pause && goto A_Menu
if %CDMRand% == 21 echo %enemy% is beaten and battered. && pause && goto A_Menu
if %CDMRand% == 22 if %loc% == Outside echo Huh, I think I saw that one on a missing poster. && pause && goto A_Menu
if %CDMRand% == 22 if %loc% == Flatlands echo Having fun killing the local wildlife? && pause && goto A_Menu
if %CDMRand% == 22 if %loc% == Forest if "%enemy%" == "Moose" echo Y'know... you could've just run away from that GODDAMN MOOSE && pause && goto A_Menu
if %CDMRand% == 22 if %loc% == Forest if "%enemy%" == "Bear" echo We're pretty sure that bear was on drugs. && pause && echo That was a speedy bear && pause && goto A_Menu
if %CDMRand% == 22 if %loc% == Forest if "%enemy%" == "Beaver" echo Ahh, a fine collection for the "BEAVER" dam. && pause && goto A_Menu
if %CDMRand% == 22 if %loc% == Forest if "%enemy%" == "Small Beaver" echo These ones fill in the gaps for the "BEAVER" dam && pause && goto A_Menu
if %CDMRand% == 22 if %loc% == Forest if "%enemy%" == "Woodpecker" echo How'd you even HIT a Woodpecker? && pause && echo How'd you piss it off?? && pause && goto A_Menu
if %CDMRand% == 22 if %loc% == Forest if "%enemy%" == "Hare" echo That was a funny looking rabbit. && echo It was a hairy hare too. && echo Does that make you... && pause && echo Scared? && pause && goto A_Menu
if %CDMRand% == 22 echo As it perishes, papers fall from its clutched arms revealing invites to a retirement party. && pause && echo One of them was for you... && pause && goto A_Menu
if %CDMRand% == 23 echo %enemy% spontaneously combusts. && pause && goto A_Menu
if %CDMRand% == 24 echo %enemy% collapsed like a bad soufflé. && pause && goto A_Menu
if %CDMRand% == 25 echo %enemy% has been thoroughly un-alived. && pause && goto A_Menu
if %CDMRand% == 26 echo Goodbye %enemy%, we hardly knew ye. && pause && goto A_Menu
if %CDMRand% == 27 echo %enemy% ceases to exist in every timeline. && pause && goto A_Menu
if %CDMRand% == 28 echo That was overkill. %enemy% is dust. && pause && goto A_Menu
if %CDMRand% == 29 echo %enemy% evaporated like spilled soda. && pause && goto A_Menu
if %CDMRand% == 30 echo %enemy% fell down, got up, and fell down again—permanently. && pause && goto A_Menu
if %CDMRand% == 31 echo You've ruined %enemy%'s subscription to life. && pause && goto A_Menu
if %CDMRand% == 32 echo %enemy% has been voted off the island. && pause && goto A_Menu
if %CDMRand% == 33 echo Wow, %enemy% didn't even drop good loot. && pause && goto A_Menu
if %CDMRand% == 34 echo The obituary for %enemy% is already being drafted. && pause && goto A_Menu
if %CDMRand% == 35 echo Congratulations, you've deleted %enemy%. && pause && goto A_Menu
if %CDMRand% == 36 echo %enemy% is flatter than day-old soda. && pause && goto A_Menu
if %CDMRand% == 37 echo That was less a fight, more a demolition. && pause && goto A_Menu
if %CDMRand% == 38 echo Somebody call a janitor, %enemy% left a mess. && pause && goto A_Menu
if %CDMRand% == 39 echo That was a murder speedrun on %enemy%. && pause && goto A_Menu
if %CDMRand% == 40 echo Rest easy %enemy%, you were cannon fodder. && pause && goto A_Menu
if %CDMRand% == 41 echo You yeeted %enemy% into the void. && pause && goto A_Menu
if %CDMRand% == 42 echo %enemy% now understands the meaning of “Game Over.” && pause && goto A_Menu
if %CDMRand% == 43 echo %enemy% was fragile, like fine china. && pause && goto A_Menu
if %CDMRand% == 44 echo Critical hit? More like critical obliteration. && pause && goto A_Menu
if %CDMRand% == 45 echo Poor %enemy% didn't even have health insurance. && pause && goto A_Menu
if %CDMRand% == 46 echo Boom. Gone. No more %enemy%. && pause && goto A_Menu
if %CDMRand% == 47 echo They'll be cleaning up %enemy% for weeks. && pause && goto A_Menu
if %CDMRand% == 48 echo Ouch, %enemy% exploded like confetti. && pause && goto A_Menu
if %CDMRand% == 49 echo Well, that escalated fatally for %enemy%. && pause && goto A_Menu
if %CDMRand% == 50 echo Press F to pay respects to %enemy%. && pause && goto A_Menu
if %CDMRand% == 51 echo The ground gladly accepts what's left of %enemy%. && pause && goto A_Menu
if %CDMRand% == 52 echo %enemy% went from solid to abstract concept. && pause && goto A_Menu
if %CDMRand% == 53 echo There goes %enemy%, canceled permanently. && pause && goto A_Menu
if %CDMRand% == 54 echo Someone cue the sad violin for %enemy%. && pause && goto A_Menu
if %CDMRand% == 55 echo Did you mean to completely erase %enemy%? && pause && goto A_Menu
if %CDMRand% == 56 echo %enemy% bursts into non-refundable pieces. && pause && goto A_Menu
if %CDMRand% == 57 echo That'll teach %enemy% to exist. && pause && goto A_Menu
if %CDMRand% == 58 echo Rest in fragments, %enemy%. && pause && goto A_Menu
if %CDMRand% == 59 echo Death by protagonist: %enemy%. && pause && goto A_Menu
if %CDMRand% == 60 echo The respawn queue welcomes %enemy%. && pause && goto A_Menu
if %CDMRand% == 61 echo %enemy% just rage quit reality. && pause && goto A_Menu
if %CDMRand% == 62 echo You sent %enemy% to the shadow realm. && pause && goto A_Menu
if %CDMRand% == 63 echo %enemy% is sleeping with the respawns. && pause && goto A_Menu
if %CDMRand% == 64 echo All that's left of %enemy% is a vague memory. && pause && goto A_Menu
if %CDMRand% == 65 echo That was brutal. I almost feel bad for %enemy%. && pause && goto A_Menu
if %CDMRand% == 66 echo %enemy% fell apart like cheap IKEA furniture. && pause && goto A_Menu
if %CDMRand% == 67 echo That wasn't a fight, that was bullying. && pause && goto A_Menu
if %CDMRand% == 68 echo Someone please call %enemy%'s lawyer. && pause && goto A_Menu
if %CDMRand% == 69 echo Nice one. %enemy% is paste now. && pause && goto A_Menu
if %CDMRand% == 70 echo They'll tell tales of %enemy%... short tales. && pause && goto A_Menu
if %CDMRand% == 71 echo You just sent %enemy% straight to the patch notes. && pause && goto A_Menu
if %CDMRand% == 72 echo %enemy% was deleted like old save data. && pause && goto A_Menu
if %CDMRand% == 73 echo GG, %enemy%. GG. && pause && goto A_Menu
if %CDMRand% == 74 echo %enemy% is gone, but the trauma remains. && pause && goto A_Menu
if %CDMRand% == 75 echo All that's left of %enemy% is regret. && pause && goto A_Menu
if %CDMRand% == 76 echo Farewell %enemy%, your KD ratio is tanked. && pause && goto A_Menu
if %CDMRand% == 77 echo %enemy% had one job: survive. Failed. && pause && goto A_Menu
if %CDMRand% == 78 echo That was a flawless fatality on %enemy%. && pause && goto A_Menu
if %CDMRand% == 79 echo So long %enemy%, and thanks for nothing. && pause && goto A_Menu
if %CDMRand% == 80 echo That was over before it began for %enemy%. && pause && goto A_Menu
if %CDMRand% == 81 echo Life.exe has stopped working for %enemy%. && pause && goto A_Menu
if %CDMRand% == 82 echo There's no patch for what happened to %enemy%. && pause && goto A_Menu
if %CDMRand% == 83 echo You speedran %enemy%'s funeral. && pause && goto A_Menu
if %CDMRand% == 84 echo Yikes. That was graphic. Bye %enemy%. && pause && goto A_Menu
if %CDMRand% == 85 echo You've turned %enemy% into abstract art. && pause && goto A_Menu
if %CDMRand% == 86 echo Brutality unlocked: %enemy%. && pause && goto A_Menu
if %CDMRand% == 87 echo Just like that, %enemy% is folklore. && pause && goto A_Menu
if %CDMRand% == 88 echo Your overkill was sponsored by %enemy%. && pause && goto A_Menu
if %CDMRand% == 89 echo %enemy% tripped into the afterlife. && pause && goto A_Menu
if %CDMRand% == 90 echo That was the end of the road for %enemy%. && pause && goto A_Menu
if %CDMRand% == 91 echo Lights out, %enemy%. && pause && goto A_Menu
if %CDMRand% == 92 echo You clapped %enemy% out of existence. && pause && goto A_Menu
if %CDMRand% == 93 echo The credits roll for %enemy%. && pause && goto A_Menu
if %CDMRand% == 94 echo That looked painful, %enemy%. && pause && goto A_Menu
if %CDMRand% == 95 echo %enemy% couldn't withstand your plot armor. && pause && goto A_Menu
if %CDMRand% == 96 echo Boom. Dead. Next. && pause && goto A_Menu
if %CDMRand% == 97 echo That fight was a tutorial for you, a grave for %enemy%. && pause && goto A_Menu
if %CDMRand% == 98 echo You've taken %enemy% off the roster. && pause && goto A_Menu
if %CDMRand% == 99 echo That was savage. RIP %enemy%. && pause && goto A_Menu
if %CDMRand% == 100 echo A moment of silence for %enemy%. ...Okay, done. && pause && goto A_Menu
if %CMDRand% == 101 echo Much to the ire of the developer, the code spat out a value that wasn't expected. Hooray??? && pause && goto A_Menu
echo err. CDM didn't process correctly!
pause
goto CustomDeathMessage

:CDMStage2
:: Stage 2 gets dark.
if %CDMRand% == 1 echo %enemy% is reduced to a crimson smear. && pause && goto A_Menu
if %CDMRand% == 2 echo You watch %enemy% twitch one last time before going still. && pause && goto A_Menu
if %CDMRand% == 3 echo Blood fills the cracks of the ground around %enemy%. && pause && goto A_Menu
if %CDMRand% == 4 echo %enemy%'s final breath rattles in your ears. && pause && goto A_Menu
if %CDMRand% == 5 echo The light drains from %enemy%'s eyes. && pause && goto A_Menu
if %CDMRand% == 6 echo You stand over %enemy%, painted in gore. && pause && goto A_Menu
if %CDMRand% == 7 echo The silence after %enemy%'s scream is deafening. && pause && goto A_Menu
if %CDMRand% == 8 echo You broke %enemy% in ways that cannot be repaired. && pause && goto A_Menu
if %CDMRand% == 9 echo The ground shakes as %enemy% falls lifeless. && pause && goto A_Menu
if %CDMRand% == 10 echo You smell iron. && pause && echo It's %enemy%. && pause && goto A_Menu
if %CDMRand% == 11 echo %enemy% clutches at its own wounds, in vain. && pause && goto A_Menu
if %CDMRand% == 12 echo You could have stopped earlier. You didn't. && pause && goto A_Menu
if %CDMRand% == 13 echo Your strike shattered more than bones. && pause && goto A_Menu
if %CDMRand% == 14 echo There is no dignity in %enemy%'s death. && pause && goto A_Menu
if %CDMRand% == 15 echo You split %enemy% open like rotten fruit. && pause && goto A_Menu
if %CDMRand% == 16 echo Their blood paints the story you're writing. && pause && goto A_Menu
if %CDMRand% == 17 echo You feel nothing as %enemy% ceases. && pause && goto A_Menu
if %CDMRand% == 18 echo %enemy%'s cry is cut short, violently. && pause && goto A_Menu
if %CDMRand% == 19 echo It takes three seconds for %enemy% to die. You count them. && pause && goto A_Menu
if %CDMRand% == 20 echo The corpse leaks warmth across your hands. && pause && goto A_Menu
if %CDMRand% == 21 echo The sound of breaking cartilage echoes. && pause && goto A_Menu
if %CDMRand% == 22 echo You watch %enemy%'s body slacken, useless now. && pause && goto A_Menu
if %CDMRand% == 23 echo A spray of blood blinds you for a moment. && pause && goto A_Menu
if %CDMRand% == 24 echo The violence leaves fingerprints on your soul. && pause && goto A_Menu
if %CDMRand% == 25 echo %enemy% drowns in its own blood. && pause && goto A_Menu
if %CDMRand% == 26 echo You feel the crunch of ribs giving way. && pause && goto A_Menu
if %CDMRand% == 27 echo The smell of death clings to you. && pause && goto A_Menu
if %CDMRand% == 28 echo You've painted the arena with %enemy%. && pause && goto A_Menu
if %CDMRand% == 29 echo The floor will never be clean again. && pause && goto A_Menu
if %CDMRand% == 30 echo You know this won't be the last blood you spill. && pause && goto A_Menu
if %CDMRand% == 31 echo The corpse stares at you accusingly. && pause && goto A_Menu
if %CDMRand% == 32 echo You step over %enemy% without hesitation. && pause && goto A_Menu
if %CDMRand% == 33 echo You hear bones grinding underfoot. && pause && goto A_Menu
if %CDMRand% == 34 echo The taste of copper lingers in the air. && pause && goto A_Menu
if %CDMRand% == 35 echo Nothing about this feels heroic. && pause && goto A_Menu
if %CDMRand% == 36 echo You tear %enemy% apart in silence. && pause && goto A_Menu
if %CDMRand% == 37 echo The world darkens around %enemy%'s corpse. && pause && goto A_Menu
if %CDMRand% == 38 echo You can't unsee what you've done. && pause && goto A_Menu
if %CDMRand% == 39 echo Their blood joins the countless others. && pause && goto A_Menu
if %CDMRand% == 40 echo The cruelty was unnecessary. && pause && goto A_Menu
if %CDMRand% == 41 echo The echo of %enemy%'s scream will follow you. && pause && goto A_Menu
if %CDMRand% == 42 echo The corpse twitches once. Then silence. && pause && goto A_Menu
if %CDMRand% == 43 echo You've left the battlefield unrecognizable. && pause && goto A_Menu
if %CDMRand% == 44 echo The stench of death is your perfume now. && pause && goto A_Menu
if %CDMRand% == 45 echo This was never a fair fight. && pause && goto A_Menu
if %CDMRand% == 46 echo The way you killed %enemy% wasn't necessary. && pause && goto A_Menu
if %CDMRand% == 47 echo You feel the warmth leave %enemy%'s body. && pause && goto A_Menu
if %CDMRand% == 48 echo You don't even flinch anymore. && pause && goto A_Menu
if %CDMRand% == 49 echo Death clings to you like a shadow. && pause && goto A_Menu
if %CDMRand% == 50 echo You end lives with mechanical precision. && pause && goto A_Menu
if %CDMRand% == 51 echo You've forgotten what mercy feels like. && pause && goto A_Menu
if %CDMRand% == 52 echo Another one gone, and you remain. && pause && goto A_Menu
if %CDMRand% == 53 echo You stand ankle-deep in blood. && pause && goto A_Menu
if %CDMRand% == 54 echo The silence of death is deafening. && pause && goto A_Menu
if %CDMRand% == 55 echo The walls drip with proof of your violence. && pause && goto A_Menu
if %CDMRand% == 56 echo The laughter in your head isn't yours. && pause && goto A_Menu
if %CDMRand% == 57 echo You hear whispers in the blood. && pause && goto A_Menu
if %CDMRand% == 58 echo You tear away what remained of %enemy%'s life they had left. && pause && goto A_Menu
if %CDMRand% == 59 echo The light hates you now. && pause && goto A_Menu
if %CDMRand% == 60 echo Every death stains you darker. && pause && goto A_Menu
if %CDMRand% == 61 echo This is no longer survival. && pause && goto A_Menu
if %CDMRand% == 62 echo The smell of iron is all you know. && pause && goto A_Menu
if %CDMRand% == 63 echo Blood drips from your hands. && pause && goto A_Menu
if %CDMRand% == 64 echo The corpse looks at peace. You don't. && pause && goto A_Menu
if %CDMRand% == 65 echo You shattered %enemy%'s story in one strike. && pause && goto A_Menu
if %CDMRand% == 66 echo Violence is your only language. && pause && goto A_Menu
if %CDMRand% == 67 echo You bury hope beneath each corpse. && pause && goto A_Menu
if %CDMRand% == 68 echo You leave behind nothing but silence. && pause && goto A_Menu
if %CDMRand% == 69 echo The blood glistens, mocking you. && pause && goto A_Menu
if %CDMRand% == 70 echo You were merciless. && pause && goto A_Menu
if %CDMRand% == 71 echo Their life was brief. Their death was not. && pause && goto A_Menu
if %CDMRand% == 72 echo You didn't even hesitate. && pause && goto A_Menu
if %CDMRand% == 73 echo Your shadow grows longer with every kill. && pause && goto A_Menu
if %CDMRand% == 74 echo The weight of death follows you. && pause && goto A_Menu
if %CDMRand% == 75 echo Another corpse joins your collection. && pause && goto A_Menu
if %CDMRand% == 76 echo You are a butcher. && pause && goto A_Menu
if %CDMRand% == 77 echo The blood won't wash away. && pause && goto A_Menu
if %CDMRand% == 78 echo Their screams echo endlessly. && pause && goto A_Menu
if %CDMRand% == 79 echo The horror in their eyes was real. && pause && goto A_Menu
if %CDMRand% == 80 echo Your hands won't stop shaking. && pause && goto A_Menu
if %CDMRand% == 81 echo The body count rises. && pause && goto A_Menu
if %CDMRand% == 82 echo This is slaughter. && pause && goto A_Menu
if %CDMRand% == 83 echo Blood runs in rivers. && pause && goto A_Menu
if %CDMRand% == 84 echo You silence another life. && pause && goto A_Menu
if %CDMRand% == 85 echo Mercy is dead. && pause && goto A_Menu
if %CDMRand% == 86 echo The violence consumes you. && pause && goto A_Menu
if %CDMRand% == 87 echo They begged. You didn't care. && pause && goto A_Menu
if %CDMRand% == 88 echo You crush their last hope. && pause && goto A_Menu
if %CDMRand% == 89 echo This is your legacy: death. && pause && goto A_Menu
if %CDMRand% == 90 echo The blood sings for you. && pause && goto A_Menu
if %CDMRand% == 91 echo You don't remember their names anymore. && pause && goto A_Menu
if %CDMRand% == 92 echo You wear death like armor. && pause && goto A_Menu
if %CDMRand% == 93 echo Your violence leaves nothing but ruin. && pause && goto A_Menu
if %CDMRand% == 94 echo They never stood a chance. && pause && goto A_Menu
if %CDMRand% == 95 echo The air grows heavier with each kill. && pause && goto A_Menu
if %CDMRand% == 96 echo Their blood is warm on your face. && pause && goto A_Menu
if %CDMRand% == 97 echo You've grown numb to death. && pause && goto A_Menu
if %CDMRand% == 98 echo This is no longer a fight. It's an execution. && pause && goto A_Menu
if %CDMRand% == 99 echo Nothing human remains in your strike. && pause && goto A_Menu
if %CDMRand% == 100 echo You have become the ending of stories. && pause && goto A_Menu
if %CMDRand% == 101 echo Much to the ire of the developer, the code spat out a value that wasn't expected. Hooray??? && pause && goto A_Menu
echo err. CDMStage2 didn't process correctly!
pause
goto CustomDeathMessage


:CDMStage3
:: Stage 3, inner monologue calls player out for the massacre
if %CDMRand% == 1 echo You're cruel. && pause && echo Not powerful, not clever—just cruel. && pause && goto A_Menu
if %CDMRand% == 2 echo Another one? && pause && echo Do you even remember their faces anymore? && pause && goto A_Menu
if %CDMRand% == 3 echo You don't fight to survive. && pause && echo You fight because you like it. && pause && goto A_Menu
if %CDMRand% == 4 echo The blood on your hands doesn't wash away. && pause && echo Not after ninety-nine kills. && pause && echo Not ever. && pause && goto A_Menu
if %CDMRand% == 5 echo Was that necessary? && pause && echo Or did you just enjoy it? && pause && goto A_Menu
if %CDMRand% == 6 echo You've stopped killing enemies. && pause && echo Now you're killing excuses. && pause && goto A_Menu
if %CDMRand% == 7 echo Don't look away. && pause && echo This death is yours. && pause && goto A_Menu
if %CDMRand% == 8 echo Tell me—do you even feel anything anymore? && pause && goto A_Menu
if %CDMRand% == 9 echo Heroes don't leave piles of corpses. && pause && echo So what does that make you? && pause && goto A_Menu
if %CDMRand% == 10 echo Look at you. && pause && echo Level %level% and hollow. && pause && echo What a legacy. && pause && goto A_Menu
if %CDMRand% == 11 echo You laugh at the weak. && pause && echo But the truth is, you need them. && pause && echo Without them, you're nothing. && pause && goto A_Menu
if %CDMRand% == 12 echo It begged. && pause && echo You didn't even hesitate. && pause && goto A_Menu
if %CDMRand% == 13 echo You used to call this fun. && pause && echo Now it's just habit. && pause && goto A_Menu
if %CDMRand% == 14 echo You're not the hero of this story. && pause && echo You're the butcher. && pause && goto A_Menu
if %CDMRand% == 15 echo How many more before it matters to you? && pause && echo A hundred? A thousand? && pause && goto A_Menu
if %CDMRand% == 16 echo Do you even remember why you started fighting? && pause && echo Or was the reason already buried? && pause && echo %lbnam%: ...PRESIDENT... && pause && goto A_Menu
if %CDMRand% == 17 echo You should've stopped long ago. && pause && echo Now there's no going back. && pause && goto A_Menu
if %CDMRand% == 18 echo Another corpse at your feet. && pause && echo Another excuse in your mouth. && pause && goto A_Menu
if %CDMRand% == 19 echo You could've let it live. && pause && echo But you didn't. && pause && goto A_Menu
if %CDMRand% == 20 echo Do you feel proud? && pause && echo Or just… empty? && pause && goto A_Menu
if %CDMRand% == 21 echo You've killed so many. && pause && echo But tell me—what did it change? && pause && goto A_Menu
if %CDMRand% == 22 echo The world isn't safer. && pause && echo You just made it quieter. && pause && goto A_Menu
if %CDMRand% == 23 echo Every victory looks the same now. && pause && echo A smear of red, a pile of nothing. && pause && goto A_Menu
if %CDMRand% == 24 echo You've stopped chasing glory. && pause && echo Now you only chase blood. && pause && goto A_Menu
if %CDMRand% == 25 echo Do you think anyone is proud of you? && pause && echo Or do they whisper instead? && pause && goto A_Menu
if %CDMRand% == 26 echo You win every fight. && pause && echo And lose a little more of yourself each time. && pause && goto A_Menu
if %CDMRand% == 27 echo Not every kill is justice. && pause && echo This one was just indulgence. && pause && goto A_Menu
if %CDMRand% == 28 echo You've been here before. && pause && echo The battlefield never changes—only the bodies. && pause && goto A_Menu
if %CDMRand% == 29 echo Even victory feels hollow now, doesn't it? && pause && goto A_Menu
if %CDMRand% == 30 echo You're not unstoppable. && pause && echo You're just unwilling to stop. && pause && goto A_Menu
if %CDMRand% == 31 echo Another death for the pile. && pause && echo You stopped counting ages ago. && pause && goto A_Menu
if %CDMRand% == 32 echo Did you notice the fear in its eyes? && pause && echo Or were you too busy smiling? && pause && goto A_Menu
if %CDMRand% == 33 echo You tell yourself they deserved it. && pause && echo But deep down—you know better. && pause && goto A_Menu
if %CDMRand% == 34 echo You could quit any time. && pause && echo But you won't, will you? && pause && goto A_Menu
if %CDMRand% == 35 echo This isn't survival anymore. && pause && echo This is addiction. && pause && goto A_Menu
if %CDMRand% == 36 echo Do you think the dead forgive you? && pause && echo Or do they wait for you in silence? && pause && goto A_Menu
if %CDMRand% == 37 echo You've become efficient. && pause && echo Too efficient. && pause && echo There's no humanity in your strikes anymore. && pause && goto A_Menu
if %CDMRand% == 38 echo You never hesitate. && pause && echo That should scare you. && pause && goto A_Menu
if %CDMRand% == 39 echo You're still swinging long after the body falls. && pause && goto A_Menu
if %CDMRand% == 40 echo Every kill leaves a mark. && pause && echo You're covered in them. && pause && goto A_Menu
if %CDMRand% == 41 echo That wasn't a fight. && pause && echo It was an execution. && pause && goto A_Menu
if %CDMRand% == 42 echo You don't fight fair. && pause && echo But fairness died long before your enemies did. && pause && goto A_Menu
if %CDMRand% == 43 echo You saw it struggle. && pause && echo You didn't stop. && pause && goto A_Menu
if %CDMRand% == 44 echo Do you even flinch anymore? && pause && echo Or has death become your lullaby? && pause && goto A_Menu
if %CDMRand% == 45 echo That wasn't justice. && pause && echo That was hunger. && pause && goto A_Menu
if %CDMRand% == 46 echo You call this strength. && pause && echo But strength doesn't beg for more blood. && pause && goto A_Menu
if %CDMRand% == 47 echo You've trained yourself to feel nothing. && pause && echo But numbness is not peace. && pause && goto A_Menu
if %CDMRand% == 48 echo You crossed the line long ago. && pause && echo Now there's no lines left to cross. && pause && goto A_Menu
if %CDMRand% == 49 echo This isn't who you were meant to be. && pause && goto A_Menu
if %CDMRand% == 50 echo You're not feared because you're strong. && pause && echo You're feared because you never stop. && pause && goto A_Menu
if %CDMRand% == 51 echo The battlefield is empty now. && pause && echo Only you remain. && pause && goto A_Menu
if %CDMRand% == 52 echo You're a legend. && pause && echo Not the kind they'll sing about. && pause && goto A_Menu
if %CDMRand% == 53 echo You never let them surrender. && pause && goto A_Menu
if %CDMRand% == 54 echo It screamed. && pause && echo You smiled. && pause && goto A_Menu
if %CDMRand% == 55 echo Even now, you're still hungry. && pause && goto A_Menu
if %CDMRand% == 56 echo You are what monsters fear. && pause && echo But that doesn't make you human. && pause && goto A_Menu
if %CDMRand% == 57 echo There's no challenge left. && pause && echo Only slaughter. && pause && goto A_Menu
if %CDMRand% == 58 echo When was the last time you hesitated? && pause && goto A_Menu
if %CDMRand% == 59 echo You don't rest. && pause && echo You only kill. && pause && goto A_Menu
if %CDMRand% == 60 echo You call it victory. && pause && echo The rest of us call it loss. && pause && goto A_Menu
if %CDMRand% == 61 echo Every swing, every strike—practiced cruelty. && pause && goto A_Menu
if %CDMRand% == 62 echo You're not playing anymore. && pause && echo You're feeding. && pause && goto A_Menu
if %CDMRand% == 63 echo Another broken body. && pause && echo Another broken piece of you. && pause && goto A_Menu
if %CDMRand% == 64 echo It was never about survival. && pause && echo It was about control. && pause && goto A_Menu
if %CDMRand% == 65 echo You don't leave survivors. && pause && echo You leave warnings. && pause && goto A_Menu
if %CDMRand% == 66 echo Even in silence, the dead curse your name. && pause && goto A_Menu
if %CDMRand% == 67 echo You're proud of this? && pause && echo Really? && pause && goto A_Menu
if %CDMRand% == 68 echo You're not climbing higher. && pause && echo You're sinking deeper. && pause && goto A_Menu
if %CDMRand% == 69 echo It wasn't a fair fight. && pause && echo It never is. && pause && goto A_Menu
if %CDMRand% == 70 echo There's no honor in this. && pause && echo Only indulgence. && pause && goto A_Menu
if %CDMRand% == 71 echo You crossed mercy off the list a long time ago. && pause && goto A_Menu
if %CDMRand% == 72 echo You don't hesitate. && pause && echo That's not bravery. && pause && echo That's emptiness. && pause && goto A_Menu
if %CDMRand% == 73 echo Another life wasted. && pause && echo Yours, not theirs. && pause && goto A_Menu
if %CDMRand% == 74 echo The longer you fight, the less of you remains. && pause && goto A_Menu
if %CDMRand% == 75 echo You can't keep blaming the world. && pause && echo This is all on you. && pause && goto A_Menu
if %CDMRand% == 76 echo No one will thank you for this. && pause && goto A_Menu
if %CDMRand% == 77 echo Death follows you. && pause && echo Not as an enemy, but as a partner. && pause && goto A_Menu
if %CDMRand% == 78 echo Every step you take is over graves now. && pause && goto A_Menu
if %CDMRand% == 79 echo You didn't just kill it. && pause && echo You erased it. && pause && goto A_Menu
if %CDMRand% == 80 echo You've built your throne out of corpses. && pause && echo Comfortable? && pause && goto A_Menu
if %CDMRand% == 81 echo You're cruel. && pause && echo Not powerful, not clever—just cruel. && pause && goto A_Menu
if %CDMRand% == 82 echo You could stop at any time. && pause && echo But you won't. && pause && echo You like this too much. && pause && goto A_Menu
if %CDMRand% == 83 echo You've stopped noticing the screams. && pause && echo That should terrify you. && pause && goto A_Menu
if %CDMRand% == 84 echo Mercy is a word you forgot. && pause && goto A_Menu
if %CDMRand% == 85 echo You're not a savior. && pause && echo You're a curse. && pause && goto A_Menu
if %CDMRand% == 86 echo How many more deaths will it take to satisfy you? && pause && goto A_Menu
if %CDMRand% == 87 echo You're feared, yes. && pause && echo But loved? && pause && echo Never. && pause && goto A_Menu
if %CDMRand% == 88 echo You call it progress. && pause && echo I call it obsession. && pause && goto A_Menu
if %CDMRand% == 89 echo Another meaningless death. && pause && echo Another meaningless you. && pause && goto A_Menu
if %CDMRand% == 90 echo You've stopped being human. && pause && echo Now you're just hunger in a body. && pause && goto A_Menu
if %CDMRand% == 91 echo Every monster you kill looks more familiar. && pause && echo Almost like a mirror. && pause && goto A_Menu
if %CDMRand% == 92 echo You've forgotten why you started. && pause && echo But you'll never forget how to kill. && pause && goto A_Menu
if %CDMRand% == 93 echo They won't write songs about you. && pause && echo They'll write warnings. && pause && goto A_Menu
if %CDMRand% == 94 echo You're not ascending. && pause && echo You're circling the drain. && pause && goto A_Menu
if %CDMRand% == 95 echo You kill without thinking. && pause && echo Without caring. && pause && goto A_Menu
if %CDMRand% == 96 echo Your victories echo. && pause && echo Not with cheers, but with silence. && pause && goto A_Menu
if %CDMRand% == 97 echo You've won every fight. && pause && echo And lost yourself along the way. && pause && goto A_Menu
if %CDMRand% == 98 echo Do you even hear the screams anymore? && pause && goto A_Menu
if %CDMRand% == 99 echo You've become what you swore to destroy. && pause && goto A_Menu
if %CDMRand% == 100 echo This isn't triumph. && pause && echo This is tragedy. && pause && goto A_Menu
if %CMDRand% == 101 echo Much to the ire of the developer, the code spat out a value that wasn't expected. Hooray??? && pause && goto A_Menu
echo err. CDMStage3 didn't process correctly!
pause
goto CustomDeathMessage

:CDMStage4
:: God complex acquired
if %CDMRand2% == 1 echo %enemy% does not die. && pause && echo It is unmade. && pause && echo The void knows your name. && pause && goto A_Menu
if %CDMRand2% == 2 echo %enemy% collapses, not from your strike, but from recognition. && pause && echo They saw God in your eyes. && pause && goto A_Menu
if %CDMRand2% == 3 echo The corpse of %enemy% glows faintly. && pause && echo It is not blood, but devotion spilling forth. && pause && echo They worship even in death. && pause && goto A_Menu
if %CDMRand2% == 4 echo The world itself bends as %enemy% falls. && pause && echo Time pauses, space cracks. && pause && echo All of creation records your act. && pause && goto A_Menu
if %CDMRand2% == 5 echo %enemy% was never alive. && pause && echo It was written only to meet you here. && pause && echo This moment was its only purpose. && pause && echo You are the author now. && pause && goto A_Menu
echo err. CDMStage4 didn't process correctly!
pause
goto CustomDeathMessage

:Battle_Attack
set /a canCastLvl=%RANDOM% * 5 / 32768
call bin/battle/healthCheck.bat
call bin/battle/EhealthCheck.bat
call bin/battle/healthRandom.bat
call bin/battle/getCrit.bat
if %critSwitch% == 1 goto critsuccess
call bin/battle/getATK.bat
set /a mgkChnc=%RANDOM% * 4 / 32768 + 1
if %mgkChnc% == 1 set resetSwitch=3
call bin/battle/getBlock.bat
:: 0, not blocked.
:: 1, full block and is handled by getBlock, getEATK.bat ignores.
:: 2, partial block
if %resetSwitch% == 0 call bin/battle/getEATK.bat
if %resetSwitch% == 2 call bin/battle/getEATK.bat
if %resetSwitch% == 3 call bin/battle/getEmgk.bat
if %resetSwitch% == 3 if "%enemy%" == "Deprecated President" set castLvl=%canCastLvl%
if %resetSwitch% == 3 if "%enemy%" == "Mr. President" set castLvl=%canCastLvl%
pause
cls
:: Clean up the mess and turn off debug mode.
set resetSwitch=0 
set nulbool=0
goto Battle

:critsuccess
call bin/battle/getCritDMG.bat
:: Crits are broken in a working way <3
if not %weaponarray% == 8 (
if %critDMG% GTR 450 echo You summon an orbital death laser. BVVVVVTTT!!!
if %critDMG% GTR 1000 echo That was orbital death laser jr, this is Orbital Death Laser Sr.
if %critDMG% GTR 5000 echo God forbid something survives after this crit. 
if %critDMG% GTR 30000 echo Toast. %enemy% is toast.
if %critDMG% GTR 100000 echo You are now outputting enough power to destroy the planet.
if %critDMG% GTR 200000 echo Uncle, are you nuking your enemies again?
) else (
if %critDMG% GTR 10000 echo Gods finger twitches...
if %critDMG% GTR 100000 echo Gods finger flexes...
if %critDMG% GTR 900000 echo GODS FINGER SMITES THEE!
)
echo You scored a Critial Hit^! 
echo You did %critDMG% damage to %enemy%^!
echo. 
call bin/battle/getBlock.bat
call bin/battle/getEATK.bat
pause
cls
goto Battle

:FleeBattle
set /a flee=%RANDOM% * 10 / 32768 + 1
:DebugFleeBattle
set /a Eattack=%RANDOM% * %Edmg% / 32768 + 1
if %Eattack% LSS 0 set Eattack=50000 && echo WHAAAMM!!
if %flee% LSS 5 (
if "%enemy%" == "Deprecated President" echo %enemy%: Y-Y-Y-You're not getting away this time.
if "%enemy%" == "Mr. President" echo %enemy%: Heh heh heh, you're not getting away this time.
if "%enemy%" == "The President" echo %enemy%: Escape is impossible, stop trying to flee.
echo You failed to run away...
echo You took %Eattack% damage.
set /a currentHP=%currentHP%-%Eattack%
pause
cls
goto Battle
)
if %flee%==5 (
set /a currentHP=%currentHP%-10
if %currentHP% LSS 0 echo You attempted to run, but got killed in the process. && set currentHP=0 && pause && goto Battle
if "%enemy%" == "Deprecated President" echo %enemy%: Yes, yes, run away. You should've known you were outmatched.
if "%enemy%" == "Mr. President" echo %enemy%: Know your place, %lbnam%.
if "%enemy%" == "The President" echo %enemy%: Please, you're just hurting yourself in your struggle.
if not "%enemy%" == "The President" echo You ran away, but were injured in the process...
if "%enemy%" == "The President" echo His overwhelming presence roots you in place, you can't escape!
echo You took 10 damage.
pause
if "%enemy%" == "The President" cls && goto Battle
if not %clientSound% == null.mp3 set clientSound=null.mp3 && call bin\handler\jukebox.bat
:: Kills sound even if clientsound is set to presidentnull.mp3
goto A_Menu
)
if %flee% GTR 5 (
if "%enemy%" == "Deprecated President" echo %enemy%: Hehehe, you're as weak as I suspected.
if "%enemy%" == "Mr. President" echo %enemy%: Really? You ran away? Psh, weakling.
if "%enemy%" == "The President" echo %enemy%: No, you're staying right here.
echo You ran away successfully.
if "%enemy%" == "The President" echo Except you didn't, The President reels you back into battle! 
pause
if "%enemy%" == "The President" cls && goto Battle
if not %clientSound% == null.mp3 set clientSound=null.mp3 && call bin\handler\jukebox.bat
:: Kills sound even if clientsound is set to presidentnull.mp3
cls
goto A_Menu
)

:EPATK
cls 
echo EP: %currentEP% / %MaxEP% 
echo %enemy% HP: %EcurrentHP%/%EmaxHP% 
echo. 
echo 1) Flame Attack^! 
echo You cast a fireball, does 0-%mDMG% on impact and 
echo does between 0-%mDmg% damage every round until the
echo status effect changes or the enemy dies.
echo Costs: 35 EP
echo.
echo 2) Life Drain^! 
echo Drains between 0-%maxHP% HP and adds it to your own. 
echo Costs: 50 EP 
echo. 
echo back) Return to previous screen
set /p input=Choice?:: 
if %input% == 1 goto mgcFinFire
if %input% == 2 goto mgcFinDrain
if %input% == back cls && goto Battle 
echo That was not a valid option^!  
pause 
goto EPATK 


:mgcFinFire
cls
set nulbool=2
call bin/battle/drawBattle.bat
call bin/battle/healthCheck.bat 
call bin/battle/EhealthCheck.bat
call bin/battle/healthRandom.bat
call :getEP
call bin/battle/getBlock.bat
if %resetSwitch% == 0 call bin/battle/getEATK.bat
if %resetSwitch% == 2 call bin/battle/getEATK.bat
pause
cls
set resetSwitch=0 
set nulbool=0
goto Battle

:mgcFinDrain
cls
set nulbool=3
call bin/battle/drawBattle.bat
call bin/battle/healthCheck.bat
call bin/battle/EhealthCheck.bat
call bin/battle/healthRandom.bat
call :getEP
call bin/battle/getBlock.bat
if %resetSwitch% == 0 call bin/battle/getEATK.bat
if %resetSwitch% == 2 call bin/battle/getEATK.bat
pause
cls
set resetSwitch=0 
set nulbool=0
goto Battle


:: FIXME
:getEP
:: Subroutine
if %nulbool% == 2 call bin/battle/getFire.bat
if %nulbool% == 3 call bin/battle/getHPdrain.bat 
exit /b


:Battle_Inventory
cls
:: Improve pls (circa 2014-2015)
:: Imrpveo slp (circa 2020)
:: THERE I IMPROVED IT.
echo %lbnam%
echo HP: %currentHP% / %maxHP%
echo EP: %currentEP% / %maxEP%
echo Status: %healthStatus%
echo.
echo 1:HP Potions: %hppot%
echo 2:EP Potions: %eppot%
echo 3:Back
set /p input=Choose one::
if %input%==1 goto hppot
if %input%==2 goto eppot
if %input%==3 cls && goto Battle


:hppot
if %hppot% LEQ 0 (
echo You are out of HP potions.
pause
cls
goto Battle_Inventory
)
if %currentHP% GEQ %maxHP% (
echo Your HP is already full^!
pause
cls
goto Battle_Inventory
)
set /a trashVar=%currentHP% + 40
if %trashVar% GTR %maxHP% set currentHP=%maxHP% 
set currentHP=%trashVar% 
echo You feel refreshed. (Restored some HP)
pause
call bin/battle/getBlock.bat
if %resetSwitch% == 0 call bin/battle/getEATK.bat 
if %resetSwitch% == 2 call bin/battle/getEATK.bat
set /a hppot=%hppot%-1
set resetSwitch=0
pause
cls
goto Battle


:eppot
if %eppot% LEQ 0 (
echo You are out of EP potions.
pause
cls
goto Battle_Inventory
)
if %currentEP% GEQ %maxEP% (
echo You're full of energy^! Any more, you'll burn up^!
pause
cls
goto Battle_Inventory
)
set /a currentEP=%currentEP% + 40
echo You feel rejuvenated^! (EP Restored)
pause 
call bin/battle/getBlock.bat
if %resetSwitch% == 0 call bin/battle/getEATK.bat
if %resetSwitch% == 2 call bin/battle/getEATK.bat
set /a eppot=%eppot%-1
pause
cls
goto Battle


:LevelUp
cls
set input=DECIDEONYOURLEVELBRUH
set /a level=%level%+1
if %exp% GTR %expToNextLevel% set /a expCarry=%exp%-%expToNextLevel%
set /a exp=0+%expCarry%
set /a expLevelRand=%Random% * %level% / 32768 + 1
set /a expLevelMult=%expLevelRand% * 3
set /a expToNextLevel=%expToNextLevel%+100+%expLevelMult%
set /a currentHP=%maxHP%
set /a currentEP=%maxEP%
set healthStatus=Healthy
echo Congratulations, %lbnam%, you've reached Level %level%^!
if %nulbool% == 1 echo input var is %input%
pause
if %level%==30 goto LevelUp6 
if %level% GTR 30 if %scene% == 0 goto LevelUp6
:levelUp1
cls
echo You have 5 stat points to divide up throughout your stats. 
echo Choose a stat to add a point to^! 
echo.
echo 1:DAMAGE  %tab% %dmg%
echo 2:HEALTH  %tab% %maxHP%
echo 3:MAGIC   %tab% %maxEP%
echo 4:MAGIC DMG%tab% %mDmg%
echo 5:BLOCK   %tab% %blockcnce% (Decreases, lower is better)
echo 6:CRIT MULT%tab% %critMult%
echo 7:CRIT CHANCE%tab% %critcnce% (Decreases, lower is better)
set /p input=Select a stat to increase by one point:: 
if /i %input%==1 (
set /a dmg=%dmg%+1
goto levelUp2
)
if /i %input%==2 (
set /a maxHP=%maxHP%+5
goto levelUp2
)
if /i %input%==3 (
set /a maxEP=%maxEP%+5
goto levelUp2
)
if /i %input%==4 (
set /a mDmg=%mDmg%+1
goto levelUp2
)
if /i %input%==5 (
if %blockcnce% LEQ 2 echo Cannot decrease this stat anymore! && pause && goto levelUp1
set /a blockcnce=%blockcnce%-1
goto levelUp2
)
if /i %input%==6 (
set /a critMult=%critMult%+1
goto levelUp2
)
if /i %input%==7 (
if %critcnce% LEQ 2 echo Cannot decrease this stat anymore! && pause && goto levelUp1
set /a critcnce=%critcnce%-1
goto levelUp2
)
goto levelUp1
:levelUp2
cls
echo You have 4 stat points to divide up throughout your stats. 
echo Choose a stat to add a point to^! 
echo.
echo 1:DAMAGE  %tab% %dmg%
echo 2:HEALTH  %tab% %maxHP%
echo 3:MAGIC   %tab% %maxEP%
echo 4:MAGIC DMG%tab% %mDmg%
echo 5:BLOCK   %tab% %blockcnce% (Decreases, lower is better)
echo 6:CRIT MULT%tab% %critMult%
echo 7:CRIT CHANCE%tab% %critcnce% (Decreases, lower is better)
set /p input=Select a stat to increase by one point:: 
if /i %input%==1 (
set /a dmg=%dmg%+1
goto levelUp3
)
if /i %input%==2 (
set /a maxHP=%maxHP%+5
goto levelUp3
)
if /i %input%==3 (
set /a maxEP=%maxEP%+5
goto levelUp3
)
if /i %input%==4 (
set /a mDmg=%mDmg%+1
goto levelUp3
)
if /i %input%==5 (
if %blockcnce% LEQ 2 echo Cannot decrease this stat anymore! && pause && goto levelUp2
set /a blockcnce=%blockcnce%-1
goto levelUp3
)
if /i %input%==6 (
set /a critMult=%critMult%+1
goto levelUp3
)
if /i %input%==7 (
if %critcnce% LEQ 2 echo Cannot decrease this stat anymore! && pause && goto levelUp2
set /a critcnce=%critcnce%-1
goto levelUp3
)
goto levelUp2

:levelUp3
cls
echo You have 3 stat points to divide up throughout your stats. 
echo Choose a stat to add a point to^! 
echo.
echo 1:DAMAGE  %tab% %dmg%
echo 2:HEALTH  %tab% %maxHP%
echo 3:MAGIC   %tab% %maxEP%
echo 4:MAGIC DMG%tab% %mDmg%
echo 5:BLOCK   %tab% %blockcnce% (Decreases, lower is better)
echo 6:CRIT MULT%tab% %critMult%
echo 7:CRIT CHANCE%tab% %critcnce% (Decreases, lower is better)
set /p input=Select a stat to increase by one point:: 
if /i %input%==1 (
set /a dmg=%dmg%+1
goto levelUp4
)
if /i %input%==2 (
set /a maxHP=%maxHP%+5
goto levelUp4
)
if /i %input%==3 (
set /a maxEP=%maxEP%+5
goto levelUp4
)
if /i %input%==4 (
set /a mDmg=%mDmg%+1
goto levelUp4
)
if /i %input%==5 (
if %blockcnce% LEQ 2 echo Cannot decrease this stat anymore! && pause && goto levelUp3
set /a blockcnce=%blockcnce%-1
goto levelUp4
)
if /i %input%==6 (
set /a critMult=%critMult%+1
goto levelUp4
)
if /i %input%==7 (
if %critcnce% LEQ 2 echo Cannot decrease this stat anymore! && pause && goto levelUp3
set /a critcnce=%critcnce%-1
goto levelUp4
)
goto levelUp3

:levelUp4
cls
echo You have 2 stat points to divide up throughout your stats. 
echo Choose a stat to add a point to^! 
echo.
echo 1:DAMAGE  %tab% %dmg%
echo 2:HEALTH  %tab% %maxHP%
echo 3:MAGIC   %tab% %maxEP%
echo 4:MAGIC DMG%tab% %mDmg%
echo 5:BLOCK   %tab% %blockcnce% (Decreases, lower is better)
echo 6:CRIT MULT%tab% %critMult%
echo 7:CRIT CHANCE%tab% %critcnce% (Decreases, lower is better)
set /p input=Select a stat to increase by one point:: 
if /i %input%==1 (
set /a dmg=%dmg%+1
goto levelUp5
)
if /i %input%==2 (
set /a maxHP=%maxHP%+5
goto levelUp5
)
if /i %input%==3 (
set /a maxEP=%maxEP%+5
goto levelUp5
)
if /i %input%==4 (
set /a mDmg=%mDmg%+1
goto levelUp5
)
if /i %input%==5 (
if %blockcnce% LEQ 2 echo Cannot decrease this stat anymore! && pause && goto levelUp4
set /a blockcnce=%blockcnce%-1
goto levelUp5
)
if /i %input%==6 (
set /a critMult=%critMult%+1
goto levelUp5
)
if /i %input%==7 (
if %critcnce% LEQ 2 echo Cannot decrease this stat anymore! && pause && goto levelUp4
set /a critcnce=%critcnce%-1
goto levelUp5
)
goto levelUp4

:levelUp5
cls
echo You have 1 stat point to divide up throughout your stats. 
echo Choose a stat to add a point to^! 
echo.
echo 1:DAMAGE  %tab% %dmg%
echo 2:HEALTH  %tab% %maxHP%
echo 3:MAGIC   %tab% %maxEP%
echo 4:MAGIC DMG%tab% %mDmg%
echo 5:BLOCK   %tab% %blockcnce% (Decreases, lower is better)
echo 6:CRIT MULT%tab% %critMult%
echo 7:CRIT CHANCE%tab% %critcnce% (Decreases, lower is better)
set /p input=Select a stat to increase by one point:: 
if /i %input%==1 (
set /a dmg=%dmg%+1
goto doubleCheck
)
if /i %input%==2 (
set /a maxHP=%maxHP%+5
goto doubleCheck
)
if /i %input%==3 (
set /a maxEP=%maxEP%+5
goto doubleCheck
)
if /i %input%==4 (
set /a mDmg=%mDmg%+1
goto doubleCheck
)
if /i %input%==5 (
if %blockcnce% LEQ 2 echo Cannot decrease this stat anymore! && pause && goto levelUp5
set /a blockcnce=%blockcnce%-1
goto doubleCheck
)
if /i %input%==6 (
set /a critMult=%critMult%+1
goto doubleCheck
)
if /i %input%==7 (
if %critcnce% LEQ 2 echo Cannot decrease this stat anymore! && pause && goto levelUp5
set /a critcnce=%critcnce%-1
goto doubleCheck
)
goto levelUp5

:LevelUp6
set scene=1
echo The shopkeep pulls you aside!
echo Shopkeep: Wait!!! Some of you keep flying about!
echo Shopkeep: Do I have your attention???
echo.
ping localhost -n 8 >nul
echo Shopkeep: Good...
ping localhost -n 5 >nul
cls
echo Shopkeep: Listen, you've been... doing a lot out there.
ping localhost -n 5 >nul
echo Shopkeep: I support you in equipping you with your weapons but...
ping localhost -n 7 >nul
echo Shopkeep: The things you've done with my wares has upset the balance!!
echo The Shopkeep looks visibly distressed. 
ping localhost -n 8 >nul
echo Shopkeep: Things might start fighting back a little harder, be careful.
ping localhost -n 4 >nul
echo The Shopkeep left back to his building...
ping localhost -n 4 >nul
echo Is this mission to defeat the President worth doing? It must be.
pause
goto levelUp

:doubleCheck
if %exp% GEQ %expToNextLevel% goto levelUp
goto q_SAV 

:Shop_Menu
cls
echo Welcome to the shop^! Here you can buy all of your weapon needs.
echo %lbnam% has %Nodes% nodes available.
echo You have %eppot% EP potions and %hppot% potions.
echo.
echo What can we get for you?
echo 1) Dagger (+5 DMG, 150 Nodes)
echo 2) Sword (+10 DMG, 550 Nodes)
echo 3) Flame Sword (+15 DMG, 1500 Nodes)
echo 4) Rocket Launcher (+35 DMG, 5000 Nodes)
echo 5) Death Machine (+65 DMG, 10000 Nodes)
echo 6) Bot Buster (+115 DMG, 45000 Nodes)
echo 7) Portable Death Laser (+750 DMG, 750000 Nodes)
echo 8) +1 EP Potion (50 Nodes) 
echo 9) +1 HP Potion (25 Nodes)
if %level% GEQ 30 echo 10) Imbue Weapon
if %level% GEQ 100 echo 11) God's Finger (+3500 DMG, 1000000 Nodes)
if "%lbnam%" == "TheLoof" echo Finger) God's Middle Finger (+5500 DMG, for the chosen one)
echo back) Back to map
echo.
set /p shopMenu=:: 
if %shopMenu% == 1 set resetSwitch=1 && call bin/item/shopKeep.bat && goto Shop_Menu
if %shopMenu% == 2 set resetSwitch=2 && call bin/item/shopKeep.bat && goto Shop_Menu
if %shopMenu% == 3 set resetSwitch=3 && call bin/item/shopKeep.bat && goto Shop_Menu
if %shopMenu% == 4 set resetSwitch=4 && call bin/item/shopKeep.bat && goto Shop_Menu
if %shopMenu% == 5 set resetSwitch=7 && call bin/item/shopKeep.bat && goto Shop_Menu
if %shopMenu% == 6 set resetSwitch=8 && call bin/item/shopKeep.bat && goto Shop_Menu
if %shopMenu% == 7 set resetSwitch=9 && call bin/item/shopKeep.bat && goto Shop_Menu
if %shopMenu% == 8 set resetSwitch=6 && call bin/item/shopKeep.bat && goto Shop_Menu
if %shopMenu% == 9 set resetSwitch=5 && call bin/item/shopKeep.bat && goto Shop_Menu
if %level% GEQ 30 if %shopMenu% == 10 goto imbueWep
if %level% GEQ 100 if %shopMenu% == 11 set resetSwitch=10 && call bin/item/shopKeep.bat && goto Shop_Menu
if "%lbnam%" == "TheLoof" if "%shopMenu%" == "Finger" set resetSwitch=10 && call bin/item/shopKeep.bat && goto Shop_Menu
if %shopMenu% == back goto Map
if %shopMenu% == Back goto Map
goto A_Menu

:imbueWep
cls
echo Shopkeep: Hey, this is all a bit new to me so bear with me. 
echo It's powered off of your life force, don't worry it won't hurt you.
echo It just means when you decide to actually put your weapons down
echo it will lose its status. Except for the flame sword.
echo That said, this will cost ya a flat rate fee of 1000 Nodes.
echo. 
echo 1) Flame 
echo 2) Sickness
echo 3) Corruption
echo 4) Infection?
if "%weaponname%" == "Gods Finger " echo 5) Finger.
echo.
echo back) Back to shop
set /p iWep=What will it be: 
if %iWep% == 1 set resetSwitch=11 && call bin/item/shopKeep.bat && goto imbueWep
if %iWep% == 2 set resetSwitch=12 && call bin/item/shopKeep.bat && goto imbueWep
if %iWep% == 3 set resetSwitch=13 && call bin/item/shopKeep.bat && goto imbueWep
if %iWep% == 4 set resetSwitch=14 && call bin/item/shopKeep.bat && goto imbueWep
if %iWep% == 5 if "%weaponname%" == "Gods Finger " set resetSwitch=15 && call bin/item/shopKeep.bat && goto imbueWep
if %iWep% == back goto Shop_Menu
if %iWep% == Back goto Shop_Menu
goto imbueWep


:Checkforupdates
::                                                                        i < line limit 

cls
echo I can actually provide updates remotely via old means if I can
echo remember where I left all the code lol
echo.
echo In the meantime should I ever make this happen again, I'd just rely
echo on GameJolt to update everything. 
echo.
echo If you're a good nougat though, you should actually visit my Github.
echo         https://github.com/MeshyDev/BioFuse_Repo
pause 
goto start
::                                      I MIDDLE


:outdated
set specialmsg=0
cls
if %versionnum% == 1.8.0 set weaponeight=0 && set weaponarray=0 && set weaponname=Fists && set weapondmg=0 && set weaponmod=Nothing
if %versionnum% == 1.8.1 set weaponeight=0 && set weaponarray=0 && set weaponname=Fists && set weapondmg=0 && set weaponmod=Nothing
if %versionnum% == 1.8.2 set weaponeight=0 && set weaponarray=0 && set weaponname=Fists && set weapondmg=0 && set weaponmod=Nothing
if %versionnum% == 1.7.2 set weaponseven=0 && set weaponeight=0 && set weaponarray=0 && set weaponname=Fists && set weapondmg=0 && set weaponmod=Nothing
if %versionnum% == 1.7.1 set weaponseven=0 && set weaponeight=0 && set weaponarray=0 && set weaponname=Fists && set weapondmg=0 && set weaponmod=Nothing
if %versionnum% == 1.7.0 set weaponseven=0 && set weaponeight=0 && set weaponarray=0 && set weaponname=Fists && set weapondmg=0 && set weaponmod=Nothing
if %versionnum% == 1.6.0 set weaponsix=0 && set weaponseven=0 && set weaponeight=0 && set weaponarray=0 && set weaponname=Fists && set weapondmg=0 && set weaponmod=Nothing
if %versionnum% == 1.5.0 set weaponsix=0 && set weaponseven=0 && set weaponeight=0 && set weaponarray=0 && set weaponname=Fists && set weapondmg=0 && set weaponmod=Nothing
:: Force reset weaponry as 1.8.1 had a damage rebalance of every weapon.
if %versionnum% == 1.7.2 set specialmsg=1
if %versionnum% == 1.7.1 set specialmsg=1
if %versionnum% == 1.7.0 set specialmsg=1
if %versionnum% == 1.6.0 set specialmsg=1
if %versionnum% == 1.5.0 set specialmsg=2
if %versionnum% == 1.4.0 set specialmsg=2
if %versionnum% == 1.3.0 set specialmsg=2
if %versionnum% == 1.2.1 set specialmsg=3
if %versionnum% == 1.2.0 set specialmsg=3
if %versionnum% == 1.8.0 set specialmsg=4
if %versionnum% == 1.8.1 set specialmsg=5
if %versionnum% == 1.8.2 set specialmsg=5
if %versionnum% == 1.9.1 set specialmsg=6
if %versionnum% == 1.10.1 set specialmsg=7
set versionnum=%version%
echo Oh no! Your save file is out of date! We'll take the liberty of 
echo updating your files for you. Don't want to have a bad save, right? 
echo There is a chance this will crash the game, don't worry.
echo Your data is fine. Just relaunch and load the game again.
echo.
if not %specialmsg% == 5 echo This will make you unequip your weaponry. You still have it!
if not %specialmsg% == 5 echo Just re-equip!
if %specialmsg% == 1 echo (1.6.0, 1.7.x)Due to the addition of a weapon in 1.8.0 you may have to re-equip your last weapon. && echo This was done to prevent too much data loss upon upgrading.
if %specialmsg% == 2 echo (1.3.0 - 1.5.0)I won't lie, I have no idea how this will go. Data loss may be inevitable due to the drastic changes between versions. && echo Good luck!
if %specialmsg% == 3 echo (1.2.0 - 1.2.1)This can go either way. I won't support anything on the ye olde biofuse saves.
if %specialmsg% == 4 echo (1.8.0)Due to an oversight on my part, saves coming from 1.7.2 may suffer slight corruption. The 1.8.1 patch fixes that.
if %specialmsg% == 5 echo (1.8.0-1.8.2)Weapon has been unequipped to prevent data loss from new weapon in 1.8.3
if %specialmsg% == 6 echo (1.10.0)Added a scene variable thats necessary for showing cutscenes to people level 30+
if %specialmsg% == 7 echo (1.10.x+)But.. I haven't even got to that part yet. Also unlikely...
if %specialmsg% == 0 echo (?.?.?)BioFuse couldn't identify what version this save is. Is it from 0.2.7? This fixer WILL erase everything and start the file anew. && echo If you don't want this, exit the game.
pause 
if %specialmsg% == 0 set resetSwitch=1 && echo (Unknown save fallback, resetting variables.) && call :redef && ping localhost -n 2 >nul && echo Redef verified... saving... && set resetSwitch=0 && ping localhost -n 2 >nul
goto q_SAV
:MainScreen_Check
if %adventure%==0 goto MainScreen
if %adventure%==1 goto MainScreen_Adventure


:Start_Adv
if %level% LSS 5000 (
cls
echo BioFuse Adventure is not available in this version. 
echo This dialogue and option in the menu is left as a memento
echo to a time long since passed. 
pause
goto MainScreen
)
goto MainScreen

:extraspecialmessage
cls
echo holy shit dude you beat the main boss of my game
echo bruh, I can't understate how awesome it is to know
echo that you played it through this far. 
echo. 
echo I'm gonna do some extra silly fuckery and send you 
echo TO THE DEBUG ROOM. I figure you earned it ;)
echo. 
ping localhost -n 3 >nul
pause
set loc=DBMENU
goto A_Menu

