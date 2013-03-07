unit FrmDealEmgcyAlarmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrmUnit, StdCtrls, ExtCtrls, ComCtrls, Buttons;

type
  TfrmDealEmgcyAlarm = class(TBaseFrm)
    RadioGroup1: TRadioGroup;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  uGloabVar, CarUnit;

{$R *.dfm}

procedure TfrmDealEmgcyAlarm.BitBtn1Click(Sender: TObject);
var
  i,j:integer;
  D:TDevice;
begin
  if ListView1.Items.Count <= 0 then
    messagebox(handle, '请选择需处理的车辆', '提示', MB_OK + MB_ICONINFORMATION);

  try
    PanProgress.Visible:=true;
    ProgressBar1.Max:=ListView1.Items.Count*5*10;
    TbitBtn(Sender).Enabled:=false;
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
      DataServer.SendEmergencyAlarmDeal(D, RadioGroup1.ItemIndex);
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
