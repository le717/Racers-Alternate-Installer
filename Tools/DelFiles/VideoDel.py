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

folder_path = sys.argv[1]

if (os.path.exists(os.path.join(folder_path, "lmicmp.avi"))
        and os.path.exists(os.path.join(folder_path, "introcmp.avi"))
        and os.path.exists(os.path.join(folder_path, "HVSCmp.avi"))):

    # No need to catch PermissionError, this given Admin rights by the installer
    os.unlink(os.path.join(folder_path, "lmicmp.avi"))
    os.unlink(os.path.join(folder_path, "introcmp.avi"))
    os.unlink(os.path.join(folder_path, "HVSCmp.avi"))
    sys.stdout.write('\nLEGO Racers intro videos were deleted from\n"{0}"\n'.format(folder_path))

else:
    sys.stdout.write('\nLEGO Racers intro videos were not deleted from\n"{0}"\n'.format(folder_path))
    