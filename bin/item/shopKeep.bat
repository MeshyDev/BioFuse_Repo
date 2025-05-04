:: Lightly now...

if %resetSwitch% == 1 (
    if %weaponone% == 1 (echo Sorry, you already have that item! && pause && set resetSwitch=0 && exit /b) else (if %Nodes% LSS 150 (echo You cannot afford that item! && pause && set resetSwitch=0 && exit /b) else (set /a Nodes=%Nodes% - 150 && set weaponone=1 && echo Purchase successful. && pause && set resetSwitch=0 && exit /b))
)

if %resetSwitch% == 2 (
    if %weapontwo% == 1 (echo Sorry, you already have that item! && pause && set resetSwitch=0 && exit /b) else (if %Nodes% LSS 550 (echo You cannot afford that item! && pause && set resetSwitch=0 && exit /b) else (set /a Nodes=%Nodes% - 550 && set weapontwo=1 && echo Purchase successful. && pause && set resetSwitch=0 && exit /b))
)

if %resetSwitch% == 3 (
    if %weaponthree% == 1 (echo Sorry, you already have that item! && pause && set resetSwitch=0 && exit /b) else (if %Nodes% LSS 1500 (echo You cannot afford that item! && pause && set resetSwitch=0 && exit /b) else (set /a Nodes=%Nodes% - 1500 && set weaponthree=1 && echo Purchase successful. && pause && set resetSwitch=0 && exit /b))
)

if %resetSwitch% == 4 (
    if %weaponfour% == 1 (echo Sorry, you already have that item! && pause && set resetSwitch=0 && exit /b) else (if %Nodes% LSS 5000 (echo You cannot afford that item! && pause && set resetSwitch=0 && exit /b) else (set /a Nodes=%Nodes% - 5000 && set weaponfour=1 && echo Purchase successful. && pause && set resetSwitch=0 &&  exit /b))
)

if %resetSwitch% == 5 (
    if %Nodes% LSS 150 (echo You cannot afford that item! && set resetSwitch=0 && pause && exit /b) else (set /a Nodes=%Nodes% - 150 && set /a hppot=%hppot% + 1 && echo Purchase successful. && set resetSwitch=0 && pause && exit /b)
)

if %resetSwitch% == 6 (
    if %Nodes% LSS 200 (echo You cannot afford that item! && set resetSwitch=0 && pause && exit /b) else (set /a Nodes=%Nodes% - 200 && set /a eppot=%eppot% + 1 && echo Purchase successful. && set resetSwitch=0 && pause && exit /b)
)

if %resetSwitch% == 7 (
    if %weaponfive% == 1 (echo Sorry, you already have that item! && pause && set resetSwitch=0 && exit /b) else (if %Nodes% LSS 10000 (echo You cannot afford that item! && pause && set resetSwitch=0 && exit /b) else (set /a Nodes=%Nodes% - 10000 && set weaponfive=1 && echo Purchase successful. && pause && set resetSwitch=0 && exit /b))
)

exit /b
:: I would like to point out that I wasn't expecting it to work so well.