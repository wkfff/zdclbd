unit AudioFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit, StdCtrls,
  ExtCtrls, cxInplaceContainer, cxControls, Buttons, ComCtrls, uGloabVar,
  CarUnit, Types, MPlayer, RzButton, RzTrkBar, OleCtrls, WMPLib_TLB, Service,
  pcm, funVolume;

type
  TAudioFrm = class(TForm)
    Panel9: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    NotReceivePictureList: TListView;
    Panel3: TPanel;
    ProgressBar1: TProgressBar;
    Panel11: TPanel;
    BitBtnReceive: TBitBtn;
    BitBtnCancel: TBitBtn;
    Splitter2: TSplitter;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    cxPicList: TcxTreeList;
    cxDeviceListcxTreeListColumn1: TcxTreeListColumn;
    cxPicListcxTreeListColumn1: TcxTreeListColumn;
    Panel7: TPanel;
    PanelButton: TPanel;
    Label1: TLabel;
    Panel8: TPanel;
    BitBtnDel: TBitBtn;
    BitBtnDelAll: TBitBtn;
    Timer1: TTimer;
    Panel10: TPanel;
    WindowsMediaPlayer: TWindowsMediaPlayer;
    Panel12: TPanel;
    Label2: TLabel;
    editFileName: TEdit;
    Panel14: TPanel;
    BitBtnPlay: TRzBitBtn;
    BitBtnStop: TRzBitBtn;
    BitBtnPause: TRzBitBtn;
    BitBtnFastForward: TRzBitBtn;
    Panel15: TPanel;
    Label4: TLabel;
    Panel16: TPanel;
    Panel17: TPanel;
    TrackBarPlay: TRzTrackBar;
    Panel18: TPanel;
    Panel19: TPanel;
    LabelProcess: TLabel;
    Panel13: TPanel;
    TrackBarSound: TRzTrackBar;
    cxPicListcxTreeListColumn2: TcxTreeListColumn;
    btnOpenFile: TBitBtn;
    OpenDialog1: TOpenDialog;
    Splitter1: TSplitter;
    procedure BitBtnReceiveClick(Sender: TObject);
    procedure BitBtnDelAllClick(Sender: TObject);
    procedure BitBtnDelClick(Sender: TObject);
    procedure BitBtnCancelClick(Sender: TObject);
    procedure cxPicListChange(Sender: TObject);
    procedure BitBtnPlayClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtnPauseClick(Sender: TObject);
    procedure BitBtnFastForwardClick(Sender: TObject);
    procedure BitBtnStopClick(Sender: TObject);
    procedure TrackBarPlayMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TrackBarPlayMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure TrackBarPlayMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TrackBarSoundMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TrackBarSoundMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnOpenFileClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    isCancel:boolean;
    FIsPlaying : Boolean;   //正在播放标记
    FMouseDowned:Boolean;
    { Private declarations }
  public
    { Public declarations }
    procedure OnAudioUpload(ADev:TObject;AudioIndex:Integer);
    procedure AddPicList(car_no: string; fileName: string);
  end;

var
  AudioFrm: TAudioFrm;

implementation
uses umainf, ConstDefineUnit;
{$R *.dfm}

procedure TAudioFrm.OnAudioUpload(ADev:TObject;AudioIndex:Integer);
var
  i: Integer;
begin
  for i:=0 to NotReceivePictureList.Items.Count-1 do
  begin
    if AudioIndex = strtoint(NotReceivePictureList.Items.Item[i].SubItems.Strings[1]) then
      Exit
  end;
  
  with NotReceivePictureList.Items.Add  do
  begin
    Data:=ADev;
    Caption:=(TDevice(ADev).id);
    SubItems.Add(TDevice(ADev).Car.No);
    SubItems.Add(IntToStr(AudioIndex));
    SubItems.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss', Now));
  end;
end;

procedure TAudioFrm.AddPicList(car_no, fileName: string);
begin
  with cxPicList.Add do
  begin
    Values[0] := car_no;
    Values[1] := fileName;
    Values[2] := IntToStr(cxPicList.Count);
  end;
end;

