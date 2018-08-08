@ECHO off
SETLOCAL enabledelayedexpansion

SET db=
SET path_to_db=
SET IBM_path=

REM Set Domino services
SET services[0]=
SET services[1]=
SET services[2]=

REM Check if Domino Services still running

FOR /l %%i in (0,1,2) do (
	SC QUERY !services[%%i]! | FIND "STOPPED" > NUL
        IF errorlevel 1 (
        ECHO !services[%%i]! is still running.
        PAUSE
        EXIT /b 1
		)
    )

REM Start maintenance

REM Start fixup
ECHO Starting fixup on database %db%...
%IBM_path%nfixup.exe -F -J %path_to_db%%db%
ECHO Fixup on database %db% completed.

REM Start updall
ECHO Starting updall on database %db%...
%IBM_path%nupdall.exe -X %path_to_db%%db%
ECHO Updall on database %db% completed.

REM Start compact
ECHO Starting compact on database %db%...
%IBM_path%ncompact.exe -b %path_to_db%%db%
ECHO Compact on database %db% completed.

PAUSE
