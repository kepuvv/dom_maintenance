@ECHO OFF
SET SvcName=4game-service

SC QUERYEX "%SvcName%" | FIND "STATE" > NUL && (
    SC QUERYEX "%SvcName%" | FIND "STATE" | FIND /v "RUNNING" > NUL && (
        ECHO "%SvcName%" is not running	 
        ECHO START "%SvcName%"...

        NET START "%SvcName%" > NUL || (
            ECHO "%SvcName%" wont start
            EXIT /B 1
        )
        ECHO "%SvcName%" is started
        EXIT /B 0
    ) || (
        ECHO "%SvcName%" is running
            ECHO Go to stopping "%SvcName%"...
            NET STOP "%SvcName%"
                :loop
                sc query "%SvcName%" | find "STOPPED" > NUL
                if errorlevel 1 (
                timeout 1
                goto loop
                )
        ECHO "%SvcName%" has STOPPED.
        EXIT /B 0
    )
    ) || (
        ECHO "%SvcName%" NOT FOUND
        EXIT /B 1
    ) 
