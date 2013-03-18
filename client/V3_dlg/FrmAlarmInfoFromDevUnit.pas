unit FrmAlarmInfoFromDevUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxInplaceContainer, cxControls, CarUnit, Menus, StdCtrls;

type
  TfrmAlarmFromDev = class(TForm)
    cxAreaAlarmList: TcxTreeList;
    alarm_type: TcxTreeListColumn;
    alarm_pos: TcxTreeListColumn;
    alarm_carNo: TcxTreeListColumn;
    alarm_time: TcxTreeListColumn;
    alarm_memo: TcxTreeListColumn;
    alarm_devId: TcxTreeListColumn;
    alarm_dealFlag: TcxTreeListColumn;
    PopupMenu1: TPopupMenu;
    menuDealAlarm: TMenuItem;
    alarm_typeId: TcxTreeListColumn;
    alarm_dealFlagId: TcxTreeListColumn;
    menuDelNotConfirmedAlarm: TMenuItem;
    menuDelAllNotConfirmedAlarm: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    menuDelDealedAlarm: TMenuItem;
    menuDelAllDealedAlarm: TMenuItem;
    alarm_id: TcxTreeListColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    Memo1: TMemo;
    cxStyle2: TcxStyle;
    procedure menuDealAlarmClick(Sender: TObject);
    procedure menuDelNotConfirmedAlarmClick(Sender: TObject);
    procedure menuDelAllNotConfirmedAlarmClick(Sender: TObject);
    procedure menuDelDealedAlarmClick(Sender: TObject);
    procedure menuDelAllDealedAlarmClick(Sender: TObject);
    procedure cxAreaAlarmListCustomDrawCell(Sender: TObject;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
      var ADone: Boolean);
    procedure cxAreaAlarmListClick(Sender: TObject);
  private
    { Private declarations }
    procedure checkCxTreeListCount();
    procedure SetMemo(dev: TDevice; alarmInfo: TAlarmInfoFromDev);

    procedure SendAlarmDealReply(alarmInfo: TAlarmInfoFromDev; dealRet: Byte);
  public
    { Public declarations }
    procedure DoOnCarOverSpeedAlarm(dev: TDevice; areaType: Byte; alarmAreaId: Integer);
    procedure DoOnCarInOutAreaAlarm(dev: TDevice; areaType: Byte; alarmAreaId: Integer; flag: Byte);
    procedure DoOnCarRunTimeAlarm(dev: TDevice; alarmLineSectionId: Integer; runTime: Integer; flag: Byte);

    procedure DoOnGpsDataAlarmInfo(dev: TDevice; alarmType: Integer);

    procedure RefreshAlarmDealStatus(alarmInfoId: Integer);
    procedure SetDevGeocodeSearch(alarmId: string; alarmPos: string);
  end;

implementation
uses
  uGloabVar, FrmDealAlarmInfoUnit, ConfineAreaUnit, umainf, MapPubUnit,
  ConstDefineUnit;

{$R *.dfm}

{ TfrmAlarmFromDev }

procedure TfrmAlarmFromDev.DoOnCarInOutAreaAlarm(dev: TDevice;
  areaType: Byte; alarmAreaId: Integer; flag: Byte);
var
  area: TBaseArea;
  alarmInfo: TAlarmInfoFromDev;
