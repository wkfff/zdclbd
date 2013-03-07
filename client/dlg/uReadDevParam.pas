unit uReadDevParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Mask;

type
  TReadDevParam = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    BitBtn3: TBitBtn;
    RB_Basic: TRadioButton;
    GroupBox1: TGroupBox;
    RB_DevID: TRadioButton;
    RB_devNo: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    RB_else: TRadioButton;
    GroupBox2: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    GroupBox3: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    RB_KeyPressTelNum: TRadioButton;
    Label15: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReadDevParam: TReadDevParam;

implementation

{$R *.dfm}

end.
