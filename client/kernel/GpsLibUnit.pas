{ ��С����������Χ��
  @author(sha)
  @created()
  @lastmod(GMT:$Date: 2012/10/29 01:46:42 $) <BR>
  ��������:$Author: wfp $  <BR>
  ��ǰ�汾:$Revision: 1.1.1.1 $  <BR>}
unit GpsLibUnit;

interface
uses
  Windows, classes, Graphics, emapker, emape, ExtCtrls, tyoGraph,
  emapdex, MetaDefine, geome, carunit, math, Types, ClipCalc, Controls, Messages, ConstDefineUnit;


const
  actSelectTarget = 50;
  DRAWSelectDevCnt = 50; //���û��ڵ�ͼ�Ͽ�ѡ����ʱ��ѡ��������50ʱ������

type
  TUserSelectDevEvent = procedure(Sender: TObject; PointA, PointB: TEarthPoint) of object;
  TEmptyFullEvent = procedure(Sender: TObject; AEmptyCount, AFullCount: integer) of object;
  TUserSelectDevCntTooManyEvent = procedure of object;
  TReDrawMap = procedure(Sender: TObject; Dev: TDevice) of object;

  TGpsMap = class;
  TGpsDataLayer = class;
  TGpsDrawLayer = class;

  TGpsDataLayer = class(TEditDataLayer)
  public
    class function GetIdentification: Longword; override;
    { Procedure: AddNewMeta<br>
     ���һ���µ�ͼԪ,���������ͼԪ��MetaIndex
     @Return Integer
     @see @link()}
    function AddNewMeta: Integer;
    function RemoveMetaByIndex(AIndex: integer): boolean; override;
  end;

  TGpsDrawLayer = class(TDrawLayer)
  private
    FGpsMap: TGpsMap;
    FFont: TTrueFontStruct;
    FAutoFollowDevice: TDevice;
    FEmptyFullEvent: TEmptyFullEvent;
    FOnReDrawMap: TReDrawMap;
    FDev: TDevice;
    procedure SetGpsMap(const Value: TGpsMap);
    procedure SetAutoFollowDevice(const Value: TDevice);
    procedure SetDev(const Value: TDevice);
  private
    procedure DrawLine(DC: HDC; line: TMetaStruct);
  protected
   { Procedure: DrawACarCourse<br>
     ���������Ĺ켣
     @param AGpsDataCar: TGpsDataCar
     @see @link()}
    //���켣����
    procedure DrawACarCourse(ADevice: TDevice); virtual;

    {������Խ�������ʻ�����򱨾�ʱ������Բ����鷽��}
    procedure DrawRectIfOutorInAlarmArea(m: TDevice; CarCurrPos: TPoint);
  public
    constructor Create; override;
    class function GetIdentification: Longword; override;
    procedure HighLightSelectedMetas(DC: HDC); override;
   { Procedure: Draw<br>
     ����ͼ���ϵ�ͼԪ(Ŀ�공��)
     @param
     @param
     @Return None
     @see @link()}
    function Draw: boolean; override;
    {����ͼ���ϵ� �޶�����}
    procedure DrawConfineArea;
    function ClipDraw(DC: HDC; Rect: TWorldRect; Canvas: TCanvas): boolean; override;
    //�Ƿ���Ҫ�ػ�,�����ٳ����ܳ���ͼ��Ҫ�ػ���ͼ.
    function IsRedrawMap: Boolean; virtual;
//    PROCEDURE CMEraseBkgnd(var Message:TWMEraseBkgnd);Message WM_ERASEBKGND;

    {property GpsMap: TGpsMap;<br />
    ָ��GpsMap}
    property GpsMap: TGpsMap read FGpsMap write SetGpsMap;
    property AutoFollowDevice: TDevice read FAutoFollowDevice write SetAutoFollowDevice;
    property OnEmptyFull: TEmptyFullEvent read FEmptyFullEvent write FEmptyFullEvent;
    property OnReDrawMap: TReDrawMap read FOnReDrawMap write FOnReDrawMap;
    property Dev: TDevice read FDev write SetDev;

  end;

  TGpsPlayDrawLayer = class(TGpsDrawLayer)
  protected

  public
    function Draw: boolean; override;
    function IsRedrawMap: Boolean; override;
  end;



  TGpsMap = class(TActionMap)
  private
    FTmpDraw: TBitmap;
    FTmpDrawChanged: Boolean;
    FTimer: TTimer;
    FGpsDataLayer: TGpsDataLayer;
    FNeedDraw: Boolean;
    FGpsDrawlayer: TGpsDrawLayer;
    FOnUserSelectDevEvent: TUserSelectDevEvent;
    FOnUserSelDevCntManyEvent: TUserSelectDevCntTooManyEvent;
//    FGpsPlayDataLayer: TGpsDataLayer;
    FIsPlayGpsData: boolean;
    FIsPlaySepcialCar: Boolean;
    FSepcialDevice: TDevice;
//    FGpsPlayDrawLayer: TGpsPlayDrawLayer;
    procedure SetGpsLayer(const Value: TGpsDataLayer);
    procedure SetTmpDrawChanged(const Value: Boolean);
    procedure SetNeedDraw(const Value: Boolean);
    procedure DrawGpsMap;
    procedure SetGpsDrawlayer(const Value: TGpsDrawLayer);
    procedure SetOnUserSelectDevEvent(const Value: TUserSelectDevEvent);
    procedure SetOnUserSelDevCntManyEvent(
      const Value: TUserSelectDevCntTooManyEvent);
  private
    //���޶����� --Ŀǰ�ڻ���ʱ����
    //procedure DrawConfineArea;
    procedure FTimerTimer(Sender: TObject);

  protected
    {������̳е�Ŀ���ǣ� ���ڽ��в��������޶�����ʱ������С��=>��FTimerֹͣ��
      ���ڻ�ʱ����FTimer���С�sha2005-6-21}
    procedure BrowseMeasure(AMouseState: TMouseState); override;
    procedure BrowseSetConfineAlarmArea(AMouseState: TMouseState); override;
    procedure BrowseSetConfineAlarmNoSybol(AMouseState: TMouseState); override;
    procedure BrowseSetRunWay(AMouseState: TMouseState); override;
    { Procedure: DoScanTarget<br>
     ɨ�賵���仯}
    procedure DoScanTarget; virtual;
   { Procedure: DoPaint<br>
     �̳��������Paint����,����Gps�����Ļ���
     @see @link()}
    procedure DoPaint; override;
    procedure DoAfterDrawScreen; override;
    { procedure BrowseRectSelect<br>
      �̳� TActionMap.BrowseRectSelect
            -------- add by sha 2004-8-13 ��
      Ŀ�ģ����û���������ѡ�񹤾� ��ѡ���κζ��� ʱ����ʱ�� �峵}
    procedure BrowseRectSelect(AMouseState: TMouseState); override;
   // procedure DoSetConfineArea(PointTL,PointRB:Tpoint);override;
    procedure DoUserSelectDevEvent(PointA, PointB: TEarthPoint); virtual;
    //���� ��emap�е����¼�
    procedure DoRectSelectMeta(PointA, PointB: TEarthPoint); override;


    procedure DoOffsetPaint(XPixels, YPixels: integer; XPixelsOff, YPixelsOff: integer); override;
  public
    constructor Create(AOwner: TComponent; Provider: TLayerProvider); override;
    destructor Destroy; override;
    procedure ClearTmpDraw;
    procedure Draw; override;
    procedure EnableTimer(Bool: Boolean);
    //ֻ����GPSͼ�㣬���ٻ�����
    procedure DrawGpsMap_ClearDraw;
    //ֻ�塡GPSͼ�㣬����


    procedure DrawGpsMap_Clear;
    procedure DrawTempEllipseAndText(X, Y: integer; text: string);

    //GPSͼ��
    property GpsDataLayer: TGpsDataLayer read FGpsDataLayer write SetGpsLayer;
    property GpsDrawlayer: TGpsDrawLayer read FGpsDrawlayer write SetGpsDrawlayer;

    //�켣�ط�ͼ��  2007-07-31
//  property GpsPlayDrawLayer:TGpsPlayDrawLayer read FGpsPlayDrawLayer write FGpsPlayDrawLayer;
//  property GpsPlayDataLayer:TGpsDataLayer read FGpsPlayDataLayer write FGpsPlayDataLayer;
    //�Ƿ��ڹ켣�ط� 2007-07-31
    property IsPlayGpsData: boolean read FIsPlayGpsData write FIsPlayGpsData;
    property IsPlaySepcialCar: Boolean read FIsPlaySepcialCar write FIsPlaySepcialCar;

    property TmpDraw: TBitmap read FTmpDraw;
    property TmpDrawChanged: Boolean read FTmpDrawChanged write SetTmpDrawChanged;
    property NeedDraw: Boolean read FNeedDraw write SetNeedDraw;
    //�û���ѡ������sha 20050224
    property OnUserSelectDevEvent: TUserSelectDevEvent read FOnUserSelectDevEvent write SetOnUserSelectDevEvent;
    //�û���ѡ��������̫��   sha 20050225
    property OnUserSelDevCntManyEvent: TUserSelectDevCntTooManyEvent read FOnUserSelDevCntManyEvent write SetOnUserSelDevCntManyEvent;
    property SepcialDevice: TDevice read FSepcialDevice write FSepcialDevice;
  end;

  //������ͼ��
  TAreaDrawLayer = class(TDrawLayer)
  protected

  public
    function ClipDraw(DC: HDC; Rect: TWorldRect; Canvas: TCanvas): boolean; override;
    procedure DrawConfinArea(Dc: HDC);
  end;

  //��Բ�Ρ����Ρ������  \·��
  TAlarmNoSybolLayer = class(TDrawLayer)
  private
    procedure DrawRoadsLayer(Dc: HDC);
  protected
  public
    function ClipDraw(DC: HDC; Rect: TWorldRect; Canvas: TCanvas): boolean; override;
    procedure DrawAlarmNoSybolLayer(Dc: HDC);
  end;

  TUserDefinedTextLayer = class(TDrawLayer)
  protected
  public
    function ClipDraw(DC: HDC; Rect: TWorldRect; Canvas: TCanvas): boolean; override;
    procedure DrawUserDefinedText(Dc: HDC);
  end;

