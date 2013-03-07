{*�ṹ����������}
unit StructDefUnit;

interface
const
  CLIENT_STATE_IDLE = 0; //  {*���У������ͻ��˴��ڵȴ������绰״̬}
  CLIENT_STATE_BUSY = 1; //  {*�ӵ绰���ͻ�������������ͨ����}
  CLIENT_STATE_READY = 2; //  {*׼���ӵ绰������ͻ������壬�ȴ�ժ��}
  CLIENT_STATE_PAUSE = 3; //  {*�ͻ�����ʱֹͣ�����绰���ͻ�����ʱ�������绰����״̬�£�������������ÿͻ��˷���绰}

  CLIENT_TYPE_SCHEDULE = 0; //  {*������ϯ}
  CLIENT_TYPE_ACCUSE = 1; // {*Ͷ�߿ͻ���}
  CLIENT_TYPE_ALARMMONITOR = 2;//����������ϯ

  CMD_TS_REGISTER = $00; // {*�ͻ���ע���ı�״̬�����־}
  CMD_ST_REGISTER = $80; // {*��������Ӧ�ͻ���ע���ı�״̬�����־}
  CMD_ST_CALLIN = $01; // {*������֪ͨ�ͻ������������־���ͻ���ժ���󣬽�ͨ���߻��յ��������}
  CMD_TS_CALLIN = $81; // {*����δ��}
  CMD_ST_USERCHANNEL_EVENT = $02; // {*�û�ͨ�����¼����ͻ��˵�����ͨ��״̬�����仯���յ�������¼����붨�������USER_EVENT_��ͷ�ĳ�������}
  CMD_ST_CLIENT_COUNT_CHANGE = $03; // {*�ͻ������������仯���յ��������������˸���״̬�ͻ��˵ĵ�ǰ����}
  CMD_TS_SWITCH_TO_ME = $84; //  {*�ͻ���Ҫ���������ڵȴ��ĵ绰���������ߵȴ�����ʱ���ͻ�������Ҫ�����ӵ绰}
  CMD_TS_ERROR_CALLTYPE = $85; // {*�ͻ���֪ͨ�������������Ͳ���}
  CMD_TS_CALLTODRIVER = $06; // {*�ͻ���Ҫ�� ��������ͨ��--����˾��}
  CMD_ST_CALLTODRIVER = $86; // {*�绰���������أ�����˾���绰�Ľ��}
  CMD_TS_CALLTHEDRIVER = $07; //����绰
  CMD_ST_RETCALLTHEDRIVER = $87; //����绰״̬�ظ�
  CMD_ST_ALARMUSERSTATE = $88; //������->�ͻ���,ˢ�±����ͻ�ר��״̬
  CMD_TS_ALARMMONITORTHIRD = $09; //�ͻ���Ҫ���߼�������
  CMD_ST_RETALARMMONITORTHIRD=$89; //���߼�������ظ�
  CMD_ST_CALLIN_MONITORTHIRD = $8A;//������֪ͨ�ͻ��ˣ���ǰ�����ǲ��߼������ͻ���ժ������յ�����������ṹͬTCmdSTCallInData

  CMD_TS_PLAY_STOPMUSIC2EXT = $0B; //�������û����Ż�ֹͣ�������֣�����������������Ϊ�����û��г�ʱ�������û����������ҵ���������sha.2010.07.19��
  CMD_ST_SHOW_STATE = $0A;    // ʵʱ��ʾ��ǰ ͨ����¼ͳ��  ͨ���е绰���� �Ŷ��е绰���� δ�ӵ绰����

  USER_EVENT_TALKWITH = 0; //  {*�û���ͨ���ߵ绰���û�ժ�������߽�ͨ����}
  USER_EVENT_PICKUP = 1; // {*�û�����ժ��,�Ƿ�����Ԥ�ڵ�}
  USER_EVENT_RING = 2; // {*������������û��ȴ����������ߣ��û�ͨ���ĵ绰��ʼ����}
  USER_EVENT_WAIT_EXT_HANGUP = 3; // {*�û���δժ���������ߵ绰���ȴ���ͨ�������ѹҶ�}
  USER_EVENT_TALK_HANGUP = 4; // {*�û�����������ͨ����,������δ�һ����û����ȹһ�}
  USER_EVENT_TALK_EXTHANGUP = 5; // {*�û�����������ͨ����,�������ȹһ�}
  USER_EVENT_TALK_FINISH_HANGUP = 6; // {*�û�������ͨ������,���߹һ���,�û������ٹһ�}
  USER_EVENT_WAIT_TIMEOUT = 7; // {*������������û��ĵ绰�������峬��N��3�������û���δ�����绰,�绰�ѱ������Ŷ�}
  USER_EVENT_HANGUP = 8; //  {*�û�������ժ�����ٹһ�,�Ƿ�����Ԥ�ڵ�}
  USER_EVENT_STOP = 9; // {*���������û�ִ�������������������û��ĵ绰�������ͻ���������}
  USER_EVENT_INNERTALKOVER = 10; // {*�ڲ�ͨ���ѽ�������Է��ҵ绰}

  //��������ͨ��(��������)�����صĽ��:0��1��2��3��4
  CALL_DRIVER_NOIDLELINE = 0; // {*û�п�������ͨ��}
  CALL_DRIVER_ERRTELLNUM = 1; // {*����ĵ绰����}
  CALL_DRIVER_NOLISTEN_OR_BUSY = 2; // {*�Է�æ��ʱ�����˽���}
  CALL_DRIVER_THIRDTALKING = 3; // {*�Է���ժ������������ͨ��}
  CALL_DRIVER_CREATEFAILED = 4; // {*������������ʧ����}

  CALL_DRIVER_USERNOTPICKUP = 5;//�û�δժ��������ժ���ٲ��绰����
  CALL_DRIVER_USERBUSY = 6;     //�û�����ͨ��æ���������ڽ�������
  CALL_DRIVER_TALKOK = 7;//����˾���绰�ɹ�
  //����˾���绰��˫�������ܷ��صĽ����0��1��2��5��6��7

  //�ͻ���ע�ᣬ�ͻ���Ҫ����ͣ���绰����������ֵ��ض��壺��
  {*ע��ɹ�}
  EVENT_CLIENT_REGISTER_OK = 0;
  {*��Ч��ͨ����}
  EVENT_CLIENT_INVALID_CHANNNEL = 1;
  {*ͨ�����ѱ�ע��}
  EVENT_CLIENT_CHANNEL_INUSE = 2;
  {*ע�����}
  EVENT_SOCKET_ERROR = -1;
  {*������ͣ����}
  EVENT_CLIENT_ALLOW_CHANGE_STATE = 3;
  {*��������ͣ����}
  EVENT_CLIENT_DISALLOW_CHANGE_STATE = 4;
  {*�����ͨ�����ͣ���ϯ���� �� ͨ���Ų�ƥ�䡣
  ���������ͻ��ˡ�Ϊ������ϯ��������ͨ����Ϊ �绰������ָ���ı���ͨ����
  ���������ͻ��ˡ�Ϊ����������ϯ����ͨ���Ų��ڡ��绰������ָ���ı���ͨ�����б�֮��
  ��ע���ɵ绰������ָ��ĳ����ͨ��Ϊ����ͨ����}
  EVENT_CLIENT_ERRCHANNELTYPE = 5;
  EVENT_CLIENT_HEART = 10;  // �绰���������͹���������

