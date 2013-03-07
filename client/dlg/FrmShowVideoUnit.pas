unit FrmShowVideoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, CarUnit, StdCtrls, Mask, RzEdit, RzBmpBtn, cxControls,
  cxContainer, cxEdit, cxLabel;
//
//function HI_InitPlay(channelID: integer; playWnd: HWND): integer; stdcall; far; external 'hiH264Codecs.dll' name 'HI_InitPlay';
//function HI_PlayFile(channelID: integer; filePath: PCHAR): integer; stdcall; far; external 'hiH264Codecs.dll' name 'HI_PlayFile';
//function HI_PlayStream(channelID: integer): integer; stdcall; far; external 'hiH264Codecs.dll' name 'HI_PlayStream';
//function HI_InputData(channelID: integer; dataBuf: PBYTE; dataLen: integer): integer; stdcall; far; external 'hiH264Codecs.dll' name 'HI_InputData';
//function HI_UnInit(channelID: integer): integer; stdcall; far; external 'hiH264Codecs.dll' name 'HI_UnInit';


type
  TfrmShowVideo = class(TForm)
    VideoWnd1: TPanel;
    Panel1: TPanel;
    btnStayOnTop: TRzBmpButton;
    btnClose: TRzBmpButton;
    btnMin: TRzBmpButton;
    Image1: TImage;
    Label2: TLabel;
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure chkChannel1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure VideoWnd1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnCloseClick(Sender: TObject);
    procedure btnStayOnTopClick(Sender: TObject);
    procedure btnMinClick(Sender: TObject);
  private
    { Private declarations }
    showVideoWndHandle: Integer;
    showVideoWndHandle2: Integer;
    showVideoWndHandle3: Integer;
    showVideoWndHandle4: Integer;

    isOnTop: Boolean;

    procedure setToolPnlVisible(visible: Boolean);
  protected

  public
    { Public declarations }
    FSelDev: TDevice;
    FChannelId: Integer;
    FPlayerChannelId: Integer;
    procedure DoOnRecvVideoData(devId: Integer; videoChannel: Byte; videoData: PByte; videoDataLen: Integer);
    procedure MouseEnter(var Msg: TMessage); message CM_MOUSEENTER;
    procedure MouseLeave(var Msg: TMessage); message CM_MOUSELEAVE;
  end;

implementation
uses
  uGloabVar, Math, StrUtils;


{$R *.dfm}

procedure TfrmShowVideo.DoOnRecvVideoData(devId: Integer; videoChannel: Byte; videoData: PByte; videoDataLen: Integer);
begin
//  HI_InputData(showVideoWndHandle, videoData, videoDataLen);
//  case videoChannel of
//    1: HI_InputData(showVideoWndHandle, videoData, videoDataLen);
//    2: HI_InputData(showVideoWndHandle2, videoData, videoDataLen);
//    3: HI_InputData(showVideoWndHandle3, videoData, videoDataLen);
//    4: HI_InputData(showVideoWndHandle4, videoData, videoDataLen);
//  end;
end;

procedure TfrmShowVideo.FormDestroy(Sender: TObject);
begin
//  HI_UnInit(showVideoWndHandle);
//  HI_UnInit(showVideoWndHandle2);
//  HI_UnInit(showVideoWndHandle3);
//  HI_UnInit(showVideoWndHandle4);

  DelFromShowVideoList(FSelDev.Id  + '_' + IntToStr(FChannelId));
  VideoChannelUseAry[FPlayerChannelId - 1] := False;
end;

procedure TfrmShowVideo.FormShow(Sender: TObject);
begin
//  showVideoWndHandle := HI_InitPlay(FPlayerChannelId, VideoWnd1.Handle);
//  HI_PlayStream(FPlayerChannelId);
//  showVideoWndHandle2 := HI_InitPlay(2, VideoWnd2.Handle);
//  HI_PlayStream(2);
//  showVideoWndHandle3 := HI_InitPlay(3, VideoWnd3.Handle);
//  HI_PlayStream(3);
//  showVideoWndHandle4 := HI_InitPlay(4, VideoWnd4.Handle);
//  HI_PlayStream(4);

