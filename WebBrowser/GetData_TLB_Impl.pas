unit GetData_TLB_Impl;
 
interface

uses
 Classes, ComObj, GetData_TLB;

type
  TMyExternal = class(TAutoIntfObject, IGetData, IDispatch)
  private
  protected
    // 测试接口
    function DoSearchData(ASQL: OleVariant): OleVariant; safecall;
    // 初始化地图
    procedure InitMap; safecall;
    // 鼠标在灵图地图上移动到车辆上方时，delphi车辆列表、车辆信息联动变化
    procedure OnCarAction(const DevIdStr: WideString); safecall;
    // 轨迹回放完，由js调用delphi的自动刷新车辆信息功能，在地图上重新开始实时刷新车辆信息
    procedure EndPlayHistroy; safecall;
    // 在地图上矩形选择的车辆列表返回给delphi程序
    procedure SelectDevList(const DevListStr: WideString); safecall;
    // 在地图上增加的自定义标签的经纬度传给delphi，返回自定标签ID和标签名（JSON格式）
    function UserDefinedText(const log: WideString; const lat: WideString): OleVariant; safecall;
    // 地图加载时，由js调用delphi的自定义标签列表（JSON格式），并在地图上显示
    function GetDefinedTextList: OleVariant; safecall;
    // 在地图上增加的电子围栏的经纬度传给delphi，返回电子围栏ID和电子围栏名（JSON格式）
    function SetConfineArea(const LogLatStr: WideString): OleVariant; safecall;
    // 在地图上画圆，存到本地客户端判断区域
    function SetCircleArea(const Radius: WideString; const CenterPoint: WideString; 
                           const LastPoint: WideString): OleVariant; safecall;
    // 获取当前程序所在的文件夹路径
    function GetExePath: OleVariant; safecall;
    // 获取当前地图
    function GetDefaultMap: OleVariant; safecall;
    // 打开地图刷新
    procedure OpenRefreshDev; safecall;
    // 由页面返回订单窗体中查询的地名
    procedure SendSearchOrderPoints(AddressList: OleVariant); safecall;
    // 设置行驶区域到车机中
    function SetConfineAreaToDev(const AreaType: WideString; const LogLatStr: WideString;
                                 const CenterPoint: WideString; const Radius: WideString): OleVariant; safecall;
    // 设置线路到车机中
    function SetToLineToDev(const LogLatStr: WideString): OleVariant; safecall;
    // 区域查车
    procedure BrowseSeekCar(const LogLatList: WideString); safecall;
    // 计算两点之间的距离，返回公里
    function GetDistance(const BeginPoint: WideString; const EndPoint: WideString): OleVariant; safecall;
    // 获取设置到车机中的区域
    function GetConfineAreaToDev: OleVariant; safecall;
    // 获取设置到本地的区域
    function GetConfineArea: OleVariant; safecall;
    // 设置根据车机经纬度获取的详细地名
    procedure SetDevGeocodeSearch(const DevIdStr: WideString; const Result: WideString); safecall;
    // 根据城市名获取中心点的经纬度
    function GetCenterCityLngLat(const CityName: WideString): OleVariant; safecall;
    // 获取地图IP和端口
    function GetMapIP: OleVariant; safecall;
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses
 SysUtils, ActiveX, StdActns, umainf, uGloabVar, CarUnit, StrUtils, MetaDefine, Forms,
 VSMSClientUnit{, SendOrderMiniFrmUnit}, ComCtrls, MapPubUnit, LsSysUnit, ConfineAreaUnit,
 MapManagerUnit, ConstDefineUnit;

 { TMyExternal }

constructor TMyExternal.Create;
var
  TypeLib: ITypeLib;
  ExeName: WideString;
begin
  try
    ExeName := ExtractFilePath(Application.ExeName) + '\GetData.exe';//ParamStr(0);
    OleCheck(LoadTypeLib(PWideChar(ExeName), TypeLib));
    inherited Create(TypeLib, IGetData);
  except
  end;
end;

destructor TMyExternal.Destroy;
begin
  inherited;
end;

function TMyExternal.DoSearchData(ASQL: OleVariant): OleVariant; safecall;
begin
    //Result := DataModule2.SearchDataHtml(ASQL);
