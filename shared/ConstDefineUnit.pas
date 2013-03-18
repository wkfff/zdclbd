{公用常量定义
 @created(2003-09-04)
 @lastmod(GMT:$Date: 2012/11/30 01:29:23 $) <BR>
 最后更新人:$Author: wfp $ <BR>
 当前版本:$Revision: 1.2 $ <BR>}



unit ConstDefineUnit;

interface
uses Messages;
const
//====================================================================
  BEIDOU = '北斗';
  MAXLONGWORD = 4294967295;
  MAXINTEGER = 2147483647;
  MY_APP_NAME = 'VSMSClient_Taxi';
  CM_RESTORE = WM_USER + $1000; // -自定义的“恢复”消息
  CM_DATASERVER_SENDMSG = WM_USER + $1001; //
  CM_DevStat = WM_USER + $1002; // 设备状态
  CM_DevParam_READOk = WM_USER + $1003; // 读设备参数
  CM_DevNotifyStat = WM_USER + $1004; // 服务器有数据更新的通知,通知客户端要刷新指定的设备的信息
  CM_DevToHost = WM_USER + $1005; // 收到Dev发送到Host的数据
  CM_RegUserErr = WM_USER + $1006; // 用户登录到网关服务器 错误
  CM_DEVALARM = WM_USER + $1007; // 在收到的GPS数据中有 报警

  //删除越界或驶入报警列表中的相关车辆 ，此消息由电子围栏列表中删除时，发给主界面。
  //--当用户在电子围栏列表中删除某区域（对应的车辆将全不限定）或 从某区域中不再限定该车时，如果越界或驶入报警列表中有该车，则需移入到历史记录中
  CM_DELAlarmListDev_OutORInCA = WM_USER + $1008;

  CM_UPDATE = WM_USER + $1009; //更新本自已,,必须关闭自己,这个消息是由更新程序发出.
//  CM_PowerCut           =WM_USER+ $1010;  //断电报警

  //发出命令的执行状态
  CMD_SNDNODO = 0; // 已发送未执行
  CMD_DONE = 1; // 已执行
  CMD_DOERROR = 2; // 执行出错
  CMD_CANCELByUSER = 3; // 被用户取消
  CMD_CANCELED = 4; // 已取消
  CMD_CANCELFAIL = 5; // 取消失败
  CMD_RESND = 6; // 重发
  CMD_DELETED = 7; // 被删除
  CMD_REPLACE = 8; // 被替代
  CMD_OVERTIME = 9; // 超时
  CMD_SND2SMSSENDSVR = 10; // 已发送到SMS发送服务器
  CMD_INVALIDDEV = 11; //无效的车机ID号
  CMD_NOPIC = 12;//没有符合条件的照片

  ForDevLimit = 100; //当前软件可 查看车辆数
  UserDrawAreaLayerName = '电子围栏绘画图层'; //画区域　的图层的　名称

  ALARM_OUT = 0; //越出界　报警
  ALARM_IN = 1; //入界　　报警
  Alarm_LINEKEYPOINT = 2;// 线路关键点报警
  ALARM_OVER_SPEET = 2; //区域超速报警
  ALARM_WAY_OUT = 3;
  ALARM_WAY_IN = 4;
  BUSLINE_WAY = 5;
  ASSEMBLE_WARRING = 5; // 聚集报警
  OUT_TOWN = 6; // 出城报警
  OUT_TOWN_ERROR = 61; // 出城超时报警

  ANTIFAKE_WARRING = 7; // 防伪密标报警
  SUSPECTEDPETITIONS_WARRING = 8; // 疑似上访报警

  SEEK_CAR = 9;   // 区域查车

  //-------GPS定位数据中的各标志位
  GPSALARM_EMERGENCY = 32; //紧急报警
  GPSALARM_DEVOVERSPEED = 48;// 第48位	1：超速报警
  GPSALARM_DRIVERFATIGUE = 49;//第49位	1：疲劳驾驶报警
  GPSALARM_DRIVERTIMEOUT = 50;  //第50位  1：累计驾驶超时报警
  GPSALARM_DRIVERSTOP = 51;   // 第51位   1：停车超时报警
  GPSALARM_DEVCUTPOWER = 18;//第18位	1：断电报警
  GPSALARM_INDEVAREA = 20;//第20位	1：进区域报警
  GPSALARM_OUTDEVAREA = 21;//第21位	1：出区域报警
  GPSALARM_OUTLINE = 22;//第22位	1：偏离路线报警
  GPSALARM_FORTIFY =23; //第23位	1:  非法启动报警 设防报警
  GPSALARM_DEVLOWPOWER = 26;//第26位	1：低压报警
