unit SendSimpleTextUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TdlgSendSimpleText = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    btnSend: TBitBtn;
    btnDissend: TBitBtn;
    Panel4: TPanel;
    mmoReason: TMemo;
    procedure btnSendClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dlgSendSimpleText: TdlgSendSimpleText;

implementation

{$R *.dfm}

procedure TdlgSendSimpleText.btnSendClick(Sender: TObject);
begin
  if Trim(mmoReason.Lines.Text) = '' then
  begin
    MessageBox(Handle, '原因内容不能为空!', '提示', MB_OK + MB_ICONINFORMATION);
    mmoReason.SetFocus;
    Exit;
  end;
  ModalResult := mrOk;
end;

end.
