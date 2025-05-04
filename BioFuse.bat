set version=0.2.0.4.3
set vmsg=Official release, standard channel
set vmsg2=New channels n' stuff
set vmsg3=Quick-Release before I get to work.
set nulbool=1
SETLOCAL ENABLEEXTENTIONS
mode con: lines=78

if not exist bin md bin
if not exist bin\sav md bin\sav


@echo off
cls
title BioFuse %version%
echo. 
echo.
::                                      I MIDDLE
set TAB=	
echo                          A game developed by Jaeob Games
echo.
echo.
ping localhost -n 5 >nul
:start
title BioFuse %version% 
color 0F
cls 
type MENUMOD.MOD
echo Welcome to BioFuse %version%. 
echo -%vmsg%-
echo -%vmsg2%-
echo.
echo.
set /p MainMenuInput=::
if %MainMenuInput% == 1 goto createGame
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
echo -----CREDITS-----
echo [ScorpianCode/McPhologer] - Lead Developer
echo LufiaGuy2000 - Backup Developer
echo Rapix - LTG - Creator of the main menu screen.
echo.
echo Were also putting a ton of time into this.
echo Its tiring as well as time consuming just
echo to do all this for you. Anyway, enjoy BioFuse %version%
echo %vmsg%
echo %vmsg2%
pause
goto start

:loadGame
cls
echo Please enter in your character's name. 
set /p lbnam=What's your name?::
if not exist bin/sav/%lbnam%.set (
echo Sorry, %lbnam%, we don't know you!
echo You essentially don't exist - no offence.
echo But, if you do want to exist, go to the 'new game' area!
pause
cls
goto start
)

(
set /p lbnam=
set /p wep=
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
set /p strength=
set /p strengthatk=
set /p defense=
set /p blockcnce=
set /p agility=
set /p agilityatk=
set /p hitcnce=
set /p critcnce=
set /p evadecnce=
set /p parrycnce=
set /p vitality=
set /p willpower=
set /p eppower=
set /p adventure=
set /p versionnum=
set /p leathera=
set /p leatherabuy=
set /p scrapa=
set /p scrapabuy=
set /p lowquala=
set /p lowqualabuy=
set /p ironarmor=
set /p ironarmorbuy=
set /p holoarmor=
set /p holoarmorbuy=
set /p fists=
set /p fistsbuy=
set /p ironsword=
set /p ironswordbuy=
set /p irondag=
set /p irondagbuy=
set /p spikedmace=
set /p spikedmacebuy=
set /p lowvoltblast=
set /p lowvoltblastbuy=
set /p mediumvoltage=
set /p mediumvoltagebuy=
)<bin/sav/%lbnam%.set
if not %versionnum% == %version% goto sav_OutDated
echo Welcome back, %lbnam%! Please wait while we load your data...
ping localhost -n 2 >nul
echo Load was successful.
pause
::if %adventure%==0 goto MainScreen
::if %adventure%==1 goto MainScreen_Adventure
goto MainScreen

:loadGame.notfound
echo Sorry there, %lbnam%. We don't know you!
echo You essentially - no offence - don't exist.
echo But if you do want to exist, go to 'new game' next time.
pause
cls
goto start


:createGame
cls
echo Welcome to BioFuse. 
echo Your adventure will start soon!
echo There's just one simple thing though...
echo.
set /p lbnam=What is your name?::
if /i exist bin/sav/%lbnam%.set goto loadFound
if /i not exist bin/sav/%lbnam%.set goto gameCreation

:loadFound
echo.
echo Hey again %lbnam%, nice seeing you. But maybe you should 
echo continue on into the 'load game' section. That is, you've been there
echo and still didn't 'exist'. Oh well, try again!
pause
goto start

:gameCreation
set wepnam=Fists
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
set strength=10
set strengthatk=12
set defense=12
set blockcnce=5
set agility=10
set agilityatk=12
set hitcnce=80
set critcnce=5
set evadecnce=5
set parrycnce=5
set vitality=10
set willpower=10
set eppower=12
set adventure=0
set versionnum=%version%
:: Armor
set leathera=false
set leatherabuy=false
set scrapa=false
set scrapabuy=false
set lowquala=false
set lowqualabuy=false
set ironarmor=false
set ironarmorbuy=false
set holoarmor=false
set holoarmorbuy=false
:: Weapon
set fists=true
set fistsbuy=true
::For stability
::The shortened version of the weapon is the equip. 
set ironsword=false
set ironswordbuy=false
set makedo=false
set makedobuy=false
set irondag=false
set irondagbuy=false
set spikedmace=false
set spikedmacebuy=false
set lowvoltblast=false
set lowvoltblastbuy=false
set mediumvoltage=false
set mediumvoltagebuy=false
cls
echo You have 5 stat points to divide up throughout your stats. Choose a stat to
echo add a point to.
echo.
echo 1:STRENGTH%tab% %strength%
echo 2:AGILITY %tab% %agility%
echo 3:VITALITY%tab% %vitality%
echo 4:WILLPOWER%tab% %willpower%
set /p input=Select a stat to increase by one point:: 
if /i %input%==1 (
set /a strength=%strength%+1
)
if /i %input%==2 (
set /a agility=%agility%+1
)
if /i %input%==3 (
set /a vitality=%vitality%+1
)
if /i %input%==4 (
set /a willpower=%willpower%+1
)
cls
echo You have 4 stat points to divide up throughout your stats. Choose a stat to
echo add a point to.
echo.
echo 1:STRENGTH%tab% %strength%
echo 2:AGILITY %tab% %agility%
echo 3:VITALITY%tab% %vitality%
echo 4:WILLPOWER%tab% %willpower%
set /p input=Select a stat to increase by one point:: 
if /i %input%==1 (
set /a strength=%strength%+1
)
if /i %input%==2 (
set /a agility=%agility%+1
)
if /i %input%==3 (
set /a vitality=%vitality%+1
)
if /i %input%==4 (
set /a willpower=%willpower%+1
)
cls
echo You have 3 stat points to divide up throughout your stats. Choose a stat to
echo add a point to.
echo.
echo 1:STRENGTH%tab% %strength%
echo 2:AGILITY %tab% %agility%
echo 3:VITALITY%tab% %vitality%
echo 4:WILLPOWER%tab% %willpower%
set /p input=Select a stat to increase by one point:: 
if /i %input%==1 (
set /a strength=%strength%+1
)
if /i %input%==2 (
set /a agility=%agility%+1
)
if /i %input%==3 (
set /a vitality=%vitality%+1
)
if /i %input%==4 (
set /a willpower=%willpower%+1
)
cls
echo You have 2 stat points to divide up throughout your stats. Choose a stat to
echo add a point to.
echo.
echo 1:STRENGTH%tab% %strength%
echo 2:AGILITY %tab% %agility%
echo 3:VITALITY%tab% %vitality%
echo 4:WILLPOWER%tab% %willpower%
set /p input=Select a stat to increase by one point:: 
if /i %input%==1 (
set /a strength=%strength%+1
)
if /i %input%==2 (
set /a agility=%agility%+1
)
if /i %input%==3 (
set /a vitality=%vitality%+1
)
if /i %input%==4 (
set /a willpower=%willpower%+1
)
cls
echo You have 1 stat point to divide up throughout your stats. Choose a stat to
echo add a point to.
echo.
echo 1:STRENGTH%tab% %strength%
echo 2:AGILITY %tab% %agility%
echo 3:VITALITY%tab% %vitality%
echo 4:WILLPOWER%tab% %willpower%
set /p input=Select a stat to increase by one point:: 
if /i %input%==1 (
set /a strength=%strength%+1
)
if /i %input%==2 (
set /a agility=%agility%+1
)
if /i %input%==3 (
set /a vitality=%vitality%+1
)
if /i %input%==4 (
set /a willpower=%willpower%+1
)
echo Give us a second, %lbnam%, we are going to set up your game for you...


