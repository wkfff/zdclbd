{*结构及常量定义}
unit StructDefUnit;

interface
const
  CLIENT_STATE_IDLE = 0; //  {*空闲，表明客户端处于等待接听电话状态}
  CLIENT_STATE_BUSY = 1; //  {*接电话，客户端正在与外线通话中}
  CLIENT_STATE_READY = 2; //  {*准备接电话，已向客户端振铃，等待摘机}
  CLIENT_STATE_PAUSE = 3; //  {*客户端暂时停止接听电话，客户端暂时不接听电话，该状态下，服务器将不向该客户端分配电话}

  CLIENT_TYPE_SCHEDULE = 0; //  {*调度坐席}
  CLIENT_TYPE_ACCUSE = 1; // {*投诉客户端}
  CLIENT_TYPE_ALARMMONITOR = 2;//报警监听坐席

  CMD_TS_REGISTER = $00; // {*客户端注册或改变状态命令标志}
  CMD_ST_REGISTER = $80; // {*服务器响应客户端注册或改变状态命令标志}
  CMD_ST_CALLIN = $01; // {*服务器通知客户端来电命令标志，客户端摘机后，接通外线会收到这个命令}
  CMD_TS_CALLIN = $81; // {*保留未用}
  CMD_ST_USERCHANNEL_EVENT = $02; // {*用户通道的事件，客户端的内线通道状态发生变化后收到此命令，事件代码定义见下以USER_EVENT_开头的常量定义}
  CMD_ST_CLIENT_COUNT_CHANGE = $03; // {*客户端数量发生变化后收到的命令，里面包含了各种状态客户端的当前数量}
  CMD_TS_SWITCH_TO_ME = $84; //  {*客户端要求抢接正在等待的电话，当有外线等待接听时，客户端主动要求抢接电话}
  CMD_TS_ERROR_CALLTYPE = $85; // {*客户端通知服务器来电类型不对}
  CMD_TS_CALLTODRIVER = $06; // {*客户端要求 进行三方通话--拨打司机}
  CMD_ST_CALLTODRIVER = $86; // {*电话服务器返回，拨打司机电话的结果}
  CMD_TS_CALLTHEDRIVER = $07; //拨打电话
  CMD_ST_RETCALLTHEDRIVER = $87; //拨打电话状态回复
  CMD_ST_ALARMUSERSTATE = $88; //服务器->客户端,刷新报警客户专线状态
  CMD_TS_ALARMMONITORTHIRD = $09; //客户端要求并线监听报警
  CMD_ST_RETALARMMONITORTHIRD=$89; //并线监听结果回复
  CMD_ST_CALLIN_MONITORTHIRD = $8A;//服务器通知客户端，当前连接是并线监听。客户端摘机后会收到这个命令，命令结构同TCmdSTCallInData

  CMD_TS_PLAY_STOPMUSIC2EXT = $0B; //向外线用户播放或停止播放音乐（播放音乐用于正在为外线用户叫车时，不让用户听到调度室的嘈杂音。sha.2010.07.19）
  CMD_ST_SHOW_STATE = $0A;    // 实时显示当前 通话记录统计  通话中电话数量 排队中电话数量 未接电话数量

  USER_EVENT_TALKWITH = 0; //  {*用户接通外线电话，用户摘机与外线接通后发生}
  USER_EVENT_PICKUP = 1; // {*用户自行摘机,非服务器预期的}
  USER_EVENT_RING = 2; // {*服务器分配给用户等待接听的外线，用户通道的电话开始响铃}
  USER_EVENT_WAIT_EXT_HANGUP = 3; // {*用户还未摘机接听外线电话，等待接通的外线已挂断}
  USER_EVENT_TALK_HANGUP = 4; // {*用户正在与外线通话中,外线尚未挂机，用户首先挂机}
  USER_EVENT_TALK_EXTHANGUP = 5; // {*用户正在与外线通话中,外线首先挂机}
  USER_EVENT_TALK_FINISH_HANGUP = 6; // {*用户与外线通话结束,外线挂机后,用户内线再挂机}
  USER_EVENT_WAIT_TIMEOUT = 7; // {*服务器分配给用户的电话，在振铃超过N（3）声后，用户仍未接听电话,电话已被重新排队}
  USER_EVENT_HANGUP = 8; //  {*用户在自行摘机后再挂机,非服务器预期的}
  USER_EVENT_STOP = 9; // {*由于其它用户执行了抢接命令，分配给该用户的电话被其它客户端抢接了}
  USER_EVENT_INNERTALKOVER = 10; // {*内部通话已结束，请对方挂电话}

  //拨打外线通道(三方会议)，返回的结果:0、1、2、3、4
  CALL_DRIVER_NOIDLELINE = 0; // {*没有空闲外线通道}
  CALL_DRIVER_ERRTELLNUM = 1; // {*错误的电话号码}
  CALL_DRIVER_NOLISTEN_OR_BUSY = 2; // {*对方忙或长时间无人接听}
  CALL_DRIVER_THIRDTALKING = 3; // {*对方已摘机，进入三方通话}
  CALL_DRIVER_CREATEFAILED = 4; // {*建立三方会议失败了}

  CALL_DRIVER_USERNOTPICKUP = 5;//用户未摘机，请先摘机再拨电话　　
  CALL_DRIVER_USERBUSY = 6;     //用户内线通道忙，可能正在接听外线
  CALL_DRIVER_TALKOK = 7;//拨打司机电话成功
  //拨打司机电话（双方）可能返回的结果：0、1、2、5、6、7

  //客户端注册，客户端要求暂停，电话服务器返回值相关定义：　
  {*注册成功}
  EVENT_CLIENT_REGISTER_OK = 0;
  {*无效的通道号}
  EVENT_CLIENT_INVALID_CHANNNEL = 1;
  {*通道号已被注册}
  EVENT_CLIENT_CHANNEL_INUSE = 2;
  {*注册错误}
  EVENT_SOCKET_ERROR = -1;
  {*允许暂停工作}
  EVENT_CLIENT_ALLOW_CHANGE_STATE = 3;
  {*不允许暂停工作}
  EVENT_CLIENT_DISALLOW_CHANGE_STATE = 4;
  {*错误的通道类型，坐席类型 与 通道号不匹配。
  　　－－客户端　为调度坐席，　　但通道号为 电话服务器指定的报警通道号
  　　－－客户端　为报警监听坐席，但通道号不在　电话服务器指定的报警通道号列表　之内
  　注：由电话服务器指定某几个通道为报警通道号}
  EVENT_CLIENT_ERRCHANNELTYPE = 5;
  EVENT_CLIENT_HEART = 10;  // 电话服务器发送过来的心跳

