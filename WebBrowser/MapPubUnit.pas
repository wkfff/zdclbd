unit MapPubUnit;

interface
uses SysUtils, ActiveX, Math, TrackPlayUnit, MapManagerUnit, uGloabVar, CarUnit, ShowBSMapFrmUnit,
     ConfineAreaUnit;

var
  MapManger: TMapManger;
  FDlg_BSMap: TShowBSMapFrm;

  // ��������֮��ľ��� ���ع���
  function CalculaDistance(const StartLat, StartLong, EndLat, EndLong: Double): Double;
  // ��ʼ����ͼ
  procedure InitBSMap;
  // ���ص�ͼ�����еĳ����б�
  procedure LoadCityList;
  // ��λ������γ��
  procedure Local_Car(Dev: TDevice);
  // �޸Ļ�ɾ���Զ����ǩ
  procedure ModifyOrDeleteDefinedMarker(m: Boolean; Id: Integer; Text: string);
  // ��λ�Զ����ǩ
  procedure Locate_DefinedText(ID: Integer);
  // ��ӡ��ͼ
  procedure printMap;
  // �����ͼͼƬ
  procedure SaveScreenToGif(FileName: string);
  // ɾ������Χ��
  procedure DeleteAConfineArea(ConfineArea: TConfineArea);
  // ɾ�����еĵ���Χ��
  procedure DeleteAllConfineArea;
  // �޸ĵ���Χ��
  procedure ModifyAConfineArea(Id: Integer; Text: string; Color: string);
  // ��λ����Χ��
  procedure Locate_ConfineArea(log: Double; lat: Double);
  // ɾ�������еĵ���Χ��
  procedure DeleteAConfineAreaToDev(Id: Integer);
  // ɾ�������е�Բ
  procedure DeleteACircleToDev(Id: Integer);
  // �켣�ط�
  procedure PutHisGps(FTrackPlay: TTrackPlay; TimeInterval: Integer; Dev: TDevice);
  function PutHisGpsNew(FTrackPlay: TTrackPlay; sIndex: Integer; addCount: Integer): Integer;
  // �ı��ͼˢ�µ�Ƶ��
  procedure SetRefreshInterval(TimeInterval: Integer);
  // ����켣��
  procedure ClearHistroyInfo;
  // ֹͣ�켣�ط�
  procedure StopPlayHistroy;
  // �����ط���һ���켣��
  procedure PlayNextHistroyGpsData;
  // �ƶ������� Recede: true ���� false ǰ���� num: �ƶ�gps��ĸ���
  procedure MoveTrackBar(Recede: Boolean; num: Integer);
  // �켣�ط�ʱ��������
  procedure PlayPreviousHistroyGpsData;
  // ��ͣ������طŹ켣   true��������false����ͣ
  procedure SetIsPlayHistroy(isPlay: Boolean);
  //
  function GetLineProperty(lineSection: TLineSection): string;
  // ����������
  procedure FinishDrawLine(PolyLineArea: TPolyLineArea);
  // ȡ��������
  procedure CancelDrawLines(PolyLineArea: TPolyLineArea);
  // ɾ������ ID:��·ID
  procedure DeleteLines(Id:Integer);

  // ���õ�ͼ��γ�ȵ�ƫ����
	procedure SetLogLatOffSet(City: string);
  // ����ͼ��ͼ����ˢ�³�����Ϣ��JSON��ʽ����
  function GetJsonDevList(BoundsLatLng: string): string;
  function GetJsonDevListAfterChangeGroup(BoundsLatLng: string): string;//������һ�μ������г���
  // �ⲿ�Խӳ�����ˢ����Ϣ
  function GetGovDevList(Count: Integer; BoundsLatLng: string): string;
  //
  procedure SetCurrentMouseTool;

  // ��ʾ����Χ��
  procedure ShowConfineArea(AreaType: integer; BToDev: Boolean; Param: string);
  // ��ʾ������һ������Χ��
  procedure HideOrShowAConfieArea(AreaId, AreaType: integer; BShow: boolean);
  // �л���ͼ
  procedure ChangeCity(log, lat: double; Scale: Integer; City: string);
  // �������ݾ�γ�Ȳ�ѯ����
  procedure DevGeocodeSearch(DevId: string; log, lat: double);
  //
  procedure MoveHisDev(Postion: integer);
  // ���ص�����
  procedure HindOrShowACar(DevId: string; bHide: boolean);
  //
  procedure SetMapDivSize;

  function FillStr(source: string; destLen: Integer; fillChar: string): string;
  function rad(d: double): double;
  function GetTowPointDistance(lng1, lat1, lng2, lat2: double): double;
  procedure locateCar(carNo: string; log, lat, Speed: Double; Orientation: Integer; Color: string);

