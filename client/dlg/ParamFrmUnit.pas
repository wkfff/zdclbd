unit ParamFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, CarUnit, ConstDefineUnit,
  cxControls, cxContainer, cxEdit, cxGroupBox, cxCheckGroup, cxCheckListBox,
  cxCheckBox, RzButton, RzRadChk,DateUtils, Types;

type
  TParamFrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtnSet: TBitBtn;
    BitBtn2: TBitBtn;
    Timer1: TTimer;
    ProgressBar1: TProgressBar;
    EditCar: TEdit;
    Label2: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    CheckBox36: TCheckBox;
    CheckBox39: TCheckBox;
    CheckBox37: TCheckBox;
    CheckBox40: TCheckBox;
    CheckBox41: TCheckBox;
    CheckBox42: TCheckBox;
    CheckBox47: TCheckBox;
    CheckBox58: TCheckBox;
    TabSheet5: TTabSheet;
    Label1: TLabel;
    CheckBox17: TCheckBox;
    CheckBox18: TCheckBox;
    CheckBox19: TCheckBox;
    CheckBox20: TCheckBox;
    CheckBox21: TCheckBox;
    CheckBox22: TCheckBox;
    CheckBox23: TCheckBox;
    CheckBox24: TCheckBox;
    CheckBox25: TCheckBox;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    Edit25: TEdit;
    Edit17: TComboBox;
    Edit18: TComboBox;
    Edit19: TComboBox;
    Edit252: TEdit;
    CheckBox38: TCheckBox;
    CheckBox48: TCheckBox;
    CheckBox49: TCheckBox;
    CheckBox54: TCheckBox;
    CheckBox57: TCheckBox;
    CheckBox55: TCheckBox;
    GroupBox8: TGroupBox;
    CheckBox27: TCheckBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Edit371: TEdit;
    Edit372: TEdit;
    Edit373: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Edit381: TComboBox;
    Label16: TLabel;
    Label17: TLabel;
    Edit382: TEdit;
    Label18: TLabel;
    Edit39: TComboBox;
    edit40: TComboBox;
    Label19: TLabel;
    Label20: TLabel;
    Edit411: TEdit;
    Label21: TLabel;
    Edit412: TEdit;
    Label22: TLabel;
    Edit421: TEdit;
    Edit422: TEdit;
    TabSheet6: TTabSheet;
    CheckBox43: TCheckBox;
    Label27: TLabel;
    Edit431: TComboBox;
    Edit432: TEdit;
    Label28: TLabel;
    CheckBox44: TCheckBox;
    CheckBox45: TCheckBox;
    CheckBox46: TCheckBox;
    Label29: TLabel;
    Edit441: TComboBox;
    Edit442: TEdit;
    Label30: TLabel;
    Label31: TLabel;
    Edit451: TEdit;
    Label32: TLabel;
    Edit452: TEdit;
    Label33: TLabel;
    Label34: TLabel;
    Edit461: TEdit;
    Label35: TLabel;
    Edit462: TEdit;
    Label36: TLabel;
    Edit47: TEdit;
    Label37: TLabel;
    Label38: TLabel;
    edit481: TComboBox;
    Label39: TLabel;
    Label40: TLabel;
    Edit482: TEdit;
    Label41: TLabel;
    Label42: TLabel;
    Edit49: TEdit;
    Label43: TLabel;
    edit541: TComboBox;
    Label44: TLabel;
    Label45: TLabel;
    Edit542: TEdit;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Edit57: TComboBox;
    Edit581: TEdit;
    Label49: TLabel;
    Edit582: TEdit;
    Edit36: TEdit;
    CheckBox16: TCheckBox;
    Edit16: TEdit;
    Edit55: TEdit;
    GroupBox3: TGroupBox;
    cxCheckBoxPljsPIc1: TcxCheckBox;
    cxCheckBoxPljsPIc2: TcxCheckBox;
    cxCheckBoxPljsPIc3: TcxCheckBox;
    cxCheckBoxPljsPIc4: TcxCheckBox;
    GroupBox4: TGroupBox;
    cxCheckBoxOverSpeedPic1: TcxCheckBox;
    cxCheckBoxOverSpeedPic2: TcxCheckBox;
    cxCheckBoxOverSpeedPic3: TcxCheckBox;
    cxCheckBoxOverSpeedPic4: TcxCheckBox;
    GroupBox5: TGroupBox;
    cxCheckBoxAlarmPic1: TcxCheckBox;
    cxCheckBoxAlarmPic2: TcxCheckBox;
    cxCheckBoxAlarmPic3: TcxCheckBox;
    cxCheckBoxAlarmPic4: TcxCheckBox;
    Label58: TLabel;
    Label61: TLabel;
    RzCheckBoxSelectPageCommunication: TRzCheckBox;
    RzCheckBoxSelectPagePic: TRzCheckBox;
    RzCheckBoxSelectPageCall: TRzCheckBox;
    RzCheckBoxSelectPageControl: TRzCheckBox;
    RzCheckBoxSelectPageNotice: TRzCheckBox;
    RzCheckBoxSelectAll: TRzCheckBox;
    CheckBox66: TCheckBox;
    Edit66: TEdit;
    CheckBox67: TCheckBox;
    Edit67: TEdit;
    CheckBox68: TCheckBox;
    Edit68: TEdit;
    CheckBox423: TCheckBox;
    Edit423: TEdit;
    CheckBox424: TCheckBox;
    Edit424: TEdit;
    CheckBox421: TCheckBox;
    CheckBox422: TCheckBox;
    CheckBox69: TCheckBox;
    Edit69: TEdit;
    CheckBox70: TCheckBox;
    CheckBox71: TCheckBox;
    CheckBox72: TCheckBox;
    CheckBox73: TCheckBox;
    Edit70: TEdit;
    Edit71: TEdit;
    Edit72: TEdit;
    Edit73: TEdit;
    GroupBox7: TGroupBox;
    CheckBox74: TCheckBox;
    CheckBox75: TCheckBox;
    CheckBox76: TCheckBox;
    Edit74: TEdit;
    Edit76: TEdit;
    Edit75: TEdit;
    TabSheet7: TTabSheet;
    PageControl2: TPageControl;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    TabSheet10: TTabSheet;
    TabSheet11: TTabSheet;
    TabSheet12: TTabSheet;
    cxCheckListBox56: TcxCheckListBox;
    cxCheckListBox1: TcxCheckListBox;
    cxCheckListBox2: TcxCheckListBox;
    cxCheckListBox3: TcxCheckListBox;
    cxCheckListBox4: TcxCheckListBox;
    BitBtnSelectDevFunction: TBitBtn;
    CheckBox56: TCheckBox;
    BitBtn3: TBitBtn;
    CheckBox77: TCheckBox;
    BitBtn5: TBitBtn;
    CheckBox78: TCheckBox;
    BitBtn6: TBitBtn;
    CheckBox79: TCheckBox;
    BitBtn7: TBitBtn;
    CheckBox80: TCheckBox;
    Label63: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    Date27: TDateTimePicker;
    Time27: TDateTimePicker;
    GroupBox1: TGroupBox;
    CheckBox100: TCheckBox;
    CheckBox28: TCheckBox;
    Edit100: TComboBox;
    Edit28: TEdit;
    Label66: TLabel;
    GroupBox2: TGroupBox;
    CheckBox29: TCheckBox;
    CheckBox30: TCheckBox;
    Edit29: TEdit;
    Edit30: TEdit;
    CheckBox31: TCheckBox;
    Edit31: TEdit;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    RzCheckBoxSelectPageElse: TRzCheckBox;
    Label70: TLabel;
    CheckBox32: TCheckBox;
    Edit32: TComboBox;
    CheckBox99: TCheckBox;
    Edit99: TEdit;
    CheckBox50: TCheckBox;
    Edit50: TEdit;
    CheckBox51: TCheckBox;
    Edit51: TEdit;
    CheckBox52: TCheckBox;
    Edit52: TEdit;
    CheckBox53: TCheckBox;
    Edit53: TEdit;
    CheckBox26: TCheckBox;
    Edit26: TEdit;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    EditYear: TEdit;
    EditMonth: TEdit;
    EditDay: TEdit;
    EditHour: TEdit;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label60: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label59: TLabel;
    Label62: TLabel;
    CheckBox35: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit82: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    CheckBox34: TCheckBox;
    Edit351: TEdit;
    Edit34: TEdit;
    Edit352: TEdit;
    Edit353: TEdit;
    Edit354: TEdit;
    Edit355: TEdit;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    Edit59: TEdit;
    Edit60: TEdit;
    Edit356: TEdit;
    Edit357: TEdit;
    Edit358: TEdit;
    Edit14: TComboBox;
    Edit15: TComboBox;
    CheckBox59: TCheckBox;
    CheckBox60: TCheckBox;
    CheckBox61: TCheckBox;
    Edit61: TEdit;
    CheckBox62: TCheckBox;
    Edit62: TEdit;
    CheckBox63: TCheckBox;
    Edit63: TEdit;
    CheckBox64: TCheckBox;
    Edit64: TEdit;
    CheckBox65: TCheckBox;
    Edit65: TEdit;
    CheckBox351: TCheckBox;
    CheckBox352: TCheckBox;
    CheckBox353: TCheckBox;
    CheckBox354: TCheckBox;
    CheckBox355: TCheckBox;
    CheckBox356: TCheckBox;
    CheckBox357: TCheckBox;
    CheckBox358: TCheckBox;
    CheckBox359: TCheckBox;
    Edit359: TEdit;
    CheckBox360: TCheckBox;
    Edit360: TEdit;
    CheckBox361: TCheckBox;
    Edit361: TEdit;
    CheckBox362: TCheckBox;
    Edit362: TEdit;
    CheckBox363: TCheckBox;
    Edit363: TEdit;
    CheckBox364: TCheckBox;
    Edit364: TEdit;
    CheckBox365: TCheckBox;
    Edit365: TEdit;
    CheckBox81: TCheckBox;
    CheckBox82: TCheckBox;
    Edit81: TEdit;
    date81: TDateTimePicker;
    time81: TDateTimePicker;
    CheckBox83: TCheckBox;
    Edit83: TEdit;
    CheckBox84: TCheckBox;
    Edit84: TEdit;
    CheckBox33: TCheckBox;
    Edit33: TComboBox;
    Label76: TLabel;
    CheckBox85: TCheckBox;
    Edit85: TEdit;
    CheckBox86: TCheckBox;
    Edit86: TEdit;
    CheckBox87: TCheckBox;
    Edit87: TEdit;
    Label78: TLabel;
    CheckBox88: TCheckBox;
    Edit88: TEdit;
    CheckBox89: TCheckBox;
    Edit89: TComboBox;
    Edit90: TEdit;
    Label79: TLabel;
    Edit91: TEdit;
    Label81: TLabel;
    CheckBox90: TCheckBox;
    CheckBox91: TCheckBox;
    CheckBox92: TCheckBox;
    Edit92: TEdit;
    Label77: TLabel;
    Label80: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    GroupBox6: TGroupBox;
    CheckBox93: TCheckBox;
    Edit93: TEdit;
    CheckBox94: TCheckBox;
    Edit94: TEdit;
    GroupBox9: TGroupBox;
    Label85: TLabel;
    Label86: TLabel;
    Edit10: TEdit;
    CheckBox95: TCheckBox;
    GroupBox10: TGroupBox;
    CheckBox96: TCheckBox;
    Label87: TLabel;
    Label88: TLabel;
    Edit27: TEdit;
    Edit35: TEdit;
    Edit37: TEdit;
    CheckBox97: TCheckBox;
    Edit97: TEdit;
    date97: TDateTimePicker;
    CheckBox98: TCheckBox;
    Edit98: TEdit;
    Label89: TLabel;
    Label91: TLabel;
    CheckBox101: TCheckBox;
    Edit101: TEdit;
    CheckBox102: TCheckBox;
    CheckBox103: TCheckBox;
    Edit102: TEdit;
    Edit103: TEdit;
    CheckBox104: TCheckBox;
    Edit104: TEdit;
    CheckBox105: TCheckBox;
    Edit105: TEdit;
    Label90: TLabel;
    CheckBox106: TCheckBox;
    Edit106: TEdit;
    CheckBox107: TCheckBox;
    Edit107: TEdit;
    Label92: TLabel;
    GroupBox11: TGroupBox;
    CheckBox108: TCheckBox;
    Label93: TLabel;
    Label94: TLabel;
    Edit41: TEdit;
    Edit42: TEdit;
    Label95: TLabel;
    Label96: TLabel;
    CheckBox109: TCheckBox;
    Edit109: TEdit;
    TabSheet13: TTabSheet;
    TabSheet14: TTabSheet;
    cxCheckListBox5: TcxCheckListBox;
    CheckBox110: TCheckBox;
    Label97: TLabel;
    Label98: TLabel;
    rbTimeUnitSecond: TRadioButton;
    rbTimeUnitMinute: TRadioButton;
    Edit38: TEdit;
    cxCheckListBox6: TcxCheckListBox;
    CheckBox111: TCheckBox;
    Label99: TLabel;
    Label100: TLabel;
    rbDisUnitMeter: TRadioButton;
    rbDisUnitKilometer: TRadioButton;
    Edit43: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit11KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure Edit8Change(Sender: TObject);
    procedure Edit11Change(Sender: TObject);
    procedure Edit12Change(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure Edit60Change(Sender: TObject);
    procedure BitBtnSetClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit25Change(Sender: TObject);
    procedure Edit59Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBox37Click(Sender: TObject);
    procedure Edit52Change(Sender: TObject);
    procedure CheckBox35Click(Sender: TObject);
    procedure CheckBox38Click(Sender: TObject);
    procedure CheckBox41Click(Sender: TObject);
    procedure CheckBox42Click(Sender: TObject);
    procedure CheckBox58Click(Sender: TObject);
    procedure CheckBox43Click(Sender: TObject);
    procedure CheckBox44Click(Sender: TObject);
    procedure CheckBox45Click(Sender: TObject);
    procedure CheckBox46Click(Sender: TObject);
    procedure Edit382Exit(Sender: TObject);
    procedure CheckBox56Click(Sender: TObject);
    procedure CheckBox48Click(Sender: TObject);
    procedure CheckBox54Click(Sender: TObject);
    procedure BitBtnSelectDevFunctionClick(Sender: TObject);
    procedure CheckBoxSelectAllClick(Sender: TObject);
    procedure CheckBoxSelectPageCommunicationClick(Sender: TObject);
    procedure CheckBoxSelectPageElseClick(Sender: TObject);
    procedure RzCheckBoxSelectPageCommunicationClick(Sender: TObject);
    procedure RzCheckBoxSelectPageElseClick(Sender: TObject);
    procedure RzCheckBoxSelectAllClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure CheckBox81Click(Sender: TObject);
    procedure Edit363Change(Sender: TObject);
    procedure CheckBox80Click(Sender: TObject);
    procedure CheckBox79Click(Sender: TObject);
    procedure CheckBox78Click(Sender: TObject);
    procedure CheckBox77Click(Sender: TObject);
    procedure CheckBox27Click(Sender: TObject);
    procedure Edit32KeyPress(Sender: TObject; var Key: Char);
    procedure Edit69Change(Sender: TObject);
    procedure Edit71Change(Sender: TObject);
    procedure Edit27Change(Sender: TObject);
    procedure Edit35Change(Sender: TObject);
    procedure CheckBox110Click(Sender: TObject);
    procedure CheckBox111Click(Sender: TObject);
  private
    //字节数据转成 十六进制表示的字符串，一个字节转成2位字符。如：0x01 0x02 转成'0102'
    function BytesToHexString(ABuff: Pointer; ALen: integer): string;
    procedure HexStringToBytes(AHexS: string; var ALen: Integer; ABuf: PByte);

    //buf:array of byte;
  private


    function SetStrParam(ATargetID: string; ParamID: Word; StrParam: string): boolean;
    function SetStrBCDParam(ATargetID: string; ParamID: Word; StrParam: string; bcdLen: Integer; fillChar: string): boolean;
    function SetAStrParam(ATargetID: string; ParamID: Word; StrParam: string): boolean;
    function SetIPParam(ATargetID: string; ParamID: Word; IPParam: TEdit): boolean;
    function SetWordParam(ATargetID: string; ParamID: Word; WordParam: string): boolean;
    function SetByteParam(ATargetID: string; ParamID: Word; ByteParam: string): boolean;
    function SetLongWordParam(ATargetID: string; ParamID:Word; LongWordParam: string): boolean;
    function SetBcdParam(ATargetID: string; ParamID: Word; ByteParam: string): Boolean;
    { Private declarations }
  protected
    function SetParam(ATargetID: string; ParamNO: integer): boolean;
    function SetParam0000(ATargetID: string): boolean; //车载终端当前积分
    function SetParam0004(ATargetID: string): boolean; //UDP消息应答超时时间
    function SetParam0005(ATargetID: string): boolean; //UDP消息重传次数
    function SetParam0019(ATargetID: string): boolean; //服务器UDP端口
    function SetParam0100(ATargetID: string): boolean; //设置监听号码
    function SetParam0101(ATargetID: string): boolean; //电话复位号码
    function SetParam0102(ATargetID: string): boolean; //短信息服务中心号
    function SetParam0103(ATargetID: string): boolean; //报警短信中心号码
    function SetParam0200(ATargetID: string): boolean; //APN参数
    function SetParam0201(ATargetID: string): boolean; //设置主中心IP地址
    function SetParam0202(ATargetID: string): boolean; //设置主中心域名
    function SetParam0203(ATargetID: string): boolean; //设置副中心IP地址
    function SetParam0204(ATargetID: string): boolean; //设置副中心域名
    function SetParam0205(ATargetID: string): boolean; //设置中心端口号
    function SetParam0001(ATargetID: string): boolean; //中心下发心跳间隔
    function SetParam0207(ATargetID: string): boolean; //TCP消息重传次数 原：域名解析服务器的IP
    function SetParam0300(ATargetID: string): boolean; //设置车载终端ID号
    function SetParam0301(ATargetID: string): boolean; //车载终端密码
    function SetParam0400(ATargetID: string): boolean; //超速速度                                                  超速速度
    function SetParam0500(ATargetID: string): boolean; //是否翻牌拍照
    function SetParam0501(ATargetID: string): boolean; //是否关门拍照
    function SetParam0502(ATargetID: string): boolean; //是否存储报警照片
    function SetParam0503(ATargetID: string): boolean; //主照片服务器地址
    function SetParam0504(ATargetID: string): boolean; //设置主照片服务器域名
    function SetParam0505(ATargetID: string): boolean; //副照片服务器地址
    function SetParam0506(ATargetID: string): boolean; //设置副照片服务器域名
    function SetParam0507(ATargetID: string): boolean; //设置照片服务器端口号
    function SetParam0508(ATargetID: string): boolean; //设置存储翻牌照片的时间段



    function SetParam0600(ATargetID: string): boolean; //预约订单转换即时订单时间

    function SetParam0800(ATargetID: string): boolean; //IC卡公司主IP
    function SetParam0801(ATargetID: string): boolean; //IC卡公司主port
    function SetParam0802(ATargetID: string): boolean; //IC卡公司备用IP
    function SetParam0803(ATargetID: string): boolean; //IC卡公司备用port
    function SetParam0804(ATargetID: string): boolean; //连接IC卡公司用户名
    function SetParam0805(ATargetID: string): boolean; //连接IC卡公司用密码

    function SetParam0900(ATargetID: string; AOnlySaveBj: Boolean = False): boolean; //汇报间隔
    function SetParam0901(ATargetID: string; AOnlySaveBj: Boolean = False): boolean; // 功耗控制参数
    function SetParam0902(ATargetID: string; AOnlySaveBj: Boolean = False): boolean; //疲劳驾驶拍照
    function SetParam0903(ATargetID: string; AOnlySaveBj: Boolean = False): boolean; //空重车检测参数
    function SetParam0904(ATargetID: string; AOnlySaveBj: Boolean = False): boolean; //开关信号有效电平
    function SetParam0905(ATargetID: string; AOnlySaveBj: Boolean = False): boolean; //盲区轨迹数据存储
    function SetParam0906(ATargetID: string; AOnlySaveBj: Boolean = False): boolean; //疲劳驾驶参数
    function SetParam0907(ATargetID: string; AOnlySaveBj: Boolean = False): boolean; //进入重车提示语
    function SetParam0908(ATargetID: string; AOnlySaveBj: Boolean = False): boolean; //进入空车车提示语
    function SetParam0909(ATargetID: string; AOnlySaveBj: Boolean = False): boolean; //疲劳驾驶提醒
    function SetParam090A(ATargetID: string; AOnlySaveBj: Boolean = False): boolean; //超速驾驶提醒
    function SetParam090B(ATargetID: string; AOnlySaveBj: Boolean = False): boolean; //允许超速时间
    function SetParam090C(ATargetID: string; AOnlySaveBj: Boolean = False): boolean; //超速报警拍照
    function SetParam090D(ATargetID: string; AOnlySaveBj: Boolean = False): boolean; //TCP消息应答超时时间，原：副中心端口号
    function SetParam090E(ATargetID: string; AOnlySaveBj: Boolean = False): boolean; // 副照片服务端口号
    function SetParam090F(ATargetID: string; AOnlySaveBj: Boolean = False): boolean; //设置辅监听号码
    function SetParam0910(ATargetID: string; AOnlySaveBj: Boolean = False): boolean; //升级服务器APN
    function SetParam0911(ATargetID: string; AOnlySaveBj: Boolean = False): boolean; // 升级服务器IP地址
    function SetParam0912(ATargetID: string; AOnlySaveBj: Boolean = False): boolean; // 升级服务器域名
    function SetParam0913(ATargetID: string; AOnlySaveBj: Boolean = False): boolean; //升级服务器端口号
    function SetParam0914(ATargetID: string; AOnlySaveBj: Boolean = False): boolean; // 紧急报警拍照 ,是否紧急报警拍照设置由0502H项参数控制
    function SetParam0915(ATargetID: string; AOnlySaveBj: Boolean = False): boolean; // 电话通话时长

    function SetParamCxCheckListBox(ATargetID: string; ParamID: Word; cxCheckListBox: TcxCheckListBox): Boolean; // 各类报警设置

    function SetParam0a00(ATargetID: string; AOnlySaveBj: Boolean = False): boolean; // 功能屏蔽标志
    function SetParam0a01(ATargetID: string; AOnlySaveBj: Boolean = False): boolean; // 电话接听方式
    function SetParam0a02(ATargetID: string; AOnlySaveBj: Boolean = False): boolean; //夜间时段
    function SetParam0a03(ATargetID: string): boolean; //SMS消息应答超时时间
    function SetParam0a04(ATargetID: string): boolean; //SMS消息重传次数
    function SetParam0a05(ATargetID: string): boolean; //主服务器无线通信拨号用户名
    function SetParam0a06(ATargetID: string): boolean; //主服务器无线通信拨号密码
    function SetParam0a07(ATargetID: string): boolean; //备份服务器APN
    function SetParam0a08(ATargetID: string): boolean; //备份服务器无线通信拨号密码
    function SetParam0a09(ATargetID: string): boolean; //服务器TCP端口
    function SetParam0A0A(ATargetID: string; ParamID:Word; LongWordParam: string): Boolean; // 汇报时间间隔
    function SetParam0A0B(ATargetID: string; ParamID:Word; StrParam: string): Boolean; // 发送字符串
    function SetParamDataTime(ATargetID: string; ParamID: Word; dateParam: TDate; timeParam: TTime): Boolean; overload;  // 发送时间的BCD码
    function SetParamDataTime(ATargetID: string; ParamID: Word; dateTimeStr: string): Boolean; overload; // 发送时间的BCD码
    function SetParam0A0C(ATargetID: string): Boolean;
    function SetParam0A0D(ATargetID: string): Boolean;
    function SetParam0A0E(ATargetID: string): Boolean;
    function SetParam0A0F(ATargetID: string): Boolean;
    function ReadParam(dev: TDevice; ParamID: Word): Boolean;  // 查询参数
    function CheckEmpty: boolean;
    function CheckError: boolean;
    procedure ParamSaveToDev(Dev: TDevice);
    function GetCxCheckListBoxValue(cxCheckListBox: TcxCheckListBox): Integer;
    procedure ShowParamToEdit(Dev: TDevice);
    procedure CheckNum(Sender: TObject; MaxNum, MinNum: Int64); //检查EDIT里的数字是不是在MAX和MIN之内
    procedure CheckLength(Sender: TObject; Len: Integer); //检查EDIT里的长度
    function CheckIP(Edit: TEdit): LongWord;
    function checkParam(var paramData: TByteDynArray; var paramCount: Integer): Boolean;
    procedure GetParamData(var paramData: TByteDynArray; checkboxNo: Integer);
    procedure GetLongWordParamData(var paramData: TByteDynArray; paramId: LongWord; paramValue: string);
    procedure GetWordParamData(var paramData: TByteDynArray; paramId: LongWord; paramValue: string);
    procedure GetByteParamData(var paramData: TByteDynArray; paramId: LongWord; paramValue: string);
    procedure GetStringParamData(var paramData: TByteDynArray; paramId: LongWord; paramValue: string);
    procedure GetStrBCDParamData(var paramData: TByteDynArray; paramId: LongWord; paramValue: string; bcdLen: Integer; fillChar: string);
    procedure ClearEditAndCbx;
  protected
    paramNO: integer;
    LastComp: Integer;
    CurrentDev: TDevice;
    CheckBoxList: TStringList;
    IsNewDev: Boolean;
  public
    procedure CreateParams(var Param: TCreateParams); override;
    procedure SetCurrentDev(ADev: TDevice);
    { Public declarations }
  end;

var
  ParamFrm: TParamFrm;

implementation
uses UGloabVar, CmdStructUnit,GatewayServerUnit;
{$R *.dfm}
//---------------------------------//

function TParamFrm.SetParam0600(ATargetID: string): boolean; //预约订单转换即时订单时间
begin
  //Result := SetByteParam(ATargetID, $600, Edit26.Text);
end;


function TParamFrm.SetParam0508(ATargetID: string): boolean; //设置存储翻牌照片的时间段
var
  temp: Word;
begin
  temp := StrToInt(edit25.Text);
  temp := temp shl 8;
  temp := temp + StrToInt(edit252.Text);
  Result := SetWordParam(ATargetID, $508, intToStr(temp));
end;

function TParamFrm.SetParam0507(ATargetID: string): boolean; //设置照片服务器端口号
begin
  Result := SetWordParam(ATargetID, $507, Edit24.Text);
end;

function TParamFrm.SetParam0506(ATargetID: string): boolean; //设置副照片服务器域名
begin
  Result := SetStrParam(ATargetID, $506, Edit23.Text);
end;

function TParamFrm.SetParam0505(ATargetID: string): boolean; //副照片服务器地址
begin
  Result := SetIPParam(ATargetID, $505, Edit22);
end;


function TParamFrm.SetParam0504(ATargetID: string): boolean; //设置主照片服务器域名
begin
  Result := SetStrParam(ATargetID, $504, Edit21.Text);
end;


function TParamFrm.SetParam0503(ATargetID: string): boolean; //主照片服务器地址
begin
  Result := SetIPParam(ATargetID, $503, Edit20);
end;

function TParamFrm.SetParam0502(ATargetID: string): boolean; //是否存储报警照片
begin
  Result := SetByteParam(ATargetID, $502, IntToStr(Edit19.ItemIndex));
end;

function TParamFrm.SetParam0501(ATargetID: string): boolean; //是否关门拍照
begin
  Result := SetByteParam(ATargetID, $501, IntToStr(Edit18.ItemIndex));
end;


function TParamFrm.SetParam0500(ATargetID: string): boolean; // 是否翻牌拍照
begin
  Result := SetByteParam(ATargetID, $500, IntToStr(Edit17.ItemIndex));
end;


function TParamFrm.SetParam0400(ATargetID: string): boolean; // 超速速度
begin
  Result := SetLongWordParam(ATargetID, $0055, Edit16.Text)
end;

function TParamFrm.SetParam0301(ATargetID: string): boolean; //位置汇报方案
begin
  Result := SetLongWordParam(ATargetID, $0021, IntToStr(Edit15.ItemIndex));
end;

function TParamFrm.SetParam0300(ATargetID: string): boolean; //位置汇报策略
begin
    Result := SetLongWordParam(ATargetID, $0020, IntToStr(Edit14.ItemIndex));
end;

function TParamFrm.SetParam0207(ATargetID: string): boolean; //TCP消息重传次数 原：域名解析服务器的IP
begin
  Result := SetLongWordParam(ATargetID, $0003, Edit13.Text)
  //Result := SetIPParam(ATargetID, $207, Edit13);
end;

function TParamFrm.SetParam0001(ATargetID: string): boolean; //中心下发心跳间隔
begin
  Result := SetLongWordParam(ATargetID, $0001, Edit12.Text)
end;

function TParamFrm.SetParam0205(ATargetID: string): boolean; //备份服务器无线通信拨号用户名
begin
  Result := SetStrParam(ATargetID, $0015, Edit11.Text)
end;

function TParamFrm.SetParam0204(ATargetID: string): boolean; //设置副中心域名
begin
  //Result := SetStrParam(ATargetID, $204, Edit10.Text)
end;


function TParamFrm.SetParam0203(ATargetID: string): boolean; //备份服务器地址
begin
  Result := SetStrParam(ATargetID, $0017, Edit9.Text);
end;


function TParamFrm.SetParam0202(ATargetID: string): boolean;
begin
  Result := SetStrParam(ATargetID, $202, Edit8.Text)
end;



function TParamFrm.SetParam0201(ATargetID: string): boolean;
begin
  Result := SetStrParam(ATargetID, $0013, Edit7.Text);
end;


function TParamFrm.SetParam0200(ATargetID: string): boolean;
var
  temp: string;
  Len: integer;
begin
  Temp := Trim(Edit6.Text);
  Len := Length(Temp);
  Result := DataServer.SetDevParam_V3(ATargetID, $0010, @temp[1], Len)
end;

function TParamFrm.SetParam0103(ATargetID: string): boolean;
var
  temp: string;
  Len: integer;
begin
  Temp := Trim(Edit5.Text);
  Len := Length(Temp);
  Result := DataServer.SetDevParam_V3(ATargetID, $0044, @temp[1], Len)
end;

function TParamFrm.SetParam0102(ATargetID: string): boolean;
var
  temp: string;
  Len: integer;
begin
  Temp := Trim(Edit4.Text);
  Len := Length(Temp);
  Result := DataServer.SetDevParam_V3(ATargetID, $0043, @temp[1], Len)
end;


function TParamFrm.SetParam0101(ATargetID: string): boolean;
var
  temp: string;
  Len: integer;
begin
  Temp := Trim(Edit3.Text);
  Len := Length(Temp);
  Result := DataServer.SetDevParam_V3(ATargetID, $0041, @temp[1], Len)
end;

function TParamFrm.SetParam0100(ATargetID: string): boolean;
//var
//  temp: string;
//  Len: integer;
begin
  Result := SetStrParam(ATargetID, $0049, Edit2.Text);
//  Temp := Trim(Edit2.Text);
//  Len := Length(Temp);
//  Result := DataServer.SetDevParam_V3(ATargetID, $100, @temp[1], Len)
end;

function TParamFrm.SetParam0000(ATargetID: string): boolean;
var
  temp: Smallint;
begin
  temp := StrToInt(Edit1.Text);
  temp := ByteOderConvert_Word(temp);
  Result := DataServer.SetDevParam_V3(ATargetID, 0, @temp, 2);
end;

function TParamFrm.SetByteParam(ATargetID: string; ParamID: Word; ByteParam: string): boolean;
var
  temp: byte;
begin
  temp := StrToInt(ByteParam);
  Result := DataServer.SetDevParam_V3(ATargetID, ParamID, @temp, 1);
end;

function TParamFrm.SetBcdParam(ATargetID: string; ParamID: Word; ByteParam: string): Boolean;
var
  temp: Byte;
begin
  temp := StrToInt('$'+ByteParam);
  Result := DataServer.SetDevParam_V3(ATargetID, ParamID, @temp, 1);
end;

function TParamFrm.SetWordParam(ATargetID: string; ParamID: Word; WordParam: string): boolean;
var
  temp: Word;
begin
  temp := ByteOderConvert_Word(StrToInt(WordParam));
  //temp := ByteOderConvert_Word(temp);
  Result := DataServer.SetDevParam_V3(ATargetID, ParamID, @temp, 2)
end;

function TParamFrm.SetLongWordParam(ATargetID: string; ParamID:Word; LongWordParam: string): boolean;
var
  temp: LongWord;
begin
  temp := ByteOderConvert_LongWord(StrToInt(LongWordParam));
  //temp := ByteOderConvert_LongWord(temp);
  Result := DataServer.SetDevParam_V3(ATargetID, ParamID, @temp, 4);
end;

function TParamFrm.SetIPParam(ATargetID: string; ParamID: Word; IPParam: TEdit): boolean;
var
  temp: LongWord;
begin
//  Result:=false;
  temp := CheckIP(IPParam);
 // if temp=0 then exit;
  temp := ByteOderConvert_LongWord(temp);
  Result := DataServer.SetDevParam_V3(ATargetID, ParamID, @temp, 4)
end;

function TParamFrm.SetStrParam(ATargetID: string; ParamID: Word; StrParam: string): boolean;
var
  temp: string;
  Len: integer;
begin
  Temp := Trim(StrParam);
  Len := Length(Temp);
  Result := DataServer.SetDevParam_V3(ATargetID, ParamID, @temp[1], Len)
end;

function TParamFrm.SetParam(ATargetID: string; ParamNO: integer): boolean;
var
  str: string;
  w: Word;
  lw: LongWord;
begin
  case ParamNO of
    12 : Result := SetParam0001(ATargetID);
    34 : Result := SetParam090D(ATargetID);
    13 : Result := SetParam0207(ATargetID);
    85 : Result := SetParam0004(ATargetID);
    86 : Result := SetParam0005(ATargetID);
    59 : Result := SetParam0A03(ATargetid);
    60 : Result := SetParam0A04(ATargetid);
    6  : Result := SetParam0200(ATargetID);
    61 : Result := SetParam0A05(ATargetID);
    62 : Result := SetParam0A06(ATargetID);
    7  : Result := SetParam0201(ATargetID);
    63 : Result := SetParam0A07(ATargetID);
    11 : Result := SetParam0205(ATargetID);
    64 : Result := SetParam0A08(ATargetID);
    9  : Result := SetParam0203(ATargetID);
    65 : Result := SetParam0A09(ATargetID);


    14 : Result := SetParam0300(ATargetID);
    15 : Result := SetParam0301(ATargetID);

    351: Result := SetParam0A0A(ATargetID, $0022, Edit351.Text);
    //353: Result := SetParam0A0A(ATargetID, $0023, Edit353.Text);
    //355: Result := SetParam0A0A(ATargetID, $0024, Edit355.Text);
//    357: Result := SetParam0A0A(ATargetID, $0025, Edit357.Text);
//    359: Result := SetParam0A0A(ATargetID, $0026, Edit359.Text);
    361: Result := SetParam0A0A(ATargetID, $0027, Edit361.Text);
    362: Result := SetParam0A0A(ATargetID, $0028, Edit362.Text);

    90 : Result := SetParam0A0A(ATargetID, $0029, Edit90.Text);
    //354: Result := SetParam0A0A(ATargetID, $002A, Edit354.Text);
    //356: Result := SetParam0A0A(ATargetID, $002B, Edit356.Text);
    91 : Result := SetParam0A0A(ATargetID, $002C, Edit91.Text);
    352: Result := SetParam0A0A(ATargetID, $002D, Edit352.Text);
    364: Result := SetParam0A0A(ATargetID, $002E, Edit364.Text);
    365: Result := SetParam0A0A(ATargetID, $002F, Edit365.Text);
    363: Result := SetParam0A0A(ATargetID, $0030, Edit363.Text);
    98 : Result := SetWordParam(ATargetID, $0031, Edit98.Text);

    66 : Result := SetParam0A0B(ATargetID, $0040, Edit66.Text);
    3  :  Result := SetParam0A0B(ATargetID, $0041, Edit3.Text);
    67 : Result := SetParam0A0B(ATargetID, $0042, Edit67.Text);
    4  : Result := SetParam0A0B(ATargetID, $0043, Edit4.Text);
    5  : Result := SetParam0A0B(ATargetID, $0044, Edit5.Text);
    57 : Result := SetParam0A0A(ATargetID, $0045, IntToStr(Edit57.ItemIndex));
    55 : Result := SetParam0A0A(ATargetID, $0046, Edit55.Text);
    68 : Result := SetParam0A0A(ATargetID, $0047, Edit68.Text);
    //36: Result := SetParam0A0A(ATargetID, $0048, Edit36.Text);
    2  : Result := SetParam0A0B(ATargetID, $0048, Edit2.Text);
    92 : Result := SetParam0A0B(ATargetID, $0049, Edit92.Text);

    56 : Result := SetParamCxCheckListBox(ATargetID, $0050, cxCheckListBox56);//SetParam0A00(ATargetID);
    77 : Result := SetParamCxCheckListBox(ATargetID, $0051, cxCheckListBox1);//SetParam0A0C(ATargetID);
    78 : Result := SetParamCxCheckListBox(ATargetID, $0052, cxCheckListBox2);//SetParam0A0C(ATargetID);
    79 : Result := SetParamCxCheckListBox(ATargetID, $0053, cxCheckListBox3);//SetParam0A0C(ATargetID);
    80 : Result := SetParamCxCheckListBox(ATargetID, $0054, cxCheckListBox4);//SetParam0A0C(ATargetID);

    16 : Result := SetParam0A0A(ATargetID, $0055, Edit16.Text);
    47 : Result := SetParam0A0A(ATargetID, $0056, Edit47.Text);
    422: Result := SetParam0A0A(ATargetID, $0057, Edit422.Text);
    424: Result := SetParam0A0A(ATargetID, $0058, Edit424.Text);
    421: Result := SetParam0A0A(ATargetID, $0059, Edit421.Text);
    423: Result := SetParam0A0A(ATargetID, $005A, Edit423.Text);

    69 : Result := SetParam0A0A(ATargetID, $0070, Edit69.Text);
    70 : Result := SetParam0A0A(ATargetID, $0071, Edit70.Text);
    71 : Result := SetParam0A0A(ATargetID, $0072, Edit71.Text);
    72 : Result := SetParam0A0A(ATargetID, $0073, Edit72.Text);
    73 : Result := SetParam0A0A(ATargetID, $0074, Edit73.Text);

    74 : Result := SetParam0A0A(ATargetID, $0080, Edit74.Text);
    75 : Result := SetWordParam(ATargetID, $0081, Edit75.Text);
    76 : Result := SetWordParam(ATargetID, $0082, Edit76.Text);
    88 : Result := SetStrParam(ATargetID, $0083, Edit88.Text);

    89 :
      begin
        if Edit89.ItemIndex <= 3 then
          Result := SetByteParam(ATargetID, $0084, IntToStr(Edit89.ItemIndex + 1))
        else
          Result := SetByteParam(ATargetID, $0084, '9');
      end;

    1  : Result := SetBcdParam(ATargetID, $0090, Edit1.Text);
    27 : Result := SetParamDataTime(ATargetID, $0091, Trim(EditYear.Text) + Trim(EditMonth.Text) + Trim(EditDay.Text)
                                + Trim(EditHour.Text));//SetParam0A0A(ATargetID, $0090, Edit47.Text);

    100: Result := SetByteParam(ATargetID, $00A0, IntToStr(Edit100.ItemIndex+1));
    28 : Result := SetByteParam(ATargetID, $00A1, Edit28.Text);
    29 : Result := SetByteParam(ATargetID, $00A2, Edit29.Text);

    30 : Result := SetByteParam(ATargetID, $00A3, Edit30.Text);
    31 : Result := SetWordParam(ATargetID, $00AF, Edit31.Text);

    32 : Result := SetByteParam(ATargetID, $00B0, IntToStr(Edit32.ItemIndex));
    99 : Result := SetParam0A0B(ATargetID, $00B1, Edit99.Text);
    50 : Result := SetParam0A0B(ATargetID, $00B2, Edit50.Text);

    51 : Result := SetParam0A0B(ATargetID, $00B3, Edit51.Text);
    52 : Result := SetParam0A0B(ATargetID, $00B4, Edit52.Text);
    53 : Result := SetParam0A0A(ATargetID, $00B5, Edit53.Text);


    26 : Result := SetByteParam(ATargetID, $004B, Edit26.Text);

    81 : Result := SetParam0A0A(ATargetID, $0019, Edit81.Text);
    82 : Result :=  SetParam0A0B(ATargetID, $004A, Edit82.Text);

    33 : Result := SetByteParam(ATargetID, $F002, IntToStr(Edit33.ItemIndex));
    87 : Result := SetLongWordParam(ATargetID, $0019, Edit87.Text);


    94 : Result := SetStrParam(ATargetID, $F002, Trim(Edit94.Text));

    95 :
      begin
        SetLength(str, 8);
        lw := StrToInt64(Trim(Edit37.Text));
        lw := ByteOderConvert_LongWord(lw);
        CopyMemory(@str[1], @lw, 4);
        lw := StrToInt64(Trim(Edit10.Text));
        lw := ByteOderConvert_LongWord(lw);
        CopyMemory(@str[5], @lw, 4);
        Result := SetAStrParam(ATargetID, $F004, str);
      end;
    96 :
      begin
        SetLength(str, 4);
        w := StrToInt64(Trim(Edit27.Text));
        w := ByteOderConvert_Word(w);
        CopyMemory(@str[1], @w, 2);
        w := StrToInt64(Trim(Edit35.Text));
        w := ByteOderConvert_Word(w);
        CopyMemory(@str[3], @w, 2);
        Result := SetAStrParam(ATargetID, $F005, str);
      end;  
    97 :
      begin
        str := Trim(Edit97.Text);
        FillStr(str, 8, '0');
        str := FormatDateTime('yyMMdd', date97.DateTime) + str;
        Result := SetStrBCDParam(ATargetID, $F003, str, 7, '0');
      end;

  else
    Result := false;
  end;
end;
//==================================//

procedure TParamFrm.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  CheckBoxList := TStringList.Create;

  //if UpperCase(VersionFor) = 'ZB' then
   // GroupBox9.Enabled := false
  //else
  //  GroupBox9.Enabled := true;
  //-------------因硬件不支持，现不可用下列参数  20090108 sha
  CheckBox37.Enabled := True;
  CheckBox39.Enabled := False;
  CheckBox40.Enabled := False;

  CheckBox49.Enabled := False;
end;

procedure TParamFrm.CheckBox1Click(Sender: TObject);
var
  CheckBoxName: string;
  Num: string;
  i: integer;
  tempComponent: TComponent;
begin
  Num := '';
  CheckBoxName := TCheckBox(Sender).Name;
  for i := 1 to Length(CheckBoxName) do
  begin
    if (CheckBoxName[i] >= '0') and (CheckBoxName[i] <= '9') then
      Num := Num + CheckBoxName[i];
  end;
  tempComponent := self.FindComponent('Edit' + Num);
  if tempComponent <> nil then
  begin
    TWinControl(tempComponent).Enabled := TCheckBox(Sender).Checked;
    if tempComponent is TEdit then
      if TCheckBox(Sender).Checked then
        TEdit(tempComponent).Color := clWindow
      else TEdit(tempComponent).Color := clBtnFace
    else
      if TCheckBox(Sender).Checked then
        TComboBox(tempComponent).Color := clWindow
      else TComboBox(tempComponent).Color := clBtnFace;
  end;
  if CheckBoxName = 'CheckBox25' then
  begin
    if TCheckBox(Sender).Checked then
    begin
      Edit252.Color := clWindow;
      Edit252.Enabled := true;
    end
    else
    begin
      Edit252.Color := clBtnFace;
      Edit252.Enabled := false;
    end;
  end
  else if CheckBoxName = 'CheckBox27' then
  begin
    if TCheckBox(Sender).Checked then
    begin
      Date27.Color := clWindow;
      Date27.Enabled := true;
      Time27.Color := clWindow;
      Time27.Enabled := true;
    end
    else
    begin
      Date27.Color := clBtnFace;
      Date27.Enabled := false;
      Time27.Color := clBtnFace;
      Time27.Enabled := false;
    end;
  end
  else if CheckBoxName = 'CheckBox95' then
  begin
    if TCheckBox(Sender).Checked then
    begin
      Edit37.Color := clWindow;
      Edit37.Enabled := true;
      Edit10.Color := clWindow;
      Edit10.Enabled := true;
    end
    else
    begin
      Edit37.Color := clBtnFace;
      Edit37.Enabled := false;
      Edit10.Color := clBtnFace;
      Edit10.Enabled := false;
    end;
  end
  else if CheckBoxName = 'CheckBox96' then
  begin
    if TCheckBox(Sender).Checked then
    begin
      Edit27.Color := clWindow;
      Edit27.Enabled := true;
      Edit35.Color := clWindow;
      Edit35.Enabled := true;
    end
    else
    begin
      Edit27.Color := clBtnFace;
      Edit27.Enabled := false;
      Edit35.Color := clBtnFace;
      Edit35.Enabled := false;
    end;
  end
  else if CheckBoxName = 'CheckBox97' then
  begin
    if TCheckBox(Sender).Checked then
    begin
      date97.Color := clWindow;
      date97.Enabled := true;
    end
    else
    begin
      date97.Color := clBtnFace;
      date97.Enabled := false;
    end;
  end;

end;

procedure TParamFrm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#8, '0'..'9', #22]) then Key := #0;
end;

procedure TParamFrm.Edit11KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#8, '0'..'9', '-']) then Key := #0;
end;

procedure TParamFrm.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#8, '0'..'9', '.']) then Key := #0;
end;


procedure TParamFrm.CheckNum(Sender: TObject; MaxNum, MinNum: Int64);
var
  i: integer;
begin
  if TEdit(Sender).Text = '-' then exit;
  i := length(TEdit(Sender).Text);
  if i > 0 then
    if (StrToInt64(TEdit(Sender).Text) > MaxNum) or (StrToInt64(TEdit(Sender).Text) < MinNum) then
    begin
      TEdit(Sender).text := copy(TEdit(Sender).Text, 1, i - 1);
      TEdit(Sender).SelStart := i - 1;
    end;
end;

procedure TParamFrm.CheckLength(Sender: TObject; Len: Integer);
var
  i: integer;
begin
  i := length(TEdit(Sender).Text);
  if i > Len then
  begin
    TEdit(Sender).text := copy(TEdit(Sender).Text, 1, i - 1);
    TEdit(Sender).SelStart := i - 1;
  end;
end;

procedure TParamFrm.Edit1Change(Sender: TObject);
begin
  CheckNum(Sender, 32768, -32768);
end;

procedure TParamFrm.Edit2Change(Sender: TObject);
begin
  CheckLength(Sender, 20);
end;

procedure TParamFrm.Edit6Change(Sender: TObject);
begin
  CheckLength(Sender, 32);
end;

procedure TParamFrm.Edit8Change(Sender: TObject);
begin
  CheckLength(Sender, 128);
end;

procedure TParamFrm.Edit11Change(Sender: TObject);
begin
  CheckNum(Sender, 65535, 0);
end;

procedure TParamFrm.Edit12Change(Sender: TObject);
begin
  CheckNum(Sender, 255, 0);
end;

procedure TParamFrm.Edit7Change(Sender: TObject);
begin
  CheckLength(Sender, 15);
end;


procedure TParamFrm.Edit60Change(Sender: TObject);
begin
  CheckNum(Sender, 4294967295, 0);
end;


function TParamFrm.CheckIP(Edit: TEdit): LongWord;
  procedure IPError;
  begin
    messagebox(handle, ' IP地址有误,请重新输入! ', '提示', mb_ok + mb_iconinformation);
    Edit.SetFocus;
  end;
var
  S, S1, S2, S3, S4: string; //  ,temp
  i: integer;
  IP: longWord;
  tempIP: LongWord;
begin
  Result := $FFFFFFFF;
  S := Edit.Text;
//-----------------------------------------------------------------------------------
  i := Pos('.', S);
  if i = 0 then
  begin
    IPError;
    exit;
  end;
  S1 := copy(S, 1, i - 1);
  if S1 = '' then
  begin
    IPError;
    exit;
  end;
  S := Copy(S, i + 1, Length(S) - i);
  tempIP := StrToInt(S1);
  if not ((tempIp >= 0) and (tempIp <= 255)) then
  begin
    IPError;
    exit;
  end;
  IP := tempIp;
//-----------------------------------------------------------------------------------
  i := Pos('.', S);
  if i = 0 then
  begin
    IPError;
    exit;
  end;
  S2 := copy(S, 1, i - 1);
  if S2 = '' then
  begin
    IPError;
    exit;
  end;
  S := Copy(S, i + 1, Length(S) - i);
  tempIP := StrToInt(S2);
  if not ((tempIp >= 0) and (tempIp <= 255)) then
  begin
    IPError;
    exit;
  end;
  IP := IP shl 8;
  IP := IP + tempIp;
//-----------------------------------------------------------------------------------
  i := Pos('.', S);
  if i = 0 then
  begin
    IPError;
    exit;
  end;
  S3 := copy(S, 1, i - 1);
  if S3 = '' then
  begin
    IPError;
    exit;
  end;
  S := Copy(S, i + 1, Length(S) - i);
  tempIP := StrToInt(S3);
  if not ((tempIp >= 0) and (tempIp <= 255)) then
  begin
    IPError;
    exit;
  end;
  IP := IP shl 8;
  IP := IP + tempIp;
//-----------------------------------------------------------------------------------
  i := Pos('.', S);
  if i <> 0 then
  begin
    IPError;
    exit;
  end;
  S4 := S;
  if S4 = '' then
  begin
    IPError;
    exit;
  end;
  tempIP := StrToInt(S4);
  if not ((tempIp >= 0) and (tempIp <= 255)) then
  begin
    IPError;
    exit;
  end;
  IP := IP shl 8;
  IP := IP + tempIp;

  if i = $FFFFFFFF then
  begin
    IPError;
  end;
//-----------------------------------------------------------------------------------
  Result := IP;
end;



procedure TParamFrm.BitBtnSetClick(Sender: TObject);
var
  i, j: integer;
  s: string;
  NO: integer;
begin
  BitBtnSet.Enabled := false;
  LastComp := 0;
  if not CheckEmpty then
  begin
    BitBtnSet.Enabled := true;
    exit;
  end;
  if not CheckError then
  begin
    BitBtnSet.Enabled := true;
    exit;
  end;
  ParamNO := 0;
  j := 0;
  for i := 0 to Self.ComponentCount - 1 do
  begin
    if (Self.Components[i] is TCheckBox) then
    begin
      if TCheckBox(Self.Components[i]).Checked then
      begin
        inc(j);
        LastComp := i;
      end;
    end;
  end;

  try
    ParamSaveToDev(GCurSelectDev);
  except
    on E: Exception do
    begin
      messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
      exit;
    end;
  end;

  if j = 1 then
  begin
    S := TCheckBox(Self.Components[LastComp]).Name;
    S := copy(S, 9, Length(S) - 1);
    NO := StrToInt(S);
    SetParam(GCurSelectDev.Id, NO);
    Close;
  end
  else
  begin
    ProgressBar1.Max := j * 10;
    ProgressBar1.Visible := true;
    ProgressBar1.Position := 0;
    //Self.Height:=111;
    Timer1.Enabled := true;
    Timer1Timer(Timer1);
  end;
end;

procedure TParamFrm.Timer1Timer(Sender: TObject);
var
  i: integer;
  state: byte;
  s: string;
  NO: integer;
  pCmd: PCmdInfo;
begin
  i := ParamNO;
  if (Self.Components[i] is TCheckBox) then
  begin
    if TCheckBox(Self.Components[i]).Checked then
    begin
      if ProgressBar1.Position = 0 then
      begin
        S := TCheckBox(Self.Components[i]).Name;
        S := copy(S, 9, Length(S) - 1);
        NO := StrToInt(S);
        SetParam(GCurSelectDev.Id, NO);
        inc(ParamNO);
        ProgressBar1.StepIt;
        exit;
      end;
      pCmd := ACmdManage.Find(GSetParamCmdID);
      if pCmd = nil then exit;
      state := pCmd^.State;
      if state = CMD_SNDNODO then
      begin
        exit;
      end
      else if (State = CMD_DONE) or (State = CMD_REPLACE) then
      begin
        S := TCheckBox(Self.Components[i]).Name;
        S := copy(S, 9, Length(S) - 1);
        NO := StrToInt(S);
        SetParam(GCurSelectDev.Id, NO);
        inc(ParamNO);
        ProgressBar1.StepIt;
      end
      else
      begin
        timer1.Enabled := false;
        messagebox(handle, ' 设置参数失败!  ', '提示', mb_ok + mb_iconinformation);
        ProgressBar1.Visible := false;
             //Self.Height:=497;
        BitBtnSet.Enabled := true;
      end;
    end
    else
    begin
      inc(ParamNO);
    end;
  end
  else
  begin
    inc(ParamNO);
  end;

  if ParamNO >= self.ComponentCount then
  begin
    timer1.Enabled := false;
    close;
  end;
end;

procedure TParamFrm.BitBtn2Click(Sender: TObject);
begin
  Timer1.Enabled := false;
  Close;
end;

function TParamFrm.CheckEmpty: boolean;
var
  CheckBoxName: string;
  Num: string;
  j, Conut: integer; //     i,
  tempComponent: TComponent;
begin
  Num := '';
  Result := false;
  Conut := 0;
  for j := 0 to Self.ComponentCount - 1 do
  begin
    try
      if not (Self.Components[j] is TCheckBox) then Continue;
      if not TCheckBox(Self.Components[j]).Checked then
        Continue
      else
        Inc(Conut);
      CheckBoxName := TCheckBox(Self.Components[j]).Name;
      CheckBoxList.Add(CheckBoxName);
      Num := Copy(CheckBoxName, 9, Length(CheckBoxName) - 8);

      if Num = '27' then
      begin
        if (Trim(EditYear.Text) = '') or (Trim(EditMonth.Text) = '')
            or (Trim(EditDay.Text) = '') or (Trim(EditHour.Text) = '') then
        begin
          messagebox(handle, ' 参数值不能为空!  ', '提示', mb_ok + mb_iconinformation);
          exit;
        end;
        Continue;
      end
      else if Num = '95' then
      begin
        if Trim(Edit37.Text) = '' then
        begin
          messagebox(handle, ' 进入一级休眠时间值不能为空!  ', '提示', mb_ok + mb_iconinformation);
          exit;
        end;

        if Trim(Edit10.Text) = '' then
        begin
          messagebox(handle, ' 进入深度休眠时间值不能为空!  ', '提示', mb_ok + mb_iconinformation);
          exit;
        end;
        Continue;
      end
      else if Num = '96' then
      begin
        if Trim(Edit27.Text) = '' then
        begin
          messagebox(handle, ' 拍照次数不能为空!  ', '提示', mb_ok + mb_iconinformation);
          exit;
        end;

        if Trim(Edit35.Text) = '' then
        begin
          messagebox(handle, ' 拍照间隔不能为空!  ', '提示', mb_ok + mb_iconinformation);
          exit;
        end;
        Continue;
      end;

      tempComponent := self.FindComponent('Edit' + Num);
      if (tempComponent is TEdit) and ((tempComponent.Name <> 'Edit61') and (tempComponent.Name <> 'Edit62')
          and (tempComponent.Name <> 'Edit11') and (tempComponent.Name <> 'Edit64')) then
        if TEdit(tempComponent).Text = '' then
        begin
          try
            TEdit(tempComponent).SetFocus;
            messagebox(handle, PChar(TEdit(tempComponent).hint + ' 参数值不能为空!  '), '提示', mb_ok + mb_iconinformation);
          except
            messagebox(handle, PChar(TEdit(tempComponent).hint + ' 参数值不能为空!  '), '提示', mb_ok + mb_iconinformation);
          end;

          exit;
        end
        else
        if TComboBox(tempComponent).Text = '' then
        begin
          try
            TComboBox(tempComponent).SetFocus;
            messagebox(handle, PChar(TComboBox(tempComponent).hint + ' 参数值不能为空!  '), '提示', mb_ok + mb_iconinformation);
          except
            messagebox(handle, PChar(TComboBox(tempComponent).hint + ' 参数值不能为空!  '), '提示', mb_ok + mb_iconinformation);
          end;
          exit;
        end
        else
        begin

        end;
    except

    end;
  end;
  if Conut = 0 then
  begin
    messagebox(handle, ' 请选择一个参数!  ', '提示', mb_ok + mb_iconinformation);
    exit;
  end;
  Result := true;
end;

procedure TParamFrm.Edit25Change(Sender: TObject);
begin
  CheckNum(sender, 23, 0);
end;

procedure TParamFrm.Edit59Change(Sender: TObject);
begin
  CheckLength(Sender, 12);
end;

procedure TParamFrm.CreateParams(var Param: TCreateParams);
begin
  inherited CreateParams(Param);
  Param.wndParent := GetDesktopWindow; //getforegroundwindow
end;

procedure TParamFrm.FormShow(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to Self.ComponentCount - 1 do
  begin
    if Self.Components[i] is TEdit then
    begin
      TEdit(Components[i]).Text := '';
      TEdit(Components[i]).Enabled := false;
      TEdit(Components[i]).Color := clBtnFace;
    end;
    if Components[i] is TComboBox then
    begin
      TComboBox(Components[i]).ItemIndex := -1;
      TComboBox(Components[i]).Enabled := False;
      TComboBox(Components[i]).color := clBtnFace;
    end;
    if Components[i] is TCheckBox then
      TCheckBox(Components[i]).Checked := False;
  end;
  date27.Enabled := False;
  time27.Enabled := False;
  date27.Color := clBtnFace;
  time27.Color := clBtnFace;
  date27.Date := Now;
  time27.Time := Now;
  date97.Enabled := False;
  date97.DateTime := Now;
  date97.Color := clBtnFace;
  cxCheckListBox56.Enabled := False;
  cxCheckListBox1.Enabled := False;
  cxCheckListBox2.Enabled := False;
  cxCheckListBox3.Enabled := False;
  cxCheckListBox4.Enabled := False;
  ProgressBar1.Visible := false;
  ProgressBar1.StepBy(0);
   //Self.Height:=497;
  BitBtnSet.Enabled := true;
  if CurrentDev <> nil then
    EditCar.Text := CurrentDev.Car.No;
  EditCar.Color := clInfoBk;
  ShowParamToEdit(CurrentDev);
  RzCheckBoxSelectAll.Checked := False;
end;

function TParamFrm.GetCxCheckListBoxValue(cxCheckListBox: TcxCheckListBox): Integer;
//0a00H	功能屏蔽标志	占用16个字节 ，共128个功能可以受控
  function GetChecked(ItemIndex: Byte): Byte;
  begin
    if cxCheckListBox.Items[ItemIndex].Checked then
      Result := 1
    else
      Result := 0;
  end;
var
  b: array[0..31] of byte;
  sndAry: array[0..3] of byte;
  i, j, k: Integer;
  tmp: Byte;
begin
  FillChar(b, 32, 0);
  for i:=0 to 31 do
  begin
    b[i] := GetChecked(i);
  end;
  
  //设置初值为0
  for i := 0 to Length(sndAry) - 1 do
  begin
    sndAry[i] := 0;
  end;

  i := 0;
  //取出 0-31，共4个字节。12 13 14 15
  while i <= 31 do
  begin
    k := i mod 8;
    if k = 0 then tmp := 0;
    tmp := tmp + b[i] shl k;
    if k = 7 then
      sndAry[3 - i div 8] := tmp;
    inc(i);
  end;
  Result := (sndAry[0] shl 24) +  (sndAry[1] shl 16) +(sndAry[2] shl 8) + sndAry[3];
end;

procedure TParamFrm.ParamSaveToDev(Dev: TDevice);
begin
  if CheckBox12.Checked then
  begin
    Dev.Param.ZDXTSJ_0001 := Edit12.Text;
    BS.SaveDevParam(Dev.fact_id, Dev.Id, $0001, Dev.Param.ZDXTSJ_0001);
  end;
  if CheckBox34.Checked then
  begin
    Dev.Param.TCPYDCS_0002 := edit34.Text;
    BS.SaveDevParam(Dev.fact_id, Dev.Id, $0002, Dev.Param.TCPYDCS_0002);
  end;

  if CheckBox13.Checked then
  begin
    Dev.Param.TCPCC_0003 := edit13.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.Id, $0003, Dev.Param.TCPCC_0003);
  end;

  if CheckBox59.Checked then
  begin
    Dev.Param.SMSYDCS_0004 := edit59.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.Id, $0004, Dev.Param.SMSYDCS_0004);
  end;
  if CheckBox60.Checked then
  begin
    Dev.Param.SMSCC_0005 := edit60.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.Id, $0005, Dev.Param.SMSCC_0005);
  end;

  if CheckBox6.Checked then
  begin
    Dev.Param.ZFWQAPN_0010 := edit6.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.Id, $0010, Dev.Param.ZFWQAPN_0010);
  end;
  if CheckBox61.Checked then
  begin
    Dev.Param.ZFWQYH_0011 := edit61.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.Id, $0011, Dev.Param.ZFWQYH_0011);
  end;
  if CheckBox62.Checked then
  begin
    Dev.Param.ZFWQMM_0012 := edit62.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.Id, $0012, Dev.Param.ZFWQMM_0012);
  end;
  if CheckBox7.Checked then
  begin
    Dev.Param.ZFWQDZ_0013 := edit7.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.Id, $0013, Dev.Param.ZFWQDZ_0013);
  end;
  if CheckBox63.Checked then
  begin
    Dev.Param.BFFWQAPN_0014 := edit63.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.Id, $0014, Dev.Param.BFFWQAPN_0014);
  end;
  if CheckBox11.Checked then
  begin
    Dev.Param.BFFWQYH_0015 := edit11.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.Id, $0015, Dev.Param.BFFWQYH_0015);
  end;
  if CheckBox64.Checked then
  begin
    Dev.Param.BFFWQMM_0016 := edit64.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.Id, $0016, Dev.Param.BFFWQMM_0016);
  end;
  if CheckBox9.Checked then
  begin
    Dev.Param.BFFWQDZ_0017 := edit9.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.Id, $0017, Dev.Param.BFFWQDZ_0017);
  end;
  if CheckBox65.Checked then
  begin
    Dev.Param.TCPDK_0018 := edit65.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.Id, $0018, Dev.Param.TCPDK_0018);
  end;
  {if checkbox81.Checked then
  begin
    dev.Param.JJQTJSJ_0091 := FormatDateTime('YY-MM-DD', date81.DateTime) + ' '+ FormatDateTime('hh:nn', time81.DateTime);
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0091, Dev.Param.JJQTJSJ_0091);
  end;
  if CheckBox82.Checked then
  begin
    Dev.Param.JJQTJCC_0090 := Edit82.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0090, Dev.Param.JJQTJCC_0090);
  end;    }
  if CheckBox14.Checked then
  begin
    Dev.Param.WZHBCL_0020 := IntToStr(Edit14.ItemIndex);
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0020, Dev.Param.WZHBCL_0020);
  end;
  if CheckBox15.Checked then
  begin
    Dev.Param.WZHBFA_0021 := IntToStr(Edit15.ItemIndex);
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0021, Dev.Param.WZHBFA_0021);
  end;
  if CheckBox351.Checked then
  begin
    dev.Param.WDLSJJG_0022 := Edit351.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0022, Dev.Param.WDLSJJG_0022);
  end;
  if CheckBox353.Checked then
  begin
    dev.Param.ACC_OFFSJJG_0023 := Edit353.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0023, Dev.Param.ACC_OFFSJJG_0023);
  end;
  if CheckBox355.Checked then
  begin
    dev.Param.ACC_ONSJJG_0024 := Edit355.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0024, Dev.Param.ACC_ONSJJG_0024);
  end;
  if CheckBox357.Checked then
  begin
    dev.Param.KCSJJG_0025 := Edit357.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0025, Dev.Param.KCSJJG_0025);
  end;
  if CheckBox359.Checked then
  begin
    dev.Param.ZCSJJG_0026 := Edit359.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0026, Dev.Param.ZCSJJG_0026);
  end;
  if CheckBox361.Checked then
  begin
    dev.Param.XMSJJG_0027 := Edit361.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0027, Dev.Param.XMSJJG_0027);
  end;
  if CheckBox362.Checked then
  begin
    dev.Param.JJBJSJJG_0028 := Edit362.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0028, Dev.Param.JJBJSJJG_0028);
  end;
  if CheckBox352.Checked then
  begin
    dev.Param.WDLJLJG_0029 := Edit352.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0029, Dev.Param.WDLJLJG_0029);
  end;
  if CheckBox354.Checked then
  begin
    dev.Param.ACC_OFFJLJG_002A := Edit354.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $002A, Dev.Param.ACC_OFFJLJG_002A);
  end;
  if CheckBox356.Checked then
  begin
    dev.Param.ACC_ONJLJG_002B := Edit356.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $002B, Dev.Param.ACC_ONJLJG_002B);
  end;
  if CheckBox358.Checked then
  begin
    dev.Param.KCJLJG_002C := Edit358.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $002C, Dev.Param.KCJLJG_002C);
  end;
  if CheckBox360.Checked then
  begin
    dev.Param.ZCJLJG_002D := Edit360.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $002D, Dev.Param.ZCJLJG_002D);
  end;
  if CheckBox364.Checked then
  begin
    dev.Param.XMJLJG_002E := Edit364.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $002E, Dev.Param.XMJLJG_002E);
  end;
  if CheckBox365.Checked then
  begin
    dev.Param.JJBJJLJG_002F := Edit365.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $002F, Dev.Param.JJBJJLJG_002F);
  end;
  if CheckBox363.Checked then
  begin
    dev.Param.GDBCJD_0030 := Edit363.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0030, Dev.Param.GDBCJD_0030);
  end;

  if CheckBox66.Checked then
  begin
    dev.Param.JKPTDH_0040 := Edit66.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0040, Dev.Param.JKPTDH_0040);
  end;
  if CheckBox3.Checked then
  begin
    dev.Param.FWDH_0041 := Edit3.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0041, Dev.Param.FWDH_0041);
  end;
  if CheckBox67.Checked then
  begin
    dev.Param.HFCCSZDH_0042 := Edit67.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0042, Dev.Param.HFCCSZDH_0042);
  end;
  if CheckBox4.Checked then
  begin
    dev.Param.JKPTSMSDH_0043 := Edit4.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0043, Dev.Param.JKPTSMSDH_0043);
  end;
  if CheckBox5.Checked then
  begin
    dev.Param.JSZDSMSWBBJDH_0044 := Edit5.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0044, Dev.Param.JSZDSMSWBBJDH_0044);
  end;
  if CheckBox57.Checked then
  begin
    dev.Param.ZDDHJTCL_0045 := IntToStr(Edit57.ItemIndex);
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0045, Dev.Param.ZDDHJTCL_0045);
  end;
  if CheckBox55.Checked then
  begin
    dev.Param.MCZCTHSJ_0046 := Edit55.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0046, Dev.Param.MCZCTHSJ_0046);
  end;
  if CheckBox68.Checked then
  begin
    dev.Param.DYZCTHSJ_0047 := Edit68.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0047, Dev.Param.DYZCTHSJ_0047);
  end;
  if CheckBox36.Checked then
  begin
    dev.Param.DHHMCD_0048 := Edit36.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0048, Dev.Param.DHHMCD_0048);
  end;
  if CheckBox2.Checked then
  begin
    dev.Param.JTDHHM_0049 := Edit2.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0049, Dev.Param.JTDHHM_0049);
  end;

  if CheckBox56.Checked then
  begin
    Dev.Param.BJPBZ_0050 := IntToStr(GetCxCheckListBoxValue(cxCheckListBox56));
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0050, Dev.Param.BJPBZ_0050);
  end;
  if CheckBox77.Checked then
  begin
    Dev.Param.BJFSWBSMSKG_0051 := IntToStr(GetCxCheckListBoxValue(cxCheckListBox1));
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0051, Dev.Param.BJFSWBSMSKG_0051);
  end;
  if CheckBox78.Checked then
  begin
    Dev.Param.BJPSKG_0052 := IntToStr(GetCxCheckListBoxValue(cxCheckListBox2));
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0052, Dev.Param.BJPSKG_0052);
  end;
  if CheckBox79.Checked then
  begin
    Dev.Param.BJPSCCKG_0053 := IntToStr(GetCxCheckListBoxValue(cxCheckListBox3));
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0053, Dev.Param.BJPSCCKG_0053);
  end;
  if CheckBox80.Checked then
  begin
    Dev.Param.GJBJBZ_0054 := IntToStr(GetCxCheckListBoxValue(cxCheckListBox4));
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0054, Dev.Param.GJBJBZ_0054);
  end;

  if CheckBox16.Checked then
  begin
    Dev.Param.ZGSD_0055 := Edit16.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0055, Dev.Param.ZGSD_0055);
  end;
  if CheckBox47.Checked then
  begin
    Dev.Param.CSCXSJ_0056 := Edit47.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0056, Dev.Param.CSCXSJ_0056);
  end;
  if CheckBox422.Checked then
  begin
    Dev.Param.LXJSSJ_0057 := Edit422.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0057, Dev.Param.LXJSSJ_0057);
  end;
  if CheckBox421.Checked then
  begin
    Dev.Param.ZXXXSJ_0058 := Edit421.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0058, Dev.Param.ZXXXSJ_0058);
  end;
  if CheckBox423.Checked then
  begin
    Dev.Param.ZCTCSJ_0059 := Edit423.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0059, Dev.Param.ZCTCSJ_0059);
  end;
  if CheckBox424.Checked then
  begin
    Dev.Param.DTLJJSSJ_005A := Edit424.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $005A, Dev.Param.DTLJJSSJ_005A);
  end;

  if CheckBox69.Checked then
  begin
    Dev.Param.TXSPZL_0070 := Edit69.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0070, Dev.Param.TXSPZL_0070);
  end;
  if CheckBox70.Checked then
  begin
    Dev.Param.LD_0071 := Edit70.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0071, Dev.Param.LD_0071);
  end;
  if CheckBox71.Checked then
  begin
    Dev.Param.DBD_0072 := Edit71.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0072, Dev.Param.DBD_0072);
  end;
  if CheckBox72.Checked then
  begin
    Dev.Param.BHD_0073 := Edit72.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0073, Dev.Param.BHD_0073);
  end;
  if CheckBox73.Checked then
  begin
    Dev.Param.SD_0074 := Edit73.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0074, Dev.Param.SD_0074);
  end;

  if CheckBox74.Checked then
  begin
    Dev.Param.CLLCBDS_0080 := Edit74.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0080, Dev.Param.CLLCBDS_0080);
  end;
  if CheckBox75.Checked then
  begin
    Dev.Param.CLSZSYID_0081 := Edit75.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0081, Dev.Param.CLSZSYID_0081);
  end;
  if CheckBox76.Checked then
  begin
    Dev.Param.CLSZSYID_0082 := Edit76.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0082, Dev.Param.CLSZSYID_0082);
  end;
  if CheckBox83.Checked then
  begin
    Dev.Param.MCUID_F001 := Edit83.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $F001, Dev.Param.MCUID_F001);
  end;
  if CheckBox33.Checked then
  begin
    Dev.Param.KZCJC_F002 := IntToStr(Edit33.ItemIndex);
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $F002, Dev.Param.KZCJC_F002);
  end;

  if CheckBox1.Checked then
  begin
    Dev.Param.JJQYYCSXZ_0090 := Edit1.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0090, Dev.Param.JJQYYCSXZ_0090);
  end;

  if CheckBox27.Checked then
  begin
    Dev.Param.JJQYYSJXZ_0091 := Trim(EditYear.Text) + Trim(EditMonth.Text) + Trim(EditDay.Text)
                                + Trim(EditHour.Text); //FormatDateTime('YY-MM-DD', date27.DateTime) + ' '+ FormatDateTime('hh:nn:ss', time27.DateTime);;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0091, Dev.Param.JJQYYSJXZ_0091);
  end;

  if CheckBox100.Checked then
  begin
    Dev.Param.MCULYMS_00A0 := IntToStr(Edit100.ItemIndex + 1);
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $00A0, Dev.Param.MCULYMS_00A0);
  end;

  if CheckBox28.Checked then
  begin
    Dev.Param.MCULYWJZDCD_00A1 := Edit28.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $00A1, Dev.Param.MCULYWJZDCD_00A1);
  end;

  if CheckBox29.Checked then
  begin
    Dev.Param.LCDXTJG_00A2 := Edit29.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $00A2, Dev.Param.LCDXTJG_00A2);
  end;

  if CheckBox30.Checked then
  begin
    Dev.Param.LEDXTJG_00A3 := Edit30.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $00A3, Dev.Param.LEDXTJG_00A3);
  end;

  if CheckBox31.Checked then
  begin
    Dev.Param.ACCOFFXMSJ_00AF := Edit31.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $00AF, Dev.Param.ACCOFFXMSJ_00AF);
  end;



  if CheckBox32.Checked then
  begin
    Dev.Param.SPFWQMS_00B0 := IntToStr(Edit32.ItemIndex);
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $00B0, Dev.Param.SPFWQMS_00B0);
  end;

  if CheckBox99.Checked then
  begin
    Dev.Param.SPFWQAPN_00B1 := Edit99.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $00B1, Dev.Param.SPFWQAPN_00B1);
  end;

  if CheckBox50.Checked then
  begin
    Dev.Param.SPFWQHYM_00B2 := Edit50.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $00B2, Dev.Param.SPFWQHYM_00B2);
  end;

  if CheckBox51.Checked then
  begin
    Dev.Param.SPFWQMM_00B3 := Edit51.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $00B3, Dev.Param.SPFWQMM_00B3);
  end;

  if CheckBox52.Checked then
  begin
    Dev.Param.SPFWQIP_00B4 := Edit52.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $00B4, Dev.Param.SPFWQIP_00B4);
  end;

  if CheckBox53.Checked then
  begin
    Dev.Param.SPFWQDK_00B5 := Edit53.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $00B5, Dev.Param.SPFWQDK_00B5);
  end;

  if CheckBox26.Checked then
  begin
    dev.Param.TTSYL_004B := Edit26.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $004B, Dev.Param.TTSYL_004B);
  end;

  if CheckBox81.Checked then
  begin
    dev.Param.BFTCPDK_0019 := Edit81.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $0019, Dev.Param.BFTCPDK_0019);
  end;

  if CheckBox82.Checked then
  begin
    Dev.Param.MCUWHMM_004A := Edit82.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.id, $004A, Dev.Param.MCUWHMM_004A);
  end;

  if CheckBox85.Checked then
  begin
    Dev.Param.UDPXXYDCS_0004 := Edit85.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.Id, $0004, Dev.Param.UDPXXYDCS_0004);
  end;

  if CheckBox90.Checked then
  begin
    Dev.Param.QSSJHB_0029 := Edit90.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.Id, $0029, Dev.Param.QSSJHB_0029);
  end;

  if CheckBox86.Checked then
  begin
    Dev.Param.UDPXXCCCS_0005 := Edit86.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.Id, $0005, Dev.Param.UDPXXCCCS_0005);
  end;

  if CheckBox87.Checked then
  begin
    Dev.Param.UDPPORT_0019 := Edit87.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.Id, $0019, Dev.Param.UDPPORT_0019);
  end;

  if CheckBox91.Checked then
  begin
    Dev.Param.QSJLHB_002C := Edit91.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.Id, $002C, Dev.Param.QSJLHB_002C);
  end;

  if CheckBox92.Checked then
  begin
    Dev.Param.JKPTTQHM_0049 := Edit92.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.Id, $0049, Dev.Param.JKPTTQHM_0049);
  end;

  if CheckBox88.Checked then
  begin
    Dev.Param.CARNO_0083 := Edit88.Text;
    Bs.SaveDevParam(Dev.fact_id, Dev.Id, $0083, Dev.Param.CARNO_0083);
  end;

  if CheckBox89.Checked then
  begin
    Dev.Param.CPColor_0084 := IntToStr(Edit89.ItemIndex);
    Bs.SaveDevParam(Dev.fact_id, Dev.Id, $0084, Dev.Param.CPColor_0084);
  end;
