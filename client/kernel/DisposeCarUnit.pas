unit DisposeCarUnit;

interface

uses Classes, ExtCtrls, CarUnit, SyncObjs, ConfineAreaUnit, MSNPopUp;

type

  TDisposeCar = class
  private
    FLock: TCriticalSection;
    procedure AddLog(log: string);
    procedure FTimerTimer(Sender: TObject);
  protected
    ADev: TDevice;
    Title: string;
    Msg: string;
    FTimer: TTimer;
    IsStop: Boolean;
    procedure DisposeDevEmergncyAlarm;
    procedure DisposeDevEarlyAlarm;
    procedure JudgeDevAccOffMoveAlarm;//判读车辆Accoff后车移动范围超过600米则报警
    procedure JudgeIOAreaOnTimeAlarm;
    procedure JudgeDevOutOrInCArea;
    procedure JudgeAssembleWarring;
    procedure JudgeDevOutToTownTime;
    procedure JudgeAntiFake_Warring;
    procedure JudgeSuspectedPetitions_Warring;
    procedure OnDevOtherAlarmEvent;
    procedure OnSendMsg;

    procedure DoOnDevEmergncyAlarm;     // 紧急报警
    procedure DoOnEarlyWarningEvent(b: Boolean; EarlyWarningCar: TEarlyWarningCar);    // 车辆预警
    procedure DoOnDevAlarm_OutorInCArea(ADev: Tdevice; AlarmType: Byte; AddorDel: boolean;
                                        AArea: TConfineArea);

    procedure PlayAlarmSoundIfAlarm;

    procedure ShowPopMsg;
    procedure PalySound(FilePath: string);
    function DisposeCar: Integer;
    procedure Dispose;
    procedure DealGpsDataWarningSign(dev: TDevice);
    procedure Execute;
  public

    constructor Create;
    destructor Destroy; override;
    procedure StartDispose;
    procedure StopDispose;
  end;

implementation

uses ActiveX, SysUtils, DateUtils, Forms, Graphics, MetaDefine, uGloabVar,
     CmdStructUnit, ConstDefineUnit, SystemLog, geome, MapMeasureCalc, MMSystem;

{ TDisposeCar }

constructor TDisposeCar.Create;
begin
  {inherited Create(False);
  FreeOnTerminate := True; }

  FLock := TCriticalSection.Create;

  FTimer := TTimer.Create(nil);
  FTimer.Interval := 1500;
  FTimer.OnTimer := FTimerTimer;
  FTimer.Enabled := False;

end;

destructor TDisposeCar.Destroy;
begin
  FLock.Free;
  FTimer.Enabled := False;
  FTimer.Free;
  //inherited;
end;

procedure TDisposeCar.Dispose;
var
  i, j: Integer;
  p: TWorldPoint;
  EarlyWarningCar: TEarlyWarningCar;
  alarmInfo: TAlarmInfoFromDev;
begin
//  p := Project.LoLa2XY(EarthPoint(ADev.Longitude, ADev.Latitude));
//  ADev.TraceList.AddPoint(ADev.Point);
//  ADeviceManage.FindMapName(Adev, ADev.Point);

//  DisposeDevEmergncyAlarm;                         // 紧急报警

