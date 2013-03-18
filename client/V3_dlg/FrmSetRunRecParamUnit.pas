unit FrmSetRunRecParamUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrmUnit, ComCtrls, StdCtrls, Buttons, ExtCtrls, Types,
  RzCmboBx;

type
  TfrmSetRunRecParam = class(TBaseFrm)
    GroupBox1: TGroupBox;
    Notebook1: TNotebook;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    CheckBox3: TCheckBox;
    CheckBox2: TCheckBox;
    edtVIN: TEdit;
    edtCarNo: TEdit;
    date: TDateTimePicker;
    time: TDateTimePicker;
    cbxCarType: TComboBox;
    CheckBox1: TCheckBox;
    installDate: TDateTimePicker;
    installTime: TDateTimePicker;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    editPluse: TEdit;
    EditInitMileage: TEdit;
    EditD0: TEdit;
    EditD4: TEdit;
    EditD1: TEdit;
    EditD2: TEdit;
    EditD3: TEdit;
    EditD5: TEdit;
    EditD6: TEdit;
    EditD7: TEdit;
    chkSetTime_Old: TCheckBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    chkSetCarInfo_Old: TCheckBox;
    edtVIN_Old: TEdit;
    edtCarNo_Old: TEdit;
    cbxCarType_Old: TComboBox;
    dtRunRecDate_Old: TDateTimePicker;
    dtRunRecTime_Old: TDateTimePicker;
    chkSetDriverInfo_old: TCheckBox;
    chkSetCarProperty_Old: TCheckBox;
    Label17: TLabel;
    Label18: TLabel;
    edtDriverNo_old: TEdit;
    edtDriverLicense_Old: TEdit;
    edtCarProperty_old: TEdit;
    Label19: TLabel;
    RzComboBox1: TRzComboBox;
    procedure edtCCCKeyPress(Sender: TObject; var Key: Char);
    procedure edtVINKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure edtDriverNoKeyPress(Sender: TObject; var Key: Char);
    procedure edtLicenseKeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure editPluseKeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure chkSetDriverInfo_oldClick(Sender: TObject);
    procedure chkSetCarInfo_OldClick(Sender: TObject);
    procedure chkSetTime_OldClick(Sender: TObject);
    procedure chkSetCarProperty_OldClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RzComboBox1Change(Sender: TObject);
  private
    { Private declarations }
    function getCarType(index: Byte): string;
  public
    { Public declarations }
  end;

var
  frmSetRunRecParam: TfrmSetRunRecParam;

implementation
uses
  uGloabVar, CarUnit;

{$R *.dfm}

