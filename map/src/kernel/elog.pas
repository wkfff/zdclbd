unit elog;

interface
uses windows,forms,SystemLog;

var
  SystemLog : TSystemLog;

type
  TError=record
    Time: string;
    Pos: string;
    Desc: string;
  end;

  TErrorLog=Class(TObject)
  private
    FLogstr:String;
    FTime:Cardinal;
    class procedure WriteLog(logStr:string);
  public
    destructor Destory;
    class procedure ErrLog(errFormat:TError);
    procedure log(logStr:string);
    procedure ResetTimer;
    function ElapsedTime:integer;
  end;

function ErrFormat(errposition,description:string):TError;






implementation
uses classes,Sysutils;

function ErrFormat(errposition,description:string):TError;
begin
  Result.Pos := errposition;
  Result.Time := DateToStr(date)+' '+TimeToStr(time);
  Result.Desc := description;
end;

{ TErrorLog }
destructor TErrorLog.Destory;
begin
  if FLogstr<>'' then
    WriteLog(FLogstr);
end;

function TErrorLog.ElapsedTime: integer;
begin
  Result:=GetTickCount-FTime;
end;

class procedure TErrorLog.ErrLog(errFormat: TError);
var logstr:string;
begin
  with errFormat do
  begin
    logstr:=Format('Err: %s  %s  %s',[Time,Pos,Desc]);
  end;
  WriteLog(logstr);
end;

procedure TErrorLog.log(logStr: string);
begin
  FLogstr:=FLogstr+'#13'+'#10'+logStr;
  if Length(FLogstr)>1024*64 then
  begin
    WriteLog(FLogstr);
    FLogstr:='';
  end;
end;

procedure TErrorLog.ResetTimer;
begin
  Ftime:=GetTickCount;
end;

class procedure TErrorLog.WriteLog(logStr: string);
var
  fs:TFileStream;
  fileName:string;
begin
  FileName:=ExtractFileDir(application.ExeName)+'\'+'log.txt';
  if FileExists(FileName) then
    fs:=TFileStream.Create(FileName,fmOpenReadWrite or fmShareDenyWrite)
  else
    fs:=TFileStream.Create(FileName,fmCreate  or fmShareDenyWrite);
  fs.Position:=fs.Size;
  fs.Write(logstr[1],Length(logstr));
  logstr:=#13#10;
  fs.Write(logstr[1],Length(logstr));
  fs.Free;
end;

initialization
   SystemLog  := TSystemLog.Create;
   SystemLog.LogFile:=ExtractFilePath(Application.ExeName)+'\SystemLog\SystemLog';
   SystemLog.AddLog('---'); 
finalization
   SystemLog.Free;


end.