//  DisposeDevEarlyAlarm;                            // 预警

  if ADev.IsSendCancelEmgcyAlarm and not ADev.Switch_Warning[0] then
  begin
    PopMsg('紧急报警解除', ADev.Car.No + #13#10 + '紧急报警解除成功');
    ADev.IsSendCancelEmgcyAlarm := False;
    if Assigned(DataServer.OnRefreshAlarmDealStatus) then
    begin
      alarmInfo := FAlarmInfoManage.Find(ADev.AlarmInfoId);
      if alarmInfo <> nil then
      begin
        alarmInfo.SendRemoveAlarmCmdStatus := 2;
        DataServer.OnRefreshAlarmDealStatus(ADev.AlarmInfoId);
      end;
    end;
  end;

  DealGpsDataWarningSign(ADev);

  PlayAlarmSoundIfAlarm;//非定位的情况下紧急报警也需处理

  if not Adev.Switch[STAT_GPS_LOCATE] then             // 如果非定位，就不判断以下报警
  begin
    exit;
  end;

  JudgeDevAccOffMoveAlarm;
  JudgeDevOutOrInCArea;               //是否越界或驶入报警区域　判断
//  JudgeAssembleWarring;               // 聚集报警
//  JudgeDevOutToTownTime;              // 出城报警
//  JudgeAntiFake_Warring;              // 打击克隆车(自动下发防伪密标)报警
//  JudgeSuspectedPetitions_Warring;    // 疑似上访报警
//  OnDevOtherAlarmEvent;               //
  if GlobalParam.IsAutoRefreshReceivedMsg then
    OnSendMsg;                          //
end;

function TDisposeCar.DisposeCar: Integer;
var
  i: Integer;
  emptyCount, fullCount: integer;
  j: Integer;
begin
  j := 0;
  try
    for i := 0 to ADeviceManage.Count - 1 do
    begin
      if i + 1 mod 20 = 0 then
        Application.ProcessMessages;
      try
        if IsStop then Exit;
        //sleep(1);
  //
        ADev := ADeviceManage.Items[i];

        JudgeIOAreaOnTimeAlarm;//车辆不在线时也要判断
      
        if not ADev.IsNewGpsData then Continue;  // 如果不是最新的GPS数据，就不解析
        ADev.IsNewGpsData := False;

        Dispose;
        j := j +1;
      except
        Continue;
      end;
    end;
  except
    on E: Exception do
    begin
      AddLog('DisposeCar Err:' + E.Message);
    end;  
  end;
  Result := j;
end;

procedure TDisposeCar.DisposeDevEmergncyAlarm;
var
  log, LogA: TSystemLog;  //
begin
  if bAlarm then
  begin
    if (ADev.Switch_Warning[MSG_Warning_0]) then //报警 判断 紧急报警（需要中心回码）
    begin
      if (not ADev.Alarm) then //接头的第0位=true,且原未报警或原报警已解除
      begin
        //if IsLastGpsData then  //程序启动后网关转来的 最后一点定位数据
        //  m.alarm_startTime := m.GpsTime
        //else
          ADev.alarm_startTime := ADev.GpsTime; //now;
        ADev.Alarm_endTime := 0;
        ADev.AlarmCount := ADev.AlarmCount + 1;
        ADev.Alarm := True; //置 报警标志
        ADev.AlarmCount := 1; //目标连接报警次数　第一次
        //if Assigned(ADeviceManage.OnDevEmergncyAlarmEvent) then
        //  ADeviceManage.OnDevEmergncyAlarmEvent(ADev);
      end else
      begin
        ADev.AlarmCount := ADev.AlarmCount + 1; //目标连接报警次数 +1
      end;

      LogA := TSystemLog.Create;
      try
        LogA.LogFile := ExePath + 'Alarm\DriverAlarm';
        LogA.ExtendName := 'csv';
        LogA.BufferSize := 0;
        LogA.AddLog(FormatDatetime('yyyy-mm-dd hh:nn:ss', now) + ',' +
          ADev.Car.No + ',报警次数:' + IntToStr(ADev.AlarmCount) +
          ',经度:' + FormatFloat('##0.000000', ADev.Longitude) +
          ',纬度:' + FormatFloat('##0.000000', ADev.Latitude));
      finally
        LogA.Free
      end;

      Title := '报警提示';
      Msg := ADev.Car.No + #13 + #10 + '紧急报警!';
      ShowPopMsg; //Synchronize(

      DoOnDevEmergncyAlarm;//Synchronize(

      //if Assigned(ADeviceManage.OnDevEmergncyAlarmEvent) then
      //  ADeviceManage.OnDevEmergncyAlarmEvent(ADev);
    end
    else
    begin
      ADev.Alarm := False;
    end;
  end;
end;

procedure TDisposeCar.DisposeDevEarlyAlarm;
var
  j: Integer;
  EarlyWarningCar: TEarlyWarningCar;
begin
  if bEarlyAlarm then
  begin
    if (ADev.Switch_Warning[MSG_Warning_1]) then   // 预警处理
    begin
      j := EarlyWarningCarList.IndexOf(ADev.id);
      if  j>= 0 then
      begin
        EarlyWarningCar := TEarlyWarningCar(EarlyWarningCarList.Objects[j]);
        EarlyWarningCar.FDevId := ADev.id;
        EarlyWarningCar.State := 0;
        EarlyWarningCar.FDev := ADev;
        EarlyWarningCar.FEarlyWarningInfoList.add(formatdatetime('yyyy-mm-dd hh:nn:ss', ADev.gpstime));
      end
      else
      begin
        EarlyWarningCar := TEarlyWarningCar.Create;
        EarlyWarningCar.FDevId := ADev.id;
        EarlyWarningCar.FState := 0;
        EarlyWarningCar.FDev := ADev;
        EarlyWarningCar.FEarlyWarningInfoList.Add(formatdatetime('yyyy-mm-dd hh:nn:ss', ADev.gpstime));
        EarlyWarningCarList.AddObject(ADev.id,EarlyWarningCar);


        //if Assigned(ADeviceManage.OnEarlyWarningEvent) then
        //  ADeviceManage.OnEarlyWarningEvent(True);
      end;
//      DoOnEarlyWarningEvent(True, EarlyWarningCar);
    end
    else
    begin
      j := EarlyWarningCarList.IndexOf(ADev.id);
      if j >= 0 then                           // 删除预警容器总已经存在的但当前状态不是预警的车机
      begin
        EarlyWarningCarList.Delete(j);
        DoOnEarlyWarningEvent(False, nil);
        //if Assigned(ADeviceManage.OnEarlyWarningEvent) then
        //  ADeviceManage.OnEarlyWarningEvent(False);
      end;
    end;
  end;
end;

procedure TDisposeCar.DoOnDevEmergncyAlarm;
var
  str: string;

begin
  {if ADev = nil then exit;
  if GlobalParam.IsAlarmFollow then //对当前报警车辆跟踪
  begin
    FMap.GpsDrawlayer.AutoFollowDevice := ADev;
    //StatusBar1.Panels.Items[2].Text := '跟踪报警车辆：' + m.Car.No;
  end;

  if ADev.AlarmCount < 6 then //响5声
  begin
    //报警声音
    if GlobalParam.DevAlarmSound <> '' then
    begin
      try
        MediaPalySound(GlobalParam.DevAlarmSound);
      except
      end;
    end;
  end;

  if GlobalParam.isalarmHurry then
  begin
    popmsg('报警提示', ADev.Car.No + #13 + #10 + '紧急报警!'); //08  6月 三号     //
  end;  }

  if Assigned(ADeviceManage.OnDevEmergncyAlarmEvent) then
    ADeviceManage.OnDevEmergncyAlarmEvent(ADev);
end;

procedure TDisposeCar.DoOnEarlyWarningEvent(b: Boolean; EarlyWarningCar: TEarlyWarningCar);    // 车辆预警
begin
  try
    //FLock.Enter;
    if Assigned(ADeviceManage.OnEarlyWarningEvent) then
          ADeviceManage.OnEarlyWarningEvent(b, EarlyWarningCar);
  finally
    //FLock.Leave;
  end;
end;

procedure TDisposeCar.Execute;
var
  i: Integer;
begin
  {try
    coinitialize(nil);
    while not Terminated do
    begin
      Sleep(500);
      DisposeCar;
    end;
  finally
    CoUninitialize;
  end;  }
end;

procedure TDisposeCar.JudgeDevOutOrInCArea;
var
  confArea: TConfineArea;
  p: TWorldPoint;
  pp: TEarthPoint;
  i: integer;
  time: double;
  dt: TDateTime;
begin

  if Adev.AreaList.Count <= 0 then exit;

  p := ADev.Point;
  for i := 0 to Adev.AreaList.Count - 1 do
  begin
    confArea := TConfineArea(Adev.AreaList.Items[i]);
    //判断是否在有效时间之间内.
    if confArea.IsEnabledTime then
    begin
      time := Adev.GpsTime - trunc(Adev.GpsTime);
      //开始是时大于结束时间.
      if confArea.BeginTime > confArea.EndTime then
      begin
        if not ((time > confArea.BeginTime) or (time < confArea.EndTime)) then
          continue;
      end
      else
      begin
        if not ((time > confArea.BeginTime) and (time < confArea.EndTime)) then
          continue;
      end;
    end;

    case confArea.AreaType of
      ALARM_OUT: //越界报警　判断
        begin
          if not GeometryCalc.PointInPolygon(p, confArea.WorldPointAry, 0, confArea.PointCount) then
          begin
            if not Adev.AreaList.ItemsIsOutAllow[i] then //没有越界 报警 过
            begin
              Adev.AreaList.ItemsIsOutAllow[i] := True;
              Adev.AlarmStart_OutCArea := Adev.GpsTime;
              Adev.AlarmEnd_OutCArea := Adev.GpsTime;

              DoOnDevAlarm_OutorInCArea(Adev, ALARM_OUT, True, confArea); //越界

            end
            else
              Adev.AlarmEnd_OutCArea := Adev.GpsTime;
            if (ADev.Alarm_OutCAreaIsShowPop) and (confArea.IsShowPop) then
            begin
              Title := '越界报警';
              Msg := Adev.Car.No + #13 + #10 + '驶出' + confArea.Name;
              ShowPopMsg;
              //ShowPopMsg('越界报警', Adev.Car.No + #13 + #10 + '驶出' + confArea.Name);
            end;
          end
          else
          begin
            if Adev.AreaList.ItemsIsOutAllow[i] then
            begin
              Adev.AreaList.ItemsIsOutAllow[i] := false;

              DoOnDevAlarm_OutorInCArea(Adev, ALARM_OUT, false, confArea); //从越界到入界。将列表中原有的推入历史

            end;
          end;
        end;
      ALARM_IN: //驶入报警 判断
        begin
          if GeometryCalc.PointInPolygon(p, confArea.WorldPointAry, 0, confArea.PointCount) then
          begin
            if not Adev.AreaList.ItemsIsOutAllow[i] then //没有驶入 报警 过
            begin
              Adev.AreaList.ItemsIsOutAllow[i] := True;
              Adev.AlarmStart_InCArea := Adev.GpsTime; // now;08-02-21  by dxf 为了在轨迹回放的时候也可以实现区域报警
              Adev.AlarmEnd_InCArea := Adev.GpsTime;   // now;08-02-21  by dxf 为了在轨迹回放的时候也可以实现区域报警

              DoOnDevAlarm_OutorInCArea(Adev, ALARM_IN, True, confArea); //驶入报警

            end
            else
              Adev.AlarmEnd_InCArea := Adev.GpsTime; // now;08-02-21  by dxf 为了在轨迹回放的时候也可以实现区域报警
            if (confArea.IsShowPop) then
            begin
              Title := '驶入报警';
              Msg := Adev.Car.No + #13 + #10 + '驶入' + confArea.Name;
              ShowPopMsg;
              //ShowPopMsg('驶入报警', Adev.Car.No + #13 + #10 + '驶入' + confArea.Name);
            end;
          end
          else
          begin
            if Adev.AreaList.ItemsIsOutAllow[i] then
            begin
              Adev.AreaList.ItemsIsOutAllow[i] := false;

              DoOnDevAlarm_OutorInCArea(Adev, ALARM_IN, false, confArea); //从越界到入界。将列表中原有的推入历史
            end;
          end;
        end;
//      ALARM_OVER_SPEET:
//        begin
//          if Adev.Switch_Warning[MSG_Warning_16] then continue; //如当前有超速,就不判断是否区域超速
//          if GeometryCalc.PointInPolygon(p, confArea.WorldPointAry, 0, confArea.PointCount) then //判断此车的位子是否在此区域内
//          begin
//            if StringToFloat(FormatFloat('##0.0', ADev.Speed/10)) > confArea.OverSpeet then
//            begin
//              Adev.Switch_Warning[MSG_Warning_16] := True; //设置超速报警
//            end;
//          end;
//        end;
//      ALARM_WAY_OUT:
//        begin
//          if not confArea.RunWayRectList.PointInRectList(p) then
//          begin
//            if not Adev.AreaList.ItemsIsOutAllow[i] then //没有越界 报警 过
//            begin
//              Adev.AreaList.ItemsIsOutAllow[i] := True;
//              Adev.AlarmStart_OutCArea := now;
//              Adev.AlarmEnd_OutCArea := now;
//
//              DoOnDevAlarm_OutorInCArea(Adev, ALARM_WAY_OUT, True, confArea); //越界
//            end
//            else
//            begin
//              Adev.AlarmEnd_OutCArea := now;
//            end;
//            if (confArea.IsShowPop) then
//            begin
//              Title := '驶出线路报警';
//              Msg := Adev.Car.No + #13 + #10 + '驶出' + confArea.Name;
//              ShowPopMsg;
//              //ShowPopMsg('驶出线路报警', Adev.Car.No + #13 + #10 + '驶出' + confArea.Name);
//            end;
//          end
//          else
//          begin
//            if Adev.AreaList.ItemsIsOutAllow[i] then
//            begin
//              ADev.FFirstOutPoint.X := 0;
//              Adev.AreaList.ItemsIsOutAllow[i] := false;
//
//              DoOnDevAlarm_OutorInCArea(Adev, ALARM_WAY_OUT, false, confArea); //从越界到入界。将列表中原有的推入历史
//            end;
//          end;
//        end;
//      ALARM_WAY_IN:
//        begin
//          if confArea.RunWayRectList.PointInRectList(p) then
//          begin
//            if not Adev.AreaList.ItemsIsOutAllow[i] then //没有驶入 报警 过
//            begin
//              Adev.AreaList.ItemsIsOutAllow[i] := True;
//              if ADev.FirstOutPoint.X = 0 then
//              begin
//                ADev.FirstOutPoint := p;
//                Adev.AlarmStart_InCArea := now;
//              end
//              else
//              begin
//                pp := Project.XY2LoLa(ADev.FirstOutPoint);
//                if (GisMeasure.GetGisDistance(pp, EarthPoint(Adev.Longitude, Adev.Latitude)) > 150) or
//                  (SecondsBetween(Adev.AlarmStart_InCArea, now) > 15) then
//                begin
//                  Adev.Alarm_WayInCArea := True;
//                  Adev.AlarmStart_InCArea := now;
//                  Adev.AlarmEnd_InCArea := now;
//
//                  DoOnDevAlarm_OutorInCArea(Adev, ALARM_WAY_IN, True, confArea); //驶入报警
//                end
//              end
//            end
//            else
//              Adev.AlarmEnd_InCArea := now;
//              if (confArea.IsShowPop) then
//              begin
//                Title := '驶入线路报警';
//                Msg := Adev.Car.No + #13 + #10 + '驶入' + confArea.Name;
//                ShowPopMsg;
//                //ShowPopMsg('驶入线路报警', Adev.Car.No + #13 + #10 + '驶入' + confArea.Name);
//              end;
//          end
//          else
//          begin
//            if Adev.AreaList.ItemsIsOutAllow[i] then
//            begin
//              Adev.AreaList.ItemsIsOutAllow[i] := false;
//              ADev.FFirstOutPoint.X := 0;
//
//              DoOnDevAlarm_OutorInCArea(Adev, ALARM_WAY_IN, false, confArea); //从越界到入界。将列表中原有的推入历史
//            end;
//          end;
//        end;
    end; //case end
  end;
//  ADeviceManage.JudgeDevOutOrInCArea(ADev); //是否越界或驶入报警区域　判断
end;

procedure TDisposeCar.JudgeAssembleWarring;
var
  i,j,k: Integer;
  p: TWorldPoint;
  confArea: TConfineArea;
  LogA: TSystemLog; //
  Dev: TDevice;
  Str: string;
  index: Integer;
begin
  try
    for i:=0 to GAreaManage.Count-1 do
    begin
      confArea := GAreaManage.Items[i];
      if confArea.AreaType = ASSEMBLE_WARRING{5} then
      begin
        p := ADev.Point;
        if GeometryCalc.PointInPolygon(p, confArea.WorldPointAry, 0, confArea.PointCount) then
        begin

          if confArea.DevList.Count = 0 then
            confArea.DevList.Add(Adev.id)
          else
          begin
            if confArea.DevList.IndexOf(Adev.id) < 0 then
              confArea.DevList.Add(Adev.id);

          end;

          if confArea.DevList.Count > confArea.OverSpeet then
          begin
            if not confArea.IsOutAllow then
            begin
              if GlobalParam.MenuSound <> '' then
              begin
                PalySound(GlobalParam.MenuSound);
              end;
              confArea.IsOutAllow := True;

              DoOnDevAlarm_OutorInCArea(Adev, ASSEMBLE_WARRING, True, confArea); //聚集报警

              if confArea.IsShowPop then
              begin
                Title := '聚集报警';
                Msg := confArea.Name + '车辆数量现为' + IntToStr(confArea.DevList.Count) + '辆' + #13#10 +'多于限定数量' + IntToStr(confArea.OverSpeet) + '辆';
                ShowPopMsg;
                //ShowPopMsg('聚集报警', confArea.Name + '车辆数量现为' + IntToStr(confArea.DevList.Count) + '辆' + #13#10 +'多于限定数量' + IntToStr(confArea.OverSpeet) + '辆');
              end;
            end;

  //          LogA := TSystemLog.Create;
  //          try
  //            LogA.LogFile := ExePath + 'Alarm\聚集报警';
  //            LogA.ExtendName := 'csv';
  //            LogA.BufferSize := 0;
  //            LogA.BeginString:='时间,车牌号,GPS时间,经度,纬度,速度';
  //            for k := 0 to confArea.DevList.Count - 1 do
  //            begin
  //              Dev := ADeviceManage.Find(confArea.DevList[k]);
  //              LogA.AddLog(FormatDatetime('yyyy-mm-dd hh:nn:ss',now)+','+
  //                        Dev.Car.No+','+
  //                        FormatDateTime('yyyy-mm-dd hh:nn:ss',Dev.GpsTime)+','+
  //                        FormatFloat('0.000000',Dev.Longitude)+ ','+
  //                        FormatFloat('0.000000',Dev.Latitude)+','+
  //                        FormatFloat('##0.0', Dev.Speed/10)); {FormatFloat('0.0',Dev.Speed)); //ls}
  //            end;
  //          finally
  //            LogA.Free
  //          end;
          end
          else
          begin
            if confArea.IsOutAllow then
              confArea.IsOutAllow := False;
            {if confArea.DevList.Count = 0 then
            begin
              if Assigned(FOnDevAlarm_OutorInCArea) then
                FOnDevAlarm_OutorInCArea(Adev, ASSEMBLE_WARRING, False, confArea); //聚集报警
            end;   }
          end;
        end else
        begin
          index := confArea.DevList.IndexOf(Adev.id);
          if index >= 0 then
            confArea.DevList.Delete(index);
        end;
      end;
    end;
  except
  end;
  //ADeviceManage.JudgeAssembleWarring(ADev);  // 聚集报警
end;

procedure TDisposeCar.JudgeAntiFake_Warring;
var
  i,j,k: Integer;
  p: TWorldPoint;
  confArea: TConfineArea;
  LogA: TSystemLog; //
  Dev: TDevice;
  Str: string;
begin
  for i:=0 to GAreaManage.Count-1 do
  begin
    confArea := GAreaManage.Items[i];
    if confArea.AreaType = ANTIFAKE_WARRING then
    begin
      p := ADev.Point;
      if GeometryCalc.PointInPolygon(p, confArea.WorldPointAry, 0, confArea.PointCount) then    // 在防伪范围区域内
      begin
        if confArea.DevList.Count = 0 then
        begin
          confArea.DevList.Add(Adev.id);
          if confArea.AntiFakeType = 0 then
          begin
            DataServer.SendAntiFake_V3(Adev, confArea.AntiFakeText, 0);
          end
          else
          begin
            if FileExists(confArea.AntiFakePicFilePath) then
            begin
              Image.Picture.LoadFromFile(confArea.AntiFakePicFilePath);
              DataServer.SendAntiFake_V3_new(Adev, Image.Picture.Bitmap, 0);
            end;
          end;
        end
        else
        begin
          if confArea.DevList.IndexOf(Adev.id) < 0 then
          begin
            confArea.DevList.Add(Adev.id);
            if confArea.AntiFakeType = 0 then
            begin
              DataServer.SendAntiFake_V3(Adev, confArea.AntiFakeText, 0);
            end
            else
            begin
              if FileExists(confArea.AntiFakePicFilePath) then
              begin
                Image.Picture.LoadFromFile(confArea.AntiFakePicFilePath);
                DataServer.SendAntiFake_V3_new(Adev, Image.Picture.Bitmap, 0);
              end;
            end;
          end;
        end;
      end
      else
      begin
        if confArea.DevList.IndexOf(Adev.id) >= 0 then
        begin
          confArea.DevList.Delete(confArea.DevList.IndexOf(Adev.id));
          DataServer.SendStopAntiFake_V3(Adev);
        end;
        {for j:= 0 to confArea.DevList.Count -1 do
        begin
          if ADeviceManage.Find(confArea.DevList[j]).id = Adev.id then
          begin
            confArea.DevList.Delete(j);
            DataServer.SendStopAntiFake_V3(Adev);
          end;
        end;  }
      end;
    end;
  end;
//  ADeviceManage.JudgeAntiFake_Warring(ADev); // 打击克隆车(自动下发防伪密标)报警
end;

procedure TDisposeCar.JudgeSuspectedPetitions_Warring;
var
  i,j,k: Integer;
  p: TWorldPoint;
  confArea: TConfineArea;
  LogA: TSystemLog; //
  Dev: TDevice;
  Str: string;
begin
  for i:=0 to GAreaManage.Count-1 do
  begin
    confArea := GAreaManage.Items[i];
    if confArea.AreaType = SUSPECTEDPETITIONS_WARRING then
    begin
      p := ADev.Point;
      if GeometryCalc.PointInPolygon(p, confArea.WorldPointAry, 0, confArea.PointCount) then
      begin
//        if (Adev.Speed <= confArea.MinSpeed) and (Adev.SuspectedPetitions = False) then
//        begin
//          Adev.OnMinSpeedTime := Now; // 进入最低速度的时间
//          Adev.SuspectedPetitions := True;
//        end;

        if Adev.Speed > confArea.MinSpeed then
        begin
          Adev.OnMinSpeedTime := Now;
//          Adev.SuspectedPetitions := False;
          if confArea.DevList.IndexOf(Adev.id) >= 0 then
          begin
            confArea.DevList.Delete(confArea.DevList.IndexOf(Adev.id));
          end;
        end;

//        if (Adev.SuspectedPetitions) and (IncMinute(Adev.OnMinSpeedTime, confArea.MaintainTime) > Now) then
//        begin
//          if confArea.DevList.IndexOf(Adev.id) < 0 then
//            confArea.DevList.Add(Adev.id);
//        end;
      end
      else
      begin
        if confArea.DevList.IndexOf(Adev.id) >= 0 then
        begin
          confArea.DevList.Delete(confArea.DevList.IndexOf(Adev.id));
        end;
      end;

      if confArea.DevList.Count > confArea.OverSpeet then
      begin
        if not confArea.IsOutAllow then
        begin
          confArea.IsOutAllow := True;

          DoOnDevAlarm_OutorInCArea(Adev, SUSPECTEDPETITIONS_WARRING, True, confArea); //疑似上访报警

          if confArea.IsShowPop then
          begin
            Title := '疑似上访报警';
            Msg := confArea.Name + '车辆数量现为' + IntToStr(confArea.DevList.Count) + '辆' + #13#10 +'多于限定数量' + IntToStr(confArea.OverSpeet) + '辆';
            ShowPopMsg;
            //ShowPopMsg('疑似上访报警', confArea.Name + '车辆数量现为' + IntToStr(confArea.DevList.Count) + '辆' + #13#10 +'多于限定数量' + IntToStr(confArea.OverSpeet) + '辆');
          end;
        end;

        {LogA := TSystemLog.Create;
        try
          LogA.LogFile := ExePath + 'Alarm\疑似上访报警';
          LogA.ExtendName := 'csv';
          LogA.BufferSize := 0;
          LogA.BeginString:='时间,车牌号,GPS时间,经度,纬度,速度';
          for k := 0 to confArea.DevList.Count - 1 do
          begin
            Dev := ADeviceManage.Find(confArea.DevList[k]);
            LogA.AddLog(FormatDatetime('yyyy-mm-dd hh:nn:ss',now)+','+
                      Dev.Car.No+','+
                      FormatDateTime('yyyy-mm-dd hh:nn:ss',Dev.GpsTime)+','+
                      FormatFloat('0.000000',Dev.Longitude)+ ','+
                      FormatFloat('0.000000',Dev.Latitude)+','+
                      FormatFloat('##0.0', Dev.Speed/10)); //FormatFloat('0.0',Dev.Speed)); //ls
          end;
        finally
          LogA.Free
        end;   }
      end
      else
      begin
        if confArea.IsOutAllow then
          confArea.IsOutAllow := False;
      end;
    end;
  end;
//  ADeviceManage.JudgeSuspectedPetitions_Warring(ADev);  // 疑似上访报警
end;

procedure TDisposeCar.OnDevOtherAlarmEvent;
begin
  if Assigned(ADeviceManage.OnDevOtherAlarmEvent) then  //除紧急报警外的 各类报警 处理
  begin
    if ADev.Switch_Warning[MSG_Warning_16] then  //第16位	超速报警
    begin
      ADeviceManage.OnDevOtherAlarmEvent(ADev,MSG_Warning_16);
    end;

    if ADev.Switch_Warning[MSG_Warning_17] then //第17位	疲劳驾驶报警
      ADeviceManage.OnDevOtherAlarmEvent(ADev,MSG_Warning_17);

    if ADev.Switch_Warning[MSG_Warning_18] then //第18位	累计驾驶超时报警
      ADeviceManage.OnDevOtherAlarmEvent(ADev,MSG_Warning_18);

    if ADev.Switch_Warning[MSG_Warning_19] then //第19位	停车超时报警
      ADeviceManage.OnDevOtherAlarmEvent(ADev,MSG_Warning_19);
  end;     
end;

procedure TDisposeCar.OnSendMsg;
var
  j: Integer;
begin
  if Assigned(ADeviceManage.OnSendMsg) then
  begin
    for j:=0 to 31 do
    begin
      if ADev.Switch_Warning[j] then
      begin
        try
          ADeviceManage.OnSendMsg(ADev.IdStr, j, '');
        except
        end;
      end;
    end;
  end;   
end;

procedure TDisposeCar.JudgeDevOutToTownTime;
var
  confArea: TConfineArea;
  p: TWorldPoint;
  pp: TEarthPoint;
  i,j: integer;
  time: double;
  LogA: TSystemLog; //
  dev: TDevice;
begin
  if Adev.AreaList.Count <= 0 then exit;

  p := ADev.Point;

  for i := 0 to Adev.AreaList.Count - 1 do
  begin
    confArea := TConfineArea(Adev.AreaList.Items[i]);

    if confArea.AreaType = OUT_TOWN then
    begin
      //判断是否在有效时间之间内.
      if confArea.IsEnabledTime then
      begin
        time := Adev.GpsTime - trunc(Adev.GpsTime);
           //开始是时大于结束时间.
        if confArea.BeginTime > confArea.EndTime then
        begin
          if not ((time > confArea.BeginTime) or (time < confArea.EndTime)) then
            continue;
        end
        else
        begin
          if not ((time > confArea.BeginTime) and (time < confArea.EndTime)) then
            continue;
        end;
      end;

      if not GeometryCalc.PointInPolygon(p, confArea.WorldPointAry, 0, confArea.PointCount) then
      begin
        if not Adev.AreaList.ItemsIsOutAllow[i] then //没有出城 报警 过
        begin
          Adev.AreaList.ItemsIsOutAllow[i] := True;
          Adev.OutToTownTime := Adev.GpsTime;
          Adev.OutToTown := True;

          DoOnDevAlarm_OutorInCArea(Adev, OUT_TOWN, True, confArea); //出城

          if (ADev.Alarm_OutCAreaIsShowPop) and (confArea.IsShowPop) then
          begin
            Title := '出城留台';
            Msg := Adev.Car.No + #13 + #10 + '驶出' + confArea.Name;
            ShowPopMsg;
            //ShowPopMsg('出城留台', Adev.Car.No + #13 + #10 + '驶出' + confArea.Name);
          end;
        end;
      end else
      begin
        if Adev.AreaList.ItemsIsOutAllow[i] then
        begin
          Adev.AreaList.ItemsIsOutAllow[i] := false;
        end;
        if Adev.OutToTown then
        begin
          Adev.OutToTown := False;
          Adev.GoToTown := Adev.GpsTime;
          DoOnDevAlarm_OutorInCArea(Adev, OUT_TOWN, False, confArea); //进城,放到出城历史记录中
        end;
      end;

      for j:= 0 to confArea.DevList.Count -1 do
      begin
        dev := ADeviceManage.Find(confArea.DevList[j]);
        if (IncMinute(dev.OutToTownTime, confArea.OverSpeet) < Now) and (dev.OutToTown) then
        begin
          DoOnDevAlarm_OutorInCArea(Adev, OUT_TOWN_ERROR, True, confArea); //出城超时报警报警，改变颜色

          if dev.OutToTownAlarm then
          begin
            Title := '出城报警';
            Msg := '车辆' + dev.Car.No + '出城超出预警时间';
            ShowPopMsg;
            //ShowPopMsg('出城报警', '车辆' + dev.Car.No + '出城超出预警时间');
          end;
          {LogA := TSystemLog.Create;
          try
            LogA.LogFile := ExePath + 'Alarm\出城报警';
            LogA.ExtendName := 'csv';
            LogA.BufferSize := 0;
            LogA.BeginString:='时间,车牌号,出城时间,进城时间,GPS时间,经度,纬度,速度';

            LogA.AddLog(FormatDatetime('yyyy-mm-dd hh:nn:ss',now)+','+
                      Dev.Car.No+','+ FormatDateTime('yyyy-mm-dd hh:nn:ss',Dev.OutToTownTime)+','+
                      FormatDateTime('yyyy-mm-dd hh:nn:ss',Dev.GoToTown)+','+
                      FormatDateTime('yyyy-mm-dd hh:nn:ss',Dev.GpsTime)+','+
                      FormatFloat('0.000000',Dev.Longitude)+ ','+
                      FormatFloat('0.000000',Dev.Latitude)+','+
                      FormatFloat('0.0',Dev.Speed));

          finally
            LogA.Free
          end;    }
        end;
      end;

    end;
    Break;
  end;

  if confArea <> nil then
  begin

  end;
  //ADeviceManage.JudgeDevOutToTownTime(ADev); // 出城报警
end;

procedure TDisposeCar.DoOnDevAlarm_OutorInCArea(ADev: Tdevice;
  AlarmType: Byte; AddorDel: boolean; AArea: TConfineArea);
begin
  try
    //FLock.Enter;
    if Assigned(ADeviceManage.OnDevAlarm_OutorInCArea) then
      ADeviceManage.OnDevAlarm_OutorInCArea(Adev, AlarmType, AddorDel, AArea); //越界
  finally
    //FLock.Leave;
  end;
end;

procedure TDisposeCar.PalySound(FilePath: string);
begin
  try
    //FLock.Enter;
    MediaPalySound(FilePath);
  finally
    //FLock.Leave;
  end;
end;

procedure TDisposeCar.ShowPopMsg;
begin
  try
    PopMsg(Title, Msg);
  except
  end;
end;

procedure TDisposeCar.FTimerTimer(Sender: TObject);
var
  d: TDateTime;
  s: Int64;
  disposeCarCount: Integer;
begin
  try
    FTimer.Enabled := False;
    d := Now;
    disposeCarCount := DisposeCar;
    s := MilliSecondsBetween(d, Now);
    if s > 1000 then
      AddLog('DisposeCar spend ' + IntToStr(s) + 'ms, disposeCarCount:' + IntToStr(disposeCarCount));
  finally
    FTimer.Enabled := True;
  end;
end;

procedure TDisposeCar.StopDispose;
begin
  IsStop := True;
end;

procedure TDisposeCar.PlayAlarmSoundIfAlarm;
var
  i: Integer;
  isShowPopMsg: Boolean;
begin
  for i := 0 to 31 do
  begin
    if i in [12..17, 30, 31] then continue;
    isShowPopMsg := False;
    if ADev.Switch_Warning[i] then
    begin
      if (i = 0) then
      begin
        if GlobalParam.isalarmHurry then
          isShowPopMsg := True;
      end
      else if (i = 1) then
      begin
        if GlobalParam.IsOverSpeedAlarm then
          isShowPopMsg := True;
      end
      else if (i = 2) then
      begin
        if GlobalParam.isAlarmDriverFatigue then
          isShowPopMsg := True;
      end
      else if (i = 8) then
      begin
        if GlobalParam.isEletrShutDownAlarm then
          isShowPopMsg := True;
      end
      else if (i = 20) then
      begin
        if GlobalParam.isAlarmInDevArea then
          isShowPopMsg := True;
      end
      else if (i = 21) then
      begin
        if GlobalParam.isAlarmInDevArea then
          isShowPopMsg := True;
      end
      else
      begin
        if GlobalParam.IsDevOtherAlarm then
          isShowPopMsg := True;
      end;
      if isShowPopMsg then
        PopMsg('报警提示', ADev.Car.No + '可能发生' + #13#10 + GetGpsDataAlarmTypeName(i));
    end;  
  end;  
  //紧急报警
  if ADev.Switch_Warning[0] and (GlobalParam.DevAlarmSound <> '') then
  begin
    PlaySound(pchar(GlobalParam.DevAlarmSound),Hinstance,SND_ASYNC);
    //MediaPalySound(GlobalParam.DevAlarmSound);
  end;

  //超速报警
  if ADev.Switch_Warning[1] and (GlobalParam.AlarmSound_OverSpeet <> '') then
  begin
    PlaySound(pchar(GlobalParam.AlarmSound_OverSpeet),Hinstance,SND_ASYNC);
//    MediaPalySound(GlobalParam.AlarmSound_OverSpeet);
  end;

  //疲劳驾驶报警
  if ADev.Switch_Warning[2] and (GlobalParam.AlarmSound_Fatigue <> '') then
  begin
//    MediaPalySound(GlobalParam.AlarmSound_Fatigue);
    //PlaySound(pchar(GlobalParam.AlarmSound_Fatigue),Hinstance,SND_ASYNC);
  end;

  //设备故障报警(GNSS模块、天线、终端LCD、TTS模块、摄像头、车辆VSS)
  if (ADev.Switch_Warning[4] or ADev.Switch_Warning[5] or ADev.Switch_Warning[6]
      or ADev.Switch_Warning[9] or ADev.Switch_Warning[10] or ADev.Switch_Warning[11]
      or ADev.Switch_Warning[24]) and (GlobalParam.AlarmSound_DevFault <> '') then
  begin
//    MediaPalySound(GlobalParam.AlarmSound_DevFault);
    PlaySound(pchar(GlobalParam.AlarmSound_DevFault),Hinstance,SND_ASYNC);
  end;

  //欠压报警
  if ADev.Switch_Warning[7] and (GlobalParam.AlarmSound_Undervoltage <> '') then
  begin
//    MediaPalySound(GlobalParam.AlarmSound_Undervoltage);
    PlaySound(pchar(GlobalParam.AlarmSound_Undervoltage),Hinstance,SND_ASYNC);
  end;

  //断电报警
  if ADev.Switch_Warning[8] and (GlobalParam.AlarmSound_PowerDown <> '') then
  begin
//    MediaPalySound(GlobalParam.AlarmSound_PowerDown);
    PlaySound(pchar(GlobalParam.AlarmSound_PowerDown),Hinstance,SND_ASYNC);
  end;

  //超时停车报警
  if ADev.Switch_Warning[19] and (GlobalParam.AlarmSound_TimeoutStop <> '') then
  begin
//    MediaPalySound(GlobalParam.AlarmSound_TimeoutStop);
    PlaySound(pchar(GlobalParam.AlarmSound_TimeoutStop),Hinstance,SND_ASYNC);
  end;

  //进出区域/路线报警
  if (ADev.Switch_Warning[20] or ADev.Switch_Warning[21] or ADev.Switch_Warning[22]) and (GlobalParam.AlarmSound_InCArea <> '') then
  begin
//    MediaPalySound(GlobalParam.AlarmSound_InCArea);
    PlaySound(pchar(GlobalParam.AlarmSound_InCArea),Hinstance,SND_ASYNC);
  end;

  //偏离路线报警
  if ADev.Switch_Warning[23] and (GlobalParam.AlarmSound_Deviate <> '') then
  begin
//    MediaPalySound(GlobalParam.AlarmSound_Deviate);
    PlaySound(pchar(GlobalParam.AlarmSound_Deviate),Hinstance,SND_ASYNC);
  end;
end;

procedure TDisposeCar.JudgeDevAccOffMoveAlarm;
begin
  if not ADev.Switch[0] then//ACC 熄火后记录熄火时的
  begin
    if not ADev.IsAccOff then
    begin
      ADev.PointWhenAccOff := ADev.Point;
      ADev.IsAccOff := True;
    end
    else
    begin
      if (ADev.TerminalTypeId <> 2) and not GeometryCalc.PointInRound(ADev.PointWhenAccOff, ADev.Point, GlobalParam.AccOffAlarmDis)  then
      begin
        if Assigned(ADeviceManage.OnCarAccOffMoveAlarmEvent) then
          ADeviceManage.OnCarAccOffMoveAlarmEvent(ADev, ADev.GpsTime, ADev.Car.No + '发生非法移动报警');
        if GlobalParam.IsDevOtherAlarm then
          PopMsg('车辆非法移动报警', ADev.Car.No + '发生非法移动报警');
      end;  
    end;
  end
  else
  begin
    ADev.IsAccOff := False;
  end;
end;


procedure TDisposeCar.JudgeIOAreaOnTimeAlarm;
var
  confArea: TConfineArea;
  p: TWorldPoint;
  pp: TEarthPoint;
  i: integer;
  time: double;
  dt: TDateTime;
  msg: string;
begin

  if Adev.AreaList.Count <= 0 then exit;

  p := ADev.Point;
  for i := 0 to Adev.AreaList.Count - 1 do
  begin
    confArea := TConfineArea(Adev.AreaList.Items[i]);
    //判断是否在有效时间之间内.
    if confArea.IsEnabledTime then
    begin
      time := Adev.GpsTime - trunc(Adev.GpsTime);
      //开始是时大于结束时间.
      if confArea.BeginTime > confArea.EndTime then
      begin
        if not ((time > confArea.BeginTime) or (time < confArea.EndTime)) then
          continue;
      end
      else
      begin
        if not ((time > confArea.BeginTime) and (time < confArea.EndTime)) then
          continue;
      end;
    end;

    case confArea.AreaType of
      Alarm_LINEKEYPOINT:
        begin//如果同一个车机设在两个区域中，且两个区域的时间差在30分钟内会出现bug，暂时先不考虑
          dt := Now;
          if (dt < IncMinute(confArea.ArriveDateTime, -30)) or (IncMinute(confArea.LeaveDateTime, 30) < dt) then
          begin
            ADev.IsAlarmedInAreaOnTime := False;
            adev.IsAlarmedOutAreaOnTime := False;
            ADev.IsInAreaOnTime := False;
            ADev.IsOutAreaOnTime := False;

            if IncMinute(confArea.LeaveDateTime, 30) < dt then
              ADev.AreaList.Remove(confArea);//如果过了指定时间30分钟后，就将该区域从车机对象中删除，为后面的

            Continue;//指定到达时间前30分钟才开始检测 指定离开时间30分钟之后结束检测
          end;

          if not ADev.IsInAreaOnTime then
          begin//未按时到达且还未报警
            if confArea.ArriveDateTime >= dt then
            begin//提前到了
              if GeometryCalc.PointInPolygon(ADev.Point, confArea.WorldPointAry, 0, confArea.PointCount) then
                ADev.IsInAreaOnTime := True;
            end
            else//推迟到了，
            begin
              if not ADev.IsAlarmedInAreaOnTime then
              begin
                if GeometryCalc.PointInPolygon(ADev.Point, confArea.WorldPointAry, 0, confArea.PointCount) then
                  ADev.IsInAreaOnTime := True;//算是到过了，后面才会继续判断是否按时离开

                msg := ADev.Car.No + '未在指定时间' + #13#10 + FormatDateTime('yyyy-MM-dd hh:nn:ss', confArea.ArriveDateTime) + #13#10 + '到达' + confArea.Name;
                PopMsg('指定时间未到达报警', msg);
                ADev.IsAlarmedInAreaOnTime := True;
                if Assigned(ADeviceManage.OnCarIOAreaOnTimeAlarmEvent) then
                  ADeviceManage.OnCarIOAreaOnTimeAlarmEvent(ADev, 0, dt, '未在指定时间' + FormatDateTime('yyyy-MM-dd hh:nn:ss', confArea.ArriveDateTime) + '到达' + confArea.Name);
              end;

              if (dt > confArea.LeaveDateTime) and not ADev.IsAlarmedOutAreaOnTime then
              begin//推迟离开
                msg := ADev.Car.No + '未在指定时间' + #13#10 + FormatDateTime('yyyy-MM-dd hh:nn:ss', confArea.LeaveDateTime) + #13#10 + '离开' + confArea.Name;
                PopMsg('指定时间未离开报警', msg);
                ADev.IsAlarmedOutAreaOnTime := True;
                if Assigned(ADeviceManage.OnCarIOAreaOnTimeAlarmEvent) then
                  ADeviceManage.OnCarIOAreaOnTimeAlarmEvent(ADev, 1, dt, '未在指定时间' + FormatDateTime('yyyy-MM-dd hh:nn:ss', confArea.LeaveDateTime) + '离开' + confArea.Name);
              end;
            end;
          end
          else
          begin
            if not ADev.IsOutAreaOnTime and not ADev.IsAlarmedOutAreaOnTime then
            begin
              if confArea.LeaveDateTime <= dt then
              begin//提前到了
                if GeometryCalc.PointInPolygon(ADev.Point, confArea.WorldPointAry, 0, confArea.PointCount) then
                  ADev.IsInAreaOnTime := True;
              end
              else//推迟到了，
              begin
                msg := ADev.Car.No + '未在指定时间' + #13#10 + FormatDateTime('yyyy-MM-dd hh:nn:ss', confArea.ArriveDateTime) + #13#10 + '离开' + confArea.Name;
                PopMsg('指定时间未离开报警', msg);
                ADev.IsAlarmedOutAreaOnTime := True;
                if Assigned(ADeviceManage.OnCarIOAreaOnTimeAlarmEvent) then
                  ADeviceManage.OnCarIOAreaOnTimeAlarmEvent(ADev, 1, dt, '未在指定时间' + FormatDateTime('yyyy-MM-dd hh:nn:ss', confArea.LeaveDateTime) + '离开' + confArea.Name);
              end;
            end;
          end;
        end;
    end;
  end;
end;

procedure TDisposeCar.DealGpsDataWarningSign(dev: TDevice);
var
  i: Integer;
begin
  for i := 0 to 31 do
  begin
    if dev.Switch_Warning[i] then
    begin
      //现在的模拟器中这几种报警后面都没有附加信息报警说明，暂时注释 2011-11-17
      //if i in[1, 12..17, 20..22, 30, 31] then Continue;//超速报警、进出区域、进出路线、路段行驶不足/过长报警在后面的附加信息会有提示，此处不处理

      //如果是连续的报警则不记录后续的报警信息，只提示还在报警
      if not dev.Switch_Warning_C[i] then
      begin
        dev.Switch_Warning_C[i] := True;
        if Assigned(ADeviceManage.OnGpsDataAlarmEvent) then
          ADeviceManage.OnGpsDataAlarmEvent(dev, i);
      end;
    end
    else
    begin
      dev.Switch_Warning_C[i] := False;
    end;
  end;
end;

procedure TDisposeCar.StartDispose;
begin
  FTimer.Enabled := True;
end;

procedure TDisposeCar.AddLog(log: string);
begin
  uGloabVar.SystemLog.AddLog(FormatDateTime('hh:nn:ss.zzz', Now) + ' ' + log);
end;

end.
