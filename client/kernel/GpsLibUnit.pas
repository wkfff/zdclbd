{ 画小车，画电子围栏
  @author(sha)
  @created()
  @lastmod(GMT:$Date: 2012/10/29 01:46:42 $) <BR>
  最后更新人:$Author: wfp $  <BR>
  当前版本:$Revision: 1.1.1.1 $  <BR>}
unit GpsLibUnit;

interface
uses
  Windows, classes, Graphics, emapker, emape, ExtCtrls, tyoGraph,
  emapdex, MetaDefine, geome, carunit, math, Types, ClipCalc, Controls, Messages, ConstDefineUnit;


const
  actSelectTarget = 50;
  DRAWSelectDevCnt = 50; //当用户在地图上框选车辆时，选中数大于50时，不画

type
  TUserSelectDevEvent = procedure(Sender: TObject; PointA, PointB: TEarthPoint) of object;
  TEmptyFullEvent = procedure(Sender: TObject; AEmptyCount, AFullCount: integer) of object;
  TUserSelectDevCntTooManyEvent = procedure of object;
  TReDrawMap = procedure(Sender: TObject; Dev: TDevice) of object;

  TGpsMap = class;
  TGpsDataLayer = class;
  TGpsDrawLayer = class;

  TGpsDataLayer = class(TEditDataLayer)
  public
    class function GetIdentification: Longword; override;
    { Procedure: AddNewMeta<br>
     添加一个新的图元,并返回这个图元的MetaIndex
     @Return Integer
     @see @link()}
    function AddNewMeta: Integer;
    function RemoveMetaByIndex(AIndex: integer): boolean; override;
  end;

  TGpsDrawLayer = class(TDrawLayer)
  private
    FGpsMap: TGpsMap;
    FFont: TTrueFontStruct;
    FAutoFollowDevice: TDevice;
    FEmptyFullEvent: TEmptyFullEvent;
    FOnReDrawMap: TReDrawMap;
    FDev: TDevice;
    procedure SetGpsMap(const Value: TGpsMap);
    procedure SetAutoFollowDevice(const Value: TDevice);
    procedure SetDev(const Value: TDevice);
  private
    procedure DrawLine(DC: HDC; line: TMetaStruct);
  protected
   { Procedure: DrawACarCourse<br>
     画出车辆的轨迹
     @param AGpsDataCar: TGpsDataCar
     @see @link()}
    //画轨迹函数
    procedure DrawACarCourse(ADevice: TDevice); virtual;

    {当车辆越出区域或驶入区域报警时，画椭圆框或虚方框}
    procedure DrawRectIfOutorInAlarmArea(m: TDevice; CarCurrPos: TPoint);
  public
    constructor Create; override;
    class function GetIdentification: Longword; override;
    procedure HighLightSelectedMetas(DC: HDC); override;
   { Procedure: Draw<br>
     画出图层上的图元(目标车辆)
     @param
     @param
     @Return None
     @see @link()}
    function Draw: boolean; override;
    {画出图层上的 限定区域}
    procedure DrawConfineArea;
    function ClipDraw(DC: HDC; Rect: TWorldRect; Canvas: TCanvas): boolean; override;
    //是否须要重画,当跟踪车辆跑出地图后要重画地图.
    function IsRedrawMap: Boolean; virtual;
//    PROCEDURE CMEraseBkgnd(var Message:TWMEraseBkgnd);Message WM_ERASEBKGND;

    {property GpsMap: TGpsMap;<br />
    指向GpsMap}
    property GpsMap: TGpsMap read FGpsMap write SetGpsMap;
    property AutoFollowDevice: TDevice read FAutoFollowDevice write SetAutoFollowDevice;
    property OnEmptyFull: TEmptyFullEvent read FEmptyFullEvent write FEmptyFullEvent;
    property OnReDrawMap: TReDrawMap read FOnReDrawMap write FOnReDrawMap;
    property Dev: TDevice read FDev write SetDev;

  end;

  TGpsPlayDrawLayer = class(TGpsDrawLayer)
  protected

  public
    function Draw: boolean; override;
    function IsRedrawMap: Boolean; override;
  end;



  TGpsMap = class(TActionMap)
  private
    FTmpDraw: TBitmap;
    FTmpDrawChanged: Boolean;
    FTimer: TTimer;
    FGpsDataLayer: TGpsDataLayer;
    FNeedDraw: Boolean;
    FGpsDrawlayer: TGpsDrawLayer;
    FOnUserSelectDevEvent: TUserSelectDevEvent;
    FOnUserSelDevCntManyEvent: TUserSelectDevCntTooManyEvent;
//    FGpsPlayDataLayer: TGpsDataLayer;
    FIsPlayGpsData: boolean;
    FIsPlaySepcialCar: Boolean;
    FSepcialDevice: TDevice;
//    FGpsPlayDrawLayer: TGpsPlayDrawLayer;
    procedure SetGpsLayer(const Value: TGpsDataLayer);
    procedure SetTmpDrawChanged(const Value: Boolean);
    procedure SetNeedDraw(const Value: Boolean);
    procedure DrawGpsMap;
    procedure SetGpsDrawlayer(const Value: TGpsDrawLayer);
    procedure SetOnUserSelectDevEvent(const Value: TUserSelectDevEvent);
    procedure SetOnUserSelDevCntManyEvent(
      const Value: TUserSelectDevCntTooManyEvent);
  private
    //画限定区域 --目前在画车时画出
    //procedure DrawConfineArea;
    procedure FTimerTimer(Sender: TObject);

  protected
    {在这里继承的目的是： 正在进行测量及画限定区域时，不画小车=>让FTimer停止，
      不在画时再让FTimer运行。sha2005-6-21}
    procedure BrowseMeasure(AMouseState: TMouseState); override;
    procedure BrowseSetConfineAlarmArea(AMouseState: TMouseState); override;
    procedure BrowseSetConfineAlarmNoSybol(AMouseState: TMouseState); override;
    procedure BrowseSetRunWay(AMouseState: TMouseState); override;
    { Procedure: DoScanTarget<br>
     扫描车辆变化}
    procedure DoScanTarget; virtual;
   { Procedure: DoPaint<br>
     继承祖先类的Paint过程,加入Gps车辆的绘制
     @see @link()}
    procedure DoPaint; override;
    procedure DoAfterDrawScreen; override;
    { procedure BrowseRectSelect<br>
      继承 TActionMap.BrowseRectSelect
            -------- add by sha 2004-8-13 ，
      目的：当用户在用区域选择工具 不选择任何对象 时，及时地 清车}
    procedure BrowseRectSelect(AMouseState: TMouseState); override;
   // procedure DoSetConfineArea(PointTL,PointRB:Tpoint);override;
    procedure DoUserSelectDevEvent(PointA, PointB: TEarthPoint); virtual;
    //覆盖 了emap中的抛事件
    procedure DoRectSelectMeta(PointA, PointB: TEarthPoint); override;


    procedure DoOffsetPaint(XPixels, YPixels: integer; XPixelsOff, YPixelsOff: integer); override;
  public
    constructor Create(AOwner: TComponent; Provider: TLayerProvider); override;
    destructor Destroy; override;
    procedure ClearTmpDraw;
    procedure Draw; override;
    procedure EnableTimer(Bool: Boolean);
    //只清了GPS图层，并再画出车
    procedure DrawGpsMap_ClearDraw;
    //只清　GPS图层，不画


    procedure DrawGpsMap_Clear;
    procedure DrawTempEllipseAndText(X, Y: integer; text: string);

    //GPS图层
    property GpsDataLayer: TGpsDataLayer read FGpsDataLayer write SetGpsLayer;
    property GpsDrawlayer: TGpsDrawLayer read FGpsDrawlayer write SetGpsDrawlayer;

    //轨迹回放图层  2007-07-31
//  property GpsPlayDrawLayer:TGpsPlayDrawLayer read FGpsPlayDrawLayer write FGpsPlayDrawLayer;
//  property GpsPlayDataLayer:TGpsDataLayer read FGpsPlayDataLayer write FGpsPlayDataLayer;
    //是否在轨迹回放 2007-07-31
    property IsPlayGpsData: boolean read FIsPlayGpsData write FIsPlayGpsData;
    property IsPlaySepcialCar: Boolean read FIsPlaySepcialCar write FIsPlaySepcialCar;

    property TmpDraw: TBitmap read FTmpDraw;
    property TmpDrawChanged: Boolean read FTmpDrawChanged write SetTmpDrawChanged;
    property NeedDraw: Boolean read FNeedDraw write SetNeedDraw;
    //用户框选车辆　sha 20050224
    property OnUserSelectDevEvent: TUserSelectDevEvent read FOnUserSelectDevEvent write SetOnUserSelectDevEvent;
    //用户框选车辆数　太多   sha 20050225
    property OnUserSelDevCntManyEvent: TUserSelectDevCntTooManyEvent read FOnUserSelDevCntManyEvent write SetOnUserSelDevCntManyEvent;
    property SepcialDevice: TDevice read FSepcialDevice write FSepcialDevice;
  end;

  //画区域图层
  TAreaDrawLayer = class(TDrawLayer)
  protected

  public
    function ClipDraw(DC: HDC; Rect: TWorldRect; Canvas: TCanvas): boolean; override;
    procedure DrawConfinArea(Dc: HDC);
  end;

  //画圆形、矩形、多边形  \路段
  TAlarmNoSybolLayer = class(TDrawLayer)
  private
    procedure DrawRoadsLayer(Dc: HDC);
  protected
  public
    function ClipDraw(DC: HDC; Rect: TWorldRect; Canvas: TCanvas): boolean; override;
    procedure DrawAlarmNoSybolLayer(Dc: HDC);
  end;

  TUserDefinedTextLayer = class(TDrawLayer)
  protected
  public
    function ClipDraw(DC: HDC; Rect: TWorldRect; Canvas: TCanvas): boolean; override;
    procedure DrawUserDefinedText(Dc: HDC);
  end;

