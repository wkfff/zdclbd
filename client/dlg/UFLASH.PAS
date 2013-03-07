unit uflash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Gauges;

type
  Tflash = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Panel3: TPanel;
    Gauge1: TGauge;
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  flash: Tflash;


implementation

{$R *.dfm}

procedure Tflash.FormPaint(Sender: TObject);
begin
{var i:word;
dy,y:real;
begin 
  dy:=clientheight/256;
  y:=0;
  for i:=255 downto 0 do
  begin
    canvas.brush.color:=$00000000+i*$10000;
    canvas.fillrect(rect(0,round(y),clientwidth,round(y+dy)));
    y:=y+dy;
  end;
         }
end;

end.
