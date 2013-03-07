unit ParamUnit;

interface
{$A+}
uses
  metaDefine, MSXML2_TLB, XMLDoc, XMLIntf, Graphics;
type
  TLayerParam = record
    FilePath: string;
    Visible: Boolean;
    Selected: Boolean;
    MetaLimit: Boolean;
    ShowLabel: Boolean;
    LabelField: string;
    ScaleLimit: Boolean;
    MinScale: Double;
    MaxScale: Double;
    lay_Order: integer; //图层次序
    MapFont: TMapFont; //地图的字体
  end;
  TLayerParamArray = array of TLayerParam;

  TAddrssParam = record
    Host: string;
    Port: Integer;
  end;

  TSystemParam = class
  private
    FFlyDistance: Integer; //飞车距离
    FLayerParam: TLayerParamArray;
    FMapRight: Integer;
    FMapLeft: Integer;
    FMapTop: Integer;
    FMapBottom: Integer;
    FGateway: TAddrssParam; //主网关服务器
    FIsUseGatewayBak: boolean;
    FGatewayBak: TAddrssParam; //副网关服务器
    FSkinName: string;
    FBusiness: TAddrssParam; //主业务服器
    FIsUseBusinessBak: boolean;
    FBusinessBak: TAddrssParam; //副业务服器
    FDefaultTrackPen: TPenStruct;
    FBizGuid: string;
    FInterceptGUID: string;
    FBizOffTime: Integer;
    FDevAlarmSound: string;
    FAlarmSound_OutCArea: string;
    FAlarmSound_InCArea: string;
    FStopOverTimeAlarm : string;//混凝土，停车超时时间

    FIsUseTelServer: boolean;
    FTelServer: TAddrssParam;
    FTelChannel: integer;

    FDriverOverSpeet: boolean; //超度是否提示司机.
    FAlarmFollow: boolean; //报警是否跟踪
    FSendSuccess: boolean; //发送成功是否提示
    FSendFail: boolean; //发送失败是否提示
    FConstMenu: boolean; //司机上传菜单是否提示
    FAttemperInfo: boolean; //调度信息回复是否提示.
    FTelCall: boolean; //来电是否提示
    FFirstCutTel: boolean; //先挂断客户电话提示;
    FTelNotClose: boolean; //电话没有挂好提示;
    FShowTheMapOption: word; //在地图上显示车版号还是设备名称选项.
    FFontSize: Word; //在地图上显示车牌号的字体大小.
    FCarNOAndDevName: boolean; //车牌号后加设备名称显示

    FShowAllDev: Boolean;
    FShowEmpty: Boolean;

    FisCarOnline: boolean; //车上线提示
    FisCarUnOnline: boolean; //车下线提示
    FAlarmSound_CarUnOnline: string;
    FAlarmSound_OverSpeet: string;
    FTimeIsOnline: integer;
    FisShowEmptyFull: boolean;
    FisAutoChangeMap: boolean;
    FisShowMasureError: boolean;
    FisUseDriverCard: boolean;
    FisUseMasure: boolean;
    FisAreaAlarmSendInfoToDriver: boolean;
