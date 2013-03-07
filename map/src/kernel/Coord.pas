unit Coord;

interface
uses
  Windows, Classes, math, Types, metaDefine, geome, EventDefine, Mapproj;
type
  TWorldWillChange=procedure(Sender:TObject;WorldRect:TWorldRect;var Change:Boolean)of object;
  TWorldChanged=procedure(Sender:TObject;WorldRect:TWorldRect)of object;
  TDrawCood = class(TObject)
  private
    FRealScale: double;
    FScreenHeight: integer;
    FScreenWidth: integer;
    FWorldRect: TWorldRect;
    FZoomOutStep:Double;
    FZoomInStep:Double;
    FWorldWillChange:TWorldWillChange;
    FWorldChanged:TWorldChanged;
    FMaxWorldRect: TWorldRect;
    FOnScaleChanged: TScaleChanged;
    function GetScale: integer;
    function GetCenter: TWorldPoint;
    procedure WorldWillChange;
    procedure WorldChanged;
    function SuitWorldRect(AWorldRect:TWorldRect):Boolean;
    procedure SetMaxWorldRect(const Value: TWorldRect);
  protected
    procedure DoScaleChanged(const AnOldScale,ANewScale:Double);
  public
    constructor Create(Width, Height: integer);virtual;
    function  ConvertSP(WorldPoint: TWorldPoint): TPoint;virtual;
    procedure ConvertSPs(Start,Length: Integer;var WorldPoints: TWorldPointAry);virtual;
    procedure ConvertPolySPs(Start,Length: Integer;ArrayStart:integer;var count:integer;var WorldPoints: TWorldPointAry);virtual;
    function  ConvertWP(ScreenPoint: TPoint): TWorldPoint;virtual;
    procedure Offset(X, Y: integer);virtual;
    procedure SetScreen(Width, Height: integer);virtual;
    function SetWorld(NewWorld: TWorldRect): TWorldRect;virtual;
    procedure ZoomAT(const AWorldPoint: TWorldPoint; NewScale: Double);virtual;
    procedure ZoomInAT(const AWorldPoint: TWorldPoint);virtual;
    procedure ZoomOutAT(const AWorldPoint: TWorldPoint);virtual;
    procedure CenterAT(const AWorldPoint: TWorldPoint);virtual;
    procedure ZoomOutAsScreenRect(P1,P2:TPoint);virtual;
    procedure ZoomInAsScreenRect(P1,P2:TPoint);virtual;
    function  GetRealScale: Double;virtual;
    procedure SetRealScale(Value:Double);virtual;
    property Scale: integer read GetScale;
    property ScreenHeight: integer read FScreenHeight;
    property ScreenWidth: integer read FScreenWidth;
    property WorldRect: TWorldRect read FWorldRect;
    property ZoomOutStep:Double read FZoomOutStep Write FZoomOutStep;
    property ZoomInStep:Double read FZoomInStep Write FZoomInStep;
    property Center:TWorldPoint read GetCenter;
    property OnWorldWillChange:TWorldWillChange read FWorldWillChange Write FWorldWillChange;
    property OnWorldChanged:TWorldChanged read FWorldChanged Write FWorldChanged;
    property OnScaleChanged:TScaleChanged read FOnScaleChanged Write FOnScaleChanged;
    property MaxWorldRect:TWorldRect read FMaxWorldRect write SetMaxWorldRect;
  end;

implementation

{TDrawCood}

constructor TDrawCood.Create(Width, Height: integer);
begin
  FRealScale := 1;
  FScreenHeight := Height;
  FScreenWidth := Width;
  with FWorldRect do
  begin
    Left := 0;
    Bottom := 0;
    Right := Width;
    Top := Height;
  end;
end;

//把世界坐标转为屏幕坐标
function TDrawCood.ConvertSP(WorldPoint: TWorldPoint): TPoint;
var

  offsetX: Int64;
  offsetY: Int64;
begin
  offsetX := WorldPoint.x;
  offsetX :=offsetX  - FWorldRect.Left;
  offsetY := FWorldRect.Top;
  offsetY :=offsetY  - WorldPoint.y;

  Result.x := round(offsetX * FRealScale);
  Result.y := round(offsetY * FRealScale);
end;

//把屏幕位标转为世界位标
function TDrawCood.ConvertWP(ScreenPoint: TPoint): TWorldPoint;
var
  offsetX: integer;
  offsetY: integer;
begin
  offsetX := ScreenPoint.x;
  offsetY := ScreenPoint.y;
  Result.X := FWorldRect.Left + Round(offsetX / FRealScale);
  Result.Y := FWorldRect.Top - Round(offsetY / FRealScale);
end;

