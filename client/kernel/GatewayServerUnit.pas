{���ܼ�ض� ��  ���ص�ͨѶ
 @created(2004-03-19)
 @lastmod(GMT:$Date: 2012/12/31 05:06:19 $) <BR>
 ��������:$Author: wfp $<BR>
 ��ǰ�汾:$Revision: 1.3 $<BR>}

 {2005.03.25
   ԭ�������ص����� ���ö�ʱ�������Ϊ�̣߳�
      ��������յ��������õ�Ӧ��ʱ����д�뵽���ݿ⣬����UpdateDevPrm����ʱ�����
   �� �ٽ��̴߳��� ��Ϊ��ʱ������ȷ��
 }
unit GatewayServerUnit;

interface
uses
  CmdStructUnit, Windows, Winsock, extctrls, sysutils, ScktCompUnit, math, SyncObjs,
  CarUnit, ConstDefineUnit, IntegerListUnit, ScktComp, Types, BusinessServerUnit,
  classes, {OrderUnit, SendOrderMiniFrmUnit,} WleiConstDefineUnit, ConfineAreaUnit,
  MetaDefine, Service, LatticesUnit, Graphics, SystemLog, ActiveX, DisposeCarUnit;

const
  SAVE_CMD_COUNT = 300; //������������ִ�е�������Ϣ

type

  TSendMsg = procedure(ADevID: string; AType: Byte; MsgStr: string) of object;
  //�յ������ϴ���һ����Ƭ
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
  {��ȡ�������ڴ洢����Ƭʱ�䷶Χ sha 20090120
    ABuf ������Ƭ������Ŀǰ����12��}
  TReadDevPicTimesInfoRet = procedure (ADev: TDevice;ANoPicBj:Boolean;
    FirstDateTime,LastDateTime:String;ABuf:PByte;BufCount:Integer)of object;
   {�յ������ϴ����ȵ�״̬�仯}
  TOnRcvDevUploadAttemperStateChgEvent = procedure (AttemperId:Integer)of object;
  TSendRegUser = procedure(backNumber: integer) of object; //����ע����Ϣ
  TOnDriverCancelOrder = procedure(orderId: Integer; reasonId: Byte) of object;
  TOnAreaAlarmUpload = procedure(dev: TDevice; area: TBaseArea; alarmType: Byte) of object;//����Χ�������ϴ�
  TOnERunDataUpload = procedure(eRunData: TERunDataUpload) of object;//�����˵�
  TOnDriverInfoUpload = procedure(driverInfo: TDriverInfoUpload) of object;//��ʻԱ�����Ϣ�ɼ��ϱ�
  TOnTSPDataUpload = procedure(dev: TDevice; msgType: Integer; msg: string) of object;// ͸�������ϴ�
  TOnMediaEventUpload = procedure(mediaEvent: RecMediaEventUpload) of object;//��ý���¼���Ϣ�ϴ�
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

  TCmdInfo = record //������Ϣ
    Id: integer; //����ID
    Dev: TDevice;
    Flag: integer; //����ʲô����;
    DevId: String; //����ID
    State: Byte; //0��ʾ�ѷ���δִ�У�1��ʾ��ִ�У�2��ʾִ�г���3��ʾ���û�ȡ�� , 4��ʾ��ȡ��,5��ʾȡ��ʧ�ܣ�6��ʾ�ط�  7-��ɾ����8-����� 9-��ʱ 10-��ʾ�Ѿ����͵�SMS���ͷ�����
    Desc: string; //��������
    SendTime: Tdatetime; //����ʱ��
    Replytime: Tdatetime; //ִ����ʱ��
    CancelTime: Tdatetime; //��ȡ��ʱ��
    Content: TByteDynArray; //�����������
    ContentSize: Integer;
    addesc: integer; //���״̬
    AnswerList: TIntegerList;
    QuestionInfo: string;
    DeleteArea: Boolean;
    IsDeleteArea: Boolean;//ɾ�������복���Ķ��չ�ϵ���Ƿ�����ݿ�͵�ͼ��ɾ��������
    AreaList: TStringList;
    DeleteAdInfo: Boolean;
    AdInfo: string;
    PictureType: Byte;
    ClientUpPic: Boolean;
    MCUPicIndex: Integer;
    SendV3: Boolean;
    Reason: string; // ��������/��Ƶ��ԭ��
    MsgId: Integer;
    CarControlContent:Byte;//������������
    areaId: Integer;//���õ�����������ID
    areaSetType: Byte;//1:���� 2��׷�� 3���޸�  (Э�����������ã�0:���� 1��׷�� 2���޸� )
    alarmInfoId: Integer;
    alarmDealFlag: Byte;//��������ķ�ʽ 1������ 2������ 3���ı� 
//    isNoTips: Boolean;// ����ʾ������ʾ
  end;
  PCmdInfo = ^TCmdInfo;

  //-------------���������
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

    function Add(const ACmdID: Integer): PCmdInfo; //--���һ������
    function Find(const ACmdID: Integer): PCmdInfo; //  Ѱ��һ������
    function FindByDevID(const DevID: string; MCUPicIndex: Integer): PCmdInfo; // Ѱ��һ������
    procedure Delete(const ACmdID: Integer); //  ɾ��һ������
    procedure ClearCmd; //�����������}
    property count: integer read GetCount; //---���������
    property Max_count: integer read FMax_count write SetMax_count; //----������������;
    property Items[Index: Integer]: PCmdInfo read GetItems; //======�����������  ��Ϣ
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
    function SendComVer: Boolean; //����ͨѶЭ��汾
    function LoginToServer: Boolean; // �û���¼���ط�����
    procedure InitHeader(var header:THead_V3;size:Word;cmdFlag:Byte;devId:string);
    procedure InitHeaderHRB(var header:THeadHRB_V3;size:Word;cmdFlag:Byte;devId:string);
    procedure InitTSPHeader(var header: TCmdTSPHead_V3; size: Word; cmdFlag: Word; devId: string);
    procedure InitTSPHeaderHRB(var header: TCmdTSPTHeadHRB_V3; size: Word; cmdFlag: Word; devId: string);
    function GetMaxCmdID: Integer; // ��õ�ǰ���õ���������ID
    function GetMaxCmdIdWord: Word;// ��õ�ǰ���õ���������ID
    function DirectSend(var buf; ABufSize: Integer): Boolean; //�����ڲ��ķ��ͺ���ֱ�ӷ�������
    procedure DealReceiveData; virtual; //���� ���յ��ķ���������,������Ҫ�Ƿּ칤��
    procedure DisposeReceiveData;
    procedure DisposeOhterReceiveData;
    procedure DealRegUserData(ABuf: PByte); //����ע���û����ظ�����
    {function TransSendToDTECmd <br>
     תΪ �����ӵ�������DTE�������� ��������
     @Adata : TByteDynArray �û���������
     @Return: TByteDynArray ��������ͷβ��У��
    }
    function TransSendToDTECmd(Adata: TByteDynArray): TByteDynArray;
    //for _V2
    procedure DealReadAreaForDev(ABuf: PByte); //�����ȡ����Χ��
    procedure DealDeleteAreaList(ABuf: PByte); //����ȡ������Χ��
    procedure DealGetAreamIDArea(ABuf: PByte); //����õ�����ID��

  public
    //constructor Create(CreateSuspended: Boolean);
    constructor Create;
    destructor Destroy; override;
    //destructor Destroy; override;
    function RepeatSend(ACmdId: integer): boolean;

    { Procedure: GetLastPos<br>
     ���һ������������λ��
     @param const ATargetID: Integer ָ���ĳ���ID
     @Return Boolean
     @see @link()}
    function GetLastPos(const ADeviceID: Integer; SaveToCmdManage: boolean = true): Boolean;
   { Procedure: GetAllPos<br>
     ������еĳ���������λ��
     @Return Boolean
     @see @link()}
    function GetAllPos(SaveToCmdManage: boolean = false): Boolean;
   { Procedure: GetStat<br>
     ���Ŀ���״̬����
     @param const ATargetID: Integer Ŀ���ID
     @Return Boolean
     @see @link()}
    function GetStat(const ADeviceID: Integer): Boolean;
   { Procedure: CallTarget<br>
     ����ָ���ĳ���----//����ָ������
     @param const ATargetID: Integer; Ŀ��ID
     @param const AFreq: Word ����Ƶ�� ÿ����S�ر�һ������
     @param const AHoldTime: Word; ���г�����ʱ��
     @param const AnAvailTime: Byte ���������Ч�ڣ����ӣ�����ʱûִ�о�ȡ��
     @Return Boolean
     @see @link()}
    function CallTarget(const ATargetID: Integer): Boolean; overload;
    function CallTarget(const ATargetID: Integer; const AFreq, AHoldTime: Word; const AnAvailTime: Byte): Boolean; overload;
   { Procedure: ControlTarget<br>
     ���з��ز���
     @param const ATargetID: Integer; Ŀ��ID
     @param const ASwitch: Byte; ����ID
     @param const ASwitchStat: Boolean ����״̬ True Ϊ���� FalseΪ�Ͽ�
     @Return Boolean
     @see @link()}
    function ControlTarget(const ATargetID: Integer; const ASwitch: Byte; const ASwitchStat: Boolean): Boolean;
    { Procedure: PingServer<br>
     �����������Ӳ��԰�
     @Return Boolean
     @see @link()}
    function PingServer: Boolean;
    //ȡ������ִ�л��������б��е�����
    function CancelCmd(ACmdToboCancelId: integer): boolean;
    //�����ӵ�������DTE��������
    function SendToDTE(const ADeviceID: integer; Adata: TByteDynArray): boolean;

    //���ͼ����Ϣ���豸
//    function SendMsg2Dev(const ADeviceID,AMsgType:integer;const AMsgContent: String):boolean;
  protected // for _v3
    procedure DealGPSData_v3(ABuf: PByte);
    procedure DealLastGpsData_V3(ABuf: PByte);
    procedure DealFindPostion_V3(ABuf: PByte; cmdNo: Integer);
    procedure DealPursuePostion_V3(ABuf: PByte);
    procedure DealControlCar_V3(ABuf: PByte);
    procedure DealReadDevParam_V3(ABuf: PByte);
    //�յ� ͨ������Ӧ��
    procedure DealTYData_v3(ABuf: PByte);
    procedure DealLogin_In_V3(ABuf: PByte);
    procedure DealLogin_In_V3_9F(ABuf: PByte);
    procedure DealLogin_Out_V3(ABuf: PByte);
    //���� �ϴ��¼�����
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
//-------------------------------����ƽ̨����-------------------------------
    procedure DealAlarmSupervise_V3(ABuf: PByte);
    procedure DealCheckDuty_V3(ABuf: PByte);
    procedure DealGovTextInfo_V3(ABuf: PByte);
    procedure DealGovEarlyWarning_V3(ABuf: PByte);
    procedure DealGovAlarm_V3(ABuf: PByte);
    procedure DealGovGpsDataCount_V3(ABuf: PByte);
    procedure DealGovGpsData_V3(ABuf: PByte);
    procedure DealGovStartGpsData_V3(ABuf: PByte);
    procedure DealGovEndGpsData_V3(ABuf: PByte);
//-------------------------------����ƽ̨����-------------------------------
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
    function LogOutFromGateway(): Boolean;//��������ע��
    function SendTYRet(devId: string; cmdSNo: LongWord; cmdId: Byte; ret: Byte): Boolean;//�ظ�ͨ��Ӧ��
    function GetDevOnLineStatus(): Boolean;//��ȡ��������״̬
    function SendCmdTSP_V3(dev: TDevice; tspByteBuf: TByteDynArray): PCmdInfo;//����͸������
    function SendCmdTSPHRB_V3(devId: string; tspByteBuf: TByteDynArray): PCmdInfo;//����͸������
    function SendRecordTSP_V3(dev: TDevice; recFlag: Byte; recTime: Word; recSaveFlag: Byte; recSRate: Byte): Boolean;
    function SendUploadMediaDataTSP_V3(dev: TDevice; mediaType: Byte; mediaChannel: Byte; mediaReason: Byte; sDateTime, eDateTime: TDateTime; delFlag: Byte): Boolean;
    function SendUploadMediaDataSingleTSP_V3(dev: TDevice; mediaId: LongWord; delFlag: Byte): Boolean;
    function SendTSPData_V3(dev: TDevice; dataType: Byte; tspData: string): Boolean;
    function SetDevParam_V3(ATargetID: string; ParamID: word; Param: Pointer; ParamSize: integer): boolean;
    function SetAllDevParam_V3(dev: TDevice; paramData: TByteDynArray; paramCount: Integer): Boolean;
    function ReadDevParam_V3(dev: TDevice; AParamId: word): boolean;
    function SendSetLineToDev_V3(dev: TDevice; polyLineArea: TPolyLineArea): Boolean;
    function SendCollectRunRecData_V3(dev: TDevice; flag: Byte): Boolean;
    function SendSetRecorderCarNo(dev: TDevice; carVin, carNo, carType: string): Boolean;           //��¼��  ���ó���VIN�š����ƺš���������
    function SendSetRecorderTime(dev: TDevice; time: TDateTime): Boolean;                           //��¼��  ����ʱ��
    function SendSetInstallTime(dev: TDevice; time: TDateTime): Boolean;                            //��¼��  ���ó��ΰ�װʱ��
    function SendSetStatusParamName(dev: TDevice; sAry: TStringDynArray): Boolean;                  //��¼��  ����״̬�����ò���
    function SendSetPluse(dev: TDevice; pluse: Word): Boolean;                                      //��¼��  ��������ϵ��
    function SendSetInitMileage(dev: TDevice; initMileage: Integer): Boolean;                       //��¼��  ���ó�ʼ���

    function SendSetDriverInfo_Old(dev: TDevice; driverNo: Integer; driverLicense: string): Boolean;//��¼�� �� ���ü�ʻԱ��Ϣ
    function SendSetCarInfo_Old(dev: TDevice; carVin, carNo, carType: string): Boolean;             //��¼�� �� ���ó���VIN�š����ƺš���������
    function SendSetRecorderTime_Old(dev: TDevice; time: TDateTime): Boolean;                       //��¼�� �� ����ʱ��
    function SendSetCarProperty_Old(dev: TDevice; carProperty: Integer): Boolean;                   //��¼�� �� ���ó�������ϵ��

    function SendEmergencyAlarmDeal(dev: TDevice; dealFlag: Byte): Boolean;//���ͽ������������� dealFlag: 0: ȷ�ϱ���  1���������

//*****************************����ƽ̨���*********************************
    function SendReplyAlarmSupverise(adevId: string; acarNo: string; alarmId: Integer; ret: Byte; alarmType: Word): Boolean;//�㱨���챨��������
    function SendGovInfoReply(cmdFlag: Byte; objType: Integer; objId: TGovObjID; msgId: Integer; msg: string): Boolean;//����ƽ̨��Ϣ�ظ�
    function SendGovApplyGpsData(carNo: string; carCpColor: Byte; sTime, eTime: TDateTime): Boolean; //������ƽ̨���뽻��������λ��Ϣ
    function SendGovCancelGpsData(carNo: string; carCpColor: Byte): Boolean;//������ƽ̨ȡ������������λ��Ϣ
    function SendGovAlarmDealReply(carNo: string; carCpColor: Byte; alarmIdManual: Integer; dealResult: Byte): Boolean;
//*****************************����ƽ̨���*********************************

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
    function SetInfoMenu_V3(ADevice: TDevice): Boolean; overload; {������Ϣ�˵�}
    function SetInfoMenu_V3(ADevice: TDevice; InfoTypeList: TIntegerList; setType: Integer): Boolean; overload; {������Ϣ�˵�}
    function SetClassInfoMenu_V3(ADevice: TDevice): Boolean;  {�����ܱ���Ϣ����˵�}
