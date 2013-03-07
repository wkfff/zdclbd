unit SeeEmergncyAlarmDetailFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  MPlayer, StdCtrls, ComCtrls, cxInplaceContainer, cxControls, Buttons,CarUnit,
  DBClient, ActnList, SystemLog, RzTrkBar;

type    
  TSeeEmergncyAlarmDetailFrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxPicList: TcxTreeList;
    cxCol_CarNo: TcxTreeListColumn;
    cxCol_PicTime: TcxTreeListColumn;
    cxCol_PicReason: TcxTreeListColumn;
    cxCol_PicPosition: TcxTreeListColumn;
    cxCol_PicFileName: TcxTreeListColumn;
    PanelPic: TPanel;
    Image1: TImage;
    PanelRecordInfo: TPanel;
    CheckBoxShowPicTimerPlay: TCheckBox;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    EditCarNo: TEdit;
    PanelLoadPic: TPanel;
    Label2: TLabel;
    ProgressBarLoadPic: TProgressBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ActionList1: TActionList;
    Action_ShowStartAddr: TAction;
    Action_ShowRemoveAddr: TAction;
    Pic_Previous: TAction;
    Pic_Next: TAction;
    SpeedButton2: TSpeedButton;
    TimerMedia: TTimer;
    TimerPicPlay: TTimer;
    EditPicShowInterval: TEdit;
    Label3: TLabel;
    GroupBoxRecordInfo: TGroupBox;
    Label22: TLabel;
    EditRecordFile: TEdit;
    MediaPlayer1: TMediaPlayer;
    ProgressBarPlaySound: TProgressBar;
    BitBtnDownFtpRecordFile: TBitBtn;
    GroupBoxDownFtpRecordFile: TGroupBox;
    ProgressBarDownFtpRecordFile: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure TimerMediaTimer(Sender: TObject);
    procedure MediaPlayer1Click(Sender: TObject; Button: TMPBtnType;
      var DoDefault: Boolean);
    procedure Pic_PreviousExecute(Sender: TObject);
    procedure cxPicListClick(Sender: TObject);
    procedure Pic_NextExecute(Sender: TObject);
    procedure EditPicShowIntervalChange(Sender: TObject);
    procedure EditPicShowIntervalKeyPress(Sender: TObject; var Key: Char);
    procedure TimerPicPlayTimer(Sender: TObject);
    procedure CheckBoxShowPicTimerPlayClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure Action_ShowStartAddrExecute(Sender: TObject);
    procedure Action_ShowRemoveAddrExecute(Sender: TObject);
    procedure RzTrackBarPlaySoundChange(Sender: TObject);
    procedure RzTrackBarPlaySoundMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure BitBtnDownFtpRecordFileClick(Sender: TObject);
  private
    { Private declarations }
    FDev: TDevice;
    FPicCount:Integer;
    //FTP���������ļ�����־
    FFtpLog : TSystemLog;
    FStartLongi,FStartLati:Double;
    FRemoveLongi,FRemoveLati:Double;
    FStartTime,FRemoveTime:TDateTime;
    FLocalRecordFile:String;  //����¼���ļ���
    function ShowPicture(AFileName: string): boolean;
    //���� ��Ƭ
    procedure LoadAllPic_EmergncyAlarm(AStartTime,ARemoveTime:String);
    //���� ¼��
    procedure LoadSoundInfo(ADev: TDevice;AStartTime, ARemoveTime:TDateTime);
    //�õ�����¼���ļ���
    procedure GetLocalSoundFileName();
    function GetTimeStr(Seconds: Integer): String;
    procedure PlaySoundInfo;
    procedure DoOnIncDownFileProgress(Sender: TObject);
  public
    { Public declarations }
    //���� ��������ʱ��ϸ�������Ƭ��¼��
    procedure LoadDetailInfo(ADev:TDevice;AStartTime,ARemoveTime:String;
      AStartLongi,AStartLati,ARemoveLongi,ARemoveLati:Double);
  end;

var
  SeeEmergncyAlarmDetailFrm: TSeeEmergncyAlarmDetailFrm;

implementation
uses uGloabVar,ConstDefineUnit,FtpDownLoadFileUnit,uMainf;
{$R *.dfm}