begin
  if flag = 0 then
  begin
    if GlobalParam.AlarmSound_InCArea <> '' then
    begin
      MediaPalySound(GlobalParam.AlarmSound_InCArea);
    end
  end
  else if flag = 1 then
  begin
    if GlobalParam.AlarmSound_OutCArea <> '' then
      MediaPalySound(GlobalParam.AlarmSound_OutCArea);
  end;
  
  if not dev.Switch_Warning_C[33] then
  begin
    area := FAllAreaManage.findByAreaNo(alarmAreaId);
    if area <> nil then
    begin
      checkCxTreeListCount;
      cxAreaAlarmList.BeginUpdate;
      try
        with cxAreaAlarmList.Add do
        begin
          Values[0] := '��������/·�߱���';

          Values[1] := GetDevAreaTypeName(areaType) + '[' + area.AreaName + ']';

          Values[2] := dev.Car.No;
          Values[3] := FormatDateTime('yyyy-MM-dd hh:nn:ss', dev.GpsTime);
          if flag = 0 then
            Values[4] := '��' + Values[1]
          else
            Values[4] := '��' + Values[1];

          Values[5] := dev.Id;
          Values[6] := '����δȷ��';
          Values[7] := -1;
          Values[8] := 50;

          alarmInfo := FAlarmInfoManage.Add(-1);
          Values[9] := alarmInfo.Id;
          alarmInfo.DevId := dev.Id;
          alarmInfo.CarNo := Values[2];
          alarmInfo.AlarmType := Values[8];
          alarmInfo.AlarmTime := dev.GpsTime;
          alarmInfo.AlarmPos := Values[1];

          alarmInfo.AlarmMemo := Values[4];
          alarmInfo.AlarmDealStatus := Values[7];
          alarmInfo.AlarmIdManual := dev.AlarmIdManual;
          alarmInfo.AlarmLong := dev.Longitude;
          alarmInfo.AlarmLat := dev.Latitude;

          SendAlarmDealReply(alarmInfo, ALARMDEAL_DEALINFUTURE);

          Data := alarmInfo;
          //DevGeocodeSearch(IntToStr(alarmInfo.Id), dev.Longitude, dev.Latitude);
        end;
      finally
        cxAreaAlarmList.EndUpdate;
      end;
    end;

    dev.Switch_Warning_C[33] := True;
  end;
end;

procedure TfrmAlarmFromDev.DoOnCarOverSpeedAlarm(dev: TDevice;
  areaType: Byte; alarmAreaId: Integer);
var
  area: TBaseArea;
  polyLineArea: TPolyLineArea;
  lineSection: TLineSection;
  alarmInfo: TAlarmInfoFromDev;
begin
  if GlobalParam.AlarmSound_OverSpeet <> '' then
  begin
    MediaPalySound(GlobalParam.AlarmSound_OverSpeet);
  end;  
  if not dev.Switch_Warning_C[32] then
  begin
    checkCxTreeListCount;
    cxAreaAlarmList.BeginUpdate;
    try
      with cxAreaAlarmList.Add do
      begin
        Values[0] := '���ٱ���';
        Values[1] := '';
        Values[4] := '��ǰ�ٶ�:' + FormatFloat('##0.0', dev.Speed/10);

        if alarmAreaId > 0 then
        begin
          Values[4] := '��ǰ�ٶ�:' + FormatFloat('##0.0', dev.Speed/10);
          if areaType < 3 then
          begin
            area := FAllAreaManage.findByAreaNo(alarmAreaId);
            if area <> nil then
            begin
              Values[1] := GetDevAreaTypeName(areaType) + '[' + area.AreaName + ']';
              Values[4] := '���������ֵΪ' + IntToStr(area.maxSpeed) + ',' + Values[4];
            end;
          end
          else
          begin
            polyLineArea := FAllAreaManage.findByLineSectionNo(alarmAreaId);
            if (polyLineArea <> nil) then
            begin
              lineSection := polyLineArea.FindLineSection(alarmAreaId);
              if (lineSection <> nil) then
              begin
                Values[1] := '·��[' + polyLineArea.AreaName + ']��·��[' + IntToStr(alarmAreaId) + ']';
                Values[4] := '·�ε�����ֵΪ' + IntToStr(lineSection.LineSectionMaxSpeed) + ',' + Values[4];
              end;
            end;
          end;
        end;

        Values[2] := dev.Car.No;
        Values[3] := FormatDateTime('yyyy-MM-dd hh:nn:ss', dev.GpsTime);

        Values[5] := dev.Id;
        Values[6] := '����δȷ��';
        Values[7] := -1;
        Values[8] := 49;

        alarmInfo := FAlarmInfoManage.Add(-1);
        Values[9] := alarmInfo.Id;
        alarmInfo.DevId := dev.Id;
        alarmInfo.CarNo := Values[2];
        alarmInfo.AlarmType := Values[8];
        alarmInfo.AlarmTime := dev.GpsTime;
        alarmInfo.AlarmPos := Values[1];

        alarmInfo.AlarmMemo := Values[4];
        alarmInfo.AlarmDealStatus := Values[7];
        alarmInfo.AlarmIdManual := dev.AlarmIdManual;
        alarmInfo.AlarmLong := dev.Longitude;
        alarmInfo.AlarmLat := dev.Latitude;

        SendAlarmDealReply(alarmInfo, ALARMDEAL_DEALINFUTURE);

        Data := alarmInfo;
        //DevGeocodeSearch(IntToStr(alarmInfo.Id), dev.Longitude, dev.Latitude);
      end;
    finally
      cxAreaAlarmList.EndUpdate;
    end;

    dev.Switch_Warning_C[32] := True;
  end;
