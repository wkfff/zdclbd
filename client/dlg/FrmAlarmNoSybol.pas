unit FrmAlarmNoSybol;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, uGloabVar, MetaDefine,
  Dialogs, StdCtrls, Mask, RzEdit, ComCtrls, ExtCtrls, RzButton, RzPanel, uFrmSelectDevs, CarUnit, ConfineAreaUnit,
  CmdStructUnit;

type
  TFrm_AlarmNoSybol = class(TForm)
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
    Label2: TLabel;
    Label3: TLabel;
    areaID: TEdit;
    idlingAlarmValue: TRzEdit;
    ComboBox3: TComboBox;
    OverAlarmValue: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
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
    Label4: TLabel;
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzBitBtn3Click(Sender: TObject);
    procedure RzBitBtn5Click(Sender: TObject);
    procedure RzBitBtn4Click(Sender: TObject);
    procedure Edit_timeKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_timeChange(Sender: TObject);
    procedure Edit_NOExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Area_Property: Integer;
    function GetCheckListBoxValue(): Word;
  end;

var
  Frm_AlarmNoSybol: TFrm_AlarmNoSybol;

implementation

{$R *.dfm}

function TFrm_AlarmNoSybol.GetCheckListBoxValue(): Word;
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

procedure TFrm_AlarmNoSybol.RzBitBtn1Click(Sender: TObject);
var
  cx, cy, Alen, i: integer;
  PointsCnt: integer;
  NoSymbolArea: TNoSymbolArea;
  param: array of byte;
  Apoint: TEarthPoint;
  dev: TDevice;
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
    NoSymbolArea := TNoSymbolArea(FAllAreaManage.find(strtoint(areaID.Text)));
    if NoSymbolArea=nil then exit;

    NoSymbolArea.AreaName:=trim(edit2.Text);

    NoSymbolArea.areaNO := StrToInt(Edit_NO.Text);
    NoSymbolArea.AreaAlarmKind := Area_Property;
    NoSymbolArea.AreaName := Edit2.Text;

    dateTime := beginDate.DateTime;
    ReplaceTime(dateTime, beginTime.DateTime);
    dateTime := StrToDateTime(FormatDatetime('yy-mm-dd hh:nn:ss',dateTime));
    NoSymbolArea.beginDateTiem := dateTime;

    dateTime := endDate.DateTime;
    ReplaceTime(dateTime, endTime.DateTime);
    dateTime := StrToDateTime(FormatDatetime('yy-mm-dd hh:nn:ss',dateTime));
    NoSymbolArea.endDateTime := dateTime;

    NoSymbolArea.maxSpeed :=StrToInt(Edit_MaxSpeed.Text);
    NoSymbolArea.continueTime := StrToInt(Edit_time.Text);

    NoSymbolArea.AreaPictureKind := 2;

    if combobox1.ItemIndex=0 then
    begin
      NoSymbolArea.isshow:=true;
      isvisible:=1;
    end else
    begin
      isvisible:=0;
      NoSymbolArea.isshow:=false;
    end;

    //NoSymbolArea.OverAlarmValue:=strtoint(OverAlarmValue.Text);
    //NoSymbolArea.idlingAlarmValue:=strtoint(idlingAlarmValue.Text);

    PointsCnt := NoSymbolArea.PointCount ;
    Alen := PointsCnt * 4* 2;
    setlength(param, Alen);
    for i := 0 to PointsCnt - 1 do
    begin
      Apoint := Project.XY2LoLa(NoSymbolArea.WorldPointAry[i]);
      cx := round(Apoint.Longitude * 1000000);
      cy := round(Apoint.Latitude * 1000000);
        //把世界坐标转换成地球坐标
      param[i*8] := strtoint('$' + copy(inttohex(cx, 8), 1, 2));
      param[i*8 + 1] := strtoint('$' + copy(inttohex(cx, 8), 3, 2));
      param[i*8 + 2] := strtoint('$' + copy(inttohex(cx, 8), 5, 2));
      param[i*8 + 3] := strtoint('$' + copy(inttohex(cx, 8), 7, 2));
      param[i*8 + 4] := strtoint('$' + copy(inttohex(cy, 8), 1, 2));
      param[i*8 + 5] := strtoint('$' + copy(inttohex(cy, 8), 3, 2));
      param[i*8 + 6] := strtoint('$' + copy(inttohex(cy, 8), 5, 2));
      param[i*8 + 7] := strtoint('$' + copy(inttohex(cy, 8), 7, 2));

    end;

    if ListView1.Items.Count > 0 then
    begin
      for i := 0 to listview1.Items.Count - 1 do
      begin
        dev := TDevice(listview1.Items.Item[i].Data);
        if Bs.ModifyDev_AreaList(dev.fact_id, dev.id, IntToStr(NoSymbolArea.AreaID)) then
          DataServer.SendSetNoSymbolArea_New_V3(dev, NoSymbolArea);
          //DataServer.SendCLIENT_SETELCFENCE(dev, NoSymbolArea.AreaID, NoSymbolArea.AreaAlarmKind, NoSymbolArea.OverAlarmValue, NoSymbolArea.idlingAlarmValue, NoSymbolArea.AreaPictureKind, Alen, param);
      end;
    end;

    //bs.ModifyArea_New(NoSymbolArea.AreaName,NoSymbolArea.AreaAlarmKind,NoSymbolArea.OverAlarmValue,NoSymbolArea.idlingAlarmValue,
    //NoSymbolArea.AreaPictureKind,PointsCnt*2,NoSymbolArea.areapar,NoSymbolArea.areaID,isvisible);
    Bs.ModifyAArea(NoSymbolArea.AreaID, NoSymbolArea.AreaName, NoSymbolArea.AreaPictureKind,
                   NoSymbolArea.areaNO, NoSymbolArea.AreaAlarmKind, DateTimeToStr(NoSymbolArea.beginDateTiem),
                   DateTimeToStr(NoSymbolArea.endDateTime),NoSymbolArea.maxSpeed, NoSymbolArea.continueTime,
                   NoSymbolArea.PointCount, NoSymbolArea.AreaPar, NoSymbolArea.AreaParMcu, isvisible);
    Fmap.Draw;
    close;
  end else
  begin
    self.ModalResult := mrok;
  end;
end;

procedure TFrm_AlarmNoSybol.RzBitBtn3Click(Sender: TObject);
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

procedure TFrm_AlarmNoSybol.RzBitBtn5Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_AlarmNoSybol.RzBitBtn4Click(Sender: TObject);
begin
  if ListView1.Selected<>nil then
  begin
    ListView1.Selected.Delete;
  end;
end;

procedure TFrm_AlarmNoSybol.Edit_timeKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (Key in [#8, '0'..'9', #22]) then Key := #0;
end;

procedure TFrm_AlarmNoSybol.Edit_timeChange(Sender: TObject);
begin
  if StringToInteger(Edit_time.Text) >= 256 then
  begin
    messagebox(handle, ' 持续时间不能超过256!', '提示', mb_ok + mb_iconinformation);
    Edit_time.Text := '255';
  end;
end;

procedure TFrm_AlarmNoSybol.Edit_NOExit(Sender: TObject);
begin
  if Trim(Edit_NO.Text) <> '' then
    if FAllAreaManage.findByAreaNo(StrToInt(Edit_NO.Text)) <> nil then
    begin
      messagebox(handle, '该编号已经存在，不能使用!', '提示', mb_ok + mb_iconinformation);
      Edit_NO.SetFocus;
    end;
end;

end.

