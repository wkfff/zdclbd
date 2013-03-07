unit mapoutlook;

interface
uses
  windows,
  Controls,
  classes,
  Graphics,
  emapker,
  MetaDefine,
  emape,
  tyoGraph,
  geome;

type
  TOutlook = class;
  TOnNewPosition=procedure(ATopLeft:TEarthPoint;ABottomRight:TEarthPoint) of object;
  TOutlook = class(TActionMap)
  private
    FOnTranslate:TOnNewPosition;
    FCurrentRegion:Array[0..12] of TPoint;
    FLastRegion:Array[0..12] of TPoint;
    FMapOutLine:array[0..12]of TEarthPoint;
    FMapScreenOutLine:array[0..12] of TPoint;
    FOutLineColor:TColor;
    FAutoZoom:boolean;
    FZoomRatio:double;
    FMap:TCustomMap;
    FOldWorld:TWorldRect;
    procedure GetMapOutLinePoint;
    procedure RefreshLayers;
    procedure FilterMeta(PMeta:TPointerMeta;var Flag:boolean);
  protected
    procedure DoPaint;override;
    procedure DrawMapOutLine();
    procedure MouseDown(Button: TMouseButton;Shift: TShiftState; X, Y: Integer);override;
    procedure MouseMove(Shift: TShiftState; X,Y: Integer);override;
    procedure MouseUp(Button: TMouseButton;Shift: TShiftState; X, Y: Integer);override;
    procedure SetMap(Value:TCustomMap);
  public
    constructor Create(AOwner: TComponent; Provider: TLayerProvider);override;
    procedure Refresh;
    procedure RefreshLayerAdd;//当增加图层时
    procedure RefreshLayerRemove;//当减少图层时
    procedure RefreshLayer_IfOrderChanged;      //图层数无变化。当图层顺序变化时，处理
    property OnPositionChanged:TOnNewPosition read FOnTranslate write FOnTranslate;
    property Map:TCustomMap read FMap write SetMap;
    property AutoZoom:boolean read FAutoZoom write FAutoZoom;
    property ZoomRatio:Double read FZoomRatio write FZoomRatio;
  end;

implementation
uses
  Math,
  Sysutils,
  StaticProc;
{ TOutlook }

constructor TOutlook.Create(AOwner: TComponent; Provider: TLayerProvider);
begin
  inherited;
  FOutLineColor:=clBlue;
  FAutoZoom:=False;
  FZoomRatio:=3;
  MouseAction:=actNoAction;
  //添加默认投影
  Projection.ProjectionType:=1;
  HasProjection:=True;
end;

procedure TOutlook.DoPaint;
var
  newWorld:TWorldRect;
  center:TWorldPoint;
begin
  inherited;
  //sha:只有在鸟瞰图和地图上的图层数不一样时，才需要刷新是否增减图层 2004-12-07
  //if Layers.Count <> FMap.Layers.Count then refreshlayers;
  RefreshLayers;

  if FAutoZoom then
  begin
    center.x:=(FMap.DrawCood.WorldRect.Xmin div 2+FMap.DrawCood.WorldRect.Xmax div 2);
    center.y:=(FMap.DrawCood.WorldRect.Ymin div 2+FMap.DrawCood.WorldRect.Ymax div 2);
    center:=projection.LoLa2XY(FMap.Projection.XY2LoLa(center));

    newWorld.Xmin:=center.x-Round(FMap.DrawCood.WorldRect.Xmax*FZoomRatio-FMap.DrawCood.WorldRect.Xmin*FZoomRatio);
    newWorld.Xmax:=center.x+Round(FMap.DrawCood.WorldRect.Xmax*FZoomRatio-FMap.DrawCood.WorldRect.Xmin*FZoomRatio);
    newWorld.Ymin:=center.y-Round(FMap.DrawCood.WorldRect.Ymax*FZoomRatio-FMap.DrawCood.WorldRect.Ymin*FZoomRatio);
    newWorld.Ymax:=center.y+Round(FMap.DrawCood.WorldRect.Ymax*FZoomRatio-FMap.DrawCood.WorldRect.Ymin*FZoomRatio);

    //当地图的比例变化（放大缩小时），
    //当地图的中心点已不在鸟瞰图内时，--add by sha 20041213
    //鸟瞰图DrawCood.SetWorld
    if (not GeometryCalc.PointInRect(center, DrawCood.WorldRect)) or
       (ABS((FOldWorld.Xmax*1.0-FOldWorld.Xmin*1.0)-
        (newWorld.Xmax*1.0-newWorld.Xmin*1.0))>TOZERO) then
    begin
      DrawCood.SetWorld(newWorld);
      FOldWorld:=newWorld;
      Draw;
    end;
  end;
  //画出关联地图的轮廓线
  GetMapOutLinePoint;
  canvas.Pen.Color:=FOutLineColor;
  canvas.Pen.Mode:=pmCopy;
  canvas.Polyline(FMapScreenOutLine);