if exist bin\sav (
(echo %lbnam%) > bin/sav/%lbnam%.set
(echo %wep%) >> bin/sav/%lbnam%.set
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
(echo %strength%) >> bin/sav/%lbnam%.set
(echo %strengthatk%) >> bin/sav/%lbnam%.set
(echo %defense%) >> bin/sav/%lbnam%.set
(echo %blockcnce%) >> bin/sav/%lbnam%.set
(echo %agility%) >> bin/sav/%lbnam%.set
(echo %agilityatk%) >> bin/sav/%lbnam%.set
(echo %hitcnce%) >> bin/sav/%lbnam%.set
(echo %critcnce%) >> bin/sav/%lbnam%.set
(echo %evadecnce%) >> bin/sav/%lbnam%.set
(echo %parrycnce%) >> bin/sav/%lbnam%.set
(echo %vitality%) >> bin/sav/%lbnam%.set
(echo %willpower%) >> bin/sav/%lbnam%.set
(echo %eppower%) >> bin/sav/%lbnam%.set
(echo %adventure%) >> bin/sav/%lbnam%.set
(echo %versionnum%) >> bin/sav/%lbnam%.set
(echo %leathera%) >> bin/sav/%lbnam%.set
(echo %leatherabuy%) >> bin/sav/%lbnam%.set
(echo %scrapa%) >> bin/sav/%lbnam%.set
(echo %scrapabuy%) >> bin/sav/%lbnam%.set
(echo %lowquala%) >> bin/sav/%lbnam%.set
(echo %lowqualabuy%) >> bin/sav/%lbnam%.set
(echo %ironarmor%) >> bin/sav/%lbnam%.set
(echo %ironarmorbuy%) >> bin/sav/%lbnam%.set
(echo %holoarmor%) >> bin/sav/%lbnam%.set
(echo %fists%) >> bin/sav/%lbnam%.set
(echo %fistsbuy%) >> bin/sav/%lbnam%.set
(echo %ironsword%) >> bin/sav/%lbnam%.set
(echo %ironswordbuy%) >> bin/sav/%lbnam%.set
(echo %makedo%) >> bin/sav/%lbnam%.set
(echo %makedobuy%) >> bin/sav/%lbnam%.set
(echo %irondag%) >> bin/sav/%lbnam%.set
(echo %irondagbuy%) >> bin/sav/%lbnam%.set
(echo %spikedmace%) >> bin/sav/%lbnam%.set
(echo %spikedmacebuy%) >> bin/sav/%lbnam%.set
(echo %lowvoltblast%) >> bin/sav/%lbnam%.set
(echo %lowvoltblastbuy%) >> bin/sav/%lbnam%.set
(echo %mediumvoltage%) >> bin/sav/%lbnam%.set
(echo %mediumvoltagebuy%) >> bin/sav/%lbnam%.set
ping localhost -n 2 >nul 
echo Game successfully made and saved.
)


:MainScreen
cls
set /a strengthatk=5+(strength/2)+(level*2)
set /a defense=5+(strength/2)+(level*2)
set /a blockcnce=5+(strength/100)
set /a agilityatk=5+(agilty/2)+(level*2)
set /a hitcnce=80+(agility/100)
set /a critcnce=5+(agility/100)
set /a evadecnce=5+(agility/100)
set /a parrycnce=5+(agility/100)
set /a maxhp=100+(level*10)+(vitality/2)
set /a maxep=100+(level*10)+(willpower/2)
set /a eppower=5+(willpower/2)+(level*2)
if %currentHP% LSS 1 ( 
echo %lbnam%, I hate to be the bearer of bad news, but you seem to be dead. It
echo looks like your save might have gotten corrupted somehow, or you manually
echo edited it so that your currentHP is 0. You might want to manually edit your
echo save file so that you are alive again. That's what you usually do, right?
pause
cls
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
echo 1:Character Menu
echo 2:Game Menu
echo 3:Actions
if %level% GEQ 5 echo 4:Start Adventure
set /p input=Choice?::
if %input%==1 goto C_Menu
if %input%==2 goto G_Menu
if %input%==3 goto A_Menu
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
echo Note: The stats are defunct, they just look cool for now. :)
echo.
echo STRENGTH%tab% %strength%
echo %tab%STR ATK%tab% %strengthatk%
echo %tab%DEFENSE%tab% %defense%
echo %tab%BLOCK %%%tab% %blockcnce%
echo AGILITY %tab% %agility%
echo %tab%AGI ATK%tab% %agilityatk%
echo %tab%CRIT %%%tab% %critcnce%
echo %tab%EVADE %%%tab% %evadecnce%
echo %tab%HIT %%%tab% %hitcnce%
echo %tab%PARRY %%%tab% %parrycnce%
echo VITALITY%tab% %vitality%
echo %tab%Max HP%tab% %maxHP%
echo WILLPOWER%tab% %willpower%
echo %tab%Max EP%tab% %maxEP%
echo %tab%EP ATK%tab% %eppower%
pause
cls
goto MainScreen

