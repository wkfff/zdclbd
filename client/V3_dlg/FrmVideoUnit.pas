unit FrmVideoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxInplaceContainer, cxControls, ExtCtrls, StdCtrls, Buttons, ComCtrls,
  ImgList, DSPack, RzLabel, ToolWin, DXSUtil;

type
  TfrmVideo = class(TForm)
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
    Splitter1: TSplitter;
    Panel5: TPanel;
    Panel6: TPanel;
    cxPicList: TcxTreeList;
    cxDeviceListcxTreeListColumn1: TcxTreeListColumn;
    cxPicListcxTreeListColumn1: TcxTreeListColumn;
    cxPicListcxTreeListColumn2: TcxTreeListColumn;
    Panel7: TPanel;
    PanelButton: TPanel;
    Panel8: TPanel;
    BitBtnDel: TBitBtn;
    BitBtnDelAll: TBitBtn;
    Panel10: TPanel;
    VideoWindow1: TVideoWindow;
    Panel12: TPanel;
    ToolBar: TToolBar;
    btPlay: TToolButton;
    btPause: TToolButton;
    ToolButton1: TToolButton;
    btFullScreen: TToolButton;
    SoundLevel: TTrackBar;
    lblPlayProgress: TRzLabel;
    TrackBar: TDSTrackBar;
    ImageList: TImageList;
    FilterGraph1: TFilterGraph;
    procedure BitBtnCancelClick(Sender: TObject);
    procedure BitBtnReceiveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btPlayClick(Sender: TObject);
    procedure btPauseClick(Sender: TObject);
    procedure btFullScreenClick(Sender: TObject);
    procedure VideoWindow1DblClick(Sender: TObject);
    procedure SoundLevelChange(Sender: TObject);
    procedure TrackBarTimer(sender: TObject; CurrentPos,
      StopPos: Cardinal);
    procedure BitBtnDelClick(Sender: TObject);
    procedure BitBtnDelAllClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxPicListChange(Sender: TObject);
  private
    { Private declarations }
    isCancel: Boolean;
    FIsVideoRendered: Boolean;
//    procedure AddPicList(car_no: string; fileName: string);
    procedure ResetVideoPlayOpt();
    procedure AddPicList(car_no, fileName: string);
  public
    { Public declarations }
    procedure OnVideoUpload(ADev:TObject; VideoId:Integer);
  end;


implementation
uses
  uGloabVar, CarUnit, Service, ConstDefineUnit;

{$R *.dfm}

{ TfrmVideo }

procedure TfrmVideo.OnVideoUpload(ADev: TObject; VideoId: Integer);
var
  i: Integer;
begin
  for i:=0 to NotReceivePictureList.Items.Count-1 do
  begin
    if VideoId = strtoint(NotReceivePictureList.Items.Item[i].SubItems.Strings[1]) then
      Exit
  end;
  
  with NotReceivePictureList.Items.Add  do
  begin
    Data:=ADev;
    Caption:=(TDevice(ADev).id);
    SubItems.Add(TDevice(ADev).Car.No);
    SubItems.Add(IntToStr(VideoId));
    SubItems.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss', Now));
  end;
end;

procedure TfrmVideo.BitBtnCancelClick(Sender: TObject);
begin
  isCancel := True;
end;

procedure TfrmVideo.BitBtnReceiveClick(Sender: TObject);
var
  videoFileName: string;
  fileName: string;
  ms : TMemoryStream;
  fs: TFileStream;

  node:TcxTreeListNode;
  photoInfo: PicInfo;
  dev:TDevice;
  fileType: string;
begin
  if NotReceivePictureList.Items.Count <= 0 then exit;
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
          photoInfo := Bs.QueryPhoteByPicIndex(strtoint(NotReceivePictureList.Items.Item[0].SubItems.Strings[1]));
        except
          on E: Exception do
          begin
            messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
            exit;
          end;
        end;
        if photoInfo = nil then
        begin
          videoFileName := '无';
        end
        else
        begin
          dev := TDevice(NotReceivePictureList.Items.Item[0].Data);
          if dev <> nil then
          begin
            fileName := ExePath + 'Video\';
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
            fileType := '.avi';

            videoFileName:=fileName+'_'+NotReceivePictureList.Items.Item[0].Caption
                                + '_' + NotReceivePictureList.Items.Item[0].SubItems.Strings[1] + fileType;
            if not FileExists(videoFileName) then
            begin
              try
                fs := TFileStream.Create(videoFileName, fmCreate or fmShareDenyWrite);
                fs.Position := 0; //fs.Size;
                fs.Write(photoInfo.photo[0], Length(photoInfo.Photo));
              finally
                fs.Free;
              end;
            end;
          end;
        end;

        AddPicList(NotReceivePictureList.Items.Item[0].SubItems[0], videoFileName);
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

