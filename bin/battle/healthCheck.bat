:: This should only be called! This is a subroutine, not a fully accessible block. 
set /a halfHP=%currentHP% / 2
set /a CrrptDMG=%random% * %halfHP% / 32768 + 1
set /a burnDMG=%random% * 10 / 32768 + 1
set /a sickDMG=%random% * 10 / 32768 + 1
set /a batteredDMG=%random% * 4 / 32768 + 1 
set /a presidentialDMG=%CrrptDMG% + %burnDMG% + %sickDMG% + %batteredDMG%
:: BURNING -- EP induced long-period damage 
:: SICK -- Activates when enemy has sickness
:: BATTERED -- Only activates during low health
:: DYING -- Only activates during last 10 health 
:: CORRUPTED -- Activates on EP induced ability. Takes a random amount of HP based on half of your current HP.
set /a tossHP=%maxHP% / 3 
if %healthStatus% == Healthy if %currentHP% GEQ %tossHP% set healthStatus=Healthy
if %healthStatus% == Healthy if %currentHP% GTR %maxHP% set healthStatus=Overhealed
if %currentHP% LEQ %tossHP% set healthStatus=Battered
if %currentHP% LEQ 10 set healthStatus=Dying

if %healthStatus% == Burning echo You are currently in flames! It does %burnDMG% damage to you. && set /a currentHP=%currentHP% - %burnDMG%
if %healthStatus% == Sick echo Your body feels gross, almost like it's imploding. && echo You take %sickDMG% damage due to sickness. && set /a currentHP=%currentHP% - %sickDMG%
if %healthStatus% == Battered echo You have sustained injuries, your movements cause && echo damage to yourself. You take %batteredDMG% damage! && set /a currentHP=%currentHP% - %batteredDMG%
if %healthStatus% == Dying echo Your injuries are fatal, if you don't escape or take && echo an HP potion, you will surely perish!
if %healthStatus% == God-like echo %lbnam% thought they were clever. && echo Despite that, they are godlike. They recover 10 health. && echo Overflow allowed! && set /a currentHP=%currentHP% + 10
if %healthStatus% == Overhealed echo You feel much more bolstered than usual.
if %healthStatus% == Corrupted echo You need to heal ASAP or you'll be Battered before you know it. && echo %CrrptDMG% damage taken. && set /a currentHP=%currentHP% - %CrrptDMG%
if %healthStatus% == Presidential-Corruption echo There's something utterly horrifying about this corruption. Seek medical attention immediately. && echo You take %presidentialDMG% damage. && set /a currentHP=%currentHP% - %presidentialDMG%
exit /b