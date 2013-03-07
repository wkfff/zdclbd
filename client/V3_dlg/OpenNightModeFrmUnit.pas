unit OpenNightModeFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrmUnit, StdCtrls, ComCtrls, Buttons, ExtCtrls;

type
  TOpenNightModeFrm = class(TBaseFrm)
    CheckBox4: TCheckBox;
    GroupBox1: TGroupBox;
    CheckBox3: TCheckBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure CheckBox4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OpenNightModeFrm: TOpenNightModeFrm;

implementation
uses uFrmSelectDevs,Carunit,uGloabVar,ConstDefineUnit;
{$R *.dfm}

procedure TOpenNightModeFrm.CheckBox4Click(Sender: TObject);
begin
  inherited;
  if CheckBox4.Checked then
    CheckBox4.Caption := '开启'
  else
    CheckBox4.Caption := '关闭';
end;

procedure TOpenNightModeFrm.BitBtn1Click(Sender: TObject);
var
  i,j:integer;
  D:TDevice;
  ShuXing: Integer;
  Res: Byte;
begin
  try
    ShuXing := 0;
    Res := $00;
    PanProgress.Visible:=true;
    ProgressBar1.Max:=ListView1.Items.Count*5*10;
    TbitBtn(Sender).Enabled:=false;
    if RadioButton1.Checked then
      ShuXing := 0;
    if RadioButton2.Checked then
      ShuXing := 4;
    if CheckBox3.Checked then
      ShuXing := ShuXing + 8;
    if CheckBox4.Checked  then
      Res := $01;

    for i:=0 to ListView1.Items.Count -1 do
    begin
      if Cancel then
      begin
        if messagebox(handle, '是否确实要取消对剩余车辆的操作？', '提示', MB_YESNO + MB_ICONQUESTION) = ID_YES then
        begin
          Close;
          Exit;
        end
        else
        begin
          Cancel := False;
        end;
      end;
      D:=TDevice(ListView1.Items.Item[i].Data);
      ProgressBar1.StepIt;


      ProgressBar1.StepIt;
      DataServer.SendOpenNightMode_v3(D, ShuXing, Res);
      ProgressBar1.StepIt;
      ProgressBar1.StepIt;
      //Sleep(50);
      Application.ProcessMessages;
    end;
  finally
    PanProgress.Visible:=False;
    TbitBtn(Sender).Enabled:=true;
  end;
 Close;
end;

end.
