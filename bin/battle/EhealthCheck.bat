set /a eTossHP=%EmaxHP% / 2
set /a eTossHP2=%EcurrentHP% * 2
set /a eburnDMG=%RANDOM% * %mDmg% / 32768 + 1
set /a esickDMG=%RANDOM% * %eTossHP% / 32768 + 1
set /a epresDMG=%esickDMG / 2
set /a ebatteredDMG=%RANDOM% * 10 / 32768 + 1
if %EmaxHP% GTR 1000 (set /a Crptdmg=%random% * %eTossHP2% / 32768 + 1) else (set /a Crptdmg=%random% * 20 / 32768 + 1)
set /a InfDmg=%random% * %eTossHP2% + %esickDMG% / 32768 + 1
if %Crptdmg% LSS 0 set /a Crptdmg=-%Crptdmg%

if %EcurrentHP% LEQ %eTossHP% set EhealthStatus=Battered 
if %EcurrentHP% LEQ 10 set EhealthStatus=Dying
if %nulbool% == 1 set testvar=1 && echo Made it to test, enemy HP check %testvar% && pause &&  set /a testvar=%testvar% + 1 
set /a quickmaths=%ebatteredDMG% - %EcurrentEP%
if %EcurrentEP% LSS 0 echo %enemy% is overexerted! It takes %quickmaths% damage! && set /a EcurrentHP=%EcurrentHP% - %quickmaths%
:: BURNING -- EP induced long-period damage 
:: SICK -- Activates when enemy has sickness
:: BATTERED -- Only activates during low health
:: DYING -- Only activates during last 10 health 
:: CORRUPTED -- Only activates randomly in robots
:: INFECTED -- Only activates randomly in robots OR living beings afflicted via weapon

if %nulbool% == 1 set testvar=1 && echo Made it to test, enemy HP check %testvar% && pause &&  set /a testvar=%testvar% + 1 

if "%enemy%" == "The President" if not %EhealthStatus% == Battered if not %EhealthStatus% == Presidential echo The President shakes off his status effect. && set EHealthStatus=Presidential

if %EhealthStatus% == Presidential (
echo The President's aura is crushing... 
echo You take %epresDMG% damage.
set /a currentHP=%currentHP% - %epresDMG%
if %EcurrentEP% LSS %EmaxEP% set /a EcurrentEP=%EcurrentEP% + 20 && echo The President regenerates some EP.
)

if %EhealthStatus% == Presidential-Corruption (
echo The %enemy% twiches violently, eyes flickering in a miasma of dark purple.
echo Despite the mad twitching, %enemy% takes no damage from this. It's unnatural.
if %esickDMG% GEQ 6 echo The %enemy%'s chest glows dimly before a shard of corruption pierces your body. && set healthStatus=Presidential-Corruption && echo You take %CrptdmgDMG% damage. && set /a currentHP=%currentHP% - %CrptDMG%
)

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
echo %enemy% takes %Crptdmg% HP!
set /a EcurrentHP=%EcurrentHP% - %Crptdmg%
)

if %EhealthStatus% == Infected (
if %InfDmg% LSS 0 set /a Crptdmg=-%Crptdmg%
echo %enemy% seems to have been infected by... something.
echo %enemy% takes %InfDmg% HP!
set /a EcurrentHP = %EcurrentHP% - %InfDmg%
)

exit /b