end;

procedure TParamFrm.ShowParamToEdit(Dev: TDevice);
var
  buf: array[0..500] of byte;
  len, i: Integer;
  paramStr: string;
  temp: Integer;
begin
  if Dev = nil then Exit;
  temp := 0;
  Edit12.Text := Dev.Param.ZDXTSJ_0001;
  Edit34.Text := Dev.Param.TCPYDCS_0002;
  Edit13.Text := Dev.Param.TCPCC_0003;
  Edit59.Text := Dev.Param.SMSYDCS_0004;
  Edit60.Text := Dev.Param.SMSCC_0005;
  Edit6.Text := Dev.Param.ZFWQAPN_0010;
  Edit61.Text := Dev.Param.ZFWQYH_0011;
  Edit62.Text := Dev.Param.ZFWQMM_0012;
  Edit7.Text := Dev.Param.ZFWQDZ_0013;
  Edit63.Text := Dev.Param.BFFWQAPN_0014;
  Edit11.Text := Dev.Param.BFFWQYH_0015;
  Edit64.Text := Dev.Param.BFFWQMM_0016;
  Edit9.Text := Dev.Param.BFFWQDZ_0017;
  Edit65.Text := Dev.Param.TCPDK_0018;
  Edit85.Text := Dev.Param.UDPXXYDCS_0004;
  Edit90.Text := Dev.Param.QSSJHB_0029;
  Edit86.Text := Dev.Param.UDPXXCCCS_0005;
  Edit87.Text := Dev.Param.UDPPORT_0019;
  Edit91.Text := Dev.Param.QSJLHB_002C;
  Edit92.Text := Dev.Param.JKPTTQHM_0049;
  Edit88.Text := Dev.Param.CARNO_0083;
  if Dev.Param.CPColor_0084 = '' then
    Edit89.ItemIndex := -1
  else
    Edit89.ItemIndex := StrToInt(Dev.Param.CPColor_0084);
  {if Trim(Dev.Param.JJQTJSJ_0091)  = '' then
  begin
    date81.DateTime := StrToDateTime('2000-01-01 01:01:01');
    time81.DateTime := StrToDateTime('2000-01-01 01:01:01');
  end
  else
  begin
    date81.DateTime := StrToDateTime(Dev.Param.JJQTJSJ_0091);
    time81.DateTime := StrToDateTime(Dev.Param.JJQTJSJ_0091);
  end;
  Edit82.Text := dev.Param.JJQTJCC_0090;  }
  if dev.Param.WZHBCL_0020 = '' then
     Edit14.ItemIndex := -1
  else
    Edit14.ItemIndex := StrToInt(dev.Param.WZHBCL_0020);
  if dev.Param.WZHBFA_0021 = '' then
    Edit15.ItemIndex := -1
  else
    Edit15.ItemIndex := StrToInt(dev.Param.WZHBFA_0021);
  Edit351.Text := dev.Param.WDLSJJG_0022;
  Edit353.Text := dev.Param.ACC_OFFSJJG_0023;
  Edit355.Text := dev.Param.ACC_ONSJJG_0024;
  Edit357.Text := dev.Param.KCSJJG_0025;
  Edit359.Text := dev.Param.ZCSJJG_0026;
  Edit361.Text := dev.Param.XMSJJG_0027;
  Edit362.Text := dev.Param.JJBJSJJG_0028;
  Edit352.Text := dev.Param.WDLJLJG_0029;
  Edit354.Text := dev.Param.ACC_OFFJLJG_002A;
  Edit356.Text := dev.Param.ACC_ONJLJG_002B;
  Edit358.Text := dev.Param.KCJLJG_002C;
  Edit360.Text := dev.Param.ZCJLJG_002D;
  Edit364.Text := dev.Param.XMJLJG_002E;
  Edit365.Text := dev.Param.JJBJJLJG_002F;
  Edit363.Text := dev.Param.GDBCJD_0030;


  Edit66.Text := dev.Param.JKPTDH_0040;
  Edit3.Text := dev.Param.FWDH_0041;
  Edit67.Text := dev.Param.HFCCSZDH_0042;
  Edit4.Text := dev.Param.JKPTSMSDH_0043;
  Edit5.Text :=dev.Param.JSZDSMSWBBJDH_0044;
  if dev.Param.ZDDHJTCL_0045 = '' then
    Edit57.ItemIndex := -1
  else
    Edit57.ItemIndex := StringToInteger(dev.Param.ZDDHJTCL_0045);
  Edit55.Text := dev.Param.MCZCTHSJ_0046;
  Edit68.Text := dev.Param.DYZCTHSJ_0047;
  Edit36.Text := dev.Param.DHHMCD_0048;
  Edit2.Text := dev.Param.JTDHHM_0049;

  temp := StringToInteger(dev.Param.BJPBZ_0050);
  i:=0;
  while i<32 do //0-32
  begin
    cxCheckListBox56.Items[i].Checked := ((temp shr i) and 1) = 1; //ParamByte[3 - i div 8] and (1 shl (i mod 8)) = (1 shl (i mod 8));
    inc(i);
  end;

  temp := StringToInteger(dev.Param.BJFSWBSMSKG_0051);
  i:=0;
  while i<32 do //0-32
  begin
    cxCheckListBox1.Items[i].Checked := ((temp shr i) and 1) = 1; // ParamByte[3 - i div 8] and (1 shl (i mod 8)) = (1 shl (i mod 8));
    inc(i);
  end;

  temp := StringToInteger(dev.Param.BJPSKG_0052);
  i:=0;
  while i<32 do //0-32
  begin
    cxCheckListBox2.Items[i].Checked := ((temp shr i) and 1) = 1; // ParamByte[3 - i div 8] and (1 shl (i mod 8)) = (1 shl (i mod 8));
    inc(i);
  end;

  temp := StringToInteger(dev.Param.BJPSCCKG_0053);
  i:=0;
  while i<32 do //0-32
  begin
    cxCheckListBox3.Items[i].Checked := ((temp shr i) and 1) = 1; // ParamByte[3 - i div 8] and (1 shl (i mod 8)) = (1 shl (i mod 8));
    inc(i);
  end;

  temp := StringToInteger(dev.Param.GJBJBZ_0054);
  i:=0;
  while i<32 do //0-32
  begin
    cxCheckListBox4.Items[i].Checked := ((temp shr i) and 1) = 1; // ParamByte[3 - i div 8] and (1 shl (i mod 8)) = (1 shl (i mod 8));
    inc(i);
  end;

  Edit16.Text := dev.Param.ZGSD_0055;
  Edit47.Text := dev.Param.CSCXSJ_0056;
  Edit422.Text := dev.Param.LXJSSJ_0057;
  Edit421.Text := dev.Param.ZXXXSJ_0058;
  Edit423.Text := dev.Param.ZCTCSJ_0059;
  Edit424.Text := dev.Param.DTLJJSSJ_005A;;

  Edit69.Text := dev.Param.TXSPZL_0070;
  Edit70.Text := dev.Param.LD_0071;
  Edit71.Text := dev.Param.DBD_0072;
  Edit72.Text := dev.Param.BHD_0073;
  Edit73.Text := dev.Param.SD_0074;

  Edit74.Text := dev.Param.CLLCBDS_0080;
  Edit75.Text := dev.Param.CLSZSYID_0081;
  Edit76.Text := dev.Param.CLSZSYID_0082;

  Edit1.Text := Dev.Param.JJQYYCSXZ_0090;

  if length(Trim(Dev.Param.JJQYYSJXZ_0091)) < 10 then
  begin
    EditYear.Text := '0000';
    EditMonth.Text := '00';
    EditDay.Text := '00';
    EditHour.Text := '00';
    //date27.DateTime := StrToDateTime('2000-01-01 01:01:01');
    //time27.DateTime := StrToDateTime('2000-01-01 01:01:01');
  end
  else
  begin
    EditYear.Text := Copy(Dev.Param.JJQYYSJXZ_0091,1,2) + Copy(Dev.Param.JJQYYSJXZ_0091,3,2);
    EditMonth.Text := Copy(Dev.Param.JJQYYSJXZ_0091,5,2);
    EditDay.Text := Copy(Dev.Param.JJQYYSJXZ_0091,7,2);
    EditHour.Text := Copy(Dev.Param.JJQYYSJXZ_0091,9,2);
    //date27.DateTime := StrToDateTime(Dev.Param.JJQYYSJXZ_0091);
    //time27.DateTime := StrToDateTime(Dev.Param.JJQYYSJXZ_0091);
  end;

  if dev.Param.MCULYMS_00A0 = '' then
    Edit100.ItemIndex := -1
  else
    Edit100.ItemIndex := StringToInteger(dev.Param.MCULYMS_00A0)-1;

  Edit28.Text := dev.Param.MCULYWJZDCD_00A1;

  Edit28.Text := dev.Param.MCULYWJZDCD_00A1;
  Edit29.Text := dev.Param.LCDXTJG_00A2;
  Edit30.Text := dev.Param.LEDXTJG_00A3;
  Edit31.Text := dev.Param.ACCOFFXMSJ_00AF;
  if dev.Param.SPFWQMS_00B0 = '' then
    Edit32.ItemIndex := -1
  else
    Edit32.ItemIndex := StringToInteger(dev.Param.SPFWQMS_00B0);
  Edit99.Text := dev.Param.SPFWQAPN_00B1;
  Edit50.Text := dev.Param.SPFWQHYM_00B2;

  Edit51.Text := dev.Param.SPFWQMM_00B3;
  Edit52.Text := dev.Param.SPFWQIP_00B4;
  Edit53.Text := dev.Param.SPFWQDK_00B5;
  Edit26.Text := Dev.Param.TTSYL_004B;

  Edit81.Text := Dev.Param.BFTCPDK_0019;
  Edit82.Text := Dev.Param.MCUWHMM_004A;

  if Dev.Param.KZCJC_F002 = '' then
    Edit33.ItemIndex := -1
  else
    Edit33.ItemIndex := StringToInteger(Dev.Param.KZCJC_F002);


 { Edit1.Text := Dev.Param.CurrentIntegral;
  edit2.Text := Dev.Param.MonitorTelNum;
  edit3.Text := Dev.Param.RestorationTeLNum;
  edit4.Text := Dev.Param.NoteServiceCenterNum;
  edit5.Text := Dev.Param.NoteAlarmCenterNum;
  edit6.Text := Dev.Param.APN;
  edit7.Text := Dev.Param.IP_MainCenter;
  edit8.Text := Dev.Param.DomainNameOfMainCenter;
  edit9.Text := Dev.Param.IP_AssistantCenter;
  edit10.Text := Dev.Param.DomainNameOfAssistantCenter;
  edit11.Text := Dev.Param.PortOfCenter;
  edit12.Text := Dev.Param.HeartbeatInterval;
  edit13.Text := Dev.Param.DNS_IP;
  //edit14.Text := Dev.Param.DevID;
  //edit15.Text := Dev.Param.Password;
  edit16.Text := Dev.Param.Overspeed;

  if (Dev.Param.isTurnBrandPhoto = '是') then
    Edit17.ItemIndex := 1
  else if (Dev.Param.isTurnBrandPhoto = '否') then
    Edit17.ItemIndex := 0
  else if Dev.Param.isTurnBrandPhoto <> '' then
  begin
    try
      Edit17.ItemIndex := StrToInt(Dev.Param.isTurnBrandPhoto);
    except
      edit17.ItemIndex := -1;
    end;
  end
  else
    Edit17.ItemIndex := -1;

  if (Dev.Param.isCloseDoorPhoto = '是') then
    edit18.ItemIndex := 1
  else if (Dev.Param.isCloseDoorPhoto = '否') then
    edit18.ItemIndex := 0
  else if Dev.Param.isCloseDoorPhoto <> '' then
  begin
    try
      edit18.ItemIndex := StrToInt(Dev.Param.isCloseDoorPhoto);
    except
      edit18.ItemIndex := -1;
    end;
  end
  else
    edit18.ItemIndex := -1;

  if (Dev.Param.isSaveAlarmPhoto = '是') then
    edit19.ItemIndex := 1
  else if (Dev.Param.isSaveAlarmPhoto = '否') then
    edit19.ItemIndex := 0
  else if Dev.Param.isSaveAlarmPhoto <> '' then
  begin
    try
      edit19.ItemIndex := StrToInt(Dev.Param.isSaveAlarmPhoto);
    except
      edit19.ItemIndex := -1;
    end;
  end
  else
    edit19.ItemIndex := -1;

  edit20.Text := Dev.Param.IP_MainPhoto;
  edit21.Text := Dev.Param.DomainNameOfMainPhoto;
  edit22.Text := Dev.Param.IP_AssistantPhoto;
  edit23.Text := Dev.Param.DomainNameOfAssistantPhoto;
  edit24.Text := Dev.Param.PortOfPhoto;
  edit25.Text := Dev.Param.SavePhotoTimeBegin;
  edit252.Text := Dev.Param.SavePhotoTimeEnd;
  edit26.Text := Dev.Param.OrderFormTurnTime;
  edit28.Text := Dev.Param.ICIP;
  edit29.Text := Dev.Param.ICPort;
  edit30.Text := Dev.Param.ICIPBak;
  edit31.Text := Dev.Param.ICPortBak;
  edit32.Text := Dev.Param.ICUser;
  edit33.Text := Dev.Param.ICPassword;
  try
    if Length(Dev.Param.TaxiMetaStopDateTime) = 12 then
    begin
      DateTimePicker1.Date := StrToDate(Copy(Dev.Param.TaxiMetaStopDateTime, 1, 10));
      Edit27.Text := Copy(Dev.Param.TaxiMetaStopDateTime, 11, 2);
    end
    else
    begin
      DateTimePicker1.Date := StrToDate('2000-01-01');
      Edit27.Text := '';
    end;
  except
    DateTimePicker1.Date := StrToDate('2000-01-01');
    Edit27.Text := '';
  end;

   //---------------------
   //34 090d
  Edit34.Text := Dev.Param.Param090d;
   //35: 0900
  HexStringToBytes(dev.Param.Param0900, len, @buf[0]);
  Edit351.Text := dev.Param.PursueInterval; //IntToStr(buf[0] * 256 + buf[1]);
  Edit352.Text := IntToStr(buf[2] * 256 + buf[3]);
  Edit353.Text := IntToStr(buf[4] * 256 + buf[5]);
  Edit354.Text := IntToStr(buf[6] * 256 + buf[7]);
  Edit355.Text := IntToStr(buf[8] * 256 + buf[9]);
  Edit356.Text := IntToStr(buf[10] * 256 + buf[11]);
  Edit357.Text := IntToStr(buf[12] * 256 + buf[13]);
  edit358.Text := IntToStr(buf[14] * 256 + buf[15]);
  //36
  edit36.Text := Dev.Param.param090F;
   // 37:0901
  HexStringToBytes(dev.Param.Param0901, len, @buf[0]);
  Edit371.Text := IntToStr(buf[0] * 256 + buf[1]);
  Edit372.Text := IntToStr(buf[2] * 256 + buf[3]);
  Edit373.Text := IntToStr(buf[4] * 256 + buf[5]);
   // 38: 0902
  if dev.Param.Param0902 <> '' then
  begin
    HexStringToBytes(dev.Param.Param0902, len, @buf[0]);
    Edit381.ItemIndex := buf[0];
    //拍照摄像头 buf[1]
    cxCheckBoxPljsPIc1.Checked := buf[1] and $01 = $01;
    cxCheckBoxPljsPIc2.Checked := buf[1] and $02 = $02;
    cxCheckBoxPljsPIc3.Checked := buf[1] and $04 = $04;
    cxCheckBoxPljsPIc4.Checked := buf[1] and $08 = $08;
    Edit382.Text := IntToStr(buf[2] * 256 + buf[3]);
  end
  else
  begin
    Edit381.ItemIndex := -1;
    cxCheckBoxPljsPIc1.Checked := False;
    cxCheckBoxPljsPIc2.Checked := False;
    cxCheckBoxPljsPIc3.Checked := False;
    cxCheckBoxPljsPIc4.Checked := False;
    Edit382.Text := '';
  end;
   //39
  if Dev.Param.Param0903 <> '' then
    Edit39.itemIndex := StrToInt(Dev.Param.Param0903)
  else
    Edit39.itemIndex := -1;
   //40
  if Dev.Param.param0904 <> '' then
    edit40.ItemIndex := StrToInt(Dev.Param.param0904)
  else
    edit40.itemIndex := -1;
    // 41:  0905;
  HexStringToBytes(dev.Param.Param0905, len, @buf[0]);
  Edit411.Text := IntToStr(buf[0] * 256 + buf[1]);
  Edit412.Text := IntToStr(buf[2] * 256 + buf[3]);
    // 42:  0906;
  HexStringToBytes(dev.Param.Param0906, len, @buf[0]);
  Edit421.Text := IntToStr(buf[0] * 256 + buf[1]);
  Edit422.Text := IntToStr(buf[2] * 256 + buf[3]);
    // 43:  0907
  if Dev.Param.Param0907 <> '' then
  begin
    HexStringToBytes(dev.Param.Param0907, len, @buf[0]);
    Edit431.ItemIndex := buf[0];
    SetLength(paramStr, len - 1);
    CopyMemory(@paramStr[1], @buf[1], len - 1);
    Edit432.Text := paramStr;
  end
  else
  begin
    Edit431.ItemIndex := -1;
    edit432.Text := '';
  end;
    //  44: 0908
  if dev.Param.Param0908 <> '' then
  begin
    HexStringToBytes(dev.Param.Param0908, len, @buf[0]);
    Edit441.ItemIndex := buf[0];
    SetLength(paramStr, len - 1);
    CopyMemory(@paramStr[1], @buf[1], len - 1);
    Edit442.Text := paramStr;
  end
  else
  begin
    Edit441.ItemIndex := -1;
    Edit442.Text := '';
  end;
    //  45: 0909
  if Dev.Param.Param0909 <> '' then
  begin
    HexStringToBytes(dev.Param.Param0909, len, @buf[0]);
    Edit451.Text := IntToStr(buf[0]);
    SetLength(paramStr, len - 1);
    CopyMemory(@paramStr[1], @buf[1], len - 1);
    Edit452.Text := paramStr;
  end
  else
  begin
    edit451.Text := '';
    edit452.Text := '';
  end;
    //46 090A
  if dev.Param.Param090A <> '' then
  begin
    HexStringToBytes(dev.Param.Param090A, len, @buf[0]);
    Edit461.Text := IntToStr(buf[0]);
    SetLength(paramStr, len - 1);
    CopyMemory(@paramStr[1], @buf[1], len - 1);
    Edit462.Text := paramStr;
  end
  else
  begin
    Edit461.Text := '';
    Edit462.Text := '';
  end;
    //47
  Edit47.Text := Dev.Param.param090B;
   //48 $090c: //'超速报警拍照';
  if dev.Param.Param090C <> '' then
  begin
    HexStringToBytes(dev.Param.Param090C, len, @buf[0]);
    Edit481.ItemIndex := buf[0];
    //拍照摄像头 ParamByte[1]
    cxCheckBoxOverSpeedPic1.Checked := buf[1] and $01 = $01;
    cxCheckBoxOverSpeedPic2.Checked := buf[1] and $02 = $02;
    cxCheckBoxOverSpeedPic3.Checked := buf[1] and $04 = $04;
    cxCheckBoxOverSpeedPic4.Checked := buf[1] and $08 = $08;
    Edit482.Text := IntToStr(buf[2] * 256 + buf[3]);
  end
  else
  begin
    edit481.ItemIndex := -1;
    edit482.Text := '';
    cxCheckBoxOverSpeedPic1.Checked := False;
    cxCheckBoxOverSpeedPic2.Checked := False;
    cxCheckBoxOverSpeedPic3.Checked := False;
    cxCheckBoxOverSpeedPic4.Checked := False;
  end;
  //49-53
  Edit49.Text := Dev.Param.param090E;
  Edit50.Text := Dev.Param.Param0910;
  Edit51.Text := Dev.Param.param0911;
  Edit52.Text := Dev.Param.param0912;
  Edit53.Text := Dev.Param.param0913;
   //54 紧急报警拍照
  HexStringToBytes(Dev.Param.Param0914, len, @buf[0]);
  cxCheckBoxAlarmPic1.Checked := buf[0] and $01 = $01;
  cxCheckBoxAlarmPic2.Checked := buf[0] and $02 = $02;
  cxCheckBoxAlarmPic3.Checked := buf[0] and $04 = $04;
  cxCheckBoxAlarmPic4.Checked := buf[0] and $08 = $08;
  Edit542.Text := IntToStr(buf[1] * 256 + buf[2]);
   //55
  Edit55.Text := Dev.Param.Param0915;
   //56 Param0a00
  HexStringToBytes(dev.Param.Param0a00, len, @buf[0]);
  i := 0;
  while i < 33 do //0-32
  begin
    cxCheckListBox56.Items[i].Checked := buf[15 - i div 8] and (1 shl (i mod 8)) = (1 shl (i mod 8));
    inc(i);
  end;
   //57
  if Dev.Param.Param0A01 = '' then
    Edit57.ItemIndex := -1
  else
    Edit57.ItemIndex := StrToInt(Dev.Param.Param0A01);
   // 58 0A02;
  HexStringToBytes(Dev.Param.Param0A02, len, @buf[0]);
  Edit581.Text := IntToStr(buf[0]);
  Edit582.Text := IntToStr(buf[1]);       }
