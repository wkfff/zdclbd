unit FrmQueryAlarmInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, StdCtrls, Mask,
  RzEdit, RzButton, cxInplaceContainer, cxControls, cxSplitter, ComCtrls,
  Buttons, ExtCtrls, cxTextEdit, Menus, DBClient;

type
  TfrmQueryAlarmInfo = class(TForm)
    Panel7: TPanel;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    TreeView1: TTreeView;
    PanelSelectGroupName: TPanel;
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    Panel3: TPanel;
    btnQuery: TSpeedButton;
    Label2: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    BitBtnToExcel: TBitBtn;
    BitBtn2: TBitBtn;
    cbxCarNo: TComboBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    Panel4: TPanel;
    cxSplitter2: TcxSplitter;
    cxSplitter3: TcxSplitter;
    Label1: TLabel;
    cbxAlarmType: TComboBox;
    cbxAlarmDealStatus: TComboBox;
    Label4: TLabel;
    Panel5: TPanel;
    cxTreeList1: TcxTreeList;
    cbxPageSize: TComboBox;
    lblAlarmDataCountTip: TLabel;
    btnPageFirst: TRzButton;
    btnPagePrevious: TRzButton;
    btnPageNext: TRzButton;
    btnPageLast: TRzButton;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edtCurrPageNo: TRzEdit;
    edtTotalPageCount: TRzEdit;
    cxTreeList1cxTreeListColumn1: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn2: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn3: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn4: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn5: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn6: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn7: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn8: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn9: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn10: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn11: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn17: TcxTreeListColumn;
    PopupMenu1: TPopupMenu;
    cxTreeList1cxTreeListColumn12: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn13: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn14: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn16: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn15: TcxTreeListColumn;
    N1: TMenuItem;
    cxTreeList1cxTreeListColumn18: TcxTreeListColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    procedure TreeView1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btnPageFirstClick(Sender: TObject);
    procedure btnPagePreviousClick(Sender: TObject);
    procedure btnPageNextClick(Sender: TObject);
    procedure btnPageLastClick(Sender: TObject);
    procedure cbxPageSizeChange(Sender: TObject);
    procedure edtCurrPageNoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCurrPageNoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure cxTreeList1CustomDrawCell(Sender: TObject;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
      var ADone: Boolean);
    procedure BitBtnToExcelClick(Sender: TObject);
    procedure cxTreeList1DblClick(Sender: TObject);
    procedure cbxAlarmTypeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FTemp: TClientDataSet;

    procedure AddDev(id: integer; ANode: TTreeNode);
    procedure GetQueryReturnCount(DataCount: Integer);
    procedure GetQueryReturnInfo(Info: OleVariant);
    procedure queryDataByPage(pageNo: Integer);


    procedure refreshTotalDataCount();
    procedure refreshPageNo();
  public
    { Public declarations }
  end;

var
  group_id: integer = -1;
  dev_id: Integer = -1;

  queryDevId: string;
  queryGroupId: Integer;
  querySonGrpList: string;
  querySTime: string;
  queryETime: string;
  queryDealStatus: Integer;
  queryAlarmType: Integer;
  pageSize: Integer = 20;     //每页大小
  totalPageCount: Integer = 0;//总页数
  currPageNo: Integer = 0;    //当前页码
  totalDataCount: Integer = 0;//总记录数

implementation
uses
  CarUnit, uGloabVar, QueryThreadUnit, Math, FrmViewAlarmDealInfoUnit, ComObj;

{$R *.dfm}

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
  ExlApp.range['B2:B'+inttostr(LvData.Count+1)].NumberFormatLocal := '0';
  ExlApp.range['E2:E'+inttostr(LvData.Count+1)].NumberFormatLocal := 'yyyy-mm-dd hh:mm:ss';
  ExlApp.Columns[1].ColumnWidth := 12;
  ExlApp.Columns[2].ColumnWidth := 15;
  ExlApp.Columns[3].ColumnWidth := 15;
  ExlApp.Columns[4].ColumnWidth := 20;
  ExlApp.Columns[5].ColumnWidth := 20;
  ExlApp.Columns[6].ColumnWidth := 12;
  ExlApp.Columns[7].ColumnWidth := 12;
