unit ReadMeterParamFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrmUnit, ComCtrls, StdCtrls, Buttons, ExtCtrls, DateUtils,
  LsSysUnit;

type
  TReadMeterParamFrm = class(TBaseFrm)
    Edit20: TEdit;
    Panel8: TPanel;
    Label21: TLabel;
    editFilePath: TEdit;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label6: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
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
    Edit26: TEdit;
    Edit27: TEdit;
    Edit28: TEdit;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    Edit25: TEdit;
    RadioGroup9: TRadioGroup;
    Label31: TLabel;
    Label32: TLabel;
    Edit29: TEdit;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    RadioGroup3: TRadioGroup;
    RadioGroup4: TRadioGroup;
    Edit30: TEdit;
    RadioGroup5: TRadioGroup;
    RadioGroup6: TRadioGroup;
    RadioGroup7: TRadioGroup;
    RadioGroup8: TRadioGroup;
    CheckBox1: TCheckBox;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    njty: Boolean;
    Param: string;
    procedure LoadParam(pBuf: PByte);
  end;

var
  ReadMeterParamFrm: TReadMeterParamFrm;
  param1: array[0..127] of Byte=($B1,$8D,$27,$5D,$7B,$DD,$8B,$D3,$90,$FA,$32,$B3,$96,$6B,$22,$BB,$E6,$C6,$5A,$4D,$4B,$AC,$3A,
$58,$EF,$23,$F8,$78,$87,$46,$D5,$B5,$FC,$3B,$C1,$70,$B1,$6F,$19,$DC,$A6,$E9,$30,$79,$9C,$C4,
$5B,$FB,$6B,$AA,$25,$1E,$C1,$4F,$63,$BC,$7A,$CC,$D0,$B1,$B1,$DB,$F0,$E5,$D2,$D8,$D3,$04,$CA,
$7E,$81,$37,$92,$46,$AB,$6C,$34,$69,$5B,$88,$83,$64,$53,$FD,$0E,$F7,$CB,$2B,$3C,$8A,$2F,$09,
$EB,$F6,$B0,$7F,$97,$85,$2D,$DA,$83,$3D,$42,$D9,$AA,$45,$2B,$B6,$AE,$72,$13,$9F,$0A,$CC,$A1,
$18,$96,$1D,$58,$A4,$B3,$5C,$86,$33,$2E,$F6,$2B,$8F);

implementation
uses uFrmSelectDevs,Carunit,uGloabVar,ConstDefineUnit, CmdStructUnit;
{$R *.dfm}

procedure TReadMeterParamFrm.BitBtn1Click(Sender: TObject);
var
  D: TDevice;
begin
  if ListView1.Items.Item[0].Data = nil then Exit;

  D:=TDevice(ListView1.Items.Item[0].Data);
  DataServer.SendReadMeterParam_V3(D);

end;

procedure TReadMeterParamFrm.LoadParam(pBuf: PByte);
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
  pParam: PMeterParam_V3;
  DateTime: TDateTime;
  year: Integer;
  month: Word;
  day: Word;
  hour: Word;
  temp: Byte;

  i: Integer;
  buf, param: array[0..127] of byte;

  crcBuf: word;
  Dev: TDevice;