{ TSeeEmergncyAlarmDetailFrm }
procedure TSeeEmergncyAlarmDetailFrm.FormCreate(Sender: TObject);
begin
  PanelLoadPic.Visible := False;
  EditPicShowInterval.Text := '2';
  CheckBoxShowPicTimerPlay.Checked := False;

  TimerPicPlay.Enabled := False;
  TimerMedia.Enabled := False;
  GroupBoxRecordInfo.Visible := False;
  PanelRecordInfo.Caption := '';
  EditRecordFile.Text := '';
  
  if FFtpLog = nil then
  begin
    FFtpLog := TSystemLog.Create;
    FFtpLog.LogFile := ExtractFilePath(Application.ExeName)+ 'FTPLog\';
    FFtpLog.WriteImmediate := True;
  end;
end;

procedure TSeeEmergncyAlarmDetailFrm.LoadDetailInfo(ADev: TDevice;
  AStartTime, ARemoveTime: String; AStartLongi, AStartLati, ARemoveLongi,
  ARemoveLati: Double);
begin   
  FDev := ADev;
  EditCarNo.Text := FDev.Car.No;
  cxPicList.Clear;
  FPicCount := 0;
  FLocalRecordFile := '';
  FStartLongi := AStartLongi;
  FStartLati := AStartLati;
  FRemoveLongi := ARemoveLongi;
  FRemoveLati := ARemoveLati;
  try
    FStartTime := StrToDateTime(AStartTime);
    FRemoveTime := StrToDateTime(ARemoveTime);
  except
  end;
  LoadAllPic_EmergncyAlarm(AStartTime, ARemoveTime);
  //
  GetLocalSoundFileName();
  GroupBoxRecordInfo.Visible := False;
  GroupBoxDownFtpRecordFile.Visible := False;
  if FileExists(FLocalRecordFile) then
  begin
    GroupBoxRecordInfo.Visible := True;
    PlaySoundInfo;
  end
  else
    GroupBoxDownFtpRecordFile.Visible := True;
end;

procedure TSeeEmergncyAlarmDetailFrm.LoadAllPic_EmergncyAlarm(
  AStartTime, ARemoveTime: String);
var
  i,j,jj:integer;
  temp:TClientDataSet;
  node:TcxTreeListNode;
  fileName:string;
  picIndex:integer;
  picTime:TDatetime;
  picPosition :string;
  b,e:TDateTime;
begin
  ProgressBarLoadPic.Position := 10;
  PanelLoadPic.Visible := True;
  Application.ProcessMessages; 
  try
    bs.ConnectServer;
    Application.ProcessMessages;  
    try
      b := StrToDateTime(AStartTime);
      e := StrToDateTime(ARemoveTime);
    except
      exit;
    end;
    FPicCount:= 0;
    temp := bs.QueryPhotosByDevID(FDev.id, b, e);
    try
        if temp=nil then exit;
        if temp.RecordCount<=0 then exit;
    finally
        ProgressBarLoadPic.Position:=0;
    end;
    FPicCount := temp.RecordCount;
    ProgressBarLoadPic.Max:=temp.RecordCount*10+10;
    temp.First;
    cxPicList.Clear;
    for i:=0 to temp.RecordCount-1 do
    begin
      picIndex:=temp.Fields.FieldByName('picIndex').AsInteger;
      picTime:=temp.Fields.FieldByName('GpsTime').AsDateTime;//takeBeginTime
      j:=temp.Fields.FieldByName('PhotoReasonID').AsInteger;
      jj:=temp.Fields.FieldByName('CameraNo').AsInteger;
      case jj of
          0: picPosition:='ǰ��';
          1: picPosition:='����';
          2: picPosition:='˾���Ϸ�';
      else
          picPosition:='';
      end;

      filename:=ExePath+'Photo\'+FDev.Car.No;
      fileName:=fileName+'\'+FDev.Car.No+'_'+FormatDatetime('yymmddhhnnss',picTime);
      fileName:=fileName+'_'+IntToHex(j,1);
      fileName:=fileName+'_'+IntToHex(jj,1);  //
      fileName:=fileName+'_'+IntToStr(PicIndex)+'.jpg';
      if not FileExists(fileName) then
         fileName := bs.QueryPhotoByDevAndPicIndex(FDev,picIndex);
      node:=cxPicList.Add;
      node.Values[0]:= picIndex;
      node.Values[1]:= picTime;
      node.Values[2]:= ReturnUploadPicReason(j);//����ԭ��
      node.Values[3]:= picPosition;                       
      node.Values[4]:= fileName;
      ProgressBarLoadPic.StepIt;
      temp.Next;
    end;
    //ShowPicture(fileName);
  finally
    ProgressBarLoadPic.Position:=0;
    PanelLoadPic.Visible := False;
    if FPicCount =0 then
    begin
      Pic_Previous.Enabled := False;
      Pic_Next.Enabled := False;
      CheckBoxShowPicTimerPlay.Enabled := False;
      TimerPicPlay.Enabled := False;
    end
    else
    begin
      cxPicList.FocusedNode := cxPicList.Items[0];
      cxPicListClick(nil);
    end;
  end;
