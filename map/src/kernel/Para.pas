unit Para;

interface
uses
  windows,
  Graphics,
  MetaDefine,
  Types,
  Sysutils;
type
  TParameterType = (ptByte,ptInteger,ptLongword,ptDouble,ptString,
    ptColor,ptWorldPoint,ptEarthPoint,ptMemBlock,ptLine,
    ptWorldSymbol,ptPenStruct,ptBrushStruct,ptTrueFontStruct,ptBool,ptNone);
  TGisParam=class;
  TGisParams=class;

  {参数类，提供保存各种参数的方法
  内部实现：通过动态的内存分配保存变量值，以一个统一的接口访问}
  TGisParam=class
  private
    {内部用来保存变量内存的首地址}
    FAddress:longWord;
    {所分配的内存的尺寸（长度）}
    FLen:integer;
    {保存的变量的类型}
    FType:TParameterType;
    {变量的名称，只是一个标识的作用}
    FName:string;
    {以字节(8bit)的形式返回内部的数据}
    function GetAsByte: byte;
    {以双精度浮点的形式返回内部的数据}
    function GetAsDouble: double;
    {以整形的形式返回内部的数据}
    function GetAsInteger: integer;
    {以字符串的形式返回内部的数据}
    function GetAsString: string;
    {以字节的形式保存内部的数据}
    procedure SetAsByte(const Value: byte);
     {以双精度浮点的形式保存内部的数据}
    procedure SetAsDouble(const Value: double);
    {以字符串的形式保存内部的数据}
    procedure SetAsString(const Value: string);
    {以整形的形式保存内部的数据}
    procedure SetAsInteger(const Value: integer);
    function GetAsColor: TColor;
    function GetAsWorldPoint: TWorldPoint;
    procedure SetAsColor(const Value: TColor);
    procedure SetAsWorldPoint(const Value: TWorldPoint);
    {重新分配存储内存的空间
    @param Size:integer 新的空间大小
    @return 返回新空间的首地址}
    function ResizeMem(size:integer):pointer;
    function GetAsEarthPoint: TEarthPoint;
    procedure SetAsEarthPoint(const Value: TEarthPoint);
    function GetAsSymbolFix: TWorldSymbol;
    procedure SetAsSymbolFix(const Value: TWorldSymbol);

//    function GetAslineFix: TEarthLine;
//    procedure SetAsLineFix(const Value: TEarthLine);
    function GetAsLongword: Longword;
    procedure SetAsLongword(const Value: Longword);
    function GetAsBool: boolean;
    procedure SetAsBool(const Value: boolean);
    function GetAsPenStruct: TPenStruct;
    procedure SetAsPenStruct(const Value: TPenStruct);
    function GetAsBrushStruct: TBrushStruct;
    function GetAsTrueFontStruct: TTrueFontStruct;
    procedure SetAsBrushStruct(const Value: TBrushStruct);
    procedure SetAsTrueFontStruct(const Value: TTrueFontStruct);
  public
    constructor Create;
    destructor Destroy;override;
    procedure PutMemoryBlock(Pmem:pointer;Len:integer);
    procedure ReadAsIntArray(var IntArray: TIntegerDynArray);
    procedure ReadAsByteArray(var ByteArray: TByteDynArray);
    procedure ReadAsDoubleArray(var DoubleArray: TDoubleDynArray);
    property AsString:string read GetAsString write SetAsString;
    property AsByte:byte read GetAsByte write SetAsByte;
    property AsBool:boolean read GetAsBool write SetAsBool;
    property AsInteger:integer read GetAsInteger write SetAsInteger;
    property AsDouble:double read GetAsDouble write SetAsDouble;
    property AsLongword:Longword read GetAsLongword write SetAsLongword;
    property AsWorldPoint:TWorldPoint read GetAsWorldPoint write SetAsWorldPoint;
    property AsEarthPoint:TEarthPoint read GetAsEarthPoint write SetAsEarthPoint;
    property AsColor:TColor read GetAsColor write SetAsColor;
    property AsSymbolFix:TWorldSymbol read GetAsSymbolFix write SetAsSymbolFix;
//    property AsLineFix:TEarthLine read GetAslineFix write SetAsLineFix;
    property AsPenStruct:TPenStruct read GetAsPenStruct Write SetAsPenStruct;
    property AsBrushStruct:TBrushStruct read GetAsBrushStruct Write SetAsBrushStruct;
    property AsTrueFontStruct:TTrueFontStruct read GetAsTrueFontStruct Write SetAsTrueFontStruct;
    property ParamAddr:longword read FAddress;
    property ParamLen :integer read FLen write FLen;
    property ParamType:TParameterType read FType;
    property ParamName:string read FName write FName;
  end;
  TGisParamArray=array of TGisParam;

  TGisParams=class
  private
    FGisParam: TGisParamArray;
    FCount:integer;
  public
    constructor Create;
    destructor Destroy;override;
    function AddParam(Param: TGisParam):integer;overload;
    function AddParam:TGisParam;overload;
    function NewParam: integer;overload;
    procedure NewParam(Num:integer);overload;
    procedure Clear;
    function ParamByName(Name:string):TGisParam;
    procedure ReMoveParam(Index:integer);
    property Count:integer read FCount write FCount;
    property Params:TGisParamArray read FGisParam write FGisParam;
  end;