end;

procedure TfrmQueryAlarmInfo.AddDev(id: integer; ANode: TTreeNode);
var
  i: integer;
  dev: TDevice;
begin
  try
    cbxCarNo.ItemIndex := -1;

    for i := 0 to ADeviceManage.Count - 1 do
    begin
      dev := ADeviceManage.Items[i];
      if dev = nil then Continue;
      if dev.GroupID= id then
      begin
        cbxCarNo.Items.AddObject(dev.Car.No,dev);
      end;
    end;
  finally
  end;
end;

procedure TfrmQueryAlarmInfo.TreeView1Click(Sender: TObject);
var
  devGrp: TDevGroup;
  Node: TTreeNode;
  i: Integer;
begin
  Node := TreeView1.Selected;
  if Node = nil then exit;
  group_id := Integer(Node.Data);
  PanelSelectGroupName.Caption := Node.Text;

  cbxCarNo.Clear;
  if (group_id >= 0) then //and (not IsClickDev) and (grpId <> clickParent) then
  begin
    AddDev(group_id, Node);
    devGrp := ADevGroupManage.find(group_id);
    if not devGrp.leaf_nod then //==  说明父节点
    begin
      if devGrp.SonList.Count > 0 then
      begin
        for i := 0 to devGrp.SonList.Count - 1 do
        begin
          AddDev(devgrp.SonListItems[i], Node);
        end;
      end;
    end;
  end
  else
  begin
    for i:=0 to ADeviceManage.Count-1 do
    begin
      cbxCarNo.AddItem(ADeviceManage.Items[i].Car.No,ADeviceManage.Items[i]);
    end;
  end;  
end;

procedure TfrmQueryAlarmInfo.FormCreate(Sender: TObject);
    function ListSon(ASonId:integer;Anode:TTreeNode;leastCnt:integer):integer;
    var
      grp       : TDevGroup;
      leaf_node : TTreeNode;
      j,sonId   : integer;
    begin
      grp:= ADevGroupManage.Find(AsonId);
      leaf_node :=  treeview1.Items.AddChild(
          Anode,grp.name+'('+inttostr(grp.DevListCount)+')');
      leaf_node.Data := pointer(grp.Id);
      leastCnt := leastCnt -1;
      result:=leastCnt;
      if leastCnt =0 then exit;

      if not grp.leaf_nod then
        for j:= 0 to grp.SonListCount -1 do
        begin
          sonId := grp.SonList[j];
          ListSon(sonId,leaf_node,leastCnt);
        end;       
    end;
    procedure group_list(AParant_ID:integer;Anode:TTreenode;Acurrent_cnt:integer);
      var
        i,j:integer;
        sonId: integer;           //子级的 组ID
        leaf_node: TTreenode;     //子级的节点
        grp : TDevGroup;
      begin
        for i:= 0 to ADevGroupManage.Count -1 do
        begin
          if Acurrent_cnt =0 then exit;
          grp :=ADevGroupManage.Items[i];
          //列出大组--父为0
          if grp.parent =AParant_ID then
          begin
            leaf_node :=  treeview1.Items.AddChild(
              Anode,grp.name+'('+inttostr(grp.DevListCount)+')');
            leaf_node.Data := pointer(grp.Id);
            Acurrent_cnt := Acurrent_cnt -1;
            if Acurrent_cnt =0 then exit;

            if not grp.leaf_nod then
              for j:= 0 to grp.SonListCount -1 do
              begin
                sonId := grp.SonList[j];
                Acurrent_cnt := ListSon(sonId,leaf_node,Acurrent_cnt);
              end;
          end;
        end;
      end;
var
  i,j:integer;
  vn_node: TTreeNode;
  cnt: integer;
