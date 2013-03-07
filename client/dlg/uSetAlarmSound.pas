unit uSetAlarmSound;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,MMSystem, MPlayer;

type
  TSetAlarmSound = class(TForm)
    Panel1: TPanel;
    OpenDialog1: TOpenDialog;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Edit_DevAlarmSound: TEdit;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    GroupBox2: TGroupBox;
    SpeedButton2: TSpeedButton;
    Label2: TLabel;
    Edit_InOutAreaAlarmSound: TEdit;
    listen_btn: TBitBtn;
    Listen_Btn2: TBitBtn;
    GroupBox3: TGroupBox;
    SpeedButton3: TSpeedButton;
    Label3: TLabel;
    Edit_DeviateAlarmSound: TEdit;
    BitBtnListenInAlarmCASound: TBitBtn;
    GroupBox4: TGroupBox;
    SpeedButton4: TSpeedButton;
    Label4: TLabel;
    Edit_OverSpeedAlarmSound: TEdit;
    BitBtn1: TBitBtn;
    GroupBox5: TGroupBox;
    SpeedButton5: TSpeedButton;
    Label5: TLabel;
    Edit_DevFaultAlarmSound: TEdit;
    BitBtn4: TBitBtn;
    GroupBox6: TGroupBox;
    SpeedButton6: TSpeedButton;
    Label6: TLabel;
    Edit_FatigueAlarmSound: TEdit;
    BitBtn5: TBitBtn;
    GroupBox7: TGroupBox;
    SpeedButton7: TSpeedButton;
    Label7: TLabel;
    Edit_PowerDownAlarmsound: TEdit;
    BitBtn6: TBitBtn;
    GroupBox8: TGroupBox;
    SpeedButton8: TSpeedButton;
    Label8: TLabel;
    Edit_UndervoltageAlarmsound: TEdit;
    BitBtn7: TBitBtn;
    GroupBox9: TGroupBox;
    SpeedButton9: TSpeedButton;
    Label9: TLabel;
    Edit_TimeoutStopAlarmSound: TEdit;
    BitBtn8: TBitBtn;
    GroupBox10: TGroupBox;
    SpeedButton10: TSpeedButton;
    Label10: TLabel;
    edtServerDisconnectAlarmSound: TEdit;
    BitBtn9: TBitBtn;
    procedure listen_btnClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Listen_Btn2Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtnListenInAlarmCASoundClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SetAlarmSound: TSetAlarmSound;

implementation
uses uGloabVar;
{$R *.dfm}

procedure TSetAlarmSound.listen_btnClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    listen_btn.Enabled := false;
    MediaPalySound(Edit_DevAlarmSound.text);
    //PlaySound(pchar(Edit_DevAlarmSound.text),Hinstance,SND_FILENAME);
  finally
    listen_btn.Enabled := true;
    Screen.Cursor := crDefault;
  end;
end;

procedure TSetAlarmSound.SpeedButton1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    Edit_DevAlarmSound.Text:= OpenDialog1.FileName ;
    listen_btn.Enabled := true;
  end;
end;

procedure TSetAlarmSound.FormCreate(Sender: TObject);
begin
  OpenDialog1.InitialDir := '..\AlarmWav'    ;
end;

procedure TSetAlarmSound.Listen_Btn2Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    listen_btn2.Enabled := false;
    MediaPalySound(Edit_InOutAreaAlarmSound.text);
    //PlaySound(pchar(Edit_OutCAreaAlarmSound.text),Hinstance,SND_FILENAME);
  finally
    listen_btn2.Enabled := true;
    Screen.Cursor := crDefault;
  end;
end;

procedure TSetAlarmSound.SpeedButton2Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    Edit_InOutAreaAlarmSound.Text:= OpenDialog1.FileName ;
    listen_btn2.Enabled := true;
  end;
end;

procedure TSetAlarmSound.BitBtnListenInAlarmCASoundClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    BitBtnListenInAlarmCASound.Enabled := false;
    MediaPalySound(Edit_DeviateAlarmSound.text);
    //PlaySound(pchar(Edit_InCAreaAlarmSound.text),Hinstance,SND_FILENAME);
  finally
    BitBtnListenInAlarmCASound.Enabled := true;
    Screen.Cursor := crDefault;
  end;