implementation
uses
  uGloabVar, elog, ResUnit, Imglist, tyolist,
  ConfineAreaUnit, SysUtils, umainf, forms, PlayGlobalUnit;
{ TGpsMap }

procedure TGpsMap.BrowseMeasure(AMouseState: TMouseState);
begin
  inherited;
  FTimer.Enabled := not FBrowseCapture;
end;

procedure TGpsMap.BrowseRectSelect(AMouseState: TMouseState);
var
 // devID: integer;//i,j,
//  m : Tdevice;
  ep: TEarthPoint;
begin
  inherited; //继承
  //鼠标松开，且没有选择对象时
  if (AMouseState = msUp) and (GpsDrawlayer.SelectedMeta.Count = 0) then
  begin
    ADeviceManage.ClearUserSelectList; //清除选中车辆列表
    DrawGpsMap_ClearDraw;
    ep.Longitude := 0;
    ep.Latitude := 0;
    DoUserSelectDevEvent(ep, ep); //传出事件,让用户删掉选择出的车
  end;
end;

procedure TGpsMap.BrowseSetConfineAlarmArea(AMouseState: TMouseState);
begin
  inherited;
  FTimer.Enabled := not FBrowseCapture;
end;

procedure TGpsMap.BrowseSetConfineAlarmNoSybol(AMouseState: TMouseState);
begin
  inherited;
  FTimer.Enabled := not FBrowseCapture;
end;

procedure TGpsMap.BrowseSetRunWay(AMouseState: TMouseState);
begin
  inherited;
  FTimer.Enabled := not FBrowseCapture;
end;

procedure TGpsMap.ClearTmpDraw;
begin
  try
    FTmpDraw.Canvas.Brush.Style := bsSolid;
    FTmpDraw.Canvas.Brush.Color := clWhite;
    FTmpDraw.Canvas.FillRect(GetClientRect);
    FTmpDrawChanged := False;
  except on E: Exception do
    begin
      elog.SystemLog.AddLog('TGpsMap.ClearTmpDraw', e.Message);
      FTmpDraw.Free;
      FTmpDraw := TBitmap.Create;
      FTmpDrawChanged := False;
    end;
  end;
end;

constructor TGpsMap.Create(AOwner: TComponent; Provider: TLayerProvider);
begin
  inherited;
  FTmpDraw := TBitmap.Create;
  FTmpDrawChanged := False;
  FTimer := TTimer.Create(nil);
  FTimer.Interval := 500000;//500; // add by sha 2004-8-13
  FTimer.OnTimer := FTimerTimer;
  FTimer.Enabled := False;
  NeedDraw := False;
  FIsPlayGpsData := false;
  FSepcialDevice  := TDevice.Create;
end;

destructor TGpsMap.Destroy;
begin
  FTmpDraw.Free;
  FTimer.Free;
  FSepcialDevice.Free;
  inherited;
end;

procedure TGpsMap.DoAfterDrawScreen;
begin
  inherited;
  try
    if FTmpDrawChanged then
    begin
      GraphDraw.TransDraw(FScreenBitmap.Canvas.handle, 0, 0, GetClientRect.Right, GetClientRect.Bottom,
        FTmpDraw.canvas.handle, clWhite);
    end;
  except on E: Exception do
    begin
      elog.SystemLog.AddLog(' TGpsMap.DoAfterDrawScreen ', e.Message);
      FTmpDraw.Free;
      FTmpDraw := TBitmap.Create;
      FTmpDrawChanged := False;
    end;
  end;

end;

procedure TGpsMap.DoOffsetPaint(XPixels, YPixels, XPixelsOff,
  YPixelsOff: integer);
begin
  inherited;
  if FTmpDrawChanged then
  begin
    GraphDraw.TransDraw(Canvas.handle, 0, 0, GetClientRect.Right, GetClientRect.Bottom,
      FTmpDraw.canvas.handle, clWhite);
  end;
end;

procedure TGpsMap.DoPaint;
begin
  if (FTmpDraw.Height <> Height) or (FTmpDraw.Width <> Width) then
  begin
    FTmpDraw.Width := GetClientRect.Right;
    FTmpDraw.Height := GetClientRect.Bottom;
  end;
  inherited;
end;

procedure TGpsMap.DoRectSelectMeta(PointA, PointB: TEarthPoint);
var
  i, j: integer;
  devID:string;
begin
  ADeviceManage.ClearUserSelectList; //清除选中车辆列表
  if (GpsDrawlayer.SelectedMeta.Count > 0) then //鼠标松开，且没有选择对象时
  begin
    //当选中车辆数据大于DRAWSelectDevCnt时，
    if GpsDrawlayer.SelectedMeta.Count > DRAWSelectDevCnt then
    begin
      if assigned(FOnUserSelDevCntManyEvent) then
        FOnUserSelDevCntManyEvent();
      DoUserSelectDevEvent(PointA, PointB); //传出事件
      exit;
    end;
    for i := 0 to GpsDrawlayer.SelectedMeta.Count - 1 do
    begin
      j := GpsDrawlayer.SelectedMeta.GetData(i);
      devId := ADeviceManage.FindFromMetaIndex(j);
      if devId <> '' then ADeviceManage.AddToUserSelectList(devId);
    end;
    //另一种方法，两种方法 我认为上面方法更快些 sha
    {for i:=0 to ADeviceManage.Count -1 do
    begin
      m:= ADeviceManage.Items[i];
      If not m.State[STAT_DEVICE_CONNECTED] then Continue;
      if GpsDrawlayer.SelectedMeta.IsDataIn(m.MetaIndex) then//注意:不加上面判句,将在选中MetaIndex＝0车时，列出所有没数据没画过的车(MetaIndex=0)
        ADeviceManage.AddToUserSelectList(m.Id);
    end; }
  end;
  DoUserSelectDevEvent(PointA, PointB); //传出事件,让用户列出选中车辆
end;

procedure TGpsMap.DoScanTarget;
var
  i: Integer;
  m: TDevice;
  aMeta: TMetaStruct;
  p: TEarthPoint;
  pMeta: PMetaStruct;
begin
  //if have new target arrive ,add a meta to datalayer

  try
  //轨迹回放状态
    if FIsPlayGpsData then
    begin
      try
        if playDev = nil then exit;
        // if now dev be added
        if playDev.MetaIndex < 0 then
          playDev.MetaIndex := GpsDataLayer.AddNewMeta;
        //if have new target data arrive, maybe need refresh map
        if playDev.State[STAT_NEWDATA_GIS] then
        begin
          try
            //playDev.MetaIndex:=0;
            pMeta := GpsDataLayer.GetMetaPointer(playDev.MetaIndex {,Projection.ProjectionType});
            p.Longitude := playDev.Longitude;
            p.Latitude := playDev.Latitude;
            pMeta^.Symbol.Position := Self.Projection.LoLa2XY(p)
            //GpsDataLayer.ModifyMeta(playDev.MetaIndex,aMeta);
          finally
            playDev.State[STAT_NEWDATA_GIS] := False;
          end;
          NeedDraw := True;
        end;
      except on E: Exception do
          elog.SystemLog.AddLog(' TGpsMap.DoScanTarget1', e.Message);
      end;

    end
    else if FIsPlaySepcialCar then    // 重点监控
    begin
      try
        if FSepcialDevice = nil then exit;
        // if now dev be added
        if FSepcialDevice.MetaIndex < 0 then
          FSepcialDevice.MetaIndex := GpsDataLayer.AddNewMeta;   
        //if have new target data arrive, maybe need refresh map
        if FSepcialDevice.State[STAT_NEWDATA_GIS] then
        begin
          try
            //playDev.MetaIndex:=0;
            pMeta := GpsDataLayer.GetMetaPointer(FSepcialDevice.MetaIndex);
            pMeta^.Symbol.Position := FSepcialDevice.Point;
            //GpsDataLayer.ModifyMeta(playDev.MetaIndex,aMeta);
          finally
            FSepcialDevice.State[STAT_NEWDATA_GIS] := False;
          end;
          NeedDraw := True;
        end;
      except on E: Exception do
          elog.SystemLog.AddLog(' TGpsMap.DoScanTarget1', e.Message);
      end;
    end
    else
    begin
      try
        if ADeviceManage.Stat[STAT_NEWDEVICE_GIS] then
        begin
          try
            for i := 0 to ADeviceManage.Count - 1 do
            begin
              m := ADeviceManage.Items[i];
              if m.State[STAT_NEWDEVICE_GIS] then
              begin
                try
                  m.MetaIndex := GpsDataLayer.AddNewMeta;
                finally
                  m.State[STAT_NEWDEVICE_GIS] := False;
                end;
              end;
            end;
          finally
            ADeviceManage.Stat[STAT_NEWDEVICE_GIS] := False;
          end;
        end;
      except on E: Exception do
          elog.SystemLog.AddLog(' TGpsMap.DoScanTarget2', e.Message);
      end;

      //if have new target data arrive, maybe need refresh map
      try
        if ADeviceManage.Stat[STAT_NEWDATA_GIS] then
        begin
          try
            for i := 0 to ADeviceManage.Count - 1 do
            begin
              m := ADeviceManage.Items[i];
              if m.SpecialCar then Continue;
              if not m.IsOnMap then Continue;
              if m.isOnline <> m.isOnlineOnTheMap then m.State[STAT_NEWDATA_GIS] := true;
              try
                if m.State[STAT_NEWDATA_GIS] then
                begin
                  try
                      //p.Longitude := m.Longitude;
                      //p.Latitude := m.Latitude;
                    pMeta := GpsDataLayer.GetMetaPointer(m.MetaIndex);
                    pMeta^.Symbol.Position := m.Point;
                  finally
                    m.State[STAT_NEWDATA_GIS] := False;
                  end;
                end;
              finally
                m.isOnlineOnTheMap := m.isOnline;
              end;
            end;
            NeedDraw := True;
          finally
            ADeviceManage.Stat[STAT_NEWDATA_GIS] := False;
          end;
        end;
      except on E: Exception do
          elog.SystemLog.AddLog(' TGpsMap.DoScanTarget3', e.Message);
      end;
    end; //if FIsPlayGpsData

  except on E: Exception do
      elog.SystemLog.AddLog(' TGpsMap.DoScanTarget', e.Message);
  end;

