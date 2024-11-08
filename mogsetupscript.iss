; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Eminence In Shadow: Master Of Garden"
#define MyAppVersion "1.0"
#define MyAppPublisher "RepackFromRiritoXXL"
#define MyAppExeName "mogLauncher.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{AF3A2888-BF14-4B40-A5C7-A76790168F22}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
LicenseFile=C:\Users\aqax\Downloads\BSD2Clause.sav
; Remove the following line to run in administrative install mode (install for all users.)
PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=commandline
OutputBaseFilename=masterofgardensetup
Compression=lzma
SolidCompression=yes
WizardStyle=modern
DiskSpanning=yes
DiskClusterSize=120
[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "japanese"; MessagesFile: "compiler:Languages\Japanese.isl"
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Code]
function BASS_Init(device: Integer; freq, flags: DWORD; win: hwnd; CLSID: Integer): Boolean;
external 'BASS_Init@files:bass.dll stdcall';
 
function BASS_StreamCreateFile(mem: BOOL; f: PAnsiChar; offset1: DWORD; offset2: DWORD; length1: DWORD; length2: DWORD; flags: DWORD): DWORD;
external 'BASS_StreamCreateFile@files:bass.dll stdcall';
 
function BASS_Start(): Boolean;
external 'BASS_Start@files:bass.dll stdcall';
 
function BASS_ChannelPlay(handle: DWORD; restart: BOOL): Boolean;
external 'BASS_ChannelPlay@files:bass.dll stdcall';

function BASS_Stop(): Boolean;
external 'BASS_Stop@files:bass.dll stdcall';
 
function BASS_Free(): Boolean;
external 'BASS_Free@files:bass.dll stdcall';
const
  BASS_SAMPLE_LOOP = 4;
var
  mp3Handle: HWND;
  mp3Name: string;
procedure InitializeWizard();
begin
    ExtractTemporaryFile('UnknownBrainControl.mp3');
    mp3Name := ExpandConstant('{tmp}\UnknownBrainControl.mp3');
    BASS_Init(-1, 48000, 0, 0, 0);
    mp3Handle := BASS_StreamCreateFile(FALSE, PAnsiChar(mp3Name), 0, 0, 0, 0, BASS_SAMPLE_LOOP);
    BASS_Start();
    BASS_ChannelPlay(mp3Handle, False);
end;
procedure DeinitializeSetup();
begin
  BASS_Free();
  BASS_Stop();
end;
[Files]
Source: "UnknownBrainControl.mp3"; DestDir: "{tmp}"; Flags: dontcopy ignoreversion
Source: "C:\Include_InnoSetup\bass.dll"; DestDir: {tmp}; Flags: dontcopy ignoreversion
Source: "F:\Program Files (x86)\Crunchyroll Games, LLC\MasterofGarden\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "F:\Program Files (x86)\Crunchyroll Games, LLC\MasterofGarden\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
