{ 电子围栏管理
  @author()
  @created()
  @lastmod(GMT:$Date: 2012/10/29 01:46:42 $) <BR>
  最后更新人:$Author: wfp $  <BR>
  当前版本:$Revision: 1.1.1.1 $  <BR>}
unit ConfineAreaUnit;

interface
uses graphics, windows, classes, SysUtils, iniFiles,
  IntegerListunit, MetaDefine, ConstDefineUnit, Contnrs;
type
  //电子围栏,分为五种报警：车机越出区域（越界报警），进入区域（入界报警）
  //区域超速报警,驶出固定路线报警,驶入因定路线报警

  //固定路线巨型,实际上是长方型
  TRunWayRect = record
    case Integer of
       //0:(PointList:array[0..3] of TPoint);
      0: (PointList: array[0..3] of TWorldPoint);
      1: (MinXPoint, MinYPoint, MaxXPoint, MaxYPoint: TPoint);
  end;

  TRunWayRectList = class;
  TConfineArea = class
  private
    FPointCount: integer;
    FID: Integer;
    FName: string;
    FAreaType: byte;
    FAreaColor: Tcolor;
    FWorldPointAry: TWorldPointAry;
    //FEarthPointAry: TEarthPointAry;
    FDevList: TStringList;
    FIsDraw: Boolean;
    FMeta: TWorldMeta;
    FOverSpeet: Integer;
    FOutBox: TWorldRect;
    FAlarmDistance: integer; //报警距离
    FRunWayRectList: TRunWayRectList;
    FIsEnabledTime: boolean;
    FBeginTime: TDatetime;
    FEndTime: TDatetime;
    FIsShowPop: boolean;

    FAntiFakeType: Byte;  // 发送防伪密标的类型； 0：发送文字 2个汉字或4个字母或1个汉字1个字母； 1：发送图片 16*16大小的图片
    FAntiFakeText: string; // 防伪密标文字
    FAntiFakePicFilePath: string; // 发送防伪图片的文件路径

    FMinSpeed: Integer;  // 进入电子围栏后判断疑似上访时的最低速度
    FMaintainTime: Integer;  // 进入电子围栏后判断疑似上访最低速度的持续时间，大于这个时间后就报警

    FIsOutAllow: Boolean;
    FLeaveDateTime: TDateTime;
    FArriveDateTime: TDateTime;
    FArea_Type: Byte;
    FRadius: Double;
    FCenterPoint: TEarthPoint;
    FLastPoint: TEarthPoint;
    procedure SetID(const Value: Integer);
    procedure SetName(const Value: string);
    procedure SetPointCount(const Value: integer);
    procedure SetAreaColor(const Value: Tcolor);
    procedure SetAreaType(const Value: byte);
    procedure SetDevList(const Value: TStringList);
    procedure SetIsDraw(const Value: Boolean);
    procedure SetMeta(const Value: TWorldMeta);
    procedure SetWorldPointAry(const Value: TWorldPointAry);
    procedure SetArriveDateTime(const Value: TDateTime);
    procedure SetLeaveDateTime(const Value: TDateTime);
  public
    constructor Create;
    destructor Destroy; override;
    procedure SetLengthPointAry(const ANumber: integer);
    {向列表中加入 车机ID}
    procedure AddDevId(ADevID: string);
    procedure DeleteDevID(ADevID: string);
    {清除列表中的 车机ID}
    procedure ClearDevId;
    {设置图元,考虑是否要将这些区域保存为图层？？？2005-6-20}
    procedure WorldPointAryToOutBox(APolygon: TWorldPointAry; Start, Length: Integer);
    property Meta: TWorldMeta read FMeta write SetMeta;
    //区域ID号
    property ID: integer read FID write SetID;
    //区域的名字
    property Name: string read FName write SetName;
    //区域类型 现在有五种
    property AreaType: byte read FAreaType write SetAreaType;
    //区域的颜色
    property AreaColor: Tcolor read FAreaColor write SetAreaColor;
    //是否在地图上画出
    property IsDraw: Boolean read FIsDraw write SetIsDraw;
    //点的总数
    property PointCount: integer read FPointCount write SetPointCount;
    //property WayPointCount:integer read FWayPointCount write FWayPointCount;
    property WorldPointAry: TWorldPointAry read FWorldPointAry write SetWorldPointAry;
    //设置了 限定区域的 车机ID 列表
    property DevList: TStringList read FDevList write SetDevList;
    //超速的速度
    property OverSpeet: Integer read FOverSpeet write FOverSpeet;
    //外报巨型
    property OutBox: TWorldRect read FOutBox write FOutBox;
    //报警距离,当车离或靠线路的距离,如果在这距离内就报警;
    property AlarmDistance: integer read FAlarmDistance write FAlarmDistance;
    //固定路线巨型列表
    property RunWayRectList: TRunWayRectList read FRunWayRectList write FRunWayRectList;
    //是否启用有效时间
    property IsEnabledTime: boolean read FIsEnabledTime write FIsEnabledTime;
    //开始时间
    property BeginTime: TDatetime read FBeginTime write FBeginTime;
    //结束时间
    property EndTime: TDatetime read FEndTime write FEndTime;
    //显示POP
    property IsShowPop: boolean read FIsShowPop write FIsShowPop;
    // 区域报警时判断是否已经提示过
    property IsOutAllow: Boolean read FIsOutAllow write FIsOutAllow;

    property AntiFakeType: Byte read FAntiFakeType write FAntiFakeType;
    property AntiFakeText: string read FAntiFakeText write FAntiFakeText;
    property AntiFakePicFilePath: string read FAntiFakePicFilePath write FAntiFakePicFilePath;

    property MinSpeed: Integer read FMinSpeed write FMinSpeed;  // 进入电子围栏后判断疑似上访时的最低速度
    property MaintainTime: Integer read FMaintainTime write FMaintainTime;
    property ArriveDateTime: TDateTime read FArriveDateTime write SetArriveDateTime;
    property LeaveDateTime: TDateTime read FLeaveDateTime write SetLeaveDateTime;
    property Area_Type: Byte read FArea_Type write FArea_Type;//区域类型  0：圆 1：矩形 2：多边形
    property Radius: Double read FRadius write FRadius;                    //半径
    property CenterPoint: TEarthPoint read FCenterPoint write FCenterPoint;//圆心
    property LastPoint: TEarthPoint read FLastPoint write FLastPoint;       // 最后一点
  end;

  //固定路线巨型列表,把固定路由改成一个一个巨型组成,即巨型列表
  TRunWayRectList = class
  private
    FRectAry: array of TRunWayRect;
    FOutBox: TWorldRect;
    function GetItems(Index: integer): TRunWayRect;
    function GetCount: integer;
  public
      //添加一个巨型
    function Add(MinXPoint, MinYPoint, MaxXPoint, MaxYPoint: TPoint): integer;
      //判断一点是否在这个巨型列表中
    function PointInRectList(APoint: TPoint): boolean;
      //删除这个巨型列表
    procedure Delete;
    constructor Create;
    destructor Destroy; override;
  public
    property Items[Index: integer]: TRunWayRect read GetItems;
    property Count: integer read GetCount;
      //包巨型
    property OutBox: TWorldRect read FOutBox;
  end;



  TAreaManage = class
  private
     Flist: TintegerList;
    FMaxId: integer;
    function GetItems(index: integer): TConfineArea;
    function GetCount: Integer;
    procedure SetMaxId(const Value: integer);
    procedure SetCount(const Value: Integer);
  protected
  public
    constructor Create;
    destructor Destroy; override;
    function Add(const AID: integer): TConfineArea;
    function Insert(const AID: integer; index: integer): TConfineArea;
    procedure Delete(const AID: integer);
    {当用户点刷新时，如果车辆有变化时，需同时删除掉 刷新有存在，而现已删除掉的车}
    procedure Refresh_DevChanged;
    procedure Clear;
    function Find(const AAreaId: integer): TConfineArea;
    //保存现有的区域 到 文件中
    procedure SaveCurrentAreasToFile(const AFileName: string);
    //从 文件 中载入区域
    procedure LoadAreasFromFile(const AFileName: string);
    property Items[index: integer]: TConfineArea read GetItems;
    property Count: integer read GetCount write SetCount;
    property MaxId: integer read FMaxId write SetMaxId;
  end;

  //区域列表主要用在TDevice里,加这个是解决一个车可以有多个区域
  TAreaList = class(TObject)
  private
    FAreaArr: array of TConfineArea;
    FIsOutAllow: array of boolean;
    FBeginTime: array of TDatetime;
    function GetCount: integer;
    function GetItems(index: integer): TConfineArea;
    function GetBeginTime(index: integer): TDatetime;
    function GetIsOutAllow(index: integer): boolean;
    procedure SetBeginTime(index: integer; const Value: TDatetime);
    procedure SetIsOutAllow(index: integer; const Value: boolean);
  public
    constructor Create;
    destructor Destroy; override;
      //添加一个区域
    function Add(Area: TConfineArea): integer;
      //移除一个区域,只移除引用,不删除对象
    procedure Remove(Area: TConfineArea);
    procedure Clear;
  public
    property Items[index: integer]: TConfineArea read GetItems;
    property ItemsIsOutAllow[index: integer]: boolean read GetIsOutAllow write SetIsOutAllow;
    property ItemsBeginTime[index: integer]: TDatetime read GetBeginTime write SetBeginTime;
    property Count: integer read GetCount;
  end;

  //=======发送基类=====//
  TBaseArea = class(Tobject)
  private
    FAreaName: string;
    FidlingAlarmValue: integer;
    FOverAlarmValue: integer;
    FAreaAlarmKind: integer;
    FAreaPictureKind: integer; //0  圆 1 巨 2 不规整  3:折线(设置线路)
    FAreaID: integer;
    FAreaDevList: TStringList;
    FisDeleteState: integer;
    FAreaPar: string;
    fAreaParMcu: string;
    Fisshow: boolean;

    FAreaNO: Integer;   //  区域编号
    FBeginDateTime: TDateTime;   // 起始时间
    FEndDateTime: TDateTime;     // 结束时间
    FMaxSpeed: Word;             // 最高速度
    FContinueTime: Byte;
    FIsEveryDay: Boolean;
    FIsSpeedLimited: Boolean;         // 持续时间

    procedure SetAreaName(const Value: string);
    procedure SetidlingAlarmValue(const Value: integer);
    procedure SetOverAlarmValue(const Value: integer);
    procedure SetAreaAlarmKind(const Value: integer);
    procedure SetAreaPictureKind(const Value: integer);
    procedure SetAreaID(const Value: integer);
    procedure SetAreaDevList(const Value: TStringList);
    procedure SetisDeleteState(const Value: integer);
    procedure SetAreaPar(const Value: string);
    procedure SetAreaParMcu(const Value: string);
    procedure Setisshow(const Value: boolean);

    procedure SetAreaNO(const Value: Integer);
    procedure SetBeginDateTime(const Value: TDateTime);
    procedure SetEndDateTime(const Value: TDateTime);
    procedure SetMaxSpeed(const Value: Word);
    procedure SetContinueTime(const Value: Byte);
    procedure SetIsEveryDay(const Value: Boolean);
    procedure SetIsSpeedLimited(const Value: Boolean);

  public
    constructor Create;
    destructor Destroy; override;
    function DeleteDev(dev_id: string): integer; //删除一个车机
    procedure AddDev(Dev_Id:String);//添加一个车机
    procedure ClearDev();//删除所有车机
    property OverAlarmValue: integer read FOverAlarmValue write SetOverAlarmValue; //超速报警值
    property idlingAlarmValue: integer read FidlingAlarmValue write SetidlingAlarmValue; //怠速报警值
    property AreaName: string read FAreaName write SetAreaName;
    property AreaPar: string read FAreaPar write SetAreaPar;
    property AreaParMcu: string read fAreaParMcu write SetAreaParMcu;
    property AreaAlarmKind: integer read FAreaAlarmKind write SetAreaAlarmKind;
    property AreaPictureKind: integer read FAreaPictureKind write SetAreaPictureKind;
    property AreaID: integer read FAreaID write SetAreaID;
    property AreaDevList: TStringList read FAreaDevList write SetAreaDevList;
    property isDeleteState: integer read FisDeleteState write SetisDeleteState; //发送删除状态    0  未发送  1发送状态 2删除成功 ==在发送状态下 当对应的车机关系列表数目为0时 说明删除成功  此时管理区域也需要删除此对象
    property isshow:boolean read Fisshow write Setisshow;

    property areaNO: Integer read FAreaNO write SetAreaNO;
    property IsEveryDay:Boolean read FIsEveryDay write SetIsEveryDay;//是否限制每天
    property beginDateTiem: TDateTime read FBeginDateTime write SetBeginDateTime;
    property endDateTime: TDateTime read FEndDateTime write SetEndDateTime;
    property maxSpeed: Word read FMaxSpeed write SetMaxSpeed;
    property continueTime: Byte read FContinueTime write SetContinueTime;
    property IsSpeedLimited: Boolean read FIsSpeedLimited write SetIsSpeedLimited;
  end;

  //=====
  TCircleArea = class(TBaseArea) //圆形
  private
    Fradius: integer;
    FACircle: TEarthPoint;
    FAradius: integer;
    FlastPoint: TEarthPoint;
    procedure Setradius(const Value: integer);
    procedure SetACircle(const Value: TEarthPoint);
    procedure SetAradius(const Value: integer);
    procedure SetlastPoint(const Value: TEarthPoint);
  public
    constructor Create;
    destructor Destroy; override;
    //由数据库存储格式，转为两个点及半径     对AreaPar数据进行分解
    procedure TransDbDataToShow();

    property radius: integer read Fradius write Setradius; //坐标半径
    property ACircle: TEarthPoint read FACircle write SetACircle;
    property lastPoint:TEarthPoint read FlastPoint write SetlastPoint;
  end;

  TRectangleArea = class(TBaseArea) //矩形
    private
    FleftPoint: TEarthPoint;
    FRightPoint: TEarthPoint;
    procedure SetleftPoint(const Value: TEarthPoint);
    procedure SetRightPoint(const Value: TEarthPoint);
    public
      constructor Create;
      destructor Destroy; override;
      property leftPoint:TEarthPoint read FleftPoint write SetleftPoint;
      property RightPoint:TEarthPoint read FRightPoint write SetRightPoint;

  end;
  TNoSymbolArea = class(TBaseArea) //不规则图形
  private
    Fparam: TstringList;
    FWorldPointAry: TWorldPointAry;
    FPointCount: integer;
    FOutBox: TWorldRect;
    FCenterWPoint: TWorldPoint;
    FCenterEPoint: TEarthPoint;
    procedure Setparam(const Value: TstringList);
    procedure SetWorldPointAry(const Value: TWorldPointAry);
    procedure SetPointCount(const Value: integer);
    procedure SetCenterWPoint(const Value: TWorldPoint);
    procedure SetCenterEPoint(const Value: TEarthPoint);

  public
    constructor Create;
    destructor Destroy; override;
    procedure SetLengthPointAry(const ANumber: integer);
    procedure WorldPointAryToOutBox(APolygon: TWorldPointAry; Start, Length: Integer);
    function Getparam(AreaPar: string; parlen: integer): TWorldPointAry;

    property param:TstringList read Fparam write Setparam;
    property WorldPointAry: TWorldPointAry read FWorldPointAry write SetWorldPointAry;
    property PointCount: integer read FPointCount write SetPointCount;
    property OutBox: TWorldRect read FOutBox write FOutBox;
    property CenterWPoint:TWorldPoint read FCenterWPoint write SetCenterWPoint;//外包矩形的中点
    property CenterEPoint:TEarthPoint read FCenterEPoint write SetCenterEPoint;
  end;

  TLineSection = class(TObject)
  private
    FLineSectionProperty: Byte;
    FLineSectionWidth: Byte;
    FLineSectionOverSpeedTime: Byte;
    FLineSectionRunMinTime: Word;
    FLineSectionRunMaxTime: Word;
    FLineSectionMaxSpeed: Word;
    FLineSectionId: Integer;
    FWPointAry: TWorldPointAry;
    function GetPointCount: Integer;
    procedure SetLineSectionMaxSpeed(const Value: Word);
    procedure SetLineSectionOverSpeedTime(const Value: Byte);
    procedure SetLineSectionProperty(const Value: Byte);
    procedure SetLineSectionRunMaxTime(const Value: Word);
    procedure SetLineSectionRunMinTime(const Value: Word);
    procedure SetLineSectionWidth(const Value: Byte);
    procedure SetLineSectionId(const Value: Integer);
    procedure SetWPointAry(const Value: TWorldPointAry);
  public
    constructor Create;
    destructor Destroy; override;
    procedure SetWorldPointAryLength(len: Integer);
    function getLineSectionInfo(): string;
    function getPointStr(): string;

    property LineSectionId: Integer read FLineSectionId write SetLineSectionId;
    property LineSectionWidth: Byte read FLineSectionWidth write SetLineSectionWidth;
    property LineSectionProperty: Byte read FLineSectionProperty write SetLineSectionProperty;
    property LineSectionRunMaxTime: Word read FLineSectionRunMaxTime write SetLineSectionRunMaxTime;
    property LineSectionRunMinTime: Word read FLineSectionRunMinTime write SetLineSectionRunMinTime;
    property LineSectionMaxSpeed: Word read FLineSectionMaxSpeed write SetLineSectionMaxSpeed;
    property LineSectionOverSpeedTime: Byte read FLineSectionOverSpeedTime write SetLineSectionOverSpeedTime;
    property WPointAry: TWorldPointAry read FWPointAry write SetWPointAry;
    property PointCount: Integer read GetPointCount;
  end;

  TPolyLineArea = class(TBaseArea) //折线
  private
    Fparam: TstringList;
    FLineSectionList: TIntegerList;
    FWorldPointAry: TWorldPointAry;
    FPointCount: integer;
    FOutBox: TWorldRect;
    FCenterWPoint: TWorldPoint;
    FCenterEPoint: TEarthPoint;
    FMaxLineSectionNo: Integer;
    procedure Setparam(const Value: TstringList);
    procedure SetWorldPointAry(const Value: TWorldPointAry);
    procedure SetPointCount(const Value: integer);
    procedure SetCenterWPoint(const Value: TWorldPoint);
    procedure SetCenterEPoint(const Value: TEarthPoint);
    function GetLineSectionCount: Integer;
    function GetLineSection(Index: Integer): TLineSection;

  public
    constructor Create;
    destructor Destroy; override;
    procedure SetLengthPointAry(const ANumber: integer);
    procedure WorldPointAryToOutBox(APolygon: TWorldPointAry; Start, Length: Integer);
    function Getparam(AreaPar: string; parlen: integer): TWorldPointAry;
    procedure ClearLineSectionList;
    function AddLineSection(lineSectionId: Integer): TLineSection;
    function FindLineSection(lineSectionNo: Integer): TLineSection;
    procedure SetLineAllWorldPointAry;

    procedure setAreaPar();

    property param:TstringList read Fparam write Setparam;
    property WorldPointAry: TWorldPointAry read FWorldPointAry write SetWorldPointAry;
    property PointCount: integer read FPointCount write SetPointCount;
    property OutBox: TWorldRect read FOutBox write FOutBox;
    property CenterWPoint:TWorldPoint read FCenterWPoint write SetCenterWPoint;//外包矩形的中点
    property CenterEPoint:TEarthPoint read FCenterEPoint write SetCenterEPoint;
    property LineSections[Index: Integer]: TLineSection read GetLineSection;
    property LineSectionCount: Integer read GetLineSectionCount;
    property MaxLineSectionNo: Integer read FMaxLineSectionNo;
  end;

  TAllAreaMange = class(Tobject) //所有的图形管理
  private
    FMaxAreaNo: Integer;
    FAllCircleList: TObjectList;
    FMaxLineSectionNo: Integer;
    procedure SetAllCircleList(const Value: TObjectList);
  public
    constructor Create;
    destructor Destroy; override;
    function Add(BaseArea: TBaseArea): integer; //圆形
    procedure Delete(AreaID: integer); //删除区域
    procedure DeleteByAreaNo(AreaNo: integer); //删除区域
    function find(AreaID: integer): TBaseArea;
    function findByAreaNo(AreaNo: Integer): TBaseArea;
    function findByLineSectionNo(lineSectionNo: Integer): TPolyLineArea;
    function GetAreaNo(): Integer;
    procedure Clear;

    //分配这个这个区域的关系车辆信息
    procedure insertDevTOArea(dev_id: integer; AreaID: integer); //把对应的车辆分配给对应的区域
    property AllCircleList: TObjectList read FAllCircleList write SetAllCircleList;
    property MaxLineSectionNo: Integer read FMaxLineSectionNo;

  end;

  TFactoryArea = class(TObject)
  private
    FID: integer;
      //名称
    FName: string;
      //编号
    FNO: integer;
      //中心点
    FX: integer;
    FY: integer;
      //范围(米)
    FScope: integer;
      //距离(米)
    FDistance: integer;
      //矩形
    FLeft: integer;
    FRight: integer;
    FBottom: integer;
    FTop: integer;
    FTypeID: integer;
  public
    function SaveData: boolean;
  public
      //ID
    property ID: integer read FID write FID;
      //类型   0:工厂   1:工地
    property TypeID: integer read FTypeID write FTypeID;
      //名称
    property Name: string read FName write FName;
      //编号
    property NO: integer read FNO write FNO;
      //中心点
    property X: integer read FX write FX;
    property Y: integer read FY write FY;
      //矩形
    property XLeft: integer read FLeft write FLeft;
    property YTop: integer read FTop write FTop;
    property XRight: integer read FRight write FRight;
    property YBottom: integer read FBottom write FBottom;
      //范围(米)
    property Scope: integer read FScope write FScope;
      //距离(米)
    property Distance: integer read FDistance write FDistance;
  end;


  TFactoryAreaManage = class(TObject)
  private
    FList: TObjectList;
    function GetItems(index: integer): TFactoryArea;
    procedure SetItems(index: integer; const Value: TFactoryArea);
    function GetCount: integer;
  public
    constructor Create;
    destructor Destroy; override;
    function Add(FactoryArea: TFactoryArea): integer;
    //移除一个区域,只移除引用,不删除对象
    function Remove(FactoryArea: TFactoryArea): integer; overload;
    function Remove(Index: integer): integer; overload;
    function LoadData: boolean;
    function SaveData: boolean;
    //查找X,Y这一点是否有工厂信息
    function Find(x, y: integer): TFactoryArea;

    procedure Clear;

    property Items[index: integer]: TFactoryArea read GetItems write SetItems;
    property Count: integer read GetCount;
  end;



  //----路段类
  TRoad = class
  private
    FFrobidRunBeginTime: TDateTime;
    FFrobidRunEndTime: TDateTime;
    FOverSpeedTimes: Integer;
    FRoadWidth: Integer;
    FMinRunTime: Integer;
    FIsVisible: Integer;
    FRoad_Id: Integer;
    FMaxSpeed: Integer;
    FRoadProperty: Integer;
    FMaxRunTime: Integer;
    FRoadColor: Integer;
    FRoadPointCnt: Integer;
    FRoadPoints_ToMcu: String;
    FRoadPoints_use: string;
    FRoadPointAry: TEarthPointAry;
    procedure SetFrobidRunBeginTime(const Value: TDateTime);
    procedure SetFrobidRunEndTime(const Value: TDateTime);
    procedure SetIsVisible(const Value: Integer);
    procedure SetMaxRunTime(const Value: Integer);
    procedure SetMaxSpeed(const Value: Integer);
    procedure SetMinRunTime(const Value: Integer);
    procedure SetOverSpeedTimes(const Value: Integer);
    procedure SetRoad_Id(const Value: Integer);
    procedure SetRoadColor(const Value: Integer);
    procedure SetRoadPointCnt(const Value: Integer);
    procedure SetRoadPoints_ToMcu(const Value: String);
    procedure SetRoadPoints_use(const Value: string);
    procedure SetRoadProperty(const Value: Integer);
    procedure SetRoadWidth(const Value: Integer);
    procedure SetRoadPointAry(const Value: TEarthPointAry);
  public
    constructor Create;
    destructor Destroy; override;
    property Road_Id:Integer read FRoad_Id write SetRoad_Id;
    property RoadWidth:Integer read FRoadWidth write SetRoadWidth;//m 路段道路宽度
    property RoadProperty:Integer read FRoadProperty write SetRoadProperty;//路段属性
    property MinRunTime:Integer read FMinRunTime write SetMinRunTime;//路段最短行驶时间
    property MaxRunTime :Integer read FMaxRunTime write SetMaxRunTime;//路段最长行驶时间
    property MaxSpeed :Integer read FMaxSpeed write SetMaxSpeed;//路段最高速度
    property OverSpeedTimes:Integer read FOverSpeedTimes write SetOverSpeedTimes;//路段超速持续时间
    property FrobidRunBeginTime:TDateTime read FFrobidRunBeginTime write SetFrobidRunBeginTime;//路段禁行起始时间
    property FrobidRunEndTime:TDateTime read FFrobidRunEndTime write SetFrobidRunEndTime;//路段禁行结束时间
    property RoadPointCnt :Integer read FRoadPointCnt write SetRoadPointCnt;//路段总拐点数
    property RoadPoints_use:string read FRoadPoints_use write SetRoadPoints_use;//拐点项
    property RoadPoints_ToMcu:String read FRoadPoints_ToMcu write SetRoadPoints_ToMcu;
    property RoadPointAry:TEarthPointAry read FRoadPointAry write SetRoadPointAry; //地球坐标的 数组，每一维表示为(118.xxxxxx,32.xxxxxx)
    property IsVisible: Integer read FIsVisible write SetIsVisible;
    property RoadColor:Integer read FRoadColor write SetRoadColor;//颜色
  end;

  //--路段管理器类
  TRoadManage= class
  private
    FRoadList: TIntegerList;
    procedure SetRoadList(const Value: TIntegerList);
    procedure Remove(const AnIndex: integer);
    function Getcount: Integer;
    function GetItems(index: integer): TRoad;
  public
    constructor Create;
    destructor Destroy; override;
    function Add(road: TRoad): integer;overload; //添加
    function Add(roadId:Integer):TRoad;overload;//添加，这是参照carUnit的TDeviceManage中写的。
    procedure Delete(roadId: integer); //删除
    function find(roadId: integer): TRoad;
    property RoadList: TIntegerList read FRoadList write SetRoadList;
    property Items[index: integer]: TRoad read GetItems;
    property Count: Integer read Getcount;
   end;

