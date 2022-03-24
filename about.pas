unit about;

{$mode objfpc}{$H+}
// for online function
// use synapse40 component
// information in http://synapse.ararat.cz/





interface

uses
  Windows, Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, fpjson, jsonparser, fphttpclient, httpsend;

type

  { TForm_About }

  TForm_About = class(TForm)
    Copyright1: TLabel;
    Copyright2: TLabel;
    Image1:     TImage;
    Label1:     TLabel;
    Label_online_ver: TLabel;
    Label_Ver:  TLabel;
    Panel1:     TPanel;
    ProgramName: TLabel;
    procedure Copyright2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label_VerClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form_About: TForm_About;
  file_name, s_version, s_website: string;
  Source_DIR: string; // ='http://intretech-tw.synology.me/NAS_file_Share/';     common position + foldername (app name)
  app_name:   string;

const
  DestFile    = 'index.json';
  Source_INFO = 'index.json';

function get_onlin_info: boolean;
procedure ShowAboutBox;
function GetFileVersion(const sFilename: string; var nValue1, nValue2, nValue3, nValue4: integer; var version_String: string): string;

implementation

{$R *.lfm}

{ TForm_About }

function get_onlin_info: boolean;

var
  // s: Ansistring;
  LStrings:   TStringList;
  JSonObject: TJSonObject;
  JSonValue:  TJSONData;
  s_web:      string;
  //s: TStringList;
begin
  Result := False;
  //  if DownloadFile(Source_DIR + Source_INFO, DestFile) then
  //TFPHttpClient.SimpleGet('http://forum.lazarus.freepascal.org//', s);

  //ShowMessage(LStrings[0]); // <!DOCTYPE html...
  s_web    := Source_DIR + Source_INFO;
  LStrings := TStringList.Create;
  try
    TFPHttpClient.SimpleGet(s_web, LStrings);

      {
        "file_Name": "Inf_to_Test_Scrip.zip",
        "version": "20.21.5.25",
        "website": "http://wiki.intretech.com:8090/display/TWNCO/Software%3A+Image_crop"
      }

    JSonObject := TJSonObject.Create;
    JSonValue  := GetJSON(LStrings.Text);
    JSonObject := TJSONObject(JSonValue);
    file_name  := JSonObject.Get('file_name');
    s_version  := JSonObject.Get('version');
    s_website  := JSonObject.Get('website');

    Result := True;
  finally
    LStrings.Free;
  end;

end;


procedure TForm_About.FormCreate(Sender: TObject);
var
  v1, v2, v3, v4: integer;
  s:          string;
  cur_handle: HWND;

begin
  file_name  := ExtractFileName(Application.ExeName); // xxx.exe
  app_name   := copy(ExtractFileName(Application.ExeName), 1, length(ExtractFileName(Application.ExeName)) - 4); // without exe
  Source_DIR := 'http://intretech-tw.synology.me/NAS_file_Share/' + app_name + '/';
  Caption    := Format('About %s', [app_name]);


  //application.ExeName + '         Ver: ' +
  //getfileversion(application.ExeName, v1, v2, v3, v4);

  Caption    := Format('About %s', [Application.Title]);
  //  Image1.Picture.Assign(Application.Icon);
  cur_handle := LoadImage(MainInstance, 'MAINICON', IMAGE_ICON, 128, 128, 0);
  Image1.Picture.Icon.Handle := cur_handle; // gets the 64x64 icon


  ProgramName.Caption := application.ExeName; //Application.Title;
  Label1.Caption      := ExtractFileName(application.ExeName);
  Label_Ver.Caption   := 'Ver: ' + getfileversion(application.ExeName, v1, v2, v3, v4, s);
  //UpdateDate.caption := DateTimeToStr(FileDateToDateTime(FileAge(Application.ExeName)));
  //Animate1.Play(1,19,100);

//  memo1.Lines.Add(Source_DIR + Source_INFO);
  get_onlin_info;
