unit ShowBSMapFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, OleCtrls, SHDocVw, cxControls,
  cxSplitter, Menus, CarUnit, ActiveX, ExternalContainer, TextUnit,
  ComCtrls, MetaDefine, jpeg, MSHTML, ComObj;

type
  TDev = record
    log: string[8];
    lat: string[7];
    IdStr: string[12];
    CarNo: string[20];
  end;

  TShowBSMapFrm = class(TForm)
    Panel1: TPanel;
    SplitterRight: TcxSplitter;
    Panel2: TPanel;
    WebBrowser1: TWebBrowser;
    Timer1: TTimer;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Panel3: TPanel;
    Label1: TLabel;
    edtURL: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edtInterval: TEdit;
    edtDevCount: TEdit;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Memo1: TMemo;
    BitBtn5: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    BitBtn7: TBitBtn;
    PanelDeviceList: TPanel;
    Panel4: TPanel;
    CheckBoxIsShowFile: TCheckBox;
    BitBtnCloseMapManager: TBitBtn;
    StatusBar1: TStatusBar;
    PanelMapName: TPanel;
    TreeViewMap: TTreeView;
    Button3: TButton;
    Edit1: TEdit;
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Panel2CanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure BitBtn7Click(Sender: TObject);
    procedure TreeViewMapContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure TreeViewMapDblClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure WebBrowser1DocumentComplete(Sender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
    procedure NavigateMap();
  private
    { Private declarations }
    f: TExternalContainer;
    FCurrSelGroup: TDevGroup;
    FLastGroupWhenRefresh: TDevGroup;
    procedure  ApplicationEvents1Message(var   Msg:   tagMSG;
      var   Handled:   Boolean);
    procedure SetCurrSelGroup(const Value: TDevGroup);
  public
    { Public declarations }

    procedure Locate_Car(dev: TDevice);
    procedure Locate_DefinedText(Id: Integer);
    procedure ModifyOrDeleteDefinedMarker(m: Boolean; Id: Integer; Text: string);
    procedure DeleteAConfineArea(Id: Integer; BToDev: Boolean);
    procedure DeleteACircle(Id: Integer; BToDev: Boolean);
    procedure DeleteAllConfineArea(BToDev: Boolean);
    procedure ModifyAConfineArea(Id: Integer; Text: string; Color: string; BToDev: Boolean);
    procedure Locate_ConfineArea(log: Double; lat: Double);
    procedure PutHistroyGpsData(data: OleVariant); overload;
    procedure PutHistroyGpsData(IdStr: string; CarNo: string; Log: Integer; Lat: Integer); overload;
    procedure PutHistroyGpsDataJSON(JSON: string);
    procedure ClearHistroyInfo;
    procedure PlayNextHistroyGpsData;
    procedure PlayPreviousHistroyGpsData;
    procedure MoveTrackBar(Recede: Boolean; num: Integer);
    procedure SetIsPlayHistroy(isPlay: Boolean);
    procedure StopPlayHistroy();
    procedure SetTimeInterval(Interval: Integer);
    procedure SetTimeEnable(B: Boolean);
    procedure SetAllMap(log, lat: Double; Scale: Integer);
    procedure ChangeCity(log, lat: double; Scale: Integer; City: string);
    procedure OpenMap();
    function GetMapCurrentZoom(): Integer;
    function GetBoundsLatLng: string;
    procedure Locate_FollowDevice;   // 将跟踪的车辆在地图上居中
    procedure LocateOnMap(ep: TEarthPoint; text: string);
    procedure printMap;
    procedure FinishDrawLine(Value: string);
    procedure CancelDrawLines(Value: string);
    procedure DeleteLines(Value: string);
    procedure SetCurrentMouseTool;
    procedure ShowConfineArea(AreaType: integer; BToDev: Boolean; Param: string);
    procedure HideOrShowAConfieArea(AreaId: integer; AreaType: integer; BShow: boolean);
    procedure SaveScreenToGif(FileName: string);
    procedure DevGeocodeSearch(DevId: string; log, lat: double);
    procedure MoveHisDev(Postion: integer);
    procedure HindOrShowACar(DevId: string; bHide: boolean);
    procedure SetMapDivSize;
    procedure InitMap;
    procedure refreshADev(dev: TDevice);
    procedure clearAll;
    procedure locateCar(carNo: string; log, lat, Speed: Double; Orientation: Integer; Color: string);
    procedure ClearAllDev;
    property CurrSelGroup: TDevGroup read FCurrSelGroup write SetCurrSelGroup;
    property LastGroupWhenRefresh: TDevGroup read FLastGroupWhenRefresh;
  end;

var
  ShowBSMapFrm: TShowBSMapFrm;
   HookID:   THandle;

implementation
uses MapManagerUnit, ugloabVar, umainf, MapPubUnit, ConstDefineUnit;
{$R *.dfm}

procedure GenerateJPEGfromBrowser(browser: iWebBrowser2;
                                  jpegFQFilename: string; srcHeight:
                                  integer; srcWidth: integer;
                                  tarHeight: integer; tarWidth: integer);
var
  sourceDrawRect: TRect;
  targetDrawRect: TRect;
  sourceBitmap : TBitmap;
  targetBitmap : TBitmap;
  aJPG          : TJPEGImage;
  aViewObject   : IViewObject;
begin { GenerateJPEGfromBrowser }
  sourceBitmap := TBitmap.Create;
  targetBitmap := TBitmap.Create;
  aJPG := TJPEGImage.Create;
  try
      try
        sourceDrawRect := Rect(0, 0, srcWidth, srcHeight);
        sourceBitmap.Width := srcWidth;
        sourceBitmap.Height := srcHeight;

        aViewObject := browser as IViewObject;

        if aViewObject=nil then
          Exit;

        OleCheck(aViewObject.Draw(DVASPECT_CONTENT, 1, nil, nil,
                                 FDlg_BSMap.Handle,
                                 sourceBitmap.Canvas.Handle,
                                 @sourceDrawRect, nil, nil, 0));

        // Resize the src bitmap to the target bitmap
        // Need to make thumbnails instead of full size?
        // set the target size here.. 
        targetDrawRect := Rect(0, 0, tarWidth, tarHeight);
        targetBitmap.Height := tarHeight;
        targetBitmap.Width := tarWidth;
        targetBitmap.Canvas.StretchDraw(targetDrawRect, sourceBitmap);

        // Create a JPEG from the Bitmap and save it
        aJPG.Assign(targetBitmap);

        aJPG.SaveToFile(jpegFQFilename)
      finally
        aJPG.Free;
        sourceBitmap.Free;
        targetBitmap.Free
      end;

  except

  end;
end;



procedure TShowBSMapFrm.Timer1Timer(Sender: TObject);
  function VariantToDev(Value: OleVariant): TDev;
  var
    p:PChar;
    Size: Cardinal;
  begin
    size:=VarArrayHighBound(Value,1);
    p:=VarArrayLock(Value);
    try
      Move(p^, Result, Size+1)
    finally
      VarArrayUnlock(Value);
    end;
  end;

  function GetDevVariant(FDev: TDev): OleVariant;
  var
    p:PChar;
    Size: Cardinal;
  begin
    Size := SizeOf(FDev);
    Result:=VarArrayCreate([0,Size - 1],VarByte);
    p:=VarArrayLock(Result);
    try
      Move(FDev, p^, Size);
    finally
      VarArrayUnlock(Result);
    end;
  end;
var
  json: string;
  devCount: Integer;
  zoom: Integer;
  BoundsLatLng: string;
  isFirstAfterChangeGroup: Boolean;
begin
  try
    Timer1.Enabled := False;
    isFirstAfterChangeGroup := False;
    try
      if FCurrSelGroup <> FLastGroupWhenRefresh then
      begin
        isFirstAfterChangeGroup := True;
        FLastGroupWhenRefresh := FCurrSelGroup;
        ClearAllDev;
      end;

      if FLastGroupWhenRefresh = nil then
        Exit;

      Locate_FollowDevice;
      zoom := GetMapCurrentZoom;
      BoundsLatLng := GetBoundsLatLng;
      case zoom of
        0:  devCount := ADeviceManage.Count;
        1:  devCount := ADeviceManage.Count;
        2:  devCount := ADeviceManage.Count;
        3:  devCount := ADeviceManage.Count div 4;
        4:  devCount := ADeviceManage.Count div 4;
        5:  devCount := ADeviceManage.Count div 4;
        6:  devCount := ADeviceManage.Count div 4;
        7:  devCount := ADeviceManage.Count div 4;
        8:  devCount := ADeviceManage.Count div 5;
        9:  devCount := ADeviceManage.Count div 5;
        10: devCount := ADeviceManage.Count div 5;
        11: devCount := ADeviceManage.Count div 5;
        12: devCount := ADeviceManage.Count div 5;
        13: devCount := ADeviceManage.Count div 5;
      else
      end;
      devCount := FLastGroupWhenRefresh.DevList.Count;//ADeviceManage.Count;
      if isFirstAfterChangeGroup then
        json := GetJsonDevListAfterChangeGroup(BoundsLatLng)
      else
        json := GetJsonDevList(BoundsLatLng);
      if json <> '' then
        WebBrowser1.OleObject.document.parentWindow.RefreshDevList(json);

      devCount := AGovDeviceManage.Count;
      json := GetGovDevList(devCount, BoundsLatLng);
      WebBrowser1.OleObject.document.parentWindow.RefreshDevList(json);
    except
    end;
  finally
    Timer1.Enabled := True;  
  end;
end;

procedure TShowBSMapFrm.BitBtn1Click(Sender: TObject);
var
  v:oleVariant;
  i: Integer;
  json: string;
  EarthPoint: TEarthPoint;
  log, lat: string;
begin
  v:= edtURL.Text; //'http://www.51ditu.com';           //初始化 WebBrowser1
  WebBrowser1.Navigate(v);

//  for i:=0 to GTextManage.Count - 1 do
//  begin
//    EarthPoint := Project.XY2LoLa(GTextManage.Item[i].Symbol.Position);
//    log := Copy(FloatToStr(EarthPoint.Longitude * 1000000 + 5100), 1, 8);
//    lat := Copy(FloatToStr(EarthPoint.Latitude * 1000000 - 2120), 1, 7);
//    if i = GTextManage.Count - 1 then
//      json := json + '{''log'':' + log + ',''lat'':' + lat + ',''Text'':''' + GTextManage.Item[i].Text + ''',''IdStr'':''' + IntToStr(GTextManage.Item[i].ID) + '''}'
//    else
//      json := json + '{''log'':' + log + ',''lat'':' + lat + ',''Text'':''' + GTextManage.Item[i].Text + ''',''IdStr'':''' + IntToStr(GTextManage.Item[i].ID) + '''},';
//  end;
//  json := '[' + json + ']';
//  WebBrowser1.OleObject.document.parentWindow.InitDefinedMarker(json);

  Timer1.Enabled := False;
  Timer1.Interval := StrToInt(Trim(edtInterval.Text));
  //Timer1.Enabled := True; 
end;

procedure TShowBSMapFrm.BitBtn2Click(Sender: TObject);
begin
  try
    Timer1.Enabled := False;
    Timer1.Interval := StrToInt(Trim(edtInterval.Text));
    Timer1.Enabled := True;
  except
  end;
end;

procedure TShowBSMapFrm.BitBtn3Click(Sender: TObject);
begin
  try
    WebBrowser1.OleObject.document.parentWindow.clear();
  except
  end;
end;

procedure TShowBSMapFrm.BitBtn4Click(Sender: TObject);
//var
//  s: string;
//  ps: Integer;
//  i, count: Integer;
//  e: TEarthPoint;
//  p: TPoint;
begin
//  count := Memo1.Lines.Count;
//  for i:=0 to count-1 do
//  begin
//    s := Memo1.Lines[i];
//    ps := pos(',', s);
//    e.Longitude :=  StrToFloat(Copy(s, 1, ps-1)) -0.005100;
//    e.Latitude := StrToFloat(Copy(s, ps+1, Length(s))) + 0.002120;
//    p := FMap.Projection.LoLa2XY(e);
//    GCurSelectDev.TraceList.AddPoint(p);
//
//  end;
//  //drawlayer.DrawACarCourse(GCurSelectDev);
end;

procedure TShowBSMapFrm.ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
var
  mPoint: TPoint;
begin
  try
    if IsChild(WebBrowser1.Handle, Msg.Hwnd) then
    begin
      if (Msg.Message = WM_RBUTTONDOWN) or (Msg.Message = WM_RBUTTONUP) then
      begin
        GetCursorPos(mPoint);
        Mainf.PopupMenu_funDev.Popup(mPoint.X, mPoint.Y);
        Handled:=True;
      end
      else if (Msg.message = WM_LBUTTONDOWN) then
      begin
        GetCursorPos(mPoint);
        Mainf.setMouseCurrXY(mPoint);
      end;  
    end;
  except
  end;
end;

procedure TShowBSMapFrm.FormShow(Sender: TObject);
begin
  try
    try
      SplitterRight.CloseSplitter;
      if MapManger.DefaultNode <> nil then
      begin
        PanelMapName.Caption := '当前地图区域－' +  MapManger.DefaultNode.Name;
      end
      else
      begin
        PanelMapName.Caption := '当前地图区域－' + '南京市';
      end;

      Application.OnMessage := ApplicationEvents1Message;
      NavigateMap;
      //WebBrowser1.Navigate('http://218.206.107.18:7106/map.html');
    except
    end;
  finally

  end;
end;

procedure TShowBSMapFrm.Locate_Car(dev: TDevice);
var
  ColorStr: string;
  GpsTime: string;
begin
  try
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

    if dev.GpsTime = 0 then
      GpsTime := ''
    else
      GpsTime := FormatDateTime('YYYY-MM-DD hh:nn:ss', dev.GpsTime);

    WebBrowser1.OleObject.document.parentWindow.Locate_car(dev.Longitude + LogOffSet,
                                                          dev.Latitude + LatOffSet,
                                                          dev.IdStr, dev.car.No, ColorStr,
                                                          Dev.Login_DriverName + '('+Dev.Login_Driver+')', dev.SimNo,
                                                          FormatFloat('##0.0', Dev.Speed/10), Dev.Orientation,
                                                          getCarAngle(Dev.Orientation),
                                                          GpsTime, DEV.Car.CPColorStr, dev.Car.IndustryName,
                                                          dev.Car.ShengName + dev.Car.ShiName);
  except
  end;
end;

procedure TShowBSMapFrm.Locate_DefinedText(Id: Integer);
begin
  try
    WebBrowser1.OleObject.document.parentWindow.Locate_DefinedMarker(Id);
  except
  end;
end;

procedure TShowBSMapFrm.ModifyOrDeleteDefinedMarker(m: Boolean; Id: Integer; Text: string);
begin
  try
    WebBrowser1.OleObject.document.parentWindow.ModifyOrDeleteDefinedMarker(m, Id, Text);
  except
  end;
end;

procedure TShowBSMapFrm.DeleteAConfineArea(Id: Integer; BToDev: Boolean);
begin
  try
    WebBrowser1.OleObject.document.parentWindow.DeleteAConfineArea(Id, BToDev);
  except
  end;
end;

procedure TShowBSMapFrm.DeleteACircle(Id: Integer; BToDev: Boolean);
begin
  try
    WebBrowser1.OleObject.document.parentWindow.DeleteCircle(Id, BToDev);
  except
  end;
end;

procedure TShowBSMapFrm.BitBtn5Click(Sender: TObject);
begin
  try
    Timer1.Enabled := not Timer1.Enabled;
    if Timer1.Enabled then
      BitBtn5.Caption := '停止刷新'
    else
      BitBtn5.Caption := '开始刷新';
  except
  end;
end;

procedure TShowBSMapFrm.ClearHistroyInfo;
begin
  try
    Timer1.Enabled := False;
    WebBrowser1.OleObject.document.parentWindow.clearHistroyInfo_New();
  except
  end;
end;

procedure TShowBSMapFrm.PutHistroyGpsData(data: OleVariant);
begin
  try
    WebBrowser1.OleObject.document.parentWindow.PutHistroyGpsData(data);
  except
  end;
 { WebBrowser1.OleObject.document.parentWindow.PutHistroyGpsData(Copy(FloatToStr(dev.Longitude * 1000000 + 5100), 1, 8),
                                                        Copy(FloatToStr(dev.Latitude * 1000000 - 2120), 1, 7),
                                                        dev.IdStr, dev.car.No);  }
end;

procedure TShowBSMapFrm.PutHistroyGpsData(IdStr: string; CarNo: string; Log: Integer; Lat: Integer);
begin
  try
    WebBrowser1.OleObject.document.parentWindow.PutHistroyGpsData(Copy(FloatToStr(Log + LogOffSet), 1, 8),
                                                        Copy(FloatToStr(Lat + LatOffSet), 1, 7),
                                                        IdStr, CarNo);
  except
  end;
end;

procedure TShowBSMapFrm.PutHistroyGpsDataJSON(JSON: string);
begin
  try
    WebBrowser1.OleObject.document.parentWindow.PutHistroyGpsDataJSON_New(JSON);
  except
  end;
end;

procedure TShowBSMapFrm.SetTimeInterval(Interval: Integer);
begin
  try
    WebBrowser1.OleObject.document.parentWindow.SetTimeInterval(Interval);
  except
  end;
end;

procedure TShowBSMapFrm.SetTimeEnable(B: Boolean);
begin
  try
    Timer1.Enabled := B;
  except
  end;
end;

procedure TShowBSMapFrm.Button1Click(Sender: TObject);
  function VariantToDev(Value: OleVariant): TDev;
  var
    p:PChar;
    Size: Cardinal;
  begin
    size:=VarArrayHighBound(Value,1);
    p:=VarArrayLock(Value);
    try
      Move(p^, Result, Size+1)
    finally
      VarArrayUnlock(Value);
    end;
  end;

  function GetDevVariant(FDev: TDev): OleVariant;
  var
    p:PChar;
    Size: Cardinal;
  begin
    Size := SizeOf(FDev);
    Result:=VarArrayCreate([0,Size - 1],VarByte);
    p:=VarArrayLock(Result);
    try
      Move(FDev, p^, Size);
    finally
      VarArrayUnlock(Result);
    end;
  end;
var
  log, lat: string;
  i: Integer;
  dev: TDevice;
  p: TPoint;
  devCount: Integer;
  d, d1: OleVariant;
  dd: TDev;
  json: string;
begin

           json := '[{''latitude'':116.40091896057129,''longitude'':39.931129903495886}, '
            +'{''latitude'':116.40091896057129,''longitude'':39.931129903495886},'
            +'{''latitude'':116.40091896057129,''longitude'':39.931129903495886}]';
      WebBrowser1.OleObject.document.parentWindow.AddDev2(json);
  for i := 0 to 5 do//ADeviceManage.Count - 1 do
  begin
    dev := ADeviceManage.Items[i];
    //if Dev.Switch[STAT_GPS_LOCATE] then
    //begin
      log := Copy(FloatToStr(dev.Longitude * 1000000 + LogOffSet), 1, 8);
      lat := Copy(FloatToStr(dev.Latitude * 1000000 + LatOffSet), 1, 7);

    //end;
  end;

end;

procedure TShowBSMapFrm.FormCreate(Sender: TObject);
begin
  FCurrSelGroup := nil;
  FLastGroupWhenRefresh := nil;
  try
    f := TExternalContainer.Create(WebBrowser1);
  except
  end;
end;

procedure TShowBSMapFrm.Button2Click(Sender: TObject);
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
      log := Copy(FloatToStr(EarthPoint.Longitude * 1000000 + LogOffSet), 1, 8);
      lat := Copy(FloatToStr(EarthPoint.Latitude * 1000000 + LatOffSet), 1, 7);
      if i = GTextManage.Count - 1 then
        json := json + '{''log'':' + log + ',''lat'':' + lat + ',''Text'':''' + GTextManage.Item[i].Text + ''',''IdStr'':''' + IntToStr(GTextManage.Item[i].ID) + '''}'
      else
        json := json + '{''log'':' + log + ',''lat'':' + lat + ',''Text'':''' + GTextManage.Item[i].Text + ''',''IdStr'':''' + IntToStr(GTextManage.Item[i].ID) + '''},';
    end;
    json := '[' + json + ']';
    WebBrowser1.OleObject.document.parentWindow.InitDefinedMarker(json);
  except
  end;
end;

procedure TShowBSMapFrm.DeleteAllConfineArea(BToDev: Boolean);
begin
  try
    WebBrowser1.OleObject.document.parentWindow.DeleteAllConfineArea(BToDev);
  except
  end;
end;

procedure TShowBSMapFrm.ModifyAConfineArea(Id: Integer; Text,
  Color: string; BToDev: Boolean);
begin
  try
    WebBrowser1.OleObject.document.parentWindow.ModifyAConfineArea(Id, Text, Color, BToDev);
  except
  end;
end;

procedure TShowBSMapFrm.Locate_ConfineArea(log, lat: Double);
var
  logitude, latitude: string;
begin
  try
    //logitude := Copy(FloatToStr(log * 1000000 + LogOffSet), 1, 8);
    //latitude := Copy(FloatToStr(lat * 1000000 + LatOffSet), 1, 7);
    WebBrowser1.OleObject.document.parentWindow.Locate_Area(log, lat);
  except
  end;
end;

procedure TShowBSMapFrm.Panel2CanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  try
    //SetMapDivSize(NewWidth, NewHeight);          
    WebBrowser1.OleObject.document.parentWindow.SetMapDiv(NewWidth, NewHeight);
  except
  end;
end;

procedure TShowBSMapFrm.BitBtn7Click(Sender: TObject);
var
  StrStream:TStringStream;

  vWebDoc:   OleVariant;
begin

  //vWebDoc   :=   WebBrowser1.Document;
  //vWebDoc.write(SetNoteStr);



  //SetNoteStr :='<script language="javascript"> function onload(){alert(1);} </script> <body onLoad="onload()"  bgcolor=222222 align=center><br><p align=center><font size=+2 color=#FFFFFF>点点博客 http://seelearn.com</font></p>';
  //SetNoteStr :=SetNoteStr+'<br><p align=center><font size=+2 color=#FFFFFF>点击左边按钮可查看对应图片</font></p>';

  //StrStream:=TStringStream.Create(SetNoteStr);
  WebBrowser1.Navigate('about:blank');
  
  try
   StrStream.Position:=0;
   ( WebBrowser1.Document as IPersistStreamInit).Load(TStreamadapter.Create(StrStream));
  finally
    StrStream.Free;
  end;
end;

procedure TShowBSMapFrm.SetAllMap(log, lat: Double; Scale: Integer);
begin
  try
    WebBrowser1.OleObject.document.parentWindow.SetAllMap(log, lat, Scale);
  except
  end;
end;

procedure TShowBSMapFrm.ChangeCity(log, lat: double; Scale: Integer; City: string);
begin
  try
    PanelMapName.Caption := '当前地图区域－' + City;
    WebBrowser1.OleObject.document.parentWindow.ChangeCity(log, lat, Scale, City);
    //SetLogLatOffSet(City);
  except
  end;
end;

procedure TShowBSMapFrm.TreeViewMapContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  Node: TTreeNode;
begin
  try
    Node := TreeViewMap.GetNodeAt(MousePos.X, MousePos.y);
    if Node <> nil then
      Node.Selected := true;
  except
  end;
end;

procedure TShowBSMapFrm.TreeViewMapDblClick(Sender: TObject);
var
  TreeNode: TTreeNode;
  MapNode: TMapNode;
  temp: TMapNode;
  MapName: string;
  wp: TWorldPoint;
  ep: TEarthPoint;
begin
  try
    TreeNode := TreeViewMap.Selected;
    if TreeNode <> nil then
    begin
      MapNode := TMapNode(TreeNode.Data);
      if MapNode <> nil then
      begin
        if MapNode.Name = '全国' then
        begin
          //SetAllMap(109.43577, 37.47786, 4);
          ChangeCity(109.43577, 37.47786, 4,  MapNode.Name);
        end else
        begin

          wp.X:=(MapNode.OutBox.Xmin+MapNode.OutBox.Xmax) div 2;
          wp.Y:=(MapNode.OutBox.Ymin+MapNode.OutBox.Ymax) div 2;
          ep := Project.XY2LoLa(wp);

          ChangeCity(ep.Longitude, ep.Latitude, 10,  MapNode.Name);

          temp := MapNode.ParentNode;
          MapName := MapNode.Name;
          if temp <> nil then
          begin
            while (temp.Name <> '全国') do
            begin
              MapName := temp.Name + '->' + MapName;
              temp := temp.ParentNode;
              if (temp = nil) then break;
            end;
          end;
        end;
      end
      else
      begin
        ChangeCity(109.43577, 37.47786, 4,  MapNode.Name);
        //ChangeMap('南京市');
      end;
    end;
  except
  end;
end;

procedure TShowBSMapFrm.OpenMap;
var
  StrStream:TStringStream;

  Res: TResourceStream;
  buf: array[0..1000000] of char;
  sHTML: string;
begin
  try
    try
      Res := TResourceStream.Create(HInstance, 'map', PChar('myrc')); //将资源保存为文件，即还原文件
      res.Read(buf, res.Size);                                        //还可以进行流操作，取出文本文件的内容到一个字符串变量中
      sHTML := buf;                                                   //将 pchar 类型转换为 string 类型
      StrStream:=TStringStream.Create(sHTML);

      StrStream.Position:=0;
      ( WebBrowser1.Document as IPersistStreamInit).Load(TStreamadapter.Create(StrStream));
    except
    end;
  finally
    StrStream.Free;
    Res.Free;
  end;
end;

procedure TShowBSMapFrm.SetIsPlayHistroy(isPlay: Boolean);
begin
  try
    //WebBrowser1.OleObject.document.parentWindow.SetBPlayHistroyGpsData(isPlay);
  except
  end;
end;

procedure TShowBSMapFrm.StopPlayHistroy;
begin
  try
    WebBrowser1.OleObject.document.parentWindow.EndPlay_New();
  except
  end;
end;

procedure TShowBSMapFrm.PlayNextHistroyGpsData;
begin
  try
    //WebBrowser1.OleObject.document.parentWindow.next();
  except
  end;
end;

procedure TShowBSMapFrm.PlayPreviousHistroyGpsData;
begin
  try
    //WebBrowser1.OleObject.document.parentWindow.previous();
  except
  end;
end;

procedure TShowBSMapFrm.MoveTrackBar(Recede: Boolean; num: Integer);
begin
  try
    //WebBrowser1.OleObject.document.parentWindow.MoveTrackBar(Recede, num);
  except
  end;
end;

function TShowBSMapFrm.GetMapCurrentZoom: Integer;
begin
  try
    Result := WebBrowser1.OleObject.document.parentWindow.GetCurrentZoom();
  except
  end;
end;

function TShowBSMapFrm.GetBoundsLatLng: string;
begin
  try
    Result := WebBrowser1.OleObject.document.parentWindow.GetBoundsLatLng();
  except
  end;
end;

procedure TShowBSMapFrm.Locate_FollowDevice;
var
  BoundsLatLng: string;
  bounds: array of string;
  MaxLat,MinLog : Double;       // 左上角 (最大纬度、最小经度)
  MinLat,MaxLog: Double;       // 右下角 (最小纬度，最大经度)
  j: Integer;
begin
  try
    if AutoFollowDevice <> nil then
    begin
      BoundsLatLng := GetBoundsLatLng;
      bounds := Split(BoundsLatLng, ';');
      if Length(bounds) = 2 then
      begin
        j := Pos(',', bounds[0]);
        MinLog := StrToFloat(Copy(bounds[0], 1, j-1));
        MaxLat := StrToFloat(Copy(bounds[0], j+1, Length(bounds[0])));

        j := Pos(',', bounds[1]);
        MaxLog := StrToFloat(Copy(bounds[1], 1, j-1));
        MinLat := StrToFloat(Copy(bounds[1], j+1, Length(bounds[1])));

        if (AutoFollowDevice.Longitude > MinLog) and (AutoFollowDevice.Longitude < MaxLog)
          and (AutoFollowDevice.Latitude > MinLat) and (AutoFollowDevice.Latitude < MaxLat) then
        begin
        end else
        begin
          Locate_Car(AutoFollowDevice);
        end;
      end;
    end;
  except
  end;
end;

procedure TShowBSMapFrm.LocateOnMap(ep: TEarthPoint; text: string);
var
  log, lat: string;
begin
  try
    log := Copy(FloatToStr(ep.Longitude * 1000000 + LogOffSet), 1, 8);
    lat := Copy(FloatToStr(ep.Latitude * 1000000 + LatOffSet), 1, 7);
    WebBrowser1.OleObject.document.parentWindow.LocateOnMap(Log, Lat, text);
  except
  end;
end;

procedure TShowBSMapFrm.printMap;
begin
  try
    WebBrowser1.ExecWB(7,1) //打印预览
    //WebBrowser1.ExecWB(OLECMDID_PRINT, OLECMDEXECOPT_PROMPTUSER)
    //WebBrowser1.OleObject.document.parentWindow.printMap();
  except
  end;
end;

procedure TShowBSMapFrm.FinishDrawLine(Value: string);
begin
  try
    WebBrowser1.OleObject.document.parentWindow.FinishDrawLine(Value);
  except
  end;
end;

procedure TShowBSMapFrm.CancelDrawLines(Value: string);
begin
  try
    WebBrowser1.OleObject.document.parentWindow.CancelDrawLines(Value);
  except
  end;
end;

procedure TShowBSMapFrm.DeleteLines(Value: string);
begin
  try
    WebBrowser1.OleObject.document.parentWindow.DeleteLines(Value);
  except
  end;
end;

procedure TShowBSMapFrm.Button3Click(Sender: TObject);
begin
//  WebBrowser1.Navigate(edit1.text);
end;

procedure TShowBSMapFrm.SetCurrentMouseTool;
begin
  try
    WebBrowser1.OleObject.document.parentWindow.CurrentMouseTool;
  except
  end;
end;

procedure TShowBSMapFrm.ShowConfineArea(AreaType: integer; BToDev: Boolean;
  Param: string);
begin
  try
    WebBrowser1.OleObject.document.parentWindow.ShowConfineArea(AreaType, BToDev, Param);
  except
  end;
end;

procedure TShowBSMapFrm.HideOrShowAConfieArea(AreaId, AreaType: integer;
  BShow: boolean);
begin
  try
    WebBrowser1.OleObject.document.parentWindow.HideOrShowAConfieArea(AreaId, AreaType, BShow);
  except
  end;
end;

procedure TShowBSMapFrm.SaveScreenToGif(FileName: string);
var
  IDoc1: IHTMLDocument2;
  Web : iWebBrowser2;
  tmpX,
  tmpY : integer;
begin { TForm1.Button2Click }
  try
    with WebBrowser1 do
    begin
      Document.QueryInterface(IHTMLDocument2, IDoc1);
      Web := ControlInterface;
      tmpX := Height;
      tmpY := Width;
      Height := OleObject.Document.ParentWindow.Screen.Height;
      Width := OleObject.Document.ParentWindow.Screen.Width;
      GenerateJPEGfromBrowser(Web, FileName,
                              Height, Width,
                              Height, Width);
      Height := tmpX;
      Width := tmpY;
    end;
  except
  end;
end;

procedure TShowBSMapFrm.DevGeocodeSearch(DevId: string; log, lat: double);
begin
  try
    WebBrowser1.OleObject.document.parentWindow.DevGeocodeSearch(DevId, log, lat);
  except
  end;
end;

procedure TShowBSMapFrm.MoveHisDev(Postion: integer);
begin
  try
    WebBrowser1.OleObject.document.parentWindow.MoveHisDev(Postion);
  except
  end;
end;

procedure TShowBSMapFrm.HindOrShowACar(DevId: string; bHide: boolean);
begin
  try
    WebBrowser1.OleObject.document.parentWindow.HindOrShowACar(DevId, bHide);  
  except
  end;
end;

procedure TShowBSMapFrm.SetMapDivSize;
begin
  try
    WebBrowser1.OleObject.document.parentWindow.SetMapDiv(Panel2.Width, Panel2.Height);
  except
  end;
end;

procedure TShowBSMapFrm.InitMap;
begin
  try
    WebBrowser1.OleObject.document.parentWindow.InitMap(GlobalParam.MapServerIp + ':' + IntToStr(GlobalParam.MapServerPort));
  except
  end;
end;

procedure TShowBSMapFrm.FormDestroy(Sender: TObject);
begin
  if f <> nil then
    f.Free;
end;

procedure TShowBSMapFrm.refreshADev(dev: TDevice);
var
  json: string;
  log, lat, ColorStr, GpsTime: string;
begin
  if dev = nil then
    Exit;

  log := FormatFloat('##0.000000', dev.Longitude + LogOffSet); //Copy(FloatToStr(dev.Longitude + LogOffSet), 1, 8);
  lat := FormatFloat('##0.000000', dev.Latitude + LatOffSet);//Copy(FloatToStr(dev.Latitude + LatOffSet), 1, 7);
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
  
  if dev.GpsTime = 0 then
    GpsTime := ''
  else
    GpsTime := FormatDateTime('YYYY-MM-DD hh:nn:ss', dev.GpsTime);
  try
    json := '{''log'':' + log + ',''lat'':' + lat + ',''IdStr'':''' + dev.IdStr
            + ''',''CarNo'':''' + dev.Car.No + ''',''ColorStr'':''' + ColorStr
            + ''',''Driver'':''' + Dev.Login_DriverName + '('+Dev.Login_Driver+')' +''',''SIM'':''' + dev.SimNo
            + ''',''SPEED'':''' + FormatFloat('##0.0', Dev.Speed/10)
            + ''',''Orientation'':''' + IntToStr(Dev.Orientation)
            + ''',''OrientationStr'':''' + getCarAngle(Dev.Orientation)
            + ''',''CarColor'':''' + Dev.Car.CPColorStr
            + ''',''City'':''' + Dev.Car.ShengName + Dev.Car.ShiName
            + ''',''IndustryName'':''' + Dev.Car.IndustryName
            + ''',''GpsTime'':''' + GpsTime + '''}';
    WebBrowser1.OleObject.document.parentWindow.RefreshDevList(json);
  except

  end;
end;

procedure TShowBSMapFrm.WebBrowser1DocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
var
  s: string;
begin
  s := (WebBrowser1.Document as IHTMLDocument2).body.innerText;
  if (Pos('HTTP Status 404', s) > 0) then
  begin
    NavigateMap;
  end;
end;

procedure TShowBSMapFrm.NavigateMap;
var
  url: string;
begin
  url := 'http://'+ GlobalParam.MapServerIp;
  if GlobalParam.MapServerPort <> 0 then
    url := url + ':' + IntToStr(GlobalParam.MapServerPort);
  url := url + '/map.html';
  WebBrowser1.Navigate(url);
end;

procedure TShowBSMapFrm.clearAll;
begin
  try
    WebBrowser1.OleObject.document.parentWindow.clear();
  except
  end;
end;

procedure TShowBSMapFrm.locateCar(carNo: string; log, lat, Speed: Double;
  Orientation: Integer; Color: string);
begin
  try
    WebBrowser1.OleObject.document.parentWindow.Local_HisCar_New(carNo, FormatFloat('0.000000', log), FormatFloat('0.000000', lat), FormatFloat('0.0', Speed/10), Orientation, Color);
  except

  end;
end;

procedure TShowBSMapFrm.SetCurrSelGroup(const Value: TDevGroup);
begin
  if FCurrSelGroup <> Value then
  begin
    FCurrSelGroup := Value;
  end;
end;

procedure TShowBSMapFrm.ClearAllDev;
begin
  try
    WebBrowser1.OleObject.document.parentWindow.ClearAllDev();
  except

  end;
end;

end.