//    FMenuSount: string;
    FMenuSound: string;
    FisLoadChinaRoad: boolean;
    FisAllCarUnOnlineAlarm: boolean;
    FFTrackPenColor: Integer;
    FFTrackPenStyle: Integer;
    FFTrackPenWidth: Integer;
    FisUpdate: boolean;
    FUpdateURL: string;

    FOverSpeetHintStr: string;
    FisFactory: boolean;
    FcarpicType: integer;

    FIsOverSpeedAlarm: Boolean;
    FIsPhotoShowhit: boolean;
    FisOilShutDownAlarm: boolean;
    FisEletrShutDownAlarm: boolean;
    FisalarmHurry: boolean;
    FIsEarlyWariningHurry: Boolean;
    FOrderVersion: integer;
    FAlarmSound_ZtCarry: string;
    FAlarmSound_ZtOff: string;
    FIsNoticeZtUploadCarryOffXslc: Boolean;
    FTelClientType: byte;
    FDevCallNumberForListenIn: string;
    FmrDownTime: integer;
    FFDriverAlarmColor: integer;
    FFTaxiHavColor: integer;
    FFTaxiEmptyColor: integer;
    FisAlarmFortify: Boolean;
    FisAlarmOutLine: Boolean;
    FisAlarmInDevArea: Boolean;
    FisAlarmDriverFatigue: Boolean;
    FisAlarmOutDevArea: Boolean;
    FisAlarmDevLowerPower: Boolean;
    FIsEmergncyAlarmAutoFirstAlarm: Boolean;
    FIsEarlyWarningAutoFirstAlarm: Boolean;

    FIsAutoRefreshReceivedMsg: Boolean;

    FDriverSucceedOrder: Boolean;   // 是否提示司机抢单成功
    FSucceedOrderHintStr: string;   // 提示司机抢单成功的提示语

    FIsOrderHaveTel: Boolean;  // 发送订单的信息中包含乘客电话号码
    FAlarmSound_Deviate: string;
    FAlarmSound_TimeoutStop: string;
    FAlarmSound_PowerDown: string;
    FAlarmSound_Undervoltage: string;
    FAlarmSound_Fatigue: string;
    FAlarmSound_DevFault: string;
    FIsSendTextWhenAlarm: Boolean;
    FIsDevOtherAlarm: Boolean;
    FCallBackTel: String;
    FAlarmSound_ServerDisConnect: string;
    FAccOffAlarmDis: Integer;
    FMapServerPort: Integer;
    FMapServerIp: String;
    FIsAlarmInfoDealTip: Boolean;

    procedure SetStopOverTimeAlarm(const Value:string);//混凝土，设置停车超时时间
    procedure SetFlyDistance(const Value: Integer);
    procedure SetLayerParam(const Value: TLayerParamArray);
    procedure SetMapBottom(const Value: Integer);
    procedure SetMapLeft(const Value: Integer);
    procedure SetMapRight(const Value: Integer);
    procedure SetMapTop(const Value: Integer);
    procedure SetGateway(const Value: TAddrssParam);
    procedure SetGatewayBak(const Value: TAddrssParam);
    procedure SetSkinName(const Value: string);
    procedure SetBusiness(const Value: TAddrssParam);
    procedure SetBusinessBak(const Value: TAddrssParam);

    procedure SetDefaultTrackPen(const Value: TPenStruct);
    procedure SetBizGuid(const Value: string);
    procedure SetInterceptGUID(const Value: string);
    procedure SetBizOffTime(const Value: Integer);
    procedure SetDevAlarmSound(const Value: string);
    procedure SetAlarmSound_OutCArea(const Value: string);
    procedure SetAlarmSound_InCArea(const Value: string);
    procedure SetFTrackPenColor(const Value: Integer);
    procedure SetFTrackPenStyle(const Value: Integer);
    procedure SetFTrackPenWidth(const Value: Integer);
    procedure SetcarpicType(const Value: integer);

    procedure SetIsOverSpeedAlarm(const Value: Boolean);
    procedure SetIsPhotoShowhit(const Value: boolean);
    procedure SetisOilShutDownAlarm(const Value: boolean);
    procedure SetisEletrShutDownAlarm(const Value: boolean);
    procedure SetisalarmHurry(const Value: boolean);
    procedure SetIsEarlyWariningHurry(const Value: Boolean);
    procedure SetOrderVersion(const Value: integer);
    procedure SetAlarmSound_ZtCarry(const Value: string);
    procedure SetAlarmSound_ZtOff(const Value: string);
    procedure SetIsNoticeZtUploadCarryOffXslc(const Value: Boolean);
    procedure SetTelClientType(const Value: byte);
    procedure SetDevCallNumberForListenIn(const Value: string);
    procedure SetmrDownTime(const Value: integer);
    procedure SetFDriverAlarmColor(const Value: integer);
    procedure SetFTaxiEmptyColor(const Value: integer);
    procedure SetFTaxiHavColor(const Value: integer);
    procedure SetisAlarmDriverFatigue(const Value: Boolean);
    procedure SetisAlarmFortify(const Value: Boolean);
    procedure SetisAlarmInDevArea(const Value: Boolean);
    procedure SetisAlarmOutDevArea(const Value: Boolean);
    procedure SetisAlarmOutLine(const Value: Boolean);
    procedure SetisAlarmDevLowerPower(const Value: Boolean);
    procedure SetIsEmergncyAlarmAutoFirstAlarm(const Value: Boolean);
    procedure SetIsEarlyWarningAutoFirstAlarm(const Value: Boolean);
    procedure SetAlarmSound_DevFault(const Value: string);
    procedure SetAlarmSound_Deviate(const Value: string);
    procedure SetAlarmSound_Fatigue(const Value: string);
    procedure SetAlarmSound_PowerDown(const Value: string);
    procedure SetAlarmSound_TimeoutStop(const Value: string);
    procedure SetAlarmSound_Undervoltage(const Value: string);
    procedure SetIsDevOtherAlarm(const Value: Boolean);
    procedure SetIsSendTextWhenAlarm(const Value: Boolean);
    procedure SetCallBackTel(const Value: String);
    procedure SetAlarmSound_ServerDisConnect(const Value: string);
    procedure SetAccOffAlarmDis(const Value: Integer);
    procedure SetMapServerIp(const Value: String);
    procedure SetServerPort(const Value: Integer);
    procedure SetIsAlarmInfoDealTip(const Value: Boolean);
  protected
    function SaveToXML: TXMLDocument;
    procedure LoadFromXML(AXML: IXMLDOMDocument2);
  public
    constructor Create;
    procedure SaveToFile(const AFileName: string);
    procedure LoadFromFile(const AFileName: string);
    procedure loadFromRemote(const ARemoteString: string);
    property FlyDistance: Integer read FFlyDistance write SetFlyDistance;
    property LayerParam: TLayerParamArray read FLayerParam write SetLayerParam;
    property MapLeft: Integer read FMapLeft write SetMapLeft;
    property MapRight: Integer read FMapRight write SetMapRight;
    property MapTop: Integer read FMapTop write SetMapTop;
    property MapBottom: Integer read FMapBottom write SetMapBottom;
    property Gateway: TAddrssParam read FGateway write SetGateway; //主网关
    property IsUseGatewayBak: boolean read FIsUseGatewayBak write FIsUseGatewayBak; //是否使用副网关
    property GatewayBak: TAddrssParam read FGatewayBak write SetGatewayBak; //副网关

    property DefaultTrackPen: TPenStruct read FDefaultTrackPen write SetDefaultTrackPen;
    //-------本地参数
    property Business: TAddrssParam read FBusiness write SetBusiness; //主业务服务器
    property IsUseBusinessBak: boolean read FIsUseBusinessBak write FIsUseBusinessBak; //是否使用副业务服务器
    property BusinessBak: TAddrssParam read FBusinessBak write SetBusinessBak; //副业务服务器

    property BizGuid: string read FBizGuid write SetBizGuid;
    property InterceptGUID: string read FInterceptGUID write SetInterceptGUID;
    property SkinName: string read FSkinName write SetSkinName; //皮肤名称
    property BizOffTime: Integer read FBizOffTime write SetBizOffTime;
    property DevAlarmSound: string read FDevAlarmSound write SetDevAlarmSound; //车辆报警声音
    property AlarmSound_OutCArea: string read FAlarmSound_OutCArea write SetAlarmSound_OutCArea; //车辆越界报警声音
    property AlarmSound_InCArea: string read FAlarmSound_InCArea write SetAlarmSound_InCArea;
    property AlarmSound_OverSpeet: string read FAlarmSound_OverSpeet write FAlarmSound_OverSpeet;
    property AlarmSound_CarUnOnline: string read FAlarmSound_CarUnOnline write FAlarmSound_CarUnOnline; //司机上传固定菜单的声音
    property AlarmSound_DevFault: string read FAlarmSound_DevFault write SetAlarmSound_DevFault;//设备故障声音
    property AlarmSound_Deviate: string read FAlarmSound_Deviate write SetAlarmSound_Deviate;//偏离路线
    property AlarmSound_Fatigue: string read FAlarmSound_Fatigue write SetAlarmSound_Fatigue;//疲劳驾驶
    property AlarmSound_PowerDown: string read FAlarmSound_PowerDown write SetAlarmSound_PowerDown;//断电报警
    property AlarmSound_TimeoutStop: string read FAlarmSound_TimeoutStop write SetAlarmSound_TimeoutStop;//超时停车;
    property AlarmSound_Undervoltage: string read FAlarmSound_Undervoltage write SetAlarmSound_Undervoltage;//欠压
    property AlarmSound_ServerDisConnect: string read FAlarmSound_ServerDisConnect write SetAlarmSound_ServerDisConnect;//服务器断开

    property MenuSound: string read FMenuSound write FMenuSound;
    property TelServer: TAddrssParam read FTelServer write FTelServer;
    property TelChannel: integer read FTelChannel write FTelChannel;
    property IsUseTelServer: boolean read FIsUseTelServer write FIsUseTelServer; //是否使用电话服务器.


    property IsDriverOverSpeet: boolean read FDriverOverSpeet write FDriverOverSpeet; //超度是否提示司机.
    property OverSpeetHintStr: string read FOverSpeetHintStr write FOverSpeetHintStr; //超速后,提示司机语
    //区域报警提示司机
    property isAreaAlarmSendInfoToDriver: boolean read FisAreaAlarmSendInfoToDriver write FisAreaAlarmSendInfoToDriver;
    property IsAlarmFollow: boolean read FAlarmFollow write FAlarmFollow; //报警是否跟踪
    property IsSendSuccess: boolean read FSendSuccess write FSendSuccess; //发送成功是否提示
    property IsSendFail: boolean read FSendFail write FSendFail; //发送失败是否提示
    property IsConstMenu: boolean read FConstMenu write FConstMenu; //司机上传菜单是否提示
    property IsAttemperInfo: boolean read FAttemperInfo write FAttemperInfo; //调度信息回复是否提示.
    property IsTelCall: boolean read FTelCall write FTelCall; //来电是否提示
    property IsFirstCutTel: boolean read FFirstCutTel write FFirstCutTel; //先挂断客户电话提示;
    property IsFTelNotClose: boolean read FTelNotClose write FTelNotClose; //电话没有挂好提示;
    property isCarNOAndDevName: boolean read FCarNOAndDevName write FCarNOAndDevName;
    property isShowAllDev: Boolean read FShowAllDev write FShowAllDev;
    property isShowEmpty: Boolean read FShowEmpty write FShowEmpty;
    property isCarOnline: boolean read FisCarOnline write FisCarOnline; //车上线提示
    property isCarUnOnline: boolean read FisCarUnOnline write FisCarUnOnline; //车下线提示
    property isShowEmptyFull: boolean read FisShowEmptyFull write FisShowEmptyFull; //是否显示空车率
    property isAutoChangeMap: boolean read FisAutoChangeMap write FisAutoChangeMap; //是否自动切换地图
    property isShowMasureError: boolean read FisShowMasureError write FisShowMasureError; //是否显示计价器故障
    property isUseMasure: boolean read FisUseMasure write FisUseMasure; //是否使用计价器
    property isUseDriverCard: boolean read FisUseDriverCard write FisUseDriverCard; //是否使用司机卡
    property isLoadChinaRoad: boolean read FisLoadChinaRoad write FisLoadChinaRoad; //是否载入全国路网图
    property isAllCarUnOnlineAlarm: boolean read FisAllCarUnOnlineAlarm write FisAllCarUnOnlineAlarm; //是否全部车下线报警.
    property isUpdate: boolean read FisUpdate write FisUpdate; // 是否更新
    property UpdateURL: string read FUpdateURL write FUpdateURL;  // 更新地址
    property isFactory: boolean read FisFactory write FisFactory; //是使用工厂管理功能

    property IsOverSpeedAlarm: Boolean read FIsOverSpeedAlarm write SetIsOverSpeedAlarm; //是否超速报警
    property IsPhotoShowhit: boolean read FIsPhotoShowhit write SetIsPhotoShowhit; //=== 是否照片提示
    property isOilShutDownAlarm: boolean read FisOilShutDownAlarm write SetisOilShutDownAlarm; //是否断油提示
    property isEletrShutDownAlarm: boolean read FisEletrShutDownAlarm write SetisEletrShutDownAlarm; //是否断油提示
    property isalarmHurry: boolean read FisalarmHurry write SetisalarmHurry;
    property IsEarlyWariningHurry: Boolean read FIsEarlyWariningHurry write SetIsEarlyWariningHurry;
    property IsNoticeZtUploadCarryOffXslc: Boolean read FIsNoticeZtUploadCarryOffXslc write SetIsNoticeZtUploadCarryOffXslc; //渣土车上传空重车里程（空重车状态变化）提示
    property FTrackPenColor: Integer read FFTrackPenColor write SetFTrackPenColor; //轨迹线颜色
    property FTrackPenWidth: Integer read FFTrackPenWidth write SetFTrackPenWidth; //轨迹线宽度
    property FTrackPenStyle: Integer read FFTrackPenStyle write SetFTrackPenStyle; //轨迹线线型

    property FDriverAlarmColor:integer read FFDriverAlarmColor write SetFDriverAlarmColor;//司机按键报警
    property FTaxiEmptyColor:integer read FFTaxiEmptyColor write SetFTaxiEmptyColor;//出租车空车颜色
    property FTaxiHavColor:integer read FFTaxiHavColor write SetFTaxiHavColor;// 出租车重车颜色
    property StopOverTimeAlarm:string read FStopOverTimeAlarm write SetStopOverTimeAlarm;//混凝土，停车超时时间


    property ShowTheMapOption: word read FShowTheMapOption write FShowTheMapOption;
    property FontSize: word read FFontSize write FFontSize;

    property DownTime: integer read FTimeIsOnline write FTimeIsOnline; //判断下载的时间
    property carpicType: integer read FcarpicType write SetcarpicType;

    property mrDownTime: integer read FmrDownTime write SetmrDownTime;

    //0:旧网关版  1：新网关版
    property OrderVersion: integer read FOrderVersion write SetOrderVersion;
    //渣土车进入空重车播放的声音文件名
    property AlarmSound_ZtCarry: string read FAlarmSound_ZtCarry write SetAlarmSound_ZtCarry;
    property AlarmSound_ZtOff: string read FAlarmSound_ZtOff write SetAlarmSound_ZtOff;
    //座席类型：调度坐席CLIENT_TYPE_SCHEDULE、报警监听坐席CLIENT_TYPE_ALARMMONITOR
    property TelClientType: Byte read FTelClientType write SetTelClientType;
    //命令车机拨打的监听电话号码
    property DevCallNumberForListenIn: string read FDevCallNumberForListenIn write SetDevCallNumberForListenIn;
    //--GPS定位数据中的各类状态报警提示：
    property isAlarmInDevArea:Boolean read FisAlarmInDevArea write SetisAlarmInDevArea; //是否进区域(设置到车机的区域)报警提示
    property isAlarmOutDevArea:Boolean read FisAlarmOutDevArea write SetisAlarmOutDevArea;//是否出区域(设置到车机的区域)报警提示
    property isAlarmDriverFatigue:Boolean read FisAlarmDriverFatigue write SetisAlarmDriverFatigue; //是否疲劳驾驶报警提示
    property isAlarmOutLine:Boolean read FisAlarmOutLine write SetisAlarmOutLine; //是否 偏离路线报警提示
    property isAlarmFortify:Boolean read FisAlarmFortify write SetisAlarmFortify; //是否 设防报警提示
    property isAlarmDevLowerPower:Boolean read FisAlarmDevLowerPower write SetisAlarmDevLowerPower;//是否低压报警提示
    //是否 紧急报警后自动将报警列表置前
    property IsEmergncyAlarmAutoFirstAlarm:Boolean read FIsEmergncyAlarmAutoFirstAlarm write SetIsEmergncyAlarmAutoFirstAlarm;
    // 是否 预警时自动将预警列表置前
    property IsEarlyWarningAutoFirstAlarm:Boolean read FIsEarlyWarningAutoFirstAlarm write SetIsEarlyWarningAutoFirstAlarm;
    // 是否自动刷新信息提示
    property IsAutoRefreshReceivedMsg: Boolean read FIsAutoRefreshReceivedMsg write FIsAutoRefreshReceivedMsg;

    property IsDriverSucceedOrder: Boolean read FDriverSucceedOrder write FDriverSucceedOrder;
    property SucceedOrderHintStr: string read FSucceedOrderHintStr write FSucceedOrderHintStr;
    property IsOrderHaveTel: Boolean read FIsOrderHaveTel write FIsOrderHaveTel;

    property IsSendTextWhenAlarm: Boolean read FIsSendTextWhenAlarm write SetIsSendTextWhenAlarm;
    property IsAlarmInfoDealTip: Boolean read FIsAlarmInfoDealTip write SetIsAlarmInfoDealTip;
    property IsDevOtherAlarm: Boolean read FIsDevOtherAlarm write SetIsDevOtherAlarm;
    property CallBackTel: String read FCallBackTel write SetCallBackTel;
    property AccOffAlarmDis: Integer read FAccOffAlarmDis write SetAccOffAlarmDis;

    property MapServerIp: String read FMapServerIp write SetMapServerIp;
    property MapServerPort: Integer read FMapServerPort write SetServerPort;

  end;
