{存放轨迹点
　为了回放时可退步，加入了DelPoint
　并当Count>=300(ucar中设定的Size)时，将要被覆盖的点全部存到 FOldList中。
　
  2004-12-17}
unit CycListUnit;

interface
uses
  MetaDefine;
type
  TCycWPList = class(TObject)
  private
    FList: TWorldPointAry;
    FOldList: TWorldPointAry;
//    {$ifopt d+} //回放调试用，放入 回放时　FTrackPlay.Current
//    FIntList:array[0..299] of Integer;
//    FIntOldList:array[0..1000] of Integer;
//    {$endif}
    FSize: Integer;
    FStart: Integer;
    FCount: Integer;
    FCs:    Integer;
    FHistoryDisplayBj: boolean;//Count大于size的次数
    function GetCount: Integer;
    function GetItems(Index: Integer): TWorldPoint;
    procedure SetItems(Index: Integer; const Value: TWorldPoint);
    procedure SetSize(const Value: Integer);
    procedure SetHistoryDisplayBj(const Value: boolean);
  public
    constructor Create;
    destructor Destroy;override;
    procedure AddPoint(p: TWorldPoint); //overload;
    //procedure AddPoint(p: TWorldPoint;ct:Integer); overload;
    procedure DelPoint(p:TWorldPoint);
    procedure Clear;
    procedure SetOldListSize(const Value: Integer);
    property Size: Integer read FSize write SetSize;
    property Items[Index: Integer]: TWorldPoint read GetItems write SetItems;
    property Count: Integer read GetCount;
    //轨迹回放标记，在监控软件中不需要保存Count>=300Size时被替的轨迹点，
    //而在回放软件中需要，为了回放时退步
    property HistoryDisplayBj:boolean read FHistoryDisplayBj write SetHistoryDisplayBj;
  end;
implementation


{ TCycWPList }

procedure TCycWPList.AddPoint(p: TWorldPoint);
begin
  if Size <= 0 then Exit;
  if Count >= Size then
  begin
    if HistoryDisplayBj then FOldList[FStart+FCs*Size]:= FList[FStart]; //暂存sha,回放用
    FList[FStart] := p;
    Inc(FStart);
    FCs:= Fcs + FStart div Size;
    FStart := FStart mod Size;
  end
  else
  begin
    //if HistoryDisplayBj then if FCount=0 then FOldList[0]:= p;//存第0点
    FList[FCount] := p;
    Inc(FCount);
  end;
end;

procedure TCycWPList.DelPoint(p: TWorldPoint);
begin
  if not HistoryDisplayBj then exit;
  if Size <= 0 then Exit;
  if Count >= Size then
  begin
    FStart := FStart -1;
    if (FStart=-1) then
    begin
      if Fcs>0 then
      begin
        FCs := FCs -1;
        FStart := Size - 1;
      end
      else if Fcs = 0 then
      begin
        Fstart := 0;
        FCount := Size -1;
      end;
    end;
    FList[FStart] := FOldList[FStart+FCs*Size];
//    {$ifopt d+}FIntList[FStart] := FIntOldList[Fstart+FCs*Size];{$endif}
  end
  else
    FCount:= FCount -1;
end;

//2011-12-01
//procedure TCycWPList.AddPoint(p: TWorldPoint; ct: Integer);
//begin
//{$ifopt d+}
//  if Size <= 0 then Exit;
//  if Count >= Size then
//  begin
//    FOldList[FStart+ FCs*Size]:= FList[FStart]; //暂存sha,回放用
//    FList[FStart] := p;
//    FIntOldList[Fstart+FCs*Size]:= FIntList[FStart];
//    FIntList[FStart]:= ct;
//
//    Inc(FStart);
//    FCs := FCs + FStart div Size;
//    FStart := FStart mod Size;
//  end
//  else
//  begin
//    if FCount=0 then FOldList[0]:= p;//存第0点
//    FList[FCount] := p;
//    FIntList[FCount] := ct;
//    Inc(FCount);
//  end;
//  {$endif}
//end;

procedure TCycWPList.Clear;
begin
  FSize := 0;
  FCount := 0;
  FStart := 0;
  Fcs:=0;
  SetLength(FList, 0);
  SetLength(FOldList, 0);
end;

constructor TCycWPList.Create;
begin
  FSize := 0;
  Fcs:=0;
end;

destructor TCycWPList.Destroy;
begin
  Clear;
  inherited;
end;

function TCycWPList.GetCount: Integer;
begin
  Result := FCount;
end;

function TCycWPList.GetItems(Index: Integer): TWorldPoint;
begin
  if (Index<0) or (Index>FCount) then Exit;
  Result := FList[(Index+fStart) mod Size];
end;

procedure TCycWPList.SetItems(Index: Integer; const Value: TWorldPoint);
begin
  if (Index<0) or (Index>FCount) then Exit;
  FList[(Index+fStart) mod Size] := Value;
end;

procedure TCycWPList.SetSize(const Value: Integer);
begin
  if FSize > 0 then Exit;
  SetLength(FList,Value);
  FSize := Value;
end;


procedure TCycWPList.SetOldListSize(const Value: Integer);
begin
  if HistoryDisplayBj then 
    SetLength(FOldList,Value);
end;

procedure TCycWPList.SetHistoryDisplayBj(const Value: boolean);
begin
  FHistoryDisplayBj := Value;
end;

end.
