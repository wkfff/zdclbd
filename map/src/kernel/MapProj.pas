unit MapProj;
interface
uses
  windows,
  classes,
  math,
  sysutils,
  metadefine,
  Project,
  contnrs;
const
  {投影最大值忽略}
  Prj_MaxDec=0.1;
  DefaultProjection=1;
type
  EProjectionFailed = class(Exception)

  end;

  {** 投影类 完成经纬度坐标和世界坐标之间的互相转换
  返回的世界坐标单位为0.1米}
  TProjection = class(TObject)
  private

    {投影坐标系参数}
    //FDatumType: integer;
    {中央子午线}
    //FMeridian: double;
    {投影坐标系参数}
    FProjectionType: integer;
    //FInputUnit: Integer;
    Fprojector:TProjector;
    FOnProjectionChanged: TNotifyEvent;
    FName: string;
    procedure SetProjectionType(const Value: integer);
    function FormatEarthPoint(P:TEarthPoint):TEarthPoint;
    function GetMaxWorldRect: TWorldRect;
    procedure SetOnProjectionChanged(const Value: TNotifyEvent);
    procedure ProjectionChanged;
    function GetPrjAreaName: string;
    function GetPrjUnitsName: string;
    function GetWorldAreaName: string;
    function GetWorldUnitsName: string;
    procedure SetName(const Value: string);
    function GetIsNonEarth: Boolean;
    function ReadInitWorldRect: TWorldRect;
  public
    constructor Create;
    destructor destroy;override;
    function LoLa2XY(const Rect: TEarthRect): TWorldRect;overload;
    function LoLa2XY(const P: TEarthPoint): TWorldPoint;overload;
    function XY2LoLa(const P: TWorldPoint): TEarthPoint;
    class function PrjIsNonEarth(APrjType:Integer):Boolean;
    property ProjectionType: Integer read FProjectionType Write SetProjectionType;
    property MaxWorldRect:TWorldRect read GetMaxWorldRect;
    property OnProjectionChanged:TNotifyEvent  read FOnProjectionChanged write SetOnProjectionChanged;
    {单位名称,非地球坐标为米,地球坐标为度}
    property PrjUnitsName:string read GetPrjUnitsName;
    {单位名称,平方米}
    property PrjAreaName:string read GetPrjAreaName;
    property WorldUnitsName:string read GetWorldUnitsName;
    property WorldAreaName:string read GetWorldAreaName;
    property Name:string read FName write SetName;
    property IsNonEarth:Boolean read GetIsNonEarth;
    property InitWorldRect:TWorldRect read ReadInitWorldRect;
  end;

implementation

uses
  projectors,
  staticproc;

var
  FProjKernel: TProjector = nil;

function GetProjKernel: TProjector;
begin
  if FProjKernel = nil then
  begin
    FProjKernel := TProjector.Create;
    FProjKernel.Params.Clear;
    FProjKernel.Params.Add('ycode=<merc>');
    FProjKernel.Params.Add('ydes=''Standard Merctor krassovsky''');
    FProjKernel.Params.Add('proj=merc');
    FProjKernel.Params.Add('ellps=krass');
    FProjKernel.Params.Add('units=dm');
    FProjKernel.Params.Add('LoMin=-179.0');
    FProjKernel.Params.Add('LoMax=179.0');
    FProjKernel.Params.Add('LaMin=-89.0');
    FProjKernel.Params.Add('LaMax=89.0');
    FProjKernel.Params.Add('LoIniMin=0');
    FProjKernel.Params.Add('LoIniMax=1');
    FProjKernel.Params.Add('LaIniMin=0');
    FProjKernel.Params.Add('LaIniMax=1');
    FProjKernel.CoordSysInit;
  end;
  Result := FProjKernel;
end;

constructor TProjection.Create;
begin
  ProjectionType := 1;
end;

function TProjection.LoLa2XY(const P: TEarthPoint): TWorldPoint;
var
  TempX, TempY: Double;
  TempPoint: TEarthPoint;
begin
  if not Fprojector.IsNonEarth then
    TempPoint := FormatEarthPoint(P)
  else
    TempPoint := P;
  Fprojector.CoordSysFromLatLong(TempPoint.Longitude,TempPoint.Latitude,TempX,TempY);
  Result.x:=round(TempX);
  Result.y:=round(TempY);
