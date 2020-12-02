# batchprog-usbdm
A simple batch programming (Flash) script for Kinetis ARM microcontrollers (and a few others) using USBDM.  See supported chips at http://usbdm.sourceforge.net

## Set your programming options in the script batchprog-usbdm.cmd.  For example:
`SET PROGRAMMER=%PROGRAMMER% -target=arm -device=MKL05Z32M4 -vdd=3v3 -erase=mass -program -security=image -execute`