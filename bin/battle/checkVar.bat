set nodesGained=0
set expGained=0

echo You claimed victory over %enemy%!
set /a expGained=%RANDOM% * %EmaxHP% / 32768 + 1
set /a nodesGained=%RANDOM% * %EmaxHP% / 32768 + 1

set /a nodes=%nodes% + %nodesGained%
set /a exp=%exp% + %expGained%
echo You gained %expGained% experience and grabbed %nodesGained% nodes from the body!
echo You now have %exp% and %nodes%
pause
cls
exit /b