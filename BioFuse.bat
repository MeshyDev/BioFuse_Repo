@echo off

set version=1.4.0
set vmsg=Biofuse Engine Release
set vmsg2=It's a big day. 


:: As of 5/18/20, I have decided to not consider BioFuse
:: as inherently a "game". I am moving forward with the decision
:: that 1.4.0 will be classified as the engine update. 

:: DEFINE VARIABLES 

set resetSwitch=0 

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
set blockcnce=5
set critcnce=5
set critMult=2
set evadecnce=5
set willpower=10
set eppower=12
set adventure=0
set versionnum=%version%
set weaponzero=1
set weaponone=0
set weapontwo=0
set weaponthree=0
set weaponfour=0
set weaponarray=0
set weaponname=Fists
set weapondmg=0
set weaponmod=Nothing

if %resetSwitch% == 1 exit /b

set nulbool=0
SETLOCAL ENABLEEXTENTIONS
mode con: cols=70 lines=40 

set EmaxHP=10

set /a expGained=%RANDOM% * %EmaxHP% / 32768 + 1
set /a nodesGained=%RANDOM% * %EmaxHP%  / 32768 + 1

if not exist bin md bin
if not exist bin\sav md bin\sav

cls
title BioFuse %version%
echo. 
echo.

set TAB=	
echo                   A game developed by Exabyte/ExaDev
echo.
echo.
ping localhost -n 5 >nul
:start
title BioFuse %version% 
color 0F
cls 
type MENUMOD.MOD
echo.
echo Welcome to BioFuse %version%. 
echo -%vmsg%-
echo -%vmsg2%-
if %nulbool% == 1 echo %expGained% %nodesGained%
if %nulbool% == 1 title BioFuse %version% DEBUG
echo.
echo.
set /p MainMenuInput=::
if %MainMenuInput% == 1 set resetSwitch=1 && goto createGame
if %MainMenuInput% == 2 goto loadGame
if %MainMenuInput% == 3 goto infoBlock
if %MainMenuInput% == 4 goto Checkforupdates
if %MainMenuInput% == 5 exit
echo Sorry, but I don't understand that. Could you try that again please?
pause
cls
goto start


:infoBlock
cls
::                                  I MIDDLE
echo                           Information
echo                  Main Dev:          Exabyte/ExaDev
echo              Title Screen:          RAPIX Interactive
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
set /p willpower=
set /p eppower=
set /p adventure=
set /p versionnum=
set /p weaponzero=
set /p weaponone=
set /p weapontwo=
set /p weaponthree=
set /p weaponfour=
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
echo You essentially - no offence - don't exist.
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
echo 4:WILLPOWER%tab% %willpower%
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
set /a willpower=%willpower%+1
)
cls
echo You have 4 stat points to divide up throughout your stats. 
echo Choose a stat to add a point to^! 
echo.
echo 1:DAMAGE  %tab% %dmg%
echo 2:HEALTH  %tab% %maxHP%
echo 3:MAGIC   %tab% %maxEP%
echo 4:WILLPOWER%tab% %willpower%
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
set /a willpower=%willpower%+1
)
cls
echo You have 3 stat points to divide up throughout your stats. 
echo Choose a stat to add a point to^! 
echo.
echo 1:DAMAGE  %tab% %dmg%
echo 2:HEALTH  %tab% %maxHP%
echo 3:MAGIC   %tab% %maxEP%
echo 4:WILLPOWER%tab% %willpower%
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
set /a willpower=%willpower%+1
)
cls
echo You have 2 stat points to divide up throughout your stats. 
echo Choose a stat to add a point to^! 
echo.
echo 1:DAMAGE  %tab% %dmg%
echo 2:HEALTH  %tab% %maxHP%
echo 3:MAGIC   %tab% %maxEP%
echo 4:WILLPOWER%tab% %willpower%
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
set /a willpower=%willpower%+1
)
cls
echo You have 1 stat points to divide up throughout your stats. 
echo Choose a stat to add a point to^! 
echo.
echo 1:DAMAGE  %tab% %dmg%
echo 2:HEALTH  %tab% %maxHP%
echo 3:MAGIC   %tab% %maxEP%
echo 4:WILLPOWER%tab% %willpower%
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
set /a willpower=%willpower%+1
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
(echo %willpower%) >> bin/sav/%lbnam%.set
(echo %eppower%) >> bin/sav/%lbnam%.set
(echo %adventure%) >> bin/sav/%lbnam%.set
(echo %versionnum%) >> bin/sav/%lbnam%.set
(echo %weaponzero%) >> bin/sav/%lbnam%.set
(echo %weaponone%) >> bin/sav/%lbnam%.set
(echo %weapontwo%) >> bin/sav/%lbnam%.set
(echo %weaponthree%) >> bin/sav/%lbnam%.set
(echo %weaponfour%) >> bin/sav/%lbnam%.set
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
echo 2:Options
echo 3:Character Stats