function TDrawCood.GetScale: integer;
begin
  Result := round(1 / FRealScale);
end;


procedure TDrawCood.Offset(X, Y: integer);
var TempWorldRect:TWorldRect;
begin
  try
    With TempWorldRect do
    begin
      Left := FWorldRect.Left - X;
      Right := FWorldRect.Right - X;
      Top := FWorldRect.Top - Y;
      Bottom := FWorldRect.Bottom - Y;
    end;
    SetWorld(TempWorldRect);
  except

  end;
end;


procedure TDrawCood.SetScreen(Width, Height: integer);
var  PrevCenter:TWorldPoint;
begin
  if (Width=FScreenWidth) and (FScreenHeight=Height) then
    Exit;
  PrevCenter:=GetCenter();
  FWorldRect.Left:=PrevCenter.x-round(Width / FRealScale/2);
  FWorldRect.Right := FWorldRect.Left + round(Width / FRealScale);
  FScreenWidth := Width;
  FWorldRect.Bottom:=PrevCenter.y-round(Height / FRealScale/2);
  FWorldRect.Top := FWorldRect.Bottom + round(Height / FRealScale);
  FScreenHeight := Height;
end;


function TDrawCood.SetWorld(NewWorld: TWorldRect): TWorldRect;
var
  sx, sy: double;  //临时变量,保存X,Y方向的比例
  CenterX,CenterY:Double;

begin
  if not SuitWorldRect(NewWorld) then
  begin
    Result:=FWorldRect ;
    Exit;
  end;
  if (NewWorld.Xmin=FWorldRect.Xmin) and
     (NewWorld.Ymin=FWorldRect.Ymin) and
     (NewWorld.Xmax=FWorldRect.Xmax) and
     (NewWorld.Ymax=FWorldRect.Ymax) then
     exit;
  // 计算坐标转换比例参数
  if NewWorld.Xmin =NewWorld.Xmax then
  begin
    NewWorld.Xmax:=NewWorld.Xmax+1;
    NewWorld.Xmin:=NewWorld.Xmin-1;
  end;
  if NewWorld.ymin =NewWorld.ymax then
  begin
    NewWorld.Ymax :=NewWorld.Ymax +1;
    NewWorld.Ymin :=NewWorld.Ymin -1;
  end;
  sx := (NewWorld.Right / FScreenWidth) - (NewWorld.Left / FScreenWidth);
  sy := (NewWorld.Top / FScreenHeight )- (NewWorld.Bottom / FScreenHeight);

  if (sx<>0) and (sy<>0) then
  begin

    if sx < sy then FRealScale := 1.0 / sy
    else
      FRealScale := 1.0 / sx;
    // 同时更新世界坐标范围
    if FRealScale>1 then FRealScale:=1;
    if ((FScreenWidth*FRealScale)<(maxint*0.8)) or ((FScreenHeight*FRealScale)<(maxint*0.8)) then
    begin
      CenterX:=NewWorld.Left+(NewWorld.Right/2-NewWorld.Left/2);
      CenterY:=NewWorld.Bottom+(NewWorld.Top/2-NewWorld.Bottom/2);
      WorldWillChange;
      FWorldRect.Left := Round(CenterX-(FScreenWidth / FRealScale)/2);
      FWorldRect.Bottom := round(CenterY-(FScreenHeight / FRealScale)/2);
      FWorldRect.Right := round(CenterX+(FScreenWidth / FRealScale)/2);
      FWorldRect.Top :=round(CenterY+(FScreenHeight / FRealScale)/2);
      Result := FWorldRect;
      WorldChanged;
    end;
  end;
end;


procedure TDrawCood.ZoomAT(const AWorldPoint: TWorldPoint; NewScale:Double);
var
  TempWorldRect:TWorldRect;
  OldScale:Double;
begin
  OldScale:=FRealScale;
  if NewScale* FScreenWidth<MaxInt then
  begin
    if NewScale < 1 then NewScale:=1;

    FRealScale := 1 / NewScale;
    TempWorldRect.Left := AWorldPoint.X - round(NewScale * FScreenWidth / 2);
    TempWorldRect.Right := TempWorldRect.Left + round(NewScale * FScreenWidth);
    TempWorldRect.Bottom := AWorldPoint.Y - round(NewScale * FScreenHeight / 2);
    TempWorldRect.Top := TempWorldRect.Bottom + round(NewScale * FScreenHeight);
    SetWorld(TempWorldRect);
    if Abs(OldScale-NewScale)<tozero then
      DoScaleChanged(OldScale,NewScale);
  end;
end;

procedure TDrawCood.ConvertSPs(Start,Length: Integer;var WorldPoints: TWorldPointAry);
var i:integer;
begin
  for i:=Start to (Start+Length-1) do
    WorldPoints[i]:= ConvertSP(WorldPoints[i]);