implementation
uses umainf, ConstDefineUnit;

function FillStr(source: string; destLen: Integer; fillChar: string): string;
var
  i: Integer;
  srcLen: Integer;
  temp: string;
begin
  try
    srcLen := Length(source);
    temp := source;
    if (srcLen < destLen) then
    begin
      for i := 0 to destLen - srcLen - 1 do
      begin
        temp := temp + fillChar;
      end;
    end;
    result := temp;
  except
  end;
end;

function rad(d: double): double;
begin
  Result := d * 3.1415926 / 180.0;
end;

function GetTowPointDistance(lng1, lat1, lng2, lat2: double): double;
var
  radLat1, radLat2, a, b, nDis: double;
begin
  radLat1 := rad(lat1);
  radLat2 := rad(lat2);
  a := radLat1 - radLat2;
  b := rad(lng1) - rad(lng2);
  nDis := 2 * ArcSin(Sqrt(Power(sin(a/2),2) + cos(radLat1)*cos(radLat2)*Power(sin(b/2),2)));
  nDis := nDis * 6378137;
  nDis := Round(nDis * 10000) / 10000;
  Result := nDis / 1000;  // km
end;

function CalculaDistance(const StartLat, StartLong, EndLat, EndLong: Double): Double;
var
  fPhimean: Double;
  fdLambda: Double;
  fdPhi: Double;
  fAlpha: Double;
  fRho: Double;
  fNu: Double;
  fR: Double;
  fz: Double;
  fTemp: Double;
  Distance: Double;
  Bearing: Double;
const
  D2R: Double = 0.017453;
  R2D: Double = 57.295781;
  a: Double = 6378137.0;
  b: Double = 6356752.314245;
  e2: Double = 0.006739496742337;
  f: Double = 0.003352810664747;   
begin
  try
    fdLambda := (StartLong - EndLong) * D2R;
    fdPhi := (StartLat - EndLat) * D2R;
    fPhimean := ((StartLat + EndLat) / 2.0) * D2R;
    fTemp := 1 - e2 * (Power(Sin(fPhimean),2));
    fRho := (a * (1 - e2)) / Power(fTemp, 1.5);
    fNu := a / (Sqrt(1 - e2 * (Sin(fPhimean) * Sin(fPhimean))));
    fz := Sqrt(Power(Sin(fdPhi/2.0),2)+Cos(EndLat*D2R)*Cos(StartLat*D2R)*Power(Sin(fdLambda/2.0),2)) ;
    fz := 2 * ArcSin(fz);
    fAlpha := Cos(EndLat * D2R) * Sin(fdLambda) * 1 / Sin(fz);
    fAlpha := ArcSin(fAlpha);
    fR := (fRho * fNu) / ((fRho * Power(Sin(fAlpha),2)) + (fNu * Power(Cos(fAlpha),2)));
    Distance := (fz * fR);
    if((StartLat < EndLat) and (StartLong < EndLong)) then
      Bearing := Abs(fAlpha * R2D)
    else if ((StartLat < EndLat) and (StartLong > EndLong)) then
      Bearing := 360 - Abs(fAlpha * R2D)
    else if ((StartLat > EndLat) and (StartLong > EndLong)) then
      Bearing := 180 + Abs(fAlpha * R2D)
    else if ((StartLat > EndLat) and (StartLong < EndLong)) then
      Bearing := 180 - Abs(fAlpha * R2D);

    Result := Distance / 1000;      //km
  except
  end;
end;

procedure InitBSMap;
begin
  FDlg_BSMap.InitMap;
end;

procedure LoadCityList;
var
  MapNode: TMapNode;
  temp: TMapNode;
  MapName: string;
