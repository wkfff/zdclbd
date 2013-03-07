unit QueryDevOilHeightFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ComCtrls, cxControls,
  cxSplitter, ExtCtrls, CarUnit, uGloabVar, DBClient, DB, PrnDbgeh,
  PrViewEh, Printers, EhLibADO, TeEngine, Series, TeeProcs, Chart, DbChart;

type
  {//查看 紧急报警时详细情况：照片、录音 }
  TSeeEmergncyAlarmDetailEvent = procedure(ADevIdStr:String;AStartTime,ARemoveTime:String;
    AStartLongi,AStartLati,ARemoveLongi,ARemoveLati:Double) of object;
    
  TDevOilHeightFrm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel3: TPanel;
    SpeedButtonTjDay: TSpeedButton;
    Panel4: TPanel;
    cxSplitter2: TcxSplitter;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    TreeView1: TTreeView;
    PanelSelectGroupName: TPanel;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    BitBtnClose: TBitBtn;
    Label1: TLabel;
    ComboBoxCarNoDay: TComboBox;
    Label7: TLabel;
    Label4: TLabel;
    FromTime: TDateTimePicker;
    FromDate: TDateTimePicker;
    ToDate: TDateTimePicker;
    ToTime: TDateTimePicker;
    cxSplitter1: TcxSplitter;
    dbcht1: TDBChart;
    Series1: TFastLineSeries;
    procedure SpeedButtonTjDayClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure BitBtnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbcht1ClickBackground(Sender: TCustomChart;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dbcht1AfterDraw(Sender: TObject);
  private
    { Private declarations }
    procedure InitEdit;
    procedure ExpandTreeView;
    procedure ListGroup;
    procedure AddDev(id: integer; ANode: TTreeNode);
  public
    { Public declarations }
  end;

var
  DevOilHeightFrm: TDevOilHeightFrm;
  group_id: integer = -1;
  group_paranet: string = '';
  ExcelApp, MyWorkbook: oleVariant;
implementation
uses ComObj,DateUtils;
{$R *.dfm}


procedure TDevOilHeightFrm.ExpandTreeView;
var
  i: integer;
begin
  for i := 0 to TreeView1.Items.Count - 1 do
    TreeView1.Items[i].Expanded := True;
end;

procedure TDevOilHeightFrm.InitEdit;
begin
  FromDate.date := now;
  ToDate.date := now;
  FromTime.Time := EncodeTime(0,0,0,0);
  ToTime.Time := EncodeTime(23,59,59,59);
  PageControl1.ActivePageIndex := 0;
end;

procedure TDevOilHeightFrm.ListGroup;
  function ListSon(ASonId: integer; Anode: TTreeNode; leastCnt: integer): integer;
  var
    grp: TDevGroup;
    leaf_node: TTreeNode;
    j, sonId: integer;
  begin
    grp := ADevGroupManage.Find(AsonId);
    leaf_node := treeview1.Items.AddChild(
      Anode, grp.name + '(' + inttostr(grp.DevListCount) + ')');
    leaf_node.Data := pointer(grp.Id);
    leastCnt := leastCnt - 1;
    result := leastCnt;
    if leastCnt = 0 then exit;

    if not grp.leaf_nod then
      for j := 0 to grp.SonListCount - 1 do
      begin
        sonId := grp.SonList[j];
        ListSon(sonId, leaf_node, leastCnt);
      end;
  end;
  procedure group_list(AParant_ID: integer; Anode: TTreenode; Acurrent_cnt: integer);
  var
    i, j: integer;
    sonId: integer; //子级的 组ID
    leaf_node: TTreenode; //子级的节点
    grp: TDevGroup;
  begin
    for i := 0 to ADevGroupManage.Count - 1 do
    begin
      if Acurrent_cnt = 0 then exit;
      grp := ADevGroupManage.Items[i];
          //列出大组--父为0
      if grp.parent = AParant_ID then
      begin
        leaf_node := treeview1.Items.AddChild(
          Anode, grp.name + '(' + inttostr(grp.DevListCount) + ')');
        leaf_node.Data := pointer(grp.Id);
        Acurrent_cnt := Acurrent_cnt - 1;
        if Acurrent_cnt = 0 then exit;

        if not grp.leaf_nod then
          for j := 0 to grp.SonListCount - 1 do
          begin
            sonId := grp.SonList[j];
            Acurrent_cnt := ListSon(sonId, leaf_node, Acurrent_cnt);
          end;
      end;
    end;
  end;
var
  vn_node: TTreeNode;
  cnt: integer;
begin
 {*******************************}
  TreeView1.AutoExpand := true;
  TreeView1.Items.Clear;
  if ADevGroupManage.Count = 0 then exit;
  vn_node := TreeView1.Items.add(TreeView1.topitem, '所有车辆');
  vn_node.Data := Pointer(-1); //所有车辆
  vn_node.Expanded := true;
  cnt := ADevGroupManage.Count;
  group_list(0, vn_node, cnt);
  ExpandTreeView;
end;

procedure TDevOilHeightFrm.SpeedButtonTjDayClick(Sender: TObject);
var
  fromDatetime, toDatetime,devIdStr: string;
  dev: TDevice;
begin
  TSpeedButton(Sender).Enabled := False;
  try
    fromDatetime :=FormatDatetime('yyyy-mm-dd ',fromDate.Date)+FormatDatetime('hh:nn:ss',fromTime.Time);
    toDatetime:=FormatDatetime('yyyy-mm-dd ',toDate.Date)+FormatDatetime('hh:nn:ss',toTime.Time);

    if ComboBoxCarNoDay.Text ='' then
      devIdStr := ''
    else
    begin
      dev:=TDevice(ComboBoxCarNoDay.Items.Objects[ComboBoxCarNoDay.ItemIndex]);
      devIdStr := dev.IdStr;

    end;
    if devIdStr = '' then
      begin
       MessageBox(Handle,'请选择车辆信息!','提示',MB_OK + MB_ICONINFORMATION);
       ComboBoxCarNoDay.SetFocus;
       Exit;
      end;
    dbcht1.Visible := True;
    DataSource1.Enabled := false;
    dbcht1.MaxPointsPerPage := 200;
    dbcht1.Series[0].Marks.Style := smsValue;
    dbcht1.Series[0].Clear;
    ClientDataSet1.Data := BS.QueryDevOilHeight(devIdStr,fromDatetime,toDatetime);
    DataSource1.Enabled := true;
    dbcht1.Series[0].DataSource := ClientDataSet1;
    dbcht1.Series[0].XLabelsSource :='upTime';
    dbcht1.Series[0].YValues.ValueSource:= 'oilHeight';
    if ClientDataSet1.RecordCount = 0 then
    begin
      dbcht1.BottomAxis.Title.Caption := '没有查询记录';
      dbcht1.BottomAxis.Title.Font.Color := clRed;
    end;
    if ClientDataSet1.RecordCount > 200 then
    begin
      dbcht1.BottomAxis.Title.Caption := '用鼠标左键或右键进行上一页或下一页操作';
      dbcht1.BottomAxis.Title.Font.Size := 8;
      dbcht1.BottomAxis.Title.Font.Color := clBlue;
      dbcht1.Legend.Visible := False;//隐藏图例 
    end;
    group_paranet := '';
  finally
    TSpeedButton(Sender).Enabled :=True;
  end;
end;

procedure TDevOilHeightFrm.FormCreate(Sender: TObject);
begin
  InitEdit;
  ListGroup;
  PageControl1.ActivePageIndex := 0;
  PanelSelectGroupName.Caption := '所有车辆';
end;

procedure TDevOilHeightFrm.TreeView1Click(Sender: TObject);
var
  devGrp: TDevGroup;
  Node: TTreeNode;
  i:integer;
begin
  Node := TreeView1.Selected;
  if Node = nil then exit;
  PanelSelectGroupName.Caption := Node.Text;
  group_id := Integer(Node.Data);
  ComboBoxCarNoDay.Clear;
  if (group_id >= 0) then
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
          if i = 0 then
          begin
            group_paranet := inttostr(devgrp.SonListItems[i]);
          end else
          begin
            group_paranet := group_paranet + ',' + inttostr(devgrp.SonListItems[i]);
          end;
        end;
      end else
      begin
        group_paranet := '';
      end;
    end;   
  end;
end;

procedure TDevOilHeightFrm.AddDev(id: integer; ANode: TTreeNode);
var
  i: integer;
  dev: TDevice;
begin
  try
    //ComboBoxCarNoDay.Clear;
    for i := 0 to ADeviceManage.Count - 1 do
    begin
      dev := ADeviceManage.Items[i];
      if dev = nil then Continue;
      if dev.GroupID= id then
      begin
        ComboBoxCarNoDay.Items.AddObject(dev.DispLabel,dev);
      end;
    end; 
  finally
  end;
end;

procedure TDevOilHeightFrm.BitBtnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TDevOilHeightFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ManualDock(nil);
end;

procedure TDevOilHeightFrm.dbcht1ClickBackground(Sender: TCustomChart;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    dbcht1.NextPage
  else if Button = mbRight then
    dbcht1.PreviousPage;
end;

procedure TDevOilHeightFrm.dbcht1AfterDraw(Sender: TObject);
var
  page : string;
begin
  if ClientDataSet1.RecordCount > 200 then
  begin
    dbcht1.Canvas.Font.Color := clBlue;
    dbcht1.Canvas.Font.Size := 12;
    dbcht1.Canvas.Brush.Style := bsClear;
    page := '第' + IntToStr(dbcht1.Page) + '页';
    dbcht1.Canvas.TextOut(10,10,page);
  end;
end;
end.

