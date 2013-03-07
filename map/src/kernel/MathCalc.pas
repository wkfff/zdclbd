unit MathCalc;

interface
uses
  math, metaDefine, Mapproj, Types, Windows, sysutils;
type
  TBearingData = record
    Bearing: Double;
    Distance: Double;
  end;

  GisMath=class
  public
    class function RadToDeg(const Radians: double): double;
    class function DegToRad(const Degrees: double): Double;
    class function fmod(x,y: double):double;
    class function Sign(Value:integer):integer;
    class function DiffSign(Value1,Value2:Double):Boolean;
    class procedure SwapValue(var Value1,Value2:Integer);
    class function IsSameEarthPoint(Point1,Point2:TEarthPoint):Boolean;
  end;

  GisMetaMath=class
  public
//    class procedure ReCalFlex(APFixMeta:PEarthMeta;APFlexMeta:PWorldMeta;APrjType:integer);overload;
//    class procedure ReCalFlex(APFixMeta:PEarthMeta;APFlexMeta:PWorldMeta;APrj:TProjection);overload;
//    class function MetaWorldRect(APFixMeta:PEarthMeta;APrj:TProjection):TWorldRect;overload;
//    class function MetaWorldRect(APFixMeta:PEarthMeta;APrjType:integer):TWorldRect;overload;
//    class function MetaEarthRect(APFixMeta:PEarthMeta):TEarthRect;
  end;

  GisMeasure=class
  public
    class function GetEarthDistance(P1,P2: TEarthPoint):Double;
    class function GetEarthGirth(Ps: TEarthPointAry;Start,Length:Integer):Extended;
    class function GetEarthArea(Ps: TEarthPointAry;Start,Length:integer):Extended;
    class function GetWorldArea(Ps: TEarthPointAry; Start, Length: integer): double;
    class function GetWorldDistance(P1,P2:TEarthPoint):Double;
    class function GetWorldGirth(Ps:TEarthPointAry;Start,Length:Integer):Extended;
  end;

implementation
uses
  geome;
 type
  TBearing = class
  private
    FDistance, //distance
    FInitialBearing, //bearing at point of departure
    FFinalBearing, //bearing at point of destination
    Lat1,
    Lat2,
    dLon,
    Beta1,
    Beta2,
    Lambda,
    CosSqrAlpha,
    Lambda0,
    SinSigma,
    Cos2Sigmam,
    CosSqr2Sigmam,
    CosSigma,
    Sigma,
    SinBeta1,
    SinBeta2,
    CosBeta1,
    CosBeta2,
    CosLambda0,
    SinLambda0,
    SinAlpha,
    SinLambda,
    CosLambda,
    uSqr,
    dSigma,A1,B1,C1: double;
    Iter: integer;
  public
    function Bearing(p1,p2:TEarthPoint): TBearingData;
    procedure Calculate(p1,p2:TEarthPoint);
    property InitialBearing:double read FInitialBearing;
    property FinalBearing:double read FFinalBearing;
    property Distance:double read FDistance;
  end;
procedure TBearing.Calculate(p1,p2:TEarthPoint);
const
  a: double         = 6378137.0;        //WGS84 semimajor axis
  b: double         = 6356752.3142;     //WGS84 semiminor axis
  e_Sqr: double     = 6.694379991013e-3;//square of WGS84 1st eccentricity
  ep_Sqr: double    = 6.73949674227e-3; //square of WGS84 2nd eccentricity
  f: double         = 3.35281066474e-3; //WGS84 flattening
  epsilon: double   = 1e-12;           //termination criterion
  MinNumber: double = 1e-50;           //smallest number > 0
  MaxIter:integer     = 100;
  DegToRad: double  = PI/180;
  RadToDeg: double  = 180 / PI;
