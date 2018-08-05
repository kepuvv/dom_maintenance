@echo off

SET db="br_portal.nsf"
SET path_to_db="E:\IBM\Domino\Referentbr3\"

REM Start fixup
echo Starting fixup on database %db%

C:\IBM\Domino\nfixup.exe -F -J %path_to_db%%db%

echo Fixup on database %db% completed.

REM Start updall
echo Starting updall on database %db%

C:\IBM\Domino\nupdall.exe -X %path_to_db%%db%

echo Updall on database %db% completed at %time%