end;

procedure TDrawCood.ConvertPolySPs(Start, Length, ArrayStart:integer;
  var count: integer; var WorldPoints: TWorldPointAry);
var
  i,j:integer;
  polys:TIntegerDynArray;
  lastPoint:TWorldPoint;
  currentPoly:integer;
  points,curentPolyPointCount:integer;
begin
  Polys:=TIntegerDynArray(WorldPoints);
  if Length>=1 then
  begin
    lastPoint:=WorldPoints[Start];
    WorldPoints[Start]:=ConvertSP(lastPoint);
  end;
  currentPoly:=ArrayStart;
  j:=Start+1;
  points:=1;
  curentPolyPointCount:=1;
  for i:=Start+1 to (Start+Length-1) do
  begin
    Inc(points);
    if max(abs(WorldPoints[i].x-lastPoint.x),
      abs(WorldPoints[i].y-lastPoint.y))>(Scale div 2) then
    begin //不重合
      lastPoint:=WorldPoints[i];
      WorldPoints[j]:= ConvertSP(WorldPoints[i]);
      Inc(j);
      Inc(curentPolyPointCount);
    end;
    if (points>=polys[currentPoly]) then
    begin
      points:=0;
      if curentPolyPointCount<2 then
      begin
        dec(Count);
        continue;
      end;
      polys[currentPoly]:=curentPolyPointCount;
      curentPolyPointCount:=0;
      lastPoint:=Point(MaxInt,MaxInt);
      Inc(currentPoly);
    end;
  end;
end;

procedure TDrawCood.ZoomInAT(const AWorldPoint: TWorldPoint);
begin
  ZoomAT(AWorldPoint,(1/FRealScale)/ZoomInStep);
end;

procedure TDrawCood.ZoomOutAT(const AWorldPoint: TWorldPoint);
begin
  zoomAT(AWorldPoint,(1/FRealScale)*ZoomOutStep);
end;

procedure TDrawCood.CenterAT(const AWorldPoint: TWorldPoint);
begin
  offset(Center.x-AWorldPoint.x,Center.y-AWorldPoint.y);
end;

function TDrawCood.GetCenter: TWorldPoint;
begin
  Result.x:=FWorldRect.Xmin+(FWorldRect.Xmax div 2-FWorldRect.Xmin div 2) ;
  Result.y:=FWorldRect.ymin+(FWorldRect.ymax div 2-FWorldRect.ymin div 2);
end;

function TDrawCood.GetRealScale: Double;
begin
  Result:=1/FRealScale;
end;

procedure TDrawCood.ZoomInAsScreenRect(P1,P2:TPoint);
var
  ARect:TRect;
  AWorldRect:TWorldRect;
begin
  ARect:=GeometryCalc.ReturnOutboxFromLine(P1,P2);
  AWorldRect.TopLeft :=ConvertWP(ARect.TopLeft);
  AWorldRect.BottomRight :=ConvertWP(ARect.BottomRight);
  SetWorld(AWorldRect);
end;

procedure TDrawCood.ZoomOutAsScreenRect(P1, P2: TPoint);
var
  PrevCenter:TWorldPoint;
  ChangeScale:Double;
begin
  PrevCenter:=Point(round((P1.x+P2.x)/2),round((P1.y+P2.y)/2));
  PrevCenter:=ConvertWP(PrevCenter);
  ChangeScale:=Max(abs(P1.x-P2.x)/ScreenWidth,abs(P1.y-P2.y)/ScreenHeight);
  ZoomAt(PrevCenter,1/FRealScale/ChangeScale);
end;

procedure TDrawCood.WorldWillChange;
var
  change:Boolean;
begin
if Assigned(FWorldWillChange) then
    FWorldWillChange(Self,FWorldRect,change);
end;

procedure TDrawCood.WorldChanged;
begin
if Assigned(FWorldChanged) then
    FWorldChanged(Self,FWorldRect);
end;

procedure TDrawCood.SetRealScale(Value: Double);
begin
  FRealScale:=Value;
end;

function TDrawCood.SuitWorldRect(AWorldRect: TWorldRect): Boolean;
begin
  Result :=True or GeometryCalc.RectInRect(AWorldRect,FMaxWorldRect);
end;

procedure TDrawCood.SetMaxWorldRect(const Value: TWorldRect);
begin
  FMaxWorldRect := Value;
end;

procedure TDrawCood.DoScaleChanged(const AnOldScale, ANewScale: Double);
begin
  if Assigned(FOnScaleChanged) then
    FOnScaleChanged(Self,AnOldScale,ANewScale);
end;

end.