implementation
uses
  uGloabVar, elog, ResUnit, Imglist, tyolist,
  ConfineAreaUnit, SysUtils, umainf, forms, PlayGlobalUnit;
{ TGpsMap }

procedure TGpsMap.BrowseMeasure(AMouseState: TMouseState);
begin
  inherited;
  FTimer.Enabled := not FBrowseCapture;
end;

procedure TGpsMap.BrowseRectSelect(AMouseState: TMouseState);
var
 // devID: integer;//i,j,
//  m : Tdevice;
  ep: TEarthPoint;
begin
  inherited; //�̳�
  //����ɿ�����û��ѡ�����ʱ
  if (AMouseState = msUp) and (GpsDrawlayer.SelectedMeta.Count = 0) then
  begin
    ADeviceManage.ClearUserSelectList; //���ѡ�г����б�
    DrawGpsMap_ClearDraw;
    ep.Longitude := 0;
    ep.Latitude := 0;
    DoUserSelectDevEvent(ep, ep); //�����¼�,���û�ɾ��ѡ����ĳ�
  end;
end;

procedure TGpsMap.BrowseSetConfineAlarmArea(AMouseState: TMouseState);
begin
  inherited;
  FTimer.Enabled := not FBrowseCapture;
end;

procedure TGpsMap.BrowseSetConfineAlarmNoSybol(AMouseState: TMouseState);
begin
  inherited;
  FTimer.Enabled := not FBrowseCapture;
end;

procedure TGpsMap.BrowseSetRunWay(AMouseState: TMouseState);
begin
  inherited;
  FTimer.Enabled := not FBrowseCapture;
end;

procedure TGpsMap.ClearTmpDraw;
begin
  try
    FTmpDraw.Canvas.Brush.Style := bsSolid;
    FTmpDraw.Canvas.Brush.Color := clWhite;
    FTmpDraw.Canvas.FillRect(GetClientRect);
    FTmpDrawChanged := False;
  except on E: Exception do
    begin
      elog.SystemLog.AddLog('TGpsMap.ClearTmpDraw', e.Message);
      FTmpDraw.Free;
      FTmpDraw := TBitmap.Create;
      FTmpDrawChanged := False;
    end;
  end;
end;

constructor TGpsMap.Create(AOwner: TComponent; Provider: TLayerProvider);
begin
  inherited;
  FTmpDraw := TBitmap.Create;
  FTmpDrawChanged := False;
  FTimer := TTimer.Create(nil);
  FTimer.Interval := 500000;//500; // add by sha 2004-8-13
  FTimer.OnTimer := FTimerTimer;
  FTimer.Enabled := False;
  NeedDraw := False;
  FIsPlayGpsData := false;
  FSepcialDevice  := TDevice.Create;
end;

destructor TGpsMap.Destroy;
begin
  FTmpDraw.Free;
  FTimer.Free;
  FSepcialDevice.Free;
  inherited;
end;

procedure TGpsMap.DoAfterDrawScreen;
begin
  inherited;
  try
    if FTmpDrawChanged then
    begin
      GraphDraw.TransDraw(FScreenBitmap.Canvas.handle, 0, 0, GetClientRect.Right, GetClientRect.Bottom,
        FTmpDraw.canvas.handle, clWhite);
    end;
  except on E: Exception do
    begin
      elog.SystemLog.AddLog(' TGpsMap.DoAfterDrawScreen ', e.Message);
      FTmpDraw.Free;
      FTmpDraw := TBitmap.Create;
      FTmpDrawChanged := False;
    end;
  end;

end;

procedure TGpsMap.DoOffsetPaint(XPixels, YPixels, XPixelsOff,
  YPixelsOff: integer);
begin
  inherited;
  if FTmpDrawChanged then
  begin
    GraphDraw.TransDraw(Canvas.handle, 0, 0, GetClientRect.Right, GetClientRect.Bottom,
      FTmpDraw.canvas.handle, clWhite);
  end;
end;

procedure TGpsMap.DoPaint;
begin
  if (FTmpDraw.Height <> Height) or (FTmpDraw.Width <> Width) then
  begin
    FTmpDraw.Width := GetClientRect.Right;
    FTmpDraw.Height := GetClientRect.Bottom;
  end;
  inherited;
end;

procedure TGpsMap.DoRectSelectMeta(PointA, PointB: TEarthPoint);
var
  i, j: integer;
  devID:string;
begin
  ADeviceManage.ClearUserSelectList; //���ѡ�г����б�
  if (GpsDrawlayer.SelectedMeta.Count > 0) then //����ɿ�����û��ѡ�����ʱ
  begin
    //��ѡ�г������ݴ���DRAWSelectDevCntʱ��
    if GpsDrawlayer.SelectedMeta.Count > DRAWSelectDevCnt then
    begin
      if assigned(FOnUserSelDevCntManyEvent) then
        FOnUserSelDevCntManyEvent();
      DoUserSelectDevEvent(PointA, PointB); //�����¼�
      exit;
    end;
    for i := 0 to GpsDrawlayer.SelectedMeta.Count - 1 do
    begin
      j := GpsDrawlayer.SelectedMeta.GetData(i);
      devId := ADeviceManage.FindFromMetaIndex(j);
      if devId <> '' then ADeviceManage.AddToUserSelectList(devId);
    end;
    //��һ�ַ��������ַ��� ����Ϊ���淽������Щ sha
    {for i:=0 to ADeviceManage.Count -1 do
    begin
      m:= ADeviceManage.Items[i];
      If not m.State[STAT_DEVICE_CONNECTED] then Continue;
      if GpsDrawlayer.SelectedMeta.IsDataIn(m.MetaIndex) then//ע��:���������о�,����ѡ��MetaIndex��0��ʱ���г�����û����û�����ĳ�(MetaIndex=0)
        ADeviceManage.AddToUserSelectList(m.Id);
    end; }
  end;
  DoUserSelectDevEvent(PointA, PointB); //�����¼�,���û��г�ѡ�г���
end;

procedure TGpsMap.DoScanTarget;
var
  i: Integer;
  m: TDevice;
  aMeta: TMetaStruct;
  p: TEarthPoint;
  pMeta: PMetaStruct;
begin
  //if have new target arrive ,add a meta to datalayer

  try
  //�켣�ط�״̬
    if FIsPlayGpsData then
    begin
      try
        if playDev = nil then exit;
        // if now dev be added
        if playDev.MetaIndex < 0 then
          playDev.MetaIndex := GpsDataLayer.AddNewMeta;
        //if have new target data arrive, maybe need refresh map
        if playDev.State[STAT_NEWDATA_GIS] then
        begin
          try
            //playDev.MetaIndex:=0;
            pMeta := GpsDataLayer.GetMetaPointer(playDev.MetaIndex {,Projection.ProjectionType});
            p.Longitude := playDev.Longitude;
            p.Latitude := playDev.Latitude;
            pMeta^.Symbol.Position := Self.Projection.LoLa2XY(p)
            //GpsDataLayer.ModifyMeta(playDev.MetaIndex,aMeta);
          finally
            playDev.State[STAT_NEWDATA_GIS] := False;
          end;
          NeedDraw := True;
        end;
      except on E: Exception do
          elog.SystemLog.AddLog(' TGpsMap.DoScanTarget1', e.Message);
      end;

    end
    else if FIsPlaySepcialCar then    // �ص���
    begin
      try
        if FSepcialDevice = nil then exit;
        // if now dev be added
        if FSepcialDevice.MetaIndex < 0 then
          FSepcialDevice.MetaIndex := GpsDataLayer.AddNewMeta;   
        //if have new target data arrive, maybe need refresh map
        if FSepcialDevice.State[STAT_NEWDATA_GIS] then
        begin
          try
            //playDev.MetaIndex:=0;
            pMeta := GpsDataLayer.GetMetaPointer(FSepcialDevice.MetaIndex);
            pMeta^.Symbol.Position := FSepcialDevice.Point;
            //GpsDataLayer.ModifyMeta(playDev.MetaIndex,aMeta);
          finally
            FSepcialDevice.State[STAT_NEWDATA_GIS] := False;
          end;
          NeedDraw := True;
        end;
      except on E: Exception do
          elog.SystemLog.AddLog(' TGpsMap.DoScanTarget1', e.Message);
      end;
    end
    else
    begin
      try
        if ADeviceManage.Stat[STAT_NEWDEVICE_GIS] then
        begin
          try
            for i := 0 to ADeviceManage.Count - 1 do
            begin
              m := ADeviceManage.Items[i];
              if m.State[STAT_NEWDEVICE_GIS] then
              begin
                try
                  m.MetaIndex := GpsDataLayer.AddNewMeta;
                finally
                  m.State[STAT_NEWDEVICE_GIS] := False;
                end;
              end;
            end;
          finally
            ADeviceManage.Stat[STAT_NEWDEVICE_GIS] := False;
          end;
        end;
      except on E: Exception do
          elog.SystemLog.AddLog(' TGpsMap.DoScanTarget2', e.Message);
      end;

      //if have new target data arrive, maybe need refresh map
      try
        if ADeviceManage.Stat[STAT_NEWDATA_GIS] then
        begin
          try
            for i := 0 to ADeviceManage.Count - 1 do
            begin
              m := ADeviceManage.Items[i];
              if m.SpecialCar then Continue;
              if not m.IsOnMap then Continue;
              if m.isOnline <> m.isOnlineOnTheMap then m.State[STAT_NEWDATA_GIS] := true;
              try
                if m.State[STAT_NEWDATA_GIS] then
                begin
                  try
                      //p.Longitude := m.Longitude;
                      //p.Latitude := m.Latitude;
                    pMeta := GpsDataLayer.GetMetaPointer(m.MetaIndex);
                    pMeta^.Symbol.Position := m.Point;
                  finally
                    m.State[STAT_NEWDATA_GIS] := False;
                  end;
                end;
              finally
                m.isOnlineOnTheMap := m.isOnline;
              end;
            end;
            NeedDraw := True;
          finally
            ADeviceManage.Stat[STAT_NEWDATA_GIS] := False;
          end;
        end;
      except on E: Exception do
          elog.SystemLog.AddLog(' TGpsMap.DoScanTarget3', e.Message);
      end;
    end; //if FIsPlayGpsData

  except on E: Exception do
      elog.SystemLog.AddLog(' TGpsMap.DoScanTarget', e.Message);
  end;