end;

procedure TMyExternal.EndPlayHistroy;
begin
  try
    FDlg_BSMap.SetTimeEnable(True);
  except
  end;
end;

function TMyExternal.GetExePath: OleVariant;
var
  FilePath: string; // 'c:\temp\'
begin
  try
    FilePath := ExtractFilePath(Application.ExeName);
    Result := StringReplace(FilePath, '\', '/', [rfReplaceAll]);
  except
  end;
end;

function TMyExternal.GetDefinedTextList: OleVariant;
var
  i: Integer;
  json: string;
  EarthPoint: TEarthPoint;
  log, lat: string;
begin
  try
    for i:=0 to GTextManage.Count - 1 do
    begin
      EarthPoint := Project.XY2LoLa(GTextManage.Item[i].Symbol.Position);
      log := FormatFloat('##0.000000', EarthPoint.Longitude + LogOffSet);
      lat := FormatFloat('##0.000000', EarthPoint.Latitude + LatOffSet);
      if i = GTextManage.Count - 1 then
        json := json + '{''log'':' + log + ',''lat'':' + lat + ',''Text'':''' + GTextManage.Item[i].Text + ''',''IdStr'':''' + IntToStr(GTextManage.Item[i].ID) + '''}'
      else
        json := json + '{''log'':' + log + ',''lat'':' + lat + ',''Text'':''' + GTextManage.Item[i].Text + ''',''IdStr'':''' + IntToStr(GTextManage.Item[i].ID) + '''},';
    end;
    json := '[' + json + ']';
    result := json;
  except
  end;
end;

procedure TMyExternal.OnCarAction(const DevIdStr: WideString); safecall;
var
  dev: TDevice;
begin
  try
    dev := ADeviceManage.find(DevIdStr);
    if dev = nil then Exit;

    if GCurSelectDev <> Dev then
    begin
      GCurSelectDev := Dev;
      Mainf.Edit2.Text := GCurSelectDev.Id;
      Mainf.Edit1.Text := GCurSelectDev.Car.No;
      Mainf.ComboboxCarNO.Text := Mainf.Edit1.Text;
    end;
    Mainf.showTipFrm(dev);
  except
  end;
end;

procedure TMyExternal.SelectDevList(const DevListStr: WideString);
var
  devList: array of string;
  devID: string;
  i: integer;
  dev: TDevice;

  tempListView: TListView;
begin
  try
    ADeviceManage.ClearUserSelectList; //清除选中车辆列表
    Mainf.ListSelectDev.Clear;

    if Trim(DevListStr) = '' then
    begin
      Exit;
    end;

    devList := Split(Copy(Trim(DevListStr), 1, Length(Trim(DevListStr))-1), ',');
    for i := 0 to Length(devList) - 1 do
    begin
      devID := RightStr(devList[i], 12);
      if devId <> '' then ADeviceManage.AddToUserSelectList(devId);
    end;

    with Mainf do
    begin
      if not (Panel_Clxx.Visible) then show_car.Execute;

      if ADeviceManage.UserSelectList.Count = 0 then
      begin

        PageControl1.ActivePageIndex := 0;
        exit;
      end;

      ListSelectDev.BeginUpdate;
      for i := 0 to ADeviceManage.UserSelectList.Count - 1 do
      begin
        dev := ADeviceManage.ItemsFromMetaIndex[i];
        with ListSelectDev.Add do
        begin
          Data := dev;
          Values[0] := dev.IdStr;
          Values[1] := dev.Car.No;
          Values[2] := ADevGroupManage.find(dev.GroupID).Name;
          Values[3] := dev.SimNo;
          Values[4] := FormatFloat('##0.000000', dev.Longitude);
          Values[5] := FormatFloat('##0.000000', dev.Latitude);
          Values[6] := FormatFloat('##0.0', dev.Speed/10);
          if dev.GpsTime = 0 then
            Values[7] := ''
          else
            Values[7] := FormatDateTime('yyyy-mm-dd hh:nn:ss', dev.GpsTime);
          ImageIndex := dev.Car.ResIndex;
          SelectedIndex := dev.Car.ResIndex;
          if dev.isOnline then
          begin
            if Dev.Switch[STAT_GPS_LOCATE] then
              StateIndex := 3
            else
              StateIndex := 6;

            if not Dev.Switch[MSG_STATE_0] then
              StateIndex := 7;
          end
          else //如不在线,就显示非定位..
          begin
            StateIndex := 4;
          end;
        end;
      end;
      ListSelectDev.EndUpdate;
      PageControl1.ActivePageIndex := 1;
    end;
  except
  end;
end;

function TMyExternal.SetConfineArea(const LogLatStr: WideString): OleVariant;
var
  WPointsAry: TWorldPointAry;
  PointsCnt: Integer;
  EarthPoint: TEarthPoint;
  WorldPoint: TWorldPoint;
  i: Integer;
  temp: string;
  LogLatList: array of string;
  log, lat: string;
  j: Integer;
  Longitude, Latitude: Double;
begin
  try
    LogLatList := Split(Copy(Trim(LogLatStr), 1, Length(Trim(LogLatStr))-1), ';');
    SetLength(WPointsAry, Length(LogLatList));
    for i:=0 to Length(LogLatList)-1 do
    begin
      j := Pos(',', LogLatList[i]);
      log := Copy(LogLatList[i], 1, j-1);
      lat := Copy(LogLatList[i], j+1, Length(LogLatList[i]));

      Longitude := StrToFloat(log);
      Latitude := StrToFloat(lat);
      EarthPoint.x := Longitude;
      EarthPoint.y := Latitude;

      WorldPoint := Project.LoLa2XY(EarthPoint);
      WPointsAry[i] := WorldPoint;
    end;

    Result := Mainf.SetConfineAlarmArea(WPointsAry, Length(WPointsAry));
  except
  end;
end;

function TMyExternal.SetCircleArea(const Radius: WideString; const CenterPoint: WideString;
                           const LastPoint: WideString): OleVariant; safecall;
var
  EarthPoint: TEarthPoint;
  WorldPoint: TWorldPoint;
  LastLngLat: TWorldPoint;
  i: Integer;
  log, lat: string;
  Longitude, Latitude: Double;
begin
  try
    i := Pos(',', CenterPoint);
    log := Copy(CenterPoint, 1, i-1);
    lat := Copy(CenterPoint, i+1, Length(CenterPoint));

    Longitude := StrToFloat(log);
    Latitude := StrToFloat(lat);
    EarthPoint.x := Longitude;
    EarthPoint.y := Latitude;
    WorldPoint := Project.LoLa2XY(EarthPoint);

    i := Pos(',', LastPoint);
    log := Copy(LastPoint, 1, i-1);
    lat := Copy(LastPoint, i+1, Length(LastPoint));

    Longitude := StrToFloat(log);
    Latitude := StrToFloat(lat);
    EarthPoint.x := Longitude;
    EarthPoint.y := Latitude;
    LastLngLat := Project.LoLa2XY(EarthPoint);
    Result := Mainf.SetCircleArea(StringToFloat(Radius), WorldPoint, LastLngLat);
  except
  end;
end;

function TMyExternal.UserDefinedText(const log: WideString; const lat: WideString): OleVariant; safecall;
var
  Longitude, Latitude: Double;
  EarthPoint: TEarthPoint;
  WorldPoint: TWorldPoint;
begin
  try
    Longitude := StrToFloat(log);
    Latitude := StrToFloat(lat);
    EarthPoint.x := Longitude;
    EarthPoint.y := Latitude;

    WorldPoint := Project.LoLa2XY(EarthPoint);
    result := Mainf.UserDefinedText(EarthPoint, WorldPoint);
  except
  end;
end;

function TMyExternal.GetDefaultMap: OleVariant; safecall;
var
  wp: TWorldPoint;
  ep: TEarthPoint;
begin
  try
    SetMapDivSize;
    if MapManger.DefaultNode <> nil then
    begin
      wp.X:=(MapManger.DefaultNode.OutBox.Xmin+MapManger.DefaultNode.OutBox.Xmax) div 2;
      wp.Y:=(MapManger.DefaultNode.OutBox.Ymin+MapManger.DefaultNode.OutBox.Ymax) div 2;
      ep := Project.XY2LoLa(wp);
      ChangeCity(ep.Longitude, ep.Latitude, 10,  MapManger.DefaultNode.Name);
      //Result := MapManger.DefaultNode.Name;
    end
    else
    begin
      ChangeCity(109.43577, 37.47786, 4,  '全国');
      //Result := '南京市';
    end;
    Result := '';
  except
  end;
end;

procedure TMyExternal.OpenRefreshDev;
begin
  try
//    FDlg_BSMap.Timer1.Enabled := True;
  except
  end;
end;

procedure TMyExternal.SendSearchOrderPoints(AddressList: OleVariant); safecall;
begin
  try
    //Mainf.FDlg_SendOrderMap.SetSearchAddress(AddressList);
  except
  end;
end;

function TMyExternal.SetConfineAreaToDev(const AreaType: WideString; const LogLatStr: WideString;
                                 const CenterPoint: WideString; const Radius: WideString): OleVariant; safecall;
var
  WPointsAry: TWorldPointAry;
  PointsCnt: Integer;
  EarthPoint: TEarthPoint;
  WorldPoint: TWorldPoint;
  LeftPoint, RightPoint: TEarthPoint;
  CenPoint: TEarthPoint;
  LastPoint: TEarthPoint;
  i: Integer;
  temp: string;
  LogLatList: array of string;
  log, lat: string;
  j: Integer;
  Longitude, Latitude: Double;
begin
  try
    if AreaType = '0' then           // 画圆
    begin

      temp := CenterPoint;
      Longitude := StrToFloat(Copy(temp, 1, Pos(',', temp)-1));
      temp := Copy(temp, Pos(',', temp)+1, Length(temp));
      
      Latitude := StrToFloat(temp);
      
      CenPoint.x := Longitude;
      CenPoint.y := Latitude;

      temp := LogLatStr;
      Longitude := StrToFloat(Copy(temp, 1, Pos(',', temp)-1));
      temp := Copy(temp, Pos(',', temp)+1, Length(temp));
      
      Latitude := StrToFloat(temp);
      
      LastPoint.x := Longitude;
      LastPoint.y := Latitude;
    end
    else if AreaType = '1' then
    begin
      LogLatList := Split(Copy(Trim(LogLatStr), 1, Length(Trim(LogLatStr))-1), ';');
      if Length(LogLatList) >= 2 then
      begin
        j := Pos(',', LogLatList[0]);
        log := Copy(LogLatList[0], 1, j-1);
        lat := Copy(LogLatList[0], j+1, Length(LogLatList[0]));

        Longitude := StrToFloat(log);
        Latitude := StrToFloat(lat);
        LeftPoint.x := Longitude;
        LeftPoint.y := Latitude;

        j := Pos(',', LogLatList[1]);
        log := Copy(LogLatList[1], 1, j-1);
        lat := Copy(LogLatList[1], j+1, Length(LogLatList[1]));

        Longitude := StrToFloat(log);
        Latitude := StrToFloat(lat);
        RightPoint.x := Longitude;
        RightPoint.y := Latitude;
      end;
    end else
    begin
      LogLatList := Split(Copy(Trim(LogLatStr), 1, Length(Trim(LogLatStr))-1), ';');
      SetLength(WPointsAry, Length(LogLatList));
      for i:=0 to Length(LogLatList)-1 do
      begin
        j := Pos(',', LogLatList[i]);
        log := Copy(LogLatList[i], 1, j-1);
        lat := Copy(LogLatList[i], j+1, Length(LogLatList[i]));

        Longitude := StrToFloat(log);
        Latitude := StrToFloat(lat);
        EarthPoint.x := Longitude;
        EarthPoint.y := Latitude;

        WorldPoint := Project.LoLa2XY(EarthPoint);
        WPointsAry[i] := WorldPoint;
      end;
    end;

    //SetCurrentMouseTool;
    Result := Mainf.SetConfineAreaToDev(StrToInt(AreaType), CenPoint,  Trunc(StringToFloat(Radius)), LastPoint,
                                       LeftPoint, RightPoint,
                                       WPointsAry, Length(WPointsAry));
    //ProcessDevArea(areaShape:byte; WCenterPoint: TEarthPoint; Radius: Integer; LastPoint: TEarthPoint;
    //           LeftPoint: TEarthPoint; RightPoint: TEarthPoint; WPointsAry: TWorldPointAry; PointsCnt: Integer);
  except
  end;
end;

function TMyExternal.SetToLineToDev(const LogLatStr: WideString): OleVariant;
var
  LogLatList: array of string;
  WPointsAry: TWorldPointAry;
  i, j: Integer;
  log, lat: string;
  Longitude, Latitude: Double;
  EarthPoint: TEarthPoint;
  WorldPoint: TWorldPoint;
begin
  try
    LogLatList := Split(Copy(Trim(LogLatStr), 1, Length(Trim(LogLatStr))-1), ';');
    SetLength(WPointsAry, Length(LogLatList));
    for i:=0 to Length(LogLatList)-1 do
    begin
      j := Pos(',', LogLatList[i]);
      log := Copy(LogLatList[i], 1, j-1);
      lat := Copy(LogLatList[i], j+1, Length(LogLatList[i]));

      Longitude := StrToFloat(log);
      Latitude := StrToFloat(lat);
      EarthPoint.x := Longitude;
      EarthPoint.y := Latitude;

      WorldPoint := Project.LoLa2XY(EarthPoint);
      WPointsAry[i] := WorldPoint;
    end;
    Result := Mainf.SetRunWayToDev(WPointsAry, Length(WPointsAry));
  except
  end;
end;

procedure TMyExternal.BrowseSeekCar(const LogLatList: WideString);
var
  BeginP, EndP: TEarthPoint;
  j: Integer;
  Longitude, Latitude: Double;
  i: Integer;
  temp: string;
  LogLatAry: array of string;
  log, lat: string;
begin
  try
    LogLatAry := Split(Copy(Trim(LogLatList), 1, Length(Trim(LogLatList))-1), ';');
    if Length(LogLatAry) >= 2 then
    begin
      j := Pos(',', LogLatAry[0]);
      log := Copy(LogLatAry[0], 1, j-1);
      lat := Copy(LogLatAry[0], j+1, Length(LogLatAry[0]));

      Longitude := (StrToFloat(log));
      Latitude := (StrToFloat(lat));
      BeginP.x := Longitude;
      BeginP.y := Latitude;

      j := Pos(',', LogLatAry[1]);
      log := Copy(LogLatAry[1], 1, j-1);
      lat := Copy(LogLatAry[1], j+1, Length(LogLatAry[1]));

      Longitude := (StrToFloat(log));
      Latitude := (StrToFloat(lat));
      EndP.x := Longitude;
      EndP.y := Latitude;
    end;
    Mainf.BrowseSeekCar(BeginP, EndP);
  except
  end;
end;

function TMyExternal.GetDistance(const BeginPoint: WideString; const EndPoint: WideString): OleVariant; safecall;
var
  BegLog, BegLat, EndLog, EndLat: Double;
  log, lat: string;
  Temp: string;
  i: Integer;
begin
  try
    i := Pos(',', BeginPoint);
    log := Copy(BeginPoint, 1, i-1);
    lat := Copy(BeginPoint, i+1, Length(BeginPoint));
    BegLog := (StrToFloat(log));
    BegLat := (StrToFloat(lat));

    i := Pos(',', EndPoint);
    log := Copy(EndPoint, 1, i-1);
    lat := Copy(EndPoint, i+1, Length(EndPoint));
    EndLog := (StrToFloat(log));
    EndLat := (StrToFloat(lat));

    Result := GetTowPointDistance(BegLog, BegLat, EndLog, EndLat);//CalculaDistance(BegLog, BegLat, EndLog, EndLat);
  except
    Result := 0;
  end;
end;

function TMyExternal.GetConfineArea: OleVariant;
var
  i,j,K, kind: Integer;
  json: string;
  EarthPoint: TEarthPoint;
  WorldPoint: TWorldPoint;
  log, lat: string;
  LastLog, LastLat: string;
  area: TConfineArea;
  LngLatList: string;

  CircleArea: TCircleArea;
  RectangleArea: TRectangleArea;
  NoSymbolArea: TNoSymbolArea;
  PolyLineArea: TPolyLineArea;
  LineSection: TLineSection;

  AreaType: Integer;
begin
  try
    for i:=0 to GAreaManage.Count - 1 do
    begin
      area := GAreaManage.Items[i];
      if area.Area_Type = 0 then
      begin

        log := FormatFloat('##0.000000', area.CenterPoint.Longitude);
        lat := FormatFloat('##0.000000', area.CenterPoint.Latitude);

        LastLog := FormatFloat('##0.000000', area.LastPoint.Longitude);
        LastLat := FormatFloat('##0.000000', area.LastPoint.Latitude);

        json := '[{''IdStr'':'''+ IntToStr(area.ID)
                + ''',''Text'':''' + area.Name
                + ''',''Radius'':' + FloatToStr(area.Radius)
                + ',''log'':' + log
                + ',''lat'':' + lat
                + ',''LastLog'':' + LastLog
                + ',''LastLat'':' + LastLat
                + '}]';
      end else
      begin
        LngLatList := '';
        for j:=0 to area.PointCount-1 do
        begin
          WorldPoint := area.WorldPointAry[j];
          EarthPoint := Project.XY2LoLa(WorldPoint);
          LngLatList := LngLatList + FormatFloat('##0.000000', EarthPoint.Longitude) + ',' + FormatFloat('##0.000000', EarthPoint.Latitude) + ';';
        end;

        LngLatList := Copy(LngLatList, 1, length(LngLatList)-1);

        json := '[{''IdStr'':'''+ IntToStr(area.ID)
                + ''',''Text'':'''+ area.Name
                + ''',''PointCount'':' + IntToStr(area.PointCount)
                + ',''LngLatList'':''' + LngLatList + '''}]';
      end;

      ShowConfineArea(area.Area_Type, false, json);

    end;

    for i:=0 to FAllAreaManage.ALLCircleList.Count - 1 do
    begin
      kind := TBaseArea(FAllAreaManage.ALLCircleList.Items[i]).AreaPictureKind;
       case kind of
        0:  // 圆形
          begin
            CircleArea := TCircleArea(FAllAreaManage.ALLCircleList.Items[i]);
            log := FormatFloat('##0.000000', CircleArea.ACircle.X);
            lat := FormatFloat('##0.000000', CircleArea.ACircle.y);

            LastLog := FormatFloat('##0.000000', area.lastPoint.x);
            LastLat := FormatFloat('##0.000000', area.lastPoint.y);

            json := '[{''IdStr'':'''+ IntToStr(CircleArea.AreaID)
                    + ''',''Text'':'''+ CircleArea.AreaName
                    +''',''Radius'':' + inttostr(CircleArea.radius)
                    + ',''log'':' + log
                    + ',''lat'':' + lat
                    + ',''LastLog'':' + LastLog
                    + ',''LastLat'':' + LastLat
                    + '}]';
            AreaType := 0;
            ShowConfineArea(AreaType, true, json);
          end;
        1:  // 矩形
          begin
            RectangleArea := TRectangleArea(FAllAreaManage.ALLCircleList.Items[i]);

            LngLatList := FormatFloat('##0.000000', RectangleArea.leftPoint.Longitude) + ','
                       + FormatFloat('##0.000000', RectangleArea.leftPoint.Latitude) + ';'
                       + FormatFloat('##0.000000', RectangleArea.RightPoint.Longitude) + ','
                       + FormatFloat('##0.000000', RectangleArea.leftPoint.Latitude) + ';'
                       + FormatFloat('##0.000000', RectangleArea.RightPoint.Longitude) + ','
                       + FormatFloat('##0.000000', RectangleArea.RightPoint.Latitude) + ';'
                       + FormatFloat('##0.000000', RectangleArea.leftPoint.Longitude) + ','
                       + FormatFloat('##0.000000', RectangleArea.RightPoint.Latitude) + '';


            json := '[{''IdStr'':'''+ IntToStr(RectangleArea.AreaID)
                    + ''',''Text'':'''+ RectangleArea.AreaName
                    + ''',''PointCount'':' + IntToStr(4)
                    + ',''LngLatList'':''' + LngLatList + '''}]';
            AreaType := 2;
            ShowConfineArea(AreaType, true, json);
          end;
        2:  // 多边形
          begin
            NoSymbolArea := TNoSymbolArea(FAllAreaManage.ALLCircleList.Items[i]);
            LngLatList := '';
            for j:=0 to NoSymbolArea.PointCount-1 do
            begin
              WorldPoint := NoSymbolArea.WorldPointAry[j];
              EarthPoint := Project.XY2LoLa(WorldPoint);
              LngLatList := LngLatList + FormatFloat('##0.000000', EarthPoint.Longitude) + ',' + FormatFloat('##0.000000', EarthPoint.Latitude) + ';';
            end;
            LngLatList := Copy(LngLatList, 1, length(LngLatList)-1);

            json := '[{''IdStr'':'''+ IntToStr(NoSymbolArea.AreaID)
                    + ''',''Text'':'''+ NoSymbolArea.AreaName
                    + ''',''PointCount'':' + IntToStr(NoSymbolArea.PointCount)
                    + ',''LngLatList'':''' + LngLatList + '''}]';
            AreaType := 2;
            ShowConfineArea(AreaType, true, json);
          end;
          3:  // 路线
            begin
              PolyLineArea := TPolyLineArea(FAllAreaManage.ALLCircleList.Items[i]);

              for j := 0 to PolyLineArea.LineSectionCount-1 do
              begin
                LineSection := PolyLineArea.LineSections[j];
                LngLatList := '';
                for k:=0 to LineSection.PointCount-1 do
                begin
                  WorldPoint := LineSection.WPointAry[k];
                  EarthPoint := Project.XY2LoLa(WorldPoint);
                  LngLatList := LngLatList + FormatFloat('##0.000000', EarthPoint.Longitude) + ',' + FormatFloat('##0.000000', EarthPoint.Latitude) + ';';
                end;
                LngLatList := Copy(LngLatList, 1, length(LngLatList)-1);
                json := '[{''IdStr'':'''+ IntToStr(PolyLineArea.AreaID)
                    + ''',''Text'':'''+ PolyLineArea.AreaName
                    + ''',''RunWayIdStr'':''' + IntToStr(LineSection.LineSectionId)
                    + ''',''PointCount'':' + IntToStr(LineSection.PointCount)
                    + ',''LngLatList'':''' + LngLatList + '''}]';
                AreaType := 3;
                ShowConfineArea(AreaType, true, json);
              end;
            end;
       end;
    end;
  except
  end;
end;

function TMyExternal.GetConfineAreaToDev: OleVariant;
begin

end;

procedure TMyExternal.SetDevGeocodeSearch(const DevIdStr,
  Result: WideString);
begin
  try
      mainf.FDlg_DevAlarmCar.SetDevGeocodeSearch(DevIdStr, Result);
     //Dev := FAlarmInfoManage.find(StrToInt(DevIdStr));
     //Dev.AlarmPos := Result;
  except
  end;
end;

function TMyExternal.GetCenterCityLngLat(const CityName: WideString): OleVariant;
var
  mapNode: TMapNode;
  wp: TWorldPoint;
  ep: TEarthPoint;
  LngLat: string;
begin
  try
    LngLat := '';
    mapNode := MapManger.Find(CityName);
    if mapNode <> nil then
    begin
      wp.X:=(MapNode.OutBox.Xmin+MapNode.OutBox.Xmax) div 2;
      wp.Y:=(MapNode.OutBox.Ymin+MapNode.OutBox.Ymax) div 2;
      ep := Project.XY2LoLa(wp);
      LngLat := '{''log'':' + FormatFloat('##0.000000', ep.Longitude)
                + ',''lat'':' + FormatFloat('##0.000000', ep.Latitude)
                +'}';
    end;
  except
  end;
  LngLat := '[' + LngLat + ']';
  Result := LngLat;
end;

procedure TMyExternal.InitMap;
begin
  try
    InitBSMap;
  except
  end;
end;

function TMyExternal.GetMapIP: OleVariant;
begin
  try
    Result := GlobalParam.MapServerIp + ':' + IntToStr(GlobalParam.MapServerPort);
  except
  end;
end;


end.


