unit FtpDownLoadFileUnit;

interface

 uses
  Windows, SysUtils, classes, IdFTP, ExtCtrls ,systemLog;

type
 //FTP服务器上的录音 文件信息，
  TRemoteFileInfo = packed record
    FileName:String;         //文件名
    FileDir : String;        //文件FTP路径
    FileDateTime:TDateTime;  //文件名中的时间值
  end;

  //下载声音文件时，进度条+1
  TDownSoundFileProgressEvent = procedure(Sender: TObject) of object;
  
  TFtpDownLoad = class
  private
    FFileNameList:array of TRemoteFileInfo;
    IdFTP1 :TIdFTP;
    FFTPPort: Integer;
    FFTPHost: String;
    FFTPUserpass: string;
    FFTPUserName: string;
    FFTPDir: String;
    FOnDownFileProgress: TDownSoundFileProgressEvent;
    //取出所有文件 ,包括跨天情况
    function GetDevAllFileNameAllDay(simNo:String;startTime:TdateTime): Boolean;
    //取出所有文件
    function GetDevAllFileName(simNo:String;startTime:TdateTime): Boolean;
    //从该车的所有文件名 中，找到时间最接近的 文件
    function GetDevNearestTime(startTime:TdateTime):TRemoteFileInfo;
    procedure SetFTPHost(const Value: String);
    procedure SetFTPPort(const Value: Integer);
    procedure SetFTPUserName(const Value: string);
    procedure SetFTPUserpass(const Value: string);
    procedure SetFTPDir(const Value: String);
    procedure LoadFTPParamsFromIni();
    procedure SetOnDownFileProgress(
      const Value: TDownSoundFileProgressEvent);
    procedure IncDownFileProgress;
  public
    FLog:TSystemLog;
    constructor Create;
    destructor Destroy; override;
    function DownLoadSoundFile(ASimNo:String;AStartTime,ARemoveTime:TDateTime;
      ALocalFile:String): Boolean;
    property FTPHost:String read FFTPHost write SetFTPHost;
    property FTPPort : Integer read FFTPPort write SetFTPPort;
    property FTPUserName :string read FFTPUserName write SetFTPUserName;
    property FTPUserpass :string read FFTPUserpass write SetFTPUserpass;
    property FTPDir:String read FFTPDir write SetFTPDir;
    property OnDownFileProgress:TDownSoundFileProgressEvent read FOnDownFileProgress write SetOnDownFileProgress;
  end;


implementation
uses DateUtils,uGloabVar,IniFiles;

function TFtpDownLoad.DownLoadSoundFile(ASimNo:String;AStartTime,ARemoveTime:TDateTime;
  ALocalFile:String): Boolean;
var
  findFileName:TRemoteFileInfo;
begin
  Result := False;
  try
    IncDownFileProgress;
    LoadFTPParamsFromIni;               
    IdFTP1.Host := FFTPHost;
    IdFTP1.Port := FFTPPort;
    IdFTP1.Username := FFTPUserName;
    IdFTP1.Password := FFTPUserpass;
    IdFTP1.Connect(true,-1);
    IncDownFileProgress;
  except on e:Exception do
    begin
      FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+'连接FTP服务器失败:'+E.Message);
      exit;
    end;
  end;
  try
    if not GetDevAllFileNameAllDay(ASimNo,AStartTime) then //连接FTP服务器失败，没能下载声音文件
    begin
      FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+'Err:没能下载声音文件');
      Exit;
    end;
    IncDownFileProgress;
    if Length(FFileNameList) =0 then  
    begin
      FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+'服务器上没有找到录音文件');
      Exit;
    end
    else
      FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+'共找到'+IntToStr(Length(FFileNameList))+'个录音文件');
    //从该车的所有文件名 中，找到时间上最接近的文件
    findFileName := GetDevNearestTime(AStartTime);
    IncDownFileProgress;
    if findFileName.FileName = '' then
    begin
      FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+'服务器上没有找到相应时间内的录音文件');
      Exit;
    end
    else
    begin
      //IdFTP1.TransferType := (ftBinary);
      //IdFTP1.Size(FileName);
      try
        FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+'开始下载文件-'+findFileName.FileName);
        IdFTP1.ChangeDir(findFileName.FileDir);
        IncDownFileProgress;
        IdFTP1.Get(findFileName.FileName, ALocalFile, true);
        FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+'文件下载成功-'+findFileName.FileName);
        IncDownFileProgress;
      except on E:Exception do
        FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+'文件下载失败'+E.Message);
      end;
    end;
    Result := True;
  finally
    IdFTP1.Disconnect;
  end;
end;

//取出所有文件 ,包括跨天情况
function TFtpDownLoad.GetDevAllFileNameAllDay(simNo:String;startTime:TdateTime): Boolean;
var
  preTime,nextTime:TDateTime;
begin
  result := False;
  preTime := IncMinute(startTime,-5);
  nextTime := IncMinute(startTime,5);
  if DayOf(preTime)<> DayOf(startTime) then
    GetDevAllFileName(simNo,preTime);
  if Dayof(nextTime) <> DayOf(startTime) then
    GetDevAllFileName(simNo,nextTime);
  GetDevAllFileName(simno,startTime);
  Result := True;