end;

procedure TfrmAlarmFromDev.DoOnCarRunTimeAlarm(dev: TDevice;
  alarmLineSectionId, runTime: Integer; flag: Byte);
var
  polyLineArea: TPolyLineArea;
  lineSection: TLineSection;
  alarmInfo: TAlarmInfoFromDev;
begin
  if not dev.Switch_Warning_C[34] then
  begin
    polyLineArea := FAllAreaManage.findByLineSectionNo(alarmLineSectionId);
    if (polyLineArea <> nil) then
    begin
      lineSection := polyLineArea.FindLineSection(alarmLineSectionId);
      if (lineSection = nil) then Exit;

      checkCxTreeListCount;
      cxAreaAlarmList.BeginUpdate;
      try
        with cxAreaAlarmList.Add do
        begin
          if flag = 0 then
          begin
            Values[0] := '·����ʻʱ�䲻�㱨��';
            Values[4] := '�ڸ�·����ʻʱ��:' + IntToStr(runTime) + '��,��·���趨�������ʻʱ��:' + IntToStr(lineSection.LineSectionRunMinTime) + '��';
          end
          else
          begin
            Values[0] := '·����ʻʱ���������';
            Values[4] := '�ڸ�·����ʻʱ��:' + IntToStr(runTime) + '��,��·���趨�����ʻʱ��:' + IntToStr(lineSection.LineSectionRunMaxTime) + '��';
          end;

          Values[1] := '·��[' + polyLineArea.AreaName + ']·��[' + IntToStr(alarmLineSectionId) + ']';

          Values[2] := dev.Car.No;
          Values[3] := FormatDateTime('yyyy-MM-dd hh:nn:ss', dev.GpsTime);

          Values[5] := dev.Id;
          Values[6] := '����δȷ��';
          Values[7] := -1;
          Values[8] := 51;

          alarmInfo := FAlarmInfoManage.Add(-1);
          Values[9] := alarmInfo.Id;
          alarmInfo.DevId := dev.Id;
          alarmInfo.CarNo := Values[2];
          alarmInfo.AlarmType := Values[8];
          alarmInfo.AlarmTime := dev.GpsTime;
          alarmInfo.AlarmPos := Values[1];

          alarmInfo.AlarmMemo := Values[4];
          alarmInfo.AlarmDealStatus := Values[7];
          alarmInfo.AlarmIdManual := dev.AlarmIdManual;
          alarmInfo.AlarmLong := dev.Longitude;
          alarmInfo.AlarmLat := dev.Latitude;
          
          SendAlarmDealReply(alarmInfo, ALARMDEAL_DEALINFUTURE);
          
          Data := alarmInfo;
          //DevGeocodeSearch(IntToStr(alarmInfo.Id), dev.Longitude, dev.Latitude);
        end;
      finally
        cxAreaAlarmList.EndUpdate;
      end;
    end;

    dev.Switch_Warning_C[34] := True;
  end;
end;

procedure TfrmAlarmFromDev.DoOnGpsDataAlarmInfo(dev: TDevice;
  alarmType: Integer);
  function IsAlarm(alarmType: Byte): Boolean;
  begin
    Result := False;
    case alarmType of
      0: Result := True;//'��������';
      1: Result := True;//'���ٱ���';
      2: Result := True;//'ƣ�ͼ�ʻ';
      3: Result := True;//'Ԥ��';
