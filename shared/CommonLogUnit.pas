unit CommonLogUnit;

interface
uses
  Windows,ExtCtrls;

type

  TOnAddlog=procedure (Sender:TObject;ALogMsg:string) of object;
  {日志类，提供写日志的功能，可以配置简单的写入策略：缓冲区大小，立即写模式，定时保存 }
  TCommonLog=class
  private
    FWriteImmediate: Boolean;
    FBufferSize: Integer;
    FLogFile: string;
    FLogPattern: String;
    FWriteMode: Word;
    FLogstr:string;

    FTimer:TTimer;
    FLock: TRTLCriticalSection;
    FLockBuffer:TRTLCriticalSection;
    FSaveInterVal: integer;
    FMaxFileSize: integer;
    FOnAddLogNotify: TOnAddlog;
    procedure SetBufferSize(const Value: Integer);
    procedure SetLogFile(const Value: string);
    procedure SetLogPattern(const Value: String);
    procedure SetWriteImmediate(const Value: Boolean);
    procedure SetWriteMode(const Value: Word);
    procedure WriteLog(logStr: string); virtual;
    procedure DoOnTimer(Sender:TObject);

    function GetFileSize(AFileName:string):Longint;
    procedure Lock;
    procedure UnLock;
    procedure LockBuffer;
    procedure UnLockBuffer;
    procedure SetSaveInterVal(const Value: integer);
    procedure SetMaxFileSize(const Value: integer);
    procedure SetOnAddLogNotify(const Value: TOnAddlog);
  public
    constructor Create;virtual;
    destructor Destroy;override;
    procedure AddLog(logStr:string); virtual;

    {日志记录格式,接口保留，占不支持
    内部统一日志格式为   [级别] 时间 日志字符串}
    property LogPattern:String read FLogPattern write SetLogPattern;
    {日志文件名}
    property LogFile:string read FLogFile write SetLogFile;
    {写入缓冲大小}
    property BufferSize:Integer read FBufferSize write SetBufferSize;
    {写入模式}
    property WriteMode:Word read FWriteMode write SetWriteMode;
    {是否立刻写入}
    property WriteImmediate:Boolean read FWriteImmediate write SetWriteImmediate;
    {保存的间隔时间 ms}
    property SaveInterVal:integer read FSaveInterVal write SetSaveInterVal;
    {日志文件最大尺寸,byte,<=0表示不限制文件大小}
    property MaxFileSize:integer read FMaxFileSize write SetMaxFileSize;
    {写日志通知事件}
    property OnAddLogNotify:TOnAddlog read FOnAddLogNotify write SetOnAddLogNotify;
  end;


  {按天回滚的日志}
  TDayRollLog=class(TCommonLog)
  private
    FCurrentPostfix:string;
    FFilePrefix: string;
    FLogDir: string;
    FExtName: string;
    function GetDatePostfix:string;
    procedure SetFilePrefix(const Value: string);
    procedure SetLogDir(const Value: string);
    procedure SetExtName(const Value: string);

  protected
    property MaxFileSize;
  public
    procedure AddLog(logStr: string); override;
    property LogDir:string read FLogDir write SetLogDir;
    property FilePrefix:string read FFilePrefix write SetFilePrefix;
    property ExtName:string read FExtName write SetExtName;
  end;


  

implementation
uses
  Classes,
  Sysutils;
{ TCommonLog }

procedure TCommonLog.AddLog(logStr: string);
var
  tempBuffer:string;
begin
  LockBuffer;
  try
    logStr:=FormatDateTime('yyyy-mm-dd hh:mm:ss ',now)+ logStr;
    if Assigned(FOnAddLogNotify) then
      FOnAddLogNotify(self,logStr);

    FLogstr:=FLogstr+logStr+#13+#10;

    if (Length(FLogstr)>BufferSize) or WriteImmediate then
    begin
      tempBuffer:=FLogstr;
      FLogstr:='';
    end;
  finally
    UnLockBuffer;
  end;

  if (Length(tempBuffer)>0) then
    WriteLog(FLogstr);
end;

procedure TCommonLog.WriteLog(logStr: string);
var
  fs:TFileStream;
  fileName:string;
  fileDir:string;
begin
  Lock;
  try
    if (FLogFile='') then Exit;
    fs:=nil;
    FileName:=FLogFile;
    fileDir:=ExtractFileDir(FileName);
    if (not DirectoryExists(fileDir)) and (fileDir<>'') then
      ForceDirectories(fileDir);

    //文件尺寸过大就分文件记录
    if (FMaxFileSize>0) and (GetFileSize(FileName)>FMaxFileSize) then
    begin
      RenameFile(FileName,FileName+'.'+FormatDateTime('yyyymmdd',now));
    end;

    if FileExists(FileName) then
      try
        fs:=TFileStream.Create(FileName,WriteMode );
      except
      end
    else
      try
        fs:=TFileStream.Create(FileName,fmCreate  or fmShareDenyWrite);
      except
      end;

    if fs=nil then Exit;
    fs.Position:=fs.Size;
    fs.Write(logstr[1],Length(logstr));
    fs.Free;
  finally
    UnLock;
  end;
