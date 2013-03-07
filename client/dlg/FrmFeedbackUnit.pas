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
    ShowTips('�����뷴������', memo1);
    Exit;
  end;

  if Length(s) > 500 then
  begin
    ShowTips('�������ݳ��Ȳ��ܳ���500����ȷ��', memo1);
    Exit;
  end;

  qq := Trim(edtQQ.Text);
  email := Trim(edtEmail.Text);
  tel := Trim(edtTel.Text);

  if (qq = '') and (email = '') and (tel = '') then
  begin
    tip := 'Ϊ�˸��õĽ�������������ݣ�����������QQ���绰��������ĳһ����Ϣ��������д��';
    if MessageBox(Handle, PChar(tip), 'ȷ��', MB_ICONQUESTION + MB_YESNO) = IdYes then
    begin
      edtQQ.SetFocus;
      Exit;
    end;
  end;

  tip := '��ȷ���ύ����������';
  if MessageBox(Handle, PChar(tip), 'ȷ��', MB_ICONQUESTION + MB_YESNO) = IdYes then
  begin
    Bs.AddNewUserFeed(qq, email, tel, s);

    W7SpeedButton1Click(nil);
  end;
end;

end.
