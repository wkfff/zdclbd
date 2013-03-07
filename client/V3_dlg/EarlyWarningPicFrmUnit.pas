unit EarlyWarningPicFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TEarlyWarningPicFrm = class(TForm)
    Panel4: TPanel;
    Splitter5: TSplitter;
    Splitter6: TSplitter;
    GroupBox5: TGroupBox;
    Panel5: TPanel;
    Image1: TImage;
    GroupBox6: TGroupBox;
    Panel6: TPanel;
    Image2: TImage;
    GroupBox7: TGroupBox;
    Panel7: TPanel;
    Image3: TImage;
    TimerShow: TTimer;
    TimerClose: TTimer;
    procedure TimerCloseTimer(Sender: TObject);
    procedure TimerShowTimer(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EarlyWarningPicFrm: TEarlyWarningPicFrm;

implementation

{$R *.dfm}

procedure TEarlyWarningPicFrm.TimerCloseTimer(Sender: TObject);
begin
  try
   if  (Self.Top <= Screen.Height)and(Self.Top >=(Screen.Height-Self.Height-40))then
   begin
      Self.Top:=Self.top+15;
      exit;
   end;
   Timerclose.Enabled:=false;
   Self.Hide;
  except
  end;
end;

procedure TEarlyWarningPicFrm.TimerShowTimer(Sender: TObject);
begin
  if Self.WindowState=wsMinimized then
  begin
   FlashWindow(Self.Handle,true);
   TimerShow.Interval:=2000;
   exit;
  end;
  if  Self.Top <= Screen.Height-Self.Height-25 then
  begin
    TimerShow.Enabled:=false;
    //Panel2.Enabled:=true;
    exit;
  end;
  TimerShow.Interval:=1;
  Self.Top:=Self.top-10;
end;

procedure TEarlyWarningPicFrm.FormDeactivate(Sender: TObject);
begin
  TimerShow.Enabled:=true;
end;

procedure TEarlyWarningPicFrm.FormActivate(Sender: TObject);
begin
   if Self.WindowState=wsMinimized then TimerShow.Enabled:=false;
end;

procedure TEarlyWarningPicFrm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := False;
  TimerClose.Enabled:=true;
end;

procedure TEarlyWarningPicFrm.FormShow(Sender: TObject);
begin
  Self.Top:=Screen.Height;//-Self.Height-30;
  if Self.WindowState=wsMinimized then
  begin
    Self.Top:=Screen.Height-Self.Height;
    Self.WindowState:=wsMinimized;
  end;
  //Self.Width:=Screen.Width;
  Self.Left:=Screen.Width - Self.Width;
  TimerShow.Enabled:=true;
end;

end.
