unit FrmFeedbackUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvToolBar, AdvMemo, W7ListViewItems, W7Classes, StdCtrls,
  W7Labels, W7Images, W7Buttons, W7Bars, AdvSmoothPanel, AdvSmoothLabel,
  W7Panels, ExtCtrls, AdvSmoothMessageDialog, AdvSmoothButton,
  RzBmpBtn, AdvOfficeImage, RzLabel, ImgList, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMemo, RzBorder, RzEdit, RzButton, AdvEdit;

type
  TfrmFeedback = class(TForm)
    W7Panel1: TW7Panel;
    AdvSmoothLabel1: TAdvSmoothLabel;
    W7Panel2: TW7Panel;
    W7Panel3: TW7Panel;
    AdvSmoothLabel2: TAdvSmoothLabel;
    Image1: TImage;
    W7SpeedButton1: TW7SpeedButton;
    RzBorder1: TRzBorder;
    RzBorder2: TRzBorder;
    W7Panel4: TW7Panel;
    RzLabel1: TRzLabel;
    memo1: TRzMemo;
    RzBorder4: TRzBorder;
    btnSubmit: TW7SpeedButton;
    edtQQ: TEdit;
    edtTel: TEdit;
    edtEmail: TEdit;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    procedure W7Panel2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure W7SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSubmitClick(Sender: TObject);
  private
    { Private declarations }
   
  public
    { Public declarations }

  end;

var
  frmFeedback: TfrmFeedback;

implementation
uses
  uGloabVar, CarUnit;

{$R *.dfm}

procedure TfrmFeedback.W7Panel2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  SendMessage(Handle, WM_SYSCOMMAND, $F011, 0);
end;

procedure TfrmFeedback.W7SpeedButton1Click(Sender: TObject);
begin
  Close;
end;


procedure TfrmFeedback.FormShow(Sender: TObject);
begin
  W7SpeedButton1.Left := W7Panel2.Width - W7SpeedButton1.Width;
  memo1.Clear;
  memo1.SetFocus;
end;

procedure TfrmFeedback.btnSubmitClick(Sender: TObject);
var
  s: string;
  qq, email, tel: string;
  tip: string;
begin
  s := Trim(memo1.Text);
  if (s = '') then
  begin
    ShowTips('请输入反馈内容', memo1);
    Exit;
  end;

  if Length(s) > 500 then
  begin
    ShowTips('反馈内容长度不能超过500，请确认', memo1);
    Exit;
  end;

  qq := Trim(edtQQ.Text);
  email := Trim(edtEmail.Text);
  tel := Trim(edtTel.Text);

  if (qq = '') and (email = '') and (tel = '') then
  begin
    tip := '为了更好的解决您反馈的内容，建议您输入QQ、电话、邮箱中某一项信息，现在填写吗？';
    if MessageBox(Handle, PChar(tip), '确认', MB_ICONQUESTION + MB_YESNO) = IdYes then
    begin
      edtQQ.SetFocus;
      Exit;
    end;
  end;

  tip := '您确认提交反馈内容吗？';
  if MessageBox(Handle, PChar(tip), '确认', MB_ICONQUESTION + MB_YESNO) = IdYes then
  begin
    Bs.AddNewUserFeed(qq, email, tel, s);

    W7SpeedButton1Click(nil);
  end;
end;

end.
