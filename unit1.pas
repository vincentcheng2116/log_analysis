unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, TAGraph, TASources, TASeries, Forms, Controls, Graphics,
  Dialogs, Menus, Grids, ExtCtrls, ComCtrls, ActnList, ValEdit, StdCtrls, Math,
  about, TADrawUtils, TACustomSeries, TATools, TACustomSource, Types;

type

  { TForm1 }

  TForm1 = class(TForm)
    Action_Keep_AllUnique: TAction;
    Action_Keep_Unique: TAction;
    Action_remove_empth_row: TAction;
    Action_Save_As_New_Log_File: TAction;
    Action_Find_Previous_Fail: TAction;
    Action_Title_Process_Field_align: TAction;
    Action_Find_Next_Fail: TAction;
    Action_Sort_by_SNO: TAction;
    Action_Count_Yield_rate: TAction;
    Action_cell_editable: TAction;
    Action_Append_File: TAction;
    Action_CleanUp: TAction;
    Action_Title_Process: TAction;
    Action_Full_Auto: TAction;
    Action_Delete_same_Contents: TAction;
    Action_Sorting: TAction;
    Action_Analysis: TAction;
    Action_move_col_right: TAction;
    Action_move_col_left: TAction;
    Action_del_col: TAction;
    Action_del_row: TAction;
    Action_insert_row: TAction;
    Action_insert_col: TAction;
    ActionList1: TActionList;
    Chart1: TChart;
    Chart1LineSeries1: TLineSeries;
    Chart1LineSeries2: TLineSeries;
    Chart1LineSeries_limitn: TLineSeries;
    Chart1LineSeries_limitp: TLineSeries;
    Chart1LineSeries_sigma5n: TLineSeries;
    Chart1LineSeries_sigma5p: TLineSeries;
    Chart1LineSeries_sigma3n: TLineSeries;
    Chart1LineSeries_sigma3p: TLineSeries;
    Chart2: TChart;
    Chart2BarSeries1: TBarSeries;
    ChartToolset1: TChartToolset;
    ChartToolset1DataPointCrosshairTool1: TDataPointCrosshairTool;
    ChartToolset1PanDragTool1: TPanDragTool;
    ChartToolset1ZoomMouseWheelTool_vert: TZoomMouseWheelTool;
    ChartToolset1ZoomMouseWheelTool_Hor: TZoomMouseWheelTool;
    ChartToolset1ZoomMouseWheelTool_iso: TZoomMouseWheelTool;
    ComboBox_log_search: TComboBox;
    ComboBox_title_search: TComboBox;
    ImageList1: TImageList;
    ListChartSource1: TListChartSource;
    ListChartSource2: TListChartSource;
    ListChartSource3: TListChartSource;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem_include_none_limit_field: TMenuItem;
    MenuItem_Reload_file: TMenuItem;
    N4:     TMenuItem;
    N3:     TMenuItem;
    N2:     TMenuItem;
    N1:     TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItem_load_new_F: TMenuItem;
    MenuItem_clean_up: TMenuItem;
    MenuItem_Append_btm: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem_add_right_side: TMenuItem;
    MenuItem_delete_same_Contents: TMenuItem;
    MenuItem_sorting: TMenuItem;
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
    Panel2: TPanel;
    PopupMenu1: TPopupMenu;
    SaveDialog1: TSaveDialog;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    StatusBar1: TStatusBar;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    procedure Action_Keep_AllUniqueExecute(Sender: TObject);
    procedure Action_Keep_UniqueExecute(Sender: TObject);
    procedure Action_AnalysisExecute(Sender: TObject);
    procedure Action_Append_FileExecute(Sender: TObject);
    procedure Action_cell_editableExecute(Sender: TObject);
    procedure Action_CleanUpExecute(Sender: TObject);
    procedure Action_Count_Yield_rateExecute(Sender: TObject);
    procedure Action_Delete_same_ContentsExecute(Sender: TObject);
    procedure Action_del_colExecute(Sender: TObject);
    procedure Action_del_rowExecute(Sender: TObject);
    procedure Action_Find_Next_FailExecute(Sender: TObject);
    procedure Action_Find_Previous_FailExecute(Sender: TObject);
    procedure Action_Full_AutoExecute(Sender: TObject);
    procedure Action_insert_colExecute(Sender: TObject);
    procedure Action_insert_rowExecute(Sender: TObject);
    procedure Action_move_col_leftExecute(Sender: TObject);
    procedure Action_move_col_rightExecute(Sender: TObject);
    procedure Action_remove_empth_rowExecute(Sender: TObject);
    procedure Action_Save_As_New_Log_FileExecute(Sender: TObject);
    procedure Action_SortingExecute(Sender: TObject);
    procedure Action_Sort_by_SNOExecute(Sender: TObject);
    procedure Action_Title_ProcessExecute(Sender: TObject);
    procedure Action_Title_Process_Field_alignExecute(Sender: TObject);
    procedure Chart1DblClick(Sender: TObject);
    procedure ChartToolset1DataPointCrosshairTool1Draw(ASender: TDataPointDrawTool);
    procedure ComboBox_log_searchChange(Sender: TObject);
    procedure ComboBox_log_searchKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure ComboBox_title_searchChange(Sender: TObject);
    procedure ComboBox_title_searchKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDragOver(Sender, Source: TObject; X, Y: integer; State: TDragState; var Accept: boolean);
    procedure FormDropFiles(Sender: TObject; const FileNames: array of string);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem_add_right_sideClick(Sender: TObject);
    procedure MenuItem_Append_btmClick(Sender: TObject);
    procedure MenuItem_drawClick(Sender: TObject);
    procedure MenuItem_exitClick(Sender: TObject);
    procedure MenuItem_load_new_FClick(Sender: TObject);
    procedure MenuItem_mark_distribution_valueClick(Sender: TObject);
    procedure MenuItem_mark_valueClick(Sender: TObject);
    procedure MenuItem_OpenClick(Sender: TObject);
    procedure MenuItem_Reload_fileClick(Sender: TObject);
    procedure MenuItem_show_pointerClick(Sender: TObject);
    procedure StringGrid1Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; aCol, aRow: integer; aRect: TRect; aState: TGridDrawState);
    procedure StringGrid1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
    procedure StringGrid1MouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: integer; MousePos: TPoint; var Handled: boolean);
  private
    function Action_Analysis_range(x0, y0, x1, y1: integer): boolean;
    function Addfile(filename: string): boolean;
    function Addfile_side(filename: string): boolean;
    { private declarations }
    function loadfile(filename: string): boolean;
  public
    { public declarations }

  end;

var
  Form1: TForm1;
  shift_status: byte = 0;
  //  key_down_status: TShiftState;
  latest_file_name: string;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Action_insert_colExecute(Sender: TObject);
begin
  StringGrid1.InsertColRow(True, StringGrid1.Col);
end;

procedure TForm1.Action_AnalysisExecute(Sender: TObject);
var
  col1, row1: integer;
  val:        extended;
  x:          integer;
  Data:       array of extended;
  mean1, stdev1, min1, max1: extended;
  i, j, cnt1: integer;
  range0, range1: extended;
  s:          string;
