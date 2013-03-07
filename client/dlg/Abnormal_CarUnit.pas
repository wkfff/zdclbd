unit Abnormal_CarUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, cxGraphics, cxCustomData, cxStyles, cxTL,
  cxTextEdit, cxCheckBox, cxInplaceContainer, cxControls, CarUnit, DateUtils, ConstDefineUnit;

type
  TAbnormal_Car = class(TForm)
    Panel1: TPanel;
    TreeView1: TTreeView;
    Splitter1: TSplitter;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    cxNotOnLineList: TcxTreeList;
    dev_Id: TcxTreeListColumn;
    dev_carNo: TcxTreeListColumn;
    dev_long: TcxTreeListColumn;
    dev_lat: TcxTreeListColumn;
    dev_speed: TcxTreeListColumn;
    dev_Gpstime: TcxTreeListColumn;
    dev_Altitude: TcxTreeListColumn;
    dev_angle: TcxTreeListColumn;
    switch_8: TcxTreeListColumn;
    switch_9: TcxTreeListColumn;
    dev_Track: TcxTreeListColumn;
    dev_DrawTrack: TcxTreeListColumn;
    dev_Hide: TcxTreeListColumn;
    dev_Name: TcxTreeListColumn;
    dev_SIMNO: TcxTreeListColumn;
    dev_trun: TcxTreeListColumn;
    dev_login_driver: TcxTreeListColumn;
    cxTaximeterList: TcxTreeList;
    cxTreeListColumn1: TcxTreeListColumn;
    cxTreeListColumn2: TcxTreeListColumn;
    cxTreeListColumn3: TcxTreeListColumn;
    cxTreeListColumn4: TcxTreeListColumn;
    cxTreeListColumn5: TcxTreeListColumn;
    cxTreeListColumn6: TcxTreeListColumn;
    cxTreeListColumn7: TcxTreeListColumn;
    cxTreeListColumn8: TcxTreeListColumn;
    cxTreeListColumn9: TcxTreeListColumn;
    cxTreeListColumn10: TcxTreeListColumn;
    cxTreeListColumn11: TcxTreeListColumn;
    cxTreeListColumn12: TcxTreeListColumn;
    cxTreeListColumn13: TcxTreeListColumn;
    cxTreeListColumn14: TcxTreeListColumn;
    cxTreeListColumn15: TcxTreeListColumn;
    cxTreeListColumn16: TcxTreeListColumn;
    cxTreeListColumn17: TcxTreeListColumn;
    cxLEDList: TcxTreeList;
    cxTreeListColumn18: TcxTreeListColumn;
    cxTreeListColumn19: TcxTreeListColumn;
    cxTreeListColumn20: TcxTreeListColumn;
    cxTreeListColumn21: TcxTreeListColumn;
    cxTreeListColumn22: TcxTreeListColumn;
    cxTreeListColumn23: TcxTreeListColumn;
    cxTreeListColumn24: TcxTreeListColumn;
    cxTreeListColumn25: TcxTreeListColumn;
    cxTreeListColumn26: TcxTreeListColumn;
    cxTreeListColumn27: TcxTreeListColumn;
    cxTreeListColumn28: TcxTreeListColumn;
    cxTreeListColumn29: TcxTreeListColumn;
    cxTreeListColumn30: TcxTreeListColumn;
    cxTreeListColumn31: TcxTreeListColumn;
    cxTreeListColumn32: TcxTreeListColumn;
    cxTreeListColumn33: TcxTreeListColumn;
    cxTreeListColumn34: TcxTreeListColumn;
    cxToplightList: TcxTreeList;
    cxTreeListColumn35: TcxTreeListColumn;
    cxTreeListColumn36: TcxTreeListColumn;
    cxTreeListColumn37: TcxTreeListColumn;
    cxTreeListColumn38: TcxTreeListColumn;
    cxTreeListColumn39: TcxTreeListColumn;
    cxTreeListColumn40: TcxTreeListColumn;
    cxTreeListColumn41: TcxTreeListColumn;
    cxTreeListColumn42: TcxTreeListColumn;
    cxTreeListColumn43: TcxTreeListColumn;
    cxTreeListColumn44: TcxTreeListColumn;
    cxTreeListColumn45: TcxTreeListColumn;
    cxTreeListColumn46: TcxTreeListColumn;
    cxTreeListColumn47: TcxTreeListColumn;
    cxTreeListColumn48: TcxTreeListColumn;
    cxTreeListColumn49: TcxTreeListColumn;
    cxTreeListColumn50: TcxTreeListColumn;
    cxTreeListColumn51: TcxTreeListColumn;
    cxTSMList: TcxTreeList;
    cxTreeListColumn52: TcxTreeListColumn;
    cxTreeListColumn53: TcxTreeListColumn;
    cxTreeListColumn54: TcxTreeListColumn;
    cxTreeListColumn55: TcxTreeListColumn;
    cxTreeListColumn56: TcxTreeListColumn;
    cxTreeListColumn57: TcxTreeListColumn;
    cxTreeListColumn58: TcxTreeListColumn;
    cxTreeListColumn59: TcxTreeListColumn;
    cxTreeListColumn60: TcxTreeListColumn;
    cxTreeListColumn61: TcxTreeListColumn;
    cxTreeListColumn62: TcxTreeListColumn;
    cxTreeListColumn63: TcxTreeListColumn;
    cxTreeListColumn64: TcxTreeListColumn;
    cxTreeListColumn65: TcxTreeListColumn;
    cxTreeListColumn66: TcxTreeListColumn;
    cxTreeListColumn67: TcxTreeListColumn;
    cxTreeListColumn68: TcxTreeListColumn;
    dev_GroupName: TcxTreeListColumn;
    dev_GroupTel: TcxTreeListColumn;
    cxTaximeterListcxTreeListColumn1: TcxTreeListColumn;
    cxTaximeterListcxTreeListColumn2: TcxTreeListColumn;
    cxLEDListcxTreeListColumn1: TcxTreeListColumn;
    cxLEDListcxTreeListColumn2: TcxTreeListColumn;
    cxToplightListcxTreeListColumn1: TcxTreeListColumn;
    cxToplightListcxTreeListColumn2: TcxTreeListColumn;
    cxTSMListcxTreeListColumn1: TcxTreeListColumn;
    cxTSMListcxTreeListColumn2: TcxTreeListColumn;
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure TreeView1Click(Sender: TObject);
    procedure TreeView1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure PageControl1Change(Sender: TObject);
    procedure cxNotOnLineListClick(Sender: TObject);
    procedure cxNotOnLineListDblClick(Sender: TObject);
    procedure cxTaximeterListClick(Sender: TObject);
    procedure cxTaximeterListDblClick(Sender: TObject);
    procedure cxLEDListDblClick(Sender: TObject);
    procedure cxLEDListClick(Sender: TObject);
    procedure cxToplightListClick(Sender: TObject);
    procedure cxToplightListDblClick(Sender: TObject);
    procedure cxTSMListClick(Sender: TObject);
    procedure cxTSMListDblClick(Sender: TObject);
  private
    { Private declarations }
    FCurrSelect: integer;
    procedure Add2DevList(const ADev: Tdevice; TreeList: TcxTreeList);
    procedure FillData(ADev: TDevice; ANode: TcxTreeListNode);
    procedure ClickTreeList(TreeList: TcxTreeList);
    procedure DbClickTreeList(TreeList: TcxTreeList);
  public
    { Public declarations }
    procedure Refresh;
    procedure Refresh_Car;
    procedure Refresh_TaxiMeter;
    procedure Refresh_LED;
    procedure Refresh_Toplight;
    procedure Refresh_TSM;
    {列出　车辆分组}
    procedure List_TreeGroup;
  end;

