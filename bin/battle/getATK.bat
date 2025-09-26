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
:: Finger basically gives chances for a mini crit essentially
if "%weaponmod%" == "Finger " (
if %weaponmodCnc% == 14 echo As you squash your enemy with Gods Finger, lightning sparks from its fingertips, doubling your attack! && set /a attack=%attack%+%attack%
if %Edmg% LEQ %attack% set /a attack=%attack%+%Eattack% && echo The finger levels the playing field, adding their strength to your own power...
)
if "%weaponmod%" == "Sickness " (
if %weaponmodCnc% == 12 echo Your weapon gleams with a gross green glow, making %enemy% sick. && set EHealthStatus=Sick
)
if "%weaponmod%" == "Corruption " (
if %weaponmodCnc% == 11 echo Your weapon vibrates, seemingly twitching visibly in corruption. On contact, it corrupts %enemy%! && set EHealthStatus=Corrupted
)
if "%weaponmod%" == "Infection " (
if %weaponmodCnc% == 10 echo Something... odd is happening with your weapon. On use, it spat out some sickly brown sludge that infects %enemy%. && set EHealthStatus=Infected
)
if %nulbool% == 1 set testvar=1 && echo Made it to test attack, weaponmod check succeeded %testvar% && pause &&  set /a testvar=%testvar% + 1 
if "%weaponname%" == "Fists" echo You swing your fists! You did %attack% damage to %enemy%! 
if "%weaponname%" == "Fists " echo You swing your fists! You did %attack% damage to %enemy%!
if "%weaponname%" == "Dagger " echo You stab your dagger forth, doing %attack% damage to %enemy%!
if "%weaponname%" == "Sword " echo You swing your sword, slashing %enemy% for %attack% damage!
if "%weaponname%" == "Flame Sword " echo Light wisps of flame dances from each slash. You do %attack% damage to %enemy%
if "%weaponname%" == "Rocket Launcher " echo The Rocket Propelled Grenade flies at %enemy%, exploding on contact and doing %attack% damage.
if "%weaponname%" == "Death Machine " echo You become ninja, slicing and dicing %enemy% for %attack% damage!
if "%weaponname%" == "Bot Buster " echo The cannon hums as it charges its beam, jumping out in an arc at %enemy% and dealing %attack% damage!
if "%weaponname%" == "Portable Death Laser " echo The PDL whistles and vibrates, purplish white energy arcing from the stored energy- && echo -before it releases! %enemy% is roasted for %attack% damage!
if "%weaponname%" == "Gods Finger " echo You use the finger to squash your foes. && echo WHAAAM! %enemy% was whacked for %attack% damage! 
if %nulbool% == 1 set testvar=1 && echo Made it to test attack  %testvar% && pause &&  set /a testvar=%testvar% + 1 
set /a EcurrentHP=%EcurrentHP% - %attack% 
if %nulbool% == 1 set testvar=1 && echo Made it to test attack %testvar% && pause &&  set /a testvar=%testvar% + 1 
exit /b 