type
  {*@abstract�ͻ��������ṹ
  �ͻ��������ṹ@html(<br/>)
  Idle ��������@html(<br/>)
  Pause ��ͣ��������@html(<br/>)
  Ready ׼�������绰����@html(<br/>)
  Busy ���ڽ����绰����@html(<br/>)
  }
  TClientCountData = packed record
    Total: Integer;
    Idle: Integer;
    Pause: Integer;
    Ready: Integer;
    Busy: Integer;
  end;

  {*TCmdTSRegisterData��ָ�붨��}
  PCmdTSRegisterData = ^TCmdTSRegisterData;

  {*@abstract�ͻ��˵���������ע������
  �ͻ��˵���������ע������@html(<br/>)
  Size ����
  Flag �����־��Ӧ��ΪCMD_TS_REGISTER @html(<br/>)
  UserChannelNo �ͻ��˵�ͨ����@html(<br/>)
  UserState �ͻ��˵�״̬���ı�״̬ʱ��Ч@html(<br/>)
  UserType �ͻ��˵�����}
  TCmdTSRegisterData = packed record
    {*����}
    Size: Word;
    {*�����־,Ӧ��Ϊ}
    Flag: Byte;
    {�ͻ��˵�ͨ����}
    UserChannelNo: Byte;
    {*�ͻ��������״̬,�ı�״̬ʱ��Ч}
    UserState: Byte;
    {*�ͻ�������,Ͷ�߻����}
    UserType: Byte;
  end;
  {*TCmdSTRegisterData��ָ�붨��}
  PCmdSTRegisterData = ^TCmdSTRegisterData;
  {*@abstract��������Ӧ�ͻ��˵�ע������
  ��������Ӧ�ͻ��˵�ע������@html(<br/>)
  Size ����@html(<br/>)
  Flag �����־ Ӧ��ΪCMD_ST_REGISTER @html(<br/>)
  Ret ����ֵ@html(<br/>)
  State �ͻ���Ӧ�����е�״̬}
  TCmdSTRegisterData = packed record
    Size: Word;
    Flag: Byte;
    Ret: Byte; //0 �ɹ� 1 ͨ���Ų����� 2 ͨ������ռ�ã�3 ����ı�״̬ 4 ������ı�״̬ �������1,2������˽���Ͽ�����
    State: Integer; //�ͻ��˵�״̬ �������δ�Ͽ�,��״̬���ǿͻ��˵�ǰ��״̬
  end;

  {*TCmdSTCallInData��ָ�붨��}
  PCmdSTCallInData = ^TCmdSTCallInData;
  {*@abstract������������Ϣ
  �������յ�������Ϣ�����ͻ��˵�����@html(<br/>)
  Size ����@html(<br/>)
  Flag �����־ Ӧ��ΪCMD_ST_CALLIN @html(<br/>)
  CallNo ������� @html(<br/>)
  CallID �����¼ID}
  TCmdSTCallInData = packed record
    Size: Word;
    Flag: Byte;
    CallNo: string[20];
    CallID: Integer;
  end;

  {*TCmdTSCallInData��ָ�붨��}
  PCmdTSCallInData = ^TCmdTSCallInData;
  {*@abstract����δ��
  �ͻ���������Ϣ���������,��ʱû��}
  TCmdTSCallInData = packed record
    Size: Word;
    Flag: Byte;
    Ret: Integer; //0 �յ� ����������ָ����ʱ����δ�յ������ط�
  end;
  {*@abstract���ͻ���ע����û�ͨ�������¼�ʱ��������֪ͨ�ͻ��ˣ���ע����û�ͨ�����¼�
  ���ͻ���ע����û�ͨ�������¼�ʱ��������֪ͨ�ͻ��ˣ���ע����û�ͨ�����¼�@html(<br/>)
  Size ����@html(<br/>)
  Flag �����־ Ӧ��ΪCMD_ST_USERCHANNEL_EVENT@html(<br/>)
  Event �������¼�����}
  TCmdSTUserChannelEventData = packed record
    Size: Word;
    Flag: Byte;
    Event: Byte;
  end;
  {*TCmdSTUserChannelEventData��ָ�붨��}
  PCmdSTUserChannelEventData = ^TCmdSTUserChannelEventData;
  {*@abstract���ڷ������Ͽͻ��˵����������仯ʱ,������֪ͨ�ͻ��˵�����
  ���ڷ������Ͽͻ��˵����������仯ʱ,������֪ͨ�ͻ��˵�����@html(<br/>)
  Size ����@html(<br/>)
  Flag �����־ Ӧ��ΪCMD_ST_CLIENT_COUNT_CHANGE@html(<br/>)
  Client �ͻ��˵����@html(<br/>)
  }
  TCmdSTClientCountChangeData = packed record
    Size: Word;
    Flag: Byte;
    Client: TClientCountData;
  end;
  {*TCmdSTClientCountChangeData��ָ�붨��}
  PCmdSTClientCountChangeData = ^TCmdSTClientCountChangeData;

  TState = packed record
    Busy: Integer;    // ͨ���е�����
    Ready: Integer;   // �Ŷ��е�����
    Pause: Integer;   // δ�ӵ绰����
  end;

  TCmdSTShowState = packed record
    Size: Word;
    Flag: Byte;
    State: TState;
  end;
  PCmdSTShowState = ^TCmdSTShowState;

  {*@abstract�ͻ�����Ҫ�������ڵȴ��ĵ绰
  �ͻ�����Ҫ�������ڵȴ��ĵ绰@html(<br/>)
  Size ����@html(<br/>)
  Flag �����־}
  TCmdTSSwitchToMeData = packed record
    Size: Word;
    Flag: Byte;
  end;
  {*TCmdTSSwitchToMeData��ָ�붨��}
  PCmdTSSwitchToMeData = ^TCmdTSSwitchToMeData;
  {*@abstract�ͻ���֪ͨ��������ǰ�ĵ绰���ʹ����˻ط����������Ŷ�
  �ͻ���֪ͨ��������ǰ�ĵ绰���ʹ����˻ط����������Ŷ�@html(<br/>)
  Size ����@html(<br/>)
  Flag �����־@html(<br/>)
  CallType: �绰����ȷ���� 0 ��ʾ�ǽг��绰 1 ��ʾ��Ͷ�ߵ绰
  }
  TCmdTSErrorCalLType = packed record
    Size: Word;
    Flag: Byte;
    CallType: Integer;
  end;
  {*TCmdTSErrorCalLType��ָ�붨��}
  PCmdTSErrorCalLType = ^TCmdTSErrorCalLType;

  {*@abstract�ͻ���Ҫ�� ��������ͨ��--Ҫ��绰������ȥ����˾��
  �ͻ���Ҫ�� ��������ͨ��--Ҫ��绰������ȥ����˾��@html(<br/>)
  Size ����@html(<br/>)
  Flag �����־ CMD_TS_CALLTODRIVER = $06 @html(<br/>)
  DriverTellNum ˾������ @html(<br/>)}
  TCmdTSCallToDriver = packed record
    Size: Word;
    Flag: Byte;
    DriverTellNum: string[20];
  end;
  {*TCmdTSCallToDriver��ָ�붨��}
  PCmdTSCallToDriver = ^TCmdTSCallToDriver;
  {*@abstract�绰���������أ�����˾���绰�Ľ��
  �绰���������أ�����˾���绰�Ľ��@html(<br/>)
  Size ����@html(<br/>)
  Flag �����־ CMD_ST_CALLTODRIVER = $86; @html(<br/>)}
  TCmdSTCallToDriverRet = packed record
    Size: Word;
    Flag: Byte;
    Ret: Byte; //�鿴����Ԫ�� ��CALL_DRIVER��ͷ�Ķ���
  end;
  {*TCmdSTCallToDriverRet��ָ�붨��}
  PCmdSTCallToDriverRet = ^TCmdSTCallToDriverRet;

  //���б�����ϯ�ĵ�ǰ״̬
  TCmdSTAlarmUserChannelState = packed record
    Size: Word;
    Flag: Byte;
    alarmUserChannelNum: Integer; //������ϯ����
    alarmUserChannelID: array[0..63] of Integer; //������ϯͨ����
    alarmUserID: array[0..63] of Integer;  //������ϯ�ֻ���
    //������ϯ״̬����CLIENT_STATE_
    alarmUserChannelState: array[0..63] of Integer;  
  end;
  PCmdSTAlarmUserChannelState = ^TCmdSTAlarmUserChannelState;

  //������߼�������
  TCmdTSAlarmMonitorThird =packed record
    Size: Word;
    Flag: Byte;
    thirdChannelID:Integer; //������ϯ��ͨ����
  end;
  PCmdTSAlarmMonitorThird = ^TCmdTSAlarmMonitorThird;

  TCmdSTAlarmMonitorThirdRet = packed record
    Size: Word;
    Flag: Byte;
    Ret: Byte; //0ʧ�� 1�ɹ�
  end;
  {*TCmdSTCallToDriverRet��ָ�붨��}
  PCmdSTAlarmMonitorThirdRet = ^TCmdSTAlarmMonitorThirdRet;

  {*@abstract�������û����Ż�ֹͣ��������
   ������������������Ϊ�����û��г�ʱ�������û����������ҵ�������).Add:sha.2010.07.19@html(<br/>)
  Size ����@html(<br/>)
  Flag �����־CMD_TS_PLAY_STOPMUSIC2EXT = $0B;
  PlayFlay ���ű�ǣ�1�ţ�0ͣ}
  TCmdTSPlayOrStopMusic2Ext = packed record
    Size: Word;
    Flag: Byte;
    PlayFlag : Byte; //���ű�ǣ�1�ţ�0ͣ
  end;
  PCmdTSPlayOrStopMusic2Ext = ^TCmdTSPlayOrStopMusic2Ext;