var
  Abnormal_Car: TAbnormal_Car;

implementation
uses uGloabVar, umainf;
{$R *.dfm}

procedure TAbnormal_Car.ClickTreeList(TreeList: TcxTreeList);
begin
  umainf.Mainf.PageControl1.ActivePageIndex := 0;
  if TreeList.FocusedNode = nil then exit;
  GCurSelectDev := TDevice(TreeList.FocusedNode.Data);

  mainf.Edit2.Text := IntToStr(GCurSelectDev.Id);
  mainf.Edit1.Text := GCurSelectDev.Car.No;
  mainf.ShowState(GCurSelectDev);
end;

procedure TAbnormal_Car.DbClickTreeList(TreeList: TcxTreeList);
begin
  if TreeList.FocusedNode = nil then exit;
  GCurSelectDev := TDevice(TreeList.FocusedNode.Data);
  umainf.Mainf.fun_Locate_Car.Execute;
end;

procedure TAbnormal_Car.Add2DevList(const ADev: Tdevice; TreeList: TcxTreeList);
var
  node: TcxTreeListNode;
begin
  if ADev = nil then exit;
  try
    with TreeList do
    begin
      node := TreeList.Add;
      node.Data := Adev;
      FillData(Adev, node);
    end;
  finally
  end;
end;

