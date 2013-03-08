{�豸����Ϣ
 @created(2004-03-19)
 @lastmod(GMT:$Date: 2012/12/31 05:06:19 $) <BR>
 ��������:$Author: wfp $<BR>
 ��ǰ�汾:$Revision: 1.2 $<BR>}

unit CarUnit;
interface
{$A+}
uses
  Classes, Windows, CmdStructUnit, IntegerListUnit, MetaDefine, CycListUnit,
  QGraphics, SysUtils, StrUtils, ExtCtrls, StdCtrls, Controls, emapker, Contnrs, ConfineAreaUnit,
  ConstDefineUnit, Service, MMSystem, elog, OleServer,  MSNPopUp, Types, Forms,
  IniFiles;
const
  STAT_NEWDEVICE_GIS = 24; //24��31λ��ʾ��Ŀ���������ӵ�Ŀ��
  STAT_NEWDATA_GIS = 1;
  STAT_USER_ALARM = 0;
{  STAT_LOCATE = 9;
  STAT_MONITOR = 10;
  STAT_Gpsantenna = 11; }
  STAT_GPS_LOCATE = 1;
  STAT_GPRS_ONLINE = 9;
  STAT_DEVICE_CONNECTED = 12;

  STAT_DDS_ONLINE = 13;//DDS����
  STAT_DDS_EXCURSIVE = 14;//DDSƫ��
  STAT_DDS_ALARM = 15;//DDSƣ�ͱ���
  //-------------��----------------------------

type

  TSendMsg = procedure(ADevID: String; AType: byte; MsgStr: string) of object;
  TDevice = class;
  TEarlyWarningCar = class;

  //����Խ�籨��   ��ʻ�뱨��
  //    AlarmType = ALARM_OUT Խ�籨��
  //����AddorDel=True-���޵���-Խ�籨����
  //            =False-���е���-Խ�絽��Խ�磬�������б���ԭ�е�������ʷ
  //--------
  //    AlarmType = ALARM_IN ʻ�뱨��
  //    AddorDel=True -ʻ������-ʻ�뱨��;
  //            =False-ʻ������,��ʻ�뵽ʻ�����������б���ԭ�е�������ʷ
  TDevAlarm_OutorInCAreaEvent = procedure(Adev: TDevice; AlarmType: byte; AddorDel: Boolean; AArea: TConfineArea) of object;
  TDevEvent = procedure(Dev: TDevice) of object;
  //GPS��λ�����еĸ��౨���¼� :���١���ѹ���ϵ硢���������򱨾���ƣ�ͱ�����ƫ��·�߱������������...
  TDevAllKindsOfAlarmEvent = procedure(Dev: TDevice;AlarmKind: Byte) of object;

  TEarlyWarningEvent = procedure(changePage: Boolean; EarlyWarningCar: TEarlyWarningCar) of object;

  TCarOverSpeedAlarmEvent = procedure(dev: TDevice; areaType: Byte; alarmAreaId: Integer) of object;
  TCarInOutAreaAlarmEvent = procedure(dev: TDevice; areaType: Byte; alarmAreaId: Integer; flag: Byte) of object;
  TCarRunTimeAlarmEvent = procedure(dev: TDevice; alarmLineSectionId: Integer; runTime: Integer; flag: Byte) of object;
  TGpsDataAlarmEvent = procedure(dev: TDevice; alarmType: Integer) of object;
  TCarIOAreaOnTimeAlarmEvent = procedure(dev: TDevice; alarmType: Integer; alarmTime: TDateTime; memo: string) of object;
  TCarAccOffMoveAlarmEvent = procedure(dev: TDevice; alarmTime: TDateTime; memo: string) of object;
  TDevOnLineStatusChanged = procedure(dev: TDevice) of object;
  TDevOnFatigueAlarm = procedure(dev: TDevice) of object;

  TDevParam = record //��������
    CurrentIntegral: string; //�����ն˵�ǰ����
    MonitorTelNum: string; //���ü�������
    RestorationTeLNum: string; //�绰��λ����
    NoteServiceCenterNum: string; //����Ϣ�������ĺ�
    NoteAlarmCenterNum: string; //�����������ĺ���

    APN: string; //APN����
    IP_MainCenter: string; //����������IP��ַ
    DomainNameOfMainCenter: string; //��������������
    IP_AssistantCenter: string; //���ø�����IP��ַ
    DomainNameOfAssistantCenter: string; //���ø���������
    PortOfCenter: string; //�������Ķ˿ں�
    PortOfCenter2: string; //�����Ķ˿� sha 20081231
    HeartbeatInterval: string; //�����·��������
    DNS_IP: string; //����������������IP

    DevId: string; //���ó����ն�ID��
    Password: string; //�����ն�����

    Overspeed: string; //�����ٶ�

    isTurnBrandPhoto: string; //�Ƿ�������
    isCloseDoorPhoto: string; //�Ƿ��������
    isSaveAlarmPhoto: string; //�Ƿ�洢������Ƭ
    IP_MainPhoto: string; //����Ƭ��������ַ
    DomainNameOfMainPhoto: string; //��������Ƭ����������
    IP_AssistantPhoto: string; //����Ƭ��������ַ
    DomainNameOfAssistantPhoto: string; //���ø���Ƭ����������
    PortOfPhoto: string; //������Ƭ�������˿ں�
    SavePhotoTimeBegin: string; //���ô洢������Ƭ��ʱ���
    SavePhotoTimeEnd: string;

    OrderFormTurnTime: string; //ԤԼ����ת����ʱ����ʱ��

    TaxiMetaStopDateTime: string; //�Ƽ���ͣ��ʱ��

    PursueInterval: string; //׷�ټ�� ID��$2000;

    ICIP: string; //IC����˾��IP
    ICPort: string; //IC����˾��port
    ICIPBak: string; //IC����˾����IP
    ICPortBak: string; //IC����˾����port
    ICUser: string; //���������û���
    ICPassword: string; //��������������

    EnterCarBastWordS: string; //�����س�
    LeaveCarBastWords: string; //�˳��س�

    //-------------20090108 add //������չ���������ش洢
    Param0900: string; //'�㱨���';
    Param0901: string; //'���Ŀ��Ʋ���';
    Param0902: string; //'ƣ�ͼ�ʻ����';
    Param0903: string; //'���س�������';
    Param0904: string; //'�����ź���Ч��ƽ';
    Param0905: string; //'ä���켣���ݴ洢';
    Param0906: string; //'ƣ�ͼ�ʻ����';
    Param0907: string; //'�����س���ʾ��';
    Param0908: string; //'����ճ�����ʾ��';
    Param0909: string; //'ƣ�ͼ�ʻ����';
    Param090a: string; //'���ټ�ʻ����';
    Param090b: string; //'������ʱ��';
    Param090c: string; //'���ٱ�������';
    Param090d: string; //'�����Ķ˿ں�';
    Param090e: string; //'����Ƭ����˿ں�';
    Param090f: string; //'���ø���������';
    Param0910: string; //'����������APN';
    Param0911: string; //'����������IP��ַ';
    Param0912: string; //'��������������';
    Param0913: string; //'�����������˿ں�';
    Param0914: string; //'������������';
    Param0915: string; //'�绰ͨ��ʱ��';
    Param0a00: string; //'�������α�־';
    Param0a01: string; //'�绰������ʽ';
    Param0a02: string; //'ҹ��ʱ��';
    //=========V3.0�Ĳ���������������Ŀ�Ĳ���������Ĳ������Բ�ʹ����=========//
    //=============��������ȫ���ú���ƴ������д+����ID�ķ�ʽ===============//
    ZDXTSJ_0001: string;
    TCPYDCS_0002: string;
    TCPCC_0003: string;
    SMSYDCS_0004: string;
    SMSCC_0005: string;
    ZFWQAPN_0010: string;
    ZFWQYH_0011: string;
    ZFWQMM_0012: string;
    ZFWQDZ_0013: string;
    BFFWQAPN_0014: string;
    BFFWQYH_0015: string;
    BFFWQMM_0016: string;
    BFFWQDZ_0017: string;
    TCPDK_0018: string;
    JJQTJSJ_0091: string;
    JJQTJCC_0090: string;
    WZHBCL_0020: string;
    WZHBFA_0021: string;
    WDLSJJG_0022: string;
    ACC_OFFSJJG_0023: string;
    ACC_ONSJJG_0024: string;
    KCSJJG_0025: string;
    ZCSJJG_0026: string;
    XMSJJG_0027: string;
    JJBJSJJG_0028: string;
    WDLJLJG_0029: string;
    ACC_OFFJLJG_002A: string;
    ACC_ONJLJG_002B: string;
    KCJLJG_002C: string;
    ZCJLJG_002D: string;
    XMJLJG_002E: string;
    JJBJJLJG_002F: string;
    GDBCJD_0030: string;

    JKPTDH_0040: string;
    FWDH_0041: string;
    HFCCSZDH_0042: string;
    JKPTSMSDH_0043: string;
    JSZDSMSWBBJDH_0044: string;
    ZDDHJTCL_0045: string;
    MCZCTHSJ_0046: string;
    DYZCTHSJ_0047: string;
    DHHMCD_0048: string;
    JTDHHM_0049: string;

    BJPBZ_0050: string;
    BJFSWBSMSKG_0051: string;
    BJPSKG_0052: string;
    BJPSCCKG_0053: string;
    GJBJBZ_0054: string;

    ZGSD_0055: string;
    CSCXSJ_0056: string;
    LXJSSJ_0057: string;
    ZXXXSJ_0058: string;
    ZCTCSJ_0059: string;
    DTLJJSSJ_005A: string;

    TXSPZL_0070: string;
    LD_0071: string;
    DBD_0072: string;
    BHD_0073: string;
    SD_0074: string;

    CLLCBDS_0080: string;
    CLSZSYID_0081: string;
    CLSZSYID_0082: string;

    MCUID_F001: string;
    KZCJC_F002: string; // ���س����

    JJQYYCSXZ_0090: string;
    JJQYYSJXZ_0091: string;

    MCULYMS_00A0: string;
    MCULYWJZDCD_00A1: string;
    LCDXTJG_00A2: string;
    LEDXTJG_00A3: string;
    ACCOFFXMSJ_00AF: string;

    SPFWQMS_00B0: string;
    SPFWQAPN_00B1: string;
    SPFWQHYM_00B2: string;
    SPFWQMM_00B3: string;
    SPFWQIP_00B4: string;
    SPFWQDK_00B5: string;

    TTSYL_004B: string;

    BFTCPDK_0019: string;
    MCUWHMM_004A: string;

    UDPXXYDCS_0004: string;
    UDPXXCCCS_0005: string;
    UDPPORT_0019: string;
    QSSJHB_0029: string;
    QSJLHB_002C: string;
    JKPTTQHM_0049: string;
    CARNO_0083: string;
    CPColor_0084: string;

  end;
  PDevParam = ^TDevParam;


  //�����绰����Ϣ
  TTelInfo = record
    id: integer;
    No: string; //�绰����          <=20byte
    Name: string; //�绰ӵ����������<=10byte
    TelType: byte; //�绰���͡�  1�����룻2��������3������/����
  end;
  PTelInfo = ^TTelInfo;

  // �����¼���Ϣ
  TEventInfo = record
    id: Integer;
    No: Byte;
    Info: string;   //  �¼���Ϣ
  end;
  PEventInfo = ^TEventInfo;

  // ������Ϣ�˵�
  TTInfoMenu = record
    id: Integer;
    No: Byte;     // �˵�����
    Info: string; // �˵����� �20���ֽ�
  end;
  PInfoMenu = ^TTInfoMenu;

  TTClassInfoMenu = record
    id: Integer;
    No: Byte;     // �˵�����
    Info: string; // �˵����� �20���ֽ�
  end;
  pClassInfoMenu = ^TTClassInfoMenu;

  TQuestionInfo = record
    id: Byte;     // ��־
    info: string; // ����
    AnswerList: TIntegerList; // ��ѡ��
  end;
  PQuestionInfo = ^TQuestionInfo;

  TAnswerInfo = record
    id: Byte;
    info: string;
  end;
  PAnswerInfo = ^TAnswerInfo;

  //��ʾ���̶��˵�
  TDisplayMenu = record
    id: integer;
    Name: string; //���� ���40byte
    ParentID: integer; //��ID
    IsLeafNode: Boolean; //��true:��Ҷ��

  end;
  PDisplayMenu = ^TDisplayMenu;

  TCancelOrderMenu = record //ȡ������
    id: integer;
    Name: string;
  end;
  PCancelOrderMenu = ^TCancelOrderMenu;


