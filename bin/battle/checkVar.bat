set nodesGained=0
set expGained=0

echo You claimed victory over %enemy%!
set /a levelBonusRAND=%RANDOM% * %level% / 32768 + 1
set /a levelBonus=%levelBonusRAND% * 2
set /a expGained=%RANDOM% * %EmaxHP% / 32768 + 1
set /a nodesGained=%RANDOM% * %EmaxHP% / 32768 + 1

if %expGained% LSS 0 set expGained=20000
if %nodesGained% LSS 0 set nodesGained=10000

set /a nodes=%nodes% + %nodesGained% + %levelBonus%
set /a exp=%exp% + %expGained% + %levelBonus%
echo You gained %expGained% experience and grabbed %nodesGained% nodes from the body!
echo Your exp is now %exp%/%expToNextLevel% and have %nodes% Nodes.
echo Bonus XP and Nodes was %levelBonus%
pause
cls
exit /b