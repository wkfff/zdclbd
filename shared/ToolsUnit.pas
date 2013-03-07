{
 @author:王磊（闲庭信步工作室 http://www.chinaworkroom.com）
 @created(2005-12-15)
 最后更新人:$Author: wfp $  <BR>
 当前版本:$Revision: 1.1.1.1 $  <BR>
 工具类
}
unit ToolsUnit;

interface
uses
  Types, SysUtils, DateUtils, Math;
type
  TFormatTimeType = (FormatTime19, FormatTime17, FormatTime8, FormatTime10, FormatTime23, FormatTime4);
  TFormatFloatType = (FormatFloat7);
  TTools = class
  private
  protected

  public
    constructor Create;
    destructor Destroy; override;
    class function getTimeByBCD(t: TByteDynArray): TDateTime;
    class function GetTime(t: TDateTime; AType: TFormatTimeType): string;
    class function SafeSql(const s: string): string;
    class function Format_Float(d: Double; FormatFloatType: TFormatFloatType): string;
    class function GetDevIdStr(DevID: Integer): string;
    class function GetPhotoTbName(DevID: Integer): string;
    class function GetGpsDataTbName(DevID: Integer): string;
    class function GetDistance(oldLong, oldLat: Double; newLong, newLat: Double): Double;
    class function GetDateSql(ADate: TDateTime): string;
  published

  end;

implementation

{ TTools }

constructor TTools.Create;
begin

end;

destructor TTools.Destroy;
begin

  inherited;
end;

class function TTools.getTimeByBCD(t: TByteDynArray): TDateTime;
begin
  try
    Result := EncodeDateTime(t[0] + 2000, t[1],
      t[2], t[3], t[4], t[5], 0);
    Result := Result + 1 / 3;
  except
    Result := EncodeDate(2000, 1, 1) + EncodeTime(0, 0, 0, 0);
  end;
end;
{
  转换为符合SQL使用的字符串
}

