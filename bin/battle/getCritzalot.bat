:: This should only be called! This is a subroutine, not a fully accessible block. 
cls
if %currentEP% LSS 100 echo Your energy supply is exhausted. && echo Cannot perform EP ability! && exit /b
set /a regDMG=%RANDOM% * %dmg% / 32768 + 1 
set /a critDMG=%regDMG% * 5
set /a currentEP=%currentEP% - 100
echo Sir Critzalot possesses you!
echo WHAM! You do %critDMG% critical damage! 
set /a EcurrentHP=%EcurrentHP% - %critDMG%
exit /b 
