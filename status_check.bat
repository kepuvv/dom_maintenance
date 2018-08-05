REM https://blog.brankovucinec.com/2017/07/04/check-if-service-is-running-and-start-it-when-it-is-not-running/

@ECHO OFF
SET SvcName=4game-service

SC QUERYEX "%SvcName%" | FIND "STATE" | FIND /v "RUNNING" > NUL && 
(
    ECHO %SvcName% is not running	 
    ECHO START %SvcName%

    NET START "%SvcName%" > NUL || 
    (
        ECHO "%SvcName%" wont start 
        EXIT /B 1
    )
    ECHO "%SvcName%" is started
    EXIT /B 0
) || 
(
    ECHO "%SvcName%" is running
    EXIT /B 0
)

