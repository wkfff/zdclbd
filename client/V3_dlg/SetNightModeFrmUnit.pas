unit SetNightModeFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrmUnit, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TSetNightModeFrm = class(TBaseFrm)
    Label1: TLabel;
    Label2: TLabel;
    beginTime: TDateTimePicker;
    endTime: TDateTimePicker;
    GroupBox1: TGroupBox;
    CheckBox3: TCheckBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SetNightModeFrm: TSetNightModeFrm;

implementation
uses uFrmSelectDevs,Carunit,uGloabVar,ConstDefineUnit;
{$R *.dfm}

procedure TSetNightModeFrm.BitBtn1Click(Sender: TObject);
var
  i,j:integer;
  D:TDevice;
  ShuXing: Integer;
begin
  try
    ShuXing := 0;
    PanProgress.Visible:=true;
    ProgressBar1.Max:=ListView1.Items.Count*5*10;
    TbitBtn(Sender).Enabled:=false;
    if RadioButton1.Checked then
      ShuXing := 0;
    if RadioButton2.Checked then
      ShuXing := 4;
    if CheckBox3.Checked then
      ShuXing := ShuXing + 8;
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

      DataServer.SendSetNightMode_v3(D, FormatDatetime('yyyy-mm-dd hh:nn:ss',beginTime.DateTime),
                                    FormatDatetime('yyyy-mm-dd hh:nn:ss',endTime.DateTime), ShuXing);

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