end;


procedure TGpsMap.DoUserSelectDevEvent(PointA, PointB: TEarthPoint);
begin
  if Assigned(FOnUserSelectDevEvent) then
    FOnUserSelectDevEvent(self, PointA, PointB);
end;

procedure TGpsMap.Draw;
begin
  try
    if (mpAllowDraw in Option) then
    begin
      ClearTmpDraw;

      inherited Draw; //�� ��������ͼ�㣬����GPSͼ��

      FTimer.Enabled := False;
      FTimer.Enabled := True;
    end;
  except on E: Exception do
      elog.SystemLog.AddLog('TGpsMap.Draw', e.Message);
  end;
end;

{procedure TGpsMap.DrawConfineArea;
var
  i,j: integer;
  confArea   : TConfineArea;
  pointAry   : TPointAry;
  isInScreebRect :boolean;  //�Ƿ��ڵ�ͼ�л���
begin
  if GAreaManage=nil then exit;
  for i:= 0 to GAreaManage.Count -1 do
  begin
    confArea:= GAreaManage.Items[i];
    if not confArea.IsDraw then Continue;
    TmpDraw.Canvas.Pen.Color := confArea.AreaColor;
    TmpDraw.Canvas.Pen.Width :=3;
    TmpDraw.Canvas.Pen.Mode := pmMask ;

    SetLength(pointAry,confArea.PointCount);
    for j:=0 to confArea.PointCount -1 do
    begin
      //ֻҪ�������һ�����ڵ�ǰ��Ļ�У��ͻ���
      if GeometryCalc.PointInRect(confArea.WorldPointAry[j], DrawCood.WorldRect) then
        isInScreebRect:= true;
      pointAry[j] := DrawCood.ConvertSP(confArea.WorldPointAry[j]);
    end;
    if isInScreebRect then
      TmpDraw.Canvas.Polygon(pointAry);
  end;
end;      }

procedure TGpsMap.DrawGpsMap;
begin
  if not (mpAllowDraw in Option) then Exit;
  if GpsDrawlayer.IsRedrawMap then //������ػ�,�򻭳�����ͼ��
    Draw
  else
    DrawGpsMap_ClearDraw; //ֻ����GPSͼ�㣬���ٻ���(�����޶�����..)
end;

procedure TGpsMap.DrawGpsMap_Clear; //ֻ����GPSͼ�㣬������(�����޶�����..)
begin
  ClearTmpDraw;
  paint;
end;

procedure TGpsMap.DrawGpsMap_ClearDraw; //ֻ����GPSͼ�㣬���ٻ��� ��
begin
  ClearTmpDraw;
  GpsDrawlayer.Draw;
  paint;
end;

procedure TGpsMap.DrawTempEllipseAndText(X, Y: integer; text: string);
var
  i: integer;
begin
  try
    i := 70;
    while i > 10 do
    begin
      DrawGpsMap_ClearDraw;
      TmpDrawChanged := True; 
      application.ProcessMessages;
      SetBkColor(TmpDraw.Canvas.Handle, clBlue);
      SetTextColor(TmpDraw.Canvas.Handle, clCream);
      TmpDraw.Canvas.TextOut(x - (length(Text) * 3), y - 7, Text);
      application.ProcessMessages;
      TmpDraw.Canvas.Pen.Color := clred;
      TmpDraw.Canvas.Pen.Width := 3;
      TmpDraw.Canvas.Pen.Mode := pmMask;
      TmpDraw.Canvas.Ellipse(x - i, Y - i, X + i, Y + i);
      i := i - (i div 3);
      application.ProcessMessages;
      paint;
      application.ProcessMessages;
    end;
  except on E: Exception do
      elog.SystemLog.AddLog(' TGpsMap.DrawTempEllipseAndText ', e.Message);
  end;
end;

procedure TGpsMap.EnableTimer(Bool: Boolean);
begin
  FTimer.Enabled := Bool;
end;

procedure TGpsMap.FTimerTimer(Sender: TObject);
begin
  Exit;//2011-12-01
  try
    FTimer.Enabled := False;
    try
      DoScanTarget;
      if NeedDraw then DrawGpsMap;
    finally
      FTimer.Enabled := True;
      NeedDraw := False;
    end;
  except on E: Exception do
      elog.SystemLog.AddLog(' TGpsMap.FTimerTimer��������: ', e.Message);
  end;
end;

procedure TGpsMap.SetGpsDrawlayer(const Value: TGpsDrawLayer);
begin
  FGpsDrawlayer := Value;
end;

procedure TGpsMap.SetGpsLayer(const Value: TGpsDataLayer);
begin
  FGpsDataLayer := Value;
end;

procedure TGpsMap.SetNeedDraw(const Value: Boolean);
begin
  FNeedDraw := Value;
end;

procedure TGpsMap.SetOnUserSelDevCntManyEvent(
  const Value: TUserSelectDevCntTooManyEvent);
begin
  FOnUserSelDevCntManyEvent := Value;
end;

procedure TGpsMap.SetOnUserSelectDevEvent(
  const Value: TUserSelectDevEvent);
begin
  FOnUserSelectDevEvent := Value;
end;

procedure TGpsMap.SetTmpDrawChanged(const Value: Boolean);
begin
  FTmpDrawChanged := Value;
end;

{ TGpsDataLayer }

function TGpsDataLayer.AddNewMeta: Integer;
var
  sym: TWorldSymbol;
begin
//  sym := GlobalParam.NewSymbolStyle;
//(*
  sym.Style := _Custom;
  sym.CustomSymbol.Size := 8;
  sym.CustomSymbol.Shape := 34;
  sym.CustomSymbol.Color := clRed;

//*) .

  Result := AddSymbol(sym);
end;

class function TGpsDataLayer.GetIdentification: Longword;
begin
  Result := TDataLayer.GetIdentification + $3000;
end;

function TGpsDataLayer.RemoveMetaByIndex(AIndex: integer): boolean;
begin
  Result := inherited RemoveMetaByIndex(AIndex);
end;

{ TGpsDrawLayer }

function TGpsDrawLayer.ClipDraw(DC: HDC; Rect: TWorldRect; Canvas: TCanvas): boolean;
begin
  FGpsMap.ClearTmpDraw;
  Draw; //Result:=inherited ClipDraw(DC,Rect);
end;

{procedure TGpsDrawLayer.CMEraseBkgnd(var Message: TWMEraseBkgnd);
begin
  gpsmap.brush.style:=bsClear;
  Inherited;
end;   }

constructor TGpsDrawLayer.Create;
begin
  inherited;
  Ffont.Size := 15;
  Ffont.FontName := '����';
  Ffont.FontStyle := 0;
  Ffont.Rotation := 0;
  Ffont.ForeColor := 0;
  Ffont.BackColor := clRed;
  Ffont.Transparent := 0;
end;

function TGpsDrawLayer.Draw: boolean;
{���������켣}
var
  i: Integer; // ,j
  desRect: TRect;
  carCurrPos: TPoint;
  //pMeta:PMetaStruct;  //dxf 2008-02-19
  m: TDevice;
  emptyCount, fullCount: integer;
  s: string;

  p: TPoint;
  p1, p2: TPoint;
  meta: TMetaStruct;
  director: boolean;

  DevCount: Integer;
  TempCount: Integer;
  procedure DrawCar(m: TDevice);