implementation

uses SysUtils;
{ TSystemParam }

constructor TSystemParam.Create;
begin
  FBusiness.Port := 211;
  FBizGuid := '{09A792D0-C480-46D7-82E6-4FBABA5B21EB}';
  FFlyDistance := 1000;
  FBizOffTime := 15 * 1000;
end;

procedure TSystemParam.LoadFromFile(const AFileName: string);
var
  x: TDOMDocument;
begin
  x := TDOMDocument.Create(nil);
  x.DefaultInterface.async := False;
  x.DefaultInterface.load(AFileName);
  LoadFromXML(x.DefaultInterface);
  x.Free;
end;

procedure TSystemParam.loadFromRemote(const ARemoteString: string);
var
  x: TDOMDocument;
begin
  x := TDOMDocument.Create(nil);
  x.DefaultInterface.async := False;
  x.DefaultInterface.loadXML(ARemoteString);
  LoadFromXML(x.DefaultInterface);
  x.Free;
end;

procedure TSystemParam.LoadFromXML(AXML: IXMLDOMDocument2);
  function GetBoolValue(node: IXMLDOMNode): Boolean;
  begin
    Result := node.text = 'True';
  end;
var
  r: IXMLDOMElement;
  n1, n2: IXMLDOMNode;
  nl1: IXMLDOMNodeList;
  x: IXMLDOMDocument2;
  i: Integer;