end;


function TParamFrm.CheckError: boolean;
var
  i: longword;
begin
  Result := false;
  i:= 0;
  if CheckBox12.Checked then //加入判断参数中，中心下发心跳间隔 不能小于60s
  begin
    if StrToInt(Edit12.Text)<30 then
    begin
      MessageBox(Handle,'参数项【中心下发心跳间隔】请输入不小于30的数值!','提示',MB_OK + MB_ICONINFORMATION);
      if Edit12.Enabled then Edit12.SetFocus;
      Exit;
    end;
  end;

  if CheckBox28.Checked then //加入判断参数中，中心下发心跳间隔 不能小于60s
  begin
    if (StrToInt(Edit28.Text)<1) or (StrToInt(Edit28.Text)>255) then
    begin
      MessageBox(Handle,'参数项【MCU录音文件最大时长】请输入1-255的数值!','提示',MB_OK + MB_ICONINFORMATION);
      if Edit28.Enabled then Edit28.SetFocus;
      Exit;
    end;
  end;

  if CheckBox29.Checked then //加入判断参数中，中心下发心跳间隔 不能小于60s
  begin
    if (StrToInt(Edit29.Text)<1) or (StrToInt(Edit29.Text)>60) then
    begin
      MessageBox(Handle,'参数项【LCD心跳时间间隔】请输入1-60的数值!','提示',MB_OK + MB_ICONINFORMATION);
      if Edit29.Enabled then Edit29.SetFocus;
      Exit;
    end;
  end;
  if CheckBox30.Checked then //加入判断参数中，中心下发心跳间隔 不能小于60s
  begin
    if (StrToInt(Edit30.Text)<1) or (StrToInt(Edit30.Text)>60) then
    begin
      MessageBox(Handle,'参数项【LED心跳时间间隔】请输入1-60的数值!','提示',MB_OK + MB_ICONINFORMATION);
      if Edit30.Enabled then Edit30.SetFocus;
      Exit;
    end;
  end;
 { if CheckBox7.Checked then i := CheckIP(edit7);
  if i = $FFFFFFFF then exit;
  if CheckBox9.Checked then i := CheckIP(Edit9);
  if i = $FFFFFFFF then exit;
  if CheckBox13.Checked then i := CheckIP(Edit13);
  if i = $FFFFFFFF then exit;
  if CheckBox20.Checked then i := CheckIP(Edit20);
  if i = $FFFFFFFF then exit;
  if CheckBox22.Checked then i := CheckIP(Edit22);
  if i = $FFFFFFFF then exit;
  if CheckBox28.Checked then i := CheckIP(Edit28);
  if i = $FFFFFFFF then exit;
  if CheckBox30.Checked then i := CheckIP(Edit30);
  if i = $FFFFFFFF then exit;
  if CheckBox51.Checked then i := CheckIP(Edit51);  }
  if i <> $FFFFFFFF then Result := true;
