unit DevLadeInfoFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons,MetaDefine,uGloabVar;

type
  TSeeLadeHistoryEvent = procedure(ADevIDStr: string;AOnTime,AOffTime:TDateTime) of object;
  TDevLadeInfoFrm = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    EditCarNo: TEdit;
    EditBeginTime: TEdit;
    EditEndTime: TEdit;
    EditTimeLen: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EditOnLong: TEdit;
    EditOnLat: TEdit;
    EditOffLong: TEdit;
    EditOffLat: TEdit;
    BitBtnSeeOnAddr: TBitBtn;
    BitBtnSeeOffAddr: TBitBtn;
    BitBtnSeeHistory: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtnSeeOnAddrClick(Sender: TObject);
    procedure BitBtnSeeOffAddrClick(Sender: TObject);
    procedure BitBtnSeeHistoryClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    FOnSeeLadeHistory: TSeeLadeHistoryEvent;
    procedure SetOnSeeLadeHistory(const Value: TSeeLadeHistoryEvent);
    { Private declarations }
  public
    { Public declarations }
    FOnLong : Double;
    FOnLat  : Double;
    FOffLong: Double;
    FOffLat : Double;

    FLadeDevIdStr : String;
    FOnTime,FOffTime:TDateTime;
    property OnSeeLadeHistory: TSeeLadeHistoryEvent read FOnSeeLadeHistory write SetOnSeeLadeHistory;
  end;

var
  DevLadeInfoFrm: TDevLadeInfoFrm;

implementation
uses umainf,geome, FormHisMainUnit;
{$R *.dfm}

procedure TDevLadeInfoFrm.BitBtnSeeOnAddrClick(Sender: TObject);
var
  wp : TWorldPoint;
  ep: TEarthPoint;
  x,y:integer;
begin
  ep.Longitude := FOnLong;
  ep.Latitude := FOnLat;
  wp :=  FMap.Projection.LoLa2XY(ep);
  {//切换地图
  FindMapName(playDev, wp);
  fun_ChangeMap.Execute;     }
   FMap.Zoom(1,wp);
   FMap.Draw;

   FMap.TmpDraw.Canvas.Pen.Color := clred;
   FMap.TmpDraw.Canvas.Pen.Width :=3;
   FMap.TmpDraw.Canvas.Pen.Mode := pmMask ;
  x:= Mainf.PageControl_Center.Width  div 2;
  y:= Mainf.PageControl_Center.Height div 2;
   FMap.DrawTempEllipseAndText(x,y,'上货地点');
end;

procedure TDevLadeInfoFrm.BitBtnSeeOffAddrClick(Sender: TObject);
var
  wp : TWorldPoint;
  ep: TEarthPoint;
  sp: TPoint;
begin
  ep.Longitude :=FOffLong;
  ep.Latitude := FOffLat;
  wp :=  FMap.Projection.LoLa2XY(ep);
  if not GeometryCalc.PointInRect(wp,  FMap.DrawCood.WorldRect) then
  begin
     FMap.Zoom(1,wp);
     FMap.Draw;
  end;
  sp :=  FMap.DrawCood.ConvertSP(wp);
   FMap.TmpDraw.Canvas.Pen.Color := clred;
   FMap.TmpDraw.Canvas.Pen.Width :=3;
   FMap.TmpDraw.Canvas.Pen.Mode := pmMask ;
   FMap.DrawTempEllipseAndText(sp.X,sp.Y,'下货地点');
end;

procedure TDevLadeInfoFrm.BitBtnSeeHistoryClick(Sender: TObject);
begin
  if assigned(FOnSeeLadeHistory) then
    FOnSeeLadeHistory(FLadeDevIdStr,FOnTime,FOffTime);
end;

procedure TDevLadeInfoFrm.SetOnSeeLadeHistory(
  const Value: TSeeLadeHistoryEvent);
begin
  FOnSeeLadeHistory := Value;
end;

procedure TDevLadeInfoFrm.BitBtn3Click(Sender: TObject);
begin
  ManualDock(nil);
  close;
end;

end.
