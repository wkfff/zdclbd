unit FrmBaseQueryUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxSplitter, ExtCtrls, RzPanel, ComCtrls, cxGraphics,
  cxCustomData, cxStyles, cxTL, RzButton, StdCtrls, Mask, RzEdit,
  cxInplaceContainer, RzCmboBx, RzLabel, cxTextEdit, RzDTP, CarUnit,
  BusinessServerUnit, DBClient;

type
  TfrmBaseQuery = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    cxSplitter1: TcxSplitter;
    pnlSelGroupName: TRzPanel;
    TreeView1: TTreeView;
    RzPanel4: TRzPanel;
    RzPanel5: TRzPanel;
    RzPanel6: TRzPanel;
    RzPanel7: TRzPanel;
    lblTotalCount: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edtCurrPageNo: TRzEdit;
    edtTotalPageCount: TRzEdit;
    btnPageFirst: TRzBitBtn;
    btnPagePrevious: TRzBitBtn;
    btnPageNext: TRzBitBtn;
    btnPageLast: TRzBitBtn;
    RzLabel1: TRzLabel;
    cbxCarNo: TRzComboBox;
    cxTreeList1: TcxTreeList;
    RzLabel2: TRzLabel;
    RzDateTimePicker1: TRzDateTimePicker;
    RzDateTimePicker2: TRzDateTimePicker;
    RzDateTimePicker3: TRzDateTimePicker;
    RzDateTimePicker4: TRzDateTimePicker;
    RzLabel3: TRzLabel;
    btnQuery: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzBitBtn3: TRzBitBtn;
    cbxPageSize: TRzComboBox;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    procedure TreeView1Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure btnPageFirstClick(Sender: TObject);
    procedure btnPagePreviousClick(Sender: TObject);
    procedure btnPageNextClick(Sender: TObject);
    procedure btnPageLastClick(Sender: TObject);
    procedure cbxPageSizeChange(Sender: TObject);
    procedure edtCurrPageNoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCurrPageNoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure RzBitBtn3Click(Sender: TObject);
    procedure cbxCarNoExit(Sender: TObject);
  private
    { Private declarations }
    procedure InitEdit;
    procedure ListGroup;
    procedure AddDev(grpId: integer);

  protected
    FTemp: TClientDataSet;
    FQueryCondition: TQueryCondition;
    procedure queryData;
    procedure queryCount;
    procedure refreshTotalDataCount();
    procedure refreshPageNo;
    function initQueryCondition: Boolean; virtual;
    procedure queryDataByPage(pageNo: Integer); virtual;
    procedure DoOnQueryCount(DataCount: Integer); virtual;
    procedure DoOnQueryData(AInfo: OleVariant); virtual;
    procedure ExportToExcel(Caption: string; cxTreeList: TcxTreeList);
    procedure setExcelData(ExlApp: Variant; cxTreeList: TcxTreeList); virtual;
    procedure setExcelFormat(ExlApp: Variant); virtual;
  public
    { Public declarations }
  end;

var
  group_id: integer = -1;
  group_parent: string = '';

  querySTime: string;
  queryETime: string;
  queryCarNo: string = '';
  querySim_no: string = '';
  queryDevId: string;
  queryGroupId: Integer;
  queryGroupList: string;

  pageSize: Integer = 20;     //每页大小
  totalPageCount: Integer = 0;//总页数
  currPageNo: Integer = 0;    //当前页码
  totalDataCount: Integer = 0;//总记录数

implementation

uses
  uGloabVar, StrUtils, DateUtils, ComObj;

{$R *.dfm}


procedure TfrmBaseQuery.AddDev(grpId: integer);
var
  i: integer;
  node: TTreeNode;
  dev: TDevice;
begin
  try
    cbxCarNo.ItemIndex := -1;

    for i := 0 to ADeviceManage.Count - 1 do
    begin
      dev := ADeviceManage.Items[i];
      if dev = nil then Continue;
      if dev.GroupID= grpId then
      begin
        cbxCarNo.Items.AddObject(dev.Car.No,dev);
      end;
    end; 
  finally
  end;
end;

procedure TfrmBaseQuery.ListGroup;
var
  vn_node: TTreeNode;
  cnt: integer;
  j: integer;
begin
  TreeView1.Items.Clear;
  if ADevGroupManage.Count = 0 then exit;
  vn_node := TreeView1.Items.add(TreeView1.topitem, '所有车辆');
  vn_node.Data := Pointer(-1); //所有车辆
  cnt := ADevGroupManage.Count;
  group_list(0, vn_node, cnt,treeview1);
  vn_Node.Expanded:=true;       //ExpandTreeView;
  TreeView1.AlphaSort();
end;

