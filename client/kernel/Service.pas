// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://192.168.19.19:7005/Service.asmx?wsdl
// Encoding : utf-8
// Version  : 1.0
// (2009-11-7 9:18:43 - 1.33.2.5)
// ************************************************************************ //

unit Service;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:int             - "http://www.w3.org/2001/XMLSchema"
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:double          - "http://www.w3.org/2001/XMLSchema"
  // !:long            - "http://www.w3.org/2001/XMLSchema"
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"
  // !:float           - "http://www.w3.org/2001/XMLSchema"
  // !:base64Binary    - "http://www.w3.org/2001/XMLSchema"

  AuthHeader           = class;                 { "http://tempuri.org/"[H] }
  BlackVer             = class;                 { "http://tempuri.org/" }
  PicInfo              = class;                 { "http://tempuri.org/" }
  SoundRecordData      = class;                 { "http://tempuri.org/" }



  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  AuthHeader = class(TSOAPHeader)
  private
    FUsername: WideString;
    FPassword: WideString;
  published
    property Username: WideString read FUsername write FUsername;
    property Password: WideString read FPassword write FPassword;
  end;

  ArrayOfString = array of WideString;          { "http://tempuri.org/" }
  ArrayOfInt = array of Integer;                { "http://tempuri.org/" }


  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  BlackVer = class(TRemotable)
  private
    FVer: Integer;
    FAddCount: Integer;
    FDelCount: Integer;
  published
    property Ver: Integer read FVer write FVer;
    property AddCount: Integer read FAddCount write FAddCount;
    property DelCount: Integer read FDelCount write FDelCount;
  end;



  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  PicInfo = class(TRemotable)
   private
    FPhotoId: Integer;
    FFact_Id: Integer;
    FDev_id: WideString;
    FPhotoReasonID: Integer;
    FGpsTime: WideString;
    Flongitude: Single;
    Flatitude: Single;
    FtakeBeginTime: WideString;
    FtakeEndTime: WideString;
    FPhotoSize: Integer;
    FPhoto: TByteDynArray;
    FPhotoType: Integer;
    FpicIndex: Integer;
    FPhotoMeasure: Integer;
    FCameraNo: Integer;
    FPhotoFileIdInMCU: Integer;
    FTaxiRunId: Integer;
    Fcar_No: WideString;
    Fgroup_Name: WideString;
    Falarmflag: Integer;
    Fstate: Integer;
    Fspeed: Single;
    Forientation: Integer;
    Fheight: Integer;
  published
    property PhotoId: Integer read FPhotoId write FPhotoId;
    property Fact_Id: Integer read FFact_Id write FFact_Id;
    property Dev_id: WideString read FDev_id write FDev_id;
    property PhotoReasonID: Integer read FPhotoReasonID write FPhotoReasonID;
    property GpsTime: WideString read FGpsTime write FGpsTime;
    property longitude: Single read Flongitude write Flongitude;
    property latitude: Single read Flatitude write Flatitude;
    property takeBeginTime: WideString read FtakeBeginTime write FtakeBeginTime;
    property takeEndTime: WideString read FtakeEndTime write FtakeEndTime;
    property PhotoSize: Integer read FPhotoSize write FPhotoSize;
    property Photo: TByteDynArray read FPhoto write FPhoto;
    property PhotoType: Integer read FPhotoType write FPhotoType;
    property picIndex: Integer read FpicIndex write FpicIndex;
    property PhotoMeasure: Integer read FPhotoMeasure write FPhotoMeasure;
    property CameraNo: Integer read FCameraNo write FCameraNo;
    property PhotoFileIdInMCU: Integer read FPhotoFileIdInMCU write FPhotoFileIdInMCU;
    property TaxiRunId: Integer read FTaxiRunId write FTaxiRunId;
    property car_No: WideString read Fcar_No write Fcar_No;
    property group_Name: WideString read Fgroup_Name write Fgroup_Name;
    property alarmflag: Integer read Falarmflag write Falarmflag;
    property state: Integer read Fstate write Fstate;
    property speed: Single read Fspeed write Fspeed;
    property orientation: Integer read Forientation write Forientation;
    property height: Integer read Fheight write Fheight;
  end;

  ArrayOfPicInfo = array of PicInfo;            { "http://tempuri.org/" }


  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  SoundRecordData = class(TRemotable)
  private
    FSoundData: TByteDynArray;
    FCodeWay: Integer;
  published
    property SoundData: TByteDynArray read FSoundData write FSoundData;
    property CodeWay: Integer read FCodeWay write FCodeWay;
  end;


  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // soapAction: http://tempuri.org/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // binding   : ServiceSoap
  // service   : Service
  // port      : ServiceSoap
  // URL       : http://localhost:6976/VGpsWebServiceV3/Service.asmx
  // ************************************************************************ //
  ServiceSoap = interface(IInvokable)
  ['{77573149-9C57-FA51-F11F-EFD527C91BD9}']
    function  ModifyASuperCargo(const SuperCargo_id: Integer; const SUPERCARGO_NAME: WideString; const SUPERCARGO_TEL: WideString; const SUPERCARGO_ADDR: WideString; const SUPERCARGO_SERVENUM: WideString; const ISSUEORG: WideString): WideString; stdcall;
    function  DeleteASuperCargo(const SuperCargo_id: Integer): WideString; stdcall;
    function  AddNewAlarmInfo_OutFence(const dev_Id: WideString; const alarmType: Integer; const gpsTime: WideString; const latitude: Single; const longitude: Single; const speed: Integer; const overspeedtype: Integer; const OVERSPEEDAREAID: Integer; const AREAALARMTYPE: Integer; const AREAALARMID: Integer; 
                                       const AREAALARMSTATE: Integer; const OVERTIMELINEID: Integer; const OVERTIMELINETIMER: Integer; const OVERTIMELINESTATE: Integer): Integer; stdcall;
    function  Query_DevUpEvent_count(const fromTime: WideString; const toTime: WideString; const dev_Id: WideString; const car_no: WideString; const sim_no: WideString; const group_Id: Integer; const groupLists: WideString; const eventDesc: WideString): Integer; stdcall;
    function  Query_DevUpEvent_Page(const fromTime: WideString; const toTime: WideString; const dev_Id: WideString; const car_no: WideString; const sim_no: WideString; const group_Id: Integer; const groupLists: WideString; const eventDesc: WideString; const PageSize: Integer; const CurrPageIndex: Integer
                                    ): WideString; stdcall;
    function  Query_DevUpDZYD_count(const fromTime: WideString; const toTime: WideString; const dev_Id: WideString; const car_no: WideString; const sim_no: WideString; const group_Id: Integer; const groupLists: WideString): Integer; stdcall;
    function  Query_DevUpDZYD_Page(const fromTime: WideString; const toTime: WideString; const dev_Id: WideString; const car_no: WideString; const sim_no: WideString; const group_Id: Integer; const groupLists: WideString; const PageSize: Integer; const CurrPageIndex: Integer): WideString; stdcall;
    function  AddNewAlarmDeal(const ALARMDEVID: WideString; const ALARMTYPE: Integer; const ALARMGPSTIME: WideString; const ALARMDEALSTATUS: Integer; const ALARMDEALTIME: WideString; const ALARMTYPE_PT: Integer): WideString; stdcall;
    function  ModifyAlarmDeal_DealOk(const Id: Integer; const ALARMDEALSTATUS: Integer; const ALARMDEALTIME: WideString): WideString; stdcall;
    function  ModifyAlarmDeal_DealEnd(const Id: Integer; const ALARMDEALSTATUS: Integer; const ALARMDEALTIME: WideString; const ALARMPERSON: WideString; const ALARMPERSONTEL: WideString; const ALARMPOS: WideString; const ALARMDEALPROC: WideString; const ALARMDEALRESULT: WideString): WideString; stdcall;
    function  ModifyAInfo(const id: Integer; const typeid: Integer; const infoContent: WideString; const sendTime: WideString; const memo: WideString): WideString; stdcall;
    function  DeleteAInfo(const id: Integer): WideString; stdcall;
    function  QueryDev_InfoDevList(const queryStartTime: WideString; const queryEndTime: WideString): WideString; stdcall;
    function  QueryInfoDevList: WideString; stdcall;
    function  AddNewInfoDev(const typeId: Integer; const Dev_Id: WideString; const askTime: WideString): Integer; stdcall;
    function  DeleteAInfoDev(const typeId: Integer; const Dev_Id: WideString): WideString; stdcall;
    function  Query_Vir_DriverOverTimeOfTwoDay(const dev_Id: WideString; const car_no: WideString; const driverName: WideString; const begin_StartTime: WideString; const end_StartTime: WideString; const groupId: Integer; const groupLists: WideString): WideString; stdcall;
    function  Query_Vir_DriverOverTimeOfTwoDay_Count(const dev_Id: WideString; const car_no: WideString; const driverName: WideString; const begin_StartTime: WideString; const end_StartTime: WideString; const groupId: Integer; const groupLists: WideString): Integer; stdcall;
    function  Query_Vir_DriverOverTimeOfTwoDay_Page(const dev_Id: WideString; const car_no: WideString; const driverName: WideString; const begin_StartTime: WideString; const end_StartTime: WideString; const groupId: Integer; const groupLists: WideString; const PageSize: Integer; const CurrPageIndex: Integer): WideString; stdcall;
    function  Query_Vir_TotalMileage(const dev_Id: WideString; const car_no: WideString; const flag: Integer; const begin_MTime: WideString; const end_MTime: WideString; const groupId: Integer; const groupLists: WideString): WideString; stdcall;
    function  Query_Vir_TotalMileage_Count(const dev_Id: WideString; const car_no: WideString; const flag: Integer; const begin_MTime: WideString; const end_MTime: WideString; const groupId: Integer; const groupLists: WideString): Integer; stdcall;
    function  Query_Vir_TotalMileage_Page(const dev_Id: WideString; const car_no: WideString; const flag: Integer; const begin_MTime: WideString; const end_MTime: WideString; const groupId: Integer; const groupLists: WideString; const PageSize: Integer; const CurrPageIndex: Integer): WideString; stdcall;
    function  Query_Vir_AccidentMaster(const dev_Id: WideString; const car_no: WideString; const driverName: WideString; const begin_EndTime: WideString; const end_EndTime: WideString; const groupId: Integer; const groupLists: WideString): WideString; stdcall;
    function  Query_Vir_AccidentMaster_Count(const dev_Id: WideString; const car_no: WideString; const driverName: WideString; const begin_EndTime: WideString; const end_EndTime: WideString; const groupId: Integer; const groupLists: WideString): Integer; stdcall;
    function  Query_Vir_AccidentMaster_Page(const dev_Id: WideString; const car_no: WideString; const driverName: WideString; const begin_EndTime: WideString; const end_EndTime: WideString; const groupId: Integer; const groupLists: WideString; const PageSize: Integer; const CurrPageIndex: Integer): WideString; stdcall;
    function  Query_Vir_AccidentDetail(const vaid: Integer): WideString; stdcall;
    function  Query_Vir_SpeedMaster_Count(const dev_Id: WideString; const car_no: WideString; const begin_StartTime: WideString; const end_StartTime: WideString; const groupId: Integer; const groupLists: WideString): Integer; stdcall;
    function  Query_Vir_SpeedMaster_Page(const dev_Id: WideString; const car_no: WideString; const begin_StartTime: WideString; const end_StartTime: WideString; const groupId: Integer; const groupLists: WideString; const PageSize: Integer; const CurrPageIndex: Integer): WideString; stdcall;
    function  Query_Vir_SpeedDetail(const vsid: Integer): WideString; stdcall;
    function  Query_Vir_DevBaseInfo_count(const dev_Id: WideString; const car_no: WideString; const sim_no: WideString; const groupId: Integer; const groupLists: WideString): Integer; stdcall;
    function  Query_Vir_DevBaseInfo_Page(const dev_Id: WideString; const car_no: WideString; const sim_no: WideString; const groupId: Integer; const groupLists: WideString; const PageSize: Integer; const CurrPageIndex: Integer): WideString; stdcall;
    function  QuerySimCardList(const sim_no: WideString; const sim_business: WideString): WideString; stdcall;
    function  QuerySimCardList_Count(const sim_no: WideString; const sim_business: WideString): Integer; stdcall;
    function  QuerySimCardList_Page(const sim_no: WideString; const sim_business: WideString; const PageSize: Integer; const CurrPageIndex: Integer): WideString; stdcall;
    function  AddNewSimCard(const sim_no: WideString; const sim_city: WideString; const sim_business: WideString; const memo: WideString): Integer; stdcall;
    function  DeleteSimCardInfo(const simCard_ID: Integer): WideString; stdcall;
    function  ModifySimCardInfo(const simCard_ID: Integer; const sim_no: WideString; const sim_city: WideString; const sim_business: WideString; const memo: WideString): WideString; stdcall;
    function  QueryTerminalTypeList: WideString; stdcall;
    function  AddNewTerminalType(const terminalType_name: WideString): Integer; stdcall;
    function  DeleteTerminalTypeInfo(const TERMINALTYPE_ID: Integer): WideString; stdcall;
    function  ModifyTerminalTypeInfo(const TERMINALTYPE_ID: Integer; const terminalType_name: WideString): WideString; stdcall;
    function  QueryTerminalModelList: WideString; stdcall;
    function  AddNewTerminalModel(const terminalModel_name: WideString): Integer; stdcall;
    function  DeleteTerminalModelInfo(const TERMINALModel_ID: Integer): WideString; stdcall;
    function  ModifyTerminalModelInfo(const TERMINALModel_ID: Integer; const terminalModel_name: WideString): WideString; stdcall;
    function  JudgeCarIsUsed(const car_Id: Integer): WideString; stdcall;
    function  QueryShengInfoList: WideString; stdcall;
    function  AddNewShengInfo(const shengId: Integer; const Shengname: WideString): Integer; stdcall;
    function  DeleteShengInfo(const ID: Integer): WideString; stdcall;
    function  ModifyShengInfo(const Id: Integer; const ShengID: Integer; const Shengname: WideString): WideString; stdcall;
    function  QueryShiInfoList(const sheng_Id: Integer): WideString; stdcall;
    function  AddNewShiInfo(const ShiId: Integer; const Shiname: WideString; const SHENG_ID: Integer): Integer; stdcall;
    function  DeleteShiInfo(const ID: Integer): WideString; stdcall;
    function  ModifyShiInfo(const Id: Integer; const ShiID: Integer; const Shiname: WideString; const SHENG_ID: Integer): WideString; stdcall;
    function  JudgeSuperCargoServerNumIsExist(const SUPERCARGO_SERVENUM: WideString): WideString; stdcall;
    function  JudgeCarInfoIsExist(const car_No: WideString): WideString; stdcall;
    function  JudgeGpsDevInfoIsExist(const car_Id: Integer; const dev_Id: WideString): WideString; stdcall;
    function  JudgeSimCardInfoIsExist(const sim_no: WideString): WideString; stdcall;
    function  JudgeUserInfoIsExist(const username: WideString): WideString; stdcall;
    function  JudgeDriverInfoIsExist(const DRIVER_DRIVERINGNUM: WideString; const DRIVER_IDENTITYCARD: WideString; const DRIVERSERVENUM: WideString; const DRIVER_NO: WideString): WideString; stdcall;
    function  QueryCarTypeCodeList: WideString; stdcall;
    function  AddNewCarTypeCode(const CarTypeCode: WideString; const CarTypeCodeName: WideString): Integer; stdcall;
    function  DeleteCarTypeCodeInfo(const CarTypeCode_ID: Integer): WideString; stdcall;
    function  ModifyCarTypeCodeInfo(const CarTypeCode_ID: Integer; const cartypeCode: WideString; const CarTypeCodeName: WideString): WideString; stdcall;
    function  QueryCarShipTypeCodeList: WideString; stdcall;
    function  AddNewCarShipTypeCode(const CarShipTypeCode: WideString; const CarShipTypeCodeName: WideString): Integer; stdcall;
    function  DeleteCarShipTypeCodeInfo(const CarShipTypeCode_ID: Integer): WideString; stdcall;
    function  ModifyCarShipTypeCodeInfo(const CarShipTypeCode_ID: Integer; const CarShipTypeCode: WideString; const CarShipTypeCodeName: WideString): WideString; stdcall;
    function  LoadDevInfo_ForBs: WideString; stdcall;
    function  LoadDevInfo_ForCs: WideString; stdcall;
    function  QueryRunLineList_count(const runlineName: WideString; const runlineAliasName: WideString; const fromAddr: WideString; const endAddr: WideString; const from_fromTime: WideString; const end_fromTime: WideString; const state: Integer; const transportType: Integer): Integer; stdcall;
    function  QueryRunLineList_page(const runlineName: WideString; const runlineAliasName: WideString; const fromAddr: WideString; const endAddr: WideString; const from_fromTime: WideString; const end_fromTime: WideString; const state: Integer; const transportType: Integer; const PageSize: Integer; const CurrPageIndex: Integer
                                    ): WideString; stdcall;
    function  AddNewRunLine(const RunLineName: WideString; const RunLineCnt: Integer; const RunlineMemo: WideString; const RUNLINEALIASNAME: WideString; const ASKCOMPANY: WideString; const ASKPERSON: WideString; const ASKPERSONTEL: WideString; const RUNLINEDESC: WideString; const RUNLINEOVER: WideString; const RUNLINESUPERBLOCK: WideString; 
                            const FROMADDR: WideString; const ENDADDR: WideString; const FROMTIME: WideString; const ENDTIME: WideString; const YXQ: WideString; const STATE: Integer; const ASKTIME: WideString; const ACCEPTTIME: WideString; const APPROVALTIME: WideString; 
                            const DRIVER_INFO: WideString; const TRANSPORTTYPE: Integer; const SUPERCARGOINFO: WideString; const CARGO_NAME: WideString; const CARGO_TONNAGE: WideString; const BUSSINESS_AREA: Integer; const BANLINE_TYPE: Integer; const DEPARTURE_ST: WideString; const DES_ST: WideString
                            ): Integer; stdcall;
    function  ModifyARunLine(const RunLine_id: Integer; const RunLineName: WideString; const RunLineCnt: Integer; const RunlineMemo: WideString; const RUNLINEALIASNAME: WideString; const ASKCOMPANY: WideString; const ASKPERSON: WideString; const ASKPERSONTEL: WideString; const RUNLINEDESC: WideString; const RUNLINEOVER: WideString; 
                             const RUNLINESUPERBLOCK: WideString; const FROMADDR: WideString; const ENDADDR: WideString; const FROMTIME: WideString; const ENDTIME: WideString; const YXQ: WideString; const STATE: Integer; const ASKTIME: WideString; const ACCEPTTIME: WideString; 
                             const APPROVALTIME: WideString; const DRIVER_INFO: WideString; const TRANSPORTTYPE: Integer; const SUPERCARGOINFO: WideString; const CARGO_NAME: WideString; const CARGO_TONNAGE: WideString; const BUSSINESS_AREA: Integer; const BANLINE_TYPE: Integer; const DEPARTURE_ST: WideString; 
                             const DES_ST: WideString): WideString; stdcall;
    function  DeleteARunLine(const RunLine_id: Integer): WideString; stdcall;
    function  DeleteDev_RunLine(const dev_Id: WideString; const runLine_Id: Integer): WideString; stdcall;
    function  AddDev_RunLine(const dev_Id: WideString; const runLine_Id: Integer): WideString; stdcall;
    function  ModifyDev_RunLineList(const dev_Id: WideString; const runLine_IdList: WideString): WideString; stdcall;
    function  QueryDev_RunLineList(const dev_Id: WideString): WideString; stdcall;
    function  Query_RunLine_Detail(const RunLine_Id: Integer): WideString; stdcall;
    function  AddNewRunLine_Detail(const RunLine_id: Integer; const xh: Integer; const LONGITUDE: Double; const LATITUDE: Double): Integer; stdcall;
    function  ModifyARunLine_Detail(const RunLine_id: Integer; const xh: Integer; const LONGITUDE: Double; const LATITUDE: Double): WideString; stdcall;
    function  DeleteARunLine_Detail(const RunLine_id: Integer; const xh: Integer): WideString; stdcall;
    function  DeleteARunLine_DetailByARunLine(const RunLine_id: Integer): WideString; stdcall;
    function  QueryDgTypeList: WideString; stdcall;
    function  AddNewDgType(const DgType: WideString; const DgTypeName: WideString): Integer; stdcall;
    function  ModifyADgType(const DgType_id: Integer; const DgType: WideString; const DgTypeName: WideString): WideString; stdcall;
    function  DeleteADgType(const DgType_id: Integer): WideString; stdcall;
    function  QueryTransTypeList: WideString; stdcall;
    function  AddNewTransType(const TransType: WideString; const TransTypeName: WideString): Integer; stdcall;
    function  ModifyATransType(const TransType_id: Integer; const TransType: WideString; const TransTypeName: WideString): WideString; stdcall;
    function  DeleteATransType(const TransType_id: Integer): WideString; stdcall;
    function  QuerySuperCargoList: WideString; stdcall;
    function  QuerySuperCargoList_Count(const SuperCargo_name: WideString; const SuperCargo_serveNum: WideString): Integer; stdcall;
    function  QuerySuperCargoList_Page(const PageSize: Integer; const CurrPageIndex: Integer; const SuperCargo_name: WideString; const SuperCargo_serveNum: WideString): WideString; stdcall;
    function  AddNewSuperCargo(const SUPERCARGO_NAME: WideString; const SUPERCARGO_TEL: WideString; const SUPERCARGO_ADDR: WideString; const SUPERCARGO_SERVENUM: WideString; const ISSUEORG: WideString): Integer; stdcall;
    function  QueryPics_count(const dev_Id: WideString; const onTime: WideString; const offTime: WideString; const PHOTOTYPE: Integer; const CAMERANO: Integer; const car_no: WideString; const sim_no: WideString): Integer; stdcall;
    function  QueryPics_Page(const dev_Id: WideString; const onTime: WideString; const offTime: WideString; const PHOTOTYPE: Integer; const CAMERANO: Integer; const car_no: WideString; const sim_no: WideString; const PageSize: Integer; const CurrPageIndex: Integer): ArrayOfPicInfo; stdcall;
    function  QueryPicsByPhotoIDs(const PhotoIDs: WideString): ArrayOfPicInfo; stdcall;
    function  AddNewSoundRecord(const dev_Id: WideString; const RecordBeginTime: WideString; const RecordEndTime: WideString; const BeginLatitude: Double; const BeginLongitude: Double; const EndLatitude: Double; const EndLongitude: Double; const RecordFileIdInMCU: Integer; const RecordReasonId: Integer; const soundDataSize: Integer; 
                                const soundData: TByteDynArray; const TaxiRunId: Integer; const codeWay: Integer): Integer; stdcall;
    function  Query_SoundRecord(const RecordReasonId: Integer; const fromtime: WideString; const totime: WideString; const dev_Id: WideString; const group_id: Integer; const group_IdList: WideString): WideString; stdcall;
    function  Query_SoundRecord_SoundData(const Record_Id: Integer): SoundRecordData; stdcall;
    function  Change_DriverOrPassenger_Integral(const chgType: Integer; const Driver_id: Integer; const Passenger_Id: Integer; const chgValue: Integer; const chgReason: WideString; const DealMan: WideString; const memo: WideString): WideString; stdcall;
    function  Query_DriverIntegralChg(const fromtime: WideString; const totime: WideString; const driver_id: Integer; const group_id: Integer; const group_IdList: WideString): WideString; stdcall;
    function  Query_PassengerIntegralChg(const fromtime: WideString; const totime: WideString; const Passenger_Id: Integer): WideString; stdcall;
    function  Query_Driver_IntegralSort(const group_Id: Integer; const group_IdList: WideString): WideString; stdcall;
    function  Query_Passenger_IntegralSort: WideString; stdcall;
    function  QueryDevPostion(const dev_Id: WideString; const beginTime: WideString; const endTime: WideString; const beginLat: Double; const beginLong: Double; const endLat: Double; const endLong: Double): WideString; stdcall;
    function  QueryDevPostion_quickly(const devIdList: WideString; const beginTime: WideString; const endTime: WideString; const beginLat: Double; const beginLong: Double; const endLat: Double; const endLong: Double): WideString; stdcall;
    function  Tj_GrpDevCnt(const user_Id: Integer): WideString; stdcall;
    function  AddNewSpecialArea(const areaName: WideString; const AreaShape: Integer; const AreaProperty: Integer; const AreaParam: Integer; const AreaColor: Integer; const AreaPointCnt: Integer; const AreaPoints_use: WideString; const IsVisible: Integer): Integer; stdcall;
    function  DeleteASpecialAreaById(const AreaId: Integer): WideString; stdcall;
    function  ModifyASpecialArea(const AreaId: Integer; const areaName: WideString; const AreaShape: Integer; const AreaProperty: Integer; const AreaParam: Integer; const AreaColor: Integer; const AreaPointCnt: Integer; const AreaPoints_use: WideString; const IsVisible: Integer): WideString; stdcall;
    function  Query_SpecialAreaList: WideString; stdcall;
    function  AddNewAccuseDriver(const Accuse_Type: Integer; const Accuse_carno: WideString; const TaxiRunID: Integer; const case_HappenTime: WideString; const case_HappenAddr: WideString; const Accuse_Reason: WideString; const passengerName: WideString; const PassengerTelNum: WideString; const PassengerMemo: WideString; const RecordId: Integer
                                 ): Integer; stdcall;
    function  AddNewAccuseDriver_driverId(const Accuse_Type: Integer; const Accuse_carno: WideString; const TaxiRunID: Integer; const case_HappenTime: WideString; const case_HappenAddr: WideString; const Accuse_Reason: WideString; const passengerName: WideString; const PassengerTelNum: WideString; const PassengerMemo: WideString; const RecordId: Integer; 
                                          const driver_id: Integer): Integer; stdcall;
    function  ModifyAAccuseDriver_Deal(const Accuse_Id: Integer; const DealState: Integer; const DealContent: WideString; const DealDepartment: WideString; const DealMan: WideString; const DealManTel: WideString; const DealTime: WideString): Integer; stdcall;
    function  ModifyAAccuseDriver_Check(const Accuse_Id: Integer; const DealState: Integer; const Check_Result: WideString; const Check_man: WideString; const Check_Idea: WideString): Integer; stdcall;
    function  ModifyAAccuseDriver_DealState(const Accuse_Id: Integer; const DealState: Integer): Integer; stdcall;
    function  DelAAccuseDriver(const Accuse_Id: Integer): Integer; stdcall;
    function  ModifyAAccuseDriver_BaseInfo(const Accuse_Id: Integer; const Accuse_Type: Integer; const Accuse_carno: WideString; const TaxiRunID: Integer; const case_HappenTime: WideString; const case_HappenAddr: WideString; const Accuse_Reason: WideString; const passengerName: WideString; const PassengerTelNum: WideString; const PassengerMemo: WideString; 
                                           const RecordId: Integer; const DealState: Integer): Integer; stdcall;
    function  ModifyAAccuseDriver(const Accuse_Id: Integer; const Accuse_Type: Integer; const Accuse_carno: WideString; const TaxiRunID: Integer; const case_HappenTime: WideString; const case_HappenAddr: WideString; const Accuse_Reason: WideString; const passengerName: WideString; const PassengerTelNum: WideString; const PassengerMemo: WideString; 
                                  const RecordId: Integer; const DealState: Integer; const DealContent: WideString; const DealDepartment: WideString; const DealMan: WideString; const DealManTel: WideString; const DealTime: WideString; const Check_Result: WideString; const Check_man: WideString; 
                                  const Check_Idea: WideString; const driver_id: Integer): Integer; stdcall;
    function  Query_AccuseDriver(const DealState: Integer; const fromtime: WideString; const totime: WideString): WideString; stdcall;
    function  Query_Dev_DriverInfo(const sim_no: WideString; const driver_name: WideString; const dev_Id: WideString; const group_Id: Integer; const group_IdList: WideString; const terminaltype_Id: Integer; const terminalmodel_Id: Integer; const cartype_Id: Integer; const car_no: WideString; const carTypeCode: WideString
                                   ): WideString; stdcall;
    function  ModifyServeJudge(const Judge_Id: Integer; const judge_result: Integer; const NotOk_Num: Integer): WideString; stdcall;
    function  AddNewPeccancy(const carno: WideString; const dev_Id: WideString; const Driver_Name: WideString; const driver_Id: Integer; const Peccancy_type: WideString; const Peccancy_Time: WideString; const addr: WideString; const Punish_way: WideString; const Punish_money: Integer; const Punish_Number: Integer; 
                             const memo: WideString; const DEAL_MAN: WideString; const DEAL_STATE: Integer; const DEAL_RESULT: WideString; const DEAL_TIME: WideString; const DEAL_MEMO: WideString; const car_Id: Integer): Integer; stdcall;
    function  ModifyAPeccancy(const Peccancy_Id: Integer; const carno: WideString; const dev_Id: WideString; const Driver_Name: WideString; const driver_Id: Integer; const Peccancy_type: WideString; const Peccancy_Time: WideString; const addr: WideString; const Punish_way: WideString; const Punish_money: Integer; 
                              const Punish_Number: Integer; const memo: WideString; const DEAL_MAN: WideString; const DEAL_STATE: Integer; const DEAL_RESULT: WideString; const DEAL_TIME: WideString; const DEAL_MEMO: WideString; const car_Id: Integer): Integer; stdcall;
    function  DelAPeccancy(const Peccancy_Id: Integer): Integer; stdcall;
    function  Query_Peccancy(const fromTime: WideString; const toTime: WideString; const driver_Id: Integer; const dev_Id: WideString; const group_Id: Integer; const group_IdList: WideString): WideString; stdcall;
    function  Query_Peccancy2_count(const fromTime: WideString; const toTime: WideString; const driver_Id: Integer; const PECCANCY_TYPE: WideString; const car_no: WideString; const dev_Id: WideString; const group_Id: Integer; const group_IdList: WideString; const deal_State: Integer): Integer; stdcall;
    function  Query_Peccancy2_Page(const fromTime: WideString; const toTime: WideString; const driver_Id: Integer; const PECCANCY_TYPE: WideString; const car_no: WideString; const dev_Id: WideString; const group_Id: Integer; const group_IdList: WideString; const deal_State: Integer; const PageSize: Integer; 
                                   const CurrPageIndex: Integer): WideString; stdcall;
    function  Query_PeccancyTj(const fromTime: WideString; const toTime: WideString; const driver_Id: Integer; const PECCANCY_TYPE: WideString; const car_no: WideString; const dev_Id: WideString; const group_Id: Integer; const group_IdList: WideString; const deal_State: Integer): WideString; stdcall;
    function  Query_Peccancy_Type: WideString; stdcall;
    function  Query_Peccancy_PunishWay: WideString; stdcall;
    function  Query_AnnualReview(const fromTime: WideString; const toTime: WideString; const reviewState: Integer; const dev_Id: WideString; const group_Id: Integer; const group_IdList: WideString): WideString; stdcall;
    function  AddNewAnnualReview(const dev_Id: WideString; const ReviewDate: WideString; const ReviewProject: WideString; const ReviewContent: WideString; const NextDate: WideString): Integer; stdcall;
    function  ModifyAAnnualReview(const Review_Id: Integer; const dev_Id: WideString; const ReviewDate: WideString; const ReviewProject: WideString; const ReviewContent: WideString; const NextDate: WideString): Integer; stdcall;
    function  DeleteAAnnualReview(const Review_Id: Integer): Integer; stdcall;
    function  Query_DevGpsData(const dev_Id: WideString; const group_Id: Integer; const group_IdList: WideString): WideString; stdcall;
    function  AddDevUpdateResult(const devType: Integer; const DevFactId: Integer; const HardVer: Integer; const SoftVer: Double; const UpdateResult: WideString; const devId: WideString): Integer; stdcall;
    function  DevUpdate_QueryAllDevFact(const devType: Integer): WideString; stdcall;
    function  DevUpdate_QueryAllDevType: WideString; stdcall;
    function  Client_GetDevUpdateCurrentVer(const devType: Integer; const DevFactId: Integer): WideString; stdcall;
    function  OutMdb_GetDRunData(const fromTime: WideString; const toTime: WideString): WideString; stdcall;
    function  OutIccardData(const fromTime: WideString; const toTime: WideString): WideString; stdcall;
    function  FindCarInArea(const cartype_id: Integer; const car_Color: WideString; const devIdList: WideString; const group_Id: Integer; const group_IdList: WideString; const beginTime: WideString; const endTime: WideString; const beginLat: Double; const beginLong: Double; const endLat: Double; 
                            const endLong: Double): WideString; stdcall;
    function  GwBefore_DownBlackList: WideString; stdcall;
    function  GwBefore_GetBlackListVer: BlackVer; stdcall;
    function  GwBefore_GetBlackList_OverDevVer(const devVer: Integer): WideString; stdcall;
    function  GwBefore_GetPerGpsMaxID: Integer; stdcall;
    function  GwBefore_GetDevId(const user_id: Integer; const devId_Src: Int64): WideString; stdcall;
    function  AddSql(const SqlStr: WideString; const TableName: WideString; const Desc: WideString): Integer; stdcall;
    function  QuerySql(const SqlStr: WideString; const TableName: WideString; const Desc: WideString): WideString; stdcall;
    function  ModifySql(const SqlStr: WideString; const TableName: WideString; const Desc: WideString): WideString; stdcall;
    function  DevUpdate_QueryAllDevUpdateRecord(const DevId: Integer; const group_Id: Integer; const group_IdList: WideString; const DevType: Integer; const DevFactId: Integer; const fromTime: WideString; const toTime: WideString; const UpdateResult: Integer; const HardVer: WideString; const SoftVer: WideString
                                                ): WideString; stdcall;
    function  QueryDevByGroupID(const groupid: WideString): WideString; stdcall;
    function  QueryMenuSys: WideString; stdcall;
    function  QueryUserInfoByUserNameOrRoleID(const username: WideString; const roleid: Integer): WideString; stdcall;
    function  TjGroupOnlinePer(const groupId: Integer; const groupList: WideString; const startTime: WideString; const endTime: WideString): WideString; stdcall;
    function  TjBj_Car(const devid: WideString; const startTime: WideString; const endTime: WideString; const carType_id: Integer; const cartypecode: WideString; const carShipTypeCode: WideString; const alarmType: Integer): WideString; stdcall;
    function  TjBj_Group(const startTime: WideString; const endTime: WideString; const groupId: Integer; const groupLists: WideString; const carType_id: Integer; const cartypecode: WideString; const carShipTypeCode: WideString; const alarmType: Integer): WideString; stdcall;
    function  QueryDevAlarmDealList(const startTime: WideString; const endTime: WideString; const car_No: WideString; const groupId: Integer; const groupLists: WideString; const alarmType: Integer; const carType_id: Integer; const cartypecode: WideString; const carShipTypeCode: WideString): WideString; stdcall;
    function  TjBj_Day(const stime_day: WideString; const devId: WideString; const groupId: Integer; const groupLists: WideString): WideString; stdcall;
    function  TjBj_Month(const stime_day: WideString; const devId: WideString; const groupId: Integer; const groupLists: WideString): WideString; stdcall;
    function  Query_DevAlarm_Count(const startTime: WideString; const endTime: WideString; const devId: WideString; const groupId: Integer; const groupLists: WideString; const dealStatus: Integer; const AlarmType: Integer; const sim_no: WideString): Integer; stdcall;
    function  Query_DevAlarm_Page(const startTime: WideString; const endTime: WideString; const devId: WideString; const groupId: Integer; const groupLists: WideString; const dealStatus: Integer; const AlarmType: Integer; const sim_no: WideString; const PageSize: Integer; const CurrPageIndex: Integer
                                  ): WideString; stdcall;
    function  Query_DevAlarm(const startTime: WideString; const endTime: WideString; const devId: WideString; const groupId: Integer; const groupLists: WideString; const dealStatus: Integer; const AlarmType: Integer): WideString; stdcall;
    function  tj_xslc(const startTime: WideString; const endTime: WideString; const devId: WideString; const groupId: Integer; const groupLists: WideString): WideString; stdcall;
    function  QueryDevAlarmDeal(const id: Integer): WideString; stdcall;
    function  AddNewDevFact(const factName: WideString; const factMemo: WideString; const factNo: WideString): Integer; stdcall;
    function  DeleteDevFact(const factId: Integer): WideString; stdcall;
    function  QueryDevFac(const FactId: Integer): WideString; stdcall;
    function  QuerySendLog(const user_id: Integer; const startTime: WideString; const endTime: WideString; const flag: Smallint; const devId: WideString): WideString; stdcall;
    function  QueryRole(const user_id: Integer): WideString; stdcall;
    function  QueryJsyKq(const startTime: WideString; const endTime: WideString; const driverName: WideString; const driverCyzgz: WideString; const devId: WideString; const groupId: Integer; const groupLists: WideString): WideString; stdcall;
    function  AddNewInfoType(const typeId: Integer; const typename: WideString; const memo: WideString): Integer; stdcall;
    function  ModifyAInfoType(const id: Integer; const typeId: Integer; const typeName: WideString; const memo: WideString): WideString; stdcall;
    function  DeleteAInfoType(const id: Integer): WideString; stdcall;
    function  QueryInfoTypeList: WideString; stdcall;
    function  QueryInfoList(const fromtime: WideString; const endtime: WideString): WideString; stdcall;
    function  AddNewInfo(const typeId: Integer; const infoContent: WideString; const sendTime: WideString; const memo: WideString): Integer; stdcall;
    function  ModifyAMessage_State(const msg_id: Integer; const msg_state: Integer): WideString; stdcall;
    function  ModifyAMessage_Answer(const msg_id: Integer; const msg_state: Integer; const msg_repTime: WideString; const msg_driverAnswer_Id: Integer): WideString; stdcall;
    function  ModifyAMessage_Answer2(const msg_id: Integer; const msg_state: Integer; const msg_repTime: WideString; const msg_driverAnswer_Id: Integer; const msg_driverAnswer_Str: WideString): WideString; stdcall;
    function  Query_MessageList(const fromtime: WideString; const totime: WideString; const msg_type: Integer; const msg_state: Integer; const isQueryAllUserSended: Boolean; const dev_Id: WideString; const group_Id: Integer; const group_IdList: WideString): WideString; stdcall;
    function  AddNewAnswer(const ANSWER_NO: Integer; const ANSWER_DESC: WideString): Integer; stdcall;
    function  QueryAnswerList: WideString; stdcall;
    function  QueryTelList: WideString; stdcall;
    function  AddNewtel(const tel_number: WideString; const tel_Name: WideString; const tel_type: Integer; const tel_memo: WideString): Integer; stdcall;
    function  ModifyATel(const tel_id: Integer; const tel_number: WideString; const tel_Name: WideString; const tel_type: Integer; const tel_memo: WideString): WideString; stdcall;
    function  DeleteATel(const tel_Id: Integer): WideString; stdcall;
    function  ModifyDev_TelList(const dev_Id: WideString; const tel_IdList: WideString): WideString; stdcall;
    function  QueryDev_TelList: WideString; stdcall;
    function  QueryEventList: WideString; stdcall;
    function  AddNewEvent(const eventNo: Integer; const eventDesc: WideString): Integer; stdcall;
    function  ModifyAEvent(const event_id: Integer; const eventNo: Integer; const eventDesc: WideString): WideString; stdcall;
    function  DeleteAEvent(const evnet_id: Integer): WideString; stdcall;
    function  ModifyDev_EventList(const dev_Id: WideString; const Evnet_IdList: WideString): WideString; stdcall;
    function  QueryDev_EventList: WideString; stdcall;
    function  QueryDevParamsList: WideString; stdcall;
    function  QueryDevParamsList_ByDevId(const dev_Id: WideString): WideString; stdcall;
    function  QueryDevParamsByDevId(const dev_Id: WideString): WideString; stdcall;
    function  DeleteADevAParam(const dev_Id: WideString; const paramNo: Integer): WideString; stdcall;
    function  DeleteADevParams(const dev_Id: WideString): WideString; stdcall;
    function  AddNewDevParam(const dev_Id: WideString; const paramNo: Integer; const paramValue: WideString): WideString; stdcall;
    function  ModifyADevAParam(const dev_Id: WideString; const paramNo: Integer; const paramValue: WideString): WideString; stdcall;
    function  QueryDriverList: WideString; stdcall;
    function  QueryDriverListCount_BS(const driver_no: WideString; const driver_name: WideString; const car_id: Integer; const DriverserveNum: WideString): Integer; stdcall;
    function  QueryDriverList_BS(const driver_no: WideString; const driver_name: WideString; const car_id: Integer; const DriverserveNum: WideString; const PageSize: Integer; const CurrPageIndex: Integer): WideString; stdcall;
    function  QueryADriver_BS(const driver_no: WideString; const DriverserveNum: WideString): WideString; stdcall;
    function  QueryDriverListReturnDelphiXml: WideString; stdcall;
    function  Query_DriverList_Condition(const driver_Id: Integer; const group_Id: Integer): WideString; stdcall;
    function  ModifyADriver_Black(const DRIVER_ID: Integer; const isBlack: Integer): Integer; stdcall;
    function  AddNewDriver(const driver_name: WideString; const driver_tel: WideString; const driver_addr: WideString; const driver_identitycard: WideString; const car_Id: Integer; const group_Id: Integer; const driver_no: WideString; const driver_kind: Integer; const INTEGRAL: Integer; const DRIVERSERVENUM: WideString; 
                           const DRIVER_DRIVERINGNUM: WideString; const POLITICALFACE: WideString; const DRIVER_PHOTO: WideString; const IssueOrg: WideString; const DRIVER_ADDRAREA: WideString; const DRIVER_NATIVEPLACE: WideString): Integer; stdcall;
    function  ModifyADriver(const driver_id: Integer; const driver_name: WideString; const driver_tel: WideString; const driver_addr: WideString; const driver_identitycard: WideString; const car_Id: Integer; const group_Id: Integer; const driver_no: WideString; const driver_kind: Integer; const INTEGRAL: Integer; 
                            const DRIVERSERVENUM: WideString; const DRIVER_DRIVERINGNUM: WideString; const POLITICALFACE: WideString; const DRIVER_PHOTO: WideString; const IssueOrg: WideString; const DRIVER_ADDRAREA: WideString; const DRIVER_NATIVEPLACE: WideString): WideString; stdcall;
    function  ModifyADriver_Client(const driver_id: Integer; const driver_name: WideString; const driver_tel: WideString): WideString; stdcall;
    function  ModifyADriver_Integral(const driver_id: Integer; const INTEGRAL: Integer): WideString; stdcall;
    function  QueryADriver_Integral(const driver_id: Integer): WideString; stdcall;
    function  DeleteADriver(const driver_id: Integer): WideString; stdcall;
    function  AddNewCmdLog(const user_id: Integer; const dev_Id: WideString; const cmd_type: Integer; const cmd_desc: WideString): Integer; stdcall;
    function  Query_CmdLogList(const fromtime: WideString; const totime: WideString; const isQueryAllUserSended: Boolean; const dev_Id: WideString; const group_id: Integer; const group_IdList: WideString): WideString; stdcall;
    function  Query_DriverSignInfo(const fromtime: WideString; const totime: WideString; const dev_Id: WideString; const group_Id: Integer; const group_IdList: WideString): WideString; stdcall;
    function  Query_DriverSignInfo2(const fromtime: WideString; const totime: WideString; const driver_id: Integer; const group_Id: Integer; const group_IdList: WideString): WideString; stdcall;
    function  AddNewDriverSignIn(const dev_Id: WideString; const group_no: WideString; const driver_no: WideString; const signtype: Integer; const signlongitude: Double; const signlatitude: Double; const signTime: WideString): WideString; stdcall;
    function  AddNewDbRunData(const group_no: WideString; const driver_no: WideString; const dev_Id: WideString; const carNo: WideString; const kz: Integer; const dbBegintime: WideString; const dbEndtime: WideString; const dbDistance: Double; const dbCount: Integer; const dbTime: WideString; 
                              const zyyje: Double; const cardyyje: Double; const cardCount: Integer; const dbDis_afterLastOut: Double; const zxslc: Double; const zyylc: Double; const dbyylc: Double; const dj: Double): WideString; stdcall;
    function  QueryResList: WideString; stdcall;
    function  AddNewPic(const dev_Id: WideString; const PhotoReasonID: Integer; const GpsTime: WideString; const longitude: Single; const latitude: Single; const takeBeginTime: WideString; const takeEndTime: WideString; const PhotoSize: Integer; const Photo: TByteDynArray; const PhotoType: Integer; 
                        const picIndex: Integer; const PhotoMeasure: Integer; const CameraNo: Integer; const TaxiRunId: Integer): Integer; stdcall;
    function  AddNewPic_FileIdInMCU(const dev_Id: WideString; const PhotoReasonID: Integer; const GpsTime: WideString; const longitude: Single; const latitude: Single; const takeBeginTime: WideString; const takeEndTime: WideString; const PhotoSize: Integer; const Photo: TByteDynArray; const PhotoType: Integer; 
                                    const picIndex: Integer; const PhotoMeasure: Integer; const CameraNo: Integer; const PhotoFileIdInMCU: Integer; const TaxiRunId: Integer): Integer; stdcall;
    function  QueryAPic(const picId: Integer): PicInfo; stdcall;
    function  AddNewArea(const areaName: WideString; const AreaType: Integer; const AreaNo: Integer; const AreaProperty: Integer; const BeginTime: WideString; const EndTime: WideString; const MaxSpeed: Integer; const overSpeedtime: Integer; const AreaPointCnt: Integer; const AreaPoints_use: WideString; 
                         const AreaPoints_ToMcu: WideString; const IsVisible: Integer): Integer; stdcall;
    function  DeleteAAreaById(const AreaId: Integer): WideString; stdcall;
    function  DeleteAAreaByType_No(const AreaType: Integer; const AreaNo: Integer): WideString; stdcall;
    function  ModifyAArea(const AreaId: Integer; const areaName: WideString; const AreaType: Integer; const AreaNo: Integer; const AreaProperty: Integer; const BeginTime: WideString; const EndTime: WideString; const MaxSpeed: Integer; const overSpeedtime: Integer; const AreaPointCnt: Integer; 
                          const AreaPoints_use: WideString; const AreaPoints_ToMcu: WideString; const IsVisible: Integer): WideString; stdcall;
    function  ModifyDev_AreaList(const dev_Id: WideString; const AreaIdList: WideString): WideString; stdcall;
    function  AddNewDev_Area(const dev_Id: WideString; const area_Id: Integer): WideString; stdcall;
    function  DeleteADev_Area(const dev_Id: WideString; const area_Id: Integer): WideString; stdcall;
    function  DeleteADev_AllArea(const dev_Id: WideString): WideString; stdcall;
    function  Query_AreaList: WideString; stdcall;
    function  Query_DevAreaListByDev(const dev_Id: WideString): WideString; stdcall;
    function  Query_DevListByArea(const area_Id: Integer): WideString; stdcall;
    function  QueryInfoDemandMenuList: WideString; stdcall;
    function  AddNewInfoDemandMenu(const MenuType: Integer; const MenuName: WideString): Integer; stdcall;
    function  ModifyAInfoDemandMenu(const Menu_Id: Integer; const MenuType: Integer; const MenuName: WideString): WideString; stdcall;
    function  DeleteAInfoDemandMenu(const Menu_Id: Integer): WideString; stdcall;
    function  ModifyDev_InfoDemandMenuList(const dev_Id: WideString; const Menu_IdList: WideString): WideString; stdcall;
    function  QueryDev_InfoDemandMenuList: WideString; stdcall;
    function  QueryAmbientInfoMenuList: WideString; stdcall;
    function  AddNewAmbientInfoMenu(const MenuType: Integer; const MenuName: WideString): Integer; stdcall;
    function  ModifyAAmbientInfoMenu(const AmbientMenu_Id: Integer; const MenuType: Integer; const MenuName: WideString): WideString; stdcall;
    function  DeleteAAmbientInfoMenu(const AmbientMenu_Id: Integer): WideString; stdcall;
    function  ModifyDev_AmbientInfoMenuList(const dev_Id: WideString; const Menu_IdList: WideString): WideString; stdcall;
    function  QueryDev_AmbientInfoMenuList: WideString; stdcall;
    function  AddNewRoad(const RoadWidth: Integer; const RoadProperty: Integer; const MinRunTime: Integer; const MaxRunTime: Integer; const MaxSpeed: Integer; const OverSpeedTimes: Integer; const FrobidRunBeginTime: WideString; const FrobidRunEndTime: WideString; const RoadPointCnt: Integer; const RoadPoints_use: WideString; 
                         const RoadPoints_ToMcu: WideString; const IsVisible: Integer): Integer; stdcall;
    function  DeleteARoad(const Road_id: Integer): WideString; stdcall;
    function  AddNewLine(const LineProperty: Integer; const LineBeginTime: WideString; const LineEndTime: WideString; const LineRoadCnt: Integer): Integer; stdcall;
    function  DeleteALine(const Line_Id: Integer): WideString; stdcall;
    function  ModifyLine_Road(const Line_Id: Integer; const road_IdList: WideString): WideString; stdcall;
    function  ModifyDev_Line(const dev_Id: WideString; const Line_IdList: WideString): WideString; stdcall;
    function  QueryDev_LineList: WideString; stdcall;
    function  QueryLine_RoadList: WideString; stdcall;
    function  QueryLineList: WideString; stdcall;
    function  QueryRoadList: WideString; stdcall;
    function  QueryServeJudgeByDRunData_ByTaxiRunId(const TaxiRunId: Integer): WideString; stdcall;
    function  QueryPics_ByTaxiRunId(const TaxiRunId: Integer): ArrayOfPicInfo; stdcall;
    function  QueryServeJudgeByDRunData(const dev_Id: WideString; const onTime: WideString; const offTime: WideString): WideString; stdcall;
    function  QueryPicsByTime(const dev_Id: WideString; const onTime: WideString; const offTime: WideString): ArrayOfPicInfo; stdcall;
    function  Test: WideString; stdcall;
    function  HelloWorld: WideString; stdcall;
    function  UserLogin(const userName: WideString; const userPwd: WideString): Integer; stdcall;
    function  CheckUser_ByServer(const user_Id: Integer; const userPwd: WideString): Integer; stdcall;
    function  QueryUser_DevList(const user_id: Integer): WideString; stdcall;
    function  GetMaxUserDevId(const user_id: Integer): Integer; stdcall;
    function  AddNewDRunData(const dev_Id: WideString; const car_no: WideString; const onDate: WideString; const ontime: WideString; const offtime: WideString; const waittime: WideString; const yylc: Double; const kslc: Double; const yyje: Double; const longitude: Double; 
                             const latitude: Double; const gpstime: WideString; const TaxiRunId: Integer; const onlongitude: Double; const onlatitude: Double): WideString; stdcall;
    function  AddNewDRunDataV20(const dev_Id: WideString; const car_no: WideString; const onDate: WideString; const ontime: WideString; const offtime: WideString; const waittime: WideString; const yylc: Double; const kslc: Double; const yyje: Double; const longitude: Double; 
                                const latitude: Double; const gpstime: WideString; const TaxiRunId: Integer; const onlongitude: Double; const onlatitude: Double; const pjId: Integer; const pjXx: Integer; const pjXxExtend: Integer): WideString; stdcall;
    function  AddNewDRunData_ICCard(const dev_Id: WideString; const car_no: WideString; const onDate: WideString; const ontime: WideString; const offtime: WideString; const waittime: WideString; const yylc: Double; const kslc: Double; const yyje: Double; const longitude: Double; 
                                    const latitude: Double; const gpstime: WideString; const icCardinNo: WideString; const icCardMoney_BeforeTrade: WideString; const icCardMoney_AfterTrade: WideString; const cardtype: WideString; const posnum: WideString; const iccardTradeNum: WideString; const tradeType: WideString; 
                                    const citycode: WideString; const tac: WideString; const SamNo: WideString; const TaxiRunId: Integer; const onlongitude: Double; const onlatitude: Double): WideString; stdcall;
    function  AddNewDRunData_ICCardV20(const dev_Id: WideString; const car_no: WideString; const onDate: WideString; const ontime: WideString; const offtime: WideString; const waittime: WideString; const yylc: Double; const kslc: Double; const yyje: Double; const longitude: Double; 
                                       const latitude: Double; const gpstime: WideString; const icCardinNo: WideString; const icCardMoney_BeforeTrade: WideString; const icCardMoney_AfterTrade: WideString; const cardtype: WideString; const posnum: WideString; const iccardTradeNum: WideString; const tradeType: WideString; 
                                       const citycode: WideString; const tac: WideString; const SamNo: WideString; const TaxiRunId: Integer; const onlongitude: Double; const onlatitude: Double; const pjId: Integer; const pjXx: Integer; const pjXxExtend: Integer
                                       ): WideString; stdcall;
    function  QueryDevFactList: WideString; stdcall;
    function  QueryCarTypeReturnDelphiXml: WideString; stdcall;
    function  QueryCarType: WideString; stdcall;
    function  AddNewCarType(const aTypeName: WideString): Integer; stdcall;
    function  DeleteACarType(const TypeId: Integer): WideString; stdcall;
    function  ModifyCarType(const aTypeId: Integer; const newTypeName: WideString): WideString; stdcall;
    function  QueryUserDevListReturnDelphiXml: WideString; stdcall;
    function  QueryUserDevList: WideString; stdcall;
    function  QueryUserDevListCount_BS(const dev_Id: WideString; const SIM_NO: WideString; const CAR_ID: Integer; const FACT_ID: Integer; const GROUP_ID: Integer): Integer; stdcall;
    function  QueryUserDevList_BS(const dev_Id: WideString; const SIM_NO: WideString; const CAR_ID: Integer; const FACT_ID: Integer; const GROUP_ID: Integer; const PageSize: Integer; const CurrPageIndex: Integer): WideString; stdcall;
    function  QueryUserDevList_Count: Integer; stdcall;
    function  QueryUserDevList_Page(const pageSize: Integer; const CurrPageIndex: Integer): WideString; stdcall;
    function  AddNewDev(const dev_Id: WideString; const disp_label: WideString; const sim_no: WideString; const group_Id: Integer; const car_Id: Integer; const devfactid: Integer; const devno: WideString; const keycode: WideString; const TERMINALTYPE_ID: Integer; const TERMINALMODEL_ID: Integer
                        ): WideString; stdcall;
    function  ModifyDev(const dev_Id: WideString; const disp_label: WideString; const sim_no: WideString; const group_Id: Integer; const car_Id: Integer; const devfactid: Integer; const devno: WideString; const keycode: WideString; const dev_stat: Integer; const TERMINALTYPE_ID: Integer; 
                        const TERMINALMODEL_ID: Integer; const ISREG: Integer): WideString; stdcall;
    function  DeleteADev(const dev_Id: WideString): WideString; stdcall;
    function  QueryCarListReturnDelphiXml: WideString; stdcall;
    function  QueryCarList: WideString; stdcall;
    function  QueryCarListCount_BS(const car_no: WideString; const group_id: Integer; const group_IdList: WideString): Integer; stdcall;
    function  QueryCarList_BS(const car_no: WideString; const PageSize: Integer; const CurrPageIndex: Integer; const group_id: Integer; const group_IdList: WideString): WideString; stdcall;
    function  QueryACar_BS(const car_no: WideString): WideString; stdcall;
    function  AddNewCar(const car_zbh: WideString; const car_no: WideString; const car_memo: WideString; const res_Id: Integer; const carType_Id: Integer; const car_pass: WideString; const car_yyzh: WideString; const car_gzzh: WideString; const car_djzh: WideString; const car_fdjh: WideString; 
                        const car_dph: WideString; const car_bxno: WideString; const car_kthm: WideString; const car_djrq: WideString; const car_fzrq: WideString; const car_grsj: WideString; const car_qurq: WideString; const car_hslx: WideString; const zpdj_id: Integer; 
                        const car_color: WideString; const car_Image: WideString; const shengId: Integer; const shiId: Integer; const chepaiColor: Integer; const CAR_INDUSTRY: WideString; const OWNERNAME: WideString; const CarTypeCode: WideString; const CarShipTypeCode: WideString; 
                        const trans_type: WideString; const GROUP_ID: Integer; const TRACTION: WideString; const APPROVED_TONNAGE: WideString; const APPROVED_SEATS: WideString; const DG_TYPE: WideString): Integer; stdcall;
    function  DeleteCarInfo(const car_Id: Integer): WideString; stdcall;
    function  ModifyCarInfo(const car_Id: Integer; const car_zbh: WideString; const car_no: WideString; const car_memo: WideString; const res_Id: Integer; const carType_Id: Integer; const car_pass: WideString; const car_yyzh: WideString; const car_gzzh: WideString; const car_djzh: WideString; 
                            const car_fdjh: WideString; const car_dph: WideString; const car_bxno: WideString; const car_kthm: WideString; const car_djrq: WideString; const car_fzrq: WideString; const car_grsj: WideString; const car_qurq: WideString; const car_hslx: WideString; 
                            const zpdj_id: Integer; const car_color: WideString; const car_Image: WideString; const shengId: Integer; const shiId: Integer; const chepaiColor: Integer; const CAR_INDUSTRY: WideString; const OWNERNAME: WideString; const ISCARREG: Integer; 
                            const CarTypeCode: WideString; const CarShipTypeCode: WideString; const trans_type: WideString; const GROUP_ID: Integer; const TRACTION: WideString; const APPROVED_TONNAGE: WideString; const APPROVED_SEATS: WideString; const DG_TYPE: WideString): WideString; stdcall;
    function  QueryUserList: WideString; stdcall;
    function  AddNewUser(const username: WideString; const passwd: WideString; const role_id: Integer; const memo: WideString; const userOrg: WideString; const USERINDUSTRY: WideString; const USERJOB: WideString; const USERROOM: WideString; const USERTEL: WideString; const USEREXP: WideString
                         ): Integer; stdcall;
    function  DeleteAUser(const user_Id: Integer): WideString; stdcall;
    function  ModifyUser(const user_Id: Integer; const username: WideString; const passwd: WideString; const role_id: Integer; const memo: WideString; const user_stat: Integer; const userOrg: WideString; const USERINDUSTRY: WideString; const USERJOB: WideString; const USERROOM: WideString; 
                         const USERTEL: WideString; const USEREXP: WideString): WideString; stdcall;
    function  ModifyUser_password(const oldPassword: WideString; const newPassword: WideString): WideString; stdcall;
    function  QueryUser_Privilege(const user_Id: Integer): WideString; stdcall;
    function  QueryUser_Privilege_BS(const user_Id: Integer): WideString; stdcall;
    function  ModifyRole_PrivilegeList(const role_id: Integer; const PrivilegeList: WideString; const VisibleList: WideString; const EnableList: WideString): WideString; stdcall;
    function  QueryRole_PrivilegeList(const role_Id: Integer): WideString; stdcall;
    function  QueryRole_Privileges(const role_Id: Integer; const startPrivilege: Integer; const endPrivilege: Integer): WideString; stdcall;
    function  QueryPrivilegeList: WideString; stdcall;
    function  AddNewPrivilege(const PRIVILEGE_NAME: WideString; const PRIVILEGE_PARENT: Integer; const LEAF_NOD: Integer; const PRIVILEGE: Integer): Integer; stdcall;
    function  ModifyAPrivilege(const privilege_id: Integer; const PRIVILEGE_NAME: WideString; const PRIVILEGE_PARENT: Integer; const LEAF_NOD: Integer; const PRIVILEGE: Integer): WideString; stdcall;
    function  AddNewPrivilege_BS(const PRIVILEGE_NAME: WideString; const PRIVILEGE_PARENT: Integer; const LEAF_NOD: Integer; const PRIVILEGE: Integer; const URL: WideString): Integer; stdcall;
    function  ModifyPrivilege_BS(const privilege_id: Integer; const PRIVILEGE: Integer; const privlege_Name: WideString; const URL: WideString): WideString; stdcall;
    function  ModifyPrivilegeLeafNode(const privilege_id: Integer; const LEAF_NOD: Integer): WideString; stdcall;
    function  ModifyPrivilege(const privilege_id: Integer; const PRIVILEGE: Integer; const privlege_Name: WideString): WideString; stdcall;
    function  DeleteAPrivilege(const privilege_id: Integer): WideString; stdcall;
    function  QueryRoleList: WideString; stdcall;
    function  AddNewRole(const role_name: WideString; const role_Desc: WideString): Integer; stdcall;
    function  DeleteARole(const role_Id: Integer): WideString; stdcall;
    function  ModifyRole(const role_Id: Integer; const role_name: WideString; const role_desc: WideString): WideString; stdcall;
    function  QueryUserGroup: WideString; stdcall;
    function  QueryUserGroupReturnDelphiXml: WideString; stdcall;
    function  QueryUser_Group(const user_id: Integer): WideString; stdcall;
    function  AddNewGroup(const GroupName: WideString; const Parent: Integer; const LeafNode: Integer; const GroupAddr: WideString; const GroupTel: WideString; const GroupCorp: WideString; const Group_No: WideString; const CONTACTMAN: WideString; const GROUP_TYPE: WideString; const GROUP_ADDRAREA: WideString; 
                          const GROUP_BUSIAREA: WideString; const DLYSXKZ: WideString; const ISSUEORG: WideString; const CONTACTMANTEL: WideString): Integer; stdcall;
    function  DeleteAGroup(const Grp_Id: Integer): WideString; stdcall;
    function  ModifyGroup(const Grp_Id: Integer; const GroupName: WideString; const GroupAddr: WideString; const GroupTel: WideString; const GroupCorp: WideString; const LEAF_NOD: Integer; const Group_No: WideString; const CONTACTMAN: WideString; const GROUP_TYPE: WideString; const GROUP_ADDRAREA: WideString; 
                          const GROUP_BUSIAREA: WideString; const DLYSXKZ: WideString; const ISSUEORG: WideString; const CONTACTMANTEL: WideString): WideString; stdcall;
    function  ModifyDevGroupLeafNode(const group_id: Integer; const LEAF_NOD: Integer): WideString; stdcall;
    function  ModifyUser_GroupList(const user_Id: Integer; const groupList: WideString): WideString; stdcall;
    function  Query_TaxiRunDataCount(const fromtime: WideString; const totime: WideString; const dev_Id: WideString; const group_id: Integer; const group_IdList: WideString): Integer; stdcall;
    function  Query_TaxiRunData(const fromtime: WideString; const totime: WideString; const PageSize: Integer; const CurrPageIndex: Integer; const dev_Id: WideString; const group_id: Integer; const group_IdList: WideString): WideString; stdcall;
    function  QueryTaxiRunDataByDevList(const FromTime: WideString; const ToTime: WideString; const YYJE: WideString; const DevList: WideString): WideString; stdcall;
    function  ModifyAPassenger_Black(const Passenger_Id: Integer; const isBlack: Integer): Integer; stdcall;
    function  AddNewPassengerInfo(const PassengerName: WideString; const gender: Integer; const detailArrd: WideString; const tel: WideString; const lasttime: WideString; const memo: WideString; const INTEGRAL: Integer): Integer; stdcall;
    function  ModifyPassengerInfo(const passengerId: Integer; const PassengerName: WideString; const gender: Integer; const detailArrd: WideString; const tel: WideString; const lasttime: WideString; const memo: WideString; const INTEGRAL: Integer): WideString; stdcall;
    function  ModifyPassengerInfo_Integral(const passengerId: Integer; const INTEGRAL: Integer): WideString; stdcall;
    function  DelPassengerInfo(const passengerId: Integer): WideString; stdcall;
    function  Query_PassengerInfo: WideString; stdcall;
    function  Query_PassengerInfo_Condition(const telNumber: WideString): WideString; stdcall;
    function  QueryAPassenger_Integral(const Passenger_Id: Integer): WideString; stdcall;
    function  QueryHistoryDataCount(const dev_Id: WideString; const fromtime: WideString; const totime: WideString): Integer; stdcall;
    function  QueryHistoryData(const dev_Id: WideString; const fromtime: WideString; const totime: WideString; const pageSize: Integer; const CurrPageIndex: Integer): WideString; stdcall;
    function  QueryHistoryDataRetrunDelphiXml(const dev_Id: WideString; const fromtime: WideString; const totime: WideString; const pageSize: Integer; const CurrPageIndex: Integer): WideString; stdcall;
    function  AddNewMessage(const dev_Id: WideString; const msg_type: Integer; const msgContent: WideString; const msgShowFlag: Integer; const msg_memo: WideString; const msg_DownAnswers: WideString): Integer; stdcall;
    function  Query_AppMsgUser_Count(const startTime: WideString; const endtime: WideString; const isread: Integer): Integer; stdcall;
    function  Query_AppMsgUser_Page(const startTime: WideString; const endtime: WideString; const isread: Integer; const PageSize: Integer; const CurrPageIndex: Integer): WideString; stdcall;
    function  ModifyAnAppMsgUser_state(const id: Integer): WideString; stdcall;
    function  AddNewUserFeed(const qq: WideString; const e_mail: WideString; const tel: WideString; const feedMemo: WideString): Integer; stdcall;
    function  QueryDevRunStateInfoOnTheTime(const queryTime: WideString; const groupId: Integer; const group_list: WideString; const devIdStr: WideString): WideString; stdcall;
    function  QueryPicsByCondition_count(const startTime: WideString; const endTime: WideString; const photoReason: Integer; const camerano: Integer; const photoType: Integer; const car_no: WideString; const sim_no: WideString; const dev_Id: WideString; const group_Id: Integer; const groupList: WideString
                                         ): Integer; stdcall;
    function  QueryPicsByCondition_Page(const startTime: WideString; const endTime: WideString; const photoReason: Integer; const camerano: Integer; const photoType: Integer; const car_no: WideString; const sim_no: WideString; const dev_Id: WideString; const group_Id: Integer; const groupList: WideString;
                                        const PageSize: Integer; const CurrPageIndex: Integer): ArrayOfPicInfo; stdcall;
    function  QueryALastPicByCondition(const photoReason: Integer; const camerano: Integer; const photoType: Integer; const car_no: WideString; const sim_no: WideString; const dev_Id: WideString): PicInfo; stdcall;
    function  Tj_DevUploadMilage_Count(const startTime: WideString; const endTime: WideString; const devId: WideString; const groupId: Integer; const groupLists: WideString): Integer; stdcall;
    function  Tj_DevUploadMilage_Page(const startTime: WideString; const endTime: WideString; const devId: WideString; const groupId: Integer; const groupLists: WideString; const PageSize: Integer; const CurrPageIndex: Integer): WideString; stdcall;
    function  Tj_DevUploadMilage_Day_Count(const startTime: WideString; const endTime: WideString; const devId: WideString; const groupId: Integer; const groupLists: WideString): Integer; stdcall;
    function  Tj_DevUploadMilage_Day_Page(const startTime: WideString; const endTime: WideString; const devId: WideString; const groupId: Integer; const groupLists: WideString; const PageSize: Integer; const CurrPageIndex: Integer): WideString; stdcall;
    function  Tj_DevUploadMilage_Month_Count(const startTime: WideString; const endTime: WideString; const devId: WideString; const groupId: Integer; const groupLists: WideString): Integer; stdcall;
    function  Tj_DevUploadMilage_Month_Page(const startTime: WideString; const endTime: WideString; const devId: WideString; const groupId: Integer; const groupLists: WideString; const PageSize: Integer; const CurrPageIndex: Integer): WideString; stdcall;
    function  Query_DevUploadMilage_Count(const startTime: WideString; const endTime: WideString; const devId: WideString; const groupId: Integer; const groupLists: WideString): Integer; stdcall;
    function  Query_DevUploadMilage_Page(const startTime: WideString; const endTime: WideString; const devId: WideString; const groupId: Integer; const groupLists: WideString; const PageSize: Integer; const CurrPageIndex: Integer): WideString; stdcall;
    function  QueryDevCarryTimes_Count(const dev_Id: WideString; const group_Id: Integer; const groupList: WideString; const starttime: WideString; const endtime: WideString; const createUser: WideString; const modifyUser: WideString): Integer; stdcall;
    function  QueryDevCarryTimes_Page(const PageSize: Integer; const CurrPageIndex: Integer; const dev_Id: WideString; const group_Id: Integer; const groupList: WideString; const starttime: WideString; const endtime: WideString; const createUser: WideString; const modifyUser: WideString): WideString; stdcall;
    function  AddNewDevCarryTimes(const dev_id: WideString; const starttime: WideString; const endtime: WideString; const startaddr: WideString; const endaddr: WideString; const memo: WideString; const createUser: WideString): Integer; stdcall;
    function  ModifyADevCarryTimes(const dev_id: WideString; const starttime: WideString; const endtime: WideString; const startaddr: WideString; const endaddr: WideString; const memo: WideString; const modifyuser: WideString; const id: Integer): WideString; stdcall;
    function  DeleteADevCarryTimes(const id: Integer): WideString; stdcall;

    function  QueryDevCarryKmAndOil_condition_Page(const PageSize: Integer; const CurrPageIndex: Integer; const dev_Id: WideString; const group_Id: Integer; const groupList: WideString; const starttime: WideString; const endtime: WideString; const condition: Integer): WideString; stdcall;
    function  QueryDevCarryKmAndOil_Page(const PageSize: Integer; const CurrPageIndex: Integer; const dev_Id: WideString; const group_Id: Integer; const groupList: WideString; const starttime: WideString; const endtime: WideString): WideString; stdcall;

  end;