begin
  try
    with Mainf do
    begin
      MapManger.ShowToTreeView(FDlg_BSMap.TreeViewMap, FDlg_BSMap.CheckBoxIsShowFile.Checked);
      if MapManger.DefaultNode <> nil then
      begin
        FDlg_BSMap.StatusBar1.Panels.Items[0].Text := 'Ĭ����ʾ��ͼ:' + MapManger.DefaultNode.Name;

        MapNode := MapManger.DefaultNode;

        temp := MapNode.ParentNode;
        MapName := MapNode.Name;
        if temp <> nil then
        begin
          while (temp.Name <> 'ȫ��') do
          begin
            MapName := temp.Name + '->' + MapName;
            temp := temp.ParentNode;
            if (temp = nil) then break;
          end;
        end;
        //Caption := Application.Title + '                       ��ǰ��ʾ ' + MapName + ' ��ͼ';
      end
      else
      begin
        FDlg_BSMap.StatusBar1.Panels.Items[0].Text := 'Ĭ����ʾ��ͼ: ��';
        //Caption := Application.Title + '                       ��ǰ��ʾ �Ͼ��� ��ͼ';
      end;
    end;
  except
  end;
end;

procedure Local_Car(Dev: TDevice);
begin
  try
    FDlg_BSMap.Locate_Car(Dev);
  except
  end;
end;

procedure ModifyOrDeleteDefinedMarker(m: Boolean; Id: Integer; Text: string);
begin
  try
    FDlg_BSMap.ModifyOrDeleteDefinedMarker(m, Id, Text);
  except
  end;
end;

procedure Locate_DefinedText(ID: Integer);
begin
  try
    FDlg_BSMap.Locate_DefinedText(ID);
  except
  end;
end;

procedure printMap;
begin
  try
    FDlg_BSMap.printMap;
  except
  end;
end;

procedure SaveScreenToGif(FileName: string);
begin
  try
    FDlg_BSMap.SaveScreenToGif(FileName);
  except
  end;
end;

procedure DeleteAConfineArea(ConfineArea: TConfineArea);
begin
  try
    if ConfineArea.Area_Type = 0 then
    begin
      FDlg_BSMap.DeleteACircle(ConfineArea.ID, false);
    end else
    begin
      FDlg_BSMap.DeleteAConfineArea(ConfineArea.ID, false);
    end;
  except
  end;
end;

procedure DeleteAllConfineArea;
begin
  try
    FDlg_BSMap.DeleteAllConfineArea(false);
  except
  end;
end;

procedure ModifyAConfineArea(Id: Integer; Text: string; Color: string);
begin
  try
    FDlg_BSMap.ModifyAConfineArea(ID, Text, Color, false);
  except
  end;
end;

procedure Locate_ConfineArea(log: Double; lat: Double);
begin
  try
    FDlg_BSMap.Locate_ConfineArea(log, lat);
  except
  end;
end;

procedure DeleteAConfineAreaToDev(Id: Integer);
begin
  try
    FDlg_BSMap.DeleteAConfineArea(ID, True);
  except
  end;
end;

procedure DeleteACircleToDev(Id: Integer);
begin
  try
    FDlg_BSMap.DeleteACircle(ID, True);
  except
  end;
end;

procedure PutHisGps(FTrackPlay: TTrackPlay; TimeInterval: Integer; Dev: TDevice);
var
  i: Integer;
  log, lat, json: string;
begin
  try
    for i:=0 to FTrackPlay.Count - 1 do
    begin
      log := FormatFloat('##0.000000', FTrackPlay.Buf.Data[i].Longitude/1000000);
      lat := FormatFloat('##0.000000', FTrackPlay.Buf.Data[i].Latitude/1000000) ;
      if i = FTrackPlay.Count - 1 then
        json := json + '{''log'':' + log
                     + ',''lat'':' + lat + '''}'
      else
        json := json + '{''log'':' + log
                     + ',''lat'':' + lat + '''},';
    end;
    json := '[' + json + ']';
    FDlg_BSMap.PutHistroyGpsDataJSON(json);
    SetRefreshInterval(TimeInterval);
    ClearHistroyInfo;
  except
  end;
end;

function PutHisGpsNew(FTrackPlay: TTrackPlay; sIndex: Integer; addCount: Integer): Integer;
var
  i, j: Integer;
  log, lat, json: string;
  count: Integer;
  dLog, dLat: Double;
