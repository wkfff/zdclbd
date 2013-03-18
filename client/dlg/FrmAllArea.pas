unit FrmAllArea;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, RzButton, StdCtrls, Mask, RzEdit, RzPanel, ExtCtrls, uFrmSelectDevs,
  uGloabVar, CarUnit,ConfineAreaUnit,MetaDefine, CmdStructUnit;

type
  TFrm_AllArea = class(TForm)
    RzPanel2: TRzPanel;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn5: TRzBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    ListView1: TListView;
    RzBitBtn3: TRzBitBtn;
    RzBitBtn4: TRzBitBtn;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    idlingAlarmValue: TRzEdit;
    ComboBox3: TComboBox;
    OverAlarmValue: TEdit;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    beginDate: TDateTimePicker;
    beginTime: TDateTimePicker;
    endDate: TDateTimePicker;
    endTime: TDateTimePicker;
    CheckBoxEveryDay: TCheckBox;
    Edit_MaxSpeed: TEdit;
    Edit_time: TEdit;
    GroupBox4: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label6: TLabel;
    areaID: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    ComboBox1: TComboBox;
    Edit_NO: TEdit;
    Notebook1: TNotebook;
    Label4: TLabel;
    Label5: TLabel;
    Edit3: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    EditLeftLong: TEdit;
    EditLeftLat: TEdit;
    EditRightLong: TEdit;
    EditRightLat: TEdit;
    Notebook2: TNotebook;
    rbNLat: TRadioButton;
    rbSLat: TRadioButton;
    Notebook3: TNotebook;
    rbELong: TRadioButton;
    rbWLong: TRadioButton;
    rbUpdate: TRadioButton;
    rbAttach: TRadioButton;
    rbModify: TRadioButton;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    procedure RzBitBtn3Click(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzBitBtn5Click(Sender: TObject);
    procedure RzBitBtn4Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
    procedure Edit_MaxSpeedKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_timeChange(Sender: TObject);
    procedure Edit_NOExit(Sender: TObject);
    procedure CheckBoxEveryDayClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
  private
    { Private declarations }
  public
    AreaShape:Byte;
    Area_Property: Word;
    function GetCheckListBoxValue(): Word;
  end;
const
  AREASHAPE_CIRCLE   = 0;
  AREASHAPE_RECT     = 1;
  AREASHAPE_POLY     = 2;
  AREASHAPE_POLYLINE = 3;
var
  Frm_AllArea: TFrm_AllArea;
implementation
uses
  Math, ConstDefineUnit;

{$R *.dfm}

procedure TFrm_AllArea.RzBitBtn3Click(Sender: TObject);
var
  frm: TFrmSelectDevs;
  i: integer;
begin
  frm := TFrmSelectDevs.Create(nil);
  try
    if frm.ShowModal = mrOk then
    begin
      ListView1.Clear;
      for i := 0 to frm.DestList.Count - 1 do
      begin
        with ListView1.Items.Add do
        begin
          Caption := TDevice(frm.DestList.Items[i].Data).Car.No;
          Data := frm.DestList.Items[i].Data;
        end;
      end;
    end;
  finally
    frm.Free;
  end;
end;

function TFrm_AllArea.GetCheckListBoxValue(): Word;
//0a00H	功能屏蔽标志	占用16个字节 ，共128个功能可以受控
  function GetChecked(checkbox: TCheckBox): Byte;
  begin
    if checkbox.Checked then
      Result := 1
    else
      Result := 0;
  end;
var
  b: array[0..15] of byte;
  sndAry: array[0..1] of byte;
  i, j, k: Integer;
  tmp: Word;
begin
  Result := $FFFF;
  FillChar(b, 16, 0);
//  FillChar(sndAry, 2, 0);
  //b[0] := GetChecked(CheckBox1);
  b[0] := GetChecked(CheckBox1);
  b[1] := GetChecked(CheckBox2);
  b[2] := GetChecked(CheckBox3);
  b[3] := GetChecked(CheckBox4);
  b[4] := GetChecked(CheckBox5);
  b[5] := GetChecked(CheckBox6);
  //b[6] := GetChecked(CheckBox7);
  b[6] := IfThen(rbNLat.Checked, 0, 1);
  //b[7] := GetChecked(CheckBox8);
  b[7] := IfThen(rbELong.Checked, 0, 1);

  b[8] := GetChecked(CheckBox9);
  b[14] := GetChecked(CheckBox10);
  b[15] := GetChecked(CheckBox11);
  tmp := 0;
  for i := 0 to 15 do
  begin
    tmp := tmp + (b[i] shl i);
  end;
  Result := Result and tmp;
//
//  i := 0;
//  //取出 0-16，共4个字节。12 13 14 15
//  while i <= 15 do
//  begin
//    k := i mod 8;
//    if k = 0 then tmp := 0;
//    tmp := tmp + b[i] shl k;
//    if k = 7 then
//      sndAry[1 - i div 8] := tmp;
//    inc(i);
//  end;
//  Result :=(sndAry[0] shl 8) + sndAry[1];
end;

procedure TFrm_AllArea.RzBitBtn1Click(Sender: TObject);
var
  dev: TDevice;
  i: integer;
  Area_ID: word; kindAlarm, overSpeedAlarm, lying, kindArea: byte;
  cx, cy, radio: integer;
  param: array of byte;
  CircleArea:TCircleArea;
  circle:TEarthPoint;
  isvisible:integer;
  dateTime: TDateTime;
begin
  if length(Trim(Edit_NO.Text))=0 then
  begin
    messagebox(handle,'请输入区域编号','提示',mb_ok + mb_iconinformation);
    Edit_NO.SetFocus ;
    exit;
  end;
  if length(Trim(edit2.Text))=0 then
  begin
    messagebox(handle,'请输入区域名称','提示',mb_ok + mb_iconinformation);
    edit2.SetFocus ;
    exit;
  end;
  if CheckBox2.Checked then
  begin
    if length(Trim(Edit_MaxSpeed.Text))=0 then
    begin
      messagebox(handle,'请输入区域最高速度','提示',mb_ok + mb_iconinformation);
      Edit_MaxSpeed.SetFocus ;
      exit;
    end;

    if length(Trim(Edit_time.Text))=0 then
    begin
      messagebox(handle,'请输入持续时间','提示',mb_ok + mb_iconinformation);
      Edit_time.SetFocus ;
      exit;
    end;
  end;
//  Area_Property := 0;
  Area_Property := GetCheckListBoxValue();

  ModalResult := mrOk;
//
//  if length(areaID.Text) > 0 then        //修改
//  begin
//    CircleArea:=TCircleArea(FAllAreaManage.find(strtoint(areaID.Text)));
//    if CircleArea=nil then exit;
//
//    if combobox1.ItemIndex=0 then
//    begin
//      isvisible:=1;
//      CircleArea.isshow:=true;
//    end else
//    begin
//      isvisible:=0;
//      CircleArea.isshow:=false;
//    end;
//
//    CircleArea.areaNO := StrToInt(Edit_NO.Text);
//    CircleArea.AreaAlarmKind := Area_Property;
//    CircleArea.AreaName := Edit2.Text;
//
//    CircleArea.IsEveryDay :=  CheckBoxEveryDay.Checked ;
//    dateTime := beginDate.DateTime;
//    ReplaceTime(dateTime, beginTime.DateTime);
////    dateTime := StrToDateTime(FormatDatetime('yy-mm-dd hh:nn:ss',dateTime));
//    CircleArea.beginDateTiem := dateTime;
//
//    dateTime := endDate.DateTime;
//    ReplaceTime(dateTime, endTime.DateTime);
////    dateTime := StrToDateTime(FormatDatetime('yy-mm-dd hh:nn:ss',dateTime));
//    CircleArea.endDateTime := dateTime;
//
//    CircleArea.maxSpeed :=StrToInt(Edit_MaxSpeed.Text);
//    CircleArea.continueTime := StrToInt(Edit_time.Text);
//
////    cx:= round(CircleArea.ACircle.Longitude * 1000000);
////    cy :=round(CircleArea.ACircle.Latitude * 1000000);
////    radio:= CircleArea.radius;
////    Area_ID:=CircleArea.AreaID;
//
////    setlength(param, 12);
////    param[0] := strtoint('$' + copy(inttohex(cx, 8), 1, 2));
////    param[1] := strtoint('$' + copy(inttohex(cx, 8), 3, 2));
////    param[2] := strtoint('$' + copy(inttohex(cx, 8), 5, 2));
////    param[3] := strtoint('$' + copy(inttohex(cx, 8), 7, 2));
////    param[4] := strtoint('$' + copy(inttohex(cy, 8), 1, 2));
////    param[5] := strtoint('$' + copy(inttohex(cy, 8), 3, 2));
////    param[6] := strtoint('$' + copy(inttohex(cy, 8), 5, 2));
////    param[7] := strtoint('$' + copy(inttohex(cy, 8), 7, 2));
////    param[8] := strtoint('$' + copy(inttohex(radio, 8), 1, 2));
////    param[9] := strtoint('$' + copy(inttohex(radio, 8), 3, 2));
////    param[10] := strtoint('$' + copy(inttohex(radio, 8), 5, 2));
////    param[11] := strtoint('$' + copy(inttohex(radio, 8), 7, 2));
//    for i:=0 to listview1.Items.Count-1 do
//    begin
//      dev := TDevice(listview1.Items.Item[i].Data);
//      if dev <> nil then
//        DataServer.SendSetCircleArea_New_V3(dev, CircleArea);
//      //DataServer.SendCLIENT_SETELCFENCE(dev, Area_ID, CircleArea.AreaAlarmKind, CircleArea.OverAlarmValue, CircleArea.idlingAlarmValue, kindArea, 12, param);
//    end;
//    CircleArea.AreaName:=trim(edit2.Text);
//    //CircleArea.OverAlarmValue:=strtoint(OverAlarmValue.Text);
//    //CircleArea.idlingAlarmValue:=strtoint(idlingAlarmValue.Text);
//    //bs.ModifyArea_New(CircleArea.AreaName,CircleArea.AreaAlarmKind,CircleArea.OverAlarmValue,CircleArea.idlingAlarmValue,
//    //CircleArea.AreaPictureKind,12,CircleArea.areapar,CircleArea.areaID,isvisible);
//
////    Bs.ModifyAArea(CircleArea.AreaID, CircleArea.AreaName, CircleArea.AreaPictureKind,
////                   CircleArea.areaNO, CircleArea.AreaAlarmKind, DateTimeToStr(CircleArea.beginDateTiem),
////                   DateTimeToStr(CircleArea.endDateTime),CircleArea.maxSpeed, CircleArea.continueTime,
////                   1, CircleArea.AreaPar, CircleArea.AreaParMcu, isvisible);
//    Fmap.Draw;
//    close;
//  end else
//  begin
//    self.ModalResult := mrok;
//  end;
end;

procedure TFrm_AllArea.RzBitBtn5Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_AllArea.RzBitBtn4Click(Sender: TObject);
begin
  if ListView1.Selected<>nil then
  begin
    ListView1.Selected.Delete;
  end;
end;

procedure TFrm_AllArea.CheckBox7Click(Sender: TObject);
begin
//  if CheckBox7.Checked then
//    CheckBox7.Caption := '南纬'
//  else
//    CheckBox7.Caption := '北纬';
end;

procedure TFrm_AllArea.CheckBox8Click(Sender: TObject);
begin
//  if CheckBox8.Checked then
//    CheckBox8.Caption := '西经'
//  else
//    CheckBox8.Caption := '东经';
end;

procedure TFrm_AllArea.Edit_MaxSpeedKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (Key in [#8, '0'..'9', #22]) then Key := #0;
end;

procedure TFrm_AllArea.Edit_timeChange(Sender: TObject);
begin
  if StringToInteger(Edit_time.Text) >= 256 then
  begin
    messagebox(handle, ' 持续时间不能超过256!', '提示', mb_ok + mb_iconinformation);
    Edit_time.Text := '255';
  end;
end;

procedure TFrm_AllArea.Edit_NOExit(Sender: TObject);
begin
  if Trim(Edit_NO.Text) <> '' then
  begin
    if (StrToInt64(Trim(Edit_NO.Text)) > MAXLONGWORD) or (StrToInt64(Trim(Edit_NO.Text)) < 1) then
    begin
      messagebox(handle, '区域编号必须介于1~4294967295，请重新输入', '提示', mb_ok + mb_iconinformation);
      Edit_NO.SetFocus;
      Exit;          
    end;
    if FAllAreaManage.findByAreaNo(StrToInt(Edit_NO.Text)) <> nil then
    begin
      messagebox(handle, '该编号已经存在，不能使用!', '提示', mb_ok + mb_iconinformation);
      Edit_NO.SetFocus;
    end;
  end;
end;

procedure TFrm_AllArea.CheckBoxEveryDayClick(Sender: TObject);
begin
  beginDate.Enabled := not CheckBoxEveryDay.Checked;
  endDate.Enabled := not CheckBoxEveryDay.Checked;
end;

procedure TFrm_AllArea.CheckBox1Click(Sender: TObject);
begin
  CheckBoxEveryDay.Enabled := CheckBox1.Checked;
  if CheckBox1.Checked then
  begin
    if not CheckBoxEveryDay.Checked then
    begin
      beginDate.Enabled := CheckBox1.Checked;
      endDate.Enabled := CheckBox1.Checked;
    end;
  end
  else
  begin
    beginDate.Enabled := False;
    endDate.Enabled := False;
  end;  
  beginTime.Enabled := CheckBox1.Checked;
  endTime.Enabled := CheckBox1.Checked;
end;

procedure TFrm_AllArea.CheckBox2Click(Sender: TObject);
begin
  Edit_MaxSpeed.Enabled := CheckBox2.Checked;
  Edit_time.Enabled := CheckBox2.Checked;
end;

end.