//    function SendOrder_V3(AOrder: TOrder): boolean; {���Ͷ���}
    function SendVideo_V3(dev: TDevice; msstream: TMemoryStream): Boolean; {�·���Ƶ}
    //���ó�����Բ�ε���Χ��
    function SendSetCircleArea_New_V3(Dev: TDevice; CircleArea: TCircleArea; setType: Byte): boolean;
    // ���ó����ľ��ε���Χ��
    function SendSetRectangleArea_New_V3(Dev: TDevice; RectangleArea: TRectangleArea; setType: Byte): Boolean;
    // ���ó���������ͼ�ε���Χ��
    function SendSetNoSymbolArea_New_V3(Dev: TDevice; NoSymbolArea: TNoSymbolArea): Boolean;
    function RemoveAlarm_V3(ATargetId: string): boolean; {�������}
    function ConfirmEarlyWarning_V3(ATargetId: string): Boolean;    {ȷ�ϳ���Ԥ��}
    function CancelEarlyWarning_V3(ATargetId: string): Boolean;
    // ɾ��ָ����Բ������
    function SendDeleteAreaListForDev_V3(Flag: Word; Dev: TDevice; AreaList: TStringList;IsDelAreaFromDB: Boolean): Boolean;
    // Զ�ָ̻�MCU�³�����ʼֵ
    function SendInitializeMCU_V3(Dev: TDevice): Boolean;
    // Զ�̿���MCU��λ
    function SendControlMCU_V3(Dev: TDevice): Boolean;
    // �ն˿���
    function SendControlTerminal_V3(Dev: TDevice; ControlID:byte; controlParam:string=''): Boolean;
    function SendControlMcu_V3_Wl(Dev: TDevice;ControlID:byte): Boolean;

    //��������ʱ���͵��ı���Ϣ
    function SendControlInfo_Alarm_V3(msgID: Integer; Adev:TDevice;
                                            AControlInfo: string; AInfoLen:
                                            Integer; ControlCmd: Byte
                                            ;needSave:Boolean = false): Boolean;
    // ��ȡ�������һ����λ����
    function SendGetEndPostion(): Boolean;


    function SetTelList(ADevice: TDevice): boolean; overload; {���ó����绰��}
    function SetTelList(ADevice: TDevice; telList: TIntegerList; setType: Byte): boolean; overload; {���ó����绰��}
    function SetEventList(ADevice: TDevice; eventList: TIntegerList; setType: Byte): Boolean; overload; {���ó����¼�}
    function SetEventList(ADevice: TDevice; setType: Byte): Boolean; overload; {���ó����¼�}

    function ReturnParamName(ParamID: integer): string;

    function SendHeartToGataway(): Boolean; {����}
    //�·�����
    function SetAnswerList(ADevice: TDevice; info: string; AnswerList: TIntegerList; MsgId: Integer; ControlCmd: Byte): Boolean;

    //��������
    function GetAPicture(Dev: TDevice; CameraIndex: Byte; CameraCmd: Word; PZSJJG: Word;
                         SaveSign: Byte; GetPicSize: Byte; TXZL: Byte; LD: Byte;
                         DBD: Byte; BHD: Byte; SD: Byte): boolean;

    function UpdateDevFirmware(ATargetID: string; AUpdateDevType: byte; AURL: string; AURLLen: Integer): boolean; {���������̼�����}


  public //-------------for V2 ------------------------//

    procedure SendHeart;

   //���ó����ĵ���Χ��
    function SendCLIENT_SETELCFENCE(Dev: TDevice; AreaID: word; kindAlarm: byte;
      overSpeedAlarm: byte; lying: byte; kindArea: byte; len: word; param: array of byte): boolean;
   //��ȡ��������Χ��
    function SendReadAreaListForDev(Dev: TDevice): boolean;
   //ȡ������Χ��
    function SendDeleteAreaListForDev(Dev: TDevice; Area: array of byte): integer;
    //��ȡ��Ƭʱ�䷶Χ
//    function ReadPicTimesInfo(ADev:TDevice):boolean;
    //��ȡ�洢����Ƭ
//    function ReadThePic(ADev:TDevice;AReadDateTime:TDateTime;AReadPicCountType,AReadPicType:Byte):boolean;
    //��ֹ�ϴ������洢����Ƭ
//    function StopUploadSavedPic(ADev:TDevice):Boolean;
    //�·�������������ı����ȿ�����Ϣ
//    function SendControlCmdTxt(ATargetID: Integer; AControlInfo: string;
//      AInfoLen, MsgID: integer;  AControlCmd: Byte;isAddToCmdList: boolean= true): boolean;
    //�������汾(������)
//    function ReadDevVersion_Extend(Dev: TDevice): boolean;
//    ��ȡ���� �绰��
//    function ReadDevTelList(ADev:TDevice):Boolean;
//    function ReadDevDisplayFixedMenu(ADev:TDevice):Boolean;
    //�������
//    function UpdateDevFirmware_Sms(ADev: TDevice; AURL: string; AURLLen: Integer): boolean;
//    function SetCutOilElec_Sms(ADev: TDevice; Option: byte): boolean;
//    function SetDevParam_Sms(ATargetID: integer; ParamID: word; Param: Pointer; ParamSize: integer): boolean;
//    function RemoveAlarm_Sms(ADev:TDevice):Boolean;
//    function SetDevRestart(ADev: TDevice):Boolean;

//    function SetEmptyCarWord(Dev: TDevice; wordtype: byte; wordEdit: byte; wordInfo: string): boolean;
//    function SendOrder(AOrder: TOrder): boolean;

    property Host: string read FHost write SetHost; // Server Host ���ȼ���}
    property Address: string read FAddress write SetAddress; //Server Address IP ADDRESS
    property Port: Integer read FPort write SetPort;
    property UserId: Integer read FUserId write SetUserId;
    property UserPass: string read FUserPass write SetUserPass; //Register User Password
    property Active: Boolean read GetActive write SetActive; // Active��ʾ�˺ͷ�����������״̬
    property AutoLogin: Boolean read FAutoLogin write SetAutoLogin; // ����ͷ������Ͽ��Ƿ��Զ����µ�¼}
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
  TSPHEADERLEN = SizeOf(TCmdTSPHead_V3);//͸����ͷ�ĳ���
  GPSDATABODYLEN = SizeOf(TCmdSrvTermGpsDataTSP_V3) - TSPHEADERLEN;//��λ���ݳ�ͷ����ĳ���

// ��ת�巢�͵������е������ַ�
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

function IntToBCD(Value: Integer): TDEV_ID_BCD_V3; //��������ת��ΪBCD��
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

function BCDToInt(ABuff:Pointer): Integer; // ��BCD�ַ���ת��Ϊ����
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

function BCDToStr(ABuff: Pointer): string; // ��BCD�ֽ�����ת��Ϊ�ַ���
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
    ANew.Orientation := ByteOderConvert_Word(AOrg.Orientation);// * 2; //Anew.Orientation��λ���� || Aorg.Orientation��λ��2��
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
    ANew.Orientation := ByteOderConvert_Word(AOrg.Orientation); //Anew.Orientation��λ���� || Aorg.Orientation��λ��2��
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
    ANew.Orientation := ByteOderConvert_Word(AOrg.Orientation); //Anew.Orientation��λ���� || Aorg.Orientation��λ��2��
    ANew.GpsTime := GetGpsTime(AOrg.GpsTime);
    ANew.State := ByteOderConvert_LongWord(AOrg.State);
    ANew.WarningSign := ByteOderConvert_LongWord(AOrg.WarningSign);
  except
    Result := False;
  end;
end;

{ TGateWayServerCom }

function TGateWayServerCom.CallTarget(const ATargetID: Integer;
  const AFreq, AHoldTime: Word; const AnAvailTime: Byte): Boolean; //����ָ������
var
  cmd: TCmdTermsrvCalldev;
  info: PCmdinfo;
begin
//  ==============�����ز�����ʱ,���ܷ���....
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
//  info^.Desc := '���г�����' + ADeviceManage.Find(ATargetID).Car.No;
//  info^.SendTime := now();
//  info^.CancelTime := 0;
//  info^.Replytime := 0;
//  SetLength(info^.Content, cmd.Size);
//  Move(cmd, info^.Content[0], cmd.Size);
//  info^.ContentSize := cmd.Size;
end;

function TGateWayServerCom.CancelCmd(ACmdToboCancelId: integer): boolean; // ȡ������ִ�л��������б��е�����
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
//  p^.State := CMD_CANCELByUSER; //���û�ȡ��
//  p^.CancelTime := now();
//
//  p := ACmdManage.Add(cmd.CmdId);
//  p^.Id := cmd.CmdId;
//  p^.State := CMD_SNDNODO;
//  p^.Desc := 'ȡ�����' + IntToStr(ACmdToboCancelId);
//  p^.SendTime := now();
//  p^.CancelTime := 0;
//  p^.Replytime := 0;
//  SetLength(p^.Content, cmd.Size);
//  Move(cmd, p^.Content[0], cmd.Size);
//  p^.ContentSize := cmd.Size;

end;

function TGateWayServerCom.ControlTarget(const ATargetID: Integer;
  const ASwitch: Byte; const ASwitchStat: Boolean): Boolean; //���س���
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
//  info^.Desc := '���س���:' + ADeviceManage.Find(ATargetID).Car.No;
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

procedure TGateWayServerCom.DealReceiveData; // ������յ��ķ���������,������Ҫ�Ƿּ칤��
var
  readCount: Integer;
  LogA: TSystemLog;
  i,j: Double;
begin
  //first ���߳��ж�ȡ����,ע��,Ҫ�����̵߳�����ʱ��

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

    //ΪʲôҪ����,��Ϊǰ�������������ֽڵİ�����
    //�������ĵ�һ���ֽ�Ϊ@���� ���������ֽڵĳ���
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
////          //TDebug.GetInstance.SendDebug('�������ݴ���:ȡ������=0');
////          FReadBuf.WritePos := 0;
////          exit;
////        end;
//
//        packSize := PWord(PtrAdd(FReadBuf.Data, 1))^;
//        //�����
//        if GetXorSum(FReadBuf.Data, packSize - 1) = PByte(PtrAdd(FReadBuf.Data, packSize - 1))^ then
//        begin
//          // InterceptProc(FReadBuf.Data^,PWord(FReadBuf.Data)^);  //��
//          case PByte(PtrAdd(FReadBuf.Data, 6))^ of
//            SRVTERM_DEVONLINE_V3: DealDevOnline_V3(FReadBuf.Data);              // ��������״̬
//            SRVTERM_TYRET_V3: DealTYData_v3(FReadBuf.Data);                     // ͨ��Ӧ��
//            SRVTERM_LASTGPS_V3: DealLastGpsData_V3(FReadBuf.Data);              //��ȡ���λ��Ӧ��
//            SRVTERM_PICUPLOADOK_V3: DealMediaUploadOK_V3(FReadBuf.Data);        // ��ý�������ϴ�OK
//            SRVTERM_AREAALARM_V3: DealDevAreaAlarm_V3(FReadBuf.Data);           //����Χ������
//            SRVTERM_TRANSPARENT: DealTransparentData_V3(FReadBuf.Data);         //͸������
//            SRVTERM_SERVERINFO: DealServerRunInfo_V3(FReadBuf.Data);            //����������״��
//            SRVTERM_GOV_ALARMSUPERVISE: DealAlarmSupervise_V3(FReadBuf.Data);   //����ƽ̨����������Ϣ
//            SRVTERM_GOV_CHECKDUTY: DealCheckDuty_V3(FReadBuf.Data);             //����ƽ̨���
//            SRVTERM_GOV_TEXTINFO: DealGovTextInfo_V3(FReadBuf.Data);            //����ƽ̨�·�������Ϣ
//            SRVTERM_GOV_EARLYWARNING: DealGovEarlyWarning_V3(FReadBuf.Data);    //����ƽ̨�·�Ԥ����Ϣ
//            SRVTERM_GOV_ALARM: DealGovAlarm_V3(FReadBuf.Data);                  //����ƽ̨�·�ʵʱ������Ϣ
//            SRVTERM_GOV_GPSDATACOUNT: DealGovGpsDataCount_V3(FReadBuf.Data);    //����ƽ̨֪ͨ�·�gps��������
//            SRVTERM_GOV_GPSDATA: DealGovGpsData_V3(FReadBuf.Data);              //����ƽ̨�·�gps����
//            SRVTERM_GOV_STARTGPSDATA: DealGovStartGpsData_V3(FReadBuf.Data);      //����ƽ̨֪ͨ��ʼ����������λ��Ϣ
//            SRVTERM_GOV_ENDGPSDATA: DealGovEndGpsData_V3(FReadBuf.Data);          //����ƽ̨֪ͨ��������������λ��Ϣ
//          else
//            begin
////              FReadBuf.WritePos := FReadBuf.WritePos - PWord(PtrAdd(FReadBuf.Data, 1))^;
////              CopyMemory(FReadBuf.Data, PtrAdd(FReadBuf.Data, PWord(PtrAdd(FReadBuf.Data, 1))^), FReadBuf.WritePos);
////              //  TDebug.GetInstance.SendDebug('�������ݴ���:�����ֲ���ȷ');
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
              //�����
              if GetXorSum(p, packSize - 1) = PByte(PtrAdd(p, packSize - 1))^ then
              begin
                // InterceptProc(FReadBuf.Data^,PWord(FReadBuf.Data)^);  //��
                case PByte(PtrAdd(p, 6))^ of
                  SRVTERM_DEVONLINE_V3: DealDevOnline_V3(p);              // ��������״̬
                  SRVTERM_TYRET_V3: DealTYData_v3(p);                     // ͨ��Ӧ��
                  SRVTERM_LASTGPS_V3: DealLastGpsData_V3(p);              //��ȡ���λ��Ӧ��
                  SRVTERM_PICUPLOADOK_V3: DealMediaUploadOK_V3(p);        // ��ý�������ϴ�OK
                  SRVTERM_AREAALARM_V3: DealDevAreaAlarm_V3(p);           //����Χ������
                  SRVTERM_TRANSPARENT: DealTransparentData_V3(p);         //͸������
                  SRVTERM_SERVERINFO: DealServerRunInfo_V3(p);            //����������״��
                  SRVTERM_GOV_ALARMSUPERVISE: DealAlarmSupervise_V3(p);   //����ƽ̨����������Ϣ
                  SRVTERM_GOV_CHECKDUTY: DealCheckDuty_V3(p);             //����ƽ̨���
                  SRVTERM_GOV_TEXTINFO: DealGovTextInfo_V3(p);            //����ƽ̨�·�������Ϣ
                  SRVTERM_GOV_EARLYWARNING: DealGovEarlyWarning_V3(p);    //����ƽ̨�·�Ԥ����Ϣ
                  SRVTERM_GOV_ALARM: DealGovAlarm_V3(p);                  //����ƽ̨�·�ʵʱ������Ϣ
                  SRVTERM_GOV_GPSDATACOUNT: DealGovGpsDataCount_V3(p);    //����ƽ̨֪ͨ�·�gps��������
                  SRVTERM_GOV_GPSDATA: DealGovGpsData_V3(p);              //����ƽ̨�·�gps����
                  SRVTERM_GOV_STARTGPSDATA: DealGovStartGpsData_V3(p);      //����ƽ̨֪ͨ��ʼ����������λ��Ϣ
                  SRVTERM_GOV_ENDGPSDATA: DealGovEndGpsData_V3(p);          //����ƽ̨֪ͨ��������������λ��Ϣ
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

{����У���- ���}
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

procedure TGateWayServerCom.DealRegUserData(ABuf: PByte); //����ע���û����ظ�����
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

function TGateWayServerCom.DirectSend(var buf; ABufSize: Integer): Boolean; //�����ڲ��ķ��ͺ���ֱ�ӷ�������
//var
//  sendBuf: array of Byte;
begin
  //InterceptProc(buf,ABufSize);  // ���ص㴦��
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
          ACmdManage.ClearCmd;//�������ӵ�����ʱ�������������0 2009-1-2sha.
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
      uGloabVar.SystemLog.AddLog(' TGateWayServerCom.FTimerTimer��������: ', e.Message);
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

function TGateWayServerCom.GetLastPos(const ADeviceID: Integer; SaveToCmdManage: boolean): Boolean; //���һ������������λ��
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
//      info^.Desc := '��������豸������λ��'
//    else
//      info^.Desc := '���' + ADeviceManage.Find(ADeviceID).Car.No + '������λ��';
//    info^.SendTime := now();
//    info^.CancelTime := 0;
//    info^.Replytime := 0;
//    SetLength(info^.Content, cmd.Size);
//    Move(cmd, info^.Content[0], cmd.Size);
//    info^.ContentSize := cmd.Size;
//  end;
end;

function TGateWayServerCom.GetMaxCmdID: Integer; //��õ�ǰ���õ���������ID
begin
  if FMaxCmdID >=2147483647	 then
    FMaxCmdID :=0;
  Inc(FMaxCmdID);
  Result := FMaxCmdID;
end;

