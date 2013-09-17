;  LEGO Racers Alternate Installer V1.0.2
;  Created 2013 Triangle717
;  <http://triangle717.wordpress.com/>
;  Contains source code from Grim Fandango Setup
;  Copyright (c) 2007-2008 Bgbennyboy
;  <http://quick.mixnmojo.com/>

; If any version below the specified version is used for compiling, 
; this error will be shown.
#if VER < EncodeVer(5,5,2)
  #error You must use Inno Setup 5.5.2 or newer to compile this script
#endif

#define MyAppInstallerName "LEGO® Racers Alternate Installer"
#define MyAppInstallerVersion "1.0.2"
#define MyAppName "LEGO® Racers"
#define MyAppNameNoR "LEGO Racers"
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
DefaultDirName={pf}\LEGO Media\Games\{#MyAppName}
DefaultGroupName=LEGO Media\{#MyAppNameNoR}
AllowNoIcons=yes
; Installer Graphics
SetupIconFile=Racers.ico
WizardImageFile=Sidebar.bmp
WizardSmallImageFile=Small-Image.bmp
WizardImageStretch=True
WizardImageBackColor=clBlack
; Location of the compiled Exe
OutputDir=Here Lie The EXE
OutputBaseFilename={#MyAppNameNoR} Alternate Installer {#MyInstallerVersion}
; Uninstallation stuff
UninstallFilesDir={app}
UninstallDisplayIcon={app}\Racers.ico
CreateUninstallRegKey=yes
UninstallDisplayName={#MyAppName}
; This is required so Inno can correctly report the installation size.
UninstallDisplaySize=112820029
; Compression
Compression=lzma2/ultra64
SolidCompression=True
InternalCompressLevel=ultra
LZMAUseSeparateProcess=yes
; From top to bottom:
; Explicitly set Admin rights, no other languages, do not restart upon finish.
PrivilegesRequired=admin
ShowLanguageDialog=no
RestartIfNeededByRun=no

[Languages]
Name: "English"; MessagesFile: "compiler:Default.isl"

[Messages]
BeveledLabel={#MyAppInstallerName} {#MyAppInstallerVersion}
; WelcomeLabel2 is overridden because I'm unsure if every LEGO Racers disc says 
; version 1.0.0.0 or just mine.
WelcomeLabel2=This will install [name] on your computer.%n%nIt is recommended that you close all other applications before continuing.
; DiskSpaceMBLabel is overridden because it reports an incorrect installation size.
DiskSpaceMBLabel=At least 107 MB of free disk space is required.

; Both Types and Components sections are required to create the installation options.
[Types]
Name: "Full"; Description: "Full Installation (With Movies)"  
Name: "Minimal"; Description: "Minimal Installation (Without Movies)"

[Components]
Name: "Full"; Description: "Full Installation (With Movies)"; Types: Full
Name: "Minimal"; Description: "Minimal Installation (Without Movies)"; Types: Minimal

[Files]
; Pull the game files off a standard LEGO Racers disc.
Source: "{code:GetSourceDrive}DATA1.CAB"; DestDir: "{app}"; Flags: external ignoreversion deleteafterinstall skipifsourcedoesntexist
Source: "{code:GetSourceDrive}DATA1.HDR"; DestDir: "{app}"; Flags: external ignoreversion deleteafterinstall skipifsourcedoesntexist
Source: "{code:GetSourceDrive}SETUPDIR\0009\Readme.txt"; DestDir: "{app}"; Flags: external ignoreversion skipifsourcedoesntexist

; Pull the game files off a Boys Only Club disc.
Source: "{code:GetSourceDrive}Lego Racers\data1.cab"; DestDir: "{app}"; Flags: external ignoreversion deleteafterinstall skipifsourcedoesntexist
Source: "{code:GetSourceDrive}Lego Racers\data1.hdr"; DestDir: "{app}"; Flags: external ignoreversion deleteafterinstall skipifsourcedoesntexist
Source: "{code:GetSourceDrive}Lego Racers\setupdir\0009\ReadMe.txt"; DestDir: "{app}"; Flags: external ignoreversion skipifsourcedoesntexist

; Manual and icon
Source: "Manual.pdf"; DestDir: "{app}"; Flags: ignoreversion skipifsourcedoesntexist
Source: "Racers.ico"; DestDir: "{app}"; Flags: ignoreversion

; Tool needed to extract the CAB
Source: "Tools\CABExtract\i5comp.exe"; DestDir: "{app}"; Flags: deleteafterinstall
Source: "Tools\CABExtract\ZD51145.DLL"; DestDir: "{app}"; Flags: deleteafterinstall

[Icons]
; First and last icons are created only if user choose not to use the videos, 
; else the normal ones are created.
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\Racers.ico";Comment: "Run LEGO Racers"; Components: Full
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\Racers.ico"; Parameters: "-novideo"; Comment: "Run LEGO Racers without Intro videos"; Components: Minimal
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"; IconFilename: "{app}\Racers.ico";
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\Racers.ico"; Comment: "Run LEGO Racers"; Components: Full; Tasks: desktopicon
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\Racers.ico"; Parameters: "-novideo"; Comment: "Run LEGO Racers without Intro videos"; Components: Minimal; Tasks: desktopicon

[Tasks]
; Create a desktop icon, run with administrator rights
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "Admin"; Description: "Run {#MyAppName} with Administrator Rights"; GroupDescription: "{cm:AdditionalIcons}"

[Registry]
; Registry strings are always hard-coded (!No ISPP functions!) to ensure everything works properly.
Root: "HKCU"; Subkey: "Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"; ValueType: string; ValueName: "{app}\LEGORacers.exe"; ValueData: "RUNASADMIN"; Flags: uninsdeletevalue; Tasks: Admin

[Run]
; From to to bottom: Extract the CAB, run game 
; (depending on user's choice on the videos).
Filename: "{app}\i5comp.exe"; Parameters: "x ""{app}\DATA1.CAB"""; Flags: runascurrentuser
Filename: "{app}\{#MyAppExeName}"; Flags: nowait postinstall skipifsilent runascurrentuser; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Components: Full
Filename: "{app}\{#MyAppExeName}"; Parameters: "-novideo"; Flags: nowait postinstall skipifsilent runascurrentuser; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Components: Minimal

[UninstallDelete]
; Because the files came from a CAB rather than [Files],
; this is needed to delete them.
Type: files; Name: "{app}\{#MyAppExeName}"
Type: files; Name: "{app}\*.tun"
; Deletes LEGORacers.icd if it exists; Does not throw error if it does not exist
Type: files; Name: "{app}\LEGORacers.icd"
Type: files; Name: "{app}\GolDP.dll"
Type: files; Name: "{app}\LEGO.JAM"
Type: files; Name: "{app}\*.avi"

[Dirs]
; Created to ensure the save games are not removed (which should never ever happen).
Name: "{app}\Save"; Flags: uninsneveruninstall

[Code]
// Pascal script from Bgbennyboy to pull files off a CD, greatly trimmed up 
// and modified to support ANSI and Unicode Inno Setup by Triangle717.
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
