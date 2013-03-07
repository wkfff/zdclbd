unit emapker;

interface
uses
  DB,  DBclient,
  ObjDefine,
  Windows,
  Classes,
  Graphics,
  MapProj,
  MetaDefine,
  tyolist,
  Types,
  Coord,
  geome,
  Para,
  tyoGraph,
  tyoSymbol,
  elog,
  Sysutils,
  extctrls,
  Math,
  EventDefine,
  Staticproc,
  MapMeasure,
  MemMapping,
  ScaleDraw,
  Controls,
  tyoexception,
  Bitmaps,
  PitchOn,
  tyodefine,
  //{$IFDEF LABEL}
  IntegerUnit,
  //{$ENDIF}
//  MetaManage,
  ADODB,
  Registry,
  ComCtrls;

const
  {最多可以同时打开的图层数}
  MAX_LAYERS=200;

  actNoAction=0;
  actMove=1;
  actZoomIn=2;
  actZoomOut=3;
  actCheckEntityInfo=4;
  actMeasure=5;
  actPointSelect=10;
  actRectSelect=11;
  actRectSelect_CR=12;
  actCycleSelect=13;
  actCycleSelect_CR=14;
  actPolygonSelect=15;
  actPolygonSelect_CR=16;
  actAddSymble=101;
  actAddLine=102;
  actAddEllipse=103;
  actAddPolyLine=104;
  actAddRectAngle=105;
  actAddRoundRect=106;
  actAddRegion=107;
  actAddText=108;
  actAddArc=109;
  actEditMove=110;
  actEditPolyPoint=111;
  actAddPointToPoly=112;
  actDelPointFromPoly=113;
  actClearSelectedMeta=150;

  actSetConfineAlarmArea = 20; //设置区域报警－－电子围栏，分为越界报警、驶入报警　sha
  actSetRunWay           = 22; //设置行驶路线 sha 20060816
  actUserDefinedText     = 21; //用户在地图自定义标签 dxf 2006-07-13
  actSetFactory          = 23; //添加工厂工地信息
  actSeekCar             = 24; //
  actCarDistance          =25;  //====车辆距离
  actStationManage        =26;  //=====站台信息
  actSetConfineAlarmCircle = 27; //设置区域报警--圆形电子围栏，目前仅画出，供发命令给车机 sha 20081209
  actSetConfineAlarmPolygon=28 ; //设置不规则电子围栏 ，
  actSetConfineAlarmRectangle=29;//设置矩形电子围栏
  actSetFactoryPolygon     = 30;// 添加工厂工地信息--多边形 sha 200900423

  actFindThing           = 31;  //失物查找     ls 20091224

  actClearTargetObjectMeta=200;

  crHandCursor=1;
  crMoveHandCursor=2;
  crZoomIn=3;
  crZoomOut=4;
  crGetEntifyInfo=5;
  crMeasure=6;
  crPointSelect = 7;//点选 -- add by sha
  crAniRectSelectCursor=11;  //框选 --by sha   从下面移上来
  crDevAreaCircle = 21;  //车机区域_圆形 sha 20110610
  crDevAreaRect = 22;
  crDevAreaPolygon = 23;  

  (*
  crAddSymbol=7;
  crAniSelectCursor=10;

  crAniNormalBusy=12;
  crAniMeasure=13;
  crAniZoomIn=14;
  crAniZoomOut=15;
  crAniCheckInfo=16;
*)
  OST_ALL=0;
  OST_SINGLE=1;

  NotFindStr='@1@';
type
  TGisShortName = string[32];
  TGisLabelValue = string[255];
  TPoints = array[0..0] of TPoint;
   PPoints = ^TPoints;

  TMouseState=(msDown,msUp,msMove,msNormal,msCancel,msInit);
  TPropType = (_NoData, _Local);
  TMapOption=(mpMvNotDrawText,mpMvNotDrawLabel,mpMvNotDrawBitmap,mpAllowDraw,mpIgnorSmallFont);
  TMapOptions=set of TMapOption;

  TLayerState=(lyVisible,lyEditAble,lySelect,lyLabel,lyMetaScale);
  TLayerStates=set of TLayerState;

  TMapRefreshedEvent=procedure of object;
  {图元过滤方法，调用一个外部的函数来过滤图元}
  TFilterMetaMethod =procedure(PMeta:TPointerMeta;var Flag:boolean) of object;

  TCustomLayer = class;
  TCustomDataLayer = class;
  // TCustomDataLayer数组类型定义
  TCustomDataLayers=array of TCustomDataLayer;
  TDataLayer = class;
  TDataLayers=array of TDataLayer;
  TCustomDrawLayer = class;
  TCustomDrawLayers=array of TCustomDrawLayer;
  TDrawLayer = class;
  TDrawLayers=array of TDrawLayer;
  TLayerProvider = class;
  TLayers = class;
  TCustomMap = class;
  TMap = class;




  TCustomLayer=class(TBasicObj)
  private
    FIdentification:longword;
    FVersion: Integer;
    FLayerName : TGisShortName;
    FShowName : TGisShortName;
    FLabelValue : TGisLabelValue;
    FIndex : Integer;
    FEnableScaleLimit : Boolean;
    FMinScale : Double;
    FMaxScale : Double;
    FOutBox:TWorldRect;
    FState : TLayerStates;
    FisHaveNotDelete: boolean;
    procedure SetLabelValue(const Value: TGisLabelValue);
  protected
    procedure SetState(Value: TLayerStates);virtual;
    procedure SetIdentification(Value:longword);
    procedure DoClose;override;
  public
    constructor Create;override;
    destructor Destroy; override;
    procedure Close;override;
    class function GetIdentification:longword;virtual;
    function GetShowName:string;virtual;
//    procedure ClearLabelText;overload;virtual;abstract;
//    procedure ClearLabelText(const AMetaIndex:Integer);overload;virtual;abstract;
    property EnableScaleLimit:Boolean read FEnableScaleLimit Write FEnableScaleLimit;
    property OutBox:TWorldRect read FOutBox write FOutBox;
    property Index:Integer read FIndex Write FIndex;
    property LabelValue: TGisLabelValue read FLabelValue Write SetLabelValue;
    property LayerName: TGisShortName read FLayerName Write FLayerName;
    property MaxScale:Double read FMaxScale Write FMaxScale;
    property MinScale:Double read FMinScale Write FMinScale;
    property ShowName: TGisShortName read FShowName Write FShowName;
    property State:TLayerStates read FState Write SetState;
    property Identification:longword read FIdentification;
    property Version: Integer read FVersion;
    property isHaveNotDelete:boolean read  FisHaveNotDelete write FisHaveNotDelete;//是否能删除 add by dxf 2006-07-12
  end;

  PCustomDataLayer = ^TCustomDataLayer;

  TCustomDataLayer = class(TCustomLayer)
  private
    FProvider: TLayerProvider;


//    FDataSet : TDataSet;
//    FFlexMetas:TFlexDataManage;
    FDataSetType: TPropType;
    //图层的文件名
    FFileName : String;
    FProjectionType: Integer;
    FMemMapFile:TMemMapFile;
//    function GetMetasWorldOutbox(MetaIndexs: TIntegerDynArray;PrjType:integer): TWorldRect;
  protected
    //FFixMetas : TEarthMetaAry;
   // FFixMetas:TWorldMetaAry;
    //图层文件头结构
    FFileHead : PFileHead;
    //保存图元的标注
    //FDynMetas : TMemMetaInfoAry;
    //TMetaStruct长度
    FMetaStructSize:integer;
    //不定长数据的启始地址
    FStaticStart:integer;
    //标注数据启始地址
    FNameAddressStart:integer;
    //图元数据启始地址
    FMetaAddressStart:integer;
    //图元总个数
    FMetaCount : Integer;
    //图元最大ID号
    FMaxMetaID : Integer;
    //property FlexMetas:TFlexDataManage read FFlexMetas;
    procedure SetIndexHeadToLayer(AHead: PFileHead);virtual;
    procedure GetIndexHeadFromLayer(AHead: PFileHead);virtual;
    //procedure SaveIndex(AFileName:string);virtual;abstract;
    //procedure SaveStatic(AFileName:string);virtual;abstract;
    //procedure SaveDynamic(AFileName:string);virtual;abstract;
    //procedure SaveDataset(AFileName:string);virtual;abstract;
    procedure LoadFromFile (AFileName : String;const ProjectionType:Integer=-1); virtual; abstract;
    procedure LoadIndex();virtual;abstract;
    procedure InitAddress();virtual;abstract;
//    procedure LoadDataset(AFileName:string);overload;virtual;abstract;
//    procedure LoadDataset(AFileName:string;Connection:TCustomConnection);overload;virtual;abstract;
//    procedure CreateDynMeta;virtual;abstract;
//    procedure CreateLabelText;virtual;abstract;
    function GetLabelText(const UID: Integer;const ALabelValue:string):string;virtual;abstract;
//    procedure Save (); virtual; abstract;
//    procedure SaveUseMapFile (); virtual; abstract;
//    procedure SaveAs (AFileName : String); virtual; abstract;
//    procedure SaveAsUseMapFile (AFileName : String); virtual; abstract;
    procedure DecReferenceCounting;virtual;abstract;
    procedure IncMetaCount(Value:integer);virtual;abstract;
    procedure IncMaxMetaID;virtual;abstract;

    property ProjectionType:Integer read FProjectionType Write FProjectionType;
    property MaxMetaID :Integer read FMaxMetaID write FMaxMetaID;
    property MemMapFile:TMemMapFile read FMemMapFile;
   // property StaticStart:integer read FstaticStart;
  public
    constructor Create;override;
    destructor Destroy; override;
    class function GetIdentification:longword;override;
    function GetMetaUID(const Index:Integer):Integer;virtual;
    function GetMetaPointer (Index : Integer) : PMetaStruct;virtual;
    //function GetMeta(Index:Integer):TMetaStruct;overload;virtual;
    //获取图元标
    function GetMeta(Index: integer): PMetaStruct;overload;virtual;
    //获取图元标注内容
    function GetMetaName(AMeta:PMetaStruct):String;virtual;
    function GetMetaIndex(AUID : Integer) : Integer; virtual;
    procedure SetProvider(AProvider:TLayerProvider);
//    property DataSet:TDataSet read FDataSet Write FDataSet;
    property DataSetType: TPropType read FDataSetType Write FDataSetType;
    //property DynMetas:TMemMetaInfoAry read FDynMetas Write FDynMetas;
    property MetaCount:Integer read FMetaCount;
    property Provider:TLayerProvider read FProvider;
    property FileName:String read FFileName Write FFileName;
    property Metas[Index:integer]:PMetaStruct read GetMeta;

    property NameAddressStart:integer  read FNameAddressStart;
     //不定长数据的启始地址
    property StaticStart:integer read FStaticStart;

  end;

  TDataLayer = class (TCustomDataLayer)
  private


   //(FMemMapFile.data);

//    FActualStaticFileName:string;
  protected
//    procedure SaveIndex(AFileName:string);override;
    //procedure SaveStatic(AFileName:string);override;
    //procedure SaveDynamic(AFileName:string);override;
    //procedure SaveDataset(AFileName:string);override;
    procedure LoadIndex();override;
    procedure InitAddress();override;
//    procedure LoadStatic();override;
//    procedure LoadDataset();
//    procedure CreateDynMeta;override;
//    procedure CreateLabelText;override;
//    procedure OpenFlexFile(const AProjectionType:Integer);override;

  public
    class function GetIdentification:longword;override;
    procedure LoadFromFile(AFileName:string;const AProjectionType:Integer=-1); override;
    procedure ReLoadFromFile;
    constructor Create;override;
    destructor Destroy; override;
//    procedure SaveAs (AFileName : String); override;
    procedure SetDetailIgnore(APixels:integer);
    function GetLabelText(const UID: Integer;const ALabelValue:string):string;override;
    {sha add 2005-7-30
    用标注来查询ID
    LocateOption = [loCaseInsensitive],表示全字匹配
                 = [loPartialKey] 　　,表示模糊查找}
    function GetUIDFromLabelValue(const AFieldName,ALabelValue:string;LocateOptions: TLocateOptions):TIntegerDynArray;
//    procedure ClearLabelText;override;
//    procedure ClearLabelText(const AMetaIndex:Integer);override;
//    procedure LoadFlexFile(const AProjectionType:Integer);override;

    property ProjectionType;
    property MaxMetaID ;

   // property Flexmetas;
  end;

  TCustomDrawLayer = class(TCustomLayer)
  private
    FSelectedMeta : TYIntegerList;
    FEntityMeta : TYIntegerList;
    FData: TCustomDataLayer;
    FDataBuffer:TIntegerDynArray;
    FMetaInScreen : TYIntegerList;
    FMetasWillDraw : TYIntegerList;
    FMap : TCustomMap;
    FMovingDraw:boolean;
    FCustomSymbols:TCustomSymbols;
    FOnFilterMeta : TFilterMetaMethod;
    FLabelFont: TTrueFontStruct;
    procedure SetLabelFont(const Value: TTrueFontStruct);
  protected
    ODynMetas:TDrawMetaAry;
    function PrjType:integer; virtual;
    procedure Save; virtual;abstract;
    function Draw:boolean; overload;virtual;abstract;
    function Draw(DC:HDC;Canvas: TCanvas):boolean; overload;virtual;abstract;
    function DrawLab:boolean; virtual;abstract;
    function ClipDraw(DC:HDC;Rect:TWorldRect;Canvas: TCanvas):boolean;virtual;abstract;
    procedure DrawMetas(DC:HDC); virtual; abstract;
    procedure HighLightSelectedMetas(DC: HDC);virtual;abstract;
    procedure HighLightSelectedMeta(DC: HDC; AMetaIndexID: integer);virtual;abstract;
    procedure SetDataLayer(Value:TCustomDataLayer);virtual;
    function DoSelectMeta(const SelectType:TSelectType;const AddType:TSelectAddType;
    const ObjectSelectType:Integer):Boolean;virtual;abstract;
    function DoSelectEntityMeta(const SelectType:TSelectType;const AddType:TSelectAddType;
    const ObjectSelectType:Integer):Boolean;virtual;abstract;
    function SelectMeta(const SelectType:TSelectType;const AddType:TSelectAddType;
    const ObjectSelectType:Integer):Boolean;virtual;abstract;
    procedure InvertSelectedMeta;virtual;abstract;
    function SelectEntityMeta(const SelectType:TSelectType;const AddType:TSelectAddType;
      const ObjectSelectType:Integer):Boolean;virtual;abstract;
    function DoSelectSourceMeta(const SelectType:TSelectType;
      const AddType:TSelectAddType;IntegerList:TYIntegerList;
      ObjectSelectType:Integer):Boolean;virtual;abstract;
    function GetWorldOutBox: TWorldRect; virtual;
    procedure ClearLabelAnchor(const AMetaIndex:Integer);overload;virtual;abstract;
    procedure ClearLabelAnchor;overload;virtual;abstract;
    procedure SetState(Value: TLayerStates);override;
    function IsShowDialogControl(const ADialogType:Integer):Boolean;virtual;
  public
    constructor Create;override;
    destructor Destroy; override;
    class function GetIdentification:longword;override;
    property Data:TCustomDataLayer read FData Write SetDataLayer;
    property SelectedMeta:TYIntegerList read FSelectedMeta Write FSelectedMeta;
    property MetaInScreen:TYIntegerList read FMetaInScreen write FMetaInScreen;
    property Map:TCustomMap read FMap write FMap;
    property EntityMeta:TYIntegerList read FEntityMeta Write FEntityMeta;
    property MovingDraw:boolean read FMovingDraw write FMovingDraw;
    property OnFilterMeta : TFilterMetaMethod read FOnFilterMeta Write FOnFilterMeta;
    property Outbox:TWorldRect read GetWorldOutBox;
    property LabelFont:TTrueFontStruct read FLabelFont write FLabelFont;
  end;

  TDrawLayer = class (TCustomDrawLayer)
  private
    FStrList:TStringList;
    FBitmaps:TBitmapObjList;
    //记录上画此图层要多少毫秒
    FDrawTime:integer;

    function DrawMeta(DC: HDC; AMeta:PMetaStruct;Canvas: TCanvas):boolean;//画某一个元数(如:符号,线段,矩形,圆角矩形...)
//    procedure InnerDrawSymbol(DC: HDC; ATyoSymbol: TSymbolStruct);overload;
    procedure InnerDrawSymbol(DC: HDC; ATyoSymbol: TWorldSymbol);//overload;

    procedure InnerDrawText(DC: HDC; ATextWorldOutBox: TWorldRect;AText: TWorldText);
    procedure DrawLabel(DC: HDC; Meta:PMetaStruct;MetaIndex:integer);
  protected
    function DoSelectMeta(const SelectType:TSelectType;
      const AddType:TSelectAddType;const ObjectSelectType:Integer):Boolean;override;
    function DoSelectEntityMeta(const SelectType:TSelectType;
      const AddType:TSelectAddType;const ObjectSelectType:Integer):Boolean;override;
    function DoSelectSourceMeta(const ASelectType:TSelectType;
      const AddType:TSelectAddType;IntegerList:TYIntegerList;
      ObjectSelectType:Integer):Boolean;override;
  public
    constructor Create;override;
    destructor Destroy; override;
    class function GetIdentification:longword;override;
//    procedure ClearLabelText;override;
//    procedure ClearLabelText(const AMetaIndex:Integer);override;
    procedure ClearLabelAnchor(const AMetaIndex:Integer);override;
    procedure ClearLabelAnchor;override;
    procedure Save; override;
    function Draw:boolean; overload;override;
    function Draw(DC:HDC;Canvas: TCanvas):boolean; overload;override;
    function DrawLab:boolean; override;


    function ClipDraw(DC:HDC;Rect:TWorldRect;Canvas: TCanvas):boolean;override;
    procedure ClipRefresh(DC:HDC;Rect:TWorldRect);
    procedure DrawMetas(DC:HDC); override;
    procedure HighLightSelectedMetas(DC: HDC);override;
    procedure HighLightSelectedMeta(DC: HDC; AMetaIndexID: integer);override;
    function SelectMeta(const SelectType:TSelectType;const AddType:TSelectAddType;const ObjectSelectType:Integer):Boolean;override;
    procedure InvertSelectedMeta;override;
    function SelectEntityMeta(const SelectType:TSelectType;const AddType:TSelectAddType;
      const ObjectSelectType:Integer):Boolean;override;
    function IsShowDialogControl(const ADialogType:Integer):Boolean;override;
    function PointInMetaName(var AFindMetaIndex:integer; APoint:TWorldPoint):string;overload;
    function PointInMetaName(APoint:TWorldPoint;AMeteIndex:integer):string;overload;//判断某个点是否在某个图元里. AMeteIndex为这个图层第几个图元
  end;
  TLayerProvider = class(TBasicObj)
  private
    FCount : Integer;
    FDataLayers : TCustomDataLayers;
    //FConnection:TCustomConnection;
    //FADOConnection: TAdoConnection;
    FOnCloseLayer: TMessageEvent;
{$IFDEF DESIGN}
    FOnLayerOutBoxChanged: TMessageEvent;
{$ENDIF}
    procedure EditLayerOutboxChange(Sender:TObject);