begin

  TreeView1.AutoExpand := true;
  TreeView1.Items.Clear;
  if ADevGroupManage.Count = 0 then exit;
  vn_node := TreeView1.Items.add(TreeView1.topitem, '所有车辆');
  vn_node.Data := Pointer(-1); //所有车辆
  vn_node.Expanded := true;
  cnt := ADevGroupManage.Count;
  group_list(0,vn_node,cnt);

  for i:=0 to ADeviceManage.Count-1 do
  begin
    cbxCarNo.AddItem(ADeviceManage.Items[i].Car.No,ADeviceManage.Items[i]);
  end;

  DateTimePicker1.Date:=now;
  DateTimePicker2.Time:=StrToTime('00:00:00');
  DateTimePicker3.Date:=now;
  DateTimePicker4.Time:=StrToTime('23:59:59');

  FTemp := TClientDataSet.Create(nil);
end;

procedure TfrmQueryAlarmInfo.btnQueryClick(Sender: TObject);
var
  fromDate, ToDate: TDateTime;
  dev: TDevice;
  queryCountThread: TQueryDataThread;
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

  queryGroupId := group_id;
  if cbxCarNo.ItemIndex >= 0 then
  begin
    dev := TDevice(cbxCarNo.Items.Objects[cbxCarNo.ItemIndex]);
    if dev <> nil then
    begin
      queryDevId := dev.Id;
      querySonGrpList := '';
    end
    else
    begin
      queryDevId := '';
      querySonGrpList := getSonGroupIdList(IfThen(queryGroupId > 0, queryGroupId, 0));
    end;
  end
  else
  begin
    queryDevId := '';
    querySonGrpList := getSonGroupIdList(IfThen(queryGroupId > 0, queryGroupId, 0));
  end;
  if queryDevId <> '' then
  begin
    queryGroupId := -1;
    querySonGrpList := '';
  end
  else if querySonGrpList <> '' then
      queryGroupId := -1;

  querySTime := FormatDateTime('yyyy-MM-dd hh:nn:ss', fromDate);
  queryETime := FormatDateTime('yyyy-MM-dd hh:nn:ss', ToDate);
  queryDealStatus := cbxAlarmDealStatus.ItemIndex - 1;
  queryAlarmType := cbxAlarmType.ItemIndex - 1;

  if queryAlarmType > 11 then
    queryAlarmType := queryAlarmType + 6;

  totalDataCount := 0;
  totalPageCount := 0;
  currPageNo := 0;
  refreshTotalDataCount;
  refreshPageNo;
  cxTreeList1.Clear;
  queryCountThread := TQueryDataThread.Create(querySTime, queryETime, queryDevId, queryGroupId, querySonGrpList, queryAlarmType, queryDealStatus);
  queryCountThread.OnQueryDataCount := GetQueryReturnCount;
end;

procedure TfrmQueryAlarmInfo.GetQueryReturnCount(DataCount: Integer);
var
  queryAlarmInfoThread: TQueryDataThread;
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
    queryAlarmInfoThread := TQueryDataThread.Create(querySTime, queryETime, queryDevId, queryGroupId, querySonGrpList, queryAlarmType, queryDealStatus, pageSize, currPageNo + 1);
    queryAlarmInfoThread.OnQueryReturn := GetQueryReturnInfo;
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

procedure TfrmQueryAlarmInfo.GetQueryReturnInfo(Info: OleVariant);
var
  i: Integer;
  alarmType: Integer;
  areaType: Integer;
  areaNo: Integer;
begin
  if (Info = null) or (Length(info) = 0) then  Exit;

  FTemp.XMLData := Info;
  FTemp.Open;
  FTemp.First;

  for i:= 0 to FTemp.RecordCount - 1 do
  begin
    with cxTreeList1.Add do
    begin
      Values[0] := FTemp.FieldByName('car_no').AsString;
      Values[1] := FTemp.FieldByName('dev_id').AsString;
      Values[2] := FTemp.FieldByName('group_name').AsString;
      alarmType := FTemp.FieldByName('alarmtype').AsInteger;
      Values[3] := GetGpsDataAlarmTypeNameInQuery(alarmType);
      Values[4] := FormatDateTime('yyyy-MM-dd hh:nn:ss',FTemp.FieldByName('gpstime').AsDateTime);
      Values[5] := FormatFloat('#0.000000', FTemp.FieldByName('longitude').AsInteger/1000000);
      Values[6] := FormatFloat('#0.000000', FTemp.FieldByName('latitude').AsInteger/1000000);
      Values[7] := FormatFloat('#0.0', FTemp.FieldByName('speed').AsInteger/10);

