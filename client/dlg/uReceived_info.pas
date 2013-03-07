unit uReceived_info;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, ImgList, StdCtrls, Buttons,Systemlog, DateUtils,
  Carunit, Menus, cxGraphics, cxCustomData, cxStyles, cxTL, cxInplaceContainer,
  cxControls, cxTextEdit;

type
  TReceived_info = class(TForm)
    Panel1: TPanel;
    BitBtn_Clr: TBitBtn;
    BitBtn_List100: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    cxNotOnLineList: TcxTreeList;
    cxTreeListColumn1: TcxTreeListColumn;
    cxTreeListColumn2: TcxTreeListColumn;
    cxTreeListColumn3: TcxTreeListColumn;
    cxTreeListColumn4: TcxTreeListColumn;
    cxNotOnLineListcxTreeListColumn1: TcxTreeListColumn;
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    cxNotOnLineListcxTreeListColumn2: TcxTreeListColumn;
    Panel2: TPanel;
    TreeView1: TTreeView;
    Panel3: TPanel;
    ProgressBar1: TProgressBar;
    cxInfoList: TcxTreeList;
    cxCarNo: TcxTreeListColumn;
    cxDateTime: TcxTreeListColumn;
    cxType: TcxTreeListColumn;
    cxContent: TcxTreeListColumn;
    cxGroupName: TcxTreeListColumn;
    cxGroupTel: TcxTreeListColumn;
    cxATypeID: TcxTreeListColumn;
    cxCount: TcxTreeListColumn;
    Splitter1: TSplitter;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    procedure BitBtn_ClrClick(Sender: TObject);
    procedure BitBtn_List100Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxInfoListDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxNotOnLineListClick(Sender: TObject);
    procedure cxInfoListClick(Sender: TObject);
    procedure cxNotOnLineListDblClick(Sender: TObject);
    procedure cxNotOnLineListFocusedNodeChanged(Sender: TObject;
      APrevFocusedNode, AFocusedNode: TcxTreeListNode);
    procedure cxInfoListFocusedNodeChanged(Sender: TObject;
      APrevFocusedNode, AFocusedNode: TcxTreeListNode);
    procedure BitBtn1Click(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure TreeView1Click(Sender: TObject);
    procedure TreeView1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure N5Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    //AutoRefreh: Boolean;
    FCurrSelect: Integer;
    procedure ClickTreeList(TreeList: TcxTreeList);
    procedure DbClickTreeList(TreeList: TcxTreeList);
  public
    Log:TSystemLog;
    procedure Add2DevList(const m: Tdevice);
    procedure List_TreeGroup;
    procedure LocalMap;
    procedure Refresh;
    procedure Refresh_Car;
    procedure ReceivedMsg(ADevID:string; AType:Byte; MsgStr:String);
    procedure Refresh_Msg(ADevID:string; AType:Byte; MsgStr:String);
    procedure RefreshInfoList;
    { Public declarations }
  end;

var
  Received_info: TReceived_info;

implementation
uses uGloabVar,ConstDefineUnit,umainf,MMSystem;
{$R *.dfm}


procedure TReceived_info.BitBtn_ClrClick(Sender: TObject);
begin
  if PageControl1.ActivePageIndex = 0 then
    cxNotOnLineList.Clear
  else if PageControl1.ActivePageIndex = 1 then
    cxInfoList.Clear;
end;

procedure TReceived_info.BitBtn_List100Click(Sender: TObject);
begin
  if PageControl1.ActivePageIndex = 0 then
  begin
    cxNotOnLineList.BeginUpdate;
    while cxNotOnLineList.Count  >10 do
    begin
      cxNotOnLineList.Items[cxNotOnLineList.Count-1].Delete;
    end;
    cxNotOnLineList.EndUpdate;
  end
  else if PageControl1.ActivePageIndex = 1 then
  begin
    cxInfoList.BeginUpdate;
    while cxInfoList.Count  >10 do
    begin
      cxInfoList.Items[cxInfoList.Count-1].Delete;
    end;
    cxInfoList.EndUpdate;
  end;
end;

procedure TReceived_info.Refresh_Car;
var
  j: integer;
  dev: Tdevice;
  devGroup: TDevGroup;
begin
  if ADeviceManage.Count <= 0 then Exit;
  cxNotOnLineList.Clear;
  cxNotOnLineList.BeginUpdate;
  for j := 0 to ADeviceManage.Count - 1 do
  begin
    dev := ADeviceManage.Items[j];
    if dev = nil then Continue;
    if (DayOf(Now)-DayOf(dev.GpsTime)>=3) or (dev.GpsTime=0) then
    begin
      with cxNotOnLineList.Add  do
      begin
        Data := dev;
        Values[0]:= dev.Car.No;
        if dev.GpsTime =0 then
          Values[1]:= ''
        else
          Values[1]:= FormatDateTime('yyyy-mm-dd hh:nn:ss',dev.GpsTime);

        Values[2] := '不在线';

        devGroup := ADevGroupManage.find(Dev.GroupID);
        if devGroup <> nil then
        begin
          Values[3] := devGroup.Name;
          Values[4] := devGroup.TelPhone;
        end;
      end;
    end;
    Application.ProcessMessages;
  end;
  cxNotOnLineList.EndUpdate;

end;

procedure TReceived_info.ReceivedMsg(ADevID: string; AType: Byte; MsgStr: String);
begin
  //if not CheckBox1.Checked then Exit;
  Refresh_Msg(ADevID, AType, MsgStr);
end;

procedure TReceived_info.Refresh_Msg(ADevID:string; AType:Byte; MsgStr:String);
  procedure PlayTheSound(SoundNameStr:String);
  var
    str:string;
  begin
    try
      //SetCurrentDir(ExtractFilePath(Application.ExeName));
      //str := ExpandFileName(SoundNameStr);
      //if FileExists(str) then
        MediaPalySound(str);
        //PlaySound(pchar(str),Hinstance,SND_FILENAME);
    except
    end;
  end;
var
  m: TDevice;
  find_ListItem : TcxTreeListNode;
  devGrp: TDevGroup;
begin
  if cxInfoList.Count>=1000 then BitBtn_List100Click(nil);

  if (not N5.Checked) then
  begin
    if ((N1.Checked) and (AType = MSG_Warning_10))
     or ((N2.Checked) and (AType = MSG_Warning_12))
     or ((N3.Checked) and (AType = MSG_Warning_14))
     or ((N4.Checked) and (AType = MSG_Warning_15))then   // 计价器
    begin
    end
    else
    begin
      Exit;
    end;
  end;


  m := ADeviceManage.find(ADevID);
  if m = nil then Exit;

  if FCurrSelect <> -1 then
  begin
    devGrp := ADevGroupManage.find(FCurrSelect);
    if devGrp = nil then Exit;

    if not devGrp.FindByDevID(m.id) then Exit;
  end;

  cxInfoList.BeginUpdate;
  find_ListItem:= FindTreeListNode(m.Car.No, 0, IntToStr(AType), 6, cxInfoList);
  if find_ListItem = nil then
  begin
    try
      with cxInfoList.Add  do //接收到服务器发送的通知消息
      begin
        Data := m;
        Values[0]:= m.Car.No;
        if m.GpsTime =0 then
          Values[1]:= FormatDateTime('yyyy-mm-dd hh:nn:ss',now)
        else
          Values[1]:= FormatDateTime('yyyy-mm-dd hh:nn:ss',m.GpsTime);
          Values[2]:= ReturnMsgTypeState(AType);
        if MsgStr<>'' then
          Values[3]:=MsgStr
        else
          Values[3]:=Values[2];

        devGrp := ADevGroupManage.find(m.GroupID);
        if devGrp <> nil then
        begin
          Values[4] := devGrp.Name;
          Values[5] := devGrp.TelPhone;
        end
        else
        begin
          Values[4] := '';
          Values[5] := '';
        end;
        Values[6] := IntToStr(AType);
        Values[7] := IntToStr(0);
        //Log.LogFile:=ExePath+Self.Caption+'\'+Self.Caption;
        Log.AddLog(datetimeTostr(now)+' '+Values[0]+' '+Values[2]+' '+Values[3]);
      end;
    finally

    end;
  end
  else
  begin
    with find_ListItem do
    begin
      Data := m;
      if m.GpsTime =0 then
        Values[1]:= FormatDateTime('yyyy-mm-dd hh:nn:ss',now)
      else
        Values[1]:= FormatDateTime('yyyy-mm-dd hh:nn:ss',m.GpsTime);
      Values[7] := IntToStr(StrToInt(Values[7]) + 1);
    end;
  end;
  cxInfoList.EndUpdate;
end;

procedure TReceived_info.FormCreate(Sender: TObject);
begin
 // DataServer.OnSendMsg:=ReceivedMsg;
 Log:=TSystemLog.Create;
 Log.LogFile:=ExePath+Self.Caption+'\'+Self.Caption;
 List_TreeGroup;
 CheckBox1.Checked := GlobalParam.IsAutoRefreshReceivedMsg;
 ADeviceManage.OnSendMsg := ReceivedMsg;
end;

procedure TReceived_info.FormDestroy(Sender: TObject);
begin
 Log.Free;
end;

procedure TReceived_info.cxInfoListDblClick(Sender: TObject);
begin
  DbClickTreeList(cxInfoList);
end;

procedure TReceived_info.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Mainf.Show_Prompt_Info.Checked := False;
end;

procedure TReceived_info.ClickTreeList(TreeList: TcxTreeList);
begin
  umainf.Mainf.PageControl1.ActivePageIndex := 0;
  if TreeList.FocusedNode = nil then exit;
  GCurSelectDev := TDevice(TreeList.FocusedNode.Data);
  GCurSelectDev.MsgTypeState := TreeList.FocusedNode.Values[2];

  mainf.Edit2.Text := (GCurSelectDev.Id);
  mainf.Edit1.Text := GCurSelectDev.Car.No;
  mainf.ShowState(GCurSelectDev);
end;

procedure TReceived_info.DbClickTreeList(TreeList: TcxTreeList);
begin
  if TreeList.FocusedNode = nil then exit;
  GCurSelectDev := TDevice(TreeList.FocusedNode.Data);
  GCurSelectDev.MsgTypeState := TreeList.FocusedNode.Values[2];
  umainf.Mainf.fun_Locate_Car.Execute;
end;

procedure TReceived_info.cxNotOnLineListClick(Sender: TObject);
begin
  ClickTreeList(cxNotOnLineList);
end;

procedure TReceived_info.cxInfoListClick(Sender: TObject);
begin
  ClickTreeList(cxInfoList);
end;

procedure TReceived_info.cxNotOnLineListDblClick(Sender: TObject);
begin
  DbClickTreeList(cxNotOnLineList);
end;

procedure TReceived_info.cxNotOnLineListFocusedNodeChanged(Sender: TObject;
  APrevFocusedNode, AFocusedNode: TcxTreeListNode);
begin
  if cxNotOnLineList.FocusedNode = nil then exit;
  GCurSelectDev := TDevice(cxNotOnLineList.FocusedNode.Data);
  GCurSelectDev.MsgTypeState := cxNotOnLineList.FocusedNode.Values[2];

  mainf.Edit2.Text := (GCurSelectDev.Id);
  mainf.Edit1.Text := GCurSelectDev.Car.No;
end;

procedure TReceived_info.cxInfoListFocusedNodeChanged(Sender: TObject;
  APrevFocusedNode, AFocusedNode: TcxTreeListNode);
begin
  if cxInfoList.FocusedNode = nil then exit;
  GCurSelectDev := TDevice(cxInfoList.FocusedNode.Data);
  GCurSelectDev.MsgTypeState := cxInfoList.FocusedNode.Values[2];

  mainf.Edit2.Text := (GCurSelectDev.Id);
  mainf.Edit1.Text := GCurSelectDev.Car.No;
end;

procedure TReceived_info.BitBtn1Click(Sender: TObject);
var
  i: Integer;
  dev: TDevice;
  devId: integer;
  devGrp: TDevGroup;
begin
  if PageControl1.ActivePageIndex = 0 then
  begin
    Refresh_Car;
  end
  else if PageControl1.ActivePageIndex = 1 then
  begin
    RefreshInfoList;
  end;
end;

procedure TReceived_info.Refresh;
begin
  if not CheckBox1.Checked then Exit;
  Refresh_Car;
end;

procedure TReceived_info.LocalMap;
var
  i: Integer;
begin
  with umainf.Mainf do
  begin
    if (not FDlg_Map.Visible) or (FDlg_Map.Floating) then
    begin
      FDlg_Map.ManualDock(PageControl_Center, nil, alLeft);
      FDlg_Map.Show;
    end;

    if PageControl_Center.PageCount >1 then
    begin
      //设置 地图窗口为　活动层
      for i := 0 to PageControl_Center.PageCount - 1 do
      begin
        if PageControl_Center.Pages[i].Caption = FDlg_Map.Caption then
        begin
          try
            PageControl_Center.ActivePageIndex := i;
          except
            break;
          end;
          break;
        end;
      end;
    end;
  end;
end;

procedure TReceived_info.List_TreeGroup;
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
begin
  TreeView1.AutoExpand := false;
  treeview1.Items.Clear;

  vn_node := treeview1.Items.add(treeview1.topitem, '所有车辆');
  vn_node.Data := pointer(-1); //所有车辆
  cnt := ADevGroupManage.Count;

  group_list(0, vn_node, cnt);
  FCurrSelect := -1;

  //cxDeviceList.BeginUpdate;
  //cxDeviceList.Clear;
  //for j := 0 to ADeviceManage.Count - 1 do
  //begin
  //  Add2DevList(ADeviceManage.Items[j]);
  //end;
  //cxDeviceList.EndUpdate;

  vn_node.Expanded := true;
end;

procedure TReceived_info.Add2DevList(const m: Tdevice);
begin
  if N1.Checked then   // 计价器
  begin
    if m.Switch_Warning[MSG_Warning_10] then Refresh_Msg(m.id, MSG_Warning_10, '');
  end;

  if N2.Checked then   // LED屏故障
  begin
    if m.Switch_Warning[MSG_Warning_12] then Refresh_Msg(m.id, MSG_Warning_12, '');
  end;

  if N3.Checked then  // TSM模块故障
  begin
    if m.Switch_Warning[MSG_Warning_14] then Refresh_Msg(m.id, MSG_Warning_14, '');
  end;

  if N4.Checked then  // 顶灯故障
  begin
    if m.Switch_Warning[MSG_Warning_15] then Refresh_Msg(m.id, MSG_Warning_15, '');
  end;

  if N5.Checked then  // 显示所有故障
  begin
    if m.Switch_Warning[MSG_Warning_2] then Refresh_Msg(m.id, MSG_Warning_2, '');
    if m.Switch_Warning[MSG_Warning_3] then Refresh_Msg(m.id, MSG_Warning_3, '');
    if m.Switch_Warning[MSG_Warning_4] then Refresh_Msg(m.id, MSG_Warning_4, '');
    if m.Switch_Warning[MSG_Warning_5] then Refresh_Msg(m.id, MSG_Warning_5, '');
    if m.Switch_Warning[MSG_Warning_6] then Refresh_Msg(m.id, MSG_Warning_6, '');
    if m.Switch_Warning[MSG_Warning_7] then Refresh_Msg(m.id, MSG_Warning_7, '');
    if m.Switch_Warning[MSG_Warning_8] then Refresh_Msg(m.id, MSG_Warning_8, '');
    if m.Switch_Warning[MSG_Warning_9] then Refresh_Msg(m.id, MSG_Warning_9, '');
    if m.Switch_Warning[MSG_Warning_10] then Refresh_Msg(m.id, MSG_Warning_10, '');
    if m.Switch_Warning[MSG_Warning_11] then Refresh_Msg(m.id, MSG_Warning_11, '');
    if m.Switch_Warning[MSG_Warning_12] then Refresh_Msg(m.id, MSG_Warning_12, '');
    if m.Switch_Warning[MSG_Warning_13] then Refresh_Msg(m.id, MSG_Warning_13, '');
    if m.Switch_Warning[MSG_Warning_14] then Refresh_Msg(m.id, MSG_Warning_14, '');
    if m.Switch_Warning[MSG_Warning_15] then Refresh_Msg(m.id, MSG_Warning_15, '');
    if m.Switch_Warning[MSG_Warning_16] then Refresh_Msg(m.id, MSG_Warning_16, '');
    if m.Switch_Warning[MSG_Warning_17] then Refresh_Msg(m.id, MSG_Warning_17, '');
    if m.Switch_Warning[MSG_Warning_18] then Refresh_Msg(m.id, MSG_Warning_18, '');
    if m.Switch_Warning[MSG_Warning_19] then Refresh_Msg(m.id, MSG_Warning_19, '');
    if m.Switch_Warning[MSG_Warning_20] then Refresh_Msg(m.id, MSG_Warning_20, '');
    if m.Switch_Warning[MSG_Warning_21] then Refresh_Msg(m.id, MSG_Warning_21, '');
    if m.Switch_Warning[MSG_Warning_22] then Refresh_Msg(m.id, MSG_Warning_22, '');
    if m.Switch_Warning[MSG_Warning_23] then Refresh_Msg(m.id, MSG_Warning_23, '');
    if m.Switch_Warning[MSG_Warning_24] then Refresh_Msg(m.id, MSG_Warning_24, '');
    if m.Switch_Warning[MSG_Warning_25] then Refresh_Msg(m.id, MSG_Warning_25, '');
    if m.Switch_Warning[MSG_Warning_26] then Refresh_Msg(m.id, MSG_Warning_26, '');
    if m.Switch_Warning[MSG_Warning_27] then Refresh_Msg(m.id, MSG_Warning_27, '');
    if m.Switch_Warning[MSG_Warning_28] then Refresh_Msg(m.id, MSG_Warning_28, '');
    if m.Switch_Warning[MSG_Warning_29] then Refresh_Msg(m.id, MSG_Warning_29, '');
    if m.Switch_Warning[MSG_Warning_30] then Refresh_Msg(m.id, MSG_Warning_30, '');
    if m.Switch_Warning[MSG_Warning_31] then Refresh_Msg(m.id, MSG_Warning_31, '');
  end;
end;

procedure TReceived_info.TreeView1Change(Sender: TObject; Node: TTreeNode);
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
  FCurrSelect := grpId;
  if grpId = -1 then //所有车辆
  begin
    cxInfoList.BeginUpdate;
    cxInfoList.Clear;
    for j := 0 to ADeviceManage.Count - 1 do
    begin
      dev := ADeviceManage.Items[j];
      Add2DevList(dev);

    end;
    cxInfoList.EndUpdate;

    if cxInfoList.FocusedNode <> nil then
      cxInfoList.FocusedNode := nil; //

    exit;
  end;
  if grpId >= 0 then //某分组车辆
  begin
    //列出某组车辆
    cxInfoList.BeginUpdate;
    cxInfoList.Clear;
    devGrp := ADevGroupManage.find(grpId);
    for j := 0 to devGrp.DevListCount - 1 do
    begin
      devId := devGrp.DevList[j];
      dev := ADeviceManage.find(devId);
      Add2DevList(dev);
    end;


    if cxInfoList.FocusedNode <> nil then
      cxInfoList.FocusedNode := nil; //
    cxInfoList.EndUpdate;

  end;

end;

procedure TReceived_info.TreeView1Click(Sender: TObject);
begin
  TreeView1.SetFocus;
end;

procedure TReceived_info.TreeView1ContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  Node: TTreeNode;
begin
  Node := TreeView1.GetNodeAt(MousePos.X, MousePos.y);
  if Node <> nil then
    Node.Selected := true;
end;

procedure TReceived_info.N5Click(Sender: TObject);
begin
  N5.Checked := NOT N5.Checked;
  N1.Checked := not N5.Checked;
  N2.Checked := not N5.Checked;
  N3.Checked := not N5.Checked;
  N4.Checked := not N5.Checked;
  RefreshInfoList;
end;

procedure TReceived_info.RefreshInfoList;
var
  i: Integer;
  dev: TDevice;
  devId: string;
  devGrp: TDevGroup;
begin
  try
    ProgressBar1.Visible := True;
    if FCurrSelect = -1 then
    begin
      ProgressBar1.Max := ADeviceManage.Count;
    end
    else if FCurrSelect >= 0 then
    begin
      devGrp := ADevGroupManage.find(FCurrSelect);
      ProgressBar1.Max := devGrp.DevListCount; 
    end;

    ProgressBar1.Min := 0;

    cxInfoList.BeginUpdate;
    cxInfoList.Clear;
    if FCurrSelect = -1 then //所有车辆
    begin
      for i := 0 to ADeviceManage.Count - 1 do
      begin
        dev := ADeviceManage.Items[i];
        Add2DevList(dev);
        Application.ProcessMessages;
      end;
    end
    else if FCurrSelect >= 0 then //某分组车辆
    begin
      for i := 0 to devGrp.DevListCount - 1 do
      begin
        devId := devGrp.DevList[i];
        dev := ADeviceManage.find(devId);
        Add2DevList(dev);
        Application.ProcessMessages;
      end;
    end;
    cxInfoList.EndUpdate;
    ProgressBar1.StepIt;
  finally
    ProgressBar1.Visible := False;
  end;
end;

procedure TReceived_info.N1Click(Sender: TObject);
begin
  N1.Checked := not N1.Checked;
  if N1.Checked then
    N5.Checked := not N1.Checked;
  RefreshInfoList;
end;

procedure TReceived_info.N2Click(Sender: TObject);
begin
  N2.Checked := not N2.Checked;
  if N2.Checked then
    N5.Checked := not N2.Checked;
  RefreshInfoList;
end;

procedure TReceived_info.N3Click(Sender: TObject);
begin
  N3.Checked := not N3.Checked;
  if N3.Checked then
    N5.Checked := not N3.Checked;
  RefreshInfoList;
end;

procedure TReceived_info.N4Click(Sender: TObject);
begin
  N4.Checked := not N4.Checked;
  if N4.Checked then
    N5.Checked := not N4.Checked;
  RefreshInfoList;
end;

procedure TReceived_info.CheckBox1Click(Sender: TObject);
begin
  GlobalParam.IsAutoRefreshReceivedMsg := CheckBox1.Checked;
end;

end.
