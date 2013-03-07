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
    lay_Order: integer; //ͼ�����
    MapFont: TMapFont; //��ͼ������
  end;
  TLayerParamArray = array of TLayerParam;

  TAddrssParam = record
    Host: string;
    Port: Integer;
  end;

  TSystemParam = class
  private
    FFlyDistance: Integer; //�ɳ�����
    FLayerParam: TLayerParamArray;
    FMapRight: Integer;
    FMapLeft: Integer;
    FMapTop: Integer;
    FMapBottom: Integer;
    FGateway: TAddrssParam; //�����ط�����
    FIsUseGatewayBak: boolean;
    FGatewayBak: TAddrssParam; //�����ط�����
    FSkinName: string;
    FBusiness: TAddrssParam; //��ҵ�����
    FIsUseBusinessBak: boolean;
    FBusinessBak: TAddrssParam; //��ҵ�����
    FDefaultTrackPen: TPenStruct;
    FBizGuid: string;
    FInterceptGUID: string;
    FBizOffTime: Integer;
    FDevAlarmSound: string;
    FAlarmSound_OutCArea: string;
    FAlarmSound_InCArea: string;
    FStopOverTimeAlarm : string;//��������ͣ����ʱʱ��

    FIsUseTelServer: boolean;
    FTelServer: TAddrssParam;
    FTelChannel: integer;

    FDriverOverSpeet: boolean; //�����Ƿ���ʾ˾��.
    FAlarmFollow: boolean; //�����Ƿ����
    FSendSuccess: boolean; //���ͳɹ��Ƿ���ʾ
    FSendFail: boolean; //����ʧ���Ƿ���ʾ
    FConstMenu: boolean; //˾���ϴ��˵��Ƿ���ʾ
    FAttemperInfo: boolean; //������Ϣ�ظ��Ƿ���ʾ.
    FTelCall: boolean; //�����Ƿ���ʾ
    FFirstCutTel: boolean; //�ȹҶϿͻ��绰��ʾ;
    FTelNotClose: boolean; //�绰û�йҺ���ʾ;
    FShowTheMapOption: word; //�ڵ�ͼ����ʾ����Ż����豸����ѡ��.
    FFontSize: Word; //�ڵ�ͼ����ʾ���ƺŵ������С.
    FCarNOAndDevName: boolean; //���ƺź���豸������ʾ

    FShowAllDev: Boolean;
    FShowEmpty: Boolean;

    FisCarOnline: boolean; //��������ʾ
    FisCarUnOnline: boolean; //��������ʾ
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

    FDriverSucceedOrder: Boolean;   // �Ƿ���ʾ˾�������ɹ�
    FSucceedOrderHintStr: string;   // ��ʾ˾�������ɹ�����ʾ��

    FIsOrderHaveTel: Boolean;  // ���Ͷ�������Ϣ�а����˿͵绰����
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

    procedure SetStopOverTimeAlarm(const Value:string);//������������ͣ����ʱʱ��
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
    property Gateway: TAddrssParam read FGateway write SetGateway; //������
    property IsUseGatewayBak: boolean read FIsUseGatewayBak write FIsUseGatewayBak; //�Ƿ�ʹ�ø�����
    property GatewayBak: TAddrssParam read FGatewayBak write SetGatewayBak; //������

    property DefaultTrackPen: TPenStruct read FDefaultTrackPen write SetDefaultTrackPen;
    //-------���ز���
    property Business: TAddrssParam read FBusiness write SetBusiness; //��ҵ�������
    property IsUseBusinessBak: boolean read FIsUseBusinessBak write FIsUseBusinessBak; //�Ƿ�ʹ�ø�ҵ�������
    property BusinessBak: TAddrssParam read FBusinessBak write SetBusinessBak; //��ҵ�������

    property BizGuid: string read FBizGuid write SetBizGuid;
    property InterceptGUID: string read FInterceptGUID write SetInterceptGUID;
    property SkinName: string read FSkinName write SetSkinName; //Ƥ������
    property BizOffTime: Integer read FBizOffTime write SetBizOffTime;
    property DevAlarmSound: string read FDevAlarmSound write SetDevAlarmSound; //������������
    property AlarmSound_OutCArea: string read FAlarmSound_OutCArea write SetAlarmSound_OutCArea; //����Խ�籨������
    property AlarmSound_InCArea: string read FAlarmSound_InCArea write SetAlarmSound_InCArea;
    property AlarmSound_OverSpeet: string read FAlarmSound_OverSpeet write FAlarmSound_OverSpeet;
    property AlarmSound_CarUnOnline: string read FAlarmSound_CarUnOnline write FAlarmSound_CarUnOnline; //˾���ϴ��̶��˵�������
    property AlarmSound_DevFault: string read FAlarmSound_DevFault write SetAlarmSound_DevFault;//�豸��������
    property AlarmSound_Deviate: string read FAlarmSound_Deviate write SetAlarmSound_Deviate;//ƫ��·��
    property AlarmSound_Fatigue: string read FAlarmSound_Fatigue write SetAlarmSound_Fatigue;//ƣ�ͼ�ʻ
    property AlarmSound_PowerDown: string read FAlarmSound_PowerDown write SetAlarmSound_PowerDown;//�ϵ籨��
    property AlarmSound_TimeoutStop: string read FAlarmSound_TimeoutStop write SetAlarmSound_TimeoutStop;//��ʱͣ��;
    property AlarmSound_Undervoltage: string read FAlarmSound_Undervoltage write SetAlarmSound_Undervoltage;//Ƿѹ
    property AlarmSound_ServerDisConnect: string read FAlarmSound_ServerDisConnect write SetAlarmSound_ServerDisConnect;//�������Ͽ�

    property MenuSound: string read FMenuSound write FMenuSound;
    property TelServer: TAddrssParam read FTelServer write FTelServer;
    property TelChannel: integer read FTelChannel write FTelChannel;
    property IsUseTelServer: boolean read FIsUseTelServer write FIsUseTelServer; //�Ƿ�ʹ�õ绰������.


    property IsDriverOverSpeet: boolean read FDriverOverSpeet write FDriverOverSpeet; //�����Ƿ���ʾ˾��.
    property OverSpeetHintStr: string read FOverSpeetHintStr write FOverSpeetHintStr; //���ٺ�,��ʾ˾����
    //���򱨾���ʾ˾��
    property isAreaAlarmSendInfoToDriver: boolean read FisAreaAlarmSendInfoToDriver write FisAreaAlarmSendInfoToDriver;
    property IsAlarmFollow: boolean read FAlarmFollow write FAlarmFollow; //�����Ƿ����
    property IsSendSuccess: boolean read FSendSuccess write FSendSuccess; //���ͳɹ��Ƿ���ʾ
    property IsSendFail: boolean read FSendFail write FSendFail; //����ʧ���Ƿ���ʾ
    property IsConstMenu: boolean read FConstMenu write FConstMenu; //˾���ϴ��˵��Ƿ���ʾ
    property IsAttemperInfo: boolean read FAttemperInfo write FAttemperInfo; //������Ϣ�ظ��Ƿ���ʾ.
    property IsTelCall: boolean read FTelCall write FTelCall; //�����Ƿ���ʾ
    property IsFirstCutTel: boolean read FFirstCutTel write FFirstCutTel; //�ȹҶϿͻ��绰��ʾ;
    property IsFTelNotClose: boolean read FTelNotClose write FTelNotClose; //�绰û�йҺ���ʾ;
    property isCarNOAndDevName: boolean read FCarNOAndDevName write FCarNOAndDevName;
    property isShowAllDev: Boolean read FShowAllDev write FShowAllDev;
    property isShowEmpty: Boolean read FShowEmpty write FShowEmpty;
    property isCarOnline: boolean read FisCarOnline write FisCarOnline; //��������ʾ
    property isCarUnOnline: boolean read FisCarUnOnline write FisCarUnOnline; //��������ʾ
    property isShowEmptyFull: boolean read FisShowEmptyFull write FisShowEmptyFull; //�Ƿ���ʾ�ճ���
    property isAutoChangeMap: boolean read FisAutoChangeMap write FisAutoChangeMap; //�Ƿ��Զ��л���ͼ
    property isShowMasureError: boolean read FisShowMasureError write FisShowMasureError; //�Ƿ���ʾ�Ƽ�������
    property isUseMasure: boolean read FisUseMasure write FisUseMasure; //�Ƿ�ʹ�üƼ���
    property isUseDriverCard: boolean read FisUseDriverCard write FisUseDriverCard; //�Ƿ�ʹ��˾����
    property isLoadChinaRoad: boolean read FisLoadChinaRoad write FisLoadChinaRoad; //�Ƿ�����ȫ��·��ͼ
    property isAllCarUnOnlineAlarm: boolean read FisAllCarUnOnlineAlarm write FisAllCarUnOnlineAlarm; //�Ƿ�ȫ�������߱���.
    property isUpdate: boolean read FisUpdate write FisUpdate; // �Ƿ����
    property UpdateURL: string read FUpdateURL write FUpdateURL;  // ���µ�ַ
    property isFactory: boolean read FisFactory write FisFactory; //��ʹ�ù���������

    property IsOverSpeedAlarm: Boolean read FIsOverSpeedAlarm write SetIsOverSpeedAlarm; //�Ƿ��ٱ���
    property IsPhotoShowhit: boolean read FIsPhotoShowhit write SetIsPhotoShowhit; //=== �Ƿ���Ƭ��ʾ
    property isOilShutDownAlarm: boolean read FisOilShutDownAlarm write SetisOilShutDownAlarm; //�Ƿ������ʾ
    property isEletrShutDownAlarm: boolean read FisEletrShutDownAlarm write SetisEletrShutDownAlarm; //�Ƿ������ʾ
    property isalarmHurry: boolean read FisalarmHurry write SetisalarmHurry;
    property IsEarlyWariningHurry: Boolean read FIsEarlyWariningHurry write SetIsEarlyWariningHurry;
    property IsNoticeZtUploadCarryOffXslc: Boolean read FIsNoticeZtUploadCarryOffXslc write SetIsNoticeZtUploadCarryOffXslc; //�������ϴ����س���̣����س�״̬�仯����ʾ
    property FTrackPenColor: Integer read FFTrackPenColor write SetFTrackPenColor; //�켣����ɫ
    property FTrackPenWidth: Integer read FFTrackPenWidth write SetFTrackPenWidth; //�켣�߿��
    property FTrackPenStyle: Integer read FFTrackPenStyle write SetFTrackPenStyle; //�켣������

    property FDriverAlarmColor:integer read FFDriverAlarmColor write SetFDriverAlarmColor;//˾����������
    property FTaxiEmptyColor:integer read FFTaxiEmptyColor write SetFTaxiEmptyColor;//���⳵�ճ���ɫ
    property FTaxiHavColor:integer read FFTaxiHavColor write SetFTaxiHavColor;// ���⳵�س���ɫ
    property StopOverTimeAlarm:string read FStopOverTimeAlarm write SetStopOverTimeAlarm;//��������ͣ����ʱʱ��


    property ShowTheMapOption: word read FShowTheMapOption write FShowTheMapOption;
    property FontSize: word read FFontSize write FFontSize;

    property DownTime: integer read FTimeIsOnline write FTimeIsOnline; //�ж����ص�ʱ��
    property carpicType: integer read FcarpicType write SetcarpicType;

    property mrDownTime: integer read FmrDownTime write SetmrDownTime;

    //0:�����ذ�  1�������ذ�
    property OrderVersion: integer read FOrderVersion write SetOrderVersion;
    //������������س����ŵ������ļ���
    property AlarmSound_ZtCarry: string read FAlarmSound_ZtCarry write SetAlarmSound_ZtCarry;
    property AlarmSound_ZtOff: string read FAlarmSound_ZtOff write SetAlarmSound_ZtOff;
    //��ϯ���ͣ�������ϯCLIENT_TYPE_SCHEDULE������������ϯCLIENT_TYPE_ALARMMONITOR
    property TelClientType: Byte read FTelClientType write SetTelClientType;
    //���������ļ����绰����
    property DevCallNumberForListenIn: string read FDevCallNumberForListenIn write SetDevCallNumberForListenIn;
    //--GPS��λ�����еĸ���״̬������ʾ��
    property isAlarmInDevArea:Boolean read FisAlarmInDevArea write SetisAlarmInDevArea; //�Ƿ������(���õ�����������)������ʾ
    property isAlarmOutDevArea:Boolean read FisAlarmOutDevArea write SetisAlarmOutDevArea;//�Ƿ������(���õ�����������)������ʾ
    property isAlarmDriverFatigue:Boolean read FisAlarmDriverFatigue write SetisAlarmDriverFatigue; //�Ƿ�ƣ�ͼ�ʻ������ʾ
    property isAlarmOutLine:Boolean read FisAlarmOutLine write SetisAlarmOutLine; //�Ƿ� ƫ��·�߱�����ʾ
    property isAlarmFortify:Boolean read FisAlarmFortify write SetisAlarmFortify; //�Ƿ� ���������ʾ
    property isAlarmDevLowerPower:Boolean read FisAlarmDevLowerPower write SetisAlarmDevLowerPower;//�Ƿ��ѹ������ʾ
    //�Ƿ� �����������Զ��������б���ǰ
    property IsEmergncyAlarmAutoFirstAlarm:Boolean read FIsEmergncyAlarmAutoFirstAlarm write SetIsEmergncyAlarmAutoFirstAlarm;
    // �Ƿ� Ԥ��ʱ�Զ���Ԥ���б���ǰ
    property IsEarlyWarningAutoFirstAlarm:Boolean read FIsEarlyWarningAutoFirstAlarm write SetIsEarlyWarningAutoFirstAlarm;
    // �Ƿ��Զ�ˢ����Ϣ��ʾ
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
        FLayerParam[i].MapFont.Name := '����';
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
              FLayerParam[i].MapFont.Name:='����';

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
      n2 := n1.selectSingleNode('AlarmSound_OutCArea'); //����Խ�籨������add by sha 2005-5-31
      if n2 <> nil then FAlarmSound_OutCArea := Trim(n2.Text);
      n2 := n1.selectSingleNode('AlarmSound_InCArea');
      if n2 <> nil then FAlarmSound_InCArea := Trim(n2.text); //����ʻ�����򱨾� sha 2005-7-26

      n2 := n1.selectSingleNode('AlarmSound_OverSpeet');
      if n2 <> nil then FAlarmSound_OverSpeet := Trim(n2.text); //����ʻ�����򱨾� sha 2005-7-26

      n2 := n1.selectSingleNode('AlarmSound_CarUnOnline');
      if n2 <> nil then FAlarmSound_CarUnOnline := Trim(n2.text); //����ʻ�����򱨾� sha 2005-7-26

      n2 := n1.selectSingleNode('MenuSound');
      if n2 <> nil then FMenuSound := Trim(n2.text); //˾���̶��˵�����

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

      n2 := n1.selectSingleNode('IsUseGatewayBak'); //�Ƿ�ʹ�ø����ط�����  add by dxf 2005-09-01
      if n2 <> nil then
        if n2.text = '1' then FIsUseGatewayBak := true else FIsUseGatewayBak := false
      else
        FIsUseGatewayBak := false;

      n2 := n1.selectSingleNode('gatewayhostBak'); //�����ط�����  add by dxf 2005-09-01
      if n2 <> nil then FGatewayBak.Host := Trim(n2.Text);
      n2 := n1.selectSingleNode('gatewayportBak');
      if n2 <> nil then FGatewayBak.Port := StrToInt(n2.Text);

      n2 := n1.selectSingleNode('IsUseBusinessBak'); //�Ƿ�ʹ�ø����ط�����  add by dxf 2005-09-01
      if n2 <> nil then
        if n2.text = '1' then FIsUseBusinessBak := true else FIsUseBusinessBak := false
      else
        FIsUseBusinessBak := false;


      n2 := n1.selectSingleNode('bizserverhostBak'); //��ҵ������� add by dxf 2005-09-01
      if n2 <> nil then FBusinessBak.Host := Trim(n2.Text);
      n2 := n1.selectSingleNode('bizserverportBak');
      if n2 <> nil then FBusinessBak.Port := StrToInt(n2.Text);

      n2 := n1.selectSingleNode('IsUseTelServer'); //�Ƿ�ʹ�õ绰������
      if n2 <> nil then
        if n2.text = '1' then FIsUseTelServer := true else FIsUseTelServer := false
      else
        FIsUseTelServer := false;

      n2 := n1.selectSingleNode('TelServerHost'); //�绰������ add by dxf 2005-12-02
      if n2 <> nil then FTelServer.Host := Trim(n2.Text) else FTelServer.Host := '127.0.0.1';
      n2 := n1.selectSingleNode('TelServerPort');
      if n2 <> nil then FTelServer.Port := StrToInt(n2.Text) else FTelServer.Port := 0;

      n2 := n1.selectSingleNode('TelChannel');
      if n2 <> nil then FTelChannel := StrToInt(n2.Text) else FTelChannel := 2;