end;

procedure TOutlook.DrawMapOutLine;
begin
end;

procedure TOutlook.GetMapOutLinePoint;
var
  mapRect:TRect;
  i:integer;
  WidthDiv4,HeightDiv4:double;
begin
  mapRect.Left:=0;  mapRect.Top:=0;
  mapRect.Right:=FMap.Width-FMap.Left;
  mapRect.Bottom:=FMap.Height-FMap.Top;
  WidthDiv4:=FMap.Width/3;
  HeightDiv4:=FMap.Height/3;
  //比例控制
  for i:=0 to 12 do
  begin
    if i in [0..3] then
    begin
      FMapOutLine[i]:=FMap.projection.XY2LoLa(FMap.DrawCood.ConvertWP(
        Point(Round(i*WidthDiv4),0)));
    end;
    if i in [4..6] then
    begin
      FMapOutLine[i]:=FMap.projection.XY2LoLa(FMap.DrawCood.ConvertWP(
        Point(mapRect.Right,Round((i-3)*HeightDiv4))));
    end;
    if i in [7..9] then
    begin
      FMapOutLine[i]:=FMap.projection.XY2LoLa(FMap.DrawCood.ConvertWP(
        Point(mapRect.Right-Round((i-6)*WidthDiv4),mapRect.Bottom)));
    end;
    if i in [10..12] then
    begin
      FMapOutLine[i]:=FMap.projection.XY2LoLa(FMap.DrawCood.ConvertWP(
        Point(0,mapRect.Bottom-Round((i-9)*HeightDiv4))));
    end;
    FMapScreenOutLine[i]:=DrawCood.ConvertSP(Projection.LoLa2XY(FMapOutLine[i]));
  end;

end;


