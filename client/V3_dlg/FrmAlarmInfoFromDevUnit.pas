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
          Values[0] := '进出区域/路线报警';

          Values[1] := GetDevAreaTypeName(areaType) + '[' + area.AreaName + ']';

          Values[2] := dev.Car.No;
          Values[3] := FormatDateTime('yyyy-MM-dd hh:nn:ss', dev.GpsTime);
          if flag = 0 then
            Values[4] := '进' + Values[1]
          else
            Values[4] := '出' + Values[1];

          Values[5] := dev.Id;
          Values[6] := '报警未确认';
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
        Values[0] := '超速报警';
        Values[1] := '';
        Values[4] := '当前速度:' + FormatFloat('##0.0', dev.Speed/10);

        if alarmAreaId > 0 then
        begin
          Values[4] := '当前速度:' + FormatFloat('##0.0', dev.Speed/10);
          if areaType < 3 then
          begin
            area := FAllAreaManage.findByAreaNo(alarmAreaId);
            if area <> nil then
            begin
              Values[1] := GetDevAreaTypeName(areaType) + '[' + area.AreaName + ']';
              Values[4] := '区域的限速值为' + IntToStr(area.maxSpeed) + ',' + Values[4];
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
                Values[1] := '路线[' + polyLineArea.AreaName + ']的路段[' + IntToStr(alarmAreaId) + ']';
                Values[4] := '路段的限速值为' + IntToStr(lineSection.LineSectionMaxSpeed) + ',' + Values[4];
              end;
            end;
          end;
        end;

        Values[2] := dev.Car.No;
        Values[3] := FormatDateTime('yyyy-MM-dd hh:nn:ss', dev.GpsTime);

        Values[5] := dev.Id;
        Values[6] := '报警未确认';
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
            Values[0] := '路线行驶时间不足报警';
            Values[4] := '在该路段行驶时间:' + IntToStr(runTime) + '秒,该路段设定的最短行驶时间:' + IntToStr(lineSection.LineSectionRunMinTime) + '秒';
          end
          else
          begin
            Values[0] := '路线行驶时间过长报警';
            Values[4] := '在该路段行驶时间:' + IntToStr(runTime) + '秒,该路段设定的最长行驶时间:' + IntToStr(lineSection.LineSectionRunMaxTime) + '秒';
          end;

          Values[1] := '路线[' + polyLineArea.AreaName + ']路段[' + IntToStr(alarmLineSectionId) + ']';

          Values[2] := dev.Car.No;
          Values[3] := FormatDateTime('yyyy-MM-dd hh:nn:ss', dev.GpsTime);

          Values[5] := dev.Id;
          Values[6] := '报警未确认';
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
      0: Result := True;//'紧急报警';
      1: Result := True;//'超速报警';
      2: Result := True;//'疲劳驾驶';
      3: Result := True;//'预警';
//      4: Result := 'GNSS模块发生故障';
//      5: Result := 'GNSS天线未接或被剪断';
//      6: Result := 'GNSS天线短路';
//      7: Result := '终端主电源欠压';
//      8: Result := '终端主电源掉电';
//      9: Result := '终端LCD或显示器故障';
//     10: Result := 'TTS模块故障';
//     11: Result := '摄像头故障';
//     12: Result := '道路运输证IC卡模块故障';
//     13: Result := '超速预警';
     14: Result := True;//'疲劳驾驶预警';
     
     18: Result := True;//'当天累计驾驶超时';
     19: Result := True;//'超时停车';
     20: Result := True;//'进出区域';
     21: Result := True;//'进出路线';
     22: Result := True;//'路段行驶时间不足/过长';
     23: Result := True;//'路线偏离报警';
//     24: Result := '车辆VSS故障';
//     25: Result := '车辆油量异常';
     26: Result := True;//'车辆被盗报警';
     27: Result := True;//'车辆非法点火';
     28: Result := True;//'车辆非法位移';
     29: Result := True;//'碰撞侧翻报警';
     30: Result := True;//'侧翻预警';
     31: Result := True;//'非法开门报警';
    end;
  end;  
var
  alarmTypeName: string;
  alarmInfo: TAlarmInfoFromDev;
