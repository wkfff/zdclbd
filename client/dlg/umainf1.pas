unit umainf;
{ ������
  @author()
  @created(2004-03-)

  @lastmod(GMT:$Date: 2012/10/29 01:46:42 $) <BR>
  ��������:$Author: wfp $  <BR>
  ��ǰ�汾:$Revision: 1.1.1.1 $  <BR>}
  
  //�ڲ˵�project-options�У�Directories/conditionalsҳ ForTestUser
  //ForTestUser Ϊ�����û�  :���û��ṩ�����ţ����ҳ�ȡע���
  //ForAddEKey  Ϊ���ܹ�
  //ForDevLimit Ϊ�鿴�豸������
  //ForOnlySMS  Ϊ����ֻ�Ӷ���Ϣ��������������GPRSʱ��
  //For_HeartToGateway  Ϊ����֮���������.
  //           ֻ��ʹ�ú���������ѷ��������б���ȥ������ظ�ʱ�估״̬(�����޳�ʱ)
  //For_ConfineArea �������޶��������� ��������Χ��
  //For_HeartToGateway ���20��(��)�ղ�����������,��һ����������������������5���ղ������ݣ���Ͽ�����������
  //For_MistySearchCarNo  ģ�����ҳ��ƺ�  20060830
  //2006-10-24 ��ӿ��Ե���˾��,������Ϣ,������Ϣ,������Ϣ
  //    ѡ�������԰��豸��������.
  //  ���س���.ֻ��ʾĳ�鳵��.
  //2006-10-25-------------------------
  //1.�޸ı������ؿ�������
  //2.��ӿ�ѡ����A.ʹ�üƼ��� B.ʹ��˾���� C.��ʾ�Ƽ�������
  //3.��ȡ˾����Ϣ
  //2006-11-01 �޸��˵�ͼ����һЩBUG,������޸Ľ������
  //2006-11-29 ��Config.ini�ļ�[SYS]�����VersionFor='ZB' ������б���������,IC������.  �����ȡ�������Ĳ˵���������
  //2006-12-20 ����������պ��� ;��Config.ini�ļ������AppName�������ó����������
  //2006-12-21 for JT �����,�س��ڵ�ͼ��ʾΪ��ɫ
  //2006-12-25 �޸Ķ��Ƽ���ʱ��BUG
  //2007-01-05 ��ӹ̶�·�߹���,�����һ���������ڶ��������.��ǰ�汾һ����ֻ����ĳһ��ͬ��������,�޸��˵�ͼ�л�ʱBUG
  //2007-05-12 �޸�,������ص�����,���еĳ���������.
  //2007-05-14 ������ճ�����Ƭ���ж�,����ȡ�����һ�ε�INDEX��ͬ����Ƭ.
  //2007-05-18 ����Զ�����
  //2007-05-25 �����ǿ����ʾNAME�ֶ�����.
  //2007-06    ���˾���ϴ��̶��˵���������ʾ(��ͷҪ��)
  //2007-06    ������򱨾���ʾ˾��  (������Ҫ��)
  //2007-06-21 ����˵�ͼ��������,�ֶ��ƶ��ͷŴ��ͼ�����Զ��л���ͼ.
  //VERSION='     V1.02.02';
  //2007-07-09 ��ӹ��ֿ��ԷŴ����С��ͼ.
  //           ��ӷ��͵�����Ϣ����ͨ��Message.txt���Ĭ�ϳ�����.
  //           �����ӵ绰�����ּ���ȥ��.
  //2007-07-20 ��ͼ�ֶ��϶�ʱ,һ����һ�߿ɰѱ�ע��ʾ����.
  //           ��������ʱ,��һ���ֶ�����","��ʱ,����ִ�λ.�ѽ��.
  //2007-07-21 �϶���ʱ�������ʾ��ע,�϶���ʱ��Ҳ������ʾ��.
  //           ȡ����ȫ�����ƺ�
  //2007-07-22 ��ĳһ��ͼ�㻭����ʱ,��ͼ�㽫·������.        
  //2007-07-25 �������Ƶ�ͼ���ϳ�ȥ�Ŀ���.���˺öຯ�����쳣����ͼ�¼�쳣.
  //VERSION='     V1.02.03';
  //2007-07-27 ���������г����߱���
  //2007-07-31 �ѹ켣�ط������ĺ���һ����.
  //2007-08-03 �����˶ϵ籨��
  //2007-08-06 ������ͼƬ���ļ�����,�˹����ǰ�ͷ���.Ϊ�������ͼƬ���û��ṩ�ű�.
  //2007-08-06 �޸���,�����ǰ·�����޸ĺ�,����ʱ���е��ļ���ȫ�Ǵ�������.
  //VERSION='     V1.02.04';
  //2007-08-07 �޸��ڻطŵ�ʱ��,ѡ���ĳ�ʱ,��ʾ�����е�����.Ҫ
  //VERSION='     V1.02.05';
  //2007-08-24 Ϊ������ӹ��
  //2007-08-24 �޸��˹켣�ط�,���������ʱ���ն�����.
  //VERSION='     V1.02.06';
  //�޸ĵ�ͼ�Ͳ�,����ǰ�Ľṹ������ָ��.
  //�޸�����ʾ��ע,���ĸ�����̬��ʾ,�����������ʾ��ע������.
  //�޸��ƶ�ʱ,����50�����ͼ,���϶�ʱ���ػ�.���ſ�����,����ʾ.
  //VERSION='     V1.02.07';
  //�޸ĵ�ͼ��·���Ը���·������ʾ
  //�޸�������һЩ��ʾBUG
  //VERSION='     V1.02.08';
  //�޸�·�ı�עһЩ����,������·�ı�ע�ĳ�����
  //�޸��߶���ʾ��BUG
  //�޸�˾����ʾ,��ʾ����������޸�.
  //�޸��ٶȱ���BUG
  //VERSION='     V1.02.09';
  //�ѻ�ͼ԰�ͱ�ǩ�ֿ���.����,��ǩ�Ͳ�����ʾ��������.
  //VERSION='     V1.02.10';
  //����켣BUG,���ܼ��������.
  //�޸ľ���������.
  //VERSION='     V1.02.11';
  //�����û�����ñ�������ʱ,���������� ����,��Ϊ,�������ĳ�����ʱ,���ӿ��ܷ�Ӧ������.
  //VERSION='     V1.02.12
  //������Χ������һ����Чʱ��.
  //��ӻ�����������ٶȱ����ɲ����¼.
  //�ϴ��ٶ���������.
  //VERSION='     V1.02.13
  //�޸ĵ���Χ����BUG
  //VERSION='     V1.02.14
  //�޸Ĳ�����ƬBUG
  //VERSION='     V1.02.15
  //�޸ķ��͹��BUG
  //VERSION='     V1.02.16
  //�������ͨ������,Щ����Ҫ�����µĵ绰����������Ч.
  //�޸ĵ�ͼText������ʾBUG
  //VERSION='     V1.02.17
  //������͵���Ϣ��������.
  //VERSION='     V1.02.19
  //�������鳵����.
  //VERSION='     V1.02.19
  //�޸�����鳵


  
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ComCtrls, Menus, ExtCtrls, ToolWin, BusinessServerUnit, Buttons,
  AppEvnts, ActnList, ImgList, se_controls, ksskinstatusbar, Grids,  ValEdit,
  StdCtrls,  types, DB, DBClient, MConnect, SConnect, xmldom, XMLIntf, msxmldom,
  XMLDoc,  ShellAPI, MMSystem,
  GpsLibUnit, emapker,  MapControlUnit, emapctrl, MetaDefine,  mapplatform,
  mapoutlook,  CarUnit,ConstDefineUnit,
  uflash_jk,uWatch_Car,USended_Cmd,uReceived_info, udata_display,
  usended_message , geome,
  cxGraphics, cxCustomData,cxStyles, cxTL, cxTextEdit, cxInplaceContainer,
  cxControls, cxCheckBox, cxCalendar,
  uConfineAreaListFrm,
  uFrmAlarmCar ,
  uFrmSearchAddressInMap,
  ParamFrmUnit,ParamAllFrmUnit,
  LCDMenuFrmUnit,
  OrderListFrmUnit,
  Sherryhint,StructDefUnit,
  SystemLog, XPMenu, MSNPopUp, cxSplitter,cxColorComboBox,MapManagerUnit,
  Gauges,StrUtils,
  ConfineAreaUnit,
  FormHisMainUnit,
  MapShowUnit,
  PictureFrmUnit,
  IniFiles,
  Printers,taxiRunDataFrmUnit
  {$ifdef ForTestUser},Registry, cxMaskEdit
  {$endif};
const
  VERSION='     V1.02.20';

type
  TEarthRect= Record
     SX:double;     //SXΪ��ʼX��(Strat) ,EXΪ����X��(end).
     SY:double;
     EX:double;     //SYΪ��ʼY��(Strat) ,EYΪY������(End)
     EY:double;
     isCanUse: boolean;
  end;
