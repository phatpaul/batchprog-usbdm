USBDM Batch Programmer
===
Script for assembly line programming of microcontrollers using USBDM

### Prerequisites

- FRDM-KL25Z board
https://www.digikey.com/product-detail/en/freescale-semiconductor-nxp/FRDM-KL25Z/FRDM-KL25Z-ND/3529594?WT.srch=1

- Convert FRDM-KL25Z for use with USBDM
http://usbdm.sourceforge.net/USBDM_V4.12/Freedom/html/freedom_setup.html
10-pin header : Samtec Inc. FTSH-105-01-F-D-K 
10-pin programming cable: Samtec Inc. FFSD-05-D-06.00-01-N 

- Install USBDM 4.12.1.240 on Windows PC
From: http://usbdm.sourceforge.net ```"USBDM_4_12_1_240_Win.msi"```

(note: if installed version is different, you may have to edit the path to the programmer executable in batchprog-usbdm.cmd: 
`SET PROGRAMMER="C:\Program Files (x86)\pgo\USBDM 4.12.1.240\UsbdmFlashProgrammer.exe"` )

- Install USBDM Drivers on Windows PC
From: http://usbdm.sourceforge.net ```"USBDM_Drivers_4_12_3_Win_x64.msi"```

### Setup
0.  Obtain,Modify,Install prerequisites.  See section above.
1.  Git this repository:
```
C:\>cd C:\repos

C:\repos>git clone https://github.com/phatpaul/progscript-usbdm.git
```

2. Navigate to the release folder.  i.e. ```C:\repos\progscript-usbdm\FW-release\my_firmware_v01\```
   Execute the script.  (double-click in Windows Explorer) ```_RUN_ME__Batch_Programming_USBDM.cmd```

```
USBDM Batch Programmer

In Directory:
 C:\repos\progscript-usbdm\FW-release\my_firmware_v01

**************************************************************************
0: my_firmware_v01_BLANK_EXAMPLE.hex
**************************************************************************

Choose a file to program [0]>

```
3.  Choose the appropriate .srec file from the list.

```
Hit 'Enter' to Program device #1>
```
4.  Hit the 'Enter' key to program a device.  
5.  When programming is complete, you should see: 
```
*********************************
***    Programming SUCCESS!   ***
*********************************
```
6.  Repeat programming next device by hitting 'Enter' key.
