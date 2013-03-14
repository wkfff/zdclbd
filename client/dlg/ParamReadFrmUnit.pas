unit ParamReadFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ParamFrmUnit, ExtCtrls, StdCtrls, ComCtrls, Buttons, ConstDefineUnit,
  cxCheckListBox, cxControls, cxContainer, cxEdit, cxGroupBox, cxCheckGroup,
  cxCheckBox, RzButton, RzRadChk, CarUnit;

type
  TParamReadFrm = class(TParamFrm)
    BitBtnSaveReadedParam: TBitBtn;
    BitBtn1: TBitBtn;
    Label90: TLabel;
    Timer2: TTimer;
    procedure BitBtnSetClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit17KeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox35Click(Sender: TObject);
    procedure CheckBox38Click(Sender: TObject);
    procedure CheckBox48Click(Sender: TObject);
    procedure CheckBox54Click(Sender: TObject);
    procedure CheckBox37Click(Sender: TObject);
    procedure CheckBox41Click(Sender: TObject);
    procedure CheckBox42Click(Sender: TObject);
    procedure CheckBox58Click(Sender: TObject);
    procedure CheckBox43Click(Sender: TObject);
    procedure CheckBox44Click(Sender: TObject);
    procedure CheckBox45Click(Sender: TObject);
    procedure CheckBox46Click(Sender: TObject);
    procedure BitBtnSaveReadedParamClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure CheckBox56Click(Sender: TObject);
    procedure CheckBox77Click(Sender: TObject);
    procedure CheckBox78Click(Sender: TObject);
    procedure CheckBox79Click(Sender: TObject);
    procedure CheckBox80Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CheckBox27Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    function ReadParam(Dev: TDevice; NO: integer): boolean;
    function ReturnParamID(NO: integer): word;
    { Private declarations }
  private
    ParamNO: integer;
  public
    { Public declarations }
    Cancel: Boolean;
    IsReadAll: Boolean;
  end;

var
  ParamReadFrm: TParamReadFrm;

implementation
uses uGloabVar,GatewayServerUnit;
{$R *.dfm}

procedure TParamReadFrm.BitBtnSetClick(Sender: TObject);
var
  i, j: integer;
  S: string;
  NO: integer;
begin
  ClearEditAndCbx;
  Label90.Visible := True;
  Label90.Caption := '正在读取...';
  BitBtnSet.Enabled := False;
  Timer2.Enabled := True;
  if CurrentDev <> nil then
  begin
    if IsReadAll then
    begin
      DataServer.ReadDevParam_V3(CurrentDev, 0);
    end
    else
    begin

      TBitBtn(Sender).Enabled := false;
      ParamNO := 0;
      j := 0;

      CheckBoxList.Clear;
      for i := 0 to Self.ComponentCount - 1 do
      begin
        if (Self.Components[i] is TCheckBox) then
        begin
          if TCheckBox(Self.Components[i]).Checked then
          begin
            inc(j);
            //LastComp := i;
            CheckBoxList.Add(TCheckBox(Self.Components[i]).Name);
          end;
        end;
      end;

      LastComp := j;

      if j = 0 then
      begin
        messagebox(handle, ' 请选择一个参数!  ', '提示', mb_ok + mb_iconinformation);
        TBitBtn(Sender).Enabled := true;
        exit;
      end;

      DataServer.ReadDevParamSpec_BD(CurrentDev, CheckBoxList);
//      if j = 1 then
//      begin
//
//        S := CheckBoxList.Strings[0];//TCheckBox(Self.Components[LastComp]).Name;
//        S := copy(S, 9, Length(S) - 1);
//        NO := StrToInt(S);
//        ReadParam(CurrentDev, NO);
//        TBitBtn(Sender).Enabled := true;
//      end
//      else
//      begin
//       // self.ManualDock(uMainf.Mainf.PageControlBottom,nil,alLeft );
//        ProgressBar1.Max := j * 10;
//        ProgressBar1.Visible := true;
//        ProgressBar1.Position := 0;
//        Timer1.Enabled := true;
//        Timer1Timer(Timer1);
//      end;
    end;
  end;
end;

