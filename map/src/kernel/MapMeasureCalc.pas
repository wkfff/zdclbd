unit MapMeasureCalc;

interface
  uses
    math,
    MathCalc,
    metaDefine;
  type
  //方位角，距离
    TBearingData = record
      Bearing,
      Distance: double;
    end;
    GisMeasure=class
      class function GetGisDistance(P1,P2: TEarthPoint):Double;
      class function GetGisGirth(EarthPoints: TEarthPointAry;Start,Length:Integer):Extended;
      class function GetGisArea(EarthPoints: TEarthPointAry;Start,Length:integer):Extended;
      class function GetWorldArea(EarthPoints: TEarthPointAry; Start, Length: integer): double;
      class function GetWorldDistance(P1,P2: TEarthPoint):Double;
      class function GetWorldGirth(EarthPoints: TEarthPointAry;Start,Length:Integer):Extended;

    end;
implementation
uses
  sysutils,geome;
  {** 距离方位角测量类,使用WGS84参数}
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

  FDistance := b * A1 * (Sigma - dSigma); // distance 距离

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

class function GisMeasure.GetGisDistance(P1, P2: TEarthPoint): Double;
var
  Bearing:TBearing;
begin
  Bearing:=TBearing.Create;
  try
    Bearing.Calculate(P1, P2);
    Result:=Bearing.Distance ;
  finally
    Bearing.Free;
  end;
end;

class function GisMeasure.GetGisGirth(EarthPoints:TEarthPointAry;Start,Length:integer):Extended;
var i:Integer;
begin
  Result:=0;
  for i:=Start to Start+Length-2 do
  begin
    Result:=Result+GetGisDistance(EarthPoints[i],EarthPoints[i+1]);
  end;
end;

class function GisMeasure.GetGisArea(EarthPoints:TEarthPointAry;Start,Length:integer):Extended;
var
  i: Integer;
  TempEarths: TEarthPointAry;
  bearing: TBearing;
  sum: Extended;
begin

{$IFDEF DEBUG_EMap}
  if ((EarthPoints[Start].Longitude-EarthPoints[Start+Length-1].Longitude)>metaDefine.ToZero)
    and ((EarthPoints[Start].Latitude-EarthPoints[Start+Length-1].Latitude)>metaDefine.tozero) then
    raise EMathError.Create('多边形不重合');
{$ENDIF}
//  Result:=0;
  bearing:=TBearing.Create;
  try
    SetLength(TempEarths,Length);
    TempEarths[0].Longitude:=0;
    TempEarths[0].Latitude:=0;
    TempEarths[Length-1]:=TempEarths[0];
    for i:=1 to Length-2 do
    begin
      bearing.Calculate(EarthPoints[i-1],EarthPoints[i]);
      TempEarths[i].Longitude:=TempEarths[i-1].Longitude+
        bearing.Distance*cos((90-bearing.InitialBearing)/180*pi);
      TempEarths[i].Latitude:=TempEarths[i-1].Latitude+
        bearing.Distance*sin((90-bearing.InitialBearing)/180*pi);
    end;
    sum:=0;
    for i:=0 to Length-2 do
    begin
      sum:=sum+TempEarths[i].Longitude * TempEarths[i+1].Latitude -
      TempEarths[i+1].Longitude * TempEarths[i].Latitude
    end;
    Result:=abs(0.5*sum);
  finally
    bearing.Free;
  end;
end;

class function GisMeasure.GetWorldArea(EarthPoints:TEarthPointAry;
  Start, Length: integer): double;//多边形面积
var
  i: integer;
  sum:Double;
begin
  sum:=0;
  for i:=0 to Length-2 do
  begin
    sum:=sum+EarthPoints[i+start].X * EarthPoints[i+start+1].Y -
      EarthPoints[i+start+1].X * EarthPoints[i+start].Y
  end;
  Result:=abs(0.5*sum);
end;

class function GisMeasure.GetWorldDistance(P1,
  P2: TEarthPoint): Double;
begin
  Result:=GeometryCalc.Gis_P2P_Dist(P1.x,P1.y,P2.x,P2.y);
end;

class function GisMeasure.GetWorldGirth(EarthPoints: TEarthPointAry; Start,
  Length: Integer): Extended;
var i:Integer;
begin
  Result:=0;
  for i:=Start to Start+Length-2 do
  begin
    Result:=Result+GetWorldDistance(EarthPoints[i],EarthPoints[i+1]);
  end;
end;

end.
