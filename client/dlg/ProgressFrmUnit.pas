unit ProgressFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Gauges;

type
  TProgressFrm = class(TForm)
    Gauge1: TGauge;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GaugeProcessInc(Count: Integer);
//    procedure SetProcess(Precess:integer);
  end;

var
  ProgressFrm: TProgressFrm;

implementation

{$R *.dfm}

{ TProgressFrm }

procedure TProgressFrm.GaugeProcessInc(Count: Integer);
begin
  Gauge1.AddProgress(Count);
  Application.ProcessMessages;
end;

procedure TProgressFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  ProgressFrm := nil;
end;

{procedure TProgressFrm.SetProcess(Precess: integer);
begin
  Gauge1.Progress := Precess;
  Application.ProcessMessages;
end;     }

end.

