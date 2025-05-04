@echo off

set version=1.8.2
set vmsg=The sickly are growing increasingly pissed off (Bugfixes + Win11 support)
set vmsg2=And of course, thank you Meshcaid for adopting Nodes as currency

:: This is a game with an engine strapped to it.
:: How am I gonna make this an engine for other people to use lmao

:: DEFINE VARIABLES 

set resetSwitch=0 
title BioFuse
:redef
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
set weaponarray=0
set weaponname=Fists
set weapondmg=0
set weaponmod=Nothing

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
echo I recommend looking up a tutorial to change your Terminal behavior to
echo Windows Console Host. Once that's done everything should work normally.
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
set /p weaponarray=
set /p weaponname=
set /p weapondmg=
set /p weaponmod=
)<bin/sav/%lbnam%.set
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
(echo %weaponarray%) >> bin/sav/%lbnam%.set
(echo %weaponname%) >> bin/sav/%lbnam%.set
(echo %weapondmg%) >> bin/sav/%lbnam%.set
(echo %weaponmod%) >> bin/sav/%lbnam%.set
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
if %nulbool% == 1 echo XP:Add XP
set /p input=Choice?::
if %input%==1 goto A_Menu
if %input%==2 goto q_SAV
if %input%==3 goto C_Menu
if %input%==XP goto XP_Menu
if %input%==4 goto musicToggleGame
echo Sorry, I don't understand that. Could you try again?
pause
cls
goto MainScreen
:XP_Menu
cls
echo 50000 XP added.
set /a exp=%exp%+50000
pause
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
cls
echo Status: %healthStatus%
echo HP: %currentHP% / %maxHP%
echo EP: %currentEP% / %maxEP%
echo Nodes: %nodes%  XNodes: %Xnodes%
echo EXP: %exp% / %expToNextLevel%
echo Weapon: %weaponname%
echo Weapon Mod: %weaponmod%
echo.
echo Damage: %DMG%
echo Total Damage: %statThrow%
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
if %clientSound% == nullPresident.mp3 call bin\handler\jukebox.bat && set clientSound=null.mp3
::Backup check to see if music is still playing, and to kill it
if not %clientSound% == null.mp3 set clientSound=null.mp3 && call bin\handler\jukebox.bat
cls
if %currentHP% LEQ 0 set currentHP=1 
if %loc% == Home goto Home_Menu
if %loc% == Outside goto Outside_Menu
if %loc% == Flatlands goto Flatlands_Menu
if %loc% == Forest goto Forrest_Menu
if %loc% == JunkYard goto JunkYard_Menu
if %loc% == TrainYard goto Trainyard_Menu
if %loc% == DeepForest goto DeepForest_Menu
if %loc% == President goto President_Menu
if %loc% == Shop goto Shop_Menu
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
echo 2) Take EP Potion (%eppot%'s left) (Restores EP)
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

:Forrest_Menu
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
goto Forrest_Menu

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
(echo %weaponarray%) >> bin/sav/%lbnam%.set
(echo %weaponname%) >> bin/sav/%lbnam%.set
(echo %weapondmg%) >> bin/sav/%lbnam%.set
(echo %weaponmod%) >> bin/sav/%lbnam%.set 
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
if %level% GEQ 85 echo 9. President's Office
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
if "%enemy%" == "BlotBlot" set clientSound=ExaDevLowFid.mp3 && call bin\handler\jukebox.bat
goto Battle

:Flatlands_EnemyFind
call bin/battle/b_var/flatlands.bat
goto Battle

:Forest_EnemyFind
call bin/battle/b_var/forest.bat
goto Battle

:Junkyard_EnemyFind
call bin/battle/b_var/junkyard.bat
if "%enemy%" == "Government Patrol Assembly" set clientSound=ExaDevBeats.mp3 && call bin\handler\jukebox.bat
goto Battle

:Trainyard_EnemyFind
call bin/battle/b_var/trainyard.bat
if "%enemy%" == "Military Government Patrol Assembly" set clientSound=ExaDevByte0.mp3 && call bin\handler\jukebox.bat
goto Battle

:DeepForest_EnemyFind
call bin/battle/b_var/deepforest.bat
if "%enemy%" == "Wendigo" set clientSound=ExaDevLowFid4.mp3 && call bin\handler\jukebox.bat
goto Battle

:President_EnemyFind
call bin/battle/b_var/president.bat
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
if "%enemy%" == "Deprecated President" set clientSound=null.mp3 && call bin\handler\jukebox.bat && echo Huh... didn't that one look like the last president? && pause && goto A_Menu
if "%enemy%" == "Mr. President" set clientSound=null.mp3 && call bin\handler\jukebox.bat
if "%enemy%" == "Mr. President" echo The President's clone was defeated... the real fight is yet to begin. && pause && goto A_Menu
if "%enemy%" == "The President" echo You did it. && ping localhost -n 5 >nul && echo You defeated The President. && ping localhost -n 5 >nul && echo Enjoy the rewards you reap. && ping localhost -n 3 >nul && pause && goto A_Menu
if not %clientSound% == null.mp3 set clientSound=null.mp3 && call bin\handler\jukebox.bat
:: Gotta make sure any music from special mobs is killed here.
set /a CDMRand=%RANDOM% * 22 / 32768 + 1
if %nulbool% == 1 echo Made it, random CDM is %CDMRand%
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
if %CDMRand% == 22 if %loc% == Outside echo Huh, I think I saw that one on a missing poster. && pause && goto A_Menu
if %CDMRand% == 22 if %loc% == Flatlands echo Having fun killing the local wildlife? && pause && goto A_Menu
if %CDMRand% == 22 if %loc% == Forest if "%enemy%" == "Moose" echo Y'know... you could've just run away from that GODDAMN MOOSE && pause && goto A_Menu
if %CDMRand% == 22 if %loc% == Forest if "%enemy%" == "Bear" echo We're pretty sure that bear was on drugs. && pause && echo That was a speedy bear && pause && goto A_Menu
if %CDMRand% == 22 if %loc% == Forest if "%enemy%" == "Beaver" echo Ahh, a fine collection for the "BEAVER" dam. && pause && goto A_Menu
if %CDMRand% == 22 if %loc% == Forest if "%enemy%" == "Small Beaver" echo These ones fill in the gaps for the "BEAVER" dam && pause && goto A_Menu
if %CDMRand% == 22 if %loc% == Forest if "%enemy%" == "Woodpecker" echo How'd you even HIT a Woodpecker? && pause && echo How'd you piss it off?? && pause && goto A_Menu
if %CDMRand% == 22 if %loc% == Forest if "%enemy%" == "Hare" echo That was a funny looking rabbit. && echo It was a hairy hare too. && echo Does that make you... && pause && echo Scared? && pause && goto A_Menu
echo err. CDM didn't process correctly!
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
if %critDMG% GTR 450 echo You summon an orbital death laser. BVVVVVTTT!!!
if %critDMG% GTR 1000 echo That was orbital death laser jr, this is Orbital Death Laser Sr.
if %critDMG% GTR 5000 echo God forbid something survives after this crit. 
if %critDMG% GTR 30000 echo Toast. %enemy% is toast.
if %critDMG% GTR 100000 echo You are now outputting enough power to destroy the planet.
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
if %flee% LSS 5 (
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
echo You ran away, but were injured in the process...
echo You took 10 damage.
pause
if not %clientSound% == null.mp3 set clientSound=null.mp3 && call bin\handler\jukebox.bat
:: Kills sound even if clientsound is set to presidentnull.mp3
goto A_Menu
)
if %flee% GTR 5 (
echo You ran away successfully.
pause
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
if %nulbool% == 2  call bin/battle/getFire.bat
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
if %shopMenu% == back goto Map
goto A_Menu


:Checkforupdates
::                                                                        i < line limit 

cls
echo I can actually provide updates remotely via old means if I can
echo remember where I left all the code lol
echo.
echo In the meantime should I ever make this happen again, I'd just rely
echo on GameJolt to update everything. 
pause 
goto start
::                                      I MIDDLE


:outdated
set specialmsg=0
cls
if %versionnum% == 1.7.2 set weaponseven=0 && set weaponarray=0 && set weaponname=Fists && set weapondmg=0 && set weaponmod=Nothing
if %versionnum% == 1.7.1 set weaponseven=0 && set weaponarray=0 && set weaponname=Fists && set weapondmg=0 && set weaponmod=Nothing
if %versionnum% == 1.7.0 set weaponseven=0 && set weaponarray=0 && set weaponname=Fists && set weapondmg=0 && set weaponmod=Nothing
if %versionnum% == 1.6.0 set weaponsix=0 && set weaponseven=0 && set weaponarray=0 && set weaponname=Fists && set weapondmg=0 && set weaponmod=Nothing
if %versionnum% == 1.5.0 set weaponsix=0 && set weaponseven=0 && set weaponarray=0 && set weaponname=Fists && set weapondmg=0 && set weaponmod=Nothing
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
if %specialmsg% == 5 echo (1.8.x+)Everything should be A-OK! Upgrade as you please
if %specialmsg% == 0 echo (?.?.?)BioFuse couldn't identify what version this save is. Is it from 0.2.7? This fixer WILL erase everything and start the file anew.
pause 
if %specialmsg% == 0 set resetSwitch=1 && echo (Unknown save fallback, reseting variables.) && call :redef && ping localhost -n 2 >nul && echo Redef verified... saving... && set resetSwitch=0 && ping localhost -n 2 >nul
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
