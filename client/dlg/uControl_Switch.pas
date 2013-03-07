unit uControl_Switch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TControl_Switch = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Control_Switch: TControl_Switch;

implementation

{$R *.dfm}

procedure TControl_Switch.BitBtn1Click(Sender: TObject);
begin
  if RadioButton1.Checked or RadioButton2.Checked then
    ModalResult := mrOk
  else
    messagebox(handle,'请选择反控接头的状态!','提示',mb_ok + mb_iconinformation);
end;

end.
