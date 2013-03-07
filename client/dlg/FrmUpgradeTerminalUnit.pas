unit FrmUpgradeTerminalUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FrmBaseUnit, ComCtrls, RzButton, ExtCtrls, RzPanel, StdCtrls,
  RzCmboBx;

type
  TfrmBase1 = class(TfrmBase)
    RzGroupBox1: TRzGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    RzComboBox1: TRzComboBox;
    RzComboBox2: TRzComboBox;
    RzComboBox3: TRzComboBox;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBase1: TfrmBase1;

implementation

{$R *.dfm}

end.