//==========================================================================

  (*****车机与　网关******)
  {车机给网关、网关给车机　的通用应答中的　处理结果--　0：成功|1：失败}
  DEVRET_OK = $0;
  DEVRET_FAIL = $1;
  {电话本　限制状态 }
  TELSTATE_TALKRESTRICT = $01; //0x00:通话无限制  ->允许呼入，允许呼出
  TELSTATE_ENABLEIN_NOTOUT = $02; //0x01:允许呼入，禁止呼出
  TELSTATE_ENABLEOUT_NOTIN = $03; //0x02:允许呼出，禁止呼入
  TELSTATE_DISABLE         = $04; //0X03: 禁止通话
  (*****客户端　与网关****)
  RET_OK = $0;
  {命令执行成功}
  RET_CMDOK = $0;
  {ERR_开头的为错误码}
  //屏有故障
  ERR_LED = $1;
  // 用户登录成功
  LOGIN_OK = $01;
  {无效用户名}
  ERR_INVALIDUSER = $02;
  {重复登录}
  ERR_Logged = $03;
  {错误密码}
  ERR_INVALIDPASSWD = $04;
  {用户不允许登录}
  ERR_USERDISABLED = $3;
  {用户已被删除}
  ERR_USERDELETED = $4;
  {旧密码无效}
  ERR_INVALIDOLDPASSWD = $5;
  {新密码无效}
  ERR_INVALIDNEWPASSWD = $6;
  {尚未登录}
  ERR_NOTLOGIN = $7;
  {没有取到需要的数据}
  ERR_NODATA = $8;
  { 结果与需要的数量不符}
  ERR_DATALACK = $9;
  {错误的数据格式}
  ERR_INVALIDFORMAT = $A;
  {没有内容需要同步}
  ERR_NOSYNC = $B;
  { 写入数据库失败}
  ERR_Record = $C;
  {主版本号过大}
  ERR_ProtocalMajorOver = $D;
  {主版本号过小}
  ERR_ProtocalMajorLack = $E;
  {次版本号过大}
  ERR_ProtocalMinorOver = $F;
  {次版本号过小}
  ERR_ProtocalMinorLack = $10;
  {无效的版本号}
  ERR_INVALIDVER = $11;
  {无效的车机}
  ERR_INVALIDDEV = $13;
  {无效的移动目标}
  ERR_INVALIDTARGET = $14;
  {没有权限}
  ERR_NOPRIVILEGE = $15;
  {命令执行超时失败}
  ERR_TIMEOUT = $16;
  {命令已修改后执行,在命令执行期间被一个新的命令（只是参数不同）替代}
  RET_CMDMODIFY = $17;
  {命令已发送到SMS发送服务器}
  RET_CMDSnd2SMSSendSvr = $18;
  {订单已被删除}
  RET_ORDERDELETED = $19;
  {命令执行失败}
  RET_FAIL = $FE;
  {未知错误}
  ERR_Unknown = $FF;
  {通信服务器保留用户,为XXXXX的md5值}
  SYSTEM_SUPERUSER = '{F1F34647-81A5-48F6-A854-F8B469F64F67}';
  SYSTEM_SUPERPASS = '{A789376B-F01E-40A8-917A-DF5B34B200FE}';
  {密码长度}
  PassLength = 32;

