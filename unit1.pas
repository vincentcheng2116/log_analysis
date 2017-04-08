unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, TAGraph, TASources, TASeries, Forms, Controls,
  Graphics,  Dialogs, Menus, Grids, ExtCtrls, ComCtrls, ActnList,
  math,about;

type

  { TForm1 }

  TForm1 = class(TForm)
    Action_analysis: TAction;
    Action_move_col_right: TAction;
    Action_move_col_left: TAction;
    Action_del_col: TAction;
    Action_del_row: TAction;
    Action_insert_row: TAction;
    Action_insert_col: TAction;
    ActionList1: TActionList;
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
    ImageList1: TImageList;
    ListChartSource1: TListChartSource;
    ListChartSource2: TListChartSource;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem_mark_distribution_value: TMenuItem;
    MenuItem_mark_value: TMenuItem;
    MenuItem_show_pointer: TMenuItem;
    MenuItem_title_process: TMenuItem;
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
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    procedure Action_analysisExecute(Sender: TObject);
    procedure Action_del_colExecute(Sender: TObject);
    procedure Action_del_rowExecute(Sender: TObject);
    procedure Action_insert_colExecute(Sender: TObject);
    procedure Action_insert_rowExecute(Sender: TObject);
    procedure Action_move_col_leftExecute(Sender: TObject);
    procedure Action_move_col_rightExecute(Sender: TObject);
    procedure FormDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FormDropFiles(Sender: TObject; const FileNames: array of String);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem_drawClick(Sender: TObject);
    procedure MenuItem_exitClick(Sender: TObject);
    procedure MenuItem_mark_distribution_valueClick(Sender: TObject);
    procedure MenuItem_mark_valueClick(Sender: TObject);
    procedure MenuItem_OpenClick(Sender: TObject);
    procedure MenuItem_show_pointerClick(Sender: TObject);
    procedure MenuItem_title_processClick(Sender: TObject);
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

procedure TForm1.Action_insert_colExecute(Sender: TObject);
begin
  StringGrid1.InsertColRow(true,StringGrid1.Col);
end;

procedure TForm1.Action_analysisExecute(Sender: TObject);
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
  Chart1LineSeries_sigma3n.AddXY(0, range0,'-3sigma= '+FloatToStr(range0));  //AddXY
  Chart1LineSeries_sigma3n.AddXY(x,range0,'-3sigma= '+FloatToStr(range0)); // AddXY

  range0:=mean1+ 3*stdev1;
  Chart1LineSeries_sigma3p.AddXY(0, range0,'+3sigma= '+FloatToStr(range0));  //AddXY
  Chart1LineSeries_sigma3p.AddXY(x,range0,'+3sigma= '+FloatToStr(range0)); // AddXY

  range0:=mean1 -5*stdev1;
  Chart1LineSeries_sigma5n.AddXY(0, range0,'-5sigma= '+FloatToStr(range0));  //AddXY
  Chart1LineSeries_sigma5n.AddXY(x,range0,'-5sigma= '+FloatToStr(range0)); // AddXY

  range0:=mean1+ 5*stdev1;
  Chart1LineSeries_sigma5p.AddXY(0, range0,'+5sigma= '+FloatToStr(range0));  //AddXY
  Chart1LineSeries_sigma5p.AddXY(x,range0,'+5sigma= '+FloatToStr(range0)); // AddXY

  range0:= StrToFloatDef( StringGrid1.Cells[col1,2],1E99);
  range1:= StrToFloatDef( StringGrid1.Cells[col1,3],1E99);
  if (range0<>1E99 ) and (range1<>1E99) then
  begin
    Chart1LineSeries_limitn.AddXY(0,range0,'Upper limit= '+FloatToStr(range0));
    Chart1LineSeries_limitn.AddXY(x,range0,'Upper limit= '+FloatToStr(range0));
    Chart1LineSeries_limitp.AddXY(0,range1,'Lower limit= '+FloatToStr(range1));
    Chart1LineSeries_limitp.AddXY(x,range1,'Lower limit= '+FloatToStr(range1));

  end;



  //-7
  ListChartSource2.Clear;
  x:=0;
  range0:=mean1-7*stdev1;
  cnt1:=0;
  for j:= Low(data) to High(data) do
  begin
    if data[j]< range0 then
    begin
      inc(cnt1);
    end;
  end;
  s:=Format('<%3.3e',[range0]);
  ListChartSource2.Add(x,cnt1,s,clRed);


  inc(x);
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
    s:=Format('%3.3e',[(range0+range1)/2]);
    ListChartSource2.Add(x,cnt1,s,clRed);
    inc(x);
  end;
  //+7

  range0:=mean1+7*stdev1;
  cnt1:=0;
  for j:= Low(data) to High(data) do
  begin
    if data[j]> range0 then
    begin
      inc(cnt1);
    end;
  end;
  s:=Format('>%3.3e',[range0]);
  ListChartSource2.Add(x,cnt1,s,clRed);