function TParamReadFrm.ReadParam(Dev: TDevice; NO: Integer): boolean;
begin
  Result := DataServer.ReadDevParam_V3(Dev, ReturnParamID(NO));
end;

function TParamReadFrm.ReturnParamID(NO: integer): word;
begin
  case NO of
    12: Result := $0001;
    34: Result := $0002;
    13: Result := $0003;
    85: Result := $0004;
    86: Result := $0005;
    59: Result := $0006;
    60: Result := $0007;
    6: Result := $0010;
    61: Result := $0011;
    62: Result := $0012;
    7: Result := $0013;
    63: Result := $0014;
    11: Result := $0015;
    64: Result := $0016;
    9: Result := $0017;
    65: Result := $0018;
    //81: Result := $0091;
    //82: Result := $0090;

    14: Result := $0020;
    15: Result := $0021;

    351: Result := $0022;
//    353: Result := $0023;
//    355: Result := $0024;
    357: Result := $0025;
    359: Result := $0026;
    361: Result := $0027;
    362: Result := $0028;
    352: Result := $0029;
//    354: Result := $002A;
//    356: Result := $002B;
    358: Result := $002C;
    360: Result := $002D;
    364: Result := $002E;
    365: Result := $002F;
    363: Result := $0030;

    66: Result := $0040;
    3: Result :=  $0041;
    67: Result := $0042;
    4: Result :=  $0043;
    5: Result :=  $0044;
    57: Result := $0045;
    55: Result := $0046;
    68: Result := $0047;
    //36: Result := $0048;
    2: Result :=  $0048;

    56: Result := $0050;
    77: Result := $0051;
    78: Result := $0052;
    79: Result := $0053;
    80: Result := $0054;

    16: Result := $0055;
    47: Result := $0056;
    422: Result := $0057;
    424: Result := $0058;
    421: Result := $0059;
    423: Result := $005A;

    69: Result := $0070;
    70: Result := $0071;
    71: Result := $0072;
    72: Result := $0073;
    73: Result := $0074;

    74: Result := $0080;
    75: Result := $0081;
    76: Result := $0082;
    88: Result := $0083;
    89: Result := $0084;

//    27: Result := $0091;
//    1: Result := $0090;
//    100: Result := $00A0;
//    28: Result := $00A1;
//    29: Result := $00A2;
//    30: Result := $00A3;
//    31: Result := $00AF;
//    32: Result := $00B0;
//    99: Result := $00B1;
//    50: Result := $00B2;
//    51: Result := $00B3;
//    52: Result := $00B4;
//    53: Result := $00B5;
//
//    83: Result := $F001;
//    26: Result := $004B;
//
//    81: Result := $0019;
//    82: Result := $004A;
//    33: Result := $F002;
  else
    Result := $FFFF;
  end;
end;

procedure TParamReadFrm.Timer1Timer(Sender: TObject);
var
  i: integer;
  state: byte;
  s: string;
  NO: integer;
  pCmd:PCmdInfo;
begin
  i := ParamNO;
  if GReadParamCmdID > 0 then
  begin
    pCmd := ACmdManage.Find(GReadParamCmdID);
    if pCmd = nil then exit;
    state := pCmd^.State;
    if (state = CMD_DONE) and (paramNO >= LastComp) then //最后一个读取成功
    begin
      Timer1.Enabled := False;
      ProgressBar1.Visible := false;
      BitBtnSet.Enabled := true;
    end;
  end;
//  if (Self.Components[i] is TCheckBox) then
//  begin
//    if TCheckBox(Self.Components[i]).Checked then
//    begin
    if i < CheckBoxList.Count  then
    begin
      if ProgressBar1.Position = 0 then
      begin
        S := CheckBoxList.Strings[i]; //TCheckBox(Self.Components[i]).Name;
        S := copy(S, 9, Length(S) - 1);
        NO := StrToInt(S);
        ReadParam(CurrentDev, NO);
        inc(ParamNO);
        ProgressBar1.StepIt;
        exit;
      end;
      //state := (ACmdManage.Find(GReadParamCmdID))^.State;
      pCmd := ACmdManage.Find(GReadParamCmdID);
      if pCmd = nil then exit;
      state := pCmd^.State;
      if state = CMD_SNDNODO then
      begin
        exit;
      end
      else if (State = CMD_DONE) or (State = CMD_REPLACE) then
      begin
        S := CheckBoxList.Strings[i]; //TCheckBox(Self.Components[i]).Name;
        S := copy(S, 9, Length(S) - 1);
        NO := StrToInt(S);
        ReadParam(CurrentDev, NO);
        inc(ParamNO);
        ProgressBar1.StepIt;
      end
      else
      begin
        timer1.Enabled := false;
        messagebox(handle, ' 读取参数失败!  ', '提示', mb_ok + mb_iconinformation);
        ProgressBar1.Visible := false;
             //Self.Height:=497;
        BitBtnSet.Enabled := true;
      end;
    end;
