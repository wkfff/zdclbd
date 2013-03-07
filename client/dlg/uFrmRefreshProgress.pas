{
 刷新信息时，弹出的进度框
  @author(沙)
  @created(2005-5-25)
  @lastmod(GMT:$Date: 2012/12/31 05:06:18 $) <BR>
  最后更新人:$Author: wfp $  <BR>
  当前版本:$Revision: 1.2 $  <BR>
  }
unit uFrmRefreshProgress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Gauges, StdCtrls, ExtCtrls, ComCtrls, AdvWiiProgressBar;

type
  TFrmRefreshProgress = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    Gauge1: TGauge;
    Animate1: TAnimate;
    AdvWiiProgressBar1: TAdvWiiProgressBar;
    procedure FormShow(Sender: TObject);
  private
    
    { Private declarations }
  public
     procedure GaugeProcessInc(Count: Integer);
     procedure SetCaption(Caption:string);

     procedure SetProgressTip(tip: string);
     procedure addProgress(v: Integer);
    { Public declarations }
  end;

var
  FrmRefreshProgress: TFrmRefreshProgress;

implementation

{$R *.dfm}


procedure TFrmRefreshProgress.GaugeProcessInc(Count: Integer);
begin
  Gauge1.AddProgress(Count);
  Application.ProcessMessages;
end;


procedure TFrmRefreshProgress.SetCaption(Caption: string);
begin
self.Caption:=Caption;
Self.Label1.Caption:=Caption;
end;

procedure TFrmRefreshProgress.FormShow(Sender: TObject);
begin
//  if (FileExists(Trim(ExtractFilePath(Application.ExeName) + 'loading.avi'))) then
//  begin
//    Animate1.FileName := Trim(ExtractFilePath(Application.ExeName) + 'loading.avi');
//    Animate1.Visible := True;
//    Animate1.Active := True;
//  end
//  else
//  begin
//    Animate1.FileName := '';
//    Animate1.Visible := False;
//    Animate1.Active := False;
//  end;
end;

procedure TFrmRefreshProgress.SetProgressTip(tip: string);
begin
  label1.Caption := tip;
end;

procedure TFrmRefreshProgress.addProgress(v: Integer);
begin
  Gauge1.AddProgress(v);
end;

end.
