unit tyolist;
interface
uses
  Types,
  MetaDefine;
type
  TYIntegerlist=class;
  TYPointList=class;
  TWorldPointList=class;
  TPolyEarthPointList=class;
  TYIntegerList=class(TObject)
  private
    FCount:Integer;
    FAutoExtensive:Integer;
    FList: TIntegerDynArray;
  public
    constructor Create();
    destructor Destroy;override;
    procedure Init(AFirstSize:Integer);
    procedure Clear;
    function GetDataOrder(AData:Integer):Integer;
    function IsDataIn(AData:Integer):Boolean;
    function Add(AData:Integer):Integer;
    function AddXor(AData:Integer):Integer;
    function AddOr(AData:Integer):Integer;
    procedure Adds(ADatas: TIntegerDynArray);
    procedure AddsXor(ADatas: TIntegerDynArray);
    procedure AddsOr(ADatas: TIntegerDynArray);
    procedure Delete(AIndex:Integer);
    procedure Deletes(ADatas: TIntegerDynArray);
    function GetData(AIndex:integer):Integer;
    property Count:Integer read FCount;
    property AutoExtensive:Integer read FAutoExtensive Write FAutoExtensive;
    property List: TIntegerDynArray read FList;
  end;
  TYPointList=class(TObject)
  private
    FCount:Integer;
    FAutoExtensive:Integer;
    FList:TEarthPointAry;
  public
    constructor Create();
    destructor Destroy;override;
    procedure Init(AFirstSize:Integer);
    procedure Clear;
    function IsDataIn(AData:TEarthPoint):Boolean;
    function Add(AData:TEarthPoint):Integer;
    procedure Adds(ADatas:TEarthPointAry);
    procedure Delete(AIndex:Integer);
    procedure Shrink(AShrinkCount:integer);
    function GetData(AIndex:integer):TEarthPoint;
    property Count:Integer read FCount;
    property AutoExtensive:Integer read FAutoExtensive Write FAutoExtensive;
    property Data:TEarthPointAry read FList;
  end;
  TWorldPointList=class(TObject)
  private
    FCount:Integer;
    FAutoExtensive:Integer;
    FList:TWorldPointAry;
  public
    constructor Create();
    destructor Destroy;override;
    procedure Init(AFirstSize:Integer);
    procedure Clear;
    function IsDataIn(AData:TWorldPoint):Boolean;
    function Add(AData:TWorldPoint):Integer;
    procedure Adds(ADatas:TWorldPointAry);
    procedure Delete(AIndex:Integer);
    function GetData(AIndex:integer):TWorldPoint;
    property Count:Integer read FCount;
    property AutoExtensive:Integer read FAutoExtensive Write FAutoExtensive;
  end;
  TPolyEarthPointList=class(TYPointList)
  public
    property List:TEarthPointAry read FList;
  end;
implementation
uses
  tyoexception,
  elog;
{ TYIntegerList }

function TYIntegerList.Add(AData: Integer): Integer;
begin
  if FCount>=High(FList) then
    SetLength(FList,FCount+FAutoExtensive);
  FList[FCount]:=AData;
  Result:=FCount;
  Inc(FCount);
end;

function TYIntegerList.AddOr(AData: Integer): Integer;
begin
  Result:=GetDataOrder(AData);
  if Result<0 then
  begin
    if FCount>=High(FList) then
      SetLength(FList,FCount+FAutoExtensive);
    FList[FCount]:=AData;
    Result:=FCount;
    Inc(FCount);
  end;
end;

function TYIntegerList.AddXor(AData: Integer): Integer;
begin
  Result:=GetDataOrder(AData);
  if Result<0 then
    Result:=Add(AData)
  else
  begin
    Delete(Result);
    Result:=-1;
  end;
end;

procedure TYIntegerList.Adds(ADatas: TIntegerDynArray);
var
  i:Integer;
begin
  for i:=Low(ADatas) to High(ADatas) do
    Add(ADatas[i]);
end;

procedure TYIntegerList.AddsOr(ADatas: TIntegerDynArray);
var
  i:Integer;
  dataOrder:Integer;
begin
  for i:=Low(ADatas) to High(ADatas) do
  begin
    dataOrder:=GetDataOrder(ADatas[i]);
    if dataOrder<0 then
      Add(ADatas[i]);
  end;
end;

procedure TYIntegerList.AddsXor(ADatas: TIntegerDynArray);
var
  i:Integer;
  dataOrder:Integer;
begin
  for i:=Low(ADatas) to High(ADatas) do
  begin
    dataOrder:=GetDataOrder(ADatas[i]);
    if dataOrder<0 then
      Add(ADatas[i])
    else
      Delete(dataOrder);
  end;
end;

procedure TYIntegerList.Clear;
begin
  //SetLength(FList,FAutoExtensive);
  FCount:=0;
end;

constructor TYIntegerList.Create;
begin
  FCount:=0;
  FAutoExtensive:=20;
end;

procedure TYIntegerList.Delete(AIndex: Integer);
var
  i:Integer;
begin
  if (AIndex>=0) and (AIndex<fcount) then
    for i:=AIndex to FCount -2 do
      FList[i]:=FList[i+1];
  Dec(FCount);
