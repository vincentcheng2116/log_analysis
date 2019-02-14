unit about;

{$mode objfpc}{$H+}

interface

uses
  Windows, Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TForm_About }

  TForm_About = class(TForm)
    Copyright1: TLabel;
    Copyright2: TLabel;
    Image1: TImage;
    programIcon: TImage;
    Label1: TLabel;
    Label_Ver: TLabel;
    Panel1: TPanel;
    ProgramName: TLabel;
    procedure Copyright2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form_About: TForm_About;

procedure ShowAboutBox;
function GetFileVersion(const sFilename: string;
  var nValue1, nValue2, nValue3, nValue4: integer; var version_String: string): string;

implementation

{$R *.lfm}

{ TForm_About }

procedure TForm_About.Image1Click(Sender: TObject);
begin

end;

procedure TForm_About.FormCreate(Sender: TObject);
var
  v1, v2, v3, v4: integer;
  s: string;
begin
  //application.ExeName + '         Ver: ' +
  //getfileversion(application.ExeName, v1, v2, v3, v4);

  Caption := Format('About %s', [Application.Title]);
  programIcon.Picture.Assign(Application.Icon);
  ProgramName.Caption := application.ExeName; //Application.Title;
  Label1.Caption := ExtractFileName(application.ExeName);
  Label_Ver.Caption := 'Ver: ' + getfileversion(application.ExeName, v1, v2, v3, v4, s);
  //UpdateDate.caption := DateTimeToStr(FileDateToDateTime(FileAge(Application.ExeName)));
  //Animate1.Play(1,19,100);

end;

procedure TForm_About.Copyright2Click(Sender: TObject);
begin
  ShellExecute(handle, 'open', 'https://pan.baidu.com/s/1nvGiMOp', '', '',
    SW_SHOWNORMAL);

end;


procedure ShowAboutBox;
begin
  with TForm_About.Create(Application) do
    try
      ShowModal;
    finally
      Free;
    end;
end;


function GetFileVersion(const sFilename: string;
  var nValue1, nValue2, nValue3, nValue4: integer; var version_String: string): string;

var
  pInfo, pPointer: Pointer;
  nSize: DWORD;
  nHandle: DWORD;
  pVerInfo: PVSFIXEDFILEINFO;
  nVerInfoSize: DWORD;
begin

  version_String := '00000000';
  Result := '?.?.?.?';
  nValue1 := -1;
  nValue2 := -1;
  nValue3 := -1;
  nValue4 := -1;

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

          Result := IntToStr(nValue1) + '.' + IntToStr(nValue2) +
            '.' + IntToStr(nValue3) + '.' + IntToStr(nValue4);


          //version_String := InttoStrDigits(nValue1, 2) + InttoStrDigits(nValue2, 2) + InttoStrDigits(nValue3, 2) + InttoStrDigits(nValue4, 2);
          version_String := format('%.2d', [nValue1]) +
            format('%.2d', [nValue2]) +
            format('%.2d', [nValue3]) +
            format('%.2d', [nValue4]);

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