end;

procedure TSetAlarmSound.SpeedButton3Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    Edit_DeviateAlarmSound.Text:= OpenDialog1.FileName ;
    BitBtnListenInAlarmCASound.Enabled := true;
  end;
end;

procedure TSetAlarmSound.SpeedButton4Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    Edit_OverSpeedAlarmSound.Text:= OpenDialog1.FileName ;
    BitBtn1.Enabled := true;
  end;
end;

procedure TSetAlarmSound.SpeedButton5Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    Edit_DevFaultAlarmSound.Text:= OpenDialog1.FileName ;
    BitBtn4.Enabled := true;
  end;
end;

procedure TSetAlarmSound.BitBtn1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    TBitBtn(Sender).Enabled := false;
    MediaPalySound(Edit_OverSpeedAlarmSound.text);
    //PlaySound(pchar(Edit_OverSpeedAlarmSound.text),Hinstance,SND_FILENAME);
  finally
    TBitBtn(Sender).Enabled := true;
    Screen.Cursor := crDefault;
  end;
end;

procedure TSetAlarmSound.BitBtn4Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    TBitBtn(Sender).Enabled := false;
//    MediaPalySound(Edit_DevFaultAlarmSound.text);
    PlaySound(pchar(Edit_DevFaultAlarmSound.text),Hinstance,SND_ASYNC);
  finally
    TBitBtn(Sender).Enabled := true;
    Screen.Cursor := crDefault;
  end;
end;

procedure TSetAlarmSound.BitBtn5Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    TBitBtn(Sender).Enabled := false;
    MediaPalySound(Edit_FatigueAlarmSound.text);
    //PlaySound(pchar(Edit_MenuSound.text),Hinstance,SND_FILENAME);
  finally
    TBitBtn(Sender).Enabled := true;
    Screen.Cursor := crDefault;
  end;
end;

procedure TSetAlarmSound.SpeedButton6Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    Edit_FatigueAlarmSound.Text:= OpenDialog1.FileName ;
    SpeedButton6.Enabled := true;
  end;
end;

procedure TSetAlarmSound.BitBtn6Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    TBitBtn(Sender).Enabled := false;
    MediaPalySound(Edit_PowerDownAlarmsound.text);
  finally
    TBitBtn(Sender).Enabled := true;
    Screen.Cursor := crDefault;
  end;
end;

procedure TSetAlarmSound.BitBtn7Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    TBitBtn(Sender).Enabled := false;
    MediaPalySound(Edit_UndervoltageAlarmsound.text);
  finally
    TBitBtn(Sender).Enabled := true;
    Screen.Cursor := crDefault;
  end;
end;

procedure TSetAlarmSound.BitBtn8Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    TBitBtn(Sender).Enabled := false;
    MediaPalySound(Edit_TimeoutStopAlarmSound.text);
  finally
    TBitBtn(Sender).Enabled := true;
    Screen.Cursor := crDefault;
  end;
end;

procedure TSetAlarmSound.SpeedButton7Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    Edit_PowerDownAlarmsound.Text:= OpenDialog1.FileName ;
    BitBtn6.Enabled := true;
  end;
end;

procedure TSetAlarmSound.SpeedButton8Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    Edit_UndervoltageAlarmsound.Text:= OpenDialog1.FileName ;
    BitBtn7.Enabled := true;
  end;
end;

procedure TSetAlarmSound.SpeedButton9Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    Edit_TimeoutStopAlarmSound.Text:= OpenDialog1.FileName ;
    BitBtn8.Enabled := true;
  end;
end;

procedure TSetAlarmSound.SpeedButton10Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    edtServerDisconnectAlarmSound.Text := OpenDialog1.FileName;
    BitBtn9.Enabled := True;
  end;  
end;

procedure TSetAlarmSound.BitBtn9Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    TBitBtn(Sender).Enabled := false;
    MediaPalySound(edtServerDisconnectAlarmSound.text);
  finally
    TBitBtn(Sender).Enabled := true;
    Screen.Cursor := crDefault;
  end;
end;

end.
