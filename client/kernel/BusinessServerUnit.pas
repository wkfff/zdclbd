{智能监控端 与  业务服务器的通讯
 @created(2004-03-19)
<<<<<<< BusinessServerUnit.pas
 @lastmod(GMT:$Date: 2012/12/31 05:06:19 $) <BR>
 最后更新人:$Author: wfp $<BR>
 当前版本:$Revision: 1.3 $<BR>}


unit BusinessServerUnit;

interface
uses
  Classes, SConnect, DBClient, Controls, Forms, types, Windows, Variants, SysUtils, MetaDefine,
  Dialogs, BusinessServe_TLB, UserUnit, CarUnit, DB, ExtCtrls, {OrderUnit,} CmdStructUnit, ConfineAreaUnit,
  Service, InvokeRegistry, XMLDoc,xmldom, XMLIntf, msxmldom, IntegerListUnit, ActiveX,StdCtrls;

type

  TsendPerMessage = procedure(Value: string) of object;
  TQueryCarAndDevInfo = procedure of object;

  TQueryCondition = record
    Flag: Word;//用来区分执行哪个接口
    STime: string;
    ETime: string;
    DevId: string;
    GroupId: Integer;
    GroupIdList: string;
    PageSize: Integer;
    CurrPageIndex: Integer;
    QueryFlag: Byte;//车辆上传行驶里程的查询方式 0：总计 1：按时 2：按天 3：按月
  end;

  TOnQueryDataCount = procedure(DataCount: Integer) of object;
  TOnQueryDataByPage = procedure(AInfo: OleVariant) of object;
  TOnQueryMediaDataByPage = procedure(AInfo: ArrayOfPicInfo) of object;


  TQueryNotices = class(TThread)//系统启动后，一次性将一个月前到目前所有未读的通知读取
  private
    FQueryCarAndDevInfo: TQueryCarAndDevInfo;

    procedure GetData;
  protected
    procedure Execute; override;
  public
    constructor Create();
    destructor Destroy();
    property OnQueryCarAndDevInfo: TQueryCarAndDevInfo read FQueryCarAndDevInfo write FQueryCarAndDevInfo;
  end;
    
  TQueryDataCountThread = class(TThread)
  private
    FQueryCondition: TQueryCondition;
    FOnQueryDataCount: TOnQueryDataCount;
    procedure SetOnQueryDataCount(const Value: TOnQueryDataCount);
  protected
    procedure Execute; override;
  public
    constructor Create(queryCondition: TQueryCondition);
    destructor Destroy();
    property OnQueryDataCount: TOnQueryDataCount read FOnQueryDataCount write SetOnQueryDataCount;
  end;

  TQueryDataThread = class (TThread)
  private
    FQueryCondition: TQueryCondition;

    FInfo: OleVariant;
    FOnQueryData: TOnQueryDataByPage;

    procedure setData;
    procedure SetOnQueryData(const Value: TOnQueryDataByPage);
  protected
    procedure Execute; override;
  public
    constructor Create(queryCondition: TQueryCondition);
    destructor Destroy();
    property OnQueryData: TOnQueryDataByPage read FOnQueryData write SetOnQueryData;
  end;

  TQueryNoticeCount = class(TThread)//系统启动后，一次性将一个月前到目前所有未读的通知读取
  private
    FSTime: string;
    FETime: string;
    FIsRead: Integer;
    FQueryNoticeCount: TOnQueryDataCount;
  protected
    procedure Execute; override;
  public
    constructor Create(sTime, eTime: string; isRead: Integer);
    destructor Destroy();
    property OnQueryNoticeCount: TOnQueryDataCount read FQueryNoticeCount write FQueryNoticeCount;
  end;

  TQueryNoticeData = class(TThread)//系统启动后，一次性将一个月前到目前所有未读的通知读取
  private
    FSTime: string;
    FETime: string;
    FIsRead: Integer;
    FPageSize: Integer;
    FPageIndex: Integer;

    FInfo: OleVariant;
    
    FQueryNoticeInfo: TOnQueryDataByPage;
    procedure setData;
  protected
    procedure Execute; override;
  public
    constructor Create(sTime, eTime: string; isRead, pageSize, currPageIndex: Integer);
    destructor Destroy();
    property OnQueryNoticeData: TOnQueryDataByPage read FQueryNoticeInfo write FQueryNoticeInfo;
  end;

  TQueryMediaCount = class(TThread)//查询照片信息
  private
    FqueryMediaType: Integer;
    FquerySTime: string;
    FqueryETime: string;
    FqueryPhotoReason: Integer;
    FqueryCamerano: Integer;
    FqueryCarNo: string;
    FquerySim_no: string;
    FqueryDevId: string;
    FqueryGroupId: Integer;
    FqueryGroupList: string;
    FQueryCount: TOnQueryDataCount;
  protected
    procedure Execute; override;
  public
    constructor Create(queryMediaType: Integer; querySTime, queryETime: string; queryPhotoReason, queryCamerano: Integer;
                       queryCarNo, querySim_no, queryDevId: string; queryGroupId: Integer; queryGroupList: string);
    destructor Destroy();
    property OnQueryCount: TOnQueryDataCount read FQueryCount write FQueryCount;
  end;

  TQueryMediaData = class(TThread)//系统启动后，一次性将一个月前到目前所有未读的通知读取
  private
    FqueryMediaType: Integer;
    FquerySTime: string;
    FqueryETime: string;
    FqueryPhotoReason: Integer;
    FqueryCamerano: Integer;
    FqueryCarNo: string;
    FquerySim_no: string;
    FqueryDevId: string;
    FqueryGroupId: Integer;
    FqueryGroupList: string;

    FPageSize: Integer;
    FPageIndex: Integer;

    FInfo: ArrayOfPicInfo;

    FQueryData: TOnQueryMediaDataByPage;
    procedure setData;
  protected
    procedure Execute; override;
  public
    constructor Create(queryMediaType: Integer; querySTime, queryETime: string; queryPhotoReason, queryCamerano: Integer;
                       queryCarNo, querySim_no, queryDevId: string; queryGroupId: Integer; queryGroupList: string;
                       pageSize, currPageIndex: Integer);
    destructor Destroy();
    property OnQueryData: TOnQueryMediaDataByPage read FQueryData write FQueryData;
  end;


  TQueryDevLastPic = class(TThread)//查询设备最后一张照片信息
  private
    FDev: TDevice;
  protected
    procedure Execute; override;
  public
    constructor Create(dev: TDevice);
    destructor Destroy();
  end;

  TQueryCarInfo = class(TThread)
  private
    FQueryCarAndDevInfo: TQueryCarAndDevInfo;
  protected
    procedure Execute; override;
  public
    constructor Create();
    destructor Destroy();
    property OnQueryCarAndDevInfo: TQueryCarAndDevInfo read FQueryCarAndDevInfo write FQueryCarAndDevInfo;
  end;

  TQueryDevInfo = class(TThread)
  private
    FQueryCarAndDevInfo: TQueryCarAndDevInfo;
  protected
    procedure Execute; override;
  public
    constructor Create();
    destructor Destroy();
    property OnQueryCarAndDevInfo: TQueryCarAndDevInfo read FQueryCarAndDevInfo write FQueryCarAndDevInfo;
  end;

  TQueryADevGroupManage = class(TThread)
  private
    ADevGroupManage: TDevGroupManage;
    FFromDate, FToDate: string;
    Fgroup_id: integer;
    Fgroup_paranet: string;
    Ffact_id: Integer;
    Fdev_id: Integer;
    FServiceSoap: ServiceSoap;
    procedure SetInfo;
  protected
    procedure Execute; override;
  public
    xml: string;
    CmdList: TIntegerList;
    constructor Create(FromDate: string; ToDate: string;
                        fact_Id: Integer; dev_Id: Integer; group_id: Integer;
                        group_paranet: string); overload;
    constructor Create(); overload;
    destructor Destroy(); override;
  end;

  TQueryDevLastPos = class(TThread)  // 加载车辆最后一点数据
  private
    FDevManage: TDeviceManage;
  protected
    procedure Execute; override;
  public
    constructor Create(devManage: TDeviceManage);
    destructor Destroy(); override;
  end;

  TQueryADevParam = class(TThread)  // 加载车机参数
  private
    TDevManager: TDeviceManage;
    lable1: TLabel;
  protected
    procedure Execute; override;
  public
    constructor Create(DevManager: TDeviceManage;lable: TLabel);
    destructor Destroy(); override;
  end;

  TQueryDriver = class(TThread)   // 加载司机信息
  private
    TDevManager: TDeviceManage;
    TDriverManage: TDriverManage;
    lable1: TLabel;
  protected
    procedure Execute; override;
  public
    constructor Create(DevManager: TDeviceManage; DriverManage: TDriverManage; lable: TLabel);
    destructor Destroy(); override;
  end;

  TQueryDevTelList = class(TThread) // 加载车机电话本
  private
    TDevManager: TDeviceManage;
    lable1: TLabel;
  protected
    procedure Execute; override;
  public
    constructor Create(DevManager: TDeviceManage; lable: TLabel);
    destructor Destroy(); override;
  end;

  TQueryDevsEventList = class(TThread)  // 加载车机事件信息
  private
    TDevManager: TDeviceManage;
    lable1: TLabel;
  protected
    procedure Execute; override;
  public
    constructor Create(DevManager: TDeviceManage; lable: TLabel);
    destructor Destroy(); override;
  end;

  TQueryInfoTypes = class(TThread)  // 加载车机事件信息
  private
    AInfoTypeManage: TInfoTypeManage;
    ADevsManage: TDeviceManage;
    lable1: TLabel;
  protected
    procedure Execute; override;
  public
    constructor Create(AInfoTypes: TInfoTypeManage; ADevs: TDeviceManage; lbl: TLabel);
    destructor Destroy(); override;
  end;


//  TQueryPassengerInfo = class(TThread)  // 加载乘客信息
//  private
//    FPassengerManage : TPassengerManage;
//  protected
//    procedure Execute; override;
//  public
//    constructor Create(aPassengerManage : TPassengerManage);
//    destructor Destroy(); override;
//  end;

//  TQueryHYGLInfo = class(TThread) //  查询行业管理相关信息
//  private
//  protected
//    procedure Execute; override;
//  public
//    constructor Create();
//    destructor Destroy(); override;
//  end;

//  TLoadOrdersFromDB = class(TThread)  // 登录时加载订单信息
//  private
//  protected
//    procedure Execute; override;
//  public
//    constructor Create();
//    destructor Destroy(); override;
//  end;

  TQueryInfo = class(TThread)
  private
    ADevGroupManage: TDevGroupManage;
    FFromDate, FToDate: string;
    Fgroup_id: integer;
    Fgroup_paranet: string;
    Ffact_id: Integer;
    Fdev_id: Integer;
  protected
     procedure Execute; override;
  public
    xml: string;
    constructor Create(FromDate: string; ToDate: string;
                        fact_Id: Integer; dev_Id: Integer; group_id: Integer;
                        group_paranet: string); overload;
    constructor Create(); overload;
    destructor Destroy(); override;
  end;

  TBusinessSevercom = class(TObject)
  private
    FSocket: TSocketConnection;
    FUserName: string;
    FUserPass: string;
    FUserId: integer;
    FHost: string;
    FPort: Word;
    FHostBak: string;
    FPortBak: Word;
    FHostCurrent: string;
    FPortCurrent: Word;
    FTemp: Tclientdataset;
    FTimer: TTimer;
    cs: AuthHeader;

    FonsendPerMessage: TsendPerMessage;
    procedure SetUserName(const Value: string);
    procedure SetUserPass(const Value: string);
    procedure SetUserId(const Value: integer);
    function check_return(Ainfo: oleVariant): Boolean;
    procedure FSocketAfterConnected(Sender: TObject);
    procedure FTimerTimer(Sender: TObject);
    function GetActive: Boolean;
    //function QueryDevParam(DevIdStr: string): Boolean; overload;
    function QueryDevParams(): Boolean;
    function QueryDevParamsList_ByDevId( Dev_ID: string): string;
    function QueryCancelReason: Boolean;
    procedure SetAreaDevData(const Value: Tclientdataset);
    function GetServiceSoap: ServiceSoap;
    procedure SetonsendPerMessage(const Value: TsendPerMessage);
    procedure AddSysLog(sLog: string);
  protected
    FCancelMenuData: Tclientdataset;
    FAreaDevData: Tclientdataset;
  public
    FServiceSoap: ServiceSoap;
    constructor Create;
    destructor Destroy; override;
    procedure ConnectServer; // 检查同应用服务器的连接，如果没有连接，则开始连接
    procedure DisConnectServer; // 如果连接，则断开
    function userlogin(Auser: Tuser): Boolean; //用户登录
    function QueryUser_Privilege(Auser: TUser): Boolean;  // 查询当前用户的权限
    function userlogout(Auser: Tuser): Boolean; //用户退出
    function ChangePassword(Auser: Tuser; newpass: string): Boolean; //修改密码
    function DeviceInfo(ADeviceManage: TDeviceManage): Boolean; overload; //设备信息
    function DeviceInfo(): string; overload;
    function DriverInfo(ADriverManage: TDriverManage): Boolean; //司机信息
    function TDriverInfo(ADriverManage: TDriverManage; lable: TLabel): string; //司机信息
    function Query_JudgeNotOkList(): Boolean;
    function Reload_DeviceInfo(ADeviceManage: TDeviceManage): Boolean; //刷新后，重新载入 设备信息
    procedure QueryDeviceInfo(ADevice: TDevice); //去数据库里查询ADevice.ID相关相信再给它
    function CarTypeInfo(): Boolean; //车辆类型信息
    function CarInfo(ACarManage: TCarManage): Boolean; overload;//车辆信息
    function CarInfo(): string; overload; // 车辆信息
    function QueryDevCarInfo(ACarManage: TCarManage; ADeviceManage: TDeviceManage): Boolean;
    function CarNoInfo(ACarNOManage: TCarNOManage): Boolean; //所有的车辆的车机ID和车牌号...
    procedure QueryCarInfo(var ACar: TCar);
    function ResInfo(AImgResManage: TImgResManage): Boolean; //资源信息
    procedure QueryAllBitmapRes(); //从数据库得到所有的图片资源
    function QueryDevCount(AGroupId: integer): integer; //组中的设备(车辆)数
    function DevGroupinfo(ADevGroupManage: TDevGroupManage): Boolean; //组　信息
    function DeviceInfoByList(AnIDS: TIntegerDynArray; ADeviceManage: TDeviceManage): Boolean; //入：一组设备ID，设备管理器
    
    procedure QueryParam;

    function QueryHistoryCount(ADevID: string; AFact_id: Integer; ATimeFrom,
                               ATimeTo: TDatetime): integer; //从服务器查询历史记录->数据回放，取得的点数

    function QueryHistoryData(ADevID: string; AFact_id: Integer; ATimeFrom,
                              ATimeTo: TDatetime; pageSize: Integer; CurrPageIndex: Integer): string;

    function QueryHistoryDataRetrunDelphiXml(ADevID: string; AFact_id: Integer; ATimeFrom,
                              ATimeTo: TDatetime; pageSize: Integer; CurrPageIndex: Integer): string;

    function AddNewMsg(fact_id: Integer;  dev_Id: string; msg_type: Integer;
                       msgContent: string;  msgShowFlag: Integer; msg_memo: string;
                       msg_DownAnswers: string): integer;

    function AddNewCmdLog(const user_id: Integer;  const dev_id: string;
                           const cmd_type: Integer; const cmd_desc: WideString): Integer;

    function Query_CmdLogList(const fromtime: WideString; const totime: WideString;
                               const isQueryAllUserSended: Boolean; const dev_id: string; const fact_Id: Integer;
                               const group_id: Integer; const group_IdList: WideString): WideString;

    function QueryMsgList(ADevlist: string; ATimeFrom, ATimeTo: TDatetime): oleVariant;


    //function QueryUserList: Boolean

    function QueryMsgList_state(ADevlist: string; ATimeFrom, ATimeTo: TDatetime; AMsgState: integer): oleVariant;

    function QueryDevParam(Dev: TDevice): Boolean; overload; //车机的参数

    function QueryDevParamOfAll: Boolean; //取所有的车机参数

    function SaveDevParam(Fact_ID: Integer; ADevID: string; AParamNo: integer; AParam: WideString): Boolean;

    function QueryOverSpeed(const carNo: WideString; const AFromDate: WideString;
                            const AEndDate: WideString; AGroupId: Integer): OleVariant;

    function QueryOverSpeedSec(const carNo: WideString; const AFromDate: WideString;
                               const AEndDate: WideString; AGroupId: Integer): OleVariant;

    function DelDevParam(DevId: string): Boolean; //删除某个车机的所有参数
    procedure DeleteParamByNoDevID(AParamNo: integer; const ADevID: WideString);
    //function  UpdateDevPrm(AdeviceId: integer): boolean;              //更新车机参数

    // 检出所有车机的事件
    function QueryDevsEventList: Boolean;

    function TQueryDev_EventList: string;

    // 在车机的事件中增加一个事件
    function AddDevEvent(const eventNo: Integer; const eventDesc: WideString): Integer;
    //更改数据库中　车机的事件 --　仅一个事件信息
    function ModifyDevEventList_AEventInfo(PEvent: PEventInfo): Boolean;
    //删除数据库中　车机的事件 --  仅一个事件信息
    function DeleteDevEventList_AEventInfo(AEventId: integer): Boolean;
    function ModifyDev_EventList(const dev_id: string; const Event_IdList: WideString): Boolean;
    // 检出所有车机的分类菜单
    function QueryDevsClassMenuList: Boolean;
    // 在车机中增加一个周边分类菜单信息
    function  AddNewAmbientInfoMenu(const MenuType: Integer; const MenuName: WideString): Integer;

    function  ModifyAAmbientInfoMenu(pInfo: pClassInfoMenu): Boolean;

    function  DeleteAAmbientInfoMenu(const AmbientMenu_Id: Integer): Boolean;

    function  ModifyDev_AmbientInfoMenuList(const fact_id: Integer; const dev_id: string;
                                            const Menu_IdList: WideString): Boolean;

    // 检出所有车机的点播菜单
    function  QueryInfoDemandMenuList: Boolean;
    // 在车机中增加一个点播菜单信息
    function  AddNewInfoDemandMenu(const MenuType: Integer; const MenuName: WideString): Integer;

    function  ModifyAInfoDemandMenu(pInfo: PInfoMenu): Boolean;

    function  DeleteAInfoDemandMenu(const Menu_Id: Integer): Boolean;

    function  ModifyDev_InfoDemandMenuList(const fact_id: Integer;
                                           const dev_id: string; const Menu_IdList: WideString): Boolean;
    //function  QueryDev_InfoDemandMenuList: WideString; stdcall;

    //检出所有车机 的电话本
    function QueryDevsTelList: Boolean;

    function TQueryDev_TelList: string;

    //在车机的电话本中增加一个电话
    function AddDevTel(const ATelNo: string; const ATelName: string; ATelType: integer;
                       tel_memo: string): integer;

    function ModifyDev_TelList(const dev_id: string; const tel_IdList: WideString): Boolean;

    //更改数据库中　车机的电话本 -- 所有电话信息
    function ModifyDevTelList(Adev: TDevice): Boolean;
    //更改数据库中　车机的电话本 --　仅一个电话信息
    function ModifyDevTelList_ATelInfo(Adev: TDevice; PTel: PTelInfo): Boolean;
    //删除数据库中　车机的电话本 --  所有电话信息
    function DeleteDevTelList(const ADevIDStr: string): Boolean;
    //删除数据库中　车机的电话本 --  仅一个电话信息
    function DeleteDevTelList_ATelInfo(ATelId: integer): Boolean;

    //查出所有车机的固定菜单,并入车机里.
    function QueryDevsMenu: Boolean;

    function AddDevMenu(Adev: TDevice; PMenu: PDisplayMenu): integer; //添加固定菜单

    function UpdateDevMenu(Adev: TDevice): Boolean;

//    function AddOrder(order: TOrder): integer;

//    function RefreshOrder(order: TOrder): Boolean;

    function AddNewArea_New(const AreaName: WideString; IsWarn: Integer; OverSpeed: Integer;
                            IdlSpeed: Integer; AreaType: Integer; AreaParLen: Integer;
                            const AreaPar: WideString;IsVisible:integer): integer; overload; //添加新的区域

    function AddNewArea_new(const areaName: WideString; const AreaType: Integer;
                            const AreaNo: Integer; const AreaProperty: Integer;
                            const BeginTime: WideString; const EndTime: WideString;
                            const MaxSpeed: Integer; const overSpeedtime: Integer;
                            const AreaPointCnt: Integer; const AreaPoints_use: WideString;
                            const AreaPoints_ToMcu: WideString; const IsVisible: Integer):Integer; overload;

    procedure ModifyArea_New(const AreaName: WideString; IsWarn: Integer; OverSpeed: Integer;
                            IdlSpeed: Integer; AreaType: Integer; AreaParLen: Integer;
                            const AreaPar: WideString; AreaID: Integer;isvisible:integer);  //修改区域

    function  ModifyAArea(const AreaId: Integer; const areaName: WideString;
                          const AreaType: Integer; const AreaNo: Integer;
                          const AreaProperty: Integer; const BeginTime: WideString;
                          const EndTime: WideString; const MaxSpeed: Integer;
                          const overSpeedtime: Integer; const AreaPointCnt: Integer;
                          const AreaPoints_use: WideString; const AreaPoints_ToMcu: WideString;
                          const IsVisible: Integer): Boolean;

    function  ModifyDev_AreaList(const fact_Id: Integer; const dev_Id: string; const AreaIdList: WideString): Boolean;

    function  AddNewDev_Area( const dev_Id: string; const area_Id: Integer): Boolean;

    function DeleteArea_New(AreaID: Integer): Boolean; //删除区域

    procedure QueryArea_New; //下载报警区域

    procedure DeleteAreaByDev_New(const DevID: WideString; AreaID: Integer); //删除区域关联关系报警

    function  DeleteADev_Area(const fact_Id: Integer; const dev_Id: string; const area_Id: Integer): Boolean;

    function AddNewAreaByDev_New(AreaID: Integer; const DevID: WideString): integer; //增加区域车机关联

    function QueryAreaWarn(const carNo: WideString; const beginwarnTime: WideString;
                           const endWarnTime: WideString; group_ID: Integer; WarnType: Integer): OleVariant;

    function TjAreaWarn(AFromDate, AToDate:String; AGroup_id,AWarnType:Integer): OleVariant;//统计出入区域报警（越界或入界报警统计）

    function TjOverSpeed(AFromDate, AToDate: String; ACar_Id,AGroup_id: Integer): OleVariant;

    function QueryOrderList(fromtime: WideString; totime: WideString; orderType: Integer;
                            isQueryAllUserSended: Boolean; dev_id: string; fact_Id: Integer;
                            group_Id: Integer; group_IdList: WideString; OrderResultList: WideString): WideString;

//    function ModifyAOrder_DevCancelReason(const orderId: Integer; const devCancelResonId: Integer): WideString;

    function FindCarInArea(const cartype_id: Integer; const car_Color: WideString; const devIdList: WideString;
                           const group_Id: Integer; const group_IdList: WideString; const beginTime: WideString;
                           const endTime: WideString; const beginLat: Double; const beginLong: Double;
                           const endLat: Double; const endLong: Double): WideString;

    function QueryMessageList(fromtime: WideString; totime: WideString; msg_type: Integer;
                              msg_state: Integer; isQueryAllUserSended: Boolean;
                              dev_id: string; fact_Id: Integer; group_Id: Integer;
                              group_IdList: WideString): WideString;

    function QueryAlarmCount(fromTime, toTime: string; devId: string; group: Integer;
                             sonGroupIdList: string; dealStatus: Integer; alarmType: Integer; simNo: string): Integer;
    function QueryAlarmData(fromTime, toTime: string; devId: string; group: Integer;
                             sonGroupIdList: string; dealStatus: Integer; alarmType: Integer;
                             pageSize: Integer; currPageNo: Integer; simNo: string): WideString;

    function GetDevLastPos(): string;

    function QueryAlarmDealInfo(alarmDealId: Integer): WideString;

    function QueryDevGroupOnline(fromTime, toTime: string; groupId: Integer; sonGroupIdList: string): WideString;
    function QueryDevMileage(fromTime, toTime: string; devId: string; groupId: Integer; sonGroupIdList: string): WideString;

    function Tj_ServeJudge(const fromtime: WideString; const totime: WideString;
                           const fact_Id: Integer; const dev_Id: string;
                           const group_Id: Integer; const group_IdList: WideString): WideString;

    function  Tj_ServeJudge_NotOk(const fromtime: WideString; const totime: WideString;
                                  const fact_Id: Integer; const dev_Id: string;
                                  const group_Id: Integer; const group_IdList: WideString): WideString;


//    function AddCancelOrderReason(Dev: TDevice): Boolean;
    function QueryCancelMenuByDev(Dev: TDevice): Boolean;
    function QueryCancelMenuByDev_zb(Dev: TDevice; ADateSet: Tclientdataset): Boolean;

//    function updateOrderDriver(const orderId: Integer; const driverId: Integer): string;
    function Change_DriverOrPassenger_Integral(const chgType, Driver_id, Passenger_Id, chgValue: Integer;const chgReason, DealMan, memo: string): string;
    function Query_DriverIntegralChg(const fromtime: WideString; const totime: WideString; const driver_id: Integer; const group_id: Integer; const group_IdList: WideString): WideString;
    function Query_Driver_IntegralSort(const group_Id: Integer; const group_IdList: WideString): WideString;

    function QueryPassengerByPhone(const phone: WideString): string;
    function QueryDriverWithCond(const groupId, driverId: Integer): string;

    function SetPassengerInBlacklist(const Passenger_Id: Integer; const isBlack: Integer): Integer;
    function SetDriverInBlacklist(const Driver_Id: Integer; const isBlack: Integer): Integer;

    function AddNewLedAd(const DataType: WideString; DisSpeed: Integer; const InType: WideString;
                         const ExitType: WideString; const X: WideString; const Y: WideString;
                         StopTime: Integer; const Font: WideString; IsDisTime: Integer;
                         const Extend: WideString; const LedMemo: WideString;
                         const RunTime: WideString; const endTime: WideString;
                         const CusTerm: WideString; const custermPer: WideString;
                         const custermTel: WideString; const Memo: WideString): OleVariant; safecall;

    procedure ModifyLedAd(id: Integer; const DataType: WideString; DisSpeed: Integer;
                          const InType: WideString; const ExitType: WideString;
                          const X: WideString; const Y: WideString; StopTime: Integer;
                          const Font: WideString; IsDisTime: Integer; const Extend: WideString;
                          const LedMemo: WideString; const RunTime: WideString;
                          const endTime: WideString; const CusTerm: WideString;
                          const custermPer: WideString; const custermTel: WideString;
                          const Memo: WideString);


    function AddLedDev(LedID: Integer; const DevID: WideString; LedNo: Integer): OleVariant; safecall;
    procedure DeleteLedAd(AId: Integer); safecall;
    procedure DeleteLedDev(LedID: Integer; const DevID: WideString; LedNo: Integer); safecall;
    function QueryAdByID(LedID: Integer; const DevID: WideString): Tclientdataset; safecall;
    function QueryLedAd(ledId: Integer): Tclientdataset; safecall;

    function GetDatetime: TDatetime;
    function GetMsgContent(MsgID: integer): string;
    function QueryCancelMenu: Boolean;
    function QueryCancelMenu_zb: Boolean;

    procedure DelCancelOrderReason_Zb(const ADevID: WideString);

    function AddCancelOrderReason_Zb(AMenuID: Integer; const ADevID: WideString): Integer;

    function QueryDriverOnOffDuty(const DriverNo: WideString; start_Time,
                                  end_Time: TDateTime; const DevId: WideString;
                                  group_id:Integer): TClientDataSet;

    function QueryPhotoByDevAndPicIndex(ADev: TDevice; APicIndex: Integer): string;

    function QueryPhoteByPicIndex(APicIndex: Integer): PicInfo;

    function QueryPhotosByDevID(ADevID: string; ABeginTime, AEndTime: TDateTime): Tclientdataset;
   //添加广告信息
    function AddNewAdInfo(const adMemo: WideString; beginTime: TDateTime; endTime: TDateTime;
                          const CustomerName: WideString; const linkName: WideString;
                          const tel: WideString; const Memo: WideString): integer; safecall;
    //修改广告信息
    procedure ModifyAdInfo(AId: Integer; const adMemo: WideString; beginTime: TDateTime;
                           endTime: TDateTime; const CustomerName: WideString;
                           const linkName: WideString; const tel: WideString;
                           const Memo: WideString); safecall;
    //删除广告信息
    procedure DeleteAdInfo(AId: Integer); safecall;
    //查询广告信息
    function QueryAdInfo: Tclientdataset; safecall;
    //为车机添加一条广告
    function AddNewDevAd(const DevID: WideString; AdId: Integer): OleVariant; safecall;
    //通过组查询广告信息
    function QueryAdByGroupId(AGroupID: Integer): OleVariant; safecall;
    //查询过期的广告
    function QueryAdInfoOverTime(ADays: Integer): Tclientdataset; safecall;
    //添一个方向信息
    function AddNewBeforeScreen(const bsMemo: WideString): integer; safecall;
    //改一个方向信息
    procedure ModifyBeforeScreen(AID: Integer; const bfMemo: WideString); safecall;
    //删除一个方向信息
    procedure DeleteBeforeScreen(AId: Integer); safecall;
    //查询方向信息
    function QueryBeforeScreen: Tclientdataset; safecall;
    //====================渣土车相关统计====================================
    function QuerryCarLadeInfo(ADevs: string; AFromTime, AToTime: TDateTime): TClientDataSet;
    function QuerryCarLadeStat(ADevAry: TStringDynArray; AFromTime, AToTime: TDateTime): OleVariant;
    function QuerryCarDumpageMx(ADevs: string; AFromTime, AToTime: TDateTime): TClientDataSet;
    function QuerryCarDumpageStat(ADevAry: TStringDynArray; AFromTime, AToTime: TDateTime): OleVariant;
    function QuerryCarCarrayOffXslc(ADevs: string; AFromTime, AToTime: TDateTime; AMilType: Byte): OleVariant;
    function QuerryCarDayXslc(ADevs: string; AFromTime, AToTime: TDateTime): OleVariant;
    function QuerryCarMonthXslc(ADevs, Ayf: string): OleVariant;

    //为车机添加一个方向信息
    function AddBsByDev(bsId: Integer; const DevId: WideString): integer; safecall;

    //删除车机一个方向信息
    procedure DeleteBsByDev(ABsId: Integer; const ADevId: WideString); safecall;

    //查询一个车的方向信息
    function QueryBsByDev(const ADevId: WideString): Tclientdataset; safecall;

    //删除一个车一个广告
    procedure DeleteAdByDevIdADID(const DevID: WideString; AId: Integer); safecall;

    //删除一个车机所有的广告
    procedure DeleteADByDev(const DevID: WideString); safecall;

    //查询一个车机所有的广告
    function QueryADByDevId(const ADevId: WideString): Tclientdataset; safecall;

    //查询一个广告发向所有的车
    function QueryDevByADId(ADID: Integer): Tclientdataset; safecall;

    function AddNewArea(AreaNo: Integer; const AreaName: WideString; AreaType: Integer;
                        AreaPointCnt: Integer; OverSpeed: Integer): integer; safecall;

    function QuerAreaList: OleVariant; safecall;
    procedure DeleteArea(AreaID: Integer); safecall;
    function AddNewAreaInfo(AreaID: Integer; X: Integer; Y: Integer): integer; safecall;
    procedure DeleteAreaInfo(AAreaID: Integer); safecall;
    function QueryAreaInfo(AAreaID: Integer): OleVariant; safecall;
    function AddNewDevAreas(const DevID: WideString; AreaID: Integer): integer; safecall;
    procedure DeleteDevAreas(const DevID: WideString; AreaID: Integer); safecall;
    function QueryDevAreas(AAreaID: Integer): OleVariant; safecall;

    function QueryOverSpeedInfo(const beginTime: WideString; const endTime: WideString;
                                const DevIdStr: WideString;AGroupId:Integer=-1;
                                GroupParentStr:string=''): Tclientdataset; safecall;

    function QueryStopTime(const DevIDStr: WideString; const beginTime: WideString;
                           const endTime: WideString): Tclientdataset; safecall;
    function QueryStopInfo(AStopId: Integer): Tclientdataset; safecall;
    //================================和出租车计价器相关信息
    function QueryRunDataCount(const aCarNO: string; AFormDate, AToDate: string): integer;
    
    function QueryRunData(const aCarNO, AFromDate, AToDate: WideString;
                          AStartIndex, AGetCount: integer; out ARunData: oleVariant): oleVariant;

    //--为常熟增加的是否打印发票 带交易类型
    function QueryRunDataCount_Cs(fromtime: WideString; totime: WideString;
                                  fact_Id: Integer; dev_Id: string; group_id: Integer;
                                  group_IdList: WideString): integer;
    function QueryRunData_Cs(fromtime: WideString; totime: WideString;
                              PageSize: Integer; CurrPageIndex: Integer;
                              fact_Id: Integer; dev_Id: string; group_id: Integer;
                              group_IdList: WideString): oleVariant;
    function Query_ServeJudge(fromtime: WideString; totime: WideString; fact_Id: Integer;
                             dev_Id: string;  group_Id: Integer; group_IdList: WideString): WideString;
    function  QueryServeJudgeByDRunData(const fact_Id: Integer; const dev_Id: string;
                                      const onTime: WideString; const offTime: WideString): WideString;
    function  QueryPicsByTime(const fact_Id: Integer; const dev_Id: string; const onTime: WideString;
                              const offTime: WideString): ArrayOfPicInfo;
    function QueryPicsByPhotoIDs(const PhotoIDs: WideString): ArrayOfPicInfo;

    function TaxiMetaMoneryMonthTj(const Car_No: WideString; const M: WideString; group_ID: Integer): OleVariant;

    function  Tj_CarMoneyMonth(const yf: WideString; const fact_id: Integer;
                               const dev_Id: Integer; const group_id: Integer;
                               const group_IdList: WideString): WideString;

