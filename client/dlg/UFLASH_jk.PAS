unit UFLASH_jk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Gauges, ComCtrls, RzLabel;

type
  Tflash_jk = class(TForm)
    Panel3: TPanel;
    Gauge1: TGauge;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
//    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SetLabel(S:String);
    { Public declarations }
  end;

var
  flash_jk: Tflash_jk;


implementation

{$R *.dfm}

{procedure Tflash_jk.FormPaint(Sender: TObject);
begin
var i:word;
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
         
end;    }


procedure Tflash_jk.SetLabel(S: String);
begin
  Label1.Caption:=S;
  Label1.Update;
  Self.Update;
  Label1.Update;
end;

procedure Tflash_jk.FormCreate(Sender: TObject);
var
  s:string;
begin
  s:=ExtractFilePath(Application.ExeName)+'ProjectPic.jpg';
  if  fileExists(s) then
  image1.Picture.LoadFromFile(s);
end;

end.