class function TTools.SafeSql(const s: string): string;
begin
  Result := StringReplace(s, #13#10, '', [rfReplaceAll]);
  Result := QuotedStr(Result);
end;

class function TTools.GetTime(t: TDateTime; AType: TFormatTimeType): string;
begin
  case AType of
    FormatTime8:
      Result := FormatDateTime('hh:mm:ss', t);
    FormatTime10:
      Result := FormatDateTime('yyyy-mm-dd', t);
    FormatTime17:
      Result := FormatDateTime('yy-mm-dd hh:mm:ss', t);
    FormatTime19:
      Result := FormatDateTime('yyyy-mm-dd hh:mm:ss', t);
    FormatTime23:
      Result := FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz', t);
    FormatTime4:
      Result := FormatDateTime('yyyy', t);
  end;
end;

class function TTools.GetDateSql(ADate: TDateTime): string;
begin
//  Result := 'convert(datetime,'+QuotedStr(FormatDateTime('yyyy-mm-dd hh:nn:ss',ADate))+',102)';
  Result := SafeSql(GetTime(ADate, FormatTime19));
end;

class function TTools.Format_Float(d: Double; FormatFloatType: TFormatFloatType): string;
begin
  case FormatFloatType of
    FormatFloat7:
      Result := FormatFloat('#.000000', d);
  end;
end;

class function TTools.GetDevIdStr(DevID: Integer): string;
begin
  Result := '22' + FormatFloat('0000000000', longword(DevID));
end;

class function TTools.GetPhotoTbName(DevID: Integer): string;
begin
  Result := 'photo' + GetDevIdStr(DevID);
end;

class function TTools.GetGpsDataTbName(DevID: Integer): string;
begin
  Result := 'gpsdata' + GetDevIdStr(DevID);
end;

class function TTools.GetDistance(oldLong, oldLat, newLong,
  newLat: Double): Double;
  function fmod(x, y: Double): Double;
  begin
    Result := x - (int(x / y) * y);
  end;
var
  StartLat: Double;
  StartLong: Double;
  EndLat: Double;
  EndLong: Double;
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
    dSigma, A1, B1, C1: Double;
  Iter: Integer;
const
  a: Double = 6378137.0; //WGS84 semimajor axis
  b: Double = 6356752.3142; //WGS84 semiminor axis
  e_Sqr: Double = 6.694379991013E-3; //square of WGS84 1st eccentricity
  ep_Sqr: Double = 6.73949674227E-3; //square of WGS84 2nd eccentricity
  F: Double = 3.35281066474E-3; //WGS84 flattening
  epsilon: Double = 1E-12; //termination criterion
  MinNumber: Double = 1E-50; //smallest number > 0
  MaxIter: Integer = 100;
  DegToRad: Double = PI / 180;
  RadToDeg: Double = 180 / PI;
begin
  try
    StartLat := oldLat;
    StartLong := oldLong;
    EndLat := newLat;
    EndLong := newLong;
    if (StartLat = EndLat) and (StartLong = EndLong) then
    begin
      Result := 0;
      Exit;
    end;

    Lat1 := StartLat * DegToRad; // convert latitudes to radians
    Lat2 := EndLat * DegToRad;

    dLon := (EndLong - StartLong) * DegToRad; // calc. diff. of longitudes
    Beta1 := ArcTan((1 - F) * Tan(Lat1)); // calculate 'reduced latitudes'
    Beta2 := ArcTan((1 - F) * Tan(Lat2));
    Lambda := dLon;

    Iter := 0;
    CosBeta1 := Cos(Beta1) + 1E-15;
    SinBeta1 := Sin(Beta1) + 1E-15;
    CosBeta2 := Cos(Beta2);
    SinBeta2 := Sin(Beta2);

    repeat
      Inc(Iter);

      Lambda0 := Lambda;
      CosLambda0 := Cos(Lambda0);
      SinLambda0 := Sin(Lambda0);

      SinSigma := Sqrt(Sqr(CosBeta2 * SinLambda0) + Sqr(CosBeta1 * SinBeta2 -
        SinBeta1 * CosBeta2 * CosLambda0));
      CosSigma := SinBeta1 * SinBeta2 + CosBeta1 * CosBeta2 * CosLambda0;

      Sigma := ArcTan2(SinSigma, CosSigma);
      SinAlpha := (CosBeta1 * CosBeta2 * SinLambda0) / SinSigma;
      CosSqrAlpha := (1 + SinAlpha) * (1 - SinAlpha);

      if abs(CosSqrAlpha) < MinNumber then
        Cos2Sigmam := 0
      else
        Cos2Sigmam := CosSigma - ((2 * SinBeta1 * SinBeta2) / CosSqrAlpha);

      C1 := (F / 16) * CosSqrAlpha * (4 + F * (4 - 3 * CosSqrAlpha));
      CosSqr2Sigmam := Sqr(Cos2Sigmam);
      Lambda := dLon + (1 - C1) * F * SinAlpha * (Sigma + C1 * SinSigma * (Cos2Sigmam
        + C1 * CosSigma * (-1 + 2 * CosSqr2Sigmam)));
    until not ((Iter < MaxIter) and (abs(Lambda - Lambda0) > epsilon));

    uSqr := ep_Sqr * CosSqrAlpha;
    A1 := 1 + (uSqr / 16384) * (4096 + uSqr * (-768 + uSqr * (320 - 175 * uSqr)));
    B1 := (uSqr / 1024) * (256 + uSqr * (-128 + uSqr * (74 - 47 * uSqr)));
    dSigma := B1 * SinSigma * (Cos2Sigmam + (B1 / 4) * ((-1 + 2 * CosSqr2Sigmam) * CosSigma -
      (B1 / 6) * (-3 + 4 * Sqr(SinSigma)) * (-3 + 4 * CosSqr2Sigmam) * Cos2Sigmam));

    FDistance := b * A1 * (Sigma - dSigma); // distance

    SinLambda := Sin(Lambda);
    CosLambda := Cos(Lambda);
    FInitialBearing := ArcTan2(CosBeta2 * SinLambda,
      (CosBeta1 * SinBeta2 - SinBeta1 * CosBeta2 * CosLambda));

    FInitialBearing := RadToDeg * fmod(FInitialBearing + 2 * PI, 2 * PI);
    FFinalBearing := ArcTan2(CosBeta1 * SinLambda,
      (CosBeta1 * SinBeta2 * CosLambda - SinBeta1 * CosBeta2));
    FFinalBearing := RadToDeg * fmod(FFinalBearing + 2 * PI, 2 * PI);
    Result := FDistance / 1000;
  except
  end;
end;

end.