//    end
//    else
//    begin
//      inc(ParamNO);
//    end;
// end
// else
// begin
//    inc(ParamNO);
//  end;

  {if ParamNO >= CheckBoxList.Count then 
  begin
    timer1.Enabled := false;
    ProgressBar1.Visible := false;
    BitBtnSet.Enabled := true;
     // close;
  end; }
end;

procedure TParamReadFrm.CheckBox1Click(Sender: TObject);
var
  CheckBoxName: string;
  Num: string;
  i: integer;
  tempComponent: TComponent;
begin
  Num := '';
  CheckBoxName := TCheckBox(Sender).Name;
  for i := 1 to Length(CheckBoxName) do
  begin
    if (CheckBoxName[i] >= '0') and (CheckBoxName[i] <= '9') then
      Num := Num + CheckBoxName[i];
  end;
  tempComponent := self.FindComponent('Edit' + Num);
// TWinControl(tempComponent).Enabled:=TCheckBox(Sender).Checked;
  if tempComponent <> nil then
  begin
    if tempComponent is TEdit then
      if TCheckBox(Sender).Checked then
        TEdit(tempComponent).Color := clInfoBk
      else TEdit(tempComponent).Color := clBtnFace
    else
      if TCheckBox(Sender).Checked then
        TComboBox(tempComponent).Color := clInfoBk
      else TComboBox(tempComponent).Color := clBtnFace;
  end;

  if CheckBoxName = 'CheckBox25' then
  begin
    if TCheckBox(Sender).Checked then
    begin
      Edit252.Color := clInfoBk;
      //Edit252.Enabled:=true;
    end
    else
    begin
      Edit252.Color := clBtnFace;
     // Edit252.Enabled:=false;
    end;
  end;
  if CheckBoxName = 'CheckBox27' then
  begin
    if TCheckBox(Sender).Checked then
    begin
      Date27.Color := clInfoBk;
      //Date27.Enabled:=true;
      Time27.Color := clInfoBk;
      //Time27.Enabled:=true;
    end
    else
    begin
      Date27.Color := clBtnFace;
      Time27.Color := clBtnFace;
     // DateTimePicker1.Enabled:=false;
    end;
  end
  else if CheckBoxName = 'CheckBox95' then
  begin
    if TCheckBox(Sender).Checked then
    begin
      Edit37.Color := clInfoBk;
//      Edit37.Enabled := true;
      Edit10.Color := clInfoBk;
//      Edit10.Enabled := true;
    end
    else
    begin
      Edit37.Color := clBtnFace;
//      Edit37.Enabled := false;
      Edit10.Color := clBtnFace;
//      Edit10.Enabled := false;
    end;
  end
  else if CheckBoxName = 'CheckBox96' then
  begin
    if TCheckBox(Sender).Checked then
    begin
      Edit27.Color := clInfoBk;
//      Edit27.Enabled := true;
      Edit35.Color := clInfoBk;
//      Edit35.Enabled := true;
    end
    else
    begin
      Edit27.Color := clBtnFace;
//      Edit27.Enabled := false;
      Edit35.Color := clBtnFace;
//      Edit35.Enabled := false;
    end;
  end;
end;

