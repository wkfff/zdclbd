{
  设置电子围栏区域属性
  @author()
  @created()
  @lastmod(GMT:$Date: 2012/10/29 01:46:42 $) <BR>
  最后更新人:$Author: wfp $  <BR>
  当前版本:$Revision: 1.1.1.1 $  <BR>}
unit uConfineAreaSetFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, ExtDlgs;

type
  TConfineAreaSetFrm = class(TForm)
    Panel1: TPanel;
    BitBtn_ok: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    Edit_AreaID: TEdit;
    Edit_AreaName: TEdit;
    Edit_AreaColor: TEdit;
    CheckBox_IsDraw: TCheckBox;
    ColorDialog1: TColorDialog;
    BitBtn_Cancel: TBitBtn;
    Label4: TLabel;
    ComboBox_AreaType: TComboBox;
    Edit_LimitSpeet: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    GroupBox2: TGroupBox;
    CheckBoxEnabledTime: TCheckBox;
    BeginTime: TDateTimePicker;
    EndTime: TDateTimePicker;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    CheckBoxShowPop: TCheckBox;
    Label10: TLabel;
    Label11: TLabel;
    Panel2: TPanel;
    OpenDialog1: TOpenDialog;
    Notebook1: TNotebook;
    Label12: TLabel;
    Label13: TLabel;
    SpeedButton2: TSpeedButton;
    editText: TEdit;
    editFilePath: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label14: TLabel;
    editMinSpeed: TEdit;
    Label15: TLabel;
    editMaintainTime: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    arriveDate: TDateTimePicker;
    arriveTime: TDateTimePicker;
    leaveDate: TDateTimePicker;
    leaveTime: TDateTimePicker;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn_okClick(Sender: TObject);
    procedure ComboBox_AreaTypeChange(Sender: TObject);
    procedure Edit_LimitSpeetKeyPress(Sender: TObject; var Key: Char);
    procedure CheckBoxEnabledTimeClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ConfineAreaSetFrm: TConfineAreaSetFrm;

implementation
uses
  DateUtils;

{$R *.dfm}

{
车辆驶出区域报警
车辆驶入区域报警
车辆区域限速报警
车辆驶出路线报警
车辆驶入路线报警
聚集报警
出城留台
自动设置防伪密标
疑似上访区域报警
}
procedure TConfineAreaSetFrm.SpeedButton1Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
    Edit_AreaColor.Color :=  ColorDialog1.Color;
end;

procedure TConfineAreaSetFrm.FormCreate(Sender: TObject);
begin
  Edit_AreaID.Text    := '';
  Edit_AreaName.Text  := '';
  Edit_AreaColor.Text := '';
  ComboBox_AreaType.Text := '';
  CheckBox_IsDraw.Checked := false;
  Edit_LimitSpeet.Visible:=false;
  Label5.Visible:=false;
  Label6.Visible:=false;
  Label10.Visible := False;
  Label11.Visible := False;
end;

procedure TConfineAreaSetFrm.BitBtn_okClick(Sender: TObject);
var
  i:integer;
  d1, d2: TDateTime;
begin
  if Edit_AreaName.Text='' then
  begin
    messagebox(handle,'请您输入电子围栏的名称！','提示',mb_ok + mb_iconinformation);
    Edit_AreaName.SetFocus;
    exit;
  end;
  if ComboBox_AreaType.Text ='' then
  begin
    messagebox(handle,'请您选择电子围栏的类型！','提示',mb_ok + mb_iconinformation);
    ComboBox_AreaType.SetFocus;
    exit;
  end;
  if Edit_LimitSpeet.Visible then
  begin
    if Edit_LimitSpeet.Text='' then
    begin
      if ComboBox_AreaType.ItemIndex = 5 then
      begin
        messagebox(handle,'请您输入限定车辆数！','提示',mb_ok + mb_iconinformation);
      end
      else
      begin
        messagebox(handle,'请您输入限速的速度！','提示',mb_ok + mb_iconinformation);
      end;
      Edit_LimitSpeet.SetFocus;
      exit;
    end
    else
    begin
      i:=StrToInt(Edit_LimitSpeet.Text);
      if not((i>=1)and(i<=255)) then
      begin
        messagebox(handle,'请您输入1到255之间的数！','提示',mb_ok + mb_iconinformation);
        Edit_LimitSpeet.SetFocus;
        exit;
      end;
    end;
  end;

  if ComboBox_AreaType.ItemIndex = 2 then
  begin
    d1 := arriveDate.DateTime;
    ReplaceTime(d1, arriveTime.Time);

    d2 := leaveDate.DateTime;
    ReplaceTime(d2, leaveTime.Time);
    if d2 <= d1 then
    begin
      messagebox(handle,'离开时间必须大于到达时间，请重新选择时间','提示',mb_ok + mb_iconinformation);
      leaveTime.SetFocus;
      exit;
    end;  
  end;    
  
  ModalResult := mrok;