//    procedure SetADOConnection(const Value: TADoConnection);
  protected
    function InternalNewLayer(ANewLayer:TCustomDataLayer):Integer;overload;virtual;
    procedure SetConnection(Connection:TCustomConnection);virtual;
    procedure BuildShowName(AIndex:Integer);virtual;
    function VerifyFileName(AFileName:string):Integer;virtual;
    function VerifyShowName(AShowName: TGisShortName):Integer;virtual;
    procedure InitNewLayer(NewLayerIndex:Integer);virtual;
    procedure DoDealMsgEvent(Sender:TObject;MsgID:Integer;Param:TGisParams);override;
    procedure SetLayerProvider(ALayer:TCustomDataLayer);virtual;
    property DataLayers : TCustomDataLayers read FDataLayers;
  public
    constructor Create;override;
    destructor Destroy; override;
    procedure LayerClose(Sender:TObject);
    function AddLayerFromFile (AFileName : string;const ProjectionType:Integer=-1) : Integer; virtual;
    function GetLayerIndexByShowName(AShowName: TGisShortName):Integer;virtual;
    function GetLayerFromIndex (AIndex : Integer) : TCustomDataLayer; virtual;
    function GetLayerByShowName(AShowName: TGisShortName):TCustomDataLayer; virtual;
    function GetLayerIndexByID(AID:Longword):Integer;
    function GetLayerFromFile (AFileName:string):TCustomDataLayer;virtual;
    function AddLayer (Layer : TCustomDataLayer) : Integer; virtual;
    procedure RemoveLayer (AIndex : Integer);overload; virtual;
    procedure RemoveLayer (AShowName : String);overload; virtual;
    procedure RemoveLayer (AID:Longword);overload; virtual;
    procedure RemoveLayerByFileName (AFileName : String); virtual;
    function AddNew(const NewFileName:string): Integer; virtual;
    procedure SaveLayer(AIndex:Integer);overload;virtual;
    procedure SaveLayerAs(AIndex:Integer;AFileName:string);overload;virtual;
    procedure SaveLayer(AShowName: TGisShortName);overload;virtual;
    procedure SaveLayerAs(AShowName:TGisShortName;AFileName:string);overload;virtual;
    function LayerByShowName(AShowName:TGisShortName):TCustomDataLayer;virtual;
    function LayerByFileName(AFileName:string):TCustomDataLayer;virtual;
    property Count : Integer read FCount;
    //property Connection:TCustomConnection read FConnection Write SetConnection;
    //property ADOConnection:TAdoConnection read FADOConnection Write SetADOConnection;
    property OnCloseLayer:TMessageEvent read FOnCloseLayer Write FOnCloseLayer;
{$IFDEF DESIGN}
    property OnLayerOutboxChanged:TMessageEvent read FOnLayerOutBoxChanged
      Write FOnLayerOutBoxChanged;
{$ENDIF}
  end;

  TLayers = class(TBasicObj)
  private
    FOnLayerWillChanged: TMessageEvent;
    FOnLayerChanged: TMessageEvent;
    function GetLayer(Index: Integer): TDrawLayer;
    function ChecklayerByDataID(AIndex: Integer; DataID: Longword):Boolean;
  protected
    FMap:TCustomMap;
    FInc:integer;
    FCount : Integer;
    FLayers : TDrawLayers;
    procedure DoBeforeAddLayer;virtual;
    procedure DoAfterAddLayer(AIndex:Integer);virtual;
    procedure DoBeforeCloseLayer(AIndex:Integer);virtual;
    procedure DoAfterCloseLayer(AID:Longword);virtual;
    procedure DoOnLayerClose(Sender: TObject);virtual;
  public
    constructor Create(Map:TCustomMap);virtual;
    destructor Destroy; override;
    function  AddLayer:integer; virtual;
    function  AddLayerWithLayer(NewLayer: TDrawLayer): integer;
    procedure SetOrder(ALayerIndex:integer;AZorder:integer);overload;
    procedure SetOrder(ADrawLayer:TDrawLayer;AZorder:integer);overload;
    procedure SwichOrder(AID1:integer;AID2:integer);
    procedure CloseLayer(AIndex:integer);virtual;
    procedure CloseLayerbyID(AID:Longword);virtual;
    procedure CloseLayerByDataID(ADataID: Longword);virtual;
    procedure CloseAllLayers;
    function AddLayerWithProvider(AProvider: TCustomDataLayer):integer;
    function GetLayerByIndex(AIndex: integer): TDrawLayer;
    function GetLayerIndexByShowName(AShowName:TGisShortName):Integer;
    function GetLayerIndexByID(AID:Longword):Integer;
    function GetLayerByID(const AID:Longword):TDrawLayer;
    function GetLayerCountByFlag(AFlag:TLayerState):Integer;
    procedure Draw(Map:TCustomMap); //dxf add 2007-3-1
    procedure ClipDraw(Map:TCustomMap;Rect: TWorldRect);
    property Layers:TDrawLayers read FLayers;
    property Count:Integer read FCount Write FCount;
    property Layer[Index:Integer]:TDrawLayer read GetLayer;
    property OnLayerWillChanged:TMessageEvent read FOnLayerWillChanged Write FOnLayerWillChanged;
    property OnLayerChanged:TMessageEvent read FOnLayerChanged Write FOnLayerChanged;
  end;

  TSuperControl=class(TCustomControl)
  private
    FOnMsgEvent: TMessageEvent;
    procedure SetOnMsgEvent(const Value: TMessageEvent);
  protected
    procedure DoMsgEvent(Sender:TObject;MsgID:Integer;Param:TGisParams);virtual;
    procedure DoDealMsgEvent(Sender:TObject;MsgID:Integer;Param:TGisParams);virtual;abstract;
  public
    constructor Create(AOwner: TComponent);override;
  published
    property Canvas;
    property OnMouseMove;
    property OnMouseDown;
    property OnMouseUp;
    property Color;
    property OnMsgEvent:TMessageEvent read FOnMsgEvent Write SetOnMsgEvent;
    //
    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnStartDock;
    property OnStartDrag;
    //
  end;
  TCustomMap=class(TSuperControl)
  private
    FCurrentAction:Integer;
    FSelection: TSelection;
    FOption:TMapOptions;
    FLayerProvider:TLayerProvider;
    FLayers : TLayers;

    FTmpBitmapChanged:boolean;
    FIsDrawing:boolean;
    FactuallyPaint:boolean;
    FPainting:boolean;
    FDrawCood : TDrawCood;
    FProjection:TProjection;
    FMeasure:TMeasure;
    FDebug :TErrorLog;
    //{$IFDEF LABEL}
    FLabelRectXList: TIntegerList;
    FLabelRectYList: TIntegerList;
    FLabelRectList: TIntegerList;
    FLabelRectArray:array of TRect;
    FLabelRectArrayCount:integer;
    FLabelRectArrayPoint:integer;
   // {$ENDIF}
    FSelectSourceMeta: TMetaStruct;
    FOnMapRefreshed:TNotifyEvent;
    FOnClose:TNotifyEvent;
    FAllowPaint: boolean;
    FID: Longword;
    FOnMapBeforeChanged: TMessageEvent;
    FOnMapAfterChanged: TMessageEvent;
    FDisplayScale: boolean;
    FHightLightBrush: TBrushStruct;
    FHightLightPen: TPenStruct;
    FHasProjection: boolean;
    FLabelFont: TTrueFontStruct;
    procedure SetSelection(const Value: TSelection);
    procedure SetLayerProvider(const Value: TLayerProvider);
    procedure SetOption(const Value: TMapOptions);
    procedure SetSelectSourceMeta(const Value: TMetaStruct);
    procedure SetAllowPaint(const Value: boolean);
    procedure ProjectionTypeChg(Sender:TObject);
    procedure SetDisplayScale(const Value: boolean);
    function GetWorldOutBox: TWorldRect;
    procedure SetHightLightBrush(const Value: TBrushStruct);
    procedure SetHightLightPen(const Value: TPenStruct);
    procedure SetHasProjection(const Value: boolean);
//    function GetEarthOutbox: TWorldRect;
    procedure SetLabelFont(const Value: TTrueFontStruct);
  protected
    FScreenBitmap : TBitmap;
    FDrawBitmap : TBitmap;
    FTmpBitmap : TBitmap;

    procedure DrawCoodWorldWillChange(Sender:TObject;
      WorldRect:TWorldRect;var Change:Boolean);virtual;
    procedure DrawCoodWorldChanged(Sender:TObject;
      WorldRect:TWorldRect);virtual;
    procedure DrawCoodScalueChanged(Sender:TObject;const AnOldScale,ANewScale:Double);virtual;
    procedure Paint;override;
    procedure PaintRect(Rect:TRect);virtual;
    procedure OffsetPaint(XPixels,YPixels:integer;XPixelsOff,YPixelsOff:integer);virtual;
    procedure SetCurrentAction(AAction:Integer);virtual;
    procedure DoOffsetPaint(XPixels, YPixels, XPixelsOff,
      YPixelsOff: integer);virtual;
    procedure DoPaint;virtual;
    procedure DoBeforeDrawScreen;virtual;
    procedure DoAfterDrawScreen;virtual;
    procedure DoPaintRect(Rect:TRect);virtual;
    procedure DoLayersAfterChanged;virtual;
    property MouseAction:Integer read FCurrentAction Write SetCurrentAction;
    property Selection:TSelection read FSelection Write SetSelection;
    property Measure:TMeasure read FMeasure;
    property Option:TMapOptions read FOption Write SetOption;
    property LayerProvider:TLayerProvider read FLayerProvider Write SetLayerProvider;
    property SelectSourceMeta:TMetaStruct read FSelectSourceMeta Write SetSelectSourceMeta;
    property AllowPaint:boolean read FAllowPaint write SetAllowPaint;
    procedure DoClose;
    procedure LayersLayerBeforeChanged(Sender:TObject;MsgID:Integer;Param:TGisParams);virtual;
    procedure LayersLayerAfterChanged(Sender:TObject;MsgID:Integer;Param:TGisParams);virtual;
    procedure DoDealMsgEvent(Sender:TObject;MsgID:Integer;Param:TGisParams);override;
    function AllowOperate(const AnOperate:Integer;AShowMessage:Boolean):Boolean;virtual;abstract;
  public
    PBar:TProgressBar;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Close;virtual;
    procedure LoadFromFile(ALayerFileName: string);virtual;abstract;
    procedure Draw; virtual;abstract;
    procedure ClipDraw(Rect:TWorldRect); virtual;abstract;
    procedure ClipRefresh(Rect:TWorldRect); virtual;abstract;
    procedure Offset(XPixels,YPixels:integer);virtual;abstract;
    procedure Zoom(AScale: Double);overload;virtual;abstract;
    procedure Zoom(AScale: Double;Worldpoint:TWorldPoint);overload;virtual;abstract;
    procedure Zoom(WorldRect:TWorldRect);overload;virtual;abstract;
    procedure MapCentre;virtual;abstract;
    procedure CenterAtScreen(ScreenPoint:TPoint);virtual;abstract;
    procedure CenterAtWorld(WorldPoint:TWorldPoint);virtual;abstract;
    function GetProvider:TLayerProvider;virtual;abstract;
    procedure SetProvider(Provider:TLayerProvider);virtual;abstract;
    procedure ClearScreenBitmap;
    procedure ClearDrawBitmap;
    procedure ClearTmpBitmap;
    procedure RefreshScreenBitmap;
    property Outbox:TWorldRect read GetWorldOutBox ;//Write FWorldOutBox;
   // property  Outbox :TEarthRect read GetOutbox;
    procedure SaveScreenToBitmap(AFileName:string);
    procedure SaveScreenToJpeg(AFileName:string;Quality:byte);
    procedure SaveScreenToGif(AFileName:string);
    procedure SaveScreenToGifs(AFileName:string;PartCount:integer);
    procedure PrintMap;virtual;
    procedure PrintRectToPage(ARect: TWorldRect);
    procedure PrintScreen;
    procedure PaintTo(ADC:HDC);
    property TmpBitmap : TBitmap read FTmpBitmap Write FTmpBitmap;
    property TmpBitmapChanged:Boolean read FTmpBitmapChanged Write FTmpBitmapChanged;
    property DrawCood : TDrawCood read FDrawCood Write FDrawCood;
    property Projection:TProjection read FProjection Write FProjection;
    property Layers:TLayers read FLayers Write FLayers;
    property ID:Longword read FID;
    property OnMapRefreshed:TNotifyEvent read FOnMapRefreshed write FOnMapRefreshed;
    property MouseCapture;
    property OnClose:TNotifyEvent read FOnClose Write FOnClose;
    property OnMapBeforeChanged:TMessageEvent read FOnMapBeforeChanged Write FOnMapBeforeChanged;
    property OnMapAfterChanged:TMessageEvent read FOnMapAfterChanged Write FOnMapAfterChanged;
    property DisplayScale:boolean read FDisplayScale write SetDisplayScale;
    property HightLightBrush :TBrushStruct read FHightLightBrush write SetHightLightBrush;
    property HightLightPen : TPenStruct read FHightLightPen write SetHightLightPen;
    property HasProjection:boolean read FHasProjection write SetHasProjection;
    property LabelFont:TTrueFontStruct read FLabelFont write SetLabelFont;
    property ScreenBitmap:TBitmap read FScreenBitmap; 
  end;
  TMap = class (TCustomMap)
  private
    FScale:TScale;

  protected
    procedure SetCurrentAction(AAction:Integer);override;
    procedure DrawThreadDone(Sender: TObject);
    procedure DoPaint;override;
    procedure LayersLayerBeforeChanged(Sender:TObject;MsgID:Integer;Param:TGisParams);override;
    procedure LayersLayerAfterChanged(Sender:TObject;MsgID:Integer;Param:TGisParams);override;
    function AllowOperate(const AnOperate:Integer;AShowMessage:Boolean):Boolean;override;
  public

    constructor Create(AOwner: TComponent; Provider: TLayerProvider);virtual;
    destructor Destroy;override;
    procedure LoadFromFile(ALayerFileName: string);override;
    procedure Offset(XPixels,YPixels:integer);override;
    procedure Zoom(AScale: Double);overload;override;
    procedure Zoom(AScale: Double;Worldpoint:TWorldPoint);overload;override;
    procedure Zoom(WorldRect:TWorldRect);overload;override;
    procedure ZoomAt(ANewScale: Double;Worldpoint:TWorldPoint);
    procedure CenterAtScreen(ScreenPoint: TPoint);override;
    procedure MoveToCenter;
    procedure CenterAtWorld(WorldPoint:TWorldPoint);override;
    procedure MapCentre;override;
    procedure SetProvider(Provider:TLayerProvider);override;
    function GetProvider:TLayerProvider;override;
    procedure Draw;override;
    procedure ReDrawByDataLayer(ADataLayerID: Longword);virtual;
    procedure ClipDraw(Rect: TWorldRect);override;
    procedure ClearLabelText(const ADataLayerID: Longword;const AMetaIndex: Integer);overload;
    procedure ClearLabelText(const ADataLayerID:Longword);overload;
    procedure ClearLabelAnchor(const ADataLayerID: Longword;AMetaIndexs: TIntegerDynArray);
    procedure ClipRefresh(Rect:TWorldRect);override;
    property SelectSourceMeta;
  end;
{$IFDEF ForTestUser}
  function GetFileID(const AFileName: string): Longword;
  function UserReged: boolean;
{$endif}
implementation
uses
  emapdex,
  //GisEditDrawLayer,
  RunData,
  //mdaset,
  MathCalc,
  ClipCalc,
  printers,
  projectors,
  jpeg,
  GifImage,
  DateUtils
{$IFDEF ForTestUser}
  ,GetIdeNumUnit
{$endif}
  ;
const
  BUFFER_INC_SIZE=1024*8; //8K


{$IFDEF ForTestUser}
function UserReged: boolean;
var
//  dlgReg:TFrmUserReg;
  reg  :TRegistry;
  ideNum,zcxx :string;
  zcbj:boolean;
begin
  result:= false;
  zcbj := false;
  reg:= TRegistry.Create;
  try
    //取注册表中值
    
    reg.RootKey := HKEY_LOCAL_MACHINE;
    if reg.KeyExists('\software\njty\monitor') then
    begin
      reg.OpenKey('\software\njty\monitor',true);
      zcxx := reg.ReadString('zch');
      ideNum := GetZch(Trim(GetEncryNum));
      if zcxx= ideNum then
      begin
//        zcbj := true;
        result:= true;
        exit;
      end;
    end;
    { if not zcbj then
    begin
      //如果还没注册，则弹出注册窗体
     dlgReg:= TFrmUserReg.Create(self);
      try
        dlgreg.EditBack.Text := Trim(GetEncryNum);
        dlgReg.ShowModal;
        if dlgReg.ModalResult= mrOk then
        begin
          //写入注册表
          if reg.CreateKey('\software\njty\monitor') then
          begin
            reg.OpenKey('\software\njty\monitor',true);
            reg.WriteString('zch',trim(dlgReg.EditZc.Text));
          end;
          result:=true;
        end;
      finally
        dlgReg.Free;
      end;
    end;   }
  finally
    reg.CloseKey;
    reg.Free;
  end;
end;
{$endif}

function GetFileID(const AFileName: string): Longword;               
var
  openFile: TFileStream;
  fileHead: TFileHead;
begin
  Result:=0;
  openFile := TFileStream.Create(AFileName,fmOpenRead);
  try
    openFile.read(fileHead,SizeOf(fileHead));
    if fileHead.Identification = 1 then
      Result:=TDataLayer.GetIdentification
  finally
    openFile.Free;
  end;
end;

constructor TCustomDataLayer.Create;
begin
  inherited Create;
  FIdentification := GetIdentification;
  FProjectionType := 1;
//  FFlexMetas := TFlexDataManage.Create;
//  FFlexMetas.OnRequireFlexData := Self.OpenFlexFile;
  FMetaCount := 0;
  FMaxMetaID := 1;
  FMetaStructSize:=SizeOf(TMetaStruct);
end;

destructor TCustomDataLayer.Destroy;
begin
//  FFlexMetas.Free;
  inherited Destroy;
end;

procedure TDataLayer.LoadFromFile (AFileName : String;
  const AProjectionType:Integer=-1);
begin
  FFileName := ExpandFileName(AFileName);
  FLayerName := ChangeFileExt(ExtractFileName(FFileName),'');
  FMemMapFile := TMemMapFile.Create(FFileName,fmOpenRead,0,True);
  LoadIndex;
  //InitAddress;
//  LoadStatic;
//  OpenFlexFile(ProjectionType);
//  if FDataSetType = _Local then loadDataset;
  Include(FState,lyVisible);
  Include(FState,lySelect);
  Include(FState,lyLabel);
  //Include(FState,lyMetaScale);
end;

procedure TDataLayer.ReLoadFromFile;
begin
  FMemMapFile.Free;
  FMemMapFile := TMemMapFile.Create(FFileName,fmOpenRead,0,True);
  LoadIndex;
end;


constructor TDataLayer.Create;
begin
  inherited Create;
  FIdentification:=GetIdentification;

end;

destructor TDataLayer.Destroy;
begin
//  if FDataSet<>nil then FDataSet.Free;
  if FMemMapFile <> nil then FMemMapFile.Free;
  inherited Destroy;
end;

{procedure TDataLayer.SaveAs (AFileName : String);
var
  DatFileName:string; 
begin                 }
(*
  if CopyFile(Pchar(FileName),Pchar(AFileName),False) then
  begin
    DatFileName:=Copy(AFileName,1,Length(AFileName)-4)+Layerdat_Ext;
    SaveIndex(AFileName);
    SaveDataset(DatFileName);
  end else
    Raise ESaveFileFailed.Create;
  
end; *)

procedure TDataLayer.SetDetailIgnore(APixels:integer);
{var
  i:integer;
  pMetaFix:PEarthMeta; }
begin
{  for i:=0 to MetaCount-1 do
  begin
    pMetaFix:=GetFixMetaPointer(i);
    pMetaFix^.MinScale:=GeometryCalc.MetaIgnore_Rect(pMetaFix^.Outbox,APixels);
  end;   }
end;


function TCustomDrawLayer.PrjType: integer;
begin
  Result:=FMap.Projection.ProjectionType;
end;

constructor TCustomDrawLayer.Create;
begin
  inherited;
  FIdentification:=33;
  SetLength(FDataBuffer,20000);//初始化绘图缓冲区的尺寸
  FselectedMeta:=TYIntegerList.Create;
  FEntityMeta:=TYIntegerList.Create;
  FMetaInScreen:=TYIntegerList.Create;
  FMetasWillDraw:=TYIntegerList.Create;
  FCustomSymbols:=TCustomSymbols.Create;

  FMovingDraw:=false;
  SetIdentification(GetIdentification);
  FLabelFont.Size:=10;
  FLabelFont.Transparent:=1;
  FLabelFont.ForeColor:=clBlack;
  FLabelFont.Rotation:=0;
end;

destructor TCustomDrawLayer.Destroy;
begin
  FselectedMeta.Free;
  FEntityMeta.Free;
  FMetaInScreen.Free;
  FMetasWillDraw.Free;
  FCustomSymbols.Free;
end;

constructor TDrawLayer.Create;
begin
  inherited Create;
  FIdentification:=GetIdentification;
  FStrList:=TStringList.Create;
  FBitmaps:=TBitmapObjList.Create;
end;

destructor TDrawLayer.Destroy;
begin
  FStrList.Free;
  FBitmaps.Free;
  inherited;
end;

function TCustomDrawLayer.GetWorldOutBox: TWorldRect;
begin
  Result:=FData.FOutBox// .GetDataByParam(
    //Map.Projection.ProjectionType).WorldOutBox;
end;

function TDrawLayer.Draw:boolean;
begin
  Result:=false;
try
    if lyVisible in State then
    begin
          try
              Map.FDrawBitmap.Canvas.lock;
              try
                  Result:=Draw(Map.FDrawBitmap.Canvas.Handle,Map.FDrawBitmap.Canvas);
              finally
                  Map.FDrawBitmap.Canvas.unlock;
              end;
          except  on E: Exception do
              elog.SystemLog.AddLog(' TDrawLayer.Draw1 ',Self.Data.FileName+' '+e.Message);
          end;
{          try
              Map.FDrawBitmap.Canvas.lock;
              try
                  HighLightSelectedMetas(Map.TmpBitmap.Canvas.handle);
              finally
                  Map.FDrawBitmap.Canvas.unlock;
              end;
          except  on E: Exception do
              elog.SystemLog.AddLog(DatetimeToStr(now)+
                                         ' TDrawLayer.Draw2 '+
                                         Self.Data.FileName+' '+
                                         e.Message);
          end;  }
    end;
except  on E: Exception do
    elog.SystemLog.AddLog(' TDrawLayer.Draw3 ',Self.Data.FileName+' '+e.Message);
end;
end;