procedure TAudioFrm.BitBtnReceiveClick(Sender: TObject);
var
//  i:integer;
  adpFileName, fileName, wavFileName: string;
  info: SoundRecordData;
  ms : TMemoryStream;
  fs: TFileStream;

  node:TcxTreeListNode;
  photoInfo: PicInfo;
  dev:TDevice;
  fileType: string;
  dstFileName: string;
begin
  if NotReceivePictureList.Items.Count<=0 then exit;
  ProgressBar1.Max:=(NotReceivePictureList.Items.Count+1)*10;
  Application.ProcessMessages;
  ProgressBar1.StepIt;
  isCancel:=false;
  BitBtnReceive.Visible:=false;
  BitBtnCancel.Visible:=true;
  try
    while NotReceivePictureList.Items.Count>0 do
    begin
      try
        if isCancel then  break;

        try
          info := bs.Query_SoundRecord_SoundData(strtoint(NotReceivePictureList.Items.Item[0].SubItems.Strings[1]));
          photoInfo := Bs.QueryPhoteByPicIndex(strtoint(NotReceivePictureList.Items.Item[0].SubItems.Strings[1]));
        except
          on E: Exception do
          begin
            messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
            exit;
          end;
        end;
        //if info = nil then
        if photoInfo = nil then
        begin
          wavFileName := '无';
        end
        else
        begin
          dev := TDevice(NotReceivePictureList.Items.Item[0].Data);
          if dev <> nil then
          begin
            fileName := ExePath + 'Audio\';
            if not DirectoryExists(fileName) then
              if not CreateDir(fileName) then
            begin
              MessageBox(self.Handle, PAnsiChar('不能创建' + fileName + '目录'), '提示', mb_iconinformation + mb_ok);
              Exit;
            end;

            filename:=fileName + dev.Car.No;
            if not DirectoryExists(fileName) then
                if not CreateDir(fileName) then
            begin
              MessageBox(self.Handle, PAnsiChar('不能创建' + fileName + '目录'), '提示', mb_iconinformation + mb_ok);
              Exit;
            end;
            fileName:=fileName+'\'+Dev.Car.No+'_'+FormatDatetime('yymmddhhnnss',now);
//            adpFileName := fileName+'_'+NotReceivePictureList.Items.Item[0].Caption
//                          + '_' + NotReceivePictureList.Items.Item[0].SubItems.Strings[1] +'.adp';
            if photoInfo.PhotoMeasure = 3 then
            begin
              fileType := '.mp3';
              wavFileName:=fileName+'_'+NotReceivePictureList.Items.Item[0].Caption
                                + '_' + NotReceivePictureList.Items.Item[0].SubItems.Strings[1] + fileType;
              dstFileName := wavFileName;
            end
            else if photoInfo.PhotoMeasure = -2 then
            begin
              fileType := '.adp';
              wavFileName:= fileName+'_'+NotReceivePictureList.Items.Item[0].Caption
                                + '_' + NotReceivePictureList.Items.Item[0].SubItems.Strings[1] + fileType;
              dstFileName := fileName+'_'+NotReceivePictureList.Items.Item[0].Caption
                                + '_' + NotReceivePictureList.Items.Item[0].SubItems.Strings[1] + '.wav';
            end
            else
            begin
              fileType := '.wav';
              wavFileName:=fileName+'_'+NotReceivePictureList.Items.Item[0].Caption
                                + '_' + NotReceivePictureList.Items.Item[0].SubItems.Strings[1] + fileType;
              dstFileName := wavFileName;
            end;

            if not FileExists(wavFileName) then
            begin
              try                                                      
                //ms := TMemoryStream.Create;
                //ms.LoadFromFile('F:\文档\哈尔滨智能服务终端\音频\01001000030030101192030.adp');

//                fs := TFileStream.Create(adpFileName, fmCreate or fmShareDenyWrite);
                fs := TFileStream.Create(wavFileName, fmCreate or fmShareDenyWrite);

                fs.Position := 0; //fs.Size;
                //fs.Write(info.SoundData[0], Length(info.SoundData));
                fs.Write(photoInfo.photo[0], Length(photoInfo.Photo));
              finally
                fs.Free;
              end;
            end;
            