begin

  stringgrid1.Cells[0, 2] := 'Upper';
  stringgrid1.Cells[0, 3] := 'Lower';
  stringgrid1.Cells[0, 4] := 'Average';
  stringgrid1.Cells[0, 5] := 'Stdev';
  stringgrid1.Cells[0, 8] := 'Yield%';

  Chart1LineSeries1.Clear;
  Chart1LineSeries2.Clear;
  Chart1LineSeries_sigma3n.Clear;
  Chart1LineSeries_sigma3p.Clear;
  Chart1LineSeries_sigma5n.Clear;
  Chart1LineSeries_sigma5p.Clear;
  Chart1LineSeries_limitn.Clear;
  Chart1LineSeries_limitp.Clear;


  //draw data in listChartSource.
  SetLength(Data, StringGrid1.RowCount);
  col1 := StringGrid1.Col;

  x := 0;
  for row1 := 9 to StringGrid1.RowCount - 1 do
  begin
    val := StrToFloatDef(StringGrid1.Cells[col1, row1], 1E99);
    if val <> 1E99 then
    begin
      Data[x] := val;
      Inc(x);
      ListChartSource1.Add(x, val, IntToStr(x), clred);
    end;
  end;
  if x = 0 then
  begin
    StatusBar1.Panels[2].Text := 'this column wasn''t a valid data.';
    {MessageDlg('Notification', 'this column wasn''t a valid data.',
      mtConfirmation, [mbOK], 0);}
    exit;

  end;

  SetLength(Data, x);
  meanandstddev(Data, mean1, stdev1);
  StringGrid1.Cells[col1, 4] := floattostr(mean1);
  StringGrid1.Cells[col1, 5] := floattostr(stdev1);

  min1 := MinValue(Data);
  max1 := MaxValue(Data);
  StringGrid1.Cells[col1, 6] := floattostr(min1);
  StringGrid1.Cells[col1, 7] := floattostr(max1);
  StringGrid1.Cells[0, 6] := 'min';
  StringGrid1.Cells[0, 7] := 'max';


  // drap distribution
  //-6 sigma ~ +6 sigma
  //mean1-(stdev1*6)
  //mean1-(stdev1*5)
  //mean1-(stdev1*4)
  //mean1-(stdev1*3)
  // draw -3 sigma
  // draw +3 sigma
  range0 := mean1 - 3 * stdev1;
  Chart1LineSeries_sigma3n.AddXY(0, range0, '-3sigma= ' + FloatToStr(range0));  //AddXY
  Chart1LineSeries_sigma3n.AddXY(x, range0, '-3sigma= ' + FloatToStr(range0));  // AddXY

  range0 := mean1 + 3 * stdev1;
  Chart1LineSeries_sigma3p.AddXY(0, range0, '+3sigma= ' + FloatToStr(range0));  //AddXY
  Chart1LineSeries_sigma3p.AddXY(x, range0, '+3sigma= ' + FloatToStr(range0));  // AddXY

  range0 := mean1 - 5 * stdev1;
  Chart1LineSeries_sigma5n.AddXY(0, range0, '-5sigma= ' + FloatToStr(range0));  //AddXY
  Chart1LineSeries_sigma5n.AddXY(x, range0, '-5sigma= ' + FloatToStr(range0));  // AddXY

  range0 := mean1 + 5 * stdev1;
  Chart1LineSeries_sigma5p.AddXY(0, range0, '+5sigma= ' + FloatToStr(range0));  //AddXY
  Chart1LineSeries_sigma5p.AddXY(x, range0, '+5sigma= ' + FloatToStr(range0));  // AddXY

  range0 := StrToFloatDef(StringGrid1.Cells[col1, 2], 1E99);
  range1 := StrToFloatDef(StringGrid1.Cells[col1, 3], 1E99);
  if (range0 <> 1E99) and (range1 <> 1E99) then
  begin
    Chart1LineSeries_limitn.AddXY(0, range0, 'Upper limit= ' + FloatToStr(range0));
    Chart1LineSeries_limitn.AddXY(x, range0, 'Upper limit= ' + FloatToStr(range0));
    Chart1LineSeries_limitp.AddXY(0, range1, 'Lower limit= ' + FloatToStr(range1));
    Chart1LineSeries_limitp.AddXY(x, range1, 'Lower limit= ' + FloatToStr(range1));

  end;


  //-7
  ListChartSource2.Clear;
  x      := 0;
  range0 := mean1 - 7 * stdev1;
  cnt1   := 0;
  for j := Low(Data) to High(Data) do
  begin
    if Data[j] < range0 then
    begin
      Inc(cnt1);
    end;
  end;
  s := Format('<%3.3e', [range0]);
  ListChartSource2.Add(x, cnt1, s, clRed);


  Inc(x);
  for i := -6 to 5 do
  begin
    range0 := mean1 + i * stdev1;
    range1 := mean1 + (i + 1) * stdev1;
    cnt1   := 0;
    for j := Low(Data) to High(Data) do
    begin
      if ((range0 <= Data[j]) and (Data[j] < range1)) then
      begin
        Inc(cnt1);
      end;
    end;
    s := Format('%3.3e', [(range0 + range1) / 2]);
    ListChartSource2.Add(x, cnt1, s, clRed);
    Inc(x);
  end;
  //+7

  range0 := mean1 + 7 * stdev1;
  cnt1   := 0;
  for j := Low(Data) to High(Data) do
  begin
    if Data[j] > range0 then
    begin
      Inc(cnt1);
    end;
  end;
  s := Format('>%3.3e', [range0]);
  ListChartSource2.Add(x, cnt1, s, clRed);
  Chart1.ZoomFull;

  Action_Count_Yield_rateExecute(self);
end;

procedure TForm1.Action_Keep_UniqueExecute(Sender: TObject);
var
  s, s1:      string;
  row1, col1: integer;
begin
  StringGrid1.SortColRow(True, StringGrid1.Col, 9,
    StringGrid1.RowCount - 1);
  col1 := StringGrid1.col;
  s    := StringGrid1.Cells[col1, StringGrid1.Row];
  row1 := 10;
  while row1 < StringGrid1.RowCount - 1 do
  begin
    s1 := StringGrid1.Cells[col1, row1];
    if S1 <> s then
    begin
      Inc(row1);
    end;
    if StringGrid1.Cells[col1, row1-1] < s then
    begin
      Inc(row1);
    end;
    if S1 = s then
    begin
      StringGrid1.DeleteRow(row1-1);
    end;
  end;

end;

procedure TForm1.Action_Keep_AllUniqueExecute(Sender: TObject);
var
  s, s1:      string;
  row1, col1: integer;
begin
  StringGrid1.SortColRow(True, StringGrid1.Col, 9,
    StringGrid1.RowCount - 1);
  col1 := StringGrid1.col;
  row1 := 9;
  while row1 < StringGrid1.RowCount -1  do
  begin
    s := StringGrid1.Cells[col1, row1];
    s1 := StringGrid1.Cells[col1, row1+1];
    if s1 = s then
    begin
      StringGrid1.DeleteRow(row1);
    end;
    if s1 <> s then
    begin
      Inc(row1);
    end;
  end;
end;



function TForm1.Action_Analysis_range(x0, y0, x1, y1: integer): boolean;
var
  col1, row1: integer;
  val: extended;
  x, y: integer;
  Data: array of extended;
  mean1, stdev1, min1, max1: extended;
  i, j, cnt1: integer;
  range0, range1: extended;
  s: string;
