unit umainf;
{ 主窗体
  @author()
  @created(2004-03-)

  @lastmod(GMT:$Date: 2012/10/29 01:46:42 $) <BR>
  最后更新人:$Author: wfp $  <BR>
  当前版本:$Revision: 1.1.1.1 $  <BR>}
  
  //在菜单project-options中，Directories/conditionals页 ForTestUser
  //ForTestUser 为测试用户  :需用户提供反馈号，从我厂取注册号
  //ForAddEKey  为加密狗
  //ForDevLimit 为查看设备数限制
  //ForOnlySMS  为数据只从短消息服务器发出，无GPRS时。
  //For_HeartToGateway  为网关之间加了心跳.
  //           只能使用呼叫命令，且已发送命令列表中去掉命令回复时间及状态(命令无超时)
  //For_ConfineArea 加入了限定区域设置 －－电子围栏
  //For_HeartToGateway 如果20遍(秒)收不到网关数据,则发一次心跳。发过心跳后再有5遍收不到数据，则断开网关重连。
  //For_MistySearchCarNo  模糊查找车牌号  20060830
  //2006-10-24 添加可以导出司机,车辆信息,订单信息,调度信息
  //    选择车辆可以按设备名称排序.
  //  隐藏车辆.只显示某组车辆.
  //2006-10-25-------------------------
  //1.修改备用网关可以连接
  //2.添加可选参数A.使用计价器 B.使用司机卡 C.显示计价器故障
  //3.读取司机信息
  //2006-11-01 修改了地图控制一些BUG,和添加修改结点名称
  //2006-11-29 在Config.ini文件[SYS]里添加VersionFor='ZB' 针对于中北订单不能,IC卡参数.  解决了取消订单的菜单兼容问题
  //2006-12-20 网关添加拍照函数 ;在Config.ini文件添加了AppName可以设置程序标题名称
  //2006-12-21 for JT 添加了,重车在地图显示为红色
  //2006-12-25 修改读计价器时间BUG
  //2007-01-05 添加固定路线功能,解决了一个车可以在多个区域里.以前版本一个车只能在某一个同样的区域,修改了地图切换时BUG
  //2007-05-12 修改,如果网关掉线了,所有的车机不下线.
  //2007-05-14 添加了收车机照片的判断,不收取和最后一次的INDEX相同的照片.
  //2007-05-18 添加自动更新
  //2007-05-25 解决了强制显示NAME字段内容.
  //2007-06    添加司机上传固定菜单有声音提示(陈头要求)
  //2007-06    添加区域报警提示司机  (高明的要求)
  //2007-06-21 解决了地图疑难问题,手动移动和放大地图可以自动切换地图.
  //VERSION='     V1.02.02';
  //2007-07-09 添加滚轮可以放大和缩小地图.
  //           添加发送调试信息可以通过Message.txt添加默认常用语.
  //           把连接电话功能又加上去了.
  //2007-07-20 地图手动拖动时,一边拖一边可把标注显示出来.
  //           导出数据时,当一个字段里有","号时,会出现错位.已解决.
  //2007-07-21 拖动的时候可以显示标注,拖动的时候也可以显示车.
  //           取消载全部车牌号
  //2007-07-22 当某一个图层画出错时,此图层将路出不画.        
  //2007-07-25 基本改善地图被拖出去的可能.加了好多函数的异常处理和记录异常.
  //VERSION='     V1.02.03';
  //2007-07-27 加添了所有车下线报警
  //2007-07-31 把轨迹回放真正的合在一起了.
  //2007-08-03 加添了断电报警
  //2007-08-06 把启动图片从文件载入,此功能是包头提出.为想改启动图片的用户提供放便.
  //2007-08-06 修更新,如果当前路径被修改后,更新时所有的文件将全是创建更新.
  //VERSION='     V1.02.04';
  //2007-08-07 修改在回放的时候,选择别的车时,显示上面有点问题.要
  //VERSION='     V1.02.05';
  //2007-08-24 为网关添加广告
  //2007-08-24 修改了轨迹回放,计算总里程时会终断问题.
  //VERSION='     V1.02.06';
  //修改地图低层,把以前的结构换成了指针.
  //修改了显示标注,从四个方向动态显示,这样提高了显示标注的内容.
  //修改移动时,大于50毫秒的图,在拖动时不重画.当放开鼠标后,才显示.
  //VERSION='     V1.02.07';
  //修改地图的路可以根据路方向显示
  //修改渣土车一些显示BUG
  //VERSION='     V1.02.08';
  //修改路的标注一些问题,把竖向路的标注改成竖的
  //修改线段显示的BUG
  //修改司机提示,提示语可以自行修改.
  //修改速度报警BUG
  //VERSION='     V1.02.09';
  //把画图园和标签分开了.这样,标签就不会显示在下面了.
  //VERSION='     V1.02.10';
  //解决轨迹BUG,不能计算总里程.
  //修改决死机问题.
  //VERSION='     V1.02.11';
  //如果在没有设置报警声音时,不对扬声器 发声,因为,当大量的车报警时,机子可能返应不过来.
  //VERSION='     V1.02.12
  //给电子围栏加了一个有效时间.
  //添加机厂大巴区域速度报表和刹车记录.
  //上传速度区域数据.
  //VERSION='     V1.02.13
  //修改电子围栏地BUG
  //VERSION='     V1.02.14
  //修改查找照片BUG
  //VERSION='     V1.02.15
  //修改发送广告BUG
  //VERSION='     V1.02.16
  //添加三方通话功能,些功能要连最新的电话服务器才有效.
  //修改地图Text不能显示BUG
  //VERSION='     V1.02.17
  //解决发送调信息慢的问题.
  //VERSION='     V1.02.19
  //添加区域查车功能.
  //VERSION='     V1.02.19
  //修改区域查车


  
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
     SX:double;     //SX为开始X点(Strat) ,EX为结束X点(end).
     SY:double;
     EX:double;     //SY为开始Y点(Strat) ,EY为Y结束点(End)
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
    
    FDlg_data_display :Tdata_display; //数据显示 窗体
    FDlg_Watch_Car    :TWatch_car;    //监控车辆
    FDlg_Sended_Cmd   :TSended_Cmd;   //已发命令
    FDlg_OrderList    :TOrderListFrm; //订单列表
    FDlg_Received_Info:TReceived_info;//收到网关主动发来的数据（车机主动给网关的）
    FDlg_Prompt_Info  :TReceived_info;//定位数据里的故障提示;
    FDlg_ConfineAreaList  :TConfineAreaListFrm;
    FDlg_AlarmCar         :TFrmAlarmCar;
    FDlg_SearchAddress    :TFrmSearchAddressInMap;
    FDlg_PictureFrm      :TPictureFrm;//照片
    FDlg_HisForm: TFormHisMain;
    FDlg_DRunData:TtaxiRunDataFrm;
    {停泊的窗体数目}
    FBottomFormCount  :integer;
    {底层窗口的高度}
   // FBottomFromHeight :integer;
    {在中心的窗口数量}
    FCenterFormCount: integer;
    {键盘输入车牌号}
    FDevKeyIn : boolean;
    {要 重新选择车辆的ListView,在组命令时用。}
    FListView_SelectDevs: TListView;
    ParamAllFrm : TParamAllFrm; //群设参数
    
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
    procedure userlogin_connect(const loginType:byte);  // 用户登录　且　连接应用服务器 //0--正常登录，1--注销后登录
    procedure SetWindowStat(ws:TWindowState);
    function  CheckDevId:boolean;
    procedure SetPower;
    procedure SelectDevFromListSelectDev(State:integer;Sel:boolean);//在选择车辆中再选车
    procedure isOnline;  //判断是否在线.
    procedure OnCarActionClick(Dev:TDevice); //  对图上的小车单击事件处理.
    procedure OnMapLabelMouseMove(Shift: TShiftState; X, Y: Integer);
    procedure InitCallClient;
    procedure FCallClientOnCallIn(Sender: TObject; ATelephone: String; ACallLogID: Integer);
    procedure FCallClientOnEvent(Sender: TObject; EventCode: Integer; AParam: Integer);
    procedure FClientUserChannelEvent(Sender: TObject; EventCode: Integer);
    procedure FClientCountChangeEvent(Sender: TObject; ClientCount: TClientCountData);
    function  TelStateCanDo:boolean;
  private
    //针对试用用户的。如果已注册(取注册表值),则true　如果没注册，则进行注册
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
    //设区域报警
    procedure FMapSetConfineAlarmArea(Sender:TObject;WPointsAry:TWorldPointAry;PointsCnt:Integer);
    //设固定路线
    procedure FMapSetRunWay(Sender:TObject;WPointsAry:TWorldPointAry;PointsCnt:Integer);
    //框选 取出 框选时的起点与终点
    procedure GetMapRectSelect_Rect(PointA, PointB:TEarthPoint);

    //当用户框选车辆，（在地图上圈起来），这里列出来
    procedure FMapUserSelectDev(sender: Tobject;PointA,PointB:TEarthPoint);
    //当用户框选车辆，选中车辆数太多时，这里给出提示
    procedure FMapUserSelDevcntMany;
    procedure DevAlarm_OutorInConfineArea(ADev: Tdevice;AlarmType:Byte;AddorDel:boolean;AArea:TConfineArea);
    {更改车辆列表中的某列}
    procedure OncxDeviceListEdited(Sender: TObject;AColumn: TcxTreeListColumn);

    procedure RestoreRequest(var message: TMessage);  message CM_RESTORE;
    //接收到服务器发送的通知消息
    procedure DataServer_SendMsg(var message: TMessage);  message CM_DATASERVER_SENDMSG;
    procedure DevNotifyStat(var message: TMessage); message CM_DevNotifyStat; //通知设备刷新参数
    procedure RegUserError2Gateway(var message: TMessage); message CM_RegUserErr;// 用户登录到网关服务器 错误
    procedure Msg_DevAlarm(var message: TMessage); message CM_DEVALARM;  //在收到的GPS数据中有报警
    procedure Msg_For_Update(var message: TMessage); message CM_UPDATE;  //更新本自已,,必须关闭自己,这个消息是由更新程序发出.
    //procedure Msg_PowerCut(var message: TMessage);message CM_PowerCut;//断电报警
    procedure RefeshADev(const DevId:integer); //刷新某车
    procedure DoulbeClickOrderList(Sender :TObject);
    procedure OnMapMouseDown(Sender: TObject; Button: TMouseButton;  Shift: TShiftState; X, Y: Integer);
    procedure FMapMouseMove(Sender: TObject; Shift: TShiftState;X, Y: Integer);

    procedure OnMapMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure OnUserDefinedText(Sender:TObject;EarthPoint:TEarthPoint;WorldPoint:TWorldPoint);//用户自定义标签
    procedure OnUserSetFactory(Sender:TObject;EarthPoint:TEarthPoint;WorldPoint:TWorldPoint);//用户自定义工厂工地
    procedure OnEmptyFull(Sender:TObject;AEmptyCount,AFullCount:integer);
    procedure OnReDrawMap(Sender:TObject;Dev:TDevice);
    procedure ShowUserDefinedText;
    function  SetActivePage(PageControl:TPageControl;PageCaption:string):boolean;

  protected
    procedure CreateParams(var Params: TCreateParams);override;
  public
   { Public declarations }
    //主界面地图显示窗口
    FDlg_Map: TMapShowFrm;

    //用来在地图Hint车辆信息
    MapLabel : TLabel;

    //GPS图层
    drawlayer: TGpsDrawLayer;
    datalayer: TGpsDataLayer;

    //轨迹回放图层
{    GpsPlayDrawLayer: TGpsPlayDrawLayer;
    GpsPlayDataLayer: TGpsDataLayer;   }

    //区域图层
    userDrawLayer: TAreaDrawLayer;
    userDataLayer: TDataLayer;

    //用户自定义图层
    TextLayer: TUserDefinedTextLayer;
    TextDataLayer: TDataLayer;

    //地图节点管理器.管理所有的地图配置
    MapManger: TMapManger;

    //把鼠标当作一个车机来处理.主要是解决当前鼠机显示在哪个省市县
    MouseDev:TDevice;

    //将报警列表中 原有的越界或驶入报警信息　推入历史,并将列表中原有删掉
    //MoveCause:
    //　　1、车辆从越界到不越界，或从驶入到驶出。
    //　　2、用户在电子围栏列表中删除某区域或某区域限定的车辆

    procedure RemoveOutorInCAData2History(ADev:TDevice;AlarmType:byte;const MoveCause:string);
    procedure ShowState(Device:TDevice);   //显示32位的状态信息.用的DEvice里的Swicth 来做的.
    function  SetDatetime:boolean;         //修改本机时间
    procedure fun_Locate_CarExecute_rundata;//ifCurNode是否判断为MapNode为当时结点;
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
  DEV_BOUND0 = 1200;   //设备的外部串口波特率
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

{处理“恢复”消息}
procedure TMainf.RestoreRequest(var message: TMessage);
begin
  if IsIconic(Application.Handle) = True then  //窗体是否最小化
    Application.Restore  //恢复窗体
  else
    Application.BringToFront; //提到前面显示
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
    Self.Caption:=IniFile.ReadString('Caption','AppName','智能监控客户端');
    {$IFNDEF ForTestUser}
         Self.Caption:= Self.Caption+'   试用版  大部功能不可以使用  ';
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
  FFlashDlg:= Tflash_jk.Create(self);  //闪出窗体
  FFLashDlg.SetLabel('装入地图文件...');
  FFLashDlg.Show;
  application.ProcessMessages;

  Application.HintHidePause:=15000;
  Application.OnException:=DoAppException;








    FFLashDlg.SetLabel('装入地图配置文件...');
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
  //模糊查找车牌号