:G_Menu
cls
echo 1: Save
echo 2: Load
echo 3: Main Menu
echo 4: Options
echo 5: Back
set /p input=Choose an option::
if %input%==1 goto q_SAV
if %input%==2 goto loadGame
if %input%==3 goto start
if %input%==4 goto options
if %input%==5 goto MainScreen
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
if %loc% == Bank goto Bank_Menu
echo Interesting, you seem to have gotten yourself trapped
echo between dimentions! An error may have occured in your
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
echo 1: Take a nap (Restores HP)
echo 2: Take EP Potion (%eppot%'s left) (Restores EP)
echo 3: Change Location
echo 4: Back
echo.
set /p H_Inp=::
if %H_Inp% == 1 goto H_Nap
if %H_Inp% == 2 goto H_EPOT
if %H_Inp% == 3 goto Map
if %H_Inp% == 4 goto MainScreen
:H_Nap
if %currentHP% GEQ %maxHP% (
echo You're not tired. Actually, you feel great!
pause
goto A_Menu
)
set /a currentHP=%maxHP%
cls
echo You're taking a nap... HP Restored to Full.
ping localhost -n 2 >NUL
goto A_Menu

:H_EPOT
if %currentEP% GEQ %maxEP% (
echo You have plenty of energy points! Any more, you'll burn up!
pause
goto A_Menu
)
if %eppot% LEQ 0 (
echo You have no Energy Point Potions left!
pause
goto A_Menu
)
set /a eppot=%eppot%-1
echo That Energy Potion really pumped you up! (EP restored)
set /a currentEP=%maxEP%
pause
goto A_Menu
)
:Outside_Menu
if %exp% GEQ %expToNextLevel% goto levelUp
cls
echo HP: %currentHP% / %maxHP%
echo EP: %currentEP% / %maxEP%
echo Status: %healthStatus%
echo Location: %loc%
echo.
echo 1: Search for Mob
echo 2: Search for Loot
echo 3: Change Location
echo 4: Back
set /p O_Inp=::
if %O_Inp% == 1 goto Ene_HUB_O
if %O_Inp% == 2 goto Loot_HUB
if %O_Inp% == 3 goto Map
if %O_Inp% == 4 goto MainScreen
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
echo 2: Search for Loot
echo 3: Change Location
echo 4: Back
set /p O_Inp=::
if %O_Inp% == 1 goto Ene_HUB_Fl
if %O_Inp% == 2 goto Loot_HUB
if %O_Inp% == 3 goto Map
if %O_Inp% == 4 goto MainScreen
echo I don't understand that. Could you try again?
pause
cls
goto Flatlands_Menu

:Forest_Menu
cls
echo The Forest is covered by a dark veil. You decide to return home.
pause
cls
set loc=Home
goto A_Menu
:JunkYard_Menu
cls
echo The JunkYard is covered by a dark veil. You decide to return home.
pause
cls
set loc=Home
goto A_Menu
:options
cls
echo Current Difficulty: %opt_diff%
echo The difficulty currently does nothing ATM; It is defunct.
echo.
echo 1) Easy
echo 2) Normal
echo 3) Hard
echo 4) Back
echo.
set /p opt=Choose your difficulty::
if %opt% == 1 goto dif_1
if %opt% == 2 goto dif_2
if %opt% == 3 goto dif_3
if %opt% == 4 goto G_Menu
goto options


:dif_1
set opt_diff=Easy
goto q_SAV
:dif_2
set opt_diff=Normal
goto q_SAV
:dif_3
set opt_diff=Hard
goto q_SAV

:q_SAV
(echo %lbnam%) > bin/sav/%lbnam%.set
(echo %wep%) >> bin/sav/%lbnam%.set
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
(echo %strength%) >> bin/sav/%lbnam%.set
(echo %strengthatk%) >> bin/sav/%lbnam%.set
(echo %defense%) >> bin/sav/%lbnam%.set
(echo %blockcnce%) >> bin/sav/%lbnam%.set
(echo %agility%) >> bin/sav/%lbnam%.set
(echo %agilityatk%) >> bin/sav/%lbnam%.set
(echo %hitcnce%) >> bin/sav/%lbnam%.set
(echo %critcnce%) >> bin/sav/%lbnam%.set
(echo %evadecnce%) >> bin/sav/%lbnam%.set
(echo %parrycnce%) >> bin/sav/%lbnam%.set
(echo %vitality%) >> bin/sav/%lbnam%.set
(echo %willpower%) >> bin/sav/%lbnam%.set
(echo %eppower%) >> bin/sav/%lbnam%.set
(echo %adventure%) >> bin/sav/%lbnam%.set
(echo %versionnum%) >> bin/sav/%lbnam%.set
(echo %leathera%) >> bin/sav/%lbnam%.set
(echo %leatherabuy%) >> bin/sav/%lbnam%.set
(echo %scrapa%) >> bin/sav/%lbnam%.set
(echo %scrapabuy%) >> bin/sav/%lbnam%.set
(echo %lowquala%) >> bin/sav/%lbnam%.set
(echo %lowqualabuy%) >> bin/sav/%lbnam%.set
(echo %ironarmor%) >> bin/sav/%lbnam%.set
(echo %ironarmorbuy%) >> bin/sav/%lbnam%.set
(echo %holoarmor%) >> bin/sav/%lbnam%.set
(echo %fists%) >> bin/sav/%lbnam%.set
(echo %fistsbuy%) >> bin/sav/%lbnam%.set
(echo %ironsword%) >> bin/sav/%lbnam%.set
(echo %ironswordbuy%) >> bin/sav/%lbnam%.set
(echo %makedo%) >> bin/sav/%lbnam%.set
(echo %makedobuy%) >> bin/sav/%lbnam%.set
(echo %irondag%) >> bin/sav/%lbnam%.set
(echo %irondagbuy%) >> bin/sav/%lbnam%.set
(echo %spikedmace%) >> bin/sav/%lbnam%.set
(echo %spikedmacebuy%) >> bin/sav/%lbnam%.set
(echo %lowvoltblast%) >> bin/sav/%lbnam%.set
(echo %lowvoltblastbuy%) >> bin/sav/%lbnam%.set
(echo %mediumvoltage%) >> bin/sav/%lbnam%.set
(echo %mediumvoltagebuy%) >> bin/sav/%lbnam%.set
:: Saving armor statistics.
echo Saving your game... don't close!
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
echo 6. Bank
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
set loc=Bank
goto A_Menu
)
echo Invalid Choice. Try again.
pause
goto Map