//            wavFileName:=fileName+'_'+NotReceivePictureList.Items.Item[0].Caption
//                    + '_' + NotReceivePictureList.Items.Item[0].SubItems.Strings[1] +'.wav';
            //ConvertAdp2Wav(adpFileName, wavFileName, 0);//info.CodeWay);
          end;
        end;

        if dstFileName <> wavFileName then
        begin
          ConvertAdp2Wav(wavFileName, dstFileName, $00);
        end;  

        AddPicList(NotReceivePictureList.Items.Item[0].SubItems[0], dstFileName);
        NotReceivePictureList.Items.Item[0].Delete;
        ProgressBar1.StepIt;
        Application.ProcessMessages;
      except
        NotReceivePictureList.Items.Item[0].Delete;
        ProgressBar1.StepIt;
        Application.ProcessMessages;
      end;
    end;
  finally
      BitBtnReceive.Visible:=true;
      BitBtnCancel.Visible:=false;
      ProgressBar1.Position:=0;
  end;
end;

procedure TAudioFrm.BitBtnDelAllClick(Sender: TObject);
var
  Node: TcxTreeListNode;
//  i:integer;
begin
    if cxPicList.Count<=0 then       
    begin
        MessageBox(self.Handle,'没有可删除的音频','提示',mb_ok + mb_iconinformation);
        exit;
    end;
    if MessageBox(Self.Handle,PChar('确定全部删除?'),PChar('提示'),MB_OKCANCEL + MB_ICONQUESTION)=ID_OK then
    begin
      while cxPicList.Count>0 do
      begin
          Node:=cxPicList.Items[0];
          if FileExists(node.Values[1]) then
          begin
              DeleteFile(node.Values[1]);
          end;
          node.Delete;
      end;
    end;
end;

procedure TAudioFrm.BitBtnDelClick(Sender: TObject);
var
  Node: TcxTreeListNode;
  s:string;
begin
  node:=cxPicList.FocusedNode;
  if node=nil then
  begin
      MessageBox(self.Handle,'请选择一个音频文件','提示',mb_ok + mb_iconinformation);
      exit;
  end;
  s:='确定要删除'+node.Values[1]+'?';
  if MessageBox(Self.Handle,PChar(s),PChar('提示'),MB_OKCANCEL + MB_ICONQUESTION)=ID_OK then
  begin
    if FileExists(node.Values[1]) then
    begin
        DeleteFile(node.Values[1]);
    end;
    editFileName.Text := '';
    node.Delete;
  end;

end;

procedure TAudioFrm.BitBtnCancelClick(Sender: TObject);
begin
  isCancel:=true;
end;

procedure TAudioFrm.cxPicListChange(Sender: TObject);
var
  Node: TcxTreeListNode;
begin
  //ShowPicture('20');
  node:=cxPicList.FocusedNode;
  if  node=nil then exit;
  editFileName.Text := Node.Values[1];
end;

procedure TAudioFrm.BitBtnPlayClick(Sender: TObject);
var
  ffName:string;
  i,p,pYear,pmm,pdd:Integer;
  s:string;
  dt :TDateTime;
  year,month,day,hour,mm,ss:integer;
  FileName: string;