begin

  if njty then
  begin
    CopyMemory(@param[0], pBuf, 128);

    for i:=0 to 127 do
    begin
      buf[i] := PassKey[i] xor param[i];
    end;
    pParam := PMeterParam_V3(@buf[0]);

    crcBuf := BigTSmall_Word(GetCrcSum(@buf[0], SizeOf(buf)-2));
    if pParam^.CRC <> crcBuf then
    begin
      Exit;
    end;

  end
  else
  begin
    pParam := PMeterParam_V3(pBuf);
  end;

  year := StrToInt(IntToHex(pParam^.CSQYSJ[0], 2)
                  + IntToHex(pParam^.CSQYSJ[1], 2));

  month := StrToInt(IntToHex(pParam^.CSQYSJ[2], 2));
  day := StrToInt(IntToHex(pParam^.CSQYSJ[3], 2));
  hour := StrToInt(IntToHex(pParam^.CSQYSJ[4], 2));
  //if year = 0 then
  //  year := 2000;
  //if month = 0 then
  //  month := 1;
  //if day = 0 then
  //  day := 1;
  //BeginDate.DateTime := EncodeDateTime(year, month, day, 0, 0, 0, 0);
  Edit26.Text := IntToStr(year);
  Edit27.Text := IntToStr(month);
  Edit28.Text := IntToStr(day);
  beginTime.Text := IntToStr(hour);

  BCDToText(@pParam^.BTWFDJ[0], '.', Edit1);
  BCDToText(@pParam^.YJWFDJ[0], '.', Edit2);
  BCDToText(@pParam^.BTDCDJ[0], '.', Edit19);
  BCDToText(@pParam^.YJDCDJ[0], '.', Edit3);
  BCDToText(@pParam^.BTECKTDJ[0], '.', Edit4);
  BCDToText(@pParam^.YJECKTDJ[0], '.', Edit5);
  BCDToText(@pParam^.BTQBJ[0], '.', Edit6);
  BCDToText(@pParam^.YJQBJ[0], '.', Edit7);
  BCDToText(@pParam^.XCGLS[0], '.', Edit8);
  BCDToText(@pParam^.QCGL[0], '.', Edit9);
  BCDToText(@pParam^.DCGL[0], '.', Edit10);
  BCDToText(@pParam^.ECKTGL[0], '.', Edit11);
  BCDToText(@pParam^.BTDHSJDJ[0], '.', Edit12);
  BCDToText(@pParam^.YJDHSJDJ[0], '.', Edit13);
  BCDToText(@pParam^.MFDHSJ[0], '.', Edit14);
  BCDToText(@pParam^.JJSJ[0], '.', Edit15);
  BCDToText(@pParam^.YJKSSJ[0], ':', Edit16);
  BCDToText(@pParam^.YJJSSJ[0], ':', Edit17);
  BCDToText(@pParam^.FJF[0], '.', Edit18);


  // 以下是南京通用计价器扩展参数
  BCDToText(@pParam^.DTSJQLKSSJ[0], ':', Edit21);
  BCDToText(@pParam^.QXMDLC[0], '.', Edit22);
  BCDToText(@pParam^.QHSD[0], '.', Edit23);
  BCDToText(@pParam^.CCSJ[0], '.', Edit24);
  BCDToText(@pParam^.CDSJ[0], '.', Edit25);

  Edit29.Text := IntToStr(pParam^.byte74);

  temp := pParam^.byte75;
  RadioGroup1.ItemIndex := temp div 16;
  RadioGroup2.ItemIndex := temp mod 16;

  temp := pParam^.byte76;
  RadioGroup3.ItemIndex := temp div 16;
  RadioGroup4.ItemIndex := temp mod 16;

  Edit30.Text := IntToStr(pParam^.byte77);

  temp := pParam^.byte78;
  RadioGroup5.ItemIndex := temp div 16;
  RadioGroup6.ItemIndex := temp mod 16;

  temp := pParam^.byte79;
  RadioGroup7.ItemIndex := temp div 16;
  case temp mod 16 of
    $01: RadioGroup8.ItemIndex := 0;
    $02: RadioGroup8.ItemIndex := 1;
    $04: RadioGroup8.ItemIndex := 2;
    $08: RadioGroup8.ItemIndex := 3;
  end;

  temp :=  pParam^.byte80-$10;
  RadioGroup9.ItemIndex := temp;

  if ListView1.Items.Item[0].Data <> nil then
  begin
    Dev:=TDevice(ListView1.Items.Item[0].Data);
    CopyMemory(@Dev.MeterParam.CSQYSJ[0], @pParam^.CSQYSJ[0], 4);

    CopyMemory(@Dev.MeterParam.BTWFDJ[0], @pParam^.BTWFDJ[0], 2);
    CopyMemory(@Dev.MeterParam.YJWFDJ[0], @pParam^.YJWFDJ[0], 2);
    CopyMemory(@Dev.MeterParam.BTDCDJ[0], @pParam^.BTDCDJ[0], 2);
    CopyMemory(@Dev.MeterParam.YJDCDJ[0], @pParam^.YJDCDJ[0], 2);
    CopyMemory(@Dev.MeterParam.BTECKTDJ[0], @pParam^.BTECKTDJ[0], 2);
    CopyMemory(@Dev.MeterParam.YJECKTDJ[0], @pParam^.YJECKTDJ[0], 2);
    CopyMemory(@Dev.MeterParam.BTQBJ[0], @pParam^.BTQBJ[0], 2);
    CopyMemory(@Dev.MeterParam.YJQBJ[0], @pParam^.YJQBJ[0], 2);
    CopyMemory(@Dev.MeterParam.XCGLS[0], @pParam^.XCGLS[0], 2);
    CopyMemory(@Dev.MeterParam.QCGL[0], @pParam^.QCGL[0], 2);
    CopyMemory(@Dev.MeterParam.DCGL[0], @pParam^.DCGL[0], 2);
    CopyMemory(@Dev.MeterParam.ECKTGL[0], @pParam^.ECKTGL[0], 2);
    CopyMemory(@Dev.MeterParam.BTDHSJDJ[0], @pParam^.BTDHSJDJ[0], 2);
    CopyMemory(@Dev.MeterParam.YJDHSJDJ[0], @pParam^.YJDHSJDJ[0], 2);
    CopyMemory(@Dev.MeterParam.MFDHSJ[0], @pParam^.MFDHSJ[0], 2);
    CopyMemory(@Dev.MeterParam.JJSJ[0], @pParam^.JJSJ[0], 2);
    CopyMemory(@Dev.MeterParam.YJKSSJ[0], @pParam^.YJKSSJ[0], 2);
    CopyMemory(@Dev.MeterParam.YJJSSJ[0], @pParam^.YJJSSJ[0], 2);
    CopyMemory(@Dev.MeterParam.FJF[0], @pParam^.FJF[0], 2);

    CopyMemory(@Dev.MeterParam.DTSJQLKSSJ[0], @pParam^.DTSJQLKSSJ[0], 2);
    CopyMemory(@Dev.MeterParam.QXMDLC[0], @pParam^.QXMDLC[0], 2);
    CopyMemory(@Dev.MeterParam.QHSD[0], @pParam^.QHSD[0], 2);
    CopyMemory(@Dev.MeterParam.CCSJ[0], @pParam^.CCSJ[0], 2);
    CopyMemory(@Dev.MeterParam.CDSJ[0], @pParam^.CDSJ[0], 2);


    Dev.MeterParam.byte74 := pParam^.byte74;
    Dev.MeterParam.byte75 := pParam^.byte75;
    Dev.MeterParam.byte76 := pParam^.byte76;
    Dev.MeterParam.byte77 := pParam^.byte77;
    Dev.MeterParam.byte78 := pParam^.byte78;
    Dev.MeterParam.byte79 := pParam^.byte79;
    Dev.MeterParam.byte80 := pParam^.byte80;
  end;