end;


procedure TGpsMap.DoUserSelectDevEvent(PointA, PointB: TEarthPoint);
begin
  if Assigned(FOnUserSelectDevEvent) then
    FOnUserSelectDevEvent(self, PointA, PointB);
end;

procedure TGpsMap.Draw;
begin
  try
    if (mpAllowDraw in Option) then
    begin
      ClearTmpDraw;

      inherited Draw; //将 画出所有图层，包括GPS图层

      FTimer.Enabled := False;
      FTimer.Enabled := True;
    end;
  except on E: Exception do
      elog.SystemLog.AddLog('TGpsMap.Draw', e.Message);
  end;
end;

{procedure TGpsMap.DrawConfineArea;
var
  i,j: integer;
  confArea   : TConfineArea;
  pointAry   : TPointAry;
  isInScreebRect :boolean;  //是否在地图中画出
begin
  if GAreaManage=nil then exit;
  for i:= 0 to GAreaManage.Count -1 do
  begin
    confArea:= GAreaManage.Items[i];
    if not confArea.IsDraw then Continue;
    TmpDraw.Canvas.Pen.Color := confArea.AreaColor;
    TmpDraw.Canvas.Pen.Width :=3;
    TmpDraw.Canvas.Pen.Mode := pmMask ;

    SetLength(pointAry,confArea.PointCount);
    for j:=0 to confArea.PointCount -1 do
    begin
      //只要多边形有一个点在当前屏幕中，就画出
      if GeometryCalc.PointInRect(confArea.WorldPointAry[j], DrawCood.WorldRect) then
        isInScreebRect:= true;
      pointAry[j] := DrawCood.ConvertSP(confArea.WorldPointAry[j]);
    end;
    if isInScreebRect then
      TmpDraw.Canvas.Polygon(pointAry);
  end;
end;      }

procedure TGpsMap.DrawGpsMap;
begin
  if not (mpAllowDraw in Option) then Exit;
  if GpsDrawlayer.IsRedrawMap then //如果需重画,则画出所有图层
    Draw
  else
    DrawGpsMap_ClearDraw; //只清了GPS图层，并再画出(车、限定区域..)
end;

procedure TGpsMap.DrawGpsMap_Clear; //只清了GPS图层，但不画(车、限定区域..)
begin
  ClearTmpDraw;
  paint;
end;

procedure TGpsMap.DrawGpsMap_ClearDraw; //只清了GPS图层，并再画出 车
begin
  ClearTmpDraw;
  GpsDrawlayer.Draw;
  paint;
end;

procedure TGpsMap.DrawTempEllipseAndText(X, Y: integer; text: string);
var
  i: integer;
begin
  try
    i := 70;
    while i > 10 do
    begin
      DrawGpsMap_ClearDraw;
      TmpDrawChanged := True; 
      application.ProcessMessages;
      SetBkColor(TmpDraw.Canvas.Handle, clBlue);
      SetTextColor(TmpDraw.Canvas.Handle, clCream);
      TmpDraw.Canvas.TextOut(x - (length(Text) * 3), y - 7, Text);
      application.ProcessMessages;
      TmpDraw.Canvas.Pen.Color := clred;
      TmpDraw.Canvas.Pen.Width := 3;
      TmpDraw.Canvas.Pen.Mode := pmMask;
      TmpDraw.Canvas.Ellipse(x - i, Y - i, X + i, Y + i);
      i := i - (i div 3);
      application.ProcessMessages;
      paint;
      application.ProcessMessages;
    end;
  except on E: Exception do
      elog.SystemLog.AddLog(' TGpsMap.DrawTempEllipseAndText ', e.Message);
  end;
end;

procedure TGpsMap.EnableTimer(Bool: Boolean);
begin
  FTimer.Enabled := Bool;
end;

procedure TGpsMap.FTimerTimer(Sender: TObject);
begin
  Exit;//2011-12-01
  try
    FTimer.Enabled := False;
    try
      DoScanTarget;
      if NeedDraw then DrawGpsMap;
    finally
      FTimer.Enabled := True;
      NeedDraw := False;
    end;
  except on E: Exception do
      elog.SystemLog.AddLog(' TGpsMap.FTimerTimer函数报错: ', e.Message);
  end;
end;

procedure TGpsMap.SetGpsDrawlayer(const Value: TGpsDrawLayer);
begin
  FGpsDrawlayer := Value;
end;

procedure TGpsMap.SetGpsLayer(const Value: TGpsDataLayer);
begin
  FGpsDataLayer := Value;
end;

procedure TGpsMap.SetNeedDraw(const Value: Boolean);
begin
  FNeedDraw := Value;
end;

procedure TGpsMap.SetOnUserSelDevCntManyEvent(
  const Value: TUserSelectDevCntTooManyEvent);
begin
  FOnUserSelDevCntManyEvent := Value;
end;

procedure TGpsMap.SetOnUserSelectDevEvent(
  const Value: TUserSelectDevEvent);
begin
  FOnUserSelectDevEvent := Value;
end;

procedure TGpsMap.SetTmpDrawChanged(const Value: Boolean);
begin
  FTmpDrawChanged := Value;
end;

{ TGpsDataLayer }

function TGpsDataLayer.AddNewMeta: Integer;
var
  sym: TWorldSymbol;
begin
//  sym := GlobalParam.NewSymbolStyle;
//(*
  sym.Style := _Custom;
  sym.CustomSymbol.Size := 8;
  sym.CustomSymbol.Shape := 34;
  sym.CustomSymbol.Color := clRed;

//*) .

  Result := AddSymbol(sym);
end;

class function TGpsDataLayer.GetIdentification: Longword;
begin
  Result := TDataLayer.GetIdentification + $3000;
end;

function TGpsDataLayer.RemoveMetaByIndex(AIndex: integer): boolean;
begin
  Result := inherited RemoveMetaByIndex(AIndex);
end;

{ TGpsDrawLayer }

function TGpsDrawLayer.ClipDraw(DC: HDC; Rect: TWorldRect; Canvas: TCanvas): boolean;
begin
  FGpsMap.ClearTmpDraw;
  Draw; //Result:=inherited ClipDraw(DC,Rect);
end;

{procedure TGpsDrawLayer.CMEraseBkgnd(var Message: TWMEraseBkgnd);
begin
  gpsmap.brush.style:=bsClear;
  Inherited;
end;   }

constructor TGpsDrawLayer.Create;
begin
  inherited;
  Ffont.Size := 15;
  Ffont.FontName := '宋体';
  Ffont.FontStyle := 0;
  Ffont.Rotation := 0;
  Ffont.ForeColor := 0;
  Ffont.BackColor := clRed;
  Ffont.Transparent := 0;
end;

function TGpsDrawLayer.Draw: boolean;
{画车，画轨迹}
var
  i: Integer; // ,j
  desRect: TRect;
  carCurrPos: TPoint;
  //pMeta:PMetaStruct;  //dxf 2008-02-19
  m: TDevice;
  emptyCount, fullCount: integer;
  s: string;

  p: TPoint;
  p1, p2: TPoint;
  meta: TMetaStruct;
  director: boolean;

  DevCount: Integer;
  TempCount: Integer;
  procedure DrawCar(m: TDevice);
