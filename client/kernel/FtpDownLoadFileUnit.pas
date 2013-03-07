unit FtpDownLoadFileUnit;

interface

 uses
  Windows, SysUtils, classes, IdFTP, ExtCtrls ,systemLog;

type
 //FTP�������ϵ�¼�� �ļ���Ϣ��
  TRemoteFileInfo = packed record
    FileName:String;         //�ļ���
    FileDir : String;        //�ļ�FTP·��
    FileDateTime:TDateTime;  //�ļ����е�ʱ��ֵ
  end;

  //���������ļ�ʱ��������+1
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
    //ȡ�������ļ� ,�����������
    function GetDevAllFileNameAllDay(simNo:String;startTime:TdateTime): Boolean;
    //ȡ�������ļ�
    function GetDevAllFileName(simNo:String;startTime:TdateTime): Boolean;
    //�Ӹó��������ļ��� �У��ҵ�ʱ����ӽ��� �ļ�
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
      FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+'����FTP������ʧ��:'+E.Message);
      exit;
    end;
  end;
  try
    if not GetDevAllFileNameAllDay(ASimNo,AStartTime) then //����FTP������ʧ�ܣ�û�����������ļ�
    begin
      FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+'Err:û�����������ļ�');
      Exit;
    end;
    IncDownFileProgress;
    if Length(FFileNameList) =0 then  
    begin
      FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+'��������û���ҵ�¼���ļ�');
      Exit;
    end
    else
      FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+'���ҵ�'+IntToStr(Length(FFileNameList))+'��¼���ļ�');
    //�Ӹó��������ļ��� �У��ҵ�ʱ������ӽ����ļ�
    findFileName := GetDevNearestTime(AStartTime);
    IncDownFileProgress;
    if findFileName.FileName = '' then
    begin
      FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+'��������û���ҵ���Ӧʱ���ڵ�¼���ļ�');
      Exit;
    end
    else
    begin
      //IdFTP1.TransferType := (ftBinary);
      //IdFTP1.Size(FileName);
      try
        FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+'��ʼ�����ļ�-'+findFileName.FileName);
        IdFTP1.ChangeDir(findFileName.FileDir);
        IncDownFileProgress;
        IdFTP1.Get(findFileName.FileName, ALocalFile, true);
        FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+'�ļ����سɹ�-'+findFileName.FileName);
        IncDownFileProgress;
      except on E:Exception do
        FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+'�ļ�����ʧ��'+E.Message);
      end;
    end;
    Result := True;
  finally
    IdFTP1.Disconnect;
  end;
end;

//ȡ�������ļ� ,�����������
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

//ȡ�������ļ�
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
    s := FormatDateTime('yyyy��-mm��-dd��',startTime);
    s := StringReplace(s, '-', '/', [rfReplaceAll]);
    fileDir := FFTPDir+s;// '/D:/ftp/shared/my/testRecord/'+s;
    IdFTP1.ChangeDir(fileDir);
    IdFTP1.List(st,'',false);
    //ȡ���ó��� �����ļ���
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
          FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+'err: ��ȡ�ļ����е�ʱ�����-'+st.Strings[i]);
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
    FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+'err: ȡ��ʱ��['+
      FormatDatetime('yyyy-mm-dd hh:nn:ss',startTime)+']���ļ���ʱ����:'+E.Message);
  end;
end;

//�Ӹó��������ļ��� �У��ҵ�ʱ����ӽ��� �ļ�
function TFtpDownLoad.GetDevNearestTime(startTime:TdateTime):TRemoteFileInfo;
var
  i,j,k: integer;
  s:String;
  tt,tk:integer;
  fileArry:array of TRemoteFileInfo; //��5�����ڵģ�ȡ������ļ�����
begin
  Result.FileName := '';
  j:= 0;
  for i:= 0 to Length(FFileNameList) -1 do
  begin
    if MinutesBetween(FFileNameList[i].FileDateTime,startTime)<5 then    //�ҳ�5�����ڵ�
    begin
      j:= j+1;
      SetLength(fileArry,j);
      fileArry[j-1] := FFileNameList[i];
    end;
  end;
    
  if Length(fileArry) = 1 then
    Result := fileArry[0]
  else if Length(fileArry) >1 then //���5�����ڵģ��в�ֹһ��������ʱ������ӽ���
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