//var
  //desRect: TRect;
  //carCurrPos: TPoint;
  ///pMeta:PWorldMeta;
  //emptyCount,fullCount:integer;
  var
    pointAry:array of Tpoint;
    oldPen: HPen;
    oldBrush: HBrush;
    newPen: TPenStruct;
    newBrush: TBrushStruct;
    j:Integer;
  begin
    director := false;
    if not m.State[STAT_DEVICE_CONNECTED] then exit;
    if m.State[STAT_NEWDEVICE_GIS] then exit;
    if m.MetaIndex >= Data.MetaCount then exit;
    //pMeta := Data.GetMetaPointer(m.MetaIndex);  //dxf 2008-02-19
    //ͼԪδ����
    //if not pMeta^.Enabled then Continue;
    carCurrPos := m.Point; // pMeta^.Symbol.Position;  //dxf 2008-02-19

    //�Ƿ�����,������ճ���; ��ΪҪ���㲻����Ļ�еĳ���,����Ҫ�����ж��Ƿ�����Ļ��֮ǰ.
    if (m.isOnline) and (GlobalParam.isShowEmptyFull) then
      if not m.Switch[9] then
      begin
        Inc(EmptyCount); //�ճ�
      end
      else
      begin
        Inc(FullCount);
      end;

    //Ŀ�겻����Ļ��
    if not GeometryCalc.PointInRect(carCurrPos, Map.DrawCood.WorldRect) then exit;
    carCurrPos := Map.DrawCood.ConvertSP(carCurrPos);
    //����������
    //if m.Monitor then
    begin
      //��������ע
      if m.Hide and (not m.Alarm) then exit;

      ADeviceManage.AddCurrentDevOnTheMap(carCurrPos.X, carCurrPos.Y, m);


       //--------------------�Ƿ�Խ�� �� ʻ������
      //{$ifdef For_ConfineArea}
      DrawRectIfOutorInAlarmArea(m, carCurrPos); //2007-11-22 by dxf
      //{$endif}
      //--------------------���������ѡ�У����ƺŵ�ɫ������ɫ��������clCream�������� ������ɫ

      //----------------------���켣
      if m.DrawTrack then
        DrawACarCourse(m); //���켣

      if (SelectedMeta.Count <= DRAWSelectDevCnt) and (SelectedMeta.IsDataIn(m.MetaIndex)) then
      begin
        SetBkColor(GpsMap.TmpDraw.Canvas.Handle, clLime);
        SetTextColor(GpsMap.TmpDraw.Canvas.Handle, clCream);
      end
      else
      begin

        if not m.isOnline then
        begin
          SetBkColor(GpsMap.TmpDraw.Canvas.Handle, clMedGray);
          SetTextColor(GpsMap.TmpDraw.Canvas.Handle, clCream);
        end
        else
        begin
          //�ж��Ƿ�λ������λ�������ɫ����λ��������ɫ
          if m.Switch[STAT_GPS_LOCATE] then
            SetTextColor(GpsMap.TmpDraw.Canvas.Handle, clCream)        // ��λ
          else
            SetTextColor(GpsMap.TmpDraw.Canvas.Handle, clMedGray);     // �Ƕ�λ

          if not m.Switch[9] then
            SetBkColor(GpsMap.TmpDraw.Canvas.Handle, GlobalParam.FTaxiEmptyColor) //�ճ�     ����û�е���
          else
            SetBkColor(GpsMap.TmpDraw.Canvas.Handle, GlobalParam.FTaxiHavColor);  //�س�     ����û�е���

          if m.Switch_Warning[0] then //if m.Alarm then
            SetBkColor(GpsMap.TmpDraw.Canvas.Handle, GlobalParam.FDriverAlarmColor); //˾����������
          if m.Switch[11] then //if m.Switch[18] then
            SetBkColor(GpsMap.TmpDraw.Canvas.Handle, clYellow); // �ϵ籨��
          if  m.Switch[MSG_STATE_3] then //ͣ��Ϊ��ɫ ��Ϊ��ɫ
          begin
             SetBkColor(GpsMap.TmpDraw.Canvas.Handle,clGreen);
             //SetTextColor(GpsMap.TmpDraw.Canvas.Handle,clBlack);
          end;
        end;
        {if m.Switch[4] then //���ߣ������Ƿ����߶�һ��ɫ ����������������
        begin
          SetTextColor(GpsMap.TmpDraw.Canvas.Handle, clBlue);
          SetBkColor(GpsMap.TmpDraw.Canvas.Handle, clMedGray);
        end;    }
      end;
      desRect := classes.Rect(carCurrPos.x - 45 - Length(m.Car.No)*2, carCurrPos.y - 19, carCurrPos.x + 45 + Length(m.Car.No)*2, carCurrPos.y + 60);
      GpsMap.TmpDraw.Canvas.Font.Size := GlobalParam.FontSize;

      if GlobalParam.ShowTheMapOption = 0 then  //0������ʾ���ƺ�,1������ʾ�豸����.
      begin 
        if GlobalParam.carpicType = 1 then //===0===��ͨ��ʾͼƬ   1 ��ʾ��������ͼƬ
        begin
          if m.Orientation > 360 then
          begin
            m.Orientation := m.Orientation1;
            m.OrientationRightTime := m.OrientationRightTime + 1;
          end;
          for j:= 0 to 7 do //8������sha.20090925 ��
          begin
            if j=0 then
            begin
              if (m.Orientation >=360-22) and (m.Orientation <=j*45+22) then
                break;
            end
            else
              if (m.Orientation>= j*45-22) and (m.Orientation <=j*45+22) then
                break;
          end;
          if j>7 then j:= 0;
          m.OrientationRightTime := 0;
          m.Orientation1 := m.Orientation;
          director := true;
          //ֱ���ñ��صģ����ٴ����ݿ���ȡ��������ݿ�ȡ�����ƣ�ResId����Ϊ5-12��sha.20090925��
          Mainf.ImageListCarPicInMap.Draw(GpsMap.TmpDraw.Canvas, carCurrPos.X - 8, carCurrPos.Y - 8, j);
          drawtext(GpsMap.TmpDraw.Canvas.Handle, PChar(m.Car.No), Length(m.Car.No), desRect, DT_CENTER);
          if m.OrientationRightTime >= 3 then
          begin
            drawtext(GpsMap.TmpDraw.Canvas.Handle, PChar(m.Car.No), Length(m.Car.No), desRect, DT_CENTER);
            Mainf.ImageListMapCar.Draw(GpsMap.TmpDraw.Canvas, carCurrPos.X - 8, carCurrPos.Y - 8, 0);
            //ResManage.BmpList.Draw(GpsMap.TmpDraw.Canvas, carCurrPos.X - 8, carCurrPos.Y - 8, m.Car.ResIndex);
          end;
        end else
        begin
          drawtext(GpsMap.TmpDraw.Canvas.Handle, PChar(m.Car.No), Length(m.Car.No), desRect, DT_CENTER);
          Mainf.ImageListMapCar.Draw(GpsMap.TmpDraw.Canvas, carCurrPos.X - 8, carCurrPos.Y - 8, 0);
          //ResManage.BmpList.Draw(GpsMap.TmpDraw.Canvas, carCurrPos.X - 8, carCurrPos.Y - 8, m.Car.ResIndex);
        end;
      end
      else     //1������ʾ�豸����.
      begin
        if GlobalParam.carpicType = 1 then //===0===��ͨ��ʾͼƬ   1 ��ʾ��������ͼƬ
        begin
          if m.Orientation > 360 then
          begin
            m.Orientation := m.Orientation1;
            m.OrientationRightTime := m.OrientationRightTime + 1;
          end;
          for j:= 0 to 7 do //8������sha.20090925 ��
          begin
            if j=0 then
            begin
              if (m.Orientation >=360-22) and (m.Orientation <=j*45+22) then
                break;
            end
            else
              if (m.Orientation>= j*45-22) and (m.Orientation <=j*45+22) then
                break;
          end;
          if j>7 then j:= 0;
          m.OrientationRightTime := 0;
          m.Orientation1 := m.Orientation;
          director := true;                         
          Mainf.ImageListCarPicInMap.Draw(GpsMap.TmpDraw.Canvas, carCurrPos.X - 8, carCurrPos.Y - 8, j);
          //ResManage.BmpList.Draw(GpsMap.TmpDraw.Canvas, carCurrPos.X - 8, carCurrPos.Y - 8, j+6);
          
          drawtext(GpsMap.TmpDraw.Canvas.Handle, PChar(m.DispLabel), Length(m.DispLabel), desRect, DT_CENTER);
          if m.OrientationRightTime >= 3 then
          begin
            drawtext(GpsMap.TmpDraw.Canvas.Handle, PChar(m.DispLabel), Length(m.DispLabel), desRect, DT_CENTER);
            Mainf.ImageListMapCar.Draw(GpsMap.TmpDraw.Canvas, carCurrPos.X - 8, carCurrPos.Y - 8, 0);
            //ResManage.BmpList.Draw(GpsMap.TmpDraw.Canvas, carCurrPos.X - 8, carCurrPos.Y - 8, m.Car.ResIndex);
          end;
        end else
        begin
          drawtext(GpsMap.TmpDraw.Canvas.Handle, PChar(m.DispLabel), Length(m.DispLabel), desRect, DT_CENTER);
          Mainf.ImageListMapCar.Draw(GpsMap.TmpDraw.Canvas, carCurrPos.X - 8, carCurrPos.Y - 8, 0);
          //ResManage.BmpList.Draw(GpsMap.TmpDraw.Canvas, carCurrPos.X - 8, carCurrPos.Y - 8, m.Car.ResIndex);
        end;
        //drawtext(GpsMap.TmpDraw.Canvas.Handle, PChar(m.DispLabel),Length(m.DispLabel), desRect, DT_CENTER);
      end;

      //ResManage.BmpList.Draw(GpsMap.TmpDraw.Canvas,carCurrPos.X-8,carCurrPos.Y-8,6);

      //---------------------�� ˾������ ����
      if m.Switch_Warning[0] and bAlarm then //if m.Alarm then
      begin
        GpsMap.TmpDraw.Canvas.Pen.Color := clred;
        GpsMap.TmpDraw.Canvas.Pen.Width := 4;
        GpsMap.TmpDraw.Canvas.Pen.Mode := pmMask;
        GpsMap.TmpDraw.Canvas.Ellipse(carCurrPos.x - 35, carCurrPos.y - 25, carCurrPos.x + 30, carCurrPos.y + 10);
      end;
      // Ԥ������
      if m.Switch_Warning[MSG_Warning_1] and bEarlyAlarm then
      begin
        GpsMap.TmpDraw.Canvas.Pen.Color := clFuchsia;
        GpsMap.TmpDraw.Canvas.Pen.Width := 4;
        GpsMap.TmpDraw.Canvas.Pen.Mode := pmMask;
       GpsMap.TmpDraw.Canvas.Ellipse(carCurrPos.x - 35, carCurrPos.y - 25, carCurrPos.x + 30, carCurrPos.y + 10);
      end;
      //�ϵ籨��
      if m.Switch_Warning[6] then //if m.Switch[18] then
      begin
        GpsMap.TmpDraw.Canvas.Pen.Color := clYellow;
        GpsMap.TmpDraw.Canvas.Pen.Width := 4;
        GpsMap.TmpDraw.Canvas.Pen.Mode := pmMask;
        GpsMap.TmpDraw.Canvas.Ellipse(Rect(carCurrPos.x - 25, carCurrPos.y - 25, carCurrPos.x + 25, carCurrPos.y + 25));
      end;
      // �������
      if m.PursuePostion then
      begin
        GpsMap.TmpDraw.Canvas.Pen.Color := clGreen;
        GpsMap.TmpDraw.Canvas.Pen.Width := 4;
        GpsMap.TmpDraw.Canvas.Pen.Mode := pmMask;
        GpsMap.TmpDraw.Canvas.Ellipse(Rect(carCurrPos.x - 25, carCurrPos.y - 25, carCurrPos.x + 25, carCurrPos.y + 25));
      end;
    end;

    GpsMap.TmpDrawChanged := True;
    MetaInScreen.Add(m.MetaIndex);
  end;

  procedure DrawCar2(m: TDevice);
  var
    j:Integer;
    Text: string;
    TextColor, BkColor: TColor;
    imageindex: Integer;
    bWrite: Boolean;
    oldColor: TColor;
    PenColor, BrushColor: TColor;
    isSelected: Boolean;
  begin
    director := false;
    bWrite := False;
    isSelected := False;
    if not m.State[STAT_DEVICE_CONNECTED] then exit;
    if m.State[STAT_NEWDEVICE_GIS] then exit;
    if m.MetaIndex >= Data.MetaCount then exit;
    //pMeta := Data.GetMetaPointer(m.MetaIndex);  //dxf 2008-02-19
    //ͼԪδ����
    //if not pMeta^.Enabled then Continue;
    carCurrPos := m.Point; // pMeta^.Symbol.Position;  //dxf 2008-02-19

    //Ŀ�겻����Ļ��
    if not GeometryCalc.PointInRect(carCurrPos, Map.DrawCood.WorldRect) then exit;
    carCurrPos := Map.DrawCood.ConvertSP(carCurrPos);
    //����������
    //if m.Monitor then
    begin
      //��������ע
      //if m.Hide and (not m.Alarm) then exit;
      if m.Hide and (not m.Switch_Warning[0]) then Exit;//��������ʱ����

      //ADeviceManage.AddCurrentDevOnTheMap(carCurrPos.X, carCurrPos.Y, m);

      //--------------------�Ƿ�Խ�� �� ʻ������
      //DrawRectIfOutorInAlarmArea(m, carCurrPos); //2007-11-22 by dxf

      //----------------------���켣
      if m.DrawTrack then
        DrawACarCourse(m); //���켣

      //desRect := classes.Rect(carCurrPos.x - 35, carCurrPos.y - 19, carCurrPos.x + 35, carCurrPos.y + 60);

      //--------------------���������ѡ�У����ƺŵ�ɫ������ɫ��������clCream�������� ������ɫ
      if (SelectedMeta.Count <= DRAWSelectDevCnt) and (SelectedMeta.IsDataIn(m.MetaIndex)) then
      begin
        bWrite := True;
        BkColor := clLime;
        TextColor := clCream;
        Text := '��ѡ�� ';
        isSelected := True;
      end;

      oldColor := GpsMap.TmpDraw.Canvas.Brush.Color;
      if GlobalParam.carpicType = 1 then //===0===��ͨ��ʾͼƬ   1 ��ʾ��������ͼƬ
      begin
        if m.Orientation > 360 then
        begin
          m.Orientation := m.Orientation1;
          m.OrientationRightTime := m.OrientationRightTime + 1;
        end;
        for j:= 0 to 7 do //8������sha.20090925 ��
        begin
          if j=0 then
          begin
            if (m.Orientation >=360-22) and (m.Orientation <=j*45+22) then
              break;
          end
          else
            if (m.Orientation>= j*45-22) and (m.Orientation <=j*45+22) then
              break;
        end;
        if j>7 then j:= 0;
        m.OrientationRightTime := 0;
        m.Orientation1 := m.Orientation;
        director := true;
        Mainf.ImageListCarPicInMap.Draw(GpsMap.TmpDraw.Canvas, carCurrPos.X - 8, carCurrPos.Y - 8, j);