//-------------
      n2 := n1.selectSingleNode('IsDriverOverSpeet'); //�Ƿ�ʹ�õ绰������
      if n2 <> nil then
        if n2.text = '1' then FDriverOverSpeet := true else FDriverOverSpeet := false
      else
        FDriverOverSpeet := false;

      n2 := n1.selectSingleNode('IsAlarmFollow'); //�Ƿ�ʹ�õ绰������
      if n2 <> nil then
        if n2.text = '1' then FAlarmFollow := true else FAlarmFollow := false
      else
        FAlarmFollow := false;

      n2 := n1.selectSingleNode('IsSendSuccess'); //�Ƿ�ʹ�õ绰������
      if n2 <> nil then
        if n2.text = '1' then FSendSuccess := true else FSendSuccess := false
      else
        FSendSuccess := true;

      n2 := n1.selectSingleNode('IsSendFail'); //�Ƿ�ʹ�õ绰������
      if n2 <> nil then
        if n2.text = '1' then FSendFail := true else FSendFail := false
      else
        FSendFail := true;

      n2 := n1.selectSingleNode('IsConstMenu'); //�Ƿ�ʹ�õ绰������
      if n2 <> nil then
        if n2.text = '1' then FConstMenu := true else FConstMenu := false
      else
        FConstMenu := true;

      n2 := n1.selectSingleNode('IsAttemperInfo'); //�Ƿ�ʹ�õ绰������
      if n2 <> nil then
        if n2.text = '1' then FAttemperInfo := true else FAttemperInfo := false
      else
        FAttemperInfo := true;

      n2 := n1.selectSingleNode('IsTelCall'); //�Ƿ�ʹ�õ绰������
      if n2 <> nil then
        if n2.text = '1' then FTelCall := true else FTelCall := false
      else
        FTelCall := true;

      n2 := n1.selectSingleNode('IsFirstCutTel'); //�Ƿ�ʹ�õ绰������
      if n2 <> nil then
        if n2.text = '1' then FFirstCutTel := true else FFirstCutTel := false
      else
        FFirstCutTel := true;

      n2 := n1.selectSingleNode('IsFTelNotClose'); //�Ƿ�ʹ�õ绰������
      if n2 <> nil then
        if n2.text = '1' then FTelNotClose := true else FTelNotClose := false
      else
        FTelNotClose := true;

      n2 := n1.selectSingleNode('isCarNOAndDevName'); //���ƺź���豸����.
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

      n2 := n1.selectSingleNode('isCarOnline'); //���ƺź���豸����.
      if n2 <> nil then
        if n2.text = '1' then FisCarOnline := true else FisCarOnline := false
      else
        FisCarOnline := false;

      n2 := n1.selectSingleNode('isCarUnOnline'); //���ƺź���豸����.
      if n2 <> nil then
        if n2.text = '1' then FisCarUnOnline := true else FisCarUnOnline := false
      else
        FisCarUnOnline := false;

      n2 := n1.selectSingleNode('isShowEmptyFull'); //�Ƿ���ʾ�ճ���.
      if n2 <> nil then
        if n2.text = '1' then isShowEmptyFull := true else isShowEmptyFull := false
      else
        isShowEmptyFull := false;

      n2 := n1.selectSingleNode('isAutoChangeMap'); //�Ƿ��Զ��л���ͼ.
      if n2 <> nil then
        if n2.text = '1' then isAutoChangeMap := true else isAutoChangeMap := false
      else
        isAutoChangeMap := true;



      n2 := n1.selectSingleNode('isShowMasureError'); //�Ƿ���ʾ�Ƽ�������.
      if n2 <> nil then
        if n2.text = '1' then isShowMasureError := true else isShowMasureError := false
      else
        isShowMasureError := false;


      n2 := n1.selectSingleNode('isUseMasure'); //�Ƿ�ʹ�üƼ���.
      if n2 <> nil then
        if n2.text = '1' then isUseMasure := true else isUseMasure := false
      else
        isUseMasure := true;

      n2 := n1.selectSingleNode('isUseDriverCard'); //�Ƿ�ʹ��˾���� .
      if n2 <> nil then
        if n2.text = '1' then isUseDriverCard := true else isUseDriverCard := false
      else
        isUseDriverCard := false;



      n2 := n1.selectSingleNode('isAreaAlarmSendInfoToDriver'); //���򱨾��Ƿ���ʾ˾�� .
      if n2 <> nil then
        if n2.text = '1' then isAreaAlarmSendInfoToDriver := true else isAreaAlarmSendInfoToDriver := false
      else
        isAreaAlarmSendInfoToDriver := false;


      n2 := n1.selectSingleNode('isLoadChinaRoad'); //���򱨾��Ƿ���ʾ˾�� .
      if n2 <> nil then
        if n2.text = '1' then FisLoadChinaRoad := true else FisLoadChinaRoad := false
      else
        FisLoadChinaRoad := True;


      n2 := n1.selectSingleNode('isAllCarUnOnlineAlarm'); //�Ƿ�ȫ�������߱���..
      if n2 <> nil then
        if n2.text = '1' then FisAllCarUnOnlineAlarm := true else FisAllCarUnOnlineAlarm := false
      else
        FisAllCarUnOnlineAlarm := false;



      n2 := n1.selectSingleNode('IsOverSpeedAlarm'); //���򱨾��Ƿ���ʾ˾�� .
      if n2 <> nil then
        if n2.text = '1' then FIsOverSpeedAlarm := true else FIsOverSpeedAlarm := false
      else
        FIsOverSpeedAlarm := false;

      n2 := n1.selectSingleNode('IsPhotoShowhit'); //��Ƭ��ʾ .
      if n2 <> nil then
        if n2.text = '1' then FIsPhotoShowhit := true else FIsPhotoShowhit := false
      else
        FIsPhotoShowhit := false;

      n2 := n1.selectSingleNode('isOilShutDownAlarm'); //������ʾ .
      if n2 <> nil then
        if n2.text = '1' then FisOilShutDownAlarm := true else FisOilShutDownAlarm := false
      else
        FisOilShutDownAlarm := false;

      n2 := n1.selectSingleNode('isEletrShutDownAlarm'); //�ϵ���ʾ .
      if n2 <> nil then
        if n2.text = '1' then FisEletrShutDownAlarm := true else FisEletrShutDownAlarm := false
      else
        FisEletrShutDownAlarm := false;

      n2 := n1.selectSingleNode('isalarmHurry'); //����������ʾ .
      if n2 <> nil then
        if n2.text = '1' then FisalarmHurry := true else FisalarmHurry := false
      else
        FisalarmHurry := false;

      n2 := n1.selectSingleNode('IsEarlyWariningHurry'); // Ԥ����ʾ
      if n2 <> nil then
        if n2.text = '1' then FIsEarlyWariningHurry := True else FIsEarlyWariningHurry := False
      else
        FIsEarlyWariningHurry := False;

      n2 := n1.selectSingleNode('isUpdate'); //�Ƿ����..
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

      n2 := n1.selectSingleNode('isFactory'); //�Ƿ�ʹ�ù�������..
      if n2 <> nil then
        if n2.text = '1' then FisFactory := true else FisFactory := false
      else
        FisFactory := false;

      n2 := n1.selectSingleNode('ShowTheMapOption'); // ��ʾ���ƺ�/�豸���� /ֻ��ʾ��
      if (n2 <> nil) and (Trim(n2.text) <> '') then
        FShowTheMapOption := StrToInt(n2.text)//if n2.text = '1' then FShowTheMapOption := 1 else FShowTheMapOption := 0
      else
        FShowTheMapOption := 0;

      n2 := n1.selectSingleNode('FontSize'); //����
      if n2 <> nil then
        FFontSize := StrToInt(n2.text)
      else
        FFontSize := 8;

      n2 := n1.selectSingleNode('DownTime'); //����ʱ���ж�
      if n2 <> nil then
        Self.DownTime := StrToInt(n2.text)
      else
        Self.DownTime := 300;     

      n2 := n1.selectSingleNode('OverSpeetHintStr'); //��ʾ��
      if n2 <> nil then
        Self.OverSpeetHintStr := n2.text
      else
        Self.OverSpeetHintStr := '�벻Ҫ������ʹ,ע�ⰲȫ!';

      n2 := n1.selectSingleNode('carpicType'); //��ʾ��
      if n2 <> nil then
        Self.carpicType := strtoint(n2.text)
      else
        Self.carpicType := 0;

      n2 := n1.selectSingleNode('OrderVersion');
      if n2 <> nil then
        OrderVersion := StrToInt(n2.text)
      else
        OrderVersion := 0;

      n2 := n1.selectSingleNode('FTrackPenColor'); //�켣����ɫ
      if n2 <> nil then FTrackPenColor := StrToInt(n2.text)
      else
        FTrackPenColor := clRed;

      n2 := n1.selectSingleNode('FTrackPenWidth'); //�켣�߿��
      if n2 <> nil then FTrackPenWidth := StrToInt(n2.text)
      else
        FTrackPenWidth := 2;

      n2 := n1.selectSingleNode('FTrackPenStyle'); //�켣������
      if n2 <> nil then FTrackPenStyle := StrToInt(n2.text)
      else
        FTrackPenStyle := 1;
      //������������س�����
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

      //��ϯ���� 20090204 sha
      n2 := n1.selectSingleNode('TelClientType');
      if (n2 <> nil) and (n2.text <> '') then
        FTelClientType := StrToInt(n2.text)
      else
        FTelClientType := 0; //Ĭ��Ϊ0
      //���������ļ����绰����
      n2 := n1.selectSingleNode('DevCallNumberForListenIn');
      if n2 <> nil then
        FDevCallNumberForListenIn := n2.text
      else
        FDevCallNumberForListenIn := '';

       //���⳵�ճ���ɫ
      n2 := n1.selectSingleNode('FTaxiEmptyColor');
      if n2 <> nil then
        FFTaxiEmptyColor := StrToInt(n2.text)
      else
        FFTaxiEmptyColor :=16711680;

      //���⳵�س���ɫ
      n2 := n1.selectSingleNode('FTaxiHavColor');
      if n2 <> nil then
        fFTaxiHavColor := StrToInt(n2.text)
      else
        fFTaxiHavColor :=8388736;

      //���⳵������ɫ
      n2 := n1.selectSingleNode('FDriverAlarmColor');
      if n2 <> nil then
        FFDriverAlarmColor :=StrToInt(n2.text)
      else
        FFDriverAlarmColor := 255;
      //���������򱨾���ʾ��ƣ�ͱ�����ʾ��ƫ��·�߱�����ʾ�����������ʾ
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
        FIsEmergncyAlarmAutoFirstAlarm:= True;//Ĭ��Ϊ�Զ���ǰ

      n2 := n1.selectSingleNode('IsEarlyWarningAutoFirstAlarm');
      if n2 <> nil then
        if n2.text = '1' then FIsEarlyWarningAutoFirstAlarm := True else FIsEarlyWarningAutoFirstAlarm := False
      else
        FIsEarlyWarningAutoFirstAlarm := True;  // Ĭ���Զ���ǰ

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
  //����Խ�籨������ add by sha 2005-5-31
  n2 := x.CreateElement('AlarmSound_OutCArea', namespace);
  n2.Text := FAlarmSound_OutCArea;
  n1.ChildNodes.Add(n2);
  //����ʻ�����򱨾������� add sha 2005-7-26
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

  //�����ط�����   add dxf 2005-09-01
  n2 := x.CreateElement('IsUseGatewayBak', namespace);
  if FIsUseGatewayBak then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('gatewayhostBak', namespace);
  n2.Text := GatewayBak.Host;
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('gatewayportBak', namespace);
  n2.Text := IntToStr(GatewayBak.Port);
  n1.ChildNodes.Add(n2);

  //��ҵ�������  add dxf2005-09-01
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

  n2 := x.CreateElement('isCarNOAndDevName', namespace); ////���ƺź���豸����.
  if FCarNOAndDevName then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('isCarOnline', namespace); ////���ƺź���豸����.
  if FisCarOnline then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('isShowAllDev', namespace);
  if FShowAllDev then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('isShowEmpty', namespace);
  if FShowEmpty then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('isCarUnOnline', namespace); ////���ƺź���豸����.
  if FisCarUnOnline then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('isShowEmptyFull', namespace); ////�Ƿ���ʾ�ճ���.
  if isShowEmptyFull then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('isAutoChangeMap', namespace); ////�Ƿ��Զ��л���ͼ.
  if isAutoChangeMap then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('isShowMasureError', namespace); ////�Ƿ���ʾ�Ƽ�������.
  if isShowMasureError then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('isUseMasure', namespace); ////�Ƿ�ʹ�üƼ���.
  if isUseMasure then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);



  n2 := x.CreateElement('IsOverSpeedAlarm', namespace); ////�Ƿ񳬹��ٶȱ�����ʾ.
  if IsOverSpeedAlarm then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('isOilShutDownAlarm', namespace); ////�Ƿ���ͱ�����ʾ.
  if isOilShutDownAlarm then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('isEletrShutDownAlarm', namespace); ////�Ƿ�ϵ籨����ʾ.
  if isEletrShutDownAlarm then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('isalarmHurry', namespace); ////�Ƿ�Ͻ���������ʾ.
  if isalarmHurry then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('IsEarlyWariningHurry', namespace);
  if IsEarlyWariningHurry then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('IsPhotoShowhit', namespace); ////�Ƿ���Ƭ��ʾ.
  if IsPhotoShowhit then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('isUseDriverCard', namespace); ////�Ƿ�ʹ��˾����.
  if isUseDriverCard then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);


  n2 := x.CreateElement('isAreaAlarmSendInfoToDriver', namespace); //���򱨾��Ƿ���ʾ˾��.
  if FisAreaAlarmSendInfoToDriver then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('isLoadChinaRoad', namespace); //�Ƿ�����·��ͼ.
  if FisLoadChinaRoad then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('isAllCarUnOnlineAlarm', namespace); ////�Ƿ�ȫ�������߱���..
  if FisAllCarUnOnlineAlarm then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);


  n2 := x.CreateElement('isUpdate', namespace); ////�Ƿ����..
  if isUpdate then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('UpdateURL', namespace);   // ����Զ����µ�ַ
  n2.Text := FUpdateURL;
  n1.ChildNodes.Add(n2);


  n2 := x.CreateElement('isFactory', namespace); ////�Ƿ�ʹ�ù�������..
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

  //����
  n2 := x.CreateElement('OrderVersion', namespace);
  n2.Text := IntToStr(FOrderVersion);
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('carpicType', namespace);
  n2.Text := inttostr(self.carpicType);
  n1.ChildNodes.Add(n2);


  //�켣����ɫ
  n2 := x.CreateElement('FTrackPenColor', namespace);
  n2.Text := IntToStr(FTrackPenColor);
  n1.ChildNodes.Add(n2);
  //�켣�߿��
  n2 := x.CreateElement('FTrackPenWidth', namespace);
  n2.Text := IntToStr(FTrackPenWidth);
  n1.ChildNodes.Add(n2);
  //�켣������
  n2 := x.CreateElement('FTrackPenStyle', namespace);
  n2.Text := IntToStr(FTrackPenStyle);
  n1.ChildNodes.Add(n2);

  //������������س����ŵ�����
  n2 := x.CreateElement('AlarmSound_ZtCarry', namespace);
  n2.Text := FAlarmSound_ZtCarry;
  n1.ChildNodes.Add(n2);
  n2 := x.CreateElement('AlarmSound_ZtOff', namespace);
  n2.Text := FAlarmSound_ZtOff;
  n1.ChildNodes.Add(n2);

  //������������س� ��Ϣ��ʾ
  n2 := x.CreateElement('IsNoticeZtUploadCarryOffXslc', namespace);
  if FIsNoticeZtUploadCarryOffXslc then n2.Text := '1' else n2.Text := '0';
  n1.ChildNodes.Add(n2);

  n2 := x.CreateElement('mrDownTime', namespace);
  n2.Text := IntToStr(mrDownTime);
  n1.ChildNodes.Add(n2);

  //��ϯ����
  n2 := x.CreateElement('TelClientType', namespace);
  n2.Text := IntToStr(FTelClientType);
  n1.ChildNodes.Add(n2);
  //���������ļ����绰����
  n2 := x.CreateElement('DevCallNumberForListenIn', namespace);
  n2.Text := FDevCallNumberForListenIn;
  n1.ChildNodes.Add(n2);

  //���⳵�ճ���ɫ
  n2 := x.CreateElement('FTaxiEmptyColor', namespace);
  n2.Text := inttostr(FFTaxiEmptyColor);
  n1.ChildNodes.Add(n2);


  //���⳵�س���ɫ
  n2 := x.CreateElement('FTaxiHavColor', namespace);
  n2.Text :=inttostr( FFTaxiHavColor);
  n1.ChildNodes.Add(n2);

  //˾��������ɫ
  n2 := x.CreateElement('FDriverAlarmColor', namespace);
  n2.Text := inttostr(FFDriverAlarmColor);
  n1.ChildNodes.Add(n2);

  //���������򱨾���ʾ��ƣ�ͱ�����ʾ��ƫ��·�߱�����ʾ�����������ʾ����ѹ����
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

  n2 := x.CreateElement('StopOverTimeAlarm',namespace); //��������ͣ����ʱ����
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

