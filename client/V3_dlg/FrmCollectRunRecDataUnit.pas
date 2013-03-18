unit FrmCollectRunRecDataUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrmUnit, ComCtrls, StdCtrls, Buttons, ExtCtrls, Mask,
  RzEdit, RzSpnEdt, RzDTP, RzCmboBx, Types;

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
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    CheckBox18: TCheckBox;
    CheckBox19: TCheckBox;
    CheckBox20: TCheckBox;
    CheckBox21: TCheckBox;
    CheckBox22: TCheckBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    sDate: TRzDateTimePicker;
    sTime: TRzDateTimePicker;
    eDate: TRzDateTimePicker;
    eTime: TRzDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    edtDataBlockCount: TRzSpinEdit;
    CheckBox23: TCheckBox;
    CheckBox24: TCheckBox;
    CheckBox25: TCheckBox;
    CheckBox26: TCheckBox;
    CheckBox27: TCheckBox;
    CheckBox28: TCheckBox;
    CheckBox29: TCheckBox;
    CheckBox30: TCheckBox;
    Label4: TLabel;
    RzComboBox1: TRzComboBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RzComboBox1Change(Sender: TObject);
  private
    { Private declarations }
    function GetParamData: TByteDynArray;
    procedure InitParams;
  public
    { Public declarations }
  end;

var
  frmCollectRunRecData: TfrmCollectRunRecData;

implementation
uses
  uGloabVar, CarUnit, DateUtils, CmdStructUnit;

{$R *.dfm}

procedure TfrmCollectRunRecData.BitBtn1Click(Sender: TObject);

var
  i,j:integer;
  dev:TDevice;
  emptyParamData: TByteDynArray;
  paramData: TByteDynArray;
begin
  try
    PanProgress.Visible := True;
    ProgressBar1.Max:=ListView1.Items.Count*5*10;
    TbitBtn(Sender).Enabled:=false;
    SetLength(emptyParamData, 0);
    paramData := GetParamData;
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
        if Notebook1.PageIndex = 0 then
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
        else if Notebook1.PageIndex = 1 then
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
        end
        else if Notebook1.PageIndex = 1 then
        begin
          SetLength(paramData, 0);

          if CheckBox15.Checked then
           DataServer.SendCollectRunRecData(dev, $00, emptyParamData);
          if CheckBox16.Checked then
            DataServer.SendCollectRunRecData(dev, $01, emptyParamData);
          if CheckBox17.Checked then
            DataServer.SendCollectRunRecData(dev, $02, emptyParamData);
          if CheckBox18.Checked then
            DataServer.SendCollectRunRecData(dev, $03, emptyParamData);
          if CheckBox19.Checked then
            DataServer.SendCollectRunRecData(dev, $04, emptyParamData);
          if CheckBox20.Checked then
            DataServer.SendCollectRunRecData(dev, $05, emptyParamData);
          if CheckBox21.Checked then
            DataServer.SendCollectRunRecData(dev, $06, emptyParamData);
          if CheckBox22.Checked then
            DataServer.SendCollectRunRecData(dev, $07, emptyParamData);

          if CheckBox23.Checked then
            DataServer.SendCollectRunRecData(dev, $08, paramData);
          if CheckBox24.Checked then
            DataServer.SendCollectRunRecData(dev, $09, paramData);
          if CheckBox25.Checked then
            DataServer.SendCollectRunRecData(dev, $10, paramData);
          if CheckBox26.Checked then
            DataServer.SendCollectRunRecData(dev, $11, paramData);
          if CheckBox27.Checked then
            DataServer.SendCollectRunRecData(dev, $12, paramData);
          if CheckBox28.Checked then
            DataServer.SendCollectRunRecData(dev, $13, paramData);
          if CheckBox29.Checked then
            DataServer.SendCollectRunRecData(dev, $14, paramData);
          if CheckBox30.Checked then
            DataServer.SendCollectRunRecData(dev, $15, paramData);
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
  InitParams;
  Notebook1.PageIndex := RzComboBox1.ItemIndex + 1;
end;

function TfrmCollectRunRecData.GetParamData: TByteDynArray;
var
  paramData: TByteDynArray;
  startDt, endDt: TDateTime;
  blockCount: Word;
begin
  SetLength(paramData, 14);

  paramData[0] := ByteToBCD(YearOf(startDt) - 2000);
  paramData[1] := ByteToBCD(MonthOfTheYear(startDt));
  paramData[2] := ByteToBCD(DayOfTheMonth(startDt));
  paramData[3] := ByteToBCD(HourOfTheDay(startDt));
  paramData[4] := ByteToBCD(MinuteOfTheHour(startDt));
  paramData[5] := ByteToBCD(SecondOfTheMinute(startDt));

  paramData[6] := ByteToBCD(YearOf(endDt) - 2000);
  paramData[7] := ByteToBCD(MonthOfTheYear(endDt));
  paramData[8] := ByteToBCD(DayOfTheMonth(endDt));
  paramData[9] := ByteToBCD(HourOfTheDay(endDt));
  paramData[10] := ByteToBCD(MinuteOfTheHour(endDt));
  paramData[11] := ByteToBCD(SecondOfTheMinute(endDt));

  blockCount := edtDataBlockCount.IntValue;
  blockCount := ByteOderConvert_Word(blockCount);
  CopyMemory(@paramData[12], @blockCount, 2);
  Result := paramData;
end;

procedure TfrmCollectRunRecData.InitParams;
var
  d: TDateTime;
begin
  d := Now;
  eDate.DateTime := d;
  eTime.DateTime := d;

  d := IncHour(d, -5);
  sDate.DateTime := d;
  sTime.DateTime := d;

  edtDataBlockCount.Value := 5;
end;

procedure TfrmCollectRunRecData.RzComboBox1Change(Sender: TObject);
begin
  Notebook1.PageIndex := RzComboBox1.ItemIndex + 1;
end;

end.