end;

function TSeeEmergncyAlarmDetailFrm.ShowPicture(AFileName: string): boolean;
var
  filename:string;
  i,tmp:integer;
  s:string;
  cph,picTime,picPosition,picReson:string;
begin
  Result:=false;
  if (AFileName='') or (not FileExists(AFileName)) then
  begin
    Image1.Picture.Bitmap.FreeImage;
    PanelPic.Caption:='����Ƭ';
    self.Caption:= '����Ƭ';
    exit;
  end;
  filename := ExtractFileName(AFileName);
  try
    PanelPic.Caption:='';
    Image1.Picture.LoadFromFile(AFileName);//����ͼƬ�ļ�
  except
    Image1.Picture.Bitmap.FreeImage;
    PanelPic.Caption:='��Ƭ����';
  end;
  Result:= true;
  i:=pos('_',filename);
  cph :=ExtractFileName(copy(filename,1,i-1));//���ƺ�
  filename:=copy(filename,i+1,Length(filename)-i);
  i:=pos('_',filename);
  s:=copy(filename,1,i-1);//����ʱ��
  picTime := copy(s,1,2)+'-'+copy(s,3,2)+'-'+copy(s,5,2)+' '+copy(s,7,2)+':'+copy(s,9,2)+':'+copy(s,11,2);
  filename:=copy(filename,i+1,Length(filename)-i);
  i:=pos('_',filename);
  try
    tmp:=StrToInt(copy(filename,1,i-1)); //����ԭ��
  except
    tmp:=$ff;
  end;
  picReson:= ReturnUploadPicReason(tmp);
  filename:=copy(filename,i+1,Length(filename)-i);
  i:=pos('_',filename);
  try
    tmp:=StrToInt(copy(filename,1,i-1));//����λ��
  except
  end;
  case tmp of
      0:s:='ǰ��';
      1:s:='����';
      2:s:='˾���Ϸ�';
  else
      s:='';
  end;
  picPosition := s;
 // self.Caption := picReson +'��'+ cph+'��'+picPosition+'��'+picTime;
end;

procedure TSeeEmergncyAlarmDetailFrm.GetLocalSoundFileName;
begin
  FLocalRecordFile := FDev.Car.No+'_'+FormatDateTime('yyyymmddhhnnss',FStartTime)+'.mp3';
  FLocalRecordFile := ExtractFilePath(Application.ExeName)+'RecordFile\'+ FLocalRecordFile;
end;

procedure TSeeEmergncyAlarmDetailFrm.LoadSoundInfo(ADev: TDevice;AStartTime, ARemoveTime:TDateTime);
var
  ftp:TFtpDownLoad;
begin      
  GroupBoxRecordInfo.Visible := False;
  PanelRecordInfo.Caption := '�Բ���δ�ҵ�¼���ļ�';

  if not FileExists(FLocalRecordFile) then
  begin
    if not DirectoryExists(ExtractFilePath(Application.ExeName)+'RecordFile') then
    begin
      CreateDir(ExtractFilePath(Application.ExeName)+'RecordFile');
    end;
    FFtpLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+'׼�����������ļ�: ['+
      ADev.Car.no+'],['+FormatDateTime('yyyy-mm-dd hh:nn:ss',AStartTime)+']-['+
      FormatDateTime('yyyy-mm-dd hh:nn:ss',ARemoveTime)+']');

    Application.ProcessMessages;
    ProgressBarDownFtpRecordFile.StepIt;
    ftp := TFtpDownLoad.Create;
    ftp.OnDownFileProgress := DoOnIncDownFileProgress;
    ftp.FLog := FFtpLog;
    try
      ftp.DownLoadSoundFile(ADev.SimNo,AStartTime,ARemoveTime,FLocalRecordFile);
    finally
      ftp.Free;
    end;
  end;
  if not FileExists(FLocalRecordFile) then
  begin
    FFtpLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+ 'err: û���ص������ļ�!');
    exit;
  end;

  PlaySoundInfo;
