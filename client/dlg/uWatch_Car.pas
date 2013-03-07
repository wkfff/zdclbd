{车辆列表
　注：因在车辆较多时，列出所有车辆，需较长时间，所以现不列出所有车辆。
　　　车辆按分组查看。
　@author()
  @created(2004-03-)
  @lastmod(GMT:$Date: 2012/12/31 05:06:18 $) <BR>
  最后更新人:$Author: wfp $  <BR>
  当前版本:$Revision: 1.2 $  <BR>}
unit uWatch_Car;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, cxGraphics, cxCustomData,
  cxStyles, cxTL, cxTextEdit, cxInplaceContainer, cxControls, cxCalendar,
  Buttons, cxCheckBox, StdCtrls, ToolWin, ImgList, carunit, RzButton,
  RzRadChk;

type
  Twatch_car = class(TForm)
    cxDeviceList: TcxTreeList;
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
    Panel1: TPanel;
    TreeView1: TTreeView;
    Splitter1: TSplitter;
    dev_Hide: TcxTreeListColumn;
    dev_Name: TcxTreeListColumn;
    dev_SIMNO: TcxTreeListColumn;
    dev_trun: TcxTreeListColumn;
    dev_login_driver: TcxTreeListColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    rbAll: TRadioButton;
    rbOnline: TRadioButton;
    rbOffline: TRadioButton;
    dev_TerminalTypeName: TcxTreeListColumn;
    dev_ddsonline: TcxTreeListColumn;
    dev_dds_camara_excursion: TcxTreeListColumn;
    dev_dds_alarm: TcxTreeListColumn;
    procedure FormShow(Sender: TObject);
    procedure cxDeviceListFocusedNodeChanged(Sender: TObject;
      APrevFocusedNode, AFocusedNode: TcxTreeListNode);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxDeviceListEditing(Sender: TObject;
      AColumn: TcxTreeListColumn; var Allow: Boolean);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure TreeView1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure cxDeviceListClick(Sender: TObject);
    procedure FormEndDock(Sender, Target: TObject; X, Y: Integer);
    procedure TreeView1Click(Sender: TObject);
    procedure cxDeviceListCustomDrawCell(Sender: TObject;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
      var ADone: Boolean);
    procedure cxDeviceListDblClick(Sender: TObject);
    procedure cxDeviceListResize(Sender: TObject);
    procedure rbAllClick(Sender: TObject);
  private
    { Private declarations }
    FCurrSelect: integer;

    FIsCxTreeListCleared: Boolean;

    procedure refreshData(ADev: TDevice; ANode: TcxTreeListNode);
    procedure FillData(ADev: TDevice; ANode: TcxTreeListNode);
    procedure resetRBPos();
    procedure DoOnDevOnLineStatusChanged(dev: TDevice);
  public
    { Public declarations }
    procedure Refresh_WatchCar;
    {列出　车辆分组}
    procedure List_TreeGroup;
    {procedure Add2DevList<BR />
    往cxDeviceList 中添加一行　车辆监控信息}
    procedure Add2DevList(const ADev: Tdevice);

    procedure AddDevsByGroupId(grpId: Integer);
    procedure dbClickSelectedNode();
  end;

var
  watch_car: Twatch_car;

implementation
uses UGloabVar, umainf, GPsLibUnit, DateUtils, ConstDefineUnit;
{$R *.dfm}

procedure Twatch_car.Refresh_WatchCar;
var
  i: integer;
  dev: TDevice;
  firstIndex: Integer;
begin
  try
    //if ADeviceManage.Count = 0 then exit;
    if rbOffline.Checked then
      Exit;
    FIsCxTreeListCleared := False;
    if cxDeviceList.VisibleCount > 0 then //某分组车辆
    begin
      firstIndex := cxDeviceList.TopVisibleIndex;
      with cxDeviceList do
      begin
        for i := firstIndex to firstIndex + VisibleCount  do
        begin
          if FIsCxTreeListCleared then Exit;
          if (i < 0) or (i >= cxDeviceList.Count) then Continue;
          dev := TDevice(cxDeviceList.Items[i].Data);
          refreshData(dev, Items[i]);
        end;
      end;
    end;
  except
    on E: exception do
    begin
      uGloabVar.SystemLog.AddLog(' Twatch_car.Refresh_WatchCar函数报错: ', e.Message);
          //messagebox(0,pchar(e.Message ),'提示',mb_ok + mb_iconinformation);
    end;
  end;
