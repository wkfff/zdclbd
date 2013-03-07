unit FrmReplyAlarmSuperviseUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, ExtCtrls;

type
  TfrmReplyAlarmSupervise = class(TForm)
    Panel1: TPanel;
    cbxResult: TComboBox;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtSrc: TEdit;
    edtType: TEdit;
    edtLevel: TEdit;
    edtSupervisor: TEdit;
    edtTel: TEdit;
    edtEmail: TEdit;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    procedure RzBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TfrmReplyAlarmSupervise.RzBitBtn1Click(Sender: TObject);
begin
  if cbxResult.ItemIndex < 0 then
  begin
    MessageBox(Handle, '请选择处理结果', '提示', MB_OK + MB_IconInformation);
    Exit;
  end;
  ModalResult := mrOk;
end;

end.