end;



function TParamFrm.SetParam0800(ATargetID: string): boolean;
begin
  Result := SetIPParam(ATargetID, $800, Edit28);
end;

function TParamFrm.SetParam0801(ATargetID: string): boolean;
begin
  Result := SetWordParam(ATargetID, $801, Edit29.Text)
end;

function TParamFrm.SetParam0802(ATargetID: string): boolean;
begin
  Result := SetIPParam(ATargetID, $802, Edit30);
end;

function TParamFrm.SetParam0803(ATargetID: string): boolean;
begin
  Result := SetWordParam(ATargetID, $803, Edit31.Text)
end;

function TParamFrm.SetParam0804(ATargetID: string): boolean;
var
  temp: string;
  Len: integer;
begin
  //Temp := Trim(Edit32.Text);
  //Len := Length(Temp);
  //Result := DataServer.SetDevParam_V3(ATargetID, $804, @temp[1], Len)
end;

function TParamFrm.SetParam0805(ATargetID: string): boolean;
var
  temp: string;
  Len: integer;
begin
  //Temp := Trim(Edit33.Text);
  //Len := Length(Temp);
  //Result := DataServer.SetDevParam_V3(ATargetID, $805, @temp[1], Len)
end;


function TParamFrm.SetParam0900(ATargetID: string; AOnlySaveBj: Boolean = False): boolean;
var
  b: array[0..15] of byte;
  tmpWord: Word;