end;

procedure TSeeEmergncyAlarmDetailFrm.PlaySoundInfo; //����¼��
begin                                            
  MediaPlayer1.FileName := FLocalRecordFile;
  try
    MediaPlayer1.Open;
    MediaPlayer1.Play;
    MediaPlayer1.EnabledButtons := [btPause,btStop];
    TimerMedia.Enabled := True;
    ProgressBarPlaySound.Min := 0;
    ProgressBarPlaySound.Max := MediaPlayer1.Length;
    ProgressBarPlaySound.Position := MediaPlayer1.Position;
    GroupBoxRecordInfo.Visible := True;
  except on E:Exception do
    FFtpLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+ 'err: ���������ļ�����!'+E.message);
  end;
end;

//����ֵ �����ַ�����ʾ�� "ʱ:��:��"
function TSeeEmergncyAlarmDetailFrm.GetTimeStr(Seconds:Integer):String;
begin
  Result := '';
  if Seconds > 3600 then
    Result := FormatFloat('00',Seconds div 3600) +':';
  Seconds := Seconds mod 3600;
  Result := Result + FormatFloat('00',Seconds div 60)+':'+FormatFloat('00',Seconds mod 60);
end;

procedure TSeeEmergncyAlarmDetailFrm.TimerMediaTimer(Sender: TObject);
begin
  ProgressBarPlaySound.Position := MediaPlayer1.Position;
  Label22.Caption := '���Ž���:'+ GetTimeStr(MediaPlayer1.Position div 1000)+
    '/'+GetTimeStr(MediaPlayer1.Length div 1000);
  if MediaPlayer1.Position >= MediaPlayer1.Length then
  begin
    MediaPlayer1.Stop;
    MediaPlayer1.AutoEnable := False;
    mediaPlayer1.EnabledButtons := [btPlay];
    TimerMedia.Enabled := False;
    Label22.Caption := '���Ž���:';
    ProgressBarPlaySound.Position := 0;
  end;
end;

procedure TSeeEmergncyAlarmDetailFrm.MediaPlayer1Click(Sender: TObject;
  Button: TMPBtnType; var DoDefault: Boolean);
begin
  if (Button = btPlay)then
  begin
    if ProgressBarPlaySound.Position = 0 then
    begin
      if (EditRecordFile.Text='') or (not FileExists(EditRecordFile.Text)) then
      begin
        MessageBox(handle,'�Բ����Ҳ���¼���ļ����޷�����','��ʾ',MB_OK + MB_ICONINFORMATION);
        MediaPlayer1.EnabledButtons := [];
        Exit;
      end;
      try
        MediaPlayer1.Close;
        MediaPlayer1.TimeFormat := tfMilliseconds;
        MediaPlayer1.Open;
        ProgressBarPlaySound.Position := 0;
      except
        MediaPlayer1.EnabledButtons := [];
        exit;
      end;
    end;
    TimerMedia.Enabled := True;
    MediaPlayer1.EnabledButtons := [btPause,btStop];
  end
  else if Button = btPause then
  begin
    TimerMedia.Enabled := False;
    MediaPlayer1.EnabledButtons := [btPlay,btPause,btStop];
  end
  else if Button = btStop then
  begin
    TimerMedia.Enabled := False;
    MediaPlayer1.EnabledButtons := [btPlay];
    ProgressBarPlaySound.Position := 0;
    Label22.Caption := '���Ž���:';
  end;
end;  


procedure TSeeEmergncyAlarmDetailFrm.cxPicListClick(Sender: TObject);
var
  node: TcxTreeListNode;
  filename : String;
begin
  node := cxPicList.FocusedNode;
  if node = nil then exit;
  Pic_Previous.Enabled := (node.Index > 0);
  Pic_Next.Enabled := (node.Index <> FPicCount - 1);
  TimerPicPlay.Enabled := CheckBoxShowPicTimerPlay.Checked;
  filename:= cxPicList.Items[node.index].Values[4];
  ShowPicture(filename);
end;


procedure TSeeEmergncyAlarmDetailFrm.Pic_PreviousExecute(Sender: TObject); //��һ��
var
  node: TcxTreeListNode;
  i : Integer;
begin
  node := cxPicList.FocusedNode;
  if (node = nil) then
  begin
    if FPicCount =0 then exit;
    cxPicList.FocusedNode :=cxPicList.Items[0];
  end;
  i := node.index;
  if i = 0 then
    Pic_Previous.Enabled := False
  else
  begin
    cxPicList.FocusedNode := cxPicList.Items[node.index -1];
    cxPicListClick(nil);
  end;