:Ene_HUB_O
cls
SET /a RANval=%RANDOM% * 10 / 32768 + 1

if %RANval% GTR 5 goto Outside_EnemyFind
if %RANval% LSS 5 goto Outside_NoBattle
if %RANval% == 5 goto Outside_RareEnemyFind

:Ene_HUB_Fl
cls
set /a RANval=%Random% * 10 / 32768 +1

if %RANval% GTR 3 goto Flatlands_EnemyFind
if %RANval% LSS 3 goto Flatlands_NoBattle
if %RANval% == 3 goto Outside_RareEnemyFind

:: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::;

:: Battle Blocks Below

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

:Flatlands_EnemyFind
:: ==========================================IN PROGRESS==========================================
set /a enemyFind=%Random% * 5 / 32768 + 1
if %enemyFind%==1 (
    set enemy=Prarie Dog
    set EcurrentHP=20
    set EmaxHP=20
    set EcurrentEP=10
    set EmaxEP=10
    set EhealthStatus=Healthy
    set Edmg=5
)
if %enemyFind%==2 (
    set enemy=Bird
    set EcurrentHP=25
    set EmaxHP=25
    set EcurrentEP=30
    set EmaxEP=30
    set EhealthStatus=Healthy
    set Edmg=7
)
if %enemyFind%==3 (
   set enemy=Small Ground Hog
set EcurrentHP=35
set EmaxHP=35
set EcurrentEP=20
set EmaxEP=20
set EhealthStatus=Healthy
set Edmg=7
)
if %enemyFind%==4 (
set enemy=Ground Hog
set EcurrentHP=50
set EmaxHP=50
set EcurrentEP=70
set EmaxEP=70
set EhealthStatus=Healthy
set Edmg=11
)
if %enemyFind%==5 (
set enemy=Hyena
set EcurrentHP=75
set EmaxHP=75
set EcurrentEP=100
set EmaxEP=100
set EhealthStatus=Healthy
set Edmg=13
)
if %enemyFind%==6 (
set enemy=Giant ###RARE###
set EcurrentHP=100
set EmaxHP=100
set EcurrentEP=100
set EmaxEP=100
set EhealthStatus=Healthy
set Edmg=14
)
set enemyFind=0
goto Battle

:: ==========================================IN PROGRESS==========================================

:Outside_EnemyFind
set /a enemyFind=%RANDOM% * 5 / 32768 + 1
if %enemyFind%==1 (
set enemy=Squirrel
set EcurrentHP=20
set EmaxHP=20
set EcurrentEP=10
set EmaxEP=10
set EhealthStatus=Healthy
set Edmg=5
)
if %enemyFind%==2 (
set enemy=Rabbit
set EcurrentHP=25
set EmaxHP=25
set EcurrentEP=30
set EmaxEP=30
set EhealthStatus=Healthy
set Edmg=7
)
if %enemyFind%==3 (
set enemy=Stray Cat
set EcurrentHP=40
set EmaxHP=40
set EcurrentEP=60
set EmaxEP=60
set EhealthStatus=Healthy
set Edmg=9
)
if %enemyFind%==4 (
set enemy=Duck
set EcurrentHP=50
set EmaxHP=50
set EcurrentEP=70
set EmaxEP=70
set EhealthStatus=Healthy
set Edmg=11
)
if %enemyFind%==5 (
set enemy=Stray Dog
set EcurrentHP=50
set EmaxHP=50
set EcurrentEP=40
set EmaxEP=40
set EhealthStatus=Healthy
set Edmg=9
)
if %enemyFind%==6 (
set enemy=BlotBlot ###RARE###
set EcurrentHP=100
set EmaxHP=100
set EcurrentEP=100
set EmaxEP=100
set EhealthStatus=Healthy
set Edmg=20
)
set enemyFind=0
goto Battle
:Outside_RareEnemyFind
set enemy=BlotBlot ###RARE###
set EcurrentHP=100
set EmaxHP=100
set EcurrentEP=100
set EmaxEP=100
set EhealthStatus=Healthy
set Edmg=20
goto Battle

:Battle
if %currentHP% LSS 1 (
color 4F
echo Ouch, %lbnam%, it looks like that %enemy% bested you. Luckily for you...
echo I can allow you to load from another save. You can even load your...
echo previous save if you like. I'm going to return you to the load screen now...
pause
cls
color 0F
goto loadGame
)
if %EcurrentHP% LSS 1 (
echo You claimed victory over %enemy%!
set /a expGained=%RANDOM% * %EmaxHP% / 32768 + 1
set /a nodesGained=%RANDOM% * %EmaxHP% * 10 / 32768 + 1
echo You gained %expGained% experience and %nodesGained% nodes.
set /a nodes=%nodes%+%nodesGained%
set /a exp=%exp%+%expGained%
pause
cls
goto A_Menu
)
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
if %input%==2 goto EP_Power_List
if %input%==3 goto Battle_Inventory
if %input%==4 goto FleeBattle
echo I'm sorry, I didn't get that. Could you repeat that please?
pause
cls
goto Battle
:Battle_Attack
set /a attack=%RANDOM% * %dmg% / 32768 + 1
set /a Eattack=%RANDOM% * %Edmg% / 32768 + 1
echo You did %attack% damage to %enemy%!
set /a EcurrentHP=%EcurrentHP%-%attack%
echo %enemy% did %Eattack% damage to you!
set /a currentHP=%currentHP%-%Eattack%
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
echo You ran away, but were injured in the process...
pause
set /a currentHP=%currentHP%-10
goto A_Menu
)
if %flee% GTR 5 (
echo You ran away successfully.
pause
cls
goto A_Menu
)
:Battle_Inventory
cls
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
echo Your HP is already full!
pause
cls
goto Battle_Inventory
)
set /a hpRest=%RANDOM% * %currentHP% / 32768 + 1
set /a currentHP=%currentHP%+%hpRest%
echo You feel refreshed. (Restored some HP)
pause
set /a %Eattack%=%RANDOM% * %Edmg% / 32768 + 1
echo %enemy% did %Eattack% damage to you.
set /a currentHP=%currentHP%-%Eattack%
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
echo You're full of EP points! Any more, you'll burn up!
pause
cls
goto Battle_Inventory
)
set currentEP=%maxEP%
echo You feel rejuvenated! (EP Restored)
set /a %Eattack%=%RANDOM% * %Edmg% / 32768 + 1
echo %enemy% did %Eattack% damage to you.
set /a currentHP=%currentHP%-%Eattack%
set /a eppot=%eppot%-1
pause
cls
goto Battle
:Loot_HUB
cls
echo This area is currently under maintenance. Sorry!
pause
cls
goto A_Menu