implementation
uses MapProj, geome, emape, carUnit, uGloabVar, uMainf, math;
{ TConfineArea }

procedure TConfineArea.AddDevId(ADevID: string);
var
  i: Integer;
begin
  i := FDevList.IndexOf(ADevID);
  if i = -1 then
    FDevList.Add(ADevID);
end;

{procedure TConfineArea.ChangeXY2LoLa;
begin
  if FPointCount =0 then exit;
  SetLength(FEarthPointAry,FPointCount);
end;   }

procedure TConfineArea.ClearDevId;
var
  i: Integer;
  //m: TConfineArea;
begin
  //for i:= 0 to FDevList.Count -1 do
  i := 0;
  while i < FDevList.Count do
  begin
    FDevList.Delete(i);
  end;
end;

constructor TConfineArea.Create;
begin
  FDevList := TStringList.Create;
  FDevList.Sorted := True;
  FRunWayRectList := TRunWayRectList.Create;
  FIsEnabledTime := false;
end;

procedure TConfineArea.DeleteDevID(ADevID: string);
var
  indx: integer;
begin
  indx := FDevlist.IndexOf(AdevId);
  if indx >= 0 then
    Fdevlist.Delete(indx);
end;

destructor TConfineArea.Destroy;
begin
  FDevList.Free;
  SetLengthPointAry(0);
  FRunWayRectList.Free;
  inherited;