begin
{汇报间隔	占用16个字节，依次为：
行车时定时汇报间隔（和追踪间隔相同）  2字节  0~65535秒（0不汇报）   默认值：30秒
行车时定距汇报间隔                    2字节  0~65535米（0不汇报）   默认值：500米
停车时定时汇报间隔                    2字节  0~65535秒（0不汇报）   默认值：120秒
超速报警汇报间隔                      2字节  0~65535秒（0不汇报）   默认值：10秒
紧急报警汇报间隔                      2字节  0~65535秒（0不汇报）   默认值：10秒
休眠后汇报间隔                        2字节  0~65535分钟（0不汇报） 默认值：30分钟
休眠时定时唤醒后持续时间              2字节  0~65535分钟（0立即休眠）   默认值：5分钟
短信位置汇报间隔                      2字节  0~65535秒（0不汇报）   默认值：30秒

}
  tmpWord := StrToInt(Edit351.Text);
  b[0] := tmpword div 256;
  b[1] := tmpword mod 256;
  tmpWord := StrToInt(Edit352.Text);
  b[2] := tmpword div 256;
  b[3] := tmpword mod 256;
  tmpWord := StrToInt(Edit353.Text);
  b[4] := tmpword div 256;
  b[5] := tmpword mod 256;
  tmpWord := StrToInt(Edit354.Text);
  b[6] := tmpword div 256;
  b[7] := tmpword mod 256;
  tmpWord := StrToInt(Edit355.Text);
  b[8] := tmpword div 256;
  b[9] := tmpword mod 256;
  tmpWord := StrToInt(Edit356.Text);
  b[10] := tmpword div 256;
  b[11] := tmpword mod 256;
  tmpWord := StrToInt(Edit357.Text);
  b[12] := tmpword div 256;
  b[13] := tmpword mod 256;
  tmpWord := StrToInt(Edit358.Text);
  b[14] := tmpword div 256;
  b[15] := tmpword mod 256;
  CurrentDev.Param.Param0900 := BytesToHexString(@b[0], 16);
  //BS.SaveDevParam(CurrentDev.IdStr, $0900, CurrentDev.Param.Param0900);
  if Edit351.Text<> CurrentDev.Param.PursueInterval then   //同步
  begin
    CurrentDev.Param.PursueInterval := Edit351.Text;
    //BS.SaveDevParam(CurrentDev.IdStr,$2000,Edit351.Text);
  end;
  if not AOnlySaveBj then
    Result := DataServer.SetDevParam_V3(ATargetID, $0900, @b[0], 16);
end;

function TParamFrm.SetParam0901(ATargetID: string; AOnlySaveBj: Boolean = False): boolean;
var
  b: array[0..5] of byte;
  tmpWord: Word;
begin //功耗控制参数
  tmpword := StrToInt(Edit371.Text);
  b[0] := tmpword div 256;
  b[1] := tmpword mod 256;
  tmpword := StrToInt(Edit372.Text);
  b[2] := tmpword div 256;
  b[3] := tmpword mod 256;
  tmpword := StrToInt(Edit373.Text);
  b[4] := tmpword div 256;
  b[5] := tmpword mod 256;

  CurrentDev.Param.Param0901 := BytesToHexString(@b[0], 6);
  //BS.SaveDevParam(CurrentDev.IdStr, $0901, CurrentDev.Param.Param0901);
  if not AOnlySaveBj then
    Result := DataServer.SetDevParam_V3(ATargetID, $0901, @b[0], 6);
end;

function CheckedToByte(chked: Boolean): Byte;
begin
  if chked then
    Result := 1
  else
    Result := 0;
end;

function TParamFrm.SetParam0902(ATargetID: string; AOnlySaveBj: Boolean = False): boolean;

var
  sndAry: array[0..3] of byte;
  b: array[0..7] of byte;
  i: integer;
  tmp: word;
begin
  {疲劳驾驶拍照
  是否疲劳拍照：占用1字节0-	不拍照，1-拍照存储 2-拍照上传
  拍照摄像头：占用1字节
            Bit0：1-编号0的摄像头拍照
            Bit1：1-编号1的摄像头拍照
            Bit2：1-编号2的摄像头拍照
            Bit3~bit7：保留为0
 拍照间隔：占用2字节  30-65535 单位：秒   0-不再重复拍照  }
  sndAry[0] := Edit381.ItemIndex;
  b[0] := CheckedToByte(cxCheckBoxPljsPIc1.Checked);
  b[1] := CheckedToByte(cxCheckBoxPljsPIc2.Checked);
  b[2] := CheckedToByte(cxCheckBoxPljsPIc3.Checked);
  b[3] := CheckedToByte(cxCheckBoxPljsPIc4.Checked);
  tmp := b[3] shl 3 + b[2] shl 2 + b[1] shl 1 + b[0];
  sndAry[1] := tmp;
  tmp := StrToInt(Edit382.Text);
  sndAry[2] := tmp div 256;
  sndAry[3] := tmp mod 256;
  CurrentDev.Param.Param0902 := BytesToHexString(@sndAry[0], 4);
  //BS.SaveDevParam(CurrentDev.IdStr, $0902, CurrentDev.Param.Param0902);
  if not AOnlySaveBj then
    Result := DataServer.SetDevParam_V3(ATargetID, $0902, @sndAry[0], 4);
end;

function TParamFrm.SetParam0903(ATargetID: string; AOnlySaveBj: Boolean = False): boolean;
var
  tmp: byte;
begin
 {空重车检测参数	占用1字节  0 - 开关信号检测，重车时低电平
            1 - 开关信号检测，重车时高电平
            2 -  使用串口数据来检测
}
  tmp := Edit39.ItemIndex;
  CurrentDev.Param.Param0903 := IntToStr(tmp);
  //BS.SaveDevParam(CurrentDev.IdStr, $0903, CurrentDev.Param.Param0903);
  if not AOnlySaveBj then
    Result := DataServer.SetDevParam_V3(ATargetID, $0903, @tmp, 1);
end;

function TParamFrm.SetParam0904(ATargetID: string; AOnlySaveBj: Boolean = False): boolean;
var
  tmp: byte;
begin
{开关信号有效电平	占1字节 8位位图 1：动作时高电平 0：动作时低电平}
  tmp := edit40.ItemIndex;
  CurrentDev.Param.Param0904 := IntToStr(tmp);
  //BS.SaveDevParam(CurrentDev.IdStr, $0904, CurrentDev.Param.Param0904);
  if not AOnlySaveBj then
    Result := DataServer.SetDevParam_V3(ATargetID, $0904, @tmp, 1);
end;

function TParamFrm.SetParam0905(ATargetID: string; AOnlySaveBj: Boolean = False): boolean;
var
  sndAry: array[0..3] of byte;
  tmp: word;
begin
 {盲区轨迹数据存储	占用4字节
     定时存储间隔    2字节       0~65535秒（0不使用该项控制）   默认值：30秒
    定距存储间隔    2字节        0~65535米（0不使用该项控制）   默认值：500米}
  tmp := StrToInt(Edit411.Text);
  sndAry[0] := tmp div 256;
  sndAry[1] := tmp mod 256;
  tmp := StrToInt(Edit412.Text);
  sndAry[2] := tmp div 256;
  sndAry[3] := tmp mod 256;
  CurrentDev.Param.Param0905 := BytesToHexString(@sndAry[0], 4);
  //BS.SaveDevParam(CurrentDev.IdStr, $0905, CurrentDev.Param.Param0905);
  if not AOnlySaveBj then
    Result := DataServer.SetDevParam_V3(ATargetID, $0905, @sndAry[0], 4);