:LevelUp
cls
set /a level=%level%+1
set exp=0
set /a expToNextLevel=%expToNextLevel%+100
set /a maxHP=%maxHP%+50
set /a currentHP=%maxHP%
set /a maxEP=%maxEP%+50
set /a currentEP=%maxEP%
echo Congratulations, %lbnam%, you've reached Level %level%!
pause
echo You have 5 stat points to divide up throughout your stats. Choose a stat to
echo add a point to.
echo.
echo 1:STRENGTH%tab% %strength%
echo 2:AGILITY %tab% %agility%
echo 3:VITALITY%tab% %vitality%
echo 4:WILLPOWER%tab% %willpower%
set /p input=Select a stat to increase by one point:: 
if /i %input%==1 (
set /a strength=%strength%+1
)
if /i %input%==2 (
set /a agility=%agility%+1
)
if /i %input%==3 (
set /a vitality=%vitality%+1
)
if /i %input%==4 (
set /a willpower=%willpower%+1
)
cls
echo You have 4 stat points to divide up throughout your stats. Choose a stat to
echo add a point to.
echo.
echo 1:STRENGTH%tab% %strength%
echo 2:AGILITY %tab% %agility%
echo 3:VITALITY%tab% %vitality%
echo 4:WILLPOWER%tab% %willpower%
set /p input=Select a stat to increase by one point:: 
if /i %input%==1 (
set /a strength=%strength%+1
)
if /i %input%==2 (
set /a agility=%agility%+1
)
if /i %input%==3 (
set /a vitality=%vitality%+1
)
if /i %input%==4 (
set /a willpower=%willpower%+1
)
cls
echo You have 3 stat points to divide up throughout your stats. Choose a stat to
echo add a point to.
echo.
echo 1:STRENGTH%tab% %strength%
echo 2:AGILITY %tab% %agility%
echo 3:VITALITY%tab% %vitality%
echo 4:WILLPOWER%tab% %willpower%
set /p input=Select a stat to increase by one point:: 
if /i %input%==1 (
set /a strength=%strength%+1
)
if /i %input%==2 (
set /a agility=%agility%+1
)
if /i %input%==3 (
set /a vitality=%vitality%+1
)
if /i %input%==4 (
set /a willpower=%willpower%+1
)
cls
echo You have 2 stat points to divide up throughout your stats. Choose a stat to
echo add a point to.
echo.
echo 1:STRENGTH%tab% %strength%
echo 2:AGILITY %tab% %agility%
echo 3:VITALITY%tab% %vitality%
echo 4:WILLPOWER%tab% %willpower%
set /p input=Select a stat to increase by one point:: 
if /i %input%==1 (
set /a strength=%strength%+1
)
if /i %input%==2 (
set /a agility=%agility%+1
)
if /i %input%==3 (
set /a vitality=%vitality%+1
)
if /i %input%==4 (
set /a willpower=%willpower%+1
)
cls
echo You have 1 stat point to divide up throughout your stats. Choose a stat to
echo add a point to.
echo.
echo 1:STRENGTH%tab% %strength%
echo 2:AGILITY %tab% %agility%
echo 3:VITALITY%tab% %vitality%
echo 4:WILLPOWER%tab% %willpower%
set /p input=Select a stat to increase by one point:: 
if /i %input%==1 (
set /a strength=%strength%+1
)
if /i %input%==2 (
set /a agility=%agility%+1
)
if /i %input%==3 (
set /a vitality=%vitality%+1
)
if /i %input%==4 (
set /a willpower=%willpower%+1
)

:Bank_Menu
cls
echo Welcome to the bank! 
echo We can exchange nodes, for XNodes!
echo (You can use these in shops, you know...)
echo.
echo 1 XNode is 15000 Nodes. 
echo You have %nodes% node(s), and %Xnodes% XNode(s)
echo.
echo Would you like to exchange?
echo 1) Yes
echo 2) No
set /p bank=:: 
if %bank% == 1 goto Bank_Exchange
if %bank% == 2 (
cls
echo See you soon!
ping localhost -n 3 >nul
cls
goto Map
)

:Bank_Exchange
set fakeNode=%nodes%
set fakexNode=%Xnodes%
set fakexNodein=0
set fakeNode = %nodes% - 15000
if %fakeNode% LSS 0 goto Bank_Exchange_Fail
echo How many XNodes would you like?
set /p fakexNodein=:: 
set math1= 15000 * fakexNodein
echo %math1%
pause
if math1 LSS 0 goto Bank_Exchange_Fail



cls
echo 

:Bank_Exchange_Fail
cls
echo You cannot exchange nodes without dipping into debt!
pause
goto Bank_Menu

:Checkforupdates
set oldVersion=%version%
::Thanks to Kolto101 for providing the update code.
::It helps a ton!
if /i not exist "wget.exe" (
cls
echo.
echo The 'wget.exe' tool was not found.
echo Could not retrieve update file.
echo.
pause
goto start
)
echo Checking for updates...
if exist "bfpatcher.bat" del "bfpatcher.bat"

wget "www.jaeobgames.com/BioFuse_update/bfpatcher.bat"


if /i not exist "bfpatcher.bat" (
if exist "index.html" del "index.html"
title BioFuse - Update - Error
cls
::                                      I MIDDLE
echo ERR. Download Failed
echo.
echo.
echo. 
echo This may have been caused by:
echo * Site is under "DDoS" mode. This prevents the file being downloaded.
echo * No Internet
echo * Site is essentially down.
echo.
echo Try again later...
pause
goto start
)
if exist "bfpatcher.bat" call "bfpatcher.bat"
if exist "bfpatcher.bat" del "bfpatcher.bat"

(
del uBioFuse.bat
start BioFuse.bat
exit /b
)>uBioFuse.bat

call uBioFuse.bat
exit