//  {$IFDEF For_MistySearchCarNo}
//    EditSearchCarNo.Visible := True;
//    EditSearchCarNo.Left := Edit1.Left;
//    EditSearchCarNo.top := Edit1.Top;
//    EditSearchCarNo.Width := Edit1.Width;
//    EditSearchCarNo.Text := '模糊查找';
//  {$ELSE}
//    EditSearchCarNo.Visible := False;
//  {$endif}
//  ListBoxSearchCarNo.Visible := False;

  {$ifdef ForAddEKey}
  GEkey.OnStateStr := ShowEkeyMsg;
  ConnectedEkey_monitor;//检查KEY
  {$endif}
  iniform ; //初始化　

  {$IFDEF ForTestUser}
  if GlobalParam.isUpdate then
  begin
      FFLashDlg.SetLabel('检查更新...');
      application.ProcessMessages;

      TimerUpdateTimer(nil);
  end;
  {$endif}

  if VersionFor='ZT' then
  begin
    DeviceStateList.Cells[0,4]:='载货状态';
    //DeviceStateList.Cells[0,5]:='载客状态';
    DeviceStateList.DeleteRow(5);
    DeviceStateList.DeleteRow(12);
    DeviceStateList.Cells[0,12]:='倾倒状态';
  end
  else
  if not GlobalParam.isUseMasure  then
  begin
    DeviceStateList.DeleteRow(5);
    DeviceStateList.DeleteRow(5);
    DeviceStateList.DeleteRow(12);
  end;

  userlogin_connect(0); // 用户登录　且　连接应用服务器
  if Logined then
  begin
    //---------------------------------------------------
    FFlashDlg.SetLabel('更新本地时间...');
    SetDatetime;
    FFlashDlg.Gauge1.AddProgress(5);
    //---------------------------------------------------
    FFlashDlg.SetLabel('设置用户权限...');
    SetPower;
    FFlashDlg.Gauge1.AddProgress(5);
    //---------------------------------------------------
    StatusBar1.Panels.Items[3].Text :='当前用户:'+current_user.userName +'，登录时间:'+FormatDateTime('yy/mm/dd hh:nn',now()) ; //
    Current_User.LoginDatetime:=now;
    application.ProcessMessages ;
    try
     //--------登录成功,得到相关参数
      FFlashDlg.SetLabel('下载图片资源...');
      Bs.QueryAllBitmapRes;     //下载资源
      FFlashDlg.Gauge1.AddProgress(10);
     //---------------------------------------------------
      application.ProcessMessages ;
     //---------------------------------------------------
      FFlashDlg.SetLabel('下载车辆组...');
      bs.DevGroupinfo(ADevGroupManage);//------ 打开组管理

      if ADevGroupManage.Count=0 then
      begin
        messagebox(handle,'对不起，当前用户没有查看任何车组的权限！'+#13+#13+
          '请您与系统管理员联系，到【系统管理客户端】为当前用户分配组！','提示',mb_ok + mb_iconinformation);
        Application.Terminate;
        exit;
      end;
      FFlashDlg.Gauge1.AddProgress(10);
     //----------------------------------------------------
      FFlashDlg.SetLabel('下载车辆信息...');
      bs.CarInfo(ACarManage);       //打开车辆 管理
     //----------------------------------------------------
      FFlashDlg.SetLabel('下载设备信息...');
      FFlashDlg.Gauge1.AddProgress(5);
//      ADeviceManage.OnClickCarAction:=OnCarActionClick;
//      ADeviceManage.PopupMenu:=PopupMenu_funDev;
      bs.DeviceInfo(ADeviceManage);//打开设备 管理
      if ADeviceManage.Count=0 then
      begin
        messagebox(handle,'对不起，当前用户没有查看任何车的权限！'+#13+#10+
          '请您与系统管理员联系，到【系统管理客户端】为当前用户分配组，或添加车辆到分配的组！','提示',mb_ok + mb_iconinformation);
        Application.Terminate;
        exit;
      end;
      //---------------------------------------------------
      FFlashDlg.SetLabel('下载车牌号信息...');
      FFlashDlg.Gauge1.AddProgress(5);
      bs.CarNoInfo(ACarNOManage);          //dxf 2007-07-20
      //---------------------------------------------------
      FFlashDlg.SetLabel('连接网关...');
      FFlashDlg.Gauge1.AddProgress(5);
      Connect2Gateway;   //连接网关
      //---------------------------------------------------
      {$IFDEF ForTestUser}
      FFlashDlg.SetLabel('下载电话本...');
      FFlashDlg.Gauge1.AddProgress(10);
      bs.QueryDevsTelList;         //载入所有车机的电话本

      FFlashDlg.SetLabel('下载车机参数...');
      FFlashDlg.Gauge1.AddProgress(5);
      bs.QueryDevParamOfAll;       //加载车机参数     //by dxf 05-09-07

      FFlashDlg.SetLabel('下载显示屏固定菜单...');
      FFlashDlg.Gauge1.AddProgress(5);
      Bs.QueryDevsMenu;            //载入所有车机的显示屏固定菜单

      FFlashDlg.SetLabel('下载取消菜单...');
      FFlashDlg.Gauge1.AddProgress(5);

      //try
      //  Bs.QueryCancelMenu_zb;       //dxf  2006-11-21 to 中北公司
      //  CancelMenuFun:='QueryCancelMenu_zb';
     // except
        CancelMenuFun:='LaodCancelMenu';
        ADeviceManage.LaodCancelMenu;//装载取消菜单
     // end;

      FFlashDlg.SetLabel('下载司机信息...');
      FFlashDlg.Gauge1.AddProgress(5);
      Bs.DriverInfo(ADriverManage);//加载司机信息
      ADeviceManage.CreateDriverNameTel;
      

      FFlashDlg.SetLabel('下载订单信息...');
      FFlashDlg.Gauge1.AddProgress(5);
      AOrderManage.LoadOrdersFromDB;

      FFlashDlg.SetLabel('装载地图编码...');
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
      if GlobalParam.isCarNOAndDevName then  ADeviceManage.CarNOAndDevName;//车牌号和设备名称合在一起....
      {$endif}
      FFlashDlg.SetLabel('打开系统中...');
      FFlashDlg.Gauge1.AddProgress(5);
      Dlgs_Create;
     // DataServer.GetAllPos;
      InitCallClient;
      Timer.Enabled :=true;
      //打开鸟瞰图
      tool_bird_eyeExecute(tool_bird_eye);
      //{$ifdef For_ConfineArea} //从文件 载入 区域信息　20050721　sha
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
      MapLabel.Font.Name:='宋体';

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
      //线程 还改用定时器  2005.03.25
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
    s:=DatetimeToStr(now)+'未捕获的异常:ExceptionClassName:'+E.ClassName;
    s:=s+'   SenderClassName:'+Sender.ClassName;
    //判断是不是TComponent,如果是并记录TComponent.Name
    if Sender is TComponent then
    begin
        s:=s+'   SendCompName:'+TComponent(Sender).Name;
        //判断是不是TWinControl,并有Parent,就记录Parent.Name
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

procedure TMainf.iniform;  //全局变量　　初始化

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
  FMap.OnUserSelectDevEvent := FMapUserSelectDev;          //用户在地图上选择了车辆
  FMap.OnUserSelDevCntManyEvent:= FMapUserSelDevcntMany;   //用户在地图上选择的车辆数　过多
  //Fmap.OnDevAlarm_OutorInCArea:= FMapDevAlarm_OutorInConfineArea;  //车辆越界or 驶入报警
  FGis.AddMap(FMap);
  datalayer := TGpsDataLayer.Create;
  datalayer.LayerName := 'GPS图层';
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

  //载入参数文件
  GlobalParam.LoadFromFile(Application.ExeName+'.config');

  MapManger:= TMapManger.Create('全国');
  MapManger.LoadFile(ExePath+'MapConfig.xml');
  MapManger.ShowToTreeView(FDlg_Map.TreeViewMap,FDlg_Map.CheckBoxIsShowFile.Checked);
  FDlg_Map.StatusBar1.Panels.Items[0].Text:='默认显示地图:'+MapManger.DefaultNode.Name;
  //创建业务服务器
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
  FMap.Layers.SetOrder(FMap.Layers.Count-1,0);//sha 移GPS图层到第0层。

  //{$ifdef For_ConfineArea}
  //用户画区域图层
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
  FMap.Layers.SetOrder(FMap.Layers.Count-1,0);//将　区域绘画图层 始终放在　第0层
 // {$endif}
  TextDataLayer:=TDataLayer.Create;
  TextDataLayer.isHaveNotDelete:=true;
  TextDataLayer.LayerName:='自定义标签';
  TextDataLayer.State:=[lyVisible,lySelect];
  FGis.Provider.AddLayer(TextDataLayer);

  GTextManage.LoadFromFile(ExePath+'UserDefinedText.ini');
  ShowUserDefinedText;
  TextLayer:=TUserDefinedTextLayer.Create;
  TextLayer.isHaveNotDelete:=true;
  TextLayer.Data := TextDataLayer;
  TextLayer.Map := FMap;
  FMap.layers.AddLayerWithLayer(TextLayer);
  FMap.Layers.SetOrder(FMap.Layers.Count-1,0);//将　区域绘画图层 始终放在　第0层
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
  //车辆越界or 驶入报警
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
          messagebox(handle,'密码修改完成！','提示',mb_ok + mb_iconinformation);
          Current_user.Password :=trim(dlg.edit3.text);
        end;
      except
        on E:exception do
           begin
             messagebox(0,pchar(e.Message ),'提示',mb_ok + mb_iconinformation);
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

procedure TMainf.userlogin_connect(const loginType:byte);  // 用户登录　且　连接应用服务器 //0--正常登录，1--注销后登录
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
  if loginType =1 then //1--注销后登录
  begin
    dlg.BitBtn2.Caption:='退出';
  end;   
  cnt:= 0;
  try
    while true do
    begin
      if FFlashDlg.Showing then FFlashDlg.Hide;//用户名或密码错时，重新输入 。此时 FFlashDlg.Showing=true
      dlg.ShowModal ;
      cnt:= cnt + 1;
      if dlg.ModalResult = mrok then
      begin
        FFlashDlg.Show ;
        FFlashDlg.SetLabel('连接业务服务器...');
        FFlashDlg.Gauge1.Progress:=5;
        application.ProcessMessages;
        current_user:= Tuser.Create(trim(dlg.Edit1.Text), trim(dlg.Edit2.Text));

        try  //--------连接 到业务服务器
          bs.ConnectServer ;
          application.ProcessMessages;

          FFlashDlg.SetLabel('检查用户名和密码...');
          FFlashDlg.Gauge1.AddProgress(5);
          if logined then break;   //如果用户登录成功则退出
          if (cnt>=3) and (logined=false) and (loginType<>1) then   //1--注销后登录
          begin
            messagebox(handle,'对不起，您已错误输入三次，将退出系统！','提示',mb_ok + mb_iconinformation);
            break;
          end;
        except
          on E:exception do
          begin
            messagebox(handle,pchar(e.Message ),'连接到业务服务器失败！',mb_ok + mb_iconinformation);
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
    if (ActionList1.Actions[i].Category='地图工具') then
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
    if (ActionList1.Actions[i].Category='地图工具') then
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
    if (ActionList1.Actions[i].Category='地图工具') then
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
    if (ActionList1.Actions[i].Category='地图工具') then
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
    if (ActionList1.Actions[i].Category='地图工具') then
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
    if (ActionList1.Actions[i].Category='地图工具') then
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
    if (ActionList1.Actions[i].Category='地图工具') then
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
  if cnt>0 then //选中点的数据　显示
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
      FileName:=path+'省.tyo';
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
      
      mapfont.Name:=inifile.ReadString('省','FontName','隶书');
      mapfont.Size:=inifile.ReadInteger('省','FontSize',20);
      mapfont.Color:=inifile.ReadInteger('省','FontColor',8388608);
      lay.SetLayerFont(mapfont);
      lay := nil;

      FileName:=path+'市.tyo';
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
      mapfont.Name:=inifile.ReadString('市','FontName','宋体');
      mapfont.Size:=inifile.ReadInteger('市','FontSize',14);
      mapfont.Color:=inifile.ReadInteger('市','FontColor',32768);
      lay.SetLayerFont(mapfont);
      lay := nil;

      
      FileName:=path+'县.tyo';
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
      mapfont.Name:=inifile.ReadString('县','FontName','宋体');
      mapfont.Size:=inifile.ReadInteger('县','FontSize',11);
      mapfont.Color:=inifile.ReadInteger('县','FontColor',128);
      lay.SetLayerFont(mapfont);
      lay := nil;

      if not GlobalParam.isLoadChinaRoad then exit;
      SetCurrentDir(Path); //当每一次打开文件,当前路径就改变了,所以这个函数要放在循环.
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
      mapfont.Name:=inifile.ReadString('Road','FontName','宋体');
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
        while (temp.Name<>'全国')do
        begin
        MapName:=temp.Name+'->'+MapName;
        temp:=temp.ParentNode;
        if (temp=nil){or(temp.Name='全图')} then break;
        end;

    FDlg_Map.PanelMapName.Caption:='当前地图区域－'+MapName;

    Self.Caption:=Application.Title+'                       当前显示 '+MapName+' 地图';
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
    uGloabVar.SystemLog.AddLog(' OpenWSInit(AMapNode:TMapNode;Gauge1:TGauge)函数报错: ',e.Message);
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
    FFLashDlg.SetLabel('地图处理...');
    application.ProcessMessages;
    //FMap.Draw;
except  on E: Exception do
    uGloabVar.SystemLog.AddLog(' TMainf.OpenWS(AMapNode:TMapNode;Gauge1:TGauge)函数报错: ',e.Message);
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
    FFLashDlg.SetLabel('地图处理...');
//    application.ProcessMessages;//dxf 2007-07-11  此语名不能加上,如果加上,切换地图时会闪烁显示省图

    FMap.DrawCood.SetRealScale(temp);
   // showmessage('TMainf.OpenWS2');
    FMap.Zoom(OutBox);
  //  showmessage('TMainf.OpenWS3');
