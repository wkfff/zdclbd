unit emape;

interface

uses
  emapker,
  Controls,
  Classes,
  MetaDefine,
  graphics,
  LoopList,
  windows,
  Para,
  tyoList;

const

  MinZoomPixel = 10;

type
  TMeasureEvent = procedure(Sender: TObject; Distance, TotalDistance, Area: Double; Flag: Integer) of object;
  //TSetConfineAlarmAreaEvent=procedure(Sender:TObject;PointTL,PointRB:Tpoint)of object;
  TSetConfineAlarmAreaEvent = procedure(Sender: TObject; WPointsAry: TWorldPointAry; PointsCnt: Integer) of object;
  TSetRunWayEvent = procedure(Sender: TObject; WPointsAry: TWorldPointAry; PointsCnt: Integer) of object;
  TRectSelectMetaEvent = procedure(Sender: TObject; PointA, PointB: TEarthPoint) of object;
  TUserDefinedTextEvent = procedure(Sender: TObject; EarthPoint: TEarthPoint; WorldPoint: TWorldPoint) of object;
  TUserCarDistanceEvent = procedure(Sender: TObject; EarthPoint: TEarthPoint; WorldPoint: TWorldPoint) of object;
  TUserStationEvent = procedure(Sender: TObject; EarthPoint: TEarthPoint; WorldPoint: TWorldPoint) of object;

  TSetConfineAlarmNoSybolEvent = procedure(Sender: TObject; WPointsAry: TWorldPointAry; PointsCnt: Integer) of object;
  TSetConfineAlarmRectangleEvent = procedure(Sender: TObject; LeftPoint, RightPoint: TEarthPoint) of object;
  TSetConfineAlarmCircleEvent= procedure(Sender: TObject; WCenterPoint: TEarthPoint; Radius: Integer;LastPoint: TEarthPoint) of object;

  //TBrowseSeekCar = procedure(BeginX: Integer; BeginY: Integer; EndX: Integer; EndY: Integer) of object;
  TBrowseSeekCar = procedure(Beginp: TPoint; Endp: TPoint) of object;
  TFindThing = procedure(BeginX: Integer; BeginY: Integer; EndX: Integer; EndY: Integer) of object;
  TSetLinePropertyEvent = procedure of object;
  TMapActionChangedEvent = procedure of object;

  TMapState = (_Browse, _Edit);
  TActionMap = class(TMap)
  private
    FWorldPointArray: TWorldPointAry; //ɳ��������ѡ��ʱ�����������
    FMeasureData: TWorldPointList;
    FUndoData: TBrowseUndoRecord;
    FCurrentUndoDescribe: string;
    FDisableUndoRecord: Boolean;
    FIsLineSectionSet: Boolean;//������·ʱ������ʶ�Ƿ��Ѿ�����·����
    FMoveOffsetValue: Integer;
    FTotalXPixel: Integer;
    FTotalYPixel: Integer;
    FOrgPoint: TPoint;
    FCurrentPoint: TPoint;
    FBeforeCurrentpoint: TPoint;
    FWorldOrgPoint: TWorldPoint;
    FWorldCurrentPoint: TWorldPoint;
    FWorldBeforeCurrentpoint: TWorldPoint;
    //FBrowseCapture:Boolean;
    FOperateState: TMapState;
    FCaptureMouse: Boolean;
    FCurrentShiftState: TShiftState;
    FBrowseUndoList: TBrowseUndoList;
    FOnMeasure: TMeasureEvent;
    FDisablePopupMetaInfo: Boolean;
    FOnActionChanged: TNotifyEvent;
    FDisableKeyDown: Boolean;
    FOnBeforeMouseMoveEvent: TNotifyEvent;
    FOnMetaSelected: TNotifyEvent;
    FOnSetConfineAlarmArea: TSetConfineAlarmAreaEvent;
    FOnRectSelectMeta: TRectSelectMetaEvent;
    FOnSetRunWay: TSetRunWayEvent;

    FOnUserDefinedText: TUserDefinedTextEvent;
    FOnUserSetFactory: TSetConfineAlarmCircleEvent;
    FOnBrowseSeekCar: TBrowseSeekCar;
    FOnFindThing: TFindThing;
    FonUserCarDistance: TUserCarDistanceEvent;
    FonUserStation: TUserStationEvent;
    FOnSetConfineAlarmCircle: TSetConfineAlarmCircleEvent;
    FSetConfineAlarmNoSybol: TSetConfineAlarmNoSybolEvent;
    FOnsetConfineAlarmRectangle: TSetConfineAlarmRectangleEvent;
    FOnUserSetFactoryPolygon: TSetConfineAlarmNoSybolEvent;
    FOnSetLineProperty: TSetLinePropertyEvent;
    FOnMapActionChangedEvent: TMapActionChangedEvent;


    procedure SetBeforeCurrentpoint(const Value: TPoint);
    procedure SetCurrentPoint(const Value: TPoint);
    procedure SetOrgPoint(const Value: TPoint);
    procedure SetWorldBeforeCurrentpoint(const Value: TWorldPoint);
    procedure SetWorldCurrentPoint(const Value: TWorldPoint);
    procedure SetWorldOrgPoint(const Value: TWorldPoint);
    procedure SetOperateState(const Value: TMapState);
    procedure SetCapture(const Value: Boolean);
    procedure SetMoveOffsetValue(const Value: Integer);
    procedure SetTotalXPixel(const Value: Integer);
    procedure SetTotalYPixel(const Value: Integer);
    procedure SetDisablekeyDown(const Value: Boolean);
    procedure SetOnBeforemouseMoveEvent(const Value: TNotifyEvent);
    function GetHaveSelectedMeta: Boolean;
    procedure SetOnMetaSelected(const Value: TNotifyEvent);
    procedure SetOnSetConfineAlarmArea(const Value: TSetConfineAlarmAreaEvent);
    procedure SetOnRectSelectMeta(const Value: TRectSelectMetaEvent);
    procedure SetOnSetRunWay(const Value: TSetRunWayEvent);
    procedure SetonUserCarDistance(const Value: TUserCarDistanceEvent);
    procedure SetonUserStation(const Value: TUserStationEvent);
    procedure SetOnSetConfineAlarmCircle(
      const Value: TSetConfineAlarmCircleEvent);
    procedure SetOnBrowseSeekCar(const Value: TBrowseSeekCar);
    procedure SetOnFindThing(const Value: TFindThing);
    procedure SetSetConfineAlarmNoSybol(
      const Value: TSetConfineAlarmNoSybolEvent);
    procedure SetOnsetConfineAlarmRectangle(
      const Value: TSetConfineAlarmRectangleEvent);
    procedure SetOnUserSetFactory(
      const Value: TSetConfineAlarmCircleEvent);
    procedure SetOnUserSetFactoryPolygon(
      const Value: TSetConfineAlarmNoSybolEvent);
    procedure SetOnSetLineProperty(const Value: TSetLinePropertyEvent);
    procedure SetOnMapActionChangedEvent(
      const Value: TMapActionChangedEvent);
  protected
    FBrowseCapture: Boolean; //sha �ŵ�����ɹ�����TGPSMap���á�
    procedure BrowseMeasure(AMouseState: TMouseState); virtual;
    procedure BrowseRectSelect(AMouseState: TMouseState); virtual;
    procedure BrowseRectSelectPolygon(AMouseState: TMouseState); virtual;//�����ѡ���� ls 20091230
    procedure BrowseCycleSelect(AMouseState: TMouseState); virtual;
    procedure BrowsePolygonSelect(AMouseState: TMouseState); virtual;
    procedure BrowsePointSelect(AMouseState: TMouseState); virtual;
    procedure BrowseZoomOut(AMouseState: TMouseState); virtual;
    procedure BrowseZoomIn(AMouseState: TMouseState); virtual;
    procedure BrowseSeekCar(AMouseState: TMouseState); virtual;

    procedure FindThing(AMouseState: TMouseState); virtual;

    procedure BrowseCheckEntityInfo(AMouseState: TMouseState); virtual;
    procedure BrowseMove(AMouseState: TMouseState); virtual;
    procedure BrowseSetConfineAlarmArea(AMouseState: TMouseState); virtual; //shaԽ��
    procedure BrowseSetRunWay(AMouseState: TMouseState); virtual; //������ʻ·��sha 20060816
    procedure BrowseUserDefinedText(AMouseState: TMouseState); virtual; //dxf �û��Զ����ǩ 2006-07-13
    procedure BrowseSetFactory(AMouseState: TMouseState); virtual; //dxf �û��Զ��幤������ 2008-01-19
    procedure BrowseSetFactoryPolygon(AMouseState: TMouseState); virtual; //�������� ����� 20090423��ͬ �û��Զ��岻����ͼ��
    procedure BrowseSetCarDistance(AMouseState: TMouseState); virtual;
    procedure BrowseSetStationMemo(AMouseState: TMouseState); virtual; //  �û��Զ���վ̨��Ϣ
    procedure BrowseSetConfineAlarmCircle(AMouseState: TMouseState); virtual; //sha �û�������Χ��-Բ�� 20081209
    procedure BrowseSetConfineAlarmrectangle(AMouseState: TMouseState); virtual;
    procedure BrowseSetConfineAlarmNoSybol(AMouseState: TMouseState); virtual; //swp �û��Զ��岻����ͼ��
    procedure BrowseMouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); virtual;
    procedure BrowseMouseMove(Shift: TShiftState; X, Y: Integer);
    procedure BrowseMouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    { TODO : ���ڻ� �޶�����ʱ����ESCȡ��������������ô�������ܴ��� }//KeyPress �¼� sha 2005-6-21
    procedure KeyPress(var Key: Char); override; //add by sha 2005.6-21 �ڻ��޶�����ʱ�������ESC����ȡ����
    procedure SetCurrentAction(AAction: Integer); override;
    function SelectMeta: Boolean;
    procedure DrawCoodWorldWillChange(Sender: TObject; WorldRect: TWorldRect; var Change: Boolean); override;
    procedure DrawCoodWorldChanged(Sender: TObject; WorldRect: TWorldRect); override;
    procedure DoPaint; override;
    procedure DoChangeSelectedMeta; virtual;
    procedure DoChangeEntityMeta; virtual;
    procedure DrawMeasurePath; virtual;
    procedure DoActionChanged; virtual;
    procedure DoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState); virtual;
    procedure DoMeasure(const Distance, TotalDistance, Area: Double; const Flag: Integer); virtual;
    procedure DoSetConfineAlarmArea(WPointsAry: TWorldPointAry; PointsCnt: Integer); virtual;
    procedure DosetConfineAlarmNoSybol(WPointsAry: TWorldPointAry; PointsCnt: Integer); virtual;
    //������ʻ·��
    procedure DoSetRunWay(WPointsAry: TWorldPointAry; PointsCnt: Integer); virtual;
    procedure DoSetLineProperty(); virtual;
    {��ѡѡ��ͼԪʱ���׳��¼�,��������ѡʱ��������յ� sha 2005-10-25}
    procedure DoRectSelectMeta(PointA, PointB: TEarthPoint); virtual;
    procedure DoDealMsgEvent(Sender: TObject; MsgID: Integer; Param: TGisParams); override;
    function AllowOperate(const AnOperate: Integer; AShowMessage: Boolean): Boolean; override;
    property OrgPoint: TPoint read FOrgPoint write SetOrgPoint;
    property BeforeCurrentpoint: TPoint read FBeforeCurrentpoint write SetBeforeCurrentpoint;
    property WorldOrgPoint: TWorldPoint read FWorldOrgPoint write SetWorldOrgPoint;
    property WorldCurrentPoint: TWorldPoint read FWorldCurrentPoint write SetWorldCurrentPoint;
    property WorldBeforeCurrentpoint: TWorldPoint read FWorldBeforeCurrentpoint write SetWorldBeforeCurrentpoint;
    property OperateState: TMapState read FOperateState write SetOperateState;
    property DisablePopupMetaInfo: Boolean read FDisablePopupMetaInfo write FDisablePopupMetaInfo;
    property CaptureMouse: Boolean read FCaptureMouse write SetCapture;
    property TotalXPixel: Integer read FTotalXPixel write SetTotalXPixel;
    property TotalYPixel: Integer read FTotalYPixel write SetTotalYPixel;
    property DisableKeyDown: Boolean read FDisableKeyDown write SetDisablekeyDown;
  public
    procedure ZoomInOut(InOrOut: byte; Left, Top, Rigth, Bottom: integer);
    constructor Create(AOwner: TComponent; Provider: TLayerProvider); override;
    destructor Destroy; override;
    property MouseAction;
    procedure LoadFromFiles(AFileNames: TStrings); virtual;
    function GetWorldRect: TWorldRect;
    procedure ChangeSelectedMeta; virtual;
    procedure ChangeEntityMeta; virtual;
    procedure Move(XPixels, YPixels: integer; XPixelsOff, YPixelsOff: integer);
    procedure MoveTo(XPixels, YPixels: integer);
    procedure BrowseBack;
    procedure BrowseForward;
    procedure MoveToCentre;
    procedure XYToLoLa(const X, Y: Integer; var Lo, La: Double);
    procedure LoLa2XY(const Lo, La: double; var X, Y: Integer); //add sha 20050223
    procedure XYTOWorldPoint(const X, Y: Integer; var WorldX, WorldY: integer);
    procedure ClearSelectMetas; overload;
    procedure ClearSelectMetas(const ADrawLayerID: Longword); overload;
    procedure KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState); virtual;
    procedure InvertSelectedMetas; overload;
    procedure InvertSelectedMetas(const ADrawLayerID: Longword); overload;
    function GetSelectedMetaCount(const ADrawID: Longword): Integer;
    property CurrentPoint: TPoint read FCurrentPoint write SetCurrentPoint;
    property HaveSelectedMeta: Boolean read GetHaveSelectedMeta;
    property OnMeasure: TMeasureEvent read FOnMeasure write FOnMeasure;
    property MoveOffsetValue: Integer read FMoveOffsetValue write SetMoveOffsetValue;
    property OnActionChanged: TNotifyEvent read FOnActionChanged write FOnActionChanged;
    property OnBeforeMouseMoveEvent: TNotifyEvent read FOnBeforeMouseMoveEvent write SetOnBeforemouseMoveEvent;
    property OnMetaSelected: TNotifyEvent read FOnMetaSelected write SetOnMetaSelected;
    property OnSetConfineAlarmArea: TSetConfineAlarmAreaEvent read FOnSetConfineAlarmArea write SetOnSetConfineAlarmArea; //sha Խ�籨������
    property OnRectSelectMeta: TRectSelectMetaEvent read FOnRectSelectMeta write SetOnRectSelectMeta;
    property OnSetRunWay: TSetRunWayEvent read FOnSetRunWay write SetOnSetRunWay; //������ʻ·��·������
    property OnSetLineProperty: TSetLinePropertyEvent read FOnSetLineProperty write SetOnSetLineProperty;//����·������
    property OnMapActionChangedEvent: TMapActionChangedEvent read FOnMapActionChangedEvent write SetOnMapActionChangedEvent;
    property OnUserDefinedText: TUserDefinedTextEvent read FOnUserDefinedText write FOnUserDefinedText;
    property onUserCarDistance: TUserCarDistanceEvent read FonUserCarDistance write SetonUserCarDistance;
    property OnUserSetFactory: TSetConfineAlarmCircleEvent read FOnUserSetFactory write SetOnUserSetFactory; //�û����幤��
    property onUserStation: TUserStationEvent read FonUserStation write SetonUserStation;
    property PopupMenu;
    property Option;
    property OnMouseWheel;
    property OnMouseWheelUp;
    property OnMouseWheelDown;
    property OnSetConfineAlarmCircle: TSetConfineAlarmCircleEvent read FOnSetConfineAlarmCircle write SetOnSetConfineAlarmCircle;
    property OnSetConfineAlarmNoSybol: TSetConfineAlarmNoSybolEvent read FSetConfineAlarmNoSybol write SetSetConfineAlarmNoSybol;
    property OnsetConfineAlarmRectangle: TSetConfineAlarmRectangleEvent read FOnsetConfineAlarmRectangle write SetOnsetConfineAlarmRectangle;
    //--����������-�����
    property OnUserSetFactoryPolygon :TSetConfineAlarmNoSybolEvent read FOnUserSetFactoryPolygon write SetOnUserSetFactoryPolygon;
    property OnBrowseSeekCar: TBrowseSeekCar read FOnBrowseSeekCar write SetOnBrowseSeekCar;
    property OnFindThing: TFindThing read FOnFindThing write SetOnFindThing;
  end;

