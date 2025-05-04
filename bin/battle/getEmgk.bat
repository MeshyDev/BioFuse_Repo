:: This should only be called! This is a subroutine, not a fully accessible block.
:: Magic Attack Logic
:: Determine the magic attack level based on castLvl and perform the magic attack
if %castLvl% == 6 (
    call :Level6MagicAttack
) else if %castLvl% == 5 (
    call :Level5MagicAttack
) else if %castLvl% == 4 (
    call :Level4MagicAttack
) else if %castLvl% == 3 (
    call :Level3MagicAttack
) else if %castLvl% == 2 (
    call :Level2MagicAttack
) else if %castLvl% == 1 (
    call :Level1MagicAttack
) else if %castLvl% == 0 (
    call :Level0MagicAttack
)
exit /b

:: enemy=%enemy%
:: canCast=0/1
:: castLvl=0-5
:: EcurrentHP=100
:: EmaxHP = 100
:: EcurrentEP = 100
:: EmaxEP = 100
:: Edmg=0/999999

:Level6MagicAttack
if %EcurrentEP% LSS 300 echo %enemy% attempted to use a forbidden spell, but is too weak! Take advantage of this! && exit /b
set /a EcurrentEP=%EcurrentEP% - 300
set /a crushDMG=%RANDOM% * 1000 / 32768 + 1
set /a currentHP=%currentHP% - %crushDMG%
set healthStatus=Battered
echo The ground rumbles around %enemy%, but then a meteor squashes you moments later.
echo You take %crushDMG% damage... ouch.
exit /b

:Level5MagicAttack
if %EcurrentEP% LSS 50 echo %enemy% attempted to cast a spell, but didn't have enough EP! && exit /b
set /a EcurrentEP=%EcurrentEP% - 50
set /a boltDMG=%RANDOM% * 500 / 32768 + 1
set /a currentHP=%currentHP% - %boltDMG%
set healthStatus=Burning
echo %enemy% summons an orbital death laser. BVVVVVTTT!!!
echo %enemy% does %boltDMG% damage to you, and sets you ablaze!
exit /b

:Level4MagicAttack
if %EcurrentEP% LSS 30 echo %enemy% attempted to cast a spell, but didn't have enough EP! && exit /b
set /a fireballDMG=%RANDOM% * 150 / 32768 + 1
set /a EcurrentEP=%EcurrentEP% - 30
set /a currentHP=%currentHP% - %fireballDMG%
set /a EcurrentHP=%EcurrentHP% + %fireballDMG%
set healthStatus=Burning
echo %enemy% summons a flurry of lifedrain fireballs!
echo You feel weaker on impact, not to mention you're burning.
echo %enemy% does %fireballDMG% damage to you and restores %fireballDMG% HP to itself!
exit /b

:Level3MagicAttack
if %EcurrentEP% LSS 25 echo %enemy% attempted to cast a spell, but didn't have enough EP! && exit /b
set /a EcurrentEP=%EcurrentEP% - 25
set /a mgkBurn=%RANDOM% * %EmaxHP% / 32768 + 1
if %mgkBurn% LSS 0 set /a mgkBurn=-%mgkBurn% && echo WHOA! Who are you fighting with THAT much HP!?
set /a CorrDMG=%RANDOM% * 50 / 32768 + 1
if %EhealthStatus% == Corrupted echo %enemy% twitches, reaching out suddenly and piercing your body! && echo You've been corrupted! && set healthStatus=Corrupted && set /a currentHP=%currentHP% - %CorrDMG% && exit /b
echo %enemy% casts a large mass of superheated air!
echo The heat burns your skin for %mgkBurn% damage.
set healthStatus=Burning
set /a currentHP=%currentHP% - %mgkBurn%
exit /b

:Level2MagicAttack
if %EcurrentEP% LSS 20 echo %enemy% attempted to cast a spell, but didn't have enough EP! && exit /b
:Level2RageBypass
set /a sickyDMG=%RANDOM% * %EmaxEP% / 32768 + 1
set /a testHP=%currentHP% - %sickyDMG%
set /a EcurrentEP=%EcurrentEP% - 20
echo %enemy% casts a sick spell!
echo You take %sickyDMG% damage!
if %testHP% LEQ 0 echo You vomit your innards, eyes bleary from the pain. && echo You take %sickyDMG% damage... && set currentHP=0 && exit /b
set /a currentHP=%currentHP% - %sickyDMG%
set healthStatus=Sick
exit /b

:Level1MagicAttack
if %EcurrentEP% LSS 15 echo %enemy% attempted to cast a spell, but didn't have enough EP! && exit /b
set /a EHeal=%RANDOM% * %EmaxHP% / 32768 + 1
set /a testEHP=%EcurrentHP% + %EHeal%
set /a EcurrentEP=%EcurrentEP% - 15
echo %enemy% casted a healing spell.
if %testEHP% GEQ %EmaxHP% set EcurrentHP=%EmaxHP% && echo %enemy% is fully healed && exit /b
set /a EcurrentHP=%EcurrentHP% + %Eheal%
echo %enemy% healed itself for %EHeal%!
exit /b

:Level0MagicAttack
if %EhealthStatus% == Sick goto Level0RageBypass
if %EcurrentEP% LSS 5 echo %enemy% attempted to cast a spell, but didn't have enough EP! && exit /b
:Level0RageBypass
set /a EcurrentEP=%EcurrentEP% - 5
if %EhealthStatus% == Sick echo The sickness growls and bolsters %enemy% into a small rage && goto Level2RageBypass
echo %enemy% casts a spell!
echo ...but it didn't do anything.
:: Magic Attack for level 0
:: Code for handling level 0 magic attack
exit /b

:: Level 1 magic


:: Level 2 magic

:: Level 3 magic

:: Level 4 magic

:: Level 5 magic