begin

  stringgrid1.Cells[0, 2] := 'Upper';
  stringgrid1.Cells[0, 3] := 'Lower';
  stringgrid1.Cells[0, 4] := 'Average';
  stringgrid1.Cells[0, 5] := 'Stdev';
  stringgrid1.Cells[0, 8] := 'Yield%';


  //draw data in listChartSource.
  SetLength(Data, y1 - y0 + 1);
  col1 := x0;

  while col1 <= x1 do
  begin

    Chart1LineSeries1.Clear;
    Chart1LineSeries2.Clear;
    Chart1LineSeries_sigma3n.Clear;
    Chart1LineSeries_sigma3p.Clear;
    Chart1LineSeries_sigma5n.Clear;
    Chart1LineSeries_sigma5p.Clear;
    Chart1LineSeries_limitn.Clear;
    Chart1LineSeries_limitp.Clear;


    x := 0;
    for row1 := y0 to y1 do
    begin
      val := StrToFloatDef(StringGrid1.Cells[col1, row1], 1E99);
      if val <> 1E99 then
      begin
        Data[x] := val;
        Inc(x);
        ListChartSource1.Add(x, val, IntToStr(x), clred);
      end;
    end;
    if x = 0 then
    begin
      StatusBar1.Panels[2].Text := 'this column wasn''t a valid data.';
      {MessageDlg('Notification', 'this column wasn''t a valid data.',
        mtConfirmation, [mbOK], 0);}
      exit;

    end;

    SetLength(Data, x);
    meanandstddev(Data, mean1, stdev1);
    StringGrid1.Cells[col1, 4] := floattostr(mean1);
    StringGrid1.Cells[col1, 5] := floattostr(stdev1);

    min1 := MinValue(Data);
    max1 := MaxValue(Data);
    StringGrid1.Cells[col1, 6] := floattostr(min1);
    StringGrid1.Cells[col1, 7] := floattostr(max1);
    StringGrid1.Cells[0, 6] := 'min';
    StringGrid1.Cells[0, 7] := 'max';

    StringGrid1.Cells[col1, 8] := floattostr(max1 - min1);
    StringGrid1.Cells[0, 8]    := 'diff';

    // drap distribution
    //-6 sigma ~ +6 sigma
    //mean1-(stdev1*6)
    //mean1-(stdev1*5)
    //mean1-(stdev1*4)
    //mean1-(stdev1*3)
    // draw -3 sigma
    // draw +3 sigma
    range0 := mean1 - 3 * stdev1;
    Chart1LineSeries_sigma3n.AddXY(0, range0, '-3sigma= ' + FloatToStr(range0));  //AddXY
    Chart1LineSeries_sigma3n.AddXY(x, range0, '-3sigma= ' + FloatToStr(range0));  // AddXY

    range0 := mean1 + 3 * stdev1;
    Chart1LineSeries_sigma3p.AddXY(0, range0, '+3sigma= ' + FloatToStr(range0));  //AddXY
    Chart1LineSeries_sigma3p.AddXY(x, range0, '+3sigma= ' + FloatToStr(range0));  // AddXY

    range0 := mean1 - 5 * stdev1;
    Chart1LineSeries_sigma5n.AddXY(0, range0, '-5sigma= ' + FloatToStr(range0));  //AddXY
    Chart1LineSeries_sigma5n.AddXY(x, range0, '-5sigma= ' + FloatToStr(range0));  // AddXY

    range0 := mean1 + 5 * stdev1;
    Chart1LineSeries_sigma5p.AddXY(0, range0, '+5sigma= ' + FloatToStr(range0));  //AddXY
    Chart1LineSeries_sigma5p.AddXY(x, range0, '+5sigma= ' + FloatToStr(range0));  // AddXY

    range0 := StrToFloatDef(StringGrid1.Cells[col1, 2], 1E99);
    range1 := StrToFloatDef(StringGrid1.Cells[col1, 3], 1E99);
    if (range0 <> 1E99) and (range1 <> 1E99) then
    begin
      Chart1LineSeries_limitn.AddXY(0, range0, 'Upper limit= ' + FloatToStr(range0));
      Chart1LineSeries_limitn.AddXY(x, range0, 'Upper limit= ' + FloatToStr(range0));
      Chart1LineSeries_limitp.AddXY(0, range1, 'Lower limit= ' + FloatToStr(range1));
      Chart1LineSeries_limitp.AddXY(x, range1, 'Lower limit= ' + FloatToStr(range1));

    end;


    //-7
    ListChartSource2.Clear;
    x      := 0;
    range0 := mean1 - 7 * stdev1;
    cnt1   := 0;
    for j := Low(Data) to High(Data) do
    begin
      if Data[j] < range0 then
      begin
        Inc(cnt1);
      end;
    end;
    s := Format('<%3.3e', [range0]);
    ListChartSource2.Add(x, cnt1, s, clRed);


    Inc(x);
    for i := -6 to 5 do
    begin
      range0 := mean1 + i * stdev1;
      range1 := mean1 + (i + 1) * stdev1;
      cnt1   := 0;
      for j := Low(Data) to High(Data) do
      begin
        if ((range0 <= Data[j]) and (Data[j] < range1)) then
        begin
          Inc(cnt1);
        end;
      end;
      s := Format('%3.3e', [(range0 + range1) / 2]);
      ListChartSource2.Add(x, cnt1, s, clRed);
      Inc(x);
    end;
    //+7

    range0 := mean1 + 7 * stdev1;
    cnt1   := 0;
    for j := Low(Data) to High(Data) do
    begin
      if Data[j] > range0 then
      begin
        Inc(cnt1);
      end;
    end;
    s := Format('>%3.3e', [range0]);
    ListChartSource2.Add(x, cnt1, s, clRed);


    Chart1.ZoomFull;


    Inc(col1);
  end;


  //Action_Count_Yield_rateExecute(self);

end;


procedure TForm1.Action_Append_FileExecute(Sender: TObject);
var
  cnt: integer;

begin
  if OpenDialog1.Execute then
  begin
    //OpenDialog1.Files.Count;
    for cnt := 0 to (OpenDialog1.Files.Count - 1) do
    begin
      if FileExists(OpenDialog1.Files[cnt]) then
      begin
        Addfile(OpenDialog1.Files[cnt]);
      end;
    end;
  end;

end;

procedure TForm1.Action_cell_editableExecute(Sender: TObject);
begin

  if MenuItem9.Checked then
  begin

    StringGrid1.FixedRows := 1;
    StringGrid1.Options   := StringGrid1.Options + [goEditing];

  end
  else
  begin
    StringGrid1.FixedRows := 9;
    StringGrid1.Options   := StringGrid1.Options - [goEditing];

  end;

end;

procedure TForm1.Action_CleanUpExecute(Sender: TObject);
begin

  Chart1LineSeries1.Clear;
  Chart1LineSeries_sigma3n.Clear;
  Chart1LineSeries_sigma3p.Clear;
  Chart1LineSeries_sigma5n.Clear;
  Chart1LineSeries_sigma5p.Clear;
  Chart1LineSeries_limitn.Clear;
  Chart1LineSeries_limitp.Clear;
  StringGrid1.Clean;
  StringGrid2.Clean;
  StringGrid1.FixedRows := 1;
  Stringgrid1.RowCount  := 10;
  Stringgrid1.colCount  := 2;

  StringGrid1.FixedRows := 9;
  StringGrid1.RowCount  := StringGrid1.RowCount + 1;

  //  stringgrid1.Cells[0, 4] := 'Average';
  //  stringgrid1.Cells[0, 5] := 'Stdev';