procedure TfrmBaseQuery.TreeView1Click(Sender: TObject);
  procedure ListGrpDev_groupParent(devGrp:TDevGroup);
  var
    i: integer;
    grp: TDevGroup;
  begin
    if not devGrp.leaf_nod then //==  说明是父节点
    begin   
      if devGrp.SonList.Count > 0 then
      begin 
        for i := 0 to devGrp.SonList.Count - 1 do
        begin
          grp := ADevGroupManage.find(devgrp.SonListItems[i]);
          if grp =nil then Continue;
          if grp.leaf_nod then
          begin
            AddDev(grp.id);
            group_parent := group_parent + ',' + inttostr(devgrp.SonListItems[i]);
          end
          else
            ListGrpDev_groupParent(grp);
        end;
      end;
    end;
  end;
var
  devGrp: TDevGroup;
  Node: TTreeNode;
begin
  Node := TreeView1.Selected;
  if Node = nil then exit;
  pnlSelGroupName.Caption := Node.Text;
  group_id := Integer(Node.Data);

  group_parent:='';
  cbxCarNo.Clear;
  if (group_id >= 0) then //and (not IsClickDev) and (grpId <> clickParent) then
  begin
    AddDev(group_id);
    devGrp := ADevGroupManage.find(group_id);
    group_parent :='';
    if devGrp <>nil then
      ListGrpDev_groupParent(devGrp);
    if group_parent =',' then
      group_parent :=''
    else
    begin
      if LeftStr(group_parent,1)=',' then
        group_parent := RightStr(group_parent, length(group_parent) - 1);
      if RightStr(group_parent,1)=',' then
        group_parent := LeftStr(group_parent, Length(group_parent) - 1);
    end;
  end;
end;

procedure TfrmBaseQuery.RzBitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmBaseQuery.btnQueryClick(Sender: TObject);
begin
  if initQueryCondition then
    queryCount;
end;

procedure TfrmBaseQuery.btnPageFirstClick(Sender: TObject);
begin
  if currPageNo <= 1 then Exit;

  cxTreeList1.Clear;
  queryDataByPage(1);
end;

procedure TfrmBaseQuery.btnPagePreviousClick(Sender: TObject);
begin
  if currPageNo <= 1 then Exit;

  cxTreeList1.Clear;
  queryDataByPage(currPageNo - 1);
end;

procedure TfrmBaseQuery.btnPageNextClick(Sender: TObject);
begin
  if currPageNo >= totalPageCount then Exit;

  cxTreeList1.Clear;
  queryDataByPage(currPageNo + 1);
end;

procedure TfrmBaseQuery.btnPageLastClick(Sender: TObject);
begin
  if currPageNo >= totalPageCount then Exit;

  cxTreeList1.Clear;
  queryDataByPage(totalPageCount);
end;

procedure TfrmBaseQuery.queryDataByPage(pageNo: Integer);
begin
  currPageNo := pageNo;
  FQueryCondition.CurrPageIndex := currPageNo;
  queryData;
end;

