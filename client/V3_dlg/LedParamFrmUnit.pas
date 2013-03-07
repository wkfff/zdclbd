unit LedParamFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrmUnit, ComCtrls, StdCtrls, Buttons, ExtCtrls, CmdStructUnit,
  DateUtils, LsSysUnit, MemFormatUnit, Carunit;

type
  TLedParamFrm = class(TBaseFrm)
    Panel8: TPanel;
    GroupBox1: TGroupBox;
    CheckBox3: TCheckBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
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
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    BeginDate: TDateTimePicker;
    beginTime: TEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    Label26: TLabel;
    Edit25: TEdit;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    RadioGroup3: TRadioGroup;
    RadioGroup4: TRadioGroup;
    Label27: TLabel;
    Edit26: TEdit;
    RadioGroup5: TRadioGroup;
    RadioGroup6: TRadioGroup;
    RadioGroup7: TRadioGroup;
    RadioGroup8: TRadioGroup;
    RadioGroup9: TRadioGroup;
    BitBtn4: TBitBtn;
    SaveDialog1: TSaveDialog;
    Label28: TLabel;
    editFilePath: TEdit;
    SpeedButton1: TSpeedButton;
    BitBtn5: TBitBtn;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    editYear: TEdit;
    editMonth: TEdit;
    editDay: TEdit;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit4KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit5KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit6KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit7KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit8KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit9KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit10KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit12KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit11KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit13KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit15KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit18KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit19KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit14KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit16KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit17KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure beginTimeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit25KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure editMonthKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editDayKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    Param: string;
    MeterParam: TMeterParam_V3;
    procedure SetEdit(Edit: TEdit);
    procedure SetEdit2(Edit: TEdit);
    procedure GetMeterParam();

    procedure ShowParam(dev: TDevice);

    procedure InitDateTime();    
  end;

var
  LedParamFrm: TLedParamFrm;
  SendBuf: array[0..127] of Byte;

implementation
uses uFrmSelectDevs,uGloabVar,ConstDefineUnit;
{$R *.dfm}

function IntToBCD(Value: Integer): TDEV_ID_BCD_V3; //将整形数转换为BCD码
var
  BCD: TDEV_ID_BCD_V3;
  i,j: Integer;
  temp: string;
begin
  BCD[0] := MAC_TYPE;
  temp := FormatCurr('000000', Value);
  j := 1;
  for i:=0 to 2 do
  begin
    BCD[j] := StrToInt('$' + copy(temp,i*2+1,2));
    j := j+1;
  end;
  Result := BCD;
end;

function WordToBCD(Value: Word): Variant;
var
  BCD: array of Byte;
  i,j: Integer;
  temp: string;
begin
  SetLength(BCD, 2);
  temp := FormatCurr('0000', Value);
  j := 0;
  for i:=0 to 1 do
  begin
    BCD[j] := StrToInt('$' + copy(temp,i*2+1,2));
    j := j+1;
  end;
  Result := BCD;
end;

function ByteToBCD(Value: Byte): Variant;
var
  BCD: array of Byte;
  temp: string;
begin
  SetLength(BCD, 1);
  temp := FormatCurr('00', Value);
  BCD[0] := StrToInt('$' + temp);
  Result := BCD;
end;

function TextToBCD(Value: string; split: string): Variant;
var
  i: Integer;
  BCD: array of Byte;
begin
  SetLength(BCD, 2);
  i := Pos(split, Value);
  if i > 0 then
  begin
    BCD[0] := ByteToBCD(StringToInteger(Copy(Value, 1, 2)))[0];
    BCD[1] := ByteToBCD(StringToInteger(Copy(Value, i+1, 2)))[0];
  end
  else
  begin
    BCD[0] := ByteToBCD(StringToInteger(Copy(Value, 1, 2)))[0];
    BCD[1] := 0;
  end;
  Result := BCD;
end;

procedure TLedParamFrm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#8, '0'..'9', #22, '.', ':']) then Key := #0;
end;

procedure TLedParamFrm.SetEdit2(Edit: TEdit);
begin
 if Length(Edit.Text) = 2 then
 begin
   Edit.Text := Edit.Text + ':';
   Edit.SelStart := 3;
 end;
end;

procedure TLedParamFrm.SetEdit(Edit: TEdit);
begin
  if Length(Edit.Text) = 2 then
  begin
    Edit.Text := Edit.Text + '.';
    Edit.SelStart := 3;
  end;
end;

procedure TLedParamFrm.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  SetEdit(Edit1);
end;

procedure TLedParamFrm.Edit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  SetEdit(Edit2);
end;