end;

procedure Twatch_car.FormShow(Sender: TObject);
begin
  if umainf.Mainf.fun_DevHide.Enabled and umainf.Mainf.fun_DevHide.Visible then
  begin
    dev_Hide.Visible := true;
  end
  else
  begin
    dev_Hide.Visible := false;
  end;
  resetRBPos();
end;

procedure Twatch_car.cxDeviceListFocusedNodeChanged(Sender: TObject;
  APrevFocusedNode, AFocusedNode: TcxTreeListNode);
begin
  if cxDeviceList.FocusedNode = nil then exit;
  GCurSelectDev := TDevice(cxDeviceList.FocusedNode.Data);

  mainf.Edit2.Text := (GCurSelectDev.Id);
  mainf.Edit1.Text := GCurSelectDev.Car.No;
end;

procedure Twatch_car.FormCreate(Sender: TObject);
begin
//  cxDeviceList.Images := ResManage.BmpList;
  List_TreeGroup;
  ADeviceManage.OnDevOnLineStatusChanged := DoOnDevOnLineStatusChanged;
end;


procedure Twatch_car.List_TreeGroup;
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

        {devGrp := ADevGroupManage.items[i];
        for j := 0 to devGrp.DevListCount - 1 do
        begin
          dev := ADeviceManage.find(devGrp.DevList[j]);
          if dev.GroupID = devGrp.id then
            TreeView1.Items.AddChild(leaf_node[leaf_cnt - 1], dev.Car.No).Data := Pointer(-2);
        end;    }

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
begin
  TreeView1.AutoExpand := false;
  treeview1.Items.Clear;
  if ADeviceManage.Count = 0 then
  begin
 //   edit1.Text := '';
    GCurSelectGroupID := -1;
  end;
  vn_node := treeview1.Items.add(treeview1.topitem, '所有车辆');
  vn_node.Data := pointer(-1); //所有车辆
  cnt := ADevGroupManage.Count;
  GCurSelectGroupID := -1;
  group_list(0, vn_node, cnt);
  FCurrSelect := -1;
//  edit1.Text := '请选择组...';

  {cxDeviceList.BeginUpdate;
  cxDeviceList.Clear;
  for j := 0 to ADeviceManage.Count - 1 do
  begin
    Add2DevList(ADeviceManage.Items[j]);
  end;
  cxDeviceList.EndUpdate;  }

  vn_node.Expanded := true;
end;

procedure Twatch_car.Add2DevList(const ADev: Tdevice);
var
  node: TcxTreeListNode;
begin
  if ADev = nil then exit;
  try
    with cxDeviceList do
    begin
      node := cxDeviceList.Add;
      node.Data := Adev;
      FillData(Adev, node);
    end;
  finally
  end;
end;

procedure Twatch_car.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Mainf.show_ListCar.Checked := false;
end;

procedure Twatch_car.FillData(ADev: TDevice; ANode: TcxTreeListNode);
begin
  cxDeviceList.BeginUpdate;
  try
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
      Values[6]:= ADev.Altitude;

      Values[7] := getCarAngle(ADev.Orientation);

      if ADev.isOnline then
      begin
        if ADev.Switch[STAT_GPS_LOCATE] then
        begin
          Values[8] := '定位';
          ANode.StateIndex := 3;
        end
        else
        begin
          Values[8] := '非定位';
          ANode.StateIndex := 6;
        end;

        if ADev.Switch[MSG_STATE_0] then
          Values[9] := '在线'
        else
        begin
          Values[9] := '休眠';
          ANode.StateIndex := 7;
        end;
      end
      else
      begin
        Values[8] := '非定位';
        Values[9] := '不在线';
        ANode.StateIndex := 4;
      end;