implementation

uses
  Sysutils,
  tyoGraph,
  Forms,
  pitchon,
  StaticProc,
  math,
  RunData,
  EventDefine,
  elog,
  MapSeekCarFormUnit,
  MapMeasureCalc;
{ TActionMap }

function TActionMap.AllowOperate(const AnOperate: Integer; AShowMessage: Boolean): Boolean;
begin
  Result := True;
end;

procedure TActionMap.BrowseBack;
begin
  FDisableUndoRecord := True;
  Zoom(FBrowseUndoList.PriorData.WorldRect);
  FDisableUndoRecord := False;
  Draw;
end;

procedure TActionMap.BrowseCheckEntityInfo(AMouseState: TMouseState);
var
  smeta: TMetaStruct;
begin
  if (AMouseState = msDown) and
    (ssLeft in FCurrentShiftState) then
  begin
    sMeta._Type := _Symbol;
    sMeta.Symbol.Position := FWorldCurrentPoint;
    SelectSourceMeta := sMeta;
    if SelectMeta then
      ChangeEntityMeta;
  end;
end;

procedure TActionMap.BrowseCycleSelect(AMouseState: TMouseState);
begin
end;



procedure TActionMap.BrowseForward;
begin
  FDisableUndoRecord := True;
  Zoom(FBrowseUndoList.NextData.WorldRect);
  FDisableUndoRecord := False;
  Draw;
end;

procedure TActionMap.BrowseMeasure(AMouseState: TMouseState);
{ʵ��˼·��
���û������������󣬿�ʼ��������<br>
<li>���FMeasureData
<li>���FMeasure
<li>��ʼ����}
var
  distance: Double;
  totalDistance: Double;
  totalArea: Double;
  measureFlag: Integer;
  cursorRect: PRect;
  pt: TPoint;
begin
  try
    measureFlag := 0;
    distance := 0;
    totalDistance := 0;
    totalArea := 0;
{ TODO -o���� : ���ӻ��ߣ�����ʱ��һ�£�����һ������ʵ�� }
    if (AMouseState = msDown) and (ssLeft in FCurrentShiftState) then
    begin
      if not FBrowseCapture then
      begin
        FMeasureData.Clear;
        Measure.Clear;
        Measure.IsNonEarth := Projection.IsNonEarth;
//���������ƶ���Χ
        New(cursorRect);
        cursorRect^ := GetClientRect;
        pt.x := 0;
        pt.y := 0;
        pt := ClientToScreen(pt);
        cursorRect^.Left := cursorRect^.Left + pt.x;
        cursorRect^.Right := cursorRect^.Right + pt.x;
        cursorRect^.Top := cursorRect^.Top + pt.y;
        cursorRect^.Bottom := cursorRect^.Bottom + pt.y;
        ClipCursor(cursorRect);
        Dispose(cursorRect);
        FCaptureMouse := True;
      end;
      FOrgPoint := FCurrentPoint;
      FWorldOrgPoint := FWorldCurrentPoint;
      FBeforeCurrentpoint := FCurrentPoint;
      FWorldBeforeCurrentpoint := FWorldCurrentPoint;
      FMeasureData.Add(FWorldCurrentPoint);
      Measure.AddPoint(Projection.XY2LoLa(DrawCood.ConvertWP(FCurrentPoint)));
      distance := Measure.GetDistance;
      totalDistance := totalDistance + distance;
      FBrowseCapture := True;
    end;
    if (AMouseState = msMove) and FBrowseCapture then
    begin
      GraphDraw.DrawLine(Canvas, DrawCood.ConvertSP(FMeasureData.GetData(
        FMeasureData.Count - 1)), DrawCood.ConvertSP(FWorldBeforeCurrentpoint),
        pmNotXor, psSolid, 1, clBlack);
      GraphDraw.DrawLine(Canvas, DrawCood.ConvertSP(FMeasureData.GetData(
        FMeasureData.Count - 1)), DrawCood.ConvertSP(FWorldCurrentpoint),
        pmNotXor, psSolid, 1, clBlack);
      FBeforeCurrentpoint := FCurrentPoint;
      FWorldBeforeCurrentpoint := FWorldCurrentPoint;
      totalDistance := Measure.GetDistance(
        Projection.XY2LoLa(DrawCood.ConvertWP(
        FCurrentPoint)));
      distance := totalDistance - Measure.GetDistance;
      if FCurrentPoint.x = 0 then
      begin
        FTotalXPixel := FTotalXPixel + FMoveOffsetValue;
        Move(FTotalXPixel, FTotalYPixel, +FMoveOffsetValue, 0);
      end;
      if FCurrentPoint.x = (Width - 1) then
      begin
        FTotalXPixel := FTotalXPixel - FMoveOffsetValue;
        Move(FTotalXPixel, FTotalYPixel, -FMoveOffsetValue, 0);
      end;
      if FCurrentPoint.y = 0 then
      begin
        FTotalYPixel := FTotalYPixel + FMoveOffsetValue;
        Move(FTotalXPixel, FTotalYPixel, 0, +FMoveOffsetValue);
      end;
      if FCurrentPoint.y = (Height - 1) then
      begin
        FTotalYPixel := FTotalYPixel - FMoveOffsetValue;
        Move(FTotalXPixel, FTotalYPixel, 0, -FMoveOffsetValue);
      end;
      if ((Abs(FTotalXPixel) + FMoveOffsetValue) >= Width) or
        ((Abs(FTotalYPixel) + FMoveOffsetValue) >= Height) then
      begin
        RefreshScreenBitmap;
        FTotalXPixel := 0;
        FTotalYPixel := 0;
      end;
    end;
    if (AMouseState = msDown) and (ssDouble in FCurrentShiftState) and FBrowseCapture then
    begin
      distance := 0;
      totalDistance := Measure.GetDistance;
      totalArea := Measure.GetArea;
      measureFlag := 1;
      FMeasureData.Clear;
      FBrowseCapture := False;
      paint;
      ClipCursor(nil);
      FCaptureMouse := False;
      RefreshScreenBitmap;
      FTotalXPixel := 0;
      FTotalYPixel := 0;
    end;
    if (AMouseState = msMove) and (not FBrowseCapture) then Exit;
    DoMeasure(distance, totalDistance, totalArea, measureFlag);
  except on E: Exception do
      elog.SystemLog.AddLog(' TActionMap.BrowseMeasure ', e.Message);
  end;
end;