//  s:string;
begin
  try
    x := AXML;
    r := x.DocumentElement;
    n1 := r.selectSingleNode('//map');
    if n1 <> nil then
    begin
      MapLeft := StrToInt(n1.attributes.getNamedItem('left').text);
      MapRight := StrToInt(n1.attributes.getNamedItem('right').text);
      MapTop := StrToInt(n1.attributes.getNamedItem('top').text);
      MapBottom := StrToInt(n1.attributes.getNamedItem('bottom').text);
    end;
    nl1 := n1.ChildNodes;
    SetLength(FLayerParam, nl1.length);
    for i := 0 to nl1.length - 1 do
    begin
      try
        n2 := nl1.item[i];
        FLayerParam[i].FilePath := Trim(n2.attributes.getNamedItem('filepath').text);
        FLayerParam[i].Visible := GetBoolValue(n2.attributes.getNamedItem('visible'));
        FLayerParam[i].Selected := GetBoolValue(n2.attributes.getNamedItem('selected'));
        FLayerParam[i].MetaLimit := GetBoolValue(n2.attributes.getNamedItem('metalimit'));
        FLayerParam[i].ShowLabel := GetBoolValue(n2.attributes.getNamedItem('showlabel'));
        FLayerParam[i].LabelField := Trim(n2.attributes.getNamedItem('labelfield').text);
        FLayerParam[i].ScaleLimit := GetBoolValue(n2.attributes.getNamedItem('scalelimit'));
        FLayerParam[i].MinScale := StrToFloat(n2.attributes.getNamedItem('minscale').text);
        FLayerParam[i].MaxScale := StrToFloat(n2.attributes.getNamedItem('maxscale').text);
        FLayerParam[i].lay_Order := StrToInt(n2.attributes.getNamedItem('lay_Order').text);
        FLayerParam[i].MapFont.Size := 10;
        FLayerParam[i].MapFont.Name := '宋体';
        FLayerParam[i].MapFont.Color := clBlack;
          {
          s:=n2.attributes.getNamedItem('Font_Size').text;
          if s<>'' then
              try
                  FLayerParam[i].MapFont.Size:=StrToInt(s)
              except
                  FLayerParam[i].MapFont.Size:=10;
              end
          else
              FLayerParam[i].MapFont.Size:=10;

          s:=n2.attributes.getNamedItem('Font_Name').text;
          if s<>'' then
              FLayerParam[i].MapFont.Name:=s
          else
              FLayerParam[i].MapFont.Name:='宋体';

          s:=n2.attributes.getNamedItem('Font_Color').text;
          if s<>'' then
              try
                  FLayerParam[i].MapFont.Color:=StrToInt(s)
              except
                  FLayerParam[i].MapFont.Color:=clBlack
              end
          else
              FLayerParam[i].MapFont.Color:=clBlack;  }
      except
        Continue;
      end;



    end;
    n1 := r.selectSingleNode('//device');
    if n1 <> nil then
    begin
      n2 := n1.selectSingleNode('flydistance');
      if n2 <> nil then FlyDistance := StrToInt(n2.Text);
      n2 := n1.selectSingleNode('defaulttrackpen');
      if n2 <> nil then
      begin
        FDefaultTrackPen.Width := StrToInt(n2.attributes.getNamedItem('width').text);
        FDefaultTrackPen.Pattern := StrToInt(n2.attributes.getNamedItem('pattern').text);
        FDefaultTrackPen.Color := StrToInt(n2.attributes.getNamedItem('color').text);
      end;
    end;
    n1 := r.selectSingleNode('//system');
    if n1 <> nil then
    begin
      n2 := n1.selectSingleNode('gatewayhost');
      if n2 <> nil then FGateway.Host := Trim(n2.Text);
      n2 := n1.selectSingleNode('gatewayport');
      if n2 <> nil then FGateway.Port := StrToInt(n2.Text);
      n2 := n1.selectSingleNode('bizofftime');
      if n2 <> nil then BizOffTime := StrToInt(n2.Text);
    end;
    n1 := r.selectSingleNode('//local');
    if n1 <> nil then
    begin
      n2 := n1.selectSingleNode('bizserverhost');
      if n2 <> nil then FBusiness.Host := Trim(n2.Text);
      n2 := n1.selectSingleNode('bizserverport');
      if n2 <> nil then FBusiness.Port := StrToInt(n2.Text);
      n2 := n1.selectSingleNode('serverGUID');
      if n2 <> nil then FBizGuid := Trim(n2.text);
      n2 := n1.selectSingleNode('interceptGUID');
      if n2 <> nil then FInterceptGUID := Trim(n2.text);
      n2 := n1.selectSingleNode('skin');
      if n2 <> nil then SkinName := Trim(n2.text);
      n2 := n1.selectSingleNode('devalarmsound'); //add by sha 2004-6-5
      if n2 <> nil then FDevAlarmSound := Trim(n2.Text);
      n2 := n1.selectSingleNode('AlarmSound_OutCArea'); //车辆越界报警声音add by sha 2005-5-31
      if n2 <> nil then FAlarmSound_OutCArea := Trim(n2.Text);
      n2 := n1.selectSingleNode('AlarmSound_InCArea');
      if n2 <> nil then FAlarmSound_InCArea := Trim(n2.text); //车辆驶入区域报警 sha 2005-7-26

      n2 := n1.selectSingleNode('AlarmSound_OverSpeet');
      if n2 <> nil then FAlarmSound_OverSpeet := Trim(n2.text); //车辆驶入区域报警 sha 2005-7-26

      n2 := n1.selectSingleNode('AlarmSound_CarUnOnline');
      if n2 <> nil then FAlarmSound_CarUnOnline := Trim(n2.text); //车辆驶入区域报警 sha 2005-7-26

      n2 := n1.selectSingleNode('MenuSound');
      if n2 <> nil then FMenuSound := Trim(n2.text); //司机固定菜单声音

      n2 := n1.selectSingleNode('AlarmSound_DevFault');
      if n2 <> nil then FAlarmSound_DevFault := Trim(n2.text);

      n2 := n1.selectSingleNode('AlarmSound_Deviate');
      if n2 <> nil then FAlarmSound_Deviate := Trim(n2.text);
      n2 := n1.selectSingleNode('AlarmSound_Fatigue');
      if n2 <> nil then FAlarmSound_Fatigue := Trim(n2.text);

      n2 := n1.selectSingleNode('AlarmSound_PowerDown');
      if n2 <> nil then FAlarmSound_PowerDown := Trim(n2.text);

      n2 := n1.selectSingleNode('AlarmSound_TimeoutStop');
      if n2 <> nil then FAlarmSound_TimeoutStop := Trim(n2.text);

      n2 := n1.selectSingleNode('AlarmSound_Undervoltage');
      if n2 <> nil then FAlarmSound_Undervoltage := Trim(n2.text);

      n2 := n1.selectSingleNode('AlarmSound_ServerDisConnect');
      if n2 <> nil then
        FAlarmSound_ServerDisConnect := Trim(n2.text)
      else
        FAlarmSound_ServerDisConnect := '';

      n2 := n1.selectSingleNode('IsUseGatewayBak'); //是否使用副网关服务器  add by dxf 2005-09-01
      if n2 <> nil then
        if n2.text = '1' then FIsUseGatewayBak := true else FIsUseGatewayBak := false
      else
        FIsUseGatewayBak := false;

      n2 := n1.selectSingleNode('gatewayhostBak'); //副网关服务器  add by dxf 2005-09-01
      if n2 <> nil then FGatewayBak.Host := Trim(n2.Text);
      n2 := n1.selectSingleNode('gatewayportBak');
      if n2 <> nil then FGatewayBak.Port := StrToInt(n2.Text);

      n2 := n1.selectSingleNode('IsUseBusinessBak'); //是否使用副网关服务器  add by dxf 2005-09-01
      if n2 <> nil then
        if n2.text = '1' then FIsUseBusinessBak := true else FIsUseBusinessBak := false
      else
        FIsUseBusinessBak := false;


      n2 := n1.selectSingleNode('bizserverhostBak'); //副业务服务器 add by dxf 2005-09-01
      if n2 <> nil then FBusinessBak.Host := Trim(n2.Text);
      n2 := n1.selectSingleNode('bizserverportBak');
      if n2 <> nil then FBusinessBak.Port := StrToInt(n2.Text);

      n2 := n1.selectSingleNode('IsUseTelServer'); //是否使用电话服务器
      if n2 <> nil then
        if n2.text = '1' then FIsUseTelServer := true else FIsUseTelServer := false
      else
        FIsUseTelServer := false;

      n2 := n1.selectSingleNode('TelServerHost'); //电话服务器 add by dxf 2005-12-02
      if n2 <> nil then FTelServer.Host := Trim(n2.Text) else FTelServer.Host := '127.0.0.1';
      n2 := n1.selectSingleNode('TelServerPort');
      if n2 <> nil then FTelServer.Port := StrToInt(n2.Text) else FTelServer.Port := 0;

      n2 := n1.selectSingleNode('TelChannel');
      if n2 <> nil then FTelChannel := StrToInt(n2.Text) else FTelChannel := 2;
