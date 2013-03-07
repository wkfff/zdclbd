unit FrmCollectRunRecDataUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrmUnit, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TfrmCollectRunRecData = class(TBaseFrm)
    GroupBox1: TGroupBox;
    Notebook1: TNotebook;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox0: TCheckBox;
    CheckBox_1: TCheckBox;
    CheckBox_2: TCheckBox;
    CheckBox_3: TCheckBox;
    CheckBox_4: TCheckBox;
    CheckBox_5: TCheckBox;
    CheckBox_6: TCheckBox;
    CheckBox_7: TCheckBox;
    CheckBox_8: TCheckBox;
    CheckBox_9: TCheckBox;
    CheckBox_11: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCollectRunRecData: TfrmCollectRunRecData;

implementation
uses
  uGloabVar, CarUnit;

{$R *.dfm}

procedure TfrmCollectRunRecData.BitBtn1Click(Sender: TObject);
var
  i,j:integer;
  dev:TDevice;
begin
  try
    PanProgress.Visible := True;
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
      dev:=TDevice(ListView1.Items.Item[i].Data);
      ProgressBar1.StepIt;
      if dev <> nil then
      begin
        if Notebook1.ActivePage = 'new' then
        begin
          if CheckBox0.Checked then
            DataServer.SendCollectRunRecData_V3(dev, $00);
          if CheckBox1.Checked then
            DataServer.SendCollectRunRecData_V3(dev, $01);
          if CheckBox2.Checked then
            DataServer.SendCollectRunRecData_V3(dev, $02);
          if CheckBox3.Checked then
            DataServer.SendCollectRunRecData_V3(dev, $03);
          if CheckBox4.Checked then
            DataServer.SendCollectRunRecData_V3(dev, $04);
          if CheckBox5.Checked then
            DataServer.SendCollectRunRecData_V3(dev, $05);
          if CheckBox6.Checked then
            DataServer.SendCollectRunRecData_V3(dev, $06);
          if CheckBox7.Checked then
            DataServer.SendCollectRunRecData_V3(dev, $07);
          if CheckBox8.Checked then
            DataServer.SendCollectRunRecData_V3(dev, $08);
          if CheckBox9.Checked then
            DataServer.SendCollectRunRecData_V3(dev, $09);
          if CheckBox10.Checked then
            DataServer.SendCollectRunRecData_V3(dev, $10);
          if CheckBox11.Checked then
            DataServer.SendCollectRunRecData_V3(dev, $11);
          if CheckBox12.Checked then
            DataServer.SendCollectRunRecData_V3(dev, $12);
          if CheckBox13.Checked then
            DataServer.SendCollectRunRecData_V3(dev, $13);
          if CheckBox14.Checked then
            DataServer.SendCollectRunRecData_V3(dev, $14);
        end
        else
        begin
          if CheckBox_1.Checked then
            DataServer.SendCollectRunRecData_V3(dev, $01);
          if CheckBox_2.Checked then
            DataServer.SendCollectRunRecData_V3(dev, $02);
          if CheckBox_3.Checked then
            DataServer.SendCollectRunRecData_V3(dev, $03);
          if CheckBox_4.Checked then
            DataServer.SendCollectRunRecData_V3(dev, $04);
          if CheckBox_5.Checked then
            DataServer.SendCollectRunRecData_V3(dev, $05);
          if CheckBox_6.Checked then
            DataServer.SendCollectRunRecData_V3(dev, $06);
          if CheckBox_7.Checked then
            DataServer.SendCollectRunRecData_V3(dev, $07);
          if CheckBox_8.Checked then
            DataServer.SendCollectRunRecData_V3(dev, $08);
          if CheckBox_9.Checked then
            DataServer.SendCollectRunRecData_V3(dev, $09);
          if CheckBox_11.Checked then
            DataServer.SendCollectRunRecData_V3(dev, $11);
        end;
      end;
      ProgressBar1.StepIt;
      ProgressBar1.StepIt;
      //Application.ProcessMessages;
    end;
  finally
    PanProgress.Visible:=False;
    TbitBtn(Sender).Enabled:=true;
  end;
  Close;
end;

procedure TfrmCollectRunRecData.FormShow(Sender: TObject);
begin
  Notebook1.PageIndex := 0;
end;

end.
