unit ControlCarFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrmUnit, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TControlCarFrm = class(TBaseFrm)
    RadioOil: TRadioGroup;
    RadioElect: TRadioGroup;
    RadioDoor: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ControlCarFrm: TControlCarFrm;

implementation
uses uFrmSelectDevs,Carunit,uGloabVar,ConstDefineUnit;
{$R *.dfm}

procedure TControlCarFrm.BitBtn1Click(Sender: TObject);
var
  i,j:integer;
  D:TDevice;
  Control: Integer;
  ControlCmd: Integer;
begin
  try
    ProgressBar1.Visible:=true;
    ProgressBar1.Max:=ListView1.Items.Count*5*10;
    TbitBtn(Sender).Enabled:=false;
//    if RadioButton1.Checked then
//    begin
//      Control := 0;
//      ControlCmd := RadioOil.ItemIndex;
//    end
//    else if RadioButton2.Checked then
//    begin
//      Control := 1;
//      ControlCmd := RadioElect.ItemIndex;
//    end
//    else if RadioButton3.Checked then
//    begin
      Control := 2;
      ControlCmd := RadioDoor.ItemIndex;
//    end;
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
      DataServer.SendControlCar_V3(D, Control, ControlCmd);
      ProgressBar1.StepIt;
      ProgressBar1.StepIt;
      //Sleep(50);
      //Application.ProcessMessages;
    end;
  finally
    ProgressBar1.Visible:=False;
    TbitBtn(Sender).Enabled:=true;
  end;
 Close;
end;

procedure TControlCarFrm.RadioButton1Click(Sender: TObject);
begin
  if RadioButton1.Checked then
  begin
    RadioOil.Enabled := True;
    RadioElect.Enabled := False;
    RadioDoor.Enabled := False;
  end;
end;

procedure TControlCarFrm.RadioButton2Click(Sender: TObject);
begin
  if RadioButton2.Checked then
  begin
    RadioOil.Enabled := False;
    RadioElect.Enabled := True;
    RadioDoor.Enabled := False;
  end;
end;

procedure TControlCarFrm.RadioButton3Click(Sender: TObject);
begin
  if RadioButton3.Checked then
  begin
    RadioOil.Enabled := False;
    RadioElect.Enabled := False;
    RadioDoor.Enabled := True;
  end;
end;

end.
