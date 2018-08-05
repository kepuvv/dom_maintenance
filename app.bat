@echo off

SET db="br_portal.nsf"
SET path_to_db="E:\IBM\Domino\Referentbr3\"

REM Start fixup
echo Starting fixup on database %db%...

C:\IBM\Domino\nfixup.exe -F -J %path_to_db%%db%

echo Fixup on database %db% completed.

REM Start updall
echo Starting updall on database %db%...

C:\IBM\Domino\nupdall.exe -X %path_to_db%%db%

echo Updall on database %db% completed.

REM Start compact
echo Starting compact on database %db%...

C:\IBM\Domino\ncompact.exe -b %path_to_db%%db%

echo Compact on database %db% completed.

pause
