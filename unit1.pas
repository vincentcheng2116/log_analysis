unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, TAGraph, TASources, TASeries, Forms, Controls,
  Graphics,  Dialogs, Menus, Grids, ExtCtrls, ComCtrls,
  TAChartUtils, TALegend, TADrawUtils, math;

type

  { TForm1 }

  TForm1 = class(TForm)
    Chart1: TChart;
    Chart1LineSeries1: TLineSeries;
    Chart1LineSeries_limitn: TLineSeries;
    Chart1LineSeries_limitp: TLineSeries;
    Chart1LineSeries_sigma5n: TLineSeries;
    Chart1LineSeries_sigma5p: TLineSeries;
    Chart1LineSeries_sigma3n: TLineSeries;
    Chart1LineSeries_sigma3p: TLineSeries;
    Chart2: TChart;
    Chart2BarSeries1: TBarSeries;
    ListChartSource1: TListChartSource;
    ListChartSource2: TListChartSource;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem_draw: TMenuItem;
    MenuItem_exit: TMenuItem;
    MenuItem_Close: TMenuItem;
    MenuItem_Open: TMenuItem;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    PopupMenu1: TPopupMenu;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    StatusBar1: TStatusBar;
    StringGrid1: TStringGrid;
    procedure Chart1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FormDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FormDropFiles(Sender: TObject; const FileNames: array of String);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem_drawClick(Sender: TObject);
    procedure MenuItem_exitClick(Sender: TObject);
    procedure MenuItem_OpenClick(Sender: TObject);
  private
    { private declarations }
    function loadfile(filename:string):boolean;
  public
    { public declarations }

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Chart1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept:=true;
end;

procedure TForm1.FormDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept:=true;
end;

procedure TForm1.FormDropFiles(Sender: TObject; const FileNames: array of String
  );
var
  f1:String;
begin
  f1:=FileNames[0];
  StatusBar1.Panels[2].Text:=F1;
  if FileExists(f1) then
  begin
       loadfile(f1);
  end;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
var
  col1,row1:integer;
  val:Extended;
  x:integer;
  data:array of Extended;
  mean1,stdev1:Extended;
  i,j,cnt1:integer;
  range0,range1:Extended;
  s:string;
begin

  Chart1LineSeries1.Clear;
  Chart1LineSeries_sigma3n.Clear;
  Chart1LineSeries_sigma3p.Clear;
  Chart1LineSeries_sigma5n.Clear;
  Chart1LineSeries_sigma5p.Clear;
  Chart1LineSeries_limitn.Clear;
  Chart1LineSeries_limitp.Clear;


  //draw data in listChartSource.
  SetLength(data,StringGrid1.RowCount);
  col1:=StringGrid1.Col;

  x:=0;
  for row1:=9 to StringGrid1.RowCount-1 do
  begin
    val:= StrToFloatDef(StringGrid1.Cells[col1,row1],1E99);
    if val<>1E99 then
    begin
      data[x]:=val;
      inc(x);
      ListChartSource1.Add(x,val,inttostr(x),clred);
    end;
  end;
  SetLength(data, x);
  meanandstddev(data,mean1,stdev1);
  StringGrid1.Cells[col1,4]:= floattostr(mean1);
  StringGrid1.Cells[col1,5]:= floattostr(stdev1);

  // drap distribution
  //-6 sigma ~ +6 sigma
  //mean1-(stdev1*6)
  //mean1-(stdev1*5)
  //mean1-(stdev1*4)
  //mean1-(stdev1*3)
  // draw -3 sigma
  // draw +3 sigma
  range0:=mean1 -3*stdev1;
  Chart1LineSeries_sigma3n.AddXY(0, range0);  //AddXY
  Chart1LineSeries_sigma3n.AddXY(x,range0); // AddXY

  range0:=mean1+ 3*stdev1;
  Chart1LineSeries_sigma3p.AddXY(0, range0);  //AddXY
  Chart1LineSeries_sigma3p.AddXY(x,range0); // AddXY

  range0:=mean1 -5*stdev1;
  Chart1LineSeries_sigma5n.AddXY(0, range0);  //AddXY
  Chart1LineSeries_sigma5n.AddXY(x,range0); // AddXY

  range0:=mean1+ 5*stdev1;
  Chart1LineSeries_sigma5p.AddXY(0, range0);  //AddXY
  Chart1LineSeries_sigma5p.AddXY(x,range0); // AddXY

  range0:= StrToFloatDef( StringGrid1.Cells[col1,2],1E99);
  range1:= StrToFloatDef( StringGrid1.Cells[col1,3],1E99);
  if (range0<>1E99 ) and (range1<>1E99) then
  begin
    Chart1LineSeries_limitn.AddXY(0,range0);
    Chart1LineSeries_limitn.AddXY(x,range0);
    Chart1LineSeries_limitp.AddXY(0,range1);
    Chart1LineSeries_limitp.AddXY(x,range1);

  end;



  //-7
  x:=0;
  ListChartSource2.Clear;
  for i:=-6 to 5 do
  begin
    range0:=mean1+i*stdev1;
    range1:=mean1+(i+1)*stdev1;
    cnt1:=0;
    for j:= Low(data) to High(data) do
    begin
      if ((range0<=data[j]) and (data[j]< range1) ) then
      begin
        inc(cnt1);
      end;
    end;
    s:=Format('%3.2f',[(range0+range1)/2]);
    ListChartSource2.Add(x,cnt1,s,clRed);
    inc(x);
  end;





end;

procedure TForm1.MenuItem_drawClick(Sender: TObject);
var
  col1,row1:integer;
  val:Extended;
  x:integer;
begin
  col1:=StringGrid1.Col;
  ListChartSource1.Clear;
  x:=0;
  for row1:=9 to StringGrid1.RowCount-1 do
  begin
    val:= StrToFloatDef(StringGrid1.Cells[col1,row1],1E99);
    if val<>1E99 then
    begin
      inc(x);
      ListChartSource1.Add(x,val,inttostr(x),clred);
    end;
  end;

end;

procedure TForm1.MenuItem_exitClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.MenuItem_OpenClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    if FileExists(OpenDialog1.FileName) then
    begin
      loadfile(OpenDialog1.FileName);
    end;
  end;
end;

function TForm1.loadfile(filename: string): boolean;
begin
  if FileExists(fileName) then
  begin
    StringGrid1.FixedRows:=0;
    StringGrid1.LoadFromCSVFile(filename,',',False,0,true);
    StringGrid1.FixedRows:=9;
    StringGrid1.RowCount:=    StringGrid1.RowCount +1;
  end;

end;



end.