function TDrawLayer.DrawLab: boolean;
begin
  Result:=false;
  try
      if lyVisible in State then
      begin
            try
                Map.FDrawBitmap.Canvas.lock;
                try
                    DrawMetas(Map.FDrawBitmap.Canvas.Handle);
                finally
                    Map.FDrawBitmap.Canvas.unlock;
                end;
            except  on E: Exception do
                elog.SystemLog.AddLog(' TDrawLayer.DrawLab1 ',Self.Data.FileName+' '+e.Message);
            end;
      end;
  except  on E: Exception do
      elog.SystemLog.AddLog(' TDrawLayer.DrawLab3 ',Self.Data.FileName+' '+e.Message);
  end;
end;


function TDrawLayer.Draw(DC: HDC;Canvas: TCanvas):boolean;
var
  b,e:longword;
begin
   b:=GetTickCount;
   Result:=ClipDraw(DC,WorldRect(0,0,0,0),Canvas);

   e:=GetTickCount;
   FDrawTime:=e-b; //算出此图片层画需要多少毫秒.
end;

function TDrawLayer.ClipDraw(DC: HDC; Rect: TWorldRect;Canvas: TCanvas):boolean;//返回是否画此层:TRUE为画
var
  i:integer;
  Meta:PMetaStruct;
  flag:boolean;
begin
try
      Result:=false;
      FMetaInScreen.Clear;
      FMetasWillDraw.Clear;
      if not (lyVisible in FState) then exit;
      if EnableScaleLimit and((FMaxScale<FMap.FDrawCood.Scale) or (FMinScale>FMap.FDrawCood.Scale))
          then exit;
      if not GeometryCalc.RectAcross(Outbox,FMap.FDrawCood.WorldRect)
          then exit;
      Result:=true;
      for i:=0 to FData.FMetaCount-1 do
      begin
          Meta:=FData.Metas[i];// (i{,Map.Projection.ProjectionType});
          //if (not Meta.Enabled) //or (FData.FDynMetas[i].Delete) dxf  2007-07-20  认为没有必要,就删除了.
          //    then Continue;
          {if (lyMetaScale in State) and Meta.PEarth^.ScaleLimit and
             (Meta.PEarth^.MinScale < FMap.FDrawCood.Scale) then
          begin
              flag := True;
              Continue;
          end; }
          {if Assigned(OnFilterMeta) then
          begin
              //OnFilterMeta(Meta,flag);
              if flag then continue;
          end;  }
          if not GeometryCalc.RectAcross(Meta.Outbox,FMap.FDrawCood.WorldRect) then
          begin
              Continue;
          end;
          FMetaInScreen.Add(i);
          if GeometryCalc.RectInRect(Meta.Outbox,Rect)
              then Continue;
          FMetasWillDraw.Add(i);
          if not DrawMeta(DC,Meta,Canvas) then exit; //2007-07-24 一但某个图元画失败了,此图层就不画了.
      end;
      //DrawMetas(DC);
      if (FSelectedMeta.Count>0) then
      begin
          HighLightSelectedMetas(FMap.FTmpBitmap.canvas.handle);
          FMap.FTmpBitmapChanged:=True;
      end;
except  on E: Exception do
    elog.SystemLog.AddLog(' TDrawLayer.ClipDraw ',Self.Data.FileName+' '+e.Message);
end;
end;

procedure TDrawLayer.ClipRefresh(DC:HDC;Rect: TWorldRect);
var
  i:integer;
  Meta:PMetaStruct;
  flag:boolean;
begin
try
      FMetaInScreen.Clear;
      FMetasWillDraw.Clear;
      if not (lyVisible in FState) then exit;
      if EnableScaleLimit and((FMaxScale<FMap.FDrawCood.Scale) or (FMinScale>FMap.FDrawCood.Scale))
        then exit;
      if not GeometryCalc.RectAcross(Outbox,FMap.FDrawCood.WorldRect)
        then exit;
      for i:=0 to FData.FMetaCount-1 do
      begin

        Meta:=FData.Metas[i];//(i{,Map.Projection.ProjectionType});

        if (not Meta.Enabled) //or (FData.FDynMetas[i].Delete)
          then Continue;

        if (lyMetaScale in State) {and pMeta.PEarth^.ScaleLimit and
           (pMeta.PEarth^.MinScale < Map.FDrawCood.Scale) }then
        begin
          Continue;
        end;
        if Assigned(OnFilterMeta) then
        begin
          //OnFilterMeta(pMeta,flag);
          if flag then continue;
        end;
        if not GeometryCalc.RectAcross(Meta.Outbox,Map.FDrawCood.WorldRect) then
        begin
          Continue;
        end;
        MetaInScreen.Add(i);
        if GeometryCalc.RectInRect(Meta.Outbox,Rect) or
           GeometryCalc.RectAcross(Meta.Outbox,Rect) then
          FMetasWillDraw.Add(i);
      end;

      DrawMetas(DC);

except  on E: Exception do
    elog.SystemLog.AddLog(' TDrawLayer.ClipRefresh ',
                               Self.Data.FileName+' '+
                               e.Message);
end;
end;

procedure TDrawLayer.DrawMetas(DC:HDC);
var
  i:integer;
  oldPen:HPen;
  oldBrush:HBrush;
//  rect:TWorldRect;
//  newPen:TPenStruct;
//  Meta:TWorldMeta;
  MetaIndex:integer;
  {$IFOPT D+}
  t: Longword;
  {$ENDIF}
begin
try
    if  not(lyLabel in  Self.State)then
        exit;
    GraphDraw.SaveGDI(DC,oldPen,oldBrush);
//    if not (FMovingDraw and (mpMvNotDrawLabel in FMap.FOption)) then
    begin
        for i:=0 to FMetasWillDraw.Count-1 do
        begin
            MetaIndex:=FMetasWillDraw.GetData(i);
            DrawLabel(DC,Fdata.Metas[MetaIndex],MetaIndex);
        end;
    end;


{    if RuntimeData.DebugMode then
    begin
      //map 的外包矩形
      newPen.color:=clBlue;
      newPen.Width:=4;
      newPen.Pattern:=CU_PS_SOLID;
      rect.TopLeft:=Map.DrawCood.ConvertSP(Map.Outbox.TopLeft);
      rect.BottomRight:=Map.DrawCood.ConvertSP(Map.Outbox.BottomRight);
      GraphDraw.SetPen(DC,newPen);
      GraphDraw.DrawFrameBox(DC,TRect(rect));
      //map的投影对象的最大外包矩形
      newPen.color:=clred;
      newPen.Width:=4;
      newPen.Pattern:=CU_PS_SOLID;
      rect.TopLeft:=Map.DrawCood.ConvertSP(Map.DrawCood.MaxWorldRect.TopLeft);
      rect.BottomRight:=Map.DrawCood.ConvertSP(Map.DrawCood.MaxWorldRect.BottomRight);
      GraphDraw.SetPen(DC,newPen);
      GraphDraw.DrawFrameBox(DC,TRect(rect));
      //map的投影对象的初始化外包矩形
      newPen.color:=clBlack;
      newPen.Width:=4;
      newPen.Pattern:=CU_PS_SOLID;
      rect.TopLeft:=Map.DrawCood.ConvertSP(Map.Projection.InitWorldRect.TopLeft);
      rect.BottomRight:=Map.DrawCood.ConvertSP(Map.Projection.InitWorldRect.BottomRight);
      GraphDraw.SetPen(DC,newPen);
      GraphDraw.DrawFrameBox(DC,TRect(rect));
      //图层的外包矩形
      newPen.color:=clLime ;
      newPen.Width:=2;
      rect.TopLeft:=Map.DrawCood.ConvertSP(Outbox.TopLeft);
      rect.BottomRight:=Map.DrawCood.ConvertSP(Outbox.BottomRight);
      GraphDraw.SetPen(DC,newPen);
      GraphDraw.DrawFrameBox(DC,TRect(rect));
    end;   }
    GraphDraw.ReStoreGDI(DC,oldPen,oldBrush);
except  on E: Exception do
    elog.SystemLog.AddLog(' TDrawLayer.DrawMetas ',
                               Self.Data.FileName+' '+
                               e.Message);
end;
end;

{procedure TDrawLayer.InnerDrawSymbol(DC: HDC;ATyoSymbol: TSymbolStruct);
var
  position:TPoint;
//  rect,srcRect:TRect;
//  fontHeight,fontHeightDiv2:integer;
begin
  position:=FMap.FDrawCood.ConvertSP(ATyoSymbol.Position);
  //GraphDraw.DrawSymbol(DC,ATyoSymbol,position);
end; }

procedure TDrawLayer.InnerDrawSymbol(DC: HDC; ATyoSymbol: TWorldSymbol);
var
  position:TPoint;
//  rect,srcRect:TRect;
//  fontHeight,fontHeightDiv2:integer;
begin
  position:=FMap.FDrawCood.ConvertSP(ATyoSymbol.Position);
  GraphDraw.DrawSymbol(DC,ATyoSymbol,position);
end;

procedure TDrawLayer.InnerDrawText(DC:HDC;ATextWorldOutBox:TWorldRect;AText: TWorldText);
var
  oldFont:HFont;//currentfont,
  str:string;
//  rect:TRect;
  sp:TPoint;
  hi_of_text,width_of_text:integer;//单个字符的高度宽度
  i:integer;
begin
  Setlength(str,AText.Length);
 // if AText.Address<=0 then  Exit;
  CopyMemory(@str[1],Pointer(AText.Address+Data.StaticStart),AText.Length);
  if str='' then Exit;
  AText.Font.Rotation:=AText.Angle;

  GisSystem.GetWidthHeigthOfText(AText.SP ,AText.EP,AText.MaxCols,AText.Rows,width_of_text,hi_of_text);

  width_of_text:=Round(width_of_text/FMap.FDrawCood.GetRealscale);
  hi_of_text:=Round(hi_of_text/FMap.FDrawCood.GetRealscale);

  if (hi_of_text<6) and (mpIgnorSmallFont in Map.Option)  then Exit;//字太小忽略

  if hi_of_text>=255 then  //字体的最大值 Size的类型为Byte;
    AText.Font.Size:=255
  else
    AText.Font.Size:=hi_of_text;

  sp:=FMap.FDrawCood.ConvertSP(AText.SP);
  oldFont:=GraphDraw.SetFontByHeight(AText.Font,DC);

  if AText.Rows=1 then
    TextOut(DC,sp.x,sp.y,Pchar(str),Length(str))
  else if AText.Rows>1 then
  begin
    FStrList.Text:=str;
    for i:=0 to FStrList.Count-1 do
    begin
      TextOut(DC,sp.x,sp.y,Pchar(FStrList.Strings[i]),Length(FStrList.Strings[i]));
      sp.x:=sp.x+Round(hi_of_text*sin(DegToRad(AText.Angle)));
      sp.y:=sp.y+Round(hi_of_text*cos(DegToRad(AText.Angle)));
    end
  end;
  GraphDraw.delFont(oldFont,DC);
end;

procedure TDrawLayer.DrawLabel(DC: HDC;Meta:PMetaStruct;MetaIndex:integer);
var
  intersectRect:TWorldRect;
  label_center,Top_label_center,Bottom_label_center,Left_label_center,Rigth_label_center:TPoint;
  allow_Top,allow_Bottom,allow_Left,allow_Rigth:boolean;
  r_Top,r_Bottom,r_Left,r_Rigth,ttemp:TRect;

  meta_Label:string;

  allowDrawLabel: Boolean;

  //{$IFDEF LABEL}
  r: TRect;
//  pr: PRect;
  i: Integer;
//  xleft,xright,ytop,ybottom: Integer;
  //{$ENDIF}
  Rotation:Single;
  tempfont:TTrueFontStruct;
begin
try
  allowDrawLabel := True;
  if Meta^.NameLen=0 then exit;

  Setlength(meta_Label,Meta^.NameLen);
  CopyMemory(@meta_Label[1],Pointer(Meta^.NameAddress+Data.NameAddressStart),Meta^.NameLen);
  
  label_center:=GeometryCalc.GetMetaAnchor(Meta,Rotation,Data.StaticStart);

  if (not GeometryCalc.PointInRect(label_center,Map.DrawCood.WorldRect,0.1)) then//不在屏幕中
  begin
      if GeometryCalc.IntersectRect(Meta^.Outbox,Map.DrawCood.WorldRect,intersectRect) then
      begin
          label_center:=GeometryCalc.GetMetaDynAnchor(Meta,intersectRect,Data.StaticStart);
      end
      else
          allowDrawLabel := False; //取相交矩形框失败就退出。
  end;

  if not allowDrawLabel then Exit;


  if Map.FLabelRectArrayPoint>=Map.FLabelRectArrayCount then
  begin
      SetLength(Map.FLabelRectArray,Map.FLabelRectArrayCount+50);
      Map.FLabelRectArrayCount:=Map.FLabelRectArrayCount+50;
  end;

  label_center:=FMap.FDrawCood.ConvertSP(label_center);


  if Meta^._Type=_Symbol then
  begin
      //下面是解决,可以在点的上下左右显示标注.
      //bak_label_center:=label_center;
      Bottom_label_center:=label_center;
      Top_label_center:=label_center;
      Rigth_label_center:=label_center;
      Left_label_center:=label_center;

      Bottom_label_center.y:=label_center.y-Round(GraphDraw.GetFontHeigth(Meta^.Symbol.CustomSymbol.Size)/1.3);
      r_Bottom:=GraphDraw.TyoGetTrueFontRect(meta_Label,LabelFont,Bottom_label_center);

      Top_label_center.Y :=label_center.y+Round(GraphDraw.GetFontHeigth(Meta^.Symbol.CustomSymbol.Size)/1.3);
      r_Top:=GraphDraw.TyoGetTrueFontRect(meta_Label,LabelFont,Top_label_center);

      Rigth_label_center.X:=label_center.x+((r_Bottom.Right-r_Bottom.Left)div 2);
      r_Rigth:=GraphDraw.TyoGetTrueFontRect(meta_Label,LabelFont,Rigth_label_center);

      Left_label_center.X:=label_center.x-((r_Bottom.Right-r_Bottom.Left)div 2);
      r_Left:=GraphDraw.TyoGetTrueFontRect(meta_Label,LabelFont,Left_label_center);

      allow_Top:=true;
      allow_Bottom:=true;
      allow_Left:=true;
      allow_Rigth:=true;

      for i := 0 to FMap.FLabelRectList.Count - 1 do
      begin
          ttemp:=PRect(FMap.FLabelRectList.Datas[i])^;
          if  allow_Bottom then
          begin
              if GeometryCalc.RectAcross(r_Bottom,ttemp) then
              begin
                 allow_Bottom:=false;
              end;
          end;

          if  allow_Top then
          begin
              if GeometryCalc.RectAcross(r_Top,ttemp) then
              begin
                 allow_Top:=false;
              end;
          end;

          if  allow_Rigth then
          begin
              if GeometryCalc.RectAcross(r_Rigth,ttemp) then
              begin
                 allow_Rigth:=false;
              end;
          end;

          if  allow_Left then
          begin
              if GeometryCalc.RectAcross(r_Left,ttemp) then
              begin
                 allow_Left:=false;
              end;
          end;
          if not (allow_Bottom or allow_Top or allow_Rigth or allow_Left) then
          begin
             exit;
          end;
      end;//end for 

      if allow_Bottom then
      begin
         label_center:=Bottom_label_center;
         r:=r_Bottom;
      end
      else
      if allow_Top then
      begin
         label_center:=Top_label_center;
         r:=r_Top;
      end
      else
      if allow_Rigth then
      begin
         label_center:=Rigth_label_center;
         r:=r_Rigth;
      end
      else
      if allow_Left then
      begin
         label_center:=Left_label_center;
         r:=r_Left;
      end;
      //New(pr);
      //pr^ := r;
      //Self.Map.FDrawBitmap.Canvas.Rectangle(r);
      Map.FLabelRectArray[Map.FLabelRectArrayPoint]:=r;
      Inc(Map.FLabelRectArrayPoint);
      FMap.FLabelRectList.AddData(MetaIndex,@Map.FLabelRectArray[Map.FLabelRectArrayPoint]);

      GraphDraw.TyoDrawTrueFont(DC,meta_Label,LabelFont,label_center);
  end
  else if (Meta^._Type=_PolyLine)or(Meta^._Type=_Line) then
  begin
      tempfont:=LabelFont;
      tempfont.Rotation:=Rotation;
      r := GraphDraw.TyoGetTrueFontRect(meta_Label,tempfont,label_center);
      
      if(Rotation>45)or(Rotation<-45)then
      begin
        { Top_label_center.X:=(r.Left+r.Right)div 2;
         Top_label_center.y:=(r.Top+r.Bottom)div 2;

         i:=(r.Bottom-r.Top)div 2;
         r_Top.Left:=Top_label_center.x;//Top_label_center.x-i;
         r_Top.Right:=Top_label_center.x+i;

         i:=(r.Right-r.Left)div 2;
         r_Top.Top:=Top_label_center.y;//Top_label_center.y-i;
         r_Top.Bottom:=Top_label_center.y+i;
         r:=r_Top;      }
         tempfont.FontName:='@'+tempfont.FontName;

      end;
      if  Rotation<>0 then
      begin
         Top_label_center.X:=(r.Left+r.Right)div 2;
         Top_label_center.y:=(r.Top+r.Bottom)div 2;
         i:=(r.Right-r.Left)div 2;

         r_Top.Left:=Top_label_center.x-i;
         r_Top.Right:=Top_label_center.x+i;

         
         r_Top.Top:=Top_label_center.y-i;
         r_Top.Bottom:=Top_label_center.y+i;
         r:=r_Top;

      end;


      for i := 0 to FMap.FLabelRectList.Count - 1 do
      begin
          ttemp:=PRect(FMap.FLabelRectList.Datas[i])^;
          if GeometryCalc.RectAcross(r,ttemp) then
          begin
             exit;
          end;
      end;
      //Self.Map.FDrawBitmap.Canvas.Rectangle(r);

      
      //Self.Map.FDrawBitmap.Canvas.Rectangle(r);
      Map.FLabelRectArray[Map.FLabelRectArrayPoint]:=r;
      Inc(Map.FLabelRectArrayPoint);
      FMap.FLabelRectList.AddData(MetaIndex,@Map.FLabelRectArray[Map.FLabelRectArrayPoint]);
      GraphDraw.TyoDrawTrueFont(DC,meta_Label,tempfont,label_center);
  end
  else
  begin
      r := GraphDraw.TyoGetTrueFontRect(meta_Label,LabelFont,label_center);
      for i := 0 to FMap.FLabelRectList.Count - 1 do
      begin
          ttemp:=PRect(FMap.FLabelRectList.Datas[i])^;
          if GeometryCalc.RectAcross(r,ttemp) then
          begin
             exit;
          end;
      end;
      Map.FLabelRectArray[Map.FLabelRectArrayPoint]:=r;
      Inc(Map.FLabelRectArrayPoint);
      FMap.FLabelRectList.AddData(MetaIndex,@Map.FLabelRectArray[Map.FLabelRectArrayPoint]);
      GraphDraw.TyoDrawTrueFont(DC,meta_Label,LabelFont,label_center);
  end;
  //{$IFOPT D+}SendInteger('draw label count is ',FMap.FLabelRectList.Count);{$ENDIF}
except  on E: Exception do
    elog.SystemLog.AddLog(' TDrawLayer.DrawLabel ',
                               Self.Data.FileName+'->MetaID'+
                               IntToStr(Meta^.ID)+' '+e.Message);
end;
end;

function  TDrawLayer.DrawMeta(DC: HDC;AMeta:PMetaStruct;Canvas: TCanvas):boolean;//画某一个元数(如:符号,线段,矩形,圆角矩形...)

var
  points_count,sizeofbuffer:integer;

  start_point,end_Point:TPoint;

  newCount:integer;
  points:TWorldPointAry;
  subpoly:TIntegerDynArray;
  {$IFDEF DEBUG}
  dots:TWorldPointAry;
  i,j:integer;
  AllinterSects:TIntersectAry;
  icount:integer;
  symbol:TSymbolStruct;
  area:double;
  pen:TPenStruct;
  {$ENDIF}
  //tmppen:TPenStruct;
  procedure SetPen(Pen:TPenStruct);
  begin
                Canvas.Pen.Color:=Pen.color;
                Canvas.Pen.Width:=Pen.Width;
                //if Pen.Pattern=1 then
                //  Canvas.Pen.Style:=psClear
                //else
                  Canvas.Pen.Style:=psSolid;
                //Canvas.Pen.Style:=TPenStyle(Pen.Pattern);
  end;
  
  procedure SetBrush(Brush: TBrushStruct);
  begin
                if Brush.ForeColor<>0 then
                Canvas.Brush.Color:=Brush.ForeColor ;
                if Brush.Pattern=1 then
                begin
                    Canvas.Brush.Style:=bsClear;
                end
                else
                begin
                    Canvas.Brush.Style:=bsSolid;
                end;
                //TBrushStyle(Brush.Pattern);
                {if (Brush.Pattern>2) and (Brush.Pattern<9) then
                begin
                    if Brush.Transparent<>0 then
                      SetBkMode(DC,Transparent)
                    else
                      SetBkMode(DC,OPAQUE);
                    SetBkColor(DC,Brush.BackColor);
                end;  }
  end;
