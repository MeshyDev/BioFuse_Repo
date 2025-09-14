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
if %level% LEQ 29 set /a Eattack=%RANDOM% * %Edmg% / 32768 + 1
if %level% GEQ 30 set /a EattackToss=%RANDOM% * %Edmg% / 32768 + 1 
if %level% GEQ 30 set /a Eattack=%EattackToss% * %scalingfactor%
if %resetSwitch% == 0 echo %enemy% attacks! It did %Eattack% damage to you!
if %resetSwitch% == 0 set /a currentHP=%currentHP% - %Eattack%
if %resetSwitch% == 2 set /a Eattack=%Eattack% / 3
if %resetSwitch% == 2 if %Eattack% LSS 0 set /a Eattack=1 && echo The enemy was too strong and broke through your defenses, dealing 10000 damage! && set /a currentHP=%currentHP%-10000 && exit /b
if %resetSwitch% == 2 echo %enemy%'s attack was partially blocked, doing %Eattack% damage to you. && set /a currentHP=%currentHP%-%Eattack%
if %resetSwitch% == 3 exit /b
exit /b 