//      if ADev.Switch[STAT_GPS_LOCATE] then
//      begin
//        Values[8] := '定位';
//      end
//      else
//        Values[8] := '非定位';
//      if ADev.isOnline and DataServer.Active then
//      begin
//        if ADev.Switch[STAT_GPS_LOCATE] then
//          ANode.StateIndex := 3
//        else
//          ANode.StateIndex := 6;
//
//        if ADev.Switch[MSG_STATE_0] then
//          Values[9] := '在线'
//        else
//        begin
//          Values[9] := '休眠';
//          ANode.StateIndex := 7;
//        end;
//      end
//      else //如不在线,就显示非定位..
//      begin
//  //      Values[7]:='';
//        Values[8] := '非定位';
//        Values[9] := '不在线';
//        ANode.StateIndex := 4;
//      end;
     { if ADev.Switch[4] then
      begin
        Values[8] := '休眠';
        ANode.StateIndex := 7;
      end;    }

  //    Values[10] := FMap.GpsDrawlayer.AutoFollowDevice = ADev;
      Values[10] := AutoFollowDevice = ADev;
      Values[11] := ADev.DrawTrack;
      Values[12] := ADev.Hide;
      Values[13] := ADev.Car.ZBH;
      Values[14] := ADev.SimNo;
      Values[16] := ADev.Login_DriverName + '('+ADev.Login_Driver+')';
      Values[17] := ADev.TerminalTypeName;
      if ADev.isOnline and ADev.Switch[STAT_DDS_ONLINE] then
      begin
        Values[18] := '在线';
        if not ADev.Switch[STAT_DDS_EXCURSIVE] then
        begin
          Values[19] := '正常';
        end
        else
        begin
          Values[19] := '偏移';
        end;
      end
      else
      begin
        Values[18] := '不在线';
        Values[19] := '未知';
      end;

      //ImageIndex := ADev.Car.ResIndex;
      SelectedIndex := ADev.Car.ResIndex;
    end;
  finally
    cxDeviceList.EndUpdate;
  end;
end;

procedure Twatch_car.cxDeviceListEditing(Sender: TObject;
  AColumn: TcxTreeListColumn; var Allow: Boolean);
var
  dev: TDevice;
begin
  if cxDeviceList.FocusedNode = nil then exit;
  dev := Tdevice(cxDeviceList.FocusedNode.Data);
  if (AColumn = dev_Track) and (dev.Longitude = 0) and (dev.Latitude = 0) then
  begin
    Allow := False;
    messagebox(handle, '目前该车无定位数据，不能跟踪!', '提示', mb_ok + mb_iconinformation);
  end;
  if (AColumn = dev_Hide) then
  begin
    if (dev.Alarm) then
    begin
      Dev.Hide := false;
    end;
  end;
end;

procedure Twatch_car.TreeView1Change(Sender: TObject; Node: TTreeNode);
var
  grpId: integer;
  j: integer;
  dev: Tdevice;
  devId: string;
  devGrp: TDevGroup;
begin
  if Node = nil then exit;
  grpId := Integer(Node.Data);
  if grpId = FCurrSelect then exit; //选择没变化,直接退出
  if grpId = -1 then //所有车辆
  begin
    cxDeviceList.BeginUpdate;
    cxDeviceList.Clear;
    for j := 0 to ADeviceManage.Count - 1 do
    begin
      dev := ADeviceManage.Items[j];
      Add2DevList(dev);

    end;
    cxDeviceList.EndUpdate;

    if cxDeviceList.FocusedNode <> nil then
      cxDeviceList.FocusedNode := nil; //
    GCurSelectGroupID := grpId;