end;

function TParamFrm.SetParam0906(ATargetID: string; AOnlySaveBj: Boolean = False): boolean;
var
  sndAry: array[0..3] of byte;
  tmp: word;
begin
 {疲劳驾驶参数	占用4字节
    疲劳休息时间限值    2字节      0~65535分钟        默认值：20分钟
    疲劳驾驶时间限值    2字节      0~65535分钟        默认值：240分钟
}
  tmp := StrToInt(Edit421.Text);
  sndAry[0] := tmp div 256;
  sndAry[1] := tmp mod 256;
  tmp := StrToInt(Edit422.Text);
  sndAry[2] := tmp div 256;
  sndAry[3] := tmp mod 256;
  CurrentDev.Param.Param0906 := BytesToHexString(@sndAry[0], 4);
  //BS.SaveDevParam(CurrentDev.IdStr, $0906, CurrentDev.Param.Param0906);
  if not AOnlySaveBj then
    Result := DataServer.SetDevParam_V3(ATargetID, $0906, @sndAry[0], 4);
end;

function TParamFrm.SetParam0907(ATargetID: string; AOnlySaveBj: Boolean = False): boolean;
var
  len: Integer;
  buf: array of byte;
  s: string;
begin
{0907H	进入重车提示语	不定长
    文本编码方式1字节   0-GB2312 1-GBK 2-BIG5 3-UNICODE
    提示语内容 小于200字节 要播报的内容 ASCII和GB3212内码
}
  len := Length(Trim(Edit432.Text)) + 1;
  s := Trim(Edit432.Text);
  SetLength(buf, len);
  buf[0] := Edit431.ItemIndex;
  CopyMemory(@buf[1], @s[1], Length(s));

  CurrentDev.Param.Param0907 := BytesToHexString(@buf[0], len);
  //BS.SaveDevParam(CurrentDev.IdStr, $0907, CurrentDev.Param.Param0907);
  if not AOnlySaveBj then
    Result := DataServer.SetDevParam_V3(ATargetID, $0907, @buf[0], len);
end;

function TParamFrm.SetParam0908(ATargetID: string; AOnlySaveBj: Boolean = False): boolean;
var
  len: Integer;
  buf: array of byte;
  s: string;
begin
{0908H	进入空车提示语	不定长
    文本编码方式1字节   0-GB2312 1-GBK 2-BIG5 3-UNICODE
    提示语内容 小于200字节 要播报的内容 ASCII和GB3212内码
}
  s := Trim(Edit442.Text);
  len := Length(s) + 1;
  SetLength(buf, len);
  buf[0] := Edit441.ItemIndex;
  CopyMemory(@buf[1], @s[1], Length(s));
  CurrentDev.Param.Param0908 := BytesToHexString(@buf[0], len);
  //BS.SaveDevParam(CurrentDev.IdStr, $0908, CurrentDev.Param.Param0908);
  if not AOnlySaveBj then
    Result := DataServer.SetDevParam_V3(ATargetID, $0908, @buf[0], len);
end;

function TParamFrm.SetParam0909(ATargetID: string; AOnlySaveBj: Boolean = False): boolean;
{0909H	疲劳驾驶提醒	不定长
    是否启用疲劳驾驶提示 1字节  0-禁止   非零-提示间隔  单位：秒
    疲劳驾驶提示语  小于50字节  要播报的内容 ASCII和GB3212内码  }
var
  len: Integer;
  buf: array of byte;
  s: string;
begin
  s := Trim(Edit452.Text);
  len := Length(s) + 1;
  SetLength(buf, len);
  buf[0] := StrToInt(Edit451.Text);
  CopyMemory(@buf[1], @s[1], Length(s));
  CurrentDev.Param.Param0909 := BytesToHexString(@buf[0], len);
  //BS.SaveDevParam(CurrentDev.IdStr, $0909, CurrentDev.Param.Param0909);
  if not AOnlySaveBj then
    Result := DataServer.SetDevParam_V3(ATargetID, $0909, @buf[0], len);
end;

function TParamFrm.SetParam090A(ATargetID: string; AOnlySaveBj: Boolean = False): boolean;
{090aH	超速驾驶提醒	不定长
    是否启用超速提示 1字节   0-禁止   非零-提示间隔  单位：秒
    超速提示语  小于50字节   要播报的内容 ASCII和GB3212内码
}
var
  len: Integer;
  buf: array of byte;
  s: string;
begin
  s := Trim(Edit462.Text);
  len := Length(s) + 1;
  SetLength(buf, len);
  buf[0] := StrToInt(Edit461.Text);
  CopyMemory(@buf[1], @s[1], Length(s));
  CurrentDev.Param.Param090A := BytesToHexString(@buf[0], len);
  //BS.SaveDevParam(CurrentDev.IdStr, $090A, CurrentDev.Param.Param090A);
  if not AOnlySaveBj then
    Result := DataServer.SetDevParam_V3(ATargetID, $090A, @buf[0], len);
end;

function TParamFrm.SetParam090B(ATargetID: string; AOnlySaveBj: Boolean = False): boolean;
  {090bH	允许超速时间	占用1字节   0―255    单位：秒}
//var
//  tmp: byte;
begin
  Result := SetLongWordParam(ATargetID, $0056, Edit47.Text);
//  tmp := StrToInt(edit47.Text);
//  CurrentDev.Param.Param090B := IntToStr(tmp);
//  BS.SaveDevParam(CurrentDev.IdStr, $090B, CurrentDev.Param.Param090B);
//  if not AOnlySaveBj then
//    Result := DataServer.SetDevParam_V3(ATargetID, $090B, @tmp, 1);
end;

function TParamFrm.SetParam090C(ATargetID: string; AOnlySaveBj: Boolean = False): boolean;
{090cH	超速报警拍照
是否超速拍照：占用1字节0-	不拍照，1-拍照存储 2-拍照上传
拍照摄像头：占用1字节    Bit0：1-编号0的摄像头拍照
                        Bit1：1-编号1的摄像头拍照
                        Bit2：1-编号2的摄像头拍照
                        Bit3~bit7：保留为0
拍照间隔：占用2字节  30-65535 单位：秒   0-不再重复拍照}
var
  sndAry: array[0..3] of byte;
  b: array[0..7] of byte;
  i: integer;
  tmp: word;
begin
  sndAry[0] := Edit481.ItemIndex;
  b[0] := CheckedToByte(cxCheckBoxOverSpeedPic1.Checked);
  b[1] := CheckedToByte(cxCheckBoxOverSpeedPic2.Checked);
  b[2] := CheckedToByte(cxCheckBoxOverSpeedPic3.Checked);
  b[3] := CheckedToByte(cxCheckBoxOverSpeedPic4.Checked);
  tmp := b[3] shl 3 + b[2] shl 2 + b[1] shl 1 + b[0];
  sndAry[1] := tmp;
  tmp := StrToInt(Edit482.Text);
  sndAry[2] := tmp div 256;
  sndAry[3] := tmp mod 256;
  CurrentDev.Param.Param090C := BytesToHexString(@sndAry[0], 4);
  //BS.SaveDevParam(CurrentDev.IdStr, $090C, CurrentDev.Param.Param090C);
  if not AOnlySaveBj then
    Result := DataServer.SetDevParam_V3(ATargetID, $090C, @sndAry[0], 4);
end;

function TParamFrm.SetParam090D(ATargetID: string; AOnlySaveBj: Boolean = False): boolean;
begin

  Result := SetLongWordParam(ATargetID, $0002, Edit34.Text)

//090dH	副中心端口号	占用2个字节，数值范围0～65535。
//  CurrentDev.Param.Param090d := Edit34.Text;
//  BS.SaveDevParam(CurrentDev.IdStr, $090D, CurrentDev.Param.Param090d);
//  if not AOnlySaveBj then
//    Result := SetWordParam(ATargetID, $090D, Edit34.Text);
end;

function TParamFrm.SetParam090E(ATargetID: string; AOnlySaveBj: Boolean = False): boolean;
begin
 //090eH	副照片服务端口号	占用2个字节，数值范围0～65535。
  CurrentDev.Param.Param090E := Edit49.Text;
 // BS.SaveDevParam(CurrentDev.IdStr, $090E, CurrentDev.Param.Param090E);
  if not AOnlySaveBj then
    Result := SetWordParam(ATargetID, $090E, Edit49.Text);
end;

function TParamFrm.SetParam090F(ATargetID: string; AOnlySaveBj: Boolean = False): boolean;
//var
//  s: string;
begin
  Result := SetParam0A0A(ATargetID, $0048, Edit36.Text);
// 	090fH	设置辅监听号码	可设一个电话号码，电话号码采用ASCII码表示。
//  s := Trim(Edit36.Text);
//  CurrentDev.Param.Param090F := s;
//  BS.SaveDevParam(CurrentDev.IdStr, $090F, CurrentDev.Param.Param090F);
//  if not AOnlySaveBj then
//    Result := DataServer.SetDevParam_V3(ATargetID, $090F, @s[1], Length(s));
end;

function TParamFrm.SetParam0910(ATargetID: string; AOnlySaveBj: Boolean = False): boolean;
//0910H	升级服务器APN	APN参数用ASCII码表示，长度小于32个字节。
var
  s: string;
begin
  s := Trim(Edit50.Text);
  CurrentDev.Param.Param0910 := s;
  //BS.SaveDevParam(CurrentDev.IdStr, $0910, CurrentDev.Param.Param0910);
  if not AOnlySaveBj then
    Result := DataServer.SetDevParam_V3(ATargetID, $0910, @s[1], Length(s));
end;

function TParamFrm.SetParam0911(ATargetID: string; AOnlySaveBj: Boolean = False): boolean;
//0911H	升级服务器IP地址	占用4个字节，例如：10.120.37.19表示为0x0A 0x78 0x25 0x13。
begin
  CurrentDev.Param.Param0911 := Edit51.Text;
  //BS.SaveDevParam(CurrentDev.IdStr, $0911, CurrentDev.Param.Param0911);
  if not AOnlySaveBj then
    Result := SetIPParam(ATargetID, $0911, Edit51);
end;

function TParamFrm.SetParam0912(ATargetID: string; AOnlySaveBj: Boolean = False): boolean;
//0912H	升级服务器域名	服务器域名用ASCII码表示，域名长度小于64字节。
var
  s: string;
begin
  s := Trim(Edit52.Text);
  CurrentDev.Param.Param0912 := s;
  //BS.SaveDevParam(CurrentDev.IdStr, $0912, CurrentDev.Param.Param0912);
  if not AOnlySaveBj then
    Result := DataServer.SetDevParam_V3(ATargetID, $0912, @s[1], Length(s));
end;

function TParamFrm.SetParam0913(ATargetID: string; AOnlySaveBj: Boolean = False): boolean;
//0913H	升级服务器端口号	占用2个字节，数值范围0～65535
begin
  CurrentDev.Param.Param0913 := Edit53.Text;
  //BS.SaveDevParam(CurrentDev.IdStr, $0913, CurrentDev.Param.Param0913);
  if not AOnlySaveBj then
    Result := SetWordParam(ATargetID, $0913, Edit53.Text);
end;

function TParamFrm.SetParam0914(ATargetID: string; AOnlySaveBj: Boolean = False): boolean;
{0914H	紧急报警拍照  （是否紧急报警设置由0502H项参数控制）
     拍照摄像头：占用1字节
            Bit0：1-编号0的摄像头拍照
            Bit1：1-编号1的摄像头拍照
            Bit2：1-编号2的摄像头拍照
            Bit3~bit7：保留为0
     紧急报警拍照间隔：占用2字节   30-65535 单位：秒   0-不再重复拍照}
var
  sndAry: array[0..2] of byte;
  b: array[0..7] of byte;
  i: integer;
  tmp: word;
begin
  b[0] := CheckedToByte(cxCheckBoxAlarmPic1.Checked);
  b[1] := CheckedToByte(cxCheckBoxAlarmPic2.Checked);
  b[2] := CheckedToByte(cxCheckBoxAlarmPic3.Checked);
  b[3] := CheckedToByte(cxCheckBoxAlarmPic4.Checked);
  tmp := b[3] shl 3 + b[2] shl 2 + b[1] shl 1 + b[0];
  sndAry[0] := tmp;
  tmp := StrToInt(Edit542.Text);
  sndAry[1] := tmp div 256;
  sndAry[2] := tmp mod 256;

  CurrentDev.Param.Param0914 := BytesToHexString(@sndAry[0], 3);
  //BS.SaveDevParam(CurrentDev.IdStr, $0914, CurrentDev.Param.Param0914);
  if not AOnlySaveBj then
    Result := DataServer.SetDevParam_V3(ATargetID, $0914, @sndAry[0], 3);
end;

function TParamFrm.SetParam0915(ATargetID: string; AOnlySaveBj: Boolean = False): boolean;
//var
//  m: Byte;
begin
  Result := SetLongWordParam(ATargetID, $0046, Edit55.Text);
//0915H	电话通话时长	占用1字节 0-255 分钟  0-不限制 默认：10分钟
//  m := StrToInt(Edit55.Text);
//  CurrentDev.Param.Param0915 := Edit55.Text;
//  BS.SaveDevParam(CurrentDev.IdStr, $0915, CurrentDev.Param.Param0915);
//  if not AOnlySaveBj then
//    Result := DataServer.SetDevParam_V3(ATargetID, $0915, @m, 1);
end;

function TParamFrm.SetParamCxCheckListBox(ATargetID: string; ParamID: Word; cxCheckListBox: TcxCheckListBox): Boolean;
var
  ParamValue: LongWord;
begin
  ParamValue := ByteOderConvert_LongWord(GetCxCheckListBoxValue(cxCheckListBox));
  Result := DataServer.SetDevParam_V3(ATargetID, ParamID, @ParamValue, 4);

end;

function TParamFrm.SetParam0a00(ATargetID: string; AOnlySaveBj: Boolean = False): boolean;
//0a00H	功能屏蔽标志	占用16个字节 ，共128个功能可以受控
  function GetChecked(ItemIndex: Byte): Byte;
  begin
    if cxCheckListBox56.Items[ItemIndex].Checked then
      Result := 1
    else
      Result := 0;
  end;
var
  b: array[0..32] of byte;
  sndAry: array[0..15] of byte;
  i, j, k: Integer;
  tmp: Byte;
begin
  b[0] := GetChecked(0);
  b[1] := GetChecked(1);
  b[2] := GetChecked(2);
  b[3] := GetChecked(3);
  b[4] := GetChecked(4);
  b[5] := GetChecked(5);
  b[6] := GetChecked(6);
  b[7] := GetChecked(7);
  b[8] := GetChecked(8);
  b[9] := GetChecked(9);
  b[10] := GetChecked(10);
  b[11] := GetChecked(11);
  b[12] := GetChecked(12);
  b[13] := GetChecked(13);
  b[14] := GetChecked(14);
  b[15] := GetChecked(15);
  b[16] := GetChecked(16);
  b[17] := GetChecked(17);
  b[18] := GetChecked(18);
  b[19] := GetChecked(19);
  b[20] := GetChecked(20);
  b[21] := GetChecked(21);
  b[22] := GetChecked(22);
  b[23] := GetChecked(23);
  b[24] := GetChecked(24);
  b[25] := GetChecked(25);
  b[26] := GetChecked(26);
  b[27] := GetChecked(27);
  b[28] := GetChecked(28);
  b[29] := GetChecked(29);
  b[30] := GetChecked(30);
  b[31] := GetChecked(31);
  b[32] := GetChecked(32);
  //设置初值为0
  for i := 0 to Length(sndAry) - 1 do
  begin
    sndAry[i] := 0;
  end;

  i := 0;
  //取出 0-31，共4个字节。12 13 14 15
  while i <= 31 do
  begin
    k := i mod 8;
    if k = 0 then tmp := 0;
    tmp := tmp + b[i] shl k;
    if k = 7 then
      sndAry[15 - i div 8] := tmp;
    inc(i);
  end;
  //取出第32字节
//  sndAry[11] := b[32];
//  CurrentDev.Param.Param0a00 := BytesToHexString(@sndAry[0], 16);
//  BS.SaveDevParam(CurrentDev.IdStr, $0A00, CurrentDev.Param.Param0a00);
//  if not AOnlySaveBj then
    Result := DataServer.SetDevParam_V3(ATargetID, $0050, @sndAry[0], 16);
end;

function TParamFrm.SetParam0a01(ATargetID: string; AOnlySaveBj: Boolean = False): boolean;
//0a01H	电话接听方式	占用1字节，0-手动接听（默认） 1-自动接听
begin
  Result := SetLongWordParam(ATargetID, $0045, IntToStr(Edit57.ItemIndex));
//  CurrentDev.Param.Param0a01 := IntToStr(Edit57.ItemIndex);
//  BS.SaveDevParam(CurrentDev.IdStr, $0A01, CurrentDev.Param.Param0a01);
//  if not AOnlySaveBj then
//    SetByteParam(ATargetID, $0A01, IntToStr(Edit57.ItemIndex));
end;

function TParamFrm.SetParam0a02(ATargetID: string; AOnlySaveBj: Boolean = False): boolean;
{0a02H	夜间时段	占用2个字节，每个字节为0～23，
  第一个字节表示夜间开始时间，第二个字节表示夜间结束时间。}
var
  b: array[0..1] of byte;
begin
  b[0] := StrToInt(Edit581.Text);
  b[1] := StrToInt(edit582.Text);
  CurrentDev.Param.Param0a02 := BytesToHexString(@b[0], 2);
  //BS.SaveDevParam(CurrentDev.IdStr, $0A02, CurrentDev.Param.Param0a02);
  if not AOnlySaveBj then
    DataServer.SetDevParam_V3(ATargetID, $0A02, @b[0], 2);
end;

function TParamFrm.SetParam0a03(ATargetID: string): boolean; //SMS消息应答超时时间
begin
  Result := SetLongWordParam(ATargetID, $0006, Edit59.Text);
end;

function TParamFrm.SetParam0a04(ATargetID: string): boolean; //SMS消息重传次数
begin
  Result := SetLongWordParam(ATargetID, $0007, Edit60.Text);
end;

function TParamFrm.SetParam0a05(ATargetID: string): boolean; //主服务器无线通信拨号用户名
begin
  Result := SetStrParam(ATargetID, $0011, Edit61.Text);
end;

function TParamFrm.SetParam0a06(ATargetID: string): boolean; //主服务器无线通信拨号密码
begin
  Result := SetStrParam(ATargetID, $0012, Edit62.Text);
end;

function TParamFrm.SetParam0a07(ATargetID: string): boolean; //备份服务器APN
begin
  Result := SetStrParam(ATargetID, $0014, Edit63.Text);
end;

function TParamFrm.SetParam0a08(ATargetID: string): boolean; //备份服务器无线通信拨号密码
begin
  Result := SetStrParam(ATargetID, $0016, Edit64.Text);
end;

function TParamFrm.SetParam0a09(ATargetID: string): boolean; //服务器TCP端口
begin
  Result := SetLongWordParam(ATargetID, $0018, Edit65.Text)
end;

function TParamFrm.SetParam0A0A(ATargetID: string; ParamID:Word; LongWordParam: string): Boolean; // 汇报时间间隔
begin
  Result := SetLongWordParam(ATargetID, ParamID, Trim(longWordParam));
end;

function TParamFrm.SetParam0A0B(ATargetID: string; ParamID:Word; StrParam: string): Boolean; // 汇报距离间隔
begin
  Result := SetStrParam(ATargetID, ParamID, Trim(StrParam));
end;

function TParamFrm.SetParamDataTime(ATargetID: string; ParamID: Word; dateParam: TDate; timeParam: TTime): Boolean;
var
  buf: array[0..4] of Byte;
  dateTime: TDateTime;
  Temp: string;
begin
  dateTime := dateParam;
  ReplaceTime(dateTime, timeParam);
  dateTime := StrToDateTime(FormatDatetime('yyyy-mm-dd hh:nn:ss',dateTime));
  buf[0] := StrToInt('$'+Copy(IntToStr(yearof(dateTime)),1,2));
  buf[1] := StrToInt('$'+Copy(IntToStr(yearof(dateTime)),3,2));
  buf[2] := StrToInt('$'+IntToStr(MonthOf(dateTime)));
  buf[3] := StrToInt('$'+IntToStr(DayOf(dateTime)));
  buf[4] := StrToInt('$'+IntToStr(HourOf(dateTime)));
  Result := DataServer.SetDevParam_V3(ATargetID, ParamID, @buf[0], 5)
end;

function TParamFrm.SetParamDataTime(ATargetID: string; ParamID: Word; dateTimeStr: string): Boolean;  // 发送时间的BCD码
var
  buf: array[0..4] of Byte;
begin

  buf[0] := StrToInt('$'+Copy(dateTimeStr,1,2));
  buf[1] := StrToInt('$'+Copy(dateTimeStr,3,2));
  buf[2] := StrToInt('$'+Copy(dateTimeStr,5,2));
  buf[3] := StrToInt('$'+Copy(dateTimeStr,7,2));
  buf[4] := StrToInt('$'+Copy(dateTimeStr,9,2));
  Result := DataServer.SetDevParam_V3(ATargetID, ParamID, @buf[0], 5)
end;

function TParamFrm.SetParam0A0C(ATargetID: string): boolean;
//0a00H	功能屏蔽标志	占用16个字节 ，共128个功能可以受控
  function GetChecked(ItemIndex: Byte): Byte;
  begin
    if cxCheckListBox1.Items[ItemIndex].Checked then
      Result := 1
    else
      Result := 0;
  end;
var
  b: array[0..32] of byte;
  sndAry: array[0..15] of byte;
  i, j, k: Integer;
  tmp: Byte;
