:: This should only be called! This is a subroutine, not a fully accessible block. 
set /a Eattack=%RANDOM% * %Edmg% / 32768 + 1
echo %enemy% attacks^^! It did %Eattack% damage to you^^!
set /a currentHP=%currentHP% - %Eattack% 
exit /b 