end;

procedure TReadMeterParamFrm.BitBtn4Click(Sender: TObject);
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

procedure TReadMeterParamFrm.BitBtn5Click(Sender: TObject);
var
  D: TDevice;
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

    D:=TDevice(ListView1.Items.Item[0].Data);
    //DataServer.SendReadMeterParam_V3(D);

    Param := '';
    Param := OpenFile(editFilePath.Text);
    DataServer.SendMeterParam_V3_New(D, Param);
  finally
    
  end;
  Close;
end;

procedure TReadMeterParamFrm.FormShow(Sender: TObject);
begin
  inherited;
  Edit26.Text := '0000';
  Edit27.Text := '00';
  Edit28.Text := '00';
  beginTime.Text := '00';

  Edit1.Text := '0.0';
  Edit2.Text := '0.0';
  Edit19.Text := '0.0';
  Edit3.Text := '0.0';
  Edit4.Text := '0.0';
  Edit5.Text := '0.0';
  Edit6.Text := '0.0';
  Edit7.Text := '0.0';
  Edit8.Text := '0.0';
  Edit9.Text := '0.0';
  Edit10.Text := '0.0';
  Edit11.Text := '0.0';
  Edit12.Text := '0.0';
  Edit13.Text := '0.0';
  Edit14.Text := '0.0';
  Edit15.Text := '0.0';
  Edit16.Text := '0:0';
  Edit17.Text := '0:0';
  Edit18.Text := '0.0';

  Edit21.Text := '0:0';
  Edit22.Text := '0.0';
  Edit23.Text := '0.0';
  Edit24.Text := '0.0';
  Edit25.Text := '0.0';

  Edit29.Text := '00';
  Edit30.Text := '00';
end;

procedure TReadMeterParamFrm.CheckBox1Click(Sender: TObject);
begin
  inherited;
  njty := CheckBox1.Checked;
end;

