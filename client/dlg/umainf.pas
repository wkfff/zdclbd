unit umainf;
{ 主窗体  监控系统V3.0
  @author()
  @created(2004-03-)
  @lastmod(GMT:$Date: 2012/12/31 05:06:19 $) <BR>
  最后更新人:$Author: wfp $  <BR>
  当前版本:$Revision: 1.3 $  <BR>}

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, ExtCtrls, ToolWin,  Buttons, geome, IniFiles,
  AppEvnts, ActnList, ImgList, se_controls, ksskinstatusbar, Grids, ValEdit,
  StdCtrls, types, DB, DBClient, MConnect, SConnect, xmldom, XMLIntf, msxmldom,
  XMLDoc, ShellAPI, MMSystem, ADODB, MSNPopUp, Gauges, StrUtils,
  Printers, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit, cxSplitter,
  cxInplaceContainer, cxControls,  cxColorComboBox,
  ReadAreaListUnit, FrmAllArea, FrmAreaToDevUnit, SeeEmergncyAlarmDetailFrmUnit, 
  Service, BusinessServerUnit, GpsLibUnit, emapker, MapControlUnit, emapctrl,
  MetaDefine, mapplatform, mapoutlook, CarUnit, ConstDefineUnit, uflash_jk,
  uWatch_Car, USended_Cmd, uReceived_info, udata_display,
  uConfineAreaListFrm, MapShowUnit, QueryPictureListFrmUnit,
  uFrmSearchAddressInMap, ParamFrmUnit, ParamAllFrmUnit, QueryQuestionListFrmUnit,
  Sherryhint, StructDefUnit, SystemLog, MapManagerUnit, InitializeMCUFrmUnit,
  FrmRectangle,  PictureFrmUnit,  FangWeiFrmUnit, QueryDriverIntegralFrmUnit,
  TjGrpDevsFrmUnit,  QueryAudioFrmUnit, EarlyWarningFrmUnit,
  usee_clxx, DriverInfoFrmUnit, QueryCarFrmUnit,  ConfineAreaUnit,
  AnswerListFrmUnit,  FormHisMainUnit, MapSeekCarFormUnit,
   BackCallTelFrmUnit, ControlCarFrmUnit, InfoServerFrmUnit,
  QueryPictureFrmUnit, UpPictureFrmUnit,
    EventListFrmUnit, ClassMenuFrmUnit,
  InfoMenuFrmUnit,   AudioFrmUnit,
  ControlTerminalFrmUnit, ControlMCUFrmUnit, Query_SoundRecordFrmUnit, RunWayFrmUnit,
   ZDCLJKFrmUnit,
  Polling_MCUFrmUnit,
       QueryMessageListFrmUnit, OnLineTjFrmUnit,
  SendSimpleTextUnit,  QueryCmdListFrmUnit,
  frmSendUnit,  DevAlarmInfoFrmUnit, DevModifyFrmUnit,
   uFrmAlarmCar, VSMSClientUnit, ShowMessageInfo, infoFrmUnit,
  QueryThreadUnit, Registry, FrmAlarmNoSybol, cxCheckBox, cxCalendar,
  XPMenu, QueryUpdateRecordFrmUnit, OleCtrls, WMPLib_TLB, FrmERunDataUnit,
  FrmDriverInfoUploadUnit, FrmRecordUnit, FrmDevAreaListUnit,
  FrmAlarmInfoFromDevUnit, FrmQueryAlarmInfoUnit,
  FrmQueryDevGroupOnlineUnit, FrmMileageUnit, QueryAudioListFrnUnit,
  FrmMediaEventUploadUnit, RzBorder, RzLabel, FrmServerInfoUnit, RzButton,
  FrmRecvRunRecDataUnit, MapPubUnit{liusen}, FrmAlarmSuperviseListUnit,
  FrmQueryVideoListUnit, FrmRecvGovInfoUnit, FrmVideoUnit, FrmTSPDataUploadUnit,
  FrmDevKeyEventLogUnit, FrmShowVideoUnit, FrmNoticeUnit, FrmQueryNoticeUnit,
  QueryDevRunStateOnTheTimeFrmUnit,FrmHisListAddrUnit, FrmQueryPhotoPosUnit,
  TipFrmOnMapUnit, RzTabs, uFrmRefreshProgress, FrmQueryDevUploadMileageUnit,
  CmdStructUnit, FrmQuerySetCarRunStatePlanUnit;
 {  taxiRunDataFrmUnit,QueryDbRunDataFrmUnit,EmptyFrmUnit,
  DriverCancelOrderUnit,CancelOrder,QueryOrderListFrmUnit,OrderListFrmUnit,
  ReadMeterParamFrmUnit,  taxiRundataTjByMonthFrmUnit, TjICCardTradeDataFrmUnit,
  QueryICCardTradeDataFrmUnit, AccuseFrmUnit,
   ListeniningFrmUnit,             SendVideoFrmUnit,
   PassengerBlacklist, DriverBlacklist,SendUpBlaceVerFrmUnit,
  Tj_ServeJudgeFrmUnit, ServeJudgeListFrmUnit,ServeJudgeFrmUnit,
  FindThingFrmUnit, LedParamFrmUnit,
 OpenNightModeFrmUnit,SetNightModeFrmUnit, QueryLightStateFrmUnit, LightStateFrmUnit,}
const
  VERSION = '(20130221.0918)';

type
  TEarthRect = record
    SX: double; //SX为开始X点(Strat) ,EX为结束X点(end).
    SY: double;
    EX: double; //SY为开始Y点(Strat) ,EY为Y结束点(End)
    EY: double;
    isCanUse: boolean;
  end;
type
  TValueListEditorAccess = class(TValueListEditor)
  end;
type
  CMap = class(TGpsMap);
  TGetHisThread = class;
  TMainf = class(TForm)
    CoolBar1: TCoolBar;
    Panel_Clxx: TPanel;
    ToolBar2: TToolBar;
    ImageList2: TImageList;
    ToolButton18: TToolButton;
    ActionList1: TActionList;
    sys_com_set: TAction;
    sys_login_again: TAction;
    tool_zoom_in: TAction;
    tool_not_select: TAction;
    sys_change_pass: TAction;
    tool_zoom_out: TAction;
    tool_move: TAction;
    tool_select_point: TAction;
    tool_show_all: TAction;
    tool_bird_eye: TAction;
    ck_DevInfo: TAction;
    fun_watch_car: TAction;
    fun_review: TAction;
    show_car: TAction;
    show_toolbar: TAction;
    help_help: TAction;
    help_about: TAction;
    sys_exit: TAction;
    MainMenu2: TMainMenu;
    N42: TMenuItem;
    N45: TMenuItem;
    N46: TMenuItem;
    N47: TMenuItem;
    N48: TMenuItem;
    N49: TMenuItem;
    N51: TMenuItem;
    N52: TMenuItem;
    N53: TMenuItem;
    N54: TMenuItem;
    N55: TMenuItem;
    N56: TMenuItem;
    N57: TMenuItem;
    N58: TMenuItem;
    N59: TMenuItem;
    N64: TMenuItem;
    N65: TMenuItem;
    N75: TMenuItem;
    N76: TMenuItem;
    N77: TMenuItem;
    N79: TMenuItem;
    N80: TMenuItem;
    N81: TMenuItem;
    N82: TMenuItem;
    N83: TMenuItem;
    fun_watch_cancel: TAction;
    tool_locate: TAction;
    tool_distance: TAction;
    fun_callDev: TAction;
    sys_lock: TAction;
    sys_off: TAction;
    syslock1: TMenuItem;
    N5: TMenuItem;
    fun_view_SwitchStat: TAction;
    ImageList1: TImageList;
    show_sended_command: TAction;
    fun_view_DevParam: TAction;
    N20: TMenuItem;
    Timer: TTimer;
    show_statusBar: TAction;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    PopupMenu_MapTool: TPopupMenu;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;

    fun_DevStat: TAction;
    StatusBar1: TSeSkinStatusBar;
    help_skin1: TAction;
    help_skin2: TAction;
    help_skin3: TAction;
    help_skin4: TAction;
    Panel10: TPanel;
    cmd_cancel: TAction;
    cmd_reSend: TAction;
    PopupMenu_cmd: TPopupMenu;
    N85: TMenuItem;
    N86: TMenuItem;
    N87: TMenuItem;
    cmd_ShowCmd: TAction;
    tool_layer_control: TAction;
    fun_Set_DevParam: TAction;
    N11: TMenuItem;
    fun_refresh_a_dev: TAction;
    fun_refresh_all_dev: TAction;
    N88: TMenuItem;
    fun_Control_Swith: TAction;
    fun_Locate_Car: TAction;
    ToolButton30: TToolButton;
    N92: TMenuItem;
    ApplicationEvents: TApplicationEvents;
    set_AllCarTrack: TAction;
    N94: TMenuItem;
    N96: TMenuItem;
    N95: TMenuItem;
    N97: TMenuItem;
    N98: TMenuItem;
    map_openLayer: TAction;
    map_CloseLayer: TAction;
    N99: TMenuItem;
    N100: TMenuItem;
    fun_ShowACarTrack: TAction;
    N2: TMenuItem;
    ToolButton6: TToolButton;
    fun_sendToDTE: TAction;
    show_Sended_Message: TAction;
    set_AlarmSound: TAction;
    DeviceStateList: TValueListEditor;
    show_ListCar: TAction;
    show_Received_Info: TAction;
    N63: TMenuItem;
    N66: TMenuItem;
    set_SaveWorkShop: TAction;
    N67: TMenuItem;
    PopupMenu_Alarm: TPopupMenu;
    N69: TMenuItem;
    stop_Alarm: TAction;
    N70: TMenuItem;
    show_AlarmStop: TAction;
    showAlarmStop1: TMenuItem;
    fun_Devs_SetParam: TAction;
    tool_RectSelect: TAction;
    N74: TMenuItem;
    ck_car: TAction;
    N78: TMenuItem;
    N109: TMenuItem;
    PopupMenu_DevGroup: TPopupMenu;
    fun_Devs_CallDev: TAction;
    fun_Devs_SendControlInfo: TAction;
    fun_SendToDTEs: TAction;
    N71: TMenuItem;
    N116: TMenuItem;
    show_MapToolbar: TAction;
    N104: TMenuItem;
    tool_SetConfineAlarmArea: TAction;
    Action11: TMenuItem;
    show_ConfineAreaList: TAction;
    N122: TMenuItem;
    N123: TMenuItem;
    show_AlarmLists: TAction;
    N121: TMenuItem;
    PopupMenu_SelectDevs: TPopupMenu;
    SelectDevs: TAction;
    N124: TMenuItem;
    Panel_clxx_else: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    show_SearchAddress: TAction;
    N127: TMenuItem;
    fun_SetDevTelList: TAction;
    fun_SendControlInfo: TAction;
    fun_SendControlInfo_NeedAnswer: TAction;
    fun_PursueDev: TAction;
    N128: TMenuItem;
    fun_ModifyDisplayName: TAction;
    fun_ModifyLCDMenu: TAction;
    fun_Devs_SendControlInfo_NeedAnswer: TAction;
    fun_UpdateDevFirmWare: TAction;
    N102: TMenuItem;
    fun_Devs_SetDevTelList: TAction;
    fun_Devs_PursueDev: TAction;
    fun_Devs_ModifyLCDMenu: TAction;
    fun_Devs_ModifyDisplayName: TAction;
    fun_Devs_UpdateFirmWare: TAction;
    N135: TMenuItem;
    ck_DriverInfo: TAction;
    ck_TaxiMetaInfo: TAction;
    show_TaxiMetaRunData: TAction;
    N136: TMenuItem;
    N137: TMenuItem;
    N27: TMenuItem;
    MSNPopUp1: TMSNPopUp;
    fun_TaxiMeterStopDateTime: TAction;
    fun_Devs_TaxiMeterStopDateTime: TAction;
    fun_SendOrder: TAction;
    Selected: TAction;
    N144: TMenuItem;
    N145: TMenuItem;
    fun_CancelOrderMenu: TAction;
    fun_Devs_CancelOrderMenu: TAction;
    SelectDeviceMenu: TMainMenu;
    N152: TMenuItem;
    N153: TMenuItem;
    N154: TMenuItem;
    SplitterRight: TcxSplitter;
    ToolBar1: TToolBar;
    ToolButton28: TToolButton;
    ToolButton29: TToolButton;
    PopupMenuSelected: TPopupMenu;
    N155: TMenuItem;
    N156: TMenuItem;
    ToolButton37: TToolButton;
    Sel_Dev_Empty: TAction;
    Sel_Dev_Full: TAction;
    Sel_Dev_Online: TAction;
    Sel_Dev_Postion: TAction;
    Sel_Dev_Not_Online: TAction;
    Sel_Dev_Not_Postion: TAction;
    N160: TMenuItem;
    N161: TMenuItem;
    N162: TMenuItem;
    N163: TMenuItem;
    N164: TMenuItem;
    N165: TMenuItem;
    N166: TMenuItem;
    ToolButton34: TToolButton;
    ck_SendMsgList: TAction;
    ck_SendOrderList: TAction;
    Timer1: TTimer;
    N179: TMenuItem;
    N180: TMenuItem;
    SystemConfig: TAction;
    SystemConfig1: TMenuItem;
    fun_SwitchToMe: TAction;
    dddd1: TMenuItem;
    fun_TermToTouShu: TAction;
    fun_SetCutOilElec: TAction;
    fun_DevHide: TAction;
    N186: TMenuItem;
    fun_Devs_Show: TAction;
    N187: TMenuItem;
    Hot_zoom_in: TAction;
    Hot_zoom_out: TAction;
    Hot_zoom_in2: TAction;
    Hot_zoom_out2: TAction;
    Hot_Left: TAction;
    Hot_Right: TAction;
    Hot_Up: TAction;
    Hot_Down: TAction;
    help_test: TAction;
    fun_ReadDevVersion: TAction;
    Hot_Map_KeyDown: TAction;
    Hot_Map_KeyUp: TAction;
    MSNPopUp2: TMSNPopUp;
    Map_AddNode: TAction;
    Map_DelNode: TAction;
    Map_Set_DefaultNode: TAction;
    PopupMenuMapSet: TPopupMenu;
    N189: TMenuItem;
    N190: TMenuItem;
    N191: TMenuItem;
    Map_Save: TAction;
    N192: TMenuItem;
    Map_Reflash: TAction;
    N193: TMenuItem;
    N194: TMenuItem;
    N195: TMenuItem;
    N196: TMenuItem;
    N197: TMenuItem;
    N198: TMenuItem;
    N199: TMenuItem;
    Map_SaveAsNode: TAction;
    Map_ImputNode: TAction;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    N200: TMenuItem;
    N201: TMenuItem;
    N202: TMenuItem;
    fun_SetDownTime: TAction;
    fun_History: TAction;
    ToolButton40: TToolButton;
    Map_Manage: TAction;
    help_Update: TAction;
    N205: TMenuItem;
    tool_UserDefinedtext: TAction;
    TabSheet5: TTabSheet;
    N206: TMenuItem;
    cxDeviceListText: TcxTreeList;
    text_Id: TcxTreeListColumn;
    Text_Name: TcxTreeListColumn;
    ToolBar4: TToolBar;
    BitBtnEditText: TBitBtn;
    BitBtnDelText: TBitBtn;
    PopupMenuText: TPopupMenu;
    MenuItemEditText: TMenuItem;
    MenuItemDelText: TMenuItem;
    show_Map: TAction;
    Panel_center: TPanel;
    N207: TMenuItem;
    SplitterBottom: TcxSplitter;
    N208: TMenuItem;
    fun_ChangeMap: TAction;
    show_fullScreen: TAction;
    BitBtnFullScreen: TBitBtn;
    N209: TMenuItem;
    N210: TMenuItem;
    ToolBarMenu: TToolBar;
    fun_Devs_Hide: TAction;
    N212: TMenuItem;
    N214: TMenuItem;
    N216: TMenuItem;
    fun_Devs_Hide_All: TAction;
    fun_Devs_Show_All: TAction;
    N218: TMenuItem;
    fun_Devs_Show_Only: TAction;
    N217: TMenuItem;
    fun_ReadDriverInfo: TAction;
    N219: TMenuItem;
    ck_DriverOnOffDuty: TAction;
    Map_ChangeNodeName: TAction;
    N224: TMenuItem;
    fun_GetAPicture: TAction;
    fun_Devs_GetAPicture: TAction;
    tool_SetRunWay: TAction;
    Print_Screen: TAction;
    N228: TMenuItem;
    PrintDialog1: TPrintDialog;
    Print_Map: TAction;
    N229: TMenuItem;
    MapSaveToJpeg: TAction;
    N230: TMenuItem;
    ck_Picture: TAction;
    N231: TMenuItem;
    show_Picture: TAction;
    fun_ReadGPRSFlux: TAction;
    GPRS1: TMenuItem;
    TimerCall: TTimer;
    PanelShowMessage: TPanel;
    MemoGateWay: TMemo;
    MemoBs: TMemo;
    Set_HisTrack: TAction;
    N237: TMenuItem;
    ValueListEditorOnline: TValueListEditor;
    fun_SendAdInfo: TAction;
    fun_SendDelAdInfo: TAction;
    fun_SendListenTEL: TAction;
    show_GPSHostory: TAction;
    N241: TMenuItem;
    ck_StopRecord: TAction;
    N248: TMenuItem;
    fun_BrakeState: TAction;
    fun_CallDriver: TAction;
    tool_SetFactory: TAction;
    N254: TMenuItem;
    ck_taximetaRundataTj: TAction;
    tool_SeekCar: TAction;
    N261: TMenuItem;
    ck_DevHourDis: TAction;
    ckDevHourDis1: TMenuItem;
    fun_ReadDevHourDis: TAction;
    N264: TMenuItem;
    N269: TMenuItem;
    N270: TMenuItem;
    fun_Devs_ReadDevHourDis: TAction;
    Set_DevOil: TAction;
    N277: TMenuItem;
    N278: TMenuItem;
    fun_ReadallAd: TAction;
    ck_empty: TAction;
    ck_emptyCarNo: TAction;
    tool_StationAdd: TAction;
    fun_SetEmptyWord: TAction;
    ck_MonthSpeed: TAction;
    Set_ZtCarrySound: TAction;
    set_sleepTime: TAction;
    tool_SetAreaAlarmToDev_Circle: TAction;
    ReadAlarmAreaFroDev: TAction;
    N289: TMenuItem;
    ck_QueryAreaAlarm: TAction;
    SmsCmd_UpgradeDevFirmware: TAction;
    SmsCmd_RemoveAlarm: TAction;
    SmsCmd_DevRestart: TAction;
    SmsCmd_ControlDev: TAction;
    SmsCmd_SetDevParam: TAction;
    ADOQuery1: TADOQuery;
    ADOConnection1: TADOConnection;
    fun_ReadPicTimesInfo: TAction;
    fun_ReadThePic: TAction;
    ck_OverSpeedInfo: TAction;
    N151: TMenuItem;
    ck_TjAreaWarn: TAction;
    ck_TjOverSpeed: TAction;
    N213: TMenuItem;
    N225: TMenuItem;
    ck_EmergncyAlarmInfo: TAction;
    N240: TMenuItem;
    fun_CallTheDev: TAction;
    Menu_MainShow: TMenuItem;
    fun_DevShowOnly: TAction;
    N251: TMenuItem;
    fun_ReadDevVersion_Extend: TAction;
    N101: TMenuItem;
    fun_ReadDevTelList: TAction;
    fun_ReadLCDMenu: TAction;
    fun_StopUploadSavedPic: TAction;
    Show_ListeningDev: TAction;
    PopupMenu_funDev: TPopupMenu;
    Menu_MainShow1: TMenuItem;
    N93: TMenuItem;
    N3: TMenuItem;
    N105: TMenuItem;
    N185: TMenuItem;
    N275: TMenuItem;
    N4: TMenuItem;
    N17: TMenuItem;
    N19: TMenuItem;
    N91: TMenuItem;
    N284: TMenuItem;
    N222: TMenuItem;
    N272: TMenuItem;
    N103: TMenuItem;
    GPRS2: TMenuItem;
    N300: TMenuItem;
    ck_DriverFatigueRecord: TAction;
    ck_TjGrpDevs: TAction;
    N287: TMenuItem;
    ck_DevMonthRunInfo: TAction;
    N291: TMenuItem;
    N6: TMenuItem;
    N10: TMenuItem;
    fun_setDevEventList: TAction;
    fun_Devs_SetDevEventList: TAction;
    fun_sendQuestion: TAction;
    fun_Devs_SendDevQuestion: TAction;
    N61: TMenuItem;
    N62: TMenuItem;
    ck_ServeJudge: TAction;
    N73: TMenuItem;
    N84: TMenuItem;
    N89: TMenuItem;
    N90: TMenuItem;
    N106: TMenuItem;
    N107: TMenuItem;
    fun_FindPostion: TAction;
    N111: TMenuItem;
    N112: TMenuItem;
    N113: TMenuItem;
    N114: TMenuItem;
    fun_sendAntiFake: TAction;
    fun_Devs_sendAntiFake: TAction;
    fun_SendBackCallTel: TAction;
    fun_Devs_SendBackCallTel: TAction;
    N118: TMenuItem;
    N119: TMenuItem;
    fun_SendControlCar: TAction;
    fun_Devs_SendControlCar: TAction;
    N120: TMenuItem;
    N125: TMenuItem;
    fun_SendInfoServer: TAction;
    fun_Devs_SendInfoServer: TAction;
    N126: TMenuItem;
    N129: TMenuItem;
    fun_SendQueryPicture: TAction;
    fun_Devs_SendQueryPicture: TAction;
    fun_Devs_SendUpPicture: TAction;
    fun_SendUpPicture: TAction;
    fun_SendSetNightMode: TAction;
    fun_Devs_SendSetNightMode: TAction;
    fun_SendStopAntiFake: TAction;
    fun_Devs_SendStopAntiFake: TAction;
    fun_SendOpenNightMode: TAction;
    fun_Devs_SendOpenNightMode: TAction;
    fun_SendVideo: TAction;
    fun_Devs_SendVideo: TAction;
    Show_EventList: TAction;
    fun_SendClassInfoMenu: TAction;
    fun_Devs_SendClassInfoMenu: TAction;
    Show_AnswerList: TAction;
    fun_SendInfoMenu: TAction;
    fun_Devs_SendInfoMenu: TAction;
    N168: TMenuItem;
    N169: TMenuItem;
    fun_QueryLightState: TAction;
    fun_devs_QueryLightState: TAction;
    show_LightStateList: TAction;
    fun_QueryLedState: TAction;
    fun_Devs_QueryLedState: TAction;
    fun_InitializeMCU: TAction;
    fun_Devs_InitializeMCU: TAction;
    fun_ControlTerminal: TAction;
    fun_Devs_ControlTerminal: TAction;
    N173: TMenuItem;
    N174: TMenuItem;
    fun_ControlMCU: TAction;
    fun_Devs_ControlMCU: TAction;
    fun_QueryLcdState: TAction;
    fun_Devs_QueryLcdState: TAction;
    fun_ResetLCD: TAction;
    fun_Devs_ResetLCD: TAction;
    fun_OpenLCD: TAction;
    fun_Devs_OpenLCD: TAction;
    fun_SendViewAdInfo: TAction;
    fun_Devs_SendViewAdInfo: TAction;
    fun_SendDownLoadAdInfo: TAction;
    fun_Devs_SendDownLoadAdInfo: TAction;
    fun_Devs_QueryAdInfo: TAction;
    fun_QueryAdInfo: TAction;
    fun_QueryALLAdInfo: TAction;
    fun_SendDeleteAdInfo: TAction;
    fun_SendDeleteAllAdInfo: TAction;
    fun_Devs_SendDeleteAllAdInfo: TAction;
    ImageListCarPicInMap: TImageList;
    N232: TMenuItem;
    ck_MessageList: TAction;
    N234: TMenuItem;
    tj_ServeJudge: TAction;
    N239: TMenuItem;
    show_EarlyWarningCar: TAction;
    fun_SendQueryAudio: TAction;
    fun_Devs_SendQueryAudio: TAction;
    fun_Polling_MCU: TAction;
    fun_Devs_Polling_MCU: TAction;
    N280: TMenuItem;
    Show_Prompt_Info: TAction;
    N204: TMenuItem;
    Show_QueryPictureList: TAction;
    ShowQueryPictureList1: TMenuItem;
    Show_ServeJudgeList: TAction;
    show_Audio: TAction;
    N285: TMenuItem;
    fun_SetMeterParam: TAction;
    fun_Devs_SetMeterParam: TAction;
    fun_ReadMeterParam: TAction;
    fun_QueryMeterState: TAction;
    fun_Devs_QueryMeterState: TAction;
    fun_QueryTSMState: TAction;
    fun_Devs_QueryTSMState: TAction;
    fun_CancelOrder: TAction;
    sys_manage_driverBlacklist: TAction;
    sys_manage_passengerblacklist: TAction;
    ck_DriverIntegral: TAction;
    N311: TMenuItem;
    N306: TMenuItem;
    N316: TMenuItem;
    tool_FindThing: TAction;
    show_FindThing: TAction;
    ck_QuestionList: TAction;
    N315: TMenuItem;
    ck_QueryCmdList: TAction;
    N317: TMenuItem;
    fun_QueryBlackVer: TAction;
    fun_sendUpBlace: TAction;
    fun_Devs_SendUpBlackVer: TAction;
    ImageListMapCar: TImageList;
    ToolButton12: TToolButton;
    PopupMenu1: TPopupMenu;
    N320: TMenuItem;
    N321: TMenuItem;
    N322: TMenuItem;
    ImageList3: TImageList;
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Splitter_DevSwitch: TSplitter;
    Panel3: TPanel;
    Panel4: TPanel;
    Edit2: TEdit;
    Panel8: TPanel;
    ToolBar3: TToolBar;
    Label1: TLabel;
    Edit1: TEdit;
    ToolButton36: TToolButton;
    ListDevice: TValueListEditor;
    ComboBoxCarNO: TComboBox;
    Splitter2: TSplitter;
    PageControl2: TPageControl;
    TreeView1: TTreeView;
    N323: TMenuItem;
    Show_Abnormal_CarList: TAction;
    PopupMenu2: TPopupMenu;
    N324: TMenuItem;
    N325: TMenuItem;
    N326: TMenuItem;
    N327: TMenuItem;
    fun_Devs_FindPostion: TAction;
    N13: TMenuItem;
    N14: TMenuItem;
    funDevsSendControl1: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N18: TMenuItem;
    N28: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    N43: TMenuItem;
    N44: TMenuItem;
    fun_PlayMusic: TAction;
    fun_StopMusic: TAction;
    fun_showinfoFrm: TAction;
    TimerCheckUpdate: TTimer;
    ck_UpdateRecord: TAction;
    N50: TMenuItem;
    N1: TMenuItem;
    fun_zdgz: TAction;
    Tj_Online: TAction;
    Info_DevModify: TAction;
    Info_DevAlarmInfo: TAction;
    Info_SysManage: TAction;
    tool_SetAreaAlarmToDev_Rect: TAction;
    tool_SetAreaAlarmToDev_Polygon: TAction;
    fun_Devs_Record: TAction;
    fun_Record: TAction;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N12: TMenuItem;
    N39: TMenuItem;
    N60: TMenuItem;
    N68: TMenuItem;
    N72: TMenuItem;
    fun_SetAreaToDev: TAction;
    fun_DelAreaFromDev: TAction;
    N108: TMenuItem;
    N110: TMenuItem;
    fun_DelAllAreaFromDev: TAction;
    N115: TMenuItem;
    fun_SendTSPData: TAction;
    fun_Devs_SendTSPData: TAction;
    fun_CollectRunRecData: TAction;
    fun_Devs_CollectRunRecData: TAction;
    N117: TMenuItem;
    N130: TMenuItem;
    fun_SetRunRecParam: TAction;
    fun_Devs_SetRunRecParam: TAction;
    N131: TMenuItem;
    N132: TMenuItem;
    N133: TMenuItem;
    N134: TMenuItem;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton13: TToolButton;
    ToolButton15: TToolButton;
    show_DevAlarm: TAction;
    N138: TMenuItem;
    Panel5: TPanel;
    TreeView2: TTreeView;
    SplitterLeft: TcxSplitter;
    show_ERunDataList: TAction;
    show_DriverUploadInfoList: TAction;
    N139: TMenuItem;
    N140: TMenuItem;
    N141: TMenuItem;
    N142: TMenuItem;
    N143: TMenuItem;
    ClearLooksBLUE1: TMenuItem;
    ClearLooksHUMAN1: TMenuItem;
    CrystalClearCRCL1S1: TMenuItem;
    GUIRelaxCINDER1: TMenuItem;
    GUIRelaxSKYMAN1: TMenuItem;
    GUIRelaxSUBTLE1: TMenuItem;
    iTunes1: TMenuItem;
    macos1: TMenuItem;
    MSN1: TMenuItem;
    office20031: TMenuItem;
    office20071: TMenuItem;
    ONaturalBLUE1: TMenuItem;
    OpusOSBLUEB21: TMenuItem;
    OpusOSDEEP21: TMenuItem;
    OpusOSOLIVE1: TMenuItem;
    Royale1BLUE1: TMenuItem;
    Royale1HOMESTEAD1: TMenuItem;
    Royale1METALLIC1: TMenuItem;
    RoyaleGlassGRAPHITE1: TMenuItem;
    SamuiSAMUI221: TMenuItem;
    D4PANTHER1: TMenuItem;
    iger2TGR1: TMenuItem;
    iger2TGRPS1: TMenuItem;
    igerWINDOWB1: TMenuItem;
    igerWINDOWG1: TMenuItem;
    VistaXPVISTAXPB21: TMenuItem;
    Xplorer1: TMenuItem;
    skinDefault: TMenuItem;
    ValueListEditorOnlineByGroup: TValueListEditor;
    fun_DealEmgcyAlarm: TAction;
    N146: TMenuItem;
    N147: TMenuItem;
    N148: TMenuItem;
    ck_devalarm: TAction;
    N149: TMenuItem;
    ck_devgrouponline: TAction;
    N150: TMenuItem;
    ck_devmileage: TAction;
    N157: TMenuItem;
    show_QueryAudioList: TAction;
    N158: TMenuItem;
    sys_infotype: TAction;
    sys_info: TAction;
    N159: TMenuItem;
    N167: TMenuItem;
    N170: TMenuItem;
    timerSendInfo: TTimer;
    show_MediaEventUpload: TAction;
    N171: TMenuItem;
    ToolButton16: TToolButton;
    Panel6: TPanel;
    RzLabel1: TRzLabel;
    timerScrollAlarm: TTimer;
    show_SrvRunInfo: TAction;
    N172: TMenuItem;
    N175: TMenuItem;
    Panel7: TPanel;
    cbxSearchType: TComboBox;
    edtCondition: TEdit;
    btnSearch: TRzBitBtn;
    show_RunRecData: TAction;
    N176: TMenuItem;
    show_AlarmSupervise: TAction;
    fun_SendQueryVideo: TAction;
    show_QueryVideoList: TAction;
    N177: TMenuItem;
    N178: TMenuItem;
    fun_Devs_SendQueryVideo: TAction;
    N181: TMenuItem;
    show_RecvGovInfo: TAction;
    ListSelectDev: TcxTreeList;
    ListSelectDev_DevId: TcxTreeListColumn;
    ListSelectDev_CarNo: TcxTreeListColumn;
    ListSelectDevcxTreeListColumn1: TcxTreeListColumn;
    ListSelectDevcxTreeListColumn2: TcxTreeListColumn;
    ListSelectDevcxTreeListColumn3: TcxTreeListColumn;
    ListSelectDevcxTreeListColumn4: TcxTreeListColumn;
    ListSelectDevcxTreeListColumn5: TcxTreeListColumn;
    ListSelectDevcxTreeListColumn6: TcxTreeListColumn;
    rbFuzzy: TRadioButton;
    rbPrecise: TRadioButton;
    show_applyGpsDataFromGov: TAction;
    show_cancelGpsDataFromGov: TAction;
    N182: TMenuItem;
    N183: TMenuItem;
    N184: TMenuItem;
    N188: TMenuItem;
    show_video: TAction;
    show_tspDataUpload: TAction;
    N203: TMenuItem;
    fun_readVer: TAction;
    N211: TMenuItem;
    help_updatelog: TAction;
    N215: TMenuItem;
    show_DevKeyEventLog: TAction;
    N220: TMenuItem;
    N221: TMenuItem;
    N223: TMenuItem;
    N226: TMenuItem;
    show_areaToDev: TAction;
    N227: TMenuItem;
    fun_OrderVideo: TAction;
    N233: TMenuItem;
    N235: TMenuItem;
    ck_notice: TAction;
    N236: TMenuItem;
    sys_feedback: TAction;
    N238: TMenuItem;
    Ck_QueryDevRunStateOnTheTime: TAction;
    N242: TMenuItem;
    ck_queryPhotoPos: TAction;
    N243: TMenuItem;
    fun_photo_fatigue: TAction;
    N244: TMenuItem;
    PageControlBottom: TRzPageControl;
    PageControl_Center: TRzPageControl;
    sys_refresh: TAction;
    ck_queryDevMileage: TAction;
    N245: TMenuItem;
    ck_querySetCarRunStatePlan: TAction;
    N246: TMenuItem;
    fun_setCarRunStatePlan: TAction;
    N247: TMenuItem;
    fun_upgradeterminal: TAction;
    N249: TMenuItem;



    procedure Panel4Click(Sender: TObject);
 //   procedure sys_login_againExecute(Sender: TObject);
    procedure sys_change_passExecute(Sender: TObject);
    procedure show_carExecute(Sender: TObject);
    procedure show_watchExecute(Sender: TObject);
    procedure show_toolbarExecute(Sender: TObject);

    procedure ck_DevInfoExecute(Sender: TObject);
    procedure tool_moveExecute(Sender: TObject);
    procedure tool_zoom_inExecute(Sender: TObject);
    procedure tool_zoom_outExecute(Sender: TObject);
    procedure tool_locateExecute(Sender: TObject);
    procedure tool_distanceExecute(Sender: TObject);
    procedure tool_select_pointExecute(Sender: TObject);
    procedure tool_not_selectExecute(Sender: TObject);
    procedure help_aboutExecute(Sender: TObject);
    procedure sys_exitExecute(Sender: TObject);
    procedure tool_bird_eyeExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure fun_callDevExecute(Sender: TObject);
    procedure sys_lockExecute(Sender: TObject);
    procedure sys_offExecute(Sender: TObject);
    procedure fun_view_SwitchStatExecute(Sender: TObject);
    procedure fun_watch_carExecute(Sender: TObject);
    procedure fun_view_DevParamExecute(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure show_statusBarExecute(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure fun_DevStatExecute(Sender: TObject);

    procedure TrackBarOutlookChange(Sender: TObject);
    procedure Panel_MapResize(Sender: TObject);
    procedure cmd_cancelExecute(Sender: TObject);
    procedure cmd_reSendExecute(Sender: TObject);
    procedure tool_layer_controlExecute(Sender: TObject);
    procedure fun_Set_DevParamExecute(Sender: TObject);
    procedure fun_refresh_all_devExecute(Sender: TObject);
    procedure fun_Locate_CarExecute(Sender: TObject);
    procedure fun_watch_cancelExecute(Sender: TObject);
    procedure ApplicationEventsException(Sender: TObject; E: Exception);
    procedure set_AllCarTrackExecute(Sender: TObject);
    procedure map_openLayerExecute(Sender: TObject);
    procedure map_CloseLayerExecute(Sender: TObject);
    procedure fun_ShowACarTrackExecute(Sender: TObject);
//    procedure fun_sendToDTEExecute(Sender: TObject);
    procedure show_Sended_MessageExecute(Sender: TObject);
    procedure set_AlarmSoundExecute(Sender: TObject);
    procedure show_ListCarExecute(Sender: TObject);
    procedure show_sended_commandExecute(Sender: TObject);
    procedure show_Received_InfoExecute(Sender: TObject);
    procedure set_SaveWorkShopExecute(Sender: TObject);
    procedure stop_AlarmExecute(Sender: TObject);
    procedure show_AlarmStopExecute(Sender: TObject);
    procedure fun_Devs_SetParamExecute(Sender: TObject);
    procedure tool_RectSelectExecute(Sender: TObject);
    procedure ck_carExecute(Sender: TObject);
    procedure PageControlBottomDockDrop(Sender: TObject;
      Source: TDragDockObject; X, Y: Integer);
    procedure PageControlBottomUnDock(Sender: TObject; Client: TControl;
      NewTarget: TWinControl; var Allow: Boolean);
    procedure Panel_ClxxResize(Sender: TObject);
    procedure fun_Devs_CallDevExecute(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure fun_Devs_SendControlInfoExecute(Sender: TObject);
//    procedure fun_SendToDTEsExecute(Sender: TObject);
    procedure show_MapToolbarExecute(Sender: TObject);
    procedure tool_SetConfineAlarmAreaExecute(Sender: TObject);
    procedure ListSelectDevFocusedNodeChanged(Sender: TObject;
      APrevFocusedNode, AFocusedNode: TcxTreeListNode);
    procedure show_ConfineAreaListExecute(Sender: TObject);
    procedure show_AlarmListsExecute(Sender: TObject);
    procedure SelectDevsExecute(Sender: TObject);
    procedure show_SearchAddressExecute(Sender: TObject);
    procedure fun_SetDevTelListExecute(Sender: TObject);
    procedure fun_SendControlInfoExecute(Sender: TObject);
    procedure fun_SendControlInfo_NeedAnswerExecute(Sender: TObject);
    procedure fun_PursueDevExecute(Sender: TObject);
    procedure fun_Devs_PursueDevExecute(Sender: TObject);
    procedure fun_Devs_SendControlInfo_NeedAnswerExecute(Sender: TObject);
    procedure fun_Devs_SetDevTelListExecute(Sender: TObject);
    procedure ck_DriverInfoExecute(Sender: TObject);
    procedure fun_SendOrderExecute(Sender: TObject);
    procedure SelectedExecute(Sender: TObject);
    procedure PopupMenu_cmdPopup(Sender: TObject);
    procedure fun_CancelOrderMenuExecute(Sender: TObject);
    procedure fun_Devs_CancelOrderMenuExecute(Sender: TObject);
    procedure cxSplitter1CanResize(Sender: TObject; var NewSize: Integer;
      var Accept: Boolean);
    procedure SplitterRightAfterOpen(Sender: TObject);
    procedure PopupMenu_DevGroupPopup(Sender: TObject);
    procedure Sel_Dev_EmptyExecute(Sender: TObject);
    procedure Sel_Dev_FullExecute(Sender: TObject);
    procedure Sel_Dev_OnlineExecute(Sender: TObject);
    procedure Sel_Dev_PostionExecute(Sender: TObject);
    procedure Sel_Dev_Not_OnlineExecute(Sender: TObject);
    procedure Sel_Dev_Not_PostionExecute(Sender: TObject);
    procedure SplitterBottomBeforeOpen(Sender: TObject;
      var AllowOpen: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SystemConfigExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fun_DevHideExecute(Sender: TObject);
    procedure fun_Devs_ShowExecute(Sender: TObject);
    procedure Hot_zoom_inExecute(Sender: TObject);
    procedure Hot_zoom_outExecute(Sender: TObject);
    procedure Hot_zoom_in2Execute(Sender: TObject);
    procedure Hot_zoom_out2Execute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Hot_LeftExecute(Sender: TObject);
    procedure Hot_RightExecute(Sender: TObject);
    procedure Hot_UpExecute(Sender: TObject);
    procedure Hot_DownExecute(Sender: TObject);
    procedure Map_AddNodeExecute(Sender: TObject);
    procedure Map_SaveExecute(Sender: TObject);
    procedure Map_DelNodeExecute(Sender: TObject);
    procedure Map_Set_DefaultNodeExecute(Sender: TObject);
    procedure TreeViewMapContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure Map_ReflashExecute(Sender: TObject);
    procedure TreeViewMapDblClick(Sender: TObject);
    procedure CheckBoxIsShowFileClick(Sender: TObject);
    procedure Map_SaveAsNodeExecute(Sender: TObject);
    procedure Map_ImputNodeExecute(Sender: TObject);
    procedure fun_SetDownTimeExecute(Sender: TObject);
    procedure fun_HistoryExecute(Sender: TObject);
    procedure help_UpdateExecute(Sender: TObject);
    procedure tool_UserDefinedtextExecute(Sender: TObject);
    procedure cxDeviceListTextDblClick(Sender: TObject);
    procedure BitBtnEditTextClick(Sender: TObject);
    procedure show_MapExecute(Sender: TObject);
    procedure PageControl_CenterDockDrop(Sender: TObject;
      Source: TDragDockObject; X, Y: Integer);
    procedure PageControl_CenterUnDock(Sender: TObject; Client: TControl;
      NewTarget: TWinControl; var Allow: Boolean);
//    procedure EditSearchCarNoChange(Sender: TObject);
//    procedure ListBoxSearchCarNoClick(Sender: TObject);
    procedure ComboBoxCarNOKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBoxCarNOChange(Sender: TObject);
    procedure ComboBoxCarNOSelect(Sender: TObject);
    procedure fun_ChangeMapExecute(Sender: TObject);
    procedure ComboBoxCarNODblClick(Sender: TObject);
    procedure ComboBoxCarNOKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure show_fullScreenExecute(Sender: TObject);
    procedure Map_ManageExecute(Sender: TObject);
    procedure fun_Devs_HideExecute(Sender: TObject);
    procedure fun_Devs_Hide_AllExecute(Sender: TObject);
    procedure fun_Devs_Show_OnlyExecute(Sender: TObject);
    procedure Map_ChangeNodeNameExecute(Sender: TObject);
    procedure fun_GetAPictureExecute(Sender: TObject);
    procedure tool_SetRunWayExecute(Sender: TObject);
    procedure Print_ScreenExecute(Sender: TObject);
    procedure Print_MapExecute(Sender: TObject);
    procedure MapSaveToJpegExecute(Sender: TObject);
    procedure ck_PictureExecute(Sender: TObject);
    procedure show_PictureExecute(Sender: TObject);
    procedure PageControlBottomChange(Sender: TObject);
//    procedure TimerUpdateTimer(Sender: TObject);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure Set_HisTrackExecute(Sender: TObject);
    procedure ComboBoxCarNOClick(Sender: TObject);
    procedure show_GPSHostoryExecute(Sender: TObject);
    procedure tool_SetFactoryExecute(Sender: TObject);
    procedure tool_SeekCarExecute(Sender: TObject);
    procedure tool_SetAreaAlarmToDev_CircleExecute(Sender: TObject);
    procedure ReadAlarmAreaFroDevExecute(Sender: TObject);
    procedure fun_DevShowOnlyExecute(Sender: TObject);
    procedure Show_ListeningDevExecute(Sender: TObject);
    procedure ck_TjGrpDevsExecute(Sender: TObject);
    procedure DeviceStateListDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure fun_setDevEventListExecute(Sender: TObject);
    procedure fun_Devs_SetDevEventListExecute(Sender: TObject);
    procedure fun_sendQuestionExecute(Sender: TObject);
    procedure fun_Devs_SendDevQuestionExecute(Sender: TObject);
    procedure ck_ServeJudgeExecute(Sender: TObject);
    procedure fun_FindPostionExecute(Sender: TObject);
    procedure fun_sendAntiFakeExecute(Sender: TObject);
    procedure fun_Devs_sendAntiFakeExecute(Sender: TObject);
    procedure fun_SendBackCallTelExecute(Sender: TObject);
    procedure fun_Devs_SendBackCallTelExecute(Sender: TObject);
    procedure fun_SendControlCarExecute(Sender: TObject);
    procedure fun_Devs_SendControlCarExecute(Sender: TObject);
    procedure fun_SendInfoServerExecute(Sender: TObject);
    procedure fun_Devs_SendInfoServerExecute(Sender: TObject);
    procedure fun_SendQueryPictureExecute(Sender: TObject);
    procedure fun_Devs_SendQueryPictureExecute(Sender: TObject);
    procedure fun_SendUpPictureExecute(Sender: TObject);
    procedure fun_Devs_SendUpPictureExecute(Sender: TObject);
    procedure fun_SendStopAntiFakeExecute(Sender: TObject);
    procedure Show_EventListExecute(Sender: TObject);
    procedure fun_Devs_SendClassInfoMenuExecute(Sender: TObject);
    procedure fun_SendClassInfoMenuExecute(Sender: TObject);
    procedure Show_AnswerListExecute(Sender: TObject);
    procedure fun_SendInfoMenuExecute(Sender: TObject);
    procedure fun_Devs_SendInfoMenuExecute(Sender: TObject);
    procedure fun_InitializeMCUExecute(Sender: TObject);
    procedure fun_Devs_InitializeMCUExecute(Sender: TObject);
    procedure fun_ControlTerminalExecute(Sender: TObject);
    procedure fun_Devs_ControlTerminalExecute(Sender: TObject);
    procedure fun_ControlMCUExecute(Sender: TObject);
    procedure fun_Devs_ControlMCUExecute(Sender: TObject);
    procedure N81Click(Sender: TObject);
    procedure ck_MessageListExecute(Sender: TObject);
    procedure show_EarlyWarningCarExecute(Sender: TObject);
    procedure fun_SendQueryAudioExecute(Sender: TObject);
    procedure fun_Devs_SendQueryAudioExecute(Sender: TObject);
    procedure fun_Polling_MCUExecute(Sender: TObject);
    procedure fun_Devs_Polling_MCUExecute(Sender: TObject);
    procedure Show_Prompt_InfoExecute(Sender: TObject);
    procedure Show_QueryPictureListExecute(Sender: TObject);
    procedure sys_manage_driverBlacklistExecute(Sender: TObject);
    procedure sys_manage_passengerblacklistExecute(Sender: TObject);
    procedure N311Click(Sender: TObject);
    procedure show_FindThingExecute(Sender: TObject);
    procedure tool_FindThingExecute(Sender: TObject);
    procedure ck_QuestionListExecute(Sender: TObject);
    procedure ck_QueryCmdListExecute(Sender: TObject);
    procedure fun_QueryBlackVerExecute(Sender: TObject);
    procedure N320Click(Sender: TObject);
    procedure N321Click(Sender: TObject);
    procedure N322Click(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure TreeView1Click(Sender: TObject);
    procedure TreeView1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure TreeView1DblClick(Sender: TObject);
    procedure PageControl_CenterChange(Sender: TObject);
    procedure N323Click(Sender: TObject);
    procedure Show_Abnormal_CarListExecute(Sender: TObject);
    procedure ToolButton17Click(Sender: TObject);
    procedure N327Click(Sender: TObject);
    procedure fun_Devs_GetAPictureExecute(Sender: TObject);
    procedure ck_UpdateRecordExecute(Sender: TObject);
    procedure fun_zdgzExecute(Sender: TObject);
    procedure Tj_OnlineExecute(Sender: TObject);
    procedure Info_DevModifyExecute(Sender: TObject);
    procedure Info_DevAlarmInfoExecute(Sender: TObject);
    procedure Info_SysManageExecute(Sender: TObject);
    procedure tool_SetAreaAlarmToDev_RectExecute(Sender: TObject);
    procedure tool_SetAreaAlarmToDev_PolygonExecute(Sender: TObject);
    procedure fun_Devs_RecordExecute(Sender: TObject);
    procedure fun_RecordExecute(Sender: TObject);
    procedure fun_SetAreaToDevExecute(Sender: TObject);
    procedure fun_DelAreaFromDevExecute(Sender: TObject);
    procedure fun_DelAllAreaFromDevExecute(Sender: TObject);
    procedure fun_SendTSPDataExecute(Sender: TObject);
    procedure fun_Devs_SendTSPDataExecute(Sender: TObject);
    procedure fun_CollectRunRecDataExecute(Sender: TObject);
    procedure fun_Devs_SetRunRecParamExecute(Sender: TObject);
    procedure fun_Devs_CollectRunRecDataExecute(Sender: TObject);
    procedure fun_SetRunRecParamExecute(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure show_DevAlarmExecute(Sender: TObject);
    procedure TreeView2Change(Sender: TObject; Node: TTreeNode);
    procedure TreeView2Click(Sender: TObject);
    procedure TreeView2ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure show_ERunDataListExecute(Sender: TObject);
    procedure show_DriverUploadInfoListExecute(Sender: TObject);
    procedure Xplorer1Click(Sender: TObject);
    procedure skinDefaultClick(Sender: TObject);
    procedure fun_DealEmgcyAlarmExecute(Sender: TObject);
    procedure ck_devalarmExecute(Sender: TObject);
    procedure ck_devgrouponlineExecute(Sender: TObject);
    procedure ck_devmileageExecute(Sender: TObject);
    procedure TimerCheckUpdateTimer(Sender: TObject);
    procedure TimerCallTimer(Sender: TObject);
    procedure show_QueryAudioListExecute(Sender: TObject);
    procedure sys_infotypeExecute(Sender: TObject);
    procedure sys_infoExecute(Sender: TObject);
    procedure timerSendInfoTimer(Sender: TObject);
    procedure show_MediaEventUploadExecute(Sender: TObject);
    procedure timerScrollAlarmTimer(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure show_SrvRunInfoExecute(Sender: TObject);
    procedure cbxSearchTypeChange(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure edtConditionKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure show_RunRecDataExecute(Sender: TObject);
    procedure show_AlarmSuperviseExecute(Sender: TObject);
    procedure fun_SendQueryVideoExecute(Sender: TObject);
    procedure show_QueryVideoListExecute(Sender: TObject);
    procedure fun_Devs_SendQueryVideoExecute(Sender: TObject);
    procedure show_RecvGovInfoExecute(Sender: TObject);
    procedure show_AudioExecute(Sender: TObject);
    procedure show_applyGpsDataFromGovExecute(Sender: TObject);
    procedure show_cancelGpsDataFromGovExecute(Sender: TObject);
    procedure show_videoExecute(Sender: TObject);
    procedure show_tspDataUploadExecute(Sender: TObject);
    procedure fun_readVerExecute(Sender: TObject);
    procedure help_updatelogExecute(Sender: TObject);
    procedure show_DevKeyEventLogExecute(Sender: TObject);
    procedure show_areaToDevExecute(Sender: TObject);
    procedure fun_OrderVideoExecute(Sender: TObject);
    procedure ck_noticeExecute(Sender: TObject);
    procedure sys_feedbackExecute(Sender: TObject);
    procedure Ck_QueryDevRunStateOnTheTimeExecute(Sender: TObject);
    procedure ck_queryPhotoPosExecute(Sender: TObject);
    procedure fun_photo_fatigueExecute(Sender: TObject);
    procedure sys_refreshExecute(Sender: TObject);
    procedure ck_queryDevMileageExecute(Sender: TObject);
    procedure ck_querySetCarRunStatePlanExecute(Sender: TObject);
    procedure fun_setCarRunStatePlanExecute(Sender: TObject);
    procedure fun_upgradeterminalExecute(Sender: TObject);


  private
    { Private declarations }
    FFlashDlg: Tflash_jk;
{$IFDEF ForOutLook}
    FOutLook: TOutlook;
{$ENDIF}

    FMainTitle: string;
    FDlg_data_display: Tdata_display; //数据显示 窗体
    FDlg_Watch_Car: TWatch_car; //监控车辆
    FDlg_Sended_Cmd: TSended_Cmd; //已发命令
    //FDlg_EventList: TEventListFrm;  // 接受事件列表
    FDlg_AnswerListFrm: TAnswerListFrm;  // 回答答案列表
    //FDlg_Received_Info: TReceived_info; //收到网关主动发来的数据（车机主动给网关的）
    
    FDlg_ConfineAreaList: TConfineAreaListFrm;
    FDlg_ERunDataList: TfrmERunData;
    FDlg_DriverInfoUpload: TfrmDriverInfo;
    FDlg_MediaEventUpload: TfrmMediaEventUpload;
    FDlg_SrvRunInfo: TfrmSrvRunInfo;
    FDlg_RunRecDataUpload: TfrmRunRecDataUpload;
    FDlg_AlarmSupervise: TfrmAlarmSuperviseList;

    FDlg_TSPDataUpload: TfrmTSPDataUpload;
    FDlg_DevKeyEventLog: TfrmDevKeyEventLog;

    FDlg_SearchAddress: TFrmSearchAddressInMap;

    FDlg_AudioFrm: TAudioFrm;
    FDlg_VideoFrm: TfrmVideo;
    FDlg_EventListFrm: TEventListFrm; // 接受到的事件信息
    FDlg_QueryPictureListFrm: TQueryPictureListFrm;
    FDlg_QueryAudioList: TfrmQueryAudioList;
    FDlg_QueryVideoList: TfrmQueryVideoList;

    FDlg_RevGovInfo: TfrmRecvGovInfo;
    //frmNotice: TfrmNotice;

//    FDlg_FindThingFrm: TFindThingFrm;

    FDlg_AreaToDev: TFrm_AreaToDev; //报警区域


//    FDlg_ServerJudge: TServeJudgeFrm;

    FDLG_DevAlarmInfo: TDevAlarmInfoFrm;
    FDlg_DevModifyFrm: TDevModifyFrm;
//    FDlg_DriverBlackList: TfrmDriverBlacklist;
//    FDlg_PassengerBlackList: TfrmPassengerBlacklist;
    //--------各类查询统计窗体

    FDlg_TjGrpDev:TTjGrpDevsFrm;                   //车辆安装情况统计
    FDlg_CkClxx : Tsee_clxx;  //查看车辆信息
    FDlg_CkDriverInfo : TDriverInfoFrm; //查看司机信息

//    FDlg_Query_SoundRecord: TQuery_SoundRecordFrm; // 录音数据查询
    FDlg_CkDevPic : TQueryCarPictureFrm; // 查询照片
    FDlg_QueryPhotoPos: TfrmQueryPhotoPos;//查询照片及位置
    FDlg_QueryDevUploadMileage: TfrmQueryDevUploadMileage;//查询车辆行驶里程
    FDlg_QuerySetCarRunStatePlan: TfrmQuerySetCarRunState;//查询车辆设置重载运行计划
    FDlg_QueryDevAlarmInfo: TfrmQueryAlarmInfo;//查询报警信息
    FDlg_QueryNotice: TfrmQueryNotice;
    FDlg_QueryDevGroupOnline: TfrmQueryDevGroupOnline;//查询车组在线率
    FDlg_QueryDevMileage: TfrmMileage;//查询车辆行驶里程
    FDlg_ckMessageList: TQueryMessageListFrm;
    FDlg_ckCmdList: TQueryCmdListFrm;
    FDlg_ckQuestionList: TQueryQuestionListFrm;
    FDlg_QueryUpdateRecord: TQueryUpdateRecordFrm;
    //FDlg_QueryDriverIntegral: TQueryDriverIntegralFrm;
    FDlg_SeeEmergncyAlarmDetail : TSeeEmergncyAlarmDetailFrm; //查看紧急报警时 详细情况
    FDlg_QueryDevRunStateOnTheTime:TQueryDevRunStateOnTheTimeFrm; //查询某时间点的车辆运行状态
    FDlg_ShowList_HisAddr:TFrmHisListAddr;
    {停泊的窗体数目}
    FBottomFormCount: integer;
    {底层窗口的高度}
   // FBottomFromHeight :integer;
    {在中心的窗口数量}
    FCenterFormCount: integer;
    {键盘输入车牌号}
    FDevKeyIn: boolean;
    {要 重新选择车辆的ListView,在组命令时用。}
    FListView_SelectDevs: TListView;
    ParamAllFrm: TParamAllFrm; //群设参数
    FStartDateTime, FEndDateTime: Tdatetime;
    //MouseAction:integer;
//    FDlg_ListeniningFrm: TListeniningFrm;
    EarthRect: TEarthRect;
    lo, la: Double;

    FSearch: Boolean;

    ReceivePhone: TAddReceivePhone;

    FDlg_OnLineFrm: TOnLineTjFrm;
    FANTIFAKE_WARRING: Boolean;   // true：表示当前所话区域是防伪密标区域
    //LastInOutMap:TDatetime;

    tmpPolyLineArea: TPolyLineArea;//设置路线时的临时对象

    FCurrSelect: integer;//车辆组中的当前选中的组号

    FIsUpdating: Boolean;
    FIsTerminated: Boolean;

    FIsNoticeLoaded: Boolean;//通知只在启动后加载一次
    FIsNoticeShown: Boolean;//通知是否显示过

    FCurrMouseX, FCurrMouseY: Integer;

    qHisThread: TGetHisThread;

    procedure getNotices;
    procedure LoadNotice;
    procedure DoOnNoticeLoaded;
    procedure AddDeviceByGroup;
    procedure Add_A_Device;
    procedure AddDeviceFromListSelectDev;
    procedure DoAppException(Sender: TObject; E: Exception);
    procedure ChangeMap(MapNode: TMapNode; ifCurNode: boolean = true; ifAutoScale: boolean = false);
    procedure OpenWSAutoScale(AMapNode: TMapNode; Gauge1: TGauge; OutBox: TWorldRect);
    procedure LoadDevTrackPen_Width;
    procedure DevEmergncyAlarm(ADev: TDevice);
    procedure DoOnRcvPicupLoad(ADev: TObject; PicIndex: Integer; PicReson: Byte; pic: PicInfo);
    procedure DoOnRcvAudioUpload(ADev: TObject; AudioIndex: Integer);
    procedure DoOnRcvEventListupLoad(ADev: TObject; EventInfo: string; dateTime: TDateTime);
    procedure DoOnRcvLightStateListupLoad(QueryType: Byte; ADev: TObject; Buf: PByte);
    procedure DoOnRecQueryPicture(Buff: PByte; Count: Word; ADev: TObject; Reason: string);
    procedure DoOnServeJudge(pBuf: PByte; Dev: TDevice);
    procedure DoOnRcvAnswerListupLoad(ADev: TObject; Question: string; Answer: string; dateTime: TDateTime);
    procedure DoOnSeeEmergncyAlarmDetail(ADevIdStr, AStartTime, ARemoveTime: String;
                                         AStartLongi, AStartLati, ARemoveLongi, ARemoveLati: Double);
    //将DOCK窗体放到当前显示
    procedure SetFrmToFirst(AFrm: TForm; APanel: TPageControl);

    procedure ShowQueryForm(PageControl: TRzPageControl; Form: TForm; FormClass: TFormClass; Align: TAlign);
    procedure ShowWindows(Sender: TObject; PageControl: TRzPageControl; Form: TForm; Align: TAlign);
  private
    procedure iniform;
    procedure Dlgs_Create;
    procedure Dlgs_Show;
    procedure Dlgs_Hide;
    procedure Dlgs_Free;
    procedure ActionCheck;
    function ReconnectServer: Boolean;
    procedure userlogin_connect(const loginType: byte); // 用户登录　且　连接应用服务器 //0--正常登录，1--注销后登录
    procedure QueryOpenInfo;
    procedure QueryCarAndDevInfo;
    procedure QueryOtherLoadInfo;
    procedure SetWindowStat(ws: TWindowState);
    function CheckDevId: boolean;
    procedure SetPower;
    procedure SetZDCLJKPower(Dlg : TZDCLJKFrm);
    procedure SelectDevFromListSelectDev(State: integer; Sel: boolean); //在选择车辆中再选车
    procedure isOnline; //判断是否在线.
    procedure OnCarActionClick(Dev: TDevice); //  对图上的小车单击事件处理.
    procedure OnMapLabelMouseMove(Shift: TShiftState; X, Y: Integer);
    procedure FShowStateEvent(Sender: TObject; State: TState);
    procedure TestUserNotice(Sender: TObject);
    procedure ShowListDeviceByBJYW(Value: string);
    procedure InfoListDevice;
  private
    //针对试用用户的。如果已注册(取注册表值),则true　如果没注册，则进行注册
    function UserReged: boolean;
    procedure SaveWS;
    procedure OpenWSInit(AMapNode: TMapNode; Gauge1: TGauge);
    procedure OpenWS(AMapNode: TMapNode; Gauge1: TGauge); overload;
    procedure OpenWS; overload;
    procedure OpenDefaultMap;

    procedure Connect2Gateway;
    procedure RefreshSeverStat;
    procedure ShowDeviceTrack_Watch(Adev: Tdevice);
    procedure FMapMetaSelected(Sender: TObject);

    //区域查车
    procedure FBrowseSeekCar(BeginP: TPoint; EndP: TPoint);//(BeginX: Integer; BeginY: Integer; EndX: Integer; EndY: Integer);
    //失物查找
    procedure FFindThing(BeginX: Integer; BeginY: Integer; EndX: Integer; EndY: Integer);

    procedure ProcessDevArea(areaShape:byte;
       WCenterPoint: TEarthPoint; Radius: Integer; LastPoint: TEarthPoint;
       LeftPoint: TEarthPoint; RightPoint: TEarthPoint;
       WPointsAry: TWorldPointAry; PointsCnt: Integer);
    procedure FOnSetConfineAlarmCircle(Sender: TObject; WCenterPoint: TEarthPoint; Radius: Integer; LastPoint: TEarthPoint);
    //设置不规整图形
    procedure FSetConfineAlarmNoSybol(Sender: TObject; WPointsAry: TWorldPointAry; PointsCnt: Integer);

    procedure FSetConfineAlarmRectangle(Sender: TObject; LeftPoint, RightPoint: TEarthPoint);

    procedure FMapMeasure(Sender: TObject; Distance, TotalDistance, Area: Double; Flag: Integer);
    //设区域报警
    procedure FMapSetConfineAlarmArea(Sender: TObject; WPointsAry: TWorldPointAry; PointsCnt: Integer);
    //设固定路线
    procedure FMapSetRunWay(Sender: TObject; WPointsAry: TWorldPointAry; PointsCnt: Integer);
    procedure FMapSetLineProperty();
    procedure FMapActionChanged();
    //框选 取出 框选时的起点与终点
    procedure GetMapRectSelect_Rect(PointA, PointB: TEarthPoint);

    //当用户框选车辆，（在地图上圈起来），这里列出来
    procedure FMapUserSelectDev(sender: Tobject; PointA, PointB: TEarthPoint);
    //当用户框选车辆，选中车辆数太多时，这里给出提示
    procedure FMapUserSelDevcntMany;

    procedure DevAlarm_OutorInConfineArea(ADev: Tdevice; AlarmType: Byte; AddorDel: boolean; AArea: TConfineArea);
    {更改车辆列表中的某列}
    procedure OncxDeviceListEdited(Sender: TObject; AColumn: TcxTreeListColumn);

    procedure RestoreRequest(var message: TMessage); message CM_RESTORE;
    //接收到服务器发送的通知消息
    procedure DataServer_SendMsg(var message: TMessage); message CM_DATASERVER_SENDMSG;
    procedure DevNotifyStat(var message: TMessage); message CM_DevNotifyStat; //通知设备刷新参数
    procedure RegUserError2Gateway(var message: TMessage); message CM_RegUserErr; // 用户登录到网关服务器 错误
    //procedure Msg_DevAlarm(var message: TMessage); message CM_DEVALARM; //在收到的GPS数据中有报警
    procedure DoOnDevEmergncyAlarm(Adev: TDevice);
    procedure DoOnEarlyWarningList(changePage: Boolean;  EarlyWarningCar: TEarlyWarningCar);
    procedure DoOnDevOtherAlarm(Adev: TDevice; AlarmType: Byte);
    procedure Msg_For_Update(var message: TMessage); message CM_UPDATE; //更新本自已,,必须关闭自己,这个消息是由更新程序发出.
    procedure RefeshADev(const DevId: integer); //刷新某车
    procedure OnMapMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FMapMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);

    procedure OnMapMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure OnUserDefinedText(Sender: TObject; EarthPoint: TEarthPoint; WorldPoint: TWorldPoint); //用户自定义标签
    procedure ModifyOrDeleteDefinedText();
    procedure OnUserSetFactory(Sender: TObject; WCenterPoint: TEarthPoint; Radius: Integer;LastPoint: TEarthPoint); //用户自定义工厂工地

    procedure OnReDrawMap(Sender: TObject; Dev: TDevice);
    procedure ShowUserDefinedText;
    function SetActivePage(PageControl: TRzPageControl; PageCaption: string): boolean;

    //查看具体的装货信息时，查看轨迹
    procedure DoReadDevPicTimesInfoRet(ADev: TDevice; ANoPicBj: Boolean;
      FirstDateTime, LastDateTime: string; ABuf: PByte; BufCount: Integer);

    procedure HexStringToBytes(AHexS: string; var ALen: Integer; ABuf: PByte);

    procedure CheckUpdateExe;

    procedure TimerUpdateTimer(Sender: TObject; updateType: byte);

    procedure resetScrollPanel();

    procedure addLog(log: string);

    function CheckOtherFormIsQuerying(): Boolean;
    procedure DoOnDevFatigueAlarm(dev: TDevice);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure SendRegUser(backNumber: integer);
  public
   { Public declarations }
    //主界面地图显示窗口
    FDlg_Map: TMapShowFrm;
    FDlg_DevAlarmCar: TfrmAlarmFromDev;

    //用来在地图Hint车辆信息
    MapLabel: TLabel;

    //GPS图层
//    drawlayer: TGpsDrawLayer; 2011-12-02
//    datalayer: TGpsDataLayer;

    //轨迹回放图层
{    GpsPlayDrawLayer: TGpsPlayDrawLayer;
    GpsPlayDataLayer: TGpsDataLayer;   }

    //区域图层
//    userDrawLayer: TAreaDrawLayer; 2011-12-02
//    userDataLayer: TDataLayer;

    //围栏图层
//    AlarmNoSybolLayer: TAlarmNoSybolLayer;2011-12-02
//    AlarmNoDataLayer: TDataLayer;

    //用户自定义图层
//    TextLayer: TUserDefinedTextLayer; 2011-12-02
//    TextDataLayer: TDataLayer;

    //地图节点管理器.管理所有的地图配置
    //MapManger: TMapManger; liusen


    FDlg_HisForm: TFormHisMain;
    //将报警列表中 原有的越界或驶入报警信息　推入历史,并将列表中原有删掉
    //MoveCause:
    //　　1、车辆从越界到不越界，或从驶入到驶出。
    //　　2、用户在电子围栏列表中删除某区域或某区域限定的车辆

    procedure RemoveOutorInCAData2History(ADev: TDevice; AlarmType: byte; const MoveCause: string);
    procedure RemoveArea(Area: TConfineArea);
    procedure ShowState(Device: TDevice); //显示32位的状态信息.用的DEvice里的Swicth 来做的.
    function SetDatetime: boolean; //修改本机时间
    procedure fun_Locate_CarExecute_rundata(desc: string); //ifCurNode是否判断为MapNode为当时结点;
    procedure ShowHistoryRunData(BeginDateTime: TDateTime; EndDateTime2: TDateTime; dev: TDevice);
    procedure PlayQuerySound(FileName: string);
    function connectionAccess: boolean;
     //使在地图中 画一下某个内容，如：报警地点
    procedure ShowInfoInMap(ALongitude, ALatitude: Double; AShowInfo: String);
    procedure sendPerMessage(Value: string);
    procedure List_TreeGroup;
    procedure AddCarModifyInfo;
    procedure resetScrollLabelCaption();
    procedure resetScrollLabelCaptionWithTemp(str: string);

    // liusen
    function UserDefinedText(EarthPoint: TEarthPoint; WorldPoint: TWorldPoint): string;
    // liusen 设置区域报警，由JS调用
    function SetConfineAlarmArea(WPointsAry: TWorldPointAry; PointsCnt: Integer): string;
    // liusen 设置区域报警中的圆
    function SetCircleArea(Radius: Double; WorldPoint: TWorldPoint; lastPoint: TWorldPoint): string;
    // liusen
    function SetConfineAreaToDev(areaShape:byte; WCenterPoint: TEarthPoint; Radius: Integer; LastPoint: TEarthPoint;
               LeftPoint: TEarthPoint; RightPoint: TEarthPoint; WPointsAry: TWorldPointAry; PointsCnt: Integer): string;
    // liusen 设固定路线
    function SetRunWayToDev(WPointsAry: TWorldPointAry; PointsCnt: Integer): string;
    // liusen
    function SetLineProperty(lineSection: TLineSection): boolean;
    //区域查车
    procedure BrowseSeekCar(BeginP: TEarthPoint; EndP: TEarthPoint);
    //从轨迹回放中，查看列表
    function ShowList_HisAddr():TFrmHisListAddr;
    //将轨迹回放地址列表，提到最前面显示
    procedure ShowHisAddrList_ToFront;

    procedure showTipFrm(dev: TDevice);
    procedure setMouseCurrXY(pt: TPoint);
    procedure stopGetHisThread();
    procedure terminateGetHisThread();
  private//for video
    function GetDisUseChannelId: Integer;
    function GetFrmShowVideo(devId: string; channelId: Integer): TfrmShowVideo;
    function GetNewFrmShowVideo(dev: TDevice;playerChannelId: Integer; channelId: Integer): TfrmShowVideo;
  end;

  TShowHisThread = class(TThread)
  protected
    procedure Execute; override;
  private
    FDlg_RefreshProgress: TFrmRefreshProgress;
    FDlg_His: TFormHisMain;
    FStartDateTime, FEndDateTime: Tdatetime;
    FDev: TDevice;

    procedure getHis;
  public
    constructor Create(dev: TDevice; sTime, eTime: TDateTime; dlgRefreshProgress: TFrmRefreshProgress; dlgHis: TFormHisMain);
    destructor Destroy(); override;
  end;

  TOnAddGpsData = procedure (gpsData: TQueryHistoryGpsData_V3) of object;
  TGetHisThread = class(TThread)
  private
    FDevId: string;
    FSTime: TDateTime;
    FETime: TDateTime;
    querySTime, queryETime: TDateTime;
    FTemp: TClientDataSet;
    FOnAddGpsData: TOnAddGpsData;
    FIsStopped: Boolean;
    FIsStopStatusSetTrue: Boolean;

    procedure queryHis;
    procedure setTrackPlayData;
    procedure SetOnAddGpsData(const Value: TOnAddGpsData);
    procedure SetStopped(const Value: Boolean);
  protected
    procedure Execute; override;    
  public
    constructor Create(devId: string; sTime, eTime: TDateTime);
    destructor Destroy(); override;
    property OnAddGpsData: TOnAddGpsData read FOnAddGpsData write SetOnAddGpsData;
    property IsStopped: Boolean read FIsStopped write SetStopped;
    property DevId: string read FDevId write FDevId;
    property STime: TDateTime read FSTime write FSTime;
    property ETime: TDateTime read FETime write FETime;
  end;

var
  Mainf: TMainf;

implementation
uses
{ SendOrderFrmUnit,SendOrderMiniFrmUnit, CallClientUnit,CancelOrderMenuFrmUnit,
CancelOrderMenu2FrmUnit, OrderUnit, uControl_Switch,SetUpdateDevFrmUnit,
  SetUpdateDevAllFrmUnit,}
  ufrmlogin, ufrmabout, ufrmChangePass, UserUnit, ResUnit, GatewayServerUnit,
  ParamUnit, uCall_Dev, ulayer_control, Math, BleepInt,
   {PrivilegeConstUnit,}
  uSet_CarTrack, uMap_layer, uset_SendToDTE_Data, uSendMsg2Dev, uSetAlarmSound,
  uClxxQryForm, uConfineAreaSetFrm, uFrmSelectDevs,
  PursueDevFrmUnit, SetDevTelListFrmUnit, ParamReadFrmUnit,  SetDevTelListAllFrmUnit,
   setDevEventListAllFrmUnit,  DateUtils, SystemConfigFrmUnit, UserDefinedTextFormUnit,
  TextUnit, GetAPictureFrmUnit, uGloabVar, updateUnit, SelectPlayGpsTimeUnit,
  PlayGlobalUnit, SetCarTrackPenFrmUnit, sendQuestionFrmUnit, FrmTSPDataUnit,
  FrmLineSectionUnit, FrmSetLineUnit, FrmCollectRunRecDataUnit, FrmSetRunRecParamUnit,
  FrmDealEmgcyAlarmUnit, FrmSetDevEventUnit, FrmSetDevTelListUnit, FrmInfoOrderUnit,
  FrmInfoTypeUnit, FrmInfoUnit, FrmQueryVideoUnit, FrmExchangeGpsDataFromGovUnit,
  ThreadLoadMapConfigUnit, FrmSelOrderVideoChannelUnit, FrmFeedbackUnit, jpeg,
  ActiveX, FrmSetCarRunStatePlanUnit, FrmUpgradeTerminalUnit
{$IFDEF ForAddEKey}, EKeyUseUnit{$ENDIF}
{$IFDEF ForTestUser}, GetIdeNumUnit, UserRegFrmUnit{$ENDIF};

const
  DEV_BOUND0 = 1200; //设备的外部串口波特率
  DEV_BOUND1 = 2400;
  DEV_BOUND2 = 4800;
  DEV_BOUND3 = 9600;
  DEV_BOUND4 = 19200;
  MOVE_NUM = 50;
{$R *.dfm}

procedure TMainf.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.WinClassName := MY_APP_NAME;
end;

procedure TMainf.SendRegUser(backNumber: integer);
var
  s: string;
begin
  case backNumber of
    LOGIN_OK: ;
    ERR_INVALIDUSER: StatusBar1.Panels.Items[2].Text := '无效的用户名登录网关服务器';
    ERR_INVALIDPASSWD: StatusBar1.Panels.Items[2].Text := '无效的密码登录网关服务器';
    ERR_Logged:
      begin
        s := '[' + current_user.UserName + ']在别一处登录网关服务器';
        StatusBar1.Panels.Items[2].Text := s;
        messagebox(handle, pchar(s), '提示', mb_ok + mb_iconinformation);
      end;
    ERR_INVALIDVER: StatusBar1.Panels.Items[2].Text := '无效的版本号,网关服务器的命令版本号:'
      + inttostr(DataServer.ComVer.MajorVer) + '.' + inttostr(DataServer.ComVer.MinorVer);
  end;
  PopMsg('网关错误', StatusBar1.Panels.Items[2].Text);
  //timer1.Enabled := false;
end;

{处理“恢复”消息}

procedure TMainf.RestoreRequest(var message: TMessage);
begin
  if IsIconic(Application.Handle) = True then //窗体是否最小化
    Application.Restore //恢复窗体
  else
    Application.BringToFront; //提到前面显示
end;



procedure TMainf.FormCreate(Sender: TObject);
var
  debugVerInfo, s: string;
  IniFile: TIniFile;
  i: Integer;
begin
  FIsTerminated := False;
  MemoBs.Text := '';
  MemoGateWay.Text := '';
  ExePath := ExtractFilePath(Application.ExeName);

  //加载地图配置
  TThreadLoadMapConfig.Create(ExePath + 'MapConfig.xml');

  //uGloabVar.SystemLog.LogFile:=ExePath+'\SystemLog\SystemLog';

  IniFile := TIniFile.Create(ExePath + 'Config.ini');
  try
    VersionFor := UpperCase(IniFile.ReadString('SYS', 'VersionFor', ''));
    ReportFooter := IniFile.ReadString('ReportFooter', 'ReportFooter', 'GPS系统监控中心');
    //Self.Caption := IniFile.ReadString('Caption', 'AppName', '智能监控客户端');

    debugVerInfo := '';

    FMainTitle := '道路运输车辆卫星定位系统平台--智能监控调度系统(V1.0)';
    Self.Caption := FMainTitle;

    Application.Title := Self.Caption + '  ' + VERSION;//' (' +FormatDateTime('YYYYMMDD.HHNN', FileDateToDateTime(FileAge(Application.ExeName))) + ')'; //VERSION;
//    try
//      taxiType := StrtoInt(IniFile.ReadString('taxiType', 'taxiType', '0'));
//    except
//      taxiType := 0;
//    end;
  finally
    IniFile.Free;
  end;

//  HisForm:=nil;
  FFlashDlg := Tflash_jk.Create(self); //闪出窗体
  
  //载入参数文件
  GlobalParam.LoadFromFile(Application.ExeName + '.config');
//{$IFDEF ForTestUser}

  FIsUpdating := False;
  if GlobalParam.isUpdate then
  begin
    FFLashDlg.SetLabel('检查更新...');
    FFLashDlg.Show;
    application.ProcessMessages;

    TimerUpdateTimer(nil, 0);
  end;
//{$ENDIF}

  if FIsUpdating then
  begin//如果启动时选择了升级程序，则此处直接退出
    Exit;
  end;

  userlogin_connect(0); // 用户登录　且　连接应用服务器
  if Logined then
  begin
    FFLashDlg.SetLabel('装入地图文件...');

    Application.ProcessMessages;

    Application.HintHidePause := 15000;
    Application.OnException := DoAppException;

    FFLashDlg.SetLabel('装入地图配置文件...');
    FFlashDlg.Gauge1.AddProgress(5);
    application.ProcessMessages;

    show_ConfineAreaList.Visible := true;
    tool_SetConfineAlarmArea.Visible := true;

  {$IFDEF ForTestUser}
    if not UserReged then
    begin
      Application.Terminate;
      exit;
    end;
  {$ENDIF}

  {$IFDEF ForAddEKey}
    GEkey.OnStateStr := ShowEkeyMsg;        
    ConnectedEkey_monitor; //检查KEY
  {$ENDIF}
    CheckUpdateExe;

    iniform; //初始化　
    QueryOpenInfo;
  end
  else
  begin
    while not FIsMapConfigLoaded do
      Continue;

    FIsTerminated := True;
    application.Terminate;
  end;

//  SkinData1.LoadFromCollection(SkinStore1, 27);
//  SkinData1.Active := True;

  tmpPolyLineArea := nil;

  ToolButton36.DropdownMenu := PopupMenu_funDev;
  CoolBar1.Visible := true;
  Screen.Cursor := crDefault;
  
  RzLabel1.Parent.DoubleBuffered := True;

  FIsNoticeShown := False;
  FIsNoticeLoaded := False;
  getNotices;
end;


procedure TMainf.FormDestroy(Sender: TObject);
var
  eventInfo: PEventInfo;
begin
  try
    //  if HisForm<>nil then HisForm.Free;
    //stopGetHisThread;
    
    Timer.Enabled := False;
    TimerCheckUpdate.Enabled := False;
    TimerCheckUpdate.Enabled := False;
    TimerCall.Enabled := False;
    timerScrollAlarm.Enabled := False;
    try
      if Logined then
      begin
        //bs.userlogout(current_user);
        current_user.Free;
      end;
    finally
      if FFlashDlg <> nil then FFlashDlg.Free; //2004-9-27

      if Logined then
      begin
        Dlgs_Free;
//        if FDlg_data_display <> nil then FDlg_data_display.Free;
//        if FDlg_Watch_Car <> nil then FDlg_Watch_Car.Free;
//        if FDlg_Sended_Cmd <> nil then FDlg_Sended_Cmd.Free;
//        //if FDlg_OrderList <> nil then FDlg_OrderList.Free;
//        //if FDlg_Received_Info <> nil then FDlg_Received_Info.Free;
//        //if FDlg_DRunData <> nil then FDlg_DRunData.Free;
////        if FDlg_EarlyWarning <> nil then FDlg_EarlyWarning.Free;
//        if FDlg_PictureFrm <> nil then FDlg_PictureFrm.Free;

        if DataServer <> nil then
        begin
        //线程 还改用定时器  2005.03.25
          //DataServer.Terminate;
          //DataServer.WaitFor;
          DataServer.LogOutFromGateway;
          DataServer.Free;
        end;
        if bs <> nil then bs.Free;
      end;
    end;
    if FGis <> nil then FGis.Free;

    if tmpPolyLineArea <> nil then tmpPolyLineArea.Free;

    if MapManger <> nil then
      MapManger.Free;
    //  if SystemLog<>nil then SystemLog.Free;

  finally
  end;
end;

procedure TMainf.DoAppException(Sender: TObject; E: Exception);
var
  s: string;
begin
  try
    s := FormatDateTime('yyyy-MM-dd hh:nn:ss', now) + '未捕获的异常:ExceptionClassName:' + E.ClassName;
    s := s + '   SenderClassName:' + Sender.ClassName;
    //判断是不是TComponent,如果是并记录TComponent.Name
    if Sender is TComponent then
    begin
      s := s + '   SendCompName:' + TComponent(Sender).Name;
        //判断是不是TWinControl,并有Parent,就记录Parent.Name
      if Sender is TWinControl then
      begin
        if TWinControl(Sender).Parent <> nil then
        begin
          s := s + '   SendCompNameParent:' + TWinControl(Sender).Parent.Name;
        end;
      end;
    end;
    s := s + '   E.Message:' + E.Message;
    s := s + '   HelpContext:' + IntToStr(E.HelpContext);
  finally
    uGloabVar.SystemLog.AddLog(s);
  end;
end;

procedure TMainf.Panel4Click(Sender: TObject);
begin
  show_carExecute(show_car);
end;

procedure TMainf.iniform; //全局变量　　初始化

begin
  try
    FDlg_Map := TMapShowFrm.Create(self);
    {FDlg_Map.ManualDock(PageControl_Center, nil, alLeft);
    FDlg_Map.Show;
    Show_Map.Checked := true;  }

    FGis := TGisPlatform.Create;
    FMap := TGpsMap.Create(nil, FGis.Provider);
    {FMap.Name := 'FMap';    2011-12-02
    FMap.Parent := FDlg_Map.Panel_Map; //Panel_Map;
    FMap.Align := alClient;
    FMap.Color := clWhite;
//  FMap.Draw;
    FMap.MouseAction := actMove;
    FMap.OnMetaSelected := FMapMetaSelected;
    FMap.OnMeasure := FMapMeasure;
    FMap.OnSetConfineAlarmArea := FMapSetConfineAlarmArea;
    FMap.OnSetRunWay := FMapSetRunWay;
    FMap.OnSetLineProperty := FMapSetLineProperty;
    FMap.OnMapActionChangedEvent := FMapActionChanged;
    FMap.OnMouseDown := OnMapMouseDown;
    FMap.OnMouseUp := OnMapMouseUp;
    FMap.OnMouseWheelUp := FormMouseWheelUp;
    FMap.OnMouseWheelDown := FormMouseWheelDown;
    FMap.OnMouseMove := FMapMouseMove; //
    FMap.OnUserSelectDevEvent := FMapUserSelectDev; //用户在地图上选择了车辆
    FMap.OnUserSelDevCntManyEvent := FMapUserSelDevcntMany; //用户在地图上选择的车辆数　过多
    Fmap.OnSetConfineAlarmCircle := FOnSetConfineAlarmCircle;
    Fmap.OnSetConfineAlarmNoSybol := FSetConfineAlarmNoSybol;
    Fmap.OnsetConfineAlarmRectangle := FSetConfineAlarmRectangle;
    FMap.OnBrowseSeekCar := FBrowseSeekCar;
    FMap.OnFindThing := FFindThing; }

    //Fmap.OnDevAlarm_OutorInCArea:= DevAlarm_OutorInConfineArea;  //车辆越界or 驶入报警
    FGis.AddMap(FMap);
    {datalayer := TGpsDataLayer.Create;
    datalayer.LayerName := 'GPS图层';
    datalayer.ShowName := '[GPS]';//重点监控窗体中的图层与主界面的图层相同
    datalayer.isHaveNotDelete := true;
    FMap.GpsDataLayer := datalayer;

    FGis.Provider.AddLayer(datalayer);
    drawlayer := TGpsDrawLayer.Create;
    drawlayer.OnReDrawMap := OnReDrawMap;
    drawlayer.isHaveNotDelete := true;
    FMap.GpsDrawlayer := drawlayer;
    drawlayer.Data := datalayer;
    drawlayer.GpsMap := FMap;
    FMap.Layers.AddLayerWithLayer(drawlayer);  }


  //轨迹回放图层

{  GpsPlayDataLayer := TGpsDataLayer.Create;
  GpsPlayDataLayer.LayerName := 'GPS回放图层';
  GpsPlayDataLayer.isHaveNotDelete:=true;
  FGis.Provider.AddLayer(GpsPlayDataLayer);
  GpsPlayDrawLayer := TGpsPlayDrawLayer.Create;
  GpsPlayDrawLayer.isHaveNotDelete:=true;
  GpsPlayDrawLayer.Data := GpsPlayDataLayer;
  GpsPlayDrawLayer.GpsMap := FMap;
  FMap.Layers.AddLayerWithLayer(GpsPlayDrawLayer);
  FMap.GpsPlayDataLayer := GpsPlayDataLayer;
  FMap.GpsPlayDrawlayer := GpsPlayDrawLayer;

            }



//    MapManger := TMapManger.Create('全国');
//    MapManger.LoadFile(ExePath + 'MapConfig.xml');
//    MapManger.ShowToTreeView(FDlg_Map.TreeViewMap, FDlg_Map.CheckBoxIsShowFile.Checked);
    {2011-12-02
    if MapManger.DefaultNode <> nil then
      FDlg_Map.StatusBar1.Panels.Items[0].Text := '默认显示地图:' + MapManger.DefaultNode.Name;  }
{  //创建业务服务器
    bs := TBusinessSevercom.Create;
    bs.Host := GlobalParam.Business.Host;
    bs.Port := GlobalParam.Business.Port;
    bs.HostBak := GlobalParam.BusinessBak.Host;
    Bs.PortBak := GlobalParam.BusinessBak.Port; }

    {OpenDefaultMap; 2011-11-30
    if not FileExists(ExePath + 'MapConfig.xml') then
    begin
      OpenWS;
    end
    else
    begin
      if MapManger.DefaultNode <> nil then
        OpenWS(MapManger.DefaultNode, FFLashDlg.Gauge1) //dxf
      else
        OpenWS(MapManger.RootNode, FFLashDlg.Gauge1); //dxf
    end;
    FMap.Layers.SetOrder(FMap.Layers.Count - 1, 0); //sha 移GPS图层到第0层。
    }
  //{$ifdef For_ConfineArea}
  //用户画区域图层
    {2011-12-02
    FFLashDlg.Gauge1.AddProgress(5);
    userDataLayer := TDataLayer.Create;
    userDataLayer.LayerName := UserDrawAreaLayerName;
    userDataLayer.isHaveNotDelete := true;
    userDataLayer.State := [lyVisible];

    FGis.Provider.AddLayer(userDataLayer);

    userDrawLayer := TAreaDrawLayer.Create;
    userDrawLayer.isHaveNotDelete := true;
    userDrawLayer.Data := userDataLayer;
    userDrawLayer.Map := FMap;
    FMap.layers.AddLayerWithLayer(userDrawLayer);
    FMap.Layers.SetOrder(FMap.Layers.Count - 1, 0); //将　区域绘画图层 始终放在　第0层

   //设置到车机中的电子围栏
    AlarmNoDataLayer := TDataLayer.Create;
    AlarmNoDataLayer.LayerName := '设置到车机中的电子围栏';
    AlarmNoDataLayer.isHaveNotDelete := true;
    AlarmNoDataLayer.State := [lyVisible];

    AlarmNoSybolLayer := TAlarmNoSybolLayer.Create;
    AlarmNoSybolLayer.isHaveNotDelete := true;
    AlarmNoSybolLayer.Data := AlarmNoDataLayer;
    AlarmNoSybolLayer.Map := FMap;

    FMap.layers.AddLayerWithLayer(AlarmNoSybolLayer);
    FMap.Layers.SetOrder(FMap.Layers.Count - 1, 0); //将　区域绘画图层 始终放在　第0层 }


 {   ConfineAlarmDataCircleLayer := TDataLayer.Create;
    ConfineAlarmDataCircleLayer.LayerName := '圆形';
    ConfineAlarmDataCircleLayer.isHaveNotDelete := true;
    ConfineAlarmDataCircleLayer.State := [lyVisible];

    ConfineAlarmCircleLayer := TConfineAlarmCircleLayer.Create;
    ConfineAlarmCircleLayer.isHaveNotDelete := True;
    ConfineAlarmCircleLayer.Data := ConfineAlarmDataCircleLayer;
    ConfineAlarmCircleLayer.Map := FMap;
    FMap.layers.AddLayerWithLayer(ConfineAlarmCircleLayer);
    FMap.Layers.SetOrder(FMap.Layers.Count - 1, 0); //将　区域绘画图层 始终放在　第0层  }


 // {$endif}
    {2011-12-02
    TextDataLayer := TDataLayer.Create;
    TextDataLayer.isHaveNotDelete := true;
    TextDataLayer.LayerName := '自定义标签';
    TextDataLayer.State := [lyVisible, lySelect];
    FGis.Provider.AddLayer(TextDataLayer);}

    GTextManage.LoadFromFile(ExePath + 'UserDefinedText.ini');
    ShowUserDefinedText;
    {TextLayer := TUserDefinedTextLayer.Create;  2011-12-02
    TextLayer.isHaveNotDelete := true;
    TextLayer.Data := TextDataLayer;
    TextLayer.Map := FMap;
    FMap.layers.AddLayerWithLayer(TextLayer);
    FMap.Layers.SetOrder(FMap.Layers.Count - 1, 0); //将　区域绘画图层 始终放在　第0层
    FMap.OnUserDefinedText := OnUserDefinedText;
    FMap.OnUserSetFactory := OnUserSetFactory; }

{$IFDEF ForOutLook}
    {    2011-12-02
    FOutLook := FGis.OverViews[FGis.AddNewOverView];
    FOutLook.Parent := Panel_birdEye;
    FOutLook.Align := alClient;
    FOutLook.Color := clWhite;
    FOutLook.Map := FMap;
    FOutLook.AutoZoom := True;
    Panel_BirdEyeSet.Visible := true;
    tool_bird_eye.Visible := True;
    Panel_BirdEyeSet.BringToFront;
    FOutLook.Draw;}
{$ENDIF}

    FFLashDlg.Gauge1.AddProgress(5);
  //车辆越界or 驶入报警
  //  ADeviceManage.OnDevAlarm_OutorInCArea := DevAlarm_OutorInConfineArea;
  //司机按键紧急报警
    ADeviceManage.OnDevEmergncyAlarmEvent := DoOnDevEmergncyAlarm;
//    ADeviceManage.OnEarlyWarningEvent := DoOnEarlyWarningList;
    ADeviceManage.OnDevOnFatigueAlarm := DoOnDevFatigueAlarm;
    LoadDevTrackPen_Width;

  except
    on E: Exception do
    begin
      messageErrorBox('装入地图配置文件', E.Message);
    end;
  end;
end;

procedure TMainf.sys_change_passExecute(Sender: TObject);
var dlg: TfrmChangePass;
begin
  dlg := TfrmChangePass.Create(self);
  try
    dlg.edit1.Text := current_user.UserName;
    dlg.edit2.Text := '';
    dlg.edit3.Text := '';
    dlg.edit4.Text := '';
    dlg.ShowModal;
    if dlg.ModalResult = mrok then
    begin
      try
        if bs.ChangePassword(current_user, trim(dlg.edit3.text)) then
        begin
          messagebox(handle, '密码修改完成！', '提示', mb_ok + mb_iconinformation);
          Current_user.Password := trim(dlg.edit3.text);
        end
        else
        begin
          messagebox(handle, '密码修改失败！', '提示', mb_ok + mb_iconinformation);
        end;
      except
        on E: exception do
        begin
          messageErrorBox('修改密码出现错误！', E.Message);
        end;
      end;
    end;
  finally
    dlg.Free;
  end;
end;

function TMainf.ReconnectServer: Boolean;
var
  frm: TSystemConfigFrm;
begin
  Result := False;
  frm := TSystemConfigFrm.Create(nil);
  try
    frm.ShowModal;
    if frm.ModalResult = mrOk then
    begin
      try
        Result := True;
      except on E: Exception do
        begin
          ShowMessage(E.Message);
        end;
      end;
    end;
  finally
    frm.Free;
  end;
end;

procedure TMainf.userlogin_connect(const loginType: byte); // 用户登录　且　连接应用服务器 //0--正常登录，1--注销后登录
var
  cnt: integer;
  dlg: Tfrmlogin;
begin
  dlg := Tfrmlogin.Create(self);
  dlg.Edit1.Text := '';
  dlg.Edit2.Text := '';
{$IFOPT d+}
  dlg.Edit1.Text := '';
  dlg.Edit2.Text := '';
{$ENDIF}
  if loginType = 1 then //1--注销后登录
  begin
    //dlg.BitBtn2.Caption := '退出';
//    dlg.SpeedButton2.Caption := '退出';
  end;
  cnt := 0;
  try
    while true do
    begin
      if FFlashDlg.Showing then FFlashDlg.Hide; //用户名或密码错时，重新输入 。此时 FFlashDlg.Showing=true
      dlg.ShowModal;
      cnt := cnt + 1;
      if dlg.ModalResult = mrok then
      begin
        //创建业务服务器
        bs := TBusinessSevercom.Create;
        bs.Host := GlobalParam.Business.Host;
        bs.Port := GlobalParam.Business.Port;
        bs.HostBak := GlobalParam.BusinessBak.Host;
        Bs.PortBak := GlobalParam.BusinessBak.Port;

        bs.onsendPerMessage := sendPerMessage; //处理 抛出的进度调 。

        FFlashDlg.Show;
        FFlashDlg.SetLabel('连接业务服务器...');
        FFlashDlg.Gauge1.Progress := 5;
        application.ProcessMessages;
        current_user := Tuser.Create(trim(dlg.Edit1.Text), trim(dlg.Edit2.Text));

        try //--------连接 到业务服务器
          //if (cnt > 1) and (not logined) then bs.DisConnectServer;
          //bs.ConnectServer;
          Logined := Bs.userlogin(current_user);
          application.ProcessMessages;

          FFlashDlg.SetLabel('检查用户名和密码...');
          FFlashDlg.Gauge1.AddProgress(5);
          if logined then break; //如果用户登录成功则退出
          if (cnt >= 3) and (logined = false) and (loginType <> 1) then //1--注销后登录
          begin
            messagebox(handle, '对不起，您已错误输入三次，将退出系统！', '提示', mb_ok + mb_iconinformation);
            break;
          end;
        except
          on E: exception do
          begin
            messageErrorBox('连接到业务服务器失败！', E.Message);
//            if not ReconnectServer then
//             application.Terminate;
          end;
        end;
      end
      else 
      begin
        Logined := false;
        break;
      end;
    end;
  finally
    dlg.free;
  end;
end;

procedure TMainf.show_carExecute(Sender: TObject);
begin
  with (Sender as TAction) do
  begin
    if Checked then
      SplitterRight.CloseSplitter
    else
      SplitterRight.OpenSplitter;
  end;
end;

procedure TMainf.show_watchExecute(Sender: TObject);
begin
  with (Sender as TAction) do
  begin
    Checked := not Checked;
  end;
end;

procedure TMainf.show_toolbarExecute(Sender: TObject);
begin
  with (Sender as TAction) do
  begin
    Checked := not Checked;
    ToolBar2.Visible := Checked;
  end;
end;

procedure TMainf.show_MapToolbarExecute(Sender: TObject);
begin
  with (Sender as TAction) do
  begin
    Checked := not Checked;
    FDlg_Map.CoolBarMapTool.Visible := Checked;
  end;
end;

procedure TMainf.show_statusBarExecute(Sender: TObject);
begin
  with (Sender as TAction) do
  begin
    Checked := not Checked;
    StatusBar1.Align := alBottom;
    StatusBar1.Visible := Checked;
  end;
end;

procedure TMainf.ck_DevInfoExecute(Sender: TObject);
var
  i: integer;
begin
  if FDlg_CkClxx= nil then
    FDlg_CkClxx := Tsee_clxx.Create(self);
  ShowQueryForm(PageControl_Center, FDlg_CkClxx, Tsee_clxx, alLeft);
end;

procedure TMainf.tool_moveExecute(Sender: TObject);
var
  i: integer;
begin
  FMap.MouseAction := actMove;
  for i := 0 to ActionList1.ActionCount - 1 do
  begin
    if (ActionList1.Actions[i].Category = '2地图工具') then
    begin
      if ActionList1.Actions[i].Name <> 'tool_bird_eye' then
      begin
        TAction(ActionList1.Actions[i]).Checked := false;
      end;
    end;
  end;
  TAction(Sender).Checked := true;
end;

procedure TMainf.tool_zoom_inExecute(Sender: TObject);
var
  i: integer;
begin
  FMap.MouseAction := actZoomIn;
  for i := 0 to ActionList1.ActionCount - 1 do
  begin
    if (ActionList1.Actions[i].Category = '2地图工具') then
    begin
      if ActionList1.Actions[i].Name <> 'tool_bird_eye' then
      begin
        TAction(ActionList1.Actions[i]).Checked := false;
      end;
    end;
  end;
  TAction(Sender).Checked := true;
end;

procedure TMainf.tool_zoom_outExecute(Sender: TObject);
var
  i: integer;
begin
  FMap.MouseAction := actZoomOut;
  for i := 0 to ActionList1.ActionCount - 1 do
  begin
    if (ActionList1.Actions[i].Category = '2地图工具') then
    begin
      if ActionList1.Actions[i].Name <> 'tool_bird_eye' then
      begin
        TAction(ActionList1.Actions[i]).Checked := false;
      end;
    end;
  end;
  TAction(Sender).Checked := true;
end;

procedure TMainf.tool_locateExecute(Sender: TObject);
var
  i: integer;
begin
  FMap.MouseAction := actCheckEntityInfo;
  for i := 0 to ActionList1.ActionCount - 1 do
  begin
    if (ActionList1.Actions[i].Category = '2地图工具') then
    begin
      if ActionList1.Actions[i].Name <> 'tool_bird_eye' then
      begin
        TAction(ActionList1.Actions[i]).Checked := false;
      end;
    end;
  end;
  TAction(Sender).Checked := true;
end;

procedure TMainf.tool_UserDefinedtextExecute(Sender: TObject);
var
  i: integer;
begin
  FMap.MouseAction := actUserDefinedText;
  for i := 0 to ActionList1.ActionCount - 1 do
  begin
    if (ActionList1.Actions[i].Category = '2地图工具') then
    begin
      if ActionList1.Actions[i].Name <> 'tool_bird_eye' then
      begin
        TAction(ActionList1.Actions[i]).Checked := false;
      end;
    end;
  end;
  TAction(Sender).Checked := true;
  PageControl1.ActivePageIndex := 2;
end;

procedure TMainf.tool_distanceExecute(Sender: TObject);
var
  i: integer;
begin
  FMap.MouseAction := actMeasure;
  for i := 0 to ActionList1.ActionCount - 1 do
  begin
    if (ActionList1.Actions[i].Category = '2地图工具') then
    begin
      if ActionList1.Actions[i].Name <> 'tool_bird_eye' then
      begin
        TAction(ActionList1.Actions[i]).Checked := false;
      end;
    end;
  end;
  TAction(Sender).Checked := true;
end;

procedure TMainf.tool_select_pointExecute(Sender: TObject);
begin
  FMap.MouseAction := actPointSelect;
end;

procedure TMainf.tool_not_selectExecute(Sender: TObject);
var
  i: integer;
begin
  FMap.MouseAction := actNoAction;
  for i := 0 to ActionList1.ActionCount - 1 do
  begin
    if (ActionList1.Actions[i].Category = '2地图工具') then
    begin
      if ActionList1.Actions[i].Name <> 'tool_bird_eye' then
      begin
        TAction(ActionList1.Actions[i]).Checked := false;
      end;
    end;
  end;
  TAction(Sender).Checked := true;
end;

procedure TMainf.FMapMetaSelected(Sender: TObject);
var
  i: integer;
  Layer: TDrawLayer;
  layerAry: array of TDrawLayer;
  kfieldUidValue: array of Integer;
  cnt: Integer;
begin
  cnt := 0;
  for i := 0 to FMap.Layers.Count - 1 do
  begin
    Layer := FMap.Layers.GetLayerByIndex(i);
    //if not (lyVisible in Layer.State) then continue;
   // if not (lySelect in Layer.State) then continue;
    if Layer.EntityMeta.Count = 0 then continue;
    Inc(cnt);
    SetLength(kfieldUidValue, cnt);
    SetLength(layerAry, cnt);
    kfieldUidValue[cnt - 1] := Layer.Data.GetMetaUID(Layer.EntityMeta.GetData(0));
    layerAry[cnt - 1] := Layer;
  end;
  if cnt > 0 then //选中点的数据　显示
  begin
    FDlg_data_display.InitForm(layerAry, kfieldUidValue);
    FDlg_Map.Panel_data_display.top := FDlg_Map.Panel_Map.Height - FDlg_data_display.Height;
    FDlg_Map.Panel_data_display.left := FDlg_Map.Panel_Map.Width - FDlg_data_display.Width;
    if not FDlg_Map.Panel_data_display.Showing then
    begin
      FDlg_Map.Panel_data_display.Show;
      FDlg_Map.Panel_data_display.BringToFront;
      if not FDlg_data_display.Showing then FDlg_data_display.Show;
    end;
  end
  else
  begin
    if FDlg_Map.Panel_data_display.Showing then
      FDlg_Map.Panel_data_display.Hide;
  end;
end;

procedure TMainf.help_aboutExecute(Sender: TObject);
var dlg: Tfrmabout;
begin
  dlg := TfrmAbout.Create(self);
  dlg.LabelVer.Caption := dlg.LabelVer.Caption + VERSION;
//  dlg.Label2.Caption := Application.Title;
  try
    dlg.ShowModal;
  finally
    dlg.Free;
  end;
end;

procedure TMainf.sys_exitExecute(Sender: TObject);
begin
  Close;
end;

procedure TMainf.SaveWS;
var
  layer: TLayerParamArray;
  i, j, n: Integer;
  m: IMap;
  lay: ILayer;
begin
  GlobalParam.MapLeft := FMap.DrawCood.WorldRect.Left;
  GlobalParam.MapRight := FMap.DrawCood.WorldRect.Right;
  GlobalParam.MapTop := FMap.DrawCood.WorldRect.Top;
  GlobalParam.MapBottom := FMap.DrawCood.WorldRect.Bottom;
  SetLength(layer, FMap.Layers.Count);
  m := TMapCtrl.Create(FMap);
  //for i := 0 to FMap.Layers.Count - 1 do
  i := 0; //
  j := i; //
  n := FMap.Layers.Count - 1; //
  while j <= n do
  begin
    lay := m.GetLayer(i);
    if lay.isHaveNotDelete then
    begin
      i := i + 1; //
      n := n - 1; //
      SetLength(layer, n + 1); //
      Continue;
    end;
    if FMap.Layers.Layer[i].Data.FileName = '' then
    begin
      i := i + 1; //
      n := n - 1; //
      SetLength(layer, n + 1); //
      Continue;
    end;
    layer[j].FilePath := ExtractRelativePath(Application.ExeName, FMap.Layers.layer[i].Data.FileName);
    layer[j].Visible := lay.IsVisible;
    layer[j].Selected := lay.IsSelected;
    layer[j].MetaLimit := lay.IsMetaIgnore;
    layer[j].ShowLabel := lay.IsShowLabel;
    layer[j].LabelField := lay.GetlabelValue;
    layer[j].ScaleLimit := lay.IsLayerIgnore;
    layer[j].MinScale := lay.GetLayerMinScale;
    layer[j].MaxScale := lay.GetLayerMaxScale;
    layer[j].lay_Order := j;
    lay := nil;
    i := i + 1; //
    j := j + 1; //
  end;
  m := nil;
  GlobalParam.LayerParam := layer;
end;

procedure TMainf.OpenDefaultMap;
var
  m: IMap;
  lay: ILayer;
  FileName, path: string;
  mapfont: TMapFont;
  inifile: TIniFile;

begin
  m := TMapCtrl.Create(FMap);
  inifile := TIniFile.Create(ExePath + 'Config.ini');
  try
    Path := ExtractFilePath(Application.ExeName);
    FileName := path + '省.tyo';
    FFLashDlg.SetLabel(FileName);
    if not FileExists(FileName) then exit;
    FMap.LoadFromFile(FileName);
    ADeviceManage.ShengLayer := FMap.Layers.GetLayerByIndex(0);
    lay := m.GetLayer(0);
    lay.SetVisible(true);
    lay.SetSelected(true);
    lay.SetMetaIgnore(true);
    lay.SetShowLabel(true);
    lay.SetLabelValue('name');
    lay.SetLayerIgnore(true);
    lay.SetLayerMinScale(1000);
    lay.SetLayerMaxScale(500000);
    lay.SetHaveNotDelete(true);

    mapfont.Name := inifile.ReadString('省', 'FontName', '隶书');
    mapfont.Size := inifile.ReadInteger('省', 'FontSize', 20);
    mapfont.Color := inifile.ReadInteger('省', 'FontColor', 8388608);
    lay.SetLayerFont(mapfont);
    lay := nil;

    FileName := path + '市.tyo';
    FFLashDlg.SetLabel(FileName);
    if not FileExists(FileName) then exit;
    FMap.LoadFromFile(FileName);
    ADeviceManage.ShiLayer := FMap.Layers.GetLayerByIndex(0);
    lay := m.GetLayer(0);
    lay.SetVisible(true);
    lay.SetSelected(true);
    lay.SetMetaIgnore(true);
    lay.SetShowLabel(true);
    lay.SetLabelValue('name');
    lay.SetLayerIgnore(true);
{$IFNDEF ForTestUser}
    lay.SetLayerIgnore(false);
{$ENDIF}
    lay.SetLayerMinScale(1000);
    lay.SetLayerMaxScale(20000);
    lay.SetHaveNotDelete(true);
    mapfont.Name := inifile.ReadString('市', 'FontName', '宋体');
    mapfont.Size := inifile.ReadInteger('市', 'FontSize', 14);
    mapfont.Color := inifile.ReadInteger('市', 'FontColor', 32768);
    lay.SetLayerFont(mapfont);
    lay := nil;


    FileName := path + '县.tyo';
    FFLashDlg.SetLabel(FileName);
    if not FileExists(FileName) then exit;
    FMap.LoadFromFile(FileName);
    ADeviceManage.XianLayer := FMap.Layers.GetLayerByIndex(0);
    lay := m.GetLayer(0);
    lay.SetVisible(true);
    lay.SetSelected(true);
    lay.SetMetaIgnore(true);
    lay.SetShowLabel(true);
    lay.SetLabelValue('name');
    lay.SetLayerIgnore(true);
{$IFNDEF ForTestUser}
      // lay.SetLayerIgnore(false);
{$ENDIF}
      //lay.SetLayerMinScale(250);
    lay.SetLayerMaxScale(5000);
    lay.SetHaveNotDelete(true);
    mapfont.Name := inifile.ReadString('县', 'FontName', '宋体');
    mapfont.Size := inifile.ReadInteger('县', 'FontSize', 11);
    mapfont.Color := inifile.ReadInteger('县', 'FontColor', 128);
    lay.SetLayerFont(mapfont);
    lay := nil;

    if not GlobalParam.isLoadChinaRoad then exit;
    SetCurrentDir(Path); //当每一次打开文件,当前路径就改变了,所以这个函数要放在循环.
    FileName := ExpandFileName('..\map\Road.tyo');

    if not FileExists(FileName) then exit;
    FMap.LoadFromFile(FileName);
    ADeviceManage.Road := FMap.Layers.GetLayerByIndex(0);
    lay := m.GetLayer(0);
    lay.SetVisible(true);
    lay.SetSelected(true);
    lay.SetMetaIgnore(true);
    lay.SetShowLabel(true);
    lay.SetLabelValue('name');
    lay.SetLayerIgnore(true);

    lay.SetLayerMinScale(0);
    lay.SetLayerMaxScale(3500);
    lay.SetHaveNotDelete(true);
    mapfont.Name := inifile.ReadString('Road', 'FontName', '宋体');
    mapfont.Size := inifile.ReadInteger('Road', 'FontSize', 10);
    mapfont.Color := inifile.ReadInteger('Road', 'FontColor', 250);
    lay.SetLayerFont(mapfont);
    lay := nil;

  finally
    inifile.Free;
    m := nil;
  end;
end;

procedure TMainf.OpenWSInit(AMapNode: TMapNode; Gauge1: TGauge);
var
  i: Integer;
  m: IMap;
  lay: ILayer;
  LayerNum: integer;
  ppLayer: PLayerCfg;
  FileName, MapName: string;
  beginDatetime: TDatetime;
  temp: TMapNode;
begin
      //showmessage('TMainf.ChangeMap');
  try
    m := TMapCtrl.Create(FMap);
    SetCurrentDir(ExtractFilePath(Application.ExeName));
    LayerNum := AMapNode.LayerCfgManager.Count;
    temp := AMapNode.ParentNode;
    MapName := AMapNode.Name;
    if temp <> nil then
      while (temp.Name <> '全国') do
      begin
        MapName := temp.Name + '->' + MapName;
        temp := temp.ParentNode;
        if (temp = nil) {or(temp.Name='全图')} then break;
      end;

    FDlg_Map.PanelMapName.Caption := '当前地图区域－' + MapName;

    //Self.Caption := Application.Title + '                       当前显示 ' + MapName + ' 地图';
    MapManger.CurrentNode := AMapNode;
    for i := LayerNum - 1 downto 0 do
    begin
      try
        beginDatetime := now;
        SetCurrentDir(ExtractFilePath(Application.ExeName));
        ppLayer := AMapNode.LayerCfgManager.LayerCfgItem[i];
        FFLashDlg.SetLabel(ppLayer^.FilePath);
        FileName := ExpandFileName(ppLayer^.FilePath);
        if not FileExists(FileName) then continue;
        FMap.LoadFromFile(FileName);
        lay := m.GetLayer(0);
        lay.SetVisible(ppLayer^.Visible);
        lay.SetSelected({ppLayer^.Selected}true);
        lay.SetMetaIgnore(ppLayer^.MetaLimit);
        lay.SetShowLabel(ppLayer^.ShowLabel);
        lay.SetLabelValue(ppLayer^.LabelField);
        lay.SetLayerIgnore(ppLayer^.ScaleLimit);
        lay.SetLayerMinScale(ppLayer^.MinScale);
        lay.SetLayerMaxScale(ppLayer^.MaxScale);
        lay.SetLayerFont(ppLayer^.MapFont);
        lay := nil;
        Gauge1.AddProgress(trunc((1 / LayerNum) * 90));
        if MilliSecondsBetween(now, beginDatetime) > 500 then
          TForm(Gauge1.Parent).Show;
            // showmessage('TMainf.OpenWSInit  Current'+IntToStr(LayerNum-i)+'  Total'+IntToStr(LayerNum ) );
      except
        Continue;
      end;
    end;


  except on E: Exception do
      uGloabVar.SystemLog.AddLog(' OpenWSInit(AMapNode:TMapNode;Gauge1:TGauge)函数报错: ', e.Message);
  end;
end;


procedure TMainf.OpenWS(AMapNode: TMapNode; Gauge1: TGauge);
begin
  try
    OpenWSInit(AMapNode, Gauge1);

    if (AMapNode.OutBox.Xmin = 0) and (AMapNode.OutBox.Xmax = 0) then
    begin
      if AMapNode.ParentNode <> nil then
        FMap.Zoom(AMapNode.ParentNode.OutBox)
      else
        FMap.Zoom(ADeviceManage.ShengLayer.Outbox);
    end
    else
      FMap.Zoom(AMapNode.OutBox);
    FFLashDlg.SetLabel('地图处理...');
    application.ProcessMessages;
    //FMap.Draw;
  except on E: Exception do
      uGloabVar.SystemLog.AddLog(' TMainf.OpenWS(AMapNode:TMapNode;Gauge1:TGauge)函数报错: ', e.Message);
  end;
end;

procedure TMainf.OpenWSAutoScale(AMapNode: TMapNode; Gauge1: TGauge; OutBox: TWorldRect);
var
  temp: double;

begin
  try
    temp := FMap.DrawCood.GetRealScale;
    OutBox := FMap.DrawCood.WorldRect;

    OpenWSInit(AMapNode, Gauge1);
    // showmessage('TMainf.OpenWS1');
    FFLashDlg.SetLabel('地图处理...');
//    application.ProcessMessages;//dxf 2007-07-11  此语名不能加上,如果加上,切换地图时会闪烁显示省图

    FMap.DrawCood.SetRealScale(temp);
   // showmessage('TMainf.OpenWS2');
    FMap.Zoom(OutBox);
  //  showmessage('TMainf.OpenWS3');
//    FMap.Draw;
  except on E: Exception do
      uGloabVar.SystemLog.AddLog(' OpenWSAutoScale(AMapNode:TMapNode;Gauge1:TGauge)函数报错: ', e.Message);
  end;
end;





procedure TMainf.OpenWS;
var
  i: Integer;
  m: IMap;
  lay: ILayer;
  r: TWorldRect;
  LayerNum: integer;
  s, CDir: string;
begin
  try
    m := TMapCtrl.Create(FMap);
    CDir := ExtractFilePath(Application.ExeName);
    LayerNum := Length(GlobalParam.LayerParam);
    for i := LayerNum - 1 downto 0 do
    begin
      SetCurrentDir(CDir); //当每一次打开文件,当前路径就改变了,所以这个函数要放在循环.
      s := ExpandFileName(GlobalParam.Layerparam[i].FilePath);
      if not FileExists(s) then continue;
      try
        FMap.LoadFromFile(s);
        lay := m.GetLayer(0);
        lay.SetVisible(GlobalParam.Layerparam[i].Visible);
        lay.SetSelected({GlobalParam.Layerparam[i].Selected}true);
        lay.SetMetaIgnore(GlobalParam.Layerparam[i].MetaLimit);
        lay.SetShowLabel(GlobalParam.Layerparam[i].ShowLabel);
        lay.SetLabelValue(GlobalParam.Layerparam[i].LabelField);
        lay.SetLayerIgnore(GlobalParam.Layerparam[i].ScaleLimit);
        lay.SetLayerMinScale(GlobalParam.Layerparam[i].MinScale);
        lay.SetLayerMaxScale(GlobalParam.Layerparam[i].MaxScale);
        lay := nil;
        FFLashDlg.Gauge1.AddProgress(trunc((1 / LayerNum) * 90));
      except
        continue;
      end;
    end;
    r.Left := GlobalParam.MapLeft;
    r.Right := GlobalParam.MapRight;
    r.Top := GlobalParam.MapTop;
    r.Bottom := GlobalParam.MapBottom;
    FMap.Zoom(r);
    FFLashDlg.SetLabel('地图处理...');
    application.ProcessMessages;
    FMap.Draw;
  except
  end;
end;

procedure TMainf.tool_bird_eyeExecute(Sender: TObject);
begin
  with (Sender as TAction) do
  begin
    Checked := not Checked;
    if Checked then
    begin
      FDlg_Map.Panel_BirdEyeSet.BringToFront;
      FDlg_Map.Panel_birdEye.Visible := true;
    end
    else
    begin
      FDlg_Map.Panel_birdEye.Visible := false;
      FDlg_Map.Panel_BirdEyeSet.SendToBack;
    end;
  end;
end;

procedure TMainf.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if CheckOtherFormIsQuerying then
  begin
    CanClose := False;
    Exit;
  end;
  
  if messagebox(handle, '您确定要退出本系统？', '退出选项', MB_OKCANCEL + MB_ICONQUESTION) = ID_CANCEL then
    CanClose := false;
end;

procedure TMainf.Connect2Gateway;
begin
   //线程 还改用定时器
  DataServer := TGateWayServerCom.Create;
  DataServer.OnReadDevPicTimesInfoRet := DoReadDevPicTimesInfoRet;
  DataServer.UserId := current_user.id;
  DataServer.UserPass := current_user.Password;
  DataServer.Host := GlobalParam.Gateway.Host;
  DataServer.Port := GlobalParam.Gateway.Port;
  //DataServer.Active := True;
end;

procedure TMainf.fun_callDevExecute(Sender: TObject); //呼叫车辆
begin
//{$IFDEF ForAddEKey}
//  ConnectedEkey_monitor;
//{$ENDIF}
//  if not CheckDevId then
//  begin
//    fun_Devs_CallDevExecute(Sender);
//    exit;
//  end;
//  DataServer.CallTarget(GCurSelectDev.Id);
end;

procedure TMainf.sys_lockExecute(Sender: TObject); //锁定
var
  dlg: Tfrmlogin;
  TempBool: boolean;
begin
  TempBool := false;

//  SkinData1.Active := False;
  dlg := TfrmLogin.Create(self);
  try
//    dlg.Caption := '用户锁定';
//    dlg.Panel1.Caption := '用户锁定';
    dlg.Edit1.Text := '';
    dlg.edit2.Text := '';
    dlg.SpeedButton2.Enabled := False;
    dlg.SpeedButton3.Enabled := False;
    dlg.SpeedButton4.Enabled := False;
//    dlg.BitBtn1.Left := 93-35;//(dlg.Width - dlg.BitBtn1.Width) div 2;
//    dlg.BitBtn3.Left := dlg.BitBtn3.Left - 35;
//    dlg.BitBtn4.Left := dlg.BitBtn4.Left - 35;
//    dlg.BitBtn2.Visible := false;
//    dlg.label3.Caption := '锁定时间：' + formatdatetime('yyyy-mm-dd hh:nn:ss', now());
//    dlg.Label3.Visible := true;
      dlg.Label1.Visible := True;
    if GlobalParam.IsUseTelServer then
    begin
      TempBool := TimerCall.Enabled;
//      FCallClient.PauseWork;
    end;
    while true do
    begin
      //最小化本软件 窗口
      SetWindowStat(wsMinimized);
      Self.Hide;
      timer.Enabled := false;

      dlg.ShowModal;
      if dlg.ModalResult = mrok then
      begin
        if trim(dlg.Edit1.Text) <> current_user.UserName then
        begin
          messagebox(handle, '用户名不正确，请重新输入！', '提示', mb_ok + mb_iconinformation);
          dlg.Edit1.Text := '';
          continue;
        end;
        if trim(dlg.Edit2.Text) <> current_user.Password then
        begin
          messagebox(handle, '密码不正确，请重新输入！', '提示', mb_ok + mb_iconinformation);
          dlg.Edit2.Text := '';
          continue;
        end;
        if (trim(dlg.Edit1.Text) = current_user.UserName) and
          (trim(dlg.Edit2.Text) = current_user.Password) then
        begin
//          if not skinDefault.Checked then
//            SkinData1.Active := True;
          SetWindowStat(wsMaximized);
          Self.Show;
          if GlobalParam.IsUseTelServer then
          begin
            //TimerCall.Enabled:=TempBool;
            //FCallClient.ResumeWork;
          end;
          timer.Enabled := true;
          break;
        end;
      end;
    end;
  finally
    dlg.Free;
  end;
end;

procedure TMainf.sys_offExecute(Sender: TObject); //注销
var
  TempBool: boolean;
  IniFile: TIniFile;
  i: Integer;
  s: string;
begin
  TempBool := false;
  
  if messagebox(handle, '您确定要注销？', '提示', mb_yesno + mb_iconquestion) = id_no then exit;

//  SkinData1.Active := False;
  WindowState := wsMinimized;
  Self.Hide; //
  if GlobalParam.IsUseTelServer then
  begin
    TempBool := TimerCall.Enabled;
//    FCallClient.PauseWork;
  end;
  timer.Enabled := False;
  if tool_bird_eye.Checked then tool_bird_eyeExecute(tool_bird_eye);
  if FDlg_Map.Panel_data_display.Showing then FDlg_Map.Panel_data_display.Hide;
  //清跟踪车辆
  if Fmap.GpsDrawlayer.AutoFollowDevice <> nil then
    Fmap.GpsDrawlayer.AutoFollowDevice := nil;
  //清除地图上的车
  FMap.DrawGpsMap_Clear;
  //保存前一用户的区域文件
  //{$ifdef For_ConfineArea}
    //GAreaManage.SaveCurrentAreasToFile(ExtractFilePath(application.ExeName)+current_User.UserName+'_areas.ini');
  //{$endif}
  {  断开与网关服务器的连接,清用户所发的命令  }
  ACmdManage.ClearCmd; //ACmdManage.Free;
  GReadParamCmdID := 0;
  DataServer.LogOutFromGateway;
  DataServer.Active := false;
  //用户登出
  bs.userlogout(current_user);
  current_user.Free;
  //断开连接
  bs.DisConnectServer;

  ADevGroupManage.Clear; //清组

  ADeviceManage.ClearDevice; //清车辆\设备
  ACarManage.ClearCar;


  FDlg_Watch_Car.cxDeviceList.Clear; //FDlg_Watch_Car.listview1.Clear; //车辆GPS数据详情
  FDlg_Watch_Car.TreeView1.Items.Clear;
  FDlg_AlarmCar.cxAlarmList.Clear;
  FDlg_AlarmCar.cxStopAlarmList.Clear;
  FDlg_Sended_Cmd.cxTreeList1.Clear; //FDlg_Sended_Cmd.ListView1.Clear ;//已发命令


  //FDlg_OrderList.cxOrderList.Clear; //订单列表..
  //FDlg_Received_Info.cxInfoList.Clear; //收到网关的信息
 // FDlg_OrderList.cxOrderList.Clear;

  GCurSelectDev := nil;
  GCurSelectGroupID := -1;
  //{$ifdef For_ConfineArea}
  GCurConfineArea := nil;
  GAreaManage.Clear; //限定区域 管理器
  FDlg_AlarmCar.cxOutCAreaList.Clear;
  FDlg_AlarmCar.cxOutCAreaList_History.Clear;
  FDlg_AlarmCar.cxInCAreaList.Clear;
  FDlg_AlarmCar.cxInCAreaList_History.Clear;
  FDlg_ConfineAreaList.cxAreaList.Clear;
  FDlg_ConfineAreaList.Clear_Changed;
  FDlg_ERunDataList.cxTreeList1.Clear;
  FDlg_DriverInfoUpload.cxTreeList1.Clear;
  FDlg_MediaEventUpload.cxTreeList1.Clear;
  FDlg_SrvRunInfo.cxTreeList1.Clear;
  FDlg_TSPDataUpload.cxAlarmSuperviseList.Clear;
  FDlg_DevKeyEventLog.cxTreeList1.Clear;
  FDlg_RunRecDataUpload.Memo1.Clear;
  FDlg_AlarmSupervise.cxAlarmSuperviseList.Clear;

  FDlg_DevAlarmCar.cxAreaAlarmList.Clear; 
  //{$endif}

  //if FDlg_Sended_msg.Visible then   // 已发简短消息
  //  FDlg_Sended_msg.ListViewTo.Items.Clear;

  Edit1.Text := '';
  Edit2.Text := '';
  ComboboxCarNo.Text := '';
  StatusBar1.Panels.Items[2].Text := '';
  if fun_ShowACarTrack.Checked then fun_ShowACarTrack.Checked := false; //显示轨迹
  if fun_watch_car.Checked then fun_watch_car.Checked := false; //跟踪
  Dlgs_Free; //隐去所有窗口

   //载入参数文件
   //GlobalParam.LoadFromFile(Application.ExeName + '.config');

  // 新 用户登录
  userlogin_connect(1);
  if logined then
  begin
//    if not skinDefault.Checked then
//      SkinData1.Active := True;
    QueryOpenInfo;

    WindowState := wsMaximized;
    Self.Show;    
  end
  else begin
//    FCallClient.StopWork;
    DisposeCar.StopDispose;
    application.Terminate;
  end;
end;

procedure TMainf.fun_view_SwitchStatExecute(Sender: TObject); //查看 某车设备的接头状态
begin
  if not CheckDevId then exit;
  if not Panel_Clxx.Visible then
    show_car.Execute;
  ShowState(GCurSelectDev);
end;

procedure TMainf.fun_watch_carExecute(Sender: TObject); //跟踪车辆--使某车不出地图的边界
begin
  with fun_watch_car do
  begin
    if not checked then
    begin
      if not CheckDevId then exit;
      GOldFollowDev := AutoFollowDevice;       // liusen
      if (GCurSelectDev.Longitude = 0) or (GCurSelectDev.Latitude = 0) then
      begin
        messagebox(handle, '目前该车无定位数据，不能跟踪!', '提示', mb_ok + mb_iconinformation);
        exit;
      end;
      AutoFollowDevice := GCurSelectDev;      //liusen
      //GOldFollowDev 保存用户指定的 跟踪车辆，
      //当有车辆报警时，跟踪报警车辆。当该车取消报警时，恢复保存过的用户指定跟踪车辆GOldFollowDev
      GOldFollowDev := GCurSelectDev;
      StatusBar1.Panels.Items[2].Text := '当前跟踪车辆：' + GCurSelectDev.Car.No;
    end
    else
    begin
      AutoFollowDevice := nil;    // liusen
      GOldFollowDev := nil;
      StatusBar1.Panels.Items[2].Text := '';
    end;
    checked := not checked;
  end;
end;

procedure TMainf.SetWindowStat(ws: TWindowState);
begin
  if ws = wsMinimized then
  begin
    windowState := ws;
  end
  else
  begin
    WindowState := ws; //最大化本软件 窗口
  end;
end;

procedure TMainf.fun_view_DevParamExecute(Sender: TObject);
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  if not CheckDevId then
  begin
    messagebox(0, '请先《在监控车辆列表选中》或《在右上角输入》车辆!', '提示', mb_ok + mb_iconinformation);
    exit;
  end;
  if ReadParamFrm = nil then ReadParamFrm := TParamReadFrm.Create(Self);
  if GCurSelectDev <> nil then
  begin
    ReadParamFrm.SetCurrentDev(GCurSelectDev);
    ReadParamFrm.ShowModal;
  end;
    //DataServer.ReadDevParam_V3(GCurSelectDev, 0);
  //  ReadParamFrm.SetCurrentDev(GCurSelectDev);
//  ReadParamFrm.Show;
end;

procedure TMainf.TimerTimer(Sender: TObject);
begin
  try
    Timer.Enabled := false;
    LoadNotice;
    try
      RefreshSeverStat; //刷新业务和网关的状态..在状态栅里最右边两个图标,绿色为在线,灰色为掉线.
      if FDlg_Watch_Car.Floating then FDlg_Watch_Car.Refresh_WatchCar;
      if FDlg_Sended_Cmd.Floating then FDlg_Sended_Cmd.Refresh_SendedCmd;
      if FDlg_AlarmCar.Floating then FDlg_AlarmCar.Refresh_AlarmCar;
      if FDlg_ConfineAreaList.Floating then FDlg_ConfineAreaList.ListCurrConfine_Devs;
      //if FDlg_AlarmCar.Floating then FDlg_AlarmCar.AddDate_AssembleWarring(nil, nil, true);
      //if FDlg_OrderList.Floating then FDlg_OrderList.RefreshOrderList;

      if (PageControlBottom.ActivePage.Caption = '车辆列表')  or (PageControl_Center.ActivePage.Caption ='车辆列表')then
      begin
        FDlg_Watch_Car.Refresh_WatchCar;
      end
      else if (PageControlBottom.ActivePage.Caption = '发送命令')  or (PageControl_Center.ActivePage.Caption ='发送命令') then
      begin
        FDlg_Sended_Cmd.Refresh_SendedCmd;
      end
      else if (PageControlBottom.ActivePage.Caption = '报警车辆')  or (PageControl_Center.ActivePage.Caption ='报警车辆') then
      begin
        FDlg_AlarmCar.Refresh_AlarmCar;
        //FDlg_AlarmCar.AddData_AssembleWarring(nil, nil, true);
        //FDlg_AlarmCar.AddData_SuspectedPetitionsWarring(nil, nil, True);
      end
      else if (PageControlBottom.ActivePage.Caption = '电子围栏')  or (PageControl_Center.ActivePage.Caption ='电子围栏') then
      begin
        FDlg_ConfineAreaList.ListCurrConfine_Devs;
      end
     { else if (PageControlBottom.ActivePage.Caption = '发送订单')  or (PageControl_Center.ActivePage.Caption ='发送订单') then
      begin
        FDlg_OrderList.RefreshOrderList;
      end }
      else if (PageControlBottom.ActivePage.Caption = '提示信息') or (PageControl_Center.ActivePage.Caption = '提示信息') then
      begin
        FDlg_Prompt_Info.Refresh;
      end;
      {else if (PageControlBottom.ActivePage.Caption = FDlg_AlarmCar.Caption)  or (PageControl_Center.ActivePage.Caption =FDlg_AlarmCar.Caption)then
      begin
        FDlg_AlarmCar.AddDate_AssembleWarring(nil, nil, False);
      end; }

      isOnline;

      if (GCurSelectDev <> nil) and (not FMap.IsPlayGpsData) then ShowState(GCurSelectDev);

      //if not GlobalParam.isShowEmptyFull then  StatusBar1.Panels[2].Text := '';

    except on E: Exception do
        uGloabVar.SystemLog.AddLog(' TMainf.TimerTimer函数报错: ', e.Message);
    end;
  finally
    Timer.Enabled := true;
  end;
end;

procedure TMainf.Edit1Change(Sender: TObject);
var
  i: integer;
  temp: string;
begin
  ShowListDeviceByBJYW(Edit1.Text);
  
  ShowState(GCurSelectDev);
  Edit1.SelectAll;
  for i := 0 to FDlg_Watch_Car.cxDeviceList.Count - 1 do
  begin
    if GCurSelectDev = TDevice(FDlg_Watch_Car.cxDeviceList.Items[i].Data) then
    begin
      FDlg_Watch_Car.cxDeviceList.Items[i].Focused := true;
      break;
    end;
    Application.ProcessMessages;
  end; 
end;

function TMainf.CheckDevId: boolean;
begin
  result := false;
  if (trim(edit1.text) = '') or (trim(edit2.Text) = '') or (GCurSelectDev = nil) then
    //messagebox(0,'请先《在监控车辆列表选中》或《在右上角输入》车辆!',
    //  '提示',mb_ok + mb_iconinformation)
  else
    result := true;
end;



procedure TMainf.fun_DevStatExecute(Sender: TObject);
begin
//  if not CheckDevId then exit;
//  DataServer.GetStat(GCurSelectDev.Id);
end;

procedure TMainf.TrackBarOutlookChange(Sender: TObject);
begin
{$IFDEF ForOutLook}
  FOutLook.ZoomRatio := TrackBarOutlook.Position;
  FOutLook.Draw;
{$ENDIF}
end;


procedure TMainf.Panel_MapResize(Sender: TObject);
begin
  if FDlg_Map.Panel_data_display.Showing then
  begin
    FDlg_Map.Panel_data_display.top := FDlg_Map.Panel_Map.Height - FDlg_data_display.Height;
    FDlg_Map.Panel_data_display.Left := FDlg_Map.Panel_Map.Width - FDlg_data_display.Width;
  end;
end;

procedure TMainf.cmd_cancelExecute(Sender: TObject);
var
  p: PCmdInfo;
begin
//  if FDlg_Sended_Cmd.cxTreeList1.FocusedNode = nil then exit;
//  p := FDlg_Sended_Cmd.cxTreeList1.FocusedNode.Data;
//  if (p^.State = CMD_SNDNODO) or (p^.State = CMD_RESND) then //0--已发送未执行，6--重发
//  begin
//    DataServer.CancelCmd(p^.Id);
//  end
//  else
//    MessageBox(Handle, pchar('对不起，' + p^.Desc + '这条命令不能再取消'), '提示', MB_OK + MB_ICONINFORMATION);

end;

procedure TMainf.cmd_reSendExecute(Sender: TObject);
var
  p: PCmdInfo;
begin
  if FDlg_Sended_Cmd.cxTreeList1.FocusedNode = nil then exit;
  p := FDlg_Sended_Cmd.cxTreeList1.FocusedNode.Data;
  DataServer.RepeatSend(p^.Id);
end;

procedure TMainf.DataServer_SendMsg(var message: TMessage); //传入休息的添加.
begin
  {FDlg_Received_Info.cxInfoList.BeginUpdate;
  with FDlg_Received_Info.cxInfoList.Add do //接收到服务器发送的通知消息
  begin
    Values[0] := ''; //ADeviceManage.FindToCarNO(Message.WParam);
    Values[1] := now;
    Values[2] := ReturnMsgTypeState(Message.LParam);
    Values[3] := DataServer.ServerSendMsg;
  end;
  FDlg_Received_Info.cxInfoList.EndUpdate;         }
end;



procedure TMainf.tool_layer_controlExecute(Sender: TObject);
var
  dlg: TLayer_control;
  m: IMap;
begin
  dlg := TLayer_control.Create(Self);

  m := TMapCtrl.Create(FMap);
  try
    dlg.InitMap(m);
    dlg.Edit3.Text := IntToStr(FMap.DrawCood.Scale) + '.00';
    dlg.ShowModal;
    if dlg.ModalResult = mrOk then
    begin
      FMap.Layers.SetOrder(ADeviceManage.ShengLayer, FMap.Layers.Count - 1);
      FMap.Layers.SetOrder(ADeviceManage.ShiLayer, FMap.Layers.Count - 2);
      FMap.Layers.SetOrder(ADeviceManage.XianLayer, FMap.Layers.Count - 3);
      {2011-12-02
      FMap.Layers.SetOrder(drawlayer, 0); //dxf 移GPS图层到第0层。
      FMap.Layers.SetOrder(TextLayer, 1);
      FMap.Layers.SetOrder(userDrawLayer, 2);}
      FMap.Draw;
    end;

  finally
    dlg.Free;
  end;
end;



procedure TMainf.fun_Set_DevParamExecute(Sender: TObject); //修改设备参数
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}

  if not CheckDevId then
  begin
    fun_Devs_SetParamExecute(Sender);
    exit;
  end;
  if ParamAllFrm = nil then
    ParamAllFrm := TParamAllFrm.Create(self);
  paramAllFrm.ListView1.PopupMenu := PopupMenu_SelectDevs;
  FListView_SelectDevs := paramAllFrm.ListView1;
  Add_A_Device;
  ParamAllFrm.SetCurrentDev(GCurSelectDev);
  ParamAllFrm.Show;
end;

procedure TMainf.DevNotifyStat(var message: TMessage);
var devId: integer;
begin
  devId := message.WParam;
  if messagebox(handle, '设备数据已有改变，是否现在就更新？', '提示', mb_yesno + MB_ICONQUESTION) = ID_YES then
    RefeshADev(devId);
end;

procedure TMainf.RefeshADev(const DevId: integer);
var
  followDevId, oldFollowDevId, currDevId: string;
  dev: TDevice;
  dlg: TFrmRefreshProgress;
  i: integer;
begin
  dlg := TFrmRefreshProgress.Create(Self); //=====先 定为更新所有车的数据
  Timer.Enabled := false;
  //FMap.EnableTimer(False);
  try
    try
      Screen.Cursor := crHourGlass;
      dlg.Show;
      dlg.Gauge1.AddProgress(10);
      //bs.DisConnectServer;
      Application.ProcessMessages;
      //bs.ConnectServer;
      //if not bs.Active then
      //begin
      //  popmsg('错误提示', '刷新失败!');
      //  exit;
      //end;
      //-----暂存 跟踪车辆和当前车辆的ID，因为有可能 跟踪车辆和当前车辆会被删除了
      followDevId := '';
      oldFollowDevId := '';
      currDevId :=''; //-1;
      if AutoFollowDevice <> nil then        // liusen
      begin
        followDevId := AutoFollowDevice.Id;   // liusen
        if GOldFollowDev <> nil then oldFollowDevId := GOldFollowDev.Id;
      end;
      if GCurSelectDev <> nil then
        currDevId := GCurSelectDev.Id;
      dlg.Gauge1.AddProgress(10);
      ADevGroupManage.Clear;
      ADevGroupManage.Clear; //清除组
      ACarManage.ClearCar; //车
      //GAreaManage.Clear;             //限定区域 管理器
      //ResManage.Clear;

      FDlg_Watch_Car.cxDeviceList.FocusedNode := nil; //★★
      FDlg_Watch_Car.cxDeviceList.Clear;
      FDlg_Sended_Cmd.cxTreeList1.FocusedNode := nil;
      FDlg_Sended_Cmd.cxTreeList1.Clear;
      FDlg_ConfineAreaList.cxDeviceList.FocusedNode := nil; //★★
      FDlg_ConfineAreaList.cxDeviceList.Clear;

      //DataServer.Free;
      //Connect2Gateway; //连接网关
      DataServer.Active := False;

      dlg.Gauge1.AddProgress(10);
      //current_user.ClearPrivilege;
      //Bs.QueryUser_Privilege(current_user);  // 重新加载权限
      //SetPower;
      bs.DevGroupinfo(ADevGroupManage);
      dlg.Gauge1.AddProgress(10);
      //bs.QueryAllBitmapRes; //载入图片
      dlg.Gauge1.AddProgress(10); //40
      bs.CarInfo(ACarManage); //加载车辆信息
      dlg.Gauge1.AddProgress(10); //50
      bs.DevGroupinfo(ADevGroupManage); //加载分组信息
      dlg.Gauge1.AddProgress(10); //60
      bs.Reload_DeviceInfo(ADeviceManage); //重新载入车机，对已没有的或当前用户无权查看车机，从管理器中删除

      dlg.Gauge1.AddProgress(5); //70
  {$IFDEF ForTestUser}
      Bs.QueryDevsTelList; //载入所有车机的电话本
      dlg.Gauge1.AddProgress(5);

      bs.QueryDevsEventList; //载入所有车机的事件

      FFlashDlg.Gauge1.AddProgress(5);
      //bs.QueryInfoDemandMenuList;  // 载入所有车机的点播菜单

      FFlashDlg.Gauge1.AddProgress(5);
      //bs.QueryDevsClassMenuList;  // 载入所有车机的分类菜单

      //Bs.QueryDevsMenu; //载入所有车机的显示屏固定菜单
      dlg.Gauge1.AddProgress(5);
      dlg.Gauge1.AddProgress(5);
      //BS.QueryDevParamOfAll; //加载车辆参数
      dlg.Gauge1.AddProgress(5); //80
      ADriverManage.ClearDriver;
      Bs.DriverInfo(ADriverManage); //加载司机信息
      ADeviceManage.CreateDriverNameTel;

      FFlashDlg.Gauge1.AddProgress(5);
      //Bs.Query_JudgeNotOkList;

      FFlashDlg.Gauge1.AddProgress(5);
//      Bs.QueryPassengerInfo(PassengerManage);

      FFlashDlg.Gauge1.AddProgress(5);
      //AOrderManage.LoadOrdersFromDB;      // 加载订单信息

      FFlashDlg.Gauge1.AddProgress(5);
      bs.QueryArea_New;                  // 下载区域报警类

      //{$ifdef For_ConfineArea}
      //更新区域列表中的车
      //----如果车机有变化(是针对被删除掉的车或组)，则将区域中的该车机ID删除。
      //----因为车机已经重新载入过，其区域ID为-1，现将区域ID赋上
      GAreaManage.Refresh_DevChanged;
  {$ENDIF}
      dlg.Gauge1.AddProgress(10); //90;
      if ADevGroupManage.Find(GCurSelectGroupID) = nil then //--车组
        GCurSelectGroupID := -1;
      FDlg_Watch_Car.List_TreeGroup; //显示车辆组(树)

      dlg.Gauge1.AddProgress(5);
      dev := ADeviceManage.Find(followDevId); //---恢复 跟踪车辆
      if dev = nil then
      begin
        AutoFollowDevice := nil;             // liusen
        GOldFollowDev := nil;
        //StatusBar1.Panels.Items[2].Text := '';
      end
      else
      begin
        AutoFollowDevice := dev;           // liusen
        dev := ADeviceManage.Find(oldFollowDevId);
        if dev = nil then
          GOldFollowDev := nil
        else
          GOldFollowDev := dev;
      end;

      FDlg_AlarmCar.UserRefresh_IfDevDeleted_CheckCAList; //用户刷新数据，可能有车被删除了。检查并删除越界及驶入列表中 已被删除的车辆信息
      FMap.DrawGpsMap_ClearDraw;

      dlg.Gauge1.AddProgress(10); // 100;
      GCurSelectDev := ADeviceManage.Find(currDevId); //---恢复 当前车辆
      if GlobalParam.isCarNOAndDevName then ADeviceManage.CarNOAndDevName; //车牌号和设备名称合在一起....

      if GCurSelectDev <> nil then
      begin
        Edit2.Text := GCurSelectDev.Id;
        Edit1.Text := GCurSelectDev.Car.No;
        for i := 0 to FDlg_Watch_Car.cxDeviceList.Count - 1 do
        begin
          if TDevice(FDlg_Watch_Car.cxDeviceList.Items[i].Data) = GCurSelectDev then
          begin
            FDlg_Watch_Car.cxDeviceList.Items[i].Selected := true;
            break;
          end;
        end;
      end
      else
      begin
        Edit1.Text := '';
        Edit2.Text := '';
      end;
    except
      on E: exception do
      begin
        messagebox(handle, pchar(e.Message), '连接到业务服务器失败！', mb_ok + mb_iconinformation);
        Exit;
      end;
    end;
    List_TreeGroup;
    //Dlgs_Show;
    Dlgs_Hide;
    ActionCheck;
  finally
    Screen.Cursor := crDefault;
    //FMap.EnableTimer(True);
    Timer.Enabled := True;
    DataServer.Active := True;
    dlg.Free;
  end;
end;

procedure TMainf.fun_refresh_all_devExecute(Sender: TObject); //更新所有车的数据
begin
  fun_refresh_all_dev.Enabled := false;
  fun_refresh_all_dev.Update;
  try
    RefeshADev(0);
  finally
    fun_refresh_all_dev.Enabled := true;
  end;
end;

{procedure TMainf.DevToHostString(var message: TMessage);
begin
  with FDlg_Received_Info.cxInfoList.Add  do //接收到服务器发送的通知消息
  begin
    Values[0]:=ADeviceManage.FindToCarNO(Message.WParam);
    Values[1]:=now;
    Values[2]:=ReturnMsgTypeState(Message.LParam);
    Values[3]:=DataServer.ServerSendMsg;
  end;
end; }

procedure TMainf.RefreshSeverStat;
begin
  try
    {if Bs <> nil then
    begin
      if Bs.Active then
        StatusBar1.Panels.Items[4].ImageIndex := 3
      else
      begin
        StatusBar1.Panels.Items[4].ImageIndex := 4;
      end;
    end;      }
    MemoBs.Text := '业务:' + Bs.Host + ':' + IntToStr(Bs.Port);
    if DataServer <> nil then
      if DataServer.Active then
      begin
        StatusBar1.Panels.Items[5].ImageIndex := 3;
        if not Assigned(DataServer.OnRefreshSrvRunInfo) then
          DataServer.OnRefreshSrvRunInfo := FDlg_SrvRunInfo.RefreshSrvRunInfo;
      end
      else
      begin
        FDlg_SrvRunInfo.setAllSrvDisconnect;
        ADeviceManage.SetAllDevIsOffLine;
        StatusBar1.Panels.Items[5].ImageIndex := 4;
        if DataServer.Socket.DisConnectCount > 3 then
        begin
          try
            uGloabVar.SystemLog.AddLog(FormatDateTime('yyyy-mm-dd hh:nn:ss', now) + '开始重新创建网关...');
            DataServer.Active := false;
            DataServer.Socket.Active := false;
            DataServer.Free;
            Connect2Gateway;
            uGloabVar.SystemLog.AddLog(FormatDateTime('yyyy-mm-dd hh:nn:ss', now) + '重新创建网关成功');
          except on E: Exception do
            begin
              uGloabVar.SystemLog.AddLog(FormatDateTime('yyyy-mm-dd hh:nn:ss', now) + '重新创建网关失败', e.Message);
            end;
          end;

        end;

      end;
    MemoGateWay.Text := '网关:' + DataServer.Socket.Host + ':' + IntToStr(DataServer.Socket.Port);

  except on E: Exception do
      uGloabVar.SystemLog.AddLog(' RefreshSeverStat函数报错: ', e.Message);
  end;

  {if not GlobalParam.IsUseTelServer then
  begin
    if TimerCall.Enabled then TimerCall.Enabled := false;
    if StatusBar1.Panels.Items[6].Width <> 0 then StatusBar1.Panels.Items[6].Width := 0;
  end
  else
  begin
    if StatusBar1.Panels.Items[6].Width = 0 then StatusBar1.Panels.Items[6].Width := 52;
    if FCallClient.Work then
      StatusBar1.Panels.Items[6].ImageIndex := 3
    else
    begin
      StatusBar1.Panels.Items[6].ImageIndex := 4;
      TimerCall.Enabled := true;
    end;
  end; }
end;


procedure TMainf.fun_Locate_CarExecute(Sender: TObject); //使某车位置居于地图中心
var
  ep: TEarthPoint;
  wp: TWorldPoint;

  sp: Tpoint;
begin
  if not CheckDevId then
  begin
   //PopMsg('提示','请先《在监控车辆列表选中》或《在右上角输入》车辆');
    messagebox(0, '请先《在监控车辆列表选中》或《在右上角输入》车辆!', '提示', mb_ok + mb_iconinformation);
    exit;
  end;
  ep.Longitude := GCurSelectDev.Longitude;
  ep.Latitude := GCurSelectDev.Latitude;
  if (ep.Longitude = 0) and (ep.Latitude = 0) then
    PopMsg('提示', '对不起，此车没有GPS数据!无法定位!')
   // messagebox(handle,'对不起，现在该车没有GPS数据!无法定位!','提示',mb_ok + mb_iconinformation)
  else
  begin
    Local_Car(GCurSelectDev);
  end;
end;

procedure TMainf.fun_Locate_CarExecute_rundata(desc: string); //使某车位置居于地图中心
var
  ep: TEarthPoint;
  wp: TWorldPoint;
  sp: Tpoint;
begin
  ep.Longitude := GCurSelectDev_rundata.Longitude;
  ep.Latitude := GCurSelectDev_rundata.Latitude;
  wp := FMap.Projection.LoLa2XY(ep);
  {//切换地图
  FindMapName(playDev, wp);
  fun_ChangeMap.Execute;     }
  if GlobalParam.isAutoChangeMap then fun_ChangeMap.Execute;
  if not GeometryCalc.PointInRect(wp, FMap.DrawCood.WorldRect) then
  begin
    FMap.Zoom(1, wp);
    FMap.Draw;
  end;
  sp := FMap.DrawCood.ConvertSP(wp);
  FMap.TmpDraw.Canvas.Pen.Color := clred;
  FMap.TmpDraw.Canvas.Pen.Width := 3;
  FMap.TmpDraw.Canvas.Pen.Mode := pmMask;
  FMap.DrawTempEllipseAndText(sp.x, sp.y, desc);
end;

//使在地图中 画一下某个内容，如：报警地点
procedure TMainf.ShowInfoInMap(ALongitude,ALatitude:Double;AShowInfo:String);
var
  ep: TEarthPoint;
  wp: TWorldPoint;
  sp: Tpoint;
  i:Integer;
begin
  if PageControl_Center.PageCount >1 then
  begin
    //设置 地图窗口为　活动层
    for i := 0 to PageControl_Center.PageCount - 1 do
    begin
      if PageControl_Center.Pages[i].Caption = FDlg_Map.Caption then
      begin
        try
          PageControl_Center.ActivePageIndex := i;
        except
          break;
        end;
        break;
      end;
    end;  
  end;
  ep.Longitude := ALongitude;
  ep.Latitude := ALatitude;
  wp := FMap.Projection.LoLa2XY(ep);
  //切换地图
  if GlobalParam.isAutoChangeMap then fun_ChangeMap.Execute;
  if not GeometryCalc.PointInRect(wp, FMap.DrawCood.WorldRect) then
  begin
    FMap.Zoom(1, wp);
    FMap.Draw;
  end;
  sp := FMap.DrawCood.ConvertSP(wp);
  FMap.TmpDraw.Canvas.Pen.Color := clred;
  FMap.TmpDraw.Canvas.Pen.Width := 3;
  FMap.TmpDraw.Canvas.Pen.Mode := pmMask;
  FMap.DrawTempEllipseAndText(sp.x, sp.y, AShowInfo);
end;

procedure TMainf.fun_ChangeMapExecute(Sender: TObject);
var
  mapNode: TMapNode;
begin
  {if not CheckDevId then
  begin
   messagebox(0,'请先《在监控车辆列表选中》或《在右上角输入》车辆!','提示',mb_ok + mb_iconinformation);
   exit;
  end;   }
 { if  (GCurSelectDev.Longitude=0 ) and (GCurSelectDev.Latitude=0 ) then
  begin
    PopMsg('提示','对不起，此车没有GPS数据!无法切换对应的地图!');
    exit;
  end;    }

  mapNode := MapManger.Find(GCurSelectDev.XianName);
  if MapNode <> nil then
  begin
    //ChangeMap(mapNode,true,true);
    ChangeMap(mapNode);
    //fun_Locate_Car.Execute;
    exit;
  end;
  if GCurSelectDev.ShiName <> GCurSelectDev.XianName then
  begin
    mapNode := MapManger.Find(GCurSelectDev.ShiName);
    if MapNode <> nil then
    begin
      //ChangeMap(mapNode,true,true);
      ChangeMap(mapNode);
      //fun_Locate_Car.Execute;
      exit;
    end;
  end;
  mapNode := MapManger.Find(GCurSelectDev.ShengName);
  if MapNode <> nil then
  begin
    //ChangeMap(mapNode,true,true);
    ChangeMap(mapNode);
    //fun_Locate_Car.Execute;
    exit;
  end;
  //ChangeMap(MapManger.RootNode);
  //PopMsg('提示','对不起，没有找到此车对应的地图!');
end;

procedure TMainf.fun_watch_cancelExecute(Sender: TObject); //取消跟踪
begin
  AutoFollowDevice := nil;    // liusen
  StatusBar1.Panels.Items[2].Text := '';
  fun_watch_cancel.Enabled := false;
end;

procedure TMainf.ApplicationEventsException(Sender: TObject; E: Exception);
begin
  messageErrorBox('连接到业务服务器失败！', e.Message);
  exit;
end;

procedure TMainf.FMapMeasure(Sender: TObject; Distance, TotalDistance,
  Area: Double; Flag: Integer);
var
  s: string;
begin
  s := '距离:';
  s := s + Format('%n米', [Distance]);
  if TotalDistance <> 0 then
    s := s + ';总距离:' + Format('%n米', [TotalDistance]);
  if Flag = 1 then
    s := s + ';面积:' + Format('%n平方米', [Area]);
  StatusBar1.Panels[2].Text := s;
end;

procedure TMainf.set_AllCarTrackExecute(Sender: TObject);
var dlg: TSet_carTrack;
begin
  dlg := Tset_CarTrack.Create(self);
  try
    dlg.ShowModal;
  finally
    dlg.Free;
  end;
end;

procedure TMainf.map_openLayerExecute(Sender: TObject);
var
  r: TWorldRect;
  OpenDialog1: TOpenDialog;
begin
  OpenDialog1 := TOpenDialog.Create(self);
  try
    OpenDialog1.InitialDir := '..\map\';
    OpenDialog1.Filter := '*.tyo|*.tyo';
    OpenDialog1.Options := OpenDialog1.Options + [ofAllowMultiSelect];
    if OpenDialog1.Execute then
    begin
      r.Left := FMap.DrawCood.WorldRect.Left;
      r.Right := FMap.DrawCood.WorldRect.Right;
      r.Top := FMap.DrawCood.WorldRect.Top;
      r.Bottom := FMap.DrawCood.WorldRect.Bottom;
      FMap.LoadFromFiles(OpenDialog1.Files);
      FMap.Zoom(r);
      FMap.Draw;
      SaveWS;
      //GlobalParam.SaveToFile(Application.ExeName+'.config');
    end;
  finally
    OpenDialog1.Free;
  end;
end;

procedure TMainf.map_CloseLayerExecute(Sender: TObject); //关闭图层
var i: integer;
  dlg: TMap_layer;
  r: TWorldRect;
begin
  dlg := Tmap_layer.Create(self);
  try
    dlg.ListBox1.Clear;
    for i := 0 to Fmap.Layers.Count - 1 do
        //if not Fmap.Layers.Layer[i].isHaveNotDelete then
      dlg.ListBox1.Items.Add(Fmap.Layers.Layer[i].LayerName);
    dlg.Caption := '删除图层';
    dlg.bitbtn1.caption := '删除图层';
    r.Left := FMap.DrawCood.WorldRect.Left;
    r.Right := FMap.DrawCood.WorldRect.Right;
    r.Top := FMap.DrawCood.WorldRect.Top;
    r.Bottom := FMap.DrawCood.WorldRect.Bottom;
    dlg.ShowModal;
    if dlg.ModalResult = mrOk then
    begin
      i := 0;
      while i < dlg.ListBox1.Count do //
      begin
        if dlg.ListBox1.Selected[i] then
        begin
          if not FMap.Layers.Layer[i].isHaveNotDelete then
          begin
            FMap.Layers.Layer[i].Data.Close;
            dlg.ListBox1.Items.Delete(i);
          end
          else
          begin
            messagebox(handle, pchar(dlg.ListBox1.Items.Strings[i] + '不能删除!'), '提示', mb_ok + mb_iconinformation);
            i := i + 1;
          end;
        end
        else
          i := i + 1;
      end;
      FMap.Zoom(r);
      FMap.Draw;
      SaveWS;
        //GlobalParam.SaveToFile(Application.ExeName+'.config');
    end;
  finally
    dlg.Free;
  end;
end;

procedure TMainf.fun_ShowACarTrackExecute(Sender: TObject);
begin
  with (sender as TAction) do
  begin
    if not CheckDevId then exit;
    Checked := not Checked;
    GCurSelectDev.DrawTrack := Checked;
  end;
end;

procedure TMainf.ShowDeviceTrack_Watch(Adev: Tdevice);
begin
  //--- 是否显示轨迹
  fun_ShowACarTrack.Checked := Adev.DrawTrack;
  //---是否被跟踪
  fun_watch_car.Checked := AutoFollowDevice = Adev;   // liusen
  fun_devhide.Checked := ADev.Hide;
  if Adev.Hide then fun_DevShowOnly.Checked := False;
  //stop_Alarm.Enabled := Adev.Alarm;
end;


procedure TMainf.RegUserError2Gateway(var message: TMessage);
var
  num: integer;
  s: string;
begin
  num := message.WParam;
  case num of
    ERR_INVALIDUSER:   s:= '无效的用户名重复登录网关服务器';
    ERR_INVALIDPASSWD: s := '无效的密码登录网关服务器';
    ERR_Logged:
      begin
        s := '[' + current_user.UserName + ']在别一处登录网关服务器';
        messagebox(handle, pchar(s), '提示', mb_ok + mb_iconinformation);
                       //sys_off.Execute;
      end;
    ERR_INVALIDVER:
      s:= '无效的版本号,网关服务器的命令版本号:'
        + inttostr(DataServer.ComVer.MajorVer) + '.' + inttostr(DataServer.ComVer.MinorVer);
  end;
  StatusBar1.Panels.Items[2].Text := s;
  PopMsg('网关错误', s);
end;

procedure TMainf.show_Sended_MessageExecute(Sender: TObject);
begin
  //ShowWindows(Sender, PageControlBottom, FDlg_OrderList, alLeft);
end;

procedure TMainf.set_AlarmSoundExecute(Sender: TObject); //设置报警声音
var
  dlg: TsetAlarmSound;
begin
  //If not HasPrivilege(PRI_LOCALSET) Then exit;
  dlg := TsetAlarmSound.Create(self);
  try
    SetCurrentDir(ExtractFilePath(Application.ExeName));
    dlg.Edit_DevAlarmSound.Text := GlobalParam.DevAlarmSound;//ExpandFileName(GlobalParam.DevAlarmSound);
    dlg.Edit_OverSpeedAlarmSound.Text := GlobalParam.AlarmSound_OverSpeet;//ExpandFileName(GlobalParam.AlarmSound_OutCArea);
    dlg.Edit_DevFaultAlarmSound.Text := GlobalParam.AlarmSound_DevFault;//ExpandFileName(GlobalParam.AlarmSound_InCArea);
    dlg.Edit_InOutAreaAlarmSound.Text := GlobalParam.AlarmSound_InCArea;//ExpandFileName(GlobalParam.AlarmSound_OverSpeet);
    dlg.Edit_DeviateAlarmSound.Text := GlobalParam.AlarmSound_Deviate;//ExpandFileName(GlobalParam.AlarmSound_CarUnOnline);
    dlg.Edit_FatigueAlarmSound.Text := GlobalParam.AlarmSound_Fatigue;//ExpandFileName(GlobalParam.MenuSound);
    dlg.Edit_PowerDownAlarmsound.Text := GlobalParam.AlarmSound_PowerDown;
    dlg.Edit_UndervoltageAlarmsound.Text := GlobalParam.AlarmSound_Undervoltage;
    dlg.Edit_TimeoutStopAlarmSound.Text := GlobalParam.AlarmSound_TimeoutStop;
    dlg.edtServerDisconnectAlarmSound.Text := GlobalParam.AlarmSound_ServerDisConnect;
    dlg.ShowModal;
    if dlg.ModalResult = mrOk then
    begin
      GlobalParam.DevAlarmSound := Trim(dlg.Edit_DevAlarmSound.Text);
      GlobalParam.AlarmSound_OverSpeet := Trim(dlg.Edit_OverSpeedAlarmSound.Text);
      GlobalParam.AlarmSound_DevFault := Trim(dlg.Edit_DevFaultAlarmSound.Text);
      GlobalParam.AlarmSound_InCArea := Trim(dlg.Edit_InOutAreaAlarmSound.Text);
      GlobalParam.AlarmSound_Deviate := Trim(dlg.Edit_DeviateAlarmSound.Text);
      GlobalParam.AlarmSound_Fatigue := Trim(dlg.Edit_FatigueAlarmSound.Text);
      GlobalParam.AlarmSound_PowerDown := Trim(dlg.Edit_PowerDownAlarmsound.Text);
      GlobalParam.AlarmSound_Undervoltage := Trim(dlg.Edit_UndervoltageAlarmsound.Text);
      GlobalParam.AlarmSound_TimeoutStop := Trim(dlg.Edit_TimeoutStopAlarmSound.Text);
      GlobalParam.AlarmSound_ServerDisConnect := Trim(dlg.edtServerDisconnectAlarmSound.Text);
      GlobalParam.SaveToFile(Application.ExeName + '.config');
    end;
  finally
    dlg.Free;
  end;
end;

//procedure TMainf.Msg_DevAlarm(var message: TMessage); //车辆报警

procedure TMainf.DoOnDevEmergncyAlarm(Adev: TDevice);
var
  str: string;
begin
  if Adev = nil then exit;
  if GlobalParam.IsAlarmFollow then //对当前报警车辆跟踪
  begin
    AutoFollowDevice := Adev;   // liusen
    StatusBar1.Panels.Items[2].Text := '跟踪报警车辆：' + Adev.Car.No;
  end;

  if Adev.AlarmCount < 6 then //响5声
  begin
    //报警声音
    if GlobalParam.DevAlarmSound <> '' then
    begin
      try
        {SetCurrentDir(ExtractFilePath(Application.ExeName));
        str := ExpandFileName(GlobalParam.DevAlarmSound);
        if FileExists(str) then  }
        MediaPalySound(GlobalParam.DevAlarmSound);
        //PlaySound(pchar(str), Hinstance, SND_FILENAME);
      except
      end;
    end;
  end;
  DevEmergncyAlarm(ADev);
end;

procedure TMainf.DoOnEarlyWarningList(changePage: Boolean;  EarlyWarningCar: TEarlyWarningCar);
var
  i: Integer;
begin
//  if FDlg_EarlyWarning <> nil then
//    FDlg_EarlyWarning.RefreshEarlyWarningList;
//
//  if changePage then
//  begin
//    if EarlyWarningCar.FEarlyWarningInfoList.Count < 6 then
//      begin
//         //报警声音
//        if GlobalParam.DevAlarmSound <> '' then
//        begin
//          try
//            //PalySound(GlobalParam.DevAlarmSound);
//            MediaPalySound(GlobalParam.DevAlarmSound);
//          except
//          end;
//        end;
//        if GlobalParam.IsEarlyWariningHurry then
//        begin
//          popmsg('预警提示', EarlyWarningCar.Dev.Car.No + #13 + #10 + '处于预警状态，请及时处理!');
//        end;
//      end;
//  end;
//
//  if (changePage) and (GlobalParam.IsEarlyWarningAutoFirstAlarm) then
//  begin
//    if (not FDlg_EarlyWarning.Visible) or (FDlg_EarlyWarning.Floating) then
//    begin
//      FDlg_EarlyWarning.ManualDock(PageControlBottom, nil, alLeft);
//      FDlg_EarlyWarning.Show;
//    end;
//
//    for i := 0 to PageControlBottom.PageCount - 1 do
//    if PageControlBottom.Pages[i].Caption = FDlg_EarlyWarning.Caption then
//    begin
//      PageControlBottom.ActivePageIndex := i;
//      break;
//    end;
//    if not show_EarlyWarningCar.Checked then
//      show_EarlyWarningCar.Checked := True;
//  end;
end;

procedure TMainf.DoOnDevOtherAlarm(Adev: TDevice; AlarmType: Byte);
begin
  if FDlg_AlarmCar <> nil then
  begin
    FDlg_AlarmCar.DoOnDevOtherAlarmEvent(Adev, AlarmType);

    {if (not FDlg_AlarmCar.Visible) or (FDlg_AlarmCar.Floating) then
    begin
      FDlg_AlarmCar.ManualDock(PageControlBottom, nil, alLeft);
      FDlg_AlarmCar.Show;
    end;

    for i := 0 to PageControlBottom.PageCount - 1 do
    if PageControlBottom.Pages[i].Caption = FDlg_AlarmCar.Caption then
    begin
      PageControlBottom.ActivePageIndex := i;
      break;
    end;
    if not show_AlarmLists.Checked then
      show_AlarmLists.Checked := True;     }
  end;
end;

procedure TMainf.show_ListCarExecute(Sender: TObject);
begin
  ShowWindows(Sender, PageControlBottom, FDlg_Watch_Car, alLeft);
end;

procedure TMainf.show_sended_commandExecute(Sender: TObject);
begin
  ShowWindows(Sender, PageControlBottom, FDlg_Sended_Cmd, alLeft);
end;

procedure TMainf.show_Received_InfoExecute(Sender: TObject);
var
  i: Integer;
begin
 { with (Sender as TAction) do
  begin
    Checked := not Checked;
    if Checked then
    begin
      if (not FDlg_Received_Info.Showing) or (FDlg_Received_Info.Floating) then
      begin
        FDlg_Received_Info.ManualDock(PageControlBottom, nil, alLeft);
        FDlg_Received_Info.Show;
        for i := 0 to PageControlBottom.PageCount - 1 do
          if PageControlBottom.Pages[i].Caption = '传入信息' then
          begin
            PageControlBottom.ActivePageIndex := i;
            break;
          end;
      end;
    end
    else
    begin
      FDlg_Received_Info.ManualDock(nil);
      FDlg_Received_Info.Hide;
    end;
  end;    }
end;

procedure TMainf.set_SaveWorkShopExecute(Sender: TObject);
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  //If not HasPrivilege(PRI_LOCALSET) Then exit;
  //保存一个本地的当前配置文件作为系统管理员的配置文件的模板
  SaveWS;
  Map_Save.Execute;
  GlobalParam.SaveToFile(Application.ExeName + '.config');
  GAreaManage.SaveCurrentAreasToFile(ExtractFilePath(application.ExeName) + current_User.UserName + '_areas.ini')
end;

procedure TMainf.stop_AlarmExecute(Sender: TObject);
begin
  Timer.Enabled := False;
  try
    if FDlg_AlarmCar.stop_Alarm then FMap.DrawGpsMap_ClearDraw; //清GPS图层并重画车 ;
  finally
    Timer.Enabled := True;
  end;
 { if GCurSelectDev <> nil then
  begin
      //解除报警命令
    DataServer.RemoveAlarm(GCurSelectDev.Id);
    GCurSelectDev.Alarm_endTime := now;
    GCurSelectDev.Alarm := false;
  end; }
end;

procedure TMainf.show_AlarmStopExecute(Sender: TObject);
begin
  show_AlarmStop.Checked := not show_AlarmStop.Checked;
  FDlg_AlarmCar.cxStopAlarmList.Visible := show_AlarmStop.Checked;
  FDlg_AlarmCar.Splitter_Alarm.Visible := show_AlarmStop.checked;
end;

procedure TMainf.OncxDeviceListEdited(Sender: TObject;
  AColumn: TcxTreeListColumn);
var
  node, nextnode: TcxTreeListNode;
begin
  if FDlg_Watch_Car.cxDeviceList.FocusedNode = nil then exit;
  if AColumn = FDlg_Watch_Car.dev_Track then
    fun_watch_car.Execute
  else if AColumn = FDlg_Watch_Car.dev_DrawTrack then
    fun_ShowACarTrack.Execute
  else if AColumn = FDlg_Watch_Car.dev_Hide then
  begin
    fun_DevHide.Execute;
  end;
  node := FDlg_Watch_Car.cxDeviceList.FocusedNode;
  node.Focused := false;
  NextNode := node.GetNext;
  if nextNode <> nil then
  begin
    NextNode.Focused := true;
  end
  else
  begin
    NextNode := node.GetPrev;
    if NextNode <> nil then NextNode.Focused := true;
  end;
  node.Focused := true;
end;

procedure TMainf.fun_Devs_SetParamExecute(Sender: TObject);
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  if ParamAllFrm = nil then
    ParamAllFrm := TParamAllFrm.Create(self);
  paramAllFrm.ListView1.PopupMenu := PopupMenu_SelectDevs;
  FListView_SelectDevs := paramAllFrm.ListView1;
  AddDeviceByGroup;
  ParamAllFrm.Show;
end;

procedure TMainf.tool_RectSelectExecute(Sender: TObject);
var
  i: integer;
begin
  FMap.MouseAction := actRectSelect;
  for i := 0 to ActionList1.ActionCount - 1 do
  begin
    if (ActionList1.Actions[i].Category = '2地图工具') then
    begin
      if ActionList1.Actions[i].Name <> 'tool_bird_eye' then
      begin
        TAction(ActionList1.Actions[i]).Checked := false;
      end;
    end;
  end;
  TAction(Sender).Checked := true;
end;


procedure TMainf.ck_carExecute(Sender: TObject); //车辆信息查询
var
  dlg: TFormClxxQry;
begin
  if not CheckDevId then exit;
  dlg := TFormClxxQry.Create(self);
  try
    dlg.FdevId := GCurSelectDev.Id;
    dlg.ComboBox1.ItemIndex := 0;
    dlg.ComboBox2.Text := Edit1.Text;
    dlg.Show;
  except //finally
    dlg.Free;
  end;
end;

procedure TMainf.Dlgs_Create;
begin
  PageControl_Center.Height := Panel_center.Height * 2 div 3;
  //-----数据显示窗体
  FDlg_data_display := Tdata_display.Create(self);
  FDlg_Data_Display.Parent := FDlg_Map.Panel_data_display;
  FDlg_Data_Display.Top := 0;
  FDlg_Data_Display.Left := 0;

  //FDlg_Map := TMapShowFrm.Create(self);

  FDlg_Watch_Car := Twatch_car.Create(self);

{$IFDEF ForOutLook}
  FOutLook: TOutlook;
{$ENDIF}

  FDlg_Watch_Car.cxDeviceList.PopupMenu := PopupMenu_funDev;

  FDlg_Watch_Car.cxDeviceList.OnEditValueChanged := OncxDeviceListEdited;

  //FDlg_DRunData := TtaxiRunDataFrm.Create(self); //modify ls by add wangcl 2009-06-16  note(注释掉)
//  FDlg_EarlyWarning := TEarlyWarningFrm.Create(Self);

  FDlg_Sended_Cmd := TSended_Cmd.Create(self); //发送命令窗口
  FDlg_Sended_Cmd.cxTreeList1.PopupMenu := PopupMenu_cmd;

  //FDlg_Received_Info := TReceived_info.Create(self);
  //DataServer.OnSendMsg := FDlg_Received_Info.ReceivedMsg;  

  FDlg_Prompt_Info := TReceived_info.Create(self);
  FDlg_Prompt_Info.Log.LogFile := ExePath + '提示信息' + '\' + '提示信息';
  
//  FDlg_Sended_msg:= TSended_Message.Create(self);

  FDlg_ConfineAreaList := TConfineAreaListFrm.Create(self);
  //FDlg_ConfineAreaList.cxDeviceList.OnEditValueChanged := OncxDeviceListEdited;

  FDlg_AlarmCar := TFrmAlarmCar.Create(self);
  FDlg_AlarmCar.cxAlarmList.PopupMenu := PopupMenu_Alarm;

  FDlg_DevAlarmCar := TfrmAlarmFromDev.Create(Self);
  ADeviceManage.OnCarOverSpeedAlarmEvent := FDlg_DevAlarmCar.DoOnCarOverSpeedAlarm;
  ADeviceManage.OnCarInOutAreaAlarmEvent := FDlg_DevAlarmCar.DoOnCarInOutAreaAlarm;
  ADeviceManage.OnCarRunTimeAlarmEvent := FDlg_DevAlarmCar.DoOnCarRunTimeAlarm;
  ADeviceManage.OnGpsDataAlarmEvent := Fdlg_DevAlarmCar.DoOnGpsDataAlarmInfo;
  DataServer.OnRefreshAlarmDealStatus := FDlg_DevAlarmCar.RefreshAlarmDealStatus;

  //ListSelectDev.Images := ResManage.BmpList; //用户在地图上选中车辆列表
  //ListSelectDev.PopupMenu := PopupMenu_funDev;
  //ListSwitch.Images := ResManage.BmpList;

  //地物查询
  FDlg_SearchAddress := TFrmSearchAddressInMap.Create(self);

  FDlg_PictureFrm := TPictureFrm.Create(Self);
  FDlg_PictureFrm.CreateQueryPhoto;

  FDlg_AudioFrm := TAudioFrm.Create(Self);
  FDlg_VideoFrm := TfrmVideo.Create(Self);

  FDlg_EventListFrm := TEventListFrm.Create(Self);


  FDlg_QueryPictureListFrm := TQueryPictureListFrm.Create(Self);
  FDlg_QueryAudioList := TfrmQueryAudioList.Create(Self);
  FDlg_QueryVideoList := TfrmQueryVideoList.Create(Self);
  FDlg_RevGovInfo := TfrmRecvGovInfo.Create(Self);
  //FDlg_LightStateListFrm := TLightStateFrm.Create(Self);
//  FDlg_FindThingFrm := TFindThingFrm.Create(Self);

  FDlg_AnswerListFrm := TAnswerListFrm.Create(Self);


  FDlg_HisForm := TFormHisMain.Create(Self);
  FDlg_AreaToDev := TFrm_AreaToDev.Create(self);
  //DataServer.ONSendDelete := FDlg_AreaToDev.OnSendDelete;
  DataServer.OnRefreshAreaDevList := FDlg_AreaToDev.OnRefreshAreaDevList;

  FDlg_ERunDataList := TfrmERunData.Create(Self);
  DataServer.OnERunDataUpload := FDlg_ERunDataList.AddERunData;

  FDlg_DriverInfoUpload := TfrmDriverInfo.Create(Self);
  DataServer.OnDriverInfoUpload := FDlg_DriverInfoUpload.AddDriverInfo;

  FDlg_MediaEventUpload := TfrmMediaEventUpload.Create(Self);
  DataServer.OnMediaEventUpload := FDlg_MediaEventUpload.AddMediaEventUpload;

  FDlg_SrvRunInfo := TfrmSrvRunInfo.Create(Self);
  DataServer.OnRefreshSrvRunInfo := FDlg_SrvRunInfo.RefreshSrvRunInfo;

  FDlg_TSPDataUpload := TfrmTSPDataUpload.Create(Self);
  DataServer.OnTSPDataUpload := FDlg_TSPDataUpload.DoOnTSPDataUpload;

  FDlg_DevKeyEventLog := TfrmDevKeyEventLog.Create(Self);
  DataServer.OnDevKeyEvent := FDlg_DevKeyEventLog.DoOnTSPDataUpload;

  FDlg_RunRecDataUpload := TfrmRunRecDataUpload.Create(Self);
  DataServer.OnRunRecDataUpload := FDlg_RunRecDataUpload.OnRunRecDataUpload;

  FDlg_AlarmSupervise := TfrmAlarmSuperviseList.Create(Self);
  DataServer.OnAlarmSupervise := FDlg_AlarmSupervise.DoOnAlarmSupervise;  

  infoFrm := TinfoFrm.Create(Self);

  Dlgs_Show;
  PageControl_Center.ActivePageIndex := 0;

  edit1.Text := '';
  edit2.text := '';
  ComboboxCarNo.Text := '';
end;

procedure TMainf.DoOnRcvEventListupLoad(ADev: TObject; EventInfo: string; dateTime: TDateTime);
begin
  if FDlg_EventListFrm <> nil then
     FDlg_EventListFrm.OnEventListUpload(ADev, EventInfo, dateTime);
end;

procedure TMainf.DoOnRcvLightStateListupLoad(QueryType: Byte; ADev: TObject; Buf: PByte);
begin
  //if FDlg_LightStateListFrm <> nil then
  //   FDlg_LightStateListFrm.OnRcvLightStateListupLoad(QueryType, ADev, Buf);
end;

procedure TMainf.DoOnRecQueryPicture(Buff: PByte; Count: Word; ADev: TObject; Reason: string);
begin
  if FDlg_QueryPictureListFrm <> nil then
     FDlg_QueryPictureListFrm.OnQueryPicture(Buff, Count, ADev, Reason);
end;

procedure TMainf.DoOnServeJudge(pBuf: PByte; Dev: TDevice);
begin
//  if FDlg_ServeJudgeListFrm <> nil then
//     FDlg_ServeJudgeListFrm.DoOnServeJudge(pBuf, Dev);
end;

procedure TMainf.DoOnRcvAnswerListupLoad(ADev: TObject; Question: string; Answer: string; dateTime: TDateTime);
begin
  if FDlg_AnswerListFrm <> nil then
     FDlg_AnswerListFrm.OnAnswerListUpload(ADev, Question, Answer, dateTime);
end;

procedure TMainf.DoOnRcvPicupLoad(ADev: TObject; PicIndex: Integer; PicReson: Byte; pic: PicInfo);
var
  fileName: string;
begin
  if PicReson <> 4 then //
  begin
    if FDlg_PictureFrm <> nil then
      FDlg_PictureFrm.OnPicUpload(ADev, PicIndex, PicReson, pic);
  end
  else // 紧急报警、中心主动要求 处理:自动获取
  begin
//    FDlg_EarlyWarning.RefreshEarlyWarningList;
    {if FDlg_AlarmPictureFrm = nil then
      FDlg_AlarmPictureFrm := TPictureAlarmFrm.Create(self);
    if not FDlg_AlarmPictureFrm.Showing then
    begin
      FDlg_AlarmPictureFrm.Left := SplitterRight.Left - FDlg_AlarmPictureFrm.Width;
      FDlg_AlarmPictureFrm.Top := Self.Height - StatusBar1.Height - FDlg_AlarmPictureFrm.Height - 5;
      FDlg_AlarmPictureFrm.Show;
    end;
    Application.ProcessMessages;
    fileName := FDlg_AlarmPictureFrm.RcvAlarmPic(TDevice(ADev), PicIndex, PicReson);
    if (fileName <> '') and (FDlg_PictureFrm <> nil) then //照片添加到 所有照片列表
      FDlg_PictureFrm.AddPicList(fileName, FDlg_PictureFrm.cxPicList.AddFirst); }
  end;
end;

procedure TMainf.DoOnRcvAudioUpload(ADev: TObject; AudioIndex: Integer);
begin
//  if FDlg_AudioFrm <> nil then
//      FDlg_AudioFrm.OnAudioUpload(ADev, AudioIndex);
end;

procedure TMainf.Dlgs_Free;
begin
  //-----数据显示窗体
  FDlg_data_display.Free;
  FDlg_Watch_Car.Free;
  FDlg_Sended_Cmd.Free; //发送命令窗口
 // FDlg_OrderList.Free; //发送订单列表窗口
  //FDlg_Received_Info.Free;
  FDlg_ConfineAreaList.Free;
  FDlg_AlarmCar.Free;
  FDlg_DevAlarmCar.Free;
  FDlg_SearchAddress.Free; //地物查询
  FDlg_Prompt_Info.Free;
  FDlg_PictureFrm.Free;
  FDlg_AudioFrm.Free;
  FDlg_VideoFrm.Free;
  FDlg_EventListFrm.Free;
  FDlg_QueryPictureListFrm.Free;
  FDlg_QueryAudioList.Free;
  FDlg_QueryVideoList.Free;
  FDlg_RevGovInfo.Free;
//  FDlg_ServeJudgeListFrm.Free;
//  FDlg_LightStateListFrm.Free;
//  FDlg_FindThingFrm.Free;
  FDlg_AnswerListFrm.Free;
  FDlg_HisForm.Free;
  FDlg_AreaToDev.Free;
//  if FDlg_DRunData <> nil then FDlg_DRunData.Free;
//  if FDlg_EarlyWarning <> nil then FDlg_EarlyWarning.Free;
//  if FDlg_ServerJudge <> nil then FDlg_ServerJudge.Free;
  if FDLG_DevAlarmInfo <> nil then FDLG_DevAlarmInfo.Free;
  if FDlg_DevModifyFrm <> nil then FDlg_DevModifyFrm.Free; 
//  if FDlg_DriverBlackList <> nil then FDlg_DriverBlackList.Free;
//  if FDlg_PassengerBlackList <> nil then FDlg_PassengerBlackList.Free;
//  if FDlg_CancelOrder <> nil then FDlg_CancelOrder.Free;
  //--------各类查询统计窗体
  if FDlg_TjGrpDev             <> nil then FreeAndNil(FDlg_TjGrpDev);  //车辆安装情况统计
//  if FDlg_TjICCardTradeData    <> nil then FreeAndNil(FDlg_TjICCardTradeData);
  if FDlg_CkClxx               <> nil then FreeAndNil(FDlg_CkClxx); //查看车辆信息
  if FDlg_CkDriverInfo         <> nil then FreeAndNil(FDlg_CkDriverInfo); //查看司机信息

  if FDlg_CkDevPic             <> nil then FreeAndNil(FDlg_CkDevPic); // 查询照片
  if FDlg_QueryPhotoPos        <> nil then FreeAndNil(FDlg_QueryPhotoPos);//查询照片及位置
  if FDlg_QueryDevUploadMileage <> nil then FreeAndNil(FDlg_QueryDevUploadMileage);//查询车辆上传行驶里程
  if FDlg_QuerySetCarRunStatePlan <> nil then FreeAndNil(FDlg_QuerySetCarRunStatePlan);//查询设置车辆重载运行计划
  if FDlg_QueryDevAlarmInfo    <> nil then FreeAndNil(FDlg_QueryDevAlarmInfo);//查询报警信息
  if FDlg_QueryNotice          <> nil then FreeAndNil(FDlg_QueryNotice);//查询平台通知消息
  if FDlg_QueryDevGroupOnline  <> nil then FreeAndNil(FDlg_QueryDevGroupOnline);//车组在线率
  if FDlg_QueryDevMileage      <> nil then FreeAndNil(FDlg_QueryDevMileage);//查询车辆行驶里程
//  if FDlg_CkDevOrder           <> nil then FreeAndNil(FDlg_CkDevOrder); //订单查询
  if FDlg_ckMessageList        <> nil then FreeAndNil(FDlg_ckMessageList);
  if FDlg_ckCmdList            <> nil then FreeAndNil(FDlg_ckCmdList);
  if FDlg_ckQuestionList       <> nil then FreeAndNil(FDlg_ckQuestionList);
//  if FDlg_tjServeJudge         <> nil then FreeAndNil(FDlg_tjServeJudge);
  if FDlg_QueryUpdateRecord    <> nil then FreeAndNil(FDlg_QueryUpdateRecord);
//  if FDlg_CkEmptyRate          <> nil then FreeAndNil(FDlg_CkEmptyRate); //查询空车率
  if FDlg_SeeEmergncyAlarmDetail <> nil then FreeAndNil(FDlg_SeeEmergncyAlarmDetail);  //查看紧急报警时 详细情况

  if FDlg_OnLineFrm            <> nil then FreeAndNil(FDlg_OnLineFrm);
  if FDlg_ERunDataList <> nil then FreeAndNil(FDlg_ERunDataList);
  if FDlg_DriverInfoUpload <> nil then FreeAndNil(FDlg_DriverInfoUpload);
  if FDlg_MediaEventUpload <> nil then FreeAndNil(FDlg_MediaEventUpload);
  if FDlg_SrvRunInfo <> nil then FreeAndNil(FDlg_SrvRunInfo);
  if FDlg_TSPDataUpload <> nil then FreeAndNil(FDlg_TSPDataUpload);
  if FDlg_DevKeyEventLog <> nil then FreeAndNil(FDlg_DevKeyEventLog);
  if FDlg_RunRecDataUpload <> nil then  FreeAndNil(FDlg_RunRecDataUpload);
  if FDlg_AlarmSupervise <> nil then  FreeAndNil(FDlg_AlarmSupervise);
  if FDlg_QueryDevRunStateOnTheTime <>nil then FreeAndNil(FDlg_QueryDevRunStateOnTheTime);
  if FDlg_ShowList_HisAddr <> nil then FreeAndNil(FDlg_ShowList_HisAddr);
end;

procedure TMainf.Dlgs_Show;
begin
  if (show_Map.Visible) then             // liusen
  begin
    if (not FDlg_BSMap.Showing) then
    begin
      FDlg_BSMap.ManualDock(PageControl_Center, nil, alleft);
      FDlg_BSMap.Show;
      show_Map.Checked := True;
    end;
  end;

  if show_ListCar.Visible then
  begin
    if not FDlg_Watch_Car.Showing then
    begin
      FDlg_Watch_Car.ManualDock(PageControlBottom, nil, alLeft);
      FDlg_Watch_Car.Show;
      show_ListCar.Checked := True;
    end;
  end;

  {if show_Received_Info.Visible then
  begin
    FDlg_Received_Info.ManualDock(PageControlBottom, nil, alleft);
    FDlg_Received_Info.Show;
    show_Received_Info.Checked := True;
  end;    }


  if show_ConfineAreaList.Visible then
  begin
    if not FDlg_ConfineAreaList.Showing then
    begin
      FDlg_ConfineAreaList.ManualDock(PageControlBottom, nil, alleft);
      FDlg_ConfineAreaList.Show;
      show_ConfineAreaList.Checked := True;
    end;
  end;

  if show_AlarmLists.Visible then
  begin
    if not FDlg_AlarmCar.Showing then
    begin
      FDlg_AlarmCar.ManualDock(PageControlBottom, nil, alleft);
      FDlg_AlarmCar.Show;
      show_AlarmLists.Checked := True;
    end;
  end;

  if show_areaToDev.Visible then
  begin
    if not FDlg_AreaToDev.Showing then
    begin
      FDlg_AreaToDev.ManualDock(PageControlBottom, nil, alLeft);
      FDlg_AreaToDev.Show;
      show_areaToDev.Checked := True;
    end;  
  end;

  if show_DevAlarm.Visible then
  begin
    if not FDlg_DevAlarmCar.Showing then
    begin
      FDlg_DevAlarmCar.ManualDock(PageControlBottom, nil, alLeft);
      FDlg_DevAlarmCar.Show;
      show_DevAlarm.Checked := True;
    end;  
  end;

  if show_EarlyWarningCar.Visible then
  begin
//    if not FDlg_EarlyWarning.Showing then
//    begin
//      FDlg_EarlyWarning.ManualDock(PageControlBottom, nil, alLeft);
//      FDlg_EarlyWarning.Show;
//      show_EarlyWarningCar.Checked := True;
//    end;
  end;

  if show_SearchAddress.Visible then
  begin
    if not FDlg_SearchAddress.Showing then
    begin
      //FDlg_SearchAddress.Left := Screen.Width;
      //FDlg_SearchAddress.Top := Screen.Height;
      FDlg_SearchAddress.ManualDock(PageControlBottom, nil, alleft);
      FDlg_SearchAddress.Show;
      show_SearchAddress.Checked := true;
    end;
  end;

  if show_GPSHostory.Visible then
  begin
    if not FDlg_HisForm.Showing then
    begin
      FDlg_HisForm.ManualDock(PageControlBottom, nil, alleft);

      FDlg_HisForm.Show;
      show_GPSHostory.Checked := True;
    end;
  end;

  if show_Picture.Visible then
  begin
    if not FDlg_PictureFrm.Showing then
    begin
      FDlg_PictureFrm.ManualDock(PageControl_Center, nil, alleft);
      FDlg_PictureFrm.Show;
      show_Picture.Checked := True;
    end;
  end;

  if show_Audio.Visible then
  begin
    if not FDlg_AudioFrm.Showing then
    begin
      FDlg_AudioFrm.ManualDock(PageControl_Center, nil, alleft);
      FDlg_AudioFrm.Show;
      show_Audio.Checked := True;
    end;
  end;

  if show_video.Visible then
  begin
    if not FDlg_VideoFrm.Showing then
    begin
      FDlg_VideoFrm.ManualDock(PageControl_Center, nil, alleft);
      FDlg_VideoFrm.Show;
      show_video.Checked := True;
    end;
  end;

  if Show_QueryPictureList.Visible then
  begin
    if not FDlg_QueryPictureListFrm.Showing then
    begin
      FDlg_QueryPictureListFrm.ManualDock(PageControlBottom, nil, alleft);
      FDlg_QueryPictureListFrm.Show;
      Show_QueryPictureList.Checked := True;
    end;
  end;

  if show_QueryAudioList.Visible then
  begin
    if not FDlg_QueryAudioList.Showing then
    begin
      FDlg_QueryAudioList.ManualDock(PageControlBottom, nil, alLeft);
      FDlg_QueryAudioList.Show;
      show_QueryAudioList.Checked := True;
    end;  
  end;

  if show_QueryVideoList.Visible then
  begin
    if not FDlg_QueryVideoList.Showing then
    begin
      FDlg_QueryVideoList.ManualDock(PageControlBottom, nil, alLeft);
      FDlg_QueryVideoList.Show;
      show_QueryVideoList.Checked := True;
    end;  
  end;

  if show_AlarmSupervise.Visible then
  begin
    if not FDlg_AlarmSupervise.Showing then
    begin
      FDlg_AlarmSupervise.ManualDock(PageControl_Center, nil, alLeft);
      FDlg_AlarmSupervise.Show;
      show_AlarmSupervise.Checked := True;
    end;  
  end;

  if show_RecvGovInfo.Visible then
  begin
    if not FDlg_RevGovInfo.Showing then
    begin
      FDlg_RevGovInfo.ManualDock(PageControl_Center, nil, alLeft);
      FDlg_RevGovInfo.Show;
      show_RecvGovInfo.Checked := True;
    end;  
  end;  

//  if Show_ServeJudgeList.Visible then
//  begin
//    if not FDlg_ServeJudgeListFrm.Showing then
//    begin
//      FDlg_ServeJudgeListFrm.ManualDock(PageControlBottom, nil, alleft);
//      FDlg_ServeJudgeListFrm.Show;
//      Show_ServeJudgeList.Checked := True;
//    end;
//  end;

//  if show_LightStateList.Visible then
//  begin
//    if not FDlg_LightStateListFrm.Showing then
//    begin
//      FDlg_LightStateListFrm.ManualDock(PageControlBottom, nil, alleft);
//      FDlg_LightStateListFrm.Show;
//      show_LightStateList.Checked := True;
//    end;
//  end;

//  if show_FindThing.Visible then
//  begin
//    if not FDlg_FindThingFrm.Showing then
//    begin
//      FDlg_FindThingFrm.ManualDock(PageControlBottom, nil, alleft);
//      FDlg_FindThingFrm.Show;
//      show_FindThing.Checked := True;
//    end;
//  end;

  if Show_AnswerList.Visible then
  begin
    if not FDlg_AnswerListFrm.Showing then
    begin
      FDlg_AnswerListFrm.ManualDock(PageControlBottom, nil, alleft);
      FDlg_AnswerListFrm.Show;
      Show_AnswerList.Checked := True;
    end;
  end;

  if Show_EventList.Visible then
  begin
    if not FDlg_EventListFrm.Showing then
    begin
      FDlg_EventListFrm.ManualDock(PageControlBottom, nil, alleft);
      FDlg_EventListFrm.Show;
      Show_EventList.Checked := True;
    end;
  end;

//  if show_Sended_Message.Visible then
//  begin
//    if not FDlg_OrderList.Showing then
//    begin
//      FDlg_OrderList.ManualDock(PageControlBottom, nil, alLeft);
//      FDlg_OrderList.Show;
//      show_Sended_Message.Checked := True;
//    end;
//  end;

//{$IFDEF For_TaxiCar}
  //FDlg_DRunData.ManualDock(PageControl_Center, nil, alLeft);
  //FDlg_DRunData.Show;
  //show_TaxiMetaRunData.Checked := true;
//{$ENDIF}


//  if current_user.SBWH then
//  begin
    //if not show_Map.Checked then Show_Map.Execute;
//    if (Show_Prompt_Info.Visible) and (not FDlg_Prompt_Info.Showing) then
//    begin
//      FDlg_Prompt_Info.ManualDock(PageControl_Center, nil, alleft);
//      FDlg_Prompt_Info.Show;
//      Show_Prompt_Info.Checked := True;
//    end;

    //if not show_Map.Checked then Show_Map.Execute;
//  end
//  else
//  begin
////    if (Show_Prompt_Info.Visible) and (not FDlg_Prompt_Info.Showing) then
////    begin
////      FDlg_Prompt_Info.ManualDock(PageControlBottom, nil, alleft);
////      FDlg_Prompt_Info.Show;
////      Show_Prompt_Info.Checked := True;
////    end;
//    if not show_Map.Checked then Show_Map.Execute;
//  end;

  if show_sended_command.Visible then
  begin
    if not FDlg_Sended_Cmd.Showing then
    begin
      FDlg_Sended_Cmd.ManualDock(PageControlBottom, nil, alLeft);
      FDlg_Sended_Cmd.Show;
      show_sended_command.Checked := True;
    end;
  end;

//  if not FDlg_ERunDataList.Showing then
//  begin
//    FDlg_ERunDataList.ManualDock(PageControlBottom, nil, alLeft);
//    FDlg_ERunDataList.Show;
//  end;
//
//  if not FDlg_DriverInfoUpload.Showing then
//  begin
//    FDlg_DriverInfoUpload.ManualDock(PageControlBottom, nil, alLeft);
//    FDlg_DriverInfoUpload.Show;
//  end;  

  if not show_car.Checked then show_car.Execute;
  if not show_toolbar.Checked then show_toolbar.Execute;
  if not show_statusBar.Checked then show_statusBar.Execute;
  if not show_MapToolbar.Checked then show_MapToolbar.Execute;

//  if PageControl_Center.PageCount > 0 then
//  begin
//    PageControl_Center.ActivePageIndex := 0;
//    PageControl_Center.ActivePage.Highlighted := True;
//  end;

  if PageControlBottom.PageCount > 0 then
  begin
    PageControlBottom.ActivePageIndex := 0;
    //PageControlBottom.ActivePage.Highlighted := True;
  end;

end;

procedure TMainf.Dlgs_Hide;
begin
//  if (FDlg_DriverBlackList <> nil) and (not sys_manage_driverBlacklist.Visible) then FDlg_DriverBlackList.Close;
//  if (FDlg_PassengerBlackList <> nil) and (not sys_manage_passengerblacklist.Visible) then FDlg_PassengerBlackList.Close;
//  if (FDlg_CancelOrder <> nil) and (not fun_CancelOrder.Visible) then FDlg_CancelOrder.Close;
  if (FDlg_CkClxx <> nil) and (not ck_DevInfo.Visible) then FDlg_CkClxx.Close;
  if (FDlg_CkDriverInfo <> nil) and (not ck_DriverInfo.Visible) then FDlg_CkDriverInfo.Close;
//  if (FDlg_ServerJudge <> nil) and (not ck_ServeJudge.Visible) then FDlg_ServerJudge.Close;
//  if (FDlg_QueryIcCardTradeData <> nil) and (not N149.Visible) then FDlg_QueryIcCardTradeData.Close;
//  if (FDlg_QueryDBRunData <> nil) and (not N150.Visible) then FDlg_QueryDBRunData.Close;
//  if (FDlg_Query_SoundRecord <> nil) and (not N175.Visible) then FDlg_Query_SoundRecord.Close;
  if (FDlg_CkDevPic <> nil) and (not ck_Picture.Visible) then FDlg_CkDevPic.Close;
  if (FDlg_QueryPhotoPos <> nil) and (not ck_queryPhotoPos.Visible) then FDlg_QueryPhotoPos.Close;
  if (FDlg_QueryDevUploadMileage <> nil) and (not ck_queryDevMileage.Visible) then  FDlg_QueryDevUploadMileage.Close;
  if (FDlg_QuerySetCarRunStatePlan <> nil) and (not ck_querySetCarRunStatePlan.Visible) then FDlg_QuerySetCarRunStatePlan.Close;
  if (FDlg_QueryDevAlarmInfo <> nil) and (not ck_devalarm.Visible) then FDlg_QueryDevAlarmInfo.Close;
  if (FDlg_QueryNotice <> nil) and (not ck_notice.Visible) then FDlg_QueryNotice.Close;
  if (FDlg_QueryDevGroupOnline <> nil) and (not ck_devgrouponline.Visible) then FDlg_QueryDevGroupOnline.Close;
  if (FDlg_QueryDevMileage <> nil) and (not ck_devmileage.Visible) then FDlg_QueryDevMileage.Close;
//  if (FDlg_CkDevOrder <> nil) and (not ck_SendOrderList.Visible) then FDlg_CkDevOrder.Close;
  if (FDlg_ckMessageList <> nil) and (not ck_MessageList.Visible) then FDlg_ckMessageList.Close;
  if (FDlg_ckCmdList <> nil) and (not ck_QueryCmdList.Visible) then FDlg_ckCmdList.Close;
  if (FDlg_ckQuestionList <> nil) and (not FDlg_ckQuestionList.Visible) then FDlg_ckQuestionList.Close;
//  if (FDlg_QueryDriverIntegral <> nil) and (not ck_DriverIntegral.Visible) then FDlg_QueryDriverIntegral.Close;
  if (FDlg_TjGrpDev <> nil) and (not ck_TjGrpDevs.Visible) then FDlg_TjGrpDev.Close;
//  if (FDlg_TjTaxiRunDataByMonth <> nil) and (not ck_taximetaRundataTj.Visible) then FDlg_TjTaxiRunDataByMonth.Close;
//  if (FDlg_tjServeJudge <> nil) and (not tj_ServeJudge.Visible) then FDlg_tjServeJudge.Close;
  if (FDlg_QueryUpdateRecord <> nil) and (not ck_UpdateRecord.Visible) then FDlg_QueryUpdateRecord.Close;
//  if (FDlg_TjICCardTradeData <> nil) and (not N260.Visible) then FDlg_TjICCardTradeData.Close;
//  if (FDlg_CkEmptyRate <> nil) and (not ck_empty.Visible) then FDlg_CkEmptyRate.Close;
  if (FDlg_QueryDevRunStateOnTheTime<> nil)and (not Ck_QueryDevRunStateOnTheTime.Visible) then FDlg_QueryDevRunStateOnTheTime.Close;

  if (show_Map.Checked) and (not show_Map.Visible) then        // liusen
  begin
    FDlg_BSMap.ManualDock(nil);
    FDlg_BSMap.Hide;
    show_Map.Checked := False;
  end;

  if (show_ListCar.Checked) and (not show_ListCar.Visible) then
  begin
    FDlg_Watch_Car.ManualDock(nil);
    FDlg_Watch_Car.Hide;
    show_ListCar.Checked := False;
  end;
  if (show_AlarmLists.Checked) and (not show_AlarmLists.Visible) then
  begin
    FDlg_AlarmCar.ManualDock(nil);
    FDlg_AlarmCar.Hide;
    show_AlarmLists.Checked := False;
  end;

  if (show_DevAlarm.Checked) and (not show_DevAlarm.Visible) then
  begin
    FDlg_DevAlarmCar.ManualDock(nil);
    FDlg_DevAlarmCar.Hide;
    show_DevAlarm.Checked := False;
  end;  
  
//  if (show_EarlyWarningCar.Checked) and (not show_EarlyWarningCar.Visible) then
//  begin
//    FDlg_EarlyWarning.ManualDock(nil);
//    FDlg_EarlyWarning.Hide;
//    show_EarlyWarningCar.Checked := False;
//  end;
  if (show_sended_command.Checked) and (not show_sended_command.Visible) then
  begin
    FDlg_Sended_Cmd.ManualDock(nil);
    FDlg_Sended_Cmd.Hide;
    show_sended_command.Checked := False;
  end;
  if (Show_Prompt_Info.Checked) and (not Show_Prompt_Info.Visible) then
  begin
    FDlg_Prompt_Info.ManualDock(nil);
    FDlg_Prompt_Info.Hide;
    Show_Prompt_Info.Checked := False;
  end;
  if (show_Picture.Checked) and (not show_Picture.Visible) then
  begin
    FDlg_PictureFrm.ManualDock(nil);
    FDlg_PictureFrm.Hide;
    show_Picture.Checked := False;
  end;
  if (show_Audio.Checked) and (not show_Audio.Visible) then
  begin
    FDlg_AudioFrm.ManualDock(nil);
    FDlg_AudioFrm.Hide;
    show_Audio.Checked := False;
  end;
  if (show_video.Checked) and (not show_video.Visible) then
  begin
    FDlg_VideoFrm.ManualDock(nil);
    FDlg_VideoFrm.Hide;
    show_video.Checked := False;
  end;
  if (show_ConfineAreaList.Checked) and (not show_ConfineAreaList.Visible) then
  begin
    FDlg_ConfineAreaList.ManualDock(nil);
    FDlg_ConfineAreaList.Hide;
    show_ConfineAreaList.Checked := False;
  end;
  if (show_SearchAddress.Checked) and (not show_SearchAddress.Visible) then
  begin
    FDlg_SearchAddress.ManualDock(nil);
    FDlg_SearchAddress.Hide;
    show_SearchAddress.Checked := False;
  end;
  if (show_GPSHostory.Checked) and (not show_GPSHostory.Visible) then
  begin
    FDlg_HisForm.ManualDock(nil);
    FDlg_HisForm.Hide;
    show_GPSHostory.Checked := False;
  end;
  if (Show_QueryPictureList.Checked) and (not Show_QueryPictureList.Visible) then
  begin
    FDlg_QueryPictureListFrm.ManualDock(nil);
    FDlg_QueryPictureListFrm.Hide;
    Show_QueryPictureList.Checked := False;
  end;
  if (show_QueryAudioList.Checked) and (not show_QueryAudioList.Visible) then
  begin
    FDlg_QueryAudioList.ManualDock(nil);
    FDlg_QueryAudioList.Hide;
    show_QueryAudioList.Checked := False;
  end;
  if (show_QueryVideoList.Checked) and (not show_QueryVideoList.Visible) then
  begin
    FDlg_QueryVideoList.ManualDock(nil);
    FDlg_QueryVideoList.Hide;
    show_QueryVideoList.Checked := False;
  end;
  if (show_AlarmSupervise.Checked) and (not show_AlarmSupervise.Visible) then
  begin
    FDlg_AlarmSupervise.ManualDock(nil);
    FDlg_AlarmSupervise.Hide;
    show_AlarmSupervise.Checked := False;
  end;

  if (show_RecvGovInfo.Checked) and (not show_RecvGovInfo.Visible) then
  begin
    FDlg_RevGovInfo.ManualDock(nil);
    FDlg_RevGovInfo.Hide;
    show_RecvGovInfo.Checked := false;
  end;  

//  if (Show_ServeJudgeList.Checked) and (not Show_ServeJudgeList.Visible) then
//  begin
//    FDlg_ServeJudgeListFrm.ManualDock(nil);
//    FDlg_ServeJudgeListFrm.Hide;
//    Show_ServeJudgeList.Checked := False;
//  end;
//  if (show_Sended_Message.Checked) and (not show_Sended_Message.Visible) then
//  begin
//    FDlg_OrderList.ManualDock(nil);
//    FDlg_OrderList.Hide;
//    show_Sended_Message.Checked := False;
//  end;
  if (Show_EventList.Checked) and (not Show_EventList.Visible) then
  begin
    FDlg_EventListFrm.ManualDock(nil);
    FDlg_EventListFrm.Hide;
    Show_EventList.Checked := False;
  end;
  if (Show_AnswerList.Checked) and (not Show_AnswerList.Visible) then
  begin
    FDlg_AnswerListFrm.ManualDock(nil);
    FDlg_AnswerListFrm.Hide;
    Show_AnswerList.Checked := False;
  end;
//  if (show_LightStateList.Checked) and (not show_LightStateList.Visible) then
//  begin
//    FDlg_LightStateListFrm.ManualDock(nil);
//    FDlg_LightStateListFrm.Hide;
//    show_LightStateList.Checked := False;
//  end;
//  if (show_FindThing.Checked) and (not show_FindThing.Visible) then
//  begin
//    FDlg_FindThingFrm.ManualDock(nil);
//    FDlg_FindThingFrm.Hide;
//    show_FindThing.Checked := False;
//  end;

  //if show_Received_Info.Checked then show_Received_Info.Execute;
  //if show_Sended_Message.Checked then show_Sended_Message.Execute;
  //if show_ConfineAreaList.Checked then show_ConfineAreaList.Execute;
  //if show_AlarmLists.Checked then show_AlarmLists.Execute;
  //if show_SearchAddress.Checked then show_SearchAddress.Execute;
end;

procedure TMainf.ActionCheck;
  procedure SetActionCheck(action: TAction; dlg: TForm);
  begin
    if (not action.Checked) and (dlg.Visible) then
      action.Checked := True;
  end;
begin
  SetActionCheck(show_Map,FDlg_Map);
  SetActionCheck(show_ListCar,FDlg_Watch_Car);
  SetActionCheck(show_AlarmLists,FDlg_AlarmCar);
  SetActionCheck(show_DevAlarm, FDlg_DevAlarmCar);
//  SetActionCheck(show_EarlyWarningCar,FDlg_EarlyWarning);
  SetActionCheck(show_sended_command,FDlg_Sended_Cmd);
  SetActionCheck(Show_Prompt_Info,FDlg_Prompt_Info);
  SetActionCheck(show_Picture,FDlg_PictureFrm);
  SetActionCheck(show_Audio,FDlg_AudioFrm);
  SetActionCheck(show_video, FDlg_VideoFrm);
  SetActionCheck(show_ConfineAreaList,FDlg_ConfineAreaList);
  SetActionCheck(show_SearchAddress,FDlg_SearchAddress);
  SetActionCheck(show_GPSHostory,FDlg_HisForm);
  SetActionCheck(Show_QueryPictureList,FDlg_QueryPictureListFrm);
  SetActionCheck(show_QueryAudioList, FDlg_QueryAudioList);
  SetActionCheck(show_QueryVideoList, FDlg_QueryVideoList);
  SetActionCheck(show_RecvGovInfo, FDlg_RevGovInfo);
//  SetActionCheck(Show_ServeJudgeList,FDlg_ServeJudgeListFrm);
//  SetActionCheck(show_Sended_Message,FDlg_OrderList);
  SetActionCheck(Show_EventList,FDlg_EventListFrm);
  SetActionCheck(Show_AnswerList,FDlg_AnswerListFrm);
//  SetActionCheck(show_LightStateList,FDlg_LightStateListFrm);
//  SetActionCheck(show_FindThing,FDlg_FindThingFrm);

end;

procedure TMainf.PageControlBottomDockDrop(Sender: TObject;
  Source: TDragDockObject; X, Y: Integer); {停泊窗体事件}
var
  i: Integer;
begin
  Inc(FBottomFormCount);

//  for i := 0 to PageControlBottom.PageCount-1 do
//  begin
//    PageControlBottom.Pages[i].Highlighted := False;
//  end;
//  if PageControlBottom.ActivePage <> nil then
//    PageControlBottom.ActivePage.Highlighted := True;
end;

procedure TMainf.PageControlBottomUnDock(Sender: TObject; Client: TControl;
  NewTarget: TWinControl; var Allow: Boolean); {从底层窗口拖出窗体事件}
var
  i: Integer;
begin
  Dec(FBottomFormCount);
  if FBottomFormCount <= 0 then
  begin
    SplitterBottom.CloseSplitter;
  end;
  
//  for i := 0 to PageControlBottom.PageCount-1 do
//  begin
//    PageControlBottom.Pages[i].Highlighted := False;
//  end;
//  if PageControlBottom.ActivePage <> nil then
//    PageControlBottom.ActivePage.Highlighted := True;
end;

procedure TMainf.Panel_ClxxResize(Sender: TObject);
begin
  ///Panel_clxx_else.Height := (sender as TPanel).Height *2 div 3-3;
//  {$ifdef For_MistySearchCarNo}
//  EditSearchCarNo.Width := Edit1.Width;
//  EditSearchCarNo.Left := Edit1.Left;
//  EditSearchCarNo.Top := Edit1.top;
//  {$endif}
end;

procedure TMainf.fun_Devs_CallDevExecute(Sender: TObject);
var
  dlg: Tcall_dev;
  i, n: integer;
  dev: TDevice;
//  grp: TDevGroup;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  //If not HasPrivilege(PRI_CALL) then exit;
  dlg := Tcall_dev.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;

    if ListSelectDev.Count > 0 then
    begin
      AddDeviceFromListSelectDev;
    end
    else
    begin
      AddDeviceByGroup;
    end;
    dlg.ShowModal;
    if dlg.ModalResult = mrok then //处理　呼叫车辆
    begin
      n := dlg.ListView1.Items.Count;
      if n = 0 then
      begin
        messagebox(handle, pchar('命令不能执行，没有指定车辆'), '提示', mb_ok + mb_iconinformation);
        exit;
      end;

      for i := 0 to dlg.ListView1.Items.Count - 1 do
      begin
        dev := TDevice(dlg.ListView1.Items.Item[i].Data);
        if dev <> nil then
        begin
          DataServer.FindPostion_V3(dev);
        end;
        //sleep(50);
        Application.ProcessMessages;
      end;
    end;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then exit;
  FDevKeyIn := true;
  if edit2.text <> '' then
  begin
    edit2.Text := '';
    ListDevice.Cells[1, 1] := '';
    ListDevice.Cells[1, 2] := '';
    ListDevice.Cells[1, 3] := '';
    ListDevice.Cells[1, 4] := '';
    ListDevice.Cells[1, 5] := '';
    ListDevice.Cells[1, 6] := '';
    ListDevice.Cells[1, 7] := '';
    ListDevice.Cells[1, 8] := '';
    ListDevice.Cells[1, 9] := '';
    ListDevice.Cells[1, 10] := '';
    ListDevice.Cells[1, 11] := '';
    ListDevice.Cells[1, 12] := '';
//    ListDevice.Cells[1, 12] := '';
//    ListDevice.Cells[1, 13] := '';
//    ListDevice.Cells[1, 14] := '';
  end;
end;



procedure TMainf.FMapMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  str: string;
  {p:TPoint;
  pp:TEarthPoint; }
begin
  if Sender is TGpsMap then
  begin
    with TGpsMap(Sender) do
    begin
      XYToLoLa(X, Y, lo, la);
      //显示经纬度
      str := ' ' + FormatFloat('0.000000', lo) + Projection.PrjUnitsName;
      str := str + '  ' + FormatFloat('0.000000', la) + Projection.PrjUnitsName;
      StatusBar1.Panels.Items[1].Text := str;
      {pp.x:=lo;
      pp.y:=la;
      p:=Projection.LoLa2XY(pp);
      str:=' '+FormatFloat('0',p.X)+Projection.PrjUnitsName;
      str:=str+'  '+FormatFloat('0',p.Y)+Projection.PrjUnitsName;
      StatusBar1.Panels.Items[2].Text:=str;  }
    end;
  end;
  OnMapLabelMouseMove(shift, x, y);
end;

function TMainf.UserReged: boolean;
{$IFDEF ForTestUser}
var

  dlgReg: TFrmUserReg;
  reg: TRegistry;
  ideNum, zcxx: string;
  zcbj: boolean;
{$ENDIF}
begin
{$IFDEF ForTestUser}
  result := false;
  zcbj := false;
  reg := TRegistry.Create;
  try
    //取注册表中值

    reg.RootKey := HKEY_LOCAL_MACHINE;
    if reg.KeyExists('\software\njty\monitor') then
    begin
      reg.OpenKey('\software\njty\monitor', true);
      zcxx := reg.ReadString('zch');
      ideNum := GetZch(Trim(GetEncryNum));
      if zcxx = ideNum then
      begin
//        zcbj := true;
        result := true;
        exit;
      end;
    end;
    if not zcbj then
    begin
      //如果还没注册，则弹出注册窗体
      dlgReg := TFrmUserReg.Create(self);
      try
        dlgreg.EditBack.Text := Trim(GetEncryNum);
        dlgReg.ShowModal;
        if dlgReg.ModalResult = mrOk then
        begin
          //写入注册表
          if reg.CreateKey('\software\njty\monitor') then
          begin
            reg.OpenKey('\software\njty\monitor', true);
            reg.WriteString('zch', trim(dlgReg.EditZc.Text));
          end;
          result := true;
        end;
      finally
        dlgReg.Free;
      end;
    end;
  finally
    reg.CloseKey;
    reg.Free;
  end;
{$ENDIF}
end;


{procedure TMainf.ShowEkeyMsg(str: string);
begin
  //messagebox(0,pchar(str),EKey_NAME+'提示信息',mb_ok + mb_iconinformation);
end;  }



procedure TMainf.tool_SetConfineAlarmAreaExecute(Sender: TObject);
var
  i: integer;
begin
  FMap.MouseAction := actSetConfineAlarmArea;//actSetConfineAlarmCircle;//
  for i := 0 to ActionList1.ActionCount - 1 do
  begin
    if (ActionList1.Actions[i].Category = '2地图工具') then
    begin
      if ActionList1.Actions[i].Name <> 'tool_bird_eye' then
      begin
        TAction(ActionList1.Actions[i]).Checked := false;
      end;
    end;
  end;
  TAction(Sender).Checked := true;
end;

procedure TMainf.FMapSetConfineAlarmArea(Sender: TObject; WPointsAry: TWorldPointAry; PointsCnt: Integer);
        //把两个点转成四个点,即把两点转一个四点的巨型
  procedure GetPoint(A: TPoint; B: TPoint; var OutA1: TPoint; var OutA2: TPoint;
    var OutB1: TPoint; var OutB2: TPoint; Distance: longint);
  var
    k1, k2: double;
    temp: Extended;
  begin
          //斜率等于0度时
    if ((b.Y - a.Y) = 0) then
    begin
      OutA1.X := A.X;
      OutA2.X := A.X;

      OutA1.Y := A.Y + Distance;
      OutA2.Y := A.Y - Distance;

      OutB1.X := B.X;
      OutB2.X := B.X;
      OutB1.Y := B.Y + Distance;
      OutB2.Y := B.Y - Distance;
    end
          //斜率等于90度时
    else if ((b.X - a.X) = 0) then
    begin
      OutA1.X := A.X + Distance;
      OutA2.X := A.X - Distance;

      OutA1.Y := A.Y;
      OutA2.Y := A.Y;

      OutB1.X := B.X + Distance;
      OutB2.X := B.X - Distance;
      OutB1.Y := B.Y;
      OutB2.Y := B.Y;
    end
    else
    begin
      k1 := (b.Y - a.Y) / (b.X - a.X); //直线的斜率
      k2 := -1 / k1; //垂直直线的斜率
      temp := Sqrt((Distance * Distance) / (1 + k2 * k2));
      OutA1.X := round(temp + A.X);
      OutA2.X := round(-temp + A.X);

      OutA1.Y := round(k2 * (OutA1.X - A.X) + A.Y);
      OutA2.Y := round(k2 * (OutA2.X - A.X) + A.Y);

      OutB1.X := round(temp + B.X);
      OutB2.X := round(-temp + B.X);
      OutB1.Y := round(k2 * (OutB1.X - B.X) + B.Y);
      OutB2.Y := round(k2 * (OutB2.X - B.X) + B.Y);
    end;
  end;

var
  dlg: TConfineAreaSetFrm;
  tmpArea: TConfineArea;
  i: integer;
  temp1, temp2: TWorldPointAry;
  a1, a2, b1, b2: TPoint;
  tmpint: integer;
  dt: TDateTime;
begin
  FMap.MouseAction := actNoAction;
  tool_not_select.Checked := true;
  if PointsCnt < 2 then exit;
  dlg := TConfineAreaSetFrm.Create(nil);
  try
    dlg.Edit_AreaID.Text := IntTostr(GAreaManage.MaxId);
    dlg.Edit_AreaName.Text := '区域' + IntToStr(GAreaManage.MaxId);
    dlg.Edit_AreaColor.Color := clred;
    dlg.CheckBox_IsDraw.Checked := True;
    dlg.CheckBoxShowPop.Checked := true;
    if FANTIFAKE_WARRING then
    begin
      dlg.ComboBox_AreaType.ItemIndex := 7;
      dlg.ComboBox_AreaType.Enabled := False;
      dlg.Panel2.Visible := True;
      dlg.Notebook1.PageIndex := 0;
    end;
    dlg.ShowModal;
    if dlg.ModalResult = mrok then
    begin
      begin
        if (PointsCnt < 3) then exit;
        tmpArea := GAreaManage.Add(StrToInt(dlg.Edit_AreaID.text));
        if dlg.Edit_LimitSpeet.Visible then //判断是否有超速设置
        begin
          if dlg.Edit_LimitSpeet.Text <> '' then
            tmpArea.OverSpeet := StrToInt(dlg.Edit_LimitSpeet.Text);
        end;
        tmpArea.ID := StrToInt(dlg.Edit_AreaID.Text);
        tmpArea.Name := trim(dlg.Edit_AreaName.Text);
        tmpArea.AreaColor := dlg.Edit_AreaColor.Color;

        tmpArea.AreaType := dlg.ComboBox_AreaType.ItemIndex;
        tmpArea.IsDraw := dlg.CheckBox_IsDraw.Checked;
        tmpArea.AlarmDistance := 1000;


        tmpArea.IsEnabledTime := dlg.CheckBoxEnabledTime.Checked;
        tmpArea.BeginTime := dlg.BeginTime.Time - Trunc(dlg.BeginTime.Time);
        tmpArea.EndTime := dlg.EndTime.Time - Trunc(dlg.EndTime.Time);
        tmpArea.IsShowPop := dlg.CheckBoxShowPop.Checked;

        if dlg.ComboBox_AreaType.ItemIndex = 2 then
        begin
          dt := dlg.arriveDate.DateTime;
          ReplaceTime(dt, dlg.arriveTime.Time);
          tmpArea.ArriveDateTime := dt;
          dt := dlg.leaveDate.DateTime;
          ReplaceTime(dt, dlg.leaveTime.Time);
          tmpArea.LeaveDateTime := dt;
        end;        
        {tmpArea.AntiFakeText := trim(dlg.editText.Text);
        tmpArea.AntiFakePicFilePath := trim(dlg.editFilePath.Text);
        if dlg.RadioButton1.Checked then
          tmpArea.AntiFakeType := 0
        else if dlg.RadioButton2.Checked then
          tmpArea.AntiFakeType := 1;

        if dlg.ComboBox_AreaType.ItemIndex = SUSPECTEDPETITIONS_WARRING then
        begin
          tmpArea.MinSpeed := StringToInteger(Trim(dlg.editMinSpeed.Text));
          tmpArea.MaintainTime := StringToInteger(Trim(dlg.editMaintainTime.Text));
        end;

        if (dlg.ComboBox_AreaType.ItemIndex = ALARM_WAY_OUT) or //如果是固定线路
          (dlg.ComboBox_AreaType.ItemIndex = ALARM_WAY_IN) then
        begin
          tmpint := PointsCnt * 2 - 2;
          Setlength(temp1, tmpint);
          Setlength(temp2, tmpint);
          for i := 0 to PointsCnt - 2 do
          begin
            GetPoint(WPointsAry[i], WPointsAry[i + 1], a1, a2, b1, b2, tmpArea.AlarmDistance);
            tmpArea.RunWayRectList.Add(a1, a2, b2, b1);
          end;

          tmpArea.SetLengthPointAry(PointsCnt);
          for i := 0 to PointsCnt - 1 do
          begin
            tmpArea.WorldPointAry[i] := WPointsAry[i];
          end;
          tmpArea.OutBox := tmpArea.RunWayRectList.OutBox;
        end
        else} //区域报警
        begin
          if PointsCnt < 3 then exit;
          tmpArea.SetLengthPointAry(PointsCnt);
          for i := 0 to PointsCnt - 1 do
          begin
            tmpArea.WorldPointAry[i] := WPointsAry[i];
          end;
          tmpArea.WorldPointAryToOutBox(tmpArea.WorldPointAry, 0, tmpArea.PointCount);
        end;
      end;

      //------------ 显示电子围栏列表
      if (not FDlg_ConfineAreaList.Visible) {or (FDlg_ConfineAreaList.Floating)} then
      begin
        FDlg_ConfineAreaList.ManualDock(PageControlBottom, nil, alLeft);
        FDlg_ConfineAreaList.Show;
        for i := 0 to PageControlBottom.PageCount - 1 do
          if PageControlBottom.Pages[i].Caption = '电子围栏' then
          begin
            PageControlBottom.ActivePageIndex := i;
            break;
          end;
      end;
      FDlg_ConfineAreaList.ListConfineAreas;
      //------------ 显示电子围栏
    end;
  finally
    dlg.Free;
    FMap.MouseAction := actMove;
    tool_move.Checked := True;
    tool_SetConfineAlarmArea.Checked := False;
    FANTIFAKE_WARRING := False;
  end;
end;

procedure TMainf.FMapUserSelectDev(sender: Tobject; PointA, PointB: TEarthPoint);
var
  i: integer;
  dev: TDevice;
  tempListView: TListView;
//  SendOrderFrm: TSendOrderMiniFrm;
begin
  if not (Panel_Clxx.Visible) then show_car.Execute;
  ListSelectDev.Clear;
  if ADeviceManage.UserSelectList.Count = 0 then
  begin
    EarthRect.isCanUse := false;
    PageControl1.ActivePageIndex := 0;
    exit;
  end;
  GetMapRectSelect_Rect(PointA, PointB);
  ListSelectDev.BeginUpdate;
  for i := 0 to ADeviceManage.UserSelectList.Count - 1 do
  begin
    dev := ADeviceManage.ItemsFromMetaIndex[i];
    with ListSelectDev.Add do
    begin
      Data := dev;
      Values[0] := dev.IdStr;
      Values[1] := dev.Car.No;
      Values[2] := ADevGroupManage.find(dev.GroupID).Name;
      ImageIndex := dev.Car.ResIndex;
      SelectedIndex := dev.Car.ResIndex;
      if dev.isOnline then
      begin
        if Dev.Switch[STAT_GPS_LOCATE] then
          StateIndex := 3
        else
          StateIndex := 6;
      end
      else //如不在线,就显示非定位..
      begin
        StateIndex := 4;
      end;
    end;
  end;
  ListSelectDev.EndUpdate;
//  SendOrderFrm := GetFocusSendOrderFrm;
//  if SendOrderFrm <> nil then
//  begin
//    tempListView := FListView_SelectDevs;
//    FListView_SelectDevs := SendOrderFrm.ListView1;
//    AddDeviceFromListSelectDev;
//    FListView_SelectDevs := tempListView;
//  end;
  PageControl1.ActivePageIndex := 1;
end;

procedure TMainf.ListSelectDevFocusedNodeChanged(Sender: TObject;
  APrevFocusedNode, AFocusedNode: TcxTreeListNode);
begin
  if ListSelectDev.FocusedNode = nil then exit;
  //GCurSelectDev :=TDevice(ListSelectDev.FocusedNode.Data);
  GCurSelectDev := TDevice(AFocusedNode.Data);
  Edit2.Text := GCurSelectDev.Id;
  Edit1.Text := GCurSelectDev.Car.No;
  ComboboxCarNo.Text := Edit1.Text;
end;

procedure TMainf.FMapUserSelDevcntMany;
begin
  messagebox(handle, pchar('对不起，您选中的车辆太多了，您最多只能同时选中' +
    IntToStr(DRAWSelectDevCnt) + '辆车！'), '提示', mb_ok + mb_iconinformation);
end;

procedure TMainf.show_ConfineAreaListExecute(Sender: TObject);
begin
  ShowWindows(Sender, PageControlBottom, FDlg_ConfineAreaList, alLeft);
end;


procedure TMainf.show_AlarmListsExecute(Sender: TObject);
begin
  ShowWindows(Sender, PageControlBottom, FDlg_AlarmCar, alLeft);
end;

procedure TMainf.SelectDevsExecute(Sender: TObject);
var
  dlg: TFrmSelectDevs;
  i: integer;
  dev: Tdevice;
begin
  dlg := TFrmSelectDevs.Create(nil);
  try
    dlg.FormStyle := fsStayOnTop;
    dlg.ShowModal;
    if FListView_SelectDevs = nil then exit;
    if dlg.ModalResult = mrok then
    begin
      FListView_SelectDevs.Clear;
      for i := 0 to dlg.DestList.Count - 1 do
        with FListView_SelectDevs.Items.Add do
        begin
          dev := TDevice(dlg.DestList.Items[i].Data);
          caption := dev.Car.No;
          data := dev;
        end;
    end;
  finally
    dlg.Free;
  end;
end;

procedure TMainf.DevAlarm_OutorInConfineArea(ADev: Tdevice;
  AlarmType: Byte; AddorDel: boolean; AArea: TConfineArea);
var

  str: string;
//  find_ListItem,node : TcxTreeListNode;
begin
  if AddorDel then //=---add 添加新的　越界或驶入　报警车辆
  begin
    //声音报警
    try
      screen.Cursor := crHourGlass;
      //SetCurrentDir(ExtractFilePath(Application.ExeName));
      if AlarmType = ALARM_OUT then
        str := ExpandFileName(GlobalParam.AlarmSound_OutCArea)
      else if AlarmType = ALARM_IN then
        str := ExpandFileName(GlobalParam.AlarmSound_InCArea);
      //if FileExists(str) then
        MediaPalySound(str);
        //PlaySound(pchar(str), Hinstance, SND_FILENAME);
    except
    end;
    screen.Cursor := crDefault;

    if (AlarmType = ALARM_OUT) or (AlarmType = ALARM_WAY_OUT) then //加入到越界报警列表
      FDlg_AlarmCar.AddData_OutCAreaDev(Adev, AArea)
    else if (AlarmType = ALARM_IN) or (AlarmType = ALARM_WAY_IN) then //加入到驶入报警列表
      FDlg_AlarmCar.AddData_InCAreaDev(Adev, AArea)
    else if AlarmType = OUT_TOWN then
      FDlg_AlarmCar.AddData_OutToTown(ADev, AArea)
    else if AlarmType = OUT_TOWN_ERROR then
      FDlg_AlarmCar.Dev_OutToTown_Error(ADev, AArea)
    else if AlarmType = ASSEMBLE_WARRING then
      FDlg_AlarmCar.AddData_AssembleWarring(nil, AArea, False)
    else if AlarmType = SUSPECTEDPETITIONS_WARRING then
      FDlg_AlarmCar.AddData_SuspectedPetitionsWarring(nil, AArea, False);

    if GlobalParam.isAreaAlarmSendInfoToDriver then
    begin
      case AlarmType of
       { ALARM_OUT: str := '你已使出' + AArea.Name + '区域,请回到' + AArea.Name + '区域';
        ALARM_IN: str := '你已使入' + AArea.Name + '区域,请离开' + AArea.Name + '区域';
        ALARM_WAY_OUT: str := '你已使出' + AArea.Name + '路线,请回到' + AArea.Name + '路线';
        ALARM_WAY_IN: str := '你已使入' + AArea.Name + '路线,请离开' + AArea.Name + '路线'; }
        ALARM_OUT: str := '您已经跨出电子围栏，进入总台监控范围，请注意安全，小心驾驶，祝你一路顺风。';
        ALARM_IN: str := '您已驶入' + AArea.Name + '区域,请离开' + AArea.Name + '区域';
//        ALARM_WAY_OUT: str := '您已驶出' + AArea.Name + '路线,请回到' + AArea.Name + '路线';
//        ALARM_WAY_IN: str := '您已驶入' + AArea.Name + '路线,请离开' + AArea.Name + '路线';
//        OUT_TOWN: str := '您已经出城区，请注意安全，及时回城，小心驾驶，祝你一路顺风。 '
      end;
      if AlarmType <> OUT_TOWN_ERROR then
        DataServer.SendControlInfo_Alarm_V3(-1, ADev,Trim(str),Length(Trim(str)),5);
    end;   
  end
  else //=del 从越界到不越界，或从驶入到驶出。将列表中原有的报警信息　推入历史,并将列表中原有删掉
  begin
    if AlarmType = ALARM_OUT then
      str := '车辆已不驶出区域'
    else if AlarmType = ALARM_IN then
      str := '车辆已不驶入区域'
    else if AlarmType = ALARM_WAY_OUT then
      str := '车辆已不驶出路线'
    else if AlarmType = ALARM_WAY_IN then
      str := '车辆已不驶入路线'
    else if AlarmType = OUT_TOWN then
      str := '车辆已经回城';
    if AlarmType = ASSEMBLE_WARRING then
    begin
      FDlg_AlarmCar.AddData_AssembleWarring(nil, AArea, True);
    end
    else if AlarmType = SUSPECTEDPETITIONS_WARRING then
    begin
      FDlg_AlarmCar.AddData_SuspectedPetitionsWarring(nil, AArea, True);
    end
    else
    begin
      RemoveOutorInCAData2History(ADev, AlarmType, str);
    end;
  end;
end;

procedure TMainf.RemoveOutorInCAData2History(ADev: TDevice; AlarmType: byte; const MoveCause: string);
var
  find_ListItem: TcxTreeListNode;
begin
  if (AlarmType = ALARM_OUT) or (AlarmType = ALARM_WAY_OUT) then //从越界到不越界
  begin
    Adev.Alarm_OutCArea := false;
    //FDlg_AlarmCar.cxOutCAreaList.BeginUpdate;
    find_ListItem := FindNodeByTextIncxTreeList(ADev.IdStr, FDlg_AlarmCar.cxOutCAreaList, 0);
    if find_ListItem <> nil then
    begin
      FDlg_AlarmCar.cxOutCAreaList.BeginUpdate;
      try
        FDlg_AlarmCar.MoveData2OutCAreaHistoryList(ADev, find_ListItem, MoveCause);
      finally
        FDlg_AlarmCar.cxOutCAreaList.EndUpdate;
      end;
    end;
  end
  else if (AlarmType = ALARM_IN) or (AlarmType = ALARM_WAY_IN) then //从驶入到驶出
  begin
    Adev.Alarm_InCArea := false;
    //FDlg_AlarmCar.cxInCAreaList.BeginUpdate;
    find_ListItem := FindNodeByTextIncxTreeList(ADev.IdStr, FDlg_AlarmCar.cxInCAreaList, 0);
    if find_ListItem <> nil then
    begin
      FDlg_AlarmCar.cxInCAreaList.BeginUpdate;
      try
        FDlg_AlarmCar.MoveData2InCAreaHistoryList(ADev, find_ListItem, MoveCause);
      finally
        FDlg_AlarmCar.cxInCAreaList.EndUpdate;
      end;
    end;
  end
  else if AlarmType = OUT_TOWN then
  begin
    find_ListItem := FindNodeByTextIncxTreeList(ADev.IdStr, FDlg_AlarmCar.OutTownList, 0);
    if find_ListItem <> nil then
    begin
      with FDlg_AlarmCar.HistoryDevList.Add do
      begin
        Data := find_ListItem.Data;
        Values[0]:= find_ListItem.Values[0];
        Values[1]:= find_ListItem.Values[1];
        Values[2]:= find_ListItem.Values[2] ;
        if Adev.GoToTown =0 then
          Values[3] := ''
        else
          Values[3]:= FormatDateTime('yyyy-mm-dd hh:nn:ss',Adev.GoToTown) ;
        Values[4]:= find_ListItem.Values[4];
        Values[5]:= find_ListItem.Values[5];
        Values[6]:= find_ListItem.Values[6];
        Values[7]:= find_ListItem.Values[7];
        ImageIndex := ADev.Car.ResIndex;
        SelectedIndex := ADev.Car.ResIndex ;
      end;
      find_ListItem.Delete;
    end;
  end;
end;

procedure TMainf.RemoveArea(Area: TConfineArea);
var
  find_ListItem: TcxTreeListNode;
begin
  case Area.AreaType of
    ASSEMBLE_WARRING:
    begin
      find_ListItem := FindNodeByTextIncxTreeList(IntToStr(Area.ID), FDlg_AlarmCar.AssembleWarringList, 0);
      if find_ListItem <> nil then
      begin
        FDlg_AlarmCar.cxTreeList2.Clear;
        find_ListItem.Delete;
      end;
    end;
    SUSPECTEDPETITIONS_WARRING:
    begin
      find_ListItem := FindNodeByTextIncxTreeList(IntToStr(Area.ID), FDlg_AlarmCar.SuspectedPetitionsWarringList, 0);
      if find_ListItem <> nil then
      begin
        FDlg_AlarmCar.cxTreeList3.Clear;
        find_ListItem.Delete;
      end;
    end;
  end;
end;


procedure TMainf.show_SearchAddressExecute(Sender: TObject);
begin
  ShowWindows(Sender, PageControlBottom, FDlg_SearchAddress, alLeft);
end;

procedure TMainf.ShowState(Device: TDevice);
var
  i: integer;
  tmpOkStr,tmpNoWarnStr:string;
  tmpStr: string;
begin
  tmpOkStr := '-';//正常
  tmpNoWarnStr := '-';  //否
  try
    if Device = nil then exit;
//    if not Device.First and not Device.isOnline then
//    begin
//      for i := 1 to DeviceStateList.RowCount - 1 do
//      begin
//        DeviceStateList.Cells[1, i] := '';
//      end;
//      DeviceStateList.Cells[0, 2] := '东经西经';
//      DeviceStateList.Cells[0, 3] := '南纬北纬';
//      exit;
//    end;

    if Device.Switch[MSG_STATE_0] then
      DeviceStateList.Values['ACC状态'] := '开'
    else
      DeviceStateList.Values['ACC状态'] := '关';

    if Device.Switch[MSG_STATE_1] then
      DeviceStateList.Values['定位状态'] := '定位'
    else
      DeviceStateList.Values['定位状态'] := '非定位';
    if not Device.isOnline then
      DeviceStateList.Values['定位状态'] := '非定位'; //'非定位';sha20110602

    if not Device.Switch[MSG_STATE_2] then
    begin
      DeviceStateList.Cells[0, 2]:= '北纬';
      DeviceStateList.Values['北纬'] := FormatFloat('##0.000000', Device.Latitude);
    end
    else
    begin
      DeviceStateList.Cells[0, 2] := '南纬';
      DeviceStateList.Values['南纬'] := FormatFloat('##0.000000', Device.Latitude);
    end;

    if not Device.Switch[MSG_STATE_3] then
    begin
      DeviceStateList.Cells[0, 3] := '东经';
      DeviceStateList.Values['东经'] := FormatFloat('##0.000000', Device.Longitude);
    end
    else
    begin
      DeviceStateList.Cells[0, 3] := '西经';
      DeviceStateList.Values['西经'] := FormatFloat('##0.000000', Device.Longitude);
    end;
    if Device.GpsTime = 0 then
    begin
      DeviceStateList.Values['GPS时间'] := '';
      DeviceStateList.Values['GPS日期'] := '';
    end
    else
    begin
      DeviceStateList.Values['GPS时间'] := FormatDatetime('hh:nn:ss', Device.GpsTime);
      DeviceStateList.Values['GPS日期'] := FormatDatetime('yyyy-mm-dd', Device.GpsTime);
    end;

    if Device.OilVolume <= 0 then
    begin
      DeviceStateList.Values['油量'] := '';
    end
    else
    begin
      DeviceStateList.Values['油量'] := FormatFloat('#0.0', Device.OilVolume) + '升';
    end;
    if Device.Course <= 0 then
    begin
      DeviceStateList.Values['里程'] := '';
    end
    else
    begin
      DeviceStateList.Values['里程'] := FormatFloat('#0.0', Device.Course) + '公里';
    end;

    if Device.RunRecSpeed <= 0 then
    begin
      DeviceStateList.Values['行驶记录仪速度'] := '';
    end
    else
    begin
      DeviceStateList.Values['行驶记录仪速度'] := FormatFloat('#0.0', Device.RunRecSpeed / 10) + '公里/小时';
    end;    

    DeviceStateList.Values['SIM卡'] := Device.SimNo;

    if Device.Switch[MSG_STATE_4] then
      DeviceStateList.Values['运营状态'] := '停运'
    else
      DeviceStateList.Values['运营状态'] := '营运';

    if not Device.Switch[MSG_STATE_5] then
      DeviceStateList.Values['经纬度状态'] := '未加密'
    else
      DeviceStateList.Values['经纬度状态'] := '已加密';

    if Device.Switch[MSG_STATE_10] then
      DeviceStateList.Values['车辆油路'] := '断开'
    else
      DeviceStateList.Values['车辆油路'] := tmpOkStr;

   if Device.Switch[MSG_STATE_11] then
      DeviceStateList.Values['车辆电路'] := '断开'
   else
      DeviceStateList.Values['车辆电路'] := tmpOkStr;
    if Device.Switch[MSG_STATE_12] then
      DeviceStateList.Values['车门状态'] := '加锁'
    else
      DeviceStateList.Values['车门状态'] := '解锁';

    //------------------------报警信息
    if Device.Switch_Warning[MSG_WARNING_0] then
      DeviceStateList.Values['紧急报警'] := '是'
    else
      DeviceStateList.Values['紧急报警'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_1] then
      DeviceStateList.Values['超速报警'] := '是'
    else
      DeviceStateList.Values['超速报警'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_2] then
      DeviceStateList.Values['疲劳驾驶报警'] := '是'
    else
      DeviceStateList.Values['疲劳驾驶报警'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_3] then
      DeviceStateList.Values['危险预警'] := '是'
    else
      DeviceStateList.Values['危险预警'] := tmpNoWarnStr;


    if Device.Switch_Warning[MSG_WARNING_4] then
      DeviceStateList.Values['GPS模块'] := '故障'
    else
      DeviceStateList.Values['GPS模块'] := tmpOkStr;

    if Device.Switch_Warning[MSG_WARNING_5] then
      DeviceStateList.Values['GPS天线'] := '未接或剪断'
    else
      DeviceStateList.Values['GPS天线'] := tmpOkStr;

    if Device.Switch_Warning[MSG_WARNING_6] then
      DeviceStateList.Values['GPS天线短路'] := '是'
    else
      DeviceStateList.Values['GPS天线短路'] := tmpOkStr;

    if Device.Switch_Warning[MSG_WARNING_7] then
       DeviceStateList.Values['终端主电源欠压报警']:= '是'
    else
      DeviceStateList.Values['终端主电源欠压报警']:= tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_8] then
       DeviceStateList.Values['终端主电源掉电报警']:= '是'
    else
      DeviceStateList.Values['终端主电源掉电报警']:= tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_9] then
      DeviceStateList.Values['终端LCD或显示器'] := '故障'
    else
      DeviceStateList.Values['终端LCD或显示器'] := tmpOkStr;

    if Device.Switch_Warning[MSG_WARNING_10] then
      DeviceStateList.Values['TTS模块'] := '故障'
    else
      DeviceStateList.Values['TTS模块'] := tmpOkStr;

    if Device.Switch_Warning[MSG_WARNING_11] then
      DeviceStateList.Values['摄像头'] := '故障'
    else
      DeviceStateList.Values['摄像头'] := tmpOkStr;


    if Device.Switch_Warning[MSG_WARNING_18] then
      DeviceStateList.Values['当天累计驾驶超时报警'] := '是'
    else
      DeviceStateList.Values['当天累计驾驶超时报警'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_19] then
      DeviceStateList.Values['超时停车报警'] := '是'
    else
      DeviceStateList.Values['超时停车报警'] := tmpNoWarnStr;
    if Device.Switch_Warning[MSG_WARNING_20] then
      DeviceStateList.Values['进出区域报警'] := '是'
    else
      DeviceStateList.Values['进出区域报警'] := tmpNoWarnStr;
    if Device.Switch_Warning[MSG_WARNING_21] then
      DeviceStateList.Values['进出路线报警'] := '是'
    else
      DeviceStateList.Values['进出路线报警'] := tmpNoWarnStr;
    if Device.Switch_Warning[MSG_WARNING_22] then
      DeviceStateList.Values['路段行驶时间'] := '不足或过长'
    else
      DeviceStateList.Values['路段行驶时间'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_23] then
      DeviceStateList.Values['路线偏离报警'] := '是'
    else
      DeviceStateList.Values['路线偏离报警'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_24] then
      DeviceStateList.Values['车辆VSS'] := '故障'
    else
      DeviceStateList.Values['车辆VSS'] :=tmpOkStr;
    if Device.Switch_Warning[MSG_WARNING_25] then
      DeviceStateList.Values['车辆油量'] := '异常'
    else
      DeviceStateList.Values['车辆油量'] :=tmpOkStr;

    if Device.Switch_Warning[MSG_WARNING_26] then
      DeviceStateList.Values['车辆被盗报警'] := '是'
    else
      DeviceStateList.Values['车辆被盗报警'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_27] then
      DeviceStateList.Values['车辆非法点火报警'] := '是'
    else
      DeviceStateList.Values['车辆非法点火报警'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_28] then
      DeviceStateList.Values['车辆非法位移报警'] := '是'
    else
      DeviceStateList.Values['车辆非法位移报警'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_29] then
      DeviceStateList.Values['碰撞侧翻报警报警'] := '是'
    else
      DeviceStateList.Values['碰撞侧翻报警报警'] := tmpNoWarnStr;

    tmpStr := '-';
    //北斗新增状态位、报警位处理
    if IsBeiDouDev(Device) then
    begin
      //8-9  00：空车；01：半载；10：保留；11：满载
      if Device.Switch[MSG_STATE_8] then
      begin
        if Device.Switch[MSG_STATE_9] then
          tmpStr := '满载'
        else
          tmpStr := '保留';
      end
      else
      begin
        if Device.Switch[MSG_STATE_9] then
          tmpStr := '半载'
        else
          tmpStr := '空车';
      end;
      DeviceStateList.Values['空重状态'] := tmpStr;

      if Device.Switch[MSG_STATE_13] then
        DeviceStateList.Values['前门开关'] := '开'
      else
        DeviceStateList.Values['前门开关'] := '关';

      if Device.Switch[MSG_STATE_14] then
        DeviceStateList.Values['中门开关'] := '开'
      else
        DeviceStateList.Values['中门开关'] := '关';

      if Device.Switch[MSG_STATE_15] then
        DeviceStateList.Values['后门开关'] := '开'
      else
        DeviceStateList.Values['后门开关'] := '关';

      if Device.Switch[MSG_STATE_16] then
        DeviceStateList.Values['驾驶席门'] := '开'
      else
        DeviceStateList.Values['驾驶席门'] := '关';

      if Device.Switch[MSG_STATE_18] then
        DeviceStateList.Values['使用GPS定位'] := '是'
      else
        DeviceStateList.Values['使用GPS定位'] := '否';

      if Device.Switch[MSG_STATE_19] then
        DeviceStateList.Values['使用北斗定位'] := '是'
      else
        DeviceStateList.Values['使用北斗定位'] := '否';

      if Device.Switch[MSG_STATE_20] then
        DeviceStateList.Values['使用GLONASS定位'] := '是'
      else
        DeviceStateList.Values['使用GLONASS定位'] := '否';

      if Device.Switch[MSG_STATE_21] then
        DeviceStateList.Values['使用Galileo定位'] := '是'
      else
        DeviceStateList.Values['使用Galileo定位'] := '否';

      //报警位
      if Device.Switch_Warning[MSG_WARNING_12] then
        DeviceStateList.Values['道路运输证IC卡模块'] := '故障'
      else
        DeviceStateList.Values['道路运输证IC卡模块'] := tmpNoWarnStr;

      if Device.Switch_Warning[MSG_WARNING_13] then
        DeviceStateList.Values['超速预警'] := '是'
      else
        DeviceStateList.Values['超速预警'] := tmpNoWarnStr;

      if Device.Switch_Warning[MSG_WARNING_14] then
        DeviceStateList.Values['疲劳驾驶预警'] := '是'
      else
        DeviceStateList.Values['疲劳驾驶预警'] := tmpNoWarnStr;

      if Device.Switch_Warning[MSG_WARNING_30] then
        DeviceStateList.Values['侧翻预警'] := '是'
      else
        DeviceStateList.Values['侧翻预警'] := tmpNoWarnStr;

      if Device.Switch_Warning[MSG_WARNING_31] then
        DeviceStateList.Values['非法开门报警'] := '是'
      else
        DeviceStateList.Values['非法开门报警'] := tmpNoWarnStr;

      if Device.SignalStrength < 7 then
      begin
        DeviceStateList.Values['无线信号强度'] := '弱(' + IntToStr(Device.SignalStrength) + ')';
      end
      else if Device.NavSatelliteCount < 14 then
      begin
        DeviceStateList.Values['无线信号强度'] := '中(' + IntToStr(Device.SignalStrength) + ')';
      end
      else
      begin
        DeviceStateList.Values['无线信号强度'] := '强(' + IntToStr(Device.SignalStrength) + ')';
      end;

      DeviceStateList.Values['GNSS定位卫星数'] := IntToStr(Device.NavSatelliteCount)
    end
    else
    begin
      DeviceStateList.Values['空重状态'] := tmpStr;
      DeviceStateList.Values['前门开关'] := tmpStr;
      DeviceStateList.Values['中门开关'] := tmpStr;
      DeviceStateList.Values['后门开关'] := tmpStr;
      DeviceStateList.Values['驾驶席门'] := tmpStr;
      DeviceStateList.Values['使用GPS定位'] := tmpStr;
      DeviceStateList.Values['使用北斗定位'] := tmpStr;
      DeviceStateList.Values['使用GLONASS定位'] := tmpStr;
      DeviceStateList.Values['使用Galileo定位'] := tmpStr;

      DeviceStateList.Values['道路运输证IC卡模块'] := tmpStr;
      DeviceStateList.Values['超速预警'] := tmpStr;
      DeviceStateList.Values['疲劳驾驶预警'] := tmpStr;
      DeviceStateList.Values['侧翻预警'] := tmpStr;
      DeviceStateList.Values['非法开门报警'] := tmpStr;

      DeviceStateList.Values['无线信号强度'] := tmpStr;
      DeviceStateList.Values['GNSS定位卫星数'] := tmpStr;
    end;

  except on E: Exception do
      uGloabVar.SystemLog.AddLog(' TMainf.ShowState函数报错: ', e.Message);
  end;
end;

//设置电话本

procedure TMainf.fun_SetDevTelListExecute(Sender: TObject);
var
  dlg: TfrmSetDevTelList;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  if not CheckDevId then
  begin
    fun_Devs_SetDevTelListExecute(Sender);
    exit;
  end;
  dlg := TfrmSetDevTelList.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    Add_A_Device;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_SendControlInfoExecute(Sender: TObject);
var
  dlg: TSendMsg2Dev;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  if not CheckDevId then
  begin
    fun_Devs_SendControlInfoExecute(Sender);
    exit;
  end;
  dlg := TsendMsg2dev.Create(self);
  try
    dlg.Tag := MSGTYPE_NEEDANSWER;
    dlg.Memo1.Lines.Clear;
    if LastSendMsg_NeedAnswer <> '' then dlg.Memo1.Lines.Add(LastSendMsg_NeedAnswer);
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs; {重新选择车辆 用统一的选择车辆窗体}
    FListView_SelectDevs := dlg.ListView1;
    dlg.Caption := fun_SendControlInfo.Caption;
    Add_A_Device;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

//群发　简短消息

procedure TMainf.fun_Devs_SendControlInfoExecute(Sender: TObject);
var
  dlg: TSendMsg2Dev;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}

  dlg := TsendMsg2dev.Create(self);

  try
    dlg.Tag := MSGTYPE_NEEDANSWER;
    dlg.Memo1.Lines.Clear;
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    dlg.Caption := fun_SendControlInfo.Caption;
    if ListSelectDev.Count > 0 then
    begin
      AddDeviceFromListSelectDev;
    end
    else
    begin
      AddDeviceByGroup;
    end;

    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;


procedure TMainf.fun_SendControlInfo_NeedAnswerExecute(Sender: TObject);
var
  dlg: TSendMsg2Dev;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  if not CheckDevId then
  begin
    fun_Devs_SendControlInfo_NeedAnswerExecute(Sender);
    exit;
  end;

  dlg := TsendMsg2dev.Create(self);
  dlg.Tag := MSGTYPE_NEEDANSWER;
  dlg.ListView1.PopupMenu := PopupMenu_SelectDevs; {重新选择车辆 用统一的选择车辆窗体}
  FListView_SelectDevs := dlg.ListView1;
  try
    Add_A_Device;
    dlg.Memo1.Lines.Clear;
    if LastSendMsg_NeedAnswer <> '' then dlg.Memo1.Lines.Add(LastSendMsg_NeedAnswer);     
    dlg.Caption := fun_SendControlInfo_NeedAnswer.Caption;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_PursueDevExecute(Sender: TObject);
var
  frm: TPursueDevFrm;
begin
  if not CheckDevId then
  begin
    fun_Devs_PursueDevExecute(Sender);
    exit;
  end;
  frm := TPursueDevFrm.Create(Self);
  try
    frm.ListView1.PopupMenu := PopupMenu_SelectDevs; {重新选择车辆 用统一的选择车辆窗体}
    FListView_SelectDevs := frm.ListView1;
    Add_A_Device;
    frm.ShowModal;
  finally
    frm.Free;
  end;
end;

procedure TMainf.fun_Devs_PursueDevExecute(Sender: TObject);
var
  dlg: TPursueDevFrm;
begin
  dlg := TPursueDevFrm.Create(nil);
  try
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs; {重新选择车辆 用统一的选择车辆窗体}
    FListView_SelectDevs := dlg.ListView1;
    if ListSelectDev.Count > 0 then
    begin
      AddDeviceFromListSelectDev;
    end else
    begin
      AddDeviceByGroup;
    end;

    dlg.ShowModal;
  finally
    dlg.Free;
  end;
end;

procedure TMainf.fun_Devs_SendControlInfo_NeedAnswerExecute(
  Sender: TObject);
var
  dlg: TSendMsg2Dev;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  dlg := TsendMsg2dev.Create(self);
  dlg.Tag := MSGTYPE_NEEDANSWER;
  dlg.ListView1.PopupMenu := PopupMenu_SelectDevs; {重新选择车辆 用统一的选择车辆窗体}
  FListView_SelectDevs := dlg.ListView1;
  try

    if ListSelectDev.Count > 0 then
    begin
      AddDeviceFromListSelectDev;
    end
    else
    begin
      AddDeviceByGroup;
    end;

    dlg.Memo1.Lines.Clear;
    dlg.Caption := fun_SendControlInfo_NeedAnswer.Caption;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_Devs_SetDevTelListExecute(Sender: TObject);
var
  dlg: TfrmSetDevTelList;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  dlg := TfrmSetDevTelList.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    AddDeviceByGroup;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.SetPower;
  procedure SetEnViable(Sender: TObject; Pr: TPrivilege);
  begin
    if Sender is TAction then
    begin
      TAction(Sender).Enabled := Pr.Enabled;
      TAction(Sender).Visible := Pr.Visible;
    end;
    if Sender is TMenuItem then
    begin
      TMenuItem(Sender).Enabled := Pr.Enabled;
      TMenuItem(Sender).Visible := Pr.Visible;
    end;
    if Sender is TToolButton then
    begin
      TToolButton(Sender).Enabled := Pr.Enabled;
      TToolButton(Sender).Visible := Pr.Visible;
    end;
  end;
var
  Pr: TPrivilege;
  i: Integer;
  temp: string;
begin
  Pr := current_user.HasPrivilege(1000);
  if (Pr.Id = -1) or (not Pr.Visible) or (not Pr.Enabled) then
  begin
    messagebox(0, '对不起,你没有权限使用智能监控客户端，请向系统管理员查询！', '提示', mb_ok + mb_iconinformation);
    Application.Terminate;
    exit;
  end;

  //Pr := current_user.HasPrivilege(120000); //地图工具
  //SetEnViable(N49, Pr);
  //SetEnViable(tool_zoom_in, Pr);
  //SetEnViable(tool_zoom_out, Pr);
  //SetEnViable(tool_move, Pr);
  //SetEnViable(tool_locate, Pr);
  //SetEnViable(tool_distance, Pr);

  Pr := current_user.HasPrivilege(111000);    // 密码修改
  SetEnViable(sys_change_pass, Pr);

  Pr := current_user.HasPrivilege(121000);    // 用户自定义地图标签
  SetEnViable(tool_UserDefinedtext, Pr);

  Pr := current_user.HasPrivilege(122000);    // 矩形选择车辆
  SetEnViable(tool_RectSelect, pr);

  Pr := current_user.HasPrivilege(123000); //设置电子围栏区域
  SetEnViable(tool_SetConfineAlarmArea, Pr);

  Pr := current_user.HasPrivilege(125000); //区域查车
  SetEnViable(tool_SeekCar, Pr);

  Pr := current_user.HasPrivilege(126000); //加入图层
  SetEnViable(map_openLayer, Pr);

  Pr := current_user.HasPrivilege(127000); //删除图层
  SetEnViable(map_CloseLayer, Pr);

  Pr := current_user.HasPrivilege(128000); //图层控制
  SetEnViable(tool_layer_control, Pr);

  Pr := current_user.HasPrivilege(129000); //地图管理
  SetEnViable(Map_Manage, Pr);

  Pr := current_user.HasPrivilege(130000); //监控
  SetEnViable(N64, Pr);

//  Pr := current_user.HasPrivilege(131000); //车辆实时监控
//  SetEnViable(N281, Pr);

  Pr := current_user.HasPrivilege(131100); //监控参数
  SetEnViable(fun_PursueDev, Pr);
  SetEnViable(fun_Devs_PursueDev, Pr);

  Pr := current_user.HasPrivilege(131200); //位置查询
  SetEnViable(fun_FindPostion, Pr);
  SetEnViable(fun_Devs_CallDev, Pr);

//  Pr := current_user.HasPrivilege(132000); //车辆远程管理
//  SetEnViable(N262, Pr);

  Pr := current_user.HasPrivilege(132100); //拍照
  SetEnViable(fun_GetAPicture, Pr);
  SetEnViable(fun_Devs_GetAPicture, Pr);

  Pr := current_user.HasPrivilege(132200); //存储图片检索
  SetEnViable(fun_SendQueryPicture, Pr);

  Pr := current_user.HasPrivilege(132300); //音频数据检索
  SetEnViable(fun_SendQueryAudio, Pr);

//  Pr := current_user.HasPrivilege(132400); //油路电路控制
//  SetEnViable(fun_SendControlCar, Pr);
//
//  Pr := current_user.HasPrivilege(132500); //下发防伪标志
//  SetEnViable(fun_sendAntiFake, Pr);
//
//  Pr := current_user.HasPrivilege(132600); //停止防伪显示
//  SetEnViable(fun_SendStopAntiFake, Pr);

  Pr := current_user.HasPrivilege(132700); //下发回拨电话
  SetEnViable(fun_SendBackCallTel, Pr);

//  Pr := current_user.HasPrivilege(133000); //车载终端控制
//  SetEnViable(N265, Pr);

  //Pr := current_user.HasPrivilege(133100); //MCU管理
  //SetEnViable(MCU7, Pr);

  Pr := current_user.HasPrivilege(133110); //读取参数
  SetEnViable(fun_view_DevParam, Pr);

  Pr := current_user.HasPrivilege(133120); //设置参数
  SetEnViable(fun_Set_DevParam, Pr);
  SetEnViable(fun_Devs_SetParam, Pr);

  Pr := current_user.HasPrivilege(133130); //终端控制
  SetEnViable(fun_ControlTerminal, Pr);
  SetEnViable(fun_Devs_ControlTerminal, Pr);

  Pr := current_user.HasPrivilege(134000); //设置电话本
  SetEnViable(fun_SetDevTelList, Pr);

  Pr := current_user.HasPrivilege(135000); //下发文本信息
  SetEnViable(fun_SendControlInfo, Pr);
  SetEnViable(fun_Devs_SendControlInfo, Pr);

  Pr := current_user.HasPrivilege(136000);  //设置事件
  SetEnViable(fun_setDevEventList, Pr);
  SetEnViable(fun_Devs_SetDevEventList, Pr);

  Pr := current_user.HasPrivilege(137000);  //下发提问
  bReportAnswer := Pr.Visible;
  SetEnViable(fun_sendQuestion, Pr);
  SetEnViable(fun_Devs_SendDevQuestion, Pr);
  SetEnViable(Show_AnswerList, Pr);       //答案列表

  Pr := current_user.HasPrivilege(150000); //查询统计
  SetEnViable(N135, Pr);

  Pr := current_user.HasPrivilege(151000); //查看车辆信息
  SetEnViable(ck_DevInfo, Pr);

  Pr := current_user.HasPrivilege(152000); //查看司机信息
  SetEnViable(ck_DriverInfo, Pr);

  Pr := current_user.HasPrivilege(157000); //查询照片
  SetEnViable(ck_Picture, Pr);
  SetEnViable(ck_queryPhotoPos, Pr);

  Pr := current_user.HasPrivilege(160000); //设置
  SetEnViable(N96, Pr);

//  Pr := current_user.HasPrivilege(161000); //车辆行驶轨迹设置
//  SetEnViable(N95, Pr);
//
//  Pr := current_user.HasPrivilege(162000); //轨迹回放线设置
//  SetEnViable(N237, Pr);

  Pr := current_user.HasPrivilege(163000); //设置报警声音
  SetEnViable(N66, Pr);

  Pr := current_user.HasPrivilege(164000); //系统设置
  SetEnViable(SystemConfig, Pr);


  Pr := current_user.HasPrivilege(170000); //窗体视图
  SetEnViable(N75, Pr);

  //Pr := current_user.HasPrivilege(171000); //显示车辆信息
  //SetEnViable(show_car, Pr);

  Pr := current_user.HasPrivilege(172000); //显示地图窗口
  SetEnViable(show_Map, Pr);


//  Pr := current_user.HasPrivilege(173000); //显示提示信息
//  SetEnViable(Show_Prompt_Info, Pr);


  Pr := current_user.HasPrivilege(174000); //显示车辆列表
  SetEnViable(show_ListCar, Pr);



  Pr := current_user.HasPrivilege(175000); //显示报警车辆列表
  bAlarm := Pr.Visible;
  SetEnViable(show_AlarmLists, Pr);

//
//  Pr := current_user.HasPrivilege(176000); //显示预警信息
//  bEarlyAlarm := Pr.Visible;
//  SetEnViable(show_EarlyWarningCar, Pr);


  Pr := current_user.HasPrivilege(177000); //显示发送命令
  SetEnViable(show_sended_command, Pr);


  Pr := current_user.HasPrivilege(178000); //司机报告事件列表
  SetEnViable(Show_EventList, Pr);


  Pr := current_user.HasPrivilege(179000); //显示电子围栏列表
  SetEnViable(show_ConfineAreaList, Pr);


  Pr := current_user.HasPrivilege(179100); //显示地名查询
  SetEnViable(show_SearchAddress, Pr);


  Pr := current_user.HasPrivilege(179200); //显示轨迹回放
  SetEnViable(show_GPSHostory, Pr);


  Pr := current_user.HasPrivilege(179300); //显示存储图像检索列表
  SetEnViable(Show_QueryPictureList, Pr);


  Pr := current_user.HasPrivilege(179400); //显示音频
  SetEnViable(show_Audio, Pr);


  Pr := current_user.HasPrivilege(179500); //显示照片
  SetEnViable(show_Picture, Pr);


//  Pr := current_user.HasPrivilege(179600); //服务评价列表
//  bSeverJudge := Pr.Visible;
//  SetEnViable(Show_ServeJudgeList, Pr);


  //Pr := current_user.HasPrivilege(179700); //发送订单列表
  //SetEnViable(show_Sended_Message, Pr);

  //Pr := current_user.HasPrivilege(179800); //答案列表
  //SetEnViable(Show_AnswerList, Pr);

  Pr := current_user.HasPrivilege(179900); //设备状态
  SetEnViable(show_LightStateList, Pr);


  Pr := current_user.HasPrivilege(180000); //帮助
  SetEnViable(N76, Pr);

  Pr := current_user.HasPrivilege(181000); //在线升级
  SetEnViable(help_Update, Pr);

//--------------------------------------------------
  if GlobalParam.isShowAllDev then
    N320.Checked := True
  else
  begin
    if GlobalParam.isShowEmpty then
      N321.Checked := True
    else
      N322.Checked := True;
  end;

  temp := ' 用户类型：';
  Pr := current_user.HasPrivilege(1001);  // 报警业务
  if Pr.Visible then
  begin
    current_user.BJYW := True;
    temp := temp + '报警业务';
    Info_DevAlarmInfo.Visible := True;
  end;
//  Pr := current_user.HasPrivilege(1002);  // 行业管理
//  if Pr.Visible then
//  begin
//    current_user.HYGL := True;
    Tj_Online.Visible := True;
//    ToolButton17.Visible := True;  //打击克隆车
//    temp := temp + ' 行业管理';
//  end;
  Pr := current_user.HasPrivilege(1003);  // 电子调度
  if Pr.Visible then
  begin
    current_user.DZDD := True;
    temp := temp + ' 电子调度';
  end;
  Pr := current_user.HasPrivilege(1004);  // 设备维护
  if Pr.Visible then
  begin
    current_user.SBWH := True;
    Info_DevModify.Visible := True;
    Info_SysManage.Visible := True;
    temp := temp + ' 设备维护';
  end;
//  Self.Caption := Self.Caption + temp + '岗';    
end;

procedure TMainf.SetZDCLJKPower(Dlg : TZDCLJKFrm);
  procedure SetEnViable(Sender: TObject; Pr: TPrivilege);
  begin
    if Sender is TAction then
    begin
      TAction(Sender).Enabled := Pr.Enabled;
      TAction(Sender).Visible := Pr.Visible;
    end;
    if Sender is TMenuItem then
    begin
      TMenuItem(Sender).Enabled := Pr.Enabled;
      TMenuItem(Sender).Visible := Pr.Visible;
    end;
  end;
var
  Pr: TPrivilege;
  i: Integer;
begin
  Pr := current_user.HasPrivilege(131100); //监控参数
  SetEnViable(Dlg.N17, Pr);


  Pr := current_user.HasPrivilege(132100); //拍照
  SetEnViable(Dlg.N62, Pr);


  Pr := current_user.HasPrivilege(132400); //油路电路控制
  SetEnViable(Dlg.N125, Pr);


  Pr := current_user.HasPrivilege(132700); //下发回拨电话
  SetEnViable(Dlg.N4, Pr);


  Pr := current_user.HasPrivilege(133130); //终端控制
  SetEnViable(Dlg.N91, Pr);


  Pr := current_user.HasPrivilege(135000); //下发文本信息
  SetEnViable(Dlg.N2, Pr);
end;


procedure TMainf.ck_DriverInfoExecute(Sender: TObject);
var
  i: integer;
begin
  if FDlg_CkDriverInfo= nil then
    FDlg_CkDriverInfo := TDriverInfoFrm.Create(self);
  ShowQueryForm(PageControl_Center, FDlg_CkDriverInfo, TDriverInfoFrm, alLeft);
end;

procedure TMainf.fun_SendOrderExecute(Sender: TObject);
//var
//  Frm: TSendOrderMiniFrm;
begin
//  Frm := GetSendOrderFrm;
//  FListView_SelectDevs := frm.ListView1;
//  frm.Show;
//
//  Frm.Caption := '发送订单';


//  if ListSelectDev.Count > 0 then
//  begin
//    AddDeviceFromListSelectDev;
//  end
//  else
//  begin
//    AddDeviceByGroup;
//  end;
end;

procedure TMainf.SelectedExecute(Sender: TObject);
begin
  if FListView_SelectDevs = nil then exit;
  if ListSelectDev.Count = 0 then
  begin
    PopMsg('提示', '已选中的车辆没有车!' + #13 + #10 + '请在"地图工具->矩形选择车辆"工具选择车!');
    exit;
  end;
  AddDeviceFromListSelectDev;
end;

procedure TMainf.PopupMenu_cmdPopup(Sender: TObject);
//var
//  p: PCmdInfo;
begin
  if FDlg_Sended_Cmd.cxTreeList1.FocusedNode = nil then
  begin
    cmd_cancel.Enabled := false;
    cmd_reSend.Enabled := false;
    exit;
  end;
//  p := FDlg_Sended_Cmd.cxTreeList1.FocusedNode.Data;
//  if (P^.Flag = TERMSRV_DOWNAORDER) or (P^.Flag = TERMSRV_DOWNCANCELORDER) then
//  begin
//    cmd_cancel.Enabled := false;
//    cmd_reSend.Enabled := false;
//  end
//  else
  begin
    cmd_cancel.Enabled := true;
    cmd_reSend.Enabled := true;
  end;
end;

procedure TMainf.fun_CancelOrderMenuExecute(Sender: TObject);
//var
//  Frm2: TCancelOrderMenu2Frm;
//  Frm: TCancelOrderMenuFrm;
begin
//  if not CheckDevId then
//  begin
//    fun_Devs_CancelOrderMenuExecute(Sender);
//    exit;
//  end;
//
//  if CancelMenuFun = 'QueryCancelMenu_zb' then
//  begin
//    frm2 := TCancelOrderMenu2Frm.Create(Self);
//    try
//      frm2.ListView1.PopupMenu := PopupMenu_SelectDevs;
//      FListView_SelectDevs := frm2.ListView1;
//      Add_A_Device;
//      frm2.ShowModal;
//    finally
//      frm2.Free;
//    end;
//  end
//  else
//  begin
//    frm := TCancelOrderMenuFrm.Create(Self);
//    try
//      frm.ListView1.PopupMenu := PopupMenu_SelectDevs;
//      FListView_SelectDevs := frm.ListView1;
//      Add_A_Device;
//      frm.ShowModal;
//    finally
//      frm.Free;
//    end;
//  end;

end;

procedure TMainf.AddDeviceByGroup;
var
  Dev: TDevice;
  i: integer;
  grp: TDevGroup;
begin
  if FListView_SelectDevs = nil then exit;
  FListView_SelectDevs.Clear;
  if GCurSelectGroupID = -1 then
  begin
    for i := 0 to ADeviceManage.Count - 1 do
      with FListView_SelectDevs.Items.Add do
      begin
        caption := ADeviceManage.Items[i].Car.No;
        data := ADeviceManage.Items[i];
      end;
  end
  else if GCurSelectGroupID >= 0 then
  begin
    grp := ADevGroupManage.find(GCurSelectGroupID);
    if grp = nil then exit;
    for i := 0 to grp.DevListCount - 1 do
    begin
      dev := ADeviceManage.Find(grp.DevList[i]);
      if dev = nil then continue;
      with FListView_SelectDevs.Items.Add do
      begin
        caption := dev.Car.No;
        data := dev;
      end;
    end;
  end;
end;

procedure TMainf.fun_Devs_CancelOrderMenuExecute(Sender: TObject);
//var
//  Frm: TCancelOrderMenuFrm;
begin
//  frm := TCancelOrderMenuFrm.Create(Self);
//  try
//    frm.ListView1.PopupMenu := PopupMenu_SelectDevs;
//    FListView_SelectDevs := frm.ListView1;
//    AddDeviceByGroup;
//    frm.ShowModal;
//  finally
//    frm.Free;
//  end;   
end;

procedure TMainf.Add_A_Device;
begin
  if FListView_SelectDevs = nil then exit;
  if GCurSelectDev = nil then exit;
  FListView_SelectDevs.Clear;
  with FListView_SelectDevs.Items.Add do
  begin
    caption := GCurSelectDev.Car.No;
    data := GCurSelectDev;
  end;
end;

procedure TMainf.AddDeviceFromListSelectDev;
var
  i: integer;
  Dev: TDevice;
begin
  if FListView_SelectDevs = nil then exit;
  if ListSelectDev.Count = 0 then exit;
  FListView_SelectDevs.Clear;
  for i := 0 to ListSelectDev.Count - 1 do
    with FListView_SelectDevs.Items.Add do
    begin
      dev := TDevice(ListSelectDev.Items[i].Data);
      caption := dev.Car.No;
      data := dev;
    end;
end;


function TMainf.SetDatetime: boolean;
var
  Datetime: TSystemTime;
  ServDatetime: TDatetime;
begin
  ServDatetime := bs.GetDatetime;
  if ServDatetime <> now then
  begin
    Datetime.wYear := yearof(ServDatetime);
    Datetime.wMonth := monthof(ServDatetime);
    datetime.wDay := Dayof(ServDatetime);
    Datetime.wHour := hourof(ServDatetime);
    Datetime.wMinute := minuteof(ServDatetime);
    Datetime.wSecond := Secondof(ServDatetime);
    Datetime.wMilliseconds := Millisecondof(ServDatetime);
    //SetSystemtime(Datetime);
    SetLocalTime(Datetime);
  end;
  Result := true;
end;

procedure TMainf.cxSplitter1CanResize(Sender: TObject;
  var NewSize: Integer; var Accept: Boolean);
begin
  Accept := false;
end;


procedure TMainf.SplitterRightAfterOpen(Sender: TObject);
begin
  show_car.Checked := not show_car.Checked;
end;

procedure TMainf.PopupMenu_DevGroupPopup(Sender: TObject);
begin
  ListSelectDev.Clear;
end;

procedure TMainf.Sel_Dev_EmptyExecute(Sender: TObject);
begin
  SelectDevFromListSelectDev(9, false); //第九位,false为空车;
end;

procedure TMainf.SelectDevFromListSelectDev(State: integer; Sel: boolean);
var
//  dev:TDevice;
  i: integer;
//  SendOrderFrm: TSendOrderMiniFrm;
begin
//  SendOrderFrm := GetFocusSendOrderFrm;
  i := 0;
  ListSelectDev.BeginUpdate;
  while i < ListSelectDev.Count do
  begin
    if TDevice(ListSelectDev.Items[i].Data).Switch[State] <> Sel then
    begin
      ListSelectDev.Items[i].Delete;
//      if SendOrderFrm <> nil then
//      begin
//        if SendOrderFrm.ListView1.Items.Count > i then
//        begin
//          SendOrderFrm.ListView1.Items.Item[i].Delete;
//        end;
//      end;
    end
    else
    begin
      inc(i);
    end;
  end;
  ListSelectDev.EndUpdate;
end;

procedure TMainf.Sel_Dev_FullExecute(Sender: TObject);
begin
  SelectDevFromListSelectDev(9, true); //第九位,true为重车;
end;

procedure TMainf.Sel_Dev_OnlineExecute(Sender: TObject);
var
  dev: TDevice;
  i: integer;
begin
  i := 0;
  ListSelectDev.BeginUpdate;
  while i < ListSelectDev.Count do
  begin
    Dev := TDevice(ListSelectDev.Items[i].Data);
    if Dev = nil then
    begin
      ListSelectDev.Items[i].Delete;
      continue;
    end;
    if not Dev.isOnline then //  >是不在线
    begin
      ListSelectDev.Items[i].Delete;
    end
    else
    begin
      inc(i);
    end;
  end;
  ListSelectDev.EndUpdate;
end;


procedure TMainf.Sel_Dev_PostionExecute(Sender: TObject);
begin
  Sel_Dev_Online.Execute; //删除不定位.然后再选定位的.因为,定位的必须在线....
  SelectDevFromListSelectDev(0, False); //第0位,true定位;
end;

procedure TMainf.Sel_Dev_Not_OnlineExecute(Sender: TObject);
var
  dev: TDevice;
  i: integer;
begin
  i := 0;
  ListSelectDev.BeginUpdate;
  while i < ListSelectDev.Count do
  begin
    Dev := TDevice(ListSelectDev.Items[i].Data);
    if Dev = nil then
    begin
      ListSelectDev.Items[i].Delete;
      continue;
    end;
    if Dev.isOnline then //  <是在线
      ListSelectDev.Items[i].Delete
    else
      inc(i);
  end;
  ListSelectDev.EndUpdate;
end;


procedure TMainf.Sel_Dev_Not_PostionExecute(Sender: TObject);
begin
  SelectDevFromListSelectDev(0, True); //第0位,false非定位;
end;

procedure TMainf.SplitterBottomBeforeOpen(Sender: TObject;
  var AllowOpen: Boolean);
begin
  //
end;

procedure TMainf.isOnline;
var
  i: integer;
  onlineCount: integer;
  devGroup: TDevGroup;
  dev: TDevice;
  AllOnLineCount: Integer;
begin
  if not FIsDevOnLineChanged then
    Exit;
  onlineCount := 0;
  try
    AllOnLineCount := 0;
    for i := 0 to ADeviceManage.Count - 1 do
    begin
      dev := ADeviceManage.Items[i];
      if dev.isOnline then
        Inc(AllOnLineCount);
    end;

    ValueListEditorOnline.Values['总车'] := IntToStr(ADeviceManage.Count);
    ValueListEditorOnline.Values['在线'] := IntToStr(AllOnLineCount);
    ValueListEditorOnline.Values['不在线'] := IntToStr(ADeviceManage.Count - AllOnLineCount);
    if ADeviceManage.Count > 0 then
      ValueListEditorOnline.Values['在线率'] := FormatFloat('0.00', AllOnLineCount/ADeviceManage.Count * 100) + '%'
    else
      ValueListEditorOnline.Values['在线率'] := '0.00%';

    if GlobalParam.isAllCarUnOnlineAlarm then
    begin
      if onlineCount = 0 then
      begin
        if FileExists(GlobalParam.AlarmSound_CarUnOnline) then
          try
            MediaPalySound(GlobalParam.AlarmSound_CarUnOnline);
            //PlaySound(Pchar(GlobalParam.AlarmSound_CarUnOnline), Hinstance, SND_FILENAME)
          except
          end;
      end;
    end;

    if GCurSelectGroupID <= 0 then
    begin
      ValueListEditorOnlineByGroup.Values[' 当前组名称'] := '所有车辆';
      ValueListEditorOnlineByGroup.Values[' 当前组总车'] := IntToStr(ADeviceManage.Count);
      ValueListEditorOnlineByGroup.Values[' 当前组在线'] := IntToStr(AllOnLineCount);
      ValueListEditorOnlineByGroup.Values[' 当前组不在线'] := IntToStr(ADeviceManage.Count - AllOnLineCount);
      if ADeviceManage.Count > 0 then
        ValueListEditorOnlineByGroup.Values[' 当前组在线率'] := FormatFloat('0.00', AllOnLineCount/ADeviceManage.Count * 100) + '%'
      else
        ValueListEditorOnlineByGroup.Values[' 当前组在线率'] := '0.00%';
    end
    else
    begin
      devGroup := ADevGroupManage.find(GCurSelectGroupID);
      if devGroup <> nil then
      begin
        onlineCount := 0;
        for i := 0 to devGroup.DevListCount - 1 do
        begin
          dev := ADeviceManage.find(devGroup.DevList[i]);
          if dev.isOnline then
          begin
            inc(onlineCount);
          end
        end;
        ValueListEditorOnlineByGroup.Values[' 当前组名称'] := devGroup.Name;
        ValueListEditorOnlineByGroup.Values[' 当前组总车'] := IntToStr(devGroup.DevListCount);
        ValueListEditorOnlineByGroup.Values[' 当前组在线'] := IntToStr(onlineCount);
        ValueListEditorOnlineByGroup.Values[' 当前组不在线'] := IntToStr(devGroup.DevListCount - onlineCount);
        if devGroup.DevListCount > 0 then
          ValueListEditorOnlineByGroup.Values[' 当前组在线率'] := FormatFloat('0.00', onlineCount/devGroup.DevListCount * 100) + '%'
        else
          ValueListEditorOnlineByGroup.Values[' 当前组在线率'] := '0.00%';
      end
      else
      begin
        ValueListEditorOnlineByGroup.Values[' 当前组名称'] := '';
        ValueListEditorOnlineByGroup.Values[' 当前组总车'] := '';
        ValueListEditorOnlineByGroup.Values[' 当前组在线'] := '';
        ValueListEditorOnlineByGroup.Values[' 当前组不在线'] := '';
        ValueListEditorOnlineByGroup.Values[' 当前组在线率'] := '';
      end;    
    end;
    FIsDevOnLineChanged := False;
  except on E: Exception do
      uGloabVar.SystemLog.AddLog(' TMainf.isOnline函数报错: ', e.Message);
  end;
end;

procedure TMainf.OnCarActionClick(Dev: TDevice);
var
  Str: string;
  Group: TDevGroup;
begin
  try
    Str := '车牌号　　　:' + Dev.Car.No;
    if dev.Car.ZBH <> '' then
      str := Str + #13#10 + '车辆自编号  :' + Dev.Car.ZBH;

    Str := str + #13 + #10 + '设备编号　　:' + Dev.Id;
    if Dev.Login_DriverName <> '' then
      Str := str + #13 + #10 + '司机姓名 　 :' + Dev.Login_DriverName;
  //Str:=str+#13+#10+'司机　　:'+Dev.DriverTel;
    Group := ADevGroupManage.Find(Dev.GroupID);
    if Group <> nil then
      Str := str + #13 + #10 + '分组　　　　:' + Group.name;
    Str := str + #13 + #10 + 'ＳＩＭ卡号　:' + Dev.SimNo;
    Str := Str + #13 + #10 + #13 + #10;
//------------------------------------------------------------------------------
    if Dev.ShengName <> '' then
    begin
      Str := Str + '地点　　　　:' + Dev.ShengName;
      if dev.ShengName <> dev.ShiName then
      begin
        Str := Str + '->' + Dev.ShiName;
      end;
      if dev.ShiName <> Dev.XianName then
      begin
        Str := Str + '->' + Dev.XianName;
      end;
      Str := Str + #13 + #10;
    end;

    if Dev.isOnline then //判断状态
    begin
      Str := Str + '状态　　　　:在线';
      //if Dev.Switch[4] then
      //  Str := str + #13 + #10 + 'ＧＰＳ状态　:休眠'
      //else
      //begin
        if Dev.Switch[STAT_GPS_LOCATE] then
          Str := str + #13 + #10 + 'ＧＰＳ状态　:定位'
        else
          Str := str + #13 + #10 + 'ＧＰＳ状态　:非定位';
      //end;
    end
    else
    begin
      //if Dev.Switch[4] then
      //  Str := str + '状态　　　　:不在线' + #13 + #10 + 'ＧＰＳ状态　:休眠'
      //else
        Str := Str + '状态　　　　:不在线' + #13 + #10 + 'ＧＰＳ状态　:非定位';
    end;
//------------------------------------------------------------------------------
    Str := str + #13 + #10 + '速度　　　　:' + FormatFloat('##0.0', Dev.Speed/10); {intToStr(Dev.Speed) //ls};
    Str := str + #13 + #10 + '经度　　　　:' + FormatFloat('##0.000000', Dev.Longitude);
    Str := str + #13 + #10 + '纬度　　　　:' + FormatFloat('##0.000000', Dev.Latitude);
    if Dev.GpsTime <> 0 then
    begin
      Str := str + #13 + #10 + 'ＧＰＳ时间　:' + FormatDatetime('yyyy-mm-dd hh:nn:ss', Dev.GpsTime);
    end
    else
    begin
      Str := str + #13 + #10 + 'ＧＰＳ时间　:'
    end;

    Str := str + #13 + #10;
    if (ListSelectDev.Count > 0) then
    begin
      MapLabel.PopupMenu := PopupMenuSelected;
      PageControl1.ActivePageIndex := 1;
      Str := Str + #13 + #10 + '提示　　　　:' + '右击可对选中车辆群发命令';
    end
    else
    begin
      MapLabel.PopupMenu := PopupMenu_funDev;
      PageControl1.ActivePageIndex := 0;
      Str := Str + #13 + #10 + '提示　　　　:' + '右击可对此车发送命令';
    end;


    MapLabel.Hint := Str;

    if GCurSelectDev = Dev then exit;
    GCurSelectDev := Dev;
    Edit2.Text := GCurSelectDev.Id;
    Edit1.Text := GCurSelectDev.Car.No;
    ComboboxCarNO.Text := Edit1.Text;

  except on E: Exception do
      uGloabVar.SystemLog.AddLog(' TMainf.OnCarActionClick函数报错: ', e.Message);
  end;

end;

procedure TMainf.Timer1Timer(Sender: TObject);
var
  P: Tpoint; // ,pp
  x, y: integer;
  DX, DY: integer;
  CaptureControl: TControl;
  XY: integer;
  Dev: TDevice;
begin
  AddLog('Timer1Timer Start');
  try
    if FMap.IsPlayGpsData then exit;
    if ADeviceManage.CurrentDevOnTheMapIsUse then exit;
    if not (FMap.MouseAction in [actNoAction, actMove, actRectSelect]) then exit;
    if EarthRect.isCanUse then
    begin
      if ListSelectDev.Count > 0 then
      begin
        if (Lo > EarthRect.SX) and (Lo < EarthRect.EX) and (La > EarthRect.SY) and (La < EarthRect.EY) then
        begin
          FMap.Hint := '提示:' + #13 + #10 + '　　选中' + intToStr(ListSelectDev.Count) + '辆车' + #13 + #10;
          FMap.Hint := FMap.Hint + '　　右击可对选中车辆群发命令';
          FMap.ShowHint := true;
          exit;
        end;
      end
      else
      begin
        EarthRect.isCanUse := false;
      end;
    end;
    FMap.PopupMenu := nil;
    FMap.ShowHint := false;

    GetCursorPos(p);
    CaptureControl := FindDragTarget(P, True);
    if CaptureControl <> nil then
    begin
      if CaptureControl.Name <> 'FMap' then exit;
    end
    else
    begin
      exit;
    end;

    if Self.WindowState = wsMaximized then
    begin
      x := p.X;
      y := p.Y;
    end
    else if Self.WindowState = wsNormal then
    begin
      x := p.X - Self.Left - 4;
      y := p.Y - Self.Top - 4;
    end
    else
    begin
      exit;
    end;
    x := X - panel10.Left;
    y := Y - panel10.Top;

    x := x - FDlg_Map.Panel_Map.Left;
    y := Y - FDlg_Map.Panel_Map.Top;

    x := x - FDlg_Map.Panel_Map.Left;
    y := y - FDlg_Map.Panel_Map.Top - 38;

    xy := (X shl 16) + Y;

    Dev := ADeviceManage.FindDevOnTheMap(XY, DX);
    if Dev = nil then
    begin
//    HintWindowClass:=THintWindow;
      Application.HintPause := 500;
      MapLabel.Hide;
      exit;
    end;
    DY := DX and $FFFF;
    DX := DX shr 16;
    if ((DX >= X) and (DX <= (X + 16))) and ((DY >= Y) and (Dy <= (Y + 16))) then
    begin
      MapLabel.Left := DX - 8;
      MapLabel.Top := DY - 8;
      OnCarActionClick(Dev);
      Application.HintPause := 0;
  // HintWindowClass:=THintWin;
      MapLabel.Show;
    end
    else
    begin
//  HintWindowClass:=THintWindow;
      Application.HintPause := 500;
      MapLabel.Hide;
    end;
    addLog('Timer1Timer end');
  except on E: Exception do
      uGloabVar.SystemLog.AddLog(' TMainf.Timer1Timer函数报错: ', e.Message);
  end;
end;

procedure TMainf.OnMapLabelMouseMove(Shift: TShiftState; X, Y: Integer);
var
  DX, DY: integer;
  XY: integer;
  Dev: TDevice;
begin
  try

    if not timer1.Enabled then exit;
    if ADeviceManage.CurrentDevOnTheMapIsUse then exit;
    if not (FMap.MouseAction in [actNoAction, actMove, actRectSelect]) then exit;

    if EarthRect.isCanUse then
    begin
      if ListSelectDev.Count > 0 then
      begin
        if (Lo > EarthRect.SX) and (Lo < EarthRect.EX) and (La > EarthRect.SY) and (La < EarthRect.EY) then
        begin
          FMap.PopupMenu := PopupMenuSelected;

          FMap.Hint := '提示:' + #13 + #10 + '　　选中' + intToStr(ListSelectDev.Count) + '辆车' + #13 + #10;
          FMap.Hint := FMap.Hint + '　　右击可对选中车辆群发命令';
          FMap.ShowHint := true;
          exit;
        end;
      end
      else
      begin
        EarthRect.isCanUse := false;
      end;
    end;
    FMap.PopupMenu := nil;
    FMap.ShowHint := false;

    xy := (X shl 16) + Y;
    Dev := ADeviceManage.FindDevOnTheMap(XY, DX);
    if Dev = nil then
    begin
  //   HintWindowClass:=THintWindow;
      Application.HintPause := 500;
      MapLabel.Hide;
      exit;
    end;
    DY := DX and $FFFF;

    DX := DX shr 16;
    if ((DX >= X - 32) and (DX <= (X + 32))) and ((DY >= Y - 32) and (Dy <= (Y + 32))) then
    begin
      MapLabel.Left := DX - 8;
      MapLabel.Top := DY - 8;
      OnCarActionClick(Dev);
      Application.HintPause := 0;
  //  HintWindowClass:=THintWin;
      MapLabel.Show;
    end
    else
    begin
      Application.HintPause := 500;
  //    HintWindowClass:=THintWindow;
      MapLabel.Hide;
    end;

  except on E: Exception do
      uGloabVar.SystemLog.AddLog(' TMainf.OnMapLabelMouseMove函数报错: ', e.Message);
  end;
end;

procedure TMainf.GetMapRectSelect_Rect(PointA, PointB: TEarthPoint);
begin
  if (PointA.x < PointB.x) then
  begin
    EarthRect.SX := PointA.x; //SX为开始X点(Strat) ,EX为结束X点(end).
    EarthRect.EX := PointB.x;
  end
  else
  begin
    EarthRect.SX := PointB.x;
    EarthRect.EX := PointA.X;
  end;

  if (PointA.y < PointB.y) then
  begin
    EarthRect.SY := PointA.y; //SY为开始Y点(Strat) ,EY为Y结束点(End)
    EarthRect.EY := PointB.y;
  end
  else
  begin
    EarthRect.SY := PointB.y;
    EarthRect.EY := PointA.y;
  end;
  EarthRect.isCanUse := true;
end;


procedure TMainf.FShowStateEvent(Sender: TObject; State: TState);
begin

end;



procedure TMainf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  FCallClient.StopWork;
  DisposeCar.StopDispose;
  terminateGetHisThread;
end;

procedure TMainf.SystemConfigExecute(Sender: TObject);
var
  frm: TSystemConfigFrm;
begin
  frm := TSystemConfigFrm.Create(nil);
  try
    frm.ShowModal;
    if frm.ModalResult = mrOK then
    begin
//      if messagebox(handle, '上述参数设置成功!是否要注销？', '提示', MB_YESNO + MB_ICONQUESTION) = ID_YES then
//        sys_off.Execute;
    end;
  finally
    frm.Free;
  end;
end;

procedure TMainf.fun_DevHideExecute(Sender: TObject);
begin
  if GCurSelectDev <> nil then
  begin
    GCurSelectDev.Hide := not GCurSelectDev.Hide;
    fun_DevHide.Checked := GCurSelectDev.Hide;
    HindOrShowACar(GCurSelectDev.Id, GCurSelectDev.Hide);
    //FMap.DrawGpsMap_ClearDraw;
  end;
end;

procedure TMainf.fun_Devs_ShowExecute(Sender: TObject);
var
  Dev: TDevice;
  i: integer;
  grp: TDevGroup;
begin
  if GCurSelectGroupID >= 0 then
  begin
    grp := ADevGroupManage.find(GCurSelectGroupID);
    if grp = nil then exit;
    for i := 0 to grp.DevListCount - 1 do
    begin
      dev := ADeviceManage.Find(grp.DevList[i]);
      if dev = nil then continue;
      dev.Hide := false;
    end;
    FMap.DrawGpsMap_ClearDraw;
  end;
end;


procedure TMainf.fun_Devs_HideExecute(Sender: TObject);
var
  Dev: TDevice;
  i: integer;
  grp: TDevGroup;
begin
  if GCurSelectGroupID >= 0 then
  begin
    grp := ADevGroupManage.find(GCurSelectGroupID);
    if grp = nil then exit;
    for i := 0 to grp.DevListCount - 1 do
    begin
      dev := ADeviceManage.Find(grp.DevList[i]);
      if dev = nil then continue;
      dev.Hide := true;
    end;
    FMap.DrawGpsMap_ClearDraw;
  end;
end;


procedure TMainf.Hot_zoom_inExecute(Sender: TObject);
begin
  FMap.ZoomInOut(1, FMap.DrawCood.WorldRect.Left,
    FMap.DrawCood.WorldRect.Top,
    FMap.DrawCood.WorldRect.Right,
    FMap.DrawCood.WorldRect.Bottom
    );
end;

procedure TMainf.Hot_zoom_outExecute(Sender: TObject);
begin
  FMap.ZoomInOut(0, FMap.DrawCood.WorldRect.Left,
    FMap.DrawCood.WorldRect.Top,
    FMap.DrawCood.WorldRect.Right,
    FMap.DrawCood.WorldRect.Bottom
    );
end;

procedure TMainf.Hot_zoom_in2Execute(Sender: TObject);
begin
  Hot_zoom_out.Execute;
end;

procedure TMainf.Hot_zoom_out2Execute(Sender: TObject);
begin
  Hot_zoom_in.Execute;
end;

procedure TMainf.FormShow(Sender: TObject);
var
  pr: TPrivilege;
  temp: string;
begin
  try
    if FIsTerminated then
    begin
      Exit;
    end;
    Hot_zoom_in.ShortCut := 16571;
    Hot_zoom_Out.ShortCut := 16573;
    Hot_zoom_in2.ShortCut := 16576;
    Hot_zoom_Out2.ShortCut := 16433;
    Hot_Left.ShortCut := 16421;
    Hot_Right.ShortCut := 16423;
    Hot_Up.ShortCut := 16422;
    Hot_Down.ShortCut := 16424;
    //FMap.SetFocus;
    if DataServer <> nil then
      DataServer.SendRegUser := SendRegUser;

    SplitterRight.CloseSplitter;
    FFlashDlg.SetLabel('打开系统中...');
    FFlashDlg.Gauge1.AddProgress(1);
    resetScrollPanel;
    RzLabel1.Caption := '';
    RzLabel1.Top := Panel6.Top;
    RzLabel1.Height := Panel6.Height;
    RzLabel1.Left := Panel6.Width;

    LoadCityList;    // liusen
    while not FIsMapConfigLoaded do
      Continue;
    Timer.Enabled := true;
    //timer1.Enabled := true; 针对老版地图，这里停用
    TimerCheckUpdate.Enabled := True;
    timerSendInfo.Enabled := True;

    //接收网关的数据自formshow以后开始，否则数据量太大，无法进入主界面
    DataServer.Active := True;
    FDlg_BSMap.Timer1.Enabled := True;
    DisposeCar.StartDispose;
  finally
    FFlashDlg.Hide;
  end;
end;

procedure TMainf.Hot_LeftExecute(Sender: TObject);
var
  x, y: integer;
begin
  x := 0;
  y := 0;
  FMap.Move(x, y, x + MOVE_NUM, y);
  FMap.Option := FMap.Option + [mpAllowDraw];
  FMap.RefreshScreenBitmap;
end;

procedure TMainf.Hot_RightExecute(Sender: TObject);
var
  x, y: integer;
begin
  x := 0;
  y := 0;
  FMap.Move(x, y, x - MOVE_NUM, y);
  FMap.Option := FMap.Option + [mpAllowDraw];
  FMap.RefreshScreenBitmap;
end;

procedure TMainf.Hot_UpExecute(Sender: TObject);
var
  x, y: integer;
begin
  x := 0;
  y := 0;
  FMap.Move(x, y, x, y + MOVE_NUM);
  FMap.Option := FMap.Option + [mpAllowDraw];
  FMap.RefreshScreenBitmap;
end;

procedure TMainf.Hot_DownExecute(Sender: TObject);
var
  x, y: integer;
begin
  x := 0;
  y := 0;
  FMap.Move(x, y, x, y - MOVE_NUM);
  FMap.Option := FMap.Option + [mpAllowDraw];
  FMap.RefreshScreenBitmap;
end;

procedure TMainf.OnMapMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  timer1.Enabled := false;

end;

procedure TMainf.OnMapMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  px, py: integer;
  mapNode: TMapNode;
begin
  timer1.Enabled := true;
  FDlg_Map.SetFocus;
  if Sender is TGpsMap then
  begin
    if TGpsMap(Sender).DrawCood.Scale > 650 then exit;
    if not (TGpsMap(Sender).MouseAction in [actMove, actZoomIn]) then exit;
    TGpsMap(Sender).XYTOWorldPoint(FMap.Width div 2, FMap.Height div 2, px, py);

    ADeviceManage.FindMapName(FMouseDev, Point(px, py));

    mapNode := MapManger.Find(FMouseDev.XianName);
    if MapNode <> nil then
    begin
        //ShowMessage('TMainf.OnMapMouseUp');
      ChangeMap(mapNode, True, True);
        //ShowMessage('TMainf.OnMapMouseUp');
      exit;
    end;
    if FMouseDev.ShiName <> FMouseDev.XianName then
    begin
      mapNode := MapManger.Find(FMouseDev.ShiName);
      if MapNode <> nil then
      begin
         // ShowMessage('TMainf.OnMapMouseUp');
        ChangeMap(mapNode, True, True);
          //ShowMessage('TMainf.OnMapMouseUp');
        exit;
      end;
    end;
    mapNode := MapManger.Find(FMouseDev.ShengName);
    if MapNode <> nil then
    begin
      ChangeMap(mapNode, True, True);
      exit;
    end;
  end;
end;

procedure TMainf.Map_AddNodeExecute(Sender: TObject);
var
  MapNode: TMapNode;
  treeNode, sNode: TTreeNode;
  s: string;
begin
  sNode := FDlg_Map.TreeViewMap.Selected;
  if sNode <> nil then
  begin
    s := InputBox('输入', '请输入一个地区的名字:', '');
    if s = '' then exit;
    if sNode.Data <> nil then
    begin
      MapNode := TMapNode(sNode.Data);
      MapNode := MapNode.AddChildNode(s);
      treeNode := FDlg_Map.TreeviewMap.Items.AddChild(sNode, MapNode.Name);
      treeNode.Data := MapNode;
      sNode.Expand(true);
      Map_Save.Execute;
    end;
  end;
end;

procedure TMainf.Map_SaveExecute(Sender: TObject);
var
  i, j, n: Integer;
  m: IMap;
  lay: ILayer;
  MapNode: TMapNode;
  ppLayerCfg: PLayerCfg;
  s: string;
begin
  if MapManger.CurrentNode <> nil then
    MapNode := MapManger.CurrentNode
  else
    MapNode := MapManger.RootNode;
  MapNode.OutBox := FMap.DrawCood.WorldRect;
  MapNode.LayerCfgManager.Clear;
  m := TMapCtrl.Create(FMap);
  i := 0; //
  j := i; //
  n := FMap.Layers.Count - 1; //
  while j <= n do
  begin
    lay := m.GetLayer(i);
    if lay.isHaveNotDelete then
    begin
      i := i + 1; //
      n := n - 1; //
      Continue;
    end;
    if FMap.Layers.Layer[i].Data.FileName = '' then
    begin
      i := i + 1; //
      n := n - 1; //
      Continue;
    end;
    s := ExtractRelativePath(Application.ExeName, FMap.Layers.layer[i].Data.FileName);
    if s = '' then Continue;
    ppLayerCfg := MapNode.LayerCfgManager.AddLayerCfg(s);
    ppLayerCfg^.Visible := lay.IsVisible;
    ppLayerCfg^.Selected := lay.IsSelected;
    ppLayerCfg^.MetaLimit := lay.IsMetaIgnore;
    ppLayerCfg^.ShowLabel := lay.IsShowLabel;
    ppLayerCfg^.LabelField := lay.GetlabelValue;
    ppLayerCfg^.ScaleLimit := lay.IsLayerIgnore;
    ppLayerCfg^.MinScale := lay.GetLayerMinScale;
    ppLayerCfg^.MaxScale := lay.GetLayerMaxScale;
    ppLayerCfg^.OutBox := FMap.Layers.Layer[i].Outbox;
    ppLayerCfg^.MapFont.Name := FMap.Layers.Layer[i].LabelFont.FontName;
    ppLayerCfg^.MapFont.Size := FMap.Layers.Layer[i].LabelFont.Size;
    ppLayerCfg^.MapFont.Color := FMap.Layers.Layer[i].LabelFont.ForeColor;
    ppLayerCfg^.LayOrder := j;
    lay := nil;
    i := i + 1; //
    j := j + 1; //
  end;
  m := nil;
  MapManger.SaveFile(ExePath + 'MapConfig.xml');
end;

procedure TMainf.Map_DelNodeExecute(Sender: TObject);
var
  TreeNode: TTreeNode;
  MapNode: TMapNode;
begin
//
  TreeNode := FDlg_Map.TreeViewMap.Selected;
  if TreeNode = nil then exit;
  if messagebox(handle, PChar('您确定要删除' + TreeNode.Text), '提示', MB_OKCANCEL + MB_ICONQUESTION) = ID_CANCEL then exit;
  if TreeNode.Data <> nil then
  begin
    MapNode := TMapNode(TreeNode.Data);
    if MapNode = MapManger.CurrentNode then
    begin
      MessageBox(Self.Handle, '不能删除当前地图结点!', '提示', MB_ICONINFORMATION);
      exit;
    end;

    if MapNode.ChildNodeCount <= 0 then
    begin
      MapNode.ParentNode.DelChildNode(MapNode);
      TreeNode.Delete;
    end
    else
    begin
      MessageBox(Self.Handle, '只能删除子结点!', '提示', MB_ICONINFORMATION);
    end;
  end
  else
  begin
    if TreeNode.Parent.Data <> nil then
    begin
      MapNode := TMapNode(TreeNode.Parent.Data);
      MapNode.LayerCfgManager.DelLayerCfg(TreeNode.Text);
      TreeNode.Delete;
    end;
  end;

end;

procedure TMainf.Map_Set_DefaultNodeExecute(Sender: TObject);
var
  TreeNode: TTreeNode;
  MapNode: TMapNode;
begin
  TreeNode := FDlg_BSMap.TreeViewMap.Selected;  // liusen
  if TreeNode <> nil then
  begin
    if TreeNode.Data <> nil then
    begin
      MapNode := TMapNode(TreeNode.Data);
      MapManger.SetDefaultNode(MapNode);
      MapManger.ShowToTreeView(FDlg_BSMap.TreeViewMap, FDlg_BSMap.CheckBoxIsShowFile.Checked);
      FDlg_BSMap.StatusBar1.Panels.Items[0].Text := '默认显示地图:' + MapManger.DefaultNode.Name;
      Map_Save.Execute;
    end
    else
    begin
      MessageBox(Self.Handle, '请选择一个地区的名字!', '提示', MB_ICONINFORMATION);
    end;
  end;
end;

procedure TMainf.TreeViewMapContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
var
  Node: TTreeNode;
begin
  Node := FDlg_Map.TreeViewMap.GetNodeAt(MousePos.X, MousePos.y);
  if Node <> nil then
    Node.Selected := true;
end;


procedure TMainf.Map_ReflashExecute(Sender: TObject);
begin
  Map_Save.Execute;
  MapManger.ShowToTreeView(FDlg_Map.TreeViewMap, FDlg_Map.CheckBoxIsShowFile.Checked);
  FDlg_Map.StatusBar1.Panels.Items[0].Text := '默认显示地图:' + MapManger.DefaultNode.Name;
end;

procedure TMainf.ChangeMap(MapNode: TMapNode; ifCurNode: boolean; ifAutoScale: boolean);
var
  dlg: TFrmRefreshProgress;
//  TreeNode:TTreeNode;
  i, count: integer;
  OutBox: TWorldRect;
  beginDatetime: TDatetime;
begin
  if MapNode <> nil then
  begin
       { if HisForm<>nil then
        begin
          if HisForm.Showing then
          begin
            MessageBox(Self.Handle,PChar('关闭轨迹回放窗口,才可以切换地图'),PChar('提示'),MB_ICONQUESTION);
            exit;
          end;
          HisForm.Free;
          HisForm:=nil;
        end;  }

    if (MapNode = MapManger.CurrentNode) and (ifCurNode) then exit;
    dlg := TFrmRefreshProgress.Create(Self);
        //dlg.Show;
    dlg.Caption := '载出地图';
    dlg.Label1.Caption := '正在载出地图,请稍等....';
    try
      i := 0;
      OutBox := FMap.DrawCood.WorldRect;
      count := FMap.Layers.Count;
          //载出地图

      while i < FMap.Layers.Count do //
      begin
        beginDatetime := now;
        dlg.Gauge1.AddProgress(trunc(100 * (1 / count)));
        if not FMap.Layers.Layer[i].isHaveNotDelete then
        begin
          FMap.Layers.Layer[i].Data.Close
        end
        else
        begin
          i := i + 1;
        end;
        if MilliSecondsBetween(now, beginDatetime) > 500 then
          dlg.Show;
      end;
      dlg.Caption := '载入地图';
      dlg.Label1.Caption := '正在载入地图,请稍等....';
      dlg.Gauge1.Progress := 0;
      if ifAutoScale then
        OpenWSAutoScale(MapNode, dlg.Gauge1, OutBox)
      else
        OpenWS(MapNode, dlg.Gauge1);

      FMap.Layers.SetOrder(ADeviceManage.ShengLayer, FMap.Layers.Count - 1);
      FMap.Layers.SetOrder(ADeviceManage.ShiLayer, FMap.Layers.Count - 2);
      FMap.Layers.SetOrder(ADeviceManage.XianLayer, FMap.Layers.Count - 3);
      FMap.Layers.SetOrder(ADeviceManage.Road, FMap.Layers.Count - 4);
      {2011-12-02
      FMap.Layers.SetOrder(drawlayer, 0); //dxf 移GPS图层到第0层。
      FMap.Layers.SetOrder(TextLayer, 1);
      FMap.Layers.SetOrder(userDrawLayer, 2);
      FMap.Layers.SetOrder(AlarmNoSybolLayer, 3);   //设置到车机中的电子围栏  }
      //FMap.Layers.SetOrder(BetonBuildSiteDrawLayer,4);
          //FMap.Zoom(OutBox);
          //FMap.Draw;
    finally
      dlg.Free;
    end;
  end;
end;

procedure TMainf.TreeViewMapDblClick(Sender: TObject);
var
  TreeNode: TTreeNode;
begin
  TreeNode := FDlg_Map.TreeViewMap.Selected;
  if TreeNode <> nil then
  begin
    ChangeMap(TMapNode(TreeNode.Data));
    FMap.Draw;
  end;
end;

procedure TMainf.CheckBoxIsShowFileClick(Sender: TObject);
begin
  MapManger.ShowToTreeView(FDlg_Map.TreeViewMap, FDlg_Map.CheckBoxIsShowFile.Checked);
  FDlg_Map.StatusBar1.Panels.Items[0].Text := '默认显示地图:' + MapManger.DefaultNode.Name;
end;

procedure TMainf.Map_SaveAsNodeExecute(Sender: TObject);
var
  mapNode: TMapNode;
begin
  if FDlg_Map.TreeviewMap.Selected = nil then exit;
  if FDlg_Map.TreeviewMap.Selected.Data = nil then exit;
  mapNode := TMapNode(FDlg_Map.TreeviewMap.Selected.Data);
  SaveDialog1.FileName := mapNode.Name + '.xml';
  if SaveDialog1.Execute then
  begin

    MapManger.SaveFile(SaveDialog1.FileName, mapNode);
  end;
end;

procedure TMainf.Map_ImputNodeExecute(Sender: TObject);
var
  mapNode: TMapNode;
begin
  if FDlg_Map.TreeviewMap.Selected = nil then exit;
  if FDlg_Map.TreeviewMap.Selected.Data = nil then exit;
  mapNode := TMapNode(FDlg_Map.TreeviewMap.Selected.Data);
  if OpenDialog1.Execute then
  begin
    MapManger.LoadFile(OpenDialog1.FileName, mapNode);
    MapManger.ShowToTreeView(FDlg_Map.TreeViewMap, FDlg_Map.CheckBoxIsShowFile.Checked);

    ChangeMap(mapNode, False);
    FMap.Draw;
    //Map_Reflash.Execute;
  end;
end;

procedure TMainf.fun_SetDownTimeExecute(Sender: TObject);
var
  s: string;
begin
  s := InputBox('判断车机下线的时间(秒)', '判断车机下线的时间(秒)', IntToStr(GlobalParam.DownTime));
  if S <> '' then
  begin
    try
      GlobalParam.DownTime := StrToInt(s);
    except
      GlobalParam.DownTime := 300;
    end;
  end;
end;

procedure TMainf.fun_HistoryExecute(Sender: TObject);
var
  startDateTime, endDateTime: Tdatetime;
  dev: TDevice;
  dlg: TFrmRefreshProgress;
  i: integer;
  tmpSTime, tmpETime: TDateTime;
  isDataExist: Boolean;
  hour: Integer;
begin
  if not CheckDevId then exit;
  if GCurSelectDev = PlayDev then exit;
  SelectPlayGpsTimeForm := TSelectPlayGpsTimeForm.Create(Self);
  try
    SelectPlayGpsTimeForm.Edit1.Text := GCurSelectDev.Car.No;
    SelectPlayGpsTimeForm.Edit2.Text := GCurSelectDev.DispLabel;
    SelectPlayGpsTimeForm.Edit3.Text := GCurSelectDev.SimNo;
    SelectPlayGpsTimeForm.Edit4.Text := GCurSelectDev.IdStr;
    SelectPlayGpsTimeForm.Edit5.Text := ADevGroupManage.find(GCurSelectDev.GroupID).Name;
    SelectPlayGpsTimeForm.Edit6.Text := GCurSelectDev.Car.Memo;
    SelectPlayGpsTimeForm.start_date.Date := Date;
    SelectPlayGpsTimeForm.end_date.Date := Date;
    SelectPlayGpsTimeForm.end_time.Time := Time;

    SelectPlayGpsTimeForm.ShowModal;
    if SelectPlayGpsTimeForm.ModalResult = mrOk then
    begin
        //载入数据
      dlg := TFrmRefreshProgress.Create(Self);
      startDateTime := SelectPlayGpsTimeForm.start_date.DateTime;
      ReplaceTime(startDateTime, SelectPlayGpsTimeForm.start_time.Time);
      endDateTime := SelectPlayGpsTimeForm.end_date.DateTime;
      ReplaceTime(endDateTime, SelectPlayGpsTimeForm.end_time.Time);

      try
        try
          dlg.Label1.Caption := '载入GPS定位数据...';
          dlg.Show;
          SetActivePage(PageControlBottom, '轨迹回放');
          dev := GCurSelectDev;
          PlayDev.Id := dev.Id;
          PlayDev.IdStr := dev.IdStr;
          PlayDev.fact_id := dev.fact_id;
          PlayDev.GroupID := dev.GroupID;
          PlayDev.DispLabel := dev.DispLabel;
          PlayDev.SimNo := dev.SimNo;
          PlayDev.DriverNameTeL := dev.DriverNameTeL;

          //让轨迹回放可以实现区域报警
          playDev.AreaList.Clear;
          for i := 0 to dev.AreaList.Count - 1 do
          begin
            playDev.AreaList.Add(dev.AreaList.Items[i]);
          end;

          PlayDev.Car.Id := dev.Car.Id;
          PlayDev.Car.No := dev.Car.No;
          FDlg_HisForm.PlayDevChanged;
          startDateTime := SelectPlayGpsTimeForm.start_date.DateTime;
          ReplaceTime(startDateTime, SelectPlayGpsTimeForm.start_time.Time);
          endDateTime := SelectPlayGpsTimeForm.end_date.DateTime;
          ReplaceTime(endDateTime, SelectPlayGpsTimeForm.end_time.Time);
          dlg.Gauge1.AddProgress(2);
          Application.ProcessMessages;

          FDlg_HisForm.EditFromTime.Text := FormatDatetime('yyyy-mm-dd hh:nn:ss', startDatetime);
          FDlg_HisForm.EditToTime.Text := FormatDatetime('yyyy-mm-dd hh:nn:ss', endDateTime);

          dlg.Gauge1.AddProgress(2);
          Application.ProcessMessages;
          tmpSTime := startDateTime;
          tmpETime := endDateTime;

          isDataExist := False;

          //最多每3小时加载一次数据
          if tmpETime - tmpSTime <= 1/8 then
          begin//开始结束时间小于3小时，直接加载
            FDlg_HisForm.PlayFromServer(playDev.Id, tmpSTime, tmpETime);
            FDlg_HisForm.load_PlayInfo(tmpSTime, tmpETime, '服务器数据');
          end
          else//如果大于3小时
          begin
            tmpETime := IncSecond(IncDay(DateOf(tmpSTime), 1), -1);
            hour := HourOfTheDay(tmpSTime);
            if (hour >= 0) and (hour <= 2) then
            begin
              tmpETime := IncHour(tmpETime, - 21);
            end
            else if (hour >= 3) and (hour <= 5) then
            begin
              tmpETime := IncHour(tmpETime, - 18);
            end
            else if (hour >= 6) and (hour <= 8) then
            begin
              tmpETime := IncHour(tmpETime, - 15);
            end
            else if (hour >= 9) and (hour <= 11) then
            begin
              tmpETime := IncHour(tmpETime, -12);
            end
            else if (hour >= 12) and (hour <= 14) then
            begin
              tmpETime := IncHour(tmpETime, -9);
            end
            else if (hour >= 15) and (hour <= 17) then
            begin
              tmpETime := IncHour(tmpETime, -6);
            end
            else if (hour >= 18) and (hour <= 20) then
            begin
              tmpETime := IncHour(tmpETime, -3);
            end;

            FDlg_HisForm.PlayFromServer(playDev.Id, tmpSTime, tmpETime);
            if FDlg_HisForm.load_PlayInfo(tmpSTime, tmpETime, '服务器数据') > 0 then
            begin
              isDataExist := True;
            end
            else
            begin
              tmpSTime := IncSecond(tmpETime, 1);
              tmpETime := IncHour(tmpETime, 3);
              while tmpSTime < tmpETime do
              begin
                FDlg_HisForm.FTrackPlay.QueryHisData(playDev.Id, tmpSTime, tmpETime);
                if FDlg_HisForm.load_PlayInfo(tmpSTime, tmpETime, '服务器数据') > 0 then
                begin
                  isDataExist := True;
                  Break;
                end;
                tmpSTime := IncSecond(tmpETime, 1);
                tmpETime := IncHour(tmpETime, 3);
                if (tmpETime > endDateTime) then
                begin
                  tmpETime := endDateTime;
                end;  
              end;
            end;  
          end;

          dlg.Gauge1.AddProgress(2);
          Application.ProcessMessages;
          //FDlg_HisForm.LoadAllGpsData(dlg);
          dlg.Gauge1.AddProgress(2);

          FDlg_HisForm.play_start.Execute;
          GCurSelectDev := PlayDev;
          if isDataExist then
          begin
            tmpSTime := IncSecond(tmpETime, 1);
            if not Assigned(qHisThread) then
            begin
              qHisThread := TGetHisThread.Create(PlayDev.IdStr, tmpSTime, endDateTime);
            end
            else
            begin
              qHisThread.DevId := PlayDev.IdStr;
              qHisThread.STime := tmpSTime;
              qHisThread.ETime := endDateTime;
              qHisThread.IsStopped := False;
            end;  
            qHisThread.OnAddGpsData := FDlg_HisForm.DoOnAddGpsData;
          end;
          FDlg_HisForm.Timer1.Enabled := True;
        except
          on E: Exception do
          begin
            messagebox(handle, QUERY_WARNING_INFO, PChar('提示' + E.Message), mb_ok + mb_iconinformation);
            exit;
          end;
        end;
      finally
        dlg.Free;
      end;
    end;
  finally
    SelectPlayGpsTimeForm.Free;
  end;
end;

procedure TMainf.ShowHistoryRunData(BeginDateTime: TDateTime; EndDateTime2: TDateTime; dev: TDevice);
var
  startDateTime, endDateTime: Tdatetime;
  //dev: TDevice;
  car: TCar;
  dlg: TFrmRefreshProgress;
  i: integer;
begin
        //载入数据
  dlg := TFrmRefreshProgress.Create(Self);
  try
    dlg.Label1.Caption := '载入GPS定位数据...';
    dlg.Show;
    SetActivePage(PageControlBottom, '轨迹回放');
    //dev := GCurSelectDev;
    PlayDev.Id := dev.Id;
    PlayDev.IdStr := dev.IdStr;
    PlayDev.fact_id := dev.fact_id;
    PlayDev.GroupID := dev.GroupID;
    PlayDev.DispLabel := dev.DispLabel;
    PlayDev.SimNo := dev.SimNo;
    PlayDev.DriverNameTeL := dev.DriverNameTeL;

    //让轨迹回放可以实现区域报警
    playDev.AreaList.Clear;
    for i := 0 to dev.AreaList.Count - 1 do
    begin
      playDev.AreaList.Add(dev.AreaList.Items[i]);
    end;

    Car.Id := dev.Car.Id;
    Car.No := dev.Car.No;
    Car.ResId := dev.Car.ResId;
    Car.ResIndex := dev.Car.ResIndex;
    Car.stat := dev.Car.stat;
    Car.Memo := dev.Car.Memo;
    PlayDev.Car := Car;
    FDlg_HisForm.PlayDevChanged;
    //startDateTime := SelectPlayGpsTimeForm.start_date.DateTime;
    //ReplaceTime(startDateTime, SelectPlayGpsTimeForm.start_time.Time);
    //endDateTime := SelectPlayGpsTimeForm.end_date.DateTime;
    //ReplaceTime(endDateTime, SelectPlayGpsTimeForm.end_time.Time);
    startDateTime := BeginDateTime;
    EndDateTime := EndDateTime2;
    dlg.Gauge1.AddProgress(2);
    Application.ProcessMessages;
    FDlg_HisForm.PlayFromServer(playDev.Id,  startDateTime, endDateTime);
    FDlg_HisForm.EditFromTime.Text := FormatDatetime('yyyy-mm-dd hh:nn:ss', startDatetime);
    FDlg_HisForm.EditToTime.Text := FormatDatetime('yyyy-mm-dd hh:nn:ss', endDateTime);

    dlg.Gauge1.AddProgress(2);
    Application.ProcessMessages;
    FDlg_HisForm.load_PlayInfo(startDateTime, endDateTime, '服务器数据');
    dlg.Gauge1.AddProgress(2);
    Application.ProcessMessages;
    FDlg_HisForm.LoadAllGpsData(dlg);
    dlg.Gauge1.AddProgress(2);
    FDlg_HisForm.play_start.Execute;
    GCurSelectDev := PlayDev;
  finally
    dlg.Free;
  end;
end;

procedure TMainf.PlayQuerySound(FileName: string);
var
  i: Integer;
begin
  if FDlg_AudioFrm <> nil then
  begin
    FDlg_AudioFrm.editFileName.Text := FileName;
    FDlg_AudioFrm.BitBtnPlay.Click;

    for i := 0 to PageControlBottom.PageCount - 1 do
    begin
      if FDlg_AudioFrm.Caption = PageControlBottom.Pages[i].Caption then
      begin
        PageControlBottom.ActivePageIndex := i;
        break;
      end;
    end;
  end;
end;

procedure TMainf.Msg_For_Update(var message: TMessage);
begin
  Application.Terminate;
end;

procedure TMainf.help_UpdateExecute(Sender: TObject);
var
  CoerceUpdate: Boolean;
  UpdateExe: string;
  IniFile: TIniFile;
  FilePath: string;
  UpdateFilePath: string;
begin

//  IniFile := TIniFile.Create(ExePath + 'Config.ini');
//  try
//    UpdateExe := IniFile.ReadString('update', 'UpdateExe', 'ClientUpdate.exe');
//  finally
//    IniFile.Free;
//  end;
//
//  UpdateFilePath := ExePath + 'Update\' + UpdateExe;
//  FilePath := ExePath + '\' + UpdateExe;
//
//  try
//    if FileExists(UpdateFilePath) then
//    begin
//      if CopyFile(Pchar(UpdateFilePath), Pchar(FilePath),False) then
//        DeleteFile(UpdateFilePath);
//    end;
//
//    if updateUnit.ExistUpdateFile_ls(CoerceUpdate) then
//    begin
//      if CoerceUpdate then
//      begin
//        SetCurrentDir(ExePath);
//        shellexecute(handle, 'open', pchar(FilePath), nil, nil, sw_show);
//        Application.Terminate;
//      end
//      else
//      begin
//        if MessageBox(handle, '升级将关闭监控客户端，是否继续升级', '提示', MB_OKCANCEL + MB_ICONQUESTION) = ID_OK then
//        begin
//          if FileExists(FilePath) then
//          begin
//            SetCurrentDir(ExePath);
//            shellexecute(handle, 'open', pchar(FilePath), nil, nil, sw_show);
//            Application.Terminate;
//          end
//          else
//            MessageBox(handle, '对不起，没有找到升级程序，无法升级！', '提示', MB_OK + MB_ICONINFORMATION);
//        end;
//      end;
//    end
//    else
//    begin
//      MessageBox(Handle, '您的客户端是最新版本，无需升级', '提示', MB_OK);
//    end;
//  finally
////     TimerUpdate.Interval:=30*60*1000;
////     TimerUpdate.Enabled:=true;
//  end;

  //采用公交的升级程序
  if MessageBox(handle, '升级将关闭监控客户端，是否继续升级', '提示', MB_OKCANCEL + MB_ICONQUESTION) = ID_OK then
  begin
    if FileExists(ExePath + 'tyUpdate.exe') then
    begin
      SetCurrentDir(ExePath);
      shellexecute(handle, 'open', pchar(ExePath + 'tyUpdate.exe'), nil, nil, sw_show);
      Application.Terminate;
    end
    else
      MessageBox(handle, '对不起，没有找到升级程序tyUpdate.exe，无法升级！', '提示', MB_OK + MB_ICONINFORMATION);
  end;
end;

procedure TMainf.OnUserDefinedText(Sender: TObject; EarthPoint: TEarthPoint; WorldPoint: TWorldPoint);
var
  i: integer;
  pp: PUserDefinedText;
begin
  UserDefinedTextForm := TUserDefinedTextForm.Create(Self);
  try
    UserDefinedTextForm.Edit3.Text := IntToStr(FMap.DrawCood.Scale);
    i := GTextManage.Find(WorldPoint);
    if i >= 0 then
    begin
      UserDefinedTextForm.editIDStr.Text := IntToStr(GTextManage.Item[i]^.ID);
      UserDefinedTextForm.EditName.Text := GTextManage.Item[i]^.Text;
      UserDefinedTextForm.Font.Name := GTextManage.Item[i]^.TextFont.FontName;
      UserDefinedTextForm.Font.Size := GTextManage.Item[i]^.TextFont.Size;
      UserDefinedTextForm.Font.Color := GTextManage.Item[i]^.TextFont.ForeColor;
      UserDefinedTextForm.EditFont.Text := GTextManage.Item[i]^.TextFont.FontName + ',' + intToStr(GTextManage.Item[i]^.TextFont.Size);
      UserDefinedTextForm.EditX.Text := FormatFloat('0.000000', EarthPoint.x);
      UserDefinedTextForm.EditY.Text := FormatFloat('0.000000', EarthPoint.y);
      UserDefinedTextForm.EditType.Text := IntToStr(GTextManage.Item[i]^.Symbol.CustomSymbol.Shape);
      UserDefinedTextForm.BitBtnOK.Caption := '修改';
      if GTextManage.Item[i]^.MaxScale > 0 then
      begin
        UserDefinedTextForm.CheckBox1.Checked := true;
        UserDefinedTextForm.Edit1.Text := IntToStr(GTextManage.Item[i]^.MinScale);
        UserDefinedTextForm.Edit2.Text := IntToStr(GTextManage.Item[i]^.MaxScale);
      end
      else
      begin
        UserDefinedTextForm.CheckBox1.Checked := false;
        UserDefinedTextForm.Edit1.Text := '';
        UserDefinedTextForm.Edit2.Text := '';
      end;
      UserDefinedTextForm.CheckBox1Click(nil);
      if UserDefinedTextForm.ShowModal = MrOK then
      begin
        if UserDefinedTextForm.EditName.Text = '' then
        begin
          GTextManage.Delete(i, ExePath + 'UserDefinedText.ini', UserDefinedTextForm.editIDStr.text);
        end
        else
        begin
          GTextManage.Item[i]^.Text := UserDefinedTextForm.EditName.Text;
          GTextManage.Item[i]^.TextFont.Size := UserDefinedTextForm.Font.Size;
          GTextManage.Item[i]^.TextFont.FontName := UserDefinedTextForm.Font.Name;
          GTextManage.Item[i]^.TextFont.ForeColor := UserDefinedTextForm.Font.Color;
          GTextManage.Item[i]^.TextFont.Transparent := 1;
          GTextManage.Item[i]^.Symbol.CustomSymbol.Shape := StrToInt(UserDefinedTextForm.EditType.Text);
          GTextManage.Item[i]^.Symbol.CustomSymbol.Color := clRed;
          GTextManage.Item[i]^.Symbol.CustomSymbol.Size := 8;
          GTextManage.Item[i]^.isSave := False;
          if UserDefinedTextForm.CheckBox1.Checked then
          begin
            if UserDefinedTextForm.Edit1.Text <> '' then
              GTextManage.Item[i]^.MinScale := StrToInt(UserDefinedTextForm.Edit1.Text);
            if UserDefinedTextForm.Edit2.Text <> '' then
              GTextManage.Item[i]^.MaxScale := StrToInt(UserDefinedTextForm.Edit2.Text);
          end
          else
            GTextManage.Item[i]^.MaxScale := -1;
          GTextManage.ModifyToFile(ExePath + 'UserDefinedText.ini', GTextManage.Item[i]);
        end;
        FMap.Draw;
        ShowUserDefinedText;
      end;
    end
    else
    begin
      //UserDefinedTextForm.EditName.Text := IntToStr(GTextManage.MaxID);
      UserDefinedTextForm.editidStr.text := IntToStr(GTextManage.MaxID);
      UserDefinedTextForm.EditX.Text := FormatFloat('0.000000', EarthPoint.X);
      UserDefinedTextForm.EditY.Text := FormatFloat('0.000000', EarthPoint.y);
      UserDefinedTextForm.EditType.Text := '67';
      UserDefinedTextForm.Font.Name := '宋体';
      UserDefinedTextForm.Font.Size := 10;
      UserDefinedTextForm.Font.Color := 0;
      UserDefinedTextForm.EditFont.Text := '宋体,10';
      UserDefinedTextForm.BitBtnOK.Caption := '添加';
      UserDefinedTextForm.CheckBox1.Checked := false;
      UserDefinedTextForm.Edit1.Text := '';
      UserDefinedTextForm.Edit2.Text := '';
      UserDefinedTextForm.CheckBox1Click(nil);

      if UserDefinedTextForm.ShowModal = MrOK then
      begin
        if UserDefinedTextForm.EditName.Text <> '' then
        begin
          pp := GTextManage.Add(UserDefinedTextForm.EditName.Text, WorldPoint);
          //pp^.IDStr := StrToIn( UserDefinedTextForm.editIDStr.text);
          pp^.TextFont.Size := UserDefinedTextForm.Font.Size;
          pp^.TextFont.FontName := UserDefinedTextForm.Font.Name;
          pp^.TextFont.ForeColor := UserDefinedTextForm.Font.Color;
          pp^.TextFont.Transparent := 1;
          pp^.Symbol.CustomSymbol.Shape := StrToInt(UserDefinedTextForm.EditType.Text);
          pp^.Symbol.CustomSymbol.Color := clRed;
          pp^.Symbol.CustomSymbol.Size := 8;
          if UserDefinedTextForm.CheckBox1.Checked then
          begin
            if UserDefinedTextForm.Edit1.Text <> '' then
              pp^.MinScale := StrToInt(UserDefinedTextForm.Edit1.Text);
            if UserDefinedTextForm.Edit2.Text <> '' then
              pp^.MaxScale := StrToInt(UserDefinedTextForm.Edit2.Text);
          end
          else
            pp^.MaxScale := -1;
          GTextManage.SaveToFile(ExePath + 'UserDefinedText.ini',pp);
          FMap.Draw;
          ShowUserDefinedText;
        end;
      end;
    end;
  finally
    UserDefinedTextForm.Free;
  end;
end;

procedure TMainf.ModifyOrDeleteDefinedText();
var
  i: integer;
  pp: PUserDefinedText;
  WorldPoint: TWorldPoint;
  EarthPoint: TEarthPoint;
begin
  if cxDeviceListText.FocusedNode <> nil then
  begin
    pp := PUserDefinedText(cxDeviceListText.FocusedNode.Data)
  end
  else
  begin
    Exit;
  end;

  UserDefinedTextForm := TUserDefinedTextForm.Create(Self);
  try
    UserDefinedTextForm.Edit3.Text := IntToStr(FMap.DrawCood.Scale);
    WorldPoint := pp^.Symbol.Position;
    EarthPoint := FMap.Projection.XY2LoLa(pp^.Symbol.Position);

    i := GTextManage.Find(pp^.ID);
    UserDefinedTextForm.editIDStr.Text := IntToStr(pp^.ID);
    UserDefinedTextForm.EditName.Text := pp^.Text;
    UserDefinedTextForm.Font.Name := pp^.TextFont.FontName;
    UserDefinedTextForm.Font.Size := pp^.TextFont.Size;
    UserDefinedTextForm.Font.Color := pp^.TextFont.ForeColor;
    UserDefinedTextForm.EditFont.Text := pp^.TextFont.FontName + ',' + intToStr(pp^.TextFont.Size);
    UserDefinedTextForm.EditX.Text := FormatFloat('0.000000', EarthPoint.x);
    UserDefinedTextForm.EditY.Text := FormatFloat('0.000000', EarthPoint.y);
    UserDefinedTextForm.EditType.Text := IntToStr(pp^.Symbol.CustomSymbol.Shape);
    UserDefinedTextForm.BitBtnOK.Caption := '修改';
    if pp^.MaxScale > 0 then
    begin
      UserDefinedTextForm.CheckBox1.Checked := true;
      UserDefinedTextForm.Edit1.Text := IntToStr(pp^.MinScale);
      UserDefinedTextForm.Edit2.Text := IntToStr(pp^.MaxScale);
    end
    else
    begin
      UserDefinedTextForm.CheckBox1.Checked := false;
      UserDefinedTextForm.Edit1.Text := '';
      UserDefinedTextForm.Edit2.Text := '';
    end;
    UserDefinedTextForm.CheckBox1Click(nil);
    if UserDefinedTextForm.ShowModal = MrOK then
    begin
      if UserDefinedTextForm.EditName.Text = '' then
      begin
        GTextManage.Delete(i, ExePath + 'UserDefinedText.ini', UserDefinedTextForm.editIDStr.text);
        ModifyOrDeleteDefinedMarker(False, StrToInt(UserDefinedTextForm.editIDStr.text), UserDefinedTextForm.EditName.Text);
      end
      else
      begin
        pp^.Text := UserDefinedTextForm.EditName.Text;
        pp^.TextFont.Size := UserDefinedTextForm.Font.Size;
        pp^.TextFont.FontName := UserDefinedTextForm.Font.Name;
        pp^.TextFont.ForeColor := UserDefinedTextForm.Font.Color;
        pp^.TextFont.Transparent := 1;
        pp^.Symbol.CustomSymbol.Shape := StrToInt(UserDefinedTextForm.EditType.Text);
        pp^.Symbol.CustomSymbol.Color := clRed;
        pp^.Symbol.CustomSymbol.Size := 8;
        pp^.isSave := False;
        if UserDefinedTextForm.CheckBox1.Checked then
        begin
          if UserDefinedTextForm.Edit1.Text <> '' then
            pp^.MinScale := StrToInt(UserDefinedTextForm.Edit1.Text);
          if UserDefinedTextForm.Edit2.Text <> '' then
            pp^.MaxScale := StrToInt(UserDefinedTextForm.Edit2.Text);
        end
        else
          pp^.MaxScale := -1;
        GTextManage.ModifyToFile(ExePath + 'UserDefinedText.ini', pp);
        ModifyOrDeleteDefinedMarker(True, pp^.ID, pp^.Text)
      end;
      ShowUserDefinedText;
    end;

  finally
    UserDefinedTextForm.Free;
  end;
end;


procedure TMainf.ShowUserDefinedText;
var
  i: integer;
begin
  cxDeviceListText.Clear;
  cxDeviceListText.BeginUpdate;
  for i := 0 to GTextmanage.Count - 1 do
  begin
    with cxDeviceListText.Add do
    begin
      Values[0] := i;
      Values[1] := GTextmanage.item[i]^.Text;
      Data := GTextmanage.item[i];
    end;
  end;
  cxDeviceListText.EndUpdate;
end;

procedure TMainf.cxDeviceListTextDblClick(Sender: TObject);
begin
  // liusen
  if cxDeviceListText.FocusedNode <> nil then
  begin
    Locate_DefinedText(PUserDefinedText(cxDeviceListText.FocusedNode.Data)^.ID);
  end;
end;

procedure TMainf.BitBtnEditTextClick(Sender: TObject);
var
  p: TPoint;
begin
  ModifyOrDeleteDefinedText;
  {if cxDeviceListText.FocusedNode <> nil then
  begin
    p := PUserDefinedText(cxDeviceListText.FocusedNode.Data)^.Symbol.Position;
    OnUserDefinedText(nil, FMap.Projection.XY2LoLa(p), p);
  end;             }
end;


procedure TMainf.show_MapExecute(Sender: TObject);
var
  i: Integer;
begin
  ShowWindows(Sender, PageControl_Center, FDlg_BSMap, alLeft); // liusen
  {with (Sender as TAction) do
  begin
    Checked := not Checked;
    if Checked then
    begin
      FDlg_Map.ManualDock(PageControl_Center, nil, alLeft);
      FDlg_Map.Show;
      if PageControl_Center.PageCount >1 then
      begin
        //设置 地图窗口为　活动层
        for i := 0 to PageControl_Center.PageCount - 1 do
        begin
          if PageControl_Center.Pages[i].Caption = FDlg_Map.Caption then
          begin
            try
              PageControl_Center.ActivePageIndex := i;
            except
              break;
            end;
            break;
          end;
        end;
      end;
    end
    else
    begin
      FDlg_Map.ManualDock(nil);
      FDlg_Map.Hide;
    end;
  end; }
end;

procedure TMainf.PageControl_CenterDockDrop(Sender: TObject;
  Source: TDragDockObject; X, Y: Integer);
var
  i: Integer;
begin
  if not SplitterBottom.Visible then
  begin
    PageControlBottom.Align := alBottom;
    PageControlBottom.Height := Panel_center.Height * 2 div 7;
    pageControl_Center.Align := alClient;
    SplitterBottom.Visible := true;
  end;
  inc(FCenterFormCount);

//  for i := 0 to PageControl_Center.PageCount-1 do
//  begin
//    PageControl_Center.Pages[i].Highlighted := False;
//  end;
//  if PageControl_Center.ActivePage <> nil then
//    PageControl_Center.ActivePage.Highlighted := True;
end;

procedure TMainf.PageControl_CenterUnDock(Sender: TObject;
  Client: TControl; NewTarget: TWinControl; var Allow: Boolean);
var
  i: Integer;
begin
  Dec(FCenterFormCount);
  if FCenterFormCount <= 0 then
  begin
    SplitterBottom.Visible := false;
    pageControl_Center.Align := alNone;
    pageControl_Center.SendToBack;
    pageControl_Center.Height := Panel_center.Height * 3 div 7;
    PageControlBottom.Align := alClient;
  end;
//  for i := 0 to PageControl_Center.PageCount-1 do
//  begin
//    PageControl_Center.Pages[i].Highlighted := False;
//  end;
//  if PageControl_Center.ActivePage <> nil then
//    PageControl_Center.ActivePage.Highlighted := True;
end;

procedure TMainf.ComboBoxCarNOKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    FdevKeyIn := True;
    Edit1.Text := ComboboxCarNO.Text;
    FdevKeyIn := false;
    exit;
  end;
  FSearch := true;
end;

procedure TMainf.ComboBoxCarNOClick(Sender: TObject);
begin
  FdevKeyIn := True;
  Edit1.Text := ComboboxCarNO.Text;
  FdevKeyIn := false;
  //  exit;
end;

procedure TMainf.ComboBoxCarNOChange(Sender: TObject);
var
  i: integer;
  carNo, setNo: string;
begin
  if FSearch then
  begin
    setNo := ComboBoxCarNO.Text;
    if setNO = '' then
    begin
      ComboBoxCarNO.DroppedDown := false;
      exit;
    end;
    Edit1.Text := '';
    ComboBoxCarNo.Items.BeginUpdate;
    ComboBoxCarNO.Items.Clear;
    for i := 0 to ADeviceManage.Count - 1 do
    begin
      carNo := ADeviceManage.Items[i].Car.No;
      if pos(setNo, carNo) > 0 then
      begin
        if ComBoBoxCarNO.Items.Count <= 50 then
          ComboBoxCarNO.Items.Add(carNo)
        else
          break;
      end;
    Application.ProcessMessages;
    end;
    ComboBoxCarNo.Items.EndUpdate;
    ComboBoxCarNO.SelStart := Length(ComboBoxCarNO.Text);
    ComboBoxCarNO.DroppedDown := false;
  end;
end;

procedure TMainf.ComboBoxCarNOSelect(Sender: TObject);
begin
  FSearch := false;
end;

procedure TMainf.ComboBoxCarNODblClick(Sender: TObject);
begin
  ComboBoxCarNO.DroppedDown := false;
end;

procedure TMainf.ComboBoxCarNOKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if FSearch then
  begin
    if ComboBoxCarNO.Items.Count > 0 then
      ComboBoxCarNO.DroppedDown := true;
    FSearch := false;
  end;
end;

procedure TMainf.show_fullScreenExecute(Sender: TObject);
var
  i: integer;
begin
  if not show_fullScreen.Checked then
  begin
    Self.Hide;
    FMap.Visible := false;
    try
      Self.WindowState := wsNormal;
      Self.BorderStyle := bsNone;
      CoolBar1.Visible := false;
      SplitterRight.CloseSplitter;
//      SplitterBottom.Hide;
//      SplitterRight.Hide;
      SplitterLeft.CloseSplitter;
      SplitterBottom.CloseSplitter;
//      SplitterLeft.Hide;
      i := 0;
      while PageControl_Center.PageCount > i do
      begin
        //if PageControl_Center.Pages[i].Caption = FDlg_Map.Caption then
        //  FDlg_Map.ManualDock(PageControlBottom, nil, alLeft)
        //else
          if PageControl_Center.Pages[i].Caption = FDlg_Watch_Car.Caption then
            FDlg_Watch_Car.ManualDock(PageControlBottom, nil, alLeft)
          else if PageControl_Center.Pages[i].Caption = FDlg_Sended_Cmd.Caption then
            FDlg_Sended_Cmd.ManualDock(PageControlBottom, nil, alLeft)
//          else if PageControl_Center.Pages[i].Caption = FDlg_OrderList.Caption then
//            FDlg_OrderList.ManualDock(PageControlBottom, nil, alLeft)
          else if PageControl_Center.Pages[i].Caption = FDlg_Prompt_Info.Caption then
            FDlg_Prompt_Info.ManualDock(PageControlBottom, nil, alLeft)
          else if PageControl_Center.Pages[i].Caption = FDlg_ConfineAreaList.Caption then
            FDlg_ConfineAreaList.ManualDock(PageControlBottom, nil, alLeft)
          else if PageControl_Center.Pages[i].Caption = FDlg_AlarmCar.Caption then
            FDlg_AlarmCar.ManualDock(PageControlBottom, nil, alLeft)
          else if PageControl_Center.Pages[i].Caption = FDlg_DevAlarmCar.Caption then
            FDlg_DevAlarmCar.ManualDock(PageControlBottom, nil, alLeft)
          else if PageControl_Center.Pages[i].Caption = FDlg_SearchAddress.Caption then
            FDlg_SearchAddress.ManualDock(PageControlBottom, nil, alLeft)
          else if PageControl_Center.Pages[i].Caption = FDlg_PictureFrm.Caption then
            FDlg_PictureFrm.ManualDock(PageControlBottom, nil, alLeft)
          else if PageControl_Center.Pages[i].Caption = FDlg_AudioFrm.Caption then
            FDlg_AudioFrm.ManualDock(PageControlBottom, nil, alLeft)
          else if PageControl_Center.Pages[i].Caption = FDlg_VideoFrm.Caption then
            FDlg_VideoFrm.ManualDock(PageControlBottom, nil, alLeft)
          else if PageControl_Center.Pages[i].Caption = FDlg_QueryPictureListFrm.Caption then
            FDlg_QueryPictureListFrm.ManualDock(PageControlBottom, nil, alLeft)
          else if PageControl_Center.Pages[i].Caption = FDlg_QueryAudioList.Caption then
            FDlg_QueryAudioList.ManualDock(PageControlBottom, nil, alLeft)
          else if PageControl_Center.Pages[i].Caption = FDlg_QueryVideoList.Caption then
            FDlg_QueryVideoList.ManualDock(PageControlBottom, nil, alLeft)
          else if PageControl_Center.Pages[i].Caption = FDlg_AlarmSupervise.Caption then
            FDlg_AlarmSupervise.ManualDock(PageControlBottom, nil, alLeft)
          else if PageControl_Center.Pages[i].Caption = FDlg_RevGovInfo.Caption then
            FDlg_RevGovInfo.ManualDock(PageControlBottom, nil, alLeft)
          else if PageControl_Center.Pages[i].Caption = FDlg_EventListFrm.Caption then
            FDlg_EventListFrm.ManualDock(PageControlBottom, nil, alLeft)
          else if PageControl_Center.Pages[i].Caption = FDlg_AnswerListFrm.Caption then
            FDlg_AnswerListFrm.ManualDock(PageControlBottom, nil, alLeft);
//          else if PageControl_Center.Pages[i].Caption = FDlg_ServeJudgeListFrm.Caption then
//              FDlg_ServeJudgeListFrm.ManualDock(PageControlBottom, nil, alLeft);
          inc(i);
      end;
      
      for i := 0 to PageControlBottom.PageCount - 1 do
      begin
        if FDlg_Map.Caption = PageControlBottom.Pages[i].Caption then
        begin
          PageControlBottom.Pages[i].PageIndex := 0;
          break;
        end;
      end;

      BitBtnFullScreen.Show;
      BitBtnFullScreen.Caption := '';
      BitBtnFullScreen.Left := screen.Width + 5 - BitBtnFullScreen.Width;
      BitBtnFullScreen.Top := 0;

      ToolBarMenu.Top := 0;
      ToolBarMenu.Left := screen.Width + 8 - ToolBarMenu.Width;

      Self.Menu := nil;
      ToolBarMenu.Show;

    //Self.FormStyle :=fsStayOnTop;
    finally
      N209.Visible := False;
      show_fullScreen.Checked := true;
      Self.Show;
      Self.Left := -5;
      Self.Top := -2;
      Self.Width := screen.Width + 8;
      Self.Height := screen.Height + 8;
      FMap.Visible := true;
      BitBtnFullScreen.BringToFront;
    end;
  end
  else
  begin
    Self.Hide;
    FMap.Visible := false;
    try
      Self.WindowState := wsMaximized;
      Self.BorderStyle := bsSizeable;
      CoolBar1.Visible := true;

      //FDlg_Map.ManualDock(PageControl_Center, nil, alLeft);
      BitBtnFullScreen.Hide;


      ToolBarMenu.Hide;

      SplitterBottom.OpenSplitter;
//      SplitterBottom.Show;

      SplitterRight.OpenSplitter;
//      SplitterRight.Show;

//      SplitterLeft.Show;
      SplitterLeft.OpenSplitter;

    finally
      N209.Visible := True;
      show_fullScreen.Checked := false;
      Self.Show;
      FMap.Visible := true;
      Self.Menu := nil;
      Self.Menu := Self.MainMenu2;
    end;
  end;
end;

procedure TMainf.Map_ManageExecute(Sender: TObject);
begin
  if not FDlg_Map.PanelDeviceList.Visible then
  begin
    FDlg_Map.PanelDeviceList.Top := FDlg_Map.Panel_Map.Top;
    FDlg_Map.PanelDeviceList.Left := FDlg_Map.Panel_Map.Left - 2;
    FDlg_Map.PanelDeviceList.Height := FDlg_Map.Panel_Map.Height;
    FDlg_Map.PanelDeviceList.Visible := true;
    FDlg_Map.ToolButton6.Down := true;
  end
  else
  begin
    FDlg_Map.PanelDeviceList.Visible := false;
    FDlg_Map.ToolButton6.Down := false;
  end;
end;

procedure TMainf.fun_Devs_Hide_AllExecute(Sender: TObject);
var
  i: integer;
begin
  if not TAction(Sender).Checked then
  begin
    TAction(Sender).Checked := true;
    for i := 0 to ADeviceManage.Count - 1 do
    begin
      ADeviceManage.Items[i].Hide := true;
    end;
  end
  else
  begin
    TAction(Sender).Checked := false;
    for i := 0 to ADeviceManage.Count - 1 do
    begin
      ADeviceManage.Items[i].Hide := false;
    end;
  end;

  if GCurSelectDev <> nil then
  begin
    fun_DevHide.Checked := GCurSelectDev.Hide;
    fun_DevShowOnly.Checked := False;
  end;

  FMap.DrawGpsMap_ClearDraw;
end;

procedure TMainf.fun_Devs_Show_OnlyExecute(Sender: TObject);
begin
  fun_Devs_Hide_All.Checked := false;
  fun_Devs_Hide_All.Execute;
  fun_Devs_Show.Execute;
end;

procedure TMainf.Map_ChangeNodeNameExecute(Sender: TObject);
var
  TreeNode: TTreeNode;
  MapNode: TMapNode;
  s: string;
begin
  TreeNode := FDlg_Map.TreeViewMap.Selected;
  if TreeNode <> nil then
  begin
    if TreeNode.Data <> nil then
    begin
      MapNode := TMapNode(TreeNode.Data);
      s := InputBox('输入', '请输入一个新地区的名字:', MapNode.Name);
      if s = '' then exit;
      MapManger.ChangeNodeName(s, MapNode);
      MapManger.ShowToTreeView(FDlg_Map.TreeViewMap, FDlg_Map.CheckBoxIsShowFile.Checked);
      FDlg_Map.StatusBar1.Panels.Items[0].Text := '默认显示地图:' + MapManger.DefaultNode.Name;
    end;
  end;
end;

procedure TMainf.fun_GetAPictureExecute(Sender: TObject);
var
  dlg: TGetAPictureFrm;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  if not CheckDevId then
  begin
    fun_Devs_GetAPictureExecute(Sender);
    exit;
  end;
  dlg := TGetAPictureFrm.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    Add_A_Device;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;

end;

procedure TMainf.fun_Devs_GetAPictureExecute(Sender: TObject);
var
  dlg: TGetAPictureFrm;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  dlg := TGetAPictureFrm.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    if ListSelectDev.Count > 0 then
    begin
      AddDeviceFromListSelectDev;
    end
    else
    begin
      AddDeviceByGroup;
    end;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.tool_SetRunWayExecute(Sender: TObject);
var
  i: integer;
begin
  FMap.MouseAction := actSetRunWay;
  for i := 0 to ActionList1.ActionCount - 1 do
  begin
    if (ActionList1.Actions[i].Category = '2地图工具') then
    begin
      if ActionList1.Actions[i].Name <> 'tool_bird_eye' then
      begin
        TAction(ActionList1.Actions[i]).Checked := false;
      end;
    end;
  end;
  TAction(Sender).Checked := true;
  PageControl1.ActivePageIndex := 2;
end;

procedure TMainf.FMapSetRunWay(Sender: TObject; WPointsAry: TWorldPointAry;
  PointsCnt: Integer);
var
  dlgLineSection: TfrmSetLineSection;
  i, j: Integer;
  lineSection: TLineSection;
  sIndex: Integer;
  lineSectionNo: Integer;
begin
  if PointsCnt<2 then exit;

//  FMap.MouseAction := actMove;

  if tmpPolyLineArea = nil then
  begin
    tmpPolyLineArea := TPolyLineArea.Create;
    FAllAreaManage.Add(tmpPolyLineArea);
  end;
  try
    dlgLineSection := TfrmSetLineSection.Create(Self);
    lineSectionNo := FAllAreaManage.MaxLineSectionNo + tmpPolyLineArea.LineSectionCount + 1;
    try
      dlgLineSection.edtLineSectionId.Text := IntToStr(lineSectionNo);
      if dlgLineSection.ShowModal = mrOk then
      begin
        lineSection := tmpPolyLineArea.AddLineSection(lineSectionNo);
        if lineSection = nil then Exit;
        lineSection.LineSectionWidth := dlgLineSection.lineSectionWidth;
        lineSection.LineSectionProperty := dlgLineSection.LineSectionProperty;
        lineSection.LineSectionRunMaxTime := dlgLineSection.lineSectionRunMaxTime;
        lineSection.LineSectionRunMinTime := dlgLineSection.LineSectionRunMinTime;
        lineSection.LineSectionMaxSpeed := dlgLineSection.LineSectionMaxSpeed;
        lineSection.LineSectionOverSpeedTime := dlgLineSection.LineSectionOverspeedTime;

//        从第二个路段开始，新的路段的第一个点都是前一个路段的最后一个点重复了
//        sIndex := Length(tmpPolyLineArea.WorldPointAry) + tmpPolyLineArea.LineSectionCount;
//        tmpPolyLineArea.SetLengthPointAry(PointsCnt - tmpPolyLineArea.LineSectionCount);
        sIndex := Length(tmpPolyLineArea.WorldPointAry);
        tmpPolyLineArea.SetLengthPointAry(PointsCnt + sIndex);
        lineSection.SetWorldPointAryLength(PointsCnt);
        j := 0;

        for i := sIndex to PointsCnt + sIndex - 1 do
        begin
          tmpPolyLineArea.WorldPointAry[i].X := WPointsAry[j].X;
          tmpPolyLineArea.WorldPointAry[i].Y := WPointsAry[j].Y;

          lineSection.WPointAry[j].X := WPointsAry[j].X;
          lineSection.WPointAry[j].Y := WPointsAry[j].Y;
          Inc(j);
        end;
      end;
    except
      on E: Exception do
      begin
        uGloabVar.SystemLog.AddLog('FMapSetRunWay Exception:' + E.Message);
      end;
    end;
  finally
    dlgLineSection.Free;
    FMap.MouseAction := actSetRunWay;
  end;
end;

{procedure TMainf.FMapSetRunWay(Sender: TObject; WPointsAry: TWorldPointAry;
  PointsCnt: Integer);
var
  dlg: TConfineAreaSetFrm;
  tmpArea:TConfineArea;
  i,AreaIndex,speet:integer;
begin
  FMap.MouseAction:= actNoAction;
  tool_not_select.Checked := true;
  if PointsCnt<2 then exit;
  dlg:= TConfineAreaSetFrm.Create(nil);
  try
    dlg.Edit_AreaID.Text     := IntTostr(GAreaManage.MaxId);
    dlg.Edit_AreaName.Text   := '线路'+IntToStr(GAreaManage.MaxId);
    dlg.Edit_AreaColor.Color := clred;
    //dlg.ComboBox_AreaType.ItemIndex := ALARM_OUT;
    dlg.CheckBox_IsDraw.Checked := True;
    dlg.ShowModal;
    if dlg.ModalResult = mrok then
    begin
      speet:=0;
      if dlg.ComboBox_AreaType.ItemIndex=ALARM_OVER_SPEET then
      begin
        speet:=StrToInt(dlg.Edit_LimitSpeet.Text);
        AreaIndex:=0;
        for i:=0 to GAreaManage.Count -1 do
        begin
          if GAreaManage.Items[i].AreaType<>ALARM_OVER_SPEET then
          begin
            inc(AreaIndex);
            continue;
          end;
          if speet<GAreaManage.Items[i].OverSpeet then break;
          inc(AreaIndex);
        end;
       // if AreaIndex>0 then AreaIndex:=AreaIndex-1;
        tmpArea:=GAreaManage.Insert(StrToInt(dlg.Edit_AreaID.text),AreaIndex);
      end
      else
      begin
        tmpArea:=GAreaManage.Add(StrToInt(dlg.Edit_AreaID.text));
      end;
      tmpArea.OverSpeet:=Speet;
      tmpArea.ID        := StrToInt(dlg.Edit_AreaID.Text);
      tmpArea.Name      := trim(dlg.Edit_AreaName.Text);
      tmpArea.AreaColor := dlg.Edit_AreaColor.Color;
      tmpArea.AreaType  := dlg.ComboBox_AreaType.ItemIndex;  // ALARM_OUT or ALARM_IN
      tmpArea.IsDraw    := dlg.CheckBox_IsDraw.Checked;

      tmpArea.SetLengthPointAry(PointsCnt);
      for i:= 0 to PointsCnt -1 do
      begin
        tmpArea.WorldPointAry[i]:= WPointsAry[i];
        //tmpArea.EarthPointAry[i]:= Project.XY2LoLa(WPointsAry[i]);
      end;
      tmpArea.WorldPointAryToOutBox(tmpArea.WorldPointAry,0,tmpArea.PointCount);
      //------------ 显示电子围栏列表     }{or (FDlg_ConfineAreaList.Floating)}
     { if (not FDlg_ConfineAreaList.Visible)  then
      begin
        FDlg_ConfineAreaList.ManualDock(PageControlBottom,nil,alLeft);
        FDlg_ConfineAreaList.Show;
        for i:= 0 to PageControlBottom.PageCount-1 do
          if PageControlBottom.Pages[i].Caption = '电子围栏列表' then
          begin
            PageControlBottom.ActivePageIndex := i;
            break;
          end;
      end;
      FDlg_ConfineAreaList.ListConfineAreas;
      //------------ 显示电子围栏
    end;
  finally
    dlg.Free;
  end;
end;   }

procedure TMainf.Print_ScreenExecute(Sender: TObject);
begin
  if PrintDialog1.Execute then
  begin
    try
      Self.Print;
    except
      on E: Exception do
      begin
        messageErrorBox('打印屏幕出现错误！', e.Message);
      end;
    end;
  end;
end;

procedure TMainf.Print_MapExecute(Sender: TObject);
var
  rect: TRect;
begin
  // liusen
  printMap;
end;

procedure TMainf.MapSaveToJpegExecute(Sender: TObject);
var
  s, exe: string;
begin
  s := SaveDialog1.Filter;
  SaveDialog1.Filter := 'jpg(*.jpg)|*.jpg|bmp(*.bmp)|*.bmp|gif(*.gif)|*.gif';
  if SaveDialog1.Execute then
  begin
    case SaveDialog1.FilterIndex of
      1:  exe:='.jpg';
      2:  exe:='.bmp';
      3:  exe:='.gif';
    else
      begin
        exe:='.jpg';
      end;
    end;
    SaveScreenToGif(SaveDialog1.FileName + exe);
    //FMap.SaveScreenToGif(SaveDialog1.FileName + '.gif');
  end;
  SaveDialog1.Filter := s;
end;

procedure TMainf.ck_PictureExecute(Sender: TObject);
var
  i: integer;
begin
  if FDlg_CkDevPic= nil then
    FDlg_CkDevPic := TQueryCarPictureFrm.Create(self);
  ShowQueryForm(PageControl_Center, FDlg_CkDevPic, TQueryCarPictureFrm, alLeft);
end;

procedure TMainf.show_PictureExecute(Sender: TObject);
begin
  ShowWindows(Sender, PageControl_Center, FDlg_PictureFrm, alLeft);
end;

procedure TMainf.PageControlBottomChange(Sender: TObject);
var
  i: Integer;
begin
//  for i := 0 to PageControlBottom.PageCount-1 do
//  begin
//    PageControlBottom.Pages[i].Highlighted := False;
//  end;
//  PageControlBottom.ActivePage.Highlighted := True;

  if PageControlBottom.ActivePage.Caption = '车辆列表' then
  begin
    FDlg_Watch_Car.Refresh_WatchCar;
  end else
  if PageControlBottom.ActivePage.Caption = '发送命令' then
  begin
    FDlg_Sended_Cmd.Refresh_SendedCmd;
  end
  else if PageControlBottom.ActivePage.Caption = '报警车辆' then
  begin
    FDlg_AlarmCar.Refresh_AlarmCar;
  end
  else if PageControlBottom.ActivePage.Caption = '电子围栏' then
  begin
    FDlg_ConfineAreaList.ListCurrConfine_Devs;
  end      ;

//  else if PageControlBottom.ActivePage.Caption = '发送订单' then
//  begin
//    FDlg_OrderList.RefreshOrderList;
//  end;
end;

//procedure TMainf.TimerUpdateTimer(Sender: TObject);
//var
//  CoerceUpdate: boolean;
//begin
//  //FFLashDlg.SetLabel('检查更新...');
// // application.ProcessMessages;
////  TimerUpdate.Enabled:=false;
//  if FileExists(ExePath + 'Update\ClientUpdate.exe') then
//  begin
//    if CopyFile(Pchar(ExePath + 'Update\ClientUpdate.exe'),Pchar(ExePath + '\ClientUpdate.exe'),False) then
//      DeleteFile(ExePath + 'Update\ClientUpdate.exe');
//  end;
//
//  try
//    if updateUnit.ExistUpdateFile_ls(CoerceUpdate) then
//    begin
//      if CoerceUpdate then
//      begin
//        SetCurrentDir(ExePath);
//        shellexecute(handle, 'open', pchar(ExePath + '\ClientUpdate.exe'), nil, nil, sw_show);
//        Application.Terminate;
//      end
//      else if MessageBox(0, '发现有新版，要更新吗？', '信息提示', MB_YESNO + MB_ICONQUESTION) = ID_YES then
//      begin
//        SetCurrentDir(ExePath);
//        shellexecute(handle, 'open', pchar(ExePath + '\ClientUpdate.exe'), nil, nil, sw_show);
//        Application.Terminate;
//      end;
//    end;
//  finally
////     TimerUpdate.Interval:=30*60*1000;
////     TimerUpdate.Enabled:=true;
//  end;
//end;

procedure TMainf.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  //FMap.SetFocus;
//  if not FDlg_Map.Focused then exit;
  if FMap.DrawCood.GetRealScale > 85200 then exit;
  if Hot_zoom_out.Tag > 5 then
  begin
      //if FMap.DrawCood.Scale<55 then exit;
      //LastInOutMap:=now;
    Hot_zoom_out.Tag := 0;

    Hot_zoom_out.Execute;
  end
  else Hot_zoom_out.Tag := Hot_zoom_out.Tag + 1;
end;

procedure TMainf.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
var
  px, py: integer;
  mapNode: TMapNode;
begin
  //FMap.SetFocus;
//  if not FDlg_Map.Focused then exit;
  if FMap.DrawCood.GetRealScale <= 15 then exit;
  if Hot_zoom_in.Tag > 5 then
  begin
      //LastInOutMap:=now;
    Hot_zoom_in.Tag := 0;
    Hot_zoom_in.Execute;

      //切换地图
    if FMap.DrawCood.Scale > 650 then exit;
    FMap.XYTOWorldPoint(FMap.Width div 2, FMap.Height div 2, px, py);

    ADeviceManage.FindMapName(FMouseDev, Point(px, py));

    mapNode := MapManger.Find(FMouseDev.XianName);
    if MapNode <> nil then
    begin
      ChangeMap(mapNode, True, True);
      exit;
    end;
    if FMouseDev.ShiName <> FMouseDev.XianName then
    begin
      mapNode := MapManger.Find(FMouseDev.ShiName);
      if MapNode <> nil then
      begin
        ChangeMap(mapNode, True, True);
        exit;
      end;
    end;

  end
  else Hot_zoom_in.Tag := Hot_zoom_in.Tag + 1;
end;

function TMainf.SetActivePage(PageControl: TRzPageControl;
                              PageCaption: string): boolean;
var
  i: integer;
begin
  Result := false;
//  for i := 0 to PageControl.PageCount - 1 do
//  begin
//    PageControl.Pages[i].Highlighted := False;
//  end;
  for i := 0 to PageControl.PageCount - 1 do
  begin
    if PageControl.Pages[i].Caption = PageCaption then
    begin
      try
        PageControl.ActivePageIndex := i;
//        PageControl.Pages[i].Highlighted := True;
      except
        Break;
      end;
      Result := true;
      break;
    end;
  end;
end;

procedure TMainf.OnReDrawMap(Sender: TObject; Dev: TDevice);
var
  mapNode: TMapNode;
begin
  mapNode := MapManger.Find(Dev.XianName);
  if MapNode <> nil then
  begin
    ChangeMap(mapNode, True, True);
    exit;
  end;
  if FMouseDev.ShiName <> FMouseDev.XianName then
  begin
    mapNode := MapManger.Find(Dev.ShiName);
    if MapNode <> nil then
    begin
      ChangeMap(mapNode, True, True);
      exit;
    end;
  end;
end;

procedure TMainf.Set_HisTrackExecute(Sender: TObject);
var
  dlg: TSetCarTrackPenFrm;
  tmpPen: TPenStruct;
begin
  if PlayDev = nil then exit;
  dlg := TSetCarTrackPenFrm.Create(self);
  try
    dlg.Shape1.Brush.Color := PlayDev.TrackPen.color;
    dlg.EditLineWidth.Text := IntToStr(PlayDev.TrackPen.Width);
    if PlayDev.TrackPen.Pattern = 1 then
      dlg.RadioButtonSolid.Checked := True
    else
      dlg.RadioButtonDot.Checked := True;
    dlg.ShowModal;
    if dlg.ModalResult = mrok then
    begin
      tmpPen.color := dlg.Shape1.Brush.Color;
      tmpPen.Width := StrToInt(dlg.EditLineWidth.Text);
      if dlg.RadioButtonSolid.Checked then
        tmpPen.Pattern := 1
      else
        tmpPen.Pattern := 3;
      playdev.TrackPen := tmpPen;
      GlobalParam.FTrackPenColor := tmpPen.color;
      GlobalParam.FTrackPenWidth := tmpPen.Width;
      GlobalParam.FTrackPenStyle := tmpPen.Pattern;
      GlobalParam.SaveToFile(Application.ExeName + '.config');
      LoadDevTrackPen_Width;
    end;
  finally
    dlg.Free;
  end;
end;

procedure TMainf.LoadDevTrackPen_Width;
var
  tmpPen: TPenStruct;
begin
  tmpPen.Width := GlobalParam.FTrackPenWidth;
  tmpPen.color := GlobalParam.FTrackPenColor;
  tmpPen.Pattern := GlobalParam.FTrackPenStyle;
  PlayDev.TrackPen := tmpPen;
end;


procedure TMainf.show_GPSHostoryExecute(Sender: TObject);
begin
  ShowWindows(Sender, PageControlBottom, FDlg_HisForm, alLeft);
end;

procedure TMainf.tool_SetFactoryExecute(Sender: TObject);
var
  i: integer;
begin
  FMap.MouseAction := actSetFactory;
  for i := 0 to ActionList1.ActionCount - 1 do
  begin
    if (ActionList1.Actions[i].Category = '2地图工具') then
    begin
      if ActionList1.Actions[i].Name <> 'tool_bird_eye' then
      begin
        TAction(ActionList1.Actions[i]).Checked := false;
      end;
    end;
  end;
  TAction(Sender).Checked := true;
end;

procedure TMainf.OnUserSetFactory(Sender: TObject; WCenterPoint: TEarthPoint; Radius: Integer;LastPoint: TEarthPoint);
var
  i: integer;
begin
  //用户自定义工厂工地
  
end;


procedure TMainf.tool_SeekCarExecute(Sender: TObject);
var
  i: integer;
begin
  FMap.MouseAction := actSeekCar;
  for i := 0 to ActionList1.ActionCount - 1 do
  begin
    if (ActionList1.Actions[i].Category = '2地图工具') then
    begin
      if ActionList1.Actions[i].Name <> 'tool_bird_eye' then
      begin
        TAction(ActionList1.Actions[i]).Checked := false;
      end;
    end;
  end;
  TAction(Sender).Checked := true;
end;

procedure TMainf.tool_SetAreaAlarmToDev_CircleExecute(Sender: TObject);
var
  i: integer;
begin
    //===设置报警区域到车机//
    Fmap.MouseAction := actSetConfineAlarmCircle;   
    for i := 0 to ActionList1.ActionCount - 1 do
    begin
      if (ActionList1.Actions[i].Category = '2地图工具') then
      begin
        if ActionList1.Actions[i].Name <> 'tool_bird_eye' then
        begin
          TAction(ActionList1.Actions[i]).Checked := false;
        end;
      end;
    end;
  TAction(Sender).Checked := true;
end;

procedure TMainf.FBrowseSeekCar(BeginP: TPoint; EndP: TPoint);//(BeginX: Integer; BeginY: Integer; EndX: Integer; EndY: Integer);
var
  dlg: TMapSeekCarForm;

  tmpArea: TConfineArea;
  PointsCnt: Integer;
  LeftTop, RightTop, LeftBottom, RrightBottom: TPoint;

  gPoint: TEarthPoint;
begin

  LeftTop := BeginP;

  RightTop.X := endp.X;
  RightTop.Y := BeginP.Y;

  LeftBottom.X := BeginP.X;
  LeftBottom.Y := EndP.Y;

  RrightBottom := EndP;

  tmpArea := GAreaManage.Add(GAreaManage.MaxId);

  //tmpArea.ID := StrToInt(dlg.Edit_AreaID.Text);
  tmpArea.Name := trim('区域查车');
  tmpArea.AreaColor := clRed;
  tmpArea.AreaType := SEEK_CAR; // 区域查车
  tmpArea.IsDraw := True;
  tmpArea.AlarmDistance := 1000;

  tmpArea.IsEnabledTime := False;
  tmpArea.IsShowPop := True;

  PointsCnt := 4;
  tmpArea.SetLengthPointAry(PointsCnt);
  tmpArea.WorldPointAry[0] := RightTop;
  tmpArea.WorldPointAry[1] := LeftTop;
  tmpArea.WorldPointAry[2] := LeftBottom;
  tmpArea.WorldPointAry[3] := RrightBottom;

  Fmap.Draw;

  dlg := TMapSeekCarForm.Create(Self);
  dlg.GCurConfineAreaID := tmpArea.ID;

  gPoint := FMap.Projection.XY2LoLa(beginp);
  dlg.beginp.X := Trunc(gPoint.X * 1000000);    // ls
  dlg.beginp.Y := Trunc(gPoint.Y * 1000000);    // ls

  gPoint := FMap.Projection.XY2LoLa(endp);
  dlg.endp.X := Trunc(gPoint.X * 1000000);      // ls
  dlg.endp.Y := Trunc(gPoint.Y * 1000000);

  dlg.Show;
  FMap.MouseAction := actMove;
  tool_move.Checked := True;
  tool_SeekCar.Checked := False;



 { dlg.beginp.X := BeginX;    // ls
  dlg.beginp.Y := BeginY;    // ls

  dlg.endp.X := EndX;      // ls
  dlg.endp.Y := EndY;

  try
    if dlg.ShowModal = mrok then
    begin
      FMap.MouseAction := actMove;
      tool_move.Checked := True;
      tool_SeekCar.Checked := False;
    end;
  finally
    dlg.Free;
  end;           }
end;

procedure TMainf.FFindThing(BeginX: Integer; BeginY: Integer; EndX: Integer; EndY: Integer);
//var
//  i: Integer;
begin
//  FDlg_FindThingFrm.Label8.Caption := '起始经纬度：';
//  FDlg_FindThingFrm.Label9.Caption := '结束经纬度：';
//
//  FDlg_FindThingFrm.BeginX := BeginX/1000000;
//  FDlg_FindThingFrm.BeginY := BeginY/1000000;
//  FDlg_FindThingFrm.EndX := EndX/1000000;
//  FDlg_FindThingFrm.EndY := EndY/1000000;
//
//  FDlg_FindThingFrm.Label8.Caption := '起始经纬度：' + FloatToStr(FDlg_FindThingFrm.BeginX) + '度   ' + FloatToStr(FDlg_FindThingFrm.BeginY) + '度';
//  FDlg_FindThingFrm.Label9.Caption := '结束经纬度：' + FloatToStr(FDlg_FindThingFrm.EndX) + '度   ' + FloatToStr(FDlg_FindThingFrm.EndY) + '度';
//
//  if not show_FindThing.Checked then
//    show_FindThing.Checked := True;
//
//  if (not FDlg_FindThingFrm.Visible) or (FDlg_FindThingFrm.Floating) then
//  begin
//    FDlg_FindThingFrm.ManualDock(PageControlBottom, nil, alLeft);
//    FDlg_FindThingFrm.Show;
//  end;
//
//  for i := 0 to PageControlBottom.PageCount - 1 do
//  begin
//    if PageControlBottom.Pages[i].Caption = FDlg_FindThingFrm.Caption then
//    begin
//      PageControlBottom.ActivePageIndex := i;
//      break;
//    end;
//  end;
//
//  FMap.MouseAction := actMove;
//  tool_move.Checked := True;
//  tool_FindThing.Checked := False;

end;

procedure TMainf.FOnSetConfineAlarmCircle(Sender: TObject; WCenterPoint: TEarthPoint; Radius: Integer; LastPoint: TEarthPoint);
var
  ep :TEarthPoint;
  wpAry : TWorldPointAry;
begin
  ep.x := 0;
  ep.y := 0;
  ProcessDevArea(AREASHAPE_CIRCLE,WCenterPoint,Radius,LastPoint,ep,ep,wpAry,0);
end;

procedure TMainf.ProcessDevArea(areaShape:byte;
  WCenterPoint: TEarthPoint; Radius: Integer; LastPoint: TEarthPoint;
  LeftPoint: TEarthPoint; RightPoint: TEarthPoint;
  WPointsAry: TWorldPointAry; PointsCnt: Integer);
  procedure GetPoint(A: TPoint; B: TPoint; var OutA1: TPoint; var OutA2: TPoint;
    var OutB1: TPoint; var OutB2: TPoint; Distance: longint);
  var
    k1, k2: double;
    temp: Extended;
  begin
          //斜率等于0度时
    if ((b.Y - a.Y) = 0) then
    begin
      OutA1.X := A.X;
      OutA2.X := A.X;

      OutA1.Y := A.Y + Distance;
      OutA2.Y := A.Y - Distance;

      OutB1.X := B.X;
      OutB2.X := B.X;
      OutB1.Y := B.Y + Distance;
      OutB2.Y := B.Y - Distance;
    end
          //斜率等于90度时
    else if ((b.X - a.X) = 0) then
    begin
      OutA1.X := A.X + Distance;
      OutA2.X := A.X - Distance;

      OutA1.Y := A.Y;
      OutA2.Y := A.Y;

      OutB1.X := B.X + Distance;
      OutB2.X := B.X - Distance;
      OutB1.Y := B.Y;
      OutB2.Y := B.Y;
    end
    else
    begin
      k1 := (b.Y - a.Y) / (b.X - a.X); //直线的斜率
      k2 := -1 / k1; //垂直直线的斜率
      temp := Sqrt((Distance * Distance) / (1 + k2 * k2));
      OutA1.X := round(temp + A.X);
      OutA2.X := round(-temp + A.X);

      OutA1.Y := round(k2 * (OutA1.X - A.X) + A.Y);
      OutA2.Y := round(k2 * (OutA2.X - A.X) + A.Y);

      OutB1.X := round(temp + B.X);
      OutB2.X := round(-temp + B.X);
      OutB1.Y := round(k2 * (OutB1.X - B.X) + B.Y);
      OutB2.Y := round(k2 * (OutB2.X - B.X) + B.Y);
    end;
  end;
var
  dlg: TFrm_AllArea;
  area: TBaseArea;
  areaPar: string;
  areaParMcu: string;
  dev: TDevice;
  i, cx, cy, cx1, cy1: integer;
  areaID: word;
  isvisible: integer;
  dateTime: TDateTime;
  Apoint: TEarthPoint;
  cnt:Integer;
  setType: Byte;
begin
  try
    dlg := TFrm_AllArea.Create(self);
    dlg.AreaShape := areaShape;
    dlg.Notebook1.PageIndex := areaShape;
    case areaShape of
      AREASHAPE_CIRCLE:
      begin
        dlg.Edit4.Text := '圆形';
        dlg.Edit3.Text := formatfloat('0.000', WCenterPoint.X);
        dlg.Edit5.Text := formatfloat('0.000', WCenterPoint.y);
        dlg.Edit6.Text := inttostr(Radius);
      end;
      AREASHAPE_RECT  :
      begin
        dlg.Edit4.Text := '矩形';
        dlg.EditLeftLong.Text := formatfloat('0.000', LeftPoint.Longitude); ;
        dlg.EditLeftLat.Text := formatfloat('0.000', LeftPoint.Latitude);
        dlg.EditRightLong.Text := formatfloat('0.000', RightPoint.Longitude);
        dlg.EditRightLat.Text := formatfloat('0.000', RightPoint.Latitude);
      end;
      AREASHAPE_POLY  :
      begin
        dlg.Edit4.Text := '多边形';
        dlg.rbUpdate.Visible := False;
        dlg.rbAttach.Visible := False;
        dlg.rbModify.Visible := False;
      end;
    end;
           
    dateTime := Now;
    dlg.beginDate.DateTime := dateTime;
    dlg.beginTime.DateTime := dateTime;
    dateTime := dateTime + 1/12;
    dlg.endDate.DateTime := dateTime;
    dlg.endTime.DateTime := dateTime;
    dlg.CheckBox1.Checked := False;
    dlg.CheckBoxEveryDay.Checked := False;
    dlg.CheckBox2.Checked := False;
    dlg.CheckBox3.Checked := False;
    dlg.CheckBox4.Checked := False;
    dlg.CheckBox5.Checked := False;
    dlg.CheckBox6.Checked := False;
    dlg.rbNLat.Checked := True;
    dlg.rbELong.Checked := True;
    //=====得到点信息
    if dlg.ShowModal = mrok then
    begin
      if dlg.rbUpdate.Checked then
        setType := 0
      else if dlg.rbAttach.Checked then
        setType := 1
      else if dlg.rbModify.Checked then
        setType := 2
      else
        setType := 1;

      case areaShape of
        AREASHAPE_CIRCLE:
        begin
          area := TCircleArea.Create;
          TCircleArea(area).radius := Radius;
          TCircleArea(area).ACircle := WCenterPoint;
          TCircleArea(area).lastPoint := LastPoint;
          areaParMcu := floattostr(TCircleArea(area).ACircle.Longitude) + ',' + floattostr(TCircleArea(area).ACircle.Latitude) + ',' + inttostr(TCircleArea(area).radius) + ','
            + floattostr(TCircleArea(area).lastPoint.Longitude) + ',' + floattostr(TCircleArea(area).lastPoint.Latitude);
          areaPar := floattostr(TCircleArea(area).ACircle.Longitude * 1000000) + ',' + floattostr(TCircleArea(area).ACircle.Latitude * 1000000) + ',' + inttostr(TCircleArea(area).radius) + ','
            + floattostr(TCircleArea(area).lastPoint.Longitude * 1000000) + ',' + floattostr(TCircleArea(area).lastPoint.Latitude * 1000000);
          cnt :=1;
        end;
        AREASHAPE_RECT  :
        begin
          area :=  TRectangleArea.Create;
          TRectangleArea(area).leftPoint := LeftPoint;
          TRectangleArea(area).RightPoint := RightPoint;
          areaParMcu := floattostr(TRectangleArea(area).leftPoint.Longitude) + ',' + floattostr(TRectangleArea(area).leftPoint.Latitude)
                +  ',' + floattostr(TRectangleArea(area).RightPoint.Longitude) + ',' + floattostr(TRectangleArea(area).RightPoint.Latitude);
          cx := round(TRectangleArea(area).leftPoint.Longitude * 1000000);
          cy := round(TRectangleArea(area).leftPoint.Latitude * 1000000);
          cx1 := round(TRectangleArea(area).RightPoint.Longitude * 1000000);
          cy1 := round(TRectangleArea(area).RightPoint.Latitude * 1000000);
          AreaPar := inttostr(cx) + ',' + inttostr(cy) + ',' + inttostr(cx1) + ',' + inttostr(cy1);
          cnt := 2;
        end;
        AREASHAPE_POLY  :
        begin
          area :=  TNoSymbolArea.Create;
          TNoSymbolArea(area).SetLengthPointAry(PointsCnt);
          TNoSymbolArea(area).PointCount := PointsCnt;
          for i := 0 to PointsCnt - 1 do
          begin
            TNoSymbolArea(area).WorldPointAry[i] := WPointsAry[i];
            Apoint := Project.XY2LoLa(TNoSymbolArea(area).WorldPointAry[i]);
            cx := round(Apoint.Longitude * 1000000);
            cy := round(Apoint.Latitude * 1000000);
            if i = PointsCnt - 1 then
            begin
              AreaParMCU := AreaParMCU + FloatToStr(Apoint.Longitude) + ',' + FloatToStr(Apoint.Latitude);
              AreaPar := AreaPar + inttostr(TNoSymbolArea(area).WorldPointAry[i].X) + ',' + inttostr(TNoSymbolArea(area).WorldPointAry[i].y);
            end else
            begin
              AreaParMCU := AreaParMCU + FloatToStr(Apoint.Longitude) + ',' + FloatToStr(Apoint.Latitude) + ',';
              AreaPar := AreaPar + inttostr(TNoSymbolArea(area).WorldPointAry[i].X) + ',' + inttostr(TNoSymbolArea(area).WorldPointAry[i].y) + ',';
            end;
          end;
          TNoSymbolArea(area).WorldPointAryToOutBox(TNoSymbolArea(area).WorldPointAry, 0, TNoSymbolArea(area).PointCount);
          cnt := PointsCnt;
        end;
      end;

      area.areaNO := StringToInteger(dlg.Edit_NO.Text);
      area.AreaAlarmKind := dlg.Area_Property;
      area.AreaName := dlg.Edit2.Text;
      
      area.IsEveryDay := dlg.CheckBoxEveryDay.Checked;
      dateTime := dlg.beginDate.DateTime;
      ReplaceTime(dateTime, dlg.beginTime.DateTime);
      dateTime := StrToDateTime(FormatDatetime('yy-mm-dd hh:nn:ss',dateTime));
      area.beginDateTiem := dateTime;

      dateTime := dlg.endDate.DateTime;
      ReplaceTime(dateTime, dlg.endTime.DateTime);
      dateTime := StrToDateTime(FormatDatetime('yy-mm-dd hh:nn:ss',dateTime));
      area.endDateTime := dateTime;

      area.IsSpeedLimited := dlg.CheckBox2.Checked;
      area.maxSpeed := StringToInteger(dlg.Edit_MaxSpeed.Text);
      area.continueTime := StringToInteger(dlg.Edit_time.Text);

      area.AreaPictureKind := areaShape;
      if dlg.ComboBox1.ItemIndex = 0 then
      begin
        area.isshow := true;
        isvisible := 1;
      end else
      begin
        isvisible := 0;
        area.isshow := false;
      end;
      area.AreaParMcu := AreaParMcu;
      area.AreaPar := AreaPar;

      //areaID := bs.AddNewArea_New(area.AreaName, area.AreaAlarmKind, area.OverAlarmValue, area.idlingAlarmValue,
      //  area.AreaPictureKind, 1, AreaPar, isvisible);
      AreaID := Bs.AddNewArea_new(area.AreaName,area.AreaPictureKind, area.areaNO, area.AreaAlarmKind,
                                  FormatDateTime('yyyy-MM-dd hh:nn:ss', area.beginDateTiem), FormatDateTime('yyyy-MM-dd hh:nn:ss', area.endDateTime),area.maxSpeed,
                                  area.continueTime,cnt{1}, AreaPar, AreaParMcu, isvisible);
//      AreaID := Bs.AddNewArea_new(RectangleArea.AreaName,RectangleArea.AreaPictureKind, RectangleArea.areaNO, RectangleArea.AreaAlarmKind,
//                                  DateTimeToStr(RectangleArea.beginDateTiem), DateTimeToStr(RectangleArea.endDateTime),RectangleArea.maxSpeed,
//                                  RectangleArea.continueTime, 2, AreaPar, AreaPerMCU, isvisble);
//      AreaID := Bs.AddNewArea_new(NoSymbolArea.AreaName,NoSymbolArea.AreaPictureKind, NoSymbolArea.areaNO, NoSymbolArea.AreaAlarmKind,
//                                  DateTimeToStr(NoSymbolArea.beginDateTiem), DateTimeToStr(NoSymbolArea.endDateTime),NoSymbolArea.maxSpeed,
//                                  NoSymbolArea.continueTime, PointsCnt, AreaPar, AreaParMcu, isvisble);
      area.AreaID := areaID;
      if area.AreaID > 0 then
      begin
        FAllAreaManage.Add(area);
      end
      else
      begin
        MessageBox(Handle, '保存区域属性失败，请确认数据库连接正常', '提示', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;    

      if dlg.ListView1.Items.Count > 0 then
      begin
        for i := 0 to dlg.listview1.Items.Count - 1 do
        begin
          dev := TDevice(dlg.listview1.Items.Item[i].Data);
          //DataServer.SendCLIENT_SETELCFENCE(dev, area.areaNO, kindalarm, area.OverAlarmValue, area.idlingAlarmValue, kindArea, 12, param);
//          if Bs.AddNewDev_Area( dev.id, area.AreaID) then
//          begin
//            area.AddDev(dev.Id);
//            dev.AddADevArea(area);
            //发送成功得到应答后再增加区域与设备的对应关系
            case areaShape of
              AREASHAPE_CIRCLE:
                DataServer.SendSetCircleArea_New_V3(dev, TCircleArea(area), setType);
              AREASHAPE_RECT  :
                DataServer.SendSetRectangleArea_New_V3(dev,TRectangleArea(area), setType);
              AREASHAPE_POLY  :
                DataServer.SendSetNoSymbolArea_New_V3(dev,TNoSymbolArea(area));
            end;
//          end;
        end;
      end;
      if areaID > 0 then
      begin
        FDlg_AreaToDev.addKindToListView(areaID);
      end;
      Fmap.Draw;
    end;
  finally
    dlg.Free;
  end;
end;

procedure TMainf.ReadAlarmAreaFroDevExecute(Sender: TObject);
begin
  if not CheckDevId then
  begin
    messagebox(0, '请先《在监控车辆列表选中》或《在右上角输入》车辆!', '提示', mb_ok + mb_iconinformation);
    exit;
  end;
  if FrmReadAreaFor <> nil then
  begin
    DataServer.SendReadAreaListForDev(GCurSelectDev);
  end;
end;

procedure TMainf.FSetConfineAlarmNoSybol(Sender: TObject;
  WPointsAry: TWorldPointAry; PointsCnt: Integer);
  procedure GetPoint(A: TPoint; B: TPoint; var OutA1: TPoint; var OutA2: TPoint;
    var OutB1: TPoint; var OutB2: TPoint; Distance: longint);
  var
    k1, k2: double;
    temp: Extended;
  begin
          //斜率等于0度时
    if ((b.Y - a.Y) = 0) then
    begin
      OutA1.X := A.X;
      OutA2.X := A.X;

      OutA1.Y := A.Y + Distance;
      OutA2.Y := A.Y - Distance;

      OutB1.X := B.X;
      OutB2.X := B.X;
      OutB1.Y := B.Y + Distance;
      OutB2.Y := B.Y - Distance;
    end
          //斜率等于90度时
    else if ((b.X - a.X) = 0) then
    begin
      OutA1.X := A.X + Distance;
      OutA2.X := A.X - Distance;

      OutA1.Y := A.Y;
      OutA2.Y := A.Y;

      OutB1.X := B.X + Distance;
      OutB2.X := B.X - Distance;
      OutB1.Y := B.Y;
      OutB2.Y := B.Y;
    end
    else
    begin
      k1 := (b.Y - a.Y) / (b.X - a.X); //直线的斜率
      k2 := -1 / k1; //垂直直线的斜率
      temp := Sqrt((Distance * Distance) / (1 + k2 * k2));
      OutA1.X := round(temp + A.X);
      OutA2.X := round(-temp + A.X);

      OutA1.Y := round(k2 * (OutA1.X - A.X) + A.Y);
      OutA2.Y := round(k2 * (OutA2.X - A.X) + A.Y);

      OutB1.X := round(temp + B.X);
      OutB2.X := round(-temp + B.X);
      OutB1.Y := round(k2 * (OutB1.X - B.X) + B.Y);
      OutB2.Y := round(k2 * (OutB2.X - B.X) + B.Y);
    end;
  end;
var
  dlg: TFrm_AlarmNoSybol;
  NoSymbolArea: TNoSymbolArea;
  i: integer;
  temp1, temp2: TWorldPointAry;
  a1, a2, b1, b2: TPoint;
  tmpint: integer;
  areaID, kindArea: integer;
  AreaPar: string;
  AreaParMCU: string;
  param: array of byte;
  cx, cy, kindalarm: integer;
  dev: TDevice;
  Alen: word;
  Apoint: TEarthPoint;
  isvisble: integer;
  dateTime: TDateTime;
  ep: TEarthPoint;
begin
  ep.x := 0;
  ep.y := 0;
  ProcessDevArea(AREASHAPE_POLY, ep, 0, ep, ep, ep, WPointsAry, PointsCnt);
//  FMap.MouseAction := actNoAction;
//  tool_not_select.Checked := true;
//  AreaPar := '';
//  if PointsCnt < 2 then exit;
//  dlg := TFrm_AlarmNoSybol.Create(nil);
//  try
//    dlg.Edit4.Text := '不规则';
//    dlg.OverAlarmValue.Text := '30';
//    dlg.idlingAlarmValue.Text := '30';
//
//    dateTime := Now;
//    dlg.beginDate.DateTime := dateTime;
//    dlg.beginTime.DateTime := dateTime;
//    dateTime := dateTime + 1/12;
//    dlg.endDate.DateTime := dateTime;
//    dlg.endTime.DateTime := dateTime;
//
//    dlg.ShowModal;
//    if dlg.ModalResult = mrok then
//    begin
//      NoSymbolArea := TNoSymbolArea.Create;
//      FAllAreaManage.Add(NoSymbolArea);
//
//
//      NoSymbolArea.areaNO := StrToInt(dlg.Edit_NO.Text);
//      NoSymbolArea.AreaAlarmKind := dlg.Area_Property;
//      NoSymbolArea.AreaName := dlg.Edit2.Text;
//
//      dateTime := dlg.beginDate.DateTime;
//      ReplaceTime(dateTime, dlg.beginTime.DateTime);
//      dateTime := StrToDateTime(FormatDatetime('yy-mm-dd hh:nn:ss',dateTime));
//      NoSymbolArea.beginDateTiem := dateTime;
//
//      dateTime := dlg.endDate.DateTime;
//      ReplaceTime(dateTime, dlg.endTime.DateTime);
//      dateTime := StrToDateTime(FormatDatetime('yy-mm-dd hh:nn:ss',dateTime));
//      NoSymbolArea.endDateTime := dateTime;
//
//      NoSymbolArea.maxSpeed :=StrToInt(dlg.Edit_MaxSpeed.Text);
//      NoSymbolArea.continueTime := StrToInt(dlg.Edit_time.Text);
//
//
//      NoSymbolArea.AreaPictureKind := 2;
//      if PointsCnt < 3 then exit;
//      NoSymbolArea.SetLengthPointAry(PointsCnt);
//      NoSymbolArea.PointCount := PointsCnt;
//      Alen := PointsCnt * 4 * 2;
//      setlength(param, Alen);
//
//      for i := 0 to PointsCnt - 1 do
//      begin
//        NoSymbolArea.WorldPointAry[i] := WPointsAry[i];
//        Apoint := Project.XY2LoLa(NoSymbolArea.WorldPointAry[i]);
//        cx := round(Apoint.Longitude * 1000000);
//        cy := round(Apoint.Latitude * 1000000);
//        //把世界坐标转换成地球坐标
//        {param[i * 8] := strtoint('$' + copy(inttohex(cx, 8), 1, 2));
//        param[i * 8 + 1] := strtoint('$' + copy(inttohex(cx, 8), 3, 2));
//        param[i * 8 + 2] := strtoint('$' + copy(inttohex(cx, 8), 5, 2));
//        param[i * 8 + 3] := strtoint('$' + copy(inttohex(cx, 8), 7, 2));
//        param[i * 8 + 4] := strtoint('$' + copy(inttohex(cy, 8), 1, 2));
//        param[i * 8 + 5] := strtoint('$' + copy(inttohex(cy, 8), 3, 2));
//        param[i * 8 + 6] := strtoint('$' + copy(inttohex(cy, 8), 5, 2));
//        param[i * 8 + 7] := strtoint('$' + copy(inttohex(cy, 8), 7, 2)); }
//        if i = PointsCnt - 1 then
//        begin
//          AreaParMCU := AreaParMCU + FloatToStr(Apoint.Longitude) + ',' + FloatToStr(Apoint.Latitude);
//          AreaPar := AreaPar + inttostr(NoSymbolArea.WorldPointAry[i].X) + ',' + inttostr(NoSymbolArea.WorldPointAry[i].y);
//        end else
//        begin
//          AreaParMCU := AreaParMCU + FloatToStr(Apoint.Longitude) + ',' + FloatToStr(Apoint.Latitude) + ',';
//          AreaPar := AreaPar + inttostr(NoSymbolArea.WorldPointAry[i].X) + ',' + inttostr(NoSymbolArea.WorldPointAry[i].y) + ',';
//        end;
//      end;
//      NoSymbolArea.WorldPointAryToOutBox(NoSymbolArea.WorldPointAry, 0, NoSymbolArea.PointCount);
//      {NoSymbolArea.AreaName := dlg.Edit2.Text;
//      NoSymbolArea.OverAlarmValue := strtoint(dlg.OverAlarmValue.Text);
//      NoSymbolArea.idlingAlarmValue := strtoint(dlg.idlingAlarmValue.Text);
//      NoSymbolArea.AreaAlarmKind := dlg.ComboBox3.ItemIndex;    }
//
//      NoSymbolArea.AreaPar := AreaPar;
//      NoSymbolArea.AreaParMcu := AreaParMCU;
//      if dlg.ComboBox1.ItemIndex = 0 then
//      begin
//        NoSymbolArea.isshow := true;
//      end else
//      begin
//        NoSymbolArea.isshow := false;
//      end;
//      if NoSymbolArea.isshow then
//      begin
//        isvisble := 1;
//      end else
//      begin
//        isvisble := 0;
//      end;
//      //areaID := bs.AddNewArea_New(NoSymbolArea.AreaName, NoSymbolArea.AreaAlarmKind, NoSymbolArea.OverAlarmValue, NoSymbolArea.idlingAlarmValue,
//      //  2, PointsCnt * 2, AreaPar, isvisble);
//
//      AreaID := Bs.AddNewArea_new(NoSymbolArea.AreaName,NoSymbolArea.AreaPictureKind, NoSymbolArea.areaNO, NoSymbolArea.AreaAlarmKind,
//                                  DateTimeToStr(NoSymbolArea.beginDateTiem), DateTimeToStr(NoSymbolArea.endDateTime),NoSymbolArea.maxSpeed,
//                                  NoSymbolArea.continueTime, PointsCnt, AreaPar, AreaParMcu, isvisble);
//
//      NoSymbolArea.AreaID := areaID;
//      kindArea := 2;
//
//      if dlg.ListView1.Items.Count > 0 then
//      begin
//        for i := 0 to dlg.listview1.Items.Count - 1 do
//        begin
//          dev := TDevice(dlg.listview1.Items.Item[i].Data);
//          if Bs.AddNewDev_Area(dev.id, NoSymbolArea.AreaID) then
//            DataServer.SetSetNoSymbolArea_New_V3(dev, NoSymbolArea);
//
//          //DataServer.SendCLIENT_SETELCFENCE(dev, AreaID, NoSymbolArea.AreaAlarmKind, NoSymbolArea.OverAlarmValue, NoSymbolArea.idlingAlarmValue, kindArea, Alen, param);
//        end;
//      end;
//      if areaID > 0 then
//      begin
//        FDlg_AreaToDev.addKindToListView(areaID);
//      end;
//    end;
//  finally
//    dlg.Free;
//  end;

end;

procedure TMainf.FSetConfineAlarmRectangle(Sender: TObject; LeftPoint,
  RightPoint: TEarthPoint);
var
  dlg: TFrm_Rectangle;
  RectangleArea: TRectangleArea;
  AreaPar: string;
  AreaPerMCU: string;
  i, cx, cy, cx1, cy1, areaID: integer;
  param: array of byte;
  dev: TDevice;
  isvisble: integer;
  dateTime: TDateTime;
  ep: TEarthPoint;
  wpointary: TWorldPointAry;
begin
  ep.x := 0;
  ep.y := 0;
  ProcessDevArea(AREASHAPE_RECT, ep, 0, ep, LeftPoint, RightPoint, wpointary, 0);
//  try
//    dlg := TFrm_Rectangle.Create(self);
//    dlg.Edit4.Text := '矩形';
//    dlg.Edit3.Text := formatfloat('0.000', LeftPoint.Longitude); ;
//    dlg.Edit5.Text := formatfloat('0.000', LeftPoint.Latitude);
//    dlg.Edit6.Text := formatfloat('0.000', RightPoint.Longitude);
//    dlg.Edit1.Text := formatfloat('0.000', RightPoint.Latitude);
//    dlg.OverAlarmValue.Text := '30';
//    dlg.idlingAlarmValue.Text := '30';
//
//    dateTime := Now;
//    dlg.beginDate.DateTime := dateTime;
//    dlg.beginTime.DateTime := dateTime;
//    dateTime := dateTime + 1/12;
//    dlg.endDate.DateTime := dateTime;
//    dlg.endTime.DateTime := dateTime;
//
//    if dlg.ShowModal = mrok then
//    begin
//      RectangleArea := TRectangleArea.Create;
//      FAllAreaManage.Add(RectangleArea);
//      RectangleArea.leftPoint := LeftPoint;
//      RectangleArea.RightPoint := RightPoint;
//
//      RectangleArea.areaNO := StrToInt(dlg.Edit_NO.Text);
//      RectangleArea.AreaAlarmKind := dlg.Area_Property;
//      RectangleArea.AreaName := dlg.Edit2.Text;
//
//      dateTime := dlg.beginDate.DateTime;
//      ReplaceTime(dateTime, dlg.beginTime.DateTime);
//      dateTime := StrToDateTime(FormatDatetime('yy-mm-dd hh:nn:ss',dateTime));
//      RectangleArea.beginDateTiem := dateTime;
//
//      dateTime := dlg.endDate.DateTime;
//      ReplaceTime(dateTime, dlg.endTime.DateTime);
//      dateTime := StrToDateTime(FormatDatetime('yy-mm-dd hh:nn:ss',dateTime));
//      RectangleArea.endDateTime := dateTime;
//
//      RectangleArea.maxSpeed :=StrToInt(dlg.Edit_MaxSpeed.Text);
//      RectangleArea.continueTime := StrToInt(dlg.Edit_time.Text);
//
//      RectangleArea.AreaPictureKind := 1;
//      if dlg.ComboBox1.ItemIndex = 0 then
//      begin
//        RectangleArea.isshow := true;
//        isvisble := 1;
//      end else
//      begin
//        isvisble := 0;
//        RectangleArea.isshow := false;
//      end;
//      cx := round(RectangleArea.leftPoint.Longitude * 1000000);
//      cy := round(RectangleArea.leftPoint.Latitude * 1000000);
//      cx1 := round(RectangleArea.RightPoint.Longitude * 1000000);
//      cy1 := round(RectangleArea.RightPoint.Latitude * 1000000);
//
//      {RectangleArea.AreaName := dlg.Edit2.Text;
//      RectangleArea.AreaAlarmKind := dlg.ComboBox3.ItemIndex;
//      RectangleArea.OverAlarmValue := strtoint(dlg.OverAlarmValue.Text);
//      RectangleArea.idlingAlarmValue := strtoint(dlg.idlingAlarmValue.text);
//      RectangleArea.AreaPictureKind := 1;
//      cx := round(RectangleArea.leftPoint.Longitude * 1000000);
//      cy := round(RectangleArea.leftPoint.Latitude * 1000000);
//      cx1 := round(RectangleArea.RightPoint.Longitude * 1000000);
//      cy1 := round(RectangleArea.RightPoint.Latitude * 1000000);
//      if dlg.ComboBox1.ItemIndex = 0 then
//      begin
//        isvisble := 1;
//        RectangleArea.isshow := true;
//      end else
//      begin
//        RectangleArea.isshow := false;
//        isvisble := 0;
//      end;
//      RectangleArea.AreaAlarmKind := dlg.ComboBox3.ItemIndex;      }
//      AreaPerMCU := floattostr(RectangleArea.leftPoint.Longitude) + ',' + floattostr(RectangleArea.leftPoint.Latitude)
//                +  ',' + floattostr(RectangleArea.RightPoint.Longitude) + ',' + floattostr(RectangleArea.RightPoint.Latitude);
//      AreaPar := inttostr(cx) + ',' + inttostr(cy) + ',' + inttostr(cx1) + ',' + inttostr(cy1);
//      RectangleArea.AreaParMcu := AreaPerMCU;
//      RectangleArea.AreaPar := AreaPar;
//      //areaID := bs.AddNewArea_New(RectangleArea.AreaName, RectangleArea.AreaPictureKind, RectangleArea.OverAlarmValue, RectangleArea.idlingAlarmValue,
//       // 1, 16, AreaPar, isvisble);
//      AreaID := Bs.AddNewArea_new(RectangleArea.AreaName,RectangleArea.AreaPictureKind, RectangleArea.areaNO, RectangleArea.AreaAlarmKind,
//                                  DateTimeToStr(RectangleArea.beginDateTiem), DateTimeToStr(RectangleArea.endDateTime),RectangleArea.maxSpeed,
//                                  RectangleArea.continueTime, 2, AreaPar, AreaPerMCU, isvisble);
//
//      RectangleArea.AreaID := areaID;
//      setlength(param, 16);
//      param[0] := strtoint('$' + copy(inttohex(cx, 8), 1, 2));
//      param[1] := strtoint('$' + copy(inttohex(cx, 8), 3, 2));
//      param[2] := strtoint('$' + copy(inttohex(cx, 8), 5, 2));
//      param[3] := strtoint('$' + copy(inttohex(cx, 8), 7, 2));
//      param[4] := strtoint('$' + copy(inttohex(cy, 8), 1, 2));
//      param[5] := strtoint('$' + copy(inttohex(cy, 8), 3, 2));
//      param[6] := strtoint('$' + copy(inttohex(cy, 8), 5, 2));
//      param[7] := strtoint('$' + copy(inttohex(cy, 8), 7, 2));
//      param[8] := strtoint('$' + copy(inttohex(cx1, 8), 1, 2));
//      param[9] := strtoint('$' + copy(inttohex(cx1, 8), 3, 2));
//      param[10] := strtoint('$' + copy(inttohex(cx1, 8), 5, 2));
//      param[11] := strtoint('$' + copy(inttohex(cx1, 8), 7, 2));
//      param[12] := strtoint('$' + copy(inttohex(cy1, 8), 1, 2));
//      param[13] := strtoint('$' + copy(inttohex(cy1, 8), 3, 2));
//      param[14] := strtoint('$' + copy(inttohex(cy1, 8), 5, 2));
//      param[15] := strtoint('$' + copy(inttohex(cy1, 8), 7, 2));
//      if dlg.ListView1.Items.Count > 0 then
//      begin
//        for i := 0 to dlg.listview1.Items.Count - 1 do
//        begin
//          dev := TDevice(dlg.listview1.Items.Item[i].Data);
//          //DataServer.SendCLIENT_SETELCFENCE(dev, AreaID, RectangleArea.AreaAlarmKind, RectangleArea.OverAlarmValue, RectangleArea.idlingAlarmValue, RectangleArea.AreaPictureKind, 12, param);
//          if Bs.AddNewDev_Area(dev.id, RectangleArea.AreaID) then
//            DataServer.SendSetRectangleArea_New_V3(dev, RectangleArea);
//        end;
//      end;
//      if areaID > 0 then
//      begin
//        FDlg_AreaToDev.addKindToListView(areaID);
//      end;
//    end;
//    Fmap.Draw;
//  finally
//    dlg.Free;
//  end;
end;

function TMainf.connectionAccess: boolean;
var
  flag: boolean;
begin
  flag := false;
  if adoconnection1.Connected then
  begin
    flag := true;
  end else
  begin
    try
      adoconnection1.Connected := false;
      adoconnection1.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' +
        extractfilepath(application.ExeName) + 'emptyTaix\emptyTaix.mdb;' +
        'Jet OLEDB:Database Password="";persist Security Info=False';
      adoconnection1.LoginPrompt := false;
      adoconnection1.Connected := true;
      flag := true;
    except
      flag := false;
    end;
  end;
  result := flag;

end;

procedure TMainf.DoReadDevPicTimesInfoRet(ADev: TDevice; ANoPicBj: Boolean;
  FirstDateTime, LastDateTime: string; ABuf: PByte; BufCount: Integer);
begin

end;

procedure TMainf.DoOnSeeEmergncyAlarmDetail(ADevIdStr,AStartTime,ARemoveTime:String;
    AStartLongi,AStartLati,ARemoveLongi,ARemoveLati:Double);
var
  dev:TDevice;
begin
  dev:= ADeviceManage.find(ADevIdStr);
  if dev = nil then exit;
  if FDlg_SeeEmergncyAlarmDetail <> nil then FreeAndNil(FDlg_SeeEmergncyAlarmDetail);
  FDlg_SeeEmergncyAlarmDetail := TSeeEmergncyAlarmDetailFrm.Create(Self);
  FDlg_SeeEmergncyAlarmDetail.LoadDetailInfo(dev,AStartTime,ARemoveTime,AStartLongi,AStartLati,
    ARemoveLongi,ARemoveLati);
  FDlg_SeeEmergncyAlarmDetail.Show;
end;

procedure TMainf.fun_DevShowOnlyExecute(Sender: TObject); //选中，只显示某车
var
  i: Integer;
begin
  if GCurSelectDev <> nil then
  begin
    fun_DevShowOnly.Checked := not fun_DevShowOnly.Checked;
    if fun_DevShowOnly.Checked then
    begin
      for i := 0 to ADeviceManage.Count - 1 do
        ADeviceManage.Items[i].Hide := true;
      GCurSelectDev.Hide := False;
    end
    else
    begin
      for i := 0 to ADeviceManage.Count - 1 do
        ADeviceManage.Items[i].Hide := False;
    end;
    fun_DevHide.Checked := GCurSelectDev.Hide;
    FMap.DrawGpsMap_ClearDraw;
  end;
end;

procedure TMainf.HexStringToBytes(AHexS: string; var ALen: Integer;
  ABuf: PByte);
var
  i: Integer;
  s: string;
begin
  ALen := Length(AHexS) div 2;
  for i := 0 to ALen - 1 do
  begin
    s := copy(AHexs, i * 2 + 1, 2);
    ABuf^ := strtoint('$' + s);
    inc(PByte(ABuf));
  end;
end;

procedure TMainf.Show_ListeningDevExecute(Sender: TObject); //重点查看正在被监听车辆(在地图居中并跟踪)
begin
//  if (FDlg_ListeniningFrm <> nil) and FDlg_ListeniningFrm.Showing then
//  begin
//    Edit1.Text := '';
//    Edit1.Text := FDlg_ListeniningFrm.EditDevCarNo.Text;
//    if (GCurSelectDev.Longitude = 0) or (GCurSelectDev.Latitude = 0) then
//    begin
//      MessageBox(handle, '目前该车无定位数据，不能在地图上显示!', '提示', mb_ok + mb_iconinformation);
//      exit;
//    end;
//    //车辆居中
//    fun_Locate_Car.Execute;
//    //跟踪车辆
//    FMap.GpsDrawlayer.AutoFollowDevice := GCurSelectDev;
//    StatusBar1.Panels.Items[2].Text := '当前跟踪车辆：' + GCurSelectDev.Car.No;
//  end;
end;

procedure TMainf.TestUserNotice(Sender: TObject);
begin
  MessageBox(Handle, '对不起，试用版不能使用该功能!', '提示', MB_OK + MB_ICONINFORMATION);
end;

//收到ADevManage中处理定位数据中的紧急报警，将报警车辆列表直接显示在最前面，且焦点放到该车上。

procedure TMainf.DevEmergncyAlarm(ADev: TDevice);
var
  i: integer;
  node: TcxTreeListNode;
begin
  if FDlg_AlarmCar = nil then
  begin
    FDlg_AlarmCar := TFrmAlarmCar.Create(self);
    FDlg_AlarmCar.ManualDock(PageControlBottom, nil, alLeft);
    FDlg_AlarmCar.Show;
    show_AlarmLists.Checked := True;
  end;
  if not GlobalParam.IsEmergncyAlarmAutoFirstAlarm then exit;
  //紧急报警后，自动将 报警车辆列表窗体 置前
  try
    if (not FDlg_AlarmCar.Visible) or (FDlg_AlarmCar.Floating) then
    begin
      FDlg_AlarmCar.ManualDock(PageControlBottom, nil, alLeft);
      FDlg_AlarmCar.Show;
    end;

    for i := 0 to PageControlBottom.PageCount - 1 do
    begin
      if PageControlBottom.Pages[i].Caption = FDlg_AlarmCar.Caption then
      begin
        PageControlBottom.ActivePageIndex := i;
        break;
      end;
    end;
    if not show_AlarmLists.Checked then
      show_AlarmLists.Checked := True;
    FDlg_AlarmCar.PageControl1.ActivePageIndex := 0;
    node := FindNodeByTextIncxTreeList(ADev.IdStr, FDlg_AlarmCar.cxAlarmList, 0);
    if node = nil then exit;
    FDlg_AlarmCar.cxAlarmList.FocusedNode := node;
  except
  end;
end;

procedure TMainf.ck_TjGrpDevsExecute(Sender: TObject);
var
  i: integer;
begin
  if FDlg_TjGrpDev = nil then
    FDlg_TjGrpDev := TTjGrpDevsFrm.Create(self);
  ShowQueryForm(PageControl_Center, FDlg_TjGrpDev, TTjGrpDevsFrm, alLeft);
end;

procedure TMainf.DeviceStateListDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
  procedure DoAlarmProcess(AlarmName,Alarmstr:string); //各类报警
  var
    row: integer;
  begin
    if DeviceStateList.Values[AlarmName] = Alarmstr then
    begin
      DeviceStateList.FindRow(AlarmName, row);
      if Arow = row then
      begin
        TValueListEditorAccess(Sender).Canvas.Brush.Color := $00C0DCC0;
        TValueListEditorAccess(Sender).Canvas.Font.Color := clred; //红色字显示
      end;
    end;
  end;
  procedure DoErrProcess(ErrName,ErrStr:String); //各类故障
  var
    row: integer;
  begin
    if DeviceStateList.Values[ErrName] = ErrStr then
    begin
      DeviceStateList.FindRow(ErrName, row);
      if Arow = row then
      begin
        TValueListEditorAccess(Sender).Canvas.Brush.Color := $00C0DCC0;
        TValueListEditorAccess(Sender).Canvas.Font.Color := clGreen; //绿色字显示
      end;
    end;
  end;      
begin
  TValueListEditorAccess(Sender).OnDrawCell := nil;
  DoErrProcess('定位状态','休眠');

  DoAlarmProcess('紧急报警','是');
  DoAlarmProcess('危险预警','是');
  DoAlarmProcess('超速报警','是');
  DoAlarmProcess('疲劳驾驶报警','是');
  DoAlarmProcess('终端主电源欠压报警','是');
  DoAlarmProcess('终端主电源掉电报警','是');
  DoAlarmProcess('当天累计驾驶超时报警','是');
  DoAlarmProcess('超时停车报警','是');
  DoAlarmProcess('进出区域报警','是');
  DoAlarmProcess('进出路线报警','是');
  DoAlarmProcess('路段行驶时间','不足或过长');
  DoAlarmProcess('路线偏离报警','是');
  DoAlarmProcess('车辆被盗报警','是');
  DoAlarmProcess('车辆非法点火报警','是');
  DoAlarmProcess('车辆非法位移报警','是');
  DoAlarmProcess('碰撞侧翻报警报警','是');
  DoAlarmProcess('超速预警','是');
  DoAlarmProcess('疲劳驾驶预警','是');
  DoAlarmProcess('侧翻预警','是');
  DoAlarmProcess('非法开门报警','是');

  DoErrProcess('GPS模块','故障');
  DoErrProcess('GPS天线','未接或剪断');
  DoErrProcess('GPS天线短路','是');
  DoErrProcess('终端LCD或显示器','故障');
  DoErrProcess('TTS模块','故障');
  DoErrProcess('摄像头','故障');
  DoErrProcess('车辆VSS','故障');
  DoErrProcess('车辆油量','异常');
  DoErrProcess('道路运输证IC卡模块', '故障');

  TValueListEditorAccess(Sender).DrawCell(ACol, ARow, Rect, State);
  TValueListEditorAccess(Sender).OnDrawCell := DeviceStateListDrawCell;
end;

procedure TMainf.SetFrmToFirst(AFrm:TForm;APanel:TPageControl);
var
  i: Integer;
begin
  if APanel.PageCount = 0 then exit;
  if AFrm = nil then exit;
  for i := 0 to APanel.PageCount - 1 do
  begin
    if APanel.Pages[i].Caption = AFrm.Caption then
    begin
      try
        APanel.ActivePageIndex := i;
      except
        break;
      end;
      break;
    end;
  end;
end;

procedure TMainf.fun_setDevEventListExecute(Sender: TObject);
var
  dlg:  TfrmSetDevEvent;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  if not CheckDevId then
  begin
    fun_Devs_SetDevEventListExecute(Sender);
    exit;
  end;
  dlg := TfrmSetDevEvent.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    Add_A_Device;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_Devs_SetDevEventListExecute(Sender: TObject);
var
  dlg: TfrmSetDevEvent;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  dlg := TfrmSetDevEvent.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    AddDeviceByGroup;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_sendQuestionExecute(Sender: TObject);
var
  dlg: TsendQuestionFrm;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  if not CheckDevId then
  begin
    fun_Devs_SendDevQuestionExecute(Sender);
    exit;
  end;
  dlg := TsendQuestionFrm.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    Add_A_Device;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_Devs_SendDevQuestionExecute(Sender: TObject);
var
  dlg: TsendQuestionFrm;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  dlg := TsendQuestionFrm.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    AddDeviceByGroup;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.ck_ServeJudgeExecute(Sender: TObject);
begin
//  try
//    if FDlg_ServerJudge= nil then
//      FDlg_ServerJudge := TServeJudgeFrm.Create(self);
//    ShowQueryForm(PageControl_Center, FDlg_ServerJudge, TServeJudgeFrm, alLeft);
//  finally
//    //dlg.Free;
//  end;
end;

procedure TMainf.fun_FindPostionExecute(Sender: TObject);
begin
  if not CheckDevId then
  begin
    messagebox(0, '请先《在监控车辆列表选中》或《在右上角输入》车辆!', '提示', mb_ok + mb_iconinformation);
    exit;
  end;
  if GCurSelectDev <> nil then
    DataServer.FindPostion_V3(GCurSelectDev);
end;

procedure TMainf.fun_sendAntiFakeExecute(Sender: TObject);
var
  dlg: TFangWeiFrm;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  if not CheckDevId then
  begin
    fun_Devs_sendAntiFakeExecute(Sender);
    exit;
  end;
  dlg := TFangWeiFrm.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    Add_A_Device;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_Devs_sendAntiFakeExecute(Sender: TObject);
var
  dlg: TFangWeiFrm;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  dlg := TFangWeiFrm.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    AddDeviceByGroup;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_SendBackCallTelExecute(Sender: TObject);
var
  dlg: TBackCallTelFrm;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  if not CheckDevId then
  begin
    fun_Devs_SendBackCallTelExecute(Sender);
    exit;
  end;
  dlg := TBackCallTelFrm.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    Add_A_Device;
    dlg.editTel.Text := GlobalParam.CallBackTel;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_Devs_SendBackCallTelExecute(Sender: TObject);
var
  dlg: TBackCallTelFrm;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  dlg := TBackCallTelFrm.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    AddDeviceByGroup;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_SendControlCarExecute(Sender: TObject);
var
  dlg: TControlCarFrm;
  password: string;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}

  if InputQuery('请输入密码', '密码：   ', password) then
  begin
    if password <> current_user.Password then
    begin
      MessageBox(Handle, '密码不正确', '提示', MB_OK + MB_ICONWARNING);
      Exit;
    end;
  end
  else
    Exit;

  if not CheckDevId then
  begin
    fun_Devs_SendControlCarExecute(Sender);
    exit;
  end;
  dlg := TControlCarFrm.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    Add_A_Device;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_Devs_SendControlCarExecute(Sender: TObject);
var
  dlg: TControlCarFrm;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  dlg := TControlCarFrm.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    AddDeviceByGroup;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_SendInfoServerExecute(Sender: TObject);
var
  dlg: TInfoServerFrm;
begin
  if FInfoTypeManage.Count <= 0 then
  begin
    MessageBox(Handle, '无信息点播类型，请先维护信息点播类型', '提示', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  if not CheckDevId then
  begin
    fun_Devs_SendInfoServerExecute(Sender);
    exit;
  end;
  dlg := TInfoServerFrm.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    Add_A_Device;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_Devs_SendInfoServerExecute(Sender: TObject);
var
  dlg: TInfoServerFrm;
begin
  if FInfoTypeManage.Count <= 0 then
  begin
    MessageBox(Handle, '无信息点播类型，请先维护信息点播类型', '提示', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  dlg := TInfoServerFrm.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    AddDeviceByGroup;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_SendQueryPictureExecute(Sender: TObject);
var
  dlg: TQueryPictureFrm;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  if not CheckDevId then
  begin
    fun_Devs_SendQueryPictureExecute(Sender);
    exit;
  end;
  dlg := TQueryPictureFrm.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    Add_A_Device;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_Devs_SendQueryPictureExecute(Sender: TObject);
var
  dlg: TQueryPictureFrm;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  dlg := TQueryPictureFrm.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    AddDeviceByGroup;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_SendUpPictureExecute(Sender: TObject);
var
  dlg: TUpPictureFrm;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  if not CheckDevId then
  begin
    fun_Devs_SendUpPictureExecute(Sender);
    exit;
  end;
  dlg := TUpPictureFrm.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    Add_A_Device;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_Devs_SendUpPictureExecute(Sender: TObject);
var
  dlg: TUpPictureFrm;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  dlg := TUpPictureFrm.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    AddDeviceByGroup;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_SendStopAntiFakeExecute(Sender: TObject);
begin
  if not CheckDevId then
  begin
   //PopMsg('提示','请先《在监控车辆列表选中》或《在右上角输入》车辆');
    messagebox(0, '请先《在监控车辆列表选中》或《在右上角输入》车辆!', '提示', mb_ok + mb_iconinformation);
    exit;
  end;
  DataServer.SendStopAntiFake_V3(GCurSelectDev);
end;

procedure TMainf.Show_EventListExecute(Sender: TObject);
begin
  ShowWindows(Sender, PageControlBottom, FDlg_EventListFrm, alLeft);
end;

procedure TMainf.fun_SendClassInfoMenuExecute(Sender: TObject);
var
  dlg: TClassMenuFrm;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  if not CheckDevId then
  begin
    fun_Devs_SendClassInfoMenuExecute(Sender);
    exit;
  end;
  dlg := TClassMenuFrm.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    Add_A_Device;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_Devs_SendClassInfoMenuExecute(Sender: TObject);
var
  dlg: TClassMenuFrm;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  dlg := TClassMenuFrm.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    AddDeviceByGroup;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.Show_AnswerListExecute(Sender: TObject);
begin
  ShowWindows(Sender, PageControlBottom, FDlg_AnswerListFrm, alLeft);
end;

procedure TMainf.fun_SendInfoMenuExecute(Sender: TObject);
var
  dlg: TfrmInfoOrder;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  if not CheckDevId then
  begin
    fun_Devs_SendInfoMenuExecute(Sender);
    exit;
  end;
  dlg := TfrmInfoOrder.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    Add_A_Device;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_Devs_SendInfoMenuExecute(Sender: TObject);
var
  dlg: TfrmInfoOrder;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  dlg := TfrmInfoOrder.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    AddDeviceByGroup;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_InitializeMCUExecute(Sender: TObject);
var
  dlg: TInitializeMCUFrm;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  if not CheckDevId then
  begin
    fun_Devs_SendInfoMenuExecute(Sender);
    exit;
  end;
  dlg := TInitializeMCUFrm.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    Add_A_Device;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_Devs_InitializeMCUExecute(Sender: TObject);
var
  dlg: TInitializeMCUFrm;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  dlg := TInitializeMCUFrm.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    AddDeviceByGroup;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_ControlTerminalExecute(Sender: TObject);
var
  dlg: TControlTerminalFrm;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  if not CheckDevId then
  begin
    fun_Devs_ControlTerminalExecute(Sender);
    exit;
  end;
  dlg := TControlTerminalFrm.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    Add_A_Device;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_Devs_ControlTerminalExecute(Sender: TObject);
var
  dlg: TControlTerminalFrm;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  dlg := TControlTerminalFrm.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    AddDeviceByGroup;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_ControlMCUExecute(Sender: TObject);
var
  dlg: TControlMCUFrm;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  if not CheckDevId then
  begin
    fun_Devs_ControlMCUExecute(Sender);
    exit;
  end;
  dlg := TControlMCUFrm.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    Add_A_Device;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_Devs_ControlMCUExecute(Sender: TObject);
var
  dlg: TControlMCUFrm;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  dlg := TControlMCUFrm.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    AddDeviceByGroup;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.N81Click(Sender: TObject);
var
  filePath: string;
begin
  filePath := ExtractFilePath(Application.ExeName) + '\help\智能监控客户端_哈尔滨出租车版(V3[1].10.20).doc';
  ShellExecute(Handle,'open',   pchar(filePath),   nil,nil,SW_SHOWNORMAL);
end;

procedure TMainf.ck_MessageListExecute(Sender: TObject);
var
  i: integer;
begin
  if FDlg_ckMessageList = nil then
    FDlg_ckMessageList := TQueryMessageListFrm.Create(self);
  ShowQueryForm(PageControl_Center, FDlg_ckMessageList, TQueryMessageListFrm, alLeft);
end;


procedure TMainf.show_EarlyWarningCarExecute(Sender: TObject);
begin
//  ShowWindows(Sender, PageControlBottom, FDlg_EarlyWarning, alLeft);
end;

procedure TMainf.fun_SendQueryAudioExecute(Sender: TObject);
var
  dlg: TQueryAudioFrm;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  if not CheckDevId then
  begin
    fun_Devs_SendQueryAudioExecute(Sender);
    exit;
  end;
  dlg := TQueryAudioFrm.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    Add_A_Device;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_Devs_SendQueryAudioExecute(Sender: TObject);
var
  dlg: TQueryAudioFrm;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  dlg := TQueryAudioFrm.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    AddDeviceByGroup;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_Polling_MCUExecute(Sender: TObject);
var
  dlg: TPolling_MCUFrm;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  if not CheckDevId then
  begin
    fun_Devs_Polling_MCUExecute(Sender);
    exit;
  end;
  dlg := TPolling_MCUFrm.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    Add_A_Device;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_Devs_Polling_MCUExecute(Sender: TObject);
var
  dlg: TPolling_MCUFrm;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  dlg := TPolling_MCUFrm.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    if ListSelectDev.Count > 0 then
    begin
      AddDeviceFromListSelectDev;
    end
    else
    begin
      AddDeviceByGroup;
    end;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.Show_Prompt_InfoExecute(Sender: TObject);
begin
  ShowWindows(Sender, PageControlBottom, FDlg_Prompt_Info, alLeft);
end;

procedure TMainf.Show_QueryPictureListExecute(Sender: TObject);
begin
  ShowWindows(Sender, PageControlBottom, FDlg_QueryPictureListFrm, alLeft);
end;


procedure TMainf.sys_manage_driverBlacklistExecute(Sender: TObject);
//var
//  i: Integer;
begin
//  try
//    if FDlg_DriverBlackList= nil then
//      FDlg_DriverBlackList := TfrmDriverBlacklist.Create(self);
//    ShowQueryForm(PageControl_Center, FDlg_DriverBlackList, TfrmDriverBlacklist, alLeft);
//  finally
//    //dlg.Free;
//  end;
end;

procedure TMainf.sys_manage_passengerblacklistExecute(Sender: TObject);
//var
//  i: Integer;
begin
//  try
//    if FDlg_PassengerBlackList = nil then
//      FDlg_PassengerBlackList := TfrmPassengerBlacklist.Create(self);
//    ShowQueryForm(PageControl_Center, FDlg_PassengerBlackList, TfrmPassengerBlacklist, alLeft);
//  finally
//    //dlg.Free;
//  end;
end;

procedure TMainf.N311Click(Sender: TObject);
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  try
    {重新选择车辆 用统一的选择车辆窗体}
    frmSend.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := frmSend.ListView1;
    Add_A_Device;
    frmSend.Show;
  finally
    FListView_SelectDevs := nil;
  end;

end;

procedure TMainf.show_FindThingExecute(Sender: TObject);
begin
//  ShowWindows(Sender, PageControlBottom, FDlg_FindThingFrm, alLeft);
end;

procedure TMainf.tool_FindThingExecute(Sender: TObject);
var
  i: integer;
begin
  FMap.MouseAction := actFindThing;
  for i := 0 to ActionList1.ActionCount - 1 do
  begin
    if (ActionList1.Actions[i].Category = '2地图工具') then
    begin
      if ActionList1.Actions[i].Name <> 'tool_bird_eye' then
      begin
        TAction(ActionList1.Actions[i]).Checked := false;
      end;
    end;
  end;
  TAction(Sender).Checked := true;
end;

procedure TMainf.sendPerMessage(Value: string);
begin
  FFLashDlg.SetLabel(Value);
end;

procedure TMainf.ck_QuestionListExecute(Sender: TObject);
var
  i: integer;
begin
  if FDlg_ckQuestionList = nil then
    FDlg_ckQuestionList := TQueryQuestionListFrm.Create(self);
  ShowQueryForm(PageControl_Center, FDlg_ckQuestionList, TQueryQuestionListFrm, alLeft);
end;

procedure TMainf.ck_QueryCmdListExecute(Sender: TObject);
var
  i: integer;
begin
  if FDlg_ckCmdList = nil then
    FDlg_ckCmdList := TQueryCmdListFrm.Create(self);
  ShowQueryForm(PageControl_Center, FDlg_ckCmdList, TQueryCmdListFrm, alLeft);
end;

procedure TMainf.fun_QueryBlackVerExecute(Sender: TObject);
begin
//  if not CheckDevId then
//  begin
//   //PopMsg('提示','请先《在监控车辆列表选中》或《在右上角输入》车辆');
//    messagebox(0, '请先《在监控车辆列表选中》或《在右上角输入》车辆!', '提示', mb_ok + mb_iconinformation);
//    exit;
//  end;
//  DataServer.FindBlackVer_V3(GCurSelectDev);
end;

procedure TMainf.ShowListDeviceByBJYW(Value: string);
var
  i: integer;
  temp: string;
  Pr: TPrivilege;
  group: TDevGroup;
  driver: TDriver;
begin
  if trim(Value) = '' then
  begin
    ListDevice.Cells[1, 1] := '';
    ListDevice.Cells[1, 2] := '';
    ListDevice.Cells[1, 3] := '';
    ListDevice.Cells[1, 4] := '';
    ListDevice.Cells[1, 5] := '';
    ListDevice.Cells[1, 6] := '';
    ListDevice.Cells[1, 7] := '';
    ListDevice.Cells[1, 8] := '';
    ListDevice.Cells[1, 9] := '';
    ListDevice.Cells[1, 10] := '';
    ListDevice.Cells[1, 11] := '';
    ListDevice.Cells[1, 12] := '';
    //ListDevice.Cells[1, 12] := '';
    exit;
  end;
  edit1.text := trim(Value);
  //　如果　用户手动输入
  if (FdevKeyIn) then
  begin
    FDevKeyIn := false;
    GCurSelectDev := ADeviceManage.FindDevFromCarNo(Value);
    if (GCurSelectDev <> nil) then
    begin
      edit2.Text := GCurSelectDev.id;
      if not ((GCurSelectDev.Longitude = 0) and (GCurSelectDev.Latitude = 0)) then
      begin
        fun_Locate_Car.Execute;
      end;
    end
    else
    begin
      for i := 0 to ADeviceManage.Count - 1 do
      begin
        if ADeviceManage.Items[i].DispLabel = Value then
        begin
          GCurSelectDev := ADeviceManage.Items[i];
          break;
        end;
      end;
      if GCurSelectDev = nil then
      begin
        if (Value <> '') then
          ListDevice.Cells[1, 1] := '无此车或无权限查看该车';
        ListDevice.Cells[1, 2] := '';
        ListDevice.Cells[1, 3] := '';
        ListDevice.Cells[1, 4] := '';
        ListDevice.Cells[1, 5] := '';
        ListDevice.Cells[1, 6] := '';
        ListDevice.Cells[1, 7] := '';
        ListDevice.Cells[1, 8] := '';
        ListDevice.Cells[1, 9] := '';
        ListDevice.Cells[1, 10] := '';
        ListDevice.Cells[1, 11] := '';
        ListDevice.Cells[1, 12] := '';
        exit;
      end;
    end;
  end;

  if GCurSelectDev = nil then exit;
  edit1.Text := GCurSelectDev.Car.No;
  ComboBoxCarNO.Text := GCurSelectDev.Car.No;
  ComboBoxCarNO.Hint := ComboBoxCarNO.Text;
  ShowDeviceTrack_Watch(GCurSelectDev); //是否显示轨迹 ，是否被跟踪

  //车辆详细信息
  ListDevice.Cells[1, 1] := GCurSelectDev.Car.No;
  if GCurSelectDev.isOnline then
  begin
   temp := '';
   if GCurSelectDev.Switch[MSG_STATE_4] then
     temp := temp + '停运'
   else
     temp := temp + '营运';

    if GCurSelectDev.Switch_Warning[MSG_WARNING_0] then
      temp := temp + ' 紧急报警';

    ListDevice.Cells[1, 2] := temp;

    if GCurSelectDev.Switch[MSG_STATE_1] then
    begin
      ListDevice.Cells[1, 3] := getCarAngle(GCurSelectDev.Orientation);
      ListDevice.Cells[1, 4] := '定位';
    end
    else
    begin
      ListDevice.Cells[1, 3] := getCarAngle(GCurSelectDev.Orientation);
      ListDevice.Cells[1, 4] := '非定位';
    end;
  end
  else
  begin
    ListDevice.Cells[1, 2] := '不在线';//'非定位';
    ListDevice.Cells[1, 3] := getCarAngle(GCurSelectDev.Orientation);
    ListDevice.Cells[1, 4] := '非定位';
  end;
  //ListDevice.Cells[1, 3] := GCurSelectDev.Car.ShengName + '\' + GCurSelectDev.Car.ShiName;

  ListDevice.Cells[1, 5] := GCurSelectDev.TerminalTypeName;

  if ADevGroupManage.find(GCurSelectDev.GroupID) = nil then
    Exit;
  driver := ADriverManage.GetDriver(GCurSelectDev);
  ListDevice.Cells[1, 6] := driver.Name;
  ListDevice.Cells[1, 7] := driver.TEL;
  ListDevice.Cells[1, 8] := GCurSelectDev.Car.CarType;
  ListDevice.Cells[1, 9]:= GCurSelectDev.Car.CPColorStr;
  ListDevice.Cells[1, 10]:= GCurSelectDev.Car.ShengName + '|' + GCurSelectDev.Car.ShiName; //FormatFloat('00',GCurSelectDev.Car.ShengId)+'|'+FormatFloat('0000',GCurSelectDev.Car.ShiId);
  group := ADevGroupManage.find(GCurSelectDev.GroupID);
  if group <> nil then
  begin
    ListDevice.Cells[1, 11] := group.Name;
    ListDevice.Cells[1, 12] := group.DLYSXKZ;
  end
  else
  begin
    ListDevice.Cells[1, 11] := '未知';
    ListDevice.Cells[1, 12] := '';
  end;
end;

procedure TMainf.InfoListDevice;
var
  Pr: TPrivilege;
begin
  ListDevice.Strings.Clear;
  ListDevice.Strings.Add('车牌号=');
  ListDevice.Strings.Add('车辆状态=');
  //ListDevice.Strings.Add('车辆位置=');
  ListDevice.Strings.Add('方向=');
  ListDevice.Strings.Add('车载终端状态=');
  ListDevice.Strings.Add('终端类型=');
  ListDevice.Strings.Add('驾驶员=');
  ListDevice.Strings.Add('驾驶员电话=');
  ListDevice.Strings.Add('厂牌型号=');
  ListDevice.Strings.Add('车牌颜色=');
  ListDevice.Strings.Add('所属省市域=');
  ListDevice.Strings.Add('所属公司=');
  ListDevice.Strings.Add('道路运输许可证=');
end;

procedure TMainf.N320Click(Sender: TObject);
begin
  N320.Checked := not n320.Checked;
  GlobalParam.isShowAllDev := N320.Checked;

  N321.Checked := False;
  GlobalParam.isShowEmpty := False;

  N322.Checked := False;

  GlobalParam.SaveToFile(Application.ExeName + '.config');
  FMap.DrawGpsMap_ClearDraw;
end;

procedure TMainf.N321Click(Sender: TObject);
begin
  N321.Checked := not N321.Checked;
  GlobalParam.isShowEmpty := N321.Checked;

  N320.Checked := False;
  GlobalParam.isShowAllDev := False;

  N322.Checked := False;

  GlobalParam.SaveToFile(Application.ExeName + '.config');
  FMap.DrawGpsMap_ClearDraw;
end;

procedure TMainf.N322Click(Sender: TObject);
begin
  N322.Checked := not N322.Checked;
  GlobalParam.isShowEmpty := False;

  N320.Checked := False;
  GlobalParam.isShowAllDev := False;

  N321.Checked := False;
  GlobalParam.SaveToFile(Application.ExeName + '.config');
  FMap.DrawGpsMap_ClearDraw;
end;

procedure TMainf.List_TreeGroup;
      //group_list
      //列出所有子组－－－－入参：父组ID，父组节点，当前还余下数
//  procedure group_list(AParant_ID: integer; Anode: TTreenode; Acurrent_cnt: integer);
//  var
//    i, j: integer;
//    leaf_id: array of integer; //子级的 ID 数组
//    leaf_cnt: integer; //子级的 ID  数组个数
//    leaf_node: array of TTreenode; //子级的节点
//    devGrp: TDevGroup;
//    dev: TDevice;
//  begin
//    leaf_cnt := 0;
//    for i := 0 to ADevGroupManage.Count - 1 do
//    begin
//      if ADevGroupManage.items[i].parent = AParant_ID then
//      begin
//        leaf_cnt := leaf_cnt + 1;
//        setlength(leaf_id, leaf_cnt);
//        setlength(leaf_node, leaf_cnt);
//        leaf_id[leaf_cnt - 1] := ADevGroupManage.items[i].id;
//        leaf_node[leaf_cnt - 1] := treeview2.Items.addchild(
//          Anode,
//          trim(ADevGroupManage.items[i].name)+ '(' + IntToStr(ADevGroupManage.items[i].DevListCount) + ')');
//
//        leaf_node[leaf_cnt - 1].data := pointer(leaf_id[leaf_cnt - 1]);
//        Acurrent_cnt := Acurrent_cnt - 1;
//        if Acurrent_cnt <= 0 then break;
//
//        {devGrp := ADevGroupManage.items[i];
//        for j := 0 to devGrp.DevListCount - 1 do
//        begin
//          dev := ADeviceManage.find(devGrp.DevList[j]);
//          if dev.GroupID = devGrp.id then
//            TreeView1.Items.AddChild(leaf_node[leaf_cnt - 1], dev.Car.No).Data := Pointer(-2);
//        end;    }
//
//        if ADevGroupManage.items[i].leaf_nod = false then
//          group_list(leaf_id[leaf_cnt - 1], leaf_node[leaf_cnt - 1], Acurrent_cnt);
//      end;
//    end;
//  end;
     //----------
var
  vn_node: TTreenode;
  cnt: integer;
//  j: integer;
begin
//  treeview3.Items.Clear;
//  if ADeviceManage.Count = 0 then
//  begin
// //   edit1.Text := '';
//    GCurSelectGroupID := -1;
//  end;
//  vn_node := treeview3.Items.add(treeview3.topitem, '所有车辆');
//  vn_node.Data := pointer(-1); //所有车辆
//  cnt := ADevGroupManage.Count;
//  GCurSelectGroupID := -1;
//  group_list(0, vn_node, cnt ,treeview3);     //group_list(0, vn_node, cnt);
//  FCurrSelect := -2;
////  edit1.Text := '请选择组...';
//  vn_node.Expanded := true;

  treeview2.Items.Clear;
  if ADeviceManage.Count = 0 then
  begin
 //   edit1.Text := '';
    GCurSelectGroupID := -1;
  end;
  vn_node := treeview2.Items.add(treeview2.topitem, '所有车辆');
  vn_node.Data := pointer(-1); //所有车辆
  cnt := ADevGroupManage.Count;
  GCurSelectGroupID := -1;
  group_list(0, vn_node, cnt ,TreeView2);     //group_list(0, vn_node, cnt);
  FCurrSelect := -2;
//  edit1.Text := '请选择组...';
  vn_node.Expanded := true;
  TreeView2.AlphaSort();
//  treeview2.SortType := stText;
//  TreeView2.AlphaSort(true)
end;

procedure TMainf.TreeView1Change(Sender: TObject; Node: TTreeNode);
var
  grpId: integer;
  j: integer;
  dev: Tdevice;
  devId: integer;
  devGrp: TDevGroup;
begin
  if Node = nil then exit;
  grpId := Integer(Node.Data);
  //if grpId = FCurrSelect then exit; //选择没变化,直接退出
  if grpId = -1 then //所有车辆
  begin
    exit;
  end;
  if grpId >= 0 then //某分组车辆
  begin

  end;
  TreeView1.PopupMenu := PopupMenu_DevGroup;
  if grpId = -2 then
  begin
    GCurSelectDev := ADeviceManage.FindDevFromCarNo(Trim(Node.Text));
    Edit2.Text := GCurSelectDev.Id;
    Edit1.Text := GCurSelectDev.Car.No;
    TreeView1.PopupMenu := PopupMenu_funDev;
  end;
  GCurSelectGroupID := grpId;
end;

procedure TMainf.TreeView1Click(Sender: TObject);
begin
  TreeView1.SetFocus;
  ShowState(GCurSelectDev);
end;

procedure TMainf.TreeView1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
var
  Node: TTreeNode;
begin
  Node := TreeView1.GetNodeAt(MousePos.X, MousePos.y);
  if Node <> nil then
    Node.Selected := true;
end;

procedure TMainf.TreeView1DblClick(Sender: TObject);
begin
  if GCurSelectGroupID = -2 then
    fun_Locate_Car.Execute;
end;

procedure TMainf.ShowQueryForm(PageControl: TRzPageControl; Form: TForm;
  FormClass: TFormClass; Align: TAlign);
begin
  if not Form.Showing then
  begin
    Form.ManualDock(PageControl, nil, Align);
    Form.show;
  end;
  //设置为　活动层
  SetActivePage(PageControl, Form.Caption);
end;

procedure TMainf.ShowWindows(Sender: TObject; PageControl: TRzPageControl;
  Form: TForm; Align: TAlign);
var
  i: integer;
begin
  with (Sender as TAction) do
  begin
    Checked := not Checked;
    if Checked then
    begin
      if (not Form.Showing) or (Form.Floating) then
      begin
        Form.Show;
        Form.ManualDock(PageControl, nil, Align);
//        for i := 0 to PageControl.PageCount - 1 do
//        begin
//          PageControl.Pages[i].Highlighted := False;
//        end;
        for i := 0 to PageControl.PageCount - 1 do
        begin
          if PageControl.Pages[i].Caption = Form.Caption then
          begin
            try
              PageControl.ActivePageIndex := i;
//              PageControl.Pages[i].Highlighted := True;
            except
              break;
            end;
            break;
          end;
        end;
      end;
    end
    else
    begin
      Form.ManualDock(nil);
      Form.Hide;
    end;
  end;
end;

procedure TMainf.PageControl_CenterChange(Sender: TObject);
var
  i: Integer;
begin
//  for i := 0 to PageControl_Center.PageCount-1 do
//  begin
//    PageControl_Center.Pages[i].Highlighted := False;
//  end;
//  PageControl_Center.ActivePage.Highlighted := True;

  // liusen
  if PageControl_Center.ActivePage.Caption <> FDlg_BSMap.Caption then
    FDlg_BSMap.Timer1.Enabled := False
  else
    FDlg_BSMap.Timer1.Enabled := True;
end;

procedure TMainf.N323Click(Sender: TObject);
begin
  DataServer.CancelEarlyWarning_V3(GCurSelectDev.id);
end;

procedure TMainf.Show_Abnormal_CarListExecute(Sender: TObject);
begin
    //ShowWindows(Sender, PageControlBottom, FDlg_Abnormal_Car, alLeft);
end;

procedure TMainf.ToolButton17Click(Sender: TObject);
var
  i: integer;
begin
  FANTIFAKE_WARRING := True;
  FMap.MouseAction := actSetConfineAlarmArea;//actSetConfineAlarmCircle;//
  for i := 0 to ActionList1.ActionCount - 1 do
  begin
    if (ActionList1.Actions[i].Category = '2地图工具') then
    begin
      if ActionList1.Actions[i].Name <> 'tool_bird_eye' then
      begin
        TAction(ActionList1.Actions[i]).Checked := false;
      end;
    end;
  end;
  TAction(Sender).Checked := true;
end;

procedure TMainf.AddCarModifyInfo;
begin
  try
    if FDlg_DevModifyFrm= nil then
      FDlg_DevModifyFrm := TDevModifyFrm.Create(self);
    FDlg_DevModifyFrm.ComboBox1.Text := GCurSelectDev.Car.No;
    FDlg_DevModifyFrm.Edit2.Text := GCurSelectDev.DriverNameTeL;
    FDlg_DevModifyFrm.cbxType.Text := GCurSelectDev.MsgTypeState;
    GCurSelectDev.MsgTypeState := '';
    ShowQueryForm(PageControl_Center, FDlg_DevModifyFrm, TDevModifyFrm, alLeft);
  finally
    //dlg.Free;
  end;
end;

procedure TMainf.N327Click(Sender: TObject);
begin
  AddCarModifyInfo;
end;

procedure TMainf.QueryOpenInfo;
var
  QueryADevGroupManage: TQueryADevGroupManage;

  QueryDevParam: TQueryADevParam;
  QueryDriver: TQueryDriver;
  QueryDevTelList: TQueryDevTelList;
  QueryDevsEventList: TQueryDevsEventList;
//  QueryPassengerInfo: TQueryPassengerInfo;
//  QueryHYGLInfo: TQueryHYGLInfo;
//  LoadOrdersFromDB: TLoadOrdersFromDB;
  Pr: TPrivilege;
  s: string;

  QueryCarInfo: TQueryCarInfo;
  QueryDevInfo: TQueryDevInfo;
begin
  //---------------------------------------------------
  //StatusBar1.Panels.Items[3].Text := '当前用户:' + current_user.userName + '，登录时间:' + FormatDateTime('yy/mm/dd hh:nn', now()); //
  StatusBar1.Panels[1].Text := '当前用户:' + current_user.userName + '，登录时间:' + FormatDateTime('yy/mm/dd hh:nn', now()); //
  StatusBar1.Panels[1].ImageIndex := 5;

  //FFlashDlg.SetLabel('更新本地时间...');
  //SetDatetime;      // 以前取的是业务服务器的时间，现在要改为取webservice的时间，还没改
  FFlashDlg.Gauge1.AddProgress(5);

  //FFlashDlg.SetLabel('连接网关...');
  //FFlashDlg.Gauge1.AddProgress(5);
  //Connect2Gateway; //连接网关


  //---------------------------------------------------
  FFlashDlg.SetLabel('设置用户权限...');
  SetPower;
  FFlashDlg.Gauge1.AddProgress(5);
  //---------------------------------------------------

  Current_User.LoginDatetime := now;
  application.ProcessMessages;
  InfoListDevice;
  try
    try

      FFlashDlg.Gauge1.AddProgress(10);
     //---------------------------------------------------
      application.ProcessMessages;
     //---------------------------------------------------
      FFlashDlg.SetLabel('下载车辆组...');
      bs.DevGroupinfo(ADevGroupManage); //------ 打开组管理

      if ADevGroupManage.Count = 0 then
      begin
        messagebox(handle, '对不起，当前用户没有查看任何车组的权限！' + #13 + #13 +
          '请您与系统管理员联系，到【系统管理客户端】为当前用户分配组！', '提示', mb_ok + mb_iconinformation);
        Application.Terminate;
        exit;
      end;
      FFlashDlg.Gauge1.AddProgress(10);
     //----------------------------------------------------
      FFlashDlg.SetLabel('下载车辆类型信息...');
      bs.CarTypeInfo;

      FFlashDlg.Gauge1.AddProgress(15);
      FFlashDlg.SetLabel('下载车辆信息...');
      Bs.QueryDevCarInfo(ACarManage, ADeviceManage);//Bs.CarInfo(ACarManage);

      Sleep(500);
      FFlashDlg.SetLabel('下载司机信息...');
      FFlashDlg.Gauge1.AddProgress(5);
      QueryDriver := TQueryDriver.Create(ADeviceManage, ADriverManage, FFlashDlg.Label3); // 司机信息
      Sleep(500);

//      FFlashDlg.Gauge1.AddProgress(5);
//      FFlashDlg.SetLabel('下载设备信息...');
//      bs.DeviceInfo(ADeviceManage); //打开设备 管理

      FFlashDlg.SetLabel('下载区域信息...');
      FFlashDlg.Gauge1.AddProgress(5);
      bs.QueryArea_New;                  // 下载区域报警类

      if ADeviceManage.Count = 0 then
      begin
        messagebox(handle, '对不起，当前用户没有查看任何车的权限！' + #13 + #10 +
          '请您与系统管理员联系，到【系统管理客户端】为当前用户分配组，或添加车辆到分配的组！', '提示', mb_ok + mb_iconinformation);
        Application.Terminate;
        exit;
      end;
      //QueryDevInfo := TQueryDevInfo.Create;
      //QueryDevInfo.OnQueryCarAndDevInfo := QueryCarAndDevInfo;


      QueryOtherLoadInfo;

      FFlashDlg.Gauge1.AddProgress(5);
      FFlashDlg.SetLabel('装载地图编码...');
      AddressName.Clear;

      AddressName.LoadAddressName(ExePath, 'name');
      if Length(GlobalParam.LayerParam) > 0 then
      begin
        s := ExtractFilePath(GlobalParam.LayerParam[0].FilePath);
        if DirectoryExists(s) then
          AddressName.LoadAddressName(s, 'name');
      end;
      FamilyName.LoadFamilyName(ExePath + 'FamilyName.txt');

      if GlobalParam.isCarNOAndDevName then ADeviceManage.CarNOAndDevName; //车牌号和设备名称合在一起....

      FFlashDlg.Gauge1.AddProgress(5);

      FFlashDlg.SetLabel('连接网关...');
      FFlashDlg.Gauge1.AddProgress(5);
      Connect2Gateway; //连接网关

      FFlashDlg.Gauge1.AddProgress(5);
      FFlashDlg.SetLabel('创建窗体...');
      Dlgs_Create;

      List_TreeGroup;

//      DataServer.OnDriverCancelOrder := DoOnDriverCancelOrder;
      DataServer.OnPicUpload := DoOnRcvPicupLoad;
      DataServer.OnAudioUpload := FDlg_AudioFrm.OnAudioUpload;//DoOnRcvAudioUpload;
      DataServer.OnVideoUpload := FDlg_VideoFrm.OnVideoUpload;
      
      DataServer.OnEventListUpLoad := FDlg_EventListFrm.OnEventListUpload;//DoOnRcvEventListupLoad;
      DataServer.OnQueryPicture := FDlg_QueryPictureListFrm.OnQueryPicture;//DoOnRecQueryPicture;
      DataServer.OnMediaDataUpload := FDlg_QueryPictureListFrm.OnMediaDataUpload;
      DataServer.OnAudioDataUpload := FDlg_QueryAudioList.OnAudioDataUpload;
      DataServer.OnVideoDataUpload := FDlg_QueryVideoList.OnVideoDataUpload;
      DataServer.OnGovInfo := FDlg_RevGovInfo.DoOnRecvGovInfo;
      DataServer.OnGovAlarmInfo := FDlg_RevGovInfo.DoOnGovAlarmInfo;
      DataServer.OnGovGpsData := FDlg_RevGovInfo.DoOnGovGpsData;

//      DataServer.OnServeJudge := FDlg_ServeJudgeListFrm.DoOnServeJudge;//DoOnServeJudge;
     // DataServer.onLightStateListUpLoad := FDlg_LightStateListFrm.OnRcvLightStateListupLoad;//DoOnRcvLightStateListupLoad;
      DataServer.OnAnswerListUpload := FDlg_AnswerListFrm.OnAnswerListUpload;//DoOnRcvAnswerListupLoad;
      DataServer.OnAreaAlarmUpload := FDlg_AlarmCar.DoOnDevAreaAlarm;

      FFlashDlg.SetLabel('系统初始化中...');
      FFlashDlg.Gauge1.AddProgress(4);

      //打开鸟瞰图
      tool_bird_eyeExecute(tool_bird_eye);
      //{$ifdef For_ConfineArea} //从文件 载入 区域信息　20050721　sha
      GAreaManage.LoadAreasFromFile(ExtractFilePath(application.ExeName) + current_User.UserName + '_areas.ini');
      FDlg_ConfineAreaList.LoadConfineAreas;

//      if current_user.HYGL then
//        Timer2.Enabled := true
//      else
//        Timer2.Enabled := False;

      MapLabel := TLabel.Create(nil);
      MapLabel.Transparent := true;
      MapLabel.AutoSize := false;
      MapLabel.Width := 32;
      MapLabel.Height := 32;
      MapLabel.Parent := FMap;
      MapLabel.Hide;
      MapLabel.ShowHint := true;
      MapLabel.Cursor := crArrow;

      MapLabel.PopupMenu := PopupMenu_funDev;
      MapLabel.ParentFont := false;
      MapLabel.Font.Size := 10;
      MapLabel.Font.Name := '宋体';

      FMap.Zoom(7);
      ImageListCar := ImageListMapCar;

      Sleep(3000);
    except
     on E: exception do
      begin
        messageErrorBox('无法连接业务服务器！', e.Message);
        application.Terminate;
        Exit;
      end;
    end;
  finally

  end;
end;

procedure TMainf.QueryCarAndDevInfo;
  function findCarType(TypeID: integer): string;
  var
    k: Integer;
  begin
    Result := '';

    for k:=0 to CarTypeManage.Count - 1 do
    begin
      if CarTypeManage.Items[k].CarTypeID = TypeID then
      begin
        Result := CarTypeManage.Items[k].CarTypeName;
        Exit;
      end;
    end;
  end;
var
  FCarData: TClientDataSet;
  FDevData: TClientDataSet;
  i: Integer;
  //ps0: PCar;
  dev0: TDevice;
begin
//  if (IsQueryCarInfo) and (IsQueryDevInfo) then
//  begin
//    try
//      FCarData := TClientDataSet.Create(nil);
//      FCarData.XMLData := uCarInfo;
//      FCarData.Open;
//      FCarData.First;
//      for i := 0 to FCarData.RecordCount - 1 do
//      begin
//        ps0 := ACarManage.AddNewCar(FCarData.FieldByName('CAR_ID').AsInteger);
//        ps0^.id := FCarData.FieldByName('CAR_ID').AsInteger;
//        ps0^.ZBH := FCarData.FieldByName('CAR_ZBH').AsString;
//        ps0^.No := FCarData.FieldByName('CAR_NO').AsString;
//        ps0^.Memo := FCarData.FieldByName('CAR_MEMO').AsString; //car_memo   改后再改..............
//        ps0^.resid := FCarData.FieldByName('RES_ID').AsInteger;
//        ps0^.CarType := findCarType(FCarData.FieldByName('CARTYPE_ID').AsInteger);
//        ResManage.find(ps0^.resid, ps0^.ResIndex);
//        ps0^.stat := 0;
//        FFlashDlg.SetLabel('正在加载' + ps0^.No + '的基本信息...');
//        FCarData.Next;
//        Application.ProcessMessages;
//      end;
//
//      FDevData := TClientDataSet.Create(nil);
//      FDevData.XMLData := uDevInfo;
//      FDevData.Open;
//      FDevData.First;
//
//      for i := 0 to FDevData.RecordCount - 1 do
//      begin
//        //取得当前组中的设备(车辆)数
//
//        dev0 := ADeviceManage.Add(FDevData.FieldByName('DEV_ID').AsString);
//        dev0.fact_id := FDevData.FieldByName('FACT_ID').AsInteger;
//        dev0.DispLabel := FDevData.FieldByName('DISP_LABEL').AsString;
//        dev0.SimNo := FDevData.FieldByName('SIM_NO').AsString;
//        dev0.GroupID := FDevData.FieldByName('GROUP_ID').AsInteger;
//        dev0.Pattern := 1; // 显示轨迹时，画的是实线，在这里赋1，就可以在轨迹回放时实现用虚线画轨迹线
//        //将车机ID号放入到 相应车组的 DevList中
//        ADevGroupManage.InsertDevList(dev0.id, dev0.GroupID);
//        dev0.Car := ACarManage.getCar(FDevData.FieldByName('CAR_ID').AsInteger);
//        FFlashDlg.SetLabel('正在加载' + dev0.Car.No + '的设备信息... ');
//
//        FDevData.Next;
//        Application.ProcessMessages;
//      end;
//
//      //列出所有 父组 下的子组，将子组ID放到 父组的子组数组中，
//      //  并把子组的DevArray放到父组的DevArray中，方便以后使用
//      ADevGroupManage.ListSon;
//
//      if ADeviceManage.Count = 0 then
//      begin
//        messagebox(handle, '对不起，当前用户没有查看任何车的权限！' + #13 + #10 +
//          '请您与系统管理员联系，到【系统管理客户端】为当前用户分配组，或添加车辆到分配的组！', '提示', mb_ok + mb_iconinformation);
//        Application.Terminate;
//        exit;
//      end;
//      //FDlg_FindThingFrm.List_TreeGroup;
//      FDlg_Watch_Car.List_TreeGroup;
//      FDlg_Prompt_Info.List_TreeGroup;
//
//      QueryOtherLoadInfo;
//    finally
//      FCarData.Close;
//      FCarData.Free;
//      FDevData.Close;
//      FDevData.Free;
//
//      IsQueryCarInfo := False;
//      IsQueryDevInfo := False;
//      uCarInfo := '';
//      uDevInfo := '';
//    end;
//  end;
end;

procedure TMainf.QueryOtherLoadInfo;
var
  QueryADevGroupManage: TQueryADevGroupManage;

  QueryDevParam: TQueryADevParam;
  QueryDevTelList: TQueryDevTelList;
  QueryDevsEventList: TQueryDevsEventList;
//  QueryHYGLInfo: TQueryHYGLInfo;
//  LoadOrdersFromDB: TLoadOrdersFromDB;
//  QueryPassengerInfo: TQueryPassengerInfo;
  s: string;
begin
  try
    try
      FFlashDlg.Gauge1.AddProgress(10);
     //---------------------------------------------------
      //application.ProcessMessages;

      //TQueryDevLastPos.Create(ADeviceManage);

      Sleep(500);
      //QueryDevParam := TQueryADevParam.Create(ADeviceManage, FFlashDlg.Label2);         // 车机参数
      QueryDevTelList := TQueryDevTelList.Create(ADeviceManage, FFlashDlg.Label4);        // 车机电话本
      Sleep(500);
      QueryDevsEventList := TQueryDevsEventList.Create(ADeviceManage, FFlashDlg.Label5);  // 车机事件信息
      Sleep(500);
      TQueryInfoTypes.Create(FInfoTypeManage, ADeviceManage, FFlashDlg.Label5);

//      if current_user.HYGL then
//      begin
//        // 加载当天的投诉量、处理量
//
//        // 加载各个车辆当天的营运金额、行驶里程、空驶里程、空驶率
//        FFlashDlg.SetLabel('行业管理信息...');
//        FFlashDlg.Gauge1.AddProgress(5);
//        Sleep(500);
//        QueryHYGLInfo := TQueryHYGLInfo.Create;
//      end;
//      Sleep(500);
//      if current_user.DZDD then
//      begin
//        FFlashDlg.SetLabel('下载订单信息...');
//        FFlashDlg.Gauge1.AddProgress(5);
        //AOrderManage.LoadOrdersFromDB;
//        LoadOrdersFromDB := TLoadOrdersFromDB.Create;
//        Sleep(500);
//        QueryPassengerInfo := TQueryPassengerInfo.Create(PassengerManage);                  // 乘客信息
//      end;

    except
     on E: exception do
      begin
        messageErrorBox('无法连接业务服务器！', e.Message);
        application.Terminate;
        Exit;
      end;
    end;
  finally
    //FFlashDlg.Hide;
  end;
end;

procedure TMainf.ck_UpdateRecordExecute(Sender: TObject);
begin
  if FDlg_QueryUpdateRecord = nil then
    FDlg_QueryUpdateRecord := TQueryUpdateRecordFrm.Create(self);
  ShowQueryForm(PageControl_Center, FDlg_QueryUpdateRecord, TQueryUpdateRecordFrm, alLeft);
end;

procedure TMainf.fun_zdgzExecute(Sender: TObject);
var
  FDlg_map1 : TZDCLJKFrm;
begin
  if GCurSelectDev = nil then Exit;
  if SpecialCarList.Count >= 10 then
  begin
    messagebox(handle, '最多只能对10辆车进行重点监控', '提示', mb_ok + mb_iconinformation);
    Exit;
  end;

  if SpecialCarList.IndexOf(@GCurSelectDev.Car.No) >= 0 then
  begin
    messagebox(handle, PChar('车牌号为【' + GCurSelectDev.Car.No + '】的车辆已经处于重点监控中'), '提示', mb_ok + mb_iconinformation);
    Exit;
  end;

  try
    //FMap.EnableTimer(False);
    FDlg_map1 := TZDCLJKFrm.Create(self);
    FDlg_map1.Caption := FDlg_map1.Caption + '【' + GCurSelectDev.Car.No + '】';
    //FDlg_map1.datalayer := datalayer;
    FDlg_map1.Dev := GCurSelectDev;
    SpecialCarList.Add(@GCurSelectDev.Car.No);
    SetZDCLJKPower(FDlg_map1);
    FDlg_map1.Show;
    FDlg_map1.Height := 520;
    FDlg_map1.Width := 780;
    //FDlg_map1.WindowState := wsMaximized;
  finally
    //FDlg_map1.Free;
  end;
   // Show_Map.Checked := true;
end;

procedure TMainf.Tj_OnlineExecute(Sender: TObject);
begin
  try
    if FDlg_OnLineFrm = nil then
      FDlg_OnLineFrm := TOnLineTjFrm.Create(nil);
    FDlg_OnLineFrm.List_TreeGroup;
    FDlg_OnLineFrm.Show;
  finally

  end;
end;

procedure TMainf.Info_DevModifyExecute(Sender: TObject);
begin
  try
    if FDlg_DevModifyFrm= nil then
      FDlg_DevModifyFrm := TDevModifyFrm.Create(self);
    ShowQueryForm(PageControl_Center, FDlg_DevModifyFrm, TDevModifyFrm, alLeft);
  finally
    //dlg.Free;
  end;
end;

procedure TMainf.Info_DevAlarmInfoExecute(Sender: TObject);
begin
  try
    if FDLG_DevAlarmInfo= nil then
      FDLG_DevAlarmInfo := TDevAlarmInfoFrm.Create(self);
    ShowQueryForm(PageControl_Center, FDLG_DevAlarmInfo, TDevAlarmInfoFrm, alLeft);
  finally
    //dlg.Free;
  end;
end;

procedure TMainf.Info_SysManageExecute(Sender: TObject);
var
  filePath: string;
  par: string;
  param1, param2, param3: string;
begin
  param1 := 'HRB_NJTY_XXGL';
  param2 := current_user.UserName;
  param3 := current_user.Password;
  par:='"'+param1+'"   "'+param2+'"   "'+param3+'"';//
  filePath := ExePath + 'SystemManage\SystemManager.exe';

  if FileExists(filePath) then
  begin
    SetCurrentDir(ExePath);
    shellexecute(handle, 'open', pchar(filePath), PChar(par), nil, SW_SHOWNORMAL);
  end
  else
    MessageBox(handle, '对不起，无法打开信息管理端！', '提示', MB_OK + MB_ICONINFORMATION);
end;

procedure TMainf.tool_SetAreaAlarmToDev_RectExecute(Sender: TObject);
var
  i: integer;
begin
    //===设置报警区域到车机//
    Fmap.MouseAction := actSetConfineAlarmrectangle;
    for i := 0 to ActionList1.ActionCount - 1 do
    begin
      if (ActionList1.Actions[i].Category = '2地图工具') then
      begin
        if ActionList1.Actions[i].Name <> 'tool_bird_eye' then
        begin
          TAction(ActionList1.Actions[i]).Checked := false;
        end;
      end;
    end;
  TAction(Sender).Checked := true;
end;

procedure TMainf.tool_SetAreaAlarmToDev_PolygonExecute(Sender: TObject);
var
  i: integer;
begin
    //===设置报警区域到车机//
    Fmap.MouseAction := actSetConfineAlarmPolygon;
    for i := 0 to ActionList1.ActionCount - 1 do
    begin
      if (ActionList1.Actions[i].Category = '2地图工具') then
      begin
        if ActionList1.Actions[i].Name <> 'tool_bird_eye' then
        begin
          TAction(ActionList1.Actions[i]).Checked := false;
        end;
      end;
    end;
  TAction(Sender).Checked := true;
end;

procedure TMainf.fun_Devs_RecordExecute(Sender: TObject);
var
  dlg: TfrmRecord;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  dlg := TfrmRecord.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    if ListSelectDev.Count > 0 then
    begin
      AddDeviceFromListSelectDev;
    end
    else
    begin
      AddDeviceByGroup;
    end;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_RecordExecute(Sender: TObject);
var
  dlg: TfrmRecord;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  if not CheckDevId then
  begin
    fun_Devs_RecordExecute(Sender);
    exit;
  end;
  dlg := TfrmRecord.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    Add_A_Device;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_SetAreaToDevExecute(Sender: TObject);
var
  dlg: TfrmDevAreaList;
  area: TBaseArea;
  i: Integer;
  setType: Byte;
begin
  if GCurSelectDev = nil then
    Exit;

  if FAllAreaManage.AllCircleList.Count <= 0 then
  begin
    MessageBox(Handle, '当前无可设置的区域，请先在地图上设置区域', '提示', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  dlg := TfrmDevAreaList.Create(Self);
  try
    dlg.AddAllAreaToList;
    if dlg.ShowModal = mrok then
    begin
      if (dlg.areaIds.Count > 0) then
      begin
        if dlg.rbUpdate.Checked then
          setType := 0
        else if dlg.rbAttach.Checked then
          setType := 1
        else if dlg.rbModify.Checked then
          setType := 2
        else
          setType := 1;
        for i := 0 to dlg.areaIds.Count - 1 do
        begin
          area := FAllAreaManage.find(StrToInt(dlg.areaIds.Strings[i]));
          if area <> nil then
          begin
            case area.AreaPictureKind of
              0: DataServer.SendSetCircleArea_New_V3(GCurSelectDev, TCircleArea(area), setType);
              1: DataServer.SendSetRectangleArea_New_V3(GCurSelectDev, TRectangleArea(area), setType);
              2: DataServer.SendSetNoSymbolArea_New_V3(GCurSelectDev, TNoSymbolArea(area));
              3: DataServer.SendSetLineToDev_V3(GCurSelectDev, TPolyLineArea(area));
            end;
          end;  
        end;  
      end;  
    end;
  finally
    dlg.Free;
  end;
end;

procedure TMainf.fun_DelAreaFromDevExecute(Sender: TObject);
var
  dlg: TfrmDevAreaList;
  area: TBaseArea;
  i: Integer;
  circleAreaList, rectAreaList, nosymbolAreaList, polylineAreaList: TStringList;
begin
  if GCurSelectDev = nil then
    Exit;

  if GCurSelectDev.DevAreaList.Count <= 0 then
  begin
    MessageBox(Handle, '当前车机中无设置的区域，无法执行此操作', '提示', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  dlg := TfrmDevAreaList.Create(Self);
  dlg.Panel3.Visible := False;
  circleAreaList := TStringList.Create;
  rectAreaList := TStringList.Create;
  nosymbolAreaList := TStringList.Create;
  polylineAreaList := TStringList.Create;
  try
    dlg.addDevAreaToList(GCurSelectDev);
    if dlg.ShowModal = mrok then
    begin
      if (dlg.areaIds.Count > 0) then
      begin
        for i := 0 to dlg.areaIds.Count - 1 do
        begin
          area := FAllAreaManage.find(StrToInt(dlg.areaIds.Strings[i]));
          if area <> nil then
          begin
            case area.AreaPictureKind of
              0: circleAreaList.Add(IntToStr(area.areaNO));
              1: rectAreaList.Add(IntToStr(area.areaNO));
              2: nosymbolAreaList.Add(IntToStr(area.areaNO));
              3: polylineAreaList.Add(IntToStr(area.areaNO));
            end;
          end;
        end;
        if circleAreaList.Count > 0 then
          DataServer.SendDeleteAreaListForDev_V3(TERMSRV_DELCIRCLEAREA_V3, GCurSelectDev, circleAreaList, False);
        if rectAreaList.Count > 0 then
          DataServer.SendDeleteAreaListForDev_V3(TERMSRV_DELRECTAREA_V3, GCurSelectDev, rectAreaList, False);
        if nosymbolAreaList.Count > 0 then
          DataServer.SendDeleteAreaListForDev_V3(TERMSRV_DELPOLYGONAREA_V3, GCurSelectDev, nosymbolAreaList, False);
        if polylineAreaList.Count > 0 then
          DataServer.SendDeleteAreaListForDev_V3(TERMSRV_DELLINE_V3, GCurSelectDev, polylineAreaList, False);
      end;  
    end;
  finally
    circleAreaList.Free;
    rectAreaList.Free;
    nosymbolAreaList.Free;
    dlg.Free;
  end;
end;

procedure TMainf.fun_DelAllAreaFromDevExecute(Sender: TObject);
var
  area: TBaseArea;
  i: Integer;
  areaList: TStringList;
begin
  if GCurSelectDev = nil then
    Exit;

  if MessageBox(Handle, '您确认删除该车机中所有已设置的区域吗？', '确认', MB_YESNO + MB_ICONQUESTION) = IdNo then
    Exit;

  areaList := TStringList.Create;
  try
    DataServer.SendDeleteAreaListForDev_V3(TERMSRV_DELCIRCLEAREA_V3, GCurSelectDev, areaList, False);
    DataServer.SendDeleteAreaListForDev_V3(TERMSRV_DELRECTAREA_V3, GCurSelectDev, areaList, False);
    DataServer.SendDeleteAreaListForDev_V3(TERMSRV_DELPOLYGONAREA_V3, GCurSelectDev, areaList, False);
  finally
    areaList.Free;
  end;
end;

procedure TMainf.fun_SendTSPDataExecute(Sender: TObject);
var
  dlg: TfrmTSPData;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  if not CheckDevId then
  begin
    fun_Devs_SendTSPDataExecute(Sender);
    exit;
  end;
  dlg := TfrmTSPData.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    Add_A_Device;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_Devs_SendTSPDataExecute(Sender: TObject);
var
  dlg: TfrmTSPData;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  dlg := TfrmTSPData.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    if ListSelectDev.Count > 0 then
    begin
      AddDeviceFromListSelectDev;
    end
    else
    begin
      AddDeviceByGroup;
    end;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.FMapSetLineProperty;
Var
  dlgLine: TfrmSetLine;
  i: Integer;
  dev: TDevice;
begin
  if tmpPolyLineArea <> nil then
  begin
    dlgLine := TfrmSetLine.Create(Self);
    dlgLine.edtLineNo.Text := IntToStr(FAllAreaManage.GetAreaNo);
    try
      if dlgLine.ShowModal = mrOk then
      begin
        tmpPolyLineArea.areaNO := dlgLine.LineNo;
        tmpPolyLineArea.AreaName := dlgLine.LineName;
        tmpPolyLineArea.AreaPictureKind := AREASHAPE_POLYLINE;
        tmpPolyLineArea.AreaAlarmKind := dlgLine.LineProperty;
        tmpPolyLineArea.beginDateTiem := dlgLine.STime;
        tmpPolyLineArea.endDateTime := dlgLine.ETime;
        tmpPolyLineArea.isshow := True;
        tmpPolyLineArea.setAreaPar();
        tmpPolyLineArea.WorldPointAryToOutBox(tmpPolyLineArea.WorldPointAry, 0, tmpPolyLineArea.PointCount);
        tmpPolyLineArea.AreaID := Bs.AddNewArea_new(tmpPolyLineArea.AreaName, tmpPolyLineArea.AreaPictureKind, tmpPolyLineArea.areaNO,
                                                    tmpPolyLineArea.AreaAlarmKind, FormatDateTime('yyyy-MM-dd hh:nn:ss', tmpPolyLineArea.beginDateTiem),
                                                    FormatDateTime('yyyy-MM-dd hh:nn:ss', tmpPolyLineArea.endDateTime), 0, 0, tmpPolyLineArea.PointCount,
                                                    tmpPolyLineArea.AreaPar, tmpPolyLineArea.AreaPar, 1);
        if tmpPolyLineArea.AreaID > 0 then
        begin
//          FAllAreaManage.Add(tmpPolyLineArea);
          if dlgLine.ListView1.Items.Count > 0 then
          begin
            for i := 0 to dlgLine.ListView1.Items.Count - 1 do
            begin
              dev := TDevice(dlgLine.ListView1.Items.Item[i].Data);
              if dev <> nil then
                DataServer.SendSetLineToDev_V3(dev, tmpPolyLineArea);
            end;  
          end;
          FDlg_AreaToDev.addKindToListView(tmpPolyLineArea.AreaID); 
        end
        else
        begin
          MessageBox(Handle, '保存路线属性失败，请确认数据库连接正常', '提示', MB_OK + MB_ICONINFORMATION);
          Exit;
        end;

        FMap.Draw;
      end
      else
      begin
        FAllAreaManage.Delete(-1);
      end;  
    finally
      dlgLine.Free;
      tmpPolyLineArea := nil;
    end;
  end
end;

//采集行驶记录数据
procedure TMainf.fun_CollectRunRecDataExecute(Sender: TObject);
var
  dlg: TfrmCollectRunRecData;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  if not CheckDevId then
  begin
    fun_Devs_CollectRunRecDataExecute(Sender);
    exit;
  end;
  dlg := TfrmCollectRunRecData.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    Add_A_Device;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_Devs_CollectRunRecDataExecute(Sender: TObject);
var
  dlg: TfrmCollectRunRecData;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  dlg := TfrmCollectRunRecData.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    if ListSelectDev.Count > 0 then
    begin
      AddDeviceFromListSelectDev;
    end
    else
    begin
      AddDeviceByGroup;
    end;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_Devs_SetRunRecParamExecute(Sender: TObject);
var
  dlg: TfrmSetRunRecParam;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  dlg := TfrmSetRunRecParam.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    if ListSelectDev.Count > 0 then
    begin
      AddDeviceFromListSelectDev;
    end
    else
    begin
      AddDeviceByGroup;
    end;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_SetRunRecParamExecute(Sender: TObject);
var
  dlg: TfrmSetRunRecParam;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  if not CheckDevId then
  begin
    fun_Devs_SetRunRecParamExecute(Sender);
    exit;
  end;
  dlg := TfrmSetRunRecParam.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    Add_A_Device;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.ToolButton9Click(Sender: TObject);
begin
  Close;
end;

procedure TMainf.show_DevAlarmExecute(Sender: TObject);
begin
  ShowWindows(Sender, PageControlBottom, FDlg_DevAlarmCar, alLeft);
end;

procedure TMainf.CheckUpdateExe;
var
  oldFileName, newFileName: string;
  oldFileTime, newFileTime: TDateTime;
begin
  oldFileName := ExePath + 'tyUpdate.exe';
  newFileName := ExePath + 'tyUpdate_bak.exe';

  if FileExists(newFileName) then
  begin//有更新的tyUpdate.exe程序
    if FileExists(oldFileName) then
    begin//当前目录下也有tyUpdate.exe，则比较两者的时间
      if GetFileDate(oldFileName, oldFileTime) and GetFileDate(newFileName, newFileTime) then
      begin
        if newFileTime > oldFileTime then
        begin
          CopyFile(PChar(newFileName), PChar(oldFileName), False);
        end;  
      end;  
    end
    else//当前目录下没有tyUpdate.exe，则直接将update目录下的tyUpdate.exe复制到当前目录下
    begin
      CopyFile(PChar(newFileName), PChar(oldFileName), False);
    end;
    //DeleteFile(newFileName);
  end;
end;

procedure TMainf.TreeView2Change(Sender: TObject; Node: TTreeNode);
var
  grpId: integer;
  i: integer;
  dev: Tdevice;
//  devId: string;
  onLineCount: Integer;
  devGroup: TDevGroup;
begin
  if Node = nil then exit;
  grpId := Integer(Node.Data);
  if grpId = FCurrSelect then exit; //选择没变化,直接退出
  FDlg_Watch_Car.AddDevsByGroupId(grpId);

  if grpId <= 0 then
  begin
    FDlg_BSMap.CurrSelGroup := nil;
    ValueListEditorOnlineByGroup.Values[' 当前组名称'] := '所有车辆';
    ValueListEditorOnlineByGroup.Values[' 当前组总车'] := ValueListEditorOnline.Values['总车'];
    ValueListEditorOnlineByGroup.Values[' 当前组在线'] := ValueListEditorOnline.Values['在线'];
    ValueListEditorOnlineByGroup.Values[' 当前组不在线'] := ValueListEditorOnline.Values['不在线'];
    ValueListEditorOnlineByGroup.Values[' 当前组在线率'] := ValueListEditorOnline.Values['在线率'];
  end
  else
  begin
    devGroup := ADevGroupManage.find(grpId);
    if devGroup <> nil then
    begin
      FDlg_BSMap.CurrSelGroup := devGroup;
      onlineCount := 0;
      for i := 0 to devGroup.DevListCount - 1 do
      begin
        dev := ADeviceManage.find(devGroup.DevList[i]);
        if dev.isOnline then
        begin
          inc(onlineCount);
        end
      end;
      ValueListEditorOnlineByGroup.Values[' 当前组名称'] := devGroup.Name;
      ValueListEditorOnlineByGroup.Values[' 当前组总车'] := IntToStr(devGroup.DevListCount);
      ValueListEditorOnlineByGroup.Values[' 当前组在线'] := IntToStr(onlineCount);
      ValueListEditorOnlineByGroup.Values[' 当前组不在线'] := IntToStr(devGroup.DevListCount - onlineCount);
      if devGroup.DevListCount > 0 then
        ValueListEditorOnlineByGroup.Values[' 当前组在线率'] := FormatFloat('0.00', onlineCount/devGroup.DevListCount * 100) + '%'
      else
        ValueListEditorOnlineByGroup.Values[' 当前组在线率'] := '0.00%';
    end
    else
    begin
      ValueListEditorOnlineByGroup.Values[' 当前组名称'] := '';
      ValueListEditorOnlineByGroup.Values[' 当前组总车'] := '';
      ValueListEditorOnlineByGroup.Values[' 当前组在线'] := '';
      ValueListEditorOnlineByGroup.Values[' 当前组不在线'] := '';
      ValueListEditorOnlineByGroup.Values[' 当前组在线率'] := '';
    end;
  end;
  FCurrSelect := grpId;
end;

procedure TMainf.TreeView2Click(Sender: TObject);
var
  i, j: Integer;
begin
  TreeView2.SetFocus;
  if PageControlBottom.ActivePage.Caption <> FDlg_Watch_Car.Caption then
  begin
    for i := 0 to PageControlBottom.PageCount - 1 do
    begin
      if PageControlBottom.Pages[i].Caption = FDlg_Watch_Car.Caption then
      begin
        PageControlBottom.ActivePageIndex := i;
//        for j := 0 to PageControlBottom.PageCount-1 do
//        begin
//          PageControlBottom.Pages[j].Highlighted := False;
//        end;
//        PageControlBottom.ActivePage.Highlighted := True;
        Break;
      end;  
    end;  
  end;
end;

procedure TMainf.TreeView2ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
var
  Node: TTreeNode;
begin
  Node := TreeView2.GetNodeAt(MousePos.X, MousePos.y);
  if Node <> nil then
    Node.Selected := true;
end;

procedure TMainf.show_ERunDataListExecute(Sender: TObject);
begin
  ShowWindows(Sender, PageControlBottom, FDlg_ERunDataList, alLeft);
end;

procedure TMainf.show_DriverUploadInfoListExecute(Sender: TObject);
begin
  ShowWindows(Sender, PageControlBottom, FDlg_DriverInfoUpload, alLeft);
end;

procedure TMainf.Xplorer1Click(Sender: TObject);
//var
//  menuItem: TMenuItem;
begin
//  menuItem := TMenuItem(Sender);
//  SkinData1.LoadFromCollection(SkinStore1, menuItem.Tag);
//  SkinData1.Active := True;
end;

procedure TMainf.skinDefaultClick(Sender: TObject);
begin
//  SkinData1.Active := False;
end;

procedure TMainf.fun_DealEmgcyAlarmExecute(Sender: TObject);
var
  dlg: TfrmDealEmgcyAlarm;
begin
  dlg := TfrmDealEmgcyAlarm.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    Add_A_Device;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.ck_devalarmExecute(Sender: TObject);
begin
  if FDlg_QueryDevAlarmInfo= nil then
    FDlg_QueryDevAlarmInfo := TfrmQueryAlarmInfo.Create(self);
  ShowQueryForm(PageControl_Center, FDlg_QueryDevAlarmInfo, TfrmQueryAlarmInfo, alLeft);
end;

procedure TMainf.ck_devgrouponlineExecute(Sender: TObject);
begin
  if FDlg_QueryDevGroupOnline= nil then
    FDlg_QueryDevGroupOnline := TfrmQueryDevGroupOnline.Create(self);
  ShowQueryForm(PageControl_Center, FDlg_QueryDevGroupOnline, TfrmQueryDevGroupOnline, alLeft);
end;

procedure TMainf.ck_devmileageExecute(Sender: TObject);
begin
  if FDlg_QueryDevMileage= nil then
    FDlg_QueryDevMileage := TfrmMileage.Create(self);
  ShowQueryForm(PageControl_Center, FDlg_QueryDevMileage, TfrmMileage, alLeft);
end;

procedure TMainf.TimerUpdateTimer(Sender: TObject; updateType: byte);
var
  AppIni: TIniFile;
  sys_id: string;
  servers: TStrings;
  url: string;
begin
  try
    SetCurrentDir(ExePath);
    servers := TStringList.Create;
    if copy(ExePath, length(ExePath), 1) <> '\' then ExePath := ExePath + '\';
    try
      AppIni := TIniFile.Create(ExePath + 'tyUpdate.ini');
      sys_id := AppIni.ReadString('tyUpdate', 'SubSys', '');

      AppIni.ReadSectionValues('updateAdderr', servers);
    finally
      AppIni.Free;
    end;
    if servers.Count > 0 then
      url := servers.Strings[0];
    url := copy(url, pos('=', url) + 1, length(url));
    if updateUnit.ExistNewFile(url, sys_id) then
    begin
      if updateType = 0 then
      begin
        if MessageBox(0, '发现有新版，如果更新将关闭此程序，需要更新吗？', '信息提示', MB_YESNO + MB_ICONQUESTION) = ID_YES then
        begin
          SetCurrentDir(ExePath);
          shellexecute(handle, 'open', pchar(ExePath + 'tyUpdate.exe'), nil, nil, sw_show);
          FIsUpdating := True;
          Application.Terminate;
        end
        else
        begin
          StatusBar1.Panels.Items[3].Text := '系统当前发布新的版本，请及时更新';
          StatusBar1.Panels.Items[3].ImageIndex := 7;
          TimerCall.Enabled := True;
          Mainf.Caption := FMainTitle + '        系统当前发布新的版本，请及时更新！';
          TimerCheckUpdate.Interval := 10 * TimerCheckUpdate.Interval;
        end;
      end
      else if updateType = 1 then
      begin
        StatusBar1.Panels.Items[3].Text := '系统当前发布新的版本，请及时更新';
        StatusBar1.Panels.Items[3].ImageIndex := 7;
        TimerCall.Enabled := True;
        Mainf.Caption := FMainTitle + '        系统当前发布新的版本，请及时更新！';
        TimerCheckUpdate.Interval := 10 * TimerCheckUpdate.Interval;
      end;
    end;
  finally
    servers.Free;
  end;
end;

procedure TMainf.TimerCheckUpdateTimer(Sender: TObject);
begin
  TimerCheckUpdate.Enabled := False;
  try
    TimerUpdateTimer(nil, 1);
  finally
    TimerCheckUpdate.Enabled := True;
  end;
end;

procedure TMainf.TimerCallTimer(Sender: TObject);
begin
  with StatusBar1.Panels[3] do
  begin
    if Text <> '' then
    begin
      if ImageIndex = 7 then
        ImageIndex := 10
      else
        ImageIndex := 7;
    end;
  end;
end;

procedure TMainf.show_QueryAudioListExecute(Sender: TObject);
begin
  ShowWindows(Sender, PageControlBottom, FDlg_QueryAudioList, alLeft);
end;

procedure TMainf.sys_infotypeExecute(Sender: TObject);
var
  dlg: TfrmInfoType;
begin
  dlg := TfrmInfoType.Create(Self);
  try
    dlg.ShowModal;
  finally
    dlg.Free;
  end;
end;

procedure TMainf.sys_infoExecute(Sender: TObject);
var
  dlg: TfrmInfo;
begin
  if FInfoTypeManage.Count > 0 then
  begin
    dlg := TfrmInfo.Create(Self);
    try
      dlg.ShowModal;
    finally
      dlg.Free;
    end;
  end
  else
  begin
    MessageBox(Handle, '无信息点播类型，请先维护信息点播类型', '提示', MB_OK + MB_ICONINFORMATION);
  end;
end;

//定时(10分钟扫描一次)发送前后5分钟的信息
procedure TMainf.timerSendInfoTimer(Sender: TObject);
var
  i, j, k: Integer;
  infoType: TInfoType;
  info: TInfo;
  t, s: TDateTime;
  d: TDevice;
begin
  t := Now;
  timerSendInfo.Enabled := False;
  try
    for i := 0 to FInfoTypeManage.Count - 1 do
    begin
      infoType := FInfoTypeManage.Items[i];

      if infoType.DevIdList.Count > 0 then
      begin//有车机点播了才发送
        j := 0;
        while j < infoType.InfoCount do
        begin
          info := infoType.InfoItem[j];
          s := info.SendTime;
          ReplaceDate(s, t);
          if not info.IsSent and (SecondsBetween(t, s) <= 150) then
          begin
            for k := 0 to infoType.DevIdList.Count - 1 do
            begin
              d := ADeviceManage.find(infoType.DevIdList[k]);
              if d <> nil then
              begin
                DataServer.SendInfoServer_V3(d, infoType.InfoTypeId, info.InfoContent, False);
              end;
            end;

            //发送完后，不将该信息从信息类型的列表中删除
            //infoType.DeleteInfo(info.InfoId);
            info.IsSent := True;
          end
          else
          begin
            Inc(j);
          end;  
        end;
      end;
    end;
  except
    on E: Exception do
    begin

    end;
  end;
  timerSendInfo.Enabled := True;
  timerSendInfo.Interval := 150000;
end;

procedure TMainf.show_MediaEventUploadExecute(Sender: TObject);
begin
  ShowWindows(Sender, PageControlBottom, FDlg_MediaEventUpload, alLeft);
end;

procedure TMainf.resetScrollPanel;
var
  i: Integer;
  totalWidth: Integer;
  comp: TComponent;
  tb: TToolButton;
begin
  totalWidth := 0;
  for i := 0 to Self.ComponentCount - 1 do
  begin
    comp := Self.Components[i];
    if  (comp is TToolButton) then
    begin
      tb := TToolButton(comp);
      if tb.Parent.Name = 'ToolBar2' then
        totalWidth := totalWidth + tb.Width;
    end;
  end;
  Panel6.Width := ToolBar2.Width - totalWidth;
  Panel6.Left := ToolButton16.Left + ToolButton16.Width;
end;

procedure TMainf.timerScrollAlarmTimer(Sender: TObject);
begin
  RzLabel1.Left := RzLabel1.Left - 1;
  if RzLabel1.Left + RzLabel1.Width <= 0 then
  begin
    resetScrollLabelCaption;
  end;
  Application.ProcessMessages;
end;

procedure TMainf.FormResize(Sender: TObject);
begin
  resetScrollPanel;
end;

procedure TMainf.resetScrollLabelCaption;
var
  i: Integer;
  alarmInfo: TAlarmInfoFromDev;
  devIdList: TStringList;
  dev: TDevice;
begin
  if not FAlarmInfoManage.IsEmergencyHappened then
  begin
    timerScrollAlarm.Enabled := False;
    Exit;
  end;
  RzLabel1.Caption := '';
  devIdList := TStringList.Create;
  try
    for i := FAlarmInfoManage.Count - 1 downto 0 do
    begin
      alarmInfo := FAlarmInfoManage.Items[i];
      if alarmInfo.AlarmType <> 0 then Continue;
      if devIdList.IndexOf(alarmInfo.DevId) < 0 then
        devIdList.Add(alarmInfo.DevId);
    end;
    for i := 0 to devIdList.Count - 1 do
    begin
      dev := ADeviceManage.find(devIdList.Strings[i]);
      if dev.Switch_Warning[0] then
      begin
        if RzLabel1.Caption = '' then
          RzLabel1.Caption := RzLabel1.Caption + dev.Car.No + '  发生紧急报警'
        else
          RzLabel1.Caption := RzLabel1.Caption + '       ' + dev.Car.No + '  发生紧急报警';
      end;
    end;
    RzLabel1.Top := Panel6.Top;
    RzLabel1.Height := Panel6.Height;
    RzLabel1.Left := Panel6.Width;
    if RzLabel1.Caption = '' then
      FAlarmInfoManage.IsEmergencyHappened := False;
    timerScrollAlarm.Enabled := True;
  finally
    devIdList.Free;
  end;
end;

procedure TMainf.show_SrvRunInfoExecute(Sender: TObject);
begin
  ShowWindows(Sender, PageControlBottom, FDlg_SrvRunInfo, alLeft);
end;

procedure TMainf.cbxSearchTypeChange(Sender: TObject);
begin
  case cbxSearchType.ItemIndex of
    0: btnSearch.Hint := '按车牌号查找车辆';
    1: btnSearch.Hint := '按车辆自编号查找车辆';
    2: btnSearch.Hint := '按设备号查找车辆';
    3: btnSearch.Hint := '按SIM卡号查找车辆';
    4: btnSearch.Hint := '按驾驶员查找车辆';
    5: btnSearch.Hint := '按车辆组查找车辆';
  else
    btnSearch.Hint := '';
  end;
end;

procedure TMainf.btnSearchClick(Sender: TObject);
var
  dev: TDevice;
  node: TTreeNode;
  cxNode: TcxTreeListNode;
  carId: Integer;
  devGroup: TDevGroup;
  bSearchGroup: Boolean;
begin
  if cbxSearchType.ItemIndex < 0 then
  begin
    ShowTips('请选择查找车辆的条件类型', cbxSearchType);
    cbxSearchType.SetFocus;
    Exit;
  end;
  if Trim(edtCondition.Text) = '' then
  begin
    ShowTips('请输入查找条件', edtCondition);
    edtCondition.SetFocus;
    Exit;
  end;
  bSearchGroup := False;

  if rbFuzzy.Checked then
  begin
    case cbxSearchType.ItemIndex of
      0:
        dev := ADeviceManage.FindDevFromCarNoFuzzy(Trim(edtCondition.Text));
      1:
        dev := ADeviceManage.FindDevByZBHFuzzy(Trim(edtCondition.Text));
      2:
        dev := ADeviceManage.findByDevIdFuzzy(Trim(edtCondition.Text));
      3:
        dev := ADeviceManage.FindDevFromSimnoFuzzy(Trim(edtCondition.Text));
      4:
        begin
          dev := ADeviceManage.FindDevByDriverNameFuzzy(Trim(edtCondition.Text));
          if dev = nil then//当前登录驾驶员未查到，再查drivermanage中绑定的车辆
          begin
            carId := ADriverManage.GetCarIdByDriverNameFuzzy(Trim(edtCondition.Text));
            if carId > 0 then
            begin
              dev := ADeviceManage.FindDevByCarId(carId);
            end;
          end;
        end;
      5:
        begin
          bSearchGroup := True;
          devGroup := ADevGroupManage.FindByNameFuzzy(Trim(edtCondition.Text));
        end;
    end;
  end
  else
  begin
    case cbxSearchType.ItemIndex of
      0:
        dev := ADeviceManage.FindDevFromCarNo(Trim(edtCondition.Text));
      1:
        dev := ADeviceManage.FindDevByZBH(Trim(edtCondition.Text));
      2:
        dev := ADeviceManage.find(Trim(edtCondition.Text));
      3:
        dev := ADeviceManage.FindDevFromSimno(Trim(edtCondition.Text));
      4:
        begin
          dev := ADeviceManage.FindDevByDriverName(Trim(edtCondition.Text));
          if dev = nil then//当前登录驾驶员未查到，再查drivermanage中绑定的车辆
          begin
            carId := ADriverManage.GetCarIdByDriverName(Trim(edtCondition.Text));
            if carId > 0 then
            begin
              dev := ADeviceManage.FindDevByCarId(carId);
            end;
          end;
        end;
      5:
        begin
          bSearchGroup := True;
          devGroup := ADevGroupManage.FindByName(Trim(edtCondition.Text));
        end;
    end;
  end;

  if not bSearchGroup then
  begin
    if dev = nil then
    begin
      ShowTips('没有找到满足该条件的车辆，请重新输入查询条件', edtCondition);
      edtCondition.SetFocus;
      Exit;
    end;  
    node := GetTreeNodeByGroupId(dev.GroupID, TreeView2);
    if node <> nil then
    begin
      FDlg_Watch_Car.rbAll.Checked := True;
      TreeView2.Select(node);
      TreeView2Change(Sender, node);
      cxNode := FindNodeByTextIncxTreeList(dev.Id, FDlg_Watch_Car.cxDeviceList, 0);
      if cxNode <> nil then
      begin
        cxNode.Focused := True;
        FDlg_Watch_Car.dbClickSelectedNode;
      end;
      TreeView2.SetFocus;
    end;
  end
  else
  begin
    if devGroup = nil then
    begin
      ShowTips('没有找到满足该条件的车辆组，请重新输入查询条件', edtCondition);
      edtCondition.SetFocus;
      Exit;
    end;
    node := GetTreeNodeByGroupId(devGroup.id, TreeView2);
    if node <> nil then
    begin
      FDlg_Watch_Car.rbAll.Checked := True;
      TreeView2.Select(node);
      TreeView2Change(Sender, node);
      TreeView2.SetFocus;
    end;
  end;  
end;

procedure TMainf.edtConditionKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
  begin
    btnSearch.Click;
  end;  
end;

procedure TMainf.FMapActionChanged;
begin
  if (FMap.MouseAction <> actSetRunWay) and (tmpPolyLineArea <> nil) then
  begin//设置路线时，中途切换mouseaction，则清空之前所画的路段
    FAllAreaManage.Delete(-1);
    tmpPolyLineArea := nil;
    FMap.Draw;
  end;  
end;

procedure TMainf.show_RunRecDataExecute(Sender: TObject);
begin
  ShowWindows(Sender, PageControlBottom, FDlg_RunRecDataUpload, alLeft);
end;

procedure TMainf.show_AlarmSuperviseExecute(Sender: TObject);
begin
  ShowWindows(Sender, PageControlBottom, FDlg_AlarmSupervise, alLeft);
end;

procedure TMainf.fun_SendQueryVideoExecute(Sender: TObject);
var
  dlg: TfrmQueryVideo;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  if not CheckDevId then
  begin
    fun_Devs_SendQueryVideoExecute(Sender);
    exit;
  end;
  dlg := TfrmQueryVideo.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    Add_A_Device;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.show_QueryVideoListExecute(Sender: TObject);
begin
  ShowWindows(Sender, PageControlBottom, FDlg_QueryVideoList, alLeft);
end;

procedure TMainf.fun_Devs_SendQueryVideoExecute(Sender: TObject);
var
  dlg: TfrmQueryVideo;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  dlg := TfrmQueryVideo.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    AddDeviceByGroup;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.show_RecvGovInfoExecute(Sender: TObject);
begin
  ShowWindows(Sender, PageControl_Center, FDlg_RevGovInfo, alLeft);
end;

procedure TMainf.resetScrollLabelCaptionWithTemp(str: string);
var
  i: Integer;
  alarmInfo: TAlarmInfoFromDev;
  devIdList: TStringList;
  dev: TDevice;
begin
  timerScrollAlarm.Enabled := False;
  RzLabel1.Caption := str;
  devIdList := TStringList.Create;
  try
    for i := FAlarmInfoManage.Count - 1 downto 0 do
    begin
      alarmInfo := FAlarmInfoManage.Items[i];
      if alarmInfo.AlarmType <> 0 then Continue;
      if devIdList.IndexOf(alarmInfo.DevId) < 0 then
        devIdList.Add(alarmInfo.DevId);
    end;
    for i := 0 to devIdList.Count - 1 do
    begin
      dev := ADeviceManage.find(devIdList.Strings[i]);
      if dev.Switch_Warning[0] then
      begin
        if RzLabel1.Caption = '' then
          RzLabel1.Caption := RzLabel1.Caption + dev.Car.No + '  发生紧急报警'
        else
          RzLabel1.Caption := RzLabel1.Caption + '       ' + dev.Car.No + '  发生紧急报警';
      end;
    end;
    RzLabel1.Top := Panel6.Top;
    RzLabel1.Height := Panel6.Height;
    RzLabel1.Left := Panel6.Width;
    if RzLabel1.Caption = '' then
      FAlarmInfoManage.IsEmergencyHappened := False;
    timerScrollAlarm.Enabled := True;
  finally
    devIdList.Free;
  end;
end;


function TMainf.UserDefinedText(EarthPoint: TEarthPoint;
  WorldPoint: TWorldPoint): string;
var
  i: integer;
  pp: PUserDefinedText;
begin
  UserDefinedTextForm := TUserDefinedTextForm.Create(Self);
  try
    UserDefinedTextForm.Edit3.Text := IntToStr(FMap.DrawCood.Scale);
    i := GTextManage.Find(WorldPoint);
    if i >= 0 then
    begin
      UserDefinedTextForm.editIDStr.Text := IntToStr(GTextManage.Item[i]^.ID);
      UserDefinedTextForm.EditName.Text := GTextManage.Item[i]^.Text;
      UserDefinedTextForm.Font.Name := GTextManage.Item[i]^.TextFont.FontName;
      UserDefinedTextForm.Font.Size := GTextManage.Item[i]^.TextFont.Size;
      UserDefinedTextForm.Font.Color := GTextManage.Item[i]^.TextFont.ForeColor;
      UserDefinedTextForm.EditFont.Text := GTextManage.Item[i]^.TextFont.FontName + ',' + intToStr(GTextManage.Item[i]^.TextFont.Size);
      UserDefinedTextForm.EditX.Text := FormatFloat('0.000000', EarthPoint.x);
      UserDefinedTextForm.EditY.Text := FormatFloat('0.000000', EarthPoint.y);
      UserDefinedTextForm.EditType.Text := IntToStr(GTextManage.Item[i]^.Symbol.CustomSymbol.Shape);
      UserDefinedTextForm.BitBtnOK.Caption := '修改';
      if GTextManage.Item[i]^.MaxScale > 0 then
      begin
        UserDefinedTextForm.CheckBox1.Checked := true;
        UserDefinedTextForm.Edit1.Text := IntToStr(GTextManage.Item[i]^.MinScale);
        UserDefinedTextForm.Edit2.Text := IntToStr(GTextManage.Item[i]^.MaxScale);
      end
      else
      begin
        UserDefinedTextForm.CheckBox1.Checked := false;
        UserDefinedTextForm.Edit1.Text := '';
        UserDefinedTextForm.Edit2.Text := '';
      end;
      UserDefinedTextForm.CheckBox1Click(nil);
      if UserDefinedTextForm.ShowModal = MrOK then
      begin
        if UserDefinedTextForm.EditName.Text = '' then
        begin
          GTextManage.Delete(i, ExePath + 'UserDefinedText.ini', UserDefinedTextForm.editIDStr.text);
        end
        else
        begin
          GTextManage.Item[i]^.Text := UserDefinedTextForm.EditName.Text;
          GTextManage.Item[i]^.TextFont.Size := UserDefinedTextForm.Font.Size;
          GTextManage.Item[i]^.TextFont.FontName := UserDefinedTextForm.Font.Name;
          GTextManage.Item[i]^.TextFont.ForeColor := UserDefinedTextForm.Font.Color;
          GTextManage.Item[i]^.TextFont.Transparent := 1;
          GTextManage.Item[i]^.Symbol.CustomSymbol.Shape := StrToInt(UserDefinedTextForm.EditType.Text);
          GTextManage.Item[i]^.Symbol.CustomSymbol.Color := clRed;
          GTextManage.Item[i]^.Symbol.CustomSymbol.Size := 8;
          GTextManage.Item[i]^.isSave := False;
          if UserDefinedTextForm.CheckBox1.Checked then
          begin
            if UserDefinedTextForm.Edit1.Text <> '' then
              GTextManage.Item[i]^.MinScale := StrToInt(UserDefinedTextForm.Edit1.Text);
            if UserDefinedTextForm.Edit2.Text <> '' then
              GTextManage.Item[i]^.MaxScale := StrToInt(UserDefinedTextForm.Edit2.Text);
          end
          else
            GTextManage.Item[i]^.MaxScale := -1;
          GTextManage.ModifyToFile(ExePath + 'UserDefinedText.ini', GTextManage.Item[i]);
        end;
        ShowUserDefinedText;
      end;
    end
    else
    begin
      //UserDefinedTextForm.EditName.Text := IntToStr(GTextManage.MaxID);
      UserDefinedTextForm.editidStr.text := IntToStr(GTextManage.MaxID);
      UserDefinedTextForm.EditX.Text := FormatFloat('0.000000', EarthPoint.X);
      UserDefinedTextForm.EditY.Text := FormatFloat('0.000000', EarthPoint.y);
      UserDefinedTextForm.EditType.Text := '67';
      UserDefinedTextForm.Font.Name := '宋体';
      UserDefinedTextForm.Font.Size := 10;
      UserDefinedTextForm.Font.Color := 0;
      UserDefinedTextForm.EditFont.Text := '宋体,10';
      UserDefinedTextForm.BitBtnOK.Caption := '添加';
      UserDefinedTextForm.CheckBox1.Checked := false;
      UserDefinedTextForm.Edit1.Text := '';
      UserDefinedTextForm.Edit2.Text := '';
      UserDefinedTextForm.CheckBox1Click(nil);

      if UserDefinedTextForm.ShowModal = MrOK then
      begin
        if UserDefinedTextForm.EditName.Text <> '' then
        begin
          pp := GTextManage.Add(UserDefinedTextForm.EditName.Text, WorldPoint);
          //pp^.IDStr := StrToIn( UserDefinedTextForm.editIDStr.text);
          pp^.TextFont.Size := UserDefinedTextForm.Font.Size;
          pp^.TextFont.FontName := UserDefinedTextForm.Font.Name;
          pp^.TextFont.ForeColor := UserDefinedTextForm.Font.Color;
          pp^.TextFont.Transparent := 1;
          pp^.Symbol.CustomSymbol.Shape := StrToInt(UserDefinedTextForm.EditType.Text);
          pp^.Symbol.CustomSymbol.Color := clRed;
          pp^.Symbol.CustomSymbol.Size := 8;
          if UserDefinedTextForm.CheckBox1.Checked then
          begin
            if UserDefinedTextForm.Edit1.Text <> '' then
              pp^.MinScale := StrToInt(UserDefinedTextForm.Edit1.Text);
            if UserDefinedTextForm.Edit2.Text <> '' then
              pp^.MaxScale := StrToInt(UserDefinedTextForm.Edit2.Text);
          end
          else
            pp^.MaxScale := -1;
          GTextManage.SaveToFile(ExePath + 'UserDefinedText.ini',pp);
          ShowUserDefinedText;
          Result := '[{''Text'':''' + UserDefinedTextForm.EditName.Text + ''',''IdStr'':''' + IntToStr(pp^.ID) + '''}]';
        end;
      end;
    end;
  finally
    UserDefinedTextForm.Free;
  end;
end;

function TMainf.SetConfineAlarmArea(WPointsAry: TWorldPointAry;
  PointsCnt: Integer): string;
       //把两个点转成四个点,即把两点转一个四点的巨型
  procedure GetPoint(A: TPoint; B: TPoint; var OutA1: TPoint; var OutA2: TPoint;
    var OutB1: TPoint; var OutB2: TPoint; Distance: longint);
  var
    k1, k2: double;
    temp: Extended;
  begin
          //斜率等于0度时
    if ((b.Y - a.Y) = 0) then
    begin
      OutA1.X := A.X;
      OutA2.X := A.X;

      OutA1.Y := A.Y + Distance;
      OutA2.Y := A.Y - Distance;

      OutB1.X := B.X;
      OutB2.X := B.X;
      OutB1.Y := B.Y + Distance;
      OutB2.Y := B.Y - Distance;
    end
          //斜率等于90度时
    else if ((b.X - a.X) = 0) then
    begin
      OutA1.X := A.X + Distance;
      OutA2.X := A.X - Distance;

      OutA1.Y := A.Y;
      OutA2.Y := A.Y;

      OutB1.X := B.X + Distance;
      OutB2.X := B.X - Distance;
      OutB1.Y := B.Y;
      OutB2.Y := B.Y;
    end
    else
    begin
      k1 := (b.Y - a.Y) / (b.X - a.X); //直线的斜率
      k2 := -1 / k1; //垂直直线的斜率
      temp := Sqrt((Distance * Distance) / (1 + k2 * k2));
      OutA1.X := round(temp + A.X);
      OutA2.X := round(-temp + A.X);

      OutA1.Y := round(k2 * (OutA1.X - A.X) + A.Y);
      OutA2.Y := round(k2 * (OutA2.X - A.X) + A.Y);

      OutB1.X := round(temp + B.X);
      OutB2.X := round(-temp + B.X);
      OutB1.Y := round(k2 * (OutB1.X - B.X) + B.Y);
      OutB2.Y := round(k2 * (OutB2.X - B.X) + B.Y);
    end;
  end;

var
  dlg: TConfineAreaSetFrm;
  tmpArea: TConfineArea;
  i: integer;
  temp1, temp2: TWorldPointAry;
  a1, a2, b1, b2: TPoint;
  tmpint: integer;
  dt: TDateTime;
begin
  if PointsCnt < 2 then exit;
  dlg := TConfineAreaSetFrm.Create(nil);
  try
    dlg.Edit_AreaID.Text := IntTostr(GAreaManage.MaxId);
    dlg.Edit_AreaName.Text := '区域' + IntToStr(GAreaManage.MaxId);
    dlg.Edit_AreaColor.Color := clred;
    dlg.CheckBox_IsDraw.Checked := True;
    dlg.CheckBoxShowPop.Checked := true;
    dlg.ShowModal;
    if dlg.ModalResult = mrok then
    begin
      begin
        if (dlg.ComboBox_AreaType.ItemIndex < ALARM_WAY_OUT) and (PointsCnt < 3) then exit;
        tmpArea := GAreaManage.Add(StrToInt(dlg.Edit_AreaID.text));
        if dlg.Edit_LimitSpeet.Visible then //判断是否有超速设置
        begin
          if dlg.Edit_LimitSpeet.Text <> '' then
            tmpArea.OverSpeet := StrToInt(dlg.Edit_LimitSpeet.Text);
        end;
        tmpArea.ID := StrToInt(dlg.Edit_AreaID.Text);
        tmpArea.Name := trim(dlg.Edit_AreaName.Text);
        tmpArea.AreaColor := dlg.Edit_AreaColor.Color;
        tmpArea.AreaType := dlg.ComboBox_AreaType.ItemIndex; // 报警的类型
        tmpArea.IsDraw := dlg.CheckBox_IsDraw.Checked;
        tmpArea.AlarmDistance := 1000;


        tmpArea.IsEnabledTime := dlg.CheckBoxEnabledTime.Checked;
        tmpArea.BeginTime := dlg.BeginTime.Time - Trunc(dlg.BeginTime.Time);
        tmpArea.EndTime := dlg.EndTime.Time - Trunc(dlg.EndTime.Time);
        tmpArea.IsShowPop := dlg.CheckBoxShowPop.Checked;
        tmpArea.Area_Type := 2; // 类型 0  

        if dlg.ComboBox_AreaType.ItemIndex = 2 then
        begin
          dt := dlg.arriveDate.DateTime;
          ReplaceTime(dt, dlg.arriveTime.Time);
          tmpArea.ArriveDateTime := dt;
          dt := dlg.leaveDate.DateTime;
          ReplaceTime(dt, dlg.leaveTime.Time);
          tmpArea.LeaveDateTime := dt;
        end;

        if (dlg.ComboBox_AreaType.ItemIndex = ALARM_WAY_OUT) or //如果是固定线路
          (dlg.ComboBox_AreaType.ItemIndex = ALARM_WAY_IN) then
        begin
          tmpint := PointsCnt * 2 - 2;
          Setlength(temp1, tmpint);
          Setlength(temp2, tmpint);
          for i := 0 to PointsCnt - 2 do
          begin
            GetPoint(WPointsAry[i], WPointsAry[i + 1], a1, a2, b1, b2, tmpArea.AlarmDistance);
            tmpArea.RunWayRectList.Add(a1, a2, b2, b1);
          end;

          tmpArea.SetLengthPointAry(PointsCnt);
          for i := 0 to PointsCnt - 1 do
          begin
            tmpArea.WorldPointAry[i] := WPointsAry[i];
          end;
          tmpArea.OutBox := tmpArea.RunWayRectList.OutBox;
        end
        else //区域报警
        begin
          if PointsCnt < 3 then exit;
          tmpArea.SetLengthPointAry(PointsCnt);
          for i := 0 to PointsCnt - 1 do
          begin
            tmpArea.WorldPointAry[i] := WPointsAry[i];
          end;
          tmpArea.WorldPointAryToOutBox(tmpArea.WorldPointAry, 0, tmpArea.PointCount);
        end;
      end;

      //------------ 显示电子围栏列表
      if (not FDlg_ConfineAreaList.Visible) then
      begin
        FDlg_ConfineAreaList.ManualDock(PageControlBottom, nil, alLeft);
        FDlg_ConfineAreaList.Show;
        for i := 0 to PageControlBottom.PageCount - 1 do
          if PageControlBottom.Pages[i].Caption = '电子围栏列表' then
          begin
            PageControlBottom.ActivePageIndex := i;
            break;
          end;
      end;
      FDlg_ConfineAreaList.ListConfineAreas;
      //------------ 显示电子围栏

      Result := '[{''Text'':''' + tmpArea.Name + ''',''IdStr'':''' + IntToStr(tmpArea.ID) + '''}]';
    end
    else
    begin
      Result := '';
    end;
  finally
    dlg.Free;
  end;
end;

function TMainf.SetCircleArea(Radius: Double; WorldPoint: TWorldPoint; lastPoint: TWorldPoint): string;
var
  dlg: TConfineAreaSetFrm;
  tmpArea: TConfineArea;
  i: integer;
  temp1, temp2: TWorldPointAry;
  a1, a2, b1, b2: TPoint;
  tmpint: integer;
  dt: TDateTime;
begin
  dlg := TConfineAreaSetFrm.Create(nil);
  try
    dlg.Edit_AreaID.Text := IntTostr(GAreaManage.MaxId);
    dlg.Edit_AreaName.Text := '区域' + IntToStr(GAreaManage.MaxId);
    dlg.Edit_AreaColor.Color := clred;
    dlg.CheckBox_IsDraw.Checked := True;
    dlg.CheckBoxShowPop.Checked := true;
    dlg.ShowModal;
    if dlg.ModalResult = mrok then
    begin
      tmpArea := GAreaManage.Add(StrToInt(dlg.Edit_AreaID.text));
      if dlg.Edit_LimitSpeet.Visible then //判断是否有超速设置
      begin
        if dlg.Edit_LimitSpeet.Text <> '' then
          tmpArea.OverSpeet := StrToInt(dlg.Edit_LimitSpeet.Text);
      end;
      tmpArea.ID := StrToInt(dlg.Edit_AreaID.Text);
      tmpArea.Name := trim(dlg.Edit_AreaName.Text);
      tmpArea.AreaColor := dlg.Edit_AreaColor.Color;
      tmpArea.AreaType := dlg.ComboBox_AreaType.ItemIndex; // 报警的类型
      tmpArea.IsDraw := dlg.CheckBox_IsDraw.Checked;
      tmpArea.AlarmDistance := 1000;


      tmpArea.IsEnabledTime := dlg.CheckBoxEnabledTime.Checked;
      tmpArea.BeginTime := dlg.BeginTime.Time - Trunc(dlg.BeginTime.Time);
      tmpArea.EndTime := dlg.EndTime.Time - Trunc(dlg.EndTime.Time);
      tmpArea.IsShowPop := dlg.CheckBoxShowPop.Checked;

      tmpArea.Area_Type := 0; // 类型 0
      tmpArea.Radius := Radius;// 半径
      tmpArea.CenterPoint :=  Project.XY2LoLa(WorldPoint);// 中心点
      tmpArea.LastPoint := Project.XY2LoLa(LastPoint);// 中心点
      
      if dlg.ComboBox_AreaType.ItemIndex = 2 then
      begin
        dt := dlg.arriveDate.DateTime;
        ReplaceTime(dt, dlg.arriveTime.Time);
        tmpArea.ArriveDateTime := dt;
        dt := dlg.leaveDate.DateTime;
        ReplaceTime(dt, dlg.leaveTime.Time);
        tmpArea.LeaveDateTime := dt;
      end;
      //------------ 显示电子围栏列表
      if (not FDlg_ConfineAreaList.Visible) then
      begin
        FDlg_ConfineAreaList.ManualDock(PageControlBottom, nil, alLeft);
        FDlg_ConfineAreaList.Show;
        for i := 0 to PageControlBottom.PageCount - 1 do
          if PageControlBottom.Pages[i].Caption = '电子围栏列表' then
          begin
            PageControlBottom.ActivePageIndex := i;
            break;
          end;
      end;
      FDlg_ConfineAreaList.ListConfineAreas;
      //------------ 显示电子围栏

      Result := '[{''Text'':''' + tmpArea.Name + ''',''IdStr'':''' + IntToStr(tmpArea.ID) + '''}]';
    end
    else
    begin
      Result := '';
    end;
  finally
    dlg.Free;
  end;
end;

function TMainf.SetConfineAreaToDev(areaShape: byte;
  WCenterPoint: TEarthPoint; Radius: Integer; LastPoint, LeftPoint,
  RightPoint: TEarthPoint; WPointsAry: TWorldPointAry;
  PointsCnt: Integer): string;
  procedure GetPoint(A: TPoint; B: TPoint; var OutA1: TPoint; var OutA2: TPoint;
    var OutB1: TPoint; var OutB2: TPoint; Distance: longint);
  var
    k1, k2: double;
    temp: Extended;
  begin
          //斜率等于0度时
    if ((b.Y - a.Y) = 0) then
    begin
      OutA1.X := A.X;
      OutA2.X := A.X;

      OutA1.Y := A.Y + Distance;
      OutA2.Y := A.Y - Distance;

      OutB1.X := B.X;
      OutB2.X := B.X;
      OutB1.Y := B.Y + Distance;
      OutB2.Y := B.Y - Distance;
    end
          //斜率等于90度时
    else if ((b.X - a.X) = 0) then
    begin
      OutA1.X := A.X + Distance;
      OutA2.X := A.X - Distance;

      OutA1.Y := A.Y;
      OutA2.Y := A.Y;

      OutB1.X := B.X + Distance;
      OutB2.X := B.X - Distance;
      OutB1.Y := B.Y;
      OutB2.Y := B.Y;
    end
    else
    begin
      k1 := (b.Y - a.Y) / (b.X - a.X); //直线的斜率
      k2 := -1 / k1; //垂直直线的斜率
      temp := Sqrt((Distance * Distance) / (1 + k2 * k2));
      OutA1.X := round(temp + A.X);
      OutA2.X := round(-temp + A.X);

      OutA1.Y := round(k2 * (OutA1.X - A.X) + A.Y);
      OutA2.Y := round(k2 * (OutA2.X - A.X) + A.Y);

      OutB1.X := round(temp + B.X);
      OutB2.X := round(-temp + B.X);
      OutB1.Y := round(k2 * (OutB1.X - B.X) + B.Y);
      OutB2.Y := round(k2 * (OutB2.X - B.X) + B.Y);
    end;
  end;
var
  dlg: TFrm_AllArea;
  area: TBaseArea;
  areaPar: string;
  areaParMcu: string;
  dev: TDevice;
  i, cx, cy, cx1, cy1: integer;
  areaID: word;
  isvisible: integer;
  dateTime: TDateTime;
  Apoint: TEarthPoint;
  cnt:Integer;
  setType: Byte;
begin
  try
    dlg := TFrm_AllArea.Create(self);
    dlg.Edit_NO.Text := IntToStr(FAllAreaManage.GetAreaNo);
    dlg.AreaShape := areaShape;
    dlg.Notebook1.PageIndex := areaShape;
    case areaShape of
      AREASHAPE_CIRCLE:
      begin
        dlg.Edit4.Text := '圆形';
        dlg.Edit3.Text := formatfloat('0.000', WCenterPoint.X);
        dlg.Edit5.Text := formatfloat('0.000', WCenterPoint.y);
        dlg.Edit6.Text := inttostr(Radius);
      end;
      AREASHAPE_RECT  :
      begin
        dlg.Edit4.Text := '矩形';
        dlg.EditLeftLong.Text := formatfloat('0.000', LeftPoint.Longitude); ;
        dlg.EditLeftLat.Text := formatfloat('0.000', LeftPoint.Latitude);
        dlg.EditRightLong.Text := formatfloat('0.000', RightPoint.Longitude);
        dlg.EditRightLat.Text := formatfloat('0.000', RightPoint.Latitude);
      end;
      AREASHAPE_POLY  :
      begin
        dlg.Edit4.Text := '多边形';
        dlg.rbUpdate.Visible := False;
        dlg.rbAttach.Visible := False;
        dlg.rbModify.Visible := False;
      end;
    end;
           
    dateTime := Now;
    dlg.beginDate.DateTime := dateTime;
    dlg.beginTime.DateTime := dateTime;
    dateTime := dateTime + 1/12;
    dlg.endDate.DateTime := dateTime;
    dlg.endTime.DateTime := dateTime;
    dlg.CheckBox1.Checked := False;
    dlg.CheckBoxEveryDay.Checked := False;
    dlg.CheckBox2.Checked := False;
    dlg.CheckBox3.Checked := False;
    dlg.CheckBox4.Checked := False;
    dlg.CheckBox5.Checked := False;
    dlg.CheckBox6.Checked := False;
    dlg.rbNLat.Checked := True;
    dlg.rbELong.Checked := True;
    //=====得到点信息
    if dlg.ShowModal = mrok then
    begin
      if dlg.rbUpdate.Checked then
        setType := 0
      else if dlg.rbAttach.Checked then
        setType := 1
      else if dlg.rbModify.Checked then
        setType := 2
      else
        setType := 1;

      case areaShape of
        AREASHAPE_CIRCLE:
        begin
          area := TCircleArea.Create;
          TCircleArea(area).radius := Radius;
          TCircleArea(area).ACircle := WCenterPoint;
          TCircleArea(area).lastPoint := LastPoint;
          areaParMcu := floattostr(TCircleArea(area).ACircle.Longitude) + ',' + floattostr(TCircleArea(area).ACircle.Latitude) + ',' + inttostr(TCircleArea(area).radius) + ','
            + floattostr(TCircleArea(area).lastPoint.Longitude) + ',' + floattostr(TCircleArea(area).lastPoint.Latitude);
          areaPar := floattostr(TCircleArea(area).ACircle.Longitude * 1000000) + ',' + floattostr(TCircleArea(area).ACircle.Latitude * 1000000) + ',' + inttostr(TCircleArea(area).radius) + ','
            + floattostr(TCircleArea(area).lastPoint.Longitude * 1000000) + ',' + floattostr(TCircleArea(area).lastPoint.Latitude * 1000000);
          cnt :=1;
        end;
        AREASHAPE_RECT  :
        begin
          area :=  TRectangleArea.Create;
          TRectangleArea(area).leftPoint := LeftPoint;
          TRectangleArea(area).RightPoint := RightPoint;
          areaParMcu := floattostr(TRectangleArea(area).leftPoint.Longitude) + ',' + floattostr(TRectangleArea(area).leftPoint.Latitude)
                +  ',' + floattostr(TRectangleArea(area).RightPoint.Longitude) + ',' + floattostr(TRectangleArea(area).RightPoint.Latitude);
          cx := round(TRectangleArea(area).leftPoint.Longitude * 1000000);
          cy := round(TRectangleArea(area).leftPoint.Latitude * 1000000);
          cx1 := round(TRectangleArea(area).RightPoint.Longitude * 1000000);
          cy1 := round(TRectangleArea(area).RightPoint.Latitude * 1000000);
          AreaPar := inttostr(cx) + ',' + inttostr(cy) + ',' + inttostr(cx1) + ',' + inttostr(cy1);
          cnt := 2;
        end;
        AREASHAPE_POLY  :
        begin
          area :=  TNoSymbolArea.Create;
          TNoSymbolArea(area).SetLengthPointAry(PointsCnt);
          TNoSymbolArea(area).PointCount := PointsCnt;
          for i := 0 to PointsCnt - 1 do
          begin
            TNoSymbolArea(area).WorldPointAry[i] := WPointsAry[i];
            Apoint := Project.XY2LoLa(TNoSymbolArea(area).WorldPointAry[i]);
            cx := round(Apoint.Longitude * 1000000);
            cy := round(Apoint.Latitude * 1000000);
            if i = PointsCnt - 1 then
            begin
              AreaParMCU := AreaParMCU + FloatToStr(Apoint.Longitude) + ',' + FloatToStr(Apoint.Latitude);
              AreaPar := AreaPar + inttostr(TNoSymbolArea(area).WorldPointAry[i].X) + ',' + inttostr(TNoSymbolArea(area).WorldPointAry[i].y);
            end else
            begin
              AreaParMCU := AreaParMCU + FloatToStr(Apoint.Longitude) + ',' + FloatToStr(Apoint.Latitude) + ',';
              AreaPar := AreaPar + inttostr(TNoSymbolArea(area).WorldPointAry[i].X) + ',' + inttostr(TNoSymbolArea(area).WorldPointAry[i].y) + ',';
            end;
          end;
          TNoSymbolArea(area).WorldPointAryToOutBox(TNoSymbolArea(area).WorldPointAry, 0, TNoSymbolArea(area).PointCount);
          cnt := PointsCnt;
        end;
      end;

      area.areaNO := StringToInteger(dlg.Edit_NO.Text);
      area.AreaAlarmKind := dlg.Area_Property;
      area.AreaName := dlg.Edit2.Text;
      
      area.IsEveryDay := dlg.CheckBoxEveryDay.Checked;
      dateTime := dlg.beginDate.DateTime;
      ReplaceTime(dateTime, dlg.beginTime.DateTime);
      dateTime := StrToDateTime(FormatDatetime('yy-mm-dd hh:nn:ss',dateTime));
      area.beginDateTiem := dateTime;

      dateTime := dlg.endDate.DateTime;
      ReplaceTime(dateTime, dlg.endTime.DateTime);
      dateTime := StrToDateTime(FormatDatetime('yy-mm-dd hh:nn:ss',dateTime));
      area.endDateTime := dateTime;

      area.IsSpeedLimited := dlg.CheckBox2.Checked;
      area.maxSpeed := StringToInteger(dlg.Edit_MaxSpeed.Text);
      area.continueTime := StringToInteger(dlg.Edit_time.Text);

      area.AreaPictureKind := areaShape;
      if dlg.ComboBox1.ItemIndex = 0 then
      begin
        area.isshow := true;
        isvisible := 1;
      end else
      begin
        isvisible := 0;
        area.isshow := false;
      end;
      area.AreaParMcu := AreaParMcu;
      area.AreaPar := AreaPar;

      AreaID := Bs.AddNewArea_new(area.AreaName,area.AreaPictureKind, area.areaNO, area.AreaAlarmKind,
                                  FormatDateTime('yyyy-MM-dd hh:nn:ss', area.beginDateTiem), FormatDateTime('yyyy-MM-dd hh:nn:ss', area.endDateTime),area.maxSpeed,
                                  area.continueTime,cnt{1}, AreaPar, AreaParMcu, isvisible);

      area.AreaID := areaID;
      if area.AreaID > 0 then
      begin
        FAllAreaManage.Add(area);
      end
      else
      begin
        MessageBox(Handle, '保存区域属性失败，请确认数据库连接正常', '提示', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;    

      if dlg.ListView1.Items.Count > 0 then
      begin
        for i := 0 to dlg.listview1.Items.Count - 1 do
        begin
          dev := TDevice(dlg.listview1.Items.Item[i].Data);
          //DataServer.SendCLIENT_SETELCFENCE(dev, area.areaNO, kindalarm, area.OverAlarmValue, area.idlingAlarmValue, kindArea, 12, param);
//          if Bs.AddNewDev_Area( dev.id, area.AreaID) then
//          begin
//            area.AddDev(dev.Id);
//            dev.AddADevArea(area);
            //发送成功得到应答后再增加区域与设备的对应关系
            case areaShape of
              AREASHAPE_CIRCLE:
                DataServer.SendSetCircleArea_New_V3(dev, TCircleArea(area), setType);
              AREASHAPE_RECT  :
                DataServer.SendSetRectangleArea_New_V3(dev,TRectangleArea(area), setType);
              AREASHAPE_POLY  :
                DataServer.SendSetNoSymbolArea_New_V3(dev,TNoSymbolArea(area));
            end;
//          end;
        end;
      end;
      if areaID > 0 then
      begin
        FDlg_AreaToDev.addKindToListView(areaID);                       
      end;                                                   
      Result := '[{''Text'':''' + area.AreaName + ''',''IdStr'':''' + IntToStr(area.AreaID) + '''}]';
    end else
    begin
      result := '';
    end;
  finally
    dlg.Free;
  end;
end;

function TMainf.SetRunWayToDev(WPointsAry: TWorldPointAry;
  PointsCnt: Integer): string;
var
  dlgLineSection: TfrmSetLineSection;
  i, j: Integer;
  lineSection: TLineSection;
  sIndex: Integer;
  lineSectionNo: Integer;
  Temp: string;
  ShowModel: integer;
begin
  if PointsCnt<2 then exit;

  if tmpPolyLineArea = nil then
    tmpPolyLineArea := TPolyLineArea.Create;
  try
    dlgLineSection := TfrmSetLineSection.Create(Self);
    lineSectionNo := FAllAreaManage.MaxLineSectionNo + tmpPolyLineArea.LineSectionCount + 1;
    try
      dlgLineSection.edtLineSectionId.Text := IntToStr(lineSectionNo);
      if dlgLineSection.ShowModal = mrOk then
      begin
        lineSection := tmpPolyLineArea.AddLineSection(lineSectionNo);
        if lineSection = nil then Exit;
        lineSection.LineSectionWidth := dlgLineSection.lineSectionWidth;
        lineSection.LineSectionProperty := dlgLineSection.LineSectionProperty;
        lineSection.LineSectionRunMaxTime := dlgLineSection.lineSectionRunMaxTime;
        lineSection.LineSectionRunMinTime := dlgLineSection.LineSectionRunMinTime;
        lineSection.LineSectionMaxSpeed := dlgLineSection.LineSectionMaxSpeed;
        lineSection.LineSectionOverSpeedTime := dlgLineSection.LineSectionOverspeedTime;

        sIndex := Length(tmpPolyLineArea.WorldPointAry);
        tmpPolyLineArea.SetLengthPointAry(sIndex + PointsCnt);
        lineSection.SetWorldPointAryLength(PointsCnt);
        j := 0;

        for i := 0 to PointsCnt - 1 do
        begin
          tmpPolyLineArea.WorldPointAry[sIndex + i].X := WPointsAry[i].X;
          tmpPolyLineArea.WorldPointAry[sIndex + i].Y := WPointsAry[i].Y;

          lineSection.WPointAry[i].X := WPointsAry[i].X;
          lineSection.WPointAry[i].Y := WPointsAry[i].Y;
          //Inc(j);
        end;
        
        Result := GetLineProperty(lineSection);
      end else
      //if dlgLineSection.ShowModal = mrYES then
      begin
        lineSection := tmpPolyLineArea.AddLineSection(lineSectionNo);
        if lineSection = nil then Exit;
        lineSection.LineSectionWidth := dlgLineSection.lineSectionWidth;
        lineSection.LineSectionProperty := dlgLineSection.LineSectionProperty;
        lineSection.LineSectionRunMaxTime := dlgLineSection.lineSectionRunMaxTime;
        lineSection.LineSectionRunMinTime := dlgLineSection.LineSectionRunMinTime;
        lineSection.LineSectionMaxSpeed := dlgLineSection.LineSectionMaxSpeed;
        lineSection.LineSectionOverSpeedTime := dlgLineSection.LineSectionOverspeedTime;

        sIndex := Length(tmpPolyLineArea.WorldPointAry);
        tmpPolyLineArea.SetLengthPointAry(sIndex + PointsCnt);
        lineSection.SetWorldPointAryLength(PointsCnt);
        j := 0;

        for i := 0 to PointsCnt - 1 do
        begin
          tmpPolyLineArea.WorldPointAry[sIndex + i].X := WPointsAry[i].X;
          tmpPolyLineArea.WorldPointAry[sIndex + i].Y := WPointsAry[i].Y;

          lineSection.WPointAry[i].X := WPointsAry[i].X;
          lineSection.WPointAry[i].Y := WPointsAry[i].Y;
          //Inc(j);
        end;
        Result := '';
        
        SetLineProperty(lineSection);

      end;
    except
      on E: Exception do
      begin
        Result := '';
        uGloabVar.SystemLog.AddLog('SetRunWay Exception:' + E.Message);
      end;
    end;
  finally
    dlgLineSection.Free;
  end;
end;

function TMainf.SetLineProperty(lineSection: TLineSection): boolean;
Var
  dlgLine: TfrmSetLine;
  i: Integer;
  dev: TDevice;
  temp: string;
begin
  if tmpPolyLineArea <> nil then
  begin
    dlgLine := TfrmSetLine.Create(Self);
    dlgLine.edtLineNo.Text := IntToStr(FAllAreaManage.GetAreaNo);
    try
      if dlgLine.ShowModal = mrOk then
      begin
        tmpPolyLineArea.areaNO := dlgLine.LineNo;
        tmpPolyLineArea.AreaName := dlgLine.LineName;
        tmpPolyLineArea.AreaPictureKind := AREASHAPE_POLYLINE;
        tmpPolyLineArea.AreaAlarmKind := dlgLine.LineProperty;
        tmpPolyLineArea.beginDateTiem := dlgLine.STime;
        tmpPolyLineArea.endDateTime := dlgLine.ETime;
        tmpPolyLineArea.isshow := True;
        tmpPolyLineArea.setAreaPar();
        tmpPolyLineArea.WorldPointAryToOutBox(tmpPolyLineArea.WorldPointAry, 0, tmpPolyLineArea.PointCount);
        tmpPolyLineArea.AreaID := Bs.AddNewArea_new(tmpPolyLineArea.AreaName, tmpPolyLineArea.AreaPictureKind, tmpPolyLineArea.areaNO,
                                                    tmpPolyLineArea.AreaAlarmKind, FormatDateTime('yyyy-MM-dd hh:nn:ss', tmpPolyLineArea.beginDateTiem),
                                                    FormatDateTime('yyyy-MM-dd hh:nn:ss', tmpPolyLineArea.endDateTime), 0, 0, tmpPolyLineArea.PointCount,
                                                    tmpPolyLineArea.AreaPar, tmpPolyLineArea.AreaPar, 1);
        if tmpPolyLineArea.AreaID > 0 then
        begin
          FAllAreaManage.Add(tmpPolyLineArea);
          if dlgLine.ListView1.Items.Count > 0 then
          begin
            for i := 0 to dlgLine.ListView1.Items.Count - 1 do
            begin
              dev := TDevice(dlgLine.ListView1.Items.Item[i].Data);
              if dev <> nil then
                DataServer.SendSetLineToDev_V3(dev, tmpPolyLineArea);
            end;  
          end;
          FDlg_AreaToDev.addKindToListView(tmpPolyLineArea.AreaID);
          //temp := GetLineProperty(lineSection);
          FinishDrawLine(tmpPolyLineArea);
          Result := true;
        end
        else
        begin
          MessageBox(Handle, '保存路线属性失败，请确认数据库连接正常', '提示', MB_OK + MB_ICONINFORMATION);
          //for i := 0 to tmpPolyLineArea.LineSectionCount-1 do
          //begin
          //  if i = tmpPolyLineArea.LineSectionCount - 1 then
          //    temp := temp + '{''IdStr'':''' + IntToStr(tmpPolyLineArea.LineSections[i].LineSectionId) + '''}'
          //  else
          //    temp := temp + '{''IdStr'':''' + IntToStr(tmpPolyLineArea.LineSections[i].LineSectionId) + '''},';
          //end;
          //temp := '[' + temp + ']';
          CancelDrawLines(tmpPolyLineArea);
          Result := false;
          Exit;
        end;
      end else
      begin
        //for i := 0 to tmpPolyLineArea.LineSectionCount-1 do
        //begin
        //  if i = tmpPolyLineArea.LineSectionCount - 1 then
        //    temp := temp + '{''IdStr'':''' + IntToStr(tmpPolyLineArea.LineSections[i].LineSectionId) + '''}'
        //  else
        //      temp := temp + '{''IdStr'':''' + IntToStr(tmpPolyLineArea.LineSections[i].LineSectionId) + '''},';
        //end;
        //temp := '[' + temp + ']';
        CancelDrawLines(tmpPolyLineArea);
        Result := false;
      end;
    finally
      dlgLine.Free;
      tmpPolyLineArea := nil;
    end;
  end
end;

procedure TMainf.BrowseSeekCar(BeginP, EndP: TEarthPoint);
var
  dlg: TMapSeekCarForm;
  tmpArea: TConfineArea;
  PointsCnt: Integer;
  LeftTop, RightTop, LeftBottom, RrightBottom: TPoint;
  gPoint: TEarthPoint;
begin

  dlg := TMapSeekCarForm.Create(Self);

  //gPoint := FMap.Projection.XY2LoLa(beginp);
  dlg.beginp.X := Trunc(beginp.X * 1000000);    // ls
  dlg.beginp.Y := Trunc(beginp.Y * 1000000);    // ls

  //gPoint := FMap.Projection.XY2LoLa(endp);
  dlg.endp.X := Trunc(EndP.X * 1000000);      // ls
  dlg.endp.Y := Trunc(EndP.Y * 1000000);

  dlg.Show;
end;

procedure TMainf.show_AudioExecute(Sender: TObject);
begin
  ShowWindows(Sender, PageControl_Center, FDlg_AudioFrm, alLeft);
end;

procedure TMainf.show_applyGpsDataFromGovExecute(Sender: TObject);
var
  dlg: TfrmExchangeGpsDataFromGov;
  sTime, eTime: TDateTime;
  cpColor: Byte;
begin
  dlg := TfrmExchangeGpsDataFromGov.Create(Self);
  try
    dlg.Caption := '申请交换指定车辆定位信息';
    dlg.sDate.DateTime := Now;
    dlg.sTime.DateTime := Now;
    dlg.eDate.DateTime := IncHour(Now, 1);
    dlg.eTime.DateTime := IncHour(Now, 1);
    if dlg.ShowModal = mrOk then
    begin
      cpColor := dlg.cbxCarCpColor.ItemIndex + 1;
      if cpColor > 4 then
        cpColor := 9;
      sTime := dlg.sDate.DateTime;
      ReplaceTime(sTime, dlg.sTime.Time);
      eTime := dlg.eDate.DateTime;
      ReplaceTime(eTime, dlg.eTime.Time);
      DataServer.SendGovApplyGpsData(Trim(dlg.edtCarNo.Text), cpColor, sTime, eTime);
    end;
  finally
    dlg.Free;
  end;
end;

procedure TMainf.show_cancelGpsDataFromGovExecute(Sender: TObject);
var
  dlg: TfrmExchangeGpsDataFromGov;
  cpColor: Byte;
begin
  dlg := TfrmExchangeGpsDataFromGov.Create(Self);
  try
    dlg.Caption := '取消交换指定车辆定位信息';
    dlg.sDate.Enabled := False;
    dlg.sTime.Enabled := False;
    dlg.eDate.Enabled := False;
    dlg.eTime.Enabled := False;
    if dlg.ShowModal = mrOk then
    begin
      cpColor := dlg.cbxCarCpColor.ItemIndex + 1;
      if cpColor > 4 then
        cpColor := 9;
      DataServer.SendGovCancelGpsData(Trim(dlg.edtCarNo.Text), cpColor);
    end;
  finally
    dlg.Free;
  end;
end;

procedure TMainf.show_videoExecute(Sender: TObject);
begin
  ShowWindows(Sender, PageControl_Center, FDlg_VideoFrm, alLeft);
end;

procedure TMainf.show_tspDataUploadExecute(Sender: TObject);
begin
  ShowWindows(Sender, PageControlBottom, FDlg_TSPDataUpload, alLeft);
end;

procedure TMainf.fun_readVerExecute(Sender: TObject);
var
  str: string;
  buf: array of Byte;
begin
  if GCurSelectDev = nil then exit;
  SetLength(buf, 1);
  SetLength(str, 1);
  buf[0] := $01;
  CopyMemory(@str[1], @buf[0], 1);
  DataServer.SendTSPData_V3(GCurSelectDev, $00, str);
end;

procedure TMainf.help_updatelogExecute(Sender: TObject);
begin
  if FileExists(ExePath + 'tyUpdateLog.txt') then
  begin
    SetCurrentDir(ExePath);
    shellexecute(handle, 'open', pchar(ExePath + 'tyUpdateLog.txt'), nil, nil, sw_show);
  end
  else
    MessageBox(handle, '对不起，没有找到软件修改日志文件！', '提示', MB_OK + MB_ICONINFORMATION);
end;

procedure TMainf.show_DevKeyEventLogExecute(Sender: TObject);
begin
  ShowWindows(Sender, PageControlBottom, FDlg_DevKeyEventLog, alLeft);
end;

procedure TMainf.show_areaToDevExecute(Sender: TObject);
begin
  ShowWindows(Sender, PageControlBottom, FDlg_AreaToDev, alLeft);
end;

procedure TMainf.fun_OrderVideoExecute(Sender: TObject);
var
  dlg: TfrmSelOrderVideoChannel;
  frmShowVideo: TfrmShowVideo;
  playerChannelId: Integer;//dll中播放器通道号
  channelId: Integer;//1-4通道号
  orderDuration: Integer;//点播时长 单位秒
begin
  if GCurSelectDev = nil then
  begin
    MessageBox(Handle, '请选中需要点播视频的车辆', '提示', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  
  //获取播放器未用播放通道号
  playerChannelId := GetDisUseChannelId;
  if playerChannelId < 0 then
  begin
    MessageBox(Handle, '超出最大播放窗口数，如需点播，请先关闭一个点播窗口', '提示', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;  

  dlg := TfrmSelOrderVideoChannel.Create(nil);
  try
    if dlg.ShowModal = mrOk then
    begin
      channelId := dlg.FSelChannelId;
      orderDuration := StrToInt(Trim(dlg.edtOrderDuration.Text));
      if GetFrmShowVideo(GCurSelectDev.id, channelId) <> nil then
      begin
        MessageBox(Handle, '同一车辆不能点播相同通道视频数据，请确认', '提示', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;

      frmShowVideo := GetNewFrmShowVideo(GCurSelectDev, playerChannelId, channelId);

      //Udp2VideoServer.SendOrderVideo(GCurSelectDev, channelId, 0, orderDuration * 60);
      frmShowVideo.Show;
      VideoChannelUseAry[playerChannelId - 1] := True;
    end;

  finally
    dlg.Free;
  end;
end;

function TMainf.GetDisUseChannelId: Integer;
Var
  i: Integer;
begin
  Result := -1;
  for i := 0 to Length(VideoChannelUseAry) - 1 do
  begin
    if not VideoChannelUseAry[i] then
    begin
      Result := i + 1;
      Break;
    end;
  end;
end;

function TMainf.GetFrmShowVideo(devId: string; channelId: Integer): TfrmShowVideo;
var
  i: Integer;
begin
  Result := nil;
  i := FFrmShowVideoList.IndexOf(devId + '_' + IntToStr(channelId));
  if i >= 0 then
    Result := TfrmShowVideo(FFrmShowVideoList.Objects[i]);
end;

function TMainf.GetNewFrmShowVideo(dev: TDevice; playerChannelId,
  channelId: Integer): TfrmShowVideo;
begin
  Result := TfrmShowVideo.Create(nil);
  Result.FSelDev := dev;
  Result.FChannelId := channelId;
  Result.FPlayerChannelId := playerChannelId;
  FFrmShowVideoList.AddObject(dev.id + '_' + IntToStr(channelId), Result);
end;

procedure TMainf.addLog(log: string);
begin
  uGloabVar.SystemLog.AddLog(FormatDateTime('hh:nn:ss.zzz', Now) + ' ' + log);
end;

procedure TMainf.LoadNotice;
begin
  if FIsNoticeLoaded and not FIsNoticeShown then
  begin
    FIsNoticeShown := True;
    if FNoticeManage.Count > 0 then
    begin
      frmNotice := TfrmNotice.Create(nil);
      frmNotice.initNotices;
      frmNotice.Left := Self.Width - frmNotice.Width - 15;
      frmNotice.Top := Self.Height - frmNotice.Height - 10;
      frmNotice.Show;
    end;
  end;
end;

procedure TMainf.DoOnNoticeLoaded;
var
  frmNotice: TfrmNotice;
begin
  FIsNoticeLoaded := True;
end;

procedure TMainf.ck_noticeExecute(Sender: TObject);
begin
  if FDlg_QueryNotice = nil then
    FDlg_QueryNotice := TfrmQueryNotice.Create(self);
  ShowQueryForm(PageControl_Center, FDlg_QueryNotice, TfrmQueryNotice, alLeft);
end;

procedure TMainf.sys_feedbackExecute(Sender: TObject);
var
  frmFeedback: TfrmFeedback;
begin
  frmFeedback := TfrmFeedback.Create(nil);
  frmFeedback.Show;
end;

procedure TMainf.getNotices;
var
  queryNotice: TQueryNotices;
begin
  queryNotice := TQueryNotices.Create;
  queryNotice.OnQueryCarAndDevInfo := DoOnNoticeLoaded;
end;

procedure TMainf.Ck_QueryDevRunStateOnTheTimeExecute(Sender: TObject);
begin
//查询某时间点的车辆运行状态
  try
    if FDlg_QueryDevRunStateOnTheTime= nil then
      FDlg_QueryDevRunStateOnTheTime := TQueryDevRunStateOnTheTimeFrm.Create(self);
    ShowQueryForm(PageControl_Center, FDlg_QueryDevRunStateOnTheTime, TQueryDevRunStateOnTheTimeFrm, alLeft);
  finally
  end;
end;

function TMainf.CheckOtherFormIsQuerying: Boolean;
begin
  Result := False;
  if (FDlg_QueryDevRunStateOnTheTime <> nil) and (FDlg_QueryDevRunStateOnTheTime.IsProgressDlgVisible) then
  begin
    MessageBox(Handle, '查询某时间点车辆的运行状态界面中正在查询数据，请稍后关闭', '提示', MB_OK + MB_ICONWARNING);
    Result := True;
  end;  
end;
//从轨迹回放中，查看列表
function TMainf.ShowList_HisAddr():TFrmHisListAddr;
begin
  try
    if FDlg_ShowList_HisAddr = nil then
      FDlg_ShowList_HisAddr := TFrmHisListAddr.Create(self);
  finally
  end;
  ShowQueryForm(PageControl_Center, FDlg_ShowList_HisAddr, TFrmHisListAddr, alLeft);
  FDlg_ShowList_HisAddr.EditHisDisplayCarNo.Text := FDlg_HisForm.EditHisDisplayCarNo.Text;
  FDlg_ShowList_HisAddr.EditFromTime.Text := FDlg_HisForm.EditFromTime.Text;
  FDlg_ShowList_HisAddr.EditToTime.Text := FDlg_HisForm.EditToTime.Text;
  Result := FDlg_ShowList_HisAddr;
end;

procedure TMainf.ShowHisAddrList_ToFront;
begin
  ShowQueryForm(PageControl_Center, FDlg_ShowList_HisAddr, TFrmHisListAddr, alLeft);
end;

procedure TMainf.ck_queryPhotoPosExecute(Sender: TObject);
begin
  if FDlg_QueryPhotoPos = nil then
    FDlg_QueryPhotoPos := TfrmQueryPhotoPos.Create(self);
  ShowQueryForm(PageControl_Center, FDlg_QueryPhotoPos, TfrmQueryPhotoPos, alLeft);
end;

procedure TMainf.showTipFrm(dev: TDevice);
Var
  dlg: TTipFrmOnMap;
  ms : TMemoryStream;
  jpegfile : TJPEGImage;
begin
  if dev = nil then
    Exit;
     
  dlg := TTipFrmOnMap.Create(nil);
  try
    if Length(dev.LastFatigueAlarmPicData) > 0 then
    begin
      ms := TMemoryStream.Create;
      jpegfile := TJPEGImage.Create;
      try
        try
          ms.Write(dev.LastFatigueAlarmPicData[0],length(dev.LastFatigueAlarmPicData));
          ms.Position := 0;
          jpegfile.LoadFromStream(ms);
          dlg.Image1.Picture.Graphic := jpegfile;
        except
          dlg.Image1.Picture.Bitmap.FreeImage;
        end;
      finally
        ms.free;
        jpegfile.Free;
      end;
      dlg.lblAlarmTime.Caption := '' + dev.LastFatigueAlarmGpsTime;
      dlg.lblAlarmSpeed.Caption := '速度:' + FormatFloat('0.#', dev.LastFatigueAlarmSpeed) + 'km/h';
      if dev.LastPicType <> 4 then
      begin
        dlg.lblAlarmTime.Font.Color := clGreen;
        dlg.lblAlarmSpeed.Font.Color := clGreen;
      end;  
    end
    else
    begin
      dlg.lblAlarmTime.Caption := '';
      dlg.lblAlarmSpeed.Caption := '';
          
      if not dev.IsLastPicSet then
      begin
        TQueryDevLastPic.Create(dev);
        dlg.FDev := dev;
        dlg.FIsWaitingPic := True;
      end
      else
      begin
        dlg.setNoPic;
      end;  
    end;

    dlg.lblCarNo.Caption := ' 车　牌　号：' + dev.Car.No;
    dlg.lblSim.Caption := ' ＳＩＭ卡号：' + dev.SimNo;
    if (dev.Login_DriverName <> '') then
      dlg.lblDriver.Caption := ' 司　　　机：' + dev.Login_DriverName
    else
      dlg.lblDriver.Caption := ' 司　　　机：未登录';
    dlg.lblSpeed.Caption := ' 速　　　度：' + FormatFloat('0.#', dev.Speed/10.0) + 'km/h';
    dlg.lblGpsTime.Caption := ' ＧＰＳ时间：' + FormatDateTime('yyyy-MM-dd hh:nn:ss', dev.GpsTime);
    dlg.lblDir.Caption := ' 方　　　向：' + getCarAngle(dev.Orientation);    
    
    dlg.Left := FCurrMouseX - dlg.Width div 2;
    dlg.Top := FCurrMouseY - dlg.Height - 5;
    if dlg.Left < 0 then
      dlg.Left := 0;
    if dlg.Left + dlg.Width > Screen.Width then
      dlg.Left := Screen.Width - dlg.Width;
    if dlg.Top < 0 then
      dlg.Top := 0;
    if dlg.Top + dlg.Height > Screen.Height then
      dlg.Top := Screen.Height - dlg.Height;
    dlg.show;
    //dlg.ShowModal;
  finally
    //dlg.Free;
  end;
end;

procedure TMainf.setMouseCurrXY(pt: TPoint);
begin
  FCurrMouseX := pt.X;
  FCurrMouseY := pt.Y;
end;

procedure TMainf.fun_photo_fatigueExecute(Sender: TObject);
var
  dev: TDevice;
  CameraIndex: Byte; //摄像头号
  CameraCmd: Word;  // 拍照命令
  PZSJJG: Word;   // 拍照时间间隔
  SaveSign: Byte; // 保存标志
  GetPicSize: Byte; //照片尺寸大小 0=320x240  1=640x480  2-else
  TXZL: Byte; // 图像质量
  LD: Byte;   // 亮度
  DBD: Byte;  // 对比度
  BHD: Byte;  // 饱和度
  SD: Byte;
begin
  dev := GCurSelectDev;
  if dev = nil then
    Exit;
  CameraIndex := 7;
  CameraCmd := 0;
  PZSJJG := 0;
  SaveSign := 0;
  GetPicSize := 0;
  TXZL := 0;
  LD := 0;
  DBD := 0;
  BHD := 0;
  SD := 0;
  DataServer.GetAPicture(dev, CameraIndex, CameraCmd, PZSJJG, SaveSign, GetPicSize, TXZL, LD, DBD, BHD, SD);
end;

procedure TMainf.DoOnDevFatigueAlarm(dev: TDevice);
begin
  //刷新地图上的颜色
  FDlg_BSMap.refreshADev(dev);
  //弹窗提示
  if dev.IsFatigueAlarm then
  begin
    PopMsg('疲劳报警', dev.Car.No + #13#10'发生疲劳报警');
    if (GlobalParam.AlarmSound_Fatigue <> '') then
    begin
      PlaySound(pchar(GlobalParam.AlarmSound_Fatigue),Hinstance,SND_ASYNC);
    end;  
  end;
end;

{ TShowHisThread }

constructor TShowHisThread.Create(dev: TDevice; sTime, eTime: TDateTime;
  dlgRefreshProgress: TFrmRefreshProgress; dlgHis: TFormHisMain);
begin
  inherited Create(False);
  FDev := dev;
  FStartDateTime := sTime;
  FEndDateTime := eTime;
  FDlg_RefreshProgress := dlgRefreshProgress;
  FDlg_His := dlgHis;
  FreeOnTerminate := True;
end;

destructor TShowHisThread.Destroy;
begin
  inherited;
end;

procedure TShowHisThread.Execute;
var
  car: TCar;
  i: integer;
begin
  try
    try
      FDlg_RefreshProgress.Label1.Caption := '载入GPS定位数据...';
      FDlg_RefreshProgress.Show;
      PlayDev.Id := FDev.Id;
      PlayDev.IdStr := FDev.IdStr;
      PlayDev.fact_id := FDev.fact_id;
      PlayDev.GroupID := FDev.GroupID;
      PlayDev.DispLabel := FDev.DispLabel;
      PlayDev.SimNo := FDev.SimNo;
      PlayDev.DriverNameTeL := FDev.DriverNameTeL;

      //让轨迹回放可以实现区域报警
      playDev.AreaList.Clear;
      for i := 0 to FDev.AreaList.Count - 1 do
      begin
        playDev.AreaList.Add(FDev.AreaList.Items[i]);
      end;

      PlayDev.Car.Id := FDev.Car.Id;
      PlayDev.Car.No := FDev.Car.No;
      Synchronize(getHis);
    except
      on E: Exception do
      begin

      end;
    end;
  finally
    FDlg_RefreshProgress.Free;
  end;
end;

procedure TShowHisThread.getHis;
begin
  FDlg_His.PlayDevChanged;
  FDlg_RefreshProgress.Gauge1.AddProgress(2);
  FDlg_His.PlayFromServer(playDev.Id, FStartDateTime, FEndDateTime);
  FDlg_His.EditFromTime.Text := FormatDatetime('yyyy-mm-dd hh:nn:ss', FStartDateTime);
  FDlg_His.EditToTime.Text := FormatDatetime('yyyy-mm-dd hh:nn:ss', FEndDateTime);

  FDlg_RefreshProgress.Gauge1.AddProgress(2);
  FDlg_His.load_PlayInfo(FStartDateTime, FEndDateTime, '服务器数据');
  FDlg_RefreshProgress.Gauge1.AddProgress(2);
  FDlg_His.LoadAllGpsData(FDlg_RefreshProgress);
  FDlg_RefreshProgress.Gauge1.AddProgress(2);

  FDlg_His.play_start.Execute;
  GCurSelectDev := PlayDev;
end;

procedure TMainf.sys_refreshExecute(Sender: TObject);
  procedure clearGroupListAndDevlist();
  begin//所有表格或者列表中添加了本次刷新中清除的对象，需要一同将这些表格或者列表清空
    TreeView2.Items.Clear;
    if FDlg_Watch_Car <> nil then
      FDlg_Watch_Car.cxDeviceList.Clear;

    if FDlg_BSMap <> nil then
      FDlg_BSMap.clearAll;
    if FDlg_AlarmCar <> nil then
    begin
      FDlg_AlarmCar.cxTreeList4.Clear;
      FDlg_AlarmCar.cxAlarmList.Clear;
      FDlg_AlarmCar.cxStopAlarmList.Clear;
    end;

    if FDlg_QueryPictureListFrm <> nil then
      FDlg_QueryPictureListFrm.cxTreeList1.Clear;

    if FDlg_QueryUpdateRecord <> nil then
      FDlg_QueryUpdateRecord.cxOtherCarList.Clear;

    if FDlg_RevGovInfo <> nil then
      FDlg_RevGovInfo.cxGovCarTreeList.Clear;
  end;
var
  dlg: TFrmRefreshProgress;
begin
  dlg := TFrmRefreshProgress.Create(Self);
  try
    dlg.Show;
    dlg.Caption := '刷新基础数据';
    dlg.SetProgressTip('清除基础数据中...');
    DataServer.Active := False;
    TimerCheckUpdate.Enabled := False;
    Timer1.Enabled := False;
    Timer.Enabled := False;
    timerScrollAlarm.Enabled := False;

    clearGroupListAndDevlist;
    ADeviceManage.ClearDevice;
    ADeviceManage.ClearUserSelectList;
    ADeviceManage.ClearCurrentDevOnTheMap;
    ADevGroupManage.Clear;
    ACarManage.ClearCar;
    dlg.AddProgress(10);

    dlg.SetProgressTip('加载车组信息...');
    bs.DevGroupinfo(ADevGroupManage); //------ 打开组管理
    if ADevGroupManage.Count = 0 then
    begin
      dlg.Hide;
      messagebox(handle, '对不起，当前用户没有查看任何车组的权限！' + #13 + #13 +
        '请您与系统管理员联系，到【系统管理客户端】为当前用户分配组！', '提示', mb_ok + mb_iconinformation);
      Application.Terminate;
      exit;
    end;
    dlg.AddProgress(25);

    dlg.SetProgressTip('加载车辆、设备信息...');
    Bs.QueryDevCarInfo(ACarManage, ADeviceManage);//Bs.CarInfo(ACarManage);
    dlg.AddProgress(35);

    dlg.SetProgressTip('加载司机信息...');
    TQueryDriver.Create(ADeviceManage, ADriverManage, nil);
    dlg.addProgress(20);

    dlg.SetProgressTip('重新初始化基础数据...');
    dlg.addProgress(10);
    List_TreeGroup;
    Sleep(1000);
  finally
    dlg.Free;
    TimerCheckUpdate.Enabled := True;
    Timer1.Enabled := True;
    Timer.Enabled := True;
    timerScrollAlarm.Enabled := True;
    DataServer.Active := True;
  end;
end;

procedure TMainf.ck_queryDevMileageExecute(Sender: TObject);
begin
  if FDlg_QueryDevUploadMileage = nil then
    FDlg_QueryDevUploadMileage := TfrmQueryDevUploadMileage.Create(self);
  ShowQueryForm(PageControl_Center, FDlg_QueryDevUploadMileage, TfrmQueryDevUploadMileage, alLeft);
end;

{ TGetHisThread }

constructor TGetHisThread.Create(devId: string; sTime, eTime: TDateTime);
begin
  inherited Create(False);

  FDevId := devId;
  FSTime := sTime;
  FETime := eTime;
  FTemp := TClientDataSet.Create(nil);
  FreeOnTerminate := True;
  FIsStopped := True;
end;

destructor TGetHisThread.Destroy;
begin
  FTemp.Free;
  inherited;
end;

procedure TGetHisThread.Execute;
var
  tmpETime: TDateTime;
begin
  while not Terminated do
  begin
    while not FIsStopped and not FIsStopStatusSetTrue and (FSTime < FETime)do
    begin
      querySTime := FSTime;
      //每3小时查询一次
      tmpETime := IncSecond(IncHour(FSTime, 3), -1);
      if tmpETime < FETime then
      begin
        queryETime := tmpETime;
      end
      else
      begin
        queryETime := FETime;
      end;
      FSTime := IncSecond(queryETime, 1);
      queryHis;
    end;
    if FIsStopStatusSetTrue then
    begin
      FIsStopStatusSetTrue := False;
    end;  
    if not Terminated then
      Sleep(500);
  end;
end;

procedure TGetHisThread.queryHis;
var
  currCount: Integer;
begin
  CoInitialize(nil);
  try
    currCount := Bs.QueryHistoryCount(FDevId, 0, querySTime, queryETime);

    if not FIsStopped and not FIsStopStatusSetTrue and (currCount > 0) then
    begin
      FTemp.XMLData := BS.QueryHistoryDataRetrunDelphiXml(FDevId, 0, querySTime,queryETime, currCount, 1);
      if not FIsStopped and not FIsStopStatusSetTrue and (FTemp.XMLData <> '') then
      begin
        Synchronize(setTrackPlayData);
      end;
    end;
  finally
    CoUninitialize();
  end;
end;

procedure TGetHisThread.SetOnAddGpsData(
  const Value: TOnAddGpsData);
begin
  FOnAddGpsData := Value;
end;

procedure TGetHisThread.SetStopped(const Value: Boolean);
begin
  FIsStopped := Value;
  if FIsStopped then
    FIsStopStatusSetTrue := True;
end;

procedure TGetHisThread.setTrackPlayData;
var
  i: Integer;
  gpsData: TQueryHistoryGpsData_V3;
begin
  try
    try
      FTemp.Open;
      FTemp.First;
      for i := 0 to FTemp.RecordCount - 1 do
      begin
        gpsData.WarningSign :=  StringToLongWord(FTemp.FieldByName('ALARMFLAG').AsString);// StringToLongWord(Trim(node.ChildNodes['ALARMFLAG'].Text));
        gpsData.State := StringToLongWord(FTemp.FieldByName('STATE').AsString); //StringToLongWord(Trim(node.ChildNodes['STATE'].Text));
        gpsData.Latitude := FTemp.FieldByName('LATITUDE').AsFloat; //StringToFloat(Trim(node.ChildNodes['LATITUDE'].Text));
        gpsData.Longitude := FTemp.FieldByName('LONGITUDE').AsFloat; //StringToFloat(Trim(node.ChildNodes['LONGITUDE'].Text));
        gpsData.Speed := FTemp.FieldByName('SPEED').AsInteger; //StringToInteger(Trim(node.ChildNodes['SPEED'].Text));
        gpsData.Orientation := FTemp.FieldByName('ORIENTATION').AsInteger; //StringToInteger(Trim(node.ChildNodes['ORIENTATION'].Text));
        gpsData.GpsTime := FTemp.FieldByName('GPSTIME').AsDateTime; //StrToDateTime(copy(Trim(node.ChildNodes['GPSTIME'].Text),1,10) + ' '+
        gpsData.ServerTime := FTemp.FieldByName('STIME').AsDateTime;  //StrToDateTime(copy(Trim(node.ChildNodes['STIME'].Text),1,10) + ' '+
        if not FIsStopped and not FIsStopStatusSetTrue and Assigned(FOnAddGpsData) then
          FOnAddGpsData(gpsData);
        FTemp.Next;
      end;
    except

    end;
  finally
    FTEmp.Close;
  end;
end;

procedure TMainf.stopGetHisThread;
begin
  try
    if Assigned(qHisThread) then
    begin
      qHisThread.IsStopped := True;
    end;
  except
  end;
end;

procedure TMainf.terminateGetHisThread;
begin
  try
    if Assigned(qHisThread) then
    begin
      qHisThread.IsStopped := True;
      qHisThread.Terminate;
//      qHisThread.WaitFor;
//      FreeAndNil(qHisThread);
    end;
  except
  end;
end;

procedure TMainf.ck_querySetCarRunStatePlanExecute(Sender: TObject);
begin
  if FDlg_QuerySetCarRunStatePlan = nil then
    FDlg_QuerySetCarRunStatePlan := TfrmQuerySetCarRunState.Create(self);
  ShowQueryForm(PageControl_Center, FDlg_QuerySetCarRunStatePlan, TfrmQuerySetCarRunState, alLeft);
end;

procedure TMainf.fun_setCarRunStatePlanExecute(Sender: TObject);
var
  dlg: TfrmSetCarRunStataePlan;
begin
  if GCurSelectDev <> nil then
  begin
    dlg := TfrmSetCarRunStataePlan.Create(nil);
    try
      dlg.FCurrDevId := GCurSelectDev.IdStr;
      dlg.edtCarNo.Text := GCurSelectDev.Car.No;
      dlg.ShowModal;
    finally
      dlg.Free;
    end;
  end;
end;

procedure TMainf.fun_upgradeterminalExecute(Sender: TObject);
var
  dlg: TfrmUpgradeTerminal;
begin
  if GCurSelectDev <> nil then
  begin
    if not IsBeiDouDev(GCurSelectDev) then
    begin
      showTipMsgBox('该命令只能对北斗类型的终端下发');
      Exit;
    end;
    Bs.QueryUpgradeTerminalVer;
    dlg := TfrmUpgradeTerminal.Create(nil);
    try
      dlg.addADev(GCurSelectDev);
      dlg.ShowModal;
    finally
      dlg.Free;
    end;
  end;
end;

end.



