{智能监控端 与  网关的通讯
 @created(2004-03-19)
 @lastmod(GMT:$Date: 2012/12/31 05:06:19 $) <BR>
 最后更新人:$Author: wfp $<BR>
 当前版本:$Revision: 1.3 $<BR>}

 {2005.03.25
   原接收网关的数据 ，用定时器，后改为线程，
      现在因接收到参数设置的应答时，需写入到数据库，调用UpdateDevPrm，此时会出错。
   现 再将线程处理 改为定时器，正确。
 }
unit GatewayServerUnit;

interface
uses
  CmdStructUnit, Windows, Winsock, extctrls, sysutils, ScktCompUnit, math, SyncObjs,
  CarUnit, ConstDefineUnit, IntegerListUnit, ScktComp, Types, BusinessServerUnit,
  classes, {OrderUnit, SendOrderMiniFrmUnit,} WleiConstDefineUnit, ConfineAreaUnit,
  MetaDefine, Service, LatticesUnit, Graphics, SystemLog, ActiveX, DisposeCarUnit;

const
  SAVE_CMD_COUNT = 300; //保存多少条最近执行的命令信息

type

  TSendMsg = procedure(ADevID: string; AType: Byte; MsgStr: string) of object;
  //收到车机上传的一张照片
  TPicUpload = procedure(ADev: TObject; PicIndex: Integer;PicReson: Byte; Pic: PicInfo) of object;
  TAudioUpload = procedure(ADev: TObject; AudioId: Integer) of object;
  TVideoUpload = procedure(ADev: TObject; VideoId: Integer) of object;
  TEventListUpLoad = procedure(ADev: TObject; EventInfo: string; dateTime: TDateTime) of object;
  TLightStateListUpLoad = procedure(QueryType: Byte; ADev: TObject; Buf: PByte) of object;
  TQueryPicture = procedure(Buff: PByte; Count: Word; ADev: TObject; Reason: string) of object;
  TQueryAudio = procedure(Buff: PByte; Count: Word; ADev: TObject; Reason: string) of object;
  TServeJudge = procedure (pBuf: PByte; Dev: TDevice) of object;
  TAnswerListUpLoad = procedure(ADev: TObject; Question: string; Answer: string; dateTime: TDateTime) of object;
  TOnReadData = procedure(Buff: Pointer; NumLength: integer) of object;
  TONSendDelete = procedure(Main_Id: integer; AssistantDev_IDstr: string; isdeleteAssistant: boolean) of object;
  {读取到车机内存储的照片时间范围 sha 20090120
    ABuf 各类照片张数，目前共计12类}
  TReadDevPicTimesInfoRet = procedure (ADev: TDevice;ANoPicBj:Boolean;
    FirstDateTime,LastDateTime:String;ABuf:PByte;BufCount:Integer)of object;
   {收到车机上传调度单状态变化}
  TOnRcvDevUploadAttemperStateChgEvent = procedure (AttemperId:Integer)of object;
  TSendRegUser = procedure(backNumber: integer) of object; //处理注册信息
  TOnDriverCancelOrder = procedure(orderId: Integer; reasonId: Byte) of object;
  TOnAreaAlarmUpload = procedure(dev: TDevice; area: TBaseArea; alarmType: Byte) of object;//电子围栏报警上传
  TOnERunDataUpload = procedure(eRunData: TERunDataUpload) of object;//电子运单
  TOnDriverInfoUpload = procedure(driverInfo: TDriverInfoUpload) of object;//驾驶员身份信息采集上报
  TOnTSPDataUpload = procedure(dev: TDevice; msgType: Integer; msg: string) of object;// 透传数据上传
  TOnMediaEventUpload = procedure(mediaEvent: RecMediaEventUpload) of object;//多媒体事件信息上传
  TOnMediaDataUpload = procedure(dev: TDevice; mediaData: TMediaDataUpload_V3) of object;
  TOnAudioDataUpload = procedure(dev: TDevice; mediaData: TMediaDataUpload_V3) of object;
  TOnVideoDataUpload = procedure(dev: TDevice; mediaData: TMediaDataUpload_V3) of object;
  TOnRefreshAreaDevList = procedure(areaType: Byte; flag: Byte) of object;
  TOnRefreshAlarmDealStatus = procedure(alarmInfoId: Integer) of object;
  TOnRefreshSrvRunInfo = procedure(srvRunInfo: RecSrvRunInfo) of object;
  TOnRunRecDataUpload = procedure(cmdFlag: Byte; runRecData: TByteDynArray; dev: TDevice) of object;
  TOnAlarmSupervise = procedure(alarmSupervise: TAlarmSupervise) of object;
  TOnGovInfo = procedure(govInfo: TGovInfo) of object;
  TOnGovAlarmInfo = procedure(govAlarm: TGovAlarmInfo) of object;
  TOnGovGpsData = procedure(dev: TDevice) of object;
  TOnDevKeyEvent = procedure(dev: TDevice; msgTitle, msgContent: string) of object;

  TCmdInfo = record //命令信息
    Id: integer; //命令ID
    Dev: TDevice;
    Flag: integer; //这是什么命令;
    DevId: String; //车机ID
    State: Byte; //0表示已发送未执行，1表示已执行，2表示执行出错，3表示被用户取消 , 4表示已取消,5表示取消失败，6表示重发  7-被删除，8-被替代 9-超时 10-表示已经发送到SMS发送服务器
    Desc: string; //命令描述
    SendTime: Tdatetime; //发出时间
    Replytime: Tdatetime; //执行完时间
    CancelTime: Tdatetime; //被取消时间
    Content: TByteDynArray; //命令体的内容
    ContentSize: Integer;
    addesc: integer; //广告状态
    AnswerList: TIntegerList;
    QuestionInfo: string;
    DeleteArea: Boolean;
    IsDeleteArea: Boolean;//删除区域与车机的对照关系后是否从数据库和地图上删除该区域
    AreaList: TStringList;
    DeleteAdInfo: Boolean;
    AdInfo: string;
    PictureType: Byte;
    ClientUpPic: Boolean;
    MCUPicIndex: Integer;
    SendV3: Boolean;
    Reason: string; // 检索拍照/音频的原因
    MsgId: Integer;
    CarControlContent:Byte;//车辆控制内容
    areaId: Integer;//设置到车机的区域ID
    areaSetType: Byte;//1:更新 2：追加 3：修改  (协议中类型设置：0:更新 1：追加 2：修改 )
    alarmInfoId: Integer;
    alarmDealFlag: Byte;//报警处理的方式 1：监听 2：拍照 3：文本 
//    isNoTips: Boolean;// 不显示弹出提示
  end;
  PCmdInfo = ^TCmdInfo;

  //-------------命令管理器
  TCmdManage = class
  private
    FList: TintegerList;
    FMax_count: integer;
    function GetCount: integer;
    function GetItems(Index: Integer): PCmdInfo;
    procedure SetMax_count(const Value: integer);
  public
    constructor Create;
    destructor Destroy; override;

    function Add(const ACmdID: Integer): PCmdInfo; //--添加一个命令
    function Find(const ACmdID: Integer): PCmdInfo; //  寻找一个命令
    function FindByDevID(const DevID: string; MCUPicIndex: Integer): PCmdInfo; // 寻找一个命令
    procedure Delete(const ACmdID: Integer); //  删除一个命令
    procedure ClearCmd; //清除所有命令}
    property count: integer read GetCount; //---命令的条数
    property Max_count: integer read FMax_count write SetMax_count; //----命令的最大条数;
    property Items[Index: Integer]: PCmdInfo read GetItems; //======根据索引获得  信息
  end;

  TGateWayServerCom = class
  private
    FComVer: TVer;
    FClientVer: TVer;
    FSocket: TClientSocketThread;
    FActive: Boolean;
    FAutoLogin: Boolean;
    FPort: Integer;
    FAddress: string;
    FUserPass: string;
    FUserId: Integer;
    FHost: string;
    FMaxCmdID_Word: word;
    FMaxCmdId: Integer;
    FReadBuf: TSocketBuffer;
    FTimer: TTimer;
    FServerSendMsg: string;
    FIsGetAllPos: boolean;
    FOnSendMsg: TSendMsg;
    FPicUpload: TPicUpload;
    FAudioUpload: TAudioUpload;
    FEventListUpLoad: TEventListUpLoad;
    FLightStateListUpLoad: TLightStateListUpLoad;
    FQueryPicture: TQueryPicture;
    FServeJudge: TServeJudge;
    FAnswerListUpLoad: TAnswerListUpLoad;
    FONSendDelete: TONSendDelete;
    FOnReadDevPicTimesInfoRet: TReadDevPicTimesInfoRet;
    FOnDevUploadAttemperStateChg: TOnRcvDevUploadAttemperStateChgEvent;
    FSendRegUser: TSendRegUser;

    FOnDriverCancelOrder: TOnDriverCancelOrder;
    FOnAreaAlarmUpload: TOnAreaAlarmUpload;
    FOnERunDataUpload: TOnERunDataUpload;
    FOnDriverInfoUpload: TOnDriverInfoUpload;
    FOnMediaDataUpload: TOnMediaDataUpload;
    FOnRefreshAreaDevList: TOnRefreshAreaDevList;
    FQueryAudio: TQueryAudio;
    FOnAudioDataUpload: TOnAudioDataUpload;

    FIsOnLineRecved: Boolean;
    FIsOffLineRecved: Boolean;
    FOnMediaEventUpload: TOnMediaEventUpload;
    FOnRefreshAlarmDealStatus: TOnRefreshAlarmDealStatus;
    FOnRefreshSrvRunInfo: TOnRefreshSrvRunInfo;
    FOnRunRecDataUpload: TOnRunRecDataUpload;
    FOnAlarmSupervise: TOnAlarmSupervise;
    FOnVideoDataUpload: TOnVideoDataUpload;
    FVideoUpload: TVideoUpload;
    FOnGovInfo: TOnGovInfo;
    FOnGovAlarmInfo: TOnGovAlarmInfo;
    FOnGovGpsData: TOnGovGpsData;
    FOnTSPDataUpload: TOnTSPDataUpload;
    FOnDevKeyEvent: TOnDevKeyEvent;

    function GetClientVer: TVer;
    function GetComVer: TVer;


    function PtrAdd(p: pointer; offset: integer): pointer;
    procedure SetActive(const Value: Boolean);
    procedure SetAddress(const Value: string);
    procedure SetAutoLogin(const Value: Boolean);
    procedure SetHost(const Value: string);
    procedure SetPort(const Value: Integer);
    procedure SetUserPass(const Value: string);

    procedure FTimerTimer(Sender: TObject);
    procedure SetUserId(const Value: Integer);
    function GetActive: Boolean;
    procedure SetServerSendMsg(const Value: string);
    function isActive: boolean;
    procedure isSendSuccessFailPop(Ret: byte; Dec: string);
    procedure SetONSendDelete(const Value: TONSendDelete);
    procedure SetOnReadDevPicTimesInfoRet(
      const Value: TReadDevPicTimesInfoRet);
//    function ReadAllDriverNO: boolean;
    procedure SetOnDevUploadAttemperStateChg(
      const Value: TOnRcvDevUploadAttemperStateChgEvent);
    procedure SetSendRegUser(const Value: TSendRegUser);
    procedure SetOnDriverCancelOrder(const Value: TOnDriverCancelOrder);

    procedure FSocketSocketEvent(Sender: TObject; Socket: TCustomWinSocket; SocketEvent: TSocketEvent);
    procedure FSockerWriteBufferOverflow(Sender: TObject);
    procedure SendMsg(ADevID: string; AType: Byte; MsgStr: string);
    procedure SendDelete(Main_Id: integer; AssistantDev_IDstr: string; isdeleteAssistant: boolean);
    procedure SetIsOnline(ADevID: String; ARet: integer);
    procedure SetOnAreaAlarmUpload(const Value: TOnAreaAlarmUpload);
    procedure SetOnERunDataUpload(const Value: TOnERunDataUpload);
    procedure SetOnDriverInfoUpload(const Value: TOnDriverInfoUpload);
    procedure SetOnMediaDataUpload(const Value: TOnMediaDataUpload);
    procedure SetOnRefreshAreaDevList(const Value: TOnRefreshAreaDevList);
    procedure SetOnAudioDataUpload(const Value: TOnAudioDataUpload);
    procedure SetOnMediaEventUpload(const Value: TOnMediaEventUpload);
    procedure SetOnRefreshAlarmDealStatus(
      const Value: TOnRefreshAlarmDealStatus);
    procedure SetOnRefreshSrvRunInfo(const Value: TOnRefreshSrvRunInfo);
    procedure SetOnRunRecDataUpload(const Value: TOnRunRecDataUpload);
    procedure SetOnAlarmSupervise(const Value: TOnAlarmSupervise);
    procedure SetOnVideoDataUpload(const Value: TOnVideoDataUpload);
    procedure SetOnGovInfo(const Value: TOnGovInfo);
    procedure SetOnGovAlarmInfo(const Value: TOnGovAlarmInfo);
    procedure SetOnGovGpsData(const Value: TOnGovGpsData);
    procedure SetOnTSPDataUpload(const Value: TOnTSPDataUpload);
    procedure SetOnDevKeyEvent(const Value: TOnDevKeyEvent);
  protected
    procedure Execute;
    function SendComVer: Boolean; //发送通讯协议版本
    function LoginToServer: Boolean; // 用户登录网关服务器
    procedure InitHeader(var header:THead_V3;size:Word;cmdFlag:Byte;devId:string);
    procedure InitHeaderHRB(var header:THeadHRB_V3;size:Word;cmdFlag:Byte;devId:string);
    procedure InitTSPHeader(var header: TCmdTSPHead_V3; size: Word; cmdFlag: Word; devId: string);
    procedure InitTSPHeaderHRB(var header: TCmdTSPTHeadHRB_V3; size: Word; cmdFlag: Word; devId: string);
    function GetMaxCmdID: Integer; // 获得当前可用的最大的命令ID
    function GetMaxCmdIdWord: Word;// 获得当前可用的最大的命令ID
    function DirectSend(var buf; ABufSize: Integer): Boolean; //调用内部的发送函数直接发送数据
    procedure DealReceiveData; virtual; //处理 接收到的服务器数据,这里主要是分检工作
    procedure DisposeReceiveData;
    procedure DisposeOhterReceiveData;
    procedure DealRegUserData(ABuf: PByte); //处理　注册用户　回复数据
    {function TransSendToDTECmd <br>
     转为 向连接的其他的DTE发送数据 命令内容
     @Adata : TByteDynArray 用户输入内容
     @Return: TByteDynArray 加入命令头尾及校验
    }
    function TransSendToDTECmd(Adata: TByteDynArray): TByteDynArray;
    //for _V2
    procedure DealReadAreaForDev(ABuf: PByte); //处理读取电子围栏
    procedure DealDeleteAreaList(ABuf: PByte); //处理取消电子围栏
    procedure DealGetAreamIDArea(ABuf: PByte); //处理得到区域ID号

  public
    //constructor Create(CreateSuspended: Boolean);
    constructor Create;
    destructor Destroy; override;
    //destructor Destroy; override;
    function RepeatSend(ACmdId: integer): boolean;

    { Procedure: GetLastPos<br>
     获得一个车机的最后的位置
     @param const ATargetID: Integer 指定的车机ID
     @Return Boolean
     @see @link()}
    function GetLastPos(const ADeviceID: Integer; SaveToCmdManage: boolean = true): Boolean;
   { Procedure: GetAllPos<br>
     获得所有的车机的最后的位置
     @Return Boolean
     @see @link()}
    function GetAllPos(SaveToCmdManage: boolean = false): Boolean;
   { Procedure: GetStat<br>
     获得目标的状态参数
     @param const ATargetID: Integer 目标的ID
     @Return Boolean
     @see @link()}
    function GetStat(const ADeviceID: Integer): Boolean;
   { Procedure: CallTarget<br>
     呼叫指定的车辆----//跟踪指定车辆
     @param const ATargetID: Integer; 目标ID
     @param const AFreq: Word 呼叫频率 每多少S回报一次数据
     @param const AHoldTime: Word; 呼叫持续的时间
     @param const AnAvailTime: Byte 该命令的有效期（分钟），超时没执行就取消
     @Return Boolean
     @see @link()}
    function CallTarget(const ATargetID: Integer): Boolean; overload;
    function CallTarget(const ATargetID: Integer; const AFreq, AHoldTime: Word; const AnAvailTime: Byte): Boolean; overload;
   { Procedure: ControlTarget<br>
     进行反控操作
     @param const ATargetID: Integer; 目标ID
     @param const ASwitch: Byte; 开关ID
     @param const ASwitchStat: Boolean 开关状态 True 为吸合 False为断开
     @Return Boolean
     @see @link()}
    function ControlTarget(const ATargetID: Integer; const ASwitch: Byte; const ASwitchStat: Boolean): Boolean;
    { Procedure: PingServer<br>
     发送网络联接测试包
     @Return Boolean
     @see @link()}
    function PingServer: Boolean;
    //取消正在执行或在命令列表中的命令
    function CancelCmd(ACmdToboCancelId: integer): boolean;
    //向连接的其他的DTE发送数据
    function SendToDTE(const ADeviceID: integer; Adata: TByteDynArray): boolean;

    //发送简短消息到设备
//    function SendMsg2Dev(const ADeviceID,AMsgType:integer;const AMsgContent: String):boolean;
  protected // for _v3
    procedure DealGPSData_v3(ABuf: PByte);
    procedure DealLastGpsData_V3(ABuf: PByte);
    procedure DealFindPostion_V3(ABuf: PByte; cmdNo: Integer);
    procedure DealPursuePostion_V3(ABuf: PByte);
    procedure DealControlCar_V3(ABuf: PByte);
    procedure DealReadDevParam_V3(ABuf: PByte);
    //收到 通用命令应答
    procedure DealTYData_v3(ABuf: PByte);
    procedure DealLogin_In_V3(ABuf: PByte);
    procedure DealLogin_In_V3_9F(ABuf: PByte);
    procedure DealLogin_Out_V3(ABuf: PByte);
    //车机 上传事件报告
    procedure DealReportEvent_V3(ABuf: PByte);
    procedure DealReportAnswer_V3(ABuf: PByte);
    procedure DealMediaUploadOK_V3(ABuf: PByte);
    procedure DealAPicUpload_V3(ABuf: Pbyte);
    procedure DealAAudioUpload_V3(ABuf: PByte);
    procedure DealAVideoUpload_V3(ABuf: PByte);
    procedure DealMCU_V3(ABuf: PByte);
    procedure DealPolling_Mcu_V3(ABuf: PByte);
    procedure DealLED_V3(ABuf: PByte);
    procedure DealSend_V3(ABuf: PByte);
    procedure DealLCD_V3(ABuf: PByte);
    procedure DealMeter_v3(ABuf: PByte);
    procedure DealTSM_V3(ABuf: PByte);
    procedure DealANTIFAKE_V3(ABuf: PByte);
//    procedure DealOrderStateChange_V3(ABuf: PByte);
//    procedure DealDriverCancelOrder_V3(ABuf: PByte);
//    procedure DealOrderDone_V3(ABuf: PByte);
    procedure DealQueryMcuState_V3(QueryType: Byte; dev: TDevice; ABuf: PByte);
    procedure DealQueryPicture_V3(Buf: PByte);
    procedure DealQueryAudio_V3(Buf: PByte);
    procedure DealSeveJudge_V3(pBuf: PByte);
    procedure DealFindBlaceVer_V3(pBuf: PByte);
    procedure DealSaveDRundata_V3(pBuf: PByte);
    procedure DealDevOnline_V3(pBuf: PByte);
    procedure DealDevAreaAlarm_V3(ABuf: PByte);
    procedure DealTransparentData_V3(ABuf: PByte);
    procedure DealServerRunInfo_V3(ABuf: PByte);
//-------------------------------政府平台数据-------------------------------
    procedure DealAlarmSupervise_V3(ABuf: PByte);
    procedure DealCheckDuty_V3(ABuf: PByte);
    procedure DealGovTextInfo_V3(ABuf: PByte);
    procedure DealGovEarlyWarning_V3(ABuf: PByte);
    procedure DealGovAlarm_V3(ABuf: PByte);
    procedure DealGovGpsDataCount_V3(ABuf: PByte);
    procedure DealGovGpsData_V3(ABuf: PByte);
    procedure DealGovStartGpsData_V3(ABuf: PByte);
    procedure DealGovEndGpsData_V3(ABuf: PByte);
//-------------------------------政府平台数据-------------------------------
    procedure DisposeTransparentData_V3(ABuf: PByte; cmdNo: Integer);
    procedure DealReadDevParamTSP_V3(ABuf: PByte; cmdNo: Integer);
    procedure DealGpsDataTSP_V3(ABuf: PByte; cmdNo: Integer);
    procedure DealEventUploadTSP_V3(ABuf: PByte; cmdNo: Integer);
    procedure DealQuestionAnswer_V3(ABuf: PByte; cmdNo: Integer);
    procedure DealInfoMenu_V3(ABuf: PByte; cmdNo: Integer);
    procedure DealDevControl_V3(ABuf: PByte; cmdNo: Integer);
    procedure DealRunRecDataUpload_V3(ABuf: PByte; cmdNo: Integer);
    procedure DealERunDataUpload_V3(ABuf: PByte; cmdNo: Integer);
    procedure DealDriverInfoUpload_V3(ABuf: PByte; cmdNo: Integer);
    procedure DealMediaEventUpload_V3(ABuf: PByte; cmdNo: Integer);
    procedure DealMediaDataUpload_V3(ABuf: PByte; cmdNo: Integer);
    procedure DealTSPDataUpload_V3(ABuf: PByte; cmdNo: Integer);
    procedure DealCompressedDataUpload_V3(ABuf: PByte; cmdNo: Integer);
    procedure DealDriverLogin_V3(ABuf: PByte; cmdNo: Integer);
    procedure DealDriverLogout_V3(ABuf: PByte; cmdNo: Integer);
    procedure DealTransportStart_V3(ABuf: PByte; cmdNo: Integer);
    procedure DealTransportEnd_V3(ABuf: PByte; cmdNo: Integer);
  public //-------------for V3-------------------------//
    function LogOutFromGateway(): Boolean;//从网关中注销
    function SendTYRet(devId: string; cmdSNo: LongWord; cmdId: Byte; ret: Byte): Boolean;//回复通用应答
    function GetDevOnLineStatus(): Boolean;//获取车辆在线状态
    function SendCmdTSP_V3(dev: TDevice; tspByteBuf: TByteDynArray): PCmdInfo;//发送透传命令
    function SendCmdTSPHRB_V3(devId: string; tspByteBuf: TByteDynArray): PCmdInfo;//发送透传命令
    function SendRecordTSP_V3(dev: TDevice; recFlag: Byte; recTime: Word; recSaveFlag: Byte; recSRate: Byte): Boolean;
    function SendUploadMediaDataTSP_V3(dev: TDevice; mediaType: Byte; mediaChannel: Byte; mediaReason: Byte; sDateTime, eDateTime: TDateTime; delFlag: Byte): Boolean;
    function SendUploadMediaDataSingleTSP_V3(dev: TDevice; mediaId: LongWord; delFlag: Byte): Boolean;
    function SendTSPData_V3(dev: TDevice; dataType: Byte; tspData: string): Boolean;
    function SetDevParam_V3(ATargetID: string; ParamID: word; Param: Pointer; ParamSize: integer): boolean;
    function SetAllDevParam_V3(dev: TDevice; paramData: TByteDynArray; paramCount: Integer): Boolean;
    function ReadDevParam_V3(dev: TDevice; AParamId: word): boolean;
    function SendSetLineToDev_V3(dev: TDevice; polyLineArea: TPolyLineArea): Boolean;
    function SendCollectRunRecData_V3(dev: TDevice; flag: Byte): Boolean;
    function SendSetRecorderCarNo(dev: TDevice; carVin, carNo, carType: string): Boolean;           //记录仪  设置车辆VIN号、车牌号、车辆分类
    function SendSetRecorderTime(dev: TDevice; time: TDateTime): Boolean;                           //记录仪  设置时间
    function SendSetInstallTime(dev: TDevice; time: TDateTime): Boolean;                            //记录仪  设置初次安装时间
    function SendSetStatusParamName(dev: TDevice; sAry: TStringDynArray): Boolean;                  //记录仪  设置状态量配置参数
    function SendSetPluse(dev: TDevice; pluse: Word): Boolean;                                      //记录仪  设置脉冲系数
    function SendSetInitMileage(dev: TDevice; initMileage: Integer): Boolean;                       //记录仪  设置初始里程

    function SendSetDriverInfo_Old(dev: TDevice; driverNo: Integer; driverLicense: string): Boolean;//记录仪 老 设置驾驶员信息
    function SendSetCarInfo_Old(dev: TDevice; carVin, carNo, carType: string): Boolean;             //记录仪 老 设置车辆VIN号、车牌号、车辆分类
    function SendSetRecorderTime_Old(dev: TDevice; time: TDateTime): Boolean;                       //记录仪 老 设置时间
    function SendSetCarProperty_Old(dev: TDevice; carProperty: Integer): Boolean;                   //记录仪 老 设置车辆特征系数

    function SendEmergencyAlarmDeal(dev: TDevice; dealFlag: Byte): Boolean;//发送紧急报警处理结果 dealFlag: 0: 确认报警  1：解除报警

//*****************************政府平台相关*********************************
    function SendReplyAlarmSupverise(adevId: string; acarNo: string; alarmId: Integer; ret: Byte; alarmType: Word): Boolean;//汇报督办报警处理结果
    function SendGovInfoReply(cmdFlag: Byte; objType: Integer; objId: TGovObjID; msgId: Integer; msg: string): Boolean;//政府平台信息回复
    function SendGovApplyGpsData(carNo: string; carCpColor: Byte; sTime, eTime: TDateTime): Boolean; //与政府平台申请交换车辆定位信息
    function SendGovCancelGpsData(carNo: string; carCpColor: Byte): Boolean;//与政府平台取消交换车辆定位信息
    function SendGovAlarmDealReply(carNo: string; carCpColor: Byte; alarmIdManual: Integer; dealResult: Byte): Boolean;
//*****************************政府平台相关*********************************

    function FindPostion_V3(dev: TDevice): Boolean;
    function FindBlackVer_V3(dev: TDevice): Boolean;
    function SendUpBlackVer_V3(dev: TDevice; Ver: string): Boolean;
    function PursueCar_V3(dev: TDevice; ShuXing: Byte; PursueInterval: word; JianGe: LongWord): boolean; //
    function SendAntiFake_V3(dev: TDevice; Value: string; ShuXing: Word): Boolean; overload;
    function SendAntiFake_V3_new(dev: TDevice; Value: TBitmap; ShuXing: Word): Boolean; overload;
    function SendStopAntiFake_V3(dev: TDevice): Boolean;
    function SendBackCallTel_V3(dev: TDevice; Sign: Byte; TelNo: string): Boolean;
    function SendControlCar_V3(dev: TDevice; Control: Byte; ControlCmd: Byte): Boolean;
    function SendInfoServer_V3(dev: TDevice; Sign: Byte; Value: string; isShowTip: Boolean = True): Boolean;
    function SendQueryPicture_V3(dev: TDevice; CameraIndex: Byte; Reason: Byte; beginDataTime: string;
                                  endDateTime: string; timeBool: Boolean): Boolean;
    function SendUpPicture_V3(dev: TDevice; CameraIndex: Byte; beginDataTime: string;
                                  endDateTime: string; deleteSign: Byte): Boolean;
    function SendUpPicture_V3_New(dev: TDevice; PictureType: Byte; PictrueId: Integer): Boolean;
    function SendQueryAudio_V3(dev: TDevice; channelId: Byte; Reason: Byte; beginDataTime: string;
                                  endDateTime: string; timeBool: Boolean): Boolean;
    function SendQueryVideo_V3(dev: TDevice; channelId: Byte; Reason: Byte; beginDataTime: string;
                                  endDateTime: string; timeBool: Boolean): Boolean;
//    function SendSetNightMode_v3(dev: TDevice; beginTime: string; endTime: string; ShuXing: Integer): Boolean;
//    function SendOpenNightMode_v3(dev: TDevice; ShuXing: Word; Res: Byte): Boolean;
    function SendPolling_MCU_V3(dev: TDevice): Boolean;
//    function SendQueryLightState_V3(dev: TDevice; ShuXing: Word): Boolean;
//    function SendQueryLedState_V3(dev: TDevice; ShuXing: Word): Boolean;
    function Send_V3(dev: TDevice; Flag: Byte; MCUType: Byte; param: string): Boolean;
//    function SendQueryLcdState_V3(dev: TDevice; ShuXing: Word): Boolean;
//    function SendQueryMeterState_V3(D: TDevice; ShuXing: Word): Boolean;
//    function SendQueryTSMState_V3(D: TDevice; ShuXing: Word): Boolean;
//    function SendResetLCD_V3(dev: TDevice; ShuXing: Word): Boolean;
//    function SendOpenLCD_V3(dev: TDevice; ShuXing: Word; Res: Byte): Boolean;
//    function SendMeterParam_V3_New(dev: TDevice; param: string): Boolean;
//    function SendMeterParam_V3(dev: TDevice; ShuXing: Word; MeterParam: TMeterParam_V3): Boolean;
//    function SendMeterParam_V3_NJTY(dev: TDevice; ShuXing: Word; buf: PByte): Boolean;
//    function SendReadMeterParam_V3(dev: TDevice): Boolean;
//    function SendViewAdInfo_V3(dev: TDevice; AdInfo: string; ShuXing: Word): Boolean;
//    function SendDownLoadAdInfo_V3(dev: TDevice; AdInfo: string; ShuXing: Word): Boolean;
//    function SendQueryAdInfo(dev: TDevice; ShuXing: Word): Boolean;
//    function SendQueryAllAdInfo(dev: TDevice): Boolean;
//    function SendDeleteAdInfo_V3(dev: TDevice; AdInfo: string): Boolean;
//    function SendDeleteAllAdInfo_V3(dev: TDevice; ShuXing: Word): Boolean;
    function SetInfoMenu_V3(ADevice: TDevice): Boolean; overload; {设置信息菜单}
    function SetInfoMenu_V3(ADevice: TDevice; InfoTypeList: TIntegerList; setType: Integer): Boolean; overload; {设置信息菜单}
    function SetClassInfoMenu_V3(ADevice: TDevice): Boolean;  {设置周边信息分类菜单}
//    function SendOrder_V3(AOrder: TOrder): boolean; {发送订单}
    function SendVideo_V3(dev: TDevice; msstream: TMemoryStream): Boolean; {下发视频}
    //设置车机的圆形电子围栏
    function SendSetCircleArea_New_V3(Dev: TDevice; CircleArea: TCircleArea; setType: Byte): boolean;
    // 设置车机的矩形电子围栏
    function SendSetRectangleArea_New_V3(Dev: TDevice; RectangleArea: TRectangleArea; setType: Byte): Boolean;
    // 设置车机不规则图形电子围栏
    function SendSetNoSymbolArea_New_V3(Dev: TDevice; NoSymbolArea: TNoSymbolArea): Boolean;
    function RemoveAlarm_V3(ATargetId: string): boolean; {解除报警}
    function ConfirmEarlyWarning_V3(ATargetId: string): Boolean;    {确认车机预警}
    function CancelEarlyWarning_V3(ATargetId: string): Boolean;
    // 删除指定的圆形区域
    function SendDeleteAreaListForDev_V3(Flag: Word; Dev: TDevice; AreaList: TStringList;IsDelAreaFromDB: Boolean): Boolean;
    // 远程恢复MCU德出厂初始值
    function SendInitializeMCU_V3(Dev: TDevice): Boolean;
    // 远程控制MCU复位
    function SendControlMCU_V3(Dev: TDevice): Boolean;
    // 终端控制
    function SendControlTerminal_V3(Dev: TDevice; ControlID:byte; controlParam:string=''): Boolean;
    function SendControlMcu_V3_Wl(Dev: TDevice;ControlID:byte): Boolean;

    //车辆报警时发送的文本信息
    function SendControlInfo_Alarm_V3(msgID: Integer; Adev:TDevice;
                                            AControlInfo: string; AInfoLen:
                                            Integer; ControlCmd: Byte
                                            ;needSave:Boolean = false): Boolean;
    // 获取车机最后一个定位数据
    function SendGetEndPostion(): Boolean;


    function SetTelList(ADevice: TDevice): boolean; overload; {设置车机电话本}
    function SetTelList(ADevice: TDevice; telList: TIntegerList; setType: Byte): boolean; overload; {设置车机电话本}
    function SetEventList(ADevice: TDevice; eventList: TIntegerList; setType: Byte): Boolean; overload; {设置车机事件}
    function SetEventList(ADevice: TDevice; setType: Byte): Boolean; overload; {设置车机事件}

    function ReturnParamName(ParamID: integer): string;

    function SendHeartToGataway(): Boolean; {心跳}
    //下发提问
    function SetAnswerList(ADevice: TDevice; info: string; AnswerList: TIntegerList; MsgId: Integer; ControlCmd: Byte): Boolean;

    //拍照命令
    function GetAPicture(Dev: TDevice; CameraIndex: Byte; CameraCmd: Word; PZSJJG: Word;
                         SaveSign: Byte; GetPicSize: Byte; TXZL: Byte; LD: Byte;
                         DBD: Byte; BHD: Byte; SD: Byte): boolean;

    function UpdateDevFirmware(ATargetID: string; AUpdateDevType: byte; AURL: string; AURLLen: Integer): boolean; {升级车机固件程序}


  public //-------------for V2 ------------------------//

    procedure SendHeart;

   //设置车机的电子围栏
    function SendCLIENT_SETELCFENCE(Dev: TDevice; AreaID: word; kindAlarm: byte;
      overSpeedAlarm: byte; lying: byte; kindArea: byte; len: word; param: array of byte): boolean;
   //读取车机电子围栏
    function SendReadAreaListForDev(Dev: TDevice): boolean;
   //取消电子围栏
    function SendDeleteAreaListForDev(Dev: TDevice; Area: array of byte): integer;
    //读取照片时间范围
//    function ReadPicTimesInfo(ADev:TDevice):boolean;
    //读取存储的照片
//    function ReadThePic(ADev:TDevice;AReadDateTime:TDateTime;AReadPicCountType,AReadPicType:Byte):boolean;
    //终止上传车机存储的照片
//    function StopUploadSavedPic(ADev:TDevice):Boolean;
    //下发还控制命令的文本调度控制信息
//    function SendControlCmdTxt(ATargetID: Integer; AControlInfo: string;
//      AInfoLen, MsgID: integer;  AControlCmd: Byte;isAddToCmdList: boolean= true): boolean;
    //读车机版本(含外设)
//    function ReadDevVersion_Extend(Dev: TDevice): boolean;
//    读取车机 电话本
//    function ReadDevTelList(ADev:TDevice):Boolean;
//    function ReadDevDisplayFixedMenu(ADev:TDevice):Boolean;
    //短信相关
//    function UpdateDevFirmware_Sms(ADev: TDevice; AURL: string; AURLLen: Integer): boolean;
//    function SetCutOilElec_Sms(ADev: TDevice; Option: byte): boolean;
//    function SetDevParam_Sms(ATargetID: integer; ParamID: word; Param: Pointer; ParamSize: integer): boolean;
//    function RemoveAlarm_Sms(ADev:TDevice):Boolean;
//    function SetDevRestart(ADev: TDevice):Boolean;

//    function SetEmptyCarWord(Dev: TDevice; wordtype: byte; wordEdit: byte; wordInfo: string): boolean;
//    function SendOrder(AOrder: TOrder): boolean;

    property Host: string read FHost write SetHost; // Server Host 优先级高}
    property Address: string read FAddress write SetAddress; //Server Address IP ADDRESS
    property Port: Integer read FPort write SetPort;
    property UserId: Integer read FUserId write SetUserId;
    property UserPass: string read FUserPass write SetUserPass; //Register User Password
    property Active: Boolean read GetActive write SetActive; // Active表示了和服务器的连接状态
    property AutoLogin: Boolean read FAutoLogin write SetAutoLogin; // 如果和服务器断开是否自动重新登录}
    property ComVer: TVer read GetComVer;
    property ClientVer: TVer read GetClientVer;
    property ServerSendMsg: string read FServerSendMsg write SetServerSendMsg;
    property OnSendMsg: TSendMsg read FOnSendMsg write FOnSendMsg;
    property ONSendDelete: TONSendDelete read FONSendDelete write SetONSendDelete;
    property OnPicUpload: TPicUpload read FPicUpload write FPicUpload;
    property OnAudioUpload: TAudioUpload read FAudioUpload write FAudioUpload;
    property OnVideoUpload: TVideoUpload read FVideoUpload write FVideoUpload;
    property OnEventListUpLoad: TEventListUpLoad read FEventListUpLoad write FEventListUpLoad;
    property onLightStateListUpLoad: TLightStateListUpLoad read FLightStateListUpLoad write FLightStateListUpLoad;
    property OnQueryPicture: TQueryPicture read FQueryPicture write FQueryPicture;
    property OnQueryAudio: TQueryAudio read FQueryAudio write FQueryAudio;
    property OnServeJudge: TServeJudge read FServeJudge write FServeJudge;
    property OnAnswerListUpLoad: TAnswerListUpLoad read FAnswerListUpLoad write FAnswerListUpLoad;
    property Socket: TClientSocketThread read FSocket;
    property OnReadDevPicTimesInfoRet:TReadDevPicTimesInfoRet read FOnReadDevPicTimesInfoRet write SetOnReadDevPicTimesInfoRet;
    property OnDevUploadAttemperStateChg:TOnRcvDevUploadAttemperStateChgEvent read FOnDevUploadAttemperStateChg write SetOnDevUploadAttemperStateChg;
    property SendRegUser: TSendRegUser read FSendRegUser write SetSendRegUser;
    property OnDriverCancelOrder: TOnDriverCancelOrder read FOnDriverCancelOrder write SetOnDriverCancelOrder;
    property OnAreaAlarmUpload: TOnAreaAlarmUpload read FOnAreaAlarmUpload write SetOnAreaAlarmUpload;
    property OnERunDataUpload: TOnERunDataUpload read FOnERunDataUpload write SetOnERunDataUpload;
    property OnDriverInfoUpload: TOnDriverInfoUpload read FOnDriverInfoUpload write SetOnDriverInfoUpload;
    property OnTSPDataUpload: TOnTSPDataUpload read FOnTSPDataUpload write SetOnTSPDataUpload;
    property OnMediaEventUpload: TOnMediaEventUpload read FOnMediaEventUpload write SetOnMediaEventUpload;
    property OnMediaDataUpload: TOnMediaDataUpload read FOnMediaDataUpload write SetOnMediaDataUpload;
    property OnAudioDataUpload: TOnAudioDataUpload read FOnAudioDataUpload write SetOnAudioDataUpload;
    property OnVideoDataUpload: TOnVideoDataUpload read FOnVideoDataUpload write SetOnVideoDataUpload;
    property OnRefreshAreaDevList: TOnRefreshAreaDevList read FOnRefreshAreaDevList write SetOnRefreshAreaDevList;
    property OnRefreshAlarmDealStatus: TOnRefreshAlarmDealStatus read FOnRefreshAlarmDealStatus write SetOnRefreshAlarmDealStatus;
    property OnRefreshSrvRunInfo: TOnRefreshSrvRunInfo read FOnRefreshSrvRunInfo write SetOnRefreshSrvRunInfo;
    property OnRunRecDataUpload: TOnRunRecDataUpload read FOnRunRecDataUpload write SetOnRunRecDataUpload;
    property OnAlarmSupervise: TOnAlarmSupervise read FOnAlarmSupervise write SetOnAlarmSupervise;
    property OnGovInfo: TOnGovInfo read FOnGovInfo write SetOnGovInfo;
    property OnGovAlarmInfo: TOnGovAlarmInfo read FOnGovAlarmInfo write SetOnGovAlarmInfo;
    property OnGovGpsData: TOnGovGpsData read FOnGovGpsData write SetOnGovGpsData;
    property OnDevKeyEvent: TOnDevKeyEvent read FOnDevKeyEvent write SetOnDevKeyEvent;
  end;


implementation
uses
  UGloabVar, DebugUnit, ConvUtils, DateUtils, Forms, ComCtrls,
   frmSendUnit, MapPubUnit
{$IFOPT d+}, MemFormatUnit{$ENDIF};
const
  COM_MAJOR_VER = 1;
  COM_MINOR_VER = 0;
  CLIENT_MAJOR_VER = 3;
  CLIENT_MINOR_VER = 0;

  MAX_BUFF_SIZE = 1024 * 1024;
  TSPHEADERLEN = SizeOf(TCmdTSPHead_V3);//透传包头的长度
  GPSDATABODYLEN = SizeOf(TCmdSrvTermGpsDataTSP_V3) - TSPHEADERLEN;//定位数据除头以外的长度

// 反转义发送的数组中的特殊字符
function shiftSendData(var buf; bufLen: Integer): Variant;
var
  tempBuf: array[0..10239] of Byte;
  len, size: Integer;
  i,j: Integer;
  b: Byte;
  shiftBuf: array of Byte;
begin
  len := bufLen;
  size := bufLen;
  j := 1;
  Inc(PByte(buf));
  for i:=1 to len-2 do
  begin
    if ((PByte(buf)^ = $5B) or (PByte(buf)^ = $5C) or (PByte(buf)^ = $5D)) then
    begin
      b := Byte(PByte(buf)^ xor $50);
      tempBuf[j] := $5C;
      tempBuf[j + 1] := b;
      size := size + 1;
      j := j + 1;
    end else
    begin
      tempBuf[j] := PByte(buf)^;
    end;
    j := j + 1;
    Inc(PByte(buf));
  end;
  tempBuf[size-1] := PByte(buf)^;

  SetLength(shiftBuf, size);
  CopyMemory(@shiftBuf[0], @tempBuf[0], size);
  Result := shiftBuf;
end;

function IntToBCD(Value: Integer): TDEV_ID_BCD_V3; //将整形数转换为BCD码
var
  BCD: TDEV_ID_BCD_V3;
  i,j: Integer;
  temp: string;
begin
  BCD[0] := MAC_TYPE;
  temp := FormatCurr('000000', Value);
  j := 1;
  for i:=0 to 2 do
  begin
    BCD[j] := StrToInt('$' + copy(temp,i*2+1,2));
    j := j+1;
  end;
  Result := BCD;
end;

function WordToBCD(Value: Word): Variant;
var
  BCD: array of Byte;
  i,j: Integer;
  temp: string;
begin
  SetLength(BCD, 2);
  temp := FormatCurr('0000', Value);
  j := 1;
  for i:=0 to 1 do
  begin
    BCD[j] := StrToInt('$' + copy(temp,i*2+1,2));
    j := j+1;
  end;
  Result := BCD;
end;

function ByteToBCD(Value: Byte): Byte;
var
  BCD: Byte;
  temp: string;
begin
  BCD := 0;
  temp := FormatCurr('00', Value);
  BCD := StrToInt('$' + temp);
  Result := BCD;
end;

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

function BCDToStr(ABuff: Pointer): string; // 将BCD字节数组转换为字符串
//var
//  i: Integer;
//begin
//  Result := '';
//  for i := 0 to Length(ABuff) - 1 do
//  begin
//    Result := Result + IntToHex(ABuff[i], 2);
//  end;
//end;
var
  i:integer;
  temp: string;
  p: PByte;
  v: Byte;
begin
  temp:='';
//  inc(PByte(ABuff));
  p := PByte(ABuff);
  for i:=0 to 5 do
  begin
    v := p^;
    temp := temp + IntToHex(v, 2);
    p := PtrAdd(p, 1);
  end;
  Result := temp;
end;

function TransCmdGpsDataTSP(var AOrg: TCmdSrvTermGpsDataTSP_V3; var ANew: TGpsData_V3): Boolean; overload;
begin
  Result := True;
  try
    ANew.Size := SizeOf(ANew);
//    ANew.Id :=  BCDToInt(@AOrg.DevId[0]);//AOrg.DevId[4] + AOrg.DevId[3]*256 + AOrg.DevId[2]*256*256 + AOrg.DevId[1]*256*256*256;
    ANew.Id :=  AOrg.Header.DevId;
    ANew.Long := ByteOderConvert_LongWord(AOrg.Longitude) / 1000000;
    ANew.Lat := ByteOderConvert_LongWord(AOrg.Latitude) / 1000000;
    ANew.Altitude := ByteOderConvert_Word(AOrg.Altitude);
    ANew.Speed := ByteOderConvert_Word(AOrg.Speed);
    ANew.Orientation := ByteOderConvert_Word(AOrg.Orientation);// * 2; //Anew.Orientation单位：度 || Aorg.Orientation单位：2度
    ANew.GpsTime := GetGpsTime(AOrg.GpsTime);
    ANew.State := ByteOderConvert_LongWord(AOrg.State);
    ANew.WarningSign := ByteOderConvert_LongWord(AOrg.WarningSign);
  except
    Result := False;
  end;
end;

function TransCmdGpsDataTSP(var AOrg: TCmdSrvTermFindPosTSP_V3; var ANew: TGpsData_V3): Boolean; overload;
begin
  Result := True;
  try
    ANew.Size := SizeOf(ANew);
//    ANew.Id :=  BCDToInt(@AOrg.DevId[0]);//AOrg.DevId[4] + AOrg.DevId[3]*256 + AOrg.DevId[2]*256*256 + AOrg.DevId[1]*256*256*256;
    ANew.Id :=  AOrg.Header.DevId;
    ANew.Long := ByteOderConvert_LongWord(AOrg.Longitude) / 1000000;
    ANew.Lat := ByteOderConvert_LongWord(AOrg.Latitude) / 1000000;
    ANew.Altitude := ByteOderConvert_Word(AOrg.Altitude);
    ANew.Speed := ByteOderConvert_Word(AOrg.Speed);
    ANew.Orientation := ByteOderConvert_Word(AOrg.Orientation); //Anew.Orientation单位：度 || Aorg.Orientation单位：2度
    ANew.GpsTime := GetGpsTime(AOrg.GpsTime);
    ANew.State := ByteOderConvert_LongWord(AOrg.State);
    ANew.WarningSign := ByteOderConvert_LongWord(AOrg.WarningSign);
  except
    Result := False;
  end;
end;

function TransCmdGpsDataTSP(var AOrg: TCmdSrvTermDevControlTSP_V3; var ANew: TGpsData_V3): Boolean; overload;
begin
  Result := True;
  try
    ANew.Size := SizeOf(ANew);
    ANew.Id :=  AOrg.Header.DevId;
    ANew.Long := ByteOderConvert_LongWord(AOrg.Longitude) / 1000000;
    ANew.Lat := ByteOderConvert_LongWord(AOrg.Latitude) / 1000000;
    ANew.Altitude := ByteOderConvert_Word(AOrg.Altitude);
    ANew.Speed := ByteOderConvert_Word(AOrg.Speed);
    ANew.Orientation := ByteOderConvert_Word(AOrg.Orientation); //Anew.Orientation单位：度 || Aorg.Orientation单位：2度
    ANew.GpsTime := GetGpsTime(AOrg.GpsTime);
    ANew.State := ByteOderConvert_LongWord(AOrg.State);
    ANew.WarningSign := ByteOderConvert_LongWord(AOrg.WarningSign);
  except
    Result := False;
  end;
end;

{ TGateWayServerCom }

function TGateWayServerCom.CallTarget(const ATargetID: Integer;
  const AFreq, AHoldTime: Word; const AnAvailTime: Byte): Boolean; //呼叫指定车辆
var
  cmd: TCmdTermsrvCalldev;
  info: PCmdinfo;
begin
//  ==============改网关不在线时,不能发送....
  Result := false;
//  if not isActive then exit;
//  cmd.Size := SizeOf(cmd);
//  cmd.Flag := TERMSRV_CALLDEV;
//  cmd.CmdId := GetMaxCmdID;
//  cmd.DevId := ATargetID;
//  cmd.Freq := AFreq;
//  cmd.HoldTime := AHoldTime;
//  cmd.AvailTime := AnAvailTime;
//  Result := DirectSend(cmd, cmd.Size);
//
//  info := ACmdManage.Add(cmd.CmdId);
//  info^.Id := cmd.CmdId;
//  info^.State := CMD_SNDNODO;
//  info^.Desc := '呼叫车辆：' + ADeviceManage.Find(ATargetID).Car.No;
//  info^.SendTime := now();
//  info^.CancelTime := 0;
//  info^.Replytime := 0;
//  SetLength(info^.Content, cmd.Size);
//  Move(cmd, info^.Content[0], cmd.Size);
//  info^.ContentSize := cmd.Size;
end;

function TGateWayServerCom.CancelCmd(ACmdToboCancelId: integer): boolean; // 取消正在执行或在命令列表中的命令
var
  cmd: TCmdTermsrvCancelCmd;
  p: PCmdInfo;
begin
  Result := false;
//  if not isActive then exit;
//  cmd.Size := sizeof(cmd);
//  cmd.Flag := TERMSRV_CANCELCMD;
//  cmd.CmdId := GetMaxCmdId;
//  cmd.CmdTobeCancel := ACmdToboCancelId;
//  Result := DirectSend(cmd, cmd.Size);
//
//  p := ACmdManage.Find(ACmdToboCancelId);
//  if p = nil then exit;
//  p^.State := CMD_CANCELByUSER; //被用户取消
//  p^.CancelTime := now();
//
//  p := ACmdManage.Add(cmd.CmdId);
//  p^.Id := cmd.CmdId;
//  p^.State := CMD_SNDNODO;
//  p^.Desc := '取消命令：' + IntToStr(ACmdToboCancelId);
//  p^.SendTime := now();
//  p^.CancelTime := 0;
//  p^.Replytime := 0;
//  SetLength(p^.Content, cmd.Size);
//  Move(cmd, p^.Content[0], cmd.Size);
//  p^.ContentSize := cmd.Size;

end;

function TGateWayServerCom.ControlTarget(const ATargetID: Integer;
  const ASwitch: Byte; const ASwitchStat: Boolean): Boolean; //反控车辆
var
  cmd: TCmdTermsrvSwitchCtrlData;
  info: PCmdInfo;
begin
  Result := False;
//  cmd.Size := SizeOf(cmd);
//  cmd.Flag := TERMSRV_SWCTRL;
//  cmd.CmdId := GetMaxCmdID;
//  cmd.DevId := ATargetID;
//  cmd.SwitchId := ASwitch;
//  if ASwitchStat then
//    cmd.SwitchStat := 1
//  else
//    cmd.SwitchStat := 0;
//  Result := DirectSend(cmd, cmd.Size);
//
//  info := ACmdManage.Add(cmd.CmdId);
//  info^.Id := cmd.CmdId;
//  info^.State := CMD_SNDNODO;
//  info^.Desc := '反控车辆:' + ADeviceManage.Find(ATargetID).Car.No;
//  info^.SendTime := now();
//  info^.CancelTime := 0;
//  info^.Replytime := 0;
//  SetLength(info^.Content, cmd.Size);
//  Move(cmd, info^.Content[0], cmd.Size);
//  info^.ContentSize := cmd.Size;
end;

constructor TGateWayServerCom.Create;
begin
//  inherited Create(False);
//  FreeOnTerminate := True;

  FComVer.MajorVer := COM_MAJOR_VER;
  FComVer.MinorVer := COM_MINOR_VER;
  FClientVer.MajorVer := CLIENT_MAJOR_VER_V2;
  FClientVer.MinorVer := CLIENT_MINOR_VER_V2;

  FSocket := TClientSocketThread.Create(True);
  FSocket.OnSocketEvent := FSocketSocketEvent;
  FSocket.OnWriteBufferOverflow := FSockerWriteBufferOverflow;
  FSocket.OnSendHeartToGateway := SendHeartToGataway;
  ReallocMem(FSocket.WriteBuf.Data, 1024 * 8);
  FSocket.WriteBuf.Size := 1024 * 8;
  FSocket.Resume;

  FTimer := TTimer.Create(nil);
  FTimer.Interval := 1;
  FTimer.Enabled := False;
  FTimer.OnTimer := FTimerTimer;

  FReadBuf.ReadPos := 0;
  FReadBuf.WritePos := 0;
  FReadBuf.Size := 0;
  FReadBuf.Data := nil;
  ReallocMem(FReadBuf.Data, MAX_BUFF_SIZE);
  FReadBuf.Size := MAX_BUFF_SIZE;


end;

procedure TGateWayServerCom.DealReceiveData; // 处理接收到的服务器数据,这里主要是分检工作
var
  readCount: Integer;
  LogA: TSystemLog;
  i,j: Double;
begin
  //first 从线程中读取数据,注意,要减少线程的锁定时间

  try
    FSocket.LockRead;
    if FSocket.ReadBuf.WritePos > 0 then
    begin
      readCount := Min(FSocket.ReadBuf.WritePos, FReadBuf.Size - FReadBuf.WritePos);
      CopyMemory(PtrAdd(FReadBuf.Data, FReadBuf.WritePos), FSocket.ReadBuf.Data, readCount);
      Inc(FReadBuf.WritePos, readCount);
      if FSocket.ReadBuf.WritePos = readCount then
        FSocket.ReadBuf.WritePos := 0
      else
      begin
        CopyMemory(FSocket.ReadBuf.Data, PtrAdd(FSocket.ReadBuf.Data, readCount),
          FSocket.ReadBuf.WritePos - readCount);
        FSocket.ReadBuf.WritePos := FSocket.ReadBuf.WritePos - readCount;
      end;
    end;
  finally
    FSocket.UnLockRead;
  end;
  //TDebug.GetInstance.SendDebug(FormatDateTime('hh:nn:ss', time) + ' DirectSend=' + '[' + MemFormatUnit.BuffToHex(FReadBuf.Data, FReadBuf.WritePos) + ']');
end;

procedure TGateWayServerCom.DisposeReceiveData;
var
  packSize: Word;
  arr: array of Byte;
  str: string;
  i: Integer;
  p: PByte;
  curOffSet: Integer;
begin
  try
    //if (FReadBuf.WritePos > 2) then
    //  TDebug.GetInstance.SendDebug(FormatDateTime('hh:nn:ss', time) + 'All Length=' + '[' + IntToStr(PWord(FReadBuf.Data)^) + ']');

    //为什么要大于,因为前面至少有两个字节的包长度
    //完整包的第一个字节为@符号 接着是两字节的长度
//    while (FReadBuf.WritePos >= 30) do//and (PByte(FReadBuf.Data)^ = $40) and (PWord(PtrAdd(FReadBuf.Data, 1))^ <= FReadBuf.WritePos) do
//    begin
////      SetLength(arr, FReadBuf.WritePos);
////      str := '';
////      CopyMemory(@arr[0], FReadBuf.Data, FReadBuf.WritePos);
////      for i := 0 to Length(arr) - 1 do
////      begin
////        str := str + IntToHex(arr[i], 2);
////      end;
////      uGloabVar.SystemLog.AddLog(FormatDateTime('hh:nn:ss', Now) + ' ' + str);
////      Sleep(10);
////      uGloabVar.SystemLog.AddLog(FormatDateTime('hh:nn:ss', Now) + ' before disposeRecvData');
//      if PByte(FReadBuf.Data)^ <> $40 then
//      begin
//
//        FReadBuf.WritePos := FReadBuf.WritePos - 1;
//        CopyMemory(FReadBuf.Data, PtrAdd(FReadBuf.Data, 1), FReadBuf.WritePos);
//
//        Continue;
//      end;
//      if (PWord(PtrAdd(FReadBuf.Data, 1))^ > FReadBuf.WritePos) or (PWord(PtrAdd(FReadBuf.Data, 1))^ = 0) then
//      begin
//        FReadBuf.WritePos := FReadBuf.WritePos - 3;
//        CopyMemory(FReadBuf.Data, PtrAdd(FReadBuf.Data, 3), FReadBuf.WritePos);
//
//        Continue;
//      end;  
//
//      try
////        if PWord(PtrAdd(FReadBuf.Data, 1))^ = 0 then
////        begin
////          //TDebug.GetInstance.SendDebug('处理数据错误:取包长度=0');
////          FReadBuf.WritePos := 0;
////          exit;
////        end;
//
//        packSize := PWord(PtrAdd(FReadBuf.Data, 1))^;
//        //检验和
//        if GetXorSum(FReadBuf.Data, packSize - 1) = PByte(PtrAdd(FReadBuf.Data, packSize - 1))^ then
//        begin
//          // InterceptProc(FReadBuf.Data^,PWord(FReadBuf.Data)^);  //拦
//          case PByte(PtrAdd(FReadBuf.Data, 6))^ of
//            SRVTERM_DEVONLINE_V3: DealDevOnline_V3(FReadBuf.Data);              // 车辆在线状态
//            SRVTERM_TYRET_V3: DealTYData_v3(FReadBuf.Data);                     // 通用应答
//            SRVTERM_LASTGPS_V3: DealLastGpsData_V3(FReadBuf.Data);              //获取最后位置应答
//            SRVTERM_PICUPLOADOK_V3: DealMediaUploadOK_V3(FReadBuf.Data);        // 多媒体数据上传OK
//            SRVTERM_AREAALARM_V3: DealDevAreaAlarm_V3(FReadBuf.Data);           //电子围栏报警
//            SRVTERM_TRANSPARENT: DealTransparentData_V3(FReadBuf.Data);         //透传数据
//            SRVTERM_SERVERINFO: DealServerRunInfo_V3(FReadBuf.Data);            //服务器运行状况
//            SRVTERM_GOV_ALARMSUPERVISE: DealAlarmSupervise_V3(FReadBuf.Data);   //政府平台报警督办信息
//            SRVTERM_GOV_CHECKDUTY: DealCheckDuty_V3(FReadBuf.Data);             //政府平台查岗
//            SRVTERM_GOV_TEXTINFO: DealGovTextInfo_V3(FReadBuf.Data);            //政府平台下发报文信息
//            SRVTERM_GOV_EARLYWARNING: DealGovEarlyWarning_V3(FReadBuf.Data);    //政府平台下发预警信息
//            SRVTERM_GOV_ALARM: DealGovAlarm_V3(FReadBuf.Data);                  //政府平台下发实时报警信息
//            SRVTERM_GOV_GPSDATACOUNT: DealGovGpsDataCount_V3(FReadBuf.Data);    //政府平台通知下发gps数据数量
//            SRVTERM_GOV_GPSDATA: DealGovGpsData_V3(FReadBuf.Data);              //政府平台下发gps数据
//            SRVTERM_GOV_STARTGPSDATA: DealGovStartGpsData_V3(FReadBuf.Data);      //政府平台通知开始交换车辆定位信息
//            SRVTERM_GOV_ENDGPSDATA: DealGovEndGpsData_V3(FReadBuf.Data);          //政府平台通知结束交换车辆定位信息
//          else
//            begin
////              FReadBuf.WritePos := FReadBuf.WritePos - PWord(PtrAdd(FReadBuf.Data, 1))^;
////              CopyMemory(FReadBuf.Data, PtrAdd(FReadBuf.Data, PWord(PtrAdd(FReadBuf.Data, 1))^), FReadBuf.WritePos);
////              //  TDebug.GetInstance.SendDebug('处理数据错误:命令字不正确');
////              //FReadBuf.WritePos := 0;
////              //exit;
//            end;
//          end;
//        end;
//      except
//      end;
//
//      FReadBuf.WritePos := FReadBuf.WritePos - PWord(PtrAdd(FReadBuf.Data, 1))^;
//      CopyMemory(FReadBuf.Data, PtrAdd(FReadBuf.Data, PWord(PtrAdd(FReadBuf.Data, 1))^), FReadBuf.WritePos);
////      uGloabVar.SystemLog.AddLog(FormatDateTime('hh:nn:ss', Now) + ' end disposeRecvData');
//    end;
    while (FReadBuf.WritePos >= 30) do//and (PByte(FReadBuf.Data)^ = $40) and (PWord(PtrAdd(FReadBuf.Data, 1))^ <= FReadBuf.WritePos) do
    begin
//      SetLength(arr, FReadBuf.WritePos);
//      str := '';
//      CopyMemory(@arr[0], FReadBuf.Data, FReadBuf.WritePos);
//      for i := 0 to Length(arr) - 1 do
//      begin
//        str := str + IntToHex(arr[i], 2);
//      end;
//      uGloabVar.SystemLog.AddLog(FormatDateTime('hh:nn:ss', Now) + ' ' + str);
//      Sleep(10);
//      uGloabVar.SystemLog.AddLog(FormatDateTime('hh:nn:ss', Now) + ' before disposeRecvData');

      curOffSet := 0;
      p := FReadBuf.Data;

      {if PByte(FReadBuf.Data)^ <> $40 then
      begin

        FReadBuf.WritePos := FReadBuf.WritePos - 1;
        CopyMemory(FReadBuf.Data, PtrAdd(FReadBuf.Data, 1), FReadBuf.WritePos);

        Continue;
      end;
      if (PWord(PtrAdd(FReadBuf.Data, 1))^ > FReadBuf.WritePos) or (PWord(PtrAdd(FReadBuf.Data, 1))^ = 0) then
      begin
        FReadBuf.WritePos := FReadBuf.WritePos - 3;
        CopyMemory(FReadBuf.Data, PtrAdd(FReadBuf.Data, 3), FReadBuf.WritePos);

        Continue;
      end;  }

      while FReadBuf.WritePos - curOffSet >= 30 do
      begin
        if PByte(p)^ = $40 then
        begin
          packSize := PWord(PtrAdd(p, 1))^;
          if (packSize > FReadBuf.WritePos - curOffSet) or (packSize = 0) then
          begin
            Inc(p, 3);
            Inc(curOffSet, 3);
          end
          else
          begin
            try
              //检验和
              if GetXorSum(p, packSize - 1) = PByte(PtrAdd(p, packSize - 1))^ then
              begin
                // InterceptProc(FReadBuf.Data^,PWord(FReadBuf.Data)^);  //拦
                case PByte(PtrAdd(p, 6))^ of
                  SRVTERM_DEVONLINE_V3: DealDevOnline_V3(p);              // 车辆在线状态
                  SRVTERM_TYRET_V3: DealTYData_v3(p);                     // 通用应答
                  SRVTERM_LASTGPS_V3: DealLastGpsData_V3(p);              //获取最后位置应答
                  SRVTERM_PICUPLOADOK_V3: DealMediaUploadOK_V3(p);        // 多媒体数据上传OK
                  SRVTERM_AREAALARM_V3: DealDevAreaAlarm_V3(p);           //电子围栏报警
                  SRVTERM_TRANSPARENT: DealTransparentData_V3(p);         //透传数据
                  SRVTERM_SERVERINFO: DealServerRunInfo_V3(p);            //服务器运行状况
                  SRVTERM_GOV_ALARMSUPERVISE: DealAlarmSupervise_V3(p);   //政府平台报警督办信息
                  SRVTERM_GOV_CHECKDUTY: DealCheckDuty_V3(p);             //政府平台查岗
                  SRVTERM_GOV_TEXTINFO: DealGovTextInfo_V3(p);            //政府平台下发报文信息
                  SRVTERM_GOV_EARLYWARNING: DealGovEarlyWarning_V3(p);    //政府平台下发预警信息
                  SRVTERM_GOV_ALARM: DealGovAlarm_V3(p);                  //政府平台下发实时报警信息
                  SRVTERM_GOV_GPSDATACOUNT: DealGovGpsDataCount_V3(p);    //政府平台通知下发gps数据数量
                  SRVTERM_GOV_GPSDATA: DealGovGpsData_V3(p);              //政府平台下发gps数据
                  SRVTERM_GOV_STARTGPSDATA: DealGovStartGpsData_V3(p);      //政府平台通知开始交换车辆定位信息
                  SRVTERM_GOV_ENDGPSDATA: DealGovEndGpsData_V3(p);          //政府平台通知结束交换车辆定位信息
                end;
              end;
            except
            end;
            Inc(p, packSize);
            Inc(curOffSet, packSize);
          end;    
        end
        else
        begin
          Inc(p);
          Inc(curOffSet);
        end;
      end;
      FReadBuf.WritePos := FReadBuf.WritePos - curOffSet;
      CopyMemory(FReadBuf.Data, PtrAdd(FReadBuf.Data, curOffSet), FReadBuf.WritePos);

//
//      FReadBuf.WritePos := FReadBuf.WritePos - PWord(PtrAdd(FReadBuf.Data, 1))^;
//      CopyMemory(FReadBuf.Data, PtrAdd(FReadBuf.Data, PWord(PtrAdd(FReadBuf.Data, 1))^), FReadBuf.WritePos);
//      uGloabVar.SystemLog.AddLog(FormatDateTime('hh:nn:ss', Now) + ' end disposeRecvData');
    end;
  finally
  end;
end;

procedure TGateWayServerCom.DisposeOhterReceiveData;
begin

end;

{计算校验和- 异或}
function GetXorSum(Buff: Pointer; ALen : integer):Byte;
var
  i: integer;
  p: PByte;
  checkSum : Byte;
begin
  p:= PByte(Buff);
  checkSum := 0;
  for i:= 0 to Alen-1 do
  begin
    checkSum := checkSum xor p^;
    Inc(p);
  end;
  Result:= checkSum;
end;

procedure TGateWayServerCom.DealRegUserData(ABuf: PByte); //处理　注册用户　回复数据
var
  RvHandle: Integer;
  backNumber: Byte;
begin
  backNumber := PCmdSrvtermRegUserData(ABuf)^.Ret;
  if Assigned(FSendRegUser) then
  begin
    FSendRegUser(backNumber);
  end;
end;

destructor TGateWayServerCom.Destroy;
begin
  try
    FTimer.Enabled := False;
    FTimer.Free;

    ReallocMem(FReadBuf.Data, 0);
    FSocket.Terminate;
    FSocket.WaitFor;
    Sleep(10);
    FSocket.Free;
  finally

  end;

  //inherited;
end;

function TGateWayServerCom.DirectSend(var buf; ABufSize: Integer): Boolean; //调用内部的发送函数直接发送数据
//var
//  sendBuf: array of Byte;
begin
  //InterceptProc(buf,ABufSize);  // 拦截点处理
{$IFDEF debug_sha}
  TDebug.GetInstance.SendDebug(FormatDateTime('hh:nn:ss', time) + ' DirectSend=' + '[' + MemFormatUnit.BuffToHex(@buf, ABufSize) + ']');
{$ENDIF}
  if FActive then
  begin
    //sendBuf := shiftSendData(buf, ABufSize);
    Result := send(FSocket.SocketHandle, buf, ABufSize, 0) = ABufSize;
  end
  else
    Result := false;
end;

procedure TGateWayServerCom.FSockerWriteBufferOverflow(Sender: TObject);
begin
  DealReceiveData;
end;

procedure TGateWayServerCom.FSocketSocketEvent(Sender: TObject;
  Socket: TCustomWinSocket; SocketEvent: TSocketEvent);
var
  i: integer;
begin
  case SocketEvent of
    seConnect:
      begin

        if (LoginToServer) then
        begin
          ACmdManage.ClearCmd;//重新连接到网关时，命令管理器清0 2009-1-2sha.
          //SendGetEndPostion;
          if (not FIsGetAllPos) then
          begin

            GetDevOnLineStatus();

//            GetAllPos;

//            if GlobalParam.isUseDriverCard then
//              ReadAllDriverNO;
            FIsGetAllPos := True;
          end;
        end;
{$IFDEF debug_sha}
        TDebug.GetInstance.SendDebug('FSocketSocketEvent: Logined Server');
{$ENDIF}
      end;
  end;
end;

procedure TGateWayServerCom.FTimerTimer(Sender: TObject);
begin
  try
    try
      FTimer.Enabled := False;
      DealReceiveData;
      DisposeReceiveData;
    finally
      FTimer.Enabled := True;
    end;
  except on E: Exception do
      uGloabVar.SystemLog.AddLog(' TGateWayServerCom.FTimerTimer函数报错: ', e.Message);
  end;
end;

function TGateWayServerCom.GetActive: Boolean;
begin
  Result := FSocket.Active;
end;

function TGateWayServerCom.GetAllPos(SaveToCmdManage: boolean): Boolean;
var
  cmd: TCmdTermSrvFindPostion_V3;
  buf: array of Byte;
  len: Integer;
begin
  len := SizeOf(TCmdTermSrvFindPostion_V3) + 1;
  InitHeader(cmd.Header, len, TERMSRV_LASTGPS_V3, BLANKDEVID);
  SetLength(buf, len);
  CopyMemory(@buf[0], @cmd, len - 1);
  buf[len - 1] := GetXorSum(@buf[0], len - 1);
  Result := DirectSend(buf[0], len);
end;

function TGateWayServerCom.GetClientVer: TVer;
begin
  Result.MajorVer := CLIENT_MAJOR_VER;
  Result.MinorVer := CLIENT_MINOR_VER;
end;

function TGateWayServerCom.GetComVer: TVer;
begin
  Result.MinorVer := COM_MAJOR_VER;
  Result.MajorVer := COM_MINOR_VER;
end;

function TGateWayServerCom.GetLastPos(const ADeviceID: Integer; SaveToCmdManage: boolean): Boolean; //获得一个车机的最后的位置
var
  cmd: TCmdTermsrvGetlastPosData;
  info: PCmdInfo;
begin
  Result := False;
//  //if not isActive then  exit;
//  cmd.Size := SizeOf(cmd);
//  cmd.Flag := TERMSRV_GETLASTPOS;
//  cmd.CmdId := GetMaxCmdID;
//  cmd.DevId := ADeviceID;
//  Result := DirectSend(cmd, cmd.Size);
//  if SaveToCmdManage then
//  begin
//    info := ACmdManage.Add(cmd.CmdId);
//    info^.Id := cmd.CmdId;
//    info^.State := CMD_SNDNODO;
//    if ADeviceID = -1 then
//      info^.Desc := '获得所有设备的最后的位置'
//    else
//      info^.Desc := '获得' + ADeviceManage.Find(ADeviceID).Car.No + '的最后的位置';
//    info^.SendTime := now();
//    info^.CancelTime := 0;
//    info^.Replytime := 0;
//    SetLength(info^.Content, cmd.Size);
//    Move(cmd, info^.Content[0], cmd.Size);
//    info^.ContentSize := cmd.Size;
//  end;
end;

function TGateWayServerCom.GetMaxCmdID: Integer; //获得当前可用的最大的命令ID
begin
  if FMaxCmdID >=2147483647	 then
    FMaxCmdID :=0;
  Inc(FMaxCmdID);
  Result := FMaxCmdID;
end;

function TGateWayServerCom.GetStat(const ADeviceID: Integer): Boolean; //获得目标的状态参数
var
  cmd: TCmdTermsrvGetstatData;
  info: PCmdInfo;
begin
  Result := false;
//  if not isActive then exit;
//  cmd.Size := SizeOf(cmd);
//  cmd.Flag := TERMSRV_GETDEVSTAT;
//  cmd.CmdId := GetMaxCmdID;
//  cmd.DevId := ADeviceID;
//  Result := DirectSend(cmd, cmd.Size);
//
//  info := ACmdManage.Add(cmd.CmdId);
//  info^.Id := cmd.CmdId;
//  info^.State := CMD_SNDNODO;
//  info^.Desc := '获得' + ADeviceManage.Find(ADeviceID).Car.No + '的设备状态';
//  info^.SendTime := now();
//  info^.CancelTime := 0;
//  info^.Replytime := 0;
//  SetLength(info^.Content, cmd.Size);
//  Move(cmd, info^.Content[0], cmd.Size);
//  info^.ContentSize := cmd.Size;
end;


function TGateWayServerCom.LoginToServer: Boolean; // 用户登录网关服务器
var
  cmd: PCmdTermsrvRegUserData_V3;
  info: PCmdInfo;
  str0: string;
  buff: array[0..1023] of byte;
  p: PByte;
  strTime: String;
  time: TByteDynArray;
  authCode: string;//验证码	=MD5(发送端标识+ 登录密码+时间戳)
begin
  strTime := FormatDateTime('yyyyMMddhhnnss', Now);
  authCode := IntToStr(UserId) + UserPass + strTime;
  authCode := getMD5Str(authCode) + #0;//加上字符串结束符

  FillChar(buff, 1024, 0);
  cmd := @buff[0];                                          //此处加1: 1个校验和位
  InitHeader(cmd^.Header,SizeOf(TCmdTermsrvRegUserData_V3) + Length(authCode) + 1,
    TERMSRV_LOGIN, BLANKDEVID);
  cmd^.Version := LOGVERSION;
  cmd^.UserId := UserId;

  time := StrToBCD(strTime, 7);
  CopyMemory(@cmd^.Time[0], @time[0], Length(time));
  p := PtrAdd(@buff[0], sizeof(TCmdTermsrvRegUserData_V3)); //p 指向 buff 移过 已知结构后

  InitStr(str0, Length(authCode));
  CopyMemory(@str0[1], @authCode[1], Length(authCode));
  CopyMemory(p, @str0[1], Length(authCode));
  p := PtrAdd(p, Length(authCode));

  p^ := GetXorSum(@buff[0], cmd^.Header.Size - 1);
  p := PtrAdd(p, 1);
//  CopyMemory(@buff[sizeof(TCmdTermsrvRegUserData_V3)],@userpass[1],length(UserPass));
//  buff[sizeof(TCmdTermsrvRegUserData_V3)+length(UserPass)]:=1;

//  cmd^.Size := SizeOf(TCmdTermsrvRegUserData_V3)+ Length(UserPass)+1;
  Result := DirectSend(buff[0], cmd^.Header.Size);

  info := ACmdManage.Add(cmd^.header.CmdOrder);
//  info^.Id := cmd^.CmdId;
  info^.State := CMD_SNDNODO;
  info^.Desc := '用户登录网关';
  info^.SendTime := now();
  info^.CancelTime := 0;
  info^.Replytime := 0;
  SetLength(info^.Content, cmd^.Header.Size);
  Move(cmd, info^.Content[0], cmd^.Header.Size);
  info^.ContentSize := cmd^.Header.Size;

{$IFDEF debug_sha}
  TDebug.GetInstance.SendDebug('LoginToServer');
{$ENDIF}
end;

function TGateWayServerCom.PingServer: Boolean;
var
  cmd: TCmdTermsrvPingData;
begin
  Result := False;
// // if not isActive then  exit;
//  cmd.Size := SizeOf(cmd);
//  cmd.Flag := TERMSRV_PING;
//  cmd.CmdId := GetMaxCmdID;
//  cmd.TimeStamp := GetTickCount;
//  Result := DirectSend(cmd, cmd.Size);

end;

function TGateWayServerCom.PtrAdd(p: pointer; offset: integer): pointer;
begin
  Result := Pointer(Integer(p) + offset);
end;



function TGateWayServerCom.RepeatSend(ACmdId: integer): boolean; //重发
var
  p: PCmdInfo;
begin
  Result := false;
  if not isActive then exit;
  p := ACmdManage.Find(ACmdId);
  if p = nil then exit;
  Result := DirectSend(p^.content[0], p^.contentsize);
  p^.State := CMD_RESND;
  p^.SendTime := now();
  p^.CancelTime := 0;
  p^.Replytime := 0;
end;

function TGateWayServerCom.SendComVer: Boolean; //发送通讯协议版本
var
  cmd: TCmdTermsrvRegverData;
begin
  cmd.Size := SizeOf(cmd);
//  cmd.Flag := TERMSRV_COMMVER;
//  cmd.MajorVer := ComVer.MajorVer;
//  cmd.MinorVer := ComVer.MinorVer;
  cmd.Ver := DATAPROTOCOL_10;
  Result := DirectSend(cmd, cmd.Size);
end;


//向连接的其他的DTE发送数据

function TGateWayServerCom.SendToDTE(const ADeviceID: integer;
  Adata: TByteDynArray): boolean;
//var
//  pcmd: pcmdTermSrvSendToDTEHeader;
//  info: PCmdInfo;
//  aa: array of byte;
//  datalen, lenAll: integer;
begin
  Result := false;
//  if not isActive then exit;
//  Adata := TransSendToDTECmd(Adata); // 转换输入参数->命令内容
//  datalen := high(Adata) + 1;
//  lenAll := sizeof(pcmd^) + datalen;
//  setlength(aa, lenAll);
//  pcmd := @aa[0];
//  pcmd^.Size := lenAll;
//  pcmd^.Flag := TERMSRV_SENDTODTE;
//  pcmd^.CmdId := GetMaxCmdId;
//  pcmd^.DevID := ADeviceId;
//  pcmd^.DataLen := datalen; //aa[sizeof(pcmd^)-1]:= Adatalen ;
//  copymemory(@aa[sizeof(pcmd^)], @Adata[0], datalen);
//  Result := DirectSend(aa[0], lenAll);
//
//  info := ACmdManage.Add(pcmd^.CmdId);
//  info^.Id := pcmd^.CmdId;
//  info^.State := CMD_SNDNODO;
//  info^.Desc := '使' + ADeviceManage.Find(ADeviceID).Car.No + '的车载设备向外设发送数据';
//  info^.SendTime := now();
//  info^.CancelTime := 0;
//  info^.Replytime := 0;
//  SetLength(info^.Content, lenAll);
//  Move(aa[0], info^.Content[0], lenAll);
//  info^.ContentSize := lenAll;
end;

function TGateWayServerCom.TransSendToDTECmd(Adata: TByteDynArray): TByteDynArray;
var
  arr1: array of byte;
  len0, i: Integer;
begin
  len0 := high(Adata) + 1;
  SetLength(arr1, len0 + 6);
  arr1[0] := 2; //stx 开始
  arr1[1] := len0 + 3; //len
  arr1[2] := 9; //dno 设备编码
  arr1[3] := $20; //cmd 命令码
  CopyMemory(@arr1[4], @Adata[0], len0); //data 命令参数
  arr1[4 + len0] := arr1[2] xor arr1[3];
  for i := 0 to len0 - 1 do
    arr1[4 + len0] := arr1[4 + len0] xor Adata[i]; //bcb 校验字符
  arr1[5 + len0] := 3; //etx 结束
  Result := @arr1[0];
end;

procedure TGateWayServerCom.SetActive(const Value: Boolean);
begin
  if Value then
  begin
    FSocket.Address := Address;
    FSocket.Port := Port;
    FSocket.Host := Host;
  end;
  FSocket.Active := Value;
  FTimer.Enabled := Value;
  FActive := Value;
end;

procedure TGateWayServerCom.SetAddress(const Value: string);
begin
  FAddress := Value;
{$IFNDEF ForTestUser}
  FAddress := ConstIP;
        //Self.Port := ConstPortOfGate;
{$ENDIF}
end;

procedure TGateWayServerCom.SetAutoLogin(const Value: Boolean);
begin
  FAutoLogin := Value;
end;


procedure TGateWayServerCom.SetHost(const Value: string);
begin
  FHost := Value;
{$IFNDEF ForTestUser}
  FHost := ConstIP;
        //Self.Port := ConstPortOfGate;
{$ENDIF}
end;

procedure TGateWayServerCom.SetPort(const Value: Integer);
begin
  FPort := Value;
{$IFNDEF ForTestUser}
       //FHost := ConstIP;
  FPort := ConstPortOfGate;
{$ENDIF}

end;

procedure TGateWayServerCom.SetServerSendMsg(const Value: string);
begin
  FServerSendMsg := Value;
end;

procedure TGateWayServerCom.SetUserId(const Value: Integer);
begin
  FUserId := Value;
end;



procedure TGateWayServerCom.SetUserPass(const Value: string);
begin
  FUserPass := Value;
end;

//function TGateWayServerCom.SendTaxiBuss(ID: Integer; datatime: string; Count: Integer; devIDBuf: pByte;
//                                        desc: string; xxDesc: string; TelNo: string): Boolean;
//  procedure InitStr(var AStr: string; len: Word);
//  var
//    i: integer;
//  begin
//    SetLength(AStr, len+1);
//    for i := 1 to len+1 do
//      AStr[i] := #0;
//  end;
//var
//  pcmd: PCmdTerSevSendTaxiBuss_V3;
//  buff: array[0..1023] of Byte;
//  pInfo: PCmdInfo;
//  p: PByte;
//  str0: string;
//begin
//  Result := false;
//  if not isActive then exit;
//  FillChar(buff, 1024, 0);
//  New(pcmd);
//  pcmd := @buff[0]; //pcmd 指向buff 首址
//  pcmd^.Size := 0;
//  pcmd^.Flag := TERMSRV_SENDTAXIBUSS_V3;
//  pcmd^.ExtendedFlag := 0;
//  pcmd^.FactID := FACT_ID;
//  pcmd^.DevID := 0;
//  pcmd^.CmdID := GetMaxCmdID;
//  pcmd^.ID := ID;
//  pcmd^.BussType := 0;
//  //pcmd^.DateTime :=
//  pcmd^.Count := Count;
//
//  p := PtrAdd(@buff[0], sizeof(TCmdTerSevSendTaxiBuss_V3)); //p 指向 buff 移过 已知结构后
//
//  CopyMemory(p, devIDBuf, Count*5);
//
//  InitStr(str0, Length(desc));
//  CopyMemory(@str0[1], @desc[1], Length(desc));
//  CopyMemory(p, @str0[1], Length(desc));
//
//  InitStr(str0, Length(xxdesc));
//  CopyMemory(@str0[1], @xxdesc[1], Length(xxdesc));
//  CopyMemory(p, @str0[1], Length(xxdesc));
//
//  InitStr(str0, Length(TelNo));
//  CopyMemory(@str0[1], @TelNo[1], Length(TelNo));
//  CopyMemory(p, @str0[1], Length(TelNo));
//
//  Pcmd^.Size := Integer(p) - Integer(@buff[0]);
//  Result := DirectSend(buff[0], pcmd^.Size);
//
//  pinfo := ACmdManage.Add(pcmd^.CmdId);
//  pinfo^.Id := pcmd^.CmdId;
//  pinfo^.State := CMD_SNDNODO;
//  pinfo^.Desc := '设置车机调度信息信息';
//  pinfo^.SendTime := now();
//  pinfo^.CancelTime := 0;
//  pinfo^.Replytime := 0;
//  SetLength(pinfo^.Content, pcmd^.Size);
//  Move(buff[0], pinfo^.Content[0], pcmd^.Size);
//  pinfo^.ContentSize := pcmd^.Size;
//
//end;

function TGateWayServerCom.SetAnswerList(ADevice: TDevice; info: string; AnswerList: TIntegerList; MsgId: Integer; ControlCmd: Byte): Boolean;
var
  buff: array[0..1023] of byte;
  i: integer;
  pAnswer: PAnswerInfo;
  p: PByte;
  AnswerLen: byte;
  str0: string;
  Question: string;
  bufLen: Integer;
  Answer: PAnswerInfo;

  pacmd: PCmdTermSrvSetAnswerListTSP_V3;//TCmdTermSrvSetDevParam_V3;//TCmdTermSrvSetDevParam_V2;
  pInfo: PCmdinfo;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
begin
  Result := false;
  if not isActive then exit;
  FillChar(buff, 1024, 0);
  pacmd := @buff[0];
  pacmd^.Flag := ControlCmd;
  pacmd^.QuestionLen := Length(info);
  p := PtrAdd(@buff[0], SizeOf(TCmdTermSrvSetAnswerListTSP_V3));
  InitStr(Question, Length(info));
  CopyMemory(@Question[1], @info[1], Length(info));
  CopyMemory(p, @Question[1], Length(info));
  p := PtrAdd(p, Length(info));

  for i := 0 to AnswerList.Count-1{ADevice.AnswerList.Count - 1} do
  begin
    pAnswer := PAnswerInfo(AnswerList.Datas[i]){ADevice.AnswerItems[i]};
    //写入 答案ID      1
    p^ := pAnswer^.id;
    p := PtrAdd(p, 1);
    //得到事件的长度  1
    AnswerLen := Length(pAnswer^.Info);
    PWord(p)^ := ByteOderConvert_Word(AnswerLen);
    p := PtrAdd(p, 2);
    InitStr(str0, AnswerLen);

    //写入答案
    CopyMemory(@str0[1], @(pAnswer^.info)[1], AnswerLen);
    CopyMemory(p, @str0[1], AnswerLen);
    p := PtrAdd(p, AnswerLen);
  end;

  bufLen := Integer(p) - Integer(@buff[0]);
  InitTSPHeader(pacmd^.Header, bufLen - TSPHEADERLEN, TERMSRV_SETANSWER_V3, ADevice.Id);

  tspPackSize := bufLen + 3;
  SetLength(tspBuf, tspPackSize);
  offSet := 0;
  tspBuf[offSet] := FLAGTSP;
  Inc(offSet);
  CopyMemory(@tspBuf[offset], @buff[0], bufLen);
  Inc(offSet, bufLen);
  tspBuf[offSet] := GetXorSum(@tspBuf[1], bufLen);
  Inc(offSet);
  tspBuf[offSet] := FLAGTSP;

  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  pinfo := SendCmdTSP_V3(ADevice, escapByteBuf);
  pinfo^.Desc := '下发提问：' + ADevice.Car.No+'['+info+']';
  pinfo^.MsgId := MsgId;
  pInfo^.AnswerList := TIntegerList.Create;//此处不能直接等于 AnswerList， 该answerlist 会随着提问窗口的dev对象释放而不存在
  for i := 0 to AnswerList.Count - 1 do
  begin
    pAnswer := PAnswerInfo(AnswerList.Datas[i]);
    pInfo^.AnswerList.AddData(pAnswer^.id, AnswerList.Datas[i]);
  end;  
  pInfo^.QuestionInfo := info;

//  pcmd := @buff[0]; //pcmd 指向buff 首址
//  InitHeader(pcmd^.Header,0,TERMSRV_SETQUESTLIST_V3,ADevice.Id);
//  pcmd^.ControlCmd := ControlCmd;
//  pcmd^.MsgId := MsgId;
//  p := PtrAdd(@buff[0], sizeof(TCmdTermSrvSetAnswerList_V3)); //p 指向 buff 移过 已知结构后
//
//  InitStr(Question, Length(info));
//  CopyMemory(@Question[1], @info[1], Length(info));
//  CopyMemory(p, @Question[1], Length(info)+1);
//  p := PtrAdd(p, Length(info) + 1);
//
//  for i := 0 to AnswerList.Count-1{ADevice.AnswerList.Count - 1} do
//  begin
//    pAnswer := PAnswerInfo(AnswerList.Datas[i]){ADevice.AnswerItems[i]};
//    //写入 答案ID      1
//    p^ := pAnswer^.id;
//    p := PtrAdd(p, 1);
//    //得到事件的长度  1
//    AnswerLen := Length(pAnswer^.Info);
//    InitStr(str0, AnswerLen);
//
//    //写入答案
//    CopyMemory(@str0[1], @(pAnswer^.info)[1], AnswerLen);
//    CopyMemory(p, @str0[1], AnswerLen+1);
//    p := PtrAdd(p, AnswerLen+1);
//  end;
//
//  Pcmd^.header.Size := Integer(p) - Integer(@buff[0]);
//  Result := DirectSend(buff[0], Pcmd^.header.Size );
//
//  pinfo := ACmdManage.Add(pcmd^.Header.CmdOrder);
////  pinfo^.Id := pcmd^.CmdId;
//  pinfo^.DevId := ADevice.id;
//  pinfo^.State := CMD_SNDNODO;
//  pinfo^.Desc := '下发提问：' + ADevice.Car.No+'['+info+']';
//  pinfo^.SendTime := now();
//  pinfo^.CancelTime := 0;
//  pinfo^.Replytime := 0;
//  SetLength(pinfo^.Content, Pcmd^.header.Size );
//  Move(buff[0], pinfo^.Content[0],Pcmd^.header.Size );
//  pinfo^.ContentSize :=Pcmd^.header.Size ;
//  pinfo^.MsgId := MsgId;
//  //pInfo.AnswerList := ADevice.AnswerList;
//
//  pInfo.AnswerList := AnswerList;//TIntegerList.Create;
//  //for i := 0 to AnswerList.Count-1{ADevice.AnswerList.Count - 1} do
//  //begin
//  //  pAnswer := PAnswerInfo(AnswerList.Datas[i]){ADevice.AnswerItems[i]};
//  //  pInfo.AnswerList.AddData(pAnswer^.id, pAnswer);
//  //end;
//
//  pInfo.QuestionInfo := info;
//
//  SaveCMD.CmdList.AddData(pCmd^.Header.CmdOrder, pinfo);
end;

function TGateWayServerCom.SendHeartToGataway(): Boolean;
var
  cmd: TCMDHeart;
  buf: array of Byte;
begin
  cmd.header.SPOSFlag := SPOSFLAG;
  cmd.header.Size := SizeOf(TCMDHeart) + 1;
  cmd.header.PackType := PACKTYPE_2KE1WEI;
  cmd.header.Ver := 0;
  cmd.header.BizType :=6;//05	监控客户端
  cmd.header.CmdFlag := TERMSRV_HEART_V3;
  cmd.header.DevId := DevId_StrToBCD(BLANKDEVID);
  ZeroMemory(@cmd.header.CarNo[0],12);
  cmd.header.CmdOrder := 0;

  SetLength(buf, SizeOf(TCMDHeart) + 1);
  CopyMemory(@buf[0], @cmd, SizeOf(TCmdHeart));
  buf[cmd.header.Size - 1] := GetXorSum(@buf[0], cmd.header.Size - 1);
  Result := DirectSend(buf[0], cmd.Header.Size);
end;

function TGateWayServerCom.SetEventList(ADevice: TDevice; eventList: TIntegerList; setType: Byte): Boolean;
var
  buff: array[0..1023] of byte;
//  pcmd: PCmdTermSrvSetEventList_V3;
  i: integer;
  pEvent: PEventInfo;
  p: PByte;
  eventLen: byte;
  str0: string;
  len:integer;

  pacmd: PCmdTermSrvSetEventListTSP_V3;//TCmdTermSrvSetDevParam_V3;//TCmdTermSrvSetDevParam_V2;
  info: PCmdinfo;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
begin
  Result := false;
  if not isActive then exit;
  FillChar(buff, 1024, 0);
  pacmd := @buff[0];
  pacmd^.EventType := setType;

  p := PtrAdd(@buff[0], SizeOf(TCmdTermSrvSetEventListTSP_V3));
  if setType > 0 then
  begin
    p^ := eventList.Count;
    p := PtrAdd(p, 1);
    for i := 0 to eventList.Count - 1 do
    begin//此处事件内容的结束符已在事件生成的时候添加
      pEvent := eventList.Datas[i];
      //写入 事件ID       1
      p^ := pEvent^.No;
      p := PtrAdd(p, 1);
      //得到事件的长度  1
      eventLen := Length(pEvent^.Info);
      p^ := eventLen;
      p := PtrAdd(p, 1);

      if setType <> 4 then
      begin//删除指定项的时候不需要事件内容
        InitStr(str0, eventLen);
        //写入事件信息        eventNoLen
        CopyMemory(@str0[1], @(pEvent^.info)[1], eventLen);
        CopyMemory(p, @str0[1], eventLen);
        p := PtrAdd(p, eventLen);
      end;
    end;
  end;
  len := Integer(p) - Integer(@buff[0]);

  InitTSPHeader(pacmd^.Header, len - TSPHEADERLEN, TERMSRV_SETEVENT_V3, ADevice.Id);

  tspPackSize := len + 3;//2个标志位 + 1个校验码
  SetLength(tspBuf, tspPackSize);
  offSet := 0;
  tspBuf[offset] := FLAGTSP;//标识位
  Inc(offSet);
  CopyMemory(@tspBuf[offSet], @buff[0], len);
  Inc(offSet, len);
  tspBuf[offSet] := GetXorSum(@tspBuf[1], len);//从消息头开始，不包括标识位
  Inc(offSet);
  tspBuf[offset] := FLAGTSP;//标识位
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(ADevice, escapByteBuf);
  info^.Desc := '设置事件：' + ADevice.Car.No;

//  pcmd := @buff[0]; //pcmd 指向buff 首址
//  InitHeader(pcmd^.Header,0,TERMSRV_SETEVENTLIST_V3,ADevice.id);
////
//  if  ADevice.EventList.Count=0 then
//    pcmd^.SetType := 0
//  else
//    pcmd^.SetType := 1;
//  { TODO -osjp : 类型需讨论 }
//  pcmd^.SetCount := ADevice.EventList.Count;
//  pcmd^.PackCount := 1;
//  p := PtrAdd(@buff[0], sizeof(TCmdTermSrvSetEventList_V3)); //p 指向 buff 移过 已知结构后
////  p^ := ADevice.EventList.Count;  // 事件项个数   1
////  p := PtrAdd(p, 1);
//  for i := 0 to ADevice.EventList.Count - 1 do
//  begin
//    pEvent := ADevice.EventItems[i];
//    //写入 事件ID       1
//    p^ := pEvent^.No;
//    p := PtrAdd(p, 1);
//    //得到事件的长度  1
//    eventLen := Length(pEvent^.Info);
//    p^ := eventLen+1;
//    p := PtrAdd(p, 1);
//    InitStr(str0, eventLen);
//    //写入事件信息        eventNoLen
//    CopyMemory(@str0[1], @(pEvent^.info)[1], eventLen);
//    CopyMemory(p, @str0[1], eventLen+1);
//    p := PtrAdd(p, eventLen+1);
//  end;
//  if  ADevice.EventList.Count=0 then
//    len := sizeof(TCmdTermSrvSetEventList_V3) -2
//  else
//    len := Integer(p) - Integer(@buff[0]);
//  Pcmd^.Header.Size := len;
//  Result := DirectSend(buff[0],len);

end;

function TGateWayServerCom.SetClassInfoMenu_V3(ADevice: TDevice): Boolean;  {设置周边信息信息菜单}
var
  buff: array[0..1023] of byte;
  pcmd: PCmdTermSrvSetClassInfoMenu_V3;
  info: PCmdinfo;
  i: integer;
  pInfo: pClassInfoMenu;
  p: PByte;
  eventLen: byte;
  str0: string;
begin
  Result := false;
  if not isActive then exit;
  FillChar(buff, 1024, 0);
  pcmd := @buff[0]; //pcmd 指向buff 首址
  pcmd^.Size := 0;
  pcmd^.Flag := TERMSRV_SETCLASSINFOMENU_V3;
  pcmd^.ExtendedFlag := 0;
//  pcmd^.FactID := ADevice.fact_id;
  pcmd^.DevID := DevId_StrToBCD(ADevice.Id);
  pcmd^.CmdID := GetMaxCmdID;
  p := PtrAdd(@buff[0], sizeof(TCmdTermSrvSetClassInfoMenu_V3)); //p 指向 buff 移过 已知结构后
  p^ := ADevice.ClassInfoMenuList.Count;  // 事件项个数   1
  p := PtrAdd(p, 1);
  for i := 0 to ADevice.ClassInfoMenuList.Count - 1 do
  begin
    pInfo := ADevice.ClassInfoMenuItems[i];
    //写入 菜单ID       1
    p^ := pInfo^.No;
    p := PtrAdd(p, 1);
    //得到菜单的长度  1
    eventLen := Length(pInfo^.Info);
    InitStr(str0, eventLen);
    //写入菜单信息        eventNoLen
    CopyMemory(@str0[1], @(pInfo^.info)[1], eventLen);
    CopyMemory(p, @str0[1], eventLen+1);
    p := PtrAdd(p, eventLen+1);
  end;
  Pcmd^.Size := Integer(p) - Integer(@buff[0]);
  Result := DirectSend(buff[0], pcmd^.Size);

  info := ACmdManage.Add(pcmd^.CmdId);
  info^.Id := pcmd^.CmdId;
  info^.State := CMD_SNDNODO;
  info^.Desc := '设置车机周边信息分类菜单：' + ADevice.Car.No;
  info^.SendTime := now();
  info^.CancelTime := 0;
  info^.Replytime := 0;
  SetLength(info^.Content, pcmd^.Size);
  Move(buff[0], info^.Content[0], pcmd^.Size);
  info^.ContentSize := pcmd^.Size;

//  SaveCMD.CmdList.AddData(pCmd^.CmdId, info);
end;

function TGateWayServerCom.SetInfoMenu_V3(ADevice: TDevice): Boolean;  {设置信息菜单}
var
  buff: array[0..1023] of byte;
  pcmd: PCmdTermSrvSetInfoMenu_V3;
  i: integer;
  pInfo: PInfoMenu;
  p: PByte;
  eventLen: byte;
  str0: string;

  bufLen: Integer;
  pacmd: PCmdTermSrvSetInfoMenuTSP_V3;
  info: PCmdinfo;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
begin
  Result := false;
  if not isActive then exit;
  FillChar(buff, 1024, 0);
  pacmd := @buff[0];
  if ADevice.InfoMenuList.Count = 0 then
    pacmd^.SetType := 0
  else
    pacmd^.SetType := 1;
//  pacmd^.InfoCount := ADevice.InfoMenuList.Count;
//  pacmd^.PackCount := pacmd^.InfoCount;
  p := PtrAdd(@buff[0], SizeOf(TCmdTermSrvSetInfoMenuTSP_V3));

  p^ := ADevice.InfoMenuList.Count;
  p := PtrAdd(p, 1);
  for i := 0 to ADevice.InfoMenuList.Count - 1 do
  begin
    pInfo := ADevice.InfoMenuItems[i];
    //写入 事件ID       1
    p^ := pInfo^.No;
    p := PtrAdd(p, 1);
    //得到事件的长度  1
    eventLen := Length(pInfo^.Info);
    PWord(p)^ := ByteOderConvert_Word(eventLen);
    p := PtrAdd(p, 2);
    
    InitStr(str0, eventLen);
    //写入事件信息        eventNoLen
    CopyMemory(@str0[1], @(pInfo^.info)[1], eventLen);
    CopyMemory(p, @str0[1], eventLen);
    p := PtrAdd(p, eventLen);
  end;

  bufLen := Integer(p) - Integer(@buff[0]);
  InitTSPHeader(pacmd^.Header, bufLen - TSPHEADERLEN, TERMSRV_SETINFOMENU_V3, ADevice.Id);

  tspPackSize := bufLen + 3;
  SetLength(tspBuf, tspPackSize);
  offSet := 0;
  tspBuf[offSet] := FLAGTSP;
  Inc(offSet);
  CopyMemory(@tspBuf[offset], @buff[0], bufLen);
  Inc(offSet, bufLen);
  tspBuf[offSet] := GetXorSum(@tspBuf[1], bufLen);
  Inc(offSet);
  tspBuf[offSet] := FLAGTSP;

  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(ADevice, escapByteBuf);
  info^.Desc := '设置车机信息菜单：' + ADevice.Car.No;

//
//  pcmd := @buff[0]; //pcmd 指向buff 首址
//  pcmd^.Size := 0;
//  pcmd^.Flag := TERMSRV_SETINFOMENU_V3;
//  pcmd^.ExtendedFlag := 0;
////  pcmd^.FactID := ADevice.fact_id;
//  pcmd^.DevID := DevId_StrToBCD(ADevice.Id);
//  pcmd^.CmdID := GetMaxCmdID;
//  p := PtrAdd(@buff[0], sizeof(TCmdTermSrvSetInfoMenu_V3)); //p 指向 buff 移过 已知结构后
//  p^ := ADevice.InfoMenuList.Count;  // 事件项个数   1
//  p := PtrAdd(p, 1);
//  for i := 0 to ADevice.InfoMenuList.Count - 1 do
//  begin
//    pInfo := ADevice.InfoMenuItems[i];
//    //写入 事件ID       1
//    p^ := pInfo^.No;
//    p := PtrAdd(p, 1);
//    //得到事件的长度  1
//    eventLen := Length(pInfo^.Info);
//    InitStr(str0, eventLen);
//    //写入事件信息        eventNoLen
//    CopyMemory(@str0[1], @(pInfo^.info)[1], eventLen);
//    CopyMemory(p, @str0[1], eventLen+1);
//    p := PtrAdd(p, eventLen+1);
//  end;
//  Pcmd^.Size := Integer(p) - Integer(@buff[0]);
//  Result := DirectSend(buff[0], pcmd^.Size);
//
//  info := ACmdManage.Add(pcmd^.CmdId);
//  info^.Id := pcmd^.CmdId;
//  info^.State := CMD_SNDNODO;
//  info^.Desc := '设置车机信息菜单：' + ADevice.Car.No;
//  info^.SendTime := now();
//  info^.CancelTime := 0;
//  info^.Replytime := 0;
//  SetLength(info^.Content, pcmd^.Size);
//  Move(buff[0], info^.Content[0], pcmd^.Size);
//  info^.ContentSize := pcmd^.Size;
//
//  SaveCMD.CmdList.AddData(pCmd^.CmdId, info);
end;


function TGateWayServerCom.SetTelList(ADevice: TDevice): boolean;
var
  buff: array[0..1023] of byte;
//  pcmd: PCmdTermSrvSetTelList_V3;
  info: PCmdinfo;
  i,len: integer;
  pTel: PTelInfo;
  p: PByte;
  telNoLen: byte;
  str0: string;
  
  bufLen: Integer;
  pacmd: PCmdTermSrvSetPhoneBookTSP_V3;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
begin
  Result := false;
  if not isActive then exit;
  FillChar(buff, 1024, 0);
  pacmd := @buff[0];
  if ADevice.TelList.Count = 0 then
    pacmd^.SetType := 0
  else
    pacmd^.SetType := 1;
//  pacmd^.PhoneCount := ADevice.TelList.Count;
//  pacmd^.PackCount := pacmd^.PhoneCount;
  p := PtrAdd(@buff[0], SizeOf(TCmdTermSrvSetPhoneBookTSP_V3));
  p^ := ADevice.TelList.Count;
  p := PtrAdd(p, 1);
  for i := 0 to ADevice.TelList.Count - 1 do
  begin
    pTel := ADevice.TelItems[i];
    //写入 电话类型       1
    p^ := pTel^.TelType;
    p := PtrAdd(p, 1);
    //写入电话号码长度
    telNoLen := Length(pTel^.No);
    p^ := telNoLen;
    p := PtrAdd(p, 1);
    //写入电话号码        telNoLen
    InitStr(str0, telNoLen);      
    CopyMemory(@str0[1], @(pTel^.No)[1], telNoLen);
    CopyMemory(p, @str0[1], telNoLen);
    p := PtrAdd(p, telNoLen);
    //写入联系人长度
    p^ := Length(pTel^.Name);
    p := PtrAdd(p, 1);
    //写入　电话拥有人    8
    InitStr(str0, Length(pTel^.Name));
    CopyMemory(@str0[1], @(pTel^.Name)[1], length(pTel^.Name));
    CopyMemory(p, @str0[1], Length(pTel^.Name));
    p := PtrAdd(p, Length(pTel^.Name));
  end;
  bufLen := Integer(p) - Integer(@buff[0]);
  InitTSPHeader(pacmd^.Header, bufLen - TSPHEADERLEN, TERMSRV_SETPHONEBOOK_V3, ADevice.Id);

  tspPackSize := bufLen + 3;
  SetLength(tspBuf, tspPackSize);
  offSet := 0;
  tspBuf[0] := FLAGTSP;
  Inc(offSet);
  CopyMemory(@tspBuf[offSet], @buff[0], bufLen);
  Inc(offSet, bufLen);
  tspBuf[offSet] := GetXorSum(@buff[0], bufLen);
  Inc(offSet);
  tspBuf[offSet] := FLAGTSP;
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(ADevice, escapByteBuf);
  info^.Desc := '设置电话本：' + ADevice.Car.No;

//  pcmd := @buff[0]; //pcmd 指向buff 首址
//  InitHeader(pCmd^.header,0,TERMSRV_SETTELLIST_V3,ADevice.Id);
////  pcmd^.Size := 0;
////  pcmd^.Flag := TERMSRV_SETTELLIST_V3;
////  pcmd^.ExtendedFlag := 0;
//////  pcmd^.FactID := ADevice.fact_id;
////  pcmd^.DevID := DevId_StrToBCD(ADevice.Id);
////  pcmd^.CmdID := GetMaxCmdID;
//  if ADevice.TelList.Count =0 then
//    pcmd^.SetType := 0
//  else
//    pcmd^.SetType := 1;
//  pCmd^.SetCount := ADevice.TelList.Count;
//  pCmd^.PackCount := 1;
//
//  p := PtrAdd(@buff[0], sizeof(TCmdTermSrvSetTelList_V3)); //p 指向 buff 移过 已知结构后
//  for i := 0 to ADevice.TelList.Count - 1 do
//  begin
//    pTel := ADevice.TelItems[i];
//    //写入 电话类型       1
//    p^ := pTel^.TelType;
//    p := PtrAdd(p, 1);
//    //写入电话号码长度
//    telNoLen := Length(pTel^.No);
//    p^ := telNoLen+1;
//    p := PtrAdd(p, 1);
//    //写入电话号码        telNoLen
//    InitStr(str0, telNoLen);      
//    CopyMemory(@str0[1], @(pTel^.No)[1], telNoLen);
//    CopyMemory(p, @str0[1], telNoLen+1);
//    p := PtrAdd(p, telNoLen+1);
//    //写入联系人长度
//    p^ := Length(pTel^.Name)+1;
//    p := PtrAdd(p, 1);
//    //写入　电话拥有人    8
//    InitStr(str0, Length(pTel^.Name));
//    CopyMemory(@str0[1], @(pTel^.Name)[1], length(pTel^.Name));
//    CopyMemory(p, @str0[1], Length(pTel^.Name)+1);
//    p := PtrAdd(p, Length(pTel^.Name)+1);
//  end;
//  { TODO -osjp : 设置电话本：是否设置类型为0时，不带后面字节？ }
//  if  ADevice.TelList.Count=0 then
//    len := sizeof(TCmdTermSrvSetTelList_V3) -2
//  else
//    len := Integer(p) - Integer(@buff[0]);
//  Pcmd^.Header.Size := len;
//  Result := DirectSend(buff[0], len);
//
//  info := ACmdManage.Add(pcmd^.Header.CmdOrder);
////  info^.Id := pcmd^.CmdId;
//  info^.DevId := ADevice.id;
//  info^.State := CMD_SNDNODO;
//  info^.Desc := '设置电话本：' + ADevice.Car.No;
//  info^.SendTime := now();
//  info^.CancelTime := 0;
//  info^.Replytime := 0;
//  SetLength(info^.Content, pcmd^.Header.Size);
//  Move(buff[0], info^.Content[0], pcmd^.Header.Size);
//  info^.ContentSize := pcmd^.Header.Size;
//
//  SaveCMD.CmdList.AddData(pCmd^.Header.CmdOrder, info);
end;

//function TGateWayServerCom.ModifyDevDisplayFixedMenu(ATargetID: Integer;
//  AMenuContent: PByte; AContenLen: Integer): boolean;
//var
//  buff: array of byte;
//  pCmd: PCmdTermSrvModifyDevDisplayFixedMenu;
//  len: Integer;
//  info: PCmdinfo;
//begin
//  Result := false;
//  if not isActive then exit;
//  len := sizeof(TCmdTermSrvModifyDevDisplayFixedMenu) + AContenLen;
//  setlength(buff, len);
//  pCmd := @buff[0];
//  pCmd^.Size := len;
//  pCmd^.Flag := TERMSRV_MODIFYDEVDISPLAYFIXEDMENU;
//  pCmd^.CmdID := GetMaxCmdID;
//  pCmd^.DevID := ATargetID;
//  CopyMemory(@buff[sizeof(TCmdTermSrvModifyDevDisplayFixedMenu)], AMenuContent, AContenLen);
//  Result := DirectSend(buff[0], len);
//
//  info := ACmdManage.Add(pCmd^.CmdId);
//  info^.Id := pCmd^.CmdId;
//  info^.State := CMD_SNDNODO;
//  info^.Desc := '修改车机固定菜单：' + ADeviceManage.Find(ATargetID).Car.No;
//  info^.DevId := ATargetID;
//  info^.SendTime := now();
//  info^.CancelTime := 0;
//  info^.Replytime := 0;
//  SetLength(info^.Content, pCmd^.Size);
//  Move(buff[0], info^.Content[0], pCmd^.Size);
//  info^.ContentSize := pCmd^.Size;
//end;
//
//function TGateWayServerCom.ModifyDevDisplayName(ATargetId: Integer;
//  ADevDisplayName: string; ANameLen: Integer): boolean;
//var
//  buff: array of byte;
//  pCmd: PCmdTermSrvModifyDevDisplayName;
//  len: Integer;
//  info: PCmdinfo;
//begin
//  Result := false;
//  if not isActive then exit;
//  len := sizeof(TCmdTermSrvModifyDevDisplayName) + ANameLen;
//  setlength(buff, len);
//  pCmd := @buff[0];
//  pCmd^.Size := len;
//  pCmd^.Flag := TERMSRV_MODIFYDEVDISPLAYNAME;
//  pCmd^.CmdID := GetMaxCmdID;
//  pCmd^.DevID := ATargetID;
//  CopyMemory(@buff[sizeof(TCmdTermSrvModifyDevDisplayName)], @ADevDisplayName[1], ANameLen);
//  Result := DirectSend(buff[0], len);
//
//  info := ACmdManage.Add(pCmd^.CmdId);
//  info^.Id := pCmd^.CmdId;
//  info^.State := CMD_SNDNODO;
//  info^.Desc := '修改车机显示屏公司名称：' + ADeviceManage.Find(ATargetID).Car.No;
//  info^.DevId := ATargetId;
//  info^.SendTime := now();
//  info^.CancelTime := 0;
//  info^.Replytime := 0;
//  SetLength(info^.Content, pCmd^.Size);
//  Move(buff[0], info^.Content[0], pCmd^.Size);
//  info^.ContentSize := pCmd^.Size;
//end;



function TGateWayServerCom.RemoveAlarm_V3(ATargetId: string): boolean; {解除报警}
var
  cmd: TCmdTermSrvRemoveAlarm_V3;
  info: PCmdinfo;
  len:Integer;
begin
  Result := false;
  if not isActive then exit;
  len := sizeof(TCmdTermSrvRemoveAlarm_V3);
  InitHeader(cmd.Header,len,TERMSRV_REMOVEALARM_V3,ATargetID);
//  GReadParamCmdID := cmd.CmdID;
  Result := DirectSend(cmd, len);

  info := ACmdManage.Add(cmd.Header.CmdOrder);
//  info^.Id := cmd.CmdId;
  info^.State := CMD_SNDNODO;
  info^.Desc := '解除车机报警：' + ADeviceManage.Find(ATargetID).Car.No;
  info^.SendTime := now();
  info^.CancelTime := 0;
  info^.Replytime := 0;
  SetLength(info^.Content, len);
  Move(cmd, info^.Content[0], len);
  info^.ContentSize := len;

//  SaveCMD.CmdList.AddData(Cmd.Header.CmdOrder, info);
end;

function TGateWayServerCom.ConfirmEarlyWarning_V3(ATargetId: string): Boolean;
var
  cmd: TCmdTermSrvConfirmEarlyWarning_V3;
  info: PCmdinfo;
begin
  Result := false;
  if not isActive then exit;
  cmd.Size := sizeof(TCmdTermSrvConfirmEarlyWarning_V3);
  cmd.Flag := TERMSRV_CONFIRMEARLYWARNING_V3;
  cmd.ExtendedFlag := 0;
//  cmd.FactID := ADeviceManage.Find(ATargetID).fact_id;
  cmd.DevID := DevId_StrToBCD(ATargetId);
  cmd.CmdID := GetMaxCmdID;
  GReadParamCmdID := cmd.CmdID;
  Result := DirectSend(cmd, cmd.Size);

  info := ACmdManage.Add(cmd.CmdId);
  info^.Id := cmd.CmdId;
  info^.State := CMD_SNDNODO;
  info^.Desc := '确认车机预警：' + ADeviceManage.Find(ATargetID).Car.No;
  info^.SendTime := now();
  info^.CancelTime := 0;
  info^.Replytime := 0;
  SetLength(info^.Content, cmd.Size);
  Move(cmd, info^.Content[0], cmd.Size);
  info^.ContentSize := cmd.Size;

//  SaveCMD.CmdList.AddData(Cmd.CmdId, info);
end;

function TGateWayServerCom.CancelEarlyWarning_V3(ATargetId: string): Boolean;
var
  cmd: TCmdTermSrvConfirmEarlyWarning_V3;
  info: PCmdinfo;
begin
  Result := false;
  if not isActive then exit;
  cmd.Size := sizeof(TCmdTermSrvConfirmEarlyWarning_V3);
  cmd.Flag := TERMSRV_CANCELEARLYWARNING_V3;
  cmd.ExtendedFlag := 0;
//  cmd.FactID := ADeviceManage.Find(ATargetID).fact_id;
  cmd.DevID := DevId_StrToBCD(ATargetId);
  cmd.CmdID := GetMaxCmdID;
  GReadParamCmdID := cmd.CmdID;
  Result := DirectSend(cmd, cmd.Size);

  info := ACmdManage.Add(cmd.CmdId);
  info^.Id := cmd.CmdId;
  info^.State := CMD_SNDNODO;
  info^.Desc := '取消车机预警：' + ADeviceManage.Find(ATargetID).Car.No;
  info^.SendTime := now();
  info^.CancelTime := 0;
  info^.Replytime := 0;
  SetLength(info^.Content, cmd.Size);
  Move(cmd, info^.Content[0], cmd.Size);
  info^.ContentSize := cmd.Size;

//  SaveCMD.CmdList.AddData(cmd.CmdId, info);
end;

//function TGateWayServerCom.RemoveAlarm(ATargetId: integer): boolean;
//var
//  cmd: TCmdTermSrvRemoveAlarm;
//  info: PCmdinfo;
//begin
//  Result := false;
//  if not isActive then exit;
//  cmd.Size := sizeof(TCmdTermSrvRemoveAlarm);
//  cmd.Flag := TERMSRV_REMOVEALARM;
//  cmd.CmdID := GetMaxCmdID;
//  cmd.DevID := ATargetID;
//  Result := DirectSend(cmd, cmd.Size);
//
//  info := ACmdManage.Add(cmd.CmdId);
//  info^.Id := cmd.CmdId;
//  info^.State := CMD_SNDNODO;
//  info^.Desc := '解除车机报警：' + ADeviceManage.Find(ATargetID).Car.No;
//  info^.SendTime := now();
//  info^.CancelTime := 0;
//  info^.Replytime := 0;
//  SetLength(info^.Content, cmd.Size);
//  Move(cmd, info^.Content[0], cmd.Size);
//  info^.ContentSize := cmd.Size;
//end;

//function TGateWayServerCom.SendControlInfo(ATargetID: Integer; ADevIDs: string;
//  AControlInfo: string; AInfoLen: Integer; MsgID: integer; isAddToCmdList: boolean = true): boolean;
//var
//  buff: array of byte;
//  pCmd: PCmdTermSrvSendControlInfo;
//  len: Integer;
//  info: PCmdinfo;
//begin
//  Result := false;
//  if not isActive then exit;
//  len := sizeof(TCmdTermSrvSendControlInfo) + AInfoLen;
//  setlength(buff, len);
//  pCmd := @buff[0];
//  pCmd^.Size := len;
//  pCmd^.Flag := TERMSRV_SENDCONTROLINFO;
//  pCmd^.CmdID := GetMaxCmdID;
//  pCmd^.DevID := ATargetID;
//  pCmd^.MsgID := MsgID; //Bs.AddNewMsg(MSGTYPE_NORMAL,ADevIDs,AControlInfo);
//  CopyMemory(@buff[sizeof(TCmdTermSrvSendControlInfo)], @AControlInfo[1], AInfoLen);
//  Result := DirectSend(buff[0], len);
//
//  if not isAddToCmdList then exit;
//  info := ACmdManage.Add(pCmd^.CmdId);
//  info^.Id := pCmd^.CmdId;
//  info^.State := CMD_SNDNODO;
//  info^.Desc := '向车机发送文本调度信息：' + ADeviceManage.Find(ATargetID).Car.No;
//  info^.DevId := ATargetID;
//  info^.SendTime := now();
//  info^.CancelTime := 0;
//  info^.Replytime := 0;
//  SetLength(info^.Content, pCmd^.Size);
//  Move(buff[0], info^.Content[0], pCmd^.Size);
//  info^.ContentSize := pCmd^.Size;
//end;

//function TGateWayServerCom.SendControlCmdTxt(ATargetID: Integer;
//  AControlInfo: string; AInfoLen: Integer; MsgID: integer; AControlCmd:Byte ;
//  isAddToCmdList: boolean = true): boolean;
//  procedure InitStr(var AStr: string; len: Word);
//  var
//    i: integer;
//  begin
//    SetLength(AStr, len+1);
//    for i := 1 to len+1 do
//      AStr[i] := #0;
//  end;
//var
//  buff: array of byte;
//  pCmd: PCmdTermSrvSendControlCmdTxt;
//  len: Integer;
//  info: PCmdinfo;
//  s: String;
//  str: string;
//begin
//  Result := false;
//  if not isActive then exit;
//  len := sizeof(TCmdTermSrvSendControlCmdTxt) + AInfoLen+1;
//  setlength(buff, len);
//  pCmd := @buff[0];
//  pCmd^.Size := len;
//  pCmd^.Flag := TERMSRV_SENDCONTROLCMDTXT;
//  pCmd^.ExtendedFlag := 0;
//  pCmd^.FactID := ADeviceManage.Find(ATargetID).fact_id;
//  pCmd^.DevID := ATargetID;
//  pCmd^.CmdID := GetMaxCmdID;
//  //pCmd^.MsgID := MsgID; //Bs.AddNewMsg(MSGTYPE_NORMAL,ADevIDs,AControlInfo);
//  pCmd^.ControlCmd := AControlCmd;
//  InitStr(str, AInfoLen);
//  CopyMemory(@str[1], @AControlInfo[1], AInfoLen);
//  CopyMemory(@buff[sizeof(TCmdTermSrvSendControlCmdTxt)], @str[1], AInfoLen+1);
//  Result := DirectSend(buff[0], len);
//
//  if not isAddToCmdList then exit;
//  info := ACmdManage.Add(pCmd^.CmdId);
//  info^.Id := pCmd^.CmdId;
//  info^.State := CMD_SNDNODO;
//
//  info^.Desc := '向车机发送文本调度信息：' + ADeviceManage.Find(ATargetID).Car.No;
//  info^.DevId := ATargetID;
//  info^.SendTime := now();
//  info^.CancelTime := 0;
//  info^.Replytime := 0;
//  SetLength(info^.Content, pCmd^.Size);
//  Move(buff[0], info^.Content[0], pCmd^.Size);
//  info^.ContentSize := pCmd^.Size;
//end;

function TGateWayServerCom.SendControlInfo_Alarm_V3(msgID: Integer; Adev:TDevice;
                                            AControlInfo: string; AInfoLen:
                                            Integer; ControlCmd: Byte;needSave:Boolean = false): Boolean;
var
//  buff: TByteDynArray;
//  pCmd: PCmdTermSrvSendControlInfo_V3;
//
//  cmd: TCmdTermSrvSendControlInfoHRB_V3;
//  len: Integer;
//  str: string;

  acmd: TCmdTermSrvSendControlInfoTSP_V3;//TCmdTermSrvSetDevParam_V3;//TCmdTermSrvSetDevParam_V2;
//  buf: array of Byte;
  info: PCmdinfo;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
begin
  Result := false;
  if not isActive then exit;
  tspPackSize := SizeOf(TCmdTermSrvSendControlInfoTSP_V3)  + AInfoLen + 1;//加1位校验码
  InitTSPHeader(acmd.Header, tspPackSize - TSPHEADERLEN - 1, TERMSRV_TEXTINFO_V3, ADev.Id);
  acmd.ControlCmd := ControlCmd;

  SetLength(tspBuf, tspPackSize + 2);//整个完整的包需在包两端加标识位
  offSet := 0;
  tspBuf[offset] := FLAGTSP;//标识位
  Inc(offSet);

  CopyMemory(@tspBuf[offset], @acmd, SizeOf(TCmdTermSrvSendControlInfoTSP_V3));
  Inc(offSet, SizeOf(TCmdTermSrvSendControlInfoTSP_V3));

  CopyMemory(@tspBuf[offset], @AControlInfo[1], AInfoLen);
  Inc(offSet, AInfoLen);

  tspBuf[offSet] := GetXorSum(@tspBuf[1], tspPackSize - 1);//从消息头开始，不包括标识位
  Inc(offSet);

  tspBuf[offSet] := FLAGTSP;//标识位
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(ADev, escapByteBuf);
  info^.Desc := '下发文本信息：' + ADev.Car.No+'['+AControlInfo+']';
  if currAlarmInfo <> nil then
  begin
    info^.alarmInfoId := currAlarmInfo.Id;
    info^.alarmDealFlag := 3;
  end;
  Result := True;

  {哈尔滨5字节版
  len := SizeOf(TCmdTermSrvSendControlInfoHRB_V3) + aInfoLen + 2;
  SetLength(buff, len);
  InitTSPHeaderHRB(cmd.Header,  1 + AInfoLen, TERMSRVTEXTINFO_V3, Adev.Id);
  cmd.ControlCmd := ControlCmd;
  CopyMemory(@buff[0], @cmd, SizeOf(TCmdTermSrvSendControlInfoHRB_V3));
  CopyMemory(@buff[SizeOf(TCmdTermSrvSendControlInfoHRB_V3)], @AControlInfo[1], AInfoLen);
  //buff[len - 1] := GetXorSum(@buff[0], len - 1);
  SendCmdTSPHRB_V3(Adev.Id, buff);
  }

  {len := sizeof(TCmdTermSrvSendControlInfo_V3) + AInfoLen+1;
  setlength(buff, len);
  pCmd := @buff[0];
  InitHeader(pcmd^.Header,len,TERMSRV_SENDTXTMSG_V3, ADev.ID);

  pCmd^.ID := msgID;
  pCmd^.ControlCmd := ControlCmd; //Bs.AddNewMsg(MSGTYPE_NEEDANSWER,ADevIDstr,AControlInfo);
  InitStr(str, AInfoLen);
  CopyMemory(@str[1], @AControlInfo[1], AInfoLen);
  CopyMemory(@buff[sizeof(TCmdTermSrvSendControlInfo_V3)], @str[1], AInfoLen+1);
  Result := DirectSend(buff[0], len);

  if needSave then
  begin
    info := ACmdManage.Add(pCmd^.Header.CmdOrder);
  //  info^.Id := pCmd^.CmdId;
    info^.State := CMD_SNDNODO;
    info^.Desc := '下发文本信息：' + ADev.Car.No+'['+AControlInfo+']';
    info^.DevId := ADev.ID;
    info^.SendTime := now();
    info^.CancelTime := 0;
    info^.Replytime := 0;
    SetLength(info^.Content,len);
    Move(buff[0], info^.Content[0], len);
    info^.ContentSize :=len;

    SaveCMD.CmdList.AddData(pCmd^.Header.CmdOrder, info);
  end;}
end;

function TGateWayServerCom.UpdateDevFirmware(ATargetID: string; AUpdateDevType: byte;
                                            AURL: string; AURLLen: Integer): boolean;
var
  buff: array of byte;
  pCmd: pCmdTermSrvUpdateDevFirmware_V3;
  len: Integer;
  info: PCmdinfo;
  str: string;
begin
  Result := false;
  if not isActive then exit;
  len := sizeof(pCmdTermSrvUpdateDevFirmware_V3) + AURLLen+1;
  setlength(buff, len);
  pCmd := @buff[0];
  pCmd^.Size := len;
  pCmd^.Flag := TERMSRV_UPDATEFIRMWARE_V3;
  pCmd^.ExtendedFlag := 0;
//  pCmd^.FactID := ADeviceManage.Find(ATargetID).fact_id;
  pCmd^.DevID := DevId_StrToBCD(ATargetID);
  pCmd^.CmdID := GetMaxCmdID;
  pCmd^.UpdateType := AUpdateDevType;

  InitStr(str, AURLLen);
  CopyMemory(@str[1], @AURL[1], AURLLen);
  CopyMemory(@buff[sizeof(pCmdTermSrvUpdateDevFirmware_V3)], @str[1], AURLLen+1);
  Result := DirectSend(buff[0], len);

  info := ACmdManage.Add(pCmd^.CmdId);
  info^.Id := pCmd^.CmdId;
  info^.State := CMD_SNDNODO;
  case AUpdateDevType of
    UPDATEDEV_DEV: str := '主机';
    UPDATEDEV_DISPLAY: str := '显示屏';
  end;
  info^.Desc := '升级车机' + str + '固件：' + ADeviceManage.Find(ATargetID).Car.No;
  info^.SendTime := now();
  info^.CancelTime := 0;
  info^.Replytime := 0;
  SetLength(info^.Content, pCmd^.Size);
  Move(buff[0], info^.Content[0], pCmd^.Size);
  info^.ContentSize := pCmd^.Size;
end;



procedure TGateWayServerCom.DealReadDevParam_V3(ABuf: PByte);
var
  cmdId, devId: integer;
  devIdStr:String;
  p: PCmdInfo;
  dev: Tdevice;
//  RvHandle:integer;
  paramID: integer;
  len: integer;
  paramStr: string; //参数内容
  ParamByte: array of Byte;
  ParamInt: integer;
  ParamLongWord: longWord;
  ParamIP: string;
  ParamBool: Byte;
  ParamIDS: string;
  ParamDateTime: TDateTime;
  temp: string;
  i: LongWord;
  Year, Month, Day, Hour: string;
begin
    cmdId := PCmdSrvTermReadDevParam_V3(ABuf)^.Header.CmdOrder;
//    devId := BCDToInt(@PCmdSrvTermReadDevParam_V3(ABuf)^.DevID[0]);
    devIdStr := BcdToStr(@(PCmdSrvTermReadDevParam_V3(ABuf)^.Header.DevID[0]));
    dev := ADeviceManage.Find(devIdStr);
    if dev = nil then exit;
    Dev.LastConnectTime := now;
    p := ACmdManage.Find(cmdId);
    if p = nil then exit;
    p^.State := CMD_DONE;
    p^.Replytime := now();

    paramID := PCmdSrvTermReadDevParam_V3(ABuf)^.ParamID;
    //参数内容暂存　paramContent
    len := PCmdSrvTermReadDevParam_V3(ABuf)^.ParamLen;
    if (Len <= 0) or (Len > 201) then exit;
    SetLength(paramStr, len);
    SetLength(ParamByte, Len);
    CopyMemory(@paramStr[1], PtrAdd(ABuf, sizeof(TCmdSrvTermReadDevParam_V3)), len);
    CopyMemory(@paramByte[0], PtrAdd(ABuf, sizeof(TCmdSrvTermReadDevParam_V3)), len);

    if ReadParamfrm = nil then exit;
    ReadParamFrm.SetCurrentDev(Dev);
    ReadParamfrm.Show;
//    ReadParamfrm.BitBtnSaveReadedParam.Visible := True;

    if (paramID = $0091) and (len = 5) then
    begin
      Year := IntToHex(paramByte[0],2) + IntToHex(paramByte[1],2);
      Month := IntToHex(paramByte[2],2);
      Day := IntToHex(paramByte[3],2);
      Hour := IntToHex(paramByte[4],2);
      {temp := IntToHex(paramByte[0],2) + IntToHex(paramByte[1],2)
              + '-' + IntToHex(paramByte[2],2) + '-' + IntToHex(paramByte[3],2)
              + ' ' + IntToHex(paramByte[4],2) + ':00:00';
      ParamDateTime := StrToDateTime(FormatDateTime('YYYY-MM-DD hh:nn:ss', StrToDateTime(temp)));  }
    end;

    ParamInt := 0;
    if Len <= 4 then
    begin
      ParamInt := 0;
      for i := len-1 downto 0 do
      begin
        ParamInt := ParamInt shl 8;
        ParamInt := ParamInt + ParamByte[i];
      end;
    end;
    if Len = 4 then  //IP地址处理
    begin
      ParamIP := IntToStr(ParamByte[0]) + '.' + IntToStr(ParamByte[1]) + '.' +
        IntToStr(ParamByte[2]) + '.' + IntToStr(ParamByte[3]);
      paramStr := ParamIP;
    end;

    if Len = 1 then
      ParamBool := Parambyte[0];
    i := 0;
    if Len = 5 then //for Dev Id
    begin
      ParamIDS := InttoHex(ParamByte[0],2);
      ParamIDS := ParamIDS + InttoHex(ParamByte[1],2);
      ParamIDS := ParamIDS + InttoHex(ParamByte[2],2);
      ParamIDS := ParamIDS + InttoHex(ParamByte[3],2);
      ParamIDS := ParamIDS + InttoHex(ParamByte[4],2);
      //i := i + ParamByte[1];
      //i := i shl 8;
      //i := i + ParamByte[2];
      //i := i shl 8;
      //i := i + ParamByte[3];
      //i := i shl 8;
      //i := i + ParamByte[4];
      //ParamIDS := ParamIDS + formatFloat('0000000000',i);
    end;
    ParamLongWord := ParamInt;

    case paramID of
      $0001: ReadParamFrm.Edit12.Text := IntToStr(ParamInt);
      $0002: ReadParamFrm.Edit34.Text := IntToStr(ParamInt);
      $0003: ReadParamFrm.Edit13.Text := IntToStr(ParamInt);
      $0004: ReadParamFrm.Edit59.Text := IntToStr(ParamInt);
      $0005: ReadParamFrm.Edit60.Text := IntToStr(ParamInt);
      $0010: ReadParamFrm.Edit6.Text := paramStr;
      $0011: ReadParamFrm.Edit61.Text := paramStr;
      $0012: ReadParamFrm.Edit62.Text := paramStr;
      $0013: ReadParamFrm.Edit7.Text := paramStr;
      $0014: ReadParamFrm.Edit63.Text := paramStr;
      $0015: ReadParamFrm.Edit11.Text := paramStr;
      $0016: ReadParamFrm.Edit64.Text := paramStr;
      $0017: ReadParamFrm.Edit9.Text := paramStr;
      $0018: ReadParamFrm.Edit65.Text := IntToStr(ParamInt);
      {//$0091:
        begin
          ReadParamFrm.date81.Date := ParamDateTime;
          ReadParamFrm.time81.Time := ParamDateTime;
        end;
      $0090: ReadParamFrm.Edit82.Text := IntToStr(ParamInt); }
      $0020: ReadParamFrm.Edit14.ItemIndex := ParamInt;
      $0021: ReadParamFrm.Edit15.ItemIndex := ParamInt;
      $0022: ReadParamFrm.Edit351.Text := IntToStr(ParamInt);
      $0023: ReadParamFrm.Edit353.Text := IntToStr(ParamInt);
      $0024: ReadParamFrm.Edit355.Text := IntToStr(ParamInt);
      $0025: ReadParamFrm.Edit357.Text := IntToStr(ParamInt);
      $0026: ReadParamFrm.Edit359.Text := IntToStr(ParamInt);
      $0027: ReadParamFrm.Edit361.Text := IntToStr(ParamInt);
      $0028: ReadParamFrm.Edit362.Text := IntToStr(ParamInt);
      $0029: ReadParamFrm.Edit352.Text := IntToStr(ParamInt);
      $002A: ReadParamFrm.Edit354.Text := IntToStr(ParamInt);
      $002B: ReadParamFrm.Edit356.Text := IntToStr(ParamInt);
      $002C: ReadParamFrm.Edit358.Text := IntToStr(ParamInt);
      $002D: ReadParamFrm.Edit360.Text := IntToStr(ParamInt);
      $002E: ReadParamFrm.Edit364.Text := IntToStr(ParamInt);
      $002F: ReadParamFrm.Edit365.Text := IntToStr(ParamInt);
      $0030: ReadParamFrm.Edit363.Text := IntToStr(ParamInt);

      $0040: ReadParamFrm.Edit66.Text := paramStr;
      $0041: ReadParamFrm.Edit3.Text := paramStr;
      $0042: ReadParamFrm.Edit67.Text := paramStr;
      $0043: ReadParamFrm.Edit4.Text := paramStr;
      $0044: ReadParamFrm.Edit5.Text := paramStr;
      $0045: ReadParamFrm.Edit57.ItemIndex := ParamInt;
      $0046: ReadParamFrm.Edit55.Text := IntToStr(ParamInt);
      $0047: ReadParamFrm.Edit68.Text := IntToStr(ParamInt);
      $0048: ReadParamFrm.Edit36.Text := IntToStr(ParamInt);
      $0049: ReadParamFrm.Edit2.Text := paramStr;

      $0050: //'功能屏蔽标志';
        begin
          i:=0;
          while i<32 do //0-32
          begin
            ReadParamFrm.cxCheckListBox56.Items[i].Checked := ParamByte[0 + i div 8] and (1 shl (i mod 8)) = (1 shl (i mod 8));
            inc(i);
          end;
        end;
      $0051: //'功能屏蔽标志';
        begin
          i:=0;
          while i<32 do //0-32
          begin
            ReadParamFrm.cxCheckListBox1.Items[i].Checked := ParamByte[0 + i div 8] and (1 shl (i mod 8)) = (1 shl (i mod 8));
            inc(i);
          end;
        end;
      $0052: //'功能屏蔽标志';
        begin
          i:=0;
          while i<32 do //0-32
          begin
            ReadParamFrm.cxCheckListBox2.Items[i].Checked := ParamByte[0 + i div 8] and (1 shl (i mod 8)) = (1 shl (i mod 8));
            inc(i);
          end;
        end;
      $0053: //'功能屏蔽标志';
        begin
          i:=0;
          while i<32 do //0-32
          begin
            ReadParamFrm.cxCheckListBox3.Items[i].Checked := ParamByte[0 + i div 8] and (1 shl (i mod 8)) = (1 shl (i mod 8));
            inc(i);
          end;
        end;
      $0054: //'功能屏蔽标志';
        begin
          i:=0;
          while i<32 do //0-32
          begin
            ReadParamFrm.cxCheckListBox4.Items[i].Checked := ParamByte[0 + i div 8] and (1 shl (i mod 8)) = (1 shl (i mod 8));
            inc(i);
          end;
        end;

      $0055: ReadParamFrm.Edit16.Text := IntToStr(ParamInt);
      $0056: ReadParamFrm.Edit47.Text := IntToStr(ParamInt);
      $0057: ReadParamFrm.Edit422.Text := IntToStr(ParamInt);
      $0058: ReadParamFrm.Edit421.Text := IntToStr(ParamInt);
      $0059: ReadParamFrm.Edit423.Text := IntToStr(ParamInt);
      $005A: ReadParamFrm.Edit424.Text := IntToStr(ParamInt);

      $0070: ReadParamFrm.Edit69.Text := IntToStr(ParamInt);
      $0071: ReadParamFrm.Edit70.Text := IntToStr(ParamInt);
      $0072: ReadParamFrm.Edit71.Text := IntToStr(ParamInt);
      $0073: ReadParamFrm.Edit72.Text := IntToStr(ParamInt);
      $0074: ReadParamFrm.Edit73.Text := IntToStr(ParamInt);

      $0080: ReadParamFrm.Edit74.Text := IntToStr(ParamInt);
      $0081: ReadParamFrm.Edit75.Text := IntToStr(ParamInt);
      $0082: ReadParamFrm.Edit76.Text := IntToStr(ParamInt);


      $0091:
        begin
          ReadParamFrm.EditYear.Text := Year;
          ReadParamFrm.EditMonth.Text := Month;
          ReadParamFrm.EditDay.Text := Day;
          ReadParamFrm.EditHour.Text := Hour;
        end;
      $0090: ReadParamFrm.Edit1.Text := IntToHex(ParamInt, 2);

      $00A0: ReadParamFrm.Edit100.ItemIndex := ParamInt - 1;
      $00A1: ReadParamFrm.Edit28.Text := IntToStr(ParamInt);
      $00A2: ReadParamFrm.Edit29.Text := IntToStr(ParamInt);
      $00A3: ReadParamFrm.Edit30.Text := IntToStr(ParamInt);
      $00AF: ReadParamFrm.Edit31.Text := IntToStr(ParamInt);
      $00B0: ReadParamFrm.Edit32.ItemIndex := ParamInt;
      $00B1: ReadParamFrm.Edit99.Text := paramStr;//IntToStr(ParamInt);
      $00B2: ReadParamFrm.Edit50.Text := paramStr;//IntToStr(ParamInt);
      $00B3: ReadParamFrm.Edit51.Text := paramStr;//IntToStr(ParamInt);
      $00B4: ReadParamFrm.Edit52.Text := paramStr;//IntToStr(ParamInt);
      $00B5: ReadParamFrm.Edit53.Text := IntToStr(ParamInt);

      $F001: ReadParamFrm.Edit83.Text := ParamIDS;//IntToStr(ParamInt);
      $004B: ReadParamFrm.Edit26.Text := IntToStr(ParamInt);

      $0019: ReadParamFrm.Edit81.Text := IntToStr(ParamInt);
      $004A: ReadParamFrm.Edit82.Text := paramStr;
      $F002: ReadParamFrm.Edit33.ItemIndex := ParamInt;
      $F008: ReadParamFrm.Edit101.Text := IntToStr(ParamInt);
    else
      begin
      //  TDebug.GetInstance.SendDebug('读设备参数的返回数据有错误', '参数序号：$' + IntToHex(paramID, 4));
        p^.State := CMD_DOERROR;
        p^.Replytime := now();
        exit;
      end;
    end;  
end;

procedure TGateWayServerCom.DealQueryMcuState_V3(QueryType: Byte; dev: TDevice; ABuf: PByte);
begin
  if Assigned(FLightStateListUpLoad) then
    FLightStateListUpLoad(QueryType ,dev, ABuf);
end;

procedure TGateWayServerCom.DealQueryPicture_V3(Buf: PByte);
var
  cmdId: Integer;
  devIdstr:string;
  dev: Tdevice;
  Count: Word;
  p: PByte;
  info: PCmdInfo;
  PictureType: Byte;
  pCmd: PCmdTermSrvQueryPicture_V3;
begin
  pCmd := PCmdTermSrvQueryPicture_V3(Buf);
  devIdstr := BCDToStr(@(pCmd^.DevID[0]));
  cmdId := pCmd^.CmdId;
  Count := (pCmd^.Size-19) div 4;//pCmd^.Count div 4;
  dev := ADeviceManage.Find(devIdstr);

  p := PtrAdd(pCmd, sizeof(TCmdTermSrvQueryPicture_V3));

  info := ACmdManage.Find(cmdId);
  if info = nil then exit;
  
  if Count > 0 then
  begin
    if info = nil then
      PictureType := 3
    else
      PictureType := info^.PictureType;

    if Assigned(FQueryPicture) then FQueryPicture(p, Count, Dev, info^.Reason);
  end;

  info^.State := CMD_DONE;
  info^.Replytime := now();
  if Count > 0 then
  begin
    PopMsg('图像检索应答应答', info^.Desc + ' 上传了图像列表，请查看');
  end
  else
  begin
     PopMsg('图像检索应答应答', dev.Car.No + #13 + #10 + '无 ' + info^.Reason+ ' 图像文件');
  end;
end;

procedure TGateWayServerCom.DealQueryAudio_V3(Buf: PByte);
var
  cmdId: Integer;
  devIdstr:String;
  dev: Tdevice;
  Count: Word;
  p: PByte;
  info: PCmdInfo;
  PictureType: Byte;
  pCmd: PCmdTermSrvQueryAudio_V3;
begin
  pCmd := PCmdTermSrvQueryAudio_V3(Buf);
  devIdstr := BCDToStr(@(pCmd^.DevID[0]));
  cmdId := pCmd^.CmdId;
  Count := (pCmd^.Size-19) div 4;//pCmd^.Count div 4;
  dev := ADeviceManage.Find(devIdstr);

  p := PtrAdd(pCmd, sizeof(TCmdTermSrvQueryAudio_V3));

  info := ACmdManage.Find(cmdId);
  if info = nil then exit;

  if Count > 0 then
  begin
    if info = nil then
      PictureType := 3
    else
      PictureType := info^.PictureType;

    if Assigned(FQueryAudio) then FQueryAudio(p, Count, Dev, info^.Reason);
  end;

  info^.State := CMD_DONE;
  info^.Replytime := now();
  if Count > 0 then
  begin
    PopMsg('视频检索应答应答', info^.Desc + ' 上传了视频列表，请查看');
  end
  else
  begin
     PopMsg('视频检索应答应答', dev.Car.No + #13 + #10 + '无 ' + info^.Reason + ' 音频文件');
  end;
end;

procedure TGateWayServerCom.DealSeveJudge_V3(pBuf: PByte);
//var
//  p: PCmdSrvTermServeJudge_V3;
//  dev_idstr: string;
//  dev: TDevice;
//  temp: string;
//  syyje, xslc, kslc: Double;
begin
//  try
//    dev_idstr := BCDToStr(@PCmdSrvTermDRunData_V3(pBuf)^.GpsData.DevId[0]);
//    dev := ADeviceManage.find(dev_idstr);
//    if dev <> nil then
//    begin
//
//      case PCmdSrvTermDRunData_V3(pBuf)^.Server_Type of
//        0:;   // 未评价
//        1:    // 满意
//          begin
//            dev.MY := dev.MY + 1;
//          end;
//        2:;   // 一般
//        3:    // 不满意
//          begin
//            dev.BMY := dev.BMY + 1;
//          end;
//        4:    // 投诉
//          begin
//            dev.AccuseNum := dev.AccuseNum + 1;
//            FComplaintsCount := FComplaintsCount + 1;
//          end;
//      end;
//
//      try
//        temp := BCDToStr(@PCmdSrvTermDRunData_V3(pBuf)^.RunJE[0], 3);
//        syyje := StrToFloat(Copy(temp, 1, 5) + '.' + Copy(temp, 6, 1));
//        dev.syyje := dev.syyje + syyje;   // 营运金额
//
//        temp :=  BCDToStr(@PCmdSrvTermDRunData_V3(pBuf)^.NoRunDistanct[0], 2);
//        kslc := StrToFloat(Copy(temp, 1, 3) + '.' + Copy(temp, 4, 1));
//        dev.kslc := dev.kslc + kslc;      // 空驶里程
//
//        temp := BCDToStr(@PCmdSrvTermDRunData_V3(pBuf)^.RunDistanct[0], 3); // 营运里程
//        xslc := StrToFloat(Copy(temp, 1, 5) + '.' + Copy(temp, 6, 1));
//        dev.xslc := dev.xslc + xslc + kslc;      // 行驶里程
//
//        dev.ksl := FormatFloat('0.00', dev.kslc /(dev.xslc));
//      except
//      end;
//
//      if (bSeverJudge) and (PCmdSrvTermDRunData_V3(pBuf)^.Server_Type = 4) then
//      begin
//        if Assigned(FServeJudge) then FServeJudge(pBuf, dev);
//      end;
//    end;
//  except
//  end;

end;

procedure TGateWayServerCom.DealFindBlaceVer_V3(pBuf: PByte);
var
  cmdId: Integer;
  devIdStr:string;
  dev: Tdevice;
  info: PCmdInfo;
  pCmd: PCmdSrvTermFindBlackVer_V3;
  ver: string;
begin
  pCmd := PCmdSrvTermFindBlackVer_V3(pBuf);
  devIdstr := BCDToStr(@(pCmd^.DevID[0]));
  cmdId := pCmd^.CmdId;
  dev := ADeviceManage.Find(devIdstr);

  info := ACmdManage.Find(cmdId);
  if info = nil then exit;

  ver := InttoHex(pCmd^.Ver[0], 2) + InttoHex(pCmd^.Ver[1], 2) + InttoHex(pCmd^.Ver[2], 2);

  info^.State := CMD_DONE;
  info^.Replytime := now();

  PopMsg('黑名单查询应答', info^.Desc + ' 上传了黑名单版本，版本是' + ver);
end;

procedure TGateWayServerCom.DealSaveDRundata_V3(pBuf: PByte);
var
  devIdStr:string;
  dev: Tdevice;
  pCmd: PCmdSrvTermSaveDRundata_V3;
  Res: string;
begin
  pCmd := PCmdSrvTermSaveDRundata_V3(pBuf);
  devIdStr := BCDToStr(@(pCmd^.DevID[0]));
  dev := ADeviceManage.Find(devIdStr);

  Res := '保存状态未知';

  case pCmd^.Res of
    1: Res := '保存成功';
    2: Res := '保存失败';
  end;

  PopMsg('营运数据上传应答', dev.Car.No + '上传一条营运数据, ' + Res);
end;

procedure TGateWayServerCom.DealDevOnline_V3(pBuf: PByte);
var
  dev: TDevice;
  devIdStr:string;
  pCmd: PCmdSrvTermDevOnLine_V3;
  isOnLine: Boolean;
  devCount: Integer;
  devIdBcdArray: TDEV_ID_BCD_ZDCLArray;
  p: PByte;
  i: Integer;
begin
  try
    pCmd := PCmdSrvTermDevOnLine_V3(pBuf);
    isOnLine := pCmd^.Res = $01;
    devCount := (pCmd^.Header.Size - SizeOf(THead_V3) - 2) div 6;
    p := PtrAdd(pCmd, SizeOf(THead_V3) + 1);
    SetLength(devIdBcdArray, devCount);
    CopyMemory(@devIdBcdArray[0], p, devCount * 6);
    for i := 0 to Length(devIdBcdArray) - 1 do
    begin
      devIdStr := BCDTostr(@(devIdBcdArray[i]));
      dev := ADeviceManage.Find(devIdstr);
      if dev <> nil then
      begin
        dev.isOnline := isOnLine;
//        if FIsDevOnLineChanged then
//          ADeviceManage.OnDevOnLineStatusChanged(dev);
        if dev.isOnline then
        begin
          if FIsOnLineRecved then
          begin
            if GlobalParam.isCarOnline then
            PopMsg('车辆上线', dev.Car.No + #13#10 + '上线了');
            dev.LastConnectTime := Now
          end;
        end
        else
        begin
          if FIsOffLineRecved then
          begin
            if GlobalParam.isCarUnOnline then
              PopMsg('车辆下线', dev.Car.No + #13#10 + '车辆下线了');
            dev.LastConnectTime := Now
          end;
        end;
      end;
    end;
    if isOnLine then
    begin
      if not FIsOnLineRecved then
        FIsOnLineRecved := True;
    end
    else if not FIsOffLineRecved then
      FIsOffLineRecved := True;
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealDevOnline_V3异常' + E.Message);
    end;
  end;
end;

procedure TGateWayServerCom.DealPolling_Mcu_V3(ABuf: PByte);
//var
//  MCUType: Byte;
//  dev: TDevice;
//  devId, cmdId: Integer;
//  res: string;
//  p: PCmdInfo;
begin
//  try
//    devId := BCDToInt(@PCmdSerTErmPolling_MCU_V3(ABuf)^.DevID[0]);
//    cmdId := PCmdSerTErmPolling_MCU_V3(ABuf)^.CmdId;
//    p := ACmdManage.Find(cmdId);
//    if p = nil then exit;
//
//    dev := ADeviceManage.Find(devId);
//    if dev = nil then Exit;
//    DealQueryMcuState_V3(10, dev, ABuf);
//  finally
//    if p <> nil then
//    begin
//      p^.State := CMD_DONE;
//      p^.Replytime := now();
//      PopMsg('设备巡检应答', P^.Desc + #13 + #10 + '请查看巡检状态');
//    end;
//  end;
end;

procedure TGateWayServerCom.DealMCU_V3(ABuf: PByte);
//var
//  cmdId,devId: Integer;
//  dev: Tdevice;
//  p: PCmdInfo;
//  flag: array[0..1] of Byte;
//  res: string;
//  ABufSize: Integer;
begin
//  devId := BCDToInt(@PCmdtermSrv_MCU_V3(ABuf)^.DevID[0]);
//  cmdId := PCmdtermSrv_MCU_V3(ABuf)^.CmdId;
//
//  p := ACmdManage.Find(cmdId);
//  if p = nil then exit;
//  
//  dev := ADeviceManage.Find(devId);
//  if p^.SendV3 then
//  begin
//    ABufSize := PCmdtermSrv_MCU_V3(ABuf)^.Size;
//    frmSend.Memo2.Text := MemFormatUnit.BuffToHex(ABuf, ABufSize);
//    frmSend.Show;
//    res := '透传指令应答'
//  end
//  else
//  begin
//    if (PCmdtermSrv_MCU_V3(ABuf)^.MCUflag[0] = $00) and (PCmdtermSrv_MCU_V3(ABuf)^.MCUflag[1] = $00) then
//    begin
//      res := '请查看查询状态';
//      DealQueryMcuState_V3(0, dev,@PCmdtermSrv_QUERYMCU_V3(ABuf)^.state);
//    end
//    else
//    begin
//      if PCmdtermSrv_MCU_V3(ABuf)^.RES = $00 then
//        res := '成功'
//      else
//        res := '失败';
//    end;
//  end;
//
//
//  p^.State := CMD_DONE;
//  p^.Replytime := now();
//  PopMsg('智能顶灯应答', p^.Desc + res);
//  
end;

procedure TGateWayServerCom.DealLED_V3(ABuf: PByte);
//var
//  cmdId,devId: Integer;
//  dev: Tdevice;
//  p: PCmdInfo;
//  flag: array[0..1] of Byte;
//  res: string;
//  ABufSize: Integer;
begin
//  devId := BCDToInt(@PCmdtermSrv_LED_V3(ABuf)^.DevID[0]);
//  cmdId := PCmdtermSrv_LED_V3(ABuf)^.CmdId;
//
//  p := ACmdManage.Find(cmdId);
//  if p = nil then exit;
//  
//  dev := ADeviceManage.Find(devId);
//  if dev = nil then Exit;
//
//  if p^.SendV3 then
//  begin
//    ABufSize := PCmdtermSrv_LED_V3(ABuf)^.Size;
//    frmSend.Memo2.Text := MemFormatUnit.BuffToHex(ABuf, ABufSize);
//    frmSend.Show;
//    p^.State := CMD_DONE;
//    p^.Replytime := now();
//    PopMsg('LED应答', p^.Desc + '透传指令应答');
//  end
//  else
//  begin
//    if (PCmdtermSrv_LED_V3(ABuf)^.MCUflag[0] = $00) and (PCmdtermSrv_LED_V3(ABuf)^.MCUflag[1] = $00) then
//    begin
//      res := '请查看查询状态';
//      DealQueryMcuState_V3(1, dev,@PCmdtermSrv_QUERYLED_V3(ABuf)^.state);
//
//      p^.State := CMD_DONE;
//      p^.Replytime := now();
//      PopMsg('LED应答', p^.Desc + res);
//    end;
//  end;
//  {else
//  begin
//    if PCmdtermSrv_LED_V3(ABuf)^.RES = $00 then
//      res := '成功'
//    else
//      res := '失败';
//  end;   }
end;

procedure TGateWayServerCom.DealSend_V3(ABuf: PByte);
var
  ABufSize: Integer;
begin
  ABufSize := PCmdtermSrv_LED_V3(ABuf)^.Size;
  frmSend.Memo2.Text := MemFormatUnit.BuffToHex(ABuf, ABufSize);
  frmSend.Show;
end;

procedure TGateWayServerCom.DealLCD_V3(ABuf: PByte);
//var
//  cmdId,devId: Integer;
//  dev: Tdevice;
//  p: PCmdInfo;
//  flag: array[0..1] of Byte;
//  res: string;
//  len: Word;
//  AdInfo: string;
//  i,j,Count: Integer;
//  temp: string;
//  DeleteAdInfo: Boolean;
//  ABufSize: Integer;
begin
//  len := PCmdSrvTerm_LCD_V3(ABuf)^.Size;
//  devId := BCDToInt(@PCmdSrvTerm_LCD_V3(ABuf)^.DevID[0]);
//  cmdId := PCmdSrvTerm_LCD_V3(ABuf)^.CmdId;
//
//  p := ACmdManage.Find(cmdId);
//  if p = nil then exit;
//
//  dev := ADeviceManage.Find(devId);
//
//  if p^.SendV3 then
//  begin
//    ABufSize := len;
//    frmSend.Memo2.Text := MemFormatUnit.BuffToHex(ABuf, ABufSize);
//    frmSend.Show;
//    p^.State := CMD_DONE;
//    p^.Replytime := now();
//    PopMsg('LCD应答', p^.Desc + '透传指令应答');
//  end
//  else
//  begin
//
//    Count := 0;
//    DeleteAdInfo := False;
//
//    case ByteOderConvert_Word(PCmdSrvTerm_LCD_V3(ABuf)^.MCUflag) of
//      $0000:  // 查询状态
//        begin
//          res := '请查看查询状态';
//          DealQueryMcuState_V3(2, dev,PtrAdd(ABuf, sizeof(TCmdSrvTerm_LCD_V3)));
//        end;
//      $0100:  // 广告信息下载情况汇报
//        begin
//          ABuf := PtrAdd(ABuf, sizeof(TCmdSrvTerm_LCD_V3));
//          case ABuf^ of
//            $00:
//              begin
//                res := '下载正确';
//                PtrAdd(ABuf, 1);
//                SetLength(AdInfo, len-16);
//                CopyMemory(@AdInfo[1], ABuf, len-16);
//                dev.AddAdInfo(AdInfo);
//              end;
//            $FF:  res := '下载错误';
//          end;
//        end;
//      $0101:  // 立即显示指定的广告信息
//        begin
//          ABuf := PtrAdd(ABuf, sizeof(TCmdSrvTerm_LCD_V3));
//          case ABuf^ of
//            $00:  res := '执行正确';
//            $FF:  res := '执行错误(文件不存在)';
//          end;
//        end;
//      $0102: // 中心命令下载指定的广告信息
//        begin
//          ABuf := PtrAdd(ABuf, sizeof(TCmdSrvTerm_LCD_V3));
//          case ABuf^ of
//            $00:  res := '执行正确';
//            $FF:  res := '执行错误(正在下载)';
//          end;
//        end;
//      $0103: // 中心查询当前正在播放的广告信息
//        begin
//          ABuf := PtrAdd(ABuf, sizeof(TCmdSrvTerm_LCD_V3));
//          SetLength(AdInfo, len-15);
//          CopyMemory(@AdInfo[1], ABuf, len-15);
//          res := ' ' + AdInfo;
//        end;
//      $0104: // 中心查询LCD内的广告信息
//        begin
//          if SendVideoFrm <> nil then
//          begin
//            ABuf := PtrAdd(ABuf, sizeof(TCmdSrvTerm_LCD_V3));
//            CopyMemory(@Count, ABuf, 2);
//            Count := ByteOderConvert_Word(Count);
//            if Count = 0 then
//            begin
//              SendVideoFrm.ShowAdInfoCount;
//            end
//            else
//            begin
//              ABuf := PtrAdd(ABuf,2);
//              CopyMemory(@temp[1], ABuf, len-sizeof(TCmdSrvTerm_LCD_V3)-2);
//              for i:=0 to Count-1 do
//              begin
//                j := Pos(#0,temp);
//                if j>0 then
//                begin
//                  with SendVideoFrm.ListView3.Items.Add do
//                  begin
//                    AdInfo := Copy(temp, 1, j-1);
//                    Caption := IntToStr(i+1);
//                    SubItems.Add(AdInfo);
//                    dev.AddAdInfo(AdInfo);
//                  end;
//                end;
//                temp := Copy(temp, j+1, Length(temp));
//              end;
//            end;
//          end;
//        end;
//      $0105: // 删除LCD内指定的广告信息
//        begin
//          ABuf := PtrAdd(ABuf, sizeof(TCmdSrvTerm_LCD_V3));
//          case ABuf^ of
//            $00:
//            begin
//              res := '执行正确';
//              DeleteAdInfo := True;
//            end;
//            $FF:  res := '执行错误';
//          end;
//        end;
//      $0106: // 删除LCD内所有的广告信息
//        begin
//          ABuf := PtrAdd(ABuf, sizeof(TCmdSrvTerm_LCD_V3));
//          case ABuf^ of
//            $00:
//            begin
//              res := '执行正确';
//              dev.AdInfoList.Clear;
//            end;
//            $FF:  res := '执行错误';
//          end;
//        end;
//      else
//        begin
//          ABuf := PtrAdd(ABuf, sizeof(TCmdSrvTerm_LCD_V3));
//          case ABuf^ of
//            $00:  res := '成功';
//            $01:  res := '设备不支持此命令';
//            $FF:  res := '失败';
//          end;
//        end;
//    end;
//
//    try
//      if (p.DeleteAdInfo=True) and (DeleteAdInfo=True) then
//      begin
//        dev.DeleteAdInfo(p.AdInfo);
//      end;
//    except
//    end;
//    p^.State := CMD_DONE;
//    p^.Replytime := now();
//    PopMsg('LCD应答', p^.Desc + res);
//  end;
end;

procedure TGateWayServerCom.DealMeter_v3(ABuf: PByte);
//var
//  cmdId,devId: Integer;
//  dev: Tdevice;
//  p: PCmdInfo;
//  flag: array[0..1] of Byte;
//  res: string;
//  len: Word;
//  i,j,Count: Integer;
//  temp: string;
//  ABufSize: Integer;
begin
//  len := PCmdSrvTermReadMeterParam_V3(ABuf)^.Size;
//  devId := BCDToInt(@PCmdSrvTermReadMeterParam_V3(ABuf)^.DevID[0]);
//  cmdId := PCmdSrvTermReadMeterParam_V3(ABuf)^.CmdId;
//
//  p := ACmdManage.Find(cmdId);
//  if p = nil then exit;
//
//  if p^.SendV3 then
//  begin
//    ABufSize := len;
//    frmSend.Memo2.Text := MemFormatUnit.BuffToHex(ABuf, ABufSize);
//    frmSend.Show;
//    res := '透传指令应答'
//  end
//  else
//  begin
//    dev := ADeviceManage.Find(devId);
//    Count := 0;
//
//    case ByteOderConvert_Word(PCmdSrvTermReadMeterParam_V3(ABuf)^.MCUflag) of
//      $0000:  // 查询状态
//        begin
//          res := '请查看查询状态';
//          DealQueryMcuState_V3(4, dev,PtrAdd(ABuf, sizeof(TCmdSrvTermReadMeterParam_V3)));
//        end;
//      $0004:  // 参数查询
//        begin
//          ABuf := PtrAdd(ABuf, sizeof(TCmdSrvTermReadMeterParam_V3));
//          if ReadMeterParamFrm <> nil then
//          begin
//            //dev.MeterParam := ABuf;
//            ReadMeterParamFrm.LoadParam(ABuf);
//          end;
//        end;
//      $0005:
//        begin
//          ABuf := PtrAdd(ABuf, sizeof(TCmdSrvTermReadMeterParam_V3));
//          case ABuf^ of
//            $00: res := '参数下载成功';
//            $01: res := '设置失败';
//            $02: res := '版本相同，无需设置';
//          end;
//        end;
//    end;
//  end;
//
//  p^.State := CMD_DONE;
//  p^.Replytime := now();
//  PopMsg('计价器应答', p^.Desc + res);
end;

procedure TGateWayServerCom.DealTSM_V3(ABuf: PByte);
//var
//  cmdId,devId: Integer;
//  dev: Tdevice;
//  p: PCmdInfo;
//  flag: array[0..1] of Byte;
//  res: string;
//  len: Word;
//  i,j,Count: Integer;
//  temp: string;
//
//  ABufSize: Integer;
begin
//  len := PCmdTermSrv_TSM_V3(ABuf)^.Size;
//  devId := BCDToInt(@PCmdTermSrv_TSM_V3(ABuf)^.DevID[0]);
//  cmdId := PCmdTermSrv_TSM_V3(ABuf)^.CmdId;
//
//  p := ACmdManage.Find(cmdId);
//  if p = nil then exit;
//  
//  dev := ADeviceManage.Find(devId);
//
//  Count := 0;
//
//  if p^.SendV3 then
//  begin
//    ABufSize := PCmdTermSrv_TSM_V3(ABuf)^.Size;
//    frmSend.Memo2.Text := MemFormatUnit.BuffToHex(ABuf, ABufSize);
//    frmSend.Show;
//    res := '透传指令应答'
//  end
//  else
//  begin
//  case ByteOderConvert_Word(PCmdTermSrv_TSM_V3(ABuf)^.MCUflag) of
//    $0000:  // 查询状态
//      begin
//        res := '请查看查询状态';
//        DealQueryMcuState_V3(3, dev,PtrAdd(ABuf, sizeof(TCmdTermSrv_TSM_V3)));
//      end;
//    $0001:;
//    $0002:;
//  end;
//  end;
//
//  p^.State := CMD_DONE;
//  p^.Replytime := now();
//  PopMsg('TSM应答', p^.Desc + res);
end;

procedure TGateWayServerCom.DealANTIFAKE_V3(ABuf: PByte);
var
  cmdId: Integer;
  devIdstr:String;
  dev: Tdevice;
  p: PCmdInfo;
  res: string;
begin
  devIdstr := BCDToStr(@(PCmdermSrvtAntiFake_V3(ABuf)^.DevID[0]));
  cmdId := PCmdtermSrv_MCU_V3(ABuf)^.CmdId;

  p := ACmdManage.Find(cmdId);
  if p = nil then exit;
  
  dev := ADeviceManage.Find(devIdstr);
  if PCmdermSrvtAntiFake_V3(ABuf)^.Res = $00 then
    res := '成功'
  else
    res := '失败';

  p^.State := CMD_DONE;
  p^.Replytime := now();               
  PopMsg('设置防伪标志应答', p^.Desc + 'res');
end;

procedure TGateWayServerCom.DealLogin_In_V3_9F(ABuf: PByte);
var
  driver_no: string;
  DateTime: TDateTime;
  year: Integer;
  month: Word;
  day: Word;
  hour: Word;
  minute: Word;
  second: Word;
  devIdStr:String;
begin
//  driver_no := IntToHex(PCmdSrvTermDriverLoginIn_V3(ABuf)^.driver_id[0], 2)
//              +IntToHex(PCmdSrvTermDriverLoginIn_V3(ABuf)^.driver_id[1], 2)
//              +IntToHex(PCmdSrvTermDriverLoginIn_V3(ABuf)^.driver_id[2], 2)
//              +IntToHex(PCmdSrvTermDriverLoginIn_V3(ABuf)^.driver_id[3], 2)
//              +IntToHex(PCmdSrvTermDriverLoginIn_V3(ABuf)^.driver_id[4], 2)
//              +IntToHex(PCmdSrvTermDriverLoginIn_V3(ABuf)^.driver_id[5], 2);
//
//  {year :=  StrToInt(IntToHex(PCmdSrvTermDriverLoginIn_V3_9F(ABuf)^.GpsData.GpsTime[0], 2)
//          + IntToHex(PCmdSrvTermDriverLoginIn_V3_9F(ABuf)^.GpsData.GpsTime[1], 2)));
//  month := StrToInt(IntToHex(PCmdSrvTermDriverLoginIn_V3_9F(ABuf)^.GpsData.GpsTime[2], 2)));
//  day := StrToInt(IntToHex(PCmdSrvTermDriverLoginIn_V3_9F(ABuf)^.GpsData.GpsTime[3], 2));
//  hour := StrToInt(IntToHex(PCmdSrvTermDriverLoginIn_V3_9F(ABuf)^.GpsData.GpsTime[4], 2));
//  minute := StrToInt(IntToHex(PCmdSrvTermDriverLoginIn_V3_9F(ABuf)^.GpsData.GpsTime[5], 2));
//  //second := StrToInt(IntToHex(PCmdSrvTermDriverLoginIn_V3_9F(ABuf)^.GpsData.GpsTime[5], 2));
//  DateTime := EncodeDateTime(year, month, day, hour, minute, 0, 0);          }
//  devIdstr := BCDToStr(@PCmdSrvTermDriverLoginIn_V3_9F(ABuf)^.GpsData.DevId[0]);
//  ADeviceManage.DealLogin_In(devIdstr, driver_no, DateTime);
end;
procedure TGateWayServerCom.DealLogin_In_V3(ABuf: PByte);
var
  driver_no: string;
  DateTime: TDateTime;
  year: Integer;
  month: Word;
  day: Word;
  hour: Word;
  minute: Word;
  second: Word;
  devIdstr: string;
begin
//  driver_no := IntToHex(PCmdSrvTermDriverLoginIn_V3(ABuf)^.driver_id[0], 2)
//              +IntToHex(PCmdSrvTermDriverLoginIn_V3(ABuf)^.driver_id[1], 2)
//              +IntToHex(PCmdSrvTermDriverLoginIn_V3(ABuf)^.driver_id[2], 2)
//              +IntToHex(PCmdSrvTermDriverLoginIn_V3(ABuf)^.driver_id[3], 2)
//              +IntToHex(PCmdSrvTermDriverLoginIn_V3(ABuf)^.driver_id[4], 2)
//              +IntToHex(PCmdSrvTermDriverLoginIn_V3(ABuf)^.driver_id[5], 2);
//
//  {year := StrToInt(IntToHex(PCmdSrvTermDriverLoginIn_V3(ABuf)^.dateTime[0], 2)
//                  + IntToHex(PCmdSrvTermDriverLoginIn_V3(ABuf)^.dateTime[1], 2));
//  month := StrToInt(IntToHex(PCmdSrvTermDriverLoginIn_V3(ABuf)^.dateTime[2], 2));
//  day := StrToInt(IntToHex(PCmdSrvTermDriverLoginIn_V3(ABuf)^.dateTime[3], 2));
//  hour := StrToInt(IntToHex(PCmdSrvTermDriverLoginIn_V3(ABuf)^.dateTime[4], 2));
//  minute := StrToInt(IntToHex(PCmdSrvTermDriverLoginIn_V3(ABuf)^.dateTime[5], 2));
//  //second := StrToInt(IntToHex(PCmdSrvTermDriverLoginIn_V3(ABuf)^.dateTime[5], 2));
//  DateTime := EncodeDateTime(year, month, day, hour, minute, 0, 0); }
//
//  devIdstr := BCDToStr(@PCmdSrvTermDriverLoginIn_V3(ABuf)^.GpsData.DevId[0]);
//  ADeviceManage.DealLogin_In(devIdstr, driver_no, DateTime);
end;

procedure TGateWayServerCom.DealLogin_Out_V3(ABuf: PByte);
var
  driver_no: string;
  DateTime: TDateTime;
  year: Integer;
  month: Word;
  day: Word;
  hour: Word;
  minute: Word;
  second: Word;
  devIdstr: string;
begin
//  driver_no := IntToHex(PCmdSrvTermDriverLoginIn_V3(ABuf)^.driver_id[0], 2)
//              +IntToHex(PCmdSrvTermDriverLoginIn_V3(ABuf)^.driver_id[1], 2)
//              +IntToHex(PCmdSrvTermDriverLoginIn_V3(ABuf)^.driver_id[2], 2)
//              +IntToHex(PCmdSrvTermDriverLoginIn_V3(ABuf)^.driver_id[3], 2)
//              +IntToHex(PCmdSrvTermDriverLoginIn_V3(ABuf)^.driver_id[4], 2)
//              +IntToHex(PCmdSrvTermDriverLoginIn_V3(ABuf)^.driver_id[5], 2);
//
//  {year :=  StrToInt(IntToHex(PCmdSrvTermDriverLoginOut_V3(ABuf)^.dateTime[0], 2)
//                  + IntToHex(PCmdSrvTermDriverLoginOut_V3(ABuf)^.dateTime[1], 2));
//  month := StrToInt(IntToHex(PCmdSrvTermDriverLoginOut_V3(ABuf)^.dateTime[2], 2));
//  day := StrToInt(IntToHex(PCmdSrvTermDriverLoginOut_V3(ABuf)^.dateTime[3], 2));
//  hour := StrToInt(IntToHex(PCmdSrvTermDriverLoginOut_V3(ABuf)^.dateTime[4], 2));
//  minute := StrToInt(IntToHex(PCmdSrvTermDriverLoginOut_V3(ABuf)^.dateTime[5], 2));
//  //second := StrToInt(IntToHex(PCmdSrvTermDriverLoginOut_V3(ABuf)^.dateTime[5], 2));
//  DateTime := EncodeDateTime(year, month, day, hour, minute, 0, 0);    }
//  devIdstr:= BCDToStr(@PCmdSrvTermDriverLoginOut_V3(ABuf)^.GpsData.DevId[0]);
//  ADeviceManage.DealLogin_Out(devIdstr, driver_no, DateTime);
end;

procedure TGateWayServerCom.DealReportEvent_V3(ABuf: PByte);
var
  devIdStr : String ;
  dev: Tdevice;
  info: string;
begin
  devIdStr :=  BCDTostr(@(PCmdSrvtermReportEvent_V3(ABuf)^.header.DevID[0]));
  dev := ADeviceManage.Find(devIdStr);
  if dev = nil then Exit;
  info := dev.FindEventInfoByNo( PCmdSrvtermReportEvent_V3(ABuf)^.EventNo);
  PopMsg('事件报告', dev.Car.No + '报告事件：' + info);
  if Assigned(FEventListUpLoad) then FEventListUpLoad(dev, info, Now);
end;

procedure TGateWayServerCom.DealReportAnswer_V3(ABuf: PByte);
var
  cmdId,devId: Integer;
  dev: Tdevice;
  info: string;
  p: PCmdInfo;
  AnswerID: Integer;
   devIdStr:String;
  pCmd :PCmdSrvtermReportAnswer_V3;
begin
  if bReportAnswer then
  begin
    pCmd := PCmdSrvtermReportAnswer_V3(ABuf);
    cmdId := pCmd^.Header.CmdOrder;
    p := ACmdManage.Find(cmdId);
    if p = nil then exit;

    devIdstr := BCDToStr(@(pCmd^.Header.DevID[0]));
    dev := ADeviceManage.Find(devIdstr);
    AnswerID := pCmd^.AnswerID;
    info := PAnswerInfo(p.AnswerList.Datas[AnswerID]).info;

    PopMsg('提问应答','问题：' + p.QuestionInfo+#10#10 + dev.Car.No + '的' +
                      '答案：' + {PAnswerInfo(p.AnswerList.Datas[PCmdSrvtermReportAnswer_V3(ABuf)^.AnswerID]).}info);

    uGloabVar.SystemLog.AddLog('问题：' + p.QuestionInfo+#10#10 + dev.Car.No + '的' +
                             '答案：' + {PAnswerInfo(p.AnswerList.Datas[PCmdSrvtermReportAnswer_V3(ABuf)^.AnswerID]).}info);

    try
      Bs.ModifyAMessage_Answer2(pCmd^.MsgId, 2, FormatDateTime('yyyy-mm-nn hh:nn:ss', now),
                                AnswerID, info);
    except
    end;
    {p := ACmdManage.Find(cmdId);
    if p = nil then exit;
    p^.State := CMD_DONE;
    p^.Replytime := now();
    PopMsg('提问应答', '问题：'+p^.QuestionInfo+#10#10 + dev.Car.No + '的' +
                       '答案：' + PAnswerInfo(p^.AnswerList.Datas[PCmdSrvtermReportAnswer_V3(ABuf)^.AnswerID]).info);}
    if Assigned(FAnswerListUpLoad) then
      FAnswerListUpLoad(dev, p.QuestionInfo,
                        {PAnswerInfo(p.AnswerList.Datas[PCmdSrvtermReportAnswer_V3(ABuf)^.AnswerID]).}info, Now);
  end;
end;

procedure TGateWayServerCom.DealTYData_v3(ABuf: PByte);
var
  backNumber,cmdId, devId: integer;
  p: PCmdInfo;
  s: string;
  i: Integer;
  AreaID: Integer;
  areaNo: Integer;
  state: Byte;
  //pCmdSrv: PCmdSrvtermTYData_V3;
  area: TBaseArea;
  alarmInfo: TAlarmInfoFromDev;
begin
  //New(pCmdSrv);
  //pCmdSrv := PCmdSrvtermTYData_V3(ABuf);
  //AddTYData_V3(pCmdSrv^.CmdId, pCmdSrv);
  try
    cmdId := PCmdSrvtermTYData_V3(ABuf)^.RespCmdNo;
    p := ACmdManage.Find(cmdId);
    if p = nil then exit;

    backNumber := PCmdSrvtermTYData_V3(ABuf)^.Ret;
    state := 0;
    //dev := ADeviceManage.Find(devId);
    //if dev = nil then exit;
    //Dev.LastConnectTime := now;
    case backNumber of
      0:
        begin
          s :='成功！';
          state := CMD_DONE;
        end;
      1: ;
      2:
        begin
          s := '失败, 命令取消！';
          state := CMD_DOERROR;
        end;
      3:
        begin
          s := '失败, 命令删除（超时）！';
          state := CMD_OVERTIME;
        end;
      4:
        begin
          s := '失败, 重复登录！';
        end;
      5:
        begin
          s := '失败, 无效用户名！';
        end;
      6:
        begin
          s := '车辆不在线！';
          state := CMD_REPLACE;
        end;
    end;

    if (backNumber = 0) then
    begin
      if (p^.DeleteArea = True) then
      begin //删除区域
        for i:=0 to p^.AreaList.Count -1 do
        begin
          areaNo := StrToInt(p^.AreaList.Strings[i]);
          area := FAllAreaManage.findByAreaNo(areaNo);
          if area <> nil then
          begin
            bs.DeleteADev_Area(p^.Dev.fact_id ,p^.Dev.Id, area.AreaID);
            area.DeleteDev(p^.Dev.IdStr);
            p^.Dev.DelADevArea(area);

            if p^.IsDeleteArea and (area.AreaDevList.Count <= 0) then
            begin
               // liusen
              case area.AreaPictureKind of
                0: DeleteACircleToDev(area.AreaID);
                1: DeleteAConfineAreaToDev(area.AreaID);
                2: DeleteLines(area.AreaID);
                3: DeleteLines(area.AreaID);
              end;
              FAllAreaManage.Delete(area.AreaID);
              bs.DeleteArea_New(area.AreaID);
              if Assigned(FOnRefreshAreaDevList) then
                FOnRefreshAreaDevList(area.AreaPictureKind, 1);
            end
            else
            begin
              if Assigned(FOnRefreshAreaDevList) then
                FOnRefreshAreaDevList(area.AreaPictureKind, 0);
            end;
  //          SendDelete(areaID, p^.Dev.IdStr, true);
          end;
        end;
      end
      else if (p^.areaId > 0) then
      begin//新增设置的区域
        area := FAllAreaManage.find(p^.areaId);
        if area <> nil then
        begin
          if p^.areaSetType = 1 then
          begin//更新  删除之前的所有，追加当前的
            if p^.Dev.GetADevArea(p^.areaId) <> nil then
            begin//车机已设了该区域，直接删除其他的区域，不需再追加
              p^.Dev.DelDevAreasExceptAArea(p^.areaId);
            end
            else
            begin//删除后，追加
              p^.Dev.ClrDevArea;
              if Bs.AddNewDev_Area(p^.DevId, area.AreaID) then
              begin
                area.AddDev(p^.Dev.Id);
                p^.Dev.AddADevArea(area);
              end;
            end;
            if Assigned(FOnRefreshAreaDevList) then
              FOnRefreshAreaDevList(area.AreaPictureKind, 0);
          end
          else if (p^.areaSetType = 0) or (p^.areaSetType = 2) then
          begin//追加
            if Bs.AddNewDev_Area(p^.DevId, area.AreaID) then
            begin
              area.AddDev(p^.Dev.Id);
              p^.Dev.AddADevArea(area);
              if Assigned(FOnRefreshAreaDevList) then
                FOnRefreshAreaDevList(area.AreaPictureKind, 0);
            end;
          end
          else if p^.areaSetType = 3 then
          begin//修改  不需要处理

          end;  
        end;
      end;
    end;

    if p^.alarmInfoId > 0 then
    begin
      alarmInfo := FAlarmInfoManage.Find(p^.alarmInfoId);
      if alarmInfo <> nil then
      begin
        case p^.alarmDealFlag of
          1:
            begin
              if backNumber = 0 then
                alarmInfo.SendCallBackCmdStatus := 2
              else
                alarmInfo.SendCallBackCmdStatus := 3;
            end;
          2:
            begin
              if backNumber = 0 then
                alarmInfo.SendGetPicCmdStatus := 2
              else
                alarmInfo.SendGetPicCmdStatus := 3;
            end;
          3:
            begin
              if backNumber = 0 then
                alarmInfo.SendTextCmdStatus := 2
              else
                alarmInfo.SendTextCmdStatus := 3;
            end;
        end;

        if p^.alarmDealFlag in [1..4] then
        begin
          if Assigned(FOnRefreshAlarmDealStatus) then
            FOnRefreshAlarmDealStatus(p^.alarmInfoId);
        end;
      end;
    end;

    p^.State := state;
    p^.Replytime := now();
    PopMsg('命令应答:'+s, p^.desc + s);
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealTYData_v3异常' + E.Message);
    end;
  end;
end;

function TGateWayServerCom.isActive: boolean;
begin
  Result := Active;
  if not Active then PopMsg('错误提示', '与网关服务器' + #13 + #10 + '连接不正常' + #13 + #10 + ',不能发送命令');
end;

procedure TGateWayServerCom.SendMsg(ADevID: string; AType: Byte;
  MsgStr: string);
begin
  if Assigned(FOnSendMsg) then
  begin
    FOnSendMsg(ADevID, AType, MsgStr);
  end;
end;

procedure TGateWayServerCom.SendHeart;
var
  b: byte;
begin
  b := $FF;
  DirectSend(b, 1);
end;

procedure TGateWayServerCom.isSendSuccessFailPop(Ret: byte; Dec: string);
begin
  case Ret of
    RET_CMDOK:
      if GlobalParam.IsSendSuccess then PopMsg('成功', Dec);
    ERR_INVALIDDEV:
      if GlobalParam.IsSendFail then popMsg('无效的车机ID号', Dec);
    ERR_LED + 10:
      if GlobalParam.IsSendFail then popMsg('显示屏', Dec + '时,连接显示屏失败！');
    CMD_NOPIC:
       PopMsg('无照片','没有符合条件的照片!');
    else
      if GlobalParam.IsSendFail then popMsg('失败', '执行 ' + Dec + '失败!');
  end;
end;

function TGateWayServerCom.ReturnParamName(ParamID: integer): string;
begin
  case ParamID of
    $0001: Result := '终端心跳发送间隔';
    $0002: Result := 'TCP消息应答超时时间';
    $0003: Result := 'TCP消息重传次数';
    $0004: Result := 'UDP消息应答超时时间';
    $0005: Result := 'UDP消息重传次数';
    $0006: Result := 'SMS消息应答超时时间';
    $0007: Result := 'SMS消息重传次数';

    $0010: Result := '主服务器APN，无线通信拨号访问点';
    $0011: Result := '主服务器无线通信拨号用户名';
    $0012: Result := '主服务器无线通信拨号密码';
    $0013: Result := '主服务器地址,IP或域名';
    $0014: Result := '备份服务器APN，无线通信拨号访问点';
    $0015: Result := '备份服务器无线通信拨号用户名';
    $0016: Result := '备份服务器无线通信拨号密码'; //
    $0017: Result := '备份服务器地址,IP或域名';
    $0018: Result := '服务器TCP端口';
    $0019: Result := '服务器UDP端口';

    $0020: Result := '位置汇报策略';
    $0021: Result := '位置汇报方案';
    $0022: Result := '驾驶员未登录汇报时间间隔';

    $0027: Result := '休眠时汇报时间间隔';
    $0028: Result := '紧急报警时汇报时间间隔';
    $0029: Result := '缺省时间汇报间隔';

    $002C: Result := '缺省距离汇报间隔';
    $002D: Result := '驾驶员未登录汇报距离间隔';
    $002E: Result := '休眠时汇报距离间隔';
    $002F: Result := '紧急报警时汇报距离间隔';
    $0030: Result := '拐点补传角度';

    $0040: Result := '监控平台电话号码';
    $0041: Result := '复位电话号码';
    $0042: Result := '恢复出厂设置电话号码';
    $0043: Result := '监控平台SMS电话号码';
    $0044: Result := '接收终端SMS文本报警号码';
    $0045: Result := '终端电话接听策略';
    $0046: Result := '每次最长通话时间';
    $0047: Result := '当月最长通话时间';
    $0048: Result := '监听电话号码';
    $0049: Result := '监管平台特权短信号码';

    $0050: Result := '报警屏蔽字';
    $0051: Result := '报警发送文本SMS开关';
    $0052: Result := '报警拍摄开关';
    $0053: Result := '报警拍摄存储标志';
    $0054: Result := '关键报警标志';
    $0055: Result := '最高速度';
    $0056: Result := '超速持续时间';
    $0057: Result := '连续驾驶时间';
    $0058: Result := '当天累计驾驶时间';
    $0059: Result := '最小休息时间';
    $005A: Result := '最长停车时间';

    $0070: Result := '图像/视频质量';
    $0071: Result := '亮度';
    $0072: Result := '对比度';
    $0073: Result := '饱和度';
    $0074: Result := '色度';

    $0080: Result := '车辆里程表读数';
    $0081: Result := '车辆所在的省域ID';
    $0082: Result := '车辆所在的市域ID';
    $0083: Result := '车牌号';
    $0084: Result := '车牌颜色';
  else
    Result := '';
  end;
end;

//function TGateWayServerCom.SetCutOilElec(Dev: TDevice;
//  Option: byte): boolean;
//var
//  Cmd: TCmdTermSrvCutOrFeedOilOrElectricity;
//  Len: integer;
//  info: PCmdinfo;
//  buff: array of byte;
//begin
//  Result := false;
//  if not isActive then exit;
//  Len := SizeOf(TCmdTermSrvCutOrFeedOilOrElectricity);
//  setlength(buff, len);
//  Cmd.Size := Len;
//  Cmd.Flag := TERMSRV_CUTORFEED_OIL_ELECTRICITY;
//  Cmd.CmdID := GetMaxCmdID;
//  Cmd.DevID := Dev.ID;
//  Cmd.Content := Option;
//  CopyMemory(@buff[0], @Cmd, Len);
//  Result := DirectSend(Buff[0], Len);
//
//  info := ACmdManage.Add(Cmd.CmdId);
//  info^.Id := Cmd.CmdId;
//  info^.State := CMD_SNDNODO;
//  info^.Desc := '设置' + Dev.Car.No + ReturnCutOrFeedContent(Option);
//  info^.SendTime := now();
//  info^.CancelTime := 0;
//  info^.Replytime := 0;
//  SetLength(info^.Content, Cmd.Size);
//  Move(buff[0], info^.Content[0], Cmd.Size);
//  info^.ContentSize := Cmd.Size;
//end;
//


//function TGateWayServerCom.ReadTestData(Dev: TDevice): boolean;
//var
//  Cmd: TCmdTermSrvReadTestData;
//  Len: integer;
//  info: PCmdinfo;
//  buff: array of byte;
//begin
//  Result := false;
//  if not isActive then exit;
//  Len := SizeOf(TCmdTermSrvReadTestData);
//  SetLength(buff, Len);
//  Cmd.Size := Len;
//  Cmd.Flag := TERMSRV_READTESTDATA;
//  Cmd.CmdID := GetMaxCmdID;
//  Cmd.DevID := Dev.Id;
//  CopyMemory(@buff[0], @Cmd, Len);
//  Result := DirectSend(Buff[0], Len);
//
//  info := ACmdManage.Add(Cmd.CmdId);
//  info^.Id := Cmd.CmdId;
//  info^.State := CMD_SNDNODO;
//  info^.Desc := '读取' + Dev.Car.No + '测试数据';
//  info^.SendTime := now();
//  info^.CancelTime := 0;
//  info^.Replytime := 0;
//  SetLength(info^.Content, Cmd.Size);
//  Move(buff[0], info^.Content[0], Cmd.Size);
//  info^.ContentSize := Cmd.Size;
//end;
//
//function TGateWayServerCom.ReadDevVersion(Dev: TDevice): boolean;
//var
//  Cmd: TCmdTermSrvReadDevVer;
//  Len: integer;
//  info: PCmdinfo;
//  buff: array of byte;
//begin
//  Result := false;
//  if not isActive then exit;
//  Len := SizeOf(TCmdTermSrvReadDevVer);
//  SetLength(buff, Len);
//  Cmd.Size := Len;
//  Cmd.Flag := TERMSRV_READDEVVER;
//  Cmd.CmdID := GetMaxCmdID;
//  Cmd.DevID := Dev.Id;
//  CopyMemory(@buff[0], @Cmd, Len);
//  Result := DirectSend(Buff[0], Len);
//
//  info := ACmdManage.Add(Cmd.CmdId);
//  info^.Id := Cmd.CmdId;
//  info^.State := CMD_SNDNODO;
//  info^.Desc := '读取' + Dev.Car.No + '版本';
//  info^.DevId := Dev.Id;
//  info^.SendTime := now();
//  info^.CancelTime := 0;
//  info^.Replytime := 0;
//  SetLength(info^.Content, Cmd.Size);
//  Move(buff[0], info^.Content[0], Cmd.Size);
//  info^.ContentSize := Cmd.Size;
//end;
//
//function TGateWayServerCom.ReadDevVersion_Extend(Dev: TDevice): boolean;
//var
//  Cmd: TCmdTermSrvReadDevVer;
//  Len: integer;
//  info: PCmdinfo;
//  buff: array of byte;
//begin
//  Result := false;
//  if not isActive then exit;
//  Len := SizeOf(TCmdTermSrvReadDevVer);
//  SetLength(buff, Len);
//  Cmd.Size := Len;
//  Cmd.Flag := TERMSRV_READDEVVERSION_EXTEND;
//  Cmd.CmdID := GetMaxCmdID;
//  Cmd.DevID := Dev.Id;
//  CopyMemory(@buff[0], @Cmd, Len);
//  Result := DirectSend(Buff[0], Len);
//
//  info := ACmdManage.Add(Cmd.CmdId);
//  info^.Id := Cmd.CmdId;
//  info^.State := CMD_SNDNODO;
//  info^.Desc := '读取' + Dev.Car.No + '版本(含外设)';
//  info^.DevId := Dev.Id;
//  info^.SendTime := now();
//  info^.CancelTime := 0;
//  info^.Replytime := 0;
//  SetLength(info^.Content, Cmd.Size);
//  Move(buff[0], info^.Content[0], Cmd.Size);
//  info^.ContentSize := Cmd.Size;
//end;

procedure TGateWayServerCom.SetIsOnline(ADevID:String; ARet: integer);
var
  Dev: TDevice;
begin
  Dev := ADeviceManage.Find(ADevID);
  if Dev <> nil then
  begin
    if (ARet = RET_OK) then
    begin
      Dev.isOnline := true;
      Dev.LastConnectTime := now;
    {end
    else
    begin
      Dev.isOnline := false;
      Dev.LastConnectTime := 0;  }
    end;
  end;
end;


function TGateWayServerCom.FindPostion_V3(dev: TDevice): Boolean;
var
  cmd: TCmdTermSrvFindPostionTSP_V3;//TCmdTermSrvSetDevParam_V3;//TCmdTermSrvSetDevParam_V2;
//  buf: array of Byte;
  info: PCmdinfo;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
begin
  Result := false;
  if not isActive then exit;
  tspPackSize := SizeOf(TCmdTermSrvFindPostionTSP_V3)  + 1;//加1位校验码
  InitTSPHeader(cmd.Header, tspPackSize - TSPHEADERLEN - 1, TERMSRV_FINDPOSTION_V3, Dev.Id);

  SetLength(tspBuf, tspPackSize + 2);//整个完整的包需在包两端加标识位
  offSet := 0;
  tspBuf[offset] := FLAGTSP;//标识位
  Inc(offSet);

  CopyMemory(@tspBuf[offset], @cmd, SizeOf(TCmdTermSrvFindPostionTSP_V3));
  Inc(offSet, SizeOf(TCmdTermSrvFindPostionTSP_V3));

  tspBuf[offSet] := GetXorSum(@tspBuf[1], tspPackSize - 1);//从消息头开始，不包括标识位
  Inc(offSet);

  tspBuf[offSet] := FLAGTSP;//标识位
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(Dev, escapByteBuf);
  info^.Desc := dev.Car.No + '位置查询';
end;

function TGateWayServerCom.FindBlackVer_V3(dev: TDevice): Boolean;
var
  Cmd: TCmdTermSrvFindBlackVer_V3;
  Len: Integer;
  info: PCmdInfo;
begin
  Result := false;
  if not isActive then exit;
  Len := SizeOf(TCmdTermSrvFindBlackVer_V3);

  Cmd.Size := Len;
  Cmd.Flag := TERMSRV_FINDBLACEVER_V3;
  cmd.ExtendedFlag := 0;
//  cmd.FactID := dev.fact_id;
  Cmd.DevID := DevId_StrToBCD(dev.id);
  Cmd.CmdID := GetMaxCmdID;
  Result := DirectSend(Cmd,Cmd.Size);

  info := ACmdManage.Add(Cmd.CmdId);
  info^.Id := Cmd.CmdId;
  info^.State := CMD_SNDNODO;
  info^.Desc := '查询' + Dev.Car.No + '车辆黑名单信息';
  info^.DevId := Dev.Id;
  info^.SendTime := now();
  info^.CancelTime := 0;
  info^.Replytime := 0;
  SetLength(info^.Content, Cmd.Size);
  Move(cmd, info^.Content[0], Cmd.Size);
  info^.ContentSize := Cmd.Size;

//  SaveCMD.CmdList.AddData(Cmd.CmdId, info);
end;

function TGateWayServerCom.SendUpBlackVer_V3(dev: TDevice; Ver: string): Boolean;
var
  Cmd: TCmdSrvTermFindBlackVer_V3;
  Len: Integer;
  info: PCmdInfo;
  temp: string;
  i, j: Integer;
begin
  Result := false;
  if not isActive then exit;
  Len := SizeOf(TCmdSrvTermFindBlackVer_V3);

  Cmd.Size := Len;
  Cmd.Flag := TERMSRV_SENDUPBLACK;
  cmd.ExtendedFlag := 0;
//  cmd.FactID := dev.fact_id;
  Cmd.DevID := DevId_StrToBCD(dev.id);
  Cmd.CmdID := GetMaxCmdID;


  temp := FormatCurr('000000', StringToInteger(Ver));
  j := 0;
  for i:=0 to 2 do
  begin
    Cmd.Ver[j] := StrToInt('$' + copy(temp,i*2+1,2));
    j := j+1;
  end;

  Result := DirectSend(Cmd,Cmd.Size);

  info := ACmdManage.Add(Cmd.CmdId);
  info^.Id := Cmd.CmdId;
  info^.State := CMD_SNDNODO;
  info^.Desc := '对' + Dev.Car.No + '车辆发送下载黑名单命令';
  info^.DevId := Dev.Id;
  info^.SendTime := now();
  info^.CancelTime := 0;
  info^.Replytime := 0;
  SetLength(info^.Content, Cmd.Size);
  Move(cmd, info^.Content[0], Cmd.Size);
  info^.ContentSize := Cmd.Size;

//  SaveCMD.CmdList.AddData(Cmd.CmdId, info);
end;

function TGateWayServerCom.SendGetEndPostion(): Boolean;
var
  cmd: TCmdTermSrvFindPostion_V3;
  len: Integer;
  i: Integer;
  dev: TDevice;
begin
  Result := false;
  if not isActive then exit;
  len := SizeOf(TCmdTermSrvFindPostion_V3);

  for i:=0 to ADeviceManage.Count - 1 do
  begin
    dev := ADeviceManage.Items[i];
    if dev <> nil then
    begin
      InitHeader(cmd.Header,len,TERMSRV_GETENDPOSTION_V3,dev.id);
      Result := DirectSend(Cmd,len);
      if Result then
        dev.GetLastPostion := True;
    end;
    Application.ProcessMessages;
  end;
end;


//拍照命令
function TGateWayServerCom.GetAPicture(Dev: TDevice; CameraIndex: Byte; CameraCmd: Word; PZSJJG: Word;
                         SaveSign: Byte; GetPicSize: Byte; TXZL: Byte; LD: Byte;
                         DBD: Byte; BHD: Byte; SD: Byte): boolean;
var
  info: PCmdinfo;
  len: Word;
  acmd: TCmdTermSrvTakeAPhotoTSP_V3;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
begin
  Result := false;
  if not isActive then exit;
  len := SizeOf(TCmdTermSrvTakeAPhotoTSP_V3);
  InitTSPHeader(acmd.Header, len - TSPHEADERLEN, TERMSRV_TAKEAPHOTO_V3, dev.Id);
  acmd.CameraIndex := CameraIndex;
  acmd.CameraCmd := ByteOderConvert_Word(CameraCmd);
  acmd.PZSJJG := ByteOderConvert_Word(PZSJJG);
  acmd.SaveSign := SaveSign;
  acmd.GetPicSize := GetPicSize;
  acmd.TXZL := TXZL;
  acmd.LD := LD;
  acmd.DBD := DBD;
  acmd.BHD := BHD;
  acmd.SD := SD;
  tspPackSize := len + 3;
  SetLength(tspBuf, tspPackSize);
  offSet := 0;
  tspBuf[0] := FLAGTSP;
  Inc(offSet);
  CopyMemory(@tspBuf[offSet], @acmd, len);
  Inc(offSet, len);
  tspBuf[offSet] := GetXorSum(@tspBuf[1], len);
  Inc(offSet);
  tspBuf[offSet] := FLAGTSP;
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(dev, escapByteBuf);

  info^.Desc := '对' + Dev.Car.No + '发送拍照命令';
  if currAlarmInfo <> nil then
  begin
    info^.alarmInfoId := currAlarmInfo.Id;
    info^.alarmDealFlag := 2;
  end;
end;

procedure TGateWayServerCom.DealAPicUpload_V3(ABuf: Pbyte);
var
  dev: TDevice;
  pCmd:PCmdSrvTermAPicUploaded_V3;
  i: Integer;
  pic: PicInfo;
  devId: String;
  pInfo: PCmdInfo;
begin
  pCmd := PCmdSrvTermAPicUploaded_V3(ABuf);
  devId := BCDTostr(@(pCmd^.Header.DevId[0]));
  dev := ADeviceManage.find(devId);
  if dev = nil then Exit;
  
  if pCmd^.PicId = 0 then
  begin
    if dev <> nil then
    begin
      PopMsg('摄像头信息', Dev.Car.No + ' 车辆的摄像头可能出现故障，请检查');
    end
    else
    begin
      PopMsg('摄像头信息',  '车辆的摄像头可能出现故障，请检查');
    end;
    Exit;
  end;

  //pInfo := ACmdManage.FindByDevID(DevId, pCmd^.MCUPicIndex);
  pInfo := nil;

//  AddPhotoInfo(dev, pCmd^.PicIndex, pInfo, pCmd^.MCUPicIndex);
  AddPhotoInfo(dev, pCmd^.PicId, pInfo, 0);

  {try
    pic := bs.QueryPhoteByPicIndex(pCmd^.PicIndex);
  except
  end;
  
  if pic <> nil then
  //if pInfo <> nil then     // 不是车机主动发过来的数据
  begin
    if pic.PhotoReasonID <> 2 then
    begin
      try
        //dev := ADeviceManage.find(DevId);
        if dev <> nil then
        begin
          if dev.LastPictureID <> pCmd^.PicIndex then
          begin
            if Globalparam.IsPhotoShowhit then
              if (pInfo <> nil) and (pInfo^.ClientUpPic) and (pInfo^.MCUPicIndex = pCmd^.MCUPicIndex) then
                PopMsg('来照片',  '对' + Dev.Car.No +'请求的编号为'+ IntToStr(pCmd^.MCUPicIndex)+'照片上传成功，'
                      + #13#10 + '请查看')
              else
                PopMsg('来照片', dev.Car.No + #13 + #10 + '来照片了');
            dev.LastPictureID := pCmd^.PicIndex;
            if Assigned(FPicUpload) then FPicUpload(dev, pCmd^.PicIndex, 100, pic);
          end;
        end;
      except
      end;
    end
    else if pic.PhotoReasonID = 2 then // 车机主动发过来的数据，在这里就判断为车机预警后发过来的
    begin
      i := EarlyWarningCarList.IndexOf(DevId);
      if i>=0 then
      begin
        try
          //pic := bs.QueryPhoteByPicIndex(pCmd^.PicIndex);
          //if pic <> nil then
          //begin
            //dev := ADeviceManage.find(DevId);
            if dev <> nil then
            begin
              TEarlyWarningCar(EarlyWarningCarList.Datas[i]).FPicInfoList.AddData(pCmd^.PicIndex, pic);
              PopMsg('预警照片', dev.Car.No + #13 + #10 + '来预警照片了');
              if Assigned(FPicUpload) then FPicUpload(dev, pCmd^.PicIndex,4, pic);
            end;
          //end;
        except
        end;
      end;
    end;
  end;    }
end;

procedure TGateWayServerCom.DealAAudioUpload_V3(ABuf: PByte);
var
  dev: TDevice;
  pCmd:PCmdSrvTermAPicUploaded_V3;
  i: Integer;
  pic: PicInfo;
  DevId: string;
  //pInfo: PCmdInfo;
begin
  pCmd := PCmdSrvTermAPicUploaded_V3(ABuf);
  DevId := BCDTostr(@(pCmd^.Header.DevId[0]));

  //pInfo := nil;//ACmdManage.FindByDevID(DevId, pCmd^.MCUPicIndex);
  //if pInfo <> nil then     // 不是车机主动发过来的数据
  //begin
    try
      dev := ADeviceManage.find(DevId);
      if dev <> nil then
      begin
        begin
          //if dev.LastPictureID <> pCmd^.PicIndex then
          //begin
            if Globalparam.IsPhotoShowhit then
//              if (pInfo <> nil) and (pInfo^.ClientUpPic) and (pInfo^.MCUPicIndex = pCmd^.MCUPicIndex) then
//                PopMsg('来音频文件',  '对' + Dev.Car.No +'请求的编号为'+ IntToStr(pCmd^.MCUPicIndex)+'音频文件上传成功，' +#13#10 + '请查看')
//              else
                PopMsg('来音频文件', dev.Car.No + #13 + #10 + '来音频文件了');
            //dev.LastPictureID := pCmd^.PicIndex;
            if Assigned(FAudioUpload) then FAudioUpload(dev, pCmd^.PicId);
          //end;
        end;
      end;
    except
    end;
  //end;
  {else  // 车机主动发过来的数据，在这里就判断为车机预警后发过来的
  begin
    i := EarlyWarningCarList.IndexOf(DevId);
    if i>=0 then
    begin
      pic := bs.QueryPhoteByPicIndex(pCmd^.PicIndex);
      if pic <> nil then
      begin
        TEarlyWarningCar(EarlyWarningCarList.Datas[i]).FPicInfoList.AddData(pCmd^.PicIndex, pic);
        PopMsg('预警照片', dev.Car.No + #13 + #10 + '来预警照片了');
        if Assigned(FPicUpload) then FPicUpload(dev, pCmd^.PicIndex,4);
      end;
    end;
  end; }
end;

//下发车辆方向显示内容  TERMSRV_DOWNALLWAY  = $2D;

//function TGateWayServerCom.SendWayInfo(Dev: TDevice; WayInfo: array of byte;
//  Len: integer): boolean;
//var
//  Cmd: TCmdTermSrvDownAllWay;
//  AllLen: integer;
//  info: PCmdinfo;
//  buff: array of byte;
//begin
//  Result := false;
//  if not isActive then exit;
//  AllLen := SizeOf(TCmdTermSrvDownAllWay) + Len;
//  SetLength(buff, AllLen);
//  Cmd.Size := AllLen;
//  Cmd.Flag := TERMSRV_DOWNALLWAY;
//  Cmd.CmdID := GetMaxCmdID;
//  Cmd.DevID := Dev.Id;
//  CopyMemory(@buff[0], @Cmd, SizeOf(TCmdTermSrvDownAllWay));
//  CopyMemory(@buff[SizeOf(TCmdTermSrvDownAllWay)], @WayInfo[0], Len);
//
//  Result := DirectSend(Buff[0], AllLen);
//
//  info := ACmdManage.Add(Cmd.CmdId);
//  info^.Id := Cmd.CmdId;
//  info^.Dev := Dev;
//  info^.State := CMD_SNDNODO;
//  info^.Desc := '对' + Dev.Car.No + '下发车辆方向显示内容';
//  info^.SendTime := now();
//  info^.CancelTime := 0;
//  info^.Replytime := 0;
//  SetLength(info^.Content, Cmd.Size);
//  Move(buff[0], info^.Content[0], Cmd.Size);
//  info^.ContentSize := Cmd.Size;
//end;

//function TGateWayServerCom.SendListenInTel(Dev: TDevice;
//  Tel: string): boolean;
//var
//  Cmd: TCmdTermSrvDownListenCallNum;
//  Len: integer;
//  info: PCmdinfo;
//  buff: array of byte;
//  strutLen: integer;
//begin
//  Result := false;
//  if not isActive then exit;
//  strutLen := SizeOf(TCmdTermSrvDownListenCallNum);
//  Len := strutLen + Length(Tel);
//  SetLength(buff, Len);
//  Cmd.Size := Len;
//  Cmd.Flag := TERMSRV_DOWNLISTENCALLNUM;
//  Cmd.CmdID := GetMaxCmdID;
//  Cmd.DevID := Dev.Id;
//  CopyMemory(@buff[0], @Cmd, strutLen);
//  CopyMemory(@buff[strutLen], @Tel[1], Length(Tel));
//  Result := DirectSend(Buff[0], Len);
//
//  info := ACmdManage.Add(Cmd.CmdId);
//  info^.Id := Cmd.CmdId;
//  info^.Dev := Dev;
//  info^.State := CMD_SNDNODO;
//  info^.Desc := '发送使' + Dev.Car.No + '拔打' + Tel + '监听电话';
//  info^.DevId := Dev.Id;
//  info^.SendTime := now();
//  info^.CancelTime := 0;
//  info^.Replytime := 0;
//  SetLength(info^.Content, Cmd.Size);
//  Move(buff[0], info^.Content[0], Cmd.Size);
//  info^.ContentSize := Cmd.Size;
//end;

function TGateWayServerCom.SendVideo_V3(dev: TDevice; msstream: TMemoryStream): Boolean; {下发视频}
var
  pCmd: PCmdTermSrvSendVideo_V3;
  ALen: word;
  info: PCmdinfo;
  strutLen: integer;
  buff: array[0..1023] of Byte;
  p: Pointer;
  hbuf    : THandle;
begin

  Result := False;
  if not isActive then exit;
  FillChar(buff, 1024, 0);
  pcmd := @buff[0]; //pcmd 指向buff 首址
  pCmd^.Size := SizeOf(TCmdTermSrvSendVideo_V3) + msstream.Size;
  pcmd^.Flag := SRVTERM_SENDVIDEW_V3;
  pcmd^.ExtendedFlag := 0;
//  pcmd^.FactID := dev.fact_id;
  pcmd^.DevID := DevId_StrToBCD(Dev.Id);
  pcmd^.CmdID := GetMaxCmdID;

  p := PtrAdd(@buff[0], sizeof(TCmdTermSrvSendVideo_V3));

  try
    hbuf := GlobalAlloc(GMEM_MOVEABLE, msstream.size);
    p := GlobalLock(hbuf);
    CopyMemory(p, msstream.Memory, msstream.Size);
    //Move(msstream.Memory^, p^, msstream.Size);
    p := PtrAdd(p, msstream.Size);
    Result := DirectSend(p, pcmd^.Size);
  finally
    msstream.Free;
  end;
  {info := ACmdManage.Add(pcmd^.CmdId);
  info^.Id := pcmd^.CmdId;
  info^.State := CMD_SNDNODO;
  info^.Desc := '下发视频文件：' + Dev.Car.No;
  info^.SendTime := now();
  info^.CancelTime := 0;
  info^.Replytime := 0;
  SetLength(info^.Content, pcmd^.Size);
  Move(buff[0], info^.Content[0], pcmd^.Size);
  info^.ContentSize := pcmd^.Size;  }

end;

function TGateWayServerCom.SendSetCircleArea_New_V3(Dev: TDevice; CircleArea: TCircleArea; setType: Byte): boolean;
var
  buff: array[0..1023] of Byte;
  p: PByte;
  dateBuf: array[0..5] of Byte;

  info: PCmdinfo;
  bufLen: Word;
  len: Word;
  pacmd: PCmdTermSrvSetCircleAreaTSP_V3;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
begin
  Result := false;
  if not isActive then exit;
  FillChar(buff, 1024, 0);
  pacmd := @buff[0];
  //len := SizeOf(TCmdTermSrvSetCircleAreaTSP_V3);
  pacmd^.SetType := setType;
  pacmd^.AreaCount := 1;
//  pacmd^.PackCount := 1;
  pacmd^.CircleArea.AreaId := ByteOderConvert_LongWord(CircleArea.areaNO);
  pacmd^.CircleArea.AreaProperty := ByteOderConvert_Word(CircleArea.AreaAlarmKind);
  pacmd^.CircleArea.CenterLati := ByteOderConvert_LongWord(round(CircleArea.ACircle.Latitude * 1000000));
  pacmd^.CircleArea.CenterLong := ByteOderConvert_LongWord(Round(CircleArea.ACircle.Longitude * 1000000));
  pacmd^.CircleArea.Radius := ByteOderConvert_LongWord(CircleArea.radius);
  p := PtrAdd(@buff[0], sizeof(TCmdTermSrvSetCircleAreaTSP_V3));
  if (CircleArea.AreaAlarmKind and 1) = 1 then              //根据时间 ,有时间这一项
  begin
    if CircleArea.IsEveryDay then
    begin
      dateBuf[0] := 0;
      dateBuf[1] := 0;
      dateBuf[2] := 0;
    end
    else
    begin
      dateBuf[0] := StrToInt('$'+IntToStr(yearof(CircleArea.beginDateTiem)));
      dateBuf[1] := StrToInt('$'+IntToStr(MonthOf(CircleArea.beginDateTiem)));
      dateBuf[2] := StrToInt('$'+IntToStr(DayOf(CircleArea.beginDateTiem)));
    end;
    dateBuf[3] := StrToInt('$'+IntToStr(HourOf(CircleArea.beginDateTiem)));
    dateBuf[4] := StrToInt('$'+IntToStr(MinuteOf(CircleArea.beginDateTiem)));
    dateBuf[5] := StrToInt('$'+IntToStr(SecondOf(CircleArea.beginDateTiem)));
    CopyMemory(p, @dateBuf[0], 6);
    p := PtrAdd(p, 6);

    if CircleArea.IsEveryDay then
    begin
      dateBuf[0] := 0;
      dateBuf[1] := 0;
      dateBuf[2] := 0;
    end
    else
    begin
      dateBuf[0] := StrToInt('$'+IntToStr(yearof(CircleArea.endDateTime)));
      dateBuf[1] := StrToInt('$'+IntToStr(MonthOf(CircleArea.endDateTime)));
      dateBuf[2] := StrToInt('$'+IntToStr(DayOf(CircleArea.endDateTime)));
    end;
    dateBuf[3] := StrToInt('$'+IntToStr(HourOf(CircleArea.endDateTime)));
    dateBuf[4] := StrToInt('$'+IntToStr(MinuteOf(CircleArea.endDateTime)));
    dateBuf[5] := StrToInt('$'+IntToStr(SecondOf(CircleArea.endDateTime)));
    CopyMemory(p, @dateBuf[0], 6);
    p := PtrAdd(p, 6);
  end;

  if (CircleArea.AreaAlarmKind and 2) = 2 then //有限速这一项
  begin
    PWord(p)^ := ByteOderConvert_Word(CircleArea.maxSpeed);
    p := PtrAdd(p, 2);
    p^ := CircleArea.continueTime;
    p := PtrAdd(p, 1);
  end;
  len := Integer(p) - Integer(@buff[0]);
  InitTSPHeader(pacmd^.Header, len - TSPHEADERLEN, TERMSRV_SETCIRCLEAREA_V3, dev.Id);

  tspPackSize := len + 3;
  SetLength(tspBuf, tspPackSize);
  offSet := 0;
  tspBuf[0] := FLAGTSP;
  Inc(offSet);
  CopyMemory(@tspBuf[offSet], @buff[0], len);
  Inc(offSet, len);
  tspBuf[offSet] := GetXorSum(@tspBuf[1], len);
  Inc(offSet);
  tspBuf[offSet] := FLAGTSP;
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(dev, escapByteBuf);
  info^.Desc := '设置圆形区域到车机：' + Dev.Car.No;
  info^.areaId := CircleArea.AreaID;
  info^.areaSetType := setType + 1;
  Result := True;

//  Result := False;
//  if not isActive then exit;
//
//  pcmd := @buff[0]; //pcmd 指向buff 首址
////  InitHeader(pCmd^.header,0,TERMSRV_SETCIRCLEAREA_V3,Dev.Id);
//  pCmd^.SetType := 1;
//  pCmd^.SetCount := 1;
//  pCmd^.PackCount := 1;
//  pCmd^.AreaID :=  CircleArea.areaNO;
//  pCmd^.AreaAlarmKind := CircleArea.AreaAlarmKind;
//  pCmd^.Latitude := round(CircleArea.ACircle.Latitude * 1000000);
//  pCmd^.Longitude := round(CircleArea.ACircle.Longitude * 1000000);
//  pCmd^.radio := CircleArea.radius;
//  
//  p := PtrAdd(@buff[0], sizeof(TCmdTermSrvSetCircleArea_V3)); //p 指向 buff 移过 已知结构后
//  if (CircleArea.AreaAlarmKind and 1) = 1 then              //根据时间 ,有时间这一项
//  begin
//    if CircleArea.IsEveryDay then
//    begin
//      dateBuf[0] := 0;
//      dateBuf[1] := 0;
//      dateBuf[2] := 0;
//    end
//    else
//    begin
//      dateBuf[0] := StrToInt('$'+IntToStr(yearof(CircleArea.beginDateTiem)));
//      dateBuf[1] := StrToInt('$'+IntToStr(MonthOf(CircleArea.beginDateTiem)));
//      dateBuf[2] := StrToInt('$'+IntToStr(DayOf(CircleArea.beginDateTiem)));
//    end;
//    dateBuf[3] := StrToInt('$'+IntToStr(HourOf(CircleArea.beginDateTiem)));
//    dateBuf[4] := StrToInt('$'+IntToStr(MinuteOf(CircleArea.beginDateTiem)));
//    dateBuf[5] := StrToInt('$'+IntToStr(SecondOf(CircleArea.beginDateTiem)));
//    CopyMemory(p, @dateBuf[0], 6);
//    p := PtrAdd(p, 6);
//
//    if CircleArea.IsEveryDay then
//    begin
//      dateBuf[0] := 0;
//      dateBuf[1] := 0;
//      dateBuf[2] := 0;
//    end
//    else
//    begin
//      dateBuf[0] := StrToInt('$'+IntToStr(yearof(CircleArea.endDateTime)));
//      dateBuf[1] := StrToInt('$'+IntToStr(MonthOf(CircleArea.endDateTime)));
//      dateBuf[2] := StrToInt('$'+IntToStr(DayOf(CircleArea.endDateTime)));
//    end;
//    dateBuf[3] := StrToInt('$'+IntToStr(HourOf(CircleArea.endDateTime)));
//    dateBuf[4] := StrToInt('$'+IntToStr(MinuteOf(CircleArea.endDateTime)));
//    dateBuf[5] := StrToInt('$'+IntToStr(SecondOf(CircleArea.endDateTime)));
//    CopyMemory(p, @dateBuf[0], 6);
//    p := PtrAdd(p, 6);
//  end;
//
//  if (CircleArea.AreaAlarmKind and 2) = 2 then //有限速这一项
//  begin
//    p^ := CircleArea.maxSpeed;
//    p := PtrAdd(p, 2);
//    p^ := CircleArea.continueTime;
//    p := PtrAdd(p, 1);
//  end;
//
//  pCmd^.Header.Size := Integer(p) - Integer(@buff[0]);
//  Result := DirectSend(buff[0],pCmd^.Header.Size);
//
//  info := ACmdManage.Add(pcmd^.Header.CmdOrder);
////  info^.Id := pcmd^.CmdId;
//  info^.State := CMD_SNDNODO;
//  info^.Desc := '设置圆形区域到车机：' + Dev.Car.No;
//  info^.SendTime := now();
//  info^.CancelTime := 0;
//  info^.Replytime := 0;
//  SetLength(info^.Content, pcmd^.header.Size);
//  Move(buff[0], info^.Content[0], pcmd^.header.Size);
//  info^.ContentSize := pcmd^.header.Size;
end;

function TGateWayServerCom.SendSetRectangleArea_New_V3(Dev: TDevice; RectangleArea: TRectangleArea; setType: Byte): Boolean;
var
  buff: array[0..1023] of Byte;
  p: PByte;
  dateBuf: array[0..5] of Byte;

  info: PCmdinfo;
  bufLen: Word;
  len: Word;
  pacmd: PCmdTermSrvSetRectAreaTSP_V3;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
begin
  Result := false;
  if not isActive then exit;
  FillChar(buff, 1024, 0);
  pacmd := @buff[0];
  //len := SizeOf(TCmdTermSrvSetCircleAreaTSP_V3);
  pacmd^.SetType := setType;
  pacmd^.AreaCount := 1;
//  pacmd^.PackCount := 1;
  pacmd^.RectArea.AreaId := ByteOderConvert_LongWord(RectangleArea.areaNO);
  pacmd^.RectArea.AreaProperty := ByteOderConvert_Word(RectangleArea.AreaAlarmKind);
  pacmd^.RectArea.LeftTopLati := ByteOderConvert_LongWord(Round(RectangleArea.leftPoint.Latitude * 1000000));
  pacmd^.RectArea.LeftTopLong := ByteOderConvert_LongWord(Round(RectangleArea.leftPoint.Longitude * 1000000));
  pacmd^.RectArea.RightBottomLati := ByteOderConvert_LongWord(Round(RectangleArea.RightPoint.Latitude * 1000000));
  pacmd^.RectArea.RightBottomLong := ByteOderConvert_LongWord(Round(RectangleArea.RightPoint.Longitude * 1000000));
  p := PtrAdd(@buff[0], sizeof(TCmdTermSrvSetRectAreaTSP_V3));
  if (RectangleArea.AreaAlarmKind and 1) = 1 then
  begin
    if RectangleArea.IsEveryDay then
    begin
      dateBuf[0] := 0;
      dateBuf[1] := 0;
      dateBuf[2] := 0;
    end
    else
    begin
      dateBuf[0] := StrToInt('$'+IntToStr(yearof(RectangleArea.beginDateTiem)));
      dateBuf[1] := StrToInt('$'+IntToStr(MonthOf(RectangleArea.beginDateTiem)));
      dateBuf[2] := StrToInt('$'+IntToStr(DayOf(RectangleArea.beginDateTiem)));
    end;
    dateBuf[3] := StrToInt('$'+IntToStr(HourOf(RectangleArea.beginDateTiem)));
    dateBuf[4] := StrToInt('$'+IntToStr(MinuteOf(RectangleArea.beginDateTiem)));
    dateBuf[5] := StrToInt('$'+IntToStr(SecondOf(RectangleArea.beginDateTiem)));
    CopyMemory(p, @dateBuf[0], 6);
    p := PtrAdd(p, 6);

    if RectangleArea.IsEveryDay then
    begin
      dateBuf[0] := 0;
      dateBuf[1] := 0;
      dateBuf[2] := 0;
    end
    else
    begin
      dateBuf[0] := StrToInt('$'+IntToStr(yearof(RectangleArea.endDateTime)));
      dateBuf[1] := StrToInt('$'+IntToStr(MonthOf(RectangleArea.endDateTime)));
      dateBuf[2] := StrToInt('$'+IntToStr(DayOf(RectangleArea.endDateTime)));
    end;
    dateBuf[3] := StrToInt('$'+IntToStr(HourOf(RectangleArea.endDateTime)));
    dateBuf[4] := StrToInt('$'+IntToStr(MinuteOf(RectangleArea.endDateTime)));
    dateBuf[5] := StrToInt('$'+IntToStr(SecondOf(RectangleArea.endDateTime)));
    CopyMemory(p, @dateBuf[0], 6);
    p := PtrAdd(p, 6);
  end;

  if (RectangleArea.AreaAlarmKind and 2) = 2 then
  begin
    PWord(p)^ := ByteOderConvert_Word(RectangleArea.maxSpeed);
    p := PtrAdd(p, 2);
    p^ := RectangleArea.continueTime;
    p := PtrAdd(p, 1);
  end;
  len := Integer(p) - Integer(@buff[0]);
  InitTSPHeader(pacmd^.Header, len - TSPHEADERLEN, TERMSRV_SETRECTAREA_V3, dev.Id);

  tspPackSize := len + 3;
  SetLength(tspBuf, tspPackSize);
  offSet := 0;
  tspBuf[0] := FLAGTSP;
  Inc(offSet);
  CopyMemory(@tspBuf[offSet], @buff[0], len);
  Inc(offSet, len);
  tspBuf[offSet] := GetXorSum(@tspBuf[1], len);
  Inc(offSet);
  tspBuf[offSet] := FLAGTSP;
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(dev, escapByteBuf);
  info^.Desc := '设置矩形区域到车机：' + Dev.Car.No;
  info^.areaId := RectangleArea.AreaID;
  info^.areaSetType := setType + 1;
  Result := True;
//  Result := False;
//  if not isActive then exit;
//  FillChar(buff, 1024, 0);
//  pcmd := @buff[0]; //pcmd 指向buff 首址
//  pcmd^.Size := 0;
////  pcmd^.Flag := TERMSRV_SETCIRCLEAREA_V3;
//  pcmd^.ExtendedFlag := 0;
////  pcmd^.FactID := Dev.fact_id;
//  pcmd^.DevID := DevId_StrToBCD(Dev.Id);
//  pcmd^.CmdID := GetMaxCmdID;
//
//  pCmd^.AreaCount := 1;
//  pCmd^.AreaID := RectangleArea.areaNO;
//  pCmd^.AreaAlarmKind := RectangleArea.AreaAlarmKind;
//  pCmd^.LeftLatitude := round(RectangleArea.leftPoint.Latitude * 1000000);
//  pCmd^.leftLongitude := round(RectangleArea.leftPoint.Longitude * 1000000);
//  pCmd^.RightLatitude := round(RectangleArea.RightPoint.Latitude * 1000000);
//  pCmd^.RightLongitude := round(RectangleArea.RightPoint.Longitude * 1000000);
//  p := PtrAdd(@buff[0], sizeof(TCmdTermSrvSetCircleArea_V3)); //p 指向 buff 移过 已知结构后
//  if (RectangleArea.AreaAlarmKind and 1) = 1 then
//  begin
//    dateBuf[0] := StrToInt('$'+IntToStr(yearof(RectangleArea.beginDateTiem)));
//    dateBuf[1] := StrToInt('$'+IntToStr(MonthOf(RectangleArea.beginDateTiem)));
//    dateBuf[2] := StrToInt('$'+IntToStr(DayOf(RectangleArea.beginDateTiem)));
//    dateBuf[3] := StrToInt('$'+IntToStr(HourOf(RectangleArea.beginDateTiem)));
//    dateBuf[4] := StrToInt('$'+IntToStr(MinuteOf(RectangleArea.beginDateTiem)));
//    dateBuf[5] := StrToInt('$'+IntToStr(SecondOf(RectangleArea.beginDateTiem)));
//    CopyMemory(p, @dateBuf[0], 6);
//    p := PtrAdd(p, 6);
//
//    dateBuf[0] := StrToInt('$'+IntToStr(yearof(RectangleArea.endDateTime)));
//    dateBuf[1] := StrToInt('$'+IntToStr(MonthOf(RectangleArea.endDateTime)));
//    dateBuf[2] := StrToInt('$'+IntToStr(DayOf(RectangleArea.endDateTime)));
//    dateBuf[3] := StrToInt('$'+IntToStr(HourOf(RectangleArea.endDateTime)));
//    dateBuf[4] := StrToInt('$'+IntToStr(MinuteOf(RectangleArea.endDateTime)));
//    dateBuf[5] := StrToInt('$'+IntToStr(SecondOf(RectangleArea.endDateTime)));
//    CopyMemory(p, @dateBuf[0], 6);
//    p := PtrAdd(p, 6);
//  end;
//
//  if (RectangleArea.AreaAlarmKind and 2) = 2 then
//  begin
//    p^ := RectangleArea.maxSpeed;
//    p := PtrAdd(p, 2);
//    p^ := RectangleArea.continueTime;
//    p := PtrAdd(p, 1);
//  end;
//
//  Pcmd^.Size := Integer(p) - Integer(@buff[0]);
//  Result := DirectSend(buff[0], pcmd^.Size);
//
//  info := ACmdManage.Add(pcmd^.CmdId);
//  info^.Id := pcmd^.CmdId;
//  info^.State := CMD_SNDNODO;
//  info^.Desc := '设置车机矩形区域：' + Dev.Car.No;
//  info^.SendTime := now();
//  info^.CancelTime := 0;
//  info^.Replytime := 0;
//  SetLength(info^.Content, pcmd^.Size);
//  Move(buff[0], info^.Content[0], pcmd^.Size);
//  info^.ContentSize := pcmd^.Size;
end;

function TGateWayServerCom.SendSetNoSymbolArea_New_V3(Dev: TDevice; NoSymbolArea: TNoSymbolArea): Boolean;
var
  info: PCmdinfo;
  buff: array[0..1023] of Byte;
  p: PByte;
  dateBuf: array[0..5] of Byte;
  Apoint: TEarthPoint;
  i, cx, cy: integer;
  buf: array of Byte;
  bufLen: Word;
  len: Word;
  pacmd: PCmdTermSrvSetPolygonAreaTSP_V3;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
begin
  Result := false;
  if not isActive then exit;
  FillChar(buff, 1024, 0);
  pacmd := @buff[0];
  //len := SizeOf(TCmdTermSrvSetCircleAreaTSP_V3);
  pacmd^.PolygonArea.AreaId := ByteOderConvert_LongWord(NoSymbolArea.areaNO);
  pacmd^.PolygonArea.AreaProperty := ByteOderConvert_Word(NoSymbolArea.AreaAlarmKind);
  p := PtrAdd(@buff[0], sizeof(TCmdTermSrvSetPolygonAreaTSP_V3));
  if (NoSymbolArea.AreaAlarmKind and 1) = 1 then
  begin
    if NoSymbolArea.IsEveryDay then
    begin
      dateBuf[0] := 0;
      dateBuf[1] := 0;
      dateBuf[2] := 0;
    end
    else
    begin
      dateBuf[0] := StrToInt('$'+IntToStr(yearof(NoSymbolArea.beginDateTiem)));
      dateBuf[1] := StrToInt('$'+IntToStr(MonthOf(NoSymbolArea.beginDateTiem)));
      dateBuf[2] := StrToInt('$'+IntToStr(DayOf(NoSymbolArea.beginDateTiem)));
    end;
    dateBuf[3] := StrToInt('$'+IntToStr(HourOf(NoSymbolArea.beginDateTiem)));
    dateBuf[4] := StrToInt('$'+IntToStr(MinuteOf(NoSymbolArea.beginDateTiem)));
    dateBuf[5] := StrToInt('$'+IntToStr(SecondOf(NoSymbolArea.beginDateTiem)));
    CopyMemory(p, @dateBuf[0], 6);
    p := PtrAdd(p, 6);

    if NoSymbolArea.IsEveryDay then
    begin
      dateBuf[0] := 0;
      dateBuf[1] := 0;
      dateBuf[2] := 0;
    end
    else
    begin
      dateBuf[0] := StrToInt('$'+IntToStr(yearof(NoSymbolArea.endDateTime)));
      dateBuf[1] := StrToInt('$'+IntToStr(MonthOf(NoSymbolArea.endDateTime)));
      dateBuf[2] := StrToInt('$'+IntToStr(DayOf(NoSymbolArea.endDateTime)));
    end;
    dateBuf[3] := StrToInt('$'+IntToStr(HourOf(NoSymbolArea.endDateTime)));
    dateBuf[4] := StrToInt('$'+IntToStr(MinuteOf(NoSymbolArea.endDateTime)));
    dateBuf[5] := StrToInt('$'+IntToStr(SecondOf(NoSymbolArea.endDateTime)));
    CopyMemory(p, @dateBuf[0], 6);
    p := PtrAdd(p, 6);
  end;

  if (NoSymbolArea.AreaAlarmKind and 2) = 2 then
  begin
    PWord(p)^ := ByteOderConvert_Word(NoSymbolArea.maxSpeed);
    p := PtrAdd(p, 2);
    p^ := NoSymbolArea.continueTime;
    p := PtrAdd(p, 1);
  end;

  PWord(p)^ := ByteOderConvert_Word(NoSymbolArea.PointCount);
  p := PtrAdd(p, 2);

  for i := 0 to NoSymbolArea.PointCount - 1 do
  begin
    Apoint := Project.XY2LoLa(NoSymbolArea.WorldPointAry[i]);
    cx := round(Apoint.Longitude * 1000000);  // 经度
    cy := round(Apoint.Latitude * 1000000);   // 纬度
    PLongWord(p)^ := ByteOderConvert_LongWord(cy);
    p := PtrAdd(p, 4);
    PLongWord(p)^ := ByteOderConvert_LongWord(cx);
    p := PtrAdd(p, 4);
  end;

  len := Integer(p) - Integer(@buff[0]);
  InitTSPHeader(pacmd^.Header, len - TSPHEADERLEN, TERMSRV_SETPOLYGONAREA_V3, dev.Id);

  tspPackSize := len + 3;
  SetLength(tspBuf, tspPackSize);
  offSet := 0;
  tspBuf[0] := FLAGTSP;
  Inc(offSet);
  CopyMemory(@tspBuf[offSet], @buff[0], len);
  Inc(offSet, len);
  tspBuf[offSet] := GetXorSum(@tspBuf[1], len);
  Inc(offSet);
  tspBuf[offSet] := FLAGTSP;
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(dev, escapByteBuf);
  info^.Desc := '设置不规则区域到车机：' + Dev.Car.No;
  info^.areaId := NoSymbolArea.AreaID;
  info^.areaSetType := 0;
  Result := True;

//  Result := False;
//  if not isActive then exit;
//  FillChar(buff, 1024, 0);
//  pcmd := @buff[0]; //pcmd 指向buff 首址
//  pcmd^.Size := 0;
////  pcmd^.Flag := TERMSRV_SETNOSYMBOLAREA_V3;
//  pcmd^.ExtendedFlag := 0;
////  pcmd^.FactID := Dev.fact_id;
//  pcmd^.DevID := DevId_StrToBCD(Dev.Id);
//  pcmd^.CmdID := GetMaxCmdID;
//
//  pCmd^.AreaID := NoSymbolArea.areaNO;
//  pCmd^.AreaAlarmKind := NoSymbolArea.AreaAlarmKind;
//
//  p := PtrAdd(@buff[0], sizeof(TCmdTermSrvSetNoSymbolArea_V3)); //p 指向 buff 移过 已知结构后
//  if (NoSymbolArea.AreaAlarmKind and 1) = 1 then
//  begin
//    dateBuf[0] := StrToInt('$'+IntToStr(yearof(NoSymbolArea.beginDateTiem)));
//    dateBuf[1] := StrToInt('$'+IntToStr(MonthOf(NoSymbolArea.beginDateTiem)));
//    dateBuf[2] := StrToInt('$'+IntToStr(DayOf(NoSymbolArea.beginDateTiem)));
//    dateBuf[3] := StrToInt('$'+IntToStr(HourOf(NoSymbolArea.beginDateTiem)));
//    dateBuf[4] := StrToInt('$'+IntToStr(MinuteOf(NoSymbolArea.beginDateTiem)));
//    dateBuf[5] := StrToInt('$'+IntToStr(SecondOf(NoSymbolArea.beginDateTiem)));
//    CopyMemory(p, @dateBuf[0], 6);
//    p := PtrAdd(p, 6);
//
//    dateBuf[0] := StrToInt('$'+IntToStr(yearof(NoSymbolArea.endDateTime)));
//    dateBuf[1] := StrToInt('$'+IntToStr(MonthOf(NoSymbolArea.endDateTime)));
//    dateBuf[2] := StrToInt('$'+IntToStr(DayOf(NoSymbolArea.endDateTime)));
//    dateBuf[3] := StrToInt('$'+IntToStr(HourOf(NoSymbolArea.endDateTime)));
//    dateBuf[4] := StrToInt('$'+IntToStr(MinuteOf(NoSymbolArea.endDateTime)));
//    dateBuf[5] := StrToInt('$'+IntToStr(SecondOf(NoSymbolArea.endDateTime)));
//    CopyMemory(p, @dateBuf[0], 6);
//    p := PtrAdd(p, 6);
//  end;
//
//  if (NoSymbolArea.AreaAlarmKind and 2) = 2 then
//  begin
//    p^ := NoSymbolArea.maxSpeed;
//    p := PtrAdd(p, 2);
//    p^ := NoSymbolArea.continueTime;
//    p := PtrAdd(p, 1);
//  end;
//
//  p^ := NoSymbolArea.PointCount;
//  p := PtrAdd(p, 2);
//  p^ := NoSymbolArea.PointCount;
//  p := PtrAdd(p, 1);
//
//  for i := 0 to NoSymbolArea.PointCount - 1 do
//  begin
//    Apoint := Project.XY2LoLa(NoSymbolArea.WorldPointAry[i]);
//    cx := round(Apoint.Longitude * 1000000);  // 经度
//    cy := round(Apoint.Latitude * 1000000);   // 纬度
//    p^ :=  cy;
//    p := PtrAdd(p, 4);
//    p^ := cx;
//    p := PtrAdd(p, 4);
//  end;
//
//  Pcmd^.Size := Integer(p) - Integer(@buff[0]);
//  Result := DirectSend(buff[0], pcmd^.Size);
//
//  info := ACmdManage.Add(pcmd^.CmdId);
//  info^.Id := pcmd^.CmdId;
//  info^.State := CMD_SNDNODO;
//  info^.Desc := '设置车机不规则区域：' + Dev.Car.No;
//  info^.SendTime := now();
//  info^.CancelTime := 0;
//  info^.Replytime := 0;
//  SetLength(info^.Content, pcmd^.Size);
//  Move(buff[0], info^.Content[0], pcmd^.Size);
//  info^.ContentSize := pcmd^.Size;
end;

function TGateWayServerCom.SendDeleteAreaListForDev_V3(Flag: Word; Dev: TDevice; AreaList: TStringList; IsDelAreaFromDB: Boolean): Boolean;
var
  pCmd: PCmdTermSrvCancelArea_V3;
  ALen: word;
  strutLen: integer;

  info: PCmdinfo;
  buff: array[0..1023] of Byte;
  p: PByte;
  dateBuf: array[0..5] of Byte;
  i: integer;
  len: Word;
  pacmd: PCmdTermSrvDelAreaTSP_V3;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
begin
  Result := false;
  if not isActive then exit;
  FillChar(buff, 1024, 0);
  pacmd := @buff[0];
  //len := SizeOf(TCmdTermSrvSetCircleAreaTSP_V3);
  pacmd^.AreaCount := AreaList.Count;
  p := PtrAdd(@buff[0], sizeof(TCmdTermSrvDelAreaTSP_V3));

  for i := 0 to AreaList.Count - 1 do
  begin
    PLongWord(p)^ := ByteOderConvert_LongWord(StrToInt(AreaList.Strings[i]));
    p := PtrAdd(p, 4);
  end;  

  len := Integer(p) - Integer(@buff[0]);
  InitTSPHeader(pacmd^.Header, len - TSPHEADERLEN, Flag, dev.Id);

  tspPackSize := len + 3;
  SetLength(tspBuf, tspPackSize);
  offSet := 0;
  tspBuf[0] := FLAGTSP;
  Inc(offSet);
  CopyMemory(@tspBuf[offSet], @buff[0], len);
  Inc(offSet, len);
  tspBuf[offSet] := GetXorSum(@tspBuf[1], len);
  Inc(offSet);
  tspBuf[offSet] := FLAGTSP;
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(dev, escapByteBuf);
  info^.Desc := '删除设置到车机中的区域：' + Dev.Car.No;
  info^.DeleteArea := True;
  info^.AreaList := TStringList.Create;
  info^.IsDeleteArea := IsDelAreaFromDB;
  for i := 0 to AreaList.Count - 1 do
  begin
    info^.AreaList.Add(AreaList.Strings[i]);
  end;  
  Result := True;

//  Result := false;
//  if not isActive then exit;
//  FillChar(buff, 1024, 0);
//  pcmd := @buff[0]; //pcmd 指向buff 首址
//  pCmd^.Size := 0;
//  pCmd^.Flag := Flag;//TCLIENT_CANCELCIRCLEAREA_V3;
//  pCmd^.ExtendedFlag := 0;
////  pCmd^.FactID := Dev.fact_id;
//  pCmd^.DevID := DevId_StrToBCD(Dev.Id);
//  pCmd^.CmdID := GetMaxCmdID;
//  GReadParamCmdID := pCmd^.CmdID;
//  pCmd^.count := AreaList.Count;
//
//  p := PtrAdd(@buff[0], sizeof(TCmdTermSrvCancelArea_V3)); //p 指向 buff 移过 已知结构后
//
//  for i := 0 to AreaList.Count-1 do
//  begin
//    p^ := StrToInt(AreaList.Strings[i]);
//    p := PtrAdd(p, 4);
//  end;
//  Pcmd^.Size := Integer(p) - Integer(@buff[0]);
//  Result := DirectSend(buff[0], pCmd^.Size);
//
//  info := ACmdManage.Add(pCmd^.CmdId);
//  info^.Id := pCmd^.CmdId;
//  info^.State := CMD_SNDNODO;
//  info^.Desc := '删除报警区域：' + Dev.Car.No;
//  info^.SendTime := now();
//  info^.CancelTime := 0;
//  info^.Replytime := 0;
//  SetLength(info^.Content, pCmd^.Size);
//  Move(pCmd^, info^.Content[0], pCmd^.Size);
//  info^.ContentSize := pCmd.Size;
//  info^.DeleteArea := True;
//  info^.AreaList := AreaList;
end;

function TGateWayServerCom.SendInitializeMCU_V3(Dev: TDevice): Boolean;
var
  cmd: TCmdtermSrvInitializeMCU_V3;
  info: PCmdinfo;
begin
  Result := false;
  if not isActive then exit;
  Cmd.Size := SizeOf(TCmdtermSrvInitializeMCU_V3);
  Cmd.Flag := TERMSRVINITIALIZEMCU_V3;
  Cmd.ExtendedFlag := 0;
//  Cmd.FactID := dev.fact_id;
  Cmd.DevID := DevId_StrToBCD(Dev.Id);
  Cmd.CmdID := GetMaxCmdID;
  Result := DirectSend(Cmd, Cmd.Size);

  info := ACmdManage.Add(Cmd.CmdId);
  info^.Id := Cmd.CmdId;
  info^.State := CMD_SNDNODO;
  info^.Desc := '发送恢复MCU出厂默认值' + Dev.Car.No;
  info^.DevId := Dev.Id;
  info^.SendTime := now();
  info^.CancelTime := 0;
  info^.Replytime := 0;
  SetLength(info^.Content, Cmd.Size);
  Move(Cmd, info^.Content[0], Cmd.Size);
  info^.ContentSize := Cmd.Size;
end;

function TGateWayServerCom.SendControlMCU_V3(Dev: TDevice): Boolean;
var
  cmd: TCmdtermSrvControlMCU_V3;
  info: PCmdinfo;
begin
  Result := false;
  if not isActive then exit;
  Cmd.Size := SizeOf(TCmdtermSrvControlMCU_V3);
  Cmd.Flag := TRRMSERVCONTROLMCU_V3;
  Cmd.ExtendedFlag := 0;
//  Cmd.FactID := Dev.fact_id;
  Cmd.DevID := DevId_StrToBCD(Dev.Id);
  Cmd.CmdID := GetMaxCmdID;
  Result := DirectSend(Cmd, Cmd.Size);

  info := ACmdManage.Add(Cmd.CmdId);
  info^.Id := Cmd.CmdId;
  info^.State := CMD_SNDNODO;
  info^.Desc := '发送控制MCU复位' + Dev.Car.No;
  info^.DevId := Dev.Id;
  info^.SendTime := now();
  info^.CancelTime := 0;
  info^.Replytime := 0;
  SetLength(info^.Content, Cmd.Size);
  Move(Cmd, info^.Content[0], Cmd.Size);
  info^.ContentSize := Cmd.Size;
end;

function TGateWayServerCom.SendControlTerminal_V3(Dev: TDevice; ControlID:byte; controlParam:string=''): Boolean;
var
  cmd: TCmdTermSrvControlTerminalTSP_V3;//TCmdTermSrvSetDevParam_V3;//TCmdTermSrvSetDevParam_V2;
  buf: array of Byte;
  info: PCmdinfo;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
begin
  Result := false;
  if not isActive then exit;
  tspPackSize := SizeOf(TCmdTermSrvControlTerminalTSP_V3)  + 1;//加1位校验码
  if controlParam <> '' then
    tspPackSize := tspPackSize + Length(controlParam);
  InitTSPHeader(cmd.Header, tspPackSize - TSPHEADERLEN - 1, TERMSRV_CONTROLTERMINAL_V3, Dev.Id);
  cmd.ControlID := ControlID;

  SetLength(tspBuf, tspPackSize + 2);//整个完整的包需在包两端加标识位
  offSet := 0;
  tspBuf[offset] := FLAGTSP;//标识位
  Inc(offSet);

  CopyMemory(@tspBuf[offset], @cmd, SizeOf(TCmdTermSrvControlTerminalTSP_V3));
  Inc(offSet, SizeOf(TCmdTermSrvControlTerminalTSP_V3));

  if controlParam <> '' then
  begin
    CopyMemory(@tspBuf[offset], @controlParam[1], Length(controlParam));
    Inc(offSet, Length(controlParam));
  end;

  tspBuf[offSet] := GetXorSum(@tspBuf[1], tspPackSize - 1);//从消息头开始，不包括标识位
  Inc(offSet);

  tspBuf[offSet] := FLAGTSP;//标识位
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(Dev, escapByteBuf);

  info^.Desc := '发送终端控制信息：' + dev.Car.No+'：'+inttostr(ControlID);

//begin
//  Result := false;
//  if not isActive then exit;
//  Len := SizeOf(TCmdTermSrvControlTerminal_V3);
//  if ControlID=1 then
//  begin
//    Len := len+length(controlParam);
//  end;
//  SetLength(sendBuff,len);
//  pCmd := @sendbuff[0];
//  InitTSPHeader(pcmd^.Header,len, TERMSRVCONTROLTERMINAL_V3, Dev.id);
//  pcmd^.ControlID := ControlID;
//  if ControlID=1 then
//    CopyMemory(@sendbuff[SizeOf(TCmdTermSrvControlTerminal_V3)],@controlParam[1],Length(controlParam));
//  Result := DirectSend(SendBuff[0], Len);

//  FillChar(buff, 1024, 0);
//  Len := SizeOf(TCmdTermSrvControlTerminal_V3);
//  pcmd := @buff[0]; //pcmd 指向buff 首址
//  pCmd^.Size := Len;
//  pCmd^.Flag := TERMSRV_CONTROLTERMINAL_V3;
//  pCmd^.ExtendedFlag := 0;
////  pCmd^.FactID := Dev.fact_id;
//  pCmd^.DevID := DevId_StrToBCD(Dev.id);
//  pCmd^.CmdID := GetMaxCmdID;
//  pCmd^.ControlID := ControlID;
//  p := PtrAdd(@buff[0], sizeof(TCmdTermSrvControlTerminal_V3)); //p 指向 buff 移过 已知结构后
//
//  CopyMemory(p,@MCUType,1);
//  p := PtrAdd(p, 1);
//
//  CopyMemory(p,@Fact_ID,1);
//  p := PtrAdd(p, 1);
//
//  Hard_Ver := StrToInt('$' + IntToStr(Hard_Ver));
//  CopyMemory(p,@Hard_Ver,1);
//  p := PtrAdd(p, 1);
//
//  SetLength(Soft_VerBcd, 2);
//  //Soft_VerBcd := wordToBCD(StrToInt(Soft_Ver));
//  if Pos('.', Soft_Ver) > 0 then
//  begin
//    Soft_VerBcd[0] :=  StrToInt('$' + Copy(Soft_Ver, 1, Pos('.', Soft_Ver)-1));
//    Soft_VerBcd[1] :=  StrToInt('$' + Copy(Soft_Ver, Pos('.', Soft_Ver)+1, Length(Soft_Ver)));
//  end
//  else
//  begin
//    Soft_VerBcd[0] := StrToInt('$' + Soft_Ver);
//    Soft_VerBcd[1] := 0;
//  end;
//  CopyMemory(p,@Soft_VerBcd[0],2);
//  p := PtrAdd(p, 2);
//
//  InitStr(str, Length(APN));
//  CopyMemory(@str[1], @APN[1], Length(APN));
//  CopyMemory(p, @str[1], Length(APN)+1);
//  p := PtrAdd(p, Length(APN)+1);
//
//  InitStr(str, Length(name));
//  CopyMemory(@str[1], @name[1], Length(name));
//  CopyMemory(p, @str[1], Length(name)+1);
//  p := PtrAdd(p, Length(name)+1);
//
//  InitStr(str, Length(password));
//  CopyMemory(@str[1], @password[1], Length(password));
//  CopyMemory(p, @str[1], Length(password)+1);
//  p := PtrAdd(p, Length(password)+1);
//
//  InitStr(str, Length(IP));
//  CopyMemory(@str[1], @IP[1], Length(IP));
//  CopyMemory(p, @str[1], Length(IP)+1);
//  p := PtrAdd(p, Length(IP)+1);
//
//  //P^ := port;
//  CopyMemory(p,@Port,2);
//  p := PtrAdd(p, 2);
//
//  //P^ := time;
//  ////CopyMemory(p,@time,2);
//  ////p := PtrAdd(p, 2);
//
//  Pcmd^.Size := Integer(p) - Integer(@buff[0]);
//  SetLength(sendBuff,pcmd^.Size);
//  CopyMemory(@SendBuff[0],@buff[0],pCmd^.Size);
//  Result := DirectSend(SendBuff[0], pCmd^.Size);

//  info^.Desc := '发送终端控制信息：' + dev.Car.No+'：'+inttostr(ControlID);
end;

function TGateWayServerCom.SendControlMcu_V3_Wl(Dev: TDevice;ControlID:byte): Boolean;
var
  Cmd: TCmdTermSrvControlTerminal_V3;
  info: PCmdinfo;
  Len: integer;
begin
//  Result := false;
//  if not isActive then exit;
//  Len := SizeOf(TCmdTermSrvControlTerminal_V3);
//  Cmd.Size := Len;
//  Cmd.Flag := TERMSRV_CONTROLTERMINAL_V3;
//  Cmd.ExtendedFlag := 0;
////  Cmd.FactID := dev.fact_id;
//  Cmd.DevID := DevId_StrToBCD(Dev.id);
//  Cmd.CmdID := GetMaxCmdID;
//  Cmd.ControlID := ControlID;
//
//  Result := DirectSend(cmd,cmd.Size);
//
//  info := ACmdManage.Add(cmd.CmdId);
//  info^.Id := cmd.CmdId;
//  info^.State := CMD_SNDNODO;
//  info^.Desc := '发送终端控制信息：' + dev.Car.No +IntToStr(ControlID);
//
//  info^.DevId := dev.id;
//  info^.SendTime := now();
//  info^.CancelTime := 0;
//  info^.Replytime := 0;
//  SetLength(info^.Content, cmd.Size);
//  Move(Cmd, info^.Content[0], cmd.Size);
//  info^.ContentSize := cmd.Size;
//
//  SaveCMD.CmdList.AddData(Cmd.CmdId, info);
//
//  {try
//    bs.AddNewCmdLog(current_user.id, Dev.fact_id, Dev.id,
//                    TERMSRV_CONTROLTERMINAL_V3, info^.Desc);
//  except
//  end;     }

end;

function TGateWayServerCom.SendCLIENT_SETELCFENCE(Dev: TDevice;
  AreaID: word; kindAlarm, overSpeedAlarm, lying, kindArea: byte;
  len: word; param: array of byte): boolean;
var
  Cmd: TCmdTermSrvSETELCFENCE_New;
  ALen: word;
  info: PCmdinfo;
  buff: array of byte;
  strutLen: integer;
begin
  Result := false;
  if not isActive then exit;
  strutLen := SizeOf(TCmdTermSrvSETELCFENCE_New);
  ALen := strutLen + len;
  setlength(buff, ALen);
  Cmd.Size := Alen;
  Cmd.Flag := CLIENT_SETELCFENCE;
  Cmd.CmdID := GetMaxCmdID;
  cmd.devId := DevId_StrToBCD(Dev.Id);
  Cmd.AreaID := AreaID;
  Cmd.kindAlarm := kindAlarm;
  cmd.overAlarm := overSpeedAlarm;
  cmd.lyAlarm := lying;
  cmd.kindArea := kindArea;
  cmd.len := len;
  CopyMemory(@buff[0], @Cmd, strutLen);
  CopyMemory(@buff[strutLen], @param[0], Len);
  Result := DirectSend(buff[0], ALen);

  info := ACmdManage.Add(Cmd.CmdId);

  info^.Id := Cmd.CmdId;
  info^.Dev := Dev;
  info^.State := CMD_SNDNODO;
  info^.Desc := '对' + Dev.Car.No + '发送存储围栏';
  info^.SendTime := now();
  info^.CancelTime := 0;
  info^.Replytime := 0;
  SetLength(info^.Content, Cmd.Size);
  Move(buff[0], info^.Content[0], Cmd.Size);
  info^.ContentSize := Cmd.Size;

end;

function TGateWayServerCom.SendReadAreaListForDev(Dev: TDevice): boolean;
var
  Cmd: TCmdTermSrvREADSAVEELCFENCE_New;
  Len: integer;
  info: PCmdinfo;
  buff: array of byte;
begin
  Result := false;
  if not isActive then exit;
  Len := SizeOf(TCmdTermSrvREADSAVEELCFENCE_New);
  SetLength(buff, Len);
  Cmd.Size := Len;
  Cmd.Flag := TCLIENT_READSAVEELCFENCE;
  Cmd.CmdID := GetMaxCmdID;
  GSetParamCmdID := Cmd.CmdID;
  Cmd.DevID := DevId_StrToBCD(Dev.Id);
  CopyMemory(@buff[0], @Cmd, Len);
  Result := DirectSend(Buff[0], Len);

  info := ACmdManage.Add(Cmd.CmdId);
  info^.Id := Cmd.CmdId;
  info^.Dev := Dev;
  info^.State := CMD_SNDNODO;
  info^.Desc := '读取' + Dev.Car.No + '电子围栏';
  info^.SendTime := now();
  info^.CancelTime := 0;
  info^.Replytime := 0;
  SetLength(info^.Content, Cmd.Size);
  Move(buff[0], info^.Content[0], Cmd.Size);
  info^.ContentSize := Cmd.Size;

end;

procedure TGateWayServerCom.DealReadAreaForDev(ABuf: PByte);
var
  cmdId: integer;
  p: PCmdInfo;

  buffAll: array of byte;
  bufflen: integer;
  dataLen: integer;
  ALen: integer;
  i: integer;
  AreaID: integer;
  j: integer;
  baseArea: TBaseArea;
  CircleArea: TCircleArea;
  NoSymbolArea: TNoSymbolArea;
  RectangleArea: TRectangleArea;
begin
  i := 0;
  j := 0;
  bufflen := 0;
  datalen := 0;
  if PCmdSrvTermREADSAVEELCFENCE_New(ABuf)^.Ret = RET_OK then
  begin
    cmdId := PCmdSrvTermREADSAVEELCFENCE_New(ABuf)^.CmdID;
    p := ACmdManage.Find(cmdid);
    if p = nil then exit;
    p^.State := CMD_DONE;
    p^.Replytime := now();
    //====读取车机所有电子围栏==/
    datalen := PCmdSrvTermREADSAVEELCFENCE_New(ABuf)^.Size;
    ALen := sizeof(TCmdTermSrvREADSAVEELCFENCE_New);
    setlength(buffAll, datalen);
    CopyMemory(@buffAll[0], Abuf, datalen);
    bufflen := datalen - ALen; //ID的总长度
    if FrmReadAreaFor <> nil then
    begin
      FrmReadAreaFor.ListView1.Clear;
      FrmReadAreaFor.ComboBox1.Clear;
      FrmReadAreaFor.Edit1.Text := '';
      FrmReadAreaFor.Edit1.Text := p^.Dev.IdStr;

      for i := 0 to (bufflen div 2) - 1 do
      begin
        AreaID := 0;
        AreaID := (buffAll[j + ALen]) * 256 + (buffAll[j + ALen + 1]);
        FrmReadAreaFor.ComboBox1.Items.Add(inttostr(AreaID));
        j := 2 * (i + 1);
      end;

      FrmReadAreaFor.ListView1.Clear;
      FrmReadAreaFor.ListView2.Clear;
      FrmReadAreaFor.ListView3.Clear;
      FrmReadAreaFor.ComboBox1.ItemIndex := 0;

      //====根据combobox1数值中的区域ID 号码加数据====//
      for i := 0 to FrmReadAreaFor.ComboBox1.Items.Count - 1 do
      begin
        AreaID := strtoint(FrmReadAreaFor.ComboBox1.Items.Strings[i]);
        baseArea := FAllAreaManage.find(AreaID);
        if baseArea <> nil then
        begin
          case baseArea.AreaPictureKind of
            0: begin
                CircleArea := TCircleArea(FAllAreaManage.find(AreaID));
                with FrmReadAreaFor.ListView1.Items.Add do
                begin
                  caption := inttostr(areaID);
                  subitems.Add(CircleArea.AreaName);
                  case CircleArea.AreaAlarmKind of
                    0:
                      begin
                        subitems.Add('不报警');
                      end;
                    1:
                      begin
                        subitems.Add('进区域报警');
                      end;
                    2:
                      begin
                        subitems.Add('出区域报警');
                      end;
                  end;
                  subitems.Add(inttostr(CircleArea.OverAlarmValue));
                  subitems.Add(inttostr(CircleArea.idlingAlarmValue));
               //   subitems.Add(inttostr(CircleArea.ACircle.X) + ',' + inttostr(CircleArea.ACircle.y));
                  subitems.Add(inttostr(CircleArea.radius));
                  subitems.Add('');
                end;
              end;
            1: begin
                RectangleArea := TRectangleArea(FAllAreaManage.find(AreaID));
                with FrmReadAreaFor.ListView2.Items.Add do
                begin
                  caption := inttostr(areaID);
                  subitems.Add(RectangleArea.AreaName);
                  case RectangleArea.AreaAlarmKind of
                    0:
                      begin
                        subitems.Add('不报警');
                      end;
                    1:
                      begin
                        subitems.Add('进区域报警');
                      end;
                    2:
                      begin
                        subitems.Add('出区域报警');
                      end;
                  end;
                  subitems.Add(inttostr(RectangleArea.OverAlarmValue));
                  subitems.Add(inttostr(RectangleArea.idlingAlarmValue));
                  subitems.Add(formatfloat('0.000', RectangleArea.leftPoint.Longitude) + ',' + formatfloat('0.000', RectangleArea.leftPoint.Latitude));
                  subitems.Add(formatfloat('0.000', RectangleArea.RightPoint.Longitude) + ',' + formatfloat('0.000', RectangleArea.RightPoint.Latitude));
                  subitems.Add('');
                end;
              end;
            2: begin
                with FrmReadAreaFor.ListView3.Items.Add do
                begin
                  NoSymbolArea := TNoSymbolArea(FAllAreaManage.find(AreaID));
                  caption := inttostr(areaID);
                  subitems.Add(NoSymbolArea.AreaName);
                  case NoSymbolArea.AreaAlarmKind of
                    0:
                      begin
                        subitems.Add('不报警');
                      end;
                    1:
                      begin
                        subitems.Add('进区域报警');
                      end;
                    2:
                      begin
                        subitems.Add('出区域报警');
                      end;
                  end;
                  subitems.Add(inttostr(NoSymbolArea.OverAlarmValue));
                  subitems.Add(inttostr(NoSymbolArea.idlingAlarmValue));
                  subitems.Add('');
                end;
              end;
          end;
        end;

      end;
      FrmReadAreaFor.Show;
    end
    else
    begin
      cmdId := PCmdSrvTermREADSAVEELCFENCE_New(ABuf)^.CmdId;
      p := ACmdManage.Find(cmdid);
      if p = nil then exit;
      p^.State := CMD_DOERROR;
      p^.Replytime := now();
    end;

    if PCmdSrvTermReadAllAd_New(ABuf)^.Ret = ERR_LED then
    begin
      isSendSuccessFailPop(PCmdSrvTermREADSAVEELCFENCE_New(ABuf)^.Ret + 10, p^.Desc);
    end else
    begin
      isSendSuccessFailPop(PCmdSrvTermREADSAVEELCFENCE_New(ABuf)^.Ret, p^.Desc);
    end;

  end;
//  SetIsOnline(PCmdSrvTermREADSAVEELCFENCE_New(ABuf)^.DevId,
//    PCmdSrvTermREADSAVEELCFENCE_New(ABuf)^.Ret);
end;

procedure TGateWayServerCom.DealDeleteAreaList(ABuf: PByte);
var
  cmdId: integer;
  p: PCmdInfo;
  AreaID: word;
  i: integer;
  allbuf: array of byte;
  arealength: integer;
begin
  if pCmdSrvTermCANCELDESIGNFENCE_New(ABuf)^.Ret = RET_OK then
  begin
    cmdId := pCmdSrvTermCANCELDESIGNFENCE_New(ABuf)^.CmdID;
    p := ACmdManage.Find(cmdid);
    if p = nil then exit;
    p^.State := CMD_DONE;
    p^.Replytime := now();
    arealength := p^.ContentSize - 11;
    setlength(allbuf, arealength);
    ////////发送的内容 中   应该删除对应的关系

    copymemory(@allbuf[0], @p^.Content[11], arealength);
    //  // 删除区域与车机的对应关系
    for i := 0 to arealength div 2 - 1 do
    begin
      areaID := allbuf[i] + allbuf[i + 1] * 256;
      bs.DeleteAreaByDev_New(p^.Dev.IdStr, areaID);
      if FAllAreaManage.find(areaID) <> nil then
      begin
        FAllAreaManage.find(areaID).DeleteDev(p^.Dev.IdStr);
        SendDelete(areaID, p^.Dev.IdStr, true);
      end;
    end;
//    SetIsOnline(pCmdSrvTermCANCELDESIGNFENCE_New(ABuf)^.DevId,
//      pCmdSrvTermCANCELDESIGNFENCE_New(ABuf)^.Ret); //成功时，给
  end
  else
  begin
    cmdId := pCmdSrvTermCANCELDESIGNFENCE_New(ABuf)^.CmdId;
    p := ACmdManage.Find(cmdid);
    if p = nil then exit;
    p^.State := CMD_DOERROR;
    p^.Replytime := now();
  end;
  if pCmdSrvTermCANCELDESIGNFENCE_New(ABuf)^.Ret = ERR_LED then
  begin
    isSendSuccessFailPop(pCmdSrvTermCANCELDESIGNFENCE_New(ABuf)^.Ret + 10, p^.Desc);
  end else
  begin
    isSendSuccessFailPop(pCmdSrvTermCANCELDESIGNFENCE_New(ABuf)^.Ret, p^.Desc);
  end;
end;



function TGateWayServerCom.SendDeleteAreaListForDev(Dev: TDevice;
  Area: array of byte): integer;
var
  Cmd: TCmdTermSrvCANCELDESIGNFENCE_New;
  ALen: word;
  info: PCmdinfo;
  buff: array of byte;
  strutLen: integer;
  flag: boolean;
begin

  Result := -1;
  if not isActive then exit;
  strutLen := SizeOf(TCmdTermSrvCANCELDESIGNFENCE_New);
  ALen := strutLen + length(Area);
  setlength(buff, ALen);
  Cmd.Size := Alen;
  Cmd.Flag := TCLIENT_CANCELDESIGNFENCE;
  Cmd.CmdID := GetMaxCmdID;

  cmd.devId := DevId_StrToBCD(Dev.Id);

  CopyMemory(@buff[0], @Cmd, strutLen);
  CopyMemory(@buff[strutLen], @Area[0], length(Area));
  flag := DirectSend(buff[0], ALen);
  if flag then
  begin
    result := Cmd.CmdID;
  end;
  info := ACmdManage.Add(Cmd.CmdId);

  info^.Id := Cmd.CmdId;
  info^.Dev := Dev;
  info^.State := CMD_SNDNODO;
  info^.Desc := '对' + Dev.Car.No + '删除电子围栏';
  info^.SendTime := now();
  info^.CancelTime := 0;
  info^.Replytime := 0;
  SetLength(info^.Content, Cmd.Size);
  Move(buff[0], info^.Content[0], Cmd.Size);
  info^.ContentSize := Cmd.Size;
end;

procedure TGateWayServerCom.DealGetAreamIDArea(ABuf: PByte);

var
  devId:String;
   areaID: integer;
  dev: TDevice;
  pCmd: PCmdSrvTermAreaAlarm_New;
  s: string;
begin
//  pCmd := PCmdSrvTermAreaAlarm_New(ABuf);
//  devId := pCmd^.DevID;
//  areaID := pCmd^.areaID;
//  dev := ADeviceManage.Find(devId);
//  if dev <> nil then
//  begin
//    dev.LastConnectTime := now;
//    if FAllAreaManage.Find(pcmd^.areaID) <> nil then
//    begin
//      if pCmd^.AreamType = 1 then
//      begin
//        s := '收到' + Dev.Car.No + '进' + FAllAreaManage.Find(pcmd^.areaID).AreaName + '区域报警';
//        SendMsg(devId, MSG_TYPE_AreaAlarm, s);
//      end
//      else
//      begin
//        s := '收到' + Dev.Car.No + '出' + FAllAreaManage.Find(pcmd^.areaID).AreaName + '区域报警';
//        SendMsg(devId, MSG_TYPE_AreaAlarm, s);
//      end;
//      PopMsg('区域报警', s);
//    end;
//  end;
//  SetIsOnline(devId,RET_OK);
end;

procedure TGateWayServerCom.SetONSendDelete(const Value: TONSendDelete);
begin
  FONSendDelete := Value;
end;

procedure TGateWayServerCom.SendDelete(Main_Id: integer;
  AssistantDev_IDstr: string; isdeleteAssistant: boolean);
begin
  if Assigned(FOnSendDelete) then
  begin
    FOnSendDelete(Main_Id, AssistantDev_IDstr, isdeleteAssistant);
  end;
end;


procedure TGateWayServerCom.SetOnReadDevPicTimesInfoRet(
  const Value: TReadDevPicTimesInfoRet);
begin
  FOnReadDevPicTimesInfoRet := Value;
end;

procedure TGateWayServerCom.SetOnDevUploadAttemperStateChg(
  const Value: TOnRcvDevUploadAttemperStateChgEvent);
begin
  FOnDevUploadAttemperStateChg := Value;
end;

procedure TGateWayServerCom.SetSendRegUser(const Value: TSendRegUser);
begin
  FSendRegUser := Value;
end;

procedure TGateWayServerCom.SetOnDriverCancelOrder(const Value: TOnDriverCancelOrder);
begin
  FOnDriverCancelOrder := Value;
end;

procedure TGateWayServerCom.Execute;
begin
  {try
    coinitialize(nil);
    while not Terminated do
    begin
      Sleep(20);
      DealReceiveData;
      DisposeReceiveData;
    end;
  finally
    CoUninitialize;
  end; }
  
end;

procedure TGateWayServerCom.InitHeader(var header:THead_V3;size:Word;cmdFlag:Byte;devId:string);
begin
  header.SPosFlag := SPOSFLAG;
  header.Size := size;
  header.PackType := PACKTYPE_2KE1WEI;
  header.Ver := PROTOCOLVER;
  header.BizType :=BIZTYPE;//06	监控客户端
  header.CmdFlag := cmdFlag;
  header.DevId := DevId_StrToBCD(devId);
  ZeroMemory(@header.CarNo[0],12);
  //header.CarNo := '123456789012';
//  header.CarNo := #0;
  header.CmdOrder := GetMaxCmdID;
end;

function TGateWayServerCom.LogOutFromGateway: Boolean;
var
  cmd: TCmdTermsrvLogoutData_V3;
begin
  InitHeader(cmd.Header,SizeOf(TCmdTermsrvLogoutData_V3),
    TERMSRV_LOGOUT,BLANKDEVID);
  cmd.XorSum:= GetXorSum(@cmd, cmd.Header.Size - 1);
  Result := DirectSend(cmd, cmd.Header.Size);
end;

function TGateWayServerCom.SendTYRet(devId: string; cmdSNo: LongWord; cmdId: Byte; ret: Byte): Boolean;
var
  cmd: TCmdTermSrvTYData_V3;
  buf: array of Byte;
  len: Integer;
begin
  len := SizeOf(TCmdTermSrvTYData_V3) + 1;
  InitHeader(cmd.header, len, TERMSRV_TYRET, devId);
  cmd.RespCmdNo := cmdSNo;
  cmd.RespCmdId := cmdId;
  cmd.Ret := ret;
  SetLength(buf, len);
  CopyMemory(@buf[0], @cmd, len - 1);
  buf[len - 1] := GetXorSum(@buf[0], len - 1);
  Result := DirectSend(buf[0], len);
end;

function TGateWayServerCom.GetDevOnLineStatus: Boolean;
var
  cmd: TCmdTermSrvGetOnLineStatData_V3;
  buf: array of Byte;
  len: Integer;
begin
  len := SizeOf(TCmdTermSrvGetOnLineStatData_V3) + 1;
  InitHeader(cmd.Header, len, TERMSRV_GETDEVONLINESTAT, BLANKDEVID);
  SetLength(buf, len);
  CopyMemory(@buf[0], @cmd, len - 1);
  buf[len - 1] := GetXorSum(@buf[0], len - 1);
  Result := DirectSend(buf[0], len);
end;

procedure TGateWayServerCom.DealDevAreaAlarm_V3(ABuf: PByte);
var
  pCmd: PCmdSrvTermAreaAlarm_V3;
  devId: TDEV_ID_BCD_ZDCL;
  areaId: Integer;
  count: Integer;
  area: TBaseArea;
  i: Integer;
  dev: TDevice;
  devIdLen: Integer;
  p: PByte;
begin
  try
    pCmd := PCmdSrvTermAreaAlarm_V3(ABuf);
    SendTYRet(BLANKDEVID, pCmd^.Header.CmdOrder, pCmd^.Header.CmdFlag, RET_OK);
    count := (pCmd^.Header.Size - SizeOf(TCmdSrvTermAreaAlarm_V3) - 1) div SizeOf(TDEV_ID_BCD_ZDCL);
    if count <= 0 then
      Exit;

  //  SetLength(devIdBcdArray, count);
  //  CopyMemory(@devIdBcdArray[0], PtrAdd(p, SizeOf(TCmdSrvTermAreaAlarm_V3)), count * SizeOf(TCmdSrvTermAreaAlarm_V3));
    area := FAllAreaManage.findByAreaNo(pCmd^.AreaNo);
    if area = nil then Exit;
    devIdLen := SizeOf(TDEV_ID_BCD_ZDCL);
    p := PtrAdd(ABuf, SizeOf(TCmdSrvTermAreaAlarm_V3));
    for i := 0 to count - 1 do
    begin
      try
        CopyMemory(@devId[0], p, devIdLen);
        dev := ADeviceManage.find(BCDToStr(@devId[0]));
        if dev <> nil then
        begin
          if Assigned(FOnAreaAlarmUpload) then
            FOnAreaAlarmUpload(dev, area, pCmd^.AlarmType);
        end;
        p := PtrAdd(p, devIdLen);
      except

      end;
    end;
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealDevAreaAlarm_V3异常' + E.Message);
    end;
  end;
end;

procedure TGateWayServerCom.SetOnAreaAlarmUpload(
  const Value: TOnAreaAlarmUpload);
begin
  FOnAreaAlarmUpload := Value;
end;

procedure TGateWayServerCom.InitTSPHeader(var header: TCmdTSPHead_V3;
  size, cmdFlag: Word; devId: string);
begin
  //header.SPosFlag := FLAGTSP;
  header.CmdFlag := ByteOderConvert_Word(cmdFlag);
  header.CmdProperty := ByteOderConvert_Word(CMDPROPERTY and size);
  header.DevId := DevId_StrToBCD(devId);
  header.CmdSNo := ByteOderConvert_Word(GetMaxCmdIdWord);
end;

//发送透传命令
function TGateWayServerCom.SendCmdTSP_V3(dev: TDevice;
  tspByteBuf: TByteDynArray): PCmdInfo;
var
  cmd: TCmdTSP_V3;
  packSize: Integer;//整个完整包的长度
  buf: array of Byte;
  info: PCmdInfo;
begin
  packSize := SizeOf(TCmdTSP_V3) + Length(tspByteBuf) + 1;
  SetLength(buf, packSize);
  InitHeader(cmd.Header, packSize, TRANSPARENT, dev.Id);
  CopyMemory(@buf[0], @cmd, SizeOf(TCmdTSP_V3));
  CopyMemory(@buf[SizeOf(TCmdTSP_V3)], @tspByteBuf[0], Length(tspByteBuf));
  buf[packSize - 1] := GetXorSum(@buf[0], packSize - 1);
  DirectSend(buf[0], packSize);

  info := ACmdManage.Add(cmd.Header.CmdOrder);
  info^.State := CMD_SNDNODO;
  info^.Dev := dev;
  info^.DevId := dev.Id;
  info^.SendTime := now();
  info^.CancelTime := 0;
  info^.Replytime := 0;
  SetLength(info^.Content, cmd.Header.Size);
  Move(Buf[0], info^.Content[0], cmd.Header.Size);
  info^.ContentSize := cmd.Header.Size;
//  SaveCMD.CmdList.AddData(Cmd.header.Cmdorder, info);
  Result := info;
end;

procedure TGateWayServerCom.DealTransparentData_V3(ABuf: PByte);
var
  p: PCmdTSP_V3;
  tspDataSize: Integer;
  tspBuf: TByteDynArray;
  info: PCmdInfo;
begin
  p := PCmdTSP_V3(ABuf);
  info := ACmdManage.Find(p^.Header.CmdOrder);
  if info <> nil then
  begin
    info^.State := CMD_DONE;
    info^.Replytime := Now;
  end;
  tspDataSize := p^.Header.Size - 1 - SizeOf(TCmdTSP_V3);
  tspBuf := EscapeByteBuf(PtrAdd(ABuf, SizeOf(TCmdTSP_V3)), tspDataSize, 0);//还原转义字节数组;
  DisposeTransparentData_V3(@tspBuf[0], p^.Header.CmdOrder);
end;

procedure TGateWayServerCom.DisposeTransparentData_V3(ABuf: PByte; cmdNo: Integer);
var
  cmdFlag: Word;
begin
  try
    cmdFlag := ByteOderConvert_Word(PWord(PtrAdd(ABuf, 1))^);
    case cmdFlag of
      SRVTREM_READDEVPARAM_V3: DealReadDevParamTSP_V3(PtrAdd(ABuf, 1), cmdNo);           //读取参数应答
  //    2: DealGpsDataTSP_V3(PtrAdd(ABuf, 1));                                      //定位数据5字节的版本 测试用
      SRVTERM_PGPSDATA_V3: DealGpsDataTSP_V3(PtrAdd(ABuf, 1), cmdNo);                    //定位数据
      SRVTERM_FINDPOSTION_V3: DealFindPostion_V3(PtrAdd(ABuf, 1), cmdNo);
      SRVTERM_EVENTUPLOAD_V3: DealEventUploadTSP_V3(PtrAdd(ABuf, 1), cmdNo);             //事件报告
      SRVTERM_QUESTIONANSWER_V3: DealQuestionAnswer_V3(PtrAdd(ABuf, 1), cmdNo);          //提问回答
      SRVTERM_INFOMENU_V3: DealInfoMenu_V3(PtrAdd(ABuf, 1), cmdNo);                      //信息点播
      SRVTERM_DEVCONTROL_V3: DealDevControl_V3(PtrAdd(ABuf, 1), cmdNo);                  //车辆控制
      SRVTERM_RUNRECDATAUPLOAD_V3: DealRunRecDataUpload_V3(PtrAdd(ABuf, 1), cmdNo);      //行驶记录仪数据上传
      SRVTERM_ERUNDATA_V3: DealERunDataUpload_V3(PtrAdd(ABuf, 1), cmdNo);                //电子运单上传
      SRVTERM_DRIVERINFO_V3: DealDriverInfoUpload_V3(PtrAdd(ABuf, 1), cmdNo);            //驾驶员身份信息采集上报
      SRVTREM_MEDIAEVENTUPLOAD_V3: DealMediaEventUpload_V3(PtrAdd(ABuf, 1), cmdNo);       //多媒体事件信息上传
      SRVTERM_MEDIADATAUPLOAD_V3: DealMediaDataUpload_V3(PtrAdd(ABuf, 1), cmdNo);        //多媒体数据检索应答
      SRVTERM_TSPDATAUPLOAD_V3: DealTSPDataUpload_V3(PtrAdd(ABuf, 1), cmdNo);            //数据上行透传
      SRVTERM_COMPRESSEDDATA_V3: DealCompressedDataUpload_V3(PtrAdd(ABuf, 1), cmdNo);    //数据压缩上传
      SRVTERM_DRIVERLOGIN_V3: DealDriverLogin_V3(PtrAdd(ABuf, 1), cmdNo);                //司机签到
      SRVTERM_DRIVERLOGOUT_V3: DealDriverLogout_V3(PtrAdd(ABuf, 1), cmdNo);              //司机签退
      SRVTERM_TRANSPORTSTART_V3: DealTransportStart_V3(PtrAdd(ABuf, 1), cmdNo);          //运输开始
      SRVTERM_TRANSPORTEND_V3: DealTransportEnd_V3(PtrAdd(ABuf, 1), cmdNo);              //运输结束
    end;
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DisposeTransparentData_V3异常' + E.Message);
    end;  
  end;
end;

procedure TGateWayServerCom.DealReadDevParamTSP_V3(ABuf: PByte; cmdNo: Integer);
var
  pCmd: PCmdSrvTermTSPReadDevParam_V3;
  cmdId, devId: integer;
  devIdStr:String;
  p: PCmdInfo;
  dev: Tdevice;
  paramID: integer;
  len: integer;
  paramStr: string; //参数内容
  ParamByte: array of Byte;
  ParamInt: LongWord;
  ParamLongWord: longWord;
  ParamIP: string;
  ParamBool: Byte;
  ParamIDS: string;
  ParamDateTime: TDateTime;
  temp: string;
  i: LongWord;
  Year, Month, Day, Hour: string;
  pB: PByte;
  isMultiPack: Boolean;//是否分包；
  paramCount: Integer;
  j: Integer;
  wValue: Word;
  lValue: LongWord;
begin
  if ACmdManage.Find(cmdNo) = nil then Exit;

  try
    pCmd := PCmdSrvTermTSPReadDevParam_V3(ABuf);
  //  cmdId := PCmdSrvTermTSPReadDevParam_V3(ABuf)^.TSPHeader.CmdSNo;
  //    devId := BCDToInt(@PCmdSrvTermReadDevParam_V3(ABuf)^.DevID[0]);
    devIdStr := BcdToStr(@(pCmd^.TSPHeader.DevID[0]));
    dev := ADeviceManage.Find(devIdStr);
    if dev = nil then exit;
    Dev.LastConnectTime := now;
  //  p := ACmdManage.Find(cmdId);
  //  if p = nil then exit;
  //  p^.State := CMD_DONE;
  //  p^.Replytime := now();

    if ReadParamfrm = nil then exit;
    if not ReadParamFrm.Showing then Exit;
    ReadParamFrm.SetCurrentDev(Dev);
    ReadParamfrm.Show;
    ReadParamFrm.Label90.Caption := '读取参数成功返回';
    ReadParamFrm.BitBtnSet.Enabled := True;
    ReadParamFrm.Timer2.Enabled := False;
    {with ReadParamFrm do
    begin
      RzCheckBoxSelectAll.Checked := True;
      RzCheckBoxSelectAll.Enabled := False;
      TabSheet1.Enabled := False;
      TabSheet2.Enabled := False;
      TabSheet3.Enabled := False;
      TabSheet4.Enabled := False;
      TabSheet5.Enabled := False;
      TabSheet6.TabVisible := False;
      //TabSheet7.Enabled := False;
      TabSheet8.Enabled := False;
      TabSheet9.Enabled := False;
      TabSheet10.Enabled := False;
      TabSheet11.Enabled := False;
      TabSheet12.Enabled := False;
    end; }
  
    if ((ByteOderConvert_Word(pCmd^.TSPHeader.CmdProperty) shr 13) and $01) = $01 then
      isMultiPack := True
    else
      isMultiPack := False;

    if not isMultiPack then
    begin
      pB := PtrAdd(ABuf, SizeOf(TCmdSrvTermTSPReadDevParam_V3));
      paramCount := pCmd^.ParamPackCnt;
    end
    else
    begin
      pB := PtrAdd(ABuf, TSPHEADERLEN + 2 + 2);
      paramCount := pB^;
      inc(pB);
    end;
    if paramCount > 0 then
    begin
      ReadParamFrm.ProgressBar1.Max := paramCount;
      ReadParamFrm.ProgressBar1.Visible := True;
    end;  
    for j := 0 to paramCount - 1 do
    begin
      paramID := ByteOderConvert_LongWord(PLongWord(pB)^);
      Inc(pB, 4);

      //参数内容暂存　paramContent
      len := pB^;
      Inc(pB);

  //    if (Len <= 0) or (Len > 201) then exit;

      SetLength(paramStr, len);
      SetLength(ParamByte, Len);
      CopyMemory(@paramStr[1], pB, len);
      CopyMemory(@paramByte[0], pB, len);
      Inc(pB, len);

    //  ReadParamfrm.BitBtnSaveReadedParam.Visible := True;

      if (paramID = $0091) and (len = 5) then
      begin
        Year := IntToHex(paramByte[0],2) + IntToHex(paramByte[1],2);
        Month := IntToHex(paramByte[2],2);
        Day := IntToHex(paramByte[3],2);
        Hour := IntToHex(paramByte[4],2);
        {temp := IntToHex(paramByte[0],2) + IntToHex(paramByte[1],2)
                + '-' + IntToHex(paramByte[2],2) + '-' + IntToHex(paramByte[3],2)
                + ' ' + IntToHex(paramByte[4],2) + ':00:00';
        ParamDateTime := StrToDateTime(FormatDateTime('YYYY-MM-DD hh:nn:ss', StrToDateTime(temp)));  }
      end;

      ParamInt := 0;
      if (Len <= 4) and (len > 0) then
      begin
        ParamInt := 0;
        for i := len-1 downto 0 do
        begin
          ParamInt := ParamInt shl 8;
          ParamInt := ParamInt + ParamByte[i];
        end;
        if Len > 2 then
          ParamInt := ByteOderConvert_LongWord(ParamInt)
        else if Len = 2 then
          ParamInt := ByteOderConvert_Word(ParamInt);
      end;
      if Len = 4 then  //IP地址处理
      begin
        ParamIP := IntToStr(ParamByte[0]) + '.' + IntToStr(ParamByte[1]) + '.' +
          IntToStr(ParamByte[2]) + '.' + IntToStr(ParamByte[3]);
      end;

      if Len = 1 then
        ParamBool := Parambyte[0];
      i := 0;
      if Len = 5 then //for Dev Id
      begin
        ParamIDS := InttoHex(ParamByte[0],2);
        ParamIDS := ParamIDS + InttoHex(ParamByte[1],2);
        ParamIDS := ParamIDS + InttoHex(ParamByte[2],2);
        ParamIDS := ParamIDS + InttoHex(ParamByte[3],2);
        ParamIDS := ParamIDS + InttoHex(ParamByte[4],2);
        //i := i + ParamByte[1];
        //i := i shl 8;
        //i := i + ParamByte[2];
        //i := i shl 8;
        //i := i + ParamByte[3];
        //i := i shl 8;
        //i := i + ParamByte[4];
        //ParamIDS := ParamIDS + formatFloat('0000000000',i);
      end;
      ParamLongWord := ParamInt;

      case paramID of
        $0001: ReadParamFrm.Edit12.Text := IntToStr(ParamInt);//12: Result := $0001;
        $0002: ReadParamFrm.Edit34.Text := IntToStr(ParamInt);//34: Result := $0002;
        $0003: ReadParamFrm.Edit13.Text := IntToStr(ParamInt);//13: Result := $0003;
        $0004: ReadParamFrm.Edit85.Text := IntToStr(ParamInt);//85: Result := $0004;
        $0005: ReadParamFrm.Edit86.Text := IntToStr(ParamInt);//86: Result := $0005;
        $0006: ReadParamFrm.Edit59.Text := IntToStr(ParamInt);//59: Result := $0006;
        $0007: ReadParamFrm.Edit60.Text := IntToStr(ParamInt);// 60: Result := $0007;
        $0010: ReadParamFrm.Edit6.Text := paramStr;//6: Result := $0010;
        $0011: ReadParamFrm.Edit61.Text := paramStr;// 61: Result := $0011;
        $0012: ReadParamFrm.Edit62.Text := paramStr;//62: Result := $0012;
        $0013: ReadParamFrm.Edit7.Text := paramStr;//7: Result := $0013;
        $0014: ReadParamFrm.Edit63.Text := paramStr;//63: Result := $0014;
        $0015: ReadParamFrm.Edit11.Text := paramStr; //11: Result := $0015;
        $0016: ReadParamFrm.Edit64.Text := paramStr; //64: Result := $0016;
        $0017: ReadParamFrm.Edit9.Text := paramStr;   //9: Result := $0017;
        $0018: ReadParamFrm.Edit65.Text := IntToStr(ParamInt);  //65: Result := $0018;
        $0019: ReadParamFrm.Edit87.Text := IntToStr(ParamInt);
        $0020: ReadParamFrm.Edit14.ItemIndex := ParamInt;    // 14: Result := $0020;
        $0021: ReadParamFrm.Edit15.ItemIndex := ParamInt;    // 15: Result := $0021;
        $0022: ReadParamFrm.Edit351.Text := IntToStr(ParamInt);  //351: Result := $0022;
    //    $0023: ReadParamFrm.Edit353.Text := IntToStr(ParamInt);
    //    $0024: ReadParamFrm.Edit355.Text := IntToStr(ParamInt);
  //      $0025: ReadParamFrm.Edit357.Text := IntToStr(ParamInt); // 357: Result := $0025;
  //      $0026: ReadParamFrm.Edit359.Text := IntToStr(ParamInt); // 359: Result := $0026;
        $0027: ReadParamFrm.Edit361.Text := IntToStr(ParamInt); //361: Result := $0027;
        $0028: ReadParamFrm.Edit362.Text := IntToStr(ParamInt); //362: Result := $0028;
        $0029: ReadParamFrm.Edit90.Text := IntToStr(ParamInt); //352: Result := $0029;
        //$002A: ReadParamFrm.Edit354.Text := IntToStr(ParamInt);
        //$002B: ReadParamFrm.Edit356.Text := IntToStr(ParamInt);
        $002C: ReadParamFrm.Edit91.Text := IntToStr(ParamInt); //358: Result := $002C;
        $002D: ReadParamFrm.Edit352.Text := IntToStr(ParamInt); //360: Result := $002D;
        $002E: ReadParamFrm.Edit364.Text := IntToStr(ParamInt); //364: Result := $002E;
        $002F: ReadParamFrm.Edit365.Text := IntToStr(ParamInt); //365: Result := $002F;
        $0030: ReadParamFrm.Edit363.Text := IntToStr(ParamInt); //66: Result := $0040;
        $0031: ReadParamFrm.Edit98.Text := IntToStr(ParamInt);
        $0040: ReadParamFrm.Edit66.Text := paramStr;          //66: Result := $0040;
        $0041: ReadParamFrm.Edit3.Text := paramStr;           //3: Result :=  $0041;
        $0042: ReadParamFrm.Edit67.Text := paramStr;         //67: Result := $0042;
        $0043: ReadParamFrm.Edit4.Text := paramStr;          //4: Result :=  $0043;
        $0044: ReadParamFrm.Edit5.Text := paramStr;          //5: Result :=  $0044;
        $0045: ReadParamFrm.Edit57.ItemIndex := ParamInt;    //57: Result := $0045;
        $0046: ReadParamFrm.Edit55.Text := IntToStr(ParamInt); //55: Result := $0046;
        $0047: ReadParamFrm.Edit68.Text := IntToStr(ParamInt);  //68: Result := $0047;
        //$0048: ReadParamFrm.Edit36.Text := IntToStr(ParamInt);
        $0048: ReadParamFrm.Edit2.Text := paramStr;         //2: Result :=  $0048;
        $0049: ReadParamFrm.Edit92.Text := paramStr;
        $0050: //'功能屏蔽标志';
          begin
            i:=0;
            while i<32 do //0-32
            begin
              ReadParamFrm.cxCheckListBox56.Items[i].Checked := (((ParamLongWord shr i) and $01) = $01);//ParamByte[0 + i div 8] and (1 shl (i mod 8)) = (1 shl (i mod 8));
              inc(i);
            end;
          end;
        $0051: //'功能屏蔽标志';
          begin
            i:=0;
            while i<32 do //0-32
            begin
              ReadParamFrm.cxCheckListBox1.Items[i].Checked := (((ParamLongWord shr i) and $01) = $01);//ParamByte[0 + i div 8] and (1 shl (i mod 8)) = (1 shl (i mod 8));
              inc(i);
            end;
          end;
        $0052: //'功能屏蔽标志';
          begin
            i:=0;
            while i<32 do //0-32
            begin
              ReadParamFrm.cxCheckListBox2.Items[i].Checked := (((ParamLongWord shr i) and $01) = $01);//ParamByte[0 + i div 8] and (1 shl (i mod 8)) = (1 shl (i mod 8));
              inc(i);
            end;
          end;
        $0053: //'功能屏蔽标志';
          begin
            i:=0;
            while i<32 do //0-32
            begin
              ReadParamFrm.cxCheckListBox3.Items[i].Checked := (((ParamLongWord shr i) and $01) = $01);//ParamByte[0 + i div 8] and (1 shl (i mod 8)) = (1 shl (i mod 8));
              inc(i);
            end;
          end;
        $0054: //'功能屏蔽标志';
          begin
            i:=0;
            while i<32 do //0-32
            begin
              ReadParamFrm.cxCheckListBox4.Items[i].Checked := (((ParamLongWord shr i) and $01) = $01);//ParamByte[0 + i div 8] and (1 shl (i mod 8)) = (1 shl (i mod 8));
              inc(i);
            end;
          end;

        $0055: ReadParamFrm.Edit16.Text := IntToStr(ParamInt);
        $0056: ReadParamFrm.Edit47.Text := IntToStr(ParamInt);
        $0057: ReadParamFrm.Edit422.Text := IntToStr(ParamInt);
        $0058: ReadParamFrm.Edit424.Text := IntToStr(ParamInt);
        $0059: ReadParamFrm.Edit421.Text := IntToStr(ParamInt);
        $005A: ReadParamFrm.Edit423.Text := IntToStr(ParamInt);

        $0070: ReadParamFrm.Edit69.Text := IntToStr(ParamInt);
        $0071: ReadParamFrm.Edit70.Text := IntToStr(ParamInt);
        $0072: ReadParamFrm.Edit71.Text := IntToStr(ParamInt);
        $0073: ReadParamFrm.Edit72.Text := IntToStr(ParamInt);
        $0074: ReadParamFrm.Edit73.Text := IntToStr(ParamInt);

        $0080: ReadParamFrm.Edit74.Text := IntToStr(ParamInt);
        $0081: ReadParamFrm.Edit75.Text := IntToStr(ParamInt);
        $0082: ReadParamFrm.Edit76.Text := IntToStr(ParamInt);
        $0083: ReadParamFrm.Edit88.Text := paramStr;
        $0084:
          begin
            if (ParamInt <= 4) and (ParamInt >= 1) then
              ReadParamFrm.Edit89.ItemIndex := ParamInt - 1
            else if ParamInt > 4 then
              ReadParamFrm.Edit89.ItemIndex := 4
            else
              ReadParamFrm.Edit89.ItemIndex := -1;
          end;

        $F001: ReadParamFrm.Edit93.Text := BCDToStr1(@ParamByte[0], 6);
        $F002: ReadParamFrm.Edit94.Text := paramStr;
        $F003: ReadParamFrm.Edit97.Text := BCDToStr1(@ParamByte[0], 7);
        $F004:
          begin
            CopyMemory(@lValue, @ParamByte[0], 4);
            lValue := ByteOderConvert_LongWord(lValue);
            ReadParamFrm.Edit37.Text := IntToStr(lValue);
            CopyMemory(@lValue, @ParamByte[4], 4);
            lValue := ByteOderConvert_LongWord(lValue);
            ReadParamFrm.Edit10.Text := IntToStr(lValue);
          end;
        $F005:
          begin
            CopyMemory(@wValue, @ParamByte[0], 2);
            wValue := ByteOderConvert_Word(wValue);
            ReadParamFrm.Edit27.Text := IntToStr(wValue);
            CopyMemory(@wValue, @ParamByte[2], 2);
            wValue := ByteOderConvert_Word(wValue);
            ReadParamFrm.Edit35.Text := IntToStr(wValue);
          end;
        $F008: ReadParamFrm.Edit101.Text := IntToStr(ParamInt);          
      else
        begin
        //  TDebug.GetInstance.SendDebug('读设备参数的返回数据有错误', '参数序号：$' + IntToHex(paramID, 4));
  //        p^.State := CMD_DOERROR;
  //        p^.Replytime := now();
  //        exit;
        end;
      end;
      ReadParamFrm.ProgressBar1.StepBy(1);
    end;
    ReadParamFrm.ProgressBar1.Visible := False;
    ReadParamFrm.Label90.Visible := False;
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('读取参数解析异常' + E.Message);
    end;  
  end;
end;

procedure TGateWayServerCom.InitTSPHeaderHRB(var header: TCmdTSPTHeadHRB_V3;
  size, cmdFlag: Word; devId: string);
begin
  header.SPosFlag := $2424;
  header.CmdFlag := cmdFlag;
  header.CmdProperty := size;
  header.DevId := DevId_StrToBCDHRB('0100' + devId);
  header.CmdSNo := GetMaxCmdID;
end;

function TGateWayServerCom.SendCmdTSPHRB_V3(devId: string;
  tspByteBuf: TByteDynArray): PCmdInfo;
var
  cmd: TCmdTSPHRB_V3;
  packSize: Integer;//整个完整包的长度
  buf: array of Byte;
  info: PCmdInfo;
begin
  packSize := SizeOf(TCmdTSPHRB_V3) + Length(tspByteBuf) + 1;
  SetLength(buf, packSize);
  InitHeaderHRB(cmd.Header, packSize, TRANSPARENT, '0100' + devId);
  CopyMemory(@buf[0], @cmd, SizeOf(TCmdTSPHRB_V3));
  CopyMemory(@buf[SizeOf(TCmdTSPHRB_V3)], @tspByteBuf[0], Length(tspByteBuf));
  buf[packSize - 1] := GetXorSum(@buf[0], packSize - 1);
  DirectSend(buf[0], packSize);

  info := ACmdManage.Add(cmd.Header.CmdOrder);
  info^.State := CMD_SNDNODO;
  info^.DevId := devId;
  info^.SendTime := now();
  info^.CancelTime := 0;
  info^.Replytime := 0;
  SetLength(info^.Content, cmd.Header.Size);
  Move(Buf[0], info^.Content[0], cmd.Header.Size);
  info^.ContentSize := cmd.Header.Size;
//  SaveCMD.CmdList.AddData(Cmd.header.Cmdorder, info);
  Result := info;
end;

procedure TGateWayServerCom.InitHeaderHRB(var header: THeadHRB_V3; size: Word;
  cmdFlag: Byte; devId: string);
begin
  header.SPosFlag := SPOSFLAG;
  header.Size := size;
  header.PackType := PACKTYPE_2KE1WEI;
  header.Ver := PROTOCOLVER;
  header.BizType :=BIZTYPE;//06	监控客户端
  header.CmdFlag := cmdFlag;
  header.DevId := DevId_StrToBCDHRB(devId);
  ZeroMemory(@header.CarNo[0],12);
  //header.CarNo := '123456789012';
//  header.CarNo := #0;
  header.CmdOrder := GetMaxCmdID;
end;

function TGateWayServerCom.GetMaxCmdIdWord: Word;
begin
  if FMaxCmdID_Word >=65535 then
    FMaxCmdID_Word :=0;
  Inc(FMaxCmdID_Word);
  Result := FMaxCmdID_Word;
end;

procedure TGateWayServerCom.DealGpsDataTSP_V3(ABuf: PByte; cmdNo: Integer);
var
  pCmd: PCmdSrvTermGpsDataTSP_V3;
//  pCmd: PCmdSrvTermGpsDataTSPHRB_V3;
  d: TGpsData_V3;
  attachInfo: TByteDynArray;
  dataLen: Integer;//消息体长度
  p: PByte;
begin
  try
    pCmd := PCmdSrvTermGpsDataTSP_V3(ABuf);
    if TransCmdGpsDataTSP(PCmdSrvTermGpsDataTSP_V3(ABuf)^, d) then
    begin
      dataLen := ByteOderConvert_Word(PCmdSrvTermGpsDataTSP_V3(ABuf)^.Header.CmdProperty);
      if dataLen = GPSDATABODYLEN then//消息体长度刚好等于Gps数据体长度
        ADeviceManage.ReceiveGpsData_V3(@d, False)
      else if dataLen - 2 > GPSDATABODYLEN then//消息体长度大于Gps数据体长度，则有附加信息，且附加信息至少有3个字节的长度
      begin
        SetLength(attachInfo, dataLen - GPSDATABODYLEN);
        p := PtrAdd(ABuf, SizeOf(TCmdSrvTermGpsDataTSP_V3));
        CopyMemory(@attachInfo[0], p, dataLen - GPSDATABODYLEN);
        ADeviceManage.ReceiveGpsData_V3(@d, False, False, attachInfo);
      end;
    end;
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('处理车机透传定位数据(DealGpsDataTSP_V3)异常:' + E.Message);
    end;  
  end;
end;

procedure TGateWayServerCom.DealEventUploadTSP_V3(ABuf: PByte; cmdNo: Integer);
var
  pCmd: PCmdSrvTermEventUploadTSP_V3;
  devId: string;
  dev: TDevice;
  info: string;
begin
  try
    devId :=  BCDTostr(@(PCmdSrvTermEventUploadTSP_V3(ABuf)^.header.DevID[0]));
    dev := ADeviceManage.Find(devId);
    if dev = nil then Exit;
    info := dev.FindEventInfoByNo( PCmdSrvTermEventUploadTSP_V3(ABuf)^.EventId);
    PopMsg('事件报告', dev.Car.No + '报告事件：' + info);
    if Assigned(FEventListUpLoad) then FEventListUpLoad(dev, info, Now);
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealEventUploadTSP_V3异常' + E.Message);
    end;
  end;
end;

procedure TGateWayServerCom.DealQuestionAnswer_V3(ABuf: PByte; cmdNo: Integer);
var
  pCmd: PCmdSrvTermQuestionAnswerTSP_V3;
  cmdId: Integer;
  p: PCmdInfo;
  devId: string;
  dev: TDevice;
  answerId: Integer;
  info: string;
begin
  if bReportAnswer then
  begin
    try
      pCmd := PCmdSrvTermQuestionAnswerTSP_V3(ABuf);
      cmdId := cmdNo;
      p := ACmdManage.Find(cmdId);
      if p = nil then Exit;

      devId := BCDToStr(@(pCmd^.Header.DevId[0]));
      dev := ADeviceManage.find(devId);
      if dev = nil then Exit;
      answerId := pCmd^.AnswerId;
      if (answerId >= 1) and (answerId <= p^.AnswerList.Count) then
        info := PAnswerInfo(p^.AnswerList.Datas[AnswerID - 1])^.info
      else
        info := '回答错误';
      PopMsg('提问应答','问题：' + p^.QuestionInfo+#10#10 + dev.Car.No + '的' +
                        '答案：' + {PAnswerInfo(p.AnswerList.Datas[PCmdSrvtermReportAnswer_V3(ABuf)^.AnswerID]).}info);

      uGloabVar.SystemLog.AddLog('问题：' + p^.QuestionInfo+#10#10 + dev.Car.No + '的' +
                               '答案：' + {PAnswerInfo(p.AnswerList.Datas[PCmdSrvtermReportAnswer_V3(ABuf)^.AnswerID]).}info);

      try
        Bs.ModifyAMessage_Answer2(p^.MsgId, 2, FormatDateTime('yyyy-mm-nn hh:nn:ss', now),
                                  AnswerID, info);
      except
      end;
      if Assigned(FAnswerListUpLoad) then
        FAnswerListUpLoad(dev, p^.QuestionInfo, info, Now);
    except
      on E: Exception do
      begin
        uGloabVar.SystemLog.AddLog('DealQuestionAnswer_V3异常' + E.Message);
      end;
    end;
  end;
end;

procedure TGateWayServerCom.DealInfoMenu_V3(ABuf: PByte; cmdNo: Integer);
var
  pcmd: PCmdSrvTermInfoMenuTSP_V3;
  devId: string;
  dev: TDevice;
  infoName: string;
  msg: string;
  infoType: TInfoType;
begin
  try
    pcmd := PCmdSrvTermInfoMenuTSP_V3(ABuf);
    devId := BCDToStr(@(pcmd.Header.DevId[0]));
    dev := ADeviceManage.find(devId);
    if dev = nil then Exit;
    infoType := FInfoTypeManage.FindInfoTypeByTypeId(pcmd^.InfoType);
    if infoType <> nil then
    begin
      infoName := infoType.InfoTypeName;
      if pcmd^.SelOrQuit = 1 then
      begin//点播
        if (infoType.AddDevId(dev.Id)) then
        begin
          Bs.AddDevInfoType(infoType.InfoTypeId, dev.Id);
          dev.AddInfoTypeId(infoType.InfoTypeId);
        end;
      end
      else
      begin//取消
        if infoType.DelDevId(dev.Id) then
        begin
          Bs.DelDevInfoType(infoType.InfoTypeId, dev.Id);
          dev.DeleteInfoTypeId(infoType.InfoTypeId);
        end;
      end;
    end
    else
      infoName := '【未知类型(' + IntToStr(pcmd^.InfoType) + ')】';
    msg := '车辆[' + dev.Car.No + ']';
    if pcmd^.SelOrQuit = 1 then
      msg := msg + '点播了'
    else
      msg := msg + '取消了';
    msg := msg + #13#10 + infoName + '信息';

    PopMsg('信息点播/取消', msg);
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealInfoMenu_V3异常' + E.Message);
    end;
  end;
  //进一步处理
  {。。。}
end;

procedure TGateWayServerCom.DealDevControl_V3(ABuf: PByte; cmdNo: Integer);
var
  pcmd: PCmdSrvTermDevControlTSP_V3;
  p: PCmdInfo;
  d: TGpsData_V3;
begin
  try
    pcmd := PCmdSrvTermDevControlTSP_V3(ABuf);
    p := ACmdManage.Find(cmdNo);
    if p = nil then Exit;

    if TransCmdGpsDataTSP(PCmdSrvTermDevControlTSP_V3(ABuf)^, d) then
    begin
      ADeviceManage.ReceiveGpsData_V3(@d, False);
    end;

    p^.State := CMD_DONE;
    p^.Replytime := Now;

   //根据状态位判断控制是否成
    if ((p^.CarControlContent =0) and (d.State and $00001000 = $00000000)) or        //0解锁     //第12位
       ((p^.CarControlContent =1) and (d.State and $00001000 = $00001000)) then      // 1加锁
    begin
        PopMsg('车辆控制应答', p^.Desc + ' 成功');        //解锁
    end
    else
    begin
      PopMsg('车辆控制应答', p^.Desc + '不成功!');
    end;
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealDevControl_V3异常' + E.Message);
    end;
  end;
end;

procedure TGateWayServerCom.DealDriverInfoUpload_V3(ABuf: PByte; cmdNo: Integer);
var
  pcmd: PCmdSrvTermDriverInfoTSP_V3;
  p: PByte;
  len: Integer;
  driverInfo: TDriverInfoUpload;
  str: string;
  devId: string;
  dev: TDevice;
begin
  try
    pcmd := PCmdSrvTermDriverInfoTSP_V3(ABuf);
    devId := BCDToStr(@(pcmd^.Header.DevId[0]));
    dev := ADeviceManage.find(devId);
    if dev = nil then Exit;
    driverInfo.DevId := devId;
    driverInfo.CarNo := dev.Car.No;
    len := pcmd^.DriverNameLen;
    p :=  PtrAdd(ABuf, SizeOf(TCmdSrvTermDriverInfoTSP_V3));
    SetLength(str, len);
    CopyMemory(@str[1],p, len);
    driverInfo.DriverName := Trim(str);
    p := PtrAdd(p, len);
    SetLength(str, 20);
    CopyMemory(@str[1], p, 20);
    driverInfo.DriverIDNo := Trim(str);
    p := PtrAdd(p, 20);
    SetLength(str, 40);
    CopyMemory(@str[1], p, 40);
    driverInfo.DriverServiceNo := Trim(str);
    p := PtrAdd(p, 40);
    len := PByte(p)^;
    p := PtrAdd(p, 1);
    CopyMemory(@str[1], p, len);
    driverInfo.AgencyName := Trim(str);

    dev.Login_DriverName := driverInfo.DriverName;
    dev.Login_Driver := driverInfo.DriverIDNo;
    if Assigned(FOnDriverInfoUpload) then
      FOnDriverInfoUpload(driverInfo);
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealDriverInfoUpload_V3异常' + E.Message);
    end;
  end;
end;

procedure TGateWayServerCom.DealERunDataUpload_V3(ABuf: PByte; cmdNo: Integer);
var
  pcmd: PCmdSrvTermERunDataTSP_V3;
  p: PByte;
  len: Integer;
  str: string;
  eRunData: TERunDataUpload;
  dev: TDevice;
  devId: string;
begin
  try
    pcmd := PCmdSrvTermERunDataTSP_V3(ABuf);
    devId := BCDToStr(@(pcmd^.Header.DevId[0]));
    dev := ADeviceManage.find(devId);
    if dev = nil then Exit;
    eRunData.devId := devId;
    eRunData.carNo := dev.Car.No;
    len := ByteOderConvert_LongWord(pcmd^.ERunDataLen);
    SetLength(str, len);
    p := PtrAdd(ABuf, SizeOf(TCmdSrvTermERunDataTSP_V3));
    CopyMemory(@str[1], p, len);
    eRunData.ERunData := str;
    if Assigned(FOnERunDataUpload) then
      FOnERunDataUpload(eRunData);
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealERunDataUpload_V3异常' + E.Message);
    end;
  end;
end;

procedure TGateWayServerCom.SetOnERunDataUpload(
  const Value: TOnERunDataUpload);
begin
  FOnERunDataUpload := Value;
end;

procedure TGateWayServerCom.SetOnDriverInfoUpload(
  const Value: TOnDriverInfoUpload);
begin
  FOnDriverInfoUpload := Value;
end;

function TGateWayServerCom.SendRecordTSP_V3(dev: TDevice; recFlag: Byte;
  recTime: Word; recSaveFlag, recSRate: Byte): Boolean;
var
  info: PCmdinfo;
  len: Word;
  acmd: TCmdTermSrvRecordTSP_V3;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
begin
  Result := false;
  if not isActive then exit;
  len := SizeOf(TCmdTermSrvRecordTSP_V3);
  InitTSPHeader(acmd.Header, len - TSPHEADERLEN, TERMSRV_RECORD_V3, dev.Id);
  acmd.RecFlag := recFlag;
  acmd.RecTime := ByteOderConvert_Word(recTime);
  acmd.RecSaveFlag := recSaveFlag;
  acmd.RecSRate := recSRate;
  tspPackSize := len + 3;
  SetLength(tspBuf, tspPackSize);
  offSet := 0;
  tspBuf[0] := FLAGTSP;
  Inc(offSet);
  CopyMemory(@tspBuf[offSet], @acmd, len);
  Inc(offSet, len);
  tspBuf[offSet] := GetXorSum(@tspBuf[1], len);
  Inc(offSet);
  tspBuf[offSet] := FLAGTSP;
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(dev, escapByteBuf);
  if RecFlag =0 then
    info^.Desc := Dev.Car.No + '停止录音'
  else if RecFlag =1 then
    info^.Desc := Dev.Car.No + '开始录音';
end;

function TGateWayServerCom.SendTSPData_V3(dev: TDevice; dataType: Byte;
  tspData: string): Boolean;
var
  info: PCmdinfo;
  len: Word;
  acmd: TCmdTermSrvTSPDataTSP_V3;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
  data: String;
  dataLen: Word;
  packDataLen: Word;
begin
  Result := false;
  if not isActive then exit;
  data := tspData;
  packDataLen := Length(tspData);
  dataLen := packDataLen;
  len := SizeOf(TCmdTermSrvTSPDataTSP_V3) + dataLen;
  InitTSPHeader(acmd.Header, len - TSPHEADERLEN, TERMSRV_TSPDATA_V3, dev.Id);
  acmd.TSPDataType := dataType;
//  acmd.TSPDataLen := ByteOderConvert_LongWord(dataLen);
//  acmd.PackLen := ByteOderConvert_Word(packDataLen);
  tspPackSize := len + 3;
  SetLength(tspBuf, tspPackSize);
  offSet := 0;
  tspBuf[0] := FLAGTSP;
  Inc(offSet);
  CopyMemory(@tspBuf[offSet], @acmd, len - dataLen);
  Inc(offSet, SizeOf(TCmdTermSrvTSPDataTSP_V3));
  CopyMemory(@tspBuf[offSet], @data[1], dataLen);
  Inc(offSet, dataLen);
  tspBuf[offSet] := GetXorSum(@tspBuf[1], len);
  Inc(offSet);
  tspBuf[offSet] := FLAGTSP;
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(dev, escapByteBuf);
  info^.Desc := Dev.Car.No + '透传下行数据';
end;

procedure TGateWayServerCom.DealTSPDataUpload_V3(ABuf: PByte; cmdNo: Integer);
var
  p: PByte;
  pcmd: PCmdSrvTermTSPDataTSP_V3;
  tspDataLen: Integer;
  //bufData: array of Byte;
  data: string;
  devId: string;
  dev: TDevice;
  i: Integer;
  dType: Byte;
begin
  try
    pcmd := PCmdSrvTermTSPDataTSP_V3(ABuf);
    if pcmd^.TSPDataType <> 0 then//透传终端自身消息
      Exit;

    devId := BCDToStr(@(pcmd^.Header.DevId[0]));
    dev := ADeviceManage.find(devId);
    if dev <> nil then
    begin
      tspDataLen := (ByteOderConvert_Word(pcmd^.Header.CmdProperty) and $03FF) - 1;
      //SetLength(bufData, tspDataLen);

      p := PtrAdd(ABuf, SizeOf(TCmdSrvTermTSPDataTSP_V3));
      dType := p^;//$00 盲区数据  $01 版本信息  $02-$FF 保留其他扩展
      if dType = $01 then
      begin//透传版本信息
        p := PtrAdd(p, 1);

        SetLength(data, tspDataLen - 1);
        CopyMemory(@data[1], p, tspDataLen);
        i := Pos(#0, data);
        while i > 0 do
        begin
          data[i] := #8;
          i := Pos(#0, data);
        end;
        PopMsg('数据上行透传', dev.Car.No + '透传类型版本信息');
        if Assigned(FOnTSPDataUpload) then
          FOnTSPDataUpload(dev, dType, Trim(data));
      end;
    end;
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealTSPDataUpload_V3异常' + E.Message);
    end;
  end;
end;

procedure TGateWayServerCom.DealCompressedDataUpload_V3(ABuf: PByte; cmdNo: Integer);
var
  p: PByte;
  pcmd: PCmdSrvTermCompressedDataTSP_V3;
  dataLen: Integer;
  data: array of Byte;
  devId: string;
  dev: TDevice;
  ms: TMemoryStream;
  i: Int64;
  str: string;
begin
  try
    pcmd := PCmdSrvTermCompressedDataTSP_V3(ABuf);
    devId := BCDToStr(@(pcmd^.Header.DevId[0]));
    dev := ADeviceManage.find(devId);
    if dev <> nil then
    begin
      dataLen := ByteOderConvert_LongWord(pcmd^.CompressedDataLen);
      p := PtrAdd(ABuf, SizeOf(TCmdSrvTermCompressedDataTSP_V3));
      SetLength(data, dataLen);
      CopyMemory(@data[0], p, dataLen);
      {此处采用delphi自带的解压缩算法，不确定是否与车机上传的压缩算法一致}
      ms := TMemoryStream.Create;
      try
        try
          ms.Seek(0, soFromBeginning);
          ms.WriteBuffer(data, dataLen);
          UnCompressionStream(ms);
          i := ms.Size;
          SetLength(data, i);
          ms.Position := 0;
          ms.ReadBuffer(data, i);
          SetLength(str, i);
          CopyMemory(@str[1], @data[0], i);
          PopMsg('数据压缩上传', dev.Car.No + '上传压缩数据:' + #13#10 + str);
        except

        end;
      finally
        ms.Free;
      end;
    end;
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealCompressedDataUpload_V3异常' + E.Message);
    end;
  end;
end;

procedure TGateWayServerCom.DealMediaDataUpload_V3(ABuf: PByte; cmdNo: Integer);
var
  pCmd: PCmdSrvTermQueryMediaTSP_V3;
  pCmdMP: PCmdSrvTermQueryMediaMPTSP_V3;
  devId: string;
  dev: TDevice;
  info: PCmdInfo;
  mediaDataCount: Integer;
//  pBuf: PByte;
  i: Integer;
  pMediaDataUpload: PMediaDataUpload_V3;
  p: PByte;
  hLen: Integer;
  msgBodyLen: Integer;
begin
  try
    info := ACmdManage.Find(cmdNo);
    if info = nil then Exit;
    pCmd := PCmdSrvTermQueryMediaTSP_V3(ABuf);
    devId := BCDToStr(@(pcmd^.Header.DevId[0]));
    dev := ADeviceManage.find(devId);
    if dev = nil then Exit;

    if ByteOderConvert_Word(pCmd^.Header.CmdProperty) and $2000 = 0 then
    begin
      mediaDataCount := ByteOderConvert_Word(pCmd^.MediaDataCount);
      hLen := SizeOf(TCmdSrvTermQueryMediaTSP_V3);
      for i := 0 to mediaDataCount - 1 do
      begin
        p := PtrAdd(ABuf, hLen + i * SizeOf(TMediaDataUpload_V3));
        pMediaDataUpload := PMediaDataUpload_V3(p);
        if pMediaDataUpload^.MediaType = 0 then
        begin
          if Assigned(FOnMediaDataUpload) then
            FOnMediaDataUpload(dev, pMediaDataUpload^);
        end
        else if pMediaDataUpload^.MediaType = 1 then
        begin
          if Assigned(FOnAudioDataUpload) then
            FOnAudioDataUpload(dev, pMediaDataUpload^);
        end
        else if pMediaDataUpload^.MediaType = 2 then
        begin
          if Assigned(FOnVideoDataUpload) then
            FOnVideoDataUpload(dev, pMediaDataUpload^);
        end;
      end;
    end
    else
    begin
      pCmdMP := PCmdSrvTermQueryMediaMPTSP_V3(ABuf);
      mediaDataCount := ByteOderConvert_Word(pCmdMP^.MediaDataCount);
      hLen := SizeOf(TCmdSrvTermQueryMediaMPTSP_V3);
      msgBodyLen := ByteOderConvert_Word(pCmdMP^.Header.CmdProperty) and $03FF;
      i := 0;
      while (i + 1) * SizeOf(TMediaDataUpload_V3) + 4 <= msgBodyLen do
      begin
        p := PtrAdd(ABuf, hLen + i * SizeOf(TMediaDataUpload_V3));
        pMediaDataUpload := PMediaDataUpload_V3(p);
        if pMediaDataUpload^.MediaType = 0 then
        begin
          if Assigned(FOnMediaDataUpload) then
            FOnMediaDataUpload(dev, pMediaDataUpload^);
        end
        else if pMediaDataUpload^.MediaType = 1 then
        begin
          if Assigned(FOnAudioDataUpload) then
            FOnAudioDataUpload(dev, pMediaDataUpload^);
        end
        else if pMediaDataUpload^.MediaType = 2 then
        begin
          if Assigned(FOnVideoDataUpload) then
            FOnVideoDataUpload(dev, pMediaDataUpload^);
        end;
        Inc(i);
      end;  
    end;

    info^.State := CMD_DONE;
    info^.Replytime := now();
    if mediaDataCount > 0 then
    begin
      PopMsg('多媒体数据检索应答', dev.Car.No +'上传了' + #13#10 + info^.Reason + '数据');
    end
    else
    begin
      PopMsg('多媒体数据检索应答', dev.Car.No + #13 + #10 + '无 ' + info^.Reason+ '数据');
    end;
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealMediaDataUpload_V3异常' + E.Message);
    end;
  end;
end;

procedure TGateWayServerCom.SetOnMediaDataUpload(
  const Value: TOnMediaDataUpload);
begin
  FOnMediaDataUpload := Value;
end;

function TGateWayServerCom.SendUploadMediaDataTSP_V3(dev: TDevice; mediaType,
  mediaChannel, mediaReason: Byte; sDateTime, eDateTime: TDateTime;
  delFlag: Byte): Boolean;
var
  info: PCmdinfo;
  len: Word;
  acmd: TCmdTermSrvUploadMediaDataTSP_V3;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
begin
  Result := false;
  if not isActive then exit;
  len := SizeOf(TCmdTermSrvUploadMediaDataTSP_V3);
  InitTSPHeader(acmd.Header, len - TSPHEADERLEN, TERMSRV_MEDIADATAUPLOAD_V3, dev.Id);
  acmd.MediaType := mediaType;
  acmd.MediaChannel := mediaChannel;
  acmd.MediaReason := mediaReason;
  acmd.DelFlag := delFlag;

  acmd.SDateTime[0] := StrToInt('$'+Copy(IntToStr(yearof(sDateTime)),3,2));
  acmd.SDateTime[1] := StrToInt('$'+IntToStr(MonthOf(sDateTime)));
  acmd.SDateTime[2] := StrToInt('$'+IntToStr(DayOf(sDateTime)));
  acmd.SDateTime[3] := StrToInt('$'+IntToStr(HourOf(sDateTime)));
  acmd.SDateTime[4] := StrToInt('$'+IntToStr(MinuteOf(sDateTime)));
  acmd.SDateTime[5] := StrToInt('$'+IntToStr(SecondOf(sDateTime)));

  acmd.EDateTime[0] := StrToInt('$'+Copy(IntToStr(yearof(eDateTime)),3,2));
  acmd.EDateTime[1] := StrToInt('$'+IntToStr(MonthOf(eDateTime)));
  acmd.EDateTime[2] := StrToInt('$'+IntToStr(DayOf(eDateTime)));
  acmd.EDateTime[3] := StrToInt('$'+IntToStr(HourOf(eDateTime)));
  acmd.EDateTime[4] := StrToInt('$'+IntToStr(MinuteOf(eDateTime)));
  acmd.EDateTime[5] := StrToInt('$'+IntToStr(SecondOf(eDateTime)));

  tspPackSize := len + 3;
  SetLength(tspBuf, tspPackSize);
  offSet := 0;
  tspBuf[0] := FLAGTSP;
  Inc(offSet);
  CopyMemory(@tspBuf[offSet], @acmd, len);
  Inc(offSet, len);
  tspBuf[offSet] := GetXorSum(@tspBuf[1], len);
  Inc(offSet);
  tspBuf[offSet] := FLAGTSP;
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(dev, escapByteBuf);

  info^.Desc := '上传指定时间段内的多媒体数据';
  Result := True;
end;

procedure TGateWayServerCom.SetOnRefreshAreaDevList(
  const Value: TOnRefreshAreaDevList);
begin
  FOnRefreshAreaDevList := Value;
end;

function TGateWayServerCom.SendSetLineToDev_V3(dev: TDevice;
  polyLineArea: TPolyLineArea): Boolean;
var
  info: PCmdinfo;
  buff: array[0..1023] of Byte;
  p: PByte;
  dateBuf: array[0..5] of Byte;
  lineSection: TLineSection;
  Apoint: TEarthPoint;
  i, j, k, cx, cy: integer;
  buf: array of Byte;
  bufLen: Word;
  len: Word;
  pacmd: PCmdTermSrvSetPolyLineAreaTSP_V3;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
begin
  Result := false;
  if not isActive then exit;
  FillChar(buff, 1024, 0);
  pacmd := @buff[0];
  //len := SizeOf(TCmdTermSrvSetCircleAreaTSP_V3);
  pacmd^.PolyLineArea.LineNo := ByteOderConvert_LongWord(polyLineArea.areaNO);
  pacmd^.PolyLineArea.LineProperty := ByteOderConvert_Word(polyLineArea.AreaAlarmKind);
  p := PtrAdd(@buff[0], sizeof(TCmdTermSrvSetPolyLineAreaTSP_V3));

  if (polyLineArea.AreaAlarmKind and 1) = 1 then//开始结束时间
  begin
    dateBuf[0] := StrToInt('$'+IntToStr(yearof(polyLineArea.beginDateTiem)));
    dateBuf[1] := StrToInt('$'+IntToStr(MonthOf(polyLineArea.beginDateTiem)));
    dateBuf[2] := StrToInt('$'+IntToStr(DayOf(polyLineArea.beginDateTiem)));
    dateBuf[3] := StrToInt('$'+IntToStr(HourOf(polyLineArea.beginDateTiem)));
    dateBuf[4] := StrToInt('$'+IntToStr(MinuteOf(polyLineArea.beginDateTiem)));
    dateBuf[5] := StrToInt('$'+IntToStr(SecondOf(polyLineArea.beginDateTiem)));
    CopyMemory(p, @dateBuf[0], 6);
    p := PtrAdd(p, 6);

    dateBuf[0] := StrToInt('$'+IntToStr(yearof(polyLineArea.endDateTime)));
    dateBuf[1] := StrToInt('$'+IntToStr(MonthOf(polyLineArea.endDateTime)));
    dateBuf[2] := StrToInt('$'+IntToStr(DayOf(polyLineArea.endDateTime)));
    dateBuf[3] := StrToInt('$'+IntToStr(HourOf(polyLineArea.endDateTime)));
    dateBuf[4] := StrToInt('$'+IntToStr(MinuteOf(polyLineArea.endDateTime)));
    dateBuf[5] := StrToInt('$'+IntToStr(SecondOf(polyLineArea.endDateTime)));
    CopyMemory(p, @dateBuf[0], 6);
    p := PtrAdd(p, 6);
  end;

  //路线总拐点数
  PWord(p)^ := ByteOderConvert_Word(polyLineArea.PointCount);
  p := PtrAdd(p, 2);

  //拐点项
  j := 1;//记录拐点ID
  for i := 0 to polyLineArea.LineSectionCount - 1 do
  begin
    lineSection := polyLineArea.LineSections[i];
    if lineSection <> nil then
    begin
      for k := 0 to lineSection.PointCount - 1 do
      begin
        PLongWord(p)^ := ByteOderConvert_LongWord(j);//拐点ID
        p := PtrAdd(p, 4);
        PLongWord(p)^ := ByteOderConvert_LongWord(lineSection.LineSectionId);//路段ID
        p := PtrAdd(p, 4);

        Apoint := Project.XY2LoLa(lineSection.WPointAry[k]);
        cx := round(Apoint.Longitude * 1000000);  // 经度
        cy := round(Apoint.Latitude * 1000000);   // 纬度
        PLongWord(p)^ := ByteOderConvert_LongWord(cy);//拐点纬度
        p := PtrAdd(p, 4);
        PLongWord(p)^ := ByteOderConvert_LongWord(cx);//拐点经度
        p := PtrAdd(p, 4);

        p^ := lineSection.LineSectionWidth;//路段宽度
        p := PtrAdd(p, 1);
        p^ := lineSection.LineSectionProperty;//路段属性
        p := PtrAdd(p, 1);
        if (lineSection.LineSectionProperty and 1) = 1 then
        begin
          PWord(p)^ := ByteOderConvert_Word(lineSection.LineSectionRunMaxTime);//路段行驶过长阀值
          p := PtrAdd(p, 2);
          PWord(p)^ := ByteOderConvert_Word(lineSection.LineSectionRunMinTime);//路段行驶不足阀值
          p := PtrAdd(p, 2);
        end;
        if (lineSection.LineSectionProperty shr 1 and 1) = 1 then
        begin
          PWord(p)^ := ByteOderConvert_Word(lineSection.LineSectionMaxSpeed);//路段最高速度
          p := PtrAdd(p, 2);
          p^ := lineSection.LineSectionOverSpeedTime;//路段超速持续时间
          p := PtrAdd(p, 1);
        end;
        Inc(j);
      end;  
    end;
  end;

  len := Integer(p) - Integer(@buff[0]);
  InitTSPHeader(pacmd^.Header, len - TSPHEADERLEN, TERMSRV_SETLINE_V3, dev.Id);

  tspPackSize := len + 3;
  SetLength(tspBuf, tspPackSize);
  offSet := 0;
  tspBuf[0] := FLAGTSP;
  Inc(offSet);
  CopyMemory(@tspBuf[offSet], @buff[0], len);
  Inc(offSet, len);
  tspBuf[offSet] := GetXorSum(@tspBuf[1], len);
  Inc(offSet);
  tspBuf[offSet] := FLAGTSP;
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(dev, escapByteBuf);
  info^.Desc := '设置路线到车机：' + Dev.Car.No;
  info^.areaId := polyLineArea.AreaID;
  info^.areaSetType := 0;
  Result := True;
end;

function TGateWayServerCom.SendCollectRunRecData_V3(dev: TDevice;
  flag: Byte): Boolean;
var
  info: PCmdinfo;
  len: Word;
  acmd: TCmdTermSrvCollectRunRecDataTSP_V3;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
begin
  Result := false;
  if not isActive then exit;
  len := SizeOf(TCmdTermSrvCollectRunRecDataTSP_V3);
  InitTSPHeader(acmd.Header, len - TSPHEADERLEN, TERMSRV_COLLECTRUNRECDATA_V3, dev.Id);
  acmd.Flag := flag;
  tspPackSize := len + 3;
  SetLength(tspBuf, tspPackSize);
  offSet := 0;
  tspBuf[0] := FLAGTSP;
  Inc(offSet);
  CopyMemory(@tspBuf[offSet], @acmd, len);
  Inc(offSet, len);
  tspBuf[offSet] := GetXorSum(@tspBuf[1], len);
  Inc(offSet);
  tspBuf[offSet] := FLAGTSP;
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(dev, escapByteBuf);
  info^.Desc := Dev.Car.No + ' 采集行驶记录数据';
end;

function TGateWayServerCom.SendSetRecorderCarNo(dev: TDevice; carVin,
  carNo, carType: string): Boolean;
var
  info: PCmdinfo;
  len: Word;
  acmd: TCmdTermSrvSetRunRecParamTSP_V3;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
  w: LongWord;
begin
  Result := false;
  if not isActive then exit;
  len := SizeOf(TCmdTermSrvSetRunRecParamTSP_V3) + 17 + 12 + 12;
  InitTSPHeader(acmd.Header, len - TSPHEADERLEN, TERMSRV_SETRUNRECPARAM_V3, dev.Id);
  acmd.Flag := SETRUNRECPARAM_CARINFO;
  tspPackSize := len + 3;
  SetLength(tspBuf, tspPackSize);
  offSet := 0;
  tspBuf[0] := FLAGTSP;
  Inc(offSet);
  CopyMemory(@tspBuf[offSet], @acmd, SizeOf(TCmdTermSrvSetRunRecParamTSP_V3));
  Inc(offSet, SizeOf(TCmdTermSrvSetRunRecParamTSP_V3));

  CopyMemory(@tspBuf[offset], @carVin[1], Length(carVin));
  Inc(offSet, 17);

  CopyMemory(@tspBuf[offset], @carNo[1], Length(carNo));
  Inc(offSet, 12);

  CopyMemory(@tspBuf[offset], @carType[1], Length(carType));
  Inc(offSet, 12);

  tspBuf[offSet] := GetXorSum(@tspBuf[1], len);
  Inc(offSet);
  tspBuf[offSet] := FLAGTSP;
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(dev, escapByteBuf);
  info^.Desc := Dev.Car.No + ' 设置记录仪车辆VIN号、车牌号、车辆分类';
end;

function TGateWayServerCom.SendSetRecorderTime(dev: TDevice;
  time: TDateTime): Boolean;
var
  info: PCmdinfo;
  len: Word;
  acmd: TCmdTermSrvSetRunRecParamTSP_V3;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
  w: LongWord;
  dateBuf: array[0..5] of Byte;
begin
  Result := false;
  if not isActive then exit;
  len := SizeOf(TCmdTermSrvSetRunRecParamTSP_V3) + 6;
  InitTSPHeader(acmd.Header, len - TSPHEADERLEN, TERMSRV_SETRUNRECPARAM_V3, dev.Id);
  acmd.Flag := SETRUNRECPARAM_TIME;
  tspPackSize := len + 3;
  SetLength(tspBuf, tspPackSize);
  offSet := 0;
  tspBuf[0] := FLAGTSP;
  Inc(offSet);
  CopyMemory(@tspBuf[offSet], @acmd, SizeOf(TCmdTermSrvSetRunRecParamTSP_V3));
  Inc(offSet, SizeOf(TCmdTermSrvSetRunRecParamTSP_V3));

  dateBuf[0] := StrToInt('$'+IntToStr(yearof(time)));
  dateBuf[1] := StrToInt('$'+IntToStr(MonthOf(time)));
  dateBuf[2] := StrToInt('$'+IntToStr(DayOf(time)));
  dateBuf[3] := StrToInt('$'+IntToStr(HourOf(time)));
  dateBuf[4] := StrToInt('$'+IntToStr(MinuteOf(time)));
  dateBuf[5] := StrToInt('$'+IntToStr(SecondOf(time)));

  CopyMemory(@tspBuf[offset], @dateBuf[0], 6);
  Inc(offset, 6);

  tspBuf[offSet] := GetXorSum(@tspBuf[1], len);
  Inc(offSet);
  tspBuf[offSet] := FLAGTSP;
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(dev, escapByteBuf);
  info^.Desc := Dev.Car.No + ' 设置记录仪时钟';
end;

procedure TGateWayServerCom.DealMediaUploadOK_V3(ABuf: PByte);
var
  p: PCmdSrvTermAPicUploaded_V3;
begin
  try
    p := PCmdSrvTermAPicUploaded_V3(ABuf);
    if p^.MediaType = 0 then
      DealAPicUpload_V3(ABuf)
    else if p^.MediaType = 1 then
      DealAAudioUpload_V3(ABuf)
    else if p^.MediaType = 2 then
      DealAVideoUpload_V3(ABuf);
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealMediaUploadOK_V3异常' + E.Message);
    end;
  end;
end;

function TGateWayServerCom.SendEmergencyAlarmDeal(dev: TDevice;
  dealFlag: Byte): Boolean;
var
  cmd: TCmdSendEmgcyAlarmDeal_V3;
  buf: array of Byte;
  len: Integer;
begin
  len := SizeOf(TCmdSendEmgcyAlarmDeal_V3) + 1;
  InitHeader(cmd.Header, len, TERMSRV_EMGCYALARMDEAL_V3, dev.Id);
  cmd.Flag := dealFlag;
  SetLength(buf, len);
  CopyMemory(@buf[0], @cmd, len - 1);
  buf[len - 1] := GetXorSum(@buf[0], len - 1);
  Result := DirectSend(buf[0], len);

  if (dealFlag = 1) and Result then
  begin
    dev.IsSendCancelEmgcyAlarm := True;
    if currAlarmInfo <> nil then
    begin
      dev.alarmInfoId := currAlarmInfo.Id;
    end;
  end;
end;

procedure TGateWayServerCom.SetOnAudioDataUpload(
  const Value: TOnAudioDataUpload);
begin
  FOnAudioDataUpload := Value;
end;

function TGateWayServerCom.SetEventList(ADevice: TDevice;
  setType: Byte): Boolean;
var
  buff: array[0..1023] of byte;
//  pcmd: PCmdTermSrvSetEventList_V3;
  i: integer;
  pEvent: PEventInfo;
  p: PByte;
  eventLen: byte;
  str0: string;
  len:integer;

  pacmd: PCmdTermSrvSetEventListTSP_V3;//TCmdTermSrvSetDevParam_V3;//TCmdTermSrvSetDevParam_V2;
  info: PCmdinfo;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
begin
  Result := false;
  if not isActive then exit;
  FillChar(buff, 1024, 0);
  pacmd := @buff[0];
  pacmd^.EventType := setType;

  //pacmd^.EventCount := ADevice.EventList.Count;
//  pacmd^.EventPackCount := pacmd^.EventCount;
  p := PtrAdd(@buff[0], SizeOf(TCmdTermSrvSetEventListTSP_V3));
  for i := 0 to ADevice.EventList.Count - 1 do
  begin//此处事件内容的结束符已在事件生成的时候添加
    pEvent := ADevice.EventItems[i];
    //写入 事件ID       1
    p^ := pEvent^.No;
    p := PtrAdd(p, 1);
    //得到事件的长度  1
    eventLen := Length(pEvent^.Info);
    p^ := eventLen;
    p := PtrAdd(p, 1);
    InitStr(str0, eventLen);
    //写入事件信息        eventNoLen
    CopyMemory(@str0[1], @(pEvent^.info)[1], eventLen);
    CopyMemory(p, @str0[1], eventLen);
    p := PtrAdd(p, eventLen);
  end;
  if  ADevice.EventList.Count=0 then
    len := sizeof(TCmdTermSrvSetEventListTSP_V3)
  else
    len := Integer(p) - Integer(@buff[0]);
  InitTSPHeader(pacmd^.Header, len - TSPHEADERLEN, TERMSRV_SETEVENT_V3, ADevice.Id);

  tspPackSize := len + 3;//2个标志位 + 1个校验码
  SetLength(tspBuf, tspPackSize);
  offSet := 0;
  tspBuf[offset] := FLAGTSP;//标识位
  Inc(offSet);
  CopyMemory(@tspBuf[offSet], @buff[0], len);
  Inc(offSet, len);
  tspBuf[offSet] := GetXorSum(@tspBuf[1], len);//从消息头开始，不包括标识位
  Inc(offSet);
  tspBuf[offset] := FLAGTSP;//标识位
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(ADevice, escapByteBuf);
  info^.Desc := '设置事件：' + ADevice.Car.No;

//  pcmd := @buff[0]; //pcmd 指向buff 首址
//  InitHeader(pcmd^.Header,0,TERMSRV_SETEVENTLIST_V3,ADevice.id);
////
//  if  ADevice.EventList.Count=0 then
//    pcmd^.SetType := 0
//  else
//    pcmd^.SetType := 1;
//  { TODO -osjp : 类型需讨论 }
//  pcmd^.SetCount := ADevice.EventList.Count;
//  pcmd^.PackCount := 1;
//  p := PtrAdd(@buff[0], sizeof(TCmdTermSrvSetEventList_V3)); //p 指向 buff 移过 已知结构后
////  p^ := ADevice.EventList.Count;  // 事件项个数   1
////  p := PtrAdd(p, 1);
//  for i := 0 to ADevice.EventList.Count - 1 do
//  begin
//    pEvent := ADevice.EventItems[i];
//    //写入 事件ID       1
//    p^ := pEvent^.No;
//    p := PtrAdd(p, 1);
//    //得到事件的长度  1
//    eventLen := Length(pEvent^.Info);
//    p^ := eventLen+1;
//    p := PtrAdd(p, 1);
//    InitStr(str0, eventLen);
//    //写入事件信息        eventNoLen
//    CopyMemory(@str0[1], @(pEvent^.info)[1], eventLen);
//    CopyMemory(p, @str0[1], eventLen+1);
//    p := PtrAdd(p, eventLen+1);
//  end;
//  if  ADevice.EventList.Count=0 then
//    len := sizeof(TCmdTermSrvSetEventList_V3) -2
//  else
//    len := Integer(p) - Integer(@buff[0]);
//  Pcmd^.Header.Size := len;
//  Result := DirectSend(buff[0],len);
end;

function TGateWayServerCom.SetTelList(ADevice: TDevice;
  telList: TIntegerList; setType: Byte): boolean;
var
  buff: array[0..1023] of byte;
//  pcmd: PCmdTermSrvSetTelList_V3;
  info: PCmdinfo;
  i,len: integer;
  pTel: PTelInfo;
  p: PByte;
  telNoLen: byte;
  str0: string;
  
  bufLen: Integer;
  pacmd: PCmdTermSrvSetPhoneBookTSP_V3;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
begin
  Result := false;
  if not isActive then exit;
  FillChar(buff, 1024, 0);
  pacmd := @buff[0];
  pacmd^.SetType := setType;
  //pacmd^.PhoneCount := ADevice.TelList.Count;
//  pacmd^.PackCount := pacmd^.PhoneCount;
  p := PtrAdd(@buff[0], SizeOf(TCmdTermSrvSetPhoneBookTSP_V3));
  if setType > 0 then
  begin
    p^ := telList.Count;
    p := PtrAdd(p, 1);
    for i := 0 to telList.Count - 1 do
    begin
      pTel := telList.Datas[i];
      //写入 电话类型       1
      p^ := pTel^.TelType;
      p := PtrAdd(p, 1);
      //写入电话号码长度
      telNoLen := Length(pTel^.No);
      p^ := telNoLen;
      p := PtrAdd(p, 1);
      //写入电话号码        telNoLen
      InitStr(str0, telNoLen);      
      CopyMemory(@str0[1], @(pTel^.No)[1], telNoLen);
      CopyMemory(p, @str0[1], telNoLen);
      p := PtrAdd(p, telNoLen);
      //写入联系人长度
      p^ := Length(pTel^.Name);
      p := PtrAdd(p, 1);
      //写入　电话拥有人    8
      InitStr(str0, Length(pTel^.Name));
      CopyMemory(@str0[1], @(pTel^.Name)[1], length(pTel^.Name));
      CopyMemory(p, @str0[1], Length(pTel^.Name));
      p := PtrAdd(p, Length(pTel^.Name));
    end;
  end;
  bufLen := Integer(p) - Integer(@buff[0]);
  InitTSPHeader(pacmd^.Header, bufLen - TSPHEADERLEN, TERMSRV_SETPHONEBOOK_V3, ADevice.Id);

  tspPackSize := bufLen + 3;
  SetLength(tspBuf, tspPackSize);
  offSet := 0;
  tspBuf[0] := FLAGTSP;
  Inc(offSet);
  CopyMemory(@tspBuf[offSet], @buff[0], bufLen);
  Inc(offSet, bufLen);
  tspBuf[offSet] := GetXorSum(@buff[0], bufLen);
  Inc(offSet);
  tspBuf[offSet] := FLAGTSP;
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(ADevice, escapByteBuf);
  info^.Desc := '设置电话本：' + ADevice.Car.No;
end;

function TGateWayServerCom.SetInfoMenu_V3(ADevice: TDevice;
  InfoTypeList: TIntegerList; setType: Integer): Boolean;
var
  buff: array[0..1023] of byte;
  pcmd: PCmdTermSrvSetInfoMenu_V3;
  i: integer;
  p: PByte;
  eventLen: byte;
  str0: string;

  infoType: TInfoType;
  bufLen: Integer;
  pacmd: PCmdTermSrvSetInfoMenuTSP_V3;
  info: PCmdinfo;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
begin
  Result := false;
  if not isActive then exit;
  FillChar(buff, 1024, 0);
  pacmd := @buff[0];
  pacmd^.SetType := setType;
//  pacmd^.InfoCount := ADevice.InfoMenuList.Count;
//  pacmd^.PackCount := pacmd^.InfoCount;
  p := PtrAdd(@buff[0], SizeOf(TCmdTermSrvSetInfoMenuTSP_V3));
  if setType > 0 then
  begin
    p^ := InfoTypeList.Count;
    p := PtrAdd(p, 1);
    for i := 0 to InfoTypeList.Count - 1 do
    begin
      infoType := TInfoType(InfoTypeList.Datas[i]);
      //写入 事件ID       1
      p^ := infoType.InfoTypeId;
      p := PtrAdd(p, 1);
      //得到事件的长度  1
      eventLen := Length(infoType.InfoTypeName);
      PWord(p)^ := ByteOderConvert_Word(eventLen);
      p := PtrAdd(p, 2);

      InitStr(str0, eventLen);
      //写入事件信息        eventNoLen
      CopyMemory(@str0[1], @(infoType.InfoTypeName[1]), eventLen);
      CopyMemory(p, @str0[1], eventLen);
      p := PtrAdd(p, eventLen);
    end;
  end;
  bufLen := Integer(p) - Integer(@buff[0]);
  InitTSPHeader(pacmd^.Header, bufLen - TSPHEADERLEN, TERMSRV_SETINFOMENU_V3, ADevice.Id);

  tspPackSize := bufLen + 3;
  SetLength(tspBuf, tspPackSize);
  offSet := 0;
  tspBuf[offSet] := FLAGTSP;
  Inc(offSet);
  CopyMemory(@tspBuf[offset], @buff[0], bufLen);
  Inc(offSet, bufLen);
  tspBuf[offSet] := GetXorSum(@tspBuf[1], bufLen);
  Inc(offSet);
  tspBuf[offSet] := FLAGTSP;

  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(ADevice, escapByteBuf);
  info^.Desc := '设置车机信息菜单：' + ADevice.Car.No;
end;

procedure TGateWayServerCom.DealMediaEventUpload_V3(ABuf: PByte;
  cmdNo: Integer);
var
  pcmd: PCmdSrvTermMediaEventUploadTSP_V3;
  p: PByte;
  len: Integer;
  mediaEvent: RecMediaEventUpload;
  str: string;
  devId: string;
  dev: TDevice;
begin
  try
    pcmd := PCmdSrvTermMediaEventUploadTSP_V3(ABuf);
    devId := BCDToStr(@(pcmd^.Header.DevId[0]));
    dev := ADeviceManage.find(devId);
    if dev = nil then Exit;
    mediaEvent.DevId := devId;
    mediaEvent.CarNo := dev.Car.No;
    mediaEvent.MediaDataId := ByteOderConvert_LongWord(pcmd^.MediaDataId);
    mediaEvent.MediaType := pcmd^.MediaType;
    mediaEvent.MediaDataFormat := pcmd^.MediaFormat;
    mediaEvent.MediaEventId := pcmd^.MediaEventId;
    mediaEvent.MediaChannelId := pcmd^.MediaChannelId;
    if Assigned(FOnMediaEventUpload) then
      FOnMediaEventUpload(mediaEvent);
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealMediaEventUpload_V3异常' + E.Message);
    end;
  end;
end;

procedure TGateWayServerCom.SetOnMediaEventUpload(
  const Value: TOnMediaEventUpload);
begin
  FOnMediaEventUpload := Value;
end;

procedure TGateWayServerCom.SetOnRefreshAlarmDealStatus(
  const Value: TOnRefreshAlarmDealStatus);
begin
  FOnRefreshAlarmDealStatus := Value;
end;

procedure TGateWayServerCom.DealServerRunInfo_V3(ABuf: PByte);
var
  pCmd: PCmdSrvRunInfo_V3;
  srvRunInfo: RecSrvRunInfo;
begin
  try
    pCmd := PCmdSrvRunInfo_V3(ABuf);
    srvRunInfo.SrvType := pCmd^.SrvType;
    srvRunInfo.SrvRunTime := pCmd^.SrvRunTime;
    srvRunInfo.SrvRunStatus := pCmd^.SrvRunStatus;
    srvRunInfo.SrvCPUPercent := pCmd^.SrvCPUPercent;
    srvRunInfo.SrvTotalMem := pCmd^.SrvTotalMem;
    srvRunInfo.SrvMemInUse := pCmd^.SrvMemInUse;
    srvRunInfo.SrvMemPercent := pCmd^.SrvMemPercent;

    if Assigned(FOnRefreshSrvRunInfo) then
      FOnRefreshSrvRunInfo(srvRunInfo);
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealServerRunInfo_V3异常' + E.Message);
    end;
  end;
end;

procedure TGateWayServerCom.SetOnRefreshSrvRunInfo(
  const Value: TOnRefreshSrvRunInfo);
begin
  FOnRefreshSrvRunInfo := Value;
end;

function TGateWayServerCom.SendSetInstallTime(dev: TDevice;
  time: TDateTime): Boolean;
var
  info: PCmdinfo;
  len: Word;
  acmd: TCmdTermSrvSetRunRecParamTSP_V3;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
  w: LongWord;
  dateBuf: array[0..5] of Byte;
begin
  Result := false;
  if not isActive then exit;
  len := SizeOf(TCmdTermSrvSetRunRecParamTSP_V3) + 6;
  InitTSPHeader(acmd.Header, len - TSPHEADERLEN, TERMSRV_SETRUNRECPARAM_V3, dev.Id);
  acmd.Flag := SETRUNRECPARAM_INSTALLDATE;
  tspPackSize := len + 3;
  SetLength(tspBuf, tspPackSize);
  offSet := 0;
  tspBuf[0] := FLAGTSP;
  Inc(offSet);
  CopyMemory(@tspBuf[offSet], @acmd, SizeOf(TCmdTermSrvSetRunRecParamTSP_V3));
  Inc(offSet, SizeOf(TCmdTermSrvSetRunRecParamTSP_V3));

  dateBuf[0] := StrToInt('$'+IntToStr(yearof(time)));
  dateBuf[1] := StrToInt('$'+IntToStr(MonthOf(time)));
  dateBuf[2] := StrToInt('$'+IntToStr(DayOf(time)));
  dateBuf[3] := StrToInt('$'+IntToStr(HourOf(time)));
  dateBuf[4] := StrToInt('$'+IntToStr(MinuteOf(time)));
  dateBuf[5] := StrToInt('$'+IntToStr(SecondOf(time)));

  CopyMemory(@tspBuf[offset], @dateBuf[0], 6);
  Inc(offset, 6);

  tspBuf[offSet] := GetXorSum(@tspBuf[1], len);
  Inc(offSet);
  tspBuf[offSet] := FLAGTSP;
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(dev, escapByteBuf);
  info^.Desc := Dev.Car.No + ' 设置记录仪初次安装时间';
end;

function TGateWayServerCom.SendSetInitMileage(dev: TDevice;
  initMileage: Integer): Boolean;
var
  info: PCmdinfo;
  len: Word;
  acmd: TCmdTermSrvSetRunRecParamTSP_V3;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
  mileageBcdAry: TByteDynArray;
begin
  Result := false;
  if not isActive then exit;
  len := SizeOf(TCmdTermSrvSetRunRecParamTSP_V3) + 4;
  InitTSPHeader(acmd.Header, len - TSPHEADERLEN, TERMSRV_SETRUNRECPARAM_V3, dev.Id);
  acmd.Flag := SETRUNRECPARAM_INITMILEAGE;
  tspPackSize := len + 3;
  SetLength(tspBuf, tspPackSize);
  offSet := 0;
  tspBuf[0] := FLAGTSP;
  Inc(offSet);
  CopyMemory(@tspBuf[offSet], @acmd, SizeOf(TCmdTermSrvSetRunRecParamTSP_V3));
  Inc(offSet, SizeOf(TCmdTermSrvSetRunRecParamTSP_V3));

  mileageBcdAry := StrToBCD(FormatFloat('00000000', initMileage), 4);
  CopyMemory(@tspBuf[offset], @mileageBcdAry[0], 4);
  Inc(offset, 4);

  tspBuf[offSet] := GetXorSum(@tspBuf[1], len);
  Inc(offSet);
  tspBuf[offSet] := FLAGTSP;
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(dev, escapByteBuf);
  info^.Desc := Dev.Car.No + ' 设置记录仪初始里程';
end;

function TGateWayServerCom.SendSetPluse(dev: TDevice;
  pluse: Word): Boolean;
var
  info: PCmdinfo;
  len: Word;
  acmd: TCmdTermSrvSetRunRecParamTSP_V3;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
  apluse: Word;
begin
  Result := false;
  if not isActive then exit;
  len := SizeOf(TCmdTermSrvSetRunRecParamTSP_V3) + 2;
  InitTSPHeader(acmd.Header, len - TSPHEADERLEN, TERMSRV_SETRUNRECPARAM_V3, dev.Id);
  acmd.Flag := SETRUNRECPARAM_PULSE;
  tspPackSize := len + 3;
  SetLength(tspBuf, tspPackSize);
  offSet := 0;
  tspBuf[0] := FLAGTSP;
  Inc(offSet);
  CopyMemory(@tspBuf[offSet], @acmd, SizeOf(TCmdTermSrvSetRunRecParamTSP_V3));
  Inc(offSet, SizeOf(TCmdTermSrvSetRunRecParamTSP_V3));

  apluse := ByteOderConvert_Word(pluse);
  CopyMemory(@tspBuf[offset], @apluse, 2);
  Inc(offset, 2);

  tspBuf[offSet] := GetXorSum(@tspBuf[1], len);
  Inc(offSet);
  tspBuf[offSet] := FLAGTSP;
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(dev, escapByteBuf);
  info^.Desc := Dev.Car.No + ' 设置记录仪脉冲系数';
end;

function TGateWayServerCom.SendSetStatusParamName(dev: TDevice;
  sAry: TStringDynArray): Boolean;
var
  info: PCmdinfo;
  len: Word;
  acmd: TCmdTermSrvSetRunRecParamTSP_V3;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
  i: Integer;
begin
  Result := false;
  if not isActive then exit;
  len := SizeOf(TCmdTermSrvSetRunRecParamTSP_V3) + 10 * Length(sAry);
  InitTSPHeader(acmd.Header, len - TSPHEADERLEN, TERMSRV_SETRUNRECPARAM_V3, dev.Id);
  acmd.Flag := SETRUNRECPARAM_STATUSPARAM;
  tspPackSize := len + 3;
  SetLength(tspBuf, tspPackSize);
  offSet := 0;
  tspBuf[0] := FLAGTSP;
  Inc(offSet);
  CopyMemory(@tspBuf[offSet], @acmd, SizeOf(TCmdTermSrvSetRunRecParamTSP_V3));
  Inc(offSet, SizeOf(TCmdTermSrvSetRunRecParamTSP_V3));


  for i := 0 to Length(sAry) - 1 do
  begin
    CopyMemory(@tspBuf[offset], @(sAry[i][1]), 10);
    Inc(offset, 10);
  end;

  tspBuf[offSet] := GetXorSum(@tspBuf[1], len);
  Inc(offSet);
  tspBuf[offSet] := FLAGTSP;
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(dev, escapByteBuf);
  info^.Desc := Dev.Car.No + ' 设置记录仪状态量配置参数';
end;

procedure TGateWayServerCom.DealRunRecDataUpload_V3(ABuf: PByte;
  cmdNo: Integer);
var
  p: PCmdSrvTermRunRecDataTSP_V3;
  pB: PByte;
  data: TByteDynArray;
  dev: TDevice;
begin
  try
    p := PCmdSrvTermRunRecDataTSP_V3(ABuf);
    dev := AdeviceManage.find(BCDToStr(@(p^.Header.DevID[0])));
    if dev = nil then Exit;
    if p^.RunRecFlag in [1, 2, 4, 6] then
    begin
      SetLength(data, Integer(ByteOderConvert_Word(p^.Header.CmdProperty) and $03FF) - 3);
      pB := PtrAdd(p, SizeOf(TCmdSrvTermRunRecDataTSP_V3) + 6);//正确数据块前有6个字节，数据块后还有1个字节的校验位 详见记录仪老的协议(2003)
      CopyMemory(@data[0], pB, Length(data) - 6 - 1);
      if Assigned(FOnRunRecDataUpload) then
        FOnRunRecDataUpload(p^.RunRecFlag, data, dev);
    end;
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealRunRecDataUpload_V3异常' + E.Message);
    end;
  end;
end;

procedure TGateWayServerCom.SetOnRunRecDataUpload(
  const Value: TOnRunRecDataUpload);
begin
  FOnRunRecDataUpload := Value;
end;

procedure TGateWayServerCom.DealAlarmSupervise_V3(ABuf: PByte);
var
  pCmd: PCmdAlarmSupervise_V3;
  devId: string;
  dev: TDevice;
  alarmSupervise: TAlarmSupervise;
  len: Integer;
  str: string;
  p: PByte;
  buf: array of Byte;
begin
  try
    pCmd := PCmdAlarmSupervise_V3(ABuf);
    devId := BCDToStr(@(pCmd^.Header.DevID[0]));
  //  dev := ADeviceManage.find(devId);
  //  if dev = nil then Exit;

    alarmSupervise := FAlarmSuperviseManage.Add(-1);
    alarmSupervise.DevId := devId;

    len := pCmd^.CarNoLen;
    SetLength(str, len);
    p := PtrAdd(pCmd, SizeOf(TCmdAlarmSupervise_V3));
    CopyMemory(@str[1], p, len);
    alarmSupervise.CarNo := Trim(str);
    p := PtrAdd(p, len);

    alarmSupervise.CarCpColor := PByte(p)^;
    p := PtrAdd(p, 1);

    alarmSupervise.AlarmSrc := PByte(p)^;
    p := PtrAdd(p, 1);

    alarmSupervise.AlarmType := PWord(p)^;
    p := PtrAdd(p, 2);

    SetLength(buf, 7);
    CopyMemory(@buf[0], p, 7);
    alarmSupervise.AlarmTime := GetGpsTime_BCD7(buf);
    p := PtrAdd(p, 7);

    alarmSupervise.AlarmId := PLongWord(p)^;
    p := PtrAdd(p, 4);

    CopyMemory(@buf[0], p, 7);
    alarmSupervise.AlarmDeadLineTime := GetGpsTime_BCD7(buf);
    p := PtrAdd(p, 7);    

    alarmSupervise.AlarmLevel := PByte(p)^;
    p := PtrAdd(p, 1);

    len := PLongWord(p)^;
    SetLength(str, len);
    p := PtrAdd(p, 4);
    CopyMemory(@str[1], p, len);
    alarmSupervise.AlarmSupervisor := Trim(str);

    p := PtrAdd(p, len);
    len := PLongWord(p)^;
    SetLength(str, len);
    p := PtrAdd(p, 4);
    CopyMemory(@str[1], p, len);
    alarmSupervise.AlarmTel := Trim(str);

    p := PtrAdd(p, len);
    len := PLongWord(p)^;
    SetLength(str, len);
    p := PtrAdd(p, 4);
    CopyMemory(@str[1], p, len);
    alarmSupervise.AlarmEmail := Trim(str);

    if Assigned(FOnAlarmSupervise) then
      FOnAlarmSupervise(alarmSupervise);
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealAlarmSupervise_V3异常' + E.Message);
    end;
  end;
end;

procedure TGateWayServerCom.SetOnAlarmSupervise(
  const Value: TOnAlarmSupervise);
begin
  FOnAlarmSupervise := Value;
end;

function TGateWayServerCom.SendReplyAlarmSupverise(adevId: string; acarNo: string;
  alarmId: Integer; ret: Byte; alarmType: Word): Boolean;
var
  cmd: TCmdSendReplyAlarmSupervise_V3;
  buf: array of Byte;
  len: Integer;
  info: PCmdInfo;
  str: string;
begin
  len := SizeOf(TCmdSendReplyAlarmSupervise_V3) + 1;
  InitHeader(cmd.Header, len, TERMSRV_REPLYALRMSUPERVISE, adevId);

  cmd.AlarmId := alarmId;
  cmd.Ret := ret;
//  cmd.AlarmType := alarmType;
  SetLength(buf, len);
  CopyMemory(@buf[0], @cmd, len - 1);
  buf[len - 1] := GetXorSum(@buf[0], len - 1);
  Result := DirectSend(buf[0], len);

  info := ACmdManage.Add(cmd.Header.CmdOrder);
  info^.Id := Cmd.Header.CmdOrder;
  info^.State := CMD_SNDNODO;
  info^.Desc := '汇报督办报警处理结果:' + aCarNo;
//  info^.Dev := dev;
  info^.DevId := adevId;
  info^.SendTime := now();
  info^.CancelTime := 0;
  info^.Replytime := 0;
  SetLength(info^.Content, cmd.Header.Size);
  Move(Buf[0], info^.Content[0], cmd.Header.Size);
  info^.ContentSize := cmd.Header.Size;
//  SaveCMD.CmdList.AddData(Cmd.header.Cmdorder, info);
end;

function TGateWayServerCom.SendQueryVideo_V3(dev: TDevice; channelId: Byte; Reason: Byte;
  beginDataTime, endDateTime: string; timeBool: Boolean): Boolean;
var
  dateTime: TDateTime;
  info: PCmdinfo;
  len: Word;
  acmd: TCmdTermSrvQueryMediaTSP_V3;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
begin
  Result := false;
  if not isActive then exit;
  len := SizeOf(TCmdTermSrvQueryMediaTSP_V3);
  InitTSPHeader(acmd.Header, len - TSPHEADERLEN, TERMSRV_QUERYMEDIADATA_V3, dev.Id);
  acmd.MediaType := 2;
  acmd.CameraIndex := channelId;
  acmd.Reason := Reason;
  if timeBool = True then
  begin
    dateTime := StrToDateTime(FormatDatetime('yyyy-mm-dd hh:nn:ss',StrToDateTime(beginDataTime)));
    acmd.SDateTime[0] := StrToInt('$'+Copy(IntToStr(yearof(dateTime)),3,2));
    acmd.SDateTime[1] := StrToInt('$'+IntToStr(MonthOf(dateTime)));
    acmd.SDateTime[2] := StrToInt('$'+IntToStr(DayOf(dateTime)));
    acmd.SDateTime[3] := StrToInt('$'+IntToStr(HourOf(dateTime)));
    acmd.SDateTime[4] := StrToInt('$'+IntToStr(MinuteOf(dateTime)));
    acmd.SDateTime[5] := StrToInt('$'+IntToStr(SecondOf(dateTime)));
    dateTime := StrToDateTime(FormatDatetime('yyyy-mm-dd hh:nn:ss',StrToDateTime(endDateTime)));
    acmd.EDateTime[0] := StrToInt('$'+Copy(IntToStr(yearof(dateTime)),3,2));
    acmd.EDateTime[1] := StrToInt('$'+IntToStr(MonthOf(dateTime)));
    acmd.EDateTime[2] := StrToInt('$'+IntToStr(DayOf(dateTime)));
    acmd.EDateTime[3] := StrToInt('$'+IntToStr(HourOf(dateTime)));
    acmd.EDateTime[4] := StrToInt('$'+IntToStr(MinuteOf(dateTime)));
    acmd.EDateTime[5] := StrToInt('$'+IntToStr(SecondOf(dateTime)));
  end
  else
  begin
    FillChar(acmd.SDateTime, 6, 0);
    FillChar(acmd.EDateTime, 6, 0);
  end;
  tspPackSize := len + 3;
  SetLength(tspBuf, tspPackSize);
  offSet := 0;
  tspBuf[0] := FLAGTSP;
  Inc(offSet);
  CopyMemory(@tspBuf[offSet], @acmd, len);
  Inc(offSet, len);
  tspBuf[offSet] := GetXorSum(@tspBuf[1], len);
  Inc(offSet);
  tspBuf[offSet] := FLAGTSP;
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(dev, escapByteBuf);

  info^.PictureType := 1;
  case Reason of
    0: info^.Reason := '中心主动拍摄';
    1: info^.Reason := '定时拍摄';
    2: info^.Reason := '抢劫报警拍摄';
    3: info^.Reason := '碰撞侧翻报警拍摄';
  else
    info^.Reason := '未知';
  end;
  info^.Desc := '发送视频数据检索命令：' + Dev.Car.No + ' ' + info^.Reason;
end;

procedure TGateWayServerCom.SetOnVideoDataUpload(
  const Value: TOnVideoDataUpload);
begin
  FOnVideoDataUpload := Value;
end;

procedure TGateWayServerCom.DealAVideoUpload_V3(ABuf: PByte);
var
  dev: TDevice;
  pCmd:PCmdSrvTermAPicUploaded_V3;
  i: Integer;
  pic: PicInfo;
  DevId: string;
  //pInfo: PCmdInfo;
begin
  pCmd := PCmdSrvTermAPicUploaded_V3(ABuf);
  DevId := BCDTostr(@(pCmd^.Header.DevId[0]));

  try
    dev := ADeviceManage.find(DevId);
    if dev <> nil then
    begin
      begin
        if Globalparam.IsPhotoShowhit then
            PopMsg('来视频文件', dev.Car.No + #13 + #10 + '来视频文件了');
            
        if Assigned(FVideoUpload) then
          FVideoUpload(dev, pCmd^.PicId);
      end;
    end;
  except
  end;
end;

procedure TGateWayServerCom.DealCheckDuty_V3(ABuf: PByte);
var
  pCmd: PCmdGovInfo_V3;
  govInfo: TGovInfo;
  str: string;
begin
  try
    pCmd := PCmdGovInfo_V3(ABuf);
    govInfo := FGovInfoManage.Add(pCmd^.MsgId);
    govInfo.ObjType := pCmd^.ObjType;
    govInfo.ObjId := pCmd^.ObjID;
    govInfo.SrcCmdId := SRVTERM_GOV_CHECKDUTY;
    SetLength(str, pCmd^.MsgLen);
    CopyMemory(@str[1], PtrAdd(pCmd, SizeOf(TCmdGovInfo_V3)), pCmd^.MsgLen);
    govInfo.Msg := str;
    if Assigned(FOnGovInfo) then
      FOnGovInfo(govInfo);
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealCheckDuty_V3异常' + E.Message);
    end;
  end;
end;

procedure TGateWayServerCom.DealGovAlarm_V3(ABuf: PByte);
var
  pCmd: PCmdGovAlarm_V3;
  p: PByte;
  govAlarm: TGovAlarmInfo;
  s: string;
  i: Integer;
  gpsDate: array[0..6] of Byte;
begin
  try
    pCmd := PCmdGovAlarm_V3(ABuf);
    p := PtrAdd(pCmd, SizeOf(TCmdGovAlarm_V3));
    i := pCmd^.CarNoLen;
    SetLength(s, i);
    CopyMemory(@s[1], p, i);
    govAlarm.CarNo := s;
    p := PtrAdd(p, i);

    i := PByte(p)^;
    govAlarm.CarCPColorId := i;
    P := PtrAdd(p, 1);

    i := PByte(p)^;
    govAlarm.AlarmSrc := i;
    p := PtrAdd(p, 1);

    i := PWord(p)^;
    govAlarm.AlarmType := i;
    p := PtrAdd(p, 2);

    CopyMemory(@gpsDate[0], p, 7);
    govAlarm.AlarmTime := GetGovAlarmGpsTime(gpsDate);
    p := PtrAdd(p, 7);

    i := PLongWord(p)^;
    p := PtrAdd(p, 4);
    SetLength(s, i);
    CopyMemory(@s[1], p, i);
    govAlarm.AlarmMsg := s;

    govAlarm.GovAlarm_Type := 2;

    if Assigned(FOnGovAlarmInfo) then
      FOnGovAlarmInfo(govAlarm);
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealGovAlarm_V3异常' + E.Message);
    end;
  end;
end;

procedure TGateWayServerCom.DealGovEarlyWarning_V3(ABuf: PByte);
var
  pCmd: PCmdGovAlarm_V3;
  p: PByte;
  govAlarm: TGovAlarmInfo;
  s: string;
  i: Integer;
  gpsDate: array[0..6] of Byte;
begin
  try
    pCmd := PCmdGovAlarm_V3(ABuf);
    p := PtrAdd(pCmd, SizeOf(TCmdGovAlarm_V3));
    i := pCmd^.CarNoLen;
    SetLength(s, i);
    CopyMemory(@s[1], p, i);
    govAlarm.CarNo := s;
    p := PtrAdd(p, i);

    i := PByte(p)^;
    govAlarm.CarCPColorId := i;
    P := PtrAdd(p, 1);

    i := PByte(p)^;
    govAlarm.AlarmSrc := i;
    p := PtrAdd(p, 1);

    i := PWord(p)^;
    govAlarm.AlarmType := i;
    p := PtrAdd(p, 2);

    CopyMemory(@gpsDate[0], p, 7);
    govAlarm.AlarmTime := GetGovAlarmGpsTime(gpsDate);
    p := PtrAdd(p, 7);

    i := PLongWord(p)^;
    p := PtrAdd(p, 4);
    SetLength(s, i);
    CopyMemory(@s[1], p, i);
    govAlarm.AlarmMsg := s;

    govAlarm.GovAlarm_Type := 1;

    if Assigned(FOnGovAlarmInfo) then
      FOnGovAlarmInfo(govAlarm);
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealGovEarlyWarning_V3异常' + E.Message);
    end;
  end;
end;

procedure TGateWayServerCom.DealGovGpsData_V3(ABuf: PByte);
var
  pCmd: PCmdGovCarGpsData_V3;
  carNo: string;
  dev: TDevice;
  car: TCar;
  i: Integer;
  tmpLW: LongWord;
  p: TWorldPoint;
begin
  try
    pCmd := PCmdGovCarGpsData_V3(ABuf);
    InitStr(carNo, 21);
    CopyMemory(@carNo[1], @(pCmd^.CarNo[0]), 21);

    dev := AGovDeviceManage.FindDevFromCarNo(Trim(carNo));
    if dev = nil then
    begin
      car := TCar.Create;
      car.No := Trim(carNo);
      car.ChePaiColor := pcmd^.CarCpColor;
      dev := AGovDeviceManage.AddAGovDev(car);
    end
    else
    begin
      dev.Car.No := Trim(carNo);
      dev.car.ChePaiColor := pCmd^.CarCpColor;
    end;

    with pCmd^ do
    begin
      dev.isOnline := True;
      dev.IsEncrypted := pCmd^.GpsData.Encrypt = 1;
      dev.GpsTime := GetGovGpsTime(pCmd^.GpsData.Date, pCmd^.GpsData.Time);
      dev.Longitude := GpsData.Longitude / 1000000;
      dev.Latitude := GpsData.Latitude / 1000000;
      dev.Speed := GpsData.Speed * 10;
      dev.Speed_RunRec := GpsData.Speed_RunRec * 10;
      dev.Course := GpsData.TotalCourse;
      dev.Orientation := GpsData.Dir;
      dev.Altitude := GpsData.Altitude;

      tmpLW := GpsData.State; //取状态
      for i := 0 to 31 do             // 总共是32位，后面的数据保留
      begin
        dev.Switch[i] := (tmpLW and $1) = $1;
        tmpLW := tmpLW shr 1;
      end;

      tmpLW := GpsData.Alarm;  // 取报警标志
      for i := 0 to 31 do
      begin
        dev.Switch_Warning[i] := (tmpLW and $1) = $1;
        tmpLW := tmpLW shr 1;
      end;

      p := Project.LoLa2XY(EarthPoint(dev.Longitude, dev.Latitude));
      dev.Point := p;
    end;

    if Assigned(FOnGovGpsData) then
      FOnGovGpsData(dev);
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealGovGpsData_V3异常' + E.Message);
    end;
  end;
end;

procedure TGateWayServerCom.DealGovGpsDataCount_V3(ABuf: PByte);
var
  pCmd: PCmdGovGpsDataCount_V3;
  govInfo: TGovInfo;
  str: string;
begin
  try
    pCmd := PCmdGovGpsDataCount_V3(ABuf);
    govInfo := FGovInfoManage.Add(-1);
    govInfo.SrcCmdId := SRVTERM_GOV_GPSDATACOUNT;
    str := '政府平台下发' + inttostr(pCmd^.GpsDataCount) + '条车辆定位信息,从' + FormatDateTime('yyyy-MM-dd hh:nn:ss', GetGovAlarmGpsTime(pCmd^.STime)) + '到' + FormatDateTime('yyyy-MM-dd hh:nn:ss', GetGovAlarmGpsTime(pCmd^.ETime));
    govInfo.Msg := str;
    if Assigned(FOnGovInfo) then
      FOnGovInfo(govInfo);
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealGovGpsDataCount_V3异常' + E.Message);
    end;
  end;
end;

procedure TGateWayServerCom.DealGovTextInfo_V3(ABuf: PByte);
var
  pCmd: PCmdGovInfo_V3;
  govInfo: TGovInfo;
  str: string;
begin
  try
    pCmd := PCmdGovInfo_V3(ABuf);
  //  govInfo := FGovInfoManage.Add(pCmd^.MsgId);
    govInfo := FGovInfoManage.Add(-1);
    govInfo.SrcCmdId := SRVTERM_GOV_TEXTINFO;
    govInfo.ObjType := pCmd^.ObjType;
    govInfo.ObjId := pCmd^.ObjID;
    SetLength(str, pCmd^.MsgLen);
    CopyMemory(@str[1], PtrAdd(pCmd, SizeOf(TCmdGovInfo_V3)), pCmd^.MsgLen);
    govInfo.Msg := str;
    if Assigned(FOnGovInfo) then
      FOnGovInfo(govInfo);
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealGovTextInfo_V3异常' + E.Message);
    end;
  end;
end;

procedure TGateWayServerCom.SetOnGovInfo(const Value: TOnGovInfo);
begin
  FOnGovInfo := Value;
end;

function TGateWayServerCom.SendGovInfoReply(cmdFlag: Byte; objType: Integer;
  objId: TGovObjID; msgId: Integer; msg: string): Boolean;
var
  cmd: TCmdGovInfo_V3;
  buf: array of Byte;
  len: Integer;
  info: PCmdInfo;
begin
  len := SizeOf(TCmdGovInfo_V3) + Length(msg) + 1;
  InitHeader(cmd.Header, len, cmdFlag, BLANKDEVID);
  cmd.ObjType := objType;
  CopyMemory(@cmd.objId[0], @objId[0], Length(objId));
  cmd.MsgId := msgId;
  cmd.MsgLen := Length(msg);
  SetLength(buf, len);
  CopyMemory(@buf[0], @cmd, SizeOf(TCmdGovInfo_V3));
  CopyMemory(@buf[SizeOf(TCmdGovInfo_V3)], @msg[1], Length(msg));
  buf[len - 1] := GetXorSum(@buf[0], len - 1);
  Result := DirectSend(buf[0], len);

  info := ACmdManage.Add(cmd.Header.CmdOrder);
  info^.Id := Cmd.Header.CmdOrder;
  info^.State := CMD_SNDNODO;
  case cmdFlag of
    TERMSRV_REPLYGOVCHECKDUTY: info^.Desc := '回复平台查岗';
  else
    info^.Desc := '回复政府平台交互信息'
  end;

  info^.SendTime := now();
  info^.CancelTime := 0;
  info^.Replytime := 0;
  SetLength(info^.Content, cmd.Header.Size);
  Move(Buf[0], info^.Content[0], cmd.Header.Size);
  info^.ContentSize := cmd.Header.Size;
//  SaveCMD.CmdList.AddData(Cmd.header.Cmdorder, info);
end;


procedure TGateWayServerCom.SetOnGovAlarmInfo(
  const Value: TOnGovAlarmInfo);
begin
  FOnGovAlarmInfo := Value;
end;

procedure TGateWayServerCom.SetOnGovGpsData(const Value: TOnGovGpsData);
begin
  FOnGovGpsData := Value;
end;

procedure TGateWayServerCom.DealGovEndGpsData_V3(ABuf: PByte);
  function GetEndReason(reasonId: Integer): string;
  begin
    Result := '未知[' + IntToStr(reasonId) + ']';
    case reasonId of
      $00: Result := '车辆进入指定区域';
      $01: Result := '人工停止交换';
      $02: Result := '紧急监控完成';
      $03: Result := '车辆离线';
      $04: Result := '其它原因';
    end;
  end;  
var
  pCmd: PCmdGovStartGpsData_V3;
  govInfo: TGovInfo;
  str: string;
begin
  try
    pCmd := PCmdGovStartGpsData_V3(ABuf);
    govInfo := FGovInfoManage.Add(-1);
    govInfo.SrcCmdId := SRVTERM_GOV_ENDGPSDATA;
    SetLength(str, 21);
    CopyMemory(@str[1], @pCmd^.CarNo[0], 21);
    govInfo.Msg := '结束交换车辆定位信息:车牌号[' + Trim(str) + '],车牌颜色[' + GetCarCpColor(pCmd^.CarCpColor) + '],原因[' + GetEndReason(pCmd^.Reason) + ']';
    if Assigned(FOnGovInfo) then
      FOnGovInfo(govInfo);
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealGovEndGpsData_V3异常' + E.Message);
    end;
  end;
end;

procedure TGateWayServerCom.DealGovStartGpsData_V3(ABuf: PByte);
  function GetStartReason(reasonId: Integer): string;
  begin
    Result := '未知[' + IntToStr(reasonId) + ']';
    case reasonId of
      $00: Result := '车辆进入指定区域';
      $01: Result := '人工指定交换';
      $02: Result := '应急状态车辆信息回传';
      $03: Result := '其它原因';
    end;
  end;  
var
  pCmd: PCmdGovStartGpsData_V3;
  govInfo: TGovInfo;
  str: string;
begin
  try
    pCmd := PCmdGovStartGpsData_V3(ABuf);
    govInfo := FGovInfoManage.Add(-1);
    govInfo.SrcCmdId := SRVTERM_GOV_STARTGPSDATA;
    SetLength(str, 21);
    CopyMemory(@str[1], @pCmd^.CarNo[0], 21);
    govInfo.Msg := '开始交换车辆定位信息:车牌号[' + Trim(str) + '],车牌颜色[' + GetCarCpColor(pCmd^.CarCpColor) + '],原因[' + GetStartReason(pCmd^.Reason) + ']';
    if Assigned(FOnGovInfo) then
      FOnGovInfo(govInfo);
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealGovStartGpsData_V3异常' + E.Message);
    end;
  end;
end;

function TGateWayServerCom.SendGovApplyGpsData(carNo: string;
  carCpColor: Byte; sTime, eTime: TDateTime): Boolean;
var
  cmd: TCmdGovApplyGpsData_V3;
  buf: array of Byte;
  len: Integer;
  str: string;
  info: PCmdInfo;
begin
  len := SizeOf(TCmdGovApplyGpsData_V3) + 1;
  InitHeader(cmd.Header, len, TERMSRV_APPLYGPSDATA, BLANKDEVID);
  InitStr(str, 21);
  CopyMemory(@str[1], @carNo[1], Length(carNo));
  CopyMemory(@cmd.carNo[0], @str[1], 21);
  cmd.CarCpColor := carCpColor;
  str := FormatDateTime('yyyyMMddhhnnss', sTime);
  cmd.STime[0] := StrToInt('$'+ Copy(str, 1, 2));
  cmd.STime[1] := StrToInt('$'+ Copy(str, 3, 2));
  cmd.STime[2] := StrToInt('$'+ Copy(str, 5, 2));
  cmd.STime[3] := StrToInt('$'+ Copy(str, 7, 2));
  cmd.STime[4] := StrToInt('$'+ Copy(str, 9, 2));
  cmd.STime[5] := StrToInt('$'+ Copy(str, 11, 2));
  cmd.STime[6] := StrToInt('$'+ Copy(str, 13, 2));
  str := FormatDateTime('yyyyMMddhhnnss', eTime);
  cmd.ETime[0] := StrToInt('$'+ Copy(str, 1, 2));
  cmd.ETime[1] := StrToInt('$'+ Copy(str, 3, 2));
  cmd.ETime[2] := StrToInt('$'+ Copy(str, 5, 2));
  cmd.ETime[3] := StrToInt('$'+ Copy(str, 7, 2));
  cmd.ETime[4] := StrToInt('$'+ Copy(str, 9, 2));
  cmd.ETime[5] := StrToInt('$'+ Copy(str, 11, 2));
  cmd.ETime[6] := StrToInt('$'+ Copy(str, 13, 2));
  SetLength(buf, len);
  CopyMemory(@buf[0], @cmd, SizeOf(TCmdGovApplyGpsData_V3));
  buf[len - 1] := GetXorSum(@buf[0], len - 1);
  Result := DirectSend(buf[0], len);

  info := ACmdManage.Add(cmd.Header.CmdOrder);
  info^.Id := Cmd.Header.CmdOrder;
  info^.State := CMD_SNDNODO;
  info^.Desc := '申请交换指定车辆信息';
  info^.SendTime := now();
  info^.CancelTime := 0;
  info^.Replytime := 0;
  SetLength(info^.Content, cmd.Header.Size);
  Move(Buf[0], info^.Content[0], cmd.Header.Size);
  info^.ContentSize := cmd.Header.Size;
//  SaveCMD.CmdList.AddData(Cmd.header.Cmdorder, info);
end;

function TGateWayServerCom.SendGovCancelGpsData(carNo: string;
  carCpColor: Byte): Boolean;
var
  cmd: TCmdGovApplyGpsData_V3;
  buf: array of Byte;
  len: Integer;
  str: string;
  info: PCmdInfo;
begin
  len := SizeOf(TCmdGovApplyGpsData_V3) + 1;
  InitHeader(cmd.Header, len, TERMSRV_CANCELGPSDATA, BLANKDEVID);
  InitStr(str, 21);
  CopyMemory(@str[1], @carNo[1], Length(carNo));
  CopyMemory(@cmd.carNo[0], @str[1], 21);
  cmd.CarCpColor := carCpColor;
  SetLength(buf, len);
  CopyMemory(@buf[0], @cmd, SizeOf(TCmdGovApplyGpsData_V3));
  buf[len - 1] := GetXorSum(@buf[0], len - 1);
  Result := DirectSend(buf[0], len);

  info := ACmdManage.Add(cmd.Header.CmdOrder);
  info^.Id := Cmd.Header.CmdOrder;
  info^.State := CMD_SNDNODO;
  info^.Desc := '取消交换指定车辆信息';
  info^.SendTime := now();
  info^.CancelTime := 0;
  info^.Replytime := 0;
  SetLength(info^.Content, cmd.Header.Size);
  Move(Buf[0], info^.Content[0], cmd.Header.Size);
  info^.ContentSize := cmd.Header.Size;
//  SaveCMD.CmdList.AddData(Cmd.header.Cmdorder, info);
end;

procedure TGateWayServerCom.SetOnTSPDataUpload(
  const Value: TOnTSPDataUpload);
begin
  FOnTSPDataUpload := Value;
end;

function TGateWayServerCom.SendUploadMediaDataSingleTSP_V3(dev: TDevice;
  mediaId: LongWord; delFlag: Byte): Boolean;
var
  info: PCmdinfo;
  len: Word;
  acmd: TCmdTermSrvUploadMediaDataSingleTSP_V3;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
begin
  Result := false;
  if not isActive then exit;
  len := SizeOf(TCmdTermSrvUploadMediaDataSingleTSP_V3);
  InitTSPHeader(acmd.Header, len - TSPHEADERLEN, TERMSRV_MEDIADATAUPLOAD_SINGLE_V3, dev.Id);
  acmd.MediaId := ByteOderConvert_LongWord(mediaId);
  acmd.DelFlag := delFlag;

  tspPackSize := len + 3;
  SetLength(tspBuf, tspPackSize);
  offSet := 0;
  tspBuf[0] := FLAGTSP;
  Inc(offSet);
  CopyMemory(@tspBuf[offSet], @acmd, len);
  Inc(offSet, len);
  tspBuf[offSet] := GetXorSum(@tspBuf[1], len);
  Inc(offSet);
  tspBuf[offSet] := FLAGTSP;
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(dev, escapByteBuf);

  info^.Desc := '上传单条多媒体数据';
  Result := True;
end;

procedure TGateWayServerCom.DealDriverLogin_V3(ABuf: PByte;
  cmdNo: Integer);
var
  pcmd: PCmdSrvTermDriverLoginTSP_V3;
  p: PByte;
  len: Integer;
  driverLogInfo: TDriverLogInfo;
  str: string;
  devId: string;
  dev: TDevice;
  msgTitle, msgContent: string;
begin
  try
    pcmd := PCmdSrvTermDriverLoginTSP_V3(ABuf);
    devId := BCDToStr(@(pcmd^.Header.DevId[0]));
    dev := ADeviceManage.find(devId);
    if dev = nil then Exit;
    driverLogInfo.DriverInfo.DevId := devId;
    driverLogInfo.DriverInfo.CarNo := dev.Car.No;
    driverLogInfo.LogType := 0;
    driverLogInfo.GpsTime := GetGpsTime_BCD7(pcmd^.GpsTime);
    driverLogInfo.Longitude := ByteOderConvert_LongWord(pcmd^.Longitude) / 1000000;
    driverLogInfo.Latitude := ByteOderConvert_LongWord(pcmd^.Latitude) / 1000000;
    len := pcmd^.DriverNameLen;
    p :=  PtrAdd(ABuf, SizeOf(TCmdSrvTermDriverLoginTSP_V3));
    SetLength(str, len);
    CopyMemory(@str[1],p, len);
    driverLogInfo.DriverInfo.DriverName := Trim(str);
    p := PtrAdd(p, len);
    SetLength(str, 20);
    CopyMemory(@str[1], p, 20);
    driverLogInfo.DriverInfo.DriverIDNo := Trim(str);
    p := PtrAdd(p, 20);
    SetLength(str, 40);
    CopyMemory(@str[1], p, 40);
    driverLogInfo.DriverInfo.DriverServiceNo := Trim(str);
    p := PtrAdd(p, 40);
    len := PByte(p)^;
    p := PtrAdd(p, 1);
    CopyMemory(@str[1], p, len);
    driverLogInfo.DriverInfo.AgencyName := Trim(str);

    dev.Login_DriverName := driverLogInfo.DriverInfo.DriverName;
    dev.Login_Driver := driverLogInfo.DriverInfo.DriverIDNo;

    msgTitle := '驾驶员签到';
    msgContent := '驾驶员[' + driverLogInfo.DriverInfo.DriverName + '(' + driverLogInfo.DriverInfo.DriverIDNo + ')]于' + FormatDateTime('yyyy-MM-dd hh:nn:ss', driverLogInfo.GpsTime) + '在车辆[' + dev.Car.No + ']上签到';
    if Assigned(FOnDevKeyEvent) then
      FOnDevKeyEvent(dev, msgTitle, msgContent);
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealDriverLogin_V3异常' + E.Message);
    end;
  end;
end;

procedure TGateWayServerCom.DealDriverLogout_V3(ABuf: PByte;
  cmdNo: Integer);
var
  pcmd: PCmdSrvTermDriverLoginTSP_V3;
  p: PByte;
  len: Integer;
  driverLogInfo: TDriverLogInfo;
  str: string;
  devId: string;
  dev: TDevice;
  msgTitle, msgContent: string;
begin
  try
    pcmd := PCmdSrvTermDriverLoginTSP_V3(ABuf);
    devId := BCDToStr(@(pcmd^.Header.DevId[0]));
    dev := ADeviceManage.find(devId);
    if dev = nil then Exit;
    driverLogInfo.DriverInfo.DevId := devId;
    driverLogInfo.DriverInfo.CarNo := dev.Car.No;
    driverLogInfo.LogType := 0;
    driverLogInfo.GpsTime := GetGpsTime_BCD7(pcmd^.GpsTime);
    driverLogInfo.Longitude := ByteOderConvert_LongWord(pcmd^.Longitude) / 1000000;
    driverLogInfo.Latitude := ByteOderConvert_LongWord(pcmd^.Latitude) / 1000000;
    len := pcmd^.DriverNameLen;
    p :=  PtrAdd(ABuf, SizeOf(TCmdSrvTermDriverLoginTSP_V3));
    SetLength(str, len);
    CopyMemory(@str[1],p, len);
    driverLogInfo.DriverInfo.DriverName := Trim(str);
    p := PtrAdd(p, len);
    SetLength(str, 20);
    CopyMemory(@str[1], p, 20);
    driverLogInfo.DriverInfo.DriverIDNo := Trim(str);
    p := PtrAdd(p, 20);
    SetLength(str, 40);
    CopyMemory(@str[1], p, 40);
    driverLogInfo.DriverInfo.DriverServiceNo := Trim(str);
    p := PtrAdd(p, 40);
    len := PByte(p)^;
    p := PtrAdd(p, 1);
    CopyMemory(@str[1], p, len);
    driverLogInfo.DriverInfo.AgencyName := Trim(str);

    dev.Login_DriverName := '';
    dev.Login_Driver := '未登录';

    msgTitle := '驾驶员签退';
    msgContent := '驾驶员[' + driverLogInfo.DriverInfo.DriverName + '(' + driverLogInfo.DriverInfo.DriverIDNo + ')]于' + FormatDateTime('yyyy-MM-dd hh:nn:ss', driverLogInfo.GpsTime) + '在车辆[' + dev.Car.No + ']上签退';
    if Assigned(FOnDevKeyEvent) then
      FOnDevKeyEvent(dev, msgTitle, msgContent);
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealDriverLogout_V3异常' + E.Message);
    end;
  end;
end;

procedure TGateWayServerCom.DealTransportEnd_V3(ABuf: PByte;
  cmdNo: Integer);
var
  pcmd: PCmdSrvTermTransportStartTSP_V3;
  devId: string;
  dev: TDevice;
  eRunNoLen: Integer;
  eRunNo: string;
  msgTitle, msgContent: string;
  gpsTime: TDateTime;
  longX, latY: Double;
begin
  try
    pcmd := PCmdSrvTermTransportStartTSP_V3(ABuf);
    devId := BCDToStr(@(pcmd^.Header.DevId[0]));
    dev := ADeviceManage.find(devId);
    if dev = nil then Exit;
    gpsTime := GetGpsTime_BCD7(pcmd^.GpsTime);
    longX := ByteOderConvert_LongWord(pcmd^.Longitude) / 1000000;
    latY := ByteOderConvert_LongWord(pcmd^.Latitude) / 1000000;
    eRunNoLen := ByteOderConvert_Word(pcmd^.Header.CmdProperty) and $03FF - 15;
    SetLength(eRunNo, eRunNoLen);
    CopyMemory(@eRunNo[1], PtrAdd(ABuf, SizeOf(TCmdSrvTermTransportStartTSP_V3)), eRunNoLen);

    msgTitle := '结束运输';
    msgContent := '车辆[' + dev.Car.No + ']结束运输，结束时间:' + FormatDateTime('yyyy-MM-dd hh:nn:ss', gpsTime) + '经纬度:' + FormatFloat('#0.######', longX) + '、' + FormatFloat('#0.######', latY) + '任务运单号:' + eRunNo;
    if Assigned(FOnDevKeyEvent) then
      FOnDevKeyEvent(dev, msgTitle, msgContent);
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealTransportEnd_V3异常' + E.Message);
    end;
  end;
end;

procedure TGateWayServerCom.DealTransportStart_V3(ABuf: PByte;
  cmdNo: Integer);
var
  pcmd: PCmdSrvTermTransportStartTSP_V3;
  devId: string;
  dev: TDevice;
  eRunNoLen: Integer;
  eRunNo: string;
  msgTitle, msgContent: string;
  gpsTime: TDateTime;
  longX , latY: Double;
begin
  try
    pcmd := PCmdSrvTermTransportStartTSP_V3(ABuf);
    devId := BCDToStr(@(pcmd^.Header.DevId[0]));
    dev := ADeviceManage.find(devId);
    if dev = nil then Exit;
    gpsTime := GetGpsTime_BCD7(pcmd^.GpsTime);
    longX := ByteOderConvert_LongWord(pcmd^.Longitude) / 1000000;
    latY := ByteOderConvert_LongWord(pcmd^.Latitude) / 1000000;
    eRunNoLen := ByteOderConvert_Word(pcmd^.Header.CmdProperty) and $03FF - 15;
    SetLength(eRunNo, eRunNoLen);
    CopyMemory(@eRunNo[1], PtrAdd(ABuf, SizeOf(TCmdSrvTermTransportStartTSP_V3)), eRunNoLen);

    msgTitle := '开始运输';
    msgContent := '车辆[' + dev.Car.No + ']开始运输，开始时间:' + FormatDateTime('yyyy-MM-dd hh:nn:ss', gpsTime) + '经纬度:' + FormatFloat('#0.######', longX) + '、' + FormatFloat('#0.######', latY) + '任务运单号:' + eRunNo;
    if Assigned(FOnDevKeyEvent) then
      FOnDevKeyEvent(dev, msgTitle, msgContent);
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealTransportStart_V3异常' + E.Message);
    end;
  end;
end;

procedure TGateWayServerCom.SetOnDevKeyEvent(const Value: TOnDevKeyEvent);
begin
  FOnDevKeyEvent := Value;
end;

function TGateWayServerCom.SendGovAlarmDealReply(carNo: string;
  carCpColor: Byte; alarmIdManual: Integer; dealResult: Byte): Boolean;
var
  cmd: TCmdGovAlarmDealReply_V3;
  buf: array of Byte;
  len: Integer;
  str: string;
  info: PCmdInfo;
begin
  len := SizeOf(TCmdGovAlarmDealReply_V3) + 1;
  InitHeader(cmd.Header, len, TERMSRV_ALARMDEALREPLY, BLANKDEVID);
  InitStr(str, 21);
  CopyMemory(@str[1], @carNo[1], Length(carNo));
  CopyMemory(@cmd.carNo[0], @str[1], 21);
  cmd.CarCpColor := carCpColor;
  cmd.AlarmIdManual := alarmIdManual;
  cmd.DealResult := dealResult;
  SetLength(buf, len);
  CopyMemory(@buf[0], @cmd, SizeOf(TCmdGovAlarmDealReply_V3));
  buf[len - 1] := GetXorSum(@buf[0], len - 1);
  Result := DirectSend(buf[0], len);

//  info := ACmdManage.Add(cmd.Header.CmdOrder);
//  info^.Id := Cmd.Header.CmdOrder;
//  info^.State := CMD_SNDNODO;
//  info^.Desc := '主动上报报警处理结果';
//  info^.SendTime := now();
//  info^.CancelTime := 0;
//  info^.Replytime := 0;
//  SetLength(info^.Content, cmd.Header.Size);
//  Move(Buf[0], info^.Content[0], cmd.Header.Size);
//  info^.ContentSize := cmd.Header.Size;
end;

function TGateWayServerCom.SetAllDevParam_V3(Dev: TDevice;
  paramData: TByteDynArray; paramCount: Integer): Boolean;
var
  cmd: TCmdTSPSetDevParam_V3;//TCmdTermSrvSetDevParam_V3;//TCmdTermSrvSetDevParam_V2;
  buf: array of Byte;
  info: PCmdinfo;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
begin
  Result := false;
  if not isActive then exit;
  if dev = nil then Exit;
  tspPackSize := SizeOf(TCmdTSPSetAllDevParam_V3) + Length(paramData) + 1;//加1位校验码
  InitTSPHeader(cmd.TSPHeader, tspPackSize - TSPHEADERLEN - 1, TERMSRV_SETDEVPARAM_V3, dev.Id);
  cmd.ParamCnt := paramCount;
  SetLength(tspBuf, tspPackSize + 2);//整个完整的包需在包两端加标识位
  offSet := 0;
  tspBuf[offset] := FLAGTSP;//标识位
  Inc(offSet);

  CopyMemory(@tspBuf[offset], @cmd, SizeOf(TCmdTSPSetAllDevParam_V3));
  Inc(offSet, SizeOf(TCmdTSPSetAllDevParam_V3));

  CopyMemory(@tspBuf[offset], @paramData[0], Length(paramData));
  Inc(offSet, Length(paramData));

  tspBuf[offSet] := GetXorSum(@tspBuf[1], tspPackSize - 1);//从消息头开始，不包括标识位
  Inc(offSet);

  tspBuf[offSet] := FLAGTSP;//标识位
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(dev, escapByteBuf);
  GSetParamCmdID := info^.id;
  info^.State := CMD_SNDNODO;
  info^.Desc := dev.Car.No + '设置参数：';
  Result := True;
end;

function TGateWayServerCom.SendSetDriverInfo_Old(dev: TDevice; driverNo: Integer;
  driverLicense: string): Boolean;
var
  info: PCmdinfo;
  len: Word;
  acmd: TCmdTermSrvSetRunRecParamTSP_V3;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
  w: LongWord;
  rrParamBuf: array of Byte;//安装GB/T 19056 记录仪参数设置完整包
begin
  Result := false;
  if not isActive then exit;
//****************************完整的设置记录仪参数包****************************
  SetLength(rrParamBuf, 7 + 21);
  rrParamBuf[0] := $55;
  rrParamBuf[1] := $7A;
  rrParamBuf[2] := SETRUNRECPARAM_DRIVERNO_OLD;
  rrParamBuf[3] := $00;
  rrParamBuf[4] := Length(rrParamBuf) - 7;
  rrParamBuf[5] := $00;
  offSet := 6;

  w := ByteOderConvert_LongWord(driverNo);
  CopyMemory(@rrParamBuf[offset], PtrAdd(@w, 1), 3);
  Inc(offSet, 3);

  CopyMemory(@rrParamBuf[offset], @driverLicense[1], Length(driverLicense));
  Inc(offSet, 18);

  rrParamBuf[offSet] := GetXorSum(@rrParamBuf[0], Length(rrParamBuf) - 1);
//****************************完整的设置记录仪参数包****************************  

  len := SizeOf(TCmdTermSrvSetRunRecParamTSP_V3) + Length(rrParamBuf);
  InitTSPHeader(acmd.Header, len - TSPHEADERLEN, TERMSRV_SETRUNRECPARAM_V3, dev.Id);
  acmd.Flag := SETRUNRECPARAM_DRIVERNO_OLD;
  tspPackSize := len + 3;
  SetLength(tspBuf, tspPackSize);
  offSet := 0;
  tspBuf[0] := FLAGTSP;
  Inc(offSet);
  CopyMemory(@tspBuf[offSet], @acmd, SizeOf(TCmdTermSrvSetRunRecParamTSP_V3));
  Inc(offSet, SizeOf(TCmdTermSrvSetRunRecParamTSP_V3));

  CopyMemory(@tspBuf[offset], @rrParamBuf[0], Length(rrParamBuf));
  Inc(offSet, Length(rrParamBuf));

  tspBuf[offSet] := GetXorSum(@tspBuf[1], len);
  Inc(offSet);
  tspBuf[offSet] := FLAGTSP;
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(dev, escapByteBuf);
  info^.Desc := Dev.Car.No + ' 设置记录仪驾驶员代码、驾驶证号码';
end;

function TGateWayServerCom.SendSetCarInfo_Old(dev: TDevice; carVin, carNo,
  carType: string): Boolean;
var
  info: PCmdinfo;
  len: Word;
  acmd: TCmdTermSrvSetRunRecParamTSP_V3;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
  w: LongWord;
  rrParamBuf: array of Byte;//安装GB/T 19056 记录仪参数设置完整包
begin
  Result := false;
  if not isActive then exit;
//****************************完整的设置记录仪参数包****************************
  SetLength(rrParamBuf, 7 + 17 + 12 + 12);
  rrParamBuf[0] := $55;
  rrParamBuf[1] := $7A;
  rrParamBuf[2] := SETRUNRECPARAM_VINCARNOTYPE_OLD;
  rrParamBuf[3] := $00;
  rrParamBuf[4] := Length(rrParamBuf) - 7;
  rrParamBuf[5] := $00;
  offSet := 6;

  CopyMemory(@rrParamBuf[offset], @carVin[1], Length(carVin));
  Inc(offSet, 17);
  CopyMemory(@rrParamBuf[offset], @carNo[1], Length(carNo));
  Inc(offSet, 12);
  CopyMemory(@rrParamBuf[offset], @carType[1], Length(carType));
  Inc(offSet, 12);

  rrParamBuf[offSet] := GetXorSum(@rrParamBuf[0], Length(rrParamBuf) - 1);
//****************************完整的设置记录仪参数包****************************  

  len := SizeOf(TCmdTermSrvSetRunRecParamTSP_V3) + Length(rrParamBuf);
  InitTSPHeader(acmd.Header, len - TSPHEADERLEN, TERMSRV_SETRUNRECPARAM_V3, dev.Id);
  acmd.Flag := SETRUNRECPARAM_VINCARNOTYPE_OLD;
  tspPackSize := len + 3;
  SetLength(tspBuf, tspPackSize);
  offSet := 0;
  tspBuf[0] := FLAGTSP;
  Inc(offSet);
  CopyMemory(@tspBuf[offSet], @acmd, SizeOf(TCmdTermSrvSetRunRecParamTSP_V3));
  Inc(offSet, SizeOf(TCmdTermSrvSetRunRecParamTSP_V3));

  CopyMemory(@tspBuf[offset], @rrParamBuf[0], Length(rrParamBuf));
  Inc(offSet, Length(rrParamBuf));

  tspBuf[offSet] := GetXorSum(@tspBuf[1], len);
  Inc(offSet);
  tspBuf[offSet] := FLAGTSP;
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(dev, escapByteBuf);
  info^.Desc := Dev.Car.No + ' 设置记录仪车辆VIN号、车牌号、车辆分类';
end;

function TGateWayServerCom.SendSetRecorderTime_Old(dev: TDevice;
  time: TDateTime): Boolean;
var
  info: PCmdinfo;
  len: Word;
  acmd: TCmdTermSrvSetRunRecParamTSP_V3;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
  w: LongWord;
  dateBuf: array[0..5] of Byte;
  rrParamBuf: array of Byte;//安装GB/T 19056 记录仪参数设置完整包
begin
  Result := false;
  if not isActive then exit;
//****************************完整的设置记录仪参数包****************************
  SetLength(rrParamBuf, 7 + 6);
  rrParamBuf[0] := $55;
  rrParamBuf[1] := $7A;
  rrParamBuf[2] := SETRUNRECPARAM_TIME_OLD;
  rrParamBuf[3] := $00;
  rrParamBuf[4] := Length(rrParamBuf) - 7;
  rrParamBuf[5] := $00;
  offSet := 6;

  dateBuf[0] := StrToInt('$'+IntToStr(yearof(time)));
  dateBuf[1] := StrToInt('$'+IntToStr(MonthOf(time)));
  dateBuf[2] := StrToInt('$'+IntToStr(DayOf(time)));
  dateBuf[3] := StrToInt('$'+IntToStr(HourOf(time)));
  dateBuf[4] := StrToInt('$'+IntToStr(MinuteOf(time)));
  dateBuf[5] := StrToInt('$'+IntToStr(SecondOf(time)));
  CopyMemory(@rrParamBuf[offset], @dateBuf[0], 6);
  Inc(offset, 6);

  rrParamBuf[offSet] := GetXorSum(@rrParamBuf[0], Length(rrParamBuf) - 1);
//****************************完整的设置记录仪参数包****************************  

  len := SizeOf(TCmdTermSrvSetRunRecParamTSP_V3) + Length(rrParamBuf);
  InitTSPHeader(acmd.Header, len - TSPHEADERLEN, TERMSRV_SETRUNRECPARAM_V3, dev.Id);
  acmd.Flag := SETRUNRECPARAM_TIME_OLD;
  tspPackSize := len + 3;
  SetLength(tspBuf, tspPackSize);
  offSet := 0;
  tspBuf[0] := FLAGTSP;
  Inc(offSet);
  CopyMemory(@tspBuf[offSet], @acmd, SizeOf(TCmdTermSrvSetRunRecParamTSP_V3));
  Inc(offSet, SizeOf(TCmdTermSrvSetRunRecParamTSP_V3));

  CopyMemory(@tspBuf[offSet], @rrParamBuf[0], Length(rrParamBuf));
  Inc(offSet, Length(rrParamBuf));

  tspBuf[offSet] := GetXorSum(@tspBuf[1], len);
  Inc(offSet);
  tspBuf[offSet] := FLAGTSP;
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(dev, escapByteBuf);
  info^.Desc := Dev.Car.No + ' 设置记录仪时钟';
end;

function TGateWayServerCom.SendSetCarProperty_Old(dev: TDevice;
  carProperty: Integer): Boolean;
var
  info: PCmdinfo;
  len: Word;
  acmd: TCmdTermSrvSetRunRecParamTSP_V3;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
  w: LongWord;
  rrParamBuf: array of Byte;//安装GB/T 19056 记录仪参数设置完整包
begin
  Result := false;
  if not isActive then exit;

//****************************完整的设置记录仪参数包****************************
  SetLength(rrParamBuf, 7 + 3);
  rrParamBuf[0] := $55;
  rrParamBuf[1] := $7A;
  rrParamBuf[2] := SETRUNRECPARAM_CARCCC_OLD;
  rrParamBuf[3] := $00;
  rrParamBuf[4] := Length(rrParamBuf) - 7;
  rrParamBuf[5] := $00;
  offSet := 6;

  w := ByteOderConvert_LongWord(carProperty);
  CopyMemory(@rrParamBuf[offset], PtrAdd(@w, 1), 3);
  Inc(offset, 3);

  rrParamBuf[offSet] := GetXorSum(@rrParamBuf[0], Length(rrParamBuf) - 1);
//****************************完整的设置记录仪参数包****************************

  len := SizeOf(TCmdTermSrvSetRunRecParamTSP_V3) + Length(rrParamBuf);
  InitTSPHeader(acmd.Header, len - TSPHEADERLEN, TERMSRV_SETRUNRECPARAM_V3, dev.Id);
  acmd.Flag := SETRUNRECPARAM_CARCCC_OLD;
  tspPackSize := len + 3;
  SetLength(tspBuf, tspPackSize);
  offSet := 0;
  tspBuf[0] := FLAGTSP;
  Inc(offSet);
  CopyMemory(@tspBuf[offSet], @acmd, SizeOf(TCmdTermSrvSetRunRecParamTSP_V3));
  Inc(offSet, SizeOf(TCmdTermSrvSetRunRecParamTSP_V3));

  CopyMemory(@tspBuf[offSet], @rrParamBuf[0], Length(rrParamBuf));
  Inc(offSet, Length(rrParamBuf));

  tspBuf[offSet] := GetXorSum(@tspBuf[1], len);
  Inc(offSet);
  tspBuf[offSet] := FLAGTSP;
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(dev, escapByteBuf);
  info^.Desc := Dev.Car.No + ' 设置记录仪车辆特征系数';
end;

{ TCmdManage }

function TCmdManage.Add(const ACmdID: Integer): PCmdInfo;
var
  p: PCmdInfo;
begin
  New(p);
  p^.Id := ACmdID;
  FList.AddData(ACmdID, p);
  p^.SendV3 := False;
  p^.DeleteArea := False;
  Result := p;
  //如果多于SAVE_CMD_COUNT条，就删掉前面的。
  if FList.Count > SAVE_CMD_COUNT then
    delete(Items[0]^.Id);
end;

procedure TCmdManage.ClearCmd;
begin
  while count > 0 do
    Delete(Items[0].Id);
end;

constructor TCmdManage.Create;
begin
  FList := TIntegerList.Create;
end;

procedure TCmdManage.Delete(const ACmdID: Integer);
var
  i: Integer;
  p: PCmdInfo;
begin
  i := FList.IndexOf(ACmdID);
  if i >= 0 then
  begin
    p := FList.Datas[i];
    FList.Delete(i);
    Dispose(p);
  end;
end;

destructor TCmdManage.Destroy;
var
  i: Integer;
  p: PCmdInfo;
begin
  for i := 0 to FList.Count - 1 do
  begin
    p := FList.Datas[i];
    Dispose(p);
  end;
  FList.Free;
  inherited;
end;

function TCmdManage.Find(const ACmdID: Integer): PCmdInfo;
var
  i: Integer;
begin
  Result := nil;
  i := FList.IndexOf(ACmdID);
  if i >= 0 then
    Result := Items[i];
end;

function TCmdManage.FindByDevID(const DevID: string; MCUPicIndex: Integer): PCmdInfo;
var
  i: Integer;
begin
  Result := nil;
  for i:=0 to FList.Count - 1 do
  begin
    if (Items[i]^.DevId = DevID) and (Items[i]^.MCUPicIndex = MCUPicIndex) then
    begin
      Result := Items[i];
      break;
    end;
  end;
end;

function TCmdManage.GetCount: integer;
begin
  Result := FList.Count;
end;

function TCmdManage.GetItems(Index: Integer): PCmdInfo;
var p: PCmdInfo;
begin
  p := FList.Datas[Index];
  result := P;
 // Result := TCmdInfo(FList.Datas[Index]);
end;


procedure TCmdManage.SetMax_count(const Value: integer);
begin
  FMax_count := Value;
end;



//=======================================================//
//-------------------------------------------------------//
//            for _V2 第二版本用到的协议
//-------------------------------------------------------//
//=======================================================//





function TGateWayServerCom.CallTarget(const ATargetID: Integer): Boolean; //呼叫指定车辆
var
  cmd: TCmdTermSrvGetPosition;
  info: PCmdinfo;
  Dev: TDevice;
begin
//  Result := false;
//  if not isActive then exit;
//  cmd.Size := SizeOf(cmd);
//  cmd.Flag := TERMSRV_GETPOSITION;
//  cmd.CmdId := GetMaxCmdID;
//  cmd.DevId := ATargetID;
//  Result := DirectSend(cmd, cmd.Size);
//
//  info := ACmdManage.Add(cmd.CmdId);
//  info^.Id := cmd.CmdId;
//  info^.State := CMD_SNDNODO;
//  Dev := ADeviceManage.Find(ATargetID);
//  if Dev <> nil then
//  begin
//    info^.Desc := '呼叫车辆：' + Dev.Car.No;
//  end
//  else
//  begin
//    info^.Desc := '呼叫未知车辆';
//  end;
//  info^.SendTime := now();
//  info^.CancelTime := 0;
//  info^.Replytime := 0;
//  SetLength(info^.Content, cmd.Size);
//  Move(cmd, info^.Content[0], cmd.Size);
//  info^.ContentSize := cmd.Size;
end;

procedure TGateWayServerCom.DealGpsData_V3(ABuf: PByte); //处理Gps返回的数据
var
  D: TGpsData_V3;
begin
  if TransCmdGpsData(PCmdSrvtermGpsdata_V3(ABuf)^, d) then
  begin
    ADeviceManage.ReceiveGpsData_V3(@d, False);
  end;
end;

procedure TGateWayServerCom.DealLastGpsData_V3(ABuf: PByte);
var
  dev: TDevice;
  cmdId: Word;
  p: PCmdInfo;
  pFindPos: PCmdSrvTermFindPos_V3;
  ep: TEarthPoint;
  wp: TWorldPoint;

  sp: Tpoint;
  devCount: Integer;
  devIdGpsDataArr: TDevIDGpsDataArray;
  devIdGpsData: TDevGpsData_V3;
  i: Integer;
  pGpsData: PCmdSrvTermGpsDataTSP_V3;
  pB: PByte;
  offset: Integer;
  dataLen: Integer;
begin
  try
    //dev :=  ADeviceManage.find(BCDToStr(@PCmdSrvTermGpsData_V3(ABuf)^.Header.DevId[0]));
    pFindPos := PCmdSrvTermFindPos_V3(ABuf);
    cmdId := pFindPos^.Header.CmdOrder;
  //  p := ACmdManage.Find(cmdId);
  //  if p = nil then exit;

    {
      一个完整的数据包由以下几个组成：
      标识位 + 消息头 + 消息体 + 校验码 + 标识位
    }
    dataLen := pFindPos^.Header.Size;
    offset := SizeOf(THead_V3) + 1;
    while offset < dataLen do
    begin
      Inc(offset, 6);//偏移6个字节的设备号
      Inc(offset, 1);//偏移一个标识位
      pB := PtrAdd(ABuf, offset);//位置信息头开始
      pGpsData := PCmdSrvTermGpsDataTSP_V3(pB);
      DealGpsDataTSP_V3(pB, 0);
                        //头长度         //消息体得长度                                                //校验码 + 标识位
      offset := offset + TSPHEADERLEN +  ByteOderConvert_Word(pGpsData^.Header.CmdProperty) and $03FF + 1 + 1;//偏移一个完整的位置信息包
    end;
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealLastGpsData_V3异常' + E.Message);
    end;
  end;
end;

procedure TGateWayServerCom.DealPursuePostion_V3(ABuf: PByte);
var
  D: TGpsData_V3;
begin
  if TransCmdGpsData(PCmdSrvtermGpsdata_V3(ABuf)^, d) then
  begin
    ADeviceManage.ReceiveGpsData_V3(@d, False, True);
  end;
end;

procedure TGateWayServerCom.DealControlCar_V3(ABuf: PByte);
var
  d: TGpsData_V3;
  cmdId: Word;
  p: PCmdInfo;
begin
  cmdId := PCmdSrvtermControlCar_V3(ABuf)^.Header.CmdOrder;
  p := ACmdManage.Find(cmdId);
  if p = nil then Exit;

  if TransCmdGpsData(PCmdSrvtermControlCar_V3(ABuf)^, d) then
  begin
    ADeviceManage.ReceiveGpsData_V3(@d, False);
  end;

  p^.State := CMD_DONE;
  p^.Replytime := Now;

 //根据状态位判断控制是否成
  if ((p^.CarControlContent =0) and (d.State and $00001000 = $00000000)) or        //0解锁     //第12位
     ((p^.CarControlContent =1) and (d.State and $00001000 = $00001000)) then      // 1加锁
  begin
      PopMsg('车辆控制应答', p^.Desc + ' 成功');        //解锁
  end
  else
  begin
    PopMsg('车辆控制应答', p^.Desc + '不成功!');
  end;
end;

procedure TGateWayServerCom.DealFindPostion_V3(ABuf: PByte; cmdNo: Integer);
var
  dev: TDevice;
  cmdId: Word;
  p: PCmdInfo;
  pFindPos: PCmdSrvTermFindPosTSP_V3;

  d: TGpsData_V3;
  attachInfo: TByteDynArray;
  dataLen: Integer;//消息体长度
  pB: PByte;
begin
  p := ACmdManage.Find(cmdNo);
  if p = nil then exit;

  try
    //dev :=  ADeviceManage.find(BCDToStr(@PCmdSrvTermGpsData_V3(ABuf)^.Header.DevId[0]));
    pFindPos := PCmdSrvTermFindPosTSP_V3(ABuf);
  //  cmdId := pFindPos^.CmdSNo;
    if TransCmdGpsDataTSP(PCmdSrvTermFindPosTSP_V3(ABuf)^, d) then
    begin
      dataLen := ByteOderConvert_Word(PCmdSrvTermFindPosTSP_V3(ABuf)^.Header.CmdProperty);
      if dataLen = GPSDATABODYLEN + 2 then//消息体长度刚好等于Gps数据体长度 + 2位应答
        ADeviceManage.ReceiveGpsData_V3(@d, False)
      else if dataLen - (2 + 2) > GPSDATABODYLEN then//消息体长度大于Gps数据体长度，则有附加信息，且附加信息至少有3个字节的长度
      begin
        SetLength(attachInfo, dataLen - GPSDATABODYLEN);
        pB := PtrAdd(ABuf, SizeOf(TCmdSrvTermGpsDataTSP_V3));
        CopyMemory(@attachInfo[0], pB, dataLen - GPSDATABODYLEN);
        ADeviceManage.ReceiveGpsData_V3(@d, False, False, attachInfo);
      end;
    end;
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealFindPostion_V3异常' + E.Message);
    end;
  end;
end;

//-------------------------------------------------------------------------------------------

function TGateWayServerCom.PursueCar_V3(dev: TDevice; ShuXing: Byte; PursueInterval: word; JianGe: LongWord): boolean; //
var
  cmd: TCmdTermSrvPursueCarTSP_V3;//TCmdTermSrvSetDevParam_V3;//TCmdTermSrvSetDevParam_V2;
  buf: array of Byte;
  info: PCmdinfo;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
begin
  Result := false;
  if not isActive then exit;
  tspPackSize := SizeOf(TCmdTermSrvPursueCarTSP_V3)  + 1;//加1位校验码
  InitTSPHeader(cmd.Header, tspPackSize - TSPHEADERLEN - 1, TERMSRV_PURSUECAR_V3, Dev.Id);
  cmd.Interval := ByteOderConvert_Word(PursueInterval);
  cmd.Duration := ByteOderConvert_LongWord(JianGe);

  SetLength(tspBuf, tspPackSize + 2);//整个完整的包需在包两端加标识位
  offSet := 0;
  tspBuf[offset] := FLAGTSP;//标识位
  Inc(offSet);

  CopyMemory(@tspBuf[offset], @cmd, SizeOf(TCmdTermSrvPursueCarTSP_V3));
  Inc(offSet, SizeOf(TCmdTermSrvPursueCarTSP_V3));

  tspBuf[offSet] := GetXorSum(@tspBuf[1], tspPackSize - 1);//从消息头开始，不包括标识位
  Inc(offSet);

  tspBuf[offSet] := FLAGTSP;//标识位
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(Dev, escapByteBuf);

  if PursueInterval > 0 then
    info^.Desc := '临时位置跟踪：' + dev.Car.No
  else
    info^.Desc := '取消临时位置跟踪：' + dev.Car.No;
end;

function TGateWayServerCom.SendAntiFake_V3(dev: TDevice; Value: string; ShuXing: Word): Boolean;
var
  pCmd: PCmdSrvtermAntiFake_V3;
  info: PCmdinfo;
  Len: Integer;
  str: string;
  buff: array[0..1023] of byte;
  LatticeData1: array[0..31] of Byte;
  LatticeData2: array[0..31] of Byte;
  p: PByte;
begin
  Result := false;
  if not isActive then exit;
  FillChar(buff, 1024, 0);
  FillChar(LatticeData1, 32, 0);
  FillChar(LatticeData2, 32, 0);
  Len := SizeOf(TCmdSrvtermAntiFake_V3);
  pcmd := @buff[0]; //pcmd 指向buff 首址
  pCmd^.Size := Len;
  pCmd^.Flag := TERMSRV_MCU_V3;
  pCmd^.ExtendedFlag := 0;
//  pCmd^.FactID := dev.fact_id;
  pCmd^.DevID := DevId_StrToBCD(Dev.id);
  pCmd^.CmdID := GetMaxCmdID;

  pCmd^.TypeID := $05;
  pCmd^.DataType := ShuXing;

  //PcMD^.Fact_ID := $00;
  pCmd^.MCUFlag[0] := $00;
  pCmd^.MCUFlag[1] := $13;
  p := PtrAdd(@buff[0], sizeof(TCmdSrvtermAntiFake_V3)); //p 指向 buff 移过 已知结构后

  //InitStr(str, Length(Value));
  //CopyMemory(@str[1], @Value[1], Length(Value));
  ////CopyMemory(p, @Value[1], Length(Value));

  str := '    ';
  CopyMemory(@str[1], @Value[1], Length(Value));

  GetChineseLattice(copy(str, 1, 2), LatticeData1, 0);
  CopyMemory(p, @LatticeData1[0], Length(LatticeData1));
  p := PtrAdd(p, Length(LatticeData1));

  GetChineseLattice(copy(str, 3, 2), LatticeData2, 0);
  CopyMemory(p, @LatticeData2[0], Length(LatticeData2));
  p := PtrAdd(p, Length(LatticeData2));

  Pcmd^.Size := Integer(p) - Integer(@buff[0]);
  Result := DirectSend(buff[0], pCmd^.Size);

  info := ACmdManage.Add(pCmd^.CmdId);
  info^.Id := pCmd^.CmdId;
  info^.State := CMD_SNDNODO;
  info^.Desc := '发送防伪标志：' + dev.Car.No;

  info^.DevId := dev.id;
  info^.SendTime := now();
  info^.CancelTime := 0;
  info^.Replytime := 0;
  SetLength(info^.Content, pCmd^.Size);
  Move(buff[0], info^.Content[0], pCmd^.Size);
  info^.ContentSize := pCmd^.Size;
  
//  SaveCMD.CmdList.AddData(pCmd^.CmdId, info);
  {try
    bs.AddNewCmdLog(current_user.id, dev.fact_id, dev.id, TERMSRV_MCU_V3, info^.Desc);
  except
  end; }
end;

function TGateWayServerCom.SendAntiFake_V3_new(dev: TDevice; Value: TBitmap; ShuXing: Word): Boolean;
var
  pCmd: PCmdSrvtermAntiFake_V3;
  info: PCmdinfo;
  Len: Integer;
  str: string;
  buff: array[0..1023] of byte;
  LatticeData1: array[0..31] of Byte;
  LatticeData2: array[0..31] of Byte;
  p: PByte;
begin
  Result := false;
  if not isActive then exit;
  FillChar(buff, 1024, 0);
  FillChar(LatticeData1, 32, 0);
  FillChar(LatticeData2, 32, 0);
  Len := SizeOf(TCmdSrvtermAntiFake_V3);
  pcmd := @buff[0]; //pcmd 指向buff 首址
  pCmd^.Size := Len;
  pCmd^.Flag := TERMSRV_MCU_V3;
  pCmd^.ExtendedFlag := 0;
//  pCmd^.FactID := dev.fact_id;
  pCmd^.DevID := DevId_StrToBCD(Dev.id);
  pCmd^.CmdID := GetMaxCmdID;

  pCmd^.TypeID := $05;
  pCmd^.DataType := ShuXing;

  //PcMD^.Fact_ID := $00;
  pCmd^.MCUFlag[0] := $00;
  pCmd^.MCUFlag[1] := $13;
  p := PtrAdd(@buff[0], sizeof(TCmdSrvtermAntiFake_V3)); //p 指向 buff 移过 已知结构后

  //InitStr(str, Length(Value));
  //CopyMemory(@str[1], @Value[1], Length(Value));
  ////CopyMemory(p, @Value[1], Length(Value));

  str := ' ';
  GetChineseLattice(copy(str, 1, 2), LatticeData2, 0);
  CopyMemory(p, @LatticeData2[0], Length(LatticeData2));
  p := PtrAdd(p, 16{Length(LatticeData2)});



  GetBitampLattice(Value, LatticeData1, 0);
  CopyMemory(p, @LatticeData1[0], Length(LatticeData1));
  p := PtrAdd(p, Length(LatticeData1));

  {GetChineseLattice(Value, LatticeData2, 0);
  CopyMemory(p, @LatticeData2[0], Length(LatticeData2));
  p := PtrAdd(p, Length(LatticeData2));      }

  Pcmd^.Size := Integer(p) - Integer(@buff[0]);
  Result := DirectSend(buff[0], pCmd^.Size);

  info := ACmdManage.Add(pCmd^.CmdId);
  info^.Id := pCmd^.CmdId;
  info^.State := CMD_SNDNODO;
  info^.Desc := '发送防伪标志：' + dev.Car.No;

  info^.DevId := dev.id;
  info^.SendTime := now();
  info^.CancelTime := 0;
  info^.Replytime := 0;
  SetLength(info^.Content, pCmd^.Size);
  Move(buff[0], info^.Content[0], pCmd^.Size);
  info^.ContentSize := pCmd^.Size;

//  SaveCMD.CmdList.AddData(pCmd^.CmdId, info);
  {try
    bs.AddNewCmdLog(current_user.id, dev.fact_id, dev.id, TERMSRV_MCU_V3, info^.Desc);
  except
  end;  }
end;

function TGateWayServerCom.SendStopAntiFake_V3(dev: TDevice): Boolean;
var
  cmd: TCmdSrvtermStopAntiFake_V3;
  info: PCmdinfo;
  Len: Integer;
begin
  Result := false;
  if not isActive then exit;
  Len := SizeOf(TCmdSrvtermStopAntiFake_V3);

  Cmd.Size := Len;
  Cmd.Flag := TERMSRV_MCU_V3;
  cmd.ExtendedFlag := 0;
//  cmd.FactID := dev.fact_id;
  Cmd.DevID := DevId_StrToBCD(Dev.id);
  Cmd.CmdID := GetMaxCmdID;

  cmd.TypeId := $05;
  cmd.DataType := 0;

  //Cmd.Fact_ID := $00;
  cmd.MCUFlag[0] := $00;
  cmd.MCUFlag[1] := $14;
  Result := DirectSend(Cmd,Cmd.Size);

  info := ACmdManage.Add(cmd.CmdId);
  info^.Id := cmd.CmdId;
  info^.State := CMD_SNDNODO;

  info^.Desc := '停止显示防伪标志：' + dev.Car.No ;

  info^.DevId := dev.id;
  info^.SendTime := now();
  info^.CancelTime := 0;
  info^.Replytime := 0;
  SetLength(info^.Content, cmd.Size);
  Move(cmd, info^.Content[0], cmd.Size);
  info^.ContentSize := cmd.Size;

//  SaveCMD.CmdList.AddData(Cmd.CmdId, info);
  {try
    bs.AddNewCmdLog(current_user.id, dev.fact_id, dev.id, TERMSRV_MCU_V3, info^.Desc);
  except
  end;                                     }
end;

function TGateWayServerCom.SendBackCallTel_V3(dev: TDevice; Sign: Byte; TelNo: string): Boolean;
var
//  pCmd: PCmdSrvtermBackCallTel_V3;
//  len: Integer;
//  str: string;
  buff: array[0..1023] of byte;
  p: PByte;
  bufLen: Integer;
  msgContent: string;
  info: PCmdinfo;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
  pacmd: PCmdTermSrvCallBackTSP_V3;
  phone: string;
begin
  Result := false;
  if not isActive then exit;
  phone := TelNo;
  FillChar(buff, 1024, 0);
  pacmd := @buff[0];
  pacmd^.Flag := Sign;
  p := PtrAdd(@buff[0], SizeOf(TCmdTermSrvCallBackTSP_V3));
  CopyMemory(p, @phone[1], Length(phone));
  p := PtrAdd(p, Length(phone));
  bufLen := Integer(p) - Integer(@buff[0]);
  InitTSPHeader(pacmd^.Header, bufLen - TSPHEADERLEN, TERMSRV_CALLBACK_V3, dev.Id);

  tspPackSize := bufLen + 3;
  SetLength(tspBuf, tspPackSize);
  offSet := 0;
  tspBuf[0] := FLAGTSP;
  Inc(offSet);
  CopyMemory(@tspBuf[offSet], @buff[0], bufLen);
  Inc(offSet, bufLen);
  tspBuf[offSet] := GetXorSum(@buff[0], bufLen);
  Inc(offSet);
  tspBuf[offSet] := FLAGTSP;
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(dev, escapByteBuf);
  info^.Desc := '发送回拨电话：' + dev.Car.No + '[' + TelNo+']';
  if currAlarmInfo <> nil then
  begin
    info^.alarmInfoId := currAlarmInfo.Id;
    info^.alarmDealFlag := 1;
  end;


//  len := SizeOf(TCmdSrvtermBackCallTel_V3)+length(TelNo)+1;
//  pcmd := @buff[0]; //pcmd 指向buff 首址
//  InitHeader(pcmd^.Header,len,TERMSRV_BACKCALLTEL_V3,dev.Id);
//
//  pCmd^.Sign := Sign;
//  p := PtrAdd(@buff[0], sizeof(TCmdSrvtermBackCallTel_V3)); //p 指向 buff 移过 已知结构后
//
//  InitStr(str, Length(TelNo));
//  CopyMemory(@str[1], @TelNo[1], Length(TelNo));
//  CopyMemory(p, @str[1], Length(TelNo)+1);
//  p := PtrAdd(p, Length(TelNo)+1);
////  Pcmd^.Size := Integer(p) - Integer(@buff[0]);
//  Result := DirectSend(buff[0], len);
//
//  info := ACmdManage.Add(pCmd^.header.CmdOrder);
////  info^.Id := pCmd^.CmdId;
//  info^.State := CMD_SNDNODO;
//  info^.Desc := '发送回拨电话：' + dev.Car.No + '[' + TelNo+']';
//
//  info^.DevId := dev.id;
//  info^.SendTime := now();
//  info^.CancelTime := 0;
//  info^.Replytime := 0;
//  SetLength(info^.Content,len);
//  Move(buff[0], info^.Content[0], len);
//  info^.ContentSize := len;
//
//  SaveCMD.CmdList.AddData(pCmd^.Header.CmdOrder, info);
  {try
    bs.AddNewCmdLog(current_user.id, dev.fact_id, dev.id, TERMSRV_BACKCALLTEL_V3, info^.Desc + ' ' + TelNo);
  except
  end;   }
end;

function TGateWayServerCom.SendControlCar_V3(dev: TDevice; Control: Byte; ControlCmd: Byte): Boolean;
var
  Cmd: TCmdtermSrvControlCar_V3;
  info: PCmdinfo;
  len: Word;
  acmd: TCmdTermSrvDevControlTSP_V3;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
begin
  Result := false;
  if not isActive then exit;
  len := SizeOf(TCmdTermSrvDevControlTSP_V3);
  InitTSPHeader(acmd.Header, len - TSPHEADERLEN, TERMSRV_DEVCONTROL_V3, dev.Id);
  acmd.ControlCmd := ControlCmd;
  tspPackSize := len + 3;
  SetLength(tspBuf, tspPackSize);
  offSet := 0;
  tspBuf[0] := FLAGTSP;
  Inc(offSet);
  CopyMemory(@tspBuf[offSet], @acmd, len);
  Inc(offSet, len);
  tspBuf[offSet] := GetXorSum(@tspBuf[1], len);
  Inc(offSet);
  tspBuf[offSet] := FLAGTSP;
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(dev, escapByteBuf);
  if ControlCmd =0 then
    info^.Desc := '车门解锁'+Dev.Car.No
  else if ControlCmd =1 then
    info^.Desc := '车门加锁'+Dev.Car.No;
  info^.CarControlContent := ControlCmd;

//  InitHeader(Cmd.Header,SizeOf(TCmdtermSrvControlCar_V3),TERMSRV_CONTROLCAR_V3,dev.Id);
////  Cmd.Control := Control;
//  Cmd.ControlCmd := ControlCmd;
//
//  Result := DirectSend(Cmd, Cmd.Header.Size);
//
//  info := ACmdManage.Add(Cmd.Header.CmdOrder);
////  info^.Id := Cmd.CmdId;
//  info^.State := CMD_SNDNODO;
//  if ControlCmd =0 then
//    info^.Desc := '车门解锁'+Dev.Car.No
//  else if ControlCmd =1 then
//    info^.Desc := '车门加锁'+Dev.Car.No;
//
//  info^.DevId := Dev.Id;
//  info^.SendTime := now();
//  info^.CancelTime := 0;
//  info^.Replytime := 0;
//  SetLength(info^.Content, Cmd.Header.Size);
//  Move(Cmd, info^.Content[0], Cmd.Header.Size);
//  info^.ContentSize := Cmd.Header.Size;
//
//  info^.CarControlContent := ControlCmd;
//  SaveCMD.CmdList.AddData(Cmd.Header.CmdOrder, info);
  {try
    bs.AddNewCmdLog(current_user.id, dev.fact_id, dev.id, TERMSRV_CONTROLCAR_V3, info^.Desc);
  except
  end; }
end;

function TGateWayServerCom.SendInfoServer_V3(dev: TDevice; Sign: Byte; Value: string; isShowTip: Boolean = True): Boolean;
var
  Len: Integer;
  str: string;
  buff: array[0..1023] of byte;
  p: PByte;
  bufLen: Integer;
  msgContent: string;
  pacmd: PCmdTermSrvSendInfoTSP_V3;
  info: PCmdinfo;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
begin
  Result := false;
  if not isActive then exit;
  FillChar(buff, 1024, 0);
  msgContent := Value;
  pacmd := @buff[0];
  pacmd^.InfoType := Sign;
  pacmd^.InfoLen := ByteOderConvert_Word(Length(msgContent));
//  pacmd^.PackCount := pacmd^.InfoLen;
  p := PtrAdd(@buff[0], SizeOf(TCmdTermSrvSendInfoTSP_V3));
  CopyMemory(p, @msgContent[1], Length(msgContent));
  p := PtrAdd(p, Length(msgContent));
  bufLen := Integer(p) - Integer(@buff[0]);
  InitTSPHeader(pacmd^.Header, bufLen - TSPHEADERLEN, TERMSRV_SENDINFO_V3, dev.Id);

  tspPackSize := bufLen + 3;
  SetLength(tspBuf, tspPackSize);
  offSet := 0;
  tspBuf[0] := FLAGTSP;
  Inc(offSet);
  CopyMemory(@tspBuf[offSet], @buff[0], bufLen);
  Inc(offSet, bufLen);
  tspBuf[offSet] := GetXorSum(@buff[0], bufLen);
  Inc(offSet);
  tspBuf[offSet] := FLAGTSP;
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(dev, escapByteBuf);
  if not isShowTip then
  begin//定时发送的服务信息不显示应答信息
    ACmdManage.Delete(info^.Id);
  end
  else
    info^.Desc := '发送信息服务：' + dev.Car.No;

//  Len := SizeOf(TCmdSrvtermInfoServer_V3);
//  pcmd := @buff[0]; //pcmd 指向buff 首址
//  pCmd^.Size := Len;
//  pCmd^.Flag := TERMSRV_INFOSERVER_V3;
//  pCmd^.ExtendedFlag := 0;
////  pCmd^.FactID := dev.fact_id;
//  pCmd^.DevID :=DevId_StrToBCD(Dev.id);
//  pCmd^.CmdID := GetMaxCmdID;
//  pCmd^.Sign := Sign;
//  p := PtrAdd(@buff[0], sizeof(TCmdSrvtermInfoServer_V3)); //p 指向 buff 移过 已知结构后
//
//  InitStr(str, Length(Value));
//  CopyMemory(@str[1], @Value[1], Length(Value));
//  CopyMemory(p, @str[1], Length(Value)+1);
//  p := PtrAdd(p, Length(Value)+1);
//  Pcmd^.Size := Integer(p) - Integer(@buff[0]);
//  Result := DirectSend(buff[0], pCmd^.Size);
//
//  info := ACmdManage.Add(pCmd^.CmdId);
//  info^.Id := pCmd^.CmdId;
//  info^.State := CMD_SNDNODO;
//  info^.Desc := '发送信息服务：' + dev.Car.No;
//
//  info^.DevId := dev.id;
//  info^.SendTime := now();
//  info^.CancelTime := 0;
//  info^.Replytime := 0;
//  SetLength(info^.Content, pCmd^.Size);
//  Move(buff[0], info^.Content[0], pCmd^.Size);
//  info^.ContentSize := pCmd^.Size;
end;

function TGateWayServerCom.SendQueryPicture_V3(dev: TDevice; CameraIndex: Byte; Reason: Byte; beginDataTime: string;
                            endDateTime: string; timeBool: Boolean): Boolean;
var
  dateTime: TDateTime;
  info: PCmdinfo;
  len: Word;
  acmd: TCmdTermSrvQueryMediaTSP_V3;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
begin
  Result := false;
  if not isActive then exit;
  len := SizeOf(TCmdTermSrvQueryMediaTSP_V3);
  InitTSPHeader(acmd.Header, len - TSPHEADERLEN, TERMSRV_QUERYMEDIADATA_V3, dev.Id);
  acmd.MediaType := 0;
  acmd.CameraIndex := CameraIndex;
  acmd.Reason := Reason;
  if timeBool = True then
  begin
    dateTime := StrToDateTime(FormatDatetime('yyyy-mm-dd hh:nn:ss',StrToDateTime(beginDataTime)));
    acmd.SDateTime[0] := StrToInt('$'+Copy(IntToStr(yearof(dateTime)),3,2));
    acmd.SDateTime[1] := StrToInt('$'+IntToStr(MonthOf(dateTime)));
    acmd.SDateTime[2] := StrToInt('$'+IntToStr(DayOf(dateTime)));
    acmd.SDateTime[3] := StrToInt('$'+IntToStr(HourOf(dateTime)));
    acmd.SDateTime[4] := StrToInt('$'+IntToStr(MinuteOf(dateTime)));
    acmd.SDateTime[5] := StrToInt('$'+IntToStr(SecondOf(dateTime)));
    dateTime := StrToDateTime(FormatDatetime('yyyy-mm-dd hh:nn:ss',StrToDateTime(endDateTime)));
    acmd.EDateTime[0] := StrToInt('$'+Copy(IntToStr(yearof(dateTime)),3,2));
    acmd.EDateTime[1] := StrToInt('$'+IntToStr(MonthOf(dateTime)));
    acmd.EDateTime[2] := StrToInt('$'+IntToStr(DayOf(dateTime)));
    acmd.EDateTime[3] := StrToInt('$'+IntToStr(HourOf(dateTime)));
    acmd.EDateTime[4] := StrToInt('$'+IntToStr(MinuteOf(dateTime)));
    acmd.EDateTime[5] := StrToInt('$'+IntToStr(SecondOf(dateTime)));
  end
  else
  begin
    FillChar(acmd.SDateTime, 6, 0);
    FillChar(acmd.EDateTime, 6, 0);
  end;
  tspPackSize := len + 3;
  SetLength(tspBuf, tspPackSize);
  offSet := 0;
  tspBuf[0] := FLAGTSP;
  Inc(offSet);
  CopyMemory(@tspBuf[offSet], @acmd, len);
  Inc(offSet, len);
  tspBuf[offSet] := GetXorSum(@tspBuf[1], len);
  Inc(offSet);
  tspBuf[offSet] := FLAGTSP;
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(dev, escapByteBuf);

  info^.PictureType := 0;
  case Reason of
    0: info^.Reason := '中心主动拍照';
    1: info^.Reason := '定时拍照';
    2: info^.Reason := '抢劫报警拍照';
    3: info^.Reason := '碰撞侧翻报警拍照';
    4: info^.Reason := '疲劳报警拍照';
  else
    info^.Reason := '未知';
  end;
  info^.Desc := '发送存储图片检索命令：' + Dev.Car.No + ' ' + info^.Reason;
end;

function TGateWayServerCom.SendQueryAudio_V3(dev: TDevice; channelId: Byte; Reason: Byte; beginDataTime: string;
                                  endDateTime: string; timeBool: Boolean): Boolean;
var
  dateTime: TDateTime;
  info: PCmdinfo;
  len: Word;
  acmd: TCmdTermSrvQueryMediaTSP_V3;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
begin
  Result := false;
  if not isActive then exit;
  len := SizeOf(TCmdTermSrvQueryMediaTSP_V3);
  InitTSPHeader(acmd.Header, len - TSPHEADERLEN, TERMSRV_QUERYMEDIADATA_V3, dev.Id);
  acmd.MediaType := 1;
  acmd.CameraIndex := channelId;
  acmd.Reason := Reason;
  if timeBool = True then
  begin
    dateTime := StrToDateTime(FormatDatetime('yyyy-mm-dd hh:nn:ss',StrToDateTime(beginDataTime)));
    acmd.SDateTime[0] := StrToInt('$'+Copy(IntToStr(yearof(dateTime)),3,2));
    acmd.SDateTime[1] := StrToInt('$'+IntToStr(MonthOf(dateTime)));
    acmd.SDateTime[2] := StrToInt('$'+IntToStr(DayOf(dateTime)));
    acmd.SDateTime[3] := StrToInt('$'+IntToStr(HourOf(dateTime)));
    acmd.SDateTime[4] := StrToInt('$'+IntToStr(MinuteOf(dateTime)));
    acmd.SDateTime[5] := StrToInt('$'+IntToStr(SecondOf(dateTime)));
    dateTime := StrToDateTime(FormatDatetime('yyyy-mm-dd hh:nn:ss',StrToDateTime(endDateTime)));
    acmd.EDateTime[0] := StrToInt('$'+Copy(IntToStr(yearof(dateTime)),3,2));
    acmd.EDateTime[1] := StrToInt('$'+IntToStr(MonthOf(dateTime)));
    acmd.EDateTime[2] := StrToInt('$'+IntToStr(DayOf(dateTime)));
    acmd.EDateTime[3] := StrToInt('$'+IntToStr(HourOf(dateTime)));
    acmd.EDateTime[4] := StrToInt('$'+IntToStr(MinuteOf(dateTime)));
    acmd.EDateTime[5] := StrToInt('$'+IntToStr(SecondOf(dateTime)));
  end
  else
  begin
    FillChar(acmd.SDateTime, 6, 0);
    FillChar(acmd.EDateTime, 6, 0);
  end;
  tspPackSize := len + 3;
  SetLength(tspBuf, tspPackSize);
  offSet := 0;
  tspBuf[0] := FLAGTSP;
  Inc(offSet);
  CopyMemory(@tspBuf[offSet], @acmd, len);
  Inc(offSet, len);
  tspBuf[offSet] := GetXorSum(@tspBuf[1], len);
  Inc(offSet);
  tspBuf[offSet] := FLAGTSP;
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(dev, escapByteBuf);

  info^.PictureType := 1;
  case Reason of
    0: info^.Reason := '中心主动录音';
    1: info^.Reason := '定时录音';
    2: info^.Reason := '抢劫报警录音';
    3: info^.Reason := '碰撞侧翻报警录音';
    4: info^.Reason := '疲劳报警录音';
  else
    info^.Reason := '未知';
  end;
  info^.Desc := '发送音频数据检索命令：' + Dev.Car.No + ' ' + info^.Reason;
end;

function TGateWayServerCom.SendUpPicture_V3(dev: TDevice; CameraIndex: Byte; beginDataTime: string;
                                  endDateTime: string; deleteSign: Byte): Boolean;
var
  Cmd: TCmdSrvtermUpPicture_V3;
  info: PCmdinfo;
  dateTime: TDateTime;
begin
  Result := false;
  if not isActive then exit;
  Cmd.Size := SizeOf(TCmdSrvtermUpPicture_V3);
  Cmd.Flag := TERMSRV_UPPICTURE_V3;
  Cmd.ExtendedFlag := 0;
//  Cmd.FactID := dev.fact_id;
  Cmd.DevID := DevId_StrToBCD(Dev.id);
  Cmd.CmdID := GetMaxCmdID;
  Cmd.CameraIndex := CameraIndex;
  dateTime := StrToDateTime(FormatDatetime('yyyy-mm-dd hh:nn:ss',StrToDateTime(beginDataTime)));
  Cmd.beginDateTime[0] := StrToInt('$'+Copy(IntToStr(yearof(dateTime)),3,2));
  Cmd.beginDateTime[1] := StrToInt('$'+IntToStr(MonthOf(dateTime)));
  Cmd.beginDateTime[2] := StrToInt('$'+IntToStr(DayOf(dateTime)));
  Cmd.beginDateTime[3] := StrToInt('$'+IntToStr(HourOf(dateTime)));
  Cmd.beginDateTime[4] := StrToInt('$'+IntToStr(MinuteOf(dateTime)));
  Cmd.beginDateTime[5] := StrToInt('$'+IntToStr(SecondOf(dateTime)));
  dateTime := StrToDateTime(FormatDatetime('yyyy-mm-dd hh:nn:ss',StrToDateTime(endDateTime)));
  Cmd.endDateTime[0] := StrToInt('$'+Copy(IntToStr(yearof(dateTime)),3,2));
  Cmd.endDateTime[1] := StrToInt('$'+IntToStr(MonthOf(dateTime)));
  Cmd.endDateTime[2] := StrToInt('$'+IntToStr(DayOf(dateTime)));
  Cmd.endDateTime[3] := StrToInt('$'+IntToStr(HourOf(dateTime)));
  Cmd.endDateTime[4] := StrToInt('$'+IntToStr(MinuteOf(dateTime)));
  Cmd.endDateTime[5] := StrToInt('$'+IntToStr(SecondOf(dateTime)));
  Cmd.DeleteSign := deleteSign;
  Result := DirectSend(Cmd, Cmd.Size);

  info := ACmdManage.Add(Cmd.CmdId);
  info^.Id := Cmd.CmdId;
  info^.State := CMD_SNDNODO;
  info^.Desc := '发送存储图片上传命令：' + Dev.Car.No;
  info^.DevId := Dev.Id;
  info^.SendTime := now();
  info^.CancelTime := 0;
  info^.Replytime := 0;
  SetLength(info^.Content, Cmd.Size);
  Move(Cmd, info^.Content[0], Cmd.Size);
  info^.ContentSize := Cmd.Size;

//  SaveCMD.CmdList.AddData(Cmd.CmdId, info);
end;

function TGateWayServerCom.SendUpPicture_V3_New(dev: TDevice; PictureType: Byte; PictrueId: Integer): Boolean;
var
  Cmd: TCmdSrvtermUpPicture_V3_New;
  info: PCmdinfo;
  dateTime: TDateTime;
begin
  Result := false;
  if not isActive then exit;
  Cmd.Size := SizeOf(TCmdSrvtermUpPicture_V3_New);
  Cmd.Flag := TERMSRV_UPPICTURE_V3;
  Cmd.ExtendedFlag := 0;
//  Cmd.FactID := dev.fact_id;
  Cmd.DevID := DevId_StrToBCD(Dev.id);
  Cmd.CmdID := GetMaxCmdID;
  Cmd.PictureType := PictureType;
  Cmd.PictureId := PictrueId;
  Result := DirectSend(Cmd, Cmd.Size);

  info := ACmdManage.Add(Cmd.CmdId);
  info^.Id := Cmd.CmdId;
  info^.State := CMD_SNDNODO;
  info^.Desc := '发送存储照片/音频上传命令：' + Dev.Car.No;
  info^.DevId := Dev.Id;
  info^.SendTime := now();
  info^.CancelTime := 0;
  info^.Replytime := 0;
  info^.ClientUpPic := True;
  info^.MCUPicIndex := PictrueId;
  SetLength(info^.Content, Cmd.Size);
  Move(Cmd, info^.Content[0], Cmd.Size);
  info^.ContentSize := Cmd.Size;

//  SaveCMD.CmdList.AddData(Cmd.CmdId, info);
end;


function TGateWayServerCom.SendPolling_MCU_V3(dev: TDevice): Boolean;
var
  Cmd: TCmdErmTSerPolling_MCU_V3;
  info: PCmdinfo;
  p: PByte;
begin
  Result := false;
  if not isActive then exit;
  Cmd.Size := SizeOf(TCmdErmTSerPolling_MCU_V3);
  Cmd.Flag := TERMSRV_POLLING_MCU_V3;
  Cmd.ExtendedFlag := 0;
//  Cmd.FactID := dev.fact_id;
  Cmd.DevID := DevId_StrToBCD(Dev.id);
  Cmd.CmdID := GetMaxCmdID;

  Result := DirectSend(Cmd, Cmd.Size);

  info := ACmdManage.Add(Cmd.CmdId);
  info^.Id := Cmd.CmdId;
  info^.State := CMD_SNDNODO;
  info^.Desc := '车辆巡检：' + Dev.Car.No;
  info^.DevId := Dev.Id;
  info^.SendTime := now();
  info^.CancelTime := 0;
  info^.Replytime := 0;
  SetLength(info^.Content, Cmd.Size);
  Move(Cmd, info^.Content[0], Cmd.Size);
  info^.ContentSize := Cmd.Size;

//  SaveCMD.CmdList.AddData(Cmd.CmdId, info);  
end;


function TGateWayServerCom.Send_V3(dev: TDevice; Flag: Byte; MCUType: Byte; param: string): Boolean;
  function StrToBuf(param: string; len: Integer): Variant;
  var
    i, j: Integer;
    buf: array of Byte;
  begin
    //j := len div 2;
    SetLength(buf, len);
    for i:=0 to Len-1 do
    begin
      buf[i] := StrToInt('$' + copy(param,i*2+1,2));
      //j := j + 1;
    end;
    Result := buf;
  end;
var
  Cmd: PCmdSrvtermSend_V3;
  info: PCmdinfo;
  p: PByte;
  dateTime: TDateTime;
  len: Integer;
  Buf: array of Byte;
  buff: array[0..1023] of byte;
begin
  Result := false;
  if not isActive then exit;
  FillChar(buff, 1024, 0);

  len := Length(param) - 4;
  len := len div 2;
  SetLength(Buf, len);

  cmd := @buff[0]; //pcmd 指向buff 首址
  Cmd^.Size := 16 + len;
  Cmd^.Flag := Flag;//TERMSRV_TSM_V3; //TERMSRV_METER_V3;// //TERMSRV_SEND_V3;
  Cmd^.ExtendedFlag := 0;
//  Cmd^.FactID := dev.fact_id;
  Cmd^.DevID := DevId_StrToBCD(Dev.id);
  Cmd^.CmdID := GetMaxCmdID;
  Cmd^.TypeId := MCUType;//TSM_TYPEID;       // METER_TYPEID;//
  Cmd^.DataType := 0;

  Cmd^.MCUFlag := ByteOderConvert_Word(StrToInt('$' + Copy(param, 1, 4)));

  param := Copy(param, 5, length(param));

  Buf := StrToBuf(param, len);
  
  p := PtrAdd(@buff[0], sizeof(TCmdSrvtermSend_V3)); //p 指向 buff 移过 已知结构后

  CopyMemory(p, @Buf[0], len);
  p := PtrAdd(p, len);
  cmd^.Size := Integer(p) - Integer(@buff[0]);

  Result := DirectSend(buff[0], Cmd.Size);

  frmSend.Memo2.Text := MemFormatUnit.BuffToHex(@Buff[0], Cmd.Size);

  info := ACmdManage.Add(Cmd.CmdId);
  info^.Id := Cmd.CmdId;
  info^.State := CMD_SNDNODO;
  info^.Desc := '用户自定义指令：' + Dev.Car.No;
  info^.DevId := Dev.Id;
  info^.SendTime := now();
  info^.CancelTime := 0;
  info^.Replytime := 0;
  info^.SendV3 := True;
  SetLength(info^.Content, Cmd.Size);
  Move(Cmd, info^.Content[0], Cmd.Size);
  info^.ContentSize := Cmd.Size;

//  SaveCMD.CmdList.AddData(Cmd.CmdId, info);
end;
              

function TGateWayServerCom.SetDevParam_V3(ATargetID: string; ParamID: word; Param: Pointer; ParamSize: integer): boolean;
var
  cmd: TCmdTSPSetDevParam_V3;//TCmdTermSrvSetDevParam_V3;//TCmdTermSrvSetDevParam_V2;
  buf: array of Byte;
  info: PCmdinfo;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
  dev: TDevice;
begin
  Result := false;
  if not isActive then exit;
  dev := ADeviceManage.find(ATargetID);
  if dev = nil then Exit;
  tspPackSize := SizeOf(TCmdTSPSetDevParam_V3) + ParamSize + 1;//加1位校验码
  InitTSPHeader(cmd.TSPHeader, tspPackSize - TSPHEADERLEN - 1, TERMSRV_SETDEVPARAM_V3, ATargetID);
  cmd.ParamCnt := 1;
//  cmd.ParamPackCnt := 1;
  cmd.ParamId := ByteOderConvert_LongWord(ParamID);
  cmd.ParamSize := ParamSize;
  SetLength(tspBuf, tspPackSize + 2);//整个完整的包需在包两端加标识位
  offSet := 0;
  tspBuf[offset] := FLAGTSP;//标识位
  Inc(offSet);

  CopyMemory(@tspBuf[offset], @cmd, SizeOf(TCmdTSPSetDevParam_V3));
  Inc(offSet, SizeOf(TCmdTSPSetDevParam_V3));

  CopyMemory(@tspBuf[offset], param, ParamSize);
  Inc(offSet, ParamSize);

  tspBuf[offSet] := GetXorSum(@tspBuf[1], tspPackSize - 1);//从消息头开始，不包括标识位
  Inc(offSet);

  tspBuf[offSet] := FLAGTSP;//标识位
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(dev, escapByteBuf);
  GSetParamCmdID := info^.id;
  info^.State := CMD_SNDNODO;
  info^.Desc := '设置参数：' + ReturnParamName(ParamID) + '：' + dev.Car.No;
  Result := True;
end;

function TGateWayServerCom.ReadDevParam_V3(dev: TDevice;
  AParamId: word): boolean;
var
  cmd: TCmdTSPReadDevParam_V3;
  buf: array of Byte;
  info: PCmdinfo;
  tspBuf: array of Byte;//透传的完整包
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
begin
  Result := false;
  if not isActive then exit;
  tspPackSize := SizeOf(TCmdTSPReadDevParam_V3) + 1;//加1位校验码
  InitTSPHeader(cmd.TSPHeader, tspPackSize - TSPHEADERLEN - 1, TERMSRV_READDEVPARAM_V3, dev.Id);
//  cmd.ParamId := ByteOderConvert_Word(AParamId);
  SetLength(tspBuf, tspPackSize + 2);//整个完整的包需在包两端加标识位
  offSet := 0;
  tspBuf[offset] := FLAGTSP;//标识位
  Inc(offSet);

  CopyMemory(@tspBuf[offset], @cmd, SizeOf(TCmdTSPReadDevParam_V3));
  Inc(offSet, SizeOf(TCmdTSPReadDevParam_V3));

  tspBuf[offSet] := GetXorSum(@tspBuf[1], tspPackSize - 1);//从消息头开始，不包括标识位
  Inc(offSet);

  tspBuf[offSet] := FLAGTSP;//标识位
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(dev, escapByteBuf);
  GReadParamCmdID := info^.Id;
  info^.State := CMD_SNDNODO;
  info^.Desc := '读车机参数：' + dev.Car.No;
  Result := True;
end;

end.

