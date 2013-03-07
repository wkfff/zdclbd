unit FrmRecvGovInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxInplaceContainer, cxControls, ComCtrls, CarUnit, Menus, Grids, ValEdit,
  ExtCtrls, ImgList;

type
  TfrmRecvGovInfo = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    cxGovInfoTreeList: TcxTreeList;
    cxAlarmSuperviseListcxTreeListColumn1: TcxTreeListColumn;
    cxAlarmSuperviseListcxTreeListColumn2: TcxTreeListColumn;
    cxAlarmSuperviseListcxTreeListColumn3: TcxTreeListColumn;
    cxGovAlarmTreeList: TcxTreeList;
    cxGovCarTreeList: TcxTreeList;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    cxGovInfoTreeListcxTreeListColumn1: TcxTreeListColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxTreeList1cxTreeListColumn1: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn2: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn3: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn4: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn5: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn6: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn7: TcxTreeListColumn;
    cxGovCarTreeListcxTreeListColumn1: TcxTreeListColumn;
    cxGovCarTreeListcxTreeListColumn2: TcxTreeListColumn;
    cxGovCarTreeListcxTreeListColumn3: TcxTreeListColumn;
    cxGovCarTreeListcxTreeListColumn4: TcxTreeListColumn;
    cxGovCarTreeListcxTreeListColumn5: TcxTreeListColumn;
    cxGovCarTreeListcxTreeListColumn6: TcxTreeListColumn;
    cxGovCarTreeListcxTreeListColumn7: TcxTreeListColumn;
    cxGovCarTreeListcxTreeListColumn8: TcxTreeListColumn;
    cxGovCarTreeListcxTreeListColumn9: TcxTreeListColumn;
    cxGovCarTreeListcxTreeListColumn10: TcxTreeListColumn;
    Panel1: TPanel;
    DeviceStateList: TValueListEditor;
    cxGovCarTreeListcxTreeListColumn11: TcxTreeListColumn;
    ImageList1: TImageList;
    cxGovInfoTreeListcxTreeListColumn2: TcxTreeListColumn;
    cxGovAlarmTreeListcxTreeListColumn1: TcxTreeListColumn;
    cxGovCarTreeListcxTreeListColumn12: TcxTreeListColumn;
    cxGovInfoTreeListcxTreeListColumn3: TcxTreeListColumn;
    cxGovInfoTreeListcxTreeListColumn4: TcxTreeListColumn;
    cxGovCarTreeListcxTreeListColumn13: TcxTreeListColumn;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    procedure cxGovInfoTreeListCustomDrawCell(Sender: TObject;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
      var ADone: Boolean);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGovCarTreeListClick(Sender: TObject);
    procedure cxGovCarTreeListDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure ShowState(Device: TDevice);
  public
    { Public declarations }
    procedure DoOnRecvGovInfo(govInfo: TGovInfo);
    procedure DoOnGovAlarmInfo(govAlarm: TGovAlarmInfo);
    procedure DoOnGovGpsData(dev: TDevice);
  end;

implementation
uses
  uGloabVar, ConstDefineUnit, FrmReplyGovInfoUnit, umainf, MapPubUnit,
  CmdStructUnit;

{$R *.dfm}

{ TfrmRecvGovInfo }

function GetGovInfoType(id: Integer): string;
begin
  Result := '未知';
  case id of
    SRVTERM_GOV_CHECKDUTY: Result := '平台查岗信息';
    SRVTERM_GOV_TEXTINFO: Result := '报文信息';
    SRVTERM_GOV_GPSDATACOUNT: Result := '车辆定位数据量信息';
    SRVTERM_GOV_STARTGPSDATA: Result := '通知开始交换车辆定位信息';
    SRVTERM_GOV_ENDGPSDATA: Result := '通知结束交换车辆定位信息';
  end;
end;

function GetGovAlarm_Type(id: Integer): string;
begin
  Result := '未知';
  case id of
    1: Result := '报警预警信息';
    2: Result := '实时报警信息';
  end;
end;

