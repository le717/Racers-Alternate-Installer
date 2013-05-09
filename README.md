LEGO Racers Alternate Installer
==============================

An alternate installer for LEGO Racers, written with [Inno Setup](http://www.jrsoftware.org/isinfo.php) 
to replace the original 16-bit InstallShield installer.

This project uses code from [bgbennyboy](https://github.com/bgbennyboy)'s [Grim Fandango Setup](https://github.com/bgbennyboy/Grim-Fandango-Setup-and-Launcher)
to pull the files off the disc, modified by Triangle717 to support ANSI and Unicode Inno Setup.

This projetct also uses the *InstallShield v5.x Compression and Maintenance util* (`i5comp.exe`, `ZD51145.DLL`) to extract
the InstallShield CAB archive. It was taken from [*Universal Extractor*](legroom.net/software/uniextract) by [LegRoom.net](http://legroom.net).

In addition, this project contains [Python](http://python.org) scripts created by Triangle717, 
and frozen into 32-bit Windows Exes using Python 3.3.1 and [cx_Freeze](http://cx-freeze.sourceforge.net).