procedure TfrmBaseQuery.DoOnQueryCount(DataCount: Integer);
begin
  if DataCount <= 0 then
  begin
    MessageBox(Handle,'对不起，没有符合条件的数据！','提示',MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  if DataCount mod pageSize <> 0 then
    totalPageCount := DataCount div pageSize + 1
  else
    totalPageCount := DataCount div pageSize;

  totalDataCount := DataCount;
  edtTotalPageCount.Text := IntToStr(totalPageCount);
  currPageNo := 1;
  refreshTotalDataCount;

  FQueryCondition.PageSize := pageSize;
  FQueryCondition.CurrPageIndex := currPageNo;

  queryData;
end;

procedure TfrmBaseQuery.DoOnQueryData(AInfo: OleVariant);
begin

end;

procedure TfrmBaseQuery.refreshTotalDataCount;
begin
  lblTotalCount.Caption := '共' + IntToStr(totalDataCount) + '条记录';
end;

procedure TfrmBaseQuery.cbxPageSizeChange(Sender: TObject);
begin
  pageSize := StrToInt(cbxPageSize.Text);
  btnQuery.Click; 
end;

procedure TfrmBaseQuery.refreshPageNo;
begin
  edtCurrPageNo.Text := IntToStr(currPageNo);
  edtTotalPageCount.Text := IntToStr(totalPageCount);
end;

procedure TfrmBaseQuery.edtCurrPageNoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then Key := #0;
end;

procedure TfrmBaseQuery.edtCurrPageNoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
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

function TfrmBaseQuery.initQueryCondition: Boolean;
var
  fromDate, ToDate: TDateTime;
  dev: TDevice;
begin
  Result := False;
  fromDate := RzDateTimePicker1.Date;
  ReplaceTime(fromDate, RzDateTimePicker2.Time);

  ToDate := RzDateTimePicker3.Date;
  ReplaceTime(ToDate, RzDateTimePicker4.Time);

  if FromDate > ToDate then
  begin
    ShowTips('开始时间应小于结束时间，请检查！', RzDateTimePicker3);
    RzDateTimePicker3.SetFocus;
    exit;
  end;

  totalDataCount := 0;
  totalPageCount := 0;
  currPageNo := 0;
  refreshTotalDataCount;
  refreshPageNo;
  cxTreeList1.Clear;

  FQueryCondition.STime := FormatDateTime('yyyy-MM-dd hh:nn:ss', fromDate);
  FQueryCondition.ETime := FormatDateTime('yyyy-MM-dd hh:nn:ss', ToDate);

  if cbxCarNo.ItemIndex < 0 then
  begin
    FQueryCondition.DevId := '';
  end
  else
  begin
    dev := TDevice(cbxCarNo.Items.Objects[cbxCarNo.ItemIndex]);
    if (dev = nil) then
      FQueryCondition.DevId := ''
    else
      FQueryCondition.DevId := dev.IdStr;
  end;
  if FQueryCondition.DevId = '' then
  begin
    FQueryCondition.GroupId := group_id;
    FQueryCondition.GroupIdList := group_parent;
    if FQueryCondition.GroupIdList <> '' then
      FQueryCondition.GroupId := -1;    
  end
  else
  begin
    FQueryCondition.GroupId := -1;
    FQueryCondition.GroupIdList := '';
  end;
//
//  if cbxCarNo.ItemIndex < 0 then
//  begin
//    FQueryCondition.DevId := '';
//  end
//  else
//  begin
//    dev := TDevice(cbxCarNo.Items.Objects[cbxCarNo.ItemIndex]);
//    if (dev <> nil) then
//      FQueryCondition.DevId := ''
//    else
//      FQueryCondition.DevId := dev.IdStr;
//  end;
//  FQueryCondition.GroupId := group_id;
//  FQueryCondition.GroupIdList := group_parent;
  FQueryCondition.Flag := 0;//具体的查询窗体中需要赋其他值和线程中查询时case 语句中的一一对应
  Result := True;
end;

procedure TfrmBaseQuery.queryCount;
var
  queryDataCountThread: TQueryDataCountThread;
begin
  queryDataCountThread := TQueryDataCountThread.Create(FQueryCondition);
  queryDataCountThread.OnQueryDataCount := DoOnQueryCount;
end;

procedure TfrmBaseQuery.queryData;
var
  queryDataThread: TQueryDataThread;
begin
  queryDataThread := TQueryDataThread.Create(FQueryCondition);
  queryDataThread.OnQueryData := DoOnQueryData;
end;

procedure TfrmBaseQuery.FormCreate(Sender: TObject);
begin
  FTemp := TClientDataSet.Create(nil);
end;

procedure TfrmBaseQuery.FormDestroy(Sender: TObject);
begin
  FTemp.Free;
end;

procedure TfrmBaseQuery.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ManualDock(nil);
end;

procedure TfrmBaseQuery.InitEdit;
var
  dt: TDateTime;
begin
  cbxCarNo.Clear;
  dt := Now;

  RzDateTimePicker1.Date := DateOf(IncDay(dt, -1));
  RzDateTimePicker3.Date := DateOf(dt);
  RzDateTimePicker4.Time := TimeOf(dt);
end;

procedure TfrmBaseQuery.FormShow(Sender: TObject);
begin
  InitEdit;
  ListGroup;
end;

procedure TfrmBaseQuery.RzBitBtn3Click(Sender: TObject);
begin
  ExportToExcel(Caption, cxTreeList1);
end;

procedure TfrmBaseQuery.ExportToExcel(Caption: string; cxTreeList: TcxTreeList);
var
  ExlApp: Variant;
  i, j: Integer;
begin
  try
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

    setExcelData(ExlApp, cxTreeList);
    setExcelFormat(ExlApp);
  finally
    ExlApp := Unassigned;
  end;
end;


procedure TfrmBaseQuery.setExcelData(ExlApp: Variant;
  cxTreeList: TcxTreeList);
var
  i, j: Integer;
begin
  for i := 0 to cxTreeList.ColumnCount - 1 do
  begin
    ExlApp.Cells(1, i + 1) := cxTreeList.Columns[i].Caption.Text;
    if not cxTreeList.Columns[i].Visible then
      ExlApp.ActiveSheet.Columns[i + 1].Hidden := True;
  end;

  for i := 0 to cxTreeList.Count - 1 do
  begin
    for j := 0 to cxTreeList.Items[i].ValueCount-1 do
    begin
      ExlApp.Cells[i + 2, j+1 ] := cxTreeList.Items[i].Values[j];
    end;
  end;
end;

procedure TfrmBaseQuery.setExcelFormat(ExlApp: Variant);
begin

end;

procedure TfrmBaseQuery.cbxCarNoExit(Sender: TObject);
begin
  cbxCarNo.ItemIndex := cbxCarNo.IndexOf(cbxCarNo.Text);
  if cbxCarNo.ItemIndex < 0 then
  begin
    cbxCarNo.Text := '';
  end;
end;

end.
