set /a enemyFind=%Random% * 5 / 32768 + 1
set /a enemyHS=%RANDOM% * 100 / 32768 + 1

if %enemyHS% LEQ 65 set EhealthStatus=Healthy
if %enemyHS% GEQ 67 set EhealthStatus=Sick
if %enemyHS% == 66 set EhealthStatus=Burning

if %enemyFind%==1 (
set enemy=Prarie Dog
set EcurrentHP=20
set EmaxHP=20
set EcurrentEP=10
set EmaxEP=10
set Edmg=5
)
if %enemyFind%==2 (
set enemy=Bird
set EcurrentHP=25
set EmaxHP=25
set EcurrentEP=30
set EmaxEP=30
set Edmg=7
)
if %enemyFind%==3 (
set enemy=Small Ground Hog
set EcurrentHP=35
set EmaxHP=35
set EcurrentEP=20
set EmaxEP=20
set Edmg=7
)
if %enemyFind%==4 (
set enemy=Ground Hog
set EcurrentHP=50
set EmaxHP=50
set EcurrentEP=70
set EmaxEP=70
set Edmg=11
)
if %enemyFind%==5 (
set enemy=Hyena
set EcurrentHP=75
set EmaxHP=75
set EcurrentEP=100
set EmaxEP=100
set Edmg=13
)
if %enemyFind%==6 (
set enemy=Giant ###RARE###
set EcurrentHP=100
set EmaxHP=100
set EcurrentEP=100
set EmaxEP=100
set Edmg=14
)
set enemyFind=0
exit /b