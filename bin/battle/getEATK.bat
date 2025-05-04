:: This should only be called! This is a subroutine, not a fully accessible block. 
set /a Eattack=%RANDOM% * %Edmg% / 32768 + 1
if %resetSwitch% == 0 echo %enemy% attacks^^! It did %Eattack% damage to you^^!
if %resetSwitch% == 0 set /a currentHP=%currentHP% - %Eattack% 
if %resetSwitch% == 2 set /a Eattack=%Eattack% / 3
if %resetSwitch% == 2 echo %enemy%'s attack was partially blocked, doing %Eattack% damage to you.
exit /b 