//    function  Tj_CarMoneyDay(const fromtime: WideString; const totime: WideString;
//                             const group_id: Integer; const group_IdList: WideString): WideString;

//    function  Tj_CarRunDataByTimes(const fromtime: WideString; const totime: WideString;
//                                   const group_id: Integer; const group_IdList: WideString): WideString;

//    function  Tj_AllCarADayRunData(const yf: WideString; const group_id: Integer;
//                                   const group_IdList: WideString): WideString;

    function QueryTaxiTj(const ARq: WideString; AGroupID: Integer): OleVariant;
    function TaxiMetaMoneryMonthTjChat(const M: WideString; group_ID: Integer): OleVariant;
    function StatTaxRunDataByMonth(const fromDate, toDate: WideString; groupId: Integer): OleVariant;
    function StatTaxRunDataByDay(const FromDate, ToDate: WideString; group_id: Integer): OleVariant;
    function StatTaxRunDataByDayChat(const FromDate, ToDate: WideString; group_id: Integer): OleVariant;
    function QueryDevPostion(fact_id: Integer; dev_Id: String;
                             beginTime: WideString; endTime: WideString;
                             beginLat: Integer; beginLong: Integer;
                             endLat: Integer; endLong: Integer): Tclientdataset;
    function QueryDevPostion_quickly(DevIdList: string; beginTime: WideString; endTime: WideString;
                                     beginLat: Integer; beginLong: Integer;
                                     endLat: Integer; endLong: Integer): TClientDataSet;
      //车辆行驶里程
    function QueryDevHourDis(const carNo, fromDate, toDate: WideString;
      groupId: Integer): OleVariant;
    function SetDevOil(ADevID: WideString; oil: double): Boolean;
    function QueryDevOil(ADevId: wideString): double;
    procedure ModifyDriver(ADriverID: integer; const ADriverName: WideString;
                            const ADriverTel: WideString; const ADriverAddr: WideString;
                            const ADriverCard: WideString; ADriverPhoto: OleVariant;
                            ACarID: integer; AGroupID: integer; const ADriverNo: WideString; ADriverKind: integer); //修改司机信息
    function ModifyADriver_Client(const driver_id: Integer; const driver_name: WideString; const driver_tel: WideString): WideString;
    function QueryDevMonthDis(const carNo, tjYf: string; groupId: Integer): OleVariant;
    //--查询紧急报警记录
    function QueryEmergencyAlarm(const beginTime,endTime: String;ACar_Id,AGroup_Id:Integer;GroupParentStr:string=''): OleVariant;
    //查询 司机疲劳驾驶记录
    function QueryDriverFatigueRecord(const beginTime, endTime: String;ADev_Id: String; AGroup_Id: Integer): OleVariant;
    {查询分组下的车辆。UserId>0，表示查询某用户能看到车组，<0表示查询所有车辆
      2009.03.02  sha 为喀什增加}
    function QueryGrpDevs(UserId: Integer): OleVariant;
    function QueryDevMonthRunInfo(const ADevIdstr,AYf: String;
       OverspeedNum:Integer): OleVariant;
    //-----------------------混凝土 相关---------------
    //------施工单位
    function AddNewBuildCompany(ANo,AName,AMemo,AMaintainer,createTime:String):Integer;
    procedure ModifyBuildCompany(ANo,AName,AMemo,AMaintainer,modifyTime:String;Id:Integer);
    procedure DeleteBuildCompany(Id:Integer);
    function QueryAllBuildCompany():OleVariant;
    //------施工工程
    function AddNewBuildSite(ANo,AName:string;ACompanyId:Integer;ASiteName,ASiteTel,
      SalesMan,saleManTel:string;AreaType,AreaParLen:Integer;AreaPar:string;
      isvisible:integer;memo:string):Integer;
    procedure ModifyBuildSite(ANo,AName:string;ACompanyId:Integer;ASiteName,ASiteTel,
      SalesMan,saleManTel:string;AreaType,AreaParLen:Integer;AreaPar:string;
      isvisible:integer;memo:string;Id:Integer);
    procedure DeleteBuildSite(Id:Integer);
    function QueryAllBuildSite():OleVariant;
    //-------任务表
    procedure AddNewTask({No:String;}SendStatus,Status:Integer;createTime:String;
      factoryId,buildingSiteId:Integer;destineNum:double;bcarno,tab,constructPart,
      taLudu,saleName,destineTime:String);
    procedure ModifyTask({No:String;}SendStatus,Status:Integer;createTime:String;
      factoryId,buildingSiteId:Integer;destineNum:double;bcarno,tab,constructPart,
      taLudu,saleName,destineTime:String;Id:Integer);
         //更改任务的状态
    procedure ModifyProTaskDoneStatuse(Status:Integer;TaskId:Integer);
    procedure DeleteTask(Id:Integer);
    function QueryTask():Olevariant;
    //-------调度明细   返回参数 AttemperId，返回 是否添加成功
    function AddNewAttemper(TaskId:integer;carNo,driverNo:string;
                            eachCube:double;memo:String;var AttemperId:Integer): boolean;
    procedure ModifyAttemper(carNo,DriverNo:string;eachcube:double;memo:string);
    procedure DeleteAttemper(attemperId:Integer);
    //根据任务ID，找到调度明细
    function QueryAttemper: Olevariant;

    function QueryAttemperByTaskId(TaskId:integer):Olevariant;

    function QueryAttemperCarInfo(taskId: Integer; driverNo,devIdStr: string):Olevariant;

    procedure ModifyAttempInfo(attemperId,attemperNo,taskId:Integer;eachCube:Single;
                               startTime, arriveTime, unloadStartTime,unloadEndTime,
                               backFactoryTime,amemo:string);
//-------站点表(工厂)
    function QueryBuildFactory():Olevariant;

    function AddNewBuildFactory(FactNo,Factname,FactTel,FactLinkName :string; FAreaType,
                                FAreaParLen:Integer;FAreaPar :string;FIsVisible:Integer):Integer;

    procedure ModifyBuildFactory(FactNo,Factname,FactTel,FactLinkName :string; FAreaType,
                                 FAreaParLen:Integer;FAreaPar :string;FIsVisible,FactId:Integer);

    procedure DeleteBuildFactory(FactId:Integer);
    
    function QueryStopCarOverTimeAlarm(devIdStr,startTime,endTime:string;groupId:
                                       Integer;groupParanet:string):Olevariant;

    function QueryDevOilHeight(devIdStr,startTime,endTime:string):OleVariant;

    function Query_ICCardTradeDataList(fromtime, totime: WideString; fact_Id, dev_Id, group_Id: Integer;
                                       group_IdList: WideString): WideString;

    function  Query_ICCardTradeDataList2(const fromTime: WideString; const toTime: WideString;
                                         const isUpok: Integer; const dev_Id: Integer; const fact_Id: Integer;
                                         const group_Id: Integer; const group_IdList: WideString): WideString;

    function Query_DbRunData(fromtime, totime: WideString; fact_Id, dev_Id, group_Id: Integer;
                             group_IdList: WideString): WideString;

    function Query_SoundRecord(const RecordReasonId: Integer; const fromtime: WideString;
                                const totime: WideString; const fact_Id: Integer;
                                const dev_Id: string; const group_id: Integer;
                                const group_IdList: WideString): WideString;


    function DevUpdate_QueryAllDevType: WideString;

    function DevUpdate_QueryAllDevFact(const devType: Integer): WideString;

    function Client_GetDevUpdateCurrentVer(const devType: Integer; const DevFactId: Integer): WideString;

    function Query_SoundRecord_SoundData(const Record_Id: Integer): SoundRecordData;

    function AddNewAccuseDriver(const Accuse_Type: Integer; const Accuse_carno: WideString;
                                const TaxiRunID: Integer; const case_HappenTime: WideString;
                                const case_HappenAddr: WideString; const Accuse_Reason: WideString;
                                const passengerName: WideString; const PassengerTelNum: WideString;
                                const PassengerMemo: WideString; const RecordId: Integer): Integer;

    function AddNewAccuseDriver_driverId(const Accuse_Type: Integer; const Accuse_carno: WideString;
                                         const TaxiRunID: Integer; const case_HappenTime: WideString;
                                         const case_HappenAddr: WideString; const Accuse_Reason: WideString;
                                         const passengerName: WideString; const PassengerTelNum: WideString;
                                         const PassengerMemo: WideString; const RecordId: Integer;
                                         const driver_id: Integer): Integer;

    function  ModifyAAccuseDriver_BaseInfo(const Accuse_Id: Integer; const Accuse_Type: Integer;
                                           const Accuse_carno: WideString; const TaxiRunID: Integer;
                                           const case_HappenTime: WideString; const case_HappenAddr: WideString;
                                           const Accuse_Reason: WideString; const passengerName: WideString;
                                           const PassengerTelNum: WideString; const PassengerMemo: WideString;
                                           const RecordId: Integer; const DealState: Integer): Integer;

    function  ModifyAAccuseDriver_Deal(const Accuse_Id: Integer; const DealState: Integer;
                                       const DealContent: WideString; const DealDepartment: WideString;
                                       const DealMan: WideString; const DealManTel: WideString;
                                       const DealTime: WideString): Integer;

    function  ModifyAAccuseDriver_Check(const Accuse_Id: Integer; const DealState: Integer;
                                        const Check_Result: WideString; const Check_man: WideString;
                                        const Check_Idea: WideString): Integer;

    function ModifyAMessage_Answer2(const msg_id: Integer; const msg_state: Integer; const msg_repTime: WideString;
                                    const msg_driverAnswer_Id: Integer; const msg_driverAnswer_Str: WideString): WideString;

    function  ModifyAAccuseDriver_DealState(const Accuse_Id: Integer; const DealState: Integer): Integer;

    function  DelAAccuseDriver(const Accuse_Id: Integer): Integer;

    function  Query_AccuseDriver(const DealState: Integer; const fromtime: WideString;
                                 const totime: WideString): WideString;

    function  Tj_ICCardTradeDataList(const fromtime: WideString; const totime: WideString;
                                     const dev_Id: Integer; const fact_Id: Integer;
                                     const group_Id: Integer; const group_IdList: WideString): WideString;

    function  AddSql(const SqlStr: WideString; const TableName: WideString; const Desc: WideString): Integer;
    function  QuerySql(const SqlStr: WideString; const TableName: WideString; const Desc: WideString): WideString;
    function  ModifySql(const SqlStr: WideString; const TableName: WideString; const Desc: WideString): WideString;
//    procedure QueryHYGLInfo();  // 查询行业管理岗位需要的数据：当天投诉总量、
    function  DevUpdate_QueryAllDevUpdateRecord(const DevId: string; const group_Id: Integer; const group_IdList: WideString;
                                                const DevType: Integer; const DevFactId: Integer; const fromTime: WideString;
                                                const toTime: WideString; const UpdateResult: Integer;
                                                const HardVer: WideString; const SoftVer: WideString): WideString;

    function QueryAllInfoTypes(): string;
    function AddNewInfoType(typeId: Integer; typeName: string; typeMemo: string): Integer;
    function ModifyAInfoType(id: Integer; typeId: Integer; typeName: string; typeMemo: string): Boolean;
    function DelInfoType(id: Integer): Boolean;

    function QueryInfo(sTime, eTime: string): string;
    function AddNewInfo(typeId: Integer; infoContent: string; sendTime: string; infoMemo: string): Integer;
    function ModifyAInfo(id: Integer; typeId: Integer; infoContent: string; sendTime: string; infoMemo: string): Boolean;
    function DelInfo(id: Integer): Boolean;

    function QueryDevInfoType(): string;
    function AddDevInfoType(infoTypeId: Integer; devId: string): Boolean;
    function DelDevInfoType(infoTypeId: Integer; devId: string): Boolean;
    function AddDevAlarmInfo(const dev_Id: WideString; const alarmType: Integer; const gpsTime: WideString;
                             const latitude: Single; const longitude: Single; const speed: Integer; const overspeedtype: Integer;
                             const OVERSPEEDAREAID: Integer; const AREAALARMTYPE: Integer; const AREAALARMID: Integer;
                             const AREAALARMSTATE: Integer; const OVERTIMELINEID: Integer; const OVERTIMELINETIMER: Integer; const OVERTIMELINESTATE: Integer): Integer;
    function AddNewAlarmDeal(alarmDevId: string; alarmtype: Integer; alarmGpstime: string;alarmDealStatus: Integer; alarmDealTime: string; alarmType_pt: Integer): string;
    function ModifyAlarmDeal_DealOk(id, alarmDealstatus: Integer; alarmDealTime: string): Boolean;
    function ModifyAlarmDeal_DealEnd(id, alarmdealstatus: Integer;  alarmdealtime, alarmperson, alarmpersontel, alarmpos, alarmdealproc, alarmdealresult: string): Boolean;

    function QueryNoticeCount(const startTime: string; const endtime: string; const isread: Integer): Integer;
    procedure QueryNotice(const startTime, endTime: string; const isRead: Integer; const pageSize, currPageIndex: Integer);
    function QueryNoticeInfo(const startTime, endTime: string; const isRead: Integer; const pageSize, currPageIndex: Integer): OleVariant;
    procedure setNoticeRead(noticeId: Integer);
    procedure AddNewUserFeed(qq, e_mail, tel, feedMemo: string);
    function  QueryDevRunStateInfoOnTheTime( queryTime: string;  groupId: Integer; const group_list, devIdStr:string): string;
    function QueryMediaCount(queryMediaType: Integer; querySTime, queryETime: string; queryPhotoReason, queryCamerano: Integer;
                       queryCarNo, querySim_no, queryDevId: string; queryGroupId: Integer; queryGroupList: string): Integer;
    function QueryMediaDataByPage(queryMediaType: Integer; querySTime, queryETime: string; queryPhotoReason, queryCamerano: Integer;
                       queryCarNo, querySim_no, queryDevId: string; queryGroupId: Integer; queryGroupList: string;
                       pageSize, currPageIndex: Integer): ArrayOfPicInfo;
    function QueryLatestPic(devId: string): PicInfo;
    function QueryDevUploadMileageCount(queryFlag: Byte; sTime, eTime, devId: string; groupId: Integer; groupIDList: string): Integer;
    function QueryDevUploadMileageData(queryFlag: Byte; sTime, eTime, devId: string; groupId: Integer; groupIDList: string; pageSize, currPageIndex: Integer): string;
    function AddSetCarRunStatePlan(devId: string; sTime, eTime: TDateTime; sAddr, eAddr: string; sMemo, userName: string): Boolean;
    function ModifySetCarRunStatePlan(Id: Integer; devId: string; sTime, eTime: TDateTime; sAddr, eAddr: string; sMemo, userName: string): Boolean;
    function DeleteSetCarRunStatePlan(Id: Integer): Boolean;
    function QuerySetCarRunstatePlanCount(sTime, eTime, devId: string; groupId: Integer; groupIdList: string): Integer;
    function QuerySetCarRunStatePlanData(sTime, eTime, devId: string; groupId: Integer; groupIdList: string; pageSize, currPageIndex: Integer): string;
  public
    property UserId: integer read FUserId write SetUserId;
    property UserName: string read FUserName write SetUserName;
    property UserPass: string read FUserPass write SetUserPass;
    property Active: Boolean read GetActive;
    property Host: string read FHost write FHost;
    property Port: Word read FPort write FPort;
    property HostBak: string read FHostBak write FHostBak;
    property PortBak: Word read FPortBak write FPortBak;
    property CancelMenuData: Tclientdataset read FCancelMenuData write FCancelMenuData;
    property AreaDevData: Tclientdataset read FAreaDevData write SetAreaDevData;
    property Socket: TSocketConnection read FSocket;
    property Web: ServiceSoap read GetServiceSoap;
    property onsendPerMessage: TsendPerMessage read FonsendPerMessage write SetonsendPerMessage;
  end;

implementation
uses uGloabVar, DateUtils, StrUtils, {systemlog,} uFrmRefreshProgress, ShellAPI, GatewayServerUnit,
 ConnectingBizFrmUnit 
{$IFDEF ForAddEKey}, EKeyUseUnit{$ENDIF};
{ TBusinessSevercom }

function TBusinessSevercom.GetServiceSoap: ServiceSoap;
begin
  cs.Username := current_user.UserName;
  cs.Password := current_user.Password;
  service.IP := Bs.Host;
  service.PORT := IntToStr(Bs.PORT);
  FServiceSoap := service.GetServiceSoap;
  (FServiceSoap as ISOAPHeaders).Send(cs);
  result := FServiceSoap;
end;

function TBusinessSevercom.CarTypeInfo(): Boolean; //车辆信息
{var
  info, info1: oleVariant;
  saveCursor: TCursor;
  i, j: integer;
  ps0: PCar;
  dataset: Tclientdataset;
  xml, xml2: string;
  XMLDoc, XMLDoc2: TXMLDocument;
  t: TComponent;
  node, node2: IXMLNode;
  CarType: TCarType;
  function findCarType(TypeID: integer): string;
  begin
    Result := '';

    node2 := XMLDoc2.DocumentElement.ChildNodes['Table'];
    if node2.ChildNodes.Count <= 0 then
      Exit;
    while (node2 <> nil ) do
    begin

      if StringToInteger(trim(node2.ChildNodes['CARTYPE_ID'].Text)) = TypeID then
      begin
         Result := Trim(node2.ChildNodes['CARTYPE_NAME'].Text);
        exit;
      end;

      node2 := node2.NextSibling;
    end;
  end;
begin
  Result := false;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    t := TComponent.Create(nil);
    XMLDoc := TXMLDocument.create(t);
    XMLDoc2 := TXMLDocument.create(t);
    try
      xml := '<?xml version="1.0" encoding="GB2312"?>' +  web.QueryCarList;

      XMLDoc.XML.Text :=  xml;
      XMLDoc.Active := true;
      XMLDoc.Encoding := 'gb2312';

      try
        xml2 := '<?xml version="1.0" encoding="GB2312"?>' +  web.QueryCarType;
        XMLDoc2.XML.Text :=  xml2;
        XMLDoc2.Active := true;
        XMLDoc2.Encoding := 'gb2312';

        node := XMLDoc.DocumentElement.ChildNodes['Table'];
        if node.ChildNodes.Count <= 0 then
          Exit;
        //ACarManage.Count := 0;
        while (node <> nil ) do
        begin
          ps0 := ACarManage.AddNewCar(strtoint(trim(node.ChildNodes['CAR_ID'].Text)));
          ps0^.id := StringToInteger(trim(node.ChildNodes['CAR_ID'].Text));
          ps0^.ZBH := trim(node.ChildNodes['CAR_ZBH'].Text);
          ps0^.No := trim(node.ChildNodes['CAR_NO'].Text);
          ps0^.Memo := trim(node.ChildNodes['CAR_MEMO'].Text); //car_memo   改后再改..............
          ps0^.resid := StringToInteger(Trim(node.ChildNodes['RES_ID'].Text));
          ps0^.CarType := findCarType(StringToInteger(trim(node.ChildNodes['CARTYPE_ID'].text)));
          ResManage.find(ps0^.resid, ps0^.ResIndex);
          ps0^.stat := 0;
          //ACarManage.Count := ACarManage.Count + 1;
          if Assigned(FonsendPerMessage) then
          begin
            FonsendPerMessage('正在加载' + ps0^.No + '的基本信息...');
          end;
          node := node.NextSibling;
          Application.ProcessMessages;
        end;

        node2 := XMLDoc2.DocumentElement.ChildNodes['Table'];
        if node2.ChildNodes.Count <= 0 then
          Exit;
        CarTypeManage.ClearAll;
        while (node2 <> nil ) do
        begin

          CarType := CarTypeManage.Add(StringToInteger(node2.ChildNodes['CARTYPE_ID'].Text));
          CarType.CarTypeID := StringToInteger(node2.ChildNodes['CARTYPE_ID'].Text);
          CarType.CarTypeName := node2.ChildNodes['CARTYPE_NAME'].Text;

          node2 := node2.NextSibling;
        end;

        Result := True;
      finally
      end;
    except
      on E: Exception do
      begin
        raise Exception.Create(e.Message); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
    XMLDoc.Free;
    XMLDoc2.Free;
    t.Free;
  end;   }
var
  FTemp2: Tclientdataset;
  info: string;
  CarType: TCarType;
  i: Integer;
begin
  try
    try
      try
        FTemp2 := Tclientdataset.Create(nil);

        FTemp2.XMLData := Web.QueryCarTypeReturnDelphiXml;
        FTemp2.Open;

        CarTypeManage.ClearAll;
        FTemp2.First;
        for i := 0 to FTemp2.RecordCount - 1 do
        begin

          CarType := CarTypeManage.Add(FTemp2.FieldByName('CARTYPE_ID').AsInteger);
          CarType.CarTypeID := FTemp2.FieldByName('CARTYPE_ID').AsInteger;
          CarType.CarTypeName := FTemp2.FieldByName('CARTYPE_NAME').AsString;

          FTemp2.Next;
        end;

        Result := True;

      except on E: Exception do
        raise Exception.Create(e.Message);
      end;
    finally
      FTemp2.Close;
      FTemp2.free;
    end;
  finally
  end;
end;

function TBusinessSevercom.CarInfo(ACarManage: TCarManage): Boolean;//车辆信息
var
  FTemp: Tclientdataset;
  info: string;
  //ps0: PCar;
  car: TCar;
  CarType: TCarType;
  i: Integer;
begin
  try
    try
      try
        FTemp := Tclientdataset.Create(nil);

        info := Web.QueryCarListReturnDelphiXml;
        FTemp.XMLData := info;
        FTemp.Open;

        FTemp.First;
        for i := 0 to FTemp.RecordCount - 1 do
        begin
          car := ACarManage.AddNewCar(FTemp.FieldByName('CAR_ID').AsInteger);
          car.id := FTemp.FieldByName('CAR_ID').AsInteger;
          car.ZBH := FTemp.FieldByName('CAR_ZBH').AsString;
          car.No := FTemp.FieldByName('CAR_NO').AsString;
          car.Memo := FTemp.FieldByName('CAR_MEMO').AsString; //car_memo   改后再改..............
          car.resid := FTemp.FieldByName('RES_ID').AsInteger;
          CarType := CarTypeManage.Find(FTemp.FieldByName('CARTYPE_ID').AsInteger);
          if CarType <> nil then
            car.CarType := CarType.CarTypeName;
            { TODO -osjp : 加载项：省市域 }
          car.ShengId := FTemp.FieldByName('SHENGID').AsInteger;  //add sjp.20110603
          car.ShiId := FTemp.FieldByName('SHIID').AsInteger;
          car.ChePaiColor := FTemp.FieldByName('CHEPAICOLOR').AsInteger;
          case car.ChePaiColor of
            1: car.CpColorStr := '蓝色';
            2: car.CpColorStr := '黄色';
            3: car.CpColorStr := '黑色';
            4: car.CpColorStr := '白色';
            9: car.CpColorStr := '其它';
          else
            car.CpColorStr := '';
          end;
          car.ShengName := FTemp.FieldByName('shengname').AsString;
          car.ShiName := FTemp.FieldByName('shiname').AsString;
//          if not FTemp.FieldByName('trans_type').IsNull then
//          begin
            car.IndustryNo := FTemp.FieldByName('trans_type').AsString;
            car.IndustryName := FTemp.FieldByName('trans_typename').AsString;
//          end;
//          ResManage.find(car.resid, car.ResIndex);
          car.stat := 0;
          if Assigned(FonsendPerMessage) then
          begin
            FonsendPerMessage('正在加载' + car.No + '的基本信息...');
          end;
          FTemp.Next;
          Application.ProcessMessages;
        end;

        Result := True;

      except on E: Exception do
        raise Exception.Create(e.Message);
      end;
    finally
      FTemp.Close;
      FTemp.free;

    end;
  finally
  end;
end;

function TBusinessSevercom.CarInfo(): string;
var
  saveCursor: TCursor;
begin
  Result := '';
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
       Result := Web.QueryCarListReturnDelphiXml;
    except 
      on E: Exception do
      begin
        raise Exception.Create(e.Message); 
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.ChangePassword(Auser: Tuser; newpass: string): Boolean; //修改密码
var
  saveCursor: TCursor;
begin
  Result := false;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
       if LowerCase(web.ModifyUser_password(Auser.Password, newpass)) = 'ok' then
          Result := True;
    except {  添加 ChangePassword 出错后的处理 }
      on E: Exception do
      begin
        messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

procedure TBusinessSevercom.ConnectServer;
  procedure ChangeBs;
  begin
    if FHostCurrent = FHost then
    begin
      if FHostBak <> '' then
      begin
        FHostCurrent := FHostBak;
        FPortCurrent := FPortBak;

{$IFNDEF ForTestUser}
        FHostCurrent := ConstIP;
        FPortCurrent := ConstPortOfBiz;
{$ENDIF}
      end
      else
      begin
        FHostCurrent := FHost;
        FPortCurrent := FPort;
{$IFNDEF ForTestUser}
        FHostCurrent := ConstIP;
        FPortCurrent := ConstPortOfBiz;
{$ENDIF}
      end;
    end
    else
    begin
      FHostCurrent := FHost;
      FPortCurrent := FPort;
{$IFNDEF ForTestUser}
      FHostCurrent := ConstIP;
      FPortCurrent := ConstPortOfBiz;
{$ENDIF}
    end;
  end;
  procedure ConnectingBs;
  begin
    FSocket.Host := FHostCurrent;
    FSocket.Port := FPortCurrent;
    FSocket.ServerGUID := GlobalParam.BizGuid;
    FSocket.InterceptGUID := GlobalParam.InterceptGUID;
    FSocket.Connected := True;
    FTimer.Enabled := True;
  end;
begin
//  try
//    try
//      if not FSocket.Connected then
//      begin
//        if FrmConnectingBiz = nil then
//          FrmConnectingBiz := TConnectingBizFrm.Create(nil);
//          FrmConnectingBiz.Show;
//          Application.ProcessMessages;
//          FHostCurrent := GlobalParam.Business.Host;
//          FPortCurrent := GlobalParam.Business.Port;
//    {$IFNDEF ForTestUser}
//          FHostCurrent := ConstIP;
//          FPortCurrent := ConstPortOfBiz;
//    {$ENDIF}
//          if GlobalParam.IsUseBusinessBak then
//          begin
//            FHostBak := GlobalParam.BusinessBak.Host;
//            FPortBak := GlobalParam.BusinessBak.Port;
//    {$IFNDEF ForTestUser}
//            FHostBak := ConstIP;
//            FPortBak := ConstPortOfBiz;
//    {$ENDIF}
//          end;
//          ConnectingBs;
//      end;
//    except
//      if GlobalParam.IsUseBusinessBak then
//      begin
//        ChangeBs;
//        try
//          ConnectingBs;
//        except
//          raise ESocketConnectionError.Create('连接到业务服务器失败,请检查网络和参数设置.');
//          popmsg('提示', '连接到业务服务器失败,请检查网络和参数设置.');
//        end;
//      end
//      else
//      begin
//        raise ESocketConnectionError.Create('连接到业务服务器失败,请检查网络和参数设置.');
//        popmsg('提示', '连接到业务服务器失败,请检查网络和参数设置.');
//      end;
//    end;
//  finally
//    FrmConnectingBiz.Hide;
//  end;
end;



constructor TBusinessSevercom.Create;
begin
  inherited;
  FSocket := TSocketConnection.Create(nil);
  FSocket.AfterConnect := FSocketAfterConnected;
  FTemp := Tclientdataset.Create(nil);
  FTemp.PacketRecords := 100;
  FCancelMenuData := Tclientdataset.Create(nil);
  FTimer := TTimer.Create(nil);

  FAreaDevData := Tclientdataset.Create(nil);
  FAreaDevData.PacketRecords := 100;


  FTimer.Interval := GlobalParam.BizOffTime;
  FTimer.Enabled := false;
  FTimer.OnTimer := FTimerTimer;
  cs := AuthHeader.Create;
end;

destructor TBusinessSevercom.Destroy;
begin
  cs.Free;
  FSocket.Free;
  FTemp.Free;
  FTimer.Free;
  FCancelMenuData.Free;
  FAreaDevData.Free;
  inherited;
end;

function TBusinessSevercom.DevGroupinfo(ADevGroupManage: TDevGroupManage): Boolean; //组　信息
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  i: integer;
  grp: TDevGroup;
  xml: string;
  XMLDoc: TXMLDocument;
  t: TComponent;
  node: IXMLNode;

  FTemp: TClientDataSet;