procedure TfrmSetRunRecParam.edtCCCKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in [#8, '0'..'9', #22]) then Key := #0;
end;

procedure TfrmSetRunRecParam.edtVINKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in [#8, '0'..'9', 'A'..'H', 'J'..'N', 'P', 'R'..'Z', #22]) then Key := #0;
end;

procedure TfrmSetRunRecParam.BitBtn1Click(Sender: TObject);
var
  i, j: Integer;
  dev: TDevice;
  dateTime: TDateTime;
  sAry: TStringDynArray;
  s: string;
  w: Word;
  bSetParam: Boolean;
begin
  bSetParam := False;
  if CheckBox2.Checked then
  begin
    if Trim(edtVIN.Text) = '' then
    begin
      ShowTips('请输入车辆VIN号', edtVIN);
      edtVIN.SetFocus;
      Exit;
    end;
    if Length(Trim(edtVIN.Text)) > 17 then
    begin
      ShowTips('车辆VIN号长度不能大于17位，请重新输入', edtVIN);
      edtVIN.SetFocus;
      Exit;
    end;
    if Trim(edtCarNo.Text) = '' then
    begin
      ShowTips('请输入车牌号码', edtCarNo);
      edtCarNo.SetFocus;
      Exit;
    end;
    if Length(Trim(edtCarNo.Text)) > 12 then
    begin
      ShowTips('车牌号码长度不能大于12，请重新输入', edtCarNo);
      edtCarNo.SetFocus;
      Exit;
    end;
    if cbxCarType.ItemIndex < 0 then
    begin
      ShowTips('请选择车牌分类', cbxCarType);
      cbxCarType.SetFocus;
      Exit;
    end;
    bSetParam := True;
  end;

  if CheckBox4.Checked then
  begin
//    if Trim(EditD0.Text) = '' then
//    begin
//      ShowTips('请输入D0的状态信号名称', EditD0);
//      EditD0.SetFocus;
//      Exit;
//    end;
//    if Trim(EditD1.Text) = '' then
//    begin
//      ShowTips('请输入D1的状态信号名称', EditD1);
//      EditD1.SetFocus;
//      Exit;
//    end;
//    if Trim(EditD2.Text) = '' then
//    begin
//      ShowTips('请输入D2的状态信号名称', EditD2);
//      EditD2.SetFocus;
//      Exit;
//    end;
//    if Trim(EditD3.Text) = '' then
//    begin
//      ShowTips('请输入D3的状态信号名称', EditD3);
//      EditD3.SetFocus;
//      Exit;
//    end;
//    if Trim(EditD4.Text) = '' then
//    begin
//      ShowTips('请输入D4的状态信号名称', EditD4);
//      EditD4.SetFocus;
//      Exit;
//    end;
//    if Trim(EditD5.Text) = '' then
//    begin
//      ShowTips('请输入D5的状态信号名称', EditD5);
//      EditD5.SetFocus;
//      Exit;
//    end;
//    if Trim(EditD6.Text) = '' then
//    begin
//      ShowTips('请输入D6的状态信号名称', EditD6);
//      EditD6.SetFocus;
//      Exit;
//    end;
//    if Trim(EditD7.Text) = '' then
//    begin
//      ShowTips('请输入D7的状态信号名称', EditD7);
//      EditD7.SetFocus;
//      Exit;
//    end;
    bSetParam := True;
  end;

  if CheckBox5.Checked then
  begin
    if Trim(editPluse.Text) = '' then
    begin
      ShowTips('请输入记录仪脉冲系数', editPluse);
      editPluse.SetFocus;
      Exit;
    end;
    if (StrToInt(Trim(editPluse.Text)) > 65535) or (StrToInt(Trim(editPluse.Text)) < 0) then
    begin
      ShowTips('记录仪脉冲系数需在0-65535之间，请重新输入', editPluse);
      editPluse.SetFocus;
      Exit;
    end;
    bSetParam := True;
  end;

  if CheckBox6.Checked then
  begin
    if Trim(EditInitMileage.Text) = '' then
    begin
      ShowTips('请输入起始里程', EditInitMileage);
      EditInitMileage.SetFocus;
      Exit;
    end;
    if (StrToInt(Trim(EditInitMileage.Text)) > 99999999) or (StrToInt(Trim(EditInitMileage.Text)) < 0) then
    begin
      ShowTips('起始里程需在0-99999999之间，请重新输入', EditInitMileage);
      EditInitMileage.SetFocus;
      Exit;
    end;
    bSetParam := True;
  end;

  if chkSetDriverInfo_old.Checked then
  begin
    if Trim(edtDriverNo_old.Text) = '' then
    begin
      ShowTips('请输入驾驶员代码', edtDriverNo_old);
      edtDriverNo_old.SetFocus;
      Exit;
    end;
    try
      if (StrToInt(Trim(edtDriverNo_old.Text)) > 16777215) or (StrToInt(Trim(edtDriverNo_old.Text)) < 0) then
      begin
        ShowTips('驾驶员代码需在0-16777215之间，请重新输入', edtDriverNo_old);
        edtDriverNo_old.SetFocus;
        Exit;
      end;
    except
      ShowTips('驾驶员代码输入不合法，请重新输入', edtDriverNo_old);
      edtDriverNo_old.SetFocus;
      Exit;
    end;
    if Trim(edtDriverLicense_Old.Text) = '' then
    begin
      ShowTips('请输入驾驶证号码', edtDriverLicense_Old);
      edtDriverLicense_Old.SetFocus;
      Exit;
    end;
    if Length(Trim(edtDriverLicense_Old.Text)) > 18 then
    begin
      ShowTips('驾驶证号码不能大于18位，请重新输入', edtDriverLicense_Old);
      edtDriverLicense_Old.SetFocus;
      Exit;
    end;
    bSetParam := True;
  end;

  if chkSetCarInfo_Old.Checked then
  begin
    if Trim(edtVIN_Old.Text) = '' then
    begin
      ShowTips('请输入车辆VIN号', edtVIN_Old);
      edtVIN_Old.SetFocus;
      Exit;
    end;
    if Length(Trim(edtVIN_Old.Text)) > 17 then
    begin
      ShowTips('车辆VIN号长度不能大于17位，请重新输入', edtVIN_Old);
      edtVIN_Old.SetFocus;
      Exit;
    end;
    if Trim(edtCarNo_Old.Text) = '' then
    begin
      ShowTips('请输入车牌号码', edtCarNo_Old);
      edtCarNo_Old.SetFocus;
      Exit;
    end;
    if Length(Trim(edtCarNo_Old.Text)) > 12 then
    begin
      ShowTips('车牌号码长度不能大于12，请重新输入', edtCarNo_Old);
      edtCarNo_Old.SetFocus;
      Exit;
    end;
    if cbxCarType_Old.ItemIndex < 0 then
    begin
      ShowTips('请选择车牌分类', cbxCarType_Old);
      cbxCarType_Old.SetFocus;
      Exit;
    end;
    bSetParam := True;
  end;

  if chkSetCarProperty_Old.Checked then
  begin
    if Trim(edtCarProperty_old.Text) = '' then
    begin
      ShowTips('请输入车辆特征系数', edtCarProperty_old);
      edtCarProperty_old.SetFocus;
      Exit;
    end;
    try
      if (StrToInt(Trim(edtCarProperty_old.Text)) > 16777215) or (StrToInt(Trim(edtCarProperty_old.Text)) < 0) then
      begin
        ShowTips('车辆特征系数需在0-16777215之间，请重新输入', edtCarProperty_old);
        edtCarProperty_old.SetFocus;
        Exit;
      end;
    except
      ShowTips('车辆特征系数输入不合法，请重新输入', edtCarProperty_old);
      edtCarProperty_old.SetFocus;
      Exit;
    end;
    bSetParam := True;
  end;  

  if not bSetParam then
  begin
    MessageBox(Handle, '请选择要设置的参数', '提示', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  
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
        if chkSetDriverInfo_old.Checked then
        begin//驾驶员代码、驾驶证号码
          DataServer.SendSetDriverInfo_Old(dev, StrToInt(Trim(edtDriverNo_old.Text)), Trim(edtDriverLicense_Old.Text));
        end;

        if chkSetCarInfo_Old.Checked then
        begin//车辆VIN号、车牌号码、车辆分类
          DataServer.SendSetCarInfo_Old(dev, Trim(edtVIN_Old.Text), Trim(edtCarNo_Old.Text), getCarType(cbxCarType_Old.ItemIndex));
        end;

        if chkSetTime_Old.Checked then
        begin//设置记录仪时钟
          dateTime := date.DateTime;
          ReplaceTime(dateTime, time.DateTime);
          DataServer.SendSetRecorderTime_Old(dev, dateTime);
        end;

        if chkSetCarProperty_Old.Checked then
        begin
          DataServer.SendSetCarProperty_Old(dev, StrToInt(Trim(edtCarProperty_old.Text)));
        end;  

        if  CheckBox1.Checked then
        begin//记录仪安装时间
          dateTime := installDate.DateTime;
          ReplaceTime(dateTime, installTime.DateTime);
          DataServer.SendSetInstallTime(dev, dateTime);
        end;

        if CheckBox2.Checked then
        begin//车辆VIN号、车牌号码、车辆分类
          DataServer.SendSetRecorderCarNo(dev, Trim(edtVIN.Text), Trim(edtCarNo.Text), getCarType(cbxCarType.ItemIndex));
        end;

        if CheckBox3.Checked then
        begin//记录仪时钟
          dateTime := date.DateTime;
          ReplaceTime(dateTime, time.DateTime);
          DataServer.SendSetRecorderTime(dev, dateTime);
        end;

        if CheckBox4.Checked then
        begin//设置状态量配置信息
          SetLength(sAry, 8);
          for j := 0 to Length(sAry) -1 do
          begin
            InitStr(sAry[j], 10);
          end;
          s := Trim(EditD0.Text);
          CopyMemory(@(sAry[0][1]), @s[1], Length(s));
          s := Trim(EditD1.Text);
          CopyMemory(@(sAry[1][1]), @s[1], Length(s));
          s := Trim(EditD2.Text);
          CopyMemory(@(sAry[2][1]), @s[1], Length(s));
          s := Trim(EditD3.Text);
          CopyMemory(@(sAry[3][1]), @s[1], Length(s));
          s := Trim(EditD4.Text);
          CopyMemory(@(sAry[4][1]), @s[1], Length(s));
          s := Trim(EditD5.Text);
          CopyMemory(@(sAry[5][1]), @s[1], Length(s));
          s := Trim(EditD6.Text);
          CopyMemory(@(sAry[6][1]), @s[1], Length(s));
          s := Trim(EditD7.Text);
          CopyMemory(@(sAry[7][1]), @s[1], Length(s));
          DataServer.SendSetStatusParamName(dev, sAry);
        end;

        if CheckBox5.Checked then
        begin
          w := StrToInt(Trim(editPluse.Text));
          DataServer.SendSetPluse(dev, w);
        end;

        if CheckBox6.Checked then
        begin
          DataServer.SendSetInitMileage(dev, StrToInt(Trim(EditInitMileage.Text)));
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

procedure TfrmSetRunRecParam.edtDriverNoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in [#8, '0'..'9', #22]) then Key := #0;
end;

procedure TfrmSetRunRecParam.edtLicenseKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in [#8, '0'..'9', 'a'..'z', 'A'..'Z', #22]) then Key := #0;
end;

function TfrmSetRunRecParam.getCarType(index: Byte): string;
begin
  Result := '';
  case index of
    0: Result := '大型汽车';
    1: Result := '挂车';
    2: Result := '小型汽车';
    3: Result := '使馆汽车';
    4: Result := '领馆汽车';
    5: Result := '港澳';
    6: Result := '教练汽车';
    7: Result := '警用汽车';
  end;
end;

procedure TfrmSetRunRecParam.CheckBox2Click(Sender: TObject);
begin
  edtVIN.Enabled := CheckBox2.Checked;
  edtCarNo.Enabled := CheckBox2.Checked;
  cbxCarType.Enabled := CheckBox2.Checked;
  if CheckBox2.Checked then
  begin
    edtVIN.Color := clWindow;
    edtCarNo.Color := clWindow;
    cbxCarType.Color := clWindow;
  end
  else
  begin
    edtVIN.Color := clBtnFace;
    edtCarNo.Color := clBtnFace;
    cbxCarType.Color := clBtnFace;
  end;
end;

procedure TfrmSetRunRecParam.CheckBox3Click(Sender: TObject);
begin
  date.Enabled := CheckBox3.Enabled;
  time.Enabled := CheckBox3.Enabled;
  if CheckBox3.Checked then
  begin
    date.Color := clWindow;
    time.Color := clWindow;
  end
  else
  begin
    date.Color := clBtnFace;
    time.Color := clBtnFace;
  end;
end;

procedure TfrmSetRunRecParam.CheckBox1Click(Sender: TObject);
begin
  installDate.Enabled := CheckBox1.Enabled;
  installTime.Enabled := CheckBox1.Enabled;
  if CheckBox1.Checked then
  begin
    installDate.Color := clWindow;
    installTime.Color := clWindow;
  end
  else
  begin
    installDate.Color := clBtnFace;
    installTime.Color := clBtnFace;
  end;
end;

procedure TfrmSetRunRecParam.editPluseKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

procedure TfrmSetRunRecParam.CheckBox5Click(Sender: TObject);
begin
  editPluse.Enabled := CheckBox5.Checked;
  if CheckBox5.Checked then
    editPluse.Color := clWindow
  else
    editPluse.Color := clBtnFace;
end;

procedure TfrmSetRunRecParam.CheckBox6Click(Sender: TObject);
begin
  EditInitMileage.Enabled := CheckBox6.Checked;
  if CheckBox6.Checked then
    EditInitMileage.Color := clWindow
  else
    EditInitMileage.Color := clBtnFace;
end;

procedure TfrmSetRunRecParam.CheckBox4Click(Sender: TObject);
begin
  EditD0.Enabled := CheckBox4.Checked;
  EditD1.Enabled := CheckBox4.Checked;
  EditD2.Enabled := CheckBox4.Checked;
  EditD3.Enabled := CheckBox4.Checked;
  EditD4.Enabled := CheckBox4.Checked;
  EditD5.Enabled := CheckBox4.Checked;
  EditD6.Enabled := CheckBox4.Checked;
  EditD7.Enabled := CheckBox4.Checked;
  if CheckBox4.Checked then
  begin
    EditD0.Color := clWindow;
    EditD1.Color := clWindow;
    EditD2.Color := clWindow;
    EditD3.Color := clWindow;
    EditD4.Color := clWindow;
    EditD5.Color := clWindow;
    EditD6.Color := clWindow;
    EditD7.Color := clWindow;
  end
  else
  begin
    EditD0.Color := clBtnFace;
    EditD1.Color := clBtnFace;
    EditD2.Color := clBtnFace;
    EditD3.Color := clBtnFace;
    EditD4.Color := clBtnFace;
    EditD5.Color := clBtnFace;
    EditD6.Color := clBtnFace;
    EditD7.Color := clBtnFace;
  end;  
end;

procedure TfrmSetRunRecParam.chkSetDriverInfo_oldClick(Sender: TObject);
begin
  if chkSetDriverInfo_old.Checked then
  begin
    edtDriverNo_old.Color := clWindow;
    edtDriverLicense_Old.Color := clWindow;
  end
  else
  begin
    edtDriverNo_old.Color := clBtnFace;
    edtDriverLicense_Old.Color := clBtnFace;
  end;
  edtDriverNo_old.ReadOnly := not chkSetDriverInfo_old.Checked;
  edtDriverLicense_Old.ReadOnly := not chkSetDriverInfo_old.Checked;
end;

procedure TfrmSetRunRecParam.chkSetCarInfo_OldClick(Sender: TObject);
begin
  edtVIN_Old.ReadOnly := not chkSetCarInfo_Old.Checked;
  edtCarNo_Old.ReadOnly := not chkSetCarInfo_Old.Checked;
  cbxCarType_Old.Enabled := chkSetCarInfo_Old.Checked;
  if chkSetCarInfo_Old.Checked then
  begin
    edtVIN_Old.Color := clWindow;
    edtCarNo_Old.Color := clWindow;
    cbxCarType_Old.Color := clWindow;
  end
  else
  begin
    edtVIN_Old.Color := clBtnFace;
    edtCarNo_Old.Color := clBtnFace;
    cbxCarType_Old.Color := clBtnFace;
  end;
end;

procedure TfrmSetRunRecParam.chkSetTime_OldClick(Sender: TObject);
begin
  dtRunRecDate_Old.Enabled := chkSetTime_Old.Checked;
  dtRunRecTime_Old.Enabled := chkSetTime_Old.Checked;
  if chkSetTime_Old.Checked then
  begin
    dtRunRecDate_Old.Color := clWindow;
    dtRunRecTime_Old.Color := clWindow;
  end
  else
  begin
    dtRunRecDate_Old.Color := clBtnFace;
    dtRunRecTime_Old.Color := clBtnFace;
  end;    
end;

procedure TfrmSetRunRecParam.chkSetCarProperty_OldClick(Sender: TObject);
begin
  edtCarProperty_old.ReadOnly := not chkSetCarProperty_Old.Checked;
  if chkSetCarProperty_Old.Checked then
  begin
    edtCarProperty_old.Color := clWindow;
  end
  else
  begin
    edtCarProperty_old.Color := clBtnFace;
  end;    
end;

procedure TfrmSetRunRecParam.FormCreate(Sender: TObject);
begin
  inherited;
  Notebook1.PageIndex := RzComboBox1.ItemIndex;
end;

procedure TfrmSetRunRecParam.RzComboBox1Change(Sender: TObject);
begin
  Notebook1.PageIndex := RzComboBox1.ItemIndex;
end;

end.
