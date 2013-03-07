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
  Result := 'δ֪';
  case id of
    SRVTERM_GOV_CHECKDUTY: Result := 'ƽ̨�����Ϣ';
    SRVTERM_GOV_TEXTINFO: Result := '������Ϣ';
    SRVTERM_GOV_GPSDATACOUNT: Result := '������λ��������Ϣ';
    SRVTERM_GOV_STARTGPSDATA: Result := '֪ͨ��ʼ����������λ��Ϣ';
    SRVTERM_GOV_ENDGPSDATA: Result := '֪ͨ��������������λ��Ϣ';
  end;
end;

function GetGovAlarm_Type(id: Integer): string;
begin
  Result := 'δ֪';
  case id of
    1: Result := '����Ԥ����Ϣ';
    2: Result := 'ʵʱ������Ϣ';
  end;
end;

function GetGovObjTypeStr(srcCmdId: Integer; objType: Integer): string;
begin
  Result := '';
  if srcCmdId = SRVTERM_GOV_CHECKDUTY then
  begin
    Result := 'δ֪(' + IntToStr(objType) + ')';
    case objType of
      $01: Result := '��ǰ���ӵ��¼�ƽ̨';
      $02: Result := '�¼�ƽ̨������һҵ��';
      $03: Result := '�¼�ƽ̨��������ҵ��';
    end;
  end
  else if srcCmdId = SRVTERM_GOV_TEXTINFO then
  begin
    Result := 'δ֪(' + IntToStr(objType) + ')';
    case objType of
      $00: Result := '�¼�ƽ̨������һƽ̨';
      $01: Result := '��ǰ���ӵ��¼�ƽ̨';
      $02: Result := '�¼�ƽ̨������һҵ��';
      $03: Result := '�¼�ƽ̨��������ҵ��';
      $04: Result := '�¼�ƽ̨��������ƽ̨';
      $05: Result := '�¼�ƽ̨��������ƽ̨��ҵ��';
      $06: Result := '�¼�ƽ̨���������������ƽ̨';
      $07: Result := '�¼�ƽ̨���������������ƽ̨';
      $08: Result := '�¼�ƽ̨�������о�Ӫ����ҵ���ƽ̨';
      $09: Result := '�¼�ƽ̨�������зǾ�Ӫ����ҵ���ƽ̨';
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

      msg := '�ϼ�ƽ̨�·���' + Values[1];
      PopMsg(Values[1], msg);
      Mainf.resetScrollLabelCaptionWithTemp(msg);

      if govInfo.Id > 0 then
      begin
        Values[3] := 0;
        DataServer.SendGovInfoReply(GetReplyCmdId(govInfo.SrcCmdId), govInfo.ObjType, govInfo.ObjId, govInfo.Id, '�յ�');
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
    MessageBox(Handle, '����Ϣ����,�޷�����', '��ʾ', MB_OK + MB_ICONINFORMATION);
    Exit;
  end
  else if govInfo.Id < 0 then
  begin
    MessageBox(Handle, '����Ϣ����ظ�', '��ʾ', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;  

  if node.Values[3] >= 0 then
  begin
    if MessageBox(Handle, '����Ϣ�ѻظ�����ȷ����Ҫ���»ظ���', 'ȷ��', MB_YESNO + MB_ICONQUESTION) = IdNo then
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
    if MessageBox(Handle, '����Ϣ��δ�ظ�����ȷ��ɾ����', 'ȷ��', MB_YESNO + MB_ICONQUESTION) = IdNo then
      Exit;
  end
  else if MessageBox(Handle, '��ȷ��ɾ������Ϣ��', 'ȷ��', MB_YESNO + MB_ICONQUESTION) = IdNo then
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
    
    msg := Values[3] + '�·���' + Values[0];
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
      Values[3] := '����';
      if dev.Switch[STAT_GPS_LOCATE] then
      begin
        Values[2] := '��λ';
        StateIndex := 0
      end
      else
      begin
        Values[2] := '�Ƕ�λ';
        StateIndex := 2;
      end;
    end
    else //�粻����,����ʾ�Ƕ�λ..
    begin
      Values[2] := '�Ƕ�λ';
      Values[3] := '������';
      StateIndex := 1;
    end;
    Values[4] := FormatFloat('##0.0', dev.Speed/10);
    Values[5] := FormatDateTime('yyyy-mm-dd hh:nn:ss', dev.GpsTime);
    Values[6] := FormatFloat('##0.000000', dev.Longitude);
    Values[7] := FormatFloat('##0.000000', dev.Latitude);
    Values[8] := getCarAngle(dev.Orientation);
    Values[9] := dev.Altitude;
    Values[10] := 'δ����';
    if dev.IsEncrypted then
      Values[10] := '����';

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
      Values[3] := '����';
      if dev.Switch[STAT_GPS_LOCATE] then
      begin
        Values[2] := '��λ';
        StateIndex := 0
      end
      else
      begin
        Values[2] := '�Ƕ�λ';
        StateIndex := 2;
      end;
    end
    else //�粻����,����ʾ�Ƕ�λ..
    begin
      Values[2] := '�Ƕ�λ';
      Values[3] := '������';
      StateIndex := 1;
    end;
    Values[4] := FormatFloat('##0.0', dev.Speed/10);
    Values[5] := FormatDateTime('yyyy-mm-dd hh:nn:ss', dev.GpsTime);
    Values[6] := FormatFloat('##0.000000', dev.Longitude);
    Values[7] := FormatFloat('##0.000000', dev.Latitude);
    Values[8] := getCarAngle(dev.Orientation);
    Values[9] := dev.Altitude;
    Values[10] := 'δ����';
    if dev.IsEncrypted then
      Values[10] := '����';

    Values[11] := FormatDateTime('yyyy-MM-dd hh:nn:ss', Now);
    Values[12] := node.Values[12];
  end;  
end;

procedure TfrmRecvGovInfo.ShowState(Device: TDevice);
var
  tmpOkStr,tmpNoWarnStr:string;
begin
  tmpOkStr := '-';//����
  tmpNoWarnStr := '-';  //��
  try
    if Device = nil then exit;
//    if not Device.First then
//    begin
//      for i := 1 to DeviceStateList.RowCount - 1 do
//      begin
//        DeviceStateList.Cells[1, i] := '';
//      end;
//      DeviceStateList.Cells[0, 2] := '��������';
//      DeviceStateList.Cells[0, 3] := '��γ��γ';
//      exit;
//    end;

    if Device.Switch[MSG_STATE_0] then
      DeviceStateList.Values['ACC״̬'] := '��'
    else
      DeviceStateList.Values['ACC״̬'] := '��';

    if Device.Switch[MSG_STATE_1] then
      DeviceStateList.Values['��λ״̬'] := '��λ'
    else
      DeviceStateList.Values['��λ״̬'] := '�Ƕ�λ';
    if not Device.isOnline then
      DeviceStateList.Values['��λ״̬'] := '������'; //'�Ƕ�λ';sha20110602

    if not Device.Switch[MSG_STATE_2] then
    begin
      DeviceStateList.Cells[0, 2]:= '��γ';
      DeviceStateList.Values['��γ'] := FormatFloat('##0.000000', Device.Latitude);
    end
    else
    begin
      DeviceStateList.Cells[0, 2] := '��γ';
      DeviceStateList.Values['��γ'] := FormatFloat('##0.000000', Device.Latitude);
    end;

    if not Device.Switch[MSG_STATE_3] then
    begin
      DeviceStateList.Cells[0, 3] := '����';
      DeviceStateList.Values['����'] := FormatFloat('##0.000000', Device.Longitude);
    end
    else
    begin
      DeviceStateList.Cells[0, 3] := '����';
      DeviceStateList.Values['����'] := FormatFloat('##0.000000', Device.Longitude);
    end;

    if Device.Course <= 0 then
    begin
      DeviceStateList.Values['���'] := '';
    end
    else
    begin
      DeviceStateList.Values['���'] := FormatFloat('#0.0', Device.Course) + '����';
    end;

    if Device.Switch[MSG_STATE_4] then
      DeviceStateList.Values['��Ӫ״̬'] := 'ͣ��'
    else
      DeviceStateList.Values['��Ӫ״̬'] := 'Ӫ��';

    if not Device.Switch[MSG_STATE_5] then
      DeviceStateList.Values['��γ��״̬'] := 'δ����'
    else
      DeviceStateList.Values['��γ��״̬'] := '�Ѽ���';

    if Device.Switch[MSG_STATE_10] then
      DeviceStateList.Values['������·'] := '�Ͽ�'
    else
      DeviceStateList.Values['������·'] := tmpOkStr;

   if Device.Switch[MSG_STATE_11] then
      DeviceStateList.Values['������·'] := '�Ͽ�'
   else
      DeviceStateList.Values['������·'] := tmpOkStr;
    if Device.Switch[MSG_STATE_12] then
      DeviceStateList.Values['����״̬'] := '����'
    else
      DeviceStateList.Values['����״̬'] := '����';

    //------------------------������Ϣ
    if Device.Switch_Warning[MSG_WARNING_0] then
      DeviceStateList.Values['��������'] := '��'
    else
      DeviceStateList.Values['��������'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_1] then
      DeviceStateList.Values['���ٱ���'] := '��'
    else
      DeviceStateList.Values['���ٱ���'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_2] then
      DeviceStateList.Values['ƣ�ͼ�ʻ����'] := '��'
    else
      DeviceStateList.Values['ƣ�ͼ�ʻ����'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_3] then
      DeviceStateList.Values['Ԥ��'] := '��'
    else
      DeviceStateList.Values['Ԥ��'] := tmpNoWarnStr;


    if Device.Switch_Warning[MSG_WARNING_4] then
      DeviceStateList.Values['GPSģ��'] := '����'
    else
      DeviceStateList.Values['GPSģ��'] := tmpOkStr;

    if Device.Switch_Warning[MSG_WARNING_5] then
      DeviceStateList.Values['GPS����'] := 'δ�ӻ����'
    else
      DeviceStateList.Values['GPS����'] := tmpOkStr;

    if Device.Switch_Warning[MSG_WARNING_6] then
      DeviceStateList.Values['GPS���߶�·'] := '��'
    else
      DeviceStateList.Values['GPS���߶�·'] := tmpOkStr;

    if Device.Switch_Warning[MSG_WARNING_7] then
       DeviceStateList.Values['�ն�����ԴǷѹ����']:= '��'
    else
      DeviceStateList.Values['�ն�����ԴǷѹ����']:= tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_8] then
       DeviceStateList.Values['�ն�����Դ���籨��']:= '��'
    else
      DeviceStateList.Values['�ն�����Դ���籨��']:= tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_9] then
      DeviceStateList.Values['�ն�LCD����ʾ��'] := '����'
    else
      DeviceStateList.Values['�ն�LCD����ʾ��'] := tmpOkStr;

    if Device.Switch_Warning[MSG_WARNING_10] then
      DeviceStateList.Values['TTSģ��'] := '����'
    else
      DeviceStateList.Values['TTSģ��'] := tmpOkStr;

    if Device.Switch_Warning[MSG_WARNING_11] then
      DeviceStateList.Values['����ͷ'] := '����'
    else
      DeviceStateList.Values['����ͷ'] := tmpOkStr;    

    if Device.Switch_Warning[MSG_WARNING_18] then
      DeviceStateList.Values['�����ۼƼ�ʻ��ʱ����'] := '��'
    else
      DeviceStateList.Values['�����ۼƼ�ʻ��ʱ����'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_19] then
      DeviceStateList.Values['��ʱͣ������'] := '��'
    else
      DeviceStateList.Values['��ʱͣ������'] := tmpNoWarnStr;
    if Device.Switch_Warning[MSG_WARNING_20] then
      DeviceStateList.Values['�������򱨾�'] := '��'
    else
      DeviceStateList.Values['�������򱨾�'] := tmpNoWarnStr;
    if Device.Switch_Warning[MSG_WARNING_21] then
      DeviceStateList.Values['����·�߱���'] := '��'
    else
      DeviceStateList.Values['����·�߱���'] := tmpNoWarnStr;
    if Device.Switch_Warning[MSG_WARNING_22] then
      DeviceStateList.Values['·����ʻʱ��'] := '��������'
    else
      DeviceStateList.Values['·����ʻʱ��'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_23] then
      DeviceStateList.Values['·��ƫ�뱨��'] := '��'
    else
      DeviceStateList.Values['·��ƫ�뱨��'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_24] then
      DeviceStateList.Values['����VSS'] := '����'
    else
      DeviceStateList.Values['����VSS'] :=tmpOkStr;
    if Device.Switch_Warning[MSG_WARNING_25] then
      DeviceStateList.Values['��������'] := '�쳣'
    else
      DeviceStateList.Values['��������'] :=tmpOkStr;

    if Device.Switch_Warning[MSG_WARNING_26] then
      DeviceStateList.Values['������������'] := '��'
    else
      DeviceStateList.Values['������������'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_27] then
      DeviceStateList.Values['�����Ƿ���𱨾�'] := '��'
    else
      DeviceStateList.Values['�����Ƿ���𱨾�'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_28] then
      DeviceStateList.Values['�����Ƿ�λ�Ʊ���'] := '��'
    else
      DeviceStateList.Values['�����Ƿ�λ�Ʊ���'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_29] then
      DeviceStateList.Values['��ײ�෭��������'] := '��'
    else
      DeviceStateList.Values['��ײ�෭��������'] := tmpNoWarnStr;

  except on E: Exception do
      uGloabVar.SystemLog.AddLog(' TMainf.ShowState��������: ', e.Message);
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
        MessageBox(Handle, '�Բ��𣬸ó����ľ��Ȼ�γ��Ϊ0���޷���λ', '��ʾ', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;  
    end;
  end;
end;

end.