function GetServiceSoap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ServiceSoap;

var
  IP: string;
  PORT: string;

implementation

function GetServiceSoap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ServiceSoap;
const
  defWSDL = 'http://221.181.144.189:9988/Service.asmx?wsdl';
  defURL  = 'http://221.181.144.189:9988/Service.asmx';
  defSvc  = 'Service';
  defPrt  = 'ServiceSoap';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
//      Addr := 'http://' +IP+':'+PORT+'/gpszdclWS/Service.asmx?wsdl'//defWSDL     /VGpsWebServiceV3
        Addr := 'http://' +IP+':'+PORT+'/ZdclWS/Service.asmx?wsdl'//defWSDL     /VGpsWebServiceV3
    else
//      Addr := 'http://' +IP+':'+PORT+'/gpszdclWS/Service.asmx';//defURL;
        Addr := 'http://' +IP+':'+PORT+'/ZdclWS/Service.asmx';//defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    RIO.HTTPWebNode.UseUTF8InHeader := True;
    Result := (RIO as ServiceSoap);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  InvRegistry.RegisterInterface(TypeInfo(ServiceSoap), 'http://tempuri.org/', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ServiceSoap), 'http://tempuri.org/%operationName%');
  InvRegistry.RegisterHeaderClass(TypeInfo(ServiceSoap), AuthHeader, 'AuthHeader', '');
  RemClassRegistry.RegisterXSClass(AuthHeader, 'http://tempuri.org/', 'AuthHeader');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfString), 'http://tempuri.org/', 'ArrayOfString');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfInt), 'http://tempuri.org/', 'ArrayOfInt');
  RemClassRegistry.RegisterXSClass(BlackVer, 'http://tempuri.org/', 'BlackVer');
  RemClassRegistry.RegisterXSClass(PicInfo, 'http://tempuri.org/', 'PicInfo');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfPicInfo), 'http://tempuri.org/', 'ArrayOfPicInfo');
  InvRegistry.RegisterInvokeOptions(TypeInfo(ServiceSoap),ioDocument);

end. 