procedure TParamReadFrm.Edit17KeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TParamReadFrm.CheckBox35Click(Sender: TObject);
begin
  if CheckBox35.Checked then
  begin
    Edit351.Color := clInfoBk;
    Edit352.Color := clInfoBk;
    Edit353.Color := clInfoBk;
    Edit354.Color := clInfoBk;
    Edit355.Color := clInfoBk;
    Edit356.Color := clInfoBk;
    Edit357.Color := clInfoBk;
    Edit358.Color := clInfoBk;
  end
  else
  begin
    Edit351.Color := clBtnFace;
    Edit352.Color := clBtnFace;
    Edit353.Color := clBtnFace;
    Edit354.Color := clBtnFace;
    Edit355.Color := clBtnFace;
    Edit356.Color := clBtnFace;
    Edit357.Color := clBtnFace;
    Edit358.Color := clBtnFace;
  end;
end;

procedure TParamReadFrm.CheckBox38Click(Sender: TObject);
begin
  if CheckBox38.Checked then
  begin
    Edit381.Color := clInfoBk;
    Edit382.Color := clInfoBk;
  end
  else
  begin
    Edit381.Color := clBtnFace;
    Edit382.Color := clBtnFace;
  end;
end;

procedure TParamReadFrm.CheckBox48Click(Sender: TObject);
begin
  if CheckBox48.Checked then
  begin
    Edit481.Color := clInfoBk;
    Edit482.Color := clInfoBk;
  end
  else
  begin
    Edit481.Color := clBtnFace;
    Edit482.Color := clBtnFace;
  end;

end;

procedure TParamReadFrm.CheckBox54Click(Sender: TObject);
begin
  if CheckBox54.Checked then
  begin
    Edit542.Color := clInfoBk;
  end
  else
  begin
    Edit542.Color := clBtnFace;
  end;
end;

procedure TParamReadFrm.CheckBox37Click(Sender: TObject);
begin
  if CheckBox37.Checked then
  begin
    Edit371.Color := clInfoBk;
    Edit372.Color := clInfoBk;
    Edit373.Color := clInfoBk;
  end
  else
  begin
    Edit371.Color := clBtnFace;
    Edit372.Color := clBtnFace;
    Edit373.Color := clBtnFace;
  end;
end;

procedure TParamReadFrm.CheckBox41Click(Sender: TObject);
begin
  if CheckBox41.Checked then
  begin
    Edit411.Color := clInfoBk;
    Edit412.Color := clInfoBk;
  end
  else
  begin
    Edit411.Color := clBtnFace;
    Edit412.Color := clBtnFace;
  end;
end;

procedure TParamReadFrm.CheckBox42Click(Sender: TObject);
begin
  if CheckBox42.Checked then
  begin
    Edit421.Color := clInfoBk;
    Edit422.Color := clInfoBk;
  end
  else
  begin
    Edit421.Color := clBtnFace;
    Edit422.Color := clBtnFace;
  end;
end;

procedure TParamReadFrm.CheckBox58Click(Sender: TObject);
begin
  if CheckBox58.Checked then
  begin
    Edit581.Color := clInfoBk;
    Edit582.Color := clInfoBk;
  end
  else
  begin
    Edit581.Color := clBtnFace;
    Edit582.Color := clBtnFace;
  end;
end;

procedure TParamReadFrm.CheckBox43Click(Sender: TObject);
begin
  if CheckBox43.Checked then
  begin
    Edit431.Color := clInfoBk;
    Edit432.Color := clInfoBk;
  end
  else
  begin
    Edit431.Color := clBtnFace;
    Edit432.Color := clBtnFace;
  end;
end;

procedure TParamReadFrm.CheckBox44Click(Sender: TObject);
begin
  if CheckBox44.Checked then
  begin
    Edit441.Color := clInfoBk;
    Edit442.Color := clInfoBk;
  end
  else
  begin
    Edit441.Color := clBtnFace;
    Edit442.Color := clBtnFace;
  end;
end;

procedure TParamReadFrm.CheckBox45Click(Sender: TObject);
begin
  if CheckBox45.Checked then
  begin
    Edit451.Color := clInfoBk;
    Edit452.Color := clInfoBk;
  end
  else
  begin
    Edit451.Color := clBtnFace;
    Edit452.Color := clBtnFace;
  end;
end;