end;

function TProjection.LoLa2XY(const Rect: TEarthRect): TWorldRect;
var
  p1,p2: TWorldPoint;
begin
  p1 := LoLa2XY(Rect.TopLeft);
  p2 := LoLa2XY(Rect.BottomRight);
  Result.Xmin := Min(p1.X,p2.X);
  Result.Ymin := Min(p1.Y,p2.Y);
  Result.Xmax := Max(p1.X,p2.X);
  Result.Ymax := Max(p1.Y,p2.Y);
(*
  Result.Xmin :=Min(Lola2xy(Rect.TopLeft).x,Lola2xy(Rect.BottomRight).x);
  Result.ymin :=Min(Lola2xy(Rect.TopLeft).y,Lola2xy(Rect.BottomRight).y);
  Result.Xmax :=Max(Lola2xy(Rect.TopLeft).x,Lola2xy(Rect.BottomRight).x);
  Result.ymax :=Max(Lola2xy(Rect.TopLeft).y,Lola2xy(Rect.BottomRight).y);
*)
end;

function TProjection.XY2LoLa(const P: TWorldPoint): TEarthPoint;
var
  TP: TEarthPoint;
begin
  Fprojector.CoordSysToLatLong(P.x,P.y,TP.Longitude,TP.Latitude);
  if Fprojector.IsNonEarth then
    Result:=TP
  else
    Result:=FormatEarthPoint(TP);
end;

procedure TProjection.SetProjectionType(const Value: integer);
begin
  if Value <> 1 then raise Exception.Create('不支持的投影类型');
  if Value = FProjectionType then Exit;
  FProjectionType := Value;
  Fprojector := GetProjKernel;
  Name := '标准麦卡托投影';
  ProjectionChanged;
end;

destructor TProjection.destroy;
begin
  inherited;
end;

function TProjection.FormatEarthPoint(P: TEarthPoint):TEarthPoint;
begin
  Result := P;
  if (P.Longitude>=180) then Result.Longitude := 180-Prj_MaxDec;
  if (P.Longitude<=-180) then Result.Longitude := -180+Prj_MaxDec;
  if (P.Latitude>=90) then Result.Latitude := 90-Prj_MaxDec;
  if (P.Latitude<=-90) then Result.Latitude := -90+Prj_MaxDec;
end;

function TProjection.GetMaxWorldRect: TWorldRect;
begin
  Result:=Fprojector.MaxWorldRect;
end;

procedure TProjection.SetOnProjectionChanged(const Value: TNotifyEvent);
begin
  FOnProjectionChanged := Value;
end;

procedure TProjection.ProjectionChanged;
begin
  if Assigned(FOnProjectionChanged) then
    FOnProjectionChanged(Self);
end;

function TProjection.GetPrjAreaName: string;
begin
  Result:='平方米'
end;

function TProjection.GetPrjUnitsName: string;
begin
  if Fprojector.IsNonEarth then
    Result:='米'
  else
    Result:='度'
end;

function TProjection.GetWorldAreaName: string;
begin
  Result:='平方'+WorldAreaName;

end;

function TProjection.GetWorldUnitsName: string;
begin
  Result:=pj_units[UnitCodeFromID(Fprojector.Params.Values['units'])].name;

end;

procedure TProjection.SetName(const Value: string);
begin
  FName := Value;
end;

class function TProjection.PrjIsNonEarth(APrjType:Integer):Boolean;
var
  AProjection:TProjection;
begin
  AProjection:=TProjection.Create ;
  try
    AProjection.ProjectionType :=APrjType;
    Result:=AProjection.IsNonEarth ;
  finally
    AProjection.Free;
  end;
end;

function TProjection.GetIsNonEarth: Boolean;
begin
  if FProjectionType =-1 then
    raise EProjectionFailed.Create('未知错误')
  else
    Result:=fprojector.isnonearth;
end;

function TProjection.ReadInitWorldRect: TWorldRect;
begin
  if FProjectionType =-1 then
    raise EProjectionFailed.Create('未知错误')
  else
    Result:=Fprojector.InitWorldRect;
end;

initialization

finalization
begin
  if FProjKernel <> nil then FreeAndNil(FProjKernel);
end;

end.