procedure TOutlook.MouseDown(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
var
  newWorldRect:TWorldRect;
  worldPoints:TWorldPointAry;
  i:integer;
  sc: Double;
begin
  SetLength(worldPoints,High(FCurrentRegion)+1);
  for i:=0 to High(FCurrentRegion)do
    worldPoints[i]:=FMap.Projection.LoLa2XY(
      Projection.XY2LoLa(DrawCood.ConvertWP(FCurrentRegion[i])));

  newWorldRect.Xmin:=Min(worldPoints[0].x,worldPoints[1].x);
  newWorldRect.Xmax:=Max(worldPoints[0].x,worldPoints[1].x);
  newWorldRect.Ymin:=Min(worldPoints[0].y,worldPoints[1].y);
  newWorldRect.Ymax:=Max(worldPoints[0].y,worldPoints[1].y);
  for i:=2 to High(worldPoints) do
  begin
    newWorldRect.Xmin:=Min(newWorldRect.Xmin,worldPoints[i].x);
    newWorldRect.Xmax:=Max(newWorldRect.Xmax,worldPoints[i].x);
    newWorldRect.Ymin:=Min(newWorldRect.Ymin,worldPoints[i].y);
    newWorldRect.Ymax:=Max(newWorldRect.Ymax,worldPoints[i].y);
  end;
  //sc 为新加变量 用于保证地图的比例尺不会发生变化
  sc := FMap.DrawCood.GetRealScale;
  FMap.DrawCood.SetWorld(newWorldRect);
  FMap.DrawCood.SetRealScale(1/sc);
  FMap.Draw;
  for i:=0 To high(FLastRegion) do
    FLastRegion[i]:=Point(-1,-1);
  Paint;
  if assigned(OnPositionChanged) then
    OnPositionChanged(FMapOutLine[0],FMapOutLine[6]);    //有问题
  inherited;
end;

procedure TOutlook.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  i:integer;
  center:TPoint;
begin
  CaptureMouse:=True;
  if not PtInRect(GetClientRect,Point(X,Y)) then
  begin
    canvas.Pen.Mode:=pmNotXor;
    canvas.Pen.Color:=clBlack;
    canvas.Polyline(FLastRegion);
    for i:=0 To high(FLastRegion) do
      FLastRegion[i]:=Point(-1,-1);
    CaptureMouse:=False;
  end
  else
  begin
    canvas.Pen.Mode:=pmNotXor;
    canvas.Pen.Color:=clBlack;
    canvas.PolyLine(FLastRegion);
    //获得FCurrentRegion
    GetMapOutLinePoint;
    center:=Point((FMapScreenOutLine[0].x+FMapScreenOutLine[6].x)div 2,
      (FMapScreenOutLine[0].y+FMapScreenOutLine[6].y)div 2);
    for i:=0 to high(FCurrentRegion) do
    begin
      FCurrentRegion[i].x:=FMapScreenOutLine[i].x+(X-center.x);
      FCurrentRegion[i].y:=FMapScreenOutLine[i].y+(Y-center.y);
    end;
    canvas.PolyLine(FCurrentRegion);
    system.move(FCurrentRegion[0],FLastRegion[0],13*SizeOf(TPoint));
  end;
  inherited;
end;      

procedure TOutlook.MouseUp(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
end;



procedure TOutlook.SetMap(Value: TCustomMap);
var
  i:integer;
begin
  if Value.Projection.IsNonEarth then
  begin
    Projection.ProjectionType:=Value.Projection.ProjectionType;
  end;

  FMap:=Value;
  Layers.closeAllLayers;
  for i:= FMap.Layers.Count -1 downto 0 do   //sha
  //for i:=0 to FMap.Layers.Count-1 do
  begin
    Layers.AddLayerWithProvider(FMap.layers.Layers[i].data);
    Layers.Layers[FMap.Layers.Count-i].OnFilterMeta:=FilterMeta;//sha2005-5-20
    ////Layers.Layers[i].OnFilterMeta:=FilterMeta;
    //WorldOutbox:=GeoGeo.MergeRect(WorldOutBox,Layers.Layers[i].WorldOutBox);
  end;
  DrawCood.SetScreen(Width,Height);
  DrawCood.SetWorld(Outbox);
end;

procedure TOutlook.RefreshLayers;
begin
//鸟看图,出错,可能是因为 RefreshLayerRemove,RefreshLayerAdd,RefreshLayer_IfOrderChanged改变原史数据  by dxf 2007-2-8
  if Fmap.Layers.Count < Layers.Count then
    RefreshLayerRemove
  else if Fmap.Layers.Count > Layers.Count then
    RefreshLayerAdd
  else if Fmap.Layers.Count =Layers.Count then
    RefreshLayer_IfOrderChanged;
end;

procedure TOutlook.Refresh;
begin
  if Parent.Visible then
    DoPaint;
end;

procedure TOutlook.FilterMeta(PMeta: TPointerMeta; var Flag: boolean);
begin
  Flag:=((PMeta.PWorld^._type = _Symbol) or (PMeta.PWorld^._type = _Text));
end;

procedure TOutlook.RefreshLayerAdd;
var
  i:integer;
  oldWorldRect:TWorldRect;
  validData,addLayerBj:boolean;
  function LayerInMap(Gid:Longword):boolean;
  var
    i:integer;
  begin
    Result:=False;
    for i:=0 to Layers.Count-1 do
    begin
      if Layers.Layers[i].Data.ID=Gid then
      begin
        Result:=True;
        Exit;
      end;
    end;
  end;

begin
  validData:=False;
  if Layers.Count<>0 then
  begin
    oldWorldRect:=DrawCood.WorldRect;
    validData:=True;
  end;
  addLayerBj:= false;
  for i:= FMap.Layers.Count -1 downto 0 do    //sha
  //for i:= 0 to FMap.Layers.Count -1 do
  begin
    if not LayerInMap(FMap.Layers.Layers[i].data.ID) then
    begin
      Layers.AddLayerWithProvider(FMap.layers.Layers[i].data);
      //WorldOutbox:=GeoGeo.MergeRect(WorldOutBox,Layers.Layers[i].WorldOutBox);
      Layers.Layers[FMap.Layers.Count-i].OnFilterMeta:=FilterMeta;
      //Layers.Layers[i].OnFilterMeta:=FilterMeta;
      addLayerBj := true;
    end;
  end;

  if addLayerBj then Draw;{sha改，如果在使用过程中，用户添加了图层，鸟瞰图也应重画}
  if validData then
    DrawCood.SetWorld(oldWorldRect)
  else
    DrawCood.SetWorld(Outbox);
end;

procedure TOutlook.RefreshLayerRemove;
var
  i:integer;
  oldWorldRect:TWorldRect;
  validData,delLayBj:boolean;
  function LayerInMap(Gid:Longword):boolean;
  var
    i:integer;
  begin
    Result:=False;  
    for i:=0 to FMap.Layers.Count-1 do
    begin
      if FMap.Layers.Layers[i].Data.ID=Gid then
      begin
        Result:=True;
        Exit;
      end;
    end;
  end;
begin
  validData:=False;
  if Layers.Count<>0 then
  begin
    oldWorldRect:=DrawCood.WorldRect;
    validData:=True;
  end;
  delLayBj := false;
  for i:=0 to Layers.Count-1 do
  begin
    if not LayerInMap(Layers.Layers[i].data.ID) then
    begin
      Layers.CloseLayer(i);
      //WorldOutbox:=GeoGeo.MergeRect(WorldOutBox,Layers.Layers[i].WorldOutBox);
      //Layers.Layers[i].OnFilterMeta:=FilterMeta;
      delLayBj:= true;
    end;
  end;
  if delLayBj then Draw; {add by sha}
  if validData then
    DrawCood.SetWorld(oldWorldRect)
  else
    DrawCood.SetWorld(Outbox);
end;

procedure TOutlook.RefreshLayer_IfOrderChanged;
var
  i,j:integer;
  modifyBj: Boolean;
begin
  modifyBj := False;
  for i:=0 to Layers.Count-1 do
  begin
    //如果有一层不一样，则全部重新载入。
    //---Fmap.Layers.Layer  ---当前地图的图层
    //---Layers.Layer       --- 鸟瞰图的图层
    if Fmap.Layers.Layer[i].LayerName <> Layers.Layer[i].LayerName then
    begin
      Layers.closeAllLayers;    //--此时 Layers.Count=0
      for j:= Fmap.Layers.Count -1 downto 0 do
      begin
        Layers.AddLayerWithProvider(FMap.layers.Layers[j].data);
        Layers.Layers[Fmap.Layers.Count-j].OnFilterMeta:=FilterMeta;
      end;
      modifyBj:= true;
      break;//如果有一层不一样，则全部重新载入。并跳出去
    end;
  end;
  if modifyBj then Draw;
end;

end.
