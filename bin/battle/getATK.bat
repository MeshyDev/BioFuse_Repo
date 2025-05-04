:: This should only be called! This is a subroutine, not a fully accessible block. 

:: Don't forget to add code that pertains to inventory! 

set /a attack=%RANDOM% * %dmg% / 32768 + 1 
if %nulbool% == 1 set testvar=1 && echo Made it to test attack %testvar% && pause &&  set /a testvar=%testvar% + 1 
echo You attack! You did %attack% damage to %enemy%! 
if %nulbool% == 1 set testvar=1 && echo Made it to test attack  %testvar% && pause &&  set /a testvar=%testvar% + 1 
set /a EcurrentHP=%EcurrentHP% - %attack% 
if %nulbool% == 1 set testvar=1 && echo Made it to test attack %testvar% && pause &&  set /a testvar=%testvar% + 1 
exit /b 