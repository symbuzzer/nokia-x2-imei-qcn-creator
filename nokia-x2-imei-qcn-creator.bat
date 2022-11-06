@ECHO OFF
setlocal EnableDelayedExpansion
goto 7modifyimei

:7modifyimei
color f1
title Setting IMEI
mode con:cols=110 lines=4 > nul
del originalimeione.txt > nul
del modifiedimeione.txt > nul
del originalimeitwo.txt > nul
del modifiedimeitwo.txt > nul
del .\imei.hex > nul
del .\imei.qcn > nul
copy .\original.hex .\imei.hex
set /p stringimeihex=<.\imei.hex
cls
ECHO.
ECHO. Please Enter '1st' IMEI number and press ENTER:
set /P INPUTONE=
ECHO.!!INPUTONE! > originalimeione.txt
start /w "" ".\convertimei.exe" originalimeione.txt modifiedimeione.txt
set /p stringimeione=<modifiedimeione.txt
fart .\imei.hex 787878787878787878 !!stringimeione!
cls
ECHO.
ECHO. Please Enter '2nd' IMEI number and press ENTER:
set /P INPUTTWO=
ECHO.!!INPUTTWO! > originalimeitwo.txt
start /w "" ".\convertimei.exe" originalimeitwo.txt modifiedimeitwo.txt
set /p stringimeitwo=<modifiedimeitwo.txt
fart .\imei.hex 7A7A7A7A7A7A7A7A7A !!stringimeitwo!
color f0
cls
ECHO.
ECHO. Creating 'imei.qcn', please wait...
ECHO.
set /p asciiimei=<.\imei.hex
start /w sfk filter .\imei.hex +hextobin .\imei.qcn
cls
ECHO.
ECHO. Please select output folder...
ECHO.
rem BrowseFolder
goto 7modifyimei2

:7modifyimei2
cls
color f0
mode con:cols=110 lines=5 > nul
ECHO.
ECHO. 'imei.qcn' saved
ECHO.
timeout /nobreak 5
del originalimeione.txt > nul
del modifiedimeione.txt > nul
del originalimeitwo.txt > nul
del modifiedimeitwo.txt > nul
del .\imei.hex > nul
goto 7wrapper

:7wrapper
exit