begin
  try
  Lat1 := p1.Latitude * DegToRad; // convert latitudes to radians
  Lat2 := p2.Latitude * DegToRad;

  dLon := (p2.Longitude - p1.Longitude) * DegToRad; // calc. diff. of longitudes
  Beta1 := ArcTan((1-f)* Tan(Lat1)); // calculate 'reduced latitudes'
  Beta2 := ArcTan((1-f)* Tan(Lat2));
  Lambda := dLon;

  Iter:=0;
  CosBeta1 := Cos(Beta1)+1e-15;
  SinBeta1 := Sin(Beta1)+1e-15;
  CosBeta2 := Cos(Beta2);
  SinBeta2 := Sin(Beta2);

  repeat
    inc(Iter);

    Lambda0 := Lambda;
    CosLambda0 := Cos(Lambda0);
    SinLambda0 := Sin(Lambda0);

    SinSigma := Sqrt(Sqr(CosBeta2 * SinLambda0) + Sqr(CosBeta1 * SinBeta2 -
                SinBeta1 * CosBeta2 * CosLambda0) );
    CosSigma := SinBeta1 * SinBeta2 + CosBeta1 * CosBeta2 * CosLambda0;

    Sigma := ArcTan2(SinSigma , CosSigma);
    SinAlpha := (CosBeta1 * CosBeta2 * SinLambda0) / SinSigma;
    CosSqrAlpha := (1 + SinAlpha) * (1 - SinAlpha);

    if abs(CosSqrAlpha) < MinNumber then
      Cos2Sigmam := 0
    else
      Cos2Sigmam := CosSigma - ((2 * SinBeta1 * SinBeta2) / CosSqrAlpha);

    C1 := (f / 16) * CosSqrAlpha * (4 + f * (4 - 3 * CosSqrAlpha));
    CosSqr2Sigmam := Sqr(Cos2Sigmam);
    Lambda := dLon + (1-C1) * f * SinAlpha * (Sigma + C1 * SinSigma * (Cos2Sigmam
              +C1 * CosSigma * (-1 + 2 * CosSqr2Sigmam)));
  until not((Iter < MaxIter) and (abs(Lambda - Lambda0)>epsilon));

  uSqr := ep_Sqr * CosSqrAlpha;
  A1 :=1 + (uSqr / 16384) * (4096 + uSqr * (-768 + uSqr * (320 -175 * uSqr)));
  B1 := (uSqr / 1024) * (256 + uSqr * (-128 + uSqr * (74 - 47 * uSqr)));
  dSigma := B1 * SinSigma * (Cos2Sigmam + (B1 / 4) * ((-1 + 2 * CosSqr2Sigmam) * CosSigma -
            (B1 / 6) * (-3 + 4 * Sqr(SinSigma)) * (-3 + 4 * CosSqr2Sigmam) * Cos2Sigmam));

  FDistance := b * A1 * (Sigma - dSigma); // distance

  SinLambda := Sin(Lambda);
  CosLambda := Cos(Lambda);

  // initial bearing
  FInitialBearing := ArcTan2(CosBeta2 * SinLambda,
              (CosBeta1 * SinBeta2 - SinBeta1 * CosBeta2 * CosLambda));

  FInitialBearing := RadToDeg * GisMath.fmod (FInitialBearing + 2 * PI, 2 * PI);

  // final bearing
  FFinalBearing := ArcTan2(CosBeta1 * SinLambda,
              (CosBeta1 * SinBeta2 * CosLambda - SinBeta1 * CosBeta2));
  FFinalBearing := RadToDeg * GisMath.fmod(FFinalBearing + 2 * PI, 2 * PI);
  except
  end;
end;
function TBearing.Bearing(p1,p2:TEarthPoint): TBearingData;
begin
  Calculate(p1,p2);
  Result.Distance:=Distance;
  Result.Bearing:=FinalBearing;
end;

class function GisMath.DegToRad(const Degrees: double): double;
begin
  Result := (Degrees - (trunc(Degrees / 360) * 360)) / 180 * pi;
end;

class function GisMath.RadToDeg(const Radians: double): double;
begin
  Result := (Radians - (trunc(Radians / 2 / pi) * 2 * pi)) / pi * 180;
end;

class function GisMath.fmod(x,y: double):double;
begin
  Result:=x-(int(x / y) * y);
end;

class function GisMath.Sign(Value:integer): integer;
begin
  if Value>0 then Result:=1
  else if Value<0 then Result:=-1
  else Result:=0;