type
  CMap = class(TGpsMap);
  TMainf = class(TForm)
    CoolBar1: TCoolBar;
    Panel_Clxx: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    ToolBar2: TToolBar;
    ToolButton16: TToolButton;
    ImageList2: TImageList;
    ToolButton18: TToolButton;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    ToolButton25: TToolButton;
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
    N43: TMenuItem;
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
    N72: TMenuItem;
    N75: TMenuItem;
    N76: TMenuItem;
    N77: TMenuItem;
    N79: TMenuItem;
    N80: TMenuItem;
    N81: TMenuItem;
    N82: TMenuItem;
    N83: TMenuItem;
    fun_watch_cancel: TAction;
    ToolButton7: TToolButton;
    Panel8: TPanel;
    tool_locate: TAction;
    tool_distance: TAction;
    PopupMenu_funDev: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    fun_callDev: TAction;
    N8: TMenuItem;
    sys_lock: TAction;
    sys_off: TAction;
    syslock1: TMenuItem;
    N5: TMenuItem;
    fun_view_SwitchStat: TAction;
    N6: TMenuItem;
    N7: TMenuItem;
    ToolButton15: TToolButton;
    ToolButton26: TToolButton;
    ImageList1: TImageList;
    show_sended_command: TAction;
    N12: TMenuItem;
    N13: TMenuItem;
    fun_view_DevParam: TAction;
    N19: TMenuItem;
    ToolButton17: TToolButton;
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
    N39: TMenuItem;
    StatusBar1: TSeSkinStatusBar;
    help_skin1: TAction;
    help_skin2: TAction;
    help_skin3: TAction;
    help_skin4: TAction;
    N40: TMenuItem;
    N41: TMenuItem;
    N44: TMenuItem;
    N50: TMenuItem;
    N60: TMenuItem;
    XP1: TMenuItem;
    N84: TMenuItem;
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
    ToolButton27: TToolButton;
    ToolButton31: TToolButton;
    N10: TMenuItem;
    N11: TMenuItem;
    fun_refresh_a_dev: TAction;
    fun_refresh_all_dev: TAction;
    ToolButton32: TToolButton;
    ToolButton33: TToolButton;
    N88: TMenuItem;
    fun_Control_Swith: TAction;
    N89: TMenuItem;
    N91: TMenuItem;
    fun_Locate_Car: TAction;
    ToolButton30: TToolButton;
    N92: TMenuItem;
    N93: TMenuItem;
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
    N68: TMenuItem;
    PopupMenu_Alarm: TPopupMenu;
    N69: TMenuItem;
    stop_Alarm: TAction;
    N70: TMenuItem;
    show_AlarmStop: TAction;
    showAlarmStop1: TMenuItem;
    fun_Devs_SetParam: TAction;
    tool_RectSelect: TAction;
    N74: TMenuItem;
    N105: TMenuItem;
    ck_car: TAction;
    N107: TMenuItem;
    N78: TMenuItem;
    N109: TMenuItem;
    N110: TMenuItem;
    N111: TMenuItem;
    ListDevice: TValueListEditor;
    Splitter_DevSwitch: TSplitter;
    PopupMenu_DevGroup: TPopupMenu;
    fun_Devs_CallDev: TAction;
    fun_Devs_SendControlInfo: TAction;
    fun_SendToDTEs: TAction;
    N112: TMenuItem;
    N113: TMenuItem;
    N114: TMenuItem;
    N115: TMenuItem;
    N71: TMenuItem;
    N116: TMenuItem;
    N117: TMenuItem;
    N118: TMenuItem;
    N119: TMenuItem;
    N120: TMenuItem;
    ToolBar3: TToolBar;
    Label1: TLabel;
    Edit1: TEdit;
    ToolButton36: TToolButton;
    Edit2: TEdit;
    show_MapToolbar: TAction;
    N104: TMenuItem;
    tool_SetConfineAlarmArea: TAction;
    Action11: TMenuItem;
    ListSelectDev: TcxTreeList;
    ListSelectDev_CarNo: TcxTreeListColumn;
    ListSelectDev_DevId: TcxTreeListColumn;
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
    N126: TMenuItem;
    NLCDMenu: TMenuItem;
    fun_SetDevTelList: TAction;
    fun_SendControlInfo: TAction;
    fun_SendControlInfo_NeedAnswer: TAction;
    fun_PursueDev: TAction;
    N128: TMenuItem;
    N129: TMenuItem;
    N130: TMenuItem;
    fun_ModifyDisplayName: TAction;
    N1: TMenuItem;
    N9: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    fun_ModifyLCDMenu: TAction;
    N73: TMenuItem;
    N90: TMenuItem;
    N101: TMenuItem;
    fun_Devs_SendControlInfo_NeedAnswer: TAction;
    fun_UpdateDevFirmWare: TAction;
    N102: TMenuItem;
    N103: TMenuItem;
    fun_Devs_SetDevTelList: TAction;
    fun_Devs_PursueDev: TAction;
    fun_Devs_ModifyLCDMenu: TAction;
    fun_Devs_ModifyDisplayName: TAction;
    fun_Devs_UpdateFirmWare: TAction;
    N106: TMenuItem;
    N131: TMenuItem;
    N132: TMenuItem;
    N133: TMenuItem;
    N134: TMenuItem;
    N135: TMenuItem;
    ck_DriverInfo: TAction;
    ck_TaxiMetaInfo: TAction;
    ck_TaxiMetaRunData: TAction;
    N136: TMenuItem;
    N137: TMenuItem;
    N138: TMenuItem;
    N139: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N61: TMenuItem;
    N62: TMenuItem;
    ToolButton13: TToolButton;
    MSNPopUp1: TMSNPopUp;
    fun_TaxiMeterStopDateTime: TAction;
    fun_Devs_TaxiMeterStopDateTime: TAction;
    N108: TMenuItem;
    N125: TMenuItem;
    N140: TMenuItem;
    N141: TMenuItem;
    N142: TMenuItem;
    fun_SendOrder: TAction;
    N143: TMenuItem;
    Selected: TAction;
    N144: TMenuItem;
    N145: TMenuItem;
    fun_CancelOrderMenu: TAction;
    funCancelOrderMenu1: TMenuItem;
    N146: TMenuItem;
    fun_Devs_CancelOrderMenu: TAction;
    Action12: TMenuItem;
    N147: TMenuItem;
    N148: TMenuItem;
    N149: TMenuItem;
    N150: TMenuItem;
    N151: TMenuItem;
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
    N157: TMenuItem;
    N158: TMenuItem;
    N159: TMenuItem;
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
    N167: TMenuItem;
    ck_SendOrderList: TAction;
    N168: TMenuItem;
    N169: TMenuItem;
    N170: TMenuItem;
    N171: TMenuItem;
    N172: TMenuItem;
    N173: TMenuItem;
    N174: TMenuItem;
    N175: TMenuItem;
    N176: TMenuItem;
    N177: TMenuItem;
    N178: TMenuItem;
    Timer1: TTimer;
    N179: TMenuItem;
    N180: TMenuItem;
    SystemConfig: TAction;
    SystemConfig1: TMenuItem;
    fun_SwitchToMe: TAction;
    ToolButton38: TToolButton;
    ToolButton39: TToolButton;
    XPMenu1: TXPMenu;
    dddd1: TMenuItem;
    fun_TermToTouShu: TAction;
    fun_SetCutOilElec: TAction;
    N181: TMenuItem;
    N182: TMenuItem;
    N183: TMenuItem;
    N184: TMenuItem;
    fun_DevHide: TAction;
    N185: TMenuItem;
    N186: TMenuItem;
    fun_Devs_Show: TAction;
    N187: TMenuItem;
    N188: TMenuItem;
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
    N203: TMenuItem;
    N204: TMenuItem;
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
    PageControlBottom: TPageControl;
    PageControl_Center: TPageControl;
    ComboBoxCarNO: TComboBox;
    N208: TMenuItem;
    fun_ChangeMap: TAction;
    ToolButton1: TToolButton;
    show_fullScreen: TAction;
    BitBtnFullScreen: TBitBtn;
    N209: TMenuItem;
    N210: TMenuItem;
    ToolBarMenu: TToolBar;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem27: TMenuItem;
    MenuItem28: TMenuItem;
    MenuItem29: TMenuItem;
    MenuItem30: TMenuItem;
    MenuItem31: TMenuItem;
    MenuItem32: TMenuItem;
    MenuItem33: TMenuItem;
    MenuItem34: TMenuItem;
    MenuItem35: TMenuItem;
    MenuItem36: TMenuItem;
    MenuItem37: TMenuItem;
    MenuItem38: TMenuItem;
    MenuItem39: TMenuItem;
    MenuItem40: TMenuItem;
    MenuItem41: TMenuItem;
    MenuItem42: TMenuItem;
    MenuItem43: TMenuItem;
    MenuItem44: TMenuItem;
    MenuItem45: TMenuItem;
    MenuItem46: TMenuItem;
    MenuItem47: TMenuItem;
    MenuItem48: TMenuItem;
    MenuItem49: TMenuItem;
    MenuItem50: TMenuItem;
    MenuItem51: TMenuItem;
    MenuItem52: TMenuItem;
    MenuItem53: TMenuItem;
    MenuItem54: TMenuItem;
    MenuItem55: TMenuItem;
    MenuItem56: TMenuItem;
    MenuItem57: TMenuItem;
    MenuItem58: TMenuItem;
    MenuItem59: TMenuItem;
    MenuItem60: TMenuItem;
    MenuItem61: TMenuItem;
    MenuItem62: TMenuItem;
    MenuItem63: TMenuItem;
    MenuItem64: TMenuItem;
    MenuItem65: TMenuItem;
    MenuItem66: TMenuItem;
    MenuItem67: TMenuItem;
    MenuItem68: TMenuItem;
    MenuItem69: TMenuItem;
    MenuItem70: TMenuItem;
    MenuItem71: TMenuItem;
    MenuItem72: TMenuItem;
    MenuItem73: TMenuItem;
    MenuItem74: TMenuItem;
    MenuItem75: TMenuItem;
    MenuItem76: TMenuItem;
    MenuItem77: TMenuItem;
    MenuItem78: TMenuItem;
    MenuItem79: TMenuItem;
    MenuItem80: TMenuItem;
    MenuItem81: TMenuItem;
    MenuItem82: TMenuItem;
    MenuItem83: TMenuItem;
    MenuItem84: TMenuItem;
    MenuItem85: TMenuItem;
    MenuItem86: TMenuItem;
    MenuItem87: TMenuItem;
    MenuItem88: TMenuItem;
    MenuItem89: TMenuItem;
    MenuItem90: TMenuItem;
    MenuItem91: TMenuItem;
    MenuItem92: TMenuItem;
    MenuItem93: TMenuItem;
    MenuItem94: TMenuItem;
    MenuItem95: TMenuItem;
    MenuItem96: TMenuItem;
    MenuItem97: TMenuItem;
    MenuItem98: TMenuItem;
    MenuItem99: TMenuItem;
    MenuItem100: TMenuItem;
    MenuItem102: TMenuItem;
    MenuItem103: TMenuItem;
    MenuItem104: TMenuItem;
    MenuItem105: TMenuItem;
    MenuItem106: TMenuItem;
    MenuItem107: TMenuItem;
    MenuItem108: TMenuItem;
    MenuItem109: TMenuItem;
    MenuItem110: TMenuItem;
    MenuItem113: TMenuItem;
    N211: TMenuItem;
    fun_Devs_Hide: TAction;
    N212: TMenuItem;
    N213: TMenuItem;
    N214: TMenuItem;
    N215: TMenuItem;
    N216: TMenuItem;
    fun_Devs_Hide_All: TAction;
    fun_Devs_Show_All: TAction;
    N218: TMenuItem;
    fun_Devs_Show_Only: TAction;
    N217: TMenuItem;
    fun_ReadDriverInfo: TAction;
    N219: TMenuItem;
    N220: TMenuItem;
    N221: TMenuItem;
    N222: TMenuItem;
    ck_DriverOnOffDuty: TAction;
    N223: TMenuItem;
    Map_ChangeNodeName: TAction;
    N224: TMenuItem;
    fun_GetAPicture: TAction;
    fun_Devs_GetAPicture: TAction;
    tool_SetRunWay: TAction;
    N226: TMenuItem;
    N225: TMenuItem;
    N227: TMenuItem;
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
    N232: TMenuItem;
    fun_ReadGPRSFlux: TAction;
    funReadGPRSFlux1: TMenuItem;
    GPRS1: TMenuItem;
    GPRS2: TMenuItem;
    ToolButton2: TToolButton;
    TimerCall: TTimer;
    PanelShowMessage: TPanel;
    MemoGateWay: TMemo;
    MemoBs: TMemo;
    N233: TMenuItem;
    Set_HisTrack: TAction;
    N234: TMenuItem;
    N235: TMenuItem;
    N236: TMenuItem;
    N237: TMenuItem;
    ValueListEditorOnline: TValueListEditor;
    fun_SendAdInfo: TAction;
    funSendAdInfo1: TMenuItem;
    funSendAdInfo2: TMenuItem;
    fun_SendDelAdInfo: TAction;
    funSendDelAdInfo1: TMenuItem;
    N238: TMenuItem;
    N239: TMenuItem;
    N240: TMenuItem;
    fun_SendListenTEL: TAction;
    show_GPSHostory: TAction;
    N241: TMenuItem;
    ck_OverSpeedRecord: TAction;
    ck_StopRecord: TAction;
    N242: TMenuItem;
    N243: TMenuItem;
    N244: TMenuItem;
    N245: TMenuItem;
    N246: TMenuItem;
    N247: TMenuItem;
    N248: TMenuItem;
    fun_BrakeState: TAction;
    N249: TMenuItem;
    N250: TMenuItem;
    N251: TMenuItem;
    N252: TMenuItem;
    fun_CallDriver: TAction;
    N253: TMenuItem;
    tool_SetFactory: TAction;
    N254: TMenuItem;
    GPS1: TMenuItem;
    GPS2: TMenuItem;
    GPS3: TMenuItem;
    N255: TMenuItem;
    N256: TMenuItem;
    ck_taximetaRundataTj: TAction;
    N257: TMenuItem;
    N258: TMenuItem;
    N259: TMenuItem;
    N260: TMenuItem;
    tool_SeekCar: TAction;
    N261: TMenuItem;


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
    procedure help_skin1Execute(Sender: TObject);
    procedure help_skin2Execute(Sender: TObject);
    procedure help_skin3Execute(Sender: TObject);
    procedure help_skin4Execute(Sender: TObject);
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
    procedure fun_sendToDTEExecute(Sender: TObject);
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
    procedure fun_SendToDTEsExecute(Sender: TObject);
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
    procedure fun_ModifyDisplayNameExecute(Sender: TObject);
    procedure fun_ModifyLCDMenuExecute(Sender: TObject);
    procedure fun_UpdateDevFirmWareExecute(Sender: TObject);
    procedure fun_Devs_PursueDevExecute(Sender: TObject);
    procedure fun_Devs_SendControlInfo_NeedAnswerExecute(Sender: TObject);
    procedure fun_Devs_ModifyLCDMenuExecute(Sender: TObject);
    procedure fun_Devs_ModifyDisplayNameExecute(Sender: TObject);
    procedure fun_Devs_UpdateFirmWareExecute(Sender: TObject);
    procedure fun_Devs_SetDevTelListExecute(Sender: TObject);
    procedure fun_TaxiMeterStopDateTimeExecute(Sender: TObject);
    procedure fun_Devs_TaxiMeterStopDateTimeExecute(Sender: TObject);
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
    procedure ck_SendMsgListExecute(Sender: TObject);
    procedure ck_SendOrderListExecute(Sender: TObject);
    procedure SplitterBottomBeforeOpen(Sender: TObject;
      var AllowOpen: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TimerCallTimer(Sender: TObject);
    procedure SystemConfigExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fun_SwitchToMeExecute(Sender: TObject);
    procedure fun_TermToTouShuExecute(Sender: TObject);
    procedure fun_SetCutOilElecExecute(Sender: TObject);
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
    procedure help_testExecute(Sender: TObject);
    procedure fun_ReadDevVersionExecute(Sender: TObject);
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
    procedure fun_ReadDriverInfoExecute(Sender: TObject);
    procedure ck_DriverOnOffDutyExecute(Sender: TObject);
    procedure Map_ChangeNodeNameExecute(Sender: TObject);
    procedure fun_GetAPictureExecute(Sender: TObject);
    procedure tool_SetRunWayExecute(Sender: TObject);
    procedure Print_ScreenExecute(Sender: TObject);
    procedure Print_MapExecute(Sender: TObject);
    procedure MapSaveToJpegExecute(Sender: TObject);
    procedure ck_PictureExecute(Sender: TObject);
    procedure show_PictureExecute(Sender: TObject);
    procedure PageControlBottomChange(Sender: TObject);
    procedure fun_ReadGPRSFluxExecute(Sender: TObject);
    procedure TimerUpdateTimer(Sender: TObject);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure Set_HisTrackExecute(Sender: TObject);
    procedure fun_SendAdInfoExecute(Sender: TObject);
    procedure fun_SendDelAdInfoExecute(Sender: TObject);
    procedure ComboBoxCarNOClick(Sender: TObject);
    procedure fun_SendListenTELExecute(Sender: TObject);
    procedure show_GPSHostoryExecute(Sender: TObject);
    procedure ck_OverSpeedRecordExecute(Sender: TObject);
    procedure ck_StopRecordExecute(Sender: TObject);
    procedure fun_BrakeStateExecute(Sender: TObject);
    procedure fun_CallDriverExecute(Sender: TObject);
    procedure tool_SetFactoryExecute(Sender: TObject);
    procedure ck_TaxiMetaRunDataExecute(Sender: TObject);
    procedure ck_taximetaRundataTjExecute(Sender: TObject);
    procedure tool_SeekCarExecute(Sender: TObject);
  private
    { Private declarations }
    FFlashDlg:Tflash_jk;
    {$ifdef ForOutLook}
    FOutLook: TOutlook;
    {$endif}
    
    FDlg_data_display :Tdata_display; //������ʾ ����
    FDlg_Watch_Car    :TWatch_car;    //��س���
    FDlg_Sended_Cmd   :TSended_Cmd;   //�ѷ�����
    FDlg_OrderList    :TOrderListFrm; //�����б�
    FDlg_Received_Info:TReceived_info;//�յ������������������ݣ��������������صģ�
    FDlg_Prompt_Info  :TReceived_info;//��λ������Ĺ�����ʾ;
    FDlg_ConfineAreaList  :TConfineAreaListFrm;
    FDlg_AlarmCar         :TFrmAlarmCar;
    FDlg_SearchAddress    :TFrmSearchAddressInMap;
    FDlg_PictureFrm      :TPictureFrm;//��Ƭ
    FDlg_HisForm: TFormHisMain;
    FDlg_DRunData:TtaxiRunDataFrm;
    {ͣ���Ĵ�����Ŀ}
    FBottomFormCount  :integer;
    {�ײ㴰�ڵĸ߶�}
   // FBottomFromHeight :integer;
    {�����ĵĴ�������}
    FCenterFormCount: integer;
    {�������복�ƺ�}
    FDevKeyIn : boolean;
    {Ҫ ����ѡ������ListView,��������ʱ�á�}
    FListView_SelectDevs: TListView;
    ParamAllFrm : TParamAllFrm; //Ⱥ�����
    
//    MouseAction:integer;

    EarthRect:TEarthRect;
    lo,la:Double;


    FSearch : Boolean;
//    LastInOutMap:TDatetime;

    procedure AddDeviceByGroup;
    procedure Add_A_Device;
    procedure AddDeviceFromListSelectDev;
    procedure DoAppException(Sender: TObject; E: Exception);
    procedure ChangeMap(MapNode: TMapNode;ifCurNode:boolean=true;ifAutoScale:boolean=false);
    procedure OpenWSAutoScale(AMapNode: TMapNode; Gauge1: TGauge;OutBox:TWorldRect);
    procedure LoadDevTrackPen_Width;
  private
    procedure iniform ;
    procedure Dlgs_Create;
    procedure Dlgs_Show;
    procedure Dlgs_Hide;
    procedure Dlgs_Free;
    function  ReconnectServer: Boolean;
    procedure userlogin_connect(const loginType:byte);  // �û���¼���ҡ�����Ӧ�÷����� //0--������¼��1--ע�����¼
    procedure SetWindowStat(ws:TWindowState);
    function  CheckDevId:boolean;
    procedure SetPower;
    procedure SelectDevFromListSelectDev(State:integer;Sel:boolean);//��ѡ��������ѡ��
    procedure isOnline;  //�ж��Ƿ�����.
    procedure OnCarActionClick(Dev:TDevice); //  ��ͼ�ϵ�С�������¼�����.
    procedure OnMapLabelMouseMove(Shift: TShiftState; X, Y: Integer);
    procedure InitCallClient;
    procedure FCallClientOnCallIn(Sender: TObject; ATelephone: String; ACallLogID: Integer);
    procedure FCallClientOnEvent(Sender: TObject; EventCode: Integer; AParam: Integer);
    procedure FClientUserChannelEvent(Sender: TObject; EventCode: Integer);
    procedure FClientCountChangeEvent(Sender: TObject; ClientCount: TClientCountData);
    function  TelStateCanDo:boolean;
  private
    //��������û��ġ������ע��(ȡע���ֵ),��true�����ûע�ᣬ�����ע��
    function  UserReged:boolean;
//    procedure ShowEkeyMsg(str:string);
    procedure SaveWS;
    procedure OpenWSInit(AMapNode:TMapNode;Gauge1:TGauge);
    procedure OpenWS(AMapNode:TMapNode;Gauge1:TGauge);overload;
    procedure OpenWS;overload;
    procedure OpenDefaultMap;

    procedure Connect2Gateway;
    procedure RefreshSeverStat;
    procedure ShowDeviceTrack_Watch(Adev:Tdevice);
    procedure FMapMetaSelected(Sender: TObject);
    procedure FMapMeasure(Sender: TObject; Distance, TotalDistance, Area: Double; Flag: Integer);
    //�����򱨾�
    procedure FMapSetConfineAlarmArea(Sender:TObject;WPointsAry:TWorldPointAry;PointsCnt:Integer);
    //��̶�·��
    procedure FMapSetRunWay(Sender:TObject;WPointsAry:TWorldPointAry;PointsCnt:Integer);
    //��ѡ ȡ�� ��ѡʱ��������յ�
    procedure GetMapRectSelect_Rect(PointA, PointB:TEarthPoint);

    //���û���ѡ���������ڵ�ͼ��Ȧ�������������г���
    procedure FMapUserSelectDev(sender: Tobject;PointA,PointB:TEarthPoint);
    //���û���ѡ������ѡ�г�����̫��ʱ�����������ʾ
    procedure FMapUserSelDevcntMany;
    procedure DevAlarm_OutorInConfineArea(ADev: Tdevice;AlarmType:Byte;AddorDel:boolean;AArea:TConfineArea);
    {���ĳ����б��е�ĳ��}
    procedure OncxDeviceListEdited(Sender: TObject;AColumn: TcxTreeListColumn);

    procedure RestoreRequest(var message: TMessage);  message CM_RESTORE;
    //���յ����������͵�֪ͨ��Ϣ
    procedure DataServer_SendMsg(var message: TMessage);  message CM_DATASERVER_SENDMSG;
    procedure DevNotifyStat(var message: TMessage); message CM_DevNotifyStat; //֪ͨ�豸ˢ�²���
    procedure RegUserError2Gateway(var message: TMessage); message CM_RegUserErr;// �û���¼�����ط����� ����
    procedure Msg_DevAlarm(var message: TMessage); message CM_DEVALARM;  //���յ���GPS�������б���
    procedure Msg_For_Update(var message: TMessage); message CM_UPDATE;  //���±�����,,����ر��Լ�,�����Ϣ���ɸ��³��򷢳�.
    //procedure Msg_PowerCut(var message: TMessage);message CM_PowerCut;//�ϵ籨��
    procedure RefeshADev(const DevId:integer); //ˢ��ĳ��
    procedure DoulbeClickOrderList(Sender :TObject);
    procedure OnMapMouseDown(Sender: TObject; Button: TMouseButton;  Shift: TShiftState; X, Y: Integer);
    procedure FMapMouseMove(Sender: TObject; Shift: TShiftState;X, Y: Integer);

    procedure OnMapMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure OnUserDefinedText(Sender:TObject;EarthPoint:TEarthPoint;WorldPoint:TWorldPoint);//�û��Զ����ǩ
    procedure OnUserSetFactory(Sender:TObject;EarthPoint:TEarthPoint;WorldPoint:TWorldPoint);//�û��Զ��幤������
    procedure OnEmptyFull(Sender:TObject;AEmptyCount,AFullCount:integer);
    procedure OnReDrawMap(Sender:TObject;Dev:TDevice);
    procedure ShowUserDefinedText;
    function  SetActivePage(PageControl:TPageControl;PageCaption:string):boolean;

  protected
    procedure CreateParams(var Params: TCreateParams);override;
  public
   { Public declarations }
    //�������ͼ��ʾ����
    FDlg_Map: TMapShowFrm;

    //�����ڵ�ͼHint������Ϣ
    MapLabel : TLabel;

    //GPSͼ��
    drawlayer: TGpsDrawLayer;
    datalayer: TGpsDataLayer;

    //�켣�ط�ͼ��
{    GpsPlayDrawLayer: TGpsPlayDrawLayer;
    GpsPlayDataLayer: TGpsDataLayer;   }

    //����ͼ��
    userDrawLayer: TAreaDrawLayer;
    userDataLayer: TDataLayer;

    //�û��Զ���ͼ��
    TextLayer: TUserDefinedTextLayer;
    TextDataLayer: TDataLayer;

    //��ͼ�ڵ������.�������еĵ�ͼ����
    MapManger: TMapManger;

    //����굱��һ������������.��Ҫ�ǽ����ǰ�����ʾ���ĸ�ʡ����
    MouseDev:TDevice;

    //�������б��� ԭ�е�Խ���ʻ�뱨����Ϣ��������ʷ,�����б���ԭ��ɾ��
    //MoveCause:
    //����1��������Խ�絽��Խ�磬���ʻ�뵽ʻ����
    //����2���û��ڵ���Χ���б���ɾ��ĳ�����ĳ�����޶��ĳ���

    procedure RemoveOutorInCAData2History(ADev:TDevice;AlarmType:byte;const MoveCause:string);
    procedure ShowState(Device:TDevice);   //��ʾ32λ��״̬��Ϣ.�õ�DEvice���Swicth ������.
    function  SetDatetime:boolean;         //�޸ı���ʱ��
    procedure fun_Locate_CarExecute_rundata;//ifCurNode�Ƿ��ж�ΪMapNodeΪ��ʱ���;
  end;

var
  Mainf: TMainf;

implementation
uses
   ufrmlogin,  ufrmabout, ufrmChangePass, uconnect_set, UserUnit,
   usee_clxx, ResUnit, GatewayServerUnit, ParamUnit,uCall_Dev,
   {PrivilegeConstUnit,}ulayer_control ,  Math,uControl_Switch,
   uSet_CarTrack ,uMap_layer,uset_SendToDTE_Data, uSendMsg2Dev , uSetAlarmSound,
   BleepInt,
   uClxxQryForm,
   uConfineAreaSetFrm ,
   uFrmSelectDevs,uFrmRefreshProgress,
   PursueDevFrmUnit,

   SetDevTelListFrmUnit,
   ParamReadFrmUnit,
   ModifyLcdCoNameFrmUnit,
   SetUpdateDevFrmUnit,
   LCDMenuALLFrmUnit,
   ModifyLcdCoNameFrmAllUnit,
   SetUpdateDevAllFrmUnit ,
   SetDevTelListAllFrmUnit,
   TaxiMeterStopDateTimeFrmUnit,
   DriverInfoFrmUnit,
   SendOrderFrmUnit,
   DateUtils,CmdStructUnit,CancelOrderMenuFrmUnit,CancelOrderMenu2FrmUnit,OrderUnit,
   OrderQueryListUnit,
   SendOrderMiniFrmUnit,
   ParamsUnit,CallClientUnit,
   SystemConfigFrmUnit,
   CutOilElecFrmUnit,
   UserDefinedTextFormUnit,
   TextUnit,
   DriverOnOffDutyUnit,
   GetAPictureFrmUnit,
   QueryCarFrmUnit,
   uGloabVar,
   updateUnit,
   SelectPlayGpsTimeUnit,
   PlayGlobalUnit,
   SetCarTrackPenFrmUnit,
   SendAdInfoFrmUnit,
   OverSpeedRecordUnit,
   StopRecordUnit,
   BrakeStateFromUnit

   {$ifdef ForAddEKey},EKeyUseUnit{$endif}
   {$IFDEF ForTestUser},GetIdeNumUnit,UserRegFrmUnit{$ENDIF}
  , SendDelAdInfoFrmUnit, taxiRundataTjByMonthFrmUnit;

const
  DEV_BOUND0 = 1200;   //�豸���ⲿ���ڲ�����
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

{�����ָ�����Ϣ}
procedure TMainf.RestoreRequest(var message: TMessage);
begin
  if IsIconic(Application.Handle) = True then  //�����Ƿ���С��
    Application.Restore  //�ָ�����
  else
    Application.BringToFront; //�ᵽǰ����ʾ
end;



procedure TMainf.FormCreate(Sender: TObject);
var
  s:string;
  IniFile:TIniFile;

begin
  ExePath:= ExtractFilePath(Application.ExeName);
  //uGloabVar.SystemLog.LogFile:=ExePath+'\SystemLog\SystemLog';




  IniFile:=TIniFile.Create(ExePath+'Config.ini');
  try
    VersionFor:=UpperCase(IniFile.ReadString('SYS','VersionFor',''));
    Self.Caption:=IniFile.ReadString('Caption','AppName','���ܼ�ؿͻ���');
    {$IFNDEF ForTestUser}
         Self.Caption:= Self.Caption+'   ���ð�  �󲿹��ܲ�����ʹ��  ';
         ConstIP:='222.190.120.203';
         ConstPortOfBiz:=211;
         ConstPortOfGate:=9000;
    {$endif}
    Application.Title :=Self.Caption+VERSION;
    try
      taxiType := StrtoInt(IniFile.ReadString('taxiType','taxiType','0'));
    except
      taxiType := 0;
    end;
  finally
    IniFile.Free;
  end;

//  HisForm:=nil;
  FFlashDlg:= Tflash_jk.Create(self);  //��������
  FFLashDlg.SetLabel('װ���ͼ�ļ�...');
  FFLashDlg.Show;
  application.ProcessMessages;

  Application.HintHidePause:=15000;
  Application.OnException:=DoAppException;








    FFLashDlg.SetLabel('װ���ͼ�����ļ�...');
    application.ProcessMessages;
  //{$ifdef For_ConfineArea}
    show_ConfineAreaList.Visible := true;
    tool_SetConfineAlarmArea.Visible := true;
  //{$else}
    //show_ConfineAreaList.Visible := false;
    //tool_SetConfineAlarmArea.Visible := false;
  //{$endif}





  {$IFDEF ForTestUser}
    if not UserReged then
    begin
      Application.Terminate;
      exit;
    end;
  {$endif}
  //ģ�����ҳ��ƺ�
//  {$IFDEF For_MistySearchCarNo}
//    EditSearchCarNo.Visible := True;
//    EditSearchCarNo.Left := Edit1.Left;
//    EditSearchCarNo.top := Edit1.Top;
//    EditSearchCarNo.Width := Edit1.Width;
//    EditSearchCarNo.Text := 'ģ������';
//  {$ELSE}
//    EditSearchCarNo.Visible := False;
//  {$endif}
//  ListBoxSearchCarNo.Visible := False;

  {$ifdef ForAddEKey}
  GEkey.OnStateStr := ShowEkeyMsg;
  ConnectedEkey_monitor;//���KEY
  {$endif}
  iniform ; //��ʼ����

  {$IFDEF ForTestUser}
  if GlobalParam.isUpdate then
  begin
      FFLashDlg.SetLabel('������...');
      application.ProcessMessages;

      TimerUpdateTimer(nil);
  end;
  {$endif}

  if VersionFor='ZT' then
  begin
    DeviceStateList.Cells[0,4]:='�ػ�״̬';
    //DeviceStateList.Cells[0,5]:='�ؿ�״̬';
    DeviceStateList.DeleteRow(5);
    DeviceStateList.DeleteRow(12);
    DeviceStateList.Cells[0,12]:='�㵹״̬';
  end
  else
  if not GlobalParam.isUseMasure  then
  begin
    DeviceStateList.DeleteRow(5);
    DeviceStateList.DeleteRow(5);
    DeviceStateList.DeleteRow(12);
  end;

  userlogin_connect(0); // �û���¼���ҡ�����Ӧ�÷�����
  if Logined then
  begin
    //---------------------------------------------------
    FFlashDlg.SetLabel('���±���ʱ��...');
    SetDatetime;
    FFlashDlg.Gauge1.AddProgress(5);
    //---------------------------------------------------
    FFlashDlg.SetLabel('�����û�Ȩ��...');
    SetPower;
    FFlashDlg.Gauge1.AddProgress(5);
    //---------------------------------------------------
    StatusBar1.Panels.Items[3].Text :='��ǰ�û�:'+current_user.userName +'����¼ʱ��:'+FormatDateTime('yy/mm/dd hh:nn',now()) ; //
    Current_User.LoginDatetime:=now;
    application.ProcessMessages ;
    try
     //--------��¼�ɹ�,�õ���ز���
      FFlashDlg.SetLabel('����ͼƬ��Դ...');
      Bs.QueryAllBitmapRes;     //������Դ
      FFlashDlg.Gauge1.AddProgress(10);
     //---------------------------------------------------
      application.ProcessMessages ;
     //---------------------------------------------------
      FFlashDlg.SetLabel('���س�����...');
      bs.DevGroupinfo(ADevGroupManage);//------ �������

      if ADevGroupManage.Count=0 then
      begin
        messagebox(handle,'�Բ��𣬵�ǰ�û�û�в鿴�κγ����Ȩ�ޣ�'+#13+#13+
          '������ϵͳ����Ա��ϵ������ϵͳ����ͻ��ˡ�Ϊ��ǰ�û������飡','��ʾ',mb_ok + mb_iconinformation);
        Application.Terminate;
        exit;
      end;
      FFlashDlg.Gauge1.AddProgress(10);
     //----------------------------------------------------
      FFlashDlg.SetLabel('���س�����Ϣ...');
      bs.CarInfo(ACarManage);       //�򿪳��� ����
     //----------------------------------------------------
      FFlashDlg.SetLabel('�����豸��Ϣ...');
      FFlashDlg.Gauge1.AddProgress(5);
//      ADeviceManage.OnClickCarAction:=OnCarActionClick;
//      ADeviceManage.PopupMenu:=PopupMenu_funDev;
      bs.DeviceInfo(ADeviceManage);//���豸 ����
      if ADeviceManage.Count=0 then
      begin
        messagebox(handle,'�Բ��𣬵�ǰ�û�û�в鿴�κγ���Ȩ�ޣ�'+#13+#10+
          '������ϵͳ����Ա��ϵ������ϵͳ����ͻ��ˡ�Ϊ��ǰ�û������飬����ӳ�����������飡','��ʾ',mb_ok + mb_iconinformation);
        Application.Terminate;
        exit;
      end;
      //---------------------------------------------------
      FFlashDlg.SetLabel('���س��ƺ���Ϣ...');
      FFlashDlg.Gauge1.AddProgress(5);
      bs.CarNoInfo(ACarNOManage);          //dxf 2007-07-20
      //---------------------------------------------------
      FFlashDlg.SetLabel('��������...');
      FFlashDlg.Gauge1.AddProgress(5);
      Connect2Gateway;   //��������
      //---------------------------------------------------
      {$IFDEF ForTestUser}
      FFlashDlg.SetLabel('���ص绰��...');
      FFlashDlg.Gauge1.AddProgress(10);
      bs.QueryDevsTelList;         //�������г����ĵ绰��

      FFlashDlg.SetLabel('���س�������...');
      FFlashDlg.Gauge1.AddProgress(5);
      bs.QueryDevParamOfAll;       //���س�������     //by dxf 05-09-07

      FFlashDlg.SetLabel('������ʾ���̶��˵�...');
      FFlashDlg.Gauge1.AddProgress(5);
      Bs.QueryDevsMenu;            //�������г�������ʾ���̶��˵�

      FFlashDlg.SetLabel('����ȡ���˵�...');
      FFlashDlg.Gauge1.AddProgress(5);

      //try
      //  Bs.QueryCancelMenu_zb;       //dxf  2006-11-21 to �б���˾
      //  CancelMenuFun:='QueryCancelMenu_zb';
     // except
        CancelMenuFun:='LaodCancelMenu';
        ADeviceManage.LaodCancelMenu;//װ��ȡ���˵�
     // end;

      FFlashDlg.SetLabel('����˾����Ϣ...');
      FFlashDlg.Gauge1.AddProgress(5);
      Bs.DriverInfo(ADriverManage);//����˾����Ϣ
      ADeviceManage.CreateDriverNameTel;
      

      FFlashDlg.SetLabel('���ض�����Ϣ...');
      FFlashDlg.Gauge1.AddProgress(5);
      AOrderManage.LoadOrdersFromDB;

      FFlashDlg.SetLabel('װ�ص�ͼ����...');
      FFlashDlg.Gauge1.AddProgress(5);
      AddressName.Clear;
      AddressName.LoadAddressName(ExePath,'name');
      if Length(GlobalParam.LayerParam)>0 then
      begin
        s:=ExtractFilePath(GlobalParam.LayerParam[0].FilePath);
        if DirectoryExists(s) then
          AddressName.LoadAddressName(s,'name');
      end;
      FamilyName.LoadFamilyName(ExePath+'FamilyName.txt');
      if GlobalParam.isCarNOAndDevName then  ADeviceManage.CarNOAndDevName;//���ƺź��豸���ƺ���һ��....
      {$endif}
      FFlashDlg.SetLabel('��ϵͳ��...');
      FFlashDlg.Gauge1.AddProgress(5);
      Dlgs_Create;
     // DataServer.GetAllPos;
      InitCallClient;
      Timer.Enabled :=true;
      //�����ͼ
      tool_bird_eyeExecute(tool_bird_eye);
      //{$ifdef For_ConfineArea} //���ļ� ���� ������Ϣ��20050721��sha
      GAreaManage.LoadAreasFromFile(ExtractFilePath(application.ExeName)+current_User.UserName+'_areas.ini');
      FDlg_ConfineAreaList.LoadConfineAreas;
      
      


      MapLabel:=TLabel.Create(nil);
      MapLabel.Transparent:=true;
      MapLabel.AutoSize:=false;
      MapLabel.Width:=16;
      MapLabel.Height:=16;
      MapLabel.Parent:=FMap;
      MapLabel.Hide;
      MapLabel.ShowHint:=true;
      MapLabel.Cursor:=crArrow;
      MapLabel.PopupMenu:=PopupMenu_funDev;
      MapLabel.ParentFont:=false;
      MapLabel.Font.Size:=10;
      MapLabel.Font.Name:='����';

      timer1.Enabled:=true;


      MouseDev:=TDevice.Create;
    finally
       FFlashDlg.Hide; //FFlashDlg.Free;  //2004-9-27
       //TimerUpdate.Enabled:=true;

    end;
  end
  else
    application.Terminate;

      {$ifdef ForDatetime}
        if formatDatetime('yyyyMMdd',now)>'20060630' then
          application.Terminate;
      {$endif}
end;


procedure TMainf.FormDestroy(Sender: TObject);
begin
//  if HisForm<>nil then HisForm.Free;
  try
    if Logined  then
    begin
       //{$ifdef For_ConfineArea}
        //GAreaManage.SaveCurrentAreasToFile(ExtractFilePath(application.ExeName)+current_User.UserName+'_areas.ini');
       // {$endif}
       bs.userlogout(current_user);
       current_user.Free ;
    end;
  finally
      if FFlashDlg <> nil then FFlashDlg.Free;//2004-9-27
      
   if Logined then
   begin
     if FDlg_data_display <> nil then FDlg_data_display.Free;
     if FDlg_Watch_Car <> nil then FDlg_Watch_Car.Free;
     if FDlg_Sended_Cmd <> nil then FDlg_Sended_Cmd.Free;
     if FDlg_OrderList <> nil then FDlg_OrderList.Free;
     if FDlg_Received_Info <> nil then FDlg_Received_Info.Free;
     if FDlg_DRunData <> nil then FDlg_DRunData.Free;
    {sha}
     if DataServer<>nil then
     begin
      //�߳� �����ö�ʱ��  2005.03.25
       DataServer.Free;
     end;
     if bs<>nil then bs.Free;
    end;
  end;
  if FGis<> nil then FGis.Free;
  MouseDev.Free;
//  if SystemLog<>nil then SystemLog.Free;
end;

procedure TMainf.DoAppException(Sender: TObject; E: Exception);
var
  s:string;
begin
  try    
    s:=DatetimeToStr(now)+'δ������쳣:ExceptionClassName:'+E.ClassName;
    s:=s+'   SenderClassName:'+Sender.ClassName;
    //�ж��ǲ���TComponent,����ǲ���¼TComponent.Name
    if Sender is TComponent then
    begin
        s:=s+'   SendCompName:'+TComponent(Sender).Name;
        //�ж��ǲ���TWinControl,����Parent,�ͼ�¼Parent.Name
        if Sender is TWinControl then
        begin
            if TWinControl(Sender).Parent<>nil then
            begin
                s:=s+'   SendCompNameParent:'+TWinControl(Sender).Parent.Name;
            end;
        end;
    end;
    s:=s+'   E.Message:'+E.Message;
    s:=s+'   HelpContext:'+IntToStr(E.HelpContext);
  finally
    uGloabVar.SystemLog.AddLog(s);
  end;
end;

procedure TMainf.Panel4Click(Sender: TObject);
begin
  show_carExecute(show_car);
end;

procedure TMainf.iniform;  //ȫ�ֱ���������ʼ��

begin
try


  FDlg_Map := TMapShowFrm.Create(self);
  FDlg_Map.ManualDock(PageControl_Center, nil, alLeft);
  FDlg_Map.Show;
  Show_Map.Checked := true;

  FGis := TGisPlatform.Create;
  FMap := TGpsMap.Create(nil,FGis.Provider);
  FMap.Name:='FMap';
  FMap.Parent := FDlg_Map.Panel_Map;//Panel_Map;
  FMap.Align := alClient;
  FMap.Color := clWhite;
//  FMap.Draw;
  FMap.MouseAction := actMove;
  FMap.OnMetaSelected := FMapMetaSelected;
  FMap.OnMeasure := FMapMeasure;
  FMap.OnSetConfineAlarmArea := FMapSetConfineAlarmArea;
  FMap.OnSetRunWay:=FMapSetRunWay;
  FMap.OnMouseDown:=OnMapMouseDown;
  FMap.OnMouseUp:=OnMapMouseUp;
  FMap.OnMouseWheelUp:=FormMouseWheelUp;
  FMap.OnMouseWheelDown:=FormMouseWheelDown;
  FMap.OnMouseMove := FMapMouseMove; //
  FMap.OnUserSelectDevEvent := FMapUserSelectDev;          //�û��ڵ�ͼ��ѡ���˳���
  FMap.OnUserSelDevCntManyEvent:= FMapUserSelDevcntMany;   //�û��ڵ�ͼ��ѡ��ĳ�����������
  //Fmap.OnDevAlarm_OutorInCArea:= FMapDevAlarm_OutorInConfineArea;  //����Խ��or ʻ�뱨��
  FGis.AddMap(FMap);
  datalayer := TGpsDataLayer.Create;
  datalayer.LayerName := 'GPSͼ��';
  datalayer.isHaveNotDelete:=true;
  FMap.GpsDataLayer := datalayer;

  FGis.Provider.AddLayer(datalayer);
  drawlayer := TGpsDrawLayer.Create;
  drawlayer.OnEmptyFull:=OnEmptyFull;
  drawlayer.OnReDrawMap:=OnReDrawMap;
  drawlayer.isHaveNotDelete:=true;
  FMap.GpsDrawlayer := drawlayer;
  drawlayer.Data := datalayer;
  drawlayer.GpsMap := FMap;
  FMap.Layers.AddLayerWithLayer(drawlayer);


  //�켣�ط�ͼ��

{  GpsPlayDataLayer := TGpsDataLayer.Create;
  GpsPlayDataLayer.LayerName := 'GPS�ط�ͼ��';
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

  //��������ļ�
  GlobalParam.LoadFromFile(Application.ExeName+'.config');

  MapManger:= TMapManger.Create('ȫ��');
  MapManger.LoadFile(ExePath+'MapConfig.xml');
  MapManger.ShowToTreeView(FDlg_Map.TreeViewMap,FDlg_Map.CheckBoxIsShowFile.Checked);
  FDlg_Map.StatusBar1.Panels.Items[0].Text:='Ĭ����ʾ��ͼ:'+MapManger.DefaultNode.Name;
  //����ҵ�������
  bs:=TBusinessSevercom.Create;
  bs.Host:=GlobalParam.Business.Host;
  bs.Port:=GlobalParam.Business.Port;
  bs.HostBak:=GlobalParam.BusinessBak.Host;
  Bs.PortBak:=GlobalParam.BusinessBak.Port;
  OpenDefaultMap;
  if not FileExists(ExePath+'MapConfig.xml') then
  begin
    OpenWS;
  end
  else
  begin
    if MapManger.DefaultNode<>nil then
      OpenWS(MapManger.DefaultNode,FFLashDlg.Gauge1)//dxf
    else
      OpenWS(MapManger.RootNode,FFLashDlg.Gauge1);//dxf
  end;
  FMap.Layers.SetOrder(FMap.Layers.Count-1,0);//sha ��GPSͼ�㵽��0�㡣

  //{$ifdef For_ConfineArea}
  //�û�������ͼ��
  FFLashDlg.Gauge1.AddProgress(5);
  userDataLayer := TDataLayer.Create;
  userDataLayer.LayerName := UserDrawAreaLayerName;
  userDataLayer.isHaveNotDelete:=true;
  userDataLayer.State:= [lyVisible];

  FGis.Provider.AddLayer(userDataLayer);

  userDrawLayer := TAreaDrawLayer.Create;
  userDrawLayer.isHaveNotDelete:=true;
  userDrawLayer.Data := userDataLayer;
  userDrawLayer.Map := FMap;
  FMap.layers.AddLayerWithLayer(userDrawLayer);
  FMap.Layers.SetOrder(FMap.Layers.Count-1,0);//��������滭ͼ�� ʼ�շ��ڡ���0��
 // {$endif}
  TextDataLayer:=TDataLayer.Create;
  TextDataLayer.isHaveNotDelete:=true;
  TextDataLayer.LayerName:='�Զ����ǩ';
  TextDataLayer.State:=[lyVisible,lySelect];
  FGis.Provider.AddLayer(TextDataLayer);

  GTextManage.LoadFromFile(ExePath+'UserDefinedText.ini');
  ShowUserDefinedText;
  TextLayer:=TUserDefinedTextLayer.Create;
  TextLayer.isHaveNotDelete:=true;
  TextLayer.Data := TextDataLayer;
  TextLayer.Map := FMap;
  FMap.layers.AddLayerWithLayer(TextLayer);
  FMap.Layers.SetOrder(FMap.Layers.Count-1,0);//��������滭ͼ�� ʼ�շ��ڡ���0��
  FMap.OnUserDefinedText:=OnUserDefinedText;
  FMap.OnUserSetFactory:=OnUserSetFactory;
  {$ifdef ForOutLook}
  FOutLook := FGis.OverViews[FGis.AddNewOverView];
  FOutLook.Parent := Panel_birdEye ;
  FOutLook.Align := alClient;
  FOutLook.Color := clWhite;
  FOutLook.Map := FMap;
  FOutLook.AutoZoom := True;
  Panel_BirdEyeSet.Visible:=true;
  tool_bird_eye.Visible:=True;
  Panel_BirdEyeSet.BringToFront;
  FOutLook.Draw;
  {$endif}
  
  FFLashDlg.Gauge1.AddProgress(5);
  //����Խ��or ʻ�뱨��
  ADeviceManage.OnDevAlarm_OutorInCArea := DevAlarm_OutorInConfineArea;

  LoadDevTrackPen_Width;

  edit1.Text :='';
  edit2.text:='';
  ComboboxCarNo.Text:='';  
except on E: Exception do
  begin
    ShowMessage(E.Message);
  end;
end;
end;

procedure TMainf.sys_change_passExecute(Sender: TObject);
var dlg: TfrmChangePass;
begin
  dlg:= TfrmChangePass.Create(self);
  try
    dlg.edit1.Text:= current_user.UserName ;
    dlg.edit2.Text:='';
    dlg.edit3.Text:='';
    dlg.edit4.Text:='';
    dlg.ShowModal ;
    if dlg.ModalResult = mrok then
    begin       
      try
        if bs.ChangePassword(current_user,trim(dlg.edit3.text)) then
        begin
          messagebox(handle,'�����޸���ɣ�','��ʾ',mb_ok + mb_iconinformation);
          Current_user.Password :=trim(dlg.edit3.text);
        end;
      except
        on E:exception do
           begin
             messagebox(0,pchar(e.Message ),'��ʾ',mb_ok + mb_iconinformation);
           end;
      end;
    end;
  finally
    dlg.Free;
  end;
end;

function TMainf.ReconnectServer: Boolean;
var
  frm:TSystemConfigFrm;
begin
  Result := False;
  frm:=TSystemConfigFrm.Create(nil);
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

procedure TMainf.userlogin_connect(const loginType:byte);  // �û���¼���ҡ�����Ӧ�÷����� //0--������¼��1--ע�����¼
var
  cnt:integer;
  dlg:Tfrmlogin;
begin
  dlg := Tfrmlogin.Create(self);
  dlg.Edit1.Text := '';
  dlg.Edit2.Text := '';
  {$ifopt d+}
    dlg.Edit1.Text := '';
    dlg.Edit2.Text := '';
  {$endif}
  if loginType =1 then //1--ע�����¼
  begin
    dlg.BitBtn2.Caption:='�˳�';
  end;   
  cnt:= 0;
  try
    while true do
    begin
      if FFlashDlg.Showing then FFlashDlg.Hide;//�û����������ʱ���������� ����ʱ FFlashDlg.Showing=true
      dlg.ShowModal ;
      cnt:= cnt + 1;
      if dlg.ModalResult = mrok then
      begin
        FFlashDlg.Show ;
        FFlashDlg.SetLabel('����ҵ�������...');
        FFlashDlg.Gauge1.Progress:=5;
        application.ProcessMessages;
        current_user:= Tuser.Create(trim(dlg.Edit1.Text), trim(dlg.Edit2.Text));

        try  //--------���� ��ҵ�������
          bs.ConnectServer ;
          application.ProcessMessages;

          FFlashDlg.SetLabel('����û���������...');
          FFlashDlg.Gauge1.AddProgress(5);
          if logined then break;   //����û���¼�ɹ����˳�
          if (cnt>=3) and (logined=false) and (loginType<>1) then   //1--ע�����¼
          begin
            messagebox(handle,'�Բ������Ѵ����������Σ����˳�ϵͳ��','��ʾ',mb_ok + mb_iconinformation);
            break;
          end;
        except
          on E:exception do
          begin
            messagebox(handle,pchar(e.Message ),'���ӵ�ҵ�������ʧ�ܣ�',mb_ok + mb_iconinformation);
//            if not ReconnectServer then
//             application.Terminate;
          end;
        end;
      end
      else
      begin
        Logined:=false;
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
    ToolBar2.Visible := Checked ;
  end;
end;

procedure TMainf.show_MapToolbarExecute(Sender: TObject);
begin
  with (Sender as TAction) do
  begin
    Checked := not Checked;
    FDlg_Map.CoolBarMapTool.Visible:= Checked;
  end;
end;

procedure TMainf.show_statusBarExecute(Sender: TObject);
begin
  with (Sender as TAction) do
  begin
    Checked := not Checked;
    StatusBar1.Align := alBottom; 
    StatusBar1.Visible := Checked ;
  end;
end;

procedure TMainf.ck_DevInfoExecute(Sender: TObject);
var dlg:Tsee_clxx;
begin
  dlg := Tsee_clxx.Create(self);
  try
    dlg.ShowModal ;
  finally
    dlg.Free;
  end;
end;

procedure TMainf.tool_moveExecute(Sender: TObject);
var
 i:integer;
begin
  FMap.MouseAction:=actMove;
  for i:=0 to ActionList1.ActionCount-1 do
  begin
    if (ActionList1.Actions[i].Category='��ͼ����') then
    begin
      if ActionList1.Actions[i].Name<>'tool_bird_eye' then
      begin
        TAction(ActionList1.Actions[i]).Checked:=false;
      end;
    end;
  end;  
  TAction(Sender).Checked:=true;
end;

procedure TMainf.tool_zoom_inExecute(Sender: TObject);
var
 i:integer;
begin
  FMap.MouseAction:=actZoomIn;
  for i:=0 to ActionList1.ActionCount-1 do
  begin
    if (ActionList1.Actions[i].Category='��ͼ����') then
    begin
      if ActionList1.Actions[i].Name<>'tool_bird_eye' then
      begin
        TAction(ActionList1.Actions[i]).Checked:=false;
      end;
    end;
  end;  
  TAction(Sender).Checked:=true;
end;

procedure TMainf.tool_zoom_outExecute(Sender: TObject);
var
 i:integer;
begin
  FMap.MouseAction:=actZoomOut;
  for i:=0 to ActionList1.ActionCount-1 do
  begin
    if (ActionList1.Actions[i].Category='��ͼ����') then
    begin
      if ActionList1.Actions[i].Name<>'tool_bird_eye' then
      begin
        TAction(ActionList1.Actions[i]).Checked:=false;
      end;
    end;
  end;  
  TAction(Sender).Checked:=true;
end;

procedure TMainf.tool_locateExecute(Sender: TObject);
var
 i:integer;
begin
  FMap.MouseAction:=actCheckEntityInfo;
  for i:=0 to ActionList1.ActionCount-1 do
  begin
    if (ActionList1.Actions[i].Category='��ͼ����') then
    begin
      if ActionList1.Actions[i].Name<>'tool_bird_eye' then
      begin
        TAction(ActionList1.Actions[i]).Checked:=false;
      end;
    end;
  end;
  TAction(Sender).Checked:=true;
end;

procedure TMainf.tool_UserDefinedtextExecute(Sender: TObject);
var
 i:integer;
begin
  FMap.MouseAction:=actUserDefinedText;
  for i:=0 to ActionList1.ActionCount-1 do
  begin
    if (ActionList1.Actions[i].Category='��ͼ����') then
    begin
      if ActionList1.Actions[i].Name<>'tool_bird_eye' then
      begin
        TAction(ActionList1.Actions[i]).Checked:=false;
      end;
    end;
  end;
  TAction(Sender).Checked:=true;
  PageControl1.ActivePageIndex:=2;
end;

procedure TMainf.tool_distanceExecute(Sender: TObject);
var
 i:integer;
begin
  FMap.MouseAction:=actMeasure;
  for i:=0 to ActionList1.ActionCount-1 do
  begin
    if (ActionList1.Actions[i].Category='��ͼ����') then
    begin
      if ActionList1.Actions[i].Name<>'tool_bird_eye' then
      begin
        TAction(ActionList1.Actions[i]).Checked:=false;
      end;
    end;
  end;  
  TAction(Sender).Checked:=true;
end;

procedure TMainf.tool_select_pointExecute(Sender: TObject);
begin
  FMap.MouseAction:=actPointSelect;
end;

procedure TMainf.tool_not_selectExecute(Sender: TObject);
var
 i:integer;
begin
  FMap.MouseAction:=actNoAction;
  for i:=0 to ActionList1.ActionCount-1 do
  begin
    if (ActionList1.Actions[i].Category='��ͼ����') then
    begin
      if ActionList1.Actions[i].Name<>'tool_bird_eye' then
      begin
        TAction(ActionList1.Actions[i]).Checked:=false;
      end;
    end;
  end;
  TAction(Sender).Checked:=true;
end;

procedure TMainf.FMapMetaSelected(Sender: TObject);
var
  i: integer;
  Layer: TDrawLayer;
  layerAry:array of TDrawLayer;
  kfieldUidValue: array of Integer;
  cnt : Integer;
begin
  cnt := 0;
  for i := 0 to FMap.Layers.Count - 1 do
  begin
    Layer := FMap.Layers.GetLayerByIndex(i);
    //if not (lyVisible in Layer.State) then continue;
   // if not (lySelect in Layer.State) then continue;
    if Layer.EntityMeta.Count = 0 then continue;
    Inc(cnt);
    SetLength(kfieldUidValue,cnt);
    SetLength(layerAry,cnt);
    kfieldUidValue[cnt -1] := Layer.Data.GetMetaUID(Layer.EntityMeta.GetData(0));
    layerAry[cnt -1]:= Layer;
  end;
  if cnt>0 then //ѡ�е�����ݡ���ʾ
  begin
    FDlg_data_display.InitForm(layerAry,kfieldUidValue);
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
var dlg:Tfrmabout;
begin
  dlg:= TfrmAbout.Create(self);
  try    
    dlg.ShowModal ;
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
  i,j,n: Integer;
  m: IMap;
  lay: ILayer;
begin
  GlobalParam.MapLeft := FMap.DrawCood.WorldRect.Left;
  GlobalParam.MapRight := FMap.DrawCood.WorldRect.Right;
  GlobalParam.MapTop := FMap.DrawCood.WorldRect.Top;
  GlobalParam.MapBottom := FMap.DrawCood.WorldRect.Bottom;
  SetLength(layer,FMap.Layers.Count);
  m := TMapCtrl.Create(FMap);
  //for i := 0 to FMap.Layers.Count - 1 do
  i:= 0;   //
  j:=i;    //
  n:=FMap.Layers.Count-1; //
  while j<= n do
  begin
    lay := m.GetLayer(i);
    if lay.isHaveNotDelete then
    begin
      i:= i+1;  //
      n:= n-1;  //
      SetLength(layer,n + 1);//
      Continue;
    end;
    If FMap.Layers.Layer[i].Data.FileName  ='' then
    begin
      i:= i+1;  //
      n:= n-1;  //
      SetLength(layer,n + 1);//
      Continue;
    end;
    layer[j].FilePath := ExtractRelativePath(Application.ExeName,FMap.Layers.layer[i].Data.FileName);
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
    i:= i + 1;   //
    j:= j + 1;   //
  end;
  m := nil;
  GlobalParam.LayerParam := layer;
end;

procedure TMainf.OpenDefaultMap;
var
  m: IMap;
  lay: ILayer;
  FileName,path:string;
  mapfont:TMapFont;
  inifile:TIniFile;
begin
   m := TMapCtrl.Create(FMap);
   inifile:=TIniFile.Create(ExePath+'Config.ini');
   try
      Path:=ExtractFilePath(Application.ExeName);
      FileName:=path+'ʡ.tyo';
      FFLashDlg.SetLabel(FileName);
      if not FileExists(FileName) then exit;
      FMap.LoadFromFile(FileName);
      ADeviceManage.ShengLayer:=FMap.Layers.GetLayerByIndex(0);  
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
      
      mapfont.Name:=inifile.ReadString('ʡ','FontName','����');
      mapfont.Size:=inifile.ReadInteger('ʡ','FontSize',20);
      mapfont.Color:=inifile.ReadInteger('ʡ','FontColor',8388608);
      lay.SetLayerFont(mapfont);
      lay := nil;

      FileName:=path+'��.tyo';
      FFLashDlg.SetLabel(FileName);
      if not FileExists(FileName) then exit;
      FMap.LoadFromFile(FileName);
      ADeviceManage.ShiLayer:=FMap.Layers.GetLayerByIndex(0);
      lay := m.GetLayer(0);
      lay.SetVisible(true);
      lay.SetSelected(true);
      lay.SetMetaIgnore(true);
      lay.SetShowLabel(true);
      lay.SetLabelValue('name');
      lay.SetLayerIgnore(true);
    {$IFNDEF ForTestUser}
       lay.SetLayerIgnore(false);
    {$endif}
      lay.SetLayerMinScale(1000);
      lay.SetLayerMaxScale(20000);
      lay.SetHaveNotDelete(true);
      mapfont.Name:=inifile.ReadString('��','FontName','����');
      mapfont.Size:=inifile.ReadInteger('��','FontSize',14);
      mapfont.Color:=inifile.ReadInteger('��','FontColor',32768);
      lay.SetLayerFont(mapfont);
      lay := nil;

      
      FileName:=path+'��.tyo';
      FFLashDlg.SetLabel(FileName);
      if not FileExists(FileName) then exit;
      FMap.LoadFromFile(FileName);
      ADeviceManage.XianLayer:=FMap.Layers.GetLayerByIndex(0);
      lay := m.GetLayer(0);
      lay.SetVisible(true);
      lay.SetSelected(true);
      lay.SetMetaIgnore(true);
      lay.SetShowLabel(true);
      lay.SetLabelValue('name');
      lay.SetLayerIgnore(true);
    {$IFNDEF ForTestUser}
      // lay.SetLayerIgnore(false);
    {$endif}
      //lay.SetLayerMinScale(250);
      lay.SetLayerMaxScale(5000);
      lay.SetHaveNotDelete(true);
      mapfont.Name:=inifile.ReadString('��','FontName','����');
      mapfont.Size:=inifile.ReadInteger('��','FontSize',11);
      mapfont.Color:=inifile.ReadInteger('��','FontColor',128);
      lay.SetLayerFont(mapfont);
      lay := nil;

      if not GlobalParam.isLoadChinaRoad then exit;
      SetCurrentDir(Path); //��ÿһ�δ��ļ�,��ǰ·���͸ı���,�����������Ҫ����ѭ��.
      FileName:=ExpandFileName('..\map\Road.tyo');

      if not FileExists(FileName) then exit;
      FMap.LoadFromFile(FileName);
      ADeviceManage.Road:=FMap.Layers.GetLayerByIndex(0);
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
      mapfont.Name:=inifile.ReadString('Road','FontName','����');
      mapfont.Size:=inifile.ReadInteger('Road','FontSize',10);
      mapfont.Color:=inifile.ReadInteger('Road','FontColor',250);
      lay.SetLayerFont(mapfont);
      lay := nil;

   finally
     m:=nil;
   end;
end;

procedure TMainf.OpenWSInit(AMapNode:TMapNode;Gauge1:TGauge);
var
  i: Integer;
  m: IMap;
  lay: ILayer;
  LayerNum:integer;
  ppLayer:PLayerCfg;
  FileName,MapName:string;
  beginDatetime:TDatetime;
  temp:TMapNode;
begin
      //showmessage('TMainf.ChangeMap');
 try
    m := TMapCtrl.Create(FMap);
    SetCurrentDir(ExtractFilePath(Application.ExeName));
    LayerNum:=AMapNode.LayerCfgManager.Count;
    temp:=AMapNode.ParentNode;
    MapName:=AMapNode.Name;
    if temp<>nil then
        while (temp.Name<>'ȫ��')do
        begin
        MapName:=temp.Name+'->'+MapName;
        temp:=temp.ParentNode;
        if (temp=nil){or(temp.Name='ȫͼ')} then break;
        end;

    FDlg_Map.PanelMapName.Caption:='��ǰ��ͼ����'+MapName;

    Self.Caption:=Application.Title+'                       ��ǰ��ʾ '+MapName+' ��ͼ';
    MapManger.CurrentNode:=AMapNode;
    for i:= LayerNum - 1 downto 0 do
    begin
      try
          beginDatetime:=now;
          SetCurrentDir(ExtractFilePath(Application.ExeName));
          ppLayer:=AMapNode.LayerCfgManager.LayerCfgItem[i];
          FFLashDlg.SetLabel(ppLayer^.FilePath);
          FileName:=ExpandFileName(ppLayer^.FilePath);
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
          Gauge1.AddProgress(
                                      trunc((1/LayerNum)*90)
                                      );
          if MilliSecondsBetween(now,beginDatetime)>500 then
             TForm(Gauge1.Parent).Show;
            // showmessage('TMainf.OpenWSInit  Current'+IntToStr(LayerNum-i)+'  Total'+IntToStr(LayerNum ) );
      except
          Continue;
      end;
    end;


except  on E: Exception do
    uGloabVar.SystemLog.AddLog(' OpenWSInit(AMapNode:TMapNode;Gauge1:TGauge)��������: ',e.Message);
end;
end;


procedure TMainf.OpenWS(AMapNode:TMapNode;Gauge1:TGauge);
begin
 try
    OpenWSInit(AMapNode,Gauge1);

    if(AMapNode.OutBox.Xmin=0)and(AMapNode.OutBox.Xmax=0)then
    begin
       if AMapNode.ParentNode<>nil then
           FMap.Zoom(AMapNode.ParentNode.OutBox)
       else
           FMap.Zoom(ADeviceManage.ShengLayer.Outbox);
    end
    else
       FMap.Zoom(AMapNode.OutBox);
    FFLashDlg.SetLabel('��ͼ����...');
    application.ProcessMessages;
    //FMap.Draw;
except  on E: Exception do
    uGloabVar.SystemLog.AddLog(' TMainf.OpenWS(AMapNode:TMapNode;Gauge1:TGauge)��������: ',e.Message);
end;
end;

procedure TMainf.OpenWSAutoScale(AMapNode:TMapNode;Gauge1:TGauge;OutBox:TWorldRect);
var
  temp:double;

begin
 try
    temp:=FMap.DrawCood.GetRealScale;
    OutBox:=FMap.DrawCood.WorldRect;

    OpenWSInit(AMapNode,Gauge1);
    // showmessage('TMainf.OpenWS1');
    FFLashDlg.SetLabel('��ͼ����...');
//    application.ProcessMessages;//dxf 2007-07-11  ���������ܼ���,�������,�л���ͼʱ����˸��ʾʡͼ

    FMap.DrawCood.SetRealScale(temp);
   // showmessage('TMainf.OpenWS2');
    FMap.Zoom(OutBox);
  //  showmessage('TMainf.OpenWS3');
//    FMap.Draw;
except  on E: Exception do
    uGloabVar.SystemLog.AddLog(' OpenWSAutoScale(AMapNode:TMapNode;Gauge1:TGauge)��������: ',e.Message);
end;
end;





procedure TMainf.OpenWS;
var
  i: Integer;
  m: IMap;
  lay: ILayer;
  r: TWorldRect;
  LayerNum:integer;
  s,CDir:string;
begin
  try
    m := TMapCtrl.Create(FMap);
    CDir:=ExtractFilePath(Application.ExeName);
    LayerNum:=Length(GlobalParam.LayerParam);
    for i:= LayerNum - 1 downto 0 do
    begin
      SetCurrentDir(CDir); //��ÿһ�δ��ļ�,��ǰ·���͸ı���,�����������Ҫ����ѭ��.
      s:=ExpandFileName(GlobalParam.Layerparam[i].FilePath);
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
        FFLashDlg.Gauge1.AddProgress(
                                    trunc((1/LayerNum)*90)
                                    );
      except
        continue;
      end;
    end;
    r.Left := GlobalParam.MapLeft;
    r.Right := GlobalParam.MapRight;
    r.Top := GlobalParam.MapTop;
    r.Bottom := GlobalParam.MapBottom;
    FMap.Zoom(r);
    FFLashDlg.SetLabel('��ͼ����...');
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
      FDlg_Map.Panel_birdEye.Visible:=true;
    end
    else
    begin
      FDlg_Map.Panel_birdEye.Visible:=false;
      FDlg_Map.Panel_BirdEyeSet.SendToBack;
    end;
  end;
end;

procedure TMainf.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  TelStateCanDo;
  if TelIsConnect then
  begin
    CanClose := false;
    exit;
  end;
  if messagebox(handle,'��ȷ��Ҫ�˳���ϵͳ��','�˳�ѡ��',MB_OKCANCEL + MB_ICONQUESTION)= ID_CANCEL then
    CanClose := false;
end;

procedure TMainf.Connect2Gateway;
begin
   //�߳� �����ö�ʱ��
  DataServer := TGateWayServerCom.Create;
  DataServer.UserId := current_user.id;
  DataServer.UserPass := current_user.Password;
  DataServer.Host := GlobalParam.Gateway.Host;
  DataServer.Port := GlobalParam.Gateway.Port;
  DataServer.Active := True;
end;

procedure TMainf.fun_callDevExecute(Sender: TObject);  //���г���
begin
  {$ifdef ForAddEKey}
  ConnectedEkey_monitor;
  {$endif}
  if not CheckDevId then
  begin
    fun_Devs_CallDevExecute(Sender);
    exit;
  end;
  DataServer.CallTarget(GCurSelectDev.Id);
end;

procedure TMainf.sys_lockExecute(Sender: TObject);     //����
var
  dlg:Tfrmlogin;
  TempBool:boolean;
begin
  TempBool:=false;
  if not TelStateCanDo then exit;
  if GetFocusSendOrderFrm<>nil then
  begin
    MessageBox(Self.Handle,pchar('�봦�������ж���������'),'��ʾ',mb_ok + mb_iconinformation);
    exit;
  end;

  dlg:= TfrmLogin.Create(self);
  try
    dlg.Caption :='�û�����';
    dlg.Panel1.Caption :='�û�����';
    dlg.Edit1.Text :='';
    dlg.edit2.Text :='';
    dlg.BitBtn1.Left :=(dlg.Width - dlg.BitBtn1.Width ) div 2;
    dlg.BitBtn2.Visible :=false;
    dlg.label3.Caption :='����ʱ�䣺'+formatdatetime('yyyy-mm-dd hh:nn:ss',now());
    dlg.Label3.Visible :=true;
    if GlobalParam.IsUseTelServer then
    begin
      TempBool:=TimerCall.Enabled;
      FCallClient.PauseWork;
    end;  
    while true do
    begin
      //��С������� ����
      SetWindowStat(wsMinimized);
      Self.Hide;
      timer.Enabled :=false;

      dlg.ShowModal ;
      if dlg.ModalResult =mrok then
      begin
        if trim(dlg.Edit1.Text) <> current_user.UserName then
        begin
          messagebox(handle,'�û�������ȷ�����������룡','��ʾ',mb_ok + mb_iconinformation);
          dlg.Edit1.Text:='';
          continue;
        end;
        if trim(dlg.Edit2.Text) <> current_user.Password then
        begin
          messagebox(handle,'���벻��ȷ�����������룡','��ʾ',mb_ok + mb_iconinformation);
          dlg.Edit2.Text:='';
          continue;
        end;
        if (trim(dlg.Edit1.Text)= current_user.UserName ) and
           (trim(dlg.Edit2.Text)= current_user.Password )then
        begin
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

procedure TMainf.sys_offExecute(Sender: TObject); //ע��
var
 TempBool:boolean;
begin
  TempBool:=false;
  if not TelStateCanDo then exit;
  if GetFocusSendOrderFrm<>nil then
  begin
    MessageBox(Self.Handle,pchar('�봦�������ж�����ע��'),'��ʾ',mb_ok + mb_iconinformation);
    exit;
  end;
  if messagebox(handle,'��ȷ��Ҫע����','��ʾ',mb_yesno + mb_iconquestion)=id_no  then exit;
  
  WindowState := wsMinimized;
  Self.Hide;  //
  if GlobalParam.IsUseTelServer then
  begin
    TempBool:=TimerCall.Enabled;
    FCallClient.PauseWork;
  end;
  timer.Enabled :=False;
  if tool_bird_eye.Checked     then  tool_bird_eyeExecute(tool_bird_eye);
  if FDlg_Map.Panel_data_display.Showing then FDlg_Map.Panel_data_display.Hide;
  //����ٳ���
  if Fmap.GpsDrawlayer.AutoFollowDevice <> nil then
    Fmap.GpsDrawlayer.AutoFollowDevice := nil;
  //�����ͼ�ϵĳ�
  FMap.DrawGpsMap_Clear;   
  //����ǰһ�û��������ļ�
  //{$ifdef For_ConfineArea}
    //GAreaManage.SaveCurrentAreasToFile(ExtractFilePath(application.ExeName)+current_User.UserName+'_areas.ini');
  //{$endif}
  {  �Ͽ������ط�����������,���û�����������  }
  ACmdManage.ClearCmd; //ACmdManage.Free;
  DataServer.Active:=false;
  //�û��ǳ�
  bs.userlogout(current_user);
  current_user.Free;
  //�Ͽ�����
  bs.DisConnectServer ;
 
  ADevGroupManage.Clear;      //����

  ADeviceManage.ClearDevice;  //�峵��\�豸
  ACarManage.ClearCar;

  
  FDlg_Watch_Car.cxDeviceList.Clear; //FDlg_Watch_Car.listview1.Clear; //����GPS��������
  FDlg_Watch_Car.TreeView1.Items.Clear;
  FDlg_AlarmCar.cxAlarmList.Clear;
  FDlg_AlarmCar.cxStopAlarmList.Clear;
  FDlg_Sended_Cmd.cxTreeList1.Clear;   //FDlg_Sended_Cmd.ListView1.Clear ;//�ѷ�����
  FDlg_OrderList.cxOrderList.Clear;//�����б�..
  FDlg_Received_Info.cxInfoList.Clear;  //�յ����ص���Ϣ
  FDlg_OrderList.cxOrderList.Clear;

  GCurSelectDev := nil;
  GCurSelectGroupID := -1;
  //{$ifdef For_ConfineArea}
  GCurConfineArea := nil;
  GAreaManage.Clear;      //�޶����� ������
  FDlg_AlarmCar.cxOutCAreaList.Clear;
  FDlg_AlarmCar.cxOutCAreaList_History.Clear;
  FDlg_AlarmCar.cxInCAreaList.Clear;
  FDlg_AlarmCar.cxInCAreaList_History.Clear;
  FDlg_ConfineAreaList.cxAreaList.Clear;
  FDlg_ConfineAreaList.Clear_Changed;
  //{$endif}

  //if FDlg_Sended_msg.Visible then   // �ѷ������Ϣ
  //  FDlg_Sended_msg.ListViewTo.Items.Clear;

  Edit1.Text := '';
  Edit2.Text := '';
  ComboboxCarNo.Text:='';
  StatusBar1.Panels.Items[2].Text :='';
  if fun_ShowACarTrack.Checked then fun_ShowACarTrack.Checked := false; //��ʾ�켣
  if fun_watch_car.Checked then fun_watch_car.Checked := false; //����
  Dlgs_Free;//��ȥ���д���

  // �� �û���¼
  userlogin_connect(1);
  if logined then
  begin
    //---------------------------------------------------
    FFlashDlg.SetLabel('���±���ʱ��...');
    SetDatetime;
    FFlashDlg.Gauge1.AddProgress(5);
    //---------------------------------------------------
    FFlashDlg.SetLabel('�����û�Ȩ��...');
    SetPower;
    FFlashDlg.Gauge1.AddProgress(5);
    //---------------------------------------------------
    StatusBar1.Panels.Items[3].Text :='��ǰ�û�:'+current_user.userName +'����¼ʱ��:'+FormatDateTime('yy/mm/dd hh:nn',now()) ; //
    Current_User.LoginDatetime:=now;
    application.ProcessMessages ;
    try
     //--------��¼�ɹ�,�õ���ز���
      FFlashDlg.SetLabel('����ͼƬ��Դ...');
      Bs.QueryAllBitmapRes;     //������Դ
      FFlashDlg.Gauge1.AddProgress(10);
     //---------------------------------------------------
      application.ProcessMessages ;
     //---------------------------------------------------
      FFlashDlg.SetLabel('���س�����...');
      bs.DevGroupinfo(ADevGroupManage);//------ �������

      if ADevGroupManage.Count=0 then
      begin
        messagebox(handle,'�Բ��𣬵�ǰ�û�û�в鿴�κγ����Ȩ�ޣ�'+#13+#13+
          '������ϵͳ����Ա��ϵ������ϵͳ����ͻ��ˡ�Ϊ��ǰ�û������飡','��ʾ',mb_ok + mb_iconinformation);
        Application.Terminate;
        exit;
      end;
      FFlashDlg.Gauge1.AddProgress(10);
     //----------------------------------------------------
      FFlashDlg.SetLabel('���س�����Ϣ...');
      bs.CarInfo(ACarManage);       //�򿪳��� ����
     //----------------------------------------------------
      FFlashDlg.SetLabel('�����豸��Ϣ...');
      FFlashDlg.Gauge1.AddProgress(5);
//      ADeviceManage.OnClickCarAction:=OnCarActionClick;
//      ADeviceManage.PopupMenu:=PopupMenu_funDev;
      bs.DeviceInfo(ADeviceManage);//���豸 ����
      if ADeviceManage.Count=0 then
      begin
        messagebox(handle,'�Բ��𣬵�ǰ�û�û�в鿴�κγ���Ȩ�ޣ�'+#13+#10+
          '������ϵͳ����Ա��ϵ������ϵͳ����ͻ��ˡ�Ϊ��ǰ�û������飬����ӳ�����������飡','��ʾ',mb_ok + mb_iconinformation);
        Application.Terminate;
        exit;
      end;
      //---------------------------------------------------
      FFlashDlg.SetLabel('���س��ƺ���Ϣ...');
      FFlashDlg.Gauge1.AddProgress(5);
      bs.CarNoInfo(ACarNOManage);
      //---------------------------------------------------
      FFlashDlg.SetLabel('��������...');
      FFlashDlg.Gauge1.AddProgress(5);
      Connect2Gateway;   //��������
      //---------------------------------------------------
      FFlashDlg.SetLabel('���ص绰��...');
      FFlashDlg.Gauge1.AddProgress(10);
      bs.QueryDevsTelList;         //�������г����ĵ绰��

      FFlashDlg.SetLabel('���ػ�������...');
      FFlashDlg.Gauge1.AddProgress(10);
      bs.QueryDevParamOfAll;       //���س�������     //by dxf 05-09-07

      FFlashDlg.SetLabel('������ʾ���̶��˵�...');
      FFlashDlg.Gauge1.AddProgress(5);
      Bs.QueryDevsMenu;            //�������г�������ʾ���̶��˵�

      FFlashDlg.SetLabel('����ȡ���˵�...');
      FFlashDlg.Gauge1.AddProgress(5);
      ADeviceManage.LaodCancelMenu;//װ��ȡ���˵�

      FFlashDlg.SetLabel('����˾����Ϣ...');
      FFlashDlg.Gauge1.AddProgress(5);
      Bs.DriverInfo(ADriverManage);//����˾����Ϣ

      FFlashDlg.SetLabel('���ض�����Ϣ...');
      FFlashDlg.Gauge1.AddProgress(5);
      AOrderManage.LoadOrdersFromDB;
      if GlobalParam.isCarNOAndDevName then  ADeviceManage.CarNOAndDevName;//���ƺź��豸���ƺ���һ��....

      FFlashDlg.SetLabel('��ϵͳ��...');
      FFlashDlg.Gauge1.AddProgress(5);
      Dlgs_Create;
     // Dlgs_Show;
     // DataServer.GetAllPos;


      Timer.Enabled :=true;
      //�����ͼ
      tool_bird_eyeExecute(tool_bird_eye);
      //{$ifdef For_ConfineArea} //���ļ� ���� ������Ϣ��20050721��sha
      GAreaManage.LoadAreasFromFile(ExtractFilePath(application.ExeName)+current_User.UserName+'_areas.ini');
      FDlg_ConfineAreaList.LoadConfineAreas;
      //{$endif}
    finally
       FFlashDlg.Hide; //FFlashDlg.Free;  //2004-9-27
    end;               
    WindowState := wsMaximized;
    Self.Show;
    if GlobalParam.IsUseTelServer then
    begin
      TimerCall.Enabled:=TempBool;
      FCallClient.ResumeWork;
      TimerCall.Interval:=10000;
      TimerCallTimer(TimerCall);
    end;
  end
  else
    application.Terminate ;
end;

procedure TMainf.fun_view_SwitchStatExecute(Sender: TObject);//�鿴 ĳ���豸�Ľ�ͷ״̬
begin
  if not CheckDevId then exit;
  if not Panel_Clxx.Visible then
    show_car.Execute;
  ShowState(GCurSelectDev);
end;

procedure TMainf.fun_watch_carExecute(Sender: TObject);  //���ٳ���--ʹĳ��������ͼ�ı߽�
begin
  with fun_watch_car do
  begin
    if not checked then
    begin
      if not CheckDevId then exit;
      GOldFollowDev := FMap.GpsDrawlayer.AutoFollowDevice;
      if (GCurSelectDev.Longitude =0) or (GCurSelectDev.Latitude = 0) then
      begin
        messagebox(handle,'Ŀǰ�ó��޶�λ���ݣ����ܸ���!','��ʾ',mb_ok + mb_iconinformation);
        exit;
      end;
      FMap.GpsDrawlayer.AutoFollowDevice := GCurSelectDev;
      //GOldFollowDev �����û�ָ���� ���ٳ�����
      //���г�������ʱ�����ٱ������������ó�ȡ������ʱ���ָ���������û�ָ�����ٳ���GOldFollowDev
      GOldFollowDev := GCurSelectDev;
      StatusBar1.Panels.Items[2].Text :='��ǰ���ٳ�����'+GCurSelectDev.Car.No;
    end
    else
    begin
      FMap.GpsDrawlayer.AutoFollowDevice := nil;
      GOldFollowDev := nil;
      StatusBar1.Panels.Items[2].Text :='';
    end;
    checked :=not checked;
  end;  
end;

procedure TMainf.SetWindowStat(ws: TWindowState);
begin
  if ws = wsMinimized  then
  begin
    windowState  := ws;
  end
  else
  begin
    WindowState:= ws;//��󻯱���� ����
  end;
end;

procedure TMainf.fun_view_DevParamExecute(Sender: TObject);
begin
  {$ifdef ForAddEKey}
  ConnectedEkey_monitor;
  {$endif}
  if not CheckDevId then
  begin
   messagebox(0,'���ȡ��ڼ�س����б�ѡ�С��������Ͻ����롷����!','��ʾ',mb_ok + mb_iconinformation);
   exit;
  end;
  if ReadParamFrm =nil then ReadParamFrm:=TParamReadFrm.Create(Self);
  ReadParamFrm.Show;
end;

procedure TMainf.TimerTimer(Sender: TObject);
begin
try
    RefreshSeverStat;//ˢ��ҵ������ص�״̬..��״̬դ�����ұ�����ͼ��,��ɫΪ����,��ɫΪ����.
    isOnline;
    if FDlg_Watch_Car.Floating       then FDlg_Watch_Car.Refresh_WatchCar;
    if FDlg_Sended_Cmd.Floating      then FDlg_Sended_Cmd.Refresh_SendedCmd;
    if FDlg_AlarmCar.Floating        then FDlg_AlarmCar.Refresh_AlarmCar;
    if FDlg_ConfineAreaList.Floating then FDlg_ConfineAreaList.ListCurrConfine_Devs;
    if FDlg_OrderList.Floating       then FDlg_OrderList.RefreshOrderList;
  if PageControlBottom.ActivePage.Caption ='�����б�' then
  begin
    FDlg_Watch_Car.Refresh_WatchCar;
  end
  else if PageControlBottom.ActivePage.Caption ='���������б�' then
  begin
    FDlg_Sended_Cmd.Refresh_SendedCmd;
  end
  else if PageControlBottom.ActivePage.Caption ='���������б�' then
  begin
    FDlg_AlarmCar.Refresh_AlarmCar;
  end
  else if PageControlBottom.ActivePage.Caption ='����Χ���б�' then
  begin
    FDlg_ConfineAreaList.ListCurrConfine_Devs;
  end
  else if PageControlBottom.ActivePage.Caption  ='���Ͷ����б�'  then
  begin
    FDlg_OrderList.RefreshOrderList;
  end;

  if (GCurSelectDev<> nil)and(not FMap.IsPlayGpsData) then ShowState(GCurSelectDev);

except  on E: Exception do
    uGloabVar.SystemLog.AddLog(' TMainf.TimerTimer��������: ',e.Message);
end;

end;

procedure TMainf.Edit1Change(Sender: TObject);
var
 i:integer;
begin
//  if FMap.IsPlayGpsData then exit;
  if trim(edit1.Text) ='' then
  begin
    ListDevice.Cells[1,1] := '';
    ListDevice.Cells[1,2] := '';
    ListDevice.Cells[1,3] := '';
    ListDevice.Cells[1,4] := '';
    ListDevice.Cells[1,5] := '';
    ListDevice.Cells[1,6] := '';
    ListDevice.Cells[1,7] := '';
    ListDevice.Cells[1,8] := '';

    exit;
  end;
    edit1.text:=trim(edit1.text);
  //��������û��ֶ�����
  if (FdevKeyIn) then
  begin
    FDevKeyIn:=false;
    GCurSelectDev:= ADeviceManage.FindDevFromCarNo(edit1.text);
    if (GCurSelectDev<>nil) then
    begin
      edit2.Text := IntToStr(GCurSelectDev.id);
      if not( (GCurSelectDev.Longitude=0 ) and (GCurSelectDev.Latitude=0 )) then
      begin
        fun_Locate_Car.Execute;
      end;
    end
    else
    begin
     for i:=0 to ADeviceManage.Count-1 do
     begin
       if ADeviceManage.Items[i].DispLabel=edit1.text then
       begin
         GCurSelectDev:= ADeviceManage.Items[i];
         break;
       end;
     end;
      if GCurSelectDev =nil then
      begin
        if  (Edit1.Text<>'') then
        ListDevice.Cells[1,1] :='�޴˳�����Ȩ�޲鿴�ó�';
        ListDevice.Cells[1,2] := '';
        ListDevice.Cells[1,3] := '';
        ListDevice.Cells[1,4] := '';
        ListDevice.Cells[1,5] := '';
        ListDevice.Cells[1,6] := '';
        ListDevice.Cells[1,7] := '';
        ListDevice.Cells[1,8] := '';
        exit;
      end;
    end;
  end;

  if GCurSelectDev= nil then exit;
  edit1.Text:=GCurSelectDev.Car.No;
  ComboBoxCarNO.Text:=GCurSelectDev.Car.No;
  ShowDeviceTrack_Watch(GCurSelectDev);//�Ƿ���ʾ�켣 ���Ƿ񱻸���

  //������ϸ��Ϣ
  ListDevice.Cells[1,1] := GCurSelectDev.DispLabel;
  ListDevice.Cells[1,2] := GCurSelectDev.SimNo;
  ListDevice.Cells[1,3] := GCurSelectDev.DriverNameTeL;//ADriverManage.GetDriver(GCurSelectDev).Name;
  ListDevice.Cells[1,4] := ADevGroupManage.find(GCurSelectDev.GroupID).Name ;
  ListDevice.Cells[1,5] := GCurSelectDev.Car.CarType;
  ListDevice.Cells[1,6] := GCurSelectDev.Car.Memo;



  ShowState(GCurSelectDev);
  Edit1.SelectAll;
  for i:=0 to FDlg_Watch_Car.cxDeviceList.Count-1 do
  begin
    if GCurSelectDev=TDevice(FDlg_Watch_Car.cxDeviceList.Items[i].Data) then
    begin
      FDlg_Watch_Car.cxDeviceList.Items[i].Focused:=true;
      break;
    end;
  end;
end;

function TMainf.CheckDevId:boolean;
begin
  result:= false;
  if (trim(edit1.text)='') or (trim(edit2.Text)='')or (GCurSelectDev = nil) then
    //messagebox(0,'���ȡ��ڼ�س����б�ѡ�С��������Ͻ����롷����!',
    //  '��ʾ',mb_ok + mb_iconinformation)
  else
    result:= true;
end;



procedure TMainf.fun_DevStatExecute(Sender: TObject);
begin
  if not CheckDevId then exit;
  DataServer.GetStat(GCurSelectDev.Id);
end;

procedure TMainf.TrackBarOutlookChange(Sender: TObject);
begin
  {$ifdef ForOutLook}
  FOutLook.ZoomRatio := TrackBarOutlook.Position;
  FOutLook.Draw;
  {$endif}
end;


procedure TMainf.Panel_MapResize(Sender: TObject);
begin
  if  FDlg_Map.Panel_data_display.Showing then
  begin
      FDlg_Map.Panel_data_display.top  := FDlg_Map.Panel_Map.Height - FDlg_data_display.Height;
      FDlg_Map.Panel_data_display.Left := FDlg_Map.Panel_Map.Width  - FDlg_data_display.Width;
  end;          
end;

procedure TMainf.help_skin1Execute(Sender: TObject);
begin
  GlobalParam.SkinName := '..\skins\alien.mskn';
end;

procedure TMainf.help_skin2Execute(Sender: TObject);
begin
  GlobalParam.SkinName := '..\skins\devoir.mskn';
end;

procedure TMainf.help_skin3Execute(Sender: TObject);
begin
  GlobalParam.SkinName := '..\skins\Kromo_zone.mskn';
end;

procedure TMainf.help_skin4Execute(Sender: TObject);
begin
  GlobalParam.SkinName := '..\skins\xp_stead.mskn';
end;

procedure TMainf.cmd_cancelExecute(Sender: TObject);
var
  p: PCmdInfo;
begin
  if FDlg_Sended_Cmd.cxTreeList1.FocusedNode = nil  then exit;
  p := FDlg_Sended_Cmd.cxTreeList1.FocusedNode.Data ;
  if (p^.State = CMD_SNDNODO) or (p^.State = CMD_RESND) then//0--�ѷ���δִ�У�6--�ط�
  begin
    DataServer.CancelCmd(p^.Id);
  end
  else
    MessageBox(Handle,pchar('�Բ���'+p^.Desc+'�����������ȡ��'),'��ʾ',MB_OK+MB_ICONINFORMATION);

end;

procedure TMainf.cmd_reSendExecute(Sender: TObject);
var
  p: PCmdInfo;
begin
  if FDlg_Sended_Cmd.cxTreeList1.FocusedNode = nil  then exit;
  p := FDlg_Sended_Cmd.cxTreeList1.FocusedNode.Data ;
  DataServer.RepeatSend(p^.Id);
end;

procedure TMainf.DataServer_SendMsg(var message: TMessage);  //������Ϣ�����.
begin
  FDlg_Received_Info.cxInfoList.BeginUpdate;
  with FDlg_Received_Info.cxInfoList.Add  do //���յ����������͵�֪ͨ��Ϣ
  begin
      Values[0]:='';//ADeviceManage.FindToCarNO(Message.WParam);
      Values[1]:=now;
      Values[2]:=ReturnMsgTypeState(Message.LParam);
      Values[3]:=DataServer.ServerSendMsg;
  end;
  FDlg_Received_Info.cxInfoList.EndUpdate;
end;



procedure TMainf.tool_layer_controlExecute(Sender: TObject);
var dlg:TLayer_control;
    m: IMap;
begin
  dlg:= TLayer_control.Create(Self);

  m := TMapCtrl.Create(FMap);
  try
    dlg.InitMap(m);
    dlg.Edit3.Text:=IntToStr(FMap.DrawCood.Scale)+'.00';
    dlg.ShowModal ;
    if dlg.ModalResult = mrOk then
    begin
      FMap.Layers.SetOrder(ADeviceManage.ShengLayer,FMap.Layers.Count-1);
      FMap.Layers.SetOrder(ADeviceManage.ShiLayer,FMap.Layers.Count-2);
      FMap.Layers.SetOrder(ADeviceManage.XianLayer,FMap.Layers.Count-3);

      FMap.Layers.SetOrder(drawlayer,0);//dxf ��GPSͼ�㵽��0�㡣
      FMap.Layers.SetOrder(TextLayer,1);
      FMap.Layers.SetOrder(userDrawLayer,2);
      FMap.Draw;
    end;
      
  finally
    dlg.Free;
  end;
end;



procedure TMainf.fun_Set_DevParamExecute(Sender: TObject);  //�޸��豸����
begin
  {$ifdef ForAddEKey}
  ConnectedEkey_monitor;
  {$endif}

  if not CheckDevId then
  begin
   fun_Devs_SetParamExecute(Sender);
   exit;
  end;
  if ParamAllFrm = nil then
    ParamAllFrm:= TParamAllFrm.Create(self);
  paramAllFrm.ListView1.PopupMenu := PopupMenu_SelectDevs;
  FListView_SelectDevs := paramAllFrm.ListView1;
  Add_A_Device;
  ParamAllFrm.Show;
end;

procedure TMainf.DevNotifyStat(var message: TMessage);
var devId:integer;
begin
  devId:= message.WParam ;
  if messagebox(handle,'�豸�������иı䣬�Ƿ����ھ͸��£�','��ʾ',mb_yesno+ MB_ICONQUESTION )= ID_YES then
    RefeshADev(devId);
end;

procedure TMainf.RefeshADev(const DevId: integer);
var
  followDevId,oldFollowDevId,currDevId:integer;
  dev : TDevice;
  dlg : TFrmRefreshProgress;
  i:integer;
begin
  dlg:= TFrmRefreshProgress.Create(Self); //=====�� ��Ϊ�������г�������
    Timer.Enabled := false;
    FMap.EnableTimer(False);
  try
    Screen.Cursor := crHourGlass;
    dlg.Show;
    dlg.Gauge1.AddProgress(10);
    bs.DisConnectServer;
    Application.ProcessMessages;
    bs.ConnectServer;
    if not bs.Active then
    begin
      popmsg('������ʾ','ˢ��ʧ��!');
      exit;
    end;
    //-----�ݴ� ���ٳ����͵�ǰ������ID����Ϊ�п��� ���ٳ����͵�ǰ�����ᱻɾ����
    followDevId := -1;
    oldFollowDevId := -1;
    currDevId:= -1;
    if Fmap.GpsDrawlayer.AutoFollowDevice <> nil then
    begin
      followDevId := FMap.GpsDrawlayer.AutoFollowDevice.Id;
      if GOldFollowDev <> nil then oldFollowDevId := GOldFollowDev.Id;
    end;
    if GCurSelectDev <> nil then
      currDevId:= GCurSelectDev.Id;
    dlg.Gauge1.AddProgress(10);
    ADevGroupManage.Clear ;          //�����
    ACarManage.ClearCar ;            //��
    //GAreaManage.Clear;             //�޶����� ������
    ResManage.Clear;

    FDlg_Watch_Car.cxDeviceList.FocusedNode := nil; //���
    FDlg_Watch_Car.cxDeviceList.Clear;
    FDlg_Sended_Cmd.cxTreeList1.FocusedNode := nil;
    FDlg_Sended_Cmd.cxTreeList1.Clear;
    FDlg_ConfineAreaList.cxDeviceList.FocusedNode := nil; //���
    FDlg_ConfineAreaList.cxDeviceList.Clear;

    dlg.Gauge1.AddProgress(10);
    bs.QueryAllBitmapRes;             //����ͼƬ
    dlg.Gauge1.AddProgress(10); //40
    bs.CarInfo(ACarManage);           //���س�����Ϣ
    dlg.Gauge1.AddProgress(10); //50
    bs.DevGroupinfo(ADevGroupManage); //���ط�����Ϣ
    dlg.Gauge1.AddProgress(10); //60
    bs.Reload_DeviceInfo(ADeviceManage);//�������복��������û�еĻ�ǰ�û���Ȩ�鿴�������ӹ�������ɾ��

    dlg.Gauge1.AddProgress(5);  //70
    {$IFDEF ForTestUser}
    Bs.QueryDevsTelList;            //�������г����ĵ绰��
    dlg.Gauge1.AddProgress(5);
    Bs.QueryDevsMenu;               //�������г�������ʾ���̶��˵�
    dlg.Gauge1.AddProgress(5);
    ADeviceManage.LaodCancelMenu;  //����ȡ���˵�
    dlg.Gauge1.AddProgress(5);
    BS.QueryDevParamOfAll;          //���س�������
    dlg.Gauge1.AddProgress(5); //80
    ADriverManage.ClearDriver;
    Bs.DriverInfo(ADriverManage);   //����˾����Ϣ
    ADeviceManage.CreateDriverNameTel;
    //{$ifdef For_ConfineArea}
    //���������б��еĳ�
    //----��������б仯(����Ա�ɾ�����ĳ�����)���������еĸó���IDɾ����
    //----��Ϊ�����Ѿ������������������IDΪ-1���ֽ�����ID����
    GAreaManage.Refresh_DevChanged;
    {$endif}
    dlg.Gauge1.AddProgress(10);//90;
    if ADevGroupManage.Find(GCurSelectGroupID)= nil then //--����
      GCurSelectGroupID := -1;
    FDlg_Watch_Car.List_TreeGroup;  //��ʾ������(��)


    dlg.Gauge1.AddProgress(5);
    dev:= ADeviceManage.Find(followDevId);  //---�ָ� ���ٳ���
    if  dev= nil then
    begin
      FMap.GpsDrawlayer.AutoFollowDevice := nil;
      GOldFollowDev := nil;
      StatusBar1.Panels.Items[2].Text :='';
    end
    else
    begin
      FMap.GpsDrawlayer.AutoFollowDevice := dev;
      dev:= ADeviceManage.Find(oldFollowDevId);
      if dev = nil then
        GOldFollowDev := nil
      else
        GOldFollowDev := dev;
    end;

    FDlg_AlarmCar.UserRefresh_IfDevDeleted_CheckCAList;//�û�ˢ�����ݣ������г���ɾ���ˡ���鲢ɾ��Խ�缰ʻ���б��� �ѱ�ɾ���ĳ�����Ϣ
    FMap.DrawGpsMap_ClearDraw;

    dlg.Gauge1.AddProgress(10);// 100;
    GCurSelectDev:= ADeviceManage.Find(currDevId);//---�ָ� ��ǰ����
    if GlobalParam.isCarNOAndDevName then  ADeviceManage.CarNOAndDevName;//���ƺź��豸���ƺ���һ��....

    if GCurSelectDev<>nil then
    begin
      Edit2.Text := IntToStr(GCurSelectDev.Id);
      Edit1.Text := GCurSelectDev.Car.No;
      for i:=0 to FDlg_Watch_Car.cxDeviceList.Count-1 do
      begin
        if TDevice(FDlg_Watch_Car.cxDeviceList.Items[i].Data)=GCurSelectDev then
         begin
           FDlg_Watch_Car.cxDeviceList.Items[i].Selected :=true;
           break;
         end;
      end;
    end
    else
    begin
      Edit1.Text := '';
      Edit2.Text := '';
    end;
   //DataServer.GetAllPos;
  finally
    Screen.Cursor := crDefault;
    FMap.EnableTimer(True);
    Timer.Enabled := True;
    dlg.Free;
  end;
end;

procedure TMainf.fun_refresh_all_devExecute(Sender: TObject);   //�������г�������
begin
 fun_refresh_all_dev.Enabled:=false;
 fun_refresh_all_dev.Update;
 try
  RefeshADev(0);
 finally
    fun_refresh_all_dev.Enabled:=true;
 end;
end;

{procedure TMainf.DevToHostString(var message: TMessage);
begin
  with FDlg_Received_Info.cxInfoList.Add  do //���յ����������͵�֪ͨ��Ϣ
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
  if Bs<>nil then
  begin
    if Bs.Active then
      StatusBar1.Panels.Items[4].ImageIndex :=3
    else
    begin
      StatusBar1.Panels.Items[4].ImageIndex := 4;
    end;
    MemoBs.Text:='ҵ��:'+Bs.Socket.Host+':'+IntToStr(Bs.Socket.Port);
  end;
  if DataServer<> nil then
    if DataServer.Active then
    begin
        StatusBar1.Panels.Items[5].ImageIndex :=3
    end
    else
    begin
       StatusBar1.Panels.Items[5].ImageIndex :=4;
       if DataServer.Socket.DisConnectCount >3  then
       begin
          try
               uGloabVar.SystemLog.AddLog('��ʼ���´�������...');
               DataServer.Active:=false;
               DataServer.Socket.Active:=false;
               DataServer.Free;
               Connect2Gateway;
               uGloabVar.SystemLog.AddLog('���´������سɹ�');
          except  on E: Exception do
             begin
               uGloabVar.SystemLog.AddLog('���´�������ʧ��',e.Message);
             end;
          end;

       end;

    end;
    MemoGateWay.Text:='����:'+DataServer.Socket.Host+':'+IntToStr(DataServer.Socket.Port);
except  on E: Exception do
    uGloabVar.SystemLog.AddLog(' RefreshSeverStat��������: ',e.Message);
end;



  if not GlobalParam.IsUseTelServer  then
  begin
    if TimerCall.Enabled then TimerCall.Enabled:=false;
    if StatusBar1.Panels.Items[6].Width<>0 then StatusBar1.Panels.Items[6].Width:=0; 
  end
  else
  begin
    if StatusBar1.Panels.Items[6].Width=0 then StatusBar1.Panels.Items[6].Width:=52;
    if FCallClient.Work then
      StatusBar1.Panels.Items[6].ImageIndex :=3
    else
     begin
       StatusBar1.Panels.Items[6].ImageIndex:=4;
       TimerCall.Enabled:=true;
     end;  
  end;
end;


procedure TMainf.fun_Locate_CarExecute(Sender: TObject); //ʹĳ��λ�þ��ڵ�ͼ����
var
  ep: TEarthPoint;
  wp: TWorldPoint;
begin
  if not CheckDevId then
  begin
   //PopMsg('��ʾ','���ȡ��ڼ�س����б�ѡ�С��������Ͻ����롷����');
   messagebox(0,'���ȡ��ڼ�س����б�ѡ�С��������Ͻ����롷����!','��ʾ',mb_ok + mb_iconinformation);
   exit;
  end;
  ep.Longitude := GCurSelectDev.Longitude;
  ep.Latitude := GCurSelectDev.Latitude;
  if  (ep.Longitude=0 ) and (ep.Latitude=0 ) then
    PopMsg('��ʾ','�Բ��𣬴˳�û��GPS����!�޷���λ!')
   // messagebox(handle,'�Բ������ڸó�û��GPS����!�޷���λ!','��ʾ',mb_ok + mb_iconinformation)
  else
  begin
    if GlobalParam.isAutoChangeMap then fun_ChangeMap.Execute;
    wp := FMap.Projection.LoLa2XY(ep);
    FMap.Zoom(1,wp);
    FMap.Draw;
  end;
end;

procedure TMainf.fun_Locate_CarExecute_rundata(); //ʹĳ��λ�þ��ڵ�ͼ����
var
  ep: TEarthPoint;
  wp: TWorldPoint;
  sp:Tpoint;
begin
  ep.Longitude := GCurSelectDev_rundata.Longitude;
  ep.Latitude := GCurSelectDev_rundata.Latitude;
  wp :=  FMap.Projection.LoLa2XY(ep);
  {//�л���ͼ
  FindMapName(playDev, wp);
  fun_ChangeMap.Execute;     }
  if GlobalParam.isAutoChangeMap then fun_ChangeMap.Execute;
  if not GeometryCalc.PointInRect(wp, FMap.DrawCood.WorldRect) then
  begin
     FMap.Zoom(1,wp);
     FMap.Draw;
  end;
  sp := FMap.DrawCood.ConvertSP(wp);
  FMap.TmpDraw.Canvas.Pen.Color := clred;
  FMap.TmpDraw.Canvas.Pen.Width := 3;
  FMap.TmpDraw.Canvas.Pen.Mode := pmMask;
  FMap.DrawTempEllipseAndText(sp.x,sp.y,'�¿͵ص�');
{if not CheckDevId then
  begin
   //PopMsg('��ʾ','���ȡ��ڼ�س����б�ѡ�С��������Ͻ����롷����');
   messagebox(0,'���ȡ��ڼ�س����б�ѡ�С��������Ͻ����롷����!','��ʾ',mb_ok + mb_iconinformation);
   exit;
  end;
  ep.Longitude := GCurSelectDev_rundata.Longitude;
  ep.Latitude := GCurSelectDev_rundata.Latitude;
  if  (ep.Longitude=0 ) and (ep.Latitude=0 ) then
    PopMsg('��ʾ','�Բ��𣬴˳�û��GPS����!�޷���λ!')
   // messagebox(handle,'�Բ������ڸó�û��GPS����!�޷���λ!','��ʾ',mb_ok + mb_iconinformation)
  else
  begin
    if GlobalParam.isAutoChangeMap then fun_ChangeMap.Execute;
    wp := FMap.Projection.LoLa2XY(ep);
    FMap.TmpDraw.Canvas.Pen.Color := clred;
    FMap.TmpDraw.Canvas.Pen.Width := 3;
    FMap.TmpDraw.Canvas.Pen.Mode := pmMask;
    FMap.DrawTempEllipseAndText(wp.x,wp.y,'�¿͵ص�');
    FMap.Zoom(1,wp);
    FMap.Draw;
  end; }
end;

procedure TMainf.fun_ChangeMapExecute(Sender: TObject);
var
  mapNode:TMapNode;
begin
  {if not CheckDevId then
  begin
   messagebox(0,'���ȡ��ڼ�س����б�ѡ�С��������Ͻ����롷����!','��ʾ',mb_ok + mb_iconinformation);
   exit;
  end;   }
 { if  (GCurSelectDev.Longitude=0 ) and (GCurSelectDev.Latitude=0 ) then
  begin
    PopMsg('��ʾ','�Բ��𣬴˳�û��GPS����!�޷��л���Ӧ�ĵ�ͼ!');
    exit;
  end;    }

  mapNode:=MapManger.Find(GCurSelectDev.XianName);
  if MapNode<>nil then
  begin
    //ChangeMap(mapNode,true,true);
    ChangeMap(mapNode);
    //fun_Locate_Car.Execute;
    exit;
  end;
  if GCurSelectDev.ShiName<>GCurSelectDev.XianName then
  begin
    mapNode:=MapManger.Find(GCurSelectDev.ShiName);
    if MapNode<>nil then
    begin
      //ChangeMap(mapNode,true,true);
      ChangeMap(mapNode);
      //fun_Locate_Car.Execute;
      exit;
    end;
  end;
  mapNode:=MapManger.Find(GCurSelectDev.ShengName);
  if MapNode<>nil then
  begin
    //ChangeMap(mapNode,true,true);
    ChangeMap(mapNode);
    //fun_Locate_Car.Execute;
    exit;
  end;
  //ChangeMap(MapManger.RootNode);
  //PopMsg('��ʾ','�Բ���û���ҵ��˳���Ӧ�ĵ�ͼ!');
end;

procedure TMainf.fun_watch_cancelExecute(Sender: TObject);//ȡ������
begin
  FMap.GpsDrawlayer.AutoFollowDevice := nil;
  StatusBar1.Panels.Items[2].Text :='';
  fun_watch_cancel.Enabled := false;
end;

procedure TMainf.ApplicationEventsException(Sender: TObject; E: Exception);
begin
  messagebox(0,pchar(e.Message ),'��ʾ',mb_ok + mb_iconinformation);   
  exit;
end;

procedure TMainf.FMapMeasure(Sender: TObject; Distance, TotalDistance,
  Area: Double; Flag: Integer);
var
  s: string;
begin
  s := '����:';
  s := s + Format('%n��',[Distance]);
  if TotalDistance<>0 then
    s := s + ';�ܾ���:' + Format('%n��',[TotalDistance]);
  if Flag = 1 then
    s := s + ';���:' + Format('%nƽ����',[Area]);
  StatusBar1.Panels[2].Text := s;     
end;

procedure TMainf.set_AllCarTrackExecute(Sender: TObject);
var dlg:TSet_carTrack;
begin
  dlg := Tset_CarTrack.Create(self);
  try
    dlg.ShowModal ;
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
    OpenDialog1.Filter :='*.tyo|*.tyo';
    OpenDialog1.Options :=  OpenDialog1.Options +[ofAllowMultiSelect];
    if OpenDialog1.Execute then
    begin
      r.Left   := FMap.DrawCood.WorldRect.Left;
      r.Right  := FMap.DrawCood.WorldRect.Right;
      r.Top    := FMap.DrawCood.WorldRect.Top;
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

procedure TMainf.map_CloseLayerExecute(Sender: TObject); //�ر�ͼ��
var i:integer;
    dlg:TMap_layer;
    r: TWorldRect;
begin
  dlg:= Tmap_layer.Create(self);
    try
      dlg.ListBox1.Clear;
      for i:=0 to Fmap.Layers.Count  - 1  do
        //if not Fmap.Layers.Layer[i].isHaveNotDelete then
          dlg.ListBox1.Items.Add(Fmap.Layers.Layer[i].LayerName);
      dlg.Caption := 'ɾ��ͼ��';
      dlg.bitbtn1.caption:='ɾ��ͼ��';
      r.Left   := FMap.DrawCood.WorldRect.Left;
      r.Right  := FMap.DrawCood.WorldRect.Right;
      r.Top    := FMap.DrawCood.WorldRect.Top;
      r.Bottom := FMap.DrawCood.WorldRect.Bottom;
      dlg.ShowModal;
      if dlg.ModalResult = mrOk then
      begin
        i:=0;
        while i< dlg.ListBox1.Count do //
        begin
          if dlg.ListBox1.Selected[i] Then
          begin
            if not FMap.Layers.Layer[i].isHaveNotDelete then
            begin
              FMap.Layers.Layer[i].Data.Close;
              dlg.ListBox1.Items.Delete(i);
            end
            else
            begin
              messagebox(handle,pchar(dlg.ListBox1.Items.Strings[i]+'����ɾ��!'),'��ʾ',mb_ok + mb_iconinformation);
              i:= i+1;
            end;
          end
          else
            i:= i+1;
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
    Checked:= not Checked;
    GCurSelectDev.DrawTrack := Checked;
  end;
end;

procedure TMainf.ShowDeviceTrack_Watch(Adev:Tdevice);
begin
  //--- �Ƿ���ʾ�켣
  fun_ShowACarTrack.Checked := Adev.DrawTrack;
  //---�Ƿ񱻸���
  fun_watch_car.Checked := FMap.GpsDrawlayer.AutoFollowDevice= Adev;
  fun_devhide.Checked:=ADev.Hide;
end;

procedure TMainf.fun_sendToDTEExecute(Sender: TObject);
var
  dlg: Tset_SendToDTE_Data;
  i,dataLen:integer;
  str1:string;
  arrData:array of byte;
begin
  {$ifdef ForAddEKey}
  ConnectedEkey_monitor;
  {$endif}
  if not CheckDevId then exit;

  dlg:= Tset_SendToDTE_Data.Create(self);
  try
    dlg.Memo1.Lines.Clear;
    dlg.Width := dlg.Panel_basic.Width;
    dlg.BitBtn1.Left := (dlg.Width - dlg.BitBtn1.Width - dlg.BitBtn2.Width)div 2;
    dlg.BitBtn2.Left := dlg.BitBtn1.Left + dlg.BitBtn1.Width;
    dlg.ShowModal;
    if dlg.ModalResult = mrOk then
    begin
      str1:= trim(dlg.Memo1.Text);
      str1:= DelInvalidStr(str1);  // ȥ����Ч�ַ�
      dataLen := length(str1);
      setlength(arrData,dataLen);
      for i := 0 to dataLen-1 do
        arrData[i]:= ord(str1[i+1]);
      DataServer.SendToDTE(GCurSelectDev.Id,@arrData[0]);
    end;
  finally
    dlg.Free;
  end;
end;

procedure TMainf.RegUserError2Gateway(var message: TMessage);
var
  num:integer;
  s:string;
begin
  num:= message.WParam;
  case num of
    ERR_INVALIDUSER  : StatusBar1.Panels.Items[2].Text := '��Ч���û����ظ���¼���ط�����';
    ERR_INVALIDPASSWD: StatusBar1.Panels.Items[2].Text := '��Ч�������¼���ط�����';
    ERR_Logged       :
                     begin
                       s:='['+current_user.UserName+']�ڱ�һ����¼���ط�����';
                       StatusBar1.Panels.Items[2].Text :=s;
                       messagebox(handle,pchar(s),'��ʾ',mb_ok + mb_iconinformation);
                       //sys_off.Execute;
                     end;
    ERR_INVALIDVER   : StatusBar1.Panels.Items[2].Text := '��Ч�İ汾��,���ط�����������汾��:'
      + inttostr(DataServer.ComVer.MajorVer)+'.'+inttostr(DataServer.ComVer.MinorVer);
  end;
  PopMsg('���ش���',StatusBar1.Panels.Items[2].Text);
end;

procedure TMainf.show_Sended_MessageExecute(Sender: TObject);
var
  i: integer;
begin
  with (Sender as TAction) do
  begin
    Checked := not Checked;
    if Checked then
    begin
      if (not FDlg_OrderList.Visible) or (FDlg_OrderList.Floating) then
      begin
        FDlg_OrderList.ManualDock(PageControlBottom,nil,alLeft);
        FDlg_OrderList.Show;
        for i:= 0 to PageControlBottom.PageCount-1 do
          if PageControlBottom.Pages[i].Caption = '���Ͷ����б�' then
          begin
            PageControlBottom.ActivePageIndex := i;
            break;
          end;
      end;
    end
    else
    begin
      FDlg_OrderList.ManualDock(nil);
      FDlg_OrderList.Hide;
    end;
  end;
end;

procedure TMainf.set_AlarmSoundExecute(Sender: TObject);//���ñ�������
var
  dlg: TsetAlarmSound;
begin
  //If not HasPrivilege(PRI_LOCALSET) Then exit;
  dlg := TsetAlarmSound.Create(self);
  try
    SetCurrentDir(ExtractFilePath(Application.ExeName));
    dlg.Edit_DevAlarmSound.Text      := ExpandFileName(GlobalParam.DevAlarmSound);
    dlg.Edit_OutCAreaAlarmSound.Text := ExpandFileName(GlobalParam.AlarmSound_OutCArea);
    dlg.Edit_InCAreaAlarmSound.Text  := ExpandFileName(GlobalParam.AlarmSound_InCArea);
    dlg.Edit_OverSpeedAlarmSound.Text:= ExpandFileName(GlobalParam.AlarmSound_OverSpeet);
    dlg.Edit_CarUnOnlineAlarmSound.Text:=ExpandFileName(GlobalParam.AlarmSound_CarUnOnline);
    dlg.Edit_MenuSound.Text:=ExpandFileName(GlobalParam.MenuSound);
    dlg.ShowModal;
    if dlg.ModalResult = mrOk then
    begin
      GlobalParam.DevAlarmSound       := ExtractRelativePath(Application.ExeName,trim(dlg.Edit_DevAlarmSound.Text));
      GlobalParam.AlarmSound_OutCArea := ExtractRelativePath(Application.ExeName,trim(dlg.Edit_OutCAreaAlarmSound.Text));
      GlobalParam.AlarmSound_InCArea  := ExtractRelativePath(Application.ExeName,Trim(dlg.Edit_InCAreaAlarmSound.Text));
      GlobalParam.AlarmSound_OverSpeet :=ExtractRelativePath(Application.ExeName,Trim(dlg.Edit_OverSpeedAlarmSound.Text));
      GlobalParam.AlarmSound_CarUnOnline:=ExtractRelativePath(Application.ExeName,Trim(dlg.Edit_CarUnOnlineAlarmSound.Text));
      GlobalParam.MenuSound:=ExtractRelativePath(Application.ExeName,Trim(dlg.Edit_MenuSound.Text));
      GlobalParam.SaveToFile(Application.ExeName+'.config');
    end;
  finally
    dlg.Free;
  end;
end;

procedure TMainf.Msg_DevAlarm(var message: TMessage);  //��������
var
  str  : string;
  i,devId  : integer; //
begin

  if GlobalParam.IsAlarmFollow then   //�Ե�ǰ������������
  begin
    devId := message.WParam;
    FMap.GpsDrawlayer.AutoFollowDevice := ADeviceManage.Find(devId);
    StatusBar1.Panels.Items[2].Text :='���ٱ���������'+ FMap.GpsDrawlayer.AutoFollowDevice.Car.No;
  end;
  //cph:= ADeviceManage.Find(devId).Car.No;
  //messagebox(handle,pchar('���г���'+cph+'����!'),'��ʾ',mb_ok + mb_iconinformation);
  //��������
  if GlobalParam.DevAlarmSound ='' then
  begin
    //������ ����
    //for I:=100 to 150 Do DoBleep(I*10,10);
    //for I:=150 Downto 100 Do DoBleep(I*10,10);
  end
  else
    try
      SetCurrentDir(ExtractFilePath(Application.ExeName));
      str := ExpandFileName(GlobalParam.DevAlarmSound);
      if FileExists(str) then
         PlaySound(pchar(str),Hinstance,SND_FILENAME);
    except
      //������ ����
      //for I:=100 to 150 Do DoBleep(I*10,10);
      //for I:=150 Downto 100 Do DoBleep(I*10,10);
    end;
end;

procedure TMainf.show_ListCarExecute(Sender: TObject);
var
  i:Integer;
begin
  with (Sender as TAction) do
  begin
    Checked := not Checked;
    if Checked then
    begin
      if (not FDlg_Watch_Car.Showing) or (FDlg_Watch_Car.Floating) then
      begin
        i:=0;
        while i<PageControlBottom.PageCount do
        begin
          if PageControlBottom.Pages[i].Caption = '�����б�' then
          begin
            PageControlBottom.Pages[i].Destroy;
          end
          else
          begin
            inc(i);
          end;
        end;
        //FDlg_Watch_Car.Parent:=nil;
        FDlg_Watch_Car.ManualDock(PageControlBottom,nil,alLeft);
        FDlg_Watch_Car.Show;
        for i:= 0 to PageControlBottom.PageCount-1 do
          if PageControlBottom.Pages[i].Caption = '�����б�' then
          begin
            PageControlBottom.ActivePageIndex := i;
            break;
          end;
      end;
    end
    else
    begin    
      FDlg_Watch_Car.ManualDock(nil);
      FDlg_Watch_Car.Hide;
    end;
  end;
end;

procedure TMainf.show_sended_commandExecute(Sender: TObject);
var
  i: integer;
begin
  with (Sender as TAction) do
  begin
    Checked := not Checked;
    if Checked then
    begin
      if (not FDlg_Sended_Cmd.Showing) or (FDlg_Sended_Cmd.Floating) then
      begin
        FDlg_Sended_Cmd.ManualDock(PageControlBottom,nil,alLeft);
        FDlg_Sended_Cmd.Show;
        for i:= 0 to PageControlBottom.PageCount-1 do
          if PageControlBottom.Pages[i].Caption = '��������' then
          begin
            PageControlBottom.ActivePageIndex := i;
            break;
          end;
      end;
    end
    else
    begin
      FDlg_Sended_Cmd.ManualDock(nil);
      FDlg_Sended_Cmd.Hide;
    end;
  end;
end;

procedure TMainf.show_Received_InfoExecute(Sender: TObject);
var
  i:Integer;
begin
  with (Sender as TAction) do
  begin
    Checked := not Checked;
    if Checked then
    begin
      if (not FDlg_Received_Info.Showing) or (FDlg_Received_Info.Floating) then
      begin
        FDlg_Received_Info.ManualDock(PageControlBottom,nil,alLeft);
        FDlg_Received_Info.Show;
        for i:= 0 to PageControlBottom.PageCount-1 do
          if PageControlBottom.Pages[i].Caption = '������Ϣ' then
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
  end;
end;

procedure TMainf.set_SaveWorkShopExecute(Sender: TObject);
begin
  {$ifdef ForAddEKey}
  ConnectedEkey_monitor;
  {$endif}
  //If not HasPrivilege(PRI_LOCALSET) Then exit;
  //����һ�����صĵ�ǰ�����ļ���Ϊϵͳ����Ա�������ļ���ģ��
  SaveWS;
  Map_Save.Execute;
  GlobalParam.SaveToFile(Application.ExeName+'.config');
  GAreaManage.SaveCurrentAreasToFile(ExtractFilePath(application.ExeName)+current_User.UserName+'_areas.ini')
end;

procedure TMainf.stop_AlarmExecute(Sender: TObject);
begin
  Timer.Enabled :=False;
  try
  if  FDlg_AlarmCar.stop_Alarm then FMap.DrawGpsMap_ClearDraw;//��GPSͼ�㲢�ػ��� ;
  finally
    Timer.Enabled :=True;
  end;
end;

procedure TMainf.show_AlarmStopExecute(Sender: TObject);
begin
  show_AlarmStop.Checked := not show_AlarmStop.Checked;
  FDlg_AlarmCar.cxStopAlarmList.Visible := show_AlarmStop.Checked;
  FDlg_AlarmCar.Splitter_Alarm.Visible  := show_AlarmStop.checked;
end;

procedure TMainf.OncxDeviceListEdited(Sender: TObject;
  AColumn: TcxTreeListColumn);
var
  node,nextnode:TcxTreeListNode;
begin
  if FDlg_Watch_Car.cxDeviceList.FocusedNode = nil then exit;
  if AColumn =FDlg_Watch_Car.dev_Track then
    fun_watch_car.Execute
  else if AColumn = FDlg_Watch_Car.dev_DrawTrack then
    fun_ShowACarTrack.Execute
  else if AColumn=  FDlg_Watch_Car.dev_Hide then
  begin
    fun_DevHide.Execute;
  end;
  node:=FDlg_Watch_Car.cxDeviceList.FocusedNode;
  node.Focused:=false;
  NextNode:=node.GetNext;
  if nextNode<>nil then
  begin
     NextNode.Focused:=true;
  end
  else
  begin
    NextNode:=node.GetPrev;
    if NextNode<>nil then NextNode.Focused:=true;
  end;
  node.Focused:=true;
end;

procedure TMainf.fun_Devs_SetParamExecute(Sender: TObject);
begin
  {$ifdef ForAddEKey}
  ConnectedEkey_monitor;
  {$endif}
  if ParamAllFrm = nil then
    ParamAllFrm:= TParamAllFrm.Create(self);
  paramAllFrm.ListView1.PopupMenu := PopupMenu_SelectDevs;
  FListView_SelectDevs := paramAllFrm.ListView1;
  AddDeviceByGroup;
  ParamAllFrm.Show;
end;

procedure TMainf.tool_RectSelectExecute(Sender: TObject);
var
 i:integer;
begin
  FMap.MouseAction := actRectSelect;
  for i:=0 to ActionList1.ActionCount-1 do
  begin
    if (ActionList1.Actions[i].Category='��ͼ����') then
    begin
      if ActionList1.Actions[i].Name<>'tool_bird_eye' then
      begin
        TAction(ActionList1.Actions[i]).Checked:=false;
      end;
    end;
  end;  
  TAction(Sender).Checked:=true;
end;


procedure TMainf.ck_carExecute(Sender: TObject);//������Ϣ��ѯ
var
  dlg : TFormClxxQry;
begin
  if not CheckDevId then exit;
  dlg := TFormClxxQry.Create(self);
  try
    dlg.FdevId := GCurSelectDev.Id;
    dlg.ComboBox1.ItemIndex := 0;
    dlg.ComboBox2.Text := Edit1.Text;
    dlg.Show;
  except//finally
    dlg.Free;
  end;
end;

procedure TMainf.Dlgs_Create;
begin
  PageControl_Center.Height := Panel_center.Height * 2 div 3;
  //-----������ʾ����
  FDlg_data_display  := Tdata_display.Create(self);
  FDlg_Data_Display.Parent:= FDlg_Map.Panel_data_display;
  FDlg_Data_Display.Top:=0;
  FDlg_Data_Display.Left:=0;

  FDlg_Watch_Car:= Twatch_car.Create(self);
  FDlg_Watch_Car.cxDeviceList.PopupMenu := PopupMenu_funDev;
  FDlg_Watch_Car.cxDeviceList.OnEditValueChanged := OncxDeviceListEdited;

  FDlg_DRunData := TtaxiRunDataFrm.Create(self);


  FDlg_Sended_Cmd := TSended_Cmd.Create(self);  //���������
  FDlg_Sended_Cmd.cxTreeList1.PopupMenu :=PopupMenu_cmd;

  FDlg_OrderList:=TOrderListFrm.Create(Self);   //���Ͷ����б���
  FDlg_OrderList.cxOrderList.OnDblClick:=DoulbeClickOrderList;


  FDlg_Received_Info := TReceived_info.Create(self);
  DataServer.OnSendMsg:=FDlg_Received_Info.ReceivedMsg;
  

  FDlg_Prompt_Info:= TReceived_info.Create(self);
  FDlg_Prompt_Info.Caption:='��ʾ��Ϣ';
  FDlg_Prompt_Info.Log.LogFile:=ExePath+'��ʾ��Ϣ'+'\'+'��ʾ��Ϣ';
  ADeviceManage.OnSendMsg:=FDlg_Prompt_Info.ReceivedMsg;


//  FDlg_Sended_msg:= TSended_Message.Create(self);

  FDlg_ConfineAreaList:= TConfineAreaListFrm.Create(self);
  //FDlg_ConfineAreaList.cxDeviceList.OnEditValueChanged := OncxDeviceListEdited;

  FDlg_AlarmCar:= TFrmAlarmCar.Create(self);
  FDlg_AlarmCar.cxAlarmList.PopupMenu  := PopupMenu_Alarm ;

  ListSelectDev.Images                 := ResManage.BmpList;//�û��ڵ�ͼ��ѡ�г����б�
  //ListSelectDev.PopupMenu := PopupMenu_funDev;
  //ListSwitch.Images := ResManage.BmpList;

  //�����ѯ
  FDlg_SearchAddress := TFrmSearchAddressInMap.Create(self);

  FDlg_PictureFrm  :=TPictureFrm.Create(Self);
  DataServer.OnPicUpload:=FDlg_PictureFrm.OnPicUpload; 

  FDlg_HisForm:= TFormHisMain.Create(Self);

  Dlgs_Show;
end;

procedure TMainf.Dlgs_Free;
begin


  //-----������ʾ����
  FDlg_data_display.Free;
  FDlg_Watch_Car.Free;
  FDlg_Sended_Cmd.Free;//���������
  FDlg_OrderList.Free;   //���Ͷ����б���
  FDlg_Received_Info.Free;
  FDlg_ConfineAreaList.Free;
  FDlg_AlarmCar.Free;
  FDlg_SearchAddress.Free;//�����ѯ
  FDlg_Prompt_Info.Free;
  FDlg_PictureFrm.Free;
  FDlg_HisForm.Free;
end;

procedure TMainf.Dlgs_Show;
begin
  FDlg_Watch_Car.ManualDock(PageControlBottom,nil,alLeft );
  FDlg_Watch_Car.Show ;
  show_ListCar.Checked := True;

{$IFDEF ForTestUser}
  FDlg_Sended_Cmd.ManualDock(PageControlBottom,nil,alLeft );
  FDlg_Sended_Cmd.Show ;
  show_sended_command.Checked := True;
  if VersionFor<>'ZT' then
  begin
    FDlg_OrderList.ManualDock(PageControlBottom,nil,alLeft);
    FDlg_OrderList.Show;
  end;

  FDlg_Received_Info.ManualDock(PageControlBottom,nil,alleft);
  FDlg_Received_Info.Show;
  show_Received_Info.Checked := True;
  
  
  FDlg_Prompt_Info.ManualDock(PageControlBottom,nil,alleft);
  FDlg_Prompt_Info.Show;

 // FDlg_DRunData.Show;
 // show_Sended_Message.Checked := true;
//  Xpmenu1.Active:=false;

  //Xpmenu1.Active:=true;

  FDlg_ConfineAreaList.ManualDock(PageControlBottom,nil,alleft);
  FDlg_ConfineAreaList.Show;
  show_ConfineAreaList.Checked := True;

  FDlg_AlarmCar.ManualDock(PageControlBottom,nil,alleft);
  FDlg_AlarmCar.Show;
  show_AlarmLists.Checked := True;
  FDlg_SearchAddress.Left:=Screen.Width;
  FDlg_SearchAddress.Top:=Screen.Height;
  FDlg_SearchAddress.Show;
  FDlg_SearchAddress.ManualDock(PageControlBottom,nil,alleft);
  show_SearchAddress.Checked := true;

  FDlg_HisForm.ManualDock(PageControlBottom,nil,alleft);
  FDlg_HisForm.Show;

  PageControlBottom.ActivePageIndex:=0;
  if VersionFor<>'ZT' then
  begin
    FDlg_PictureFrm.ManualDock(PageControlBottom,nil,alleft);
    FDlg_PictureFrm.Show;
  end;
{$ENDIF}
  if not show_car.Checked        then show_car.Execute;
  if not show_toolbar.Checked    then show_toolbar.Execute;
  if not show_statusBar.Checked  then show_statusBar.Execute;
  if not show_MapToolbar.Checked then show_MapToolbar.Execute;
end;

procedure TMainf.Dlgs_Hide;
begin
  if show_ListCar.Checked         then show_ListCar.Execute;
  if show_sended_command.Checked  then show_sended_command.Execute;
  if show_Received_Info.Checked   then show_Received_Info.Execute;
  if show_Sended_Message.Checked  then show_Sended_Message.Execute;
  if show_ConfineAreaList.Checked then show_ConfineAreaList.Execute;
  if show_AlarmLists.Checked      then show_AlarmLists.Execute;
  if show_SearchAddress.Checked   then show_SearchAddress.Execute;
end;

procedure TMainf.PageControlBottomDockDrop(Sender: TObject;
  Source: TDragDockObject; X, Y: Integer);  {ͣ�������¼�}
begin
  Inc(FBottomFormCount);
end;

procedure TMainf.PageControlBottomUnDock(Sender: TObject; Client: TControl;
  NewTarget: TWinControl; var Allow: Boolean);    {�ӵײ㴰���ϳ������¼�}
begin
  Dec(FBottomFormCount);
  if FBottomFormCount<=0 then
  begin
    SplitterBottom.CloseSplitter;
  end;
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
  dlg:Tcall_dev;
  i,n:integer;
  dev : TDevice;
//  grp: TDevGroup;
begin
  {$ifdef ForAddEKey}
  ConnectedEkey_monitor;
  {$endif}
  //If not HasPrivilege(PRI_CALL) then exit;
  dlg:= Tcall_dev.Create(self);
  try
    {����ѡ���� ��ͳһ��ѡ��������}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;

   if ListSelectDev.Count >0 then
   begin
     AddDeviceFromListSelectDev;
   end
   else
   begin
    AddDeviceByGroup;
   end;
    dlg.ShowModal ;
    if dlg.ModalResult = mrok then //�������г���
    begin
      n:= dlg.ListView1.Items.Count;
      if n=0 then
      begin
        messagebox(handle,pchar('�����ִ�У�û��ָ������'),'��ʾ',mb_ok + mb_iconinformation);
        exit;
      end;

      for i:=0 to dlg.ListView1.Items.Count -1 do
      begin
        dev:= TDevice(dlg.ListView1.Items.Item[i].Data);
        if dev <> nil then
          DataServer.CallTarget(dev.Id);
        sleep(50);
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
  if key =#13 then exit;
  FDevKeyIn := true;
  if edit2.text<>'' then
  begin
    edit2.Text:='';
    ListDevice.Cells[1,1] := '';
    ListDevice.Cells[1,2] := '';
    ListDevice.Cells[1,3] := '';
    ListDevice.Cells[1,4] := '';
    ListDevice.Cells[1,5] := '';
  end;
end;

//Ⱥ���������Ϣ
procedure TMainf.fun_Devs_SendControlInfoExecute(Sender: TObject);
var
  dlg    : TSendMsg2Dev;
//  tmpStr: string;
//  i : integer;
//  dev : TDevice;
//  grp : TDevGroup;
begin
  {$ifdef ForAddEKey}
  ConnectedEkey_monitor;
  {$endif}
//  If not HasPrivilege(PRI_SENDMSG) then exit;

  dlg:= TsendMsg2dev.Create(self);

  try
   dlg.Tag:=MSGTYPE_NORMAL;
   dlg.Memo1.Lines.Clear;
    {����ѡ���� ��ͳһ��ѡ��������}
   dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
   FListView_SelectDevs := dlg.ListView1;
   dlg.Caption:=fun_SendControlInfo.Caption;
   if ListSelectDev.Count >0 then
   begin
     AddDeviceFromListSelectDev;
   end
   else
   begin
    AddDeviceByGroup;
   end;


    dlg.ShowModal;
{    if dlg.ModalResult = mrok then
    begin
      if dlg.ListView1.Items.Count=0 then
      begin
        messagebox(handle,'�����ִ�У�û��ָ��������','��ʾ',mb_ok + mb_iconinformation);
        exit;
      end;
      tmpStr:= trim(dlg.Memo1.Lines.Text);
      // ȥ����Ч�ַ�
      tmpstr := DelInvalidStr(tmpStr);
      for i:=0 to dlg.ListView1.Items.Count -1 do
      begin
        dev:= TDevice(dlg.ListView1.Items.Item[i].Data);
        if dev <> nil then
          DataServer.SendControlInfo(dev.Id,dev.IdStr,tmpStr,length(tmpStr));
        sleep(50);
        Application.ProcessMessages;          
      end;
    end;   }
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_SendToDTEsExecute(Sender: TObject);
var
  dlg    : Tset_SendToDTE_Data;
  tmpStr: string;
  i,n : integer;
  dataLen:integer;
  arrData:array of byte;
  dev: TDevice;
  grp: TDevGroup;
begin
  {$ifdef ForAddEKey}
  ConnectedEkey_monitor;
  {$endif}
  //If not HasPrivilege(PRI_SENDMSG) then exit;
  
  dlg:= Tset_SendToDTE_Data.Create(self);
  if GCurSelectGroupID= -1 then
  begin
    for i:= 0 to ADeviceManage.Count- 1 do
      with dlg.ListView1.Items.Add do
      begin
        caption:= ADeviceManage.Items[i].Car.No;
        data:= ADeviceManage.Items[i];
      end;
  end
  else if GCurSelectGroupID>=0 then 
  begin
    {for i:= 0 to ADeviceManage.Count- 1 do
    begin
      if ADeviceManage.Items[i].GroupID <> GCurSelectGroupID then Continue;
      with dlg.ListView1.Items.Add do
      begin
        caption:= ADeviceManage.Items[i].Car.No;
        data:= ADeviceManage.Items[i];
      end;
    end;   }
    grp := ADevGroupManage.find(GCurSelectGroupID);
    if grp= nil then exit;
    for i:= 0 to grp.DevListCount -1 do
    begin
      dev:= ADeviceManage.Find(grp.DevList[i]);
      with dlg.ListView1.Items.Add do
      begin
        caption:= dev.Car.No;
        data:= dev;
      end;
    end;
  end;

  try
    dlg.Memo1.Lines.Clear;
    {����ѡ���� ��ͳһ��ѡ��������}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1; 
    dlg.ShowModal;
    if dlg.ModalResult = mrok then
    begin
      if dlg.ListView1.Items.Count=0 then
      begin
        messagebox(handle,'�����ִ�У�û��ָ��������','��ʾ',mb_ok + mb_iconinformation);
        exit;
      end;
      tmpStr:= trim(dlg.Memo1.Lines.Text);
      // ȥ����Ч�ַ�
      tmpstr := DelInvalidStr(tmpStr);
      for n:=0 to dlg.ListView1.Items.Count -1 do
      begin
        dev:= TDevice(dlg.ListView1.Items.Item[n].Data);
        if dev <> nil then
        begin
          dataLen := length(tmpstr);
          setlength(arrData,dataLen);
          for i := 0 to dataLen-1 do
            arrData[i]:= ord(tmpstr[i+1]);
          DataServer.SendToDTE(dev.Id,@arrData[0]);
        end;
      end;
    end;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.FMapMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  str:string;
  {p:TPoint;
  pp:TEarthPoint; }
begin
  if Sender is TGpsMap then
  begin
    with TGpsMap(Sender) do
    begin
      XYToLoLa(X,Y,lo,la);
      //��ʾ��γ��
      str:=' '+FormatFloat('0.000000',lo)+Projection.PrjUnitsName;
      str:=str+'  '+FormatFloat('0.000000',la)+Projection.PrjUnitsName;
      StatusBar1.Panels.Items[1].Text:=str;
      {pp.x:=lo;
      pp.y:=la;
      p:=Projection.LoLa2XY(pp);
      str:=' '+FormatFloat('0',p.X)+Projection.PrjUnitsName;
      str:=str+'  '+FormatFloat('0',p.Y)+Projection.PrjUnitsName;
      StatusBar1.Panels.Items[2].Text:=str;  }
    end;
  end;
 OnMapLabelMouseMove(shift,x,y);
end;

function TMainf.UserReged: boolean;
{$IFDEF ForTestUser}
var

  dlgReg:TFrmUserReg;
  reg  :TRegistry;
  ideNum,zcxx :string;
  zcbj:boolean;
{$endif}
begin
{$IFDEF ForTestUser}
  result:= false;
  zcbj := false;
  reg:= TRegistry.Create;
  try
    //ȡע�����ֵ
    
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
    if not zcbj then
    begin
      //�����ûע�ᣬ�򵯳�ע�ᴰ��
      dlgReg:= TFrmUserReg.Create(self);
      try
        dlgreg.EditBack.Text := Trim(GetEncryNum);
        dlgReg.ShowModal;
        if dlgReg.ModalResult= mrOk then
        begin
          //д��ע���
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
    end;
  finally
    reg.CloseKey;
    reg.Free;
  end;
{$endif}
end;


{procedure TMainf.ShowEkeyMsg(str: string);
begin
  //messagebox(0,pchar(str),EKey_NAME+'��ʾ��Ϣ',mb_ok + mb_iconinformation);
end;  }



procedure TMainf.tool_SetConfineAlarmAreaExecute(Sender: TObject);
var
 i:integer;
begin
  FMap.MouseAction:=  actSetConfineAlarmArea;
  for i:=0 to ActionList1.ActionCount-1 do
  begin
    if (ActionList1.Actions[i].Category='��ͼ����') then
    begin
      if ActionList1.Actions[i].Name<>'tool_bird_eye' then
      begin
        TAction(ActionList1.Actions[i]).Checked:=false;
      end;
    end;
  end;  
  TAction(Sender).Checked:=true;
end;

procedure TMainf.FMapSetConfineAlarmArea(Sender:TObject;WPointsAry:TWorldPointAry;PointsCnt:Integer);
        //��������ת���ĸ���,��������תһ���ĵ�ľ���
        procedure GetPoint(A:TPoint;B:TPoint;var OutA1:TPoint;var OutA2:TPoint;
                                            var OutB1:TPoint;var OutB2:TPoint; Distance:longint);
        var
          k1,k2:double;
          temp:Extended;
        begin
          //б�ʵ���0��ʱ
          if((b.Y-a.Y)=0)then
          begin
              OutA1.X:=A.X;
              OutA2.X:=A.X;

              OutA1.Y:=A.Y+Distance;
              OutA2.Y:=A.Y-Distance;

              OutB1.X:=B.X;
              OutB2.X:=B.X;
              OutB1.Y:=B.Y+Distance;
              OutB2.Y:=B.Y-Distance;
          end
          //б�ʵ���90��ʱ
          else if((b.X-a.X)=0)then
          begin
              OutA1.X:=A.X+Distance;
              OutA2.X:=A.X-Distance;

              OutA1.Y:=A.Y;
              OutA2.Y:=A.Y;

              OutB1.X:=B.X+Distance;
              OutB2.X:=B.X-Distance;
              OutB1.Y:=B.Y;
              OutB2.Y:=B.Y;
          end
          else
          begin
              k1:=(b.Y-a.Y)/(b.X-a.X); //ֱ�ߵ�б��
              k2:=-1/k1;               //��ֱֱ�ߵ�б��
              temp:=Sqrt((Distance*Distance)/(1+k2*k2));
              OutA1.X:=round(temp+A.X);
              OutA2.X:=round(-temp+A.X);

              OutA1.Y:=round(k2*(OutA1.X-A.X)+A.Y);
              OutA2.Y:=round(k2*(OutA2.X-A.X)+A.Y);

              OutB1.X:=round(temp+B.X);
              OutB2.X:=round(-temp+B.X);
              OutB1.Y:=round(k2*(OutB1.X-B.X)+B.Y);
              OutB2.Y:=round(k2*(OutB2.X-B.X)+B.Y);
          end;
        end;

var
  dlg: TConfineAreaSetFrm;
  tmpArea:TConfineArea;
  i:integer;
  temp1,temp2:TWorldPointAry;
  a1,a2,b1,b2:TPoint;
  tmpint:integer;
//  minx,miny,maxx,maxy:LongInt;
begin
  FMap.MouseAction:= actNoAction;
  tool_not_select.Checked := true;
  if PointsCnt<2 then exit;
  dlg:= TConfineAreaSetFrm.Create(nil);
  try
    dlg.Edit_AreaID.Text     := IntTostr(GAreaManage.MaxId);
    dlg.Edit_AreaName.Text   := '����'+IntToStr(GAreaManage.MaxId);
    dlg.Edit_AreaColor.Color := clred;
    //dlg.ComboBox_AreaType.ItemIndex := ALARM_OUT;
    dlg.CheckBox_IsDraw.Checked := True;
    dlg.CheckBoxShowPop.Checked:=true;
    dlg.ShowModal;
    if dlg.ModalResult = mrok then
    begin
      begin
          if(dlg.ComboBox_AreaType.ItemIndex<ALARM_WAY_OUT)and(PointsCnt<3)then exit;
          tmpArea:=GAreaManage.Add(StrToInt(dlg.Edit_AreaID.text));
          if dlg.Edit_LimitSpeet.Visible then //�ж��Ƿ��г�������
          begin
             if dlg.Edit_LimitSpeet.Text<>'' then
                 tmpArea.OverSpeet:=StrToInt(dlg.Edit_LimitSpeet.Text);
          end;
          tmpArea.ID        := StrToInt(dlg.Edit_AreaID.Text);
          tmpArea.Name      := trim(dlg.Edit_AreaName.Text);
          tmpArea.AreaColor := dlg.Edit_AreaColor.Color;
          tmpArea.AreaType  := dlg.ComboBox_AreaType.ItemIndex;// ����������
          tmpArea.IsDraw    := dlg.CheckBox_IsDraw.Checked;

          tmpArea.AlarmDistance:=1000;


          tmpArea.IsEnabledTime:=dlg.CheckBoxEnabledTime.Checked;
          tmpArea.BeginTime:=dlg.BeginTime.Time-Trunc(dlg.BeginTime.Time);
          tmpArea.EndTime:=dlg.EndTime.Time-Trunc(dlg.EndTime.Time);
          tmpArea.IsShowPop:=dlg.CheckBoxShowPop.Checked;



          if(dlg.ComboBox_AreaType.ItemIndex=ALARM_WAY_OUT)or//����ǹ̶���·
            (dlg.ComboBox_AreaType.ItemIndex=ALARM_WAY_IN) then
          begin
              tmpint:=PointsCnt*2-2;
              Setlength(temp1,tmpint);
              Setlength(temp2,tmpint);
              for i:=0 to PointsCnt-2 do
              begin
                  GetPoint(WPointsAry[i],WPointsAry[i+1],a1,a2,b1,b2,tmpArea.AlarmDistance);
                  tmpArea.RunWayRectList.Add(a1,a2,b2,b1);
              end;

              tmpArea.SetLengthPointAry(PointsCnt);
              for i:=0 to PointsCnt-1 do
              begin
                  tmpArea.WorldPointAry[i]:=WPointsAry[i];
              end;
              tmpArea.OutBox:=tmpArea.RunWayRectList.OutBox;
          end
          else//���򱨾�
          begin
              if PointsCnt<3 then exit;
              tmpArea.SetLengthPointAry(PointsCnt);
              for i:= 0 to PointsCnt -1 do
              begin
                tmpArea.WorldPointAry[i]:= WPointsAry[i];
              end;
              tmpArea.WorldPointAryToOutBox(tmpArea.WorldPointAry,0,tmpArea.PointCount);
          end;
      end;

      //------------ ��ʾ����Χ���б�
      if (not FDlg_ConfineAreaList.Visible) {or (FDlg_ConfineAreaList.Floating)} then
      begin
        FDlg_ConfineAreaList.ManualDock(PageControlBottom,nil,alLeft);
        FDlg_ConfineAreaList.Show;
        for i:= 0 to PageControlBottom.PageCount-1 do
          if PageControlBottom.Pages[i].Caption = '����Χ���б�' then
          begin
            PageControlBottom.ActivePageIndex := i;
            break;
          end;
      end;
      FDlg_ConfineAreaList.ListConfineAreas;
      //------------ ��ʾ����Χ��
    end;
  finally
    dlg.Free;
  end;
end;

procedure TMainf.FMapUserSelectDev(sender: Tobject;PointA,PointB:TEarthPoint);
var
  i: integer;
  dev: TDevice;
  tempListView:TListView;
  SendOrderFrm:TSendOrderMiniFrm;
begin
  if not(Panel_Clxx.Visible) then show_car.Execute;
  ListSelectDev.Clear;
  if ADeviceManage.UserSelectList.Count=0 then
  begin
    EarthRect.isCanUse:=false;
    PageControl1.ActivePageIndex:=0;
    exit;
  end;
  GetMapRectSelect_Rect(PointA,PointB);
  ListSelectDev.BeginUpdate;
  for i:= 0 to ADeviceManage.UserSelectList.Count -1 do
  begin
    dev := ADeviceManage.ItemsFromMetaIndex[i];
    with ListSelectDev.Add do
    begin
      Data := dev;
      Values[0]:= dev.IdStr;
      Values[1]:= dev.Car.No;
      ImageIndex := dev.Car.ResIndex;
      SelectedIndex := dev.Car.ResIndex ;
      if dev.isOnline  then
      begin
        if Dev.Switch[STAT_GPS_LOCATE] then
          StateIndex:=3
        else
          StateIndex:=6;
      end
      else    //�粻����,����ʾ�Ƕ�λ..
      begin
         StateIndex:=4;
      end;
    end;
  end;
  ListSelectDev.EndUpdate;
  SendOrderFrm:=GetFocusSendOrderFrm;
  if SendOrderFrm<>nil then
  begin
    tempListView:=FListView_SelectDevs;
    FListView_SelectDevs:=SendOrderFrm.ListView1;
    AddDeviceFromListSelectDev;
    FListView_SelectDevs:=tempListView;
  end;
  PageControl1.ActivePageIndex:=1;
end;

procedure TMainf.ListSelectDevFocusedNodeChanged(Sender: TObject;
  APrevFocusedNode, AFocusedNode: TcxTreeListNode);
begin
  if ListSelectDev.FocusedNode = nil  then exit;
  //GCurSelectDev :=TDevice(ListSelectDev.FocusedNode.Data);
  GCurSelectDev :=TDevice(AFocusedNode.Data);
  Edit2.Text := IntToStr(GCurSelectDev.Id);
  Edit1.Text := GCurSelectDev.Car.No;
  ComboboxCarNo.Text:=Edit1.Text;
end;

procedure TMainf.FMapUserSelDevcntMany;
begin
  messagebox(handle,pchar('�Բ�����ѡ�еĳ���̫���ˣ������ֻ��ͬʱѡ��'+
    IntToStr(DRAWSelectDevCnt)+'������'),'��ʾ',mb_ok + mb_iconinformation);
end;

procedure TMainf.show_ConfineAreaListExecute(Sender: TObject);
var
  i: integer;
begin
  with (Sender as TAction) do
  begin
    Checked := not Checked;
    if Checked then
    begin
      if (not FDlg_ConfineAreaList.Visible) or (FDlg_ConfineAreaList.Floating) then
      begin
        FDlg_ConfineAreaList.ManualDock(PageControlBottom,nil,alLeft);
        FDlg_ConfineAreaList.Show;
        for i:= 0 to PageControlBottom.PageCount-1 do
          if PageControlBottom.Pages[i].Caption = '����Χ���б�' then
          begin
            PageControlBottom.ActivePageIndex := i;
            break;
          end;
      end;
    end
    else
    begin
      FDlg_ConfineAreaList.ManualDock(nil);
      FDlg_ConfineAreaList.Hide;
    end;
  end;                  
end;


procedure TMainf.show_AlarmListsExecute(Sender: TObject);
var
  i: integer;
begin
  with (Sender as TAction) do
  begin
    Checked := not Checked;
    if Checked then
    begin
      if (not FDlg_AlarmCar.Visible) or (FDlg_AlarmCar.Floating) then
      begin
        FDlg_AlarmCar.ManualDock(PageControlBottom,nil,alLeft);
        FDlg_AlarmCar.Show;
        for i:= 0 to PageControlBottom.PageCount-1 do
          if PageControlBottom.Pages[i].Caption = '���������б�' then
          begin
            PageControlBottom.ActivePageIndex := i;
            break;
          end;
      end;
    end
    else
    begin
      FDlg_AlarmCar.ManualDock(nil);
      FDlg_AlarmCar.Hide;
    end;
  end;

end;

procedure TMainf.SelectDevsExecute(Sender: TObject);
var
  dlg: TFrmSelectDevs;
  i:integer;
  dev: Tdevice;
begin
  dlg:= TFrmSelectDevs.Create(nil);
  try
    dlg.ShowModal;
    if FListView_SelectDevs = nil then exit;
    if dlg.ModalResult = mrok then
    begin
      FListView_SelectDevs.Clear;
      for i:= 0 to dlg.DestList.Count -1 do
        with FListView_SelectDevs.Items.Add do
        begin
          dev:=TDevice(dlg.DestList.Items[i].Data) ;
          caption:= dev.Car.No;
          data   := dev;
        end;
    end;
  finally
    dlg.Free;
  end;
end;    

procedure TMainf.DevAlarm_OutorInConfineArea(ADev: Tdevice;
  AlarmType:Byte;AddorDel:boolean;AArea:TConfineArea);
var
  i:integer;
  str: string;
//  find_ListItem,node : TcxTreeListNode;
begin
  if AddorDel then   //=---add ����µġ�Խ���ʻ�롡��������
  begin
    //��������
    try
      screen.Cursor := crHourGlass;
      SetCurrentDir(ExtractFilePath(Application.ExeName));
      if AlarmType = ALARM_OUT then
        str := ExpandFileName(GlobalParam.AlarmSound_OutCArea)
      else if AlarmType = ALARM_IN then
        str := ExpandFileName(GlobalParam.AlarmSound_InCArea);
      if FileExists(str) then
      PlaySound(pchar(str),Hinstance,SND_FILENAME);
    except
      //������ ����
      //for I:=100 to 150 Do DoBleep(I*10,10);
      //for I:=150 Downto 100 Do DoBleep(I*10,10);
    end;
    screen.Cursor := crDefault;

    if (AlarmType= ALARM_OUT)or(AlarmType= ALARM_WAY_OUT) then        //���뵽Խ�籨���б�
      FDlg_AlarmCar.AddData_OutCAreaDev(Adev,AArea)
    else if(AlarmType= ALARM_IN)or(AlarmType= ALARM_WAY_IN) then     //���뵽ʻ�뱨���б�
      FDlg_AlarmCar.AddData_InCAreaDev(Adev,AArea);

    if GlobalParam.isAreaAlarmSendInfoToDriver then
    begin
        case  AlarmType of
           ALARM_OUT:str:='����ʹ��'+AArea.Name+'����,��ص�'+AArea.Name+'����';
           ALARM_IN:str:='����ʹ��'+AArea.Name+'����,���뿪'+AArea.Name+'����';
           ALARM_WAY_OUT:str:='����ʹ��'+AArea.Name+'·��,��ص�'+AArea.Name+'·��';
           ALARM_WAY_IN:str:='����ʹ��'+AArea.Name+'·��,���뿪'+AArea.Name+'·��';
        end;
        DataServer.SendControlInfo(ADev.Id,ADev.IdStr,str,Length(str),-1,false);
    end;
  end
  else      //=del ��Խ�絽��Խ�磬���ʻ�뵽ʻ�������б���ԭ�еı�����Ϣ��������ʷ,�����б���ԭ��ɾ��
  begin
    if AlarmType= ALARM_OUT then
      str:= '�����Ѳ�ʻ������'
    else if AlarmType = ALARM_IN then
      str:= '�����Ѳ�ʻ������'
    else if AlarmType = ALARM_WAY_OUT then
      str:= '�����Ѳ�ʻ��·��'
    else if AlarmType = ALARM_WAY_IN  then
      str:= '�����Ѳ�ʻ��·��';
    RemoveOutorInCAData2History(ADev,AlarmType,str);
  end;
end;

procedure TMainf.RemoveOutorInCAData2History(ADev:TDevice;AlarmType:byte;const MoveCause:string);
var
  find_ListItem: TcxTreeListNode;
begin
  if (AlarmType= ALARM_OUT)or(AlarmType=ALARM_WAY_OUT) then  //��Խ�絽��Խ��
  begin
    Adev.Alarm_OutCArea := false;
    //FDlg_AlarmCar.cxOutCAreaList.BeginUpdate;
    find_ListItem := FindNodeByTextIncxTreeList(ADev.IdStr,FDlg_AlarmCar.cxOutCAreaList,0);
    if find_ListItem <> nil then
    begin
      FDlg_AlarmCar.cxOutCAreaList.BeginUpdate;
      try
        FDlg_AlarmCar.MoveData2OutCAreaHistoryList(ADev,find_ListItem,MoveCause);
      finally
        FDlg_AlarmCar.cxOutCAreaList.EndUpdate;
      end;
    end;
  end
  else if (AlarmType= ALARM_IN)or(AlarmType = ALARM_WAY_IN) then  //��ʻ�뵽ʻ��
  begin
    Adev.Alarm_InCArea := false;
    //FDlg_AlarmCar.cxInCAreaList.BeginUpdate;
    find_ListItem := FindNodeByTextIncxTreeList(ADev.IdStr,FDlg_AlarmCar.cxInCAreaList,0);
    if find_ListItem <> nil then
    begin
      FDlg_AlarmCar.cxInCAreaList.BeginUpdate;
      try
        FDlg_AlarmCar.MoveData2InCAreaHistoryList(ADev,find_ListItem,MoveCause);
      finally
        FDlg_AlarmCar.cxInCAreaList.EndUpdate;
      end;
    end;
  end;
end;


procedure TMainf.show_SearchAddressExecute(Sender: TObject);
var
  i: integer;
begin
  with (Sender as TAction) do
  begin
    Checked := not Checked;
    if Checked then
    begin
      if (not FDlg_SearchAddress.Visible) or (FDlg_SearchAddress.Floating) then
      begin
        FDlg_SearchAddress.Show;
        FDlg_SearchAddress.ManualDock(PageControlBottom,nil,alLeft);
        
        for i:= 0 to PageControlBottom.PageCount-1 do
          if PageControlBottom.Pages[i].Caption = '������ѯ' then
          begin
           try
             PageControlBottom.ActivePageIndex :=i;
           except
             break;
           end;
            break;
          end;
      end;
    end
    else
    begin
      FDlg_SearchAddress.ManualDock(nil);
      FDlg_SearchAddress.Hide;
    end;
  end;
end;

procedure TMainf.ShowState(Device:TDevice);
var
 i:integer;
begin
try
   if Device=nil then exit;
   if not Device.First  then
   begin
     for i:=1 to  DeviceStateList.RowCount-1  do
     begin
       DeviceStateList.Cells[1,i]:='';
     end;
      DeviceStateList.Cells[0,2]:='��������';
      DeviceStateList.Cells[0,3]:='��γ��γ';
     exit;
   end;

   if  Device.Switch[0] then
       DeviceStateList.Values['��λ״̬']:='��λ'
   else
       DeviceStateList.Values['��λ״̬']:='�Ƕ�λ';

   //if SecondsBetween(now,Device.LastConnectTime)>StrToInt(Device.Param.PursueInterval)*5 then
   if not Device.isOnline then
   begin
     DeviceStateList.Values['��λ״̬']:='�Ƕ�λ';
   end;

   if  Device.Switch[1] then
   begin
       DeviceStateList.Cells[0,3]:='��γ';
       DeviceStateList.Values['��γ']:=FormatFloat('##0.000000',Device.Latitude);
   end
   else
   begin
       DeviceStateList.Cells[0,3]:='��γ';

       DeviceStateList.Values['��γ']:=FormatFloat('##0.000000',Device.Latitude);
   end;

   if  Device.Switch[2] then
   begin
       DeviceStateList.Cells[0,2]:='����';
       DeviceStateList.Values['����']:= FormatFloat('##0.000000',Device.Longitude);
   end
   else
   begin
       DeviceStateList.Cells[0,2]:='����';
       DeviceStateList.Values['����']:= FormatFloat('##0.000000',Device.Longitude);
   end;
       DeviceStateList.Values['GPSʱ��']:=FormatDatetime('hh:nn:ss',Device.GpsTime);

       DeviceStateList.Values['GPS����']:=FormatDatetime('yyyy-mm-dd',Device.GpsTime);

   if  VersionFor='ZT' then
   begin
       if  Device.Switch[8] then
          DeviceStateList.Values['�ػ�״̬']:='�ճ�'
       else
          DeviceStateList.Values['�ػ�״̬']:='�ػ�';
       //DeviceStateList.Cells[1,5]:='�ճ�';

       if  Device.Switch[27] then
           DeviceStateList.Values['�㵹״̬']:='�㵹'
       else
           DeviceStateList.Values['�㵹״̬']:='����';
   end
   else
   begin
       if  Device.Switch[8] then
           DeviceStateList.Values['ACC״̬']:='��'
       else
           DeviceStateList.Values['ACC״̬']:='��';

       if  GlobalParam.isUseMasure  then
       begin
           if  Device.Switch[9] then
               DeviceStateList.Values['�ճ��س�']:='�س�'
           else
               DeviceStateList.Values['�ճ��س�']:='�ճ�';

           if  Device.Switch[10] then
               DeviceStateList.Values['��Ӫ״̬']:='ͣ��'
           else
               DeviceStateList.Values['��Ӫ״̬']:='��Ӫ';
       end;
       
       if  Device.Switch[16] then
           DeviceStateList.Values['��������']:='��'
       else
           DeviceStateList.Values['��������']:='��';

       if  Device.Switch[27] then
           DeviceStateList.Values['��ʾ��']:='����'
       else
           DeviceStateList.Values['��ʾ��']:='����';

       if  GlobalParam.isUseMasure  then
       begin
           if  Device.Switch[28] then
               DeviceStateList.Values['�Ƽ���']:='����'
           else
               DeviceStateList.Values['�Ƽ���']:='����';
       end;

   end;

   if  Device.Switch[17] then
       DeviceStateList.Values['���ٱ���']:='��'
   else
       DeviceStateList.Values['���ٱ���']:='��';


       
   if  Device.Switch[18] then
       DeviceStateList.Values['�ϵ籨��']:='��'
   else
       DeviceStateList.Values['�ϵ籨��']:='��';
       

       
   if  Device.Switch[24] then
       DeviceStateList.Values['GPSģ��']:='����'
   else
       DeviceStateList.Values['GPSģ��']:='����';

   if  Device.Switch[25] then
       DeviceStateList.Values['GPS����']:='�Ͽ�'
   else
       DeviceStateList.Values['GPS����']:='��ͨ';

   if  Device.Switch[26] then
       DeviceStateList.Values['��ѹ����']:='��ѹ'
   else
       DeviceStateList.Values['��ѹ����']:='����';





 {       //���´��벻֪����ʲô��...
   if FDlg_Watch_Car.cxDeviceList.FocusedNode<>nil then
   begin
      DeviceStateList.Values['��λ״̬']:=FDlg_Watch_Car.cxDeviceList.FocusedNode.Values[8];
   end;      }

  ListDevice.Values['ʡ'] := Device.ShengName;

  ListDevice.Values['��'] := Device.ShiName;

  ListDevice.Values['��'] := Device.XianName;

except  on E: Exception do
    uGloabVar.SystemLog.AddLog(' TMainf.ShowState��������: ',e.Message);
end;

end;

//���õ绰��
procedure TMainf.fun_SetDevTelListExecute(Sender: TObject);
var
  dlg: TSetDevTelListAllFrm;
begin
  {$ifdef ForAddEKey}
  ConnectedEkey_monitor;
  {$endif}
  if not CheckDevId then
  begin
   fun_Devs_SetDevTelListExecute(Sender);
   exit;
  end;
  dlg:= TSetDevTelListAllFrm.Create(self);
  try
    {����ѡ���� ��ͳһ��ѡ��������}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    Add_A_Device;
    dlg.ShowModal ;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;




procedure TMainf.fun_SendControlInfoExecute(Sender: TObject);
var
  dlg    : TSendMsg2Dev;
begin
  {$ifdef ForAddEKey}
  ConnectedEkey_monitor;
  {$endif}
  if not CheckDevId then
  begin
    fun_Devs_SendControlInfoExecute(Sender);
    exit;
  end;
  dlg:= TsendMsg2dev.Create(self);
  try
    dlg.Tag:=MSGTYPE_NORMAL;
    dlg.Memo1.Lines.Clear;
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;     {����ѡ���� ��ͳһ��ѡ��������}
    FListView_SelectDevs := dlg.ListView1;
    dlg.Caption:=fun_SendControlInfo.Caption;
    Add_A_Device;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_SendControlInfo_NeedAnswerExecute(Sender: TObject);
var
  dlg    : TSendMsg2Dev;
begin
  {$ifdef ForAddEKey}
  ConnectedEkey_monitor;
  {$endif}
  { TODO -oɳ : If not HasPrivilege(PRI_SENDMSG) then exit; }
  if not CheckDevId then
  begin
   fun_Devs_SendControlInfo_NeedAnswerExecute(Sender);
   exit;
  end;

  dlg:= TsendMsg2dev.Create(self);
  dlg.Tag:=MSGTYPE_NEEDANSWER;
  dlg.ListView1.PopupMenu := PopupMenu_SelectDevs; {����ѡ���� ��ͳһ��ѡ��������}
  FListView_SelectDevs := dlg.ListView1;
  try

    Add_A_Device;

    dlg.Memo1.Lines.Clear;
    dlg.Caption := fun_SendControlInfo_NeedAnswer.Caption;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_PursueDevExecute(Sender: TObject);
var
  frm:TPursueDevFrm ;
begin
  if not CheckDevId then
  begin
    fun_Devs_PursueDevExecute(Sender);
    exit;
  end;
  frm:=TPursueDevFrm.Create(Self);
  try
    frm.ListView1.PopupMenu := PopupMenu_SelectDevs; {����ѡ���� ��ͳһ��ѡ��������}
    FListView_SelectDevs := frm.ListView1;
    Add_A_Device;
    frm.ShowModal;
  finally
    frm.Free;
  end;
end;

procedure TMainf.fun_ModifyDisplayNameExecute(Sender: TObject);
var
  dlg: TModifyLcdCoNameAllFrm;
begin
  if not CheckDevId then
  begin
      fun_Devs_ModifyDisplayNameExecute(Sender);
      exit;
  end;

  dlg:= TModifyLcdCoNameAllFrm.Create(self);
  try
    dlg.EditCoName.Text:='';
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    Add_A_Device;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_ModifyLCDMenuExecute(Sender: TObject);
var
  dlg : TLCDMenuALLFrm;
begin
  if not CheckDevId then
  begin
   fun_Devs_ModifyLCDMenuExecute(Sender);
   exit;
  end;

  dlg:= TLCDMenuALLFrm.Create(self);
  try
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    Add_A_Device;
    dlg.ShowModal;
  finally
    dlg.Free;
  end;
end;

procedure TMainf.fun_UpdateDevFirmWareExecute(Sender: TObject);
var
   dlg: TSetUpdateDevAllFrm;
begin
   if not CheckDevId then
   begin
    fun_Devs_UpdateFirmWareExecute(Sender);
    exit;
   end;

  dlg:= TSetUpdateDevAllFrm.Create(self);
  try
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    Add_A_Device;
    dlg.ShowModal;
  finally
    dlg.Free;
  end;
end;

procedure TMainf.fun_Devs_PursueDevExecute(Sender: TObject);
var
  dlg:TPursueDevFrm;
begin
  dlg:=TPursueDevFrm.Create(Nil);
try
  dlg.ListView1.PopupMenu := PopupMenu_SelectDevs; {����ѡ���� ��ͳһ��ѡ��������}
  FListView_SelectDevs := dlg.ListView1;
   if ListSelectDev.Count >0 then
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
end;

end;

procedure TMainf.fun_Devs_SendControlInfo_NeedAnswerExecute(
  Sender: TObject);
var
  dlg    : TSendMsg2Dev;
begin
  {$ifdef ForAddEKey}
  ConnectedEkey_monitor;
  {$endif}
  dlg:= TsendMsg2dev.Create(self);
  dlg.Tag:=MSGTYPE_NEEDANSWER;
  dlg.ListView1.PopupMenu := PopupMenu_SelectDevs; {����ѡ���� ��ͳһ��ѡ��������}
  FListView_SelectDevs := dlg.ListView1;
  try

   if ListSelectDev.Count >0 then
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

procedure TMainf.fun_Devs_ModifyLCDMenuExecute(Sender: TObject);
var
  dlg: TLCDMenuALLFrm;
begin
  dlg:= TLCDMenuALLFrm.Create(self);
  try
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    AddDeviceByGroup;
    dlg.ShowModal;
  finally
    dlg.Free;
  end;

end;

procedure TMainf.fun_Devs_ModifyDisplayNameExecute(Sender: TObject);
var
  dlg:TModifyLcdCoNameAllFrm;
begin
  {$ifdef ForAddEKey}
  ConnectedEkey_monitor;
  {$endif}
  dlg:= TModifyLcdCoNameAllFrm.Create(self);
  try
    dlg.EditCoName.Text:='';
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    AddDeviceByGroup;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_Devs_UpdateFirmWareExecute(Sender: TObject);
var
  dlg:TSetUpdateDevAllFrm;
begin
  {$ifdef ForAddEKey}
  ConnectedEkey_monitor;
  {$endif}
  dlg:= TSetUpdateDevAllFrm.Create(self);
  try
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    AddDeviceByGroup;
    dlg.ShowModal;
  finally
    dlg.Free;
  end;
end;

procedure TMainf.fun_Devs_SetDevTelListExecute(Sender: TObject);
var
  dlg:TSetDevTelListAllFrm;
begin
  {$ifdef ForAddEKey}
  ConnectedEkey_monitor;
  {$endif}
  dlg:= TSetDevTelListAllFrm.Create(self);
  try
    {����ѡ���� ��ͳһ��ѡ��������}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    AddDeviceByGroup;
    dlg.ShowModal ;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.SetPower;
  procedure SetEnViable(Sender:TObject;Pr:TPrivilege);
  begin
    if Sender is TAction then
    begin
       TAction(Sender).Enabled:=Pr.Enabled;
       TAction(Sender).Visible:=Pr.Visible;
    end;
    if Sender is TMenuItem then
    begin
       TMenuItem(Sender).Enabled:=Pr.Enabled;
       TMenuItem(Sender).Visible:=Pr.Visible;
    end;
  end;
var
  Pr:TPrivilege;
begin
 Pr:=current_user.HasPrivilege(1000);
 if (Pr.Id=-1)or (not Pr.Visible)or(not Pr.Enabled) then
 begin
    messagebox(0, '�Բ���,��û��Ȩ��ʹ�����ܼ�ؿͻ��ˣ�����ϵͳ����Ա��ѯ��', '��ʾ', mb_ok + mb_iconinformation);
    Application.Terminate;
    exit;
 end;

   //�Ƿ�ʹ�üƼ���
   fun_TaxiMeterStopDateTime.Visible:=GlobalParam.isUseMasure;
   fun_Devs_TaxiMeterStopDateTime.Visible:=GlobalParam.isUseMasure;
   //�Ƿ�ʹ��˾����
   fun_ReadDriverInfo.Visible:=GlobalParam.isUseDriverCard;
   ck_DriverOnOffDuty.Visible:=GlobalParam.isUseDriverCard;




 Pr:=current_user.HasPrivilege(1100);  //ϵͳ����
 SetEnViable(N42,Pr);
 //SetEnViable(sys_com_set,Pr);
 //SetEnViable(sys_login_again,Pr);
// SetEnViable(sys_change_pass,Pr);
// SetEnViable(sys_lock,Pr);
// SetEnViable(sys_off,Pr);
// SetEnViable(fun_refresh_all_dev,Pr);

     Pr:=current_user.HasPrivilege(1101);  //����
     SetEnViable(sys_lock,Pr);

     Pr:=current_user.HasPrivilege(1102);  //ע��
     SetEnViable(sys_off,Pr);
     if (not Sys_Lock.Visible)and(not Sys_Off.Visible) then
     begin
       ToolButton22.Visible:=false;
     end;

     Pr:=current_user.HasPrivilege(1103);  //�޸�����
     SetEnViable(sys_change_pass,Pr);

     Pr:=current_user.HasPrivilege(1104);  //ˢ��
     SetEnViable(fun_refresh_all_dev,Pr);
     if not fun_refresh_all_dev.Visible then
     begin
       ToolButton33.Visible:=false;
     end;

 Pr:=current_user.HasPrivilege(1200);  //��ͼ����
 SetEnViable(N49,Pr);
 SetEnViable(tool_zoom_in,Pr);
 SetEnViable(tool_zoom_out,Pr);
 SetEnViable(tool_move,Pr);

     Pr:=current_user.HasPrivilege(1201);  //�Ŵ�
     SetEnViable(tool_zoom_in,Pr);

     Pr:=current_user.HasPrivilege(1202);  //��С
     SetEnViable(tool_zoom_out,Pr);

     Pr:=current_user.HasPrivilege(1203);  //�ƶ�
     SetEnViable(tool_move,Pr);

     Pr:=current_user.HasPrivilege(1204);  //�鿴ĳ�����Ϣ
     SetEnViable(tool_locate,Pr);

     Pr:=current_user.HasPrivilege(1205);  //���
     SetEnViable(tool_distance,Pr);

     Pr:=current_user.HasPrivilege(1206);  //���õ���Χ������
     SetEnViable(tool_RectSelect,Pr);

     Pr:=current_user.HasPrivilege(1207);  //ͼ�����
     SetEnViable(tool_layer_control,Pr);

     Pr:=current_user.HasPrivilege(1208);  //��ӹ�������
     SetEnViable(tool_SetFactory,Pr);




 Pr:=current_user.HasPrivilege(1300);  //���
 SetEnViable(N64,Pr);


     Pr:=current_user.HasPrivilege(1301);  //���г���
     SetEnViable(fun_callDev,Pr);
     SetEnViable(fun_Devs_CallDev,Pr);

     Pr:=current_user.HasPrivilege(1302);  //׷�ٳ���
     SetEnViable(fun_PursueDev,Pr);
     SetEnViable(fun_Devs_PursueDev,Pr);
     if (not fun_Devs_CallDev.Visible)and(not fun_Devs_PursueDev.Visible)then
     begin
       ToolButton31.Visible:=false;
     end;

     Pr:=current_user.HasPrivilege(1303);  //��ȡ����
     SetEnViable(fun_view_DevParam,Pr);


     Pr:=current_user.HasPrivilege(1304);  //���ò���
     SetEnViable(fun_Set_DevParam,Pr);
     SetEnViable(fun_Devs_SetParam,Pr);

     Pr:=current_user.HasPrivilege(1305);  //���õ绰��
     SetEnViable(fun_SetDevTelList,Pr);
     SetEnViable(fun_Devs_SetDevTelList,Pr);

     Pr:=current_user.HasPrivilege(1306);  //���ı�������Ϣ
     SetEnViable(fun_SendControlInfo,Pr);
     SetEnViable(fun_Devs_SendControlInfo,Pr);

     Pr:=current_user.HasPrivilege(1307);  //����ظ��ĵ�����Ϣ
     SetEnViable(fun_SendControlInfo_NeedAnswer,Pr);
     SetEnViable(fun_Devs_SendControlInfo_NeedAnswer,Pr);
     if  (not fun_SendControlInfo.Visible)and(not fun_SendControlInfo_NeedAnswer.Visible) then
     begin
       ToolButton24.Visible:=false;
     end;

     Pr:=current_user.HasPrivilege(1308);  //�޸���ʾ�̶��˵�
     SetEnViable(fun_ModifyLCDMenu,Pr);
     SetEnViable(fun_Devs_ModifyLCDMenu,Pr);

     Pr:=current_user.HasPrivilege(1309);  //�޸���ʾ����������Ϣ
     SetEnViable(fun_ModifyDisplayName,Pr);
     SetEnViable(fun_Devs_ModifyDisplayName,Pr);


     Pr:=current_user.HasPrivilege(1310);  //���������̼�����
     SetEnViable(fun_UpdateDevFirmWare,Pr);
     SetEnViable(fun_Devs_UpdateFirmWare,Pr);

     Pr:=current_user.HasPrivilege(1311);  //���üƼ���ͣ��ʱ��
     SetEnViable(fun_TaxiMeterStopDateTime,Pr);
     SetEnViable(fun_Devs_TaxiMeterStopDateTime,Pr);

     Pr:=current_user.HasPrivilege(1312);  //ȡ�������Ĳ˵�
     SetEnViable(fun_CancelOrderMenu,Pr);
     SetEnViable(fun_Devs_CancelOrderMenu,Pr);

     Pr:=current_user.HasPrivilege(1313);  //���Ͷ���
     SetEnViable(fun_SendOrder,Pr);
     if VersionFor='ZB' then    //for �б����ܶ�������
     begin
       fun_SendOrder.Visible:=false;
       fun_SendOrder.Enabled:=false;
     end;
     
     Pr:=current_user.HasPrivilege(1314);  //���Ͷ��Ͷϵ�
     SetEnViable(fun_SetCutOilElec,Pr);

     Pr:=current_user.HasPrivilege(1315);  //��ʾ/���س���
     SetEnViable(fun_DevHide,Pr);
     SetEnViable(fun_Devs_Show,Pr);


     Pr:=current_user.HasPrivilege(1316);//����
     SetEnViable(fun_GetAPicture,Pr);


     Pr:=current_user.HasPrivilege(1317);//��ȡGPRS����
     SetEnViable(fun_ReadGPRSFlux,Pr);


     Pr:=current_user.HasPrivilege(1318);//��ȡ��ǰ˾����Ϣ
     SetEnViable(fun_ReadDriverInfo,Pr);


     Pr:=current_user.HasPrivilege(1319);  //���͹��
     SetEnViable(fun_SendAdInfo,Pr);

     

     Pr:=current_user.HasPrivilege(1320);  //ɾ�����
     SetEnViable(fun_SendDelAdInfo,Pr);



     Pr:=current_user.HasPrivilege(1321);  //����ʹ������������绰
     SetEnViable(fun_SendListenTEL,Pr);


     Pr:=current_user.HasPrivilege(1322);  //����ɲ����ƽ
     SetEnViable(fun_BrakeState,Pr);


     //Pr:=current_user.HasPrivilege(1323);  //��������ͨ��
     //SetEnViable(fun_CallDriver,Pr);
     if not GlobalParam.IsUseTelServer then
     fun_CallDriver.Visible:=false;//GlobalParam.IsUseTelServer;





 Pr:=current_user.HasPrivilege(1400);  //��Ϣ�鿴
 SetEnViable(N135,Pr);

     Pr:=current_user.HasPrivilege(1401);  //�鿴������Ϣ
     SetEnViable(ck_DevInfo,Pr);
     if not ck_DevInfo.Visible  then
     begin
       ToolButton23.Visible:=false;
     end;

     Pr:=current_user.HasPrivilege(1402);  //�鿴������Ϣ
     SetEnViable(ck_DriverInfo,Pr);

     Pr:=current_user.HasPrivilege(1403);  //�ѷ�������Ϣ��ѯ
     SetEnViable(ck_SendMsgList,Pr);

     Pr:=current_user.HasPrivilege(1404);  //�ѷ�������ѯ
     SetEnViable(ck_SendOrderList,Pr);
     if VersionFor='ZB' then    //for �б����ܶ�������
     begin
       ck_SendOrderList.Visible:=false;
       ck_SendOrderList.Enabled:=false;
     end;



 Pr:=current_user.HasPrivilege(1500);  //����
 SetEnViable(N96,Pr);

     Pr:=current_user.HasPrivilege(1501);  //������ʹ�켣����
     SetEnViable(set_AllCarTrack,Pr);

     Pr:=current_user.HasPrivilege(1502);  //��ͼͼ������
     SetEnViable(N98,Pr);

         Pr:=current_user.HasPrivilege(1503);  //����ͼ��
         SetEnViable(map_openLayer,Pr);

         Pr:=current_user.HasPrivilege(1504);  //ɾ��ͼ��
         SetEnViable(map_CloseLayer,Pr);

     Pr:=current_user.HasPrivilege(1505);  //���ñ�������
     SetEnViable(set_AlarmSound,Pr);

     Pr:=current_user.HasPrivilege(1506);  //���汾������
     SetEnViable(set_SaveWorkShop,Pr);

     Pr:=current_user.HasPrivilege(1507);  //ϵͳ����
     SetEnViable(SystemConfig,Pr);

     Pr:=current_user.HasPrivilege(11);    //�켣�ط�
     //Pr.Visible:=false;
     //Pr.Enabled:=false;
     ToolButton38.Visible:=false;
     SetEnViable(fun_History,Pr);


      Pr:=current_user.HasPrivilege(8193);  //ϵͳ����
      SetEnViable(ck_TaxiMetaRunData,Pr);
      Pr:=current_user.HasPrivilege(8194);  //ϵͳ����
      SetEnViable(ck_taximetaRundataTj,Pr);



     if VersionFor='ZT' then
     begin
       fun_GetAPicture.Visible:=false;
       fun_Devs_GetAPicture.Visible:=false;
       fun_ReadDriverInfo.Visible:=false;
       ck_Picture.Visible:=false;
       fun_SendOrder.Visible:=false;
       fun_SetCutOilElec.Visible:=false;
       fun_Devs_TaxiMeterStopDateTime.Visible:=false;
       fun_TaxiMeterStopDateTime.Visible:=false;
       ck_SendOrderList.Visible:=false;
       fun_CancelOrderMenu.Visible:=false;
       fun_ModifyLCDMenu.Visible:=false;
       fun_ModifyDisplayName.Visible:=false;
       fun_SendControlInfo.Visible:=false;
       fun_SendControlInfo_NeedAnswer.Visible:=false;
       fun_Devs_CancelOrderMenu.Visible:=false;
       fun_Devs_ModifyDisplayName.Visible:=false;
       fun_Devs_ModifyLCDMenu.Visible:=false;
       fun_Devs_SetDevTelList.Visible:=false;
       fun_SetDevTelList.Visible:=false;
       fun_Devs_SendControlInfo.Visible:=false;
       fun_Devs_SendControlInfo_NeedAnswer.Visible:=false;

       fun_GetAPicture.Enabled:=false;
       fun_Devs_GetAPicture.Enabled:=false;
       fun_ReadDriverInfo.Enabled:=false;
       ck_Picture.Enabled:=false;
       fun_SendOrder.Enabled:=false;
       fun_SetCutOilElec.Enabled:=false;
       fun_Devs_TaxiMeterStopDateTime.Enabled:=false;
       fun_TaxiMeterStopDateTime.Enabled:=false;
       ck_SendOrderList.Enabled:=false;
       fun_CancelOrderMenu.Enabled:=false;
       fun_ModifyLCDMenu.Enabled:=false;
       fun_ModifyDisplayName.Enabled:=false;
       fun_SendControlInfo.Enabled:=false;
       fun_SendControlInfo_NeedAnswer.Enabled:=false;
       fun_Devs_CancelOrderMenu.Enabled:=false;
       fun_Devs_ModifyDisplayName.Enabled:=false;
       fun_Devs_ModifyLCDMenu.Enabled:=false;
       fun_Devs_SetDevTelList.Enabled:=false;
       fun_SetDevTelList.Enabled:=false;
       fun_Devs_SendControlInfo.Enabled:=false;
       fun_Devs_SendControlInfo_NeedAnswer.Enabled:=false;
     end;
{$IFNDEF ForTestUser}
       MenuItem97.Visible:=false;
       MenuItem97.Enabled:=false;
       N75.Visible:=false;
       N75.Enabled:=false;
       MenuItem85.Visible:=false;
       N96.Visible:=false;
       ToolBarMenu.Visible:=false;
       ToolBarMenu.Enabled:=false;

       Map_Manage.Visible:=false;
       fun_GetAPicture.Visible:=false;
       fun_Devs_GetAPicture.Visible:=false;
       fun_ReadDriverInfo.Visible:=false;
       ck_Picture.Visible:=false;
       fun_SendOrder.Visible:=false;
       fun_SetCutOilElec.Visible:=false;
       fun_Devs_TaxiMeterStopDateTime.Visible:=false;
       fun_TaxiMeterStopDateTime.Visible:=false;
       ck_SendOrderList.Visible:=false;
       fun_CancelOrderMenu.Visible:=false;
       fun_ModifyLCDMenu.Visible:=false;
       fun_ModifyDisplayName.Visible:=false;
       fun_SendControlInfo.Visible:=false;
       fun_SendControlInfo_NeedAnswer.Visible:=false;
       fun_Devs_CancelOrderMenu.Visible:=false;
       fun_Devs_ModifyDisplayName.Visible:=false;
       fun_Devs_ModifyLCDMenu.Visible:=false;
       fun_Devs_SetDevTelList.Visible:=false;
       fun_SetDevTelList.Visible:=false;
       fun_Devs_SendControlInfo.Visible:=false;
       fun_Devs_SendControlInfo_NeedAnswer.Visible:=false;

       fun_GetAPicture.Enabled:=false;
       fun_Devs_GetAPicture.Enabled:=false;
       fun_ReadDriverInfo.Enabled:=false;
       ck_Picture.Enabled:=false;
       fun_SendOrder.Enabled:=false;
       fun_SetCutOilElec.Enabled:=false;
       fun_Devs_TaxiMeterStopDateTime.Enabled:=false;
       fun_TaxiMeterStopDateTime.Enabled:=false;
       ck_SendOrderList.Enabled:=false;
       fun_CancelOrderMenu.Enabled:=false;
       fun_ModifyLCDMenu.Enabled:=false;
       fun_ModifyDisplayName.Enabled:=false;
       fun_SendControlInfo.Enabled:=false;
       fun_SendControlInfo_NeedAnswer.Enabled:=false;
       fun_Devs_CancelOrderMenu.Enabled:=false;
       fun_Devs_ModifyDisplayName.Enabled:=false;
       fun_Devs_ModifyLCDMenu.Enabled:=false;
       fun_Devs_SetDevTelList.Enabled:=false;
       fun_SetDevTelList.Enabled:=false;
       fun_Devs_SendControlInfo.Enabled:=false;
       fun_Devs_SendControlInfo_NeedAnswer.Enabled:=false;


     //Pr:=current_user.HasPrivilege(1204);  //�鿴ĳ�����Ϣ
     Pr.Visible:=false;
     Pr.Enabled:=false;
     SetEnViable(tool_locate,Pr);

     //Pr:=current_user.HasPrivilege(1204);  //�鿴ĳ�����Ϣ
     SetEnViable(tool_locate,Pr);




     //Pr:=current_user.HasPrivilege(1205);  //���
     SetEnViable(tool_distance,Pr);

     //Pr:=current_user.HasPrivilege(1206);  //���õ���Χ������
     SetEnViable(tool_RectSelect,Pr);

     //Pr:=current_user.HasPrivilege(1207);  //ͼ�����
     SetEnViable(tool_layer_control,Pr);


// Pr:=current_user.HasPrivilege(1300);  //���
 SetEnViable(N64,Pr);


     //Pr:=current_user.HasPrivilege(1301);  //���г���
     SetEnViable(fun_callDev,Pr);
     SetEnViable(fun_Devs_CallDev,Pr);

     //Pr:=current_user.HasPrivilege(1302);  //׷�ٳ���
     SetEnViable(fun_PursueDev,Pr);
     SetEnViable(fun_Devs_PursueDev,Pr);
     if (not fun_Devs_CallDev.Visible)and(not fun_Devs_PursueDev.Visible)then
     begin
       ToolButton31.Visible:=false;
     end;

     //Pr:=current_user.HasPrivilege(1303);  //��ȡ����
     SetEnViable(fun_view_DevParam,Pr);


     //Pr:=current_user.HasPrivilege(1304);  //���ò���
     SetEnViable(fun_Set_DevParam,Pr);
     SetEnViable(fun_Devs_SetParam,Pr);

     //Pr:=current_user.HasPrivilege(1305);  //���õ绰��
     SetEnViable(fun_SetDevTelList,Pr);
     SetEnViable(fun_Devs_SetDevTelList,Pr);

     //Pr:=current_user.HasPrivilege(1306);  //���ı�������Ϣ
     SetEnViable(fun_SendControlInfo,Pr);
     SetEnViable(fun_Devs_SendControlInfo,Pr);

     //Pr:=current_user.HasPrivilege(1307);  //����ظ��ĵ�����Ϣ
     SetEnViable(fun_SendControlInfo_NeedAnswer,Pr);
     SetEnViable(fun_Devs_SendControlInfo_NeedAnswer,Pr);
     if  (not fun_SendControlInfo.Visible)and(not fun_SendControlInfo_NeedAnswer.Visible) then
     begin
       ToolButton24.Visible:=false;
     end;

     //Pr:=current_user.HasPrivilege(1308);  //�޸���ʾ�̶��˵�
     SetEnViable(fun_ModifyLCDMenu,Pr);
     SetEnViable(fun_Devs_ModifyLCDMenu,Pr);

     //Pr:=current_user.HasPrivilege(1309);  //�޸���ʾ����������Ϣ
     SetEnViable(fun_ModifyDisplayName,Pr);
     SetEnViable(fun_Devs_ModifyDisplayName,Pr);


     //Pr:=current_user.HasPrivilege(1310);  //���������̼�����
     SetEnViable(fun_UpdateDevFirmWare,Pr);
     SetEnViable(fun_Devs_UpdateFirmWare,Pr);

     //Pr:=current_user.HasPrivilege(1311);  //���üƼ���ͣ��ʱ��
     SetEnViable(fun_TaxiMeterStopDateTime,Pr);
     SetEnViable(fun_Devs_TaxiMeterStopDateTime,Pr);

     //Pr:=current_user.HasPrivilege(1312);  //ȡ�������Ĳ˵�
     SetEnViable(fun_CancelOrderMenu,Pr);
     SetEnViable(fun_Devs_CancelOrderMenu,Pr);

     //Pr:=current_user.HasPrivilege(1313);  //���Ͷ���
     SetEnViable(fun_SendOrder,Pr);

     
     //Pr:=current_user.HasPrivilege(1314);  //���Ͷ��Ͷϵ�
     SetEnViable(fun_SetCutOilElec,Pr);

     //Pr:=current_user.HasPrivilege(1315);  //��ʾ/���س���
     SetEnViable(fun_DevHide,Pr);
     SetEnViable(fun_Devs_Show,Pr);


     //Pr:=current_user.HasPrivilege(1316);//����
     SetEnViable(fun_GetAPicture,Pr);


     //Pr:=current_user.HasPrivilege(1317);//��ȡGPRS����
     SetEnViable(fun_ReadGPRSFlux,Pr);


     //Pr:=current_user.HasPrivilege(1318);//��ȡ��ǰ˾����Ϣ
     SetEnViable(fun_ReadDriverInfo,Pr);





 //Pr:=current_user.HasPrivilege(1400);  //��Ϣ�鿴
 SetEnViable(N135,Pr);

     //Pr:=current_user.HasPrivilege(1401);  //�鿴������Ϣ
     SetEnViable(ck_DevInfo,Pr);
     if not ck_DevInfo.Visible  then
     begin
       ToolButton23.Visible:=false;
     end;

     //Pr:=current_user.HasPrivilege(1402);  //�鿴������Ϣ
     SetEnViable(ck_DriverInfo,Pr);

     //Pr:=current_user.HasPrivilege(1403);  //�ѷ�������Ϣ��ѯ
     SetEnViable(ck_SendMsgList,Pr);

     //Pr:=current_user.HasPrivilege(1404);  //�ѷ�������ѯ
     SetEnViable(ck_SendOrderList,Pr);




 //Pr:=current_user.HasPrivilege(1500);  //����
 SetEnViable(N96,Pr);

     //Pr:=current_user.HasPrivilege(1501);  //������ʹ�켣����
     SetEnViable(set_AllCarTrack,Pr);

     //Pr:=current_user.HasPrivilege(1502);  //��ͼͼ������
     SetEnViable(N98,Pr);

         //Pr:=current_user.HasPrivilege(1503);  //����ͼ��
         SetEnViable(map_openLayer,Pr);

         //Pr:=current_user.HasPrivilege(1504);  //ɾ��ͼ��
         SetEnViable(map_CloseLayer,Pr);

     //Pr:=current_user.HasPrivilege(1505);  //���ñ�������
     SetEnViable(set_AlarmSound,Pr);

     //Pr:=current_user.HasPrivilege(1506);  //���汾������
     SetEnViable(set_SaveWorkShop,Pr);

     //Pr:=current_user.HasPrivilege(1507);  //ϵͳ����
     SetEnViable(SystemConfig,Pr);

     //Pr:=current_user.HasPrivilege(11);    //�켣�ط�
     ToolButton38.Visible:=false;
     SetEnViable(fun_History,Pr);


{$ENDIF}


end;


procedure TMainf.fun_TaxiMeterStopDateTimeExecute(Sender: TObject);
var
  dlg: TTaxiMeterStopDateTimeFrm;
begin
  if not CheckDevId then
  begin
    fun_Devs_TaxiMeterStopDateTimeExecute(Sender);
    exit;
  end;
  dlg:=TTaxiMeterStopDateTimeFrm.Create(Self);
  try
    {����ѡ���� ��ͳһ��ѡ��������}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    Add_A_Device;
    dlg.ShowModal;
  finally
    dlg.Free;
  end;
end;

procedure TMainf.fun_Devs_TaxiMeterStopDateTimeExecute(Sender: TObject);
var
  dlg:TTaxiMeterStopDateTimeFrm;
begin
  dlg:=TTaxiMeterStopDateTimeFrm.Create(Nil);
  try
    {����ѡ���� ��ͳһ��ѡ��������}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    AddDeviceByGroup;
    dlg.ShowModal;
  finally
    dlg.Free;
  end;
end;



procedure TMainf.ck_DriverInfoExecute(Sender: TObject);
var
   frm: TDriverInfoFrm;
begin
  frm:= TDriverInfoFrm.Create(Self);
  try
    frm.ShowModal;
  finally
    frm.Free;
  end;
end;

procedure TMainf.fun_SendOrderExecute(Sender: TObject);
var
   Frm: TSendOrderMiniFrm;
begin
   Frm:=GetSendOrderFrm;
   FListView_SelectDevs := frm.ListView1;
   frm.Show;
   if ListSelectDev.Count >0 then
   begin
     AddDeviceFromListSelectDev;
   end
   else
   begin
     AddDeviceByGroup;
   end;
end;

procedure TMainf.SelectedExecute(Sender: TObject);
begin
    if FListView_SelectDevs = nil then exit;
    if ListSelectDev.Count=0 then
    begin
      PopMsg('��ʾ','��ѡ�еĳ���û�г�!'+#13+#10+'����"��ͼ����->����ѡ����"����ѡ��!');
      exit;
    end;
    AddDeviceFromListSelectDev;
end;

procedure TMainf.PopupMenu_cmdPopup(Sender: TObject);
var
  p: PCmdInfo;
begin
  if FDlg_Sended_Cmd.cxTreeList1.FocusedNode = nil  then
  begin
    cmd_cancel.Enabled:=false;
    cmd_reSend.Enabled:=false;
    exit;
  end;
  p := FDlg_Sended_Cmd.cxTreeList1.FocusedNode.Data ;
  if (P^.Flag  = TERMSRV_DOWNAORDER)or (P^.Flag  = TERMSRV_DOWNCANCELORDER  ) then
  begin
    cmd_cancel.Enabled:=false;
    cmd_reSend.Enabled:=false;
  end
  else
  begin
    cmd_cancel.Enabled:=true;
    cmd_reSend.Enabled:=true;
  end;
end;

procedure TMainf.fun_CancelOrderMenuExecute(Sender: TObject);
var
  Frm2: TCancelOrderMenu2Frm;
  Frm:TCancelOrderMenuFrm;
begin
   if not CheckDevId then
   begin
     fun_Devs_CancelOrderMenuExecute(Sender);
     exit;
   end;

if CancelMenuFun='QueryCancelMenu_zb' then
begin
   frm2:=TCancelOrderMenu2Frm.Create(Self);
   try
     frm2.ListView1.PopupMenu := PopupMenu_SelectDevs;
     FListView_SelectDevs := frm2.ListView1;
     Add_A_Device;
     frm2.ShowModal;
   finally
     frm2.Free;
   end;
end
else
begin
   frm:=TCancelOrderMenuFrm.Create(Self);
   try
     frm.ListView1.PopupMenu := PopupMenu_SelectDevs;
     FListView_SelectDevs := frm.ListView1;
     Add_A_Device;
     frm.ShowModal;
   finally
     frm.Free;
   end;
end;

end;

procedure TMainf.AddDeviceByGroup;
var
  Dev:TDevice;
  i:integer;
  grp: TDevGroup;
begin
  if  FListView_SelectDevs=nil then exit;
  FListView_SelectDevs.Clear;
  if GCurSelectGroupID= -1 then
  begin
    for i:= 0 to ADeviceManage.Count- 1 do
      with FListView_SelectDevs.Items.Add do
      begin
        caption:= ADeviceManage.Items[i].Car.No;
        data:= ADeviceManage.Items[i];
      end;
  end
  else if GCurSelectGroupID>=0 then
  begin
    grp := ADevGroupManage.find(GCurSelectGroupID);
    if grp= nil then exit;
    for i:= 0 to grp.DevListCount -1 do
    begin
      dev:= ADeviceManage.Find(grp.DevList[i]);
      if dev = nil then continue;
      with FListView_SelectDevs.Items.Add do
      begin
        caption:= dev.Car.No;
        data:= dev;
      end;
    end;
  end;
end;

procedure TMainf.fun_Devs_CancelOrderMenuExecute(Sender: TObject);
var
  Frm: TCancelOrderMenuFrm;
begin
   frm:=TCancelOrderMenuFrm.Create(Self);
   try
     frm.ListView1.PopupMenu := PopupMenu_SelectDevs;
     FListView_SelectDevs := frm.ListView1;
     AddDeviceByGroup;
     frm.ShowModal;
   finally
     frm.Free;
   end;
end;

procedure TMainf.Add_A_Device;
begin
  if  FListView_SelectDevs=nil then exit;
  if GCurSelectDev =nil then exit;
  FListView_SelectDevs.Clear;
  with FListView_SelectDevs.Items.Add do
  begin
    caption:= GCurSelectDev.Car.No;
    data:= GCurSelectDev;
  end;
end;
procedure TMainf.AddDeviceFromListSelectDev;
var
  i:integer;
  Dev:TDevice;
begin
   if  FListView_SelectDevs=nil then exit;
   if  ListSelectDev.Count=0 then exit;
   FListView_SelectDevs.Clear;
   for i:= 0 to ListSelectDev.Count -1 do
    with FListView_SelectDevs.Items.Add do
    begin
      dev:=TDevice(ListSelectDev.Items[i].Data) ;
      caption:= dev.Car.No;
      data := dev;
    end;
end;


function TMainf.SetDatetime: boolean;
var
 Datetime:TSystemTime;
 ServDatetime:TDatetime;
begin
  ServDatetime:=bs.GetDatetime;
  if ServDatetime<>now then
  begin
    Datetime.wYear:=yearof(ServDatetime);
    Datetime.wMonth:=monthof(ServDatetime);
    datetime.wDay:=Dayof(ServDatetime);
    Datetime.wHour:=hourof(ServDatetime);
    Datetime.wMinute:=minuteof(ServDatetime);
    Datetime.wSecond:=Secondof(ServDatetime);
    Datetime.wMilliseconds:=Millisecondof(ServDatetime);
    //SetSystemtime(Datetime);
    SetLocalTime(Datetime);
  end;
  Result:=true;
end;

procedure TMainf.cxSplitter1CanResize(Sender: TObject;
  var NewSize: Integer; var Accept: Boolean);
begin
  Accept:=false;
end;

procedure TMainf.DoulbeClickOrderList(Sender: TObject);
var
 frm:  TSendOrderMiniFrm;
 order:TOrder;  
begin
  if  FDlg_OrderList.cxOrderList.FocusedNode=nil then exit;
  order:=TOrder(FDlg_OrderList.cxOrderList.FocusedNode.Data);
  frm :=FindSendOrderFrm(order.ID);
  if frm <>nil then
  begin
    if frm.WindowState=wsMinimized then
    begin
       frm.WindowState:=wsNormal;

    end
    else
    begin
      frm.BringToFront;
    end;
    exit;
  end;
  frm:=GetSendOrderFrm;
  try
   //AOrderManage.isModified:=true;
   frm.Show;
   frm.ShowOrder(order);
  finally

  end;
end;

procedure TMainf.SplitterRightAfterOpen(Sender: TObject);
begin
  show_car.Checked:=not show_car.Checked;
end;

procedure TMainf.PopupMenu_DevGroupPopup(Sender: TObject);
begin
  ListSelectDev.Clear;
end;

procedure TMainf.Sel_Dev_EmptyExecute(Sender: TObject);
begin
   SelectDevFromListSelectDev(9,false);//�ھ�λ,falseΪ�ճ�;
end;

procedure TMainf.SelectDevFromListSelectDev(State: integer;Sel:boolean);
var
//  dev:TDevice;
  i:integer;
  SendOrderFrm:TSendOrderMiniFrm;
begin
  SendOrderFrm:=GetFocusSendOrderFrm;
  i:=0;
  ListSelectDev.BeginUpdate;
  while i< ListSelectDev.Count do
  begin
   if TDevice(ListSelectDev.Items[i].Data).Switch[State]<>Sel then
   begin
       ListSelectDev.Items[i].Delete;
       if SendOrderFrm<>nil then
       begin
           if SendOrderFrm.ListView1.Items.Count>i then
           begin
              SendOrderFrm.ListView1.Items.Item[i].Delete;
           end;
       end;
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
    SelectDevFromListSelectDev(9,true);//�ھ�λ,trueΪ�س�;
end;

procedure TMainf.Sel_Dev_OnlineExecute(Sender: TObject);
var
  dev:TDevice;
  i:integer;
begin
  i:=0;
  ListSelectDev.BeginUpdate;
  while i< ListSelectDev.Count do
  begin
    Dev:=TDevice(ListSelectDev.Items[i].Data);
    if Dev=nil then
    begin
      ListSelectDev.Items[i].Delete;
      continue;
    end;
    if not Dev.isOnline  then//  >�ǲ�����
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
    Sel_Dev_Online.Execute;//ɾ������λ.Ȼ����ѡ��λ��.��Ϊ,��λ�ı�������....
    SelectDevFromListSelectDev(0,true);//��0λ,true��λ;
end;

procedure TMainf.Sel_Dev_Not_OnlineExecute(Sender: TObject);
var
  dev:TDevice;
  i:integer;
begin
  i:=0;
  ListSelectDev.BeginUpdate;
  while i< ListSelectDev.Count do
  begin
     Dev:=TDevice(ListSelectDev.Items[i].Data);
   if Dev=nil then
   begin
     ListSelectDev.Items[i].Delete;
     continue;
   end;
   if Dev.isOnline  then//  <������
        ListSelectDev.Items[i].Delete
   else
     inc(i);
  end;
  ListSelectDev.EndUpdate;
end;


procedure TMainf.Sel_Dev_Not_PostionExecute(Sender: TObject);
begin
    SelectDevFromListSelectDev(0,false);//��0λ,false�Ƕ�λ;
end;

procedure TMainf.ck_SendMsgListExecute(Sender: TObject);
var
   frm:TSended_Message;
begin
  frm:=TSended_Message.Create(Self);
  try
    frm.ShowModal;
  finally
    frm.Free;
  end;
end;

procedure TMainf.ck_SendOrderListExecute(Sender: TObject);
var
 Frm: TOrderQueryListFrm;
begin
   Frm:=TOrderQueryListFrm.Create(Self);
   try
     frm.ShowModal;
   finally
     frm.Free;
   end;
end;




procedure TMainf.SplitterBottomBeforeOpen(Sender: TObject;
  var AllowOpen: Boolean);
begin
  //
end;

procedure TMainf.isOnline;
var
 i:integer;
 Downtime:integer;
 onlineCount:integer;
// log: TSystemLog;
begin
onlineCount:=0;
try
    for i:=0 to ADeviceManage.Count-1 do
    begin
      Downtime:=0;
      if ADeviceManage.Items[i].Param.PursueInterval<> '' then
      begin
          try
              Downtime:=StrToInt(ADeviceManage.Items[i].Param.PursueInterval)*5;
          except
              Downtime:=0;
          end;
      end;
      if Downtime=0 then Downtime:=60*5;
      Downtime:=Max(Downtime,GlobalParam.DownTime);
      if (SecondsBetween(now,ADeviceManage.Items[i].LastConnectTime)<=Downtime){and(DataServer.Active)} then
      begin     
          if not ADeviceManage.Items[i].isOnline then
          begin
                 if GlobalParam.isCarOnline then
                 begin
                     MSNPopUp2.Title:='��������  ';
                     MSNPopUp2.Text:=ADeviceManage.Items[i].Car.No+#13+#10+'����';
                     MSNPopUp2.ShowPopUp;
                 end;
          end;
          ADeviceManage.Items[i].isOnline:=true;
          inc(onlineCount);
      end
      else
      begin
         
         if ADeviceManage.Items[i].isOnline then
         begin
                 ADeviceManage.Items[i].isOnline:=false;
                 if GlobalParam.isCarUnOnline then
                 begin
                     MSNPopUp2.Title:='��������     ';
                     MSNPopUp2.Text:=ADeviceManage.Items[i].Car.No+#13+#10+'����  ';
                     MSNPopUp2.ShowPopUp;
                     if FileExists(GlobalParam.AlarmSound_CarUnOnline) then
                        PlaySound(Pchar(GlobalParam.AlarmSound_CarUnOnline),Hinstance,SND_FILENAME);
                 end;
         end;
      end;
    end;

    ValueListEditorOnline.Values['�ܳ�']:=IntToStr(ADeviceManage.Count);
    ValueListEditorOnline.Values['����']:=IntToStr(onlineCount);
    ValueListEditorOnline.Values['������']:=IntToStr(ADeviceManage.Count-onlineCount);
    ValueListEditorOnline.Values['������']:=IntToStr(Trunc(onlineCount/ADeviceManage.Count*100+0.5))+'%';


    if GlobalParam.isAllCarUnOnlineAlarm then
        if onlineCount=0 then
        begin
             if FileExists(GlobalParam.AlarmSound_CarUnOnline) then
                try
                    PlaySound(Pchar(GlobalParam.AlarmSound_CarUnOnline),Hinstance,SND_FILENAME)
                except
                    begin
                      //������ ����
                     // for I:=10 to 15 Do DoBleep(I*10,10);
                      //for I:=15 Downto 10 Do DoBleep(I*10,10);
                    end;
                end
             else
             begin
                //������ ����
                //for I:=10 to 15 Do DoBleep(I*10,10);
                //for I:=15 Downto 10 Do DoBleep(I*10,10);
             end;
        end;


except on E: Exception do
    uGloabVar.SystemLog.AddLog(' TMainf.isOnline��������: ',e.Message);
end;






end;

procedure TMainf.OnCarActionClick(Dev: TDevice);
var
  Str:string;
  Group:TDevGroup;
begin
try
  Str:='���ƺš�����:'+Dev.Car.No;
  Str:=str+#13+#10+'�豸���ơ���:'+Dev.DispLabel;
  if Dev.DriverNameTel<>'' then
  Str:=str+#13+#10+'˾������        :'+Dev.DriverNameTel;
  //Str:=str+#13+#10+'˾������:'+Dev.DriverTel;
  Group:=ADevGroupManage.Find(Dev.GroupID);
if Group<>nil then
  Str:=str+#13+#10+'���顡������:'+Group.name ;
  Str:=str+#13+#10+'�ӣɣͿ��š�:'+Dev.SimNo;
  Str:=Str+#13+#10+#13+#10;
//------------------------------------------------------------------------------
  if Dev.ShengName <>'' then
  begin
    Str:=Str+'�ص㡡������:'+Dev.ShengName;
    if dev.ShengName<>dev.ShiName then
    begin
      Str:=Str+'->'+Dev.ShiName;
    end;
    if dev.ShiName<> Dev.XianName then
    begin
      Str:=Str+'->'+Dev.XianName;
    end;
    Str:=Str+#13+#10;
  end;

  if Dev.isOnline then                   //�ж�״̬
  begin
    Str:=Str+'״̬��������:����';
    if Dev.Switch[STAT_GPS_LOCATE] then
    begin
      Str:=str+#13+#10+'�ǣУ�״̬��:��λ';
    end
    else
    begin
      Str:=str+#13+#10+'�ǣУ�״̬��:�Ƕ�λ';
    end;
  end
  else
  begin
      Str:=Str+'״̬��������:������'+#13+#10+'�ǣУ�״̬��:�Ƕ�λ';
  end;     
//------------------------------------------------------------------------------
  Str:=str+#13+#10+'�ٶȡ�������:'+intToStr(Dev.Speed);
  if  Dev.GpsTime<>0 then
  begin
     Str:=str+#13+#10+'�ǣУ�ʱ�䡡:'+FormatDatetime('yyyy-mm-dd hh:nn:ss',Dev.GpsTime);
  end
  else
  begin
     Str:=str+#13+#10+'�ǣУ�ʱ�䡡:'
  end;


  if (ListSelectDev.Count>0) then
  begin
      MapLabel.PopupMenu:=PopupMenuSelected;
      PageControl1.ActivePageIndex:=1;
      Str:=Str+#13+#10+'��ʾ��������:'+'�һ��ɶ�ѡ�г���Ⱥ������';
  end
  else
  begin
    MapLabel.PopupMenu:=PopupMenu_funDev;
    PageControl1.ActivePageIndex:=0;
    Str:=Str+#13+#10+'��ʾ��������:'+'�һ��ɶԴ˳���������';
  end;


  MapLabel.Hint:=Str;

  if GCurSelectDev =Dev then exit;
  GCurSelectDev :=Dev;
  Edit2.Text := IntToStr(GCurSelectDev.Id);
  Edit1.Text := GCurSelectDev.Car.No;
  ComboboxCarNO.Text:=Edit1.Text;

except on E: Exception do
    uGloabVar.SystemLog.AddLog(' TMainf.OnCarActionClick��������: ',e.Message);
end;

end;

procedure TMainf.Timer1Timer(Sender: TObject);
var
  P:Tpoint;// ,pp
  x,y:integer;
  DX,DY:integer;
  CaptureControl: TControl;
  XY:integer;
  Dev:TDevice;
begin
try
  if FMap.IsPlayGpsData then exit;
  if ADeviceManage.CurrentDevOnTheMapIsUse then exit;
  if not(FMap.MouseAction in [actNoAction,actMove,actRectSelect])then exit;
  if EarthRect.isCanUse then
  begin
    if ListSelectDev.Count>0 then
    begin
       if (Lo>EarthRect.SX)and(Lo<EarthRect.EX)and(La>EarthRect.SY)and(La<EarthRect.EY) then
       begin
          //uGloabVar.FMap.popupMenu:=PopupMenuSelected;

          FMap.Hint:='��ʾ:'+#13+#10+'����ѡ��'+intToStr(ListSelectDev.Count)+'����'+#13+#10;
          FMap.Hint:=FMap.Hint+'�����һ��ɶ�ѡ�г���Ⱥ������';
          FMap.ShowHint:=true;
          exit;
       end;
    end
    else
    begin
      EarthRect.isCanUse:=false;
    end;
  end;
  FMap.PopupMenu:=nil;
  FMap.ShowHint:=false;



 GetCursorPos(p);
 CaptureControl:=FindDragTarget(P, True);
 if CaptureControl<>nil then
 begin
   if CaptureControl.Name<>'FMap' then exit;
 end
 else
 begin
   exit;
 end;

  if Self.WindowState =wsMaximized then
  begin
   x:=p.X;
   y:=p.Y;
  end
  else if Self.WindowState = wsNormal then
  begin
    x:=p.X-Self.Left-4;
    y:=p.Y-Self.Top-4;
  end
  else
  begin
    exit;
  end;
  x:=X-panel10.Left;
  y:=Y-panel10.Top;

  x:=x- FDlg_Map.Panel_Map.Left;
  y:=Y- FDlg_Map.Panel_Map.Top;

  x:=x-FDlg_Map.Panel_Map.Left;
  y:=y-FDlg_Map.Panel_Map.Top-38;

  xy:=(X shl 16)+Y;

  Dev:=ADeviceManage.FindDevOnTheMap(XY,DX);
  if Dev=nil then
  begin
//    HintWindowClass:=THintWindow;
    Application.HintPause:=500;
    MapLabel.Hide;
    exit;
  end;
  DY:=DX and $FFFF;
  DX:=DX shr 16;
  if ((DX>=X)and(DX<=(X+16)))and((DY>=Y)and(Dy<=(Y+16))) then
  begin
   MapLabel.Left:=DX-8;
   MapLabel.Top:=DY-8;
   OnCarActionClick(Dev);
   Application.HintPause:=0;
// HintWindowClass:=THintWin;
   MapLabel.Show;
  end
  else
  begin
//  HintWindowClass:=THintWindow;
    Application.HintPause:=500;
    MapLabel.Hide;
  end;

except on E: Exception do
    uGloabVar.SystemLog.AddLog(' TMainf.Timer1Timer��������: ',e.Message);
end;
end;

procedure TMainf.OnMapLabelMouseMove(Shift: TShiftState; X, Y: Integer);
var
  DX,DY:integer;
  XY:integer;
  Dev:TDevice;
begin
try

   if not timer1.Enabled then  exit;
   if ADeviceManage.CurrentDevOnTheMapIsUse then exit;
   if not(FMap.MouseAction in [actNoAction,actMove,actRectSelect])then exit;

    if EarthRect.isCanUse then
    begin
      if ListSelectDev.Count>0 then
      begin
         if (Lo>EarthRect.SX)and(Lo<EarthRect.EX)and(La>EarthRect.SY)and(La<EarthRect.EY) then
         begin
            FMap.PopupMenu:=PopupMenuSelected;

            FMap.Hint:='��ʾ:'+#13+#10+'����ѡ��'+intToStr(ListSelectDev.Count)+'����'+#13+#10;
            FMap.Hint:=FMap.Hint+'�����һ��ɶ�ѡ�г���Ⱥ������';
            FMap.ShowHint:=true;
            exit;
         end;
      end
      else
      begin
        EarthRect.isCanUse:=false;
      end;
    end;
    FMap.PopupMenu:=nil;
    FMap.ShowHint:=false;
  
    xy:=(X shl 16)+Y;
    Dev:=ADeviceManage.FindDevOnTheMap(XY,DX);
    if Dev=nil then
    begin
  //   HintWindowClass:=THintWindow;
     Application.HintPause:=500;
     MapLabel.Hide;
     exit;
    end;
    DY:=DX and $FFFF;
    DX:=DX shr 16;
    if ((DX>=X)and(DX<=(X+16)))and((DY>=Y)and(Dy<=(Y+16))) then
    begin
     MapLabel.Left:=DX-8;
     MapLabel.Top:=DY-8;
     OnCarActionClick(Dev);
     Application.HintPause:=0;
  //   HintWindowClass:=THintWin;
     MapLabel.Show;
    end
    else
    begin
      Application.HintPause:=500;
  //    HintWindowClass:=THintWindow;
      MapLabel.Hide;
    end;

except on E: Exception do
    uGloabVar.SystemLog.AddLog(' TMainf.OnMapLabelMouseMove��������: ',e.Message);
end;
end;

procedure TMainf.GetMapRectSelect_Rect(PointA, PointB: TEarthPoint);
begin
  if (PointA.x<PointB.x) then
  begin
     EarthRect.SX :=PointA.x;    //SXΪ��ʼX��(Strat) ,EXΪ����X��(end).
     EarthRect.EX :=PointB.x;
  end
  else
  begin
     EarthRect.SX :=PointB.x;
     EarthRect.EX :=PointA.X;
  end;

  if (PointA.y <PointB.y) then
  begin
     EarthRect.SY :=PointA.y;   //SYΪ��ʼY��(Strat) ,EYΪY������(End)
     EarthRect.EY :=PointB.y;
  end
  else
  begin
     EarthRect.SY :=PointB.y;
     EarthRect.EY :=PointA.y;
  end;
  EarthRect.isCanUse:=true;
end;

procedure TMainf.FCallClientOnCallIn(Sender: TObject; ATelephone: String;
  ACallLogID: Integer);
var
  frm: TSendOrderMiniFrm;
begin
  LastTelephone := ATelephone;
  frm:= GetSendOrderFrm;
  if Frm<> nil then
  begin
    frm.Show;
    frm.EditCustomTel.Text:=LastTelephone;
    frm.EditName.Visible:=true;
    frm.EditName.Enabled:=true;
    frm.EditName.SetFocus;
  end
  else
  begin
    PopMsg('��ʾ','ϵͳ����!')
  end;
end;

procedure TMainf.InitCallClient;
begin
    FCallClient.ServerAddress:=GlobalParam.TelServer.Host;
    FCallClient.ServerPort:=IntToStr(GlobalParam.TelServer.Port);
    FCallClient.ClientType := 0;    //��ʾ�ǵ��ȿͻ���
    FCallClient.UserChannelNo := GlobalParam.TelChannel;
    FCallClient.OnReceiveTelephone := FCallClientOnCallIn;
    FCallClient.OnClientEvent := FCallClientOnEvent;
    FCallClient.OnUserClientCountChange:=FClientCountChangeEvent;
    FCallClient.OnUserChannelEvent:=FClientUserChannelEvent;
    //FCallClient.OnUserClientCountChange :=FClientCountChangeEvent;
    if  GlobalParam.IsUseTelServer then
    begin
      TimerCallTimer(TimerCall);
    end
    else
    begin
      StatusBar1.Panels.Items[6].Width:=0;
    end;        
end;

procedure TMainf.FCallClientOnEvent(Sender: TObject; EventCode,
  AParam: Integer);
  
begin
  case EventCode of
    EVENT_CLIENT_REGISTER_OK:
    begin
      TimerCall.Enabled := False;
      StatusBar1.Panels[2].Text:='���ӵ绰�������ɹ���';
      StatusBar1.Panels[6].ImageIndex:=3;
      fun_SwitchToMe.Visible:=true;
      fun_TermToTouShu.Visible:=true;
      fun_CallDriver.Visible:=true;
      fun_CallDriver.Enabled:=true;
    end;
    EVENT_CLIENT_INVALID_CHANNNEL:
    begin
      StatusBar1.Panels[2].Text:='ͨ���Ų�����,���ӵ绰������ʧ��';
      PopMsg('��ʾ','ͨ���Ų�����,���ӵ绰������ʧ��');
    end;
    EVENT_CLIENT_CHANNEL_INUSE:
    begin
      StatusBar1.Panels[2].Text:='ͨ�����ѱ�ע��,���ӵ绰������ʧ��';
      PopMsg('��ʾ','ͨ�����ѱ�ע��,���ӵ绰������ʧ��');

    end;
    EVENT_SOCKET_ERROR:
    begin
      if not GlobalParam.IsUseTelServer  then
      begin
        exit;
      end;
      StatusBar1.Panels[2].Text:='���ӵ绰������ʧ��';
      PopMsg('��ʾ','���ӵ绰������ʧ��');
      FCallClient.StopWork;
      if TimerCall.Interval<30000 then
        TimerCall.Interval:=TimerCall.Interval+TimerCall.Interval;
      TimerCall.Enabled := True;
      fun_SwitchToMe.Visible:=false;
      fun_TermToTouShu.Visible:=false;
      fun_CallDriver.Visible:=false;
      TelIsRing:=false;
      TelIsConnect:=false;
      TelCount.Pause:=0;
      TelCount.Ready:=0;
      TelCount.Busy:=0;
    end;
    EVENT_CLIENT_ALLOW_CHANGE_STATE:
    begin
      TimerCall.Enabled := False;
      StatusBar1.Panels[6].ImageIndex:=3;
    end;
    EVENT_CLIENT_DISALLOW_CHANGE_STATE:
    begin
      StatusBar1.Panels[2].Text:='��������������ı�״̬,�ı�״̬ʧ��.';
      PopMsg('��ʾ','��������������ı�״̬,�ı�״̬ʧ��.');
      if AParam= CLIENT_STATE_PAUSE then FCallClient.PauseWork;
    end;
  end;       
end;

procedure TMainf.TimerCallTimer(Sender: TObject);
begin
  TimerCall.Enabled:=false;
  if not GlobalParam.IsUseTelServer then exit;
  try
    StatusBar1.Panels[2].Text:='���ӵ绰��������...';
    FCallClient.ServerAddress:=GlobalParam.TelServer.Host;
    FCallClient.ServerPort:=IntToStr(GlobalParam.TelServer.Port);
    FCallClient.StartWork;
  except on E: Exception do
    PopMsg('��ʾ',E.Message);
  end;        
end;

procedure TMainf.FClientUserChannelEvent(Sender: TObject;
  EventCode: Integer);
begin
  case EventCode of
    USER_EVENT_TALKWITH: //'�û���ͨ���ߵ绰';
      begin
       TelIsConnect:=true;
       TelIsRing:=false;
       StatusBar1.Panels[2].Text:='���ѽ�ͨ���ߵ绰!';
      end;
    USER_EVENT_PICKUP:// '�û�ժ��,�Ƿ�����Ԥ�ڵ�';
      begin
         if GlobalParam.IsFTelNotClose then popMsg('��ʾ','����û�е绰����'+#13+#10+'��ҵ绰...');
         StatusBar1.Panels[2].Text:='����û�е绰����,��ҵ绰...';
         //FCallClient.SwitchToMe;
      end;
    USER_EVENT_RING:// '�û�ͨ���ĵ绰��ʼ����';
      begin
        TelIsRing:=true;
        if GetFocusSendOrderFrm =nil then
        begin
          if GlobalParam.IsTelCall then PopMsg('��ʾ','���绰��...');
        end;
         StatusBar1.Panels[2].Text:='���绰��...';
      end;
    USER_EVENT_WAIT_EXT_HANGUP://'�ȴ���ͨ�������ѹҶ�';
      begin
        TelIsRing:=false;
        StatusBar1.Panels[2].Text:='�ͻ��Ҷϵ绰��!';
      end;
    USER_EVENT_TALK_HANGUP: //'����ͨ����,�û����ȹһ�';
      begin
        TelIsConnect:=false;
        if GlobalParam.IsFirstCutTel then  PopMsg('��ʾ','�벻Ҫ�ȹҶϿͻ��绰!');
        StatusBar1.Panels[2].Text:='�벻Ҫ�ȹҶϿͻ��绰!';
      end;
    USER_EVENT_TALK_EXTHANGUP: //'����ͨ����,�������ȹһ�';
      begin
        TelIsConnect:=false;
        StatusBar1.Panels[2].Text:='�ͻ��绰�ѹ�,��ҵ绰...';
      end;
    USER_EVENT_TALK_FINISH_HANGUP:// 'ͨ������,���߹һ���,���߹һ�';
      begin
        TelIsConnect:=false;
        StatusBar1.Panels[2].Text:='�绰�ѹҺ�!';
      end;
    USER_EVENT_WAIT_TIMEOUT: //'�û�����δ�����绰,�绰�ѱ������Ŷ�';
      begin
        TelIsRing:=false;
      end;
    USER_EVENT_HANGUP: //'�û��һ�,�Ƿ�����Ԥ�ڵ�';
      begin
        TelIsConnect:=false;
        StatusBar1.Panels[2].Text:='�绰�ѹҺ�!';
      end;
    else
      exit;
  end;
end;

procedure TMainf.FClientCountChangeEvent(Sender: TObject;
  ClientCount: TClientCountData);
begin
  TelCount:=ClientCount;
end;

function TMainf.TelStateCanDo: boolean;
begin
  Result:=true;
  if not GlobalParam.IsUseTelServer then
  begin
    exit;
  end;
  if  TelIsRing  then
  begin
    MessageBox(Self.Handle,pchar('���ڵ绰��������'+#13+#10+'�벻Ҫ������ע���͹ر�'),'��ʾ',mb_ok + mb_iconinformation);
    Result:=false;
  end;
  if TelIsConnect then
  begin
    MessageBox(Self.Handle,pchar('���ڵ绰��ͨ����'+#13+#10+'�벻Ҫ������ע���͹ر�'),'��ʾ',mb_ok + mb_iconinformation);
    Result:=false;
  end;
  
  if FCallClient.Work then
  begin
    if Result and((TelCount.Idle+TelCount.Busy)<=1) then
    begin
      MessageBox(Self.Handle,pchar('����ֻ�д˵绰����'+#13+#10+'�벻Ҫ������ע���͹ر�'),'��ʾ',mb_ok + mb_iconinformation);
      Result:=false;
    end;
  end;
end;

procedure TMainf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FCallClient.StopWork;
end;

procedure TMainf.SystemConfigExecute(Sender: TObject);
var
 frm: TSystemConfigFrm ;
begin
  frm:=TSystemConfigFrm.Create(nil);
  try
    frm.ShowModal;
    if frm.ModalResult=mrOK then
    begin
       if messagebox(handle,'�����������óɹ�!�Ƿ�Ҫע����','��ʾ',MB_YESNO + MB_ICONQUESTION)= ID_YES then
       sys_off.Execute;
    end; 
  finally
    frm.Free;
  end;
end;

//ǹ��,�ѵ绰ת�����ѵ绰��.
procedure TMainf.fun_SwitchToMeExecute(Sender: TObject);
begin
fun_SwitchToMe.Enabled:=false;
try
  if  FCallClient.Work  then
  begin
    FCallClient.SwitchToMe;
  end;
finally
fun_SwitchToMe.Enabled:=true;
end;
end;

//תͶ�ߵ绰
procedure TMainf.fun_TermToTouShuExecute(Sender: TObject);
begin
fun_TermToTouShu.Enabled:=false;
try
  if (FCallClient.Work)and TelIsConnect then
  FCallClient.NotifyServerErrorCall;
finally
 fun_TermToTouShu.Enabled:=true;
end;
end;

procedure TMainf.fun_SetCutOilElecExecute(Sender: TObject);
var
  Frm: TCutOilElecForm;
begin
  if not CheckDevId then
  begin
   messagebox(0,'���ȡ��ڼ�س����б�ѡ�С��������Ͻ����롷����!','��ʾ',mb_ok + mb_iconinformation);
   exit;
  end;
  Frm:= TCutOilElecForm.Create(Self);
  try
    FListView_SelectDevs := frm.ListView1;
    Add_A_Device;
    Frm.ShowModal;
  finally
     frm.Free;
  end;
end;

procedure TMainf.fun_DevHideExecute(Sender: TObject);
begin
   if GCurSelectDev<>nil then
   begin
     GCurSelectDev.Hide:=not GCurSelectDev.Hide;
     fun_DevHide.Checked:=GCurSelectDev.Hide;
     FMap.DrawGpsMap_ClearDraw;
   end;
end;

procedure TMainf.fun_Devs_ShowExecute(Sender: TObject);
var
  Dev:TDevice;
  i:integer;
  grp: TDevGroup;
begin
  if GCurSelectGroupID>=0 then
  begin
    grp := ADevGroupManage.find(GCurSelectGroupID);
    if grp= nil then exit;
      for i:= 0 to grp.DevListCount -1 do
      begin
        dev:= ADeviceManage.Find(grp.DevList[i]);
        if dev = nil then continue;
        dev.Hide:=false;
      end;
    FMap.DrawGpsMap_ClearDraw;
  end;
end;


procedure TMainf.fun_Devs_HideExecute(Sender: TObject);
var
  Dev:TDevice;
  i:integer;
  grp: TDevGroup;
begin
  if GCurSelectGroupID>=0 then
  begin
    grp := ADevGroupManage.find(GCurSelectGroupID);
    if grp= nil then exit;
      for i:= 0 to grp.DevListCount -1 do
      begin
        dev:= ADeviceManage.Find(grp.DevList[i]);
        if dev = nil then continue;
        dev.Hide:=true;
      end;
    FMap.DrawGpsMap_ClearDraw;
  end;
end;


procedure TMainf.Hot_zoom_inExecute(Sender: TObject);
begin
  FMap.ZoomInOut(1,FMap.DrawCood.WorldRect.Left,
                   FMap.DrawCood.WorldRect.Top,
                   FMap.DrawCood.WorldRect.Right,
                   FMap.DrawCood.WorldRect.Bottom
                   );
end;

procedure TMainf.Hot_zoom_outExecute(Sender: TObject);
begin
  FMap.ZoomInOut(0,FMap.DrawCood.WorldRect.Left,
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
begin
  Hot_zoom_in.ShortCut:=16571;
  Hot_zoom_Out.ShortCut:=16573;
  Hot_zoom_in2.ShortCut:=16576;
  Hot_zoom_Out2.ShortCut:=16433;
  Hot_Left.ShortCut:=16421;
  Hot_Right.ShortCut:=16423;
  Hot_Up.ShortCut:=16422;
  Hot_Down.ShortCut:=16424;
  //FMap.SetFocus;
end;

procedure TMainf.Hot_LeftExecute(Sender: TObject);
var
  x,y:integer;
begin
  x:=0;
  y:=0;
  FMap.Move(x,y,x+MOVE_NUM,y);
  FMap.Option:=FMap.Option+[mpAllowDraw];
  FMap.RefreshScreenBitmap;
end;

procedure TMainf.Hot_RightExecute(Sender: TObject);
var
  x,y:integer;
begin
  x:=0;
  y:=0;
  FMap.Move(x,y,x-MOVE_NUM,y);
  FMap.Option:=FMap.Option+[mpAllowDraw];
  FMap.RefreshScreenBitmap;
end;

procedure TMainf.Hot_UpExecute(Sender: TObject);
var
  x,y:integer;
begin
  x:=0;
  y:=0;
  FMap.Move(x,y,x,y+MOVE_NUM);
  FMap.Option:=FMap.Option+[mpAllowDraw];
  FMap.RefreshScreenBitmap;
end;

procedure TMainf.Hot_DownExecute(Sender: TObject);
var
  x,y:integer;
begin
  x:=0;
  y:=0;
  FMap.Move(x,y,x,y-MOVE_NUM);
  FMap.Option:=FMap.Option+[mpAllowDraw];
  FMap.RefreshScreenBitmap;
end;

procedure TMainf.OnMapMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  timer1.Enabled:=false;

end;

procedure TMainf.OnMapMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  px,py:integer;
  mapNode:TMapNode;
begin
  timer1.Enabled:=true;
  FDlg_Map.SetFocus;
  if Sender is TGpsMap then
  begin
      if TGpsMap(Sender).DrawCood.Scale>650 then exit;
      if not (TGpsMap(Sender).MouseAction in [actMove,actZoomIn]) then exit;
      TGpsMap(Sender).XYTOWorldPoint(FMap.Width div 2,FMap.Height div 2,px,py);

      ADeviceManage.FindMapName(MouseDev,Point(px,py));

      mapNode:=MapManger.Find(MouseDev.XianName);
      if MapNode<>nil then
      begin
        //ShowMessage('TMainf.OnMapMouseUp');
        ChangeMap(mapNode,True,True);
        //ShowMessage('TMainf.OnMapMouseUp');
        exit;
      end;
      if MouseDev.ShiName<>MouseDev.XianName then
      begin
        mapNode:=MapManger.Find(MouseDev.ShiName);
        if MapNode<>nil then
        begin
         // ShowMessage('TMainf.OnMapMouseUp');
          ChangeMap(mapNode,True,True);
          //ShowMessage('TMainf.OnMapMouseUp');
          exit;
        end;
      end;
      mapNode:=MapManger.Find(MouseDev.ShengName);
      if MapNode<>nil then
      begin
        ChangeMap(mapNode,True,True);
        exit;
      end;  
  end;


end;

procedure TMainf.help_testExecute(Sender: TObject);
var
  dlg:Tcall_dev;
  i,n:integer;
  dev : TDevice;
//  grp: TDevGroup;
begin
  {$ifdef ForAddEKey}
  ConnectedEkey_monitor;
  {$endif}
  //If not HasPrivilege(PRI_CALL) then exit;
  dlg:= Tcall_dev.Create(self);
  try
    dlg.Caption:='����������';
    dlg.Panel8.Caption:='����������';
    dlg.Panel4.Caption:='����������';
    dlg.BitBtn1.Caption:='����';
    {����ѡ���� ��ͳһ��ѡ��������}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;

   if ListSelectDev.Count >0 then
   begin
     AddDeviceFromListSelectDev;
   end
   else
   begin
    AddDeviceByGroup;
   end;
    dlg.ShowModal ;
    if dlg.ModalResult = mrok then 
    begin
      n:= dlg.ListView1.Items.Count;
      if n=0 then
      begin
        messagebox(handle,pchar('�����ִ�У�û��ָ������'),'��ʾ',mb_ok + mb_iconinformation);
        exit;
      end;

      for i:=0 to dlg.ListView1.Items.Count -1 do
      begin
        dev:= TDevice(dlg.ListView1.Items.Item[i].Data);
        if dev <> nil then
          DataServer.ReadTestData(dev);
        sleep(50);
        Application.ProcessMessages;          
      end;
    end;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_ReadDevVersionExecute(Sender: TObject);
begin
  if not CheckDevId then
  begin
   messagebox(0,'���ȡ��ڼ�س����б�ѡ�С��������Ͻ����롷����!','��ʾ',mb_ok + mb_iconinformation);
   exit;
  end;
  DataServer.ReadDevVersion(GCurSelectDev);
end;



procedure TMainf.Map_AddNodeExecute(Sender: TObject);
var
  MapNode:TMapNode;
  treeNode,sNode:TTreeNode;
  s:string;
begin
  sNode:= FDlg_Map.TreeViewMap.Selected;
  if sNode<>nil then
  begin
    s:=InputBox('����','������һ������������:','');
    if s='' then exit;
    if sNode.Data<>nil then
    begin
      MapNode:=TMapNode(sNode.Data);
      MapNode:=MapNode.AddChildNode(s);
      treeNode:=FDlg_Map.TreeviewMap.Items.AddChild(sNode,MapNode.Name);
      treeNode.Data:=MapNode;
      sNode.Expand(true);
      Map_Save.Execute;
    end;
  end;
end;

procedure TMainf.Map_SaveExecute(Sender: TObject);
var
  i,j,n: Integer;
  m: IMap;
  lay: ILayer;
  MapNode:TMapNode;
  ppLayerCfg:PLayerCfg;
  s:string;
begin
  if MapManger.CurrentNode  <> nil then
    MapNode:=MapManger.CurrentNode
  else
    MapNode:=MapManger.RootNode;
  MapNode.OutBox:=FMap.DrawCood.WorldRect;
  MapNode.LayerCfgManager.Clear;
  m := TMapCtrl.Create(FMap);
  i:= 0;   //
  j:=i;    //
  n:=FMap.Layers.Count-1; //
  while j<= n do
  begin
    lay:=m.GetLayer(i);
    if lay.isHaveNotDelete then
    begin
      i:= i+1;  //
      n:= n-1;  //
      Continue;
    end;
    If FMap.Layers.Layer[i].Data.FileName  ='' then
    begin
      i:= i+1;  //
      n:= n-1;  //
      Continue;
    end;
    s:=ExtractRelativePath(Application.ExeName,FMap.Layers.layer[i].Data.FileName);
    if s='' then Continue;
    ppLayerCfg:=MapNode.LayerCfgManager.AddLayerCfg(s);
    ppLayerCfg^.Visible := lay.IsVisible;
    ppLayerCfg^.Selected := lay.IsSelected;
    ppLayerCfg^.MetaLimit := lay.IsMetaIgnore;
    ppLayerCfg^.ShowLabel := lay.IsShowLabel;
    ppLayerCfg^.LabelField := lay.GetlabelValue;
    ppLayerCfg^.ScaleLimit := lay.IsLayerIgnore;
    ppLayerCfg^.MinScale := lay.GetLayerMinScale;
    ppLayerCfg^.MaxScale := lay.GetLayerMaxScale;
    ppLayerCfg^.OutBox:=FMap.Layers.Layer[i].Outbox;
    ppLayerCfg^.MapFont.Name:=FMap.Layers.Layer[i].LabelFont.FontName;
    ppLayerCfg^.MapFont.Size:=FMap.Layers.Layer[i].LabelFont.Size;
    ppLayerCfg^.MapFont.Color:=FMap.Layers.Layer[i].LabelFont.ForeColor;
    ppLayerCfg^.LayOrder := j;
    lay := nil;
    i:= i + 1;   //
    j:= j + 1;   //
  end;
  m := nil;
  MapManger.SaveFile(ExePath+'MapConfig.xml');
end;

procedure TMainf.Map_DelNodeExecute(Sender: TObject);
var
  TreeNode:TTreeNode;
  MapNode:TMapNode;
begin
//
  TreeNode:=FDlg_Map. TreeViewMap.Selected;
  if TreeNode=nil then  exit;
  if messagebox(handle,PChar('��ȷ��Ҫɾ��'+TreeNode.Text),'��ʾ',MB_OKCANCEL + MB_ICONQUESTION)= ID_CANCEL then  exit;
  if TreeNode.Data<>nil then
  begin
      MapNode:=TMapNode(TreeNode.Data);
      if MapNode=MapManger.CurrentNode then
      begin
        MessageBox(Self.Handle,'����ɾ����ǰ��ͼ���!','��ʾ',MB_ICONINFORMATION);
        exit;
      end;

      if MapNode.ChildNodeCount<=0 then
      begin
        MapNode.ParentNode.DelChildNode(MapNode);
        TreeNode.Delete;
      end
      else
      begin
        MessageBox(Self.Handle,'ֻ��ɾ���ӽ��!','��ʾ',MB_ICONINFORMATION);
      end;
  end
  else
  begin
    if TreeNode.Parent.Data<>nil then
    begin
      MapNode:=TMapNode(TreeNode.Parent.Data);
      MapNode.LayerCfgManager.DelLayerCfg(TreeNode.Text);
      TreeNode.Delete;
    end;
  end;

end;

procedure TMainf.Map_Set_DefaultNodeExecute(Sender: TObject);
var
  TreeNode:TTreeNode;
  MapNode:TMapNode;
begin
//
  TreeNode:= FDlg_Map.TreeViewMap.Selected;
  if TreeNode<>nil then
  begin
    if TreeNode.Data<>nil then
    begin
      MapNode:=TMapNode(TreeNode.Data);
      MapManger.SetDefaultNode(MapNode);
      MapManger.ShowToTreeView(FDlg_Map.TreeViewMap,FDlg_Map.CheckBoxIsShowFile.Checked);
      FDlg_Map.StatusBar1.Panels.Items[0].Text:='Ĭ����ʾ��ͼ:'+MapManger.DefaultNode.Name;
      Map_Save.Execute;
    end
    else
    begin
      MessageBox(Self.Handle,'��ѡ��һ������������!','��ʾ',MB_ICONINFORMATION);
    end;
  end;
end;

procedure TMainf.TreeViewMapContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
var
   Node: TTreeNode;
begin
    Node:=FDlg_Map.TreeViewMap.GetNodeAt(MousePos.X,MousePos.y);
    if Node<>nil then
      Node.Selected:=true;
end;


procedure TMainf.Map_ReflashExecute(Sender: TObject);
begin
  Map_Save.Execute;
  MapManger.ShowToTreeView(FDlg_Map.TreeViewMap,FDlg_Map.CheckBoxIsShowFile.Checked);
  FDlg_Map.StatusBar1.Panels.Items[0].Text:='Ĭ����ʾ��ͼ:'+MapManger.DefaultNode.Name;
end;

procedure TMainf.ChangeMap(MapNode:TMapNode;ifCurNode:boolean;ifAutoScale:boolean);
var
  dlg : TFrmRefreshProgress;
//  TreeNode:TTreeNode;
  i,count:integer;
  OutBox:TWorldRect;
  beginDatetime:TDatetime;
begin
    if MapNode<>nil then
    begin
       { if HisForm<>nil then
        begin
          if HisForm.Showing then
          begin
            MessageBox(Self.Handle,PChar('�رչ켣�طŴ���,�ſ����л���ͼ'),PChar('��ʾ'),MB_ICONQUESTION);
            exit;
          end;
          HisForm.Free;
          HisForm:=nil;
        end;  }

        if (MapNode=MapManger.CurrentNode)and(ifCurNode) then exit;
        dlg := TFrmRefreshProgress.Create(Self);
        //dlg.Show;
        dlg.Caption:='�س���ͼ';
        dlg.Label1.Caption:='�����س���ͼ,���Ե�....';
        try
          i:=0;
          OutBox:=FMap.DrawCood.WorldRect;
          count:=FMap.Layers.Count;
          //�س���ͼ
          
          while i< FMap.Layers.Count do //
          begin
            beginDatetime:=now;
            dlg.Gauge1.AddProgress(trunc(100*(1/count)));
            if not FMap.Layers.Layer[i].isHaveNotDelete then
            begin
              FMap.Layers.Layer[i].Data.Close
            end
            else
            begin
              i:= i+1;
            end;
            if MilliSecondsBetween(now,beginDatetime)>500 then
               dlg.Show;
          end;
          dlg.Caption:='�����ͼ';
          dlg.Label1.Caption:='���������ͼ,���Ե�....';
          dlg.Gauge1.Progress:=0;
          if ifAutoScale then
             OpenWSAutoScale(MapNode,dlg.Gauge1,OutBox)
          else
             OpenWS(MapNode,dlg.Gauge1);

          FMap.Layers.SetOrder(ADeviceManage.ShengLayer,FMap.Layers.Count-1);
          FMap.Layers.SetOrder(ADeviceManage.ShiLayer,FMap.Layers.Count-2);
          FMap.Layers.SetOrder(ADeviceManage.XianLayer,FMap.Layers.Count-3);
          FMap.Layers.SetOrder(ADeviceManage.Road,FMap.Layers.Count-4);

          FMap.Layers.SetOrder(drawlayer,0);//dxf ��GPSͼ�㵽��0�㡣
          FMap.Layers.SetOrder(TextLayer,1);
          FMap.Layers.SetOrder(userDrawLayer,2);
          
          //FMap.Zoom(OutBox);
          //FMap.Draw;
        finally
          dlg.Free;
        end;
    end;
end;

procedure TMainf.TreeViewMapDblClick(Sender: TObject);
var
  TreeNode:TTreeNode;
begin
  TreeNode:=FDlg_Map.TreeViewMap.Selected;
  if TreeNode<>nil then
  begin
    ChangeMap(TMapNode(TreeNode.Data));
    FMap.Draw;
  end;
end;

procedure TMainf.CheckBoxIsShowFileClick(Sender: TObject);
begin
  MapManger.ShowToTreeView(FDlg_Map.TreeViewMap,FDlg_Map.CheckBoxIsShowFile.Checked);
  FDlg_Map.StatusBar1.Panels.Items[0].Text:='Ĭ����ʾ��ͼ:'+MapManger.DefaultNode.Name;
end;

procedure TMainf.Map_SaveAsNodeExecute(Sender: TObject);
var
  mapNode:TMapNode;
begin
  if FDlg_Map.TreeviewMap.Selected =nil then exit;
  if FDlg_Map.TreeviewMap.Selected.Data=nil then exit;
  mapNode:=TMapNode(FDlg_Map.TreeviewMap.Selected.Data);
  SaveDialog1.FileName := mapNode.Name+'.xml';
  if SaveDialog1.Execute then
  begin

    MapManger.SaveFile(SaveDialog1.FileName,mapNode);
  end;
end;

procedure TMainf.Map_ImputNodeExecute(Sender: TObject);
var
  mapNode:TMapNode;
begin
  if FDlg_Map.TreeviewMap.Selected =nil then exit;
  if FDlg_Map.TreeviewMap.Selected.Data=nil then exit;
  mapNode:=TMapNode(FDlg_Map.TreeviewMap.Selected.Data);
  if OpenDialog1.Execute then
  begin
    MapManger.LoadFile(OpenDialog1.FileName,mapNode);
    MapManger.ShowToTreeView(FDlg_Map.TreeViewMap,FDlg_Map.CheckBoxIsShowFile.Checked);

    ChangeMap(mapNode,False);
    FMap.Draw;
    //Map_Reflash.Execute;
  end;
end;

procedure TMainf.fun_SetDownTimeExecute(Sender: TObject);
var
  s:string;
begin
  s:=InputBox('�жϳ������ߵ�ʱ��(��)','�жϳ������ߵ�ʱ��(��)',IntToStr(GlobalParam.DownTime));
  if S<>'' then
  begin
    try
      GlobalParam.DownTime:=StrToInt(s);
    except
      GlobalParam.DownTime:=300;
    end;
  end;
end;

procedure TMainf.fun_HistoryExecute(Sender: TObject);
var
  startDateTime,endDateTime:Tdatetime;
  dev:TDevice;
  car:TCar;
  dlg : TFrmRefreshProgress;
  i:integer;
begin
  if not CheckDevId then  exit;
  if GCurSelectDev=PlayDev then exit;
  SelectPlayGpsTimeForm:=TSelectPlayGpsTimeForm.Create(Self);
  try
      SelectPlayGpsTimeForm.Edit1.Text:=GCurSelectDev.Car.No ;
      SelectPlayGpsTimeForm.Edit2.Text:=GCurSelectDev.DispLabel;
      SelectPlayGpsTimeForm.Edit3.Text:=GCurSelectDev.SimNo;
      SelectPlayGpsTimeForm.Edit4.Text:=GCurSelectDev.IdStr;
      SelectPlayGpsTimeForm.Edit5.Text:=ADevGroupManage.find(GCurSelectDev.GroupID).Name ;
      SelectPlayGpsTimeForm.Edit6.Text:=GCurSelectDev.Car.Memo;
      SelectPlayGpsTimeForm.start_date.Date := Date;
      SelectPlayGpsTimeForm.end_date.Date := Date;

      SelectPlayGpsTimeForm.ShowModal;
      if SelectPlayGpsTimeForm.ModalResult = mrOk then
      begin
        //��������
        dlg := TFrmRefreshProgress.Create(Self);
        try
        dlg.Label1.Caption:='����GPS��λ����...';
        dlg.Show;
        SetActivePage(PageControlBottom,'�켣�ط�');
        dev:= GCurSelectDev;
        PlayDev.Id:=dev.Id;
        PlayDev.IdStr:=dev.IdStr;
        PlayDev.GroupID:=dev.GroupID;
        PlayDev.DispLabel:=dev.DispLabel;
        PlayDev.SimNo:=dev.SimNo;
        PlayDev.DriverNameTeL:=dev.DriverNameTeL;

        //�ù켣�طſ���ʵ�����򱨾�
        playDev.AreaList.Clear;
        for i:=0  to dev.AreaList.Count-1 do
        begin
            playDev.AreaList.Add(dev.AreaList.Items[i]);
        end;
               

        Car.Id:=dev.Car.Id;
        Car.No:=dev.Car.No;
        Car.ResId:=dev.Car.ResId;
        Car.ResIndex:=dev.Car.ResIndex;
        Car.stat:=dev.Car.stat;
        Car.Memo:=dev.Car.Memo;
        PlayDev.Car:=Car;
        FDlg_HisForm.PlayDevChanged;
        startDateTime := SelectPlayGpsTimeForm.start_date.DateTime;
        ReplaceTime(startDateTime,SelectPlayGpsTimeForm.start_time.Time);
        endDateTime := SelectPlayGpsTimeForm.end_date.DateTime;
        ReplaceTime(endDateTime,SelectPlayGpsTimeForm.end_time.Time);
        dlg.Gauge1.AddProgress(2);
        Application.ProcessMessages;
        FDlg_HisForm.PlayFromServer(playDev.Id,startDateTime,endDateTime);
        FDlg_HisForm.EditFromTime.Text:=FormatDatetime('yyyy-mm-dd hh:nn:ss',startDatetime);
        FDlg_HisForm.EditToTime.Text:=FormatDatetime('yyyy-mm-dd hh:nn:ss',endDateTime);

        dlg.Gauge1.AddProgress(2);
        Application.ProcessMessages;
        FDlg_HisForm.load_PlayInfo(startDateTime,endDateTime,'����������');
        dlg.Gauge1.AddProgress(2);
        Application.ProcessMessages;
        FDlg_HisForm.LoadAllGpsData(dlg);
        dlg.Gauge1.AddProgress(2);
        FDlg_HisForm.play_start.Execute;
        GCurSelectDev:=PlayDev;
        finally
           dlg.Free;
        end;
    end;
  finally
     SelectPlayGpsTimeForm.Free;
  end;


end;

procedure TMainf.Msg_For_Update(var message: TMessage);
begin
  Application.Terminate;
end;

procedure TMainf.help_UpdateExecute(Sender: TObject);
begin
  if FileExists(ExePath+'Update.exe') then
  begin
    SetCurrentDir(ExePath);
    shellexecute(handle, 'open', pchar(ExePath+'Update.exe'), nil, nil, sw_show)
  end
  else
    MessageBox(handle,'�Բ���û���ҵ���������Update.exe���޷�������','��ʾ',MB_OK + MB_ICONINFORMATION);
end;

procedure TMainf.OnUserDefinedText(Sender: TObject;EarthPoint: TEarthPoint; WorldPoint: TWorldPoint);
var
  i:integer;
  pp:PUserDefinedText;
begin
  UserDefinedTextForm:=TUserDefinedTextForm.Create(Self);
  try
    UserDefinedTextForm.Edit3.Text:=IntToStr(FMap.DrawCood.Scale);
    i:=GTextManage.Find(WorldPoint);
    if i>=0 then
    begin
      UserDefinedTextForm.EditName.Text:=GTextManage.Item[i]^.Text;
      UserDefinedTextForm.Font.Name:=GTextManage.Item[i]^.TextFont.FontName;
      UserDefinedTextForm.Font.Size:=GTextManage.Item[i]^.TextFont.Size;
      UserDefinedTextForm.Font.Color:=GTextManage.Item[i]^.TextFont.ForeColor;
      UserDefinedTextForm.EditFont.Text:=GTextManage.Item[i]^.TextFont.FontName+','+intToStr(GTextManage.Item[i]^.TextFont.Size);
      UserDefinedTextForm.EditX.Text:=FormatFloat('0.000000',EarthPoint.x);
      UserDefinedTextForm.EditY.Text:=FormatFloat('0.000000',EarthPoint.y);
      UserDefinedTextForm.EditType.Text:=IntToStr(GTextManage.Item[i]^.Symbol.CustomSymbol.Shape);
      UserDefinedTextForm.BitBtnOK.Caption:='�޸�';
      if GTextManage.Item[i]^.MaxScale>0 then
      begin
        UserDefinedTextForm.CheckBox1.Checked:=true;
        UserDefinedTextForm.Edit1.Text:=IntToStr(GTextManage.Item[i]^.MinScale);
        UserDefinedTextForm.Edit2.Text:=IntToStr(GTextManage.Item[i]^.MaxScale);
      end
      else
      begin
        UserDefinedTextForm.CheckBox1.Checked:=false;
        UserDefinedTextForm.Edit1.Text:='';
        UserDefinedTextForm.Edit2.Text:='';
      end;
      UserDefinedTextForm.CheckBox1Click(nil);
      if UserDefinedTextForm.ShowModal=MrOK then
      begin
        if UserDefinedTextForm.EditName.Text='' then
        begin
          GTextManage.Delete(i);
        end
        else
        begin
          GTextManage.Item[i]^.Text:=UserDefinedTextForm.EditName.Text;
          GTextManage.Item[i]^.TextFont.Size:=UserDefinedTextForm.Font.Size;
          GTextManage.Item[i]^.TextFont.FontName:=UserDefinedTextForm.Font.Name;
          GTextManage.Item[i]^.TextFont.ForeColor:=UserDefinedTextForm.Font.Color;
          GTextManage.Item[i]^.TextFont.Transparent:=1;
          GTextManage.Item[i]^.Symbol.CustomSymbol.Shape:=StrToInt(UserDefinedTextForm.EditType.Text);
          GTextManage.Item[i]^.Symbol.CustomSymbol.Color := clRed;
          GTextManage.Item[i]^.Symbol.CustomSymbol.Size:=8;
          if UserDefinedTextForm.CheckBox1.Checked then
          begin
            if UserDefinedTextForm.Edit1.Text<>'' then
              GTextManage.Item[i]^.MinScale:=StrToInt(UserDefinedTextForm.Edit1.Text);
            if UserDefinedTextForm.Edit2.Text<>'' then
              GTextManage.Item[i]^.MaxScale:=StrToInt(UserDefinedTextForm.Edit2.Text);
          end
          else
            GTextManage.Item[i]^.MaxScale:=-1;
        end;
        GTextManage.SaveToFile(ExePath+'UserDefinedText.ini');
        FMap.Draw;
        ShowUserDefinedText;
      end; 
    end
    else
    begin
      UserDefinedTextForm.EditX.Text:=FormatFloat('0.000000',EarthPoint.X);
      UserDefinedTextForm.EditY.Text:=FormatFloat('0.000000',EarthPoint.y);
      UserDefinedTextForm.EditType.Text:='67';
      UserDefinedTextForm.Font.Name:='����';
      UserDefinedTextForm.Font.Size:=10;
      UserDefinedTextForm.Font.Color:=0;
      UserDefinedTextForm.EditFont.Text:='����,10';
      UserDefinedTextForm.BitBtnOK.Caption:='���';
      UserDefinedTextForm.CheckBox1.Checked:=false;
      UserDefinedTextForm.Edit1.Text:='';
      UserDefinedTextForm.Edit2.Text:='';
      UserDefinedTextForm.CheckBox1Click(nil);

      if UserDefinedTextForm.ShowModal=MrOK then
      begin
        if UserDefinedTextForm.EditName.Text<>'' then
        begin
        pp:=GTextManage.Add(UserDefinedTextForm.EditName.Text,WorldPoint);
        pp^.TextFont.Size:=UserDefinedTextForm.Font.Size;
        pp^.TextFont.FontName:=UserDefinedTextForm.Font.Name;
        pp^.TextFont.ForeColor:=UserDefinedTextForm.Font.Color;
        pp^.TextFont.Transparent:=1;
        pp^.Symbol.CustomSymbol.Shape:=StrToInt(UserDefinedTextForm.EditType.Text);
        pp^.Symbol.CustomSymbol.Color := clRed;
        pp^.Symbol.CustomSymbol.Size:=8;
        if UserDefinedTextForm.CheckBox1.Checked then
        begin
          if UserDefinedTextForm.Edit1.Text<>'' then
            pp^.MinScale:=StrToInt(UserDefinedTextForm.Edit1.Text);
          if UserDefinedTextForm.Edit2.Text<>'' then
            pp^.MaxScale:=StrToInt(UserDefinedTextForm.Edit2.Text);
        end
        else
          pp^.MaxScale:=-1;
        GTextManage.SaveToFile(ExePath+'UserDefinedText.ini');
        FMap.Draw;
        ShowUserDefinedText;
        end;
      end;
    end;
  finally
    UserDefinedTextForm.Free;
  end;
end;




procedure TMainf.ShowUserDefinedText;
var
  i:integer;
begin
  cxDeviceListText.Clear;
  cxDeviceListText.BeginUpdate;
  for i:=0 to GTextmanage.Count-1 do
  begin
    with cxDeviceListText.Add do
    begin
       Values[0]:=i;
       Values[1]:=GTextmanage.item[i]^.Text;
       Data:=GTextmanage.item[i];
    end;
  end;
  cxDeviceListText.EndUpdate;
end;

procedure TMainf.cxDeviceListTextDblClick(Sender: TObject);
begin
  if cxDeviceListText.FocusedNode<>nil then
  begin
    FMap.Zoom(1,PUserDefinedText(cxDeviceListText.FocusedNode.Data)^.Symbol.Position);
    FMap.Draw;
  end;
end;

procedure TMainf.BitBtnEditTextClick(Sender: TObject);
var
  p:TPoint;
begin
  if cxDeviceListText.FocusedNode<>nil then
  begin
    p:=PUserDefinedText(cxDeviceListText.FocusedNode.Data)^.Symbol.Position;
    OnUserDefinedText(nil,FMap.Projection.XY2LoLa(p),p);
  end;
end;

procedure TMainf.OnEmptyFull(Sender: TObject; AEmptyCount,
  AFullCount: integer);
var
  f:double;
begin
  f:=AEmptyCount/(AEmptyCount+AFullCount)*100;
  StatusBar1.Panels[2].Text:='��ǰ�ճ���:'+FormatFloat('0.00',f)+'%';
end;


procedure TMainf.show_MapExecute(Sender: TObject);
begin
  with (Sender as TAction) do
  begin
    Checked := not Checked;
    if Checked then
    begin
      FDlg_Map.ManualDock(PageControl_Center, nil, alLeft);
      FDlg_Map.Show;
    end
    else
    begin
      FDlg_Map.ManualDock(nil);
      FDlg_Map.Hide;
    end;
  end;
end;

procedure TMainf.PageControl_CenterDockDrop(Sender: TObject;
  Source: TDragDockObject; X, Y: Integer);
begin
  if not SplitterBottom.Visible then
  begin
   PageControlBottom.Align:=alBottom;
   PageControlBottom.Height:=Panel_center.Height * 2 div 7;
   pageControl_Center.Align:=alClient;
   SplitterBottom.Visible := true;
  end;
  inc(FCenterFormCount);
end;

procedure TMainf.PageControl_CenterUnDock(Sender: TObject;
  Client: TControl; NewTarget: TWinControl; var Allow: Boolean);
begin
  Dec(FCenterFormCount);
  if FCenterFormCount <= 0 then
  begin
    SplitterBottom.Visible := false;
    pageControl_Center.Align:=alNone;
    pageControl_Center.SendToBack;
    pageControl_Center.Height:=Panel_center.Height * 3 div 7;
    PageControlBottom.Align:=alClient;
  end;
end;

procedure TMainf.ComboBoxCarNOKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key=#13) then
  begin
    FdevKeyIn := True;
    Edit1.Text:=ComboboxCarNO.Text;
    FdevKeyIn := false;
    exit;
  end;
  FSearch:=true;
end;

procedure TMainf.ComboBoxCarNOClick(Sender: TObject);
begin
    FdevKeyIn := True;
    Edit1.Text:=ComboboxCarNO.Text;
    FdevKeyIn := false;
  //  exit;
end;

procedure TMainf.ComboBoxCarNOChange(Sender: TObject);
var
  i: integer;
  carNo,setNo: string;
begin
 if FSearch then
  begin
    setNo := ComboBoxCarNO.Text;
    if setNO='' then
    begin
      ComboBoxCarNO.DroppedDown:=false;
      exit;
    end;
    Edit1.Text := '';
    ComboBoxCarNo.Items.BeginUpdate;
    ComboBoxCarNO.Items.Clear;
    for i:= 0 to ADeviceManage.Count -1 do
    begin
      carNo := ADeviceManage.Items[i].Car.No;
      if pos(setNo,carNo) >0 then
      begin
        if ComBoBoxCarNO.Items.Count <=50 then
          ComboBoxCarNO.Items.Add(carNo)
        else
          break;
      end;
    end;
    ComboBoxCarNo.Items.EndUpdate;
    ComboBoxCarNO.SelStart:=Length(ComboBoxCarNO.Text);
    ComboBoxCarNO.DroppedDown:=false;
  end;
end;

procedure TMainf.ComboBoxCarNOSelect(Sender: TObject);
begin
  FSearch:=false;
end;

procedure TMainf.ComboBoxCarNODblClick(Sender: TObject);
begin
  ComboBoxCarNO.DroppedDown:=false;
end;

procedure TMainf.ComboBoxCarNOKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if FSearch then
   begin
     if ComboBoxCarNO.Items.Count>0 then
       ComboBoxCarNO.DroppedDown:=true; 
     FSearch:=false;
   end;
end;

procedure TMainf.show_fullScreenExecute(Sender: TObject);
var
  i:integer;
begin
   if not show_fullScreen.Checked  then
   begin
    Self.Hide;
    FMap.Visible:=false;
    try
      Self.WindowState:= wsNormal;
      Self.BorderStyle :=bsNone;
      CoolBar1.Visible:=false;
      SplitterRight.CloseSplitter;
      SplitterBottom.Hide;
      SplitterRight.Hide;
      i:=0;
      while PageControl_Center.PageCount>i do
      begin
        if PageControl_Center.Pages[i].Caption=FDlg_Map.Caption then
           FDlg_Map.ManualDock(PageControlBottom,nil,alLeft)
        else
        if PageControl_Center.Pages[i].Caption=FDlg_Watch_Car.Caption then
           FDlg_Watch_Car.ManualDock(PageControlBottom,nil,alLeft)
        else
        if PageControl_Center.Pages[i].Caption=FDlg_Sended_Cmd.Caption then
           FDlg_Sended_Cmd.ManualDock(PageControlBottom,nil,alLeft)
        else
        if PageControl_Center.Pages[i].Caption=FDlg_OrderList.Caption then
           FDlg_OrderList.ManualDock(PageControlBottom,nil,alLeft)
        else
        if PageControl_Center.Pages[i].Caption=FDlg_Received_Info.Caption then
           FDlg_Received_Info.ManualDock(PageControlBottom,nil,alLeft)
        else
        if PageControl_Center.Pages[i].Caption=FDlg_Prompt_Info.Caption then
           FDlg_Prompt_Info.ManualDock(PageControlBottom,nil,alLeft)
        else
        if PageControl_Center.Pages[i].Caption=FDlg_ConfineAreaList.Caption then
           FDlg_ConfineAreaList.ManualDock(PageControlBottom,nil,alLeft)
        else
        if PageControl_Center.Pages[i].Caption=FDlg_AlarmCar.Caption then
           FDlg_AlarmCar.ManualDock(PageControlBottom,nil,alLeft)
        else
        if PageControl_Center.Pages[i].Caption=FDlg_SearchAddress.Caption then
           FDlg_SearchAddress.ManualDock(PageControlBottom,nil,alLeft)
        else
        if PageControl_Center.Pages[i].Caption=FDlg_PictureFrm.Caption then
           FDlg_PictureFrm.ManualDock(PageControlBottom,nil,alLeft)
        else
          inc(i);
      end;
      for i:=0 to PageControlBottom.PageCount-1 do
      begin
         if FDlg_Map.Caption=PageControlBottom.Pages[i].Caption then
         begin
           PageControlBottom.Pages[i].PageIndex:=0;
           break;
         end;
      end;


      BitBtnFullScreen.Show;
      BitBtnFullScreen.Caption:='';
      BitBtnFullScreen.Left:=screen.Width+3-BitBtnFullScreen.Width;
      BitBtnFullScreen.Top:=0;

      ToolBarMenu.Top:=0;
      ToolBarMenu.Left:=screen.Width+8-ToolBarMenu.Width;

      Self.Menu:=nil;
      ToolBarMenu.Show;

    //Self.FormStyle :=fsStayOnTop;
    finally
      show_fullScreen.Checked:=true;
      XPMenu1.Active:=false;
      Self.Show;
      Self.Left :=-5;
      Self.Top :=-2;
      Self.Width :=screen.Width+8 ;
      Self.Height :=screen.Height+8 ;
      FMap.Visible:=true;
      BitBtnFullScreen.BringToFront;
      XPMenu1.Active:=true;
    end;
  end
  else
  begin
    Self.Hide;
    FMap.Visible:=false;
    try
      Self.WindowState:= wsMaximized;
      Self.BorderStyle :=bsSizeable;
      CoolBar1.Visible:=true;
      SplitterRight.OpenSplitter;
      SplitterRight.Show;
      FDlg_Map.ManualDock(PageControl_Center,nil,alLeft);
      BitBtnFullScreen.Hide;

      Self.Menu:=Self.MainMenu2;

      ToolBarMenu.Hide;
    finally
      show_fullScreen.Checked:=false;
      Self.Show;
      FMap.Visible:=true;
    end;
  end;
end;

procedure TMainf.Map_ManageExecute(Sender: TObject);
begin
  if not FDlg_Map.PanelDeviceList.Visible then
  begin
    FDlg_Map.PanelDeviceList.Top:=FDlg_Map.Panel_Map.Top;
    FDlg_Map.PanelDeviceList.Left:=FDlg_Map.Panel_Map.Left-2;
    FDlg_Map.PanelDeviceList.Height:=FDlg_Map.Panel_Map.Height;
    FDlg_Map.PanelDeviceList.Visible:=true;
    FDlg_Map.ToolButton6.Down:=true;
  end
  else
  begin
    FDlg_Map.PanelDeviceList.Visible:=false;
    FDlg_Map.ToolButton6.Down:=false;
  end;
end;



procedure TMainf.fun_Devs_Hide_AllExecute(Sender: TObject);
var
 i:integer;
begin
  if not TAction(Sender).Checked then
  begin
    TAction(Sender).Checked:=true;
    for i:=0 to ADeviceManage.Count -1 do
    begin
        ADeviceManage.Items[i].Hide:=true;
    end;
  end
  else
  begin
    TAction(Sender).Checked:=false;
    for i:=0 to ADeviceManage.Count -1 do
    begin
        ADeviceManage.Items[i].Hide:=false;
    end;
  end;
  FMap.DrawGpsMap_ClearDraw;
end;

procedure TMainf.fun_Devs_Show_OnlyExecute(Sender: TObject);
begin
  fun_Devs_Hide_All.Checked:=false;
  fun_Devs_Hide_All.Execute;
  fun_Devs_Show.Execute;
end;

procedure TMainf.fun_ReadDriverInfoExecute(Sender: TObject);
var
  dlg:Tcall_dev;
  i,n:integer;
  dev : TDevice;
//  grp: TDevGroup;
begin
  {$ifdef ForAddEKey}
  ConnectedEkey_monitor;
  {$endif}
  //If not HasPrivilege(PRI_CALL) then exit;
  dlg:= Tcall_dev.Create(self);
  try
    {����ѡ���� ��ͳһ��ѡ��������}
    dlg.Caption:='��ȡ˾����Ϣ';
    dlg.Panel8.Caption:='��ȡ˾����Ϣ';
    dlg.Panel4.Caption:='��ȡ���³���';
    dlg.BitBtn1.Caption:='��ȡ';
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;

   if ListSelectDev.Count >0 then
   begin
     AddDeviceFromListSelectDev;
   end
   else if CheckDevId then
   begin
     Add_A_Device;
   end
   else
   begin
    AddDeviceByGroup;
   end;
    dlg.ShowModal ;
    if dlg.ModalResult = mrok then //������ȡ����
    begin
      n:= dlg.ListView1.Items.Count;
      if n=0 then
      begin
        messagebox(handle,pchar('�����ִ�У�û��ָ������'),'��ʾ',mb_ok + mb_iconinformation);
        exit;
      end;

      for i:=0 to dlg.ListView1.Items.Count -1 do
      begin
        dev:= TDevice(dlg.ListView1.Items.Item[i].Data);
        if dev <> nil then
          DataServer.ReadDriverNO(dev);
        sleep(50);
        Application.ProcessMessages;
      end;
    end;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.ck_DriverOnOffDutyExecute(Sender: TObject);
begin
   DriverOnOffDutyForm:=TDriverOnOffDutyForm.Create(Self);
   try
     DriverOnOffDutyForm.ShowModal;
   finally
     DriverOnOffDutyForm.Free;
   end;
end;

procedure TMainf.Map_ChangeNodeNameExecute(Sender: TObject);
var
  TreeNode:TTreeNode;
  MapNode:TMapNode;
  s:string;
begin
  TreeNode:=FDlg_Map.TreeViewMap.Selected;
  if TreeNode<>nil then
  begin
    if TreeNode.Data<>nil then
    begin
      MapNode:=TMapNode(TreeNode.Data);
      s:=InputBox('����','������һ���µ���������:',MapNode.Name);
      if s='' then exit;
      MapManger.ChangeNodeName(s,MapNode);
      MapManger.ShowToTreeView(FDlg_Map.TreeViewMap,FDlg_Map.CheckBoxIsShowFile.Checked);
      FDlg_Map.StatusBar1.Panels.Items[0].Text:='Ĭ����ʾ��ͼ:'+MapManger.DefaultNode.Name;
    end;
  end;
end;

procedure TMainf.fun_GetAPictureExecute(Sender: TObject);
var
  dlg:TGetAPictureFrm;
  i,n:integer;
  dev : TDevice;
//  grp: TDevGroup;
begin
  {$ifdef ForAddEKey}
  ConnectedEkey_monitor;
  {$endif}
  //If not HasPrivilege(PRI_CALL) then exit;
  dlg:= TGetAPictureFrm.Create(self);
  try
    {����ѡ���� ��ͳһ��ѡ��������}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;

   if ListSelectDev.Count >0 then
   begin
     AddDeviceFromListSelectDev;
   end
   else if CheckDevId then
   begin
     Add_A_Device;
   end
   else
   begin
    AddDeviceByGroup;
   end;
    dlg.ShowModal ;
    if dlg.ModalResult = mrok then //������ȡ����
    begin
      n:= dlg.ListView1.Items.Count;
      if n=0 then
      begin
        messagebox(handle,pchar('�����ִ�У�û��ָ������'),'��ʾ',mb_ok + mb_iconinformation);
        exit;
      end;

      for i:=0 to dlg.ListView1.Items.Count -1 do
      begin
        dev:= TDevice(dlg.ListView1.Items.Item[i].Data);
        if dev <> nil then
          DataServer.GetAPicture(dev,dlg.ComboBoxSize.ItemIndex,dlg.ComboBoxCamera.ItemIndex);
        sleep(50);
        Application.ProcessMessages;
      end;
    end;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;

end;

procedure TMainf.tool_SetRunWayExecute(Sender: TObject);
var
 i:integer;
begin
  FMap.MouseAction:=actSetRunWay;
  for i:=0 to ActionList1.ActionCount-1 do
  begin
    if (ActionList1.Actions[i].Category='��ͼ����') then
    begin
      if ActionList1.Actions[i].Name<>'tool_bird_eye' then
      begin
        TAction(ActionList1.Actions[i]).Checked:=false;
      end;
    end;
  end;
  TAction(Sender).Checked:=true;
  PageControl1.ActivePageIndex:=2;
end;

procedure TMainf.FMapSetRunWay(Sender: TObject; WPointsAry: TWorldPointAry;
  PointsCnt: Integer);
{var
  dlg: TConfineAreaSetFrm;
  tmpArea:TConfineArea;
  i,AreaIndex,speet:integer;}
begin
{  FMap.MouseAction:= actNoAction;
  tool_not_select.Checked := true;
  if PointsCnt<2 then exit;
  dlg:= TConfineAreaSetFrm.Create(nil);
  try
    dlg.Edit_AreaID.Text     := IntTostr(GAreaManage.MaxId);
    dlg.Edit_AreaName.Text   := '��·'+IntToStr(GAreaManage.MaxId);
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
      //------------ ��ʾ����Χ���б�     }            {or (FDlg_ConfineAreaList.Floating)}
      {if (not FDlg_ConfineAreaList.Visible)  then
      begin
        FDlg_ConfineAreaList.ManualDock(PageControlBottom,nil,alLeft);
        FDlg_ConfineAreaList.Show;
        for i:= 0 to PageControlBottom.PageCount-1 do
          if PageControlBottom.Pages[i].Caption = '����Χ���б�' then
          begin
            PageControlBottom.ActivePageIndex := i;
            break;
          end;
      end;
      FDlg_ConfineAreaList.ListConfineAreas;
      //------------ ��ʾ����Χ��
    end;
  finally
    dlg.Free;
  end;      }
end;

procedure TMainf.Print_ScreenExecute(Sender: TObject);
begin
if PrintDialog1.Execute  then
begin
  try
      Self.Print;
  except on E: Exception do
      begin
          ShowMessage(E.Message);
      end;
  end;
end;
end;

procedure TMainf.Print_MapExecute(Sender: TObject);
var
  rect:TRect;
begin
  if PrintDialog1.Execute  then
  begin
    try
        rect.Left:=0;
        rect.Top:=0;
        rect.Right:=Fmap.ScreenBitmap.Width;
        rect.Bottom:=Fmap.ScreenBitmap.Height;
        Printer.BeginDoc;
        Printer.Canvas.StretchDraw(rect,Fmap.ScreenBitmap);
        Printer.EndDoc;
    except
    on E: Exception do
      begin
          ShowMessage(E.Message);
      end;
    end;
  end;
end;

procedure TMainf.MapSaveToJpegExecute(Sender: TObject);
var
  s:string;
begin
  s:=SaveDialog1.Filter;
  SaveDialog1.Filter:='gif(*.gif)|*.gif';
  if SaveDialog1.Execute then
  begin
    FMap.SaveScreenToGif(SaveDialog1.FileName+'.gif');
  end;
  SaveDialog1.Filter:=s;
end;

procedure TMainf.ck_PictureExecute(Sender: TObject);
begin
  QueryCarPictureFrm:=TQueryCarPictureFrm.Create(Self);
  try
     QueryCarPictureFrm.ShowModal;
  finally
     QueryCarPictureFrm.Free;
  end;
end;

procedure TMainf.show_PictureExecute(Sender: TObject);
var
  i:Integer;
begin
  with (Sender as TAction) do
  begin
    Checked := not Checked;
    if Checked then
    begin
      if (not FDlg_PictureFrm.Showing) or (FDlg_PictureFrm.Floating) then
      begin
        FDlg_PictureFrm.ManualDock(PageControlBottom,nil,alLeft);
        FDlg_PictureFrm.Show;
        for i:= 0 to PageControlBottom.PageCount-1 do
          if PageControlBottom.Pages[i].Caption = '��Ƭ' then
          begin
            PageControlBottom.ActivePageIndex := i;
            break;
          end;
      end;
    end
    else
    begin
      FDlg_PictureFrm.ManualDock(nil);
      FDlg_PictureFrm.Hide;
    end;
  end;
end;

procedure TMainf.PageControlBottomChange(Sender: TObject);
begin
  if PageControlBottom.ActivePage.Caption ='�����б�' then
  begin
    FDlg_Watch_Car.Refresh_WatchCar;
  end
  else if PageControlBottom.ActivePage.Caption ='���������б�' then
  begin
    FDlg_Sended_Cmd.Refresh_SendedCmd;
  end
  else if PageControlBottom.ActivePage.Caption ='���������б�' then
  begin
    FDlg_AlarmCar.Refresh_AlarmCar;
  end
  else if PageControlBottom.ActivePage.Caption ='����Χ���б�' then
  begin
    FDlg_ConfineAreaList.ListCurrConfine_Devs;
  end
  else if PageControlBottom.ActivePage.Caption  ='���Ͷ����б�'  then
  begin
    FDlg_OrderList.RefreshOrderList;
  end;
end;

procedure TMainf.fun_ReadGPRSFluxExecute(Sender: TObject);
begin
    if not CheckDevId then
    begin
     messagebox(0,'���ȡ��ڼ�س����б�ѡ�С��������Ͻ����롷����!','��ʾ',mb_ok + mb_iconinformation);
     exit;
    end;
    DataServer.ReadDeviceGPRSFlux(GCurSelectDev);
end;

procedure TMainf.TimerUpdateTimer(Sender: TObject);
var
  CoerceUpdate:boolean;
begin
  //FFLashDlg.SetLabel('������...');
 // application.ProcessMessages;
//  TimerUpdate.Enabled:=false;
  try
      if updateUnit.ExistUpdateFile(CoerceUpdate) then
      begin
         if CoerceUpdate then
         begin
            SetCurrentDir(ExePath);
            shellexecute(handle, 'open', pchar(ExePath+'Update.exe'), nil, nil, sw_show);
            Application.Terminate;
         end
         else  if MessageBox(0, '�������°棬Ҫ������', '��Ϣ��ʾ', MB_YESNO + MB_ICONQUESTION) = ID_YES then
         begin
            SetCurrentDir(ExePath);
            shellexecute(handle, 'open', pchar(ExePath+'Update.exe'), nil, nil, sw_show);
            Application.Terminate;
         end;
      end;
  finally
//     TimerUpdate.Interval:=30*60*1000;
//     TimerUpdate.Enabled:=true;
  end;
end;

procedure TMainf.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  //FMap.SetFocus;
//  if not FDlg_Map.Focused then exit;
  if FMap.DrawCood.GetRealScale>85200 then exit;
  if Hot_zoom_out.Tag>5 then
  begin
      //if FMap.DrawCood.Scale<55 then exit;
      //LastInOutMap:=now;
      Hot_zoom_out.Tag:=0;

      Hot_zoom_out.Execute;
  end
  else Hot_zoom_out.Tag:=Hot_zoom_out.Tag+1;
end;

procedure TMainf.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
var
  px,py:integer;
  mapNode:TMapNode;
begin
  //FMap.SetFocus;
//  if not FDlg_Map.Focused then exit;
  if FMap.DrawCood.GetRealScale<=15 then exit;
  if Hot_zoom_in.Tag>5 then
  begin
      //LastInOutMap:=now;
      Hot_zoom_in.Tag:=0;
      Hot_zoom_in.Execute;

      //�л���ͼ
      if FMap.DrawCood.Scale>650 then exit;
      FMap.XYTOWorldPoint(FMap.Width div 2,FMap.Height div 2,px,py);

      ADeviceManage.FindMapName(MouseDev,Point(px,py));

      mapNode:=MapManger.Find(MouseDev.XianName);
      if MapNode<>nil then
      begin
        ChangeMap(mapNode,True,True);
        exit;
      end;
      if MouseDev.ShiName<>MouseDev.XianName then
      begin
        mapNode:=MapManger.Find(MouseDev.ShiName);
        if MapNode<>nil then
        begin
          ChangeMap(mapNode,True,True);
          exit;
        end;
      end;

  end
  else Hot_zoom_in.Tag:=Hot_zoom_in.Tag+1;
end;

function TMainf.SetActivePage(PageControl: TPageControl;
  PageCaption: string): boolean;
var
  i:integer;

begin
    Result:=false;
    for i:= 0 to PageControl.PageCount-1 do
      if PageControl.Pages[i].Caption = PageCaption then
      begin
        PageControlBottom.ActivePageIndex := i;
        Result:=true;
        break;
      end;
end;

procedure TMainf.OnReDrawMap(Sender: TObject; Dev: TDevice);
var
    mapNode:TMapNode;
begin
      mapNode:=MapManger.Find(Dev.XianName);
      if MapNode<>nil then
      begin
        ChangeMap(mapNode,True,True);
        exit;
      end;
      if MouseDev.ShiName<>MouseDev.XianName then
      begin
        mapNode:=MapManger.Find(Dev.ShiName);
        if MapNode<>nil then
        begin
          ChangeMap(mapNode,True,True);
          exit;
        end;
      end;
end;

procedure TMainf.Set_HisTrackExecute(Sender: TObject);
var
  dlg : TSetCarTrackPenFrm;
  tmpPen:TPenStruct;
begin
  if PlayDev = nil then exit;
  dlg := TSetCarTrackPenFrm.Create(self);
  try
    dlg.Shape1.Brush.Color := PlayDev.TrackPen.color;
    dlg.EditLineWidth.Text := IntToStr(PlayDev.TrackPen.Width);
    if PlayDev.TrackPen.Pattern =1 then
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
      GlobalParam.SaveToFile(Application.ExeName+'.config');
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
  tmpPen.color := GlobalParam.FTrackPenColor ;
  tmpPen.Pattern := GlobalParam.FTrackPenStyle;
  PlayDev.TrackPen := tmpPen;
end;




procedure TMainf.fun_SendAdInfoExecute(Sender: TObject);
var
  frm:TSendAdInfoForm;
begin
{  if not CheckDevId then
  begin
    fun_Devs_PursueDevExecute(Sender);
    exit;
  end;  }
  frm:=TSendAdInfoForm.Create(Self);
  try
    frm.ListView1.PopupMenu := PopupMenu_SelectDevs; {����ѡ���� ��ͳһ��ѡ��������}
    FListView_SelectDevs := frm.ListView1;
    Add_A_Device;
    frm.ShowModal;
  finally
    frm.Free;
  end;
end;


procedure TMainf.fun_SendDelAdInfoExecute(Sender: TObject);
begin
  SendDelAdInfoForm:=TSendDelAdInfoForm.Create(Self);
  try
      SendDelAdInfoForm.ShowModal;
  finally
      SendDelAdInfoForm.Free;
  end;

end;



procedure TMainf.fun_SendListenTELExecute(Sender: TObject);
var
  s:string;
begin
  {if not CheckDevId then
  begin
    fun_Devs_CallDevExecute(Sender);
    exit;
  end;}
if not CheckDevId then
  begin
   // fun_Devs_CallDevExecute(Sender);

    messagebox(0,'���ȡ��ڼ�س����б�ѡ�С��������Ͻ����롷����!','��ʾ',mb_ok + mb_iconinformation);
    exit;
  end;

  ModifyLcdCoNameFrm:= TModifyLcdCoNameFrm.Create(Self);
  try
    ModifyLcdCoNameFrm.Caption:='����ʹ'+GCurSelectDev.Car.No+'��������绰';
    ModifyLcdCoNameFrm.Panel1.Caption:='����ʹ'+GCurSelectDev.Car.No+'��������绰';
    ModifyLcdCoNameFrm.Label1.Caption:='�����绰����';
    ModifyLcdCoNameFrm.Label1.Visible:=true;
    ModifyLcdCoNameFrm.Label2.Caption:='  (�绰���볤��С��20λ)';     
    ModifyLcdCoNameFrm.EditCoName.Clear;
    //ModifyLcdCoNameFrm.SetFocus;
    ModifyLcdCoNameFrm.ShowModal;
    if ModifyLcdCoNameFrm.ModalResult =mrOK then
    begin
        s:=trim(ModifyLcdCoNameFrm.EditCoName.Text);
        dataserver.SendListenInTel(GCurSelectDev,s);
    end;

  finally
     ModifyLcdCoNameFrm.Free;
  end;

end;

procedure TMainf.show_GPSHostoryExecute(Sender: TObject);
var
  i:Integer;
begin
  with (Sender as TAction) do
  begin
    Checked := not Checked;
    if Checked then
    begin
      if (not FDlg_HisForm.Showing) or (FDlg_HisForm.Floating) then
      begin
        FDlg_HisForm.ManualDock(PageControlBottom,nil,alLeft);
        FDlg_HisForm.Show;
        for i:= 0 to PageControlBottom.PageCount-1 do
          if PageControlBottom.Pages[i].Caption = '�켣�ط�' then
          begin
            PageControlBottom.ActivePageIndex := i;
            break;
          end;
      end;
    end
    else
    begin
      FDlg_HisForm.ManualDock(nil);
      FDlg_HisForm.Hide;
    end;
  end;
end;

procedure TMainf.ck_OverSpeedRecordExecute(Sender: TObject);
begin
    OverSpeedRecordForm:= TOverSpeedRecordForm.Create(Self);
    try
        OverSpeedRecordForm.ShowModal;

    finally
        OverSpeedRecordForm.Free;
    end;
end;

procedure TMainf.ck_StopRecordExecute(Sender: TObject);
begin
    StopRecordForm:= TStopRecordForm.Create(Self);
    try
        StopRecordForm.ShowModal;

    finally
        StopRecordForm.Free;
    end;
end;

procedure TMainf.fun_BrakeStateExecute(Sender: TObject);
var

  i,n:integer;
  dev : TDevice;
//  grp: TDevGroup;
begin
  {$ifdef ForAddEKey}
  ConnectedEkey_monitor;
  {$endif}
  //If not HasPrivilege(PRI_CALL) then exit;
  BrakeStateForm:= TBrakeStateForm.Create(self);
  try
    {����ѡ���� ��ͳһ��ѡ��������}
    BrakeStateForm.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := BrakeStateForm.ListView1;

   if ListSelectDev.Count >0 then
   begin
     AddDeviceFromListSelectDev;
   end
   else
   begin
    AddDeviceByGroup;
   end;
    BrakeStateForm.ShowModal ;
    if BrakeStateForm.ModalResult = mrok then //�������г���
    begin
      n:= BrakeStateForm.ListView1.Items.Count;
      if n=0 then
      begin
        messagebox(handle,pchar('�����ִ�У�û��ָ������'),'��ʾ',mb_ok + mb_iconinformation);
        exit;
      end;

      for i:=0 to BrakeStateForm.ListView1.Items.Count -1 do
      begin
        dev:= TDevice(BrakeStateForm.ListView1.Items.Item[i].Data);
        if dev <> nil then
          DataServer.SetBrakeState(dev,BrakeStateForm.RadioGroup1.ItemIndex);
        sleep(50);
        Application.ProcessMessages;
      end;
    end;
  finally
    BrakeStateForm.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TMainf.fun_CallDriverExecute(Sender: TObject);
var
  tel:string;
begin
if GCurSelectDev=nil then
begin
   messagebox(0,'���ȡ��ڼ�س����б�ѡ�С��������Ͻ����롷����!','��ʾ',mb_ok + mb_iconinformation);
   exit;
end;
  tel:=GCurSelectDev.SimNo;
if tel='' then
begin
   messagebox(0,'Щ��û�������ֻ�����','��ʾ',mb_ok + mb_iconinformation);
   exit;
end;

if tel[2]='0' then tel[2]:='5';

fun_CallDriver.Enabled:=false;
try
  if  FCallClient.Work  then
  begin
    FCallClient.CallDriver(tel);
  end;
finally
  fun_CallDriver.Visible:=true;
  fun_CallDriver.Enabled:=true;
end;
end;



procedure TMainf.tool_SetFactoryExecute(Sender: TObject);
var
 i:integer;
begin
  FMap.MouseAction:=  actSetFactory;
  for i:=0 to ActionList1.ActionCount-1 do
  begin
    if (ActionList1.Actions[i].Category='��ͼ����') then
    begin
      if ActionList1.Actions[i].Name<>'tool_bird_eye' then
      begin
        TAction(ActionList1.Actions[i]).Checked:=false;
      end;
    end;
  end;  
  TAction(Sender).Checked:=true;
end;

procedure TMainf.OnUserSetFactory(Sender: TObject; EarthPoint: TEarthPoint;
  WorldPoint: TWorldPoint);
var
   i:integer;
begin
//�û��Զ��幤������






    





end;



procedure TMainf.ck_TaxiMetaRunDataExecute(Sender: TObject);
var
  i: integer;
begin
  with (Sender as TAction) do
  begin
    Checked := not Checked;
    if Checked then
    begin
      if (not FDlg_DRunData.Showing) or (FDlg_DRunData.Floating) then
      begin
        FDlg_DRunData.ManualDock(PageControlBottom,nil,alLeft);
        FDlg_DRunData.Show;
        for i:= 0 to PageControlBottom.PageCount-1 do
          if PageControlBottom.Pages[i].Caption = '�Ƽ���Ӫ������' then
          begin
            PageControlBottom.ActivePageIndex := i;
            break;
          end;
      end;
    end
    else
    begin
      FDlg_DRunData.ManualDock(nil);
      FDlg_DRunData.Hide;
    end;
  end;
{  var dlg1:TtaxiRunDataFrm;
  dlg2:TTYtaxiRunDataFrm;
begin
 if taxiType = 1 then
 begin
  dlg1 := TtaxiRunDataFrm.Create(self);
  try
    dlg1.ShowModal ;
  finally
    dlg1.Free;
  end;
 end
 else if taxiType = 0 then
 begin
  dlg2 := TTYtaxiRunDataFrm.Create(self);
  try
    dlg2.ShowModal ;
  finally
    dlg2.Free;
  end
 end; }
end;

procedure TMainf.ck_taximetaRundataTjExecute(Sender: TObject);
  var dlg:TtaxiRundataTjByMonthFrm;
begin
  dlg := TtaxiRundataTjByMonthFrm.Create(self);
  try
    dlg.ShowModal;
  finally
    dlg.Free;
  end;
end;

procedure TMainf.tool_SeekCarExecute(Sender: TObject);
var
  i:integer;
begin
  FMap.MouseAction:=  actSeekCar;
  for i:=0 to ActionList1.ActionCount-1 do
  begin
    if (ActionList1.Actions[i].Category='��ͼ����') then
    begin
      if ActionList1.Actions[i].Name<>'tool_bird_eye' then
      begin
        TAction(ActionList1.Actions[i]).Checked:=false;
      end;
    end;
  end;  
  TAction(Sender).Checked:=true;
end;

end.

