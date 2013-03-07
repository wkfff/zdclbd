{智能监控端 与  网关的通讯 --  接收数据模块
 @created()
 @lastmod(GMT:$Date: 2012/10/29 01:46:42 $) <BR>
 最后更新人:$Author: wfp $<BR>
 当前版本:$Revision: 1.1.1.1 $<BR>
 注：原为聂鑫做，用TSocketStream中Read来收数据，
 　　　实践证明：当多辆车同时来数据<或说当数据量大时>，接收缓慢
 　　后由沙更改，直接用recv接收数据，且缓冲区放成10240<10k>
 　　　实践证明：收数据较及时}
unit ScktCompUnit;

interface
uses
  Classes, syncobjs, Windows, ScktComp, WinSock, Consts,SystemLog;

type
  TSendHeartToGateway = function(): Boolean of object;

  TSocketBuffer=record
    ReadPos: Integer;
    WritePos: Integer;
    Size: Integer;
    Data: PByte;
  end;
  PSocketBuffer=^TSocketBuffer;

  TClientSocketThread = class(TThread)
  private
    FReadBuf: TSocketBuffer;
    FWriteBuf: TSocketBuffer;
    FSocket: TClientSocket;
    FLog:TSystemLog;
    FReadLock: TCriticalSection;
    FWriteLock: TCriticalSection;
    FReconnectTimeOut: Integer;
    FActive: Boolean;
    FActiveSleepTime: Integer;
    FInActiveSleepTime: Integer;
    FAddress: string;
    FHost: string;
    FPort: Integer;
    FOnSocketEvent: TSocketEventEvent;
    FAllowSendData: Boolean;
    FMaxReadBuf: Integer;
    FMaxWriteBuf: Integer;
    FOperateTimeOut: Integer;
    FOnWriteBufferOverflow: TNotifyEvent;
    FLastDisConnectTime: LongWord;
    FSendHeartToGateway: TSendHeartToGateway;

    FErrorCount : Integer; //计数器。连续20次 没收到数据 就 发一个心跳给网关. sha.2005-11-05
    isRecData:boolean;
    FDisConnectCount: integer;
    function PtrAdd(p:pointer;offset:integer):pointer;
    procedure SetReconnectTimeOut(const Value: Integer);
    procedure SetActive(Value: Boolean);
    function GetReadBuf: PSocketBuffer;
    function GetWriteBuf: PSocketBuffer;
    procedure SetActiveSleepTime(const Value: Integer);
    procedure SetInActiveSleepTime(const Value: Integer);
    procedure SetAddress(const Value: string);
    procedure SetHost(const Value: string);
    procedure SetPort(const Value: Integer);
    procedure SetOnSocketEvent(const Value: TSocketEventEvent);
    procedure SetAllowSendData(const Value: Boolean);
    procedure SetMaxReadBuf(const Value: Integer);
    procedure SetMaxWriteBuf(const Value: Integer);
    procedure SetSendHeartToGateway(const value: TSendHeartToGateway);
    procedure InitBuf(ABuf: TSocketBuffer);
    procedure SetOperateTimeOut(const Value: Integer);
    procedure DoSocketConnectEvent;
    procedure DoSocketDisConnectEvent;
    procedure SetOnWriteBufferOverflow(const Value: TNotifyEvent);
    procedure DoWriteBufferOverFlow;
    function GetSockerHandle: Integer;
    function GetActive: Boolean;
  private
    function WaitForData(TimeOut:Integer):boolean;
    function SendHeartBeat:boolean;
  protected
    procedure Execute; override;
    procedure DoSocketEvent(AnSocketEvent: TSocketEvent); virtual;
  public
    constructor Create(CreateSuspended: Boolean); virtual;
    procedure LockRead;
    procedure LockWrite;
    procedure UnLockRead;
    procedure UnLockWrite;
    destructor Destroy; override;
    property ReconnectTimeOut: Integer read FReconnectTimeOut write
        SetReconnectTimeOut;
    property Active: Boolean read GetActive write SetActive;
    property ReadBuf: PSocketBuffer read GetReadBuf;
    property WriteBuf: PSocketBuffer read GetWriteBuf;
    property ActiveSleepTime: Integer read FActiveSleepTime write 
        SetActiveSleepTime;
    property InActiveSleepTime: Integer read FInActiveSleepTime write
        SetInActiveSleepTime;
    property Address: string read FAddress write SetAddress;
    property Host: string read FHost write SetHost;
    property Port: Integer read FPort write SetPort;
    property SocketHandle: Integer read GetSockerHandle;
    property OnSocketEvent: TSocketEventEvent read FOnSocketEvent write
        SetOnSocketEvent;
    property OnSendHeartToGateway: TSendHeartToGateway read FSendHeartToGateway write
        SetSendHeartToGateway;
    property AllowSendData: Boolean read FAllowSendData write SetAllowSendData;
    property MaxReadBuf: Integer read FMaxReadBuf write SetMaxReadBuf;
    property MaxWriteBuf: Integer read FMaxWriteBuf write SetMaxWriteBuf;
    property OperateTimeOut: Integer read FOperateTimeOut write SetOperateTimeOut;
    property OnWriteBufferOverflow: TNotifyEvent read
        FOnWriteBufferOverflow write SetOnWriteBufferOverflow;
    property DisConnectCount:integer read FDisConnectCount write FDisConnectCount;
  end;

