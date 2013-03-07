unit FrmReplyGovInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, RzButton;

type
  TfrmReplyGovInfo = class(TForm)
    Panel1: TPanel;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    Label1: TLabel;
    Memo1: TMemo;
    procedure RzBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReplyGovInfo: TfrmReplyGovInfo;

implementation

{$R *.dfm}

procedure TfrmReplyGovInfo.RzBitBtn1Click(Sender: TObject);
begin
  if Memo1.Text = '' then
  begin
    MessageBox(Handle, '请输入回复内容', '提示', MB_OK + MB_ICONINFORMATION);
    Memo1.SetFocus;
    Exit;
  end;

  ModalResult := mrOk;
end;

end.