//var
  //desRect: TRect;
  //carCurrPos: TPoint;
  ///pMeta:PWorldMeta;
  //emptyCount,fullCount:integer;
  var
    pointAry:array of Tpoint;
    oldPen: HPen;
    oldBrush: HBrush;
    newPen: TPenStruct;
    newBrush: TBrushStruct;
    j:Integer;
  begin
    director := false;
    if not m.State[STAT_DEVICE_CONNECTED] then exit;
    if m.State[STAT_NEWDEVICE_GIS] then exit;
    if m.MetaIndex >= Data.MetaCount then exit;
    //pMeta := Data.GetMetaPointer(m.MetaIndex);  //dxf 2008-02-19
    //图元未激活
    //if not pMeta^.Enabled then Continue;
    carCurrPos := m.Point; // pMeta^.Symbol.Position;  //dxf 2008-02-19

    //是否在线,来计算空车率; 因为要计算不在屏幕中的车机,所以要放在判断是否在屏幕中之前.
    if (m.isOnline) and (GlobalParam.isShowEmptyFull) then
      if not m.Switch[9] then
      begin
        Inc(EmptyCount); //空车
      end
      else
      begin
        Inc(FullCount);
      end;

    //目标不在屏幕中
    if not GeometryCalc.PointInRect(carCurrPos, Map.DrawCood.WorldRect) then exit;
    carCurrPos := Map.DrawCood.ConvertSP(carCurrPos);
    //如果车辆监控
    //if m.Monitor then
    begin
      //画车，标注
      if m.Hide and (not m.Alarm) then exit;

      ADeviceManage.AddCurrentDevOnTheMap(carCurrPos.X, carCurrPos.Y, m);


       //--------------------是否越出 或 驶入区域
      //{$ifdef For_ConfineArea}
      DrawRectIfOutorInAlarmArea(m, carCurrPos); //2007-11-22 by dxf
      //{$endif}
      //--------------------如果车辆被选中，则车牌号底色用亮兰色，字体用clCream。　否则 底用蓝色

      //----------------------画轨迹
      if m.DrawTrack then
        DrawACarCourse(m); //画轨迹

      if (SelectedMeta.Count <= DRAWSelectDevCnt) and (SelectedMeta.IsDataIn(m.MetaIndex)) then
      begin
        SetBkColor(GpsMap.TmpDraw.Canvas.Handle, clLime);
        SetTextColor(GpsMap.TmpDraw.Canvas.Handle, clCream);
      end
      else
      begin

        if not m.isOnline then
        begin
          SetBkColor(GpsMap.TmpDraw.Canvas.Handle, clMedGray);
          SetTextColor(GpsMap.TmpDraw.Canvas.Handle, clCream);
        end
        else
        begin
          //判断是否定位，不定位：字体灰色。定位：字体米色
          if m.Switch[STAT_GPS_LOCATE] then
            SetTextColor(GpsMap.TmpDraw.Canvas.Handle, clCream)        // 定位
          else
            SetTextColor(GpsMap.TmpDraw.Canvas.Handle, clMedGray);     // 非定位

          if not m.Switch[9] then
            SetBkColor(GpsMap.TmpDraw.Canvas.Handle, GlobalParam.FTaxiEmptyColor) //空车     －－没有调度
          else
            SetBkColor(GpsMap.TmpDraw.Canvas.Handle, GlobalParam.FTaxiHavColor);  //重车     －－没有调度

          if m.Switch_Warning[0] then //if m.Alarm then
            SetBkColor(GpsMap.TmpDraw.Canvas.Handle, GlobalParam.FDriverAlarmColor); //司机按键报警
          if m.Switch[11] then //if m.Switch[18] then
            SetBkColor(GpsMap.TmpDraw.Canvas.Handle, clYellow); // 断电报警
          if  m.Switch[MSG_STATE_3] then //停运为黄色 字为绿色
          begin
             SetBkColor(GpsMap.TmpDraw.Canvas.Handle,clGreen);
             //SetTextColor(GpsMap.TmpDraw.Canvas.Handle,clBlack);
          end;
        end;
        {if m.Switch[4] then //休眠，不论是否在线都一样色 ：字体蓝、背景灰
        begin
          SetTextColor(GpsMap.TmpDraw.Canvas.Handle, clBlue);
          SetBkColor(GpsMap.TmpDraw.Canvas.Handle, clMedGray);
        end;    }
      end;
      desRect := classes.Rect(carCurrPos.x - 45 - Length(m.Car.No)*2, carCurrPos.y - 19, carCurrPos.x + 45 + Length(m.Car.No)*2, carCurrPos.y + 60);
      GpsMap.TmpDraw.Canvas.Font.Size := GlobalParam.FontSize;

      if GlobalParam.ShowTheMapOption = 0 then  //0代表显示车牌号,1代表显示设备名称.
      begin 
        if GlobalParam.carpicType = 1 then //===0===普通显示图片   1 显示车辆方向图片
        begin
          if m.Orientation > 360 then
          begin
            m.Orientation := m.Orientation1;
            m.OrientationRightTime := m.OrientationRightTime + 1;
          end;
          for j:= 0 to 7 do //8个方向。sha.20090925 改
          begin
            if j=0 then
            begin
              if (m.Orientation >=360-22) and (m.Orientation <=j*45+22) then
                break;
            end
            else
              if (m.Orientation>= j*45-22) and (m.Orientation <=j*45+22) then
                break;
          end;
          if j>7 then j:= 0;
          m.OrientationRightTime := 0;
          m.Orientation1 := m.Orientation;
          director := true;
          //直接用本地的，不再从数据库中取。因从数据库取有限制，ResId必须为5-12。sha.20090925改
          Mainf.ImageListCarPicInMap.Draw(GpsMap.TmpDraw.Canvas, carCurrPos.X - 8, carCurrPos.Y - 8, j);
          drawtext(GpsMap.TmpDraw.Canvas.Handle, PChar(m.Car.No), Length(m.Car.No), desRect, DT_CENTER);
          if m.OrientationRightTime >= 3 then
          begin
            drawtext(GpsMap.TmpDraw.Canvas.Handle, PChar(m.Car.No), Length(m.Car.No), desRect, DT_CENTER);
            Mainf.ImageListMapCar.Draw(GpsMap.TmpDraw.Canvas, carCurrPos.X - 8, carCurrPos.Y - 8, 0);
            //ResManage.BmpList.Draw(GpsMap.TmpDraw.Canvas, carCurrPos.X - 8, carCurrPos.Y - 8, m.Car.ResIndex);
          end;
        end else
        begin
          drawtext(GpsMap.TmpDraw.Canvas.Handle, PChar(m.Car.No), Length(m.Car.No), desRect, DT_CENTER);
          Mainf.ImageListMapCar.Draw(GpsMap.TmpDraw.Canvas, carCurrPos.X - 8, carCurrPos.Y - 8, 0);
          //ResManage.BmpList.Draw(GpsMap.TmpDraw.Canvas, carCurrPos.X - 8, carCurrPos.Y - 8, m.Car.ResIndex);
        end;
      end
      else     //1代表显示设备名称.
      begin
        if GlobalParam.carpicType = 1 then //===0===普通显示图片   1 显示车辆方向图片
        begin
          if m.Orientation > 360 then
          begin
            m.Orientation := m.Orientation1;
            m.OrientationRightTime := m.OrientationRightTime + 1;
          end;
          for j:= 0 to 7 do //8个方向。sha.20090925 改
          begin
            if j=0 then
            begin
              if (m.Orientation >=360-22) and (m.Orientation <=j*45+22) then
                break;
            end
            else
              if (m.Orientation>= j*45-22) and (m.Orientation <=j*45+22) then
                break;
          end;
          if j>7 then j:= 0;
          m.OrientationRightTime := 0;
          m.Orientation1 := m.Orientation;
          director := true;                         
          Mainf.ImageListCarPicInMap.Draw(GpsMap.TmpDraw.Canvas, carCurrPos.X - 8, carCurrPos.Y - 8, j);
          //ResManage.BmpList.Draw(GpsMap.TmpDraw.Canvas, carCurrPos.X - 8, carCurrPos.Y - 8, j+6);
          
          drawtext(GpsMap.TmpDraw.Canvas.Handle, PChar(m.DispLabel), Length(m.DispLabel), desRect, DT_CENTER);
          if m.OrientationRightTime >= 3 then
          begin
            drawtext(GpsMap.TmpDraw.Canvas.Handle, PChar(m.DispLabel), Length(m.DispLabel), desRect, DT_CENTER);
            Mainf.ImageListMapCar.Draw(GpsMap.TmpDraw.Canvas, carCurrPos.X - 8, carCurrPos.Y - 8, 0);
            //ResManage.BmpList.Draw(GpsMap.TmpDraw.Canvas, carCurrPos.X - 8, carCurrPos.Y - 8, m.Car.ResIndex);
          end;
        end else
        begin
          drawtext(GpsMap.TmpDraw.Canvas.Handle, PChar(m.DispLabel), Length(m.DispLabel), desRect, DT_CENTER);
          Mainf.ImageListMapCar.Draw(GpsMap.TmpDraw.Canvas, carCurrPos.X - 8, carCurrPos.Y - 8, 0);
          //ResManage.BmpList.Draw(GpsMap.TmpDraw.Canvas, carCurrPos.X - 8, carCurrPos.Y - 8, m.Car.ResIndex);
        end;
        //drawtext(GpsMap.TmpDraw.Canvas.Handle, PChar(m.DispLabel),Length(m.DispLabel), desRect, DT_CENTER);
      end;

      //ResManage.BmpList.Draw(GpsMap.TmpDraw.Canvas,carCurrPos.X-8,carCurrPos.Y-8,6);

      //---------------------判 司机按键 报警
      if m.Switch_Warning[0] and bAlarm then //if m.Alarm then
      begin
        GpsMap.TmpDraw.Canvas.Pen.Color := clred;
        GpsMap.TmpDraw.Canvas.Pen.Width := 4;
        GpsMap.TmpDraw.Canvas.Pen.Mode := pmMask;
        GpsMap.TmpDraw.Canvas.Ellipse(carCurrPos.x - 35, carCurrPos.y - 25, carCurrPos.x + 30, carCurrPos.y + 10);
      end;
      // 预警处理
      if m.Switch_Warning[MSG_Warning_1] and bEarlyAlarm then
      begin
        GpsMap.TmpDraw.Canvas.Pen.Color := clFuchsia;
        GpsMap.TmpDraw.Canvas.Pen.Width := 4;
        GpsMap.TmpDraw.Canvas.Pen.Mode := pmMask;
       GpsMap.TmpDraw.Canvas.Ellipse(carCurrPos.x - 35, carCurrPos.y - 25, carCurrPos.x + 30, carCurrPos.y + 10);
      end;
      //断电报警
      if m.Switch_Warning[6] then //if m.Switch[18] then
      begin
        GpsMap.TmpDraw.Canvas.Pen.Color := clYellow;
        GpsMap.TmpDraw.Canvas.Pen.Width := 4;
        GpsMap.TmpDraw.Canvas.Pen.Mode := pmMask;
        GpsMap.TmpDraw.Canvas.Ellipse(Rect(carCurrPos.x - 25, carCurrPos.y - 25, carCurrPos.x + 25, carCurrPos.y + 25));
      end;
      // 车辆监控
      if m.PursuePostion then
      begin
        GpsMap.TmpDraw.Canvas.Pen.Color := clGreen;
        GpsMap.TmpDraw.Canvas.Pen.Width := 4;
        GpsMap.TmpDraw.Canvas.Pen.Mode := pmMask;
        GpsMap.TmpDraw.Canvas.Ellipse(Rect(carCurrPos.x - 25, carCurrPos.y - 25, carCurrPos.x + 25, carCurrPos.y + 25));
      end;
    end;

    GpsMap.TmpDrawChanged := True;
    MetaInScreen.Add(m.MetaIndex);
  end;

  procedure DrawCar2(m: TDevice);
  var
    j:Integer;
    Text: string;
    TextColor, BkColor: TColor;
    imageindex: Integer;
    bWrite: Boolean;
    oldColor: TColor;
    PenColor, BrushColor: TColor;
    isSelected: Boolean;
  begin
    director := false;
    bWrite := False;
    isSelected := False;
    if not m.State[STAT_DEVICE_CONNECTED] then exit;
    if m.State[STAT_NEWDEVICE_GIS] then exit;
    if m.MetaIndex >= Data.MetaCount then exit;
    //pMeta := Data.GetMetaPointer(m.MetaIndex);  //dxf 2008-02-19
    //图元未激活
    //if not pMeta^.Enabled then Continue;
    carCurrPos := m.Point; // pMeta^.Symbol.Position;  //dxf 2008-02-19

    //目标不在屏幕中
    if not GeometryCalc.PointInRect(carCurrPos, Map.DrawCood.WorldRect) then exit;
    carCurrPos := Map.DrawCood.ConvertSP(carCurrPos);
    //如果车辆监控
    //if m.Monitor then
    begin
      //画车，标注
      //if m.Hide and (not m.Alarm) then exit;
      if m.Hide and (not m.Switch_Warning[0]) then Exit;//紧急报警时画出

      //ADeviceManage.AddCurrentDevOnTheMap(carCurrPos.X, carCurrPos.Y, m);

      //--------------------是否越出 或 驶入区域
      //DrawRectIfOutorInAlarmArea(m, carCurrPos); //2007-11-22 by dxf

      //----------------------画轨迹
      if m.DrawTrack then
        DrawACarCourse(m); //画轨迹

      //desRect := classes.Rect(carCurrPos.x - 35, carCurrPos.y - 19, carCurrPos.x + 35, carCurrPos.y + 60);

      //--------------------如果车辆被选中，则车牌号底色用亮兰色，字体用clCream。　否则 底用蓝色
      if (SelectedMeta.Count <= DRAWSelectDevCnt) and (SelectedMeta.IsDataIn(m.MetaIndex)) then
      begin
        bWrite := True;
        BkColor := clLime;
        TextColor := clCream;
        Text := '被选中 ';
        isSelected := True;
      end;

      oldColor := GpsMap.TmpDraw.Canvas.Brush.Color;
      if GlobalParam.carpicType = 1 then //===0===普通显示图片   1 显示车辆方向图片
      begin
        if m.Orientation > 360 then
        begin
          m.Orientation := m.Orientation1;
          m.OrientationRightTime := m.OrientationRightTime + 1;
        end;
        for j:= 0 to 7 do //8个方向。sha.20090925 改
        begin
          if j=0 then
          begin
            if (m.Orientation >=360-22) and (m.Orientation <=j*45+22) then
              break;
          end
          else
            if (m.Orientation>= j*45-22) and (m.Orientation <=j*45+22) then
              break;
        end;
        if j>7 then j:= 0;
        m.OrientationRightTime := 0;
        m.Orientation1 := m.Orientation;
        director := true;
        Mainf.ImageListCarPicInMap.Draw(GpsMap.TmpDraw.Canvas, carCurrPos.X - 8, carCurrPos.Y - 8, j);