type
  {*@abstract客户端数量结构
  客户端数量结构@html(<br/>)
  Idle 空闲数量@html(<br/>)
  Pause 暂停工作数量@html(<br/>)
  Ready 准备接听电话数量@html(<br/>)
  Busy 正在接听电话数量@html(<br/>)
  }
  TClientCountData = packed record
    Total: Integer;
    Idle: Integer;
    Pause: Integer;
    Ready: Integer;
    Busy: Integer;
  end;

  {*TCmdTSRegisterData的指针定义}
  PCmdTSRegisterData = ^TCmdTSRegisterData;

  {*@abstract客户端到服务器的注册数据
  客户端到服务器的注册数据@html(<br/>)
  Size 长度
  Flag 命令标志，应当为CMD_TS_REGISTER @html(<br/>)
  UserChannelNo 客户端的通道号@html(<br/>)
  UserState 客户端的状态，改变状态时有效@html(<br/>)
  UserType 客户端的类型}
  TCmdTSRegisterData = packed record
    {*长度}
    Size: Word;
    {*命令标志,应当为}
    Flag: Byte;
    {客户端的通道号}
    UserChannelNo: Byte;
    {*客户端申请的状态,改变状态时有效}
    UserState: Byte;
    {*客户端类型,投诉或调度}
    UserType: Byte;
  end;
  {*TCmdSTRegisterData的指针定义}
  PCmdSTRegisterData = ^TCmdSTRegisterData;
  {*@abstract服务器响应客户端的注册数据
  服务器响应客户端的注册数据@html(<br/>)
  Size 长度@html(<br/>)
  Flag 命令标志 应当为CMD_ST_REGISTER @html(<br/>)
  Ret 返回值@html(<br/>)
  State 客户端应当具有的状态}
  TCmdSTRegisterData = packed record
    Size: Word;
    Flag: Byte;
    Ret: Byte; //0 成功 1 通道号不存在 2 通道号已占用，3 允许改变状态 4 不允许改变状态 如果返回1,2，服务端将会断开连接
    State: Integer; //客户端的状态 如果连接未断开,此状态就是客户端当前的状态
  end;

  {*TCmdSTCallInData的指针定义}
  PCmdSTCallInData = ^TCmdSTCallInData;
  {*@abstract服务器来电信息
  服务器收到来电信息发到客户端的命令@html(<br/>)
  Size 长度@html(<br/>)
  Flag 命令标志 应当为CMD_ST_CALLIN @html(<br/>)
  CallNo 来电号码 @html(<br/>)
  CallID 来电记录ID}
  TCmdSTCallInData = packed record
    Size: Word;
    Flag: Byte;
    CallNo: string[20];
    CallID: Integer;
  end;

  {*TCmdTSCallInData的指针定义}
  PCmdTSCallInData = ^TCmdTSCallInData;
  {*@abstract保留未用
  客户端来电信息返回命令定义,暂时没用}
  TCmdTSCallInData = packed record
    Size: Word;
    Flag: Byte;
    Ret: Integer; //0 收到 服务器端在指定的时间内未收到，则重发
  end;
  {*@abstract当客户端注册的用户通道发生事件时，服务器通知客户端，其注册的用户通道的事件
  当客户端注册的用户通道发生事件时，服务器通知客户端，其注册的用户通道的事件@html(<br/>)
  Size 长度@html(<br/>)
  Flag 命令标志 应当为CMD_ST_USERCHANNEL_EVENT@html(<br/>)
  Event 发生的事件代码}
  TCmdSTUserChannelEventData = packed record
    Size: Word;
    Flag: Byte;
    Event: Byte;
  end;
  {*TCmdSTUserChannelEventData的指针定义}
  PCmdSTUserChannelEventData = ^TCmdSTUserChannelEventData;
  {*@abstract当在服务器上客户端的数量发生变化时,服务器通知客户端的命令
  当在服务器上客户端的数量发生变化时,服务器通知客户端的命令@html(<br/>)
  Size 长度@html(<br/>)
  Flag 命令标志 应当为CMD_ST_CLIENT_COUNT_CHANGE@html(<br/>)
  Client 客户端的情况@html(<br/>)
  }
  TCmdSTClientCountChangeData = packed record
    Size: Word;
    Flag: Byte;
    Client: TClientCountData;
  end;
  {*TCmdSTClientCountChangeData的指针定义}
  PCmdSTClientCountChangeData = ^TCmdSTClientCountChangeData;

  TState = packed record
    Busy: Integer;    // 通话中的数量
    Ready: Integer;   // 排队中的数量
    Pause: Integer;   // 未接电话数量
  end;

  TCmdSTShowState = packed record
    Size: Word;
    Flag: Byte;
    State: TState;
  end;
  PCmdSTShowState = ^TCmdSTShowState;

  {*@abstract客户端需要抢接正在等待的电话
  客户端需要抢接正在等待的电话@html(<br/>)
  Size 长度@html(<br/>)
  Flag 命令标志}
  TCmdTSSwitchToMeData = packed record
    Size: Word;
    Flag: Byte;
  end;
  {*TCmdTSSwitchToMeData的指针定义}
  PCmdTSSwitchToMeData = ^TCmdTSSwitchToMeData;
  {*@abstract客户端通知服务器当前的电话类型错误，退回服务器重新排队
  客户端通知服务器当前的电话类型错误，退回服务器重新排队@html(<br/>)
  Size 长度@html(<br/>)
  Flag 命令标志@html(<br/>)
  CallType: 电话的正确类型 0 表示是叫车电话 1 表示是投诉电话
  }
  TCmdTSErrorCalLType = packed record
    Size: Word;
    Flag: Byte;
    CallType: Integer;
  end;
  {*TCmdTSErrorCalLType的指针定义}
  PCmdTSErrorCalLType = ^TCmdTSErrorCalLType;

  {*@abstract客户端要求 进行三方通话--要求电话服务器去拨打司机
  客户端要求 进行三方通话--要求电话服务器去拨打司机@html(<br/>)
  Size 长度@html(<br/>)
  Flag 命令标志 CMD_TS_CALLTODRIVER = $06 @html(<br/>)
  DriverTellNum 司机号码 @html(<br/>)}
  TCmdTSCallToDriver = packed record
    Size: Word;
    Flag: Byte;
    DriverTellNum: string[20];
  end;
  {*TCmdTSCallToDriver的指针定义}
  PCmdTSCallToDriver = ^TCmdTSCallToDriver;
  {*@abstract电话服务器返回，拨打司机电话的结果
  电话服务器返回，拨打司机电话的结果@html(<br/>)
  Size 长度@html(<br/>)
  Flag 命令标志 CMD_ST_CALLTODRIVER = $86; @html(<br/>)}
  TCmdSTCallToDriverRet = packed record
    Size: Word;
    Flag: Byte;
    Ret: Byte; //查看本单元中 以CALL_DRIVER开头的定义
  end;
  {*TCmdSTCallToDriverRet的指针定义}
  PCmdSTCallToDriverRet = ^TCmdSTCallToDriverRet;

  //所有报警座席的当前状态
  TCmdSTAlarmUserChannelState = packed record
    Size: Word;
    Flag: Byte;
    alarmUserChannelNum: Integer; //报警座席数量
    alarmUserChannelID: array[0..63] of Integer; //报警座席通道号
    alarmUserID: array[0..63] of Integer;  //报警座席分机号
    //报警座席状态，见CLIENT_STATE_
    alarmUserChannelState: array[0..63] of Integer;  
  end;
  PCmdSTAlarmUserChannelState = ^TCmdSTAlarmUserChannelState;

  //请求搭线监听报警
  TCmdTSAlarmMonitorThird =packed record
    Size: Word;
    Flag: Byte;
    thirdChannelID:Integer; //报警座席的通道号
  end;
  PCmdTSAlarmMonitorThird = ^TCmdTSAlarmMonitorThird;

  TCmdSTAlarmMonitorThirdRet = packed record
    Size: Word;
    Flag: Byte;
    Ret: Byte; //0失败 1成功
  end;
  {*TCmdSTCallToDriverRet的指针定义}
  PCmdSTAlarmMonitorThirdRet = ^TCmdSTAlarmMonitorThirdRet;

  {*@abstract向外线用户播放或停止播放音乐
   （播放音乐用于正在为外线用户叫车时，不让用户听到调度室的嘈杂音).Add:sha.2010.07.19@html(<br/>)
  Size 长度@html(<br/>)
  Flag 命令标志CMD_TS_PLAY_STOPMUSIC2EXT = $0B;
  PlayFlay 播放标记，1放，0停}
  TCmdTSPlayOrStopMusic2Ext = packed record
    Size: Word;
    Flag: Byte;
    PlayFlag : Byte; //播放标记，1放，0停
  end;
  PCmdTSPlayOrStopMusic2Ext = ^TCmdTSPlayOrStopMusic2Ext;

