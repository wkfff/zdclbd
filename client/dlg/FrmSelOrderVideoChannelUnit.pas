unit FrmSelOrderVideoChannelUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, RzButton;

type
  TfrmSelOrderVideoChannel = class(TForm)
    Panel1: TPanel;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    GroupBox1: TGroupBox;
    rbChannel1: TRadioButton;
    rbChannel2: TRadioButton;
    rbChannel3: TRadioButton;
    rbChannel4: TRadioButton;
    edtOrderDuration: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure RzBitBtn1Click(Sender: TObject);
    procedure edtOrderDurationKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    FSelChannelId: Integer;
  end;

var
  frmSelOrderVideoChannel: TfrmSelOrderVideoChannel;

implementation

{$R *.dfm}

procedure TfrmSelOrderVideoChannel.RzBitBtn1Click(Sender: TObject);
begin
  FSelChannelId := -1;

  if rbChannel1.Checked then
    FSelChannelId := 1
  else if rbChannel2.Checked then
    FSelChannelId := 2
  else if rbChannel3.Checked then
    FSelChannelId := 3
  else if rbChannel4.Checked then
    FSelChannelId := 4;

  if FSelChannelId < 0 then
  begin
    MessageBox(Handle, '请至少选择一个通道', '提示', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  if Trim(edtOrderDuration.Text) = '' then
  begin
    MessageBox(Handle, '请输入点播时长！', '提示', MB_OK + MB_ICONINFORMATION);
    edtOrderDuration.SetFocus;
    Exit;
  end;

  if StrToInt(Trim(edtOrderDuration.Text)) <= 0 then
  begin
    MessageBox(Handle, '点播时长需大于0，请重新输入！', '提示', MB_OK + MB_ICONINFORMATION);
    edtOrderDuration.SetFocus;
    Exit;
  end;

  ModalResult := mrOk;
end;

procedure TfrmSelOrderVideoChannel.edtOrderDurationKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #22]) then
    Key := #0;
end;

end.
