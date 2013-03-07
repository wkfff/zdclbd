unit TrackPlayUnit;

interface
uses
  CmdStructUnit, SyncObjs;
type
  TBuffer = record
    Pos: Integer;//指针在本地缓冲区的位置，第一个位置为0，初始化为-1
    insertPos: Integer; // 查询插入时指向的最后一个位置，初始为-1
    Count: Integer;//缓冲区内有效数据的长度
    Size: Integer;//缓冲区的长度, 在某个具体的时间段内历史数据的个数
    DataFrom: Integer;//缓冲区在实际数据区的起始位置，指向数据段的起始索引
    DataTo: Integer;//缓冲区在实际数据区的结束位置，指向数据段的结束索引
    Data: array of TQueryHistoryGpsData_V3; //TCmdSrvTermGpsData_V3;//TCmdSrvTermGpsData_V2; {TCmdSrvtermGpsdata;}//数据缓冲区
  end;
  TTrackPlay = class(TObject)
  private
    FCriticalSection: TCriticalSection;
    FFact_id: Integer;
    FDevID: String;
    FTimeFrom: TDateTime;
    FTimeTo: TDateTime;
    procedure SetDevID(const Value: String);
    procedure SetFact_id(const Value: Integer);
  protected
    FBuf: TBuffer;
    FCount: Integer;
    FCurrent: Integer;
    function InnerEof(): Boolean;virtual;
    function InnerNext(): Boolean;virtual;abstract;
    function InnerPrev(): Boolean;virtual;abstract;
    function InnerLast(): Boolean;virtual;abstract;
    function InnerFirst(): Boolean;virtual;abstract;
    procedure AfterScroll();virtual;abstract;//数据试图滚动后发生
    function GetData: PQueryHistoryGpsData_V3; virtual ; abstract; //PCmdSrvTermGpsData_V3;virtual;abstract;
    procedure Lock();
    procedure Unlock();
    procedure InitBuffer();virtual;
  public
    constructor Create();
    destructor Destroy();override;
    class function PtrAdd(p: PByte; AOffset: Integer): PByte;
    function Eof(): Boolean;  //是否到达数据回放的结束位置
    function Next(): Boolean;
    function Prev(): Boolean;
    function Last(): Boolean;
    function First(): Boolean;//调用First后,指针将移到初始位置,此时不能调用数据,直到调用Next;
    property DevID: string read FDevID write SetDevID;
    property Fact_id: Integer read FFact_id write SetFact_id;
    property Count: Integer read FCount;//虚拟缓冲区的长度
    property Current: Integer read FCurrent;//表示当前的数据回放在虚拟缓冲区的位置，最开始应当是-1,表示无效
    property Data: PQueryHistoryGpsData_V3 read GetData; //PCmdSrvTermGpsData_V3 read GetData;//当前位置的数据,如果没有数据,返回nil
    property Buf: TBuffer read FBuf;
    property TimeFrom:TDatetime read FTimeFrom write    FTimeFrom;
    property TimeTo:TDatetime read FTimeTo write FTimeTo;
  end;
implementation

{ TTrackPlay }

constructor TTrackPlay.Create;
begin
  FCriticalSection := TCriticalSection.Create;
  InitBuffer;
  FCount := 0;
  FCurrent := -1;
end;

destructor TTrackPlay.Destroy;
begin
  FCriticalSection.Free;
  inherited;
end;

function TTrackPlay.Eof: Boolean;
begin
  Result := InnerEof;
end;

function TTrackPlay.First: Boolean;
begin
  Result := InnerFirst;
  AfterScroll;
end;

procedure TTrackPlay.InitBuffer;
begin
  FBuf.Size := 1024;
  SetLength(FBuf.Data,FBuf.Size);
  FBuf.Pos := -1;
  FBuf.Count := 0;
  FBuf.DataFrom := -1;
  FBuf.DataTo := -1;
end;

function TTrackPlay.InnerEof: Boolean;
begin
  Lock;
  try
    Result := (Current >= Count) or (Count = 0);
  finally
    Unlock;
  end;
end;

function TTrackPlay.Last: Boolean;
begin
  Result := InnerLast;
  AfterScroll;
end;

procedure TTrackPlay.Lock;
begin
  FCriticalSection.Enter;
end;

function TTrackPlay.Next: Boolean;
begin
  Result := InnerNext;
  AfterScroll;
end;

function TTrackPlay.Prev: Boolean;
begin
  Result := InnerPrev;
  AfterScroll;
end;

class function TTrackPlay.PtrAdd(p: PByte; AOffset: Integer): PByte;
begin
  Result := PByte(Integer(p)+AOffset);
end;


procedure TTrackPlay.SetDevID(const Value: String);
begin
  FDevID := Value;
end;

procedure TTrackPlay.SetFact_id(const Value: Integer);
begin
  FFact_id := Value;
end;

procedure TTrackPlay.Unlock;
begin
  FCriticalSection.Leave;
end;

end.


