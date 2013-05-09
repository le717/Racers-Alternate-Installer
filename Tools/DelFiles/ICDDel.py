#! /usr/bin/python
"""LEGO Racers Alternate Installer V1.0.1
Created 2013 Triangle717
<http://triangle717.wordpress.com/>

This script deletes LEGORacers.icd upon uninstallation if it exists"""


import os
import sys

folder_path = sys.argv[1]
    
if os.path.exists(os.path.join(folder_path, "LEGORacers.icd")):
    os.unlink(os.path.join(folder_path, "LEGORacers.icd"))
    sys.stdout.write('\nLEGORacers.icd was deleted from\n"{0}"\n'.format(folder_path))
else:
    sys.stdout.write('\nLEGORacers.icd was not found in\n"{0}"\n'.format(folder_path))
