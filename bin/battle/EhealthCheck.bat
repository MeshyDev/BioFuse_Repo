set /a eburnDMG=%RANDOM% * 10 / 32768 + 1
set /a esickDMG=%RANDOM% * 10 / 32768 + 1
set /a ebatteredDMG=%RANDOM% * 4 / 32768 + 1

set /a eTossHP = %EmaxHP% / 2

if %EcurrentHP% LEQ %eTossHP% set EhealthStatus=Battered 
if %EcurrentHP% LEQ 10 set EhealthStatus=Dying
if %nulbool% == 1 set testvar=1 && echo Made it to test, enemy HP check %testvar% && pause &&  set /a testvar=%testvar% + 1 

:: BURNING -- EP induced long-period damage 
:: SICK -- Activates when enemy has sickness
:: BATTERED -- Only activates during low health
:: DYING -- Only activates during last 10 health 
:: CORRUPTED -- Only activates randomly in robots
:: INFECTED -- Only activates randomly in robots

if %nulbool% == 1 set testvar=1 && echo Made it to test, enemy HP check %testvar% && pause &&  set /a testvar=%testvar% + 1 

if %EhealthStatus% == Burning (
echo The enemy burns! It takes %eburnDMG% damage! 
set /a EcurrentHP=%EcurrentHP% - %eburnDMG%
)
if %nulbool% == 1 set testvar=1 && echo Made it to test, enemy HP check %testvar% && pause &&  set /a testvar=%testvar% + 1 

if %EhealthStatus% == Sick (
echo %enemy% looks sickly, its hazy eyes rolling lazily at you.
echo It takes %esickDMG% damage. 
set /a EcurrentHP=%EcurrentHP% - %esickDMG%
)
if %nulbool% == 1 set testvar=1 && echo Made it to test, enemy HP check %testvar% && pause &&  set /a testvar=%testvar% + 1 

if %EhealthStatus% == Battered (
echo %enemy% is battered senseless! 
echo It takes %ebatteredDMG% damage in its own movements!
set /a EcurrentHP=%EcurrentHP% - %ebatteredDMG%
)
if %nulbool% == 1 set testvar=1 && echo Made it to test, enemy HP check %testvar% && pause &&  set /a testvar=%testvar% + 1 

if %EhealthStatus% == Dying (
echo %enemy%'s wounds look pretty fatal. 
echo.
)
if %nulbool% == 1 set testvar=1 && echo Made it to test, enemy HP success %testvar% && pause &&  set /a testvar=%testvar% + 1 

if %EhealthStatus% == Corrupted (
echo %enemy% twitches, making horrible bitcrushed grunts.
set /a Crptdmg=%random% * 5 / 32768 + 1
echo %enemy% takes %Crptdmg% HP!
set /a EcurentHP=%EcurrentHP% - %Crptdmg%
)


exit /b
