unit mapMagnifier;

interface
uses
  Windows,
  classes,
  emape,
  emapker,
  MetaDefine;
type
  TGeoMagnifier=class(TActionMap)
  private
    FDrawMousePos: boolean;
    FViewRange: integer;
    FZoomRatio: double;
    FMap: TActionMap;
    procedure SetDrawMousePos(const Value: boolean);
    procedure SetMap(const Value: TActionMap);
    procedure SetViewRange(const Value: integer);
    procedure SetZoomRatio(const Value: double);
    procedure FilterMeta(PMeta: TPointerMeta; var Flag: boolean);
    procedure MapMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  public
    constructor Create(AOwner: TComponent; Provider: TLayerProvider);override;
    destructor Destroy;override;
    procedure RefreshMagnifier;
    procedure RefreshLayers;
    procedure RefreshLayerAdd;
    procedure RefreshLayerRemove;
    property Map:TActionMap read FMap write SetMap;
    property ZoomRatio:double read FZoomRatio write SetZoomRatio;
    property ViewRange:integer read FViewRange write SetViewRange;
    property DrawMousePos:boolean read FDrawMousePos write SetDrawMousePos;

  end;

implementation
uses
  StaticProc,
  math,
  RunData,
  tyoGraph,
  graphics;
{ TGeoMagnifier }

constructor TGeoMagnifier.Create(AOwner: TComponent;
  Provider: TLayerProvider);
begin
  inherited;
  FDrawMousePos:=True;
  FViewRange:=10;
  FZoomRatio:=5;

  DisplayScale:=False;
end;

destructor TGeoMagnifier.Destroy;
begin
  inherited;
end;

procedure TGeoMagnifier.RefreshLayers;
begin
  RefreshLayerRemove;
  RefreshLayerAdd;
end;

procedure TGeoMagnifier.RefreshMagnifier;
var
  orgScnRect:TRect;
  orgGeoRect,tmpRect: TEarthRect;
  center:TPoint;
  RectWidth,RectHeight:integer;
  newRect:TWorldRect;
  MousePoint:Tpoint;
//  gmsSymbol:TGeoGmsSymbol;
begin
  MousePoint:=FMap.CurrentPoint;
  orgScnRect.Left  :=MousePoint.x-FViewRange;
  orgScnRect.Right :=MousePoint.x+FViewRange;
  orgScnRect.Top   :=MousePoint.y-FViewRange;
  orgScnRect.Bottom:=MousePoint.y+FViewRange;

  with orgGeoRect do
  begin
    TopLeft:=FMap.Projection.XY2LoLa(FMap.DrawCood.ConvertWP(orgScnRect.TopLeft));
    BottomRight:=FMap.Projection.XY2LoLa(FMap.DrawCood.ConvertWP(orgScnRect.BottomRight));
    tmpRect.Xmin:=min(Xmax,Xmin);
    tmpRect.Xmax:=max(Xmax,Xmin);
    tmpRect.Ymin:=min(Ymax,Ymin);
    tmpRect.Ymax:=max(Ymax,Ymin);
    orgGeoRect:=tmpRect;
  end;

  with newRect do
  begin
    TopLeft    :=Projection.LoLa2XY(orgGeoRect.TopLeft);
    BottomRight:=Projection.LoLa2XY(orgGeoRect.BottomRight);

    RectWidth :=(Xmax-Xmin) div 2;
    RectHeight:=(Ymax-Ymin) div 2;
    center.x  :=(Xmax+Xmin) div 2;
    center.y  :=(Ymax+Ymin) div 2;
    Xmin :=center.x-Round(RectWidth / FZoomRatio);
    Ymin :=center.y-Round(RectHeight / FZoomRatio);
    Xmax :=center.x+Round(RectWidth / FZoomRatio);
    Ymax :=center.y+Round(RectHeight / FZoomRatio);
  end;
  DrawCood.SetWorld(newRect);
  Draw;
  center:=DrawCood.ConvertSP(center);
  canvas.MoveTo(center.x,Top);
  canvas.LineTo(center.x,Top+Height);
  canvas.MoveTo(Left,center.y);
  canvas.LineTo(Left+Width,center.y);
  {$IFDEF DESIGN}
  //编辑地图时画出鼠标捕获位置
  if (FMap is TEditMap)and(TEditMap(FMap).NearestPointValid)then
  begin
    center:=DrawCood.ConvertSP(
      Projection.LoLa2XY(TEditMap(FMap).NearestPoint.SnapGeoPoint));
    case TEditMap(FMap).NearestPoint.SnapType of
      OBJ_SNAP_EXTREMEPOINT:
        begin
          canvas.Pen.Color:=clBlue;
          lf.x:=center.x-GlobalData.SnapPixelSize;
          lf.y:=center.y-GlobalData.SnapPixelSize;
          rb.x:=center.x+GlobalData.SnapPixelSize;
          rb.y:=center.y+GlobalData.SnapPixelSize;
          GeoGraphic.DrawRectAngle(Canvas,lf,rb,pmNotXor,psSolid,1);
        end;
      OBJ_SNAP_MIDPOINT:
        begin
          GeoGraphic.DrawTriAngle(canvas,center,GlobalData.SnapPixelSize,pmNotXor,psSolid,1,clBlue);
        end;
      OBJ_SNAP_BYLINE:
        begin
          GeoGraphic.DrawDouTriAngle(canvas,center,GlobalData.SnapPixelSize,pmNotXor,psSolid,1,clBlue);
        end;
    end;
  end;
  {$ENDIF}

