@REM Script for assembly line programming of microcontroller using USBDM
@REM Source: github.com/phatpaul/progscript-usbdm
@ECHO OFF
SETLOCAL EnableDelayedExpansion

REM %CD% gives current dir
SET THISDIR=%CD%
REM %~dp0 gives the directory of this batch file (with a trailing \)
SET SCRIPTDIR=%~dp0

SET PROGRAMMER=%SCRIPTDIR%..\batchprog-usbdm\batchprog-usbdm.cmd
CALL %PROGRAMMER%