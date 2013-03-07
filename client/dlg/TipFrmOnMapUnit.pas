unit TipFrmOnMapUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, RzBorder, RzPanel, StdCtrls, RzLabel,
  CurvyControls, CarUnit;

type
  TTipFrmOnMap = class(TForm)
    CurvyPanel1: TCurvyPanel;
    RzBorder1: TRzBorder;
    RzBorder2: TRzBorder;
    RzBorder3: TRzBorder;
    RzBorder4: TRzBorder;
    RzPanel2: TRzPanel;
    Timer1: TTimer;
    pnl4Image: TRzPanel;
    lblAlarmTime: TRzLabel;
    lblAlarmSpeed: TRzLabel;
    Image1: TImage;
    RzPanel4: TRzPanel;
    lblGpsTime: TRzLabel;
    lblSpeed1: TRzLabel;
    RzPanel3: TRzPanel;
    Image2: TImage;
    lblCarNo: TRzLabel;
    lblDir: TRzLabel;
    lblDriver: TRzLabel;
    lblSim: TRzLabel;
    lblSpeed: TRzLabel;
    Image3: TImage;
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image2Click(Sender: TObject);
    procedure lblAlarmTimeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lblCarNoDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FShowTime: TDateTime;
  public
    { Public declarations }
    FDev: TDevice;
    FIsWaitingPic: Boolean;

    procedure setNoPic();
  end;

implementation
uses
  DateUtils;

{$R *.dfm}

procedure TTipFrmOnMap.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  SendMessage(Handle, WM_SYSCOMMAND, $F011, 0);
end;

procedure TTipFrmOnMap.Image2Click(Sender: TObject);
begin
  Close;
end;

procedure TTipFrmOnMap.lblAlarmTimeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  SendMessage(Handle, WM_SYSCOMMAND, $F011, 0);
end;

procedure TTipFrmOnMap.Timer1Timer(Sender: TObject);
var
  ms : TMemoryStream;
  jpegfile : TJPEGImage;
begin
  if FIsWaitingPic then
  begin
    if FDev.IsLastPicSet then
    begin
      FIsWaitingPic := False;
      if Length(FDev.LastFatigueAlarmPicData) > 0 then
      begin
        ms := TMemoryStream.Create;
        jpegfile := TJPEGImage.Create;
        try
          try
            ms.Write(FDev.LastFatigueAlarmPicData[0],length(FDev.LastFatigueAlarmPicData));
            ms.Position := 0;
            jpegfile.LoadFromStream(ms);
            Image1.Picture.Graphic := jpegfile;
            lblAlarmTime.Caption := '' + Fdev.LastFatigueAlarmGpsTime;
            lblAlarmSpeed.Caption := '速度:' + FormatFloat('0.#', Fdev.LastFatigueAlarmSpeed) + 'km/h';
            if Fdev.LastPicType <> 4 then
            begin
              lblAlarmTime.Font.Color := clGreen;
              lblAlarmSpeed.Font.Color := clGreen;
            end;
          except
          end;
        finally
          ms.free;
          jpegfile.Free;
        end;
      end
      else
      begin
        setNoPic;
      end;    
    end;    
  end;
  if SecondsBetween(FShowTime, Now) >= 8 then
    Close;  
end;

procedure TTipFrmOnMap.FormShow(Sender: TObject);
begin
  Timer1.Enabled := True;
  FShowTime := Now;
end;

procedure TTipFrmOnMap.lblCarNoDblClick(Sender: TObject);
begin
  Close;
end;

procedure TTipFrmOnMap.setNoPic;
begin
  Image1.Picture.Graphic := Image3.Picture.Graphic;
  lblAlarmTime.Caption := '该车无照片数据';
  lblAlarmTime.Font.Color := clGreen;
end;

procedure TTipFrmOnMap.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Timer1.Enabled := False;
  Action := caFree;
end;

end.