end;

procedure TForm1.Action_Count_Yield_rateExecute(Sender: TObject);
var
  upper, lower, value0: extended;
  i:     integer;
  pass_count, fail_count: integer;
  yield: single;
begin
  StatusBar1.Panels[2].Text := 'Can''t count yield (no test limit)';
  upper := StrToFloatDef(StringGrid1.Cells[StringGrid1.Col, 2], -2E99);
  lower := StrToFloatDef(StringGrid1.Cells[StringGrid1.Col, 3], -1E99);
  if upper > lower then
  begin
    // count yield rate now
    StatusBar1.Panels[2].Text := 'Count yield';
    pass_count := 0;
    fail_count := 0;
    for i := 9 to stringgrid1.RowCount - 1 do
    begin
      value0 := StrToFloatDef(StringGrid1.Cells[StringGrid1.Col, i], 1E999);
      if value0 <> 1E9999 then
      begin
        if (value0 >= lower) and (value0 <= upper) then
        begin
          Inc(pass_count);
        end
        else
        begin
          Inc(fail_count);

        end;

      end;

    end;
    if pass_count + fail_count > 0 then
    begin
      yield := pass_count / (pass_count + fail_count) * 100;
      StatusBar1.Panels[2].Text := format('pass:%3d fail: %3d  yield: %3.2f%%', [pass_count, fail_count, yield]);
      StringGrid1.cells[StringGrid1.Col, 8] := format('%3.2f%%', [yield]);
    end
    else
    begin
      StatusBar1.Panels[2].Text := format('pass:%3d fail: %3d', [pass_count, fail_count]);

    end;
  end;
end;

procedure TForm1.Action_Delete_same_ContentsExecute(Sender: TObject);
var
  s, s1:      string;
  row1, col1: integer;
begin
  col1 := StringGrid1.col;
  s    := StringGrid1.Cells[col1, StringGrid1.Row];
  row1 := 9;
  while row1 < StringGrid1.RowCount - 1 do
  begin
    s1 := StringGrid1.Cells[col1, row1];
    if S1 = s then
    begin
      StringGrid1.DeleteRow(row1);
    end
    else
    begin
      Inc(row1);
    end;
  end;
end;

procedure TForm1.Action_del_colExecute(Sender: TObject);
var
  col_sel_cnt, i, j: integer;

begin
  // check if multiselect
  col_sel_cnt := StringGrid1.Selection.Right - StringGrid1.Selection.Left;
  if col_sel_cnt > 1 then
  begin
    i := StringGrid1.Selection.left;
    for j := 1 to col_sel_cnt + 1 do
    begin
      StringGrid1.DeleteCol(i);
    end;
    exit;
  end;
  StringGrid1.DeleteCol(StringGrid1.Col);
end;


procedure TForm1.Action_del_rowExecute(Sender: TObject);
var
  row_sel_cnt, i, j: integer;
begin
  // check if multiselect
  row_sel_cnt := StringGrid1.Selection.Bottom - StringGrid1.Selection.Top;
  if row_sel_cnt > 1 then
  begin
    i := StringGrid1.Selection.Top;
    for j := 1 to row_sel_cnt + 1 do
    begin
      StringGrid1.DeleteRow(i);
    end;
    exit;
  end;
  StringGrid1.DeleteRow(StringGrid1.Row);
end;

procedure TForm1.Action_Find_Next_FailExecute(Sender: TObject);
var
  upper, lower, value0: extended;
  i: integer;
  pass_count, fail_count: integer;

begin
  StatusBar1.Panels[2].Text := '(no test limit)';
  upper := StrToFloatDef(StringGrid1.Cells[StringGrid1.Col, 2], -2E100);
  lower := StrToFloatDef(StringGrid1.Cells[StringGrid1.Col, 3], -1E100);
  if upper > lower then
  begin
    // count yield rate now
    StatusBar1.Panels[2].Text := 'fail item';
    pass_count := 0;
    fail_count := 0;
    for i := stringgrid1.Row + 1 to stringgrid1.RowCount - 1 do
    begin
      value0 := StrToFloatDef(StringGrid1.Cells[StringGrid1.Col, i], 1E9999);
      if value0 <> 1E9999 then
      begin
        if (value0 < lower) or (value0 > upper) then
        begin
          Inc(fail_count);
          StatusBar1.Panels[2].Text := 'fail item found';
          StringGrid1.Row           := i;
          exit;
        end;

      end;

    end;
  end;

end;

procedure TForm1.Action_Find_Previous_FailExecute(Sender: TObject);
var
  upper, lower, value0: extended;
  i: integer;
  pass_count, fail_count: integer;

begin
  StatusBar1.Panels[2].Text := '(no test limit)';
  upper := StrToFloatDef(StringGrid1.Cells[StringGrid1.Col, 2], -2E100);
  lower := StrToFloatDef(StringGrid1.Cells[StringGrid1.Col, 3], -1E100);
  if upper > lower then
  begin
    // count yield rate now
    StatusBar1.Panels[2].Text := 'fail item';
    pass_count := 0;
    fail_count := 0;
    for i := stringgrid1.Row - 1 downto 9 do
    begin
      value0 := StrToFloatDef(StringGrid1.Cells[StringGrid1.Col, i], 1E9999);
      if value0 <> 1E9999 then
      begin
        if (value0 < lower) or (value0 > upper) then
        begin
          Inc(fail_count);
          StatusBar1.Panels[2].Text := 'fail item found';
          StringGrid1.Row           := i;
          exit;
        end;

      end;

    end;
  end;

end;

procedure TForm1.Action_Full_AutoExecute(Sender: TObject);
var
  i, j:         integer;
  s:            string;
  d_min, d_max: extended;
  v2:           extended;
  v1:           extended;
  diff_cnt:     integer;
  row0:integer;
begin
  // title process
  // Action_title_processExecute(self);  replace with new one
  Action_Title_Process_Field_alignExecute(self);
  // adjust field width
  for i := 1 to StringGrid1.ColCount - 1 do
  begin
    //adj
    StringGrid1.col := i;
    StringGrid1.Row := 10;
    StringGrid1Click(self);
  end;

  for i :=5 to StringGrid1.ColCount - 1 do
  begin
    //adj
    d_min := StrToFloatDef(StringGrid1.Cells[i, 2], 1E99);
    d_max := StrToFloatDef(StringGrid1.Cells[i, 3], 1E99);
    if (d_min <> 1E99) and (d_max <> 1E99) then
    begin
      StringGrid1.Cells[i, 1] := '@';
    end
    else
    if MenuItem_include_none_limit_field.Checked then

    begin
      diff_cnt := 0;
      row0:=min(110, Stringgrid1.RowCount) ;
      for j := 10 to  row0 do
      begin
        v1 := StrToFloatDef(StringGrid1.Cells[i, j], 1E99);
        v2 := StrToFloatDef(StringGrid1.Cells[i, j + 1], 1E99);
        if (v1 <> v2) then Inc(diff_cnt);
      end;
      if diff_cnt > 70 then
      begin
        StringGrid1.Cells[i, 1] := '@';

      end;

    end;

  end;

  for i := 1 to StringGrid1.ColCount - 1 do
  begin
    if StringGrid1.Cells[i, 1] = '@' then
    begin
      StringGrid1.Col := i;
      Action_analysisExecute(self);
      //break;
    end;
  end;
  //  StringGrid1.Col := i;
  //  Action_analysisExecute(self);

  // check the chart-able item)
  // mark those field
  // calculate stdev and means value
  // draw chart