procedure TReadMeterParamFrm.BitBtn6Click(Sender: TObject);
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
  pParam: PMeterParam_V3;
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

  if njty then
  begin
    //CopyMemory(@param[0], , 128);

    for i:=0 to 127 do
    begin
      buf[i] := PassKey[i] xor param1[i];
    end;
    pParam := PMeterParam_V3(@buf[0]);

    crcBuf := BigTSmall_Word(GetCrcSum(@buf[0], SizeOf(buf)-2));
    if pParam^.CRC <> crcBuf then
    begin
      Exit;
    end;

  end;

  year := StrToInt(IntToHex(pParam^.CSQYSJ[0], 2)
                  + IntToHex(pParam^.CSQYSJ[1], 2));

  month := StrToInt(IntToHex(pParam^.CSQYSJ[2], 2));
  day := StrToInt(IntToHex(pParam^.CSQYSJ[3], 2));
  hour := StrToInt(IntToHex(pParam^.CSQYSJ[4], 2));
  //if year = 0 then
  //  year := 2000;
  //if month = 0 then
  //  month := 1;
  //if day = 0 then
  //  day := 1;
  //BeginDate.DateTime := EncodeDateTime(year, month, day, 0, 0, 0, 0);
  Edit26.Text := IntToStr(year);
  Edit27.Text := IntToStr(month);
  Edit28.Text := IntToStr(day);
  beginTime.Text := IntToStr(hour);

  BCDToText(@pParam^.BTWFDJ[0], '.', Edit1);
  BCDToText(@pParam^.YJWFDJ[0], '.', Edit2);
  BCDToText(@pParam^.BTDCDJ[0], '.', Edit19);
  BCDToText(@pParam^.YJDCDJ[0], '.', Edit3);
  BCDToText(@pParam^.BTECKTDJ[0], '.', Edit4);
  BCDToText(@pParam^.YJECKTDJ[0], '.', Edit5);
  BCDToText(@pParam^.BTQBJ[0], '.', Edit6);
  BCDToText(@pParam^.YJQBJ[0], '.', Edit7);
  BCDToText(@pParam^.XCGLS[0], '.', Edit8);
  BCDToText(@pParam^.QCGL[0], '.', Edit9);
  BCDToText(@pParam^.DCGL[0], '.', Edit10);
  BCDToText(@pParam^.ECKTGL[0], '.', Edit11);
  BCDToText(@pParam^.BTDHSJDJ[0], '.', Edit12);
  BCDToText(@pParam^.YJDHSJDJ[0], '.', Edit13);
  BCDToText(@pParam^.MFDHSJ[0], '.', Edit14);
  BCDToText(@pParam^.JJSJ[0], '.', Edit15);
  BCDToText(@pParam^.YJKSSJ[0], ':', Edit16);
  BCDToText(@pParam^.YJJSSJ[0], ':', Edit17);
  BCDToText(@pParam^.FJF[0], '.', Edit18);


  // 以下是南京通用计价器扩展参数
  BCDToText(@pParam^.DTSJQLKSSJ[0], ':', Edit21);
  BCDToText(@pParam^.QXMDLC[0], '.', Edit22);
  BCDToText(@pParam^.QHSD[0], '.', Edit23);
  BCDToText(@pParam^.CCSJ[0], '.', Edit24);
  BCDToText(@pParam^.CDSJ[0], '.', Edit25);

  Edit29.Text := IntToStr(pParam^.byte74);

  temp := pParam^.byte75;
  RadioGroup1.ItemIndex := temp div 16;
  RadioGroup2.ItemIndex := temp mod 16;

  temp := pParam^.byte76;
  RadioGroup3.ItemIndex := temp div 16;
  RadioGroup4.ItemIndex := temp mod 16;

  Edit30.Text := IntToStr(pParam^.byte77);

  temp := pParam^.byte78;
  RadioGroup5.ItemIndex := temp div 16;
  RadioGroup6.ItemIndex := temp mod 16;

  temp := pParam^.byte79;
  RadioGroup7.ItemIndex := temp div 16;
  case temp mod 10 of
    $01: RadioGroup8.ItemIndex := 0;
    $02: RadioGroup8.ItemIndex := 1;
    $04: RadioGroup8.ItemIndex := 2;
    $08: RadioGroup8.ItemIndex := 3;
  end;

  temp :=  pParam^.byte80-$10;
  RadioGroup9.ItemIndex := temp;
end;

end.
