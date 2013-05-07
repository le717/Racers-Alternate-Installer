#! /usr/bin/python
"""LEGO Racers Alternate Installer V1.0.1
Created 2013 Triangle717
<http://triangle717.wordpress.com/>
Contains source code from Grim Fandango Setup
Copyright (c) 2007-2008 Bgbennyboy
<http://quick.mixnmojo.com/>"""

# Deletes the LEGO Racers intro videos if uses choses that option during installation
import os
import sys

if (os.path.exists("lmicmp.avi")
        and os.path.exists("introcmp.avi")
        and os.path.exists("HVSCmp.avi")):

    # No need to catch PermissionError, this given Admin rights by the installer
    os.unlink("lmicmp.avi")
    os.unlink("introcmp.avi")
    os.unlink("HVSCmp.avi")
    sys.stdout.write("\nLEGO Racers intro videos were deleted")

else:
    sys.stdout.write("\nLEGO Racers intro videos were not deleted")
    