{*��ÿͻ���״̬����}
function GetClientStateDesc(AState: Integer): string;
{*����û�ͨ���¼�����}
function GetUserEventDesc(AEvent: Integer): string;
implementation

function GetClientStateDesc(AState: Integer): string;
begin
  case AState of
    CLIENT_STATE_IDLE: Result := '����';
    CLIENT_STATE_BUSY: Result := '��æ';
    CLIENT_STATE_READY: Result := '׼��';
    CLIENT_STATE_PAUSE: Result := '��ͣ';
  else
    Result := 'δ֪״̬';
  end;
end;

function GetUserEventDesc(AEvent: Integer): string;
begin
  case AEvent of
    USER_EVENT_TALKWITH: Result := '�û���ͨ���ߵ绰';
    USER_EVENT_PICKUP: Result := '�û�ժ��,�Ƿ�����Ԥ�ڵ�';
    USER_EVENT_RING: Result := '�û�ͨ���ĵ绰��ʼ����';
    USER_EVENT_WAIT_EXT_HANGUP: Result := '�ȴ���ͨ�������ѹҶ�';
    USER_EVENT_TALK_HANGUP: Result := '����ͨ����,�û����ȹһ�';
    USER_EVENT_TALK_EXTHANGUP: Result := '����ͨ����,�������ȹһ�';
    USER_EVENT_TALK_FINISH_HANGUP: Result := 'ͨ������,���߹һ���,���߹һ�';
    USER_EVENT_WAIT_TIMEOUT: Result := '�û�����δ�����绰,�绰�ѱ������Ŷ�';
    USER_EVENT_HANGUP: Result := '�û��һ�,�Ƿ�����Ԥ�ڵ�';
    USER_EVENT_STOP: Result := '�û��绰������';
    USER_EVENT_INNERTALKOVER: Result := '�ڲ�ͨ���ѽ�������Է�ͨ���ҵ绰';
  else
    Result := 'δ֪';
  end;
end;

end.