end;

procedure TConfineAreaSetFrm.ComboBox_AreaTypeChange(Sender: TObject);
var
  dt: TDateTime;
begin
  Label5.Visible := False;
  Label10.Visible := False;

  Label6.Visible := False;
  Label11.Visible := False;
  Edit_LimitSpeet.Visible:=false;

  if ComboBox_AreaType.ItemIndex = 2 then
  begin
    Panel2.Visible := True;
    Notebook1.PageIndex := 2;
    dt := IncHour(Now, 1);
    arriveDate.DateTime := dt;
    arriveTime.DateTime := dt;
    dt := IncHour(dt, 1);
    leaveDate.DateTime := dt;
    leaveTime.DateTime := dt;
  end
  else
  begin
    Panel2.Visible := False;
  end;

//  if ComboBox_AreaType.ItemIndex =2 then
//  begin
//    Edit_LimitSpeet.Clear;
//    Edit_LimitSpeet.Visible:=true;
//    Label5.Visible:=true;
//    Label5.Caption := '限速：';
//    Label6.Caption := '公里/时';
//    Label6.Visible:=true;
//    Edit_LimitSpeet.SetFocus;
//  end
//  else if ComboBox_AreaType.ItemIndex = 6 then
//  begin
//    Edit_LimitSpeet.Clear;
//    Edit_LimitSpeet.Visible:=true;
//    Label5.Visible:=true;
//    Label5.Caption := '限时：';
//    Label6.Caption := '分钟';
//    Label6.Visible:=true;
//    Edit_LimitSpeet.SetFocus;
//  end
//  else
//  begin
//    Edit_LimitSpeet.Visible:=false;
//    Label5.Visible:=false;
//    Label6.Visible:=false;
//  end;
//
//  if ComboBox_AreaType.ItemIndex = 5 then
//  begin
//    Edit_LimitSpeet.Clear;
//    Edit_LimitSpeet.Visible:=true;
//    Label10.Visible:=true;
//    Label11.Visible:=true;
//    Edit_LimitSpeet.SetFocus;
//  end;
//
//  if ComboBox_AreaType.ItemIndex = 7 then
//  begin
//    Panel2.Visible := True;
//    Notebook1.PageIndex := 0;
//  end
//  else
//  begin
//    Panel2.Visible := False;
//  end;
//
//  if ComboBox_AreaType.ItemIndex = 8 then
//  begin
//    Panel2.Visible := True;
//    Notebook1.PageIndex := 1;
//    Edit_LimitSpeet.Clear;
//    Edit_LimitSpeet.Visible:=true;
//    Label10.Visible:=true;
//    Label11.Visible:=true;
//    Edit_LimitSpeet.SetFocus;
//  end
//  else
//  begin
//    Panel2.Visible := False;
//  end;
end;

procedure TConfineAreaSetFrm.Edit_LimitSpeetKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in [#8,'0'..'9','.']) then Key := #0;
end;

procedure TConfineAreaSetFrm.CheckBoxEnabledTimeClick(Sender: TObject);
begin
  GroupBox2.Enabled:=CheckBoxEnabledTime.Checked;
  BeginTime.Enabled:=GroupBox2.Enabled;
  EndTime.Enabled:=GroupBox2.Enabled;
  if GroupBox2.Enabled then
  begin
     BeginTime.Color:=clWindow;
     EndTime.Color:=clWindow;
  end
  else
  begin
     BeginTime.Color:=clBtnFace;
     EndTime.Color:=clBtnFace;
  end;
end;

procedure TConfineAreaSetFrm.SpeedButton2Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    editFilePath.Text:= OpenDialog1.FileName ;
  end;
end;

end.