//  memo1.Lines.Add(file_name);
//  memo1.Lines.Add(s_version);
//  memo1.Lines.Add(s_website);

  Label_Ver.ShowHint := True;
  Label_Ver.Hint     := 'Online: ' + file_name + sLineBreak + 'version: ' + s_version + sLineBreak + 'website: ' + s_website + sLineBreak + 'Click to download file';
  Label_online_ver.caption :='Online version: '+ s_version ;
end;

procedure TForm_About.Label_VerClick(Sender: TObject);
var
  s_web_file_name: string;
  httpClient:      THTTPSend;
begin
  // download file
  s_web_file_name := Source_DIR + file_name;
//  memo1.Lines.add('downloading: ' + s_web_file_name);
  httpClient := THTTPSend.Create;
  if httpClient.HTTPMethod('GET', s_web_file_name) then
  begin
    httpClient.Document.SaveToFile(file_name);
  end
  else
  begin
    MessageDlg('fail to doownload', mtInformation, [mbYes, mbNo, mbCancel], 0);
  end;
  httpClient.Free;
  ShellExecute(Handle, 'open', pchar(extractfilepath(Application.ExeName) + file_name), '', '', SW_SHOWNORMAL);


end;

procedure TForm_About.Copyright2Click(Sender: TObject);
begin
  ShellExecute(handle, 'open', PChar(s_website), '', '',
    SW_SHOWNORMAL);

end;


procedure ShowAboutBox;
begin
//  Form_About.Visible:=true;
  with TForm_About.Create(Application) do
    try
      ShowModal;
    finally
      Free;
    end;
end;


function GetFileVersion(const sFilename: string; var nValue1, nValue2, nValue3, nValue4: integer; var version_String: string): string;

var
  pInfo, pPointer: Pointer;
  nSize:           DWORD;
  nHandle:         DWORD;
  pVerInfo:        PVSFIXEDFILEINFO;
  nVerInfoSize:    DWORD;
begin

  version_String := '00000000';
  Result         := '?.?.?.?';
  nValue1        := -1;
  nValue2        := -1;
  nValue3        := -1;
  nValue4        := -1;

  nSize := GetFileVersionInfoSize(PChar(sFilename), nHandle);
  if (nSize <> 0) then
  begin
    GetMem(pInfo, nSize);
    try
      FillChar(pInfo^, nSize, 0);

      if (GetFileVersionInfo(PChar(sFilename), nHandle, nSize, pInfo)) then
      begin
        nVerInfoSize := SizeOf(VS_FIXEDFILEINFO);
        GetMem(pVerInfo, nVerInfoSize);
        try
          FillChar(pVerInfo^, nVerInfoSize, 0);
          pPointer := Pointer(pVerInfo);
          VerQueryValue(pInfo, '\', pPointer, nVerInfoSize);
          nValue1 := PVSFIXEDFILEINFO(pPointer)^.dwFileVersionMS shr 16;
          nValue2 := PVSFIXEDFILEINFO(pPointer)^.dwFileVersionMS and $FFFF;
          nValue3 := PVSFIXEDFILEINFO(pPointer)^.dwFileVersionLS shr 16;
          nValue4 := PVSFIXEDFILEINFO(pPointer)^.dwFileVersionLS and $FFFF;

          Result := IntToStr(nValue1) + '.' + IntToStr(nValue2) + '.' + IntToStr(nValue3) + '.' + IntToStr(nValue4);


          //version_String := InttoStrDigits(nValue1, 2) + InttoStrDigits(nValue2, 2) + InttoStrDigits(nValue3, 2) + InttoStrDigits(nValue4, 2);
          version_String := format('%.2d', [nValue1]) + format('%.2d', [nValue2]) + format('%.2d', [nValue3]) + format('%.2d', [nValue4]);


        finally
          FreeMem(pVerInfo, nVerInfoSize);
        end;
      end;
    finally
      FreeMem(pInfo, nSize);
    end;
  end;
end;


end.