//    FMap.Draw;
except  on E: Exception do
    uGloabVar.SystemLog.AddLog(' OpenWSAutoScale(AMapNode:TMapNode;Gauge1:TGauge)函数报错: ',e.Message);
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
      SetCurrentDir(CDir); //当每一次打开文件,当前路径就改变了,所以这个函数要放在循环.
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
  if messagebox(handle,'您确定要退出本系统？','退出选项',MB_OKCANCEL + MB_ICONQUESTION)= ID_CANCEL then
    CanClose := false;
end;

procedure TMainf.Connect2Gateway;
begin
   //线程 还改用定时器
  DataServer := TGateWayServerCom.Create;
  DataServer.UserId := current_user.id;
  DataServer.UserPass := current_user.Password;
  DataServer.Host := GlobalParam.Gateway.Host;
  DataServer.Port := GlobalParam.Gateway.Port;
  DataServer.Active := True;
end;

procedure TMainf.fun_callDevExecute(Sender: TObject);  //呼叫车辆
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

procedure TMainf.sys_lockExecute(Sender: TObject);     //锁定
var
  dlg:Tfrmlogin;
  TempBool:boolean;
begin
  TempBool:=false;
  if not TelStateCanDo then exit;
  if GetFocusSendOrderFrm<>nil then
  begin
    MessageBox(Self.Handle,pchar('请处理完所有订单再锁定'),'提示',mb_ok + mb_iconinformation);
    exit;
  end;

  dlg:= TfrmLogin.Create(self);
  try
    dlg.Caption :='用户锁定';
    dlg.Panel1.Caption :='用户锁定';
    dlg.Edit1.Text :='';
    dlg.edit2.Text :='';
    dlg.BitBtn1.Left :=(dlg.Width - dlg.BitBtn1.Width ) div 2;
    dlg.BitBtn2.Visible :=false;
    dlg.label3.Caption :='锁定时间：'+formatdatetime('yyyy-mm-dd hh:nn:ss',now());
    dlg.Label3.Visible :=true;
    if GlobalParam.IsUseTelServer then
    begin
      TempBool:=TimerCall.Enabled;
      FCallClient.PauseWork;
    end;  
    while true do
    begin
      //最小化本软件 窗口
      SetWindowStat(wsMinimized);
      Self.Hide;
      timer.Enabled :=false;

      dlg.ShowModal ;
      if dlg.ModalResult =mrok then
      begin
        if trim(dlg.Edit1.Text) <> current_user.UserName then
        begin
          messagebox(handle,'用户名不正确，请重新输入！','提示',mb_ok + mb_iconinformation);
          dlg.Edit1.Text:='';
          continue;
        end;
        if trim(dlg.Edit2.Text) <> current_user.Password then
        begin
          messagebox(handle,'密码不正确，请重新输入！','提示',mb_ok + mb_iconinformation);
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

procedure TMainf.sys_offExecute(Sender: TObject); //注销
var
 TempBool:boolean;
begin
  TempBool:=false;
  if not TelStateCanDo then exit;
  if GetFocusSendOrderFrm<>nil then
  begin
    MessageBox(Self.Handle,pchar('请处理完所有订单再注销'),'提示',mb_ok + mb_iconinformation);
    exit;
  end;
  if messagebox(handle,'您确定要注销？','提示',mb_yesno + mb_iconquestion)=id_no  then exit;
  
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
  DataServer.Active:=false;
  //用户登出
  bs.userlogout(current_user);
  current_user.Free;
  //断开连接
  bs.DisConnectServer ;
 
  ADevGroupManage.Clear;      //清组

  ADeviceManage.ClearDevice;  //清车辆\设备
  ACarManage.ClearCar;

  
  FDlg_Watch_Car.cxDeviceList.Clear; //FDlg_Watch_Car.listview1.Clear; //车辆GPS数据详情
  FDlg_Watch_Car.TreeView1.Items.Clear;
  FDlg_AlarmCar.cxAlarmList.Clear;
  FDlg_AlarmCar.cxStopAlarmList.Clear;
  FDlg_Sended_Cmd.cxTreeList1.Clear;   //FDlg_Sended_Cmd.ListView1.Clear ;//已发命令
  FDlg_OrderList.cxOrderList.Clear;//订单列表..
  FDlg_Received_Info.cxInfoList.Clear;  //收到网关的信息
  FDlg_OrderList.cxOrderList.Clear;

  GCurSelectDev := nil;
  GCurSelectGroupID := -1;
  //{$ifdef For_ConfineArea}
  GCurConfineArea := nil;
  GAreaManage.Clear;      //限定区域 管理器
  FDlg_AlarmCar.cxOutCAreaList.Clear;
  FDlg_AlarmCar.cxOutCAreaList_History.Clear;
  FDlg_AlarmCar.cxInCAreaList.Clear;
  FDlg_AlarmCar.cxInCAreaList_History.Clear;
  FDlg_ConfineAreaList.cxAreaList.Clear;
  FDlg_ConfineAreaList.Clear_Changed;
  //{$endif}

  //if FDlg_Sended_msg.Visible then   // 已发简短消息
  //  FDlg_Sended_msg.ListViewTo.Items.Clear;

  Edit1.Text := '';
  Edit2.Text := '';
  ComboboxCarNo.Text:='';
  StatusBar1.Panels.Items[2].Text :='';
  if fun_ShowACarTrack.Checked then fun_ShowACarTrack.Checked := false; //显示轨迹
  if fun_watch_car.Checked then fun_watch_car.Checked := false; //跟踪
  Dlgs_Free;//隐去所有窗口

  // 新 用户登录
  userlogin_connect(1);
  if logined then
  begin
    //---------------------------------------------------
    FFlashDlg.SetLabel('更新本地时间...');
    SetDatetime;
    FFlashDlg.Gauge1.AddProgress(5);
    //---------------------------------------------------
    FFlashDlg.SetLabel('设置用户权限...');
    SetPower;
    FFlashDlg.Gauge1.AddProgress(5);
    //---------------------------------------------------
    StatusBar1.Panels.Items[3].Text :='当前用户:'+current_user.userName +'，登录时间:'+FormatDateTime('yy/mm/dd hh:nn',now()) ; //
    Current_User.LoginDatetime:=now;
    application.ProcessMessages ;
    try
     //--------登录成功,得到相关参数
      FFlashDlg.SetLabel('下载图片资源...');
      Bs.QueryAllBitmapRes;     //下载资源
      FFlashDlg.Gauge1.AddProgress(10);
     //---------------------------------------------------
      application.ProcessMessages ;
     //---------------------------------------------------
      FFlashDlg.SetLabel('下载车辆组...');
      bs.DevGroupinfo(ADevGroupManage);//------ 打开组管理

      if ADevGroupManage.Count=0 then
      begin
        messagebox(handle,'对不起，当前用户没有查看任何车组的权限！'+#13+#13+
          '请您与系统管理员联系，到【系统管理客户端】为当前用户分配组！','提示',mb_ok + mb_iconinformation);
        Application.Terminate;
        exit;
      end;
      FFlashDlg.Gauge1.AddProgress(10);
     //----------------------------------------------------
      FFlashDlg.SetLabel('下载车辆信息...');
      bs.CarInfo(ACarManage);       //打开车辆 管理
     //----------------------------------------------------
      FFlashDlg.SetLabel('下载设备信息...');
      FFlashDlg.Gauge1.AddProgress(5);
//      ADeviceManage.OnClickCarAction:=OnCarActionClick;
//      ADeviceManage.PopupMenu:=PopupMenu_funDev;
      bs.DeviceInfo(ADeviceManage);//打开设备 管理
      if ADeviceManage.Count=0 then
      begin
        messagebox(handle,'对不起，当前用户没有查看任何车的权限！'+#13+#10+
          '请您与系统管理员联系，到【系统管理客户端】为当前用户分配组，或添加车辆到分配的组！','提示',mb_ok + mb_iconinformation);
        Application.Terminate;
        exit;
      end;
      //---------------------------------------------------
      FFlashDlg.SetLabel('下载车牌号信息...');
      FFlashDlg.Gauge1.AddProgress(5);
      bs.CarNoInfo(ACarNOManage);
      //---------------------------------------------------
      FFlashDlg.SetLabel('连接网关...');
      FFlashDlg.Gauge1.AddProgress(5);
      Connect2Gateway;   //连接网关
      //---------------------------------------------------
      FFlashDlg.SetLabel('下载电话本...');
      FFlashDlg.Gauge1.AddProgress(10);
      bs.QueryDevsTelList;         //载入所有车机的电话本

      FFlashDlg.SetLabel('下载机车参数...');
      FFlashDlg.Gauge1.AddProgress(10);
      bs.QueryDevParamOfAll;       //加载车机参数     //by dxf 05-09-07

      FFlashDlg.SetLabel('下载显示屏固定菜单...');
      FFlashDlg.Gauge1.AddProgress(5);
      Bs.QueryDevsMenu;            //载入所有车机的显示屏固定菜单

      FFlashDlg.SetLabel('下载取消菜单...');
      FFlashDlg.Gauge1.AddProgress(5);
      ADeviceManage.LaodCancelMenu;//装载取消菜单

      FFlashDlg.SetLabel('下载司机信息...');
      FFlashDlg.Gauge1.AddProgress(5);
      Bs.DriverInfo(ADriverManage);//加载司机信息

      FFlashDlg.SetLabel('下载订单信息...');
      FFlashDlg.Gauge1.AddProgress(5);
      AOrderManage.LoadOrdersFromDB;
      if GlobalParam.isCarNOAndDevName then  ADeviceManage.CarNOAndDevName;//车牌号和设备名称合在一起....

      FFlashDlg.SetLabel('打开系统中...');
      FFlashDlg.Gauge1.AddProgress(5);
      Dlgs_Create;
     // Dlgs_Show;
     // DataServer.GetAllPos;


      Timer.Enabled :=true;
      //打开鸟瞰图
      tool_bird_eyeExecute(tool_bird_eye);
      //{$ifdef For_ConfineArea} //从文件 载入 区域信息　20050721　sha
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

procedure TMainf.fun_view_SwitchStatExecute(Sender: TObject);//查看 某车设备的接头状态
begin
  if not CheckDevId then exit;
  if not Panel_Clxx.Visible then
    show_car.Execute;
  ShowState(GCurSelectDev);
end;

procedure TMainf.fun_watch_carExecute(Sender: TObject);  //跟踪车辆--使某车不出地图的边界
begin
  with fun_watch_car do
  begin
    if not checked then
    begin
      if not CheckDevId then exit;
      GOldFollowDev := FMap.GpsDrawlayer.AutoFollowDevice;
      if (GCurSelectDev.Longitude =0) or (GCurSelectDev.Latitude = 0) then
      begin
        messagebox(handle,'目前该车无定位数据，不能跟踪!','提示',mb_ok + mb_iconinformation);
        exit;
      end;
      FMap.GpsDrawlayer.AutoFollowDevice := GCurSelectDev;
      //GOldFollowDev 保存用户指定的 跟踪车辆，
      //当有车辆报警时，跟踪报警车辆。当该车取消报警时，恢复保存过的用户指定跟踪车辆GOldFollowDev
      GOldFollowDev := GCurSelectDev;
      StatusBar1.Panels.Items[2].Text :='当前跟踪车辆：'+GCurSelectDev.Car.No;
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
    WindowState:= ws;//最大化本软件 窗口
  end;
end;

procedure TMainf.fun_view_DevParamExecute(Sender: TObject);
begin
  {$ifdef ForAddEKey}
  ConnectedEkey_monitor;
  {$endif}
  if not CheckDevId then
  begin
   messagebox(0,'请先《在监控车辆列表选中》或《在右上角输入》车辆!','提示',mb_ok + mb_iconinformation);
   exit;
  end;
  if ReadParamFrm =nil then ReadParamFrm:=TParamReadFrm.Create(Self);
  ReadParamFrm.Show;
end;

procedure TMainf.TimerTimer(Sender: TObject);
begin
try
    RefreshSeverStat;//刷新业务和网关的状态..在状态栅里最右边两个图标,绿色为在线,灰色为掉线.
    isOnline;
    if FDlg_Watch_Car.Floating       then FDlg_Watch_Car.Refresh_WatchCar;
    if FDlg_Sended_Cmd.Floating      then FDlg_Sended_Cmd.Refresh_SendedCmd;
    if FDlg_AlarmCar.Floating        then FDlg_AlarmCar.Refresh_AlarmCar;
    if FDlg_ConfineAreaList.Floating then FDlg_ConfineAreaList.ListCurrConfine_Devs;
    if FDlg_OrderList.Floating       then FDlg_OrderList.RefreshOrderList;
  if PageControlBottom.ActivePage.Caption ='车辆列表' then
  begin
    FDlg_Watch_Car.Refresh_WatchCar;
  end
  else if PageControlBottom.ActivePage.Caption ='发送命令列表' then
  begin
    FDlg_Sended_Cmd.Refresh_SendedCmd;
  end
  else if PageControlBottom.ActivePage.Caption ='报警车辆列表' then
  begin
    FDlg_AlarmCar.Refresh_AlarmCar;
  end
  else if PageControlBottom.ActivePage.Caption ='电子围栏列表' then
  begin
    FDlg_ConfineAreaList.ListCurrConfine_Devs;
  end
  else if PageControlBottom.ActivePage.Caption  ='发送订单列表'  then
  begin
    FDlg_OrderList.RefreshOrderList;
  end;

  if (GCurSelectDev<> nil)and(not FMap.IsPlayGpsData) then ShowState(GCurSelectDev);

except  on E: Exception do
    uGloabVar.SystemLog.AddLog(' TMainf.TimerTimer函数报错: ',e.Message);
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
  //　如果　用户手动输入
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
        ListDevice.Cells[1,1] :='无此车或无权限查看该车';
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
  ShowDeviceTrack_Watch(GCurSelectDev);//是否显示轨迹 ，是否被跟踪

  //车辆详细信息
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
    //messagebox(0,'请先《在监控车辆列表选中》或《在右上角输入》车辆!',
    //  '提示',mb_ok + mb_iconinformation)
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
  if (p^.State = CMD_SNDNODO) or (p^.State = CMD_RESND) then//0--已发送未执行，6--重发
  begin
    DataServer.CancelCmd(p^.Id);
  end
  else
    MessageBox(Handle,pchar('对不起，'+p^.Desc+'这条命令不能再取消'),'提示',MB_OK+MB_ICONINFORMATION);

