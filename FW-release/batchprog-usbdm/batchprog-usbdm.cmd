@REM Script for assembly line programming of microcontroller using USBDM
@REM Source: github.com/phatpaul/progscript-usbdm
@ECHO OFF
SETLOCAL EnableDelayedExpansion

REM %CD% gives current dir, but 
SET THISDIR=%CD%
REM %~dp0 gives the directory of this batch file (with a trailing \)
SET SCRIPTDIR=%~dp0

SET PROGRAMMER="C:\Program Files (x86)\pgo\USBDM 4.12.1.240\UsbdmFlashProgrammer.exe"
SET PROGRAMMER2="C:\Program Files (x86)\pgo\USBDM 4.12.1.200\UsbdmFlashProgrammer.exe"

SET /a DUTNUMBER=1

IF /i NOT EXIST %PROGRAMMER% (
    ECHO Programmer %PROGRAMMER% does not exist, trying %PROGRAMMER2%.
    SET PROGRAMMER=%PROGRAMMER2%
    IF /i NOT EXIST !PROGRAMMER! (
        ECHO Programmer %PROGRAMMER% does not exist!.
        ECHO.
        ECHO Please see prerequisites here: %SCRIPTDIR%readme.md
        GOTO :DIE
    )
)
SET PROGRAMMER=%PROGRAMMER% -target=arm -device=MKL05Z32M4 -vdd=3v3 -erase=mass -program -security=image -execute

rem Restore the color of the screen
COLOR 07
CLS
ECHO USBDM Batch Programmer
ECHO/
ECHO In Directory:
ECHO  %THISDIR%
ECHO/
ECHO **************************************************************************
SET Index=0
FOR %%F IN (%THISDIR%\*.hex %THISDIR%\*.srec %THISDIR%\*.elf) DO (
    SET Selected.!Index!=%%~nxF
    ECHO !Index!: %%~nxF
    SET /A Index += 1
)
ECHO **************************************************************************
SET Selected=0
ECHO/
SET /P Selected= Choose a file to program [0]^>
IF "!Selected.%Selected%!"=="" GOTO :DIE
SET CHOICE=!Selected.%Selected%!

REM Restore the color of the screen
COLOR 07
ECHO/
ECHO/
ECHO/
ECHO/
ECHO/
ECHO/
ECHO/
ECHO/
ECHO/
ECHO/
ECHO/
ECHO/
ECHO/
ECHO/
ECHO/
ECHO/
ECHO/
ECHO/
:START
ECHO/
ECHO/
ECHO/
ECHO/
ECHO USBDM Batch Programmer
ECHO/
ECHO In Directory:
ECHO  %THISDIR%
ECHO/ 
ECHO Using file:
ECHO **************************************************************************
ECHO  %CHOICE%
ECHO **************************************************************************
ECHO/
SET /P Selected= Hit 'Enter' to Program device #%DUTNUMBER%^>

REM Restore the color of the screen
COLOR 07
ECHO/
ECHO/
ECHO Starting Programmer.  Please Wait...
ECHO/
ECHO/
ECHO/
ECHO/
ECHO/
ECHO/
CALL %PROGRAMMER% "%CHOICE%"
IF %ERRORLEVEL% NEQ 0 goto :FAILURE

:SUCCESS
REM Color the screen green
color 2f
ECHO *********************************
ECHO ***    Programming SUCCESS^^!   ***
ECHO *********************************
ECHO/
SET /a DUTNUMBER=%DUTNUMBER% + 1
goto :START

:FAILURE
REM Color the screen red
color 4f
ECHO *********************************
ECHO ***    Programming FAILURE^^!   ***
ECHO *********************************
ECHO/
goto :START

:DIE
REM Color the screen red
COLOR 4f
ECHO ERROR!
SET /P Selected='Enter' to exit^>
GOTO :QUIT

:QUIT
REM Restore the Color of the screen
COLOR 07
GOTO :eof
