unit LoopList;

interface
uses
  MetaDefine;
type
  TWorldRectLoopList=class(TObject)
  protected
    FList:TWorldRectAry;
    FStartPos:Integer;
    FEndPos:Integer;
    FPos:Integer;
    FLoop:Boolean;
  public
    constructor Create();
    destructor Destroy;override;
    procedure Init(ASize:Integer);
    function Next:TWorldRect;
    function Prior:TWorldRect;
    function MoveTo(APos:Integer):TWorldRect;
    function First:TWorldRect;
    function Last:TWorldRect;
    procedure AddNew(AData:TWorldRect);
  end;
  TPointerLoopList=class(TObject)
  protected
    FList:array of Pointer;
    FStartPos:Integer;
    FEndPos:Integer;
    FPos:Integer;
    FLoop:Boolean;
  public
    constructor Create();virtual;
    destructor Destroy;override;
    procedure Init(ASize:Integer);virtual;
    function Next:Pointer;virtual;
    function Prior:Pointer;virtual;
    function MoveTo(APos:Integer):Pointer;virtual;
    function First:Pointer;virtual;
    function Last:Pointer;virtual;
    procedure AddNew(AData:Pointer);virtual;
  end;
  PBrowseUndoRecord=^TBrowseUndoRecord;

  TBrowseUndoRecord=record
    Describe:string;
    WorldRect:TWorldRect;
  end;
  TBrowseUndoList=class(TPointerLoopList)
  public
    constructor Create();override;
    destructor Destroy;override;
    function NextData:TBrowseUndoRecord;
    function PriorData:TBrowseUndoRecord;virtual;
    function MoveToData(APos:Integer):TBrowseUndoRecord;virtual;
    function FirstData:TBrowseUndoRecord;virtual;
    function LastData:TBrowseUndoRecord;virtual;
    procedure NewData(AData:TBrowseUndoRecord);virtual;
  end;
implementation

{ TWorldRectLoopList }

constructor TWorldRectLoopList.Create;
begin
  FStartPos:=0;
  FEndPos:=0;
  FPos:=0;
  SetLength(FList,255);
end;

destructor TWorldRectLoopList.Destroy;
begin
  inherited Destroy;
end;

function TWorldRectLoopList.First: TWorldRect;
begin
  if FPos<>0 then
  begin
    FPos:=FStartPos;
    Result:=FList[FPos];
  end;
end;

procedure TWorldRectLoopList.Init(ASize: Integer);
begin
  SetLength(FList,ASize);
end;

function TWorldRectLoopList.Last: TWorldRect;
begin
  if FPos<>0 then
  begin
    FPos:=FEndPos;
    Result:=FList[FPos];
  end;
end;

function TWorldRectLoopList.MoveTo(APos: Integer): TWorldRect;
begin
  FPos:=APos;
  Result:=FList[FPos];
end;

procedure TWorldRectLoopList.AddNew(AData: TWorldRect);
begin
  if FPos=0 then
  begin
    FStartPos:=1;
    FEndPos:=1;
    FPos:=1;
    FList[FPos]:=AData;
  end
  else
  begin
    Inc(FPos);
    FPos:=FPos mod 256;
    if FPos=0 then FPos:=1;
    if FStartPos=FPos then Inc(FStartPos);
    FStartPos:=FStartPos mod 256;
    if FStartPos = 0 then FStartPos:=1;
    FEndPos:=FPos;
    FList[FPos]:=AData;
  end;
end;

function TWorldRectLoopList.Next: TWorldRect;
begin
  if FPos>0 then
  begin
    if (FPos=FEndPos) then
      Result:=FList[FPos]
    else
    begin
      Inc(FPos);
      FPos:=FPos mod 256;
      if FPos=0 then FPos:=1;
      Result:=FList[FPos];
    end;
  end;
end;

function TWorldRectLoopList.Prior: TWorldRect;
begin
  if FPos>0 then
  begin
    if (FPos=FStartPos) then
      Result:=FList[FPos]
    else
    begin
      Dec(FPos);
      if FPos=0 then FPos:=255;
      Result:=FList[FPos];
    end;
  end;
end;

{ TPointerLoopList }