end;

procedure TConfineArea.SetAreaColor(const Value: Tcolor);
begin
  FAreaColor := Value;
end;

procedure TConfineArea.SetAreaType(const Value: byte);
begin
  FAreaType := Value;
end;

procedure TConfineArea.SetDevList(const Value: TStringList);
begin
  FDevList := Value;
end;

{procedure TConfineArea.SetEarthPointAry(const Value: TEarthPointAry);
begin
  FEarthPointAry := Value;
end; }

procedure TConfineArea.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TConfineArea.SetIsDraw(const Value: Boolean);
begin
  FIsDraw := Value;
end;

procedure TConfineArea.SetLengthPointAry(const ANumber: integer);
begin
  FPointCount := ANumber;
  SetLength(FWorldPointAry, ANumber);
  //SetLength(FEarthPointAry,ANumber);
end;

{procedure TConfineArea.SetLengthWayPointAry(const ANumber: integer);
begin
  FWayPointCount := ANumber;
  SetLength(FWayWorldPointAry,ANumber);
  SetLength(FWayEarthPointAry,ANumber);
end;  }


procedure TConfineArea.SetMeta(const Value: TWorldMeta);
begin
  FMeta := Value;
end;

procedure TConfineArea.SetName(const Value: string);
begin
  FName := Value;
end;


procedure TConfineArea.WorldPointAryToOutBox(APolygon: TWorldPointAry; Start, Length: Integer);
var
  i: Integer;
  WorldOutBox: TWorldRect;
begin
  //求出外包矩形
  WorldOutBox.Xmin := MaxInt;
  WorldOutBox.Ymin := MaxInt;
  WorldOutBox.Xmax := -MaxInt;
  WorldOutBox.Ymax := -MaxInt;
  for i := Start to Start + Length - 1 do
  begin
    WorldOutBox.Xmin := min(WorldOutBox.Xmin, APolygon[i].x);
    WorldOutBox.Ymin := min(WorldOutBox.Ymin, APolygon[i].y);
    WorldOutBox.Xmax := max(WorldOutBox.Xmax, APolygon[i].x);
    WorldOutBox.Ymax := max(WorldOutBox.Ymax, APolygon[i].y);
  end;
  FOutBox := WorldOutBox;