procedure TfrmVideo.AddPicList(car_no, fileName: string);
begin
  with cxPicList.Add do
  begin
    Values[0] := car_no;
    Values[1] := fileName;
    Values[2] := IntToStr(cxPicList.Count);
  end;
end;

procedure TfrmVideo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ManualDock(nil);
end;

procedure TfrmVideo.btPlayClick(Sender: TObject);
var
  node: TcxTreeListNode;
  rfr: HRESULT;
begin
  if not FIsVideoRendered then
  begin
    if cxPicList.Count <= 0 then
    begin
      MessageBox(Handle, '无可播放视频，请确认', '提示', MB_OK + MB_ICONINFORMATION);
      btPlay.Down := False;
      Exit;
    end;
    node := cxPicList.FocusedNode;
    if node = nil then
    begin
      MessageBox(Handle, '请选择需要播放的视频', '提示', MB_OK + MB_ICONINFORMATION);
      btPlay.Down := False;
      Exit;
    end;

    FilterGraph1.ClearGraph;
    TrackBar.Position := 0;

    if not FilterGraph1.Active then
      FilterGraph1.Active := True;
    try
      rfr := FilterGraph1.RenderFile(node.Values[1]);
    except
      MessageBox(Handle, '加载文件失败，请重试', '提示', MB_OK + MB_ICONINFORMATION);
      btPlay.Down := False;
    end;
    if Failed(rfr) then
    begin
      MessageBox(Handle, '加载文件失败，请重试', '提示', MB_OK + MB_ICONINFORMATION);
      btPlay.Down := False;
      Exit;
    end;
    FIsVideoRendered := True;
  end;

  FilterGraph1.Play;
  btPause.Enabled := True;
end;

procedure TfrmVideo.btPauseClick(Sender: TObject);
begin
  FilterGraph1.Pause;
end;

procedure TfrmVideo.btFullScreenClick(Sender: TObject);
begin
  VideoWindow1.FullScreen := not VideoWindow1.FullScreen;
  btFullScreen.Down := VideoWindow1.FullScreen;
end;

procedure TfrmVideo.VideoWindow1DblClick(Sender: TObject);
begin
  btFullScreenClick(Sender);
end;

procedure TfrmVideo.SoundLevelChange(Sender: TObject);
begin
  FilterGraph1.Volume := SoundLevel.Position;
end;

procedure TfrmVideo.TrackBarTimer(sender: TObject; CurrentPos,
  StopPos: Cardinal);
begin
  lblPlayProgress.Caption := Format('%s/%s', [TimeToStr(CurrentPos / MiliSecPerDay), TimeToStr(StopPos / MiliSecPerDay)]);
  if (CurrentPos = StopPos) then
  begin
    ResetVideoPlayOpt;
  end;
end;

procedure TfrmVideo.ResetVideoPlayOpt;
begin
  btPlay.Down := False;
  btPause.Enabled := False;
  lblPlayProgress.Caption := '';
  FilterGraph1.ClearGraph;
  FIsVideoRendered := False;
  FilterGraph1.Active := False;
  TrackBar.Position := 0;
end;

procedure TfrmVideo.BitBtnDelClick(Sender: TObject);
var
  Node: TcxTreeListNode;
  s:string;
begin
  node:=cxPicList.FocusedNode;
  if node=nil then
  begin
      MessageBox(self.Handle,'请选择一个视频文件','提示',mb_ok + mb_iconinformation);
      exit;
  end;
  s:='确定要删除'+node.Values[1]+'?';
  if MessageBox(Self.Handle,PChar(s),PChar('提示'),MB_OKCANCEL + MB_ICONQUESTION)=ID_OK then
  begin
    if FileExists(node.Values[1]) then
    begin
      DeleteFile(node.Values[1]);
    end;
    node.Delete;
  end;
end;

procedure TfrmVideo.BitBtnDelAllClick(Sender: TObject);
var
  Node: TcxTreeListNode;
begin
  if cxPicList.Count<=0 then
  begin
    MessageBox(self.Handle,'没有可删除的视频','提示',mb_ok + mb_iconinformation);
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

procedure TfrmVideo.FormDestroy(Sender: TObject);
begin
  FilterGraph1.ClearGraph;
end;

procedure TfrmVideo.cxPicListChange(Sender: TObject);
begin
  FIsVideoRendered := False;
end;

end.