begin
  Result := false;

  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;

  try
    FTemp := TClientDataSet.Create(nil);

    FTemp.XMLData := Web.QueryUserGroupReturnDelphiXml;
    FTemp.Open;
    FTemp.First;

    for i := 0 to FTemp.RecordCount - 1 do
    begin
      grp := ADevGroupManage.Add(FTemp.FieldByName('GROUP_ID').AsInteger);
      grp.id := FTemp.FieldByName('GROUP_ID').AsInteger;
      //取得当前组中的设备(车辆)数

      //grp.DevCount := QueryDevCount(grp.Id);
      grp.name := FTemp.FieldByName('GROUP_NAME').AsString;
      grp.TelPhone := FTemp.FieldByName('GROUP_TEL').AsString;

      grp.parent := FTemp.FieldByName('GROUP_PARENT').AsInteger;
      grp.DLYSXKZ := FTemp.FieldByName('dlysxkz').AsString;

      if FTemp.FieldByName('LEAF_NOD').AsInteger = 0 then
        grp.leaf_nod := false
      else grp.leaf_nod := True;

      application.ProcessMessages;
      FTemp.Next;
    end;

  finally

    FTemp.Close;
    FTemp.Free;
    Screen.Cursor := saveCursor;
  end;

  {try
    t := TComponent.Create(nil);
    XMLDoc := TXMLDocument.create(t);
      try
        xml :='<?xml version="1.0" encoding="GB2312"?>' +  Web.QueryUserGroup;

        XMLDoc.XML.Text :=  xml;
        XMLDoc.Active := true;
        XMLDoc.Encoding := 'gb2312';

        node := XMLDoc.DocumentElement.ChildNodes['Table'];
        if node.ChildNodes.Count <= 0 then
          Exit;
        while (node <> nil ) do
        begin

          grp := ADevGroupManage.Add(StringToInteger(trim(node.ChildNodes['GROUP_ID'].Text)));
          grp.id := StringToInteger(node.ChildNodes['GROUP_ID'].Text);
          //取得当前组中的设备(车辆)数

          //grp.DevCount := QueryDevCount(grp.Id);
          grp.name := trim(node.ChildNodes['GROUP_NAME'].Text);
          grp.parent := StringToInteger(trim(node.ChildNodes['GROUP_PARENT'].Text));

          if StringToInteger(trim(node.ChildNodes['LEAF_NOD'].Text)) = 0 then
            grp.leaf_nod := false
          else grp.leaf_nod := True;

          node := node.NextSibling;
          application.ProcessMessages;

        end;

        Result := True;
      except
        on E: Exception do
        begin
          raise Exception.Create(e.Message);
        end;
      end;
  finally
    Screen.Cursor := saveCursor;
    XMLDoc.Free;
    t.Free;
  end; }
end;

function TBusinessSevercom.DeviceInfoByList(AnIDS: TIntegerDynArray; ADeviceManage: TDeviceManage): Boolean; //设备信息
var
  info, info1: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  i: integer;
  target: TDevice;
begin
  Result := false;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info1 := AnIDS;
        info := infoServer.QueryDevbyList(info1);
        if not check_return(info) then Exit; // 记录集为空

        FTemp.Data := info;
        FTemp.First;
        for i := 0 to FTemp.RecordCount - 1 do
        begin
          target := ADeviceManage.Add(FTemp.FieldByName('DEV_ID').AsString);
         // GetTargetFromDataSet(target,FTemp);
          FTemp.Next;
        end;
        Result := True;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.DeviceInfo(ADeviceManage: TDeviceManage): Boolean;
{var
  info: oleVariant; //, info2
  saveCursor: TCursor;
  temp: Tclientdataset;
  i: integer;
  dev0: TDevice;
  xml: string;
  XMLDoc: TXMLDocument;
  t: TComponent;
  node: IXMLNode; 
begin
  Result := false;              


  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  //temp := Tclientdataset.Create(nil);

  try
    t := TComponent.create(nil);
    XMLDoc := TXMLDocument.create(t);
      try
        xml :='<?xml version="1.0" encoding="GB2312"?>' +  Web.QueryUserDevList ;

        XMLDoc.XML.Text :=  xml;
        XMLDoc.Active := true;
        XMLDoc.Encoding := 'gb2312';

        node := XMLDoc.DocumentElement.ChildNodes['Table'];
        if node.ChildNodes.Count <= 0 then
          Exit;
        while (node <> nil ) do
        begin
          //取得当前组中的设备(车辆)数

          dev0 := ADeviceManage.Add(trim(node.ChildNodes['DEV_ID'].Text));
          dev0.fact_id := StringToInteger(trim(node.ChildNodes['FACT_ID'].Text));
          dev0.DispLabel := trim(trim(node.ChildNodes['DISP_LABEL'].Text));
          dev0.SimNo := trim(node.ChildNodes['SIM_NO'].Text);
          //dev0.ConnTypeID := strtoint(trim(node.ChildNodes['connType_ID'].Text));
          dev0.GroupID := StringToInteger(trim(node.ChildNodes['GROUP_ID'].Text));
          dev0.Pattern := 1; // 显示轨迹时，画的是实线，在这里赋1，就可以在轨迹回放时实现用虚线画轨迹线
          //dev0.DisPlayCoName := trim(node.ChildNodes['DEV_DISPLAY'].Text);
          //将车机ID号放入到 相应车组的 DevList中
          ADevGroupManage.InsertDevList(dev0.id, dev0.GroupID);
          dev0.Car := ACarManage.getCar(StringToInteger(trim(node.ChildNodes['CAR_ID'].Text)));
          if Assigned(FonsendPerMessage) then
          begin
            FonsendPerMessage('正在加载' + dev0.Car.No + '的设备信息...');
          end;
          node := node.NextSibling;
          Application.ProcessMessages;
        end;

        //列出所有 父组 下的子组，将子组ID放到 父组的子组数组中，
        //  并把子组的DevArray放到父组的DevArray中，方便以后使用
        ADevGroupManage.ListSon;
        Result := True;
      except //   QueryDevList  error
        on E: Exception do
        begin
          raise Exception.Create(e.Message); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
  finally
    Screen.Cursor := saveCursor;
    //temp.Free;
    XMLDoc.Free;
    t.Free;
  end;     }
var
  FTemp: TClientDataSet;
  i: Integer;
  info: string;
  dev0: TDevice;
  devId: string;
begin
  try
    try
      //coinitialize(nil);
      try
        FTemp := Tclientdataset.Create(nil);

        info := Web.QueryUserDevListReturnDelphiXml;
        FTemp.XMLData := info;
        FTemp.Open;

        FTemp.First;
        for i := 0 to FTemp.RecordCount - 1 do
        begin
          //取得当前组中的设备(车辆)数

          devId := FTemp.FieldByName('DEV_ID').AsString;
          FillStr(devId, 12, '0');
          dev0 := ADeviceManage.Add(devId);
          //dev0.fact_id := FTemp.FieldByName('FACT_ID').AsInteger;
          dev0.DispLabel := FTemp.FieldByName('DISP_LABEL').AsString;
          dev0.SimNo := FTemp.FieldByName('SIM_NO').AsString;
          dev0.GroupID := FTemp.FieldByName('GROUP_ID').AsInteger;
          dev0.Pattern := 1; // 显示轨迹时，画的是实线，在这里赋1，就可以在轨迹回放时实现用虚线画轨迹线
          //将车机ID号放入到 相应车组的 DevList中
          ADevGroupManage.InsertDevList(dev0.id, dev0.GroupID);
          dev0.Car := ACarManage.getCar(FTemp.FieldByName('CAR_ID').AsInteger);
          if Assigned(FonsendPerMessage) then
          begin
            FonsendPerMessage('正在加载' + dev0.Car.No + '的设备信息...');
          end;
          FTemp.Next;
          Application.ProcessMessages;
        end;

        //列出所有 父组 下的子组，将子组ID放到 父组的子组数组中，
        //  并把子组的DevArray放到父组的DevArray中，方便以后使用
        ADevGroupManage.ListSon;
        Result := True;
        
      except on E: Exception do
        raise Exception.Create(e.Message); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    finally
      FTemp.Close;
      FTemp.free;
    end;
  finally
    //CoUninitialize;
  end;
end;

function TBusinessSevercom.DeviceInfo(): string;
var
  saveCursor: TCursor;
begin
  Result := '';
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
      Result := web.QueryUserDevListReturnDelphiXml;
    except
      on E: Exception do
      begin
        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;

  end;
end;

function TBusinessSevercom.DriverInfo(ADriverManage: TDriverManage): Boolean; //司机信息
var
  saveCursor: TCursor;
  i, int: integer;
  Driver: PDriver;
  xml: string;
  XMLDoc: TXMLDocument;
  t: TComponent;
  node: IXMLNode;
begin
  Result := false;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
     t := TComponent.create(nil);
     XMLDoc := TXMLDocument.create(t);
      try
        xml :='<?xml version="1.0" encoding="GB2312"?>' +  Web.QueryDriverList;

        XMLDoc.XML.Text :=  xml;
        XMLDoc.Active := true;
        XMLDoc.Encoding := 'gb2312';

        node := XMLDoc.DocumentElement.ChildNodes['Table'];
        if node.ChildNodes.Count <= 0 then
          Exit;
        ADriverManage.ClearDriver;
        while (node <> nil ) do
        begin
          Driver := ADriverManage.AddNewDriver(StringToInteger(trim(node.ChildNodes['DRIVER_ID'].Text)));
          Driver^.id := StringToInteger(trim(node.ChildNodes['DRIVER_ID'].Text));
          Driver^.Name := trim(node.ChildNodes['DRIVER_NAME'].Text);
          Driver^.CarID := StringToInteger(trim(node.ChildNodes['CAR_ID'].Text));

          Driver^.GroupID := StringToInteger(trim(node.ChildNodes['GROUP_ID'].Text));
          Driver^.DriverNO := trim(node.ChildNodes['DRIVER_NO'].Text);
          Driver^.TEL := trim(node.ChildNodes['DRIVER_TEL'].Text);
          Driver^.Address := trim(node.ChildNodes['DRIVER_ADDR'].Text);
          Driver^.IdentityCard := trim(node.ChildNodes['DRIVER_IDENTITYCARD'].Text);
          int := StringToInteger(trim(node.ChildNodes['DRIVER_Kind'].Text));
          if int = 0 then Driver^.isMain := True else Driver^.isMain := false;

          node := node.NextSibling;
        end;
      except //   QueryDevList  error
        on E: Exception do
        begin
          raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
  finally
    Screen.Cursor := saveCursor;
    XMLDoc.Free;
    t.Free;
  end;
end;

function TBusinessSevercom.TDriverInfo(ADriverManage: TDriverManage; lable: TLabel): string; //司机信息
var
  DataXml: string;
begin
  try
    try
      Result := '';
      DataXml := Web.QueryDriverListReturnDelphiXml;

      Result := DataXml;
    except //   QueryDevList  error
      on E: Exception do
      begin
        raise Exception.Create('无法连接业务服务器！ ');
      end;
    end;
  finally
  end;
end;

function TBusinessSevercom.Query_JudgeNotOkList(): Boolean;
var
  saveCursor: TCursor;
  i, int: integer;
  Driver: PDriver;
  xml: string;
  JudgeNotOk: TJudgeNotOk;
begin
  Result := false;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
      try
        //xml := Web.Query_JudgeNotOkList;
        FTemp.XMLData := xml;
        FTemp.First;
        for i := 0 to FTemp.RecordCount - 1 do
        begin
          JudgeNotOk := TJudgeNotOk.Create;
          JudgeNotOk.desc := FTemp.FieldByName('NOTOK_DESC').AsString;
          JudgeNotOkList.AddData(FTemp.FieldByName('NOTOK_NUM').AsInteger, JudgeNotOk);
          FTemp.Next;
        end;
      except //   QueryDevList  error
        on E: Exception do
        begin
          raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;

  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.Reload_DeviceInfo(
  ADeviceManage: TDeviceManage): Boolean;
var
  info: oleVariant; //  , info2
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  temp2: Tclientdataset;
  i: integer;
  dev0: TDevice;
  addCnt, delCnt: integer; //刷新后，加入的车机数，删除掉的车机数
  xml: string;
  XMLDoc: TXMLDocument;
  t: TComponent;
  node: IXMLNode;
begin
  Result := false;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  delCnt := 0;
  try
    t := TComponent.Create(nil);
    XMLDoc := TXMLDocument.Create(t);
      try

       xml :='<?xml version="1.0" encoding="GB2312"?>' +  Web.QueryUserDevList ;

        XMLDoc.XML.Text :=  xml;
        XMLDoc.Active := true;
        XMLDoc.Encoding := 'gb2312';

        node := XMLDoc.DocumentElement.ChildNodes['Table'];
        if node.ChildNodes.Count <= 0 then
          Exit;

//        for i := 0 to ADeviceManage.Count - 1 do
//          ADeviceManage.Items[i].IsRefresh_Exist := false;

        addCnt := 0;
        while (node <> nil ) do
        begin
          //--刷新后，重新载入，先判断：车机管理器中是否有该ID，如无，再Add；如有，只更改相关属性
//          dev0 := ADeviceManage.find(StringToInteger(Trim(node.ChildNodes['DEV_ID'].Text)));
          dev0 := ADeviceManage.find(Trim(node.ChildNodes['DEV_ID'].Text));
          if dev0 = nil then
          begin
            dev0 := ADeviceManage.Add(Trim(node.ChildNodes['DEV_ID'].Text));
            addCnt := addCnt + 1;
          end;
          //刷新后，还存在
//          dev0.IsRefresh_Exist := True;
          //dev0.fact_id := StringToInteger(trim(node.ChildNodes['FACT_ID'].Text));
          dev0.DispLabel := trim(trim(node.ChildNodes['DISP_LABEL'].Text));
          dev0.SimNo := trim(node.ChildNodes['SIM_NO'].Text);
          dev0.GroupID := StringToInteger(trim(node.ChildNodes['GROUP_ID'].Text));
          //将车机ID号放入到 相应车组的 DevList中
          ADevGroupManage.InsertDevList(dev0.id, dev0.GroupID);
          dev0.Car := ACarManage.getCar(StringToInteger(trim(node.ChildNodes['CAR_ID'].Text)));
          //清除电话本
          //dev0.ClrTelList;
          //清除显示屏固定菜单
          //dev0.ClrDisplayMenuList;
{$IFDEF ForDevLimit}
          {if i = ForDevLimit then
          begin
            messagebox(0, pchar('对不起，您的权限可查看' + IntToStr(FTemp.RecordCount) + '辆车，'
              + #13 + #13 + '但是，您现使用的软件许可只有' + IntToStr(ForDevLimit) + '辆车!'
              + #13 + #13 + '要使用本软件，请到【系统管理客户端】中删除一些您可查看的组或组中的车辆!'
              + #13 + #13 + '或者，如果您想查看更多车辆信息，请与软件提供商联系，购买更高的许可!')
              , '软件许可', mb_ok + mb_iconinformation);
            Application.Terminate;
            Exit;
          end;   }
{$ENDIF}

          node := node.NextSibling;
        end;
        //列出所有 父组 下的子组，将子组ID放到 父组的子组数组中，
        //  并把子组的DevArray放到父组的DevArray中，方便以后使用
        ADevGroupManage.ListSon;
        //如果原来在车机管理器中有的车机，但刷新后，已被在系统管理端删除，处理..
        //if FTemp.RecordCount < ADeviceManage.Count then
        //  delCnt := ADeviceManage.Count - FTemp.RecordCount;
        //if delCnt > 0 then
        //begin
          delCnt := 0;
          i := 0;
          while i < ADeviceManage.Count do
          begin
            dev0 := ADeviceManage.Items[i];
//            if not dev0.IsRefresh_Exist then
//            begin
//              ADeviceManage.Delete(dev0.id);
//              delCnt := delCnt + 1;
//            end
//            else
//              i := i + 1;
          end;
        //end;
{$IFOPT D+}
        if (addCnt > 0) or (delCnt > 0) then
          popmsg('提示', '增加了' + IntToStr(addCnt) + '辆，删除了' + IntToStr(delCnt) + '辆车的信息');
{$ENDIF}
        Result := True;
      except //   QueryDevList  error
        on E: Exception do
        begin
          raise Exception.Create('无法连接业务服务器！ '); //popmsg('错误提示', E.message);
        end;
    end;
  finally
    Screen.Cursor := saveCursor;
    XMLDoc.Free;
    t.Free;
  end;

end;

function TBusinessSevercom.ResInfo(AImgResManage: TImgResManage): Boolean; //资源信息  ok
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  i: integer;
  pir: PImgRes;
begin
  Result := false;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QueryResList;
        if not check_return(info) then Exit; // 记录集为空

        FTemp.Data := info;
        FTemp.First;
        for i := 0 to FTemp.RecordCount - 1 do
        begin
          pir := AImgResManage.AddNewImgRes(FTemp.FieldByName('res_ID').AsInteger);
          pir^.id := FTemp.FieldValues['res_id'];
          pir^.Name := trim(FTemp.FieldValues['res_name']);
          pir^.content := FTemp.FieldValues['res_content'];
          pir^.exttype := trim(FTemp.FieldValues['res_exttype']);
          FTemp.Next;
        end;
        Result := True;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

procedure TBusinessSevercom.SetUserId(const Value: integer);
begin
  FUserId := Value;
end;

procedure TBusinessSevercom.SetUserName(const Value: string);
begin
  FUserName := Value;
end;

procedure TBusinessSevercom.SetUserPass(const Value: string);
begin
  FUserPass := Value;
end;


function TBusinessSevercom.userlogin(Auser: Tuser): Boolean;
  function isTrueFalse(int: integer): Boolean;
  begin
    if int = 1 then Result := True else Result := false;
  end;
var
  info, info1: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  Privilege: PPrivilege;
  p: array of integer;
  i: integer;
  soap1: ServiceSoap;
  id : Integer;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}

  Result := false;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
      try

        id := web.UserLogin(Auser.UserName, Auser.Password);

        if id<>0  then
        begin
          Auser.id := id;
          Result := True;
        end else
        begin
          messagebox(0, '没有此用户，或密码错误，请重新输入！', '提示', mb_ok + mb_iconinformation);
          Exit;
        end;
        //----查询用户信息，返回用户 clientDataset.data
       // info := Web.QueryUser_Privilege(Auser.id);//infoServer.QueryUser(Auser.id);
       // if check_return(info) then
       // begin
       //   FTemp.Data := info;
       //   Auser.roleID := FTemp.FieldValues['ROLE_ID'];
          //-----查询角色权限，返回 角色权限 的　TIntegerDynArray数组

          info1 := Web.QueryUser_Privilege(Auser.id);

          FTemp.XMLData := info1;
          if FTemp.RecordCount > 0 then
          begin
            FTemp.First;
            while not FTemp.Eof do
            begin
              Privilege := Auser.AddPrivilege(FTemp.FieldByName('privilege').AsInteger);
              Privilege^.Visible := FTemp.FieldByName('PRIVILEGE_VISIBLE').AsInteger = 1;
              Privilege^.Enabled := FTemp.FieldByName('PRIVILEGE_Enabled').AsInteger = 1;
              FTemp.Next;
            end;


            //---- 返回用户可查看的　组 的 TIntegerDynArray数组
            {info := infoServer.QueryUserGroupList(Auser.id);
            if check_return(info) then
            begin
              p := info;
              for i := Low(p) to High(p) do Auser.AddGroup(p[i]);
            end;      }
            Result := True;
          end
          else
          begin
            messagebox(0, '此用户现没有任何权限，请向系统管理员查询！', '提示', mb_ok + mb_iconinformation);
            Exit;
          end;
      except
        on E: Exception do
        begin
          //raise Exception.Create(e.Message);

          FSocket.Connected := false;
          Result := false;

          if pos(UpperCase('midas.dll'), UpperCase(E.message)) > 0 then
          begin
            SetCurrentDir(ExePath);
            shellexecute(Application.Handle, 'open', pchar(ExePath + 'Init.bat'), nil, nil, sw_show);
            //messagebox(0, pchar(E.message + '  把程序关闭后重新打开。'), '提示', mb_ok + mb_iconinformation);
            raise Exception.Create(E.message + '  把程序关闭后重新打开。');
          end
          else
          begin
            raise Exception.Create(E.message);
            //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
          end;
        end;
      end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryUser_Privilege(Auser: TUser): Boolean;
  function isTrueFalse(int: integer): Boolean;
  begin
    if int = 1 then Result := True else Result := false;
  end;
var
  info, info1: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  Privilege: PPrivilege;
  p: array of integer;
  i: integer;
  soap1: ServiceSoap;
  id : Integer;
begin

  Result := false;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
      try
          try
            info1 := Web.QueryUser_Privilege(Auser.id);
          except
            on e: Exception do
            begin
              raise Exception.Create('无法连接业务服务器！ ');
            end;
          end;
          FTemp.XMLData := info1;
          if FTemp.RecordCount > 0 then
          begin
            FTemp.First;
            while not FTemp.Eof do
            begin
              Privilege := Auser.AddPrivilege(FTemp.FieldByName('privilege').AsInteger);
              Privilege^.Visible := FTemp.FieldByName('PRIVILEGE_VISIBLE').AsInteger = 1;
              Privilege^.Enabled := FTemp.FieldByName('PRIVILEGE_Enabled').AsInteger = 1;
              FTemp.Next;
            end;

            Result := True;
          end
          else
          begin
            messagebox(0, '此用户现没有任何权限，请向系统管理员查询！', '提示', mb_ok + mb_iconinformation);
            Exit;
          end;
        //end; 
      except
        on E: Exception do
        begin
          FSocket.Connected := false;
          Result := false;

          if pos(UpperCase('midas.dll'), UpperCase(E.message)) > 0 then
          begin
            SetCurrentDir(ExePath);
            shellexecute(Application.Handle, 'open', pchar(ExePath + 'Init.bat'), nil, nil, sw_show);
            messagebox(0, pchar(E.message + '  把程序关闭后重新打开。'), '提示', mb_ok + mb_iconinformation);
          end
          else
            messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.userlogout(Auser: Tuser): Boolean;
var infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  Result := false;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        infoServer.Logout(Auser.id);
        Logined := false;
        Auser.ClearPrivilege;
        Result := True;
      except {  添加 出错后的处理 }
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.check_return(Ainfo: oleVariant): Boolean;
begin
  if not (VarIsNull(Ainfo) or VarIsEmpty(Ainfo) or (Length(Ainfo) = 0)) then //如果返回的 oleVariant 的数据集 不为空
    Result := True
  else
    Result := false;
end;

procedure TBusinessSevercom.FSocketAfterConnected(Sender: TObject);
begin
  try
    FTimer.Enabled := True;
    if FrmConnectingBiz <> nil then FrmConnectingBiz.Hide;
    Logined := userlogin(current_user);
  except on E: Exception do
    begin
      FTimer.Enabled := false;
      showmessage(E.message);
    end;
  end;
end;

procedure TBusinessSevercom.QueryDeviceInfo(ADevice: TDevice);
begin

end;

procedure TBusinessSevercom.QueryCarInfo(var ACar: TCar);
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  i: integer;
//  ps0: PCar;
  xml: string;
  XMLDoc: TXMLDocument;
  t: TComponent;
  node: IXMLNode;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    t := TComponent.Create(nil);
    XMLDoc := TXMLDocument.create(t);
    try

      xml :='<?xml version="1.0" encoding="GB2312"?>' +  Web.QueryCarList;

      XMLDoc.XML.Text :=  xml;
      XMLDoc.Active := true;
      XMLDoc.Encoding := 'gb2312';

      node := XMLDoc.DocumentElement.ChildNodes['Table'];
      while (node <> nil ) do
      begin
        ACar.No := node.ChildNodes['GROUP_ID'].Text;
        ACar.Memo := node.ChildNodes['GROUP_NAME'].Text;

        node := node.NextSibling;

      end;

      {infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
      info := infoServer.QueryCar(ACar.id);
      if not check_return(info) then Exit; // 记录集为空
      FTemp.Data := info;
      if FTemp.RecordCount > 0 then
      begin
        ACar.No := trim(FTemp.FieldValues['car_no']);
        ACar.Memo := trim(FTemp.FieldValues['car_memo']);
      end; }
    except
      on E: Exception do
      begin
        messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
    XMLDoc.Free;
    t.Free;
  end;
end;

{procedure TBusinessSevercom.QueryAllBitmapResD;
var
  info:       OleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.DownAllRes;
        if not check_return(info) then exit; // 记录集为空
        FTemp.Data := info;
      except on E: exception do
        begin
          messagebox(0, pchar(e.Message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

        }

procedure TBusinessSevercom.QueryAllBitmapRes;
//var
//  info: oleVariant;
//  infoServer: IBusinessDisp;
//  saveCursor: TCursor;
//  i: integer;
//  blob: TClientBlobStream;
begin
//  ConnectServer;
//  saveCursor := Screen.Cursor;
//  Screen.Cursor := crHourGlass;
//  try
//    if FSocket.Connected then
//    begin
//      try
//        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
//        info := infoServer.DownAllRes;
//        if not check_return(info) then Exit; // 记录集为空
//        FTemp.Data := info;
//        FTemp.First;
//        for i := 0 to FTemp.RecordCount - 1 do
//        begin
//          blob := TClientBlobStream.Create(TBlobField(FTemp.FieldByName('res_content')), bmRead);
//          ResManage.AddBitmap(FTemp.FieldByName('res_ID').AsInteger, blob);
//          blob.Free;
//          FTemp.Next;
//        end;
//      except on E: Exception do
//        begin
//          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
//        end;
//      end;
//    end;
//  finally
//    Screen.Cursor := saveCursor;
//  end;
end;

procedure TBusinessSevercom.QueryParam;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  s: string;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.RequestConfigParam;
        if not check_return(info) then Exit;
        s := info;
        GlobalParam.loadFromRemote(s);
        FTimer.Interval := GlobalParam.BizOffTime;
      except on E: Exception do
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

procedure TBusinessSevercom.DisConnectServer;
begin
  if FSocket.Connected then
  begin
    FSocket.Connected := false;
    FTimer.Enabled := false;
  end;
end;

procedure TBusinessSevercom.FTimerTimer(Sender: TObject);
begin
  DisConnectServer;
end;

function TBusinessSevercom.GetActive: Boolean;
begin
  Result := FSocket.Connected;
end;

function TBusinessSevercom.QueryHistoryData(ADevID: string; AFact_id: Integer; ATimeFrom,
  ATimeTo: TDatetime; pageSize: Integer; CurrPageIndex: Integer): string;
var
  strXML: string;
  saveCursor: TCursor;
begin
  //ConnectServer;
//  saveCursor := Screen.Cursor;
//  Screen.Cursor := crHourGlass;
  try
    try
//      Result := Web.QueryHistoryData(AFact_id, ADevID,
//                                     FormatDatetime('yyyy-mm-dd hh:nn:ss', ATimeFrom),
//                                     FormatDatetime('yyyy-mm-dd hh:nn:ss', ATimeTo),
//                                     pageSize, CurrPageIndex);
    except
      on E: Exception do
        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
    end;
  finally
//    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryHistoryDataRetrunDelphiXml(ADevID: string; AFact_id: Integer; ATimeFrom,
                                            ATimeTo: TDatetime; pageSize: Integer; CurrPageIndex: Integer): string;
var
  saveCursor: TCursor;
begin
//  saveCursor := Screen.Cursor;
//  Screen.Cursor := crHourGlass;
  try
    try
      Result := Web.QueryHistoryDataRetrunDelphiXml(ADevID,
                                     FormatDatetime('yyyy-mm-dd hh:nn:ss', ATimeFrom),
                                     FormatDatetime('yyyy-mm-dd hh:nn:ss', ATimeTo),
                                     pageSize, CurrPageIndex);
    except
      on E: Exception do
      begin
        Result := '';
        //raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
//    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryHistoryCount(ADevID: string; AFact_id: Integer; ATimeFrom,
  ATimeTo: TDatetime): integer;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  Result := 0;
  //ConnectServer;
  //saveCursor := Screen.Cursor;
  //Screen.Cursor := crHourGlass;
  try
    try
      Result := Web.QueryHistoryDataCount(ADevID,
                                          FormatDatetime('yyyy-mm-dd hh:nn:ss', ATimeFrom),
                                          FormatDatetime('yyyy-mm-dd hh:nn:ss', ATimeTo));
    except
      on E: Exception do
        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
    end;
  finally
    //Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.AddNewMsg(fact_id: Integer;  dev_Id: string; msg_type: Integer;
                                    msgContent: string;  msgShowFlag: Integer; msg_memo: string;  msg_DownAnswers: string): integer;
var
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  Result := -1;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
        Result := Web.AddNewMessage(dev_Id, msg_type, msgContent, msgShowFlag, msg_memo, msg_DownAnswers);
//      Result := Web.AddNewMessage(fact_id, dev_Id, msg_type, msgContent, msgShowFlag, msg_memo, msg_DownAnswers)
        Result :=1;
    except on E: Exception do
        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.AddNewCmdLog(const user_id: Integer; const dev_id: string;
                           const cmd_type: Integer; const cmd_desc: WideString): Integer;
var
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  Result := -1;
  //saveCursor := Screen.Cursor;
  //Screen.Cursor := crHourGlass;
  try
    try
//      Result := Web.AddNewCmdLog(user_id, fact_id, dev_Id, cmd_type, cmd_desc);
    except on E: Exception do
        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
    end;
  finally
    //Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.Query_CmdLogList(const fromtime: WideString; const totime: WideString;
                           const isQueryAllUserSended: Boolean; const dev_id: string; const fact_Id: Integer;
                           const group_id: Integer; const group_IdList: WideString): WideString;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
//      Result := Web.Query_CmdLogList(fromtime, totime, isQueryAllUserSended,
//                                      dev_id, fact_Id, group_Id,
//                                      group_IdList);
    except
      on E: Exception do
      begin
        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;


function TBusinessSevercom.QueryMsgList(ADevlist: string;
  ATimeFrom, ATimeTo: TDatetime): oleVariant;
var
  info, info1: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  Result := -1;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        info1 := ADevlist;
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QueryMsgList(info1, ATimeFrom, ATimeTo);
        if not check_return(info) then Exit;
        Result := info;

      except on E: Exception do
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

{function TBusinessSevercom.QueryUserList: Boolean;
var
  Info: string;
  Users: TUsers;
begin
  try
    Result := True;
    Info := Web.QueryUserList;

    if Info = '对不起，只有系统管理员才有操作权限' then
    begin
      Result := False;
      Exit;
    end;

    Fnode := ProcessXML(Info);
    if (Fnode.ChildNodes.Count = 0) then
      Exit;

    UsersManage.Clear;

    while (Fnode <> nil) do
    begin
      Users := UsersManage.Add(StrToInt(Fnode.ChildNodes['USER_ID'].Text));
      Users.UserID := StrToInt(Fnode.ChildNodes['USER_ID'].Text);
      Users.UserName := Trim(Fnode.ChildNodes['USERNAME'].Text);
      Users.UserPwd := Trim(Fnode.ChildNodes['PASSWD'].Text);
      if Fnode.ChildNodes['ROLE_ID'].Text <> '' then
        Users.RoleID := StrToInt(Fnode.ChildNodes['ROLE_ID'].Text);
      if Fnode.ChildNodes['USER_STAT'].Text <> '' then
        Users.UserStat := StrToInt(Fnode.ChildNodes['USER_STAT'].Text);
      Users.Memo := Trim(Fnode.ChildNodes['MEMO'].Text);
      Fnode := Fnode.NextSibling;
    end;

  except
    on E: Exception do
    begin
      Application.MessageBox(PChar('获取用户信息失败！'), '提示', MB_OK + MB_ICONERROR);
    end;
  end;
end;       }

function TBusinessSevercom.QueryMsgList_state(ADevlist: string;
  ATimeFrom, ATimeTo: TDatetime; AMsgState: integer): oleVariant;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  Result := -1;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QueryMsgListEx(ADevlist, ATimeFrom, ATimeTo, AMsgState);
        if not check_return(info) then Exit;
        Result := info;
      except on E: Exception do
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryDevCount(AGroupId: integer): integer;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  Result := -1;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QueryDevCntByGrpId(AGroupId);
        if not check_return(info) then Exit;
        Result := info;
      except on E: Exception do
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryDevParamOfAll: Boolean; //取所有的车机参数
begin
  Result := false;
  QueryDevParams;
  Result := True;
end;

function TBusinessSevercom.QueryDevParams(): Boolean;
var
  info: string;
  saveCursor: TCursor;
  i, j: integer;
  Dev: TDevice;
  fcount: integer;
  filterStr: string;