end;

procedure TConfineArea.SetPointCount(const Value: integer);
begin
  FPointCount := Value;
end;

{procedure TConfineArea.SetSetMeta;
var
  i: integer;
begin
  FMeta.ID := FID;
  FMeta.Enabled := True;
  FMeta.Outbox := GeometryCalc.InitEarthRect;
  for i:= 0 to FPointCount -1 do
  begin
    FMeta.Outbox := GeometryCalc.MergeEarthRect(FMeta.Outbox,FEarthPointAry[i]);
  end;
  Fmeta.ScaleLimit := true;
  FMeta.MinScale := GeometryCalc.MetaIgnore_Rect(meta.Outbox,6);
  FMeta.MaxScale :=  999999;;
  FMeta._type := _PolyRegion;
  FMeta.PolyRegion.Pen.Width := 2;
  FMeta.PolyRegion.Pen.color :=  FAreaColor;
  //FMeta.PolyRegion.PtAddress
  //FMeta.PolyRegion.SPtAddress
  FMeta.PolyRegion.Count := FPointCount;
end;}

procedure TConfineArea.SetWorldPointAry(const Value: TWorldPointAry);
begin
  FWorldPointAry := Value;
end;



procedure TConfineArea.SetArriveDateTime(const Value: TDateTime);
begin
  FArriveDateTime := Value;
end;

procedure TConfineArea.SetLeaveDateTime(const Value: TDateTime);
begin
  FLeaveDateTime := Value;
end;

{ TAreaManage }

function TAreaManage.Add(const AID: integer): TConfineArea;
var
  i: Integer;
begin
  if FMaxId <= AID then FMaxId := AID + 1;
  i := FList.IndexOf(AID);
  if i >= 0 then
    Result := Items[i]
  else
  begin
    Result := TConfineArea.Create;
    Result.Id := AID;
    FList.AddData(AID, Result);
  end;
  // := AID +1;
end;

function TAreaManage.Insert(const AID: integer; index: integer): TConfineArea;
var
  i: Integer;
begin
  if FMaxId <= AID then FMaxId := AID + 1;
  i := FList.IndexOf(AID);
  if i >= 0 then
    Result := Items[i]
  else
  begin
    Result := TConfineArea.Create;
    Result.Id := AID;
    FList.InsertData(index, AID, Result);
  end;

end;

procedure TAreaManage.Clear;
var
  i: integer;
begin
  i := 0;
  while i < count do //for i:= 0 to Count -1 do
  begin
    Delete(Items[i].FId);
  end;
  FMaxId := 0;
end;

constructor TAreaManage.Create;
begin
  FList := TIntegerList.Create;
 // FList.Sorted := True;
  FMaxId := 0;
end;

procedure TAreaManage.Delete(const AID: integer);
var
  i: Integer;
  m: TConfineArea;
begin
  i := FList.IndexOf(AID);
  if i >= 0 then
  begin
    m := TConfineArea(FList.Datas[i]);
    FList.Delete(i);
    m.Free;
  end;
end;

destructor TAreaManage.Destroy;
begin
  Flist.Free;
  inherited;
end;

function TAreaManage.Find(const AAreaId: integer): TConfineArea;
var
  i: integer;
begin
  Result := nil;
  i := Flist.IndexOf(AAreaId);
  if i >= 0 then
    Result := Items[i];
end;

function TAreaManage.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TAreaManage.GetItems(index: integer): TConfineArea;
begin
  Result := TConfineArea(FList.Datas[Index]);
end;


procedure TAreaManage.LoadAreasFromFile(const AFileName: string);
var
  ff: TIniFile;
  area: TConfineArea;
  i, j, cnt, areaCnt, temp: integer;
  sectionName: string;
  dev: TDevice;
  devID: string;
  MinXPoint, MinYPoint, MaxXPoint, MaxYPoint: TPoint;
  s: string;
  CenterPoint: TEarthPoint;
  LastPoint: TEarthPoint;
begin
  if not FileExists(AFileName) then exit;
  ff := TIniFile.Create(AFileName);
  try
    areaCnt := ff.ReadInteger('manage', 'count', 0);
    if areaCnt = 0 then exit;
    for i := 0 to areaCnt - 1 do
    begin
      sectionName := 'area' + IntToStr(i);
      j := ff.ReadInteger(sectionName, 'Id', 0);
      area := Add(j);
      area.FPointCount := ff.ReadInteger(sectionName, 'PointCount', 0);
      area.FName := ff.Readstring(sectionName, 'name', '');
      area.AreaType := ff.ReadInteger(sectionName, 'AreaType', 0);
      area.AreaColor := ff.ReadInteger(sectionName, 'AreaColor', 0);
      area.OverSpeet := ff.ReadInteger(sectionName, 'OverSpeet', 0);
      area.IsDraw := ff.ReadBool(sectionName, 'IsDraw', False);
      cnt := ff.ReadInteger(sectionName, 'EarthPointCnt', 0);

      area.FIsEnabledTime := ff.ReadBool(sectionName, 'IsEnabledTime', false);
      area.FBeginTime := StrToTime(ff.ReadString(sectionName, 'BeginTime', '17:00:00'));

      area.FEndTime := StrToTime(ff.ReadString(sectionName, 'EndTime', '06:00:00'));

      area.FIsShowPop := ff.ReadBool(sectionName, 'IsShowPop', true);

      area.Area_Type := ff.ReadInteger(sectionName, 'Area_Type', 0);
      area.Radius := ff.ReadFloat(sectionName, 'Radius', 0);

      CenterPoint.Longitude := ff.ReadFloat(sectionName, 'Center_log', 0);
      CenterPoint.Latitude := ff.ReadFloat(sectionName, 'Center_lat', 0);
      area.CenterPoint := CenterPoint;

      LastPoint.Longitude := ff.ReadFloat(sectionName, 'Last_log', 0);
      LastPoint.Latitude := ff.ReadFloat(sectionName, 'Last_lat', 0);
      area.LastPoint := LastPoint;

      area.AntiFakeType := ff.ReadInteger(sectionName, 'AntiFakeType', 0);
      area.AntiFakeText := ff.ReadString(sectionName, 'AntiFakeText', '防伪');
      area.AntiFakePicFilePath := ff.ReadString(sectionName, 'AntiFakePicFilePath', '');
      area.ArriveDateTime := ff.ReadDateTime(sectionName, 'ArriveTime', 0);
      area.LeaveDateTime := ff.ReadDateTime(sectionName, 'LeaveTime', 0);
      
      SetLength(area.FWorldPointAry, cnt);
      for j := 0 to cnt - 1 do
      begin
        s := ff.ReadString(sectionName, IntToStr(j), '');
        if s = '' then continue;
        temp := pos(',', s);
        try
          area.WorldPointAry[j].X := StrToInt(Copy(s, 1, temp - 1));
          area.WorldPointAry[j].Y := StrToInt(Copy(s, temp + 1, 12)); //ff.ReadInteger(sectionName,'Y'+IntToStr(j),0);
        except
          continue;
        end;
      end;
      //读取固定路线数据
      if (area.AreaType = ALARM_WAY_OUT) or (area.AreaType = ALARM_WAY_IN) then
      begin
        for j := 0 to area.FPointCount - 1 - 1 do //有N个点就有N-1个巨型
        begin
          MinXPoint.X := ff.ReadInteger(sectionName, 'MinXPoint_X' + IntToStr(j), 0);
          MinYPoint.X := ff.ReadInteger(sectionName, 'MinYPoint_X' + IntToStr(j), 0);
          MaxXPoint.X := ff.ReadInteger(sectionName, 'MaxXPoint_X' + IntToStr(j), 0);
          MaxYPoint.X := ff.ReadInteger(sectionName, 'MaxYPoint_X' + IntToStr(j), 0);

          MinXPoint.Y := ff.ReadInteger(sectionName, 'MinXPoint_Y' + IntToStr(j), 0);
          MinYPoint.Y := ff.ReadInteger(sectionName, 'MinYPoint_Y' + IntToStr(j), 0);
          MaxXPoint.Y := ff.ReadInteger(sectionName, 'MaxXPoint_Y' + IntToStr(j), 0);
          MaxYPoint.Y := ff.ReadInteger(sectionName, 'MaxYPoint_Y' + IntToStr(j), 0);
          area.RunWayRectList.Add(MinXPoint, MinYPoint, MaxXPoint, MaxYPoint);
        end;
      end;
      area.WorldPointAryToOutBox(area.WorldPointAry, 0, area.PointCount);
      cnt := ff.ReadInteger(sectionName, 'DevCnt', 0);
      for j := 0 to cnt - 1 do
      begin
        devID := ff.ReadString(sectionName, 'DevId' + IntToStr(j), '');
        dev := ADeviceManage.Find(devId);
        if dev <> nil then
        begin
          area.AddDevId(devID);
          dev.AreaList.Add(area); //2006-12-26   dxf add for 同一车可以在多区域
        end;
      end;
      GCurConfineArea := area;
    end;
  finally
    ff.Free;
  end;
end;

procedure TAreaManage.Refresh_DevChanged; //针对刷新时，当前车辆有可能减少，采取的相关措施
var
  i, j: integer;
  devCnt: integer;
  area: TConfineArea;
  devId: string;
  dev: TDevice;
begin
  for i := 0 to Count - 1 do
  begin
    area := Items[i];
    devCnt := area.DevList.Count;
    if devCnt = 0 then Continue;
    j := 0;
    while j < devCnt do
    begin
      devId := area.DevList[j];
      dev := ADeviceManage.Find(devId);
      if dev = nil then //如果此车已不存在，从相应区域中删掉该车
      begin
        area.DeleteDevID(devID);
        devCnt := devCnt - 1;
      end
      else
      begin
        {if area.AreaType= ALARM_OUT then//因为车机已经重新载入过，其区域ID为-1，现将区域ID赋上。
          dev.OutCAreaId := area.ID
        else if area.AreaType = ALARM_IN then
          dev.InCAreaId := area.ID;    }
        j := j + 1;
      end;
    end;
  end;