::                                      I MIDDLE
:sav_OutDated
cls
echo                 Your save file could be missing
echo      some important variables, and could cause
echo            the game to crash, or anything else. 
echo       Would you like to fix/update your save file?
echo          WARNING: THIS COULD RESET DATA! 
echo                    USE WITH CAUTION
echo.
set /p updatesav=(Y/N)::
if /i %updatesav% == Y goto antiCorruption
if /i %updatesav% == N goto MainScreen_Check
:antiCorruption
if %wepnam% == nul set wepnam=Fists
if %dmg% == nul set dmg=5
if %item% == nul set item=0
if %nodes% == nul set nodes=0
if %xnodes% == nul set xnodes=0
if %level% == nul set level=1
if %exp% == nul set exp=0
if %expToNextLevel% == nul set expToNextLevel=100
if %currentHP% == nul set currentHP=100
if %maxHP% == nul set maxHP=100
if %currentEP% = nul set currentEP=100
if %maxEP% = nul set maxEP=100
if %healthStatus% == nul set healthStatus=Healthy
if %opt_diff% == nul set opt_diff=Normal
if %loc% == nul set loc=Home
if %eloc% == nul set eloc=0
if %eppot% == nul set eppot=3
if %hppot% == nul set hppot=3
if %strength% == nul set strength=10
if %strengthatk% == nul set strengthatk=12
if %defense% == nul set defense=12
if %blockcnce% == nul set blockcnce=5
if %agility% == nul set agility=10
if %agilityatk% == nul set agilityatk=12
if %hitcnce% == nul set hitcnce=80
if %critcnce% == nul set critcnce=5
if %evadecnce% == nul set evadecnce=5
if %parrycnce% == nul set parrycnce=5
if %vitality% == nul set vitality=10
if %willpower% == nul set willpower=10
if %eppower% == nul set eppower=12
if %adventure% == nul set adventure=0
if %versionnum% == nul set versionnum=%version%
:: Armor
if %leathera% == nul set leathera=false
if %leatherabuy% == nul set leatherabuy=false
if %scrapa% == nul set scrapa=false
if %scrapabuy% == nul set scrapabuy=false
if %lowquala% == nul set lowquala=false
if %lowqualabuy% == nul set lowqualabuy=false
if %ironarmor% == nul set ironarmor=false
if %ironarmorbuy% == nul set ironarmorbuy=false
if %holoarmor% == nul set holoarmor=false
if %holoarmorbuy% == nul set holoarmorbuy=false
:: Weapon
if %fists% == nul set fists=true
if %fistsbuy% == nul set fistsbuy=true
::For stability
::The shortened version of the weapon is the equip. 
if %ironsword% == nul  set ironsword=false
if %ironswordbuy% == nul set ironswordbuy=false
if %makedo% == nul set makedo=false
if %makedobuy% == nul set makedobuy=false
if %irondag% == nul  irondag=false
if %irondagbuy% == nul set irondagbuy=false
if %spikedmace% == nul set spikedmace=false
if %spikedmacebuy% == nul set spikedmacebuy=false
if %lowvoltblast% == nul set lowvoltblast=false
if %lowvoltblasybuy% == nul set lowvoltblastbuy=false
if %mediumvoltage% == nul set mediumvoltage=false
if %mediumvoltagebuy% == nul set mediumvoltagebuy=false
goto q_SAV

:MainScreen_Check
if %adventure%==0 goto MainScreen
if %adventure%==1 goto MainScreen_Adventure

::##################################################################################
::##################################################################################
::BIOFUSE ADVENTURE CODE STARTS HERE.
::##################################################################################
::##################################################################################

:Start_Adv
if %level% LSS 5 (
cls
echo You're not of level to start this adventure! 
echo Keep leveling up to continue from here.
pause
pause
goto MainScreen
)
cls
echo.
echo Welcome to the BioFuse Adventure...
echo Here is the more exciting portion of this game (to be honest)
echo.
echo Did you know, when you start the game, the grind zone will be 
echo available again when you're level 20.
echo.
set /p rdy=Are you ready? [Y/N]::
if /i %rdy% == y goto a_LetsAGo
if /i %rdy% == n goto MainScreen

:a_LetsAGo
cls
set adventure=1
echo Prepare for a bit of a story right here... this might take a while.
pause
echo %tab%You come back from slaughtering that %enemy% you found,
echo and you decide to go to sleep in your bed. That night, you have a nightmare;
echo you're being hunted down in a forest by a black figure. You try every
echo escape you know of: ducking corners, taking shortcuts, but nothing will deter
echo this figure from it's goal of tracking you down. It finally catches you, and
echo the next thing you feel is extreme heat. Your vision blacks out, and you wake
echo up. You look at the clock on the wall, but one thing sticks out in your head.
echo THERE IS NO WALL.
pause
cls
echo %tab%You look around and see that the walls of your house have
echo burnt down. Everything inside your house is gone, except for your equipment
echo and your nodes. You see large dragon tracks heading towards a nearby cave.
echo The town of Eytanas sits to the East... maybe you should get some gear and
echo investigate the cave.
pause
cls
set loc=Home
goto MainScreen_Adventure

:Adventure_Character_Menu
cls
echo Status: %healthStatus%
echo HP: %currentHP% / %maxHP%
echo EP: %currentEP% / %maxEP%
echo Nodes: %nodes%  XNodes: %Xnodes%
echo EXP: %exp% / %expToNextLevel%
echo Note: The stats are defunct, they just look cool for now. :)
echo.
echo [E]quipment Panel
echo STRENGTH%tab% %strength%
echo %tab%STR ATK%tab% %strengthatk%
echo %tab%DEFENSE%tab% %defense%
echo %tab%BLOCK %%%tab% %blockcnce%
echo AGILITY %tab% %agility%
echo %tab%AGI ATK%tab% %agilityatk%
echo %tab%CRIT %%%tab% %critcnce%
echo %tab%EVADE %%%tab% %evadecnce%
echo %tab%HIT %%%tab% %hitcnce%
echo %tab%PARRY %%%tab% %parrycnce%
echo VITALITY%tab% %vitality%
echo %tab%Max HP%tab% %maxHP%
echo WILLPOWER%tab% %willpower%
echo %tab%Max EP%tab% %maxEP%
echo %tab%EP ATK%tab% %eppower%
set /p input=Equipment Panel?

:Adventure_Map
cls
echo [H]ome
echo [O]utside
echo [F]latlands
echo [E]ytanas
set /p input="Where would you like to go?>>"
if /i %input%==H goto Adventure_Home_Menu
if /i %input%==O goto Adventure_Outside_Menu
if /i %input%==F goto Adventure_Flatlands_Menu
if /i %input%==E goto Adventure_Eytanas
echo I don't understand that. Could you repeat that please?
pause
cls
goto Adventure_Map