//      if alarmType >= 49 then//附加信息报警
//      begin
        if (alarmType = 1) or (alarmType = 49) then
        begin//超速附加信息
          areaNo := FTemp.FieldByName('overspeedareaid').AsInteger;
          areaType := FTemp.FieldByName('overspeedtype').AsInteger;
          if (areaType > 0) or (areaNo > 0) then
          begin
            Values[8] := GetDevAreaTypeNameInQueryAlarm(areaType);
            Values[9] := GetAreaName(areaNo, areaType);
          end;
        end
        else if (alarmType = 20) or (alarmType = 21) or (alarmType = 50) then
        begin//进出区域/路线报警附加信息
          areaType := FTemp.FieldByName('areaalarmtype').AsInteger;
          areaNo := FTemp.FieldByName('areaalarmid').AsInteger;
          if (areaType > 0) or (areaNo > 0) then
          begin
            Values[10] := GetDevAreaTypeNameInQueryAlarm(areaType);
            Values[11] := GetAreaName(areaNo, areaType);
            if FTemp.FieldByName('areaalarmstate').AsInteger = 0 then
              Values[12] := '进'
            else
              Values[12] := '出';
          end;
        end
        else if (alarmType = 22) or (alarmType = 51) then
        begin//路线行驶时间不足/过长报警附加信息
          areaNo := FTemp.FieldByName('overtimelineid').AsInteger;
          if areaNo > 0 then
          begin
            Values[13] := GetAreaName(areaNo, 5) + ',路段[' + IntToStr(areaNo) + ']';
            Values[14] := FTemp.FieldByName('overtimelinetimer').AsString;
            if FTemp.FieldByName('overtimelinestate').AsInteger = 0 then
              Values[15] := '不足'
            else
              Values[15] := '过长';
          end;
        end;

      if FTemp.FieldByName('alarmdealstatus').AsInteger = 0 then
        Values[16] := '未处理'
      else
        Values[16] := '已处理';

      Values[17] := FTemp.FieldByName('alarmdealid').AsInteger;
    end;
    FTemp.Next;
  end;
  edtCurrPageNo.Text := IntToStr(currPageNo);
end;

procedure TfrmQueryAlarmInfo.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmQueryAlarmInfo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ManualDock(nil);
end;

procedure TfrmQueryAlarmInfo.FormDestroy(Sender: TObject);
begin
  FTemp.Free;
end;

procedure TfrmQueryAlarmInfo.queryDataByPage(pageNo: Integer);
var
  queryAlarmInfoThread: TQueryDataThread;
begin
  queryAlarmInfoThread := TQueryDataThread.Create(querySTime, queryETime, queryDevId, queryGroupId, querySonGrpList, queryAlarmType, queryDealStatus, pageSize, pageNo);
  queryAlarmInfoThread.OnQueryReturn := GetQueryReturnInfo;
  currPageNo := pageNo;
end;

procedure TfrmQueryAlarmInfo.refreshTotalDataCount;
begin
  lblAlarmDataCountTip.Caption := '共' + IntToStr(totalDataCount) + '条记录';
end;

procedure TfrmQueryAlarmInfo.refreshPageNo;
begin
  edtCurrPageNo.Text := IntToStr(currPageNo);
  edtTotalPageCount.Text := IntToStr(totalPageCount);
end;

procedure TfrmQueryAlarmInfo.btnPageFirstClick(Sender: TObject);
begin
  if currPageNo <= 1 then Exit;

  cxTreeList1.Clear;
  queryDataByPage(1);
end;