if %level% GEQ 5 echo 4:Start Adventure
set /p input=Choice?::
if %input%==1 goto A_Menu
if %input%==2 goto G_Menu
if %input%==3 goto C_Menu
if %input%==4 goto Start_adv
echo Sorry, I don't understand that. Could you try again?
pause
cls
goto MainScreen
:C_Menu
cls
echo Status: %healthStatus%
echo HP: %currentHP% / %maxHP%
echo EP: %currentEP% / %maxEP%
echo Nodes: %nodes%  XNodes: %Xnodes%
echo EXP: %exp% / %expToNextLevel%
echo.
echo Damage: %DMG%
echo Defense: %defense%
echo Block Chance: %blockcnce%
echo Crit Chance: %critcnce%
echo Crit Multiplier: %critMult%
echo Evade Chance: %evadecnce%
echo Willpower: %willpower% (can anyone tell me what this does??)
echo EP Power: %eppower%
echo.
pause
cls
goto MainScreen

:G_Menu
cls
echo As of 1.3.0 this page pretty much is only for saving. 
echo 1: Save
echo 2: Options (Disabled)
echo 3: Back
set /p input=Choose an option::
if %input%==1 goto q_SAV
if %input%==2 goto options
if %input%==3 goto MainScreen
echo I'm sorry, I didn't understand that. Could you try that again please?
pause
goto G_Menu

:A_Menu 
cls
if %loc% == Home goto Home_Menu
if %loc% == Outside goto Outside_Menu
if %loc% == Flatlands goto Flatlands_Menu
if %loc% == Forest goto Forest_Menu
if %loc% == JunkYard goto JunkYard_Menu
if %loc% == Shop goto Shop_Menu
echo Interesting, you seem to have gotten yourself trapped
echo between dimentions^! An error may have occured in your
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
call bin/item/checkArray.bat 
echo %lbnam%'s Equipment Room
call bin/item/equipMsg.bat
echo.
echo You can currently equip the following: 
if %weaponzero% == 1 echo (Fists) Nothing, just your fists. 
if %weaponone% == 1 echo (Dagger) A fine steel dagger. +3 DMG
if %weapontwo% == 1 echo (Sword) A large steel sword. +5 DMG
if %weaponthree% == 1 echo (Flaming Sword) A sword made of flames. +8 DMG
if %weaponfour% == 1 echo (Rocket Launcher) Who let you buy this? +15 DMG
if %weaponzero% == 1 echo (Back) Go back to the last menu
echo.
echo (Please note, syntax is important otherwise you may risk a crash)
set /p equipRm=Please type in the item name you wish to equip:: 
echo.
if "%equipRm%" == "Fists" set weaponarray=0 && echo You screw in your hands. && pause && goto H_Equip
if "%equipRm%" == "Dagger" set weaponarray=1 && call bin/item/checkArray.bat && goto H_Equip
if "%equipRm%" == "Sword" set weaponarray=2 && call bin/item/checkArray.bat && goto H_Equip
if "%equipRm%" == "Flaming Sword" set weaponarray=3 && call bin/item/checkArray.bat && goto H_Equip
if "%equipRm%" == "Rocket Launcher" set weaponarray=4 && call bin/item/checkArray.bat && goto H_Equip
if "%equipRm%" == "Back" goto Home_Menu 
if "%equipRm%" == "back" goto Home_Menu
goto H_Equip 

