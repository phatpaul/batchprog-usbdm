# batchprog-usbdm
A simple batch programming (Flash) script for Kinetis ARM microcontrollers (and a few others) using USBDM.  See supported chips at http://usbdm.sourceforge.net

Written in terrible old DOS CMD to minimize the prerequisites needed to install (just need USBDM installed).  Just launch the script directly from this repository.

[See requirements and usage instructions here.](FW-release/batchprog-usbdm/readme.md)

## Options
Set your programming options in the script batchprog-usbdm.cmd.  For example:
`SET PROGRAMMER=%PROGRAMMER% -target=arm -device=MKL05Z32M4 -vdd=3v3 -erase=mass -program -security=image -execute`
