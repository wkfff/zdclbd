unit TrackPlayUnit;

interface
uses
  CmdStructUnit, SyncObjs;
type
  TBuffer = record
    Pos: Integer;//ָ���ڱ��ػ�������λ�ã���һ��λ��Ϊ0����ʼ��Ϊ-1
    insertPos: Integer; // ��ѯ����ʱָ������һ��λ�ã���ʼΪ-1
    Count: Integer;//����������Ч���ݵĳ���
    Size: Integer;//�������ĳ���, ��ĳ�������ʱ�������ʷ���ݵĸ���
    DataFrom: Integer;//��������ʵ������������ʼλ�ã�ָ�����ݶε���ʼ����
    DataTo: Integer;//��������ʵ���������Ľ���λ�ã�ָ�����ݶεĽ�������
    Data: array of TQueryHistoryGpsData_V3; //TCmdSrvTermGpsData_V3;//TCmdSrvTermGpsData_V2; {TCmdSrvtermGpsdata;}//���ݻ�����
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
    procedure AfterScroll();virtual;abstract;//������ͼ��������
    function GetData: PQueryHistoryGpsData_V3; virtual ; abstract; //PCmdSrvTermGpsData_V3;virtual;abstract;
    procedure Lock();
    procedure Unlock();
    procedure InitBuffer();virtual;
  public
    constructor Create();
    destructor Destroy();override;
    class function PtrAdd(p: PByte; AOffset: Integer): PByte;
    function Eof(): Boolean;  //�Ƿ񵽴����ݻطŵĽ���λ��
    function Next(): Boolean;
    function Prev(): Boolean;
    function Last(): Boolean;
    function First(): Boolean;//����First��,ָ�뽫�Ƶ���ʼλ��,��ʱ���ܵ�������,ֱ������Next;
    property DevID: string read FDevID write SetDevID;
    property Fact_id: Integer read FFact_id write SetFact_id;
    property Count: Integer read FCount;//���⻺�����ĳ���
    property Current: Integer read FCurrent;//��ʾ��ǰ�����ݻط������⻺������λ�ã��ʼӦ����-1,��ʾ��Ч
    property Data: PQueryHistoryGpsData_V3 read GetData; //PCmdSrvTermGpsData_V3 read GetData;//��ǰλ�õ�����,���û������,����nil
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