//消息常量定义
  //消息类型
  MSGTYPE_NORMAL = 0; //文本调度信息
  MSGTYPE_NEEDANSWER = 1; //需回复的调度孕育处　
  //消息状态
  MSGSTAT_UNSEND = 0; //消息未发送
  MSGSTAT_SENDED = 1; //消息已发送
  MSGSTAT_RECVED = 2; //车机已接收消息
  MSGSTAT_REPLYED = 3; //司机已应答消息
  MSGSTAT_FAILED = 9; //消息发送失败
  //司机应答
  MSGANSWERTYPE_YES = 1; //司机应答－是
  MSGANSWERTYPE_NO = 0; //司机应答－否

//升级车机固件 类型
  UPDATEDEV_DEV = $0; //升级主机
  UPDATEDEV_DISPLAY = $1; //升级显示屏


//数据库名称
  DATABASE_NAME = 'VSMSdata';

//读取设备参数号
  DEVParam_Basic = 0; //基本参数
  DEVParam_Else = 1; //监听及业务电话
  DEVParam_KeyPressTel = 2; //按键电话

  //数据通道
  COMMUNICATION_GRPS = 0; //GPRS方式
  COMMUNICATION_SMS = 1; //短消息方式

  //下发订单超过多少秒后 没车机响应，中心自动删除
  TIMEOVER_DELORDER = 30000;
  //订单的状态
  ORDERSTATE_NODEVANSWER_DEL = 0; //订单下发30秒后，没有车机响应，中心自动删除
  ORDERSTATE_WAITGRAB = 1; //等待车机来抢单
  ORDERSTATE_DEVGRAB = 2; //  已有车机抢单
  ORDERSTATE_SENDINGDEVGRABOK = 3; //正在下发给车机抢单成功
  ORDERSTATE_SENDDEVGRABOK_FAIL = 4; //下发给车机抢单成功，失败：车机没应答，下发给其它 车机也无应答。或已无车机可发。
  ORDERSTATE_DEVGRABOK = 5; //车机抢单成功
  ORDERSTATE_SRVCANCEL = 6; //中心取消订单
  ORDERSTATE_DEVCANCEL = 7; //车机取消订单

  ORDERSTATE_FINISH = 8;  // 订单完成

 //固定菜单长度
  LCD_MENU_LENGTH = 39;
 //固定菜单个数
  LCD_MENU_COUNT = 128;

 //发出信息的(PostMessage)类型, //对应的函数: ReturnMsgTypeState
  MSG_TYPE_LCD_MENU = 1; //固定菜单.
  MSG_TYPE_CONTRAL_INFO = 2; //调度信息.
  MSG_TYPE_TAXI_STOPTIME = 3; //计价器停机时间
  MSG_TYPE_SEV_INFO = 4; //服务器通知消息;
  MSG_TYPE_DEV_SEND_TO_HOST = 5; // 收到Dev发送到Host的数据
  MSG_TYPE_GPS_MODULE_ERROR = 34; //GPS模块发生故障
  MSG_TYPE_GPS_LINE_ERROR = 35; //GPS天线未接或被剪断
  MSG_TYPE_GPS_LINE_SHORT = 36; //GPS天线短路
  MSG_TYPE_LOW_V = 37; //低压报警
  MSG_TYPE_CUT_V = 38;  // 断电报警
  MSG_TYPE_LCD_ERROR = 39; //LCD故障
  MSG_TYPE_TTS_ERROR = 40;  //TTS模块故障
  MSG_TYPE_PHOTOVIDICON_ERROR = 41; //摄像头 故障
  MSG_TYPE_MEASURE_ERROR = 42; //计价器故障
  MSG_TYPE_EVALUATOR_ERROR = 43;  // 服务评价器故障
  MSG_TYPE_LEDAD_ERROR = 44;//led广告屏 故障         //add sha 20090113
  MSG_TYPE_LCDVIEW_ERROR = 45;  // lcd显示屏故障
  MSG_TYPE_TSM_ERROR = 46;      // TSM安全模块故障
  MSG_TYPE_LEDLIGHT_ERROR = 47; // led顶灯故障
  MSG_TYPE_VSS_ERROR = 55; // vss故障
  MSG_TYPE_SIM_ERROR = 29; //SIM卡未设置，或者车机读取SIM卡号失败



  MSG_TYPE_ZTUPLOADCARRYXSLC = 35;//30 //渣土车上传重车里程，进入空车
  MSG_TYPE_ZTUPLOADOFFXSLC = 36;  //31 //渣土车上传空车里程，进入重车
  MSG_TYPE_AreaAlarm=32;//进出区域报警
  //断油断电供油供电　命令中的具体内容
  CUT_OIL = 1; //断油
  CUT_ELECTRICITY = 2; //断电
  FEED_OIL = 3; //供油
  FEED_ELECTRICITY = 4; //供电