end;

procedure TForm1.Action_insert_rowExecute(Sender: TObject);
begin
  StringGrid1.InsertColRow(False, StringGrid1.Row);

end;

procedure TForm1.Action_move_col_leftExecute(Sender: TObject);
begin
  StringGrid1.MoveColRow(True, StringGrid1.col, StringGrid1.col - 1);
end;

procedure TForm1.Action_move_col_rightExecute(Sender: TObject);
begin
  StringGrid1.MoveColRow(True, StringGrid1.col, StringGrid1.col + 1);

end;

procedure TForm1.Action_remove_empth_rowExecute(Sender: TObject);
var
  r, c: integer;
  s:    string;

begin
  r := 9;
  while r < StringGrid1.RowCount - 1 do
  begin
    if StringGrid1.Cells[0, r] = '' then
    begin
      s := '';
      for c := 1 to StringGrid1.ColCount - 1 do
      begin
        s := s + StringGrid1.Cells[c, r];
      end;
      if trim(s) = '' then
      begin
        StringGrid1.DeleteRow(r);
      end
      else
      begin
        Inc(r);
      end;
    end
    else
    begin
      Inc(r);
    end;
  end;
end;

procedure TForm1.Action_Save_As_New_Log_FileExecute(Sender: TObject);
var
  c, r: integer;
  cnt0: integer;
  file_name_tmp, file_name_tmp0: string;