//-------------
      n2 := n1.selectSingleNode('IsDriverOverSpeet'); //是否使用电话服务器
      if n2 <> nil then
        if n2.text = '1' then FDriverOverSpeet := true else FDriverOverSpeet := false
      else
        FDriverOverSpeet := false;

      n2 := n1.selectSingleNode('IsAlarmFollow'); //是否使用电话服务器
      if n2 <> nil then
        if n2.text = '1' then FAlarmFollow := true else FAlarmFollow := false
      else
        FAlarmFollow := false;

      n2 := n1.selectSingleNode('IsSendSuccess'); //是否使用电话服务器
      if n2 <> nil then
        if n2.text = '1' then FSendSuccess := true else FSendSuccess := false
      else
        FSendSuccess := true;

      n2 := n1.selectSingleNode('IsSendFail'); //是否使用电话服务器
      if n2 <> nil then
        if n2.text = '1' then FSendFail := true else FSendFail := false
      else
        FSendFail := true;

      n2 := n1.selectSingleNode('IsConstMenu'); //是否使用电话服务器
      if n2 <> nil then
        if n2.text = '1' then FConstMenu := true else FConstMenu := false
      else
        FConstMenu := true;

      n2 := n1.selectSingleNode('IsAttemperInfo'); //是否使用电话服务器
      if n2 <> nil then
        if n2.text = '1' then FAttemperInfo := true else FAttemperInfo := false
      else
        FAttemperInfo := true;

      n2 := n1.selectSingleNode('IsTelCall'); //是否使用电话服务器
      if n2 <> nil then
        if n2.text = '1' then FTelCall := true else FTelCall := false
      else
        FTelCall := true;

      n2 := n1.selectSingleNode('IsFirstCutTel'); //是否使用电话服务器
      if n2 <> nil then
        if n2.text = '1' then FFirstCutTel := true else FFirstCutTel := false
      else
        FFirstCutTel := true;

      n2 := n1.selectSingleNode('IsFTelNotClose'); //是否使用电话服务器
      if n2 <> nil then
        if n2.text = '1' then FTelNotClose := true else FTelNotClose := false
      else
        FTelNotClose := true;

      n2 := n1.selectSingleNode('isCarNOAndDevName'); //车牌号后加设备名称.
      if n2 <> nil then
        if n2.text = '1' then FCarNOAndDevName := true else FCarNOAndDevName := false
      else
        FCarNOAndDevName := false;

      n2 := n1.selectSingleNode('isShowAllDev');
      if n2 <> nil then
        if n2.text = '1' then FShowAllDev := True else FShowAllDev := False
      else
        FShowAllDev := True;

      n2 := n1.selectSingleNode('isShowEmpty');
      if n2 <> nil then
        if n2.text = '1' then FShowEmpty := True else FShowEmpty := False
      else
        FShowEmpty := False;

      n2 := n1.selectSingleNode('isCarOnline'); //车牌号后加设备名称.
      if n2 <> nil then
        if n2.text = '1' then FisCarOnline := true else FisCarOnline := false
      else
        FisCarOnline := false;

      n2 := n1.selectSingleNode('isCarUnOnline'); //车牌号后加设备名称.
      if n2 <> nil then
        if n2.text = '1' then FisCarUnOnline := true else FisCarUnOnline := false
      else
        FisCarUnOnline := false;

      n2 := n1.selectSingleNode('isShowEmptyFull'); //是否显示空车率.
      if n2 <> nil then
        if n2.text = '1' then isShowEmptyFull := true else isShowEmptyFull := false
      else
        isShowEmptyFull := false;

      n2 := n1.selectSingleNode('isAutoChangeMap'); //是否自动切换地图.
      if n2 <> nil then
        if n2.text = '1' then isAutoChangeMap := true else isAutoChangeMap := false
      else
        isAutoChangeMap := true;



      n2 := n1.selectSingleNode('isShowMasureError'); //是否显示计价器故障.
      if n2 <> nil then
        if n2.text = '1' then isShowMasureError := true else isShowMasureError := false
      else
        isShowMasureError := false;


      n2 := n1.selectSingleNode('isUseMasure'); //是否使用计价器.
      if n2 <> nil then
        if n2.text = '1' then isUseMasure := true else isUseMasure := false
      else
        isUseMasure := true;

      n2 := n1.selectSingleNode('isUseDriverCard'); //是否使用司机卡 .
      if n2 <> nil then
        if n2.text = '1' then isUseDriverCard := true else isUseDriverCard := false
      else
        isUseDriverCard := false;



      n2 := n1.selectSingleNode('isAreaAlarmSendInfoToDriver'); //区域报警是否提示司机 .
      if n2 <> nil then
        if n2.text = '1' then isAreaAlarmSendInfoToDriver := true else isAreaAlarmSendInfoToDriver := false
      else
        isAreaAlarmSendInfoToDriver := false;


      n2 := n1.selectSingleNode('isLoadChinaRoad'); //区域报警是否提示司机 .
      if n2 <> nil then
        if n2.text = '1' then FisLoadChinaRoad := true else FisLoadChinaRoad := false
      else
        FisLoadChinaRoad := True;


      n2 := n1.selectSingleNode('isAllCarUnOnlineAlarm'); //是否全部车下线报警..
      if n2 <> nil then
        if n2.text = '1' then FisAllCarUnOnlineAlarm := true else FisAllCarUnOnlineAlarm := false
      else
        FisAllCarUnOnlineAlarm := false;



      n2 := n1.selectSingleNode('IsOverSpeedAlarm'); //区域报警是否提示司机 .
      if n2 <> nil then
        if n2.text = '1' then FIsOverSpeedAlarm := true else FIsOverSpeedAlarm := false
      else
        FIsOverSpeedAlarm := false;

      n2 := n1.selectSingleNode('IsPhotoShowhit'); //照片提示 .
      if n2 <> nil then
        if n2.text = '1' then FIsPhotoShowhit := true else FIsPhotoShowhit := false
      else
        FIsPhotoShowhit := false;

      n2 := n1.selectSingleNode('isOilShutDownAlarm'); //断油提示 .
      if n2 <> nil then
        if n2.text = '1' then FisOilShutDownAlarm := true else FisOilShutDownAlarm := false
      else
        FisOilShutDownAlarm := false;

      n2 := n1.selectSingleNode('isEletrShutDownAlarm'); //断电提示 .
      if n2 <> nil then
        if n2.text = '1' then FisEletrShutDownAlarm := true else FisEletrShutDownAlarm := false
      else
        FisEletrShutDownAlarm := false;

      n2 := n1.selectSingleNode('isalarmHurry'); //紧急报警提示 .
      if n2 <> nil then
        if n2.text = '1' then FisalarmHurry := true else FisalarmHurry := false
      else
        FisalarmHurry := false;

      n2 := n1.selectSingleNode('IsEarlyWariningHurry'); // 预警提示
      if n2 <> nil then
        if n2.text = '1' then FIsEarlyWariningHurry := True else FIsEarlyWariningHurry := False
      else
        FIsEarlyWariningHurry := False;

      n2 := n1.selectSingleNode('isUpdate'); //是否更新..
      if n2 <> nil then
        if n2.text = '1' then isUpdate := true else isUpdate := false
      else
        isUpdate := true;

      n2 := n1.selectSingleNode('UpdateURL');
      if n2 <> nil then
      begin
        FUpdateURL := n2.text;
      end else
      begin
        FUpdateURL := '';
      end;

      n2 := n1.selectSingleNode('isFactory'); //是否使用工厂管理..
      if n2 <> nil then
        if n2.text = '1' then FisFactory := true else FisFactory := false
      else
        FisFactory := false;

      n2 := n1.selectSingleNode('ShowTheMapOption'); // 显示车牌号/设备名称 /只显示车
      if (n2 <> nil) and (Trim(n2.text) <> '') then
        FShowTheMapOption := StrToInt(n2.text)//if n2.text = '1' then FShowTheMapOption := 1 else FShowTheMapOption := 0
      else
        FShowTheMapOption := 0;

      n2 := n1.selectSingleNode('FontSize'); //字体
      if n2 <> nil then
        FFontSize := StrToInt(n2.text)
      else
        FFontSize := 8;

      n2 := n1.selectSingleNode('DownTime'); //掉线时间判断
      if n2 <> nil then
        Self.DownTime := StrToInt(n2.text)
      else
        Self.DownTime := 300;     

      n2 := n1.selectSingleNode('OverSpeetHintStr'); //提示语
      if n2 <> nil then
        Self.OverSpeetHintStr := n2.text
      else
        Self.OverSpeetHintStr := '请不要超速行使,注意安全!';

      n2 := n1.selectSingleNode('carpicType'); //提示语
      if n2 <> nil then
        Self.carpicType := strtoint(n2.text)
      else
        Self.carpicType := 0;

      n2 := n1.selectSingleNode('OrderVersion');
      if n2 <> nil then
        OrderVersion := StrToInt(n2.text)
      else
        OrderVersion := 0;

      n2 := n1.selectSingleNode('FTrackPenColor'); //轨迹线颜色
      if n2 <> nil then FTrackPenColor := StrToInt(n2.text)
      else
        FTrackPenColor := clRed;

      n2 := n1.selectSingleNode('FTrackPenWidth'); //轨迹线宽度
      if n2 <> nil then FTrackPenWidth := StrToInt(n2.text)
      else
        FTrackPenWidth := 2;

      n2 := n1.selectSingleNode('FTrackPenStyle'); //轨迹线线型
      if n2 <> nil then FTrackPenStyle := StrToInt(n2.text)
      else
        FTrackPenStyle := 1;
      //渣土车进入空重车声音
      n2 := n1.selectSingleNode('AlarmSound_ZtCarry');
      if n2 <> nil then
        FAlarmSound_ZtCarry := n2.text
      else
        FAlarmSound_ZtCarry := '';
      n2 := n1.selectSingleNode('AlarmSound_ZtOff');
      if n2 <> nil then
        FAlarmSound_ZtOff := n2.text
      else
        FAlarmSound_ZtOff := '';

      n2 := n1.selectSingleNode('IsNoticeZtUploadCarryOffXslc');
      if (n2 <> nil) and (n2.text = '1') then
        FIsNoticeZtUploadCarryOffXslc := True
      else
        FIsNoticeZtUploadCarryOffXslc := false;

      n2 := n1.selectSingleNode('mrDownTime');
      if n2 <> nil then
      begin
        mrDownTime := StrToInt(n2.text);
        if mrDownTime = 0 then mrDownTime := 5;
      end
      else
        mrDownTime := 5;

      //坐席类型 20090204 sha
      n2 := n1.selectSingleNode('TelClientType');
      if (n2 <> nil) and (n2.text <> '') then
        FTelClientType := StrToInt(n2.text)
      else
        FTelClientType := 0; //默认为0
      //命令车机拨打的监听电话号码
      n2 := n1.selectSingleNode('DevCallNumberForListenIn');
      if n2 <> nil then
        FDevCallNumberForListenIn := n2.text
      else
        FDevCallNumberForListenIn := '';

       //出租车空车颜色
      n2 := n1.selectSingleNode('FTaxiEmptyColor');
      if n2 <> nil then
        FFTaxiEmptyColor := StrToInt(n2.text)
      else
        FFTaxiEmptyColor :=16711680;

      //出租车重车颜色
      n2 := n1.selectSingleNode('FTaxiHavColor');
      if n2 <> nil then
        fFTaxiHavColor := StrToInt(n2.text)
      else
        fFTaxiHavColor :=8388736;

      //出租车报警颜色
      n2 := n1.selectSingleNode('FDriverAlarmColor');
      if n2 <> nil then
        FFDriverAlarmColor :=StrToInt(n2.text)
      else
        FFDriverAlarmColor := 255;
      //进、出区域报警提示、疲劳报警提示、偏离路线报警提示、设防报警提示
      n2 := n1.selectSingleNode('isAlarmOutDevArea');
      if n2 <> nil then
        if n2.text = '1' then FisAlarmOutDevArea := True else FisAlarmOutDevArea := False
      else
        FisAlarmOutDevArea := false;
      n2 := n1.selectSingleNode('isAlarmInDevArea');
      if n2 <> nil then
        if n2.text = '1' then FisAlarmInDevArea := True else FisAlarmInDevArea := False
      else
        FisAlarmInDevArea := false;
      n2 := n1.selectSingleNode('isAlarmDriverFatigue');
      if n2 <> nil then
        if n2.text = '1' then FisAlarmDriverFatigue := True else FisAlarmDriverFatigue := False
      else
        FisAlarmDriverFatigue := false;
      n2 := n1.selectSingleNode('isAlarmOutLine');
      if n2 <> nil then
        if n2.text = '1' then FisAlarmOutLine := True else FisAlarmOutLine := False
      else
        FisAlarmOutLine := false;
      n2 := n1.selectSingleNode('isAlarmFortify');
      if n2 <> nil then
        if n2.text = '1' then FisAlarmFortify := True else FisAlarmFortify := False
      else
        FisAlarmFortify := false;
      n2 := n1.selectSingleNode('isAlarmDevLowerPower');
      if n2 <> nil then
        if n2.text = '1' then FisAlarmDevLowerPower := True else FisAlarmDevLowerPower := False
      else
        FisAlarmDevLowerPower := false;

      n2:= n1.selectSingleNode('IsEmergncyAlarmAutoFirstAlarm');
      if n2<> nil then
        if n2.text ='1' then FIsEmergncyAlarmAutoFirstAlarm := True else FIsEmergncyAlarmAutoFirstAlarm:= False
      else
        FIsEmergncyAlarmAutoFirstAlarm:= True;//默认为自动置前

      n2 := n1.selectSingleNode('IsEarlyWarningAutoFirstAlarm');
      if n2 <> nil then
        if n2.text = '1' then FIsEarlyWarningAutoFirstAlarm := True else FIsEarlyWarningAutoFirstAlarm := False
      else
        FIsEarlyWarningAutoFirstAlarm := True;  // 默认自动置前

      n2 := n1.selectSingleNode('StopOverTimeAlarm');
      if n2 <> nil then
        FStopOverTimeAlarm := n2.text
      else
        FStopOverTimeAlarm := '10';

      n2 := n1.selectSingleNode('IsAutoRefreshReceivedMsg');
      if n2 <> nil then
        if n2.text = '1' then FIsAutoRefreshReceivedMsg := True else FIsAutoRefreshReceivedMsg := False
      else
        FIsAutoRefreshReceivedMsg := False;

      n2 := n1.selectSingleNode('IsDriverSucceedOrder');
      if n2 <> nil then
        if n2.text = '1' then
          FDriverSucceedOrder := True
        else
          FDriverSucceedOrder := False
      else
        FDriverSucceedOrder := False;

      n2 := n1.selectSingleNode('SucceedOrderHintStr');
      if n2 <> nil then
        FSucceedOrderHintStr := n2.text
      else
        FSucceedOrderHintStr := '';

      n2 := n1.selectSingleNode('IsOrderHaveTel');
      if n2 <> nil then
      begin
        if n2.text = '1' then
          FIsOrderHaveTel := True
        else
          FIsOrderHaveTel := False;
      end else
      begin
        FIsOrderHaveTel := False;
      end;

      n2 := n1.selectSingleNode('IsSendTextWhenAlarm');
      if n2 <> nil then
      begin
        if n2.text = '1' then
          FIsSendTextWhenAlarm := True
        else
          FIsSendTextWhenAlarm := False;
      end else
      begin
        FIsSendTextWhenAlarm := False;
      end;

      n2 := n1.selectSingleNode('IsAlarmInfoDealTip');
      if n2 <> nil then
      begin
        if n2.text = '1' then
          FIsAlarmInfoDealTip := True
        else
          FIsAlarmInfoDealTip := False;
      end
      else
      begin
        FIsAlarmInfoDealTip := False;
      end;  

      n2 := n1.selectSingleNode('IsDevOtherAlarm');
      if n2 <> nil then
      begin
        if n2.text = '1' then
          FIsDevOtherAlarm := True
        else
          FIsDevOtherAlarm := False;
      end else
      begin
        FIsDevOtherAlarm := False;
      end;

      n2 := n1.selectSingleNode('CallBackTel');
      if n2 <> nil then
        FCallBackTel := Trim(n2.text)
      else
        FCallBackTel := '';

      n2 := n1.selectSingleNode('AccOffAlarmDis');
      if n2 <> nil then
        FAccOffAlarmDis := StrToInt(Trim(n2.text))
      else
        FAccOffAlarmDis := 600;

      n2 := n1.selectSingleNode('MapServerIp');
      if n2 <> nil then
        FMapServerIp := Trim(n2.text)
      else
        FMapServerIp := '';

      n2 := n1.selectSingleNode('MapServerPort');
      if n2 <> nil then
        FMapServerPort := StrToInt(Trim(n2.text))
      else
        MapServerPort := 0;
    end;
  except
  end;