end;

procedure TAreaManage.SaveCurrentAreasToFile(const AFileName: string);
var
  ff: TIniFile;
  area: TConfineArea;
  i, j: integer;
  sectionName: string;
begin
  if FileExists(AFileName) then
    DeleteFile(AFileName);
  if Count = 0 then exit;
  ff := TIniFile.Create(AFileName);
  try

    //保存固定路线有读取路线要改
    ff.WriteInteger('manage', 'count', Count);
    for i := 0 to Count - 1 do
    begin
      area := Items[i];
      sectionName := 'area' + IntToStr(i);
      ff.WriteInteger(sectionName, 'PointCount', area.FPointCount);
      ff.WriteInteger(sectionName, 'Id', area.ID);
      ff.WriteString(sectionName, 'name', area.Name);
      ff.WriteInteger(sectionName, 'AreaType', area.AreaType);
      ff.WriteInteger(sectionName, 'AreaColor', area.AreaColor);
      ff.WriteInteger(sectionName, 'EarthPointCnt', length(area.FWorldPointAry));

      ff.WriteBool(sectionName, 'IsEnabledTime', area.FIsEnabledTime);
      ff.WriteString(sectionName, 'BeginTime', FormatDatetime('hh:nn:ss', area.FBeginTime));
      ff.WriteString(sectionName, 'EndTime', FormatDatetime('hh:nn:ss', area.FEndTime));
      ff.WriteBool(sectionName, 'IsShowPop', area.FIsShowPop);

      ff.WriteInteger(sectionName, 'Area_Type', area.Area_Type);
      ff.WriteFloat(sectionName, 'Radius', area.Radius);
      ff.WriteFloat(sectionName, 'Center_log', area.CenterPoint.Longitude);
      ff.WriteFloat(sectionName, 'Center_lat', area.CenterPoint.Latitude);      
      ff.WriteFloat(sectionName, 'Last_log', area.LastPoint.Longitude);
      ff.WriteFloat(sectionName, 'Last_lat', area.LastPoint.Latitude); 


      ff.WriteInteger(sectionName, 'AntiFakeType', area.AntiFakeType);
      ff.WriteString(sectionName, 'AntiFakeText', area.AntiFakeText);
      ff.WriteString(sectionName, 'AntiFakePicFilePath', area.AntiFakePicFilePath);
      ff.WriteString(sectionName, 'ArriveTime', FormatDateTime('yyyy-MM-dd hh:nn:ss', area.ArriveDateTime));
      ff.WriteString(sectionName, 'LeaveTime', FormatDateTime('yyyy-MM-dd hh:nn:ss', area.LeaveDateTime));

      for j := 0 to length(area.FWorldPointAry) - 1 do
      begin
            //ff.WriteInteger(sectionName,'X'+IntToStr(j),area.FWorldPointAry[j].X);
            //ff.WriteInteger(sectionName,'Y'+IntToStr(j),area.FWorldPointAry[j].Y);
        ff.WriteString(sectionName, IntToStr(j), IntToStr(area.FWorldPointAry[j].X) + ',' + IntToStr(area.FWorldPointAry[j].Y));
      end;
      ff.WriteInteger(sectionName, 'DevCnt', area.FDevList.Count);
      for j := 0 to area.FDevList.Count - 1 do
        ff.WriteString(sectionName, 'DevId' + IntToStr(j), area.DevList.Strings[j]);
      ff.WriteBool(sectionName, 'IsDraw', area.IsDraw);
      ff.WriteInteger(sectionName, 'OverSpeet', area.OverSpeet);
      if (area.AreaType = ALARM_WAY_OUT) or (area.AreaType = ALARM_WAY_IN) then //for 固定路线
      begin
        for j := 0 to area.RunWayRectList.Count - 1 do
        begin
          ff.WriteInteger(sectionName, 'MinXPoint_X' + IntToStr(j), area.RunWayRectList.Items[j].MinXPoint.X);
          ff.WriteInteger(sectionName, 'MinYPoint_X' + IntToStr(j), area.RunWayRectList.Items[j].MinYPoint.X);
          ff.WriteInteger(sectionName, 'MaxXPoint_X' + IntToStr(j), area.RunWayRectList.Items[j].MaxXPoint.X);
          ff.WriteInteger(sectionName, 'MaxYPoint_X' + IntToStr(j), area.RunWayRectList.Items[j].MaxYPoint.X);

          ff.WriteInteger(sectionName, 'MinXPoint_Y' + IntToStr(j), area.RunWayRectList.Items[j].MinXPoint.Y);
          ff.WriteInteger(sectionName, 'MinYPoint_Y' + IntToStr(j), area.RunWayRectList.Items[j].MinYPoint.Y);
          ff.WriteInteger(sectionName, 'MaxXPoint_Y' + IntToStr(j), area.RunWayRectList.Items[j].MaxXPoint.Y);
          ff.WriteInteger(sectionName, 'MaxYPoint_Y' + IntToStr(j), area.RunWayRectList.Items[j].MaxYPoint.Y);
        end;
      end;
    end;
  finally
    ff.Free;
  end;
end;

procedure TAreaManage.SetCount(const Value: Integer);
begin
  Count := Value;
end;

procedure TAreaManage.SetMaxId(const Value: integer);
begin
  FMaxId := Value;
end;

{ TAreaList }

function TAreaList.Add(Area: TConfineArea): integer;
var
  i, tcount: integer;
begin
  tcount := Count;
  for i := 0 to tcount - 1 do
  begin
    if FAreaArr[i] = Area then
    begin
      Result := i;
      exit;
    end;
  end;
  SetLength(FAreaArr, tcount + 1);
  FAreaArr[tcount] := Area;

  SetLength(FIsOutAllow, tcount + 1);
  SetLength(FBeginTime, tcount + 1);
  FIsOutAllow[tcount] := false;
  FBeginTime[tcount] := 0;
  Result := tcount;
end;



function TAreaList.GetBeginTime(index: integer): TDatetime;
begin
  Result := FBeginTime[index];
end;

function TAreaList.GetCount: integer;
begin
  Result := Length(FAreaArr);
end;




function TAreaList.GetIsOutAllow(index: integer): boolean;
begin
  Result := FIsOutAllow[index];
end;

function TAreaList.GetItems(index: integer): TConfineArea;
begin
  Result := FAreaArr[Index];
end;

procedure TAreaList.Remove(Area: TConfineArea);
var
  i, tcount: integer;
  isFind: boolean;
begin
  tcount := Count;
  isFind := false;
  for i := 0 to tcount - 1 do
  begin
    if isFind then
    begin
      FAreaArr[i - 1] := FAreaArr[i];
      FIsOutAllow[i - 1] := FIsOutAllow[i];
      FBeginTime[i - 1] := FBeginTime[i];
    end else
      if FAreaArr[i] = Area then
      begin
        isFind := true;
      end;
  end;
  if isFind then
  begin
    SetLength(FAreaArr, tcount - 1);
    SetLength(FIsOutAllow, tcount - 1);
    SetLength(FBeginTime, tcount - 1);
  end;
end;

procedure TAreaList.Clear;
var
  i: Integer;
  area: TConfineArea;
begin
  for i := 0 to Length(FAreaArr) - 1 do
  begin
    area := FAreaArr[i];
    area.Free;
  end;  
  SetLength(FAreaArr, 0);
  SetLength(FIsOutAllow, 0);
  SetLength(FBeginTime, 0);
end;

{ TRunWayRectList }

{function TRunWayRectList.Add(ARect: TWorldRect): integer;
var
  i,tcount:integer;
begin
    tcount:=Count;
    for i:=0 to tcount-1 do
    begin
        if (ARect.Xmin=FRectAry[i].Xmin)and(ARect.Xmax=FRectAry[i].Xmax)and
           (ARect.Ymin=FRectAry[i].Ymin)and(ARect.Ymax=FRectAry[i].Ymax)then
        begin
            Result:=i;
            exit;
        end;
    end;
    if tcount=0 then
    begin
        FOutBox:=ARect;
    end
    else
    begin
        FOutBox.Xmin:=Min(FOutBox.Xmin,ARect.Xmin);
        FOutBox.Ymin:=Min(FOutBox.Ymin,ARect.Ymin);
        FOutBox.Xmax:=Max(FOutBox.Xmax,ARect.Xmax);
        FOutBox.Ymax:=Max(FOutBox.Ymax,ARect.Ymax);
    end;
    SetLength(FRectAry,tcount+1);
    FRectAry[tcount]:=ARect;
    Result:=tcount;
end;      }

function TRunWayRectList.Add(MinXPoint, MinYPoint, MaxXPoint, MaxYPoint: TPoint): integer;
var
  tempRect: TWorldRect;
  tcount: integer;
begin
  tcount := Count;
  SetLength(FRectAry, tcount + 1);
  FOutBox.Xmin := Min(FOutBox.Xmin, MinXPoint.X);
  FOutBox.Ymin := Min(FOutBox.Ymin, MinYPoint.Y);
  FOutBox.Xmax := Max(FOutBox.Xmax, MaxXPoint.X);
  FOutBox.Ymax := Max(FOutBox.Ymax, MaxYPoint.Y);
  FRectAry[tcount].MinXPoint := MinXPoint;
  FRectAry[tcount].MinYPoint := MinYPoint;
  FRectAry[tcount].MaxXPoint := MaxXPoint;
  FRectAry[tcount].MaxYPoint := MaxYPoint;
end;

constructor TRunWayRectList.Create;
begin
  FOutBox.Xmin := MaxInt;
  FOutBox.Ymin := MaxInt;
  FOutBox.Xmax := -MaxInt;
  FOutBox.Ymax := -MaxInt;
end;

procedure TRunWayRectList.Delete;
begin
  Setlength(FrectAry, 0);
end;

destructor TRunWayRectList.Destroy;
begin
  SetLength(FRectAry, 0);
  inherited;