//    edit1.Text:= TreeView1.Selected.Text;
    FCurrSelect := grpId;
    exit;
  end;
  if grpId >= 0 then //某分组车辆
  begin
    //列出某组车辆
    cxDeviceList.BeginUpdate;
    cxDeviceList.Clear;
    devGrp := ADevGroupManage.find(grpId);
    for j := 0 to devGrp.DevListCount - 1 do
    begin
      devId := devGrp.DevList[j];
      dev := ADeviceManage.find(devId);
      Add2DevList(dev);
    end;


    if cxDeviceList.FocusedNode <> nil then
      cxDeviceList.FocusedNode := nil; //
    cxDeviceList.EndUpdate;

    GCurSelectGroupID := grpId;
//    edit1.Text:= TreeView1.Selected.Text;
  end;
  FCurrSelect := grpId;
end;


procedure Twatch_car.TreeView1ContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  Node: TTreeNode;
begin
  Node := TreeView1.GetNodeAt(MousePos.X, MousePos.y);
  if Node <> nil then
    Node.Selected := true;
end;

procedure Twatch_car.cxDeviceListClick(Sender: TObject);
begin
  umainf.Mainf.PageControl1.ActivePageIndex := 0;
  if cxDeviceList.FocusedNode = nil then exit;
  GCurSelectDev := TDevice(cxDeviceList.FocusedNode.Data);

  mainf.Edit2.Text := (GCurSelectDev.Id);
  mainf.Edit1.Text := GCurSelectDev.Car.No;
  //mainf.ShowState(GCurSelectDev);
end;

procedure Twatch_car.FormEndDock(Sender, Target: TObject; X, Y: Integer);
begin
  if Self.Floating then
    Self.BorderStyle := bsSizeable
  else
    Self.BorderStyle := bsNone;
end;

procedure Twatch_car.cxDeviceListDblClick(Sender: TObject);
begin
  if cxDeviceList.FocusedNode = nil then exit;
  GCurSelectDev := TDevice(cxDeviceList.FocusedNode.Data);
  umainf.Mainf.fun_Locate_Car.Execute;
end;

procedure Twatch_car.TreeView1Click(Sender: TObject);
begin
  TreeView1.SetFocus;
end;

procedure Twatch_car.AddDevsByGroupId(grpId: Integer);
var
  j: Integer;
  dev: TDevice;
  devGrp: TDevGroup;
  devId: string;
begin
  FIsCxTreeListCleared := True;
  if grpId = -1 then //所有车辆
  begin
    cxDeviceList.BeginUpdate;
    cxDeviceList.Clear;
    for j := 0 to ADeviceManage.Count - 1 do
    begin
      dev := ADeviceManage.Items[j];
      if rbAll.Checked or (dev.isOnline <> rbOffline.Checked) then
        Add2DevList(dev);
//      if rbAll.Checked then
//        Add2DevList(dev)
//      else if rbOnline.Checked and dev.isOnline then
//        Add2DevList(dev)
//      else if rbOffline.Checked and not dev.isOnline then
//        Add2DevList(dev);
    end;
    cxDeviceList.EndUpdate;

    if cxDeviceList.FocusedNode <> nil then
      cxDeviceList.FocusedNode := nil; //
    GCurSelectGroupID := grpId;
//    edit1.Text:= TreeView1.Selected.Text;
    FCurrSelect := grpId;
    exit;
  end;
  if grpId >= 0 then //某分组车辆
  begin
    //列出某组车辆
    cxDeviceList.BeginUpdate;
    cxDeviceList.Clear;
    devGrp := ADevGroupManage.find(grpId);
    for j := 0 to devGrp.DevListCount - 1 do
    begin
      devId := devGrp.DevList[j];
      dev := ADeviceManage.find(devId);
      if rbAll.Checked or (dev.isOnline <> rbOffline.Checked) then
        Add2DevList(dev);

//      if rbAll.Checked then
//        Add2DevList(dev)
//      else if rbOnline.Checked and dev.isOnline then
//        Add2DevList(dev)
//      else if rbOffline.Checked and not dev.isOnline then
//        Add2DevList(dev);
    end;

    if cxDeviceList.FocusedNode <> nil then
      cxDeviceList.FocusedNode := nil; //
    cxDeviceList.EndUpdate;

    GCurSelectGroupID := grpId;
  end;