end;

class function GisMath.DiffSign(Value1, Value2: Double): Boolean;
begin
  Result:=((Value1>0) and (Value2<0)) or ((Value1<0) and (Value2>0)) ;
end;

class procedure GisMath.SwapValue(var Value1, Value2: Integer);
var SwapTemp:Integer;
begin
   SwapTemp:=Value1;
   Value1:=Value2;
   Value2:=SwapTemp;
end;

class function GisMath.IsSameEarthPoint(Point1, Point2: TEarthPoint): Boolean;
begin
  Result:= (abs(Point1.Longitude-Point2.Longitude)<tozero) and (abs(Point1.Latitude-Point2.Latitude)<tozero);
end;

{ GisMetaMath }

{class function GisMetaMath.MetaEarthRect(APFixMeta: PEarthMeta): TEarthRect;
var
  i,pointlength:Integer;
  subpoints:TIntegerDynArray;
  AEarthPoint: TEarthPoint;
begin
//初始化结果
  Result.Xmin :=MaxFloat;
  Result.Xmax :=-MaxFloat;
  Result.Ymax :=-MaxFloat;
  Result.Ymin :=MaxFloat;
  case APFixMeta._Type of
    _Symbol://符号
    begin
      Result.Xmin:=APFixMeta.Symbol.Point.Longitude;
      Result.Xmax:=APFixMeta.Symbol.Point.Longitude;
      Result.Ymin:=APFixMeta.Symbol.Point.Latitude;
      Result.Ymax:=APFixMeta.Symbol.Point.Latitude;
    end;
    _Line://线段
    begin
      Result.Xmin:=min(APFixMeta.Line.SP.Longitude,APFixMeta.Line.EP.Longitude);
      Result.Xmax:=max(APFixMeta.Line.SP.Longitude,APFixMeta.Line.EP.Longitude);
      Result.Ymin:=min(APFixMeta.Line.SP.Latitude,APFixMeta.Line.EP.Latitude);
      Result.Ymax:=max(APFixMeta.Line.SP.Latitude,APFixMeta.Line.EP.Latitude);
    end;
    _Text://文本
    begin
      Result.Xmin:=min(APFixMeta.Text.SP.Longitude,APFixMeta.Text.EP.Longitude);
      Result.Xmax:=max(APFixMeta.Text.SP.Longitude,APFixMeta.Text.EP.Longitude);
      Result.Ymin:=min(APFixMeta.Text.SP.Latitude,APFixMeta.Text.EP.Latitude);
      Result.Ymax:=max(APFixMeta.Text.SP.Latitude,APFixMeta.Text.EP.Latitude);

    end;
    _PolyLine://多义线
    begin
      SetLength(subpoints,apfixmeta.Polyline.Count);
      CopyMemory(@subpoints[0],pointer(apfixmeta.Polyline.SPtAddress),apfixmeta.Polyline.Count*SizeOf(Integer));
      PointLength:=sumint(SubPoints);
      for i:=0 to pointlength-1 do
      begin
        CopyMemory(@AEarthPoint,Pointer(apfixmeta.Polyline.PtAddress+i*SizeOf(AEarthPoint)),SizeOf(AEarthPoint)) ;
        Result:=GeometryCalc.MergeEarthRect(Result,AEarthPoint);
      end;
    end;
    _Rect://矩形
    begin
      Result:=APFixMeta.Outbox;
    end;
    _RoundRect://园角矩形
    begin
      Result:=APFixMeta.Outbox;
    end;
    _PolyRegion://多边形
    begin
      SetLength(subpoints,apfixmeta.PolyRegion.Count);
      CopyMemory(@subpoints[0],pointer(apfixmeta.PolyRegion.SPtAddress),apfixmeta.PolyRegion.Count*SizeOf(Integer));
      PointLength:=sumint(SubPoints);
      for i:=0 to pointlength-1 do
      begin
        CopyMemory(@AEarthPoint,Pointer(apfixmeta.PolyRegion.PtAddress+i*SizeOf(AEarthPoint)),SizeOf(AEarthPoint)) ;
        Result:=GeometryCalc.MergeEarthRect(Result,AEarthPoint);
      end;
    end;
  end;
end;
          }      {
class function GisMetaMath.MetaWorldRect(APFixMeta: PEarthMeta;
  APrjType: integer): TWorldRect;
var
  Aprj:TProjection;
begin
  Aprj:=TProjection.Create;
  try
    Aprj.ProjectionType :=APrjType;
    Result:=MetaWorldRect(APFixMeta,Aprj);
  finally
    Aprj.Free;
  end;
end;
                   }{
class function GisMetaMath.MetaWorldRect(APFixMeta: PEarthMeta;
  APrj: TProjection): TWorldRect;
var
  i,pointlength:Integer;
  subpoints:TIntegerDynArray;
  AEarthPoint:TEarthPoint;
begin
//初始化结果
  Result.Xmin :=MaxInt;
  Result.Xmax :=-MaxInt;
  Result.Ymax :=-MaxInt;
  Result.Ymin :=MaxInt;
  case APFixMeta._Type of
    _Symbol://符号
    begin
      Result:=GeometryCalc.MergeRect(APrj.LoLa2XY(APFixMeta.Symbol.Point),Result);
      GeometryCalc.FormatWorldRect(Result);
    end;
    _Line://线段
    begin
      Result:=GeometryCalc.MergeRect(APrj.LoLa2XY(APFixMeta.Line.SP),APrj.LoLa2XY(APFixMeta.Line.EP));
    end;
    _Text://文本
    begin
      //??Result:=GeometryCalc.MergeRect(APrj.LoLa2XY(APFixMeta.Text.StartPoint),APrj.LoLa2XY(APFixMeta.Text.EndPoint));
      Result:=GeometryCalc.GetTextWorldOutBox(
        APrj.LoLa2XY(APFixMeta.Text.SP),
        APrj.LoLa2XY(APFixMeta.Text.EP),
        APFixMeta.Text.Angle);
    end;
    _PolyLine://多义线
    begin
      SetLength(subpoints,apfixmeta.Polyline.Count);
      CopyMemory(@subpoints[0],pointer(apfixmeta.Polyline.SPtAddress),apfixmeta.Polyline.Count*SizeOf(Integer));
      PointLength:=sumint(SubPoints);
      for i:=0 to pointlength-1 do
      begin
        CopyMemory(@AEarthPoint,Pointer(apfixmeta.Polyline.PtAddress+i*SizeOf(AEarthPoint)),SizeOf(AEarthPoint)) ;
        Result:=GeometryCalc.MergeRect(APrj.LoLa2XY(AEarthPoint),Result);
      end;
    end;
    _Rect://矩形
    begin
      Result:=APrj.LoLa2XY(APFixMeta.Outbox);
    end;
    _RoundRect://园角矩形
    begin
      Result:=APrj.LoLa2XY(APFixMeta.Outbox);
    end;
    _PolyRegion://多边形
    begin
      SetLength(subpoints,apfixmeta.PolyRegion.Count);
      CopyMemory(@subpoints[0],pointer(APFixMeta.PolyRegion.SPtAddress),apfixmeta.PolyRegion.Count*SizeOf(Integer));
      PointLength:=sumint(SubPoints);
      for i:=0 to pointlength-1 do
      begin
        CopyMemory(@AEarthPoint,Pointer(APFixMeta.PolyRegion.PtAddress+i*SizeOf(AEarthPoint)),SizeOf(AEarthPoint)) ;
        Result:=GeometryCalc.MergeRect(APrj.LoLa2XY(AEarthPoint),Result);
      end;
    end;
  end;
  //处理0外包矩形
  with Result do
  begin
    if Xmin=Xmax then
    begin
      Inc(Xmax);
      Dec(Xmin);
    end;
    if Ymin=Ymax then
    begin
      Inc(Ymax);
      Dec(Ymin);
    end;
  end;
end;
            }{
class procedure GisMetaMath.ReCalFlex(APFixMeta: PEarthMeta; APFlexMeta: PWorldMeta; APrj: TProjection);
var i,j,k,pointlength:Integer;
  subpoints:TIntegerDynArray;
  AEarthPoint:TEarthPoint;
  AWorldPoint:TWorldPoint;
  AWorldRect:TWorldRect;
begin
  APFlexMeta._Type:=APFixMeta._Type;
  APFlexMeta.Anchor:=APrj.LoLa2XY(APFixMeta.Anchor);
  case APFixMeta._Type of
    _Symbol://符号
    begin
      APFlexmeta.Symbol.Position:=APrj.LoLa2XY(APFixMeta.Symbol.Point);
    end;
    _Line://线段
    begin
      APFlexmeta.Line.SP:=APrj.LoLa2XY(APFixMeta.Line.SP);
      APFlexmeta.Line.EP:=APrj.LoLa2XY(APFixMeta.Line.EP);
    end;
    _Text://文本
    begin
      APFlexMeta.Text.SP:=APrj.LoLa2XY(APFixMeta.Text.SP);
      APFlexmeta.Text.EP:=APrj.LoLa2XY(APFixMeta.Text.EP);
    end;
    _PolyLine://多义线
    begin
      //subpos拷贝
      CopyMemory(Pointer(APFlexMeta.Polyline.SPWAddress),Pointer(APFixMeta.Polyline.SPtAddress),APFixMeta.Polyline.Count*SizeOf(integer));
      //计算点的总数
      SetLength(subpoints,APFixMeta.Polyline.Count);
      CopyMemory(@subpoints[0],pointer(apfixmeta.Polyline.SPtAddress),apfixmeta.Polyline.Count*SizeOf(Integer));
      PointLength:=sumint(SubPoints);
      //投影转换
      for i:=0 to pointlength-1 do
      begin
        CopyMemory(@AEarthPoint,Pointer(apfixmeta.PolyLine.PtAddress+i*SizeOf(AEarthPoint)),SizeOf(AEarthPoint)) ;
        AWorldPoint:=APrj.LoLa2XY(AEarthPoint);
        CopyMemory(Pointer(APFlexmeta.Polyline.PWAddress+i*SizeOf(AWorldPoint)),@AWorldPoint,SizeOf(AWorldPoint));
      end;
    end;
    _Rect://矩形
    begin

    end;
    _RoundRect://园角矩形
    begin
    end;
    _PolyRegion://多边形
    begin
      //subpos拷贝
      CopyMemory(Pointer(APFlexMeta.PolyRegion.SPWAddress),Pointer(APFixMeta.PolyRegion.SPtAddress),APFixMeta.PolyRegion.Count*SizeOf(integer));
      //subPositives拷贝
      //@@CopyMemory(Pointer(APFlexMeta.PolyRegion.SWPositives),Pointer(APFixMeta.PolyRegion.SPositives), APFixMeta.PolyRegion.Count*SizeOf(integer));
      //计算点的总数
      SetLength(subpoints,APFixMeta.PolyRegion.Count);
      CopyMemory(@subpoints[0],pointer(apfixmeta.PolyRegion.SPtAddress),apfixmeta.PolyRegion.Count*SizeOf(Integer));

//      PointLength:=sumint(SubPoints);
      //投影转换
      k:=0;
      for i:=0 to APFixMeta.PolyRegion.Count-1 do
      begin
        AWorldRect :=GeometryCalc.InitWorldRect();
        for j:=0 to subpoints[i]-1 do
        begin
          CopyMemory(@AEarthPoint,Pointer(apfixmeta.PolyRegion.PtAddress+K*SizeOf(AEarthPoint)),SizeOf(AEarthPoint)) ;
          AWorldPoint:=APrj.LoLa2XY(AEarthPoint);
          AWorldRect:=GeometryCalc.MergeRect(AWorldPoint,AWorldRect);
          CopyMemory(Pointer(APFlexmeta.PolyRegion.PWAddress+K*SizeOf(AWorldPoint)),@AWorldPoint,SizeOf(AWorldPoint));
          k:=k+1;
        end;
        //填充SubWorldOutboxsFlex
        //@@CopyMemory(Pointer(APFlexmeta.PolyRegion.SWOutboxAddress+i*SizeOf(AWorldRect)),@AWorldRect,SizeOf(AWorldrect));
      end;
    end;
  end;
  APFlexMeta.Outbox :=MetaWorldRect(APFixMeta,APrj);
end;
             }{
class procedure GisMetaMath.ReCalFlex(APFixMeta: PEarthMeta; APFlexMeta: PWorldMeta; APrjType: integer);
var
  Aprj:TProjection;
begin
  Aprj:=TProjection.Create;
  try
    Aprj.ProjectionType :=APrjType;
    ReCalFlex(APFixMeta,APFlexMeta,Aprj);
  finally
    Aprj.Free;
  end;
end;
                 }
{ GisMeasure }