implementation
uses
{$IFOPT D+}
 DebugUnit,
{$ENDIF}
   sysutils ,MemFormatUnit,ugloabVar;

// 反转义接收到的数组中的特殊字符
procedure ShiftReceData(var buf: array of Byte; var bufLen: Integer);
var
   tempBuf: array[0..10239] of Byte;
   len, size: Integer;
   k,i,j: Integer;
   b: Byte;
begin
  len := bufLen;
  size := bufLen;
  j := 1;
  for i := 1 to len-2 do
  begin
    if (buf[i] = $5C) then
    begin
      b := Byte(buf[i + 1] xor $50);
      tempBuf[j] := b;
      k := i + 1;
      size := size - 1;
    end else
    begin
      k := i;
      tempBuf[j] := buf[k];
    end;
    j := j + 1;
  end;
  tempBuf[size-1] := buf[len-1];
  bufLen := size;
  FillChar(buf, SizeOf(buf), 0);
  CopyMemory(@buf[0], @tempBuf[0], bufLen);
end;
  
procedure TClientSocketThread.Execute;
var
  buf: array[0..204799] of Byte; //array[0..10239] of Byte;
  readCount: Integer;
  sendCount: Integer;
  canRead: Boolean;
  procedure ConnectBakGateway;  //连接备用网关 dxf 2006-10-25
  begin
    if GlobalParam.IsUseGatewayBak then  //尝试备用网关
    begin
      try
        FLastDisConnectTime := 0;

        if (FSocket.Host<>GlobalParam.GatewayBak.Host)or(FSocket.Port<>GlobalParam.GatewayBak.Port) then
        begin
            FSocket.Host := GlobalParam.GatewayBak.Host;
            FSocket.Port := GlobalParam.GatewayBak.Port;
            {$IFNDEF ForTestUser}
            {FSocket.Host := ConstIP;
            FSocket.Port := ConstPortOfGate; }
            {$ENDIF}
        end
        else
        begin
            FSocket.Host := GlobalParam.Gateway.Host;
            FSocket.Port := GlobalParam.Gateway.Port;
            {$IFNDEF ForTestUser}
            {FSocket.Host := ConstIP;
            FSocket.Port := ConstPortOfGate;   }
            {$ENDIF}
        end;
        Self.Host:=FSocket.Host;
        Self.Port:=FSocket.Port;
        FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+' 连接网关');
        FSocket.Active := True;
        Synchronize(DoSocketConnectEvent);
      except on E:Exception do
        begin
          FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+' 连接备用网关失败');
          FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+' '+E.Message);
          FSocket.Active := False;
          FLastDisConnectTime := GetTickCount;
        end;
      end;
    end;
  end;


  procedure DoSocket(const AnActive: Boolean);
  begin
    try
      if AnActive then
      begin
        try
              if FLastDisConnectTime > 0 then
              begin
                while (GetTickCount - FLastDisConnectTime) div 1000 < ReconnectTimeOut do
                  Sleep(200);
              end;
              if not FSocket.Active then
              begin
                FLastDisConnectTime := 0;
                FSocket.Host := Host;
                FSocket.Address := Address;
                FSocket.Port := Port;
                FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+' 连接网关');
                FSocket.Active := True;
                Sleep(1000);
                Synchronize(DoSocketConnectEvent);
              end;
              FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+' 连接网关成功');
              isRecData:=true;//连接成功了就认为收到数据了.
        except on E:Exception do
          begin
              FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+' 连接网关失败');
              FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+' '+E.Message);
              FSocket.Active := False;
              FLastDisConnectTime := GetTickCount;
              ConnectBakGateway
          end;
        end;
      end
      else
      begin
          FSocket.Active := False;
          FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+' 连接断开');
          Sleep(1000);
          Synchronize(DoSocketDisConnectEvent);
      end;
    except  on E:Exception do
       FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+' DoSocket Error:'+E.Message);
    end;
  end;

  procedure CheckActive;
  begin
    try
      if (FActive <> FSocket.Active) then
      begin
        DoSocket(FActive);
      end;
    except  on E:Exception do
       FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+' CheckActive Error:'+E.Message);
    end;
  end;

  function CheckReadBuf(var ABuf: TSocketBuffer; ADataSize: Integer):Boolean;
  var
    delta: Integer;
  begin
    Result := False;
    try
      try
        LockRead;
        with ABuf do
        begin
          if Size - WritePos >= ADataSize then Result := True
          else if Size < MaxReadBuf then
          begin
            if MaxReadBuf - Size > 1024*50 then
              Delta := (MaxReadBuf - Size) div 4
            else
              Delta := MaxReadBuf - Size;
            ReallocMem(Data,Size + delta);
            Inc(Size,delta);
            Result := True;
          end;
        end;
      except on E:Exception do
         FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+' CheckReadBuf Error:'+E.Message);
      end;
    finally
      UnLockRead;
    end;
  end;