procedure TLedParamFrm.Edit3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  SetEdit(Edit3);

end;

procedure TLedParamFrm.Edit4KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  SetEdit(Edit4);

end;

procedure TLedParamFrm.Edit5KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  SetEdit(Edit5);

end;

procedure TLedParamFrm.Edit6KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  SetEdit(Edit6);

end;

procedure TLedParamFrm.Edit7KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  SetEdit(Edit7);

end;

procedure TLedParamFrm.Edit8KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  SetEdit(Edit8);

end;

procedure TLedParamFrm.Edit9KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  SetEdit(Edit9);

end;

procedure TLedParamFrm.Edit10KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  SetEdit(Edit10);

end;

procedure TLedParamFrm.Edit12KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  SetEdit(Edit12);

end;

procedure TLedParamFrm.Edit11KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  SetEdit(Edit11);
end;

procedure TLedParamFrm.Edit13KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  SetEdit(Edit13);
end;

procedure TLedParamFrm.Edit15KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  SetEdit(Edit15);
end;

procedure TLedParamFrm.Edit18KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  SetEdit(Edit18);
end;

procedure TLedParamFrm.Edit19KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  SetEdit(Edit19);
end;

procedure TLedParamFrm.BitBtn1Click(Sender: TObject);
var
  i,j:integer;
  D:TDevice;
  ShuXing: Integer;
  buf, param: array[0..127] of Byte;
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

    FillChar(buf, SizeOf(buf), 0);
    FillChar(param, SizeOf(param), 0);

    GetMeterParam;
    CopyMemory(@param[0], @MeterParam, 128);
    for i:=0 to 127 do
    begin
      buf[i] := PassKey[i] xor param[i];
    end;

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

      DataServer.SendMeterParam_V3_NJTY(D, ShuXing, @buf[0]);

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

procedure TLedParamFrm.GetMeterParam;
var
  temp: array of Byte;
  i: Integer;
  crcBuf: word;
  buf, param: array[0..127] of Byte;