end;

procedure TSystemParam.SaveToFile(const AFileName: string);
var
  x: TXMLDocument;
begin
  x := SaveToXML;
  x.SaveToFile(AFileName);
  x.Free;
end;

function TSystemParam.SaveToXML: TXMLDocument;
  procedure SetXMLBoolean(node: IXMLNode; Value: Boolean);
  begin
    if Value then
      node.Text := '1'
    else
      node.Text := '0';
  end;
var
  x: TXMLDocument;
  r: IXMLNode;
  n, n1, n2: IXMLNode;
  namespace: string;
  i: Integer;
begin
  namespace := '';
  x := TXMLDocument.Create(nil);
  x.Active := True;
  x.Encoding := 'gb2312';
  r := x.CreateElement('param', namespace);
  x.DocumentElement := r;
  n := x.CreateElement('remote', namespace);
  r.ChildNodes.Add(n);
  n1 := x.CreateElement('map', namespace);
  n.ChildNodes.Add(n1);
  n1.SetAttributeNS('left', namespace, MapLeft);
  n1.SetAttributeNS('right', namespace, MapRight);
  n1.SetAttributeNS('top', namespace, MapTop);
  n1.SetAttributeNS('bottom', namespace, MapBottom);
  for i := 0 to Length(FLayerParam) - 1 do
  begin
    n2 := x.CreateElement('layer', namespace);
    n1.ChildNodes.Add(n2);
    n2.Attributes['filepath'] := FLayerParam[i].FilePath;
    n2.Attributes['visible'] := FLayerParam[i].Visible;
    n2.Attributes['selected'] := FLayerParam[i].Selected;
    n2.Attributes['metalimit'] := FLayerParam[i].MetaLimit;
    n2.Attributes['showlabel'] := FLayerParam[i].ShowLabel;
    n2.Attributes['labelfield'] := FLayerParam[i].LabelField;
    n2.Attributes['scalelimit'] := FLayerParam[i].ScaleLimit;
    n2.Attributes['minscale'] := FLayerParam[i].MinScale;
    n2.Attributes['maxscale'] := FLayerParam[i].MaxScale;
    n2.Attributes['lay_Order'] := FLayerParam[i].lay_Order;
    n2.Attributes['Font_Size'] := FLayerParam[i].MapFont.Size;
    n2.Attributes['Font_Name'] := FLayerParam[i].MapFont.Name;
    n2.Attributes['Font_Color'] := FLayerParam[i].MapFont.Color;
  end;
  n1 := x.CreateElement('device', namespace);
  n.ChildNodes.Add(n1);
  n2 := x.CreateElement('flydistance', namespace);
  n2.Text := IntToStr(FlyDistance);
  n1.ChildNodes.Add(n2);
  n2 := x.CreateElement('defaulttrackpen', namespace);
  n2.Attributes['width'] := DefaultTrackPen.Width;
  n2.Attributes['pattern'] := DefaultTrackPen.Pattern;
  n2.Attributes['color'] := DefaultTrackPen.color;
  n1 := x.CreateElement('system', namespace);
  n.ChildNodes.Add(n1);

  n2 := x.CreateElement('gatewayhost', namespace);
  n2.Text := Gateway.Host;
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('gatewayport', namespace);
  n2.Text := IntToStr(Gateway.Port);
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('bizofftime', namespace);
  n2.Text := IntToStr(BizOffTime);
  n1.ChildNodes.Add(n2);

  n1 := x.CreateElement('local', namespace);
  n.ChildNodes.Add(n1);

  n2 := x.CreateElement('bizserverhost', namespace);
  n2.Text := Business.Host;
  n1.ChildNodes.Add(n2);
  n2 := x.CreateElement('bizserverport', namespace);
  n2.Text := IntToStr(Business.Port);
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('serverGUID', namespace);
  n2.Text := BizGuid;
  n1.ChildNodes.Add(n2);
  n2 := x.CreateElement('interceptGUID', namespace);
  n2.Text := InterceptGUID;
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('skin', namespace);
  n2.Text := SkinName;
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('devalarmsound', namespace); //add by sha 2004-6-5
  n2.Text := FDevAlarmSound;
  n1.ChildNodes.Add(n2);
  //车辆越界报警声音 add by sha 2005-5-31
  n2 := x.CreateElement('AlarmSound_OutCArea', namespace);
  n2.Text := FAlarmSound_OutCArea;
  n1.ChildNodes.Add(n2);
  //车辆驶入区域报警　声音 add sha 2005-7-26
  n2 := x.CreateElement('AlarmSound_InCArea', namespace);
  n2.Text := FAlarmSound_InCArea;
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('AlarmSound_OverSpeet', namespace);
  n2.Text := FAlarmSound_OverSpeet;
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('AlarmSound_CarUnOnline', namespace);
  n2.Text := FAlarmSound_CarUnOnline;
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('MenuSound', namespace);
  n2.Text := FMenuSound;
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('AlarmSound_Deviate', namespace);
  n2.Text := FAlarmSound_Deviate;
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('AlarmSound_TimeoutStop', namespace);
  n2.Text := FAlarmSound_TimeoutStop;
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('AlarmSound_PowerDown', namespace);
  n2.Text := FAlarmSound_PowerDown;
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('AlarmSound_Undervoltage', namespace);
  n2.Text := FAlarmSound_Undervoltage;
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('AlarmSound_Fatigue', namespace);
  n2.Text := FAlarmSound_Fatigue;
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('AlarmSound_DevFault', namespace);
  n2.Text := FAlarmSound_DevFault;
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('AlarmSound_ServerDisConnect', namespace);
  n2.Text := FAlarmSound_ServerDisConnect;
  n1.ChildNodes.Add(n2);

  //副网关服务器   add dxf 2005-09-01
  n2 := x.CreateElement('IsUseGatewayBak', namespace);
  if FIsUseGatewayBak then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('gatewayhostBak', namespace);
  n2.Text := GatewayBak.Host;
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('gatewayportBak', namespace);
  n2.Text := IntToStr(GatewayBak.Port);
  n1.ChildNodes.Add(n2);

  //副业务服务器  add dxf2005-09-01
  n2 := x.CreateElement('IsUseBusinessBak', namespace);
  if FIsUseBusinessBak then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('bizserverhostBak', namespace);
  n2.Text := BusinessBak.Host;
  n1.ChildNodes.Add(n2);
  n2 := x.CreateElement('bizserverportBak', namespace);
  n2.Text := IntToStr(BusinessBak.Port);
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('IsUseTelServer', namespace);
  if FIsUseTelServer then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('TelServerHost', namespace);
  n2.Text := FTelServer.Host;
  n1.ChildNodes.Add(n2);
  n2 := x.CreateElement('TelServerPort', namespace);
  n2.Text := IntToStr(FTelServer.Port);
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('TelChannel', namespace);
  n2.Text := IntToStr(FTelChannel);
  n1.ChildNodes.Add(n2);