begin
  while not Terminated do
  begin
    try
      CheckActive;  //check socket state
      if FSocket.Active then  //work
      begin
        If WaitForData(OperateTimeOut) then
        begin
          try
            readCount := recv(FSocket.Socket.SocketHandle,buf, Length(buf),0);

            //FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+' recv [' + MemFormatUnit.BuffToHex(@buf, readCount) + ']');
          except on E:Exception do
            FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+' recv Error:'+E.Message);
          end;
          if readCount >= 50000 then
            FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+' recv bytes = '+ IntToStr(readCount));
          if readCount <= 0 then      // Socket Server Disconnect
          begin
            Raise ESocketError.Create('Socket Server Disconnect');
            FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+' Socket Server Disconnect.');
            isRecData:=false;//如果连接断开就让为没有收到数据.
          end;
          if readCount > 0 then
          begin
            canRead := CheckReadBuf(FReadBuf,readCount);
            if not canRead then
            begin//抛出缓冲区溢出事件然后重新检查缓冲区
              Sleep(10);//缓冲区数据未处理完等待10ms
              canRead := CheckReadBuf(FReadBuf, readCount);
              if not canRead then
              begin
                FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+' 缓冲区溢!重新检查缓冲区.');
                Synchronize(DoWriteBufferOverFlow);
                canRead := CheckReadBuf(FReadBuf,readCount);
              end;
            end;
            if not canRead then
            begin
              FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+' 缓冲区溢,清空缓冲区.');
              LockRead;
              try
                CopyMemory(FReadBuf.Data,
                           PtrAdd(FReadBuf.Data,readCount + FReadBuf.WritePos - FReadBuf.Size),
                           FReadBuf.Size - readCount);
              except on E:Exception do
                FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+' CopyMemory Error:'+E.Message);
              end;
              FReadBuf.WritePos := FReadBuf.Size - readCount;
              UnLockRead;
            end;
            LockRead;
            try
              //FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+' '+BuffToHex(@buf[0],ReadCount));//记录收到数据
              CopyMemory(PtrAdd(FReadBuf.Data,FReadBuf.WritePos),@buf[0],ReadCount);
              Inc(FReadBuf.WritePos,ReadCount);
            finally
              UnLockRead;
            end;
          end;
        end;
        //Write;
        if AllowSendData and (FWriteBuf.WritePos > 0) then
        begin
          sendCount := FWriteBuf.WritePos;
          if sendCount > 1024 then sendCount := 1024;
          FSocket.Socket.SendBuf(FWriteBuf.Data^,sendCount);
          LockWrite;
          try
            CopyMemory(FWriteBuf.Data,PtrAdd(FWriteBuf.Data,sendCount),FWriteBuf.WritePos-sendCount);
            Dec(FWriteBuf.WritePos, sendCount);
          finally
            UnLockWrite;
          end;
        end;
      end;
      //sleep
      if FSocket.Active then
      begin
        Sleep(ActiveSleepTime)
      end
      else
      begin
        Sleep(InActiveSleepTime);
      end;
    except on E:Exception do
      begin
        FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+' Socket Error:'+E.Message);
        DoSocket(False);
      end;
    end;
  end;
end;

