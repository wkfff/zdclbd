unit udata_display;

interface

uses
  Windows, Messages, SysUtils, Variants, classes, Graphics, Controls, Forms,
  Dialogs, Grids, ValEdit, ExtCtrls, StdCtrls, Buttons, DB, ADODB, comCtrls,emapker;

type
  Tdata_display = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    StringGrid1: TStringGrid;
    Panel2: TPanel;
    Panel4: TPanel;
    PanelLayerInfo: TPanel;
    SpeedButtonUp: TSpeedButton;
    SpeedButtonDown: TSpeedButton;
    SpeedButtonList: TSpeedButton;
    LabelLayerName: TLabel;
    procedure SpeedButton5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedButtonListClick(Sender: TObject);
    procedure SpeedButtonUpClick(Sender: TObject);
    procedure SpeedButtonDownClick(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    FSelectLayerCnt : Integer;
    FCurrentRow : Integer;
    procedure ShowLayerInfoList;
    procedure ShowALayerInfo();
  public
    SelectLayers :  array of TDrawLayer;
    FieldUidValueAry: array of Integer;
    { Public declarations }
    procedure iniform(dataset: tdataset; KeyFieldName: string; KeyFieldValue: Variant; LayName: string);
    procedure InitForm(var ASelectLayers:array of TDrawLayer;AFieldUidValueAry: array of Integer);
    procedure ClearForm;
  end;
      
var
  data_display: Tdata_display;

implementation

{$R *.dfm}
uses umainf;
procedure Tdata_display.iniform(dataset: tdataset; KeyFieldName: string; KeyFieldValue: Variant; LayName: string);
var row, ts, i: smallint;
  strname: string;
begin
  Panel2.Caption := '图层：' + LayName;
  StringGrid1.RowCount := 2;
  StringGrid1.Cells[0, 0] := '名称';
  StringGrid1.Cells[1, 0] := '值';
  try
    if not dataset.Locate(KeyFieldName, KeyFieldValue, [lopartialkey]) then exit;
    ts := dataset.FieldCount;
    if ts < 1 then exit;
    StringGrid1.RowCount := ts + 1;
    row := 0;
    for i := 0 to ts - 1 do
    begin
      strname := dataset.Fields[i].FieldName;
      if lowercase(strname) = 'recid' then
      begin
        StringGrid1.RowCount := StringGrid1.RowCount - 1;
        continue;
      end;
      row := row + 1;
      StringGrid1.Cells[0, row] := strname;
      StringGrid1.Cells[1, row] := dataset.Fields[i].Text;
    end;
  except
  end;
end;
procedure Tdata_display.SpeedButton5Click(Sender: TObject);
begin
  close;
end;

procedure Tdata_display.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure Tdata_display.Panel4Click(Sender: TObject);
begin
  close;
end;

procedure Tdata_display.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  umainf.Mainf.FDlg_Map.Panel_data_display.Hide;  2011-12-02
end;

procedure Tdata_display.InitForm(var ASelectLayers:array of TDrawLayer;AFieldUidValueAry: array of Integer);
var
  i: integer;
begin

  FSelectLayerCnt := Length(ASelectLayers);
  SetLength(SelectLayers,FSelectLayerCnt);
  for i:= 0 to FSelectLayerCnt-1 do
    SelectLayers[i] := ASelectLayers[i];
 // CopyMemory(@SelectLayers[0],@ASelectLayers[0],FSelectLayerCnt);
  setlength(FieldUidValueAry,FSelectLayerCnt);
  CopyMemory(@FieldUidValueAry[0],@AFieldUidValueAry[0],FSelectLayerCnt*4);
  ShowLayerInfoList;
end;

procedure Tdata_display.ShowLayerInfoList;
var
  i,j,c: integer;
  s:string;
//  dataSet : TDataSet;
begin
  for i:=0 to StringGrid1.RowCount-1 do
  begin
     StringGrid1.Rows[i].Clear;
  end;
  Panel2.Caption := '共有'+IntToStr(FSelectLayerCnt)+'层：';
  StringGrid1.RowCount := FSelectLayerCnt +1;
  StringGrid1.Cells[0, 0] := '图层名';
  StringGrid1.Cells[1, 0] := '当前标注';
  c:=1;
  for i:= 0 to FSelectLayerCnt -1 do
  begin
    j:=SelectLayers[i].Data.GetMetaIndex(FieldUidValueAry[i]);
    s:= SelectLayers[i].Data.GetMetaName(SelectLayers[i].Data.GetMeta(j));
    if s<>'' then
    begin
      StringGrid1.Cells[1,c]:= s;
      StringGrid1.Cells[0,c]:= SelectLayers[i].LayerName;
      inc(c);
    end;

  end;
  //if PanelLayerInfo.Visible then PanelLayerInfo.Visible := false;

end;

procedure Tdata_display.ClearForm;
begin
  Panel2.Caption := '没有图层';
  StringGrid1.RowCount := 1;
  StringGrid1.Cells[0, 0] := '图层名';
  StringGrid1.Cells[1, 0] := '当前标注';
end;

procedure Tdata_display.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  col,row: Integer;
begin
  if PanelLayerInfo.Visible then exit;//在详细时，不能点中了
  StringGrid1.MouseToCell(x,y,col,row);
  if row =0 then exit;
  FCurrentRow := row;
end;

procedure Tdata_display.showALayerInfo();
var
  dataSet: TDataSet;
  i: integer;
  layer : TDrawLayer;
  row : Integer;
begin
  SpeedButtonUp.Enabled := (FCurrentRow>1);
  SpeedButtonDown.Enabled := (FCurrentRow<FSelectLayerCnt);
  layer := SelectLayers[FCurrentRow-1];
{  dataSet := layer.Data.DataSet;
  if not PanelLayerInfo.Visible then PanelLayerInfo.Visible := True;
  if not LabelLayerName.Visible then LabelLayerName.Visible := True;
  LabelLayerName.Caption := layer.LayerName;
  StringGrid1.Cells[0, 0] := '字段名';
  StringGrid1.Cells[1, 0] := '值';
  StringGrid1.RowCount := dataSet.fieldCount +1 ;
  row := 1;
  for i:= 0 to dataSet.FieldCount-1 do
  begin
    if (UpperCase(dataSet.Fields[i].FieldName)='UID') or
      (UpperCase(dataSet.Fields[i].FieldName)='RECID') then
    begin
      StringGrid1.RowCount := StringGrid1.RowCount -1 ;
      Continue;
    end;
    StringGrid1.Cells[0,row] := dataSet.Fields[i].FieldName;
    StringGrid1.Cells[1,row] := dataSet.Fields[i].Value;
    Inc(row);
  end;
  if StringGrid1.ShowHint then
    StringGrid1.ShowHint := False;   }
end;

procedure Tdata_display.SpeedButtonListClick(Sender: TObject);
begin
  if PanelLayerInfo.Visible then PanelLayerInfo.Visible := false;
  ShowLayerInfoList;
end;

procedure Tdata_display.SpeedButtonUpClick(Sender: TObject);
begin
  Dec(FCurrentRow);
  ShowALayerInfo();
end;

procedure Tdata_display.SpeedButtonDownClick(Sender: TObject);
begin
  Inc(FCurrentRow);
  ShowALayerInfo();
end;

procedure Tdata_display.StringGrid1DblClick(Sender: TObject);
begin
  showALayerInfo();
end;

end.