end;

constructor TCommonLog.Create;
begin
  InitializeCriticalSection(FLock);
  InitializeCriticalSection(FLockBuffer);
  FTimer:=TTimer.Create(nil);
  FTimer.Interval:=10*1000;
  FTimer.OnTimer:=DoOnTimer;
  FTimer.Enabled:=True;

  FMaxFileSize:=0;
  FBufferSize :=16*1024;
  FWriteMode := fmOpenReadWrite or fmShareDenyWrite;
  FLogstr:='';
end;

destructor TCommonLog.Destroy;
begin
  FTimer.Enabled:=false;
  if FLogstr<>'' then
  begin
    WriteLog(FLogstr+#13#10);
  end;

  FTimer.Free;
  DeleteCriticalSection(FLock);
  DeleteCriticalSection(FLockBuffer);
  inherited;
end;

procedure TCommonLog.SetBufferSize(const Value: Integer);
begin
  FBufferSize := Value;
end;

procedure TCommonLog.SetLogFile(const Value: string);
begin
  FLogFile := Value;
end;

procedure TCommonLog.SetLogPattern(const Value: String);
begin
  FLogPattern := Value;
end;

procedure TCommonLog.SetWriteImmediate(const Value: Boolean);
begin
  FWriteImmediate := Value;
end;

procedure TCommonLog.SetWriteMode(const Value: Word);
begin
  FWriteMode := Value;
end;

procedure TCommonLog.DoOnTimer(Sender: TObject);
var
  tempBuffer:string;
begin
  Lock;
  try
    if (Length(FLogstr)>0) then
    begin
      tempBuffer:=FLogstr;
      FLogstr:='';
    end;
  finally
    UnLock;
  end;

  if (Length(tempBuffer)>0) then
    WriteLog(tempBuffer);
end;

procedure TCommonLog.Lock;
begin
  EnterCriticalSection(FLock);
end;

procedure TCommonLog.UnLock;
begin
  LeaveCriticalSection(FLock);
end;

procedure TCommonLog.LockBuffer;
begin
  EnterCriticalSection(FLockBuffer);
end;

procedure TCommonLog.UnLockBuffer;
begin
  LeaveCriticalSection(FLockBuffer);
end;

procedure TCommonLog.SetSaveInterVal(const Value: integer);
begin
  FSaveInterVal := Value;
  FTimer.Interval:=Value;
end;

procedure TCommonLog.SetMaxFileSize(const Value: integer);
begin
  FMaxFileSize := Value;
end;

function TCommonLog.GetFileSize(AFileName: string): Longint;
var
   f: file of Byte;
begin
  {$I-}
  AssignFile(f, AFileName);
  Reset(f);
  try
    Result := FileSize(f);
  finally
    CloseFile(f);
  end;
  {$I+}
end;

procedure TCommonLog.SetOnAddLogNotify(const Value: TOnAddlog);
begin
  FOnAddLogNotify := Value;
end;

{ TDayRollLog }

function TDayRollLog.GetDatePostfix: string;
begin
  Result:=FormatDateTime('yyyymmdd',now);
end;

procedure TDayRollLog.SetFilePrefix(const Value: string);
begin
  FFilePrefix := Value;
end;

procedure TDayRollLog.SetLogDir(const Value: string);
var
  len:integer;
begin
  FLogDir := Value;
  len:=Length(FLogDir);
  if (len>0) and ((FLogDir[len]<>'\') or (FLogDir[len]<>'/')) then
  begin
    FLogDir:=FLogDir+'\';
  end;
end;

procedure TDayRollLog.AddLog(logStr: string);
begin
  if LogDir='' then
  begin
    if Assigned(OnAddLogNotify) then
    begin
      OnAddLogNotify(self,'未指定日志目录！');
      OnAddLogNotify(self,logStr);
    end;
    Exit;
  end;
  if not DirectoryExists(LogDir) then CreateDir(LogDir);

  if GetDatePostfix<>FCurrentPostfix then
  begin
    WriteLog('');
    FCurrentPostfix:=GetDatePostfix;
    LogFile:=LogDir + FilePrefix+FCurrentPostfix+ExtName;
  end;
  inherited;
end;

procedure TDayRollLog.SetExtName(const Value: string);
begin
  FExtName := Value;
end;

end.
