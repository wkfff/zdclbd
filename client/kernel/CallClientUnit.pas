{*客户端对象单元
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
  {*接收来电事件,客户端在接听外线电话时发生的事件
  @param Sender 发出事件的对象
  @param ATelephone 来电号码
  @param ACallLogID 来电在数据库记录中的ID
  @param STCmdFlag 命令字(叫车来电、报警监听来电、报警并线监听来电)
  }
  TReceiveTelephoneEvent = procedure(Sender: TObject; ATelephone: String; ACallLogID: Integer;STCmdFlag:Byte)of object;
  {*客户端事件,客户端状态发生变化的事件或连接错误等，事件代码见本单元 EVENT_开头的常量定义
  @param Sender 发出事件的对象
  @param EventCode 事件代码
  @param AParam 附加参数 根据事件代码而有不同的含义
  }
  TClientEvent = procedure(Sender: TObject; EventCode: Integer; AParam: Integer)of object;
  {*客户端注册的用户通道发生的事件,主要是指通道变化，事件代码见StructDefUnit单元USER_EVENT_开头的常量定义
  @param Sender 抛出事件的对象
  @param EventCode 事件代码 见@seealso(StructDefUnit)单元定义}
  TClientUserChannelEvent = procedure(Sender: TObject; EventCode: Integer)of object;
  {*客户端通道数量发生变化时发生,事件只发送给所有相同类型的客户端
  @param Sender 抛出事件的对象
  @param ClientCount 包含各种状态客户端数量的结构}
  TClientCountChangeEvent = procedure(Sender: TObject; ClientCount: TClientCountData)of object;

  TShowStateEvent = procedure(Sender: TObject; State: TState) of object;

  {报警监听电话进来，有一个监听座席进行监听后，
  　电话服务器告知正进行监听的监听座席：当前所有的监听座席的状态，为并线第二个监听座席提供准备}
  TAlarmUserChannelStateEvent= procedure(ABuff:PCmdSTAlarmUserChannelState) of object;
  {服务器返回的 客户端要求并线监听的结果　Ret: Byte; //0失败 1成功}
  TRetAlarmMonitorWithOtherEvent = Procedure(Ret:Byte)of object;
  {*@abstract呼叫客户端对象
  呼叫客户端对象封装了与语音服务器交互的过程,客户端与语音服务器的交互过程只需要与呼叫客户端对象交互即可以}
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
    procedure DoCallDriver(Ret:Byte);       //拨打司机电话（乘客-座席->司机三方）返回的结果
    procedure DoCallTheDriver(Ret: Byte);   //拨打司机电话（座席-司机双方）返回的结果
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy;override;
    {*开始工作,即到服务器注册客户端的数据}
    procedure StartWork;
    {*停止工作,一般可以不调,程序退出就可}
    procedure StopWork;
    {*暂停工作,有事要离开一会儿,需要通过这个方法向服务器申请暂时离开,等服务器应答同意后方可}
    procedure PauseWork;
    {*继续工作,暂停后继续工作}
    procedure ResumeWork;
    {*抢接电话}
    procedure SwitchToMe;
    {*告诉服务器，该电话的类型错误，让服务器重新排队}
    procedure NotifyServerErrorCall();
    //报打司机电话. 进行三方通话（乘客-座席->司机三方）
    procedure CallDriver(Tel:String);
    //拨打司机电话，（座席-司机双方） 2009.2.3
    procedure CallTheDriver(Tel: String);
    //一个监听座席　要求并线另一个监听座席，来共同监听一个车机
    procedure AlarmMonitorWithOtherChannel(AUserChannelId: Integer);
    //向外线用户播放或停止播放音乐（播放音乐用于正在为外线用户叫车时，不让用户听到调度室的嘈杂音。sha.2010.07.20）
    procedure PlayOrStopMusic2Ext(APlayFlag:Byte);
  published
    {*语音服务器地址}
    property ServerAddress: String read GetServerAddress write SetServerAddress;
    {*语音服务器端口}
    property ServerPort: String read GetServerPort write SetServerPort;
    {*来电事件属性}
    property OnReceiveTelephone: TReceiveTelephoneEvent read FOnReceiveTelephone write SetOnReceiveTelephone;
    {*客户端事件属性}
    property OnClientEvent: TClientEvent read FOnClientEvent write SetOnClientEvent;
    {*呼叫客户端是否与服务器连接}
    property Work: Boolean read GetActive;
    {*客户端本地用户通道号}
    property UserChannelNo: Integer read FUserChannelNo write SetUserChannelNo;
    {*客户端类型 0 表示调度客户端，1表示投诉客户端}
    property ClientType: Integer read FClientType write SetClientType;
    {*用户通道事件}
    property OnUserChannelEvent: TClientUserChannelEvent read FOnUserChannelEvent write SetOnUserChannelEvent;
    {*客户端数量变化事件}
    property OnUserClientCountChange: TClientCountChangeEvent read FOnUserClientCountChange write SetOnUserClientCountChange;
    property OnShowState: TShowStateEvent read FOnShowState write FOnShowState;
    {*电话服务器告知当前所有监听座席的状态　事件}
    property OnAlarmUserChannelStateEvent:TAlarmUserChannelStateEvent read FOnAlarmUserChannelStateEvent write SetOnAlarmUserChannelStateEvent;
    {*电话服务器告知　客户端要求并线监听的结果}
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

procedure TCallClient.DealBuffer;     //收到电话服务器数据
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
        CMD_ST_REGISTER:           //电话服务器应答：客户端注册
        begin
          cmdRegister := PCmdSTRegisterData(@FBuffer[0]);
          DoClientEvent(cmdRegister^.Ret ,cmdRegister^.State);
        end;
        CMD_ST_CALLIN,
        CMD_ST_CALLIN_MONITORTHIRD: //服务器通知客户端,已接通外线来电 (CMD_ST_CALLIN-叫车来电、报警监听来电，CMD_ST_CALLIN_MONITORTHIRD报警并线监听来电)
        begin
          cmdCallin := PCmdSTCallInData(@FBuffer[0]);
          DoReceiveTelephoneEvent(cmdCallin^.CallNo, cmdCallin^.CallID,PByte(@FBuffer[2])^);
        end;
        CMD_ST_USERCHANNEL_EVENT:   //服务器通知客户端，其注册的用户通道发生事件
        begin
          cmdUserChannelEvent := PCmdSTUserChannelEventData(@FBuffer[0]);
          DoUserChannelEvent(cmdUserChannelEvent^.Event);
        end;
        CMD_ST_CLIENT_COUNT_CHANGE:  //服务器通知客户端:在服务器上客户端的数量发生变化
        begin
          cmdClientCountChange := PCmdSTClientCountChangeData(@FBuffer[0]);
          DoUserClientCountChangeEvent(cmdClientCountChange^.Client);
        end;
        CMD_ST_CALLTODRIVER:    //电话服务器应答：与司机进行三方通话
        begin
          DoCallDriver(PCmdSTCallToDriverRet(@FBuffer[0])^.Ret);
        end;
        CMD_ST_RETCALLTHEDRIVER://电话服务器应答：拨打车载电话(双方)
        begin
          DoCallTheDriver(PCmdSTCallToDriverRet(@FBuffer[0])^.Ret);
        end;
        CMD_ST_ALARMUSERSTATE: //电话服务器告知正在监听的座席：当前所有监听座席的状态，为并线第二个监听座席提供准备
        begin
          DoAlarmUserChannelStateEvent(PCmdSTAlarmUserChannelState(@FBuffer[0]));
        end;
        CMD_ST_RETALARMMONITORTHIRD: //电话服务器应答：并线监听结果回复 =$89;
        begin
          DoRetAlarmMonitorWithOther(PCmdSTAlarmMonitorThirdRet(@FBuffer[0])^.Ret);
        end;
        CMD_ST_SHOW_STATE:   // 实时显示当前 通话记录统计
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


procedure TCallClient.CallDriver(Tel: String); //三方通话
var
  cmd: TCmdTSCallToDriver;
begin
  if not Work then Exit;
  cmd.Size := SizeOf(cmd);
  cmd.Flag :=   CMD_TS_CALLTODRIVER ;
  cmd.DriverTellNum:=Copy(Tel,1,20);
  FSocket.Socket.SendBuf(cmd,cmd.Size);
end;

procedure TCallClient.CallTheDriver(Tel:String);//拨打司机电话，在座席通道空闲时拨打车载电话，实现座席与司机(双方)通话
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
  //拨打司机电话（乘客-座席->司机三方）返回的结果
  case Ret of
    CALL_DRIVER_NOIDLELINE:       s:='失败：没有空闲外线通道';
    CALL_DRIVER_ERRTELLNUM:       s:='失败：错误的电话号码';
    CALL_DRIVER_NOLISTEN_OR_BUSY: s:='失败：对方忙或长时间无人接听';
    CALL_DRIVER_THIRDTALKING:     s:='三方通话成功';
    CALL_DRIVER_CREATEFAILED:     s:= '失败：建立三方通话失败';
    else
      s:='拨打司机电话失败,未知原因.';
  end;
  PopMsg('三方通话',s);
end;

procedure TCallClient.DoCallTheDriver(Ret: Byte);
var
  s:string;
begin
  //拨打司机电话（座席-司机双方），返回的结果
  case Ret of
    CALL_DRIVER_NOIDLELINE:       s :='失败：没有空闲外线通道';
    CALL_DRIVER_ERRTELLNUM:       s :='失败：错误的电话号码';
    CALL_DRIVER_NOLISTEN_OR_BUSY: s :='失败：对方忙或长时间无人接听';
    CALL_DRIVER_USERNOTPICKUP:    s :='失败：请先摘机再拨电话';
    CALL_DRIVER_USERBUSY :        s :='失败：内线通道忙，可能正在接听外线';
    CALL_DRIVER_TALKOK :          s :='成功拨通车载电话';
    else
      s:='失败：未知原因.';
  end;
  PopMsg('拨打车载电话',s);
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
  cmd.Flag := CMD_TS_ALARMMONITORTHIRD ;  //监听客户端要求　并线监听报警
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

//向外线用户播放或停止播放音乐（播放音乐用于正在为外线用户叫车时，不让用户听到调度室的嘈杂音。sha.2010.07.20）
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
