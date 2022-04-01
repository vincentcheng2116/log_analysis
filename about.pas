unit about;

{$mode objfpc}{$H+}
 // for online function
 // use synapse40 component
 // information in http://synapse.ararat.cz/


interface

uses
  Windows, Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, ActnList, Buttons, fpjson, jsonparser, fphttpclient, httpsend;

type

  { TForm_About }

  TForm_About = class(TForm)
    Action_Check_for_Update: TAction;
    ActionList1: TActionList;
    BitBtn_onLine_info: TBitBtn;
    SpeedButton_download: TBitBtn;
    author_info: TLabel;
    Image1:      TImage;
    Label_application_short_name: TLabel;
    label_version_UpdateDate: TLabel;
    Panel1:      TPanel;
    procedure Action_Check_for_UpdateExecute(Sender: TObject);
    procedure BitBtn_onLine_infoClick(Sender: TObject);
    procedure Copyright2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function get_onlin_info: boolean;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form_About:    TForm_About;
  file_name, s_version, s_website: string;
  Source_DIR:    string; // ='http://intretech-tw.synology.me/NAS_file_Share/';     common position + foldername (app name)
  app_name:      string;
  version_Str:   ansistring;
  web_site_info: string;

  author: string;
  contact_info: string;


const
  DestFile    = 'index.json';
  Source_INFO = 'index.json';


procedure ShowAboutBox;
function GetFileVersion(const sFilename: string; var nValue1, nValue2, nValue3, nValue4: integer; var version_String: string): string;

implementation

{$R *.lfm}

{ TForm_About }


function TForm_About.get_onlin_info: boolean;

var
  // s: Ansistring;
  LStrings:   TStringList;
  JSonObject: TJSonObject;
  JSonValue:  TJSONData;
  s_web:      string;
  s1:         TJSONString;
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

    s_version    := JSonObject.Get('version');
    s_website    := JSonObject.Get('website');
    author       := '';
    contact_info := '';

    if JSonObject.Find('author', s1) then
    begin
      author := JSonObject.Get('author');
    end;

    if JSonObject.Find('contact_info', s1) then
    begin
      contact_info := JSonObject.Get('contact_info');
    end;
    author_info.Caption := author + ' ' + contact_info;

    Result := True;

    BitBtn_onLine_info.hint   := s_website;
    web_site_info             := 'Version:  ' + s_version + sLineBreak + 'available online';
    SpeedButton_download.Hint := web_site_info;

    if version_Str <> s_version then
    begin
      SpeedButton_download.Caption := 'Different ' + web_site_info;
    end
    else
    begin
      SpeedButton_download.Caption := 'version up-to-date (' + s_version + ')';
    end;


  finally
    LStrings.Free;
  end;

end;


procedure TForm_About.FormCreate(Sender: TObject);
var
  v1, v2, v3, v4: integer;
  s:          string;
  cur_handle: HWND;
  filedate:   extended;

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


  Label_application_short_name.Caption := ExtractFileName(application.ExeName);
  Label_application_short_name.Hint    := application.ExeName;

  filedate    := FileDateToDateTime(FileAge(Application.ExeName));
  version_Str := GetFileVersion(ansistring(Application.ExeName), v1, v2, v3, v4, s);

  label_version_UpdateDate.Caption := 'Ver: ' + version_Str + ', Released on ' + formatdatetime('yyyy/mm/dd', filedate);

  label_version_UpdateDate.Hint := 'Online: ' + file_name + sLineBreak + 'version: ' + s_version + sLineBreak + 'website: ' +
    s_website + sLineBreak + 'Click to download file';


  get_onlin_info;

end;

procedure TForm_About.Copyright2Click(Sender: TObject);
begin
  ShellExecute(handle, 'open', PChar(s_website), '', '',
    SW_SHOWNORMAL);

end;

procedure TForm_About.Action_Check_for_UpdateExecute(Sender: TObject);
var
  s_web_file_name: string;
  httpClient:      THTTPSend;
begin
  // download file
  if (MessageDlg('File: ' + file_name + sLineBreak + 'Version: ' + s_version + sLineBreak + 'download online?', mtConfirmation,
    [mbYes, mbNo, mbCancel], 0) = mrYes) then
  begin

    s_web_file_name := Source_DIR + file_name;
    //  memo1.Lines.add('downloading: ' + s_web_file_name);
    httpClient      := THTTPSend.Create;
    if httpClient.HTTPMethod('GET', s_web_file_name) then
    begin
      httpClient.Document.SaveToFile(file_name);
    end
    else
    begin
      MessageDlg('fail to doownload', mtInformation, [mbYes, mbNo, mbCancel], 0);
    end;
    httpClient.Free;
    ShellExecute(Handle, 'open', PChar(extractfilepath(Application.ExeName) + file_name), '', '', SW_SHOWNORMAL);

  end;
end;

procedure TForm_About.BitBtn_onLine_infoClick(Sender: TObject);
begin
  if s_website <> '' then
  begin
    ShellExecute(Handle, 'open', PChar(s_website), '', '', SW_SHOWNORMAL); // s_website was refer to json format online
  end
  else
  begin
    ShellExecute(Handle, 'open', 'http://wiki.intretech.com:8090/display/TWNCO/', '', '', SW_SHOWNORMAL);
  end;

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
