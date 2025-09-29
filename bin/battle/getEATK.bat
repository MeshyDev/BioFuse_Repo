:: This should only be called! This is a subroutine, not a fully accessible block. 

::Variables
:: enemy=%enemy%
:: canCast=0/1
:: castLvl=0-5
:: EcurrentHP=100
:: EmaxHP = 100
:: EcurrentEP = 100
:: EmaxEP = 100
:: Edmg=0/999999

:: If the level is less than or equal to 29, just do the attack as per usual
if %level% LEQ 29 set /a Eattack=%RANDOM% * %Edmg% / 32768 + 1
:: If the level is greater than or equal to 30, we shake it up just a little bit
if %level% GEQ 30 set /a EattackToss=%RANDOM% * %Edmg% / 32768 + 1 
:: Calculate the damage as per usual for a second
if %level% GEQ 30 set /a Eattack=%EattackToss% * %scalingfactor%
:: Alright so, this is where we multiply that scaling factor. I'm contemplating changing it
:: since it makes the attacks completely broken at later stages... I've been testing the 
:: extreme limits throughout the years and I keep finding things. 

if %resetSwitch% == 0 if %EcurrentHP% GTR 0 echo %enemy% attacks! It did %Eattack% damage to you!
if %resetSwitch% == 0 if %EcurrentHP% == 0 echo %enemy% is nearly gone, yet it lunges out and strikes you! It did %Eattack% damage to you! 
if %resetSwitch% == 0 if %EcurrentHP% LSS 0 echo It's beaten, battered and dying and yet with its final breath, %enemy% attacks! && echo It did %Eattack% damage to you! 
if %resetSwitch% == 0 set /a currentHP=%currentHP% - %Eattack
:: resetSwitch 0 is a completely normal attack, effectively default state
:: resetSwitch 1 is used elsewhere so...
if %resetSwitch% == 2 set /a Eattack=%Eattack% / 3
:: Partial block reduces damage by 3
if %resetSwitch% == 2 if %Eattack% LSS 0 set /a Eattack=1 && echo The enemy was too strong and broke through your defenses, dealing 10000 damage! && set /a currentHP=%currentHP%-10000 && exit /b
:: However this injects an if statement to ensure that the enemies ovERHwelMing AURA actually lands
if %resetSwitch% == 2 echo %enemy%'s attack was partially blocked, doing %Eattack% damage to you. && set /a currentHP=%currentHP%-%Eattack%
if %resetSwitch% == 3 exit /b
exit /b 