implementation
uses
  tyoexception;
{ TGisParam }

constructor TGisParam.Create;
begin
  FLen:=0;
  FType:=ptNone;
end;

destructor TGisParam.Destroy;
var
  p:pointer;
begin
  if FLen>0 then
  begin
    p:=pointer(FAddress);
    ReAllocMem(p,0);
  end;
  inherited;
end;

function TGisParam.GetAsBool: boolean;
var
  p:PInteger;
begin
  p:=Pointer(FAddress);
  if p^<>0 then
    Result:=True
  else
    Result:=False;
end;

function TGisParam.GetAsByte: byte;
var
  p:PByte;
begin
    p:=Pointer(FAddress);
    Result:=p^;
end;

function TGisParam.GetAsColor: TColor;
var
  p:PColor;
begin
  if FLen>=SizeOf(TColor) then
  begin
    p:=Pointer(FAddress);
    Result:=p^;
  end else
  Result:=clWhite;
end;

function TGisParam.GetAsDouble: double;
type
  PDouble=^double;
var
  p:PDouble;
begin
  p:=PDouble(FAddress);
  Result:=p^;
end;

function TGisParam.GetAsBrushStruct: TBrushStruct;
var
  p:PBrushStruct;
begin
  p:=PBrushStruct(FAddress);
  Result:=p^;
end;

function TGisParam.GetAsPenStruct: TPenStruct;
var
  p:PPenStruct;
begin
  p:=PPenStruct(FAddress);
  Result:=p^;
end;

function TGisParam.GetAsEarthPoint: TEarthPoint;
var
  p:PEarthPoint;
begin
  p:=PEarthPoint(FAddress);
  Result:=p^;
end;

function TGisParam.GetAsTrueFontStruct: TTrueFontStruct;
var
  p:PTrueFontStruct;
begin
  p := PTrueFontStruct(FAddress);
  Result:=p^;
end;

function TGisParam.GetAsInteger: integer;
var
  p:PInteger;
begin
  p:=Pointer(FAddress);
  Result:=p^;
end;

{function TGisParam.GetAslineFix: TEarthLine;
var
  p:^TEarthLine;
begin
  p:=Pointer(FAddress);
  Result:=p^;
end;       }


function TGisParam.GetAsLongword: Longword;
var
  p:PLongword;
begin
  p:=Pointer(FAddress);
  Result:=p^;
end;

function TGisParam.GetAsString: string;
var
  s:string;
begin
  SetLength(s,FLen);
  CopyMemory(@s[1],Pointer(FAddress),FLen);
  Result:=s;
end;

function TGisParam.GetAsSymbolFix: TWorldSymbol;
type
  PWorldSymbol = ^TWorldSymbol;
var
  p:PWorldSymbol;
begin
  p:=Pointer(FAddress);
  Result:=p^;
end;

function TGisParam.GetAsWorldPoint: TWorldPoint;
var
  p:PWorldPoint;
begin
  if FLen<SizeOf(TWorldPoint) then ENotComplete.Create;
  p:=pointer(FAddress);
  Result:=p^;
end;

procedure TGisParam.PutMemoryBlock(Pmem: pointer; Len: integer);
var
  p:pointer;
begin
  p:=ResizeMem(Len);
  CopyMemory(p,Pmem,Len);
end;

procedure TGisParam.ReadAsIntArray(var IntArray: TIntegerDynArray);
begin
  SetLength(IntArray,FLen div SizeOf(Integer));
  CopyMemory(@IntArray[0],pointer(FAddress),FLen);
end;

procedure TGisParam.ReadAsDoubleArray(var DoubleArray: TDoubleDynArray);
begin
  SetLength(DoubleArray,FLen div SizeOf(double));
  CopyMemory(@DoubleArray[0],pointer(FAddress),FLen);
end;

procedure TGisParam.ReadAsByteArray(var ByteArray: TByteDynArray);
begin
  SetLength(ByteArray,FLen div SizeOf(byte));
  CopyMemory(@ByteArray[0],pointer(FAddress),FLen);
end;

function TGisParam.ResizeMem(size: integer): pointer;
var
  p:pointer;
begin
  FLen:=Size;
  p:=pointer(FAddress);
  ReAllocMem(p,FLen);
  FAddress:=longword(p);
  Result:=p;
end;

procedure TGisParam.SetAsBool(const Value: boolean);
var
  p:PInteger;
begin
  p:=ResizeMem(SizeOf(Integer));
  if Value then
    p^:=1
  else
    p^:=0;
  FType:=ptBool;
end;

procedure TGisParam.SetAsByte(const Value: byte);
var
  p:PByte;
begin
  p:=ResizeMem(SizeOf(Byte));
  p^:=Value;
  FType:=ptByte;