procedure TActionMap.BrowseMouseDown(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  try
    FCurrentPoint.x := X;
    FCurrentPoint.y := Y;
    FWorldCurrentPoint := DrawCood.ConvertWP(FCurrentPoint);
    case MouseAction of
      actMove: BrowseMove(msDown);
      actZoomIn: BrowseZoomIn(msDown);
      actZoomOut: BrowseZoomOut(msDown);
      actPointSelect: BrowsePointSelect(msDown);
      actRectSelect, actRectSelect_CR: BrowseRectSelect(msDown);
      actCycleSelect, actCycleSelect_CR: BrowseCycleSelect(msDown);
      actCheckEntityInfo: BrowseCheckEntityInfo(msDown);
      actMeasure: BrowseMeasure(msDown);
      actSetConfineAlarmArea: BrowseSetConfineAlarmArea(msDown); //sha 20050222
      actSetConfineAlarmCircle: BrowseSetConfineAlarmCircle(msDown); //sha 20081209
      actSetConfineAlarmPolygon: BrowseSetConfineAlarmNoSybol(msDown); // ������ͼ��
      actSetRunWay: BrowseSetRunWay(msDown); //sha 20060815 ������ʻ·��
      actUserDefinedText: BrowseUserDefinedText(msDown);
      actSetFactory: BrowseSetFactory(msDown);
      actSetFactoryPolygon:BrowseSetFactoryPolygon(msDown); //��������-�����
      actSeekCar: BrowseSeekCar(msDown);

      actCarDistance: BrowseSetCarDistance(msDown);
      actStationManage: BrowseSetStationMemo(msDown);
      actSetConfineAlarmrectangle: BrowseSetConfineAlarmrectangle(msDown);

      actFindThing: FindThing(msDown);
    end;
  except on E: Exception do
      elog.SystemLog.AddLog(' TActionMap.BrowseMouseDown ', e.Message);
  end;
end;



procedure TActionMap.BrowseMouseMove(Shift: TShiftState; X, Y: Integer);
begin
  try
    FCurrentPoint.x := X;
    FCurrentPoint.y := Y;
    FWorldCurrentPoint := DrawCood.ConvertWP(FCurrentPoint);
    case MouseAction of
      actMove: BrowseMove(msMove);
      actZoomIn: BrowseZoomIn(msMove);
      actZoomOut: BrowseZoomOut(msMove);
      actPointSelect: BrowsePointSelect(msMove);
      actRectSelect, actRectSelect_CR: BrowseRectSelect(msMove);
      actCycleSelect, actCycleSelect_CR: BrowseCycleSelect(msMove);
      actMeasure: BrowseMeasure(msMove);
      actSetConfineAlarmArea: BrowseSetConfineAlarmArea(msMove); //sha 20050222
      actSetConfineAlarmCircle: BrowseSetConfineAlarmCircle(msMove); //sha 20081209
      actSetConfineAlarmPolygon: BrowseSetConfineAlarmNoSybol(msMove);
      actSetRunWay: BrowseSetRunWay(msMove); //sha 20060815 ������ʻ·��
      actSeekCar: BrowseSeekCar(msMove);
      actSetConfineAlarmrectangle: BrowseSetConfineAlarmrectangle(msMove);
      actSetFactory : BrowseSetFactory(msMove);          //��������-Բ��
      actSetFactoryPolygon:BrowseSetFactoryPolygon(msmove); //��������-�����

      actFindThing: FindThing(msMove);
    end;
  except on E: Exception do
      elog.SystemLog.AddLog(' TActionMap.BrowseMouseMove ', e.Message);
  end;
end;

procedure TActionMap.BrowseMouseUp(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  try
    FCurrentPoint.x := X;
    FCurrentPoint.y := Y;
    FWorldCurrentPoint := DrawCood.ConvertWP(FCurrentPoint);
    case MouseAction of
      actMove: BrowseMove(msUp);
      actZoomIn: BrowseZoomIn(msUp);
      actZoomOut: BrowseZoomOut(msUp);
      actPointSelect: BrowsePointSelect(msUp);
      actRectSelect, actRectSelect_CR: BrowseRectSelect(msUp);
      actCycleSelect, actCycleSelect_CR: BrowseCycleSelect(msUp);
      actSetConfineAlarmArea: BrowseSetConfineAlarmArea(msUp); //sha 20050222
      actSetConfineAlarmCircle: BrowseSetConfineAlarmCircle(msUp); //sha 20081209
      actSetConfineAlarmPolygon: BrowseSetConfineAlarmNoSybol(msup);
      actSetRunWay: BrowseSetRunWay(msUp); //sha 20060815 ������ʻ·��
      actSeekCar: BrowseSeekCar(msUp);
      actSetConfineAlarmrectangle: BrowseSetConfineAlarmrectangle(msUp);
      actSetFactory : BrowseSetFactory(msUp);      //��������-Բ��
      actSetFactoryPolygon:BrowseSetFactoryPolygon(msUp); //��������-�����

      actFindThing: FindThing(msUp);
    end;
  except on E: Exception do
      elog.SystemLog.AddLog(' TActionMap.BrowseMouseUp ', e.Message);
  end;
end;

procedure TActionMap.BrowseMove(AMouseState: TMouseState);
{var
  OffsetX:Integer;
  OffsetY:Integer;}
begin
  try
{ ƫ����С��5����ʱ���ػ� }
    if AMouseState = msdown then
    begin
      FOrgPoint := FCurrentPoint;
      FBeforeCurrentpoint := FCurrentPoint;
      FBrowseCapture := True;
      FCaptureMouse := True;   
      Option := Option - [mpAllowDraw];  
      Self.Cursor := crMoveHandCursor;
    end;
    if (AMouseState = msMove) and FBrowseCapture and (ssLeft in FCurrentShiftState) then //dxf 2007-07-12 ֻ��������ȥ�ƶ���Ҫmove����ʱ��move���Ƕ����.
    begin
      move(FCurrentPoint.x - FOrgPoint.x, FCurrentPoint.y - FOrgPoint.y,
        FCurrentPoint.x - FBeforeCurrentpoint.x, FCurrentPoint.y - FBeforeCurrentpoint.y);
      FBeforeCurrentpoint := FCurrentPoint;
    end;
    if (AMouseState = msUp) and FBrowseCapture then
    begin
   // OffsetX:=FDrawCood.ConvertWP(FCurrentPoint).x-FDrawCood.ConvertWP(FOrgPoint).x;
  //  OffsetY:=FDrawCood.ConvertWP(FCurrentPoint).y-FDrawCood.ConvertWP(FOrgPoint).y;
      Option := Option + [mpAllowDraw];
      {if (Abs(FCurrentPoint.x - FOrgPoint.x) > 5) or
        (Abs(FCurrentPoint.y - FOrgPoint.y) > 5) then
      begin }
     // if FStartUndoPos = FEndUndoPos then
     //   SaveCurrentPos;
     // Screen.Cursor := crAniNormalBusy;
    //  FDrawCood.Offset(OffsetX,OffsetY);
    //  draw;
    //  SaveCurrentPos;
        refreshScreenBitmap;
      {end;}
      FBrowseCapture := False;
      FCaptureMouse := False;
      Screen.Cursor := 0;

    end;
  except on E: Exception do
      elog.SystemLog.AddLog(' TActionMap.BrowseMove ', e.Message);
  end;
end;

procedure TActionMap.BrowsePointSelect(AMouseState: TMouseState);
var
  sMeta: TMetaStruct;
begin
  try
    if (AMouseState = msDown) and (ssLeft in FCurrentShiftState) then
    begin
      sMeta._Type := _Symbol;
      sMeta.Symbol.Position := FWorldCurrentPoint;
      SelectSourceMeta := sMeta;
      if SelectMeta then
      begin
        FDisablePopupMetaInfo := True;
        ChangeSelectedMeta;
        FDisablePopupMetaInfo := False;
      end;
    end;
    if (AMouseState = msDown) and (ssDouble in FCurrentShiftState) then
    begin
      ChangeSelectedMeta;
    end;
  except on E: Exception do
      elog.SystemLog.AddLog(' TActionMap.BrowsePointSelect ', e.Message);
  end;
end;

procedure TActionMap.BrowsePolygonSelect(AMouseState: TMouseState);
{var
  cursorRect: PRect;
  pt: TPoint;
//  i: integer;
  pointCnt: integer;
  sMeta: TMetaStruct;     }
begin
 { try
  /////////////�����     05.6.21
    if (AMouseState = msDown) then
    begin
      if (ssDouble in FCurrentShiftState) and (length(FWorldPointArray) >= 2) and (ssLeft in FCurrentShiftState) then
      begin
        FOrgPoint := FCurrentPoint;
        FWorldOrgPoint := DrawCood.ConvertWP(FOrgPoint);
        FBeforeCurrentpoint := FCurrentPoint;
        FBrowseCapture := True;
        FCaptureMouse := True;
        AllowPaint := False;
      end;
    if (AMouseState = msMove) and FBrowseCapture then
    begin
      pointCnt := Length(FWorldPointArray);
      GraphDraw.DrawLine(Canvas, DrawCood.ConvertSP(FWorldPointArray[pointCnt - 1]),
        DrawCood.ConvertSP(FWorldBeforeCurrentpoint),
        pmNotXor, psSolid, 1, clBlack);
      GraphDraw.DrawLine(Canvas, DrawCood.ConvertSP(FWorldPointArray[pointCnt - 1]),
        DrawCood.ConvertSP(FWorldCurrentpoint),
        pmNotXor, psSolid, 1, clBlack);

      FBeforeCurrentpoint := FCurrentPoint;
      FWorldBeforeCurrentpoint := FWorldCurrentPoint;
      if FCurrentPoint.x = 0 then
      begin
        FTotalXPixel := FTotalXPixel + FMoveOffsetValue;
        Move(FTotalXPixel, FTotalYPixel, +FMoveOffsetValue, 0);
      end;
      if FCurrentPoint.x = (Width - 1) then
      begin
        FTotalXPixel := FTotalXPixel - FMoveOffsetValue;
        Move(FTotalXPixel, FTotalYPixel, -FMoveOffsetValue, 0);
      end;
      if FCurrentPoint.y = 0 then
      begin
        FTotalYPixel := FTotalYPixel + FMoveOffsetValue;
        Move(FTotalXPixel, FTotalYPixel, 0, +FMoveOffsetValue);
      end;
      if FCurrentPoint.y = (Height - 1) then
      begin
        FTotalYPixel := FTotalYPixel - FMoveOffsetValue;
        Move(FTotalXPixel, FTotalYPixel, 0, -FMoveOffsetValue);
      end;
      if ((Abs(FTotalXPixel) + FMoveOffsetValue) >= Width) or
        ((Abs(FTotalYPixel) + FMoveOffsetValue) >= Height) then
      begin
        FTotalXPixel := 0;
        FTotalYPixel := 0;
      end;
    end;

    if (AMouseState = msUp) and FBrowseCapture then
    begin
      GraphDraw.DrawRectAngle(Canvas, FOrgPoint, FBeforeCurrentpoint,
        pmNotXor, psDot, 1);
      sMeta._Type := _Symbol;
      //sMeta.Symbol.Position
      with sMeta.Outbox do
      begin
        Xmin := min(FWorldOrgPoint.x, FWorldCurrentPoint.x);
        Xmax := max(FWorldOrgPoint.x, FWorldCurrentPoint.x);
        ymin := min(FWorldOrgPoint.y, FWorldCurrentPoint.y);
        ymax := max(FWorldOrgPoint.y, FWorldCurrentPoint.y);
      end;
      SelectSourceMeta := sMeta;
      AllowPaint := True;
      if SelectMeta then
      begin
        FDisablePopupMetaInfo := True;
        ChangeSelectedMeta;
        FDisablePopupMetaInfo := False;
        DoRectSelectMeta(Projection.XY2LoLa(DrawCood.ConvertWP(FOrgPoint)),
          Projection.XY2LoLa(DrawCood.ConvertWP(FBeforeCurrentpoint)));
      end;
      FCurrentUndoDescribe := '��ѡ';
      Screen.Cursor := crDefault;
      FBrowseCapture := False;
      FCaptureMouse := False;
    end;
  except on E: Exception do
      elog.SystemLog.AddLog(' TActionMap.BrowseSetConfineAlarmArea ', e.Message);
  end;        }
end;

procedure TActionMap.BrowseRectSelect(AMouseState: TMouseState);
var sMeta: TMetaStruct;
begin
  try
    if (AMouseState = msDown) and (ssLeft in FCurrentShiftState) then
    begin
      FOrgPoint := FCurrentPoint;
      FWorldOrgPoint := DrawCood.ConvertWP(FOrgPoint);
      FBeforeCurrentpoint := FCurrentPoint;
      FBrowseCapture := True;
      FCaptureMouse := True;
      AllowPaint := False;
    end;
    if (AMouseState = msMove) and FBrowseCapture then
    begin
      GraphDraw.DrawRectAngle(Canvas, FOrgPoint, FBeforeCurrentpoint,
        pmNotXor, psDot, 1);
      GraphDraw.DrawRectAngle(Canvas, FOrgPoint, FCurrentPoint,
        pmNotXor, psDot, 1);
      FBeforeCurrentpoint := FCurrentPoint;
    end;
    if (AMouseState = msUp) and FBrowseCapture then
    begin
      GraphDraw.DrawRectAngle(Canvas, FOrgPoint, FBeforeCurrentpoint,
        pmNotXor, psDot, 1);
      sMeta._Type := _Rect;
      with sMeta.Outbox do
      begin
        Xmin := min(FWorldOrgPoint.x, FWorldCurrentPoint.x);
        Xmax := max(FWorldOrgPoint.x, FWorldCurrentPoint.x);
        ymin := min(FWorldOrgPoint.y, FWorldCurrentPoint.y);
        ymax := max(FWorldOrgPoint.y, FWorldCurrentPoint.y);
      end;
      SelectSourceMeta := sMeta;
      AllowPaint := True;
      if SelectMeta then
      begin
        FDisablePopupMetaInfo := True;
        ChangeSelectedMeta;
        FDisablePopupMetaInfo := False;
        DoRectSelectMeta(Projection.XY2LoLa(DrawCood.ConvertWP(FOrgPoint)),
          Projection.XY2LoLa(DrawCood.ConvertWP(FBeforeCurrentpoint)));
      end;
      FCurrentUndoDescribe := '��ѡ';
      Screen.Cursor := crDefault;
      FBrowseCapture := False;
      FCaptureMouse := False;
    end;
  except on E: Exception do
      elog.SystemLog.AddLog(' TActionMap.BrowseRectSelect ', e.Message);
  end;
end;

procedure TActionMap.BrowseRectSelectPolygon(AMouseState: TMouseState); //�����ѡ���� ls 20091230
var
  cursorRect: PRect;
  pt: TPoint;
//  i: integer;
  pointCnt: integer;
  sMeta: TMetaStruct;
begin
  try
  /////////////�����     05.6.21
    if (AMouseState = msDown) then
    begin
      if (ssDouble in FCurrentShiftState) and FBrowseCapture and (length(FWorldPointArray) >= 2) then
      begin
      //˫��ʱ������2�㣬�� �׳�
        ClipCursor(nil);
        AllowPaint := True;
        FMeasureData.Clear;
        FBrowseCapture := False;
        FCaptureMouse := False;
        DoRectSelectMeta(Projection.XY2LoLa(DrawCood.ConvertWP(FOrgPoint)),
          Projection.XY2LoLa(DrawCood.ConvertWP(FBeforeCurrentpoint)));
        //DoSetConfineAlarmArea(FWorldPointArray, length(FWorldPointArray));
        SetLength(FWorldPointArray, 0);

        RefreshScreenBitmap;
        FTotalXPixel := 0;
        FTotalYPixel := 0;
        Exit;
      end;
      if ssLeft in FCurrentShiftState then
      begin
        if not FBrowseCapture then
        begin
          SetLength(FWorldPointArray, 1);
          pointCnt := 1;
        //��ʱ ��������
        //AllowPaint:=False;
        //���������ƶ���Χ
          New(cursorRect);
          cursorRect^ := GetClientRect;
          pt.x := 0;
          pt.y := 0;
          pt := ClientToScreen(pt);
          cursorRect^.Left := cursorRect^.Left + pt.x;
          cursorRect^.Right := cursorRect^.Right + pt.x;
          cursorRect^.Top := cursorRect^.Top + pt.y;
          cursorRect^.Bottom := cursorRect^.Bottom + pt.y;
          ClipCursor(cursorRect);
          Dispose(cursorRect);
          FCaptureMouse := True;
        end
        else
        begin
          pointCnt := Length(FWorldPointArray);
          pointCnt := pointCnt + 1;
          setLength(FWorldPointArray, pointCnt);
        end;
        FWorldPointArray[pointCnt - 1] := FWorldCurrentPoint;
        FBeforeCurrentpoint := FCurrentPoint;
        FWorldBeforeCurrentpoint := FWorldCurrentPoint;
      //������뵽 FMeasureData�У�������Ƴ������ػ�ʱ����DoPaint�е���DrawMeasurePath�ٻ���ǰ�����������
        FMeasureData.Add(FWorldCurrentPoint);
        FBrowseCapture := True;
      end;
    end;
    if (AMouseState = msMove) and FBrowseCapture then
    begin
      pointCnt := Length(FWorldPointArray);
      GraphDraw.DrawLine(Canvas, DrawCood.ConvertSP(FWorldPointArray[pointCnt - 1]),
        DrawCood.ConvertSP(FWorldBeforeCurrentpoint),
        pmNotXor, psSolid, 1, clBlack);
      GraphDraw.DrawLine(Canvas, DrawCood.ConvertSP(FWorldPointArray[pointCnt - 1]),
        DrawCood.ConvertSP(FWorldCurrentpoint),
        pmNotXor, psSolid, 1, clBlack);

      FBeforeCurrentpoint := FCurrentPoint;
      FWorldBeforeCurrentpoint := FWorldCurrentPoint;
      if FCurrentPoint.x = 0 then
      begin
        FTotalXPixel := FTotalXPixel + FMoveOffsetValue;
        Move(FTotalXPixel, FTotalYPixel, +FMoveOffsetValue, 0);
      end;
      if FCurrentPoint.x = (Width - 1) then
      begin
        FTotalXPixel := FTotalXPixel - FMoveOffsetValue;
        Move(FTotalXPixel, FTotalYPixel, -FMoveOffsetValue, 0);
      end;
      if FCurrentPoint.y = 0 then
      begin
        FTotalYPixel := FTotalYPixel + FMoveOffsetValue;
        Move(FTotalXPixel, FTotalYPixel, 0, +FMoveOffsetValue);
      end;
      if FCurrentPoint.y = (Height - 1) then
      begin
        FTotalYPixel := FTotalYPixel - FMoveOffsetValue;
        Move(FTotalXPixel, FTotalYPixel, 0, -FMoveOffsetValue);
      end;
      if ((Abs(FTotalXPixel) + FMoveOffsetValue) >= Width) or
        ((Abs(FTotalYPixel) + FMoveOffsetValue) >= Height) then
      begin
        RefreshScreenBitmap;
        FTotalXPixel := 0;
        FTotalYPixel := 0;
      end;
    end;

    if (AMouseState = msMove) and (not FBrowseCapture) then Exit;
  except on E: Exception do
      elog.SystemLog.AddLog(' TActionMap.BrowseSetConfineAlarmArea ', e.Message);
  end;
end;

procedure TActionMap.BrowseUserDefinedText(AMouseState: TMouseState);
var
  EPoint: TEarthPoint;
begin
  try
    if (AMouseState = msDown) then
    begin
      if ssLeft in FCurrentShiftState then
      begin
        if Assigned(FOnUserDefinedText) then
        begin
          XYToLoLa(FCurrentPoint.X, FCurrentPoint.Y, EPoint.X, EPoint.Y);
          FOnUserDefinedText(Self, EPoint, FWorldCurrentPoint);
        end;
      end;
    end;
  except on E: Exception do
      elog.SystemLog.AddLog(' TActionMap.BrowseUserDefinedText ', e.Message);
  end;
end;



procedure TActionMap.BrowseSetFactory(AMouseState: TMouseState);
//����Ļ�������������
  function GetDistance(P1, P2: TPoint): Integer;
  var
    d: double;
  begin
    d := Sqrt(power(p1.X - p2.X, 2) + power(p1.Y - p2.Y, 2));
    Result := Round(d);
  end;

  function GetEDistance(P1, P2: TPoint): Integer;
  var
    pw1, pw2: TEarthPoint;
  begin
    pw1 := Projection.XY2LoLa(DrawCood.ConvertWP(p1));
    pw2 := Projection.XY2LoLa(DrawCood.ConvertWP(p2));
    Result := Round(GisMeasure.GetGisDistance(pw1, pw2));
  end;
var
  radius: Integer;
begin
  try
    if (AMouseState = msDown) and (ssLeft in FCurrentShiftState) then
    begin
      FOrgPoint := FCurrentPoint;
      FWorldOrgPoint := DrawCood.ConvertWP(FOrgPoint);
      FBeforeCurrentpoint := FCurrentPoint;
      FBrowseCapture := True;
      FCaptureMouse := True;
      AllowPaint := False;
    end;
    if (AMouseState = msMove) and FBrowseCapture then
    begin
      radius := GetDistance(FOrgPoint, FBeforeCurrentpoint);
      GraphDraw.DrawCircle(Canvas, FOrgPoint, radius, pmNotXor, psDot, 1);
      //GraphDraw.DrawText(Canvas,FBeforeCurrentpoint,IntToStr(GetEDistance(FOrgPoint, FBeforeCurrentpoint))+'��',pmNotXor, psSolid, 1);

      radius := GetDistance(FOrgPoint, FCurrentPoint);
      GraphDraw.DrawCircle(Canvas, FOrgPoint, radius, pmNotXor, psDot, 1);
      Canvas.TextOut(FOrgPoint.X,FOrgPoint.Y,IntToStr(GetEDistance(FOrgPoint, FCurrentPoint))+'��');
      //GraphDraw.DrawText(Canvas,FCurrentPoint,IntToStr(GetEDistance(FOrgPoint, FCurrentPoint))+'��',pmNotXor, psSolid, 1);
      FBeforeCurrentpoint := FCurrentPoint;
    end;
    if (AMouseState = msUp) and FBrowseCapture then
    begin
      radius := GetDistance(FOrgPoint, FBeforeCurrentpoint);
      GraphDraw.DrawCircle(Canvas, FOrgPoint, radius, pmNotXor, psDot, 1);
      FCurrentUndoDescribe := '����������';
      Screen.Cursor := crDefault;
      AllowPaint := True;
      FBrowseCapture := False;
      FCaptureMouse := False;
      if Assigned(FOnUserSetFactory) then //�׳� �е�ľ�γ��(��������)���뾶(��)��Բ����һ��ľ�γ��(��������)
         FOnUserSetFactory(self, Projection.XY2LoLa(DrawCood.ConvertWP(FOrgPoint)), GetEDistance(FOrgPoint, FBeforeCurrentpoint),Projection.XY2LoLa(DrawCood.ConvertWP(FBeforeCurrentpoint)));
    end;
  except on E: Exception do
      elog.SystemLog.AddLog(' TActionMap.BrowseSetFactory ', e.Message);
  end; 
end;

procedure TActionMap.BrowseSetFactoryPolygon(AMouseState: TMouseState);
var
  cursorRect: PRect;
  pt: TPoint;
  pointCnt: integer;
begin
  try
    if (AMouseState = msDown) then
    begin
      if (ssDouble in FCurrentShiftState) and FBrowseCapture and (length(FWorldPointArray) >= 2) then
      begin
        ClipCursor(nil);
        AllowPaint := True;
        FMeasureData.Clear;
        FBrowseCapture := False;
        FCaptureMouse := False;
        if Assigned(FOnUserSetFactoryPolygon) then
          FOnUserSetFactoryPolygon(nil,FWorldPointArray, length(FWorldPointArray));
        SetLength(FWorldPointArray, 0);                                        
        RefreshScreenBitmap;
        FTotalXPixel := 0;
        FTotalYPixel := 0;
        Exit;
      end;
      if ssLeft in FCurrentShiftState then
      begin
        if not FBrowseCapture then
        begin
          SetLength(FWorldPointArray, 1);
          pointCnt := 1;
        //��ʱ ��������
        //AllowPaint:=False;
        //���������ƶ���Χ
          New(cursorRect);
          cursorRect^ := GetClientRect;
          pt.x := 0;
          pt.y := 0;
          pt := ClientToScreen(pt);
          cursorRect^.Left := cursorRect^.Left + pt.x;
          cursorRect^.Right := cursorRect^.Right + pt.x;
          cursorRect^.Top := cursorRect^.Top + pt.y;
          cursorRect^.Bottom := cursorRect^.Bottom + pt.y;
          ClipCursor(cursorRect);
          Dispose(cursorRect);
          FCaptureMouse := True;
        end
        else
        begin
          pointCnt := Length(FWorldPointArray);
          pointCnt := pointCnt + 1;
          setLength(FWorldPointArray, pointCnt);
        end;
        FWorldPointArray[pointCnt - 1] := FWorldCurrentPoint;
        FBeforeCurrentpoint := FCurrentPoint;
        FWorldBeforeCurrentpoint := FWorldCurrentPoint;
      //������뵽 FMeasureData�У�������Ƴ������ػ�ʱ����DoPaint�е���DrawMeasurePath�ٻ���ǰ�����������
        FMeasureData.Add(FWorldCurrentPoint);
        FBrowseCapture := True;
      end;
    end;
    if (AMouseState = msMove) and FBrowseCapture then
    begin
      pointCnt := Length(FWorldPointArray);
      GraphDraw.DrawLine(Canvas, DrawCood.ConvertSP(FWorldPointArray[pointCnt - 1]),
        DrawCood.ConvertSP(FWorldBeforeCurrentpoint),
        pmNotXor, psSolid, 1, clBlack);
      GraphDraw.DrawLine(Canvas, DrawCood.ConvertSP(FWorldPointArray[pointCnt - 1]),
        DrawCood.ConvertSP(FWorldCurrentpoint),
        pmNotXor, psSolid, 1, clBlack);
    {Ŀǰ�������⣺Ҫ�ǻ����ߣ���������Ƴ������ػ�ʱ����໭��һ������}
     { GraphDraw.DrawLine(Canvas,DrawCood.ConvertSP(FWorldPointArray[0]),
        DrawCood.ConvertSP(FWorldBeforeCurrentpoint),
        pmNotXor,psDot,1,clBlack);
      GraphDraw.DrawLine(Canvas,DrawCood.ConvertSP(FWorldPointArray[0]),
        DrawCood.ConvertSP(FWorldCurrentpoint),
        pmNotXor,psDot,1,clBlack);  }
      FBeforeCurrentpoint := FCurrentPoint;
      FWorldBeforeCurrentpoint := FWorldCurrentPoint;
      if FCurrentPoint.x = 0 then
      begin
        FTotalXPixel := FTotalXPixel + FMoveOffsetValue;
        Move(FTotalXPixel, FTotalYPixel, +FMoveOffsetValue, 0);
      end;
      if FCurrentPoint.x = (Width - 1) then
      begin
        FTotalXPixel := FTotalXPixel - FMoveOffsetValue;
        Move(FTotalXPixel, FTotalYPixel, -FMoveOffsetValue, 0);
      end;
      if FCurrentPoint.y = 0 then
      begin
        FTotalYPixel := FTotalYPixel + FMoveOffsetValue;
        Move(FTotalXPixel, FTotalYPixel, 0, +FMoveOffsetValue);
      end;
      if FCurrentPoint.y = (Height - 1) then
      begin
        FTotalYPixel := FTotalYPixel - FMoveOffsetValue;
        Move(FTotalXPixel, FTotalYPixel, 0, -FMoveOffsetValue);
      end;
      if ((Abs(FTotalXPixel) + FMoveOffsetValue) >= Width) or
        ((Abs(FTotalYPixel) + FMoveOffsetValue) >= Height) then
      begin
        RefreshScreenBitmap;
        FTotalXPixel := 0;
        FTotalYPixel := 0;
      end;
    end;

    if (AMouseState = msMove) and (not FBrowseCapture) then Exit;
  except on E: Exception do
      elog.SystemLog.AddLog(' TActionMap.BrowseSetConfineAlarmArea ', e.Message);
  end;
end;


procedure TActionMap.BrowseSetConfineAlarmArea(AMouseState: TMouseState); //����Խ�籨�� sha.20050222
var
  cursorRect: PRect;
  pt: TPoint;
//  i: integer;
  pointCnt: integer;
begin
  try
  /////////////�����     05.6.21
    if (AMouseState = msDown) then
    begin
      if (ssDouble in FCurrentShiftState) and FBrowseCapture and (length(FWorldPointArray) >= 2) then
      begin
      //˫��ʱ������2�㣬�� �׳�
        ClipCursor(nil);
        AllowPaint := True;
        FMeasureData.Clear;
        FBrowseCapture := False;
        FCaptureMouse := False;

        DoSetConfineAlarmArea(FWorldPointArray, length(FWorldPointArray));
        SetLength(FWorldPointArray, 0);

        RefreshScreenBitmap;
        FTotalXPixel := 0;
        FTotalYPixel := 0;
        Exit;
      end;
      if ssLeft in FCurrentShiftState then
      begin
        if not FBrowseCapture then
        begin
          SetLength(FWorldPointArray, 1);
          pointCnt := 1;
        //��ʱ ��������
        //AllowPaint:=False;
        //���������ƶ���Χ
          New(cursorRect);
          cursorRect^ := GetClientRect;
          pt.x := 0;
          pt.y := 0;
          pt := ClientToScreen(pt);
          cursorRect^.Left := cursorRect^.Left + pt.x;
          cursorRect^.Right := cursorRect^.Right + pt.x;
          cursorRect^.Top := cursorRect^.Top + pt.y;
          cursorRect^.Bottom := cursorRect^.Bottom + pt.y;
          ClipCursor(cursorRect);
          Dispose(cursorRect);
          FCaptureMouse := True;
        end
        else
        begin
          pointCnt := Length(FWorldPointArray);
          pointCnt := pointCnt + 1;
          setLength(FWorldPointArray, pointCnt);
        end;
        FWorldPointArray[pointCnt - 1] := FWorldCurrentPoint;
        FBeforeCurrentpoint := FCurrentPoint;
        FWorldBeforeCurrentpoint := FWorldCurrentPoint;
      //������뵽 FMeasureData�У�������Ƴ������ػ�ʱ����DoPaint�е���DrawMeasurePath�ٻ���ǰ�����������
        FMeasureData.Add(FWorldCurrentPoint);
        FBrowseCapture := True;
      end;
    end;
    if (AMouseState = msMove) and FBrowseCapture then
    begin
      pointCnt := Length(FWorldPointArray);
      GraphDraw.DrawLine(Canvas, DrawCood.ConvertSP(FWorldPointArray[pointCnt - 1]),
        DrawCood.ConvertSP(FWorldBeforeCurrentpoint),
        pmNotXor, psSolid, 1, clBlack);
      GraphDraw.DrawLine(Canvas, DrawCood.ConvertSP(FWorldPointArray[pointCnt - 1]),
        DrawCood.ConvertSP(FWorldCurrentpoint),
        pmNotXor, psSolid, 1, clBlack);
    {Ŀǰ�������⣺Ҫ�ǻ����ߣ���������Ƴ������ػ�ʱ����໭��һ������}
     { GraphDraw.DrawLine(Canvas,DrawCood.ConvertSP(FWorldPointArray[0]),
        DrawCood.ConvertSP(FWorldBeforeCurrentpoint),
        pmNotXor,psDot,1,clBlack);
      GraphDraw.DrawLine(Canvas,DrawCood.ConvertSP(FWorldPointArray[0]),
        DrawCood.ConvertSP(FWorldCurrentpoint),
        pmNotXor,psDot,1,clBlack);  }
      FBeforeCurrentpoint := FCurrentPoint;
      FWorldBeforeCurrentpoint := FWorldCurrentPoint;
      if FCurrentPoint.x = 0 then
      begin
        FTotalXPixel := FTotalXPixel + FMoveOffsetValue;
        Move(FTotalXPixel, FTotalYPixel, +FMoveOffsetValue, 0);
      end;
      if FCurrentPoint.x = (Width - 1) then
      begin
        FTotalXPixel := FTotalXPixel - FMoveOffsetValue;
        Move(FTotalXPixel, FTotalYPixel, -FMoveOffsetValue, 0);
      end;
      if FCurrentPoint.y = 0 then
      begin
        FTotalYPixel := FTotalYPixel + FMoveOffsetValue;
        Move(FTotalXPixel, FTotalYPixel, 0, +FMoveOffsetValue);
      end;
      if FCurrentPoint.y = (Height - 1) then
      begin
        FTotalYPixel := FTotalYPixel - FMoveOffsetValue;
        Move(FTotalXPixel, FTotalYPixel, 0, -FMoveOffsetValue);
      end;
      if ((Abs(FTotalXPixel) + FMoveOffsetValue) >= Width) or
        ((Abs(FTotalYPixel) + FMoveOffsetValue) >= Height) then
      begin
        RefreshScreenBitmap;
        FTotalXPixel := 0;
        FTotalYPixel := 0;
      end;
    end;

    if (AMouseState = msMove) and (not FBrowseCapture) then Exit;
  except on E: Exception do
      elog.SystemLog.AddLog(' TActionMap.BrowseSetConfineAlarmArea ', e.Message);
  end;
end;
  {//����
  if (AMouseState=msDown) and (ssLeft in FCurrentShiftState) then
  begin
    FOrgPoint:=FCurrentPoint;
    FBeforeCurrentpoint:=FCurrentPoint;
    FBrowseCapture:=True;
    FCaptureMouse:=True;
    AllowPaint:=False;
  end;
  if (AMouseState=msMove) and FBrowseCapture then
  begin
    GraphDraw.DrawRectAngle(Canvas,FOrgPoint,FBeforeCurrentpoint,
      pmNotXor,psSolid,1);
    GraphDraw.DrawRectAngle(Canvas,FOrgPoint,FCurrentPoint,
      pmNotXor,psSolid,1);
    FBeforeCurrentpoint:=FCurrentPoint;
  end;
  if (AMouseState = msUp) and FBrowseCapture then
  begin
    GraphDraw.DrawRectAngle(Canvas,FOrgPoint,FBeforeCurrentpoint,
      pmMerge,psDot,1);
    Screen.Cursor := crGetEntifyInfo;
    FCurrentUndoDescribe:='������������';
    if (Abs(FCurrentPoint.x-FOrgPoint.x)>=MinZoomPixel)and
      (Abs(FCurrentPoint.y-FOrgPoint.y)>=MinZoomPixel) then
    begin
      DoSetConfineAlarmArea(FOrgPoint,FCurrentPoint);
      AllowPaint:=True;
      draw;
    end;
    Screen.Cursor:=crDefault;
    FBrowseCapture:=False;
    FCaptureMouse:=False;
  end;
end;      }

procedure TActionMap.BrowseSetRunWay(AMouseState: TMouseState); //������ʻ·�� sha 20060816
var
  cursorRect: PRect;
  pt: TPoint;
//  i: integer;
  pointCnt: integer;
begin
  /////////////�����     05.6.21
  try
    if (AMouseState = msDown) then
    begin
      if (ssDouble in FCurrentShiftState) and FBrowseCapture and (length(FWorldPointArray) >= 2) then
      begin
        //˫��ʱ������2�㣬�� �׳�
        ClipCursor(nil);
        AllowPaint := True;
        FMeasureData.Clear;
        FBrowseCapture := False;
        FCaptureMouse := False;

        //DoSetConfineAlarmArea(FWorldPointArray,length(FWorldPointArray));
        DoSetRunWay(FWorldPointArray, length(FWorldPointArray));
        SetLength(FWorldPointArray, 0);

        RefreshScreenBitmap;
        FTotalXPixel := 0;
        FTotalYPixel := 0;
        FIsLineSectionSet := True;
//        Exit;
      end;
      if (ssDouble in FCurrentShiftState) and (ssCtrl in FCurrentShiftState) and FIsLineSectionSet then//(length(FWorldPointArray) >= 2)
      begin
        //˫��ʱ������2�㣬�� �׳�
        ClipCursor(nil);
        AllowPaint := True;
        FMeasureData.Clear;
        FBrowseCapture := False;
        FCaptureMouse := False;

        //DoSetConfineAlarmArea(FWorldPointArray,length(FWorldPointArray));
        DoSetLineProperty();//DoSetRunWay(FWorldPointArray, length(FWorldPointArray), 1);
        SetLength(FWorldPointArray, 0);

        RefreshScreenBitmap;
        FTotalXPixel := 0;
        FTotalYPixel := 0;
        Exit;
      end;
      if (ssLeft in FCurrentShiftState) and not(ssDouble in FCurrentShiftState) then
      begin
        if not FBrowseCapture then
        begin
          SetLength(FWorldPointArray, 1);
          pointCnt := 1;
          //��ʱ ��������
          //AllowPaint:=False;
          //���������ƶ���Χ
          New(cursorRect);
          cursorRect^ := GetClientRect;
          pt.x := 0;
          pt.y := 0;
          pt := ClientToScreen(pt);
          cursorRect^.Left := cursorRect^.Left + pt.x;
          cursorRect^.Right := cursorRect^.Right + pt.x;
          cursorRect^.Top := cursorRect^.Top + pt.y;
          cursorRect^.Bottom := cursorRect^.Bottom + pt.y;
          ClipCursor(cursorRect);
          Dispose(cursorRect);
          FCaptureMouse := True;
        end
        else
        begin
          pointCnt := Length(FWorldPointArray);
          pointCnt := pointCnt + 1;
          setLength(FWorldPointArray, pointCnt);
        end;
        FWorldPointArray[pointCnt - 1] := FWorldCurrentPoint;
        FBeforeCurrentpoint := FCurrentPoint;
        FWorldBeforeCurrentpoint := FWorldCurrentPoint;
        //������뵽 FMeasureData�У�������Ƴ������ػ�ʱ����DoPaint�е���DrawMeasurePath�ٻ���ǰ�����������
        FMeasureData.Add(FWorldCurrentPoint);
        FBrowseCapture := True;
      end;
    end;
    if (AMouseState = msMove) and FBrowseCapture then
    begin
      pointCnt := Length(FWorldPointArray);
      GraphDraw.DrawLine(Canvas, DrawCood.ConvertSP(FWorldPointArray[pointCnt - 1]),
        DrawCood.ConvertSP(FWorldBeforeCurrentpoint),
        pmNotXor, psSolid, 1, clBlack);
      GraphDraw.DrawLine(Canvas, DrawCood.ConvertSP(FWorldPointArray[pointCnt - 1]),
        DrawCood.ConvertSP(FWorldCurrentpoint),
        pmNotXor, psSolid, 1, clBlack);
      {Ŀǰ�������⣺Ҫ�ǻ����ߣ���������Ƴ������ػ�ʱ����໭��һ������}
       { GraphDraw.DrawLine(Canvas,DrawCood.ConvertSP(FWorldPointArray[0]),
          DrawCood.ConvertSP(FWorldBeforeCurrentpoint),
          pmNotXor,psDot,1,clBlack);
        GraphDraw.DrawLine(Canvas,DrawCood.ConvertSP(FWorldPointArray[0]),
          DrawCood.ConvertSP(FWorldCurrentpoint),
          pmNotXor,psDot,1,clBlack);  }
      FBeforeCurrentpoint := FCurrentPoint;
      FWorldBeforeCurrentpoint := FWorldCurrentPoint;
      if FCurrentPoint.x = 0 then
      begin
        FTotalXPixel := FTotalXPixel + FMoveOffsetValue;
        Move(FTotalXPixel, FTotalYPixel, +FMoveOffsetValue, 0);
      end;
      if FCurrentPoint.x = (Width - 1) then
      begin
        FTotalXPixel := FTotalXPixel - FMoveOffsetValue;
        Move(FTotalXPixel, FTotalYPixel, -FMoveOffsetValue, 0);
      end;
      if FCurrentPoint.y = 0 then
      begin
        FTotalYPixel := FTotalYPixel + FMoveOffsetValue;
        Move(FTotalXPixel, FTotalYPixel, 0, +FMoveOffsetValue);
      end;
      if FCurrentPoint.y = (Height - 1) then
      begin
        FTotalYPixel := FTotalYPixel - FMoveOffsetValue;
        Move(FTotalXPixel, FTotalYPixel, 0, -FMoveOffsetValue);
      end;
      if ((Abs(FTotalXPixel) + FMoveOffsetValue) >= Width) or
        ((Abs(FTotalYPixel) + FMoveOffsetValue) >= Height) then
      begin
        RefreshScreenBitmap;
        FTotalXPixel := 0;
        FTotalYPixel := 0;
      end;
    end;

    if (AMouseState = msMove) and (not FBrowseCapture) then Exit;
  except on E: Exception do
     elog.SystemLog.AddLog(' TActionMap.BrowseSetConfineAlarmArea ', e.Message);
  end;
end;

{var
  cursorRect:PRect;
  pt:TPoint;
//  i: integer;
  pointCnt:integer;
begin
  /////////////�����     05.6.21
  if (AMouseState=msDown) then//������
  begin
    //������ʼ��˫������
    if (ssDouble in FCurrentShiftState) and FBrowseCapture and (length(FWorldPointArray) >=2) then
    begin
      //˫��ʱ������2�㣬�� �׳�
      ClipCursor(nil);
      AllowPaint:= True;
      FMeasureData.Clear;
      FBrowseCapture:=False;
      FCaptureMouse:=False;

      DoSetRunWay(FWorldPointArray,length(FWorldPointArray));
      SetLength(FWorldPointArray,0);

      RefreshScreenBitmap;
      FTotalXPixel:=0;
      FTotalYPixel:=0;
      Exit;
    end;
    if ssLeft in FCurrentShiftState then
    begin
      if not FBrowseCapture then
      begin
        SetLength(FWorldPointArray,1);
        pointCnt := 1;
        //��ʱ ��������
        //AllowPaint:=False;
        //���������ƶ���Χ
        New(cursorRect);
        cursorRect^:=GetClientRect;
        pt.x:=0;
        pt.y:=0;
        pt:=ClientToScreen(pt);
        cursorRect^.Left:=cursorRect^.Left+pt.x;
        cursorRect^.Right:=cursorRect^.Right+pt.x;
        cursorRect^.Top:=cursorRect^.Top+pt.y;
        cursorRect^.Bottom:=cursorRect^.Bottom+pt.y;
        //ClipCursor(cursorRect);
        //Dispose(cursorRect);
        FCaptureMouse:=True;
      end
      else
      begin
        pointCnt := Length(FWorldPointArray);
        pointCnt := pointCnt +1;
        setLength(FWorldPointArray,pointCnt);
      end;
      FWorldPointArray[pointCnt -1]:= FWorldCurrentPoint;
      FBeforeCurrentpoint:=FCurrentPoint;
      FWorldBeforeCurrentpoint:=FWorldCurrentPoint;
      //������뵽 FMeasureData�У�������Ƴ������ػ�ʱ����DoPaint�е���DrawMeasurePath�ٻ���ǰ�����������
      FMeasureData.Add(FWorldCurrentPoint);
      FBrowseCapture:=True;
    end;
  end;
  if (AMouseState=msMove) and FBrowseCapture then
  begin
    pointCnt := Length(FWorldPointArray);
    GraphDraw.DrawLine(Canvas,DrawCood.ConvertSP(FWorldPointArray[pointCnt-1]),
      DrawCood.ConvertSP(FWorldBeforeCurrentpoint),
      pmNotXor,psSolid,5,clBlack);
    GraphDraw.DrawLine(Canvas,DrawCood.ConvertSP(FWorldPointArray[pointCnt-1]),
      DrawCood.ConvertSP(FWorldCurrentpoint),
      pmNotXor,psSolid,5,clBlack);   }
    {Ŀǰ�������⣺Ҫ�ǻ����ߣ���������Ƴ������ػ�ʱ����໭��һ������}
     { GraphDraw.DrawLine(Canvas,DrawCood.ConvertSP(FWorldPointArray[0]),
        DrawCood.ConvertSP(FWorldBeforeCurrentpoint),
        pmNotXor,psDot,1,clBlack);
      GraphDraw.DrawLine(Canvas,DrawCood.ConvertSP(FWorldPointArray[0]),
        DrawCood.ConvertSP(FWorldCurrentpoint),
        pmNotXor,psDot,1,clBlack);  }
  {  FBeforeCurrentpoint:=FCurrentPoint;
    FWorldBeforeCurrentpoint:=FWorldCurrentPoint;
    if FCurrentPoint.x=0 then
    begin
      FTotalXPixel:=FTotalXPixel+FMoveOffsetValue;
      Move(FTotalXPixel,FTotalYPixel,+FMoveOffsetValue,0);
    end;
    if FCurrentPoint.x=(Width-1) then
    begin
      FTotalXPixel:=FTotalXPixel-FMoveOffsetValue;
      Move(FTotalXPixel,FTotalYPixel,-FMoveOffsetValue,0);
    end;
    if FCurrentPoint.y=0 then
    begin
      FTotalYPixel:=FTotalYPixel+FMoveOffsetValue;
      Move(FTotalXPixel,FTotalYPixel,0,+FMoveOffsetValue);
    end;
    if FCurrentPoint.y=(Height-1) then
    begin
      FTotalYPixel:=FTotalYPixel-FMoveOffsetValue;
      Move(FTotalXPixel,FTotalYPixel,0,-FMoveOffsetValue);
    end;
    if ((Abs(FTotalXPixel)+FMoveOffsetValue)>=Width)or
      ((Abs(FTotalYPixel)+FMoveOffsetValue)>=Height) then
    begin
      RefreshScreenBitmap;
      FTotalXPixel:=0;
      FTotalYPixel:=0;
    end;

    {
    GraphDraw.DrawLine(Canvas,DrawCood.ConvertSP(FMeasureData.GetData(
      FMeasureData.Count-1)),DrawCood.ConvertSP(FWorldBeforeCurrentpoint),
      pmNotXor,psSolid,1,clBlack);
    GraphDraw.DrawLine(Canvas,DrawCood.ConvertSP(FMeasureData.GetData(
      FMeasureData.Count-1)),DrawCood.ConvertSP(FWorldCurrentpoint),
      pmNotXor,psSolid,1,clBlack);

    pointCnt := Length(FWorldPointArray);
    pointCnt := pointCnt +1;
    setLength(FWorldPointArray,pointCnt);
    FWorldPointArray[pointCnt -1]:= FWorldCurrentPoint;
    FBeforeCurrentpoint:=FCurrentPoint;
    FWorldBeforeCurrentpoint:=FWorldCurrentPoint;
    //������뵽 FMeasureData�У�������Ƴ������ػ�ʱ����DoPaint�е���DrawMeasurePath�ٻ���ǰ�����������
    FMeasureData.Add(FWorldCurrentPoint); }

    //RefreshScreenBitmap;
 { end;

  if (AMouseState=msMove)and (not FBrowseCapture) then Exit;
end;   }


procedure TActionMap.BrowseZoomIn(AMouseState: TMouseState);
begin
  try
    if (AMouseState = msDown) and (ssLeft in FCurrentShiftState) then
    begin
      FOrgPoint := FCurrentPoint;
      FBeforeCurrentpoint := FCurrentPoint;
      FBrowseCapture := True;
      FCaptureMouse := True;
      AllowPaint := False;
    end;
    if (AMouseState = msMove) and FBrowseCapture then
    begin
      GraphDraw.DrawRectAngle(Canvas, FOrgPoint, FBeforeCurrentpoint,
        pmNotXor, psDot, 1);
      GraphDraw.DrawRectAngle(Canvas, FOrgPoint, FCurrentPoint,
        pmNotXor, psDot, 1);
      FBeforeCurrentpoint := FCurrentPoint;
    end;
    if (AMouseState = msUp) and FBrowseCapture then
    begin
      GraphDraw.DrawRectAngle(Canvas, FOrgPoint, FBeforeCurrentpoint,
        pmNotXor, psDot, 1);

      Self.Cursor := crZoomIn;
      FCurrentUndoDescribe := '�Ŵ��ͼ';

      if (Abs(FCurrentPoint.x - FOrgPoint.x) < MinZoomPixel) and
        (Abs(FCurrentPoint.y - FOrgPoint.y) < MinZoomPixel) then
        DrawCood.ZoomInAT(DrawCood.ConvertWP(FCurrentPoint))
      else
        DrawCood.ZoomInAsScreenRect(FOrgPoint, FCurrentPoint);
      AllowPaint := True;
      draw;
      Screen.Cursor := crDefault;
      FBrowseCapture := False;
      FCaptureMouse := False;
    end;
  except on E: Exception do
      elog.SystemLog.AddLog(' TActionMap.BrowseZoomIn ', e.Message);
  end;
end;

procedure TActionMap.BrowseZoomOut(AMouseState: TMouseState);
begin
  try
    if (AMouseState = msDown) and (ssLeft in FCurrentShiftState) then
    begin
      FOrgPoint := FCurrentPoint;
      FBeforeCurrentpoint := FCurrentPoint;
      FBrowseCapture := True;
      FCaptureMouse := True;
      AllowPaint := False;
    end;
    if (AMouseState = msMove) and FBrowseCapture then //����ƶ�,������
    begin
      GraphDraw.DrawRectAngle(Canvas, FOrgPoint, FBeforeCurrentpoint,
        pmNotXor, psDot, 1);
      GraphDraw.DrawRectAngle(Canvas, FOrgPoint, FCurrentPoint,
        pmNotXor, psDot, 1);
      FBeforeCurrentpoint := FCurrentPoint;
    end;
    if (AMouseState = msUp) and FBrowseCapture then
    begin
      GraphDraw.DrawRectAngle(Canvas, FOrgPoint, FBeforeCurrentpoint,
        pmNotXor, psDot, 1);
      Self.Cursor := crZoomOut; //�ı����ͼ��
      FCurrentUndoDescribe := '��С��ͼ';

      if (Abs(FCurrentPoint.x - FOrgPoint.x) < MinZoomPixel) and
        (Abs(FCurrentPoint.y - FOrgPoint.y) < MinZoomPixel) then
        DrawCood.ZoomOutAT(DrawCood.ConvertWP(FCurrentPoint))
      else
        DrawCood.ZoomOutAsScreenRect(FOrgPoint, FCurrentPoint);
      AllowPaint := True;
      draw;
      Screen.Cursor := crDefault;
      FBrowseCapture := False;
      FCaptureMouse := False;
    end;
  except on E: Exception do
      elog.SystemLog.AddLog(' TActionMap.BrowseZoomOut ', e.Message);
  end;
end;

procedure TActionMap.ChangeEntityMeta;
begin
  DoChangeEntityMeta;
  if Assigned(FOnMetaSelected) then
    FOnMetaSelected(Self);
end;

procedure TActionMap.ChangeSelectedMeta;
begin
  DoChangeSelectedMeta;
end;

procedure TActionMap.ClearSelectMetas;
var
  i: Integer;
begin
  if AllowOperate(actClearSelectedMeta, true) then
  begin
    for i := 0 to Layers.Count - 1 do
      Layers.Layers[i].SelectedMeta.Clear;
  end;
end;

procedure TActionMap.ClearSelectMetas(const ADrawLayerID: Longword);
var
  i: Integer;
begin
  if MouseAction < 100 then Exit;
  for i := 0 to Layers.Count - 1 do
  begin
    if Layers.Layers[i].ID = ADrawLayerID then
    begin
      Layers.Layers[i].SelectedMeta.Clear;
      Break;
    end;
  end;
end;

constructor TActionMap.Create(AOwner: TComponent; Provider: TLayerProvider);
begin
  inherited Create(AOwner, Provider);
  FBrowseUndoList := TBrowseUndoList.Create;
  FDisableUndoRecord := False;
  FDisablePopupMetaInfo := False;
  FMeasureData := TWorldPointList.Create;
  FMoveOffsetValue := 30;
  FCaptureMouse := False;
  FOperateState := _Browse;
//  self.OnKeyPress := KeyPress;
end;

destructor TActionMap.Destroy;
begin
  FBrowseUndoList.Free;
  FMeasureData.Free;
  inherited;
end;

procedure TActionMap.DoActionChanged;
var
  param: TGisParams;
begin
  param := TGisParams.Create;
  try
    DoMsgEvent(Self, EV_MAP_ACTION_CHANGED, param);
  finally
    param.Free;
  end;

  if Assigned(FOnActionChanged) then
    FOnActionChanged(Self);

  if Assigned(FOnMapActionChangedEvent) then
    FOnMapActionChangedEvent;
end;

procedure TActionMap.DoChangeEntityMeta;
begin

end;

procedure TActionMap.DoChangeSelectedMeta;
begin

end;

procedure TActionMap.DoDealMsgEvent(Sender: TObject; MsgID: Integer;
  Param: TGisParams);
begin
  inherited;
  case MsgID of
    EV_ADD_DRAWLAYER: DoLayersAfterChanged;
  end;
end;

procedure TActionMap.DoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  case Key of
//    190:MouseAction:=actPointSelect;//.
//    82:MouseAction:=actRectSelect;//r
//    84:MouseAction:=actRectSelect_CR;//t
//    67:MouseAction:=actCycleSelect;//c
//    86:MouseAction:=actCycleSelect_CR;//86
//    78:MouseAction:=actZoomIn;//n
//    79:MouseAction:=actZoomOut;//o
//    73:MouseAction:=actCheckEntityInfo;//i
//    77:MouseAction:=actMove;//m
//  end;
end;


procedure TActionMap.DoMeasure(const Distance, TotalDistance, Area: Double;
  const Flag: Integer);
begin
  if Assigned(FOnMeasure) then
    FOnMeasure(Self, Distance, TotalDistance, Area, Flag);
end;

procedure TActionMap.DoPaint;
begin
  inherited DoPaint;
  DrawMeasurePath;
end;

procedure TActionMap.DoSetConfineAlarmArea(WPointsAry: TWorldPointAry; PointsCnt: Integer); //sha
begin
  if Assigned(FOnSetConfineAlarmArea) then
    FOnSetConfineAlarmArea(Self, FWorldPointArray, PointsCnt);
end;

procedure TActionMap.DrawCoodWorldChanged(Sender: TObject;
  WorldRect: TWorldRect);
begin
  if not FDisableUndoRecord then
  begin
    FUndoData.Describe := FCurrentUndoDescribe;
    FUndoData.WorldRect := WorldRect;
    FBrowseUndoList.NewData(FUndoData);
  end;
  inherited;
end;

procedure TActionMap.DrawCoodWorldWillChange(Sender: TObject;
  WorldRect: TWorldRect; var Change: Boolean);
begin
  inherited;
end;

procedure TActionMap.DrawMeasurePath;
var
  i: Integer;
  drawPoints: TWorldPointList;
begin
//if no data then exit
  if FMeasureData.Count = 0 then
    Exit;
//tmp Points data
  drawPoints := TWorldPointList.Create;
//get screen points data
  for i := 0 to FMeasureData.Count - 1 do
    drawPoints.Add(DrawCood.ConvertSP(FMeasureData.GetData(i)));
//draw
  for i := 1 to drawPoints.Count - 1 do
    GraphDraw.DrawLine(Canvas, drawPoints.GetData(i - 1), drawPoints.GetData(i),
      pmNotXor, psSolid, 1, clBlack);
//  GraphDraw.DrawLine(Canvas,drawPoints.GetData(drawPoints.Count - 1),FBeforeCurrentpoint,
//    pmNotXor,psSolid,1,clBlack);
//  GraphDraw.DrawLine(Canvas,drawPoints.GetData(drawPoints.Count - 1),FCurrentPoint,
//    pmNotXor,psSolid,1,clBlack);
  drawPoints.Free;
//clear beforePoint
  //FBeforeCurrentpoint:=FCurrentPoint;
  FWorldBeforeCurrentpoint := FMeasureData.GetData(FMeasureData.Count - 1);
end;

function TActionMap.GetHaveSelectedMeta: Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to Layers.Count - 1 do
    if Layers.Layers[i].SelectedMeta.Count > 0 then
    begin
      Result := True;
      Break;
    end;
end;

function TActionMap.GetSelectedMetaCount(
  const ADrawID: Longword): Integer;
begin
  Result := Layers.GetLayerByID(ADrawID).SelectedMeta.Count;
end;

function TActionMap.GetWorldRect: TWorldRect;
begin
  Result := Outbox;
end;

procedure TActionMap.InvertSelectedMetas;
var
  i: Integer;
begin
  for i := 0 to Layers.Count - 1 do
    Layers.Layers[i].InvertSelectedMeta;
end;

procedure TActionMap.InvertSelectedMetas(const ADrawLayerID: Longword);
var
  i: Integer;
begin
  for i := 0 to Layers.Count - 1 do
  begin
    if Layers.Layers[i].ID = ADrawLayerID then
    begin
      Layers.Layers[i].InvertSelectedMeta;
      Break;
    end;
  end;
end;

procedure TActionMap.KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not DisableKeyDown then
    DoKeyDown(Sender, Key, Shift);
end;

procedure TActionMap.LoadFromFiles(AFileNames: TStrings);
var
  i: Integer;
begin
  for i := 0 to AFileNames.Count - 1 do
    LoadFromFile(AFileNames.Strings[i]);
end;

procedure TActionMap.MouseDown(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  if MouseCapture <> FCaptureMouse then
    MouseCapture := FCaptureMouse;
  if FOperateState = _Browse then
  begin
    FCurrentShiftState := Shift;
    BrowseMouseDown(Button, Shift, X, Y);
  end;
  inherited MouseDown(Button, Shift, X, Y);
end;

procedure TActionMap.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  if MouseCapture <> FCaptureMouse then
    MouseCapture := FCaptureMouse;
  if FOperateState = _Browse then
  begin
    FCurrentShiftState := Shift;
    BrowseMouseMove(Shift, X, Y);
  end;
  if Assigned(FOnBeforeMouseMoveEvent) then FOnBeforeMouseMoveEvent(self);
  inherited MouseMove(Shift, X, Y);
end;

procedure TActionMap.MouseUp(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited MouseUp(Button, Shift, X, Y); // by dxf 2007-07-11  �������ǽ�������ⲿ�л���ͼ

  if MouseCapture <> FCaptureMouse then
    MouseCapture := FCaptureMouse;
  if FOperateState = _Browse then
  begin
    FCurrentShiftState := Shift;
    BrowseMouseUp(Button, Shift, X, Y);
  end;
  //inherited MouseUp(Button,Shift,X,Y);  by dxf 2007-07-11 �������ǽ�������ⲿ�л���ͼ
  if FOperateState = _Browse then
  begin
    if not FBrowseCapture then
    begin
      FOrgPoint.x := 0;
      FOrgPoint.y := 0;
      FWorldOrgPoint.x := 0;
      FWorldOrgPoint.y := 0;
      FBeforeCurrentpoint := FOrgPoint;
      FWorldBeforeCurrentpoint := FWorldOrgPoint;
      FCurrentPoint := FOrgPoint;
      FWorldCurrentPoint := FWorldOrgPoint;
    end;
  end;
end;

procedure TActionMap.Move(XPixels, YPixels, XPixelsOff,
  YPixelsOff: integer);
begin
//  Canvas.TextOut(10,50,IntToStr(XPixelsOff));
//  FCurrentUndoDescribe:='�ƶ���ͼ';
  //FUndoData.Describe:='��ͼ';
  //FUndoData.WorldRect:=FWorldOutbox;
  //FBrowseUndoList.NewData(FUndoData);
  FDisableUndoRecord := True;
  OffsetPaint(XPixels, YPixels, XPixelsOff, YPixelsOff);
  FDisableUndoRecord := False;
  //FUndoData.Describe:='�ƶ���ͼ';
  //FUndoData.WorldRect:=FDrawCood.WorldRect;
  //FBrowseUndoList.NewData(FUndoData);
end;

procedure TActionMap.MoveTo(XPixels, YPixels: integer);
begin
  FCurrentUndoDescribe := '�ƶ���ͼ';
//  FUndoData.Describe:='��ͼ';
//  FUndoData.WorldRect:=FWorldOutbox;
//  FBrowseUndoList.NewData(FUndoData);
  DrawCood.Offset(DrawCood.Scale * XPixels, DrawCood.Scale * YPixels);
  Draw;
end;

procedure TActionMap.MoveToCentre;
var
  CenterPoint: TWorldPoint;
begin
  CenterPoint.x := (OutBox.Left + OutBox.Right) div 2;
  CenterPoint.y := (OutBox.Top + OutBox.Bottom) div 2;
  if ((Abs(CenterPoint.x - DrawCood.Center.x) div DrawCood.Scale) > 5) or
    ((Abs(CenterPoint.y - DrawCood.Center.y) div DrawCood.Scale) > 5) then
  begin
    Zoom(1, CenterPoint);
      //FDrawCood.CenterAT(CenterPoint);
    Draw;
  end;
end;

function TActionMap.SelectMeta: Boolean;
  function GetSelelctType(AShiftState: TShiftState): Integer;
  {����TShiftState״̬�������еĿ������������ֵ����
    ֻ���Ǽ���״̬,���������}
  begin
    Result := 0;
    if ssCtrl in AShiftState then
      Inc(Result, 1);
    if ssShift in AShiftState then
      Inc(Result, 2);
    if ssAlt in AShiftState then
      Inc(Result, 4);
  end;
var
  i: Integer;
  successSelected: Boolean;
  AselectType: TSelectType;
  addType: TSelectAddType;
  continueSelect: Boolean;
begin
  continueSelect := True;
  Result := False;
  ClearTmpBitmap;
  case MouseAction of
    actRectSelect: AselectType := stContaintSelect;
    actRectSelect_CR: AselectType := stCrossSelect;
    actCycleSelect: AselectType := stContaintSelect;
    actCycleSelect_CR: AselectType := stCrossSelect;
  else
    AselectType := stContaintSelect;
  end;
  for I := 0 to Layers.Count - 1 do
  begin
    if (lySelect in Layers.Layers[I].State) and
      (lyVisible in Layers.Layers[I].State) then
    begin
      with Layers.Layers[I] do
      begin
        case GetSelelctType(FCurrentShiftState) of
          0:
            begin
              if MouseAction = actCheckEntityInfo then
                EntityMeta.Clear
              else
                SelectedMeta.Clear;
              addType := satAddor;
            end;
          1: addType := satAddXOr;
        end;
        if MouseAction = actCheckEntityInfo then
          if Data.DataSetType <> _NoData then
          begin
            successSelected := SelectEntityMeta(AselectType, addType, 0);
            //successSelected:=Selection.Select(FCurrentPoint,EntityMeta)
            Result := Result or successSelected;
          end
          else
            successSelected := False
        else
        begin
          if continueSelect then
            successSelected := SelectMeta(AselectType, addType, RuntimeData.ObjectSelectType);
            //!!successSelected:=Selection.Select(FCurrentPoint,SelectedMeta);
        end;
        if (MouseAction <> actCheckEntityInfo) and (SelectedMeta.Count > 0) then
        begin
          HighLightSelectedMetas(TmpBitmap.Canvas.handle);
          TmpBitmapChanged := True;
          Result := True;
          if successSelected and (RuntimeData.ObjectSelectType = OST_SINGLE) and
            (MouseAction = actPointSelect) then
            continueSelect := False;
        end;
      end;
    end;
  end;
  paint;
end;

procedure TActionMap.SetBeforeCurrentpoint(const Value: TPoint);
begin
  FBeforeCurrentpoint := Value;
end;

procedure TActionMap.SetCapture(const Value: Boolean);
begin
  FCaptureMouse := Value;
end;

procedure TActionMap.SetCurrentAction(AAction: Integer);
begin
  if AAction < 100 then
  begin
    FOperateState := _Browse;
    case AAction of
      actNoAction: Self.Cursor := crDefault;
      actPointSelect: Self.Cursor := crPointSelect; // crArrow;  //����by sha
      actRectSelect, actRectSelect_CR, actCycleSelect, actCycleSelect_CR:
        Self.Cursor := crAniRectSelectCursor;
      actMove: Self.Cursor := crHandCursor;
      actZoomIn: Self.Cursor := crZoomIn; //crZoomIn;
      actZoomOut: Self.Cursor := crZoomOut; //crZoomOut;
      actCheckEntityInfo: Self.Cursor := crGetEntifyInfo; //crGetEntifyInfo;
      actMeasure: Self.Cursor := crMeasure;
      actUserDefinedText: Self.Cursor := crCross;
      actSetFactory,
      actSetFactoryPolygon: Self.Cursor := crCross;
      actSeekCar: Self.Cursor := crCross;
      actFindThing : Self.Cursor := crCross;
      actCarDistance: self.Cursor := crCross;
      actStationManage: self.Cursor := crCross;
      actSetConfineAlarmArea:      Self.Cursor := crGetEntifyInfo; //ͼ��"+" sha 20050222
      actSetConfineAlarmCircle: Self.Cursor := crDevAreaCircle; //sha 20081209
      actSetConfineAlarmRectangle: self.Cursor := crDevAreaRect; //���Ӿ��ε���Χ��
      actSetConfineAlarmPolygon:   self.Cursor := crDevAreaPolygon;
      actSetRunWay: Self.Cursor := crGetEntifyInfo; //ͼ��"+" sha 20060816��ʻ·��

    end;
  end;
  inherited SetCurrentAction(AAction);
  DoActionChanged;
end;

procedure TActionMap.SetCurrentPoint(const Value: TPoint);
begin
  FCurrentPoint := Value;
end;

procedure TActionMap.SetDisablekeyDown(const Value: Boolean);
begin
  FDisableKeyDown := Value;
end;

procedure TActionMap.SetMoveOffsetValue(const Value: Integer);
begin
  FMoveOffsetValue := Value;
end;

procedure TActionMap.SetOnBeforemouseMoveEvent(const Value: TNotifyEvent);
begin
  FOnBeforeMouseMoveEvent := Value;
end;

procedure TActionMap.SetOnMetaSelected(const Value: TNotifyEvent);
begin
  FOnMetaSelected := Value;
end;

procedure TActionMap.SetOnSetConfineAlarmArea(
  const Value: TSetConfineAlarmAreaEvent);
begin
  FOnSetConfineAlarmArea := Value;
end;

procedure TActionMap.SetOperateState(const Value: TMapState);
begin
  FOperateState := Value;
end;

procedure TActionMap.SetOrgPoint(const Value: TPoint);
begin
  FOrgPoint := Value;
end;

procedure TActionMap.SetTotalXPixel(const Value: Integer);
begin
  FTotalXPixel := Value;
end;

procedure TActionMap.SetTotalYPixel(const Value: Integer);
begin
  FTotalYPixel := Value;
end;

procedure TActionMap.SetWorldBeforeCurrentpoint(const Value: TWorldPoint);
begin
  FWorldBeforeCurrentpoint := Value;
end;

procedure TActionMap.SetWorldCurrentPoint(const Value: TWorldPoint);
begin
  FWorldCurrentPoint := Value;
end;

procedure TActionMap.SetWorldOrgPoint(const Value: TWorldPoint);
begin
  FWorldOrgPoint := Value;
end;

procedure TActionMap.XYToLoLa(const X, Y: Integer; var Lo, La: Double);
var
  gPoint: TEarthPoint;
begin
  gPoint := Projection.XY2LoLa(DrawCood.ConvertWP(Point(X, Y)));
  Lo := gPoint.Longitude;
  La := gPoint.Latitude;
end;

procedure TActionMap.LoLa2XY(const Lo, La: double; var X, Y: Integer);
var
  aPoint: Tpoint;
  ep: TEarthPoint;
begin
  ep.Longitude := Lo;
  ep.Latitude := La;
  aPoint := Projection.LoLa2XY(ep);
  apoint := DrawCood.ConvertSP(apoint); //
  x := aPoint.X;
  y := aPoint.Y;
end;

procedure TActionMap.XYTOWorldPoint(const X, Y: Integer; var WorldX,
  WorldY: integer);
var
  WPoint: TWorldPoint;
begin
  WPoint := DrawCood.ConvertWP(Point(X, Y));
  WorldX := WPoint.x;
  WorldY := WPoint.Y;

end;

procedure TActionMap.KeyPress(var Key: Char);
begin
  //��Ŀǰ���벻����γ��� sha 2005.6.21
  if (MouseAction = actSetConfineAlarmArea) and (key = #27) then
  begin
    //ȡ����
    AllowPaint := True;
    FBrowseCapture := False;
    paint;
    ClipCursor(nil);
    FCaptureMouse := False;
    RefreshScreenBitmap;
    FTotalXPixel := 0;
    FTotalYPixel := 0;
    //
    MouseAction := actNoAction;
    Screen.Cursor := crDefault;
  end;
  inherited KeyPress(key);
end;

procedure TActionMap.SetOnRectSelectMeta(const Value: TRectSelectMetaEvent);
begin
  FOnRectSelectMeta := Value;
end;

procedure TActionMap.DoRectSelectMeta(PointA, PointB: TEarthPoint);
begin
  if Assigned(FOnRectSelectMeta) then
    FOnRectSelectMeta(self, PointA, PointB);
end;

procedure TActionMap.ZoomInOut(InOrOut: byte; Left, Top, Rigth,
  Bottom: integer);
var
  WorldRect: TWorldRect;
begin
  WorldRect.Left := Left;
  WorldRect.Top := Top;
  WorldRect.Right := Rigth;
  WorldRect.Bottom := Bottom;
  FCurrentPoint.X := Self.Width div 2;
  FCurrentPoint.Y := Self.Height div 2;
  FOrgPoint := FCurrentPoint;
  DrawCood.SetWorld(WorldRect);
  if InOrOut = 1 then
  begin

  // if (Abs(FCurrentPoint.x-FOrgPoint.x)<MinZoomPixel) and
    //    (Abs(FCurrentPoint.y-FOrgPoint.y)<MinZoomPixel) then
    DrawCood.ZoomInAT(DrawCood.ConvertWP(FCurrentPoint));
   //else
     // DrawCood.ZoomInAsScreenRect(FOrgPoint,FCurrentPoint);
    Self.Draw;
  end else
    if InOrOut = 0 then
    begin
   // if (Abs(FCurrentPoint.x-FOrgPoint.x)<MinZoomPixel) and
    //    (Abs(FCurrentPoint.y-FOrgPoint.y)<MinZoomPixel) then
      DrawCood.ZoomOutAT(DrawCood.ConvertWP(FCurrentPoint));
    //else
    //  DrawCood.ZoomOutAsScreenRect(FOrgPoint,FCurrentPoint);
      Self.Draw;
    end;
end;

procedure TActionMap.DoSetRunWay(WPointsAry: TWorldPointAry;
  PointsCnt: Integer);
begin
  if Assigned(FOnSetRunWay) then
    FOnSetRunWay(Self, FWorldPointArray, PointsCnt);
end;

procedure TActionMap.SetOnSetRunWay(const Value: TSetRunWayEvent);
begin
  FOnSetRunWay := Value;
end;


procedure TActionMap.SetonUserCarDistance(
  const Value: TUserCarDistanceEvent);
begin
  FonUserCarDistance := Value;
end;

procedure TActionMap.BrowseSetCarDistance(AMouseState: TMouseState);
var
  EPoint: TEarthPoint;
begin
  try
    if (AMouseState = msDown) then
    begin
      if ssLeft in FCurrentShiftState then
      begin
        if Assigned(FOnUserDefinedText) then
        begin
          XYToLoLa(FCurrentPoint.X, FCurrentPoint.Y, EPoint.X, EPoint.Y);
          FonUserCarDistance(Self, EPoint, FWorldCurrentPoint);
        end;
      end;
    end;
  except on E: Exception do
      elog.SystemLog.AddLog(' TActionMap.BrowseUserDefinedText ', e.Message);
  end;
end;

procedure TActionMap.BrowseSetStationMemo(AMouseState: TMouseState);
var
  EPoint: TEarthPoint;
begin
  try
    if (AMouseState = msDown) then
    begin
      if ssLeft in FCurrentShiftState then
      begin
        if Assigned(FonUserStation) then
        begin
          XYToLoLa(FCurrentPoint.X, FCurrentPoint.Y, EPoint.X, EPoint.Y);
          FonUserStation(Self, EPoint, FWorldCurrentPoint);
        end;
      end;
    end;
  except on E: Exception do
      elog.SystemLog.AddLog(' TActionMap.BrowseUserDefinedText ', e.Message);
  end;
end;

procedure TActionMap.SetonUserStation(const Value: TUserStationEvent);
begin
  FonUserStation := Value;
end;

procedure TActionMap.BrowseSeekCar(AMouseState: TMouseState);
var
  beginp, tempP: TPoint;
  endp: TPoint;
  gPoint: TEarthPoint;

  ParamBegin, ParamEnd: TPoint;
begin
  try
    if (AMouseState = msDown) and (ssLeft in FCurrentShiftState) then
    begin
      FOrgPoint := FCurrentPoint;
      FBeforeCurrentpoint := FCurrentPoint;
      FBrowseCapture := True;
      FCaptureMouse := True;
      AllowPaint := False;
    end;
    if (AMouseState = msMove) and FBrowseCapture then
    begin
      GraphDraw.DrawRectAngle(Canvas, FOrgPoint, FBeforeCurrentpoint,
        pmNotXor, psDot, 1);
      GraphDraw.DrawRectAngle(Canvas, FOrgPoint, FCurrentPoint,
        pmNotXor, psDot, 1);
      FBeforeCurrentpoint := FCurrentPoint;
    end;
    if (AMouseState = msUp) and FBrowseCapture then
    begin
      GraphDraw.DrawRectAngle(Canvas, FOrgPoint, FBeforeCurrentpoint,
        pmNotXor, psDot, 1);

   // Self.Cursor := crZoomIn;
      Self.Cursor := actMeasure;
      FCurrentUndoDescribe := '����鳵';
      //MapSeekCarForm := TMapSeekCarForm.Create(Self);    // ls
      try
        if (Abs(FCurrentPoint.x - FOrgPoint.x) < MinZoomPixel) and
          (Abs(FCurrentPoint.y - FOrgPoint.y) < MinZoomPixel) then
        begin
          tempP := DrawCood.ConvertWP(FCurrentPoint);
          beginp.X := tempP.X - 1000;
          beginp.Y := tempP.Y - 1000;
          endp.X := tempP.X + 1000;
          endp.Y := tempP.Y + 1000;
        end
        else
        begin
          if FOrgPoint.X < FCurrentPoint.X then
          begin
            beginp := DrawCood.ConvertWP(FOrgPoint);
            endp := DrawCood.ConvertWP(FCurrentPoint);
          end
          else
          begin
            beginp := DrawCood.ConvertWP(FCurrentPoint);
            endp := DrawCood.ConvertWP(FOrgPoint);
          end;
        end;
        gPoint := Projection.XY2LoLa(beginp);
        //MapSeekCarForm.beginp.X := Trunc(gPoint.X * 1000000);    // ls
        //MapSeekCarForm.beginp.Y := Trunc(gPoint.Y * 1000000);    // ls
        ParamBegin.X := Trunc(gPoint.X * 1000000);
        ParamBegin.Y := Trunc(gPoint.Y * 1000000);

        gPoint := Projection.XY2LoLa(endp);
        //MapSeekCarForm.endp.X := Trunc(gPoint.X * 1000000);      // ls
        //MapSeekCarForm.endp.Y := Trunc(gPoint.Y * 1000000);      // ls
        ParamEnd.X := Trunc(gPoint.X * 1000000);
        ParamEnd.Y := Trunc(gPoint.Y * 1000000);
        //MapSeekCarForm.ShowModal;                                // ls


      finally
        //MapSeekCarForm.Free;    // ls
        Self.Paint;
      end;

      AllowPaint := True; //swp
    //draw;
      Screen.Cursor := crDefault;
      FBrowseCapture := False;
      FCaptureMouse := False;

      if Assigned(FOnBrowseSeekCar) then //�׳�
        FOnBrowseSeekCar(beginp, endp);//FOnBrowseSeekCar(ParamBegin.X, ParamBegin.Y, ParamEnd.X, ParamEnd.Y);

    end;
  except on E: Exception do
      elog.SystemLog.AddLog(' TActionMap.BrowseSeekCar ', e.Message);
  end;
end;

procedure TActionMap.FindThing(AMouseState: TMouseState);
var
  beginp, tempP: TPoint;
  endp: TPoint;
  gPoint: TEarthPoint;

  ParamBegin, ParamEnd: TPoint;
begin
  try
    if (AMouseState = msDown) and (ssLeft in FCurrentShiftState) then
    begin
      FOrgPoint := FCurrentPoint;
      FBeforeCurrentpoint := FCurrentPoint;
      FBrowseCapture := True;
      FCaptureMouse := True;
      AllowPaint := False;
    end;
    if (AMouseState = msMove) and FBrowseCapture then
    begin
      GraphDraw.DrawRectAngle(Canvas, FOrgPoint, FBeforeCurrentpoint,
        pmNotXor, psDot, 1);
      GraphDraw.DrawRectAngle(Canvas, FOrgPoint, FCurrentPoint,
        pmNotXor, psDot, 1);
      FBeforeCurrentpoint := FCurrentPoint;
    end;
    if (AMouseState = msUp) and FBrowseCapture then
    begin
      GraphDraw.DrawRectAngle(Canvas, FOrgPoint, FBeforeCurrentpoint,
        pmNotXor, psDot, 1);

   // Self.Cursor := crZoomIn;
      Self.Cursor := actMeasure;
      FCurrentUndoDescribe := 'ʧ��鳵';
      //MapSeekCarForm := TMapSeekCarForm.Create(Self);    // ls
      try
        if (Abs(FCurrentPoint.x - FOrgPoint.x) < MinZoomPixel) and
          (Abs(FCurrentPoint.y - FOrgPoint.y) < MinZoomPixel) then
        begin
          tempP := DrawCood.ConvertWP(FCurrentPoint);
          beginp.X := tempP.X - 1000;
          beginp.Y := tempP.Y - 1000;
          endp.X := tempP.X + 1000;
          endp.Y := tempP.Y + 1000;
        end
        else
        begin
          if FOrgPoint.X < FCurrentPoint.X then
          begin
            beginp := DrawCood.ConvertWP(FOrgPoint);
            endp := DrawCood.ConvertWP(FCurrentPoint);
          end
          else
          begin
            beginp := DrawCood.ConvertWP(FCurrentPoint);
            endp := DrawCood.ConvertWP(FOrgPoint);
          end;
        end;
        gPoint := Projection.XY2LoLa(beginp);
        //MapSeekCarForm.beginp.X := Trunc(gPoint.X * 1000000);    // ls
        //MapSeekCarForm.beginp.Y := Trunc(gPoint.Y * 1000000);    // ls
        ParamBegin.X := Trunc(gPoint.X * 1000000);
        ParamBegin.Y := Trunc(gPoint.Y * 1000000);

        gPoint := Projection.XY2LoLa(endp);
        //MapSeekCarForm.endp.X := Trunc(gPoint.X * 1000000);      // ls
        //MapSeekCarForm.endp.Y := Trunc(gPoint.Y * 1000000);      // ls
        ParamEnd.X := Trunc(gPoint.X * 1000000);
        ParamEnd.Y := Trunc(gPoint.Y * 1000000);
        //MapSeekCarForm.ShowModal;                                // ls


      finally
        Self.Paint;
      end;

      AllowPaint := True;
      Screen.Cursor := crDefault;
      FBrowseCapture := False;
      FCaptureMouse := False;

      if Assigned(FOnFindThing) then //�׳�
          FOnFindThing(ParamBegin.X, ParamBegin.Y, ParamEnd.X, ParamEnd.Y);

    end;
  except on E: Exception do
      elog.SystemLog.AddLog(' TActionMap.FindThing ', e.Message);
  end;
end;

procedure TActionMap.BrowseSetConfineAlarmCircle(AMouseState: TMouseState);
  //����Ļ�������������
  function GetDistance(P1, P2: TPoint): Integer;
  var
    d: double;
  begin
    d := Sqrt(power(p1.X - p2.X, 2) + power(p1.Y - p2.Y, 2));
    Result := Round(d);
  end;

  function GetEDistance(P1, P2: TPoint): Integer;
  var
    pw1, pw2: TEarthPoint;
  begin
    pw1 := Projection.XY2LoLa(DrawCood.ConvertWP(p1));
    pw2 := Projection.XY2LoLa(DrawCood.ConvertWP(p2));
    Result := Round(GisMeasure.GetGisDistance(pw1, pw2));
  end;
var
  radius: Integer;
begin
  try
    if (AMouseState = msDown) and (ssLeft in FCurrentShiftState) then
    begin
      FOrgPoint := FCurrentPoint;
      FWorldOrgPoint := DrawCood.ConvertWP(FOrgPoint);
      FBeforeCurrentpoint := FCurrentPoint;
      FBrowseCapture := True;
      FCaptureMouse := True;
      AllowPaint := False;
    end;
    if (AMouseState = msMove) and FBrowseCapture then
    begin
      radius := GetDistance(FOrgPoint, FBeforeCurrentpoint);
      GraphDraw.DrawCircle(Canvas, FOrgPoint, radius, pmNotXor, psDot, 1);
      radius := GetDistance(FOrgPoint, FCurrentPoint);
      GraphDraw.DrawCircle(Canvas, FOrgPoint, radius, pmNotXor, psDot, 1);
      FBeforeCurrentpoint := FCurrentPoint;
    end;
    if (AMouseState = msUp) and FBrowseCapture then
    begin
      radius := GetDistance(FOrgPoint, FBeforeCurrentpoint);
      GraphDraw.DrawCircle(Canvas, FOrgPoint, radius, pmNotXor, psDot, 1);
      FCurrentUndoDescribe := '��Բ';
      Screen.Cursor := crDefault;
      AllowPaint := True;
      FBrowseCapture := False;
      FCaptureMouse := False;
      if radius>0 then 
        if Assigned(FOnSetConfineAlarmCircle) then //�׳�
           FOnSetConfineAlarmCircle(self,
               Projection.XY2LoLa(DrawCood.ConvertWP(FOrgPoint)),
               GetEDistance(FOrgPoint, FBeforeCurrentpoint),
               Projection.XY2LoLa(DrawCood.ConvertWP(FBeforeCurrentpoint)));
    end;
  except on E: Exception do
      elog.SystemLog.AddLog(' TActionMap.BrowseCycleSelect ', e.Message);
  end;
end;

procedure TActionMap.SetOnSetConfineAlarmCircle(
  const Value: TSetConfineAlarmCircleEvent);
begin
  FOnSetConfineAlarmCircle := Value;
end;

procedure TActionMap.SetOnBrowseSeekCar(const Value: TBrowseSeekCar);
begin
  FOnBrowseSeekCar := Value;
end;

procedure TActionMap.SetOnFindThing(const Value: TFindThing);
begin
  FOnFindThing := Value;
end;


procedure TActionMap.BrowseSetConfineAlarmNoSybol(
  AMouseState: TMouseState);
var
  cursorRect: PRect;
  pt: TPoint;
  pointCnt: integer;
begin
  try
    if (AMouseState = msDown) then
    begin
      if (ssDouble in FCurrentShiftState) and FBrowseCapture and (length(FWorldPointArray) >= 2) then
      begin
        ClipCursor(nil);
        AllowPaint := True;
        FMeasureData.Clear;
        FBrowseCapture := False;
        FCaptureMouse := False;

        DosetConfineAlarmNoSybol(FWorldPointArray, length(FWorldPointArray));
        SetLength(FWorldPointArray, 0);

        RefreshScreenBitmap;
        FTotalXPixel := 0;
        FTotalYPixel := 0;
        Exit;
      end;
      if ssLeft in FCurrentShiftState then
      begin
        if not FBrowseCapture then
        begin
          SetLength(FWorldPointArray, 1);
          pointCnt := 1;
        //��ʱ ��������
        //AllowPaint:=False;
        //���������ƶ���Χ
          New(cursorRect);
          cursorRect^ := GetClientRect;
          pt.x := 0;
          pt.y := 0;
          pt := ClientToScreen(pt);
          cursorRect^.Left := cursorRect^.Left + pt.x;
          cursorRect^.Right := cursorRect^.Right + pt.x;
          cursorRect^.Top := cursorRect^.Top + pt.y;
          cursorRect^.Bottom := cursorRect^.Bottom + pt.y;
          ClipCursor(cursorRect);
          Dispose(cursorRect);
          FCaptureMouse := True;
        end
        else
        begin
          pointCnt := Length(FWorldPointArray);
          pointCnt := pointCnt + 1;
          setLength(FWorldPointArray, pointCnt);
        end;
        FWorldPointArray[pointCnt - 1] := FWorldCurrentPoint;
        FBeforeCurrentpoint := FCurrentPoint;
        FWorldBeforeCurrentpoint := FWorldCurrentPoint;
      //������뵽 FMeasureData�У�������Ƴ������ػ�ʱ����DoPaint�е���DrawMeasurePath�ٻ���ǰ�����������
        FMeasureData.Add(FWorldCurrentPoint);
        FBrowseCapture := True;
      end;
    end;
    if (AMouseState = msMove) and FBrowseCapture then
    begin
      pointCnt := Length(FWorldPointArray);
      GraphDraw.DrawLine(Canvas, DrawCood.ConvertSP(FWorldPointArray[pointCnt - 1]),
        DrawCood.ConvertSP(FWorldBeforeCurrentpoint),
        pmNotXor, psSolid, 1, clBlack);
      GraphDraw.DrawLine(Canvas, DrawCood.ConvertSP(FWorldPointArray[pointCnt - 1]),
        DrawCood.ConvertSP(FWorldCurrentpoint),
        pmNotXor, psSolid, 1, clBlack);
    {Ŀǰ�������⣺Ҫ�ǻ����ߣ���������Ƴ������ػ�ʱ����໭��һ������}
     { GraphDraw.DrawLine(Canvas,DrawCood.ConvertSP(FWorldPointArray[0]),
        DrawCood.ConvertSP(FWorldBeforeCurrentpoint),
        pmNotXor,psDot,1,clBlack);
      GraphDraw.DrawLine(Canvas,DrawCood.ConvertSP(FWorldPointArray[0]),
        DrawCood.ConvertSP(FWorldCurrentpoint),
        pmNotXor,psDot,1,clBlack);  }
      FBeforeCurrentpoint := FCurrentPoint;
      FWorldBeforeCurrentpoint := FWorldCurrentPoint;
      if FCurrentPoint.x = 0 then
      begin
        FTotalXPixel := FTotalXPixel + FMoveOffsetValue;
        Move(FTotalXPixel, FTotalYPixel, +FMoveOffsetValue, 0);
      end;
      if FCurrentPoint.x = (Width - 1) then
      begin
        FTotalXPixel := FTotalXPixel - FMoveOffsetValue;
        Move(FTotalXPixel, FTotalYPixel, -FMoveOffsetValue, 0);
      end;
      if FCurrentPoint.y = 0 then
      begin
        FTotalYPixel := FTotalYPixel + FMoveOffsetValue;
        Move(FTotalXPixel, FTotalYPixel, 0, +FMoveOffsetValue);
      end;
      if FCurrentPoint.y = (Height - 1) then
      begin
        FTotalYPixel := FTotalYPixel - FMoveOffsetValue;
        Move(FTotalXPixel, FTotalYPixel, 0, -FMoveOffsetValue);
      end;
      if ((Abs(FTotalXPixel) + FMoveOffsetValue) >= Width) or
        ((Abs(FTotalYPixel) + FMoveOffsetValue) >= Height) then
      begin
        RefreshScreenBitmap;
        FTotalXPixel := 0;
        FTotalYPixel := 0;
      end;
    end;

    if (AMouseState = msMove) and (not FBrowseCapture) then Exit;
  except on E: Exception do
      elog.SystemLog.AddLog(' TActionMap.BrowseSetConfineAlarmArea ', e.Message);
  end;
end;

procedure TActionMap.DosetConfineAlarmNoSybol(WPointsAry: TWorldPointAry;
  PointsCnt: Integer);
begin
  if Assigned(FSetConfineAlarmNoSybol) then
    FSetConfineAlarmNoSybol(Self, FWorldPointArray, PointsCnt);
end;

procedure TActionMap.SetSetConfineAlarmNoSybol(
  const Value: TSetConfineAlarmNoSybolEvent);
begin
  FSetConfineAlarmNoSybol := Value;
end;

procedure TActionMap.BrowseSetConfineAlarmrectangle(
  AMouseState: TMouseState);
var
  beginp, tempP: TPoint;
  endp: TPoint;
  leftPoint: TEarthPoint;
  RightPoint: TEarthPoint;
begin
  try
    if (AMouseState = msDown) and (ssLeft in FCurrentShiftState) then
    begin
      FOrgPoint := FCurrentPoint;
      FBeforeCurrentpoint := FCurrentPoint;
      FBrowseCapture := True;
      FCaptureMouse := True;
      AllowPaint := False;
    end;
    if (AMouseState = msMove) and FBrowseCapture then
    begin
      GraphDraw.DrawRectAngle(Canvas, FOrgPoint, FBeforeCurrentpoint,
        pmNotXor, psDot, 1);
      GraphDraw.DrawRectAngle(Canvas, FOrgPoint, FCurrentPoint,
        pmNotXor, psDot, 1);
      FBeforeCurrentpoint := FCurrentPoint;
    end;
    if (AMouseState = msUp) and FBrowseCapture then
    begin
      GraphDraw.DrawRectAngle(Canvas, FOrgPoint, FBeforeCurrentpoint,
        pmNotXor, psDot, 1);

      Self.Cursor := actMeasure;


      if (Abs(FCurrentPoint.x - FOrgPoint.x) < MinZoomPixel) and
        (Abs(FCurrentPoint.y - FOrgPoint.y) < MinZoomPixel) then
      begin
        tempP := DrawCood.ConvertWP(FCurrentPoint);
        beginp.X := tempP.X - 1000;
        beginp.Y := tempP.Y - 1000;
        endp.X := tempP.X + 1000;
        endp.Y := tempP.Y + 1000;
      end
      else
      begin
        if FOrgPoint.X < FCurrentPoint.X then
        begin
          beginp := DrawCood.ConvertWP(FOrgPoint);
          endp := DrawCood.ConvertWP(FCurrentPoint);
        end
        else
        begin
          beginp := DrawCood.ConvertWP(FCurrentPoint);
          endp := DrawCood.ConvertWP(FOrgPoint);
        end;
      end;

      leftPoint := Projection.XY2LoLa(beginp);
      rightPoint := Projection.XY2LoLa(endp);
      if not((leftPoint.x = RightPoint.x) and (leftPoint.y = RightPoint.y)) then    //�����㲻���ʱ�����׳�
        if Assigned(FOnsetConfineAlarmRectangle) then //�׳�
        begin
          FOnsetConfineAlarmRectangle(self, leftPoint, rightPoint);
        end;

      AllowPaint := True;
      Screen.Cursor := crDefault;
      FBrowseCapture := False;
      FCaptureMouse := False;

    end;
  except on E: Exception do
      elog.SystemLog.AddLog(' TActionMap.BrowseSetConfineAlarmrectangle ', e.Message);
  end;
end;

procedure TActionMap.SetOnsetConfineAlarmRectangle(
  const Value: TSetConfineAlarmRectangleEvent);
begin
  FOnsetConfineAlarmRectangle := Value;
end;

procedure TActionMap.SetOnUserSetFactory(
  const Value: TSetConfineAlarmCircleEvent);
begin
  FOnUserSetFactory := Value;
end;

procedure TActionMap.SetOnUserSetFactoryPolygon(
  const Value: TSetConfineAlarmNoSybolEvent);
begin
  FOnUserSetFactoryPolygon := Value;
end;


procedure TActionMap.SetOnSetLineProperty(
  const Value: TSetLinePropertyEvent);
begin
  FOnSetLineProperty := Value;
end;

procedure TActionMap.DoSetLineProperty;
begin
  if Assigned(FOnSetLineProperty) then
    FOnSetLineProperty;
end;

procedure TActionMap.SetOnMapActionChangedEvent(
  const Value: TMapActionChangedEvent);
begin
  FOnMapActionChangedEvent := Value;
end;

end.

