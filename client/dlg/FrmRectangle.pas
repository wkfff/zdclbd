unit FrmRectangle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, RzButton, StdCtrls, Mask, RzEdit, RzPanel, ExtCtrls, uFrmSelectDevs,
  uGloabVar, CarUnit,ConfineAreaUnit, CmdStructUnit;

type
  TFrm_Rectangle = class(TForm)
    Panel1: TPanel;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    areaID: TEdit;
    idlingAlarmValue: TRzEdit;
    ComboBox3: TComboBox;
    OverAlarmValue: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    Edit3: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    GroupBox1: TGroupBox;
    ListView1: TListView;
    RzBitBtn3: TRzBitBtn;
    RzBitBtn4: TRzBitBtn;
    RzPanel2: TRzPanel;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn5: TRzBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    ComboBox1: TComboBox;
    GroupBox2: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    Edit_NO: TEdit;
    Label6: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    beginDate: TDateTimePicker;
    beginTime: TDateTimePicker;
    endDate: TDateTimePicker;
    endTime: TDateTimePicker;
    Edit_MaxSpeed: TEdit;
    Edit_time: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    procedure RzBitBtn3Click(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzBitBtn5Click(Sender: TObject);
    procedure RzBitBtn4Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
    procedure Edit_timeKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_timeChange(Sender: TObject);
    procedure Edit_NOExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    beginp:TPoint;
     endp:TPoint;
     Area_Property: Integer;
     function GetCheckListBoxValue(): Word;
  end;

var
  Frm_Rectangle: TFrm_Rectangle;

implementation

{$R *.dfm}

procedure TFrm_Rectangle.RzBitBtn3Click(Sender: TObject);
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

function TFrm_Rectangle.GetCheckListBoxValue(): Word;
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
  tmp: Byte;
begin
  FillChar(b, 16, 0);
  FillChar(sndAry, 2, 0);
  b[0] := GetChecked(CheckBox1);
  b[1] := GetChecked(CheckBox2);
  b[2] := GetChecked(CheckBox3);
  b[3] := GetChecked(CheckBox4);
  b[4] := GetChecked(CheckBox5);
  b[5] := GetChecked(CheckBox6);
  b[6] := GetChecked(CheckBox7);
  b[7] := GetChecked(CheckBox8);


  i := 0;
  //取出 0-16，共4个字节。12 13 14 15
  while i <= 15 do
  begin
    k := i mod 8;
    if k = 0 then tmp := 0;
    tmp := tmp + b[i] shl k;
    if k = 7 then
      sndAry[1 - i div 8] := tmp;
    inc(i);
  end;
  Result :=(sndAry[0] shl 8) + sndAry[1];
end;

procedure TFrm_Rectangle.RzBitBtn1Click(Sender: TObject);
var
  dev: TDevice;
  i: integer;
  Area_ID: word; kindAlarm, overSpeedAlarm, lying, kindArea: byte;
  cx, cy,cx1,cy1: integer;
  param: array of byte;
  RectangleArea:TRectangleArea;
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
  Area_Property := 0;
  Area_Property := GetCheckListBoxValue();
  
  if length(areaID.Text) > 0 then
  begin
    RectangleArea:=TRectangleArea(FAllAreaManage.find(strtoint(areaID.Text)));
    if RectangleArea=nil then exit;

    RectangleArea.AreaName:=trim(edit2.Text);

    RectangleArea.areaNO := StrToInt(Edit_NO.Text);
    RectangleArea.AreaAlarmKind := Area_Property;
    RectangleArea.AreaName := Edit2.Text;

    dateTime := beginDate.DateTime;
    ReplaceTime(dateTime, beginTime.DateTime);
    dateTime := StrToDateTime(FormatDatetime('yy-mm-dd hh:nn:ss',dateTime));
    RectangleArea.beginDateTiem := dateTime;

    dateTime := endDate.DateTime;
    ReplaceTime(dateTime, endTime.DateTime);
    dateTime := StrToDateTime(FormatDatetime('yy-mm-dd hh:nn:ss',dateTime));
    RectangleArea.endDateTime := dateTime;

    RectangleArea.maxSpeed :=StrToInt(Edit_MaxSpeed.Text);
    RectangleArea.continueTime := StrToInt(Edit_time.Text);

    RectangleArea.AreaPictureKind := 1;
    if ComboBox1.ItemIndex = 0 then
    begin
      RectangleArea.isshow := true;
      isvisible := 1;
    end else
    begin
      isvisible := 0;
      RectangleArea.isshow := false;
    end;

    //RectangleArea.OverAlarmValue:=strtoint(OverAlarmValue.Text);
    //RectangleArea.idlingAlarmValue:=strtoint(idlingAlarmValue.Text);

    RectangleArea.AreaPictureKind:=1;
    cx := round(RectangleArea.leftPoint.Longitude*1000000);
    cy := round(RectangleArea.leftPoint.Latitude*1000000);
    cx1 := round(RectangleArea.RightPoint.Longitude*1000000);
    cy1 := round(RectangleArea.RightPoint.Latitude*1000000);
    Area_ID:=RectangleArea.AreaID;
    RectangleArea.AreaPar:=inttostr(cx)+','+inttostr(cy)+','+inttostr(cx1)+','+inttostr(cy1);
    setlength(param, 16);
    param[0] := strtoint('$' + copy(inttohex(cx, 8), 1, 2));
    param[1] := strtoint('$' + copy(inttohex(cx, 8), 3, 2));
    param[2] := strtoint('$' + copy(inttohex(cx, 8), 5, 2));
    param[3] := strtoint('$' + copy(inttohex(cx, 8), 7, 2));
    param[4] := strtoint('$' + copy(inttohex(cy, 8), 1, 2));
    param[5] := strtoint('$' + copy(inttohex(cy, 8), 3, 2));
    param[6] := strtoint('$' + copy(inttohex(cy, 8), 5, 2));
    param[7] := strtoint('$' + copy(inttohex(cy, 8), 7, 2));
    param[8] := strtoint('$' + copy(inttohex(cx1, 8), 1, 2));
    param[9] := strtoint('$' + copy(inttohex(cx1, 8), 3, 2));
    param[10] := strtoint('$' + copy(inttohex(cx1, 8), 5, 2));
    param[11] := strtoint('$' + copy(inttohex(cx1, 8), 7, 2));
    param[12] := strtoint('$' + copy(inttohex(cy1, 8), 1, 2));
    param[13] := strtoint('$' + copy(inttohex(cy1, 8), 3, 2));
    param[14] := strtoint('$' + copy(inttohex(cy1, 8), 5, 2));
    param[15] := strtoint('$' + copy(inttohex(cy1, 8), 7, 2));
    //RectangleArea.AreaAlarmKind:=ComboBox3.ItemIndex;
    for i:=0 to listview1.Items.Count-1 do
    begin
      dev := TDevice(listview1.Items.Item[i].Data);
      if Bs.AddNewDev_Area(dev.id, RectangleArea.AreaID) then
        DataServer.SendSetRectangleArea_New_V3(dev, RectangleArea, 1);
        //DataServer.SendCLIENT_SETELCFENCE(dev, Area_ID, RectangleArea.AreaAlarmKind, RectangleArea.OverAlarmValue, RectangleArea.idlingAlarmValue, RectangleArea.AreaPictureKind, 16, param);
    end;
    //bs.ModifyArea_New(RectangleArea.AreaName,RectangleArea.AreaAlarmKind,RectangleArea.OverAlarmValue,RectangleArea.idlingAlarmValue,
    //RectangleArea.AreaPictureKind,16,RectangleArea.areapar,RectangleArea.areaID,isvisible);
    Bs.ModifyAArea(RectangleArea.AreaID, RectangleArea.AreaName, RectangleArea.AreaPictureKind,
                   RectangleArea.areaNO, RectangleArea.AreaAlarmKind, DateTimeToStr(RectangleArea.beginDateTiem),
                   DateTimeToStr(RectangleArea.endDateTime),RectangleArea.maxSpeed, RectangleArea.continueTime,
                   2, RectangleArea.AreaPar, RectangleArea.AreaParMcu, isvisible);
    Fmap.Draw;
    close;
  end else
  begin
    self.ModalResult := mrok;
  end;

end;

procedure TFrm_Rectangle.RzBitBtn5Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_Rectangle.RzBitBtn4Click(Sender: TObject);
begin
  if ListView1.Selected<>nil then
  begin
    ListView1.Selected.Delete;
  end;
end;

procedure TFrm_Rectangle.CheckBox7Click(Sender: TObject);
begin
  if CheckBox7.Checked then
    CheckBox7.Caption := '南纬'
  else
    CheckBox7.Caption := '北纬';
end;

procedure TFrm_Rectangle.CheckBox8Click(Sender: TObject);
begin
  if CheckBox8.Checked then
    CheckBox8.Caption := '西经'
  else
    CheckBox8.Caption := '东经';
end;

procedure TFrm_Rectangle.Edit_timeKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in [#8, '0'..'9', #22]) then Key := #0;
end;

procedure TFrm_Rectangle.Edit_timeChange(Sender: TObject);
begin
  if StringToInteger(Edit_time.Text) >= 256 then
  begin
    messagebox(handle, ' 持续时间不能超过256!', '提示', mb_ok + mb_iconinformation);
    Edit_time.Text := '255';
  end;
end;

procedure TFrm_Rectangle.Edit_NOExit(Sender: TObject);
begin
  if Trim(Edit_NO.Text) <> '' then
    if FAllAreaManage.findByAreaNo(StrToInt(Edit_NO.Text)) <> nil then
    begin
      messagebox(handle, '该编号已经存在，不能使用!', '提示', mb_ok + mb_iconinformation);
      Edit_NO.SetFocus;
    end;
end;

end.
