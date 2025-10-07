:: This should only be called! This is a subroutine, not a fully accessible block. 
set /a halfHP=%currentHP% / 2
set /a CrrptDMG=%random% * %halfHP% / 32768 + 1
set /a burnDMG=%random% * (%halfHP% / 2) / 32768 + 1
set /a sickDMG=%random% * 10 / 32768 + 1
set /a batteredDMG=%random% * 4 / 32768 + 1 
set /a presidentialDMG=%CrrptDMG% + %sickDMG% + %batteredDMG%
:: BURNING -- EP induced long-period damage 
:: SICK -- Activates when enemy has sickness
:: BATTERED -- Only activates during low health
:: DYING -- Only activates during last 10 health 
:: CORRUPTED -- Activates on EP induced ability. Takes a random amount of HP based on half of your current HP.
set /a tossHP=%maxHP% / 3 
if %healthStatus% == Battered if %currentHP% GTR %tossHP% set healthStatus=Healthy
if %healthStatus% == Dying if %currentHP% GEQ 15 set healthStatus=Battered
if %healthStatus% == Healthy if %currentHP% GTR %maxHP% set healthStatus=Overhealed
if %currentHP% LEQ %tossHP% set healthStatus=Battered
if %currentHP% LEQ 10 set healthStatus=Dying
if %currentEP% GTR %maxEP% set healthStatus=Overcharged 
if %currentEP% LEQ %maxEP% set healthStatus=Healthy
if %currentEP% LSS 0 set healthStatus=Exhausted
:: Yes I'm aware this overrides EVERY status effect, this is fine.

if %healthStatus% == Burning echo You are currently on fire! The flames cause %burnDMG% damage to you. && set /a currentHP=%currentHP% - %burnDMG%
if %healthStatus% == Sick echo Your body feels gross, almost like it's imploding. && echo You take %sickDMG% damage due to sickness. && set /a currentHP=%currentHP% - %sickDMG%
if %healthStatus% == Battered echo You have sustained injuries, your movements cause && echo damage to yourself. You take %batteredDMG% damage! && set /a currentHP=%currentHP% - %batteredDMG%
if %healthStatus% == Dying echo Your injuries are fatal, if you don't escape or take && echo an HP potion, you will surely perish!
if %healthStatus% == God-like echo %lbnam% thought they were clever. && echo Despite that, they are godlike. They recover 10 health. && echo Overflow allowed! && set /a currentHP=%currentHP% + 10
if %healthStatus% == Overhealed echo You feel much more bolstered than usual.
if %healthStatus% == Corrupted echo You need to heal ASAP or you'll be Battered before you know it. && echo %CrrptDMG% damage taken. && set /a currentHP=%currentHP% - %CrrptDMG%
if %healthStatus% == Presidential-Corruption echo There's something utterly horrifying about this corruption. Seek medical attention immediately. && echo You take %presidentialDMG% damage. && set /a currentHP=%currentHP% - %presidentialDMG%
if %healthStatus% == Overcharged echo The EP potion you took is making your energy peel off your body like old paint. It hurts. && echo Both your EP and HP take %burnDMG% damage!! && set /a currentHP=%currentHP% - %burnDMG% && set /a currentEP=%currentEP% - %burnDMG%
if %healthStatus% == Exhausted echo Somehow you've slipped into Energy Debt. Take an EP potion!

exit /b