procedure TParamReadFrm.CheckBox46Click(Sender: TObject);
begin
  if CheckBox46.Checked then
  begin
    Edit461.Color := clInfoBk;
    Edit462.Color := clInfoBk;
  end
  else
  begin
    Edit461.Color := clBtnFace;
    Edit462.Color := clBtnFace;
  end;
end;

procedure TParamReadFrm.BitBtnSaveReadedParamClick(Sender: TObject);
begin
  BitBtnSaveReadedParam.Enabled := False;
  try
    try
      ParamSaveToDev(CurrentDev);
      PopMsg('参数保存', '参数保存成功')
    except
      PopMsg('参数保存', '参数保存失败')
    end;
  finally
    BitBtnSaveReadedParam.Enabled := True;
  end;
 { if CheckBox12.Checked then ReadParam(CurrentDev.id, $0001);
  if CheckBox34.Checked then ReadParam(CurrentDev.id, $0002);//SetParam090D(CurrentDev.id, True);
  if CheckBox13.Checked then ReadParam(CurrentDev.id, $0003);
  if CheckBox59.Checked then ReadParam(CurrentDev.id, $0004);
  if CheckBox60.Checked then ReadParam(CurrentDev.id, $0005);
  if CheckBox6.Checked then ReadParam(CurrentDev.id, $0010);
  if CheckBox61.Checked then ReadParam(CurrentDev.id, $0011);
  if CheckBox62.Checked then ReadParam(CurrentDev.id, $0012);
  if CheckBox7.Checked then ReadParam(CurrentDev.id, $0013);
  if CheckBox63.Checked then ReadParam(CurrentDev.id, $0014);
  if CheckBox11.Checked then ReadParam(CurrentDev.id, $0015);
  if CheckBox64.Checked then ReadParam(CurrentDev.id, $0016);
  if CheckBox9.Checked then ReadParam(CurrentDev.id, $0017);
  if CheckBox65.Checked then ReadParam(CurrentDev.id, $0018);
  if CheckBox14.Checked then ReadParam(CurrentDev.id, $0020);
  if CheckBox15.Checked then ReadParam(CurrentDev.id, $0021);
  if CheckBox351.Checked then ReadParam(CurrentDev.id, $0022);
  if CheckBox353.Checked then ReadParam(CurrentDev.id, $0023);
  if CheckBox355.Checked then ReadParam(CurrentDev.id, $0024);
  if CheckBox357.Checked then ReadParam(CurrentDev.id, $0025);
  if CheckBox359.Checked then ReadParam(CurrentDev.id, $0026);
  if CheckBox361.Checked then ReadParam(CurrentDev.id, $0027);
  if CheckBox362.Checked then ReadParam(CurrentDev.id, $0028);
  if CheckBox352.Checked then ReadParam(CurrentDev.id, $0029);
  if CheckBox354.Checked then ReadParam(CurrentDev.id, $002A);
  if CheckBox356.Checked then ReadParam(CurrentDev.id, $002B);
  if CheckBox358.Checked then ReadParam(CurrentDev.id, $002C);
  if CheckBox360.Checked then ReadParam(CurrentDev.id, $002D);
  if CheckBox364.Checked then ReadParam(CurrentDev.id, $002E);
  if CheckBox365.Checked then ReadParam(CurrentDev.id, $002F);
  if CheckBox363.Checked then ReadParam(CurrentDev.id, $0030);

  if CheckBox66.Checked then ReadParam(CurrentDev.id, $0040);
  if CheckBox3.Checked then ReadParam(CurrentDev.id, $0041);
  if CheckBox7.Checked then ReadParam(CurrentDev.id, $0042);
  if CheckBox4.Checked then ReadParam(CurrentDev.id, $0043);
  if CheckBox5.Checked then ReadParam(CurrentDev.id, $0044);
  if CheckBox57.Checked then ReadParam(CurrentDev.id, $0045);
  if CheckBox55.Checked then ReadParam(CurrentDev.id, $0046);
  if CheckBox68.Checked then ReadParam(CurrentDev.id, $0047);
  if CheckBox36.Checked then ReadParam(CurrentDev.id, $0048);
  if CheckBox2.Checked then ReadParam(CurrentDev.id, $0049);

  if CheckBox56.Checked then ReadParam(CurrentDev.id, $0050);
  if CheckBox77.Checked then ReadParam(CurrentDev.id, $0051);
  if CheckBox78.Checked then ReadParam(CurrentDev.id, $0052);
  if CheckBox79.Checked then ReadParam(CurrentDev.id, $0053);
  if CheckBox80.Checked then ReadParam(CurrentDev.id, $0054);

  if CheckBox16.Checked then ReadParam(CurrentDev.id, $0055);
  if CheckBox47.Checked then ReadParam(CurrentDev.id, $0056);
  if CheckBox422.Checked then ReadParam(CurrentDev.id, $0057);
  if CheckBox421.Checked then ReadParam(CurrentDev.id, $0058);
  if CheckBox423.Checked then ReadParam(CurrentDev.id, $0059);
  if CheckBox424.Checked then ReadParam(CurrentDev.id, $005A);

  if CheckBox69.Checked then ReadParam(CurrentDev.id, $0070);
  if CheckBox70.Checked then ReadParam(CurrentDev.id, $0071);
  if CheckBox71.Checked then ReadParam(CurrentDev.id, $0072);
  if CheckBox72.Checked then ReadParam(CurrentDev.id, $0073);
  if CheckBox73.Checked then ReadParam(CurrentDev.id, $0074);

  if CheckBox74.Checked then ReadParam(CurrentDev.id, $0080);
  if CheckBox75.Checked then ReadParam(CurrentDev.id, $0081);
  if CheckBox76.Checked then ReadParam(CurrentDev.id, $0082);   }