begin

    //===============================================
    //画图 case
    Result:=true;
    case AMeta^._Type of
      _Symbol://符号对象
        begin
          try
              InnerDrawSymbol(DC,AMeta^.Symbol);
          except  on E: Exception do
              elog.SystemLog.AddLog(' InnerDrawSymbol ',
                                         Self.Data.FileName+'->MetaID'+
                                         IntToStr(AMeta^.ID)+' '+e.Message);
          end;
        end;
      _Line://线段对象
        begin
          try
            with AMeta^.Line do
            begin
              start_point:=FMap.FDrawCood.ConvertSP(AMeta^.Line.SP);
              end_point:=FMap.FDrawCood.ConvertSP(AMeta^.Line.EP);
              if GraphDraw.GetPenType(Pen.Pattern)<>WINDOWS_PEN then
              begin
                SetLength(points,2);
                points[0]:=start_point;
                points[1]:=end_point;
                SetLength(subpoly,1);
                subpoly[0]:=2;
                newCount:=1;
                if GisClip.ClipPolyPolyLine(Rect(0,0,Map.DrawCood.ScreenWidth,Map.DrawCood.ScreenHeight),
                  newCount,subpoly,points) then
                GraphDraw.TyoPolyPolyLine(AMeta^.Line.Pen,DC,points,subpoly,newCount);
              end else
              begin
                SetPen(AMeta^.Line.Pen);
                //GraphDraw.SetPen(DC,AMeta^.Line.Pen);

                MoveToEx(DC,start_point.x,start_point.y,nil);
                LineTo(DC,end_point.x,end_point.y);
              end;
            end;
          except  on E: Exception do
              elog.SystemLog.AddLog(' DrawMeta->Line,',
                                         Self.Data.FileName+'->MetaID'+
                                         IntToStr(AMeta^.ID)+' '+e.Message);
          end;
        end;
      _Rect://矩形对象
        begin
         try
             with AMeta^.Rect,AMeta^.Outbox do
             begin
               SetPen(Pen);
               SetBrush(Brush);
               //GraphDraw.SetPen(DC,Pen);
               //GraphDraw.SetBrush(DC,Brush);
               start_point:=FMap.FDrawCood.ConvertSP(AMeta^.Outbox.TopLeft);
               end_point:=FMap.FDrawCood.ConvertSP(AMeta^.Outbox.BottomRight);
               Rectangle(DC,start_point.x,start_point.y,end_point.x,end_point.y);
             end;
          except  on E: Exception do
              elog.SystemLog.AddLog(' DrawMeta->Rect,',
                                         Self.Data.FileName+'->MetaID'+
                                         IntToStr(AMeta^.ID)+' '+e.Message);
          end;
        end;
      _RoundRect://圆角矩形对象
        begin
          try
             with AMeta^.RoundRect,AMeta^.Outbox do
             begin
               SetPen(Pen);
               SetBrush(Brush);
               //GraphDraw.
               //GraphDraw.
               //RoundRect(DC,Left,Top,Right,Bottom);//圆角的角度
             end;
          except  on E: Exception do
              elog.SystemLog.AddLog(' DrawMeta->Rect,',
                                         Self.Data.FileName+'->MetaID'+
                                         IntToStr(AMeta^.ID)+' '+e.Message);
          end;
        end;
      _Polyline://折线对象
        begin
          try
              with AMeta^.Polyline{,AMeta.Polyline} do  // TODO -o吕洪波 : SPWAddress-PWAddress 做了两次计算，应该可以优化
              begin
                points_count:=SPWAddress-PWAddress;
                sizeofbuffer:=Count*sizeof(integer)+points_count;
                if sizeofbuffer<0 then
                begin
                   //sizeofbuffer:=0;
                   exit;
                end;
                if sizeofbuffer>length(FDataBuffer) then //容量不够－扩容
                  SetLength(FDataBuffer,sizeofbuffer+BUFFER_INC_SIZE);

                CopyMemory(@FDataBuffer[0],Pointer(PWAddress+Data.StaticStart),sizeofbuffer);
                FMap.FDrawCood.ConvertSPs(0,points_count div sizeof(TWorldPoint),TWorldPointAry(FDataBuffer)); //坐标变换
               // tmppen:=Pen;
                //tmpPen.Width:=1;
                if GraphDraw.GetPenType(Pen.Pattern)=WINDOWS_PEN then
                begin
                    SetPen(Pen);

                    if Count=1 then
                    begin
                        SetLength(points,points_count div sizeof(TWorldPoint));
                        CopyMemory(@points[0],@FDataBuffer[0],points_count);
                        Canvas.Polyline(points)
                    end
                    else
                    if not polypolyline(DC,FDataBuffer[0],FDataBuffer[points_count div SizeOf(Integer)],count)  then
                    begin
                        Result:=false;
                        elog.SystemLog.AddLog(TDataLayer(Data).FFileName,'Draw Polyline failure MetaID:'+IntToStr(AMeta^.ID));
                        {SetLength(FDataBuffer,0);
                        TDataLayer(Data).ReLoadFromFile;
                        elog.SystemLog.AddLog(TDataLayer(Data).FFileName,'ReLoadFromFile');}
                    end;
                end
                else
                begin
                //测试线型===================================
                  SetLength(points,points_count div sizeof(TWorldPoint));
                  CopyMemory(@points[0],@FDataBuffer[0],points_count);
                  SetLength(subpoly,Count);
                  CopyMemory(@subpoly[0],@FDataBuffer[points_count div SizeOf(Integer)],count*SizeOf(Integer));
                  newCount:=Count;
                  if GisClip.ClipPolyPolyLine(Rect(0,0,Map.DrawCood.ScreenWidth,Map.DrawCood.ScreenHeight),
                    newCount,subpoly,points) then
                  GraphDraw.TyoPolyPolyLine(Pen,DC,points,subpoly,newCount);
                //===========================================
                end;   
              end;
          except  on E: Exception do
              elog.SystemLog.AddLog('DrawMeta->Polyline,',
                                         Self.Data.FileName+'->MetaID'+
                                         IntToStr(AMeta^.ID)+' '+e.Message);
          end;
        end;
      _PolyRegion://复合区域对象
        begin
           try
              with AMeta^.PolyRegion do //  TODO -o吕洪波 : SPWAddress-PWAddress 做了两次计算，应该可以优化
              begin
                points_count:=SPWAddress-PWAddress;
                sizeofbuffer:=Count*sizeof(integer)+points_count;
                if sizeofbuffer>length(FDataBuffer) then //容量不够－扩容
                  SetLength(FDataBuffer,sizeofbuffer+BUFFER_INC_SIZE);

                CopyMemory(@FDataBuffer[0],pointer(PWAddress+Data.StaticStart),sizeofbuffer);
                FMap.FDrawCood.ConvertSPs(0,points_count div SizeOf(TWorldPoint),TWorldPointAry(FDataBuffer)); //坐标变换

                SetPen(Pen);
                SetBrush(Brush);
                //GraphDraw.SetPen(DC,Pen);
                //GraphDraw.SetBrush(DC,Brush);

                if  Count=1 then
                begin
                   SetLength(points,points_count div sizeof(TWorldPoint));
                   CopyMemory(@points[0],@FDataBuffer[0],points_count);
                   Canvas.Polygon(points)
                end
                else
                if not polypolygon(dc,FDataBuffer[0],FDataBuffer[points_count div SizeOf(Integer)],Count)then
                begin
                    Result:=false;
                    elog.SystemLog.AddLog(TDataLayer(Data).FFileName,'Draw Polygon failure MetaID:'+IntToStr(AMeta^.ID));
                    {SetLength(FDataBuffer,0);
                    TDataLayer(Data).ReLoadFromFile;
                    elog.SystemLog.AddLog(TDataLayer(Data).FFileName,'ReLoadFromFile');}
                end;
                if GraphDraw.GetPenType(Pen.Pattern)<>WINDOWS_PEN then
                begin
                //测试线型===================================
                  SetLength(points,points_count div sizeof(TWorldPoint));
                  CopyMemory(@points[0],@FDataBuffer[0],points_count);
                  SetLength(subpoly,Count);
                  CopyMemory(@subpoly[0],@FDataBuffer[points_count div SizeOf(Integer)],count*SizeOf(Integer));
                  newCount:=Count;
                  if GisClip.ClipPolyPolyLine(Rect(0,0,Map.DrawCood.ScreenWidth,Map.DrawCood.ScreenHeight),
                    newCount,subpoly,points) then
                  GraphDraw.TyoPolyPolyLine(Pen,DC,points,subpoly,newCount);
                end;
              end;
          except  on E: Exception do
              elog.SystemLog.AddLog('DrawMeta->PolyRegion,',
                                         Self.Data.FileName+'->MetaID'+
                                         IntToStr(AMeta^.ID)+' '+e.Message);
          end;
        end;
      _Text://文本对象
        begin
          try
              if not (FMovingDraw and (mpMvNotDrawText in FMap.FOption)) then
              begin
                //tmpMeta :=Fdata.GetFixMeta(MetaIndex);
                InnerDrawText(DC,AMeta^.Outbox,AMeta^.Text);
              end;
          except  on E: Exception do
              elog.SystemLog.AddLog('DrawMeta->Text,',
                                         Self.Data.FileName+'->MetaID'+
                                         IntToStr(AMeta^.ID)+' '+e.Message);
          end;
        end;
      else ;
      end;
end;

procedure TDrawLayer.HighLightSelectedMetas(DC: HDC);
var
  i:integer;
  oldPen:HPen;
  oldBrush:HBrush;
begin
  if not (lySelect in FState) then
    Exit;
try
    oldpen:=SelectObject(DC,CreatePen(0, 1,clWhite));
    oldBrush:=SelectObject(DC,CreateSolidBrush(clWhite));
    GraphDraw.SetPen(DC,Map.HightLightPen);
    GraphDraw.SetBrush(DC,Map.HightLightBrush);
    for i:=0 to FSelectedMeta.Count-1 do
    begin
      HighLightSelectedMeta(DC,FSelectedMeta.GetData(i));
    end;
    DeleteObject(SelectObject(DC,oldPen));
    DeleteObject(SelectObject(DC,oldBrush));
except  on E: Exception do
    elog.SystemLog.AddLog(' TDrawLayer.HighLightSelectedMetas ',
                               Self.Data.FileName+' '+
                               e.Message);
end;
end;

procedure TDrawLayer.HighLightSelectedMeta(DC: HDC;AMetaIndexID:integer);
var
  points_count,sizeofbuffer:integer;
  Meta:PMetaStruct;
  start_point,end_Point:TPoint;
  s:string;
begin
    if FMovingDraw then Exit;
try
    Meta:=Fdata.GetMeta(AMetaIndexID{,Map.Projection.ProjectionType});
    //===============================================
    //画图 case
    case Meta._Type of
      _Symbol://符号对象
        begin
          s:='_Symbol';
          end_Point:=FMap.FDrawCood.ConvertSP(Meta.Symbol.Position);
          GraphDraw.TyoHighLightSymbol(DC,meta.Symbol,end_Point);
          GraphDraw.SetBrush(DC,Map.HightLightBrush);

        end;
      _Line://线段对象
        begin
          s:='_Line';
          with Meta.Line do
          begin
            start_point:=FMap.FDrawCood.ConvertSP(SP);
            end_point:=FMap.FDrawCood.ConvertSP(EP);
            MoveToEx(DC,start_point.x,start_point.y,nil);
            LineTo(DC,end_point.x,end_point.y);
          end;
        end;
      _Rect://矩形对象
        begin
        s:='_Rect';
         with Meta.Rect,Meta.Outbox do
         begin
           start_point:=FMap.FDrawCood.ConvertSP(TopLeft);
           end_point:=FMap.FDrawCood.ConvertSP(BottomRight);
           Rectangle(DC,start_point.x,start_point.y,end_point.x,end_point.y);
         end;
        end;
      _RoundRect://圆角矩形对象

        begin
//         with Meta.RoundRect,Meta.Outbox do
         begin
           //RoundRect(mapDC,Left,Top,Right,Bottom);//圆角的角度
         end;
        end;
      _Polyline://折线对象
        
        begin
          s:='_Polyline';
          with Meta.Polyline do  // TODO -o吕洪波 : SPWAddress-PWAddress 做了两次计算，应该可以优化
          begin
            points_count:=SPWAddress-PWAddress;
            sizeofbuffer:=Count*sizeof(integer)+points_count;
            if sizeofbuffer>length(FDataBuffer) then //容量不够－扩容
              SetLength(FDataBuffer,sizeofbuffer+BUFFER_INC_SIZE);
            CopyMemory(@FDataBuffer[0],Pointer(PWAddress+Data.StaticStart),sizeofbuffer);
            FMap.FDrawCood.ConvertSPs(0,points_count div sizeof(TWorldPoint),TWorldPointAry(FDataBuffer)); //坐标变换
            if not polypolyline(DC,FDataBuffer[0],FDataBuffer[points_count div SizeOf(Integer)],count)
              then begin
                        //Result:=false;
                        elog.SystemLog.AddLog(TDataLayer(Data).FFileName,'SelectedMeta Polyline failure MetaID:'+IntToStr(Meta.ID));
                        {SetLength(FDataBuffer,0);
                        TDataLayer(Data).ReLoadFromFile;
                        elog.SystemLog.AddLog(TDataLayer(Data).FFileName,'ReLoadFromFile');}
              end;
          end;
        end;
      _PolyRegion://复合区域对象
        
        begin
          s:='_PolyRegion';
          with Meta.PolyRegion do //  TODO -o吕洪波 : SPWAddress-PWAddress 做了两次计算，应该可以优化
          begin
            points_count:=SPWAddress-PWAddress;
            sizeofbuffer:=Count*sizeof(integer)+points_count;
            if sizeofbuffer>length(FDataBuffer) then //容量不够－扩容
              SetLength(FDataBuffer,sizeofbuffer+BUFFER_INC_SIZE);
            CopyMemory(@FDataBuffer[0],Pointer(PWAddress+Data.StaticStart),sizeofbuffer);
            FMap.FDrawCood.ConvertSPs(0,points_count div SizeOf(TWorldPoint),TWorldPointAry(FDataBuffer)); //坐标变换
            if not polypolygon(dc,FDataBuffer[0],FDataBuffer[points_count div SizeOf(Integer)],Count)
              then begin
                    //Result:=false;
                    elog.SystemLog.AddLog(TDataLayer(Data).FFileName,'SelectedMeta Polygon failure MetaID:'+IntToStr(Meta.ID));
                    {SetLength(FDataBuffer,0);
                    TDataLayer(Data).ReLoadFromFile;
                    elog.SystemLog.AddLog(TDataLayer(Data).FFileName,'ReLoadFromFile');}
              end;
          end;
        end;
      _Text://文本对象
        begin
          s:='_Text';
          start_point:=Map.DrawCood.ConvertSP(Meta.Outbox.TopLeft);
          end_Point  :=Map.DrawCood.ConvertSP(Meta.Outbox.BottomRight);

          GraphDraw.DrawFrameBox(DC,start_point.x,start_point.y,
            end_point.x,end_point.y);
        end;
      else ;
      end;
except  on E: Exception do
    elog.SystemLog.AddLog(' TDrawLayer.HighLightSelectedMeta ',
                               Self.Data.FileName+'->MetaID:'+
                               IntToStr(Meta.ID)+
                               'MetaType:'+s+' '+
                               e.Message);
end;
end;

procedure TDrawLayer.Save;
begin
  FData.FEnableScaleLimit:=FEnableScaleLimit;
  FData.FLabelValue:=FLabelValue;
  FData.FLayerName:=FLayerName;
  FData.FMaxScale:=FMaxScale;
  FData.FMinScale:=FMinScale;
  FData.FState:=FState-[lyEditAble];
end;

procedure TCustomDrawLayer.SetDataLayer(Value: TCustomDataLayer);
begin
  FData:=Value;
  LabelValue:=Value.LabelValue;
  State:=Value.State;
  MinScale:=Value.MinScale;
  MaxScale:=Value.MaxScale;
  ShowName:=Value.ShowName;
  LayerName:=Value.LayerName;
  EnableScaleLimit:=Value.EnableScaleLimit;
end;

constructor TLayerProvider.Create;
begin
  inherited Create;
  RuntimeData.LoadResource;
  RuntimeData.LoadBitmap;
  FCount:=0;
end;

destructor TLayerProvider.Destroy;
var
  i:Integer;
begin
//释放所有的图层
  if FCount>0 then
    for i:=0 to FCount-1 do
      if FDataLayers[i] <> nil then
      begin
        if (i > 0) and (Pos('[GPS]', FDataLayers[i].ShowName) > 0) then
        begin //重点监控窗体中的图层与主界面的图层相同,已经被释放的就不在free
          FDataLayers[i] := nil;
          Continue;
        end
        else
          FDataLayers[i].Free;
      end;
  FCount:=0;
//  if (FConnection is TGeoConnection)and(FConnection<>nil) then
//    FConnection.Free;
end;

function TLayerProvider.AddLayerFromFile (AFileName : String;
  const ProjectionType:Integer=-1) : Integer;
var
  ID:Longword;
  newCustomLayer:TCustomDataLayer;
begin
  Result:=VerifyFileName(AFileName);
  if Result<0 then
  begin
    ID:=GetFileID(AFileName);
    if ID=TDataLayer.GetIdentification then
      newCustomLayer := TDataLayer.Create
    else
      raise EFileLoadErr.Create('文件标识不对');
    try
      SetLayerProvider(newCustomLayer);
      newCustomLayer.LoadFromFile(AFileName);
    except
      newCustomLayer.Free;
      raise EFileLoadErr.Create('文件打开错误或文件不可读写');
    end;
    Result:=AddLayer(newCustomLayer);
  end;
end;

function TLayerProvider.AddLayer (Layer : TCustomDataLayer) : Integer;
begin
  Result:=InternalNewLayer(Layer);
  if Result>=0 then
    BuildShowName(Result);
end;

procedure TLayerProvider.RemoveLayer (AIndex : Integer);
var
  i:Integer;
begin
  if (AIndex>=0) and (AIndex<FCount) then
  begin
    FDataLayers[AIndex].Free;
    for i:=AIndex to FCount-2 do
    begin
      FDataLayers[i]:=FDataLayers[i+1];
      FDataLayers[i].FIndex:=i;
    end;
    Dec(FCount);
  end
  else
    raise EIndexError.Create;
end;

function TLayerProvider.AddNew(const NewFileName:string) : Integer;
begin
end;

constructor TLayers.Create(Map:TCustomMap);
begin
  inherited Create;
  FMap:=Map;
  FInc:=20;
  FCount:=0;
  SetLength(FLayers,FInc+1);
end;

destructor TLayers.Destroy;
var
  i:Integer;
begin
  for i:=0 to FCount-1 do
  begin
    FLayers[i].Free;
  end;
  FCount:=0;
end;

function TLayers.AddLayer:integer;
var
  ADrawLayer:TDrawLayer;
begin
{$IFDEF RUNTIME}
   ADrawLayer:=TDrawLayer.Create;
{$ENDIF}
{$IFDEF DESIGN}
   ADrawLayer:=TEditDrawLayer.Create;
{$ENDIF}
  result:=AddLayerWithLayer(ADrawLayer);
end;

function TLayers.AddLayerWithLayer(NewLayer:TDrawLayer):integer;
begin
  DoBeforeAddLayer;
  inc(FCount);
  if FCount>=Length(FLayers) then
    SetLength(FLayers,FCount+FInc+1);
  FLayers[FCount-1]:=NewLayer;
  FLayers[FCount-1].FMap:=FMap;
  result:=FCount-1;
  NewLayer.OnClose:=DoOnLayerClose;
  DoAfterAddLayer(Result);
end;

function TLayers.GetLayerByIndex(AIndex:integer):TDrawLayer;
begin
  if AIndex>FCount-1 then
    Exception.Create('边界溢出');
  Result:=FLayers[AIndex];
end;

function TLayers.AddLayerWithProvider(AProvider:TCustomDataLayer):integer;
var
  ANewLayer:TDrawLayer;
begin
  DoBeforeAddLayer;
  if (AProvider.Identification and $FFF)=TDataLayer.GetIdentification then
  begin
    inc(FCount);
    if FCount>=Length(FLayers) then
      SetLength(FLayers,FCount+FInc+1);
    FLayers[FCount-1]:=TDrawLayer.Create;
    FLayers[FCount-1].FMap:=FMap;
    result:=FCount-1;
    FLayers[FCount-1].OnClose:=DoOnLayerClose;
  end
  else
    raise Exception.Create('不能识辨的数据图层');
  setorder(Result,0);
  Result:=0;
  FLayers[Result].Data:=AProvider;
  if not FMap.HasProjection then
  begin
    FMap.Projection.ProjectionType:=AProvider.ProjectionType;
    FMap.HasProjection:=True;
  end;
  DoAfterAddLayer(Result);
end;

procedure TLayers.SetOrder(ALayerIndex:integer;AZorder:integer);
var
  i:integer;