function GetGovObjTypeStr(srcCmdId: Integer; objType: Integer): string;
begin
  Result := '';
  if srcCmdId = SRVTERM_GOV_CHECKDUTY then
  begin
    Result := '未知(' + IntToStr(objType) + ')';
    case objType of
      $01: Result := '当前连接的下级平台';
      $02: Result := '下级平台所属单一业户';
      $03: Result := '下级平台所属所有业户';
    end;
  end
  else if srcCmdId = SRVTERM_GOV_TEXTINFO then
  begin
    Result := '未知(' + IntToStr(objType) + ')';
    case objType of
      $00: Result := '下级平台所属单一平台';
      $01: Result := '当前连接的下级平台';
      $02: Result := '下级平台所属单一业户';
      $03: Result := '下级平台所属所有业户';
      $04: Result := '下级平台所属所有平台';
      $05: Result := '下级平台所属所有平台和业户';
      $06: Result := '下级平台所属所有政府监管平台';
      $07: Result := '下级平台所属所有政府监管平台';
      $08: Result := '下级平台所属所有经营性企业监控平台';
      $09: Result := '下级平台所属所有非经营性企业监控平台';
    end;
  end;
end;

function GetGovObjId(objID: TGovObjID): string;
var
  ret: string;
begin
  SetLength(ret, Length(objID));
  CopyMemory(@ret[1], @objID[0], Length(objID));
  Result := Trim(ret);// + ByteArrToHexStr(objID);
end;  

procedure TfrmRecvGovInfo.DoOnRecvGovInfo(govInfo: TGovInfo);
var
  i: Integer;
  node: TcxTreeListNode;
  msg: string;
begin
  if govInfo <> nil then
  begin
    if cxGovInfoTreeList.Count >= 200 then
    begin
      i := 0;
      while i < 20 do
      begin
        node := cxGovInfoTreeList.Items[0];
        node.Delete;
        Inc(i);
      end;
    end;

    with cxGovInfoTreeList.Add do
    begin
      Data := govInfo;

      Values[0] := govInfo.Id;
      Values[1] := GetGovInfoType(govInfo.SrcCmdId);
      Values[2] := govInfo.Msg;
      Values[3] := -1;
      Values[4] := FormatDateTime('yyyy-MM-dd hh:nn:ss', Now);
      Values[5] := GetGovObjTypeStr(govInfo.SrcCmdId, govInfo.ObjType);
      Values[6] := GetGovObjId(govInfo.ObjId);

      msg := '上级平台下发了' + Values[1];
      PopMsg(Values[1], msg);
      Mainf.resetScrollLabelCaptionWithTemp(msg);

      if govInfo.Id > 0 then
      begin
        Values[3] := 0;
        DataServer.SendGovInfoReply(GetReplyCmdId(govInfo.SrcCmdId), govInfo.ObjType, govInfo.ObjId, govInfo.Id, '收到');
      end;
    end;
  end;
end;

