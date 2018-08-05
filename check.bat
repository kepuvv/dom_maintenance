@ECHO OFF
SET SvcName=4game-servic

SC QUERYEX "%SvcName%" | FIND "STATE" && (
    SC QUERYEX "%SvcName%" | FIND "STATE" | FIND /v "RUNNING" && (
        ECHO %SvcName% is not running	 
        ECHO START %SvcName%

        NET START "%SvcName%" > NUL || (
            ECHO "%SvcName%" wont start
            EXIT /B 1
        )
        ECHO "%SvcName%" is started
        EXIT /B 0
    ) || (
        ECHO "%SvcName%" is running
        EXIT /B 0
    )
    ) || (
        ECHO "%SvcName%" NOT FOUND
        EXIT /B 1
    ) 