//        if m.OrientationRightTime >= 3 then
//        begin
//          ResManage.BmpList.Draw(GpsMap.TmpDraw.Canvas, carCurrPos.X - 8, carCurrPos.Y - 8, m.Car.ResIndex);
//        end;
      end else
      begin
        imageindex := 8;
        PenColor := 15130650;  // ����ɫ
        BrushColor := 15130650;
        //�ж��Ƿ�λ������λ�������ɫ����λ��������ɫ
        if (not m.Switch[STAT_GPS_LOCATE]) or (not m.isOnline)  then
        begin
          imageindex := 2; // ����λ
          if m.Switch_Warning[0] then
          begin
            bWrite := True;
            BkColor := GlobalParam.FDriverAlarmColor;
            TextColor := clCream;
            Text := Text + '��������';          
            PenColor := GlobalParam.FDriverAlarmColor;//clRed;
            BrushColor := GlobalParam.FDriverAlarmColor;//clRed;
          end
          else
          begin
            PenColor := clMedGray;
            BrushColor := clMedGray;
          end;
        end
        else
        begin
          imageindex := 0;  // ��λ
          PenColor := clBlue;
          BrushColor := clBlue;
          //if not m.Alarm then
          if not m.Switch_Warning[0] then
          begin
            PenColor := clGreen;
            BrushColor := clLime;
          end
          else
          begin
            bWrite := True;
            BkColor := GlobalParam.FDriverAlarmColor;
            TextColor := clCream;
            Text := Text + '��������';
            imageindex := 4;

            PenColor := GlobalParam.FDriverAlarmColor;//clRed;
            BrushColor := GlobalParam.FDriverAlarmColor;//clRed;
          end;

        end;
        //if  (m.Alarm) or (isSelected) then
        if m.Switch_Warning[0] or isSelected then
        begin
          if FMap.DrawCood.Scale < 40 then
          begin
            ImageListCar.Draw(GpsMap.TmpDraw.Canvas, carCurrPos.X - 8, carCurrPos.Y - 8, imageindex);
          end
          else
          begin
            //PenColor := clBlack;
            GpsMap.TmpDraw.Canvas.Pen.Color := PenColor;
            GpsMap.TmpDraw.Canvas.Brush.Color := BrushColor;
            //GpsMap.TmpDraw.Canvas.Pen.Mode := pmCopy;

            GpsMap.TmpDraw.Canvas.Pen.Width := 0;
            GpsMap.TmpDraw.Canvas.Pen.Mode := pmMask;
            GpsMap.TmpDraw.Canvas.Ellipse(carCurrPos.x - 2 , carCurrPos.y - 2, carCurrPos.x + 5, carCurrPos.y + 5);
            GpsMap.TmpDraw.Canvas.Brush.Color := oldColor;
          end;
        end else
        begin
          TempCount := TempCount + 1;
          if TempCount > DevCount then Exit;

          if FMap.DrawCood.Scale < 40 then
          begin
            ImageListCar.Draw(GpsMap.TmpDraw.Canvas, carCurrPos.X - 8, carCurrPos.Y - 8, imageindex);
          end
          else
          begin
            //PenColor := clBlack;
            GpsMap.TmpDraw.Canvas.Pen.Color := PenColor;
            GpsMap.TmpDraw.Canvas.Brush.Color := BrushColor;
            //GpsMap.TmpDraw.Canvas.Pen.Mode := pmCopy;

            GpsMap.TmpDraw.Canvas.Pen.Width := 0;
            GpsMap.TmpDraw.Canvas.Pen.Mode := pmMask;
            GpsMap.TmpDraw.Canvas.Ellipse(carCurrPos.x - 2 , carCurrPos.y - 2, carCurrPos.x + 5, carCurrPos.y + 5);
            GpsMap.TmpDraw.Canvas.Brush.Color := oldColor;
          end;
        end;


      end;
      if bWrite then
      begin
        SetBkColor(GpsMap.TmpDraw.Canvas.Handle, BkColor);     // ��ɫ
        SetTextColor(GpsMap.TmpDraw.Canvas.Handle, TextColor);
        desRect := classes.Rect(carCurrPos.x - 45 - Length(Text)*2, carCurrPos.y - 19,
                              carCurrPos.x + 45 + Length(Text)*2, carCurrPos.y + 60);
        DrawText(GpsMap.TmpDraw.Canvas.Handle, PChar(Text), Length(Text), desRect, DT_CENTER);
      end;

      ADeviceManage.AddCurrentDevOnTheMap(carCurrPos.X, carCurrPos.Y, m);
      m.IsOnMap := True;
    end;

    GpsMap.TmpDrawChanged := True;
    MetaInScreen.Add(m.MetaIndex);
  end;

