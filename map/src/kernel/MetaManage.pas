unit MetaManage;

interface
uses
  MetaDefine,
  MapProj,
  MemMapping,
  classes,
  Types,
  tyodefine;
type
  TFlexData=class;
  TFlexDataManage=class;
  TFlexDataes=array of TFlexData;

  TRequireFlexDataEvent=procedure (const AProjectionType:Integer)of object;
  TFlexData=class(TObject)
  private
    FMetaFlexs:TWorldMetaAry;
    FAvailability: Boolean;
    FProjectionType: integer;
    FIndex: Integer;
    FDataFile:TMemMapFile;
    FMetaCount: Integer;
    FWorldOutBox: TWorldRect;
    FFileName: string;
//    FActualFileName:string;
//    FGuid:TGUID;
    function GetDynamicData: Integer;
    procedure SetAvailability(const Value: Boolean);
    procedure SetIndex(const Value: Integer);
    procedure SetProjectionType(const Value: integer);
    function GetAddress: Integer;
    function GetFileSize: Integer;
    procedure SetFileName(const Value: string);
  protected
    procedure SetDataHead(AHead: PFileHead);virtual;
    procedure GetDataHead(var AHead: TFileHead);virtual;
  public
    constructor Create;virtual;
    destructor Destroy;override;
    function GetMetaFlexsAddress:Integer;
    procedure SetMetaFlexsLength(i:integer);
    function GetFlexMeta(Index: Integer): TWorldMeta;
    procedure Load(MapFile: TMemMapFile);
    procedure LoadMetaFromStream(ALength:Integer;AStream:TStream);virtual;
    property Index:Integer read FIndex Write SetIndex;
    property ProjectionType:integer read FProjectionType Write SetProjectionType;
    property WorldOutBox:TWorldRect read FWorldOutBox Write FWorldOutBox;
    property Availability:Boolean read FAvailability Write SetAvailability;
    property DynamicData:Integer read GetDynamicData;
    property FlexMeta[Index:Integer]:TWorldMeta read GetFlexMeta;
    property MetaFLexs:TWorldMetaAry read FMetaFlexs Write FMetaFlexs;
    property MetaCount:Integer read FMetaCount write FMetaCount;
    property Address:Integer read GetAddress;
    property FileName:string  read FFileName write SetFileName;
    property FileSize:Integer read GetFileSize;
    property FlexDataFile:TMemMapFile read FDataFile;
  end;
  TFlexDataManage=class(TObject)
  private
    FCount:Integer;
    FFlexDatas:TFlexDataes;
    FAccordingTable:TIntegerDynArray;
    FOnRequireFlexData: TRequireFlexDataEvent;
    function GetFlexDatas(Index: Integer): TFlexData;
    procedure SetOnRequireFlexData(const Value: TRequireFlexDataEvent);
    function GetAccordingTable(Index: Integer): Integer;
  protected
    procedure DoNeedFlexData(const AProjectionType:Integer);
  public
    constructor Create;virtual;
    destructor Destroy;override;
    property Count:Integer read FCount;
    function Add(const AProjectionType:Integer):Integer;
    procedure RemoveByIndex(Index:Integer);
    procedure RemoveByProjectionType(const Prj_Type:Integer);
    function GetDataIndex(AProjectionType:integer):Integer;
    function GetDataByIndex(AIndex:Integer):TFlexData;
    function GetDataByParam(AProjectionType:integer):TFlexData;
    function GetDataByProjectionType(const AProjectionType:Integer):TFlexData;
    property FlexDatas[Index:Integer]:TFlexData read GetFlexDatas;
    property OnRequireFlexData:TRequireFlexDataEvent read FOnRequireFlexData write SetOnRequireFlexData;
  end;
implementation
uses
  Sysutils,
  Staticproc,
  windows,
  ComObj,
  geome,
  tyoException,
  RunData;
{ TMetaLib }

constructor TFlexData.Create;
begin
  inherited Create;
  FProjectionType:=1;
  //初始化外包矩形
  FWorldOutBox := GeometryCalc.InitWorldRect;
  FMetaCount := 0;
  SetLength(FMetaFlexs,0);
  
  //FWorldOutBox:=WorldRect(MaxInt div 3,MaxInt div 3,-MaxInt div 3,-MaxInt div 3);