end;


procedure TParamReadFrm.FormShow(Sender: TObject);
var
  i: integer;
begin
//  if not IsNewDev then
//    Exit;
  for i := 0 to Self.ComponentCount - 1 do
  begin
    try
      if Self.Components[i] is TEdit then
      begin
        TEdit(Components[i]).Text := '';
        TEdit(Components[i]).Color := clBtnFace;
        TEdit(Components[i]).Enabled := not IsReadAll;
        TEdit(Components[i]).ReadOnly := True;
      end;
      if Components[i] is TComboBox then
      begin
        TComboBox(Components[i]).ItemIndex := -1;
        TComboBox(Components[i]).Enabled := not IsReadAll;
        TComboBox(Components[i]).color := clBtnFace;
      end;
      if Components[i] is TCheckBox then
      begin
        if IsReadAll then
          TCheckBox(Components[i]).State := cbGrayed
        else
          TCheckBox(Components[i]).State := cbUnchecked;

        TCheckBox(Components[i]).Enabled := not IsReadAll;
      end;
      if Components[i] is TRzCheckBox then
      begin
        if IsReadAll then
          TRzCheckBox(Components[i]).State := cbGrayed
        else
          TRzCheckBox(Components[i]).State := cbUnchecked;

        TRzCheckBox(Components[i]).Enabled := not IsReadAll;
      end;
    except
      on E: Exception do
      begin
        addSysLog('ParamReadFrm FormShow Err:' + E.Message);
      end;  
    end;
  end;
  date27.Enabled := False;
  time27.Enabled := False;
  date27.Color := clBtnFace;
  time27.Color := clBtnFace;
  date27.Date := StrToDateTime('2000-01-01 01:01:01');//Now;
  time27.Time := StrToDateTime('2000-01-01 01:01:01');//Now;
  cxCheckListBox56.Enabled := False;
  cxCheckListBox1.Enabled := False;
  cxCheckListBox2.Enabled := False;
  cxCheckListBox3.Enabled := False;
  cxCheckListBox4.Enabled := False;
  ProgressBar1.Visible := false;
  ProgressBar1.StepBy(0);
   //Self.Height:=497;
  BitBtnSet.Enabled := true;
  EditCar.Text := CurrentDev.Car.No;
  EditCar.Color := clInfoBk;
  //ShowParamToEdit(CurrentDev);
  //RzCheckBoxSelectAll.Checked := False;
  BitBtnSaveReadedParam.Visible := False;
  Label90.Visible := False;

  if IsReadAll then
    ReadParamFrm.BitBtnSetClick(nil);
end;