end;

procedure TYIntegerList.Deletes(ADatas: TIntegerDynArray);
var
  i:Integer;
  dataOrder:Integer;
begin
  for i:=Low(ADatas) to High(ADatas) do
  begin
    dataOrder:=GetDataOrder(ADatas[i]);
    if dataOrder>0 then Delete(dataOrder);
  end;
end;

destructor TYIntegerList.Destroy;
begin
  inherited Destroy;
end;

function TYIntegerList.GetData(AIndex: integer): Integer;
begin
  if (AIndex>=0)and(AIndex<FCount) then
    Result:=FList[AIndex]
  else
   Result:=-1;
end;

function TYIntegerList.GetDataOrder(AData: Integer): Integer;
var
  i:Integer;
begin
  for i:=0 to FCount-1 do
    if FList[i]=AData then Break;
  if i<FCount then
    Result:=i
  else
    Result:=-1;
end;

procedure TYIntegerList.Init(AFirstSize:Integer);
begin
  if FCount=0 then
    SetLength(FList,AFirstSize);
end;

function TYIntegerList.IsDataIn(AData: Integer): Boolean;
var
  i:Integer;
begin
  Result:=False;
  for i:=0 to FCount-1 do
    if FList[i]=AData then
    begin
      Result:=True;
      Break;
    end;
end;

{ TYPointList }

function TYPointList.Add(AData: TEarthPoint): Integer;
begin
  if FCount>=High(FList) then
    SetLength(FList,FCount+FAutoExtensive);
  FList[FCount]:=AData;
  Result:=FCount;
  Inc(FCount);
end;

procedure TYPointList.Adds(ADatas: TEarthPointAry);
var
  i:Integer;
begin
  for i:=Low(ADatas) to High(ADatas) do
    Add(ADatas[i]);
end;

procedure TYPointList.Clear;
begin
  SetLength(FList,FAutoExtensive);
  FCount:=0;
end;

constructor TYPointList.Create;
begin
  FCount:=0;
  FAutoExtensive:=20;
end;

procedure TYPointList.Delete(AIndex: Integer);
var
  i:Integer;
begin
  if (AIndex>=0) and (AIndex<fcount) then
    for i:=AIndex to FCount -2 do
      FList[i]:=FList[i+1];
  Dec(FCount);
end;

destructor TYPointList.Destroy;
begin
  inherited Destroy;
end;

function TYPointList.GetData(AIndex: integer): TEarthPoint;
begin
  if (AIndex>=0)and(AIndex<FCount) then
    Result:=FList[AIndex];
end;

procedure TYPointList.Init(AFirstSize: Integer);
begin
  if FCount=0 then
    SetLength(FList,AFirstSize);
end;

function TYPointList.IsDataIn(AData: TEarthPoint): Boolean;
var
  i:Integer;
begin
  Result:=False;
  for i:=0 to FCount-1 do
    if (FList[i].Longitude=AData.Longitude) and (FList[i].Latitude=AData.Latitude) then
    begin
      Result:=True;
      Break;
    end;
end;

procedure TYPointList.Shrink(AShrinkCount: integer);
begin
  if AShrinkCount>count then FCount:=0
  else
    FCount:=FCount-AShrinkCount;
  
  if Length(FList)>FCount+FAutoExtensive then   //缩短数组的长度
    SetLength(FList,FCount+FAutoExtensive);
end;

{ TWorldPointList }

function TWorldPointList.Add(AData: TWorldPoint): Integer;
begin
  if FCount>=High(FList) then
    SetLength(FList,FCount+FAutoExtensive);
  FList[FCount]:=AData;
  Result:=FCount;
  Inc(FCount);
end;

procedure TWorldPointList.Adds(ADatas: TWorldPointAry);
var
  i:Integer;
begin
  for i:=Low(ADatas) to High(ADatas) do
    Add(ADatas[i]);
end;

procedure TWorldPointList.Clear;
begin
  SetLength(FList,FAutoExtensive);
  FCount:=0;
end;

constructor TWorldPointList.Create;
begin
  FCount:=0;
  FAutoExtensive:=20;
end;

procedure TWorldPointList.Delete(AIndex: Integer);
var
  i:Integer;
begin
  if (AIndex>=0) and (AIndex<fcount) then
    for i:=AIndex to FCount -2 do
      FList[i]:=FList[i+1];
  Dec(FCount);
end;

destructor TWorldPointList.Destroy;
begin
  inherited Destroy;
end;

function TWorldPointList.GetData(AIndex: integer): TWorldPoint;
begin
  if (AIndex>=0)and(AIndex<FCount) then
    Result:=FList[AIndex];
end;

procedure TWorldPointList.Init(AFirstSize: Integer);
begin
  if FCount=0 then
    SetLength(FList,AFirstSize);
end;

function TWorldPointList.IsDataIn(AData: TWorldPoint): Boolean;
var
  i:Integer;
begin
  Result:=False;
  for i:=0 to FCount-1 do
    if (FList[i].x=AData.x) and (FList[i].y=AData.y) then
    begin
      Result:=True;
      Break;
    end;
end;

end.