constructor TPointerLoopList.Create;
begin
  FStartPos:=0;
  FEndPos:=0;
  FPos:=0;
  SetLength(FList,256);
end;

destructor TPointerLoopList.Destroy;
//var
//  i:Integer;
begin
//  for i:=0 to High(FList) do
//    if FList[i]<>nil then Dispose(FList[i]);
  inherited Destroy;

end;

function TPointerLoopList.First: Pointer;
begin
  if FPos<>0 then
  begin
    FPos:=FStartPos;
    Result:=FList[FPos];
  end
  else
    Result:=nil;
end;

procedure TPointerLoopList.Init(ASize: Integer);
begin
  SetLength(FList,ASize);
end;

function TPointerLoopList.Last: Pointer;
begin
  if FPos<>0 then
  begin
    FPos:=FEndPos;
    Result:=FList[FPos];
  end
  else
    Result:=nil;
end;

function TPointerLoopList.MoveTo(APos: Integer): Pointer;
begin
  if FList[APos]<>nil then
  begin
    FPos:=APos;
    Result:=FList[FPos];
  end
  else
    Result:=nil;
end;

procedure TPointerLoopList.AddNew(AData:Pointer);
begin
  if FPos=0 then
  begin
    FStartPos:=1;
    FEndPos:=1;
    FPos:=1;
    FList[FPos]:=AData;
  end
  else
  begin
    Inc(FPos);
    FPos:=FPos mod 256;
    if FPos=0 then FPos:=1;
    if FStartPos=FPos then Inc(FStartPos);
    FStartPos:=FStartPos mod 256;
    if FStartPos = 0 then FStartPos:=1;
    FEndPos:=FPos;
    if FList[FPos]<>nil then
    begin
      Dispose(FList[FPos]);
      FList[FPos]:=nil;
    end;
    FList[FPos]:=AData;
  end;
end;

function TPointerLoopList.Next: Pointer;
begin
  if FPos>0 then
  begin
    if (FPos=FEndPos) then
      Result:=FList[FPos]
    else
    begin
      Inc(FPos);
      FPos:=FPos mod 256;
      if FPos=0 then FPos:=1;
      Result:=FList[FPos];
    end;
  end
  else
    Result:=nil;
end;

function TPointerLoopList.Prior: Pointer;
begin
  if FPos>0 then
  begin
    if (FPos=FStartPos) then
      Result:=FList[FPos]
    else
    begin
      Dec(FPos);
      if FPos=0 then FPos:=255;
      Result:=FList[FPos];
    end;
  end
  else
    Result:=nil;
end;

{ TBrowseUndoList }

constructor TBrowseUndoList.Create;
begin
  inherited Create;
end;

destructor TBrowseUndoList.Destroy;
var
  i:Integer;
begin
  for i:=0 to High(FList) do
    if FList[i]<>nil then Dispose(PBrowseUndoRecord(FList[i]));
  inherited Destroy;
end;


function TBrowseUndoList.FirstData: TBrowseUndoRecord;
var
  data:PBrowseUndoRecord;
begin
  data:=First;
  Result:=data^;
end;

function TBrowseUndoList.LastData: TBrowseUndoRecord;
var
  data:PBrowseUndoRecord;
begin
  data:=Last;
  Result:=data^;
end;

function TBrowseUndoList.MoveToData(APos: Integer): TBrowseUndoRecord;
var
  data:PBrowseUndoRecord;
begin
  data:=MoveTo(APos);
  Result:=data^;
end;

procedure TBrowseUndoList.NewData(AData: TBrowseUndoRecord);
var
  data:PBrowseUndoRecord;
begin
  New(data);
  data^:=AData;
  //data^.Describe:=AData.Describe;
  //data^.WorldRect := AData.WorldRect;
  AddNew(data);
end;

function TBrowseUndoList.NextData: TBrowseUndoRecord;
var
  data:PBrowseUndoRecord;
begin
  data:=Next;
  Result:=data^;
end;

function TBrowseUndoList.PriorData: TBrowseUndoRecord;
var
  data:PBrowseUndoRecord;
begin
  data:=Prior;
  Result:=data^;
end;

end.