constructor TClientSocketThread.Create(CreateSuspended: Boolean);
begin
  inherited Create(True);
  InitBuf(FReadBuf);
  InitBuf(FWriteBuf);
  FReadLock := TCriticalSection.Create;
  FWriteLock := TCriticalSection.Create;
  FSocket := TClientSocket.Create(nil);
  FSocket.ClientType := ctBlocking;

  FActiveSleepTime := 1;
  FInActiveSleepTime := 6000;
  FMaxReadBuf := 1024 * 1024 * 10;
  FMaxWriteBuf := 1024*50;
  {sha}
  //FOperateTimeOut := 1000;
  FOperateTimeOut := 100;
  if not CreateSuspended then Resume;
  FLog:=TSystemLog.Create;
  FLog.LogFile:=ExePath+'GatewayLog\data';
  FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+' 程序打开');
  ReconnectTimeOut:=5;
  FErrorCount := 0;
  FDisConnectCount:=0;
end;

procedure TClientSocketThread.LockRead;
begin
 try
   FReadLock.Enter;
 except on E:Exception do
   FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+' LockRead Error:'+E.Message);
 end;
end;

procedure TClientSocketThread.LockWrite;
begin
  try
    FWriteLock.Enter;
  except on E:Exception do
    FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+' LockWrite Error:'+E.Message);
  end;
end;

procedure TClientSocketThread.UnLockRead;
begin
  try
    FReadLock.Leave;
  except on E:Exception do
    FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+' UnLockRead Error:'+E.Message);
  end;
end;

procedure TClientSocketThread.UnLockWrite;
begin
  try
    FWriteLock.Leave;
  except on E:Exception do
    FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+' UnLockWrite Error:'+E.Message);
  end;
end;

destructor TClientSocketThread.Destroy;
begin
  ReallocMem(FReadBuf.Data,0);
  ReallocMem(FWriteBuf.Data,0);
  FSocket.Free;
  FReadLock.Free;
  FWriteLock.Free;
  FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+' 程序关闭');
  FLog.Free;
  inherited;
end;

procedure TClientSocketThread.SetReconnectTimeOut(const Value: Integer);
begin
  FReconnectTimeOut := Value;
end;

procedure TClientSocketThread.SetActive(Value: Boolean);
begin
  if FActive <> Value then
  begin
    FActive := Value;
  end;
end;

function TClientSocketThread.GetReadBuf: PSocketBuffer;
begin
  // TODO -cMM: TClientSocketThread.GetReadBuf default body inserted
  Result := @FReadBuf;
end;

function TClientSocketThread.GetWriteBuf: PSocketBuffer;
begin
  // TODO -cMM: TClientSocketThread.GetReadBuf default body inserted
  Result := @FWriteBuf;
end;

procedure TClientSocketThread.SetActiveSleepTime(const Value: Integer);
begin
  if FActiveSleepTime <> Value then
  begin
    FActiveSleepTime := Value;
  end;
end;

procedure TClientSocketThread.SetInActiveSleepTime(const Value: Integer);
begin
  if FInActiveSleepTime <> Value then
  begin
    FInActiveSleepTime := Value;
  end;
end;

procedure TClientSocketThread.SetAddress(const Value: string);
begin
  if FAddress <> Value then
  begin
    FAddress := Value;
  end;
end;

procedure TClientSocketThread.SetHost(const Value: string);
begin
  if FHost <> Value then
  begin
    FHost := Value;
  end;
end;

procedure TClientSocketThread.SetPort(const Value: Integer);
begin
  if FPort <> Value then
  begin
    FPort := Value;
  end;
end;

procedure TClientSocketThread.SetOnSocketEvent(const Value: TSocketEventEvent);
begin
  FOnSocketEvent := Value;
end;

procedure TClientSocketThread.SetSendHeartToGateway(const value: TSendHeartToGateway);
begin
  FSendHeartToGateway := value;
end;

procedure TClientSocketThread.DoSocketEvent(AnSocketEvent: TSocketEvent);
begin
  // TODO -cMM: TClientSocketThread.DoSocketEvent default body inserted
  if Assigned(FOnSocketEvent) then
    FOnSocketEvent(Self,FSocket.Socket,AnSocketEvent);
end;

procedure TClientSocketThread.SetAllowSendData(const Value: Boolean);
begin
  if FAllowSendData <> Value then
  begin
    FAllowSendData := Value;
  end;
end;

procedure TClientSocketThread.SetMaxReadBuf(const Value: Integer);
begin
  if FMaxReadBuf <> Value then
  begin
    FMaxReadBuf := Value;
  end;
end;

procedure TClientSocketThread.SetMaxWriteBuf(const Value: Integer);
begin
  if FMaxReadBuf <> Value then
  begin
    FMaxReadBuf := Value;
  end;
end;

procedure TClientSocketThread.InitBuf(ABuf: TSocketBuffer);
begin
  // TODO -cMM: TClientSocketThread.InitBuf default body inserted
  ABuf.ReadPos := 0;
  ABuf.WritePos := 0;
  ABuf.Size := 0;
  ABuf.Data := nil;