begin
  if ALayerIndex>=FCount then Exit;
  if AZorder>=FCount-1 then AZorder:=FCount-1;
  if AZorder<1 then AZorder:=0;

  FLayers[FCount]:=FLayers[ALayerIndex];//保存临时值
  if (ALayerIndex-AZorder)>0 then
  begin
    for i:=ALayerIndex-1 downto AZorder do
      FLayers[i+1]:=FLayers[i];
    FLayers[AZorder]:=FLayers[FCount];
  end;
  if (ALayerIndex-AZorder)<0 then
  begin
    for i:=ALayerIndex to AZorder-1 do
      FLayers[i]:=FLayers[i+1];
    FLayers[AZorder]:=FLayers[FCount];
  end;
end;

procedure TLayers.SetOrder(ADrawLayer: TDrawLayer; AZorder: integer);
var
  i:integer;
begin
   for i:=0 to FCount-1 do
   begin
     if FLayers[i]= ADrawLayer then
     begin
        SetOrder(i,AZorder);
        exit;
     end;
   end;
end;


procedure TLayers.SwichOrder(AID1:integer;AID2:integer);
begin
  if (AID1>FCount-1) or (AID2>FCount-1)
    then Exit;
  FLayers[FCount]:=FLayers[AID1];
  FLayers[AID1]:=FLayers[AID2];
  FLayers[AID2]:=FLayers[FCount];
end;

procedure TLayers.CloseLayer(AIndex:integer);
var
  i:integer;
begin
  if (AIndex>=0) and (AIndex<FCount) then
  begin
    DoBeforeCloseLayer(AIndex);
    FLayers[AIndex].Free;
    for i:=AIndex to FCount-2 do
      FLayers[i]:=FLayers[i+1];
    Dec(FCount);
  end;
end;

procedure TLayers.CloseAllLayers;
var
  i:integer;
begin
  for i:=0 to FCount-1 do
  begin
    FLayers[i].Free;
  end;
  FCount:=0;
end;

constructor TCustomMap.Create;
begin
  inherited;
  FID:=RuntimeData.GetID;
  FLayers:=TLayers.Create(self);
  FLayers.OnLayerWillChanged:=Self.LayersLayerBeforeChanged;
  FLayers.OnLayerChanged:=Self.LayersLayerAfterChanged;
  FLayers.OnMsgEvent:=Self.DoDealMsgEvent;
  FProjection:=TProjection.Create;
  FLabelFont:=RuntimeData.LabelFont;
  //创建后先给投影一个默认值
  FProjection.ProjectionType:=1;
  FSelection:=TSelection.Create;
  FDrawCood:=TDrawCood.Create(Self.Width,Self.Height);
  FDrawCood.MaxWorldRect:=FProjection.MaxWorldRect;
  FDrawCood.OnWorldWillChange:=Self.DrawCoodWorldWillChange;
  FDrawCood.OnWorldChanged:=Self.DrawCoodWorldChanged;
  FDrawCood.OnScaleChanged:=Self.DrawCoodScalueChanged;
  //响应Projection改变的事件
  FProjection.OnProjectionChanged:=ProjectionTypeChg;

  FMeasure:=TMeasure.Create;

  FScreenBitmap :=TBitmap.Create;
  FDrawBitmap   :=TBitmap.Create;
  FTmpBitmap    :=TBitmap.Create;
  FTmpBitmap.TransparentColor:=clWhite;
  FTmpBitmap.Transparent:=True;
  FTmpBitmapChanged:=false;

  FDrawCood.ZoomOutStep:=1.5;
  FDrawCood.ZoomInStep:=1.5; 
  //Outbox:=GeometryCalc.InitWorldRect ;
  FactuallyPaint:=True;
  FDebug :=TErrorLog.Create;

  include(FOption,mpMvNotDrawLabel);
  include(FOption,mpMvNotDrawText);
  Include(FOption,mpAllowDraw);
  Include(FOption,mpMvNotDrawBitMap);
  Include(FOption,mpIgnorSmallFont);
  FAllowPaint:=True;
  FDisplayScale:=True;

  FHightLightBrush.Transparent:=1;
  FHightLightBrush.ForeColor:=clblue;
  FHightLightBrush.Pattern:=HS_CROSS;

  FHightLightPen.Pattern:=CU_PS_SOLID;
  FHightLightPen.Color:=clred;
  FHightLightPen.Width:=1;

  FHasProjection:=False;

  //{$IFDEF LABEL}
  FLabelRectXList := TIntegerList.Create;
  FLabelRectXList.Sorted := True;
  FLabelRectYList := TIntegerList.Create;
  FLabelRectYList.Sorted := True;
  FLabelRectList := TIntegerList.Create;
  FLabelRectList.Sorted := True;

  SetLength(FLabelRectArray,50);
  FLabelRectArrayCount:=50;
  FLabelRectArrayPoint:=0;
  //{$ENDIF}
  PBar:=TProgressBar.Create(Self);  //add by dxf 2006-6-19
  PBar.Parent:=Self;
 // PBar.Smooth:=true;
  PBar.Align:=alBottom;
  PBar.Height:=10;


end;

destructor TCustomMap.Destroy;
//{$IFDEF LABEL}
//var
//  i: Integer;
//{$ENDIF}
begin
//  {$IFDEF LABEL}

    {for i := 0 to FLabelRectList.Count - 1 do
      Dispose(FLabelRectList.Datas[i]);

    for i := 0 to FLabelRectXList.Count - 1 do
      Dispose(FLabelRectXList.Datas[i]);  }
    FLabelRectArrayPoint:=0;
    SetLength(FLabelRectArray,0);

    FLabelRectXList.Free;
    FLabelRectYList.Free;
    FLabelRectList.Free;
//  {$ENDIF}
  FLayers.Free;
  FProjection.Free;
  FDrawCood.Free;
  FMeasure.Free;
  FSelection.Free;
  FScreenBitmap.Free;
  FDrawBitmap.Free;
  FTmpBitmap.Free;
  FDebug.Free;
  inherited;
end;

constructor TMap.Create(AOwner: TComponent; Provider: TLayerProvider);
begin
  inherited Create(AOwner);
  SetProvider(Provider);
  FScale:=TScale.Create;

end;

procedure TMap.DrawThreadDone(Sender: TObject);
begin
end;

destructor TMap.destroy;
begin
  FScale.Free;
  PBar.Free;
  inherited;
end;

procedure TMap.Draw;
var
  i:integer;
  beginDatetime:TDatetime;
begin
  if (not Self.Parent.Visible)or (not Self.Visible) then exit;
  if not (mpAllowDraw in Option) then   Exit;
  //====for test thread draw
  {if FIsDrawing then Exit;
  FIsDrawing:=True;
  FDrawThread:=TMapDrawThread.Create(self);
  FDrawThread.OnTerminate :=DrawThreadDone;
  exit;
  }
  //====for test thread draw

  if FIsDrawing then Exit;
try
  FIsDrawing:=True;
  Self.Enabled:=false;
  try


    ClearDrawBitmap;
    ClearTmpBitmap;
    FDrawCood.SetScreen(Self.Width,Self.Height);
    {$IFDEF DEBUG}
    FDebug.ResetTimer;
    {$ENDIF}
    //{$IFDEF LABEL}

     { for i := 0 to FLabelRectList.Count - 1 do
        Dispose(FLabelRectList.Datas[i]);

      for i := 0 to FLabelRectXList.Count - 1 do
        Dispose(FLabelRectXList.Datas[i]);   }
      FLabelRectArrayPoint:=0;

      FLabelRectXlist.Clear;
      FLabelRectYList.Clear;

      FLabelRectList.Clear;
    //{$ENDIF}
    PBar.Max:=FLayers.FCount*10;
    PBar.Position:=0;
    beginDatetime:=now;
    for i:=FLayers.FCount-1 downto 0 do
    begin
      FLayers.FLayers[i].Draw;

      PBar.StepIt;
      if MilliSecondsBetween(now,beginDatetime)>500 then
      begin
         PBar.Show;
         PBar.Update;
      end;
    end;

    PBar.Max:=FLayers.FCount*10;
    PBar.Position:=0;
    beginDatetime:=now;
    for i:=FLayers.FCount-1 downto 0 do
    begin
      FLayers.FLayers[i].DrawLab;

      PBar.StepIt;
      if MilliSecondsBetween(now,beginDatetime)>500 then
      begin
         PBar.Show;
         PBar.Update;
      end;
    end;


    try
        //设置背景为透明色
        SetBkMode(FDrawBitmap.Canvas.Handle,TRANSPARENT);
       // TextOut(FDrawBitmap.Canvas.Handle,0,Self.Height-15,PChar('南京通用电器有限公司'),length('南京通用电器有限公司'));
    except  on E: Exception do
        elog.SystemLog.AddLog(' TMap.Draw1 ',e.Message);
    end;
    {$ifopt d+}
    SetBkMode(FDrawBitmap.Canvas.Handle,TRANSPARENT);
  {  for i:=FLayers.FCount-1 downto 0 do
    begin
      
      TextOut(FDrawBitmap.Canvas.Handle,0,i*15,
              PChar(FLayers.FLayers[i].LayerName +IntToStr(FLayers.FLayers[i].FDrawTime)),
              length(FLayers.FLayers[i].LayerName+IntToStr(FLayers.FLayers[i].FDrawTime)));
    end;  }
    {$endif}


    {$IFDEF DEBUG}
     FDrawBitmap.Canvas.TextOut(,0,IntToStr(FDebug.ElapsedTime));
    {$ENDIF}
    try
        Paint;
    except  on E: Exception do
        elog.SystemLog.AddLog(' TMap.Draw2 ',e.Message);
    end;

  finally
    FIsDrawing:=False;
    Self.Enabled:=true;
    PBar.Hide;
  end;
except  on E: Exception do
    elog.SystemLog.AddLog(' TMap.Draw3 ',
                               e.Message);
end;
end;
procedure TMap.ClipDraw(Rect:TWorldRect);
var
  i:integer;
begin
try
  if FIsDrawing then Exit;
  ClearDrawBitmap;
  ClearTmpBitmap;
  FDrawCood.SetScreen(Self.Width,Self.Height);
  
  //{$IFDEF LABEL}

    {for i := 0 to FLabelRectList.Count - 1 do
      Dispose(FLabelRectList.Datas[i]);

    for i := 0 to FLabelRectXList.Count - 1 do
      Dispose(FLabelRectXList.Datas[i]);  }
    FLabelRectArrayPoint:=0;  

    FLabelRectXlist.Clear;
    FLabelRectYList.Clear;

    FLabelRectList.Clear;
  //{$ENDIF}

  {$IFDEF DEBUG}
  FDebug.ResetTimer;
  {$ENDIF}
  for i:=FLayers.FCount-1 downto 0 do
  begin
    //当拖动时,不对大的图层重画  2007-10-07  by dxf 
    if  (FLayers.FLayers[i].FDrawTime>=50){or(FLayers.FLayers[i].isHaveNotDelete) }then continue;
    FLayers.FLayers[i].FMovingDraw:=True;
    FLayers.FLayers[i].ClipDraw(FDrawBitmap.canvas.handle,Rect,FDrawBitmap.canvas);
    FLayers.FLayers[i].FMovingDraw:=False;
  end;
  for i:=FLayers.FCount-1 downto 0 do
  begin
    //当拖动时,不对大的图层重画  2007-10-07  by dxf 
    if  (FLayers.FLayers[i].FDrawTime>=20){or(FLayers.FLayers[i].isHaveNotDelete) }then continue;
    FLayers.FLayers[i].FMovingDraw:=True;
    FLayers.FLayers[i].DrawLab;
    FLayers.FLayers[i].FMovingDraw:=False;
  end;
  {$IFDEF DEBUG}
  FDrawBitmap.Canvas.TextOut(0,0,IntToStr(FDebug.ElapsedTime));
  {$ENDIF}
except  on E: Exception do
    elog.SystemLog.AddLog(' TMap.ClipDraw ',
                               e.Message);
end;
end;

procedure TMap.Zoom(AScale: Double);
//var
//  worldrect:TWorldRect;
begin
  //with FDrawCood do
   FDrawCood.ZoomAT(FDrawCood.Center,FDrawCood.GetRealScale/AScale);   
end;

procedure TMap.Zoom(AScale: Double; Worldpoint: TWorldPoint);
begin
  with FDrawCood do
    ZoomAT(Worldpoint,GetRealScale/AScale);
end;

procedure TMap.ZoomAt(ANewScale: Double; Worldpoint: TWorldPoint);
begin
  with FDrawCood do
    ZoomAT(Worldpoint,ANewScale);
end;

procedure TMap.Zoom(WorldRect: TWorldRect);
begin
  FDrawCood.SetWorld(WorldRect);
end;

procedure TMap.Offset(XPixels,YPixels:integer);
begin
  FDrawCood.Offset(Round(XPixels*FDrawCood.GetRealScale),
    Round(YPixels*FDrawCood.GetRealScale));
end;

procedure TMap.MapCentre;
var wpoint:TWorldPoint;
  TempWorldoutbox:TWorldRect;
begin
  TempWorldoutbox:=Outbox;
  wpoint.x:=(TempWorldoutbox.Xmin+TempWorldoutbox.Xmax) shr 1;
  wpoint.y:=(TempWorldoutbox.Ymin+TempWorldoutbox.Ymax) shr 1;
  FDrawCood.CenterAT(wpoint);
end;

procedure TMap.CenterAtScreen(ScreenPoint:TPoint);
begin
  FDrawCood.CenterAT(FDrawCood.ConvertWP(ScreenPoint));
end;

procedure TMap.CenterAtWorld(WorldPoint:TWorldPoint);
begin
  FDrawCood.CenterAT(WorldPoint);
end;


procedure TMap.SetProvider(Provider:TLayerProvider);
begin
  FLayerProvider:=Provider;
end;

function TMap.GetProvider:TLayerProvider;
begin
  Result:=FLayerProvider;
end;

procedure TMap.LoadFromFile(ALayerFileName:string);
var
  provider:TCustomDataLayer;
begin
{$IFDEF ForTestUser}
  if not UserReged then
  begin
    exit;
  end;
{$endif}
  provider:=FLayerProvider.GetLayerFromFile(ALayerFileName);
  if provider<>nil then
  begin
    FLayers.AddLayerWithProvider(provider);
    FDrawCood.SetWorld(Outbox);
  end;
end;

procedure TMap.DoPaint;
begin
  inherited;
  {$IFDEF DEBUG}
  if FDisplayScale then
  begin
    FScale.MaxWidth:=80;

    FScale.SetUnit('mm','m','Km');
    FScale.PixelPerunit:=FDrawCood.GetRealScale*
      pj_units[Projectors.UnitCodeFromName(Projection.WorldUnitsName)].to_meter;
    if FScale.PixelPerunit>0 then
    begin
      FScale.PreDraw;
      FScale.Draw(canvas.handle,10,Height-20);
    end else
      TErrorLog.ErrLog(ErrFormat('TMap.FScale','Err'));
  end;
  {$ENDIF}
end;

procedure TCustomMap.Paint;
begin
try
  if not FAllowPaint then
    Exit;
  DoPaint;
  if Assigned(FOnMapRefreshed) then
    FOnMapRefreshed(Self);
  inherited Paint;
except  on E: Exception do
    elog.SystemLog.AddLog(' TCustomMap.Paint ',
                               e.Message);
end;
end;

procedure TCustomMap.PaintRect(Rect:TRect);
begin
  if not FAllowPaint then
    Exit;
  DoPaintRect(Rect);
  if Assigned(FOnMapRefreshed) then
    FOnMapRefreshed(Self);
  inherited Paint;
end;

procedure TCustomMap.DoPaintRect(Rect:TRect);
begin

  if not FactuallyPaint then
  begin
    FactuallyPaint:=True;
    Exit;
  end;
  if FPainting then Exit;


try
  {$IFDEF DEBUG}
  FDebug.ResetTimer;
  {$ENDIF}
  FPainting:=True;
  if (FScreenBitMap.Height<>Height) or (FScreenBitMap.Width<>Width) then
  begin
    FScreenBitMap.Width:=GetClientRect.Right;
    FScreenBitMap.Height:=GetClientRect.Bottom;
    FDrawBitmap.Width:=FScreenBitMap.Width;
    FDrawBitmap.Height:=FScreenBitMap.Height;
    FTmpBitmap.Width:=FScreenBitMap.Width;
    FTmpBitmap.Height:=FScreenBitMap.Height;
    Draw;
  end;
  FScreenBitmap.canvas.Lock;
  FDrawBitMap.Canvas.Lock;
 { canvas.Lock;  }//此地方不能Lock因为,这是控制的Canvas,当Lock后,此控制的图片不能更新
  try
          //把FDrawBitMap.Canvas图片COPY到FScreenBitmap.canvas里
          BitBlt(FScreenBitmap.canvas.handle,Rect.Left,Rect.Top,Rect.Right,Rect.Bottom,
            FDrawBitMap.Canvas.Handle,Rect.Left,Rect.Top,cmSrcCopy);

          if FTmpBitmapChanged then //只有用选择工具时,在地图上选择图元时,才会用到.  dxf 2007-3-3
          begin
            GraphDraw.TransDraw(FScreenBitMap.canvas.handle,Rect.Left,Rect.Top,Rect.Right,Rect.Bottom,
              FTmpBitmap.canvas.handle,clWhite);
          end;
          //FScreenBitMap.Canvas图片COPY到TMap.canvas
          BitBlt(canvas.handle,Rect.Left,Rect.Top,Rect.Right,Rect.Bottom,
            FScreenBitMap.Canvas.Handle,Rect.Left,Rect.Top,cmSrcCopy);
  finally
          FScreenBitmap.canvas.UnLock;
          FDrawBitMap.Canvas.UnLock;
  {        canvas.UnLock;   }
  end;

  FPainting:=False;
  {$IFDEF DEBUG}
  Canvas.TextOut(0,20,IntToStr(FDebug.ElapsedTime));
  {$ENDIF}
except  on E: Exception do
    elog.SystemLog.AddLog(' TCustomMap.DoPaintRect ',
                               e.Message);
end;
end;

procedure TCustomMap.DoPaint;
begin
try
      if not FactuallyPaint then
      begin
        FactuallyPaint:=True;
        Exit;
      end;
      if FPainting then Exit;
      {$IFDEF DEBUG}
      FDebug.ResetTimer;
      {$ENDIF}
      FPainting:=True;
      if (FScreenBitMap.Height<>Height) or (FScreenBitMap.Width<>Width) then
      begin
        FScreenBitMap.Width:=GetClientRect.Right;
        FScreenBitMap.Height:=GetClientRect.Bottom;
        FDrawBitmap.Width:=FScreenBitMap.Width;
        FDrawBitmap.Height:=FScreenBitMap.Height;
        FTmpBitmap.Width:=FScreenBitMap.Width;
        FTmpBitmap.Height:=FScreenBitMap.Height;
        Draw;
      end;
      try
         DoBeforeDrawScreen;
      except  on E: Exception do
          elog.SystemLog.AddLog(' TCustomMap.DoPaint DoBeforeDrawScreen ',e.Message);
      end;

      FScreenBitmap.canvas.Lock;
      FDrawBitMap.Canvas.Lock;
      FTmpBitmap.canvas.Lock;
  {    canvas.Lock; }  //此地方不能Lock因为,这是控制的Canvas,当Lock后,此控制的图片不能更新
      try
              //copy  屏幕
              try //把FDrawBitMap.Canvas图片COPY到FScreenBitmap.canvas里
                  BitBlt(FScreenBitmap.canvas.handle,0,0,GetClientRect.Right,GetClientRect.Bottom,FDrawBitMap.Canvas.Handle,0,0,cmSrcCopy);
              except  on E: Exception do
                  begin
                      elog.SystemLog.AddLog(' TCustomMap.DoPaint1 ',e.Message);
                      try
                          elog.SystemLog.AddLog('TCustomMap.DoPaint Free','FScreenBitmap.Free;');
                          FScreenBitmap.Free;
                          elog.SystemLog.AddLog('TCustomMap.DoPaint Free','FDrawBitmap.Free;');
                          FDrawBitmap.Free;
                          elog.SystemLog.AddLog('TCustomMap.DoPaint Free','FTmpBitmap.Free;');
                          FTmpBitmap.Free;
                      except  on E: Exception do
                        begin
                          elog.SystemLog.AddLog(' TCustomMap.TCustomMap.DoPaint1.1 ',e.Message);
                        end;
                      end;
                      try
                          elog.SystemLog.AddLog('TCustomMap.DoPaint Create','FScreenBitmap.Create');
                          FScreenBitmap :=TBitmap.Create;
                          elog.SystemLog.AddLog('TCustomMap.DoPaint Create','FDrawBitmap.Create;');
                          FDrawBitmap   :=TBitmap.Create;
                          elog.SystemLog.AddLog('TCustomMap.DoPaint Create','FTmpBitmap.Create;');
                          FTmpBitmap    :=TBitmap.Create;
                          FTmpBitmap.TransparentColor:=clWhite;
                          FTmpBitmap.Transparent:=True;
                          FTmpBitmapChanged:=false;
                          elog.SystemLog.AddLog('TCustomMap.DoPaint Draw','Self.Draw');
                          Self.Draw;
                          exit;
                      except  on E: Exception do
                        begin
                          elog.SystemLog.AddLog(' TCustomMap.TCustomMap.DoPaint1.2 ',e.Message);
                        end;
                      end;
                  end;
              end;


              if FTmpBitmapChanged then
              begin
                try
                    GraphDraw.TransDraw(FScreenBitMap.canvas.handle,0,0,GetClientRect.Right,GetClientRect.Bottom,FTmpBitmap.canvas.handle,clWhite);
                except  on E: Exception do
                    elog.SystemLog.AddLog(' TCustomMap.DoPaint2 ',e.Message);
                end;
              end;


              try
                  DoAfterDrawScreen;
              except  on E: Exception do
                  elog.SystemLog.AddLog(' TCustomMap.DoPaint DoAfterDrawScreen ',e.Message);
              end;

              
              try
                  //FScreenBitMap.Canvas图片COPY到TMap.canvas
                  BitBlt(canvas.handle,0,0,GetClientRect.Right,GetClientRect.Bottom,FScreenBitMap.Canvas.Handle,0,0,cmSrcCopy);
              except  on E: Exception do
                  elog.SystemLog.AddLog(' TCustomMap.DoPaint3 ',e.Message);
              end;
      finally
              FScreenBitmap.canvas.UnLock;
              FDrawBitMap.Canvas.UnLock;
              FTmpBitmap.canvas.UnLock;
  {            canvas.UnLock;   }

      end;


      //inherited Paint;
      FPainting:=False;
      {$IFDEF DEBUG}
      Canvas.TextOut(0,20,IntToStr(FDebug.ElapsedTime));
      {$ENDIF}
