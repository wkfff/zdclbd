unit MapMeasure;
interface
uses
  MetaDefine,
  tyoList;
type
  TMeasure=class(TObject)
  private
    FPoints:TYPointList;
    FDistance:Double;
    FIsNonEarth: Boolean;
    function GetCount: Integer;
    procedure SetIsNonEarth(const Value: Boolean);
  public
    constructor Create;
    destructor Destroy;override;
    procedure Clear;
    procedure AddPoint(P: TEarthPoint);
    procedure AddPoints(Ps:TEarthPointAry);
    function GetDistance:Double;overload;
    function GetDistance(P:TEarthPoint):Double;overload;
    function GetArea:Double;
    procedure DeletePoint(const AIndex:Integer);
    property Count:Integer read GetCount;
    property IsNonEarth:Boolean read FIsNonEarth write SetIsNonEarth;
  end;
implementation
uses
  MapMeasureCalc;
{ TMeasure }

procedure TMeasure.AddPoint(P: TEarthPoint);
begin
//add point
  FPoints.Add(P);
//Get Distance
  if FPoints.Count>1 then
    if IsNonEarth then
      FDistance:=FDistance+GisMeasure.GetWorldDistance(
        FPoints.GetData(FPoints.Count-2),FPoints.GetData(FPoints.Count-1))
    else
    FDistance:=FDistance+GisMeasure.GetGisDistance(
      FPoints.GetData(FPoints.Count-2),FPoints.GetData(FPoints.Count-1))
  else
    FDistance:=0;
end;

procedure TMeasure.AddPoints(Ps: TEarthPointAry);
begin

end;

procedure TMeasure.Clear;
begin
  FPoints.Clear;
  FDistance:=0;
end;

constructor TMeasure.Create;
begin
  inherited Create;
  FPoints:=TYPointList.Create;
end;

procedure TMeasure.DeletePoint(const AIndex: Integer);
var
  i:Integer;
begin
  FPoints.Delete(AIndex);
  FDistance:=0;
  for i:=0 to FPoints.Count - 2 do
    if IsNonEarth then
      FDistance:=FDistance+GisMeasure.GetWorldDistance(
        FPoints.GetData(i),FPoints.GetData(i+1))
    else
      FDistance:=FDistance+GisMeasure.GetGisDistance(
        FPoints.GetData(i),FPoints.GetData(i+1));
end;

destructor TMeasure.Destroy;
begin
  FPoints.Free;
  inherited;

end;

function TMeasure.GetArea: Double;
begin
  FPoints.Add(FPoints.GetData(0));
  if IsNonEarth then
    Result:=GisMeasure.GetWorldArea(FPoints.Data,0,FPoints.Count)
  else
    Result:=GisMeasure.GetGisArea(FPoints.Data,0,FPoints.Count);
  FPoints.Delete(FPoints.Count-1);
end;

function TMeasure.GetDistance: Double;
begin
  Result:=FDistance;
end;

function TMeasure.GetCount: Integer;
begin
  Result:=FPoints.Count;
end;

function TMeasure.GetDistance(P: TEarthPoint): Double;
begin
  if IsNonEarth then
    Result:=FDistance+GisMeasure.GetWorldDistance(FPoints.GetData(FPoints.Count-1),P)
  else
    Result:=FDistance+GisMeasure.GetGisDistance(FPoints.GetData(FPoints.Count-1),P);
end;

procedure TMeasure.SetIsNonEarth(const Value: Boolean);
begin
  FIsNonEarth := Value;
end;

end.