begin
  Result := 0;
  if (sIndex < 0) or (addCount <= 0) then
    Exit;

  try
    i := sIndex;
    j := 0;
    json := '';
    while (i - sIndex < addCount) and (i < FTrackPlay.Count) do
    begin
      dLog := FTrackPlay.Buf.Data[i].Longitude/1000000;
      dLat := FTrackPlay.Buf.Data[i].Latitude/1000000;
      if (dLog <> 0) and (dLat <> 0) then
      begin
        log := FormatFloat('##0.000000', dLog);
        lat := FormatFloat('##0.000000', dLat) ;
        if j > 0 then
          json := json + ',{''log'':' + log
                       + ',''lat'':' + lat + '}'
        else
          json := json + '{''log'':' + log
                       + ',''lat'':' + lat + '}';
        j := j + 1;
      end;
      i := i + 1;
    end;
    Result := i - sIndex;
    if json <> '' then
    begin
      json := '[' + json + ']';
      FDlg_BSMap.PutHistroyGpsDataJSON(json);
    end;
  except
  end;
end;

procedure SetRefreshInterval(TimeInterval: Integer);
begin
  try
    FDlg_BSMap.SetTimeInterval(TimeInterval);
  except
  end;
end;

procedure ClearHistroyInfo;
begin
  try
    FDlg_BSMap.ClearHistroyInfo;
  except
  end;
end;

procedure StopPlayHistroy;
begin
  try
    FDlg_BSMap.StopPlayHistroy;
  except
  end;
end;

procedure PlayNextHistroyGpsData;
begin
  try
    FDlg_BSMap.PlayNextHistroyGpsData;
  except
  end;
end;

procedure MoveTrackBar(Recede: Boolean; num: Integer);
begin
  try
    FDlg_BSMap.MoveTrackBar(Recede, num);
  except
  end;
end;

procedure PlayPreviousHistroyGpsData;
begin
  try
    FDlg_BSMap.PlayPreviousHistroyGpsData;
  except
  end;
end;

procedure SetIsPlayHistroy(isPlay: Boolean);
begin
  try
    FDlg_BSMap.Timer1.Enabled := not isPlay;
  except
  end;
end;

