unit FrmMileageUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxInplaceContainer, Mask, RzEdit, RzButton, StdCtrls, ComCtrls, Buttons,
  cxControls, cxSplitter, ExtCtrls, DBClient;

type
  TfrmMileage = class(TForm)
    Panel7: TPanel;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    TreeView1: TTreeView;
    cxSplitter3: TcxSplitter;
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    Panel3: TPanel;
    btnQuery: TSpeedButton;
    Label5: TLabel;
    Label3: TLabel;
    BitBtnToExcel: TBitBtn;
    BitBtn2: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
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
    cxSplitter2: TcxSplitter;
    cxTreeList1cxTreeListColumn1: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn2: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn3: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn4: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn5: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn6: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn7: TcxTreeListColumn;
    Label2: TLabel;
    cbxCarNo: TComboBox;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle2: TcxStyle;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtnToExcelClick(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
  private
    { Private declarations }
    FTemp: TClientDataSet;

    procedure AddDev(id: integer; ANode: TTreeNode);
    procedure GetQueryReturnInfo(Info: OleVariant; queryDate: string);
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

implementation
uses
  uGloabVar, CarUnit, QueryThreadUnit, Math, ComObj;

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
  ExlApp.range['C2:C'+inttostr(LvData.Count+1)].NumberFormatLocal := '0';
  ExlApp.Columns[1].ColumnWidth :=12;
  ExlApp.Columns[2].ColumnWidth :=12;
  ExlApp.Columns[3].ColumnWidth :=15;
  ExlApp.Columns[4].ColumnWidth :=12;
  ExlApp.Columns[5].ColumnWidth :=12;
  ExlApp.Columns[6].ColumnWidth :=12;
  ExlApp.Columns[7].ColumnWidth :=12;
end;

procedure TfrmMileage.FormCreate(Sender: TObject);
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

procedure TfrmMileage.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ManualDock(nil);
end;

procedure TfrmMileage.FormDestroy(Sender: TObject);
begin
  FTemp.Free;
end;

procedure TfrmMileage.btnQueryClick(Sender: TObject);
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
  if querySonGrpList <> '' then
    queryGroupId := -1;

  querySTime := FormatDateTime('yyyy-MM-dd hh:nn:ss', fromDate);
  queryETime := FormatDateTime('yyyy-MM-dd hh:nn:ss', ToDate);

  cxTreeList1.Clear;
  queryCountThread := TQueryDataThread.Create(querySTime, queryETime, queryDevId, queryGroupId, querySonGrpList);
  queryCountThread.OnQueryReturnInfoWithDate := GetQueryReturnInfo;
end;

procedure TfrmMileage.GetQueryReturnInfo(Info: OleVariant; queryDate: string);
var
  i: Integer;
begin
  if (Info = null) or (Length(info) = 0) then  Exit;

  FTemp.XMLData := Info;
  FTemp.Open;
  FTemp.First;

  for i:= 0 to FTemp.RecordCount - 1 do
  begin
    with cxTreeList1.Add do
    begin
      Values[0] := queryDate;
      Values[1] := FTemp.FieldByName('car_no').AsString;
      Values[2] := FTemp.FieldByName('dev_id').AsString;
      Values[3] := FTemp.FieldByName('group_name').AsString;
      Values[4] := FTemp.FieldByName('MINODOMETER').AsFloat/10;
      Values[5] := FTemp.FieldByName('MAXODOMETER').AsFloat/10;
      Values[6] := FTemp.FieldByName('ODOMETER').AsFloat/10;
    end;
    FTemp.Next;
  end;
end;

procedure TfrmMileage.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMileage.BitBtnToExcelClick(Sender: TObject);
begin
  ExportToExcel('车辆行驶里程统计', cxTreeList1);
end;

procedure TfrmMileage.TreeView1Click(Sender: TObject);
var
  devGrp: TDevGroup;
  Node: TTreeNode;
  i: Integer;
begin
  Node := TreeView1.Selected;
  if Node = nil then exit;
  group_id := Integer(Node.Data);

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
  end;
end;

procedure TfrmMileage.AddDev(id: integer; ANode: TTreeNode);
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

end.