//-----------------------------------------------------------
  n2 := x.CreateElement('IsDriverOverSpeet', namespace);
  if FDriverOverSpeet then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('IsAlarmFollow', namespace);
  if FAlarmFollow then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('IsSendSuccess', namespace);
  if FSendSuccess then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('IsSendFail', namespace);
  if FSendFail then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('IsConstMenu', namespace);
  if FConstMenu then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('IsAttemperInfo', namespace);
  if FAttemperInfo then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('IsTelCall', namespace);
  if FTelCall then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('IsFirstCutTel', namespace);
  if FFirstCutTel then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('IsFTelNotClose', namespace);
  if FTelNotClose then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('isCarNOAndDevName', namespace); ////车牌号后加设备名称.
  if FCarNOAndDevName then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('isCarOnline', namespace); ////车牌号后加设备名称.
  if FisCarOnline then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('isShowAllDev', namespace);
  if FShowAllDev then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('isShowEmpty', namespace);
  if FShowEmpty then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('isCarUnOnline', namespace); ////车牌号后加设备名称.
  if FisCarUnOnline then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('isShowEmptyFull', namespace); ////是否显示空车率.
  if isShowEmptyFull then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('isAutoChangeMap', namespace); ////是否自动切换地图.
  if isAutoChangeMap then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('isShowMasureError', namespace); ////是否显示计价器故障.
  if isShowMasureError then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('isUseMasure', namespace); ////是否使用计价器.
  if isUseMasure then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);



  n2 := x.CreateElement('IsOverSpeedAlarm', namespace); ////是否超过速度报警提示.
  if IsOverSpeedAlarm then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('isOilShutDownAlarm', namespace); ////是否断油报警提示.
  if isOilShutDownAlarm then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('isEletrShutDownAlarm', namespace); ////是否断电报警提示.
  if isEletrShutDownAlarm then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('isalarmHurry', namespace); ////是否断紧急报警提示.
  if isalarmHurry then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('IsEarlyWariningHurry', namespace);
  if IsEarlyWariningHurry then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('IsPhotoShowhit', namespace); ////是否照片提示.
  if IsPhotoShowhit then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('isUseDriverCard', namespace); ////是否使用司机卡.
  if isUseDriverCard then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);


  n2 := x.CreateElement('isAreaAlarmSendInfoToDriver', namespace); //区域报警是否提示司机.
  if FisAreaAlarmSendInfoToDriver then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('isLoadChinaRoad', namespace); //是否载入路网图.
  if FisLoadChinaRoad then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('isAllCarUnOnlineAlarm', namespace); ////是否全部车下线报警..
  if FisAllCarUnOnlineAlarm then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);


  n2 := x.CreateElement('isUpdate', namespace); ////是否更新..
  if isUpdate then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('UpdateURL', namespace);   // 软件自动更新地址
  n2.Text := FUpdateURL;
  n1.ChildNodes.Add(n2);


  n2 := x.CreateElement('isFactory', namespace); ////是否使用工厂管理..
  if isUpdate then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);





  n2 := x.CreateElement('ShowTheMapOption', namespace);
  //if FShowTheMapOption = 1 then n2.Text := '1' else n2.Text := '0';
  n2.Text := IntToStr(FShowTheMapOption);
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('FontSize', namespace);
  n2.Text := IntToStr(FFontSize);
  n1.ChildNodes.Add(n2);


  n2 := x.CreateElement('DownTime', namespace);
  n2.Text := IntToStr(Self.DownTime);
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('OverSpeetHintStr', namespace);
  n2.Text := Self.FOverSpeetHintStr;
  n1.ChildNodes.Add(n2);

  //订单
  n2 := x.CreateElement('OrderVersion', namespace);
  n2.Text := IntToStr(FOrderVersion);
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('carpicType', namespace);
  n2.Text := inttostr(self.carpicType);
  n1.ChildNodes.Add(n2);


  //轨迹线颜色
  n2 := x.CreateElement('FTrackPenColor', namespace);
  n2.Text := IntToStr(FTrackPenColor);
  n1.ChildNodes.Add(n2);
  //轨迹线宽度
  n2 := x.CreateElement('FTrackPenWidth', namespace);
  n2.Text := IntToStr(FTrackPenWidth);
  n1.ChildNodes.Add(n2);
  //轨迹线线型
  n2 := x.CreateElement('FTrackPenStyle', namespace);
  n2.Text := IntToStr(FTrackPenStyle);
  n1.ChildNodes.Add(n2);

  //渣土车进入空重车播放的声音
  n2 := x.CreateElement('AlarmSound_ZtCarry', namespace);
  n2.Text := FAlarmSound_ZtCarry;
  n1.ChildNodes.Add(n2);
  n2 := x.CreateElement('AlarmSound_ZtOff', namespace);
  n2.Text := FAlarmSound_ZtOff;
  n1.ChildNodes.Add(n2);

  //渣土车进入空重车 消息提示
  n2 := x.CreateElement('IsNoticeZtUploadCarryOffXslc', namespace);
  if FIsNoticeZtUploadCarryOffXslc then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('mrDownTime', namespace);
  n2.Text := IntToStr(mrDownTime);
  n1.ChildNodes.Add(n2);

  //坐席类型
  n2 := x.CreateElement('TelClientType', namespace);
  n2.Text := IntToStr(FTelClientType);
  n1.ChildNodes.Add(n2);
  //命令车机拨打的监听电话号码
  n2 := x.CreateElement('DevCallNumberForListenIn', namespace);
  n2.Text := FDevCallNumberForListenIn;
  n1.ChildNodes.Add(n2);

  //出租车空车颜色
  n2 := x.CreateElement('FTaxiEmptyColor', namespace);
  n2.Text := inttostr(FFTaxiEmptyColor);
  n1.ChildNodes.Add(n2);


  //出租车重车颜色
  n2 := x.CreateElement('FTaxiHavColor', namespace);
  n2.Text :=inttostr( FFTaxiHavColor);
  n1.ChildNodes.Add(n2);

  //司机报警颜色
  n2 := x.CreateElement('FDriverAlarmColor', namespace);
  n2.Text := inttostr(FFDriverAlarmColor);
  n1.ChildNodes.Add(n2);

  //进、出区域报警提示、疲劳报警提示、偏离路线报警提示、设防报警提示、低压报警
  n2 := x.CreateElement('isAlarmOutDevArea',namespace);
  if FisAlarmOutDevArea then n2.Text :='1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);
  n2 := x.CreateElement('isAlarmInDevArea',namespace);
  if FisAlarmInDevArea then n2.Text :='1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);
  n2 := x.CreateElement('isAlarmDriverFatigue',namespace);
  if FisAlarmDriverFatigue then n2.Text :='1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);
  n2 := x.CreateElement('isAlarmOutLine',namespace);
  if FisAlarmOutLine then n2.Text :='1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);
  n2 := x.CreateElement('isAlarmFortify',namespace);
  if FisAlarmFortify then n2.Text :='1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);
  n2 := x.CreateElement('isAlarmDevLowerPower',namespace);
  if FisAlarmDevLowerPower then n2.Text :='1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  //
  n2 := x.CreateElement('IsEmergncyAlarmAutoFirstAlarm',namespace);
  if FIsEmergncyAlarmAutoFirstAlarm then n2.Text :='1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('IsEarlyWarningAutoFirstAlarm', namespace);
  if FIsEarlyWarningAutoFirstAlarm then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('StopOverTimeAlarm',namespace); //混凝土，停车超时报警
  if FStopOverTimeAlarm <> '' then
  begin
    if StrToInt(FStopOverTimeAlarm) <=0 then n2.Text := '10' else n2.Text := FStopOverTimeAlarm;
  end
  else
    n2.Text := '10';

  n2 := x.CreateElement('IsAutoRefreshReceivedMsg', namespace);
  if FIsAutoRefreshReceivedMsg then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('IsDriverSucceedOrder', namespace);
  if FDriverSucceedOrder then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('SucceedOrderHintStr', namespace);
  n2.Text := FSucceedOrderHintStr;
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('IsOrderHaveTel', namespace);
  if FIsOrderHaveTel then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('IsSendTextWhenAlarm', namespace);
  if FIsSendTextWhenAlarm then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('IsAlarmInfoDealTip', namespace);
  if FIsAlarmInfoDealTip then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('IsDevOtherAlarm', namespace);
  if FIsDevOtherAlarm then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('CallBackTel', namespace);
  n2.Text := FCallBackTel;
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('AccOffAlarmDis', namespace);
  n2.Text := IntToStr(FAccOffAlarmDis);
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('MapServerIp', namespace);
  n2.Text := MapServerIp;
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('MapServerPort', namespace);
  n2.Text := IntToStr(MapServerPort);
  n1.ChildNodes.Add(n2);

  //n1.ChildNodes.Add(n2);
  Result := x;