end;

function TRunWayRectList.GetCount: integer;
begin
  Result := length(FRectAry);
end;

function TRunWayRectList.GetItems(Index: integer): TRunWayRect;
begin
  Result := FRectAry[Index];
end;

function TRunWayRectList.PointInRectList(APoint: TPoint): boolean;
var
  i: integer;
begin
  Result := false;
  if not GeometryCalc.PointInRect(APoint, FOutBox) then exit;
  for i := 0 to Count - 1 do
  begin
    if GeometryCalc.PointInPolygon(APoint, TWorldPointAry(@FRectAry[i].PointList[0]), 0, 4) then
    begin
      Result := True;
      exit;
    end;
  end;
end;

procedure TAreaList.SetBeginTime(index: integer; const Value: TDatetime);
begin
  FBeginTime[index] := Value;
end;

procedure TAreaList.SetIsOutAllow(index: integer; const Value: boolean);
begin
  FIsOutAllow[index] := Value;
end;

constructor TAreaList.Create;
begin

end;

destructor TAreaList.Destroy;
begin
  Clear;
  inherited;
end;

{ TFactoryAreaManage }

function TFactoryAreaManage.Add(FactoryArea: TFactoryArea): integer;
begin
  Result := FList.Add(FactoryArea);
end;

constructor TFactoryAreaManage.Create;
begin
  FList := TObjectList.Create;
end;

destructor TFactoryAreaManage.Destroy;
begin
  Clear;
  FList.Free;
  inherited;
end;

function TFactoryAreaManage.GetItems(index: integer): TFactoryArea;
begin
  if (index >= 0) and (index < FList.Count) then
  begin
    Result := TFactoryArea(FList.Items[index])
  end
  else
  begin
    Result := nil;
  end;
end;

function TFactoryAreaManage.Remove(FactoryArea: TFactoryArea): integer;
begin
  Result := FList.Remove(FactoryArea);
end;

function TFactoryAreaManage.LoadData: boolean;
begin

end;

function TFactoryAreaManage.Remove(Index: integer): integer;
begin
  Result := Remove(GetItems(Index));
end;

function TFactoryAreaManage.SaveData: boolean;
begin

end;

procedure TFactoryAreaManage.SetItems(index: integer;
  const Value: TFactoryArea);
begin
  if (index >= 0) and (index < FList.Count) then
  begin
    FList.Items[index] := Value;
  end;
end;

function TFactoryAreaManage.Find(x, y: integer): TFactoryArea;
var
  i: integer;
  Left, Right, Top, Button: integer;
begin
  Result := nil;
  Left := X - 200;
  Right := X + 200;
  Top := Y + 200;
  Button := Y - 200;
  for i := 0 to Count - 1 do
  begin
    if (Self.Items[i].X >= Left) and (Self.Items[i].X <= Right) and (Self.Items[i].Y >= Button) and (Self.Items[i].Y <= Top) then
    begin
      Result := Self.Items[i];
    end
  end;
end;

function TFactoryAreaManage.GetCount: integer;
begin
  Result := FList.Count;
end;

procedure TFactoryAreaManage.Clear;
var
  area: TFactoryArea;
begin
  while FList.Count > 0 do
  begin
    area := TFactoryArea(FList.Items[0]);
    area.Free;
    FList.Delete(0);
  end;  
end;

{ TFactoryArea }

function TFactoryArea.SaveData: boolean;
begin

end;

{ TCircleArea }

constructor TCircleArea.Create;
begin
  inherited;
end;

destructor TCircleArea.Destroy;
begin

  inherited;
end;


procedure TCircleArea.SetACircle(const Value: TEarthPoint);
begin
  FACircle := Value;
end;

procedure TCircleArea.SetAradius(const Value: integer);
begin
  FAradius := Value;
end;

procedure TCircleArea.SetlastPoint(const Value: TEarthPoint);
begin
  FlastPoint := Value;
end;

procedure TCircleArea.Setradius(const Value: integer);
begin
  Fradius := Value;
end;

procedure TCircleArea.TransDbDataToShow;
var
  down, zt: integer;
  Acircle: TEarthPoint;
  lastPoint:TEarthPoint;
  areaParStr: String;
begin
//对AreaPar数据进行分解
  if AreaPar ='' then
  begin
    exit;
  end;
  areaParStr := AreaPar;
  down := pos(',', areaParStr);
  zt := length(areaParStr);
  Acircle.X := strtofloat(copy(areaParStr, 1, down - 1)) / 1000000.0;
  areaParStr := copy(areaParStr, down + 1, zt - down);
  down := pos(',', areaParStr);
  zt := length(areaParStr);
  Acircle.y := strtofloat(copy(areaParStr, 1, down - 1)) / 1000000.0;
  self.FACircle := Acircle;

  areaParStr := copy(areaParStr, down + 1, zt - down);
  down := pos(',', areaParStr);
  zt := length(areaParStr);
  self.Fradius := strtoint(copy(areaParStr, 1, down - 1));

  areaParStr := copy(areaParStr, down + 1, zt - down);
  down := pos(',', areaParStr);
  zt := length(areaParStr);
  lastpoint.Longitude :=  strtofloat(copy(areaParStr, 1, down - 1)) / 1000000.0;
  lastpoint.Latitude := strtofloat(copy(areaParStr, down + 1, zt - down))/1000000.0;
  self.FlastPoint:=lastpoint;
end;

{ TAllAreaMange }


function TAllAreaMange.Add(BaseArea: TBaseArea): integer;
var
  polyLineArea: TPolyLineArea;
begin
  FAllCircleList.Insert(0, BaseArea);
  if BaseArea.AreaPictureKind = 3 then
  begin
    polyLineArea := TPolyLineArea(BaseArea);
    if FMaxLineSectionNo < polyLineArea.MaxLineSectionNo then
      FMaxLineSectionNo := polyLineArea.MaxLineSectionNo;
  end;
  if BaseArea.areaNO > FMaxAreaNo then
    FMaxAreaNo := BaseArea.areaNO;
end;

procedure TAllAreaMange.Clear;
begin
  FAllCircleList.Clear;
end;

constructor TAllAreaMange.Create;
var
  i: Integer;
begin
  FAllCircleList := TObjectList.Create;
  FMaxAreaNo := 0;  
end;

procedure TAllAreaMange.Delete(AreaID: integer);
var
  i: integer;
  area: TBaseArea;
begin
  for i := 0 to FAllCircleList.Count - 1 do
  begin
    area := TBaseArea(FAllCircleList.Items[i]);
    if area.AreaID = AreaID then
    begin
      FAllCircleList.Delete(i);
      break;
    end;
  end;
end;

procedure TAllAreaMange.DeleteByAreaNo(AreaNo: integer);
var
  i: integer;
  area: TBaseArea;
begin
  for i := 0 to FAllCircleList.Count - 1 do
  begin
    area := TBaseArea(FAllCircleList.Items[i]);
    if area.AreaNo = AreaNo then
    begin
      //FreeAndNil(area);
      FAllCircleList.Delete(i);
      break;
    end;
  end;
end;

destructor TAllAreaMange.Destroy;
begin
  Clear;
  FAllCircleList.Free;
  inherited;
end;

function TAllAreaMange.find(AreaID: integer): TBaseArea;
var
  KIND: INTEGER;
  i: integer;
begin
  result := nil;
  for i := 0 to FAllCircleList.Count - 1 do
  begin
    if TBaseArea(FAllCircleList.Items[i]).AreaID = AreaID then
    begin
      kind := TBaseArea(FAllCircleList.Items[i]).FAreaPictureKind;
      case kind of
        0: begin
            result := TCircleArea(FAllCircleList.Items[i]);
          end;
        1: begin
            result := TRectangleArea(FAllCircleList.Items[i]);
          end;
        2: begin
            result := TNoSymbolArea(FAllCircleList.Items[i]);
          end;
        3: begin
             Result := TPolyLineArea(FAllCircleList.Items[i]);
           end;  
      end;
      break;
    end;
  end;
end;

function TAllAreaMange.findByAreaNo(AreaNo: Integer): TBaseArea;
var
  KIND: INTEGER;
  i: integer;
  baseArea: TBaseArea;
begin
  result := nil;
  for i := 0 to FAllCircleList.Count - 1 do
  begin
    baseArea := TBaseArea(FAllCircleList.Items[i]);
    if (baseArea.AreaNo = AreaNo) then
    begin
      //kind := TBaseArea(FAllCircleList.Items[i]).FAreaPictureKind;
      case baseArea.AreaPictureKind of
        0: begin
            result := TCircleArea(baseArea);
          end;
        1: begin
            result := TRectangleArea(baseArea);
          end;
        2: begin
            result := TNoSymbolArea(baseArea);
          end;
        3: begin
             Result := TPolyLineArea(baseArea);
           end;  
      end;
      break;
    end;
  end;
end;

function TAllAreaMange.findByLineSectionNo(
  lineSectionNo: Integer): TPolyLineArea;
var
  i: integer;
  baseArea: TBaseArea;
  polyLineArea: TPolyLineArea;
begin
  result := nil;
  for i := 0 to FAllCircleList.Count - 1 do
  begin
    baseArea := TBaseArea(FAllCircleList.Items[i]);
    if (baseArea.AreaPictureKind = 3) then
    begin//只有路线中有路段
      polyLineArea := TPolyLineArea(baseArea);
      if polyLineArea.FindLineSection(lineSectionNo) <> nil then
      begin
        Result := polyLineArea;
        Break;
      end;  
    end;
  end;
end;

function TAllAreaMange.GetAreaNo: Integer;
var
  i: Integer;
begin
  Result := FMaxAreaNo + 1;
end;

procedure TAllAreaMange.insertDevTOArea(dev_id, AreaID: integer);
var
  baseArea: TBaseArea;
begin

end;

procedure TAllAreaMange.SetAllCircleList(const Value: TObjectList);
begin
  FAllCircleList := Value;
end;


{ TBaseArea }

constructor TBaseArea.Create;
begin
  FAreaDevList := TStringList.Create;
  Fisshow:=false;
