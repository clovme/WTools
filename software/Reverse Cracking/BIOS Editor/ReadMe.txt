---------------------------------------------------------------------------------
		Phoenix BIOS Editor 2.2.0.1 for Windows 98/NT/2K/XP/VISTA
		   (c) 1985-2006 Phoenix Technologies Ltd.

	The powerful tool to customize Phoenix BIOSes without source code
---------------------------------------------------------------------------------


Known Issues
============
 1. 'ACPI Editor' may not function on some Windows 98 systems. The symptom is:
    When activating the 'ACPI Editor' window, the application only shows 
    'Disassembling ASL....' message but the ACPI window never shows up

 2. Image corruption may occur when using 256-color mode. Setting the video to
    256-color mode, press 'Paste' button on the 'Quiet Boot/Splash Screen'
    window, will result in a corrupted image.

 3. In Vista32/64,User must Disable UAP (Disable User Account Protection). Execute it directly may not run correctly.
     Step1: Run "msconfig" in command windows
     Step2: Tools panel-->Disable UAP (Disable User Account Protection (Requires reboot))-->click Launch button.
     Step3: Reboot.


More Explanation For Various Messages
=====================================
Q: An unsupported module class 'X' was found at offset XXXX....
A: BIOS Editor found a BIOS module with a class type which is not in the
   'ROM Maker Suite' specification or the ROM may be corrupt.  If you select
   continue and the ROM loads successfully, then it can be modified by BIOS
   Editor, with the exception of the unsupported module class, and the message
   can be ignored. An unsupported module class cannot be edited by BIOS Editor

Q: BCP doesn't fit the configuration file....
A: All BCP structures are examined by a configuration file (BCPDEFS.DAT).  This
   file contains the latest information when released.  However, a newer BIOS
   may contain additional BCP structures and may require an updated
   configuration file.
   Modifications should not be made to the identified BCP fields unless the
   configuration file has been updated.  However, if modifications are only
   made to other/supported BCP fields, then the message can be ignored.

Q: 16-bit/32-bit PCI Routing Table Mismatch!...
A: This could be caused by a corrupt ROM image.  However, the most
   possible cause is: two versions (1.73 & 1.74) of PTLPCI.INC (Phoenix's 
   source code control revision) breaks BIOS Editor.  If you need to modify the
   PCI routing table, this would require a new ROM image by updating PTLPCI.INC
   to be version 1.72 and below or 1.75 and above.  When you see this message,
   the PCI routing table editor should not be used.  However, if modifications
   to the PCI routing table are not required, then the message can be ignored.


Reporting Bugs, Comments
========================
We are always anxious to hear your comments. If you experience any bugs,
please let us know.

	Email:	custsupport@phoenix.com
	Web:	http://www.phoenix.com/