end;

procedure Twatch_car.cxDeviceListCustomDrawCell(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
begin
  if AViewInfo.Node.Values[9] = '在线' then
    ACanvas.Font.Color := clWindowText
  else
    ACanvas.Font.Color := clRed;
end;

procedure Twatch_car.dbClickSelectedNode;
begin
  cxDeviceListDblClick(nil);
end;

procedure Twatch_car.resetRBPos;
begin
  rbAll.Left := cxDeviceList.Left + 5;
  rbOnline.Left := rbAll.Left + rbAll.Width;
  rbOffline.Left := rbOnline.Left + rbOnline.Width;
  rbAll.Top := 4;
  rbOnline.Top := 4;
  rbOffline.Top := 4;
end;

procedure Twatch_car.cxDeviceListResize(Sender: TObject);
begin
  resetRBPos;
end;

procedure Twatch_car.rbAllClick(Sender: TObject);
begin
  AddDevsByGroupId(GCurSelectGroupID);
end;

procedure Twatch_car.refreshData(ADev: TDevice; ANode: TcxTreeListNode);
  procedure setValues(node: TcxTreeListNode; valIndex: Integer; v: Variant);
  begin
    if node.Values[valIndex] <> v then
      node.Values[valIndex] := v;
  end;
begin
  if ADev.IsGpsDataRefreshed or not ADev.isOnline or FIsCxTreeListCleared then
    Exit;

  ADev.IsGpsDataRefreshed := True;
  cxDeviceList.BeginUpdate;
  try
    with ADev, ANode do
    begin

      //Values[2] := FormatFloat('##0.000000', ADev.Longitude);
      //Values[3] := FormatFloat('##0.000000', ADev.Latitude);
      //setValues(Values[4], FormatFloat('##0.0', ADev.Speed/10));
      //Values[4] := FormatFloat('##0.0', ADev.Speed/10); {FormatFloat('##0.0', ADev.Speed); //* 1852/10000//LS}
      setValues(ANode, 4, FormatFloat('##0.0', ADev.Speed/10));
      if ADev.GpsTime = 0 then
        //Values[5] := ''//
        setValues(ANode, 5, '')
      else
        //Values[5] := FormatDateTime('yyyy-mm-dd hh:nn:ss', ADev.GpsTime);//
        setValues(ANode, 5, FormatDateTime('yyyy-mm-dd hh:nn:ss', ADev.GpsTime));
      //Values[6]:= ADev.Altitude;//
      setValues(ANode, 6, ADev.Altitude);

      //Values[7] := getCarAngle(ADev.Orientation);//
      setValues(ANode, 7, getCarAngle(ADev.Orientation));
      if ADev.isOnline then
      begin
        if ADev.Switch[STAT_GPS_LOCATE] then
        begin
          setValues(ANode, 8, '定位');
          ANode.StateIndex := 3;
        end
        else
        begin
          setValues(ANode, 8, '非定位');
          ANode.StateIndex := 6;
        end;

        if ADev.Switch[MSG_STATE_0] then
          setValues(ANode, 9, '在线')
        else
        begin
          setValues(ANode, 9, '休眠');
          ANode.StateIndex := 7;
        end;
      end
      else
      begin
        setValues(ANode, 8, '非定位');
        setValues(ANode, 9, '不在线');
        ANode.StateIndex := 4;
      end;
//      if ADev.Switch[STAT_GPS_LOCATE] then
//      begin
//        //Values[8] := '定位';
//        setValues(ANode, 8, '定位');
//      end
//      else
//        //Values[8] := '非定位';
//        setValues(ANode, 9, '非定位');
//      if ADev.isOnline and DataServer.Active then
//      begin
//        if ADev.Switch[STAT_GPS_LOCATE] then
//          ANode.StateIndex := 3
//        else
//          ANode.StateIndex := 6;
//
//        if ADev.Switch[MSG_STATE_0] then
//          //Values[9] := '在线'
//          setValues(ANode, 9, '在线')
//        else
//        begin
//          //Values[9] := '休眠';
//          setValues(ANode, 9, '休眠');
//          ANode.StateIndex := 7;
//        end;
//      end
//      else //如不在线,就显示非定位..
//      begin
//  //      Values[7]:='';
//        //Values[8] := '非定位';
//        setValues(ANode, 8, '非定位');
//        //Values[9] := '不在线';
//        setValues(ANode, 9, '不在线');
//        ANode.StateIndex := 4;
//      end;
     { if ADev.Switch[4] then
      begin
        Values[8] := '休眠';
        ANode.StateIndex := 7;
      end;    }

  //    Values[10] := FMap.GpsDrawlayer.AutoFollowDevice = ADev;
      //Values[10] := AutoFollowDevice = ADev;
      setValues(ANode, 10, AutoFollowDevice = ADev);
      //Values[11] := ADev.DrawTrack;
      //Values[12] := ADev.Hide;
      setValues(ANode, 12, ADev.Hide);
  //    Values[13] := ADev.Car.ZBH;
  //    Values[14] := ADev.SimNo;
      //Values[16] := ADev.Login_DriverName + '('+ADev.Login_Driver+')';
      setValues(ANode, 16, ADev.Login_DriverName + '('+ADev.Login_Driver+')');

      if ADev.Switch[STAT_DDS_ONLINE] then
      begin
        setValues(ANode, 18, '在线');
        if not ADev.Switch[STAT_DDS_EXCURSIVE] then
        begin
          setValues(ANode, 19, '正常');
        end
        else
        begin
          setValues(ANode, 19, '偏移');
        end;
      end
      else
      begin
        setValues(ANode, 18, '不在线');
        setValues(ANode, 19, '未知');
      end;
  //
  //    //ImageIndex := ADev.Car.ResIndex;
  //    SelectedIndex := ADev.Car.ResIndex;
    end;
  finally
    cxDeviceList.EndUpdate;
  end;
//  Application.ProcessMessages;
end;

procedure Twatch_car.DoOnDevOnLineStatusChanged(dev: TDevice);
var
  group: TDevGroup;
  node: TcxTreeListNode;
  isDevInGroup: Boolean;
begin
//  if dev.isOnline then
//    uGloabVar.SystemLog.AddLog(dev.Car.No + ' 上线了')
//  else
//    uGloabVar.SystemLog.AddLog(dev.Car.No + ' 下线了');

  if cxDeviceList.Count <= 0 then
    Exit;
  isDevInGroup := False;
  if GCurSelectGroupID = -1 then
    isDevInGroup := True
  else
  begin
    group := ADevGroupManage.find(GCurSelectGroupID);
    if group <> nil then
    begin
      if group.DevList.IndexOf(dev.Id) >= 0 then
      begin
        isDevInGroup := True;
      end;
    end;
  end;
  if isDevInGroup then
  begin
    if rbOnline.Checked then
    begin
      if dev.isOnline then
      begin
        FillData(dev, cxDeviceList.Add);
        Application.ProcessMessages;
      end
      else
      begin
        node := FindNodeByTextIncxTreeList(dev.IdStr, cxDeviceList, 0);
        if node <> nil then
        begin
          node.Delete;
          Application.ProcessMessages;
        end;
      end;
    end
    else if rbOffline.Checked then
    begin
      if dev.isOnline then
      begin
        node := cxDeviceList.FindNodeByText(dev.IdStr, cxDeviceList.Columns[0]);
        if node <> nil then
        begin
          node.Delete;
          Application.ProcessMessages;
        end;
      end
      else
      begin
        FillData(dev, cxDeviceList.Add);
        Application.ProcessMessages;
      end;
    end
    else
    begin
      node := cxDeviceList.FindNodeByText(dev.IdStr, cxDeviceList.Columns[0]);
      if node <> nil then
      begin
        FillData(dev, node);
        Application.ProcessMessages;
      end;
    end;
  end;
end;

end.