//===================================================================


  //系统管理端与网关通讯
  SYSADM_USERID = $00FF00FF;
  SYSADM_USERPASS = '{B274AB8A-34D5-476F}';

  //网关与Web服务　通讯       20070611
  SYSWEB_USERID = $1002;
  SYSWEB_USERPASS = '1';

  //调度服务器以 特殊的　TCP客户端 登录网关
  DISPATCH_USERID = $00FF0100;
  DISPATCH_USERPASS = '{8707A054-5ADA-416B}';

  //机场大巴服务器登陆网关
  OTHERSERVER_USERID = $1000;
  //检测网关的服务器登录用户名
  CHECKGATAWAY_USERID = $1001;

  //===============哈尔滨即公交V3.0车辆信息提示信息===============//
  MSG_STATE_0 = 0;
  MSG_STATE_1 = 1;
  MSG_STATE_2 = 2;
  MSG_STATE_3 = 3;
  MSG_STATE_4 = 4;
  MSG_STATE_5 = 5;
  MSG_STATE_6 = 6;
  MSG_STATE_7 = 7;
  MSG_STATE_8 = 8;
  MSG_STATE_9 = 9;
  MSG_STATE_10 = 10;
  MSG_STATE_11 = 11;
  MSG_STATE_12 = 12;
  MSG_STATE_13 = 13;
  MSG_STATE_14 = 14;
  MSG_STATE_15 = 15;
  MSG_STATE_16 = 16;
  MSG_STATE_17 = 17;
  MSG_STATE_18 = 18;
  MSG_STATE_19 = 19;
  MSG_STATE_20 = 20;
  MSG_STATE_21 = 21;
  MSG_STATE_22 = 22;
  MSG_STATE_23 = 23;
  MSG_STATE_24 = 24;
  MSG_STATE_25 = 25;
  MSG_STATE_26 = 26;
  MSG_STATE_27 = 27;
  MSG_STATE_28 = 28;
  MSG_STATE_29 = 29;
  MSG_STATE_30 = 30;
  MSG_STATE_31 = 31;
  MSG_Warning_0 = 0;
  MSG_Warning_1 = 1;
  MSG_Warning_2 = 2;
  MSG_Warning_3 = 3;
  MSG_Warning_4 = 4;
  MSG_Warning_5 = 5;
  MSG_Warning_6 = 6;
  MSG_Warning_7 = 7;
  MSG_Warning_8 = 8;
  MSG_Warning_9 = 9;
  MSG_Warning_10 = 10;
  MSG_Warning_11 = 11;
  MSG_Warning_12 = 12;
  MSG_Warning_13 = 13;
  MSG_Warning_14 = 14;
  MSG_Warning_15 = 15;
  MSG_Warning_16 = 16;
  MSG_Warning_17 = 17;
  MSG_Warning_18 = 18;
  MSG_Warning_19 = 19;
  MSG_Warning_20 = 20;
  MSG_Warning_21 = 21;
  MSG_Warning_22 = 22;
  MSG_Warning_23 = 23;
  MSG_Warning_24 = 24;
  MSG_Warning_25 = 25;
  MSG_Warning_26 = 26;
  MSG_Warning_27 = 27;
  MSG_Warning_28 = 28;
  MSG_Warning_29 = 29;
  MSG_Warning_30 = 30;
  MSG_Warning_31 = 31;

  //提示语
  QUERY_WARNING_INFO = '操作数据失败';

  //包类型定义
  PACKTYPE_TAXI= 1;//01	出租车应用
  PACKTYPE_BUS = 2;//02	公交应用
  PACKTYPE_2KE1WEI = 3;//03	两客一危应用

  //----------------------发往政府平台报警信息处理结果--------------------------
    ALARMDEAL_DEALING = $00;//处理中
    ALARMDEAL_DEALED = $01;//已处理完毕
    ALARMDEAL_NODEAL = $02;//不作处理
    ALARMDEAL_DEALINFUTURE = $03;//将来处理
  //----------------------发往政府平台报警信息处理结果--------------------------