end;


procedure TSeeEmergncyAlarmDetailFrm.Pic_NextExecute(Sender: TObject);
var
  node: TcxTreeListNode;
  i : Integer;
begin
  node := cxPicList.FocusedNode;
  if (node = nil) then
  begin
    if FPicCount =0 then exit;
    cxPicList.FocusedNode :=cxPicList.Items[0];
  end;
  i := node.index;
  if i = FPicCount - 1 then
    Pic_Next.Enabled := False
  else
  begin
    cxPicList.FocusedNode := cxPicList.Items[node.index + 1];
    cxPicListClick(nil);
  end;     
end;

procedure TSeeEmergncyAlarmDetailFrm.EditPicShowIntervalChange(
  Sender: TObject);
begin
  if EditPicShowInterval.text = '' then Exit;
  try
    TimerPicPlay.Interval := StrToInt(EditPicShowInterval.Text) * 1000;
  except
    TimerPicPlay.Interval := 2000;
  end;
end;

procedure TSeeEmergncyAlarmDetailFrm.EditPicShowIntervalKeyPress(
  Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9',#8]) then Key := #0;
end;

procedure TSeeEmergncyAlarmDetailFrm.TimerPicPlayTimer(Sender: TObject);
var
  node :TcxTreeListNode;
begin
  if FPicCount =0 then
  begin
    TimerPicPlay.Enabled := False;
    exit;
  end;
  node := cxPicList.FocusedNode;
  if node = nil then
    cxPicList.FocusedNode := cxPicList.Items[0]
  else
  begin
    if node.Index = FPicCount -1 then
      cxPicList.FocusedNode := cxPicList.Items[0]
    else
      cxPicList.FocusedNode := cxPicList.Items[node.index+ 1];
  end;
  cxPicListClick(nil);
end;

procedure TSeeEmergncyAlarmDetailFrm.CheckBoxShowPicTimerPlayClick(
  Sender: TObject);
begin
  TimerPicPlay.Enabled := CheckBoxShowPicTimerPlay.Checked;
end;

procedure TSeeEmergncyAlarmDetailFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  TimerPicPlay.Enabled := False;
  TimerMedia.Enabled := False;
  try
    MediaPlayer1.Stop;
    MediaPlayer1.Close;
  except
  end;
  //Action := caFree;
end;
       

procedure TSeeEmergncyAlarmDetailFrm.FormDestroy(Sender: TObject);
begin
  if FFtpLog<> nil then FreeAndNil(FFtpLog);
end;

procedure TSeeEmergncyAlarmDetailFrm.Action_ShowStartAddrExecute(
  Sender: TObject);
begin
  umainf.Mainf.ShowInfoInMap(FStartLongi,FStartLati,'�����ص�');
end;

procedure TSeeEmergncyAlarmDetailFrm.Action_ShowRemoveAddrExecute(
  Sender: TObject);
begin
  umainf.Mainf.ShowInfoInMap(FRemoveLongi,FRemoveLati,'����ص�');
end;

procedure TSeeEmergncyAlarmDetailFrm.RzTrackBarPlaySoundChange(
  Sender: TObject);
begin
  //Label22.Caption := '���Ž���:'+ GetTimeStr(RzTrackBarPlaySound.Position div 1000)+
  //  '/'+GetTimeStr(RzTrackBarPlaySound.Max div 1000);
end;

procedure TSeeEmergncyAlarmDetailFrm.RzTrackBarPlaySoundMouseUp(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  //MediaPlayer1.Position := RzTrackBarPlaySound.Position;    
end;

procedure TSeeEmergncyAlarmDetailFrm.BitBtnDownFtpRecordFileClick(Sender: TObject);
begin
  ProgressBarDownFtpRecordFile.Max := 10 ;
  ProgressBarDownFtpRecordFile.Position := 1;
  LoadSoundInfo(FDev,FStartTime,FRemoveTime);
  GroupBoxDownFtpRecordFile.Visible := False;
end;


procedure TSeeEmergncyAlarmDetailFrm.DoOnIncDownFileProgress(Sender: TObject);
begin
  ProgressBarDownFtpRecordFile.Position := ProgressBarDownFtpRecordFile.Position +1;
  Application.ProcessMessages;
end;

end.
