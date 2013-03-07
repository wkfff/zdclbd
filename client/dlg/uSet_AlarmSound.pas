unit uSet_AlarmSound;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,MMSystem, MPlayer;

type
  TSetAlarmSound = class(TForm)
    Panel1: TPanel;
    OpenDialog1: TOpenDialog;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    listen_btn: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    stop_btn: TBitBtn;
    MediaPlayer1: TMediaPlayer;
    procedure listen_btnClick(Sender: TObject);
    procedure stop_btnClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SetAlarmSound: TSetAlarmSound;

implementation

{$R *.dfm}

procedure TSetAlarmSound.listen_btnClick(Sender: TObject);
begin
  PlaySound(pchar(edit1.text),Hinstance,SND_FILENAME);
  try
    if trim(edit1.text)='' then exit;
    MediaPlayer1.DeviceType := dtAutoSelect;
    MediaPlayer1.FileName := edit1.text;
    MediaPlayer1.Open;
    MediaPlayer1.Resume ;
    stop_btn.Enabled :=true;
    Enabled := false;
  except
  end;
end;

procedure TSetAlarmSound.stop_btnClick(Sender: TObject);
begin
  try
    MediaPlayer1.Stop;
    MediaPlayer1.Close;
    listen_btn.Enabled :=true;
    Enabled := false;
  except
  end;
end;

procedure TSetAlarmSound.SpeedButton1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    edit1.Text:= OpenDialog1.FileName ;
    listen_btn.Enabled := true;
    stop_btn.Enabled :=false;
  end;
end;

end.