begin
  BitBtnStop.Click; //停止
  WindowsMediaPlayer.close;

  //------------播放
  FileName := Trim(editFileName.Text);
  WindowsMediaPlayer.URL := FileName;
  if not TrackBarPlay.Enabled then
    TrackBarPlay.Enabled:= True;
  //BitBtnPlay.Click;

  if WindowsMediaPlayer.URL <> '' then
  begin
    FIsPlaying := True;
    BitBtnPlay.Enabled := False;
    BitBtnFastForward.Enabled := True;
    BitBtnStop.Enabled := True;
    BitBtnPause.Enabled := True;
    WindowsMediaPlayer.controls.play;
    TrackBarPlay.Enabled := True;
    Timer1.Enabled := True;
  end
  else
  begin
    MessageBox(Handle,'请您先选择要播放的文件！','提示',MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
end;

procedure TAudioFrm.Timer1Timer(Sender: TObject);
begin
  TrackBarPlay.Max :=  Round(WindowsMediaPlayer.currentMedia.duration*100);
  TrackBarPlay.Position := round(WindowsMediaPlayer.controls.currentPosition*100);
  //LabelProcess.Caption := GetMinuteAndSecond(WindowsMediaPlayer.controls.currentPosition)+
  //  ' / '+GetMinuteAndSecond(WindowsMediaPlayer.currentMedia.duration);
  LabelProcess.Caption := WindowsMediaPlayer.controls.currentPositionString +
    ' / '+ WindowsMediaPlayer.currentMedia.durationString;
  if (WindowsMediaPlayer.controls.currentPosition <> 0) and (WindowsMediaPlayer.controls.currentPositionString = WindowsMediaPlayer.currentMedia.durationString) then
  begin
    BitBtnStop.Click;
  end;    
end;

procedure TAudioFrm.BitBtnPauseClick(Sender: TObject);
begin
  if BitBtnPause.Caption = '暂停' then
  begin
    FIsPlaying := False;
    //BitBtnPlay.Enabled := True;
    //BitBtnFastForward.Enabled := True;
    //BitBtnStop.Enabled := False;
    //BitBtnPause.Enabled := False;
    WindowsMediaPlayer.controls.pause;
    Timer1.Enabled := False;
    BitBtnPause.Caption := '继续';
  end
  else if BitBtnPause.Caption = '继续' then
  begin
      FIsPlaying := True;
      WindowsMediaPlayer.controls.play;
      Timer1.Enabled := True;
      BitBtnPause.Caption := '暂停';
  end;
end;

procedure TAudioFrm.BitBtnFastForwardClick(Sender: TObject);
begin
  FIsPlaying := True;
  WindowsMediaPlayer.controls.pause;
  WindowsMediaPlayer.settings.rate := 2;
  WindowsMediaPlayer.controls.play;
  BitBtnPlay.Enabled := True;
  BitBtnFastForward.Enabled :=False;
  BitBtnStop.Enabled := True;
  BitBtnPause.Enabled := True;
  Timer1.Enabled :=True;
end;

procedure TAudioFrm.BitBtnStopClick(Sender: TObject);
begin
  if FIsPlaying then WindowsMediaPlayer.controls.stop;
  BitBtnPlay.Enabled := True;
  BitBtnFastForward.Enabled :=True;
  BitBtnStop.Enabled := False;
  BitBtnPause.Enabled := False;
  Timer1.Enabled := False;
  TrackBarPlay.Position := 0;
  LabelProcess.Caption := '';
  FIsPlaying := False;
end;

procedure TAudioFrm.TrackBarPlayMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) and (Shift = [ssleft]) then
  begin
    try
      FMouseDowned := True;
      WindowsMediaPlayer.controls.pause;
      Timer1.Enabled := False;
      TrackBarPlay.Position := round(TrackBarPlay.Max * X /TrackBarPlay.Width);  //计算TrackBar的位置
      WindowsMediaPlayer.controls.currentPosition := TrackBarPlay.Position /100;
      LabelProcess.Caption := WindowsMediaPlayer.controls.currentPositionString+
        ' / '+WindowsMediaPlayer.currentMedia.durationString;
    except

    end;
  end;
end;

procedure TAudioFrm.TrackBarPlayMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if FMouseDowned then
  begin
    try
      WindowsMediaPlayer.controls.currentPosition := TrackBarPlay.Position /100;
      LabelProcess.Caption := WindowsMediaPlayer.controls.currentPositionString+
        ' / '+WindowsMediaPlayer.currentMedia.durationString;
    except

    end;
  end;
end;

procedure TAudioFrm.TrackBarPlayMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if FMouseDowned then
  begin
    FMouseDowned :=False;
    BitBtnPlay.Click;
  end;
end;

procedure TAudioFrm.TrackBarSoundMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TrackBarSound.Position := Round(TrackBarSound.Max - TrackBarSound.Max /TrackBarSound.Height*y);
end;

procedure TAudioFrm.TrackBarSoundMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  t:Integer;
begin
  t:= TrackBarSound.Position;
  SetVolume(Master,t);
end;

procedure TAudioFrm.btnOpenFileClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    editFileName.Text:= OpenDialog1.FileName ;
  end;
end;

procedure TAudioFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Mainf.show_Audio.Checked := False;
  ManualDock(nil)
end;

end.