begin
  StringGrid1.FixedRows := 0;

  // save as new log file

  SaveDialog1.InitialDir := ExtractFileDir(latest_file_name);

  file_name_tmp0 := ExtractFileName(latest_file_name);
  file_name_tmp0 := copy(file_name_tmp0, 1, length(file_name_tmp0) - 4);

  cnt0 := 0;
  while True do
  begin
    file_name_tmp := file_name_tmp0 + '_' + IntToStr(cnt0) + '.csv';
    if FileExists(SaveDialog1.InitialDir + '\' + file_name_tmp) then
    begin
      Inc(cnt0);
    end
    else
    begin
      break;
    end;
  end;


  SaveDialog1.FileName := file_name_tmp;

  if SaveDialog1.Execute then
  begin

    StringGrid1.SaveToCSVFile(SaveDialog1.FileName, ',', True, True);
  end;
  StringGrid1.FixedRows := 9;

end;

procedure TForm1.Action_SortingExecute(Sender: TObject);
begin

  StringGrid1.SortColRow(True, StringGrid1.Col, 9,
    StringGrid1.RowCount - 1);

end;

procedure TForm1.Action_Sort_by_SNOExecute(Sender: TObject);
var
  i: integer;
begin
  i  := 9;
  while i < StringGrid1.RowCount - 1 do
  begin

    StringGrid1.Cells[0, i] := format('%3s',[StringGrid1.Cells[0, i]]);
    Inc(i);
  end;
  StringGrid1.SortColRow(True, 0, 9,
    StringGrid1.RowCount - 1);

  i := 9;
  while i < StringGrid1.RowCount - 1 do
  begin
    if (StringGrid1.Cells[0, i] = '') and (StringGrid1.Cells[1, i] = '') and (StringGrid1.Cells[2, i] = '') and (StringGrid1.Cells[3, i] = '') then
    begin
      StringGrid1.DeleteRow(i);
    end;
    Inc(i);
  end;
end;

procedure TForm1.Action_Title_ProcessExecute(Sender: TObject);
var
  i, num:        integer;
  val0:          integer;
  title_shifted: boolean;
begin
  // first clean average and stdev
  //  stringgrid1.Cells[0, 4] := 'Average';
  //  stringgrid1.Cells[0, 5] := 'Stdev';
  stringgrid1.Cells[0, 4] := '';
  stringgrid1.Cells[0, 5] := '';

  // search the last 'SeqNum'
  num := 0;
  for i := 10 to StringGrid1.RowCount - 1 do
  begin
    if StringGrid1.Cells[0, i] = 'SeqNum' then
    begin
      StatusBar1.Panels[0].Text := IntToStr(i);
      num := i;
    end;
  end;
  //  if num=0 then exit;
  if num + 8 < StringGrid1.RowCount then
  begin
    for i := num to num + 8 do
    begin
      StringGrid1.MoveColRow(False, i, i - num);
    end;
  end;

  i := 9;
  while i < StringGrid1.RowCount - 1 do
  begin
    val0 := StrToIntDef(StringGrid1.Cells[0, i], -65535);
    if (val0 = -65535) or (StringGrid1.Cells[0, i] = 'SeqNum') then
    begin
      StringGrid1.DeleteRow(i);
    end
    else
    begin
      Inc(i);
    end;
  end;
  stringgrid1.Cells[0, 4] := 'Average';
  stringgrid1.Cells[0, 5] := 'Stdev';
end;

procedure TForm1.Action_Title_Process_Field_alignExecute(Sender: TObject);
var
  i, i0, i1, num0, num1: integer;
  val0, count_of_next_match: integer;
  title_shifted: boolean;
  s:    string;
  r, c: integer;

  function insert_col_with_range_of_row(col0, row0, row1: integer): boolean;
  var
    c, r: integer;
  begin
    for r := row0 to row1 do
    begin
      for c := StringGrid1.ColCount - 2 downto col0 do
      begin
        StringGrid1.cells[c + 1, r] := StringGrid1.cells[c, r];
      end;
      StringGrid1.cells[col0, r] := '';
    end;
  end;

  function copy_range_to(col0, row0, col1, row1, col_target, row_target: integer): boolean;
  var
    c, r, col_target0: integer;
  begin
    for r := row0 to row1 do
    begin
      col_target0 := col_target;
      for c := col0 to col1 do
      begin
        stringgrid1.cells[col_target0, row_target] := stringgrid1.cells[c, r];
        Inc(col_target0);

      end;
      Inc(row_target);
    end;

  end;

  procedure delete_one_title_form_row_number(i: integer);
  begin
    i0 := i;
    while i0 < 18 do
    begin
      val0 := StrToIntDef(StringGrid1.Cells[0, i0], -65535);
      if (val0 = -65535) or (StringGrid1.Cells[0, i0] = 'SeqNum') then
      begin
        StringGrid1.DeleteRow(i0);
      end
      else
      begin
        break;
      end;
    end;
  end;

begin
  while True do
  begin
    num0 := 0; // second title
    for i := 9 to StringGrid1.RowCount - 1 do
    begin
      if StringGrid1.Cells[0, i] = 'SeqNum' then
      begin
        // got first match 'SeqNum'
        num0 := i;
        break;
      end;
    end;
    if num0 = 0 then
      break;

    // find third title
    num1 := 0;
    for i := num0 + 1 to StringGrid1.RowCount - 1 do
    begin
      s := StringGrid1.Cells[0, i];
      if StringGrid1.Cells[0, i] = 'SeqNum' then
      begin
        // got first match 'SeqNum'
        num1 := i - 1; // set the latest record of this filed
        break;
      end;
    end;
    if num1 = 0 then
    begin
      // only two title has been found.
      num1 := StringGrid1.RowCount - 1;
    end;

    // title proceess
    title_shifted       := False;
    count_of_next_match := 0;
    for i := 1 to StringGrid1.ColCount - 2 do
    begin
      if StringGrid1.cells[i, num0] <> StringGrid1.cells[i, 0] then
      begin
        title_shifted       := True;
        // find count of next match
        count_of_next_match := 1;
        for i0 := i + 1 to StringGrid1.ColCount - 1 do
        begin
          if StringGrid1.cells[i0, num0] = StringGrid1.cells[i, 0] then
          begin
            break;
          end;
          Inc(count_of_next_match);
        end;
        if count_of_next_match + i + 1 > StringGrid1.ColCount then
        begin
          StatusBar1.Panels[2].Text := 'not found'; // title 0 filed larger
          count_of_next_match       := -1;
          for i0 := i + 1 to StringGrid1.ColCount - 1 do
          begin
            if StringGrid1.cells[i0, 0] = StringGrid1.cells[i, num0] then
            begin
              break;
            end;
            Dec(count_of_next_match);
          end;

          StatusBar1.Panels[2].Text := IntToStr(count_of_next_match);

          if i + 1 - count_of_next_match > StringGrid1.ColCount - 1 then
          begin
            //   title can't process
            StatusBar1.Panels[2].Text := 'title Match';
            count_of_next_match       := 0;
            title_shifted             := False;

          end;

        end
        else
        begin
          StatusBar1.Panels[2].Text := IntToStr(count_of_next_match);
        end;

        if count_of_next_match > 0 then          // title 0 more  field
        begin

          for i0 := 1 to count_of_next_match do
          begin
            // insert col in title 0
            StatusBar1.panels[2].Text := 'insert col in title 0';
            insert_col_with_range_of_row(i, 0, num0 - 1);
            copy_range_to(i, num0, i, num0 + 8, i, 0); //new field contants

          end;
          if num0 + 8 < StringGrid1.RowCount then
          begin
            for i1 := num0 to num0 + 8 do
            begin
              StringGrid1.MoveColRow(False, i1, i1 - num0);
            end;
          end;
          delete_one_title_form_row_number(9);
          break;
        end;

        if count_of_next_match < 0 then
        begin
          for i0 := -1 downto count_of_next_match do
          begin
            StatusBar1.panels[2].Text := 'insert col in second title';
            insert_col_with_range_of_row(i, num0, num1);
          end;
          delete_one_title_form_row_number(num0);
          break;
        end;

      end;

    end;

    if count_of_next_match = 0 then
    begin
      for i0 := num0 to num0 + 8 do
      begin
        if i0 > StringGrid1.RowCount then
          break;
        StringGrid1.MoveColRow(False, i0, i0 - num0);
      end;
      delete_one_title_form_row_number(9);
    end;

  end;
  //  remove empty row

end;

procedure TForm1.Chart1DblClick(Sender: TObject);
begin
  Chart1.ZoomFull;

end;

procedure TForm1.ChartToolset1DataPointCrosshairTool1Draw(ASender: TDataPointDrawTool);
var
  item:          TChartDataItem;
  ser:           TLineSeries;
  i, idx, Count: integer;
  v:             string;
  a0, a1:        integer;
begin
  if (ASender = nil) or (ASender.Series = nil) then
    Statusbar1.simpleText := ''
  else
  begin
    ser := TLineSeries(ASender.Series);
    if ser.Name <> 'Chart1LineSeries1' then
      exit;

    //    Statusbar1.panels[2].Text := Format('Series "%s": index #%d ', [ser.Title, ASender.PointIndex]);

    // get y value by index
    v  := ListChartSource1.DataPoints[ASender.PointIndex];
    a0 := pos('|', v);
    a1 := pos('|', v, a0 + 1);
    v  := copy(v, a0 + 1, a1 - a0 - 1);
    Statusbar1.panels[2].Text := Format('index #%d value:%5s', [ASender.PointIndex, v]);

    Count := 0;  // valid count
    i     := 0;
    idx   := 9;
    while i < ASender.PointIndex do
    begin
      Inc(idx);
      if (strtofloatdef(StringGrid1.cells[0, idx], -1E99) <> -1E99) or (strtofloatdef(StringGrid1.cells[StringGrid1.col, idx], -1E99) <> -1E99) then
      begin
        Inc(i);
        Inc(Count);
        //if count-10=ASender.PointIndex then break;
      end;
      if (idx > StringGrid1.rowcount) then
        break;
    end;
    StringGrid1.Row := idx;
  end;
end;

procedure TForm1.ComboBox_log_searchChange(Sender: TObject);
var
  i, j, col0: integer;
begin
  // search keyword
  StatusBar1.panels[2].Text := '';

  col0 := StringGrid1.col + 1;
  for i := StringGrid1.row to StringGrid1.RowCount - 1 do
  begin
    for j := col0 to StringGrid1.ColCount - 1 do
    begin
      if pos(ComboBox_log_search.Text, StringGrid1.Cells[j, i]) <> 0 then
      begin
        StringGrid1.col := j;
        StringGrid1.row := i;
        exit;
      end;
    end;
    col0 := 1;
  end;
  if i >= StringGrid1.ColCount - 1 then
  begin
    StatusBar1.panels[2].Text := 'None';
    StringGrid1.Col           := 0;
  end;

end;

procedure TForm1.ComboBox_title_searchChange(Sender: TObject);
var
  j, col0: integer;
begin
  // search keyword
  StatusBar1.panels[2].Text := '';

  col0 := StringGrid1.col;
  for j := col0 to StringGrid1.ColCount - 1 do
  begin
    if pos(uppercase(ComboBox_title_search.Text), uppercase(StringGrid1.Cells[j, 0])) <> 0 then
    begin
      StringGrid1.col := j;
      StringGrid1.row := 8;
      exit;
    end;

  end;
  if j >= StringGrid1.ColCount - 1 then
  begin
    StatusBar1.panels[2].Text := 'None';
    StringGrid1.Col           := 0;
  end;

end;

procedure TForm1.ComboBox_title_searchKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
var
  col_old: integer;
begin
  //StatusBar1.Panels[2].Text := IntToStr(key);
  col_old := StringGrid1.col;
  if (key = 114) or (key = 13) then
  begin
    StringGrid1.col := StringGrid1.col + 1;


    //start over search again
    //StringGrid1.row := 8;
    ComboBox_title_search.OnChange(self);
    if StringGrid1.Col = 1 then
      StringGrid1.Col := col_old;


    if key = 13 then
    begin
      ComboBox_title_search.Items.Insert(0, ComboBox_title_search.Text);
    end;
  end;

end;

procedure TForm1.ComboBox_log_searchKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
var
  col_old: integer;
begin
  if ComboBox_title_search.Focused then
    exit;
  StatusBar1.Panels[1].Text := IntToStr(key);
  ;
  if (key = 114) or (key = 13) then
  begin
    //start over search again
    //col_old:=
    StringGrid1.col := StringGrid1.col + 1;
    ComboBox_log_search.OnChange(self);
    if key = 13 then
    begin
      ComboBox_title_search.Items.Insert(0, ComboBox_title_search.Text);
    end;

  end;

end;


procedure TForm1.FormActivate(Sender: TObject);
begin
  //Action_cleanupExecute(self);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i: integer;
  s: string;

begin
  latest_file_name := Application.ExeName;

  for i := 1 to 2 do
  begin
    s := ParamStr(i);
    //memo2.Lines.Add(s);

    if FileExists(s) then
    begin
      loadfile(s);
      //Memo1.Lines.LoadFromFile(s);
    end;
  end;
end;

procedure TForm1.FormDragOver(Sender, Source: TObject; X, Y: integer; State: TDragState; var Accept: boolean);
begin
  Accept := True;
end;

procedure TForm1.FormDropFiles(Sender: TObject; const FileNames: array of string);
var
  f1:    string;
  f_cnt: integer;
begin
  f_cnt := high(FileNames);
  f_cnt := 0;

  for f_cnt := 0 to high(FileNames) do
  begin
    f1 := FileNames[f_cnt];
    if FileExists(f1) then
    begin
      StatusBar1.Panels[2].Text := F1;
      if (f_cnt = 0) then
      begin
        case shift_status of
          0:
          begin
            loadfile(f1);
          end;
          1:
          begin
            Addfile(f1);
          end;
          2:
          begin
            Addfile_side(f1);
          end;
        end;

      end
      else
      begin
        case shift_status of
          0:
          begin
            Addfile(f1);
          end;
          1:
          begin
            Addfile(f1);
          end;
          2:
          begin
            Addfile_side(f1);
          end;
        end;

      end;

    end;

  end;

  f1 := FileNames[f_cnt];
  latest_file_name := f1;
  StatusBar1.Panels[0].Text := Format('Col:%3d, Row:%3d /[%3d]  ', [StringGrid1.col, StringGrid1.row, StringGrid1.RowCount]);

end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  Action_analysisExecute(self);

end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
  //MessageDlg('Log Analysis tool,'+#13+#10+'   Author: Vincent Cheng (Tel: +886-963-080987),'+#13+#10+'   Company: Maetay'+#13+#10+'   Date: 2017-04-08', mtInformation, [mbOK], 0);
  ShowAboutBox;
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
begin
  MenuItem_Append_btm.Checked := not MenuItem_Append_btm.Checked;
  if (not MenuItem_Append_btm.Checked) then
  begin
    MenuItem7.Checked := True;
  end;
end;

procedure TForm1.MenuItem_add_right_sideClick(Sender: TObject);
begin
  if MenuItem_add_right_side.Checked then
  begin
    shift_status := 2;
    MenuItem_load_new_F.Checked := False;
    MenuItem_Append_btm.Checked := False;
  end;

end;

procedure TForm1.MenuItem_Append_btmClick(Sender: TObject);
begin
  if MenuItem_Append_btm.Checked then
  begin
    shift_status := 1;
    MenuItem_load_new_F.Checked := False;
    MenuItem_add_right_side.Checked := False;
  end;

end;

procedure TForm1.MenuItem_load_new_FClick(Sender: TObject);
begin
  //  MenuItem_load_new_F.Checked := not MenuItem_load_new_F.Checked;
  if MenuItem_load_new_F.Checked then
  begin
    shift_status := 0;
    MenuItem_add_right_side.Checked := False;
    MenuItem_Append_btm.Checked := False;
  end;

end;

procedure TForm1.MenuItem_drawClick(Sender: TObject);
var
  col1, row1: integer;
  val:        extended;
  x:          integer;
begin
  col1 := StringGrid1.Col;
  ListChartSource1.Clear;
  x := 0;
  for row1 := 9 to StringGrid1.RowCount - 1 do
  begin
    val := StrToFloatDef(StringGrid1.Cells[col1, row1], 1E99);
    if val <> 1E99 then
    begin
      Inc(x);
      ListChartSource1.Add(x, val, IntToStr(x), clred);
    end;
  end;

end;

procedure TForm1.MenuItem_exitClick(Sender: TObject);
begin
  Close;
end;


procedure TForm1.MenuItem_mark_distribution_valueClick(Sender: TObject);
begin
  if MenuItem_mark_distribution_value.Checked then
  begin
    Chart2BarSeries1.Marks.Visible := True;
  end
  else
  begin
    Chart2BarSeries1.Marks.Visible := False;
  end;

end;

procedure TForm1.MenuItem_mark_valueClick(Sender: TObject);
begin
  if MenuItem_mark_value.Checked then
  begin
    Chart1LineSeries1.Marks.Visible := True;
  end
  else
  begin
    Chart1LineSeries1.Marks.Visible := False;
  end;
end;

procedure TForm1.MenuItem_OpenClick(Sender: TObject);
var
  cnt:        integer;
  FileNames0: array of string;
begin
  OpenDialog1.InitialDir := ExtractFileDir(latest_file_name);
  if OpenDialog1.Execute then
  begin

    SetLength(FileNames0, OpenDialog1.Files.Count);

    for cnt := 0 to OpenDialog1.Files.Count - 1 do
    begin
      FileNames0[cnt] := OpenDialog1.Files[cnt];
    end;

    FormDropFiles(Self, FileNames0);
{
    //OpenDialog1.Files.Count;
    for cnt := 0 to (OpenDialog1.Files.Count - 1) do
    begin
      if FileExists(OpenDialog1.Files[cnt]) then
      begin
        if cnt = 0 then
          loadfile(OpenDialog1.Files[cnt])
        else
          Addfile(OpenDialog1.Files[cnt]);
      end;
    end;
}

  end;
end;

procedure TForm1.MenuItem_Reload_fileClick(Sender: TObject);
begin
  loadfile(latest_file_name);
end;

procedure TForm1.MenuItem_show_pointerClick(Sender: TObject);
begin
  Chart1LineSeries1.Pointer.Visible := MenuItem_show_pointer.Checked;
end;

procedure TForm1.StringGrid1Click(Sender: TObject);
var
  width1, max1, max2, row1: integer;
  cols, rows: integer;
  val:        extended;
  Data1:      array of extended;
  x:          integer;

begin
  StatusBar1.Panels[0].Text := Format('Col:%3d, Row:%3d /[%3d]  ', [StringGrid1.col, StringGrid1.row, StringGrid1.RowCount]);

  //adj width
  Width1 := StringGrid1.ColWidths[StringGrid1.Col];
  max1   := StringGrid1.Canvas.TextWidth(StringGrid1.cells[StringGrid1.col, StringGrid1.Row] + 'x');
  max2   := StringGrid1.Canvas.TextWidth(StringGrid1.cells[StringGrid1.col, 0] + 'x');

  max1 := max(max1, width1);
  max1 := max(max2, max1);
  StringGrid1.ColWidths[StringGrid1.Col] := max1;

  cols := StringGrid1.Selection.Right - StringGrid1.Selection.Left;
  rows := StringGrid1.Selection.Bottom - StringGrid1.Selection.Top;
  StatusBar1.Panels[1].Text := Format('Sel x:%3d y:%3d ', [cols + 1, rows + 1]);

  if rows >= 1 then //small renge calc
  begin
    Action_Analysis_range(StringGrid1.Selection.Left, StringGrid1.Selection.Top, StringGrid1.Selection.Right, StringGrid1.Selection.Bottom);
    exit;
  end;

  // if cols=1 then
  begin

    ListChartSource3.Clear;
    ;
    x := 0;
    SetLength(Data1, StringGrid1.RowCount);
    for row1 := 9 to StringGrid1.RowCount - 1 do
    begin
      val := StrToFloatDef(StringGrid1.Cells[StringGrid1.Col, row1], 1E99);
      if val <> 1E99 then
      begin
        Data1[x] := val;
        Inc(x);
        ListChartSource3.Add(x, val, IntToStr(x), clred);
      end;
    end;
  end;
end;

procedure TForm1.StringGrid1DrawCell(Sender: TObject; aCol, aRow: integer; aRect: TRect; aState: TGridDrawState);
begin
  if aRow = 1 then
  begin
    if StringGrid1.Cells[aCol, aRow] = '@' then
    begin
      stringgrid1.canvas.Brush.Color := clYellow;
      stringgrid1.canvas.FillRect(arect);
      StringGrid1.Canvas.Font.Color := clBlack;//  (acol,arow).Canvas.);
      StringGrid1.Canvas.TextOut(aRect.Left + 2, aRect.Top + 2, '@');
    end;
  end;
  if (aRow > 3) and (aRow < 9) then
  begin
    case aRow of
      4:
      begin
        stringgrid1.canvas.Brush.Color := clAqua;
        stringgrid1.canvas.FillRect(arect);
      end;
      5:
      begin
        stringgrid1.canvas.Brush.Color := clAqua;
        stringgrid1.canvas.FillRect(arect);
      end;
      6:
      begin
        stringgrid1.canvas.Brush.Color := clSkyBlue;
        stringgrid1.canvas.FillRect(arect);
      end;
      7:
      begin
        stringgrid1.canvas.Brush.Color := clSkyBlue;
        stringgrid1.canvas.FillRect(arect);
      end;
      8:
      begin
        stringgrid1.canvas.Brush.Color := $FF80FF;
        stringgrid1.canvas.FillRect(arect);
      end;

    end;
    //stringgrid1.canvas.Brush.Color := clYellow;
    //stringgrid1.canvas.FillRect(arect);
    StringGrid1.Canvas.Font.Color := clBlack;//  (acol,arow).Canvas.);
    //StringGrid1.Canvas.TextOut(aRect.Left + 2, aRect.Top + 2, '@');
    StringGrid1.Canvas.TextOut(aRect.Left + 2, aRect.Top + 2, StringGrid1.cells[aCol, aRow]);
  end;

end;

procedure TForm1.StringGrid1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if ((key = 40) and (ssCtrl in Shift)) then   // down key
  begin
    Action_find_next_failExecute(self);
    Key := 0;
  end;
  if (key = 38) and (ssCtrl in Shift) then   // up key
  begin
    Action_Find_Previous_FailExecute(self);
    Key := 0;
  end;

end;

procedure TForm1.StringGrid1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  if ((ssExtra1 in Shift)) then   // down key
  begin
    Action_find_next_failExecute(self);
  end;
  if ((ssExtra2 in Shift)) then   // up key
  begin
    Action_Find_Previous_FailExecute(self);
  end;

end;

procedure TForm1.StringGrid1MouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: integer; MousePos: TPoint; var Handled: boolean);
begin
  if (ssALT in shift) and (WheelDelta > 0) then
  begin
    Action_Find_Previous_FailExecute(self);
    Handled := True;
    //WheelDelta:=0;
    exit;
  end;
  if (ssALT in shift) and (WheelDelta < 0) then
  begin
    Action_Find_Next_FailExecute(self);
    Handled := True;
    //WheelDelta:=0;
    exit;
  end;
    StatusBar1.Panels[2].Text:=inttostr( wheeldelta);
  if abs(wheeldelta)>240 then
  begin
    stringgrid1.Row:= stringgrid1.Row-wheeldelta div 24;

  end;