function TGateWayServerCom.GetStat(const ADeviceID: Integer): Boolean; //���Ŀ���״̬����
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
//  info^.Desc := '���' + ADeviceManage.Find(ADeviceID).Car.No + '���豸״̬';
//  info^.SendTime := now();
//  info^.CancelTime := 0;
//  info^.Replytime := 0;
//  SetLength(info^.Content, cmd.Size);
//  Move(cmd, info^.Content[0], cmd.Size);
//  info^.ContentSize := cmd.Size;
end;


function TGateWayServerCom.LoginToServer: Boolean; // �û���¼���ط�����
var
  cmd: PCmdTermsrvRegUserData_V3;
  info: PCmdInfo;
  str0: string;
  buff: array[0..1023] of byte;
  p: PByte;
  strTime: String;
  time: TByteDynArray;
  authCode: string;//��֤��	=MD5(���Ͷ˱�ʶ+ ��¼����+ʱ���)
begin
  strTime := FormatDateTime('yyyyMMddhhnnss', Now);
  authCode := IntToStr(UserId) + UserPass + strTime;
  authCode := getMD5Str(authCode) + #0;//�����ַ���������

  FillChar(buff, 1024, 0);
  cmd := @buff[0];                                          //�˴���1: 1��У���λ
  InitHeader(cmd^.Header,SizeOf(TCmdTermsrvRegUserData_V3) + Length(authCode) + 1,
    TERMSRV_LOGIN, BLANKDEVID);
  cmd^.Version := LOGVERSION;
  cmd^.UserId := UserId;

  time := StrToBCD(strTime, 7);
  CopyMemory(@cmd^.Time[0], @time[0], Length(time));
  p := PtrAdd(@buff[0], sizeof(TCmdTermsrvRegUserData_V3)); //p ָ�� buff �ƹ� ��֪�ṹ��

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
  info^.Desc := '�û���¼����';
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



function TGateWayServerCom.RepeatSend(ACmdId: integer): boolean; //�ط�
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

function TGateWayServerCom.SendComVer: Boolean; //����ͨѶЭ��汾
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


//�����ӵ�������DTE��������

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
//  Adata := TransSendToDTECmd(Adata); // ת���������->��������
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
//  info^.Desc := 'ʹ' + ADeviceManage.Find(ADeviceID).Car.No + '�ĳ����豸�����跢������';
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
  arr1[0] := 2; //stx ��ʼ
  arr1[1] := len0 + 3; //len
  arr1[2] := 9; //dno �豸����
  arr1[3] := $20; //cmd ������
  CopyMemory(@arr1[4], @Adata[0], len0); //data �������
  arr1[4 + len0] := arr1[2] xor arr1[3];
  for i := 0 to len0 - 1 do
    arr1[4 + len0] := arr1[4 + len0] xor Adata[i]; //bcb У���ַ�
  arr1[5 + len0] := 3; //etx ����
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
//  pcmd := @buff[0]; //pcmd ָ��buff ��ַ
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
//  p := PtrAdd(@buff[0], sizeof(TCmdTerSevSendTaxiBuss_V3)); //p ָ�� buff �ƹ� ��֪�ṹ��
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
//  pinfo^.Desc := '���ó���������Ϣ��Ϣ';
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
  tspBuf: array of Byte;//͸����������
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
    //д�� ��ID      1
    p^ := pAnswer^.id;
    p := PtrAdd(p, 1);
    //�õ��¼��ĳ���  1
    AnswerLen := Length(pAnswer^.Info);
    PWord(p)^ := ByteOderConvert_Word(AnswerLen);
    p := PtrAdd(p, 2);
    InitStr(str0, AnswerLen);

    //д���
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
  pinfo^.Desc := '�·����ʣ�' + ADevice.Car.No+'['+info+']';
  pinfo^.MsgId := MsgId;
  pInfo^.AnswerList := TIntegerList.Create;//�˴�����ֱ�ӵ��� AnswerList�� ��answerlist ���������ʴ��ڵ�dev�����ͷŶ�������
  for i := 0 to AnswerList.Count - 1 do
  begin
    pAnswer := PAnswerInfo(AnswerList.Datas[i]);
    pInfo^.AnswerList.AddData(pAnswer^.id, AnswerList.Datas[i]);
  end;  
  pInfo^.QuestionInfo := info;

//  pcmd := @buff[0]; //pcmd ָ��buff ��ַ
//  InitHeader(pcmd^.Header,0,TERMSRV_SETQUESTLIST_V3,ADevice.Id);
//  pcmd^.ControlCmd := ControlCmd;
//  pcmd^.MsgId := MsgId;
//  p := PtrAdd(@buff[0], sizeof(TCmdTermSrvSetAnswerList_V3)); //p ָ�� buff �ƹ� ��֪�ṹ��
//
//  InitStr(Question, Length(info));
//  CopyMemory(@Question[1], @info[1], Length(info));
//  CopyMemory(p, @Question[1], Length(info)+1);
//  p := PtrAdd(p, Length(info) + 1);
//
//  for i := 0 to AnswerList.Count-1{ADevice.AnswerList.Count - 1} do
//  begin
//    pAnswer := PAnswerInfo(AnswerList.Datas[i]){ADevice.AnswerItems[i]};
//    //д�� ��ID      1
//    p^ := pAnswer^.id;
//    p := PtrAdd(p, 1);
//    //�õ��¼��ĳ���  1
//    AnswerLen := Length(pAnswer^.Info);
//    InitStr(str0, AnswerLen);
//
//    //д���
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
//  pinfo^.Desc := '�·����ʣ�' + ADevice.Car.No+'['+info+']';
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
  cmd.header.BizType :=6;//05	��ؿͻ���
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
  tspBuf: array of Byte;//͸����������
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
    begin//�˴��¼����ݵĽ����������¼����ɵ�ʱ�����
      pEvent := eventList.Datas[i];
      //д�� �¼�ID       1
      p^ := pEvent^.No;
      p := PtrAdd(p, 1);
      //�õ��¼��ĳ���  1
      eventLen := Length(pEvent^.Info);
      p^ := eventLen;
      p := PtrAdd(p, 1);

      if setType <> 4 then
      begin//ɾ��ָ�����ʱ����Ҫ�¼�����
        InitStr(str0, eventLen);
        //д���¼���Ϣ        eventNoLen
        CopyMemory(@str0[1], @(pEvent^.info)[1], eventLen);
        CopyMemory(p, @str0[1], eventLen);
        p := PtrAdd(p, eventLen);
      end;
    end;
  end;
  len := Integer(p) - Integer(@buff[0]);

  InitTSPHeader(pacmd^.Header, len - TSPHEADERLEN, TERMSRV_SETEVENT_V3, ADevice.Id);

  tspPackSize := len + 3;//2����־λ + 1��У����
  SetLength(tspBuf, tspPackSize);
  offSet := 0;
  tspBuf[offset] := FLAGTSP;//��ʶλ
  Inc(offSet);
  CopyMemory(@tspBuf[offSet], @buff[0], len);
  Inc(offSet, len);
  tspBuf[offSet] := GetXorSum(@tspBuf[1], len);//����Ϣͷ��ʼ����������ʶλ
  Inc(offSet);
  tspBuf[offset] := FLAGTSP;//��ʶλ
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(ADevice, escapByteBuf);
  info^.Desc := '�����¼���' + ADevice.Car.No;

//  pcmd := @buff[0]; //pcmd ָ��buff ��ַ
//  InitHeader(pcmd^.Header,0,TERMSRV_SETEVENTLIST_V3,ADevice.id);
////
//  if  ADevice.EventList.Count=0 then
//    pcmd^.SetType := 0
//  else
//    pcmd^.SetType := 1;
//  { TODO -osjp : ���������� }
//  pcmd^.SetCount := ADevice.EventList.Count;
//  pcmd^.PackCount := 1;
//  p := PtrAdd(@buff[0], sizeof(TCmdTermSrvSetEventList_V3)); //p ָ�� buff �ƹ� ��֪�ṹ��
////  p^ := ADevice.EventList.Count;  // �¼������   1
////  p := PtrAdd(p, 1);
//  for i := 0 to ADevice.EventList.Count - 1 do
//  begin
//    pEvent := ADevice.EventItems[i];
//    //д�� �¼�ID       1
//    p^ := pEvent^.No;
//    p := PtrAdd(p, 1);
//    //�õ��¼��ĳ���  1
//    eventLen := Length(pEvent^.Info);
//    p^ := eventLen+1;
//    p := PtrAdd(p, 1);
//    InitStr(str0, eventLen);
//    //д���¼���Ϣ        eventNoLen
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

function TGateWayServerCom.SetClassInfoMenu_V3(ADevice: TDevice): Boolean;  {�����ܱ���Ϣ��Ϣ�˵�}
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
  pcmd := @buff[0]; //pcmd ָ��buff ��ַ
  pcmd^.Size := 0;
  pcmd^.Flag := TERMSRV_SETCLASSINFOMENU_V3;
  pcmd^.ExtendedFlag := 0;
//  pcmd^.FactID := ADevice.fact_id;
  pcmd^.DevID := DevId_StrToBCD(ADevice.Id);
  pcmd^.CmdID := GetMaxCmdID;
  p := PtrAdd(@buff[0], sizeof(TCmdTermSrvSetClassInfoMenu_V3)); //p ָ�� buff �ƹ� ��֪�ṹ��
  p^ := ADevice.ClassInfoMenuList.Count;  // �¼������   1
  p := PtrAdd(p, 1);
  for i := 0 to ADevice.ClassInfoMenuList.Count - 1 do
  begin
    pInfo := ADevice.ClassInfoMenuItems[i];
    //д�� �˵�ID       1
    p^ := pInfo^.No;
    p := PtrAdd(p, 1);
    //�õ��˵��ĳ���  1
    eventLen := Length(pInfo^.Info);
    InitStr(str0, eventLen);
    //д��˵���Ϣ        eventNoLen
    CopyMemory(@str0[1], @(pInfo^.info)[1], eventLen);
    CopyMemory(p, @str0[1], eventLen+1);
    p := PtrAdd(p, eventLen+1);
  end;
  Pcmd^.Size := Integer(p) - Integer(@buff[0]);
  Result := DirectSend(buff[0], pcmd^.Size);

  info := ACmdManage.Add(pcmd^.CmdId);
  info^.Id := pcmd^.CmdId;
  info^.State := CMD_SNDNODO;
  info^.Desc := '���ó����ܱ���Ϣ����˵���' + ADevice.Car.No;
  info^.SendTime := now();
  info^.CancelTime := 0;
  info^.Replytime := 0;
  SetLength(info^.Content, pcmd^.Size);
  Move(buff[0], info^.Content[0], pcmd^.Size);
  info^.ContentSize := pcmd^.Size;

//  SaveCMD.CmdList.AddData(pCmd^.CmdId, info);
end;

function TGateWayServerCom.SetInfoMenu_V3(ADevice: TDevice): Boolean;  {������Ϣ�˵�}
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
  tspBuf: array of Byte;//͸����������
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
    //д�� �¼�ID       1
    p^ := pInfo^.No;
    p := PtrAdd(p, 1);
    //�õ��¼��ĳ���  1
    eventLen := Length(pInfo^.Info);
    PWord(p)^ := ByteOderConvert_Word(eventLen);
    p := PtrAdd(p, 2);
    
    InitStr(str0, eventLen);
    //д���¼���Ϣ        eventNoLen
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
  info^.Desc := '���ó�����Ϣ�˵���' + ADevice.Car.No;

//
//  pcmd := @buff[0]; //pcmd ָ��buff ��ַ
//  pcmd^.Size := 0;
//  pcmd^.Flag := TERMSRV_SETINFOMENU_V3;
//  pcmd^.ExtendedFlag := 0;
////  pcmd^.FactID := ADevice.fact_id;
//  pcmd^.DevID := DevId_StrToBCD(ADevice.Id);
//  pcmd^.CmdID := GetMaxCmdID;
//  p := PtrAdd(@buff[0], sizeof(TCmdTermSrvSetInfoMenu_V3)); //p ָ�� buff �ƹ� ��֪�ṹ��
//  p^ := ADevice.InfoMenuList.Count;  // �¼������   1
//  p := PtrAdd(p, 1);
//  for i := 0 to ADevice.InfoMenuList.Count - 1 do
//  begin
//    pInfo := ADevice.InfoMenuItems[i];
//    //д�� �¼�ID       1
//    p^ := pInfo^.No;
//    p := PtrAdd(p, 1);
//    //�õ��¼��ĳ���  1
//    eventLen := Length(pInfo^.Info);
//    InitStr(str0, eventLen);
//    //д���¼���Ϣ        eventNoLen
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
//  info^.Desc := '���ó�����Ϣ�˵���' + ADevice.Car.No;
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
  tspBuf: array of Byte;//͸����������
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
    //д�� �绰����       1
    p^ := pTel^.TelType;
    p := PtrAdd(p, 1);
    //д��绰���볤��
    telNoLen := Length(pTel^.No);
    p^ := telNoLen;
    p := PtrAdd(p, 1);
    //д��绰����        telNoLen
    InitStr(str0, telNoLen);      
    CopyMemory(@str0[1], @(pTel^.No)[1], telNoLen);
    CopyMemory(p, @str0[1], telNoLen);
    p := PtrAdd(p, telNoLen);
    //д����ϵ�˳���
    p^ := Length(pTel^.Name);
    p := PtrAdd(p, 1);
    //д�롡�绰ӵ����    8
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
  info^.Desc := '���õ绰����' + ADevice.Car.No;

//  pcmd := @buff[0]; //pcmd ָ��buff ��ַ
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
//  p := PtrAdd(@buff[0], sizeof(TCmdTermSrvSetTelList_V3)); //p ָ�� buff �ƹ� ��֪�ṹ��
//  for i := 0 to ADevice.TelList.Count - 1 do
//  begin
//    pTel := ADevice.TelItems[i];
//    //д�� �绰����       1
//    p^ := pTel^.TelType;
//    p := PtrAdd(p, 1);
//    //д��绰���볤��
//    telNoLen := Length(pTel^.No);
//    p^ := telNoLen+1;
//    p := PtrAdd(p, 1);
//    //д��绰����        telNoLen
//    InitStr(str0, telNoLen);      
//    CopyMemory(@str0[1], @(pTel^.No)[1], telNoLen);
//    CopyMemory(p, @str0[1], telNoLen+1);
//    p := PtrAdd(p, telNoLen+1);
//    //д����ϵ�˳���
//    p^ := Length(pTel^.Name)+1;
//    p := PtrAdd(p, 1);
//    //д�롡�绰ӵ����    8
//    InitStr(str0, Length(pTel^.Name));
//    CopyMemory(@str0[1], @(pTel^.Name)[1], length(pTel^.Name));
//    CopyMemory(p, @str0[1], Length(pTel^.Name)+1);
//    p := PtrAdd(p, Length(pTel^.Name)+1);
//  end;
//  { TODO -osjp : ���õ绰�����Ƿ���������Ϊ0ʱ�����������ֽڣ� }
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
//  info^.Desc := '���õ绰����' + ADevice.Car.No;
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
//  info^.Desc := '�޸ĳ����̶��˵���' + ADeviceManage.Find(ATargetID).Car.No;
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
//  info^.Desc := '�޸ĳ�����ʾ����˾���ƣ�' + ADeviceManage.Find(ATargetID).Car.No;
//  info^.DevId := ATargetId;
//  info^.SendTime := now();
//  info^.CancelTime := 0;
//  info^.Replytime := 0;
//  SetLength(info^.Content, pCmd^.Size);
//  Move(buff[0], info^.Content[0], pCmd^.Size);
//  info^.ContentSize := pCmd^.Size;
//end;