begin
  if not IsAlarm(alarmType) then
    Exit;//只列出报警信息，故障类信息不加入列表
    
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
      Values[4] := '车辆可能发生[' + Values[0] + ']';
      Values[5] := dev.Id;
      Values[6] := '报警未确认';
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
      MessageBox(Handle, '该条报警记录已经处理，无法再次处理', '提示', MB_OK + MB_ICONINFORMATION);
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
        if Pos('进', selNode.Values[4]) = 1 then
          dlg.ioFlag := 1
        else if Pos('出', selNode.Values[4]) = 1 then
          dlg.ioFlag := 2
        else
          dlg.ioFlag := 0;

        if Pos('路线', selNode.Values[4]) = 3 then
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

//删除未确认报警信息
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
      MessageBox(Handle, '该报警信息已经被确认，不能删除', '提示', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

    alarmInfo := TAlarmInfoFromDev(selNode.Data);
    SendAlarmDealReply(alarmInfo, ALARMDEAL_NODEAL);

    FAlarmInfoManage.Delete(selNode.Values[9]);
    selNode.Delete;
  end;
end;

//删除所有未确认报警信息
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

//删除已处理完毕报警信息
procedure TfrmAlarmFromDev.menuDelDealedAlarmClick(Sender: TObject);
var
  selNode: TcxTreeListNode;
begin
  if cxAreaAlarmList.FocusedNode <> nil then
  begin
    selNode := cxAreaAlarmList.FocusedNode;
    if selNode.Values[7] < 2 then
    begin
      MessageBox(Handle, '该报警信息还未处理结束，不能删除', '提示', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
    FAlarmInfoManage.Delete(selNode.Values[9]);
    selNode.Delete;
  end;
end;

//删除所有已处理完毕报警信息
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
  begin//加入列表的报警信息过多时，先删除所有已经处理过的报警信息
    menuDelAllDealedAlarmClick(nil);
    if cxAreaAlarmList.Count >= 500 then
    begin//删除所有已处理过的报警信息后，仍然太多时，就从上开始删除10个报警信息
      j := 0;
      i := 0;
      while i < cxAreaAlarmList.Count do
      begin //删除10个处理未登记的
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
        begin//删除10个确认未处理
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
          begin//删除10个未确认
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
            PopMsg('报警处理提示', '已删除' + IntToStr(j) + '条未确认报警信息，请及时处理并删除已处理完毕信息');
          end;  
        end
        else
        begin
          if GlobalParam.IsSendTextWhenAlarm then
            PopMsg('报警处理提示', '已删除' + IntToStr(j) + '条确认未处理报警信息，请及时处理并删除已处理完毕信息');
        end;  
      end
      else
      begin
        if GlobalParam.IsSendTextWhenAlarm then
          PopMsg('报警处理提示', '已删除' + IntToStr(j) + '条处理未登记报警信息，请及时处理并删除已处理完毕信息');
      end;
    end
    else
    begin
      if GlobalParam.IsSendTextWhenAlarm then
        PopMsg('报警处理提示', '终端上报报警信息过多，已删除所有处理完毕的报警信息');
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

  s := '                     当前选中报警车辆信息              ';
  s := s + #13#10 + '     *****************************************************';
  s := s + #13#10 + '                      车牌号：' + dev.Car.No;
  s := s + #13#10 + '              车辆自编号：' + dev.Car.ZBH;
  s := s + #13#10 + '                      设备号：' + dev.Id;
  groupName := '未知分组';
  group := ADevGroupManage.find(dev.GroupID);
  if group <> nil then
    groupName := group.Name;
  s := s + #13#10 + '          车辆所属分组：' + groupName;
  s := s + #13#10 + '                      驾驶员：' + dev.Login_DriverName;
  if dev.isOnline then
  begin
    if dev.Switch[STAT_GPS_LOCATE] then
      s := s + #13#10 + '                  在线状态：在线、定位'
    else
      s := s + #13#10 + '                  在线状态：在线';
  end
  else
    s := s + #13#10 + '                  在线状态：不在线';

//  if dev.Switch[STAT_GPS_LOCATE] then
//    s := s + #13#10 + '                  ＧＰＳ状态：定位'
//  else
//    s := s + #13#10 + '                  ＧＰＳ状态：不定位';
  s := s + #13#10 + '                          速度：' + FormatFloat('##0.0', Dev.Speed/10);
  s := s + #13#10 + '                      经纬度：' + FormatFloat('##0.000000', Dev.Longitude) + '、' + FormatFloat('##0.000000', Dev.Latitude);
  s := s + #13#10 + '              ＧＰＳ时间：' + FormatDatetime('yyyy-mm-dd hh:nn:ss', Dev.GpsTime);
  if alarmInfo.AlarmPos <> '' then
    s := s + #13#10 + '                  报警位置：' + alarmInfo.AlarmPos;

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