:Outside_Menu
if %exp% GEQ %expToNextLevel% goto levelUp
cls
echo HP: %currentHP% / %maxHP%
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
echo EP: %currentEP% / %maxEP%
echo Status: %healthStatus%
echo Location: %loc%
echo.
echo 1: Search for Mob
echo 2: Change Location
echo 4: Back
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
echo EP: %currentEP% / %maxEP%
echo Status: %healthStatus%
echo Location: %loc%
echo.
echo 1: Search for Mob
echo 2: Change Location
echo 3: Back
set /p O_Inp=::
if %O_Inp% == 1 goto Ene_HUB_Fr
if %O_Inp% == 3 goto Map
if %O_Inp% == 3 goto MainScreen
echo I don't understand that. Could you try again?
pause
cls
goto Forest_Menu

:JunkYard_Menu
if %exp% GEQ %expToNextLevel% goto levelUp
cls
echo HP: %currentHP% / %maxHP%
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

:options
cls
echo Currently disabled. My apologies. 
pause 
goto G_Menu


:q_SAV
cls
if not exist bin/sav echo FATAL ERROR 4, system cannot save. && echo This means your SAV folder has gone missing^! && ping localhost -n 3 >nul && echo Deploying auto-fix. && if not exist bin\sav md bin\sav
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
(echo %willpower%) >> bin/sav/%lbnam%.set
(echo %eppower%) >> bin/sav/%lbnam%.set
(echo %adventure%) >> bin/sav/%lbnam%.set
(echo %versionnum%) >> bin/sav/%lbnam%.set
(echo %weaponzero%) >> bin/sav/%lbnam%.set
(echo %weaponone%) >> bin/sav/%lbnam%.set
(echo %weapontwo%) >> bin/sav/%lbnam%.set
(echo %weaponthree%) >> bin/sav/%lbnam%.set
(echo %weaponfour%) >> bin/sav/%lbnam%.set
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
echo 5. Junkyard
echo 6. Shop
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
set loc=JunkYard
goto A_Menu
)
if %M_Inp% == 6 (
set loc=Shop
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
if %RANval% LEQ 15 cls && echo You didn't find an enemy... && pause && goto A_Menu

:Outside_NoBattle
cls
echo You didn't find an enemy...
pause
cls
goto A_Menu

:Flatlands_NoBattle
cls
echo You didn't find an enemy...
pause
cls
goto A_Menu

:Forest_NoBattle
cls
echo You didn't find an enemy...
pause
cls
goto A_Menu

:Junkyard_NoBattle
cls
echo Despite the clanging of nearby junkbots,
echo you didn't find an enemy...
pause
cls
goto A_Menu

:Outside_EnemyFind
call bin/battle/b_var/outside.bat
goto Battle

:Flatlands_EnemyFind
call bin/battle/b_var/flatlands.bat
goto Battle

:Forest_EnemyFind
call bin/battle/b_var/forest.bat
goto Battle

:Junkyard_EnemyFind
call bin/battle/b_var/junkyard.bat
goto Battle


:Battle
if %currentHP% LSS 1 (
color 4F
echo Ouch, %lbnam%, it looks like that %enemy% bested you. Luckily for you,
echo I can allow you to load from another save. You can even load your
echo previous save if you like. I'm going to return you to the load screen now...
pause
cls
color 0F
set resetSwitch=1
goto loadGame
)
if %EcurrentHP% LSS 1 call bin/battle/checkVar.bat && goto A_Menu
if %currentHP% GTR %maxHP% (
set currentHP=%maxHP%
)
echo %lbnam%
echo HP: %currentHP% / %maxHP%
echo EP: %currentEP% / %maxEP%
echo Status: %healthStatus%
echo.
echo %enemy%
echo HP: %EcurrentHP% / %EmaxHP%
echo EP: %EcurrentEP% / %EmaxEP%
echo Status: %EhealthStatus%
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
if %input%==debugmode set nulbool=1 && title BioFuse %version% DEBUG && cls && goto Battle
if %input%==nobugmode set nulbool=0 && title BioFuse %version% && cls && goto Battle
echo I'm sorry, I didn't get that. Could you repeat that please?
pause
cls
goto Battle

:Battle_Attack


call bin/battle/healthCheck.bat

call bin/battle/EhealthCheck.bat

call bin/battle/healthRandom.bat

call bin/battle/getCrit.bat
if %critSwitch% == 1 goto critsuccess

call bin/battle/getATK.bat

call bin/battle/getBlock.bat

if %resetSwitch% == 0 call bin/battle/getEATK.bat

pause
cls
set resetSwitch=0 
set nulbool=0
goto Battle

:resetSwitch
if %resetSwitch% == 0 call bin/battle/getEATK.bat
exit /b

:critsuccess
call bin/battle/getCritDMG.bat
echo You scored a Critial Hit^! 
echo You did %critDMG% damage to %enemy%^!
echo. 
call bin/battle/getBlock.bat
call bin/battle/getEATK.bat
pause
cls
goto Battle

:FleeBattle
set /a flee=%RANDOM% * 9 / 32768 + 1
if %flee% LSS 5 (
echo You failed to run away...
set /a Eattack=%RANDOM% * %Edmg% / 32768 + 1
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
pause
goto A_Menu
)
if %flee% GTR 5 (
echo You ran away successfully.
pause
cls
goto A_Menu
)

:EPATK
cls 
echo EP: %currentEP% / %MaxEP% 
echo %enemy% HP: %EcurrentHP%/%EmaxHP% 
echo. 
echo 1) Flame Attack^! 
echo Does between 0-10 damage every round until the end. 
echo Costs: 35 EP
echo.
echo 2) Life Drain^! 
echo Drains between 0-30 HP and adds it to your own. 
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