//      4: Result := 'GNSSģ�鷢������';
//      5: Result := 'GNSS����δ�ӻ򱻼���';
//      6: Result := 'GNSS���߶�·';
//      7: Result := '�ն�����ԴǷѹ';
//      8: Result := '�ն�����Դ����';
//      9: Result := '�ն�LCD����ʾ������';
//     10: Result := 'TTSģ�����';
//     11: Result := '����ͷ����';
//     12: Result := '��·����֤IC��ģ�����';
//     13: Result := '����Ԥ��';
     14: Result := True;//'ƣ�ͼ�ʻԤ��';
     
     18: Result := True;//'�����ۼƼ�ʻ��ʱ';
     19: Result := True;//'��ʱͣ��';
     20: Result := True;//'��������';
     21: Result := True;//'����·��';
     22: Result := True;//'·����ʻʱ�䲻��/����';
     23: Result := True;//'·��ƫ�뱨��';
//     24: Result := '����VSS����';
//     25: Result := '���������쳣';
     26: Result := True;//'������������';
     27: Result := True;//'�����Ƿ����';
     28: Result := True;//'�����Ƿ�λ��';
     29: Result := True;//'��ײ�෭����';
     30: Result := True;//'�෭Ԥ��';
     31: Result := True;//'�Ƿ����ű���';
    end;
  end;  
var
  alarmTypeName: string;
  alarmInfo: TAlarmInfoFromDev;
begin
  if not IsAlarm(alarmType) then
    Exit;//ֻ�г�������Ϣ����������Ϣ�������б�
    
  alarmTypeName := GetGpsDataAlarmTypeName(alarmType);

  checkCxTreeListCount;
  cxAreaAlarmList.BeginUpdate;
  try
    with cxAreaAlarmList.Add do
    begin
      Values[0] := alarmTypeName;
      Values[1] := '';
      Values[2] := dev.Car.No;
      Values[3] := FormatDateTime('yyyy-MM-dd hh:nn:ss', dev.GpsTime);
      Values[4] := '�������ܷ���[' + Values[0] + ']';
      Values[5] := dev.Id;
      Values[6] := '����δȷ��';
      Values[7] := -1;
      Values[8] := alarmType;

      alarmInfo := FAlarmInfoManage.Add(-1);
      Values[9] := alarmInfo.Id;
      alarmInfo.DevId := dev.Id;
      alarmInfo.CarNo := Values[2];
      alarmInfo.AlarmType := Values[8];
      alarmInfo.AlarmTime := dev.GpsTime;
      alarmInfo.AlarmPos := Values[1];
      alarmInfo.AlarmMemo := Values[4];
      alarmInfo.AlarmDealStatus := Values[7];
      alarmInfo.AlarmIdManual := dev.AlarmIdManual;
      alarmInfo.AlarmLong := dev.Longitude;
      alarmInfo.AlarmLat := dev.Latitude;
      if alarmInfo.AlarmType = 0 then
      begin
        FAlarmInfoManage.IsEmergencyHappened := True;
        if not Mainf.timerScrollAlarm.Enabled then
          Mainf.resetScrollLabelCaption;
      end;

      SendAlarmDealReply(alarmInfo, ALARMDEAL_DEALINFUTURE);

      Data := alarmInfo;
      //DevGeocodeSearch(IntToStr(alarmInfo.Id), dev.Longitude, dev.Latitude);
    end;
  finally
    cxAreaAlarmList.EndUpdate;
  end;
end;

procedure TfrmAlarmFromDev.menuDealAlarmClick(Sender: TObject);
var
  dlg: TfrmDealDevAlarmInfo;
  selNode: TcxTreeListNode;
  alarmInfo: TAlarmInfoFromDev;
  oldStatus: Integer;