procedure TfrmRecvGovInfo.cxGovInfoTreeListCustomDrawCell(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
begin
  if (AViewInfo.Node.Values[3] >= 0) or (AViewInfo.Node.Values[0] < 0) then
    ACanvas.Font.Color := clGreen
  else
    ACanvas.Font.Color := clRed;
end;

procedure TfrmRecvGovInfo.N1Click(Sender: TObject);
var
  dlg: TfrmReplyGovInfo;
  node: TCxTreeListNode;
  govInfo: TGovInfo;
begin
  node := cxGovInfoTreeList.FocusedNode;
  if node = nil then Exit;
  govInfo := TGovInfo(node.Data);
  if govInfo = nil then
  begin
    MessageBox(Handle, '该信息有误,无法处理', '提示', MB_OK + MB_ICONINFORMATION);
    Exit;
  end
  else if govInfo.Id < 0 then
  begin
    MessageBox(Handle, '该信息无需回复', '提示', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;  

  if node.Values[3] >= 0 then
  begin
    if MessageBox(Handle, '该信息已回复，您确认需要重新回复吗？', '确认', MB_YESNO + MB_ICONQUESTION) = IdNo then
      Exit;
  end;  

  dlg := TfrmReplyGovInfo.Create(Self);
  try
    if dlg.ShowModal = mrOk then
    begin
      node.Values[3] := 0;
      DataServer.SendGovInfoReply(GetReplyCmdId(govInfo.SrcCmdId), govInfo.ObjType, govInfo.ObjId, govInfo.Id, Trim(dlg.Memo1.Text));
    end;
  finally
    dlg.Free;
  end;
end;

procedure TfrmRecvGovInfo.N2Click(Sender: TObject);
var
  node: TcxTreeListNode;
begin
  node := cxGovInfoTreeList.FocusedNode;
  if node = nil then Exit;
  if node.Values[3] < 0 then
  begin
    if MessageBox(Handle, '该信息还未回复，您确认删除吗？', '确认', MB_YESNO + MB_ICONQUESTION) = IdNo then
      Exit;
  end
  else if MessageBox(Handle, '您确认删除该信息吗？', '确认', MB_YESNO + MB_ICONQUESTION) = IdNo then
    Exit;

  node.Delete;
  FGovInfoManage.Delete(node.Values[0]);
end;

procedure TfrmRecvGovInfo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Mainf.show_RecvGovInfo.Checked := False;
end;

procedure TfrmRecvGovInfo.DoOnGovAlarmInfo(govAlarm: TGovAlarmInfo);
var
  i: Integer;
  msg: string;
begin
  if cxGovAlarmTreeList.Count >= 200 then
  begin
    i := 0;
    while i < 20 do
    begin
      cxGovAlarmTreeList.Items[0].Delete;
      Inc(i);
    end;  
  end;
  with cxGovAlarmTreeList.Add do
  begin
    Values[0] := GetGovAlarm_Type(govAlarm.GovAlarm_Type);
    Values[1] := govAlarm.CarNo;
    Values[2] := GetCarCpColor(govAlarm.CarCPColorId);
    Values[3] := GetGovAlarmSrc(govAlarm.AlarmSrc);
    Values[4] := GetGovAlarmType(govAlarm.AlarmType);
    Values[5] := FormatDateTime('yyyy-MM-dd hh:nn:ss', govAlarm.AlarmTime);
    Values[6] := govAlarm.AlarmMsg;
    Values[7] := FormatDateTime('yyyy-MM-dd hh:nn:ss', Now);
    
    msg := Values[3] + '下发了' + Values[0];
    PopMsg(Values[0], msg);
    Mainf.resetScrollLabelCaptionWithTemp(msg);
  end;
end;

procedure TfrmRecvGovInfo.DoOnGovGpsData(dev: TDevice);
var
  node: TcxTreeListNode;
  isExisted: Boolean;
begin
  isExisted := True;
  node := FindNodeWithChildrenByTextIncxTreeList(dev.Car.No, cxGovCarTreeList, 0);
  if node = nil then
  begin
    node := cxGovCarTreeList.Add;
    isExisted := False;
  end;
  with node do
  begin
    Data := dev;
    Values[0] := dev.Car.No;
    Values[1] := GetCarCpColor(dev.Car.ChePaiColor);
    if dev.isOnline then
    begin
      Values[3] := '在线';
      if dev.Switch[STAT_GPS_LOCATE] then
      begin
        Values[2] := '定位';
        StateIndex := 0
      end
      else
      begin
        Values[2] := '非定位';
        StateIndex := 2;
      end;
    end
    else //如不在线,就显示非定位..
    begin
      Values[2] := '非定位';
      Values[3] := '不在线';
      StateIndex := 1;
    end;
    Values[4] := FormatFloat('##0.0', dev.Speed/10);
    Values[5] := FormatDateTime('yyyy-mm-dd hh:nn:ss', dev.GpsTime);
    Values[6] := FormatFloat('##0.000000', dev.Longitude);
    Values[7] := FormatFloat('##0.000000', dev.Latitude);
    Values[8] := getCarAngle(dev.Orientation);
    Values[9] := dev.Altitude;
    Values[10] := '未加密';
    if dev.IsEncrypted then
      Values[10] := '加密';

    Values[11] := FormatDateTime('yyyy-MM-dd hh:nn:ss', Now);
    if isExisted then
      Values[12] := Values[12] + 1
    else
      Values[12] := 1;
  end;
  with node.AddChild do
  begin
    Data := dev;
    Values[0] := dev.Car.No;
    Values[1] := GetCarCpColor(dev.Car.ChePaiColor);
    if dev.isOnline then
    begin
      Values[3] := '在线';
      if dev.Switch[STAT_GPS_LOCATE] then
      begin
        Values[2] := '定位';
        StateIndex := 0
      end
      else
      begin
        Values[2] := '非定位';
        StateIndex := 2;
      end;
    end
    else //如不在线,就显示非定位..
    begin
      Values[2] := '非定位';
      Values[3] := '不在线';
      StateIndex := 1;
    end;
    Values[4] := FormatFloat('##0.0', dev.Speed/10);
    Values[5] := FormatDateTime('yyyy-mm-dd hh:nn:ss', dev.GpsTime);
    Values[6] := FormatFloat('##0.000000', dev.Longitude);
    Values[7] := FormatFloat('##0.000000', dev.Latitude);
    Values[8] := getCarAngle(dev.Orientation);
    Values[9] := dev.Altitude;
    Values[10] := '未加密';
    if dev.IsEncrypted then
      Values[10] := '加密';

    Values[11] := FormatDateTime('yyyy-MM-dd hh:nn:ss', Now);
    Values[12] := node.Values[12];
  end;  
end;

procedure TfrmRecvGovInfo.ShowState(Device: TDevice);
var
  tmpOkStr,tmpNoWarnStr:string;
begin
  tmpOkStr := '-';//正常
  tmpNoWarnStr := '-';  //否
  try
    if Device = nil then exit;
//    if not Device.First then
//    begin
//      for i := 1 to DeviceStateList.RowCount - 1 do
//      begin
//        DeviceStateList.Cells[1, i] := '';
//      end;
//      DeviceStateList.Cells[0, 2] := '东经西经';
//      DeviceStateList.Cells[0, 3] := '南纬北纬';
//      exit;
//    end;

    if Device.Switch[MSG_STATE_0] then
      DeviceStateList.Values['ACC状态'] := '开'
    else
      DeviceStateList.Values['ACC状态'] := '关';

    if Device.Switch[MSG_STATE_1] then
      DeviceStateList.Values['定位状态'] := '定位'
    else
      DeviceStateList.Values['定位状态'] := '非定位';
    if not Device.isOnline then
      DeviceStateList.Values['定位状态'] := '不在线'; //'非定位';sha20110602

    if not Device.Switch[MSG_STATE_2] then
    begin
      DeviceStateList.Cells[0, 2]:= '北纬';
      DeviceStateList.Values['北纬'] := FormatFloat('##0.000000', Device.Latitude);
    end
    else
    begin
      DeviceStateList.Cells[0, 2] := '南纬';
      DeviceStateList.Values['南纬'] := FormatFloat('##0.000000', Device.Latitude);
    end;

    if not Device.Switch[MSG_STATE_3] then
    begin
      DeviceStateList.Cells[0, 3] := '东经';
      DeviceStateList.Values['东经'] := FormatFloat('##0.000000', Device.Longitude);
    end
    else
    begin
      DeviceStateList.Cells[0, 3] := '西经';
      DeviceStateList.Values['西经'] := FormatFloat('##0.000000', Device.Longitude);
    end;

    if Device.Course <= 0 then
    begin
      DeviceStateList.Values['里程'] := '';
    end
    else
    begin
      DeviceStateList.Values['里程'] := FormatFloat('#0.0', Device.Course) + '公里';
    end;

    if Device.Switch[MSG_STATE_4] then
      DeviceStateList.Values['运营状态'] := '停运'
    else
      DeviceStateList.Values['运营状态'] := '营运';

    if not Device.Switch[MSG_STATE_5] then
      DeviceStateList.Values['经纬度状态'] := '未加密'
    else
      DeviceStateList.Values['经纬度状态'] := '已加密';

    if Device.Switch[MSG_STATE_10] then
      DeviceStateList.Values['车辆油路'] := '断开'
    else
      DeviceStateList.Values['车辆油路'] := tmpOkStr;

   if Device.Switch[MSG_STATE_11] then
      DeviceStateList.Values['车辆电路'] := '断开'
   else
      DeviceStateList.Values['车辆电路'] := tmpOkStr;
    if Device.Switch[MSG_STATE_12] then
      DeviceStateList.Values['车门状态'] := '加锁'
    else
      DeviceStateList.Values['车门状态'] := '解锁';

    //------------------------报警信息
    if Device.Switch_Warning[MSG_WARNING_0] then
      DeviceStateList.Values['紧急报警'] := '是'
    else
      DeviceStateList.Values['紧急报警'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_1] then
      DeviceStateList.Values['超速报警'] := '是'
    else
      DeviceStateList.Values['超速报警'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_2] then
      DeviceStateList.Values['疲劳驾驶报警'] := '是'
    else
      DeviceStateList.Values['疲劳驾驶报警'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_3] then
      DeviceStateList.Values['预警'] := '是'
    else
      DeviceStateList.Values['预警'] := tmpNoWarnStr;


    if Device.Switch_Warning[MSG_WARNING_4] then
      DeviceStateList.Values['GPS模块'] := '故障'
    else
      DeviceStateList.Values['GPS模块'] := tmpOkStr;

    if Device.Switch_Warning[MSG_WARNING_5] then
      DeviceStateList.Values['GPS天线'] := '未接或剪断'
    else
      DeviceStateList.Values['GPS天线'] := tmpOkStr;

    if Device.Switch_Warning[MSG_WARNING_6] then
      DeviceStateList.Values['GPS天线短路'] := '是'
    else
      DeviceStateList.Values['GPS天线短路'] := tmpOkStr;

    if Device.Switch_Warning[MSG_WARNING_7] then
       DeviceStateList.Values['终端主电源欠压报警']:= '是'
    else
      DeviceStateList.Values['终端主电源欠压报警']:= tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_8] then
       DeviceStateList.Values['终端主电源掉电报警']:= '是'
    else
      DeviceStateList.Values['终端主电源掉电报警']:= tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_9] then
      DeviceStateList.Values['终端LCD或显示器'] := '故障'
    else
      DeviceStateList.Values['终端LCD或显示器'] := tmpOkStr;

    if Device.Switch_Warning[MSG_WARNING_10] then
      DeviceStateList.Values['TTS模块'] := '故障'
    else
      DeviceStateList.Values['TTS模块'] := tmpOkStr;

    if Device.Switch_Warning[MSG_WARNING_11] then
      DeviceStateList.Values['摄像头'] := '故障'
    else
      DeviceStateList.Values['摄像头'] := tmpOkStr;    

    if Device.Switch_Warning[MSG_WARNING_18] then
      DeviceStateList.Values['当天累计驾驶超时报警'] := '是'
    else
      DeviceStateList.Values['当天累计驾驶超时报警'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_19] then
      DeviceStateList.Values['超时停车报警'] := '是'
    else
      DeviceStateList.Values['超时停车报警'] := tmpNoWarnStr;
    if Device.Switch_Warning[MSG_WARNING_20] then
      DeviceStateList.Values['进出区域报警'] := '是'
    else
      DeviceStateList.Values['进出区域报警'] := tmpNoWarnStr;
    if Device.Switch_Warning[MSG_WARNING_21] then
      DeviceStateList.Values['进出路线报警'] := '是'
    else
      DeviceStateList.Values['进出路线报警'] := tmpNoWarnStr;
    if Device.Switch_Warning[MSG_WARNING_22] then
      DeviceStateList.Values['路段行驶时间'] := '不足或过长'
    else
      DeviceStateList.Values['路段行驶时间'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_23] then
      DeviceStateList.Values['路线偏离报警'] := '是'
    else
      DeviceStateList.Values['路线偏离报警'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_24] then
      DeviceStateList.Values['车辆VSS'] := '故障'
    else
      DeviceStateList.Values['车辆VSS'] :=tmpOkStr;
    if Device.Switch_Warning[MSG_WARNING_25] then
      DeviceStateList.Values['车辆油量'] := '异常'
    else
      DeviceStateList.Values['车辆油量'] :=tmpOkStr;

    if Device.Switch_Warning[MSG_WARNING_26] then
      DeviceStateList.Values['车辆被盗报警'] := '是'
    else
      DeviceStateList.Values['车辆被盗报警'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_27] then
      DeviceStateList.Values['车辆非法点火报警'] := '是'
    else
      DeviceStateList.Values['车辆非法点火报警'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_28] then
      DeviceStateList.Values['车辆非法位移报警'] := '是'
    else
      DeviceStateList.Values['车辆非法位移报警'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_29] then
      DeviceStateList.Values['碰撞侧翻报警报警'] := '是'
    else
      DeviceStateList.Values['碰撞侧翻报警报警'] := tmpNoWarnStr;

  except on E: Exception do
      uGloabVar.SystemLog.AddLog(' TMainf.ShowState函数报错: ', e.Message);
  end;
end;

procedure TfrmRecvGovInfo.cxGovCarTreeListClick(Sender: TObject);
var
  dev: TDevice;
begin
  if cxGovCarTreeList.FocusedNode = nil then exit;
  dev := TDevice(cxGovCarTreeList.FocusedNode.Data);
  if dev <> nil then
    ShowState(dev);
end;

procedure TfrmRecvGovInfo.cxGovCarTreeListDblClick(Sender: TObject);
var
  node: TcxTreeListNode;
  dev: TDevice;
begin
  node := cxGovCarTreeList.FocusedNode;
  if node <> nil then
  begin
    dev := TDevice(node.Data);
    if dev <> nil then
    begin
      if (dev.Latitude <> 0) and (dev.Longitude <> 0) then
        Local_Car(dev)
      else
      begin
        MessageBox(Handle, '对不起，该车辆的经度或纬度为0，无法定位', '提示', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;  
    end;
  end;
end;

end.
