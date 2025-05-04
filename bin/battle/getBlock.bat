:: This should only be called! This is a subroutine, not a fully accessible block. 
set /a BLOCKCHANCE=%blockcnce% + 10
set /a BLOCKRANDOM=%random% * %BLOCKCHANCE% / 32768 + 1
if %BLOCKRANDOM% == %blockcnce% echo You blocked %enemy%'s attack^^! && set resetSwitch=1
exit /b 