end;

procedure TMainf.cmd_reSendExecute(Sender: TObject);
var
  p: PCmdInfo;
begin
  if FDlg_Sended_Cmd.cxTreeList1.FocusedNode = nil  then exit;
  p := FDlg_Sended_Cmd.cxTreeList1.FocusedNode.Data ;
  DataServer.RepeatSend(p^.Id);
end;

procedure TMainf.DataServer_SendMsg(var message: TMessage);  //传入休息的添加.
begin
  FDlg_Received_Info.cxInfoList.BeginUpdate;
  with FDlg_Received_Info.cxInfoList.Add  do //接收到服务器发送的通知消息
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

      FMap.Layers.SetOrder(drawlayer,0);//dxf 移GPS图层到第0层。
      FMap.Layers.SetOrder(TextLayer,1);
      FMap.Layers.SetOrder(userDrawLayer,2);
      FMap.Draw;
    end;
      
  finally
    dlg.Free;
  end;
end;



procedure TMainf.fun_Set_DevParamExecute(Sender: TObject);  //修改设备参数
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
  if messagebox(handle,'设备数据已有改变，是否现在就更新？','提示',mb_yesno+ MB_ICONQUESTION )= ID_YES then
    RefeshADev(devId);
end;

procedure TMainf.RefeshADev(const DevId: integer);
var
  followDevId,oldFollowDevId,currDevId:integer;
  dev : TDevice;
  dlg : TFrmRefreshProgress;
  i:integer;
begin
  dlg:= TFrmRefreshProgress.Create(Self); //=====先 定为更新所有车的数据
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
      popmsg('错误提示','刷新失败!');
      exit;
    end;
    //-----暂存 跟踪车辆和当前车辆的ID，因为有可能 跟踪车辆和当前车辆会被删除了
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
    ADevGroupManage.Clear ;          //清除组
    ACarManage.ClearCar ;            //车
    //GAreaManage.Clear;             //限定区域 管理器
    ResManage.Clear;

    FDlg_Watch_Car.cxDeviceList.FocusedNode := nil; //★★
    FDlg_Watch_Car.cxDeviceList.Clear;
    FDlg_Sended_Cmd.cxTreeList1.FocusedNode := nil;
    FDlg_Sended_Cmd.cxTreeList1.Clear;
    FDlg_ConfineAreaList.cxDeviceList.FocusedNode := nil; //★★
    FDlg_ConfineAreaList.cxDeviceList.Clear;

    dlg.Gauge1.AddProgress(10);
    bs.QueryAllBitmapRes;             //载入图片
    dlg.Gauge1.AddProgress(10); //40
    bs.CarInfo(ACarManage);           //加载车辆信息
    dlg.Gauge1.AddProgress(10); //50
    bs.DevGroupinfo(ADevGroupManage); //加载分组信息
    dlg.Gauge1.AddProgress(10); //60
    bs.Reload_DeviceInfo(ADeviceManage);//重新载入车机，对已没有的或当前用户无权查看车机，从管理器中删除

    dlg.Gauge1.AddProgress(5);  //70
    {$IFDEF ForTestUser}
    Bs.QueryDevsTelList;            //载入所有车机的电话本
    dlg.Gauge1.AddProgress(5);
    Bs.QueryDevsMenu;               //载入所有车机的显示屏固定菜单
    dlg.Gauge1.AddProgress(5);
    ADeviceManage.LaodCancelMenu;  //载入取消菜单
    dlg.Gauge1.AddProgress(5);
    BS.QueryDevParamOfAll;          //加载车辆参数
    dlg.Gauge1.AddProgress(5); //80
    ADriverManage.ClearDriver;
    Bs.DriverInfo(ADriverManage);   //加载司机信息
    ADeviceManage.CreateDriverNameTel;
    //{$ifdef For_ConfineArea}
    //更新区域列表中的车
    //----如果车机有变化(是针对被删除掉的车或组)，则将区域中的该车机ID删除。
    //----因为车机已经重新载入过，其区域ID为-1，现将区域ID赋上
    GAreaManage.Refresh_DevChanged;
    {$endif}
    dlg.Gauge1.AddProgress(10);//90;
    if ADevGroupManage.Find(GCurSelectGroupID)= nil then //--车组
      GCurSelectGroupID := -1;
    FDlg_Watch_Car.List_TreeGroup;  //显示车辆组(树)


    dlg.Gauge1.AddProgress(5);
    dev:= ADeviceManage.Find(followDevId);  //---恢复 跟踪车辆
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

    FDlg_AlarmCar.UserRefresh_IfDevDeleted_CheckCAList;//用户刷新数据，可能有车被删除了。检查并删除越界及驶入列表中 已被删除的车辆信息
    FMap.DrawGpsMap_ClearDraw;

    dlg.Gauge1.AddProgress(10);// 100;
    GCurSelectDev:= ADeviceManage.Find(currDevId);//---恢复 当前车辆
    if GlobalParam.isCarNOAndDevName then  ADeviceManage.CarNOAndDevName;//车牌号和设备名称合在一起....

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

procedure TMainf.fun_refresh_all_devExecute(Sender: TObject);   //更新所有车的数据
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
  if Bs<>nil then
  begin
    if Bs.Active then
      StatusBar1.Panels.Items[4].ImageIndex :=3
    else
    begin
      StatusBar1.Panels.Items[4].ImageIndex := 4;
    end;
    MemoBs.Text:='业务:'+Bs.Socket.Host+':'+IntToStr(Bs.Socket.Port);
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
               uGloabVar.SystemLog.AddLog('开始重新创建网关...');
               DataServer.Active:=false;
               DataServer.Socket.Active:=false;
               DataServer.Free;
               Connect2Gateway;
               uGloabVar.SystemLog.AddLog('重新创建网关成功');
          except  on E: Exception do
             begin
               uGloabVar.SystemLog.AddLog('重新创建网关失败',e.Message);
             end;
          end;

       end;

    end;
    MemoGateWay.Text:='网关:'+DataServer.Socket.Host+':'+IntToStr(DataServer.Socket.Port);
except  on E: Exception do
    uGloabVar.SystemLog.AddLog(' RefreshSeverStat函数报错: ',e.Message);
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


procedure TMainf.fun_Locate_CarExecute(Sender: TObject); //使某车位置居于地图中心
var
  ep: TEarthPoint;
  wp: TWorldPoint;
begin
  if not CheckDevId then
  begin
   //PopMsg('提示','请先《在监控车辆列表选中》或《在右上角输入》车辆');
   messagebox(0,'请先《在监控车辆列表选中》或《在右上角输入》车辆!','提示',mb_ok + mb_iconinformation);
   exit;
  end;
  ep.Longitude := GCurSelectDev.Longitude;
  ep.Latitude := GCurSelectDev.Latitude;
  if  (ep.Longitude=0 ) and (ep.Latitude=0 ) then
    PopMsg('提示','对不起，此车没有GPS数据!无法定位!')
   // messagebox(handle,'对不起，现在该车没有GPS数据!无法定位!','提示',mb_ok + mb_iconinformation)
  else
  begin
    if GlobalParam.isAutoChangeMap then fun_ChangeMap.Execute;
    wp := FMap.Projection.LoLa2XY(ep);
    FMap.Zoom(1,wp);
    FMap.Draw;
  end;
end;

procedure TMainf.fun_Locate_CarExecute_rundata(); //使某车位置居于地图中心
var
  ep: TEarthPoint;
  wp: TWorldPoint;
  sp:Tpoint;