echo 1:HP Potions: %hppot%
echo 2:EP Potions: %eppot%
echo 3:Back
set /p input=Choose one::
if %input%==1 goto hppot
if %input%==2 goto eppot
if %input%==3 goto Battle


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
set /a trashVar=%currentHP% + 25
if %trashVar% GTR %maxHP% set currentHP=%maxHP% 
set currentHP=%trashVar% 
echo You feel refreshed. (Restored some HP)
pause
call bin/battle/getBlock.bat
if %resetSwitch% == 0 call bin/battle/getEATK.bat 
set /a hppot=%hppot%-1
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
set /a currentEP=%currentEP% + 30
echo You feel rejuvenated^! (EP Restored)
pause 
call bin/battle/getBlock.bat
if %resetSwitch% == 0 call bin/battle/getEATK.bat 
set /a eppot=%eppot%-1
pause
cls
goto Battle


:LevelUp
cls
set /a level=%level%+1
set exp=0
set /a expToNextLevel=%expToNextLevel%+100
set /a currentHP=%maxHP%
set /a currentEP=%maxEP%
echo Congratulations, %lbnam%, you've reached Level %level%^!
pause
cls
echo You have 5 stat points to divide up throughout your stats. 
echo Choose a stat to add a point to^! 
echo.
echo 1:DAMAGE  %tab% %dmg%
echo 2:HEALTH  %tab% %maxHP%
echo 3:MAGIC   %tab% %maxEP%
echo 4:WILLPOWER%tab% %willpower%
echo 5:BLOCK   %tab% %blockcnce%
echo 6:CRITS   %tab% %critcnce% 
echo 7:CRIT MULT%tab% %critMult%
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
set /a willpower=%willpower%+1
)
if /i %input%==5 (
set /a blockcnce=%blockcnce%+1
)
if /i %input%==6 (
set /a critcnce=%critcnce%+1
)
if /i %input%==7 (
set /a critMult=%critMult%+1
)
cls
echo You have 4 stat points to divide up throughout your stats. 
echo Choose a stat to add a point to^! 
echo.
echo 1:DAMAGE  %tab% %dmg%
echo 2:HEALTH  %tab% %maxHP%
echo 3:MAGIC   %tab% %maxEP%
echo 4:WILLPOWER%tab% %willpower%
echo 5:BLOCK   %tab% %blockcnce%
echo 6:CRITS   %tab% %critcnce% 
echo 7:CRIT MULT%tab% %critMult%
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
set /a willpower=%willpower%+1
)
if /i %input%==5 (
set /a blockcnce=%blockcnce%+1
)
if /i %input%==6 (
set /a critcnce=%critcnce%+1
)
if /i %input%==7 (
set /a critMult=%critMult%+1
)
cls
echo You have 3 stat points to divide up throughout your stats. 
echo Choose a stat to add a point to^! 
echo.
echo 1:DAMAGE  %tab% %dmg%
echo 2:HEALTH  %tab% %maxHP%
echo 3:MAGIC   %tab% %maxEP%
echo 4:WILLPOWER%tab% %willpower%
echo 5:BLOCK   %tab% %blockcnce%
echo 6:CRITS   %tab% %critcnce% 
echo 7:CRIT MULT%tab% %critMult%
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
set /a willpower=%willpower%+1
)
if /i %input%==5 (
set /a blockcnce=%blockcnce%+1
)
if /i %input%==6 (
set /a critcnce=%critcnce%+1
)
if /i %input%==7 (
set /a critMult=%critMult%+1
)
cls
echo You have 2 stat points to divide up throughout your stats. 
echo Choose a stat to add a point to^! 
echo.
echo 1:DAMAGE  %tab% %dmg%
echo 2:HEALTH  %tab% %maxHP%
echo 3:MAGIC   %tab% %maxEP%
echo 4:WILLPOWER%tab% %willpower%
echo 5:BLOCK   %tab% %blockcnce%
echo 6:CRITS   %tab% %critcnce% 
echo 7:CRIT MULT%tab% %critMult%
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
set /a willpower=%willpower%+1
)
if /i %input%==5 (
set /a blockcnce=%blockcnce%+1
)
if /i %input%==6 (
set /a critcnce=%critcnce%+1
)
if /i %input%==7 (
set /a critMult=%critMult%+1
)
cls
echo You have 1 stat points to divide up throughout your stats. 
echo Choose a stat to add a point to^! 
echo.
echo 1:DAMAGE  %tab% %dmg%
echo 2:HEALTH  %tab% %maxHP%
echo 3:MAGIC   %tab% %maxEP%
echo 4:WILLPOWER%tab% %willpower%
echo 5:BLOCK   %tab% %blockcnce%
echo 6:CRITS   %tab% %critcnce% 
echo 7:CRIT MULT%tab% %critMult%
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
set /a willpower=%willpower%+1
)
if /i %input%==5 (
set /a blockcnce=%blockcnce%+1
)
if /i %input%==6 (
set /a critcnce=%critcnce%+1
)
if /i %input%==7 (
set /a critMult=%critMult%+1
)
goto q_SAV 