//        if m.OrientationRightTime >= 3 then
//        begin
//          ResManage.BmpList.Draw(GpsMap.TmpDraw.Canvas, carCurrPos.X - 8, carCurrPos.Y - 8, m.Car.ResIndex);
//        end;
      end else
      begin
        imageindex := 8;
        PenColor := 15130650;  // 天蓝色
        BrushColor := 15130650;
        //判断是否定位，不定位：字体灰色。定位：字体米色
        if (not m.Switch[STAT_GPS_LOCATE]) or (not m.isOnline)  then
        begin
          imageindex := 2; // 不定位
          if m.Switch_Warning[0] then
          begin
            bWrite := True;
            BkColor := GlobalParam.FDriverAlarmColor;
            TextColor := clCream;
            Text := Text + '紧急报警';          
            PenColor := GlobalParam.FDriverAlarmColor;//clRed;
            BrushColor := GlobalParam.FDriverAlarmColor;//clRed;
          end
          else
          begin
            PenColor := clMedGray;
            BrushColor := clMedGray;
          end;
        end
        else
        begin
          imageindex := 0;  // 定位
          PenColor := clBlue;
          BrushColor := clBlue;
          //if not m.Alarm then
          if not m.Switch_Warning[0] then
          begin
            PenColor := clGreen;
            BrushColor := clLime;
          end
          else
          begin
            bWrite := True;
            BkColor := GlobalParam.FDriverAlarmColor;
            TextColor := clCream;
            Text := Text + '紧急报警';
            imageindex := 4;

            PenColor := GlobalParam.FDriverAlarmColor;//clRed;
            BrushColor := GlobalParam.FDriverAlarmColor;//clRed;
          end;

        end;
        //if  (m.Alarm) or (isSelected) then
        if m.Switch_Warning[0] or isSelected then
        begin
          if FMap.DrawCood.Scale < 40 then
          begin
            ImageListCar.Draw(GpsMap.TmpDraw.Canvas, carCurrPos.X - 8, carCurrPos.Y - 8, imageindex);
          end
          else
          begin
            //PenColor := clBlack;
            GpsMap.TmpDraw.Canvas.Pen.Color := PenColor;
            GpsMap.TmpDraw.Canvas.Brush.Color := BrushColor;
            //GpsMap.TmpDraw.Canvas.Pen.Mode := pmCopy;

            GpsMap.TmpDraw.Canvas.Pen.Width := 0;
            GpsMap.TmpDraw.Canvas.Pen.Mode := pmMask;
            GpsMap.TmpDraw.Canvas.Ellipse(carCurrPos.x - 2 , carCurrPos.y - 2, carCurrPos.x + 5, carCurrPos.y + 5);
            GpsMap.TmpDraw.Canvas.Brush.Color := oldColor;
          end;
        end else
        begin
          TempCount := TempCount + 1;
          if TempCount > DevCount then Exit;

          if FMap.DrawCood.Scale < 40 then
          begin
            ImageListCar.Draw(GpsMap.TmpDraw.Canvas, carCurrPos.X - 8, carCurrPos.Y - 8, imageindex);
          end
          else
          begin
            //PenColor := clBlack;
            GpsMap.TmpDraw.Canvas.Pen.Color := PenColor;
            GpsMap.TmpDraw.Canvas.Brush.Color := BrushColor;
            //GpsMap.TmpDraw.Canvas.Pen.Mode := pmCopy;

            GpsMap.TmpDraw.Canvas.Pen.Width := 0;
            GpsMap.TmpDraw.Canvas.Pen.Mode := pmMask;
            GpsMap.TmpDraw.Canvas.Ellipse(carCurrPos.x - 2 , carCurrPos.y - 2, carCurrPos.x + 5, carCurrPos.y + 5);
            GpsMap.TmpDraw.Canvas.Brush.Color := oldColor;
          end;
        end;


      end;
      if bWrite then
      begin
        SetBkColor(GpsMap.TmpDraw.Canvas.Handle, BkColor);     // 橙色
        SetTextColor(GpsMap.TmpDraw.Canvas.Handle, TextColor);
        desRect := classes.Rect(carCurrPos.x - 45 - Length(Text)*2, carCurrPos.y - 19,
                              carCurrPos.x + 45 + Length(Text)*2, carCurrPos.y + 60);
        DrawText(GpsMap.TmpDraw.Canvas.Handle, PChar(Text), Length(Text), desRect, DT_CENTER);
      end;

      ADeviceManage.AddCurrentDevOnTheMap(carCurrPos.X, carCurrPos.Y, m);
      m.IsOnMap := True;
    end;

    GpsMap.TmpDrawChanged := True;
    MetaInScreen.Add(m.MetaIndex);
  end;

