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
    procedure JudgeDevAccOffMoveAlarm;//�ж�����Accoff���ƶ���Χ����600���򱨾�
    procedure JudgeIOAreaOnTimeAlarm;
    procedure JudgeDevOutOrInCArea;
    procedure JudgeAssembleWarring;
    procedure JudgeDevOutToTownTime;
    procedure JudgeAntiFake_Warring;
    procedure JudgeSuspectedPetitions_Warring;
    procedure OnDevOtherAlarmEvent;
    procedure OnSendMsg;

    procedure DoOnDevEmergncyAlarm;     // ��������
    procedure DoOnEarlyWarningEvent(b: Boolean; EarlyWarningCar: TEarlyWarningCar);    // ����Ԥ��
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

//  DisposeDevEmergncyAlarm;                         // ��������

//  DisposeDevEarlyAlarm;                            // Ԥ��

  if ADev.IsSendCancelEmgcyAlarm and not ADev.Switch_Warning[0] then
  begin
    PopMsg('�����������', ADev.Car.No + #13#10 + '������������ɹ�');
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

  PlayAlarmSoundIfAlarm;//�Ƕ�λ������½�������Ҳ�账��

  if not Adev.Switch[STAT_GPS_LOCATE] then             // ����Ƕ�λ���Ͳ��ж����±���
  begin
    exit;
  end;

  JudgeDevAccOffMoveAlarm;
  JudgeDevOutOrInCArea;               //�Ƿ�Խ���ʻ�뱨�������ж�
//  JudgeAssembleWarring;               // �ۼ�����
//  JudgeDevOutToTownTime;              // ���Ǳ���
//  JudgeAntiFake_Warring;              // �����¡��(�Զ��·���α�ܱ�)����
//  JudgeSuspectedPetitions_Warring;    // �����Ϸñ���
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

        JudgeIOAreaOnTimeAlarm;//����������ʱҲҪ�ж�
      
        if not ADev.IsNewGpsData then Continue;  // ����������µ�GPS���ݣ��Ͳ�����
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
    if (ADev.Switch_Warning[MSG_Warning_0]) then //���� �ж� ������������Ҫ���Ļ��룩
    begin
      if (not ADev.Alarm) then //��ͷ�ĵ�0λ=true,��ԭδ������ԭ�����ѽ��
      begin
        //if IsLastGpsData then  //��������������ת���� ���һ�㶨λ����
        //  m.alarm_startTime := m.GpsTime
        //else
          ADev.alarm_startTime := ADev.GpsTime; //now;
        ADev.Alarm_endTime := 0;
        ADev.AlarmCount := ADev.AlarmCount + 1;
        ADev.Alarm := True; //�� ������־
        ADev.AlarmCount := 1; //Ŀ�����ӱ�����������һ��
        //if Assigned(ADeviceManage.OnDevEmergncyAlarmEvent) then
        //  ADeviceManage.OnDevEmergncyAlarmEvent(ADev);
      end else
      begin
        ADev.AlarmCount := ADev.AlarmCount + 1; //Ŀ�����ӱ������� +1
      end;

      LogA := TSystemLog.Create;
      try
        LogA.LogFile := ExePath + 'Alarm\DriverAlarm';
        LogA.ExtendName := 'csv';
        LogA.BufferSize := 0;
        LogA.AddLog(FormatDatetime('yyyy-mm-dd hh:nn:ss', now) + ',' +
          ADev.Car.No + ',��������:' + IntToStr(ADev.AlarmCount) +
          ',����:' + FormatFloat('##0.000000', ADev.Longitude) +
          ',γ��:' + FormatFloat('##0.000000', ADev.Latitude));
      finally
        LogA.Free
      end;

      Title := '������ʾ';
      Msg := ADev.Car.No + #13 + #10 + '��������!';
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
    if (ADev.Switch_Warning[MSG_Warning_1]) then   // Ԥ������
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
      if j >= 0 then                           // ɾ��Ԥ���������Ѿ����ڵĵ���ǰ״̬����Ԥ���ĳ���
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
  if GlobalParam.IsAlarmFollow then //�Ե�ǰ������������
  begin
    FMap.GpsDrawlayer.AutoFollowDevice := ADev;
    //StatusBar1.Panels.Items[2].Text := '���ٱ���������' + m.Car.No;
  end;

  if ADev.AlarmCount < 6 then //��5��
  begin
    //��������
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
    popmsg('������ʾ', ADev.Car.No + #13 + #10 + '��������!'); //08  6�� ����     //
  end;  }

  if Assigned(ADeviceManage.OnDevEmergncyAlarmEvent) then
    ADeviceManage.OnDevEmergncyAlarmEvent(ADev);
end;

procedure TDisposeCar.DoOnEarlyWarningEvent(b: Boolean; EarlyWarningCar: TEarlyWarningCar);    // ����Ԥ��
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
    //�ж��Ƿ�����Чʱ��֮����.
    if confArea.IsEnabledTime then
    begin
      time := Adev.GpsTime - trunc(Adev.GpsTime);
      //��ʼ��ʱ���ڽ���ʱ��.
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
      ALARM_OUT: //Խ�籨�����ж�
        begin
          if not GeometryCalc.PointInPolygon(p, confArea.WorldPointAry, 0, confArea.PointCount) then
          begin
            if not Adev.AreaList.ItemsIsOutAllow[i] then //û��Խ�� ���� ��
            begin
              Adev.AreaList.ItemsIsOutAllow[i] := True;
              Adev.AlarmStart_OutCArea := Adev.GpsTime;
              Adev.AlarmEnd_OutCArea := Adev.GpsTime;

              DoOnDevAlarm_OutorInCArea(Adev, ALARM_OUT, True, confArea); //Խ��

            end
            else
              Adev.AlarmEnd_OutCArea := Adev.GpsTime;
            if (ADev.Alarm_OutCAreaIsShowPop) and (confArea.IsShowPop) then
            begin
              Title := 'Խ�籨��';
              Msg := Adev.Car.No + #13 + #10 + 'ʻ��' + confArea.Name;
              ShowPopMsg;
              //ShowPopMsg('Խ�籨��', Adev.Car.No + #13 + #10 + 'ʻ��' + confArea.Name);
            end;
          end
          else
          begin
            if Adev.AreaList.ItemsIsOutAllow[i] then
            begin
              Adev.AreaList.ItemsIsOutAllow[i] := false;

              DoOnDevAlarm_OutorInCArea(Adev, ALARM_OUT, false, confArea); //��Խ�絽��硣���б���ԭ�е�������ʷ

            end;
          end;
        end;
      ALARM_IN: //ʻ�뱨�� �ж�
        begin
          if GeometryCalc.PointInPolygon(p, confArea.WorldPointAry, 0, confArea.PointCount) then
          begin
            if not Adev.AreaList.ItemsIsOutAllow[i] then //û��ʻ�� ���� ��
            begin
              Adev.AreaList.ItemsIsOutAllow[i] := True;
              Adev.AlarmStart_InCArea := Adev.GpsTime; // now;08-02-21  by dxf Ϊ���ڹ켣�طŵ�ʱ��Ҳ����ʵ�����򱨾�
              Adev.AlarmEnd_InCArea := Adev.GpsTime;   // now;08-02-21  by dxf Ϊ���ڹ켣�طŵ�ʱ��Ҳ����ʵ�����򱨾�

              DoOnDevAlarm_OutorInCArea(Adev, ALARM_IN, True, confArea); //ʻ�뱨��

            end
            else
              Adev.AlarmEnd_InCArea := Adev.GpsTime; // now;08-02-21  by dxf Ϊ���ڹ켣�طŵ�ʱ��Ҳ����ʵ�����򱨾�
            if (confArea.IsShowPop) then
            begin
              Title := 'ʻ�뱨��';
              Msg := Adev.Car.No + #13 + #10 + 'ʻ��' + confArea.Name;
              ShowPopMsg;
              //ShowPopMsg('ʻ�뱨��', Adev.Car.No + #13 + #10 + 'ʻ��' + confArea.Name);
            end;
          end
          else
          begin
            if Adev.AreaList.ItemsIsOutAllow[i] then
            begin
              Adev.AreaList.ItemsIsOutAllow[i] := false;

              DoOnDevAlarm_OutorInCArea(Adev, ALARM_IN, false, confArea); //��Խ�絽��硣���б���ԭ�е�������ʷ
            end;
          end;
        end;
//      ALARM_OVER_SPEET:
//        begin
//          if Adev.Switch_Warning[MSG_Warning_16] then continue; //�統ǰ�г���,�Ͳ��ж��Ƿ�������
//          if GeometryCalc.PointInPolygon(p, confArea.WorldPointAry, 0, confArea.PointCount) then //�жϴ˳���λ���Ƿ��ڴ�������
//          begin
//            if StringToFloat(FormatFloat('##0.0', ADev.Speed/10)) > confArea.OverSpeet then
//            begin
//              Adev.Switch_Warning[MSG_Warning_16] := True; //���ó��ٱ���
//            end;
//          end;
//        end;
//      ALARM_WAY_OUT:
//        begin
//          if not confArea.RunWayRectList.PointInRectList(p) then
//          begin
//            if not Adev.AreaList.ItemsIsOutAllow[i] then //û��Խ�� ���� ��
//            begin
//              Adev.AreaList.ItemsIsOutAllow[i] := True;
//              Adev.AlarmStart_OutCArea := now;
//              Adev.AlarmEnd_OutCArea := now;
//
//              DoOnDevAlarm_OutorInCArea(Adev, ALARM_WAY_OUT, True, confArea); //Խ��
//            end
//            else
//            begin
//              Adev.AlarmEnd_OutCArea := now;
//            end;
//            if (confArea.IsShowPop) then
//            begin
//              Title := 'ʻ����·����';
//              Msg := Adev.Car.No + #13 + #10 + 'ʻ��' + confArea.Name;
//              ShowPopMsg;
//              //ShowPopMsg('ʻ����·����', Adev.Car.No + #13 + #10 + 'ʻ��' + confArea.Name);
//            end;
//          end
//          else
//          begin
//            if Adev.AreaList.ItemsIsOutAllow[i] then
//            begin
//              ADev.FFirstOutPoint.X := 0;
//              Adev.AreaList.ItemsIsOutAllow[i] := false;
//
//              DoOnDevAlarm_OutorInCArea(Adev, ALARM_WAY_OUT, false, confArea); //��Խ�絽��硣���б���ԭ�е�������ʷ
//            end;
//          end;
//        end;
//      ALARM_WAY_IN:
//        begin
//          if confArea.RunWayRectList.PointInRectList(p) then
//          begin
//            if not Adev.AreaList.ItemsIsOutAllow[i] then //û��ʻ�� ���� ��
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
//                  DoOnDevAlarm_OutorInCArea(Adev, ALARM_WAY_IN, True, confArea); //ʻ�뱨��
//                end
//              end
//            end
//            else
//              Adev.AlarmEnd_InCArea := now;
//              if (confArea.IsShowPop) then
//              begin
//                Title := 'ʻ����·����';
//                Msg := Adev.Car.No + #13 + #10 + 'ʻ��' + confArea.Name;
//                ShowPopMsg;
//                //ShowPopMsg('ʻ����·����', Adev.Car.No + #13 + #10 + 'ʻ��' + confArea.Name);
//              end;
//          end
//          else
//          begin
//            if Adev.AreaList.ItemsIsOutAllow[i] then
//            begin
//              Adev.AreaList.ItemsIsOutAllow[i] := false;
//              ADev.FFirstOutPoint.X := 0;
//
//              DoOnDevAlarm_OutorInCArea(Adev, ALARM_WAY_IN, false, confArea); //��Խ�絽��硣���б���ԭ�е�������ʷ
//            end;
//          end;
//        end;
    end; //case end
  end;
//  ADeviceManage.JudgeDevOutOrInCArea(ADev); //�Ƿ�Խ���ʻ�뱨�������ж�
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

              DoOnDevAlarm_OutorInCArea(Adev, ASSEMBLE_WARRING, True, confArea); //�ۼ�����

              if confArea.IsShowPop then
              begin
                Title := '�ۼ�����';
                Msg := confArea.Name + '����������Ϊ' + IntToStr(confArea.DevList.Count) + '��' + #13#10 +'�����޶�����' + IntToStr(confArea.OverSpeet) + '��';
                ShowPopMsg;
                //ShowPopMsg('�ۼ�����', confArea.Name + '����������Ϊ' + IntToStr(confArea.DevList.Count) + '��' + #13#10 +'�����޶�����' + IntToStr(confArea.OverSpeet) + '��');
              end;
            end;

  //          LogA := TSystemLog.Create;
  //          try
  //            LogA.LogFile := ExePath + 'Alarm\�ۼ�����';
  //            LogA.ExtendName := 'csv';
  //            LogA.BufferSize := 0;
  //            LogA.BeginString:='ʱ��,���ƺ�,GPSʱ��,����,γ��,�ٶ�';
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
                FOnDevAlarm_OutorInCArea(Adev, ASSEMBLE_WARRING, False, confArea); //�ۼ�����
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
  //ADeviceManage.JudgeAssembleWarring(ADev);  // �ۼ�����
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
      if GeometryCalc.PointInPolygon(p, confArea.WorldPointAry, 0, confArea.PointCount) then    // �ڷ�α��Χ������
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
//  ADeviceManage.JudgeAntiFake_Warring(ADev); // �����¡��(�Զ��·���α�ܱ�)����
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
//          Adev.OnMinSpeedTime := Now; // ��������ٶȵ�ʱ��
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

          DoOnDevAlarm_OutorInCArea(Adev, SUSPECTEDPETITIONS_WARRING, True, confArea); //�����Ϸñ���

          if confArea.IsShowPop then
          begin
            Title := '�����Ϸñ���';
            Msg := confArea.Name + '����������Ϊ' + IntToStr(confArea.DevList.Count) + '��' + #13#10 +'�����޶�����' + IntToStr(confArea.OverSpeet) + '��';
            ShowPopMsg;
            //ShowPopMsg('�����Ϸñ���', confArea.Name + '����������Ϊ' + IntToStr(confArea.DevList.Count) + '��' + #13#10 +'�����޶�����' + IntToStr(confArea.OverSpeet) + '��');
          end;
        end;

        {LogA := TSystemLog.Create;
        try
          LogA.LogFile := ExePath + 'Alarm\�����Ϸñ���';
          LogA.ExtendName := 'csv';
          LogA.BufferSize := 0;
          LogA.BeginString:='ʱ��,���ƺ�,GPSʱ��,����,γ��,�ٶ�';
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
//  ADeviceManage.JudgeSuspectedPetitions_Warring(ADev);  // �����Ϸñ���
end;

procedure TDisposeCar.OnDevOtherAlarmEvent;
begin
  if Assigned(ADeviceManage.OnDevOtherAlarmEvent) then  //������������� ���౨�� ����
  begin
    if ADev.Switch_Warning[MSG_Warning_16] then  //��16λ	���ٱ���
    begin
      ADeviceManage.OnDevOtherAlarmEvent(ADev,MSG_Warning_16);
    end;

    if ADev.Switch_Warning[MSG_Warning_17] then //��17λ	ƣ�ͼ�ʻ����
      ADeviceManage.OnDevOtherAlarmEvent(ADev,MSG_Warning_17);

    if ADev.Switch_Warning[MSG_Warning_18] then //��18λ	�ۼƼ�ʻ��ʱ����
      ADeviceManage.OnDevOtherAlarmEvent(ADev,MSG_Warning_18);

    if ADev.Switch_Warning[MSG_Warning_19] then //��19λ	ͣ����ʱ����
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
      //�ж��Ƿ�����Чʱ��֮����.
      if confArea.IsEnabledTime then
      begin
        time := Adev.GpsTime - trunc(Adev.GpsTime);
           //��ʼ��ʱ���ڽ���ʱ��.
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
        if not Adev.AreaList.ItemsIsOutAllow[i] then //û�г��� ���� ��
        begin
          Adev.AreaList.ItemsIsOutAllow[i] := True;
          Adev.OutToTownTime := Adev.GpsTime;
          Adev.OutToTown := True;

          DoOnDevAlarm_OutorInCArea(Adev, OUT_TOWN, True, confArea); //����

          if (ADev.Alarm_OutCAreaIsShowPop) and (confArea.IsShowPop) then
          begin
            Title := '������̨';
            Msg := Adev.Car.No + #13 + #10 + 'ʻ��' + confArea.Name;
            ShowPopMsg;
            //ShowPopMsg('������̨', Adev.Car.No + #13 + #10 + 'ʻ��' + confArea.Name);
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
          DoOnDevAlarm_OutorInCArea(Adev, OUT_TOWN, False, confArea); //����,�ŵ�������ʷ��¼��
        end;
      end;

      for j:= 0 to confArea.DevList.Count -1 do
      begin
        dev := ADeviceManage.Find(confArea.DevList[j]);
        if (IncMinute(dev.OutToTownTime, confArea.OverSpeet) < Now) and (dev.OutToTown) then
        begin
          DoOnDevAlarm_OutorInCArea(Adev, OUT_TOWN_ERROR, True, confArea); //���ǳ�ʱ�����������ı���ɫ

          if dev.OutToTownAlarm then
          begin
            Title := '���Ǳ���';
            Msg := '����' + dev.Car.No + '���ǳ���Ԥ��ʱ��';
            ShowPopMsg;
            //ShowPopMsg('���Ǳ���', '����' + dev.Car.No + '���ǳ���Ԥ��ʱ��');
          end;
          {LogA := TSystemLog.Create;
          try
            LogA.LogFile := ExePath + 'Alarm\���Ǳ���';
            LogA.ExtendName := 'csv';
            LogA.BufferSize := 0;
            LogA.BeginString:='ʱ��,���ƺ�,����ʱ��,����ʱ��,GPSʱ��,����,γ��,�ٶ�';

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
  //ADeviceManage.JudgeDevOutToTownTime(ADev); // ���Ǳ���
end;

procedure TDisposeCar.DoOnDevAlarm_OutorInCArea(ADev: Tdevice;
  AlarmType: Byte; AddorDel: boolean; AArea: TConfineArea);
begin
  try
    //FLock.Enter;
    if Assigned(ADeviceManage.OnDevAlarm_OutorInCArea) then
      ADeviceManage.OnDevAlarm_OutorInCArea(Adev, AlarmType, AddorDel, AArea); //Խ��
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
        PopMsg('������ʾ', ADev.Car.No + '���ܷ���' + #13#10 + GetGpsDataAlarmTypeName(i));
    end;  
  end;  
  //��������
  if ADev.Switch_Warning[0] and (GlobalParam.DevAlarmSound <> '') then
  begin
    PlaySound(pchar(GlobalParam.DevAlarmSound),Hinstance,SND_ASYNC);
    //MediaPalySound(GlobalParam.DevAlarmSound);
  end;

  //���ٱ���
  if ADev.Switch_Warning[1] and (GlobalParam.AlarmSound_OverSpeet <> '') then
  begin
    PlaySound(pchar(GlobalParam.AlarmSound_OverSpeet),Hinstance,SND_ASYNC);
//    MediaPalySound(GlobalParam.AlarmSound_OverSpeet);
  end;

  //ƣ�ͼ�ʻ����
  if ADev.Switch_Warning[2] and (GlobalParam.AlarmSound_Fatigue <> '') then
  begin
//    MediaPalySound(GlobalParam.AlarmSound_Fatigue);
    //PlaySound(pchar(GlobalParam.AlarmSound_Fatigue),Hinstance,SND_ASYNC);
  end;

  //�豸���ϱ���(GNSSģ�顢���ߡ��ն�LCD��TTSģ�顢����ͷ������VSS)
  if (ADev.Switch_Warning[4] or ADev.Switch_Warning[5] or ADev.Switch_Warning[6]
      or ADev.Switch_Warning[9] or ADev.Switch_Warning[10] or ADev.Switch_Warning[11]
      or ADev.Switch_Warning[24]) and (GlobalParam.AlarmSound_DevFault <> '') then
  begin
//    MediaPalySound(GlobalParam.AlarmSound_DevFault);
    PlaySound(pchar(GlobalParam.AlarmSound_DevFault),Hinstance,SND_ASYNC);
  end;

  //Ƿѹ����
  if ADev.Switch_Warning[7] and (GlobalParam.AlarmSound_Undervoltage <> '') then
  begin
//    MediaPalySound(GlobalParam.AlarmSound_Undervoltage);
    PlaySound(pchar(GlobalParam.AlarmSound_Undervoltage),Hinstance,SND_ASYNC);
  end;

  //�ϵ籨��
  if ADev.Switch_Warning[8] and (GlobalParam.AlarmSound_PowerDown <> '') then
  begin
//    MediaPalySound(GlobalParam.AlarmSound_PowerDown);
    PlaySound(pchar(GlobalParam.AlarmSound_PowerDown),Hinstance,SND_ASYNC);
  end;

  //��ʱͣ������
  if ADev.Switch_Warning[19] and (GlobalParam.AlarmSound_TimeoutStop <> '') then
  begin
//    MediaPalySound(GlobalParam.AlarmSound_TimeoutStop);
    PlaySound(pchar(GlobalParam.AlarmSound_TimeoutStop),Hinstance,SND_ASYNC);
  end;

  //��������/·�߱���
  if (ADev.Switch_Warning[20] or ADev.Switch_Warning[21] or ADev.Switch_Warning[22]) and (GlobalParam.AlarmSound_InCArea <> '') then
  begin
//    MediaPalySound(GlobalParam.AlarmSound_InCArea);
    PlaySound(pchar(GlobalParam.AlarmSound_InCArea),Hinstance,SND_ASYNC);
  end;

  //ƫ��·�߱���
  if ADev.Switch_Warning[23] and (GlobalParam.AlarmSound_Deviate <> '') then
  begin
//    MediaPalySound(GlobalParam.AlarmSound_Deviate);
    PlaySound(pchar(GlobalParam.AlarmSound_Deviate),Hinstance,SND_ASYNC);
  end;
end;

procedure TDisposeCar.JudgeDevAccOffMoveAlarm;
begin
  if not ADev.Switch[0] then//ACC Ϩ����¼Ϩ��ʱ��
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
          ADeviceManage.OnCarAccOffMoveAlarmEvent(ADev, ADev.GpsTime, ADev.Car.No + '�����Ƿ��ƶ�����');
        if GlobalParam.IsDevOtherAlarm then
          PopMsg('�����Ƿ��ƶ�����', ADev.Car.No + '�����Ƿ��ƶ�����');
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
    //�ж��Ƿ�����Чʱ��֮����.
    if confArea.IsEnabledTime then
    begin
      time := Adev.GpsTime - trunc(Adev.GpsTime);
      //��ʼ��ʱ���ڽ���ʱ��.
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
        begin//���ͬһ�������������������У������������ʱ�����30�����ڻ����bug����ʱ�Ȳ�����
          dt := Now;
          if (dt < IncMinute(confArea.ArriveDateTime, -30)) or (IncMinute(confArea.LeaveDateTime, 30) < dt) then
          begin
            ADev.IsAlarmedInAreaOnTime := False;
            adev.IsAlarmedOutAreaOnTime := False;
            ADev.IsInAreaOnTime := False;
            ADev.IsOutAreaOnTime := False;

            if IncMinute(confArea.LeaveDateTime, 30) < dt then
              ADev.AreaList.Remove(confArea);//�������ָ��ʱ��30���Ӻ󣬾ͽ�������ӳ���������ɾ����Ϊ�����

            Continue;//ָ������ʱ��ǰ30���Ӳſ�ʼ��� ָ���뿪ʱ��30����֮��������
          end;

          if not ADev.IsInAreaOnTime then
          begin//δ��ʱ�����һ�δ����
            if confArea.ArriveDateTime >= dt then
            begin//��ǰ����
              if GeometryCalc.PointInPolygon(ADev.Point, confArea.WorldPointAry, 0, confArea.PointCount) then
                ADev.IsInAreaOnTime := True;
            end
            else//�Ƴٵ��ˣ�
            begin
              if not ADev.IsAlarmedInAreaOnTime then
              begin
                if GeometryCalc.PointInPolygon(ADev.Point, confArea.WorldPointAry, 0, confArea.PointCount) then
                  ADev.IsInAreaOnTime := True;//���ǵ����ˣ�����Ż�����ж��Ƿ�ʱ�뿪

                msg := ADev.Car.No + 'δ��ָ��ʱ��' + #13#10 + FormatDateTime('yyyy-MM-dd hh:nn:ss', confArea.ArriveDateTime) + #13#10 + '����' + confArea.Name;
                PopMsg('ָ��ʱ��δ���ﱨ��', msg);
                ADev.IsAlarmedInAreaOnTime := True;
                if Assigned(ADeviceManage.OnCarIOAreaOnTimeAlarmEvent) then
                  ADeviceManage.OnCarIOAreaOnTimeAlarmEvent(ADev, 0, dt, 'δ��ָ��ʱ��' + FormatDateTime('yyyy-MM-dd hh:nn:ss', confArea.ArriveDateTime) + '����' + confArea.Name);
              end;

              if (dt > confArea.LeaveDateTime) and not ADev.IsAlarmedOutAreaOnTime then
              begin//�Ƴ��뿪
                msg := ADev.Car.No + 'δ��ָ��ʱ��' + #13#10 + FormatDateTime('yyyy-MM-dd hh:nn:ss', confArea.LeaveDateTime) + #13#10 + '�뿪' + confArea.Name;
                PopMsg('ָ��ʱ��δ�뿪����', msg);
                ADev.IsAlarmedOutAreaOnTime := True;
                if Assigned(ADeviceManage.OnCarIOAreaOnTimeAlarmEvent) then
                  ADeviceManage.OnCarIOAreaOnTimeAlarmEvent(ADev, 1, dt, 'δ��ָ��ʱ��' + FormatDateTime('yyyy-MM-dd hh:nn:ss', confArea.LeaveDateTime) + '�뿪' + confArea.Name);
              end;
            end;
          end
          else
          begin
            if not ADev.IsOutAreaOnTime and not ADev.IsAlarmedOutAreaOnTime then
            begin
              if confArea.LeaveDateTime <= dt then
              begin//��ǰ����
                if GeometryCalc.PointInPolygon(ADev.Point, confArea.WorldPointAry, 0, confArea.PointCount) then
                  ADev.IsInAreaOnTime := True;
              end
              else//�Ƴٵ��ˣ�
              begin
                msg := ADev.Car.No + 'δ��ָ��ʱ��' + #13#10 + FormatDateTime('yyyy-MM-dd hh:nn:ss', confArea.ArriveDateTime) + #13#10 + '�뿪' + confArea.Name;
                PopMsg('ָ��ʱ��δ�뿪����', msg);
                ADev.IsAlarmedOutAreaOnTime := True;
                if Assigned(ADeviceManage.OnCarIOAreaOnTimeAlarmEvent) then
                  ADeviceManage.OnCarIOAreaOnTimeAlarmEvent(ADev, 1, dt, 'δ��ָ��ʱ��' + FormatDateTime('yyyy-MM-dd hh:nn:ss', confArea.LeaveDateTime) + '�뿪' + confArea.Name);
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
      //���ڵ�ģ�������⼸�ֱ������涼û�и�����Ϣ����˵������ʱע�� 2011-11-17
      //if i in[1, 12..17, 20..22, 30, 31] then Continue;//���ٱ������������򡢽���·�ߡ�·����ʻ����/���������ں���ĸ�����Ϣ������ʾ���˴�������

      //����������ı����򲻼�¼�����ı�����Ϣ��ֻ��ʾ���ڱ���
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