end;

function TBaseArea.DeleteDev(dev_id: string): integer;
var
  i: integer;
begin
  result := -1;
  i := FAreaDevList.IndexOf(dev_id);
  if i < 0 then Exit;//没找到
  FAreaDevList.Delete(i);
//  for i := 0 to FAreaDevList.Count - 1 do
//  begin
//    if FAreaDevList.Strings[i] = dev_id then
//    begin
//      FAreaDevList.Delete(i);
      result := 1;
//      break;
//    end;
//  end;
end;

procedure TBaseArea.AddDev(Dev_Id: String);
var
  i: Integer;
begin
  i := FAreaDevList.IndexOf(dev_id);
  if i < 0 then
  begin
    FAreaDevList.Add(Dev_Id);
  end;
end;

destructor TBaseArea.Destroy;
begin
  FAreaDevList.Free;
  inherited;
end;

procedure TBaseArea.SetAreaAlarmKind(const Value: integer);
begin
  FAreaAlarmKind := Value;
end;



procedure TBaseArea.SetAreaDevList(const Value: TStringList);
begin
  FAreaDevList := Value;
end;

procedure TBaseArea.SetAreaID(const Value: integer);
begin
  FAreaID := Value;
end;

procedure TBaseArea.SetAreaName(const Value: string);
begin
  FAreaName := Value;
end;

procedure TBaseArea.SetAreaPar(const Value: string);
begin
  FAreaPar := Value;
end;

procedure TBaseArea.SetAreaParMcu(const Value: string);
begin
  fAreaParMcu := Value;
end;

procedure TBaseArea.SetAreaPictureKind(const Value: integer);
begin
  FAreaPictureKind := Value;
end;

procedure TBaseArea.SetidlingAlarmValue(const Value: integer);
begin
  FidlingAlarmValue := Value;
end;

procedure TBaseArea.SetisDeleteState(const Value: integer);
begin
  FisDeleteState := Value;
end;

procedure TBaseArea.Setisshow(const Value: boolean);
begin
  Fisshow := Value;
end;

procedure TBaseArea.SetAreaNO(const Value: Integer);
begin
  FAreaNO := Value;
end;

procedure TBaseArea.SetBeginDateTime(const Value: TDateTime);
begin
  FBeginDateTime := Value;
end;

procedure TBaseArea.SetEndDateTime(const Value: TDateTime);
begin
  FEndDateTime := Value;
end;

procedure TBaseArea.SetMaxSpeed(const Value: Word);
begin
  FMaxSpeed := Value;
end;

procedure TBaseArea.SetContinueTime(const Value: Byte);
begin
  FContinueTime := Value;
end;

procedure TBaseArea.SetOverAlarmValue(const Value: integer);
begin
  FOverAlarmValue := Value;
end;

procedure TBaseArea.SetIsEveryDay(const Value: Boolean);
begin
  FIsEveryDay := Value;
end;         

procedure TBaseArea.ClearDev;
var
  i: Integer;
begin
  i := 0;
  while i < FAreaDevList.Count do
  begin
    FAreaDevList.Delete(i);
  end;
end;

procedure TBaseArea.SetIsSpeedLimited(const Value: Boolean);
begin
  FIsSpeedLimited := Value;
end;

{ TNoSymbolArea }

constructor TNoSymbolArea.Create;
begin
  inherited;
  Fparam:=TstringList.Create;
end;

destructor TNoSymbolArea.Destroy;
begin
  Fparam.Free;
  inherited;
end;


procedure TNoSymbolArea.SetCenterWPoint(const Value: TWorldPoint);
begin
  FCenterWPoint := Value;
end;

procedure TNoSymbolArea.SetLengthPointAry(const ANumber: integer);
begin
  FPointCount := ANumber;
  SetLength(FWorldPointAry, ANumber);
end;

procedure TNoSymbolArea.Setparam(const Value: TstringList);
begin
  Fparam := Value;
end;

procedure TNoSymbolArea.SetPointCount(const Value: integer);
begin
  FPointCount := Value;
end;

procedure TNoSymbolArea.SetWorldPointAry(const Value: TWorldPointAry);
begin
  FWorldPointAry := Value;
end;

procedure TNoSymbolArea.WorldPointAryToOutBox(APolygon: TWorldPointAry;
  Start, Length: Integer);  
var
  i: Integer;
  WorldOutBox: TWorldRect;
begin
  //求出外包矩形
  WorldOutBox.Xmin := MaxInt;
  WorldOutBox.Ymin := MaxInt;
  WorldOutBox.Xmax := -MaxInt;
  WorldOutBox.Ymax := -MaxInt;
  for i := Start to Start + Length - 1 do
  begin
    WorldOutBox.Xmin := min(WorldOutBox.Xmin, APolygon[i].x);
    WorldOutBox.Ymin := min(WorldOutBox.Ymin, APolygon[i].y);
    WorldOutBox.Xmax := max(WorldOutBox.Xmax, APolygon[i].x);
    WorldOutBox.Ymax := max(WorldOutBox.Ymax, APolygon[i].y);
  end;
  FOutBox := WorldOutBox;
  //求出外包矩形的 中点(地球坐标)
  FCenterWPoint.X := (WorldOutBox.BottomRight.X - WorldOutBox.TopLeft.X ) div 2 + WorldOutBox.TopLeft.X;
  FCenterWPoint.Y := (WorldOutBox.BottomRight.Y - WorldOutBox.TopLeft.Y ) div 2 + WorldOutBox.TopLeft.Y;
  FCenterEPoint := Project.XY2LoLa(FCenterWPoint);
end;

function TNoSymbolArea.Getparam(AreaPar: string; parlen: integer): TWorldPointAry;
var
  WPointsAry: TWorldPointAry;
  k: integer;
  down, zt: integer;
begin
  setlength(WPointsAry, parlen div 2);
  k := 0;
  while k < parlen do
  begin
    if k = parlen-2 then
    begin
      down := pos(',', AreaPar);
      zt := length(AreaPar);
      WPointsAry[k div 2].X := strtoint(copy(AreaPar, 1, down - 1));
      WPointsAry[k div 2].Y := strtoint(copy(AreaPar, down + 1, zt - down));
    end else
    begin
      down := pos(',', AreaPar);
      zt := length(AreaPar);
      WPointsAry[k div 2].X := strtoint(copy(AreaPar, 1, down - 1));
      AreaPar := copy(AreaPar, down + 1, zt - down);
      down := pos(',', AreaPar);
      WPointsAry[k div 2].Y := strtoint(copy(AreaPar, 1, down - 1));
      zt := length(AreaPar);
      AreaPar := copy(AreaPar, down + 1, zt - down);
    end;
    inc(k, 2);
  end;
  result:=WPointsAry;
end;

procedure TNoSymbolArea.SetCenterEPoint(const Value: TEarthPoint);
begin
  FCenterEPoint := Value;
end;

{ TRectangleArea }

constructor TRectangleArea.Create;
begin
  inherited;
end;

destructor TRectangleArea.Destroy;
begin

  inherited;
end;

procedure TRectangleArea.SetleftPoint(const Value: TEarthPoint);
begin
  FleftPoint := Value;
end;

procedure TRectangleArea.SetRightPoint(const Value: TEarthPoint);
begin
  FRightPoint := Value;
end;

{ TRoadManage }

function TRoadManage.Add(road: TRoad): integer;
var
  i: integer;
begin
  i := FRoadList.IndexOf(road.Road_Id);
  if i >= 0 then
    Result := i
  else
  begin
    FRoadList.AddData(road.Road_Id, road);
    Result := FRoadList.IndexOf(road.Road_Id);
  end;
end;

function TRoadManage.Add(roadId: Integer): TRoad;
var
  i: integer;
begin
  i := FRoadList.IndexOf(roadId);
  if i >= 0 then
    Result := Items[i]
  else
  begin
    Result := TRoad.Create;
    Result.Road_Id := roadId;
    FRoadList.AddData(roadId, Result);
  end;  
end;

constructor TRoadManage.Create;
begin
  FRoadList := TIntegerList.Create;
end;

procedure TRoadManage.Remove(const AnIndex: integer);
var
  m: TRoad;
begin
  m := TRoad(FRoadList.Datas[AnIndex]);
  FRoadList.Delete(AnIndex);
  m.Free;
end;

procedure TRoadManage.Delete(roadId: integer);
var
  i: integer;
begin
  i:=  FRoadList.IndexOf(roadId);
  if i<>-1 then
    Remove(i);
end;

destructor TRoadManage.Destroy;
var
  i :Integer;
begin
  for i:= FRoadList.Count -1 downto 0 do
    FRoadList.Delete(i);
  FRoadList.Free;
  inherited;
end;

function TRoadManage.find(roadId: integer): TRoad;
var
  i: integer;
begin
  i:=  FRoadList.IndexOf(roadId);
  if i= -1 then
    result := nil
  else
    Result := Items[i];
end;


procedure TRoadManage.SetRoadList(const Value: TIntegerList);
begin
  FRoadList := Value;
end;

function TRoadManage.Getcount: Integer;
begin
  Result := FRoadList.Count;
end;

function TRoadManage.GetItems(index: integer): TRoad;
begin
  Result := TRoad(FRoadList.Datas[index]);
end;



{ TRoad }

constructor TRoad.Create;
begin

end;

destructor TRoad.Destroy;
begin

  inherited;
end;

procedure TRoad.SetFrobidRunBeginTime(const Value: TDateTime);
begin
  FFrobidRunBeginTime := Value;
end;

procedure TRoad.SetFrobidRunEndTime(const Value: TDateTime);
begin
  FFrobidRunEndTime := Value;
end;

procedure TRoad.SetIsVisible(const Value: Integer);
begin
  FIsVisible := Value;
end;

procedure TRoad.SetMaxRunTime(const Value: Integer);
begin
  FMaxRunTime := Value;
end;

procedure TRoad.SetMaxSpeed(const Value: Integer);
begin
  FMaxSpeed := Value;
end;

procedure TRoad.SetMinRunTime(const Value: Integer);
begin
  FMinRunTime := Value;