begin
  b[0] := GetChecked(0);
  b[1] := GetChecked(1);
  b[2] := GetChecked(2);
  b[3] := GetChecked(3);
  b[4] := GetChecked(4);
  b[5] := GetChecked(5);
  b[6] := GetChecked(6);
  b[7] := GetChecked(7);
  b[8] := GetChecked(8);
  b[9] := GetChecked(9);
  b[10] := GetChecked(10);
  b[11] := GetChecked(11);
  b[12] := GetChecked(12);
  b[13] := GetChecked(13);
  b[14] := GetChecked(14);
  b[15] := GetChecked(15);
  b[16] := GetChecked(16);
  b[17] := GetChecked(17);
  b[18] := GetChecked(18);
  b[19] := GetChecked(19);
  b[20] := GetChecked(20);
  b[21] := GetChecked(21);
  b[22] := GetChecked(22);
  b[23] := GetChecked(23);
  b[24] := GetChecked(24);
  b[25] := GetChecked(25);
  b[26] := GetChecked(26);
  b[27] := GetChecked(27);
  b[28] := GetChecked(28);
  b[29] := GetChecked(29);
  b[30] := GetChecked(30);
  b[31] := GetChecked(31);
  b[32] := GetChecked(32);
  //设置初值为0
  for i := 0 to Length(sndAry) - 1 do
  begin
    sndAry[i] := 0;
  end;

  i := 0;
  //取出 0-31，共4个字节。12 13 14 15
  while i <= 31 do
  begin
    k := i mod 8;
    if k = 0 then tmp := 0;
    tmp := tmp + b[i] shl k;
    if k = 7 then
      sndAry[15 - i div 8] := tmp;
    inc(i);
  end;
  //取出第32字节
//  sndAry[11] := b[32];
//  CurrentDev.Param.Param0a00 := BytesToHexString(@sndAry[0], 16);
//  BS.SaveDevParam(CurrentDev.IdStr, $0A00, CurrentDev.Param.Param0a00);
//  if not AOnlySaveBj then
    Result := DataServer.SetDevParam_V3(ATargetID, $0051, @sndAry[0], 16);
end;

function TParamFrm.SetParam0A0D(ATargetID: string): boolean;
//0a00H	功能屏蔽标志	占用16个字节 ，共128个功能可以受控
  function GetChecked(ItemIndex: Byte): Byte;
  begin
    if cxCheckListBox2.Items[ItemIndex].Checked then
      Result := 1
    else
      Result := 0;
  end;
var
  b: array[0..32] of byte;
  sndAry: array[0..15] of byte;
  i, j, k: Integer;
  tmp: Byte;
begin
  b[0] := GetChecked(0);
  b[1] := GetChecked(1);
  b[2] := GetChecked(2);
  b[3] := GetChecked(3);
  b[4] := GetChecked(4);
  b[5] := GetChecked(5);
  b[6] := GetChecked(6);
  b[7] := GetChecked(7);
  b[8] := GetChecked(8);
  b[9] := GetChecked(9);
  b[10] := GetChecked(10);
  b[11] := GetChecked(11);
  b[12] := GetChecked(12);
  b[13] := GetChecked(13);
  b[14] := GetChecked(14);
  b[15] := GetChecked(15);
  b[16] := GetChecked(16);
  b[17] := GetChecked(17);
  b[18] := GetChecked(18);
  b[19] := GetChecked(19);
  b[20] := GetChecked(20);
  b[21] := GetChecked(21);
  b[22] := GetChecked(22);
  b[23] := GetChecked(23);
  b[24] := GetChecked(24);
  b[25] := GetChecked(25);
  b[26] := GetChecked(26);
  b[27] := GetChecked(27);
  b[28] := GetChecked(28);
  b[29] := GetChecked(29);
  b[30] := GetChecked(30);
  b[31] := GetChecked(31);
  b[32] := GetChecked(32);
  //设置初值为0
  for i := 0 to Length(sndAry) - 1 do
  begin
    sndAry[i] := 0;
  end;

  i := 0;
  //取出 0-31，共4个字节。12 13 14 15
  while i <= 31 do
  begin
    k := i mod 8;
    if k = 0 then tmp := 0;
    tmp := tmp + b[i] shl k;
    if k = 7 then
      sndAry[15 - i div 8] := tmp;
    inc(i);
  end;
  //取出第32字节
//  sndAry[11] := b[32];
//  CurrentDev.Param.Param0a00 := BytesToHexString(@sndAry[0], 16);
//  BS.SaveDevParam(CurrentDev.IdStr, $0A00, CurrentDev.Param.Param0a00);
//  if not AOnlySaveBj then
    Result := DataServer.SetDevParam_V3(ATargetID, $0052, @sndAry[0], 16);
end;

function TParamFrm.SetParam0A0E(ATargetID: string): boolean;
//0a00H	功能屏蔽标志	占用16个字节 ，共128个功能可以受控
  function GetChecked(ItemIndex: Byte): Byte;
  begin
    if cxCheckListBox3.Items[ItemIndex].Checked then
      Result := 1
    else
      Result := 0;
  end;
var
  b: array[0..32] of byte;
  sndAry: array[0..15] of byte;
  i, j, k: Integer;
  tmp: Byte;
begin
  b[0] := GetChecked(0);
  b[1] := GetChecked(1);
  b[2] := GetChecked(2);
  b[3] := GetChecked(3);
  b[4] := GetChecked(4);
  b[5] := GetChecked(5);
  b[6] := GetChecked(6);
  b[7] := GetChecked(7);
  b[8] := GetChecked(8);
  b[9] := GetChecked(9);
  b[10] := GetChecked(10);
  b[11] := GetChecked(11);
  b[12] := GetChecked(12);
  b[13] := GetChecked(13);
  b[14] := GetChecked(14);
  b[15] := GetChecked(15);
  b[16] := GetChecked(16);
  b[17] := GetChecked(17);
  b[18] := GetChecked(18);
  b[19] := GetChecked(19);
  b[20] := GetChecked(20);
  b[21] := GetChecked(21);
  b[22] := GetChecked(22);
  b[23] := GetChecked(23);
  b[24] := GetChecked(24);
  b[25] := GetChecked(25);
  b[26] := GetChecked(26);
  b[27] := GetChecked(27);
  b[28] := GetChecked(28);
  b[29] := GetChecked(29);
  b[30] := GetChecked(30);
  b[31] := GetChecked(31);
  b[32] := GetChecked(32);
  //设置初值为0
  for i := 0 to Length(sndAry) - 1 do
  begin
    sndAry[i] := 0;
  end;

  i := 0;
  //取出 0-31，共4个字节。12 13 14 15
  while i <= 31 do
  begin
    k := i mod 8;
    if k = 0 then tmp := 0;
    tmp := tmp + b[i] shl k;
    if k = 7 then
      sndAry[15 - i div 8] := tmp;
    inc(i);
  end;
  //取出第32字节
//  sndAry[11] := b[32];
//  CurrentDev.Param.Param0a00 := BytesToHexString(@sndAry[0], 16);
//  BS.SaveDevParam(CurrentDev.IdStr, $0A00, CurrentDev.Param.Param0a00);
//  if not AOnlySaveBj then
    Result := DataServer.SetDevParam_V3(ATargetID, $0053, @sndAry[0], 16);
end;

function TParamFrm.SetParam0A0F(ATargetID: string): boolean;
//0a00H	功能屏蔽标志	占用16个字节 ，共128个功能可以受控
  function GetChecked(ItemIndex: Byte): Byte;
  begin
    if cxCheckListBox4.Items[ItemIndex].Checked then
      Result := 1
    else
      Result := 0;
  end;
var
  b: array[0..32] of byte;
  sndAry: array[0..15] of byte;
  i, j, k: Integer;
  tmp: Byte;
begin
  b[0] := GetChecked(0);
  b[1] := GetChecked(1);
  b[2] := GetChecked(2);
  b[3] := GetChecked(3);
  b[4] := GetChecked(4);
  b[5] := GetChecked(5);
  b[6] := GetChecked(6);
  b[7] := GetChecked(7);
  b[8] := GetChecked(8);
  b[9] := GetChecked(9);
  b[10] := GetChecked(10);
  b[11] := GetChecked(11);
  b[12] := GetChecked(12);
  b[13] := GetChecked(13);
  b[14] := GetChecked(14);
  b[15] := GetChecked(15);
  b[16] := GetChecked(16);
  b[17] := GetChecked(17);
  b[18] := GetChecked(18);
  b[19] := GetChecked(19);
  b[20] := GetChecked(20);
  b[21] := GetChecked(21);
  b[22] := GetChecked(22);
  b[23] := GetChecked(23);
  b[24] := GetChecked(24);
  b[25] := GetChecked(25);
  b[26] := GetChecked(26);
  b[27] := GetChecked(27);
  b[28] := GetChecked(28);
  b[29] := GetChecked(29);
  b[30] := GetChecked(30);
  b[31] := GetChecked(31);
  b[32] := GetChecked(32);
  //设置初值为0
  for i := 0 to Length(sndAry) - 1 do
  begin
    sndAry[i] := 0;
  end;

  i := 0;
  //取出 0-31，共4个字节。12 13 14 15
  while i <= 31 do
  begin
    k := i mod 8;
    if k = 0 then tmp := 0;
    tmp := tmp + b[i] shl k;
    if k = 7 then
      sndAry[15 - i div 8] := tmp;
    inc(i);
  end;
  //取出第32字节
//  sndAry[11] := b[32];
//  CurrentDev.Param.Param0a00 := BytesToHexString(@sndAry[0], 16);
//  BS.SaveDevParam(CurrentDev.IdStr, $0A00, CurrentDev.Param.Param0a00);
//  if not AOnlySaveBj then
    Result := DataServer.SetDevParam_V3(ATargetID, $0054, @sndAry[0], 16);
end;

function TParamFrm.ReadParam(dev: TDevice; ParamID: Word): Boolean;
begin
  Result := DataServer.ReadDevParam_V3(dev, ParamID);
end;

procedure TParamFrm.CheckBox37Click(Sender: TObject);
begin
  Edit371.Enabled := CheckBox37.Checked;
  Edit372.Enabled := CheckBox37.Checked;
  Edit373.Enabled := CheckBox37.Checked;
  if CheckBox37.Checked then
  begin
    Edit371.Color := clWindow;
    Edit372.Color := clWindow;
    Edit373.Color := clWindow;
  end
  else
  begin
    Edit371.Color := clBtnFace;
    Edit372.Color := clBtnFace;
    Edit373.Color := clBtnFace;
  end;
end;

procedure TParamFrm.Edit52Change(Sender: TObject);
begin
  CheckLength(Sender, 64);
end;

procedure TParamFrm.CheckBox35Click(Sender: TObject);
begin
  if CheckBox35.Checked then
  begin
    Edit351.Enabled := True;
    Edit352.Enabled := True;
    Edit353.Enabled := True;
    Edit354.Enabled := True;
    Edit355.Enabled := True;
    Edit356.Enabled := True;
    Edit357.Enabled := True;
    Edit358.Enabled := True;

    Edit351.Color := clWindow;
    Edit352.Color := clWindow;
    Edit353.Color := clWindow;
    Edit354.Color := clWindow;
    Edit355.Color := clWindow;
    Edit356.Color := clWindow;
    Edit357.Color := clWindow;
    Edit358.Color := clWindow;
  end
  else
  begin
    Edit351.Enabled := False;
    Edit352.Enabled := False;
    Edit353.Enabled := False;
    Edit354.Enabled := False;
    Edit355.Enabled := False;
    Edit356.Enabled := False;
    Edit357.Enabled := False;
    Edit358.Enabled := False;

    Edit351.Color := clBtnFace;
    Edit352.Color := clBtnFace;
    Edit353.Color := clBtnFace;
    Edit354.Color := clBtnFace;
    Edit355.Color := clBtnFace;
    Edit356.Color := clBtnFace;
    Edit357.Color := clBtnFace;
    Edit358.Color := clBtnFace;
  end;
end;

procedure TParamFrm.CheckBox38Click(Sender: TObject);
begin
  if CheckBox38.Checked then
  begin
    Edit381.Enabled := True;
    Edit382.Enabled := True;
    Edit381.Color := clWindow;
    Edit382.Color := clWindow;
  end
  else
  begin
    Edit381.Enabled := False;
    Edit382.Enabled := False;
    Edit381.Color := clBtnFace;
    Edit382.Color := clBtnFace;
  end;
end;

procedure TParamFrm.CheckBox41Click(Sender: TObject);
begin
  Edit411.Enabled := CheckBox41.Checked;
  Edit412.Enabled := CheckBox41.Checked;
  if CheckBox41.Checked then
  begin
    Edit411.Color := clWindow;
    Edit412.Color := clWindow;
  end
  else
  begin
    Edit411.Color := clBtnFace;
    Edit412.Color := clBtnFace;
  end;
end;

procedure TParamFrm.CheckBox42Click(Sender: TObject);
begin
  Edit421.Enabled := CheckBox42.Checked;
  Edit422.Enabled := CheckBox42.Checked;
  if CheckBox42.Checked then
  begin
    Edit421.Color := clWindow;
    Edit422.Color := clWindow;
  end
  else
  begin
    Edit421.Color := clBtnFace;
    Edit422.Color := clBtnFace;
  end;
end;

procedure TParamFrm.CheckBox58Click(Sender: TObject);
begin
  Edit581.Enabled := CheckBox58.Checked;
  Edit582.Enabled := CheckBox58.Checked;
  if CheckBox58.Checked then
  begin
    Edit581.Color := clWindow;
    Edit582.Color := clWindow;
  end
  else
  begin
    Edit581.Color := clBtnFace;
    Edit582.Color := clBtnFace;
  end;
end;

procedure TParamFrm.CheckBox43Click(Sender: TObject);
begin
  Edit431.Enabled := CheckBox43.Checked;
  Edit432.Enabled := CheckBox43.Checked;
  if CheckBox43.Checked then
  begin
    Edit431.Color := clWindow;
    Edit432.Color := clWindow;
  end
  else
  begin
    Edit431.Color := clBtnFace;
    Edit432.Color := clBtnFace;
  end;
end;

procedure TParamFrm.CheckBox44Click(Sender: TObject);
begin
  Edit441.Enabled := CheckBox44.Checked;
  Edit442.Enabled := CheckBox44.Checked;
  if CheckBox44.Checked then
  begin
    Edit441.Color := clWindow;
    Edit442.Color := clWindow;
  end
  else
  begin
    Edit441.Color := clBtnFace;
    Edit442.Color := clBtnFace;
  end;
end;

procedure TParamFrm.CheckBox45Click(Sender: TObject);
begin
  Edit451.Enabled := CheckBox45.Checked;
  Edit452.Enabled := CheckBox45.Checked;
  if CheckBox45.Checked then
  begin
    Edit451.Color := clWindow;
    Edit452.Color := clWindow;
  end
  else
  begin
    Edit451.Color := clBtnFace;
    Edit452.Color := clBtnFace;
  end;
end;

procedure TParamFrm.CheckBox46Click(Sender: TObject);
begin
  Edit461.Enabled := CheckBox46.Checked;
  Edit462.Enabled := CheckBox46.Checked;
  if CheckBox46.Checked then
  begin
    Edit461.Color := clWindow;
    Edit462.Color := clWindow;
  end
  else
  begin
    Edit461.Color := clBtnFace;
    Edit462.Color := clBtnFace;
  end;
end;

procedure TParamFrm.Edit382Exit(Sender: TObject);
var tmp: Integer;
begin
  tmp := StrToInt(TEdit(Sender).Text);
  if (tmp < 30) or (tmp > 65535) then
  begin
    MessageBox(Handle, '请将值设置在30-65535之间', '提示', MB_OK + MB_ICONINFORMATION);
    TEdit(Sender).SetFocus;
  end;
end;

procedure TParamFrm.CheckBox56Click(Sender: TObject);
begin
  cxCheckListBox56.Enabled := CheckBox56.Checked;
end;

procedure TParamFrm.CheckBox48Click(Sender: TObject);
begin
  if CheckBox48.Checked then
  begin
    Edit481.Enabled := True;
    Edit482.Enabled := True;
    Edit481.Color := clWindow;
    Edit482.Color := clWindow;
  end
  else
  begin
    Edit481.Enabled := False;
    Edit482.Enabled := False;
    Edit481.Color := clBtnFace;
    Edit482.Color := clBtnFace;
  end;
end;

procedure TParamFrm.CheckBox54Click(Sender: TObject);
begin
  if CheckBox54.Checked then
  begin
    Edit542.Enabled := True;
    Edit542.Color := clWindow;
  end
  else
  begin
    Edit542.Enabled := False;
    Edit542.Color := clBtnFace;
  end;
end;

procedure TParamFrm.BitBtnSelectDevFunctionClick(Sender: TObject);
var
  i: integer;
begin
  if CheckBox56.Checked then
  begin
    if BitBtnSelectDevFunction.Caption = '全选' then
    begin
      BitBtnSelectDevFunction.Caption := '全不选';
      for i := 0 to cxCheckListBox56.Items.Count - 1 do
        if cxCheckListBox56.Items[i].Enabled then
          cxCheckListBox56.Items[i].Checked := True;
    end
    else
    begin
      BitBtnSelectDevFunction.Caption := '全选';
      for i := 0 to cxCheckListBox56.Items.Count - 1 do
        if cxCheckListBox56.Items[i].Enabled then
          cxCheckListBox56.Items[i].Checked := False;
    end;
  end;
end;

function TParamFrm.BytesToHexString(ABuff: Pointer; ALen: integer): string;
var
  i: integer;
  buf: array of byte;
begin
  Result := '';
  SetLength(buf, ALen);
  CopyMemory(@buf[0], ABuff, Alen);
  for i := 0 to ALen - 1 do
  begin
    Result := Result + InttoHex(buf[i], 2);
  end;
end;

procedure TParamFrm.HexStringToBytes(AHexS: string; var ALen: Integer; ABuf: PByte);
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

procedure TParamFrm.SetCurrentDev(ADev: TDevice);
begin
  if CurrentDev <> ADev then
  begin
    CurrentDev := ADev;
    IsNewDev := True;
  end
  else
    IsNewDev := False;
end;

procedure TParamFrm.CheckBoxSelectAllClick(Sender: TObject);
begin
  if TCheckBox(Sender).Checked then
    TCheckBox(Sender).Font.Color := clRed
  else
    TCheckBox(Sender).Font.Color := clBlack;

  RzCheckBoxSelectPageCommunication.Checked := TCheckBox(Sender).Checked;
  RzCheckBoxSelectPagePic.Checked := TCheckBox(Sender).Checked;
  RzCheckBoxSelectPageCall.Checked := TCheckBox(Sender).Checked;
  RzCheckBoxSelectPageControl.Checked := TCheckBox(Sender).Checked;
  RzCheckBoxSelectPageNotice.Checked := TCheckBox(Sender).Checked;
  RzCheckBoxSelectPageElse.Checked := TCheckBox(Sender).Checked;
end;

procedure TParamFrm.CheckBoxSelectPageCommunicationClick(Sender: TObject);
var
  i: Integer;
begin
  if TCheckBox(Sender).Checked then
    TCheckBox(Sender).Font.Color := clRed
  else
    TCheckBox(Sender).Font.Color := clBlack;

  for i:= 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TCheckBox) then
    begin
      if TCheckBox(Components[i]).Parent.Name = TCheckBox(Sender).Parent.Name then //同父
        TCheckBox(Components[i]).Checked := TCheckBox(Sender).Checked;
    end;
  end;
end;

procedure TParamFrm.CheckBoxSelectPageElseClick(Sender: TObject);
var
  i: Integer;
begin
  if TCheckBox(Sender).Checked then
    TCheckBox(Sender).Font.Color := clRed
  else
    TCheckBox(Sender).Font.Color := clBlack;

  for i:= 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TCheckBox) then
    begin
      if TCheckBox(Components[i]).Parent.Parent.Name = TCheckBox(Sender).Parent.Name then //同父
        TCheckBox(Components[i]).Checked := TCheckBox(Sender).Checked;
    end;
  end;      
end;

procedure TParamFrm.RzCheckBoxSelectPageCommunicationClick(
  Sender: TObject);
var
  i: Integer;
begin
  if TCheckBox(Sender).Checked then
    TCheckBox(Sender).Font.Color := clRed
  else
    TCheckBox(Sender).Font.Color := clBlack;

  for i:= 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TCheckBox) then
    begin
      if (TCheckBox(Components[i]).Parent.Name = TRzCheckBox(Sender).Parent.Name) and (TCheckBox(Components[i]).Visible = True) then //同父
      begin
        TCheckBox(Components[i]).Checked := TRzCheckBox(Sender).Checked and TCheckBox(Components[i]).Visible and TCheckBox(Components[i]).Enabled;
      end;
    end;

  end;
end;

procedure TParamFrm.RzCheckBoxSelectPageElseClick(Sender: TObject);
var
  i: Integer;
begin
  if TCheckBox(Sender).Checked then
    TCheckBox(Sender).Font.Color := clRed
  else
    TCheckBox(Sender).Font.Color := clBlack;

  for i:= 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TCheckBox) then
    begin
      if TCheckBox(Components[i]).Parent.Parent.Name = TRzCheckBox(Sender).Parent.Parent.Name then //同父
        TCheckBox(Components[i]).Checked := TRzCheckBox(Sender).Checked and TCheckBox(Components[i]).Visible and TCheckBox(Components[i]).Enabled;
    end;
  end;
end;

procedure TParamFrm.RzCheckBoxSelectAllClick(Sender: TObject);
begin
  if TCheckBox(Sender).Checked then
    TCheckBox(Sender).Font.Color := clRed
  else
    TCheckBox(Sender).Font.Color := clBlack;

  RzCheckBoxSelectPageCommunication.Checked := TRzCheckBox(Sender).Checked;
  RzCheckBoxSelectPagePic.Checked := TRzCheckBox(Sender).Checked;
  RzCheckBoxSelectPageCall.Checked := TRzCheckBox(Sender).Checked;
  RzCheckBoxSelectPageControl.Checked := TRzCheckBox(Sender).Checked;
  RzCheckBoxSelectPageNotice.Checked := TRzCheckBox(Sender).Checked;
  RzCheckBoxSelectPageElse.Checked := TRzCheckBox(Sender).Checked;

  CheckBox56.Checked := TRzCheckBox(Sender).Checked;
  CheckBox77.Checked := TRzCheckBox(Sender).Checked;
  CheckBox78.Checked := TRzCheckBox(Sender).Checked;
  CheckBox79.Checked := TRzCheckBox(Sender).Checked;
  CheckBox80.Checked := TRzCheckBox(Sender).Checked;
