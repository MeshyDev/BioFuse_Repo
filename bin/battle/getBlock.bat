:: This should only be called! This is a subroutine, not a fully accessible block. 
:: I know my variable names are unintuitive, bite me
if %resetSwitch% == 3 exit /b
set /a BLOCKCHANCE=%blockcnce% + 10
set /a BLCKCHANCE=%blockcnce% + 5
set /a BLOCKRANDOM=%random% * %BLOCKCHANCE% / 32768 + 1
if %BLOCKRANDOM% == %blockcnce% echo You blocked %enemy%'s attack^! && set resetSwitch=1
if %BLOCKRANDOM% GTR %BLCKCHANCE% echo You parried slightly but still got nicked by %enemy%'s attack. && set resetSwitch=2
exit /b 