end;

procedure TForm1.Action_del_colExecute(Sender: TObject);
begin
  StringGrid1.DeleteCol(StringGrid1.Col);
end;



procedure TForm1.Action_del_rowExecute(Sender: TObject);
begin
   StringGrid1.DeleteRow(StringGrid1.Row);
end;

procedure TForm1.Action_insert_rowExecute(Sender: TObject);
begin
  StringGrid1.InsertColRow(False,StringGrid1.Row);

end;

procedure TForm1.Action_move_col_leftExecute(Sender: TObject);
begin
  StringGrid1.MoveColRow(true,StringGrid1.col,StringGrid1.col-1);
end;

procedure TForm1.Action_move_col_rightExecute(Sender: TObject);
begin
  StringGrid1.MoveColRow(true,StringGrid1.col,StringGrid1.col+1);

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
begin
  Action_analysisExecute(self);

end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
  //MessageDlg('Log Analysis tool,'+#13+#10+'   Author: Vincent Cheng (Tel: +886-963-080987),'+#13+#10+'   Company: Maetay'+#13+#10+'   Date: 2017-04-08', mtInformation, [mbOK], 0);
   ShowAboutBox;
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

procedure TForm1.MenuItem_mark_distribution_valueClick(Sender: TObject);
begin
  if MenuItem_mark_distribution_value.Checked then
  begin
    Chart2BarSeries1.Marks.Visible:=True;
  end
  else
  begin
    Chart2BarSeries1.Marks.Visible:=False;
  end;

end;

procedure TForm1.MenuItem_mark_valueClick(Sender: TObject);
begin
  if MenuItem_mark_value.Checked then
  begin
    Chart1LineSeries1.Marks.Visible :=True ;
  end
  else
  begin
    Chart1LineSeries1.Marks.Visible:= False;
  end;
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

procedure TForm1.MenuItem_show_pointerClick(Sender: TObject);
begin
  Chart1LineSeries1.Pointer.Visible:= MenuItem_show_pointer.Checked;
end;

procedure TForm1.MenuItem_title_processClick(Sender: TObject);
var
  i,num:integer;

begin
  // search the last 'SeqNum'
  num:=0;
  for i:= 10 to StringGrid1.RowCount-10 do
  begin
    if StringGrid1.Cells[0,i]='SeqNum' then
    begin
      StatusBar1.Panels[0].Text:=IntToStr(i);
      num:=i;
    end;
  end;
  if num=0 then exit;
  for i := num to num+8 do
  begin
    StringGrid1.MoveColRow(False,i,i-num);
  end;

  i:=9;
  while i<StringGrid1.RowCount-1 do
  begin
    if (StringGrid1.Cells[0,i]='') or (StringGrid1.Cells[0,i]='SeqNum') then
    begin
      StringGrid1.DeleteRow(i);
    end
    else
    begin
      inc(i);
    end;
  end;

end;

function TForm1.loadfile(filename: string): boolean;
begin
  if FileExists(fileName) then
  begin
    StringGrid1.Clean;
    StringGrid1.FixedRows:=0;
    StringGrid1.LoadFromCSVFile(filename,',',False,0,true);
    StringGrid1.FixedRows:=9;
    StringGrid1.RowCount:=    StringGrid1.RowCount +1;
  end;

end;



end.

