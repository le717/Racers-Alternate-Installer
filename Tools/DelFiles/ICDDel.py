"""LEGO Racers Alternate Installer V1.0.1
Created 2013 Triangle717
<http://triangle717.wordpress.com/>
Contains source code from Grim Fandango Setup
Copyright (c) 2007-2008 Bgbennyboy
<http://quick.mixnmojo.com/>"""

# Deletes LEGORacers.icd upon uninstallation if it exists

import os
import sys

if os.path.exists("LEGORacers.icd"):
    os.unlink("LEGORacers.icd")
    sys.stdout.write("\nLEGORacers.icd was deleted")

else:
    sys.stdout.write("\nLEGORacers.icd was not found")
    
