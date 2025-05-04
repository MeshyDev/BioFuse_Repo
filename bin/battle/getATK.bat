:: This should only be called! This is a subroutine, not a fully accessible block. 
set /a weaponmodCnc=%RANDOM% * 15 / 32768 + 1
set /a attack=%RANDOM% * %dmg% / 32768 + 1 
set /a attack=%attack% + %weapondmg% 

:: Today kids, we'll be adding weapon mod effects!
:: Why is it in a patch and not the full version? Screw you, it is in the full version! See? Its says 1.8 right there (at the time of writing)
:: Weapon chance is a static value at 15. For giggles, we're gonna put the number it needs to hit at... 8.

::checkif weaponmod
:: For whatever reason, this check needs to have a space after flame.
if "%weaponmod%" == "Flame " (
if %weaponmodCnc% == 8 echo Your weapon gleams in a fiery orange hue! You set %enemy% ablaze! && set EHealthStatus=Burning
)

if %nulbool% == 1 set testvar=1 && echo Made it to test attack %testvar% && pause &&  set /a testvar=%testvar% + 1 
echo You attack^! You did %attack% damage to %enemy%^! 
if %nulbool% == 1 set testvar=1 && echo Made it to test attack  %testvar% && pause &&  set /a testvar=%testvar% + 1 
set /a EcurrentHP=%EcurrentHP% - %attack% 
if %nulbool% == 1 set testvar=1 && echo Made it to test attack %testvar% && pause &&  set /a testvar=%testvar% + 1 
exit /b 