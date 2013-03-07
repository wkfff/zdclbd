{������Ϣ��,
�ṩ��������Ϣд��log�ļ��ķ���.
�޸ļ�¼:<br>
<li>2003-9-5 ������ WriteTimeMX���ԣ��ṩ����ָ��ʱ����������־����û���̵Ļ��ʹ��̡�
@author()
@created(2001-11-1)
@lastmod(2003-9-5)}
unit SystemLog;


interface
uses
  windows,
  FormS,
  shellapi,
  extctrls;
type
  {Debug��Ϣ�Ľṹ
  <Li>DateTime:string ʱ��
  <Li>Position:string �����λ�ã���¼�ļ�λ�û���õķ���λ��
  <Li>Description:string ���������}
  TLogFormat = record
    DateTime: string;
    Position: string;
    Description: string;
  end;

  {������Ϣ��,
  �ṩ��������Ϣд��log�ļ��ķ���.
  ���Ծ�̬�ĵ��û��߶�̬�ĵ���.}
  TSystemLog = class(TObject)
  private
    FLogstr: string;
    FTime: Cardinal;

    FTimer: TTimer;
    FLogFile: string;
    FWriteImmediate: Boolean;
    FBufferSize: Integer;
    FWriteMode: Word;
    FLock: TRTLCriticalSection;
    {�ٽ�����add by sha����ֹ����߳�ͬʱдFLogstr
    2006-3-21}
    FStrLock: TRTLCriticalSection;
    procedure WriteLog(logStr: string);
    procedure WriteLog_Ha(logStr: string);
    procedure SetLogFile(const Value: string);
    procedure SetWriteImmediate(const Value: Boolean);
    procedure SetBufferSize(const Value: Integer);
    procedure SetWriteMode(const Value: Word);
    {��Ӧʱ��ʱ�䣬
    �������־����û����Ļ��ʹ���}
    procedure DoOnTimer(Sender: TObject);
    procedure SetWriteTimeMX(const Value: integer);
    function GetWriteTimeMX: integer;
    procedure Lock;
    procedure UnLock;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    {��������־�ӵ��������У����ﵽ64Kʱ��д���ļ�}
    procedure AddLog(logStr: string); overload;
    procedure AddLog_Ha(logStr: string);
    procedure AddLog(LogFormat: TLogFormat); overload;
    {�Զ�д��ʱ��,��������,���ݵ���־}
    procedure AddLog(Position, Description: string); overload;
    procedure ResetTimer;
    function ElapsedTime: integer;
    property LogFile: string read FLogFile write SetLogFile;
    {д�뻺���С}
    property BufferSize: Integer read FBufferSize write SetBufferSize;
    {д��ģʽ}
    property WriteMode: Word read FWriteMode write SetWriteMode;
    {�Ƿ�����д��}
    property WriteImmediate: Boolean read FWriteImmediate write SetWriteImmediate;
    {������־�����ʱ����ʱ(����)}
    property WriteTimeMX: integer read GetWriteTimeMX write SetWriteTimeMX;
  end;

function LogFormat(errposition, description: string): TLogFormat;

implementation
uses
  Classes,
  Sysutils;

function LogFormat(errposition, description: string): TLogFormat;
begin
  Result.Position := errposition;
  Result.DateTime := DateToStr(date) + ' ' + TimeToStr(time);
  Result.Description := description;
end;

{ TGeoLog }