end;

function TForm1.loadfile(filename: string): boolean;
var
  i, fix: integer;
  s:      string;
begin
  if FileExists(fileName) then
  begin
    StringGrid1.Clean;
    StringGrid1.FixedRows := 0;
    StringGrid1.LoadFromCSVFile(filename, ',', True, 0, True);
    // flaxable fix row
    for i := 1 to 100 do
    begin
      if strtointdef(StringGrid1.Cells[0, i], -1) > 0 then
      begin
        fix := i;
        break;
      end;
    end;
    for i := fix to 8 do
    begin
      StringGrid1.InsertRowWithValues(1, ['']);
    end;
    s := ExtractFileName(filename);
    StringGrid1.Cells[1, 1] := copy(s, length(s) - 10, 7);

    StringGrid1.FixedRows := 9;
    StringGrid1.RowCount  := StringGrid1.RowCount + 1;

    //    stringgrid1.Cells[0, 4] := 'Average';
    //    stringgrid1.Cells[0, 5] := 'Stdev';
    latest_file_name := fileName;
  end;

end;

function TForm1.Addfile(filename: string): boolean;
var
  cnt, row1, row2: integer;

begin
  if FileExists(fileName) then
  begin
    StringGrid2.LoadFromCSVFile(filename, ',', False, 0, True);
    //StringGrid2.Visible:=True;
    //move all data got to stringgrid1
    row1 := StringGrid1.RowCount;
    StringGrid1.RowCount := StringGrid1.RowCount + StringGrid2.RowCount + 1;
    row2 := 1;
    if StringGrid2.ColCount > StringGrid1.ColCount then
    begin
      StringGrid1.ColCount := StringGrid2.ColCount;
    end;
    for cnt := row1 to row1 + StringGrid2.RowCount - 2 do
    begin
      StringGrid1.Rows[cnt] := StringGrid2.Rows[row2];
      Inc(row2);
    end;
  end;

