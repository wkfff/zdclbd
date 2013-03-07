unit GpsLibEUnit;

interface
uses
  Windows, classes, Graphics, emapker, emape, ExtCtrls, tyoGraph,
  emapdex, MetaDefine, geome,  math, Types, ClipCalc,
  PlayGlobalUnit,carunit, GpsLibUnit;

type
  TGpsPlayDrawLayer = class(TGpsDrawLayer)
  protected
    function Draw:boolean;override;
  public
    function IsRedrawMap: Boolean;override;
  end;

  TGpsPlayMap = class(TGpsMap)
  protected
    procedure DoScanTarget;override;
  public
    procedure RemoveMeta;
  end;
implementation
uses
  uGloabVar, ResUnit, Imglist;

{ TGpsPlayMap }

procedure TGpsPlayMap.DoScanTarget;
var
//  i: Integer;
//  m: TDevice;
  pMeta: PWorldMeta;
  p: TEarthPoint;
begin
  if playDev = nil then exit;
  // if now dev be added
  if GpsDataLayer.MetaCount = 0 then
    playDev.MetaIndex := GpsDataLayer.AddNewMeta;
  //if have new target data arrive, maybe need refresh map
  if playDev.State[STAT_NEWDATA_GIS] then
  begin
    try                     
      playDev.MetaIndex:=0;
      pMeta := GpsDataLayer.GetMetaPointer(playDev.MetaIndex{,Projection.ProjectionType});
      p.Longitude := playDev.Longitude;
      p.Latitude := playDev.Latitude;
      pMeta^.Symbol.Position :=Self.Projection.LoLa2XY(p)
      //GpsDataLayer.ModifyMeta(playDev.MetaIndex,aMeta);
    finally
      playDev.State[STAT_NEWDATA_GIS] := False;
    end;
    NeedDraw := True;
  end;
end;

procedure TGpsPlayMap.RemoveMeta;
begin
  if GpsDataLayer.MetaCount>0 then GpsDataLayer.RemoveMetaByIndex(0);
end;

{ TGpsPlayDrawLayer }

function TGpsPlayDrawLayer.Draw:boolean;
var
//  i: Integer;
  desRect: TRect;
  carCurrPos: TPoint;
  pMeta:PWorldMeta;
  m: TDevice;
//  tempdc: TDrawBmp;
begin
  if not (lyVisible in State) then Exit;
  //把当前地图上的图元清除
  MetaInScreen.Clear;
  //画车
  m := PlayDev;
  if m.MetaIndex >= Data.MetaCount then Exit;
  pMeta := Data.GetMetaPointer(m.MetaIndex{,Map.Projection.ProjectionType});
  //图元未激活
  if not pMeta^.Enabled then Exit;
  carCurrPos := pMeta^.Symbol.Position;
  //目标不在屏幕中
  if not GeometryCalc.PointInRect(carCurrPos, Map.DrawCood.WorldRect) then Exit;
  carCurrPos := Map.DrawCood.ConvertSP(carCurrPos);
  //画轨迹点
  if m.DrawTrack then DrawACarCourse(m);
  //画车
  ResManage.BmpList.Draw(GpsMap.TmpDraw.Canvas,carCurrPos.X-8,carCurrPos.Y-8,
    m.Car.ResIndex);
  //画车牌号
  SetBkColor(GpsMap.TmpDraw.Canvas.Handle,clGreen);
  SetTextColor(GpsMap.TmpDraw.Canvas.Handle,clCream);
  desRect := classes.Rect(carCurrPos.x-35,carCurrPos.y-19,carCurrPos.x+31,carCurrPos.y+60);
  drawtext(GpsMap.TmpDraw.Canvas.Handle, PChar(m.Car.No),Length(m.Car.No),desRect, DT_CENTER);
      
  GpsMap.TmpDrawChanged:= True;
  MetaInScreen.Add(m.MetaIndex);
end;

function TGpsPlayDrawLayer.IsRedrawMap: Boolean;
var
  carPos: TPoint;
begin
  Result:=False;
  carPos := Map.Projection.LoLa2XY(EarthPoint(playDev.Longitude,playDev.Latitude));
  if not GeometryCalc.PointInRect(carPos, Map.DrawCood.WorldRect)then
  begin
    map.Zoom(1,carPos); //平移地图，使得跟踪车辆居中
    Result:= True;
  end;
end;

end.