//------------------------------------------------------------------------------
    //空设备号
    BLANKDEVID = '000000000000';
    //起始位标识
    SPOSFLAG = $40;
    //协议版本 默认0x00
    PROTOCOLVER = $00;
    //业务类型  0x 06	监控客户端
    BIZTYPE = $06;
    //登录版本号
    LOGVERSION = $00;
    //透传命令中的标识位
    FLAGTSP = $7E;
    //透传包中消息体属性与值
    CMDPROPERTY = $03FF;
    //转义字符1
    ESCAPEBYTE1 = $7E;
    //转义字符2
    ESCAPEBYTE2 = $7D;
  {*************************************客户端->中心***************************}
    //登录
    TERMSRV_LOGIN = $01;
    //注销
    TERMSRV_LOGOUT = $02;
    //通用应答
    TERMSRV_TYRET = $03;
    //获取车机在线状态
    TERMSRV_GETDEVONLINESTAT = $04;
    //获取最后位置
    TERMSRV_LASTGPS_V3 = $05;

    //督办报警处理结果
    TERMSRV_REPLYALRMSUPERVISE = $07;

    //平台查岗回复
    TERMSRV_REPLYGOVCHECKDUTY = $09;
    //政府平台下发报文信息回复
    //TERMSRV_REPLYGOVTEXTINFO = $0A;
    //从政府平台申请交换车辆定位信息
    TERMSRV_APPLYGPSDATA = $0A;
    //从政府平台取消交换车辆定位信息
    TERMSRV_CANCELGPSDATA = $0B;
    //向政府平台主动上报报警处理结果
    TERMSRV_ALARMDEALREPLY = $0C;

    //紧急报警处理
    TERMSRV_EMGCYALARMDEAL_V3 = $A1;

    //透传指令
    TRANSPARENT = $55;
    {********************************透传到车机的命令**************************}
      TERMSRV_SETDEVPARAM_V3 = $8103;//设置参数
      TERMSRV_READDEVPARAM_V3 = $8104;//查询参数
      TERMSRV_CONTROLTERMINAL_V3 = $8105;//终端控制
      TERMSRV_FINDPOSTION_V3 = $8201;//位置查询
      TERMSRV_PURSUECAR_V3 = $8202;//临时位置追踪控制
      TERMSRV_TEXTINFO_V3 = $8300;//文本信息
      TERMSRV_SETEVENT_V3 = $8301;//事件设置
      TERMSRV_SETANSWER_V3 = $8302;//提问下发
      TERMSRV_SETINFOMENU_V3 = $8303;//信息点播菜单设置
      TERMSRV_SENDINFO_V3 = $8304;//信息服务
      TERMSRV_CALLBACK_V3 = $8400;//电话回拨
      TERMSRV_SETPHONEBOOK_V3 = $8401;//设置电话本
      TERMSRV_DEVCONTROL_V3 = $8500;//车辆控制
      TERMSRV_SETCIRCLEAREA_V3 = $8600;//设置圆形区域
      TERMSRV_DELCIRCLEAREA_V3 = $8601;//删除圆形区域
      TERMSRV_SETRECTAREA_V3 = $8602;//设置矩形区域
      TERMSRV_DELRECTAREA_V3 = $8603;//删除矩形区域
      TERMSRV_SETPOLYGONAREA_V3 = $8604;//设置多边形区域
      TERMSRV_DELPOLYGONAREA_V3 = $8605;//删除多边形区域
      TERMSRV_SETLINE_V3 = $8606;//设置路线
      TERMSRV_DELLINE_V3 = $8607;//删除路线
      TERMSRV_TAKEAPHOTO_V3 = $8801;//拍照
      TERMSRV_COLLECTRUNRECDATA_V3 = $8700;//采集行驶记录数据
      TERMSRV_SETRUNRECPARAM_V3 = $8701;//设置行驶记录参数
        SETRUNRECPARAM_DRIVERNO_OLD = $81;//设置驾驶员代码 、驾驶证号
        SETRUNRECPARAM_VINCARNOTYPE_OLD = $82;//设置车辆VIN号、车牌号码、车辆分类
        SETRUNRECPARAM_TIME_OLD = $C2;//设置北京时间
        SETRUNRECPARAM_CARCCC_OLD = $C3;//设置特征系数

        SETRUNRECPARAM_CARINFO = $82;//设置车辆信息
        SETRUNRECPARAM_INSTALLDATE = $83;//设置记录仪初次安装日期
        SETRUNRECPARAM_STATUSPARAM = $84;//设置状态量配置信息
        SETRUNRECPARAM_TIME = $C2;//设置记录仪时间;
        SETRUNRECPARAM_PULSE = $C3;//设置记录仪脉冲系数
        SETRUNRECPARAM_INITMILEAGE = $C4;//设置初始里程
      TERMSRV_QUERYMEDIADATA_V3 = $8802;//多媒体数据检索
      TERMSRV_MEDIADATAUPLOAD_V3 = $8803;//多媒体数据上传
      TERMSRV_MEDIADATAUPLOAD_SINGLE_V3 = $8805;//单条多媒体数据上传
      TERMSRV_RECORD_V3 = $8804;//录音命令
      TERMSRV_TSPDATA_V3 = $8900;//数据下行透传

      //------------北斗新增------------
      TERSRV_UPGRADETERMINAL_BD = $8108;//下发终端升级包
      TERSRV_READPARAMSPEC_BD = $8106;//读取指定参数
      TERSRV_GETDEVPROPERTY_BD = $8107;//查询终端属性
      TERSRV_GETDRIVERINFO_BD = $8702;//获取驾驶员信息
      TERSRV_CONFIRMALARM_BD = $8203;//人工确认报警消息
      
      SRVTERM_GETDEVPROPERTY_BD = $0107;//查询终端属性应答
      SRVTERM_UPGRADETERMINAL_RET_BD = $0108;//终端升级结果通知

      //------------北斗新增------------
    {********************************透传到车机的命令**************************}

  {*************************************客户端->中心***************************}

  {*************************************中心->客户端***************************}
    //通用应答
    SRVTERM_TYRET_V3 = $81;
    //车辆在线状态
    SRVTERM_DEVONLINE_V3 = $82;
    //照片上传成功
    SRVTERM_PICUPLOADOK_V3 = $83;
    //音频上传成功
    SRVTERM_AUDIOUPLOADOK_V3 = $84;
    //电子围栏报警
    SRVTERM_AREAALARM_V3 = $85;
    //获取最后位置
    SRVTERM_LASTGPS_V3 = $86;
    //政府平台报警督办
    SRVTERM_GOV_ALARMSUPERVISE = $87;
    //政府平台查岗
    SRVTERM_GOV_CHECKDUTY = $89;
    //政府平台下发报文信息
    SRVTERM_GOV_TEXTINFO = $8A;
    //政府平台下发预警信息
    SRVTERM_GOV_EARLYWARNING = $8B;
    //政府平台下发实时报警信息
    SRVTERM_GOV_ALARM = $8C;
    //政府平台通知下发gps数据数量
    SRVTERM_GOV_GPSDATACOUNT = $8D;
    //政府平台下发gps数据
    SRVTERM_GOV_GPSDATA = $8E;
    //政府平台通知开始交换车辆定位信息
    SRVTERM_GOV_STARTGPSDATA = $8F;
    //政府平台通知结束交换车辆定位信息
    SRVTERM_GOV_ENDGPSDATA = $91;

    //中心透传命令
    SRVTERM_TRANSPARENT = $D5;
    {*******************************车机透传上来的命令*************************}
      SRVTREM_READDEVPARAM_V3 = $0104;//读取车机参数
      SRVTERM_PGPSDATA_V3 = $0200;    //定位数据
      SRVTERM_FINDPOSTION_V3 = $0201; //位置查询应答
      SRVTERM_EVENTUPLOAD_V3 = $0301;//事件报告
      SRVTERM_QUESTIONANSWER_V3 = $0302;//提问应答
      SRVTERM_INFOMENU_V3 = $0303;//信息点播
      SRVTERM_DEVCONTROL_V3 = $0500;//车辆控制应答
      SRVTERM_RUNRECDATAUPLOAD_V3 = $0700;//行驶记录仪数据上传
      SRVTERM_ERUNDATA_V3 = $0701;//电子运单上传
      SRVTERM_DRIVERINFO_V3 = $0702;//驾驶员身份信息采集上报
      SRVTREM_MEDIAEVENTUPLOAD_V3 = $0800;//多媒体事件信息上传
      SRVTERM_MEDIADATAUPLOAD_V3 = $0802;//多媒体数据检索应答
      SRVTERM_TSPDATAUPLOAD_V3 = $0900;//数据上行透传
      SRVTERM_COMPRESSEDDATA_V3 = $0901;//数据压缩上传

      SRVTERM_DRIVERLOGIN_V3 = $0B01;//司机签到
      SRVTERM_DRIVERLOGOUT_V3 = $0B02;//司机签退
      SRVTERM_TRANSPORTSTART_V3 = $0B03;//运输开始
      SRVTERM_TRANSPORTEND_V3 = $0B04;//运输结束
    {*******************************车机透传上来的命令*************************}

    SRVTERM_SERVERINFO = $E2;//中心服务器通知平台各服务器运行状况
  {*************************************中心->客户端***************************}