except  on E: Exception do
    elog.SystemLog.AddLog(' TCustomMap.DoPaint4 ',
                               e.Message);
end;
end;

procedure TCustomMap.OffsetPaint(XPixels,YPixels:integer;XPixelsOff,YPixelsOff:integer);
begin
  DoOffsetPaint(XPixels,YPixels,XPixelsOff,YPixelsOff);
  FactuallyPaint:=False;
  paint;
end;

procedure TCustomMap.DoOffsetPaint(XPixels,YPixels:integer;XPixelsOff,YPixelsOff:integer);
var
  rects:array[1..4] of TRect;
  points:array[1..4] of TPoint;
  Width,Height,i,j:integer;
  topleft,bottomright:TPoint;
  ClientRect:TRect;
begin
try
  ClientRect:=GetClientRect;
  Width:=ClientRect.Right;
  Height:=ClientRect.Bottom;
  topleft:=ClientRect.TopLeft;
  bottomright:=ClientRect.BottomRight;
  ////////////////////////////
  points[1].x:=Width+XPixels;
  points[1].y:=Height+YPixels;

  points[2].x:=XPixels;
  points[2].y:=Height+YPixels;

  points[3].x:=XPixels;
  points[3].y:=YPixels;

  points[4].x:=Width+XPixels;
  points[4].y:=YPixels;
  ////////////////////////////
  for i:=1 to 4 do
  begin
    if  GeometryCalc.PointInRect(points[i],ClientRect) then
    begin
      rects[1].TopLeft:=topleft;         rects[1].BottomRight:=points[i];

      rects[2].Left:=points[i].x;        rects[2].Top:=ClientRect.Top;
      rects[2].Right:=ClientRect.Right;  rects[2].Bottom:=points[i].y;

      rects[3].TopLeft:=points[i];       rects[3].BottomRight:=bottomright;

      rects[4].Left:=ClientRect.Left;    rects[4].Top:=points[i].y;
      rects[4].Right:=points[i].x;       rects[4].Bottom:=ClientRect.Bottom;
      for j:=1 to 4 do
      begin
        if j<>i then
        begin
          //Canvas.Brush.Color:=Self.Color;
          //Canvas.FillRect(rects[j]);
        end else
        begin
          Offset(XPixelsOff,-YPixelsOff);
          rects[j].TopLeft:=FDrawCood.ConvertWP(rects[j].TopLeft);
          rects[j].BottomRight:=FDrawCood.ConvertWP(rects[j].BottomRight);
          ClipDraw(TWorldRect(rects[j]));
        end;
      end;
      break;
    end;
  end;
except  on E: Exception do
    elog.SystemLog.AddLog(' TCustomMap.DoOffsetPaint1 ',
                               e.Message);
end;

  FDrawBitMap.canvas.Lock;
  FScreenBitmap.Canvas.Lock;
{  canvas.Lock; }//此地方不能Lock因为,这是控制的Canvas,当Lock后,此控制的图片不能更新
  try

          try
            BitBlt(FDrawBitMap.canvas.handle,XPixels,YPixels,ClientRect.Right,ClientRect.Bottom,FScreenBitmap.Canvas.Handle,0,0,cmSrcCopy);
          except  on E: Exception do
            begin
              elog.SystemLog.AddLog(' TCustomMap.DoOffsetPaint2 ',e.Message);
              try
                  elog.SystemLog.AddLog('Free','FScreenBitmap.Free;');
                  FScreenBitmap.Free;
                  elog.SystemLog.AddLog('Free','FDrawBitmap.Free;');
                  FDrawBitmap.Free;
                  elog.SystemLog.AddLog('Free','FTmpBitmap.Free;');
                  FTmpBitmap.Free;
              except  on E: Exception do
                begin
                  elog.SystemLog.AddLog(' TCustomMap.DoOffsetPaint2.1 ',e.Message);
                end;
              end;
              try
                  elog.SystemLog.AddLog('Create','FScreenBitmap.Create');
                  FScreenBitmap :=TBitmap.Create;
                  elog.SystemLog.AddLog('Create','FDrawBitmap.Create;');
                  FDrawBitmap   :=TBitmap.Create;
                  elog.SystemLog.AddLog('Create','FTmpBitmap.Create;');
                  FTmpBitmap    :=TBitmap.Create;
                  FTmpBitmap.TransparentColor:=clWhite;
                  FTmpBitmap.Transparent:=True;
                  FTmpBitmapChanged:=false;
                  elog.SystemLog.AddLog('Draw','Self.Draw');
                  Self.Draw;
                  exit;
              except  on E: Exception do
                begin
                  elog.SystemLog.AddLog(' TCustomMap.DoOffsetPaint2.2 ',e.Message);
                end;
              end;
              
            end;
          end;
            {
            if FTmpBitmapChanged then
            begin
              GraphDraw.TransDraw(canvas.handle,XPixels,YPixels,ClientRect.Right,ClientRect.Bottom,
                FTmpBitmap.canvas.handle,clWhite);
            end;
            }
            //BitBlt(FScreenBitmap.canvas.handle,0,0,ClientRect.Right,ClientRect.Bottom,
            //  FDrawBitMap.Canvas.Handle,0,0,cmSrcCopy);
          try
            BitBlt(canvas.handle,0,0,ClientRect.Right,ClientRect.Bottom,
              FDrawBitMap.Canvas.Handle,0,0,cmSrcCopy);
          except  on E: Exception do
              elog.SystemLog.AddLog(' TCustomMap.DoOffsetPaint3 ',e.Message);
          end;
  finally
         FDrawBitMap.canvas.UnLock;
         FScreenBitmap.Canvas.UnLock;
      {     canvas.UnLock;  }

  end;
  //不再需要继承这个方法,已在Paint中继承了 by nx
  //inherited Paint;             //by dxf
end;

procedure TCustomMap.ClearScreenBitmap;
begin
  FScreenBitmap.Canvas.Brush.Color:=Color;
  FScreenBitmap.Canvas.FillRect(GetClientRect);
end;

procedure TCustomMap.ClearDrawBitmap;
begin
try
  FDrawBitmap.Canvas.Brush.Color:=Color;
  FDrawBitmap.Canvas.FillRect(GetClientRect);
except  on E: Exception do
    elog.SystemLog.AddLog(' TCustomMap.ClearDrawBitmap ',
                               e.Message);
end;
end;

procedure TCustomMap.ClearTmpBitmap;
begin
try
  FTmpBitmap.Canvas.Brush.Style:=bsSolid;
  FTmpBitmap.Canvas.Brush.Color:=clWhite;
  FTmpBitmap.Canvas.FillRect(GetClientRect);
  FTmpBitmapChanged:=False;
except  on E: Exception do
    elog.SystemLog.AddLog(' TCustomMap.ClearTmpBitmap ',
                               e.Message);
end;
end;

procedure TCustomMap.RefreshScreenBitmap;
begin
  //BitBlt(FScreenBitMap.canvas.handle,0,0,ClientRect.Right,ClientRect.Bottom,
  //  FDrawBitMap.Canvas.Handle,0,0,cmSrcCopy);
  Draw;
end;

{function TCustomDataLayer.GetFirstMeta: TMetaStruct;
begin
  raise ENotComplete.Create;
  //Result:=FMetas[0];
end;     }

{function TCustomDataLayer.GetFixMeta(Index: Integer): TWorldMeta;
begin
  if (Index>=0)and(Index<FMetaCount)then
    Result:=FixMetas[Index]
  else
    raise EIndexError.Create;
end;         }

function TCustomDataLayer.GetMetaPointer(Index: Integer): PMetaStruct;
var
  meta:PMetaStruct;
begin
  if (Index>=0)and(Index<FMetaCount)then
  begin
    meta:=Metas[Index];
    Result:=Meta;
  end
  else
    raise EIndexError.Create;
end;

{function TCustomDataLayer.GetFlexMeta(Index: Integer): TWorldMeta;
begin
  if (Index>=0)and(Index<FMetaCount)then
    Result:=FFlexMetas.GetDataByIndex(0).FlexMeta[Index]
  else
    raise EIndexError.Create;
end; }

{function TCustomDataLayer.GetFlexMetaPointer(Index: Integer): PWorldMeta;
begin
  if (Index>=0)and(Index<FMetaCount)then
    Result:=@FFlexMetas.GetDataByIndex(0).MetaFLexs[Index]
  else
    raise EIndexError.Create;
end; }

{ function TCustomDataLayer.GetFlexMetaPointer(Index,AProjectionType: Integer): PWorldMeta;
begin
 if (Index>=0)and(Index<FMetaCount)then
    Result:=@FFlexMetas.GetDataByParam(AProjectionType).MetaFLexs[Index]
  else
    raise EIndexError.Create;     
end;                              }

{function TCustomDataLayer.GetLastMeta: TMetaStruct;
begin
  raise ENotComplete.Create;
  //Result:=FMetas[FMetaCount-1];
end; }

{ TCustomLayer }

procedure TCustomLayer.Close;
begin
  inherited Close;
end;

constructor TCustomLayer.Create;
begin
  inherited Create;

  FIdentification:=GetIdentification;
end;

destructor TCustomLayer.Destroy;
begin
  inherited Destroy;
end;

{procedure TDataLayer.LoadDataset();  //装载数据库
var
  fileHead: PFileHead;
  d: TMemoryStream;
begin
  fileHead := PFileHead(FMemMapFile.Data);
  FDataSet := TdxMemDataE.Create(nil);
  d := TMemoryStream.Create;
  try
    d.Write(Pointer(Integer(FMemMapFile.Data)+fileHead.PropDataOffset)^,fileHead.PropDataLength);
    d.Position := 0;
    TDxmemDataE(FDataSet).CreateFieldsFromStream(d);
    d.Position := 0;
    TDxmemDataE(FDataSet).LoadFromStream(d);
  finally
    d.Free;
  end;
end;    }

procedure TDataLayer.LoadIndex;
var
//  fileHead: PFileHead;
  err: string;
//  address: Integer;
begin
  err:='';
  FFileHead := PFileHead(FMemMapFile.data);
  if FfileHead^.Version <> 3 then
    err := '文件不对,错误号:003(地图文件版本不对)'
  else
  if FfileHead^.HeadSize <> SizeOf(FfileHead^) then
    err := '文件不对,错误号:001(文件头错误)'
  else
  if FfileHead^.Identification <> 1 then
    err := '文件不对,错误号:002(不是合法的地图文件)'
  else
  if FfileHead^.FileSize <> FMemMapFile.Size then
    err := '文件不对,错误号:004(文件长长度错误)';

  if err <> '' then
  begin
    raise EFileLoadErr.Create(err);
  end;
  SetIndexHeadToLayer(FfileHead);
  FShowName:=FLayerName;
  FMetaAddressStart:=Integer(FMemMapFile.data)+FfileHead^.WorldIndexOffset;
  FstaticStart:=Integer(FMemMapFile.data)+FfileHead^.WorldDataOffset;
  FNameAddressStart:=Integer(FMemMapFile.data)+FfileHead^.PropDataOffset;
  
  //test Setlength(FFixMetas,FfileHead^.MetaCount);
//  SetLength(FDynMetas,fileHead^.MetaCount);
//address:=Integer(FMemMapFile.Data)+fileHead^.EarthIndexOffset;
 //test address:=Integer(FMemMapFile.Data)+FfileHead^.WorldIndexOffset;
//CopyMemory(@FFixMetas[0],Pointer(address),fileHead^.EarthIndexLength);
 //test CopyMemory(@FFixMetas[0],Pointer(address),FfileHead^.WorldIndexLength);
end;

//procedure TDataLayer.LoadStatic();
//var
 // fileHead: TFileHead;
//  staticStart:Integer;
//  i:Integer;
//begin
 // fileHead := PFileHead(FMemMapFile.data)^;
//staticStart:=Integer(FMemMapFile.data)+fileHead.EarthDataOffset;
 // FstaticStart:=Integer(FMemMapFile.data)+FfileHead^.WorldDataOffset;
{  for i:=0 to FMetaCount - 1 do
  begin
    with Metas[i] do
    begin
      if NameLen<>0 then
      begin
          NameAddress:=NameAddress+staticStart;
      end;
      case _Type of
        _Polyline:
        begin

          Polyline.PwAddress:=Polyline.PWAddress+staticStart;
          Polyline.SPwAddress:=Polyline.SPWAddress+staticStart;

        end;
        _PolyRegion:
        begin

          PolyRegion.PWAddress:=PolyRegion.PWAddress+staticStart;
          PolyRegion.SPWAddress:=PolyRegion.SPWAddress+staticStart;


          //@@PolyRegion.SOutBoxAddress:=PolyRegion.SOutBoxAddress+staticStart;
          //@@PolyRegion.SPositives:=PolyRegion.SPositives+staticStart;
        end;
        _Text:
        begin
          Text.Address:=Text.Address+staticStart;
        end;
      end;
    end;
  end;}
//end;

procedure TLayerProvider.RemoveLayer(AShowName: String);
var
  i:Integer;
begin
  if FCount>0 then
  begin
    for i:=0 to FCount-1 do
      if AShowName=FDataLayers[i].FShowName then Break;
    if i < FCount then
      RemoveLayer(i)
    else
      raise EFindLayerError.Create;
  end;
end;

procedure TLayerProvider.BuildShowName(AIndex: Integer);
var
  i:Integer;
  endingChar:Integer;
  showname:string;
begin
  endingChar:=0;
  showname:=FDataLayers[AIndex].FShowName;
  for i:=0 to AIndex-1 do
  begin
    if FDataLayers[AIndex].FShowName=FDataLayers[i].FShowName then
    begin
      Inc(endingChar);
      FDataLayers[AIndex].FShowName:=showname+IntToStr(endingChar);
    end;
  end;
end;

{procedure TDataLayer.SaveDataset(AFileName: string);
begin
  if FDataSetType = _NoData then Exit;
  if (DataSet<>nil)and(FDataSet is TdxMemDataE) then
    (FDataSet as TdxMemDataE).SaveToBinaryFile(AFileName);
end; }

{procedure TDataLayer.SaveDynamic(AFileName: string);
var
  saveStream:TFileStream;
  pt:Pointer; 
begin

end;          }

{procedure TDataLayer.SaveIndex(AFileName: string);
begin
end;  }

{procedure TDataLayer.SaveStatic(AFileName: string);
var
  saveStream:TFileStream;
  pt:Pointer;
begin
  GetMem(pt,FMemMapFile.Size);
  saveStream:=TFileStream.Create(AFileName,fmCreate);
  try
    CopyMemory(pt,Pointer(FMemMapFile.Data),FMemMapFile.Size);
    saveStream.Write(pt^,FMemMapFile.Size);
  finally
    saveStream.Free;
    FreeMem(pt);
  end;
end; }


function TLayerProvider.VerifyFileName(AFileName: string): Integer;
var
  i:Integer;
  fNewName:string;
  fOldDir:string;
begin
  fNewName:=ExtractFileName(AFileName);
  fOldDir:=ExtractFilePath(AFileName);
  SetCurrentDir(fOldDir);
  AFileName:=LowerCase(ExpandFileName(fNewName));
  for i:=0 to FCount-1 do
    if LowerCase(FDataLayers[i].FFileName)=AFileName then
      Break;
  if (i<FCount) and (FCount>=0) then
    Result:=i
  else
    Result:=-1;
end;

function TLayerProvider.GetLayerFromFile(
  AFileName: string): TCustomDataLayer;
var
  layerPos:Integer;
begin
//  Result:=nil;
  try
    layerPos:=AddLayerFromFile(AFileName);
    Result:=GetLayerFromIndex(layerPos);
  except
    raise;
  end;
end;

function TLayerProvider.GetLayerFromIndex(
  AIndex: Integer): TCustomDataLayer;
begin
  if (AIndex>=0) and (AIndex<FCount) then
    Result:=FDataLayers[AIndex]
  else
    Result:=nil;
end;

{procedure TDataLayer.CreateDynMeta;
var
  i:Integer;
begin
  for i:=0 to FMetaCount do
  begin
    FDynMetas[i].Edit:=False;
    FDynMetas[i].Delete:=False;
  end;
end;    }

{procedure TDataLayer.CreateLabelText;
var
  i:Integer;
begin
  if FDataSet<>nil then
  for i:=0 to FMetaCount - 1 do
  begin
    if FDataSet.Locate('UID',Metas[i].ID,[loCaseInsensitive]) then
      FDynMetas[i].LabelText:=FDataSet.FieldByName(FLabelValue).AsString
    else
      FDynMetas[i].LabelText:='';
  end;
end;  }

function TDataLayer.GetLabelText(const UID: Integer;const ALabelValue:string):string;
var
  meta:PMetaStruct;
begin
  Result:='';
{  if FDataSet=nil then
    Exit;
  if FDataSet.Locate('UID',UID,[loCaseInsensitive]) then
    Result:=Trim(FDataSet.FieldByName(ALabelValue).AsString); }
  meta:=Metas[UID-1];
  if  meta.ID<>UID then
  begin
    meta:=Metas[Self.GetMetaIndex(UID)];
  end;
  if Meta.NameLen<=0 then exit;
  SetLength(Result,Meta.NameLen);
  CopyMemory(@Result[1],Pointer(Meta.NameAddress+NameAddressStart),Meta.NameLen);
end;

function TDataLayer.GetUIDFromLabelValue(const AFieldName,ALabelValue:string;LocateOptions: TLocateOptions): TIntegerDynArray;
begin
{  if FDataSet = nil then exit;
  //sha 地物查询。根据标注查找到其UID。当有多条满足条件的记录时,UID放入数组中
  TdxMemDataE(FdataSet).Seek(AFieldName,ALabelValue,LocateOptions,Result);  }
end;

{procedure TDataLayer.ClearLabelText;
var i:integer;
begin
  for i:=0 to MetaCount-1 do
    ClearLabelText(i);
end;    }