procedure TAbnormal_Car.FillData(ADev: TDevice; ANode: TcxTreeListNode);
  function getCarAngle(angel: integer): string;
  begin
    Result := '';
    case angel*100 of
      0..2250: begin
          Result := '正北';
        end;
      2251..6750: begin
          result := '东北';
        end;
      6751..11250: begin
          result := '正东';
        end;
      11251..15750: begin
          result := '东南';
        end;
      15751..20250: begin
          Result := '正南';
        end;
      20251..24750: begin
          Result := '西南';
        end;
      24751..29250: begin
          Result := '正西';
        end;
      29251..33750: begin
          Result := '西北';
        end;
      33751..36000: begin
          Result := '正北';
        end else
      begin
        Result := ' ';
      end;
    end;
  end;
begin
  with ADev, ANode do
  begin
    Data := ADev;
    Values[0] := ADev.IdStr;
    Values[1] := ADev.Car.No;
    Values[2] := FormatFloat('##0.000000', ADev.Longitude);
    Values[3] := FormatFloat('##0.000000', ADev.Latitude);
    Values[4] := FormatFloat('##0.0', ADev.Speed/10); {FormatFloat('##0.0', ADev.Speed); //* 1852/10000//LS}
    if ADev.GpsTime = 0 then
      Values[5] := ''
    else
      Values[5] := FormatDateTime('yyyy-mm-dd hh:nn:ss', ADev.GpsTime);

    if not ADev.Switch[STAT_GPS_LOCATE] then
    begin
      Values[8] := '定位';
      Values[7] := getCarAngle(ADev.Orientation);
    end
    else
      Values[8] := '非定位';
    if ADev.isOnline then
    begin
      Values[9] := '在线';
      if not ADev.Switch[STAT_GPS_LOCATE] then
        ANode.StateIndex := 3
      else
        ANode.StateIndex := 6;
    end
    else //如不在线,就显示非定位..
    begin
      Values[7]:='';
      Values[8] := '非定位';
      Values[9] := '不在线';
      ANode.StateIndex := 4;
    end;

    Values[10] := FMap.GpsDrawlayer.AutoFollowDevice = ADev;
    Values[11] := ADev.DrawTrack;
    Values[12] := ADev.Hide;
    Values[13] := ADev.Car.ZBH;
    Values[14] := ADev.SimNo;
    Values[16] := ADev.Login_DriverName+'('+ADev.Login_Driver+')';

    Values[17] := ADevGroupManage.find(ADev.GroupID).Name;
    Values[18] := ADevGroupManage.find(ADev.GroupID).TelPhone;

    //ImageIndex := ADev.Car.ResIndex;
    SelectedIndex := ADev.Car.ResIndex;
  end;
end;

procedure TAbnormal_Car.FormCreate(Sender: TObject);
begin
  //cxDeviceList.Images := ResManage.BmpList;

  List_TreeGroup;
end;

procedure TAbnormal_Car.List_TreeGroup;
      //group_list
      //列出所有子组－－－－入参：父组ID，父组节点，当前还余下数
  procedure group_list(AParant_ID: integer; Anode: TTreenode; Acurrent_cnt: integer);
  var
    i, j: integer;
    leaf_id: array of integer; //子级的 ID 数组
    leaf_cnt: integer; //子级的 ID  数组个数
    leaf_node: array of TTreenode; //子级的节点
    devGrp: TDevGroup;
    dev: TDevice;
  begin
    leaf_cnt := 0;
    for i := 0 to ADevGroupManage.Count - 1 do
    begin
      if ADevGroupManage.items[i].parent = AParant_ID then
      begin
        leaf_cnt := leaf_cnt + 1;
        setlength(leaf_id, leaf_cnt);
        setlength(leaf_node, leaf_cnt);
        leaf_id[leaf_cnt - 1] := ADevGroupManage.items[i].id;
        leaf_node[leaf_cnt - 1] := treeview1.Items.addchild(
          Anode,
          trim(ADevGroupManage.items[i].name)+ '(' + IntToStr(ADevGroupManage.items[i].DevListCount) + ')');

        leaf_node[leaf_cnt - 1].data := pointer(leaf_id[leaf_cnt - 1]);
        Acurrent_cnt := Acurrent_cnt - 1;
        if Acurrent_cnt <= 0 then break;

        if ADevGroupManage.items[i].leaf_nod = false then
          group_list(leaf_id[leaf_cnt - 1], leaf_node[leaf_cnt - 1], Acurrent_cnt);
      end;
    end;
  end;
     //----------
var
  vn_node: TTreenode;
  cnt: integer;
  j: integer;
  dev: TDevice;
begin
  TreeView1.AutoExpand := false;
  treeview1.Items.Clear;
  if ADeviceManage.Count = 0 then
  begin
    GCurSelectGroupID := -1;
  end;
  vn_node := treeview1.Items.add(treeview1.topitem, '所有车辆');
  vn_node.Data := pointer(-1); //所有车辆
  cnt := ADevGroupManage.Count;
  GCurSelectGroupID := -1;
  group_list(0, vn_node, cnt);
  FCurrSelect := -1;

  cxNotOnLineList.BeginUpdate;
  cxNotOnLineList.Clear;
  for j := 0 to ADeviceManage.Count - 1 do
  begin
    dev := ADeviceManage.Items[j];
    if (DayOf(Now)-DayOf(Dev.GpsTime)>=3) or (dev.GpsTime=0) then
      Add2DevList(dev, cxNotOnLineList);
  end;
  cxNotOnLineList.EndUpdate;

  vn_node.Expanded := true;
end;

procedure TAbnormal_Car.Refresh_Car;
var
  j: integer;
  dev: Tdevice;
  devId: integer;
  devGrp: TDevGroup;
begin
  if FCurrSelect = -1 then //所有车辆
  begin
    cxNotOnLineList.BeginUpdate;
    cxNotOnLineList.Clear;
    for j := 0 to ADeviceManage.Count - 1 do
    begin
      dev := ADeviceManage.Items[j];
      if (DayOf(Now)-DayOf(dev.GpsTime)>=3) or (dev.GpsTime=0) then
        Add2DevList(dev, cxNotOnLineList);
    end;
    cxNotOnLineList.EndUpdate;

    if cxNotOnLineList.FocusedNode <> nil then
      cxNotOnLineList.FocusedNode := nil; //

    exit;
  end;
  if FCurrSelect >= 0 then //某分组车辆
  begin
    //列出某组车辆
    cxNotOnLineList.BeginUpdate;
    cxNotOnLineList.Clear;
    devGrp := ADevGroupManage.find(FCurrSelect);
    for j := 0 to devGrp.DevListCount - 1 do
    begin
      devId := devGrp.DevList[j];
      dev := ADeviceManage.find(devId);
      if (DayOf(Now)-DayOf(dev.GpsTime)>=3) or (dev.GpsTime=0) then
        Add2DevList(dev, cxNotOnLineList);
    end;

    if cxNotOnLineList.FocusedNode <> nil then
      cxNotOnLineList.FocusedNode := nil; //
    cxNotOnLineList.EndUpdate;
  end;
end;

procedure TAbnormal_Car.Refresh_LED;
var
  j: integer;
  dev: Tdevice;
  devId: integer;
  devGrp: TDevGroup;
begin
  if FCurrSelect = -1 then //所有车辆
  begin
    cxLEDList.BeginUpdate;
    cxLEDList.Clear;
    for j := 0 to ADeviceManage.Count - 1 do
    begin
      dev := ADeviceManage.Items[j];
      if dev.Switch_Warning[MSG_WARNING_12] then
        Add2DevList(dev, cxLEDList);
    end;
    cxLEDList.EndUpdate;

    if cxLEDList.FocusedNode <> nil then
      cxLEDList.FocusedNode := nil; //

    exit;
  end;
  if FCurrSelect >= 0 then //某分组车辆
  begin
    //列出某组车辆
    cxLEDList.BeginUpdate;
    cxLEDList.Clear;
    devGrp := ADevGroupManage.find(FCurrSelect);
    for j := 0 to devGrp.DevListCount - 1 do
    begin
      devId := devGrp.DevList[j];
      dev := ADeviceManage.find(devId);
      if dev.Switch_Warning[MSG_WARNING_12] then
        Add2DevList(dev, cxLEDList);
    end;

    if cxLEDList.FocusedNode <> nil then
      cxLEDList.FocusedNode := nil; //
    cxLEDList.EndUpdate;
  end;
end;

procedure TAbnormal_Car.Refresh_TaxiMeter;
var
  j: integer;
  dev: Tdevice;
  devId: integer;
  devGrp: TDevGroup;
begin
  if FCurrSelect = -1 then //所有车辆
  begin
    cxTaximeterList.BeginUpdate;
    cxTaximeterList.Clear;
    for j := 0 to ADeviceManage.Count - 1 do
    begin
      dev := ADeviceManage.Items[j];
      if dev.Switch_Warning[MSG_WARNING_10] then
        Add2DevList(dev, cxTaximeterList);
    end;
    cxTaximeterList.EndUpdate;

    if cxTaximeterList.FocusedNode <> nil then
      cxTaximeterList.FocusedNode := nil; //

    exit;
  end;
  if FCurrSelect >= 0 then //某分组车辆
  begin
    //列出某组车辆
    cxTaximeterList.BeginUpdate;
    cxTaximeterList.Clear;
    devGrp := ADevGroupManage.find(FCurrSelect);
    for j := 0 to devGrp.DevListCount - 1 do
    begin
      devId := devGrp.DevList[j];
      dev := ADeviceManage.find(devId);
      if dev.Switch_Warning[MSG_WARNING_10] then
        Add2DevList(dev, cxTaximeterList);
    end;

    if cxTaximeterList.FocusedNode <> nil then
      cxTaximeterList.FocusedNode := nil; //
    cxTaximeterList.EndUpdate;
  end;
end;

procedure TAbnormal_Car.Refresh_Toplight;
var
  j: integer;
  dev: Tdevice;
  devId: integer;
  devGrp: TDevGroup;
begin
  if FCurrSelect = -1 then //所有车辆
  begin
    cxToplightList.BeginUpdate;
    cxToplightList.Clear;
    for j := 0 to ADeviceManage.Count - 1 do
    begin
      dev := ADeviceManage.Items[j];
      if dev.Switch_Warning[MSG_WARNING_10] then
        Add2DevList(dev, cxToplightList);
    end;
    cxToplightList.EndUpdate;

    if cxToplightList.FocusedNode <> nil then
      cxToplightList.FocusedNode := nil; //

    exit;
  end;
  if FCurrSelect >= 0 then //某分组车辆
  begin
    //列出某组车辆
    cxToplightList.BeginUpdate;
    cxToplightList.Clear;
    devGrp := ADevGroupManage.find(FCurrSelect);
    for j := 0 to devGrp.DevListCount - 1 do
    begin
      devId := devGrp.DevList[j];
      dev := ADeviceManage.find(devId);
      if dev.Switch_Warning[MSG_WARNING_15] then
        Add2DevList(dev, cxToplightList);
    end;

    if cxToplightList.FocusedNode <> nil then
      cxToplightList.FocusedNode := nil; //
    cxToplightList.EndUpdate;
  end;
end;

procedure TAbnormal_Car.Refresh_TSM;
var
  j: integer;
  dev: Tdevice;
  devId: integer;
  devGrp: TDevGroup;
begin
  if FCurrSelect = -1 then //所有车辆
  begin
    cxTSMList.BeginUpdate;
    cxTSMList.Clear;
    for j := 0 to ADeviceManage.Count - 1 do
    begin
      dev := ADeviceManage.Items[j];
      if dev.Switch_Warning[MSG_WARNING_14] then
        Add2DevList(dev, cxTSMList);
    end;
    cxTSMList.EndUpdate;

    if cxTSMList.FocusedNode <> nil then
      cxTSMList.FocusedNode := nil; //

    exit;
  end;
  if FCurrSelect >= 0 then //某分组车辆
  begin
    //列出某组车辆
    cxTSMList.BeginUpdate;
    cxTSMList.Clear;
    devGrp := ADevGroupManage.find(FCurrSelect);
    for j := 0 to devGrp.DevListCount - 1 do
    begin
      devId := devGrp.DevList[j];
      dev := ADeviceManage.find(devId);
      if dev.Switch_Warning[MSG_WARNING_14] then
        Add2DevList(dev, cxTSMList);
    end;

    if cxTSMList.FocusedNode <> nil then
      cxTSMList.FocusedNode := nil; //
    cxTSMList.EndUpdate;
  end;
end;

procedure TAbnormal_Car.TreeView1Change(Sender: TObject; Node: TTreeNode);
var
  grpId: integer;
begin
  if Node = nil then exit;
  grpId := Integer(Node.Data);
  if grpId = FCurrSelect then exit; //选择没变化,直接退出
  FCurrSelect := grpId;
  Refresh;
end;

procedure TAbnormal_Car.TreeView1Click(Sender: TObject);
begin
  TreeView1.SetFocus;
end;

procedure TAbnormal_Car.TreeView1ContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  Node: TTreeNode;
begin
  Node := TreeView1.GetNodeAt(MousePos.X, MousePos.y);
  if Node <> nil then
    Node.Selected := true;
end;

procedure TAbnormal_Car.PageControl1Change(Sender: TObject);
begin
  Refresh;
{  if PageControl1.ActivePageIndex = 0 then
    Refresh_Car
  else if PageControl1.ActivePageIndex = 1 then
    Refresh_TaxiMeter
  else if PageControl1.ActivePageIndex = 2 then
    Refresh_LED
  else if PageControl1.ActivePageIndex = 3 then
    Refresh_Toplight
  else if PageControl1.ActivePageIndex = 4 then
    Refresh_TSM;}
end;

procedure TAbnormal_Car.Refresh;
begin
  if PageControl1.ActivePageIndex = 0 then
    Refresh_Car
  else if PageControl1.ActivePageIndex = 1 then
    Refresh_TaxiMeter
  else if PageControl1.ActivePageIndex = 2 then
    Refresh_LED
  else if PageControl1.ActivePageIndex = 3 then
    Refresh_Toplight
  else if PageControl1.ActivePageIndex = 4 then
    Refresh_TSM;
end;

procedure TAbnormal_Car.cxNotOnLineListClick(Sender: TObject);
begin
  ClickTreeList(cxNotOnLineList);
end;

procedure TAbnormal_Car.cxNotOnLineListDblClick(Sender: TObject);
begin
  DbClickTreeList(cxNotOnLineList);
end;

procedure TAbnormal_Car.cxTaximeterListClick(Sender: TObject);
begin
  ClickTreeList(cxTaximeterList);
end;

procedure TAbnormal_Car.cxTaximeterListDblClick(Sender: TObject);
begin
  DbClickTreeList(cxTaximeterList);
end;

procedure TAbnormal_Car.cxLEDListDblClick(Sender: TObject);
begin
  DbClickTreeList(cxLEDList);
end;

procedure TAbnormal_Car.cxLEDListClick(Sender: TObject);
begin
  ClickTreeList(cxLEDList);
end;

procedure TAbnormal_Car.cxToplightListClick(Sender: TObject);
begin
  ClickTreeList(cxToplightList);
end;

procedure TAbnormal_Car.cxToplightListDblClick(Sender: TObject);
begin
  DbClickTreeList(cxToplightList);
end;

procedure TAbnormal_Car.cxTSMListClick(Sender: TObject);
begin
  ClickTreeList(cxTSMList);
end;

procedure TAbnormal_Car.cxTSMListDblClick(Sender: TObject);
begin
  DbClickTreeList(cxTSMList);
end;

end.