//  edtCarNo.Text := FSelDev.Car.No;
  Caption := '视频监控 ' + FSelDev.Car.No + ' 通道' + IntToStr(FChannelId);
  Label2.Caption := FSelDev.Car.No + ' 通道' + IntToStr(FChannelId);
  //Label2.Caption := FSelDev.Car.No;
  isOnTop := False;
//  chkChannel1.OnClick := chkChannel1Click;
//  chkChannel2.OnClick := chkChannel1Click;
//  chkChannel3.OnClick := chkChannel1Click;
//  chkChannel4.OnClick := chkChannel1Click;
//  pnlTop.Height := pnlMain.Height div 2;
//  VideoWnd1.Width := pnlTop.Width div 2;
//  VideoWnd3.Width := pnlBottom.Width div 2;
end;

procedure TfrmShowVideo.FormResize(Sender: TObject);
begin
//  pnlTop.Height := pnlMain.Height div 2;
//  VideoWnd1.Width := pnlTop.Width div 2;
//  VideoWnd3.Width := pnlBottom.Width div 2;
end;

procedure TfrmShowVideo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
//  if Udp2VideoServer <> nil then
//  begin
////    if chkChannel1.Checked then
////      Udp2VideoServer.SendOrderVideo(FSelDev, 1, 1);
////    if chkChannel2.Checked then
////      Udp2VideoServer.SendOrderVideo(FSelDev, 2, 1);
////    if chkChannel3.Checked then
////      Udp2VideoServer.SendOrderVideo(FSelDev, 3, 1);
////    if chkChannel4.Checked then
////      Udp2VideoServer.SendOrderVideo(FSelDev, 4, 1);
//
//    Udp2VideoServer.SendOrderVideo(FSelDev, FChannelId, 1, 0);
//  end;
end;

procedure TfrmShowVideo.FormCreate(Sender: TObject);
begin
  SetWindowLong(self.Handle, GWL_EXSTYLE, GetWindowLong(self.Handle, GWL_EXSTYLE) or WS_EX_APPWINDOW);
end;

procedure TfrmShowVideo.chkChannel1Click(Sender: TObject);
var
  chk: TCheckBox;
begin
//  chk := TCheckBox(Sender);
//  if Udp2VideoServer <> nil then
//  begin
//    Udp2VideoServer.SendOrderVideo(FSelDev, StrToInt(Copy(chk.Name, 11, Length(chk.Name) - 10)), IfThen(chk.Checked, 0, 1), 0);
//  end;
end;

procedure TfrmShowVideo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmShowVideo.VideoWnd1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  SendMessage(Handle, WM_SYSCOMMAND, $F011, 0);
end;

procedure TfrmShowVideo.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmShowVideo.btnStayOnTopClick(Sender: TObject);
begin
  if isOnTop then
  begin
    btnStayOnTop.GroupIndex := 0;
    btnStayOnTop.Down := False;
    SetWindowPos(handle,HWND_NOTOPMOST,Left,Top,Width,Height,SWP_SHOWWINDOW);
    isOnTop := False;
  end
  else
  begin
    btnStayOnTop.GroupIndex := 1;
    btnStayOnTop.Down := True;
    SetWindowPos(handle,HWND_TOPMOST,Left,Top,Width,Height,SWP_SHOWWINDOW);
    isOnTop := True;
  end;

end;

procedure TfrmShowVideo.btnMinClick(Sender: TObject);
begin
  PostMessage(Handle, WM_SYSCOMMAND, SC_MINIMIZE, 0);
end;

procedure TfrmShowVideo.setToolPnlVisible(visible: Boolean);
begin
  if Panel1.Visible <> visible then
  begin
    Panel1.Visible := visible;
    //label2.Visible := not visible;
  end;
end;

procedure TfrmShowVideo.MouseEnter(var Msg: TMessage);
begin
  if TObject(msg.LParam) = VideoWnd1 then
    setToolPnlVisible(True);
end;

procedure TfrmShowVideo.MouseLeave(var Msg: TMessage);
begin
  if TObject(msg.LParam) = VideoWnd1 then
    setToolPnlVisible(False);
end;

end.
