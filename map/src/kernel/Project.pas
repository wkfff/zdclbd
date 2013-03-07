unit Project;

{ this unit contain the main projector object used for
  converting from lat/long to cartesian coordinates

  We translated the code from  C libraries originated from

  http://www.remotesensing.org/proj/

  And converted to Delphi pascal by Alfonso Moreno Palma
   from Ingenieria Construmap (Activemap GIS components)

  This library is Free with source code for object transformation classes,
  but without any supporting program stucture. We recommend that you download
  all the information (manuals and help files) from the URL specified above.
  }
  
{$I proj_flag.inc}
interface

uses
  SysUtils,
  Classes,
  Windows,
  projectors,
  metadefine;

type
  {-----------------------------------------------------------------------------}
  {    TProjector                                                             }
  {-----------------------------------------------------------------------------}

  TProjector = class
  private
    FGC: TGeoConvert;                   (* the low-level conversion object *)
    FParams: TStrings;
    FIsNonEarth: Boolean;
    FInitWorldRect: TWorldRect;
    FMaxWorldRect: TWorldRect;                  (* the parameters for conversion *)
    procedure SetParams(Value: TStrings);
    procedure SetIsNonEarth(const Value: Boolean);
    procedure SetInitWorldRect(const Value: TWorldRect);
    procedure SetMaxWorldRect(const Value: TWorldRect);
    procedure CalInitWorldRect ;
    procedure CalMaxWorldRect ;

  public
    constructor Create(); virtual;
    destructor Destroy; override;
    procedure CoordSysInit;
    procedure InitToDefault;
    function CheckDefaultParams: Boolean;
    procedure LoadFromStream(Stream: TStream);
    procedure SaveToStream(Stream: TStream);
    procedure LoadFromFile(const FileName: string);
    procedure SaveToFile(const FileName: string);
    procedure CoordSysFromLatLong(const long, lat: double; var X, Y: Double);
    procedure CoordSysToLatLong(const X, Y: Double; var long, lat: Double);
    function HasProjection: Boolean;
    property GC: TGeoConvert read FGC;
    property MaxWorldRect:TWorldRect read FMaxWorldRect write SetMaxWorldRect;
    property InitWorldRect:TWorldRect read FInitWorldRect write SetInitWorldRect;
    property IsNonEarth:Boolean read FIsNonEarth write SetIsNonEarth;
  published
    property Params: TStrings read FParams write SetParams;
  end;


implementation
uses
  math;


{ Implements TProjector object }

constructor TProjector.Create();
begin
  FGC:= TGeoConvert.Create;
  FParams:= TStringList.Create;
  CheckDefaultParams;
  fisnonearth :=False;
end;

destructor TProjector.Destroy;
begin
  FGC.Free;
  FParams.Free;
  inherited Destroy;
end;

procedure TProjector.LoadFromStream(Stream: TStream);
begin
  FParams.Clear;
  FParams.LoadFromStream(Stream);
  CheckDefaultParams;
  FGC.Geo_CoordSysInit(TStringList(FParams));
end;

procedure TProjector.SaveToStream(Stream: TStream);
begin
  CheckDefaultParams;
  FParams.SaveToStream(Stream);
end;

procedure TProjector.LoadFromFile(const FileName: string);
var
  Stream: TStream;
begin
  if not FileExists(FileName) then Exit;
  Stream:= TFileStream.Create(FileName, fmOpenRead or fmShareDenyNone);
  try
    Self.LoadFromStream(Stream);
  finally
    Stream.free;
  end;
end;

procedure TProjector.SaveToFile(const FileName: string);
var
  Stream: TStream;
begin
  if not FileExists(FileName) then Exit;
  Stream:= TFileStream.Create(FileName, fmCreate);
  try
    Self.SaveToStream(Stream);
  finally
    Stream.free;
  end;
end;

procedure TProjector.InitToDefault;
begin
  FParams.Clear;
  CheckDefaultParams;
  CoordSysInit;
end;

procedure TProjector.CoordSysInit;
begin
  if Pos('Non_Earth',FParams.Text)<>0 then
  begin
    IsNonEarth:=True;

  end
  else
  begin
    FGC.Geo_CoordSysInit(TStringList(FParams));
  end;
  CalInitWorldRect;
  CalMaxWorldRect;
end;

function TProjector.HasProjection: Boolean;
begin
  result:= FGC.HasProjection;
end;

function TProjector.CheckDefaultParams: Boolean;
begin
  { sorry, default params is "my" default params :-) }
  Result:= True;
  if FParams.IndexOfName('units') < 0 then
  begin
    FParams.Insert(0, 'units=m');
    Result:= False;
  end;
  if FParams.IndexOfName('ellps') < 0 then
  begin
    FParams.Insert(0, 'ellps=WGS84');
    Result:= False;
  end;
  if FParams.IndexOfName('proj') < 0 then
  begin
    FParams.Insert(0, 'proj=utm');
    Result:= False;
    if FParams.IndexOfName('zone') < 0 then
      FParams.Add('zone=12');   // our zone :-)
    if FParams.IndexOfName('south') < 0 then
      FParams.Add('south=F');
  end;
end;

procedure TProjector.CoordSysFromLatLong(const long, lat: double; var X, Y: Double);
var
  ChangeScale:Double;