:MainScreen_Adventure
cls
set /a strengthatk=5+(strength/2)+(level*2)
set /a defense=5+(strength/2)+(level*2)
set /a blockcnce=5+(strength/100)
set /a agilityatk=5+(agilty/2)+(level*2)
set /a hitcnce=80+(agility/100)
set /a critcnce=5+(agility/100)
set /a evadecnce=5+(agility/100)
set /a parrycnce=5+(agility/100)
set /a maxhp=100+(level*10)+(vitality/2)
set /a maxep=100+(level*10)+(willpower/2)
set /a eppower=5+(willpower/2)+(level*2)
if %currentHP% LSS 1 ( 
echo %lbnam%, I hate to be the bearer of bad news, but you seem to be dead. It
echo looks like your save might have gotten corrupted somehow, or you manually
echo edited it so that your currentHP is 0. You might want to manually edit your
echo save file so that you are alive again. That's what you usually do, right?
pause
cls
goto start
)
if %exp% GEQ %expToNextLevel% goto levelUp
echo %lbnam%, Lv %level%
echo HP: %currentHP% / %maxHP%   
echo EP: %currentEP% / %maxEP%   
echo Status: %healthstatus%
echo Location: %loc%
echo #---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#
echo [A]ction Menu
echo [C]haracter Menu
echo [E]quip Weapons
echo [O]ptions
set /i /p input=Choice?
if /i %input%==A goto Adventure_ActionMenu
if /i %input%==C goto Adventure_CharacterMenu
if /i %input%==E goto Adventure_EquipWep


if /i %input%==O goto Adventure_Options
echo I don't understand that. Come again?
pause
cls
goto MainScreen_Adventure

:Adventure_ActionMenu
cls
if %loc%==Home goto Adventure_Home_Menu
if %loc%==Outside goto Adventure_Outside_Menu
if %loc%==Flatlands goto Adventure_Flatlands_Menu
if %loc%==Forest goto Adventure_Forest_Menu
if %loc%==Junkyard goto Adventure_Junkyard_Menu
if %loc%==Eytanas goto Adventure_Eytanas_Menu
echo Interesting... you seem to have gotten yourself trapped between dimensions.
echo What we're going to do is send you home with a nice cup of hot cocoa. Ok, I
echo forgot we don't HAVE any hot cocoa, so we're just going to send you home
echo empty handed.
pause
set loc=Home
goto Adventure_ActionMenu

:Adventure_EquipWep
cls
echo EquipWep 1.0
echo.
echo %lbnam%, Lv %level%
echo Current Weapon: 

:Adventure_Home_Menu
echo %lbnam%, Lv %level%
echo HP: %currentHP% / %maxHP%
echo EP: %currentEP% / %currentEP%
echo Status: %healthstatus%
echo Location: %loc%
echo #---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#
echo There isn't much to do here, since your house is destroyed...
echo The dragon tracks lay there in the ground, as if they are taunting you to
echo find their owner.
echo [C]haracter Menu
echo [M]ap
echo [O]ptions
set /p input=Choice? 
if /i %input%==C goto Adventure_Character_Menu
if /i %input%==L goto Adventure_Map
if /i %input%==O goto Adventure_Options
echo I'm sorry, I didn't get that. Come again?
pause
cls
goto Adventure_Home_Menu

:Adventure_Outside_Menu
cls
echo %lbnam%, Lv %level%
echo HP: %currentHP% / %maxHP%
echo EP: %currentEP% / %currentEP%
echo Status: %healthstatus%
echo Location: %loc%
echo #---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#
echo Search for Mo[B]s
echo Search for [L]oot
echo [O]ptions
echo [C]haracter Menu
echo [M]ap
set /p input=Choice? 
if /i %input%==B goto Adventure_Ene_Hub_O
if /i %input%==L goto Adventure_Outside_Loot_Search
if /i %input%==O goto Adventure_Options
if /i %input%==C goto Adventure_Character_Menu
if /i %input%==M goto Adventure_Map
echo Sorry, I didn't get that. Come again?
pause
cls
goto Adventure_Outside_Menu

:Adventure_Flatlands_Menu
cls
echo %lbnam%, Lv %level%
echo HP: %currentHP% / %maxHP%
echo EP: %currentEP% / %maxEP%
echo Status: %healthStatus%
echo Location: %loc%
echo #---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#
echo Search for Mo[B]s
echo Search for [L]oot
echo [O]ptions
echo [C]haracter Menu
echo [M]ap
set /p input=Choice?
if /i %input%==B goto Adventure_Ene_Hub_Fl
if /i %input%==L goto Adventure_Flatlands_Loot_Search
if /i %input%==O goto Adventure_Options
if /i %input%==C goto Adventure_Character_Menu
if /i %input%==M goto Adventure_Map
echo Sorry, I didn't get that. Come again?
pause
cls
goto Adventure_Flatlands_Menu

:Adventure_Eytanas
cls
echo %lbnam%, Lv %level%
echo HP: %currentHP% / %maxHP%
echo EP: %currentEP% / %currentEP%
echo Status: %healthStatus%
echo Location: %loc%
echo #---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#
echo [W]eapons Shop
echo [A]rmor Shop
echo [I]tem Shop
echo [Q]uest Hub
set /p input=Choice?
if /i %input%==W goto Adventure_Eytanas_Weapon_Shop
if /i %input%==A goto Adventure_Eytanas_Armor_Shop
if /i %input%==I goto Adventure_Eytanas_Item_Shop
if /i %input%==Q goto Adventure_Eytanas_Quest_Hub
echo If you want that, you might want to go somewhere else. How about something
echo else?
pause
cls
goto Adventure_Eytanas