end;

//取出所有文件
function TFtpDownLoad.GetDevAllFileName(simNo:String;startTime:TdateTime): Boolean;
var
  i,n: Integer;
  st :TStringList;
  s,fileDir : string;
  dt:TDateTime;
begin
  result := False;

  st := TStringList.Create;
  try
    s := FormatDateTime('yyyy年-mm月-dd日',startTime);
    s := StringReplace(s, '-', '/', [rfReplaceAll]);
    fileDir := FFTPDir+s;// '/D:/ftp/shared/my/testRecord/'+s;
    IdFTP1.ChangeDir(fileDir);
    IdFTP1.List(st,'',false);
    //取出该车的 所有文件名
    for i:= 0 to st.Count -1 do
    begin
      if pos('0_'+simNo+'.mp3',st.Strings[i]) >0 then
      begin
        s:= st.Strings[i];
        s := copy(s,1,15);
        try
          dt := EncodeDateTime(StrToInt(copy(s,1,4)),StrToInt(copy(s,5,2)),StrToInt(copy(s,7,2)),
            StrToInt(copy(s,10,2)),StrToInt(copy(s,12,2)),StrToInt(copy(s,14,2)),0);
        except
          FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+'err: 获取文件名中的时间错误-'+st.Strings[i]);
          Continue;
        end;
        n := Length(FFileNameList);
        SetLength(FFileNameList,n+1);
        FFileNameList[n].FileName := st.Strings[i];
        FFileNameList[n].FileDir := fileDir;
        FFileNameList[n].FileDateTime := dt;
      end;
    end;
    Result := True;
  except on E:Exception do
    FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+'err: 取出时间['+
      FormatDatetime('yyyy-mm-dd hh:nn:ss',startTime)+']的文件名时错误:'+E.Message);
  end;
end;

//从该车的所有文件名 中，找到时间最接近的 文件
function TFtpDownLoad.GetDevNearestTime(startTime:TdateTime):TRemoteFileInfo;
var
  i,j,k: integer;
  s:String;
  tt,tk:integer;
  fileArry:array of TRemoteFileInfo; //存5分钟内的，取最近的文件名用
begin
  Result.FileName := '';
  j:= 0;
  for i:= 0 to Length(FFileNameList) -1 do
  begin
    if MinutesBetween(FFileNameList[i].FileDateTime,startTime)<5 then    //找出5分钟内的
    begin
      j:= j+1;
      SetLength(fileArry,j);
      fileArry[j-1] := FFileNameList[i];
    end;
  end;
    
  if Length(fileArry) = 1 then
    Result := fileArry[0]
  else if Length(fileArry) >1 then //如果5分钟内的，有不止一个，则找时间上最接近的
  begin
    tt := SecondsBetween(fileArry[0].FileDateTime,startTime);
    k  := 0;
    for i:= 1 to length(fileArry) -1 do         
    begin
      tk := SecondsBetween(fileArry[i].FileDateTime,startTime);
      if  tk < tt then
      begin
        tt:= tk;
        k:= i;
      end;
    end;
    Result:= fileArry[k];
  end;
end;

constructor TFtpDownLoad.Create;
begin
  IdFTP1 := TIdFTP.Create(nil);
end;

destructor TFtpDownLoad.Destroy;
begin
  IdFTP1.Free;
  inherited;
end;

procedure TFtpDownLoad.SetFTPHost(const Value: String);
begin
  FFTPHost := Value;
end;

procedure TFtpDownLoad.SetFTPPort(const Value: Integer);
begin
  FFTPPort := Value;
end;

procedure TFtpDownLoad.SetFTPUserName(const Value: string);
begin
  FFTPUserName := Value;
end;

procedure TFtpDownLoad.SetFTPUserpass(const Value: string);
begin
  FFTPUserpass := Value;
end;

procedure TFtpDownLoad.SetFTPDir(const Value: String);
begin
  FFTPDir := Value;
end;

procedure TFtpDownLoad.LoadFTPParamsFromIni;
var
  inifile:TInifile;
begin
  inifile := TInifile.Create(ExePath+'Config.ini');
  try
    try
      FFTPHost := iniFIle.ReadString('FTP','Host','');
      FFTPPort := inifile.ReadInteger('FTP','Port',21);
      FFTPUserName := inifile.ReadString('FTP','UserName','');
      FFTPUserpass := inifile.ReadString('FTP','UserPass','');
      FFTPDir := inifile.ReadString('FTP','FTPdir','\');
    except
      FFTPHost := '';
      FFTPPort := 21;
      FFTPUserpass := '';
      FFTPUserName := '';
      FFTPDir := '';
    end;
  finally
    inifile.Free;
  end;
end;

procedure TFtpDownLoad.SetOnDownFileProgress(
  const Value: TDownSoundFileProgressEvent);
begin
  FOnDownFileProgress := Value;
end;

procedure TFtpDownLoad.IncDownFileProgress();
begin
  if Assigned(FOnDownFileProgress) then
    FOnDownFileProgress(nil);
end;

end.