//  TCar = record
//    id: integer; //������ʶ
//    ZBH: String; // �Ա��
//    No: string; //���ƺ���
//    Memo: string; //��ע��Ϣ
//    CarType: string; //��������
//    resid: integer;
//    ResIndex: integer;
//    stat: integer;
//    //add by sjp.20110602
//    ShengId:Integer;
//    ShengName: string;
//    ShiId:Integer;
//    ShiName: string;
//    ChePaiColor:Integer;
//    CPColorStr: string;
//    IndustryNo: string;//��ҵ����
//    IndustryName: string;//��ҵ��
//  end;
//  PCar = ^TCar;

  TCar = class(TObject)
  private
    FShiId: Integer;
    FChePaiColor: Integer;
    FId: integer;
    FResIndex: integer;
    FResId: integer;
    FStat: integer;
    FShengId: Integer;
    FMemo: string;
    FCarType: string;
    FIndustryName: string;
    FZBH: String;
    FCPColorStr: string;
    FShiName: string;
    FIndustryNo: string;
    FShengName: string;
    FNo: string;
    FCarShipName: string;
    FCarKind: string;
    FSetupTime: string;
    procedure SetCarType(const Value: string);
    procedure SetChePaiColor(const Value: Integer);
    procedure SetCPColorStr(const Value: string);
    procedure SetId(const Value: integer);
    procedure SetIndustryName(const Value: string);
    procedure SetIndustryNo(const Value: string);
    procedure SetMemo(const Value: string);
    procedure SetNo(const Value: string);
    procedure SetResId(const Value: integer);
    procedure SetResIndex(const Value: integer);
    procedure SetShengId(const Value: Integer);
    procedure SetShengName(const Value: string);
    procedure SetShiId(const Value: Integer);
    procedure SetShiName(const Value: string);
    procedure SetStat(const Value: integer);
    procedure SetZBH(const Value: String);
    procedure SetCarKind(const Value: string);
    procedure SetCarShipName(const Value: string);
    procedure SetSetupTime(const Value: string);

  public
    constructor Create;
    destructor Destroy; override;
    property id: integer read FId write SetId; //������ʶ
    property ZBH: String read FZBH write SetZBH; // �Ա��
    property No: string read FNo write SetNo; //���ƺ���
    property Memo: string read FMemo write SetMemo; //��ע��Ϣ
    property CarType: string read FCarType write SetCarType; //�������� �µϡ���������
    property resid: integer read FResId write SetResId;
    property ResIndex: integer read FResIndex write SetResIndex;
    property stat: integer read FStat write SetStat;
    property ShengId:Integer read FShengId write SetShengId;
    property ShengName: string read FShengName write SetShengName;
    property ShiId:Integer read FShiId write SetShiId;
    property ShiName: string read FShiName write SetShiName;
    property ChePaiColor:Integer read FChePaiColor write SetChePaiColor;
    property CPColorStr: string read FCPColorStr write SetCPColorStr;
    property IndustryNo: string read FIndustryNo write SetIndustryNo;//��ҵ����
    property IndustryName: string read FIndustryName write SetIndustryName;//��ҵ��
    property CarKind: string read FCarKind write SetCarKind;//��������  �ͳ�������������
    property CarShipName: string read FCarShipName write SetCarShipName;//������  ���⳵���ͳ�����ͨ������������
    property SetupTime: string read FSetupTime write SetSetupTime;//������װ�豸����
  end;


  TCarNO = record
    DevId: integer;
    carNo: string;
  end;
  PCarNO = ^TCarNO;


  TDriver = record
    id: integer;
    Name: string;
    CarID: integer;
    DevID: integer;
    GroupID: integer;
    DriverNO: string[12];
    TEL: string;
    Address: string;
    IdentityCard: string;
    LoginTime: TDatetime;
    isMain: Boolean;
    Integral: Integer;
    isBlacklist: Boolean;
    DriverServeNum: string;
  end;
  PDriver = ^TDriver;

  TTargetBmp = record
    DC: HDC;
    Rect: TRect;
  end;

  TJudgeNotOk = class(TObject)
    desc: string;
  end;

  TDevEventInfoManage = class(TObject)
  private
    FList: TIntegerList;

    function GetCount: Integer;
    function GetItem(Index: Integer): PEventInfo;

  public
    constructor Create;
    destructor Destroy; override;

    function AddDevEventInfo(EventId: Integer): PEventInfo;
    function GetDevEventInfoById(EventId: Integer): PEventInfo;
    function GetDevEventInfoByNo(EventNo: Integer): PEventInfo;

    procedure DeleteEventInfo(EventId: Integer);
    procedure Clear;

    property Count: Integer read GetCount;
    property Items[Index: Integer]: PEventInfo read GetItem;
  end;

  TDevTelListManage = class(TObject)
  private
    FList: TIntegerList;

    function GetCount: Integer;
    function GetItem(Index: Integer): PTelInfo;

  public
    constructor Create;
    destructor Destroy; override;

    function AddTelInfo(TelId: Integer): PTelInfo;
    function GetTelInfoById(TelId: Integer): PTelInfo;
    function GetTelInfoByNo(TelNo: string): PTelInfo;

    procedure DeleteTelInfo(TelId: Integer);
    procedure Clear;

    property Count: Integer read GetCount;
    property Items[Index: Integer]: PTelInfo read GetItem;
  end;


  TCarType = class(TObject)
  private
    FCarTypeID: Integer;
    FCarTypeName: string;
    
    procedure SetCarTypeID(const Value: Integer);
    procedure SetCarTypeName(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
  published
    property CarTypeID: Integer read FCarTypeID write SetCarTypeID;
    property CarTypeName: string read FCarTypeName write SetCarTypeName;
  end;


  TCarTypeManage = class(TObject)
  private
    FList: TIntegerList;
    function GetItems(Index: Integer): TCarType;
    function GetCount: Integer;
  public
    constructor Create;
    destructor Destroy; override;

    function Add(ACarTypeID: Integer): TCarType;
    procedure Delete(const ACarTypeID: Integer);
    function Find(const ACarTypeID: Integer): TCarType; overload;
    function Find(const ACarTypeName: string): TCarType; overload;
    procedure ClearAll;

    property Items[Index: Integer]: TCarType read GetItems;
    property Count: Integer read GetCount;
  end;

  TDriverManage = class(TObject)
  private
    FDriverAry: array of TDriver;
    function GetDrivers(index: integer): TDriver;
    procedure SetDrivers(index: integer; const Value: TDriver);
    function Getcount: integer;
  public
    constructor Create;
    destructor Destroy; override;
    function AddNewDriver(ADriverId: integer): PDriver;
    function GetDriverIndex(const ADriverId: integer): integer;
    procedure ClearDriver;
//    function  GetDriver(const ADriverID: Integer): TDriver;Overload;
    function GetDriver(const Dev: TDevice): TDriver; overload;
    function GetDriver(DriverNO: string): PDriver; overload;
    function GetCarIdByDriverName(driverName: string): Integer;
    function GetCarIdByDriverNameFuzzy(driverName: string): Integer;

    property Count: integer read Getcount;
    property Drivers[index: integer]: TDriver read GetDrivers write SetDrivers;
  end;



  //-------------��������------------------
  TCarManage = class(TObject)
  private
    FList: TIntegerList;
    //FCarAry: array of TCar;
    function GetCars(index: integer): TCar;
    function Getcount: integer;
  public
    constructor Create;
    destructor Destroy; override;
    //======��ӳ�
    function AddNewCar(ACarId: integer): TCar;
    //======���� ����ID ��� ��������
    function GetCarIndex(const ACarId: integer): integer;
    //======�����
    procedure ClearCar;
    //======���� ��ID ���һ��������
    function getCar(const ACarId: integer): TCar;
    //======���� ��ID ���һ�������ݵ�ָ��
   // function GetPCar(const ACarID:integer):PCar;

    property Count: integer read Getcount;
    //======����������� ��
    property Cars[index: integer]: TCar read GetCars;
  end;


  TCarNOManage = class(TObject)
  private
    FCarAry: array of TCarNO;
    function Getcount: integer;
    function GetCars(index: integer): TCarNO;
  public
    constructor Create;
    destructor Destroy; override;
    //======��ӳ�
    function AddNewCar(DevId: integer; carNo: string): Boolean;
    //======�����
    procedure ClearCar;
    //======���� ����ID ���һ�����ƺ�;
    function GetCarNO(const DevId: integer): string;
    function GetDevID(const carNo: string): integer;
    property Count: integer read Getcount;
    property Cars[index: integer]: TCarNO read GetCars;
  end;


  //--------------��Դ------------------
  TImgRes = record
    id: integer; //��Դ��ʶ��
    Name: string; //��Դ����
    content: string; //��Դ����
    exttype: string; //��Դ��չ��
  end;
  PImgRes = ^TImgRes;
  //-------------��Դ������------------------
  TImgResManage = class(TObject)
  private
    FImgResAry: array of TImgRes;
    function GetImgRess(index: integer): TImgRes;
    procedure SetImgRess(index: integer; const Value: TImgRes);
    function Getcount: integer;
  public
    constructor Create;
    destructor Destroy; override;
    //======�����Դ
    function AddNewImgRes(AImgResId: integer): PImgRes;
    //======���� ��Դ ��ID ��� ��Դ������
    function GetImgResIndex(const AImgResId: integer): integer;
    //======�����Դ
    procedure ClearImgRes;
    //======���� ID ���һ������
    function getImgRes(const AImgResId: integer): TImgRes;
    //======���� ID ���һ�����ݵ�ָ��
   // function GetPCar(const ACarID:integer):PCar;

    property Count: integer read Getcount;
    //======����������� ��Դ
    property ImgRess[index: integer]: TImgRes read GetImgRess write SetImgRess;
  end;

  //---------------��ͷ ----------
  TSwitch = record
    id: integer; //��ͷ ��ʶ
    order: integer; //���   ---add at 2004-03-23
    resid: integer; //��Դ��ʶ
    ResIndex: integer;
    ConnTypeID: integer; //���߷�����ʶ
    Name: string; //��ͷ����
  end;
  PSwitch = ^TSwitch;

  //---------------��ͷ������--------------��
(*  TSwitchManage= class(Tobject)
  private
    FSwitchAry: array of TSwitch;
    function GetSwitchs(index: integer): TSwitch;
    procedure SetSwitchs(index: integer; const Value: TSwitch);
    function Getcount: integer;
  public
    constructor Create;
    destructor Destroy;override;

    function AddNewSwitch(ASwitchid:integer):PSwitch; //��ӽ�ͷ
    //======���� ��ͷ��ID ��� ��ͷ������
    function GetSwitchIndex(Const ASwitchID:integer):integer;
    //======�����ͷ
    procedure ClearSwitch;
    //======���� ��ͷID ���һ����ͷ����
    function getSwitch(const ASwitchId: Integer): TSwitch;
    //======���� ��ͷID ���һ����ͷ���ݵ�ָ��
    function GetPSwitch(const ASwitchid:integer):PSwitch;
    function GetPSwitchByIndex(index: Integer): PSwitch;
    property count:integer read Getcount;
    //======����������ý�ͷ
    property Switchs[index:integer]:TSwitch read GetSwitchs write SetSwitchs;
  end; *)

  //--------------���߷��� ---------------------
  TConnType = record
    id: integer; //���߷��� ��ʶ��
    Name: string; //���߷��� ����
    Desc: string; //���߷��� ����
  end;
  PConnType = ^TConnType;

  //------------- ���߷��� ���� ----------------
{  TConnTypeManage= class(Tobject)
  private
    FConns: array of TConnType;
    function GetCount: Integer;
    function  GetConnTypes(Index: Integer): TConnType;
    procedure SetConnTypes(Index: Integer; const Value: TConnType);
  public
    constructor Create;
    destructor Destroy;override;

    //======����µĽ��߷���
    function AddNewConn(const AConnID: Integer): PConnType;
    //======���ݽ��߷�����ID��ý��߷���������
    function GetConnIndex(const AConnID: Integer): Integer;
    //======������߷���
    procedure ClearConn;
    //======���ݽ��߷���ID���һ�����߷�������
    function getConnType(const AConnID: Integer): TConnType;
    //======���ݽ��߷���ID���һ�����߷������ݵ�ָ��
    function GetPConnType(const AConnID:integer):PConnType;
    //======��õ�ǰ�ж����ֽ��߷���
    property Count: Integer read GetCount;
    //======����������ý��߷���
    property ConnTypes[Index: Integer]: TConnType read GetConnTypes write SetConnTypes;
  end;  }

  //-----------�飭������
  TDevGroup = class
  private
    Fleaf_nod: Boolean;
    Fparent: integer;
    FDevCount: integer;
    FId: integer;
    Fname: string;
    FDevList: TStringList;
    FsonList: TIntegerList;
    FTelPhone: string;
    FZXL: string;
    FDLYSXKZ: string; // ������

    procedure SetDevCount(const Value: integer);
    procedure SetId(const Value: integer);
    procedure Setleaf_nod(const Value: Boolean);
    procedure Setname(const Value: string);
    procedure Setparent(const Value: integer);
    procedure SetDevList(const Value: TStringList);
    procedure SetSonList(const Value: TIntegerList);
    procedure SetTelPhone(const Value: string);
    function GetDevListCount: integer;
    function GetSonListCount: integer;
    function GetDevListItems(index: integer): String;
    function GetSonListItems(index: integer): integer;
  public
    constructor Create;
    destructor Destroy; override;
    {���ӵ������ID �������б�FSonList}
    procedure AddSonGroup(ASonGroupId: integer);
    {���ӵ�����ID �� �����б�FDevList}
    procedure AddDevID(ADevID: string);
    {���߳���ID���Ҷ�Ӧ�ĳ���}
    function FindByDevID(ADevID: string): Boolean;

    property id: integer read FId write SetId;
    property DevCount: integer read FDevCount write SetDevCount; //���к��е��豸��
    property Name: string read Fname write Setname;
    property Parent: integer read Fparent write Setparent;
    property leaf_nod: Boolean read Fleaf_nod write Setleaf_nod; //true ��ʾ���� ��false��ʾ����
    property SonList: TIntegerList read FsonList write SetSonList; //����������
//    property DevList: TIntegerList read FDevList write SetDevList; //�����ĳ���ID
    property DevList: TStringList read FDevList write SetDevList; //�����ĳ���ID
    property SonListCount: integer read GetSonListCount;
    property DevListCount: integer read GetDevListCount;
    property SonListItems[index: integer]: integer read GetSonListItems;
    property DevListItems[index: integer]: String read GetDevListItems;
    property TelPhone: string read FTelPhone write SetTelPhone;
    property ZXL: string read FZXL write FZXL;
    property DLYSXKZ: string read FDLYSXKZ write FDLYSXKZ;//��·�������֤
  end;

  //-----------�顡������-------
  TDevGroupManage = class(TObject)
  private
    FList: TIntegerList;
    function Getcount: integer;
    function GetItems(index: integer): TDevGroup;
  public
    constructor Create;
    destructor Destroy; override;

    //======����µ���
    function Add(const ADevGroupID: integer): TDevGroup;
    //======������ ��ID��ý��߷���������
    //function GetDevGroupIndex(const ADevGroupID: Integer): Integer;
    procedure Delete(const ATargetID: integer);
    //======�����
    procedure Clear;
    //======������ID���һ��������
    function find(const ADevGroupID: integer): TDevGroup;
    function FindByName(const groupName: string): TDevGroup;
    function FindByNameFuzzy(const groupName: string): TDevGroup;

    {������ID�ŷ��뵽��Ӧ����� DevList ��}
    procedure InsertDevList(const ADevID:String;const ADevGroupID: integer);

    //�����������id,д�뵽���������������
    //���������DevArray �ŵ������DevArray�У������Ժ�ʹ��
    procedure ListSon;
    //======������ID���һ�������ݵ�ָ��
 //   function GetPDevGroupType(const ADevGroupID:integer):PDevGroupType;
    //======��õ�ǰ�ж��� ��
    property Count: integer read Getcount;
    //======����������ý��߷���
    property Items[index: integer]: TDevGroup read GetItems;
  end;



  //-----------�豸��������������������������
  TDevice = class(TObject)
  private
    FTelList: TIntegerList;
    FEventList: TIntegerList;
    FInfoMenuList: TIntegerList;
    FClassInfoMenuList: TIntegerList;
    FDisplayMenuList: TIntegerList;
    FCancelOrderMenuList: TIntegerList;
    FAnswerList: TIntegerList;
    FAdInfoList: TStringList;

    FInfoTypeIdList: TIntegerList;

    FQustion: string;
    FCar: TCar;
    FId: string;
    FIdStr: string;
    FFact_id: Integer;
    FLastConnectTime: TDatetime;
//    FConnType: Integer;
//    FGroup: Integer;
    FDispLabel: string;
    FSimNo: string;
//    FConnTypeID: integer;
    FGroupID: integer;
    FAutoTrack: Boolean;
    FDrawTrack: Boolean;
    FMonitor: Boolean;
    FActive: Boolean;
    FFirst: Boolean;
    FAlarmCount: byte;
    FEarlyWarningCount: Byte;
    FLatitude: double;
    FLongitude: double;
    FAngle: integer;
    FSpeed: integer;
//    FAltitude: Integer;
    FGpsTime: TDatetime;
//    FNotActiveTime: Word;
    FState: TBits;
    FMetaIndex: integer;
    //FBmp: TTargetBmp;
    FTrackPen: TPenStruct;
    FPattern: Integer;
    FHistory: TCycWPList;
    //FDefaultTrackPen: TPenStruct;
//    FSendMsgAuto: byte;
//    FSendMsgFreq: Word;
//    FBatteryVoltage: Word;
//    FBatteryTemp: Word;
//    FRegTime: TDatetime;
//    FDevMinorVer: byte;
//    FDevMajorVer: byte;
//    FIoStat: byte;
//    FAlarmInterval: byte;
//    FReturnCount: byte;
//    FExternalEnable: byte;
//    FReturnInterval: integer;
//    FPap_passwd: string;
//    FSms: string;
//    FPap_user: string;
//    FBound: byte;
//    FAlarmReSendCount: integer;
//    FDestSIMNo: string;
    FSwitch: TBits;
    FSwitch_Warning: TBits;
    FSwitch_Warning_C: TBits;
//    FReadParamNo: string;
    FAlarm_endTime: TDatetime;
    FAlarm_startTime: TDatetime;
    FAlarm: Boolean;

    FAlarm_OutCArea: Boolean;
    FAlarmStart_OutCArea: TDatetime;
    FAlarmEnd_OutCArea: TDatetime;
//    FOutCAreaId: integer;
//    FIsRefresh_Exist: Boolean;
    FisOnline: Boolean;
    FisOnlineOnTheMap: Boolean;
    FAlarm_InCArea: Boolean;
//    FInCAreaId: integer;
    FAlarmStart_InCArea: TDatetime;
    FAlarmEnd_InCArea: TDatetime;
//    FDisPlayCoName: string;
    FDriverNameTel: string;
    FDriverName: string;
    FDriverTel: string;
    FDriverServeNum: string;
    FDriverName2: string;
    FDriverTel2: string;
    FDriverServeNum2: string;

    FHide: Boolean;
    FHighlight: Boolean;    // ͻ����ʾ

    FShiName: string; //ʡ��
    FShengName: string; //����
    FXianName: string; //����
    //FDriverTel:string;
    FAreaList: TAreaList;
    FAlarm_WayOutCArea: Boolean;
    FAlarm_WayInCArea: Boolean;
    FFirstInPoint: TPoint;

    FLastPictureID: integer;
    FAlarm_OutCAreaIsShowPop: Boolean;
    FPoint: TPoint;
    FOrientation1: integer;
    FOrientationRightTime: integer;
    FIsSelected: Boolean;
    FLogin_Driver: string;
    FLogin_DriverName: string;

    FLastLogin_DateTime: TDateTime;
    FLastLogout_DateTime: TDateTime;
    FLogInOut: Boolean; // true: ��ǰ��ǩ����false: ��ǰ��ǩ��
    FNotFirstLog: Boolean;

    FSpecialCar: Boolean;

    FOutToTown: Boolean; // ���Ǳ�־
    FGoToTown: TDateTime; // Ԥ�ƻس�ʱ��
    FOutToTownTime: TDateTime;  // ����ʱ��
    FOutToTownAlarm: Boolean; // �������Ǳ�������

    FGetLastPostion: Boolean;

    FMsgID: Integer;

    FDevList: TIntegerList;   // �洢�ó�����Χ�ж��ٳ���
    DevTrue: Boolean;         // �ж��Ƿ��Ѿ�������
    DevInCenterDev: Boolean;  // �жϸó����Ƿ��Ѿ����������ĵ㳵����
    DevAlarmCount: Byte;      // �жϾۼ������Ĵ���

    FPursuePostion: Boolean;  // ���ó�����ز����󣬶Ըó����ڵ�ͼ�Ͻ����������ʾ

//    FAccuseNum: Integer;
//    FMY: Integer;
//    FBMY: Integer;
//    Fsyyje: Double;
//    Fxslc: Double;
//    Fkslc: Double;
//    Fksl: string;
    FMsgTypeState: string;

    FOnMinSpeedTime: TDateTime;  // �����Ϸñ���ʱ�жϴ˳���������ٶȵ�ʱ��
    FMaintainTime: Integer;      // �����Ϸô�������ٶȵĳ���ʱ��
    //FSuspectedPetitions: Boolean; // �����Ϸ�  true����ʼ��������״̬

    FIsOnMap: Boolean;        // �ó��Ƿ����ڵ�ͼ����ʾ

    FWarningSign: LongWord;
    FStateSign: LongWord;
    FPGpsData: PGpsData_V3;
    FIsNewGpsData: Boolean;
    FAltitude: Integer;
    FDevAreaList: TIntegerList;
    FAuthCode: string;
    FCourse: Double;
    FOilVolume: Double;
    FIsSendCancelEmgcyAlarm: Boolean;
    FAlarmInfoId: Integer;
    FPointWhenAccOff: TWorldPoint;
    FIsAccOff: Boolean;
    FIsOutAreaOnTime: Boolean;
    FIsInAreaOnTime: Boolean;
    FIsAlarmedOutAreaOnTime: Boolean;
    FIsAlarmedInAreaOnTime: Boolean;
    FIsEncrypted: Boolean;
    FSpeed_RunRec: Integer;
    FRunRecSpeed: Integer;
    FAlarmIdManual: Integer;

    FPreviousReceiveTime: string;  // �ϸ���λ����ʱ��ʱ��
    FReceiveTime: string;
    FPreviousLatitude: double;
    FPreviousLongitude: Double;
    FIsGpsDataRefreshed: Boolean;
    FTerminalTypeId: Integer;
    FTerminalTypeName: string;
    FIsFatigueAlarm: Boolean;
    FLastFatigueAlarmPicData: TByteDynArray;
    FLastFatigueAlarmSpeed: Double;
    FLastFatigueAlarmGpsTime: string;
    FIsFatigueAlarmStatChanged: Boolean;
    FLastPicType: Byte;
    FIsLastPicSet: Boolean;
    FSignalStrength: Byte;
    FNavSatelliteCount: Byte;
    FIsDeepHibernated: Boolean;
    FIsHibernated: Boolean;

    //FMeterParam: TMeterParam_V3;  // �洢�Ƽ�������

    procedure SetDispLabel(const Value: string);
//    procedure SetGroup(const Value: Integer);
    procedure SetId(const Value: string);
    procedure SetFact_id(const Value: Integer);
    procedure SetSimNo(const Value: string);
//    procedure SetConnTypeID(const Value: integer);
    procedure SetGroupID(const Value: integer);
    function GetSwitch(index: integer): Boolean;
    function GetSwitch_Warning(index: Integer): Boolean;
//    function GetSwitchProp(index: integer): TSwitch;
    procedure SetActive(const Value: Boolean);
    procedure SetAlarmCount(const Value: byte);
    procedure SetAngle(const Value: integer);
    procedure SetDrawTrack(const Value: Boolean);
    procedure SetFirst(const Value: Boolean);
    procedure SetGpsTime(const Value: TDatetime);
    procedure SetLatitude(const Value: double);
    procedure SetLongitude(const Value: double);
    procedure SetMonitor(const Value: Boolean);
//    procedure SetNotActiveTime(const Value: Word);
    procedure SetSpeed(const Value: integer);
    procedure SetSwitch(index: integer; const Value: Boolean);
    procedure SetSwitch_Warning(index: Integer; const Value: Boolean);

    procedure SetState(const Value: TBits);
    procedure SetMetaIndex(const Value: integer);
//    procedure SetBmp(const Value: TTargetBmp);
//    procedure SetDefaultTrackPen(const Value: TPenStruct);
    procedure SetTrackPen(const Value: TPenStruct);
    procedure SetPattern(const Value: Integer);
    procedure SetCar(const Value: TCar);
//    procedure SetBatteryTemp(const Value: Word);
//    procedure SetBatteryVoltage(const Value: Word);
//    procedure SetRegTime(const Value: TDatetime);
//    procedure SetSendMsgAuto(const Value: byte);
//    procedure SetSendMsgFreq(const Value: Word);
//    procedure SetDevMajorVer(const Value: byte);
//    procedure SetDevMinorVer(const Value: byte);
//    procedure SetAlarmInterval(const Value: byte);

//    procedure SetExternalEnable(const Value: byte);
//    procedure SetIoStat(const Value: byte);
//    procedure SetPap_passwd(const Value: string);
//    procedure SetPap_user(const Value: string);
//    procedure SetReturnCount(const Value: byte);
//    procedure SetReturnInterval(const Value: integer);
//    procedure SetAlarmReSendCount(const Value: integer);
//    procedure SetBound(const Value: byte);
//    procedure SetDestSIMNo(const Value: string);
//    procedure SetReadParamNo(const Value: string);
    procedure SetAlarm_endTime(const Value: TDatetime);
    procedure SetAlarm_startTime(const Value: TDatetime);
    procedure SetAlarm(const Value: Boolean);
    procedure SetTraceList(const Value: TCycWPList);
//    procedure SetOutCAreaId(const Value: integer);
    procedure SetAlarm_OutCArea(const Value: Boolean);
    procedure SetAlarmEnd_OutCArea(const Value: TDatetime);
    procedure SetAlarmStart_OutCArea(const Value: TDatetime);
//    procedure SetIsRefresh_Exist(const Value: Boolean);
    procedure SetAlarm_InCArea(const Value: Boolean);
    procedure SetAlarmEnd_InCArea(const Value: TDatetime);
    procedure SetAlarmStart_InCArea(const Value: TDatetime);
//    procedure SetInCAreaId(const Value: integer);
    function GetTelItems(index: integer): PTelInfo;
    function GetEventItem(index: integer): PEventInfo;
    function GetInfoMenuItem(index: integer): PInfoMenu;
    function GetClassInfoMenuItem(index: Integer): pClassInfoMenu;
    function GetAnswerItem(index: integer): PAnswerInfo;
    function GetDisplayItems(index: integer): PDisplayMenu;
    function GetCancelOrderMenuItems(index: integer): PCancelOrderMenu;
//    procedure SetDisPlayCoName(const Value: string);
    function GetCancelOrderMenuCount: integer;
    procedure SetOrientation1(const Value: integer);
    procedure SetOrientationRightTime(const Value: integer);
    procedure SetIsSelected(const Value: Boolean);
    procedure SetLogin_Driver(const Value: string);
    procedure SetLogin_DriverName(const Value: string);
    procedure SetLastLogin_DateTime(const Value: TDateTime);
    procedure SetLastLogout_DateTime(const Value: TDateTime);
    procedure SetLogInOut(const Value: Boolean);
    procedure SetNotFirstLog(const Value: Boolean);
    procedure SetOutToTown(const Value: Boolean);
    procedure SetGoToTown(const Value: TDateTime);
    procedure SetAltitude(const Value: Integer);
    procedure SetDevAreaList(const Value: TIntegerList);
    procedure SetAuthCode(const Value: string);
    procedure SetCourse(const Value: Double);
    procedure SetOilVolume(const Value: Double);
    function GetSwitch_Warning_C(index: Integer): Boolean;
    procedure SetSwitch_Warning_C(index: Integer; const Value: Boolean);
    procedure SetIsSendCancelEmgcyAlarm(const Value: Boolean);
    procedure SetAlarmInfoId(const Value: Integer);
    procedure SetPointWhenAccOff(const Value: TWorldPoint);
    procedure SetIsAccOff(const Value: Boolean);
    procedure SetIsAlarmedInAreaOnTime(const Value: Boolean);
    procedure SetIsAlarmedOutAreaOnTime(const Value: Boolean);
    procedure SetIsInAreaOnTime(const Value: Boolean);
    procedure SetIsOutAreaOnTime(const Value: Boolean);
    procedure SetIsEncrypted(const Value: Boolean);
    procedure SetSpeed_RunRec(const Value: Integer);
    procedure SetRunRecSpeed(const Value: Integer);
    procedure SetAlarmIdManual(const Value: Integer);
    procedure SetIsOnline(const Value: Boolean);
    procedure SetIsGpsDataRefreshed(const Value: Boolean);
    procedure SetTerminalTypeId(const Value: Integer);
    procedure SetTerminalTypeName(const Value: string);
    procedure SetFatigueAlarm(const Value: Boolean);
    procedure SetFatigueAlarmStatChanged(const Value: Boolean);
    procedure SetLastPicType(const Value: Byte);
    procedure SetLastPicSet(const Value: Boolean);
    procedure SetSignalStrength(const Value: Byte);
    procedure SetNavSatelliteCount(const Value: Byte);
    procedure SetDeepHibernated(const Value: Boolean);
    procedure SetHibernated(const Value: Boolean);
  public
    FFirstOutPoint: TPoint;
    constructor Create;
    destructor Destroy; override;
    //�绰��
    //�ڵ绰���м���һ���绰
    function AddTelInfo(ATelInfoId: integer): PTelInfo; overload;
    function AddTelInfo: PTelInfo; overload;
    //�ڵ绰����ɾ��һ���绰
    procedure DelTelInfo(ATelInfoId: integer);
    //��յ绰��
    procedure ClrTelList;
    //�ڵ绰���в���ĳ���绰
    function FindTelInfo(ATelInfoId: integer): PTelInfo;
    function FindTelInfoByNumber(ATelNumber: String): PTelInfo;
    function FindTelInfoByName(ATelName: string): PTelInfo;
    // ����һ�������Ϣ
    function AddAdInfo(AdInfo: string): Boolean;
    function DeleteAdInfo(AdInfo: string): Boolean;
    // ����һ���¼�
    function AddEventInfo(AEventInfoId: integer): PEventInfo; overload;
    function AddEventInfo: PEventInfo; overload;
    function FindEventByEventNo(EventNo: Integer): PEventInfo;
    procedure DelEventInfo(AEventInfoId: integer);
    procedure ClrEventList;
    // ����һ���˵�
    function AddInfoMenu(AInfoMenuId: integer): PInfoMenu; overload;
    function AddInfoMenu: PInfoMenu; overload;
    procedure DelInfoMenu(AInfoMenuId: integer);
    procedure ClrInfoMenuList;
    // ����һ������˵�
    function AddClassInfoMenu(AClassInfoMenuId: integer): PClassInfoMenu; overload;
    function AddClassInfoMenu: PClassInfoMenu; overload;
    procedure DelClassInfoMenu(AClassInfoMenuId: integer);
    procedure ClrClassInfoMenuList;
    // ����һ����ѡ��
    function AddAnswerInfo(AAnswerInfoId: integer): PAnswerInfo; overload;
    function AddAnswerInfo: PAnswerInfo; overload;
    procedure DelAnswerInfo(AAnswerInfoId: integer);
    procedure ClrAnswerList;
    //���¼��б��в���ĳ���¼�
    function FindEventInfo(AEventInfoId: integer): PEventInfo;
    function FindEventInfoByNo(EventNo: Byte): string;
    //
    function FindInfoMenu(AInfoMenuId: integer): PInfoMenu;
    function FindInfoMenuByNo(MenuNo: Byte): string;

    function FindClassInfoMenu(AClassInfoMenuId: integer): pClassInfoMenu;
    function FindClassInfoMenuByNo(MenuNo: Byte): string;

    function FindAnswerInfo(AAnswerInfoId: integer): PAnswerInfo;
    //�̶��˵��б�
    //�ڹ̶��˵��б��м���һ��
    function AddDisplayMenu(ADisplayMenuId: integer): PDisplayMenu;
    //�ڹ̶��˵��б�ɾ��һ��
    procedure DelDisplayMenu(ADisplayMenuId: integer);
    //��չ̶��˵��б�
    procedure ClrDisplayMenuList;
    //�ڹ̶��˵��б��в���ĳ��
    function FindDisplayMenu(ADisplayMenuId: integer): PDisplayMenu;
    function AddCancelOrderMenu(CancelOrderMenuID: integer): PCancelOrderMenu;
    procedure ClearCancelOrderMenuList;
    procedure DelCancelOrderMenu(CancelOrderMenuID: integer);
    function FindCancelOrderMenu(CancelOrderMenuID: integer): TCancelOrderMenu;
    //�·�������������
    procedure AddADevArea(area:TBaseArea);
    function GetADevArea(areaId: Integer): TBaseArea;
    procedure DelADevArea(area:TBaseArea);
    procedure DelDevAreasExceptAArea(excAreaId: Integer);
    procedure ClrDevArea;

    function AddInfoTypeId(infoTypeId: Integer): Boolean;
    function DeleteInfoTypeId(infoTypeId: Integer): Boolean;
    procedure SetOnline_PlayHis(value: Boolean);

    property Id: string read FId write SetId; //�豸ID
    property IdStr: string read FIdStr write FIdStr; //�ַ����豸ID��
    property fact_id: Integer read FFact_id write SetFact_id;
    property DispLabel: string read FDispLabel write SetDispLabel; //��ʾ��ǩ
    property SimNo: string read FSimNo write SetSimNo; //SIM����
//    property ConnTypeID: integer read FConnTypeID write SetConnTypeID; //���߷���
    property GroupID: integer read FGroupID write SetGroupID; //�������
    property Longitude: double read FLongitude write SetLongitude; //Ŀ�꾭��
    property Latitude: double read FLatitude write SetLatitude; //Ŀ��γ��
    property Point: TPoint read FPoint write FPoint; //��.
    property GpsTime: TDatetime read FGpsTime write SetGpsTime; //Ŀ��Gpsʱ��
    property Speed: integer read FSpeed write SetSpeed; //Ŀ���ٶ� Сʱ/0.1����
    property Orientation: integer read FAngle write SetAngle; //Ŀ��Ƕ�
    property Orientation1: integer read FOrientation1 write SetOrientation1; //===============��¼��ʷ��Ŀ��Ƕ�
    property Altitude: Integer read FAltitude write SetAltitude;       //Ŀ�꺣�θ߶�
    property OrientationRightTime: integer read FOrientationRightTime write SetOrientationRightTime;
    property Switch[index: integer]: Boolean read GetSwitch write SetSwitch; //Ŀ�꿪��״̬ Index �ڼ�������,0 ��ʾ��һ������
    property Switch_Warning[index: Integer]: Boolean read GetSwitch_Warning write SetSwitch_Warning;
    property Switch_Warning_C[index: Integer]: Boolean read GetSwitch_Warning_C write SetSwitch_Warning_C;
//    property SwitchProp[index: integer]: TSwitch read GetSwitchProp; //���һ�����ص�����  del by dxf 2007-1-5 ��Ϊû��ʹ��

    property AlarmCount: byte read FAlarmCount write SetAlarmCount; //Ŀ��������������
    property EarlyWarningCount: Byte read FEarlyWarningCount write FEarlyWarningCount;

    property Monitor: Boolean read FMonitor write SetMonitor; //Ŀ���Ƿ���

    property AutoTrack: Boolean read FAutoTrack; // Ŀ���Ƿ��Զ�����
    {property DrawTrack: Boolean;<BR />
    Ŀ���Ƿ񻭳��켣}
    property DrawTrack: Boolean read FDrawTrack write SetDrawTrack;
    {property Active: Boolean;<BR />
    Ŀ���Ƿ��ڻ״̬}
    property Active: Boolean read FActive write SetActive;
    {property NotActiveTime: Word;<BR />
    Ŀ�괦��δ�״̬������ʱ��}
//    property NotActiveTime: Word read FNotActiveTime write SetNotActiveTime;
    {property First: Boolean;<BR />
    Ŀ���Ƿ��һ��������}
    property First: Boolean read FFirst write SetFirst;
   (*
    {property Log: TMemoLog;<BR />
    Ŀ���Log��¼}
    property Log: TMemoLog read FLog;

    {property State: TBits;��32λ<br />
    ��������״̬��һϵ�п�����,����������Ӧ��״̬�ı��,������Ӧ��λ,ɨ�������
    ɨ����Ӧ��״̬�仯��<br />
    <ul>
    <li>24��31λ��ʾ��Ŀ���������ӵ�Ŀ��</li>
    <li>0��7λ��ʾ�ó����������ݵ���</li>
    8 �� 11��ȡ��
        <li>��8λ��ʾ�ó������ڱ���״̬,1��ʾ����</li>
        <li>��9λ��ʾ�ó�������δ��λ״̬,1��ʾ��λ</li>
        <li>��10λ��ʾ�ó�������δ���״̬,1��ʾ���ڼ��״̬</li>
        <li>��11λ��ʾ�ó�������Gps���߶Ͽ�״̬,1��ʾ��������
    <li>��12λ��ʾ�ó�����������״̬�����Ѿ��յ������ݣ������ʾ�ó���δ�յ������ݣ��ó���Ӧ�ڵ�ͼ����ʾ
    </ul>}  *)
    property State: TBits read FState write SetState;
    {property MetaIndex: Integer;<br />
    Ŀ�������ͼԪ��Index}
    property MetaIndex: integer read FMetaIndex write SetMetaIndex;
    {property Bmp: TTargetBmp;<br />
    ����ǰ״̬��Ŀ���ͼƬ}
//    property Bmp: TTargetBmp read FBmp write SetBmp;
    {property DefaultTrackPen: TGeoPen;<br />
    Ĭ�ϵĹ켣�ߵ���ʽ}
//    property DefaultTrackPen: TPenStruct read FDefaultTrackPen write SetDefaultTrackPen;
    {property TrackPen: TGeoPen;<br />
    ��ǰʹ�õĹ켣�ߵ���ʽ}
    property TrackPen: TPenStruct read FTrackPen write SetTrackPen;
    property Pattern: Integer read FPattern write SetPattern;
    {property TraceList: TGeoQueue;<br />
    ����켣��}
    property TraceList: TCycWPList read FHistory write SetTraceList;
    property Car: TCar read FCar write SetCar;
//    property RegTime: TDatetime read FRegTime write SetRegTime; //ע��ʱ��
//    property DevMajorVer: byte read FDevMajorVer write SetDevMajorVer; //�豸\�����汾��
//    property DevMinorVer: byte read FDevMinorVer write SetDevMinorVer;
//    property SendMsgFreq: Word read FSendMsgFreq write SetSendMsgFreq; //�������ݡ�Ƶ��
//    property SendMsgAuto: byte read FSendMsgAuto write SetSendMsgAuto; //�������� �Զ�
//    property BatteryVoltage: Word read FBatteryVoltage write SetBatteryVoltage; //��ص�ѹ del by dxf 2007-1-5 ��Ϊû��ʹ��
//    property BatteryTemp: Word read FBatteryTemp write SetBatteryTemp; // ����¶�    del by dxf 2007-1-5 ��Ϊû��ʹ��


//    property DestSIMNo: string read FDestSIMNo write SetDestSIMNo;   del by dxf 2007-1-5 ��Ϊû��ʹ��
//    property ReturnInterval: integer read FReturnInterval write SetReturnInterval; //�����ر�ʱ����
//    property ReturnCount: byte read FReturnCount write SetReturnCount; //�ر���Ϣ����
//    property AlarmInterval: byte read FAlarmInterval write SetAlarmInterval; //�����ر�ʱ����
//    property AlarmReSendCount: integer read FAlarmReSendCount write SetAlarmReSendCount; //�����ر��ط�����
//    property Bound: byte read FBound write SetBound;
//    property IoStat: byte read FIoStat write SetIoStat;
//    property ExternalEnable: byte read FExternalEnable write SetExternalEnable;
   // property Apn:string read FApn write SetApn;       // �������ַ����������
//    property Pap_user: string read FPap_user write SetPap_user;
//    property Pap_passwd: string read FPap_passwd write SetPap_passwd;
//    property ReadParamNo: string read FReadParamNo write SetReadParamNo; //���豸����ʱ�����ĳ��ƺ�
    property alarm_startTime: TDatetime read FAlarm_startTime write SetAlarm_startTime;
    property Alarm_endTime: TDatetime read FAlarm_endTime write SetAlarm_endTime;
    {property Alarm : Boolean;<br />
    Ŀ���Ƿ��ñ�����־���յ��������ñ�����־��ֱ���ֶ����}
    property Alarm: Boolean read FAlarm write SetAlarm;

//    property OutCAreaId: integer read FOutCAreaId write SetOutCAreaId;
    {Խ�����򱨾���� Alarm_OutConfineArea}
    property Alarm_OutCArea: Boolean read FAlarm_OutCArea write SetAlarm_OutCArea;
    property Alarm_OutCAreaIsShowPop: Boolean read FAlarm_OutCAreaIsShowPop write FAlarm_OutCAreaIsShowPop;

    property Alarm_WayOutCArea: Boolean read FAlarm_WayOutCArea write FAlarm_WayOutCArea;

    {Խ�����򱨾� ������ʼʱ��}
    property AlarmStart_OutCArea: TDatetime read FAlarmStart_OutCArea write SetAlarmStart_OutCArea;
    {Խ�����򱨾� ��������ʱ��}
    property AlarmEnd_OutCArea: TDatetime read FAlarmEnd_OutCArea write SetAlarmEnd_OutCArea;
//    property InCAreaId: integer read FInCAreaId write SetInCAreaId; // ʻ�뱨������ID
    property Alarm_InCArea: Boolean read FAlarm_InCArea write SetAlarm_InCArea;

    property Alarm_WayInCArea: Boolean read FAlarm_WayInCArea write FAlarm_WayInCArea;
    property AlarmStart_InCArea: TDatetime read FAlarmStart_InCArea write SetAlarmStart_InCArea;
    property AlarmEnd_InCArea: TDatetime read FAlarmEnd_InCArea write SetAlarmEnd_InCArea;
    {�û��ֶ�ˢ�����ݺ󣬻�����--û����ϵͳ�����ɾ��}
//    property IsRefresh_Exist: Boolean read FIsRefresh_Exist write SetIsRefresh_Exist;

    property TelList: TIntegerList read FTelList;
    property EventList: TIntegerList read FEventList;
    property InfoMenuList: TIntegerList read FInfoMenuList;
    property ClassInfoMenuList: TIntegerList read FClassInfoMenuList;
    property AnswerList: TIntegerList read FAnswerList;
    property AdInfoList: TStringList read FAdInfoList;
    property Qustion: string read FQustion write FQustion;
    property DisplayMenuList: TIntegerList read FDisplayMenuList;
    property TelItems[index: integer]: PTelInfo read GetTelItems;
    property EventItems[index: Integer]: PEventInfo read GetEventItem;
    property InfoMenuItems[index: Integer]: PInfoMenu read GetInfoMenuItem;
    property ClassInfoMenuItems[index: Integer]: pClassInfoMenu read GetClassInfoMenuItem;
    property AnswerItems[index: Integer]: PAnswerInfo read GetAnswerItem;
    property DisPlayMenuItems[index: integer]: PDisplayMenu read GetDisplayItems;
    property CancelOrderMenuItems[index: integer]: PCancelOrderMenu read GetCancelOrderMenuItems;
    property CancelOrderMenuCount: integer read GetCancelOrderMenuCount;
    //������ʾ����ʾ�Ĺ�˾���ơ�
//    property DisPlayCoName: string read FDisPlayCoName write SetDisPlayCoName;
    property LastConnectTime: TDatetime read FLastConnectTime write FLastConnectTime;

    property isOnline: Boolean read FisOnline write SetIsOnline;
    property isOnlineOnTheMap: Boolean read FisOnlineOnTheMap write FisOnlineOnTheMap;
    property DriverNameTeL: string read FDriverNameTel write FDriverNameTel;
    property DriverName: string read FDriverName write FDriverName;
    property DriverTel: string read FDriverTel write FDriverTel;
    property DriverServeNum: string read FDriverServeNum write FDriverServeNum;
    property DriverName2: string read FDriverName2 write FDriverName2;
    property DriverTel2: string read FDriverTel2 write FDriverTel2;
    property DriverServeNum2: string read FDriverServeNum2 write FDriverServeNum2;
    property Hide: Boolean read FHide write FHide;
    property Highlight: Boolean read FHighlight write FHighlight;
    //ʡ��
    property ShengName: string read FShengName write FShengName;
    //����
    property ShiName: string read FShiName write FShiName;
    //����
    property XianName: string read FXianName write FXianName;
    //��������б�
    property AreaList: TAreaList read FAreaList write FAreaList;
    //���õ������������б�
    property DevAreaList:TIntegerList read FDevAreaList write SetDevAreaList;
    //�״��������
    property FirstInPoint: TPoint read FFirstInPoint write FFirstInPoint;
    //�״γ������
    property FirstOutPoint: TPoint read FFirstOutPoint write FFirstOutPoint;
    //���һ���յ���Ƭ��ID��
    property LastPictureID: integer read FLastPictureID write FLastPictureID;
    //��ѡ�����������Ƿ�ѡ����Ŀ��
    property IsSelected: Boolean read FIsSelected write SetIsSelected;
    property Login_Driver: string  read FLogin_Driver write SetLogin_Driver;
    property Login_DriverName:string read FLogin_DriverName write SetLogin_DriverName;

    property TerminalTypeId: Integer read FTerminalTypeId write SetTerminalTypeId;
    property TerminalTypeName: string read FTerminalTypeName write SetTerminalTypeName;

    property LastLogin_DateTime: TDateTime read FLastLogout_DateTime write SetLastLogin_DateTime;
    property LastLogout_DateTime: TDateTime read FLastLogout_DateTime write SetLastLogout_DateTime;
    property LogInOut: Boolean read FLogInOut write SetLogInOut;
    property NotFirstLog: Boolean read FNotFirstLog write SetNotFirstLog;
    property SpecialCar: Boolean read FSpecialCar write FSpecialCar;
    property GoToTown: TDateTime read FGoToTown write SetGoToTown;
    property OutToTown: Boolean read FOutToTown write SetOutToTown;
    property OutToTownTime: TDateTime read FOutToTownTime write FOutToTownTime;
    property OutToTownAlarm: Boolean read FOutToTownAlarm write FOutToTownAlarm;
    property GetLastPostion: Boolean read FGetLastPostion write FGetLastPostion;

    property MsgID: Integer read FMsgID write FMsgID;

    property DevList: TIntegerList read FDevList write FDevList;

    property PursuePostion: Boolean read FPursuePostion write FPursuePostion;
//    property AccuseNum: Integer read FAccuseNum write FAccuseNum;
//    property MY: Integer read FMY write FMY;
//    property BMY: Integer read FBMY write FBMY;
//    property syyje: Double read Fsyyje write Fsyyje;
//    property xslc: Double read Fxslc write Fxslc;
//    property kslc: Double read Fkslc write Fkslc;
//    property ksl: string read Fksl write Fksl;
    property MsgTypeState: string read FMsgTypeState write FMsgTypeState;
    property OnMinSpeedTime: TDateTime read FOnMinSpeedTime write FOnMinSpeedTime;
    property MaintainTime: Integer read FMaintainTime write FMaintainTime;
//    property SuspectedPetitions: Boolean read FSuspectedPetitions write FSuspectedPetitions;

    property IsOnMap: Boolean read FIsOnMap write FIsOnMap;
    property WarningSign: LongWord read FWarningSign write FWarningSign;
    property StateSign: LongWord read FStateSign write FStateSign;
    property IsNewGpsData: Boolean read FIsNewGpsData write FIsNewGpsData;
    property IsGpsDataRefreshed: Boolean read FIsGpsDataRefreshed write SetIsGpsDataRefreshed;
    property PGpsData: PGpsData_V3 read FPGpsData write FPGpsData;
    //property MeterParam: TMeterParam_V3 read FMeterParam write FMeterParam;
    property AuthCode: string read FAuthCode write SetAuthCode;//��Ȩ��
    property OilVolume: Double read FOilVolume write SetOilVolume;//����
    property Course: Double read FCourse write SetCourse;//���
    property RunRecSpeed: Integer read FRunRecSpeed write SetRunRecSpeed;//��ʻ��¼�ٶ�
    property IsSendCancelEmgcyAlarm: Boolean read FIsSendCancelEmgcyAlarm write SetIsSendCancelEmgcyAlarm;//�Ƿ�
    property InfoTypeIdList: TIntegerList read FInfoTypeIdList;
    property AlarmInfoId: Integer read FAlarmInfoId write SetAlarmInfoId;
    property PointWhenAccOff: TWorldPoint read FPointWhenAccOff write SetPointWhenAccOff;
    property IsAccOff: Boolean read FIsAccOff write SetIsAccOff;
    property IsInAreaOnTime: Boolean read FIsInAreaOnTime write SetIsInAreaOnTime;                        //�Ƿ�׼ʱ����
    property IsAlarmedInAreaOnTime: Boolean read FIsAlarmedInAreaOnTime write SetIsAlarmedInAreaOnTime;   //�Ƿ�δ׼ʱ���ﱨ��
    property IsOutAreaOnTime: Boolean read FIsOutAreaOnTime write SetIsOutAreaOnTime;                     //�Ƿ�ʱ�뿪
    property IsAlarmedOutAreaOnTime: Boolean read FIsAlarmedOutAreaOnTime write SetIsAlarmedOutAreaOnTime;//�Ƿ�δ��ʱ�뿪����

    //-----����ƽ̨�豸����----
    property IsEncrypted: Boolean read FIsEncrypted write SetIsEncrypted;//�Ƿ����
    property Speed_RunRec: Integer read FSpeed_RunRec write SetSpeed_RunRec;//��ʻ��¼���ٶ�
    //-----����ƽ̨�豸����----

    property AlarmIdManual: Integer read FAlarmIdManual write SetAlarmIdManual;//��Ҫ�˹�ȷ�ϱ����¼���ID
    property PreviousReceiveTime: string read FPreviousReceiveTime write FPreviousReceiveTime; // �ϸ����ʱ��
    property ReceiveTime: string read FReceiveTime write FReceiveTime;
    property PreviousLatitude: double read FPreviousLatitude write FPreviousLatitude; // �ϸ����γ��
    property PreviousLongitude: Double read FPreviousLongitude write FPreviousLongitude;  // �ϸ���ľ���
    property IsFatigueAlarm: Boolean  read FIsFatigueAlarm write SetFatigueAlarm;//�Ƿ���ƣ�ͱ���״̬
    property IsFatigueAlarmStatChanged: Boolean read FIsFatigueAlarmStatChanged write SetFatigueAlarmStatChanged;//ƣ�ͱ���״̬�仯
    property LastFatigueAlarmPicData: TByteDynArray read FLastFatigueAlarmPicData write FLastFatigueAlarmPicData;//ԭֻ�����ƣ�ͱ�����Ƭ���ݣ��ָ�Ϊ���һ����Ƭ����
    property LastFatigueAlarmGpsTime: string read FLastFatigueAlarmGpsTime write FLastFatigueAlarmGpsTime;//ͬ�ϣ���Ϊ���һ����Ƭ��GPSʱ��
    property LastFatigueAlarmSpeed: Double read FLastFatigueAlarmSpeed write FLastFatigueAlarmSpeed;//ͬ�����һ����Ƭ���ٶ�
    property LastPicType: Byte read FLastPicType write SetLastPicType;//���һ����Ƭ�ı�������
    property IsLastPicSet: Boolean read FIsLastPicSet write SetLastPicSet;//���һ����Ƭ�Ƿ�����

    property SignalStrength: Byte read  FSignalStrength write SetSignalStrength;//�����ź�ǿ��
    property NavSatelliteCount: Byte read FNavSatelliteCount write SetNavSatelliteCount;//�������Ǹ���
    property IsHibernated: Boolean read FIsHibernated write SetHibernated;//�Ƿ�������״̬
    property IsDeepHibernated: Boolean read FIsDeepHibernated write SetDeepHibernated;//�Ƿ���������� 
  public
    MeterParam: TMeterParam_V3;
    Param: TDevParam; //��������  //��������;
    ShengMetaIndex: integer; //ʡ�����ͼԪ
    ShiMetaIndex: integer; //�в����ͼԪ
    XianMetaIndex: integer; //�ز����ͼԪ
    function CarNoDeleteDevName:string;
    procedure setLastFatigueAlarmPicData(pic: PicInfo);
  end;

  //--------------�豸����������������������������������
  TDeviceManage = class(TObject)
  private
    FList: THashedStringList;//TStringList;//TIntegerList;

    FMaxId: Integer;//Ϊ����ƽ̨���͹����ĳ�������豸�� ��������ƽ̨�������ĳ������豸�Ŷ���2000000000��2009999999

    FStat: TBits;
    FAutoTrackList: TStringList;
    FUserSelectList: TStringList;
    FCurrentDevOnTheMap: TIntegerList;
    FOnDevAlarm_OutorInCArea: TDevAlarm_OutorInCAreaEvent;
    //FPopupMenu: TPopupMenu;
    FCurrentDevOnTheMapIsUse: Boolean;
    FOnSendMsg: TSendMsg;
    FShengLayer: TDrawLayer;
    FXianLayer: TDrawLayer;
    FShiLayer: TDrawLayer;
    FRoad: TDrawLayer;
    FOnDevEmergncyAlarmEvent: TDevEvent;
    FOnEarlyWarningEvent: TEarlyWarningEvent;
    FOnDevOtherAlarmEvent: TDevAllKindsOfAlarmEvent;
    FOnCarOverSpeedAlarmEvent: TCarOverSpeedAlarmEvent;
    FOnCarInOutAreaAlarmEvent: TCarInOutAreaAlarmEvent;
    FOnCarRunTimeAlarmEvent: TCarRunTimeAlarmEvent;
    FOnGpsDataAlarmEvent: TGpsDataAlarmEvent;
    FOnCarIOAreaOnTimeAlarmEvent: TCarIOAreaOnTimeAlarmEvent;
    FOnCarAccOffMoveAlarmEvent: TCarAccOffMoveAlarmEvent;
    FOnDevOnLineStatusChanged: TDevOnLineStatusChanged;
    FDevOnFatigueAlarm: TDevOnFatigueAlarm;
    //FProj: TProjection;
    function GetItems(index: integer): TDevice;
    procedure SetStat(const Value: TBits);
    function Getcount: integer;
    function GetItemsFromMetaIndex(index: integer): TDevice;
    procedure SetOnDevAlarm_OutorInCArea(const Value: TDevAlarm_OutorInCAreaEvent);
    procedure SendMsg(ADevID: string; AType: byte; MsgStr: string);
    procedure SetOnDevEmergncyAlarmEvent(const Value: TDevEvent);
    procedure SetOnEarlyWarningEvent(const Value: TEarlyWarningEvent);
    procedure SetOnDevOtherAlarmEvent(const Value: TDevAllKindsOfAlarmEvent);
    procedure SetOnCarOverSpeedAlarmEvent(
      const Value: TCarOverSpeedAlarmEvent);
    procedure SetOnCarInOutAreaAlarmEvent(
      const Value: TCarInOutAreaAlarmEvent);
    procedure SetOnCarRunTimeAlarmEvent(
      const Value: TCarRunTimeAlarmEvent);
    procedure SetOnGpsDataAlarmEvent(const Value: TGpsDataAlarmEvent);
    procedure SetOnCarIOAreaOnTimeAlarmEvent(
      const Value: TCarIOAreaOnTimeAlarmEvent);
    procedure SetOnCarAccOffMoveAlarmEvent(
      const Value: TCarAccOffMoveAlarmEvent);
    procedure SetOnDevOnLineStatusChanged(
      const Value: TDevOnLineStatusChanged);
    procedure SetDevOnFatigueAlarm(const Value: TDevOnFatigueAlarm);
//    function GetItems(Index: Integer): TDevice;
  private
    procedure Remove(const AnIndex: integer);

    //procedure OverSpeetOfArea(Adev: TDevice);
//------------------------------------------------------------------
    function GetCurrentOnTheMapDev(index: integer): TDevice;
    function GetCurrentDevOnTheMapIndex(XY: integer): integer;
//-------------------------------------------------------------------

  public

    constructor Create;
    destructor Destroy; override;
    // ���һ���µ��ƶ�Ŀ�굽��������
    function Add(const ATargetIDStr: string): TDevice; overload;
    function AddNewDevice(const ATargetIDStr: string): TDevice;
    function Add(device: TDevice): TDevice; overload;//�����Ͷ���ʱ��ʹ��

    function AddAGovDev(car: TCar): TDevice;
    // Ѱ��һ��Ŀ��
//    function find(const ATargetID: integer): TDevice; overload;
    function find(const ATargetIDStr: string): TDevice; //overload;
    function findByDevIdFuzzy(const ATargetIDStr: string): TDevice;
    function FindToCarNO(const DevId: string): string;
    // �ɳ��ƺ� �� ���豸
    function FindDevFromCarNo(const ANo: string): TDevice;
    function FindDevFromCarNoFuzzy(const ANo: string): TDevice;
    //�ɳ���SIM�����롡�ҳ��豸
    function FindDevFromSimno(const ASimno: string): TDevice;
    function FindDevFromSimnoFuzzy(const ASimno: string): TDevice;
    function FindDevFromDisp(const ADis: string): TDevice;
    function FindDevByZBH(const AZBH: string): TDevice;
    function FindDevByZBHFuzzy(const AZBH: string): TDevice;
    function FindDevByDriverName(const driverName: string): TDevice;
    function FindDevByDriverNameFuzzy(const driverName: string): TDevice;
    function FindDevByCarId(const CarId: Integer): TDevice;
    // ɾ��һ��Ŀ��
    procedure Delete(const ATargetID: string);
    {������г���}
    procedure ClearDevice;
   //  ��ӵ��Զ������б���
    procedure AddToAutoTrack(const ATargetID: integer);
  //   ���Զ������б������
    procedure RemoveFromAutoTrack(const ATargetID: integer);
    //�г����г���������˾����Ϣ
    procedure CreateDriverNameTel;
    //��ӵ����û��ڵ�ͼ��ѡ�г����б��� sha20050224
    procedure AddToUserSelectList(const AID: string);
    procedure ClearUserSelectList;
    function FindFromMetaIndex(const AMetaIndex: integer): string;
    function LaodCancelMenu: Boolean;
    { Procedure: ReceiveGpsData<br>
     ����Gps����,��������Ӧ�Ĵ���.<BR />
     <UL>
     <li>�ҳ���Ӧ��Ŀ��</li>
     <li>���Ŀ�겻����,�򴴽�Ŀ��,����ѯ��Ӧ����Ϣ</li>
     <li>�Ѷ�λ���ݴ��ݸ���Ӧ��Ŀ��</li>
     <li>��ɴ�����</li>
     </UL>  }
    procedure ReceiveGpsData_V3(PGpsData: PGpsData_V3; IsLastGpsData: Boolean=False; isPursuePostion: Boolean=False; AttachInfo: TByteDynArray = nil); overload;
    procedure DealGpsDataWarningSign(dev: TDevice);
    procedure DealAttachInfo(dev: TDevice; attachId: Byte; attachLen: Byte; attachData: TByteDynArray);
    procedure ReceiveGpsData(PGpsData: PGpsData_V2;IsLastGpsData:boolean=False); overload;

    procedure DealLogin_In(dev_id: string;driver_no: string; dateTime: TDateTime);
    procedure Deallogin_Out(dev_id: string;driver_no: string; dateTime: TDateTime);

    //---���� ���� ��ʻ�켣�ߵ���ɫ
//    procedure SetDevTrackPen(const ADevID: string; const Acolor: Tcolor); overload;
    procedure SetDevTrackPen(const ADevice: TDevice; const Acolor: Tcolor); //overload;
    procedure CarNOAndDevName; //���ƺź��豸���ƺ���һ��....
 //------------------------------------------------------------------------------------
    procedure AddCurrentDevOnTheMap(X: integer; Y: integer; Dev: TDevice);
    procedure ClearCurrentDevOnTheMap;
    function FindDevOnTheMap(XY: integer; var FindedXY: integer): TDevice;
    procedure FindMapName(m: TDevice; p: TWorldPoint);
 //------------------------------------------------------------------------------------
    //�жϳ����Ƿ�Խ���ʻ�뱨������2005-8-3 sha
    procedure JudgeDevOutOrInCArea(Adev: TDevice);
    // �ۼ�����
    procedure JudgeAssembleWarring(Adev: TDevice);

    procedure SetAllDevIsOffLine;

  //  ������������Ŀ��
    property Items[index: integer]: TDevice read GetItems;
  // �����û�ѡ�г����б� ������������Ŀ��
    property ItemsFromMetaIndex[index: integer]: TDevice read GetItemsFromMetaIndex;
  //  ���ص�ǰĿ�������
    property Count: integer read Getcount;
    {property Stat: TBits;<br />
    ����״̬,һϵ�п���������״̬�仯����������Ӧ��״̬�ı��,������Ӧ��λ,
    ɨ�������ɨ����Ӧ��״̬�仯��<br />
    <ul>
    <li>24��31λ��ʾ���������ӵ�Ŀ��</li>
    <li>0��7λ��ʾ�����µĳ������ݵ���</li>
    </ul>}
    property stat: TBits read FStat write SetStat;
   //�Զ�����Ŀ�����
    property AutoTrackList: TStringList read FAutoTrackList;
    //�ڵ�ͼ�ϱ��û�ѡ�еĳ���
    property UserSelectList: TStringList read FUserSelectList;
    //����Խ�籨�� �� ʻ�뱨��
    property OnDevAlarm_OutorInCArea: TDevAlarm_OutorInCAreaEvent read FOnDevAlarm_OutorInCArea write SetOnDevAlarm_OutorInCArea;
    //GPS��λ�����еĳ������������ ���౨���¼� :���١���ѹ���ϵ硢���������򱨾���ƣ�ͱ�����ƫ��·�߱������������...
    property OnDevOtherAlarmEvent: TDevAllKindsOfAlarmEvent read FOnDevOtherAlarmEvent write SetOnDevOtherAlarmEvent;
    //˾��������������
    property OnDevEmergncyAlarmEvent:TDevEvent read FOnDevEmergncyAlarmEvent write SetOnDevEmergncyAlarmEvent;
    property OnEarlyWarningEvent: TEarlyWarningEvent read FOnEarlyWarningEvent write SetOnEarlyWarningEvent;
    property CurrentDevOnTheMapIsUse: Boolean read FCurrentDevOnTheMapIsUse write FCurrentDevOnTheMapIsUse;

    property OnCarOverSpeedAlarmEvent: TCarOverSpeedAlarmEvent read FOnCarOverSpeedAlarmEvent write SetOnCarOverSpeedAlarmEvent;
    property OnCarInOutAreaAlarmEvent: TCarInOutAreaAlarmEvent read FOnCarInOutAreaAlarmEvent write SetOnCarInOutAreaAlarmEvent;
    property OnCarRunTimeAlarmEvent: TCarRunTimeAlarmEvent read FOnCarRunTimeAlarmEvent write SetOnCarRunTimeAlarmEvent;
    property OnGpsDataAlarmEvent: TGpsDataAlarmEvent read FOnGpsDataAlarmEvent write SetOnGpsDataAlarmEvent;
    property OnCarIOAreaOnTimeAlarmEvent: TCarIOAreaOnTimeAlarmEvent read FOnCarIOAreaOnTimeAlarmEvent write SetOnCarIOAreaOnTimeAlarmEvent;
    property OnCarAccOffMoveAlarmEvent: TCarAccOffMoveAlarmEvent read FOnCarAccOffMoveAlarmEvent write SetOnCarAccOffMoveAlarmEvent;
    property OnDevOnLineStatusChanged: TDevOnLineStatusChanged read FOnDevOnLineStatusChanged write SetOnDevOnLineStatusChanged;
    property OnDevOnFatigueAlarm: TDevOnFatigueAlarm read FDevOnFatigueAlarm write SetDevOnFatigueAlarm;

    property OnSendMsg: TSendMsg read FOnSendMsg write FOnSendMsg;
    //ʡͼ��
    property ShengLayer: TDrawLayer read FShengLayer write FShengLayer;
    //��ͼ��
    property ShiLayer: TDrawLayer read FShiLayer write FShiLayer;
    //��ͼ��
    property XianLayer: TDrawLayer read FXianLayer write FXianLayer;
    //·
    property Road: TDrawLayer read FRoad write FRoad;
  end;

  // Ԥ��������
  TEarlyWarningCar = class(TObject)
    FDevId: string;
    FState: Byte; // 0��δȷ�� 1����ȷ�� 2��ȡ��ȷ��
    FDev: TDevice;

    FEarlyWarningInfoList: TStringList; // ���Ԥ��ʱ��
    FPicInfoList: TIntegerList;
  public
    constructor Create;
    destructor Destroy; override;
    property DevId: string read FDevId write FDevId;
    property State: Byte read FState write FState;
    property Dev: TDevice read FDev write FDev;

    property EarlyWarningInfoList: TStringList read FEarlyWarningInfoList write FEarlyWarningInfoList;
    property PicInfoList: TIntegerList read FPicInfoList write FPicInfoList;
  end;

  //��Ϣ�㲥��Ϣ����
  TInfo = class(TObject)
  private
    FInfoTypeId: Integer;
    FInfoId: Integer;
    FInfoContent: string;
    FSendTime: TDateTime;
    FMemo: string;
    FIsSent: Boolean;
    procedure SetInfoContent(const Value: string);
    procedure SetInfoId(const Value: Integer);
    procedure SetInfoTypeId(const Value: Integer);
    procedure SetSendTime(const Value: TDateTime);
    procedure SetMemo(const Value: string);
    procedure SetIsSent(const Value: Boolean);

  public
    constructor Create;
    destructor Destroy; override;

    property InfoId: Integer read FInfoId write SetInfoId;
    property InfoTypeId: Integer read FInfoTypeId write SetInfoTypeId;
    property InfoContent: string read FInfoContent write SetInfoContent;
    property SendTime: TDateTime read FSendTime write SetSendTime;
    property Memo: string read FMemo write SetMemo;
    property IsSent: Boolean read FIsSent write SetIsSent;
  end;

  //��Ϣ�㲥��Ϣ����
  TInfoType = class(TObject)
  private
    FInfoList: TIntegerList;
    FDevIdList: TStringList;
    FId: Integer;
    FInfoTypeId: Integer;
    FInfoTypeName: string;
    FMemo: string;

    function GetInfoCount: Integer;
    function GetInfoItem(index: Integer): TInfo;
    procedure SetId(const Value: Integer);
    procedure SetInfoTypeId(const Value: Integer);
    procedure SetInfoTypeName(const Value: string);
    procedure SetMemo(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;

    function AddInfo(infoId: Integer): TInfo;
    function FindInfo(infoId: Integer): TInfo;

    procedure DeleteInfo(infoId: Integer);
    procedure Clear;

    function AddDevId(devId: string): Boolean;
    function DelDevId(devId: string): Boolean;

    property Id: Integer read FId write SetId;
    property InfoTypeId: Integer read FInfoTypeId write SetInfoTypeId;
    property InfoTypeName: string read FInfoTypeName write SetInfoTypeName;
    property Memo: string read FMemo write SetMemo; 

    property InfoCount: Integer read GetInfoCount;
    property InfoItem[Index: Integer]: TInfo read GetInfoItem;
    property DevIdList: TStringList read FDevIdList;
  end;

  TInfoTypeManage = class(TObject)
  private
    FList: TIntegerList;

    function GetCount: Integer;
    function GetItem(index: Integer): TInfoType;
  public
    constructor Create;
    destructor Destroy; override;

    function AddInfoType(id: Integer): TInfoType;
    function FindInfoType(id: Integer): TInfoType;
    function FindInfoTypeByTypeId(typeId: Integer): TInfoType;
    function FindInfoTypeByTypeName(typeName: string): TInfoType;

    procedure DeleteInfoType(id: Integer);
    procedure DeleteInfoTypeByTypeId(typeId: Integer);
    procedure Clear;

    property Count: Integer read GetCount;
    property Items[Index: Integer]: TInfoType read GetItem;
  end;

  TAlarmInfoFromDev = class(TObject)
  private
    FAlarmDealStatus: Integer;
    FAlarmType: Integer;
    FAlarmPos: string;
    FDevId: string;
    FCarNo: string;
    FAlarmMemo: string;
    FAlarmTime: TDateTime;
    FId: Integer;
    FSendGetPicCmdStatus: Byte;
    FSendTextCmdStatus: Byte;
    FSendCallBackCmdStatus: Byte;
    FSendRemoveAlarmCmdStatus: Byte;
    FAlarmDealId: Integer;
    FAlarmIdManual: Integer;
    FAlarmLong: Double;
    FAlarmLat: Double;
    FIsReqAlarmPos: Boolean;
    procedure SetAlarmDealStatus(const Value: Integer);
    procedure SetAlarmMemo(const Value: string);
    procedure SetAlarmPos(const Value: string);
    procedure SetAlarmTime(const Value: TDateTime);
    procedure SetAlarmType(const Value: Integer);
    procedure SetCarNo(const Value: string);
    procedure SetDevID(const Value: string);
    procedure SetId(const Value: Integer);
    procedure SetSendCallBackCmdStatus(const Value: Byte);
    procedure SetSendGetPicCmdStatus(const Value: Byte);
    procedure SetSendTextCmdStatus(const Value: Byte);
    procedure SetSendRemoveAlarmCmdStatus(const Value: Byte);
    procedure SetAlarmDealId(const Value: Integer);
    procedure SetAlarmIdManual(const Value: Integer);
    procedure SetAlarmLat(const Value: Double);
    procedure SetAlarmLong(const Value: Double);
    procedure SetIsReqAlarmPos(const Value: Boolean);

  public
    constructor Create;
    destructor Destroy; override;

    property Id: Integer read FId write SetId;
    property DevId: string read FDevId write SetDevID;
    property CarNo: string read FCarNo write SetCarNo;
    property AlarmType: Integer read FAlarmType write SetAlarmType;
    property AlarmTime: TDateTime read FAlarmTime write SetAlarmTime;
    property AlarmPos: string read FAlarmPos write SetAlarmPos;
    property AlarmMemo: string read FAlarmMemo write SetAlarmMemo;
    property AlarmDealStatus: Integer read FAlarmDealStatus write SetAlarmDealStatus;
    property SendCallBackCmdStatus: Byte read FSendCallBackCmdStatus write SetSendCallBackCmdStatus;          //��������        0:δ����  1:���ڷ���  2:���ͳɹ� 3:����ʧ��
    property SendGetPicCmdStatus: Byte read FSendGetPicCmdStatus write SetSendGetPicCmdStatus;                //��������        0:δ����  1:���ڷ���  2:���ͳɹ� 3:����ʧ��
    property SendTextCmdStatus: Byte read FSendTextCmdStatus write SetSendTextCmdStatus;                      //�ı�����        0:δ����  1:���ڷ���  2:���ͳɹ� 3:����ʧ��
    property SendRemoveAlarmCmdStatus: Byte read FSendRemoveAlarmCmdStatus write SetSendRemoveAlarmCmdStatus;//��������������� 0:δ����  1:���ڷ���  2:���ͳɹ� 3:����ʧ��
    property AlarmDealId: Integer read FAlarmDealId write SetAlarmDealId;                                    //������������ݿ��ж�Ӧ��ID
    property AlarmIdManual: Integer read FAlarmIdManual write SetAlarmIdManual;//����λ�����е����ֶ�����ID������������ƽ̨�ϱ�ʱ�õ������Ϊ0���ϱ�
    property AlarmLong: Double read FAlarmLong write SetAlarmLong;//����ʱ�ľ���
    property AlarmLat: Double read FAlarmLat write SetAlarmLat;//����ʱ��γ��
    property IsReqAlarmPos: Boolean read FIsReqAlarmPos write SetIsReqAlarmPos;//�Ƿ����������λ��
  end;

  TAlarmINfoFromDevManage = class(TObject)
  private
    FList: TIntegerList;
    FMaxId: Integer;
    FIsEmergencyHappened: Boolean;//�Ƿ��н�����������

    function GetCount: Integer;
    function GetItem(index: Integer): TAlarmInfoFromDev;
    procedure SetIsEmergencyHappened(const Value: Boolean);
  public
    constructor Create;
    destructor Destroy; override;

    function Add(id: Integer): TAlarmInfoFromDev;
    function Find(id: Integer): TAlarmInfoFromDev;
    procedure Delete(id: Integer);
    procedure Clear;

    property Count: Integer read GetCount;
    property Items[Index: Integer]: TAlarmInfoFromDev read GetItem;
    property IsEmergencyHappened: Boolean read FIsEmergencyHappened write SetIsEmergencyHappened;
  end;

  TGovInfo = class(TObject)
  private
    FId: Integer;
    FMsg: string;
    FSrcCmdId: Integer;
    FObjType: Byte;
    FObjId: TGovObjID;
    procedure SetId(const Value: Integer);
    procedure SetMsg(const Value: string);
    procedure setSrcCmdId(const Value: Integer);
    procedure SetObjId(const Value: TGovObjID);
    procedure SetObjType(const Value: Byte);

  public
    constructor Create;
    destructor Destroy; override;

    property ObjType: Byte read FObjType write SetObjType;//��������
    property ObjId: TGovObjID read FObjId write SetObjId;
    property Id: Integer read FId write SetId;
    property SrcCmdId: Integer read FSrcCmdId write setSrcCmdId;//���ʹ���Ϣ������ID
    property Msg: string read FMsg write SetMsg;
  end;

  TGovInfoManage = class(TObject)
  private
    FList: TIntegerList;
    FMinId: Integer;

    function GetCount: Integer;
    function GetItem(index: Integer): TGovInfo;
  public
    constructor Create;
    destructor Destroy; override;

    function Add(Id: Integer): TGovInfo;
    function Find(Id: Integer): TGovInfo;
    procedure Delete(Id: Integer);
    procedure Clear;

    property Items[index: Integer]: TGovInfo read GetItem;
    property Count: Integer read GetCount;
  end;

  TGovAlarmInfo = record
    CarNo: string;
    CarCPColorId: Byte;
    AlarmSrc: Byte;
    AlarmType: Word;
    AlarmTime: TDateTime;
    AlarmMsg: string;
    GovAlarm_Type: Byte; //1:����Ԥ����Ϣ 2:ʵʱ������Ϣ
  end;
  PGovAlarmInfo = ^TGovAlarmInfo;

  TAlarmSupervise = class(TObject)
  private
    FAlarmType: Byte;
    FAlarmLevel: Byte;
    FAlarmSrc: Byte;
    FId: Integer;
    FAlarmSupervisor: String;
    FAlarmTel: string;
    FAlarmEmail: string;
    FAlarmDealStatus: Integer;
    FDev: TDevice;
    FAlarmId: LongWord;
    FCarCpColor: Byte;
    FCarNo: string;
    FDevId: string;
    FAlarmDeadLineTime: TDateTime;
    FAlarmTime: TDateTime;
    procedure setAlarmEmail(const Value: string);
    procedure setAlarmLevel(const Value: Byte);
    procedure setAlarmSrc(const Value: Byte);
    procedure setAlarmTel(const Value: string);
    procedure setAlarmType(const Value: Byte);
    procedure SetId(const Value: Integer);
    procedure setSupervisor(const Value: String);
    procedure setAlarmDealStatus(const Value: Integer);
    procedure setDev(const Value: TDevice);
    procedure SetAlarmId(const Value: LongWord);
    procedure SetCarCpColor(const Value: Byte);
    procedure SetCarNo(const Value: string);
    procedure SetDevId(const Value: string);
    procedure SetAlarmDeadLineTime(const Value: TDateTime);
    procedure SetAlarmTime(const Value: TDateTime);

  public
    constructor Create;
    destructor Destroy; override;

    property Id: Integer read FId write SetId;
    property AlarmId: LongWord read FAlarmId write SetAlarmId;
    property AlarmSrc: Byte read FAlarmSrc write setAlarmSrc;
    property AlarmType: Byte read FAlarmType write setAlarmType;
    property AlarmLevel: Byte read FAlarmLevel write setAlarmLevel;
    property AlarmSupervisor: String read FAlarmSupervisor write setSupervisor;
    property AlarmTel: string read FAlarmTel write setAlarmTel;
    property AlarmEmail: string read FAlarmEmail write setAlarmEmail;
    property Dev: TDevice read FDev write setDev;
    property AlarmDealStatus: Integer read FAlarmDealStatus write setAlarmDealStatus;
    property CarNo: string read FCarNo write SetCarNo;
    property CarCpColor: Byte read FCarCpColor write SetCarCpColor;
    property DevId: string read FDevId write SetDevId;
    property AlarmTime: TDateTime read FAlarmTime write SetAlarmTime;
    property AlarmDeadLineTime: TDateTime read FAlarmDeadLineTime write SetAlarmDeadLineTime;
  end;

  TAlarmSuperviseManage = class(TObject)
  private
    FList: TIntegerList;
    FMaxId: Integer;

    function GetItem(Index: Integer): TAlarmSupervise;
    function GetCount: Integer;
  public
    constructor Create;
    destructor Destroy; override;

    function Add(Id: Integer): TAlarmSupervise;
    function Find(Id: Integer): TAlarmSupervise;
    procedure Delete(Id: Integer);
    procedure Clear;

    property Items[index: Integer]: TAlarmSupervise read GetItem;
    property Count: Integer read GetCount;
  end;

  TMyHintWindow = class(TComponent)
  private
    FHint: string;
    FHintWindow: THintWindow;
    FHintTimer: TTimer;
    procedure SetHint(const Value: string);

  protected
    procedure HideHint(Sender: TObject); virtual;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    property Hint: string read FHint write SetHint;
    property HintWindow: THintWindow read FHintWindow;
    property HintTimer: TTimer read FHintTimer;

    //procedure ShowHint(aHint: string); overload;
    procedure ShowHint(aHint: string; aComponent: TControl); overload;
  end;

  TNotice = class(TObject)
  private
    FId: Integer;
    FContent: string;
    FTitle: string;
    FIsRead: Integer;
    FSendTime: TDateTime;
    FReadTime: TDateTime;
    procedure SetContent(const Value: string);
    procedure SetId(const Value: Integer);
    procedure SetTitile(const Value: string);
    procedure SetIsRead(const Value: Integer);
    procedure SetSendTime(const Value: TDateTime);

  public
    constructor Create;
    destructor Destroy; override;

    property Id: Integer read FId write SetId;
    property Title: string read FTitle write SetTitile;
    property Content: string read FContent write SetContent;
    property IsRead: Integer read FIsRead write SetIsRead;
    property SendTime: TDateTime read FSendTime write SetSendTime;
    property ReadTime: TDateTime read FReadTime write FReadTime;
  end;

  TNoticeManage = class(TObject)
  private
    FList: TIntegerList;

    function GetItem(index: Integer): TNotice;
    function GetCount: Integer;
  public
    constructor Create;
    destructor Destroy; override;

    function Add(Id: Integer): TNotice;
    procedure Delete(Id: Integer);
    procedure Clear;

    property Items[Index:Integer]: TNotice read GetItem;
    property Count: Integer read GetCount;
  end;

  TTerminalUpgradeVer = class(TObject)
  private
    FUpgradeTypeId: Byte;
    FId: Integer;
    FTerFactId: string;
    FTerFactName: string;
    FUpgradeTypeName: string;
    FVer: string;
    procedure SetId(const Value: Integer);
    procedure SetTerFactId(const Value: string);
    procedure SetTerFactName(const Value: string);
    procedure SetUpgradeTypeId(const Value: Byte);
    procedure SetUpgradeTypeName(const Value: string);
    procedure SetVer(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    property Id: Integer read FId write SetId;
    property UpgradeTypeId: Byte read FUpgradeTypeId write SetUpgradeTypeId;
    property UpgradeTypeName: string read FUpgradeTypeName write SetUpgradeTypeName;
    property TerFactId: string read FTerFactId write SetTerFactId;
    property TerFactName: string read FTerFactName write SetTerFactName;
    property Ver: string read FVer write SetVer;
  end;

  TTerminalUpgradeVerManage = class(TObject)
  private
    FList: TIntegerList;

    function GetItem(index: Integer): TTerminalUpgradeVer;
    function GetCount: Integer;
  public
    constructor Create;
    destructor Destroy; override;

    function Add(Id: Integer): TTerminalUpgradeVer;
    procedure Delete(Id: Integer);
    procedure Clear;

    property Items[Index:Integer]: TTerminalUpgradeVer read GetItem;
    property Count: Integer read GetCount;
  end;

implementation
uses
  uGloabVar, geome, Dialogs, SystemLog, DateUtils, MapMeasureCalc,MemFormatUnit;
{ TDevice }

constructor TEarlyWarningCar.Create;
begin
  FDev := TDevice.Create;
  FPicInfoList := TIntegerList.Create;
  FEarlyWarningInfoList := TStringList.Create;
end;

destructor TEarlyWarningCar.Destroy;
var
  i: Integer;
begin
  FDev.Free;
  for i:=0 to FPicInfoList.Count-1 do
  begin
    Dispose(FPicInfoList.Datas[i]);
  end;
  FPicInfoList.Free;
  FEarlyWarningInfoList.Free;
end;

constructor TDevice.Create;
begin
  FState := TBits.Create;
  FState.Size := 32;
  FHistory := TCycWPList.Create;
  FHistory.Size := 300; //һ����໭300�켣��
  FSwitch := TBits.Create;
  FSwitch_Warning := TBits.Create;
  FSwitch_Warning_C := TBits.Create;
  FSwitch.Size := 33;
  FSwitch_Warning.Size := 33;
  FSwitch_Warning_C.Size := 35;
  //FOutCAreaId := -1;
  //FInCAreaId := -1;
  FAreaList := TAreaList.Create;
  FTelList := TIntegerList.Create;
  FEventList := TIntegerList.Create;
  FInfoMenuList := TIntegerList.Create;
  FClassInfoMenuList := TIntegerList.Create;
  FDisplayMenuList := TIntegerList.Create;
  FCancelOrderMenuList := TIntegerList.Create;
  FAnswerList := TIntegerList.Create;
  FAdInfoList := TStringList.Create;
  FDevAreaList := TIntegerList.Create;
  FInfoTypeIdList := TIntegerList.Create;

  FLastConnectTime := 0;
  FDriverName := '';

  FMetaIndex := -1;

  ShiMetaIndex := -1;
  XianMetaIndex := -1;
  ShengMetaIndex := -1;
  FShiName := '';
  FShengName := '';
  FXianName := '';
  FFirstInPoint.X := 0;
  FFirstOutPoint.X := 0;
  FLastPictureID := -1;
  FAlarm_OutCAreaIsShowPop := true;
  Orientation1 := -1;
  FOrientationRightTime := 0;
  Login_Driver := 'δ��¼';

  FOutToTownAlarm := True;

  FDevList := TIntegerList.Create;
  DevAlarmCount := 0;

  PreviousReceiveTime := '0';
  ReceiveTime := '0';
  FPreviousLatitude := 0;
  FPreviousLongitude := 0;
  SetLength(FLastFatigueAlarmPicData, 0);
  FLastFatigueAlarmGpsTime := '';
  FLastFatigueAlarmSpeed := 0;
end;

destructor TDevice.Destroy;
var
  i: integer;
  telP: PTelInfo;
  pEvent: PEventInfo;
  menuP: PDisplayMenu;
  infoMenuP: PInfoMenu;
begin
  FState.Free;
  FHistory.Free;
  FSwitch.Free;
  FSwitch_Warning.Free;
  FSwitch_Warning_C.Free;
  //free�绰���б�
  while FTelList.Count > 0 do
  begin
    telP := FTelList.Datas[0];
    FTelList.Delete(0);
    Dispose(telP);
  end;
  FTelList.Free;

  FAreaList.Free;

  while FInfoMenuList.Count > 0 do
  begin
    infoMenuP := FInfoMenuList.Datas[0];
    FInfoMenuList.Delete(0);
    Dispose(infoMenuP);
  end;
  FInfoMenuList.Free;

  FClassInfoMenuList.Free;
  FAnswerList.Free;
  FDevAreaList.Free;
  FDevList.Free;
  FAdInfoList.Free;

  while FEventList.Count > 0 do
  begin
    pEvent := FEventList.Datas[0];
    FEventList.Delete(0);
    Dispose(pEvent);
  end;
  FEventList.Free;

  //free�̶��˵��б�
  for i := 0 to FDisplayMenuList.Count - 1 do
  begin
    menuP := FDisplayMenuList.Datas[i];
    Dispose(menuP);
  end;
  FDisplayMenuList.Free;
  FCancelOrderMenuList.Free;
//  FCarActionLabel.Free;

  FInfoTypeIdList.Clear;
  FInfoTypeIdList.Free;
  inherited;
end;

function TDevice.GetSwitch(index: integer): Boolean;
begin
  Result := FSwitch[index];
end;

function TDevice.GetSwitch_Warning(index: Integer): Boolean;
begin
  Result := FSwitch_Warning[index];
end;

{function TDevice.GetSwitchProp(index: integer): TSwitch;
begin

end;   }


procedure TDevice.SetActive(const Value: Boolean);
begin
  FActive := Value;
end;

procedure TDevice.SetAlarm(const Value: Boolean);
begin
  FAlarm := Value;
end;

procedure TDevice.SetAlarmCount(const Value: byte);
begin
  FAlarmCount := Value;
end;

//procedure TDevice.SetAlarmInterval(const Value: byte);
//begin
//  FAlarmInterval := Value;
//end;

//procedure TDevice.SetAlarmReSendCount(const Value: integer);
//begin
//  FAlarmReSendCount := Value;
//end;

procedure TDevice.SetAlarm_endTime(const Value: TDatetime);
begin
  FAlarm_endTime := Value;
end;

procedure TDevice.SetAlarm_startTime(const Value: TDatetime);
begin
  FAlarm_startTime := Value;
end;


procedure TDevice.SetAngle(const Value: integer);
begin
  FAngle := Value;
end;



{procedure TDevice.SetBatteryTemp(const Value: Word);
begin
  FBatteryTemp := Value;
end; }

{procedure TDevice.SetBatteryVoltage(const Value: Word);
begin
  FBatteryVoltage := Value;
end; }

//procedure TDevice.SetBmp(const Value: TTargetBmp);
//begin
//  FBmp := Value;
//end;

//procedure TDevice.SetBound(const Value: byte);
//begin
//  FBound := Value;
//end;

procedure TDevice.SetCar(const Value: TCar);
begin
  FCar := Value;
end;

{procedure TDevice.SetDestSIMNo(const Value: string);
begin
  FDestSIMNo := Value;
end;    }



//procedure TDevice.SetConnTypeID(const Value: integer);
//begin
//  FConnTypeID := Value;
//end;
//
//procedure TDevice.SetDefaultTrackPen(const Value: TPenStruct);
//begin
//  FDefaultTrackPen := Value;
//end;

//procedure TDevice.SetDevMajorVer(const Value: byte);
//begin
//  FDevMajorVer := Value;
//end;

//procedure TDevice.SetDevMinorVer(const Value: byte);
//begin
//  FDevMinorVer := Value;
//end;

procedure TDevice.SetDispLabel(const Value: string);
begin
  FDispLabel := Value;
end;


procedure TDevice.SetDrawTrack(const Value: Boolean);
begin
  FDrawTrack := Value;
end;

//procedure TDevice.SetExternalEnable(const Value: byte);
//begin
//  FExternalEnable := Value;
//end;

procedure TDevice.SetFirst(const Value: Boolean);
begin
  FFirst := Value;
end;

procedure TDevice.SetGpsTime(const Value: TDatetime);
begin
  FGpsTime := Value;
end;

{procedure TDevice.SetGroup(const Value: Integer);
begin
  FGroup := Value;
end; }

procedure TDevice.SetGroupID(const Value: integer);
begin
  FGroupID := Value;
end;

procedure TDevice.SetId(const Value: string);
begin
  FId := Value;
end;

procedure TDevice.SetFact_id(const Value: Integer);
begin
  FFact_id := Value;
end;

//procedure TDevice.SetIoStat(const Value: byte);
//begin
//  FIoStat := Value;
//end;



procedure TDevice.SetLatitude(const Value: double);
begin
  FLatitude := Value;
end;



procedure TDevice.SetLongitude(const Value: double);
begin
  FLongitude := Value;
end;

procedure TDevice.SetMetaIndex(const Value: integer);
begin
  FMetaIndex := Value;
end;

procedure TDevice.SetMonitor(const Value: Boolean);
begin
  FMonitor := Value;
end;

//procedure TDevice.SetNotActiveTime(const Value: Word);
//begin
//  FNotActiveTime := Value;
//end;

//procedure TDevice.SetPap_passwd(const Value: string);
//begin
//  FPap_passwd := Value;
//end;

//procedure TDevice.SetPap_user(const Value: string);
//begin                
//  FPap_user := Value;
//end;



//procedure TDevice.SetReadParamNo(const Value: string);
//begin
//  FReadParamNo := Value;
//end;

//procedure TDevice.SetRegTime(const Value: TDatetime);
//begin
//  FRegTime := Value;
//end;

//procedure TDevice.SetReturnCount(const Value: byte);
//begin
//  FReturnCount := Value;
//end;

//procedure TDevice.SetReturnInterval(const Value: integer);
//begin
//  FReturnInterval := Value;
//end;

//procedure TDevice.SetSendMsgAuto(const Value: byte);
//begin
//  FSendMsgAuto := Value;
//end;

//procedure TDevice.SetSendMsgFreq(const Value: Word);
//begin
//  FSendMsgFreq := Value;
//end;

procedure TDevice.SetSimNo(const Value: string);
begin
  FSimNo := Value;
end;



procedure TDevice.SetSpeed(const Value: integer);
begin
  FSpeed := Value;
end;

procedure TDevice.SetState(const Value: TBits);
begin
  FState := Value;
end;

procedure TDevice.SetSwitch(index: integer; const Value: Boolean);
begin
  FSwitch[index] := Value;
end;

procedure TDevice.SetSwitch_Warning(index: Integer; const Value: Boolean);
begin
  FSwitch_Warning[index] := Value;
end;

procedure TDevice.SetTraceList(const Value: TCycWPList);
begin
  FHistory := Value;
end;

procedure TDevice.SetTrackPen(const Value: TPenStruct);
begin
  FTrackPen := Value;
end;

procedure TDevice.SetPattern(const Value: Integer);
begin
  FTrackPen.Pattern := Value;
end;

{procedure TDevice.SetOutCAreaId(const Value: integer);
begin
  FOutCAreaId := Value;
end;   }

procedure TDevice.SetAlarm_OutCArea(const Value: Boolean);
begin
  FAlarm_OutCArea := Value;
end;

procedure TDevice.SetAlarmEnd_OutCArea(const Value: TDatetime);
begin
  FAlarmEnd_OutCArea := Value;
end;

procedure TDevice.SetAlarmStart_OutCArea(const Value: TDatetime);
begin
  FAlarmStart_OutCArea := Value;
end;



//procedure TDevice.SetIsRefresh_Exist(const Value: Boolean);
//begin
//  FIsRefresh_Exist := Value;
//end;

procedure TDevice.SetAlarm_InCArea(const Value: Boolean);
begin
  FAlarm_InCArea := Value;
end;

procedure TDevice.SetAlarmEnd_InCArea(const Value: TDatetime);
begin
  FAlarmEnd_InCArea := Value;
end;

procedure TDevice.SetAlarmStart_InCArea(const Value: TDatetime);
begin
  FAlarmStart_InCArea := Value;
end;

{procedure TDevice.SetInCAreaId(const Value: integer);
begin
  FInCAreaId := Value;
end;    }

function TDevice.AddTelInfo(ATelInfoId: integer): PTelInfo;
var
  i: integer;
  p: PTelInfo;
begin
  i := FTelList.IndexOf(ATelInfoId);
  if i >= 0 then
    Result := TelItems[i]
  else
  begin
    New(p);
    p^.id := ATelInfoId;
    FTelList.AddData(ATelInfoId, p);
    Result := p;
  end;
end;

function TDevice.AddTelInfo: PTelInfo;
var
  i: integer;
  p: PTelInfo;
  ATelInfoId: integer;
begin
  ATelInfoId := FTelList.Count;

  i := FTelList.IndexOf(ATelInfoId);
  while i >= 0 do
  begin
    Inc(ATelInfoId);
    i := FTelList.IndexOf(ATelInfoId);
  end;
  New(p);
  p^.id := ATelInfoId;
  FTelList.AddData(ATelInfoId, p);
  Result := p;
end;

function TDevice.AddAdInfo(AdInfo: string): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i:=0 to FAdInfoList.Count-1 do
  begin
    if FAdInfoList.Strings[i] = AdInfo then
      Exit;
  end;
  FAdInfoList.Add(AdInfo);
  Result := True;
end;

function TDevice.DeleteAdInfo(AdInfo: string): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i:=0 to FAdInfoList.Count-1 do
  begin
    if FAdInfoList.Strings[i] = AdInfo then
    begin
      FAdInfoList.Delete(i);
    end;
  end;
  Result := True;
end;

function TDevice.AddEventInfo(AEventInfoId: integer): PEventInfo;
var
  i: integer;
  p: PEventInfo;
begin
  i := FEventList.IndexOf(AEventInfoId);
  if i >= 0 then
    Result := EventItems[i]
  else
  begin
    New(p);
    p^.id := AEventInfoId;
    FEventList.AddData(AEventInfoId, p);
    Result := p;
  end;
end;

function TDevice.AddInfoMenu(AInfoMenuId: integer): PInfoMenu;
var
  i: integer;
  p: PInfoMenu;
begin
  i := FInfoMenuList.IndexOf(AInfoMenuId);
  if i >= 0 then
    Result := InfoMenuItems[i]
  else
  begin
    New(p);
    p^.id := AInfoMenuId;
    FInfoMenuList.AddData(AInfoMenuId, p);
    Result := p;
  end;
end;

function TDevice.AddClassInfoMenu(AClassInfoMenuId: integer): PClassInfoMenu;
var
  i: integer;
  p: PClassInfoMenu;
begin
  i := FClassInfoMenuList.IndexOf(AClassInfoMenuId);
  if i >= 0 then
    Result := ClassInfoMenuItems[i]
  else
  begin
    New(p);
    p^.id := AClassInfoMenuId;
    FClassInfoMenuList.AddData(AClassInfoMenuId, p);
    Result := p;
  end;
end;

function TDevice.AddEventInfo: PEventInfo;
var
  i: integer;
  p: PEventInfo;
  AEventInfoId: integer;
begin
  AEventInfoId := FEventList.Count;

  i := FEventList.IndexOf(AEventInfoId);
  while i >= 0 do
  begin
    Inc(AEventInfoId);
    i := FEventList.IndexOf(AEventInfoId);
  end;
  New(p);
  p^.id := AEventInfoId;
  FEventList.AddData(AEventInfoId, p);
  Result := p;
end;

function TDevice.AddInfoMenu: PInfoMenu;
var
  i: integer;
  p: PInfoMenu;
  AInfoMenuId: integer;
begin
  AInfoMenuId := FInfoMenuList.Count;

  i := FInfoMenuList.IndexOf(AInfoMenuId);
  while i >= 0 do
  begin
    Inc(AInfoMenuId);
    i := FInfoMenuList.IndexOf(AInfoMenuId);
  end;
  New(p);
  p^.id := AInfoMenuId;
  FInfoMenuList.AddData(AInfoMenuId, p);
  Result := p;
end;

function TDevice.AddClassInfoMenu: PClassInfoMenu;
var
  i: integer;
  p: PClassInfoMenu;
  AClassInfoMenuId: integer;
begin
  AClassInfoMenuId := FClassInfoMenuList.Count;

  i := FClassInfoMenuList.IndexOf(AClassInfoMenuId);
  while i >= 0 do
  begin
    Inc(AClassInfoMenuId);
    i := FClassInfoMenuList.IndexOf(AClassInfoMenuId);
  end;
  New(p);
  p^.id := AClassInfoMenuId;
  FClassInfoMenuList.AddData(AClassInfoMenuId, p);
  Result := p;
end;

function TDevice.AddAnswerInfo(AAnswerInfoId: integer): PAnswerInfo;
var
  i: integer;
  p: PAnswerInfo;
begin
  i := FAnswerList.IndexOf(AAnswerInfoId);
  if i >= 0 then
    Result := AnswerItems[i]
  else
  begin
    New(p);
    p^.id := AAnswerInfoId;
    FAnswerList.AddData(AAnswerInfoId, p);
    Result := p;
  end;
end;

function TDevice.AddAnswerInfo: PAnswerInfo;
var
  i: integer;
  p: PAnswerInfo;
  AAnswerInfoId: integer;
begin
  AAnswerInfoId := FAnswerList.Count + 1;

  i := FAnswerList.IndexOf(AAnswerInfoId);
  while i >= 0 do
  begin
    Inc(AAnswerInfoId);
    i := FAnswerList.IndexOf(AAnswerInfoId);
  end;
  New(p);
  p^.id := AAnswerInfoId;
  FAnswerList.AddData(AAnswerInfoId, p);
  Result := p;
end;

function TDevice.GetTelItems(index: integer): PTelInfo;
begin
  Result := PTelInfo(FTelList.Datas[index]);
end;

function TDevice.GetEventItem(index: integer): PEventInfo;
begin
  Result := PEventInfo(FEventList.Datas[index]);
end;

function TDevice.GetInfoMenuItem(index: integer): PInfoMenu;
begin
  Result := PInfoMenu(FInfoMenuList.Datas[index]);
end;

function TDevice.GetClassInfoMenuItem(index: Integer): pClassInfoMenu;
begin
  Result := pClassInfoMenu(FClassInfoMenuList.Datas[index]);
end;

function TDevice.GetAnswerItem(index: integer): PAnswerInfo;
begin
  Result := PAnswerInfo(FAnswerList.Datas[index]);
end;

function TDevice.GetDisplayItems(index: integer): PDisplayMenu;
begin
  Result := PDisplayMenu(FDisplayMenuList.Datas[index]);
end;

procedure TDevice.DelTelInfo(ATelInfoId: integer);
var
  i: integer;
  p: PTelInfo;
begin
  i := FTelList.IndexOf(ATelInfoId);
  if i >= 0 then
  begin
    p := FTelList.Datas[i];
    FTelList.Delete(i);
    Dispose(p);
  end;
end;

procedure TDevice.DelEventInfo(AEventInfoId: integer);
var
  i: integer;
  p: PEventInfo;
begin
  i := FEventList.IndexOf(AEventInfoId);
  if i >= 0 then
  begin
    p := FEventList.Datas[i];
    FEventList.Delete(i);
    Dispose(p);
  end;
end;

procedure TDevice.DelInfoMenu(AInfoMenuId: integer);
var
  i: integer;
  p: PInfoMenu;
begin
  i := FInfoMenuList.IndexOf(AInfoMenuId);
  if i >= 0 then
  begin
    p := FInfoMenuList.Datas[i];
    FInfoMenuList.Delete(i);
    Dispose(p);
  end;
end;

procedure TDevice.DelClassInfoMenu(AClassInfoMenuId: integer);
var
  i: integer;
  p: pClassInfoMenu;
begin
  i := FClassInfoMenuList.IndexOf(AClassInfoMenuId);
  if i >= 0 then
  begin
    p := FClassInfoMenuList.Datas[i];
    FClassInfoMenuList.Delete(i);
    Dispose(p);
  end;
end;

procedure TDevice.DelAnswerInfo(AAnswerInfoId: integer);
var
  i: integer;
  p: PAnswerInfo;
begin
  i := FAnswerList.IndexOf(AAnswerInfoId);
  if i >= 0 then
  begin
    p := FAnswerList.Datas[i];
    FAnswerList.Delete(i);
    Dispose(p);
  end;
end;

procedure TDevice.ClrTelList;
begin
  while FTelList.Count > 0 do
    DelTelInfo(TelItems[0].id);
end;

procedure TDevice.ClrEventList;
begin
  while FEventList.Count > 0 do
    DelEventInfo(EventItems[0].id);
end;

procedure TDevice.ClrInfoMenuList;
begin
  while FInfoMenuList.Count > 0 do
    DelInfoMenu(InfoMenuItems[0].id);
end;

procedure TDevice.ClrClassInfoMenuList;
begin
  while FClassInfoMenuList.Count > 0 do
    DelClassInfoMenu(ClassInfoMenuItems[0].id);
end;

procedure TDevice.ClrAnswerList;
begin
  while FAnswerList.Count > 0 do
    DelAnswerInfo(AnswerItems[0].id);
end;

function TDevice.FindTelInfo(ATelInfoId: integer): PTelInfo;
var
  i: integer;
begin
  Result := nil;
  i := FTelList.IndexOf(ATelInfoId);
  if i >= 0 then
    Result := TelItems[i];
end;

function TDevice.FindEventInfo(AEventInfoId: integer): PEventInfo;
var
  i: integer;
begin
  Result := nil;
  i := FEventList.IndexOf(AEventInfoId);
  if i >= 0 then
    Result := EventItems[i];
end;

function TDevice.FindEventInfoByNo(EventNo: Byte): string;
var
  i: Integer;
begin
  for i:=0 to FEventList.count-1 do
  begin
    if EventNo = EventItems[i].No then
      Result := EventItems[i].Info;
  end;
end;

function TDevice.FindInfoMenu(AInfoMenuId: integer): PInfoMenu;
var
  i: integer;
begin
  Result := nil;
  i := FInfoMenuList.IndexOf(AInfoMenuId);
  if i >= 0 then
    Result := InfoMenuItems[i];
end;

function TDevice.FindInfoMenuByNo(MenuNo: Byte): string;
var
  i: Integer;
begin
  Result := '';
  for i:=0 to FInfoMenuList.count-1 do
  begin
    if MenuNo = InfoMenuItems[i].No then
    begin
      Result := InfoMenuItems[i].Info;
      break;
    end;
  end;
end;

function TDevice.FindClassInfoMenu(AClassInfoMenuId: integer): pClassInfoMenu;
var
  i: integer;
begin
  Result := nil;
  i := FClassInfoMenuList.IndexOf(AClassInfoMenuId);
  if i >= 0 then
    Result := ClassInfoMenuItems[i];
end;

function TDevice.FindClassInfoMenuByNo(MenuNo: Byte): string;
var
  i: Integer;
begin
  for i:=0 to FClassInfoMenuList.count-1 do
  begin
    if MenuNo = ClassInfoMenuItems[i].No then
      Result := ClassInfoMenuItems[i].Info;
  end;
end;

function TDevice.FindAnswerInfo(AAnswerInfoId: integer): PAnswerInfo;
var
  i: integer;
begin
  Result := nil;
  i := FAnswerList.IndexOf(AAnswerInfoId);
  if i >= 0 then
    Result := AnswerItems[i];
end;


function TDevice.FindTelInfoByNumber(ATelNumber: String): PTelInfo;
var
  i: integer;
begin
  Result := nil;
  for i:= 0 to FTelList.Count -1 do
  begin
    if  TelItems[i].No = ATelNumber then
    begin
      Result := TelItems[i];
      break;
    end;
  end;
end;


function TDevice.AddCancelOrderMenu(CancelOrderMenuID: integer): PCancelOrderMenu;
var
  i: integer;
  p: PCancelOrderMenu;
begin
  i := FCancelOrderMenuList.IndexOf(CancelOrderMenuID);
  if i >= 0 then
    Result := CancelOrderMenuItems[i]
  else
  begin
    New(p);
    p^.id := CancelOrderMenuID;
    FCancelOrderMenuList.AddData(CancelOrderMenuID, p);
    Result := p;
  end;
end;

function TDevice.AddDisplayMenu(ADisplayMenuId: integer): PDisplayMenu;
var
  i: integer;
  p: PDisplayMenu;
begin
  i := FDisplayMenuList.IndexOf(ADisplayMenuId);
  if i >= 0 then
    Result := DisPlayMenuItems[i]
  else
  begin
    New(p);
    p^.id := ADisplayMenuId;
    FDisplayMenuList.AddData(ADisplayMenuId, p);
    Result := p;
  end;
end;

procedure TDevice.ClearCancelOrderMenuList;
begin
  while FCancelOrderMenuList.Count > 0 do
    DelCancelOrderMenu(CancelOrderMenuItems[0].id);
end;

procedure TDevice.ClrDisplayMenuList;
begin
  while FDisplayMenuList.Count > 0 do
    DelDisplayMenu(DisPlayMenuItems[0].id);
end;


procedure TDevice.DelCancelOrderMenu(CancelOrderMenuID: integer);
var
  i: integer;
  p: PCancelOrderMenu;
begin
  i := FCancelOrderMenuList.IndexOf(CancelOrderMenuID);
  if i >= 0 then
  begin
    p := FCancelOrderMenuList.Datas[i];
    FCancelOrderMenuList.Delete(i);
    Dispose(p);
  end;
end;


procedure TDevice.DelDisplayMenu(ADisplayMenuId: integer);
var
  i: integer;
  p: PDisplayMenu;
begin
  i := FDisplayMenuList.IndexOf(ADisplayMenuId);
  if i >= 0 then
  begin
    p := FDisplayMenuList.Datas[i];
    FDisplayMenuList.Delete(i);
    Dispose(p);
  end;
end;



function TDevice.FindDisplayMenu(ADisplayMenuId: integer): PDisplayMenu;
var
  i: integer;
begin
  Result := nil;
  i := FDisplayMenuList.IndexOf(ADisplayMenuId);
  if i >= 0 then
    Result := DisPlayMenuItems[i];
end;

//procedure TDevice.SetDisPlayCoName(const Value: string);
//begin
//  FDisPlayCoName := Value;
//end;

function TDevice.GetCancelOrderMenuItems(index: integer): PCancelOrderMenu;
begin
  Result := PCancelOrderMenu(FCancelOrderMenuList.Datas[index]);
end;

function TDevice.FindCancelOrderMenu(
  CancelOrderMenuID: integer): TCancelOrderMenu;
var
  i: integer;
begin
  Result.id := -1;
  Result.Name := '';
  i := FCancelOrderMenuList.IndexOf(CancelOrderMenuID);
  if i >= 0 then
  begin
    Result.id := CancelOrderMenuItems[i].id;
    Result.Name := CancelOrderMenuItems[i].Name;
  end;
end;

{ TConnTypeManage }

(*function TConnTypeManage.AddNewConn(const AConnID: Integer): PConnType; {����µĽ��߷���}
var
  i: Integer;
  find: Boolean;
begin
  find := False;
  for i := 0 to Count - 1 do
  begin
    if FConns[i].Id = AConnID then
    begin
      Result := @FConns[i];
      find := True;
      Break;
    end;
  end;
  if not find then
  begin
    SetLength(FConns,Count+1);  // .. Count=length(FConns)
    Result := @FConns[Count-1];
  end;
end;

procedure TConnTypeManage.ClearConn;//������߷���
begin
  SetLength(FConns,0);
end;

constructor TConnTypeManage.Create;
begin
  clearConn;
end;

destructor TConnTypeManage.Destroy;
begin
  inherited;
end;

function TConnTypeManage.GetConnIndex(const AConnID: Integer): Integer;  //���ݽ��߷�����ID��ý��߷���������
var
  i: Integer;
begin
  Result := -1;
  for i := 0 to Count - 1 do
  begin
    if FConns[i].Id = AConnID then
    begin
      Result := i;
      Break;
    end;
  end;
end;

function TConnTypeManage.getConnType(const AConnID: Integer): TConnType;//���ݽ��߷���ID���һ�����߷�������
var
  i: Integer;
begin
  Result.Id := -1;
  Result.Desc := '';
  Result.name := '';
  for i := 0 to Count - 1 do
  begin
    if FConns[i].Id = AConnID then
    begin
      Result := FConns[i];
      Break;
    end;
  end;
end;

function TConnTypeManage.GetConnTypes(Index: Integer): TConnType;
begin
   Result := FConns[Index];
end;

function TConnTypeManage.GetCount: Integer;
begin
   Result := Length(FConns);
end;

function TConnTypeManage.GetPConnType(const AConnID: integer): PConnType;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
  begin
    if FConns[i].Id = AConnID then
    begin
      Result := @FConns[i];
      Break;
    end;
  end;
end;

procedure TConnTypeManage.SetConnTypes(Index: Integer;const Value: TConnType);
begin
   FConns[Index] := Value;
end;  *)

{ TSwitchManage }

(*function TSwitchManage.AddNewSwitch(ASwitchid: integer): PSwitch;
var
  i: Integer;
  find: Boolean;
begin
  Result := nil;
  find := False;
  for i := 0 to Count - 1 do
  begin
    if FSwitchAry[i].id = ASwitchid then
    begin
      Result := @FSwitchAry[i];
      find := True;
      Break;
    end;
  end;
  if not find then
  begin
    SetLength(FSwitchAry,Count+1);
    Result := @FSwitchAry[Count-1];
  end;
end;

procedure TSwitchManage.ClearSwitch;
begin
  SetLength(FSwitchAry,0);
end;

constructor TSwitchManage.Create;
begin
  ClearSwitch;
end;

destructor TSwitchManage.Destroy;
begin

  inherited;
end;

function TSwitchManage.Getcount: integer;
begin
  Result := Length(FSwitchAry);
end;

function TSwitchManage.GetPSwitch(const ASwitchid: integer): PSwitch;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
  begin
    if FSwitchAry[i].Id = ASwitchid then
    begin
      Result := @FSwitchAry[i];
      Break;
    end;
  end;
end;

function TSwitchManage.GetPSwitchByIndex(index: Integer): PSwitch;
begin
  Result := @FSwitchAry[Index];
end;

function TSwitchManage.getSwitch(const ASwitchid: Integer): TSwitch;
var
  i: Integer;
begin
  Result.Id := -1;
  Result.Order :=0;
  Result.resid:= 0;
  Result.ConnTypeID :=0;
  Result.name := '';
  for i := 0 to Count - 1 do
  begin
    if FSwitchAry[i].Id = ASwitchid then
    begin
      Result := FSwitchAry[i];
      Break;
    end;
  end;
end;

function TSwitchManage.GetSwitchIndex(const ASwitchID:integer): integer;
var
  i: Integer;
begin
  Result := -1;
  for i := 0 to Count - 1 do
  begin
    if FSwitchAry[i].id = ASwitchID then
    begin
      Result := i;
      Break;
    end;
  end;
end;

function TSwitchManage.GetSwitchs(index: integer): TSwitch;
begin
  Result := FSwitchAry[Index];
end;



procedure TSwitchManage.SetSwitchs(index: integer; const Value: TSwitch);
begin
   FSwitchAry[Index] := Value;
end;  *)

{ TDeviceManager }

function TDeviceManage.Add(const ATargetIDStr: string): TDevice; //���һ���µ��ƶ�Ŀ�굽��������
var
  i: integer;
  id: integer;
begin
//  id := StrToInt64(RightStr(ATargetIDStr, 10));
//  i := FList.IndexOf(id);
//  if i >= 0 then
//    Result := Items[i]
//  else
//  begin
//    Result := TDevice.Create;
//    Result.id := id;
//    Result.IdStr := ATargetIDStr;
//    FList.AddData(id, Result);
//  end;
  i:= FList.IndexOf(ATargetIDStr);
  if i>=0 then
    Result := Items[i]
  else
  begin
    Result := TDevice.Create;
    Result.Id := ATargetIDStr;
    Result.IdStr := ATargetIDStr;
    FList.AddObject(ATargetIDStr,Result);
  end;
end;

function TDeviceManage.Add(device: TDevice): TDevice;
var
  i: Integer;
begin
  i := FList.IndexOf(device.id);
  if i >= 0 then
  begin
    Result := Items[i];
  end
  else
  begin
    Result := TDevice.Create;
    with device do
    begin
      Result.id := id;
      Result.fact_id := fact_id;
      Result.IdStr := IdStr;
      Result.GroupID := GroupID;
      Result.Car := Car;
      FList.AddObject(id, Result);
    end;
  end;
end;

procedure TDeviceManage.AddCurrentDevOnTheMap(X, Y: integer; Dev: TDevice);
var
  XY: integer;
  i: integer;
begin
  XY := (X shl 16) + Y;
  i := FCurrentDevOnTheMap.IndexOf(XY);
  if i < 0 then
  begin
    FCurrentDevOnTheMap.AddData(XY, Dev);
  end
  else
  begin
    FCurrentDevOnTheMap.Datas[i] := Dev;
  end;
end;

procedure TDeviceManage.AddToAutoTrack(const ATargetID: integer); // ��ӵ��Զ������б���
//var
 // m: TDevice;
begin {
  while FAutoTrackList.Count > 0 do
  begin
    TDevice(FAutoTrackList.Datas[0]).FAutoTrack := False;
    FAutoTrackList.Delete(0);
  end;
  m := ADeviceManage.Find(ATargetID);
  if m <> nil then
  begin
    FAutoTrackList.AddData(m.Id,m);
    m.FAutoTrack := True;
  end; }
end;

procedure TDeviceManage.AddToUserSelectList(const AID: string);
var
  m: TDevice;
begin
  m := ADeviceManage.find(AID);
  if m <> nil then
    FUserSelectList.AddObject(AID, m);
end;

procedure TDeviceManage.CarNOAndDevName; //���ƺź��豸���ƺ���һ��....
var
  i: integer;
begin
  for i := 0 to self.Count - 1 do
  begin
    if self.Items[i].FDispLabel <> '' then
      self.Items[i].FCar.No := self.Items[i].FCar.No + '(' + self.Items[i].FDispLabel + ')';
  end;
end;

procedure TDeviceManage.ClearCurrentDevOnTheMap;
begin
  FCurrentDevOnTheMap.Clear;
end;

procedure TDeviceManage.ClearDevice;
Var
  dev: TDevice;
begin
  while FList.Count > 0 do //for i:= 0 to Count -1 do
  begin
    //Delete(Items[0].FId);
    dev := TDevice(FList.Objects[0]);
    dev.Free;
    FList.Delete(0);
  end;
end;

procedure TDeviceManage.ClearUserSelectList;
begin
  FUserSelectList.Clear;
end;

constructor TDeviceManage.Create;
begin
  FList := THashedStringList.Create;//TStringList.Create;
  FList.Sorted := True;
  FList.Duplicates := dupIgnore;
  FStat := TBits.Create;
  FStat.Size := 32;
  FAutoTrackList := TStringList.Create;
  FAutoTrackList.Sorted := True;
  FUserSelectList := TStringList.Create;
  FUserSelectList.Sorted := True;
  FCurrentDevOnTheMap := TIntegerList.Create;
  FCurrentDevOnTheMap.Sorted := True;
  FShengLayer := nil;
  FXianLayer := nil;
  FShiLayer := nil;
//  FProj := TProjection.Create;
//  FProj.ProjectionType := 1;
end;

procedure TDeviceManage.CreateDriverNameTel;
var
  i, ii, len: integer;
  Dev: TDevice;
  str: string;
  estr: string;
  driver: TDriver;
begin
  for i := 0 to Self.Count - 1 do
  begin
    Dev := Items[i];
    Dev.DriverNameTel := '';
    for ii := 0 to ADriverManage.Count - 1 do
    begin
      driver := ADriverManage.Drivers[ii];
      if Dev.Car.id = driver.CarID then
      begin
        if driver.isMain then
        begin
          Dev.DriverName := driver.Name;
          Dev.DriverTel := driver.TEL;
          Dev.DriverServeNum := driver.DriverServeNum;
        end
        else
        begin
          Dev.DriverName2 := driver.Name;
          Dev.DriverTel2 := driver.TEL;
          Dev.DriverServeNum2 := driver.DriverServeNum;
        end;
        if driver.TEL <> '' then
          str := driver.Name + ':' + driver.TEL
        else
          str := driver.Name;
        Dev.DriverNameTel := Dev.DriverNameTel + str;
      end;
    end;
  end; 
end;

procedure TDeviceManage.Delete(const ATargetID: string); //ɾ��һ��Ŀ��
var
  i: integer;
  dev: TDevice;
begin
  i := FList.IndexOf(ATargetID);
  if i >= 0 then
  begin
    dev := Items[i];//Remove(i);
    dev.Free;
    FList.Delete(i);
  end;
end;

destructor TDeviceManage.Destroy;
begin
  FStat.Free;
  ClearDevice;
  FList.Free;
  FAutoTrackList.Clear;
  FAutoTrackList.Free;
  ClearUserSelectList;
  FUserSelectList.Free;
  ClearCurrentDevOnTheMap;
  FCurrentDevOnTheMap.Free;
//  FProj.Free;
  inherited;
end;

//function TDeviceManage.find(const ATargetID: integer): TDevice;
//var
//  i: integer;
//begin
//  Result := nil;
//  i := FList.IndexOf(ATargetID);
//  if i >= 0 then
//    Result := Items[i];
//end;

function TDeviceManage.find(const ATargetIDStr: string): TDevice;
var
  i: integer;
begin
//  id := StrToInt64(RightStr(ATargetIDStr, 10));
//  Result := find(id);
  if ATargetIDStr ='' then
  begin
    Result := nil;
    exit;
  end;
  i := FList.IndexOf(ATargetIDStr);
  if i>=0 then
    Result := Items[i]
  else
    Result := nil;
end;

// �ɳ��ƺ� �� ���豸��ID

function TDeviceManage.FindDevFromCarNo(const ANo: string): TDevice;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
    if Items[i].FCar.No = ANo then
    begin
      Result := Items[i];
      break;
    end;
end;

function TDeviceManage.FindDevFromSimno(const ASimno: string): TDevice;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
    if Items[i].SimNo = ASimno then
    begin
      Result := Items[i];
      break;
    end;
end;

function TDeviceManage.FindDevFromDisp(const ADis: string): TDevice;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
    if Items[i].DispLabel = ADis then
    begin
      Result := Items[i];
      break;
    end;
end;


function TDeviceManage.FindDevOnTheMap(XY: integer;
  var FindedXY: integer): TDevice;
var
  i: integer;
begin
  Result := nil;
  i := GetCurrentDevOnTheMapIndex(XY);
  if (i < 0) or (i >= FCurrentDevOnTheMap.Count) then Exit;
  FindedXY := FCurrentDevOnTheMap.Integers[i];
  Result := GetCurrentOnTheMapDev(i);
end;

function TDeviceManage.FindFromMetaIndex(const AMetaIndex: integer): string;
var
  i: integer;
  m: TDevice;
begin
  Result := '';
  for i := 0 to Count - 1 do
  begin
    m := Items[i];
    if m.MetaIndex = AMetaIndex then
    begin
      if not m.State[STAT_DEVICE_CONNECTED] then continue; //���Ӵ˾䣬��error����j=0ʱ������õ���û�����ĳ�Items[0]��MetaIndex=0��
      Result := m.id;
      break;
    end;
  end;
end;

procedure TDeviceManage.FindMapName(m: TDevice; p: TWorldPoint);
begin

    //ʡ����
    //------------------------------------------------------------------------------
  if FShengLayer = nil then Exit;
  if m.ShengMetaIndex < 0 then
    m.ShengName := self.ShengLayer.PointInMetaName(m.ShengMetaIndex, p)
  else
  begin
    m.ShengName := self.ShengLayer.PointInMetaName(p, m.ShengMetaIndex);
    if m.ShengName = NotFindStr then
    begin
      m.ShengName := self.ShengLayer.PointInMetaName(m.ShengMetaIndex, p)
    end;
  end;
   //�в���----------------------------------------------------------------------
   //------------------------------------------------------------------------------
//  if FShiLayer<>nil then
  if m.ShiMetaIndex < 0 then
    m.ShiName := self.ShiLayer.PointInMetaName(m.ShiMetaIndex, p)
  else
  begin
    m.ShiName := self.ShiLayer.PointInMetaName(p, m.ShiMetaIndex);
    if m.ShiName = NotFindStr then
    begin
      m.ShiName := self.ShiLayer.PointInMetaName(m.ShiMetaIndex, p)
    end;
  end;
   //�ز���-----------------------------------------------------------------------
   //------------------------------------------------------------------------------
//  if FXianLayer<>nil then
  if m.XianMetaIndex < 0 then
    m.XianName := self.XianLayer.PointInMetaName(m.XianMetaIndex, p)
  else
  begin
    m.XianName := self.XianLayer.PointInMetaName(p, m.XianMetaIndex);
    if m.XianName = NotFindStr then
    begin
      m.XianName := self.XianLayer.PointInMetaName(m.XianMetaIndex, p)
    end;
  end;
   //------------------------------------------------------------------------------
end;

function TDeviceManage.FindToCarNO(const DevId: string): string;
var
  Dev: TDevice;
begin
  Dev := find(DevId);
  if Dev = nil then
    Result := ''
  else
    Result := Dev.Car.No;
end;

function TDeviceManage.Getcount: integer;
begin
  Result := FList.Count;
end;

function TDeviceManage.GetCurrentDevOnTheMapIndex(XY: integer): integer;
begin
  FCurrentDevOnTheMap.find(XY, Result);
end;

function TDeviceManage.GetCurrentOnTheMapDev(index: integer): TDevice;
begin
  Result := TDevice(FCurrentDevOnTheMap.Datas[index]);
end;

function TDeviceManage.GetItems(index: integer): TDevice;
begin
//  Result := TDevice(FList.Datas[index]);
  Result := TDevice(FList.Objects[index]);
end;

function TDeviceManage.GetItemsFromMetaIndex(index: integer): TDevice;
begin
  Result := TDevice(FUserSelectList.Objects[index]);
end;

procedure TDeviceManage.JudgeDevOutOrInCArea(Adev: TDevice);
var
  confArea: TConfineArea;
  p: TWorldPoint;
  pp: TEarthPoint;
  i: integer;
  time: double;
//  Dist:integer;
begin
  if not Adev.Switch[STAT_GPS_LOCATE] then
  begin
    exit;
  end;
    //if Adev.OutCAreaId <> -1 then //Խ�籨�����ж�  //2006-12-26 by dxf Ϊ��һ�������ж����ͬ��
  if Adev.AreaList.Count <= 0 then exit;

  p := ADev.Point; //Project.LoLa2XY(EarthPoint(Adev.Longitude, Adev.Latitude));
    //confArea := GAreaManage.find(Adev.OutCAreaId); //2006-12-26 by dxf
  for i := 0 to Adev.AreaList.Count - 1 do
  begin
    confArea := TConfineArea(Adev.AreaList.Items[i]);
    //�ж��Ƿ�����Чʱ��֮����.
    if confArea.IsEnabledTime then
    begin
      time := Adev.GpsTime - trunc(Adev.GpsTime);
      //��ʼ��ʱ���ڽ���ʱ��.
      if confArea.BeginTime > confArea.EndTime then
      begin
        if not ((time > confArea.BeginTime) or (time < confArea.EndTime)) then
          continue;
      end
      else
      begin
        if not ((time > confArea.BeginTime) and (time < confArea.EndTime)) then
          continue;
      end;
    end;

    case confArea.AreaType of
      ALARM_OUT: //Խ�籨�����ж�
        begin
          if not GeometryCalc.PointInPolygon(p, confArea.WorldPointAry, 0, confArea.PointCount) then
          begin
            if not Adev.AreaList.ItemsIsOutAllow[i] then //û��Խ�� ���� ��
            begin
              Adev.AreaList.ItemsIsOutAllow[i] := True;
              Adev.AlarmStart_OutCArea := Adev.GpsTime; // now;   by dxf Ϊ���ڹ켣�طŵ�ʱ��Ҳ����ʵ�����򱨾�
              Adev.AlarmEnd_OutCArea := Adev.GpsTime;   // now;   by dxf Ϊ���ڹ켣�طŵ�ʱ��Ҳ����ʵ�����򱨾�
                      //Adev.OutCAreaId:=confArea.ID;
              if Assigned(FOnDevAlarm_OutorInCArea) then
                FOnDevAlarm_OutorInCArea(Adev, ALARM_OUT, True, confArea); //Խ��
            end
            else
              Adev.AlarmEnd_OutCArea := Adev.GpsTime;   // now;08-02-21  by dxf Ϊ���ڹ켣�طŵ�ʱ��Ҳ����ʵ�����򱨾�
            if (ADev.Alarm_OutCAreaIsShowPop) and (confArea.IsShowPop) then
              PopMsg('Խ�籨��', Adev.Car.No + #13 + #10 + 'ʻ��' + confArea.Name);
          end
          else
          begin
            if Adev.AreaList.ItemsIsOutAllow[i] then
            begin
              Adev.AreaList.ItemsIsOutAllow[i] := false;

              if Assigned(FOnDevAlarm_OutorInCArea) then
                FOnDevAlarm_OutorInCArea(Adev, ALARM_OUT, false, confArea); //��Խ�絽��硣���б���ԭ�е�������ʷ
            end;
          end;
        end;
      ALARM_IN: //ʻ�뱨�� �ж�
        begin
          if GeometryCalc.PointInPolygon(p, confArea.WorldPointAry, 0, confArea.PointCount) then
          begin
            if not Adev.AreaList.ItemsIsOutAllow[i] then //û��ʻ�� ���� ��
            begin
              Adev.AreaList.ItemsIsOutAllow[i] := True;
              Adev.AlarmStart_InCArea := Adev.GpsTime; // now;08-02-21  by dxf Ϊ���ڹ켣�طŵ�ʱ��Ҳ����ʵ�����򱨾�
              Adev.AlarmEnd_InCArea := Adev.GpsTime;   // now;08-02-21  by dxf Ϊ���ڹ켣�طŵ�ʱ��Ҳ����ʵ�����򱨾�
                      //ADev.InCAreaId:=confArea.ID;
              if Assigned(FOnDevAlarm_OutorInCArea) then
                FOnDevAlarm_OutorInCArea(Adev, ALARM_IN, True, confArea); //ʻ�뱨��
            end
            else
              Adev.AlarmEnd_InCArea := Adev.GpsTime; // now;08-02-21  by dxf Ϊ���ڹ켣�طŵ�ʱ��Ҳ����ʵ�����򱨾�
            if (confArea.IsShowPop) then
              PopMsg('ʻ�뱨��', Adev.Car.No + #13 + #10 + 'ʻ��' + confArea.Name);
          end
          else
          begin
            if Adev.AreaList.ItemsIsOutAllow[i] then
            begin
              Adev.AreaList.ItemsIsOutAllow[i] := false;
              if Assigned(FOnDevAlarm_OutorInCArea) then
                FOnDevAlarm_OutorInCArea(Adev, ALARM_IN, false, confArea); //��Խ�絽��硣���б���ԭ�е�������ʷ
            end;
          end;
        end;
      ALARM_OVER_SPEET:
        begin
          if Adev.Switch_Warning[MSG_Warning_16] then continue; //�統ǰ�г���,�Ͳ��ж��Ƿ�������
          if GeometryCalc.PointInPolygon(p, confArea.WorldPointAry, 0, confArea.PointCount) then //�жϴ˳���λ���Ƿ��ڴ�������
          begin
            if {Adev.Speed //LS}StringToFloat(FormatFloat('##0.0', ADev.Speed/10)) > confArea.OverSpeet then
            begin
              Adev.Switch_Warning[MSG_Warning_16] := True; //���ó��ٱ���
            end;
          end;
        end;
      ALARM_WAY_OUT:
        begin
          if not confArea.RunWayRectList.PointInRectList(p) then
          begin
            if not Adev.AreaList.ItemsIsOutAllow[i] then //û��Խ�� ���� ��
            begin
                      {if ADev.FFirstOutPoint.X=0 then
                      begin
                          ADev.FFirstOutPoint:=p;
                      end
                      else
                      begin
                          pp:=Project.XY2LoLa(ADev.FFirstOutPoint);
                          if GisMeasure.GetGisDistance(pp,EarthPoint(Adev.Longitude, Adev.Latitude))>100 then
                          //if  GeometryCalc.Gis_P2P_Dist(Adev.Longitude,Adev.Latitude,pp.x,pp.y)>1 then
                          begin     }
              Adev.AreaList.ItemsIsOutAllow[i] := True;
              Adev.AlarmStart_OutCArea := now;
              Adev.AlarmEnd_OutCArea := now;
                              //Adev.OutCAreaId:=confArea.ID;
              if Assigned(FOnDevAlarm_OutorInCArea) then
                FOnDevAlarm_OutorInCArea(Adev, ALARM_WAY_OUT, True, confArea); //Խ��
                         // end;
                     // end;
            end
            else
            begin
              Adev.AlarmEnd_OutCArea := now;
            end;
            if (confArea.IsShowPop) then
                PopMsg('ʻ����·����', Adev.Car.No + #13 + #10 + 'ʻ��' + confArea.Name);
          end
          else
          begin
            if Adev.AreaList.ItemsIsOutAllow[i] then
            begin
              ADev.FFirstOutPoint.X := 0;
              Adev.AreaList.ItemsIsOutAllow[i] := false;
              if Assigned(FOnDevAlarm_OutorInCArea) then
                FOnDevAlarm_OutorInCArea(Adev, ALARM_WAY_OUT, false, confArea); //��Խ�絽��硣���б���ԭ�е�������ʷ
            end;
          end;
        end;
      ALARM_WAY_IN:
        begin
          if confArea.RunWayRectList.PointInRectList(p) then
          begin
            if not Adev.AreaList.ItemsIsOutAllow[i] then //û��ʻ�� ���� ��
            begin
              Adev.AreaList.ItemsIsOutAllow[i] := True;
              if ADev.FFirstInPoint.X = 0 then
              begin
                ADev.FFirstInPoint := p;
                Adev.AlarmStart_InCArea := now;
              end
              else
              begin
                pp := Project.XY2LoLa(ADev.FFirstInPoint);
                if (GisMeasure.GetGisDistance(pp, EarthPoint(Adev.Longitude, Adev.Latitude)) > 150) or
                  (SecondsBetween(Adev.AlarmStart_InCArea, now) > 15) then
                begin
                  Adev.Alarm_WayInCArea := True;
                  Adev.AlarmStart_InCArea := now;
                  Adev.AlarmEnd_InCArea := now;
                  if Assigned(FOnDevAlarm_OutorInCArea) then
                    FOnDevAlarm_OutorInCArea(Adev, ALARM_WAY_IN, True, confArea); //ʻ�뱨��
                end
              end
            end
            else
              Adev.AlarmEnd_InCArea := now;
              if (confArea.IsShowPop) then
                PopMsg('ʻ����·����', Adev.Car.No + #13 + #10 + 'ʻ��' + confArea.Name);
          end
          else
          begin
            if Adev.AreaList.ItemsIsOutAllow[i] then
            begin
              Adev.AreaList.ItemsIsOutAllow[i] := false;
              ADev.FFirstInPoint.X := 0;
              if Assigned(FOnDevAlarm_OutorInCArea) then
                FOnDevAlarm_OutorInCArea(Adev, ALARM_WAY_IN, false, confArea); //��Խ�絽��硣���б���ԭ�е�������ʷ
            end;
          end;
        end;
    end; //case end
  end;
end;

procedure TDeviceManage.JudgeAssembleWarring(Adev: TDevice);
var
  i,j,k: Integer;
  p: TWorldPoint;
  confArea: TConfineArea;
  LogA: TSystemLog; //
  Dev: TDevice;
  Str: string;
  index: Integer;
begin
  try
    for i:=0 to GAreaManage.Count-1 do
    begin
      confArea := GAreaManage.Items[i];
      if confArea.AreaType = ASSEMBLE_WARRING{5} then
      begin
        p := ADev.Point;
        if GeometryCalc.PointInPolygon(p, confArea.WorldPointAry, 0, confArea.PointCount) then
        begin
          //if confArea.DevList.Count < confArea.OverSpeet then
          //begin
            if confArea.DevList.Count = 0 then
              confArea.DevList.Add(Adev.id)
            else
            begin
              if confArea.DevList.IndexOf(Adev.id) < 0 then
                confArea.DevList.Add(Adev.id);
              {for j:=0 to confArea.DevList.Count -1 do
              begin

                if ADeviceManage.Find(confArea.DevList[j]).id <> Adev.id then
                begin
                  confArea.DevList.Add(Adev.id);
                end;
              end;  }
            end;
          //end;
          if confArea.DevList.Count > confArea.OverSpeet then
          begin
            if not confArea.IsOutAllow then
            begin
              //SetCurrentDir(ExePath);
              //str := ExpandFileName(GlobalParam.MenuSound);
              //if FileExists(str) then
                MediaPalySound(GlobalParam.MenuSound);
              confArea.IsOutAllow := True;

              if Assigned(FOnDevAlarm_OutorInCArea) then
                FOnDevAlarm_OutorInCArea(Adev, ASSEMBLE_WARRING, True, confArea); //�ۼ�����

            if confArea.IsShowPop then
              PopMsg('�ۼ�����', confArea.Name + '����������Ϊ' + IntToStr(confArea.DevList.Count) + '��' + #13#10 +'�����޶�����' + IntToStr(confArea.OverSpeet) + '��');
            end;

  //          LogA := TSystemLog.Create;
  //          try
  //            LogA.LogFile := ExePath + 'Alarm\�ۼ�����';
  //            LogA.ExtendName := 'csv';
  //            LogA.BufferSize := 0;
  //            LogA.BeginString:='ʱ��,���ƺ�,GPSʱ��,����,γ��,�ٶ�';
  //            for k := 0 to confArea.DevList.Count - 1 do
  //            begin
  //              Dev := ADeviceManage.Find(confArea.DevList[k]);
  //              LogA.AddLog(FormatDatetime('yyyy-mm-dd hh:nn:ss',now)+','+
  //                        Dev.Car.No+','+
  //                        FormatDateTime('yyyy-mm-dd hh:nn:ss',Dev.GpsTime)+','+
  //                        FormatFloat('0.000000',Dev.Longitude)+ ','+
  //                        FormatFloat('0.000000',Dev.Latitude)+','+
  //                        FormatFloat('##0.0', Dev.Speed/10)); {FormatFloat('0.0',Dev.Speed)); //ls}
  //            end;
  //          finally
  //            LogA.Free
  //          end;
          end
          else
          begin
            if confArea.IsOutAllow then
              confArea.IsOutAllow := False;
            {if confArea.DevList.Count = 0 then
            begin
              if Assigned(FOnDevAlarm_OutorInCArea) then
                FOnDevAlarm_OutorInCArea(Adev, ASSEMBLE_WARRING, False, confArea); //�ۼ�����
            end;   }
          end;
        end
        else
        begin
          index := confArea.DevList.IndexOf(Adev.id);
          if index >= 0 then
            confArea.DevList.Delete(index);

          {for j:= 0 to confArea.DevList.Count -1 do
          begin
            if ADeviceManage.Find(confArea.DevList[j]).id = Adev.id then
              confArea.DevList.Delete(j);
          end;                           }
        end;
      end;
    end;
  except
  end;
end;

function TDeviceManage.LaodCancelMenu: Boolean;
var
  i: integer;
begin
  bs.QueryCancelMenu;
  for i := 0 to self.Count - 1 do
  begin
    bs.QueryCancelMenuByDev(self.Items[i]);
  end;
end;


{procedure TDeviceManage.OverSpeetOfArea(Adev: TDevice);
var
  i, v: integer;
  Area: TConfineArea;
  p: TWorldPoint;
begin
  p := Project.LoLa2XY(EarthPoint(Adev.Longitude, Adev.Latitude));
  for i := 0 to GAreaManage.Count - 1 do
  begin
    Area := GAreaManage.Items[i];
    if Area.AreaType <> ALARM_OVERSPEET then continue;
    if not Area.DevList.find(Adev.id, v) then continue; //���ҵ�ǰ���Ƿ��ڴ�������������
    if not GeometryCalc.PointInRect(p, Area.OutBox) then continue; //�ж��ڲ������������
    if GeometryCalc.PointInPolygon(p, Area.WorldPointAry, 0, Area.PointCount) then //�жϴ˳���λ���Ƿ��ڴ�������
    begin
      if Adev.Speed > Area.OverSpeet then
      begin
        Adev.Switch[17] := True; //���ó��ٱ���
      end;
      Exit; //ֻ�ж���һ������,Ҳ���ǲ��ж��ظ�����
    end;
  end;
end;       }

procedure TDeviceManage.DealLogin_In(dev_id: string; driver_no: string; dateTime: TDateTime);
var
  m: TDevice;
  i: Integer;
begin
  m := find(dev_id);
  if m = nil then //new object
  begin
    Exit; 
  end;

 { if (not m.NotFirstLog) and ((now-dateTime) <10) then
  begin
    m.LogInOut := True;
    m.NotFirstLog := True;
    m.LastLogin_DateTime := dateTime;
    m.Login_Driver := driver_no;
    for i := 0 to ADriverManage.Count - 1 do
    begin
      if  Trim(ADriverManage.Drivers[i].DriverNO) = Trim(driver_no)  then
      begin
        //m.Login_Driver := ADriverManage.Drivers[i].Name;
        m.Login_DriverName := ADriverManage.Drivers[i].Name;
        Break;
      end;
    end;
    Exit;
  end;   }

 // if (not m.LogInOut) and  (m.LastLogout_DateTime < dateTime) then
 // begin
    m.LogInOut := True;
    m.LastLogin_DateTime := dateTime;
    m.Login_Driver := driver_no;
   { m.Login_Driver := 'δ��¼';  }
    for i := 0 to ADriverManage.Count - 1 do
    begin
      if  Trim(ADriverManage.Drivers[i].DriverNO) = Trim(driver_no)  then
      begin
        //m.Login_Driver := ADriverManage.Drivers[i].Name;
        m.Login_DriverName := ADriverManage.Drivers[i].Name;
        Break;
      end;
    end;
 // end;
end;

procedure TDeviceManage.Deallogin_Out(dev_id: string; driver_no: string; dateTime: TDateTime);
var
  m: TDevice;
  i: Integer;
begin
  m := find(dev_id);
  if m = nil then //new object
  begin
    Exit;
  end;

  {if (not m.NotFirstLog) and ((now-dateTime) <10) then
  begin
    m.Login_Driver := '˾��ǩ��';
    m.NotFirstLog := True;
    m.LastLogout_DateTime := dateTime;
    m.LogInOut := False;
    Exit;
  end;}

 // if (m.LogInOut) and (m.LastLogin_DateTime < dateTime) then
 // begin
    m.Login_Driver := '˾��ǩ��';
    m.LastLogout_DateTime := dateTime;
    m.LogInOut := False;
 // end;
  {for i := 0 to ADriverManage.Count - 1 do
  begin
    if  Trim(ADriverManage.Drivers[i].DriverNO) = Trim(driver_no)  then
    begin
      //m.Login_Driver := ADriverManage.Drivers[i].Name;
      m.Login_Driver := 'δ��¼';
      Break;
    end;
  end;  }

end;
procedure TDeviceManage.ReceiveGpsData(PGpsData: PGpsData_V2;IsLastGpsData:Boolean= False);
var
  i: integer;
  m: TDevice;
  p: TWorldPoint;
  RvHandle: integer;
  isGpsLocate: Boolean;
  TempLongWord: longWord;
  log, LogA: TSystemLog; //
begin
//  m := find(PGpsData^.id);
//  { TODO -oɳ : sha test gpslog }
//  {log := TSystemLog.Create;
//  try
//    log.LogFile := ExePath + 'GpsLog\'+m.Car.No;
//    log.ExtendName := 'csv';
//    log.BufferSize := 0;
//    log.AddLog(m.Car.No+'['+ BuffToHex(PGpsData,PGpsData^.Size));
//  finally
//    log.Free;
//  end;}
//  if m = nil then //new object
//  begin
//    Exit; //sha 2005-5-18  ��ĳ����ɾ���ˣ����û�ˢ��ʱ�����ػ�δ��1����ˢ������ʱ������ͻ��˷��͸ó���������
//  end;
//
//  if (PGpsData^.Long < 0) or (PGpsData^.Long >= 180) then
//  begin
//    PGpsData^.Long := 0;
//    Exit;
//  end;
//
//  if (PGpsData^.Lat < 0) or (PGpsData^.Lat >= 180) then
//  begin
//    PGpsData^.Lat := 0;
//    Exit;
//  end;
////----------------------------------------------------
//  {if m.First then
//  begin
//      SystemLog.WriteLog(ExePath+'GpsDataLog\'+m.Car.No+FormatDateTime('_yy',now)+'.txt',
//                         FormatFloat('0.000000',PGpsData^.Long)+','+
//                         FormatFloat('0.000000',PGpsData^.Lat)+','+
//                         FormatDatetime('yyyy-mm-dd hh:nn:ss',PGpsData^.GpsTime)+','+
//                         IntToStr(PGpsData^.Speed)+','+
//                         IntToHex(PGpsData^.State,8)+#13+#10);
//  end;   }
////-----------------------------------------------------
//  TempLongWord := PGpsData.State; //ȡ״̬
//  for i := 0 to 31 do
//  begin
//    m.Switch[i] := (TempLongWord and $1) = $1;
//    TempLongWord := TempLongWord shr 1;
//  end;
//
//  m.Switch[32] := True;
//  isGpsLocate := m.Switch[STAT_GPS_LOCATE];
//
//  p := Project.LoLa2XY(EarthPoint(PGpsData^.Long, PGpsData^.Lat));
//  m.TraceList.AddPoint(p);
//  FindMapName(m, p);
//
//  //--��һ��������ʱ�������Ƿ�λ�������¾�γ�ȡ�ʱ�� ��
//  //--�ǵ�һ��������ʱ�����������λ���Ÿ����� ��γ�ȡ�ʱ�� �ȡ�����λʱ�����ʱ��׼ȷ���͸���ʱ��
//  if not m.First then //��һ��������
//  begin
//    m.First := True;
//    for i := 24 to 31 do
//    begin
//      m.State[i] := True;
//      stat[i] := True;
//    end;
//    m.Longitude := PGpsData^.Long;
//    m.Latitude := PGpsData^.Lat;
//    m.Speed := PGpsData^.Speed;
//    m.Orientation := PGpsData^.Orientation;
//    m.Point := p;
//
//    if isGpsLocate then
//    begin
//      m.GpsTime := PGpsData^.GpsTime;
//    end
//    else
//    begin
//      if yearof(PGpsData^.GpsTime) = 2000 then
//        m.GpsTime := 0
//      else
//        m.GpsTime := PGpsData^.GpsTime;
//    end;
//  end
//  else
//  begin
//    if isGpsLocate then //--------���������λ���Ÿ����� ��γ�ȡ�ʱ�� ��
//    begin
//      m.Longitude := PGpsData^.Long;
//      m.Latitude := PGpsData^.Lat;
//      m.Speed := PGpsData^.Speed;
//      m.Orientation := PGpsData^.Orientation;
//      m.GpsTime := PGpsData^.GpsTime;
//      m.Point := p;
//                //popmsg(m.Car.No, FMap.Layers.Layer[FMap.Layers.Count-1].PointInMetaName(p)+'->'+FMap.Layers.Layer[FMap.Layers.Count-2].PointInMetaName(p)+'->'+FMap.Layers.Layer[FMap.Layers.Count-3].PointInMetaName(p));
//    end
//    else          //--����λʱ�����ʱ��׼ȷ���͸���ʱ��
//    begin
//      if yearof(PGpsData^.GpsTime) <> 2000 then
//        m.GpsTime := PGpsData^.GpsTime;
//    end;
//  end;
//  if not IsLastGpsData then
//    m.LastConnectTime := now      //������� ȡ�� ���һ�㶨λ����
//  else
//    m.LastConnectTime := m.GpsTime;
//  //------------------------------------------------------------------------------
//  if (m.Switch[GPSALARM_EMERGENCY]) then //���� �ж� ������������Ҫ���Ļ��룩
//  begin
//    if (not m.Alarm) then //��ͷ�ĵ�0λ=true,��ԭδ������ԭ�����ѽ��
//    begin
//      if IsLastGpsData then  //��������������ת���� ���һ�㶨λ����
//        m.alarm_startTime := m.GpsTime
//      else
//        m.alarm_startTime := now;
//      m.Alarm_endTime := 0;
//      m.AlarmCount := m.AlarmCount + 1;
//      m.Alarm := True; //�� ������־
//      m.AlarmCount := 1; //Ŀ�����ӱ�����������һ��
//      //RvHandle := FindWindow(MY_APP_NAME, nil); //����Ϣ --�г�������
//      //if RvHandle > 0 then PostMessage(RvHandle, CM_DEVALARM, m.id, 0);
//      if Assigned(FOnDevEmergncyAlarmEvent) then
//        FOnDevEmergncyAlarmEvent(m);
//    end
//    else
//    begin
//      m.AlarmCount := m.AlarmCount + 1; //Ŀ�����ӱ������� +1
//      //RvHandle := FindWindow(MY_APP_NAME, nil); //����Ϣ --�г�������
//      //if RvHandle > 0 then PostMessage(RvHandle, CM_DEVALARM, m.id, 0);
//      if Assigned(FOnDevEmergncyAlarmEvent) then
//        FOnDevEmergncyAlarmEvent(m);
//    end;
//    if GlobalParam.isalarmHurry then
//    begin
//      popmsg('������ʾ', m.Car.No + #13 + #10 + '��������!'); //08  6�� ����     //
//    end;
//    LogA := TSystemLog.Create;
//    try
//      LogA.LogFile := ExePath + 'Alarm\DriverAlarm';
//      LogA.ExtendName := 'csv';
//      LogA.BufferSize := 0;
//      LogA.AddLog(FormatDatetime('yyyy-mm-dd hh:nn:ss', now) + ',' +
//        m.Car.No + ',��������:' + IntToStr(m.AlarmCount) +
//        ',����:' + FormatFloat('##0.000000', m.Longitude) +
//        ',γ��:' + FormatFloat('##0.000000', m.Latitude));
//    finally
//      LogA.Free
//    end;
//  end;
//  //------------------------------------------------------------------------------
//   //���ڲ����������жϣ�ȥ������ĳ��� sha 20090226--��Ŀǰ�����������ڳ���(�����ٶȿ���С�ڲ����е��ٶ�)Ҳ����17λ
//  {if m.Switch[17] then
//  begin
//    try
//      if m.Param.Overspeed <> '' then
//        if m.Speed <= StrToInt(m.Param.Overspeed) then m.Switch[17] := false;
//    except
//    end;
//  end;        }
//
//  JudgeDevOutOrInCArea(m); //�Ƿ�Խ���ʻ�뱨�������ж�
// //OverSpeetOfArea(m); //�Ƿ���ĳ�����ﳬ��      �ж�
//
//  if Assigned(FOnDevOtherAlarmEvent) then  //������������� ���౨�� ����
//  begin
//    if m.Switch[GPSALARM_DEVOVERSPEED] then  //��17λ	���ٱ���
//      FOnDevOtherAlarmEvent(m,GPSALARM_DEVOVERSPEED);
//    if m.Switch[GPSALARM_DEVCUTPOWER] then   //��18λ	�ϵ籨��
//      FOnDevOtherAlarmEvent(m,GPSALARM_DEVCUTPOWER);
//    if m.Switch[GPSALARM_DRIVERFATIGUE] then //��19λ	ƣ�ͼ�ʻ����
//      FOnDevOtherAlarmEvent(m,GPSALARM_DRIVERFATIGUE);
//    if m.Switch[GPSALARM_INDEVAREA] then     //��20λ�����򱨾�
//      FOnDevOtherAlarmEvent(m,GPSALARM_INDEVAREA);
//    if m.Switch[GPSALARM_OUTDEVAREA] then    //��21λ�����򱨾�
//      FOnDevOtherAlarmEvent(m,GPSALARM_OUTDEVAREA);
//    if m.Switch[GPSALARM_OUTLINE] then       //��22λ	ƫ��·�߱���
//      FOnDevOtherAlarmEvent(m,GPSALARM_OUTLINE);
//    if m.Switch[GPSALARM_FORTIFY] then       //��23λ �Ƿ��������� �������
//      FOnDevOtherAlarmEvent(m,GPSALARM_FORTIFY);
//    if m.Switch[GPSALARM_DEVLOWPOWER] then   //��26λ��ѹ����
//      FOnDevOtherAlarmEvent(m,GPSALARM_DEVLOWPOWER);
//  end;
//  //-------------------------------------------------------------------------------
//  if m.Switch[MSG_TYPE_GPS_MODULE_ERROR] then SendMsg(m.id, MSG_TYPE_GPS_MODULE_ERROR, '');
//  if m.Switch[MSG_TYPE_GPS_LINE_ERROR] then SendMsg(m.id, MSG_TYPE_GPS_LINE_ERROR, '');
//  if m.Switch[MSG_TYPE_LOW_V] then SendMsg(m.id, MSG_TYPE_LOW_V, '');
//
//  if m.Switch[MSG_TYPE_LCD_ERROR] then SendMsg(m.id, MSG_TYPE_LCD_ERROR, '');
//
//  //�Ƽ�������
//  if GlobalParam.isShowMasureError and GlobalParam.isUseMasure then
//    if m.Switch[MSG_TYPE_MEASURE_ERROR] then SendMsg(m.id, MSG_TYPE_MEASURE_ERROR, '');
//
//  if m.Switch[MSG_TYPE_SIM_ERROR] then SendMsg(m.id, MSG_TYPE_SIM_ERROR, '');
//  if m.Switch[MSG_TYPE_LEDAD_ERROR] then SendMsg(m.id, MSG_TYPE_LEDAD_ERROR, '');
//  if m.Switch[MSG_TYPE_PHOTOVIDICON_ERROR] then SendMsg(m.id, MSG_TYPE_PHOTOVIDICON_ERROR, '');
//
//  for i := 0 to 7 do
//  begin
//    m.State[i] := True;
//    stat[i] := True;
//  end;
//  m.State[STAT_NEWDATA_GIS] := True;
//  m.State[STAT_DEVICE_CONNECTED] := True;
end;

procedure TDeviceManage.ReceiveGpsData_V3(PGpsData: PGpsData_V3; IsLastGpsData: Boolean=False; isPursuePostion: Boolean=False; AttachInfo: TByteDynArray=nil);
  function checkAttachInfoValid(const attachId, attahcInfoLen: Byte): Boolean;
  begin
    Result := False;
    case attachId of
      $01:
        begin
          Result := attahcInfoLen = 4;
        end;
      $02:
        begin
          Result := attahcInfoLen = 2;
        end;
      $03:
        begin
          Result := attahcInfoLen = 2;
        end;
      $04:
        begin
          Result := attahcInfoLen = 2;
        end;
      $11:
        begin
          Result := (attahcInfoLen = 1) or (attahcInfoLen = 5);
        end;
      $12:
        begin
          Result := attahcInfoLen = 6;
        end;
      $13:
        begin
          Result := attahcInfoLen = 7;
        end;  
    end;
  end;
var
  i,j: integer;
  m: TDevice;
  p: TWorldPoint;
  RvHandle: integer;
  isGpsLocate: Boolean;
  TempLongWord: longWord;
  WarningSign: LongWord;  // ������־
  log, LogA: TSystemLog; //
  EarlyWarningCar: TEarlyWarningCar;
  Str: string;
  pB: PByte;
  attachId: Byte;
  attachLen: Byte;
  offset: Integer;
  attachData: TByteDynArray;
  b1, b2, b3: Boolean;//�Ƿ���3��������Ϣ�ı�����Ϣ
begin
  try
    m := find(BCDToStr1(@PGpsData^.id[0],6));
    if m = nil then //new object
    begin
      Exit; //sha 2005-5-18  ��ĳ����ɾ���ˣ����û�ˢ��ʱ�����ػ�δ��1����ˢ������ʱ������ͻ��˷��͸ó���������
    end;
    m.PursuePostion := isPursuePostion;
    m.LastConnectTime := Now;

    if (PGpsData^.Long < 0) or (PGpsData^.Long >= 180) then
    begin
      PGpsData^.Long := 0;
    end;

    if (PGpsData^.Lat < 0) or (PGpsData^.Lat >= 180) then
    begin
      PGpsData^.Lat := 0;
    end;

    //m.PGpsData := PGpsData;
    m.IsNewGpsData := True;
    m.IsGpsDataRefreshed := False;

    TempLongWord := PGpsData^.State; //ȡ״̬
    for i := 0 to 31 do             // �ܹ���32λ����������ݱ���
    begin
      m.Switch[i] := (TempLongWord and $1) = $1;
      TempLongWord := TempLongWord shr 1;
    end;

    WarningSign := PGpsData^.WarningSign;  // ȡ������־
    for i := 0 to 31 do
    begin
      m.Switch_Warning[i] := (WarningSign and $1) = $1;
      WarningSign := WarningSign shr 1;
    end;
                  //0��δ��λ��1����λ
    isGpsLocate := m.Switch[STAT_GPS_LOCATE];
    if m.IsFatigueAlarm <> m.Switch[STAT_DDS_ALARM] then
    begin
      m.IsFatigueAlarmStatChanged := True;
      m.IsFatigueAlarm := m.Switch[STAT_DDS_ALARM];
      ADeviceManage.OnDevOnFatigueAlarm(m);
    end;

    //�ͼ��ʱ�������ע�� 2011-11-17
    {if isGpsLocate then                   //��������Ƕ�λ�ģ�GPS���ߵ�״̬��ԶΪ������
    begin
      m.Switch_Warning[MSG_Warning_4] := False;
      m.Switch_Warning[MSG_Warning_5] := False;
      m.Switch_Warning[MSG_Warning_6] := False;
    end;}

    p := Project.LoLa2XY(EarthPoint(PGpsData^.Long, PGpsData^.Lat));
//    m.TraceList.AddPoint(p);
//    FindMapName(m, p);

    if not m.isOnline and GlobalParam.isCarOnline then
      PopMsg('��������', m.Car.No + #13#10 + '������');
    m.isOnline := True;
    m.IsGpsDataRefreshed := False;

    //--��һ��������ʱ�������Ƿ�λ�������¾�γ�ȡ�ʱ�� ��
    //--�ǵ�һ��������ʱ�����������λ���Ÿ����� ��γ�ȡ�ʱ�� �ȡ�����λʱ�����ʱ��׼ȷ���͸���ʱ��
    if not m.First then //��һ��������
    begin
      m.First := True;

      m.State[STAT_NEWDEVICE_GIS] := True;
      stat[STAT_NEWDEVICE_GIS] := True;
//      for i := 24 to 31 do
//      begin
//        m.State[i] := True;
//        stat[i] := True;
//      end;
      m.PreviousLatitude := m.Latitude;
      m.PreviousLongitude := m.Longitude;

      m.Longitude := PGpsData^.Long;
      m.Latitude := PGpsData^.Lat;
      m.Altitude := PGPsdata^.Altitude;//sjp
      m.Speed := PGpsData^.Speed;
      m.Orientation := PGpsData^.Orientation;
      m.Point := p;

      if isGpsLocate then
      begin
        m.GpsTime := PGpsData^.GpsTime;
      end
      else
      begin
        if yearof(PGpsData^.GpsTime) = 2000 then
          m.GpsTime := 0
        else
          m.GpsTime := PGpsData^.GpsTime;
      end;
    end
    else
    begin

      if isGpsLocate then //--------���������λ���Ÿ����� ��γ�ȡ�ʱ�� ��
      begin
        m.PreviousLatitude := m.Latitude;
        m.PreviousLongitude := m.Longitude;
        m.Longitude := PGpsData^.Long;
        m.Latitude := PGpsData^.Lat;
        m.Altitude := PGPsdata^.Altitude;//sjp
        m.Speed := PGpsData^.Speed;
        m.Orientation := PGpsData^.Orientation;
        m.GpsTime := PGpsData^.GpsTime;
        m.Point := p;
        //popmsg(m.Car.No, FMap.Layers.Layer[FMap.Layers.Count-1].PointInMetaName(p)+'->'+FMap.Layers.Layer[FMap.Layers.Count-2].PointInMetaName(p)+'->'+FMap.Layers.Layer[FMap.Layers.Count-3].PointInMetaName(p));
      end
      else          //--����λʱ�����ʱ��׼ȷ���͸���ʱ��
      begin
        if yearof(PGpsData^.GpsTime) <> 2000 then
          m.GpsTime := PGpsData^.GpsTime;
      end;
    end;
    if not IsLastGpsData then
      m.LastConnectTime := now      //������� ȡ�� ���һ�㶨λ����
    else
      m.LastConnectTime := m.GpsTime;

//    for i := 0 to 7 do
//    begin
//      m.State[i] := True;
//      stat[i] := True;
//    end;
    m.ReceiveTime := FormatDateTime('YYYY-MM-DD hh:nn:ss', Now);
    m.State[STAT_NEWDATA_GIS] := True;
    m.State[STAT_DEVICE_CONNECTED] := True;
    stat[STAT_NEWDATA_GIS] := True;

    m.AlarmIdManual := 0;
    b1 := False;
    b2 := False;
    b3 := False;
    if (AttachInfo <> nil) then
    begin//����и�����Ϣ
      offset := 0;
      pB := Pbyte(AttachInfo);
      try
        while offset < Length(AttachInfo) do
        begin
          attachId := pB^;
          Inc(offset);
          inc(pB);
          attachLen := pB^;
          Inc(offset);
          //�ж��£����������Ϣ�ĳ�����Э���в�һ�£���ʣ����ֽڵĳ����Ѳ��㸽����Ϣ�ĳ��ȣ����˳�
          if not checkAttachInfoValid(attachId, attachLen) or (offset + attachLen > Length(AttachInfo)) then
            Break;
            
          Inc(pB);
          SetLength(attachData, attachLen);
          CopyMemory(@attachData[0], pB, attachLen);
          DealAttachInfo(m, attachId, attachLen, attachData);
          Inc(offset, attachLen);
          Inc(pB, attachLen);

          case attachId of
            $11: b1 := True;
            $12: b2 := True;
            $13: b3 := True;
          end;
        end;
      except

      end;
    end;
    //m.AlarmIdManual := 1;  //���������ϱ�����ʱ�ֶ���ֵ

    m.Switch_Warning_C[32] := b1;
    m.Switch_Warning_C[33] := b2;
    m.Switch_Warning_C[34] := b3;


  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('ReceviveGpsData_V3�쳣:' + E.Message);
    end;
  end;
end;

procedure TDeviceManage.Remove(const AnIndex: integer);
var
  m: TDevice;
begin
  m := TDevice(FList.Objects[AnIndex]);
  FList.Delete(AnIndex);
  m.Free;
end;

procedure TDeviceManage.RemoveFromAutoTrack(const ATargetID: integer);
begin

end;

procedure TDeviceManage.SendMsg(ADevID: string; AType: byte;
  MsgStr: string);
begin
  if Assigned(FOnSendMsg) then
  begin
    FOnSendMsg(ADevID, AType, MsgStr);
  end;
end;
//
//
//procedure TDeviceManage.SetDevTrackPen(const ADevID: integer;
//  const Acolor: Tcolor);
//var
//  tmpPen: TPenStruct;
//  Dev: TDevice;
//begin
//  tmpPen.Color := Acolor;
//  tmpPen.Width := 1;
//  tmpPen.Pattern := 1;
//  Dev := ADeviceManage.find(ADevID);
//  if Dev <> nil then
//    Dev.TrackPen := tmpPen
//  else
//    showmessage('����ʧ��,û���ҵ���Ӧ���豸.');
//   // messagebox(nil,'����ʧ��,û���ҵ���Ӧ���豸.','��ʾ',mb_ok + mb_iconinformation);
//end;

procedure TDeviceManage.SetDevTrackPen(const ADevice: TDevice;
  const Acolor: Tcolor);
var tmpPen: TPenStruct;
begin
  tmpPen.Color := Acolor;
  tmpPen.Width := 1;
  tmpPen.Pattern := 1;
  ADevice.TrackPen := tmpPen;
end;



procedure TDeviceManage.SetOnDevAlarm_OutorInCArea(
  const Value: TDevAlarm_OutorInCAreaEvent);
begin
  FOnDevAlarm_OutorInCArea := Value;
end;

procedure TDeviceManage.SetOnDevEmergncyAlarmEvent(const Value: TDevEvent);
begin
  FOnDevEmergncyAlarmEvent := Value;
end;

procedure TDeviceManage.SetOnEarlyWarningEvent(const Value: TEarlyWarningEvent);
begin
  FOnEarlyWarningEvent := Value;
end;

procedure TDeviceManage.SetOnDevOtherAlarmEvent(
  const Value: TDevAllKindsOfAlarmEvent);
begin
  FOnDevOtherAlarmEvent := Value;
end;


function TDevice.GetCancelOrderMenuCount: integer;
begin
  Result := FCancelOrderMenuList.Count;
end;

{procedure TDevice.OnClickCarActionLabel(Sender: TObject);
begin
  if Assigned(FOnClickCarAction) then FOnClickCarAction(Self);
end; }

{procedure TDevice.OnRightClickCarActionLabel(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Assigned(FOnClickCarAction) then FOnClickCarAction(Self);
end;     }

{procedure TDevice.SetPopupMenu(const Value: TPopupMenu);
begin
 if Value =nil then exit;
 FPopupMenu:=Value;
 CarActionLabel.PopupMenu:=Value;
end;  }



{procedure TDevice.OnCarActionMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if Assigned(FOnClickCarAction) then FOnClickCarAction(Self);
end; }

{procedure TDevice.OnCarActionPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
  if Assigned(FOnClickCarAction) then FOnClickCarAction(Self);
end; }

procedure TDevice.SetOrientation1(const Value: integer);
begin
  FOrientation1 := Value;
end;

procedure TDevice.SetOrientationRightTime(const Value: integer);
begin
  FOrientationRightTime := Value;
end;

procedure TDevice.SetIsSelected(const Value: Boolean);
begin
  FIsSelected := Value;
end;

procedure TDevice.SetLogin_Driver(const Value: string);
begin
  FLogin_Driver := Value;
end;

procedure TDevice.SetLogin_DriverName(const Value: string);
begin
  FLogin_DriverName := Value;
end;

procedure TDevice.SetLastLogin_DateTime(const Value: TDateTime);
begin
  FLastLogout_DateTime := Value;
end;

procedure TDevice.SetLastLogout_DateTime(const Value: TDateTime);
begin
  FLastLogout_DateTime := Value;
end;

procedure TDevice.SetLogInOut(const Value: Boolean);
begin
  FLogInOut := True;
end;

procedure TDevice.SetNotFirstLog(const Value: Boolean);
begin
  FNotFirstLog := Value;
end;

function TDevice.CarNoDeleteDevName: string;
var
  i: integer;
begin
  Result := '';
  if GlobalParam.isCarNOAndDevName then
  begin
    i:= pos('('+self.DispLabel+')',self.Car.No);
    if i>0 then
      Result := copy(self.Car.No,1,i-1);
  end
  else
    Result := self.Car.No;
end;

procedure TDevice.SetGoToTown(const Value: TDateTime);
begin
  FGoToTown := Value;
end;

procedure TDevice.SetOutToTown(const Value: Boolean);
begin
  FOutToTown := Value;
end;

procedure TDevice.SetAltitude(const Value: Integer);
begin
  FAltitude := Value;
end;

procedure TDevice.SetDevAreaList(const Value: TIntegerList);
begin
  FDevAreaList := Value;
end;

procedure TDevice.AddADevArea(area: TBaseArea);
var
  i: Integer;
begin
  i:=FDevAreaList.IndexOf(area.AreaID);
  if i = -1 then
    FDevAreaList.AddData(area.AreaID,area);
end;

procedure TDevice.ClrDevArea;
var
  i: Integer;
  area: TBaseArea;
begin
  i:=0;
  while i< FDevAreaList.Count do
  begin
    area := TBaseArea(FDevAreaList.Datas[i]);
    area.DeleteDev(Self.Id);
    FDevAreaList.Delete(i);
  end;
end;

procedure TDevice.DelADevArea(area: TBaseArea);
var
  i: Integer;
begin
  i:=FDevAreaList.IndexOf(area.AreaID);
  if i>=0 then
    FDevAreaList.Delete(i);
end;

procedure TDevice.SetAuthCode(const Value: string);
begin
  FAuthCode := Value;
end;

procedure TDevice.SetCourse(const Value: Double);
begin
  FCourse := Value;
end;

procedure TDevice.SetOilVolume(const Value: Double);
begin
  FOilVolume := Value;
end;

function TDevice.GetSwitch_Warning_C(index: Integer): Boolean;
begin
  Result := FSwitch_Warning_C[index];
end;

procedure TDevice.SetSwitch_Warning_C(index: Integer;
  const Value: Boolean);
begin
  FSwitch_Warning_C[index] := Value;
end;

procedure TDevice.SetIsSendCancelEmgcyAlarm(const Value: Boolean);
begin
  FIsSendCancelEmgcyAlarm := Value;
end;

function TDevice.FindEventByEventNo(EventNo: Integer): PEventInfo;
Var
  i: Integer;
  event: PEventInfo;
begin
  Result := nil;
  for i := 0 to FEventList.Count - 1 do
  begin
    event := FEventList.Datas[i];
    if event^.No = EventNo then
    begin
      Result := event;
      Break;
    end;  
  end;   
end;

function TDevice.FindTelInfoByName(ATelName: string): PTelInfo;
var
  i: integer;
begin
  Result := nil;
  for i:= 0 to FTelList.Count -1 do
  begin
    if  TelItems[i]^.Name = ATelName then
    begin
      Result := TelItems[i];
      break;
    end;
  end;
end;

function TDevice.AddInfoTypeId(infoTypeId: Integer): Boolean;
begin
  Result := False;
  if FInfoTypeIdList.IndexOf(infoTypeId) < 0 then
  begin
    FInfoTypeIdList.Add(infoTypeId);
    Result := True;
  end;
end;

function TDevice.DeleteInfoTypeId(infoTypeId: Integer): Boolean;
var
  i: Integer;
begin
  Result := False;
  i := FInfoTypeIdList.IndexOf(infoTypeId);
  if i >= 0 then
  begin
    FInfoTypeIdList.Delete(i);
    Result := True;
  end;
end;

procedure TDevice.SetAlarmInfoId(const Value: Integer);
begin
  FAlarmInfoId := Value;
end;

procedure TDevice.SetPointWhenAccOff(const Value: TWorldPoint);
begin
  FPointWhenAccOff := Value;
end;

procedure TDevice.SetIsAccOff(const Value: Boolean);
begin
  FIsAccOff := Value;
end;

procedure TDevice.SetIsAlarmedInAreaOnTime(const Value: Boolean);
begin
  FIsAlarmedInAreaOnTime := Value;
end;

procedure TDevice.SetIsAlarmedOutAreaOnTime(const Value: Boolean);
begin
  FIsAlarmedOutAreaOnTime := Value;
end;

procedure TDevice.SetIsInAreaOnTime(const Value: Boolean);
begin
  FIsInAreaOnTime := Value;
end;

procedure TDevice.SetIsOutAreaOnTime(const Value: Boolean);
begin
  FIsOutAreaOnTime := Value;
end;

procedure TDevice.SetIsEncrypted(const Value: Boolean);
begin
  FIsEncrypted := Value;
end;

procedure TDevice.SetSpeed_RunRec(const Value: Integer);
begin
  FSpeed_RunRec := Value;
end;

procedure TDevice.SetRunRecSpeed(const Value: Integer);
begin
  FRunRecSpeed := Value;
end;

procedure TDevice.SetAlarmIdManual(const Value: Integer);
begin
  FAlarmIdManual := Value;
end;

function TDevice.GetADevArea(areaId: Integer): TBaseArea;
var
  i: Integer;
begin
  Result := nil;
  i := FDevAreaList.IndexOf(areaId);
  if i >= 0 then
    Result := TBaseArea(FDevAreaList.Datas[i]);
end;

procedure TDevice.DelDevAreasExceptAArea(excAreaId: Integer);
var
  i: Integer;
  area: TBaseArea;
begin
  i := 0;
  while i < FDevAreaList.Count do
  begin
    area := TBaseArea(FDevAreaList.Datas[i]);
    if area.AreaID = excAreaId then
    begin
      Inc(i);
      Continue;
    end;
    area.DeleteDev(Self.Id);
    FDevAreaList.Delete(i);
  end;  
end;

procedure TDevice.SetIsOnline(const Value: Boolean);
begin
  if FisOnline <> Value then
  begin
    FisOnline := Value;
    FIsDevOnLineChanged := True;
    FIsGpsDataRefreshed := False;
    ADeviceManage.OnDevOnLineStatusChanged(Self);
  end;
end;

procedure TDevice.SetIsGpsDataRefreshed(const Value: Boolean);
begin
  FIsGpsDataRefreshed := Value;
end;

procedure TDevice.SetOnline_PlayHis(value: Boolean);
begin
  FisOnline := value;
end;

procedure TDevice.SetTerminalTypeId(const Value: Integer);
begin
  FTerminalTypeId := Value;
end;

procedure TDevice.SetTerminalTypeName(const Value: string);
begin
  FTerminalTypeName := Value;
end;

procedure TDevice.SetFatigueAlarm(const Value: Boolean);
begin
  FIsFatigueAlarm := Value;
end;

procedure TDevice.setLastFatigueAlarmPicData(pic: PicInfo);
begin
  IsLastPicSet := True;
  if pic = nil then
    Exit;
  SetLength(FLastFatigueAlarmPicData, Length(pic.Photo));
  CopyMemory(@FLastFatigueAlarmPicData[0], @pic.Photo[0], Length(pic.Photo));
  FLastFatigueAlarmGpsTime := pic.GpsTime;
  FLastFatigueAlarmSpeed := pic.speed;
  FLastPicType := pic.PhotoReasonID;
end;

procedure TDevice.SetFatigueAlarmStatChanged(const Value: Boolean);
begin
  FIsFatigueAlarmStatChanged := Value;
end;

procedure TDevice.SetLastPicType(const Value: Byte);
begin
  FLastPicType := Value;
end;

procedure TDevice.SetLastPicSet(const Value: Boolean);
begin
  FIsLastPicSet := Value;
end;

procedure TDevice.SetSignalStrength(const Value: Byte);
begin
  FSignalStrength := Value;
end;

procedure TDevice.SetNavSatelliteCount(const Value: Byte);
begin
  FNavSatelliteCount := Value;
end;

procedure TDevice.SetDeepHibernated(const Value: Boolean);
begin
  FIsDeepHibernated := Value;
end;

procedure TDevice.SetHibernated(const Value: Boolean);
begin
  FIsHibernated := Value;
end;

{ TCarManage }

function TCarManage.AddNewCar(ACarId: integer): TCar;
var
  i: integer;
//  find: Boolean;
begin
//  find := false;
//  for i := 0 to Count - 1 do
//  begin
//    if FCarAry[i].id = ACarId then
//    begin
//      Result := @FCarAry[i];
//      find := True;
//      break;
//    end;
//  end;
//  if not find then
//  begin
//    SetLength(FCarAry, Count + 1); // .. Count=length(FConns)
//    Result := @FCarAry[Count - 1];
//  end;
  i := FList.IndexOf(ACarId);
  if i < 0 then
  begin
    Result := TCar.Create;
    Result.id := ACarId;
    FList.AddData(ACarId, Result);
  end
  else
  begin
    Result := Cars[i];
  end;    
end;

procedure TCarManage.ClearCar;
var
  i: Integer;
  car: TCar;
begin
  while FList.Count > 0 do
  begin
    car := TCar(FList.Datas[0]);
    if car <> nil then
      car.Free;
    FList.Delete(0);
  end;
//  SetLength(FCarAry, 0);
end;

constructor TCarManage.Create;
begin
  FList := TIntegerList.Create;
end;

destructor TCarManage.Destroy;
begin
  ClearCar;
  FList.Free;
  inherited;
end;

function TCarManage.getCar(const ACarId: integer): TCar;
var
  i: integer;
begin
  Result.id := -1;
  Result.No := '';
  Result.ZBH := '';
  Result.Memo := '';
  Result.stat := 0;
  i := FList.IndexOf(ACarId);
  if i >= 0 then
  begin
    Result := Cars[i];
  end;  
//  for i := 0 to Count - 1 do
//  begin
//    if FCarAry[i].id = ACarId then
//    begin
//      Result := FCarAry[i];
//      break;
//    end;
//  end;
  {//��Ϊ������Ϣʱ�����������복�����������豸��Ϣ�ģ����ԣ����û���ҵ�����˵�������û�иó��������㲻�ᷢ����
  if Result.Id = -1 then
  begin
    Result.Id := ACarID;
    Bs.QueryCarInfo(Result);
    AddNewCar(Result.Id)^ := Result;
  end;   }
end;

function TCarManage.GetCarIndex(const ACarId: integer): integer;
//var
//  i: integer;
begin
//  Result := -1;
//  for i := 0 to Count - 1 do
//  begin
//    if FCarAry[i].id = ACarId then
//    begin
//      Result := i;
//      break;
//    end;
//  end;
  Result := FList.IndexOf(ACarId);
end;

function TCarManage.GetCars(index: integer): TCar;
begin
//  Result := FCarAry[index];
  Result := nil;
  if (index >= 0) and (index < FList.Count) then
    Result := TCar(FList.Datas[index]);
end;

function TCarManage.Getcount: integer;
begin
//  Result := Length(FCarAry);
  Result := FList.Count;
end;




{ TImgResManage }

function TImgResManage.AddNewImgRes(AImgResId: integer): PImgRes;
var
  i: integer;
  find: Boolean;
begin
  find := false;
  for i := 0 to Count - 1 do
  begin
    if FImgResAry[i].id = AImgResId then
    begin
      Result := @FImgResAry[i];
      find := True;
      break;
    end;
  end;
  if not find then
  begin
    SetLength(FImgResAry, Count + 1);
    Result := @FImgResAry[Count - 1];
  end;
end;

procedure TImgResManage.ClearImgRes;
begin
  SetLength(FImgResAry, 0);
end;

constructor TImgResManage.Create;
begin
  ClearImgRes;
end;

destructor TImgResManage.Destroy;
begin

  inherited;
end;

function TImgResManage.Getcount: integer;
begin
  Result := Length(FImgResAry);
end;

function TImgResManage.getImgRes(const AImgResId: integer): TImgRes;
var
  i: integer;
begin
  Result.id := -1;
  Result.Name := '';
  Result.content := '';
  Result.exttype := '';
  for i := 0 to Count - 1 do
  begin
    if FImgResAry[i].id = AImgResId then
    begin
      Result := FImgResAry[i];
      break;
    end;
  end;

end;

function TImgResManage.GetImgResIndex(const AImgResId: integer): integer;
var
  i: integer;
begin
  Result := -1;
  for i := 0 to Count - 1 do
  begin
    if FImgResAry[i].id = AImgResId then
    begin
      Result := i;
      break;
    end;
  end;
end;

function TImgResManage.GetImgRess(index: integer): TImgRes;
begin
  Result := FImgResAry[index];
end;

procedure TImgResManage.SetImgRess(index: integer; const Value: TImgRes);
begin
  FImgResAry[index] := Value;
end;

{ TDevGroupManage }

function TDevGroupManage.Add(const ADevGroupID: integer): TDevGroup;
var
  i: integer;
//  find: Boolean;
begin
  i := FList.IndexOf(ADevGroupID);
  if i >= 0 then
    Result := Items[i]
  else
  begin
    Result := TDevGroup.Create;
    Result.id := ADevGroupID;
    FList.AddData(ADevGroupID, Result);
  end;
end;

procedure TDevGroupManage.Clear;
var
  i: integer;
begin
  i := 0;
  while i < Count do //for i:= 0 to Count -1 do
  begin
    Delete(Items[i].FId);
  end;
end;

constructor TDevGroupManage.Create;
begin
  FList := TIntegerList.Create;
  FList.Sorted := True;
end;

destructor TDevGroupManage.Destroy;
begin
  Clear;
  FList.Free;
  inherited;
end;

function TDevGroupManage.Getcount: integer;
begin
  Result := FList.Count;
end;

{function TDevGroupManage.GetDevGroupIndex(const ADevGroupID: Integer): Integer;
var
  i: Integer;
begin
  Result := -1;
  for i := 0 to Count - 1 do
  begin
    if FDevGroupAry[i].id = ADevGroupID then
    begin
      Result := i;
      Break;
    end;
  end;
end;}


function TDevGroupManage.find(const ADevGroupID: integer): TDevGroup;
var
  i: integer;
begin
  Result := nil;
  i := FList.IndexOf(ADevGroupID);
  if i >= 0 then
    Result := Items[i];
end;

procedure TDevGroupManage.InsertDevList(const ADevID:String;const ADevGroupID: integer);
var
  grp: TDevGroup;
begin
  grp := find(ADevGroupID);
  if grp <> nil then //dxf ���ж��ǲ���Ϊ��,��ADevGroupId�ѱ�ɾ��.
    grp.AddDevID(ADevID);
end;

procedure TDevGroupManage.ListSon;
  procedure GroupList(ADevGroup: TDevGroup);
  var
    i: integer;
  begin
    for i := 0 to Count - 1 do
    begin
      if Items[i].Parent = ADevGroup.id then
        ADevGroup.AddSonGroup(Items[i].id);
    end;
  end;
  //================================
  procedure InsertSonDev2Parent(ADevGroup: TDevGroup; Alist: TStringLIst);
  var
    i, j: integer;
    sonGrp: TDevGroup;
  begin
    for i := 0 to ADevGroup.SonListCount - 1 do
    begin
      sonGrp := find(ADevGroup.SonListItems[i]);
      if sonGrp = nil then continue;
      if sonGrp.leaf_nod then
      begin
        if sonGrp.DevListCount = 0 then
          continue;
        for j := 0 to sonGrp.DevListCount - 1 do
          Alist.Add(sonGrp.DevListItems[j]);
      end
      else
      begin
        if sonGrp.SonListCount = 0 then continue;
        InsertSonDev2Parent(sonGrp, Alist);
      end;
    end;
  end;
var
  i: integer;
begin
  for i := 0 to Count - 1 do
    if not Items[i].leaf_nod then
      GroupList(Items[i]);

  for i := 0 to Count - 1 do
    if not Items[i].leaf_nod then
      InsertSonDev2Parent(Items[i], Items[i].DevList);
end;

function TDevGroupManage.GetItems(index: integer): TDevGroup;
begin
  Result := TDevGroup(FList.Datas[index]);
end;

procedure TDevGroupManage.Delete(const ATargetID: integer);
var
  i: integer;
  m: TDevGroup;
begin
  i := FList.IndexOf(ATargetID);
  if i >= 0 then
  begin
    m := TDevGroup(FList.Datas[i]);
    m.Free;
    FList.Delete(i);
  end;
end;

function TDevGroupManage.FindByName(const groupName: string): TDevGroup;
var
  i: Integer;
  group: TDevGroup;
begin
  Result := nil;
  for i := 0 to Count - 1 do
  begin
    group := Items[i];
    if group.Name = groupName then
    begin
      Result := group;
      Break;
    end;
  end;
end;

function TDevGroupManage.FindByNameFuzzy(
  const groupName: string): TDevGroup;
var
  i: Integer;
  group: TDevGroup;
begin
  Result := nil;
  for i := 0 to Count - 1 do
  begin
    group := Items[i];
    if Pos(groupName, group.Name) > 0 then
    begin
      Result := group;
      Break;
    end;
  end;
end;

{ TDevGroup }

procedure TDevGroup.AddDevID(ADevID: string);
var
  i: integer;
begin
  i := FDevList.IndexOf(ADevID);
  if i = -1 then
    FDevList.Add(ADevID);
end;

function TDevGroup.FindByDevID(ADevID: string ): Boolean;
var
  i: integer;
begin
  Result := False;
  i := FDevList.IndexOf(ADevID);    
  if i >= 0 then
    Result := True;
end;

procedure TDevGroup.AddSonGroup(ASonGroupId: integer);
var
  i: integer;
begin
  i := FsonList.IndexOf(ASonGroupId);
  if i = -1 then
    FsonList.Add(ASonGroupId);
end;

constructor TDevGroup.Create;
begin
  FsonList := TIntegerList.Create;
  FsonList.Sorted := True;
  FDevList := TStringList.Create;
  FDevList.Sorted := True;
end;

destructor TDevGroup.Destroy;
begin
  FsonList.Free;
  FDevList.Free;
  inherited;
end;

function TDevGroup.GetDevListCount: integer;
begin
  Result := FDevList.Count;
end;

function TDevGroup.GetDevListItems(index: integer): string;
begin
  //Result := FDevList.Integers[index];
  Result := FDevList.Strings[index] ;
end;

function TDevGroup.GetSonListCount: integer;
begin
  Result := FsonList.Count;
end;

function TDevGroup.GetSonListItems(index: integer): integer;
begin
  Result := FsonList.Integers[index];
end;

procedure TDevGroup.SetDevCount(const Value: integer);
begin
  FDevCount := Value;
end;

procedure TDevGroup.SetDevList(const Value: TStringList);
begin
  FDevList := Value;
end;

procedure TDevGroup.SetId(const Value: integer);
begin
  FId := Value;
end;

procedure TDevGroup.Setleaf_nod(const Value: Boolean);
begin
  Fleaf_nod := Value;
end;

procedure TDevGroup.Setname(const Value: string);
begin
  Fname := Value;
end;

procedure TDevGroup.Setparent(const Value: integer);
begin
  Fparent := Value;
end;

procedure TDevGroup.SetSonList(const Value: TIntegerList);
begin
  FsonList := Value;
end;

procedure TDevGroup.SetTelPhone(const Value: string);
begin
  FTelPhone := Value;
end;

constructor TCarType.Create;
begin
  inherited;
end;

destructor TCarType.Destroy;
begin
  inherited;
end;

procedure TCarType.SetCarTypeID(const Value: Integer);
begin
  FCarTypeID := Value;
end;

procedure TCarType.SetCarTypeName(const Value: string);
begin
  FCarTypeName := Value;
end;

constructor TCarTypeManage.Create;
begin
  FList := TIntegerList.Create;
  FList.Sorted := True;
end;

destructor TCarTypeManage.Destroy;
var
  i:Integer;
  m:TCarType;
begin
  i := 0;
  while (i<FList.Count) do
  begin
    m := TCarType(FList.Datas[i]);
    FList.Delete(i);
    m.Free;
  end;
  FList.Free;
  inherited;
end;

function TCarTypeManage.Add(ACarTypeID: Integer): TCarType;
var
  i: Integer;
begin
  i := FList.IndexOf(ACarTypeID);
  if (i >= 0) then
    Result := Items[i]
  else
  begin
    Result := TCarType.Create;
    Result.CarTypeID := ACarTypeID;
    FList.AddData(ACarTypeID, Result);
  end;
end;

function TCarTypeManage.Find(const ACarTypeName: string): TCarType;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
  begin
    if (Items[i].CarTypeName = ACarTypeName) then
    begin
      Result := Items[i];
      break;
    end;
  end;

end;

procedure TCarTypeManage.ClearAll;
var
  i: Integer;
begin
  i := 0;
  while (i < Count) do
    Delete(Items[i].CarTypeID);
end;

procedure TCarTypeManage.Delete(const ACarTypeID: Integer);
var
  i: Integer;
  m: TCarType;
begin
  i := FList.IndexOf(ACarTypeID);
  if (i >= 0) then
  begin
    m := Items[i];
    FList.Delete(i);
    m.Free;
  end;
end;

function TCarTypeManage.Find(const ACarTypeID: Integer): TCarType;
var
  i: Integer;
begin
  Result := nil;
  i := FList.IndexOf(ACarTypeID);
  if (i >= 0) then
    Result := Items[i];
end;

function TCarTypeManage.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TCarTypeManage.GetItems(Index: Integer): TCarType;
begin
  Result := TCarType(FList.Datas[Index]);
end;


function TDriverManage.GetDrivers(index: integer): TDriver;
begin
  Result := FDriverAry[index]
end;

function TDriverManage.Getcount: integer;
begin
  Result := Length(FDriverAry);
end;

procedure TDriverManage.SetDrivers(index: integer; const Value: TDriver);
begin
  FDriverAry[index] := Value;
end;

procedure TDriverManage.ClearDriver;
begin
  SetLength(FDriverAry, 0);
end;

constructor TDriverManage.Create;
begin
  ClearDriver;
end;

destructor TDriverManage.Destroy;
begin
  ClearDriver;
  inherited;
end;

function TDriverManage.AddNewDriver(ADriverId: integer): PDriver;
var
  i: integer;
  find: Boolean;
begin
  find := false;
  for i := 0 to Count - 1 do
  begin
    if FDriverAry[i].id = ADriverId then
    begin
      Result := @FDriverAry[i];
      find := True;
      break;
    end;
  end;
  if not find then
  begin
    SetLength(FDriverAry, Count + 1); // .. Count=length(FConns)
    Result := @FDriverAry[Count - 1];
  end;
end;

function TDriverManage.GetDriverIndex(const ADriverId: integer): integer;
var
  i: integer;
begin
  Result := -1;
  for i := 0 to Count - 1 do
  begin
    if FDriverAry[i].id = ADriverId then
    begin
      Result := i;
      break;
    end;
  end;
end;

function TDriverManage.GetDriver(const Dev: TDevice): TDriver;
var
  i: integer;
begin
  Result.id := -1;
  Result.DriverNO := '';
  Result.Name := '';
  Result.DevID := -1;
  Result.CarID := -1;
  Result.GroupID := -1;

  for i := 0 to Count - 1 do
  begin
    if (FDriverAry[i].CarID = Dev.Car.id) then
    begin
      Result := FDriverAry[i];
      break;
    end;
  end;
end;

{function  TDriverManage.GetDriver(const Dev:TDevice): TDriver;
var
  i: Integer;
begin
  Result.Id := -1;
  Result.DriverNO := '';
  Result.Name:= '';
  Result.DevID:=-1;
  Result.CarID:=-1;
  Result.GroupID:=-1;
  for i := 0 to Count - 1 do
  begin
    if FDriverAry[i].DevID = Dev.Id  then
    begin
      Result := FDriverAry[i];
      Break;
    end;
  end;
end;   }


{ TCarNOManage }

function TCarNOManage.AddNewCar(DevId: integer; carNo: string): Boolean;
//var
//  i: Integer;
begin
 // Result:=false;
{  for i := 0 to Count - 1 do
  begin
    if FCarAry[i].DevID = DevID then
    begin
      Exit;
    end;
  end;   }
  SetLength(FCarAry, Count + 1); // .. Count=length(FConns)
  FCarAry[Count - 1].DevId := DevId;
  FCarAry[Count - 1].carNo := carNo;
  Result := True;
end;

procedure TCarNOManage.ClearCar;
begin
  SetLength(FCarAry, 0);
end;

constructor TCarNOManage.Create;
begin
  ClearCar;
end;

destructor TCarNOManage.Destroy;
begin
  ClearCar;
  inherited;
end;

function TCarNOManage.GetCarNO(const DevId: integer): string;
var
  i: integer;
begin
  Result := '';
  for i := 0 to Count - 1 do
  begin
    if FCarAry[i].DevId = DevId then
    begin
      Result := FCarAry[i].carNo;
      break;
    end;
  end;
end;

function TCarNOManage.GetCars(index: integer): TCarNO;
begin
  Result := FCarAry[index];
end;

function TCarNOManage.Getcount: integer;
begin
  Result := Length(FCarAry);
end;

function TCarNOManage.GetDevID(const carNo: string): integer;
var
  i: integer;
begin
  Result := 1;
  for i := 0 to Count - 1 do
  begin
    if FCarAry[i].carNo = carNo then
    begin
      Result := FCarAry[i].DevId;
      break;
    end;
  end;
end;

procedure TDeviceManage.SetStat(const Value: TBits);
begin
  FStat := Value;
end;

function TDriverManage.GetDriver(DriverNO: string): PDriver;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to Self.Count - 1 do
  begin
    if FDriverAry[i].DriverNO = DriverNO then
    begin
      Result := @FDriverAry[i];
      exit;
    end;
  end;
end;

{ TAssembleWarring }
 (*
constructor TAssembleWarring.Create;
begin
  //SpVoice := TSpVoice.Create(nil);
  MSNPopUp1 := TMSNPopUp.Create(nil);
  MSNPopUp1.Height := 100;
  MSNPopUp1.Width := 160;
  inherited Create(False);
end;

destructor TAssembleWarring.Destroy;
begin
  //SpVoice.Free;
  inherited Destroy;
end;

procedure TAssembleWarring.Execute;
var
  i,j,k: Integer;
  p: TWorldPoint;
  Dev, CenterDev, temp: TDevice;
  log, LogA: TSystemLog; //

  ep: TEarthPoint;
  wp: TWorldPoint;
  sp: Tpoint;
begin
  inherited;
  Sleep(10000);
  LogA := TSystemLog.Create;
  while not Terminated do
  begin
    for i:=0 to ADeviceManage.Count-1 do
    begin
      CenterDev := ADeviceManage.Items[i];    // �ó����ľ�γ����ΪԲ�ĵ�
      if (not CenterDev.DevInCenterDev) and (CenterDev.Speed <1000) then      // �����ٶ�С��10km/sʱ
      begin
        for j:=0 to ADeviceManage.Count-1 do
        begin
          Dev := ADeviceManage.Items[j];
          p := Dev.Point;
          if (Dev.Speed<1000) and (GeometryCalc.PointInRound(p, CenterDev.Point, 100000)) then    // ����1�����ڵĳ�
          begin
            if CenterDev.DevList.IndexOf(Dev.id) < 0 then
            begin
              CenterDev.DevList.AddData(Dev.id, Dev);
              Dev.DevInCenterDev := True;
              if CenterDev.DevList.Count > 3 then   // ����50����ʱ����
              begin

              //SpVoice.GetVoices('','').Item(3);
              //SpVoice.Speak('�ۼ�������', 10);
                if CenterDev.DevAlarmCount < 10 then
                begin
                  showMsg('�ۼ�������', CenterDev.Car.No + #13 + #10 + '�ۼ�������!');
                  //Locate_Car(CenterDev, '�ۼ�����');
                   { GCurSelectDev_rundata := CenterDev;
                    ep.Longitude := GCurSelectDev_rundata.Longitude;
                    ep.Latitude := GCurSelectDev_rundata.Latitude;
                    wp := FMap.Projection.LoLa2XY(ep);


                    if not GeometryCalc.PointInRect(wp, FMap.DrawCood.WorldRect) then
                    begin
                      FMap.Zoom(1, wp);
                      FMap.Draw;
                    end;
                    sp := FMap.DrawCood.ConvertSP(wp);
                    FMap.TmpDraw.Canvas.Pen.Color := clred;
                    FMap.TmpDraw.Canvas.Pen.Width := 3;
                    //FMap.TmpDraw.Canvas.Pen.Mode := pmMask;
                    FMap.DrawTempEllipseAndText(sp.x, sp.y, '�ۼ�����');      }

                  try
                    LogA.LogFile := ExePath + 'Alarm\AssembleWarring'+CenterDev.Car.No;
                    LogA.ExtendName := 'csv';
                    LogA.BufferSize := 0;
                    LogA.AddLog(FormatDatetime('yyyy-mm-dd hh:nn:ss', now) + ',' +
                      CenterDev.Car.No + ',�ۼ�����:' + IntToStr(CenterDev.DevList.Count) +
                      ',����:' + FormatFloat('##0.000000', CenterDev.Longitude) +
                      ',γ��:' + FormatFloat('##0.000000', CenterDev.Latitude));

                    {for k:=0 to CenterDev.DevList.Count-1 do
                    begin
                      temp := TDevice(CenterDev.DevList.Datas[k]);
                      LogA.AddLog(FormatDatetime('yyyy-mm-dd hh:nn:ss', now) + ',' +
                       temp.Car.No + ',�ۼ�����:' + '�ۼ�����' +
                      ',����:' + FormatFloat('##0.000000', temp.Longitude) +
                      ',γ��:' + FormatFloat('##0.000000', temp.Latitude));

                    end;  }

                  except

                  end;
                  CenterDev.DevAlarmCount := CenterDev.DevAlarmCount + 1;
                end;
              end;
            end;
          end
          else
          begin
            if CenterDev.DevList.IndexOf(Dev.id) >= 0 then
            begin
              Dev.DevInCenterDev := False;
              CenterDev.DevList.Delete(Dev.id);
            end;
          end;
        end;
      end;
      Sleep(500);
    end;
    Sleep(1000);
  end;
  LogA.Free
end;

function TAssembleWarring.showMsg(Title, Msg: string): boolean;
begin
  MSNPopUp1.Title:=Title+'  ';
  MSNPopUp1.Text:=Msg;
  Result:=MSNPopUp1.ShowPopUp;
  //ShowMessage('');
end;
          *)
procedure TDeviceManage.DealAttachInfo(dev: TDevice; attachId,
  attachLen: Byte; attachData: TByteDynArray);
var
  p: PByte;
  areaType: Byte;
  areaNo: Integer;
  flag: Byte;
  runTime: Integer;
  lineSectionNo: Integer;
  w: Word;
  b: Byte;
begin
  case attachId of
    $01://�����Ϣ
      begin
        dev.Course := ByteOderConvert_LongWord(PLongWord(attachData)^)/10;
      end;
    $02://������Ϣ
      begin
        dev.OilVolume := ByteOderConvert_Word(PWord(attachData)^)/10;
      end;
    $03://��ʻ��¼�����ٶ�
      begin
        dev.RunRecSpeed := ByteOderConvert_Word(PWord(attachData)^);
      end;
    $04://��Ҫ�˹�ȷ�ϱ����¼���ID
      begin
        dev.AlarmIdManual := ByteOderConvert_Word(PWord(attachData)^);
        //PopMsg('�ϴ���ȷ�ϱ����¼�ID', dev.Car.No + '�ϴ�' + #13#10 + '�¼�ID:' + IntToStr(ByteOderConvert_Word(PWord(attachData)^)));
      end;
    $11://���ٱ���������Ϣ
      begin
        p := PByte(attachData);
        areaType := p^;
        if p^ = 0 then
        begin
          areaNo := 0;
        end
        else
        begin
          Inc(p);
          areaNo := ByteOderConvert_LongWord(PLongWord(p)^);
        end;

        if Assigned(FOnCarOverSpeedAlarmEvent) then
          FOnCarOverSpeedAlarmEvent(dev, areaType - 1, areaNo);
      end;
    $12://��������/·�߱���������Ϣ
      begin
        p := PByte(attachData);
        areaType := p^;
        Inc(p);
        areaNo := ByteOderConvert_LongWord(PLongWord(p)^);
        Inc(p, 4);
        flag := p^;
        if Assigned(FOnCarInOutAreaAlarmEvent) then
          FOnCarInOutAreaAlarmEvent(dev, areaType - 1, areaNo, flag);
      end;
    $13://·����ʻʱ�䲻��/��������������Ϣ
      begin
        p := PByte(attachData);
        lineSectionNo := ByteOderConvert_LongWord(PLongWord(p)^);
        Inc(p, 4);
        runTime := ByteOderConvert_Word(PWord(p)^);
        Inc(p, 2);
        flag := p^;
        if Assigned(FOnCarRunTimeAlarmEvent) then
          FOnCarRunTimeAlarmEvent(dev, lineSectionNo, runTime, flag);
      end;
    $2A: //IO״̬λ
      begin
        p := PByte(attachData);
        w := ByteOderConvert_Word(PWord(p)^);
        dev.IsDeepHibernated := (w and $0001) = $0001;
        dev.IsHibernated := (w and $0002) = $0002;
      end;
    $30: //����ͨ�������ź�ǿ��
      begin
        p := PByte(attachData);
        dev.SignalStrength := p^;
      end;
    $31: //GNSS��λ������
      begin
        p := PByte(attachData);
        dev.NavSatelliteCount := p^;
      end;
  end;
end;

procedure TDeviceManage.SetOnCarOverSpeedAlarmEvent(
  const Value: TCarOverSpeedAlarmEvent);
begin
  FOnCarOverSpeedAlarmEvent := Value;
end;

procedure TDeviceManage.SetOnCarInOutAreaAlarmEvent(
  const Value: TCarInOutAreaAlarmEvent);
begin
  FOnCarInOutAreaAlarmEvent := Value;
end;

procedure TDeviceManage.SetOnCarRunTimeAlarmEvent(
  const Value: TCarRunTimeAlarmEvent);
begin
  FOnCarRunTimeAlarmEvent := Value;
end;

procedure TDeviceManage.SetOnGpsDataAlarmEvent(
  const Value: TGpsDataAlarmEvent);
begin
  FOnGpsDataAlarmEvent := Value;
end;

procedure TDeviceManage.DealGpsDataWarningSign(dev: TDevice);
var
  i: Integer;
begin
  for i := 0 to 31 do
  begin
    if dev.Switch_Warning[i] then
    begin
      if i in[1, 12..17, 20..22, 30, 31] then Continue;//���ٱ������������򡢽���·�ߡ�·����ʻ����/���������ں���ĸ�����Ϣ������ʾ���˴�������

      //����������ı����򲻼�¼�����ı�����Ϣ��ֻ��ʾ���ڱ���
      if not dev.Switch_Warning_C[i] then
      begin
        dev.Switch_Warning_C[i] := True;
        if Assigned(FOnGpsDataAlarmEvent) then
          FOnGpsDataAlarmEvent(dev, i);
      end;
    end
    else
    begin
      dev.Switch_Warning_C[i] := False;
    end;
  end;
end;

{ TDevEventInfoManage }

function TDevEventInfoManage.AddDevEventInfo(EventId: Integer): PEventInfo;
var
  i: integer;
  p: PEventInfo;
begin
  i := FList.IndexOf(EventId);
  if i >= 0 then
    Result := FList.Datas[i]
  else
  begin
    New(p);
    p^.id := EventId;
    FList.AddData(EventId, p);
    Result := p;
  end;
end;

procedure TDevEventInfoManage.Clear;
Var
  event: PEventInfo;
begin
  while FList.Count > 0 do
  begin
    event := FList.Datas[0];
    FList.Delete(0);
    Dispose(event);
  end;
end;

constructor TDevEventInfoManage.Create;
begin
  FList := TIntegerList.Create;
end;

procedure TDevEventInfoManage.DeleteEventInfo(EventId: Integer);
var
  i: Integer;
  event: PEventInfo;
begin
  i := FList.IndexOf(EventId);
  if i >= 0 then
  begin
    event := FList.Datas[i];
    FList.Delete(i);
    Dispose(event);
  end;
end;

destructor TDevEventInfoManage.Destroy;
begin
  Clear;
  FList.Free;
  inherited;
end;

function TDevEventInfoManage.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TDevEventInfoManage.GetDevEventInfoById(
  EventId: Integer): PEventInfo;
var
  i: integer;
begin
  Result := nil;
  i := FList.IndexOf(EventId);
  if i >= 0 then
    Result := Items[i];
end;

function TDevEventInfoManage.GetDevEventInfoByNo(
  EventNo: Integer): PEventInfo;
var
  i: Integer;
  event: PEventInfo;
begin
  Result := nil;
  for i := 0 to Count - 1 do
  begin
    event := Items[i];
    if event^.No = EventNo then
    begin
      Result := event;
      Break;
    end;
  end;
end;

function TDevEventInfoManage.GetItem(Index: Integer): PEventInfo;
begin
  if (Index < 0) or (Index >= Count) then
    Result := nil
  else
    Result := FList.Datas[index];
end;

{ TDevTelListManage }

function TDevTelListManage.AddTelInfo(TelId: Integer): PTelInfo;
var
  i: integer;
  p: PTelInfo;
begin
  i := FList.IndexOf(TelId);
  if i >= 0 then
    Result := FList.Datas[i]
  else
  begin
    New(p);
    p^.id := TelId;
    FList.AddData(TelId, p);
    Result := p;
  end;
end;

procedure TDevTelListManage.Clear;
Var
  tel: PTelInfo;
begin
  while FList.Count > 0 do
  begin
    tel := FList.Datas[0];
    FList.Delete(0);
    Dispose(tel);
  end;
end;

constructor TDevTelListManage.Create;
begin
  FList := TIntegerList.Create;
end;

procedure TDevTelListManage.DeleteTelInfo(TelId: Integer);
var
  i: Integer;
  tel: PTelInfo;
begin
  i := FList.IndexOf(TelId);
  if i >= 0 then
  begin
    tel := FList.Datas[i];
    FList.Delete(i);
    Dispose(tel);
  end;
end;

destructor TDevTelListManage.Destroy;
begin
  Clear;
  FList.Free;
  inherited;
end;

function TDevTelListManage.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TDevTelListManage.GetItem(Index: Integer): PTelInfo;
begin
  if (Index < 0) or (Index >= Count) then
    Result := nil
  else
    Result := FList.Datas[index];
end;

function TDevTelListManage.GetTelInfoById(TelId: Integer): PTelInfo;
var
  i: integer;
begin
  Result := nil;
  i := FList.IndexOf(TelId);
  if i >= 0 then
    Result := Items[i];
end;

function TDevTelListManage.GetTelInfoByNo(TelNo: string): PTelInfo;
var
  i: Integer;
  tel: PTelInfo;
begin
  Result := nil;
  for i := 0 to Count - 1 do
  begin
    tel := Items[i];
    if tel^.No = TelNo then
    begin
      Result := tel;
      Break;
    end;
  end;

end;

{ TInfo }

constructor TInfo.Create;
begin
end;

destructor TInfo.Destroy;
begin
  inherited;
end;

procedure TInfo.SetInfoContent(const Value: string);
begin
  FInfoContent := Value;
end;

procedure TInfo.SetInfoId(const Value: Integer);
begin
  FInfoId := Value;
end;

procedure TInfo.SetInfoTypeId(const Value: Integer);
begin
  FInfoTypeId := Value;
end;

procedure TInfo.SetIsSent(const Value: Boolean);
begin
  FIsSent := Value;
end;

procedure TInfo.SetMemo(const Value: string);
begin
  FMemo := Value;
end;

procedure TInfo.SetSendTime(const Value: TDateTime);
begin
  FSendTime := Value;
end;

{ TInfoType }

function TInfoType.AddDevId(devId: string): Boolean;
begin
  Result := False;
  if FDevIdList.IndexOf(devId) < 0 then
  begin
    FDevIdList.Add(devId);
    Result := True;
  end;
end;

function TInfoType.AddInfo(infoId: Integer): TInfo;
var
  i: Integer;
begin
  i := FInfoList.IndexOf(infoId);
  if i >= 0 then
    Result := InfoItem[i]
  else
  begin
    Result := TInfo.Create;
    Result.InfoId := infoId;
    Result.InfoTypeId := FInfoTypeId;
    FInfoList.AddData(infoId, Result);
  end;  
end;

procedure TInfoType.Clear;
var
  info: TInfo;
begin
  while FInfoList.Count > 0 do
  begin
    info := InfoItem[0];
    FInfoList.Delete(0);
    info.Free;
  end;
end;

constructor TInfoType.Create;
begin
  FInfoList := TIntegerList.Create;
  FDevIdList := TStringList.Create;
end;

function TInfoType.DelDevId(devId: string): Boolean;
var
  i: Integer;
begin
  Result := False;
  i := FDevIdList.IndexOf(devId);
  if i >= 0 then
  begin
    FDevIdList.Delete(i);
    Result := True;
  end;  
end;

procedure TInfoType.DeleteInfo(infoId: Integer);
var
  i: Integer;
  info: TInfo;
begin
  i := FInfoList.IndexOf(infoId);
  if i >= 0 then
  begin
    info := InfoItem[i];
    FInfoList.Delete(i);
    info.Free;
  end;
end;

destructor TInfoType.Destroy;
begin
  Clear;
  FInfoList.Free;
  FDevIdList.Free;
  inherited;
end;

function TInfoType.FindInfo(infoId: Integer): TInfo;
var
  i: Integer;
begin
  Result := nil;
  i := FInfoList.IndexOf(infoId);
  if i >= 0 then
    Result := InfoItem[i];
end;

function TInfoType.GetInfoCount: Integer;
begin
  Result := FInfoList.Count;
end;

function TInfoType.GetInfoItem(index: Integer): TInfo;
begin
  Result := TInfo(FInfoList.Datas[index]);
end;

procedure TInfoType.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TInfoType.SetInfoTypeId(const Value: Integer);
begin
  FInfoTypeId := Value;
end;

procedure TInfoType.SetInfoTypeName(const Value: string);
begin
  FInfoTypeName := Value;
end;

procedure TInfoType.SetMemo(const Value: string);
begin
  FMemo := Value;
end;

{ TInfoTypeManage }

function TInfoTypeManage.AddInfoType(id: Integer): TInfoType;
var
  i: Integer;
begin
  i := FList.IndexOf(id);
  if i < 0 then
  begin
    Result := TInfoType.Create;
    Result.Id := id;
    FList.AddData(id, Result);
  end
  else
  begin
    Result := Items[i];
  end;  
end;

procedure TInfoTypeManage.Clear;
var
  infoTpe: TInfoType;
begin
  while FList.Count > 0 do
  begin
    infoTpe := Items[0];
    FList.Delete(0);
    infoTpe.Free;
  end;
end;

constructor TInfoTypeManage.Create;
begin
  FList := TIntegerList.Create;
end;

procedure TInfoTypeManage.DeleteInfoType(id: Integer);
var
  i: Integer;
  infoType: TInfoType;
begin
  i := FList.IndexOf(id);
  if i >= 0 then
  begin
    infoType := Items[i];
    FList.Delete(i);
    infoType.Free;
  end;  
end;

procedure TInfoTypeManage.DeleteInfoTypeByTypeId(typeId: Integer);
var
  i: Integer;
  infoType: TInfoType;
begin
  for i := 0 to Count - 1 do
  begin
    infoType := Items[i];
    if infoType.InfoTypeId = typeId then
    begin
      FList.Delete(i);
      infoType.Free;
      Break;
    end;
  end;
end;

destructor TInfoTypeManage.Destroy;
begin
  Clear;
  FList.Free;
  inherited;
end;

function TInfoTypeManage.FindInfoType(id: Integer): TInfoType;
var
  i: Integer;
begin
  i := FList.IndexOf(id);
  if i >= 0 then
    Result := Items[i]
  else
    Result := nil;
end;

function TInfoTypeManage.FindInfoTypeByTypeId(typeId: Integer): TInfoType;
var
  i: Integer;
  infoType: TInfoType;
begin
  Result := nil;
  for i := 0 to Count - 1 do
  begin
    infoType := Items[i];
    if infoType.InfoTypeId = typeId then
    begin
      Result := infoType;
      Break;
    end;
  end;
end;

function TInfoTypeManage.FindInfoTypeByTypeName(
  typeName: string): TInfoType;
var
  i: Integer;
  infoType: TInfoType;
begin
  Result := nil;
  for i := 0 to Count - 1 do
  begin
    infoType := Items[i];
    if infoType.InfoTypeName = typeName then
    begin
      Result := infoType;
      Break;
    end;
  end;
end;

function TInfoTypeManage.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TInfoTypeManage.GetItem(index: Integer): TInfoType;
begin
  Result := TInfoType(Flist.Datas[index]);
end;

{ TAlarmInfoFromDev }

constructor TAlarmInfoFromDev.Create;
begin
  FSendGetPicCmdStatus := 0;
  FSendCallBackCmdStatus := 0;
  FSendTextCmdStatus := 0;
  FAlarmDealId := -1;
  FIsReqAlarmPos := False;
end;

destructor TAlarmInfoFromDev.Destroy;
begin

  inherited;
end;

procedure TAlarmInfoFromDev.SetAlarmDealId(const Value: Integer);
begin
  FAlarmDealId := Value;
end;

procedure TAlarmInfoFromDev.SetAlarmDealStatus(const Value: Integer);
begin
  FAlarmDealStatus := Value;
end;

procedure TAlarmInfoFromDev.SetAlarmIdManual(const Value: Integer);
begin
  FAlarmIdManual := Value;
end;

procedure TAlarmInfoFromDev.SetAlarmLat(const Value: Double);
begin
  FAlarmLat := Value;
end;

procedure TAlarmInfoFromDev.SetAlarmLong(const Value: Double);
begin
  FAlarmLong := Value;
end;

procedure TAlarmInfoFromDev.SetAlarmMemo(const Value: string);
begin
  FAlarmMemo := Value;
end;

procedure TAlarmInfoFromDev.SetAlarmPos(const Value: string);
begin
  FAlarmPos := Value;
end;

procedure TAlarmInfoFromDev.SetAlarmTime(const Value: TDateTime);
begin
  FAlarmTime := Value;
end;

procedure TAlarmInfoFromDev.SetAlarmType(const Value: Integer);
begin
  FAlarmType := Value;
end;

procedure TAlarmInfoFromDev.SetCarNo(const Value: string);
begin
  FCarNo := Value;
end;

procedure TAlarmInfoFromDev.SetDevID(const Value: string);
begin
  FDevId := Value;
end;

procedure TAlarmInfoFromDev.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TAlarmInfoFromDev.SetIsReqAlarmPos(const Value: Boolean);
begin
  FIsReqAlarmPos := Value;
end;

procedure TAlarmInfoFromDev.SetSendCallBackCmdStatus(const Value: Byte);
begin
  FSendCallBackCmdStatus := Value;
end;

procedure TAlarmInfoFromDev.SetSendGetPicCmdStatus(const Value: Byte);
begin
  FSendGetPicCmdStatus := Value;
end;

procedure TAlarmInfoFromDev.SetSendRemoveAlarmCmdStatus(const Value: Byte);
begin
  FSendRemoveAlarmCmdStatus := Value;
end;

procedure TAlarmInfoFromDev.SetSendTextCmdStatus(const Value: Byte);
begin
  FSendTextCmdStatus := Value;
end;

{ TAlarmINfoFromDevManage }

function TAlarmINfoFromDevManage.Add(id: Integer): TAlarmInfoFromDev;
var
  i: Integer;
begin
  if (id = -1) then
  begin
    Result := TAlarmInfoFromDev.Create;
    Result.Id := FMaxId + 1;
    FMaxId := FMaxId + 1;
    FList.AddData(Result.Id, Result);
  end
  else
  begin
    i := FList.IndexOf(id);
    if i < 0 then
    begin
      Result := TAlarmInfoFromDev.Create;
      Result.Id := id;
      FList.AddData(id, Result);
    end
    else
    begin
      Result := Items[i];
    end;    
  end;  
end;

procedure TAlarmINfoFromDevManage.Clear;
var
  alarm: TAlarmInfoFromDev;
begin
  while FList.Count > 0 do
  begin
    alarm := Items[0];
    FList.Delete(0);
    alarm.Free;
  end;
end;

constructor TAlarmINfoFromDevManage.Create;
begin
  FList := TIntegerList.Create;
  FMaxId := 0;
end;

procedure TAlarmINfoFromDevManage.Delete(id: Integer);
var
  i: Integer;
  alarm: TAlarmInfoFromDev;
begin
  i := FList.IndexOf(id);
  if i >= 0 then
  begin
    alarm := Items[i];
    FList.Delete(i);
    alarm.Free;
  end;  
end;

destructor TAlarmINfoFromDevManage.Destroy;
begin
  Clear;
  FList.Free;
  inherited;
end;

function TAlarmINfoFromDevManage.Find(id: Integer): TAlarmInfoFromDev;
var
  i: Integer;
begin
  i := FList.IndexOf(id);
  if i >= 0 then
  begin
    Result := Items[i];
  end
  else
    Result := nil;
end;

function TAlarmINfoFromDevManage.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TAlarmINfoFromDevManage.GetItem(
  index: Integer): TAlarmInfoFromDev;
begin
  Result := TAlarmInfoFromDev(FList.Datas[index]);
end;

procedure TAlarmINfoFromDevManage.SetIsEmergencyHappened(
  const Value: Boolean);
begin
  FIsEmergencyHappened := Value;
end;

function TDeviceManage.FindDevByZBH(const AZBH: string): TDevice;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
  begin
    if Items[i].Car.ZBH = AZBH then
    begin
      Result := Items[i];
      Break;
    end;
  end;
end;

procedure TDeviceManage.SetOnCarIOAreaOnTimeAlarmEvent(
  const Value: TCarIOAreaOnTimeAlarmEvent);
begin
  FOnCarIOAreaOnTimeAlarmEvent := Value;
end;

procedure TDeviceManage.SetOnCarAccOffMoveAlarmEvent(
  const Value: TCarAccOffMoveAlarmEvent);
begin
  FOnCarAccOffMoveAlarmEvent := Value;
end;

{ TAlarmSupervise }

constructor TAlarmSupervise.Create;
begin
  FAlarmDealStatus := -1;
end;

destructor TAlarmSupervise.Destroy;
begin

  inherited;
end;

procedure TAlarmSupervise.SetAlarmDeadLineTime(const Value: TDateTime);
begin
  FAlarmDeadLineTime := Value;
end;

procedure TAlarmSupervise.setAlarmDealStatus(const Value: Integer);
begin
  FAlarmDealStatus := Value;
end;

procedure TAlarmSupervise.setAlarmEmail(const Value: string);
begin
  FAlarmEmail := Value;
end;

procedure TAlarmSupervise.SetAlarmId(const Value: LongWord);
begin
  FAlarmId := Value;
end;

procedure TAlarmSupervise.setAlarmLevel(const Value: Byte);
begin
  FAlarmLevel := Value;
end;

procedure TAlarmSupervise.setAlarmSrc(const Value: Byte);
begin
  FAlarmSrc := Value;
end;

procedure TAlarmSupervise.setAlarmTel(const Value: string);
begin
  FAlarmTel := Value;
end;

procedure TAlarmSupervise.SetAlarmTime(const Value: TDateTime);
begin
  FAlarmTime := Value;
end;

procedure TAlarmSupervise.setAlarmType(const Value: Byte);
begin
  FAlarmType := Value;
end;

procedure TAlarmSupervise.SetCarCpColor(const Value: Byte);
begin
  FCarCpColor := Value;
end;

procedure TAlarmSupervise.SetCarNo(const Value: string);
begin
  FCarNo := Value;
end;

procedure TAlarmSupervise.setDev(const Value: TDevice);
begin
  FDev := Value;
end;

procedure TAlarmSupervise.SetDevId(const Value: string);
begin
  FDevId := Value;
end;

procedure TAlarmSupervise.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TAlarmSupervise.setSupervisor(const Value: String);
begin
  FAlarmSupervisor := Value;
end;

{ TAlarmSuperviseManage }

function TAlarmSuperviseManage.Add(Id: Integer): TAlarmSupervise;
var
  i: Integer;
begin
  if (Id = - 1) then
  begin
    Result := TAlarmSupervise.Create;
    Result.Id := FMaxId + 1;
    FMaxId := FMaxId + 1;
    FList.AddData(Result.Id, Result);
  end
  else
  begin
    i := FList.IndexOf(Id);
    if i < 0 then
    begin
      Result := TAlarmSupervise.Create;
      Result.Id := Id;
      FList.AddData(Id, Result)
    end
    else
      Result := Items[i];
  end;
end;

procedure TAlarmSuperviseManage.Clear;
begin
  while FList.Count > 0 do
    Delete(Items[0].Id);
end;

constructor TAlarmSuperviseManage.Create;
begin
  FList := TIntegerList.Create;
  FMaxId := 0;
end;

procedure TAlarmSuperviseManage.Delete(Id: Integer);
var
  i: Integer;
  alarm: TAlarmSupervise;
begin
  i := FList.IndexOf(Id);
  if i >= 0 then
  begin
    alarm := Items[i];
    FList.Delete(i);
    alarm.Free;
  end;
end;

destructor TAlarmSuperviseManage.Destroy;
begin
  Clear;
  FList.Free;
  inherited;
end;

function TAlarmSuperviseManage.Find(Id: Integer): TAlarmSupervise;
var
  i: Integer;
begin
  Result := nil;
  i := Flist.IndexOf(Id);
  if i >= 0 then
    Result := Items[i];
end;

function TAlarmSuperviseManage.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TAlarmSuperviseManage.GetItem(Index: Integer): TAlarmSupervise;
begin
  Result := TAlarmSupervise(FList.Datas[Index]);
end;

{ TGovInfoManage }

function TGovInfoManage.Add(Id: Integer): TGovInfo;
var
  i: Integer;
begin
  if (Id = - 1) then
  begin
    Result := TGovInfo.Create;
    Result.Id := FMinId - 1;
    FMinId := FMinId - 1;
    FList.AddData(Result.Id, Result);
  end
  else
  begin
    i := FList.IndexOf(Id);
    if i < 0 then
    begin
      Result := TGovInfo.Create;
      Result.Id := Id;
      FList.AddData(Id, Result)
    end
    else
      Result := Items[i];
  end;
end;

procedure TGovInfoManage.Clear;
begin
  while FList.Count > 0 do
    Delete(Items[0].Id);
end;

constructor TGovInfoManage.Create;
begin
  FList := TIntegerList.Create;
  FMinId := 0;
end;

procedure TGovInfoManage.Delete(Id: Integer);
var
  i: Integer;
  govInfo: TGovInfo;
begin
  i := FList.IndexOf(Id);
  if i >= 0 then
  begin
    govInfo := Items[i];
    FList.Delete(i);
    govInfo.Free;
  end;
end;

destructor TGovInfoManage.Destroy;
begin
  Clear;
  Flist.Free;
  inherited;
end;

function TGovInfoManage.Find(Id: Integer): TGovInfo;
var
  i: Integer;
begin
  Result := nil;
  i := Flist.IndexOf(Id);
  if i >= 0 then
    Result := Items[i];
end;

function TGovInfoManage.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TGovInfoManage.GetItem(index: Integer): TGovInfo;
begin
  Result := TGovInfo(FList.Datas[index]);
end;

{ TGovInfo }

constructor TGovInfo.Create;
begin

end;

destructor TGovInfo.Destroy;
begin

  inherited;
end;

procedure TGovInfo.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TGovInfo.SetMsg(const Value: string);
begin
  FMsg := Value;
end;

procedure TGovInfo.SetObjId(const Value: TGovObjID);
begin
  FObjId := Value;
end;

procedure TGovInfo.SetObjType(const Value: Byte);
begin
  FObjType := Value;
end;

procedure TGovInfo.setSrcCmdId(const Value: Integer);
begin
  FSrcCmdId := Value;
end;

function TDeviceManage.AddAGovDev(car: TCar): TDevice;
var
  newDevId: string;
begin
  Result := TDevice.Create;
  Result.Car := car;
  FMaxId := FMaxId + 1;
  newDevId := IntToStr(FMaxId);
  FillStr(newDevId, 9, '0');
  newDevId := '200' + newDevId;
  Result.Id := newDevId;
  Result.IdStr := newDevId;
  FList.AddObject(Result.Id, Result);
end;

function TDeviceManage.FindDevFromCarNoFuzzy(const ANo: string): TDevice;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
    if Pos(ANo, Items[i].FCar.No) > 0 then
    begin
      Result := Items[i];
      break;
    end;
end;

function TDeviceManage.FindDevFromSimnoFuzzy(
  const ASimno: string): TDevice;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
    if Pos(ASimno, Items[i].SimNo) > 0 then
    begin
      Result := Items[i];
      break;
    end;
end;

function TDeviceManage.FindDevByZBHFuzzy(const AZBH: string): TDevice;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
  begin
    if Pos(AZBH, Items[i].Car.ZBH) > 0 then
    begin
      Result := Items[i];
      Break;
    end;
  end;
end;

function TDeviceManage.findByDevIdFuzzy(
  const ATargetIDStr: string): TDevice;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
  begin
    if Pos(ATargetIDStr, Items[i].Id) > 0 then
    begin
      Result := Items[i];
      Break;
    end;
  end;
end;

function TDeviceManage.FindDevByDriverNameFuzzy(
  const driverName: string): TDevice;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
  begin
    if Pos(driverName, Items[i].Login_DriverName) > 0 then
    begin
      Result := Items[i];
      Break;
    end;
  end;
end;

function TDriverManage.GetCarIdByDriverName(driverName: string): Integer;
var
  i: integer;
begin
  Result := -1;
  for i := 0 to Self.Count - 1 do
  begin
    if FDriverAry[i].Name = driverName then
    begin
      Result := FDriverAry[i].CarID;
      exit;
    end;
  end;
end;

function TDriverManage.GetCarIdByDriverNameFuzzy(
  driverName: string): Integer;
var
  i: integer;
begin
  Result := -1;
  for i := 0 to Self.Count - 1 do
  begin
    if Pos(driverName, FDriverAry[i].Name) > 0 then
    begin
      Result := FDriverAry[i].CarID;
      exit;
    end;
  end;
end;

function TDeviceManage.FindDevByCarId(const CarId: Integer): TDevice;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
  begin
    if CarId = Items[i].Car.id then
    begin
      Result := Items[i];
      Break;
    end;
  end;
end;

function TDeviceManage.FindDevByDriverName(
  const driverName: string): TDevice;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
  begin
    if driverName = Items[i].Login_DriverName then
    begin
      Result := Items[i];
      Break;
    end;
  end;
end;

{ TMyHintWindow }


constructor TMyHintWindow.Create(aOwner: TComponent);
begin
  inherited;
  FHintWindow := THintWindowClass.Create(nil);
  FHintWindow.Color := $00D8D8AD;
  FHintTimer := TTimer.Create(nil);
  FHintTimer.Enabled := False;
  FHintTimer.OnTimer := HideHint;
  FHintTimer.Interval := 1500;
end;

destructor TMyHintWindow.Destroy;
begin
  FHintTimer.Enabled := False;
  FHintTimer.Free;
  FHintWindow.Free;
  inherited;
end;

procedure TMyHintWindow.HideHint(Sender: TObject);
begin
  TTimer(Sender).Enabled := False;
  showwindow(FHintWindow.Handle, SW_HIDE);
end;

procedure TMyHintWindow.SetHint(const Value: string);
begin
  FHint := Value;
end;

procedure TMyHintWindow.ShowHint(aHint: string; aComponent: TControl);
var
  pt: TPoint;
  rect: TRect;
begin
  if aHint <> '' then
  begin
    if not Windows.IsWindowVisible(FHintWindow.Handle) or (FHintWindow.Caption <> aHint) then
    begin
      rect := FHintWindow.CalcHintRect(Screen.Width, aHint, nil);
      pt.X := aComponent.Left;
      pt.Y := aComponent.Top + aComponent.Height - 3;
      pt := aComponent.Parent.ClientToScreen(pt);
      Inc(rect.Left,pt.X);
      Inc(rect.Right,pt.X);
      Inc(rect.Top,pt.Y);
      Inc(rect.Bottom,pt.Y);
      FHintWindow.ActivateHint(rect,AHint);
      FHintTimer.Enabled:=true;
    end;
  end;
end;

{ TCar }

constructor TCar.Create;
begin

end;

destructor TCar.Destroy;
begin

  inherited;
end;

procedure TCar.SetCarKind(const Value: string);
begin
  FCarKind := Value;
end;

procedure TCar.SetCarShipName(const Value: string);
begin
  FCarShipName := Value;
end;

procedure TCar.SetCarType(const Value: string);
begin
  FCarType := Value;
end;

procedure TCar.SetChePaiColor(const Value: Integer);
begin
  FChePaiColor := Value;
end;

procedure TCar.SetCPColorStr(const Value: string);
begin
  FCPColorStr := Value;
end;

procedure TCar.SetId(const Value: integer);
begin
  FId := Value;
end;

procedure TCar.SetIndustryName(const Value: string);
begin
  FIndustryName := Value;
end;

procedure TCar.SetIndustryNo(const Value: string);
begin
  FIndustryNo := Value;
end;

procedure TCar.SetMemo(const Value: string);
begin
  FMemo := Value;
end;

procedure TCar.SetNo(const Value: string);
begin
  FNo := Value;
end;

procedure TCar.SetResId(const Value: integer);
begin
  FResId := Value;
end;

procedure TCar.SetResIndex(const Value: integer);
begin
  FResIndex := Value;
end;

procedure TCar.SetSetupTime(const Value: string);
begin
  FSetupTime := Value;
end;

procedure TCar.SetShengId(const Value: Integer);
begin
  FShengId := Value;
end;

procedure TCar.SetShengName(const Value: string);
begin
  FShengName := Value;
end;

procedure TCar.SetShiId(const Value: Integer);
begin
  FShiId := Value;
end;

procedure TCar.SetShiName(const Value: string);
begin
  FShiName := Value;
end;

procedure TCar.SetStat(const Value: integer);
begin
  FStat := Value;
end;

procedure TCar.SetZBH(const Value: String);
begin
  FZBH := Value;
end;

procedure TDeviceManage.SetOnDevOnLineStatusChanged(
  const Value: TDevOnLineStatusChanged);
begin
  FOnDevOnLineStatusChanged := Value;
end;

function TDeviceManage.AddNewDevice(const ATargetIDStr: string): TDevice;
var
  i: integer;
  sc: Integer;
begin
  sc := FList.Count;
  i := FList.AddObject(ATargetIDStr, nil);
  if FList.Count > sc then
  begin
    Result := TDevice.Create;
    Result.Id := ATargetIDStr;
    Result.IdStr := ATargetIDStr;
    FList.Objects[i] := Result;
  end
  else
    Result := TDevice(FList.Objects[i]);
end;

procedure TDeviceManage.SetAllDevIsOffLine;
var
  i: Integer;
begin
  for i := 0 to FList.Count - 1 do
  begin
    TDevice(FList.Objects[i]).isOnline := False;
  end;  
end;

{ TNoticeManage }

function TNoticeManage.Add(Id: Integer): TNotice;
var
  i: Integer;
begin
  i := FList.IndexOf(Id);
  if i < 0 then
  begin
    Result := TNotice.Create;
    Result.Id := Id;
    FList.AddData(Id, Result);
  end
  else
  begin
    Result := Items[i];
  end;
end;

procedure TNoticeManage.Clear;
begin
  while FList.Count > 0 do
    Delete(Items[0].Id);
end;

constructor TNoticeManage.Create;
begin
  FList := TIntegerList.Create;
end;

procedure TNoticeManage.Delete(Id: Integer);
var
  notice: TNotice;
  i: Integer;
begin
  i := FList.IndexOf(Id);
  if i >= 0 then
  begin
    notice := Items[i];
    FList.Delete(i);
    notice.Free;
  end;
end;

destructor TNoticeManage.Destroy;
begin
  Clear;
  FList.Free;
  inherited;
end;

function TNoticeManage.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TNoticeManage.GetItem(index: Integer): TNotice;
begin
  Result := nil;
  if (index >= 0) and (index < FList.Count) then
    Result := TNotice(FList.Datas[index]);
end;

{ TNotice }

constructor TNotice.Create;
begin

end;

destructor TNotice.Destroy;
begin

  inherited;
end;

procedure TNotice.SetContent(const Value: string);
begin
  FContent := Value;
end;

procedure TNotice.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TNotice.SetIsRead(const Value: Integer);
begin
  FIsRead := Value;
end;

procedure TNotice.SetSendTime(const Value: TDateTime);
begin
  FSendTime := Value;
end;

procedure TNotice.SetTitile(const Value: string);
begin
  FTitle := Value;
end;

procedure TDeviceManage.SetDevOnFatigueAlarm(
  const Value: TDevOnFatigueAlarm);
begin
  FDevOnFatigueAlarm := Value;
end;

{ TTerminalUpgradeVer }

constructor TTerminalUpgradeVer.Create;
begin

end;

destructor TTerminalUpgradeVer.Destroy;
begin

  inherited;
end;

procedure TTerminalUpgradeVer.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TTerminalUpgradeVer.SetTerFactId(const Value: string);
begin
  FTerFactId := Value;
end;

procedure TTerminalUpgradeVer.SetTerFactName(const Value: string);
begin
  FTerFactName := Value;
end;

procedure TTerminalUpgradeVer.SetUpgradeTypeId(const Value: Byte);
begin
  FUpgradeTypeId := Value;
end;

procedure TTerminalUpgradeVer.SetUpgradeTypeName(const Value: string);
begin
  FUpgradeTypeName := Value;
end;

procedure TTerminalUpgradeVer.SetVer(const Value: string);
begin
  FVer := Value;
end;

{ TTerminalUpgradeVerManage }

function TTerminalUpgradeVerManage.Add(Id: Integer): TTerminalUpgradeVer;
var
  i: Integer;
begin
  i := FList.IndexOf(Id);
  if i < 0 then
  begin
    Result := TTerminalUpgradeVer.Create;
    Result.Id := Id;
    FList.AddData(Id, Result);
  end
  else
  begin
    Result := Items[i];
  end;
end;

procedure TTerminalUpgradeVerManage.Clear;
begin
  while FList.Count > 0 do
    Delete(Items[0].Id);
end;

constructor TTerminalUpgradeVerManage.Create;
begin
  FList := TIntegerList.Create;
end;

procedure TTerminalUpgradeVerManage.Delete(Id: Integer);
var
  obj: TTerminalUpgradeVer;
  i: Integer;
begin
  i := FList.IndexOf(Id);
  if i >= 0 then
  begin
    obj := Items[i];
    FList.Delete(i);
    obj.Free;
  end;
end;

destructor TTerminalUpgradeVerManage.Destroy;
begin
  Clear;
  FList.Free;
  inherited;
end;

function TTerminalUpgradeVerManage.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TTerminalUpgradeVerManage.GetItem(
  index: Integer): TTerminalUpgradeVer;
begin
  Result := nil;
  if (index >= 0) and (index < FList.Count) then
    Result := TTerminalUpgradeVer(FList.Datas[index]);
end;

end.