procedure TfrmQueryAlarmInfo.btnPagePreviousClick(Sender: TObject);
begin
  if currPageNo <= 1 then Exit;

  cxTreeList1.Clear;
  queryDataByPage(currPageNo - 1);
end;

procedure TfrmQueryAlarmInfo.btnPageNextClick(Sender: TObject);
begin
  if currPageNo >= totalPageCount then Exit;

  cxTreeList1.Clear;
  queryDataByPage(currPageNo + 1);
end;

procedure TfrmQueryAlarmInfo.btnPageLastClick(Sender: TObject);
begin
  if currPageNo >= totalPageCount then Exit;

  cxTreeList1.Clear;
  queryDataByPage(totalPageCount);
end;

procedure TfrmQueryAlarmInfo.cbxPageSizeChange(Sender: TObject);
begin
  pageSize := StrToInt(cbxPageSize.Text);
  btnQuery.Click; 
end;

procedure TfrmQueryAlarmInfo.edtCurrPageNoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then Key := #0;
end;

procedure TfrmQueryAlarmInfo.edtCurrPageNoKeyUp(Sender: TObject;
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

procedure TfrmQueryAlarmInfo.N1Click(Sender: TObject);
var
  node: TcxTreeListNode;
  info: OleVariant;
  dlg: TfrmViewAlarmDealInfo;
begin
  node := cxTreeList1.FocusedNode;
  if node = nil then Exit;

  if node.Values[16] = '未处理' then
  begin
    MessageBox(Handle, '该条报警记录未处理，无法查看', '提示', MB_OK + MB_ICONINFORMATION);
    Exit;
  end
  else
  begin
    info := Bs.QueryAlarmDealInfo(node.Values[17]);

    if (Info = null) or (Length(info) = 0) then
    begin
      MessageBox(Handle, '未能查到该报警记录的处理信息', '提示', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

    FTemp.XMLData := Info;
    FTemp.Open;
    FTemp.First;

    dlg := TfrmViewAlarmDealInfo.Create(Self);
    try
      with dlg do
      begin
        edtCarNo.Text := node.Values[0];
        edtDevId.Text := node.Values[1];
        edtAlarmType.Text := node.Values[3];
        gpsDate.DateTime := StrToDateTime(node.Values[4]);
        gpsTime.DateTime := StrToDateTime(node.Values[4]);
        edtAlarmDealStatus.Text := GetAlarmDealStatus(FTemp.FieldByName('alarmdealstatus').AsInteger);
        edtAlarmPerson.Text := FTemp.FieldByName('alarmperson').AsString;
        edtAlarmTel.Text := FTemp.FieldByName('alarmpersontel').AsString;
        edtAlarmPos.Text := FTemp.FieldByName('alarmpos').AsString;
        memoAlarmDealProc.Text := FTemp.FieldByName('alarmdealproc').AsString;
        memoAlarmDealResult.Text := FTemp.FieldByName('alarmdealresult').AsString;
        edtDealer.Text := FTemp.FieldByName('alarmdealusername').AsString;
        dealDate.DateTime := FTemp.FieldByName('alarmdealtime').AsDateTime;
        dealTime.DateTime := dealDate.DateTime;

        ShowModal;
      end;
    finally
      dlg.Free;
    end;
  end;
end;

procedure TfrmQueryAlarmInfo.cxTreeList1CustomDrawCell(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
begin
  if AViewInfo.Node.Values[16] = '未处理' then
    ACanvas.Font.Color := clRed
  else
    ACanvas.Font.Color := clTeal;
end;

procedure TfrmQueryAlarmInfo.BitBtnToExcelClick(Sender: TObject);
begin
  if cxTreeList1.Count <= 0 then Exit;
  
  ExportToExcel('报警信息',cxTreeList1);

end;

procedure TfrmQueryAlarmInfo.cxTreeList1DblClick(Sender: TObject);
begin
  N1Click(Sender);
end;

procedure TfrmQueryAlarmInfo.cbxAlarmTypeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := #0;
end;

end.