end;

destructor TFlexData.Destroy;
begin
  inherited Destroy;
end;

function TFlexData.GetAddress: Integer;
begin
  if FDataFile<>nil then
    Result:=integer(FDataFile.Data)
  else
    Result:=-1;
end;

procedure TFlexData.GetDataHead(var AHead: TFileHead);
begin
  AHead.WorldBoxLeft := FWorldOutBox.Left;
  AHead.WorldBoxRight := FWorldOutBox.Right;
  AHead.WorldBoxTop := FWorldOutBox.Top;
  AHead.WorldBoxBottom := FWorldOutBox.Bottom;
end;

function TFlexData.GetDynamicData: Integer;
begin
  raise ENotComplete.Create;
end;

function TFlexData.GetFileSize: Integer;
begin
  Result:=-1;
  if FDataFile<>nil then
    Result:=FDataFile.Size;
end;

function TFlexData.GetFlexMeta(Index: Integer): TWorldMeta;
begin
  if (Index>=0)and(Index<FMetaCount)then
    Result:=FMetaFlexs[Index]
  else
    raise EIndexError.Create;
end;

function TFlexData.GetMetaFlexsAddress: Integer;
begin
  Result:=Integer(@FMetaFlexs[0]);
end;

procedure TFlexData.Load(MapFile: TMemMapFile);
var
  i:Integer;
  dynamicStart:Integer;
  fileHead: TFileHead;
begin
  FDataFile := MapFile;
  if FDataFile = nil then Exit;
  fileHead := PFileHead(FDataFile.data)^;
  SetDataHead(@fileHead);
  SetLength(FMetaFlexs,fileHead.MetaCount);
  dynamicStart:=integer(FDataFile.data)+fileHead.WorldIndexOffset;
  CopyMemory(@FMetaFlexs[0],Pointer(dynamicStart),fileHead.WorldIndexLength);
  dynamicStart:=integer(FDataFile.data)+fileHead.WorldDataOffset;
  for i:=0 to FMetaCount - 1 do
  begin
    with FMetaFlexs[i] do
    begin
      case _Type of
        _Polyline:
        begin
          Polyline.PWAddress:=Polyline.PWAddress+dynamicStart;
          Polyline.SPWAddress:=Polyline.SPWAddress+dynamicStart;
        end;
        _PolyRegion:
        begin
          PolyRegion.PWAddress:=PolyRegion.PWAddress+dynamicStart;
          PolyRegion.SPWAddress:=PolyRegion.SPWAddress+dynamicStart;
          //@@PolyRegion.SWOutboxAddress:=PolyRegion.SWOutboxAddress+dynamicStart;
          //@@PolyRegion.SWPositives:=PolyRegion.SWPositives+dynamicStart;
        end;
      end;
    end;
  end;
end;

procedure TFlexData.LoadMetaFromStream(ALength: Integer; AStream: TStream);
begin
  SetLength(FMetaFlexs,ALength);
  FMetaCount:=ALength;
  AStream.read(FMetaFlexs[0],ALength*SizeOf(TWorldMeta));
end;

procedure TFlexData.SetAvailability(const Value: Boolean);
begin
  FAvailability := Value;
end;



procedure TFlexData.SetDataHead(AHead: PFileHead);
begin
  FMetaCount     := AHead^.MetaCount;
  FProjectionType := 1;//fixed
  FWorldOutBox.Left := AHead^.WorldBoxLeft;
  FWorldOutBox.Right := AHead^.WorldBoxRight;
  FWorldOutBox.Top := AHead^.WorldBoxTop;
  FWorldOutBox.Bottom := AHead^.WorldBoxBottom;
end;

procedure TFlexData.SetFileName(const Value: string);
begin
  FFileName := Value;
end;

procedure TFlexData.SetIndex(const Value: Integer);
begin
  FIndex := Value;
end;


procedure TFlexData.SetMetaFlexsLength(i: integer);
begin
  SetLength(FMetaFlexs,i);
end;