end;

procedure TSystemParam.SetAlarmSound_InCArea(const Value: string);
begin
  FAlarmSound_InCArea := Value;
end;

procedure TSystemParam.SetAlarmSound_OutCArea(const Value: string);
begin
  FAlarmSound_OutCArea := Value;
end;

procedure TSystemParam.SetAlarmSound_ZtCarry(const Value: string);
begin
  FAlarmSound_ZtCarry := Value;
end;

procedure TSystemParam.SetAlarmSound_ZtOff(const Value: string);
begin
  FAlarmSound_ZtOff := Value;
end;

procedure TSystemParam.SetBizGuid(const Value: string);
begin
  FBizGuid := Value;
end;

procedure TSystemParam.SetBizOffTime(const Value: Integer);
begin
  FBizOffTime := Value;
end;

procedure TSystemParam.SetBusiness(const Value: TAddrssParam);
begin
  FBusiness := Value;
end;

procedure TSystemParam.SetBusinessBak(const Value: TAddrssParam);
begin
  FBusinessBak := Value;
end;


procedure TSystemParam.SetcarpicType(const Value: integer);
begin
  FcarpicType := Value;
end;

procedure TSystemParam.SetDefaultTrackPen(const Value: TPenStruct);
begin
  FDefaultTrackPen := Value;
end;

procedure TSystemParam.SetDevAlarmSound(const Value: string);
begin
  FDevAlarmSound := Value;
end;

procedure TSystemParam.SetDevCallNumberForListenIn(const Value: string);
begin
  FDevCallNumberForListenIn := Value;
end;

procedure TSystemParam.SetFDriverAlarmColor(const Value: integer);
begin
  FFDriverAlarmColor := Value;
end;

procedure TSystemParam.SetFlyDistance(const Value: Integer);
begin
  FFlyDistance := Value;
end;

procedure TSystemParam.SetFTaxiEmptyColor(const Value: integer);
begin
  FFTaxiEmptyColor := Value;
end;

procedure TSystemParam.SetFTaxiHavColor(const Value: integer);
begin
  FFTaxiHavColor := Value;
end;

procedure TSystemParam.SetStopOverTimeAlarm(const Value: string);
begin
  FStopOverTimeAlarm := Value;
end;

procedure TSystemParam.SetFTrackPenColor(const Value: Integer);
begin
  FFTrackPenColor := Value;
end;

procedure TSystemParam.SetFTrackPenStyle(const Value: Integer);
begin
  FFTrackPenStyle := Value;
end;

procedure TSystemParam.SetFTrackPenWidth(const Value: Integer);
begin
  FFTrackPenWidth := Value;
end;

procedure TSystemParam.SetGateway(const Value: TAddrssParam);
begin
  FGateway := Value;
end;

procedure TSystemParam.SetGatewayBak(const Value: TAddrssParam);
begin
  FGatewayBak := Value;
end;


procedure TSystemParam.SetInterceptGUID(const Value: string);
begin
  FInterceptGUID := Value;
end;



procedure TSystemParam.SetisAlarmDevLowerPower(const Value: Boolean);
begin
  FisAlarmDevLowerPower := Value;
end;

procedure TSystemParam.SetisAlarmDriverFatigue(const Value: Boolean);
begin
  FisAlarmDriverFatigue := Value;
end;

procedure TSystemParam.SetisAlarmFortify(const Value: Boolean);
begin
  FisAlarmFortify := Value;
end;

procedure TSystemParam.SetisalarmHurry(const Value: boolean);
begin
  FisalarmHurry := Value;
end;

procedure TSystemParam.SetIsEarlyWariningHurry(const Value: Boolean);
begin
  FIsEarlyWariningHurry := Value;
end;

procedure TSystemParam.SetisAlarmInDevArea(const Value: Boolean);
begin
  FisAlarmInDevArea := Value;
end;

procedure TSystemParam.SetisAlarmOutDevArea(const Value: Boolean);
begin
  FisAlarmOutDevArea := Value;
end;

procedure TSystemParam.SetisAlarmOutLine(const Value: Boolean);
begin
  FisAlarmOutLine := Value;
end;

procedure TSystemParam.SetisEletrShutDownAlarm(const Value: boolean);
begin
  FisEletrShutDownAlarm := Value;
end;

procedure TSystemParam.SetIsEmergncyAlarmAutoFirstAlarm(
  const Value: Boolean);
begin
  FIsEmergncyAlarmAutoFirstAlarm := Value;
end;

procedure TSystemParam.SetIsEarlyWarningAutoFirstAlarm(const Value: Boolean);
begin
  FIsEarlyWarningAutoFirstAlarm := Value;
end;

procedure TSystemParam.SetIsNoticeZtUploadCarryOffXslc(
  const Value: Boolean);
begin
  FIsNoticeZtUploadCarryOffXslc := Value;
end;

procedure TSystemParam.SetisOilShutDownAlarm(const Value: boolean);
begin
  FisOilShutDownAlarm := Value;
end;

procedure TSystemParam.SetIsOverSpeedAlarm(const Value: Boolean);
begin
  FIsOverSpeedAlarm := Value;
end;

procedure TSystemParam.SetIsPhotoShowhit(const Value: boolean);
begin
  FIsPhotoShowhit := Value;
end;

procedure TSystemParam.SetLayerParam(const Value: TLayerParamArray);
begin
  FLayerParam := Value;
end;

procedure TSystemParam.SetMapBottom(const Value: Integer);
begin
  FMapBottom := Value;
end;

procedure TSystemParam.SetMapLeft(const Value: Integer);
begin
  FMapLeft := Value;
end;

procedure TSystemParam.SetMapRight(const Value: Integer);
begin
  FMapRight := Value;
end;

procedure TSystemParam.SetMapTop(const Value: Integer);
begin
  FMapTop := Value;
end;

procedure TSystemParam.SetmrDownTime(const Value: integer);
begin
  FmrDownTime := Value;
end;

procedure TSystemParam.SetOrderVersion(const Value: integer);
begin
  FOrderVersion := Value;
end;

procedure TSystemParam.SetSkinName(const Value: string);
begin
  FSkinName := Value;
end;

procedure TSystemParam.SetTelClientType(const Value: byte);
begin
  FTelClientType := Value;
end;

procedure TSystemParam.SetAlarmSound_DevFault(const Value: string);
begin
  FAlarmSound_DevFault := Value;
end;

procedure TSystemParam.SetAlarmSound_Deviate(const Value: string);
begin
  FAlarmSound_Deviate := Value;
end;

procedure TSystemParam.SetAlarmSound_Fatigue(const Value: string);
begin
  FAlarmSound_Fatigue := Value;
end;

procedure TSystemParam.SetAlarmSound_PowerDown(const Value: string);
begin
  FAlarmSound_PowerDown := Value;
end;

procedure TSystemParam.SetAlarmSound_TimeoutStop(const Value: string);
begin
  FAlarmSound_TimeoutStop := Value;
end;

procedure TSystemParam.SetAlarmSound_Undervoltage(const Value: string);
begin
  FAlarmSound_Undervoltage := Value;
end;

procedure TSystemParam.SetIsDevOtherAlarm(const Value: Boolean);
begin
  FIsDevOtherAlarm := Value;
end;

procedure TSystemParam.SetIsSendTextWhenAlarm(const Value: Boolean);
begin
  FIsSendTextWhenAlarm := Value;
end;

procedure TSystemParam.SetCallBackTel(const Value: String);
begin
  FCallBackTel := Value;
end;

procedure TSystemParam.SetAlarmSound_ServerDisConnect(const Value: string);
begin
  FAlarmSound_ServerDisConnect := Value;
end;

procedure TSystemParam.SetAccOffAlarmDis(const Value: Integer);
begin
  FAccOffAlarmDis := Value;
end;

procedure TSystemParam.SetMapServerIp(const Value: String);
begin
  FMapServerIp := Value;
end;

procedure TSystemParam.SetServerPort(const Value: Integer);
begin
  FMapServerPort := Value;
end;

procedure TSystemParam.SetIsAlarmInfoDealTip(const Value: Boolean);
begin
  FIsAlarmInfoDealTip := Value;
end;

end.

