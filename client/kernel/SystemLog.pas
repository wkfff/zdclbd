{������Ϣ��,
�ṩ��������Ϣд��log�ļ��ķ���.
�޸ļ�¼:<br>
<li>2003-9-5 ������ WriteTimeMX���ԣ��ṩ����ָ��ʱ����������־����û���̵Ļ��ʹ��̡�
@author
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
  TLogFormat=record
    DateTime:string;
    Position:string;
    Description:string;
  end;

  {������Ϣ��,
  �ṩ��������Ϣд��log�ļ��ķ���.
  ���Ծ�̬�ĵ��û��߶�̬�ĵ���.}
  TSystemLog=Class(TObject)
  private
    FLogstr:String;
    FTime:Cardinal;

    FTimer:TTimer;
    FLogFile: string;
    FWriteImmediate: Boolean;
    FBufferSize: Integer;
    FWriteMode: Word;
    FLock: TRTLCriticalSection;
    FExtendName: string;
    FBeginString: string;

    procedure WriteLog(logStr:string);
    procedure SetLogFile(const Value: string);
    procedure SetWriteImmediate(const Value: Boolean);
    procedure SetBufferSize(const Value: Integer);
    procedure SetWriteMode(const Value: Word);

    procedure DoOnTimer(Sender: TObject);//{��Ӧʱ��ʱ�䣬�������־����û����Ļ��ʹ���}
    procedure SetWriteTimeMX(const Value: integer);
    function  GetWriteTimeMX: integer;
    procedure Lock;
    procedure UnLock;
  public
    constructor Create;virtual;
    destructor  Destroy;override;

   
    procedure AddLog(logStr:string);overload;               // {��������־�ӵ��������У����ﵽ64Kʱ��д���ļ�}
    procedure AddLog(LogFormat:TLogFormat);overload;
    procedure AddLog(Position,Description:string);overload; // {�Զ�д��ʱ��,��������,���ݵ���־}

    procedure ResetTimer;
    function  ElapsedTime:integer;

    property  LogFile        :string       read FLogFile         write SetLogFile;       //Ŀ¼���ļ�ͷ
    property  BufferSize     :Integer      read FBufferSize      write SetBufferSize;    //{д�뻺���С}
    property  WriteMode      :Word         read FWriteMode       write SetWriteMode;     //{д��ģʽ}
    property  WriteImmediate :Boolean      read FWriteImmediate  write SetWriteImmediate;//{�Ƿ�����д��}
    property  WriteTimeMX    :integer      read GetWriteTimeMX   write SetWriteTimeMX;   //{������־�����ʱ����ʱ(����)} =���ʾ����ʱ����
    property  ExtendName     :string       read FExtendName      write FExtendName;
    property  BeginString    :string       read FBeginString     write FBeginString;
  end;

function LogFormat(errposition,description:string):TLogFormat;
function WriteLog(FileName:String;Log:string):boolean;
function  CreateDirs(DirStr:string):boolean;
implementation
uses
  Classes,
  Sysutils;

function LogFormat(errposition,description:string):TLogFormat;
begin
  Result.Position:=errposition;
  Result.DateTime:=FormatDatetime('yyyy-mm-dd hh:nn:ss',now);
  Result.Description:=description;
end;

{ TGeoLog }
destructor TSystemLog.Destroy;
begin
  FTimer.Enabled:=False;
  if FLogstr<>'' then
  begin
    WriteLog(FLogstr);
    WriteLog(#13#10);
  end;
//  WriteLog('-------------------------------------'+#13#10);
  FTimer.Free;
  DeleteCriticalSection(FLock);  
  inherited
end;

function TSystemLog.ElapsedTime: integer;
begin
  Result:=GetTickCount-FTime;
end;

procedure TSystemLog.AddLog(LogFormat: TLogFormat);
var logstr:string;
begin
  with LogFormat do
  begin
    logstr:=Format('%s  %s  %s',[DateTime,Position,Description]);
  end;
  AddLog(logstr);
end;

procedure TSystemLog.Addlog(Position,Description:string);
begin
   AddLog(FormatDatetime('yyyy-mm-dd hh:nn:ss',now)+' '+Position+' '+Description);
end;

procedure TSystemLog.Addlog(logStr: string);
begin
  FLogstr:=FLogstr+logStr+#13+#10;
  if (Length(FLogstr)>BufferSize) or WriteImmediate then
  begin
    WriteLog(FLogstr);
    FLogstr:='';
  end;
end;

procedure TSystemLog.ResetTimer;
begin
  Ftime:=GetTickCount;
end;

procedure TSystemLog.WriteLog(logStr: string);
var
  fs:TFileStream;
  fileName:string;
  Dir:string;
begin
  Lock;
  try
    FileName:=FLogFile+FormatDatetime('YYYYMMDD',date)+'.'+FExtendName;
    fs:=nil;
    try
      if FileExists(FileName) then
        fs:=TFileStream.Create(FileName,WriteMode )
      else
        begin
           Dir:=ExtractFileDir(FileName);
           if not DirectoryExists(Dir) then
             if not CreateDir(Dir) then
                   CreateDirs(Dir);

           fs:=TFileStream.Create(FileName,fmCreate  or fmShareDenyWrite);
           if FBeginString<>'' then
              logstr:=FBeginString+#13+#10+logstr;
        end;

      fs.Position:=fs.Size;
      fs.Write(logstr[1],Length(logstr));
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
{procedure TSystemLog.AddLog(Position, Description: string);
begin
  addlog(LogFormat(Position,Description));
end; }

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
  FBufferSize :=16*1024;       //Ĭ����16K����
  FWriteMode := fmOpenReadWrite or fmShareDenyWrite;
  FTimer:=TTimer.Create(nil);
  FTimer.OnTimer:=DoOnTimer;
  FTimer.Interval:=10*1000; //Ĭ��ʮ���ӱ���һ������
  FTimer.Enabled:=True;
  FExtendName:='txt';  //Ĭ�ϵ��ļ���ʽΪtxt
end;

procedure TSystemLog.DoOnTimer(Sender: TObject);
begin
  if FLogstr<>'' then
  begin
    WriteLog(FLogstr);
    FLogstr:='';
  end
end;

procedure TSystemLog.SetWriteTimeMX(const Value: integer);
begin
  if Value=0 then
  begin
    FTimer.Enabled:=False;
  end else
  begin
    FTimer.Interval:=Value;
    FTimer.Enabled:=True;
  end;
end;

function TSystemLog.GetWriteTimeMX: integer;
begin
  if FTimer.Enabled then
    Result:=FTimer.Interval
  else
    Result:=0;
end;

procedure TSystemLog.Lock;
begin
  EnterCriticalSection(FLock);
end;

procedure TSystemLog.UnLock;
begin
  LeaveCriticalSection(FLock);
end;

function CreateDirs(DirStr: string):boolean;
var
 i,p,len:integer;
 tempDirs:TStrings;
 s:string;
begin
  Result:=false;
  if not DirectoryExists(DirStr) then
  begin
    s:=DirStr;
    tempDirs:=TStringList.Create;
    tempDirs.Clear;
    try
       p:=0;
       Len:=Length(DirStr);
       i:=Pos('\',s);
       while i>0  do
       begin
         tempDirs.Append(copy(DirStr,1,i+P));
         p:=p+i;
         s:=Copy(DirStr,p+1,Len-p);
       end;
       if p<Len then tempDirs.Append(DirStr);
       for i:=0 to tempDirs.Count-1 do
       begin
          if not DirectoryExists(tempDirs.Strings[i]) then
              if not CreateDir(tempDirs.Strings[i]) then
                 raise Exception.Create('Cannot create '+tempDirs.Strings[i]+'. ');
       end;
    finally
      tempDirs.Free;
    end;
  end;
  Result:=true;
end;



function WriteLog(FileName:String;Log:string):boolean;
var
  fs:TFileStream;
  Dir:string;
begin
  Result := False;
  fs:=nil;

  if FileExists(FileName) then
    fs:=TFileStream.Create(FileName,fmOpenReadWrite or fmShareDenyWrite)
  else
  begin
       Dir:=ExtractFileDir(FileName);
       if not DirectoryExists(Dir) then
         if not CreateDir(Dir) then
              if not CreateDirs(Dir) then exit;
       fs:=TFileStream.Create(FileName,fmCreate  or fmShareDenyWrite);
  end;
  try
    fs.Position:=fs.Size;
    fs.Write(Log[1],Length(Log));
    fs.Free;
  except
    fs.Free;
  end;
  Result := True;
end;

end.