begin
  Result := false;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
      try
        //info := Web.QueryDevParamsList;
        //FTemp.XMLData := info;
        //FTemp.Open;

        for i := 0 to ADeviceManage.Count - 1 do
        begin
          Dev := ADeviceManage.Items[i];
          {try
            with FTemp do
            begin
              Filtered := false;
              filterStr := 'DEV_ID=' + Dev.IdStr;
              Filter := filterStr;
              Filtered := True;
            end;
          except
          end; }

//          info := web.QueryDevParamsList_ByDevId(dev.fact_id, Dev.id);
          FTemp.XMLData := info;
          FTemp.Open;
          if Assigned(FonsendPerMessage) then
          begin
            FonsendPerMessage('正在加载' + dev.Car.No + '的参数...');
          end;
          FTemp.First;
          for j := 0 to FTemp.RecordCount - 1 do
          begin
            case FTemp.FieldByName('PARAMTERS_NO').AsInteger of
              $0001: Dev.Param.ZDXTSJ_0001 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0002: Dev.Param.TCPYDCS_0002 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0003: Dev.Param.TCPCC_0003 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0004: Dev.Param.SMSYDCS_0004 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;

              $0005: Dev.Param.SMSCC_0005 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0010: Dev.Param.ZFWQAPN_0010 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0011: Dev.Param.ZFWQYH_0011 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0012: Dev.Param.ZFWQMM_0012 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0013: Dev.Param.ZFWQDZ_0013 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0014: Dev.Param.BFFWQAPN_0014 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0015: Dev.Param.BFFWQYH_0015 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0016: Dev.Param.BFFWQMM_0016 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0017: Dev.Param.BFFWQDZ_0017 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0018: Dev.Param.TCPDK_0018 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              //$0091: Dev.Param.JJQTJSJ_0091 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              //$0090: Dev.Param.JJQTJCC_0090 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0020: Dev.Param.WZHBCL_0020 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0021: Dev.Param.WZHBFA_0021 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0022: Dev.Param.WDLSJJG_0022 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0023: Dev.Param.ACC_OFFSJJG_0023 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0024: Dev.Param.ACC_ONSJJG_0024 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0025: Dev.Param.KCSJJG_0025 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0026: Dev.Param.ZCSJJG_0026 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0027: Dev.Param.XMSJJG_0027 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0028: Dev.Param.JJBJSJJG_0028 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0029: Dev.Param.WDLJLJG_0029 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $002A: Dev.Param.ACC_OFFJLJG_002A := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $002B: Dev.Param.ACC_ONJLJG_002B := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $002C: Dev.Param.KCJLJG_002C := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $002D: Dev.Param.ZCJLJG_002D := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $002E: Dev.Param.XMJLJG_002E := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $002F: Dev.Param.JJBJJLJG_002F := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0030: Dev.Param.GDBCJD_0030 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;

              $0040: Dev.Param.JKPTDH_0040 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0041: Dev.Param.FWDH_0041 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0042: Dev.Param.HFCCSZDH_0042 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0043: Dev.Param.JKPTSMSDH_0043 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0044: Dev.Param.JSZDSMSWBBJDH_0044 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0045: Dev.Param.ZDDHJTCL_0045 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0046: Dev.Param.MCZCTHSJ_0046 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0047: Dev.Param.DYZCTHSJ_0047 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0048: Dev.Param.DHHMCD_0048 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0049: Dev.Param.JTDHHM_0049 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;

              $0050: Dev.Param.BJPBZ_0050 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0051: Dev.Param.BJFSWBSMSKG_0051 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0052: Dev.Param.BJPSKG_0052 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0053: Dev.Param.BJPSCCKG_0053 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0054: Dev.Param.GJBJBZ_0054 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0055: Dev.Param.ZGSD_0055 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0056: Dev.Param.CSCXSJ_0056 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0057: Dev.Param.LXJSSJ_0057 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0058: Dev.Param.ZXXXSJ_0058 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0059: Dev.Param.ZCTCSJ_0059 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $005A: Dev.Param.DTLJJSSJ_005A := FTemp.FieldByName('PARAMTERS_MEMO').AsString;

              $0070: Dev.Param.TXSPZL_0070 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0071: Dev.Param.LD_0071 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0072: Dev.Param.DBD_0072 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0073: Dev.Param.BHD_0073 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0074: Dev.Param.SD_0074 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;

              $0080: Dev.Param.CLLCBDS_0080 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0081: Dev.Param.CLSZSYID_0081 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0082: Dev.Param.CLSZSYID_0082 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;


              $0090: Dev.Param.JJQYYCSXZ_0090 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0091: Dev.Param.JJQYYSJXZ_0091 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $00A0: Dev.Param.MCULYMS_00A0 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $00A1: Dev.Param.MCULYWJZDCD_00A1 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $00A2: Dev.Param.LCDXTJG_00A2 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;

              $00A3: Dev.Param.LEDXTJG_00A3 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $00AF: Dev.Param.ACCOFFXMSJ_00AF := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $00B0: Dev.Param.SPFWQMS_00B0 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $00B1: Dev.Param.SPFWQAPN_00B1 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $00B2: Dev.Param.SPFWQHYM_00B2 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;

              $00B3: Dev.Param.SPFWQMM_00B3 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $00B4: Dev.Param.SPFWQIP_00B4 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $00B5: Dev.Param.SPFWQDK_00B5 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;


              $F001: Dev.Param.MCUID_F001 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $004B: Dev.Param.TTSYL_004B := FTemp.FieldByName('PARAMTERS_MEMO').AsString;

              $0019: Dev.Param.BFTCPDK_0019 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $004A: Dev.Param.MCUWHMM_004A := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
            end;
            FTemp.Next;
          end;
          //FTemp.Filtered := false;
        end;
      except on E: Exception do
        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
  finally
    Screen.Cursor := saveCursor;
    FTemp.Close;
  end;
end;

function TBusinessSevercom.QueryDevParamsList_ByDevId( Dev_ID: string): string;
var
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  Result := '';
  //saveCursor := Screen.Cursor;
  //Screen.Cursor := crHourGlass;
  try
    try
//      Result := Web.QueryDevParamsList_ByDevId(fact_id, dev_Id);
    except on E: Exception do
        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
    end;
  finally
    //Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryDevParam(Dev: TDevice): Boolean; //车机的参数
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  i: integer;
begin
  Result := false;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  Dev.Param.PursueInterval := '30';
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QueryParamByDevID(Dev.IdStr);
        if not check_return(info) then Exit;
        FTemp.Data := info;
        FTemp.First;
        for i := 0 to FTemp.RecordCount - 1 do
        begin
          case FTemp.FieldByName('PARAMTERS_NO').AsInteger of
            $0000: Dev.Param.CurrentIntegral := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
            $0100: Dev.Param.MonitorTelNum := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
            $0101: Dev.Param.RestorationTeLNum := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
            $0102: Dev.Param.NoteServiceCenterNum := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
            $0103: Dev.Param.NoteAlarmCenterNum := FTemp.FieldByName('PARAMTERS_MEMO').AsString;

            $0200: Dev.Param.APN := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
            $0201: Dev.Param.IP_MainCenter := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
            $0202: Dev.Param.DomainNameOfMainCenter := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
            $0203: Dev.Param.IP_AssistantCenter := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
            $0204: Dev.Param.DomainNameOfAssistantCenter := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
            $0205: Dev.Param.PortOfCenter := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
            $090D: Dev.Param.PortOfCenter2 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;  //副中心端口号 20081231 sha
            $0206: Dev.Param.HeartbeatInterval := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
            $0207: Dev.Param.DNS_IP := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
            $0300: Dev.Param.DevId := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
            $0301: Dev.Param.Password := FTemp.FieldByName('PARAMTERS_MEMO').AsString;

            $0400: Dev.Param.Overspeed := FTemp.FieldByName('PARAMTERS_MEMO').AsString;

            $0500: Dev.Param.isTurnBrandPhoto := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
            $0501: Dev.Param.isCloseDoorPhoto := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
            $0502: Dev.Param.isSaveAlarmPhoto := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
            $0503: Dev.Param.IP_MainPhoto := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
            $0504: Dev.Param.DomainNameOfMainPhoto := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
            $0505: Dev.Param.IP_AssistantPhoto := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
            $0506: Dev.Param.DomainNameOfAssistantPhoto := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
            $0507: Dev.Param.PortOfPhoto := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
            $0508: Dev.Param.SavePhotoTimeBegin := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
            $2508: Dev.Param.SavePhotoTimeEnd := FTemp.FieldByName('PARAMTERS_MEMO').AsString; //自定义ID号..$2508

            $0600: Dev.Param.OrderFormTurnTime := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
            $0700: Dev.Param.TaxiMetaStopDateTime := FTemp.FieldByName('PARAMTERS_MEMO').AsString;

            $2000: Dev.Param.PursueInterval := FTemp.FieldByName('PARAMTERS_MEMO').AsString;

          end;
          FTemp.Next;
        end;
        Result := True;
      except on E: Exception do
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;


procedure TBusinessSevercom.DeleteParamByNoDevID(AParamNo: integer; const ADevID: WideString);
var
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        infoServer.DeleteParamByNoDevID(AParamNo, ADevID);
      except on E: Exception do
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;


function TBusinessSevercom.DelDevParam(DevId: string): Boolean; //删除某个车机的所有参数
var
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  Result := false;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        infoServer.DeleteParamByDevID(DevId);
        //if not check_return(info) then exit;
        Result := True;
      except on E: Exception do
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;


function TBusinessSevercom.SaveDevParam(Fact_ID: Integer; ADevID: string;  AParamNo: integer; AParam: WideString): Boolean;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  ResStr: string;
begin
  Result := false;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
//      ResStr := Web.AddNewDevParam(Fact_ID, ADevID, AParamNo, AParam);
      if ResStr = 'OK' then
        Result := True
      else
        Result := False;
    except
      on E: Exception do
        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;



{function TBusinessSevercom.UpdateDevPrm(AdeviceID: integer): boolean;
var
  info: OleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  dev: TDevice;
begin




        end; }


function TBusinessSevercom.ModifyDevTelList(Adev: TDevice): Boolean;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  i: integer;
  PTel: PTelInfo;
begin
  Result := false;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;

  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        for i := 0 to Adev.TelList.Count - 1 do
        begin
          PTel := Adev.TelItems[i];
          infoServer.ModifyDisplayTel(PTel^.id, Adev.IdStr, PTel^.No, PTel^.Name, PTel^.TelType);
        end;
        Result := True;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.ModifyDevEventList_AEventInfo(PEvent: PEventInfo): Boolean;
var
  saveCursor: TCursor;
begin
  Result := false;

  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;

  try

      try
        if Web.ModifyAEvent(PEvent^.id, PEvent^.No, PEvent^.Info) = 'OK' then
          Result := True;
      except
        on E: Exception do
        begin
          raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;

  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.ModifyAAmbientInfoMenu(pInfo: pClassInfoMenu): Boolean;
var
  saveCursor: TCursor;
begin
  Result := false;

  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;

  try
    try
      if Web.ModifyAAmbientInfoMenu(pInfo^.id, pInfo^.No, pInfo^.Info) = 'OK' then
        Result := True;
    except
      on E: Exception do
      begin
        messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.ModifyAInfoDemandMenu(pInfo: PInfoMenu): Boolean;
var
  saveCursor: TCursor;
begin
  Result := false;

  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;

  try
    try
      if Web.ModifyAInfoDemandMenu(pInfo^.id, pInfo^.No, pInfo^.Info) = 'OK' then
        Result := True;
    except
      on E: Exception do
      begin
        messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.ModifyDevTelList_ATelInfo(Adev: TDevice;
  PTel: PTelInfo): Boolean;
var
  saveCursor: TCursor;
begin
  Result := false;

  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;

  try

      try
        Web.ModifyATel(PTel^.id, PTel^.No, PTel^.Name, PTel^.TelType,'');
        Result := True;
      except
        on E: Exception do
        begin
          raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;

  finally
    Screen.Cursor := saveCursor;
  end;
end;


function TBusinessSevercom.QueryDevsEventList: Boolean;
var
  info: oleVariant;
  saveCursor: TCursor;
  i: integer;
  Dev: TDevice;
  PEvent: PEventInfo;
begin
  Result := false;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
      try
        info := Web.QueryDev_EventList; // infoServer.QueryDisplayTelList;

        FTemp.XMLData := info;
        FTemp.First;
        for i := 0 to FTemp.RecordCount - 1 do
        begin
          Dev := ADeviceManage.find(FTemp.FieldByName('Dev_ID').AsString);
          if Dev = nil then
          begin
            FTemp.Next;
            continue;
          end;
          if Assigned(FonsendPerMessage) then
          begin
            FonsendPerMessage('正在加载' + dev.Car.No + '的事件信息...');
          end;
          PEvent := Dev.AddEventInfo(FTemp.FieldValues['EVENT_ID']);
          PEvent^.No := StrToInt(trim(FTemp.FieldValues['EVENTNO']));
          PEvent^.Info := trim(FTemp.FieldValues['EVENTDESC']);

          FTemp.Next;
        end;
        Result := True;
      except
        on E: Exception do
        begin
          raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.TQueryDev_EventList: string;
var
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  Result := '';
  //saveCursor := Screen.Cursor;
  //Screen.Cursor := crHourGlass;
  try
    try
      Result := Web.QueryDev_EventList;
    except on E: Exception do
        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
    end;
  finally
    //Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryDevsClassMenuList: Boolean;
var
  info: oleVariant;
  saveCursor: TCursor;
  i: integer;
  Dev: TDevice;
  pInfo: pClassInfoMenu;
begin
  Result := false;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
      try
        info := Web.QueryDev_AmbientInfoMenuList; // infoServer.QueryDisplayTelList;

        FTemp.XMLData := info;
        FTemp.First;
        for i := 0 to FTemp.RecordCount - 1 do
        begin
          Dev := ADeviceManage.find(FTemp.FieldByName('Dev_ID').AsString);
          if Dev = nil then
          begin
            FTemp.Next;
            continue;
          end;
          pInfo := Dev.AddClassInfoMenu(FTemp.FieldValues['AmbientMenu_Id']);
          pInfo.No := StrToInt(trim(FTemp.FieldValues['MenuType']));
          pInfo.Info := trim(FTemp.FieldValues['MenuName']);
          FTemp.Next;
        end;
        Result := True;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function  TBusinessSevercom.QueryInfoDemandMenuList: Boolean;
var
  info: oleVariant;
  saveCursor: TCursor;
  i: integer;
  Dev: TDevice;
  pInfo: pInfoMenu;
begin
  Result := false;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
      try
        info := Web.QueryDev_InfoDemandMenuList; // infoServer.QueryDisplayTelList;

        FTemp.XMLData := info;
        FTemp.First;
        for i := 0 to FTemp.RecordCount - 1 do
        begin
          Dev := ADeviceManage.find(FTemp.FieldByName('Dev_ID').AsString);
          if Dev = nil then
          begin
            FTemp.Next;
            continue;
          end;
          pInfo := Dev.AddInfoMenu(FTemp.FieldValues['Menu_Id']);
          pInfo.No := StrToInt(trim(FTemp.FieldValues['MenuType']));
          pInfo.Info := trim(FTemp.FieldValues['MenuName']);
          FTemp.Next;
        end;
        Result := True;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryDevsTelList: Boolean;
var
  info: oleVariant;
  saveCursor: TCursor;
  i: integer;
  Dev: TDevice;
  PTel: PTelInfo;
begin
  Result := false;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
      try
        info := Web.QueryDev_TelList; // infoServer.QueryDisplayTelList;

        FTemp.XMLData := info;
        FTemp.First;
        for i := 0 to FTemp.RecordCount - 1 do
        begin
          Dev := ADeviceManage.find(FTemp.FieldByName('Dev_ID').AsString);
          if Dev = nil then
          begin
            FTemp.Next;
            continue;
          end;
          if Assigned(FonsendPerMessage) then
          begin
            FonsendPerMessage('正在加载' + dev.Car.No + '的车载电话信息...');
          end;
          PTel := Dev.AddTelInfo(FTemp.FieldValues['TEL_ID']);
          PTel.No := trim(FTemp.FieldValues['TEL_NUMBER']);
          PTel.Name := trim(FTemp.FieldValues['TEL_NAME']);
          PTel.TelType := FTemp.FieldValues['TEL_Type'];
          FTemp.Next;
        end;
        Result := True;
      except
        on E: Exception do
        begin
          raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.TQueryDev_TelList: string;
var
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  Result := '';
  //saveCursor := Screen.Cursor;
  //Screen.Cursor := crHourGlass;
  try
    try
      Result := Web.QueryDev_TelList;
    except on E: Exception do
        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
    end;
  finally
    //Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.AddDevEvent(const eventNo: Integer; const eventDesc: WideString): Integer;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
      try

        Result := Web.AddNewEvent(eventNo, eventDesc);
      except
        on E: Exception do
        begin
          raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.AddNewAmbientInfoMenu(const MenuType: Integer; const MenuName: WideString): Integer;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
      try

        Result := Web.AddNewAmbientInfoMenu(MenuType, MenuName);
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.AddNewInfoDemandMenu(const MenuType: Integer; const MenuName: WideString): Integer;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
      try

        Result := Web.AddNewInfoDemandMenu(MenuType, MenuName);
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.AddDevTel(const ATelNo: string;
  const ATelName: string; ATelType: integer; tel_memo: string): integer;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  Result := -1;
  try
    try
      Result := Web.AddNewtel(ATelNo, ATelName, ATelType, '');
    except
      on E: Exception do
      begin
         raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.AddNewAccuseDriver(const Accuse_Type: Integer; const Accuse_carno: WideString;
                                const TaxiRunID: Integer; const case_HappenTime: WideString;
                                const case_HappenAddr: WideString; const Accuse_Reason: WideString;
                                const passengerName: WideString; const PassengerTelNum: WideString;
                                const PassengerMemo: WideString; const RecordId: Integer): Integer;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
      try

        Result := Web.AddNewAccuseDriver(Accuse_Type, Accuse_carno, TaxiRunID,
                                         case_HappenTime, case_HappenAddr, Accuse_Reason,
                                         passengerName, PassengerTelNum, PassengerMemo, RecordId);
      except
        on E: Exception do
        begin
          raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.AddNewAccuseDriver_driverId(const Accuse_Type: Integer; const Accuse_carno: WideString;
                                         const TaxiRunID: Integer; const case_HappenTime: WideString;
                                         const case_HappenAddr: WideString; const Accuse_Reason: WideString;
                                         const passengerName: WideString; const PassengerTelNum: WideString;
                                         const PassengerMemo: WideString; const RecordId: Integer;
                                         const driver_id: Integer): Integer;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
      try

        Result := Web.AddNewAccuseDriver_driverId(Accuse_Type, Accuse_carno, TaxiRunID,
                                         case_HappenTime, case_HappenAddr, Accuse_Reason,
                                         passengerName, PassengerTelNum, PassengerMemo,
                                         RecordId, driver_id);
      except
        on E: Exception do
        begin
          raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;


function TBusinessSevercom.ModifyAAccuseDriver_BaseInfo(const Accuse_Id: Integer; const Accuse_Type: Integer;
                                           const Accuse_carno: WideString; const TaxiRunID: Integer;
                                           const case_HappenTime: WideString; const case_HappenAddr: WideString;
                                           const Accuse_Reason: WideString; const passengerName: WideString;
                                           const PassengerTelNum: WideString; const PassengerMemo: WideString;
                                           const RecordId: Integer; const DealState: Integer): Integer;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
      try

        Result := Web.ModifyAAccuseDriver_BaseInfo(Accuse_Id, Accuse_Type, Accuse_carno, TaxiRunID,
                                                   case_HappenTime, case_HappenAddr, Accuse_Reason,
                                                   passengerName, PassengerTelNum, PassengerMemo,
                                                   RecordId, DealState);
      except
        on E: Exception do
        begin
          raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.ModifyAAccuseDriver_Deal(const Accuse_Id: Integer; const DealState: Integer;
                                       const DealContent: WideString; const DealDepartment: WideString;
                                       const DealMan: WideString; const DealManTel: WideString;
                                       const DealTime: WideString): Integer;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
      try

        Result := Web.ModifyAAccuseDriver_Deal(Accuse_Id, DealState, DealContent, DealDepartment,
                                               DealMan, DealManTel, DealTime);
      except
        on E: Exception do
        begin
          raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.ModifyAAccuseDriver_Check(const Accuse_Id: Integer;
                                                     const DealState: Integer;
                                                     const Check_Result: WideString;
                                                     const Check_man: WideString;
                                                     const Check_Idea: WideString): Integer;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
      try

        Result := Web.ModifyAAccuseDriver_Check(Accuse_Id, DealState, Check_Result, Check_man, Check_Idea);
      except
        on E: Exception do
        begin
          raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.ModifyAMessage_Answer2(const msg_id: Integer; const msg_state: Integer; const msg_repTime: WideString;
                                const msg_driverAnswer_Id: Integer; const msg_driverAnswer_Str: WideString): WideString;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
      try

        Result := Web.ModifyAMessage_Answer2(msg_id, msg_state, msg_repTime, msg_driverAnswer_Id, msg_driverAnswer_Str);
      except
        on E: Exception do
        begin
          raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;


function TBusinessSevercom.ModifyAAccuseDriver_DealState(const Accuse_Id: Integer; const DealState: Integer): Integer;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
      try

        Result := Web.ModifyAAccuseDriver_DealState(Accuse_Id, DealState);
      except
        on E: Exception do
        begin
          raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.DelAAccuseDriver(const Accuse_Id: Integer): Integer;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
      try

        Result := Web.DelAAccuseDriver(Accuse_Id);
      except
        on E: Exception do
        begin
          raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.Query_AccuseDriver(const DealState: Integer; const fromtime: WideString; const totime: WideString): WideString;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
      try

        Result := Web.Query_AccuseDriver(DealState, fromtime, totime);
      except
        on E: Exception do
        begin
          raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.Tj_ICCardTradeDataList(const fromtime: WideString; const totime: WideString;
                                 const dev_Id: Integer; const fact_Id: Integer;
                                 const group_Id: Integer; const group_IdList: WideString): WideString;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
      try
//        Result := Web.Tj_ICCardTradeDataList(fromtime, totime, dev_Id, fact_Id, group_Id, group_IdList);
      except
        on E: Exception do
        begin
          raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.ModifyDev_EventList(const dev_id: string; const Event_IdList: WideString): Boolean;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
      try

        if Web.ModifyDev_EventList(dev_id, Event_IdList) = 'OK' then
          Result := True;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.ModifyDev_AmbientInfoMenuList(const fact_id: Integer; const dev_id: string; const Menu_IdList: WideString): Boolean;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try

//      if Web.ModifyDev_AmbientInfoMenuList(fact_id, dev_id, Menu_IdList) = 'OK' then
//        Result := True;
    except
      on E: Exception do
      begin
        messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.ModifyDev_InfoDemandMenuList(const fact_id: Integer; const dev_id: string;
                                                        const Menu_IdList: WideString): Boolean;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
//      if Web.ModifyDev_InfoDemandMenuList(fact_id, dev_id, Menu_IdList) = 'OK' then
//        Result := True;
    except
      on E: Exception do
      begin
        messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.ModifyDev_TelList(const dev_id: string; const tel_IdList: WideString): Boolean;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  Result := False;
  try
    try
      if Web.ModifyDev_TelList(dev_id, tel_IdList) = 'OK' then
        Result := True;
    except
      on E: Exception do
      begin
        messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.DeleteDevTelList(const ADevIDStr: string): Boolean;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  i: integer;
  PTel: PTelInfo;
begin
  Result := false;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;

  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        infoServer.DeleteDevDisplayTels(ADevIDStr);
        Result := True;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.DeleteDevEventList_AEventInfo(AEventId: integer): Boolean;
var
  saveCursor: TCursor;
begin
  Result := false;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try

      try
        if Web.DeleteAEvent(AEventId) = 'OK' then
          Result := True;
      except
        on E: Exception do
        begin
          raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.DeleteAAmbientInfoMenu(const AmbientMenu_Id: Integer): Boolean;
var
  saveCursor: TCursor;
begin
  Result := false;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
      if Web.DeleteAAmbientInfoMenu(AmbientMenu_Id) = 'OK' then
        Result := True;
    except
      on E: Exception do
      begin
        messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.DeleteAInfoDemandMenu(const Menu_Id: Integer): Boolean;
var
  saveCursor: TCursor;
begin
  Result := false;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
      if Web.DeleteAInfoDemandMenu(Menu_Id) = 'OK' then
        Result := True;
    except
      on E: Exception do
      begin
        messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.DeleteDevTelList_ATelInfo(ATelId: integer): Boolean;
var
  saveCursor: TCursor;
begin
  Result := false;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try

      try
        if Web.DeleteATel(ATelId) = 'OK' then
        Result := True;
      except
        on E: Exception do
        begin
          raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryDevsMenu: Boolean;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  i: integer;
  Dev: TDevice;
  PMenu: PDisplayMenu;
begin
  Result := false;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QueryDisplayMenuList;
        if not check_return(info) then Exit; // 记录集为空
        FTemp.Close;
        FTemp.Data := info;
        FTemp.First;
        for i := 0 to FTemp.RecordCount - 1 do
        begin
          Dev := ADeviceManage.find(FTemp.FieldByName('Dev_ID').AsString);
          if Dev = nil then
          begin
            FTemp.Next;
            continue;
          end;
          PMenu := Dev.AddDisplayMenu(FTemp.FieldValues['DISPLAYMENU_ID']);
          PMenu^.Name := trim(FTemp.FieldValues['DISPLAYMENU_NAME']);
          PMenu^.ParentID := FTemp.FieldValues['DISPLAYMENU_PARENT'];
          if FTemp.FieldValues['LEAF_NOD'] = 1 then PMenu^.IsLeafNode := True
          else PMenu^.IsLeafNode := false;
          FTemp.Next;
        end;
        Result := True;
      except
        on E: Exception do
        begin
          raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.AddDevMenu(Adev: TDevice; PMenu: PDisplayMenu): integer;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  isLeapNode: byte;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        if PMenu^.IsLeafNode then isLeapNode := 1 else isLeapNode := 0;
        infoServer.AddNewDisplayMenu(PMenu^.id, PMenu^.ParentID, isLeapNode, Adev.IdStr, PMenu^.Name);

        if not check_return(info) then Exit;
        Result := info;
      except
        on E: Exception do
        begin
          raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;




function TBusinessSevercom.UpdateDevMenu(Adev: TDevice): Boolean;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  i: integer;
  PTel: PTelInfo;
begin
  Result := false;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;

  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        infoServer.DeleteDevDisplayMenus(Adev.IdStr);
        for i := 0 to Adev.DisplayMenuList.Count - 1 do
        begin
          AddDevMenu(Adev, Adev.DisPlayMenuItems[i]);
        end;
        Result := True;
      except
        on E: Exception do
        begin
          raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryCancelReason: Boolean;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
//  i: integer;
//  CancelOrderMenu: PCancelOrderMenu;
begin
  Result := false;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
      info := infoServer.QueryCancelReason;
      if not check_return(info) then Exit; // 记录集为空
      FCancelMenuData.Data := info;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryCancelMenu(): Boolean;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
//  i: integer;
  CancelOrderMenu: PCancelOrderMenu;
begin
  Result := false;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QueryCancelMenu;
        if not check_return(info) then Exit; // 记录集为空
        FTemp.Data := info;
      except
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryCancelMenu_zb: Boolean;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  i: integer;
begin
  Result := false;
  QueryCancelReason;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QueryCancelMenu_zb;
        if not check_return(info) then Exit; // 记录集为空
        FTemp.Data := info;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
      for i := 0 to ADeviceManage.Count - 1 do
      begin
        QueryCancelMenuByDev_zb(ADeviceManage.Items[i], FCancelMenuData);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;


function TBusinessSevercom.QueryCancelMenuByDev(Dev: TDevice): Boolean;
var
  saveCursor: TCursor;
  i: integer;
  CancelOrderMenu: PCancelOrderMenu;
  filterStr: string;