end;

procedure TGisParam.SetAsColor(const Value: TColor);
var
  p:PColor;
begin
  p:=ResizeMem(SizeOf(TColor));
  p^:=Value;
  FType:=ptColor;
end;

procedure TGisParam.SetAsDouble(const Value: double);
type
  PDouble=^double;
var
  pd:PDouble;
begin
  pd:=ResizeMem(SizeOf(Double));
  pd^:=Value;
  FType:=ptDouble;
end;

procedure TGisParam.SetAsBrushStruct(const Value: TBrushStruct);
var
  p: PBrushStruct;
begin
  p := ResizeMem(SizeOf(TBrushStruct));
  p^ := Value;
  FType := ptBrushStruct;
end;

procedure TGisParam.SetAsPenStruct(const Value: TPenStruct);
var
  p:PPenStruct;
begin
  p := ResizeMem(SizeOf(TPenStruct));
  p^ := Value;
  FType := ptPenStruct;
end;

procedure TGisParam.SetAsEarthPoint(const Value: TEarthPoint);
var
  p:PEarthPoint;
begin
  p:=ResizeMem(SizeOf(TEarthPoint));
  p^:=Value;
  FType:=ptEarthPoint;
end;

procedure TGisParam.SetAsTrueFontStruct(const Value: TTrueFontStruct);
var
  p:PTrueFontStruct;
begin
  p:=ResizeMem(SizeOf(TTrueFontStruct));
  p^:=Value;
  FType:=ptTrueFontStruct;
end;

procedure TGisParam.SetAsInteger(const Value: integer);
var
  p:PInteger;
begin
  p:=ResizeMem(SizeOf(Integer));
  p^:=Value;
  FType:=ptInteger;
end;

{procedure TGisParam.SetAsLineFix(const Value: TEarthLine);
var
  p: ^TEarthLine;
begin
  p:=ResizeMem(SizeOf(TEarthLine));
  p^:=Value;
  FType:=ptLine;
end;    }


procedure TGisParam.SetAsLongword(const Value: Longword);
var
  p:PLongword;
begin
  p:=ResizeMem(SizeOf(Longword));
  p^:=Value;
  FType:=ptLongword;
end;

procedure TGisParam.SetAsString(const Value: string);
begin
  ResizeMem(Length(Value));

  CopyMemory(Pointer(FAddress),@Value[1],FLen);
  FType:=ptString;
end;

procedure TGisParam.SetAsSymbolFix(const Value: TWorldSymbol);
type
  PWorldSymbol=^TWorldSymbol;
var
  p:PWorldSymbol;
begin
  p:=ResizeMem(SizeOf(TWorldSymbol));
  p^:=Value;
  FType:=ptWorldSymbol;
end;

procedure TGisParam.SetAsWorldPoint(const Value: TWorldPoint);
var
  p:PWorldPoint;
begin
  FLen:=SizeOf(TWorldPoint);
  p:=pointer(FAddress);
  ReAllocMem(p,FLen);
  FAddress:=Integer(p);
  p^:=Value;
  FType:=ptWorldPoint;
end;

{ TGisParams }
function TGisParams.AddParam(Param: TGisParam): integer;
begin
  inc(FCount);
  if FCount >= Length(FGisParam) then
    SetLength(FGisParam,FCount+10);
  FGisParam[FCount-1] := Param;
  result:=FCount-1;
end;

function TGisParams.NewParam: integer;
begin
  inc(FCount);
  if FCount>=Length(FGisParam) then
    SetLength(FGisParam,FCount+10);
  FGisParam[FCount-1] := TGisParam.Create;
  Result:=FCount-1;
end;

procedure TGisParams.Clear;
var
  i:integer;
begin
  for i:=0 to Count-1 do
  begin
    FGisParam[i].Free;
  end;
  FCount:=0;
end;

constructor TGisParams.Create;
begin
  FCount:=0;
  SetLength(FGisParam,10);
end;

destructor TGisParams.Destroy;
var
  i:integer;
begin
  for i:=0 to Count-1 do
    FGisParam[i].Free;
  inherited;
end;

procedure TGisParams.ReMoveParam(Index:integer);
begin
  raise ENotComplete.Create;
end;

procedure TGisParams.NewParam(Num: integer);
var
  i:integer;
begin
  for i:=0 to Num-1 do
    NewParam;
end;

function TGisParams.AddParam: TGisParam;
begin
  inc(FCount);
  if FCount>=Length(FGisParam) then
    SetLength(FGisParam,FCount+10);
  FGisParam[FCount-1]:=TGisParam.Create;
  result:=FGisParam[FCount-1];
end;

function TGisParams.ParamByName(Name: string): TGisParam;
var
  i:integer;
begin
  for i:=0 to FCount-1 do
  begin
    if UpperCase(Params[i].FName)=UpperCase(Name) then
    begin
      Result:=Params[i];
      Exit;
    end;
  end;
  Raise EIndexError.Create;
end;

end.
