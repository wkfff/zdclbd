unit TelInfoFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TTelInfoFrm = class(TForm)
    PanelControl: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtnSave: TBitBtn;
    BitBtnCancel: TBitBtn;
    Label1: TLabel;
    EditTelId: TEdit;
    EditTelNo: TEdit;
    Label2: TLabel;
    EditTelName: TEdit;
    Label3: TLabel;
    ComboBoxTelType: TComboBox;
    Label4: TLabel;
    procedure BitBtnSaveClick(Sender: TObject);
    procedure EditTelNoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelInfoFrm: TTelInfoFrm;

implementation

{$R *.dfm}

procedure TTelInfoFrm.BitBtnSaveClick(Sender: TObject);
begin
  if trim(EditTelNo.Text)='' then
  begin
    messagebox(handle,'请您输入 电话号码！','提示',mb_ok + mb_iconinformation);
    EditTelNo.SetFocus;
    Exit;
  end;
  if Trim(EditTelName.Text)='' then
  begin
    messagebox(handle,'请您输入 电话拥有人！','提示',mb_ok + mb_iconinformation);
    EditTelName.SetFocus;
    Exit;
  end;
  if ComboBoxTelType.ItemIndex = -1 then
  begin
    messagebox(handle,'请您选择电话类型！','提示',mb_ok + mb_iconinformation);
    ComboBoxTelType.SetFocus;
    Exit;
  end;

  ModalResult := mrOk;
end;

procedure TTelInfoFrm.EditTelNoKeyPress(Sender: TObject; var Key: Char);
begin
  {if not (key in['0'..'9','-','*','?',#8]) then
  begin
    Key := #0;
    messagebox(handle,'请您输入数字或分机号【-】或通配符【*】【?】！','提示',mb_ok + mb_iconinformation);
    EditTelNo.SetFocus;
  end;   }
end;

end.