begin
  Result := false;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
      with FTemp do
      begin
        Filtered := false;
        filterStr := 'dev_id=''' + Dev.IdStr + '''';
        Filter := filterStr;
        Filtered := True;
      end;
      FTemp.First;
      Dev.ClearCancelOrderMenuList;
      for i := 0 to FTemp.RecordCount - 1 do
      begin
        CancelOrderMenu := Dev.AddCancelOrderMenu(FTemp.FieldByName('menuID').AsInteger);
        CancelOrderMenu.Name := FTemp.FieldByName('reason').AsString;
        FTemp.Next;
      end;
      Result := True;
    except
      on E: Exception do
      begin
        messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    FTemp.Filtered := false;
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryCancelMenuByDev_zb(Dev: TDevice; ADateSet: Tclientdataset): Boolean;
var
  saveCursor: TCursor;
  i: integer;
  PpCancelOrderMenu: PCancelOrderMenu;
  filterStr: string;
begin
  Result := false;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
      with FTemp do
      begin
        Filtered := false;
        filterStr := 'dev_id=''' + Dev.IdStr + '''';
        Filter := filterStr;
        Filtered := True;
      end;

      FTemp.First;
      Dev.ClearCancelOrderMenuList;
      for i := 0 to FTemp.RecordCount - 1 do
      begin
        PpCancelOrderMenu := Dev.AddCancelOrderMenu(FTemp.FieldByName('menuID').AsInteger);
        with ADateSet do
        begin
          Filtered := false;
          filterStr := 'ID=' + IntToStr(FTemp.FieldByName('menuID').AsInteger);
          Filter := filterStr;
          Filtered := True;
        end;
        if ADateSet.RecordCount > 0 then
          PpCancelOrderMenu^.Name := ADateSet.FieldByName('reason').AsString
        else
          PpCancelOrderMenu^.Name := 'ID=' + IntToStr(PpCancelOrderMenu^.id);
        FTemp.Next;
      end;


      Result := True;
    except
      on E: Exception do
      begin
        messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    FTemp.Filtered := false;
    ADateSet.Filtered := false;
    Screen.Cursor := saveCursor;
  end;
end;

//function TBusinessSevercom.updateOrderDriver(const orderId,
//  driverId: Integer): string;
//var
//  saveCursor: TCursor;
//begin
//  Result := 'FAIL';
//  saveCursor := Screen.Cursor;
//  Screen.Cursor := crHourGlass;
//  try
//    try
//      Result := Web.ModifyAOrder_Driver(orderId, driverId);
//    except
//      on E: Exception do
//      begin
//        raise Exception.Create('无法连接业务服务器！ '); //MessageBox(0, PChar(E.Message), '提示', MB_OK + MB_ICONINFORMATION);
//      end;
//    end;
//  finally
//    Screen.Cursor := saveCursor;
//  end;
//end;

function TBusinessSevercom.Change_DriverOrPassenger_Integral(const chgType,
  Driver_id, Passenger_Id, chgValue: Integer; const chgReason, DealMan,
  memo: string): string;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
      try
        Result := Web.Change_DriverOrPassenger_Integral(chgType, Driver_id, Passenger_Id, chgValue, chgReason, DealMan, memo);
      except
        on E: Exception do
        begin
          raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.Query_DriverIntegralChg(const fromtime,
  totime: WideString; const driver_id, group_id: Integer;
  const group_IdList: WideString): WideString;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
      try
        Result := Web.Query_DriverIntegralChg( fromtime, totime, driver_id, group_Id, group_IdList);
      except
        on E: Exception do
        begin
          raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.Query_Driver_IntegralSort(
  const group_Id: Integer; const group_IdList: WideString): WideString;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
      try
        Result := Web.Query_Driver_IntegralSort(group_Id, group_IdList);
      except
        on E: Exception do
        begin
          raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryPassengerByPhone(
  const phone: WideString): string;
var
  saveCursor: TCursor;
begin
  Result := '';
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
      Result := Web.Query_PassengerInfo_Condition(phone);
    except
      on E: Exception do
      begin
        raise Exception.Create('无法连接业务服务器！ ');//messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryDriverWithCond(const groupId,
  driverId: Integer): string;
var
  saveCursor: TCursor;
begin
  Result := '';
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try

      Result := Web.Query_DriverList_Condition(driverId, groupId);
    except
      on E: Exception do
      begin
        raise Exception.Create('无法连接业务服务器！ ');//messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.SetPassengerInBlacklist(const Passenger_Id,
  isBlack: Integer): Integer;
var
  saveCursor: TCursor;
begin
  Result := -1;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
      Result := Web.ModifyAPassenger_Black(Passenger_Id, isBlack);
    except
      on E: Exception do
      begin
        raise Exception.Create('无法连接业务服务器！ ');//messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.SetDriverInBlacklist(const Driver_Id,
  isBlack: Integer): Integer;
var
  saveCursor: TCursor;
begin
  Result := -1;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try

      Result := Web.ModifyADriver_Black(Driver_Id, isBlack);
    except
      on E: Exception do
      begin
        raise Exception.Create('无法连接业务服务器！ ');//messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.GetDatetime: TDatetime;
var
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        Result := infoServer.Gettime;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.GetMsgContent(MsgID: integer): string;
var
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  info: oleVariant;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QueryMessage(MsgID);
        if not check_return(info) then Result := '' else Result := info;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;


function TBusinessSevercom.CarNoInfo(ACarNOManage: TCarNOManage): Boolean;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  i: integer;
  dlg: TFrmRefreshProgress;
begin
  Result := false;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QueryAllDev;
        if not check_return(info) then Exit; // 记录集为空

        FTemp.Data := info;
        FTemp.First;
        if FTemp.RecordCount <= 2000 then
        begin
          for i := 0 to FTemp.RecordCount - 1 do
          begin
            ACarNOManage.AddNewCar(FTemp.FieldByName('Dev_ID').AsInteger {StrToInt64(RightStr(FTemp.fieldbyname('Dev_ID').AsString,10))}, FTemp.FieldByName('Car_No').AsString);
            FTemp.Next;
          end;
        end
        else
        begin
//-----------------------------------------------------------------
          dlg := TFrmRefreshProgress.Create(nil);
          try
            dlg.Gauge1.MaxValue := FTemp.RecordCount;
            dlg.Gauge1.Progress := 0;
            dlg.Label1.Visible := false;
            dlg.Height := 40;
            dlg.Panel1.Align := alClient;
            dlg.Caption := '处理车牌号信息中...';
            dlg.Show;
            for i := 0 to FTemp.RecordCount - 1 do
            begin
              ACarNOManage.AddNewCar(FTemp.FieldByName('Dev_ID').AsInteger {StrToInt64(RightStr(FTemp.fieldbyname('Dev_ID').AsString,10))}, FTemp.FieldByName('Car_No').AsString);
              FTemp.Next;
              dlg.Gauge1.AddProgress(1);
            end;
          finally
            dlg.Free;
          end;
//---------------------------------------------------------------
        end;
        Result := True;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryDriverOnOffDuty(const DriverNo: WideString;
  start_Time, end_Time: TDateTime;
  const DevId: WideString;group_id:Integer): TClientDataSet;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  Result := nil;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QueryDriverTimes(DriverNo, start_Time, end_Time, DevId,group_id);
        if not check_return(info) then Exit; // 记录集为空
        FTemp.Data := info;
        Result := FTemp;
      except
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;




procedure TBusinessSevercom.DelCancelOrderReason_Zb(
  const ADevID: WideString);
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  //i: integer;
  //PTel: PTelInfo;
begin
  //Result := false;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;

  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        infoServer.DelCancelOrderReason_Zb(ADevID);
        //Result := True;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.AddCancelOrderReason_Zb(AMenuID: Integer;
  const ADevID: WideString): Integer;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  //i: integer;
  //PTel: PTelInfo;
begin
  Result := -1;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        Result := infoServer.AddCancelOrderReason_Zb(AMenuID, ADevID);
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryPhotoByDevAndPicIndex(ADev: TDevice;
  APicIndex: Integer): string;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  byteArr: TByteDynArray;
  fileName: string;
  fs: TFileStream;

begin
  Result := '';
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
//        info := infoServer.QueryPhotoByDevAndPicIndex(ADev.id, APicIndex);
        if not check_return(info) then Exit; // 记录集为空
        byteArr := info;
        filename := ExePath + 'Photo\' + ADev.Car.No;
        if not DirectoryExists(fileName) then
          if not CreateDir(fileName) then
            raise Exception.Create('不能创建' + fileName + '目录');
        fileName := fileName + '\' + ADev.Car.No + '_' + FormatDatetime('yymmddhhnnss', PMyPhoto(@byteArr[0])^.GpsTime);//takeBeginTime
          //fileName:=fileName+'_'+IntToHex(PMyPhoto(@byteArr[0])^.PhotoMeasure,1);
        fileName := fileName + '_' + IntToHex(PMyPhoto(@byteArr[0])^.PhotoReasonID, 1);
        fileName := fileName + '_' + IntToHex(PMyPhoto(@byteArr[0])^.CameraIndex, 1);
        fileName := fileName + '_' + IntToStr(APicIndex);
        if PMyPhoto(@byteArr[0])^.PhotoType = 0 then
        begin
          fileName := fileName + '.jpg';
        end;
        fs := TFileStream.Create(FileName, fmCreate or fmShareDenyWrite);
        try
          fs.Position := 0; //fs.Size;
          fs.Write(byteArr[SizeOf(TMyPhoto)], PMyPhoto(@byteArr[0])^.PhotoSize);
        finally
          fs.Free;
        end;
        Result := fileName;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryPhoteByPicIndex(APicIndex: Integer): PicInfo;
var
  saveCursor: TCursor;
begin
  //saveCursor := Screen.Cursor;
  //Screen.Cursor := crHourGlass;
  try
      try
        Result := Web.QueryAPic(APicIndex) ; // infoServer.QueryDisplayTelList;
      except
        on E: Exception do
        begin
          raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
  finally
    //Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryPhotosByDevID(ADevID: string; ABeginTime, AEndTime: TDateTime): Tclientdataset;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  Result := nil;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
//        info := infoServer.QueryPhotosByDevID(ADevID, ABeginTime, AEndTime);
        if not check_return(info) then Exit; // 记录集为空
        FTemp.Data := info;
        FTemp.First;
        Result := FTemp;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;



function TBusinessSevercom.AddBsByDev(bsId: Integer;
  const DevId: WideString): integer;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  //i: integer;
  //PTel: PTelInfo;
begin
  Result := -1;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        Result := infoServer.AddBsByDev(bsId, DevId);
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;



function TBusinessSevercom.AddNewAdInfo(const adMemo: WideString;
  beginTime, endTime: TDateTime; const CustomerName, linkName, tel,
  Memo: WideString): integer;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  //i: integer;
  //PTel: PTelInfo;
begin
  Result := -1;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        Result := infoServer.AddNewAdInfo(adMemo, beginTime, endTime, CustomerName, linkName, tel, Memo);
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;



function TBusinessSevercom.AddNewBeforeScreen(const bsMemo: WideString): integer;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  //i: integer;
  //PTel: PTelInfo;
begin
  Result := -1;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        Result := infoServer.AddNewBeforeScreen(bsMemo);
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;



function TBusinessSevercom.AddNewDevAd(const DevID: WideString;
  AdId: Integer): OleVariant;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  //i: integer;
  //PTel: PTelInfo;
begin
  Result := -1;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        Result := infoServer.AddNewDevAd(DevID, AdID);
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

procedure TBusinessSevercom.DeleteAdInfo(AId: Integer);
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  //i: integer;
  //PTel: PTelInfo;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        infoServer.DeleteAdInfo(AID);
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;



procedure TBusinessSevercom.DeleteBeforeScreen(AId: Integer);
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  //i: integer;
  //PTel: PTelInfo;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        infoServer.DeleteBeforeScreen(AID);
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;


procedure TBusinessSevercom.DeleteBsByDev(ABsId: Integer;
  const ADevId: WideString);
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  //i: integer;
  //PTel: PTelInfo;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        infoServer.DeleteBsByDev(ABsId, ADevId);
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;




procedure TBusinessSevercom.ModifyAdInfo(AId: Integer;
  const adMemo: WideString; beginTime, endTime: TDateTime;
  const CustomerName, linkName, tel, Memo: WideString);
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  //i: integer;
  //PTel: PTelInfo;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        infoServer.ModifyAdInfo(AId, adMemo, beginTime, endTime, CustomerName, linkName, tel, Memo);
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;



procedure TBusinessSevercom.ModifyBeforeScreen(AID: Integer;
  const bfMemo: WideString);
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  //i: integer;
  //PTel: PTelInfo;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        infoServer.ModifyBeforeScreen(AID, bfMemo);
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryAdByGroupId(AGroupID: Integer): OleVariant;
begin

end;



function TBusinessSevercom.QueryAdInfo: Tclientdataset;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  Result := nil;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QueryAdInfo;
        if not check_return(info) then Exit; // 记录集为空
        FTemp.Data := info;
        FTemp.First;
        Result := FTemp;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;



function TBusinessSevercom.QueryAdInfoOverTime(ADays: Integer): Tclientdataset;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  Result := nil;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QueryAdInfoOverTime(ADays);
        if not check_return(info) then Exit; // 记录集为空
        FTemp.Data := info;
        FTemp.First;
        Result := FTemp;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;



function TBusinessSevercom.QueryBeforeScreen: Tclientdataset;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  Result := nil;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QueryBeforeScreen;
        if not check_return(info) then Exit; // 记录集为空
        FTemp.Data := info;
        FTemp.First;
        Result := FTemp;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;




function TBusinessSevercom.QueryBsByDev(
  const ADevId: WideString): Tclientdataset;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  Result := nil;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QueryBsByDev(ADevId);
        if not check_return(info) then Exit; // 记录集为空
        FTemp.Data := info;
        FTemp.First;
        Result := FTemp;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;



procedure TBusinessSevercom.DeleteADByDev(const DevID: WideString);
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  //i: integer;
  //PTel: PTelInfo;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        infoServer.DeleteADByDev(DevID);
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;




procedure TBusinessSevercom.DeleteAdByDevIdADID(const DevID: WideString;
  AId: Integer);
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  //i: integer;
  //PTel: PTelInfo;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        infoServer.DeleteAdByDevIdADID(DevID, AId);
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryADByDevId(
  const ADevId: WideString): Tclientdataset;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  Result := nil;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QueryADByDevId(ADevId);
        if not check_return(info) then Exit; // 记录集为空
        FTemp.Data := info;
        FTemp.First;
        Result := FTemp;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryDevByADId(ADID: Integer): Tclientdataset;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  Result := nil;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QueryDevByADId(ADID);
        if not check_return(info) then Exit; // 记录集为空
        FTemp.Data := info;
        FTemp.First;
        Result := FTemp;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.AddNewArea(AreaNo: Integer;
  const AreaName: WideString; AreaType, AreaPointCnt,
  OverSpeed: Integer): integer;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  Result := -1;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.AddNewArea(AreaNo, AreaName, AreaType, AreaPointCnt, OverSpeed);

        Result := info;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.AddNewAreaInfo(AreaID, X,
  Y: Integer): integer;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  Result := -1;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.AddNewAreaInfo(AreaID, X, Y);

        Result := info;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.AddNewDevAreas(const DevID: WideString;
  AreaID: Integer): integer;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  Result := -1;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.AddNewDevAreas(DevID, AreaID);

        Result := info;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

procedure TBusinessSevercom.DeleteArea(AreaID: Integer);
begin

end;

procedure TBusinessSevercom.DeleteAreaInfo(AAreaID: Integer);
begin

end;

procedure TBusinessSevercom.DeleteDevAreas(const DevID: WideString;
  AreaID: Integer);
begin

end;

function TBusinessSevercom.QuerAreaList: OleVariant;
begin

end;

function TBusinessSevercom.QueryAreaInfo(AAreaID: Integer): OleVariant;
begin

end;

function TBusinessSevercom.QueryDevAreas(AAreaID: Integer): OleVariant;
begin

end;

function TBusinessSevercom.QueryOverSpeedInfo(const beginTime, endTime,
  DevIdStr: WideString;AGroupId:Integer=-1;GroupParentStr:string=''): Tclientdataset;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  Result := nil;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QueryOverSpeedInfo1(beginTime, endTime, DevIdStr,AGroupId,GroupParentStr);
        if not check_return(info) then Exit; // 记录集为空
        FTemp.Data := info;
        Result := FTemp;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryStopInfo(AStopId: Integer): Tclientdataset;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  Result := nil;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QueryStopInfo(AStopId);
        if not check_return(info) then Exit; // 记录集为空
        FTemp.Data := info;
        Result := FTemp;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;




function TBusinessSevercom.QueryStopTime(const DevIDStr, beginTime,
  endTime: WideString): Tclientdataset;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  Result := nil;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QueryStopTime(DevIDStr, beginTime, endTime);
        if not check_return(info) then Exit; // 记录集为空
        FTemp.Data := info;
        Result := FTemp;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryRunDataCount(const aCarNO: string;
  AFormDate, AToDate: string): integer;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        Result := infoServer.QueryRunDataCount(aCarNO, AFormDate, AToDate);
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryRunData(const aCarNO, AFromDate,
  AToDate: WideString; AStartIndex, AGetCount: integer;
  out ARunData: oleVariant): oleVariant;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  t: oleVariant;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        Result := infoServer.QueryRunData(aCarNO, AFromDate, AToDate, AStartIndex, AGetCount, t);
        if Result > 0 then
          ARunData := t
        else
          ARunData := null;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryRunDataCount_Cs(fromtime: WideString; totime: WideString;
                                                fact_Id: Integer; dev_Id: string; group_id: Integer;
                                                group_IdList: WideString): integer;
var
  info: oleVariant;
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try

    try
//      Result := web.Query_TaxiRunDataCount(fromtime, totime, fact_Id, dev_Id, group_id,
//                                    group_IdList);
    except
     on E: Exception do
      begin
        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;

  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryRunData_Cs(fromtime: WideString; totime: WideString;
                                PageSize: Integer; CurrPageIndex: Integer;
                                fact_Id: Integer; dev_Id: string; group_id: Integer;
                                group_IdList: WideString): oleVariant;
var
  info: oleVariant;
  saveCursor: TCursor;
  t: oleVariant;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
//      Result := Web.Query_TaxiRunData(fromtime, totime,
//                                PageSize, CurrPageIndex,
//                                fact_Id, dev_Id, group_id,
//                                group_IdList);
    except
      on E: Exception do
      begin
        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryServeJudgeByDRunData(const fact_Id: Integer; const dev_Id: string;
                                    const onTime: WideString; const offTime: WideString): WideString;
var
  info: oleVariant;
  saveCursor: TCursor;
  t: oleVariant;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
//      Result := Web.QueryServeJudgeByDRunData(fact_Id, dev_Id, onTime, offTime);
    except
      on E: Exception do
      begin
        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryPicsByTime(const fact_Id: Integer; const dev_Id: string; const onTime: WideString;
                                const offTime: WideString): ArrayOfPicInfo;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
      Result := Web.QueryPicsByTime(dev_Id, onTime, offTime);
      //Result := Web.QueryPicsByTime(fact_Id, dev_Id, onTime, offTime);
    except
      Result := nil;
      //on E: Exception do
      //begin
      //  messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      //end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryPicsByPhotoIDs(const PhotoIDs: WideString): ArrayOfPicInfo;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
      Result := Web.QueryPicsByPhotoIDs(PhotoIDs);
    except
      Result := nil;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.Query_ServeJudge(fromtime: WideString; totime: WideString; fact_Id: Integer;
                          dev_Id: string;  group_Id: Integer; group_IdList: WideString): WideString;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
//      Result := Web.Query_ServeJudge(fromtime, totime,
//                                fact_Id, dev_Id, group_id,
//                                group_IdList);
    except
      on E: Exception do
      begin
        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function  TBusinessSevercom.Tj_CarMoneyMonth(const yf: WideString; const fact_id: Integer;
                               const dev_Id: Integer; const group_id: Integer;
                               const group_IdList: WideString): WideString;
var
  info: oleVariant;
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
//      info := web.Tj_CarMoneyMonth(yf, fact_id, dev_Id, group_id, group_IdList);
      Result := info;
    except
      on E: Exception do
      begin
        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

//function TBusinessSevercom.Tj_CarMoneyDay(const fromtime: WideString; const totime: WideString;
//                                          const group_id: Integer; const group_IdList: WideString): WideString;
//var
//  info: oleVariant;
//  saveCursor: TCursor;
//begin
//  saveCursor := Screen.Cursor;
//  Screen.Cursor := crHourGlass;
//  try
//    try
//      info := web.Tj_CarMoneyDay(fromtime, totime, group_id, group_IdList);
//      Result := info;
//    except
//      on E: Exception do
//      begin
//        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
//      end;
//    end;
//  finally
//    Screen.Cursor := saveCursor;
//  end;
//end;

//function TBusinessSevercom.Tj_CarRunDataByTimes(const fromtime: WideString; const totime: WideString;
//                                   const group_id: Integer; const group_IdList: WideString): WideString;
//var
//  info: oleVariant;
//  saveCursor: TCursor;
//begin
//  saveCursor := Screen.Cursor;
//  Screen.Cursor := crHourGlass;
//  try
//    try
//      info := web.Tj_CarRunDataByTimes(fromtime, totime, group_id, group_IdList);
//      Result := info;
//    except
//      on E: Exception do
//      begin
//        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
//      end;
//    end;
//  finally
//    Screen.Cursor := saveCursor;
//  end;
//end;

//function TBusinessSevercom.Tj_AllCarADayRunData(const yf: WideString; const group_id: Integer;
//                                                const group_IdList: WideString): WideString;
//var
//  info: oleVariant;
//  saveCursor: TCursor;
//begin
//  saveCursor := Screen.Cursor;
//  Screen.Cursor := crHourGlass;
//  try
//    try
//      info := web.Tj_AllCarADayRunData(yf, group_id, group_IdList);
//      Result := info;
//    except
//      on E: Exception do
//      begin
//        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
//      end;
//    end;
//  finally
//    Screen.Cursor := saveCursor;
//  end;
//end;

function TBusinessSevercom.TaxiMetaMoneryMonthTj(const Car_No,
  M: WideString; group_ID: Integer): OleVariant;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  //ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    //if FSocket.Connected then
    //begin
      try
        //infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.TaxiMetaMoneryMonthTj(Car_No, M, group_ID);
        //if not check_return(info) then Exit;
        Result := info;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    //end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryDevHourDis(const carNo, fromDate,
  toDate: WideString; groupId: Integer): OleVariant;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QueryGpsHourDis(carNo, fromDate, toDate, groupId);
        if not check_return(info) then Exit;
        Result := info;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.StatTaxRunDataByMonth(const fromDate,
  toDate: WideString; groupId: Integer): OleVariant;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.StatTaxiRunDataByMonth(fromDate, toDate, groupId);
        if not check_return(info) then Exit;
        Result := info;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.StatTaxRunDataByDay(const FromDate,
  ToDate: WideString; group_id: Integer): OleVariant;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.StatTaxRunDataByDay(fromDate, toDate, group_id);
        if not check_return(info) then Exit;
        Result := info;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.TaxiMetaMoneryMonthTjChat(const M: WideString; group_ID: Integer): OleVariant;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.TaxiMetaMoneryMonthTjChat(M, group_ID);
        if not check_return(info) then Exit;
        Result := info;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.StatTaxRunDataByDayChat(const FromDate,
  ToDate: WideString; group_id: Integer): OleVariant;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.statRunDataMoneryByDayChat(fromDate, toDate, group_id);
        if not check_return(info) then Exit;
        Result := info;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryTaxiTj(const ARq: WideString;
  AGroupID: Integer): OleVariant;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QueryTaxiTj(ARq, AGroupID);
        if not check_return(info) then Exit;
        Result := info;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryDevPostion(fact_id: Integer; dev_Id: String;
                                           beginTime: WideString; endTime: WideString;
                                           beginLat: Integer; beginLong: Integer;
                                           endLat: Integer; endLong: Integer): Tclientdataset;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  Result := nil;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
      info := web.QueryDevPostion(dev_Id, beginTime, endTime, beginLat, beginLong, endLat, endLong);
      if not check_return(info) then
      begin
        Exit;
      end;  
      FTemp.XMLData := info;
      Result := FTemp;
    except
      on E: Exception do
      begin
        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryDevPostion_quickly(DevIdList: string; beginTime: WideString; endTime: WideString;
                                     beginLat: Integer; beginLong: Integer;
                                     endLat: Integer; endLong: Integer): TClientDataSet;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  Result := nil;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
      info := web.QueryDevPostion_quickly(DevIdList, beginTime, endTime,
                                          beginLat/1000000, beginLong/1000000,
                                          endLat/1000000, endLong/1000000);
      FTemp.XMLData := info;
      Result := FTemp;
    except
      on E: Exception do
      begin
        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.SetDevOil(ADevID: WideString;
  oil: double): Boolean;
var
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  Result := false;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        infoServer.SetDevOil(ADevID, oil);
        Result := True;
      except on E: Exception do
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryDevOil(ADevId: wideString): double;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  Result := 0;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QueryDevOil(ADevId);
        Result := info;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;

end;
//==================================================新版本LED

function TBusinessSevercom.AddLedDev(LedID: Integer;
  const DevID: WideString; LedNo: Integer): OleVariant;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  //i: integer;
  //PTel: PTelInfo;
begin
  Result := -1;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        Result := infoServer.AddLedDev(LedID, DevID, LedNo);
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

procedure TBusinessSevercom.DeleteLedAd(AId: Integer);

var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;

  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        infoServer.DeleteLedAd(AId);
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

procedure TBusinessSevercom.DeleteLedDev(LedID: Integer;
  const DevID: WideString; LedNo: Integer);
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        infoServer.DeleteLedDev(LedID, DevID, LedNo);
        //Result := True;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryLedAd(ledId: Integer): Tclientdataset;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  i: integer;
begin
  Result := nil;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QueryLedAd(ledId);
        if not check_return(info) then Exit; // 记录集为空
        FTemp.Data := info;
        FTemp.First;
        Result := FTemp;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryAdByID(LedID: Integer;
  const DevID: WideString): Tclientdataset;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  CancelOrderMenu: PCancelOrderMenu;

begin
  Result := nil;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QueryAdByID(LedID, DevID);
        if not check_return(info) then Exit; // 记录集为空
        FTemp.Data := info;
        FTemp.First;
        Result := FTemp;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

procedure TBusinessSevercom.ModifyLedAd(id: Integer;
  const DataType: WideString; DisSpeed: Integer; const InType, ExitType, X,
  Y: WideString; StopTime: Integer; const Font: WideString;
  IsDisTime: Integer; const Extend, LedMemo, RunTime, endTime, CusTerm,
  custermPer, custermTel, Memo: WideString);
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  //i: integer;
  //PTel: PTelInfo;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        infoServer.ModifyLedAd(id, DataType, DisSpeed, InType, ExitType, x, y, StopTime, Font, IsDisTime, Extend, LedMemo, RunTime, endTime, CusTerm, custermPer, custermTel,
          Memo);
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.AddNewLedAd(const DataType: WideString;
  DisSpeed: Integer; const InType, ExitType, X, Y: WideString;
  StopTime: Integer; const Font: WideString; IsDisTime: Integer;
  const Extend, LedMemo, RunTime, endTime, CusTerm, custermPer, custermTel,
  Memo: WideString): OleVariant;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  //i: integer;
  //PTel: PTelInfo;
begin
  Result := -1;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        Result := infoServer.AddNewLedAd(DataType, DisSpeed, InType, ExitType, x, y, StopTime, Font, IsDisTime, Extend, LedMemo, RunTime, endTime, CusTerm, custermPer, custermTel,
          Memo);
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;


function TBusinessSevercom.QuerryCarLadeInfo(ADevs: string; AFromTime,
  AToTime: TDateTime): TClientDataSet;
var
  info: OleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  i: Integer;
begin
  Result := nil;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QueryCarCarryed(ADevs, AFromTime, AToTime);
        if not check_return(info) then exit; // 记录集为空
        Result := TClientDataSet.Create(nil);
        Result.Data := info;
      except
        on E: exception do
        begin
          messagebox(0, pchar(e.Message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QuerryCarLadeStat(ADevAry: TStringDynArray;
  AFromTime, AToTime: TDateTime): OleVariant;
var
  info: OleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  i: Integer;
begin
  Result := varEmpty;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.CarryedStat(ADevAry, AFromTime, AToTime);
        if not check_return(info) then exit; // 记录集为空
        Result := info;
      except
        on E: exception do
        begin
          messagebox(0, pchar(e.Message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QuerryCarDumpageMx(ADevs: string; AFromTime,
  AToTime: TDateTime): TClientDataSet;
var
  info: OleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  i: Integer;
begin
  Result := nil;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QueryCarHitchList(ADevs, AFromTime, AToTime);
        if not check_return(info) then exit; // 记录集为空
        Result := TClientDataSet.Create(nil);
        Result.Data := info;
      except
        on E: exception do
        begin
          messagebox(0, pchar(e.Message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QuerryCarDumpageStat(ADevAry: TStringDynArray;
  AFromTime, AToTime: TDateTime): OleVariant;
var
  info: OleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  i: Integer;
begin
  Result := varEmpty;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.HitchStat(ADevAry, AFromTime, AToTime);
        if not check_return(info) then exit; // 记录集为空
        Result := info;
      except
        on E: exception do
        begin
          messagebox(0, pchar(e.Message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;

end;

function TBusinessSevercom.QueryOverSpeed(const carNo, AFromDate,
  AEndDate: WideString; AGroupId: Integer): OleVariant;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  Result := -1;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QueryOverSpeed(carNo, AFromDate, AEndDate, AGroupId);
        if not check_return(info) then Exit;
        Result := info;
      except on E: Exception do
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryOverSpeedSec(const carNo, AFromDate,
  AEndDate: WideString; AGroupId: Integer): OleVariant;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  Result := -1;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QueryOverSpeedSec(carNo, AFromDate, AEndDate, AGroupId);
        if not check_return(info) then Exit;
        Result := info;
      except on E: Exception do
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

procedure TBusinessSevercom.ModifyDriver(ADriverID: integer;
  const ADriverName, ADriverTel, ADriverAddr, ADriverCard: WideString;
  ADriverPhoto: OleVariant; ACarID, AGroupID: integer;
  const ADriverNo: WideString; ADriverKind: integer);
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  //ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    //if FSocket.Connected then
    //begin
      try
        //infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        //infoServer.ModifyDriver(ADriverID, ADriverName, ADriverTel, ADriverAddr, ADriverCard, ADriverPhoto, ACarID, AGroupID, ADriverNo, ADriverKind);
        //info := Web.ModifyADriver(ADriverID, ADriverName, ADriverTel, ADriverAddr, ADriverCard, ACarID, AGroupID, ADriverNo, ADriverKind);
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    //end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QuerryCarCarrayOffXslc(ADevs: string; AFromTime,
  AToTime: TDateTime; AMilType: Byte): OleVariant;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  Result := varEmpty;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QuerryCarCarrayOffXslc(ADevs, AFromTime, AToTime, AMIlType);
        if not check_return(info) then exit; // 记录集为空
        Result := info;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;

end;

function TBusinessSevercom.QuerryCarDayXslc(ADevs: string; AFromTime,
  AToTime: TDateTime): OleVariant;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  Result := varEmpty;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QuerryCarDayXslc(ADevs, AFromTime, AToTime);
        if not check_return(info) then exit; // 记录集为空
        Result := info;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;

end;

function TBusinessSevercom.QuerryCarMonthXslc(ADevs, Ayf: string): OleVariant;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  Result := varEmpty;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QuerryCarMonthXslc(ADevs, Ayf);
        if not check_return(info) then exit; // 记录集为空
        Result := info;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;


function TBusinessSevercom.AddNewArea_New(const AreaName: WideString;
  IsWarn, OverSpeed, IdlSpeed, AreaType, AreaParLen: Integer;
  const AreaPar: WideString;IsVisible:integer): integer;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  isLeapNode: byte;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  Result := -1;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        Result := infoServer.AddNewArea_New(AreaName, IsWarn, OverSpeed, IdlSpeed, AreaType, AreaParLen, AreaPar,IsVisible);
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.AddNewArea_new(const areaName: WideString; const AreaType: Integer;
                        const AreaNo: Integer; const AreaProperty: Integer;
                        const BeginTime: WideString; const EndTime: WideString;
                        const MaxSpeed: Integer; const overSpeedtime: Integer;
                        const AreaPointCnt: Integer; const AreaPoints_use: WideString;
                        const AreaPoints_ToMcu: WideString; const IsVisible: Integer):Integer;
var
  saveCursor: TCursor;
  isLeapNode: byte;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
      Result := web.AddNewArea(areaName, AreaType,  AreaNo, AreaProperty,
                        BeginTime, EndTime, MaxSpeed, overSpeedtime, AreaPointCnt,
                        AreaPoints_use, AreaPoints_ToMcu, IsVisible);
    except
      on E: Exception do
      begin
        messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.ModifyAArea(const AreaId: Integer; const areaName: WideString;
                          const AreaType: Integer; const AreaNo: Integer;
                          const AreaProperty: Integer; const BeginTime: WideString;
                          const EndTime: WideString; const MaxSpeed: Integer;
                          const overSpeedtime: Integer; const AreaPointCnt: Integer;
                          const AreaPoints_use: WideString; const AreaPoints_ToMcu: WideString;
                          const IsVisible: Integer): Boolean;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  Result := False;
  try
    try
      if web.ModifyAArea(AreaId, areaName, AreaType, AreaNo, AreaProperty,
                         BeginTime, EndTime, MaxSpeed, overSpeedtime,
                         AreaPointCnt, AreaPoints_use, AreaPoints_ToMcu, IsVisible) = 'OK' then
        Result := True;
    except
      on E: Exception do
      begin
        messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.ModifyDev_AreaList(const fact_Id: Integer; const dev_Id: string;
                                              const AreaIdList: WideString): Boolean;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  Result := False;
  try
    try
//      if web.ModifyDev_AreaList(fact_Id, dev_Id, AreaIdList) = 'OK' then
//        Result := True;
    except
      on E: Exception do
      begin
        messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.AddNewDev_Area( const dev_Id: string; const area_Id: Integer): Boolean;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  Result := False;
  try
    try
      if Web.AddNewDev_Area(dev_Id, area_Id) = 'OK' then
        Result := True;
    except
      on E: Exception do
      begin
        messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

procedure TBusinessSevercom.QueryArea_New;
  function getparam(AreaPar: string; parlen: integer): TWorldPointAry;
  var
    WPointsAry: TWorldPointAry;
    k: integer;
    down, zt: integer;
  begin
    setlength(WPointsAry, parlen);
    k := 0;
    while k < parlen do
    begin
      if k = parlen-1 then
      begin
        down := pos(',', AreaPar);
        zt := length(AreaPar);
        WPointsAry[k].X := strtoint(copy(AreaPar, 1, down - 1));
        WPointsAry[k].Y := strtoint(copy(AreaPar, down + 1, zt - down));
      end else
      begin
        down := pos(',', AreaPar);
        zt := length(AreaPar);
        WPointsAry[k].X := strtoint(copy(AreaPar, 1, down - 1));
        AreaPar := copy(AreaPar, down + 1, zt - down);
        down := pos(',', AreaPar);
        WPointsAry[k].Y := strtoint(copy(AreaPar, 1, down - 1));
        zt := length(AreaPar);
        AreaPar := copy(AreaPar, down + 1, zt - down);
      end;
      inc(k, 1);
    end;
    result:=WPointsAry;
  end;

  procedure getLineSectionInfo(var polyLineArea: TPolyLineArea; param: string);
    procedure addLineSection(var polyLineArea: TPolyLineArea; sLineSection: string);
    var
      lineSection: TLineSection;
      lineSectionId: Integer;
      lineSectionWidth: Integer;
      lineSectionProperty: Integer;
      lineSectionRunMaxTime: Integer;
      lineSectionRunMinTime: Integer;
      lineSectionMaxSpeed: Integer;
      lineSectionOverSpeedTime: Integer;
      pointCount: Integer;
      point: PWorldPoint;
      i, j: Integer;
      ss: string;
    begin
      ss := sLineSection;
      if (polyLineArea <> nil) and (ss <> '') then
      begin
        try
          i := Pos(',',  ss);
          lineSectionId := StrToInt(Copy(ss, 1, i - 1));
          ss := Copy(ss, i + 1, Length(ss) - i);
          i := Pos(',', ss);
          lineSectionWidth := StrToInt(Copy(ss, 1, i - 1));
          ss := Copy(ss, i + 1, Length(ss) - i);
          i := Pos(',', ss);
          lineSectionProperty := StrToInt(Copy(ss, 1, i - 1));
          ss := Copy(ss, i + 1, Length(ss) - i);
          i := Pos(',', ss);
          lineSectionRunMaxTime := StrToInt(Copy(ss, 1, i - 1));
          ss := Copy(ss, i + 1, Length(ss) - i);
          i := Pos(',', ss);
          lineSectionRunMinTime := StrToInt(Copy(ss, 1, i - 1));
          ss := Copy(ss, i + 1, Length(ss) - i);
          i := Pos(',', ss);
          lineSectionMaxSpeed := StrToInt(Copy(ss, 1, i - 1));
          ss := Copy(ss, i + 1, Length(ss) - i);
          i := Pos(',', ss);
          lineSectionOverSpeedTime := StrToInt(Copy(ss, 1, i - 1));
          ss := Copy(ss, i + 1, Length(ss) - i);
          i := Pos(',', ss);
          pointCount := StrToInt(Copy(ss, 1, i - 1));
          ss := Copy(ss, i + 1, Length(ss) - i);

          lineSection := polyLineArea.AddLineSection(lineSectionId);
          lineSection.LineSectionWidth := lineSectionWidth;
          lineSection.LineSectionProperty := lineSectionProperty;
          lineSection.LineSectionRunMaxTime := lineSectionRunMaxTime;
          lineSection.LineSectionRunMinTime := lineSectionRunMinTime;
          lineSection.LineSectionMaxSpeed := lineSectionMaxSpeed;
          lineSection.LineSectionOverSpeedTime := lineSectionOverSpeedTime;

          lineSection.SetWorldPointAryLength(pointCount);
          j := 0;
          while j < pointCount do
          begin
            if j = pointCount - 1 then
            begin
              i := Pos(',', ss);
              lineSection.WPointAry[j].X := StrToInt(Copy(ss, 1, i - 1));
              lineSection.WPointAry[j].Y := StrToInt(Copy(ss, i + 1, Length(ss) - i));
            end
            else
            begin
              i := Pos(',', ss);
              lineSection.WPointAry[j].X := StrToInt(Copy(ss, 1, i - 1));
              ss := Copy(ss, i + 1, Length(ss) - i);
              i := Pos(',', ss);
              lineSection.WPointAry[j].Y := StrToInt(Copy(ss, 1, i - 1));
              ss := Copy(ss, i + 1, Length(ss) - i);
            end;
            Inc(j);
          end;
        except
          
        end;
      end;
    end;  
  var
    i: Integer;
    sLineSections: string;//所有拐点项组成的字符串
    sLineSection: string;//一个拐点项祖册的字符串
  begin
    sLineSections := param;
    i := Pos(';', sLineSections);
    while i > 0 do
    begin
      sLineSection := Copy(sLineSections, 1, i - 1);
      addLineSection(polyLineArea, sLineSection);
      sLineSections := Copy(sLineSections, i + 1, Length(sLineSections) - i);
      i := Pos(';', sLineSections);
    end;
    if sLineSections <> '' then
    begin
      addLineSection(polyLineArea, sLineSections);
    end;  
  end;  
var
  CircleArea: TCircleArea;
  RectangleArea: TRectangleArea;
  NoSymbolArea: TNoSymbolArea;
  PolyLineArea: TPolyLineArea;

  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  i, j: integer;
  AreaID: integer;
  AreaName: string;
  IsWarn: integer;
  OverSpeed: integer;
  IdlSpeed: integer;
  AreaType: integer;
  AreaParLen: integer;
  AreaPar: string;
  down, zt: integer;
  Acircle: TEarthPoint;
  lastPoint:TEarthPoint;
  info1: oleVariant;
  left: TEarthPoint;
  right: TEarthPoint;
  devId: string;
  dev: TDevice;
  PointsCnt: integer;
  FTemp: TClientDataSet;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  FTemp := TClientDataSet.Create(nil);
  try
    try                             
      info := Web.Query_AreaList;
      FTemp.XMLData := info;
      FTemp.Open;
      FTemp.First;
      for i := 0 to FTemp.RecordCount - 1 do
      begin
        AreaType := FTemp.FieldByName('AreaType').AsInteger;
        //if (FTemp.FieldByName('BeginTime').AsDateTime <= now) and (FTemp.FieldByName('EndTime').AsDateTime >= now) then
        try
          case AreaType of //根据类型判断
            0: begin
                CircleArea := TCircleArea.Create;
                CircleArea.AreaID := FTemp.FieldByName('Area_ID').AsInteger;
                CircleArea.areaNO := FTemp.FieldByName('AreaNo').AsInteger;
                CircleArea.AreaName := FTemp.FieldByName('AreaName').AsString;
                CircleArea.AreaAlarmKind := FTemp.FieldByName('AreaProperty').AsInteger;
                CircleArea.beginDateTiem := FTemp.FieldByName('BeginTime').AsDateTime;
                CircleArea.endDateTime := FTemp.FieldByName('EndTime').AsDateTime;
                CircleArea.maxSpeed := FTemp.FieldByName('Maxspeed').AsInteger;
                CircleArea.continueTime := FTemp.FieldByName('OverSpeedTime').AsInteger;
                CircleArea.AreaPictureKind := 0;
                CircleArea.AreaPar := FTemp.FieldByName('AreaPoints_use').AsString;
                CircleArea.AreaParMcu := FTemp.FieldByName('AreaPoints_ToMCU').AsString;

                if  FTemp.FieldByName('isvisible').AsInteger=1 then
                begin
                  CircleArea.isshow:=true;
                end else
                begin
                  CircleArea.isshow:=false;
                end;
                //=====根据区域ID号码  查询所分配的车辆信息//
                info1 := Web.Query_DevListByArea(CircleArea.AreaID);
                if check_return(info1) then
                begin
                  FAreaDevData.XMLData := info1;
                  //FAreaDevData.Open;
                  FAreaDevData.First;
                  for j := 0 to FAreaDevData.RecordCount - 1 do
                  begin
  //                  CircleArea.AreaDevList.Add(FAreaDevData.FieldByName('dev_id').AsString);
                    devId := FAreaDevData.FieldByName('dev_id').AsString;
                    dev := ADeviceManage.find(devId);
                    if dev <> nil then
                    begin
                      CircleArea.AddDev(devId);
                      dev.AddADevArea(CircleArea);
                    end;
                    FAreaDevData.Next;
                  end;
                end;
                AreaPar := FTemp.FieldByName('AreaPoints_ToMCU').AsString;
                //对AreaPar数据进行分解
                down := pos(',', AreaPar);
                zt := length(AreaPar);
                Acircle.X := strtofloat(copy(AreaPar, 1, down - 1));// / 1000000.0;

                AreaPar := copy(AreaPar, down + 1, zt - down);
                down := pos(',', AreaPar);
                zt := length(AreaPar);
                Acircle.y := strtofloat(copy(AreaPar, 1, down - 1));// / 1000000.0;

                AreaPar := copy(AreaPar, down + 1, zt - down);
                down := pos(',', AreaPar);
                zt := length(AreaPar);
                CircleArea.radius := strtoint(copy(AreaPar, 1, down - 1));

                CircleArea.ACircle := Acircle;

                AreaPar := copy(AreaPar, down + 1, zt - down);
                down := pos(',', AreaPar);
                zt := length(AreaPar);
                lastpoint.Longitude :=  strtofloat(copy(AreaPar, 1, down - 1));// / 1000000.0;

                lastpoint.Latitude := strtofloat(copy(AreaPar, down + 1, zt - down));///1000000.0;
                CircleArea.lastPoint:=lastpoint;
                FAllAreaManage.Add(CircleArea);
              end;
            1: begin

                RectangleArea := TRectangleArea.Create;

                RectangleArea.AreaID := FTemp.FieldByName('Area_ID').AsInteger;
                RectangleArea.areaNO := FTemp.FieldByName('AreaNo').AsInteger;
                RectangleArea.AreaName := FTemp.FieldByName('AreaName').AsString;
                RectangleArea.AreaAlarmKind := FTemp.FieldByName('AreaProperty').AsInteger;
                RectangleArea.beginDateTiem := FTemp.FieldByName('BeginTime').AsDateTime;
                RectangleArea.endDateTime := FTemp.FieldByName('EndTime').AsDateTime;
                RectangleArea.maxSpeed := FTemp.FieldByName('Maxspeed').AsInteger;
                RectangleArea.continueTime := FTemp.FieldByName('OverSpeedTime').AsInteger;
                RectangleArea.AreaPictureKind := FTemp.FieldByName('AREATYPE').AsInteger;

                RectangleArea.AreaPar := FTemp.FieldByName('AreaPoints_use').AsString;
                RectangleArea.AreaParMcu := FTemp.FieldByName('AreaPoints_ToMCU').AsString;

                //=====根据区域ID号码  查询所分配的车辆信息
                AreaPar := FTemp.FieldByName('AreaPoints_ToMCU').AsString;
                //对AreaPar数据进行分解
                down := pos(',', AreaPar);
                zt := length(AreaPar);
                left.Longitude := strtofloat(copy(AreaPar, 1, down - 1));// / 1000000.0;

                AreaPar := copy(AreaPar, down + 1, zt - down);
                down := pos(',', AreaPar);
                zt := length(AreaPar);
                left.Latitude := strtofloat(copy(AreaPar, 1, down - 1));// / 1000000.0;
                RectangleArea.leftPoint := left;

                AreaPar := copy(AreaPar, down + 1, zt - down);
                down := pos(',', AreaPar);
                right.Longitude := strtofloat(copy(AreaPar, 1, down - 1));// / 1000000.0;
                zt := length(AreaPar);

                right.Latitude := strtofloat(copy(AreaPar, down + 1, zt - down));// / 1000000.0;
                RectangleArea.leftPoint := left;
                RectangleArea.RightPoint := right;

                info1 := Web.Query_DevListByArea(RectangleArea.AreaID);
                if check_return(info1) then
                begin
                  FAreaDevData.XMLData := info1;
                  FAreaDevData.First;
                  for j := 0 to FAreaDevData.RecordCount - 1 do
                  begin
                    devId := FAreaDevData.FieldByName('dev_id').AsString;
                    dev := ADeviceManage.find(devId);
                    if dev <> nil then
                    begin
                      RectangleArea.AddDev(devId);
                      dev.AddADevArea(RectangleArea);
                    end;
                    FAreaDevData.Next;
                  end;
                end;
                AreaPar := FTemp.FieldByName('AreaPoints_ToMCU').AsString;
                if  FTemp.FieldByName('isvisible').AsInteger=1 then
                begin
                  RectangleArea.isshow:=true;
                end else
                begin
                  RectangleArea.isshow:=false;
                end;
                FAllAreaManage.Add(RectangleArea);

              end;
            2: begin
                NoSymbolArea := TNoSymbolArea.Create;

                NoSymbolArea.AreaID := FTemp.FieldByName('Area_ID').AsInteger;
                NoSymbolArea.areaNO := FTemp.FieldByName('AreaNo').AsInteger;
                NoSymbolArea.AreaName := FTemp.FieldByName('AreaName').AsString;
                NoSymbolArea.AreaAlarmKind := FTemp.FieldByName('AreaProperty').AsInteger;
                NoSymbolArea.beginDateTiem := FTemp.FieldByName('BeginTime').AsDateTime;
                NoSymbolArea.endDateTime := FTemp.FieldByName('EndTime').AsDateTime;
                NoSymbolArea.maxSpeed := FTemp.FieldByName('Maxspeed').AsInteger;
                NoSymbolArea.continueTime := FTemp.FieldByName('OverSpeedTime').AsInteger;
                NoSymbolArea.AreaPictureKind := FTemp.FieldByName('AREATYPE').AsInteger;

                NoSymbolArea.AreaPar := FTemp.FieldByName('AreaPoints_use').AsString;
                NoSymbolArea.AreaParMcu := FTemp.FieldByName('AreaPoints_ToMCU').AsString;

                //=====根据区域ID号码  查询所分配的车辆信息
                PointsCnt := FTemp.FieldByName('AreaPointCnt').AsInteger;
 
                NoSymbolArea.PointCount:=PointsCnt;// div 2;

                NoSymbolArea.WorldPointAry := getparam(NoSymbolArea.AreaPar,PointsCnt);


                info1 := Web.Query_DevListByArea(NoSymbolArea.AreaID);
                if check_return(info1) then
                begin
                  FAreaDevData.XMLData := info1;
                  FAreaDevData.First;
                  for j := 0 to FAreaDevData.RecordCount - 1 do
                  begin
                    devId := FAreaDevData.FieldByName('dev_id').AsString;
                    dev := ADeviceManage.find(devId);
                    if dev <> nil then
                    begin
                      NoSymbolArea.AddDev(devId);
                      dev.AddADevArea(NoSymbolArea);
                    end;
                    FAreaDevData.Next;
                  end;
                end;
                AreaPar := FTemp.FieldByName('AreaPoints_ToMCU').AsString;
                if  FTemp.FieldByName('isvisible').AsInteger=1 then
                begin
                  NoSymbolArea.isshow:=true;
                end else
                begin
                  NoSymbolArea.isshow:=false;
                end;
                FAllAreaManage.Add(NoSymbolArea);
              end;
            3:begin
                PolyLineArea := TPolyLineArea.Create;
                PolyLineArea.AreaID := FTemp.FieldByName('Area_ID').AsInteger;
                PolyLineArea.areaNO := FTemp.FieldByName('AreaNo').AsInteger;
                PolyLineArea.AreaName := FTemp.FieldByName('AreaName').AsString;
                PolyLineArea.AreaAlarmKind := FTemp.FieldByName('AreaProperty').AsInteger;
                PolyLineArea.beginDateTiem := FTemp.FieldByName('BeginTime').AsDateTime;
                PolyLineArea.endDateTime := FTemp.FieldByName('EndTime').AsDateTime;
                PolyLineArea.maxSpeed := FTemp.FieldByName('Maxspeed').AsInteger;
                PolyLineArea.continueTime := FTemp.FieldByName('OverSpeedTime').AsInteger;
                PolyLineArea.AreaPictureKind := FTemp.FieldByName('AREATYPE').AsInteger;

                PolyLineArea.AreaPar := FTemp.FieldByName('AreaPoints_use').AsString;
                PolyLineArea.AreaParMcu := FTemp.FieldByName('AreaPoints_ToMCU').AsString;

                //=====根据区域ID号码  查询所分配的车辆信息
                PointsCnt := FTemp.FieldByName('AreaPointCnt').AsInteger;

                PolyLineArea.PointCount:=PointsCnt;// div 2;

                getLineSectionInfo(PolyLineArea, PolyLineArea.AreaPar);
                PolyLineArea.SetLineAllWorldPointAry;
  //              PolyLineArea.WorldPointAry := getparam(PolyLineArea.AreaPar,PointsCnt);

                info1 := Web.Query_DevListByArea(PolyLineArea.AreaID);
                if check_return(info1) then
                begin
                  FAreaDevData.XMLData := info1;
                  FAreaDevData.First;
                  for j := 0 to FAreaDevData.RecordCount - 1 do
                  begin
                    devId := FAreaDevData.FieldByName('dev_id').AsString;
                    dev := ADeviceManage.find(devId);
                    if dev <> nil then
                    begin
                      PolyLineArea.AddDev(devId);
                      dev.AddADevArea(PolyLineArea);
                    end;
                    FAreaDevData.Next;
                  end;
                end;
                AreaPar := FTemp.FieldByName('AreaPoints_ToMCU').AsString;
                if  FTemp.FieldByName('isvisible').AsInteger=1 then
                begin
                  PolyLineArea.isshow:=true;
                end else
                begin
                  PolyLineArea.isshow:=false;
                end;
                FAllAreaManage.Add(PolyLineArea);
              end;
          end;
        except

        end;
        FTemp.Next;
      end;
    except on E: Exception do
        messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
    end;
  finally
    Screen.Cursor := saveCursor;
    FTemp.Close;
    FTemp.Free;
  end;

end;

procedure TBusinessSevercom.DeleteAreaByDev_New(const DevID: WideString;
  AreaID: Integer);
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  isLeapNode: byte;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        infoServer.DeleteAreaByDev_New(DevID, AreaID);
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.DeleteADev_Area(const fact_Id: Integer; const dev_Id: string; const area_Id: Integer): Boolean;
var
  saveCursor: TCursor;
begin
  Result := False;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
       if Web.DeleteADev_Area(dev_Id, area_Id) = 'OK' then
        Result := True;
    except
      on E: Exception do
      begin
        messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.DeleteArea_New(AreaID: Integer): Boolean;
var
  saveCursor: TCursor;
begin
  Result := False;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
       if Web.DeleteAAreaById(AreaID) = 'OK' then
        Result := True;
    except
      on E: Exception do
      begin
        messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.AddNewAreaByDev_New(AreaID: Integer;
  const DevID: WideString): integer;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  isLeapNode: byte;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        infoServer.AddNewAreaByDev_New(AreaID, DevID);
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

procedure TBusinessSevercom.SetAreaDevData(const Value: Tclientdataset);
begin
  FAreaDevData := Value;
end;

procedure TBusinessSevercom.SetonsendPerMessage(const Value: TsendPerMessage);
begin
  FonsendPerMessage := Value;
end;

procedure TBusinessSevercom.ModifyArea_New(const AreaName: WideString;
  IsWarn, OverSpeed, IdlSpeed, AreaType, AreaParLen: Integer;
  const AreaPar: WideString; AreaID: Integer;isvisible:integer);
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  isLeapNode: byte;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        infoServer.ModifyArea_New(AreaName, IsWarn, OverSpeed, IdlSpeed, AreaType, AreaParLen, AreaPar, AreaID,isvisible);
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryDevMonthDis(const carNo, tjYf: string;
  groupId: Integer): OleVariant;

var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.TjCarXslcByMonth(carNo, tjyf, groupId);
        if not check_return(info) then Exit;
        Result := info;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;

end;

function TBusinessSevercom.QueryAreaWarn(const carNo, beginwarnTime,
  endWarnTime: WideString; group_ID, WarnType: Integer): OleVariant;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QueryAreaWarn(carNo, beginwarnTime, endWarnTime, group_ID,WarnType);
        if not check_return(info) then Exit;
        Result := info;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.TjAreaWarn(AFromDate, AToDate: String;
  AGroup_id, AWarnType: Integer): OleVariant; //统计出入区域报警（越界或入界报警统计）
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.TjAreaWary(AGroup_id ,AWarnType,AFromDate,AToDate);
        if not check_return(info) then Exit;
        Result := info;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.TjOverSpeed(AFromDate, AToDate: String;
  ACar_Id,AGroup_id: Integer): OleVariant; //统计超速报警统计
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.TjOverSpeed(AFromDate,AToDate,ACar_Id,AGroup_id);
        if not check_return(info) then Exit;
        Result := info;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryEmergencyAlarm(const beginTime,
  endTime: String; ACar_Id, AGroup_Id: Integer;GroupParentStr:string=''): OleVariant;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QueryEmergencyAlarm1(beginTime,endTime,ACar_Id,AGroup_id,GroupParentStr);
        if not check_return(info) then Exit;
        Result := info;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryDriverFatigueRecord(const beginTime,
  endTime: String; ADev_Id:String; AGroup_Id: Integer): OleVariant;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QueryDriverFatigueRecord(beginTime,endTime,ADev_Id,AGroup_id);
        if not check_return(info) then Exit;
        Result := info;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryGrpDevs(UserId: Integer): OleVariant;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
      info := Web.Tj_GrpDevCnt(UserId);
      Result := info;
    except
      on E: Exception do
      begin
        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryDevMonthRunInfo(const ADevIdstr,AYf:String;OverspeedNum:Integer): OleVariant;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QueryDevMonthRunInfo(ADevIdstr,Ayf,OverspeedNum);
        if not check_return(info) then Exit;
        Result := info;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.AddNewBuildCompany(ANo, AName, AMemo, //新增施工单位
  AMaintainer, createTime: String):Integer;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  isLeapNode: byte;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        Result := infoServer.AddNewCompany(ano,AName,AMemo);
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

procedure TBusinessSevercom.ModifyBuildCompany(ANo, AName, AMemo,  //修改施工单位
  AMaintainer, modifyTime: String;Id:Integer);
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  isLeapNode: byte;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        infoServer.modifycompany(Id,ANo,AName,Amemo);
        if not check_return(info) then Exit;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;          
end;

procedure TBusinessSevercom.DeleteBuildCompany(Id:Integer); //删除施工单位
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  isLeapNode: byte;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        infoServer.DeleteCompany(Id);
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryAllBuildCompany: OleVariant;        //查询施工单位
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QueryCompany('','');
        if not check_return(info) then Exit;
        Result := info;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;


function TBusinessSevercom.AddNewBuildSite(ANo, AName: string;     //新增工地
  ACompanyId: Integer; ASiteName, ASiteTel, SalesMan, saleManTel: string;
  AreaType, AreaParLen: Integer; AreaPar: string; isvisible: integer;
  memo: string):Integer;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  isLeapNode: byte;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        Result := infoServer.AddNewBuilding(ano,AName,ACompanyId,ASiteName,ASiteTel,SalesMan,saleManTel,
        AreaType,AreaParLen,AreaPar,isvisible ,memo,'','');
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;               
end;

procedure TBusinessSevercom.ModifyBuildSite(ANo, AName: string;        //修改工地
  ACompanyId: Integer; ASiteName, ASiteTel, SalesMan, saleManTel: string;
  AreaType, AreaParLen: Integer; AreaPar: string; isvisible: integer;
  memo: string; Id: Integer);
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  isLeapNode: byte;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        infoServer.ModifyBuilding(Id,ANo,AName,ACompanyId,ASiteName,ASiteTel,SalesMan,
        saleManTel,AreaType,AreaParLen,AreaPar,isvisible ,memo,'','');
        if not check_return(info) then Exit;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;     
end;


procedure TBusinessSevercom.DeleteBuildSite(Id: Integer);
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  isLeapNode: byte;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        infoServer.DeleteBuilding(Id);
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryAllBuildSite: OleVariant;        //查询工地
begin

end;

procedure TBusinessSevercom.AddNewTask({No: String;} SendStatus,       //新增任务
  Status: Integer; createTime: String; factoryId, buildingSiteId: Integer;
  destineNum: double; bcarno, tab, constructPart, taLudu, saleName,
  destineTime: String);
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  isLeapNode: byte;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        infoServer.AddNewProTask(SendStatus, Status, createTime, factoryId,
          buildingSiteId, destineNum, bcarno, tab, constructPart, taLudu,
          saleName, destineTime,'','');
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

procedure TBusinessSevercom.ModifyTask({No: String;} SendStatus,         //修改任务
  Status: Integer; createTime: String; factoryId, buildingSiteId: Integer;
  destineNum: double; bcarno, tab, constructPart, taLudu, saleName,
  destineTime: String; Id: Integer);
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  isLeapNode: byte;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        infoServer.ModifyProTask(Id,SendStatus, Status, createTime, factoryId,
          buildingSiteId, destineNum, bcarno, tab, constructPart, taLudu,
          saleName, destineTime,'','');
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

procedure TBusinessSevercom.DeleteTask(Id:Integer);
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  isLeapNode: byte;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        infoServer.DleteProTask(Id);
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;                              

function TBusinessSevercom.QueryTask(): Olevariant;              //查询任务
begin
end;

function TBusinessSevercom.AddNewAttemper(TaskId: integer; carNo,
  driverNo: string; eachCube: double; memo: String;var AttemperId:Integer): boolean;  //新增调度
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  isLeapNode: byte;
begin
  Result :=False;
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        AttemperId := infoServer.AddAttemper(0,TaskId,driverNo,carNo,
          eachCube,'','','','','',0,memo,'','');
        Result := True;
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

procedure TBusinessSevercom.ModifyAttemper(carNo, DriverNo: string;  //修改调度
  eachcube: double; memo: string);
begin

end;

function TBusinessSevercom.QueryAttemper: Olevariant;           //查询调度
begin
end;

function TBusinessSevercom.QueryBuildFactory: Olevariant;
begin
end;

function TBusinessSevercom.QueryAttemperByTaskId(
  TaskId: integer): Olevariant;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  i : Integer;
  //AttemperInf :TAttemperInf;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QueryAttemperByTaskId(TaskId);
        if not check_return(info) then Exit;
        Result := info;
        {
        FTemp.Data := info;
        FTemp.First;
        AttemperManage.IsChanging := True;
        AttemperManage.Clear;
        for i :=0 to FTemp.RecordCount -1 do
          begin
           AttemperInf := AttemperManage.Add(FTemp.FieldValues['attemperId']);
           AttemperInf.AttemperNo := FTemp.FieldByName('attemperNo').AsInteger;
           AttemperInf.TaskId := FTemp.FieldByName('taskId').AsString;
           AttemperInf.DriverNo := FTemp.FieldByName('driverNo').AsString;
           AttemperInf.DevIdStr := FTemp.FieldByName('DevIdStr').AsString;
           AttemperInf.EachCube := FTemp.FieldByName('eachCube').AsFloat;
           AttemperInf.StartTime := FTemp.FieldByName('startTime').AsString;
           AttemperInf.ArriveTime := FTemp.FieldByName('arriveTime').AsString;
           AttemperInf.UnloadStartTime := FTemp.FieldByName('unloadStartTime').AsString;
           AttemperInf.UnloadEndTime := FTemp.FieldByName('unloadEndTime').AsString;
           AttemperInf.BackFactoryTime := FTemp.FieldByName('backFactoryTime').AsString;
           AttemperInf.TotalCube := FTemp.FieldByName('totalCube').AsFloat;
           AttemperInf.Memo := FTemp.FieldByName('memo').AsString;
           FTemp.Next;
          end;
           }
     except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
     // AttemperManage.IsChanging := False;
     end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

procedure TBusinessSevercom.ModifyProTaskDoneStatuse(Status: Integer;TaskId:Integer); //更改任务的状态
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        infoServer.ModifyProTaskDoneStatus(Status,TaskId);
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

procedure TBusinessSevercom.DeleteAttemper(attemperId: Integer);
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        infoServer.DeleteAttemper(attemperId);
      except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;      
end;


function TBusinessSevercom.AddNewBuildFactory(FactNo,Factname,FactTel,FactLinkName :string; FAreaType,
      FAreaParLen:Integer;FAreaPar :string;FIsVisible:Integer):Integer;  //增加工厂信息
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
  isLeapNode: byte;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        Result := infoServer.AddNewFact(FactNo,Factname,FactTel,FactLinkName,FAreaType,FAreaParLen,FAreaPar,FIsVisible,'','');
      except
        on E :Exception do
          begin
            messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
          end;
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

procedure  TBusinessSevercom.ModifyBuildFactory(FactNo,Factname,FactTel,FactLinkName :string; FAreaType,
      FAreaParLen:Integer;FAreaPar :string;FIsVisible,FactId:Integer);  //修改工厂信息
var
  info : oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
      begin
        try
          infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
          infoServer.ModifyFact(FactId,FactNo,Factname,FactTel,FactLinkName,FAreaType,
            FAreaParLen,FAreaPar,FIsVisible,'','');
        except
          on E :Exception do
          begin
            messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
          end;
        end;
      end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

procedure TBusinessSevercom.ModifyAttempInfo(attemperId,attemperNo,taskId:Integer;eachCube:Single;startTime, arriveTime, unloadStartTime,unloadEndTime,backFactoryTime,amemo:string);
var
  info : oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
      begin
        try
          infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
          infoServer.ModifyAttemperInfo(attemperId,attemperNo,taskId,eachCube,startTime, arriveTime, unloadStartTime,unloadEndTime,backFactoryTime,amemo);
        except
          on E :Exception do
          begin
            messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
          end;
        end;
      end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

procedure  TBusinessSevercom.DeleteBuildFactory(FactId:Integer); //删除工厂信息
var
  info : oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
      begin
        try
          infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
          infoServer.DeleteFact(FactId);
        except
          on E: Exception do
          begin
            messagebox(0, pchar(E.Message), '提示', mb_ok + mb_iconinformation);
          end;
        end;
      end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryAttemperCarInfo(taskId: Integer; driverNo,devIdStr: string):Olevariant;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QueryAttemperCarInfo(taskId,driverNo,devIdStr);
        if not check_return(info) then Exit;
        Result := info;
     except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
     end;
  finally
    Screen.Cursor := saveCursor;
  end;  
end; 
function TBusinessSevercom.QueryStopCarOverTimeAlarm(devIdStr, startTime,
  endTime: string;groupId:Integer;groupParanet:string): Olevariant;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QueryStopCarOverTImeAlarm(devIdStr,startTime,endTime,groupId,groupParanet);
        if not check_return(info) then Exit;
        Result := info;
     except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
     end;
  finally
    Screen.Cursor := saveCursor;
  end;  

end;

function TBusinessSevercom.QueryDevOilHeight(devIdStr, startTime,
  endTime: string): OleVariant;
var
  info: oleVariant;
  infoServer: IBusinessDisp;
  saveCursor: TCursor;
begin
  ConnectServer;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FSocket.Connected then
    begin
      try
        infoServer := IBusinessDisp(IDispatch(FSocket.AppServer));
        info := infoServer.QueryDevOilHeight(devIdStr,startTime,endTime);
        if not check_return(info) then Exit;
        Result := info;
     except
        on E: Exception do
        begin
          messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
     end;
  finally
    Screen.Cursor := saveCursor;
  end;  

  
end;

function TBusinessSevercom.Query_ICCardTradeDataList(fromtime: WideString; totime: WideString; fact_Id: Integer;
                          dev_Id: Integer;  group_Id: Integer; group_IdList: WideString): WideString;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
//      Result := Web.Query_ICCardTradeDataList(fromtime, totime,
//                                              dev_Id, fact_Id, group_id,
//                                              group_IdList);
    except
      on E: Exception do
      begin
        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.Query_ICCardTradeDataList2(const fromTime: WideString; const toTime: WideString;
                                         const isUpok: Integer; const dev_Id: Integer; const fact_Id: Integer;
                                         const group_Id: Integer; const group_IdList: WideString): WideString;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
//      Result := Web.Query_ICCardTradeDataList2(fromTime, toTime, isUpok,
//                                               dev_Id, fact_Id, group_Id, group_IdList);
    except
      on E: Exception do
      begin
        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.Query_DbRunData(fromtime, totime: WideString;
  fact_Id, dev_Id, group_Id: Integer;
  group_IdList: WideString): WideString;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
//      Result := Web.Query_DbRunData(fromtime, totime,
//                                    dev_Id, fact_Id, group_id,
//                                    group_IdList);
    except
      on E: Exception do
      begin
        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;


function TBusinessSevercom.Query_SoundRecord(const RecordReasonId: Integer; const fromtime: WideString;
                                            const totime: WideString; const fact_Id: Integer;
                                            const dev_Id: string; const group_id: Integer;
                                            const group_IdList: WideString): WideString;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
//      Result := Web.Query_SoundRecord(RecordReasonId, fromtime, totime,
//                                      fact_Id, dev_Id,group_id,
//                                      group_IdList);
    except
      on E: Exception do
      begin
        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;


function TBusinessSevercom.DevUpdate_QueryAllDevType: WideString;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
      Result := Web.DevUpdate_QueryAllDevType;
    except
      on E: Exception do
      begin
        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.DevUpdate_QueryAllDevFact(const devType: Integer): WideString;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
      Result := Web.DevUpdate_QueryAllDevFact(devType);
    except
      on E: Exception do
      begin
        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.Client_GetDevUpdateCurrentVer(const devType: Integer; const DevFactId: Integer): WideString;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
      Result := Web.Client_GetDevUpdateCurrentVer(devType, DevFactId);
    except
      on E: Exception do
      begin
        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.Query_SoundRecord_SoundData(const Record_Id: Integer): SoundRecordData;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
      Result := Web.Query_SoundRecord_SoundData(Record_Id);
    except
      on E: Exception do
      begin
        raise Exception.Create('无法连接业务服务器！ ');//messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryOrderList(fromtime, totime: WideString;
                                          orderType: Integer; isQueryAllUserSended: Boolean; dev_id:String; fact_Id,
                                          group_Id: Integer; group_IdList: WideString; OrderResultList: WideString): WideString;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
//      Result := Web.Query_OrderList(fromtime, totime, orderType, isQueryAllUserSended,
//                                    dev_Id,fact_Id,group_id,
//                                    group_IdList, '');
      //Result := Web.Query_MessageList(fromtime, totime, -1, -1, True, dev_id, fact_Id,  group_Id, group_IdList);
    except
      on E: Exception do
      begin
        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

//function TBusinessSevercom.ModifyAOrder_DevCancelReason(const orderId: Integer; const devCancelResonId: Integer): WideString;
//var
//  saveCursor: TCursor;
//begin
//  saveCursor := Screen.Cursor;
//  Screen.Cursor := crHourGlass;
//  try
//    try
//      Result := Web.ModifyAOrder_DevCancelReason(orderId, devCancelResonId);
//    except
//      on E: Exception do
//      begin
//        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
//      end;
//    end;
//  finally
//    Screen.Cursor := saveCursor;
//  end;
//end;

function TBusinessSevercom.FindCarInArea(const cartype_id: Integer; const car_Color: WideString; const devIdList: WideString;
                           const group_Id: Integer; const group_IdList: WideString; const beginTime: WideString;
                           const endTime: WideString; const beginLat: Double; const beginLong: Double;
                           const endLat: Double; const endLong: Double): WideString;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
      Result := Web.FindCarInArea(cartype_id, car_Color, devIdList, group_Id, group_IdList, beginTime,
                                  endTime, beginLat, beginLong, endLat, endLong);
    except
      on E: Exception do
      begin
        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryMessageList(fromtime: WideString; totime: WideString; msg_type: Integer;
                                            msg_state: Integer; isQueryAllUserSended: Boolean;
                                            dev_id: string; fact_Id: Integer; group_Id: Integer;
                                            group_IdList: WideString): WideString;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
//      Result := Web.Query_MessageList(fromtime, totime, msg_type,
//                                      msg_state, isQueryAllUserSended,
//                                      dev_id, fact_Id, group_Id,
//                                      group_IdList);
      //Result := Web.Query_MessageList(fromtime, totime, -1, -1, True, dev_id, fact_Id,  group_Id, group_IdList);
    except
      on E: Exception do
      begin
        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.Tj_ServeJudge(const fromtime: WideString; const totime: WideString;
                           const fact_Id: Integer; const dev_Id: string;
                           const group_Id: Integer; const group_IdList: WideString): WideString;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
//      Result := Web.Tj_ServeJudge(fromtime, totime, fact_Id,
//                                      dev_id,  group_Id,
//                                      group_IdList);
    except
      on E: Exception do
      begin
        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.Tj_ServeJudge_NotOk(const fromtime: WideString; const totime: WideString;
                                              const fact_Id: Integer; const dev_Id: string;
                                              const group_Id: Integer; const group_IdList: WideString): WideString;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
//      Result := Web.Tj_ServeJudge_NotOk(fromtime, totime, fact_Id,
//                                      dev_id,  group_Id,
//                                      group_IdList);
    except
      on E: Exception do
      begin
        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.ModifyADriver_Client(const driver_id: Integer;
  const driver_name, driver_tel: WideString): WideString;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
      Result := Web.ModifyADriver_Client(driver_id, driver_name, driver_tel);
    except
      on E: Exception do
      begin
        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.AddSql(const SqlStr, TableName,
  Desc: WideString): Integer;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  Result := -1;
  try
    try
      Result := Web.AddSql(SqlStr, TableName, Desc);
    except
      on E: Exception do
      begin
        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QuerySql(const SqlStr: WideString; const TableName: WideString; const Desc: WideString): WideString;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
      Result := Web.QuerySql(SqlStr, TableName, Desc);
    except
      on E: Exception do
      begin
        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.ModifySql(const SqlStr: WideString; const TableName: WideString; const Desc: WideString): WideString;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
      Result := Web.ModifySql(SqlStr, TableName, Desc);
    except
      on E: Exception do
      begin
        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.DevUpdate_QueryAllDevUpdateRecord(const DevId:string;
const group_Id: Integer; const group_IdList: WideString; const DevType,
  DevFactId: Integer; const fromTime, toTime: WideString;
  const UpdateResult: Integer; const HardVer,
  SoftVer: WideString): WideString;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
//      Result := Web.DevUpdate_QueryAllDevUpdateRecord(DevId, group_Id, group_IdList, DevType,
//                                                      DevFactId, fromTime, toTime, UpdateResult,
//                                                      HardVer, SoftVer);
    except
      on E: Exception do
      begin
        raise Exception.Create('无法连接业务服务器！ ');
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryAlarmCount(fromTime, toTime, devId: string;
  group: Integer; sonGroupIdList: string; dealStatus,
  alarmType: Integer; simNo: string): Integer;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
      Result := Web.Query_DevAlarm_Count(fromTime, toTime, devId, group, sonGroupIdList, dealStatus, alarmType, simNo);
    except
      on E: Exception do
      begin
        Result := 0;
        //raise Exception.Create('调用业务服务器失败！');
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryAlarmData(fromTime, toTime, devId: string;
  group: Integer; sonGroupIdList: string; dealStatus, alarmType: Integer;
  pageSize, currPageNo: Integer; simNo: string): WideString;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
      Result := Web.Query_DevAlarm_Page(fromTime, toTime, devId, group, sonGroupIdList, dealStatus, alarmType, simNo, pageSize, currPageNo);
    except
      on E: Exception do
      begin
        Result := '';
        //raise Exception.Create('调用业务服务器失败！');
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryAlarmDealInfo(
  alarmDealId: Integer): WideString;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
      Result := Web.QueryDevAlarmDeal(alarmDealId);
    except
      on E: Exception do
      begin
        Result := '';
        //raise Exception.Create('调用业务服务器失败！');
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryDevGroupOnline(fromTime, toTime: string;
  groupId: Integer; sonGroupIdList: string): WideString;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
      Result := Web.TjGroupOnlinePer(groupId, sonGroupIdList, fromTime, toTime);
    except
      on E: Exception do
      begin
        Result := '';
        //raise Exception.Create('调用业务服务器失败！');
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryDevMileage(fromTime, toTime, devId: string;
  groupId: Integer; sonGroupIdList: string): WideString;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
      Result := Web.tj_xslc(fromTime, toTime, devId, groupId, sonGroupIdList);
    except
      on E: Exception do
      begin
        Result := '';
        //raise Exception.Create('调用业务服务器失败！');
      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.GetDevLastPos: string;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
      Result := Web.Query_DevGpsData('', -1, '');
    except
      on E: Exception do
      begin

      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryAllInfoTypes: string;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
      Result := Web.QueryInfoTypeList;
    except
      on E: Exception do
      begin

      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryInfo(sTime, eTime: string): string;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
      Result := Web.QueryInfoList(sTime, eTime);
    except
      on E: Exception do
      begin

      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryDevInfoType: string;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
      Result := Web.QueryInfoDevList;
    except
      on E: Exception do
      begin

      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.AddNewInfoType(typeId: Integer; typeName,
  typeMemo: string): Integer;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
      Result := Web.AddNewInfoType(typeId, typeName, typeMemo);
    except
      on E: Exception do
      begin

      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.DelInfoType(id: Integer): Boolean;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  Result := False;
  try
    try
      Result := (Web.DeleteAInfoType(id) = 'OK');
    except
      on E: Exception do
      begin

      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.ModifyAInfoType(id, typeId: Integer; typeName,
  typeMemo: string): Boolean;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  Result := False;
  try
    try
      Result := (Web.ModifyAInfoType(id, typeId, typeName, typeMemo) = 'OK');
    except
      on E: Exception do
      begin

      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.AddNewInfo(typeId: Integer; infoContent,
  sendTime, infoMemo: string): Integer;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
      Result := Web.AddNewInfo(typeId, infoContent, sendTime, infoMemo);
    except
      on E: Exception do
      begin

      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.DelInfo(id: Integer): Boolean;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  Result := False;
  try
    try
      Result := (Web.DeleteAInfo(id) = 'OK');
    except
      on E: Exception do
      begin

      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.ModifyAInfo(id, typeId: Integer; infoContent,
  sendTime, infoMemo: string): Boolean;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  Result := False;
  try
    try
      Result := (Web.ModifyAInfo(id, typeId, infoContent, sendTime, infoMemo) = 'OK');
    except
      on E: Exception do
      begin

      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.AddDevInfoType(infoTypeId: Integer;
  devId: string): Boolean;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  Result := False;
  try
    try
      Result := (Web.AddNewInfoDev(infoTypeId, devId, FormatDateTime('yyyy-MM-dd hh:nn:ss', Now)) > 0);
    except
      on E: Exception do
      begin

      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.DelDevInfoType(infoTypeId: Integer;
  devId: string): Boolean;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  Result := False;
  try
    try
      Result := (Web.DeleteAInfoDev(infoTypeId, devId) = 'OK');
    except
      on E: Exception do
      begin

      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.AddDevAlarmInfo(const dev_Id: WideString;
  const alarmType: Integer; const gpsTime: WideString; const latitude,
  longitude: Single; const speed, overspeedtype, OVERSPEEDAREAID,
  AREAALARMTYPE, AREAALARMID, AREAALARMSTATE, OVERTIMELINEID,
  OVERTIMELINETIMER, OVERTIMELINESTATE: Integer): Integer;
var
  saveCursor: TCursor;
begin
  Result := -1;
  try
    Result := Web.AddNewAlarmInfo_OutFence(dev_Id, alarmType, gpsTime, latitude, longitude, speed, overspeedtype, OVERSPEEDAREAID,
                                           AREAALARMTYPE, AREAALARMID, AREAALARMSTATE, OVERTIMELINEID, OVERTIMELINETIMER, OVERTIMELINESTATE);
  except
    on E: Exception do
    begin

    end;
  end;
end;

function TBusinessSevercom.AddNewAlarmDeal(alarmDevId: string;
  alarmtype: Integer; alarmGpstime: string; alarmDealStatus: Integer;
  alarmDealTime: string; alarmType_pt: Integer): string;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  Result := '-1';
  try
    try
      Result := Web.AddNewAlarmDeal(alarmDevId, alarmtype, alarmGpstime, alarmDealStatus, alarmDealTime, alarmType_pt);
    except
      on E: Exception do
      begin

      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.ModifyAlarmDeal_DealEnd(id,
  alarmdealstatus: Integer; alarmdealtime, alarmperson, alarmpersontel,
  alarmpos, alarmdealproc, alarmdealresult: string): Boolean;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  Result := False;
  try
    try
      Result := Web.ModifyAlarmDeal_DealEnd(id, alarmdealstatus, alarmdealtime, alarmperson, alarmpersontel, alarmpos, alarmdealproc, alarmdealresult) = 'OK';
    except
      on E: Exception do
      begin

      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.ModifyAlarmDeal_DealOk(id,
  alarmDealstatus: Integer; alarmDealTime: string): Boolean;
var
  saveCursor: TCursor;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  Result := False;
  try
    try
      Result := Web.ModifyAlarmDeal_DealOk(id, alarmDealstatus, alarmDealTime) = 'OK';
    except
      on E: Exception do
      begin

      end;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

function TBusinessSevercom.QueryDevCarInfo(ACarManage: TCarManage;
  ADeviceManage: TDeviceManage): Boolean;
var
  FTemp: TClientDataSet;
  i, j: Integer;
  info: string;
  car: TCar;
  CarType: TCarType;
  dev0: TDevice;
  devId: string;
  TempLongWord: LongWord;
  b: Boolean;
begin
  try
    try
      FTemp := Tclientdataset.Create(nil);

      FonsendPerMessage('正在加载车辆设备信息...');

      info := Web.LoadDevInfo_ForCs;
      FTemp.XMLData := info;
      FTemp.Open;

      FTemp.First;
      for i := 0 to FTemp.RecordCount - 1 do
      begin
        try
          car := ACarManage.AddNewCar(FTemp.FieldByName('a').AsInteger);
          car.id := FTemp.FieldByName('a').AsInteger;
          car.ZBH := FTemp.FieldByName('b').AsString;
          car.No := FTemp.FieldByName('c').AsString;
          car.CarType := Trim(FTemp.FieldByName('d').AsString);
          car.ChePaiColor := FTemp.FieldByName('e').AsInteger;
          car.CpColorStr := Trim(FTemp.FieldByName('f').AsString);

          car.ShengName := FTemp.FieldByName('g').AsString;
          car.ShiName := FTemp.FieldByName('h').AsString;
          car.IndustryName := FTemp.FieldByName('i').AsString;
          car.CarKind := Trim(FTemp.FieldByName('a0').AsString);
          car.CarShipName := Trim(FTemp.FieldByName('a1').AsString);
          car.SetupTime := Trim(FTemp.FieldByName('a2').AsString);
          car.stat := 0;

          //取得当前组中的设备(车辆)数
          devId := FTemp.FieldByName('j').AsString;
          FillStr(devId, 12, '0');
          //dev0 := ADeviceManage.Add(devId);
          dev0 := ADeviceManage.AddNewDevice(devId);
          //dev0.DispLabel := FTemp.FieldByName('DISP_LABEL').AsString;
          dev0.SimNo := FTemp.FieldByName('k').AsString;
          dev0.GroupID := FTemp.FieldByName('l').AsInteger;
          dev0.Pattern := 1; // 显示轨迹时，画的是实线，在这里赋1，就可以在轨迹回放时实现用虚线画轨迹线
          //将车机ID号放入到 相应车组的 DevList中
          ADevGroupManage.InsertDevList(dev0.id, dev0.GroupID);
          dev0.Car := car;

          if FTemp.FieldByName('o').AsString <> '' then
            dev0.GpsTime := FTemp.FieldByName('o').AsDateTime;
          dev0.Longitude := FTemp.FieldByName('p').AsFloat / 1000000;
          dev0.Latitude := FTemp.FieldByName('q').AsFloat / 1000000;
          dev0.Course := FTemp.FieldByName('r').AsFloat / 10;
          dev0.OilVolume := FTemp.FieldByName('s').AsFloat / 10;
          dev0.Speed := FTemp.FieldByName('t').AsInteger;
          dev0.Altitude := FTemp.FieldByName('u').AsInteger;
          dev0.Orientation := FTemp.FieldByName('v').AsInteger;

          if FTemp.FieldByName('w').AsString <> '' then
          begin
            TempLongWord := FTemp.FieldByName('w').AsVariant; //取状态
            for j := 0 to 31 do             // 总共是32位，后面的数据保留
            begin
              dev0.Switch[j] := (TempLongWord and $1) = $1;
              TempLongWord := TempLongWord shr 1;
            end;
            //疲劳报警的3个状态位加载时都设为False
            dev0.Switch[13] := False;
            dev0.Switch[14] := False;
            dev0.Switch[15] := False;
          end;

          if FTemp.FieldByName('x').AsString <> '' then
          begin
            TempLongWord := FTemp.FieldByName('x').AsVariant;  // 取报警标志
            for j := 0 to 31 do
            begin
              dev0.Switch_Warning[j] := (TempLongWord and $1) = $1;
              TempLongWord := TempLongWord shr 1;
            end;
          end;

          dev0.Login_DriverName := Trim(FTemp.FieldByName('y').AsString);
          dev0.Login_Driver := Trim(FTemp.FieldByName('z').AsString);
          if (dev0.Login_Driver = '') and (dev0.Login_DriverName = '') then
          begin
            dev0.Login_Driver := '未登录';
          end;
          if (not FTemp.FieldByName('t1').IsNull) then
          begin
            dev0.TerminalTypeId := FTemp.FieldByName('t1').AsInteger;
            dev0.TerminalTypeName := Trim(FTemp.FieldByName('t2').AsString);
          end
          else
          begin
            dev0.TerminalTypeId := -1;
            dev0.TerminalTypeName := '未知';
          end;

          try
            dev0.Car.Memo := Trim(FTemp.FieldByName('t3').AsString);
          except
            dev0.Car.Memo := '';
          end;

          FonsendPerMessage('正在处理已加载车辆设备信息，处理进度:' + IntToStr(i + 1) + '/' + IntToStr(FTemp.RecordCount));

        except
          on E: Exception do
          begin
            AddSysLog('QueryDevCarInfo 循环处理异常:' + E.Message);
          end;
        end;
        FTemp.Next;
        //Application.ProcessMessages;
      end;

      //列出所有 父组 下的子组，将子组ID放到 父组的子组数组中，
      //  并把子组的DevArray放到父组的DevArray中，方便以后使用
      ADevGroupManage.ListSon;
      Result := True;
        
    except on E: Exception do
      AddSysLog('QueryDevCarInfo异常:' + E.Message);
    end;
  finally
    FTemp.Close;
    FTemp.free;
  end;
end;

procedure TBusinessSevercom.AddSysLog(sLog: string);
begin
  if sLog <> '' then
    uGloabVar.SystemLog.AddLog(FormatDateTime('yyyy-MM-dd hh:nn:ss', Now) + ' ' + sLog);
end;

function TBusinessSevercom.QueryNoticeCount(const startTime: string; const endtime: string; const isread: Integer): Integer;
begin
  Result := 0;
  try
    Result := Web.Query_AppMsgUser_Count(startTime, endtime, isread);
  except
    on E: Exception do
    begin
    end;
  end;
end;

procedure TBusinessSevercom.QueryNotice(const startTime, endTime: string;
  const isRead, pageSize, currPageIndex: Integer);
var
  FTemp: Tclientdataset;
  notice: TNotice;
  i: Integer;
begin
  try
    try
      FTemp := Tclientdataset.Create(nil);

      FTemp.XMLData := Web.Query_AppMsgUser_Page(startTime, endTime, isRead, pageSize, currPageIndex);
      FTemp.Open;

      FTemp.First;
      for i := 0 to FTemp.RecordCount - 1 do
      begin         
        notice := FNoticeManage.Add(FTemp.FieldByName('id').AsInteger);
        notice.Title := Trim(FTemp.FieldByName('title').AsString);
        notice.Content := Trim(FTemp.FieldByName('memo').AsString);
        notice.IsRead := FTemp.FieldByName('isread').AsInteger;
        notice.SendTime := FTemp.FieldByName('sendtime').AsDateTime;
        if FTemp.FieldByName('readtime').AsString <> '' then
        begin
          notice.ReadTime := FTemp.FieldByName('readTime').AsDateTime;
        end;
        FTemp.Next;
      end;
    except on E: Exception do
    end;
  finally
    FTemp.Close;
    FTemp.free;

  end;
end;

procedure TBusinessSevercom.setNoticeRead(noticeId: Integer);
begin
  try
    Web.ModifyAnAppMsgUser_state(noticeId);
  except
    on E: Exception do
    begin
    end;
  end;
end;

procedure TBusinessSevercom.AddNewUserFeed(qq, e_mail, tel,
  feedMemo: string);
begin
  try
    Web.AddNewUserFeed(qq, e_mail, tel, feedMemo);
  except
    on E: Exception do
    begin
    end;
  end;
end;

function TBusinessSevercom.QueryNoticeInfo(const startTime,
  endTime: string; const isRead, pageSize,
  currPageIndex: Integer): OleVariant;
begin
  try
    Result := Web.Query_AppMsgUser_Page(startTime, endTime, isRead, pageSize, currPageIndex);
  except on E: Exception do
  end;
end;

function TBusinessSevercom.QueryDevRunStateInfoOnTheTime(queryTime: string;
  groupId: Integer; const group_list, devIdStr: string): string;
begin
  try
    Result := Web.QueryDevRunStateInfoOnTheTime(queryTime,groupId,group_list,devIdStr);
  except
    on E: Exception do
    begin

    end;
  end;
end;

function TBusinessSevercom.QueryMediaCount(queryMediaType: Integer;
  querySTime, queryETime: string; queryPhotoReason, queryCamerano: Integer;
  queryCarNo, querySim_no, queryDevId: string; queryGroupId: Integer;
  queryGroupList: string): Integer;
begin
  Result := 0;
  try
    Result := Web.QueryPicsByCondition_count(querySTime, queryETime, queryPhotoReason, queryCamerano, queryMediaType,
                                             queryCarNo, querySim_no, queryDevId, queryGroupId, queryGroupList);

  except
    on E: Exception do
    begin
    end;
  end;
end;

function TBusinessSevercom.QueryMediaDataByPage(queryMediaType: Integer;
  querySTime, queryETime: string; queryPhotoReason, queryCamerano: Integer;
  queryCarNo, querySim_no, queryDevId: string; queryGroupId: Integer;
  queryGroupList: string; pageSize, currPageIndex: Integer): ArrayOfPicInfo;
begin
  try
    Result := Web.QueryPicsByCondition_Page(querySTime, queryETime, queryPhotoReason, queryCamerano, queryMediaType,
                                             queryCarNo, querySim_no, queryDevId, queryGroupId, queryGroupList, pageSize, currPageIndex);

  except
    on E: Exception do
    begin
    end;
  end;
end;

function TBusinessSevercom.QueryLatestPic(devId: string): PicInfo;
begin
  try
    Result := Web.QueryALastPicByCondition(-1, -1, 0, '', '', devId);
  except
    on E: Exception do
    begin
    end;
  end;
end;

function TBusinessSevercom.QueryDevUploadMileageCount(queryFlag: Byte; sTime, eTime,
  devId: string; groupId: Integer; groupIDList: string): Integer;
begin
  Result := 0;
  try
    case queryFlag of
      0:
        Result := Web.Tj_DevUploadMilage_Count(sTime, eTime, devId, groupId, groupIDList);
      1:
        Result := Web.Query_DevUploadMilage_Count(sTime, eTime, devId, groupId, groupIDList);
      2:
        Result := Web.Tj_DevUploadMilage_Day_Count(sTime, eTime, devId, groupId, groupIDList);
      3:
        Result := Web.Tj_DevUploadMilage_Month_Count(sTime, eTime, devId, groupId, groupIDList);
    end;
  except
    on E: Exception do
    begin
    end;
  end;
end;

function TBusinessSevercom.QueryDevUploadMileageData(queryFlag: Byte; sTime, eTime,
  devId: string; groupId: Integer; groupIDList: string; pageSize,
  currPageIndex: Integer): string;
begin
  try
    Result := '';
    case queryFlag of
      0:
        Result := Web.QueryDevCarryKmAndOil_Page(pageSize, currPageIndex, devId, groupId, groupIDList, sTime, eTime);
      1, 2, 3:
        Result := Web.QueryDevCarryKmAndOil_condition_Page(pageSize, currPageIndex, devId, groupId, groupIDList, sTime, eTime, queryFlag - 1);
    end;
  except
    on E: Exception do
    begin
    end;
  end;
end;

function TBusinessSevercom.AddSetCarRunStatePlan(devId: string; sTime,
  eTime: TDateTime; sAddr, eAddr, sMemo, userName: string): Boolean;
begin
  Result := True;
  try
    Result := Web.AddNewDevCarryTimes(devId, FormatDateTime('yyyy-MM-dd hh:nn:ss', sTime), FormatDateTime('yyyy-MM-dd hh:nn:ss', eTime), sAddr, eAddr, sMemo, userName) > 0;
  except
    on E: Exception do
    begin
      Result := False;
    end;
  end;
end;

function TBusinessSevercom.QuerySetCarRunstatePlanCount(sTime, eTime,
  devId: string; groupId: Integer; groupIdList: string): Integer;
begin
  Result := 0;
  try
    Result := Web.QueryDevCarryTimes_Count(devId, groupId, groupIDList, sTime, eTime, '', '');
  except
    on E: Exception do
    begin
    end;
  end;
end;

function TBusinessSevercom.QuerySetCarRunStatePlanData(sTime, eTime,
  devId: string; groupId: Integer; groupIdList: string; pageSize,
  currPageIndex: Integer): string;
begin
  Result := '';
  try
    Result := Web.QueryDevCarryTimes_Page(pageSize, currPageIndex, devId, groupId, groupIDList, sTime, eTime, '', '');
  except
    on E: Exception do
    begin
    end;
  end;
end;

function TBusinessSevercom.DeleteSetCarRunStatePlan(Id: Integer): Boolean;
begin
  Result := True;
  try
    Result := Web.DeleteADevCarryTimes(Id) = 'OK';
  except
    on E: Exception do
    begin
      Result := False;
    end;
  end;
end;

function TBusinessSevercom.ModifySetCarRunStatePlan(Id: Integer; devId: string; sTime,
  eTime: TDateTime; sAddr, eAddr, sMemo, userName: string): Boolean;
begin
  Result := True;
  try
    Result := Web.ModifyADevCarryTimes(devId, FormatDateTime('yyyy-MM-dd hh:nn:ss', sTime), FormatDateTime('yyyy-MM-dd hh:nn:ss', eTime), sAddr, eAddr, sMemo, userName, Id) = 'OK';
  except
    on E: Exception do
    begin
      Result := False;
    end;
  end;
end;

{ TQueryADevGroupManage }

constructor TQueryADevGroupManage.Create(FromDate: string; ToDate: string;
                        fact_Id: Integer; dev_Id: Integer; group_id: Integer;
                        group_paranet: string);
begin
  FFromDate:=FromDate;//
  FToDate:=ToDate;
  Ffact_id:=fact_Id;
  Fdev_id:=dev_Id;
  Fgroup_id:=group_id;
  Fgroup_paranet:=group_paranet;


  inherited Create(False);
  FreeOnTerminate := True;
  //Execute;
end;

constructor TQueryADevGroupManage.Create;
var
    cs: AuthHeader;
begin
  CmdList := TIntegerList.Create;

  inherited Create(False);
  FreeOnTerminate := True;
  //Execute;
end;

destructor TQueryADevGroupManage.Destroy;
begin
  CmdList.Clear;
  CmdList.Free;
  inherited Destroy;
end;

procedure TQueryADevGroupManage.Execute;
  {function GetServiceSoap: ServiceSoap;
  var
    cs: AuthHeader;
    FServiceSoap: ServiceSoap;
  begin
    cs := AuthHeader.Create;
    cs.Username := current_user.UserName;
    cs.Password := current_user.Password;
    service.IP := Bs.Host;
    service.PORT := IntToStr(Bs.PORT);
    FServiceSoap := service.GetServiceSoap;
    (FServiceSoap as ISOAPHeaders).Send(cs);
    result := FServiceSoap;
  end;  }
begin
  try
    coinitialize(nil);
    while not Terminated do
    begin
      Sleep(1000);
      Synchronize(SetInfo);
      //SetInfo;
    end;
  finally
    CoUninitialize;
  end;
  {xml := BS.Query_DbRunData(FFromDate, FToDate,
                            Ffact_Id, Fdev_Id, Fgroup_id,
                            Fgroup_paranet);}
end;

procedure TQueryADevGroupManage.SetInfo;
  function BCDToInt(ABuff:Pointer): Integer; // 将BCD字符串转换为整形
  var
    i:integer;
    temp: string;
  begin
    temp:='';
    inc(PByte(ABuff));
    for i:=0 to 2 do
    begin
      temp:=temp+InttoHex(PByte(ABuff)^,2);
      inc(PByte(ABuff));
    end;
    Result := StringToInteger(temp);
  end;
var
  pInfo: PCmdinfo;
  pHead: PHead_V3;
begin
  while CmdList.Count > 0 do
  begin
    try
//      pInfo := PCmdinfo(CmdList.Datas[0]);
//      pHead := PHead_V3(@pInfo^.Content[0]);
      try
        //Bs.AddNewCmdLog(current_user.id, {pHead^.FactID, pInfo^.DevId}BCDToStr(@pHead^.DevId[0],6), pHead^.CmdFlag, pInfo^.Desc);
        Application.ProcessMessages;
      except
      end;
    finally
      CmdList.Delete(0);
    end;
  end;
end;

{ TQueryInfo }

constructor TQueryInfo.Create(FromDate, ToDate: string; fact_Id, dev_Id,
  group_id: Integer; group_paranet: string);
begin
  FFromDate:=FromDate;//
  FToDate:=ToDate;
  Ffact_id:=fact_Id;
  Fdev_id:=dev_Id;
  Fgroup_id:=group_id;
  Fgroup_paranet:=group_paranet;


  inherited Create(False);
  FreeOnTerminate := True;
  Execute;
end;

constructor TQueryInfo.Create;
begin

end;

destructor TQueryInfo.Destroy;
begin
  inherited Destroy;;
end;

procedure TQueryInfo.Execute;
begin
  //inherited;
  try
    coinitialize(nil);
    xml := BS.Query_DbRunData(FFromDate, FToDate,
                            Ffact_Id, Fdev_Id, Fgroup_id,
                            Fgroup_paranet);
  finally
    CoUninitialize;
  end;
end;

{ TQueryADevParam }

constructor TQueryADevParam.Create(DevManager: TDeviceManage; lable: TLabel);
begin
  inherited Create(False);
  FreeOnTerminate := True;
  TDevManager := DevManager;
  lable1 := lable;
end;

destructor TQueryADevParam.Destroy;
begin
  inherited Destroy;
end;

procedure TQueryADevParam.Execute;
var
  info: string;
  i, j: integer;
  Dev: TDevice;
  fcount: integer;
  filterStr: string;
  FTemp: Tclientdataset;
begin
  try
    try
      coinitialize(nil);
      try
        FTemp := Tclientdataset.Create(nil);
        lable1.Caption := '加载车机的参数...';
        for i := 0 to TDevManager.Count - 1 do
        begin
          Dev := TDevManager.Items[i];

          info := BS.QueryDevParamsList_ByDevId( Dev.id);
          FTemp.XMLData := info;
          FTemp.Open;
          lable1.Caption := '正在加载' + dev.Car.No + '的参数...';
          FTemp.First;
          for j := 0 to FTemp.RecordCount - 1 do
          begin
            case FTemp.FieldByName('PARAMTERS_NO').AsInteger of
              $0001: Dev.Param.ZDXTSJ_0001 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0002: Dev.Param.TCPYDCS_0002 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0003: Dev.Param.TCPCC_0003 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0004: Dev.Param.SMSYDCS_0004 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;

              $0005: Dev.Param.SMSCC_0005 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0010: Dev.Param.ZFWQAPN_0010 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0011: Dev.Param.ZFWQYH_0011 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0012: Dev.Param.ZFWQMM_0012 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0013: Dev.Param.ZFWQDZ_0013 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0014: Dev.Param.BFFWQAPN_0014 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0015: Dev.Param.BFFWQYH_0015 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0016: Dev.Param.BFFWQMM_0016 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0017: Dev.Param.BFFWQDZ_0017 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0018: Dev.Param.TCPDK_0018 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              //$0091: Dev.Param.JJQTJSJ_0091 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              //$0090: Dev.Param.JJQTJCC_0090 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0020: Dev.Param.WZHBCL_0020 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0021: Dev.Param.WZHBFA_0021 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0022: Dev.Param.WDLSJJG_0022 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0023: Dev.Param.ACC_OFFSJJG_0023 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0024: Dev.Param.ACC_ONSJJG_0024 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0025: Dev.Param.KCSJJG_0025 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0026: Dev.Param.ZCSJJG_0026 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0027: Dev.Param.XMSJJG_0027 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0028: Dev.Param.JJBJSJJG_0028 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0029: Dev.Param.WDLJLJG_0029 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $002A: Dev.Param.ACC_OFFJLJG_002A := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $002B: Dev.Param.ACC_ONJLJG_002B := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $002C: Dev.Param.KCJLJG_002C := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $002D: Dev.Param.ZCJLJG_002D := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $002E: Dev.Param.XMJLJG_002E := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $002F: Dev.Param.JJBJJLJG_002F := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0030: Dev.Param.GDBCJD_0030 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;

              $0040: Dev.Param.JKPTDH_0040 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0041: Dev.Param.FWDH_0041 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0042: Dev.Param.HFCCSZDH_0042 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0043: Dev.Param.JKPTSMSDH_0043 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0044: Dev.Param.JSZDSMSWBBJDH_0044 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0045: Dev.Param.ZDDHJTCL_0045 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0046: Dev.Param.MCZCTHSJ_0046 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0047: Dev.Param.DYZCTHSJ_0047 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0048: Dev.Param.DHHMCD_0048 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0049: Dev.Param.JTDHHM_0049 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;

              $0050: Dev.Param.BJPBZ_0050 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0051: Dev.Param.BJFSWBSMSKG_0051 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0052: Dev.Param.BJPSKG_0052 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0053: Dev.Param.BJPSCCKG_0053 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0054: Dev.Param.GJBJBZ_0054 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0055: Dev.Param.ZGSD_0055 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0056: Dev.Param.CSCXSJ_0056 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0057: Dev.Param.LXJSSJ_0057 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0058: Dev.Param.ZXXXSJ_0058 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0059: Dev.Param.ZCTCSJ_0059 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $005A: Dev.Param.DTLJJSSJ_005A := FTemp.FieldByName('PARAMTERS_MEMO').AsString;

              $0070: Dev.Param.TXSPZL_0070 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0071: Dev.Param.LD_0071 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0072: Dev.Param.DBD_0072 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0073: Dev.Param.BHD_0073 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0074: Dev.Param.SD_0074 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;

              $0080: Dev.Param.CLLCBDS_0080 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0081: Dev.Param.CLSZSYID_0081 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0082: Dev.Param.CLSZSYID_0082 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;


              $0090: Dev.Param.JJQYYCSXZ_0090 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $0091: Dev.Param.JJQYYSJXZ_0091 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $00A0: Dev.Param.MCULYMS_00A0 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $00A1: Dev.Param.MCULYWJZDCD_00A1 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $00A2: Dev.Param.LCDXTJG_00A2 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;

              $00A3: Dev.Param.LEDXTJG_00A3 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $00AF: Dev.Param.ACCOFFXMSJ_00AF := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $00B0: Dev.Param.SPFWQMS_00B0 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $00B1: Dev.Param.SPFWQAPN_00B1 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $00B2: Dev.Param.SPFWQHYM_00B2 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;

              $00B3: Dev.Param.SPFWQMM_00B3 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $00B4: Dev.Param.SPFWQIP_00B4 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $00B5: Dev.Param.SPFWQDK_00B5 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;


              $F001: Dev.Param.MCUID_F001 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $004B: Dev.Param.TTSYL_004B := FTemp.FieldByName('PARAMTERS_MEMO').AsString;

              $0019: Dev.Param.BFTCPDK_0019 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
              $004A: Dev.Param.MCUWHMM_004A := FTemp.FieldByName('PARAMTERS_MEMO').AsString;

              $F002: Dev.Param.KZCJC_F002 := FTemp.FieldByName('PARAMTERS_MEMO').AsString;
            end;
            FTemp.Next;
          end;
          //FTemp.Filtered := false;
        end;
      except on E: Exception do
        raise Exception.Create(e.Message); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    finally
      FTemp.Close;
      FTemp.free;
      lable1.Caption := '';
    end;
  finally
    CoUninitialize;
  end;
end;

{ TQueryDriver }

constructor TQueryDriver.Create(DevManager: TDeviceManage;
  DriverManage: TDriverManage; lable: TLabel);
begin
  inherited Create(False);
  FreeOnTerminate := True;
  TDevManager := DevManager;
  TDriverManage := DriverManage;
  lable1 := lable;
end;

destructor TQueryDriver.Destroy;
begin
  inherited Destroy;
end;

procedure TQueryDriver.Execute;
var
  info: string;
  i: integer;
  Dev: TDevice;

  FTemp: Tclientdataset;

  int: integer;
  Driver: PDriver;
begin
  try
    try
      coinitialize(nil);
      try
        FTemp := Tclientdataset.Create(nil);
        if lable1 <> nil then
          lable1.Caption := '正在加载司机信息...';

        info :=BS.TDriverInfo(TDriverManage, lable1);
        FTemp.XMLData := info;

        FTemp.Open;
        FTemp.First;
        ADriverManage.ClearDriver;
        for i := 0 to FTemp.RecordCount - 1 do
        begin
          try
            Driver := ADriverManage.AddNewDriver(FTemp.FieldByName('DRIVER_ID').AsInteger);
            Driver^.id := FTemp.FieldByName('DRIVER_ID').AsInteger;
            Driver^.Name := FTemp.FieldByName('DRIVER_NAME').AsString;
            if lable1 <> nil then
              lable1.Caption := '正在加载司机 ' + Driver^.Name + ' 的信息...';
            Driver^.CarID := FTemp.FieldByName('CAR_ID').AsInteger;
            Driver^.GroupID := FTemp.FieldByName('GROUP_ID').AsInteger;
            Driver^.DriverNO := FTemp.FieldByName('DRIVER_NO').AsString;
            Driver^.TEL := FTemp.FieldByName('DRIVER_TEL').AsString;
            Driver^.Address := FTemp.FieldByName('DRIVER_ADDR').AsString;
            Driver^.IdentityCard := FTemp.FieldByName('DRIVER_IDENTITYCARD').AsString;
            Driver^.DriverServeNum := FTemp.FieldByName('DRIVERSERVENUM').AsString;
            int := FTemp.FieldByName('DRIVER_KIND').AsInteger;
            if int = 0 then Driver^.isMain := True else Driver^.isMain := false;
            FTemp.Next;
          except
            Continue;
          end;
        end;

        TDevManager.CreateDriverNameTel;

      except
        //on E: Exception do
        //  raise Exception.Create(e.Message);
      end;
    finally
      FTemp.Close;
      FTemp.free;
      if lable1 <> nil then
        lable1.Caption := '';
    end;
  finally
    CoUninitialize;
  end;
end;

{ TQueryDevTelList }

constructor TQueryDevTelList.Create(DevManager: TDeviceManage;
  lable: TLabel);
begin
  inherited Create(False);
  FreeOnTerminate := True;
  TDevManager := DevManager;
  lable1 := lable;
end;

destructor TQueryDevTelList.Destroy;
begin
  inherited Destroy;
end;

procedure TQueryDevTelList.Execute;
var
  info: string;
  i, j: integer;
  Dev: TDevice;
  fcount: integer;
  filterStr: string;
  FTemp: Tclientdataset;
  PTel: PTelInfo;
begin
  try
    try
      coinitialize(nil);
      try
        FTemp := Tclientdataset.Create(nil);
        lable1.Caption := '加载车机电话本...';

        info := BS.TQueryDev_TelList;
        FTemp.XMLData := info;
        FTemp.Open;

        FTemp.First;
        for j := 0 to FTemp.RecordCount - 1 do
        begin
          Dev := TDevManager.find(FTemp.FieldByName('Dev_ID').AsString);
          if Dev = nil then
          begin
            FTemp.Next;
            continue;
          end;
          lable1.Caption := '正在加载' + dev.Car.No + '的车载电话信息...';

          PTel := Dev.AddTelInfo(FTemp.FieldValues['TEL_ID']);
          PTel^.No := trim(FTemp.FieldValues['TEL_NUMBER']);
          PTel^.Name := trim(FTemp.FieldValues['TEL_NAME']);
          PTel^.TelType := FTemp.FieldValues['TEL_Type'];

          PTel := FAllDevTelList.AddTelInfo(pTel^.id);
          PTel^.No := trim(FTemp.FieldValues['TEL_NUMBER']);
          PTel^.Name := trim(FTemp.FieldValues['TEL_NAME']);
          PTel^.TelType := FTemp.FieldValues['TEL_Type'];

          FTemp.Next;
        end;
        
      except
        on E: Exception do
          raise Exception.Create(e.Message); 
      end;
    finally
      FTemp.Close;
      FTemp.free;
      lable1.Caption := '';
    end;
  finally
    CoUninitialize;
  end;
end;

{ TQueryDevsEventList }

constructor TQueryDevsEventList.Create(DevManager: TDeviceManage;
  lable: TLabel);
begin
  inherited Create(False);
  FreeOnTerminate := True;
  TDevManager := DevManager;
  lable1 := lable;
end;

destructor TQueryDevsEventList.Destroy;
begin
  inherited Destroy;
end;

procedure TQueryDevsEventList.Execute;
var
  info: string;
  i, j: integer;
  Dev: TDevice;
  fcount: integer;
  filterStr: string;
  FTemp: Tclientdataset;
  PEvent: PEventInfo;
begin
  try
    try
      coinitialize(nil);
      try
        FTemp := Tclientdataset.Create(nil);
        lable1.Caption := '加载车机事件信息...';

        info := BS.TQueryDev_EventList;
        FTemp.XMLData := info;
        FTemp.Open;

        FTemp.First;
        for i := 0 to FTemp.RecordCount - 1 do
        begin
          Dev := TDevManager.find(FTemp.FieldByName('Dev_ID').AsString);
          if Dev = nil then
          begin
            FTemp.Next;
            continue;
          end;

          lable1.Caption := '正在加载' + dev.Car.No + '的事件信息...';

          PEvent := Dev.AddEventInfo(FTemp.FieldValues['EVENT_ID']);
          PEvent.No := StrToInt(trim(FTemp.FieldValues['EVENTNO']));
          PEvent.Info := trim(FTemp.FieldValues['EVENTDESC']);

          PEvent := FAllDevEventList.AddDevEventInfo(PEvent^.id);
          PEvent^.No := StrToInt(trim(FTemp.FieldValues['EVENTNO']));
          PEvent^.Info := trim(FTemp.FieldValues['EVENTDESC']);
          FTemp.Next;
        end;
        
      except on E: Exception do
        raise Exception.Create(e.Message); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    finally
      FTemp.Close;
      FTemp.free;
      lable1.Caption := '';
    end;
  finally
    CoUninitialize;
  end;
end;
//
//{ TQueryPassengerInfo }
//
//constructor TQueryPassengerInfo.Create(aPassengerManage: TPassengerManage);
//begin
//  inherited Create(False);
//  FreeOnTerminate := True;
//  FPassengerManage := aPassengerManage;
//end;
//
//destructor TQueryPassengerInfo.Destroy;
//begin
//  inherited Destroy;
//end;
//
//procedure TQueryPassengerInfo.Execute;
//var
//  info: OleVariant;
//  i: Integer;
//  passenger: TPassenger;
//  FTemp: Tclientdataset;
//begin
//  try
//    try
//      coinitialize(nil);
//      try
//        bs.QueryPassengerInfo(FPassengerManage);
//      except
//        on E: Exception do
//        begin
//          raise Exception.Create(e.Message); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
//        end;
//      end;
//    finally
//    end;
//  finally
//    CoUninitialize;
//  end;
//end;

//{ TQueryHYGLInfo }
//
//constructor TQueryHYGLInfo.Create;
//begin
//  inherited Create(False);
//  FreeOnTerminate := True;
//end;
//
//destructor TQueryHYGLInfo.Destroy;
//begin
//  inherited Destroy;
//end;
//
//procedure TQueryHYGLInfo.Execute;
//begin
//  try
//    try
//      coinitialize(nil);
//      try
//        Bs.QueryHYGLInfo;
//      except
//        on E: Exception do
//        begin
//          raise Exception.Create(e.Message); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
//        end;
//      end;
//    finally
//    end;
//  finally
//    CoUninitialize;
//  end;
//end;

//{ TLoadOrdersFromDB }
//
//constructor TLoadOrdersFromDB.Create;
//begin
//  inherited Create(False);
//  FreeOnTerminate := True;
//end;
//
//destructor TLoadOrdersFromDB.Destroy;
//begin
//  inherited Destroy;
//end;
//
//procedure TLoadOrdersFromDB.Execute;
//begin
//  try
//    try
//      coinitialize(nil);
//      try
//        AOrderManage.LoadOrdersFromDB;
//      except
//        on E: Exception do
//        begin
//          raise Exception.Create(e.Message); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
//        end;
//      end;
//    finally
//    end;
//  finally
//    CoUninitialize;
//  end;
//end;

{ TQueryCarInfo }

constructor TQueryCarInfo.Create;
begin
  inherited Create(False);
  FreeOnTerminate := True;
end;

destructor TQueryCarInfo.Destroy;
begin
  inherited Destroy;
end;

procedure TQueryCarInfo.Execute;
begin
  try
    try
      coinitialize(nil);
      try
        uCarInfo := bs.CarInfo;
        IsQueryCarInfo := True;

        if Assigned(FQueryCarAndDevInfo) then
          FQueryCarAndDevInfo;
      except
        on E: Exception do
        begin
          raise Exception.Create(e.Message); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    finally
    end;
  finally
    CoUninitialize;
  end;
end;

{ FQueryDevInfo }

constructor TQueryDevInfo.Create;
begin
  inherited Create(False);
  FreeOnTerminate := True;
end;

destructor TQueryDevInfo.Destroy;
begin
  inherited Destroy;
end;

procedure TQueryDevInfo.Execute;
begin
  try
    try
      coinitialize(nil);
      try
        uDevInfo := bs.DeviceInfo;
        IsQueryDevInfo := True;

        if Assigned(FQueryCarAndDevInfo) then
          FQueryCarAndDevInfo;
      except
        on E: Exception do
        begin
          raise Exception.Create(e.Message); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    finally
    end;
  finally
    CoUninitialize;
  end;
end;

{ TQueryDevLastPos }

constructor TQueryDevLastPos.Create(devManage: TDeviceManage);
begin
  inherited Create(False);
  FreeOnTerminate := True;

  FDevManage := devManage;
end;

destructor TQueryDevLastPos.Destroy;
begin

  inherited;
end;

procedure TQueryDevLastPos.Execute;
var
  saveCursor: TCursor;
  info: OleVariant;
  tempDataSet: TClientDataSet;
  i, j: Integer;
  dev: TDevice;
  TempLongWord: LongWord;
begin
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  tempDataSet := nil;
  CoInitialize(nil);
  try
    try
      info := Bs.GetDevLastPos;
      if (Info = null) or (Length(info) = 0) then  Exit;

      tempDataSet := TClientDataSet.Create(nil);
      tempDataSet.XMLData := info;
      tempDataSet.Open;
      tempDataSet.First;

      for j := 0 to tempDataSet.RecordCount - 1 do
      begin
        dev := FDevManage.find(Trim(tempDataSet.FieldByName('dev_id').AsString));
        if dev <> nil then
        begin
          dev.GpsTime := tempDataSet.FieldByName('gpstime').AsDateTime;
          dev.Longitude := tempDataSet.FieldByName('longitude').AsFloat / 1000000;
          dev.Latitude := tempDataSet.FieldByName('latitude').AsFloat / 1000000;
          dev.Course := tempDataSet.FieldByName('odometer').AsFloat / 10;
          dev.OilVolume := tempDataSet.FieldByName('oilgauge').AsFloat / 10;
          dev.Speed := tempDataSet.FieldByName('speed').AsInteger;
          dev.Altitude := tempDataSet.FieldByName('height').AsInteger;
          dev.Orientation := tempDataSet.FieldByName('orientation').AsInteger;

          TempLongWord := tempDataSet.FieldByName('state').AsVariant; //取状态
          for i := 0 to 31 do             // 总共是32位，后面的数据保留
          begin
            dev.Switch[i] := (TempLongWord and $1) = $1;
            TempLongWord := TempLongWord shr 1;
          end;

          TempLongWord := tempDataSet.FieldByName('alarmflag').AsVariant;  // 取报警标志
          for i := 0 to 31 do
          begin
            dev.Switch_Warning[i] := (TempLongWord and $1) = $1;
            TempLongWord := TempLongWord shr 1;
          end;

          dev.Login_DriverName := Trim(tempDataSet.FieldByName('drivername').AsString);
          dev.Login_Driver := Trim(tempDataSet.FieldByName('driversfzh').AsString);
          if (dev.Login_Driver = '') and (dev.Login_DriverName = '') then
          begin
            dev.Login_Driver := '未登录';
          end;  
        end;
        tempDataSet.Next;
      end;
    except
      on E: Exception do
      begin

      end;
    end;
  finally
    if tempDataSet <> nil then
    begin
      tempDataSet.Close;
      tempDataSet.Free;
    end;
    CoUninitialize;
    Screen.Cursor := saveCursor;
  end;
end;

{ TQueryInfoTypes }

constructor TQueryInfoTypes.Create(AInfoTypes: TInfoTypeManage;
  ADevs: TDeviceManage; lbl: TLabel);
begin
  inherited Create(False);
  FreeOnTerminate := True;
  Self.AInfoTypeManage := AInfoTypes;
  Self.lable1 := lbl;
  Self.ADevsManage := ADevs;
end;

destructor TQueryInfoTypes.Destroy;
begin
  inherited Destroy;
end;

procedure TQueryInfoTypes.Execute;
var
  tmpCDS: TClientDataSet;
  info: string;
  i: Integer;
  infoType: TInfoType;
  devInfo: TInfo;
  sTime: TDateTime;
  dev: TDevice;
  t1, t2: TDateTime;
begin
  try
    try
      coinitialize(nil);
      try
        tmpCDS := Tclientdataset.Create(nil);
        lable1.Caption := '加载车机信息点播信息类型...';

        info := BS.QueryAllInfoTypes;
        if (info = null) or (info = '') then
          Exit;

        tmpCDS.XMLData := info;
        tmpCDS.Open;

        tmpCDS.First;
        for i := 0 to tmpCDS.RecordCount - 1 do
        begin
          infoType := Self.AInfoTypeManage.AddInfoType(tmpCDS.FieldByName('id').AsInteger);
          infoType.InfoTypeId := tmpCDS.FieldByName('typeid').AsInteger;
          infoType.InfoTypeName := tmpCDS.FieldByName('typename').AsString;
          infoType.Memo := tmpCDS.FieldByName('memo').AsString;

          tmpCDS.Next;
        end;

        lable1.Caption := '加载车机信息点播信息内容...';
//        sTime := Now;
//        sTime := IncMinute(sTime, -5);
        info := Bs.QueryInfo('', '');
        if (info <> null) and (info <> '') then
        begin
          tmpCDS.XMLData := info;
          tmpCDS.Open;

          tmpCDS.First;
          t1 := Now;
          for i := 0 to tmpCDS.RecordCount - 1 do
          begin
            infoType := AInfoTypeManage.FindInfoType(tmpCDS.FieldByName('typeid').AsInteger);
            if infoType <> nil then
            begin
              devInfo := infoType.AddInfo(tmpCDS.FieldByName('id').AsInteger);
              devInfo.InfoContent := tmpCDS.FieldByName('infocontent').AsString;
              devInfo.SendTime := tmpCDS.FieldByName('sendtime').AsDateTime;
              devInfo.Memo := tmpCDS.FieldByName('memo').AsString;

              //在当前时间5分钟之前的就认为已经发过了
              t2 := devInfo.SendTime;
              ReplaceDate(t2, t1);
              if (t2 < t1) and (MinutesBetween(t1, t2) >= 5) then
                devInfo.IsSent := True; 
            end;

            tmpCDS.Next;
          end;
        end;

        lable1.Caption := '加载车机点播列表...';
        info := Bs.QueryDevInfoType();
        if (info <> null) and (info <> '') then
        begin
          tmpCDS.XMLData := info;
          tmpCDS.Open;

          tmpCDS.First;
          for i := 0 to tmpCDS.RecordCount - 1 do
          begin
            dev := ADevsManage.find(tmpCDS.FieldByName('dev_id').AsString);
            if dev <> nil then
            begin
              infoType := AInfoTypeManage.FindInfoTypeByTypeId(tmpCDS.FieldByName('typeid').AsInteger);
              if infoType <> nil then
              begin
                dev.AddInfoTypeId(infoType.InfoTypeId);
                infoType.AddDevId(dev.Id);
              end;  
            end;

            tmpCDS.Next;
          end;
        end;  
      except on E: Exception do
        raise Exception.Create(e.Message); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
      end;
    finally
      tmpCDS.Close;
      tmpCDS.free;
      lable1.Caption := '';
    end;
  finally
    CoUninitialize;
  end;
end;

{ TQueryNotices }

constructor TQueryNotices.Create;
begin
  inherited Create(False);
  FreeOnTerminate := True;
end;

destructor TQueryNotices.Destroy;
begin
  inherited Destroy;
end;

procedure TQueryNotices.Execute;
begin
  GetData;
end;

procedure TQueryNotices.GetData;
var
  noticeCount: Integer;
  sDt, eDt: TDateTime;
  pageSize, pageCount: Integer;
  i: Integer;

  notice: TNotice;
begin
  eDt := Now;
  sDt := IncMonth(eDt, -1);
  FNoticeManage.Clear;
  try
    coinitialize(nil);
    try
//      notice := FNoticeManage.Add(1);
//      notice.Content := '1.增加服务器，提高访问速度。2.优化电信网络。';
//      notice.IsRead := 1;
//      notice.Title := '中心升级';
//
//      notice := FNoticeManage.Add(2);
//      notice.Content := '请更改网关地址为:112.2.33.3，然后重新登录系统，谢谢配合！！！';
//      notice.Title := '更改网关地址';
//      notice.IsRead := 1;
//
//      if Assigned(FQueryCarAndDevInfo) then
//        FQueryCarAndDevInfo;
//      Exit;

      noticeCount := bs.QueryNoticeCount(FormatDateTime('yyyy-MM-dd hh:nn:ss', sDt), FormatDateTime('yyyy-MM-dd hh:nn:ss', eDt), 1);//默认查询当前时间往前1个月到现在的未读的消息

      if noticeCount > 0 then
      begin
        pageSize := 50;

        if noticeCount mod pageSize = 0 then
        begin
          pageCount := noticeCount div pageSize;
        end
        else
        begin
          pageCount := noticeCount div pageSize + 1;
        end;

        for i := 0 to pageCount - 1 do
        begin
          Bs.QueryNotice(FormatDateTime('yyyy-MM-dd hh:nn:ss', sDt), FormatDateTime('yyyy-MM-dd hh:nn:ss', eDt), 1, pageSize, i + 1);
        end;
        if Assigned(FQueryCarAndDevInfo) then
          FQueryCarAndDevInfo;
      end;
    except
      on E: Exception do
      begin
      end;
    end;
  finally
    CoUninitialize;
  end;
end;

{ TQueryNoticeCount }

constructor TQueryNoticeCount.Create(sTime, eTime: string;
  isRead: Integer);
begin
  inherited Create(False);
  FreeOnTerminate := True;
  
  FSTime := sTime;
  FETime := eTime;
  FIsRead := isRead;
end;

destructor TQueryNoticeCount.Destroy;
begin
  inherited Destroy;
end;

procedure TQueryNoticeCount.Execute;
var
  dataCount: Integer;
begin
  try
    coinitialize(nil);
    try

      dataCount := bs.QueryNoticeCount(FSTime, FETime, FIsRead);//默认查询当前时间往前1个月到现在的未读的消息

      if Assigned(FQueryNoticeCount) then
        FQueryNoticeCount(dataCount);
    except
      on E: Exception do
      begin
      end;
    end;
  finally
    CoUninitialize;
  end;
end;

{ TQueryNoticeData }

constructor TQueryNoticeData.Create(sTime, eTime: string; isRead, pageSize,
  currPageIndex: Integer);
begin
  inherited Create(False);
  FreeOnTerminate := True;
  
  FSTime := sTime;
  FETime := eTime;
  FIsRead := isRead;
  FPageSize := pageSize;
  FPageIndex := currPageIndex;
end;

destructor TQueryNoticeData.Destroy;
begin
  inherited Destroy;
end;

procedure TQueryNoticeData.Execute;
begin
  try
    coinitialize(nil);
    try

      FInfo := bs.QueryNoticeInfo(FSTime, FETime, FIsRead, FPageSize, FPageIndex);//默认查询当前时间往前1个月到现在的未读的消息
      Synchronize(setData);
    except
      on E: Exception do
      begin
      end;
    end;
  finally
    CoUninitialize;
  end;
end;

procedure TQueryNoticeData.setData;
begin
  if Assigned(FQueryNoticeInfo) then
    FQueryNoticeInfo(FInfo);
end;

{ TQueryMediaData }

constructor TQueryMediaData.Create(queryMediaType: Integer; querySTime,
  queryETime: string; queryPhotoReason, queryCamerano: Integer; queryCarNo,
  querySim_no, queryDevId: string; queryGroupId: Integer;
  queryGroupList: string; pageSize, currPageIndex: Integer);
begin
  inherited Create(False);
  FreeOnTerminate := True;

  FqueryMediaType := queryMediaType;
  FquerySTime := querySTime;
  FqueryETime := queryETime;
  FqueryPhotoReason := queryPhotoReason;
  FqueryCamerano := queryCamerano;
  FqueryCarNo := queryCarNo;
  FquerySim_no := querySim_no;
  FqueryDevId := queryDevId;
  FqueryGroupId := queryGroupId;
  FqueryGroupList := queryGroupList;
  FPageSize := pageSize;
  FPageIndex := currPageIndex;
end;

destructor TQueryMediaData.Destroy;
begin
  inherited Destroy;
end;

procedure TQueryMediaData.Execute;
begin
  try
    coinitialize(nil);
    try

      FInfo := bs.QueryMediaDataByPage(FqueryMediaType, FquerySTime, FqueryETime, FqueryPhotoReason, FqueryCamerano,
                                      FqueryCarNo, FquerySim_no, FqueryDevId, FqueryGroupId, FqueryGroupList, FPageSize, FPageIndex);
      Synchronize(setData);
    except
      on E: Exception do
      begin
      end;
    end;
  finally
    CoUninitialize;
  end;
end;

procedure TQueryMediaData.setData;
begin
  if Assigned(FQueryData) then
    FQueryData(FInfo);
end;

{ TQueryMediaCount }

constructor TQueryMediaCount.Create(queryMediaType: Integer; querySTime,
  queryETime: string; queryPhotoReason, queryCamerano: Integer; queryCarNo,
  querySim_no, queryDevId: string; queryGroupId: Integer;
  queryGroupList: string);
begin
  inherited Create(False);
  FreeOnTerminate := True;

  FqueryMediaType := queryMediaType;
  FquerySTime := querySTime;
  FqueryETime := queryETime;
  FqueryPhotoReason := queryPhotoReason;
  FqueryCamerano := queryCamerano;
  FqueryCarNo := queryCarNo;
  FquerySim_no := querySim_no;
  FqueryDevId := queryDevId;
  FqueryGroupId := queryGroupId;
  FqueryGroupList := queryGroupList;
end;

destructor TQueryMediaCount.Destroy;
begin
  inherited Destroy;
end;

procedure TQueryMediaCount.Execute;
var
  dataCount: Integer;
begin
  try
    coinitialize(nil);
    try

      dataCount := bs.QueryMediaCount(FqueryMediaType, FquerySTime, FqueryETime, FqueryPhotoReason, FqueryCamerano,
                                      FqueryCarNo, FquerySim_no, FqueryDevId, FqueryGroupId, FqueryGroupList);
      if Assigned(FQueryCount) then
        FQueryCount(dataCount);
    except
      on E: Exception do
      begin
      end;
    end;
  finally
    CoUninitialize;
  end;
end;

{ TQueryDevLastPic }

constructor TQueryDevLastPic.Create(dev: TDevice);
begin
  inherited Create(False);
  FreeOnTerminate := True;
  FDev := dev;
end;

destructor TQueryDevLastPic.Destroy;
begin
  inherited Destroy;
end;

procedure TQueryDevLastPic.Execute;
var
  pic: PicInfo;
begin
  pic := nil;
  try
    coinitialize(nil);
    try

      pic := bs.QueryLatestPic(FDev.IdStr);
    except
      on E: Exception do
      begin
        pic := nil;
      end;
    end;
  finally
    CoUninitialize;
  end;
  FDev.setLastFatigueAlarmPicData(pic);
end;

{ TQueryDataCountThread }

constructor TQueryDataCountThread.Create(queryCondition: TQueryCondition);
begin
  inherited Create(False);
  FQueryCondition := queryCondition;
  FreeOnTerminate := True;
end;

destructor TQueryDataCountThread.Destroy;
begin
  inherited Destroy;
end;

procedure TQueryDataCountThread.Execute;
var
  dataCount: Integer;
begin
  try
    coinitialize(nil);
    try
      dataCount := 0;
      case FQueryCondition.Flag of
        1:
        begin
          with FQueryCondition do
          begin
            dataCount := Bs.QueryDevUploadMileageCount(QueryFlag, STime, ETime, DevId, GroupId, GroupIdList);
          end;
        end;
        2:
        begin
          with FQueryCondition do
          begin
            dataCount := Bs.QuerySetCarRunstatePlanCount(STime, ETime, DevId, GroupId, GroupIdList);
          end;  
        end;
      end;
      
      if Assigned(FOnQueryDataCount) then
        FOnQueryDataCount(dataCount);
    except
      on E: Exception do
      begin
      end;
    end;
  finally
    CoUninitialize;
  end;
end;

procedure TQueryDataCountThread.SetOnQueryDataCount(
  const Value: TOnQueryDataCount);
begin
  FOnQueryDataCount := Value;
end;

{ TQueryDataThread }

constructor TQueryDataThread.Create(queryCondition: TQueryCondition);
begin
  inherited Create(False);
  FQueryCondition := queryCondition;
  FreeOnTerminate := True;
end;

destructor TQueryDataThread.Destroy;
begin
  inherited Destroy;
end;

procedure TQueryDataThread.Execute;
begin
  try
    coinitialize(nil);
    try
      case FQueryCondition.Flag of
        1:
        begin
          with FQueryCondition do
          begin
            FInfo := Bs.QueryDevUploadMileageData(QueryFlag, STime, ETime, DevId, GroupId, GroupIdList, PageSize, CurrPageIndex);
          end;
        end;
        2:
        begin
          with FQueryCondition do
          begin
            FInfo := Bs.QuerySetCarRunStatePlanData(STime, ETime, DevId, GroupId, GroupIdList, PageSize, CurrPageIndex);
          end;  
        end;  
      end;
      
      Synchronize(setData);
    except
      on E: Exception do
      begin
      end;
    end;
  finally
    CoUninitialize;
  end;
end;

procedure TQueryDataThread.setData;
begin
  if (FInfo <> '') and Assigned(FOnQueryData) then
    FOnQueryData(FInfo);
end;

procedure TQueryDataThread.SetOnQueryData(const Value: TOnQueryDataByPage);
begin
  FOnQueryData := Value;
end;

end.