destructor TSystemLog.Destroy;
begin
  FTimer.Enabled := False;
  if FLogstr <> '' then
  begin
    WriteLog(FLogstr);
    WriteLog(#13#10);
  end;
  FTimer.Free;
  DeleteCriticalSection(FLock);
  DeleteCriticalSection(FStrLock);
  inherited
end;

function TSystemLog.ElapsedTime: integer;
begin
  Result := GetTickCount - FTime;
end;

procedure TSystemLog.AddLog(LogFormat: TLogFormat);
var logstr: string;
begin
  with LogFormat do
  begin
    logstr := Format('%s  %s  %s', [DateTime, Position, Description]);
  end;
  AddLog(logstr);
end;

procedure TSystemLog.Addlog(logStr: string);
begin
  {�ٽ�����add by sha����ֹ����߳�ͬʱдFLogstr}
  EnterCriticalSection(FStrLock);
  try
    FLogstr := FLogstr + logStr + #13 + #10;
    if (Length(FLogstr) > BufferSize) or WriteImmediate then
    begin
      WriteLog(FLogstr);
      FLogstr := '';
    end;
  finally
    LeaveCriticalSection(FStrLock);
  end;
end;

procedure TSystemLog.ResetTimer;
begin
  Ftime := GetTickCount;
end;

procedure TSystemLog.WriteLog(logStr: string);
var
  fs: TFileStream;
  fileName: string;
begin
  Lock;
  try
    FileName := FLogFile;
    fs := nil;

    try
      if FileExists(FileName) then
        fs := TFileStream.Create(FileName, WriteMode)
      else
        fs := TFileStream.Create(FileName, fmCreate or fmShareDenyWrite);

      fs.Position := fs.Size;
      fs.Write(logstr[1], Length(logstr));
      fs.Free;
    except
      fs.Free;
    end;
  finally
    UnLock;
  end;
end;

procedure TSystemLog.SetLogFile(const Value: string);
begin
  FLogFile := Value;
end;


procedure TSystemLog.SetWriteImmediate(const Value: Boolean);
begin
  FWriteImmediate := Value;
end;

procedure TSystemLog.AddLog(Position, Description: string);
begin
  addlog(LogFormat(Position, Description));
end;

procedure TSystemLog.SetBufferSize(const Value: Integer);
begin
  FBufferSize := Value;
end;

procedure TSystemLog.SetWriteMode(const Value: Word);
begin
  FWriteMode := Value;
end;

constructor TSystemLog.Create;
begin
  InitializeCriticalSection(FLock);
  InitializeCriticalSection(FStrLock);
  FBufferSize := 16 * 1024; //Ĭ����16K����
  FWriteMode := fmOpenReadWrite or fmShareDenyWrite;
  FTimer := TTimer.Create(nil);
  FTimer.OnTimer := DoOnTimer;
  FTimer.Interval := 10 * 1000; //Ĭ��ʮ���ӱ���һ������
  FTimer.Enabled := True;
end;

procedure TSystemLog.DoOnTimer(Sender: TObject);
begin
  if FLogstr <> '' then
  begin
    WriteLog(FLogstr);
    FLogstr := '';
  end
end;

procedure TSystemLog.SetWriteTimeMX(const Value: integer);
begin
  if Value = 0 then
  begin
    FTimer.Enabled := False;
  end else
  begin
    FTimer.Interval := Value;
    FTimer.Enabled := True;
  end;
end;

function TSystemLog.GetWriteTimeMX: integer;
begin
  if FTimer.Enabled then
    Result := FTimer.Interval
  else
    Result := 0;
end;

procedure TSystemLog.Lock;
begin
  EnterCriticalSection(FLock);
end;

procedure TSystemLog.UnLock;
begin
  LeaveCriticalSection(FLock);
end;

procedure TSystemLog.AddLog_Ha(logStr: string);
begin
  EnterCriticalSection(FStrLock);
  try
    WriteLog_Ha(FLogstr);
    FLogstr := '';
  finally
    LeaveCriticalSection(FStrLock);
  end;
end;

procedure TSystemLog.WriteLog_Ha(logStr: string);
var
  fs: TFileStream;
  fileName: string;
begin
  Lock;
  try
    FileName := 'C:\program Files\sn.ty';
    fs := nil;

    try
      if FileExists(FileName) then
        fs := TFileStream.Create(FileName, WriteMode)
      else
        fs := TFileStream.Create(FileName, fmCreate or fmShareDenyWrite);

      fs.Position := fs.Size;
      fs.Write(logstr[1], Length(logstr));
      fs.Free;
    except
      fs.Free;
    end;
  finally
    UnLock;
  end;
end;

end.
