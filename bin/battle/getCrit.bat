:: This should only be called! This is a subroutine, not a fully accessible block. 
:: Get crit chance, add 5
:: Changed crit chance addition from 7 to 5 in 1.7.2
set critSwitch=0
set /a CRITICALCHANCE=%critcnce% + 5
if %nulbool% == 1 set testvar=1 && echo Made it to test crit %testvar% && pause &&  set /a testvar=%testvar% + 1 

:: Make random stat with the added crit chance 
set /a CRITRANDOM=%random% * %CRITICALCHANCE% / 32768 + 1
if %nulbool% == 1 set testvar=1 && echo Made it to test crit %testvar% && pause &&  set /a testvar=%testvar% + 1 

:: Does the random var equal that critchance? If so, you get a crit.
if %CRITRANDOM% == %critcnce% set critSwitch=1
if %nulbool% == 1 set testvar=1 && echo Made it to test crit  %testvar% && pause &&  set /a testvar=%testvar% + 1 

exit /b 