end;

function TForm1.Addfile_side(filename: string): boolean;
var
  cnt, row1, row2: integer;
  col0, col1, col2: integer;
  s: string;

begin
  if FileExists(fileName) then
  begin
    StringGrid2.LoadFromCSVFile(filename, ',', False, 0, True);
    //StringGrid2.Visible:=True;
    //move all data got to stringgrid1
    row1 := StringGrid1.RowCount;
    row2 := StringGrid2.RowCount - 1;
    //StringGrid1.RowCount:=StringGrid1.RowCount+StringGrid2.RowCount+1;
    //row2:=1;
    col0 := StringGrid1.colCount - 1;
    stringgrid1.ColCount := col0 + StringGrid2.ColCount;
    stringgrid1.RowCount := max(stringgrid1.RowCount, StringGrid2.rowcount + 7);
    col1 := stringgrid1.ColCount;
    col2 := StringGrid2.ColCount;
    s    := ExtractFileName(filename);

    for cnt := 1 to row2 do
    begin
      StringGrid1.Cells[col0 + 1, 1] := copy(s, length(s) - 10, 7);

      for col1 := 1 to col2 - 1 do
      begin
        StringGrid1.Cells[col0 + col1, cnt + 7] := StringGrid2.Cells[col1, cnt];
      end;

    end;
  end;

end;


end.