procedure TParamReadFrm.BitBtn2Click(Sender: TObject);
begin
  Cancel := True;

  timer1.Enabled:=false;
  BitBtnSet.Enabled:=true;
  ProgressBar1.Visible:=false;
end;

procedure TParamReadFrm.CheckBox56Click(Sender: TObject);
begin
  if CheckBox56.Checked then
  begin
      cxCheckListBox56.Enabled := True;
      cxCheckListBox56.ReadOnly := True;
      cxCheckListBox56.Style.Color := clInfoBk;
  end
  else
  begin
    cxCheckListBox56.Enabled := False;
    cxCheckListBox56.ReadOnly := False;
    cxCheckListBox56.Style.Color := clBtnFace;
  end;
end;

procedure TParamReadFrm.CheckBox77Click(Sender: TObject);
begin
    if CheckBox77.Checked then
    begin
      cxCheckListBox1.Enabled := True;
      cxCheckListBox1.ReadOnly := True;
      cxCheckListBox1.Style.Color := clInfoBk;
    end
    else
    begin
      cxCheckListBox1.Enabled := False;
      cxCheckListBox1.ReadOnly := False;
      cxCheckListBox1.Style.Color := clBtnFace;
    end;

end;

procedure TParamReadFrm.CheckBox78Click(Sender: TObject);
begin
    if CheckBox78.Checked then
    begin
      cxCheckListBox2.Enabled := True;
      cxCheckListBox2.ReadOnly := True;
      cxCheckListBox2.Style.Color := clInfoBk;
    end
    else
    begin
      cxCheckListBox2.Enabled := False;
      cxCheckListBox2.ReadOnly := False;
      cxCheckListBox2.Style.Color := clBtnFace;
    end;

end;

procedure TParamReadFrm.CheckBox79Click(Sender: TObject);
begin
    if CheckBox79.Checked then
    begin
      cxCheckListBox3.Enabled := True;
      cxCheckListBox3.ReadOnly := True;
      cxCheckListBox3.Style.Color := clInfoBk;
    end
    else
    begin
      cxCheckListBox3.Enabled := False;
      cxCheckListBox3.ReadOnly := False;
      cxCheckListBox3.Style.Color := clBtnFace;
    end;

end;

procedure TParamReadFrm.CheckBox80Click(Sender: TObject);
begin
    if CheckBox80.Checked then
    begin
      cxCheckListBox4.Enabled := True;
      cxCheckListBox4.ReadOnly := True;
      cxCheckListBox4.Style.Color := clInfoBk;
    end
    else
    begin
      cxCheckListBox4.Enabled := False;
      cxCheckListBox4.ReadOnly := False;
      cxCheckListBox4.Style.Color := clBtnFace;
    end;
end;

procedure TParamReadFrm.BitBtn1Click(Sender: TObject);
begin
  BitBtn2Click(nil);
  close;
end;

procedure TParamReadFrm.CheckBox27Click(Sender: TObject);
begin
    if CheckBox27.Checked then
  begin
    EditYear.Enabled := True;
    EditYear.ReadOnly := True;
    EditYear.Color := clInfoBk;

    EditMonth.Enabled := True;
    EditMonth.ReadOnly := True;
    EditMonth.Color := clInfoBk;

    EditDay.Enabled := True;
    EditDay.ReadOnly := True;
    EditDay.Color := clInfoBk;

    EditHour.Enabled := True;
    EditHour.ReadOnly := True;
    EditHour.Color := clInfoBk;
  end
  else
  begin
    EditYear.Enabled := False;
    EditYear.ReadOnly := False;
    EditYear.Color := clBtnFace;

    EditMonth.Enabled := False;
    EditMonth.ReadOnly := False;
    EditMonth.Color := clBtnFace;

    EditDay.Enabled := False;
    EditDay.ReadOnly := False;
    EditDay.Color := clBtnFace;

    EditHour.Enabled := False;
    EditHour.ReadOnly := False;
    EditHour.Color := clBtnFace;
  end;

end;

procedure TParamReadFrm.Timer2Timer(Sender: TObject);
begin
  Label90.Caption := '读取参数超时';
  BitBtnSet.Enabled := True;
  Timer2.Enabled := False;
end;

procedure TParamReadFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Timer2.Enabled := False;
end;

end.

