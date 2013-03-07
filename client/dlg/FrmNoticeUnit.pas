unit FrmNoticeUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvToolBar, AdvMemo, W7ListViewItems, W7Classes, StdCtrls,
  W7Labels, W7Images, W7Buttons, W7Bars, AdvSmoothPanel, AdvSmoothLabel,
  W7Panels,ExtCtrls, AdvSmoothMessageDialog, AdvSmoothButton,
  RzBmpBtn, AdvOfficeImage, RzLabel, ImgList, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMemo, RzBorder, RzEdit;

type
  TfrmNotice = class(TForm)
    W7Panel1: TW7Panel;
    AdvSmoothLabel1: TAdvSmoothLabel;
    W7Panel2: TW7Panel;
    W7Panel3: TW7Panel;
    AdvSmoothLabel2: TAdvSmoothLabel;
    Image1: TImage;
    lblReadAll: TW7ActiveLabel;
    W7SpeedButton1: TW7SpeedButton;
    lblPageTip: TAdvSmoothLabel;
    imgNext: TImage;
    imgPrevious: TImage;
    RzBorder1: TRzBorder;
    RzBorder2: TRzBorder;
    W7Panel4: TW7Panel;
    W7Panel5: TW7Panel;
    lblRead: TW7ActiveLabel;
    RzLabel1: TRzLabel;
    memoNotice: TRzMemo;
    RzBorder4: TRzBorder;
    lblNoticeTitle: TRzLabel;
    RzBorder3: TRzBorder;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure W7Panel2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure W7SpeedButton1Click(Sender: TObject);
    procedure lblReadClick(Sender: TObject);
    procedure lblReadAllClick(Sender: TObject);
    procedure imgPreviousClick(Sender: TObject);
    procedure imgNextClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    currNoticeIndex: Integer;
    totalNoticeCount: Integer;

    procedure setNoticeRead(noticeIndex: Integer);

    procedure showNotice(noticeIndex: Integer);
    procedure showPreviousNotice;
    procedure showNextNotice;
  public
    { Public declarations }

    procedure initNotices;
  end;

var
  frmNotice: TfrmNotice;

implementation
uses
  uGloabVar, CarUnit;

{$R *.dfm}

procedure TfrmNotice.FormShow(Sender: TObject);
begin
  W7Panel1.SetFocus;
  W7SpeedButton1.Left := W7Panel2.Width - W7SpeedButton1.Width;
end;

procedure TfrmNotice.FormCreate(Sender: TObject);
begin
  lblRead.Font.Style := [];
  lblReadAll.Font.Style := [];
end;
                          
procedure TfrmNotice.W7Panel2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  SendMessage(Handle, WM_SYSCOMMAND, $F011, 0);
end;

procedure TfrmNotice.W7SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmNotice.lblReadClick(Sender: TObject);
begin
  lblRead.Enabled := False;
  setNoticeRead(currNoticeIndex);
end;

procedure TfrmNotice.lblReadAllClick(Sender: TObject);
var
  i: Integer;
begin
  lblRead.Enabled := False;
  lblReadAll.Enabled := False;
  for i := 0 to totalNoticeCount - 1 do
  begin
    setNoticeRead(i);
  end;  
end;

procedure TfrmNotice.imgPreviousClick(Sender: TObject);
begin
  showPreviousNotice;
end;

procedure TfrmNotice.imgNextClick(Sender: TObject);
begin
  showNextNotice;
end;

procedure TfrmNotice.setNoticeRead(noticeIndex: Integer);
var
  notice: TNotice;
begin
  notice := FNoticeManage.Items[noticeIndex];
  if (notice <> nil) and (notice.IsRead = 1) then
  begin
    notice.IsRead := 0;
    Bs.setNoticeRead(notice.Id);
  end;
end;

procedure TfrmNotice.showNextNotice;
begin
  showNotice(currNoticeIndex + 1);
end;

procedure TfrmNotice.showPreviousNotice;
begin
  showNotice(currNoticeIndex - 1);
end;

procedure TfrmNotice.initNotices;
begin
  currNoticeIndex := 0;
  totalNoticeCount := FNoticeManage.Count;
  lblPageTip.Caption.Text := '1/' + IntToStr(totalNoticeCount);
  showNotice(currNoticeIndex);
end;

procedure TfrmNotice.showNotice(noticeIndex: Integer);
var
  notice: TNotice;
begin
  if (noticeIndex >= 0) and (noticeIndex < totalNoticeCount) then
  begin
    notice := FNoticeManage.Items[noticeIndex];
    if notice <> nil then
    begin
      memoNotice.Clear;
      lblNoticeTitle.Caption := notice.Title;
      memoNotice.Lines.Add(notice.Content);
      lblRead.Enabled := (notice.IsRead = 1);
      lblPageTip.Caption.Text := IntToStr(noticeIndex + 1) + '/' + IntToStr(totalNoticeCount);
      currNoticeIndex := noticeIndex;
    end;  
  end;   
end;

procedure TfrmNotice.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