{*获得客户端状态描述}
function GetClientStateDesc(AState: Integer): string;
{*获得用户通道事件描述}
function GetUserEventDesc(AEvent: Integer): string;
implementation

function GetClientStateDesc(AState: Integer): string;
begin
  case AState of
    CLIENT_STATE_IDLE: Result := '空闲';
    CLIENT_STATE_BUSY: Result := '繁忙';
    CLIENT_STATE_READY: Result := '准备';
    CLIENT_STATE_PAUSE: Result := '暂停';
  else
    Result := '未知状态';
  end;
end;

function GetUserEventDesc(AEvent: Integer): string;
begin
  case AEvent of
    USER_EVENT_TALKWITH: Result := '用户接通外线电话';
    USER_EVENT_PICKUP: Result := '用户摘机,非服务器预期的';
    USER_EVENT_RING: Result := '用户通道的电话开始响铃';
    USER_EVENT_WAIT_EXT_HANGUP: Result := '等待接通的外线已挂断';
    USER_EVENT_TALK_HANGUP: Result := '正在通话中,用户首先挂机';
    USER_EVENT_TALK_EXTHANGUP: Result := '正在通话中,外线首先挂机';
    USER_EVENT_TALK_FINISH_HANGUP: Result := '通话结束,外线挂机后,内线挂机';
    USER_EVENT_WAIT_TIMEOUT: Result := '用户超进未接听电话,电话已被重新排队';
    USER_EVENT_HANGUP: Result := '用户挂机,非服务器预期的';
    USER_EVENT_STOP: Result := '用户电话被抢接';
    USER_EVENT_INNERTALKOVER: Result := '内部通话已结束，请对方通道挂电话';
  else
    Result := '未知';
  end;
end;

end.