function GetLineProperty(lineSection: TLineSection): string;
begin
  try
    Result := '[{''Text'':''' + IntToStr(lineSection.LineSectionId) + ''',''IdStr'':''' + IntToStr(lineSection.LineSectionId) + '''}]';
  except
  end;
end;

procedure FinishDrawLine(PolyLineArea: TPolyLineArea);
var
  temp: string;
begin
  try
    temp := '[{''Text'':''' + IntToStr(PolyLineArea.AreaID) + ''',''IdStr'':''' + IntToStr(PolyLineArea.AreaID) + '''}]';
    FDlg_BSMap.FinishDrawLine(temp);
  except
  end;
end;

procedure CancelDrawLines(PolyLineArea: TPolyLineArea);
var
  i: Integer;
  temp: string;
begin
  try
    for i := 0 to PolyLineArea.LineSectionCount-1 do
    begin
      if i = PolyLineArea.LineSectionCount - 1 then
        temp := temp + '{''IdStr'':''' + IntToStr(PolyLineArea.LineSections[i].LineSectionId) + '''}'
      else
        temp := temp + '{''IdStr'':''' + IntToStr(PolyLineArea.LineSections[i].LineSectionId) + '''},';
    end;
    temp := '[' + temp + ']';

    FDlg_BSMap.CancelDrawLines(temp);
  except
  end;
end;

procedure DeleteLines(Id:Integer);
var
  i: Integer;
  PolyLine: TPolyLineArea;
  temp: string;
begin
  try
    PolyLine := TPolyLineArea(FAllAreaManage.find(Id));
    if PolyLine <> nil then
    begin
//      for i := 0 to PolyLine.LineSectionCount-1 do
//      begin
//        if i = PolyLine.LineSectionCount - 1 then
//          temp := temp + '{''IdStr'':''' + IntToStr(PolyLine.LineSections[i].LineSectionId) + '''}'
//        else
//          temp := temp + '{''IdStr'':''' + IntToStr(PolyLine.LineSections[i].LineSectionId) + '''},';
//      end;
//      temp := '[' + temp + ']';

      FDlg_BSMap.DeleteLines(InttoStr(Id));
    end;
  except
  end;
end;

procedure SetLogLatOffSet(City: string);
begin

end;

function GetJsonDevList(BoundsLatLng: string): string;
var
  log, lat: string;
  i, j: Integer;
  dev: TDevice;
  d: OleVariant;
  json: string;
  MaxLat,MinLog : Double;       // ���Ͻ� (���γ�ȡ���С����)
  MinLat,MaxLog: Double;       // ���½� (��Сγ�ȣ���󾭶�)
  ColorStr: string;
  GpsTime: string;
  bounds: array of string;
  num: Integer;
begin
  Result := '';
  try
    num := 0;
    bounds := Split(BoundsLatLng, ';');
    if Length(bounds) = 2 then
    begin                               
      j := Pos(',', bounds[0]);
      MinLog := StrToFloat(Copy(bounds[0], 1, j-1));
      MaxLat := StrToFloat(Copy(bounds[0], j+1, Length(bounds[0])));

      j := Pos(',', bounds[1]);
      MaxLog := StrToFloat(Copy(bounds[1], 1, j-1));
      MinLat := StrToFloat(Copy(bounds[1], j+1, Length(bounds[1])));
    end;

    if FDlg_BSMap.LastGroupWhenRefresh = nil then
      Exit;

    for i := 0 to FDlg_BSMap.LastGroupWhenRefresh.DevListCount - 1 do
    begin
      dev := ADeviceManage.find(FDlg_BSMap.LastGroupWhenRefresh.DevList[i]);
      if dev = nil then
        Continue;
      //dev := ADeviceManage.Items[i];
      if (dev.Longitude > MinLog) and (dev.Longitude < MaxLog)
        and (dev.Latitude > MinLat) and (dev.Latitude < MaxLat) and (dev.First) and (not dev.Hide) then
      begin
        if dev.IsFatigueAlarmStatChanged or 
          ((dev.PreviousReceiveTime <> dev.ReceiveTime)
          and ((dev.PreviousLatitude <> dev.Latitude) or (dev.PreviousLongitude <> dev.Longitude))) then
        begin
          log := FormatFloat('##0.000000', dev.Longitude + LogOffSet); //Copy(FloatToStr(dev.Longitude + LogOffSet), 1, 8);
          lat := FormatFloat('##0.000000', dev.Latitude + LatOffSet);//Copy(FloatToStr(dev.Latitude + LatOffSet), 1, 7);

          ColorStr := '1';

          if (dev.Switch_Warning[MSG_Warning_0]) or (dev.Switch_Warning[MSG_Warning_1]) or (dev.Switch_Warning[MSG_Warning_2])
            or (dev.Switch_Warning[MSG_Warning_3]) then
          begin
            ColorStr := '2';
          end else if dev.IsFatigueAlarm then
          begin
            ColorStr := '3';
          end
          else
          begin
            ColorStr := '1';
          end;
          //ColorStr := '3';
          if dev.GpsTime = 0 then
            GpsTime := ''
          else
            GpsTime := FormatDateTime('YYYY-MM-DD hh:nn:ss', dev.GpsTime);
          if num = 0 then
            json := json + '{''log'':' + log + ',''lat'':' + lat + ',''IdStr'':'''+ dev.IdStr
                        + ''',''CarNo'':''' + dev.Car.No + ''',''ColorStr'':''' + ColorStr
                        + ''',''Driver'':''' + Dev.Login_DriverName + '('+Dev.Login_Driver+')' +''',''SIM'':''' + dev.SimNo
                        + ''',''SPEED'':''' + FormatFloat('##0.0', Dev.Speed/10)
                        + ''',''Orientation'':''' + IntToStr(Dev.Orientation)
                        + ''',''OrientationStr'':''' + getCarAngle(Dev.Orientation)
                        + ''',''CarColor'':''' + Dev.Car.CPColorStr
                        + ''',''City'':''' + Dev.Car.ShengName + Dev.Car.ShiName
                        + ''',''IndustryName'':''' + Dev.Car.IndustryName
                        + ''',''GpsTime'':''' + GpsTime + '''}'
          else
            json := json + ',{''log'':' + log + ',''lat'':' + lat + ',''IdStr'':''' + dev.IdStr
                        + ''',''CarNo'':''' + dev.Car.No + ''',''ColorStr'':''' + ColorStr
                        + ''',''Driver'':''' + Dev.Login_DriverName + '('+Dev.Login_Driver+')' +''',''SIM'':''' + dev.SimNo
                        + ''',''SPEED'':''' + FormatFloat('##0.0', Dev.Speed/10)
                        + ''',''Orientation'':''' + IntToStr(Dev.Orientation)
                        + ''',''OrientationStr'':''' + getCarAngle(Dev.Orientation)
                        + ''',''CarColor'':''' + Dev.Car.CPColorStr
                        + ''',''City'':''' + Dev.Car.ShengName + Dev.Car.ShiName
                        + ''',''IndustryName'':''' + Dev.Car.IndustryName
                        + ''',''GpsTime'':''' + GpsTime + '''}';
          dev.PreviousReceiveTime := dev.ReceiveTime;
          
          num := num + 1;
//          if num >= devCount then
//          begin
//            Break;
//          end;
        end;
        dev.IsFatigueAlarmStatChanged := False;
      end;
    end;
    json := '[' + json + ']';
    Result := json;
  except
  end;
end;

function GetJsonDevListAfterChangeGroup(BoundsLatLng: string): string;
var
  log, lat: string;
  i, j: Integer;
  dev: TDevice;
  d: OleVariant;
  json: string;
  MaxLat,MinLog : Double;       // ���Ͻ� (���γ�ȡ���С����)
  MinLat,MaxLog: Double;       // ���½� (��Сγ�ȣ���󾭶�)
  ColorStr: string;
  GpsTime: string;
  bounds: array of string;
  num: Integer;
begin
  Result := '';
  try
    num := 0;
    bounds := Split(BoundsLatLng, ';');
    if Length(bounds) = 2 then
    begin                               
      j := Pos(',', bounds[0]);
      MinLog := StrToFloat(Copy(bounds[0], 1, j-1));
      MaxLat := StrToFloat(Copy(bounds[0], j+1, Length(bounds[0])));

      j := Pos(',', bounds[1]);
      MaxLog := StrToFloat(Copy(bounds[1], 1, j-1));
      MinLat := StrToFloat(Copy(bounds[1], j+1, Length(bounds[1])));
    end;

    if FDlg_BSMap.LastGroupWhenRefresh = nil then
      Exit;

    for i := 0 to FDlg_BSMap.LastGroupWhenRefresh.DevListCount - 1 do
    begin
      dev := ADeviceManage.find(FDlg_BSMap.LastGroupWhenRefresh.DevList[i]);
      if dev = nil then
        Continue;
      if (dev.Longitude > MinLog) and (dev.Longitude < MaxLog)
        and (dev.Latitude > MinLat) and (dev.Latitude < MaxLat) and (not dev.Hide) then
      begin
//        if dev.IsFatigueAlarmStatChanged or 
//          ((dev.PreviousReceiveTime <> dev.ReceiveTime)
//          and ((dev.PreviousLatitude <> dev.Latitude) or (dev.PreviousLongitude <> dev.Longitude))) then
//        begin
          log := FormatFloat('##0.000000', dev.Longitude + LogOffSet); //Copy(FloatToStr(dev.Longitude + LogOffSet), 1, 8);
          lat := FormatFloat('##0.000000', dev.Latitude + LatOffSet);//Copy(FloatToStr(dev.Latitude + LatOffSet), 1, 7);

          ColorStr := '1';

          if (dev.Switch_Warning[MSG_Warning_0]) or (dev.Switch_Warning[MSG_Warning_1]) or (dev.Switch_Warning[MSG_Warning_2])
            or (dev.Switch_Warning[MSG_Warning_3]) then
          begin
            ColorStr := '2';
          end else if dev.IsFatigueAlarm then
          begin
            ColorStr := '3';
          end
          else
          begin
            ColorStr := '1';
          end;
          //ColorStr := '3';
          if dev.GpsTime = 0 then
            GpsTime := ''
          else
            GpsTime := FormatDateTime('YYYY-MM-DD hh:nn:ss', dev.GpsTime);
          if num = 0 then
            json := json + '{''log'':' + log + ',''lat'':' + lat + ',''IdStr'':'''+ dev.IdStr
                        + ''',''CarNo'':''' + dev.Car.No + ''',''ColorStr'':''' + ColorStr
                        + ''',''Driver'':''' + Dev.Login_DriverName + '('+Dev.Login_Driver+')' +''',''SIM'':''' + dev.SimNo
                        + ''',''SPEED'':''' + FormatFloat('##0.0', Dev.Speed/10)
                        + ''',''Orientation'':''' + IntToStr(Dev.Orientation)
                        + ''',''OrientationStr'':''' + getCarAngle(Dev.Orientation)
                        + ''',''CarColor'':''' + Dev.Car.CPColorStr
                        + ''',''City'':''' + Dev.Car.ShengName + Dev.Car.ShiName
                        + ''',''IndustryName'':''' + Dev.Car.IndustryName
                        + ''',''GpsTime'':''' + GpsTime + '''}'
          else
            json := json + ',{''log'':' + log + ',''lat'':' + lat + ',''IdStr'':''' + dev.IdStr
                        + ''',''CarNo'':''' + dev.Car.No + ''',''ColorStr'':''' + ColorStr
                        + ''',''Driver'':''' + Dev.Login_DriverName + '('+Dev.Login_Driver+')' +''',''SIM'':''' + dev.SimNo
                        + ''',''SPEED'':''' + FormatFloat('##0.0', Dev.Speed/10)
                        + ''',''Orientation'':''' + IntToStr(Dev.Orientation)
                        + ''',''OrientationStr'':''' + getCarAngle(Dev.Orientation)
                        + ''',''CarColor'':''' + Dev.Car.CPColorStr
                        + ''',''City'':''' + Dev.Car.ShengName + Dev.Car.ShiName
                        + ''',''IndustryName'':''' + Dev.Car.IndustryName
                        + ''',''GpsTime'':''' + GpsTime + '''}';
          dev.PreviousReceiveTime := dev.ReceiveTime;
          
          num := num + 1;

        dev.IsFatigueAlarmStatChanged := False;
      end;
    end;
    json := '[' + json + ']';
    Result := json;
  except
  end;
end;

function GetGovDevList(Count: Integer; BoundsLatLng: string): string;
var
  log, lat: string;
  i, j: Integer;
  dev: TDevice;
  d: OleVariant;
  json: string;
  MaxLat,MinLog : Double;       // ���Ͻ� (���γ�ȡ���С����)
  MinLat,MaxLog: Double;       // ���½� (��Сγ�ȣ���󾭶�)
  ColorStr: string;
  GpsTime: string;
  devCount: Integer;
  bounds: array of string;
  num: Integer;
begin
  try
    num := 0;
    bounds := Split(BoundsLatLng, ';');
    if Length(bounds) = 2 then
    begin                               
      j := Pos(',', bounds[0]);
      MinLog := StrToFloat(Copy(bounds[0], 1, j-1));
      MaxLat := StrToFloat(Copy(bounds[0], j+1, Length(bounds[0])));

      j := Pos(',', bounds[1]);
      MaxLog := StrToFloat(Copy(bounds[1], 1, j-1));
      MinLat := StrToFloat(Copy(bounds[1], j+1, Length(bounds[1])));
    end;

    devCount := Count;
    for i := 0 to AGovDeviceManage.Count-1 do
    begin

      dev := AGovDeviceManage.Items[i];
      if (dev.Longitude > MinLog) and (dev.Longitude < MaxLog)
        and (dev.Latitude > MinLat) and (dev.Latitude < MaxLat) then
      begin
       // if (Dev.Switch[STAT_GPS_LOCATE]) then
          {and (dev.PreviousReceiveTime <> dev.ReceiveTime)
          and ((dev.PreviousLatitude <> dev.Latitude) or (dev.PreviousLongitude <> dev.Longitude))}
       // begin
          log := FormatFloat('##0.000000', dev.Longitude + LogOffSet); //Copy(FloatToStr(dev.Longitude + LogOffSet), 1, 8);
          lat := FormatFloat('##0.000000', dev.Latitude + LatOffSet);//Copy(FloatToStr(dev.Latitude + LatOffSet), 1, 7);

          ColorStr := '1';

          {if (dev.Switch_Warning[MSG_Warning_0]) or (dev.Switch_Warning[MSG_Warning_1]) or (dev.Switch_Warning[MSG_Warning_2])
            or (dev.Switch_Warning[MSG_Warning_3]) then
          begin
            ColorStr := '2';
          end else
          begin
            ColorStr := '1';
          end;             }

          if dev.GpsTime = 0 then
            GpsTime := ''
          else
            GpsTime := FormatDateTime('YYYY-MM-DD hh:nn:ss', dev.GpsTime);
          if i = devCount then
            json := json + '{''log'':' + log + ',''lat'':' + lat + ',''IdStr'':'''+ dev.IdStr
                        + ''',''CarNo'':''' + dev.Car.No + ''',''ColorStr'':''' + ColorStr
                        + ''',''Driver'':''' + Dev.Login_DriverName + '('+Dev.Login_Driver+')' +''',''SIM'':''' + dev.SimNo
                        + ''',''SPEED'':''' + FormatFloat('##0.0', Dev.Speed/10)
                        + ''',''Orientation'':''' + IntToStr(Dev.Orientation)
                        + ''',''OrientationStr'':''' + getCarAngle(Dev.Orientation)
                        + ''',''CarColor'':''' + Dev.Car.CPColorStr
                        + ''',''City'':''' + Dev.Car.ShengName + Dev.Car.ShiName
                        + ''',''IndustryName'':''' + Dev.Car.IndustryName
                        + ''',''GpsTime'':''' + GpsTime + '''}'
          else
            json := json + '{''log'':' + log + ',''lat'':' + lat + ',''IdStr'':''' + dev.IdStr
                        + ''',''CarNo'':''' + dev.Car.No + ''',''ColorStr'':''' + ColorStr
                        + ''',''Driver'':''' + Dev.Login_DriverName + '('+Dev.Login_Driver+')' +''',''SIM'':''' + dev.SimNo
                        + ''',''SPEED'':''' + FormatFloat('##0.0', Dev.Speed/10)
                        + ''',''Orientation'':''' + IntToStr(Dev.Orientation)
                        + ''',''OrientationStr'':''' + getCarAngle(Dev.Orientation)
                        + ''',''CarColor'':''' + Dev.Car.CPColorStr
                        + ''',''City'':''' + Dev.Car.ShengName + Dev.Car.ShiName
                        + ''',''IndustryName'':''' + Dev.Car.IndustryName
                        + ''',''GpsTime'':''' + GpsTime + '''},';
          //dev.PreviousReceiveTime := dev.ReceiveTime;
          
          num := num + 1;
          if num >= devCount then
          begin
            Break;
          end;
       // end;
      end;
    end;
    json := '[' + json + ']';
    Result := json;
  except
  end;
end;

procedure SetCurrentMouseTool;
begin
  try
    FDlg_BSMap.SetCurrentMouseTool;
  except
  end;
end;

procedure ShowConfineArea(AreaType: integer; BToDev: Boolean; Param: string);
begin
  try
    FDlg_BSMap.ShowConfineArea(AreaType, BToDev, Param);
  except
  end;
end;

procedure HideOrShowAConfieArea(AreaId, AreaType: integer; BShow: boolean);
begin
  try
    FDlg_BSMap.HideOrShowAConfieArea(AreaId, AreaType, BShow);
  except
  end;
end;

procedure ChangeCity(log, lat: double; Scale: Integer; City: string);
begin
  try
    FDlg_BSMap.ChangeCity(log, lat, Scale, City);
  except
  end;
end;

procedure DevGeocodeSearch(DevId: string; log, lat: double);
begin
  try
    FDlg_BSMap.DevGeocodeSearch(DevId, log, lat);
  except
  end;
end;

procedure MoveHisDev(Postion: integer);
begin
  try
    FDlg_BSMap.MoveHisDev(Postion);
  except
  end;
end;

procedure HindOrShowACar(DevId: string; bHide: boolean);
begin
  try
    FDlg_BSMap.HindOrShowACar(DevId, bHide);
  except
  end;
end;

procedure SetMapDivSize;
begin
  try
    FDlg_BSMap.SetMapDivSize;
  except
  end;
end;

procedure locateCar(carNo: string; log, lat, Speed: Double; Orientation: Integer; Color: string);
begin
  try
    FDlg_BSMap.locateCar(carNo, log, lat, Speed, Orientation, color);
  except
  end;
end;  

initialization
  CoInitialize(nil);
  FDlg_BSMap := TShowBSMapFrm.Create(nil);

finalization
  //FDlg_BSMap.Free;
  CoUninitialize();

end.