begin
  if IsNonEarth then  //非地球坐标系
  begin
    //获得单位名称
    ChangeScale:=pj_units[UnitCodeFromID(Params.Values['units'])].to_meter;
    X:=long/ChangeScale;
    Y:=lat/ChangeScale;
  end
  else
    FGC.Geo_CoordSysFromLatLong(long, lat, X, Y);
end;

procedure TProjector.CoordSysToLatLong(const X, Y: Double; var long, lat: Double);
var
  ChangeScale:Double;
begin
  if IsNonEarth then
  begin
    //获得单位名称
    ChangeScale:=pj_units[UnitCodeFromID(Params.Values['units'])].to_meter;
    long:=X*ChangeScale;
    lat:=Y*ChangeScale;
  end
  else
    FGC.Geo_CoordSysToLatLong(X, Y, long, lat);
end;

procedure TProjector.SetParams(Value: TStrings);
begin
  FParams.Assign(Value);
end;

procedure TProjector.SetIsNonEarth(const Value: Boolean);
begin
  FIsNonEarth := Value;
end;

procedure TProjector.SetInitWorldRect(const Value: TWorldRect);
begin
  FInitWorldRect := Value;
end;

procedure TProjector.SetMaxWorldRect(const Value: TWorldRect);
begin
  FMaxWorldRect := Value;
end;

procedure TProjector.CalInitWorldRect;
var
  TempGeoRect:TEarthRect;
  TempWorldRect:TWorldRect;
  TempX1,TempY1:Double;
  TempX2,TempY2:Double;
begin
  TempGeoRect.Xmin:=StrToFloat(Params.Values['LoIniMin']);
  TempGeoRect.Xmax:=StrToFloat(Params.Values['LoIniMax']);
  TempGeoRect.Ymin:=StrToFloat(Params.Values['LaIniMin']);
  TempGeoRect.Ymax:=StrToFloat(Params.Values['LaIniMax']);
  CoordSysFromLatLong(TempGeoRect.Xmin,TempGeoRect.Ymin,TempX1,TempY1);
  CoordSysFromLatLong(TempGeoRect.Xmax,TempGeoRect.Ymax,TempX2,TempY2);

  TempWorldRect.Xmin:=round(min(TempX1,TempX2));
  TempWorldRect.Xmax:=round(max(TempX1,TempX2));
  TempWorldRect.Ymin:=round(min(TempY1,TempY2));
  TempWorldRect.Ymax:=round(max(TempY1,TempY2));
  FInitWorldRect:=TempWorldRect;
end;

procedure TProjector.CalMaxWorldRect;
var
  TempEarthRect: TEarthRect;
  TempWorldRect: TWorldRect;
  TempX1,TempY1: Double;
  TempX2,TempY2: Double;
  MinX,MaxX,MinY,MaxY: Double;
  i: Integer;
begin
  i:=0;
  TempEarthRect.Xmin:=StrToFloat(Params.Values['LoMin']);
  TempEarthRect.Xmax:=StrToFloat(Params.Values['LoMax']);
  TempEarthRect.Ymin:=StrToFloat(Params.Values['LaMin']);
  TempEarthRect.Ymax:=StrToFloat(Params.Values['LaMax']);
  if IsNonEarth then
  begin
    CoordSysFromLatLong(i,TempEarthRect.Ymin,TempX1,TempY1);
    CoordSysFromLatLong(i,TempEarthRect.Ymax,TempX2,TempY2);
    TempWorldRect.Xmin:=round(Min(TempX1,TempX2));
    TempWorldRect.Xmax:=round(Max(TempX1,TempX2));
    TempWorldRect.Ymin:=round(Min(TempY1,TempY2));
    TempWorldRect.Ymax:=round(Max(TempY1,TempY2));
    Exit;

  end;
  { TODO -o邵今 : 根据度数统计外包矩形 }
  MinX:=+MaxDouble;
  MaxX:=-MaxDouble;
  MinY:=+MaxDouble;
  MaxY:=-MaxDouble;
  //Top and Bottom X
  for i:=floor(TempEarthRect.Xmin) to Floor(TempEarthRect.Xmax) do
  begin
    CoordSysFromLatLong(i,TempEarthRect.Ymin,TempX1,TempY1);
    CoordSysFromLatLong(i,TempEarthRect.Ymax,TempX2,TempY2);
    MinX:=MinValue([MinX,TempX1,TempX2]);
    MaxX:=MaxValue([MaxX,TempX1,TempX2]);
    MinY:=MinValue([MinY,TempY1,TempY2]);
    MaxY:=MaxValue([MaxY,TempY1,TempY2]);
  end;
  //Left and Right Y
  for i:=floor(TempEarthRect.Ymin) to Floor(TempEarthRect.Ymax) do
  begin
    CoordSysFromLatLong(TempEarthRect.Xmin,i,TempX1,TempY1);
    CoordSysFromLatLong(TempEarthRect.Xmax,i,TempX2,TempY2);
    MinX:=MinValue([MinX,TempX1,TempX2]);
    MaxX:=MaxValue([MaxX,TempX1,TempX2]);
    MinY:=MinValue([MinY,TempY1,TempY2]);
    MaxY:=MaxValue([MaxY,TempY1,TempY2]);
  end;

  TempWorldRect.Xmin:=round(MinX);
  TempWorldRect.Xmax:=round(MaxX);
  TempWorldRect.Ymin:=round(MinY);
  TempWorldRect.Ymax:=round(MaxY);
  FMaxWorldRect:=TempWorldRect;
end;

end.