//------------------------------------------------------------------------------

  SecondsPerMinute = 60;
  SecondsPerHour = 60 * 60;
  SecondsPerDay = 24 * 60 * 60;

function ReturnMsgTypeState(State: integer): string;
//得到断油电供油供电的具体内容
function ReturnCutOrFeedContent(ParamId: Byte): string;
 //得到　已上传照片的拍照原因
function ReturnUploadPicReason(PicReason:byte):String;
//报警类型
function ReturnDevAlarmType(AlarmType:Byte):string;
implementation


function ReturnMsgTypeState(State: integer): string;
begin
  Result := '';
  case State of
    MSG_Warning_0:  Result := '紧急报警';
    MSG_Warning_1:  Result := '超速报警';
    MSG_Warning_2:  Result := '疲劳驾驶';
    MSG_Warning_3:  Result := '预警';
    MSG_Warning_4:  Result := 'GPS模块发生故障';
    MSG_Warning_5:  Result := 'GPS天线未接或被剪断';
    MSG_Warning_6:  Result := 'GPS终端主电源掉电';
    MSG_Warning_7:  Result := '终端主电源欠压';
    MSG_Warning_8:  Result := '终端主电源掉电';
    MSG_Warning_9:  Result := '终端主电源掉电';
    MSG_Warning_10: Result := 'TTS模块故障';
    MSG_Warning_11: Result := '摄像头故障';
    MSG_Warning_12: ;
    MSG_Warning_13: ;
    MSG_Warning_14: ;
    MSG_Warning_15: ;
    MSG_Warning_16: ;
    MSG_Warning_17: ;
    MSG_Warning_18: Result := '当天累计驾驶超时';
    MSG_Warning_19: Result := '超时停车';
    MSG_Warning_20: Result := '进出区域';
    MSG_Warning_21: Result := '进出路线';
    MSG_Warning_22: Result := '路段行驶时间不足/过长';
    MSG_Warning_23: Result := '路线偏离报警';
    MSG_Warning_24: Result := '车辆VSS故障';
    MSG_Warning_25: Result := '车辆油量异常';
    MSG_Warning_26: Result := '车辆被盗';
    MSG_Warning_27: Result := '车辆非法点火';
    MSG_Warning_28: Result := '车辆非法位移';
    MSG_Warning_29: Result := '车辆被盗';
    MSG_Warning_30: ;
    MSG_Warning_31: ;


    {MSG_TYPE_LCD_MENU: Result := '固定菜单';
    MSG_TYPE_CONTRAL_INFO: Result := '调度信息';
    MSG_TYPE_TAXI_STOPTIME: Result := '计价器停机时间';
    MSG_TYPE_SEV_INFO: Result := '服务器通知消息';
    MSG_TYPE_DEV_SEND_TO_HOST: Result := '收到发给到中心的数据';
    MSG_TYPE_GPS_MODULE_ERROR: Result := 'GPS模块发生故障';
    MSG_TYPE_GPS_LINE_ERROR: Result := 'GPS天线未接或被剪断';
    MSG_TYPE_LOW_V: Result := '低压报警';
    MSG_TYPE_LCD_ERROR: Result := 'LCD故障';
    MSG_TYPE_MEASURE_ERROR: Result := '计价器故障';
    MSG_TYPE_SIM_ERROR :Result :='SIM卡故障'; //= 29;
    MSG_TYPE_LEDAD_ERROR: Result :='LED广告屏故障';// 30;
    MSG_TYPE_PHOTOVIDICON_ERROR:Result :='摄像头 故障';// = 31; //

    //MSG_TYPE_ZTUPLOADCARRYXSLC :Result := '渣土车进入空车'; //= 30; //渣土车上传重车里程，进入空车
    //MSG_TYPE_ZTUPLOADOFFXSLC :Result := '渣土车进入重车';//= 31;   //渣土车上传空车里程，进入重车
    MSG_TYPE_AreaAlarm:Result:='进出区域报警'; //32       }
  end;
end;

function ReturnCutOrFeedContent(ParamId: Byte): string;
begin
  Result := '';
  case ParamId of
    CUT_OIL: Result := '断油';
    CUT_ELECTRICITY: Result := '断电';
    FEED_OIL: Result := '供油';
    FEED_ELECTRICITY: Result := '供电';
  end;
end;

 //得到　已上传照片的拍照原因
function ReturnUploadPicReason(PicReason:byte):String;
begin
  Result := '';
  case PicReason of
    0: Result := '平台下发';
    1: Result := '定时动作';
    2: Result := '抢劫报警';
    3: Result := '碰撞侧翻报警';
    4: Result := '疲劳报警';
  else
    Result:='不明原因';
  end;
end;

function ReturnDevAlarmType(AlarmType:Byte):string;
begin
  Result := '';
  case AlarmType of
    MSG_Warning_16 : Result :='超速报警';// 17;// 第17位	1：
    //GPSALARM_DEVCUTPOWER : Result :='断电报警';// 18;//第18位	1：
    MSG_Warning_17 : Result :='疲劳驾驶报警';// 19;//第19位	1：
    MSG_Warning_18 : Result :='累计驾驶报警';
    MSG_Warning_19 : Result :='停车超时报警';
    //GPSALARM_INDEVAREA : Result :='进区域(车机)报警';// 20;//第20位	1：
    //GPSALARM_OUTDEVAREA : Result :='出区域(车机)报警';// 21;//第21位	1：
    //GPSALARM_OUTLINE : Result :='偏离路线报警';// 22;//第22位	1：
    //GPSALARM_FORTIFY : Result :='设防报警';//23; //第23位	1: Result :  非法启动报警
    //GPSALARM_DEVLOWPOWER : Result :='低压报警';// 26;//第26位	1：
  else
    Result:='其它不明报警';
  end;
end;
end.
