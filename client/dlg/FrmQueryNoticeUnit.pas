unit FrmQueryNoticeUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxSplitter, cxInplaceContainer, cxControls, StdCtrls, Mask, RzEdit,
  RzButton, ComCtrls, Buttons, ExtCtrls, DBClient, ImgList;

type
  TfrmQueryNotice = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    btnQuery: TSpeedButton;
    Label5: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BitBtnToExcel: TBitBtn;
    BitBtn2: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    cbxState: TComboBox;
    Panel4: TPanel;
    Panel5: TPanel;
    lblAlarmDataCountTip: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    cbxPageSize: TComboBox;
    btnPageFirst: TRzButton;
    btnPagePrevious: TRzButton;
    btnPageNext: TRzButton;
    btnPageLast: TRzButton;
    edtCurrPageNo: TRzEdit;
    edtTotalPageCount: TRzEdit;
    cxTreeList1: TcxTreeList;
    cxTreeList1cxTreeListColumn1: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn2: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn3: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn4: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn5: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn6: TcxTreeListColumn;
    ImageList1: TImageList;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    procedure FormCreate(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbxPageSizeChange(Sender: TObject);
    procedure btnPageFirstClick(Sender: TObject);
    procedure btnPagePreviousClick(Sender: TObject);
    procedure btnPageNextClick(Sender: TObject);
    procedure btnPageLastClick(Sender: TObject);
    procedure BitBtnToExcelClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure cxTreeList1CustomDrawCell(Sender: TObject;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
      var ADone: Boolean);
    procedure edtCurrPageNoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCurrPageNoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FTemp: TClientDataSet;

    procedure refreshTotalDataCount();
    procedure refreshPageNo();

    procedure queryDataByPage(pageNo: Integer);

    procedure DoOnQueryNoticeCount(DataCount: Integer);
    procedure DoOnQueryNoticeData(AInfo: OleVariant);
  public
    { Public declarations }
  end;

var
  querySTime: string;
  queryETime: string;
  queryState: Integer;
  pageSize: Integer = 20;     //每页大小
  totalPageCount: Integer = 0;//总页数
  currPageNo: Integer = 0;    //当前页码
  totalDataCount: Integer = 0;//总记录数

implementation

{$R *.dfm}

uses
  uGloabVar, BusinessServerUnit, ComObj;

procedure ExportToExcel(Caption: string; LvData: TcxTreeList);
var
  ExlApp: Variant;
  i, j: Integer;
begin
  try
    ExlApp := CreateOleObject('Excel.Application');
    ExlApp.Workbooks.Add;
    ExlApp.Visible := True;
    ExlApp.Caption := Caption;
    ExlApp.Workbooks[1].WorkSheets[1].Rows[1].Font.Bold := True;
  except
    on E: Exception do
    begin
      Application.MessageBox(PChar('初始化Microsoft Excel失败:' + E.Message), '提示', MB_OK + MB_ICONERROR);
      ExlApp.Quit;
      Exit;
    end;
  end;

  Application.Restore;
  Application.BringToFront;

  for i := 0 to LvData.ColumnCount - 1 do
  begin
    ExlApp.Cells(1, i + 1) := LvData.Columns[i].Caption.Text;
    if not LvData.Columns[i].Visible then
      ExlApp.ActiveSheet.Columns[i + 1].Hidden := True;
  end;

  for i := 0 to LvData.Count - 1 do
  begin
    for j := 0 to LvData.Items[i].ValueCount-1 do
    begin
      ExlApp.Cells[i + 2, j+1 ] := LvData.Items[i].Values[j];
    end;
  end;
  //设置格式和宽度
  ExlApp.range['D2:D'+inttostr(LvData.Count+1)].NumberFormatLocal := 'yyyy-mm-dd hh:mm:ss';
  ExlApp.range['F2:F'+inttostr(LvData.Count+1)].NumberFormatLocal := 'yyyy-mm-dd hh:mm:ss';
  ExlApp.Columns[1].ColumnWidth := 5;
  ExlApp.Columns[2].ColumnWidth := 20;
  ExlApp.Columns[3].ColumnWidth := 50;
  ExlApp.Columns[4].ColumnWidth := 20;
  ExlApp.Columns[5].ColumnWidth := 6;
  ExlApp.Columns[6].ColumnWidth := 20;
end;  

procedure TfrmQueryNotice.FormCreate(Sender: TObject);
var
  dt: TDateTime;
begin
  dt := Now;
  DateTimePicker3.Date:= dt;
  DateTimePicker4.Time:= dt;

  dt := IncMonth(dt, -1);
  DateTimePicker1.Date:= dt;
  DateTimePicker2.Time:= dt;

  cbxState.ItemIndex := 0;
  FTemp := TClientDataSet.Create(nil);
end;

procedure TfrmQueryNotice.btnQueryClick(Sender: TObject);
var
  fromDate, ToDate: TDateTime;
  queryNoticeCountThread: TQueryNoticeCount;
begin
  fromDate := DateTimePicker1.Date;
  ReplaceTime(fromDate, DateTimePicker2.Time);

  ToDate := DateTimePicker3.Date;
  ReplaceTime(ToDate, DateTimePicker4.Time);

  if FromDate > ToDate then
  begin
    ShowTips('开始日期应小于结束日期，请检查！', DateTimePicker3);
    DateTimePicker3.SetFocus;
    exit;
  end;

  querySTime := FormatDateTime('yyyy-MM-dd hh:nn:ss', fromDate);
  queryETime := FormatDateTime('yyyy-MM-dd hh:nn:ss', ToDate);
  queryState := cbxState.ItemIndex - 1;

  totalDataCount := 0;
  totalPageCount := 0;
  currPageNo := 0;
  refreshTotalDataCount;
  refreshPageNo;
  cxTreeList1.Clear;
  queryNoticeCountThread := TQueryNoticeCount.Create(querySTime, queryETime, queryState);
  queryNoticeCountThread.OnQueryNoticeCount := DoOnQueryNoticeCount;
end;

procedure TfrmQueryNotice.refreshPageNo;
begin
  edtCurrPageNo.Text := IntToStr(currPageNo);
  edtTotalPageCount.Text := IntToStr(totalPageCount);
end;

procedure TfrmQueryNotice.refreshTotalDataCount;
begin
  lblAlarmDataCountTip.Caption := '共' + IntToStr(totalDataCount) + '条记录';
end;

procedure TfrmQueryNotice.DoOnQueryNoticeCount(DataCount: Integer);
var
  queryNoticeDataThread: TQueryNoticeData;
begin
  try
    if DataCount <= 0 then
    begin
      MessageBox(Handle,'对不起，没有符合条件的数据！','提示',MB_OK + MB_ICONINFORMATION);
      Exit;
    end
    else
    begin
      if DataCount mod pageSize <> 0 then
        totalPageCount := DataCount div pageSize + 1
      else
        totalPageCount := DataCount div pageSize;

      totalDataCount := DataCount;
      edtTotalPageCount.Text := IntToStr(totalPageCount)
    end;
    queryNoticeDataThread := TQueryNoticeData.Create(querySTime, queryETime,  queryState, pageSize, currPageNo + 1);
    queryNoticeDataThread.OnQueryNoticeData := DoOnQueryNoticeData;
    currPageNo := 1;
    refreshTotalDataCount;
//    refreshPageNo;
  except
    on E: Exception do
    begin
      MessageBox(Handle, '查询报警信息总数失败', '提示', MB_OK + MB_ICONINFORMATION);
      exit;
    end;
  end;
end;

procedure TfrmQueryNotice.DoOnQueryNoticeData(AInfo: OleVariant);
var
  i: Integer;
  alarmType: Integer;
  areaType: Integer;
  areaNo: Integer;
begin
  if (AInfo = null) or (Length(AInfo) = 0) then  Exit;

  FTemp.XMLData := AInfo;
  FTemp.Open;
  FTemp.First;

  for i:= 0 to FTemp.RecordCount - 1 do
  begin
    try
      with cxTreeList1.Add do
      begin
        Values[0] := IntToStr(i + 1);
        Values[1] := FTemp.FieldByName('title').AsString;
        Values[2] := FTemp.FieldByName('memo').AsString;
        Values[3] := FormatDateTime('yyyy-MM-dd hh:nn:ss', FTemp.FieldByName('sendtime').AsDateTime);

        if FTemp.FieldByName('isread').AsInteger = 0 then
        begin
          Values[4] := '已读';
          Values[5] := FormatDateTime('yyyy-MM-dd hh:nn:ss', FTemp.FieldByName('sendtime').AsDateTime);
          StateIndex := 1;
        end
        else
        begin
          Values[4] := '未读';
          StateIndex := 0;
        end
      end;
    except

    end;
    FTemp.Next;
  end;
  edtCurrPageNo.Text := IntToStr(currPageNo);
end;

procedure TfrmQueryNotice.FormDestroy(Sender: TObject);
begin
  FTemp.Free;
end;

procedure TfrmQueryNotice.cbxPageSizeChange(Sender: TObject);
begin
  pageSize := StrToInt(cbxPageSize.Text);
  btnQuery.Click; 
end;

procedure TfrmQueryNotice.btnPageFirstClick(Sender: TObject);
begin
  if currPageNo <= 1 then Exit;

  cxTreeList1.Clear;
  queryDataByPage(1);
end;

procedure TfrmQueryNotice.btnPagePreviousClick(Sender: TObject);
begin
  if currPageNo <= 1 then Exit;

  cxTreeList1.Clear;
  queryDataByPage(currPageNo - 1);
end;

procedure TfrmQueryNotice.btnPageNextClick(Sender: TObject);
begin
  if currPageNo >= totalPageCount then Exit;

  cxTreeList1.Clear;
  queryDataByPage(currPageNo + 1);
end;

procedure TfrmQueryNotice.btnPageLastClick(Sender: TObject);
begin
  if currPageNo >= totalPageCount then Exit;

  cxTreeList1.Clear;
  queryDataByPage(totalPageCount);
end;

procedure TfrmQueryNotice.queryDataByPage(pageNo: Integer);
var
  queryNoticeDataThread: TQueryNoticeData;
begin
  queryNoticeDataThread := TQueryNoticeData.Create(querySTime, queryETime, queryState, pageSize, pageNo);
  queryNoticeDataThread.OnQueryNoticeData := DoOnQueryNoticeData;
  currPageNo := pageNo;
end;

procedure TfrmQueryNotice.BitBtnToExcelClick(Sender: TObject);
begin
  if cxTreeList1.Count <= 0 then Exit;

  ExportToExcel('平台通知',cxTreeList1);
end;

procedure TfrmQueryNotice.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmQueryNotice.cxTreeList1CustomDrawCell(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
begin
  if AViewInfo.Node.Values[4] = '已读' then
    ACanvas.Font.Style := []
  else
    ACanvas.Font.Style := [fsBold];
end;

procedure TfrmQueryNotice.edtCurrPageNoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then Key := #0;
end;

procedure TfrmQueryNotice.edtCurrPageNoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  i: Integer;
begin
  if Key = 13 then
  begin
    i := StrToInt(edtCurrPageNo.Text);
    if (i <= 0) or (i > totalPageCount) or (i = currPageNo) then Exit;

    cxTreeList1.Clear;
    queryDataByPage(i);
  end;
end;

procedure TfrmQueryNotice.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ManualDock(nil);
end;

end.
