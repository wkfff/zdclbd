unit ModifyLcdCoNameFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TModifyLcdCoNameFrm = class(TForm)
    Panel11111: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    EditCoName: TEdit;
    Panel3: TPanel;
    BitBtnOk: TBitBtn;
    BitBtnCancel: TBitBtn;
    procedure BitBtnOkClick(Sender: TObject);
  private                                                   
    { Private declarations }
  public
    { Public declarations }
    procedure DoOnKeyPress1(Sender: TObject; var Key: Char);
  end;

var
  ModifyLcdCoNameFrm: TModifyLcdCoNameFrm;

implementation

{$R *.dfm}
procedure TModifyLcdCoNameFrm.DoOnKeyPress1(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8])then
    key := #0;
end;

procedure TModifyLcdCoNameFrm.BitBtnOkClick(Sender: TObject);
begin
{  if Trim(EditCoName.Text)='' then
  begin
    messagebox(handle,'请您输入要在显示屏上显示的公司名称！','提示',mb_ok + mb_iconinformation);
    EditCoName.SetFocus;
    exit;
  end;  }
  ModalResult := mrOk;
end;

end.
