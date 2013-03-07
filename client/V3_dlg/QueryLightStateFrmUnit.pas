unit QueryLightStateFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrmUnit, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TQueryLightStateFrm = class(TBaseFrm)
    GroupBox1: TGroupBox;
    CheckBox2: TCheckBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    CheckBox4: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    QueryType: Byte;  // 0: 查询顶灯状态；1：查询LED状态；2：查询LCD状态；3：复位LCD；4：开启/关闭LCD
  end;

var
  QueryLightStateFrm: TQueryLightStateFrm;

implementation
uses uFrmSelectDevs,Carunit,uGloabVar,ConstDefineUnit;
{$R *.dfm}

procedure TQueryLightStateFrm.BitBtn1Click(Sender: TObject);
var
  i,j:integer;
  D:TDevice;
  ShuXing: Word;
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
    if CheckBox2.Checked then
      ShuXing := ShuXing + 8;

    if CheckBox4.Checked then
      Res := $00
    else
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
      case QueryType of
        0: DataServer.SendQueryLightState_V3(D, ShuXing);
        1: DataServer.SendQueryLedState_V3(D, ShuXing);
        2: DataServer.SendQueryLcdState_V3(D, ShuXing);
        3: DataServer.SendResetLCD_V3(D, ShuXing);
        4: DataServer.SendOpenLCD_V3(D, ShuXing, Res);
        5: DataServer.SendQueryMeterState_V3(D, ShuXing);
        6: DataServer.SendQueryTSMState_V3(D, ShuXing);
      end;
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

procedure TQueryLightStateFrm.CheckBox4Click(Sender: TObject);
begin
  if CheckBox4.Checked then
    CheckBox4.Caption := '开启'
  else
    CheckBox4.Caption := '关闭';

end;

procedure TQueryLightStateFrm.FormShow(Sender: TObject);
begin
  inherited;
  Label1.Caption := Panel7.Caption;
  Label2.Caption := Panel7.Caption;
end;

end.
