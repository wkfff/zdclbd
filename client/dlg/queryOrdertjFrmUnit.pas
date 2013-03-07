unit queryOrdertjFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  Tqueryordertjfrm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    ComboBox1: TComboBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Edit1: TEdit;
    Label3: TLabel;
    DateTimePicker3: TDateTimePicker;
    Label6: TLabel;
    DateTimePicker4: TDateTimePicker;
    CheckBox1: TCheckBox;
    Label7: TLabel;
    GroupBox2: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label8: TLabel;
    ComboBoxCarNO: TComboBox;
    CheckBox2: TCheckBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  queryordertjfrm: Tqueryordertjfrm;

implementation
   uses uGloabVar,DateUtils;
{$R *.dfm}

procedure Tqueryordertjfrm.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure Tqueryordertjfrm.FormCreate(Sender: TObject);
var
  i : Integer;
begin
  DateTimePicker1.DateTime:=Now;
  DateTimePicker2.DateTime:=StrToTime('00:00:00');
  DateTimePicker3.DateTime:=now;
  DateTimePicker4.DateTime:=StrToTime('23:59:59');

  ComboBoxCarNO.Items.Clear;
  for i:=0 to ACarManage.Count - 1 do
  begin
    if ACarManage.Cars[i].No <> '' then
    begin
      ComboBoxCarNO.Items.Add(ACarManage.Cars[i].No);
    end;
  end;
  //for i:=0 to ACarNOManage.Count-1  do
  //begin
  //   if ACarNOManage.Cars[i].CarNO<>'' then
  //   ComboBoxCarNO.Items.Add(ACarNOManage.Cars[i].CarNO);
  //end;
end;

end.