end;

procedure TGeoMagnifier.SetDrawMousePos(const Value: boolean);
begin
  FDrawMousePos := Value;
end;

procedure TGeoMagnifier.SetMap(const Value: TActionMap);
var
  i:integer;
begin
  FMap:=Value;
  Projection.ProjectionType:=FMap.Projection.ProjectionType;
  HasProjection:=True;
  Layers.closeAllLayers;
  for i:=0 to FMap.Layers.Count-1 do
  begin
    Layers.AddLayerWithProvider(FMap.layers.Layers[i].data);
    //WorldOutbox:=GeoGeo.MergeRect(WorldOutBox,Layers.Layers[i].WorldOutBox);
  end;
  DrawCood.SetScreen(Width,Height);
  DrawCood.SetWorld(Outbox);

  {$IFDEF HB_DEBUG}
  FMap.OnMouseMove:=MapMouseMove;
  {$ENDIF}
end;

procedure TGeoMagnifier.SetViewRange(const Value: Integer);
begin
  if Value<1 then FViewRange:=1
  else
    FViewRange := Value;
end;

procedure TGeoMagnifier.SetZoomRatio(const Value: double);
begin
  if Value<1 then FZoomRatio:=2
  else
    FZoomRatio := Value;
end;

procedure TGeoMagnifier.FilterMeta(PMeta: TPointerMeta; var Flag: boolean);
begin
  Flag:=False;
  //Flag:=((PMeta.PFix^.Gtype=Geo_Symbol) or (PMeta.PFix^.Gtype=Geo_Text));
end;

procedure TGeoMagnifier.RefreshLayerAdd;
var
  i:integer;
  oldWorldRect:TWorldRect;
  validData:boolean;
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

  for i:=0 to FMap.Layers.Count-1 do
  begin
    if not LayerInMap(FMap.Layers.Layers[i].data.ID) then
    begin
      Layers.AddLayerWithProvider(FMap.layers.Layers[i].data);
      //WorldOutbox:=GeoGeo.MergeRect(WorldOutBox,Layers.Layers[i].WorldOutBox);
      Layers.Layers[i].OnFilterMeta:=FilterMeta;
    end;
  end;

  if validData then
    DrawCood.SetWorld(oldWorldRect)
  else
    DrawCood.SetWorld(Outbox);
end;

procedure TGeoMagnifier.RefreshLayerRemove;
var
  i:integer;
  oldWorldRect:TWorldRect;
  validData:boolean;
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
  for i:=0 to Layers.Count-1 do
  begin
    if not LayerInMap(Layers.Layers[i].data.ID) then
    begin
      Layers.CloseLayer(i);
      Layers.AddLayerWithProvider(FMap.layers.Layers[i].data);
      //WorldOutbox:=GeoGeo.MergeRect(WorldOutBox,Layers.Layers[i].WorldOutBox);
      Layers.Layers[i].OnFilterMeta:=FilterMeta;
    end;
  end;

  if validData then
    DrawCood.SetWorld(oldWorldRect)
  else
    DrawCood.SetWorld(Outbox);
end;

procedure TGeoMagnifier.MapMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  RefreshMagnifier;
end;

end.