class function GisMeasure.GetEarthArea(Ps: TEarthPointAry; Start,
  Length: integer): Extended;
var
  i:Integer;
  TempGeos:TEarthPointAry;
  bearing:TBearing;
  sum:Extended;
begin

{$IFDEF DEBUG_EMap}
  if ((Ps[Start].Longitude-Ps[Start+Length-1].Longitude)>metaDefine.ToZero)
    and ((Ps[Start].Latitude-Ps[Start+Length-1].Latitude)>metaDefine.tozero) then
    raise EMathError.Create('多边形不重合');
{$ENDIF}
  Result:=0;
  bearing:=TBearing.Create;
  try
    SetLength(TempGeos,Length);
    TempGeos[0].Longitude:=0;
    TempGeos[0].Latitude:=0;
    TempGeos[Length-1]:=TempGeos[0];
    for i:=1 to Length-2 do
    begin
      bearing.Calculate(Ps[i-1],Ps[i]);
      TempGeos[i].Longitude:=TempGeos[i-1].Longitude+
        bearing.Distance*cos((90-bearing.InitialBearing)/180*pi);
      TempGeos[i].Latitude:=TempGeos[i-1].Latitude+
        bearing.Distance*sin((90-bearing.InitialBearing)/180*pi);
    end;
    sum:=0;
    for i:=0 to Length-2 do
    begin
      sum:=sum+TempGeos[i].Longitude * TempGeos[i+1].Latitude -
      TempGeos[i+1].Longitude * TempGeos[i].Latitude
    end;
    Result:=abs(0.5*sum);
  finally
    bearing.Free;
  end;