procedure TFlexData.SetProjectionType(const Value: integer);
begin
  FProjectionType := Value;
  //初始化WorldOutBox
end;

{ TFlexDataManage }

function TFlexDataManage.Add(const AProjectionType:Integer): Integer;
begin
  if FCount>=Length(FAccordingTable) then
    SetLength(FAccordingTable,FCount+1);
  if AProjectionType>=High(FFlexDatas) then
    SetLength(FFlexDatas,AProjectionType+1);
  FFlexDatas[AProjectionType]:=TFlexData.Create;
  FAccordingTable[FCount]:=AProjectionType;
  FFlexDatas[AProjectionType].Index:=AProjectionType;
  Result:=FCount;
  Inc(FCount);
end;

constructor TFlexDataManage.Create;
begin
  FCount:=0;
end;

destructor TFlexDataManage.Destroy;
var
  i:Integer;
begin
  for i:=0 to High(FFlexDatas) do
    if FFlexDatas[i]<>nil then FFlexDatas[i].Free;
  inherited Destroy;
end;

function TFlexDataManage.GetDataByIndex(AIndex: Integer): TFlexData;
begin
  Result:=GetFlexDatas(AIndex);
end;

function TFlexDataManage.GetDataByParam(AProjectionType:integer): TFlexData;
begin
  Result:=nil;
  if (AProjectionType>=0)and(AProjectionType<Length(FFlexDatas))then
    Result:=FFlexDatas[AProjectionType];
  if Result=nil then
  begin
    DoNeedFlexData(AProjectionType);
    Result:=FFlexDatas[AProjectionType];
  end;
end;

function TFlexDataManage.GetDataIndex(AProjectionType:integer): Integer;
var
  i:Integer;
begin
  Result:=-1;
  for i:=0 to FCount-1 do
    if FAccordingTable[i]=AProjectionType then
    begin
      Result:=i;
      Break;
    end;
  if Result=-1 then
    DoNeedFlexData(AProjectionType);
  for i:=0 to FCount-1 do
    if FAccordingTable[i]=AProjectionType then
    begin
      Result:=i;
      Break;
    end;
  if Result=-1 then
    raise EIndexError.Create;
end;

function TFlexDataManage.GetFlexDatas(Index: Integer): TFlexData;
begin
  if (Index>=0) and (Index<FCount) then
    Result:=FFlexDatas[getAccordingTable(Index)]
  else
    raise EIndexError.Create;
end;

procedure TFlexDataManage.RemoveByIndex(Index: Integer);
var
  i:Integer;
  prj_Type:Integer;
begin
  if (Index>=0)and(Index<FCount) then
  begin
    prj_Type:=FAccordingTable[Index];
    if FFlexDatas[prj_Type]<>nil then
    begin
      FFlexDatas[Index].Free;
      FFlexDatas[Index]:=nil;
    end;
    for i:=Index to FCount - 2 do
      FAccordingTable[i]:=FAccordingTable[i+1];
    Dec(FCount);
  end
  else
    raise EIndexError.Create;
end;

procedure TFlexDataManage.SetOnRequireFlexData(
  const Value: TRequireFlexDataEvent);
begin
  FOnRequireFlexData := Value;
end;

function TFlexDataManage.GetAccordingTable(Index: Integer): Integer;
begin
  Result:=FAccordingTable[Index];
end;

procedure TFlexDataManage.DoNeedFlexData(const AProjectionType: Integer);
begin
  if Assigned(FOnRequireFlexData) then
    FOnRequireFlexData(AProjectionType);
end;

function TFlexDataManage.GetDataByProjectionType(
  const AProjectionType: Integer): TFlexData;
begin
  Result:=FFlexDatas[AProjectionType];
end;

procedure TFlexDataManage.RemoveByProjectionType(const Prj_Type: Integer);
var
  i:Integer;
  prj_Index:Integer;
begin
  prj_Index:=-1;
  for i:=0 to FCount - 1 do
    if FAccordingTable[i]=Prj_Type then
    begin
      prj_Index:=i;
      Break;
    end;
  if prj_Index>=0 then
    RemoveByIndex(prj_Index)
  else
    raise EIndexError.Create;
end;

end.