begin
  ep.Longitude := GCurSelectDev_rundata.Longitude;
  ep.Latitude := GCurSelectDev_rundata.Latitude;
  wp :=  FMap.Projection.LoLa2XY(ep);
  {//切换地图
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
  FMap.DrawTempEllipseAndText(sp.x,sp.y,'下客地点');
{if not CheckDevId then
  begin
   //PopMsg('提示','请先《在监控车辆列表选中》或《在右上角输入》车辆');
   messagebox(0,'请先《在监控车辆列表选中》或《在右上角输入》车辆!','提示',mb_ok + mb_iconinformation);
   exit;
  end;
  ep.Longitude := GCurSelectDev_rundata.Longitude;
  ep.Latitude := GCurSelectDev_rundata.Latitude;
  if  (ep.Longitude=0 ) and (ep.Latitude=0 ) then
    PopMsg('提示','对不起，此车没有GPS数据!无法定位!')
   // messagebox(handle,'对不起，现在该车没有GPS数据!无法定位!','提示',mb_ok + mb_iconinformation)
  else
  begin
    if GlobalParam.isAutoChangeMap then fun_ChangeMap.Execute;
    wp := FMap.Projection.LoLa2XY(ep);
    FMap.TmpDraw.Canvas.Pen.Color := clred;
    FMap.TmpDraw.Canvas.Pen.Width := 3;
    FMap.TmpDraw.Canvas.Pen.Mode := pmMask;
    FMap.DrawTempEllipseAndText(wp.x,wp.y,'下客地点');
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
   messagebox(0,'请先《在监控车辆列表选中》或《在右上角输入》车辆!','提示',mb_ok + mb_iconinformation);
   exit;
  end;   }
 { if  (GCurSelectDev.Longitude=0 ) and (GCurSelectDev.Latitude=0 ) then
  begin
    PopMsg('提示','对不起，此车没有GPS数据!无法切换对应的地图!');
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
  //PopMsg('提示','对不起，没有找到此车对应的地图!');
end;

procedure TMainf.fun_watch_cancelExecute(Sender: TObject);//取消跟踪
begin
  FMap.GpsDrawlayer.AutoFollowDevice := nil;
  StatusBar1.Panels.Items[2].Text :='';
  fun_watch_cancel.Enabled := false;
end;

procedure TMainf.ApplicationEventsException(Sender: TObject; E: Exception);
begin
  messagebox(0,pchar(e.Message ),'提示',mb_ok + mb_iconinformation);   
  exit;
end;

procedure TMainf.FMapMeasure(Sender: TObject; Distance, TotalDistance,
  Area: Double; Flag: Integer);
var
  s: string;
begin
  s := '距离:';
  s := s + Format('%n米',[Distance]);
  if TotalDistance<>0 then
    s := s + ';总距离:' + Format('%n米',[TotalDistance]);
  if Flag = 1 then
    s := s + ';面积:' + Format('%n平方米',[Area]);
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

procedure TMainf.map_CloseLayerExecute(Sender: TObject); //关闭图层
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
      dlg.Caption := '删除图层';
      dlg.bitbtn1.caption:='删除图层';
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
              messagebox(handle,pchar(dlg.ListBox1.Items.Strings[i]+'不能删除!'),'提示',mb_ok + mb_iconinformation);
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
  //--- 是否显示轨迹
  fun_ShowACarTrack.Checked := Adev.DrawTrack;
  //---是否被跟踪
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
      str1:= DelInvalidStr(str1);  // 去掉无效字符
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
    ERR_INVALIDUSER  : StatusBar1.Panels.Items[2].Text := '无效的用户名重复登录网关服务器';
    ERR_INVALIDPASSWD: StatusBar1.Panels.Items[2].Text := '无效的密码登录网关服务器';
    ERR_Logged       :
                     begin
                       s:='['+current_user.UserName+']在别一处登录网关服务器';
                       StatusBar1.Panels.Items[2].Text :=s;
                       messagebox(handle,pchar(s),'提示',mb_ok + mb_iconinformation);
                       //sys_off.Execute;
                     end;
    ERR_INVALIDVER   : StatusBar1.Panels.Items[2].Text := '无效的版本号,网关服务器的命令版本号:'
      + inttostr(DataServer.ComVer.MajorVer)+'.'+inttostr(DataServer.ComVer.MinorVer);
  end;
  PopMsg('网关错误',StatusBar1.Panels.Items[2].Text);
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
          if PageControlBottom.Pages[i].Caption = '发送订单列表' then
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

procedure TMainf.set_AlarmSoundExecute(Sender: TObject);//设置报警声音
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

procedure TMainf.Msg_DevAlarm(var message: TMessage);  //车辆报警
var
  str  : string;
  i,devId  : integer; //
begin

  if GlobalParam.IsAlarmFollow then   //对当前报警车辆跟踪
  begin
    devId := message.WParam;
    FMap.GpsDrawlayer.AutoFollowDevice := ADeviceManage.Find(devId);
    StatusBar1.Panels.Items[2].Text :='跟踪报警车辆：'+ FMap.GpsDrawlayer.AutoFollowDevice.Car.No;
  end;
  //cph:= ADeviceManage.Find(devId).Car.No;
  //messagebox(handle,pchar('现有车辆'+cph+'报警!'),'提示',mb_ok + mb_iconinformation);
  //报警声音
  if GlobalParam.DevAlarmSound ='' then
  begin
    //扬声器 发声
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
      //扬声器 发声
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
          if PageControlBottom.Pages[i].Caption = '车辆列表' then
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
          if PageControlBottom.Pages[i].Caption = '车辆列表' then
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
          if PageControlBottom.Pages[i].Caption = '发送命令' then
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
  end;
end;

procedure TMainf.set_SaveWorkShopExecute(Sender: TObject);
begin
  {$ifdef ForAddEKey}
  ConnectedEkey_monitor;
  {$endif}
  //If not HasPrivilege(PRI_LOCALSET) Then exit;
  //保存一个本地的当前配置文件作为系统管理员的配置文件的模板
  SaveWS;
  Map_Save.Execute;
  GlobalParam.SaveToFile(Application.ExeName+'.config');
  GAreaManage.SaveCurrentAreasToFile(ExtractFilePath(application.ExeName)+current_User.UserName+'_areas.ini')
end;

procedure TMainf.stop_AlarmExecute(Sender: TObject);
begin
  Timer.Enabled :=False;
  try
  if  FDlg_AlarmCar.stop_Alarm then FMap.DrawGpsMap_ClearDraw;//清GPS图层并重画车 ;
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
    if (ActionList1.Actions[i].Category='地图工具') then
    begin
      if ActionList1.Actions[i].Name<>'tool_bird_eye' then
      begin
        TAction(ActionList1.Actions[i]).Checked:=false;
      end;
    end;
  end;  
  TAction(Sender).Checked:=true;
end;


procedure TMainf.ck_carExecute(Sender: TObject);//车辆信息查询
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
  //-----数据显示窗体
  FDlg_data_display  := Tdata_display.Create(self);
  FDlg_Data_Display.Parent:= FDlg_Map.Panel_data_display;
  FDlg_Data_Display.Top:=0;
  FDlg_Data_Display.Left:=0;

  FDlg_Watch_Car:= Twatch_car.Create(self);
  FDlg_Watch_Car.cxDeviceList.PopupMenu := PopupMenu_funDev;
  FDlg_Watch_Car.cxDeviceList.OnEditValueChanged := OncxDeviceListEdited;

  FDlg_DRunData := TtaxiRunDataFrm.Create(self);


  FDlg_Sended_Cmd := TSended_Cmd.Create(self);  //发送命令窗口
  FDlg_Sended_Cmd.cxTreeList1.PopupMenu :=PopupMenu_cmd;

  FDlg_OrderList:=TOrderListFrm.Create(Self);   //发送订单列表窗口
  FDlg_OrderList.cxOrderList.OnDblClick:=DoulbeClickOrderList;


  FDlg_Received_Info := TReceived_info.Create(self);
  DataServer.OnSendMsg:=FDlg_Received_Info.ReceivedMsg;
  

  FDlg_Prompt_Info:= TReceived_info.Create(self);
  FDlg_Prompt_Info.Caption:='提示信息';
  FDlg_Prompt_Info.Log.LogFile:=ExePath+'提示信息'+'\'+'提示信息';
  ADeviceManage.OnSendMsg:=FDlg_Prompt_Info.ReceivedMsg;


//  FDlg_Sended_msg:= TSended_Message.Create(self);

  FDlg_ConfineAreaList:= TConfineAreaListFrm.Create(self);
  //FDlg_ConfineAreaList.cxDeviceList.OnEditValueChanged := OncxDeviceListEdited;

  FDlg_AlarmCar:= TFrmAlarmCar.Create(self);
  FDlg_AlarmCar.cxAlarmList.PopupMenu  := PopupMenu_Alarm ;

  ListSelectDev.Images                 := ResManage.BmpList;//用户在地图上选中车辆列表
  //ListSelectDev.PopupMenu := PopupMenu_funDev;
  //ListSwitch.Images := ResManage.BmpList;

  //地物查询
  FDlg_SearchAddress := TFrmSearchAddressInMap.Create(self);

  FDlg_PictureFrm  :=TPictureFrm.Create(Self);
  DataServer.OnPicUpload:=FDlg_PictureFrm.OnPicUpload; 

  FDlg_HisForm:= TFormHisMain.Create(Self);

  Dlgs_Show;
end;

procedure TMainf.Dlgs_Free;
begin


  //-----数据显示窗体
  FDlg_data_display.Free;
  FDlg_Watch_Car.Free;
  FDlg_Sended_Cmd.Free;//发送命令窗口
  FDlg_OrderList.Free;   //发送订单列表窗口
  FDlg_Received_Info.Free;
  FDlg_ConfineAreaList.Free;
  FDlg_AlarmCar.Free;
  FDlg_SearchAddress.Free;//地物查询
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
  Source: TDragDockObject; X, Y: Integer);  {停泊窗体事件}
begin
  Inc(FBottomFormCount);
end;

procedure TMainf.PageControlBottomUnDock(Sender: TObject; Client: TControl;
  NewTarget: TWinControl; var Allow: Boolean);    {从底层窗口拖出窗体事件}
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
    {重新选择车辆 用统一的选择车辆窗体}
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
    if dlg.ModalResult = mrok then //处理　呼叫车辆
    begin
      n:= dlg.ListView1.Items.Count;
      if n=0 then
      begin
        messagebox(handle,pchar('命令不能执行，没有指定车辆'),'提示',mb_ok + mb_iconinformation);
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

//群发　简短消息
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
    {重新选择车辆 用统一的选择车辆窗体}
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
        messagebox(handle,'命令不能执行，没有指定车辆！','提示',mb_ok + mb_iconinformation);
        exit;
      end;
      tmpStr:= trim(dlg.Memo1.Lines.Text);
      // 去掉无效字符
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
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1; 
    dlg.ShowModal;
    if dlg.ModalResult = mrok then
    begin
      if dlg.ListView1.Items.Count=0 then
      begin
        messagebox(handle,'命令不能执行，没有指定车辆！','提示',mb_ok + mb_iconinformation);
        exit;
      end;
      tmpStr:= trim(dlg.Memo1.Lines.Text);
      // 去掉无效字符
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
      //显示经纬度
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
    if not zcbj then
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
    end;
  finally
    reg.CloseKey;
    reg.Free;
  end;
{$endif}
end;


{procedure TMainf.ShowEkeyMsg(str: string);
begin
  //messagebox(0,pchar(str),EKey_NAME+'提示信息',mb_ok + mb_iconinformation);
end;  }



procedure TMainf.tool_SetConfineAlarmAreaExecute(Sender: TObject);
var
 i:integer;
begin
  FMap.MouseAction:=  actSetConfineAlarmArea;
  for i:=0 to ActionList1.ActionCount-1 do
  begin
    if (ActionList1.Actions[i].Category='地图工具') then
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
        //把两个点转成四个点,即把两点转一个四点的巨型
        procedure GetPoint(A:TPoint;B:TPoint;var OutA1:TPoint;var OutA2:TPoint;
                                            var OutB1:TPoint;var OutB2:TPoint; Distance:longint);
        var
          k1,k2:double;
          temp:Extended;
        begin
          //斜率等于0度时
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
          //斜率等于90度时
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
              k1:=(b.Y-a.Y)/(b.X-a.X); //直线的斜率
              k2:=-1/k1;               //垂直直线的斜率
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
    dlg.Edit_AreaName.Text   := '区域'+IntToStr(GAreaManage.MaxId);
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
          if dlg.Edit_LimitSpeet.Visible then //判断是否有超速设置
          begin
             if dlg.Edit_LimitSpeet.Text<>'' then
                 tmpArea.OverSpeet:=StrToInt(dlg.Edit_LimitSpeet.Text);
          end;
          tmpArea.ID        := StrToInt(dlg.Edit_AreaID.Text);
          tmpArea.Name      := trim(dlg.Edit_AreaName.Text);
          tmpArea.AreaColor := dlg.Edit_AreaColor.Color;
          tmpArea.AreaType  := dlg.ComboBox_AreaType.ItemIndex;// 报警的类型
          tmpArea.IsDraw    := dlg.CheckBox_IsDraw.Checked;

          tmpArea.AlarmDistance:=1000;


          tmpArea.IsEnabledTime:=dlg.CheckBoxEnabledTime.Checked;
          tmpArea.BeginTime:=dlg.BeginTime.Time-Trunc(dlg.BeginTime.Time);
          tmpArea.EndTime:=dlg.EndTime.Time-Trunc(dlg.EndTime.Time);
          tmpArea.IsShowPop:=dlg.CheckBoxShowPop.Checked;



          if(dlg.ComboBox_AreaType.ItemIndex=ALARM_WAY_OUT)or//如果是固定线路
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
          else//区域报警
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

      //------------ 显示电子围栏列表
      if (not FDlg_ConfineAreaList.Visible) {or (FDlg_ConfineAreaList.Floating)} then
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
      else    //如不在线,就显示非定位..
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
  messagebox(handle,pchar('对不起，您选中的车辆太多了，您最多只能同时选中'+
    IntToStr(DRAWSelectDevCnt)+'辆车！'),'提示',mb_ok + mb_iconinformation);
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
          if PageControlBottom.Pages[i].Caption = '电子围栏列表' then
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
          if PageControlBottom.Pages[i].Caption = '报警车辆列表' then
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
  if AddorDel then   //=---add 添加新的　越界或驶入　报警车辆
  begin
    //声音报警
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
      //扬声器 发声
      //for I:=100 to 150 Do DoBleep(I*10,10);
      //for I:=150 Downto 100 Do DoBleep(I*10,10);
    end;
    screen.Cursor := crDefault;

    if (AlarmType= ALARM_OUT)or(AlarmType= ALARM_WAY_OUT) then        //加入到越界报警列表
      FDlg_AlarmCar.AddData_OutCAreaDev(Adev,AArea)
    else if(AlarmType= ALARM_IN)or(AlarmType= ALARM_WAY_IN) then     //加入到驶入报警列表
      FDlg_AlarmCar.AddData_InCAreaDev(Adev,AArea);

    if GlobalParam.isAreaAlarmSendInfoToDriver then
    begin
        case  AlarmType of
           ALARM_OUT:str:='你已使出'+AArea.Name+'区域,请回到'+AArea.Name+'区域';
           ALARM_IN:str:='你已使入'+AArea.Name+'区域,请离开'+AArea.Name+'区域';
           ALARM_WAY_OUT:str:='你已使出'+AArea.Name+'路线,请回到'+AArea.Name+'路线';
           ALARM_WAY_IN:str:='你已使入'+AArea.Name+'路线,请离开'+AArea.Name+'路线';
        end;
        DataServer.SendControlInfo(ADev.Id,ADev.IdStr,str,Length(str),-1,false);
    end;
  end
  else      //=del 从越界到不越界，或从驶入到驶出。将列表中原有的报警信息　推入历史,并将列表中原有删掉
  begin
    if AlarmType= ALARM_OUT then
      str:= '车辆已不驶出区域'
    else if AlarmType = ALARM_IN then
      str:= '车辆已不驶入区域'
    else if AlarmType = ALARM_WAY_OUT then
      str:= '车辆已不驶出路线'
    else if AlarmType = ALARM_WAY_IN  then
      str:= '车辆已不驶入路线';
    RemoveOutorInCAData2History(ADev,AlarmType,str);
  end;
end;

procedure TMainf.RemoveOutorInCAData2History(ADev:TDevice;AlarmType:byte;const MoveCause:string);
var
  find_ListItem: TcxTreeListNode;
begin
  if (AlarmType= ALARM_OUT)or(AlarmType=ALARM_WAY_OUT) then  //从越界到不越界
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
  else if (AlarmType= ALARM_IN)or(AlarmType = ALARM_WAY_IN) then  //从驶入到驶出
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
          if PageControlBottom.Pages[i].Caption = '地名查询' then
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
      DeviceStateList.Cells[0,2]:='东经西经';
      DeviceStateList.Cells[0,3]:='南纬北纬';
     exit;
   end;

   if  Device.Switch[0] then
       DeviceStateList.Values['定位状态']:='定位'
   else
       DeviceStateList.Values['定位状态']:='非定位';

   //if SecondsBetween(now,Device.LastConnectTime)>StrToInt(Device.Param.PursueInterval)*5 then
   if not Device.isOnline then
   begin
     DeviceStateList.Values['定位状态']:='非定位';
   end;

   if  Device.Switch[1] then
   begin
       DeviceStateList.Cells[0,3]:='北纬';
       DeviceStateList.Values['北纬']:=FormatFloat('##0.000000',Device.Latitude);
   end
   else
   begin
       DeviceStateList.Cells[0,3]:='南纬';

       DeviceStateList.Values['南纬']:=FormatFloat('##0.000000',Device.Latitude);
   end;

   if  Device.Switch[2] then
   begin
       DeviceStateList.Cells[0,2]:='东经';
       DeviceStateList.Values['东经']:= FormatFloat('##0.000000',Device.Longitude);
   end
   else
   begin
       DeviceStateList.Cells[0,2]:='西经';
       DeviceStateList.Values['西经']:= FormatFloat('##0.000000',Device.Longitude);
   end;
       DeviceStateList.Values['GPS时间']:=FormatDatetime('hh:nn:ss',Device.GpsTime);

       DeviceStateList.Values['GPS日期']:=FormatDatetime('yyyy-mm-dd',Device.GpsTime);

   if  VersionFor='ZT' then
   begin
       if  Device.Switch[8] then
          DeviceStateList.Values['载货状态']:='空车'
       else
          DeviceStateList.Values['载货状态']:='载货';
       //DeviceStateList.Cells[1,5]:='空车';

       if  Device.Switch[27] then
           DeviceStateList.Values['倾倒状态']:='倾倒'
       else
           DeviceStateList.Values['倾倒状态']:='正常';
   end
   else
   begin
       if  Device.Switch[8] then
           DeviceStateList.Values['ACC状态']:='开'
       else
           DeviceStateList.Values['ACC状态']:='关';

       if  GlobalParam.isUseMasure  then
       begin
           if  Device.Switch[9] then
               DeviceStateList.Values['空车重车']:='重车'
           else
               DeviceStateList.Values['空车重车']:='空车';

           if  Device.Switch[10] then
               DeviceStateList.Values['运营状态']:='停运'
           else
               DeviceStateList.Values['运营状态']:='运营';
       end;
       
       if  Device.Switch[16] then
           DeviceStateList.Values['紧急报警']:='是'
       else
           DeviceStateList.Values['紧急报警']:='否';

       if  Device.Switch[27] then
           DeviceStateList.Values['显示屏']:='故障'
       else
           DeviceStateList.Values['显示屏']:='正常';

       if  GlobalParam.isUseMasure  then
       begin
           if  Device.Switch[28] then
               DeviceStateList.Values['计价器']:='故障'
           else
               DeviceStateList.Values['计价器']:='正常';
       end;

   end;

   if  Device.Switch[17] then
       DeviceStateList.Values['超速报警']:='是'
   else
       DeviceStateList.Values['超速报警']:='否';


       
   if  Device.Switch[18] then
       DeviceStateList.Values['断电报警']:='是'
   else
       DeviceStateList.Values['断电报警']:='否';
       

       
   if  Device.Switch[24] then
       DeviceStateList.Values['GPS模块']:='故障'
   else
       DeviceStateList.Values['GPS模块']:='正常';

   if  Device.Switch[25] then
       DeviceStateList.Values['GPS天线']:='断开'
   else
       DeviceStateList.Values['GPS天线']:='接通';

   if  Device.Switch[26] then
       DeviceStateList.Values['低压报警']:='低压'
   else
       DeviceStateList.Values['低压报警']:='正常';





 {       //以下代码不知道有什么用...
   if FDlg_Watch_Car.cxDeviceList.FocusedNode<>nil then
   begin
      DeviceStateList.Values['定位状态']:=FDlg_Watch_Car.cxDeviceList.FocusedNode.Values[8];
   end;      }

  ListDevice.Values['省'] := Device.ShengName;

  ListDevice.Values['市'] := Device.ShiName;

  ListDevice.Values['县'] := Device.XianName;

except  on E: Exception do
    uGloabVar.SystemLog.AddLog(' TMainf.ShowState函数报错: ',e.Message);
end;

end;

//设置电话本
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
    {重新选择车辆 用统一的选择车辆窗体}
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
    dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;     {重新选择车辆 用统一的选择车辆窗体}
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
  { TODO -o沙 : If not HasPrivilege(PRI_SENDMSG) then exit; }
  if not CheckDevId then
  begin
   fun_Devs_SendControlInfo_NeedAnswerExecute(Sender);
   exit;
  end;

  dlg:= TsendMsg2dev.Create(self);
  dlg.Tag:=MSGTYPE_NEEDANSWER;
  dlg.ListView1.PopupMenu := PopupMenu_SelectDevs; {重新选择车辆 用统一的选择车辆窗体}
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
    frm.ListView1.PopupMenu := PopupMenu_SelectDevs; {重新选择车辆 用统一的选择车辆窗体}
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
  dlg.ListView1.PopupMenu := PopupMenu_SelectDevs; {重新选择车辆 用统一的选择车辆窗体}
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
  dlg.ListView1.PopupMenu := PopupMenu_SelectDevs; {重新选择车辆 用统一的选择车辆窗体}
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
    {重新选择车辆 用统一的选择车辆窗体}
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
    messagebox(0, '对不起,你没有权限使用智能监控客户端，请向系统管理员查询！', '提示', mb_ok + mb_iconinformation);
    Application.Terminate;
    exit;
 end;

   //是否使用计价器
   fun_TaxiMeterStopDateTime.Visible:=GlobalParam.isUseMasure;
   fun_Devs_TaxiMeterStopDateTime.Visible:=GlobalParam.isUseMasure;
   //是否使用司机卡
   fun_ReadDriverInfo.Visible:=GlobalParam.isUseDriverCard;
   ck_DriverOnOffDuty.Visible:=GlobalParam.isUseDriverCard;




 Pr:=current_user.HasPrivilege(1100);  //系统管理
 SetEnViable(N42,Pr);
 //SetEnViable(sys_com_set,Pr);
 //SetEnViable(sys_login_again,Pr);
// SetEnViable(sys_change_pass,Pr);
// SetEnViable(sys_lock,Pr);
// SetEnViable(sys_off,Pr);
// SetEnViable(fun_refresh_all_dev,Pr);

     Pr:=current_user.HasPrivilege(1101);  //锁定
     SetEnViable(sys_lock,Pr);

     Pr:=current_user.HasPrivilege(1102);  //注销
     SetEnViable(sys_off,Pr);
     if (not Sys_Lock.Visible)and(not Sys_Off.Visible) then
     begin
       ToolButton22.Visible:=false;
     end;

     Pr:=current_user.HasPrivilege(1103);  //修改密码
     SetEnViable(sys_change_pass,Pr);

     Pr:=current_user.HasPrivilege(1104);  //刷新
     SetEnViable(fun_refresh_all_dev,Pr);
     if not fun_refresh_all_dev.Visible then
     begin
       ToolButton33.Visible:=false;
     end;

 Pr:=current_user.HasPrivilege(1200);  //地图工具
 SetEnViable(N49,Pr);
 SetEnViable(tool_zoom_in,Pr);
 SetEnViable(tool_zoom_out,Pr);
 SetEnViable(tool_move,Pr);

     Pr:=current_user.HasPrivilege(1201);  //放大
     SetEnViable(tool_zoom_in,Pr);

     Pr:=current_user.HasPrivilege(1202);  //缩小
     SetEnViable(tool_zoom_out,Pr);

     Pr:=current_user.HasPrivilege(1203);  //移动
     SetEnViable(tool_move,Pr);

     Pr:=current_user.HasPrivilege(1204);  //查看某点的信息
     SetEnViable(tool_locate,Pr);

     Pr:=current_user.HasPrivilege(1205);  //测距
     SetEnViable(tool_distance,Pr);

     Pr:=current_user.HasPrivilege(1206);  //设置电子围栏区域
     SetEnViable(tool_RectSelect,Pr);

     Pr:=current_user.HasPrivilege(1207);  //图层控制
     SetEnViable(tool_layer_control,Pr);

     Pr:=current_user.HasPrivilege(1208);  //添加工厂工地
     SetEnViable(tool_SetFactory,Pr);




 Pr:=current_user.HasPrivilege(1300);  //监控
 SetEnViable(N64,Pr);


     Pr:=current_user.HasPrivilege(1301);  //呼叫车辆
     SetEnViable(fun_callDev,Pr);
     SetEnViable(fun_Devs_CallDev,Pr);

     Pr:=current_user.HasPrivilege(1302);  //追踪车辆
     SetEnViable(fun_PursueDev,Pr);
     SetEnViable(fun_Devs_PursueDev,Pr);
     if (not fun_Devs_CallDev.Visible)and(not fun_Devs_PursueDev.Visible)then
     begin
       ToolButton31.Visible:=false;
     end;

     Pr:=current_user.HasPrivilege(1303);  //读取参数
     SetEnViable(fun_view_DevParam,Pr);


     Pr:=current_user.HasPrivilege(1304);  //设置参数
     SetEnViable(fun_Set_DevParam,Pr);
     SetEnViable(fun_Devs_SetParam,Pr);

     Pr:=current_user.HasPrivilege(1305);  //设置电话本
     SetEnViable(fun_SetDevTelList,Pr);
     SetEnViable(fun_Devs_SetDevTelList,Pr);

     Pr:=current_user.HasPrivilege(1306);  //发文本调度信息
     SetEnViable(fun_SendControlInfo,Pr);
     SetEnViable(fun_Devs_SendControlInfo,Pr);

     Pr:=current_user.HasPrivilege(1307);  //发需回复的调度信息
     SetEnViable(fun_SendControlInfo_NeedAnswer,Pr);
     SetEnViable(fun_Devs_SendControlInfo_NeedAnswer,Pr);
     if  (not fun_SendControlInfo.Visible)and(not fun_SendControlInfo_NeedAnswer.Visible) then
     begin
       ToolButton24.Visible:=false;
     end;

     Pr:=current_user.HasPrivilege(1308);  //修改显示固定菜单
     SetEnViable(fun_ModifyLCDMenu,Pr);
     SetEnViable(fun_Devs_ModifyLCDMenu,Pr);

     Pr:=current_user.HasPrivilege(1309);  //修改显示屏主界面信息
     SetEnViable(fun_ModifyDisplayName,Pr);
     SetEnViable(fun_Devs_ModifyDisplayName,Pr);


     Pr:=current_user.HasPrivilege(1310);  //升级车机固件程序
     SetEnViable(fun_UpdateDevFirmWare,Pr);
     SetEnViable(fun_Devs_UpdateFirmWare,Pr);

     Pr:=current_user.HasPrivilege(1311);  //设置计价器停机时间
     SetEnViable(fun_TaxiMeterStopDateTime,Pr);
     SetEnViable(fun_Devs_TaxiMeterStopDateTime,Pr);

     Pr:=current_user.HasPrivilege(1312);  //取消订单的菜单
     SetEnViable(fun_CancelOrderMenu,Pr);
     SetEnViable(fun_Devs_CancelOrderMenu,Pr);

     Pr:=current_user.HasPrivilege(1313);  //发送订单
     SetEnViable(fun_SendOrder,Pr);
     if VersionFor='ZB' then    //for 中北不能订单功能
     begin
       fun_SendOrder.Visible:=false;
       fun_SendOrder.Enabled:=false;
     end;
     
     Pr:=current_user.HasPrivilege(1314);  //发送断油断电
     SetEnViable(fun_SetCutOilElec,Pr);

     Pr:=current_user.HasPrivilege(1315);  //显示/隐藏车辆
     SetEnViable(fun_DevHide,Pr);
     SetEnViable(fun_Devs_Show,Pr);


     Pr:=current_user.HasPrivilege(1316);//拍照
     SetEnViable(fun_GetAPicture,Pr);


     Pr:=current_user.HasPrivilege(1317);//读取GPRS流量
     SetEnViable(fun_ReadGPRSFlux,Pr);


     Pr:=current_user.HasPrivilege(1318);//读取当前司机信息
     SetEnViable(fun_ReadDriverInfo,Pr);


     Pr:=current_user.HasPrivilege(1319);  //发送广告
     SetEnViable(fun_SendAdInfo,Pr);

     

     Pr:=current_user.HasPrivilege(1320);  //删除广告
     SetEnViable(fun_SendDelAdInfo,Pr);



     Pr:=current_user.HasPrivilege(1321);  //发送使车机报打监听电话
     SetEnViable(fun_SendListenTEL,Pr);


     Pr:=current_user.HasPrivilege(1322);  //设置刹车电平
     SetEnViable(fun_BrakeState,Pr);


     //Pr:=current_user.HasPrivilege(1323);  //建立三方通话
     //SetEnViable(fun_CallDriver,Pr);
     if not GlobalParam.IsUseTelServer then
     fun_CallDriver.Visible:=false;//GlobalParam.IsUseTelServer;





 Pr:=current_user.HasPrivilege(1400);  //信息查看
 SetEnViable(N135,Pr);

     Pr:=current_user.HasPrivilege(1401);  //查看车辆信息
     SetEnViable(ck_DevInfo,Pr);
     if not ck_DevInfo.Visible  then
     begin
       ToolButton23.Visible:=false;
     end;

     Pr:=current_user.HasPrivilege(1402);  //查看车辆信息
     SetEnViable(ck_DriverInfo,Pr);

     Pr:=current_user.HasPrivilege(1403);  //已发调度信息查询
     SetEnViable(ck_SendMsgList,Pr);

     Pr:=current_user.HasPrivilege(1404);  //已发订单查询
     SetEnViable(ck_SendOrderList,Pr);
     if VersionFor='ZB' then    //for 中北不能订单功能
     begin
       ck_SendOrderList.Visible:=false;
       ck_SendOrderList.Enabled:=false;
     end;



 Pr:=current_user.HasPrivilege(1500);  //设置
 SetEnViable(N96,Pr);

     Pr:=current_user.HasPrivilege(1501);  //车辆行使轨迹设置
     SetEnViable(set_AllCarTrack,Pr);

     Pr:=current_user.HasPrivilege(1502);  //地图图层设置
     SetEnViable(N98,Pr);

         Pr:=current_user.HasPrivilege(1503);  //加入图层
         SetEnViable(map_openLayer,Pr);

         Pr:=current_user.HasPrivilege(1504);  //删除图层
         SetEnViable(map_CloseLayer,Pr);

     Pr:=current_user.HasPrivilege(1505);  //设置报警声音
     SetEnViable(set_AlarmSound,Pr);

     Pr:=current_user.HasPrivilege(1506);  //保存本地设置
     SetEnViable(set_SaveWorkShop,Pr);

     Pr:=current_user.HasPrivilege(1507);  //系统设置
     SetEnViable(SystemConfig,Pr);

     Pr:=current_user.HasPrivilege(11);    //轨迹回放
     //Pr.Visible:=false;
     //Pr.Enabled:=false;
     ToolButton38.Visible:=false;
     SetEnViable(fun_History,Pr);


      Pr:=current_user.HasPrivilege(8193);  //系统设置
      SetEnViable(ck_TaxiMetaRunData,Pr);
      Pr:=current_user.HasPrivilege(8194);  //系统设置
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


     //Pr:=current_user.HasPrivilege(1204);  //查看某点的信息
     Pr.Visible:=false;
     Pr.Enabled:=false;
     SetEnViable(tool_locate,Pr);

     //Pr:=current_user.HasPrivilege(1204);  //查看某点的信息
     SetEnViable(tool_locate,Pr);




     //Pr:=current_user.HasPrivilege(1205);  //测距
     SetEnViable(tool_distance,Pr);

     //Pr:=current_user.HasPrivilege(1206);  //设置电子围栏区域
     SetEnViable(tool_RectSelect,Pr);

     //Pr:=current_user.HasPrivilege(1207);  //图层控制
     SetEnViable(tool_layer_control,Pr);


// Pr:=current_user.HasPrivilege(1300);  //监控
 SetEnViable(N64,Pr);


     //Pr:=current_user.HasPrivilege(1301);  //呼叫车辆
     SetEnViable(fun_callDev,Pr);
     SetEnViable(fun_Devs_CallDev,Pr);

     //Pr:=current_user.HasPrivilege(1302);  //追踪车辆
     SetEnViable(fun_PursueDev,Pr);
     SetEnViable(fun_Devs_PursueDev,Pr);
     if (not fun_Devs_CallDev.Visible)and(not fun_Devs_PursueDev.Visible)then
     begin
       ToolButton31.Visible:=false;
     end;

     //Pr:=current_user.HasPrivilege(1303);  //读取参数
     SetEnViable(fun_view_DevParam,Pr);


     //Pr:=current_user.HasPrivilege(1304);  //设置参数
     SetEnViable(fun_Set_DevParam,Pr);
     SetEnViable(fun_Devs_SetParam,Pr);

     //Pr:=current_user.HasPrivilege(1305);  //设置电话本
     SetEnViable(fun_SetDevTelList,Pr);
     SetEnViable(fun_Devs_SetDevTelList,Pr);

     //Pr:=current_user.HasPrivilege(1306);  //发文本调度信息
     SetEnViable(fun_SendControlInfo,Pr);
     SetEnViable(fun_Devs_SendControlInfo,Pr);

     //Pr:=current_user.HasPrivilege(1307);  //发需回复的调度信息
     SetEnViable(fun_SendControlInfo_NeedAnswer,Pr);
     SetEnViable(fun_Devs_SendControlInfo_NeedAnswer,Pr);
     if  (not fun_SendControlInfo.Visible)and(not fun_SendControlInfo_NeedAnswer.Visible) then
     begin
       ToolButton24.Visible:=false;
     end;

     //Pr:=current_user.HasPrivilege(1308);  //修改显示固定菜单
     SetEnViable(fun_ModifyLCDMenu,Pr);
     SetEnViable(fun_Devs_ModifyLCDMenu,Pr);

     //Pr:=current_user.HasPrivilege(1309);  //修改显示屏主界面信息
     SetEnViable(fun_ModifyDisplayName,Pr);
     SetEnViable(fun_Devs_ModifyDisplayName,Pr);


     //Pr:=current_user.HasPrivilege(1310);  //升级车机固件程序
     SetEnViable(fun_UpdateDevFirmWare,Pr);
     SetEnViable(fun_Devs_UpdateFirmWare,Pr);

     //Pr:=current_user.HasPrivilege(1311);  //设置计价器停机时间
     SetEnViable(fun_TaxiMeterStopDateTime,Pr);
     SetEnViable(fun_Devs_TaxiMeterStopDateTime,Pr);

     //Pr:=current_user.HasPrivilege(1312);  //取消订单的菜单
     SetEnViable(fun_CancelOrderMenu,Pr);
     SetEnViable(fun_Devs_CancelOrderMenu,Pr);

     //Pr:=current_user.HasPrivilege(1313);  //发送订单
     SetEnViable(fun_SendOrder,Pr);

     
     //Pr:=current_user.HasPrivilege(1314);  //发送断油断电
     SetEnViable(fun_SetCutOilElec,Pr);

     //Pr:=current_user.HasPrivilege(1315);  //显示/隐藏车辆
     SetEnViable(fun_DevHide,Pr);
     SetEnViable(fun_Devs_Show,Pr);


     //Pr:=current_user.HasPrivilege(1316);//拍照
     SetEnViable(fun_GetAPicture,Pr);


     //Pr:=current_user.HasPrivilege(1317);//读取GPRS流量
     SetEnViable(fun_ReadGPRSFlux,Pr);


     //Pr:=current_user.HasPrivilege(1318);//读取当前司机信息
     SetEnViable(fun_ReadDriverInfo,Pr);





 //Pr:=current_user.HasPrivilege(1400);  //信息查看
 SetEnViable(N135,Pr);

     //Pr:=current_user.HasPrivilege(1401);  //查看车辆信息
     SetEnViable(ck_DevInfo,Pr);
     if not ck_DevInfo.Visible  then
     begin
       ToolButton23.Visible:=false;
     end;

     //Pr:=current_user.HasPrivilege(1402);  //查看车辆信息
     SetEnViable(ck_DriverInfo,Pr);

     //Pr:=current_user.HasPrivilege(1403);  //已发调度信息查询
     SetEnViable(ck_SendMsgList,Pr);

     //Pr:=current_user.HasPrivilege(1404);  //已发订单查询
     SetEnViable(ck_SendOrderList,Pr);




 //Pr:=current_user.HasPrivilege(1500);  //设置
 SetEnViable(N96,Pr);

     //Pr:=current_user.HasPrivilege(1501);  //车辆行使轨迹设置
     SetEnViable(set_AllCarTrack,Pr);

     //Pr:=current_user.HasPrivilege(1502);  //地图图层设置
     SetEnViable(N98,Pr);

         //Pr:=current_user.HasPrivilege(1503);  //加入图层
         SetEnViable(map_openLayer,Pr);

         //Pr:=current_user.HasPrivilege(1504);  //删除图层
         SetEnViable(map_CloseLayer,Pr);

     //Pr:=current_user.HasPrivilege(1505);  //设置报警声音
     SetEnViable(set_AlarmSound,Pr);

     //Pr:=current_user.HasPrivilege(1506);  //保存本地设置
     SetEnViable(set_SaveWorkShop,Pr);

     //Pr:=current_user.HasPrivilege(1507);  //系统设置
     SetEnViable(SystemConfig,Pr);

     //Pr:=current_user.HasPrivilege(11);    //轨迹回放
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
    {重新选择车辆 用统一的选择车辆窗体}
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
    {重新选择车辆 用统一的选择车辆窗体}
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
      PopMsg('提示','已选中的车辆没有车!'+#13+#10+'请在"地图工具->矩形选择车辆"工具选择车!');
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
   SelectDevFromListSelectDev(9,false);//第九位,false为空车;
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
    SelectDevFromListSelectDev(9,true);//第九位,true为重车;
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
    if not Dev.isOnline  then//  >是不在线
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
    Sel_Dev_Online.Execute;//删除不定位.然后再选定位的.因为,定位的必须在线....
    SelectDevFromListSelectDev(0,true);//第0位,true定位;
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
   if Dev.isOnline  then//  <是在线
        ListSelectDev.Items[i].Delete
   else
     inc(i);
  end;
  ListSelectDev.EndUpdate;
end;


procedure TMainf.Sel_Dev_Not_PostionExecute(Sender: TObject);
begin
    SelectDevFromListSelectDev(0,false);//第0位,false非定位;
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
                     MSNPopUp2.Title:='车辆上线  ';
                     MSNPopUp2.Text:=ADeviceManage.Items[i].Car.No+#13+#10+'上线';
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
                     MSNPopUp2.Title:='车辆掉线     ';
                     MSNPopUp2.Text:=ADeviceManage.Items[i].Car.No+#13+#10+'掉线  ';
                     MSNPopUp2.ShowPopUp;
                     if FileExists(GlobalParam.AlarmSound_CarUnOnline) then
                        PlaySound(Pchar(GlobalParam.AlarmSound_CarUnOnline),Hinstance,SND_FILENAME);
                 end;
         end;
      end;
    end;

    ValueListEditorOnline.Values['总车']:=IntToStr(ADeviceManage.Count);
    ValueListEditorOnline.Values['在线']:=IntToStr(onlineCount);
    ValueListEditorOnline.Values['不在线']:=IntToStr(ADeviceManage.Count-onlineCount);
    ValueListEditorOnline.Values['在线率']:=IntToStr(Trunc(onlineCount/ADeviceManage.Count*100+0.5))+'%';


    if GlobalParam.isAllCarUnOnlineAlarm then
        if onlineCount=0 then
        begin
             if FileExists(GlobalParam.AlarmSound_CarUnOnline) then
                try
                    PlaySound(Pchar(GlobalParam.AlarmSound_CarUnOnline),Hinstance,SND_FILENAME)
                except
                    begin
                      //扬声器 发声
                     // for I:=10 to 15 Do DoBleep(I*10,10);
                      //for I:=15 Downto 10 Do DoBleep(I*10,10);
                    end;
                end
             else
             begin
                //扬声器 发声
                //for I:=10 to 15 Do DoBleep(I*10,10);
                //for I:=15 Downto 10 Do DoBleep(I*10,10);
             end;
        end;


except on E: Exception do
    uGloabVar.SystemLog.AddLog(' TMainf.isOnline函数报错: ',e.Message);
end;






end;

procedure TMainf.OnCarActionClick(Dev: TDevice);
var
  Str:string;
  Group:TDevGroup;
begin
try
  Str:='车牌号　　　:'+Dev.Car.No;
  Str:=str+#13+#10+'设备名称　　:'+Dev.DispLabel;
  if Dev.DriverNameTel<>'' then
  Str:=str+#13+#10+'司机姓名        :'+Dev.DriverNameTel;
  //Str:=str+#13+#10+'司机　　:'+Dev.DriverTel;
  Group:=ADevGroupManage.Find(Dev.GroupID);
if Group<>nil then
  Str:=str+#13+#10+'分组　　　　:'+Group.name ;
  Str:=str+#13+#10+'ＳＩＭ卡号　:'+Dev.SimNo;
  Str:=Str+#13+#10+#13+#10;
//------------------------------------------------------------------------------
  if Dev.ShengName <>'' then
  begin
    Str:=Str+'地点　　　　:'+Dev.ShengName;
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

  if Dev.isOnline then                   //判断状态
  begin
    Str:=Str+'状态　　　　:在线';
    if Dev.Switch[STAT_GPS_LOCATE] then
    begin
      Str:=str+#13+#10+'ＧＰＳ状态　:定位';
    end
    else
    begin
      Str:=str+#13+#10+'ＧＰＳ状态　:非定位';
    end;
  end
  else
  begin
      Str:=Str+'状态　　　　:不在线'+#13+#10+'ＧＰＳ状态　:非定位';
  end;     
//------------------------------------------------------------------------------
  Str:=str+#13+#10+'速度　　　　:'+intToStr(Dev.Speed);
  if  Dev.GpsTime<>0 then
  begin
     Str:=str+#13+#10+'ＧＰＳ时间　:'+FormatDatetime('yyyy-mm-dd hh:nn:ss',Dev.GpsTime);
  end
  else
  begin
     Str:=str+#13+#10+'ＧＰＳ时间　:'
  end;


  if (ListSelectDev.Count>0) then
  begin
      MapLabel.PopupMenu:=PopupMenuSelected;
      PageControl1.ActivePageIndex:=1;
      Str:=Str+#13+#10+'提示　　　　:'+'右击可对选中车辆群发命令';
  end
  else
  begin
    MapLabel.PopupMenu:=PopupMenu_funDev;
    PageControl1.ActivePageIndex:=0;
    Str:=Str+#13+#10+'提示　　　　:'+'右击可对此车发送命令';
  end;


  MapLabel.Hint:=Str;

  if GCurSelectDev =Dev then exit;
  GCurSelectDev :=Dev;
  Edit2.Text := IntToStr(GCurSelectDev.Id);
  Edit1.Text := GCurSelectDev.Car.No;
  ComboboxCarNO.Text:=Edit1.Text;

except on E: Exception do
    uGloabVar.SystemLog.AddLog(' TMainf.OnCarActionClick函数报错: ',e.Message);
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

          FMap.Hint:='提示:'+#13+#10+'　　选中'+intToStr(ListSelectDev.Count)+'辆车'+#13+#10;
          FMap.Hint:=FMap.Hint+'　　右击可对选中车辆群发命令';
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
    uGloabVar.SystemLog.AddLog(' TMainf.Timer1Timer函数报错: ',e.Message);
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

            FMap.Hint:='提示:'+#13+#10+'　　选中'+intToStr(ListSelectDev.Count)+'辆车'+#13+#10;
            FMap.Hint:=FMap.Hint+'　　右击可对选中车辆群发命令';
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
    uGloabVar.SystemLog.AddLog(' TMainf.OnMapLabelMouseMove函数报错: ',e.Message);
end;
end;

procedure TMainf.GetMapRectSelect_Rect(PointA, PointB: TEarthPoint);
begin
  if (PointA.x<PointB.x) then
  begin
     EarthRect.SX :=PointA.x;    //SX为开始X点(Strat) ,EX为结束X点(end).
     EarthRect.EX :=PointB.x;
  end
  else
  begin
     EarthRect.SX :=PointB.x;
     EarthRect.EX :=PointA.X;
  end;

  if (PointA.y <PointB.y) then
  begin
     EarthRect.SY :=PointA.y;   //SY为开始Y点(Strat) ,EY为Y结束点(End)
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
    PopMsg('提示','系统错误!')
  end;
end;

procedure TMainf.InitCallClient;
begin
    FCallClient.ServerAddress:=GlobalParam.TelServer.Host;
    FCallClient.ServerPort:=IntToStr(GlobalParam.TelServer.Port);
    FCallClient.ClientType := 0;    //表示是调度客户端
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
      StatusBar1.Panels[2].Text:='连接电话服务器成功。';
      StatusBar1.Panels[6].ImageIndex:=3;
      fun_SwitchToMe.Visible:=true;
      fun_TermToTouShu.Visible:=true;
      fun_CallDriver.Visible:=true;
      fun_CallDriver.Enabled:=true;
    end;
    EVENT_CLIENT_INVALID_CHANNNEL:
    begin
      StatusBar1.Panels[2].Text:='通道号不存在,连接电话服务器失败';
      PopMsg('提示','通道号不存在,连接电话服务器失败');
    end;
    EVENT_CLIENT_CHANNEL_INUSE:
    begin
      StatusBar1.Panels[2].Text:='通道号已被注册,连接电话服务器失败';
      PopMsg('提示','通道号已被注册,连接电话服务器失败');

    end;
    EVENT_SOCKET_ERROR:
    begin
      if not GlobalParam.IsUseTelServer  then
      begin
        exit;
      end;
      StatusBar1.Panels[2].Text:='连接电话服务器失败';
      PopMsg('提示','连接电话服务器失败');
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
      StatusBar1.Panels[2].Text:='服务器不允许你改变状态,改变状态失败.';
      PopMsg('提示','服务器不允许你改变状态,改变状态失败.');
      if AParam= CLIENT_STATE_PAUSE then FCallClient.PauseWork;
    end;
  end;       
end;

procedure TMainf.TimerCallTimer(Sender: TObject);
begin
  TimerCall.Enabled:=false;
  if not GlobalParam.IsUseTelServer then exit;
  try
    StatusBar1.Panels[2].Text:='连接电话服务器中...';
    FCallClient.ServerAddress:=GlobalParam.TelServer.Host;
    FCallClient.ServerPort:=IntToStr(GlobalParam.TelServer.Port);
    FCallClient.StartWork;
  except on E: Exception do
    PopMsg('提示',E.Message);
  end;        
end;

procedure TMainf.FClientUserChannelEvent(Sender: TObject;
  EventCode: Integer);
begin
  case EventCode of
    USER_EVENT_TALKWITH: //'用户接通外线电话';
      begin
       TelIsConnect:=true;
       TelIsRing:=false;
       StatusBar1.Panels[2].Text:='你已接通外线电话!';
      end;
    USER_EVENT_PICKUP:// '用户摘机,非服务器预期的';
      begin
         if GlobalParam.IsFTelNotClose then popMsg('提示','现在没有电话进来'+#13+#10+'请挂电话...');
         StatusBar1.Panels[2].Text:='现在没有电话进来,请挂电话...';
         //FCallClient.SwitchToMe;
      end;
    USER_EVENT_RING:// '用户通道的电话开始响铃';
      begin
        TelIsRing:=true;
        if GetFocusSendOrderFrm =nil then
        begin
          if GlobalParam.IsTelCall then PopMsg('提示','来电话了...');
        end;
         StatusBar1.Panels[2].Text:='来电话了...';
      end;
    USER_EVENT_WAIT_EXT_HANGUP://'等待接通的外线已挂断';
      begin
        TelIsRing:=false;
        StatusBar1.Panels[2].Text:='客户挂断电话了!';
      end;
    USER_EVENT_TALK_HANGUP: //'正在通话中,用户首先挂机';
      begin
        TelIsConnect:=false;
        if GlobalParam.IsFirstCutTel then  PopMsg('提示','请不要先挂断客户电话!');
        StatusBar1.Panels[2].Text:='请不要先挂断客户电话!';
      end;
    USER_EVENT_TALK_EXTHANGUP: //'正在通话中,外线首先挂机';
      begin
        TelIsConnect:=false;
        StatusBar1.Panels[2].Text:='客户电话已挂,请挂电话...';
      end;
    USER_EVENT_TALK_FINISH_HANGUP:// '通话结束,外线挂机后,内线挂机';
      begin
        TelIsConnect:=false;
        StatusBar1.Panels[2].Text:='电话已挂好!';
      end;
    USER_EVENT_WAIT_TIMEOUT: //'用户超进未接听电话,电话已被重新排队';
      begin
        TelIsRing:=false;
      end;
    USER_EVENT_HANGUP: //'用户挂机,非服务器预期的';
      begin
        TelIsConnect:=false;
        StatusBar1.Panels[2].Text:='电话已挂好!';
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
    MessageBox(Self.Handle,pchar('现在电话在响铃中'+#13+#10+'请不要锁定、注销和关闭'),'提示',mb_ok + mb_iconinformation);
    Result:=false;
  end;
  if TelIsConnect then
  begin
    MessageBox(Self.Handle,pchar('现在电话在通话中'+#13+#10+'请不要锁定、注销和关闭'),'提示',mb_ok + mb_iconinformation);
    Result:=false;
  end;
  
  if FCallClient.Work then
  begin
    if Result and((TelCount.Idle+TelCount.Busy)<=1) then
    begin
      MessageBox(Self.Handle,pchar('现在只有此电话可用'+#13+#10+'请不要锁定、注销和关闭'),'提示',mb_ok + mb_iconinformation);
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
       if messagebox(handle,'上述参数设置成功!是否要注销？','提示',MB_YESNO + MB_ICONQUESTION)= ID_YES then
       sys_off.Execute;
    end; 
  finally
    frm.Free;
  end;
end;

//枪接,把电话转到自已电话上.
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

//转投诉电话
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
   messagebox(0,'请先《在监控车辆列表选中》或《在右上角输入》车辆!','提示',mb_ok + mb_iconinformation);
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
    dlg.Caption:='读测试数据';
    dlg.Panel8.Caption:='读测试数据';
    dlg.Panel4.Caption:='读测试数据';
    dlg.BitBtn1.Caption:='发送';
    {重新选择车辆 用统一的选择车辆窗体}
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
        messagebox(handle,pchar('命令不能执行，没有指定车辆'),'提示',mb_ok + mb_iconinformation);
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
   messagebox(0,'请先《在监控车辆列表选中》或《在右上角输入》车辆!','提示',mb_ok + mb_iconinformation);
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
    s:=InputBox('输入','请输入一个地区的名字:','');
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
  if messagebox(handle,PChar('您确定要删除'+TreeNode.Text),'提示',MB_OKCANCEL + MB_ICONQUESTION)= ID_CANCEL then  exit;
  if TreeNode.Data<>nil then
  begin
      MapNode:=TMapNode(TreeNode.Data);
      if MapNode=MapManger.CurrentNode then
      begin
        MessageBox(Self.Handle,'不能删除当前地图结点!','提示',MB_ICONINFORMATION);
        exit;
      end;

      if MapNode.ChildNodeCount<=0 then
      begin
        MapNode.ParentNode.DelChildNode(MapNode);
        TreeNode.Delete;
      end
      else
      begin
        MessageBox(Self.Handle,'只能删除子结点!','提示',MB_ICONINFORMATION);
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
      FDlg_Map.StatusBar1.Panels.Items[0].Text:='默认显示地图:'+MapManger.DefaultNode.Name;
      Map_Save.Execute;
    end
    else
    begin
      MessageBox(Self.Handle,'请选择一个地区的名字!','提示',MB_ICONINFORMATION);
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
  FDlg_Map.StatusBar1.Panels.Items[0].Text:='默认显示地图:'+MapManger.DefaultNode.Name;
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
            MessageBox(Self.Handle,PChar('关闭轨迹回放窗口,才可以切换地图'),PChar('提示'),MB_ICONQUESTION);
            exit;
          end;
          HisForm.Free;
          HisForm:=nil;
        end;  }

        if (MapNode=MapManger.CurrentNode)and(ifCurNode) then exit;
        dlg := TFrmRefreshProgress.Create(Self);
        //dlg.Show;
        dlg.Caption:='载出地图';
        dlg.Label1.Caption:='正在载出地图,请稍等....';
        try
          i:=0;
          OutBox:=FMap.DrawCood.WorldRect;
          count:=FMap.Layers.Count;
          //载出地图
          
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
          dlg.Caption:='载入地图';
          dlg.Label1.Caption:='正在载入地图,请稍等....';
          dlg.Gauge1.Progress:=0;
          if ifAutoScale then
             OpenWSAutoScale(MapNode,dlg.Gauge1,OutBox)
          else
             OpenWS(MapNode,dlg.Gauge1);

          FMap.Layers.SetOrder(ADeviceManage.ShengLayer,FMap.Layers.Count-1);
          FMap.Layers.SetOrder(ADeviceManage.ShiLayer,FMap.Layers.Count-2);
          FMap.Layers.SetOrder(ADeviceManage.XianLayer,FMap.Layers.Count-3);
          FMap.Layers.SetOrder(ADeviceManage.Road,FMap.Layers.Count-4);

          FMap.Layers.SetOrder(drawlayer,0);//dxf 移GPS图层到第0层。
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
  FDlg_Map.StatusBar1.Panels.Items[0].Text:='默认显示地图:'+MapManger.DefaultNode.Name;
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
  s:=InputBox('判断车机下线的时间(秒)','判断车机下线的时间(秒)',IntToStr(GlobalParam.DownTime));
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
        //载入数据
        dlg := TFrmRefreshProgress.Create(Self);
        try
        dlg.Label1.Caption:='载入GPS定位数据...';
        dlg.Show;
        SetActivePage(PageControlBottom,'轨迹回放');
        dev:= GCurSelectDev;
        PlayDev.Id:=dev.Id;
        PlayDev.IdStr:=dev.IdStr;
        PlayDev.GroupID:=dev.GroupID;
        PlayDev.DispLabel:=dev.DispLabel;
        PlayDev.SimNo:=dev.SimNo;
        PlayDev.DriverNameTeL:=dev.DriverNameTeL;

        //让轨迹回放可以实现区域报警
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
        FDlg_HisForm.load_PlayInfo(startDateTime,endDateTime,'服务器数据');
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
    MessageBox(handle,'对不起，没有找到升级程序Update.exe，无法升级！','提示',MB_OK + MB_ICONINFORMATION);
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
      UserDefinedTextForm.BitBtnOK.Caption:='修改';
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
      UserDefinedTextForm.Font.Name:='宋体';
      UserDefinedTextForm.Font.Size:=10;
      UserDefinedTextForm.Font.Color:=0;
      UserDefinedTextForm.EditFont.Text:='宋体,10';
      UserDefinedTextForm.BitBtnOK.Caption:='添加';
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
  StatusBar1.Panels[2].Text:='当前空车率:'+FormatFloat('0.00',f)+'%';
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
    {重新选择车辆 用统一的选择车辆窗体}
    dlg.Caption:='读取司机信息';
    dlg.Panel8.Caption:='读取司机信息';
    dlg.Panel4.Caption:='读取以下车辆';
    dlg.BitBtn1.Caption:='读取';
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
    if dlg.ModalResult = mrok then //处理　读取车辆
    begin
      n:= dlg.ListView1.Items.Count;
      if n=0 then
      begin
        messagebox(handle,pchar('命令不能执行，没有指定车辆'),'提示',mb_ok + mb_iconinformation);
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
      s:=InputBox('输入','请输入一个新地区的名字:',MapNode.Name);
      if s='' then exit;
      MapManger.ChangeNodeName(s,MapNode);
      MapManger.ShowToTreeView(FDlg_Map.TreeViewMap,FDlg_Map.CheckBoxIsShowFile.Checked);
      FDlg_Map.StatusBar1.Panels.Items[0].Text:='默认显示地图:'+MapManger.DefaultNode.Name;
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
    {重新选择车辆 用统一的选择车辆窗体}
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
    if dlg.ModalResult = mrok then //处理　读取车辆
    begin
      n:= dlg.ListView1.Items.Count;
      if n=0 then
      begin
        messagebox(handle,pchar('命令不能执行，没有指定车辆'),'提示',mb_ok + mb_iconinformation);
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
    if (ActionList1.Actions[i].Category='地图工具') then
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
      //------------ 显示电子围栏列表     }            {or (FDlg_ConfineAreaList.Floating)}
      {if (not FDlg_ConfineAreaList.Visible)  then
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
          if PageControlBottom.Pages[i].Caption = '照片' then
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
  if PageControlBottom.ActivePage.Caption ='车辆列表' then
  begin
    FDlg_Watch_Car.Refresh_WatchCar;
  end
  else if PageControlBottom.ActivePage.Caption ='发送命令列表' then
  begin
    FDlg_Sended_Cmd.Refresh_SendedCmd;
  end
  else if PageControlBottom.ActivePage.Caption ='报警车辆列表' then
  begin
    FDlg_AlarmCar.Refresh_AlarmCar;
  end
  else if PageControlBottom.ActivePage.Caption ='电子围栏列表' then
  begin
    FDlg_ConfineAreaList.ListCurrConfine_Devs;
  end
  else if PageControlBottom.ActivePage.Caption  ='发送订单列表'  then
  begin
    FDlg_OrderList.RefreshOrderList;
  end;
end;

procedure TMainf.fun_ReadGPRSFluxExecute(Sender: TObject);
begin
    if not CheckDevId then
    begin
     messagebox(0,'请先《在监控车辆列表选中》或《在右上角输入》车辆!','提示',mb_ok + mb_iconinformation);
     exit;
    end;
    DataServer.ReadDeviceGPRSFlux(GCurSelectDev);
end;

procedure TMainf.TimerUpdateTimer(Sender: TObject);
var
  CoerceUpdate:boolean;
begin
  //FFLashDlg.SetLabel('检查更新...');
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
         else  if MessageBox(0, '发现有新版，要更新吗？', '信息提示', MB_YESNO + MB_ICONQUESTION) = ID_YES then
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

      //切换地图
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
    frm.ListView1.PopupMenu := PopupMenu_SelectDevs; {重新选择车辆 用统一的选择车辆窗体}
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

    messagebox(0,'请先《在监控车辆列表选中》或《在右上角输入》车辆!','提示',mb_ok + mb_iconinformation);
    exit;
  end;

  ModifyLcdCoNameFrm:= TModifyLcdCoNameFrm.Create(Self);
  try
    ModifyLcdCoNameFrm.Caption:='发送使'+GCurSelectDev.Car.No+'拨打监听电话';
    ModifyLcdCoNameFrm.Panel1.Caption:='发送使'+GCurSelectDev.Car.No+'拨打监听电话';
    ModifyLcdCoNameFrm.Label1.Caption:='监听电话号码';
    ModifyLcdCoNameFrm.Label1.Visible:=true;
    ModifyLcdCoNameFrm.Label2.Caption:='  (电话号码长度小于20位)';     
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
          if PageControlBottom.Pages[i].Caption = '轨迹回放' then
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
    {重新选择车辆 用统一的选择车辆窗体}
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
    if BrakeStateForm.ModalResult = mrok then //处理　呼叫车辆
    begin
      n:= BrakeStateForm.ListView1.Items.Count;
      if n=0 then
      begin
        messagebox(handle,pchar('命令不能执行，没有指定车辆'),'提示',mb_ok + mb_iconinformation);
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
   messagebox(0,'请先《在监控车辆列表选中》或《在右上角输入》车辆!','提示',mb_ok + mb_iconinformation);
   exit;
end;
  tel:=GCurSelectDev.SimNo;
if tel='' then
begin
   messagebox(0,'些车没有设置手机卡号','提示',mb_ok + mb_iconinformation);
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
    if (ActionList1.Actions[i].Category='地图工具') then
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
//用户自定义工厂工地






    





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
          if PageControlBottom.Pages[i].Caption = '计价器营运数据' then
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
    if (ActionList1.Actions[i].Category='地图工具') then
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