end;

class function GisMeasure.GetEarthDistance(P1,
  P2: TEarthPoint): Double;
var
  Bearing:TBearing;
begin
//  Result:=0;
  Bearing:=TBearing.Create;
  try
    Bearing.Calculate(P1, P2);
    Result:=Bearing.Distance ;
  finally
    Bearing.Free;
  end;
end;

class function GisMeasure.GetEarthGirth(Ps: TEarthPointAry; Start,
  Length: Integer): Extended;
var
  i:Integer;
begin
  Result:=0;
  for i:=Start to Start+Length-2 do
  begin
    Result:=Result+GetEarthDistance(Ps[i],Ps[i+1]);
  end;
end;

class function GisMeasure.GetWorldArea(Ps: TEarthPointAry; Start,
  Length: integer): double;
var
  i: integer;
  sum:Double;
begin
  sum:=0;
  for i:=0 to Length-2 do
  begin
    sum:=sum+Ps[i+start].X   * Ps[i+start+1].Y -
      Ps[i+start+1].X * Ps[i+start].Y
  end;
  Result:=abs(0.5*sum);
end;

class function GisMeasure.GetWorldDistance(P1,
  P2: TEarthPoint): Double;
begin
  Result:=GeometryCalc.Gis_P2P_Dist(P1.x,P1.y,P2.x,P2.y);
end;

class function GisMeasure.GetWorldGirth(Ps: TEarthPointAry; Start,
  Length: Integer): Extended;
var
  i:Integer;
begin
  Result:=0;
  for i:=Start to Start+Length-2 do
  begin
    Result:=Result+GetWorldDistance(Ps[i],Ps[i+1]);
  end;
end;

end.