:Shop_Menu
cls
echo Welcome to the shop^! Here you can buy all of your weapon needs.
echo %lbnam% has %Nodes% nodes available.
echo You have %eppot% EP potions and %hppot% potions.
echo.
echo What can we get for you?
echo 1) Dagger (+3 DMG, 150 Nodes)
echo 2) Sword (+5 DMG, 550 Nodes)
echo 3) Flame Sword (+8 DMG, 1500 Nodes)
echo 4) Rocket Launcher (+15 DMG, 5000 Nodes)
echo 5) +1 EP Potion (200 Nodes) 
echo 6) +1 HP Potion (150 Nodes)
echo back) Back to map
echo.
set /p shopMenu=:: 
if %shopMenu% == 1 set resetSwitch=1 && call bin/item/shopKeep.bat && goto Shop_Menu
if %shopMenu% == 2 set resetSwitch=2 && call bin/item/shopKeep.bat && goto Shop_Menu
if %shopMenu% == 3 set resetSwitch=3 && call bin/item/shopKeep.bat && goto Shop_Menu
if %shopMenu% == 4 set resetSwitch=4 && call bin/item/shopKeep.bat && goto Shop_Menu
if %shopMenu% == 5 set resetSwitch=5 && call bin/item/shopKeep.bat && goto Shop_Menu
if %shopMenu% == 6 set resetSwitch=6 && call bin/item/shopKeep.bat && goto Shop_Menu
if %shopMenu% == back goto Map
goto A_Menu


:Checkforupdates
::                                                                        i < line limit 

cls
echo Unfortunately due to the fact that life has gotten in the way, the 
echo site I used to provide updates is now not mine. Strangely enough it 
echo was bought by this japanese company. I guess they wanted my domain 
echo that badly. Regardless, just navigate to GameJolt, or if you have 
echo      the client it should automatically update itself^! 
pause 
goto start
::                                      I MIDDLE


:outdated
cls
set versionnum=%version%
echo Oh no^! Your save file is out of date^! We'll take the liberty of 
echo updating your files for you. Don't want to have a bad save, right? 
pause 
goto q_SAV
:MainScreen_Check
if %adventure%==0 goto MainScreen
if %adventure%==1 goto MainScreen_Adventure


:Start_Adv
if %level% LSS 5000 (
cls
echo BioFuse Adventure is not available in this version. I'm sorry. 
pause
goto MainScreen
)
goto MainScreen