//-----------------------------------------------------------------------------------------------------
begin
  try
    //inherited;{$endif}//此句注释掉，不再画出图元,改为画出移动目标。
    Result := false;
    if not (lyVisible in State) then Exit;
    //如果当前状态为轨迹回放,就退出.2007-07-31
    if FMap.DrawCood.Scale < 40 then
      ImageListCar := Mainf.ImageListMapCar
    else
      ImageListCar := Mainf.ImageList3;

    if ADeviceManage.Count < 2500 then
    begin
      DevCount := ADeviceManage.Count;
    end else
    begin
      if (FMap.DrawCood.Scale div 20) = 0 then
      begin
        DevCount := ADeviceManage.Count;
      end else
      begin
        DevCount := ADeviceManage.Count div (FMap.DrawCood.Scale div 10);
      end;
    end;
    TempCount := 0;

    //把当前地图上的图元清除
    MetaInScreen.Clear;
    ADeviceManage.CurrentDevOnTheMapIsUse := true;
    ADeviceManage.ClearCurrentDevOnTheMap;
    emptyCount := 0;
    fullCount := 0;
    if GpsMap.IsPlayGpsData then
    begin
      FAutoFollowDevice.isOnline := true;
      if (GlobalParam.ShowTheMapOption = 0) or (GlobalParam.ShowTheMapOption = 1) then
      begin
        DrawCar(FAutoFollowDevice);
      end
      else if GlobalParam.ShowTheMapOption = 2 then
      begin
        DrawCar2(FAutoFollowDevice);
      end;

      try
        p.X := GpsMap.Width - 60;
        p.Y := GpsMap.Height - 10;
        FFont.Size := 15;
            //GraphDraw.TyoDrawTrueFont(GpsMap.TmpDraw.Canvas.Handle,'轨迹回放模式',FFont,p);
        GraphDraw.TyoDrawTrueFont(GpsMap.FDrawBitmap.Canvas.Handle, '轨迹回放模式', FFont, p);


        carCurrPos.X := GpsMap.Width div 2;
        carCurrPos.Y := GpsMap.Height - 8;
        FFont.Size := 10;
        s := '时间:' + FormatDatetime('yyyy-mm-dd hh:nn:ss', FAutoFollowDevice.GpsTime);
        s := s + ' 速度:' + FormatFloat('##0.0', FAutoFollowDevice.Speed/10){{IntToStr(FAutoFollowDevice.Speed)//ls} + 'km/h';

        GraphDraw.TyoDrawTrueFont(GpsMap.TmpDraw.Canvas.Handle, s, FFont, carCurrPos);


      except on E: Exception do
          elog.SystemLog.AddLog(' TGpsDrawLayer.Draw1  ', e.Message);
      end;
      exit;
    end;
    GpsMap.TmpDraw.Canvas.Font.Size := GlobalParam.FontSize;


    if (GlobalParam.ShowTheMapOption = 0) or (GlobalParam.ShowTheMapOption = 1) then
    begin
      if GpsMap.IsPlaySepcialCar then
      begin
        DrawCar(FDev);
        Exit;
      end;
      for i := 0 to ADeviceManage.Count - 1 do
      begin
        m := ADeviceManage.Items[i];
        //是否在线,来计算空车率; 因为要计算不在屏幕中的车机,所以要放在判断是否在屏幕中之前.
        {if m.isOnline then
        begin
          if not m.Switch[MSG_STATE_9] then
          begin
            Inc(EmptyCount); //空车
          end
          else
          begin
            Inc(FullCount);
          end;
        end; }
        if m.SpecialCar then Continue;
        if GlobalParam.isShowAllDev then
        begin
          DrawCar(m);
        end
        else if GlobalParam.isShowEmpty then
        begin
          if not m.Switch[MSG_STATE_9] then
            DrawCar(m);
        end
        else if not GlobalParam.isShowEmpty then
        begin
          if m.Switch[MSG_STATE_9] then
            DrawCar(m);
        end;
      end;
    end
    else if GlobalParam.ShowTheMapOption = 2 then
    begin
      if GpsMap.IsPlaySepcialCar then
      begin
        DrawCar2(FDev);
        Exit;
      end;
      for i := 0 to ADeviceManage.Count - 1 do
      begin
        m := ADeviceManage.Items[i];

        if m.SpecialCar then Continue;

        m.IsOnMap := False;

        if GlobalParam.isShowAllDev then
        begin
          DrawCar2(m);
        end
        else if GlobalParam.isShowEmpty then
        begin
          if not m.Switch[MSG_STATE_9] then    // 空车
            DrawCar2(m);
        end
        else if not GlobalParam.isShowEmpty then
        begin
          if m.Switch[MSG_STATE_9] then
            DrawCar2(m);
        end;
      end;
    end;

  //GraphDraw.ReStoreGDI(GpsMap.TmpDraw.Canvas.Handle,oldPen,oldBrush);
    ADeviceManage.CurrentDevOnTheMapIsUse := false;
//    if Assigned(OnEmptyFull) then//and (GlobalParam.isShowEmptyFull) then
//    begin
//      OnEmptyFull(Self, EmptyCount, FullCount);
//    end;

  except on E: Exception do
      elog.SystemLog.AddLog(' TGpsDrawLayer.Draw函数报错: ', e.Message);
  end;

end;

//画轨迹函数

procedure TGpsDrawLayer.DrawACarCourse(ADevice: TDevice);
var
  WorldFromPoint, WorldToPoint: TWorldPoint;
//  DrawFromPoint, DrawToPoint: TPoint;
  i: Integer;
  oldPen: HPen;
  oldBrush: HBrush;
  meta: TMetaStruct;
  tmpPen: TPenStruct;
begin
  //inherited;
  //Exit;
  try
    meta._type := _Line;
    meta.Line.Pen := ADevice.TrackPen;
    if ADevice.TrackPen.Width = 0 then
    begin
      tmpPen.Width := 1;
      tmpPen.Pattern := 1;
      tmpPen.color := clBlack;
      ADevice.TrackPen := tmpPen;
    end;
    WorldFromPoint := ADevice.TraceList.Items[0];
    meta.Line.SP := Map.DrawCood.ConvertSP(WorldFromPoint);
    GraphDraw.SaveGDI(GpsMap.TmpDraw.Canvas.Handle, oldPen, oldBrush);


    GpsMap.TmpDraw.Canvas.Pen.Width := ADevice.TrackPen.Width;
    GpsMap.TmpDraw.Canvas.Pen.Color := ADevice.TrackPen.color;
    meta.Line.Pen := ADevice.TrackPen;
    //meta.Line.Pen.Pattern := ADevice.TrackPen.Pattern;

    for i := 1 to ADevice.TraceList.Count - 1 do
    begin
      WorldToPoint := ADevice.TraceList.Items[i];
      meta.Line.EP := Map.DrawCood.ConvertSP(WorldToPoint);
      if (GeometryCalc.PointInRect(WorldFromPoint, Map.DrawCood.WorldRect)) or
        (GeometryCalc.PointInRect(WorldToPoint, Map.DrawCood.WorldRect)) then
      begin
      {if max(abs(WorldFromPoint.x-WorldToPoint.x),
       abs(WorldFromPoint.y-WorldToPoint.y)) > GlobalParam.FlyDistance then //飞车1000米不画
      begin
        meta.Line.Pen.Pattern := 3;
      end; }


        GraphDraw.DrawArrow(GpsMap.TmpDraw.Canvas.Handle, meta.Line.SP, meta.Line.EP, 8, 24);
        DrawLine(GpsMap.TmpDraw.Canvas.Handle, meta);
        //Map.tmpBitmap.Canvas.MoveTo(DrawFromPoint.x, DrawFromPoint.y);
        //Map.tmpBitmap.Canvas.LineTo(DrawToPoint.x, DrawToPoint.y);
      //end;

      end;
      WorldFromPoint := WorldToPoint;
      meta.Line.SP := meta.Line.EP;
    end;
    GraphDraw.ReStoreGDI(GpsMap.TmpDraw.Canvas.Handle, oldPen, oldBrush);

  except on E: Exception do
      elog.SystemLog.AddLog(' TGpsDrawLayer.DrawACarCourse函数报错: ', e.Message);
  end;
end;

procedure TGpsDrawLayer.DrawConfineArea;
//var
//  i,j: integer;
//  confArea   : TConfineArea;
//  pointAry   : TPointAry;
//  isInScreebRect :boolean;  //是否在地图中画出
begin
 (* if GAreaManage=nil then exit;
  for i:= 0 to GAreaManage.Count -1 do
  begin
    confArea:= GAreaManage.Items[i];
    if not confArea.IsDraw then Continue;
    GpsMap.TmpDraw.Canvas.Pen.Color := confArea.AreaColor;
    GpsMap.TmpDraw.Canvas.Pen.Width :=3;
    GpsMap.TmpDraw.Canvas.Pen.Mode := pmMask ;

    SetLength(pointAry,confArea.PointCount);
    for j:=0 to confArea.PointCount -1 do
    begin
      //只要多边形有一个点在当前屏幕中，就画出
      if GeometryCalc.PointInRect(confArea.WorldPointAry[j], Map.DrawCood.WorldRect) then
        isInScreebRect:= true;
      pointAry[j] := Map.DrawCood.ConvertSP(confArea.WorldPointAry[j]);
    end;
    if isInScreebRect then
      GpsMap.TmpDraw.Canvas.Polygon(pointAry);
  end;   *)
end;

procedure TGpsDrawLayer.DrawLine(DC: HDC; line: TMetaStruct);
var
  //points_count,sizeofbuffer:integer;
  start_point, end_Point: TPoint;
  newCount: integer;
  points: TWorldPointAry;
  subpoly: TIntegerDynArray;
begin
  case line._type of
    _Line:
      begin
        with line.Line do
        begin
          start_point := SP;
          end_point := EP;
          if GraphDraw.GetPenType(Pen.Pattern) <> WINDOWS_PEN then
          begin
            SetLength(points, 2);
            points[0] := start_point;
            points[1] := end_point;
            SetLength(subpoly, 1);
            subpoly[0] := 2;
            newCount := 1;
            if GisClip.ClipPolyPolyLine(Rect(0, 0, Map.DrawCood.ScreenWidth, Map.DrawCood.ScreenHeight),
              newCount, subpoly, points) then
              GraphDraw.TyoPolyPolyLine(Pen, DC, points, subpoly, newCount);
          end else
          begin
            GraphDraw.SetPen(DC, Pen);
            MoveToEx(DC, start_point.x, start_point.y, nil);
            LineTo(DC, end_point.x, end_point.y);
          end;
        end;
      end;
  else ;
  end;
end;

procedure TGpsDrawLayer.DrawRectIfOutorInAlarmArea(m: TDevice; CarCurrPos: TPoint);
var
  confArea: TConfineArea;
begin
  if (m.Alarm_OutCArea) or (m.Alarm_WAYOutCArea) then
  begin
    //confArea := GAreaManage.Find(m.OutCAreaId);
   // if confArea = nil then exit;
    GpsMap.TmpDraw.Canvas.Pen.Color := clFuchsia; //confArea.AreaColor;//用其限定区域的颜色
    GpsMap.TmpDraw.Canvas.Pen.Width := 3;
    GpsMap.TmpDraw.Canvas.Pen.Mode := pmMask;
    GpsMap.TmpDraw.Canvas.Ellipse(carCurrPos.x - 15, carCurrPos.y - 30, carCurrPos.x + 15, carCurrPos.y + 15);
  end;
  if (m.Alarm_InCArea) or (m.Alarm_WAYInCArea) then
  begin
    //confArea := GAreaManage.Find(m.InCAreaId);
    //if confArea = nil then exit;
    GpsMap.TmpDraw.Canvas.Pen.Color := clFuchsia; //confArea.AreaColor;//用其限定区域的颜色
    GpsMap.TmpDraw.Canvas.Pen.Width := 3;
    GpsMap.TmpDraw.Canvas.Pen.Mode := pmMask;
    GpsMap.TmpDraw.Canvas.Pen.Style := psDot; //驶入报警--虚线. 只有在Pen.Width =1时才画虚线。＞1时还是画了实线!!??
    GpsMap.TmpDraw.Canvas.Rectangle(carCurrPos.x - 23, carCurrPos.y - 30, carCurrPos.x + 24, carCurrPos.y + 15);
  end;
end;

class function TGpsDrawLayer.GetIdentification: Longword;
begin
  Result := TDrawLayer.GetIdentification + $3000;
end;

//覆盖了 在GPS图层 画 选中图元。

procedure TGpsDrawLayer.HighLightSelectedMetas(DC: HDC);
begin
  GpsMap.ClearTmpDraw;
  Draw;
end;

//是否须要重画,当跟踪车辆跑出地图后要重画地图.

function TGpsDrawLayer.IsRedrawMap: Boolean;
var
  carPos: TPoint;
begin
  Result := False;
  if AutoFollowDevice = nil then Exit;
  carPos := Map.Projection.LoLa2XY(EarthPoint(AutoFollowDevice.Longitude, AutoFollowDevice.Latitude));
  if not GeometryCalc.PointInRect(carPos, Map.DrawCood.WorldRect) then
  begin
    if Assigned(FOnReDrawMap) then
      FOnReDrawMap(Self, AutoFollowDevice);
    map.Zoom(1, carPos); //平移地图，使得跟踪车辆居中
    Result := True;
  end;
end;

procedure TGpsDrawLayer.SetAutoFollowDevice(const Value: TDevice);
begin
  FAutoFollowDevice := Value;
end;

procedure TGpsDrawLayer.SetDev(const Value: TDevice);
begin
  FDev := value;
end;

procedure TGpsDrawLayer.SetGpsMap(const Value: TGpsMap);
begin
  FGpsMap := Value;
end;

{ TUserMap }

//覆盖　画出区域

function TAreaDrawLayer.ClipDraw(DC: HDC; Rect: TWorldRect; Canvas: TCanvas): boolean;
begin
  DrawConfinArea(Dc);
  //inherited;
end;

procedure TAreaDrawLayer.DrawConfinArea(Dc: HDC);
var
  i, j, k: integer;
  confArea: TConfineArea;
  pointAry: TPointAry;
  isInScreenRect: boolean; //是否在地图中画出
  ////////////
  oldPen: HPen;
  oldBrush: HBrush;
//  rect:TWorldRect;
  newPen: TPenStruct;
  newBrush: TBrushStruct;
  rect: TRect;
begin
  if GAreaManage = nil then exit;
  try
    GraphDraw.SaveGDI(DC, oldPen, oldBrush);

    for i := 0 to GAreaManage.Count - 1 do
    begin
      confArea := GAreaManage.Items[i];
      if not confArea.IsDraw then Continue;

      isInScreenRect := False;

      SetLength(pointAry, confArea.PointCount);
      for j := 0 to confArea.PointCount - 1 do
      begin
        //只要多边形有一个点在当前屏幕中，就画出
        if GeometryCalc.PointInRect(confArea.WorldPointAry[j], Map.DrawCood.WorldRect) then
          isInScreenRect := true;
        pointAry[j] := Map.DrawCood.ConvertSP(confArea.WorldPointAry[j]);
      end;

      if isInScreenRect then
      begin
        newPen.color := confArea.AreaColor;
        newPen.Width := 3;
        if (confArea.AreaType = ALARM_OUT) or (confArea.AreaType = ALARM_WAY_OUT) then
          newPen.Pattern := CU_PS_SOLID
        else if (confArea.AreaType = ALARM_IN) or (confArea.AreaType = ALARM_WAY_IN) then
          newPen.Pattern := CU_PS_DASH3_1 //驶入报警--虚线
        else if (confArea.AreaType = ALARM_OVER_SPEET) or (confArea.AreaType = ASSEMBLE_WARRING)
                or (confArea.AreaType = OUT_TOWN) or (confArea.AreaType = ANTIFAKE_WARRING)
                or (confArea.AreaType = SUSPECTEDPETITIONS_WARRING) then
          newPen.Pattern := CU_PS_DASH1_1 //区域报警
        else if confArea.AreaType = SEEK_CAR  then  // 区域查车
          newPen.Pattern := CU_PS_SOLID;
        GraphDraw.SetPen(DC, newPen);
        newBrush.Transparent := 0;
        newBrush.Pattern := 0;
        GraphDraw.SetBrush(Dc, newBrush);
        if (confArea.AreaType = ALARM_WAY_OUT) or (confArea.AreaType = ALARM_WAY_IN) then
        begin
          Polyline(Dc, pointAry[0], length(pointAry));
            //测试画出长方形
{$IFOPT d+}
          SetLength(pointAry, 4);
          for k := 0 to confArea.RunWayRectList.Count - 1 do
          begin
            pointAry[0] := Map.DrawCood.ConvertSP(confArea.RunWayRectList.Items[k].PointList[0]);
            pointAry[1] := Map.DrawCood.ConvertSP(confArea.RunWayRectList.Items[k].PointList[1]);
            pointAry[2] := Map.DrawCood.ConvertSP(confArea.RunWayRectList.Items[k].PointList[2]);
            pointAry[3] := Map.DrawCood.ConvertSP(confArea.RunWayRectList.Items[k].PointList[3]);
            Polygon(Dc, pointAry[0], 4);
          end;
{$ENDIF}
        end
        else
          Polygon(Dc, pointAry[0], length(pointAry));
        //TextOut(Dc,0,0,'draw',4);   //测试看是否画了
      end;
    end;


    GraphDraw.ReStoreGDI(DC, oldPen, oldBrush);
  except on E: Exception do
      elog.SystemLog.AddLog(' TAreaDrawLayer.DrawConfinArea ', e.Message);
  end;
end;

{ TUserDefinedTextLayer }

function TUserDefinedTextLayer.ClipDraw(DC: HDC;
  Rect: TWorldRect; Canvas: TCanvas): boolean;
begin
  DrawUserDefinedText(Dc);
end;

procedure TUserDefinedTextLayer.DrawUserDefinedText(Dc: HDC);
var
  i, Left, Right: integer;
  beginI: integer;
  oldPen: HPen;
  oldBrush: HBrush;
  p: TPoint;
begin
  try
    if GTextManage = nil then exit;
    GraphDraw.SaveGDI(DC, oldPen, oldBrush);
    try
      Left := Map.DrawCood.WorldRect.Left;
      Right := Map.DrawCood.WorldRect.Right;
      Begini := -1;
      for i := 0 to GTextManage.Count - 1 do
      begin
        if Begini < 0 then
        begin
          if GTextManage.Item[i]^.Symbol.Position.X >= Left then
          begin
            Begini := i;
          //判断点是否在当前屏幕内
            if GTextManage.Item[i]^.MaxScale > 0 then
              if not ((Map.DrawCood.Scale > GTextManage.Item[i]^.MinScale) and (Map.DrawCood.Scale < GTextManage.Item[i]^.MaxScale)) then
                Continue;
            if GeometryCalc.PointInRect(GTextManage.Item[i]^.Symbol.Position, Map.DrawCood.WorldRect) then
            begin
              p := Map.DrawCood.ConvertSP(GTextManage.Item[i]^.Symbol.Position);
              GraphDraw.DrawCustomSymbol(DC, GTextManage.Item[i]^.Symbol.CustomSymbol, p);
              p.Y := p.Y - 15;
              GraphDraw.TyoDrawTrueFont(DC, GTextManage.Item[i]^.Text, GTextManage.Item[i]^.TextFont, p);
            end;
          end;
        end
        else
        begin
        //判断当前点的X有没有过屏幕的RIGHT
          if GTextManage.Item[i]^.Symbol.Position.X >= Right then
            Break;
        //判断点是否在当前屏幕内
          if GTextManage.Item[i]^.MaxScale > 0 then
            if not ((Map.DrawCood.Scale > GTextManage.Item[i]^.MinScale) and (Map.DrawCood.Scale < GTextManage.Item[i]^.MaxScale)) then
              Continue;
          if GeometryCalc.PointInRect(GTextManage.Item[i]^.Symbol.Position, Map.DrawCood.WorldRect) then
          begin
            p := Map.DrawCood.ConvertSP(GTextManage.Item[i]^.Symbol.Position);
            GraphDraw.DrawCustomSymbol(DC, GTextManage.Item[i]^.Symbol.CustomSymbol, p);
            p.Y := p.Y - 15;
            GraphDraw.TyoDrawTrueFont(DC, GTextManage.Item[i]^.Text, GTextManage.Item[i]^.TextFont, p);
          end;
        end;
      end;
    finally
      GraphDraw.ReStoreGDI(DC, oldPen, oldBrush);
    end;
  except on E: Exception do
      elog.SystemLog.AddLog(' TUserDefinedTextLayer.DrawUserDefinedText ', e.Message);
  end;
end;

{ TGpsPlayDrawLayer }

function TGpsPlayDrawLayer.Draw: boolean;
var
//  i: Integer;
  desRect: TRect;
  carCurrPos: TPoint;
  pMeta: PMetaStruct;
  m: TDevice;
//  tempdc: TDrawBmp;
begin
  if not (lyVisible in State) then Exit;
  //当不为轨迹回时退出
  if not GpsMap.IsPlayGpsData then Exit;
  //把当前地图上的图元清除
  MetaInScreen.Clear;
  //画车
  m := PlayDev;
  if m.MetaIndex >= Data.MetaCount then Exit;
  pMeta := Data.GetMetaPointer(m.MetaIndex {,Map.Projection.ProjectionType});
  //图元未激活
  if not pMeta^.Enabled then Exit;
  carCurrPos := pMeta^.Symbol.Position;
  //目标不在屏幕中
  if not GeometryCalc.PointInRect(carCurrPos, Map.DrawCood.WorldRect) then Exit;
  carCurrPos := Map.DrawCood.ConvertSP(carCurrPos);
  //画轨迹点
  if m.DrawTrack then DrawACarCourse(m);
  //画车
//  ResManage.BmpList.Draw(GpsMap.TmpDraw.Canvas, carCurrPos.X - 8, carCurrPos.Y - 8,
//    m.Car.ResIndex);
  //画车牌号
  SetBkColor(GpsMap.TmpDraw.Canvas.Handle, clGreen);
  SetTextColor(GpsMap.TmpDraw.Canvas.Handle, clCream);
  desRect := classes.Rect(carCurrPos.x - 35, carCurrPos.y - 19, carCurrPos.x + 31, carCurrPos.y + 60);
  drawtext(GpsMap.TmpDraw.Canvas.Handle, PChar(m.Car.No), Length(m.Car.No), desRect, DT_CENTER);

  GpsMap.TmpDrawChanged := True;
  MetaInScreen.Add(m.MetaIndex);
end;

function TGpsPlayDrawLayer.IsRedrawMap: Boolean;
var
  carPos: TPoint;
begin
  Result := False;
  carPos := Map.Projection.LoLa2XY(EarthPoint(playDev.Longitude, playDev.Latitude));
  if not GeometryCalc.PointInRect(carPos, Map.DrawCood.WorldRect) then
  begin
    map.Zoom(1, carPos); //平移地图，使得跟踪车辆居中
    Result := True;
  end;
end;


{ TAlarmNoSybolLayer }

function TAlarmNoSybolLayer.ClipDraw(DC: HDC; Rect: TWorldRect;
  Canvas: TCanvas): boolean;
begin
  DrawAlarmNoSybolLayer(dc);
  DrawRoadsLayer(Dc);
end;

procedure TAlarmNoSybolLayer.DrawAlarmNoSybolLayer(Dc: HDC);
  function GetDistance(P1, P2: TPoint): Integer;
  var
    d: double;
  begin
    d := Sqrt(power(p1.X - p2.X, 2) + power(p1.Y - p2.Y, 2));
    Result := Round(d);
  end;
var
  i, j, k: integer;

  pointAry: TPointAry;
  isInScreenRect: boolean; //是否在地图中画出

  oldPen: HPen;
  oldBrush: HBrush;

  newPen: TPenStruct;
  newBrush: TBrushStruct;
  rect: TRect;

  BaseArea: TBaseArea;

  NoSymbolArea: TNoSymbolArea;

  RectangleArea: TRectangleArea;

  CircleArea: TCircleArea;
  left: TWorldPoint;
  right: TWorldPoint;
  Apoint: TPoint;
  Circle: Tpoint;
  FOrgPoint: Tpoint;
  radius: integer;
  PolyLineArea: TPolyLineArea;
  lineSection: TLineSection;
begin
  if FAllAreaManage = nil then exit;
  try
    GraphDraw.SaveGDI(DC, oldPen, oldBrush);

    for i := 0 to FAllAreaManage.AllCircleList.Count - 1 do
    begin
      BaseArea := TBaseArea(FAllAreaManage.AllCircleList.Items[i]);
      if not basearea.isshow then continue;
      case baseArea.AreaPictureKind of
        0: begin
            CircleArea := TCircleArea(FAllAreaManage.AllCircleList.Items[i]);
            newPen.color := clred;
            newPen.Width := 3;
            newPen.Pattern := CU_PS_DASH1_1;
            GraphDraw.SetPen(DC, newPen);
            newBrush.Transparent := 0;
            newBrush.Pattern := 0;
            GraphDraw.SetBrush(Dc, newBrush);

            //把2个点转换成平面坐标
            Circle := Map.DrawCood.ConvertSP(Map.Projection.LoLa2XY(CircleArea.ACircle));
            FOrgPoint := Map.DrawCood.ConvertSP(Map.Projection.LoLa2XY(CircleArea.lastPoint));
            radius := GetDistance(Circle, FOrgPoint);

            Ellipse(dc, Circle.X + radius, Circle.Y + radius, Circle.X - radius, Circle.Y - radius);
          end;
        1: begin
            RectangleArea := TRectangleArea(FAllAreaManage.AllCircleList.Items[i]);
            left := Map.Projection.LoLa2XY(RectangleArea.leftPoint);
            right := Map.Projection.LoLa2XY(RectangleArea.RightPoint);
            setlength(pointAry, 4);

            pointAry[0] := Map.DrawCood.ConvertSP(left);
            pointAry[2] := Map.DrawCood.ConvertSP(right);

            Apoint.X := pointAry[2].X;
            Apoint.Y := pointAry[0].y;
            pointAry[1] := Apoint;
            Apoint.X := pointAry[0].X;
            Apoint.Y := pointAry[2].y;
            pointAry[3] := Apoint;
            newPen.color := clred;
            newPen.Width := 3;
            newPen.Pattern := CU_PS_DASH1_1;

            GraphDraw.SetPen(DC, newPen);
            newBrush.Transparent := 0;
            newBrush.Pattern := 0;
            GraphDraw.SetBrush(Dc, newBrush);

            Polygon(Dc, pointAry[0], length(pointAry));
          end;
        2: begin
            NoSymbolArea := TNoSymbolArea(FAllAreaManage.AllCircleList.Items[i]);
            SetLength(pointAry, NoSymbolArea.PointCount);
            for j := 0 to NoSymbolArea.PointCount - 1 do
            begin
        //只要多边形有一个点在当前屏幕中，就画出
              if GeometryCalc.PointInRect(NoSymbolArea.WorldPointAry[j], Map.DrawCood.WorldRect) then
                isInScreenRect := true;
              pointAry[j] := Map.DrawCood.ConvertSP(NoSymbolArea.WorldPointAry[j]);
            end;
            newPen.color := clred;
            newPen.Width := 3;
            newPen.Pattern := CU_PS_DASH1_1;

            GraphDraw.SetPen(DC, newPen);
            newBrush.Transparent := 0;
            newBrush.Pattern := 0;
            GraphDraw.SetBrush(Dc, newBrush);

            Polygon(Dc, pointAry[0], length(pointAry));

          end;
        3:
        begin
          PolyLineArea := TPolyLineArea(FAllAreaManage.AllCircleList.Items[i]);
          for k := 0 to PolyLineArea.LineSectionCount - 1 do
          begin
            lineSection := PolyLineArea.LineSections[k];
            SetLength(pointAry, lineSection.PointCount);
            for j := 0 to lineSection.PointCount - 1 do
            begin
              if GeometryCalc.PointInRect(lineSection.WPointAry[j], Map.DrawCood.WorldRect) then
                isInScreenRect := true;
              pointAry[j] := Map.DrawCood.ConvertSP(lineSection.WPointAry[j]);
            end;
            newPen.color := clred;
            newPen.Width := 3;
            newPen.Pattern := CU_PS_DASH1_1;

            GraphDraw.SetPen(DC, newPen);
            newBrush.Transparent := 0;
            newBrush.Pattern := 0;
            GraphDraw.SetBrush(Dc, newBrush);

            Polyline(Dc, pointAry[0], length(pointAry));
          end;  

        end;
      end;
    end;

    GraphDraw.ReStoreGDI(DC, oldPen, oldBrush);
  except on E: Exception do
      elog.SystemLog.AddLog(' TAreaDrawLayer.DrawConfinArea ', e.Message);
  end;
end;

procedure TAlarmNoSybolLayer.DrawRoadsLayer(Dc: HDC);
var
  i,j:Integer;
  road:TRoad;
  ptCnt:Integer;
  pointAry:array of Tpoint;
  ep :TEarthPoint;
  wp:TWorldPoint;
  isInScreenRect:Boolean;
  oldPen: HPen;
  oldBrush: HBrush;    
  newPen: TPenStruct;
  newBrush: TBrushStruct;
begin
  if RoadManage = nil then exit;
  try
    GraphDraw.SaveGDI(DC, oldPen, oldBrush);

    for i := 0 to RoadManage.Count - 1 do
    begin
      road := RoadManage.Items[i];
      if not (road.IsVisible=1) then continue;
      SetLength(pointAry, road.RoadPointCnt);
      isInScreenRect := False;
      for j := 0 to road.RoadPointCnt - 1 do
      begin
        //只要路段上有一个点在当前屏幕中，就画出
        ep := road.RoadPointAry[j];
        wp := Map.Projection.LoLa2XY(ep);
        if GeometryCalc.PointInRect(wp, Map.DrawCood.WorldRect) then
          isInScreenRect := true;
        pointAry[j] := Map.DrawCood.ConvertSP(wp);
      end;
      if not isInScreenRect then continue;
      newPen.color := road.RoadColor; //newPen.color := clred;
      newPen.Width := 3;
      newPen.Pattern := CU_PS_DASH1_1;
      GraphDraw.SetPen(DC, newPen);
      newBrush.Transparent := 0;
      newBrush.Pattern := 0;
      GraphDraw.SetBrush(Dc, newBrush);

      Polyline(Dc,pointAry,road.RoadPointCnt);//画折线
    end;
    GraphDraw.ReStoreGDI(DC, oldPen, oldBrush);
  except on E: Exception do
      elog.SystemLog.AddLog(' TAreaDrawLayer.DrawConfinArea ', e.Message);
  end;
end;

end.