begin
  SetLength(temp, 2);
  temp := WordToBCD(StringToInteger(editYear.Text));//yearof(BeginDate.Date));
  CopyMemory(@MeterParam.CSQYSJ[0], @temp[0], 2);

  SetLength(temp, 1);
  temp := ByteToBCD(StringToInteger(editMonth.Text));//MonthOf(BeginDate.Date));
  CopyMemory(@MeterParam.CSQYSJ[2], @temp[0], 1);

  SetLength(temp, 1);
  temp := ByteToBCD(StringToInteger(editDay.Text));//DayOf(BeginDate.Date));
  CopyMemory(@MeterParam.CSQYSJ[3], @temp[0], 1);

  SetLength(temp, 1);
  temp := ByteToBcd(StringToInteger(beginTime.Text));
  CopyMemory(@MeterParam.CSQYSJ[4], @temp[0], 1);

  SetLength(temp, 2);
  temp := TextToBCD(Edit1.Text, '.');
  CopyMemory(@MeterParam.BTWFDJ[0], @temp[0], 2);


  SetLength(temp, 2);
  temp := TextToBCD(Edit2.Text, '.');
  CopyMemory(@MeterParam.YJWFDJ[0], @temp[0], 2);

  SetLength(temp, 2);
  temp := TextToBCD(Edit19.Text, '.');
  CopyMemory(@MeterParam.BTDCDJ[0], @temp[0], 2);

  SetLength(temp, 2);
  temp := TextToBCD(Edit3.Text, '.');
  CopyMemory(@MeterParam.YJDCDJ[0], @temp[0], 2);

  SetLength(temp, 2);
  temp := TextToBCD(Edit4.Text, '.');
  CopyMemory(@MeterParam.BTECKTDJ[0], @temp[0], 2);

  SetLength(temp, 2);
  temp := TextToBCD(Edit5.Text, '.');
  CopyMemory(@MeterParam.YJECKTDJ[0], @temp[0], 2);

  SetLength(temp, 2);
  temp := TextToBCD(Edit6.Text, '.');
  CopyMemory(@MeterParam.BTQBJ[0], @temp[0], 2);

  SetLength(temp, 2);
  temp := TextToBCD(Edit7.Text, '.');
  CopyMemory(@MeterParam.YJQBJ[0], @temp[0], 2);

  SetLength(temp, 2);
  temp := TextToBCD(Edit8.Text, '.');
  CopyMemory(@MeterParam.XCGLS[0], @temp[0], 2);

  SetLength(temp, 2);
  temp := TextToBCD(Edit9.Text, '.');
  CopyMemory(@MeterParam.QCGL[0], @temp[0], 2);

  SetLength(temp, 2);
  temp := TextToBCD(Edit10.Text, '.');
  CopyMemory(@MeterParam.DCGL[0], @temp[0], 2);

  SetLength(temp, 2);
  temp := TextToBCD(Edit11.Text, '.');
  CopyMemory(@MeterParam.ECKTGL[0], @temp[0], 2);

  SetLength(temp, 2);
  temp := TextToBCD(Edit12.Text, '.');
  CopyMemory(@MeterParam.BTDHSJDJ[0], @temp[0], 2);

  SetLength(temp, 2);
  temp := TextToBCD(Edit13.Text, '.');
  CopyMemory(@MeterParam.YJDHSJDJ[0], @temp[0], 2);

  SetLength(temp, 2);
  temp := TextToBCD(Edit14.Text, '.');
  CopyMemory(@MeterParam.MFDHSJ[0], @temp[0], 2);

  SetLength(temp, 2);
  temp := TextToBCD(Edit15.Text, '.');
  CopyMemory(@MeterParam.JJSJ[0], @temp[0], 2);

  SetLength(temp, 2);
  temp := TextToBCD(Edit16.Text, ':');
  CopyMemory(@MeterParam.YJKSSJ[0], @temp[0], 2);

  SetLength(temp, 2);
  temp := TextToBCD(Edit17.Text, ':');
  CopyMemory(@MeterParam.YJJSSJ[0], @temp[0], 2);

  SetLength(temp, 2);
  temp := TextToBCD(Edit18.Text, '.');
  CopyMemory(@MeterParam.FJF[0], @temp[0], 2);

  
  SetLength(temp, 2);
  temp := TextToBCD(Edit20.Text, ':');
  CopyMemory(@MeterParam.DTSJQLKSSJ[0], @temp[0], 2);

  SetLength(temp, 2);
  temp := TextToBCD(Edit21.Text, '.');
  CopyMemory(@MeterParam.QXMDLC[0], @temp[0], 2);

  SetLength(temp, 2);
  temp := TextToBCD(Edit22.Text, '.');
  CopyMemory(@MeterParam.QHSD[0], @temp[0], 2);

  SetLength(temp, 2);
  temp := TextToBCD(Edit23.Text, '.');
  CopyMemory(@MeterParam.CCSJ[0], @temp[0], 2);

  SetLength(temp, 2);
  temp := TextToBCD(Edit24.Text, '.');
  CopyMemory(@MeterParam.CDSJ[0], @temp[0], 2);

  MeterParam.byte74 := StringToInteger(Trim(Edit25.Text));

  MeterParam.byte75 := RadioGroup1.ItemIndex*16 + RadioGroup2.ItemIndex;

  MeterParam.byte76 := RadioGroup3.ItemIndex*16 + RadioGroup4.ItemIndex;

  MeterParam.byte77 := StringToInteger(Trim(Edit26.Text));

  MeterParam.byte78 := RadioGroup5.ItemIndex*16 + RadioGroup6.ItemIndex;

  MeterParam.byte79 := RadioGroup7.ItemIndex*16;
  case RadioGroup8.ItemIndex of
    0: MeterParam.byte79 := MeterParam.byte79 + $01;
    1: MeterParam.byte79 := MeterParam.byte79 + $02;
    2: MeterParam.byte79 := MeterParam.byte79 + $04;
    3: MeterParam.byte79 := MeterParam.byte79 + $08;
  end;

  MeterParam.byte80 := RadioGroup9.ItemIndex + $10;

  crcBuf := BigTSmall_Word(GetCrcSum(@MeterParam, SizeOf(MeterParam)-2));
  MeterParam.CRC :=crcBuf;

  {CopyMemory(@param[0], @MeterParam, 128);
  for i:=0 to 127 do
  begin
    buf[i] := PassKey[i] xor param[i];
  end;
  crcBuf := GetCrcSum(@MeterParam, SizeOf(buf)-2);
  CopyMemory(@buf[126], @crcBuf, 2);
  CopyMemory(@SendBuf[0], @buf[0], 128); }

end;

procedure TLedParamFrm.Edit14KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  SetEdit(Edit14);

end;

procedure TLedParamFrm.Edit16KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  SetEdit2(Edit16);

end;

procedure TLedParamFrm.Edit17KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  SetEdit2(Edit17);

end;

procedure TLedParamFrm.beginTimeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Length(Trim(beginTime.Text)) > 0 then
    if StrToInt(Trim(beginTime.Text)) > 23 then
      beginTime.Text := '23';

