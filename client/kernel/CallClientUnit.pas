{*�ͻ��˶���Ԫ
}
unit CallClientUnit;

interface
uses
  classes,
  Sockets,
  ScktComp,
  SysUtils,
  StructDefUnit;

type
  {*���������¼�,�ͻ����ڽ������ߵ绰ʱ�������¼�
  @param Sender �����¼��Ķ���
  @param ATelephone �������
  @param ACallLogID ���������ݿ��¼�е�ID
  @param STCmdFlag ������(�г����硢�����������硢�������߼�������)
  }
  TReceiveTelephoneEvent = procedure(Sender: TObject; ATelephone: String; ACallLogID: Integer;STCmdFlag:Byte)of object;
  {*�ͻ����¼�,�ͻ���״̬�����仯���¼������Ӵ���ȣ��¼����������Ԫ EVENT_��ͷ�ĳ�������
  @param Sender �����¼��Ķ���
  @param EventCode �¼�����
  @param AParam ���Ӳ��� �����¼�������в�ͬ�ĺ���
  }
  TClientEvent = procedure(Sender: TObject; EventCode: Integer; AParam: Integer)of object;
  {*�ͻ���ע����û�ͨ���������¼�,��Ҫ��ָͨ���仯���¼������StructDefUnit��ԪUSER_EVENT_��ͷ�ĳ�������
  @param Sender �׳��¼��Ķ���
  @param EventCode �¼����� ��@seealso(StructDefUnit)��Ԫ����}
  TClientUserChannelEvent = procedure(Sender: TObject; EventCode: Integer)of object;
  {*�ͻ���ͨ�����������仯ʱ����,�¼�ֻ���͸�������ͬ���͵Ŀͻ���
  @param Sender �׳��¼��Ķ���
  @param ClientCount ��������״̬�ͻ��������Ľṹ}
  TClientCountChangeEvent = procedure(Sender: TObject; ClientCount: TClientCountData)of object;

  TShowStateEvent = procedure(Sender: TObject; State: TState) of object;

  {���������绰��������һ��������ϯ���м�����
  ���绰��������֪�����м����ļ�����ϯ����ǰ���еļ�����ϯ��״̬��Ϊ���ߵڶ���������ϯ�ṩ׼��}
  TAlarmUserChannelStateEvent= procedure(ABuff:PCmdSTAlarmUserChannelState) of object;
  {���������ص� �ͻ���Ҫ���߼����Ľ����Ret: Byte; //0ʧ�� 1�ɹ�}
  TRetAlarmMonitorWithOtherEvent = Procedure(Ret:Byte)of object;
  {*@abstract���пͻ��˶���
  ���пͻ��˶����װ�������������������Ĺ���,�ͻ����������������Ľ�������ֻ��Ҫ����пͻ��˶��󽻻�������}
  TCallClient = class(TComponent)
  private
    FSocket: TClientSocket;
    FOnReceiveTelephone: TReceiveTelephoneEvent;
    FClientType: Integer;
    FUserChannelNo: Integer;
    FBuffer: array[0..1024*8] of byte;
    FBufferLen: Integer;
    FOnClientEvent: TClientEvent;
    FOnUserChannelEvent: TClientUserChannelEvent;
    FOnUserClientCountChange: TClientCountChangeEvent;
    FOnShowState: TShowStateEvent;
    FOnAlarmUserChannelStateEvent: TAlarmUserChannelStateEvent;
    FOnRetAlarmMonitorWithOtherEvent: TRetAlarmMonitorWithOtherEvent;
    
    function GetServerAddress: String;
    function GetServerPort: String;
    procedure SetOnReceiveTelephone(const Value: TReceiveTelephoneEvent);
    procedure SetServerAddress(const Value: String);
    procedure SetServerPort(const Value: String);
    function GetActive: Boolean;
    procedure SetClientType(const Value: Integer);
    procedure SetUserChannelNo(const Value: Integer);
    procedure SetOnClientEvent(const Value: TClientEvent);
    procedure SetOnUserChannelEvent(const Value: TClientUserChannelEvent);
    procedure SetOnUserClientCountChange(const Value: TClientCountChangeEvent);
    procedure SetOnAlarmUserChannelStateEvent(const Value: TAlarmUserChannelStateEvent);
    procedure DoAlarmUserChannelStateEvent(ABuf: PCmdSTAlarmUserChannelState);
    procedure DoRetAlarmMonitorWithOther(ARet:Byte);
    procedure SetOnRetAlarmMonitorWithOtherEvent(const Value: TRetAlarmMonitorWithOtherEvent);
  private
    procedure DealBuffer;
    procedure FSocketOnReceive(Sender: TObject; Socket: TCustomWinSocket);
    procedure FSocketOnError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure FSocketOnDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure FSocketOnConnect(Sender: TObject; Socket: TCustomWinSocket);
  protected
    procedure DoReceiveTelephoneEvent(ATelephone: String; ACallLogID: Integer;STCmdFlag:Byte);
    procedure DoClientEvent(AEventCode: Integer; AParam: Integer);
    procedure DoUserChannelEvent(AEventCode: Integer);
    procedure DoUserClientCountChangeEvent(AClientCount: TClientCountData);
    procedure DoShowState(State: TState);
    procedure DoCallDriver(Ret:Byte);       //����˾���绰���˿�-��ϯ->˾�����������صĽ��
    procedure DoCallTheDriver(Ret: Byte);   //����˾���绰����ϯ-˾��˫�������صĽ��
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy;override;
    {*��ʼ����,����������ע��ͻ��˵�����}
    procedure StartWork;
    {*ֹͣ����,һ����Բ���,�����˳��Ϳ�}
    procedure StopWork;
    {*��ͣ����,����Ҫ�뿪һ���,��Ҫͨ����������������������ʱ�뿪,�ȷ�����Ӧ��ͬ��󷽿�}
    procedure PauseWork;
    {*��������,��ͣ���������}
    procedure ResumeWork;
    {*���ӵ绰}
    procedure SwitchToMe;
    {*���߷��������õ绰�����ʹ����÷����������Ŷ�}
    procedure NotifyServerErrorCall();
    //����˾���绰. ��������ͨ�����˿�-��ϯ->˾��������
    procedure CallDriver(Tel:String);
    //����˾���绰������ϯ-˾��˫���� 2009.2.3
    procedure CallTheDriver(Tel: String);
    //һ��������ϯ��Ҫ������һ��������ϯ������ͬ����һ������
    procedure AlarmMonitorWithOtherChannel(AUserChannelId: Integer);
    //�������û����Ż�ֹͣ�������֣�����������������Ϊ�����û��г�ʱ�������û����������ҵ���������sha.2010.07.20��
    procedure PlayOrStopMusic2Ext(APlayFlag:Byte);
  published
    {*������������ַ}
    property ServerAddress: String read GetServerAddress write SetServerAddress;
    {*�����������˿�}
    property ServerPort: String read GetServerPort write SetServerPort;
    {*�����¼�����}
    property OnReceiveTelephone: TReceiveTelephoneEvent read FOnReceiveTelephone write SetOnReceiveTelephone;
    {*�ͻ����¼�����}
    property OnClientEvent: TClientEvent read FOnClientEvent write SetOnClientEvent;
    {*���пͻ����Ƿ������������}
    property Work: Boolean read GetActive;
    {*�ͻ��˱����û�ͨ����}
    property UserChannelNo: Integer read FUserChannelNo write SetUserChannelNo;
    {*�ͻ������� 0 ��ʾ���ȿͻ��ˣ�1��ʾͶ�߿ͻ���}
    property ClientType: Integer read FClientType write SetClientType;
    {*�û�ͨ���¼�}
    property OnUserChannelEvent: TClientUserChannelEvent read FOnUserChannelEvent write SetOnUserChannelEvent;
    {*�ͻ��������仯�¼�}
    property OnUserClientCountChange: TClientCountChangeEvent read FOnUserClientCountChange write SetOnUserClientCountChange;
    property OnShowState: TShowStateEvent read FOnShowState write FOnShowState;
    {*�绰��������֪��ǰ���м�����ϯ��״̬���¼�}
    property OnAlarmUserChannelStateEvent:TAlarmUserChannelStateEvent read FOnAlarmUserChannelStateEvent write SetOnAlarmUserChannelStateEvent;
    {*�绰��������֪���ͻ���Ҫ���߼����Ľ��}
    property OnRetAlarmMonitorWithOtherEvent: TRetAlarmMonitorWithOtherEvent read FOnRetAlarmMonitorWithOtherEvent write SetOnRetAlarmMonitorWithOtherEvent;
  end;
implementation
      uses uGloabVar, VSMSClientUnit;
{ TCallClient }



constructor TCallClient.Create(AOwner: TComponent);
begin
  inherited;
  FSocket := TClientSocket.Create(nil);
  FSocket.ClientType := ctNonBlocking;
  FSocket.OnRead := FSocketOnReceive;
  FSocket.OnError := FSocketOnError;
  FSocket.OnConnect := FSocketOnConnect;
  FSocket.OnDisconnect := FSocketOnDisconnect;
end;

procedure TCallClient.DealBuffer;     //�յ��绰����������
var
  cmdRegister: PCmdSTRegisterData;
  cmdCallin: PCmdSTCallInData;
  cmdUserChannelEvent: PCmdSTUserChannelEventData;
  cmdClientCountChange: PCmdSTClientCountChangeData;
  CmdSTShowState: PCmdSTShowState;
  len: Word;
begin
  while FBufferLen > 2 do
  begin
    len := PWord(@FBuffer[0])^;
    if len <= 2 then
    begin
      //error
      FBufferLen := 0;
      FSocket.Close;
      StartWork;
    end;
    if len > FBufferLen then
      Exit;
    try
      case PByte(@FBuffer[2])^ of
        CMD_ST_REGISTER:           //�绰������Ӧ�𣺿ͻ���ע��
        begin
          cmdRegister := PCmdSTRegisterData(@FBuffer[0]);
          DoClientEvent(cmdRegister^.Ret ,cmdRegister^.State);
        end;
        CMD_ST_CALLIN,
        CMD_ST_CALLIN_MONITORTHIRD: //������֪ͨ�ͻ���,�ѽ�ͨ�������� (CMD_ST_CALLIN-�г����硢�����������磬CMD_ST_CALLIN_MONITORTHIRD�������߼�������)
        begin
          cmdCallin := PCmdSTCallInData(@FBuffer[0]);
          DoReceiveTelephoneEvent(cmdCallin^.CallNo, cmdCallin^.CallID,PByte(@FBuffer[2])^);
        end;
        CMD_ST_USERCHANNEL_EVENT:   //������֪ͨ�ͻ��ˣ���ע����û�ͨ�������¼�
        begin
          cmdUserChannelEvent := PCmdSTUserChannelEventData(@FBuffer[0]);
          DoUserChannelEvent(cmdUserChannelEvent^.Event);
        end;
        CMD_ST_CLIENT_COUNT_CHANGE:  //������֪ͨ�ͻ���:�ڷ������Ͽͻ��˵����������仯
        begin
          cmdClientCountChange := PCmdSTClientCountChangeData(@FBuffer[0]);
          DoUserClientCountChangeEvent(cmdClientCountChange^.Client);
        end;
        CMD_ST_CALLTODRIVER:    //�绰������Ӧ����˾����������ͨ��
        begin
          DoCallDriver(PCmdSTCallToDriverRet(@FBuffer[0])^.Ret);
        end;
        CMD_ST_RETCALLTHEDRIVER://�绰������Ӧ�𣺲����ص绰(˫��)
        begin
          DoCallTheDriver(PCmdSTCallToDriverRet(@FBuffer[0])^.Ret);
        end;
        CMD_ST_ALARMUSERSTATE: //�绰��������֪���ڼ�������ϯ����ǰ���м�����ϯ��״̬��Ϊ���ߵڶ���������ϯ�ṩ׼��
        begin
          DoAlarmUserChannelStateEvent(PCmdSTAlarmUserChannelState(@FBuffer[0]));
        end;
        CMD_ST_RETALARMMONITORTHIRD: //�绰������Ӧ�𣺲��߼�������ظ� =$89;
        begin
          DoRetAlarmMonitorWithOther(PCmdSTAlarmMonitorThirdRet(@FBuffer[0])^.Ret);
        end;
        CMD_ST_SHOW_STATE:   // ʵʱ��ʾ��ǰ ͨ����¼ͳ��
        begin
          CmdSTShowState := PCmdSTShowState(@FBuffer[0]);
          DoShowState(CmdSTShowState^.state);
        end; 
      end;
    except
    end;
    Move(FBuffer[Len],FBuffer[0],FBufferLen-Len);
    FBufferLen := FBufferLen - Len;
  end;
end;

destructor TCallClient.Destroy;
begin
  FSocket.Free;
  inherited;
end;

procedure TCallClient.DoClientEvent(AEventCode: Integer; AParam: Integer);
begin
  if Assigned(FOnClientEvent) then
    FOnClientEvent(Self,AEventCode,AParam);
end;

procedure TCallClient.DoReceiveTelephoneEvent(ATelephone: String; ACallLogID: Integer;STCmdFlag:Byte);
begin
  if Assigned(FOnReceiveTelephone) then
    FOnReceiveTelephone(Self,ATelephone,ACallLogID,STCmdFlag);
end;

procedure TCallClient.DoUserChannelEvent(AEventCode: Integer);
begin
  if Assigned(FOnUserChannelEvent) then
    FOnUserChannelEvent(Self,AEventCode);
end;

procedure TCallClient.DoUserClientCountChangeEvent(
  AClientCount: TClientCountData);
begin
  if Assigned(FOnUserClientCountChange) then
    FOnUserClientCountChange(Self,AClientCount);
end;

procedure TCallClient.DoShowState(State: TState);
begin
  if Assigned(FOnShowState) then
    FOnShowState(Self, State);
end;

procedure TCallClient.FSocketOnConnect(Sender: TObject;
  Socket: TCustomWinSocket);
var
  cmd: TCmdTSRegisterData;
begin
  cmd.Size := SizeOf(cmd);
  cmd.Flag := CMD_TS_REGISTER;
  cmd.UserChannelNo := UserChannelNo;
  cmd.UserState := CLIENT_STATE_IDLE;
  cmd.UserType := ClientType;
  FSocket.Socket.SendBuf(cmd,cmd.Size);
end;

procedure TCallClient.FSocketOnDisconnect(Sender: TObject; Socket: TCustomWinSocket);
var
  i: Integer;
  buf: array of Byte;
begin
  i := FSocket.Socket.ReceiveLength;
  if i > 0 then
  begin
    SetLength(buf,i);
    FSocket.Socket.ReceiveBuf(buf[0],i);
    Move(buf[0],FBuffer[FBufferLen],i);
    FBufferLen := FBufferLen + i;
    DealBuffer;
  end;
  DoClientEvent(EVENT_SOCKET_ERROR,0);
end;

procedure TCallClient.FSocketOnError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  ErrorCode := 0;
  DoClientEvent(EVENT_SOCKET_ERROR,0);
end;

procedure TCallClient.FSocketOnReceive(Sender: TObject;
  Socket: TCustomWinSocket);
var
  i: Integer;
  buf: array of Byte;
begin
  i := FSocket.Socket.ReceiveLength;
  if i <= 0 then Exit;
  SetLength(buf,i);
  FSocket.Socket.ReceiveBuf(buf[0],i);
  Move(buf[0],FBuffer[FBufferLen],i);
  FBufferLen := FBufferLen + i;
  DealBuffer;
end;

function TCallClient.GetActive: Boolean;
begin
  Result := FSocket.Active;
end;

function TCallClient.GetServerAddress: String;
begin
  Result := FSocket.Host;
end;

function TCallClient.GetServerPort: String;
begin
  Result := IntToStr(FSocket.Port);
end;

procedure TCallClient.NotifyServerErrorCall;
var
  cmd: TCmdTSErrorCalLType;
begin
  if Work then
  begin
    cmd.Size := Sizeof(cmd);
    cmd.Flag := CMD_TS_ERROR_CALLTYPE;
    if ClientType = 0 then
      cmd.CallType := 1
    else
      cmd.CallType := 0;
    FSocket.Socket.SendBuf(cmd,cmd.Size);
  end;
end;

procedure TCallClient.PauseWork;
var
  cmd: TCmdTSRegisterData;
begin
  if FSocket.Active then
  begin
    cmd.Size := SizeOf(cmd);
    cmd.Flag := CMD_TS_REGISTER;
    cmd.UserChannelNo := UserChannelNo;
    cmd.UserState := CLIENT_STATE_PAUSE;
    cmd.UserType := ClientType;
    FSocket.Socket.SendBuf(cmd,cmd.Size);
  end;
end;

procedure TCallClient.ResumeWork;
var
  cmd: TCmdTSRegisterData;
begin
  if FSocket.Active then
  begin
    cmd.Size := SizeOf(cmd);
    cmd.Flag := CMD_TS_REGISTER;
    cmd.UserChannelNo := UserChannelNo;
    cmd.UserState := CLIENT_STATE_IDLE;
    cmd.UserType := ClientType;
    FSocket.Socket.SendBuf(cmd,cmd.Size);
  end;
end;

procedure TCallClient.SetClientType(const Value: Integer);
begin
  FClientType := Value;
end;

procedure TCallClient.SetOnClientEvent(const Value: TClientEvent);
begin
  FOnClientEvent := Value;
end;

procedure TCallClient.SetOnReceiveTelephone(
  const Value: TReceiveTelephoneEvent);
begin
  FOnReceiveTelephone := Value;
end;

procedure TCallClient.SetOnUserChannelEvent(
  const Value: TClientUserChannelEvent);
begin
  FOnUserChannelEvent := Value;
end;

procedure TCallClient.SetOnUserClientCountChange(
  const Value: TClientCountChangeEvent);
begin
  FOnUserClientCountChange := Value;
end;

procedure TCallClient.SetServerAddress(const Value: String);
begin
  FSocket.Host := Value;
end;

procedure TCallClient.SetServerPort(const Value: String);
begin
  FSocket.Port := StrToInt(Value);
end;

procedure TCallClient.SetUserChannelNo(const Value: Integer);
begin
  FUserChannelNo := Value;
end;

procedure TCallClient.StartWork;
var
  cmd: TCmdTSRegisterData;
begin
  FSocket.Open;
//  if FSocket.Active then
  begin
    cmd.Size := SizeOf(cmd);
    cmd.Flag := CMD_TS_REGISTER;
    cmd.UserChannelNo := UserChannelNo;
    cmd.UserState := CLIENT_STATE_IDLE;
    cmd.UserType := ClientType;
    FSocket.Socket.SendBuf(cmd,cmd.Size);
  end;
end;

procedure TCallClient.StopWork;
begin
  FSocket.Close;
end;

procedure TCallClient.SwitchToMe;
var
  cmd: TCmdTSSwitchToMeData;
begin
  if not Work then Exit;
  cmd.Size := SizeOf(cmd);
  cmd.Flag := CMD_TS_SWITCH_TO_ME;
  FSocket.Socket.SendBuf(cmd,cmd.Size);
end;


procedure TCallClient.CallDriver(Tel: String); //����ͨ��
var
  cmd: TCmdTSCallToDriver;
begin
  if not Work then Exit;
  cmd.Size := SizeOf(cmd);
  cmd.Flag :=   CMD_TS_CALLTODRIVER ;
  cmd.DriverTellNum:=Copy(Tel,1,20);
  FSocket.Socket.SendBuf(cmd,cmd.Size);
end;

procedure TCallClient.CallTheDriver(Tel:String);//����˾���绰������ϯͨ������ʱ�����ص绰��ʵ����ϯ��˾��(˫��)ͨ��
var
  cmd: TCmdTSCallToDriver;
begin
  if not Work then Exit;
  cmd.Size := SizeOf(cmd);
  cmd.Flag :=   CMD_TS_CALLTHEDRIVER ; 
  cmd.DriverTellNum:=Copy(Tel,1,20);
  FSocket.Socket.SendBuf(cmd,cmd.Size);
end;

procedure TCallClient.DoCallDriver(Ret: Byte);
var
  s:string;
begin
  //����˾���绰���˿�-��ϯ->˾�����������صĽ��
  case Ret of
    CALL_DRIVER_NOIDLELINE:       s:='ʧ�ܣ�û�п�������ͨ��';
    CALL_DRIVER_ERRTELLNUM:       s:='ʧ�ܣ�����ĵ绰����';
    CALL_DRIVER_NOLISTEN_OR_BUSY: s:='ʧ�ܣ��Է�æ��ʱ�����˽���';
    CALL_DRIVER_THIRDTALKING:     s:='����ͨ���ɹ�';
    CALL_DRIVER_CREATEFAILED:     s:= 'ʧ�ܣ���������ͨ��ʧ��';
    else
      s:='����˾���绰ʧ��,δ֪ԭ��.';
  end;
  PopMsg('����ͨ��',s);
end;

procedure TCallClient.DoCallTheDriver(Ret: Byte);
var
  s:string;
begin
  //����˾���绰����ϯ-˾��˫���������صĽ��
  case Ret of
    CALL_DRIVER_NOIDLELINE:       s :='ʧ�ܣ�û�п�������ͨ��';
    CALL_DRIVER_ERRTELLNUM:       s :='ʧ�ܣ�����ĵ绰����';
    CALL_DRIVER_NOLISTEN_OR_BUSY: s :='ʧ�ܣ��Է�æ��ʱ�����˽���';
    CALL_DRIVER_USERNOTPICKUP:    s :='ʧ�ܣ�����ժ���ٲ��绰';
    CALL_DRIVER_USERBUSY :        s :='ʧ�ܣ�����ͨ��æ���������ڽ�������';
    CALL_DRIVER_TALKOK :          s :='�ɹ���ͨ���ص绰';
    else
      s:='ʧ�ܣ�δ֪ԭ��.';
  end;
  PopMsg('�����ص绰',s);
end;

procedure TCallClient.DoAlarmUserChannelStateEvent(ABuf:PCmdSTAlarmUserChannelState);
begin
  if Assigned(FOnAlarmUserChannelStateEvent) then
    FOnAlarmUserChannelStateEvent(ABuf);
end;

procedure TCallClient.SetOnAlarmUserChannelStateEvent(
  const Value: TAlarmUserChannelStateEvent);
begin
  FOnAlarmUserChannelStateEvent := Value;
end;

procedure TCallClient.AlarmMonitorWithOtherChannel(AUserChannelId:Integer);
var
  cmd:TCmdTSAlarmMonitorThird;
begin
  if not Work then Exit;
  cmd.Size := SizeOf(cmd);
  cmd.Flag := CMD_TS_ALARMMONITORTHIRD ;  //�����ͻ���Ҫ�󡡲��߼�������
  cmd.thirdChannelID:= AUserChannelId;
  FSocket.Socket.SendBuf(cmd,cmd.Size);
end;

procedure TCallClient.DoRetAlarmMonitorWithOther(ARet:Byte);
begin
  if Assigned(FOnRetAlarmMonitorWithOtherEvent) then
    FOnRetAlarmMonitorWithOtherEvent(ARet);
end;

procedure TCallClient.SetOnRetAlarmMonitorWithOtherEvent(
  const Value: TRetAlarmMonitorWithOtherEvent);
begin
  FOnRetAlarmMonitorWithOtherEvent := Value;
end;

//�������û����Ż�ֹͣ�������֣�����������������Ϊ�����û��г�ʱ�������û����������ҵ���������sha.2010.07.20��
procedure TCallClient.PlayOrStopMusic2Ext(APlayFlag: Byte);
var
  cmd:TCmdTSPlayOrStopMusic2Ext;
begin
  if not Work then Exit;
  cmd.Size := SizeOf(cmd);
  cmd.Flag := CMD_TS_PLAY_STOPMUSIC2EXT;
  cmd.PlayFlag:= APlayFlag;
  FSocket.Socket.SendBuf(cmd,cmd.Size);
end;

end.
