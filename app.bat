@ECHO off
SETLOCAL enabledelayedexpansion

SET db="br_portal.nsf"
SET path_to_db="E:\IBM\Domino\ReferentBR3\"
SET IBM_path="C:\IBM\Domino\"

REM Set Domino services
SET services[0]=4game-service
SET services[1]=AppMgmt
SET services[2]=Audiosrv

REM Check if Domino Services still running

FOR /l %%i in (0,1,2) do (
	SC QUERY !services[%%i]! | FIND "STOPPED" > NUL
        IF errorlevel 1 (
        ECHO !services[%%i]! is still running.
        EXIT /b 1
		)
    )

REM Start maintenance

REM Start fixup
echo Starting fixup on database "%db%"...
"%IBM_path%"nfixup.exe -F -J "%path_to_db%""%db%"
echo Fixup on database "%db%" completed.

REM Start updall
echo Starting updall on database %db%...
"%IBM_path%"nupdall.exe -X "%path_to_db%""%db%"
echo Updall on database "%db%" completed.

REM Start compact
echo Starting compact on database %db%...
"%IBM_path%"ncompact.exe -b "%path_to_db%""%db%"
echo Compact on database "%db%" completed.

pause