end;

procedure TParamFrm.BitBtn3Click(Sender: TObject);
var
  i: integer;
begin
  if CheckBox77.Checked then
  begin
    if BitBtn3.Caption = '全选' then
    begin
      BitBtn3.Caption := '全不选';
      for i := 0 to cxCheckListBox1.Items.Count - 1 do
        if cxCheckListBox1.Items[i].Enabled then
          cxCheckListBox1.Items[i].Checked := True;
    end
    else
    begin
      BitBtn3.Caption := '全选';
      for i := 0 to cxCheckListBox1.Items.Count - 1 do
        if cxCheckListBox1.Items[i].Enabled then
          cxCheckListBox1.Items[i].Checked := False;
    end;
  end;
end;

procedure TParamFrm.BitBtn5Click(Sender: TObject);
var
  i: integer;
begin
  if CheckBox78.Checked then
  begin
    if BitBtn5.Caption = '全选' then
    begin
      BitBtn5.Caption := '全不选';
      for i := 0 to cxCheckListBox2.Items.Count - 1 do
        if cxCheckListBox2.Items[i].Enabled then
          cxCheckListBox2.Items[i].Checked := True;
    end
    else
    begin
      BitBtn5.Caption := '全选';
      for i := 0 to cxCheckListBox2.Items.Count - 1 do
        if cxCheckListBox2.Items[i].Enabled then
          cxCheckListBox2.Items[i].Checked := False;
    end;
  end;
end;

procedure TParamFrm.BitBtn6Click(Sender: TObject);
var
  i: integer;
begin
  if CheckBox79.Checked then
  begin
    if BitBtn6.Caption = '全选' then
    begin
      BitBtn6.Caption := '全不选';
      for i := 0 to cxCheckListBox3.Items.Count - 1 do
        if cxCheckListBox3.Items[i].Enabled then
          cxCheckListBox3.Items[i].Checked := True;
    end
    else
    begin
      BitBtn6.Caption := '全选';
      for i := 0 to cxCheckListBox3.Items.Count - 1 do
        if cxCheckListBox3.Items[i].Enabled then
          cxCheckListBox3.Items[i].Checked := False;
    end;
  end;
end;

procedure TParamFrm.BitBtn7Click(Sender: TObject);
var
  i: integer;
begin
  if CheckBox80.Checked then
  begin
    if BitBtn7.Caption = '全选' then
    begin
      BitBtn7.Caption := '全不选';
      for i := 0 to cxCheckListBox4.Items.Count - 1 do
        if cxCheckListBox4.Items[i].Enabled then
          cxCheckListBox4.Items[i].Checked := True;
    end
    else
    begin
      BitBtn7.Caption := '全选';
      for i := 0 to cxCheckListBox4.Items.Count - 1 do
        if cxCheckListBox4.Items[i].Enabled then
          cxCheckListBox4.Items[i].Checked := False;
    end;
  end;
end;

procedure TParamFrm.CheckBox81Click(Sender: TObject);
begin
  if CheckBox81.Checked then
  begin
    date81.Color := clWindow;
    date81.Enabled := True;
    time81.Color := clWindow;
    time81.Enabled := True;
  end
  else
  begin
    date81.Color := clBtnFace;
    date81.Enabled := False;
    time81.Color := clBtnFace;
    time81.Enabled := False;
  end;
end;

procedure TParamFrm.Edit363Change(Sender: TObject);
begin
  if StringToInteger(Edit363.Text) >= 180 then
  begin
    messagebox(handle, ' 补传角度不能超过180度!  ', '提示', mb_ok + mb_iconinformation);
    Edit363.Text := '179';
  end;
end;

procedure TParamFrm.CheckBox80Click(Sender: TObject);
begin
cxCheckListBox4.Enabled := CheckBox80.Checked;
end;

procedure TParamFrm.CheckBox79Click(Sender: TObject);
begin
cxCheckListBox3.Enabled := CheckBox79.Checked;
end;

procedure TParamFrm.CheckBox78Click(Sender: TObject);
begin
cxCheckListBox2.Enabled := CheckBox78.Checked;
end;

procedure TParamFrm.CheckBox77Click(Sender: TObject);
begin
cxCheckListBox1.Enabled := CheckBox77.Checked;
end;

procedure TParamFrm.CheckBox27Click(Sender: TObject);
begin

  if CheckBox27.Checked then
  begin
    EditYear.Enabled := True;
    //EditYear.ReadOnly := True;
    EditYear.Color := clWindow;

    EditMonth.Enabled := True;
    //EditMonth.ReadOnly := True;
    EditMonth.Color := clWindow;

    EditDay.Enabled := True;
    //EditDay.ReadOnly := True;
    EditDay.Color := clWindow;

    EditHour.Enabled := True;
    //EditHour.ReadOnly := True;
    EditHour.Color := clWindow;
  end
  else
  begin
    EditYear.Enabled := False;
    //EditYear.ReadOnly := False;
    EditYear.Color := clBtnFace;

    EditMonth.Enabled := False;
    //EditMonth.ReadOnly := False;
    EditMonth.Color := clBtnFace;

    EditDay.Enabled := False;
    //EditDay.ReadOnly := False;
    EditDay.Color := clBtnFace;

    EditHour.Enabled := False;
    //EditHour.ReadOnly := False;
    EditHour.Color := clBtnFace;
  end;
  {if CheckBox27.Checked then
  begin
    date27.Color := clWindow;
    date27.Enabled := True;
    time27.Color := clWindow;
    time27.Enabled := True;
  end
  else
  begin
    date27.Color := clBtnFace;
    date27.Enabled := False;
    time27.Color := clBtnFace;
    time27.Enabled := False;
  end;   }
end;

procedure TParamFrm.Edit32KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key = #8) then Key := #0;
end;

function TParamFrm.SetParam0004(ATargetID: string): boolean;
begin
  Result := SetLongWordParam(ATargetID, $0004, Edit85.Text);
end;

function TParamFrm.SetParam0005(ATargetID: string): boolean;
begin
  Result := SetLongWordParam(ATargetID, $0005, Edit86.Text);
end;

function TParamFrm.SetParam0019(ATargetID: string): boolean;
begin
  Result := SetLongWordParam(ATargetID, $0019, Edit87.Text)
end;

procedure TParamFrm.Edit69Change(Sender: TObject);
begin
  CheckNum(Sender, 10, 0);
end;

procedure TParamFrm.Edit71Change(Sender: TObject);
begin
  CheckNum(Sender, 127, 0);
end;

procedure TParamFrm.Edit27Change(Sender: TObject);
begin
  CheckNum(Sender, 99, 0);
end;

procedure TParamFrm.Edit35Change(Sender: TObject);
begin
  CheckNum(Sender, 65535, 1);
end;

function TParamFrm.SetAStrParam(ATargetID: string; ParamID: Word;
  StrParam: string): boolean;
var
  Len: integer;
begin
  Len := Length(StrParam);
  Result := DataServer.SetDevParam_V3(ATargetID, ParamID, @StrParam[1], Len)
end;

function TParamFrm.SetStrBCDParam(ATargetID: string; ParamID: Word;
  StrParam: string; bcdLen: Integer; fillChar: string): boolean;
var
  temp: TByteDynArray;
  s: string;
begin
  s := StrParam;
  FillStr(s, bcdLen * 2, fillChar);
  temp := StrToBCD(s, bcdLen);
  Result := DataServer.SetDevParam_V3(ATargetID, ParamID, @temp[0], bcdLen);
end;

function TParamFrm.checkParam(var paramData: TByteDynArray;
  var paramCount: Integer): Boolean;
var
  j: Integer;
  checkBoxName: string;
  checkNo: string;
  tempComponent: TComponent;
begin
  Result := False;
  SetLength(paramData, 0);
  paramCount := 0;
  try
    for j := 0 to Self.ComponentCount - 1 do
    begin
      if not (Self.Components[j] is TCheckBox) then Continue;
      if not TCheckBox(Self.Components[j]).Checked then
        Continue;

      CheckBoxName := TCheckBox(Self.Components[j]).Name;
      checkNo := Copy(CheckBoxName, 9, Length(CheckBoxName) - 8);

      if checkNo = '95' then
      begin
        if Trim(Edit37.Text) = '' then
        begin
          messagebox(handle, ' 进入一级休眠时间值不能为空!  ', '提示', mb_ok + mb_iconinformation);
          exit;
        end;

        if Trim(Edit10.Text) = '' then
        begin
          messagebox(handle, ' 进入深度休眠时间值不能为空!  ', '提示', mb_ok + mb_iconinformation);
          exit;
        end;
        //Continue;
      end
      else if checkNo = '96' then
      begin
        if Trim(Edit27.Text) = '' then
        begin
          messagebox(handle, ' 拍照次数不能为空!  ', '提示', mb_ok + mb_iconinformation);
          exit;
        end;

        if Trim(Edit35.Text) = '' then
        begin
          messagebox(handle, ' 拍照间隔不能为空!  ', '提示', mb_ok + mb_iconinformation);
          exit;
        end;
        //Continue;
      end;

      tempComponent := self.FindComponent('Edit' + checkNo);
      if tempComponent is TEdit then
      begin
        if (TEdit(tempComponent).Text = '') and (tempComponent.Name <> 'Edit61')
          and (tempComponent.Name <> 'Edit62') and (tempComponent.Name <> 'Edit11')
          and (tempComponent.Name <> 'Edit64') then
        begin
          try
            TEdit(tempComponent).SetFocus;
            messagebox(handle, PChar(TEdit(tempComponent).hint + ' 参数值不能为空!  '), '提示', mb_ok + mb_iconinformation);
          except
            messagebox(handle, PChar(TEdit(tempComponent).hint + ' 参数值不能为空!  '), '提示', mb_ok + mb_iconinformation);
          end;
          exit;
        end;
      end
      else if tempComponent is TComboBox then
      begin
        if TComboBox(tempComponent).Text = '' then
        begin
          try
            TComboBox(tempComponent).SetFocus;
            messagebox(handle, PChar(TComboBox(tempComponent).hint + ' 参数值不能为空!  '), '提示', mb_ok + mb_iconinformation);
          except
            messagebox(handle, PChar(TComboBox(tempComponent).hint + ' 参数值不能为空!  '), '提示', mb_ok + mb_iconinformation);
          end;
          exit;
        end;
      end;

      GetParamData(paramData, StrToInt(checkNo));
      Inc(paramCount);
    end;
    Result := True;
  except

  end;
end;

procedure TParamFrm.GetParamData(var paramData: TByteDynArray;
  checkboxNo: Integer);
var
  str: string;
  w: Word;
  lw: LongWord;
begin
  case checkboxNo of
    12 : GetLongWordParamData(paramData, $0001, Trim(Edit12.Text));
    34 : GetLongWordParamData(paramData, $0002, Trim(Edit34.Text));
    13 : GetLongWordParamData(paramData, $0003, Trim(Edit13.Text));
    85 : GetLongWordParamData(paramData, $0004, Trim(Edit85.Text));
    86 : GetLongWordParamData(paramData, $0005, Trim(Edit86.Text));
    59 : GetLongWordParamData(paramData, $0006, Trim(Edit59.Text));
    60 : GetLongWordParamData(paramData, $0007, Trim(Edit60.Text));

    6  : GetStringParamData(paramData, $0010, Trim(Edit6.Text));
    61 : GetStringParamData(paramData, $0011, Trim(Edit61.Text));
    62 : GetStringParamData(paramData, $0012, Trim(Edit62.Text));
    7  : GetStringParamData(paramData, $0013, Trim(Edit7.Text));
    63 : GetStringParamData(paramData, $0014, Trim(Edit63.Text));
    11 : GetStringParamData(paramData, $0015, Trim(Edit11.Text));
    64 : GetStringParamData(paramData, $0016, Trim(Edit64.Text));
    9  : GetStringParamData(paramData, $0017, Trim(Edit9.Text));
    65 : GetLongWordParamData(paramData, $0018, Trim(Edit65.Text));
    87 : GetLongWordParamData(paramData, $0019, Trim(Edit87.Text));

    14 : GetLongWordParamData(paramData, $0020, IntToStr(Edit14.ItemIndex));
    15 : GetLongWordParamData(paramData, $0021, IntToStr(Edit15.ItemIndex));
    351: GetLongWordParamData(paramData, $0022, Trim(Edit351.Text));

    361: GetLongWordParamData(paramData, $0027, Trim(Edit361.Text));
    362: GetLongWordParamData(paramData, $0028, Trim(Edit362.Text));
    90 : GetLongWordParamData(paramData, $0029, Trim(Edit90.Text));

    91 : GetLongWordParamData(paramData, $002C, Edit91.Text);
    352: GetLongWordParamData(paramData, $002D, Edit352.Text);
    364: GetLongWordParamData(paramData, $002E, Edit364.Text);
    365: GetLongWordParamData(paramData, $002F, Edit365.Text);
    363: GetLongWordParamData(paramData, $0030, Edit363.Text);
    98 : GetWordParamData(paramData, $0031, Edit98.Text);

    66 : GetStringParamData(paramData, $0040, Trim(Edit66.Text));
    3  :  GetStringParamData(paramData, $0041, Trim(Edit3.Text));
    67 : GetStringParamData(paramData, $0042, Trim(Edit67.Text));
    4  : GetStringParamData(paramData, $0043, Trim(Edit4.Text));
    5  : GetStringParamData(paramData, $0044, Trim(Edit5.Text));
    57 : GetLongWordParamData(paramData, $0045, IntToStr(Edit57.ItemIndex));
    55 : GetLongWordParamData(paramData, $0046, Edit55.Text);
    68 : GetLongWordParamData(paramData, $0047, Edit68.Text);
    2  : GetStringParamData(paramData, $0048, Trim(Edit2.Text));
    92 : GetStringParamData(paramData, $0049, Trim(Edit92.Text));

    56 : GetLongWordParamData(paramData, $0050, IntToStr(GetCxCheckListBoxValue(cxCheckListBox56)));
    77 : GetLongWordParamData(paramData, $0051, IntToStr(GetCxCheckListBoxValue(cxCheckListBox1)));//SetParam0A0C(ATargetID);
    78 : GetLongWordParamData(paramData, $0052, IntToStr(GetCxCheckListBoxValue(cxCheckListBox2)));//SetParam0A0C(ATargetID);
    79 : GetLongWordParamData(paramData, $0053, IntToStr(GetCxCheckListBoxValue(cxCheckListBox3)));//SetParam0A0C(ATargetID);
    80 : GetLongWordParamData(paramData, $0054, IntToStr(GetCxCheckListBoxValue(cxCheckListBox4)));//SetParam0A0C(ATargetID);

    16 : GetLongWordParamData(paramData, $0055, Edit16.Text);
    47 : GetLongWordParamData(paramData, $0056, Edit47.Text);
    422: GetLongWordParamData(paramData, $0057, Edit422.Text);
    424: GetLongWordParamData(paramData, $0058, Edit424.Text);
    421: GetLongWordParamData(paramData, $0059, Edit421.Text);
    423: GetLongWordParamData(paramData, $005A, Edit423.Text);

    69 : GetLongWordParamData(paramData, $0070, Edit69.Text);
    70 : GetLongWordParamData(paramData, $0071, Edit70.Text);
    71 : GetLongWordParamData(paramData, $0072, Edit71.Text);
    72 : GetLongWordParamData(paramData, $0073, Edit72.Text);
    73 : GetLongWordParamData(paramData, $0074, Edit73.Text);

    74 : GetLongWordParamData(paramData, $0080, Edit74.Text);
    75 : GetWordParamData(paramData, $0081, Edit75.Text);
    76 : GetWordParamData(paramData, $0082, Edit76.Text);
    88 : GetStringParamData(paramData, $0083, Trim(Edit88.Text));

    89 :
      begin
        if Edit89.ItemIndex <= 3 then
          GetByteParamData(paramData, $0084, IntToStr(Edit89.ItemIndex + 1))
        else
          GetByteParamData(paramData, $0084, '9');
      end;

    93:
      begin
        str := Trim(Edit93.Text);
        FillStr(str, 12, '0');
        GetStrBCDParamData(paramData, $F001, str, 6, '0');
      end;  

    94 : GetStringParamData(paramData, $F002, Trim(Edit94.Text));
//
    95 :
      begin
        SetLength(str, 8);
        lw := StrToInt64(Trim(Edit37.Text));
        lw := ByteOderConvert_LongWord(lw);
        CopyMemory(@str[1], @lw, 4);
        lw := StrToInt64(Trim(Edit10.Text));
        lw := ByteOderConvert_LongWord(lw);
        CopyMemory(@str[5], @lw, 4);
        GetStringParamData(paramData, $F004, str);
      end;
    96 :
      begin
        SetLength(str, 4);
        w := StrToInt64(Trim(Edit27.Text));
        w := ByteOderConvert_Word(w);
        CopyMemory(@str[1], @w, 2);
        w := StrToInt64(Trim(Edit35.Text));
        w := ByteOderConvert_Word(w);
        CopyMemory(@str[3], @w, 2);
        GetStringParamData(paramData, $F005, str);
      end;
    97 :
      begin
        str := Trim(Edit97.Text);
        FillStr(str, 8, '0');
        str := FormatDateTime('yyMMdd', date97.DateTime) + str;
        GetStrBCDParamData(paramData, $F003, str, 7, '0');
      end;

    101: GetLongWordParamData(paramData, $F008, Edit101.Text);

  end;
end;

procedure TParamFrm.GetLongWordParamData(var paramData: TByteDynArray;
  paramId: LongWord; paramValue: string);
var
  offset: Integer;
  id, val: LongWord;
begin
  offset := Length(paramData);
  id := ByteOderConvert_LongWord(paramId);
  SetLength(paramData, Length(paramData) + 4 + 1 + 4);
  CopyMemory(@paramData[offset], @id, 4);
  paramData[offset + 4] := 4;
  val := ByteOderConvert_LongWord(StrToInt(paramValue));
  CopyMemory(@paramData[offset + 4 + 1], @val, 4);
end;

procedure TParamFrm.GetStringParamData(var paramData: TByteDynArray;
  paramId: LongWord; paramValue: string);
var
  offset: Integer;
  id: LongWord;
begin
  offset := Length(paramData);
  id := ByteOderConvert_LongWord(paramId);
  SetLength(paramData, Length(paramData) + 4 + 1 + Length(paramValue));
  CopyMemory(@paramData[offset], @id, 4);
  paramData[offset + 4] := Length(paramValue);
  CopyMemory(@paramData[offset + 4 + 1], @paramValue[1], Length(paramValue));
end;

procedure TParamFrm.GetByteParamData(var paramData: TByteDynArray;
  paramId: LongWord; paramValue: string);
var
  offset: Integer;
  id: LongWord;
begin
  offset := Length(paramData);
  id := ByteOderConvert_LongWord(paramId);
  SetLength(paramData, Length(paramData) + 4 + 1 + 1);
  CopyMemory(@paramData[offset], @id, 4);
  paramData[offset + 4] := 1;
  paramData[offset + 4 + 1] := StrToInt(paramValue);
end;

procedure TParamFrm.GetWordParamData(var paramData: TByteDynArray;
  paramId: LongWord; paramValue: string);
var
  offset: Integer;
  id: LongWord;
  val: Word;
begin
  offset := Length(paramData);
  id := ByteOderConvert_LongWord(paramId);
  SetLength(paramData, Length(paramData) + 4 + 1 + 2);
  CopyMemory(@paramData[offset], @id, 4);
  paramData[offset + 4] := 2;
  val := ByteOderConvert_Word(StrToInt(paramValue));
  CopyMemory(@paramData[offset + 4 + 1], @val, 2);
end;

procedure TParamFrm.GetStrBCDParamData(var paramData: TByteDynArray;
  paramId: LongWord; paramValue: string; bcdLen: Integer;
  fillChar: string);
var
  temp: TByteDynArray;
  s: string;

  offset: Integer;
  id: LongWord;
begin
  s := paramValue;
  FillStr(s, bcdLen * 2, fillChar);
  temp := StrToBCD(s, bcdLen);

  offset := Length(paramData);
  id := ByteOderConvert_LongWord(paramId);
  SetLength(paramData, Length(paramData) + 4 + 1 + Length(temp));

  CopyMemory(@paramData[offset], @id, 4);
  paramData[offset + 4] := Length(temp);
  CopyMemory(@paramData[offset + 4 + 1], @temp[0], Length(temp));
end;

procedure TParamFrm.ClearEditAndCbx;
var
  i: Integer;
begin
  for i := 0 to Self.ComponentCount - 1 do
  begin
    if Self.Components[i] is TEdit then
    begin
      if TEdit(Self.Components[i]) = EditCar then
        Continue;
      TEdit(Self.Components[i]).Text := ''
    end
    else if Self.Components[i] is TComboBox then
      TComboBox(Self.Components[i]).ItemIndex := -1;
  end;
end;

procedure TParamFrm.CheckBox110Click(Sender: TObject);
var
  checked: Boolean;
begin
  checked := CheckBox110.Checked;
  cxCheckListBox5.Enabled := checked;
  rbTimeUnitSecond.Enabled := checked;
  rbTimeUnitMinute.Enabled := checked;
  Edit38.Enabled := checked;
end;

procedure TParamFrm.CheckBox111Click(Sender: TObject);
var
  checked: Boolean;
begin
  checked := CheckBox111.Checked;
  cxCheckListBox6.Enabled := checked;
  rbDisUnitMeter.Enabled := checked;
  rbDisUnitKilometer.Enabled := checked;
  Edit43.Enabled := checked;
end;

end.