:Adventure_Eytanas_Weapon_Shop
cls
echo Welcome, %lbnam%. See anything you like? Just lemme know.
echo #---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#
echo [1]Iron Sword
echo [2]Make-do Wand
echo [3]Iron Dagger
echo [4]Spiked Mace
echo [5]Low-Voltage Blaster
echo [6]Medium-Voltage Blaster
echo [B]ack
set /p input=Choice? 
if %input%==1 (
	echo Iron Sword
	echo Cost: 1000 Nodes
	echo You have: %nodes% Nodes
	echo Description: A simple Iron Sword. Nothing else to say about it.
	echo Type: Sword (50%% Strength, 50 %% Agility)
	echo Would you like to buy Iron Sword? [Y/N]
	set /p input=::
	if /i %input%==Y (
		if %nodes% LSS 1000 (
			echo Sorry, but you don't have enough nodes.
		)
		echo You have bought Iron Sword for 1000 Nodes.
		set /a nodes=%nodes%-1000
		set ironswordbuy=true
		pause
		cls
		goto Adventure_Eytanas_Weapon_Shop
	)
	if /i %input%==N (
		goto Adventure_Eytanas_Weapon_Shop
	)
)
if %input%==2 (
	echo Make-do Wand
	echo Cost: 1500 Nodes
	echo You have: %nodes% Nodes
	echo Description: A quickly made wand. You can easily see the arcane imperfections.
	echo Type: Wand (Willpower)
	echo Would you like to buy Make-do Wand? [Y/N]
	set /p input=::
	if /i %input%==Y (
		if %nodes% LSS 1500 (
			echo Sorry, but you don't have enough nodes.
		)
		echo You have bought Make-do Wand for 1500 Nodes.
		set /a nodes=%nodes%-1500
		set makedo=true
		pause
		cls
		goto Adventure_Eytanas_Weapon_Shop
	)
	if /i %input%==N (
		goto Adventure_Eytanas_Weapon_Shop
	)
)
if %input%==3 (
	echo Iron Dagger
	echo Cost: 1500 Nodes
	echo You have: %nodes% Nodes
	echo Description: A small dagger. The blade is barely twice the size of the hilt.
	echo Type: Dagger (Agility)
	echo Would you like to buy Iron Dagger? [Y/N]
	set /p input=::
	if /i %input%==Y (
		if %nodes% LSS 1500 (
			echo Sorry, but you don't have enough nodes.
		)
		echo You have bought Iron Dagger for 1500 Nodes.
		set /a nodes=%nodes%-1500
		set irondag=true
		pause
		cls
		goto Adventure_Eytanas_Weapon_Shop
	)
	if /i %input%==N (
		goto Adventure_Eytanas_Weapon_Shop
	)
)
if %input%==4 (
	echo Spiked Mace
	echo Cost: 1750 Nodes
	echo You have: %nodes% Nodes
	echo Description: A medieval mace with sinsiter-looking spikes. 'Nuff said.
	echo Type: Hammer (Strength)
	echo Would you like to buy Spiked Mace? [Y/N]
	set /p input=::
	if /i %input%==Y (
		if %nodes% LSS 1750 (
			echo Sorry, but you don't have enough nodes.
		)
		echo You have bought Spiked Mace for 1750 Nodes.
		set /a nodes=%nodes%-1750
		set spikedmace=true
		pause
		cls
		goto Adventure_Eytanas_Weapon_Shop
	)
	if /i %input%==N (
		goto Adventure_Eytanas_Weapon_Shop
	)
)
if %input%==5 (
	echo Low-Voltage Blaster
	echo Cost: 2000 Nodes
	echo You have: %nodes% Nodes
	echo Description: A used blaster. The last person to use this... oh look, a pie!
	echo Type: Ranged (Agility)
	echo Would you like to buy Low-Voltage Blaster? [Y/N]
	set /p input=::
	if /i %input%==Y (
		if %nodes% LSS 3500 (
			echo Sorry, but you don't have enough nodes.
		)
		echo You have bought Low-Voltage Blaster for 3500 Nodes.
		set /a nodes=%nodes%-3500
		set lowvoltblast=true
		pause
		cls
		goto Adventure_Eytanas_Weapon_Shop
	)
	if /i %input%==N (
		goto Adventure_Eytanas_Weapon_Shop
	)
)
if %input%==6 (
	echo Medium-Voltage Blaster
	echo Cost: 10000 Nodes
	echo You have: %nodes% Nodes
	echo Description: A slightly used blaster. The last person to use this... Oh look, a cake.
	echo Type: Ranged (Agility)
	echo Would you like to buy Medium-Voltage Blaster? [Y/N]
	set /p input=::
	if /i %input%==Y(
		if /i %nodes% LSS 2000 (
			echo Sorry, but you don't have enough nodes.
		)
		echo You have bought the Medium-Voltage Blaster for 10000 Nodes.
		set /a nodes=%nodes%-10000
		set mediumvoltage=true
		pause
		cls
		goto Adventure_Eytanas_Weapon_Shop
		)
	if /i %input%==N (
		goto Adventure_Eytanas_Weapon_Shop
	)
)
if /i %input%==B goto Adventure_Eytanas


:Adventure_Eytanas_Armor_Shop
cls
echo Welcome, %lbnam%. See anything you like? Just lemme know.
echo #---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#
echo [1] Leather Armor
echo [2] Scrap Metal Armor
echo [3] Low Quality Iron Armor
echo [4] Iron Armor
echo [5] Holo Armor
echo [B]ack
set /p input=Choice? 

if %input% == 1 (
	echo Leather Armor
	echo Cost: 1000
	echo You have: %nodes% Nodes
	echo Description: Some really nice leather CLOTHING. I'm surprised we even
	echo accept this as a armor piece.
	echo Type: Defense (Weak)
	echo Would you like to buy Leather Armor? [Y/N]
	set /p input=::
	if /i %input%==Y(
		if /i %nodes% LSS 1000 (
			echo Sorry, but you don't have enough nodes.
		)
		echo You have bought the Leather Armor for 1000 Nodes.
		set /a nodes=%nodes%-1000
		set leathera=true
		pause
		cls
		goto Adventure_Eytanas_Armor_Shop
		)
	if /i %input%==N (
		goto Adventure_Eytanas_Armor_Shop
	)
)
if %input% == 2 (
	echo Scrap Metal Armor
	echo Cost: 5000
	echo You have: %nodes% Nodes
	echo Description: Came from the dump... We saw Wall-e there... (It's decent)
	echo Type: Defense (Decent)
	echo Would you like to buy Scrap Metal Armor? [Y/N]
	set /p input=::
	if /i %input%==Y (
		if /i %nodes% LSS 5000 (
			echo Sorry, but you don't have enough nodes.
		)
	echo You have bough the Scrap Metal Armor for 5000 Nodes.
	set /a nodes=%nodes%-50000
	set scrapa=true
	pause
	cls
	goto Adventure_Eytanas_Armor_Shop
	)
	if /i %input%==N (
		goto Adventure_Eytanas_Armor_Shop
	)
)

if %input% == 3 (
	echo Low Quality Iron Armor
	echo Cost: 150000
	echo You have: %nodes% Nodes.
	echo Description: This is some heavily used armor. It's really cool though.
	echo Type: Defense (Decent)
	echo Would you like to buy Low Quality Armor? [Y/N]
	set /p input=::
	if /i %input%==Y (
		if %nodes% LSS 150000 (
			echo Sorry, but you don't have enough nodes.
			)
if /i %input% == B goto Adventure_Eytanas