begin
  if cxAreaAlarmList.FocusedNode <> nil then
  begin
    selNode := cxAreaAlarmList.FocusedNode;
    if selNode.Values[7] = 2 then
    begin
      MessageBox(Handle, '����������¼�Ѿ������޷��ٴδ���', '��ʾ', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
    alarmInfo := TAlarmInfoFromDev(selNode.Data);
    if alarmInfo = nil then Exit;

    dlg := TfrmDealDevAlarmInfo.Create(Self);
    try
      oldStatus := selNode.Values[7];
      dlg.currStatus := selNode.Values[7];
      dlg.edtCarNo.Text := selNode.Values[2];
      dlg.devId := selNode.Values[5];
      dlg.alarmType := selNode.Values[8];

      if dlg.alarmType in [50] then
      begin
        if Pos('��', selNode.Values[4]) = 1 then
          dlg.ioFlag := 1
        else if Pos('��', selNode.Values[4]) = 1 then
          dlg.ioFlag := 2
        else
          dlg.ioFlag := 0;

        if Pos('·��', selNode.Values[4]) = 3 then
          dlg.areaType := 1
        else
          dlg.areaType := 2
      end;

      dlg.alarmGpsTime := selNode.Values[3];
      dlg.Notebook1.PageIndex := selNode.Values[7] + 1;
      if dlg.Notebook1.PageIndex = 0 then
      begin
        dlg.edtAlarmType.Text := selNode.Values[0];
      end;
      currAlarmInfo := alarmInfo;
      if dlg.ShowModal = mrOK then
      begin
        selNode.Values[6] := GetDevAlarmDealStatusName(dlg.currStatus, alarmInfo);
        selNode.Values[7] := dlg.currStatus;
      end
      else
      begin
        selNode.Values[6] := GetDevAlarmDealStatusName(dlg.currStatus, alarmInfo);
        selNode.Values[7] := dlg.currStatus;
      end;
      if oldStatus <> dlg.currStatus then
      begin
        if (selNode.Values[7] = 0) or (selNode.Values[7] = 1) then
        begin
          SendAlarmDealReply(alarmInfo, ALARMDEAL_DEALING);
        end
        else if selNode.Values[7] = 2 then
        begin
          SendAlarmDealReply(alarmInfo, ALARMDEAL_DEALED);
        end;    
      end;  
    finally
      dlg.Free;
      currAlarmInfo := nil;
    end;
  end;
end;

//ɾ��δȷ�ϱ�����Ϣ
procedure TfrmAlarmFromDev.menuDelNotConfirmedAlarmClick(Sender: TObject);
var
  selNode: TcxTreeListNode;
  alarmInfo: TAlarmInfoFromDev;
begin
  if cxAreaAlarmList.FocusedNode <> nil then
  begin
    selNode := cxAreaAlarmList.FocusedNode;
    if selNode.Values[7] >= 0 then
    begin
      MessageBox(Handle, '�ñ�����Ϣ�Ѿ���ȷ�ϣ�����ɾ��', '��ʾ', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

    alarmInfo := TAlarmInfoFromDev(selNode.Data);
    SendAlarmDealReply(alarmInfo, ALARMDEAL_NODEAL);

    FAlarmInfoManage.Delete(selNode.Values[9]);
    selNode.Delete;
  end;
end;

//ɾ������δȷ�ϱ�����Ϣ
procedure TfrmAlarmFromDev.menuDelAllNotConfirmedAlarmClick(Sender: TObject);
var
  i: Integer;
  node: TcxTreeListNode;
  alarmInfo: TAlarmInfoFromDev;
begin
  i := 0;
  while i < cxAreaAlarmList.Nodes.Count do
  begin
    node := cxAreaAlarmList.Items[i];
    alarmInfo := TAlarmInfoFromDev(node.Data);
    SendAlarmDealReply(alarmInfo, ALARMDEAL_NODEAL);
    if node.Values[7] < 0 then
    begin
      FAlarmInfoManage.Delete(node.Values[9]);
      node.Delete;
    end
    else
    begin
      Inc(i);
    end;
  end;
end;

//ɾ���Ѵ�����ϱ�����Ϣ
procedure TfrmAlarmFromDev.menuDelDealedAlarmClick(Sender: TObject);
var
  selNode: TcxTreeListNode;
begin
  if cxAreaAlarmList.FocusedNode <> nil then
  begin
    selNode := cxAreaAlarmList.FocusedNode;
    if selNode.Values[7] < 2 then
    begin
      MessageBox(Handle, '�ñ�����Ϣ��δ�������������ɾ��', '��ʾ', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
    FAlarmInfoManage.Delete(selNode.Values[9]);
    selNode.Delete;
  end;
end;

//ɾ�������Ѵ�����ϱ�����Ϣ
procedure TfrmAlarmFromDev.menuDelAllDealedAlarmClick(Sender: TObject);
var
  i: Integer;
  node: TcxTreeListNode;
begin
  i := 0;
  while i < cxAreaAlarmList.Nodes.Count do
  begin
    node := cxAreaAlarmList.Items[i];
    if node.Values[7] = 2 then
    begin
      FAlarmInfoManage.Delete(node.Values[9]);
      node.Delete;
    end
    else
    begin
      Inc(i);
    end;
  end;
end;

procedure TfrmAlarmFromDev.checkCxTreeListCount;
var
  i, j: Integer;
  node: TcxTreeListNode;
begin
  if cxAreaAlarmList.Count >= 500 then
  begin//�����б�ı�����Ϣ����ʱ����ɾ�������Ѿ�������ı�����Ϣ
    menuDelAllDealedAlarmClick(nil);
    if cxAreaAlarmList.Count >= 500 then
    begin//ɾ�������Ѵ�����ı�����Ϣ����Ȼ̫��ʱ���ʹ��Ͽ�ʼɾ��10��������Ϣ
      j := 0;
      i := 0;
      while i < cxAreaAlarmList.Count do
      begin //ɾ��10������δ�Ǽǵ�
        if j >= 10 then Break;
        node := cxAreaAlarmList.Items[i];
        if node.Values[7] = 1 then
        begin
          FAlarmInfoManage.Delete(node.Values[9]);
          node.Delete;
          Inc(j);
        end
        else
          Inc(i);
      end;
      if j = 0 then
      begin
        i := 0;
        while i < cxAreaAlarmList.Count do
        begin//ɾ��10��ȷ��δ����
          if j >= 10 then Break;
          node := cxAreaAlarmList.Items[i];
          if node.Values[7] = 0 then
          begin
            FAlarmInfoManage.Delete(node.Values[9]);
            node.Delete;
            Inc(j);
          end
          else
            Inc(i);
        end;
        if j = 0 then
        begin
          i := 0;
          while i < cxAreaAlarmList.Count do
          begin//ɾ��10��δȷ��
            if j >= 10 then Break;
            node := cxAreaAlarmList.Items[i];
            if node.Values[7] < 0 then
            begin
              FAlarmInfoManage.Delete(node.Values[9]);
              node.Delete;
              Inc(j);
            end
            else
              Inc(i);
          end;
          if (j > 0) and GlobalParam.IsSendTextWhenAlarm then
          begin
            PopMsg('����������ʾ', '��ɾ��' + IntToStr(j) + '��δȷ�ϱ�����Ϣ���뼰ʱ����ɾ���Ѵ��������Ϣ');
          end;  
        end
        else
        begin
          if GlobalParam.IsSendTextWhenAlarm then
            PopMsg('����������ʾ', '��ɾ��' + IntToStr(j) + '��ȷ��δ��������Ϣ���뼰ʱ����ɾ���Ѵ��������Ϣ');
        end;  
      end
      else
      begin
        if GlobalParam.IsSendTextWhenAlarm then
          PopMsg('����������ʾ', '��ɾ��' + IntToStr(j) + '������δ�ǼǱ�����Ϣ���뼰ʱ����ɾ���Ѵ��������Ϣ');
      end;
    end
    else
    begin
      if GlobalParam.IsSendTextWhenAlarm then
        PopMsg('����������ʾ', '�ն��ϱ�������Ϣ���࣬��ɾ�����д�����ϵı�����Ϣ');
    end;  
  end;
end;

procedure TfrmAlarmFromDev.RefreshAlarmDealStatus(alarmInfoId: Integer);
var
  node: TcxTreeListNode;
  alarmInfo: TAlarmInfoFromDev;
begin
  node := FindNodeByTextIncxTreeList(IntToStr(alarmInfoId), cxAreaAlarmList, 9);
  if node <> nil then
  begin
    alarmInfo := TAlarmInfoFromDev(node.Data);
    if alarmInfo <> nil then
    begin
      node.Values[6] := GetDevAlarmDealStatusName(node.Values[7], alarmInfo);
    end;
  end;
end;

procedure TfrmAlarmFromDev.cxAreaAlarmListCustomDrawCell(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
begin
  if AViewInfo.Node.Values[7] >= 1 then
    ACanvas.Font.Color := clWindowText
  else
    ACanvas.Font.Color := clRed;
end;

procedure TfrmAlarmFromDev.cxAreaAlarmListClick(Sender: TObject);
var
  dev: TDevice;
  alarmInfo: TAlarmInfoFromDev;
begin
  Memo1.Lines.Clear;
  if cxAreaAlarmList.SelectionCount <= 0 then
    Exit;

  alarmInfo := TAlarmInfoFromDev(cxAreaAlarmList.Selections[0].Data);
  if alarmInfo <> nil then
  begin
    dev := ADeviceManage.find(alarmInfo.DevId);
    if dev <> nil then
    begin
      SetMemo(dev, alarmInfo);
    end;
    if not alarmInfo.IsReqAlarmPos then
      DevGeocodeSearch(IntToStr(alarmInfo.Id), alarmInfo.AlarmLong, alarmInfo.AlarmLat);    
  end;  
end;

procedure TfrmAlarmFromDev.SetMemo(dev: TDevice; alarmInfo: TAlarmInfoFromDev);
var
  group: TDevGroup;
  groupName: string;
  s: string;
begin
  if dev = nil then Exit;

  s := '                     ��ǰѡ�б���������Ϣ              ';
  s := s + #13#10 + '     *****************************************************';
  s := s + #13#10 + '                      ���ƺţ�' + dev.Car.No;
  s := s + #13#10 + '              �����Ա�ţ�' + dev.Car.ZBH;
  s := s + #13#10 + '                      �豸�ţ�' + dev.Id;
  groupName := 'δ֪����';
  group := ADevGroupManage.find(dev.GroupID);
  if group <> nil then
    groupName := group.Name;
  s := s + #13#10 + '          �����������飺' + groupName;
  s := s + #13#10 + '                      ��ʻԱ��' + dev.Login_DriverName;
  if dev.isOnline then
  begin
    if dev.Switch[STAT_GPS_LOCATE] then
      s := s + #13#10 + '                  ����״̬�����ߡ���λ'
    else
      s := s + #13#10 + '                  ����״̬������';
  end
  else
    s := s + #13#10 + '                  ����״̬��������';

//  if dev.Switch[STAT_GPS_LOCATE] then
//    s := s + #13#10 + '                  �ǣУ�״̬����λ'
//  else
//    s := s + #13#10 + '                  �ǣУ�״̬������λ';
  s := s + #13#10 + '                          �ٶȣ�' + FormatFloat('##0.0', Dev.Speed/10);
  s := s + #13#10 + '                      ��γ�ȣ�' + FormatFloat('##0.000000', Dev.Longitude) + '��' + FormatFloat('##0.000000', Dev.Latitude);
  s := s + #13#10 + '              �ǣУ�ʱ�䣺' + FormatDatetime('yyyy-mm-dd hh:nn:ss', Dev.GpsTime);
  if alarmInfo.AlarmPos <> '' then
    s := s + #13#10 + '                  ����λ�ã�' + alarmInfo.AlarmPos;

  Memo1.Text := s;
end;

procedure TfrmAlarmFromDev.SetDevGeocodeSearch(alarmId: string;
  alarmPos: string);
var
  node: TcxTreeListNode;
  alarm: TAlarmInfoFromDev;
begin
  node := FindNodeByTextIncxTreeList(alarmId, cxAreaAlarmList, 9);
  if node <> nil then
  begin
    alarm := TAlarmInfoFromDev(node.Data);
    if alarm <> nil then
    begin
      if alarm.AlarmType <= 48 then
      begin
        alarm.AlarmPos := alarmPos;
        node.Values[1] := alarm.AlarmPos;
      end
      else
      begin
        alarm.AlarmPos := alarm.alarmPos + '(' + alarmPos + ')';
        node.Values[1] := alarm.AlarmPos;
      end;  
    end;
  end;
end;

procedure TfrmAlarmFromDev.SendAlarmDealReply(alarmInfo: TAlarmInfoFromDev;
  dealRet: Byte);
var
  dev: TDevice;
begin
  if (alarmInfo <> nil) and (alarmInfo.AlarmIdManual > 0) then
  begin
    dev := ADeviceManage.find(alarmInfo.DevId);
    if dev <> nil then
    begin
      DataServer.SendGovAlarmDealReply(dev.Car.No, dev.Car.ChePaiColor, alarmInfo.AlarmIdManual, dealRet);
    end;
  end;
end;

end.