//function TCustomDataLayer.GetMeta(Index{,AProjectionType}:integer): TMetaStruct;
//var
//  flexMeta:TWorldMeta;
//  WorldMeta:TWorldMeta;
//  fixMeta:TEarthMeta;
//begin
//  if (Index>=0) and (Index<FMetaCount) then
//  begin
//    Result:=Metas[Index];
//    flexMeta:=FFlexMetas.GetDataByParam(AProjectionType).FlexMeta[Index];
{    Result.ID:=WorldMeta.ID;
    Result.Enabled:=WorldMeta.Enabled;
//    Result.Anchor:=fixMeta.Anchor;
//    Result.Outbox:=fixMeta.Outbox;
//    Result.ScaleLimit:=fixMeta.ScaleLimit;
//    Result.MinScale:=fixMeta.MinScale;
//    Result.MaxScale:=fixMeta.MaxScale;
    Result.Outbox:=WorldMeta.Outbox; //flexMeta.Outbox;
    Result.Anchor:=WorldMeta.Anchor; //flexMeta.Anchor;
    Result.NameAddress:=WorldMeta.NameAddress;
    Result.NameLen:=WorldMeta.NameLen;
    Result._Type:=FFixMetas[Index]._Type;
    case Result._Type of
      _Symbol:
      begin
//        Result.Symbol.Point:=FixMeta.Symbol.Point;
        Result.Symbol.Position:=WorldMeta.Symbol.Position;
        Result.Symbol.Style:=WorldMeta.Symbol.Style;
        case Result.Symbol.Style of
          _Custom:Result.Symbol.CustomSymbol:=WorldMeta.Symbol.CustomSymbol;
          _TrueFont:Result.Symbol.TrueFont:=WorldMeta.Symbol.TrueFont;
          _Bitmap:Result.Symbol.Bitmap:=WorldMeta.Symbol.Bitmap;
        end;
      end;
      _Line:
      begin
//        Result.Line.SP:=fixMeta.Line.SP;
//        Result.Line.EP:=fixMeta.Line.EP;
        Result.Line.Pen:=WorldMeta.Line.Pen;
        Result.Line.SP:=WorldMeta.Line.SP;
        Result.Line.EP:=WorldMeta.Line.EP;
      end;
      _Text:
      begin
        Result.Text.Address := WorldMeta.Text.Address;
        Result.Text.Length := WorldMeta.Text.Length;
        Result.Text.Font := WorldMeta.Text.Font;
//        Result.Text.SP := fixMeta.Text.SP;
//        Result.Text.EP := fixMeta.Text.EP;
        Result.Text.SP := WorldMeta.Text.SP;
        Result.Text.EP := WorldMeta.Text.EP;
        Result.Text.MaxCols:=WorldMeta.Text.MaxCols;
        Result.Text.Rows:=WorldMeta.Text.Rows;
      end;
      _PolyLine:
      begin
        Result.Polyline.Pen:=WorldMeta.Polyline.Pen;
//        Result.Polyline.PtAddress:=fixMeta.Polyline.PtAddress;
//        Result.Polyline.SPtAddress:=fixMeta.Polyline.SPtAddress;
        Result.Polyline.PWAddress:=WorldMeta.Polyline.PWAddress;
        Result.Polyline.SPWAddress:=WorldMeta.Polyline.SPWAddress;
        Result.Polyline.Count:=WorldMeta.Polyline.Count;
      end;
      _Rect:
      begin
        Result.Rect.Pen:=WorldMeta.Rect.Pen;
        Result.Rect.Brush:=WorldMeta.Rect.Brush;
      end;
      _RoundRect:
      begin
        Result.RoundRect.Pen:=WorldMeta.RoundRect.Pen;
        Result.RoundRect.Brush:=WorldMeta.RoundRect.Brush;
        Result.RoundRect.Degree:=WorldMeta.RoundRect.Degree;
      end;
      _PolyRegion:
      begin
        Result.PolyRegion.Pen:=WorldMeta.PolyRegion.Pen;
        Result.PolyRegion.Brush:=WorldMeta.PolyRegion.Brush;
//        Result.PolyRegion.PtAddress:=fixMeta.PolyRegion.PtAddress;
//        Result.PolyRegion.SPtAddress:=fixMeta.PolyRegion.SPtAddress;
        //@@Result.PolyRegion.SOutBoxAddress := fixMeta.PolyRegion.SOutBoxAddress;
        //@@Result.PolyRegion.SPositives := fixMeta.PolyRegion.SPositives;
        Result.PolyRegion.PWAddress:=WorldMeta.PolyRegion.PWAddress;
        Result.PolyRegion.SPWAddress:=WorldMeta.PolyRegion.SPWAddress;
        //@@Result.PolyRegion.SWOutboxAddress := flexMeta.PolyRegion.SWOutboxAddress;
        //@@Result.PolyRegion.SWPositives := flexMeta.PolyRegion.SWPositives;
        Result.PolyRegion.Count:=WorldMeta.PolyRegion.Count;
      end;  
    end;    }
//  end
//  else
//    raise EIndexError.Create;
//end;

function TCustomDataLayer.GetMetaIndex(AUID: Integer): Integer;
var
  i:Integer;
begin
  Result:=-1;
  for i:=0 to FMetaCount-1 do
    if Metas[i].ID=AUID then
    begin
     Result:=i;
     Break;
    end;
end;

{function TCustomDataLayer.GetMetaPointer(Index: Integer): PMetaStruct;
begin
  raise ENotComplete.Create;
end;     }

procedure TCustomLayer.DoClose;
begin
  inherited DoClose;
end;

class function TCustomLayer.GetIdentification: longword;
begin
  Result:=1;
end;

function TCustomLayer.GetShowName: string;
begin
  Result:=FShowName;
end;

procedure TLayerProvider.SaveLayer(AIndex: Integer);
begin
 // if (AIndex>=0) and (AIndex<FCount) then
   // FDataLayers[AIndex].Save;
end;

procedure TLayerProvider.SaveLayer(AShowName: TGisShortName);
var
  layerPos:Integer;
begin
  layerPos:=VerifyShowName(AShowName);
  if layerPos>=0 then
 //   FDataLayers[layerPos].Save;
end;

procedure TLayerProvider.SaveLayerAs(AIndex: Integer; AFileName: string);
begin
  if (AIndex>=0) and (AIndex<FCount) then
//    FDataLayers[AIndex].SaveAs(AFileName);
end;

procedure TLayerProvider.SaveLayerAs(AShowName: TGisShortName;
  AFileName: string);
var
  layerPos:Integer;
begin
  layerPos:=VerifyShowName(AShowName);
  if layerPos>=0 then
  //  FDataLayers[layerPos].SaveAs(AFileName);
end;

function TLayerProvider.LayerByFileName(AFileName: string): TCustomDataLayer;
var
  layerPos:Integer;
begin
  layerPos:=VerifyFileName(AFileName);
  if layerPos>=0 then
    Result:=FDataLayers[layerPos]
  else
    Result:=nil;
end;

function TLayerProvider.LayerByShowName(AShowName: TGisShortName): TCustomDataLayer;
var
  layerPos:Integer;
begin
  layerPos:=VerifyShowName(AShowName);
  if layerPos>=0 then
    Result:=FDataLayers[layerPos]
  else
    Result:=nil;
end;

function TLayerProvider.VerifyShowName(AShowName: TGisShortName): Integer;
var
  i:Integer;
begin
  for i:=0 to FCount-1 do
    if LowerCase(FDataLayers[i].FShowName)=LowerCase(AShowName) then
      Break;
  if (i<FCount) and (FCount>0) then
    Result:=i
  else
    Result:=-1;
end;


procedure TMap.SetCurrentAction(AAction: Integer);
begin
  if AAction<>FCurrentAction then
    FCurrentAction:=AAction;
end;

procedure TCustomMap.DrawCoodWorldChanged(Sender: TObject;
  WorldRect: TWorldRect);
begin

end;

procedure TCustomMap.DrawCoodWorldWillChange(Sender: TObject;
  WorldRect: TWorldRect;var Change: Boolean);
begin

end;


function TLayers.GetLayerIndexByShowName(AShowName: TGisShortName): Integer;
var
  i:Integer;
begin
  Result:=-1;
  if FCount>0 then
    for i:=0 to FCount - 1 do
      if CompareText(layers[i].FShowName,AShowName)=0 then
      begin
        Result:=i;
        Break;
      end;
end;

procedure TLayerProvider.RemoveLayerByFileName(AFileName: String);
var
  layerIndex:Integer;
begin
  layerIndex:=VerifyFileName(AFileName);
  if layerIndex>=0 then
    RemoveLayer(layerIndex);
end;

procedure TLayerProvider.SetConnection(Connection: TCustomConnection);
begin
  raise ENotComplete.Create;
//  if FConnection=nil then
//    FConnection:=Connection;
end;

{function TCustomDataLayer.GetPointerMeta(Index: Integer): TPointerMeta;
var
  meta:TWorldMeta;
begin
  if (Index>=0)and(Index<FMetaCount)then
  begin
    meta:=Metas[Index];
    Result.PWorld:=@meta;
//    Result.PWorld:=@FFlexMetas.GetDataByParam(AProjectionType).MetaFlexs[Index];
  end
  else
    raise EIndexError.Create;
end;    }

procedure TCustomDataLayer.SetProvider(AProvider: TLayerProvider);
begin
  if FProvider=nil then
    FProvider:=AProvider;
end;

{function TCustomDataLayer.GetMetasWorldOutbox(MetaIndexs:TIntegerDynArray;PrjType:integer):TWorldRect;
begin
end; }

procedure TCustomLayer.SetIdentification(Value: longword);
begin
  FIdentification:=Value;
end;

procedure TCustomLayer.SetLabelValue(const Value: TGisLabelValue);
begin
  FLabelValue := Value;
end;

procedure TCustomLayer.SetState(Value: TLayerStates);
begin
  FState := Value;
end;

procedure TCustomMap.SetCurrentAction(AAction: Integer);
begin
  if AAction<>FCurrentAction then
    FCurrentAction:=AAction;
end;

procedure TCustomMap.SetSelection(const Value: TSelection);
begin
  FSelection := Value;
end;

function TDrawLayer.DoSelectEntityMeta(
  const SelectType: TSelectType; const AddType: TSelectAddType;
  const ObjectSelectType:Integer): Boolean;
begin
  Result:=DoSelectSourceMeta(SelectType,AddType,EntityMeta,ObjectSelectType);
end;

function TDrawLayer.DoSelectMeta(
  const SelectType: TSelectType; const AddType: TSelectAddType;
  const ObjectSelectType:Integer): Boolean;
begin
  Result:=DoSelectSourceMeta(SelectType,AddType,SelectedMeta,ObjectSelectType);
end;

function TDrawLayer.SelectEntityMeta(
  const SelectType: TSelectType; const AddType: TSelectAddType;
  const ObjectSelectType:Integer): Boolean;
begin
  Result:=DoSelectEntityMeta(SelectType,AddType,ObjectSelectType)
end;

function TDrawLayer.SelectMeta(
  const SelectType: TSelectType; const AddType: TSelectAddType;
  const ObjectSelectType:Integer): Boolean;
begin
  Result:=DoSelectMeta(SelectType,AddType,ObjectSelectType);
end;

procedure TCustomMap.SetLayerProvider(const Value: TLayerProvider);
begin
  FLayerProvider := Value;
end;

procedure TCustomMap.SetOption(const Value: TMapOptions);
begin
  FOption := Value;
end;

procedure TCustomMap.SetSelectSourceMeta(const Value: TMetaStruct);
begin
  FSelectSourceMeta := Value;
end;

function TDrawLayer.DoSelectSourceMeta(const ASelectType: TSelectType;
  const AddType: TSelectAddType; IntegerList: TYIntegerList;
ObjectSelectType:Integer): Boolean;
var
  i:integer;
  ResultI:Boolean;//临时的结果
  //选中类型规则
  procedure VerifyObjectSelectType(const _Type: TMetaType;var ObjectSelectType:Integer);
  begin
    case _Type of
      _Symbol: ;
    else
      ObjectSelectType:=OST_ALL;
    end;
  end;
begin

  Result:=False;
  //设置选中类
  with Map.Selection do
  begin
    SelectType:=ASelectType;
    SelectAddType:=AddType;
    DrawCood:=Map.DrawCood ;
    SelectedList:=IntegerList;
  end;
  VerifyObjectSelectType(Map.SelectSourceMeta._Type,ObjectSelectType);
  for i:=MetaInScreen.Count -1 downto 0  do
  begin
    ResultI:=False;
    case Map.SelectSourceMeta._Type of
    _Symbol:   //点选
    begin
      if Map.Selection.SelectMeta(Map.SelectSourceMeta.Symbol.Position,
        Data.GetMeta(MetaInScreen.GetData(i){,
        Map.Projection.ProjectionType}),Data.StaticStart) then
        ResultI:=True;
    end;
    _Rect:     //框选
    begin
      if Map.Selection.SelectMeta(Map.SelectSourceMeta.Outbox,
        Data.GetMeta(MetaInScreen.GetData(i){,
        Map.Projection.ProjectionType}),Data.StaticStart) then
        ResultI:=True;
    end;
    else
      ResultI:=False;
    end;
    if ResultI then
    begin
      Result:=True;
      case AddType of
        satAdd: IntegerList.Add(MetaInScreen.GetData(i));
        satAddXor: IntegerList.AddXor(MetaInScreen.GetData(i));
        satAddOr: IntegerList.AddOr(MetaInScreen.GetData(i));
      end;
      case ObjectSelectType of
      OST_ALL:;
      OST_Single:
        Break;
      else
      end;
    end;
  end;
end;

procedure TCustomMap.SetAllowPaint(const Value: boolean);
begin
  FAllowPaint := Value;
end;

procedure TCustomMap.ProjectionTypeChg(Sender: TObject);
begin
  FDrawCood.MaxWorldRect:=FProjection.MaxWorldRect;
end;

{function TCustomDataLayer.GetFlexMeta(Index,AProjectionType:integer): TWorldMeta;
begin

  if (Index>=0)and(Index<FMetaCount)then
    Result:=FFlexMetas.GetDataByParam(AProjectionType).FlexMeta[Index]
  else
    raise EIndexError.Create;
end;                          }

{procedure TCustomDataLayer.IncMaxMetaID;
begin
  inc(FMaxMetaID);
end; }

{procedure TCustomDataLayer.IncMetaCount(Value: integer);
var
  i:integer;
begin            }
{  FMetaCount:=FMetaCount+Value;
  for i:=0 to FlexMetas.Count - 1 do
    FlexMetas.FlexDatas[i].MetaCount:=FMetaCount;
end;             }

{procedure TLayerProvider.SetADOConnection(const Value: TADOConnection);
begin
//  if (Value<>nil)and(Value is TADOConnection) then
//    FADOConnection := Value;
end;      }

class function TDrawLayer.GetIdentification: longword;
begin
  Result:=TCustomDrawLayer.getidentification+$0100;
end;

class function TCustomDataLayer.GetIdentification: longword;
begin
    Result:=TCustomLayer.GetIdentification+$10;
end;

class function TCustomDrawLayer.GetIdentification: longword;
begin
  Result:=TCustomLayer.GetIdentification+$20;
end;

class function TDataLayer.GetIdentification: longword;
begin
  Result := 1;
end;

function TCustomDataLayer.GetMetaUID(const Index: Integer): Integer;
begin
  if (Index>=0)and(Index<FMetaCount)then
    Result:=Metas[Index].ID
  else
    raise EIndexError.Create;
end;

function TLayerProvider.GetLayerIndexByShowName(
  AShowName: TGisShortName): Integer;
var
  i:Integer;
begin
  Result:=-1;
  for i:=0 to fcount - 1 do
    if DataLayers[i].FShowName=AShowName then
    begin
      Result:=i;
      Break;
    end;
  if Result=-1 then
    raise EFindLayerError.Create;
end;

function TLayers.GetLayer(Index: Integer): TDrawLayer;
begin
  if (Index>=0)and(Index<FCount)then
    Result:=FLayers[Index]
  else
    raise EIndexError.Create;
end;

procedure TCustomMap.Close;
var
  param:TGisParams;
begin
  DoClose;
  param:=TGisParams.Create;
  try
    param.NewParam(1);
    param.Params[0].ParamName:='ID';
    param.Params[0].AsLongword:=Self.ID;
    DoMsgEvent(Self,EV_CLOSE_MAP,param);
  finally
    param.Free;
  end;
end;

procedure TCustomMap.DoClose;
begin

end;

procedure TMap.ClipRefresh(Rect: TWorldRect);
var
  i:integer;
  rRect:TRect;
begin
  if FIsDrawing then Exit;
  FIsDrawing:=True;
  try
    for i:=FLayers.FCount-1 downto 0 do
    begin
      FLayers.FLayers[i].ClipRefresh(FDrawBitmap.Canvas.Handle,Rect);
    end;
    rRect.TopLeft    :=DrawCood.ConvertSP(Rect.TopLeft);
    rRect.BottomRight:=DrawCood.ConvertSP(Rect.BottomRight);
    PaintRect(rRect);
    //Paint;
  finally
    FIsDrawing:=False;
  end;
end;


procedure TMap.ReDrawByDataLayer(ADataLayerID: Longword);
begin
  if FLayerProvider.GetLayerIndexByID(ADataLayerID)>=0 then
    Draw;
end;

function TLayers.GetLayerIndexByID(AID: Longword): Integer;
var
  i:Integer;
begin
  Result:=-1;
  for i:=0 to FCount - 1 do
    if FLayers[i].ID =  AID then
    begin
      Result:=i;
      Break;
    end;
end;

function TLayerProvider.GetLayerIndexByID(AID: Longword): Integer;
var
  i:Integer;
begin
  Result:=-1;
  for i:=0 to FCount - 1 do
    if FDataLayers[i].ID=AID then
    begin
      Result:=i;
      Break;
    end;
end;

procedure TLayerProvider.LayerClose(Sender: TObject);
var
//  i:Integer;
  param:TGisParams;
begin
  param:=TGisParams.Create;
  try
    param.NewParam(2);
    param.Params[0].ParamName:='ID';
    param.Params[0].AsLongword:=(Sender as TCustomLayer).ID;
    param.Params[1].ParamName:='CanClose';
    param.Params[1].AsBool:=True;
    DoMsgEvent(Self,EV_CLOSE_DATALAYER,param);
    if param.Params[1].AsBool then
      RemoveLayer(TCustomLayer(Sender).ID);
    DoMsgEvent(Self,EV_AFTER_CLOSE_DATALAYER,param);
  finally
    param.Free;
  end;
end;

function TLayerProvider.InternalNewLayer(
  ANewLayer: TCustomDataLayer): Integer;
begin
  Result:=-1;
  if FCount<MAX_LAYERS then
  begin
    if FCount>=High(FDataLayers) then
      SetLength(FDataLayers,FCount+10);
    FDataLayers[FCount]:=ANewLayer;
    InitNewLayer(FCount);
    Result:=FCount;
    Inc(FCount);
  end;
end;

procedure TLayerProvider.InitNewLayer(NewLayerIndex: Integer);
begin
  with FDataLayers[NewLayerIndex] do
  begin
    FProvider:=Self;
    OnClose:=Self.LayerClose;
    OnMsgEvent:=Self.DoDealMsgEvent;
  end;
end;

procedure TLayerProvider.RemoveLayer(AID: Longword);
var
  layerPos:Integer;
begin
  layerPos:=GetLayerIndexByID(AID);
  if layerPos>=0 then
    RemoveLayer(layerPos);
end;

procedure TLayers.CloseLayerbyID(AID: Longword);
var
  i:Integer;
begin
  i:=GetLayerIndexByID(AID);
  if i>=0 then
    closeLayer(i);
end;

procedure TLayers.CloseLayerByDataID(ADataID: Longword);
var
  i:integer;
begin
  for i:=FCount-1 downto 0  do
    if ChecklayerByDataID(i,ADataID) then
      closelayer(i);
end;

function TLayers.ChecklayerByDataID(AIndex:Integer;DataID: Longword): Boolean;
begin
  Result:=False;
  if (AIndex>=0)and(AIndex<FCount) then
  begin
    if Layers[AIndex].Data.ID=DataID then
      Result:=True;
  end;
end;

procedure TLayers.DoAfterAddLayer(AIndex: Integer);
var
  param:TGisParams;
begin
  param:=TGisParams.Create;
  DoMsgEvent(Self,EV_ADD_DRAWLAYER,param);
  param.Free;
end;

procedure TLayers.DoBeforeAddLayer;
var
  param:TGisParams;
begin
  param:=TGisParams.Create;
  if Assigned(FOnLayerWillChanged) then
    FOnLayerWillChanged(Self,EV_ADD_DRAWLAYER,param);
  param.Free;
end;

procedure TCustomMap.LayersLayerAfterChanged(Sender: TObject;
  MsgID: Integer; Param: TGisParams);
begin

end;

procedure TCustomMap.LayersLayerBeforeChanged(Sender: TObject;
  MsgID: Integer; Param: TGisParams);
begin

end;

procedure TMap.LayersLayerAfterChanged(Sender: TObject; MsgID: Integer;
  Param: TGisParams);
var
  newParam:TGisParams;
begin
  newParam:=TGisParams.Create;
  with newParam.AddParam do
  begin
    ParamName:='MapID';
    AsLongword:=Self.FID;
  end;
  if Assigned(FOnMapAfterChanged) then
    FOnMapAfterChanged(Self,MsgID,NewParam);
//  inherited LayersLayerAfterChanged(Sender,MsgID,Param);

  newParam.Free;
end;

procedure TMap.LayersLayerBeforeChanged(Sender: TObject; MsgID: Integer;
  Param: TGisParams);
begin
  inherited LayersLayerBeforeChanged(Sender,MsgID,Param);

end;

procedure TLayers.DoAfterCloseLayer(AID: Longword);
begin

end;

procedure TLayers.DoBeforeCloseLayer(AIndex: Integer);
var
  param:TGisParams;
begin
  param:=TGisParams.Create;
  param.NewParam(1);
  param.Params[0].ParamName:='LayerID';
  param.Params[0].AsLongword:=FLayers[AIndex].ID;
  if Assigned(FOnLayerChanged) then
    FOnLayerChanged(Self,EV_CLOSE_DRAWLAYER,param);
  param.Free;
end;

procedure TMap.MoveToCenter;
var
  centrePoint:TWorldPoint;
  TempWorldOutBox:TWorldRect;
begin
  TempWorldOutBox:=Outbox;
  centrePoint.x:=(TempWorldOutBox.Left div 2)+(TempWorldOutBox.Right div 2);
  centrePoint.y:=(TempWorldOutBox.Top div 2)+(TempWorldOutBox.Bottom div 2);
  if (Abs((centrePoint.x div FDrawCood.Scale) -
    (FDrawCood.Center.x div FDrawCood.Scale))  > 5) or
    (Abs((centrePoint.y div FDrawCood.Scale) -
    (FDrawCood.Center.y div FDrawCood.Scale)) > 5) then
    begin
      FDrawCood.CenterAT(centrePoint);
      Draw;
    end;
