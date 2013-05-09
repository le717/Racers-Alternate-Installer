;  LEGO Racers Alternate Installer V1.0.1
;  Created 2013 Triangle717
;  <http://triangle717.wordpress.com/>
;  Contains source code from Grim Fandango Setup
;  Copyright (c) 2007-2008 Bgbennyboy
;  <http://quick.mixnmojo.com/>
;  and original Python 3.3 Exes by le717

; If any version below the specified version is used for compiling, this error will be shown.
#if VER < EncodeVer(5,5,2)
  #error You must use Inno Setup 5.5.2 or newer to compile this script
#endif

#define MyAppInstallerName "LEGO Racers Alternate Installer"
#define MyAppInstallerVersion "1.0.1"
#define MyAppName "LEGO Racers"
#define MyAppVersion "1.0.0.0"
#define MyAppPublisher "LEGO Media"
#define MyAppExeName "LEGORacers.exe"

[Setup]
AppID={#MyAppInstallerName}{#MyAppInstallerVersion}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
VersionInfoVersion={#MyAppInstallerVersion}
AppPublisher={#MyAppPublisher}
AppCopyright=© 1997 {#MyAppPublisher}
LicenseFile=license.txt
; Start menu/screen and Desktop shortcuts
DefaultDirName={pf}\LEGO Media\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
; Installer Graphics
SetupIconFile=Racers.ico
WizardImageFile=LEGO Racers Sidebar.bmp
WizardSmallImageFile=InnoSetup LEGO Logo.bmp
WizardImageStretch=True
WizardImageBackColor=clBlack
; Location of the compiled EXE
OutputDir=Here Lie The EXE
OutputBaseFilename={#MyAppInstallerName} {#MyAppInstallerVersion}
; Uninstallation stuff
UninstallFilesDir={app}
UninstallDisplayIcon={#MyAppExeName}
CreateUninstallRegKey=yes
UninstallDisplayName={#MyAppName}
; Compression
SolidCompression=True
InternalCompressLevel=ultra
; From top to bottom: Allows installation to C:\ (and the like),
; Expliscy set Admin rights, no other languages, do not restart upon finishing.
AllowRootDirectory=yes
PrivilegesRequired=admin
ShowLanguageDialog=no
RestartIfNeededByRun=no

[Languages]
Name: "English"; MessagesFile: "compiler:Default.isl"

[Messages]
English.BeveledLabel={#MyAppInstallerName} {#MyAppInstallerVersion}
; English.WelcomeLabel2 is overridden because I'm unsure if every LEGO Racers disc says version 1.0.0.0 or just mine.
English.WelcomeLabel2=This will install [name] on your computer.%n%nIt is recommended that you close all other applications before continuing.
; English.DiskSpaceMBLabel is disabled because it reports an incorrect installation size.
English.DiskSpaceMBLabel=

; Both Types and Components sections are required to create the installation options.
[Types]
Name: "Full"; Description: "Full Installation (With Movies)"  
Name: "Minimal"; Description: "Minimal Installation (Without Movies)"

[Components]
Name: "Full"; Description: "Full Installation (With Movies)"; Types: Full
Name: "Minimal"; Description: "Minimal Installation (Without Movies)"; Types: Minimal

[Files]
; Pull the game files off a standard LEGO Racers disc.
Source: "{code:GetSourceDrive}DATA1.CAB"; DestDir: "{app}"; Flags: external ignoreversion deleteafterinstall skipifsourcedoesntexist; Components: Full Minimal
Source: "{code:GetSourceDrive}DATA1.HDR"; DestDir: "{app}"; Flags: external ignoreversion deleteafterinstall skipifsourcedoesntexist; Components: Full Minimal
Source: "{code:GetSourceDrive}SETUPDIR\0009\Readme.txt"; DestDir: "{app}"; Flags: external ignoreversion skipifsourcedoesntexist; Components: Full Minimal

; Pull the game files off a Boys Only Club disc.
Source: "{code:GetSourceDrive}Lego Racers\data1.cab"; DestDir: "{app}"; Flags: external ignoreversion deleteafterinstall skipifsourcedoesntexist; Components: Full Minimal
Source: "{code:GetSourceDrive}Lego Racers\data1.hdr"; DestDir: "{app}"; Flags: external ignoreversion deleteafterinstall skipifsourcedoesntexist; Components: Full Minimal
Source: "{code:GetSourceDrive}Lego Racers\setupdir\0009\ReadMe.txt"; DestDir: "{app}"; Flags: external ignoreversion skipifsourcedoesntexist; Components: Full Minimal

; Manual and icon
Source: "Manual.pdf"; DestDir: "{app}"; Flags: ignoreversion skipifsourcedoesntexist; Components: Full Minimal
Source: "Racers.ico"; DestDir: "{app}"; Flags: ignoreversion; Components: Full Minimal

; Tool needed to extract the CAB
Source: "Tools\CABExtract\i5comp.exe"; DestDir: "{app}"; Flags: deleteafterinstall; Components: Full Minimal
Source: "Tools\CABExtract\ZD51145.DLL"; DestDir: "{app}"; Flags: deleteafterinstall; Components: Full Minimal

; Original tools to delete LEGORacers.icd and the videos (the latter under certain conditions).
Source: "Tools\DelFiles\VideoDel.exe"; DestDir: "{app}\Uninstall"; Flags: deleteafterinstall; Components: Full Minimal
Source: "Tools\DelFiles\ICDDel.exe"; DestDir: "{app}\Uninstall"; Flags: uninsrestartdelete; Components: Full Minimal
Source: "Tools\DelFiles\_bz2.pyd"; DestDir: "{app}\Uninstall"; Flags: uninsrestartdelete; Components: Full Minimal
Source: "Tools\DelFiles\python33.dll"; DestDir: "{app}\Uninstall"; Flags: uninsrestartdelete; Components: Full Minimal
Source: "Tools\DelFiles\unicodedata.pyd"; DestDir: "{app}\Uninstall"; Flags: uninsrestartdelete; Components: Full Minimal

[Icons]
; First and last icons are created only if user choose not to install the  videos, else the normal ones are created.
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Comment: "Run LEGO Racers"; Components: Full
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Comment: "Run LEGO Racers without Intro videos"; Parameters: "-novideo"; Components: Minimal
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Comment: "Run LEGO Racers"; Components: Full; Tasks: desktopicon
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Parameters: "-novideo"; Comment: "Run LEGO Racers without Intro videos"; Components: Minimal; Tasks: desktopicon

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "Admin"; Description: "Run {#MyAppName} with Administrator Rights"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Registry]
; Registry strings are always hard-coded (No Define functions) to ensure everything works properly.
Root: "HKCU"; Subkey: "Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"; ValueType: string; ValueName: "{app}\LEGORacers.exe"; ValueData: "RUNASADMIN"; Flags: uninsdeletevalue; Tasks: Admin

[Run]
; From to to bottom: Extract the CAB, delete the videos (if selected), run game (depending on user's choice on the videos).
Filename: "{app}\i5comp.exe"; Parameters: "x ""{app}\DATA1.CAB"""; Flags: runascurrentuser
; Is original Python 3 EXE hardcoded to delete the three AVI files.
Filename: "{app}\Uninstall\VideoDel.exe"; Parameters: """{app}"""; Flags: runascurrentuser; Components: Minimal
Filename: "{app}\{#MyAppExeName}"; Flags: nowait postinstall skipifsilent; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Components: Full
Filename: "{app}\{#MyAppExeName}"; Parameters: "-novideo"; Flags: nowait postinstall skipifsilent; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Components: Minimal

[UninstallDelete]
; Because the files came from a CAB were not installed from [Files], this is needed to delete the files.
Type: files; Name: "{app}\{#MyAppExeName}"; Components: Full Minimal
Type: files; Name: "{app}\*.tun"; Components: Full Minimal
Type: files; Name: "{app}\GolDP.dll"; Components: Full Minimal
Type: files; Name: "{app}\LEGO.JAM"; Components: Full Minimal
Type: files; Name: "{app}\lmicmp.avi"; Components: Full
Type: files; Name: "{app}\introcmp.avi"; Components: Full
Type: files; Name: "{app}\HVSCmp.avi"; Components: Full
Type: filesandordirs; Name: "{app}\Uninstall"; Components: Full Minimal

[UninstallRun]
; Is original Python 3 EXE hardcodded to delete LEGORacers.icd at uninstallation if it exists
Filename: "{app}\Uninstall\ICDDel.exe"; Parameters: """{app}"""; Components: Full Minimal

[Dirs]
; It has to be created to ensure the save games are not removed (which should never ever happen).
Name: "{app}\Save"; Flags: uninsneveruninstall

[Code]
// Pascal script from Bgbennyboy to pull files off a CD, greatly trimmed up and modified to support ANSI and Unicode Inno Setup by Triangle717.
var
	SourceDrive: string;

#include "FindDisc.iss"

function GetSourceDrive(Param: String): String;
begin
	Result:=SourceDrive;
end;

procedure InitializeWizard();
begin
	SourceDrive:=GetSourceCdDrive();
end;