end;

procedure TRoad.SetOverSpeedTimes(const Value: Integer);
begin
  FOverSpeedTimes := Value;
end;

procedure TRoad.SetRoad_Id(const Value: Integer);
begin
  FRoad_Id := Value;
end;

procedure TRoad.SetRoadColor(const Value: Integer);
begin
  FRoadColor := Value;
end;

procedure TRoad.SetRoadPointCnt(const Value: Integer);
begin
  FRoadPointCnt := Value;
end;

procedure TRoad.SetRoadPoints_ToMcu(const Value: String);
begin
  FRoadPoints_ToMcu := Value;
end;

procedure TRoad.SetRoadPoints_use(const Value: string);
begin
  FRoadPoints_use := Value;
end;

procedure TRoad.SetRoadProperty(const Value: Integer);
begin
  FRoadProperty := Value;
end;

procedure TRoad.SetRoadWidth(const Value: Integer);
begin
  FRoadWidth := Value;
end;

procedure TRoad.SetRoadPointAry(const Value: TEarthPointAry);
begin
  FRoadPointAry := Value;
end;

{ TPolyLineArea }

function TPolyLineArea.AddLineSection(
  lineSectionId: Integer): TLineSection;
var
  i: Integer;
begin
  i := FLineSectionList.IndexOf(lineSectionId);
  if i < 0 then
  begin
    Result := TLineSection.Create;
    Result.LineSectionId := lineSectionId;
    FLineSectionList.AddData(lineSectionId, Result);
    if FMaxLineSectionNo < lineSectionId then
      FMaxLineSectionNo := lineSectionId;
  end
  else
  begin
    Result := LineSections[i];
  end;
end;

procedure TPolyLineArea.ClearLineSectionList;
var
  lineSection: TLineSection;
begin
  while FLineSectionList.Count > 0 do
  begin
    lineSection := TLineSection(FLineSectionList.Datas[0]);
    FLineSectionList.Delete(0);
    lineSection.Free;
  end;  
end;

constructor TPolyLineArea.Create;
begin
  inherited;
  FAreaID := -1;
  FAreaPictureKind := 3;
  Fisshow := True;
  Fparam:=TstringList.Create;
  FLineSectionList := TIntegerList.Create;
end;

destructor TPolyLineArea.Destroy;
begin
  Fparam.Clear;
  Fparam.Free;

  ClearLineSectionList;
  FLineSectionList.Free;
  inherited;
end;

function TPolyLineArea.FindLineSection(
  lineSectionNo: Integer): TLineSection;
var
  i: Integer;
begin
  Result := nil;
  i := FLineSectionList.IndexOf(lineSectionNo);
  if i >= 0 then
    Result := LineSections[i];
end;

function TPolyLineArea.GetLineSection(Index: Integer): TLineSection;
begin
  Result := TLineSection(FLineSectionList.Datas[Index]);
end;

function TPolyLineArea.GetLineSectionCount: Integer;
begin
  Result := FLineSectionList.Count;
end;

function TPolyLineArea.Getparam(AreaPar: string;
  parlen: integer): TWorldPointAry;
var
  WPointsAry: TWorldPointAry;
  k: integer;
  down, zt: integer;
begin
  setlength(WPointsAry, parlen div 2);
  k := 0;
  while k < parlen do
  begin
    if k = parlen-2 then
    begin
      down := pos(',', AreaPar);
      zt := length(AreaPar);
      WPointsAry[k div 2].X := strtoint(copy(AreaPar, 1, down - 1));
      WPointsAry[k div 2].Y := strtoint(copy(AreaPar, down + 1, zt - down));
    end else
    begin
      down := pos(',', AreaPar);
      zt := length(AreaPar);
      WPointsAry[k div 2].X := strtoint(copy(AreaPar, 1, down - 1));
      AreaPar := copy(AreaPar, down + 1, zt - down);
      down := pos(',', AreaPar);
      WPointsAry[k div 2].Y := strtoint(copy(AreaPar, 1, down - 1));
      zt := length(AreaPar);
      AreaPar := copy(AreaPar, down + 1, zt - down);
    end;
    inc(k, 2);
  end;
  result:=WPointsAry;
end;

procedure TPolyLineArea.setAreaPar;
var
  i: Integer;
  lineSection: TLineSection;
begin
  AreaPar := '';
  for i := 0 to LineSectionCount - 1 do
  begin
    lineSection := TLineSection(FLineSectionList.Datas[i]);
    if i = 0 then
      AreaPar := lineSection.getLineSectionInfo
    else
      AreaPar := AreaPar + ';' + lineSection.getLineSectionInfo;
  end;
end;

procedure TPolyLineArea.SetCenterEPoint(const Value: TEarthPoint);
begin
  FCenterEPoint := Value;
end;

procedure TPolyLineArea.SetCenterWPoint(const Value: TWorldPoint);
begin
  FCenterWPoint := Value;
end;

procedure TPolyLineArea.SetLengthPointAry(const ANumber: integer);
begin
  FPointCount := ANumber;
  SetLength(FWorldPointAry, ANumber);
end;

procedure TPolyLineArea.SetLineAllWorldPointAry;
var
  i, j: Integer;
  lineSection: TLineSection;
  lastLen: Integer;
begin
  if FLineSectionList.Count > 0 then
  begin
    lastLen := 0;
    for i := 0 to FLineSectionList.Count - 1 do
    begin
      lineSection := TLineSection(FLineSectionList.Datas[i]);
      if lineSection.PointCount > 0 then
      begin
        SetLength(FWorldPointAry, lastLen + lineSection.PointCount);
        for j := 0 to lineSection.PointCount - 1 do
        begin
          FWorldPointAry[lastLen + j].X := lineSection.WPointAry[j].X;
          FWorldPointAry[lastLen + j].Y := lineSection.WPointAry[j].Y;
        end;
        lastLen := lastLen + lineSection.PointCount;
      end;  
    end;  
  end;  
end;

procedure TPolyLineArea.Setparam(const Value: TstringList);
begin
  Fparam := Value;
end;

procedure TPolyLineArea.SetPointCount(const Value: integer);
begin
  FPointCount := Value;
end;

procedure TPolyLineArea.SetWorldPointAry(const Value: TWorldPointAry);
begin
  FWorldPointAry := Value;
end;

procedure TPolyLineArea.WorldPointAryToOutBox(APolygon: TWorldPointAry;
  Start, Length: Integer);
var
  i: Integer;
  WorldOutBox: TWorldRect;
begin
  //求出外包矩形
  WorldOutBox.Xmin := MaxInt;
  WorldOutBox.Ymin := MaxInt;
  WorldOutBox.Xmax := -MaxInt;
  WorldOutBox.Ymax := -MaxInt;
  for i := Start to Start + Length - 1 do
  begin
    WorldOutBox.Xmin := min(WorldOutBox.Xmin, APolygon[i].x);
    WorldOutBox.Ymin := min(WorldOutBox.Ymin, APolygon[i].y);
    WorldOutBox.Xmax := max(WorldOutBox.Xmax, APolygon[i].x);
    WorldOutBox.Ymax := max(WorldOutBox.Ymax, APolygon[i].y);
  end;
  FOutBox := WorldOutBox;
  //求出外包矩形的 中点(地球坐标)
  FCenterWPoint.X := (WorldOutBox.BottomRight.X - WorldOutBox.TopLeft.X ) div 2 + WorldOutBox.TopLeft.X;
  FCenterWPoint.Y := (WorldOutBox.BottomRight.Y - WorldOutBox.TopLeft.Y ) div 2 + WorldOutBox.TopLeft.Y;
  FCenterEPoint := Project.XY2LoLa(FCenterWPoint);
end;

{ TLineSection }

constructor TLineSection.Create;
begin
  
end;

destructor TLineSection.Destroy;
begin
  SetLength(FWPointAry, 0);
  inherited;
end;

function TLineSection.getLineSectionInfo: string;
begin
  Result := IntToStr(FLineSectionId) + ',' + IntToStr(FLineSectionWidth) + ',' + IntToStr(FLineSectionProperty) + ','
          + IntToStr(FLineSectionMaxSpeed) + ',' + IntToStr(FLineSectionRunMinTime) + ',' + IntToStr(FLineSectionMaxSpeed) + ','
          + IntToStr(FLineSectionOverSpeedTime) + ',' + IntToStr(Length(FWPointAry)) + ',' + getPointStr;
end;

function TLineSection.GetPointCount: Integer;
begin
  Result := Length(FWPointAry);
end;

function TLineSection.getPointStr: string;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to PointCount - 1 do
  begin
    if i <> 0 then
      Result := Result + ',' + IntToStr(FWPointAry[i].X) + ',' + IntToStr(FWPointAry[i].Y)
    else
      Result := IntToStr(FWPointAry[i].X) + ',' + IntToStr(FWPointAry[i].Y);
  end;
end;

procedure TLineSection.SetLineSectionId(const Value: Integer);
begin
  FLineSectionId := Value;
end;

procedure TLineSection.SetLineSectionMaxSpeed(const Value: Word);
begin
  FLineSectionMaxSpeed := Value;
end;

procedure TLineSection.SetLineSectionOverSpeedTime(const Value: Byte);
begin
  FLineSectionOverSpeedTime := Value;
end;

procedure TLineSection.SetLineSectionProperty(const Value: Byte);
begin
  FLineSectionProperty := Value;
end;

procedure TLineSection.SetLineSectionRunMaxTime(const Value: Word);
begin
  FLineSectionRunMaxTime := Value;
end;

procedure TLineSection.SetLineSectionRunMinTime(const Value: Word);
begin
  FLineSectionRunMinTime := Value;
end;

procedure TLineSection.SetLineSectionWidth(const Value: Byte);
begin
  FLineSectionWidth := Value;
end;

procedure TLineSection.SetWorldPointAryLength(len: Integer);
begin
  SetLength(FWPointAry, len);
end;

procedure TLineSection.SetWPointAry(const Value: TWorldPointAry);
begin
  FWPointAry := Value;
end;

end.