function TGateWayServerCom.RemoveAlarm_V3(ATargetId: string): boolean; {�������}
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
  info^.Desc := '�������������' + ADeviceManage.Find(ATargetID).Car.No;
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
  info^.Desc := 'ȷ�ϳ���Ԥ����' + ADeviceManage.Find(ATargetID).Car.No;
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
  info^.Desc := 'ȡ������Ԥ����' + ADeviceManage.Find(ATargetID).Car.No;
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
//  info^.Desc := '�������������' + ADeviceManage.Find(ATargetID).Car.No;
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
//  info^.Desc := '�򳵻������ı�������Ϣ��' + ADeviceManage.Find(ATargetID).Car.No;
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
//  info^.Desc := '�򳵻������ı�������Ϣ��' + ADeviceManage.Find(ATargetID).Car.No;
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
  tspBuf: array of Byte;//͸����������
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
begin
  Result := false;
  if not isActive then exit;
  tspPackSize := SizeOf(TCmdTermSrvSendControlInfoTSP_V3)  + AInfoLen + 1;//��1λУ����
  InitTSPHeader(acmd.Header, tspPackSize - TSPHEADERLEN - 1, TERMSRV_TEXTINFO_V3, ADev.Id);
  acmd.ControlCmd := ControlCmd;

  SetLength(tspBuf, tspPackSize + 2);//���������İ����ڰ����˼ӱ�ʶλ
  offSet := 0;
  tspBuf[offset] := FLAGTSP;//��ʶλ
  Inc(offSet);

  CopyMemory(@tspBuf[offset], @acmd, SizeOf(TCmdTermSrvSendControlInfoTSP_V3));
  Inc(offSet, SizeOf(TCmdTermSrvSendControlInfoTSP_V3));

  CopyMemory(@tspBuf[offset], @AControlInfo[1], AInfoLen);
  Inc(offSet, AInfoLen);

  tspBuf[offSet] := GetXorSum(@tspBuf[1], tspPackSize - 1);//����Ϣͷ��ʼ����������ʶλ
  Inc(offSet);

  tspBuf[offSet] := FLAGTSP;//��ʶλ
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(ADev, escapByteBuf);
  info^.Desc := '�·��ı���Ϣ��' + ADev.Car.No+'['+AControlInfo+']';
  if currAlarmInfo <> nil then
  begin
    info^.alarmInfoId := currAlarmInfo.Id;
    info^.alarmDealFlag := 3;
  end;
  Result := True;

  {������5�ֽڰ�
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
    info^.Desc := '�·��ı���Ϣ��' + ADev.Car.No+'['+AControlInfo+']';
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
    UPDATEDEV_DEV: str := '����';
    UPDATEDEV_DISPLAY: str := '��ʾ��';
  end;
  info^.Desc := '��������' + str + '�̼���' + ADeviceManage.Find(ATargetID).Car.No;
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
  paramStr: string; //��������
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
    //���������ݴ桡paramContent
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
    if Len = 4 then  //IP��ַ����
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

      $0050: //'�������α�־';
        begin
          i:=0;
          while i<32 do //0-32
          begin
            ReadParamFrm.cxCheckListBox56.Items[i].Checked := ParamByte[0 + i div 8] and (1 shl (i mod 8)) = (1 shl (i mod 8));
            inc(i);
          end;
        end;
      $0051: //'�������α�־';
        begin
          i:=0;
          while i<32 do //0-32
          begin
            ReadParamFrm.cxCheckListBox1.Items[i].Checked := ParamByte[0 + i div 8] and (1 shl (i mod 8)) = (1 shl (i mod 8));
            inc(i);
          end;
        end;
      $0052: //'�������α�־';
        begin
          i:=0;
          while i<32 do //0-32
          begin
            ReadParamFrm.cxCheckListBox2.Items[i].Checked := ParamByte[0 + i div 8] and (1 shl (i mod 8)) = (1 shl (i mod 8));
            inc(i);
          end;
        end;
      $0053: //'�������α�־';
        begin
          i:=0;
          while i<32 do //0-32
          begin
            ReadParamFrm.cxCheckListBox3.Items[i].Checked := ParamByte[0 + i div 8] and (1 shl (i mod 8)) = (1 shl (i mod 8));
            inc(i);
          end;
        end;
      $0054: //'�������α�־';
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
      //  TDebug.GetInstance.SendDebug('���豸�����ķ��������д���', '������ţ�$' + IntToHex(paramID, 4));
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
    PopMsg('ͼ�����Ӧ��Ӧ��', info^.Desc + ' �ϴ���ͼ���б���鿴');
  end
  else
  begin
     PopMsg('ͼ�����Ӧ��Ӧ��', dev.Car.No + #13 + #10 + '�� ' + info^.Reason+ ' ͼ���ļ�');
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
    PopMsg('��Ƶ����Ӧ��Ӧ��', info^.Desc + ' �ϴ�����Ƶ�б���鿴');
  end
  else
  begin
     PopMsg('��Ƶ����Ӧ��Ӧ��', dev.Car.No + #13 + #10 + '�� ' + info^.Reason + ' ��Ƶ�ļ�');
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
//        0:;   // δ����
//        1:    // ����
//          begin
//            dev.MY := dev.MY + 1;
//          end;
//        2:;   // һ��
//        3:    // ������
//          begin
//            dev.BMY := dev.BMY + 1;
//          end;
//        4:    // Ͷ��
//          begin
//            dev.AccuseNum := dev.AccuseNum + 1;
//            FComplaintsCount := FComplaintsCount + 1;
//          end;
//      end;
//
//      try
//        temp := BCDToStr(@PCmdSrvTermDRunData_V3(pBuf)^.RunJE[0], 3);
//        syyje := StrToFloat(Copy(temp, 1, 5) + '.' + Copy(temp, 6, 1));
//        dev.syyje := dev.syyje + syyje;   // Ӫ�˽��
//
//        temp :=  BCDToStr(@PCmdSrvTermDRunData_V3(pBuf)^.NoRunDistanct[0], 2);
//        kslc := StrToFloat(Copy(temp, 1, 3) + '.' + Copy(temp, 4, 1));
//        dev.kslc := dev.kslc + kslc;      // ��ʻ���
//
//        temp := BCDToStr(@PCmdSrvTermDRunData_V3(pBuf)^.RunDistanct[0], 3); // Ӫ�����
//        xslc := StrToFloat(Copy(temp, 1, 5) + '.' + Copy(temp, 6, 1));
//        dev.xslc := dev.xslc + xslc + kslc;      // ��ʻ���
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

  PopMsg('��������ѯӦ��', info^.Desc + ' �ϴ��˺������汾���汾��' + ver);
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

  Res := '����״̬δ֪';

  case pCmd^.Res of
    1: Res := '����ɹ�';
    2: Res := '����ʧ��';
  end;

  PopMsg('Ӫ�������ϴ�Ӧ��', dev.Car.No + '�ϴ�һ��Ӫ������, ' + Res);
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
            PopMsg('��������', dev.Car.No + #13#10 + '������');
            dev.LastConnectTime := Now
          end;
        end
        else
        begin
          if FIsOffLineRecved then
          begin
            if GlobalParam.isCarUnOnline then
              PopMsg('��������', dev.Car.No + #13#10 + '����������');
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
      uGloabVar.SystemLog.AddLog('DealDevOnline_V3�쳣' + E.Message);
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
//      PopMsg('�豸Ѳ��Ӧ��', P^.Desc + #13 + #10 + '��鿴Ѳ��״̬');
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
//    res := '͸��ָ��Ӧ��'
//  end
//  else
//  begin
//    if (PCmdtermSrv_MCU_V3(ABuf)^.MCUflag[0] = $00) and (PCmdtermSrv_MCU_V3(ABuf)^.MCUflag[1] = $00) then
//    begin
//      res := '��鿴��ѯ״̬';
//      DealQueryMcuState_V3(0, dev,@PCmdtermSrv_QUERYMCU_V3(ABuf)^.state);
//    end
//    else
//    begin
//      if PCmdtermSrv_MCU_V3(ABuf)^.RES = $00 then
//        res := '�ɹ�'
//      else
//        res := 'ʧ��';
//    end;
//  end;
//
//
//  p^.State := CMD_DONE;
//  p^.Replytime := now();
//  PopMsg('���ܶ���Ӧ��', p^.Desc + res);
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
//    PopMsg('LEDӦ��', p^.Desc + '͸��ָ��Ӧ��');
//  end
//  else
//  begin
//    if (PCmdtermSrv_LED_V3(ABuf)^.MCUflag[0] = $00) and (PCmdtermSrv_LED_V3(ABuf)^.MCUflag[1] = $00) then
//    begin
//      res := '��鿴��ѯ״̬';
//      DealQueryMcuState_V3(1, dev,@PCmdtermSrv_QUERYLED_V3(ABuf)^.state);
//
//      p^.State := CMD_DONE;
//      p^.Replytime := now();
//      PopMsg('LEDӦ��', p^.Desc + res);
//    end;
//  end;
//  {else
//  begin
//    if PCmdtermSrv_LED_V3(ABuf)^.RES = $00 then
//      res := '�ɹ�'
//    else
//      res := 'ʧ��';
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
//    PopMsg('LCDӦ��', p^.Desc + '͸��ָ��Ӧ��');
//  end
//  else
//  begin
//
//    Count := 0;
//    DeleteAdInfo := False;
//
//    case ByteOderConvert_Word(PCmdSrvTerm_LCD_V3(ABuf)^.MCUflag) of
//      $0000:  // ��ѯ״̬
//        begin
//          res := '��鿴��ѯ״̬';
//          DealQueryMcuState_V3(2, dev,PtrAdd(ABuf, sizeof(TCmdSrvTerm_LCD_V3)));
//        end;
//      $0100:  // �����Ϣ��������㱨
//        begin
//          ABuf := PtrAdd(ABuf, sizeof(TCmdSrvTerm_LCD_V3));
//          case ABuf^ of
//            $00:
//              begin
//                res := '������ȷ';
//                PtrAdd(ABuf, 1);
//                SetLength(AdInfo, len-16);
//                CopyMemory(@AdInfo[1], ABuf, len-16);
//                dev.AddAdInfo(AdInfo);
//              end;
//            $FF:  res := '���ش���';
//          end;
//        end;
//      $0101:  // ������ʾָ���Ĺ����Ϣ
//        begin
//          ABuf := PtrAdd(ABuf, sizeof(TCmdSrvTerm_LCD_V3));
//          case ABuf^ of
//            $00:  res := 'ִ����ȷ';
//            $FF:  res := 'ִ�д���(�ļ�������)';
//          end;
//        end;
//      $0102: // ������������ָ���Ĺ����Ϣ
//        begin
//          ABuf := PtrAdd(ABuf, sizeof(TCmdSrvTerm_LCD_V3));
//          case ABuf^ of
//            $00:  res := 'ִ����ȷ';
//            $FF:  res := 'ִ�д���(��������)';
//          end;
//        end;
//      $0103: // ���Ĳ�ѯ��ǰ���ڲ��ŵĹ����Ϣ
//        begin
//          ABuf := PtrAdd(ABuf, sizeof(TCmdSrvTerm_LCD_V3));
//          SetLength(AdInfo, len-15);
//          CopyMemory(@AdInfo[1], ABuf, len-15);
//          res := ' ' + AdInfo;
//        end;
//      $0104: // ���Ĳ�ѯLCD�ڵĹ����Ϣ
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
//      $0105: // ɾ��LCD��ָ���Ĺ����Ϣ
//        begin
//          ABuf := PtrAdd(ABuf, sizeof(TCmdSrvTerm_LCD_V3));
//          case ABuf^ of
//            $00:
//            begin
//              res := 'ִ����ȷ';
//              DeleteAdInfo := True;
//            end;
//            $FF:  res := 'ִ�д���';
//          end;
//        end;
//      $0106: // ɾ��LCD�����еĹ����Ϣ
//        begin
//          ABuf := PtrAdd(ABuf, sizeof(TCmdSrvTerm_LCD_V3));
//          case ABuf^ of
//            $00:
//            begin
//              res := 'ִ����ȷ';
//              dev.AdInfoList.Clear;
//            end;
//            $FF:  res := 'ִ�д���';
//          end;
//        end;
//      else
//        begin
//          ABuf := PtrAdd(ABuf, sizeof(TCmdSrvTerm_LCD_V3));
//          case ABuf^ of
//            $00:  res := '�ɹ�';
//            $01:  res := '�豸��֧�ִ�����';
//            $FF:  res := 'ʧ��';
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
//    PopMsg('LCDӦ��', p^.Desc + res);
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
//    res := '͸��ָ��Ӧ��'
//  end
//  else
//  begin
//    dev := ADeviceManage.Find(devId);
//    Count := 0;
//
//    case ByteOderConvert_Word(PCmdSrvTermReadMeterParam_V3(ABuf)^.MCUflag) of
//      $0000:  // ��ѯ״̬
//        begin
//          res := '��鿴��ѯ״̬';
//          DealQueryMcuState_V3(4, dev,PtrAdd(ABuf, sizeof(TCmdSrvTermReadMeterParam_V3)));
//        end;
//      $0004:  // ������ѯ
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
//            $00: res := '�������سɹ�';
//            $01: res := '����ʧ��';
//            $02: res := '�汾��ͬ����������';
//          end;
//        end;
//    end;
//  end;
//
//  p^.State := CMD_DONE;
//  p^.Replytime := now();
//  PopMsg('�Ƽ���Ӧ��', p^.Desc + res);
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
//    res := '͸��ָ��Ӧ��'
//  end
//  else
//  begin
//  case ByteOderConvert_Word(PCmdTermSrv_TSM_V3(ABuf)^.MCUflag) of
//    $0000:  // ��ѯ״̬
//      begin
//        res := '��鿴��ѯ״̬';
//        DealQueryMcuState_V3(3, dev,PtrAdd(ABuf, sizeof(TCmdTermSrv_TSM_V3)));
//      end;
//    $0001:;
//    $0002:;
//  end;
//  end;
//
//  p^.State := CMD_DONE;
//  p^.Replytime := now();
//  PopMsg('TSMӦ��', p^.Desc + res);
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
    res := '�ɹ�'
  else
    res := 'ʧ��';

  p^.State := CMD_DONE;
  p^.Replytime := now();               
  PopMsg('���÷�α��־Ӧ��', p^.Desc + 'res');
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
  PopMsg('�¼�����', dev.Car.No + '�����¼���' + info);
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

    PopMsg('����Ӧ��','���⣺' + p.QuestionInfo+#10#10 + dev.Car.No + '��' +
                      '�𰸣�' + {PAnswerInfo(p.AnswerList.Datas[PCmdSrvtermReportAnswer_V3(ABuf)^.AnswerID]).}info);

    uGloabVar.SystemLog.AddLog('���⣺' + p.QuestionInfo+#10#10 + dev.Car.No + '��' +
                             '�𰸣�' + {PAnswerInfo(p.AnswerList.Datas[PCmdSrvtermReportAnswer_V3(ABuf)^.AnswerID]).}info);

    try
      Bs.ModifyAMessage_Answer2(pCmd^.MsgId, 2, FormatDateTime('yyyy-mm-nn hh:nn:ss', now),
                                AnswerID, info);
    except
    end;
    {p := ACmdManage.Find(cmdId);
    if p = nil then exit;
    p^.State := CMD_DONE;
    p^.Replytime := now();
    PopMsg('����Ӧ��', '���⣺'+p^.QuestionInfo+#10#10 + dev.Car.No + '��' +
                       '�𰸣�' + PAnswerInfo(p^.AnswerList.Datas[PCmdSrvtermReportAnswer_V3(ABuf)^.AnswerID]).info);}
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
          s :='�ɹ���';
          state := CMD_DONE;
        end;
      1: ;
      2:
        begin
          s := 'ʧ��, ����ȡ����';
          state := CMD_DOERROR;
        end;
      3:
        begin
          s := 'ʧ��, ����ɾ������ʱ����';
          state := CMD_OVERTIME;
        end;
      4:
        begin
          s := 'ʧ��, �ظ���¼��';
        end;
      5:
        begin
          s := 'ʧ��, ��Ч�û�����';
        end;
      6:
        begin
          s := '���������ߣ�';
          state := CMD_REPLACE;
        end;
    end;

    if (backNumber = 0) then
    begin
      if (p^.DeleteArea = True) then
      begin //ɾ������
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
      begin//�������õ�����
        area := FAllAreaManage.find(p^.areaId);
        if area <> nil then
        begin
          if p^.areaSetType = 1 then
          begin//����  ɾ��֮ǰ�����У�׷�ӵ�ǰ��
            if p^.Dev.GetADevArea(p^.areaId) <> nil then
            begin//���������˸�����ֱ��ɾ�����������򣬲�����׷��
              p^.Dev.DelDevAreasExceptAArea(p^.areaId);
            end
            else
            begin//ɾ����׷��
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
          begin//׷��
            if Bs.AddNewDev_Area(p^.DevId, area.AreaID) then
            begin
              area.AddDev(p^.Dev.Id);
              p^.Dev.AddADevArea(area);
              if Assigned(FOnRefreshAreaDevList) then
                FOnRefreshAreaDevList(area.AreaPictureKind, 0);
            end;
          end
          else if p^.areaSetType = 3 then
          begin//�޸�  ����Ҫ����

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
    PopMsg('����Ӧ��:'+s, p^.desc + s);
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealTYData_v3�쳣' + E.Message);
    end;
  end;
end;

function TGateWayServerCom.isActive: boolean;
begin
  Result := Active;
  if not Active then PopMsg('������ʾ', '�����ط�����' + #13 + #10 + '���Ӳ�����' + #13 + #10 + ',���ܷ�������');
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
      if GlobalParam.IsSendSuccess then PopMsg('�ɹ�', Dec);
    ERR_INVALIDDEV:
      if GlobalParam.IsSendFail then popMsg('��Ч�ĳ���ID��', Dec);
    ERR_LED + 10:
      if GlobalParam.IsSendFail then popMsg('��ʾ��', Dec + 'ʱ,������ʾ��ʧ�ܣ�');
    CMD_NOPIC:
       PopMsg('����Ƭ','û�з�����������Ƭ!');
    else
      if GlobalParam.IsSendFail then popMsg('ʧ��', 'ִ�� ' + Dec + 'ʧ��!');
  end;
end;

function TGateWayServerCom.ReturnParamName(ParamID: integer): string;
begin
  case ParamID of
    $0001: Result := '�ն��������ͼ��';
    $0002: Result := 'TCP��ϢӦ��ʱʱ��';
    $0003: Result := 'TCP��Ϣ�ش�����';
    $0004: Result := 'UDP��ϢӦ��ʱʱ��';
    $0005: Result := 'UDP��Ϣ�ش�����';
    $0006: Result := 'SMS��ϢӦ��ʱʱ��';
    $0007: Result := 'SMS��Ϣ�ش�����';

    $0010: Result := '��������APN������ͨ�Ų��ŷ��ʵ�';
    $0011: Result := '������������ͨ�Ų����û���';
    $0012: Result := '������������ͨ�Ų�������';
    $0013: Result := '����������ַ,IP������';
    $0014: Result := '���ݷ�����APN������ͨ�Ų��ŷ��ʵ�';
    $0015: Result := '���ݷ���������ͨ�Ų����û���';
    $0016: Result := '���ݷ���������ͨ�Ų�������'; //
    $0017: Result := '���ݷ�������ַ,IP������';
    $0018: Result := '������TCP�˿�';
    $0019: Result := '������UDP�˿�';

    $0020: Result := 'λ�û㱨����';
    $0021: Result := 'λ�û㱨����';
    $0022: Result := '��ʻԱδ��¼�㱨ʱ����';

    $0027: Result := '����ʱ�㱨ʱ����';
    $0028: Result := '��������ʱ�㱨ʱ����';
    $0029: Result := 'ȱʡʱ��㱨���';

    $002C: Result := 'ȱʡ����㱨���';
    $002D: Result := '��ʻԱδ��¼�㱨������';
    $002E: Result := '����ʱ�㱨������';
    $002F: Result := '��������ʱ�㱨������';
    $0030: Result := '�յ㲹���Ƕ�';

    $0040: Result := '���ƽ̨�绰����';
    $0041: Result := '��λ�绰����';
    $0042: Result := '�ָ��������õ绰����';
    $0043: Result := '���ƽ̨SMS�绰����';
    $0044: Result := '�����ն�SMS�ı���������';
    $0045: Result := '�ն˵绰��������';
    $0046: Result := 'ÿ���ͨ��ʱ��';
    $0047: Result := '�����ͨ��ʱ��';
    $0048: Result := '�����绰����';
    $0049: Result := '���ƽ̨��Ȩ���ź���';

    $0050: Result := '����������';
    $0051: Result := '���������ı�SMS����';
    $0052: Result := '�������㿪��';
    $0053: Result := '��������洢��־';
    $0054: Result := '�ؼ�������־';
    $0055: Result := '����ٶ�';
    $0056: Result := '���ٳ���ʱ��';
    $0057: Result := '������ʻʱ��';
    $0058: Result := '�����ۼƼ�ʻʱ��';
    $0059: Result := '��С��Ϣʱ��';
    $005A: Result := '�ͣ��ʱ��';

    $0070: Result := 'ͼ��/��Ƶ����';
    $0071: Result := '����';
    $0072: Result := '�Աȶ�';
    $0073: Result := '���Ͷ�';
    $0074: Result := 'ɫ��';

    $0080: Result := '������̱����';
    $0081: Result := '�������ڵ�ʡ��ID';
    $0082: Result := '�������ڵ�����ID';
    $0083: Result := '���ƺ�';
    $0084: Result := '������ɫ';
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
//  info^.Desc := '����' + Dev.Car.No + ReturnCutOrFeedContent(Option);
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
//  info^.Desc := '��ȡ' + Dev.Car.No + '��������';
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
//  info^.Desc := '��ȡ' + Dev.Car.No + '�汾';
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
//  info^.Desc := '��ȡ' + Dev.Car.No + '�汾(������)';
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
  tspBuf: array of Byte;//͸����������
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
begin
  Result := false;
  if not isActive then exit;
  tspPackSize := SizeOf(TCmdTermSrvFindPostionTSP_V3)  + 1;//��1λУ����
  InitTSPHeader(cmd.Header, tspPackSize - TSPHEADERLEN - 1, TERMSRV_FINDPOSTION_V3, Dev.Id);

  SetLength(tspBuf, tspPackSize + 2);//���������İ����ڰ����˼ӱ�ʶλ
  offSet := 0;
  tspBuf[offset] := FLAGTSP;//��ʶλ
  Inc(offSet);

  CopyMemory(@tspBuf[offset], @cmd, SizeOf(TCmdTermSrvFindPostionTSP_V3));
  Inc(offSet, SizeOf(TCmdTermSrvFindPostionTSP_V3));

  tspBuf[offSet] := GetXorSum(@tspBuf[1], tspPackSize - 1);//����Ϣͷ��ʼ����������ʶλ
  Inc(offSet);

  tspBuf[offSet] := FLAGTSP;//��ʶλ
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(Dev, escapByteBuf);
  info^.Desc := dev.Car.No + 'λ�ò�ѯ';
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
  info^.Desc := '��ѯ' + Dev.Car.No + '������������Ϣ';
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
  info^.Desc := '��' + Dev.Car.No + '�����������غ���������';
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


//��������
function TGateWayServerCom.GetAPicture(Dev: TDevice; CameraIndex: Byte; CameraCmd: Word; PZSJJG: Word;
                         SaveSign: Byte; GetPicSize: Byte; TXZL: Byte; LD: Byte;
                         DBD: Byte; BHD: Byte; SD: Byte): boolean;
var
  info: PCmdinfo;
  len: Word;
  acmd: TCmdTermSrvTakeAPhotoTSP_V3;
  tspBuf: array of Byte;//͸����������
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

  info^.Desc := '��' + Dev.Car.No + '������������';
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
      PopMsg('����ͷ��Ϣ', Dev.Car.No + ' ����������ͷ���ܳ��ֹ��ϣ�����');
    end
    else
    begin
      PopMsg('����ͷ��Ϣ',  '����������ͷ���ܳ��ֹ��ϣ�����');
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
  //if pInfo <> nil then     // ���ǳ�������������������
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
                PopMsg('����Ƭ',  '��' + Dev.Car.No +'����ı��Ϊ'+ IntToStr(pCmd^.MCUPicIndex)+'��Ƭ�ϴ��ɹ���'
                      + #13#10 + '��鿴')
              else
                PopMsg('����Ƭ', dev.Car.No + #13 + #10 + '����Ƭ��');
            dev.LastPictureID := pCmd^.PicIndex;
            if Assigned(FPicUpload) then FPicUpload(dev, pCmd^.PicIndex, 100, pic);
          end;
        end;
      except
      end;
    end
    else if pic.PhotoReasonID = 2 then // �������������������ݣ���������ж�Ϊ����Ԥ���󷢹�����
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
              PopMsg('Ԥ����Ƭ', dev.Car.No + #13 + #10 + '��Ԥ����Ƭ��');
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
  //if pInfo <> nil then     // ���ǳ�������������������
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
//                PopMsg('����Ƶ�ļ�',  '��' + Dev.Car.No +'����ı��Ϊ'+ IntToStr(pCmd^.MCUPicIndex)+'��Ƶ�ļ��ϴ��ɹ���' +#13#10 + '��鿴')
//              else
                PopMsg('����Ƶ�ļ�', dev.Car.No + #13 + #10 + '����Ƶ�ļ���');
            //dev.LastPictureID := pCmd^.PicIndex;
            if Assigned(FAudioUpload) then FAudioUpload(dev, pCmd^.PicId);
          //end;
        end;
      end;
    except
    end;
  //end;
  {else  // �������������������ݣ���������ж�Ϊ����Ԥ���󷢹�����
  begin
    i := EarlyWarningCarList.IndexOf(DevId);
    if i>=0 then
    begin
      pic := bs.QueryPhoteByPicIndex(pCmd^.PicIndex);
      if pic <> nil then
      begin
        TEarlyWarningCar(EarlyWarningCarList.Datas[i]).FPicInfoList.AddData(pCmd^.PicIndex, pic);
        PopMsg('Ԥ����Ƭ', dev.Car.No + #13 + #10 + '��Ԥ����Ƭ��');
        if Assigned(FPicUpload) then FPicUpload(dev, pCmd^.PicIndex,4);
      end;
    end;
  end; }
end;

//�·�����������ʾ����  TERMSRV_DOWNALLWAY  = $2D;

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
//  info^.Desc := '��' + Dev.Car.No + '�·�����������ʾ����';
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
//  info^.Desc := '����ʹ' + Dev.Car.No + '�δ�' + Tel + '�����绰';
//  info^.DevId := Dev.Id;
//  info^.SendTime := now();
//  info^.CancelTime := 0;
//  info^.Replytime := 0;
//  SetLength(info^.Content, Cmd.Size);
//  Move(buff[0], info^.Content[0], Cmd.Size);
//  info^.ContentSize := Cmd.Size;
//end;

function TGateWayServerCom.SendVideo_V3(dev: TDevice; msstream: TMemoryStream): Boolean; {�·���Ƶ}
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
  pcmd := @buff[0]; //pcmd ָ��buff ��ַ
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
  info^.Desc := '�·���Ƶ�ļ���' + Dev.Car.No;
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
  tspBuf: array of Byte;//͸����������
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
  if (CircleArea.AreaAlarmKind and 1) = 1 then              //����ʱ�� ,��ʱ����һ��
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

  if (CircleArea.AreaAlarmKind and 2) = 2 then //��������һ��
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
  info^.Desc := '����Բ�����򵽳�����' + Dev.Car.No;
  info^.areaId := CircleArea.AreaID;
  info^.areaSetType := setType + 1;
  Result := True;

//  Result := False;
//  if not isActive then exit;
//
//  pcmd := @buff[0]; //pcmd ָ��buff ��ַ
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
//  p := PtrAdd(@buff[0], sizeof(TCmdTermSrvSetCircleArea_V3)); //p ָ�� buff �ƹ� ��֪�ṹ��
//  if (CircleArea.AreaAlarmKind and 1) = 1 then              //����ʱ�� ,��ʱ����һ��
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
//  if (CircleArea.AreaAlarmKind and 2) = 2 then //��������һ��
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
//  info^.Desc := '����Բ�����򵽳�����' + Dev.Car.No;
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
  tspBuf: array of Byte;//͸����������
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
  info^.Desc := '���þ������򵽳�����' + Dev.Car.No;
  info^.areaId := RectangleArea.AreaID;
  info^.areaSetType := setType + 1;
  Result := True;
//  Result := False;
//  if not isActive then exit;
//  FillChar(buff, 1024, 0);
//  pcmd := @buff[0]; //pcmd ָ��buff ��ַ
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
//  p := PtrAdd(@buff[0], sizeof(TCmdTermSrvSetCircleArea_V3)); //p ָ�� buff �ƹ� ��֪�ṹ��
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
//  info^.Desc := '���ó�����������' + Dev.Car.No;
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
  tspBuf: array of Byte;//͸����������
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
    cx := round(Apoint.Longitude * 1000000);  // ����
    cy := round(Apoint.Latitude * 1000000);   // γ��
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
  info^.Desc := '���ò��������򵽳�����' + Dev.Car.No;
  info^.areaId := NoSymbolArea.AreaID;
  info^.areaSetType := 0;
  Result := True;

//  Result := False;
//  if not isActive then exit;
//  FillChar(buff, 1024, 0);
//  pcmd := @buff[0]; //pcmd ָ��buff ��ַ
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
//  p := PtrAdd(@buff[0], sizeof(TCmdTermSrvSetNoSymbolArea_V3)); //p ָ�� buff �ƹ� ��֪�ṹ��
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
//    cx := round(Apoint.Longitude * 1000000);  // ����
//    cy := round(Apoint.Latitude * 1000000);   // γ��
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
//  info^.Desc := '���ó�������������' + Dev.Car.No;
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
  tspBuf: array of Byte;//͸����������
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
  info^.Desc := 'ɾ�����õ������е�����' + Dev.Car.No;
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
//  pcmd := @buff[0]; //pcmd ָ��buff ��ַ
//  pCmd^.Size := 0;
//  pCmd^.Flag := Flag;//TCLIENT_CANCELCIRCLEAREA_V3;
//  pCmd^.ExtendedFlag := 0;
////  pCmd^.FactID := Dev.fact_id;
//  pCmd^.DevID := DevId_StrToBCD(Dev.Id);
//  pCmd^.CmdID := GetMaxCmdID;
//  GReadParamCmdID := pCmd^.CmdID;
//  pCmd^.count := AreaList.Count;
//
//  p := PtrAdd(@buff[0], sizeof(TCmdTermSrvCancelArea_V3)); //p ָ�� buff �ƹ� ��֪�ṹ��
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
//  info^.Desc := 'ɾ����������' + Dev.Car.No;
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
  info^.Desc := '���ͻָ�MCU����Ĭ��ֵ' + Dev.Car.No;
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
  info^.Desc := '���Ϳ���MCU��λ' + Dev.Car.No;
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
  tspBuf: array of Byte;//͸����������
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
begin
  Result := false;
  if not isActive then exit;
  tspPackSize := SizeOf(TCmdTermSrvControlTerminalTSP_V3)  + 1;//��1λУ����
  if controlParam <> '' then
    tspPackSize := tspPackSize + Length(controlParam);
  InitTSPHeader(cmd.Header, tspPackSize - TSPHEADERLEN - 1, TERMSRV_CONTROLTERMINAL_V3, Dev.Id);
  cmd.ControlID := ControlID;

  SetLength(tspBuf, tspPackSize + 2);//���������İ����ڰ����˼ӱ�ʶλ
  offSet := 0;
  tspBuf[offset] := FLAGTSP;//��ʶλ
  Inc(offSet);

  CopyMemory(@tspBuf[offset], @cmd, SizeOf(TCmdTermSrvControlTerminalTSP_V3));
  Inc(offSet, SizeOf(TCmdTermSrvControlTerminalTSP_V3));

  if controlParam <> '' then
  begin
    CopyMemory(@tspBuf[offset], @controlParam[1], Length(controlParam));
    Inc(offSet, Length(controlParam));
  end;

  tspBuf[offSet] := GetXorSum(@tspBuf[1], tspPackSize - 1);//����Ϣͷ��ʼ����������ʶλ
  Inc(offSet);

  tspBuf[offSet] := FLAGTSP;//��ʶλ
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(Dev, escapByteBuf);

  info^.Desc := '�����ն˿�����Ϣ��' + dev.Car.No+'��'+inttostr(ControlID);

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
//  pcmd := @buff[0]; //pcmd ָ��buff ��ַ
//  pCmd^.Size := Len;
//  pCmd^.Flag := TERMSRV_CONTROLTERMINAL_V3;
//  pCmd^.ExtendedFlag := 0;
////  pCmd^.FactID := Dev.fact_id;
//  pCmd^.DevID := DevId_StrToBCD(Dev.id);
//  pCmd^.CmdID := GetMaxCmdID;
//  pCmd^.ControlID := ControlID;
//  p := PtrAdd(@buff[0], sizeof(TCmdTermSrvControlTerminal_V3)); //p ָ�� buff �ƹ� ��֪�ṹ��
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

//  info^.Desc := '�����ն˿�����Ϣ��' + dev.Car.No+'��'+inttostr(ControlID);
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
//  info^.Desc := '�����ն˿�����Ϣ��' + dev.Car.No +IntToStr(ControlID);
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
  info^.Desc := '��' + Dev.Car.No + '���ʹ洢Χ��';
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
  info^.Desc := '��ȡ' + Dev.Car.No + '����Χ��';
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
    //====��ȡ�������е���Χ��==/
    datalen := PCmdSrvTermREADSAVEELCFENCE_New(ABuf)^.Size;
    ALen := sizeof(TCmdTermSrvREADSAVEELCFENCE_New);
    setlength(buffAll, datalen);
    CopyMemory(@buffAll[0], Abuf, datalen);
    bufflen := datalen - ALen; //ID���ܳ���
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

      //====����combobox1��ֵ�е�����ID ���������====//
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
                        subitems.Add('������');
                      end;
                    1:
                      begin
                        subitems.Add('�����򱨾�');
                      end;
                    2:
                      begin
                        subitems.Add('�����򱨾�');
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
                        subitems.Add('������');
                      end;
                    1:
                      begin
                        subitems.Add('�����򱨾�');
                      end;
                    2:
                      begin
                        subitems.Add('�����򱨾�');
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
                        subitems.Add('������');
                      end;
                    1:
                      begin
                        subitems.Add('�����򱨾�');
                      end;
                    2:
                      begin
                        subitems.Add('�����򱨾�');
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
    ////////���͵����� ��   Ӧ��ɾ����Ӧ�Ĺ�ϵ

    copymemory(@allbuf[0], @p^.Content[11], arealength);
    //  // ɾ�������복���Ķ�Ӧ��ϵ
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
//      pCmdSrvTermCANCELDESIGNFENCE_New(ABuf)^.Ret); //�ɹ�ʱ����
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
  info^.Desc := '��' + Dev.Car.No + 'ɾ������Χ��';
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
//        s := '�յ�' + Dev.Car.No + '��' + FAllAreaManage.Find(pcmd^.areaID).AreaName + '���򱨾�';
//        SendMsg(devId, MSG_TYPE_AreaAlarm, s);
//      end
//      else
//      begin
//        s := '�յ�' + Dev.Car.No + '��' + FAllAreaManage.Find(pcmd^.areaID).AreaName + '���򱨾�';
//        SendMsg(devId, MSG_TYPE_AreaAlarm, s);
//      end;
//      PopMsg('���򱨾�', s);
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
  header.BizType :=BIZTYPE;//06	��ؿͻ���
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
      uGloabVar.SystemLog.AddLog('DealDevAreaAlarm_V3�쳣' + E.Message);
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

//����͸������
function TGateWayServerCom.SendCmdTSP_V3(dev: TDevice;
  tspByteBuf: TByteDynArray): PCmdInfo;
var
  cmd: TCmdTSP_V3;
  packSize: Integer;//�����������ĳ���
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
  tspBuf := EscapeByteBuf(PtrAdd(ABuf, SizeOf(TCmdTSP_V3)), tspDataSize, 0);//��ԭת���ֽ�����;
  DisposeTransparentData_V3(@tspBuf[0], p^.Header.CmdOrder);
end;

procedure TGateWayServerCom.DisposeTransparentData_V3(ABuf: PByte; cmdNo: Integer);
var
  cmdFlag: Word;
begin
  try
    cmdFlag := ByteOderConvert_Word(PWord(PtrAdd(ABuf, 1))^);
    case cmdFlag of
      SRVTREM_READDEVPARAM_V3: DealReadDevParamTSP_V3(PtrAdd(ABuf, 1), cmdNo);           //��ȡ����Ӧ��
  //    2: DealGpsDataTSP_V3(PtrAdd(ABuf, 1));                                      //��λ����5�ֽڵİ汾 ������
      SRVTERM_PGPSDATA_V3: DealGpsDataTSP_V3(PtrAdd(ABuf, 1), cmdNo);                    //��λ����
      SRVTERM_FINDPOSTION_V3: DealFindPostion_V3(PtrAdd(ABuf, 1), cmdNo);
      SRVTERM_EVENTUPLOAD_V3: DealEventUploadTSP_V3(PtrAdd(ABuf, 1), cmdNo);             //�¼�����
      SRVTERM_QUESTIONANSWER_V3: DealQuestionAnswer_V3(PtrAdd(ABuf, 1), cmdNo);          //���ʻش�
      SRVTERM_INFOMENU_V3: DealInfoMenu_V3(PtrAdd(ABuf, 1), cmdNo);                      //��Ϣ�㲥
      SRVTERM_DEVCONTROL_V3: DealDevControl_V3(PtrAdd(ABuf, 1), cmdNo);                  //��������
      SRVTERM_RUNRECDATAUPLOAD_V3: DealRunRecDataUpload_V3(PtrAdd(ABuf, 1), cmdNo);      //��ʻ��¼�������ϴ�
      SRVTERM_ERUNDATA_V3: DealERunDataUpload_V3(PtrAdd(ABuf, 1), cmdNo);                //�����˵��ϴ�
      SRVTERM_DRIVERINFO_V3: DealDriverInfoUpload_V3(PtrAdd(ABuf, 1), cmdNo);            //��ʻԱ�����Ϣ�ɼ��ϱ�
      SRVTREM_MEDIAEVENTUPLOAD_V3: DealMediaEventUpload_V3(PtrAdd(ABuf, 1), cmdNo);       //��ý���¼���Ϣ�ϴ�
      SRVTERM_MEDIADATAUPLOAD_V3: DealMediaDataUpload_V3(PtrAdd(ABuf, 1), cmdNo);        //��ý�����ݼ���Ӧ��
      SRVTERM_TSPDATAUPLOAD_V3: DealTSPDataUpload_V3(PtrAdd(ABuf, 1), cmdNo);            //��������͸��
      SRVTERM_COMPRESSEDDATA_V3: DealCompressedDataUpload_V3(PtrAdd(ABuf, 1), cmdNo);    //����ѹ���ϴ�
      SRVTERM_DRIVERLOGIN_V3: DealDriverLogin_V3(PtrAdd(ABuf, 1), cmdNo);                //˾��ǩ��
      SRVTERM_DRIVERLOGOUT_V3: DealDriverLogout_V3(PtrAdd(ABuf, 1), cmdNo);              //˾��ǩ��
      SRVTERM_TRANSPORTSTART_V3: DealTransportStart_V3(PtrAdd(ABuf, 1), cmdNo);          //���俪ʼ
      SRVTERM_TRANSPORTEND_V3: DealTransportEnd_V3(PtrAdd(ABuf, 1), cmdNo);              //�������
    end;
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DisposeTransparentData_V3�쳣' + E.Message);
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
  paramStr: string; //��������
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
  isMultiPack: Boolean;//�Ƿ�ְ���
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
    ReadParamFrm.Label90.Caption := '��ȡ�����ɹ�����';
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

      //���������ݴ桡paramContent
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
      if Len = 4 then  //IP��ַ����
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
        $0050: //'�������α�־';
          begin
            i:=0;
            while i<32 do //0-32
            begin
              ReadParamFrm.cxCheckListBox56.Items[i].Checked := (((ParamLongWord shr i) and $01) = $01);//ParamByte[0 + i div 8] and (1 shl (i mod 8)) = (1 shl (i mod 8));
              inc(i);
            end;
          end;
        $0051: //'�������α�־';
          begin
            i:=0;
            while i<32 do //0-32
            begin
              ReadParamFrm.cxCheckListBox1.Items[i].Checked := (((ParamLongWord shr i) and $01) = $01);//ParamByte[0 + i div 8] and (1 shl (i mod 8)) = (1 shl (i mod 8));
              inc(i);
            end;
          end;
        $0052: //'�������α�־';
          begin
            i:=0;
            while i<32 do //0-32
            begin
              ReadParamFrm.cxCheckListBox2.Items[i].Checked := (((ParamLongWord shr i) and $01) = $01);//ParamByte[0 + i div 8] and (1 shl (i mod 8)) = (1 shl (i mod 8));
              inc(i);
            end;
          end;
        $0053: //'�������α�־';
          begin
            i:=0;
            while i<32 do //0-32
            begin
              ReadParamFrm.cxCheckListBox3.Items[i].Checked := (((ParamLongWord shr i) and $01) = $01);//ParamByte[0 + i div 8] and (1 shl (i mod 8)) = (1 shl (i mod 8));
              inc(i);
            end;
          end;
        $0054: //'�������α�־';
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
        //  TDebug.GetInstance.SendDebug('���豸�����ķ��������д���', '������ţ�$' + IntToHex(paramID, 4));
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
      uGloabVar.SystemLog.AddLog('��ȡ���������쳣' + E.Message);
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
  packSize: Integer;//�����������ĳ���
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
  header.BizType :=BIZTYPE;//06	��ؿͻ���
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
  dataLen: Integer;//��Ϣ�峤��
  p: PByte;
begin
  try
    pCmd := PCmdSrvTermGpsDataTSP_V3(ABuf);
    if TransCmdGpsDataTSP(PCmdSrvTermGpsDataTSP_V3(ABuf)^, d) then
    begin
      dataLen := ByteOderConvert_Word(PCmdSrvTermGpsDataTSP_V3(ABuf)^.Header.CmdProperty);
      if dataLen = GPSDATABODYLEN then//��Ϣ�峤�ȸպõ���Gps�����峤��
        ADeviceManage.ReceiveGpsData_V3(@d, False)
      else if dataLen - 2 > GPSDATABODYLEN then//��Ϣ�峤�ȴ���Gps�����峤�ȣ����и�����Ϣ���Ҹ�����Ϣ������3���ֽڵĳ���
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
      uGloabVar.SystemLog.AddLog('������͸����λ����(DealGpsDataTSP_V3)�쳣:' + E.Message);
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
    PopMsg('�¼�����', dev.Car.No + '�����¼���' + info);
    if Assigned(FEventListUpLoad) then FEventListUpLoad(dev, info, Now);
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealEventUploadTSP_V3�쳣' + E.Message);
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
        info := '�ش����';
      PopMsg('����Ӧ��','���⣺' + p^.QuestionInfo+#10#10 + dev.Car.No + '��' +
                        '�𰸣�' + {PAnswerInfo(p.AnswerList.Datas[PCmdSrvtermReportAnswer_V3(ABuf)^.AnswerID]).}info);

      uGloabVar.SystemLog.AddLog('���⣺' + p^.QuestionInfo+#10#10 + dev.Car.No + '��' +
                               '�𰸣�' + {PAnswerInfo(p.AnswerList.Datas[PCmdSrvtermReportAnswer_V3(ABuf)^.AnswerID]).}info);

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
        uGloabVar.SystemLog.AddLog('DealQuestionAnswer_V3�쳣' + E.Message);
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
      begin//�㲥
        if (infoType.AddDevId(dev.Id)) then
        begin
          Bs.AddDevInfoType(infoType.InfoTypeId, dev.Id);
          dev.AddInfoTypeId(infoType.InfoTypeId);
        end;
      end
      else
      begin//ȡ��
        if infoType.DelDevId(dev.Id) then
        begin
          Bs.DelDevInfoType(infoType.InfoTypeId, dev.Id);
          dev.DeleteInfoTypeId(infoType.InfoTypeId);
        end;
      end;
    end
    else
      infoName := '��δ֪����(' + IntToStr(pcmd^.InfoType) + ')��';
    msg := '����[' + dev.Car.No + ']';
    if pcmd^.SelOrQuit = 1 then
      msg := msg + '�㲥��'
    else
      msg := msg + 'ȡ����';
    msg := msg + #13#10 + infoName + '��Ϣ';

    PopMsg('��Ϣ�㲥/ȡ��', msg);
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealInfoMenu_V3�쳣' + E.Message);
    end;
  end;
  //��һ������
  {������}
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

   //����״̬λ�жϿ����Ƿ��
    if ((p^.CarControlContent =0) and (d.State and $00001000 = $00000000)) or        //0����     //��12λ
       ((p^.CarControlContent =1) and (d.State and $00001000 = $00001000)) then      // 1����
    begin
        PopMsg('��������Ӧ��', p^.Desc + ' �ɹ�');        //����
    end
    else
    begin
      PopMsg('��������Ӧ��', p^.Desc + '���ɹ�!');
    end;
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealDevControl_V3�쳣' + E.Message);
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
      uGloabVar.SystemLog.AddLog('DealDriverInfoUpload_V3�쳣' + E.Message);
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
      uGloabVar.SystemLog.AddLog('DealERunDataUpload_V3�쳣' + E.Message);
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
  tspBuf: array of Byte;//͸����������
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
    info^.Desc := Dev.Car.No + 'ֹͣ¼��'
  else if RecFlag =1 then
    info^.Desc := Dev.Car.No + '��ʼ¼��';
end;

function TGateWayServerCom.SendTSPData_V3(dev: TDevice; dataType: Byte;
  tspData: string): Boolean;
var
  info: PCmdinfo;
  len: Word;
  acmd: TCmdTermSrvTSPDataTSP_V3;
  tspBuf: array of Byte;//͸����������
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
  info^.Desc := Dev.Car.No + '͸����������';
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
    if pcmd^.TSPDataType <> 0 then//͸���ն�������Ϣ
      Exit;

    devId := BCDToStr(@(pcmd^.Header.DevId[0]));
    dev := ADeviceManage.find(devId);
    if dev <> nil then
    begin
      tspDataLen := (ByteOderConvert_Word(pcmd^.Header.CmdProperty) and $03FF) - 1;
      //SetLength(bufData, tspDataLen);

      p := PtrAdd(ABuf, SizeOf(TCmdSrvTermTSPDataTSP_V3));
      dType := p^;//$00 ä������  $01 �汾��Ϣ  $02-$FF ����������չ
      if dType = $01 then
      begin//͸���汾��Ϣ
        p := PtrAdd(p, 1);

        SetLength(data, tspDataLen - 1);
        CopyMemory(@data[1], p, tspDataLen);
        i := Pos(#0, data);
        while i > 0 do
        begin
          data[i] := #8;
          i := Pos(#0, data);
        end;
        PopMsg('��������͸��', dev.Car.No + '͸�����Ͱ汾��Ϣ');
        if Assigned(FOnTSPDataUpload) then
          FOnTSPDataUpload(dev, dType, Trim(data));
      end;
    end;
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealTSPDataUpload_V3�쳣' + E.Message);
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
      {�˴�����delphi�Դ��Ľ�ѹ���㷨����ȷ���Ƿ��복���ϴ���ѹ���㷨һ��}
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
          PopMsg('����ѹ���ϴ�', dev.Car.No + '�ϴ�ѹ������:' + #13#10 + str);
        except

        end;
      finally
        ms.Free;
      end;
    end;
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealCompressedDataUpload_V3�쳣' + E.Message);
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
      PopMsg('��ý�����ݼ���Ӧ��', dev.Car.No +'�ϴ���' + #13#10 + info^.Reason + '����');
    end
    else
    begin
      PopMsg('��ý�����ݼ���Ӧ��', dev.Car.No + #13 + #10 + '�� ' + info^.Reason+ '����');
    end;
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealMediaDataUpload_V3�쳣' + E.Message);
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
  tspBuf: array of Byte;//͸����������
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

  info^.Desc := '�ϴ�ָ��ʱ����ڵĶ�ý������';
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
  tspBuf: array of Byte;//͸����������
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

  if (polyLineArea.AreaAlarmKind and 1) = 1 then//��ʼ����ʱ��
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

  //·���ܹյ���
  PWord(p)^ := ByteOderConvert_Word(polyLineArea.PointCount);
  p := PtrAdd(p, 2);

  //�յ���
  j := 1;//��¼�յ�ID
  for i := 0 to polyLineArea.LineSectionCount - 1 do
  begin
    lineSection := polyLineArea.LineSections[i];
    if lineSection <> nil then
    begin
      for k := 0 to lineSection.PointCount - 1 do
      begin
        PLongWord(p)^ := ByteOderConvert_LongWord(j);//�յ�ID
        p := PtrAdd(p, 4);
        PLongWord(p)^ := ByteOderConvert_LongWord(lineSection.LineSectionId);//·��ID
        p := PtrAdd(p, 4);

        Apoint := Project.XY2LoLa(lineSection.WPointAry[k]);
        cx := round(Apoint.Longitude * 1000000);  // ����
        cy := round(Apoint.Latitude * 1000000);   // γ��
        PLongWord(p)^ := ByteOderConvert_LongWord(cy);//�յ�γ��
        p := PtrAdd(p, 4);
        PLongWord(p)^ := ByteOderConvert_LongWord(cx);//�յ㾭��
        p := PtrAdd(p, 4);

        p^ := lineSection.LineSectionWidth;//·�ο��
        p := PtrAdd(p, 1);
        p^ := lineSection.LineSectionProperty;//·������
        p := PtrAdd(p, 1);
        if (lineSection.LineSectionProperty and 1) = 1 then
        begin
          PWord(p)^ := ByteOderConvert_Word(lineSection.LineSectionRunMaxTime);//·����ʻ������ֵ
          p := PtrAdd(p, 2);
          PWord(p)^ := ByteOderConvert_Word(lineSection.LineSectionRunMinTime);//·����ʻ���㷧ֵ
          p := PtrAdd(p, 2);
        end;
        if (lineSection.LineSectionProperty shr 1 and 1) = 1 then
        begin
          PWord(p)^ := ByteOderConvert_Word(lineSection.LineSectionMaxSpeed);//·������ٶ�
          p := PtrAdd(p, 2);
          p^ := lineSection.LineSectionOverSpeedTime;//·�γ��ٳ���ʱ��
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
  info^.Desc := '����·�ߵ�������' + Dev.Car.No;
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
  tspBuf: array of Byte;//͸����������
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
  info^.Desc := Dev.Car.No + ' �ɼ���ʻ��¼����';
end;

function TGateWayServerCom.SendSetRecorderCarNo(dev: TDevice; carVin,
  carNo, carType: string): Boolean;
var
  info: PCmdinfo;
  len: Word;
  acmd: TCmdTermSrvSetRunRecParamTSP_V3;
  tspBuf: array of Byte;//͸����������
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
  info^.Desc := Dev.Car.No + ' ���ü�¼�ǳ���VIN�š����ƺš���������';
end;

function TGateWayServerCom.SendSetRecorderTime(dev: TDevice;
  time: TDateTime): Boolean;
var
  info: PCmdinfo;
  len: Word;
  acmd: TCmdTermSrvSetRunRecParamTSP_V3;
  tspBuf: array of Byte;//͸����������
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
  info^.Desc := Dev.Car.No + ' ���ü�¼��ʱ��';
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
      uGloabVar.SystemLog.AddLog('DealMediaUploadOK_V3�쳣' + E.Message);
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
  tspBuf: array of Byte;//͸����������
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
  begin//�˴��¼����ݵĽ����������¼����ɵ�ʱ�����
    pEvent := ADevice.EventItems[i];
    //д�� �¼�ID       1
    p^ := pEvent^.No;
    p := PtrAdd(p, 1);
    //�õ��¼��ĳ���  1
    eventLen := Length(pEvent^.Info);
    p^ := eventLen;
    p := PtrAdd(p, 1);
    InitStr(str0, eventLen);
    //д���¼���Ϣ        eventNoLen
    CopyMemory(@str0[1], @(pEvent^.info)[1], eventLen);
    CopyMemory(p, @str0[1], eventLen);
    p := PtrAdd(p, eventLen);
  end;
  if  ADevice.EventList.Count=0 then
    len := sizeof(TCmdTermSrvSetEventListTSP_V3)
  else
    len := Integer(p) - Integer(@buff[0]);
  InitTSPHeader(pacmd^.Header, len - TSPHEADERLEN, TERMSRV_SETEVENT_V3, ADevice.Id);

  tspPackSize := len + 3;//2����־λ + 1��У����
  SetLength(tspBuf, tspPackSize);
  offSet := 0;
  tspBuf[offset] := FLAGTSP;//��ʶλ
  Inc(offSet);
  CopyMemory(@tspBuf[offSet], @buff[0], len);
  Inc(offSet, len);
  tspBuf[offSet] := GetXorSum(@tspBuf[1], len);//����Ϣͷ��ʼ����������ʶλ
  Inc(offSet);
  tspBuf[offset] := FLAGTSP;//��ʶλ
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(ADevice, escapByteBuf);
  info^.Desc := '�����¼���' + ADevice.Car.No;

//  pcmd := @buff[0]; //pcmd ָ��buff ��ַ
//  InitHeader(pcmd^.Header,0,TERMSRV_SETEVENTLIST_V3,ADevice.id);
////
//  if  ADevice.EventList.Count=0 then
//    pcmd^.SetType := 0
//  else
//    pcmd^.SetType := 1;
//  { TODO -osjp : ���������� }
//  pcmd^.SetCount := ADevice.EventList.Count;
//  pcmd^.PackCount := 1;
//  p := PtrAdd(@buff[0], sizeof(TCmdTermSrvSetEventList_V3)); //p ָ�� buff �ƹ� ��֪�ṹ��
////  p^ := ADevice.EventList.Count;  // �¼������   1
////  p := PtrAdd(p, 1);
//  for i := 0 to ADevice.EventList.Count - 1 do
//  begin
//    pEvent := ADevice.EventItems[i];
//    //д�� �¼�ID       1
//    p^ := pEvent^.No;
//    p := PtrAdd(p, 1);
//    //�õ��¼��ĳ���  1
//    eventLen := Length(pEvent^.Info);
//    p^ := eventLen+1;
//    p := PtrAdd(p, 1);
//    InitStr(str0, eventLen);
//    //д���¼���Ϣ        eventNoLen
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
  tspBuf: array of Byte;//͸����������
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
      //д�� �绰����       1
      p^ := pTel^.TelType;
      p := PtrAdd(p, 1);
      //д��绰���볤��
      telNoLen := Length(pTel^.No);
      p^ := telNoLen;
      p := PtrAdd(p, 1);
      //д��绰����        telNoLen
      InitStr(str0, telNoLen);      
      CopyMemory(@str0[1], @(pTel^.No)[1], telNoLen);
      CopyMemory(p, @str0[1], telNoLen);
      p := PtrAdd(p, telNoLen);
      //д����ϵ�˳���
      p^ := Length(pTel^.Name);
      p := PtrAdd(p, 1);
      //д�롡�绰ӵ����    8
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
  info^.Desc := '���õ绰����' + ADevice.Car.No;
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
  tspBuf: array of Byte;//͸����������
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
      //д�� �¼�ID       1
      p^ := infoType.InfoTypeId;
      p := PtrAdd(p, 1);
      //�õ��¼��ĳ���  1
      eventLen := Length(infoType.InfoTypeName);
      PWord(p)^ := ByteOderConvert_Word(eventLen);
      p := PtrAdd(p, 2);

      InitStr(str0, eventLen);
      //д���¼���Ϣ        eventNoLen
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
  info^.Desc := '���ó�����Ϣ�˵���' + ADevice.Car.No;
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
      uGloabVar.SystemLog.AddLog('DealMediaEventUpload_V3�쳣' + E.Message);
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
      uGloabVar.SystemLog.AddLog('DealServerRunInfo_V3�쳣' + E.Message);
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
  tspBuf: array of Byte;//͸����������
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
  info^.Desc := Dev.Car.No + ' ���ü�¼�ǳ��ΰ�װʱ��';
end;

function TGateWayServerCom.SendSetInitMileage(dev: TDevice;
  initMileage: Integer): Boolean;
var
  info: PCmdinfo;
  len: Word;
  acmd: TCmdTermSrvSetRunRecParamTSP_V3;
  tspBuf: array of Byte;//͸����������
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
  info^.Desc := Dev.Car.No + ' ���ü�¼�ǳ�ʼ���';
end;

function TGateWayServerCom.SendSetPluse(dev: TDevice;
  pluse: Word): Boolean;
var
  info: PCmdinfo;
  len: Word;
  acmd: TCmdTermSrvSetRunRecParamTSP_V3;
  tspBuf: array of Byte;//͸����������
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
  info^.Desc := Dev.Car.No + ' ���ü�¼������ϵ��';
end;

function TGateWayServerCom.SendSetStatusParamName(dev: TDevice;
  sAry: TStringDynArray): Boolean;
var
  info: PCmdinfo;
  len: Word;
  acmd: TCmdTermSrvSetRunRecParamTSP_V3;
  tspBuf: array of Byte;//͸����������
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
  info^.Desc := Dev.Car.No + ' ���ü�¼��״̬�����ò���';
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
      pB := PtrAdd(p, SizeOf(TCmdSrvTermRunRecDataTSP_V3) + 6);//��ȷ���ݿ�ǰ��6���ֽڣ����ݿ����1���ֽڵ�У��λ �����¼���ϵ�Э��(2003)
      CopyMemory(@data[0], pB, Length(data) - 6 - 1);
      if Assigned(FOnRunRecDataUpload) then
        FOnRunRecDataUpload(p^.RunRecFlag, data, dev);
    end;
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealRunRecDataUpload_V3�쳣' + E.Message);
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
      uGloabVar.SystemLog.AddLog('DealAlarmSupervise_V3�쳣' + E.Message);
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
  info^.Desc := '�㱨���챨��������:' + aCarNo;
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
  tspBuf: array of Byte;//͸����������
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
    0: info^.Reason := '������������';
    1: info^.Reason := '��ʱ����';
    2: info^.Reason := '���ٱ�������';
    3: info^.Reason := '��ײ�෭��������';
  else
    info^.Reason := 'δ֪';
  end;
  info^.Desc := '������Ƶ���ݼ������' + Dev.Car.No + ' ' + info^.Reason;
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
            PopMsg('����Ƶ�ļ�', dev.Car.No + #13 + #10 + '����Ƶ�ļ���');
            
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
      uGloabVar.SystemLog.AddLog('DealCheckDuty_V3�쳣' + E.Message);
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
      uGloabVar.SystemLog.AddLog('DealGovAlarm_V3�쳣' + E.Message);
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
      uGloabVar.SystemLog.AddLog('DealGovEarlyWarning_V3�쳣' + E.Message);
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

      tmpLW := GpsData.State; //ȡ״̬
      for i := 0 to 31 do             // �ܹ���32λ����������ݱ���
      begin
        dev.Switch[i] := (tmpLW and $1) = $1;
        tmpLW := tmpLW shr 1;
      end;

      tmpLW := GpsData.Alarm;  // ȡ������־
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
      uGloabVar.SystemLog.AddLog('DealGovGpsData_V3�쳣' + E.Message);
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
    str := '����ƽ̨�·�' + inttostr(pCmd^.GpsDataCount) + '��������λ��Ϣ,��' + FormatDateTime('yyyy-MM-dd hh:nn:ss', GetGovAlarmGpsTime(pCmd^.STime)) + '��' + FormatDateTime('yyyy-MM-dd hh:nn:ss', GetGovAlarmGpsTime(pCmd^.ETime));
    govInfo.Msg := str;
    if Assigned(FOnGovInfo) then
      FOnGovInfo(govInfo);
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealGovGpsDataCount_V3�쳣' + E.Message);
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
      uGloabVar.SystemLog.AddLog('DealGovTextInfo_V3�쳣' + E.Message);
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
    TERMSRV_REPLYGOVCHECKDUTY: info^.Desc := '�ظ�ƽ̨���';
  else
    info^.Desc := '�ظ�����ƽ̨������Ϣ'
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
    Result := 'δ֪[' + IntToStr(reasonId) + ']';
    case reasonId of
      $00: Result := '��������ָ������';
      $01: Result := '�˹�ֹͣ����';
      $02: Result := '����������';
      $03: Result := '��������';
      $04: Result := '����ԭ��';
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
    govInfo.Msg := '��������������λ��Ϣ:���ƺ�[' + Trim(str) + '],������ɫ[' + GetCarCpColor(pCmd^.CarCpColor) + '],ԭ��[' + GetEndReason(pCmd^.Reason) + ']';
    if Assigned(FOnGovInfo) then
      FOnGovInfo(govInfo);
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealGovEndGpsData_V3�쳣' + E.Message);
    end;
  end;
end;

procedure TGateWayServerCom.DealGovStartGpsData_V3(ABuf: PByte);
  function GetStartReason(reasonId: Integer): string;
  begin
    Result := 'δ֪[' + IntToStr(reasonId) + ']';
    case reasonId of
      $00: Result := '��������ָ������';
      $01: Result := '�˹�ָ������';
      $02: Result := 'Ӧ��״̬������Ϣ�ش�';
      $03: Result := '����ԭ��';
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
    govInfo.Msg := '��ʼ����������λ��Ϣ:���ƺ�[' + Trim(str) + '],������ɫ[' + GetCarCpColor(pCmd^.CarCpColor) + '],ԭ��[' + GetStartReason(pCmd^.Reason) + ']';
    if Assigned(FOnGovInfo) then
      FOnGovInfo(govInfo);
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealGovStartGpsData_V3�쳣' + E.Message);
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
  info^.Desc := '���뽻��ָ��������Ϣ';
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
  info^.Desc := 'ȡ������ָ��������Ϣ';
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
  tspBuf: array of Byte;//͸����������
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

  info^.Desc := '�ϴ�������ý������';
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

    msgTitle := '��ʻԱǩ��';
    msgContent := '��ʻԱ[' + driverLogInfo.DriverInfo.DriverName + '(' + driverLogInfo.DriverInfo.DriverIDNo + ')]��' + FormatDateTime('yyyy-MM-dd hh:nn:ss', driverLogInfo.GpsTime) + '�ڳ���[' + dev.Car.No + ']��ǩ��';
    if Assigned(FOnDevKeyEvent) then
      FOnDevKeyEvent(dev, msgTitle, msgContent);
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealDriverLogin_V3�쳣' + E.Message);
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
    dev.Login_Driver := 'δ��¼';

    msgTitle := '��ʻԱǩ��';
    msgContent := '��ʻԱ[' + driverLogInfo.DriverInfo.DriverName + '(' + driverLogInfo.DriverInfo.DriverIDNo + ')]��' + FormatDateTime('yyyy-MM-dd hh:nn:ss', driverLogInfo.GpsTime) + '�ڳ���[' + dev.Car.No + ']��ǩ��';
    if Assigned(FOnDevKeyEvent) then
      FOnDevKeyEvent(dev, msgTitle, msgContent);
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealDriverLogout_V3�쳣' + E.Message);
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

    msgTitle := '��������';
    msgContent := '����[' + dev.Car.No + ']�������䣬����ʱ��:' + FormatDateTime('yyyy-MM-dd hh:nn:ss', gpsTime) + '��γ��:' + FormatFloat('#0.######', longX) + '��' + FormatFloat('#0.######', latY) + '�����˵���:' + eRunNo;
    if Assigned(FOnDevKeyEvent) then
      FOnDevKeyEvent(dev, msgTitle, msgContent);
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealTransportEnd_V3�쳣' + E.Message);
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

    msgTitle := '��ʼ����';
    msgContent := '����[' + dev.Car.No + ']��ʼ���䣬��ʼʱ��:' + FormatDateTime('yyyy-MM-dd hh:nn:ss', gpsTime) + '��γ��:' + FormatFloat('#0.######', longX) + '��' + FormatFloat('#0.######', latY) + '�����˵���:' + eRunNo;
    if Assigned(FOnDevKeyEvent) then
      FOnDevKeyEvent(dev, msgTitle, msgContent);
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealTransportStart_V3�쳣' + E.Message);
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
//  info^.Desc := '�����ϱ�����������';
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
  tspBuf: array of Byte;//͸����������
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
begin
  Result := false;
  if not isActive then exit;
  if dev = nil then Exit;
  tspPackSize := SizeOf(TCmdTSPSetAllDevParam_V3) + Length(paramData) + 1;//��1λУ����
  InitTSPHeader(cmd.TSPHeader, tspPackSize - TSPHEADERLEN - 1, TERMSRV_SETDEVPARAM_V3, dev.Id);
  cmd.ParamCnt := paramCount;
  SetLength(tspBuf, tspPackSize + 2);//���������İ����ڰ����˼ӱ�ʶλ
  offSet := 0;
  tspBuf[offset] := FLAGTSP;//��ʶλ
  Inc(offSet);

  CopyMemory(@tspBuf[offset], @cmd, SizeOf(TCmdTSPSetAllDevParam_V3));
  Inc(offSet, SizeOf(TCmdTSPSetAllDevParam_V3));

  CopyMemory(@tspBuf[offset], @paramData[0], Length(paramData));
  Inc(offSet, Length(paramData));

  tspBuf[offSet] := GetXorSum(@tspBuf[1], tspPackSize - 1);//����Ϣͷ��ʼ����������ʶλ
  Inc(offSet);

  tspBuf[offSet] := FLAGTSP;//��ʶλ
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(dev, escapByteBuf);
  GSetParamCmdID := info^.id;
  info^.State := CMD_SNDNODO;
  info^.Desc := dev.Car.No + '���ò�����';
  Result := True;
end;

function TGateWayServerCom.SendSetDriverInfo_Old(dev: TDevice; driverNo: Integer;
  driverLicense: string): Boolean;
var
  info: PCmdinfo;
  len: Word;
  acmd: TCmdTermSrvSetRunRecParamTSP_V3;
  tspBuf: array of Byte;//͸����������
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
  w: LongWord;
  rrParamBuf: array of Byte;//��װGB/T 19056 ��¼�ǲ�������������
begin
  Result := false;
  if not isActive then exit;
//****************************���������ü�¼�ǲ�����****************************
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
//****************************���������ü�¼�ǲ�����****************************  

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
  info^.Desc := Dev.Car.No + ' ���ü�¼�Ǽ�ʻԱ���롢��ʻ֤����';
end;

function TGateWayServerCom.SendSetCarInfo_Old(dev: TDevice; carVin, carNo,
  carType: string): Boolean;
var
  info: PCmdinfo;
  len: Word;
  acmd: TCmdTermSrvSetRunRecParamTSP_V3;
  tspBuf: array of Byte;//͸����������
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
  w: LongWord;
  rrParamBuf: array of Byte;//��װGB/T 19056 ��¼�ǲ�������������
begin
  Result := false;
  if not isActive then exit;
//****************************���������ü�¼�ǲ�����****************************
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
//****************************���������ü�¼�ǲ�����****************************  

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
  info^.Desc := Dev.Car.No + ' ���ü�¼�ǳ���VIN�š����ƺš���������';
end;

function TGateWayServerCom.SendSetRecorderTime_Old(dev: TDevice;
  time: TDateTime): Boolean;
var
  info: PCmdinfo;
  len: Word;
  acmd: TCmdTermSrvSetRunRecParamTSP_V3;
  tspBuf: array of Byte;//͸����������
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
  w: LongWord;
  dateBuf: array[0..5] of Byte;
  rrParamBuf: array of Byte;//��װGB/T 19056 ��¼�ǲ�������������
begin
  Result := false;
  if not isActive then exit;
//****************************���������ü�¼�ǲ�����****************************
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
//****************************���������ü�¼�ǲ�����****************************  

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
  info^.Desc := Dev.Car.No + ' ���ü�¼��ʱ��';
end;

function TGateWayServerCom.SendSetCarProperty_Old(dev: TDevice;
  carProperty: Integer): Boolean;
var
  info: PCmdinfo;
  len: Word;
  acmd: TCmdTermSrvSetRunRecParamTSP_V3;
  tspBuf: array of Byte;//͸����������
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
  w: LongWord;
  rrParamBuf: array of Byte;//��װGB/T 19056 ��¼�ǲ�������������
begin
  Result := false;
  if not isActive then exit;

//****************************���������ü�¼�ǲ�����****************************
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
//****************************���������ü�¼�ǲ�����****************************

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
  info^.Desc := Dev.Car.No + ' ���ü�¼�ǳ�������ϵ��';
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
  //�������SAVE_CMD_COUNT������ɾ��ǰ��ġ�
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
//            for _V2 �ڶ��汾�õ���Э��
//-------------------------------------------------------//
//=======================================================//





function TGateWayServerCom.CallTarget(const ATargetID: Integer): Boolean; //����ָ������
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
//    info^.Desc := '���г�����' + Dev.Car.No;
//  end
//  else
//  begin
//    info^.Desc := '����δ֪����';
//  end;
//  info^.SendTime := now();
//  info^.CancelTime := 0;
//  info^.Replytime := 0;
//  SetLength(info^.Content, cmd.Size);
//  Move(cmd, info^.Content[0], cmd.Size);
//  info^.ContentSize := cmd.Size;
end;

procedure TGateWayServerCom.DealGpsData_V3(ABuf: PByte); //����Gps���ص�����
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
      һ�����������ݰ������¼�����ɣ�
      ��ʶλ + ��Ϣͷ + ��Ϣ�� + У���� + ��ʶλ
    }
    dataLen := pFindPos^.Header.Size;
    offset := SizeOf(THead_V3) + 1;
    while offset < dataLen do
    begin
      Inc(offset, 6);//ƫ��6���ֽڵ��豸��
      Inc(offset, 1);//ƫ��һ����ʶλ
      pB := PtrAdd(ABuf, offset);//λ����Ϣͷ��ʼ
      pGpsData := PCmdSrvTermGpsDataTSP_V3(pB);
      DealGpsDataTSP_V3(pB, 0);
                        //ͷ����         //��Ϣ��ó���                                                //У���� + ��ʶλ
      offset := offset + TSPHEADERLEN +  ByteOderConvert_Word(pGpsData^.Header.CmdProperty) and $03FF + 1 + 1;//ƫ��һ��������λ����Ϣ��
    end;
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('DealLastGpsData_V3�쳣' + E.Message);
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

 //����״̬λ�жϿ����Ƿ��
  if ((p^.CarControlContent =0) and (d.State and $00001000 = $00000000)) or        //0����     //��12λ
     ((p^.CarControlContent =1) and (d.State and $00001000 = $00001000)) then      // 1����
  begin
      PopMsg('��������Ӧ��', p^.Desc + ' �ɹ�');        //����
  end
  else
  begin
    PopMsg('��������Ӧ��', p^.Desc + '���ɹ�!');
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
  dataLen: Integer;//��Ϣ�峤��
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
      if dataLen = GPSDATABODYLEN + 2 then//��Ϣ�峤�ȸպõ���Gps�����峤�� + 2λӦ��
        ADeviceManage.ReceiveGpsData_V3(@d, False)
      else if dataLen - (2 + 2) > GPSDATABODYLEN then//��Ϣ�峤�ȴ���Gps�����峤�ȣ����и�����Ϣ���Ҹ�����Ϣ������3���ֽڵĳ���
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
      uGloabVar.SystemLog.AddLog('DealFindPostion_V3�쳣' + E.Message);
    end;
  end;
end;

//-------------------------------------------------------------------------------------------

function TGateWayServerCom.PursueCar_V3(dev: TDevice; ShuXing: Byte; PursueInterval: word; JianGe: LongWord): boolean; //
var
  cmd: TCmdTermSrvPursueCarTSP_V3;//TCmdTermSrvSetDevParam_V3;//TCmdTermSrvSetDevParam_V2;
  buf: array of Byte;
  info: PCmdinfo;
  tspBuf: array of Byte;//͸����������
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
begin
  Result := false;
  if not isActive then exit;
  tspPackSize := SizeOf(TCmdTermSrvPursueCarTSP_V3)  + 1;//��1λУ����
  InitTSPHeader(cmd.Header, tspPackSize - TSPHEADERLEN - 1, TERMSRV_PURSUECAR_V3, Dev.Id);
  cmd.Interval := ByteOderConvert_Word(PursueInterval);
  cmd.Duration := ByteOderConvert_LongWord(JianGe);

  SetLength(tspBuf, tspPackSize + 2);//���������İ����ڰ����˼ӱ�ʶλ
  offSet := 0;
  tspBuf[offset] := FLAGTSP;//��ʶλ
  Inc(offSet);

  CopyMemory(@tspBuf[offset], @cmd, SizeOf(TCmdTermSrvPursueCarTSP_V3));
  Inc(offSet, SizeOf(TCmdTermSrvPursueCarTSP_V3));

  tspBuf[offSet] := GetXorSum(@tspBuf[1], tspPackSize - 1);//����Ϣͷ��ʼ����������ʶλ
  Inc(offSet);

  tspBuf[offSet] := FLAGTSP;//��ʶλ
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(Dev, escapByteBuf);

  if PursueInterval > 0 then
    info^.Desc := '��ʱλ�ø��٣�' + dev.Car.No
  else
    info^.Desc := 'ȡ����ʱλ�ø��٣�' + dev.Car.No;
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
  pcmd := @buff[0]; //pcmd ָ��buff ��ַ
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
  p := PtrAdd(@buff[0], sizeof(TCmdSrvtermAntiFake_V3)); //p ָ�� buff �ƹ� ��֪�ṹ��

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
  info^.Desc := '���ͷ�α��־��' + dev.Car.No;

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
  pcmd := @buff[0]; //pcmd ָ��buff ��ַ
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
  p := PtrAdd(@buff[0], sizeof(TCmdSrvtermAntiFake_V3)); //p ָ�� buff �ƹ� ��֪�ṹ��

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
  info^.Desc := '���ͷ�α��־��' + dev.Car.No;

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

  info^.Desc := 'ֹͣ��ʾ��α��־��' + dev.Car.No ;

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
  tspBuf: array of Byte;//͸����������
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
  info^.Desc := '���ͻز��绰��' + dev.Car.No + '[' + TelNo+']';
  if currAlarmInfo <> nil then
  begin
    info^.alarmInfoId := currAlarmInfo.Id;
    info^.alarmDealFlag := 1;
  end;


//  len := SizeOf(TCmdSrvtermBackCallTel_V3)+length(TelNo)+1;
//  pcmd := @buff[0]; //pcmd ָ��buff ��ַ
//  InitHeader(pcmd^.Header,len,TERMSRV_BACKCALLTEL_V3,dev.Id);
//
//  pCmd^.Sign := Sign;
//  p := PtrAdd(@buff[0], sizeof(TCmdSrvtermBackCallTel_V3)); //p ָ�� buff �ƹ� ��֪�ṹ��
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
//  info^.Desc := '���ͻز��绰��' + dev.Car.No + '[' + TelNo+']';
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
  tspBuf: array of Byte;//͸����������
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
    info^.Desc := '���Ž���'+Dev.Car.No
  else if ControlCmd =1 then
    info^.Desc := '���ż���'+Dev.Car.No;
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
//    info^.Desc := '���Ž���'+Dev.Car.No
//  else if ControlCmd =1 then
//    info^.Desc := '���ż���'+Dev.Car.No;
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
  tspBuf: array of Byte;//͸����������
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
  begin//��ʱ���͵ķ�����Ϣ����ʾӦ����Ϣ
    ACmdManage.Delete(info^.Id);
  end
  else
    info^.Desc := '������Ϣ����' + dev.Car.No;

//  Len := SizeOf(TCmdSrvtermInfoServer_V3);
//  pcmd := @buff[0]; //pcmd ָ��buff ��ַ
//  pCmd^.Size := Len;
//  pCmd^.Flag := TERMSRV_INFOSERVER_V3;
//  pCmd^.ExtendedFlag := 0;
////  pCmd^.FactID := dev.fact_id;
//  pCmd^.DevID :=DevId_StrToBCD(Dev.id);
//  pCmd^.CmdID := GetMaxCmdID;
//  pCmd^.Sign := Sign;
//  p := PtrAdd(@buff[0], sizeof(TCmdSrvtermInfoServer_V3)); //p ָ�� buff �ƹ� ��֪�ṹ��
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
//  info^.Desc := '������Ϣ����' + dev.Car.No;
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
  tspBuf: array of Byte;//͸����������
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
    0: info^.Reason := '������������';
    1: info^.Reason := '��ʱ����';
    2: info^.Reason := '���ٱ�������';
    3: info^.Reason := '��ײ�෭��������';
    4: info^.Reason := 'ƣ�ͱ�������';
  else
    info^.Reason := 'δ֪';
  end;
  info^.Desc := '���ʹ洢ͼƬ�������' + Dev.Car.No + ' ' + info^.Reason;
end;

function TGateWayServerCom.SendQueryAudio_V3(dev: TDevice; channelId: Byte; Reason: Byte; beginDataTime: string;
                                  endDateTime: string; timeBool: Boolean): Boolean;
var
  dateTime: TDateTime;
  info: PCmdinfo;
  len: Word;
  acmd: TCmdTermSrvQueryMediaTSP_V3;
  tspBuf: array of Byte;//͸����������
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
    0: info^.Reason := '��������¼��';
    1: info^.Reason := '��ʱ¼��';
    2: info^.Reason := '���ٱ���¼��';
    3: info^.Reason := '��ײ�෭����¼��';
    4: info^.Reason := 'ƣ�ͱ���¼��';
  else
    info^.Reason := 'δ֪';
  end;
  info^.Desc := '������Ƶ���ݼ������' + Dev.Car.No + ' ' + info^.Reason;
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
  info^.Desc := '���ʹ洢ͼƬ�ϴ����' + Dev.Car.No;
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
  info^.Desc := '���ʹ洢��Ƭ/��Ƶ�ϴ����' + Dev.Car.No;
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
  info^.Desc := '����Ѳ�죺' + Dev.Car.No;
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

  cmd := @buff[0]; //pcmd ָ��buff ��ַ
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
  
  p := PtrAdd(@buff[0], sizeof(TCmdSrvtermSend_V3)); //p ָ�� buff �ƹ� ��֪�ṹ��

  CopyMemory(p, @Buf[0], len);
  p := PtrAdd(p, len);
  cmd^.Size := Integer(p) - Integer(@buff[0]);

  Result := DirectSend(buff[0], Cmd.Size);

  frmSend.Memo2.Text := MemFormatUnit.BuffToHex(@Buff[0], Cmd.Size);

  info := ACmdManage.Add(Cmd.CmdId);
  info^.Id := Cmd.CmdId;
  info^.State := CMD_SNDNODO;
  info^.Desc := '�û��Զ���ָ�' + Dev.Car.No;
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
  tspBuf: array of Byte;//͸����������
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
  dev: TDevice;
begin
  Result := false;
  if not isActive then exit;
  dev := ADeviceManage.find(ATargetID);
  if dev = nil then Exit;
  tspPackSize := SizeOf(TCmdTSPSetDevParam_V3) + ParamSize + 1;//��1λУ����
  InitTSPHeader(cmd.TSPHeader, tspPackSize - TSPHEADERLEN - 1, TERMSRV_SETDEVPARAM_V3, ATargetID);
  cmd.ParamCnt := 1;
//  cmd.ParamPackCnt := 1;
  cmd.ParamId := ByteOderConvert_LongWord(ParamID);
  cmd.ParamSize := ParamSize;
  SetLength(tspBuf, tspPackSize + 2);//���������İ����ڰ����˼ӱ�ʶλ
  offSet := 0;
  tspBuf[offset] := FLAGTSP;//��ʶλ
  Inc(offSet);

  CopyMemory(@tspBuf[offset], @cmd, SizeOf(TCmdTSPSetDevParam_V3));
  Inc(offSet, SizeOf(TCmdTSPSetDevParam_V3));

  CopyMemory(@tspBuf[offset], param, ParamSize);
  Inc(offSet, ParamSize);

  tspBuf[offSet] := GetXorSum(@tspBuf[1], tspPackSize - 1);//����Ϣͷ��ʼ����������ʶλ
  Inc(offSet);

  tspBuf[offSet] := FLAGTSP;//��ʶλ
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(dev, escapByteBuf);
  GSetParamCmdID := info^.id;
  info^.State := CMD_SNDNODO;
  info^.Desc := '���ò�����' + ReturnParamName(ParamID) + '��' + dev.Car.No;
  Result := True;
end;

function TGateWayServerCom.ReadDevParam_V3(dev: TDevice;
  AParamId: word): boolean;
var
  cmd: TCmdTSPReadDevParam_V3;
  buf: array of Byte;
  info: PCmdinfo;
  tspBuf: array of Byte;//͸����������
  tspPackSize: Word;
  offSet: Integer;
  escapByteBuf: TByteDynArray;
begin
  Result := false;
  if not isActive then exit;
  tspPackSize := SizeOf(TCmdTSPReadDevParam_V3) + 1;//��1λУ����
  InitTSPHeader(cmd.TSPHeader, tspPackSize - TSPHEADERLEN - 1, TERMSRV_READDEVPARAM_V3, dev.Id);
//  cmd.ParamId := ByteOderConvert_Word(AParamId);
  SetLength(tspBuf, tspPackSize + 2);//���������İ����ڰ����˼ӱ�ʶλ
  offSet := 0;
  tspBuf[offset] := FLAGTSP;//��ʶλ
  Inc(offSet);

  CopyMemory(@tspBuf[offset], @cmd, SizeOf(TCmdTSPReadDevParam_V3));
  Inc(offSet, SizeOf(TCmdTSPReadDevParam_V3));

  tspBuf[offSet] := GetXorSum(@tspBuf[1], tspPackSize - 1);//����Ϣͷ��ʼ����������ʶλ
  Inc(offSet);

  tspBuf[offSet] := FLAGTSP;//��ʶλ
  escapByteBuf := EscapeByteBuf(@tspBuf[0], Length(tspBuf), 0);
  info := SendCmdTSP_V3(dev, escapByteBuf);
  GReadParamCmdID := info^.Id;
  info^.State := CMD_SNDNODO;
  info^.Desc := '������������' + dev.Car.No;
  Result := True;
end;

end.