end;

procedure TLedParamFrm.Edit25KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in [#8, '0'..'9', #22]) then Key := #0;
end;

procedure TLedParamFrm.BitBtn4Click(Sender: TObject);
var
  i: Integer;
  buf, param: array[0..127] of Byte;

  paramStr: string;

  fs: TFileStream;
  fileName: string;
begin
  try


    FillChar(buf, SizeOf(buf), 0);
    FillChar(param, SizeOf(param), 0);

    GetMeterParam;
    CopyMemory(@param[0], @MeterParam, 128);
    for i:=0 to 127 do
    begin
      buf[i] := PassKey[i] xor param[i];
    end;

    paramStr := MemFormatUnit.BuffToHex(@buf[0], SizeOf(buf));


    try
      fileName := '';
      if SaveDialog1.Execute  then
      begin
        fileName := SaveDialog1.FileName;
      end;
      fs := TFileStream.Create(fileName, fmCreate or fmOpenReadWrite);
      try

          fs.Write(paramStr[1], Length(paramStr));
          MessageBox(Handle,'写文件成功！' ,'提示', mb_ok + MB_ICONINFORMATION);

      except
        on e: Exception do
        begin
          MessageBox(Handle,'写文件出现错误！' ,'提示', mb_ok + MB_ICONERROR);
        end;
      end;
    finally
      // 数据写完后立即清空TList容器中的内容，否则下次写时会将历史记录再写到文件中
      fs.Free;
    end;
  finally

  end;

end;

procedure TLedParamFrm.SpeedButton1Click(Sender: TObject);
var
  dlg: TOpenDialog;
  filePath: string;
begin
  dlg := TOpenDialog.Create(self);
  try
   if dlg.Execute then
    begin

      filePath := dlg.FileName;
      editFilePath.Text := filePath;

    end;
  finally
    dlg.Free;
  end;
end;

procedure TLedParamFrm.BitBtn5Click(Sender: TObject);
var
  D: TDevice;
  i: Integer;
begin
  if Trim(editFilePath.Text) = '' then
  begin
    messagebox(handle, '请选择参数文件', '提示', mb_ok + mb_iconinformation);
    editFilePath.SetFocus;
    Exit;
  end;
  if not FileExists(Trim(editFilePath.Text)) then
  begin
    messagebox(handle, '参数文件不存在', '提示', mb_ok + mb_iconinformation);
    editFilePath.SetFocus;
    Exit;
  end;
  
  try
    if ListView1.Items.Item[0].Data = nil then Exit;

    Param := '';
    Param := OpenFile(editFilePath.Text);

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

      D:=TDevice(ListView1.Items.Item[0].Data);

      DataServer.SendMeterParam_V3_New(D, Param);

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

procedure TLedParamFrm.ShowParam(dev: TDevice);
  procedure BCDToText(Value: PByte; split: string; Edit: TEdit);
  var
    i: Integer;
    temp: string;
  begin

    temp:=temp+InttoHex(Value^,2);
    inc(Value);
    temp := temp + split;

    temp := temp + IntToHex(Value^, 2);

    Edit.Text := temp;
  end;
var
  pParam: TMeterParam_V3;
  DateTime: TDateTime;
  year: Integer;
  month: Word;
  day: Word;
  hour: Word;
  temp: Byte;

  i: Integer;
  buf, param: array[0..127] of byte;

  crcBuf: word;
begin

  //if dev.MeterParam = nil then
  //  Exit;

  pParam := dev.MeterParam; //PMeterParam_V3(dev.MeterParam);


  year := StrToInt(IntToHex(pParam.CSQYSJ[0], 2)
                  + IntToHex(pParam.CSQYSJ[1], 2));

  month := StrToInt(IntToHex(pParam.CSQYSJ[2], 2));
  day := StrToInt(IntToHex(pParam.CSQYSJ[3], 2));
  hour := StrToInt(IntToHex(pParam.CSQYSJ[4], 2));
  //if year = 0 then
  //  year := 2000;
  //if month = 0 then
  //  month := 1;
  //if day = 0 then
  //  day := 1;
  //try
  //  BeginDate.DateTime := EncodeDateTime(year, month, day, 0, 0, 0, 0);
  //except
  //  BeginDate.DateTime := StrToDateTime('2000-01-01 01:01:01');
  //end;
  editYear.Text := IntToStr(year);
  editMonth.Text := IntToStr(month);
  editDay.Text := IntToStr(day);
  beginTime.Text := IntToStr(hour);

  BCDToText(@pParam.BTWFDJ[0], '.', Edit1);
  BCDToText(@pParam.YJWFDJ[0], '.', Edit2);
  BCDToText(@pParam.BTDCDJ[0], '.', Edit19);
  BCDToText(@pParam.YJDCDJ[0], '.', Edit3);
  BCDToText(@pParam.BTECKTDJ[0], '.', Edit4);
  BCDToText(@pParam.YJECKTDJ[0], '.', Edit5);
  BCDToText(@pParam.BTQBJ[0], '.', Edit6);
  BCDToText(@pParam.YJQBJ[0], '.', Edit7);
  BCDToText(@pParam.XCGLS[0], '.', Edit8);
  BCDToText(@pParam.QCGL[0], '.', Edit9);
  BCDToText(@pParam.DCGL[0], '.', Edit10);
  BCDToText(@pParam.ECKTGL[0], '.', Edit11);
  BCDToText(@pParam.BTDHSJDJ[0], '.', Edit12);
  BCDToText(@pParam.YJDHSJDJ[0], '.', Edit13);
  BCDToText(@pParam.MFDHSJ[0], '.', Edit14);
  BCDToText(@pParam.JJSJ[0], '.', Edit15);
  BCDToText(@pParam.YJKSSJ[0], ':', Edit16);
  BCDToText(@pParam.YJJSSJ[0], ':', Edit17);
  BCDToText(@pParam.FJF[0], '.', Edit18);


  // 以下是南京通用计价器扩展参数
  BCDToText(@pParam.DTSJQLKSSJ[0], ':', Edit20);
  BCDToText(@pParam.QXMDLC[0], '.', Edit21);
  BCDToText(@pParam.QHSD[0], '.', Edit22);
  BCDToText(@pParam.CCSJ[0], '.', Edit23);
  BCDToText(@pParam.CDSJ[0], '.', Edit24);

  Edit25.Text := IntToStr(pParam.byte74);

  temp := pParam.byte75;
  RadioGroup1.ItemIndex := temp div 16;
  RadioGroup2.ItemIndex := temp mod 16;

  temp := pParam.byte76;
  RadioGroup3.ItemIndex := temp div 16;
  RadioGroup4.ItemIndex := temp mod 16;

  Edit26.Text := IntToStr(pParam.byte77);

  temp := pParam.byte78;
  RadioGroup5.ItemIndex := temp div 16;
  RadioGroup6.ItemIndex := temp mod 16;

  temp := pParam.byte79;
  RadioGroup7.ItemIndex := temp div 16;
  case temp mod 16 of
    $01: RadioGroup8.ItemIndex := 0;
    $02: RadioGroup8.ItemIndex := 1;
    $04: RadioGroup8.ItemIndex := 2;
    $08: RadioGroup8.ItemIndex := 3;
  end;

  temp :=  pParam.byte80-$10;
  RadioGroup9.ItemIndex := temp;
end;

procedure TLedParamFrm.ListView1Click(Sender: TObject);
begin
  if ListView1.Selected <> nil then
    ShowParam(TDevice(ListView1.Selected.Data));
end;

procedure TLedParamFrm.FormShow(Sender: TObject);
begin
  inherited;
  //InitDateTime;
  if ListView1.Items.Count > 0 then
   begin
     Listview1.Items.Item[0].Selected:=true;
     ListView1.SetFocus;
     ListView1Click(nil);
   end;
end;

procedure TLedParamFrm.InitDateTime;
var
  d: TDateTime;
  i: Integer;
  year, month, day, hour: integer;
begin
  {d := Now;

  year := YearOf(d);
  for i:=-2 to 5 do
  begin
    ComboBox1.Items.Add(IntToStr(year + i));
  end;
  ComboBox1.Text := IntToStr(year);

  month := MonthOf(d);

  for i:=1 to 12 do
  begin
    ComboBox2.Items.Add(IntToStr(i));
  end;
  ComboBox2.Text := IntToStr(month);

  day := DayOf(d);

  for i:=1 to 31 do
  begin
    ComboBox3.Items.Add(IntToStr(i));
  end;
  ComboBox3.Text := IntToStr(day);

  hour := HourOf(d);
  beginTime.Text := IntToStr(hour);     }

end;

procedure TLedParamFrm.editMonthKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Length(Trim(editMonth.Text)) > 0 then
    if StrToInt(Trim(editMonth.Text)) > 12 then
      editMonth.Text := '12';
end;

procedure TLedParamFrm.editDayKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Length(Trim(editDay.Text)) > 0 then
    if StrToInt(Trim(editDay.Text)) > 31 then
      editDay.Text := '31';
end;

end.