end;



procedure TCustomMap.SetDisplayScale(const Value: boolean);
begin
  FDisplayScale := Value;
end;

procedure TCustomDataLayer.GetIndexHeadFromLayer(
  AHead: PFileHead);
begin
  AHead^.HeadSize := SizeOf(AHead^);
  AHead^.Identification := 1;
  AHead^.Version := 3;
  AHead^.Charset := GB2312_CHARSET;
  AHead^.MetaCount := MetaCount;
  AHead^.MaxMetaID := MaxMetaID;
//  AHead^.OutBoxLeft := EarthOutBox.Left;
//  AHead^.OutBoxRight := EarthOutBox.Right;
//  AHead^.OutBoxTop := EarthOutBox.Top;
//  AHead^.OutBoxBottom := EarthOutBox.Bottom;
  AHead^.WorldBoxLeft:=OutBox.Left;
  AHead^.WorldBoxRight:=OutBox.Right;
  AHead^.WorldBoxTop:=OutBox.Top;
  AHead^.WorldBoxBottom:=OutBox.Bottom;
  //AHead^.PropType :=
end;

procedure TCustomDataLayer.SetIndexHeadToLayer(
  AHead: PFileHead);
begin
  FMetaCount := AHead^.MetaCount; //图元总个数
  FMaxMetaID := AHead^.MaxMetaID; //图元最大ID号
//  FEarthOutBox.Left := AHead^.OutBoxLeft;
//  FEarthOutBox.Right := AHead^.OutBoxRight;
//  FEarthOutBox.Top := AHead^.OutBoxTop;
//  FEarthOutBox.Bottom := AHead^.OutBoxBottom;
  FOutBox.Left:=AHead^.WorldBoxLeft;//图层的外包巨型
  FOutBox.Top:=AHead^.WorldBoxTop;
  FOutBox.Right:=AHead^.WorldBoxRight;
  FOutBox.Bottom:=AHead^.WorldBoxBottom;
  FProjectionType := 1;//fixed
  FDataSetType := TPropType(AHead.PropType);
end;

//procedure TDataLayer.OpenFlexFile(const AProjectionType: Integer);
//begin
//  FFlexMetas.GetDataByIndex(FFlexMetas.Add(AProjectionType)).Load(FMemMapFile);
//end;

{procedure TDataLayer.LoadFlexFile(const AProjectionType: Integer);
var
  prjType:Integer; 
begin
  prjType:=AProjectionType;
  if prjType<0 then prjType:=0;
//  FFlexMetas.GetDataIndex(prjType);
end;         }

{procedure TDrawLayer.ClearLabelText;
var
  i:integer;
begin
  if Length(ODynMetas)<>Length(Data.FDynMetas) then
    SetLength(ODynMetas,Length(Data.FDynMetas));
  for i:=0 to Data.MetaCount-1 do
    ClearLabelText(i);
end;   }

{ TSuperControl }

constructor TSuperControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Width:=105;
  Height:=105;
end;

procedure TLayerProvider.EditLayerOutboxChange(Sender: TObject);
//var
//  param:TGisParams;
begin
{$IFDEF DESIGN}
  if not (Sender is TEditDataLayer) then Exit;
  param:=TGisParams.Create;
  try
    param.NewParam(1);
    param.Params[0].ParamName:='ID';
    param.Params[0].AsLongword:=(Sender as TCustomLayer).ID;
    if Assigned(FOnLayerOutboxChanged) then
      FOnLayerOutboxChanged(Self,GW_LAYER_OUTBOX_CHANGED,param);
  finally
    param.Free;
  end;
{$ENDIF}
end;

procedure TSuperControl.DoMsgEvent(Sender: TObject; MsgID: Integer;
  Param: TGisParams);
begin
  if Assigned(FOnMsgEvent) then
    FOnMsgEvent(Sender,MsgID,Param);
end;

procedure TSuperControl.SetOnMsgEvent(const Value: TMessageEvent);
begin
  FOnMsgEvent := Value;
end;

procedure TCustomMap.DoLayersAfterChanged;
var
  newParam:TGisParams;
begin
  newParam:=TGisParams.Create;
  with newParam.AddParam do
  begin
    ParamName:='MapID';
    AsLongword:=Self.FID;
  end;
  DoMsgEvent(Self,EV_AFTER_MAP_CHANGED,newParam);
  newParam.Free;
end;

procedure TLayerProvider.DoDealMsgEvent(Sender: TObject; MsgID: Integer;
  Param: TGisParams);
begin
  case MsgID of
    EV_META_ANCHOR_CHANGED:DoMsgEvent(Self,MsgID,Param);
    EV_META_LABEL_CHANGED:DoMsgEvent(Self,MsgID,Param);
    EV_ERROR_INFO,EV_WARNING_INFO:DoMsgEvent(Self,MsgID,Param);
  end;
end;

procedure TLayerProvider.SetLayerProvider(ALayer: TCustomDataLayer);
begin
  ALayer.FProvider:=Self;
end;

function TLayerProvider.GetLayerByShowName(
  AShowName: TGisShortName): TCustomDataLayer;
begin
  Result:=GetLayerFromIndex(GetLayerIndexByShowName(AShowName));
end;

function TCustomMap.GetWorldOutBox: TWorldRect;
var i:Integer;
begin
  Result:=GeometryCalc.InitWorldRect;
  for i:=0 to layers.Count-1 do
  begin
    Result:=GeometryCalc.MergeRect(Result,Layers.Layer[i].Outbox);
  end;
end;

procedure TCustomMap.PrintMap;
begin
  PrintRectToPage(Outbox);
end;

procedure TCustomMap.PrintScreen;
var
  screenRect:TWorldRect;
begin
  screenRect.TopLeft     := DrawCood.ConvertWP(Point(0,0));
  screenRect.BottomRight := DrawCood.ConvertWP(Point
    (DrawCood.ScreenWidth,DrawCood.ScreenHeight));
  PrintRectToPage(screenRect);
end;

procedure TCustomMap.PrintRectToPage(ARect:TWorldRect);
var
  i:integer;
  oldScrnW,oldScrnH:integer;
  oldOption:TMapOptions;
  oldWorldOutBox:TWorldRect;
begin
  if FIsDrawing then Exit;
  FIsDrawing:=True;
  try

    oldOption:=FOption;
    Exclude(FOption,mpIgnorSmallFont);

    oldScrnW:=DrawCood.ScreenWidth;
    oldScrnH:=DrawCood.ScreenHeight;
    oldWorldOutBox:=DrawCood.WorldRect;

    Printer.Begindoc;
    DrawCood.SetScreen(Printer.PageWidth,Printer.PageHeight);
    Drawcood.SetWorld(ARect);

    for i:=FLayers.FCount-1 downto 0 do
    begin
      FLayers.FLayers[i].Draw(printer.canvas.Handle,printer.canvas);
    end;
    Printer.EndDoc;
  finally
    FOption:=oldOption;
    DrawCood.SetScreen(oldScrnW,oldScrnH);
    drawcood.SetWorld(oldWorldOutBox);
    FIsDrawing:=False;
  end;
end;

procedure TCustomMap.SaveScreenToBitmap(AFileName: string);
begin
  FScreenBitmap.SaveToFile(AfileName);
end;

procedure TCustomMap.SaveScreenToJpeg(AFileName: string;Quality:byte);
var
  JpegImage:TJPEGImage;
begin
  JpegImage:=TJPEGImage.Create;
  try
    if Quality>100 then Quality:=100
    else if Quality<10 then Quality:=10;
    JpegImage.Assign(FScreenBitmap);
    JpegImage.CompressionQuality:=Quality;
    JpegImage.SaveToFile(AFileName);
  finally
    JpegImage.Free;
  end;
end;


procedure TCustomMap.SaveScreenToGif(AFileName:string);
var
  Gif:TGifImage;
begin
  Gif:=TGifImage.Create;
  try
    Gif.Assign(FScreenBitmap);
    Gif.SaveToFile(AFileName);
  finally
    Gif.Free;
  end;
end;

procedure TCustomMap.SaveScreenToGifs(AFileName:string;PartCount:integer);
var
  Gif:TGifImage;
  Num,i,j:integer;
  part:integer;
  temp:TBitMap;
begin
  part:= Trunc(Sqrt(PartCount));
  Num:=1;
  Gif:=TGifImage.Create;
  temp:=TBitMap.Create;
  temp.Width:=FScreenBitmap.Width div part;
  temp.Height:=FScreenBitmap.Height div part;
  try
    for j:=0 to part-1 do
    begin
      for i:=0 to part-1 do
      begin
         temp.Canvas.CopyRect(Rect(0,0,temp.Width,temp.Height),FScreenBitmap.Canvas,Rect(temp.Width*i,temp.Height*j,temp.Width*(i+1),temp.Height*(j+1)));
         Gif.Assign(temp);
         Gif.SaveToFile(AFileName+IntToStr(Num)+'.gif');
         inc(Num);
      end;
    end;
  finally
    Gif.Free;
  end;
end;

{procedure TDataLayer.ClearLabelText(const AMetaIndex: Integer);
begin
  FDynMetas[AMetaIndex].LabelText:='';
end;    }

{procedure TDrawLayer.ClearLabelText(const AMetaIndex: Integer);
begin
//  ODynMetas[AMetaIndex].LabelText:='';
  Data.DynMetas[AMetaIndex].LabelText:='';
end;   }

procedure TMap.ClearLabelText(const ADataLayerID: Longword;
  const AMetaIndex: Integer);
var
  i:Integer;
begin
  for i:=0 to Layers.Count - 1 do
  begin
    if Layers.Layers[i].Data.ID=ADataLayerID then
     // Layers.Layers[i].ClearLabelText(AMetaIndex);
  end;
end;

procedure TMap.ClearLabelAnchor(const ADataLayerID: Longword;
  AMetaIndexs: TIntegerDynArray);
var
  i,j:Integer;
begin
  for i:=0 to Layers.Count - 1 do
  begin
    if Layers.Layers[i].Data.ID=ADataLayerID then
    for j:=0 to High(AMetaIndexs) do
      Layers.Layers[i].ClearLabelAnchor(AMetaIndexs[j]);
  end;
end;

procedure TDrawLayer.InvertSelectedMeta;
var
  i:Integer;
begin
  for i:=0 to MetaInScreen.Count - 1 do
    if lyselect in State then
      SelectedMeta.AddXor(MetaInScreen.GetData(i));
end;

procedure TCustomMap.DoDealMsgEvent(Sender: TObject; MsgID: Integer;
  Param: TGisParams);
begin
end;

procedure TDrawLayer.ClearLabelAnchor(const AMetaIndex: Integer);
begin
  if AMetaIndex<=High(ODynMetas) then
    ODynMetas[AMetaIndex].Anchor.x:=0;
end;

procedure TDrawLayer.ClearLabelAnchor;
var
  i:integer;
begin
  for i:=0 to Length(ODynMetas) -1 do
    clearlabelAnchor(i);
end;

function TLayers.GetLayerByID(const AID: Longword): TDrawLayer;
var
  i:Integer;
begin
  if Count>0 then
  begin
    for i:=0 to Count -1 do
    begin
      if layers[i].ID=AID then
      begin
        Result:=layers[i];
        Break;
      end;
    end;
  end
  else
    raise EIndexError.Create;
end;

procedure TCustomMap.SetHightLightBrush(const Value: TBrushStruct);
begin
  FHightLightBrush := Value;
end;

procedure TCustomMap.SetHightLightPen(const Value: TPenStruct);
begin
  FHightLightPen := Value;
end;

procedure TCustomMap.SetHasProjection(const Value: boolean);
begin
  FHasProjection := Value;
end;

procedure TMap.ClearLabelText(const ADataLayerid: Longword);
var
  i:Integer;
begin
  for i:=0 to Layers.Count - 1 do
  begin
    if Layers.Layers[i].Data.ID=ADataLayerID then
      //Layers.Layers[i].ClearLabelText();
  end;
end;

{function TCustomMap.GetEarthOutbox: TWorldRect;
var i:Integer;
begin
  //没有图层打开的时候，应该返回什么值
  Result:=GeometryCalc.InitWorldRect;
  for i:=0 to layers.Count-1 do
    Result:=GeometryCalc.MergeRect(Result,Layers.Layer[i].Data.OutBox);
end;   }

function TMap.AllowOperate(const AnOperate: Integer;AShowMessage:Boolean): Boolean;
begin
  Result:=True;
end;

procedure TCustomDrawLayer.SetLabelFont(const Value: TTrueFontStruct);
begin
  FLabelFont := Value;
end;

procedure TCustomMap.SetLabelFont(const Value: TTrueFontStruct);
begin
  FLabelFont := Value;
end;

procedure TCustomDrawLayer.SetState(Value: TLayerStates);
begin
  inherited SetState(Value);
  if not (lyVisible in State) then
    FMetaInScreen.Clear;
end;

function TLayers.GetLayerCountByFlag(AFlag:TLayerState): Integer;
var
  i:Integer;
begin
  Result:=0;
  for i:=0 to Count -1 do
    if (lyVisible in Layer[i].State)and(AFlag in Layer[i].State) then
      inc(Result);
end;

procedure TCustomMap.DrawCoodScalueChanged(Sender: TObject;const AnOldScale,
  ANewScale: Double);
var
  param:TGisParams;
begin
  param:=TGisParams.Create;
  try
    param.NewParam(2);
    param.Params[0].ParamName:='old scale';
    param.Params[0].AsDouble:=AnOldScale;
    param.Params[0].ParamName:='new scale';
    param.Params[0].AsDouble:=ANewScale;
    DoMsgEvent(Self,EV_AFTER_MAPSCALE_CHANGED,param);
  finally
    param.Free;
  end;
end;

function TCustomDrawLayer.IsShowDialogControl(
  const ADialogType: Integer): Boolean;
begin
  Result:=True;
end;

function TDrawLayer.IsShowDialogControl(
  const ADialogType: Integer): Boolean;
begin
  Result := False;
end;

procedure TCustomMap.PaintTo(ADC: HDC);
begin
//此函数没有调用
  BitBlt(ADC,0,0,FScreenBitmap.Width,FScreenBitmap.Height,
    FScreenBitmap.Canvas.Handle,0,0,cmSrcCopy);
end;

procedure TLayers.DoOnLayerClose(Sender: TObject);
begin
  if (Sender is TDrawLayer) then
    CloseLayerbyID(( Sender as TDrawLayer).ID);
end;

procedure TCustomMap.DoAfterDrawScreen;
begin

end;

procedure TCustomMap.DoBeforeDrawScreen;
begin

end;



function TDrawLayer.PointInMetaName(var AFindMetaIndex:integer; APoint:TWorldPoint): string;
var
  i:integer;
//  PMeta:TPointerMeta;
  Meta: PMetaStruct;
  meta_Label:string;
begin
  AFindMetaIndex:=-1;
{  if Length(ODynMetas)<>Length(Data.FDynMetas) then
    SetLength(ODynMetas,Length(Data.FDynMetas)); }
  if (LabelValue='') or (not (lyLabel in State)) then exit;

  for i:=0 to FData.FMetaCount-1 do
  begin
    Meta:=FData.Metas[i];// .GetPointerMeta(i);
    if not GeometryCalc.PointInRect(APoint,Meta.Outbox) then
    begin
      Continue;
    end;
    //Meta:=FData.GetMeta(i);
    if FMap.Selection.SelectMeta(APoint,Meta,Data.StaticStart) then
    begin
      //获取标注内容
        if Meta.NameLen=0 then exit;
        Setlength(meta_Label,Meta.NameLen);
        CopyMemory(@meta_Label[1],Pointer(Meta.NameAddress+Data.NameAddressStart),Meta.NameLen);

        
{      if LabelValue=Data.LabelValue then
      begin
        meta_Label:=Data.FDynMetas[i].LabelText;
        if meta_Label='' then
        begin
          meta_Label:=Data.GetLabelText(Meta.ID,LabelValue);
          if Trim(meta_Label)='' then Exit;
          Data.FDynMetas[i].LabelText:=meta_Label;
        end;
      end else
      begin
        meta_Label:=ODynMetas[i].LabelText;
        if meta_Label='' then
        begin
          meta_Label:=Data.GetLabelText(Meta.ID,LabelValue);
          if Trim(meta_Label)='' then Exit;
          ODynMetas[i].LabelText:=meta_Label;
        end;
      end;   }
      AFindMetaIndex:=i;
      Result:=meta_Label;
      exit;
    end;
  end;
end;

function TDrawLayer.PointInMetaName(APoint: TWorldPoint; AMeteIndex: integer): string;
var
  Meta: PMetaStruct;
  meta_Label:string;
begin
    Result:=NotFindStr;
    Meta:=FData.Metas[AMeteIndex];
    if FMap.Selection.SelectMeta(APoint,Meta,Data.StaticStart) then
    begin
      //获取标注内容
        meta_Label:=FData.GetMetaName(Meta);
        if  meta_Label<>'' then
            Result:=meta_Label;
        {if Meta.NameLen=0 then exit;
        Setlength(meta_Label,Meta.NameLen);
        CopyMemory(@meta_Label[1],Pointer(Meta.NameAddress),Meta.NameLen);}

{      if LabelValue=Data.LabelValue then
      begin
        meta_Label:=Data.FDynMetas[AMeteIndex].LabelText;
        if meta_Label='' then
        begin
          meta_Label:=Data.GetLabelText(Meta.ID,LabelValue);
          if Trim(meta_Label)='' then Exit;
          Data.FDynMetas[AMeteIndex].LabelText:=meta_Label;
        end;
      end else
      begin
        meta_Label:=ODynMetas[AMeteIndex].LabelText;
        if meta_Label='' then
        begin
          meta_Label:=Data.GetLabelText(Meta.ID,LabelValue);
          if Trim(meta_Label)='' then Exit;
          ODynMetas[AMeteIndex].LabelText:=meta_Label;
        end;
      end;      }
      
    end;
end;

function TCustomDataLayer.GetMeta(Index: integer): PMetaStruct;
var
   address:integer;
begin
  if(Index>=0)and(Index<FMetaCount)then
  begin
      //address:=Integer(FMemMapFile.Data)+FfileHead^.WorldIndexOffset;
      address:=FMetaAddressStart+Index*FMetaStructSize;
      Result:=Pointer(address);
      {CopyMemory(@Result,Pointer(address),FMetaStructSize);
      with  Result^  do
      begin
          //if NameLen<>0 then     //加法很快,所以就不判断
          begin
              NameAddress:=NameAddress+FNameAddressStart;
          end;
          case _Type of
              _Polyline:
              begin
                Polyline.PwAddress:=Polyline.PWAddress+FstaticStart;
                Polyline.SPwAddress:=Polyline.SPWAddress+FstaticStart;
              end;
              _PolyRegion:
              begin
                PolyRegion.PWAddress:=PolyRegion.PWAddress+FstaticStart;
                PolyRegion.SPWAddress:=PolyRegion.SPWAddress+FstaticStart;
              end;
              _Text:
              begin
                Text.Address:=Text.Address+FstaticStart;
              end;
          end;
      end;      }
  end
  else
    raise EIndexError.Create;
end;

function TCustomDataLayer.GetMetaName(AMeta: PMetaStruct): String;
begin
    //获取图元标注内容
    Result:='';
    if AMeta^.NameLen=0 then exit;
    Setlength(Result,AMeta^.NameLen);
    CopyMemory(@Result[1],Pointer(AMeta^.NameAddress+NameAddressStart),AMeta^.NameLen);
end;

procedure TLayers.Draw(Map: TCustomMap);
var
  i:integer;
begin
  Map.PBar.Max:=Count*10;
  Map.PBar.Visible:=true;
  try
      for i:=0 to Count-1 do
      begin
        // FLayers[i].Map:=Map;
         FLayers[i].Draw;
        // Map.PBar.StepIt;
      end;
  finally
      Map.PBar.Visible:=false;
  end;
end;

procedure TLayers.ClipDraw(Map:TCustomMap;Rect: TWorldRect);
begin

end;

procedure TDataLayer.InitAddress;
var
  i:integer;
begin
  for i:=0 to Self.MetaCount-1  do
  begin
      with  Self.Metas[i]^  do
      begin
          //if NameLen<>0 then     //加法很快,所以就不判断
          begin
              NameAddress:=NameAddress+FNameAddressStart;
          end;
          case _Type of
              _Polyline:
              begin
                Polyline.PwAddress:=Polyline.PWAddress+FstaticStart;
                Polyline.SPwAddress:=Polyline.SPWAddress+FstaticStart;
              end;
              _PolyRegion:
              begin
                PolyRegion.PWAddress:=PolyRegion.PWAddress+FstaticStart;
                PolyRegion.SPWAddress:=PolyRegion.SPWAddress+FstaticStart;
              end;
              _Text:
              begin
                Text.Address:=Text.Address+FstaticStart;
              end;
          end;
      end;
  end;
end;


end.