//-----------------------------------------------------------------------------------------------------
begin
  try
    //inherited;{$endif}//�˾�ע�͵������ٻ���ͼԪ,��Ϊ�����ƶ�Ŀ�ꡣ
    Result := false;
    if not (lyVisible in State) then Exit;
    //�����ǰ״̬Ϊ�켣�ط�,���˳�.2007-07-31
    if FMap.DrawCood.Scale < 40 then
      ImageListCar := Mainf.ImageListMapCar
    else
      ImageListCar := Mainf.ImageList3;

    if ADeviceManage.Count < 2500 then
    begin
      DevCount := ADeviceManage.Count;
    end else
    begin
      if (FMap.DrawCood.Scale div 20) = 0 then
      begin
        DevCount := ADeviceManage.Count;
      end else
      begin
        DevCount := ADeviceManage.Count div (FMap.DrawCood.Scale div 10);
      end;
    end;
    TempCount := 0;

    //�ѵ�ǰ��ͼ�ϵ�ͼԪ���
    MetaInScreen.Clear;
    ADeviceManage.CurrentDevOnTheMapIsUse := true;
    ADeviceManage.ClearCurrentDevOnTheMap;
    emptyCount := 0;
    fullCount := 0;
    if GpsMap.IsPlayGpsData then
    begin
      FAutoFollowDevice.isOnline := true;
      if (GlobalParam.ShowTheMapOption = 0) or (GlobalParam.ShowTheMapOption = 1) then
      begin
        DrawCar(FAutoFollowDevice);
      end
      else if GlobalParam.ShowTheMapOption = 2 then
      begin
        DrawCar2(FAutoFollowDevice);
      end;

      try
        p.X := GpsMap.Width - 60;
        p.Y := GpsMap.Height - 10;
        FFont.Size := 15;
            //GraphDraw.TyoDrawTrueFont(GpsMap.TmpDraw.Canvas.Handle,'�켣�ط�ģʽ',FFont,p);
        GraphDraw.TyoDrawTrueFont(GpsMap.FDrawBitmap.Canvas.Handle, '�켣�ط�ģʽ', FFont, p);


        carCurrPos.X := GpsMap.Width div 2;
        carCurrPos.Y := GpsMap.Height - 8;
        FFont.Size := 10;
        s := 'ʱ��:' + FormatDatetime('yyyy-mm-dd hh:nn:ss', FAutoFollowDevice.GpsTime);
        s := s + ' �ٶ�:' + FormatFloat('##0.0', FAutoFollowDevice.Speed/10){{IntToStr(FAutoFollowDevice.Speed)//ls} + 'km/h';

        GraphDraw.TyoDrawTrueFont(GpsMap.TmpDraw.Canvas.Handle, s, FFont, carCurrPos);


      except on E: Exception do
          elog.SystemLog.AddLog(' TGpsDrawLayer.Draw1  ', e.Message);
      end;
      exit;
    end;
    GpsMap.TmpDraw.Canvas.Font.Size := GlobalParam.FontSize;


    if (GlobalParam.ShowTheMapOption = 0) or (GlobalParam.ShowTheMapOption = 1) then
    begin
      if GpsMap.IsPlaySepcialCar then
      begin
        DrawCar(FDev);
        Exit;
      end;
      for i := 0 to ADeviceManage.Count - 1 do
      begin
        m := ADeviceManage.Items[i];
        //�Ƿ�����,������ճ���; ��ΪҪ���㲻����Ļ�еĳ���,����Ҫ�����ж��Ƿ�����Ļ��֮ǰ.
        {if m.isOnline then
        begin
          if not m.Switch[MSG_STATE_9] then
          begin
            Inc(EmptyCount); //�ճ�
          end
          else
          begin
            Inc(FullCount);
          end;
        end; }
        if m.SpecialCar then Continue;
        if GlobalParam.isShowAllDev then
        begin
          DrawCar(m);
        end
        else if GlobalParam.isShowEmpty then
        begin
          if not m.Switch[MSG_STATE_9] then
            DrawCar(m);
        end
        else if not GlobalParam.isShowEmpty then
        begin
          if m.Switch[MSG_STATE_9] then
            DrawCar(m);
        end;
      end;
    end
    else if GlobalParam.ShowTheMapOption = 2 then
    begin
      if GpsMap.IsPlaySepcialCar then
      begin
        DrawCar2(FDev);
        Exit;
      end;
      for i := 0 to ADeviceManage.Count - 1 do
      begin
        m := ADeviceManage.Items[i];

        if m.SpecialCar then Continue;

        m.IsOnMap := False;

        if GlobalParam.isShowAllDev then
        begin
          DrawCar2(m);
        end
        else if GlobalParam.isShowEmpty then
        begin
          if not m.Switch[MSG_STATE_9] then    // �ճ�
            DrawCar2(m);
        end
        else if not GlobalParam.isShowEmpty then
        begin
          if m.Switch[MSG_STATE_9] then
            DrawCar2(m);
        end;
      end;
    end;

  //GraphDraw.ReStoreGDI(GpsMap.TmpDraw.Canvas.Handle,oldPen,oldBrush);
    ADeviceManage.CurrentDevOnTheMapIsUse := false;
//    if Assigned(OnEmptyFull) then//and (GlobalParam.isShowEmptyFull) then
//    begin
//      OnEmptyFull(Self, EmptyCount, FullCount);
//    end;

  except on E: Exception do
      elog.SystemLog.AddLog(' TGpsDrawLayer.Draw��������: ', e.Message);
  end;

end;

//���켣����

procedure TGpsDrawLayer.DrawACarCourse(ADevice: TDevice);
var
  WorldFromPoint, WorldToPoint: TWorldPoint;
//  DrawFromPoint, DrawToPoint: TPoint;
  i: Integer;
  oldPen: HPen;
  oldBrush: HBrush;
  meta: TMetaStruct;
  tmpPen: TPenStruct;
begin
  //inherited;
  //Exit;
  try
    meta._type := _Line;
    meta.Line.Pen := ADevice.TrackPen;
    if ADevice.TrackPen.Width = 0 then
    begin
      tmpPen.Width := 1;
      tmpPen.Pattern := 1;
      tmpPen.color := clBlack;
      ADevice.TrackPen := tmpPen;
    end;
    WorldFromPoint := ADevice.TraceList.Items[0];
    meta.Line.SP := Map.DrawCood.ConvertSP(WorldFromPoint);
    GraphDraw.SaveGDI(GpsMap.TmpDraw.Canvas.Handle, oldPen, oldBrush);


    GpsMap.TmpDraw.Canvas.Pen.Width := ADevice.TrackPen.Width;
    GpsMap.TmpDraw.Canvas.Pen.Color := ADevice.TrackPen.color;
    meta.Line.Pen := ADevice.TrackPen;
    //meta.Line.Pen.Pattern := ADevice.TrackPen.Pattern;

    for i := 1 to ADevice.TraceList.Count - 1 do
    begin
      WorldToPoint := ADevice.TraceList.Items[i];
      meta.Line.EP := Map.DrawCood.ConvertSP(WorldToPoint);
      if (GeometryCalc.PointInRect(WorldFromPoint, Map.DrawCood.WorldRect)) or
        (GeometryCalc.PointInRect(WorldToPoint, Map.DrawCood.WorldRect)) then
      begin
      {if max(abs(WorldFromPoint.x-WorldToPoint.x),
       abs(WorldFromPoint.y-WorldToPoint.y)) > GlobalParam.FlyDistance then //�ɳ�1000�ײ���
      begin
        meta.Line.Pen.Pattern := 3;
      end; }


        GraphDraw.DrawArrow(GpsMap.TmpDraw.Canvas.Handle, meta.Line.SP, meta.Line.EP, 8, 24);
        DrawLine(GpsMap.TmpDraw.Canvas.Handle, meta);
        //Map.tmpBitmap.Canvas.MoveTo(DrawFromPoint.x, DrawFromPoint.y);
        //Map.tmpBitmap.Canvas.LineTo(DrawToPoint.x, DrawToPoint.y);
      //end;

      end;
      WorldFromPoint := WorldToPoint;
      meta.Line.SP := meta.Line.EP;
    end;
    GraphDraw.ReStoreGDI(GpsMap.TmpDraw.Canvas.Handle, oldPen, oldBrush);

  except on E: Exception do
      elog.SystemLog.AddLog(' TGpsDrawLayer.DrawACarCourse��������: ', e.Message);
  end;
end;

procedure TGpsDrawLayer.DrawConfineArea;
//var
//  i,j: integer;
//  confArea   : TConfineArea;
//  pointAry   : TPointAry;
//  isInScreebRect :boolean;  //�Ƿ��ڵ�ͼ�л���
begin
 (* if GAreaManage=nil then exit;
  for i:= 0 to GAreaManage.Count -1 do
  begin
    confArea:= GAreaManage.Items[i];
    if not confArea.IsDraw then Continue;
    GpsMap.TmpDraw.Canvas.Pen.Color := confArea.AreaColor;
    GpsMap.TmpDraw.Canvas.Pen.Width :=3;
    GpsMap.TmpDraw.Canvas.Pen.Mode := pmMask ;

    SetLength(pointAry,confArea.PointCount);
    for j:=0 to confArea.PointCount -1 do
    begin
      //ֻҪ�������һ�����ڵ�ǰ��Ļ�У��ͻ���
      if GeometryCalc.PointInRect(confArea.WorldPointAry[j], Map.DrawCood.WorldRect) then
        isInScreebRect:= true;
      pointAry[j] := Map.DrawCood.ConvertSP(confArea.WorldPointAry[j]);
    end;
    if isInScreebRect then
      GpsMap.TmpDraw.Canvas.Polygon(pointAry);
  end;   *)
end;

procedure TGpsDrawLayer.DrawLine(DC: HDC; line: TMetaStruct);
var
  //points_count,sizeofbuffer:integer;
  start_point, end_Point: TPoint;
  newCount: integer;
  points: TWorldPointAry;
  subpoly: TIntegerDynArray;
begin
  case line._type of
    _Line:
      begin
        with line.Line do
        begin
          start_point := SP;
          end_point := EP;
          if GraphDraw.GetPenType(Pen.Pattern) <> WINDOWS_PEN then
          begin
            SetLength(points, 2);
            points[0] := start_point;
            points[1] := end_point;
            SetLength(subpoly, 1);
            subpoly[0] := 2;
            newCount := 1;
            if GisClip.ClipPolyPolyLine(Rect(0, 0, Map.DrawCood.ScreenWidth, Map.DrawCood.ScreenHeight),
              newCount, subpoly, points) then
              GraphDraw.TyoPolyPolyLine(Pen, DC, points, subpoly, newCount);
          end else
          begin
            GraphDraw.SetPen(DC, Pen);
            MoveToEx(DC, start_point.x, start_point.y, nil);
            LineTo(DC, end_point.x, end_point.y);
          end;
        end;
      end;
  else ;
  end;
end;

procedure TGpsDrawLayer.DrawRectIfOutorInAlarmArea(m: TDevice; CarCurrPos: TPoint);
var
  confArea: TConfineArea;
begin
  if (m.Alarm_OutCArea) or (m.Alarm_WAYOutCArea) then
  begin
    //confArea := GAreaManage.Find(m.OutCAreaId);
   // if confArea = nil then exit;
    GpsMap.TmpDraw.Canvas.Pen.Color := clFuchsia; //confArea.AreaColor;//�����޶��������ɫ
    GpsMap.TmpDraw.Canvas.Pen.Width := 3;
    GpsMap.TmpDraw.Canvas.Pen.Mode := pmMask;
    GpsMap.TmpDraw.Canvas.Ellipse(carCurrPos.x - 15, carCurrPos.y - 30, carCurrPos.x + 15, carCurrPos.y + 15);
  end;
  if (m.Alarm_InCArea) or (m.Alarm_WAYInCArea) then
  begin
    //confArea := GAreaManage.Find(m.InCAreaId);
    //if confArea = nil then exit;
    GpsMap.TmpDraw.Canvas.Pen.Color := clFuchsia; //confArea.AreaColor;//�����޶��������ɫ
    GpsMap.TmpDraw.Canvas.Pen.Width := 3;
    GpsMap.TmpDraw.Canvas.Pen.Mode := pmMask;
    GpsMap.TmpDraw.Canvas.Pen.Style := psDot; //ʻ�뱨��--����. ֻ����Pen.Width =1ʱ�Ż����ߡ���1ʱ���ǻ���ʵ��!!??
    GpsMap.TmpDraw.Canvas.Rectangle(carCurrPos.x - 23, carCurrPos.y - 30, carCurrPos.x + 24, carCurrPos.y + 15);
  end;
end;

class function TGpsDrawLayer.GetIdentification: Longword;
begin
  Result := TDrawLayer.GetIdentification + $3000;
end;

//������ ��GPSͼ�� �� ѡ��ͼԪ��

procedure TGpsDrawLayer.HighLightSelectedMetas(DC: HDC);
begin
  GpsMap.ClearTmpDraw;
  Draw;
end;

//�Ƿ���Ҫ�ػ�,�����ٳ����ܳ���ͼ��Ҫ�ػ���ͼ.

function TGpsDrawLayer.IsRedrawMap: Boolean;
var
  carPos: TPoint;
begin
  Result := False;
  if AutoFollowDevice = nil then Exit;
  carPos := Map.Projection.LoLa2XY(EarthPoint(AutoFollowDevice.Longitude, AutoFollowDevice.Latitude));
  if not GeometryCalc.PointInRect(carPos, Map.DrawCood.WorldRect) then
  begin
    if Assigned(FOnReDrawMap) then
      FOnReDrawMap(Self, AutoFollowDevice);
    map.Zoom(1, carPos); //ƽ�Ƶ�ͼ��ʹ�ø��ٳ�������
    Result := True;
  end;
end;

procedure TGpsDrawLayer.SetAutoFollowDevice(const Value: TDevice);
begin
  FAutoFollowDevice := Value;
end;

procedure TGpsDrawLayer.SetDev(const Value: TDevice);
begin
  FDev := value;
end;

procedure TGpsDrawLayer.SetGpsMap(const Value: TGpsMap);
begin
  FGpsMap := Value;
end;

{ TUserMap }

//���ǡ���������

function TAreaDrawLayer.ClipDraw(DC: HDC; Rect: TWorldRect; Canvas: TCanvas): boolean;
begin
  DrawConfinArea(Dc);
  //inherited;
end;

procedure TAreaDrawLayer.DrawConfinArea(Dc: HDC);
var
  i, j, k: integer;
  confArea: TConfineArea;
  pointAry: TPointAry;
  isInScreenRect: boolean; //�Ƿ��ڵ�ͼ�л���
  ////////////
  oldPen: HPen;
  oldBrush: HBrush;
//  rect:TWorldRect;
  newPen: TPenStruct;
  newBrush: TBrushStruct;
  rect: TRect;
begin
  if GAreaManage = nil then exit;
  try
    GraphDraw.SaveGDI(DC, oldPen, oldBrush);

    for i := 0 to GAreaManage.Count - 1 do
    begin
      confArea := GAreaManage.Items[i];
      if not confArea.IsDraw then Continue;

      isInScreenRect := False;

      SetLength(pointAry, confArea.PointCount);
      for j := 0 to confArea.PointCount - 1 do
      begin
        //ֻҪ�������һ�����ڵ�ǰ��Ļ�У��ͻ���
        if GeometryCalc.PointInRect(confArea.WorldPointAry[j], Map.DrawCood.WorldRect) then
          isInScreenRect := true;
        pointAry[j] := Map.DrawCood.ConvertSP(confArea.WorldPointAry[j]);
      end;

      if isInScreenRect then
      begin
        newPen.color := confArea.AreaColor;
        newPen.Width := 3;
        if (confArea.AreaType = ALARM_OUT) or (confArea.AreaType = ALARM_WAY_OUT) then
          newPen.Pattern := CU_PS_SOLID
        else if (confArea.AreaType = ALARM_IN) or (confArea.AreaType = ALARM_WAY_IN) then
          newPen.Pattern := CU_PS_DASH3_1 //ʻ�뱨��--����
        else if (confArea.AreaType = ALARM_OVER_SPEET) or (confArea.AreaType = ASSEMBLE_WARRING)
                or (confArea.AreaType = OUT_TOWN) or (confArea.AreaType = ANTIFAKE_WARRING)
                or (confArea.AreaType = SUSPECTEDPETITIONS_WARRING) then
          newPen.Pattern := CU_PS_DASH1_1 //���򱨾�
        else if confArea.AreaType = SEEK_CAR  then  // ����鳵
          newPen.Pattern := CU_PS_SOLID;
        GraphDraw.SetPen(DC, newPen);
        newBrush.Transparent := 0;
        newBrush.Pattern := 0;
        GraphDraw.SetBrush(Dc, newBrush);
        if (confArea.AreaType = ALARM_WAY_OUT) or (confArea.AreaType = ALARM_WAY_IN) then
        begin
          Polyline(Dc, pointAry[0], length(pointAry));
            //���Ի���������
{$IFOPT d+}
          SetLength(pointAry, 4);
          for k := 0 to confArea.RunWayRectList.Count - 1 do
          begin
            pointAry[0] := Map.DrawCood.ConvertSP(confArea.RunWayRectList.Items[k].PointList[0]);
            pointAry[1] := Map.DrawCood.ConvertSP(confArea.RunWayRectList.Items[k].PointList[1]);
            pointAry[2] := Map.DrawCood.ConvertSP(confArea.RunWayRectList.Items[k].PointList[2]);
            pointAry[3] := Map.DrawCood.ConvertSP(confArea.RunWayRectList.Items[k].PointList[3]);
            Polygon(Dc, pointAry[0], 4);
          end;
{$ENDIF}
        end
        else
          Polygon(Dc, pointAry[0], length(pointAry));
        //TextOut(Dc,0,0,'draw',4);   //���Կ��Ƿ���
      end;
    end;


    GraphDraw.ReStoreGDI(DC, oldPen, oldBrush);
  except on E: Exception do
      elog.SystemLog.AddLog(' TAreaDrawLayer.DrawConfinArea ', e.Message);
  end;
end;

{ TUserDefinedTextLayer }

function TUserDefinedTextLayer.ClipDraw(DC: HDC;
  Rect: TWorldRect; Canvas: TCanvas): boolean;
begin
  DrawUserDefinedText(Dc);
end;

procedure TUserDefinedTextLayer.DrawUserDefinedText(Dc: HDC);
var
  i, Left, Right: integer;
  beginI: integer;
  oldPen: HPen;
  oldBrush: HBrush;
  p: TPoint;
begin
  try
    if GTextManage = nil then exit;
    GraphDraw.SaveGDI(DC, oldPen, oldBrush);
    try
      Left := Map.DrawCood.WorldRect.Left;
      Right := Map.DrawCood.WorldRect.Right;
      Begini := -1;
      for i := 0 to GTextManage.Count - 1 do
      begin
        if Begini < 0 then
        begin
          if GTextManage.Item[i]^.Symbol.Position.X >= Left then
          begin
            Begini := i;
          //�жϵ��Ƿ��ڵ�ǰ��Ļ��
            if GTextManage.Item[i]^.MaxScale > 0 then
              if not ((Map.DrawCood.Scale > GTextManage.Item[i]^.MinScale) and (Map.DrawCood.Scale < GTextManage.Item[i]^.MaxScale)) then
                Continue;
            if GeometryCalc.PointInRect(GTextManage.Item[i]^.Symbol.Position, Map.DrawCood.WorldRect) then
            begin
              p := Map.DrawCood.ConvertSP(GTextManage.Item[i]^.Symbol.Position);
              GraphDraw.DrawCustomSymbol(DC, GTextManage.Item[i]^.Symbol.CustomSymbol, p);
              p.Y := p.Y - 15;
              GraphDraw.TyoDrawTrueFont(DC, GTextManage.Item[i]^.Text, GTextManage.Item[i]^.TextFont, p);
            end;
          end;
        end
        else
        begin
        //�жϵ�ǰ���X��û�й���Ļ��RIGHT
          if GTextManage.Item[i]^.Symbol.Position.X >= Right then
            Break;
        //�жϵ��Ƿ��ڵ�ǰ��Ļ��
          if GTextManage.Item[i]^.MaxScale > 0 then
            if not ((Map.DrawCood.Scale > GTextManage.Item[i]^.MinScale) and (Map.DrawCood.Scale < GTextManage.Item[i]^.MaxScale)) then
              Continue;
          if GeometryCalc.PointInRect(GTextManage.Item[i]^.Symbol.Position, Map.DrawCood.WorldRect) then
          begin
            p := Map.DrawCood.ConvertSP(GTextManage.Item[i]^.Symbol.Position);
            GraphDraw.DrawCustomSymbol(DC, GTextManage.Item[i]^.Symbol.CustomSymbol, p);
            p.Y := p.Y - 15;
            GraphDraw.TyoDrawTrueFont(DC, GTextManage.Item[i]^.Text, GTextManage.Item[i]^.TextFont, p);
          end;
        end;
      end;
    finally
      GraphDraw.ReStoreGDI(DC, oldPen, oldBrush);
    end;
  except on E: Exception do
      elog.SystemLog.AddLog(' TUserDefinedTextLayer.DrawUserDefinedText ', e.Message);
  end;
end;

{ TGpsPlayDrawLayer }

function TGpsPlayDrawLayer.Draw: boolean;
var
//  i: Integer;
  desRect: TRect;
  carCurrPos: TPoint;
  pMeta: PMetaStruct;
  m: TDevice;
//  tempdc: TDrawBmp;
begin
  if not (lyVisible in State) then Exit;
  //����Ϊ�켣��ʱ�˳�
  if not GpsMap.IsPlayGpsData then Exit;
  //�ѵ�ǰ��ͼ�ϵ�ͼԪ���
  MetaInScreen.Clear;
  //����
  m := PlayDev;
  if m.MetaIndex >= Data.MetaCount then Exit;
  pMeta := Data.GetMetaPointer(m.MetaIndex {,Map.Projection.ProjectionType});
  //ͼԪδ����
  if not pMeta^.Enabled then Exit;
  carCurrPos := pMeta^.Symbol.Position;
  //Ŀ�겻����Ļ��
  if not GeometryCalc.PointInRect(carCurrPos, Map.DrawCood.WorldRect) then Exit;
  carCurrPos := Map.DrawCood.ConvertSP(carCurrPos);
  //���켣��
  if m.DrawTrack then DrawACarCourse(m);
  //����
//  ResManage.BmpList.Draw(GpsMap.TmpDraw.Canvas, carCurrPos.X - 8, carCurrPos.Y - 8,
//    m.Car.ResIndex);
  //�����ƺ�
  SetBkColor(GpsMap.TmpDraw.Canvas.Handle, clGreen);
  SetTextColor(GpsMap.TmpDraw.Canvas.Handle, clCream);
  desRect := classes.Rect(carCurrPos.x - 35, carCurrPos.y - 19, carCurrPos.x + 31, carCurrPos.y + 60);
  drawtext(GpsMap.TmpDraw.Canvas.Handle, PChar(m.Car.No), Length(m.Car.No), desRect, DT_CENTER);

  GpsMap.TmpDrawChanged := True;
  MetaInScreen.Add(m.MetaIndex);
end;

function TGpsPlayDrawLayer.IsRedrawMap: Boolean;
var
  carPos: TPoint;
begin
  Result := False;
  carPos := Map.Projection.LoLa2XY(EarthPoint(playDev.Longitude, playDev.Latitude));
  if not GeometryCalc.PointInRect(carPos, Map.DrawCood.WorldRect) then
  begin
    map.Zoom(1, carPos); //ƽ�Ƶ�ͼ��ʹ�ø��ٳ�������
    Result := True;
  end;
end;


{ TAlarmNoSybolLayer }

function TAlarmNoSybolLayer.ClipDraw(DC: HDC; Rect: TWorldRect;
  Canvas: TCanvas): boolean;
begin
  DrawAlarmNoSybolLayer(dc);
  DrawRoadsLayer(Dc);
end;

procedure TAlarmNoSybolLayer.DrawAlarmNoSybolLayer(Dc: HDC);
  function GetDistance(P1, P2: TPoint): Integer;
  var
    d: double;
  begin
    d := Sqrt(power(p1.X - p2.X, 2) + power(p1.Y - p2.Y, 2));
    Result := Round(d);
  end;
var
  i, j, k: integer;

  pointAry: TPointAry;
  isInScreenRect: boolean; //�Ƿ��ڵ�ͼ�л���

  oldPen: HPen;
  oldBrush: HBrush;

  newPen: TPenStruct;
  newBrush: TBrushStruct;
  rect: TRect;

  BaseArea: TBaseArea;

  NoSymbolArea: TNoSymbolArea;

  RectangleArea: TRectangleArea;

  CircleArea: TCircleArea;
  left: TWorldPoint;
  right: TWorldPoint;
  Apoint: TPoint;
  Circle: Tpoint;
  FOrgPoint: Tpoint;
  radius: integer;
  PolyLineArea: TPolyLineArea;
  lineSection: TLineSection;
begin
  if FAllAreaManage = nil then exit;
  try
    GraphDraw.SaveGDI(DC, oldPen, oldBrush);

    for i := 0 to FAllAreaManage.AllCircleList.Count - 1 do
    begin
      BaseArea := TBaseArea(FAllAreaManage.AllCircleList.Items[i]);
      if not basearea.isshow then continue;
      case baseArea.AreaPictureKind of
        0: begin
            CircleArea := TCircleArea(FAllAreaManage.AllCircleList.Items[i]);
            newPen.color := clred;
            newPen.Width := 3;
            newPen.Pattern := CU_PS_DASH1_1;
            GraphDraw.SetPen(DC, newPen);
            newBrush.Transparent := 0;
            newBrush.Pattern := 0;
            GraphDraw.SetBrush(Dc, newBrush);

            //��2����ת����ƽ������
            Circle := Map.DrawCood.ConvertSP(Map.Projection.LoLa2XY(CircleArea.ACircle));
            FOrgPoint := Map.DrawCood.ConvertSP(Map.Projection.LoLa2XY(CircleArea.lastPoint));
            radius := GetDistance(Circle, FOrgPoint);

            Ellipse(dc, Circle.X + radius, Circle.Y + radius, Circle.X - radius, Circle.Y - radius);
          end;
        1: begin
            RectangleArea := TRectangleArea(FAllAreaManage.AllCircleList.Items[i]);
            left := Map.Projection.LoLa2XY(RectangleArea.leftPoint);
            right := Map.Projection.LoLa2XY(RectangleArea.RightPoint);
            setlength(pointAry, 4);

            pointAry[0] := Map.DrawCood.ConvertSP(left);
            pointAry[2] := Map.DrawCood.ConvertSP(right);

            Apoint.X := pointAry[2].X;
            Apoint.Y := pointAry[0].y;
            pointAry[1] := Apoint;
            Apoint.X := pointAry[0].X;
            Apoint.Y := pointAry[2].y;
            pointAry[3] := Apoint;
            newPen.color := clred;
            newPen.Width := 3;
            newPen.Pattern := CU_PS_DASH1_1;

            GraphDraw.SetPen(DC, newPen);
            newBrush.Transparent := 0;
            newBrush.Pattern := 0;
            GraphDraw.SetBrush(Dc, newBrush);

            Polygon(Dc, pointAry[0], length(pointAry));
          end;
        2: begin
            NoSymbolArea := TNoSymbolArea(FAllAreaManage.AllCircleList.Items[i]);
            SetLength(pointAry, NoSymbolArea.PointCount);
            for j := 0 to NoSymbolArea.PointCount - 1 do
            begin
        //ֻҪ�������һ�����ڵ�ǰ��Ļ�У��ͻ���
              if GeometryCalc.PointInRect(NoSymbolArea.WorldPointAry[j], Map.DrawCood.WorldRect) then
                isInScreenRect := true;
              pointAry[j] := Map.DrawCood.ConvertSP(NoSymbolArea.WorldPointAry[j]);
            end;
            newPen.color := clred;
            newPen.Width := 3;
            newPen.Pattern := CU_PS_DASH1_1;

            GraphDraw.SetPen(DC, newPen);
            newBrush.Transparent := 0;
            newBrush.Pattern := 0;
            GraphDraw.SetBrush(Dc, newBrush);

            Polygon(Dc, pointAry[0], length(pointAry));

          end;
        3:
        begin
          PolyLineArea := TPolyLineArea(FAllAreaManage.AllCircleList.Items[i]);
          for k := 0 to PolyLineArea.LineSectionCount - 1 do
          begin
            lineSection := PolyLineArea.LineSections[k];
            SetLength(pointAry, lineSection.PointCount);
            for j := 0 to lineSection.PointCount - 1 do
            begin
              if GeometryCalc.PointInRect(lineSection.WPointAry[j], Map.DrawCood.WorldRect) then
                isInScreenRect := true;
              pointAry[j] := Map.DrawCood.ConvertSP(lineSection.WPointAry[j]);
            end;
            newPen.color := clred;
            newPen.Width := 3;
            newPen.Pattern := CU_PS_DASH1_1;

            GraphDraw.SetPen(DC, newPen);
            newBrush.Transparent := 0;
            newBrush.Pattern := 0;
            GraphDraw.SetBrush(Dc, newBrush);

            Polyline(Dc, pointAry[0], length(pointAry));
          end;  

        end;
      end;
    end;

    GraphDraw.ReStoreGDI(DC, oldPen, oldBrush);
  except on E: Exception do
      elog.SystemLog.AddLog(' TAreaDrawLayer.DrawConfinArea ', e.Message);
  end;
end;

procedure TAlarmNoSybolLayer.DrawRoadsLayer(Dc: HDC);
var
  i,j:Integer;
  road:TRoad;
  ptCnt:Integer;
  pointAry:array of Tpoint;
  ep :TEarthPoint;
  wp:TWorldPoint;
  isInScreenRect:Boolean;
  oldPen: HPen;
  oldBrush: HBrush;    
  newPen: TPenStruct;
  newBrush: TBrushStruct;
begin
  if RoadManage = nil then exit;
  try
    GraphDraw.SaveGDI(DC, oldPen, oldBrush);

    for i := 0 to RoadManage.Count - 1 do
    begin
      road := RoadManage.Items[i];
      if not (road.IsVisible=1) then continue;
      SetLength(pointAry, road.RoadPointCnt);
      isInScreenRect := False;
      for j := 0 to road.RoadPointCnt - 1 do
      begin
        //ֻҪ·������һ�����ڵ�ǰ��Ļ�У��ͻ���
        ep := road.RoadPointAry[j];
        wp := Map.Projection.LoLa2XY(ep);
        if GeometryCalc.PointInRect(wp, Map.DrawCood.WorldRect) then
          isInScreenRect := true;
        pointAry[j] := Map.DrawCood.ConvertSP(wp);
      end;
      if not isInScreenRect then continue;
      newPen.color := road.RoadColor; //newPen.color := clred;
      newPen.Width := 3;
      newPen.Pattern := CU_PS_DASH1_1;
      GraphDraw.SetPen(DC, newPen);
      newBrush.Transparent := 0;
      newBrush.Pattern := 0;
      GraphDraw.SetBrush(Dc, newBrush);

      Polyline(Dc,pointAry,road.RoadPointCnt);//������
    end;
    GraphDraw.ReStoreGDI(DC, oldPen, oldBrush);
  except on E: Exception do
      elog.SystemLog.AddLog(' TAreaDrawLayer.DrawConfinArea ', e.Message);
  end;
end;

end.