end;

procedure TClientSocketThread.SetOperateTimeOut(const Value: Integer);
begin
  if FOperateTimeOut <> Value then
  begin
    FOperateTimeOut := Value;
  end;
end;

procedure TClientSocketThread.DoSocketConnectEvent;
begin
  DoSocketEvent(seConnect);
end;

procedure TClientSocketThread.DoSocketDisConnectEvent;
begin
  DoSocketEvent(seDisconnect);
  Inc(FDisConnectCount);
end;

procedure TClientSocketThread.SetOnWriteBufferOverflow(const Value: 
    TNotifyEvent);
begin
  FOnWriteBufferOverflow := Value;
end;

procedure TClientSocketThread.DoWriteBufferOverFlow;
begin
  if Assigned(FOnWriteBufferOverFlow) then
    FOnWriteBufferOverflow(Self);
end;


function TClientSocketThread.GetSockerHandle: Integer;
begin
  Result := FSocket.Socket.SocketHandle;
end;

function TClientSocketThread.PtrAdd(p: pointer; offset: integer): pointer;
begin
  Result := Pointer(Longword(p)+offset);
end;

function TClientSocketThread.GetActive: Boolean;
begin
  Result := FSocket.Active;
end;

function TClientSocketThread.WaitForData(TimeOut: Integer): boolean;
var
  FDSet: TFDSet;
  TimeVal: TTimeVal;
  ret: integer;
 // str: string;
begin
  Result:=false;
  try
    TimeVal.tv_sec := Timeout div 1000;
    TimeVal.tv_usec := (Timeout mod 1000) * 1000;
    FD_ZERO(FDSet);
    FD_SET(FSocket.Socket.SocketHandle, FDSet);
    //因为原来在TCP连接断开时，调下面的函数不返回True。所以线程中不能实时地发现 连接已断开
    //2005-11-2 sha 改
    //Result := select(0, @FDSet, nil, nil, @TimeVal) > 0;
    //----------------
    try
      ret := select(0, @FDSet, nil, nil, @TimeVal);
    except  on E:Exception do
      FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+' select Error:'+E.Message);
    end;
    //FLog.AddLog(FormatDateTime('HH:nn:ss.zzz',now)+' RET='+IntToStr(ret));
    if ret>0 then
    begin
      Result:= True;
      isRecData:=true;
      FErrorCount := 0;
    end
    else if ret<0 then
    begin
      FLog.AddLog(FormatDateTime('HH:nn:ss.zzz',now)+
        ' 收数据出错. Select返回值='+IntToStr(ret)+', 错误号:'+IntToStr(WSAGetLastError));
      //Raise Exception.Create('Receive Data Error');
    end
    else      //ret = 0 -- 表示超时 -- 在没收到数据 及 TCP网路上断开时 返回值
    begin                   // sha 以下处理，是防止TCP网路上断开，但用 select却检测不到，而产生的监控端 掉线问题
    //如果20遍(秒)收不到数据,则发一次心跳。发过心跳后再有5遍收不到数据，则断开网关。
      Inc(FErrorCount);
      if FErrorCount>=20 then
      begin 
        if (FErrorCount>=50) then
        begin
            FLog.AddLog(FormatDateTime('HH:nn:ss.zzz',now)+' 发心跳');
            SendHeartBeat;
            isRecData:=false;//发完一个心跳后,把就变量设为FASLE,如果五秒后还没有收到数据,则断开网关,重新连接
            FErrorCount := 0;
        end else
        if not isRecData then //发过心跳五秒后没有收到数据情况下,断开网关重连.
        begin
          {$ifdef For_HeartToGateway}
           FSocket.Active:=false;
           Sleep(1000);
           DoSocketDisConnectEvent;
           FLog.AddLog(FormatDateTime('HH:nn:ss.zzz',now)+' 断开网关');
           FErrorCount := 0;
          {$endif}
        end;
      end;
    end;
  except  on E:Exception do
    FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+' WaitForData Error:'+E.Message);
  end;
end;

function TClientSocketThread.SendHeartBeat: boolean;
var
  buf: array [0..1] of byte;
begin


  buf[0]:= 2;
  buf[1]:= 0;
  try
    Result := OnSendHeartToGateway();
    //Result :=send(FSocket.Socket.SocketHandle,cmd,cmd.Size,0)=cmd.Size
  except on E:Exception do
   begin
    FLog.AddLog(FormatDatetime('hh:nn:ss.zzz',now)+' SendHeartBeat Error:'+E.Message);
    Result:=false;
    end;
  end;
end;

end.
