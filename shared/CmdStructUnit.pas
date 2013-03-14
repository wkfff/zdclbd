{通讯时命令结构体及命令字的定义
　@author()
  @created(2004-03-)
  @lastmod(GMT:$Date: 2012/11/30 01:29:23 $) <BR>
  最后更新人:$Author: wfp $  <BR>
  当前版本:$Revision: 1.2 $  <BR>}

unit CmdStructUnit;

interface


uses
  Windows, winsock, Types;

const
       FACT_ID = $22; //厂家编号
  MAC_TYPE = $00; // 设备类型
  LCD_FACT_ID = $00;  // lcd的厂商标识

  METER_TYPEID = $02; // 计价器
  TSM_TYPEID = $03; // TMS
  LED_TYPEID = $04; // LED
  LIGHT_TYPEID = $05; // 智能顶灯
  LCD_TYPEID = $09; // LCD
  {数据通讯协议  版本常量定义 MajorVer=XX,MinorVer=XX
  @see TCmdTermsrvRegverData}
  DATAPROTOCOL_10 = $0100;
  DATAPROTOCOL_20 = $0200;
  DEVPROTOCOL_20 = $02; //与车机2.0，通讯版本2.0
  DEVPROTOCOL_30 = 30; //与AES加密过的车机通讯版本 3.0 (为与DevVer对应，这里取值30)20070830.sha



  TERMSRV_SENDCONTROLINFO_NEEDDEVANSWER = $15; // 客户端->网关 发送需回复的调度信息 (发送文本消息)
  CLIENT_SETELCFENCE = $4B; //设置车机的电子围栏
  SEV_DEVClientArea = $4B;
  TCLIENT_READSAVEELCFENCE = $4C; //读取车机内存储的电子围栏
  SEV_READSAVEELCFENCE=$4C;
  TCLIENT_CANCELDESIGNFENCE = $4D; //取消指定的电子围栏信息
  SEV_CANCELDESIGNFENCE=$4D;

  //
//  
//  (*************客户端与网关之间 的命令标识常量定义 ******************)
//  //TERMSRV_COMMVER = $01;
//  //SRVTERM_COMMVER = $81;
//  TERMSRV_REG = $01;  // 注册
//  SRVTERM_REG = $81;  // 注册应答
//  TERMSRV_GETLASTPOS = $03;
//  SRVTERM_GETLASTPOS = $83;
//
//  (*===客户端与网关V1.0=========== *)
//  TERMSRV_GETDEVSTAT = $04;
//  SRVTERM_GETDEVSTAT = $84;
//  SRVTERM_GPSDATA = $85;
//  TERMSRV_CALLDEV = $06;
//  SRVTERM_CALLDEV = $86;
//  TERMSRV_SWCTRL = $07;
//  SRVTERM_SWCTRL = $87;
//  TERMSRV_SENDDEVMSG = $08;
//  SRVTERM_SENDDEVMSG = $88;
//  SRVTERM_SENDMSG = $89;
//  TERMSRV_PING = $0A;
//  SRVTERM_PING = $8A;
//  SRVTERM_NOTIFYMSG = $8B; //网关服务器给客户端发送通知消息
//  TERMSRV_CANCELCMD = $0C; //取消命令
//  SRVTERM_CANCELCMD = $8C;
//  SRVTERM_LASTGPSDATA = $8D; //返回的数据结构同GpsData但是表时是服务器响应车机的命令而返回的.
//  TERMSRV_SENDTODTE = $0E; //发送数据至外接DTE
//  SRVTERM_SENDTODTE = $8E;
//  SRVTERM_DEVTOHOST = $8F; //收到外接DTE发送给主机的数据
//  SRVTERM_CMDDELTED = $90; //命令被删除.
//  TERMSRV_READDEVPARAM = $11; //读取设备参数
//  SRVTERM_READDEVPARAM = $91; //返回设备的参数数据
//  TERMSRV_SETDEVPARAM = $12; //设置设备参数
//  SRVTERM_SETDEVPARAM = $92; //返回设置设备参数命令的执行结果
//
//  (*=======客户端 V2.0 命令字=====如果有与V1.0类似含义的，V2.0中命令字在原基础后加_V2 *)
//  TERMSRV_GETDEVSTAT_V2 = $04; //与1.0版本　命令字值一样，但结构体定义已有区别
//  SRVTERM_GETDEVSTAT_V2 = $84;
//  TERMSRV_GETPOSITION = $13; // 客户端->网关 取车机定位数据
////  SRVTERM_GETPOSITION = $93;
//  TERMSRV_PURSUE = $14; // 客户端->网关 追踪车辆
//  SRVTERM_PURSUE = $94;
//  TERMSRV_SETDEVPARAM_V2 = $15; // 客户端->网关 设置参数 。==为示与1.0版本的区别，命令字后加2
//
//  SRVTERM_SETDEVPARAM_V2 = $95;
//  TERMSRV_READDEVPARAM_V2 = $1D; // 客户端->网关  查询参数
//  SRVTERM_READDEVPARAM_V2 = $9D;
//  TERMSRV_REMOVEALARM = $16; // 客户端->网关 解除报警
//  SRVTERM_REMOVEALARM = $96;
//  TERMSRV_MODIFYDEVDISPLAYNAME = $17; // 客户端->网关 修改车机显示屏 主界面公司名称
//  SRVTERM_MODIFYDEVDISPLAYNAME = $97;
//  TERMSRV_MODIFYDEVDISPLAYFIXEDMENU = $18; // 客户端->网关 修改车机显示屏 固定菜单
//  SRVTERM_MODIFYDEVDISPLAYFIXEDMENU = $98;
//  TERMSRV_SENDCONTROLINFO = $19; // 客户端->网关 发送文本调度信息
//  SRVTERM_SENDCONTROLINFO = $99;
//  TERMSRV_SENDCONTROLINFO_NEEDDEVANSWER = $15; // 客户端->网关 发送需回复的调度信息 (发送文本消息)
//  SRVTERM_SENDCONTROLINFO_NEEDDEVANSWER = $AA;
//  TERMSRV_SETTELLIST = $1B; // 客户端->网关 设置电话本
//  TERMSRV_SETEVENTLIST = $16; // 客户端->网关 设置事件
//  SRVTERM_SETTELLIST = $AB;
//  TERMSRV_UPDATEDEVFIRMWARE = $1C; // 客户端->网关 升级车机固件程序
//  SRVTERM_UPDATEDEVFIRMWARE = $AC;
//    //--- 订单
//  TEMRSRV_MODIFYDEVDISPLAY_CANCELORDERMENU = $1E; //修改车机显示屏取消订单的菜单
//  SRVTERM_MODIFYDEVDISPLAY_CANCELORDERMENU = $C0;
//  TERMSRV_DOWNAORDER = $1F; //下发一条订单供抢答
//  SRVTERM_DOWNAORDER = $C1;
//  TERMSRV_DOWNCANCELORDER = $38; //下发订单取消
//  SRVTERM_DOWNCANCELORDER = $C2;
//    //--- 订单：网关给客户端
//  SRVTERM_ORDERCHANGED = $C3; //当订单状态有变化时，网关通知客户端去更新订单信息
//
//  //新增断油\断电\供油\供电功能：2005.12.20
//  TERMSRV_CUTORFEED_OIL_ELECTRICITY = $21; // 客户端->网关 断油\断电\供油\供电
//  SRVTERM_CUTORFEED_OIL_ELECTRICITY = $C4;
//  //新增 读车机测试数据  2006-3-24
//  TERMSRV_READTESTDATA = $22; //客户端->网关读取车机测试数据
//  SRVTERM_READTESTDATA = $C5;
//  //新增　读车机版本数据　2006-4-26
//  TERMSRV_READDEVVER = $23; //客户端->网关读取车机版本数据
//  SRVTERM_READDEVVER = $C6;
//  //新增司机相关命令 2006-8-25
//  TERMSRV_SETDRIVERS = $24; //客户端->网关 设置司机信息
//  SRVTERM_SETDRIVERS = $C7;
//  TERMSRV_READDRIVERS = $25; //              读取司机信息
//  SRVTERM_READDRIVERS = $C8;
//  TERMSRV_READCURRENTDRIVER = $26; //              读取当前司机
//  SRVTERM_UPLOADCURRENTDRIVER = $C9; //网关->客户端　上传当前司机
//  SRVTERM_UPLOADDRIVERLOGOUT = $CA; //网关->客户端　上传司机下班退出
//  //新增客户端让车机拍一张照 2006-12-18
//  TERMSRV_GETAPIC = $27; //客户端->网关 拍照，拍当前照片
//  SRVTERM_GETAPIC = $CB; //网关->客户端 回复
//  //20070518 流量
//  TERMSRV_READFLUX = $28; //客户端->网关，读取当前流量
//  SRVTERM_UPLOADFLUX = $CC; //网关->客户端　收到车机 上传流量
//  //2007-8-23 增加广告相关命令
//  TERMSRV_DOWNANAD = $29; //客户端->网关，下发一条广告信息
//  SRVTERM_DOWNANAD = $CD;
//  TERMSRV_DELANAD = $2A; //客户端->网关，删除一条广告信息
//  SRVTERM_DELANAD = $CE;
//  TERMSRV_DELALLAD = $2B; //客户端->网关，删除所有广告信息
//  SRVTERM_DELALLAD = $CF;
//  TERMSRV_READALLADID = $2C; //客户端->网关，读取车机内所有广告的ID
//  SRVTERM_READALLADID = $D0;
//  TERMSRV_DOWNALLWAY = $2D; //客户端->网关，下发车辆方向显示内容
//  SRVTERM_DOWNALLWAY = $D1;
//  TERMSRV_DOWNLISTENCALLNUM = $2E; // 客户端->网关，设置车机主动向外拨打的监听号码 2007-9-24
//  SRVTERM_DOWNLISTENCALLNUM = $D2;
//  TERMSRV_DOWNGENERICCOMMAND = $2F; //客户端->网关，客户端发送通用命令，网关不解析   2007-10-08  (wlei)
//  SRVTERM_DOWNGENERICCOMMAND = $D3;
//  TERMSRV_DOWNABUSSTATIONINFO = $30; //客户端->网关，设置一个站点信息 2007-10-17
//  SRVTERM_DOWNABUSSTATIONINFO = $D4;
//  SRVTERM_INORDOWNSTATION = $D5; //网关->客户端  上传车辆进站或出站
//  TERMSRV_CLEARBUSSTATIONINFO = $31; //客户端-》网关，清除车机中的站点信息
//  SRVTERM_CLEARBUSSTATIONINFO = $D6; //网关->客户端
//  //2008-05-09增加相关的新版广告,客户端发往网关的命令字和网关回复的命令暂订为同一个
//  TERMSRV_DOWNLED_NEW = $32; //客户端->网关，下发广告信息
//  SRVTERM_DOWNLED_NEW = $32;
//  TERMSRV_DISCURRLED_NEW = $33; //客户端->网关，显示当前的广告
//  SRVTERM_DISCURRLED_NEW = $33;
//  TERMSRV_DELETELEDBYID_NEW = $34; //客户端->网关，删除指定ID广告
//  SRVTERM_DELETELEDBYID_NEW = $34;
//  TERMSRV_DELETELED_NEW = $35; //客户端->网关，删除所有的广告
//  SRVTERM_DELETELED_NEW = $35;
//  TERMSRV_SETLEDTIME_NEW = $36; //客户端-》网关，设置LED时间
//  SRVTERM_SETLEDTIME_NEW = $36;
//  TERMSRV_READLEDINFO_NEW = $37; //客户端->网关，读取屏信息
//  SRVTERM_READLEDINFO_NEW = $37;
//  TERMSRV_READALLADID_NEW = $38; //客户端->网关，读取所有广告ID
//  SRVTERM_READALLADID_NEW = $38;
//  TERMSRV_DISSAVELEDBYID = $39; //客户端->网关，显示存储的广告ID
//  SRVTERM_DISSAVELEDBYID = $39;
//  TErMsRV_ShowLedSaveID = $49; //立即显示LED屏内指定
//  SRVTERM_ShowLedSaveID = $49; //
//  TERMSRV_DISSAVELEDIsState = $4A; //客户端->网关，LED屏控制指令  通用应答
//  SRVTERM_DISSAVELEDIsState = $4A; //网关-〉客户
//
//  SRVTERM_UPLOADHOURDIS = $3A; //车机主动上传每小时行驶里程
//  TERMSRV_READHOURDIS = $3B; //客户端->网关，读取每小时行驶里程
//  SRVTERM_READHOURDIS = $3B;
//  TERMSRV_SETLEDTIME = $3C;
//  SRVTERM_SETLEDTIME = $3C;
//  //========================================================================20080622增加电子站牌相关的命令字
//  SETSTATIONPARAM_STATIONBRANK = $3D;            //设置电子站牌的参数
//  READSTATIONPARAM_STATIONBRANK = $3E;     //读取参数
//  SENDAD_STATIONBRANK = $3F;
//  DISCURRAD_STATIONBRANK = $40;
//  DELETEDESIGNAD_STATIONBRANK = $41;
//  DELETEALLAD_STATIONBRANK=$42;
//  SETADTIME_STATIONBRANK = $43;
//  SECURET2GATAWAY_STATIONBRANK = $46;
//  //======================================客户端读取当前车辆所处的站点信息
//  READDEVONSTATION_STATIONBRANK = $47;
//  STATIONBRANK_ONOROFF = $48;
//
//  TERMSRV_EMPTYNEXTFLAG = $08;    // 客户端->网关，设置空重车提示语音   次命令
//  SRVTERM_EMPTYNEXTFLAG = $08;
//
//  TERMSRV_SENDCONTROLCMDTXT = $15; //客户端->网关，下发带控制指令的文本调度信息 20090203 sha
//  SRVTERM_SENDCONTROLCMDTXT = $58;
//  TERMSRV_READDEVVERSION_EXTEND = $59; //客户端->网关，读取设备版本(含外设)
//  SRVTERM_READDEVVERSION_EXTEND = $59;
//
//  TERMSRV_SENDNEWATTEMPER = $60;//客户端->网关，向车机下发调度任务    20090423 sha
//  SRVTERM_RETSENDNEWATTEMPER = $60;
//  TERMSRV_SENDCANCELTHEATTEMPER = $61;//客户端->网关，向车机取消某调度任务
//  SRVTERM_RETSENDCANCELTHEATTEMPER = $61;
//
//  SRVTERM_CHGATTEMPERSTATE = $5F;//网关-》客户端 车机上传调度任务状态改变
//
//  //==========================================================================================================
//  //-----------网关给客户端
//  SRVTERM_OVERSPEEDINFO = $D7; //网关-》客户端  超速记录
//  SRVTERM_DEVSTOPINFO = $D8; //网关-》客户端  停车记录
//  SRVTERM_TAXIRUNDATA = $D9; //网关-》客户端  计价器营运数据
//  SRVTERM_DRIVERON = $DA; //网关-》客户端  司机登录
//  SRVTERM_DRIVEROFF = $DB; //网关-》客户端   司机退出
//  //网关收到客户端的心跳后，网关给客户端的应答  2006-1-10 SHA
//  SRVTERM_HEARTBEAT = $F0;
//
//  //另：网关给客户端
//  SRVTERM_GPSDATA_V2 = $AE; //网关->客户端　收到车机定位数据
//  SRVTERM_DRIVERUPLOADFIXEDMENU = $AF; //网关->客户端－收到司机上传的固定菜单
//  SRVTERM_SENDCONTROLINFO_DRIVERANSWER = $B0; //              收到司机对 需回复的调度信息 的回复信息
//  SRVTERM_TAXIMETERRUNDATA = $B1; //              收到车机上传的计价器运营数据
//  SRVTERM_TAXIMETERCONFIRMSTOPTIME = $B2; //              收到车机上传的计价器确认的停机时间
//  //2006-8-22 系统管理端-网关-监控端
//  SRVTERM_CUTSELF = $B3; //网关->监控端 收到系统管理端让监控端关闭自身
//  SRVTERM_ADMSENDMSG = $B4; //网关->监控端 收到系统管理端发送来消息
//  //网关告知客户端 已上传新的照片 2006-12-18
//  SRVTERM_APICUPLOADED = $B5; // 网关->客户端　收到车机已成功上传一张照片
//  SRVTERM_TELLDBREFRESH = $B6; //网关－＞WEbService, 数据库中用户车机对照表已有更改
//  //网关告知扩展服务器南通计价器数据上传
//  SRVTERM_NTTAXIMETADATA = $B7;
//  //网关告知客户端车机从服务器注销
//  SRVTERM_DEVLOGOUTFROMSRV = $B8;
//  //网关主动告知客户端－－收到渣土车上传空重车里程 20081126 sha
//  SRVTERM_DEVZTUPLOADCARRYOFFXSLC = $B9;
//  //2008年12月10号  增加设置信息到车机 swp
//
//  CLIENT_SETELCFENCE = $4B; //设置车机的电子围栏
//  SEV_DEVClientArea = $4B;
//  TCLIENT_READSAVEELCFENCE = $4C; //读取车机内存储的电子围栏
//  SEV_READSAVEELCFENCE=$4C;
//  TCLIENT_CANCELDESIGNFENCE = $4D; //取消指定的电子围栏信息
//  SEV_CANCELDESIGNFENCE=$4D;
//  SEV_UPLOADAREAWARN=$4E;  //转发车机区域报警记录到扩展及客户端
//
//
//  {UDP命令通知从应用服务器或数据库中刷新数据
//  标志一定要满足统一的分配方案：
//  <li> 新版本车机命令标志【$20~$29】
//  <li> 用户UDP命令标志【$30~$3F】
//  <li> 老版本车机命令 【$40~$FF】
//  <li>小于$20的标志，系统保留}
//  DBSRV_REFRESH = $308E;
//
//  (**sha 20081230 smsclient***************************)
//  //短信客户端与网关主命令字。--客户端告知网关，通过短信服务器执行下列命令。
//  TERMSRV_SMSCLIENT = $51;
//  SRVTERM_SMSCLIENT = $51;//取相同命令字
//  //小命令字
//  TERMSRV_SMS_DEVUPGRADEDEVFIRMWARE= $01;
//  TERMSRV_SMS_REMOVEALARM = $02;
//  TERMSRV_SMS_DEVRESTART = $03;
//  TERMSRV_SMS_CONTROLDEV = $04;
//  TERMSRV_SMS_SETPARAM   = $05;
//  //*********************smsclient********************
//  //**　增加读取存储的照片 20090119 sha
//  TERMSRV_READPICTIMESINFO = $56; //查询照片时间范围指令
//  SRVTERM_RETREADPICTIMESINFO = $56;
//  TERMSRV_READTHEPIC       = $57; //按条件读取存储的照片指令
//  SRVTERM_RETREADTHEPIC       = $57;
//  TERMSRV_STOPUPLOADSAVEDPIC  = $5B;//终止上传车机存储照片
//  SRVTERM_STOPUPLOADSAVEDPIC  = $5B;
//
//  TERMSRV_READDEVTELLIST = $5C;//读取车机电话本
//  SRVTERM_RETREADDEVTELLIST = $5C;
//  TERMSRV_READDEVDISPLAYFIXEDMENU = $5D;//读取车机 固定菜单
//  SRVTERM_RETREADDEVDISPLAYFIXEDMENU = $5D;

  {==========V3.0命令字=========}
  TERMSRV_REG_V3 = $01;  // 客户端登录
    
  TERMSRV_SETDEVPARAM_V3 = $10; // 客户端->网关 设置参数
  TERMSRV_READDEVPARAM_V3 = $11;  //  客户端->网关 查询参数
  TERMSRV_CONTROLTERMINAL_V3=$12; // 终端控制
  //TERMSRV_FINDPOSTION_V3 = $05; //位置查询
  TERMSRV_PURSUE_V3 = $14;  // 临时位置跟踪
  TERMSRV_SENDTXTMSG_V3= $15; //文本信息下发
  TERMSRV_SETEVENTLIST_V3 = $16; // 客户端->网关 设置事件

  SRVTERM_TYRESPONSE_V3 = $81;  // 通用应答
  SRVTERM_READDEVPARAM_V3 = $92;  //  查询参数应答
  SRVTERM_GETPOSTION_V3 = $93;    // 位置信息汇报
//  SRVTERM_FINDPOSTION_V3 = $86; // 位置查询应答
  SRVTERM_REPORTEVENT_V3 = $95; // 网关->客户端，事件报告

  TERMSRV_SETQUESTLIST_V3 = $17;  // 提问
  SRVTERM_REPORTANSWER_V3 = $96; // 网关->客户端，提问应答
  TERMSRV_BACKCALLTEL_V3 = $1A;  // 回拨电话
                                           
  TERMSRV_CONTROLCAR_V3 = $1B;  // 车辆控制
  SRVTERM_CONTROLCAR_V3 = $98;  // 车辆控制应答

  TERMSRV_GETAPIC_V3 = $24;   // 拍照
//  SRVTERM_DEVONLINE_V3 = $82;     //车辆在线状态

  TERMSRV_HEART_V3 = $00;      // 心跳
  TERMSRV_REMOVEALARM_V3 = $33; // 解除紧急报警

  TERMSRV_QUERYPICTURE_V3 = $25;  // 存储图片检索
  SRVTERM_QUERYPICTURE_V3 = $A6;  // 存储图片检索应答
  //----------------------------
  TERMSRV_SENDTAXIBUSS_V3 = $29;  // 发送出租业务

  SERTERM_DRIVER_LOGIN_IN_V3 = $9B;  // 司机签到
  SERTERM_DRIVER_LOGIN_IN_V3_9F = $9F;// $E1;司机签到新
  SERTERM_DRIVER_LOGIN_OUT_V3 = $9C;  // 司机签退
  SERTERM_SERVER_JUDGE_V3 = $AC;  // 服务评价信息
  
  TERMSRV_SETTELLIST_V3 = $2C;  // 设置电话本




  TERMSRV_SETINFOMENU_V3 = $18; // 客户端->网关 信息点播菜单 设置
  


  TERMSRV_SETCLASSINFOMENU_V3 = $27;   // 周边信息分类菜单
  
  TERMSRV_GETENDPOSTION_V3 = $3F; //获取车机最后一个定位数据
  SRVTERM_GETENDPOSTION_V3 = $B3; // 获取车机最后一个定位数据应答
  TERMSRV_FINDBLACEVER_V3 = $41;  //查询黑名单版本号
  TERMSRV_SENDUPBLACK = $42;  // 通知MCU升级黑名单

  

  TERMSRV_ANTIFAKE_V3 = $2B;   // 设置防伪标志
  SRVTERM_ANTIFAKE_V3 = $9E;   // 设置防伪标志应答
  

  TERMSRV_INFOSERVER_V3 = $19;  // 服务信息

  TERMSRV_QUERYAUDIO_V3 = $39;  //音频数据检索
  SRVTERM_QUERYAUDIO_V3 = $AD;  //音频数据检索应答
  TERMSRV_UPPICTURE_V3 = $37; // 存储图片上传
  SRVTERM_UPLOADPICTURE_V3 = $83; // 有新的照片保存成功
  SRVTERM_UPLOADAUDIO_V3 = $84; // 有新的MP3保存成功
  TERMSRV_MCU_V3 = $31;
  TERMSRV_POLLING_MCU_V3 = $3C; // 车辆巡检
  TERMSRV_TSM_V3 = $3D; // TSM安全模块控制指令
  TERMSRV_METER_V3 = $3E;  // 计价器控制指令
  SRVTERM_POLLING_MCU_V3 = $AE; // 车辆巡检应答
  SRVTERM_MCU_V3 = $A4; // 智能顶灯响应
  TERMSRV_LED_V3 = $2E; // LED控制指令
  TERMSRV_SEND_V3 = $40;  //透传数据命令字
  SRVTERM_LED_V3 = $A0; // LED控制指令应答
  SRVTERM_SEND_V3 = $B4;  // 透传数据命令应答
  SRVTERM_LCD_V3 = $A7; // LCD控制指令应答
  SRVTERM_MCUUPDATERES_V3 = $A8;  // MCU升级报告结果
  SRVTERM_TSM_V3 = $B0; // TSM安全模块控制指令应答
  SRVTERM_METER_V3 = $B1; // 计价器控制指令应答
  SRVTERM_ORDERCHANGED_V3 = $99;  // 订单状态发生变化
  SRVTERM_DRIVERCANCELORDER_V3 = $AB; //因驾驶员原因取消订单
  SRVTERM_ORDERDONE_V3 = $AA;//订单完成
//  TERMSRV_SETCIRCLEAREA_V3 = $1C; // 设置圆形区域
//  TERMSRV_SETRECTANGLEAREA_V3 = $1E;  // 设置矩形区域
//  TERMSRV_SETNOSYMBOLAREA_V3 = $20;   // 设置不规则区域
  SRVTERM_SENDVIDEW_V3 = $32; // 发送视频文件


  TCLIENT_CANCELCIRCLEAREA_V3=$1D; //删除指定的圆形区域
  TCLIENT_CANCELERECTANGLEAREA_V3=$1F;  // 删除指定的矩形区域
  TCLIENT_CANCELERENOSYMBOLAREA_V3=$21; // 删除指定的多变形区域

  TERMSRVINITIALIZEMCU_V3=$34;  //远程恢复MCU的出厂初始值
  TRRMSERVCONTROLMCU_V3=$35;  // 远程MCU复位

  TERMSRV_CONFIRMEARLYWARNING_V3=$3A; //确认预警
  TERMSRV_CANCELEARLYWARNING_V3=$3B; //取消预警

  TERMSRV_UPDATEFIRMWARE_V3=$36;  //升级固件


  SRVTERM_PURSUEPOSTION_V3 = $B5; // 发送监控参数后，车机返回过来的定位数据
  SRVTERM_FINDBLACEVER_V3 = $B6;  // 查询黑名单版本信息应答

  SRVTERM_SAVEDRUNDATA_V3 = $B8;  // 出租车一卡通刷卡交易明细上传应答



  //TERMSRV_QUERYBLACKVERISON = $41;  // 查询MCU黑名单版本
  //SRVTERM_QUERYBLACKVERISON = $B6;  // MCU响应查询黑名单版本的请求

  //TERMSRV_SENDUPDATEBLACKLIST = $42;  // 通知MCU升级黑名单

type
  {版本数据结构
  @TABB
  @H(标识      |类型       |含义                  |参见)
  @R( MinorVer |Byte       |次版本号              |  )
  @R( MinorVer |Byte       |主版本号              |  )
  @R( Version  |Word       |用16位整型表示的版本数值| )
  @TABE}
  TVer = packed record
    case integer of
      0:
      (MinorVer, MajorVer: Byte; );
      1: (Version: Word);
      2: (DevMajorVer, DevMinorVer: Byte; );
  end;

type
  TDateTime_V2 = array[0..5] of byte;
  TDEV_ID_BCD_V3 = array[0..3] of Byte;
  TDEV_ID_BCD_HRB = array[0..4] of Byte;
  TDEV_ID_BCD_ZDCL = array[0..5] of Byte;
  TDEV_ID_BCD_ZDCLArray = array of TDEV_ID_BCD_ZDCL;

  TGovObjID = array[0..11] of Byte;

//  //==================客户端与数据中心通信的数据包=========//
//  TCmdToDataCenter = packed record
//    Head: Byte;         // 头
//    DataType: Byte;     // 数据类型
//    BusinessType: Byte; // 业务类型
//    Grade: Byte;        // 级别
//    CmdID: Integer;     // 序列号
//    Reserve: array[0..3] of Byte; // 保留
//    DataLength: Word;   // 报文内容的长度
//    Data: PByte;      // 报文类容
//    Check: Byte;        // 校验码
//    Tail: Byte;         // 尾
//  end;
//  PCmdToDataCenter = ^TCmdToDataCenter;
//
//  //======================消息头===========================//
//  TCmdHeader = packed record
//    Flag: Word;         // 消息ID
//    Size: Word;         // 消息长度
//    DevID: array[0..4] of Byte;     // 车载终端ID
//    Version: ShortInt;      //协议版本号
//    CmdID: Word;     // 流水号
//    CmdParam: Pointer;  // 消息体
//    CRC: Word;      // CRC校验码
//  end;
//  PCmdHeader = ^ TCmdHeader;

{********************  以下是客户端到Web服务的命令结构 ************************}

//=====================终端管理类========================//
  TSendDevParam = packed record   // 设置终端参数(0x8103)消息体，终端回复通用应答
    ParamList: Pointer;   // 参数项列表 指向TParam
  end;
  PSendDevParam = ^TSendDevParam;

  TParam = packed record  // 参数项
    ID: Word;       // 参数ID
    Length: Byte;   // 参数长度
    Info: string;   // 参数值
  end;
  PParam = ^TParam;

  TSendQueryDevParam = packed record  // 查询终端参数(0x8104)消息体，无消息体，终端回复0x0104
  end;

  TSendControlDev = packed record // 终端控制(0x8105)消息体，终端回复通用应答
    // 命令参数的长度文档中没有标明，不好定义结构体
  end;

//=====================位置、报警类======================//
  TSendQueryPosition = packed record // 位置信息查询(0x8201)消息体,无消息体，终端回复0x0201
  end;

  TSendTracePosition = packed record // 位置跟踪控制(0x8202)消息体,终端回复通用应答
    Properties: Byte;   // 属性
    TimeOrDistanceInterval: Word; // 时间/距离间隔
    KeepTimeOrDistance: Word;  // 持续时间/距离
  end;
  PSendTracePosition = ^TSendTracePosition;

  {========================V3.0========================}

  THead_V3 = packed record
    SPosFlag:  Byte;//起始位标识
    Size: Word;//包大小	UINT16	整个包大小
    PackType:Byte;//包类型	BYTE	见包类型说明
    Ver:Byte;//协议版本	BYTE	默认0X00
    BizType:byte;//业务类型	BYTE	见业务类型说明，根据包类型定义
    CmdFlag: Byte;//消息ID	BYTE
    DevId: TDEV_ID_BCD_ZDCL;//终端手机号	BCD[6]
    CarNo:string[11];//车牌号	STRING[12]	保留
    CmdOrder:Integer;//消息流水号	UINT16	按发送顺序从0开始循环累加
//    Flag: Byte;
//    ExtendedFlag: Byte;
//    //FactID: Byte;--sjp  zdcl没有factId
//    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3;//integer;
//    CmdId: Word;
  end;
  PHead_V3 = ^THead_V3;

  THeadHRB_V3 = packed record
    SPosFlag:  Byte;//起始位标识
    Size: Word;//包大小	UINT16	整个包大小
    PackType:Byte;//包类型	BYTE	见包类型说明
    Ver:Byte;//协议版本	BYTE	默认0X00
    BizType:byte;//业务类型	BYTE	见业务类型说明，根据包类型定义
    CmdFlag: Byte;//消息ID	BYTE
    DevId: TDEV_ID_BCD_HRB;//终端手机号	BCD[6]
    CarNo:string[11];//车牌号	STRING[12]	保留
    CmdOrder:Integer;//消息流水号	UINT16	按发送顺序从0开始循环累加
//    Flag: Byte;
//    ExtendedFlag: Byte;
//    //FactID: Byte;--sjp  zdcl没有factId
//    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3;//integer;
//    CmdId: Word;
  end;
  PHeadHRB_V3 = ^THeadHRB_V3;

  TCMDHeart = packed record   // 心跳
    Header: THead_V3;
  end;
  PCMDHeart = ^TCMDHeart;

    {用户登录网关服务器    TERMSRV_REG_V3   }
  TCmdTermsrvRegUserData_V3 = packed record
    Header:THead_V3;
    Version: Byte;
    UserID: integer;
    Time: array[0..6] of Byte;
    //UserPass: string;
    //version: Byte;
  end;
  PCmdTermsrvRegUserData_V3 = ^TCmdTermsrvRegUserData_V3;

  //从网关注销连接
  TCmdTermsrvLogoutData_V3 = packed record
    Header:THead_V3;
    XorSum: Byte;
  end;
  PCmdTermsrvLogoutData_V3 = ^TCmdTermsrvLogoutData_V3;

  {通用应答 中心->客户端}
  TCmdSrvtermTYData_V3 = packed record
    Header:THead_V3;
    RespCmdNo: Integer;
    RespCmdId: Byte;
    Ret: Byte;
        //0：成功；
        //1：
        //2：命令取消
        //3：命令删除（超时）
        //4：重复登录
        //5：用户不合法
        //6：设备正忙
  end;
  PCmdSrvtermTYData_V3 = ^TCmdSrvtermTYData_V3;

  {通用应答 客户端->中心}
  TCmdTermSrvTYData_V3 = packed record
    Header:THead_V3;
    RespCmdNo: LongWord;//应答流水号
    RespCmdId: Byte;//应答消息ID
    Ret: Byte;//0：成功/确认；1：失败；2：消息有误
  end;
  PCmdTermSrvTYData_V3 = ^TCmdTermSrvTYData_V3;

  {获取车辆在线状态 客户端->中心}
  TCmdTermSrvGetOnLineStatData_V3 = packed record
    Header:THead_V3;
  end;
  PCmdTermSrvGetOnLineStatData_V3 = ^TCmdTermSrvGetOnLineStatData_V3;

  //定位数据信息
  TSGpsData_V3 = packed record
    WarningSign: LongWord;  // 报警标志
    State: Longword; //32位状态位
    Latitude: integer; //纬度 X 100 0000 如: 值32123456表示：32.123456度
    Longitude: integer; //经度 X 100 0000
    Altitude:word;//sjp zdcl.20110602      海拔高度，单位为米（m）
    Speed: Word; //速度　单位：公里/小时
    Orientation: Word; //方向　正北方向为0度，顺时针增加，单位：2度，数值范围0～178。
    GpsTime: array[0..5] of Byte; // GPS时间
  end;
  PSGpsData_V3 = ^TSGpsData_V3;

    {从网关取得车机定位数据 Flag= SRVTERM_GETPOSTION_V3}
  TCmdSrvTermGpsData_V3 = packed record
    Header:THead_V3;
    WarningSign: LongWord;  // 报警标志
    State: Longword; //32位状态位
    Latitude: integer; //纬度 X 100 0000 如: 值32123456表示：32.123456度
    Longitude: integer; //经度 X 100 0000
    Altitude:word;//sjp zdcl.20110602      海拔高度，单位为米（m）
    Speed: Word; //速度　单位：公里/小时
    Orientation: Word; //方向　正北方向为0度，顺时针增加，单位：2度，数值范围0～178。
    GpsTime: array[0..5] of Byte; // GPS时间
  end;
  PCmdSrvTermGpsData_V3 = ^TCmdSrvTermGpsData_V3;

  //车辆位置查询应答
  TCmdSrvTermFindPos_V3 = packed record
    Header:THead_V3;
    IsCompressed: Byte;//0：不支持，1：支持
    //位置信息 (BCD[6]+位置信息)*N
  end;
  PCmdSrvTermFindPos_V3 = ^TCmdSrvTermFindPos_V3;

  {从数据库中取历史定位数据}
  TQueryHistoryGpsData_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3;//integer;
    CmdId: Word;

    WarningSign: LongWord;  // 报警标志
    State: Longword; //32位状态位
    Latitude: Double; //纬度 X 100 0000 如: 值32123456表示：32.123456度
    Longitude: Double; //经度 X 100 0000
    Altitude:word;//sjp zdcl.20110602      海拔高度，单位为米（m）
    Speed: Word; //速度　单位：公里/小时
    Orientation: Word; //方向　正北方向为0度，顺时针增加，单位：2度，数值范围0～178。
    GpsTime: TDateTime; //array[0..6] of Byte; // GPS时间
    ServerTime: TDateTime;
  end;
  PQueryHistoryGpsData_V3 = ^TQueryHistoryGpsData_V3;

      {从网关取得服务评价数据 Flag= SRVTERM_GPSDATA_V3}
  TCmdSrvTermServeJudge_V3 = packed record
    GpsData: TCmdSrvTermGpsData_V3;
    Run_id: LongWord;
    ServeTime: array[0..5] of Byte;
    No: array[0..18] of Char;
    ServeID: LongWord;
    NotOkID: LongWord;
  end;
  PCmdSrvTermServeJudge_V3 = ^TCmdSrvTermServeJudge_V3;

  {计价器营运数据}
  TCmdSrvTermDRunData_V3 = packed record
    GpsData: TCmdSrvTermGpsData_V3;
    WarningSign: LongWord;  // 报警标志
    State: Longword; //32位状态位
    Latitude: integer; //纬度 X 100 0000 如: 值32123456表示：32.123456度
    Longitude: integer; //经度 X 100 0000
    Speed: Word; //速度　单位：公里/小时
    Orientation: Byte; //方向　正北方向为0度，顺时针增加，单位：2度，数值范围0～178。
    GpsTime: array[0..5] of Byte; // GPS时间

    Run_ID: LongWord; // 营运ID
    Server_ID: LongWord;  // 评价ID
    Server_Type: Byte;  // 评价选项
    Server_Extend: Word;  // 评价选项扩展

    Car_No: array[0..5] of Char;  // 车牌号
    OnTime: array[0..4] of Byte;  // 上车时间
    OffTime: array[0..1] of Byte; // 下车时间
    RunDistanct: array[0..2] of Byte; // 计程公里
    NoRunDistanct: array[0..1] of Byte; // 空驶公里
    Surcharge: array[0..2] of Byte; // 附加费
    WaitTime: array[0..1] of Byte;  // 等待时间
    RunJE: array[0..2] of Byte; // 交易金额
  end;
  PCmdSrvTermDRunData_V3 = ^TCmdSrvTermDRunData_V3;

  {从网关取得控制应答 Flag= SRVTERM_GPSDATA_V3}
  TCmdSrvtermControlCar_V3 = packed record
    Header:THead_V3;

    ResCmdID: Word;
    WarningSign: LongWord;  // 报警标志
    State: Longword; //32位状态位
    Latitude: integer; //纬度 X 100 0000 如: 值32123456表示：32.123456度
    Longitude: integer; //经度 X 100 0000
    Altitude :Word;
    Speed: Word; //速度　单位：公里/小时
    Orientation: Word; //方向　正北方向为0度，顺时针增加，单位：2度，数值范围0～178。
    GpsTime: array[0..5] of Byte; // GPS时间
  end;
  PCmdSrvtermControlCar_V3 = ^TCmdSrvtermControlCar_V3;

  {客户端处理时　用的GpsData_V3}
  TGpsData_V3 = packed record
    Size: Word;
    Id: TDEV_ID_BCD_ZDCL;
    WarningSign: LongWord;  // 报警标志
    State: Longword; //32位状态位
    Lat: Double; //－已有转换　纬度 eg:  32.123456
    Long: Double; //－已有转换　经度 eg: 118.123456
    Altitude:word;//sjp zdcl.20110602      海拔高度，单位为米（m）
    Speed: Word; //速度　单位：公里/小时，表示范围0～255
    Orientation: Word; //－已有转换　方向　正北方向为0度，顺时针增加，单位：度
    GpsTime: TDateTime;
  end;
  PGpsData_V3 = ^TGpsData_V3;

    {客户端处理的历史定位数据}
  THistoryGpsData_V3 = packed record
    Size: Byte;
    Id: integer;
    WarningSign: LongWord;  // 报警标志
    State: Longword; //32位状态位
    Lat: Double; //－已有转换　纬度 eg:  32.123456
    Long: Double; //－已有转换　经度 eg: 118.123456
    Altitude:word;//sjp zdcl.20110602      海拔高度，单位为米（m）
    Speed: Word; //速度　单位：公里/小时，表示范围0～255
    Orientation: Word; //－已有转换　方向　正北方向为0度，顺时针增加，单位：度
    GpsTime: TDateTime;
    ServerTime: TDateTime;
  end;
  PHistoryGpsData_V3 = ^THistoryGpsData_V3;

  {设置参数 TERMSRV_SETDEVPARAM_V3}
  TCmdTermSrvSetDevParam_V3 = packed record
    Header:THead_V3;
    ParamCnt :Byte;  //参数总数	UINT8
    ParamPackCnt:Byte;//包参数个数	UINT8
    //参数项列表:
    ParamId: Word;
    ParamSize: Byte;
    //参数值 长度不定
  end;
  PCmdTermSrvSetDevParam_V3 = ^TCmdTermSrvSetDevParam_V3;
//  {网关回复－SRVTERM_SETDEVPARAM_V2}
//  TCmdSrvTermSetDevParam_V3 = packed record
//    Size: Word;
//    Flag: Byte;
//    ExtendedFlag: Byte;
//    //FactID: Byte;--sjp  zdcl没有factId
//    DevId: TDEV_ID_BCD_ZDCL;//integer;
//    CmdId: Word;
//    Ret: integer;
//  end;
//  PCmdSrvTermSetDevParam_V3 = ^TCmdSrvTermSetDevParam_V3;
  {发送提问信息}
  TCmdTermSrvSetAnswerList_V3 = packed record
    Header:THead_V3;
    ControlCmd: Byte;
    MsgId: LongWord;  // 问题ID
    //info: string;
    // 答案列表不定长
  end;
  PCmdTermSrvSetAnswerList_V3 =^TCmdTermSrvSetAnswerList_V3;

    {提问应答}
  TCmdSrvtermReportAnswer_V3 = packed record
//    Size: Word;
//    Flag: Byte;
//    ExtendedFlag: Byte;
//    //FactID: Byte;--sjp  zdcl没有factId
//    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3;//integer;
//    CmdId: Word;
//    //ResCmdID: Word;
    Header:THead_V3;
    MsgId: LongWord;  // 问题ID
    AnswerID: Byte;  // 答案ID
  end;
  PCmdSrvtermReportAnswer_V3 = ^TCmdSrvtermReportAnswer_V3;

  {下发调度信息}
  TCmdTerSevSendTaxiBuss_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//integer;
    CmdId: Word;
    ID: LongWord;
    BussType: Byte;
    DateTime: Array[0..5] of Byte;
    Count: LongWord;
    // 车辆信息
    // 业务描述
    // 详细业务描述
    // 电话号码

  end;
  PCmdTerSevSendTaxiBuss_V3 = ^TCmdTerSevSendTaxiBuss_V3;
    {查询参数 TERMSRV_READDEVPARAM_V3}
  TCmdTermSrvReadDevParam_V3 = packed record
    Header:THead_V3;
    ParamId: Word; //参数ID
  end;
  PCmdTermSrvReadDevParam_V3 = ^TCmdTermSrvReadDevParam_V3;


  {网关回复　SRVTERM_READDEVPARAM_V3}
  TCmdSrvTermReadDevParam_V3 = packed record
    Header:THead_V3;
    ParamId: Word; //   参数ID
    ParamLen: Byte; //   参数长度
    //参数值　，长度不定
  end;
  PCmdSrvTermReadDevParam_V3 = ^TCmdSrvTermReadDevParam_V3;


  {终端控制 TERMSRV_CONTROLTERMINAL_V3}
  TCmdTermSrvControlTerminal_V3 = packed record
    Header:THead_V3;
    ControlID: Byte;  //控制命令字	BYTE
    //控制命令参数	STRING     
  end;
  PCmdTermSrvControlTerminal_V3 = ^TCmdTermSrvControlTerminal_V3;
  
  // 司机签到
  TCmdSrvTermDriverLoginIn_V3 = packed record
    GpsData: TCmdSrvTermGpsData_V3;
    //start: Word;
    //Size: Word;
    //dev_type: Byte;
    //fact_id: Byte;
    //flag: Word;
    company_id: array[0..4] of Byte;
    driver_id: array[0..5] of Byte;
    car_no: array[0..5] of Byte;
    dateTime: array[0..5] of Byte;
    MCU_State: Word;
    XZSJ: array[0..4] of Byte;
    XZCS: Byte;
    CZJG: Word;
    //finish: Word;
  end;
  PCmdSrvTermDriverLoginIn_V3 = ^TCmdSrvTermDriverLoginIn_V3;

    //司机签到新
  TCmdSrvTermDriverLoginIn_V3_9F = packed record
    Header:THead_V3;
    DriverNameLen:Byte;         //驾驶员姓名长度	UINT8
    DriverName:string;          //驾驶员姓名	STRING
    DriverIdentityCardNo:string;//驾驶员身份证编码	STRING	长度20位//
//从业资格证编码	STRING	长度40位
//发证机构名称长度	UINT8	长度M
//发证机构名称	STRING	从业资格证发证机构名称
  end;
  PCmdSrvTermDriverLoginIn_V3_9F = ^TCmdSrvTermDriverLoginIn_V3_9F;
    // 司机签退
  TCmdSrvTermDriverLoginOut_V3 = packed record
    GpsData: TCmdSrvTermGpsData_V3;
    //start: Word;
    //Size: Word;
    //dev_type: Byte;
    fact_id: Byte;
    flag: Word;
    company_id: array[0..4] of Byte;
    driver_id: array[0..5] of Byte;
    car_no: array[0..5] of Byte;
    dateTime: array[0..5] of Byte;
    MCU_State: Word;
    //finish: Word;
  end;
  PCmdSrvTermDriverLoginOut_V3 = ^TCmdSrvTermDriverLoginOut_V3;
//  {从网关取得服务评价数据 Flag= SRVTERM_SERVERJUDGE_V3}
//  TCmdSrvTermServerJudge_V3 = packed record
//    Size: Word;
//    Flag: Byte;
//    ExtendedFlag: Byte;
//    //FactID: Byte;--sjp  zdcl没有factId
//    DevId: integer;
//    CmdId: Word;
//
//    WarningSign: LongWord;  // 报警标志
//    State: Longword; //32位状态位
//    Latitude: integer; //纬度 X 100 0000 如: 值32123456表示：32.123456度
//    Longitude: integer; //经度 X 100 0000
//    Speed: Word; //速度　单位：公里/小时
//    Orientation: Byte; //方向　正北方向为0度，顺时针增加，单位：2度，数值范围0～178。
//    GpsTime: array[0..5] of Byte; // GPS时间
//
//    pjsj: array[0..5] of Byte;  // 评价时间
//    jsycyzgzs: string;  // 驾驶员从业资格证书
//    pjxx: Integer;  // 评价选项
//    bmyxx: Integer; // 不满意选项
//
//  end;
//  PCmdSrvTermServerJudge_V3 = ^TCmdSrvTermServerJudge_V3;
  //客户端->网关 拍照，拍当前照片 TERMSRV_GETAPIC= $27;
  TCmdTermSrvGetAPic_V3 = packed record
    Header:THead_V3;

    CameraIndex: Byte; //摄像头号
    CameraCmd: Word;  // 拍照命令
    PZSJJG: Word;   // 拍照时间间隔
    SaveSign: Byte; // 保存标志
    GetPicSize: Byte; //照片尺寸大小 0=320x240  1=640x480  2-else
    TXZL: Byte; // 图像质量
    LD: Byte;   // 亮度
    DBD: Byte;  // 对比度
    BHD: Byte;  // 饱和度
    SD: Byte;   // 色度
  end;
  PCmdTermSrvGetAPic_V3 = ^TCmdTermSrvGetAPic_V3;

    {设置电话本 TERMSRV_SETTELLIST}
  TCmdTermSrvSetTelList_V3 = packed record
    Header:THead_V3;
    SetType:Byte;  //设置类型	BYTE	0：删除终端上所有存储的联系人；
                   //                1：表示更新电话本；
                   //                2：表示追加电话本；
                   //                3：表示修改电话本
    SetCount:Byte; //联系人总数	BYTE
    PackCount:Byte;//包联系人个数	BYTE	当前数据包中联系人个数
                   //联系人项		电话本联系人项数据格式见表38
  end;
  PCmdTermSrvSetTelList_V3 = ^TCmdTermSrvSetTelList_V3;

  {设置事件}
  TCmdTermSrvSetEventList_V3 = packed record
    Header:THead_V3;
    SetType:Byte;   //设置类型	UINT8	0：删除终端现有所有事件，该命令后不带后继字节；
                          //1：更新事件；
                          //2：追加事件；
                          //3：修改事件；
                          //4：删除特定几项事件，之后事件项中无需带事件内容
    SetCount:Byte;  //设置总数	UINT8
    PackCount:Byte;  //包设置个数	UINT8
      //事件项列表		长度不大于499字节，否则分多条消息下发
  end;
  PCmdTermSrvSetEventList_V3 =^TCmdTermSrvSetEventList_V3;
  
  // 位置查询  TERMSRV_FINDPOSTION_V3 = $13;
  TCmdTermSrvFindPostion_V3 = packed record
    Header:THead_V3;
  end;
  PCmdTermSrvFindPostion_V3 = ^TCmdTermSrvFindPostion_V3;

  // 查询黑名单版本
  TCmdTermSrvFindBlackVer_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;
  end;
  PCmdTermSrvFindBlackVer_V3 = ^TCmdTermSrvFindBlackVer_V3;

  // 查询黑名单版本应答
  TCmdSrvTermFindBlackVer_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    Ver: array[0..2] of Byte;
  end;
  PCmdSrvTermFindBlackVer_V3 = ^TCmdSrvTermFindBlackVer_V3;

  // 出租车一卡通刷卡交易明细上传应答
  TCmdSrvTermSaveDRundata_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    Res: Byte;
  end;
  PCmdSrvTermSaveDRundata_V3 = ^TCmdSrvTermSaveDRundata_V3;

  // 车辆在线状态
  TCmdSrvTermDevOnLine_V3 = packed record
    Header:THead_V3;
    Res: Byte;  //在线状态	1	0：在线 1：离线
    //车组
  end;
  PCmdSrvTermDevOnLine_V3 = ^TCmdSrvTermDevOnLine_V3;

  // 位置追踪 TERMSRV_PURSUE_V3
  TCmdTermSrvPursue_V3 = packed record
    Header:THead_V3;
//    ShuXing: Byte;
    PursueInterval: Word;
    JianGe: LongWord;
  end;
  PCmdTermSrvPursue_V3 = ^TCmdTermSrvPursue_V3;

  {事件报告}
  TCmdSrvtermReportEvent_V3 = packed record
    Header:THead_V3;
    EventNo: Byte;  // 事件ID
  end;
  PCmdSrvtermReportEvent_V3 = ^TCmdSrvtermReportEvent_V3;

    {设置防伪标志  TERMSRV_ANTIFAKE_V3}
  TCmdSrvtermAntiFake_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;


    TypeId: Byte;
    DataType: Word;

    //Fact_ID: Byte;  // 厂商标识
    MCUFlag: array[0..1] of Byte; // MCU命令
    // 防伪标志
  end;
  PCmdSrvtermAntiFake_V3 = ^TCmdSrvtermAntiFake_V3;

  {设置防伪标志应答  TERMSRV_ANTIFAKE_V3}
  TCmdermSrvtAntiFake_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    TypeID: Byte;
    Fact_ID: Byte;
    MCU_Flag: Word;
    Res: Byte;
  end;
  PCmdermSrvtAntiFake_V3 = ^TCmdermSrvtAntiFake_V3;

  {发送回拨电话  TERMSRV_BACKCALLTEL_V3}
  TCmdSrvtermBackCallTel_V3 = packed record
    Header:THead_V3;
    Sign: Byte; // 标志
    // 电话号码 长度不定
  end;
  PCmdSrvtermBackCallTel_V3 = ^TCmdSrvtermBackCallTel_V3;

  {车辆控制  TERMSRV_CONTROLCAR_V3}
  TCmdtermSrvControlCar_V3 = packed record
    Header:THead_V3;
//    Control: Byte;
    ControlCmd: Byte;
  end;
  PCmdtermSrvControlCar_V3 = ^TCmdtermSrvControlCar_V3;

  {信息服务  TERMSRV_INFOSERVER_V3}
  TCmdSrvtermInfoServer_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//integer;
    CmdId: Word;
    Sign: Byte; // 信息类型
    // 信息类容 不定长
  end;
  PCmdSrvtermInfoServer_V3 = ^TCmdSrvtermInfoServer_V3;

  {存储图片检索 TERMSRV_QUERYPICTURE_V3}
  TCmdSrvtermQueryPicture_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;
    
    CameraIndex: Byte; //摄像头号
    Reason: Byte; // 拍照原因
    beginDateTime: array[0..5] of Byte;  // 起始时间
    endDateTime: array[0..5] of Byte;  // 结束时间
  end;
  PCmdSrvtermQueryPicture_V3 = ^TCmdSrvtermQueryPicture_V3;

  // 应答
  TCmdTermSrvQueryPicture_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;
    Count: LongWord;
    offSet: LongWord;


   { CameraIndex: Byte;
    WarningSign: LongWord;  // 报警标志
    State: Longword; //32位状态位
    Latitude: integer; //纬度 X 100 0000 如: 值32123456表示：32.123456度
    Longitude: integer; //经度 X 100 0000
    Speed: Word; //速度　单位：公里/小时
    Orientation: Byte; //方向　正北方向为0度，顺时针增加，单位：2度，数值范围0～178。
    GpsTime: array[0..5] of Byte; // GPS时间   }
  end;
  PCmdTermSrvQueryPicture_V3 = ^TCmdTermSrvQueryPicture_V3;

    {音频数据检索 TERMSRV_QUERYPICTURE_V3}
  TCmdSrvtermQueryAudio_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    Reason: Byte; // 录音原因
    beginDateTime: array[0..5] of Byte;  // 起始时间
    endDateTime: array[0..5] of Byte;  // 结束时间
  end;
  PCmdSrvtermQueryAudio_V3 = ^TCmdSrvtermQueryAudio_V3;

  // 应答
  TCmdTermSrvQueryAudio_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;
    //McuCmdId: Word;
    Count: LongWord;
    offSet: LongWord;

   { CameraIndex: Byte;
    WarningSign: LongWord;  // 报警标志
    State: Longword; //32位状态位
    Latitude: integer; //纬度 X 100 0000 如: 值32123456表示：32.123456度
    Longitude: integer; //经度 X 100 0000
    Speed: Word; //速度　单位：公里/小时
    Orientation: Byte; //方向　正北方向为0度，顺时针增加，单位：2度，数值范围0～178。
    GpsTime: array[0..5] of Byte; // GPS时间   }
  end;
  PCmdTermSrvQueryAudio_V3 = ^TCmdTermSrvQueryAudio_V3;

  TQueryPicture_V3 = packed record
    CameraIndex: Byte;
    WarningSign: LongWord;  // 报警标志
    State: Longword; //32位状态位
    Latitude: integer; //纬度 X 100 0000 如: 值32123456表示：32.123456度
    Longitude: integer; //经度 X 100 0000
    Speed: Word; //速度　单位：公里/小时
    Orientation: Byte; //方向　正北方向为0度，顺时针增加，单位：2度，数值范围0～178。
    GpsTime: array[0..5] of Byte; // GPS时间
  end;
  PQueryPicture_V3 = ^TQueryPicture_V3;

  TQueryPicture_V3_New = packed record
    //PictureType: Byte;  // 0：照片 2：音频 3：视频 其他：RFU
    PictureId: Integer;
  end;
  PQueryPicture_V3_New = ^TQueryPicture_V3_New;


  {存储图片上传 TERMSRV_UPPICTURE_V3}
  TCmdSrvtermUpPicture_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3;// integer;
    CmdId: Word;
    CameraIndex: Byte; //摄像头号
    beginDateTime: array[0..5] of Byte;  // 起始时间
    endDateTime: array[0..5] of Byte;  // 结束时间
    DeleteSign: Byte;   // 删除标志
  end;
  PCmdSrvtermUpPicture_V3 = ^TCmdSrvtermUpPicture_V3;

    {存储图片上传 TERMSRV_UPPICTURE_V3}
  TCmdSrvtermUpPicture_V3_New = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3;// integer;
    CmdId: Word;
    PictureType: Byte;
    PictureId: Integer;
  end;
  PCmdSrvtermUpPicture_V3_New = ^TCmdSrvtermUpPicture_V3_New;

    //网关告知客户端 收到车机已成功上传新的照片 SRVTERM_UPLOADPICTURE_V3
  TCmdSrvTermAPicUploaded_V3 = packed record
    Header: THead_V3;
    PicId: Integer;
    TId: Integer;//终端ID
    MediaType: Byte;//             0：图像；1：音频；2：视频
    MediaFormat: Byte;//多媒体格式编码 0：JPEG；1：TIF；2：MP3；3：WAV；4：WMV；其他保留
    EventId: Byte;//事件项编码    0：平台下发指令；1：定时动作；2：抢劫报警触发；3：碰撞侧翻报警触发；4:疲劳报警 其他保留
    ChannelId: Byte;//通道ID
    XorSum: Byte;
  end;
  PCmdSrvTermAPicUploaded_V3 = ^TCmdSrvTermAPicUploaded_V3;

  {设置顶灯夜间模式 }
  TCmdSrvtermSetNightMode_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    TypeId: Byte;
    DataType: Word;

    //Fact_ID: Byte;  // 厂商标识
    MCUFlag: array[0..1] of Byte;
    beginTime: array[0..1] of Byte;  // 起始时间
    endTime: array[0..1] of Byte;  // 结束时间

  end;
  PCmdSrvtermSetNightMode_V3 = ^TCmdSrvtermSetNightMode_V3;

    {开启顶灯夜间模式 }
  TCmdSrvtermOpenNightMode_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3;// integer;
    CmdId: Word;

    TypeId: Byte;
    DataType: Word;

    //Fact_ID: Byte;  // 厂商标识
    MCUFlag: array[0..1] of Byte;
    Res: Byte;

  end;
  PCmdSrvtermOpenNightMode_V3 = ^TCmdSrvtermOpenNightMode_V3;

  TCmdErmTSerPolling_MCU_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3;// integer;
    CmdId: Word;
  end;
  PCmdErmTSerPolling_MCU_V3 = ^TCmdErmTSerPolling_MCU_V3;

  TCmdSerTErmPolling_MCU_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3;// integer;
    CmdId: Word;

    {McuType: Byte;
    McuLength: Word;
    
    FACTType: Byte;
    MCUFlag: Word;
    State: array[0..31] of Byte;  }
  end;
  PCmdSerTErmPolling_MCU_V3 = ^TCmdSerTErmPolling_MCU_V3;

  // 客户端发往终端外设的透传包
  TCmdSrvTerm_MCU_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    TypeId: Byte;
    DataType: Word;

    //Fact_ID: Byte;  // 厂商标识
    MCU_Flag: Word; // 命令字

    // 数据区
  end;
  PCmdSrvTerm_MCU_V3 = ^TCmdSrvTerm_MCU_V3;

  {查询顶灯状态 }
  TCmdSrvtermQueryLightState_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    TypeId: Byte;
    DataType: Word;

    //Fact_ID: Byte;  // 厂商标识
    MCUFlag: array[0..1] of Byte;
    dateTime: array[0..6] of Byte;
  end;
  PCmdSrvtermQueryLightState_V3 = ^TCmdSrvtermQueryLightState_V3;

    {查询LCD状态 }
 { TCmdSrvtermQueryLCDState_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: integer;
    CmdId: Word;

    ControlCmdID: Integer;
    PackCount: Integer;
    PackID: Integer;
    ShuXing: Integer;
    MCUFlag: array[0..1] of Byte;
    dateTime: array[0..6] of Byte;
  end;
  PCmdSrvtermQueryLCDState_V3 = ^TCmdSrvtermQueryLCDState_V3;    }

    {查询led状态 }
  TCmdSrvtermQueryLEDState_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    TypeId: Byte;
    DataType: Word;

    //Fact_ID: Byte;  // 厂商标识
    MCUFlag: array[0..1] of Byte;
    dateTime: array[0..6] of Byte;
  end;
  PCmdSrvtermQueryLEDState_V3 = ^TCmdSrvtermQueryLEDState_V3;

    {透传数据 }
  TCmdSrvtermSend_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    TypeId: Byte;
    DataType: Word;

    MCUFlag: Word;

    //Buf: array of Byte


    {MCUFlag: array[0..1] of Byte;
    dateTime: array[0..6] of Byte;  }
  end;
  PCmdSrvtermSend_V3 = ^TCmdSrvtermSend_V3;

    {智能顶灯响应}
  TCmdtermSrv_MCU_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    TypeId: Byte;
    Fact_ID: Byte;

    MCUflag: array[0..1] OF Byte;
    RES: Byte;

  end;
  PCmdtermSrv_MCU_V3 = ^TCmdtermSrv_MCU_V3;

  TCmdtermSrv_QUERYMCU_V3= packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: integer;
    CmdId: Word;

    TypeId: Byte;
    Fact_ID: Byte;

    MCUflag: array[0..1] OF Byte;
    state: array[0..31] of Byte;
  end;
  PCmdtermSrv_QUERYMCU_V3 = ^TCmdtermSrv_QUERYMCU_V3;

    {LED响应}
  TCmdtermSrv_LED_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    TypeId: Byte;
    Fact_ID: Byte;

    MCUflag: array[0..1] OF Byte;
    RES: Byte;

  end;
  PCmdtermSrv_LED_V3 = ^TCmdtermSrv_LED_V3;

  TCmdtermSrv_QUERYLED_V3= packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: integer;
    CmdId: Word;

    TypeId: Byte;
    Fact_ID: Byte;

    MCUflag: array[0..1] OF Byte;
    state: array[0..31] of Byte;
  end;
  PCmdtermSrv_QUERYLED_V3 = ^TCmdtermSrv_QUERYLED_V3;

    {停止防伪 }
  TCmdSrvtermStopAntiFake_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    TypeId: Byte;
    DataType: Word;

    //Fact_ID: Byte;  // 厂商标识
    MCUFlag: array[0..1] of Byte;
  end;
  PCmdSrvtermStopAntiFake_V3 = ^TCmdSrvtermStopAntiFake_V3;

  {设置菜单信息}
  TCmdTermSrvSetInfoMenu_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//integer;
    CmdId: word;
    // 信息菜单列表不定长
  end;
  PCmdTermSrvSetInfoMenu_V3 =^TCmdTermSrvSetInfoMenu_V3;

  {设置周边信息分类菜单信息}
  TCmdTermSrvSetClassInfoMenu_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: word;
    // 信息菜单列表不定长
  end;
  PCmdTermSrvSetClassInfoMenu_V3 =^TCmdTermSrvSetClassInfoMenu_V3;

  {出租业务下发}
  TCmdTermSrvDownAOrder_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3;//integer;
    CmdId: Word;
    OrderID: integer; //订单ID ★★★客户端<->网关采用的是Integer; 网关<->车机采用Word
    OrderType: Byte; //订单类型

    OrderDateTime: TDateTime_V2; //订单日期、时间 --至少要比现在时间大　10分钟
    //下发给多少个车机 1   ＝a

    //下发车机ID列表     a*5   a个车机ID（integer）

    //订单内容         <200  ASCII码

    //订单详细内容     <200  ASCII码

    //乘客电话　             ASCII码
  end;
  PCmdTermSrvDownAOrder_V3 = ^TCmdTermSrvDownAOrder_V3;

  TCmdTermSrvCancelOrder_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    //DevType: Byte;//设备类型    BCD码       //DevId: integer;
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3;//车载终端Id  BCD码
    CmdId: Word;
    OrderID: integer; //订单ID
  end;
  PCmdTermSrvCancelOrder_V3 = ^TCmdTermSrvCancelOrder;

    {网关给客户端－订单信息已有更改，请客户端自行从数据库中更新 SRVTERM_ORDERCHANGED_V3 = $C3;}
  TCmdSrvTermOrderChanged_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;
    
    OrderID: integer;
    MCU_FACT_ID: Byte;
    MCU_DEV_ID: Integer;
    RetStat: Byte; //更改内容--用订单状态
  end;
  PCmdSrvTermOrderChanged_V3 = ^TCmdSrvTermOrderChanged_V3;

  TCmdSrvTermCancelOrder_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    //DevType: Byte;
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //array[0..2] of Byte;
    CmdId: Word;

    OrderId: Integer;
    ReasonId: Byte;
  end;
  PCmdSrvTermCancelOrder_V3 = ^TCmdSrvTermCancelOrder_V3;

  TCmdSrvTermOrderDone_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    //DevType: Byte;
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //array[0..2] of Byte;
    CmdId: Word;

    OrderId: Integer;
  end;
  PCmdSrvTermOrderDone_V3 = ^TCmdSrvTermOrderDone_V3;

  //TERMSRV_SETCIRCLEAREA_V3 =$1c  //设置车机的电子围栏 (圆形)
  TCmdTermSrvSetCircleArea_V3 = packed record
    Header:THead_V3;
    SetType: Byte;  //设置属性	BYTE	0：更新区域；
                    //                1：追加区域；
                    //                2：修改区域
    SetCount : Byte;//区域总数	BYTE
    PackCount :Byte;//包区域数	BYTE	当前数据包中区域个数
     //区域项		圆形区域的区域项内容数据格式见表43
//  end;
//
//  TRecordAreaCircle = packed record
    AreaID: LongWord;               //先一次下发一个圆形区域
    AreaAlarmKind: Word;
    Latitude: LongWord;
    Longitude: LongWord;
    Radio: LongWord;
//    BeginDateTime: array[0..5] of Byte;
//    endDateTime: array[0..5] of Byte;
//    MaxSpeed: Word;
//    ContinueTime: Byte;
  end;
  PCmdTermSrvSetCircleArea_V3 = ^TCmdTermSrvSetCircleArea_V3;


  //SRVTERM_SETRECTANGLEAREA_V3 =$1E   //设置车机的电子围栏  (矩形)
  TCmdTermSrvSetRectangleArea_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//integer;
    CmdId: Word;

    AreaCount: Byte;
    AreaID: LongWord;
    AreaAlarmKind: Word;
    LeftLatitude: LongWord;
    LeftLongitude: LongWord;
    RightLatitude: LongWord;
    RightLongitude: LongWord;
   { beginDateTime: array[0..5] of Byte;
    endDateTime: array[0..5] of Byte;
    MaxSpeed: Word;
    ContinueTime: Byte;  }

  end;
  PCmdTermSrvSetRectangleArea_V3 = ^TCmdTermSrvSetRectangleArea_V3;

  //SRVTERM_SETNOSYMBOLAREA_V3 =$20   //设置车机的电子围栏  (不规则图形)
  TCmdTermSrvSetNoSymbolArea_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//integer;
    CmdId: Word;

    AreaID: LongWord;
    AreaAlarmKind: Word;

   { beginDateTime: array[0..5] of Byte;
    endDateTime: array[0..5] of Byte;
    MaxSpeed: Word;
    ContinueTime: Byte;
    // 区域总顶点数
    // 本消息中顶点数
    // 顶点项}

  end;
  PCmdTermSrvSetNoSymbolArea_V3 = ^TCmdTermSrvSetNoSymbolArea_V3;

     //TCLIENT_CANCELCIRCLEAREA_V3=$1D  //取消指定的圆形区域（命令ID：4d）
  TCmdTermSrvCancelArea_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//integer;
    CmdId: Word;

    count: Byte;  //区域数
  end;
  PCmdTermSrvCancelArea_V3 = ^TCmdTermSrvCancelArea_V3;

       //SRVTERM_SENDVIDEW_V3 =$32   //发送视频文件
  TCmdTermSrvSendVideo_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//integer;
    CmdId: Word;

   // 视频文件

  end;
  PCmdTermSrvSendVideo_V3 = ^TCmdTermSrvSendVideo_V3;

    {解除报警 TERMSRV_REMOVEALARM_V3}
  TCmdTermSrvRemoveAlarm_V3 = packed record
    Header:THead_V3;
  end;
  PCmdTermSrvRemoveAlarm_V3 = ^TCmdTermSrvRemoveAlarm_V3;

      {确认预警 TERMSRV_CONFIRMEARLYWARNING_V3}
  TCmdTermSrvConfirmEarlyWarning_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3;
    CmdId: Word;
  end;
  PCmdTermSrvConfirmEarlyWarning_V3 = ^TCmdTermSrvConfirmEarlyWarning_V3;

    {回复MCU的出厂初始值 TERMSRVINITIALIZEMCU_V3}
  TCmdtermSrvInitializeMCU_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//integer;
    CmdId: Word;
  end;
  PCmdtermSrvInitializeMCU_V3 = ^TCmdtermSrvInitializeMCU_V3;

      {远程控制MCU复位 TRRMSERVCONTROLMCU_V3}
  TCmdtermSrvControlMCU_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//integer;
    CmdId: Word;
  end;
  PCmdtermSrvControlMCU_V3 = ^TCmdtermSrvControlMCU_V3;

  {查询LCD状态}
  TCmdtermSrvQueryLCDState_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    TypeId: Byte;
    DataType: Word;

    //Fact_ID: Byte;  // 厂商标识
    MCUFlag: word;//array[0..1] of Byte;
    dateTime: array[0..6] of Byte;
  end;
  PCmdtermSrvQueryLCDState_V3 = ^TCmdtermSrvQueryLCDState_V3;

  {复位LCD}
  TCmdTermSrvResetLCD_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3;//integer;
    CmdId: Word;

    TypeId: Byte;
    DataType: Word;

    //Fact_ID: Byte;  // 厂商标识
    MCUFlag: word;//array[0..1] of Byte;
  end;
  PCmdTermSrvResetLCD_V3 = ^TCmdTermSrvResetLCD_V3;

  {开启/关闭LCD}
  TCmdTermSrvOpenLCD_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    TypeId: Byte;
    DataType: Word;

    //Fact_ID: Byte;  // 厂商标识
    MCUFlag: word;//array[0..1] of Byte;
    Res: Byte;
  end;
  PCmdTermSrvOpenLCD_V3 = ^TCmdTermSrvOpenLCD_V3;

  {显示指定的广告信息}
  TCmdTermSrvViewAdInfo_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId:TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3;//integer;
    CmdId: Word;

    TypeId: Byte;
    DataType: Word;

    //Fact_ID: Byte;  // 厂商标识
    MCUFlag: Word;
    // 广告信息
  end;
  PCmdTermSrvViewAdInfo_V3 = ^TCmdTermSrvViewAdInfo_V3;

  {下载指定的广告信息}
  TCmdTermSrvDownLoadAdInfo_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3;//integer;
    CmdId: Word;

    TypeId: Byte;
    DataType: Word;

    //Fact_ID: Byte;  // 厂商标识
    MCUFlag: Word;
    // 广告信息
  end;
  PCmdTermSrvDownLoadAdInfo_V3 = ^TCmdTermSrvDownLoadAdInfo_V3;

  {查询当前正在播放的广告信息}
  TCmdTermSrvQueryAdInfo_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3;//integer;
    CmdId: Word;

    TypeID: Byte;
    DataType: Word;

    //Fact_ID: Byte;
    MCUFlag: Word;
  end;
  PCmdTermSrvQueryAdInfo_V3 = ^TCmdTermSrvQueryAdInfo_V3;

    {查询LCD内的广告信息}
  TCmdTermSrvQueryAllAdInfo_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3;//integer;
    CmdId: Word;

    TypeID: Byte;
    DataType: Word;

    //Fact_ID: Byte;
    MCUFlag: Word;
  end;
  PCmdTermSrvQueryAllAdInfo_V3 = ^TCmdTermSrvQueryAllAdInfo_V3;

      {删除指定的的广告信息}
  TCmdTermSrvDeleteAdInfo_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3;//integer;
    CmdId: Word;

    TypeID: Byte;
    DataType: Word;

    //MCU//FactID: Byte;--sjp  zdcl没有factId
    MCUFlag: Word;
    // 广告信息不定长
  end;
  PCmdTermSrvDeleteAdInfo_V3 = ^TCmdTermSrvDeleteAdInfo_V3;

        {删除所有的的广告信息}
  TCmdTermSrvDeleteAllAdInfo_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3;//integer;
    CmdId: Word;

    TypeId: Byte;
    DataType: Word;

    //Fact_ID: Byte;  // 厂商标识
    MCUFlag: Word;
  end;
  PCmdTermSrvDeleteAllAdInfo_V3 = ^TCmdTermSrvDeleteAllAdInfo_V3;

      {LCD响应}
  TCmdSrvTerm_LCD_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    TypeId: Byte;
    Fact_ID: Byte;

    MCUflag: Word; //array[0..1] OF Byte;
    //RES: Byte;
    // 数据区

  end;
  PCmdSrvTerm_LCD_V3 = ^TCmdSrvTerm_LCD_V3;

  {LCD响应}
  TCmdSrvTerm_QUERYLCD_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//integer;
    CmdId: Word;

    MCUFactID: Byte;//--sjp  zdcl没有factId
    MCUflag: word;//array[0..1] OF Byte;
    // 数据区
  end;
  PCmdSrvTerm_QUERYLCD_V3 = ^TCmdSrvTerm_QUERYLCD_V3;

  // 计价器参数
  TMeterParam_V3 = packed record
    CSQYSJ: array[0..4] of Byte;        // 参数启用时间
    BTWFDJ: array[0..1] of Byte;        // 白天往返单价
    YJWFDJ: array[0..1] of Byte;        // 夜间往返单价
    BTDCDJ: array[0..1] of Byte;        // 白天单程单价
    YJDCDJ: array[0..1] of Byte;        // 夜间单程单价
    BTECKTDJ: array[0..1] of Byte;      // 白天二次空贴单价
    YJECKTDJ: array[0..1] of Byte;      // 夜间二次空贴单价
    BTQBJ: array[0..1] of Byte;         // 白天起步价
    YJQBJ: array[0..1] of Byte;         // 夜间起步价
    XCGLS: array[0..1] of Byte;         // 续程公里数
    QCGL: array[0..1] of Byte;          // 启程公里
    DCGL: array[0..1] of Byte;          // 单程公里
    ECKTGL: array[0..1] of Byte;        // 二次空贴公里
    BTDHSJDJ: array[0..1] of Byte;      // 白天等候时间单价
    YJDHSJDJ: array[0..1] of Byte;      // 夜间等候时间单价
    MFDHSJ: array[0..1] of Byte;        // 免费等候时间
    JJSJ: array[0..1] of Byte;          // 加价时间
    YJKSSJ: array[0..1] of Byte;        // 夜间开始时间
    YJJSSJ: array[0..1] of Byte;        // 夜间结束时间
    FJF: array[0..1] of Byte;           // 附加费

    RFU: array[0..20] of Byte;          // RFU
    //----------厂家自定义参数(南京通用自定义)
    DTSJQLKSSJ: array[0..1] of Byte;     // 当天数据清零开始时间
    QXMDLC: array[0..1] of Byte;         // 取消免等里程
    QHSD: array[0..1] of Byte;           // 切换速度
    CCSJ: array[0..1] of Byte;           // 冲程时间
    CDSJ: array[0..1] of Byte;           // 冲抵里程

    byte74: Byte;                        // 打印向下的打印偏移量，如果为FF则表示不打印

    byte75: Byte;                        // 高半字节为0 表示冲程、高半字节为1 表示不冲程；
                                         // 低半字节为0 表示自动等候、低半字节为1 表示手动等候；

    byte76: Byte;                        // 高半字节为0 表示自动单程、高半字节为1 表示手动单程；
                                         // 低半字节为0 表示自动打印、低半字节为1 表示手动打印；

    byte77: Byte;                        // 传感器极数（1-15）

    byte78: Byte;                        // 高半字节为0 表示开通一卡通功能、高半字节为1 表示关闭该功能；
                                         // 低半字节为0 表示开通GPS功能、低半字节为1 表示关闭该工能；

    byte79: Byte;                        // 高半字节为0 表示营运数据到最大客次时覆盖历史数据、高半字节为1 表示营运数据到最大客次时停止营运；
                                         // 低半字节为0x01 表示显示四舍五入到分、
                                         // 低半字节为0x02 表示显示四舍五入到角、
                                         // 低半字节为0x04 表示显示四舍五入到元、
                                         // 低半字节为0x08 表示显示四舍五入为四舍六入五奇进（以上种四舍五入方式可能同时存在）

    byte80: Byte;                        // 10H 免等倒计时、上出纸、四屏显示、PFC8583时钟芯片；
                                         // 11H 免等倒计时、上出纸、四屏显示、PFC8563时钟芯片；
                                         // 12H 免等倒计时、上出纸、五屏显示、PFC8583时钟芯片；
                                         // 13H 免等倒计时、上出纸、五屏显示、PFC8563时钟芯片；
                                         // 14H 免等倒计时、前出纸、四屏显示、PFC8583时钟芯片；
                                         // 15H 免等倒计时、前出纸、四屏显示、PFC8563时钟芯片；
                                         // 16H 免等倒计时、前出纸、五屏显示、PFC8583时钟芯片；
                                         // 17H 免等倒计时、前出纸、五屏显示、PFC8563时钟芯片；
                                         // 18H 免等正计时、上出纸、四屏显示、PFC8583时钟芯片；
                                         // 19H 免等正计时、上出纸、四屏显示、PFC8563时钟芯片；
                                         // 1AH 免等正计时、上出纸、五屏显示、PFC8583时钟芯片；
                                         // 1BH 免等正计时、上出纸、五屏显示、PFC8563时钟芯片；
                                         // 1CH 免等正计时、前出纸、四屏显示、PFC8583时钟芯片；
                                         // 1DH 免等正计时、前出纸、四屏显示、PFC8563时钟芯片；
                                         // 1EH 免等正计时、前出纸、五屏显示、PFC8583时钟芯片；
                                         // 1FH 免等正计时、前出纸、五屏显示、PFC8563时钟芯片；
  RFU2: array[0..44] of Byte;            // 保留
  CRC: Word;              // CRC校验值（高字节在前，低字节在后）
  //----------厂家自定义参数(南京通用自定义)
  end;
  PMeterParam_V3 = ^TMeterParam_V3;

  // 设置计价器参数
  TCmdTermSrvMeterParam_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    TypeID: Byte;
    DataType: Word;

    MCUflag: Word; //array[0..1] OF Byte;
    // 参数
    MeterParam: TMeterParam_V3;
  end;
  PCmdTermSrvMeterParam_V3 = ^TCmdTermSrvMeterParam_V3;

  // 设置计价器参数
  TCmdTermSrvMeterParam_V3_NJTY = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    TypeID: Byte;
    DataType: Word;

    MCUflag: Word; //array[0..1] OF Byte;
    // 参数
    MeterParam: array[0..127] of byte;
  end;
  PCmdTermSrvMeterParam_V3_NJTY = ^TCmdTermSrvMeterParam_V3_NJTY;

  // 读取计价器参数
  TCmdTermSrvReadMeterParam_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    TypeID: Byte;
    DataType: Word;

    MCUflag: Word; //array[0..1] OF Byte;
  end;
  PCmdTermSrvReadMeterParam_V3 = ^TCmdTermSrvReadMeterParam_V3;

    // 读取计价器参数 应答
  TCmdSrvTermReadMeterParam_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    TypeID: Byte;
    Fact_Id: Byte; //DataType: Word;

    MCUflag: Word; //array[0..1] OF Byte;
  end;
  PCmdSrvTermReadMeterParam_V3 = ^TCmdSrvTermReadMeterParam_V3;

  {计价器状态}
  TCmdtermSrvQueryMeterState_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    TypeId: Byte;
    DataType: Word;

    //Fact_ID: Byte;  // 厂商标识
    MCUFlag: word;//array[0..1] of Byte;
    dateTime: array[0..6] of Byte;
  end;
  PCmdtermSrvQueryMeterState_V3 = ^TCmdtermSrvQueryMeterState_V3;

    {TSM状态}
  TCmdtermSrvQueryTSMState_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    TypeId: Byte;
    DataType: Word;

    //Fact_ID: Byte;  // 厂商标识
    MCUFlag: word;//array[0..1] of Byte;
    dateTime: array[0..6] of Byte;
  end;
  PCmdtermSrvQueryTSMState_V3 = ^TCmdtermSrvQueryTSMState_V3;

    // TSM应答
  TCmdTermSrv_TSM_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    TypeID: Byte;
    Fact_ID: Byte;//DataType: Word;

    MCUflag: Word; //array[0..1] OF Byte;
  end;
  PCmdTermSrv_TSM_V3 = ^TCmdTermSrv_TSM_V3;

    {升级车机固件程序 TERMSRV_UPDATEDEVFIRMWARE}
  TCmdTermSrvUpdateDevFirmware_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;
    
    UpdateType: Byte; //升级设备类型－－0：表示升级主机1：表示升级调度屏
    //URL地址 不定长＜200Byte
  end;
  PCmdTermSrvUpdateDevFirmware_V3 = ^TCmdTermSrvUpdateDevFirmware_V3;

//=====================信息类============================//
  TSendTextInfo = packed record  // 文本信息下发(0x8300)消息体，终端回复通用应答
    Sign: Byte;       // 标志
    TextInfo: string; // 文本信息
  end;
  PSendTextInfo = ^TSendTextInfo;

  TSendSetEvent = packed record // 事件设置(0x8301)消息体, 终端回复通用应答
    Count: Byte;      // 事件项个数，0表示删除终端现有事件
    EventList: Pointer; // 事件项列表，指向TEvent
  end;
  PSendSetEvent = ^TSendSetEvent;

  TEvent = packed record   // 事件项
    ID: Byte;       // 若终端已有同ID的事件，则被覆盖
    Info: string;   // 时间内容
  end;
  PEvent = ^TEvent;

  TSendQuestion = packed record // 提问下发(0x8302)消息体，终端回复通用应答
    Sign: Byte;       // 标志
    Question: string; // 问题
    AnswerList: Pointer;  // 候选问题列表，指向TAnswer 需保证消息体长度不大于500字节
  end;
  PSendQuestion = ^TSendQuestion;

  TAnswer = packed record
    ID: Byte;   //答案ID
    Info: string; // 答案内容 最长为20字节
  end;

//======================电话类===========================//
  TSendTelNO = packed record  // 电话回拨(0x8400)消息体，终端回复通用应答
    Sign: Byte;     // 标志
    TelNO: string;  // 电话号码， 最长为20个字节
  end;
  PSendTelNO = ^TSendTelNO;

  TSendSetTelList = packed record   // 设置电话本(0x8401)消息体，终端回复通用应答
    Count: Byte;    // 本条消息中联系人总数，0表示删除终端上所有存储的联系人
    TelList: Pointer;   // 联系人项
  end;
  PSendSetTelList = ^TSendSetTelList;

  TTelList = packed record   // 联系人项
    Sign: Byte;   // 标志
    TelNO: string;  // 电话号码
    LinkMan: string;  // 联系人
  end;
  PTelList = ^TTelList;

//======================车辆控制类=======================//
  TSendControlCar = packed record   // 车辆控制(0x8500)消息体,终端先回复通用应答，在回复0x0500应答
    Option: Byte; // 控制项
    Command: Byte;  // 控制命令
  end;
  PSendControlCar = ^TSendControlCar;

//======================车辆管理类=======================//
  TSendSetAlarmCircle = packed record   // 设置圆形区域(0x8600)消息体
    Num: Byte;    // 区域数
  end;
  PSendSetAlarmCircle = ^TSendSetAlarmCircle;

  TCircleOptions = packed record    // 圆形区域的区域项
    ID: Integer;          // 区域ID
    Properties: Word;     // 区域属性
    Latitude: Integer;    // 纬度
    Longitude: Integer;   // 经度
    Radius: Integer;      // 半径
    BeginTime: array[0..5] of Byte; // 起始时间
    EndTime: array[0..5] of Byte;   // 结束时间
    MaxSpeed: Word;       // 最高速度
    OverspeedKeepTime: Byte;  // 超速持续时间
  end;
  PCircleOptions = ^TCircleOptions;

  TSendDeleteAlarmCircle = packed record  // 删除圆形区域(0x8601)消息体
    Num: Byte;        // 区域数，本条消息中包含的区域数，不超过125，多于125用多条消息，0为删除所有圆形区域
  end;
  PSendDeleteAlarmCircle = ^TSendDeleteAlarmCircle;

  TSendSetAlarmRectangle = packed record  // 设置矩形区域(0x8602)消息体
    Num: Byte;    // 区域数
  end;
  PSendSetAlarmRectangle = ^TSendSetAlarmRectangle;

  TRectangleOptions = packed record   // 矩形区域的区域项
    ID: Integer;          // 区域ID
    Properties: Word;     // 区域属性
    LeftUpLatitude: Integer;    // 左上纬度
    LeftUpLongitude: Integer;   // 左上经度
    RightDownLatitude: Integer;    // 右下纬度
    RightDownLongitude: Integer;   // 右下经度
    BeginTime: array[0..5] of Byte; // 起始时间
    EndTime: array[0..5] of Byte;   // 结束时间
    MaxSpeed: Word;       // 最高速度
    OverspeedKeepTime: Byte;  // 超速持续时间
  end;
  PRectangleOptions = ^TRectangleOptions;

  TSendDeleteAlarmRectangle = packed record  // 删除矩形区域(0x8603)消息体
    Num: Byte;        // 区域数，本条消息中包含的区域数，不超过125，多于125用多条消息，0为删除所有圆形区域
  end;
  PSendDeleteAlarmRectangle = ^TSendDeleteAlarmRectangle;

  TSendSetAlarmNoSybol = packed record  // 设置多边形区域(0x8604)消息体
    ID: Integer;          // 区域ID
    Properties: Word;     // 区域属性
    BeginTime: array[0..5] of Byte; // 起始时间
    EndTime: array[0..5] of Byte;   // 结束时间
    MaxSpeed: Word;       // 最高速度
    OverspeedKeepTime: Byte;  // 超速持续时间
    AreaAllVertexNum: Word;   // 区域总顶点数
    ThisInfoVertexNum: Byte;  // 本消息中顶点数,需保证消息体长度不超过500
  end;
  PSendSetAlarmNoSybol = ^TSendSetAlarmNoSybol;

  TVertexOptions = packed record // 顶点项
    VertexLatitude: Integer;    // 顶点纬度
    VertexLongitude: Integer;   // 顶点经度
  end;
  PVertexOptions = ^TVertexOptions;

  TSendDeleteAlarmNoSybol = packed record   // 删除多边形区域(0x8605)消息体
    Num: Byte;    // 区域数，本条消息中包含的区域数，不超过125，多于125用多条消息，0为删除所有矩形区域
  end;
  PSendDeleteAlarmNoSybol = ^TSendDeleteAlarmNoSybol;

  TSendSetRunWay = packed record

  end;

{**********************  以下是Web服务到客户端的命令结构 **********************}

{*****************  以下是网关服务器和客户端之间的命令结构 ********************}

  {终端向服务器发送的确认数据通讯协议命令
    @TABB
    @H(标识 |类型    |含义|参见)
    @R( size| Word   |数据包的长度=sizeof(TCmdTermsrvRegverData) | | )
    @R( Flag| Byte   |=TERMSRV_REG| )     //是不是应该用　TERMSRV_COMMVER  --shajp？
    @R( MajorVer|Byte|数据协议主版本 | )
    @R( MinorVer|Byte|数据协议次版本 | )
    @TABE
    数据协议格式说明:<br>
    [包长度2Byte][标志1Byt][包内容]<br>
    包长度=整个数据包的长度
  }
  TCmdTermsrvRegverData = packed record
    Size: Word;
    Flag: Byte;
    case integer of
      0: (MinorVer, MajorVer: Byte);
      1: (Ver: Word);
  end;
  PCmdTermsrvRegverData = ^TCmdTermsrvRegverData;
  {@link(TCmdTermsrvRegverData)命令的回复}
  TCmdSrvtermRegverData = packed record
    Size: Word;
    Flag: Byte;
    Ret: integer;
  end;
  PCmdSrvtermRegverData = ^TCmdSrvtermRegverData;

  {用户登录网关服务器
   @TABB
   @H(标识  |类型    |含义|参见)
   @R( UserID  |integer| 用户ID)
   @R( UserPass|stirng | 用户密码)
   @TABE
  }
  TCmdTermsrvRegUserData = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: integer;
    CmdId: integer;

    UserID: integer;
    UserPass: string[20];
    version: Byte;
  end;
  PCmdTermsrvRegUserData = ^TCmdTermsrvRegUserData;
  {用户登录命令的返回@link(TCmdTermsrvRegUserData)}
  TCmdSrvtermRegUserData = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: integer;
    CmdId: integer;
    UserId: Integer;
    Ret: Byte;
  end;
  PCmdSrvtermRegUserData = ^TCmdSrvtermRegUserData;

  {终端向网关服务器请求获取设备的最后一条位置（有效的）状态数据
  @TABB
  @H(标识  | 类型    |含义                  |参见)
  @R( size | Word    |数据包的长度=sizeof() | | )
  @R( Flag | Byte    |=| )
  @R( CmdId| | )
  @R( DevId| | )
  @TABE}
  TCmdTermsrvGetlastPosData = packed record
    Size: Word;
    Flag: Byte;
    CmdId, DevId: integer;
  end;
  PCmdTermsrvGetlastPosData = ^TCmdTermsrvGetlastPosData;

  {获取移动目标的最后一条位置状态数据命令执行的返回结果
    @TABB
    @H(标识  | 类型  |含义         |参见)
    @R( Size | Word  | 数据包的长度| )
    @R( Flag | Byte  | 命令的标志  | )
    @R( CmdId|Integer| 命令ID      | )
    @R( Ret  |Integer| 返回值      | )
    @TABE
  }
  TCmdSrvtermGetlastPosData = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: integer;
  end;
  PCmdSrvtermGetlastPosData = ^TCmdSrvtermGetlastPosData;

  {获取GPS设备状态}
  TCmdTermsrvGetstatData = packed record
    Size: Word;
    Flag: Byte;
    CmdId, DevId: integer;
  end;
  PCmdTermsrvGetstatData = ^TCmdTermsrvGetstatData;
  TCmdSrvEmptyWord = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    nextType:byte;
    wordtype: Byte;
    wordEdit:byte;
  end;
  PCmdSrvEmptyWord = ^TCmdSrvEmptyWord;
  {获取GPS设备状态的返回值}
  TCmdSrvtermGetstatData = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: integer;
    case integer of
      0: ();
      1: (
        MajorVer: Byte;
        MinorVer: Byte;
        Freq: Word;
        AutoSend: Byte;
         //BatteryVoltage: Word;
         //Batterytemperature: Word;
        HaveMoreInfo: Byte);
  end;
  PCmdSrvtermGetstatData = ^TCmdSrvtermGetstatData;

  {接受GPS设备的定位数据}
  TCmdSrvtermGpsdata = packed record
    Size: Word;
    Flag: Byte;
    DevId: integer;
    Long: integer;
    Lat: integer;
    GpsTime: array[0..5] of Byte;
    Altitude: Word;
    Speed: Word;
    Angle: Word;
    Stat: Byte;
    Switch: Byte;
  end;
  PCmdSrvtermGpsdata = ^TCmdSrvtermGpsdata;

  {解析后的GPS数据}
  TGpsData = packed record
    Size: Byte;
    Id: integer;
    Long: Double;
    Lat: Double;
    GpsTime: TDateTime;
    Speed: integer;
    Altitude: integer;
    Angle: integer;
    IO: Word; //低8位表示接头,高8位表示设备状态
    //高8位的0位表示定位状态,1位表示GPRS在线状态
  end;
  PGpsData = ^TGpsData;

  {呼叫车机命令
    @TABB
    @H(标识      |类型   |  含义                      |参见)
    @R( Size     | Word  |=sizeof(TCmdTermsrvCalldev) | )
    @R( Flag     | Byte  |=TERMSRV_CALLDEV            | )
    @R( CmdId    |Integer|命令ID                      | )
    @R( DevId |Integer|要呼叫的移动目标ID          | )
    @R( Freq     | Word  |呼叫后发送数据的频率        | )
    @R( HoldTime | Word  | 呼叫持续的时间             | )
    @R( AvailTime| Byte  |这条命令在命令列表中的有效期(分钟)，超过有效期任没有被执行就取消| )
    @TABE
  }
  TCmdTermsrvCalldev = packed record
    Size: Word;
    Flag: Byte;
    CmdId, DevId: integer;
    Freq, HoldTime: Word;
    AvailTime: Byte;
  end;
  PCmdTermsrvCalldev = ^TCmdTermsrvCalldev;

  TCmdSrvtermCalldev = packed record
    Size: Word;
    Flag: Byte;
    CmdId, DevId, Ret: integer;
    Freq, HoldTime: Word;
  end;
  PCmdSrvtermCalldev = ^TCmdSrvtermCalldev;

  {反控命令
    @TABB
    @H(标识       | 类型  |含义                   |参见)
    @R( Size      |Word   |数据包长度             | )
    @R( Flag      |Byte   |命令标志               | )
    @R( CmdID     |integer|命令编号               | )
    @R( DevId  |integer|目标ID                 | )
    @R( SwitchId  | Byte  | 继电器ID              | )
    @R( SwitchStat| Stat  | 继电器状态＝0断开，＝1吸合| )
    @TABE
  }
  TCmdTermsrvSwitchCtrlData = packed record
    Size: Word;
    Flag: Byte;
    CmdId, DevId: integer;
    SwitchId, SwitchStat: Byte;
  end;
  PCmdTermsrvSwitchCtrlData = ^TCmdTermsrvSwitchCtrlData;

  TCmdSrvtermSwitchCtrlData = packed record
    Size: Word;
    Flag: Byte;
    CmdId, DevId, Ret: integer;
    SwitchId, SwitchStat: Byte;
  end;
  PCmdSrvtermSwitchCtrlData = ^TCmdSrvtermSwitchCtrlData;

 {
  TERMSRV_SENDDEVMSG  = $08;
  SRVTERM_SENDDEVMSG  = $88;
  发送简短消息到设备}
  TCmdTermSrvDevMsgHeader = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    MsgID: Word;
    MsgType: Byte
    //MsgContent:TBytes;
  end;
  PCmdTermSrvDevMsgHeader = ^TCmdTermSrvDevMsgHeader;

  {服务器响应客户端发送的命令"发送简短消息到设备"}
  TCmdSrvTermDevMsg = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    MsgID: Word;
    Ret: integer;
  end;
  PCmdSrvTermDevMsg = ^TCmdSrvTermDevMsg;


  {客户端PING服务器}
  TCmdTermsrvPingData = packed record
    Size: Word;
    Flag: Byte; //TERMSRV_PING
    CmdId, TimeStamp: Longword;
  end;
  PCmdTermsrvPingData = ^TCmdTermsrvPingData;
  {服务器对PING的响应}
  TCmdSrvterPingData = packed record
    Size: Word;
    Flag: Byte; //SRVTERM_PING
    CmdId, TimeStamp: Longword;
  end;
  PCmdSrvterPingData = ^TCmdSrvterPingData;

  {服务器有数据更新的通知，
  通知客户端要刷新指定的设备的信息}
  TSrvtermNotifystat = packed record
    Size: Word;
    Flag: Byte;
    DevId: integer;
    ChangeFlag: Byte;
  end;
  PSrvtermNOtifystat = ^TSrvtermNotifystat;

  {  取消正在执行的命令
     @TABB
     @H(标识|  类型   |含义                             |参见)
     @R( Size| Word   |=sizeof(TCmdTermsrvCancelCmdData)|  )
     @R( Flag| Byte   |=TERMSRV_CANCELCMD               | )
     @R( CmdID|integer| 这条命令的ID                    | )
     @R( CmdTobeCancel| integer| 要取消的命令ID         | )
     @TABE
  }
  TCmdTermsrvCancelCmd = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    CmdTobeCancel: integer;
  end;
  PCmdTermsrvCancelCmd = ^TCmdTermsrvCancelCmd;

  {  取消正在执行的命令的服务器处理结果响应
     @TABB
     @H(标识|  类型   |含义                             |参见)
     @R( Size| Word   |=sizeof(TCmdSrvTermCancelCmdData)|  )
     @R( Flag| Byte   |=SRVTERM_CANCELCMD               | )
     @R( CmdID|integer| 这条命令的ID                    | )
     @R( CmdTobeCancel| integer| 要取消的命令ID         | )
     @R( Ret | integer| 处理结果的返回值                | )
     @TABE
  }
  TCmdSrvTermCancelCmd = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    CmdTobeCancel: integer;
    Ret: integer;
  end;
  PCmdSrvTermCancelCmd = ^TCmdSrvTermCancelCmd;

 {   发送数据至DTE
     @TABB
     @H(标识|  类型   |含义                             |参见)
     @R( Size| Word   |=sizeof(TCmdSrvTermCancelCmdData)|  )
     @R( Flag| Byte   |=SRVTERM_CANCELCMD               | )
     @R( CmdID|integer| 这条命令的ID                    | )
     @R( CmdTobeCancel| integer| 要取消的命令ID         | )
     @R( Ret | integer| 处理结果的返回值                | )
     @TABE
  }
  TCmdTermSrvSendToDTEHeader = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    DataLen: Byte;
  end;
  PCmdTermSrvSendToDTEHeader = ^TCmdTermSrvSendToDTEHeader;

  {服务器给出的响应命令}
  TCmdSrvTermSendToDTE = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: integer;
  end;
  PCmdSrvTermSendToDTE = ^TCmdSrvTermSendToDTE;

  {SRVTERM_DEVTOHOST,收到Dev发送到Host的数据}
  TCmdSrvTermRecvFromDTEHeader = TCmdTermSrvSendToDTEHeader;
  PCmdSrvTermRecvFromDTEHeader = ^TCmdSrvTermRecvFromDTEHeader;

  {接受服务器发送的通知消息
  CmdFlag	1Byte	SRVTERM_SENDMSG
  Msg	1Byte
  Data	Bytes[DataLen]
  }
  TCmdSrvTermSendMsg = packed record
    Size: Word;
    Flag: Byte;
    MsgLen: Byte;
  end;
  PCmdSrvTermSendMsg = ^TCmdSrvTermSendMsg;

  {命令被删除后通知客户端}
  TCmdSrvTermCmdDeleted = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer; //被删除的命令ID
    DelType: Byte; //被删除的原因类型 1-删除，2-被替代 3-超时
  end;
  PCmdSrvTermCmdDeleted = ^TCmdSrvTermCmdDeleted;

  {
  客户端发送命令读取设备的参数，
  TERMSRV_READDEVPARAM
  }
  TcmdTermSrvReadDevParam = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    ReadNum: Byte; // add by sha 2004-10-27
  end;
  PCmdTermSrvReadDevParam = ^TcmdTermSrvReadDevParam;

{返回的设备的参数数据包头 具体参数表现为([参数编号][参数值])
  SRVTERM_SETDEVPARAM}
  TCmdSrvTermReadDevParamRet = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: integer;
    //params
  end;
  PCmdSrvTermReadDevParamRet = ^TCmdSrvTermReadDevParamRet;

  {设置设备的参数@link(TCmdSrvTermReadDevParam)}
  TCmdTermSrvSetDevParam = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    //params
  end;
  PCmdTermSrvSetDevParam = ^TCmdTermSrvSetDevParam;

  {设置设备参数的命令执行返回数据}
  TCmdSrvTermSetDevParamRet = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: integer;
  end;
  PCmdSrvTermSetDevParamRet = ^TCmdSrvTermSetDevParamRet;


  {通过UDP端口通知需要从数据库中刷新新的数据的命令
    @TABB
    @H(标识        |类型   |含义|参见)
    @R( Flag       |Byte   | 命令标识=DBSRV_REFRESH| )
    @R( CmdId      |integer| 命令ID| )
    @R( RefreshType|Byte   | 数据刷新的类型| )
    @TABE
    数据刷新类型：
    <li>车辆归属关系发生变化       =$01
    <li>车辆、分组方案信息发生变化 =$02
    <li>车辆-车机对应发生变化      =$04
  }
  TCmdDBSrvRefresh = packed record
    CmdFlag: Word;
    ExeFlag: Byte;
    CmdId: integer;
    RefreshType: Byte;
  end;
  PCmdDBSrvRefresh = ^TCmdDBSrvRefresh;


  (**************客户端与网关 V2.0版　新增的命令 ***********)
  {获取GPS设备状态}
  TCmdTermsrvGetstatData_V2 = packed record
    Size: Word;
    Flag: Byte;
    CmdId, DevId: integer;
  end;
  PCmdTermsrvGetstatData_V2 = ^TCmdTermsrvGetstatData_V2;

  {获取GPS设备状态的返回值}
  TCmdSrvtermGetstatData_V2 = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: integer;
    case integer of
      0: ();
      1: (
        DevVer: Word; //车机版本　
        DevRegTime: TDateTime; //车机登录时间
        );
  end;
  PCmdSrvtermGetstatData_V2 = ^TCmdSrvtermGetstatData_V2;

  {定位命令，取得车机的当前定位数据   Flag= TERMSRV_GETPOSITION}
  TCmdTermSrvGetPosition = packed record
    Size: Word;
    Flag: Byte; //命令字
    CmdId: integer; //命令序号
    DevId: integer;
  end;
  PCmdTermSrvGetPosition = ^TCmdTermSrvGetPosition;
  {网关回复　Flag= SRVTERM_GETPOSITION}
  TCmdSrvTermGetPosition = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermGetPosition = ^TCmdSrvTermGetPosition;
  {从网关取得车机定位数据 Flag= SRVTERM_GPSDATA_V2}
  TCmdSrvTermGpsData_V2 = packed record
    Size: Word;
    Flag: Byte;
    //CmdID:integer; 无CmdID
    DevId: integer;
    Latitude: integer; //纬度 X 100 0000 如: 值32123456表示：32.123456度
    Longitude: integer; //经度 X 100 0000
    Speed: Byte; //速度　单位：公里/小时，表示范围0～255
    Orientation: Byte; //方向　正北方向为0度，顺时针增加，单位：2度，数值范围0～180。
    State: Longword; //32位状态位
    GpsTime: array[0..5] of Byte; // GPS时间
  end;
  PCmdSrvTermGpsData_V2 = ^TCmdSrvTermGpsData_V2;
  {客户端处理时　用的GpsData_V2}
  TGpsData_V2 = packed record
    Size: Byte;
    Id: integer;
    Long: Double; //－已有转换　经度 eg: 118.123456
    Lat: Double; //－已有转换　纬度 eg:  32.123456
    Speed: Byte; //速度　单位：公里/小时，表示范围0～255
    Orientation: Word; //－已有转换　方向　正北方向为0度，顺时针增加，单位：度
    State: Longword; //32位状态位
    GpsTime: TDateTime;
  end;
  PGpsData_V2 = ^TGpsData_V2;


  {追踪车辆
  @TABB
     @H(标识           |  类型  |含义                             |参见)
     @R( Size          | Word   |=sizeof(TCmdTermSrvPursue)       |  )
     @R( Flag          | Byte   |=TERMSRV_PURSUE                  | )
     @R( CmdID         | integer| 这条命令的序号                  | )
     @R( DevID         | integer| 要追踪车机ID                    | )
     @R( PursueInterval| Word   | 单位：秒，最小为0，默认为30，最大为65535（约18小时）当为0时表示停止追踪                | )
     @TABE
  }
  TCmdTermSrvPursue = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    PursueInterval: Word;
  end;
  PCmdTermSrvPursue = ^TCmdTermSrvPursue;
  {网关回复－SRVTERM_PURSUE}
  TCmdSrvTermPursue = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermPursue = ^TCmdSrvTermPursue;

  {设置参数 TERMSRV_SETDEVPARAM_V2}
  TCmdTermSrvSetDevParam_V2 = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    ParamId: Word;
    //参数值 长度不定
  end;
  PCmdTermSrvSetDevParam_V2 = ^TCmdTermSrvSetDevParam_V2;
  {网关回复－SRVTERM_SETDEVPARAM_V2}
  TCmdSrvTermSetDevParam_V2 = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: integer;
  end;
  PCmdSrvTermSetDevParam_V2 = ^TCmdSrvTermSetDevParam_V2;
  TCmdSrvTermSetStationParam_V2 = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: byte;
  end;
  PCmdSrvTermSetStationParam_V2 = ^TCmdSrvTermSetStationParam_V2;
  {查询参数 TERMSRV_READDEVPARAM_V2}
  TCmdTermSrvReadDevParam_V2 = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    ParamId: Word; //参数ID
  end;
  PCmdTermSrvReadDevParam_V2 = ^TCmdTermSrvReadDevParam_V2;
  {网关回复　SRVTERM_READDEVPARAM_V2}
  TCmdSrvTermReadDevParam_V2 = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    ReadRet: Byte; //   查询结果0：成功  1：失败
    ParamId: Word; //   参数ID
    ParamLen: Byte; //   参数长度
    //参数值　，长度不定
  end;
  PCmdSrvTermReadDevParam_V2 = ^TCmdSrvTermReadDevParam_V2;
  TCmdSrvTermReadDevParam_Bus = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    ReadRet: Byte; //   查询结果0：成功  1：失败
    ParamId: Word; //   参数ID
    ParamLen: Word; //   参数长度
    //参数值　，长度不定
  end;
  PCmdSrvTermReadDevParam_Bus = ^TCmdSrvTermReadDevParam_Bus;
  {解除报警 TERMSRV_REMOVEALARM}
  TCmdTermSrvRemoveAlarm = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
  end;
  PCmdTermSrvRemoveAlarm = ^TCmdTermSrvRemoveAlarm;
  {网关回复　SRVTERM_REMOVEALARM}
  TCmdSrvTermRemoveAlarm = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermRemoveAlarm = ^TCmdSrvTermRemoveAlarm;

  {修改车机显示屏 主界面公司名称 TERMSRV_MODIFYDEVDISPLAYNAME}
  TCmdTermSrvModifyDevDisplayName = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    //名称不定长
  end;
  PCmdTermSrvModifyDevDisplayName = ^TCmdTermSrvModifyDevDisplayName;
  {网关回复 SRVTERM_MODIFYDEVDISPLAYNAME}
  TCmdSrvTermModifyDevDisplayName = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermModifyDevDisplayName = ^TCmdSrvTermModifyDevDisplayName;

  {修改车机显示屏 固定菜单 TERMSRV_MODIFYDEVDISPLAYFIXEDMENU}
  TCmdTermSrvModifyDevDisplayFixedMenu = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    //菜单ID、菜单内容 --不定长
  end;
  PCmdTermSrvModifyDevDisplayFixedMenu = ^TCmdTermSrvModifyDevDisplayFixedMenu;
  {网关回复}
  TCmdSrvTermModifyDevDisplayFixedMenu = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermModifyDevDisplayFixedMenu = ^TCmdSrvTermModifyDevDisplayFixedMenu;

  {发送文本调度信息 TERMSRV_SENDCONTROLINFO}
  TCmdTermSrvSendControlInfo = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    MsgID: Word; //调度信息ID，从数据库中取值
    //调度信息 不定长 ，<200Byte
  end;
  PCmdTermSrvSendControlInfo = ^TCmdTermSrvSendControlInfo;
  {网关回复}
  TCmdSrvTermSendControlInfo = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    MsgID: Word; //调度信息ID，从数据库中取值
    Ret: Byte;
  end;
  PCmdSrvTermSendControlInfo = ^TCmdSrvTermSendControlInfo;

  {发送带控制命令的文本调度信息 TERMSRV_SENDCONTROLCMDTXT}
  TCmdTermSrvSendControlCmdTxt = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: integer;
    CmdId: integer;
    //MsgID: Word; //调度信息ID，从数据库中取值
    ControlCmd:Byte;//调度控制项　1
    //调度信息 不定长 ，<200Byte
  end;
  PCmdTermSrvSendControlCmdTxt = ^TCmdTermSrvSendControlCmdTxt;
  {网关回复}
  TCmdSrvTermSendControlCmdTxt = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    //MsgID: Word; //调度信息ID，从数据库中取值
    Ret: Byte;
  end;
  PCmdSrvTermSendControlCmdTxt = ^TCmdSrvTermSendControlCmdTxt;


  {下发文本信息 TERMSRV_SENDCONTROLINFO_V3}
  TCmdTermSrvSendControlInfo_V3 = packed record
    Header:THead_V3;
    ID: Integer;  // 文本ID
    ControlCmd:Byte; // 标志
    //调度信息 不定长 ，<=499Byte
  end;
  PCmdTermSrvSendControlInfo_V3 = ^TCmdTermSrvSendControlInfo_V3;

  {网关回复}
  TCmdSrvTermSendControlInfo_NeedDevAnswer = packed record
    Size: Word;
    Flag: Byte;
    CmdId: Word;
    DevId: integer;
    MsgID: Word; //调度信息ID，从数据库中取值
    Ret: Byte;
  end;
  PCmdSrvTermSendControlInfo_NeedDevAnswer = ^TCmdSrvTermSendControlInfo_NeedDevAnswer;

  {设置电话本 TERMSRV_SETTELLIST}
  TCmdTermSrvSetTelList = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    //电话列表 不定长
  end;
  PCmdTermSrvSetTelList = ^TCmdTermSrvSetTelList;

  TCmdTermSrvSetEventList = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdcl没有factId
    DevId: integer;
    CmdId: word;
    // 事件列表不定长
  end;
  PCmdTermSrvSetEventList =^TCmdTermSrvSetEventList;

  {网关回复　SRVTERM_SETTELLIST}
  TCmdSrvTermSetTelList = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermSetTelList = ^TCmdSrvTermSetTelList;
  {网关回复站牌调度服务的应答}
  TCmdSrvTermAnswer2Client = packed record
    Size:word;
    Flag:byte;
    CmdId:integer;
    BrankId:integer;
    Ret:byte;
  end;
  PCmdSrvTermAnswer2Client = ^TCmdSrvTermAnswer2Client;
  {升级车机固件程序 TERMSRV_UPDATEDEVFIRMWARE}
  TCmdTermSrvUpdateDevFirmware = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    UpdateType: Byte; //升级设备类型－－0：表示升级主机1：表示升级调度屏
    //URL地址 不定长＜200Byte
  end;
  PCmdTermSrvUpdateDevFirmware = ^TCmdTermSrvUpdateDevFirmware;
  {网关回复}
  TCmdSrvTermUpdateDevFirmware = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermUpdateDevFirmware = ^TCmdSrvTermUpdateDevFirmware;


  {修改车机显示屏 取消订单用的菜单 TEMRSRV_MODIFYDEVDISPLAY_CANCELORDERMENU = $1E;}
  TCmdTermSrvModifyDevDisplay_CancelOrderMenu = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    { 第1项菜单ID　      1
      第1项菜单的长度    1
      第1项菜单的内容    <40   ASCII码
      ...第n项（最多可设置10个）}
  end;
  PCmdTermSrvModifyDevDisplay_CancelOrderMenu = ^TCmdTermSrvModifyDevDisplay_CancelOrderMenu;
  {网关回复SRVTERM_MODIFYDEVDISPLAY_CANCELORDERMENU = $C0;}
  TCmdSrvTermModifyDevDisplay_CancelOrderMenu = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermModifyDevDisplay_CancelOrderMenu = ^TCmdSrvTermModifyDevDisplay_CancelOrderMenu;

  {下发一条订单供抢答 TERMSRV_DOWNAORDER= $1F;}
  TCmdTermSrvDownAOrder = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    //DevID: Integer;   //无
    OrderType: Byte; //订单类型
    OrderID: integer; //订单ID ★★★客户端<->网关采用的是Integer; 网关<->车机采用Word
    OrderDateTime: TDateTime; //订单日期、时间 --至少要比现在时间大　10分钟
    //下发给多少个车机 1   ＝a
    //下发车机ID列表     a*4   a个车机ID（integer）
    //订单内容长度     1　
    //订单内容         <200  ASCII码
    //乘客电话长度     1
    //乘客电话　             ASCII码
    //订单详细内容长度 1
    //订单详细内容     <200  ASCII码
  end;
  PCmdTermSrvDownAOrder = ^TCmdTermSrvDownAOrder;
  TCmdTermSrvDownAOrder_V2 = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    //DevID: Integer;   //无
    OrderType: Byte; //订单类型
    OrderID: integer; //订单ID ★★★客户端<->网关采用的是Integer; 网关<->车机采用Word
    OrderDateTime: Tdatetime_V2; //订单日期、时间 --至少要比现在时间大　10分钟
    //下发给多少个车机 1   ＝a
    //下发车机ID列表     a*4   a个车机ID（integer）
    //订单内容长度     1　
    //订单内容         <200  ASCII码
    //乘客电话长度     1
    //乘客电话　             ASCII码
    //订单详细内容长度 1
    //订单详细内容     <200  ASCII码
  end;
  PCmdTermSrvDownAOrder_V2 = ^TCmdTermSrvDownAOrder_V2;
  {网关回复 SRVTERM_DOWNAORDER = $C1;}
  TCmdSrvTermDownAOrder = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    //DevID: Integer;   //无
    OrderID: integer; //订单ID
    Ret: Byte;
  end;
  PCmdSrvTermDownAOrder = ^TCmdSrvTermDownAOrder;

  {下发订单取消 TERMSRV_DOWNCANCELORDER  = $20;}
  TCmdTermSrvCancelOrder = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    //DevID: Integer;   //无
    OrderID: integer; //订单ID
  end;
  PCmdTermSrvCancelOrder = ^TCmdTermSrvCancelOrder;
  {网关回复SRVTERM_DOWNCANCELORDER = $C2;}
  TCmdSrvTermCancelOrder = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    //DevID: Integer;   //无
    OrderID: integer; //订单ID
    Ret: Byte;
  end;
  PCmdSrvTermCancelOrder = ^TCmdSrvTermCancelOrder;

  {监控端　至　网关：对车机断油/断电/供油/供电　TERMSRV_CUTORFEED_OIL_ELECTRICITY = $21;}
  TCmdTermSrvCutOrFeedOilOrElectricity = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Content: Byte; //具体操作内容：断油/断电/供油/供电,用常数表示。
  end;
  PCmdTermSrvCutOrFeedOilOrElectricity = ^TCmdTermSrvCutOrFeedOilOrElectricity;
  {网关回复　 SRVTERM_CUTORFEED_OIL_ELECTRICITY     = $C4;}
  TCmdSrvTermCutOrFeedOilOrElectricity = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermCutOrFeedOilOrElectricity = ^TCmdSrvTermCutOrFeedOilOrElectricity;

  {监控端给网关心跳。0200}
  {网关回复　}
  TCmdSrvTermHeartBeat = packed record
    Size: Word; //=3
    Flag: Byte; // SRVTERM_HEARTBEAT =$F0;
  end;
  PCmdSrvTermHeartBeat = ^TCmdSrvTermHeartBeat;

  {监控端 -> 网关 读车机测试数据 TERMSRV_READTESTDATA  = $22}
  TCmdTermSrvReadTestData = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
  end;
  PCmdTermSrvReadTestData = ^TCmdTermSrvReadTestData;
  {网关回复 车机上传来的 测试数据 SRVTERM_READTESTDATA = $C5}
  TCmdSrvTermReadTestData = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
    TestData: array[0..19] of Byte;
  end;
  PCmdSrvTermReadTestData = ^TCmdSrvTermReadTestData;

  {监控端 -> 网关 读车机版本 TERMSRV_READDEVVER = $23}
  TCmdTermSrvReadDevVer = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
  end;
  PCmdTermSrvReadDevVer = ^TCmdTermSrvReadDevVer;
  { 网关回复　车机上传　车机版本　SRVTERM_READDEVVER = $C6}
  TCmdSrvTermReadDevVer = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
    //DevVer 不定长　最长为32字节
  end;
  PCmdSrvTermReadDevVer = ^TCmdSrvTermReadDevVer;

  { 网关回复　车机上传车机版本(含外设)　SRVTERM_READDEVVER = $59  20090205}
  {TCmdSrvTermReadDevVer_Extend= packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;  //车机主动上传时，=0
    DevId: integer;
    DevVer: String[20]; //车机版本号 ASCII码，定长20Byte
    //IsNeedAnswer:byte;//是否需要应答. 对客户端无用
    DevState:Word;
    LcdVer:String[20]; //调度屏 版本号 ASCII码，定长20Byte
    LedVer:String[20]; //广告屏 版本号 ASCII码，定长20Byte
    JjqVer:String[20];
    PosVer:String[20]; //POS机 版本号 ASCII码，定长20Byte
  end;}

  TCmdSrvTermReadDevVer_Extend= packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;  //车机主动上传时，=0
    DevId: integer;
    DevVer: array[0..19]of byte; //车机版本号 ASCII码，定长20Byte
    //IsNeedAnswer:byte;//是否需要应答. 对客户端无用
    DevState:Word;
    LcdVer:array[0..19]of byte; //调度屏 版本号 ASCII码，定长20Byte
    LedVer:array[0..19]of byte; //广告屏 版本号 ASCII码，定长20Byte
    JjqVer:array[0..19]of byte;
    PosVer:array[0..19]of byte; //POS机 版本号 ASCII码，定长20Byte
  end;
  PCmdSrvTermReadDevVer_Extend = ^TCmdSrvTermReadDevVer_Extend;

  //监控端 -> 网关 设置司机信息TERMSRV_SETDRIVERS   = $24;
  TCmdTermSrvSetDrivers = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    DriverNo1: array[0..9] of char; //定长.不足部份补0
    DriverName1: array[0..19] of char;
    DriverNo2: array[0..9] of char;
    DriverName2: array[0..19] of char;
    DriverNo3: array[0..9] of char;
    DriverName3: array[0..19] of char;
    DriverNo4: array[0..9] of char;
    DriverName4: array[0..19] of char;
  end;
  PCmdTermSrvSetDrivers = ^TCmdTermSrvSetDrivers;
  //网关回复      SRVTERM_SETDRIVERS  = $C7;
  TCmdSrvTermSetDrivers = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermSetDrivers = ^TCmdSrvTermSetDrivers;

  //监控端 -> 网关  读取司机信息TERMSRV_READDRIVERS  = $25;
  TCmdTermSrvReadDrivers = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
  end;
  PCmdTermSrvReadDrivers = ^TCmdTermSrvReadDrivers;
  //网关回复     SRVTERM_READDRIVERS    = $C8;
  TCmdSrvTermReadDrivers = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    DriverNo1: array[0..9] of char; //定长.不足部份补0
    DriverName1: array[0..19] of char;
    DriverNo2: array[0..9] of char;
    DriverName2: array[0..19] of char;
    DriverNo3: array[0..9] of char;
    DriverName3: array[0..19] of char;
    DriverNo4: array[0..9] of char;
    DriverName4: array[0..19] of char;
    Ret: Byte;
  end;
  PCmdSrvTermReadDrivers = ^TCmdSrvTermReadDrivers;

  // 监控端 -> 网关  读取当前司机 TERMSRV_READCURRENTDRIVERS    = $26;
  TCmdTermSrvReadCurrentDriver = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
  end;
  PCmdTermSrvReadCurrentDriver = ^TCmdTermSrvReadCurrentDriver;
  //网关->客户端　上传当前司机SRVTERM_UPLOADCURRENTDRIVER  = $C9;  --有可能是车机主动上传,也可能是上面命令的应答
  TCmdSrvTermUploadCurrentDriver = packed record
    Size: Word;
    Flag: Byte;
    //CmdId: integer; //客户端根据CmdID 区分是车机对读命令的应答(=读命令的CmdId),还是车机主动上传(=-1)
    DevId: integer;
    DriverNo: array[0..9] of char;
    LoginTime: array[0..5] of byte;  //TDateTime
    //Ret: Byte;
  end;
  PCmdSrvTermUploadCurrentDriver = ^TCmdSrvTermUploadCurrentDriver;

  //网关->客户端　上传司机下班退出 SRVTERM_UPLOADDRIVERLOGOUT            = $CA;
  TCmdSrvTermUploadDriverLogOut = packed record
    Size: Word;
    Flag: Byte;
    DevId: integer;
    DriverNo: array[0..9] of char;
    LogOutTime: array[0..5] of byte;  //TDateTime;
  end;
  PCmdSrvTermUploadDriverLogOut = ^TCmdSrvTermUploadDriverLogOut;
  //网关-》客户端  上传车辆进站或出站 SRVTERM_INORDOWNSTATION = $D5
  TCmdSrvTermInOrDownStation = packed record
    Size: Word;
    Flag: Byte;
    DevId: Integer;
    StationNo: byte;
    Direct: Byte;
    InOrDown: Byte;
  end;
  PCmdSrvTermInOrDownStation = ^TCmdSrvTermInOrDownStation;
  //网关->客户端  上传电子站牌吊线或上线
  TCmdSrvTermStationOnOrOff = packed record
    Size:word;
    Flag:Byte;
    StationBrankId:integer;
    ret:byte;
  end;
  PCmdSrvTermStationOnOrOff = ^TCmdSrvTermStationOnOrOff;
  //网关->客户端  上传车机从服务器注销  SRVTERM_DEVLOGOUTFROMSRV = $B8;
  TCmdSrvTermDevLogOutFromSrv = packed record
    Size: Word;
    Flag: byte;
    DevId: integer;
    Latitude: integer; //纬度 X 100 0000 如: 值32123456表示：32.123456度
    Longitude: integer; //经度 X 100 0000
    Speed: Byte; //速度　单位：公里/小时，表示范围0～255
    Orientation: Byte; //方向　正北方向为0度，顺时针增加，单位：2度，数值范围0～180。
    State: Longword; //32位状态位
    GpsTime: array[0..5] of Byte;
  end;
  PCmdSrvTermDevLogOutFromSrv = ^TCmdSrvTermDevLogOutFromSrv;
  //网关-》客户端  上传车辆超速记录  SRVTERM_OVERSPEEDINFO = $D7
  TCmdSrvTermOverSpeedInfo = packed record
    Size: Word;
    Flag: Byte;
    DevId: Integer;
    AreaNo: integer;
    overSpeedTime: array[0..5] of byte;
    IsBengin: byte;
  end;
  PCmdSrvTermOverSpeedInfo = ^TCmdSrvTermOverSpeedInfo;
  //网关-》客户端  停车记录
  TCmdSrvTermStopInfo = packed record
    Size: Word;
    Flag: Byte;
    DevId: Integer;
    Num: integer;
    //停车记录
  end;
  PCmdSrvTermStopInfo = ^TCmdSrvTermStopInfo;
  //网关-》客户端  计价器数据  SRVTERM_TAXIRUNDATA = $D9
  TCmdSrvTermTaxiRunData = packed record
    Size: Word;
    Flag: Byte;
    DevId: integer;
    //计价器数据
  end;
  PCmdSrvTermTaxiRunData = ^TCmdSrvTermTaxiRunData;
  //网关转发的南通计价器营运数据
  //网关-》客户端  司机登陆  SRVTERM_DRIVERON = $DA
  TCmdSrvTermDriverOn = packed record
    Size: Word;
    Flag: Byte;
    DevId: integer;
    DriverNo: array[0..9] of Byte;
    LoginTime: array[0..5] of Byte;
  end;
  PCmdSrvTermDriverOn = ^TCmdSrvTermDriverOn;
  //网关 -》客户端  司机退出 SRVTERM_DRIVEROFF = $DB
  TCmdSrvTermDriverOff = packed record
    Size: Word;
    Flag: byte;
    DevId: integer;
    DriverNo: array[0..9] of Byte;
    LogOutTime: array[0..5] of Byte;
  end;
  PCmdSrvTermDriverOff = ^TCmdSrvTermDriverOff;
   //客户端->网关 拍照，拍当前照片 TERMSRV_GETAPIC= $27;
  TCmdTermSrvGetAPic = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    GetPicSize: Byte; //照片尺寸大小 0=320x240  1=640x480  2-else
    CameraIndex: Byte; //摄像头号
  end;
  PCmdTermSrvGetAPic = ^TCmdTermSrvGetAPic;
  //网关回复  SRVTERM_GETAPIC= $CB;
  TCmdSrvTermGetAPic = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermGetAPic = ^TCmdSrvTermGetAPic;

  //20070518 流量
  //客户端->网关，读取当前流量 TERMSRV_READFLUX = $28;
  TCmdTermSrvReadFlux = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
  end;
  PCmdTermSrvReadFlux = ^TCmdTermSrvReadFlux;
  //网关->客户端　收到车机 上传流量SRVTERM_UPLOADFLUX = $CC;
  TCmdSrvTermUploadFlux = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer; //网关处理时：如果是车机主动上传，CmdId为0。如果是对客户端的应答，则是客户端发来的CmdId
    DevId: integer;
    Ret: Byte; //网关处理时，如果是车机主动上传，Ret值为0。
    Link1Up: Integer; //连接1的上行流量
    Link1Down: Integer; //连接1的下行流量
    Link2Up: Integer; //连接2的上行流量
    Link2Down: Integer; //连接2的下行流量
    Link3Up: Integer; //连接3的上行流量
    Link3Down: Integer; //连接3的下行流量
    Link4Up: Integer; //连接4的上行流量
    Link4Down: Integer; //连接4的下行流量
    Link5Up: Integer; //连接5的上行流量
    Link5Down: Integer; //连接5的下行流量
    Link6Up: Integer; //连接6的上行流量
    Link6Down: Integer; //连接6的下行流量
  end;
  PCmdSrvTermUploadFlux = ^TCmdSrvTermUploadFlux;
  //2008-05-09 增加下发广告-新版本
  //设置显示屏时间 TERMSRV_SETLEDTIME_NEW = $36
  TCmdTermSrvSetLedTime_New = packed record
    Size: Word;
    Flag: byte;
    CmdId: integer;
    devId: integer;
    second: byte;
    minute: byte;
    hour: byte;
    week: byte;
    day: byte;
    month: byte;
    year: byte;
    DisLen:word;
    disIntval:word;
  end;
  PCmdTermSrvSetLedTime_New = ^TCmdTermSrvSetLedTime_New;

 // LED屏控制指令(命令ID：4AH)
  TCmdTermSrvSetLedseat_New = packed record
    Size: Word;
    Flag: byte;
    CmdId: integer;
    devId: integer;
    frontLed: byte;
    backled: byte;
  end;
  pCmdTermSrvSetLedseat_New = ^TCmdTermSrvSetLedseat_New;


 //立即显示LED屏内指定的广告(命令ID：49H)
  TCmdTermSrvSetLedShow = packed record
    Size: Word;
    Flag: byte;
    CmdId: integer;
    devId: integer;
    ledID: integer;
  end;
  pCmdTermSrvSetLedShow = ^TCmdTermSrvSetLedShow;

  TCmdSrvTermSetLedShow = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermSetLedShow = ^TCmdSrvTermSetLedShow;

  TCmdSrvTermSetLedTime_New = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermSetLedTime_New = ^TCmdSrvTermSetLedTime_New;
  //TERMSRV_DELETELED_NEW = $35;//客户端->网关，删除所有的广告
  TCmdTermSrvDeleteAllLed_New = packed record
    Size: word;
    Flag: byte;
    cmdId: integer;
    devId: integer;
  end;
  PCmdTermSrvDeleteAllLed_New = ^TCmdTermSrvDeleteAllLed_New;
  TCmdSrvTermDeleteAllLed_New = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermDeleteAllLed_New = ^TCmdSrvTermDeleteAllLed_New;

   //TERMSRV_DELETELEDBYID_NEW = $34;//客户端->网关，删除指定ID广告
  TCmdTermSrvDeleteLedById_New = packed record
    Size: word;
    Flag: byte;
    cmdId: integer;
    devId: integer;
    ledID: integer;
  end;
  PCmdTermSrvDeleteLedById_New = ^TCmdTermSrvDeleteLedById_New;
  TCmdSrvTermDeleteLedById_New = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermDeleteLedById_New = ^TCmdSrvTermDeleteLedById_New;
  //TERMSRV_DISCURRLED_NEW = $33;//客户端->网关，显示当前的广告
  TCmdTermSrvDisCurrLed_New = packed record
    Size: word;
    Flag: byte;
    cmdId: integer;
    devId: integer;
    ledNo: byte; //模块ID
    ledID: integer;
    DataType: byte;
    DisSpeed: byte;
    InType: byte;
    ExitType: byte;
    X: array[0..1] of byte;
    Y: array[0..1] of byte;
    StopTime: word;
    Font: byte;
    IsDisTime: byte;
    Extend: array[0..3] of byte;
    //广告内容，不定长
  end;
  PCmdTermSrvDisCurrLed_New = ^TCmdTermSrvDisCurrLed_New;
  TCmdSrvTermDisCurrLed_New = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermDisCurrLed_New = ^TCmdSrvTermDisCurrLed_New;
  //TERMSRV_DOWNLED_NEW = $32;     //客户端->网关，下发广告信息
  TcmdTermSrvDownLed_New = packed record
    Size: word;
    Flag: byte;
    cmdId: integer;
    devId: integer;
    ledNo: byte;
    ledID: integer;
    DataType: byte;
    DisSpeed: byte;
    InType: byte;
    ExitType: byte;
    X: array[0..1] of byte;
    Y: array[0..1] of byte;
    StopTime: word;
    Font: byte;
    IsDisTime: byte;
    Extend: array[0..3] of byte;
    //广告内容，不定长
  end;
  PcmdTermSrvDownLed_New = ^TcmdTermSrvDownLed_New;
  TCmdSrvTermDownLed_New = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermDownLed_New = ^TCmdSrvTermDownLed_New;
 //CLIENT_SETELCFENCE =$4B   //设置车机的电子围栏
  TCmdTermSrvSETELCFENCE_New = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: TDEV_ID_BCD_ZDCL;
    AreaID: word;
    kindAlarm: byte;
    overAlarm: byte;
    lyAlarm: byte;
    kindArea: byte;
    len: word
  end;
  PCmdTermSrvSETELCFENCE_New = ^TCmdTermSrvSETELCFENCE_New;

  TCmdSrvTermSETELCFENCE = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: TDEV_ID_BCD_ZDCL;
    Ret: Byte;
  end;
  pCmdSrvTermSETELCFENCE = ^TCmdSrvTermSETELCFENCE;
  //CCLIENT_READSAVEELCFENCE=$4C  //读取车机内存储的电子围栏
  TCmdTermSrvREADSAVEELCFENCE_New = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: TDEV_ID_BCD_ZDCL;
    Ret: Byte;
  end;
  pCmdTermSrvREADSAVEELCFENCE_New = ^TCmdTermSrvREADSAVEELCFENCE_New;

   //SEV_READSAVEELCFENCE=$4C  //读取车机内存储的电子围栏   回复
  TCmdSrvTermREADSAVEELCFENCE_New = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: TDEV_ID_BCD_ZDCL;
    Ret: Byte;
  end;
  pCmdSrvTermREADSAVEELCFENCE_New = ^TCmdTermSrvREADSAVEELCFENCE_New;

 //TCLIENT_CANCELDESIGNFENCE=$4D  //取消指定的电子围栏信息（命令ID：4d）
  TCmdTermSrvCANCELDESIGNFENCE_New = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: TDEV_ID_BCD_ZDCL;
  end;
  PCmdTermSrvCANCELDESIGNFENCE_New = ^TCmdTermSrvCANCELDESIGNFENCE_New;
  //SEV_CANCELDESIGNFENCE=$4D
  TCmdSrvTermCANCELDESIGNFENCE_New = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: TDEV_ID_BCD_ZDCL;
    Ret: Byte;
  end;
  PCmdSrvTermCANCELDESIGNFENCE_New = ^TCmdSrvTermCANCELDESIGNFENCE_New;

  //上传区域报警记录 CLIENT_UPLOADAREAWARN = (byte) 0x4E;
  TCmdSrvTermAreaAlarm_New=Packed record
    Size: Word;
    Flag: Byte;
    DevId: integer;
    Latitude: integer; //纬度 X 100 0000 如: 值32123456表示：32.123456度
    Longitude: integer; //经度 X 100 0000
    Speed: Byte; //速度　单位：公里/小时，表示范围0～255
    Orientation: Byte; //方向　正北方向为0度，顺时针增加，单位：2度，数值范围0～180。
    State: Longword; //32位状态位
    GpsTime: array[0..5] of Byte; // GPS时间
    AreamType:byte;       //类别
    areaID:word;          //围栏ID
  end;
   PCmdSrvTermAreaAlarm_New = ^TCmdSrvTermAreaAlarm_New;

  //读取屏信息   TERMSRV_READLEDINFO_NEW = $37
  TCmdTermSrvReadLed_New = packed record
    Size: word;
    Flag: byte;
    CmdId: integer;
    DevId: integer;
  end;
  PCmdTermSrvReadLed_New = ^TCmdTermSrvReadLed_New;
  TCmdSrvTermReadLed_New = packed record
    Size: word;
    Flag: byte;
    CmdId: integer;
    DevId: integer;
    LedNums: byte;
    RowNums: word;
    ColNums: word;
    Ret: byte;
  end;
  PCmdSrvTermReadLed_New = ^TCmdSrvTermReadLed_New;
  //读取所有广告
  TCmdTermSrvReadAllAd_New = packed record
    Size: word;
    Flag: byte;
    CmdId: integer;
    DevId: integer;
  end;
  PCmdTermSrvReadAllAd_New = ^TCmdTermSrvReadAllAd_New;
  TCmdSrvTermReadAllAd_New = packed record
    Size: word;
    Flag: byte;
    CmdId: integer;
    DevId: integer;
    //广告ID
    Ret: byte;
  end;
  PCmdSrvTermReadAllAd_New = ^TCmdSrvTermReadAllAd_New;
  //显示存储的广告信息
  TCmdTermSrvDisSaveAd_New = packed record
    Size: word;
    Flag: byte;
    CmdId: integer;
    DevId: integer;
    LedNo: byte;
    LedId: integer;
  end;
  PCmdTermSrvDisSaveAd_New = ^TCmdTermSrvDisSaveAd_New;
  TCmdSrvTermDisSaveAd_New = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermDisSaveAd_New = ^TCmdSrvTermDisSaveAd_New;
  //==========================20080515车机主动上传行驶里程信息
  // SRVTERM_UPLOADHOURDIS = $3A;
  TCmdSrvTermUploadHourDis = packed record
    Size: word;
    Flag: Byte;
    DevId: integer;
    uploadTime: array[0..3] of byte;
    uploadDis: integer;
  end;
  PCmdSrvTermUploadHourDis = ^TCmdSrvTermUploadHourDis;
  //TERMSRV_READHOURDIS = $3B;
  TCmdTermSrvReadHourDis = packed record
    Size: word;
    Flag: byte;
    CmdId: integer;
    DevId: integer;
    beginTime: array[0..4] of byte;
    endTime: array[0..4] of byte;
  end;
  PCmdTermSrvReadHourDis = ^TCmdTermSrvReadHourDis;
  TCmdSrvTermReadHOurDis = packed record
    Size: word;
    Flag: byte;
    CmdId: integer;
    DevId: integer;
    Ret: byte;
    //行驶里程信息 12	里程1对应的时间	4	压缩BCD码  YY MM DD HH
      //本时段内的行驶里程1	4字节	单位：米

  end;
  PCmdSrvTermReadHOurDis = ^TCmdSrvTermReadHOurDis;
  //====================================================================================
  //2007-8-23 增加广告相关命令
  //客户端->网关，下发一条广告信息 TERMSRV_DOWNANAD = $29;
  TCmdTermSrvDownAnAd = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    AdId: integer;
    AdLen: Byte;
    //AdContent  <200Byte;
  end;
  PCmdTermSrvDownAnAd = ^TCmdTermSrvDownAnAd;
  {网关回复 SRVTERM_DOWNANAD = $CD;}
  TCmdSrvTermDownAnAd = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermDownAnAd = ^TCmdSrvTermDownAnAd;

  //客户端->网关，删除一条广告信息TERMSRV_DELANAD  = $2A;
  TCmdTermSrvDelAnAd = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    AdId: Integer;
  end;
  PCmdTermSrvDelAnAd = ^TCmdTermSrvDelAnAd;
  //网关回复    SRVTERM_DELANAD  = $CE;
  TCmdSrvTermDelAnAd = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: byte;
  end;
  PCmdSrvTermDelAnAd = ^TCmdSrvTermDelAnAd;

  //客户端->网关，删除所有广告信息 TERMSRV_DELALLAD = $2B;
  TCmdTermSrvDelAllAd = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
  end;
  PCmdTermSrvDelAllAd = ^TCmdTermSrvDelAllAd;
  //网关回复    SRVTERM_DELALLAD = $CF;
  TCmdSrvTermDelAllAd = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermDelAllAd = ^TCmdSrvTermDelAllAd;
  //客户端-》网关  读取当前车辆所处的站点信息     TERMSRV_DOWNLED_NEW
  TCmdSrvReadDevStation = packed record
    Size:word;
    Flag:byte;
    DevId:integer;
  end;
  PCmdSrvReadDevStation = ^TCmdSrvReadDevStation;
  //网关回复车辆进站信息
  //客户端->网关，读取车机内所有广告的ID    TERMSRV_READALLADID = $2C;
  TCmdTermSrvReadAllAdId = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
  end;
  PCmdTermSrvReadAllAdId = ^TCmdTermSrvReadAllAdId;
  //网关回复  SRVTERM_READALLADID = $D0;
  TCmdSrvTermReadAllAdId = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
    //AdId1 : Integer;
    //....AdIdn:Integer;
  end;
  PCmdSrvTermReadAllAdId = ^TCmdSrvTermReadAllAdId;

  //客户端->网关，下发车辆方向显示内容  TERMSRV_DOWNALLWAY  = $2D;
  TCmdTermSrvDownAllWay = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    //WayId1:Integer;
    //WayLen1 : Byte;
    //WayContent : <50
    //...
  end;
  PCmdTermSrvDownAllWay = ^TCmdTermSrvDownAllWay;
  //网关回复  SRVTERM_DOWNALLWAY  = $D1;
  TCmdSrvTermDownAllWay = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermDownAllWay = ^TCmdSrvTermDownAllWay;

  // 客户端->网关，设置车机主动向外拨打的监听号码 2007-9-24  TERMSRV_DOWNLISTENCALLNUM = $2E;
  TCmdTermSrvDownListenCallNum = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    //ListenCallNum :<20 ASCII码
  end;
  PCmdTermSrvDownListenCallNum = ^TCmdTermSrvDownListenCallNum;
  //网关回复  SRVTERM_DOWNLISTENCALLNUM = $D2;
  TCmdSrvTermDownListenCallNum = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermDownListenCallNum = ^TCmdSrvTermDownListenCallNum;

  //客户端->网关，客户端发送通用的命令，网关不负责解析 2007-10-08  TERMSRV_DOWNGENERICCOMMAND = $2F
  TCmdTermSrvDownGenicCommand = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    //命令内容
  end;
  PCmdTermSrvDownGenicCommand = ^TCmdTermSrvDownGenicCommand;
  //网关回复   SRVTERM_DOWNGENERICCOMMAND = $D3
  TCmdSrvTermDownGeniccommand = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermDownGeniccommand = ^TCmdSrvTermDownGeniccommand;
  //客户端-》网关，清除车机中一个站点信息 TERMSRV_CLEARBUSSTATIONINFO=$31;
  TCmdTermSrvClearABusStationInfo = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
  end;
  PCmdTermSrvClearABusStationInfo = ^TCmdTermSrvClearABusStationInfo;
  //网关回复 SRVTERM_CLEARBUSSTATIONINFO = $D5;
  TCmdSrvTermClearABusStationInfo = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermClearABusStationInfo = ^TCmdSrvTermClearABusStationInfo;
  //客户端->网关，设置一个站点信息 2007-10-17  TERMSRV_DOWNABUSSTATIONINFO = $30;
  TCmdTermSrvDownABusStationInfo = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    BusStationId: Byte;
    PLATTYPE: byte; //站点类型
    PLATDirect: word; //站点方向
    INDistance: word; //进站报站距离
    OUTDistance: Word; //出站报站距离
    INGPSLanti: integer; //进站纬度
    INGPSLongi: integer; //进站经度
    OUTGPSLanti: integer; //出站纬度
    OUTGPSLongi: integer; //出站经度
    //站点内容
  end;
  PCmdTermSrvDownABusStationInfo = ^TCmdTermSrvDownABusStationInfo;
  //网关回复 SRVTERM_DOWNABUSSTATIONINFO = $D4;
  TCmdSrvTermDownABusStationInfo = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    RetBusStationId: Byte; //站点编号
    Ret: Byte;
  end;
  PCmdSrvTermDownABusStationInfo = ^TCmdSrvTermDownABusStationInfo;


  //＝＝＝＝＝＝＝＝客户端－＞网关＝＝子命令＝＝＝＝＝＝＝＝＝＝＝＝＝
  //设置休眠时间命令,多长时间不动,主机就进入休眠状态
  TCmdTermSrvHibernateTime = packed record
    Size: Word;
    Flag: Byte; //TERMSRV_DOWNGENERICCOMMAND = $2F
    CmdId: integer;
    DevId: integer;
    NextFlag: Byte; //=1
    Time: Byte; //单位是小时;
  end;
  PCmdTermSrvHibernateTime = ^TCmdTermSrvHibernateTime;

  //设置超速时间,连续超速多少时间才认为超速.
  TCmdTermSrvOverSpeedTime = packed record
    Size: Word;
    Flag: Byte; //TERMSRV_DOWNGENERICCOMMAND = $2F
    CmdId: integer;
    DevId: integer;
    NextFlag: Byte; //=2
    Time: Byte; //单位是秒;
  end;
  PCmdTermSrvOverSpeedTime = ^TCmdTermSrvOverSpeedTime;

  TCmdTermSrvBrakeState = packed record
    Size: Word;
    Flag: Byte; //TERMSRV_DOWNGENERICCOMMAND = $2F
    CmdId: integer;
    DevId: integer;
    NextFlag: Byte; //=3
    State: Byte; //状态,1:高电平有效,0:低电平有效;
  end;
  PCmdTermSrvBrakeState = ^TCmdTermSrvBrakeState;

  //20081119 sha 渣土车客户端添加进入空重车提示语音  TERMSRV_EMPTYNEXTFLAG = $08;
  TCmdTermSrvEmptyWord = packed record
    Size: Word;
    Flag: Byte;     //大命令字：TERMSRV_DOWNGENERICCOMMAND = $2F
    CmdId: integer;
    DevId: integer;
    NextFlag: byte;   //子命令字：　TERMSRV_EMPTYNEXTFLAG   = $08;
    WordType: Byte;   //提示类型
    WordEdit: byte;   //内容编码
    //语音内容
  end;
  PCmdTermSrvEmptyWord = ^TCmdTermSrvEmptyWord;
  //＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

  (**sha 20081230 smsclient***************************)
  //网关对下面5条命令的应答
  TCmdSrvTermRet_Sms = packed record
    Size :Word;      //长度
    MainFlag :byte;  //主命令字
    MidFlag : byte;  //小命令字
    CmdId: integer;     //命令序号
    DevId: Integer;  //车机ID
    Ret: Byte;   //回复是否执行成功。
  end;
  PCmdSrvTermRet_Sms= ^TCmdSrvTermRet_Sms;

  TCmdTermSrv_SmsHeader=packed record
    Size :Word;      //长度
    MainFlag :byte;  //主命令字
    MidFlag : byte;  //小命令字
    CmdId: integer;     //命令序号
    DevId: Integer;  //车机ID
  end;
  PCmdTermSrv_SmsHeader = ^TCmdTermSrv_SmsHeader;

  //TERMSRV_SMS_DEVUPGRADEDEVFIRMWARE= $01;
  TCmdTermSrv_SmsUpgradeDevFirmware= packed record
    Size :Word;
    MainFlag :byte;
    MidFlag : byte;
    CmdId: integer;
    DevId: Integer;
    //URL地址	<200	固件的下载地址（IP:Port:APN）
  end;
  PCmdTermSrv_SmsUpgradeDevFirmware = ^TCmdTermSrv_SmsUpgradeDevFirmware;

  //TERMSRV_SMS_REMOVEALARM = $02;
  TCmdTermSrv_SmsRemoveAlarm = packed record
    Size :Word;      //长度
    MainFlag :byte;  //主命令字
    MidFlag : byte;  //小命令字
    CmdId: integer;    //命令序号
    DevId: Integer;  //车机ID
  end;
  PCmdTermSrv_SmsRemoveAlarm = ^TCmdTermSrv_SmsRemoveAlarm;

  //TERMSRV_SMS_DEVRESTART = $03;
  TCmdTermSrv_SmsDevRestart = packed record
    Size :Word;      //长度
    MainFlag :byte;  //主命令字
    MidFlag : byte;  //小命令字
    CmdId: integer;    //命令序号
    DevId: Integer;  //车机ID
  end;
  PCmdTermSrv_SmsDevRestart= ^TCmdTermSrv_SmsDevRestart;

  //小命令字 TERMSRV_SMS_CONTROLDEV = $04;
  TCmdTermSrv_SmsControlDev= packed record
    Size :Word;      //长度
    MainFlag :byte;  //主命令字
    MidFlag : byte;  //小命令字
    CmdId: integer;  //命令序号
    DevId: Integer;  //车机ID
    ControlContent:Byte; //控制内容	 	1 -断油  2-断电 3-供油 4-供电
  end;
  PCmdTermSrv_SmsControlDev = ^TCmdTermSrv_SmsControlDev;

  // TERMSRV_SMS_SETPARAM   = $05;
  TCmdTermSrv_SmsSetParam= packed record
    Size :Word;      //长度
    MainFlag :byte;  //主命令字
    MidFlag : byte;  //小命令字
    CmdId: integer;    //命令序号
    DevId: Integer;  //车机ID
    ParamId:Word;  //参数ID
    //ParamContent :参数内容，不定长
  end;
  PCmdTermSrv_SmsSetParam = ^TCmdTermSrv_SmsSetParam;
   //=====================

  //查询照片时间范围指令   TERMSRV_READPICTIMESINFO = $56;
  TCmdTermSrvReadPicTimesInfo= packed record
    Size:Word;
    Flag:Byte;
    CmdId:Integer;
    DevId:Integer;
  end;
  PCmdTermSrvReadPicTimesInfo = ^TCmdTermSrvReadPicTimesInfo;
  //SRVTERM_RETREADPICTIMESINFO = $56;
  TCmdSrvTermRetReadPicTimesInfo= packed record
    Size:Word;
    Flag:Byte;
    CmdId:Integer;
    DevId:Integer;
    FirstDateTime:array[0..5] of byte;//第一个字节代表年（2000年为0年），第二个字节代表月，第三个字节代表日，无照片时三个字节为0。
    LastDateTime:array[0..5] of byte;
    //各类照片张数：属性不明的照片张数、开前门照片张数、关前门照片张数、开后门照片张数 、关后门照片张数...
  end;
  PCmdSrvTermRetReadPicTimesInfo = ^TCmdSrvTermRetReadPicTimesInfo;

  //按条件读取存储的照片指令 TERMSRV_READTHEPIC       = $57;
  TCmdTermSrvReadThePic = packed record
    Size:Word;
    Flag:Byte;
    CmdId:Integer;
    DevId:Integer;
    ReadDateTime:array [0..5]of byte;
    ReadPicCountType:Byte;  //要求上传的照片个数	1 	0：时间点之前的所有照片；1：时间点之前的1张照片
    ReadPicType:Byte;     // 照片属性	1	0-属性不明的照片数 1-翻拍照片 2-开门照片 3-紧急报警照片 4-超速报警照片 5-疲劳报警照片 6-其他（以后扩展）0xff-不指定照片属性
  end;
  PCmdTermSrvReadThePic = ^TCmdTermSrvReadThePic;
  //SRVTERM_RETREADTHEPIC       = $57;
  TCmdSrvTermRetReadThePic = packed record
    Size:Word;
    Flag:Byte;
    CmdId:Integer;
    DevId:Integer;
    Ret:Byte;//如果有符合条件的照片，返回的应答结果为成功，否则，返回的应答结果为失败。
  end;
  PCmdSrvTermRetReadThePic = ^TCmdSrvTermRetReadThePic;

  //终止上传车机存储照片 TERMSRV_STOPUPLOADSAVEDPIC  = $5B;
  TCmdTermSrvStopUploadSavedPic= packed record
    Size:Word;
    Flag:Byte;
    CmdId:Integer;
    DevId:Integer;
  end;
  PCmdTermSrvStopUploadSavedPic = ^TCmdTermSrvStopUploadSavedPic;
  {网关回复}
  TCmdSrvTermRetStopUploadSavedPic = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermRetStopUploadSavedPic = ^TCmdSrvTermRetStopUploadSavedPic;

  //读取车机电话本TERMSRV_READDEVTELLIST = $5C;
  TCmdTermSrvReadDevTelList= TCmdTermSrvStopUploadSavedPic;//结构体同
  PCmdTermSrvReadDevTelList = ^TCmdTermSrvReadDevTelList;
  //网关回复 SRVTERM_RETREADDEVTELLIST = $5C;
  TCmdSrvTermRetReadDevTelList =  packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    //
  end;
  PCmdSrvTermRetReadDevTelList= ^TCmdSrvTermRetReadDevTelList;

  //读取车机 固定菜单 TERMSRV_READDEVDISPLAYFIXEDMENU = $5D;
  TCmdTermSrvReadDevDiplayFixedMenu = TCmdTermSrvStopUploadSavedPic;//结构体同
  PCmdTermSrvReadDevDiplayFixedMenu = ^TCmdTermSrvReadDevDiplayFixedMenu;
  //网关回复SRVTERM_RETREADDEVDISPLAYFIXEDMENU = $5D;
  TCmdSrvTermRetReadDevDisplayFixedMenu = TCmdSrvTermRetReadDevTelList;//结构体相似
  PCmdSrvTermRetReadDevDisplayFixedMenu = ^TCmdSrvTermRetReadDevDisplayFixedMenu;

  //客户端->网关，向车机下发调度任务
  TCmdTermSrvSendNewAttemper = packed record
    size:Word;
    Flag:Byte;
    CmdId: Integer;
    DevId:Integer;
    AttemperId: Integer;    //任务单ID	4
    OverStopTimes:Word;     //超时停车间隔	2	单位：分钟，有任务时，当停车时间超该值的时候向中心进行超时停车报警
        //厂区围栏参数长度	1	厂区围栏参数的字节数
        //厂区围栏参数	-	多边形围栏，参数格式和车机电子围栏的多边形区域的参数相同。
        //工地围栏参数长度	1	工地围栏参数的字节数
        //工地围栏参数	-	多边形围栏，参数格式和车机电子围栏的多边形区域的参数相同。
  end;
    {网关回复}
  TCmdSrvTermRetSendNewAttemper = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermRetSendNewAttemper = ^TCmdSrvTermRetSendNewAttemper;

  //客户端->网关，向车机取消某调度任务
  TCmdTermSrvSendCancelTheAttemper = packed record
    size:Word;
    Flag:Byte;
    CmdId: Integer;
    DevId:Integer;
    AttemperId: Integer;    //任务单ID	4
  end;
    {网关回复}
  TCmdSrvTermRetSendCancelTheAttemper = TCmdSrvTermRetSendNewAttemper; //结构一致
  PCmdSrvTermRetSendCancelTheAttemper = ^TCmdSrvTermRetSendCancelTheAttemper;


  (****以下为网关主动给客户端的数据***)
  {网关给客户端－司机对 需回复的调度信息 的回复－“是”或“否” SRVTERM_SENDCONTROLINFO_DRIVERANSWER}
  TCmdSrvTermSendControlInfo_DriverAnswer = packed record
    Size: Word;
    Flag: Byte;
    //CmdID:integer; 无CmcID
    DevId: integer;
    MsgID: Word; //调度信息ID，从数据库中取值
    AnswerInfo: Byte; //司机反馈信息 - 0：否  1：是
  end;
  PCmdSrvTermSendControlInfo_DriverAnswer = ^TCmdSrvTermSendControlInfo_DriverAnswer;

  {网关给客户端－收到司机上传的固定菜单  SRVTERM_DRIVERUPLOADFIXEDMENU}
  TCmdSrvTermDriverUploadFixedMenu = packed record
    Size: Word;
    Flag: Byte;
    //CmdID:integer; 无
    DevId: integer;
    FixedMenuId: Byte; //司机所选择的固定菜单ID
  end;
  PCmdSrvTermDriverUploadFixedMenu = ^TCmdSrvTermDriverUploadFixedMenu;

  {网关给客户端－收到车机上传的计价器运营数据 SRVTERM_TAXIMETERRUNDATA}
  TCmdSrvTermTaxiMeterRunData = packed record
    Size: Word;
    Flag: Byte;
    //CmdID:integer; 无
    DevId: integer;
    {数据体}
  end;
  PCmdSrvTermTaxiMeterRunData = ^TCmdSrvTermTaxiMeterRunData;

  {网关给客户端－收到车机上传的计价器确认的停机时间 SRVTERM_TAXIMETERCONFIRMSTOPTIME}
  TCmdSrvTermTaxiMeterConfirmStopTime_Old = packed record
    Size: Word;
    Flag: Byte;
    //CmdID:integer; 无
    DevId: integer;
    StopDate: TDateTime; //eg:2005-08-16 　    //
    StopTime: Byte; //时
  end;
  PCmdSrvTermTaxiMeterConfirmStopTime_Old = ^TCmdSrvTermTaxiMeterConfirmStopTime_Old;
             {--------delphi网关用上面的，java网关用下面的 2009-02 sha-------}
  TCmdSrvTermTaxiMeterConfirmStopTime = packed record
    Size: Word;
    Flag: Byte;
    //CmdID:integer; 无
    DevId: integer;
    StopDateTime:array[0..4] of byte;//2009-2-23改：// TDateTime; //eg:2005-08-16 　    //StopTime: Byte; //时
  end;
  PCmdSrvTermTaxiMeterConfirmStopTime = ^TCmdSrvTermTaxiMeterConfirmStopTime;

  {网关给客户端－订单信息已有更改，请客户端自行从数据库中更新 SRVTERM_ORDERCHANGED = $C3;}
  TCmdSrvTermOrderChanged = packed record
    Size: Word;
    Flag: Byte;
    //CmdID:integer; 无
    //DevID: Integer; 无
    OrderID: integer;
    RetStat: Byte; //更改内容--用订单状态
  end;
  PCmdSrvTermOrderChanged = ^TCmdSrvTermOrderChanged;

  //网关告知客户端 收到车机已成功上传新的照片 SRVTERM_APICUPLOADED = $B5;
  TCmdSrvTermAPicUploaded = packed record
    Size: Word;
    Flag: Byte;
    DevId: integer;
    PicIndex: integer; //该车机的照片序号
    CameraIndex: Byte; //摄像头号
    PicReson: Byte; //拍照原因
    DoneRet: Byte; //拍照结果　0-成功，1-照片缓冲区満2-摄像头故障3-传输失败
  end;
  PCmdSrvTermAPicUploaded = ^TCmdSrvTermAPicUploaded;

  //网关主动客户端－－收到渣土车上传空重车里程 20081126 sha  SRVTERM_DEVZTUPLOADCARRYOFFXSLC = $B9;
  TCmdSrvTermDevZtUploadCarrayOffXslc = packed record
    Size: Word;
    Flag: Byte;
    DevId: integer;
    MeliType:Byte;
    StartTime:array[0..5] of byte;
    StartLongi:Integer;
    StartLati:Integer;
    EndTime:array[0..5] of byte;
    EndLongi:Integer;
    EndLati:Integer;
    Xslc: Integer;
  end;
  PCmdSrvTermDevZtUploadCarrayOffXslc= ^TCmdSrvTermDevZtUploadCarrayOffXslc;

  //网关主动-》客户端 车机上传调度任务状态改变  SRVTERM_CHGATTEMPERSTATE = $5C;
  TCmdSrvTermDevUploadAttemperStateChg = packed record
    Size: Word;
    Flag: Byte;
    DevId: integer;
    AttemperId : Integer;
    ChgTime : array[0..5] of byte;
    ChgLongitude:longword;
    ChgLatitude :LongWord;
    DriverNo:array[0..9] of byte;
    CurrentState:Byte;{改变后的任务状态	1	0：发车（离开厂区）
                                          1：到达（进入工地区域）
                                          2：卸料（在工地区域内第一次反转）
                                          3：卸完（离开工地区域）
                                          4：回厂（进入厂区） }
  end;
  PCmdSrvTermDevUploadAttemperStateChg = ^TCmdSrvTermDevUploadAttemperStateChg;

{********************  以下是服务器和GPS车载设备之间的命令结构   *********************}
  {IP地址的}
  TInetAddr = packed record
    a: Byte;
    b: Byte;
    c: Byte;
    d: Byte;
  end;

  {  1.1版统一的车机设备命令数据头格式
     @TABB
     @H( 标识    | 类型   | 含义        |参见)
     @R( CmdFlag | byte   | 命令标志    | )
     @R( ExecFlag| byte   | 命令执行状态| )
     @R( DevID   | integer| 设备ID      | )
     @TABE
  }
  TCmdDevHeader = packed record
    Size: Byte;
    DevId: Longword;
    CmdFlag: Byte;
    case integer of
      0: (Execute: Byte);
      1: (CheckSum: Byte);
  end;
  PCmdDevHeader = ^TCmdDevHeader;


  {设备注册服务器,车载设备联网后向服务器发出的验证信息
  DEV_LOGIN        =$FE;}
 {
  包长度	1Byte	包长度为整个数据包的长度。
  设备标识	4Byte
  命令字=0xFE	1Byte
  设备IP	4Byte
  设备Port	2Byte
  协议版本	2Byte
  设备版本	2Byte
  校验	1Byte
 }
  TCmdDevSrvLogon = packed record
    Size: Byte;
    DevId: Longword;
    CmdFlag: Byte;
    DevIP: TInetAddr;
    Port: Word;
    CommVer: TVer;
    DevVer: TVer;
    CheckSum: Byte;
  end;
  PCmdDevSrvLogon = ^TCmdDevSrvLogon;

  {注册命令的返回值 Ret 0x00-注册成功0x01-注册失败}
  TCmdDevSrvLogonRet = packed record
    Size: Byte;
    DevId: Longword;
    CmdFlag: Byte;
    Ret: Byte;
    CheckSum: Byte;
  end;
  PCmdDevSrvLogonRet = ^TCmdDevSrvLogonRet;

  {设备注销
  DEV_LOGOFF       =$FF;
  @TABB
  @H(标识   | 类型    |含义                  |参见)
  @R( size  | Word    |数据包的长度=sizeof() |  )
  @R( DevID | Byte    |设备标识              | )
  @R( CmdFlag |       |命令字                | )
  @R( Execute| Byte   |命令执行状态          | )
  @R(LogOffReason|Byte| 注销原因)
  @R( CheckSum|Byte   |校验 )
  @TABE
  }
  TCmdDevSrvLogOff = packed record
    Size: Byte;
    DevId: Longword;
    CmdFlag: Byte;
    Execute: Byte;
    LogOffReason: Byte;
    CheckSum: Byte;
  end;
  PCmdDevSrvLogOff = ^TCmdDevSrvLogOff;

  {普通GPS数据 DEV_NGPSDATA     =$10;
  命令字=0x10	1Byte
  经度	4Byte	单位（ddd度mm.mmm分）
  纬度	4Byte	单位（ddd度mm.mmm分）
  速度	2Byte	单位 0.1海里/小时 = 0.1852公里/小时
  时间	6Byte	YY-MM-DD HH mm SS
  设备状态	1Byte	Bit0 GPS定位状态  Bit1 GPRS在线状态  其他保留
  OI状态	  1Byte	Bit0 表示报警按钮
  注：此数据中没有 高度 数据
  }
  TCmdDevSrvNGpsData = packed record
    Size: Byte;
    DevId: integer;
    Flag: Byte;
    Long: array[0..3] of Byte;
    Lat: array[0..3] of Byte;
    Speed: array[0..1] of Byte;
    GpsTime: array[0..5] of Byte;
    Stat: Byte;
    Switch: Byte;
    CheckSum: Byte;
  end;
  PCmdDevSrvNGpsData = ^TCmdDevSrvNGpsData;


  {批量的GPS数据,设备发送的批量GPS数据记录
  }
  TBatchGpsData = packed record
    //Long: Integer;
    //Lat:  Integer;
    Long: array[0..3] of Byte;
    Lat: array[0..3] of Byte;
    //Speed: Word;
    Speed: array[0..1] of Byte;
    Stat: Byte;
    Switch: Byte;
  end;
  PBatchGpsData = ^TBatchGpsData;

  {批量GPS数据<br>
  DEV_BGPSDATA     =$12;
  @TABB
  @H(标识    |类型    |含义                  |参见)
  @R( size   |Word    |包长度	1Byte	包长度为整个数据包的长度| )
  @R( DevID  |longword| 设备ID|)
  @R( CmdFlag|Byte    |=$12| )
  @R( ETime  |Byte[6] |最后一条数据时间时间 |)
  @R( InterVal|Word   |间隔时间,设备发送的BigEnd字节顺序的整型| )
  @R( RecordCount|Byte|记录个数 n	1Byte )
  @TABE
  }
  TCmdDevSrvBGpsDataHeader = packed record
    Size: Byte;
    DevId: Longword;
    CmdFlag: Byte;
    ETime: array[0..5] of Byte;
    InterVal: Word;
    RecordCount: Byte;
    //n*record:  TBatchGpsData[]
    //CheckSum:Byte;
  end;
  PCmdDevSrvBGpsDataHeader = ^TCmdDevSrvBGpsDataHeader;

  {跟踪命令  DEV_TRACE        =$13;
  命令字=0x13	1Byte
  命令执行状态	1Byte
  呼叫时间间隔	1Byte	0~255秒
  呼叫持续时间	2Byte	0~3600秒}
  TCmdSrvDevTrace = packed record
    Size: Byte;
    DevId: Longword;
    CmdFlag: Byte;
    ExecFlag: Byte;
    Freq: Byte;
    Time: Word;
    CheckSum: Byte;
  end;
  PCmdSrvDevTrace = ^TCmdSrvDevTrace;

  {远程控制
  DEV_REMOTECTRL   =$14;
  命令执行状态	1Byte
  继电器编号	1Byte
  继电器状态	1Byte	对应的每一位可表示一个继电器
  }
  TCmdSrvDevRemoteCtrl = packed record
    Size: Byte;
    DevId: Longword;
    CmdFlag: Byte;
    ExecFlag: Byte;
    RelayNo: Byte;
    RelaySw: Byte;
    CheckSum: Byte;
  end;
  PCmdSrvDevRemoteCtrl = ^TCmdSrvDevRemoteCtrl;


  {设置参数
  DEV_SETPARAM     =$15;使用通用的数据头处理}
  TCmdSrvDevSetParam = packed record
    Size: Byte;
    DevId: Longword;
    CmdFlag: Byte;
    ExecFlag: Byte;
    //[n of params]
    //CheckSum:Byte;
  end;
  PCmdSrvDevSetParam = ^TCmdSrvDevSetParam;

  {设置参数
  DEV_SETPARAM     =$15;使用通用的数据头处理}
  TCmdDevSrvSetParamRet = packed record
    Size: Byte;
    DevId: Longword;
    CmdFlag: Byte;
    ExecFlag: Byte;
    CheckSum: Byte;
  end;
  PCmdDevSrvSetParamRet = ^TCmdDevSrvSetParamRet;


  {读取参数
  DEV_READPARAM    =$16;
  包长度	1Byte	包长度为整个数据包的长度。
  设备标识	4Byte
  命令字=0x16	1Byte	读取设备参数
  命令执行状态	1Byte	CMD_REQUEST
  }
  TCmdSrvDevReadParam = packed record
    Size: Byte;
    DevId: Longword;
    CmdFlag: Byte;
    ExecFlag: Byte;
    ReadNum: Byte; // add by sha 2004-10-27
    CheckSum: Byte;
  end;
  PCmdSrvDevReadParam = ^TCmdSrvDevReadParam;


  {发送简短消息
  DEV_SENDMSG      =$17;}
  TCmdSrvDevSendMsg = packed record
    Size: Byte;
    DevId: Longword;
    CmdFlag: Byte;
    ExecFlag: Byte;
    MsgID: Word;
    MsgType: Byte;
      //MsgContent[]Bytes
  end;
  PCmdSrvDevSendMsg = ^TCmdSrvDevSendMsg;

  {设备收到后的返回数据DEV_SENDMSG      =$17}
  TCmdDevSrvRecvmsg = packed record
    Size: Byte;
    DevId: Longword;
    CmdFlag: Byte;
    ExecFlag: Byte;
    MsgID: Word;
    AttValue: Word;
    CheckSum: Byte;
  end;
  PCmdDevSrvRecvmsg = ^TCmdDevSrvRecvmsg;

  {发送数据到DTE
  DEV_TODTE        =$18;}
  TCmdSrvDevSendToDTEHdr = packed record
    Size: Byte;
    DevId: Longword;
    CmdFlag: Byte;
    ExecFlag: Byte;
    DataID: Byte;
    DataLen: Byte;
      //..DataContent;   Bytes[]
      //..CheckSum:Byte;
  end;
  PCmdSrvDevSendToDTEHdr = ^TCmdSrvDevSendToDTEHdr;

  TCmdDevSrvSendToDTERet = packed record
    Size: Byte;
    DevId: Longword;
    CmdFlag: Byte;
    ExecFlag: Byte;
    DataID: Byte;
    CheckSum: Byte;
  end;
  PCmdDevSrvSendToDTERet = ^TCmdDevSrvSendToDTERet;

  {设备发送数据到服务器
  从DTE接受数据
  DEV_TOHOST       =$19;}
  TCmdDevSrvSendToHost = packed record
    Size: Byte;
    DevId: Longword;
    CmdFlag: Byte;
    ExecFlag: Byte;
    DataID: Byte;
    DataLen: Byte;
      //..DataContent;   Bytes[]
      //..CheckSum:Byte;
  end;
  PCmdDevSrvSendToHost = ^TCmdDevSrvSendToHost;
  {服务器响应设备已收到数据}
  TCmdSrvDevSendToHostRet = TCmdDevSrvSendToDTERet;
  PCmdSrvDevSendToHostRet = ^TCmdSrvDevSendToHostRet;
  //PING 服务器命令
  //DEVSRV_PING         =$EC;

  (******网关与车机　V2.0 **********)
  {V2.0版的车机命令头}
  TCmdDevHeader_V2 = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    //命令体
    //CheckSum     : Byte;  //校验
  end;
  PCmdDevHeader_V2 = ^TCmdDevHeader_V2;

  {中心给车机的　通用应答 CmdId=DEV_SRVRET_V2}
  TCmdSrvDevAnswer = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字$01
    Answer_CmdOrder: Word; //车机 发命令时的 命令序号
    Answer_CmdFlag: Byte; //车机 发命令时的 命令ID
    Ret: Byte; //处理结果	0：成功　1：失败
    CheckSum: Byte; //校验
  end;
  PCmdSrvDevAnswer = ^TCmdSrvDevAnswer;

  {车机给中心的　通用应答 CmdId=DEV_DEVRET_V2}
  TCmdDevSrvAnswer = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字 $71
    Answer_CmdOrder: Word; //中心　下发命令时的 命令序号
    Answer_CmdFlag: Byte; //中心　下发命令时的 命令ID
    Ret: Byte; //处理结果	0：成功　1：失败
    CheckSum: Byte; //校验
  end;
  PCmdDevSrvAnswer = ^TCmdDevSrvAnswer;

  {车机给中心的通用应答 无校验和 CmdId=DEV_DEVRET_V2　20070602}
  TCmdDevSrvAnswer_NoSum = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字 $71
    Answer_CmdOrder: Word; //中心　下发命令时的 命令序号
    Answer_CmdFlag: Byte; //中心　下发命令时的 命令ID
    Ret: Byte; //处理结果	0：成功　1：失败
    //CheckSum: Byte; //校验
  end;
  PCmdDevSrvAnswer_NoSum = ^TCmdDevSrvAnswer_NoSum;


  {中心－＞车机　定位　CmdId=DEV_GETPOSITION_V2 =$02 }
  TCmdSrvDevGetPostion = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    CheckSum: Byte; //校验
  end;
  PCmdSrvDevGetPostion = ^TCmdSrvDevGetPostion;
  {车机给中心　定位的数据 CmdId=DEV_GPSDATA_V2=$72}
  TCmdDevSrvGpsData_V2 = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    Latitude: integer; //纬度 X 100 0000 如: 值32123456表示：32.123456度
    Longitude: integer; //经度 X 100 0000
    Speed: Byte; //速度　单位：公里/小时，表示范围0～255
    Orientation: Byte; //方向　正北方向为0度，顺时针增加，单位：2度，数值范围0～180。
    State: Longword; //32位状态位
    GpsTime: array[0..5] of Byte; //GPS时间　
    CheckSum: Byte; //校验
  end;
  PCmdDevSrvGpsData_V2 = ^TCmdDevSrvGpsData_V2;

  //无校验和，有Gps时间
  //车机给中心　定位的数据 CmdId=DEV_GPSDATA_V2=$72
  TCmdDevSrvGpsData_NoSum = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    Latitude: integer; //纬度 X 100 0000 如: 值32123456表示：32.123456度
    Longitude: integer; //经度 X 100 0000
    Speed: Byte; //速度　单位：公里/小时，表示范围0～255
    Orientation: Byte; //方向　正北方向为0度，顺时针增加，单位：2度，数值范围0～180。
    State: Longword; //32位状态位
    GpsTime: array[0..5] of Byte; //GPS时间　
    //CheckSum: Byte; //校验
  end;
  PCmdDevSrvGpsData_NoSum = ^TCmdDevSrvGpsData_NoSum;

  //完全按照天泽协议，无Gps时间，无校验和:
  {车机给中心　定位的数据 CmdId=DEV_GPSDATA_V2=$72}
  TCmdDevSrvGpsData_NoSumNoGpsTime = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    Latitude: integer; //纬度 X 100 0000 如: 值32123456表示：32.123456度
    Longitude: integer; //经度 X 100 0000
    Speed: Byte; //速度　单位：公里/小时，表示范围0～255
    Orientation: Byte; //方向　正北方向为0度，顺时针增加，单位：2度，数值范围0～180。
    State: Longword; //32位状态位
    //GpsTime: array[0..5] of Byte; //GPS时间　
    //CheckSum: Byte; //校验
  end;
  PCmdDevSrvGpsData_NoSumNoGpsTime = ^TCmdDevSrvGpsData_NoSumNoGpsTime;
  {中心需判断：是否为紧急报警，如果是，则给出通用应答，否则不应答}

  {中心－＞车机　追踪　CmdId=DEV_PURSUE_V2 =$03}
  TCmdSrvDevPursue = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    PursueInterval: Word; //追踪间隔	单位：秒，最小为0，默认为30，最大为65535（约18小时）
    CheckSum: Byte; //校验
  end;
  PCmdSrvDevPursue = ^TCmdSrvDevPursue;
  {车机 采用 通用应答}

  {中心－＞车机 设定参数 CmdId = DEV_SETPARAM_V2 = $04;}
  TCmdSrvDevSetParam_V2 = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    ParamId: Word; //参数ID
    //参数值 长度不定
    //CheckSum     : Byte;  //校验
  end;
  PCmdSrvDevSetParam_V2 = ^TCmdSrvDevSetParam_V2;
  {车机 采用 通用应答}

  {中心－＞车机　解除报警　CmdId =DEV_REMOVEALARM_V2 =$05}
  TCmdSrvDevRemoveAlarm = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    CheckSum: Byte; //校验
  end;
  PCmdSrvDevRemoveAlarm = ^TCmdSrvDevRemoveAlarm;
  {车机 采用 通用应答}

  {中心－＞车机 修改车机显示屏 主界面公司名称　DEV_MODIFYDEVDISPLAYNAME_V2 = $06}
  TCmdSrvDevModifyDevDisplayname = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    //名称不定长
    //CheckSum     : Byte;  //校验
  end;
  PCmdSrvDevModifyDevDisplayname = ^TCmdSrvDevModifyDevDisplayname;
  {车机 采用 通用应答}

  {中心－＞车机 修改车机显示屏固定菜单 DEV_MODIFYDEVDISPLAYFIXEDMENU_V2  = $07}
  TCmdSrvDevModifyDevDisplayFixedMenu = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    //菜单ID、菜单内容 --不定长
    //CheckSum     : Byte;  //校验
  end;
  PCmdSrvDevModifyDevDisplayFixedMenu = ^TCmdSrvDevModifyDevDisplayFixedMenu;
  {车机 采用 通用应答}

  {中心－＞车机 发送文本调度信息 DEV_SENDCONTROLINFO_V2 = $09;}
  TCmdSrvDevSendControlInfo = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    //调度信息 不定长 ，<200Byte
    //CheckSum     : Byte;  //校验
  end;
  PCmdSrvDevSendControlInfo = ^TCmdSrvDevSendControlInfo;
  {车机 采用 通用应答}

  {中心－＞车机 发送需回复的调度信息 DEV_SENDCONTROLINFO_NEEDANSWER_V2 = $0A}
  TCmdSrvDevSendControlInfo_NeedAnswer = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    MsgID: Word; //调度信息ID
    //调度信息 不定长 ，<200Byte
    //CheckSum     : Byte;  //校验
  end;
  PCmdSrvDevSendControlInfo_NeedAnswer = ^TCmdSrvDevSendControlInfo_NeedAnswer;
  {车机 采用 通用应答}

  {中心－＞车机 设置电话本 DEV_SETTELLIST_V2 = $0F;}
  TCmdSrvDevSetTelList = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    ////电话列表 不定长
    //CheckSum     : Byte;  //校验
  end;
  PCmdSrvDevSetTelList = ^TCmdSrvDevSetTelList;
  {车机 采用 通用应答}

  {中心－＞车机 升级固件 DEV_UPDATEFIRMWARE_V2 = $10}
  TCmdSrvDevUpdateFirmware = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    UpdateType: Byte; //升级设备类型－－0：表示升级主机1：表示升级调度屏
    //URL地址 不定长＜200Byte
    //CheckSum     : Byte;  //校验
  end;
  PCmdSrvDevUpdateFirmware = ^TCmdSrvDevUpdateFirmware;
  {车机 采用 通用应答}

  {中心－＞车机 读参数 DEV_READPARAM_V2 = $11}
  TCmdSrvDevReadParam_V2 = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    ParamId: Word; //   参数ID
    CheckSum: Byte; //校验
  end;
  PCmdSrvDevReadParam_V2 = ^TCmdSrvDevReadParam_V2;
  {车机－＞中心　读参数应答－－　★★在通用应答基础上加上参数值}
  TCmdDevSrvReadParam_V2 = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字  = ★车机应答通用命令字　=DEV_DEVRET_V2=$71
    Answer_CmdOrder: Word; //中心　下发命令时的 命令序号
    Answer_CmdFlag: Byte; //中心　下发命令时的 ★命令ID  = DEV_READPARAM_V2 = $11
    Ret: Byte; //处理结果	0：成功　1：失败
    ParamId: Word; //   参数ID
    //参数值
    //CheckSum     : Byte;  //校验
  end;
  PCmdDevSrvReadParam_V2 = ^TCmdDevSrvReadParam_V2;

  {中心－＞车机 修改车机显示屏 取消订单用的菜单 DEV_MODIFYDEVDISPLAY_CANCELORDERMENU_V2= $08}
  TCmdSrvDevModifyDevDisplay_CancelOrderMenu_V2 = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    { 第1项菜单ID　
      第1项菜单的长度
      第1项菜单的内容
      ...}
    //CheckSum   : Byte;   //校验
  end;
  PCmdSrvDevModifyDevDisplay_CancelOrderMenu_V2 = ^TCmdSrvDevModifyDevDisplay_CancelOrderMenu_V2;
  {车机再给出通用应答}

  {中心－＞车机 下发一条订单供抢答  DEV_DOWNAORDER_V2 = $0B; }
  TCmdSrvDevDownAOrder = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    OrderType: Byte; //订单类型
    OrderID: Word; //订单ID
    OrderDate_yy: Byte; //订单日期 3字节-年
    OrderDate_mm: Byte; //              -月
    OrderDate_dd: Byte; //              -日
    OrderTime_hh: Byte; //订单时间 2字节-时
    OrderTime_nn: Byte; //              -分
    //订单内容  <200
    //CheckSum   : Byte;   //校验
  end;
  PCmdSrvDevDownAOrder = ^TCmdSrvDevDownAOrder;
  {车机不给应答}

  {中心－＞车机 下发一条订单供抢答  DEV_DOWNAORDER_V2 = $0B; }
  TCmdSrvDevDownAOrder_4 = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    OrderType: Byte; //订单类型
    OrderID: integer; //订单ID
    OrderDate_yy: Byte; //订单日期 3字节-年
    OrderDate_mm: Byte; //              -月
    OrderDate_dd: Byte; //              -日
    OrderTime_hh: Byte; //订单时间 2字节-时
    OrderTime_nn: Byte; //              -分
    //订单内容  <200
    //CheckSum   : Byte;   //校验
  end;
  PCmdSrvDevDownAOrder_4 = ^TCmdSrvDevDownAOrder_4;
  //{车机不给应答}
  {20070323-更改为车机应答}

  {中心－＞车机 下发抢单成功 DEV_DOWNGRABEDORDEROK_V2 = $0C; }
  TCmdSrvDevDownGrabOrderOk = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    OrderID: Word; //订单ID
    GuestTelLen: Byte; //用户电话的位数
    //用户的电话	-	电话号码采用ASCII码表示。
    //订单详细内容	<200
    //CheckSum   : Byte;   //校验
  end;
  PCmdSrvDevDownGrabOrderOk = ^TCmdSrvDevDownGrabOrderOk;
  {车机再给出通用应答}

   {中心－＞车机 下发抢单成功 DEV_DOWNGRABEDORDEROK_V2 = $0C; }
  TCmdSrvDevDownGrabOrderOk_4 = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    OrderID: integer; //订单ID
    GuestTelLen: Byte; //用户电话的位数
    //用户的电话	-	电话号码采用ASCII码表示。
    //订单详细内容	<200
    //CheckSum   : Byte;   //校验
  end;
  PCmdSrvDevDownGrabOrderOk_4 = ^TCmdSrvDevDownGrabOrderOk_4;
  {车机再给出通用应答}

  {中心－＞车机 下发抢单失败 DEV_DOWNGRABEDORDERFAIL_V2 = $0D;}
  TCmdSrvDevDownGrabOrderFail = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    OrderID: Word; //订单ID
    CheckSum: Byte; //校验
  end;
  PCmdSrvDevDownGrabOrderFail = ^TCmdSrvDevDownGrabOrderFail;
  {车机再给出通用应答}

  {中心－＞车机 下发抢单失败 DEV_DOWNGRABEDORDERFAIL_V2 = $0D;}
  TCmdSrvDevDownGrabOrderFail_4 = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    OrderID: integer; //订单ID
    CheckSum: Byte; //校验
  end;
  PCmdSrvDevDownGrabOrderFail_4 = ^TCmdSrvDevDownGrabOrderFail_4;
  {车机再给出通用应答}


  {中心－＞车机  下发订单取消  DEV_DOWNCANCELORDER  = $0E;}
  TCmdSrvDevCancelOrder = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    OrderID: Word; //订单ID
    CheckSum: Byte; //校验
  end;
  PCmdSrvDevCancelOrder = ^TCmdSrvDevCancelOrder;
  {车机再给出通用应答}
  {中心－＞车机  下发订单取消  DEV_DOWNCANCELORDER  = $0E;}
  TCmdSrvDevCancelOrder_4 = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    OrderID: integer; //订单ID
    CheckSum: Byte; //校验
  end;
  PCmdSrvDevCancelOrder_4 = ^TCmdSrvDevCancelOrder_4;
  {车机再给出通用应答}

  {车机－＞中心  上传抢单信息 DEV_DEVGRABORDER_V2 = $76}
  TCmdDevSrvGrabOrder = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    OrderID: Word; //订单ID        2
    CheckSum: Byte; //校验
  end;
  PCmdDevSrvGrabOrder = ^TCmdDevSrvGrabOrder;
  {中心不给出通用应答，而是回复抢单成功或抢单失败}

  {车机－＞中心  上传抢单信息 DEV_DEVGRABORDER_V2 = $76
    4字节的订单ID}
  TCmdDevSrvGrabOrder_4 = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    OrderID: integer; //订单ID        2
    CheckSum: Byte; //校验
  end;
  PCmdDevSrvGrabOrder_4 = ^TCmdDevSrvGrabOrder_4;
  //{中心不给出通用应答，而是回复抢单成功或抢单失败}
  {20070323-更改为中心应答,再回复抢单成功或抢单失败}

  {车机－＞中心  上传订单未能完成的原因 DEV_DEVRESON_CANCELORDER_V2=$77}
  TCmdDevSrvReson_CancelOrder = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    OrderID: Word; //订单ID        2
    CancelMenuID: Byte; //取消订单的菜单ID    1
    CheckSum: Byte; //校验
  end;
  PCmdDevSrvReson_CancelOrder = ^TCmdDevSrvReson_CancelOrder;
  {中心再给出通用应答}

  {车机－＞中心  上传订单未能完成的原因 DEV_DEVRESON_CANCELORDER_V2=$77
    4字节的订单ID}
  TCmdDevSrvReson_CancelOrder_4 = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    OrderID: integer; //订单ID        2
    CancelMenuID: Byte; //取消订单的菜单ID    1
    CheckSum: Byte; //校验
  end;
  PCmdDevSrvReson_CancelOrder_4 = ^TCmdDevSrvReson_CancelOrder_4;
  {中心再给出通用应答}

  {车机 -> 中心 司机上传订单完成DEV_UPLOADDONEORDER  = $7F; //}
  TCmdDevSrvUploadDoneOrder_4 = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    OrderID: integer;
    CheckSum: Byte; //校验
  end;
  PCmdDevSrvUploadDoneOrder_4 = ^TCmdDevSrvUploadDoneOrder_4;
  {网关给出非通用应答 DEV_RETUPLOADDONEORDER      = $1A;}
  TCmdSrvDevRetUploadDoneOrder_4 = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    OrderID: integer;
    CheckSum: Byte; //校验
  end;
  PCmdSrvDevRetUploadDoneOrder_4 = ^TCmdSrvDevRetUploadDoneOrder_4;


  {车机－＞中心 上传固定菜单 DEV_DRIVERUPLOADFIXEDMENU_V2 = $73}
  TCmdDevSrvUploadFixedMenu = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    FixedMenuId: Byte; //司机所选择的固定菜单ID
    CheckSum: Byte; //校验
  end;
  PCmdDevSrvUploadFixedMenu = ^TCmdDevSrvUploadFixedMenu;
 {中心再给出通用应答}

  {车机－＞中心 司机对 需回复的调度信息的 回复 DEV_SENDCONTROLINFO_DRIVERANSWER_V2= $74}
  TCmdDevSrvSendControlInfo_DriverAnswer = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    MsgID: Word; //调度信息ID，从数据库中取值
    AnswerInfo: Byte; //司机反馈信息 - 0：否  1：是
    CheckSum: Byte; //校验
  end;
  PCmdDevSrvSendControlInfo_DriverAnswer = ^TCmdDevSrvSendControlInfo_DriverAnswer;
  {中心再给出通用应答}

  {车机－＞中心 上传计价器营运数据  DEV_TAXIMETERRUNDATA_V2= $75}
  TCmdDevSrvTaxiMeterRunData = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    {数据体}
  end;
  PCmdDevSrvTaxiMeterRunData = ^TCmdDevSrvTaxiMeterRunData;

  {车机－＞中心 车机上传的计价器确认的停机时间 DEV_TAXIMETERCONFIRMSTOPTIM_V2    = $7C}
  TCmdDevSrvTaxiMeterConfirmStopTime = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    StopTime: array[0..4] of Byte; //BCD码 XX XX 年XX月XX日XX时
    CheckSum: Byte; //校验
  end;
  PCmdDevSrvTaxiMeterConfirmStopTime = ^TCmdDevSrvTaxiMeterConfirmStopTime;

  {车机－＞中心  车机登录 DEV_LOGIN_V2  = $7B}
  TCmdDevSrvLogin_V2 = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    Latitude: integer; //纬度 X 100 0000 如: 值32123456表示：32.123456度
    Longitude: integer; //经度 X 100 0000
    Speed: Byte; //速度　单位：公里/小时，表示范围0～255
    Orientation: Byte; //方向　正北方向为0度，顺时针增加，单位：2度，数值范围0～180。
    State: Longword; //32位状态位
    GpsTime: array[0..5] of Byte;
    CheckSum: Byte; //校验
  end;
  PCmdDevSrvLogin_V2 = ^TCmdDevSrvLogin_V2;
  {中心再给出通用应答}
  {车机->中心 车机从服务器注销  DEV_LOGOUT_V2 = $89 }
  TCmdDevSrvLogOut_V2 = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    Latitude: integer; //纬度 X 100 0000 如: 值32123456表示：32.123456度
    Longitude: integer; //经度 X 100 0000
    Speed: Byte; //速度　单位：公里/小时，表示范围0～255
    Orientation: Byte; //方向　正北方向为0度，顺时针增加，单位：2度，数值范围0～180。
    State: Longword; //32位状态位
    GpsTime: array[0..5] of Byte;
    CheckSum: Byte; //校验
  end;
  PCmdDevSrvLogOut_V2 = ^TCmdDevSrvLogOut_V2;
  {车机－＞中心　上传参数，暂不做}
  TCmdDevSrvUpdateParam = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    ReadRet: Byte; //   查询结果0：成功  1：失败
    ParamId: Word; //   参数ID
    ParamLen: Byte; //   参数长度
    //参数值
    //CheckSum     : Byte;  //校验
  end;

  {中心给车机下发断油/断电/供油/供电命令 DEV_CUTORFEED_OIL_ELECTRICITY     = $16; }
  TCmdSrvDevCutOrFeedOilOrElectricity = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    Content: Word; //详细内容： 断油/断电/供油/供电
    CheckSum: Byte; //校验
  end;
  PCmdSrvDevCutOrFeedOilOrElectricity = ^TCmdSrvDevCutOrFeedOilOrElectricity;
  {车机再给通用应答}

  {中心-> 车机 读测试数据 DEV_READTESTDATA = $AA}
  TCmdSrvDevReadTestData = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    CheckSum: Byte; //校验
  end;
  PCmdSrvDevReadTestData = ^TCmdSrvDevReadTestData;
  {车机-> 中心 上传测试数据 DEV_UPLOADTESTDATA= $FA}
  TCmdDevsrvRetReadTestData = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    TestData: array[0..19] of Byte; //20字节的测试数据
    CheckSum: Byte; //校验
  end;
  PCmdDevsrvRetReadTestData = ^TCmdDevsrvRetReadTestData;

  {中心-> 车机 读版本数据  DEV_READDEVVER = $AB;}
  TCmdSrvDevReadDevVer = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    CheckSum: Byte; //校验
  end;
  PCmdSrvDevReadDevVer = ^TCmdSrvDevReadDevVer;
  {车机-> 中心 上传车机版本 DEV_UPLOADDEVVER= $FB}
  TCmdDevSrvRetReadDevVer = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    //版本数据　＜＝32    AscII码         　
    //CheckSum   : Byte;    //校验
  end;
  PCmdDevSrvRetReadDevVer = ^TCmdDevSrvRetReadDevVer;

  //新增司机相关命令 2006-8-25
  {中心-> 车机 设置司机信息 DEV_SETDRIVERS  = $17;}
  TCmdSrvDevSetDrivers = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    DriverNo1: array[0..9] of char; //定长.不足部份补0
    DriverName1: array[0..19] of char;
    DriverNo2: array[0..9] of char;
    DriverName2: array[0..19] of char;
    DriverNo3: array[0..9] of char;
    DriverName3: array[0..19] of char;
    DriverNo4: array[0..9] of char;
    DriverName4: array[0..19] of char;
    CheckSum: Byte; //校验
  end;
  PCmdSrvDevSetDrivers = ^TCmdSrvDevSetDrivers;
  {车机给出通用应答}

  {中心-> 车机 读取司机信息 DEV_READDRIVERS   = $18;}
  TCmdSrvDevReadDrivers = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    CheckSum: Byte; //校验
  end;
  PCmdSrvDevReadDrivers = ^TCmdSrvDevReadDrivers;
  {车机　回复}
  TCmdDevSrvRetReadDrivers = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    DriverNo1: array[0..9] of char; //定长.不足部份补0
    DriverName1: array[0..19] of char;
    DriverNo2: array[0..9] of char;
    DriverName2: array[0..19] of char;
    DriverNo3: array[0..9] of char;
    DriverName3: array[0..19] of char;
    DriverNo4: array[0..9] of char;
    DriverName4: array[0..19] of char;
    CheckSum: Byte; //校验
  end;
  PCmdDevSrvRetReadDrivers = ^TCmdDevSrvRetReadDrivers;

  {中心-> 车机 读取当前司机 DEV_READCURRENTDRIVER = $19;}
  TCmdSrvDevReadCurrentDriver = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    CheckSum: Byte; //校验
  end;
  PCmdSrvDevReadCurrentDriver = ^TCmdSrvDevReadCurrentDriver;


  {车机 ->中心　上传当前司机　DEV_UPLOADCURRENTDRIVER = $7D;--可能是中心读取的应答，也可能是主动上传的}
  TCmdDevSrvUploadCurrentDriver = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    DriverNo: array[0..9] of Byte;
    LoginTime: array[0..5] of Byte;
    CheckSum: Byte; //校验
  end;
  PCmdDevSrvUploadCurrentDriver = ^TCmdDevSrvUploadCurrentDriver;

  {车机-》中心 上传车辆进站或出站 DEV_INORDOWNSTATION=$84}
  TCmdDevSrvInOrDownStation = packed record
    Size: Word;
    DevFaction: Byte;
    DevId: integer;
    ComVer: Byte;
    CmdOrder: Word;
    CmdFlag: Byte;
    StationNo: Byte;
    Direct: Byte;
    InOrDown: Byte;
    CheckSum: Byte;
  end;
  PCmdDevSrvInOrDownStation = ^TCmdDevSrvInOrDownStation;
  {车机->中心  上传车辆超速记录 DEV_OVERSPEEDINFO = $86}
  TCmdDevSrvOverSpeedInfo = packed record
    Size: Word;
    DevFaction: Byte;
    DevId: integer;
    ComVer: Byte;
    CmdOrder: Word;
    CmdFlag: Byte;
    AreaNo: integer; //区域编号
    OverSpeedTime: array[0..5] of byte; //时间
    IsBegin: byte; //0->开始 1->结束
  end;
  PCmdDevSrvOverSpeedInfo = ^TCmdDevSrvOverSpeedInfo;
  {车机-》中心  上传停车记录 DEV_DEVSTOPINFO = $85}
  TCmdDevSrvStopInfo = packed record
    Size: Word;
    DevFaction: Byte;
    DevId: integer;
    ComVer: Byte;
    CmdOrder: Word;
    CmdFlag: Byte;
    Num: byte;
    //停车数据
  end;
  PCmdDevSrvStopInfo = ^TCmdDevSrvStopInfo;
  {车机-》中心 上传存储的定位数据 DEV_SAVEGPSDATA = $87}
  TCmdDevSrvSaveGpsdata = packed record
    Size: Word;
    DevFaction: Byte;
    DevId: integer;
    ComVer: Byte;
    CmdOrder: Word;
    CmdFlag: Byte;
     //不定长的GPS定位数据
  end;
  PCmdDevSrvSaveGpsdata = ^TCmdDevSrvSaveGpsdata;
  {车机 -> 中心 上传司机下班退出 DEV_UPLOADDRIVERLOGOUT }
  TCmdDevSrvUploadDriverLogOut = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    DriverNo: array[0..9] of Byte;
    LogOutTime: array[0..5] of Byte;
    CheckSum: Byte; //校验
  end;
  PCmdDevSrvUploadDriverLogOut = ^TCmdDevSrvUploadDriverLogOut;
  {中心给出通用应答}

  //中心-> 车机 让车机拍一张照片DEV_GETAPIC = $1B;
  TCmdSrvDevGetAPic = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    GetPicSize: Byte; //照片尺寸大小 0=320x240  1=640x480  2-else
    CameraIndex: Byte; //摄像头号
    CheckSum: Byte; //校验
  end;
  PCmdSrvDevGetAPic = ^TCmdSrvDevGetAPic;
  //车机回复 通用应答

   //车机 -> 中心 车机已成功将照片上传  DEV_APICUPLOADED= $80
  TCmdDevSrvAPicUploaded = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    PicIndex: integer; //车机的照片序号
    CameraIndex: Byte; //摄像头号
    PicReson: Byte; //拍照原因
    DoneRet: Byte; //拍照结果　0-成功，1-照片缓冲区満2-摄像头故障3-传输失败
    CheckSum: Byte; //校验
  end;
  PCmdDevSrvAPicUploaded = ^TCmdDevSrvAPicUploaded;
  {中心给出通用应答}

  // 20070518 流量
  //网关->车机，读取当前流量  DEV_READFLUX = $1C;
  TCmdSrvDevReadFlux = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    CheckSum: Byte; //校验
  end;
  PCmdSrvDevReadFlux = ^TCmdSrvDevReadFlux;
   //车机 上传流量DEV_UPLOADFLUX = $81;
  TCmdDevSrvUploadFlux = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    Link1Up: Integer; //连接1的上行流量
    Link1Down: Integer; //连接1的下行流量
    Link2Up: Integer; //连接2的上行流量
    Link2Down: Integer; //连接2的下行流量
    Link3Up: Integer; //连接3的上行流量
    Link3Down: Integer; //连接3的下行流量
    Link4Up: Integer; //连接4的上行流量
    Link4Down: Integer; //连接4的下行流量
    Link5Up: Integer; //连接5的上行流量
    Link5Down: Integer; //连接5的下行流量
    Link6Up: Integer; //连接6的上行流量
    Link6Down: Integer; //连接6的下行流量
    CheckSum: Byte; //校验
  end;
  PCmdDevSrvUploadFlux = ^TCmdDevSrvUploadFlux;

  //2007-8-23 增加广告相关命令
  //网关->车机，下发一条广告信息 DEV_DOWNANAD = $1D;
  TCmdSrvDevDownAnAd = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    AdId: Integer; // 广告ID
    AdLen: Byte; // 广告内容的长度
    //AdContent:       广告详细内容 <200Byte
    //CheckSum: Byte; //校验
  end;
  PCmdSrvDevDownAnAd = ^TCmdSrvDevDownAnAd;
  {车机回复通用命令应答}

  //删除一条广告信息DEV_DELANAD  = $1E;
  TCmdSrvDevDelAnAd = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    AdId: Integer; // 广告ID
    CheckSum: Byte; //校验
  end;
  PCmdSrvDevDelAnAd = ^TCmdSrvDevDelAnAd;
  {车机回复通用命令应答}

  //删除所有广告信息  DEV_DELALLAD = $1F;
  TCmdSrvDevDelAllAd = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    CheckSum: Byte; //校验
  end;
  PCmdSrvDevDelAllAd = ^TCmdSrvDevDelAllAd;
  {车机回复通用命令应答}

  //网关->车机，读取车机内所有广告的ID DEV_READALLADID = $20;
  TCmdSrvDevReadAllAdId = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    CheckSum: Byte; //校验
  end;
  PCmdSrvDevReadAllAdId = ^TCmdSrvDevReadAllAdId;
  //车机回复：上传车机内所有广告的ID DEV_UPLOADALLADID = $82;
  TCmdDevSrvUploadAllAdId = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    //AdId1: Integer;
    //...AdIdn: Integer;
    //CheckSum: Byte; //校验
  end;
  PCmdDevSrvUploadAllAdId = ^TCmdDevSrvUploadAllAdId;

  //网关->车机，下发车辆方向显示内容 DEV_DOWNALLWAY  = $21;
  TCmdSrvDevDownAllWay = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    //WayId1:Integer;
    //WayLen1 : Byte;
    //WayContent : <50
    //...
    //CheckSum: Byte; //校验
  end;
  PCmdSrvDevDownAllWay = ^TCmdSrvDevDownAllWay;
  {车机回复通用命令应答}

  //网关->车机，下载AES密钥 DEV_DOWNAESKEY  = $23;  2007-08-30
  TCmdSrvDevDownAesKey = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    DESKey: array[0..7] of byte;
    CheckSum: Byte; //校验
  end;
  PCmdSrvDevDownAesKey = ^TCmdSrvDevDownAesKey;
  {车机回复加密后的通用命令应答}

  //网关->车机，设置车机主动拨打的监听电话号码  DEV_DOWNLISTENCALLNUM = $24;  //2007-9-24
  TCmdSrvDevDownListenCallNum = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    //CallNum: ＜20　ASCII码
    //CheckSum: Byte; //校验
  end;
  PCmdSrvDevDownListenCallNum = ^TCmdSrvDevDownListenCallNum;
  {车机回复通用命令应答}
  //网关->车机，发送通用命令
  TCmdSrcDevGenericCommand = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    //MinorCmdFlag : Byte; //次命令字
    //命令内容
    //CheckSum:Byte;//校验
  end;
  PCmdSrcDevGenericCommand = ^TCmdSrcDevGenericCommand;
  {车机回复通用命令应答}

  //网关下发一条公交站点信息  DEV_DOWNABUSSTATIONINFO= $26;
  TCmdSrvDevDownABusStationInfo = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    BusStationId: Byte;
    //BusStationInfo
    //CheckSum:Byte;//校验
  end;
  PCmdSrvDevDownABusStationInfo = ^TCmdSrvDevDownABusStationInfo;
  {车机回复通用命令应答}
  //网关下发一条清除车机站点信息命令  DEV_CLEARBUSSTATIONINFO = $27;
  TCmdSrvDevClearABusStationInfo = packed record
    Size: Word;
    DevFactory: Byte; //车机厂商
    DevId: integer;
    ComVer: Byte; //协议版本
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //命令字
    CheckSum: Byte; //校验
  end;
  PCmdSrvDevClearABusStationInfo = ^TCmdSrvDevClearABusStationInfo;
  {车机回复通用应答}
  {*******************2006-5-30 增加WEB服务器与网关的通讯协议********}
  //Web服务器给网关命令的 通用命令头
  TCmdWebSrvHeader = packed record
    Header: Word; //协议头，固定为$FF FF
    Size: Word; //总长度
    DevId: integer; //去掉第一个数字1的SIM卡号码
    ComVer: Byte; //协议版本号=2
    CmdOrder: Word; //命令序号
    CmdFlag: Byte;
    //命令 内容：各命令长度不定
    //CheckSum
  end;
  PCmdWebSrvHeader = ^TCmdWebSrvHeader;

  //网关转发车机GPS数据给WEB服务器  WEB_SRVTRANSGPSDATA
  TCmdSrvWebTransGpsData = packed record
    Header: Word; //协议头，固定为$FF FF
    Size: Word; //总长度
    DevId: integer; //去掉第一个数字1的SIM卡号码
    ComVer: Byte; //协议版本号=2
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //WEB_SRVTRANSGPSDATA
    Latitude: integer; //纬度 X 100 0000 如: 值32123456表示：32.123456度
    Longitude: integer; //经度 X 100 0000
    Speed: Byte; //速度　单位：公里/小时，表示范围0～255
    Orientation: Byte; //方向　正北方向为0度，顺时针增加，单位：2度，数值范围0～180。
    State: Longword; //32位状态位
    GpsTime: array[0..5] of Byte; // GPS时间
    CheckSum: Byte; //校验位
  end;
  PCmdSrvWebTransGpsData = ^TCmdSrvWebTransGpsData;

  {WEB服务器 查询车机最后点的定位数据 WEB_GETLASTPOS}
  TCmdWebSrvGetLastPos = packed record
    Header: Word; //协议头，固定为$FF FF
    Size: Word; //总长度
    DevId: integer; //去掉第一个数字1的SIM卡号码
    ComVer: Byte; //协议版本号=2
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //WEB_GETLASTPOS
    CheckSum: Byte; //校验位
  end;
  PCmdWebSrvGetLastPos = ^TCmdWebSrvGetLastPos;
  {网关回复WEB服务器}
  TCmdSrvWebGetLastPos = packed record
    Header: Word; //协议头，固定为$FF FF
    Size: Word; //总长度
    DevId: integer; //去掉第一个数字1的SIM卡号码
    ComVer: Byte; //协议版本号=2
    Answer_CmdOrder: Word; //回复的命令 序号
    Answer_CmdFlag: Byte; //回复的命令字   = WEB_GETLASTPOS
    Answer_Ret: Byte; //回复执行结果  0-执行成功，1-无效的车机ID
    Latitude: integer; //纬度 X 100 0000 如: 值32123456表示：32.123456度
    Longitude: integer; //经度 X 100 0000
    Speed: Byte; //速度　单位：公里/小时，表示范围0～255
    Orientation: Byte; //方向　正北方向为0度，顺时针增加，单位：2度，数值范围0～180。
    State: Longword; //32位状态位
    GpsTime: array[0..5] of Byte; // GPS时间
    CheckSum: Byte; //校验位
  end;
  PCmdSrvWebGetLastPos = ^TCmdSrvWebGetLastPos;

  { WEB服务器 发送断油断电 WEB_CUTORFEED_OIL_ELECTRICITY  = $D1; }
  TCmdWebSrvCutOrFeedOilElectricity = packed record
    Header: Word; //协议头，固定为$FF FF
    Size: Word; //总长度
    DevId: integer; //去掉第一个数字1的SIM卡号码
    ComVer: Byte; //协议版本号=2
    CmdOrder: Word; //命令序号
    CmdFlag: Byte; //WEB_CUTORFEED_OIL_ELECTRICITY
    Content: Word; //操作内容1 -断油  2-断电 3-供油 4-供电
    CheckSum: Byte; //校验位
  end;
  PCmdWebSrvCutOrFeedOilElectricity = ^TCmdWebSrvCutOrFeedOilElectricity;
  {网关收到车机的应答后，回复WEB服务器}
  TCmdSrvWebCutOrFeedOilElectricity = packed record
    Header: Word; //协议头，固定为$FF FF
    Size: Word; //总长度
    DevId: integer; //去掉第一个数字1的SIM卡号码
    ComVer: Byte; //协议版本号=2
    Answer_CmdOrder: Word; //回复的命令序号
    Answer_CmdFlag: Byte; //回复的命令字 =WEB_CUTORFEED_OIL_ELECTRICITY
    Answer_Ret: Byte; //	0-执行成功，1-无效的车机ID，2-执行超时
    CheckSum: Byte; //校验位
  end;
  PCmdSrvWebCutOrFeedOilElectricity = ^TCmdSrvWebCutOrFeedOilElectricity;

  (************* 系统管理端ADM 与 网关SRV 之间 2006-8-22 新增*************)
  //系统管理端->网关 取得用户列表  ADMSRV_GETUSERLIST  = $70;
  TCmdAdmSrvGetUserList = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
  end;
  PCmdAdmSrvGetUserList = ^TCmdAdmSrvGetUserList;
  TLogUserInfo = packed record //登录监控端用户信息
    UserID: integer;
    LogTime: TDateTime;
    IPAddr: string[15];
  end;
  PLogUserInfo = ^TLogUserInfo;
   // 网关回复 SRVADM_GETUSERLIST  = $E0;
  TCmdSrvAdmGetUserList = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    UserCnt: integer; //当前用户个数
    //UserList-- array of TLogUserInfo
    //Ret : Byte;
  end;
  PCmdSrvAdmGetUserList = ^TCmdSrvAdmGetUserList;

  //系统管理端->网关 断开某个用户 ADMSRV_CUTAUSER     = $71;
  TCmdAdmSrvCutAUser = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    UserID: integer;
  end;
  PCmdAdmSrvCutAUser = ^TCmdAdmSrvCutAUser;
  // 网关回复 SRVADM_CUTAUSER    = $E2
  TCmdSrvAdmCutAUser = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    UserID: integer;
    Ret: Byte; // 回复
  end;
  PCmdSrvAdmCutAUser = ^TCmdSrvAdmCutAUser;
  //网关->监控端  系统管理端让监控端 关闭自身  SRVTERM_CUTSELF    = $B3;★★
  TCmdSrvTermCutSelf = packed record
    Size: Word;
    Flag: Byte;
  end;
  PCmdSrvTermCutSelf = ^TCmdSrvTermCutSelf;

  //系统管理端->网关  发送信息给某个用户 ADMSRV_SENDMSG2AUSER= $72
  TCmdAdmSrvSendMsg2AUser = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    UserID: integer;
    //msgInfo:string;
  end;
  PCmdAdmSrvSendMsg2AUser = ^TCmdAdmSrvSendMsg2AUser;
  //网关回复 SRVADM_SENDMSG2AUSER= $E3;
  TCmdSrvAdmSendMsg2AUser = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    UserID: integer;
    Ret: Byte;
  end;
  PCmdSrvAdmSendMsg2AUser = ^TCmdSrvAdmSendMsg2AUser;
  //网关->监控端 系统管理端 发送信息 SRVTERM_ADMSENDMSG = $B4★★
  TCmdSrvTermAdmSendMsg = packed record
    Size: Word;
    Flag: Byte;
    //msgInfo:string;
  end;
  PCmdSrvTermAdmSendMsg = ^TCmdSrvTermAdmSendMsg;

  //网关->管理端 用户有变化SRVADM_USERCHG  = $E4;
  TCmdSrvAdmUserChg = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    UserID: integer;
    LogFlag: Byte; //0-退出 1-登录
    LogUserInfo: TLogUserInfo;
  end;
  PCmdSrvAdmUserChg = ^TCmdSrvAdmUserChg;

{****************************  其他命令结构定义   *****************************}
  //网关告知webService　数据库已刷新（车机用户对照表已有改变）
  TCmdSrvTermTellDbRefresh = packed record
    Size: word;
    Flag: Byte;
  end;

  (*****************调度服务器　与　网关的通讯　2006-11-17 SHA**** 20070709 sha.添加到此软件，合成处理2种订单*****)
  {调度->网关，下发一条订单,订单的第一次下发 DISPSRVFIRSTDOWNAORDER = $40}
  TCmdDispSrvFirstDownAOrder = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    OrderID: integer; //订单ID ★★★调度<->网关采用的是Integer; 网关<->车机采用Word
    OrderType: Byte; //订单类型
    OrderDateTime: TDateTime; //订单日期、时间 --至少要比现在时间大　10分钟
    CallNum: Byte; //要车数量
    OverTimes: integer; //超时时间 单位：秒
    SendToDevCnt: Byte; //下发给多少个车机
    FirstDevId: integer; //第一个车机的ＩＤ号
    //订单内容长度     1
    //订单内容         <200  ASCII码
    //乘客电话长度     1
    //乘客电话　             ASCII码
    //订单详细内容长度 1
    //订单详细内容     <200  ASCII码
  end;
  PCmdDispSrvFirstDownAOrder = ^TCmdDispSrvFirstDownAOrder;
  {网关回复}
  TCmdSrvDispFirstDownAOrder = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    OrderID: integer; //订单ID
    Ret: Byte;
  end;
  PCmdSrvDispFirstDownAOrder = ^TCmdSrvDispFirstDownAOrder;

  {调度->网关，订单的非初次下发，延时后下发给下一个车辆DISPSRVNEXTDOWNAORDER = $41;}
  TCmdDispSrvNextDownAOrder = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    OrderID: integer; //订单ID
    NextDevId: integer; // 下一个车机ID
  end;
  PCmdDispSrvNextDownAOrder = ^TCmdDispSrvNextDownAOrder;
  TCmdSrvDispNextDownAOrder = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    OrderID: integer; //订单ID
    Ret: Byte;
  end;
  PCmdSrvDispNextDownAOrder = ^TCmdSrvDispNextDownAOrder;

  {网关->调度服务器　超时没车抢单}
  TCmdSrvDispOrderNoDevGrab = packed record
    Size: Word;
    Flag: Byte;
    OrderID: integer; //订单ID
  end;
  PCmdSrvDispOrderNoDevGrab = ^TCmdSrvDispOrderNoDevGrab;

  {网关->调度服务器　来抢单的车辆列表　及抢单成功的车辆列表 SRVDISPGRABDEVSANDGRABOKDEVS= $62;}
  TCmdSrvDispGrabDevsAndGrabOkDevs = packed record
    Size: Word;
    Flag: Byte;
    OrderID: integer; //订单ID
    CallNum: Byte;
    GrabDevCnt: Byte; //来抢单的车辆数
    GrabOkDevCnt: Byte; //抢单成功的车辆数
    //GrabDevList   　//来抢单的　 车机ID(Integer)列表
    //GrabOkDevList   //抢单成功的 车机ID(Integer)列表
  end;
  PCmdSrvDispGrabDevsAndGrabOkDevs = ^TCmdSrvDispGrabDevsAndGrabOkDevs;

  {网关->调度 订单完成SRVDISPDEVDONEORDER = $63; }
  TCmdSrvDispDevDoneOrder = packed record
    Size: Word;
    Flag: Byte;
    OrderID: integer; //订单ID
    DoneDevId: integer; //完成订单的车机ID
  end;
  PCmdSrvDispDevDoneOrder = ^TCmdSrvDispDevDoneOrder;

  {网关->调度　司机取消订单－－与原来的结构相同，但名称的定义不一样SRVDISPDEVCANCELORDER = $64;}
  TCmdSrvDispDevCancelOrder = packed record
    Size: Word;
    Flag: Byte;
    OrderID: integer;
    AskCancelDevId: integer; //请求取消订单的　车机ＩＤ
    CancelMenuID: Byte; //取消订单的菜单ID
  end;
  PCmdSrvDispDevCancelOrder = ^TCmdSrvDispDevCancelOrder;

  {调度->网关　中心取消某车的订单 DISPSRVCANCELADEVORDER = $45;}
  TCmdDispSrvCancelADevOrder = packed record
    Size: Word;
    Flag: Byte;
    OrderID: integer;
    CancelDevId: integer; //中心取消的车机 ID
  end;
  PCmdDispSrvCancelADevOrder = ^TCmdDispSrvCancelADevOrder;
  {网关的回复　SRVDISPRETCANCELADEVORDER = $65;}
  TCmdSrvDispRetCancelADevOrder = packed record
    Size: Word;
    Flag: Byte;
    OrderID: integer;
    CancelDevId: integer; //中心取消的车辆
    Ret: Byte; //0-命令执行成功  1-此订单不存在
  end;
  PCmdSrvDispRetCancelADevOrder = ^TCmdSrvDispRetCancelADevOrder;

  {调度->网关 用户车机对照表有改变  SRVDISPUSERDEVCHANGED     = $66; }
  TCmdSrvDispUserDevChanged = packed record
    Size: Word;
    Flag: Byte;
  end;
  PCmdSrvDispUserDevChanged = ^TCmdSrvDispUserDevChanged;

  {调度->网关　发送文本调度－－－无MsgId，调度专用DISPSRVSENDCONTROLINFO    = $47;}
  TCmdDispSrvSendControlInfo = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    //无MsgID: Word;   //调度信息ID，从数据库中取值
    //调度信息 不定长 ，<200Byte
  end;
  PCmdDispSrvSendControlInfo = ^TCmdDispSrvSendControlInfo;
  {网关回复}
  TCmdSrvDispSendControlInfo = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    //无MsgID: Word;   //调度信息ID，从数据库中取值
    Ret: Byte;
  end;
  PCmdSrvDispSendControlInfo = ^TCmdSrvDispSendControlInfo;

  //调度->网关，下发一条订单  DISPSRV_DOWNAORDER = $49; 网关只管下发，不记入内存
  TCmdDispSrvDownAOrder = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer; // 要下发的车机ID
    OrderID: integer; //订单ID
    OrderType: Byte; //订单类型
    OrderDate_yy: Byte; //订单日期 3字节-年   全用十六进制表示
    OrderDate_mm: Byte; //              -月        如:12，表示为0C
    OrderDate_dd: Byte; //              -日
    OrderTime_hh: Byte; //订单时间 2字节-时
    OrderTime_nn: Byte; //              -分
    //订单内容  <200
  end;
  PCmdDispSrvDownAOrder = ^TCmdDispSrvDownAOrder;
   //   网关回复（只在无此车机时回复）SRVDISP_DOWNAORDER = $69
  TCmdSrvDispDownAOrder = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer; // 要下发的车机ID
    OrderID: integer; //订单ID
    Ret: Byte; //无此车机 ERR_INVALIDDEV=$13;
  end;
  PCmdSrvDispDownAOrder = ^TCmdSrvDispDownAOrder;

  // 网关->调度　车机抢单   SRVDISP_DEVGRABORDER = $6A;
  TCmdSrvDispDevGrabOrder = packed record
    Size: Word;
    Flag: Byte;
    DevId: integer; //车机ID
    OrderID: integer; //订单ID
  end;
  PCmdSrvDispDevGrabOrder = ^TCmdSrvDispDevGrabOrder;

   // 调度->网关，给车机下发抢单成功DISPSRV_DOWNGRABOK  = $4B;
  TCmdDispSrvDownGrabOk = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer; //车机ID
    OrderID: integer; //订单ID
    GuestTelLen: Byte; //用户电话的位数
    //用户的电话	-	电话号码采用ASCII码表示。
    //订单详细内容	<200
  end;
  PCmdDispSrvDownGrabOk = ^TCmdDispSrvDownGrabOk;
  //   网关回复 （无此车机、收到车机对下发抢单成功的应答、下发抢单成功给车机超时)  SRVDISP_DOWNGRABOK  = $6B
  TCmdSrvDispDownGrabOk = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer; //车机ID
    OrderID: integer; //订单ID
    Ret: Byte; //收到车机对下发抢单成功的应答RET_OK=0、
                         //无此车机 ERR_INVALIDDEV=$13;
                         //下发抢单成功给车机超时(命令执行超时失败ERR_TIMEOUT=$16;)
  end;
  PCmdSrvDispDownGrabOk = ^TCmdSrvDispDownGrabOk;

  //调度->网关，给车机下发抢单失败   DISPSRV_DOWNGRABFAIL = $4C;
  TCmdDispSrvDownGrabFail = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer; //车机ID
    OrderID: integer; //订单ID
  end;
  PCmdDispSrvDownGrabFail = ^TCmdDispSrvDownGrabFail;
  // 网关回复（只在无此车机。对于命令下发的超时不处理）SRVDISP_DOWNGRABFAIL = $6C;
  TCmdSrvDispDownGrabFail = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer; //车机ID
    OrderID: integer; //订单ID
    Ret: Byte; //无此车机 ERR_INVALIDDEV=$13;
  end;
  PCmdSrvDispDownGrabFail = ^TCmdSrvDispDownGrabFail;


{*******************************业务服务器和客户端结构定义********************************}
  TMyPhoto = packed record
    Size: integer;
    PhotoReasonID: integer; //拍照原因
    GpsTime: TDateTime; //GPS时间
    Longitude: Double; //经度
    Latitude: Double; //纬度
    TakeBeginTime: TDateTime; //拍照开始时间
    TkeEndTime: TDateTime; //拍照结束时间
    PhotoSize: integer; //照片大小
    PhotoType: integer; //照片类型
    PicIndex: integer; //照片序号
    PhotoMeasure: integer; //照片尺寸
    CameraIndex: Byte;
    //Photo:TByteDynArray;     //照片内容,不定长大小
  end;
  PMyPhoto = ^TMyPhoto;


//------------------------------------------------------------------------------
  TCmdSrvTermAreaAlarm_V3 = packed record
    Header: THead_V3;
    AreaNo: Integer;//围栏编号
    AlarmType: Byte;//0：出区域报警 1：进区域报警 2：路线报警3：聚集报警 4：出城溜台 5：疑似上访
    //报警设备编号组	BCD[5]*N
  end;
  PCmdSrvTermAreaAlarm_V3 = ^TCmdSrvTermAreaAlarm_V3;

  //透传命令的头
  TCmdTSPHead_V3 = packed record
    //SPosFlag:  Byte;//起始位标识 0x7E
    CmdFlag: Word;
    CmdProperty: Word;
    DevId: TDEV_ID_BCD_ZDCL;
    CmdSNo: Word;
    //消息封装项 消息体属性中相关标识位确定消息分包处理 则该项有内容(目前系统中暂不做分包处理)
  end;
  PCmdTSPTHead_V3 = ^TCmdTSPHead_V3;

  //透传命令的头
  TCmdTSPTHeadHRB_V3 = packed record
    SPosFlag:  Word;//起始位标识 0x7E
    CmdFlag: Word;
    CmdProperty: Word;
    CmdSNo: Word;
    Ver: Byte;
    DevId: TDEV_ID_BCD_HRB;
    //消息封装项 消息体属性中相关标识位确定消息分包处理 则该项有内容(目前系统中暂不做分包处理)
  end;
  PCmdTSPTHeadHRB_V3 = ^TCmdTSPTHeadHRB_V3;

  TCmdTSPSetDevParam_V3 = packed record
    TSPHeader: TCmdTSPHead_V3;
    ParamCnt :Byte;  //参数总数	UINT8
//    ParamPackCnt:Byte;//包参数个数	UINT8
    //参数项列表:
    ParamId: LongWord;
    ParamSize: Byte;
  end;
  PCmdTSPSetDevParam_V3 = ^TCmdTSPSetDevParam_V3;

  TCmdTSPSetAllDevParam_V3 = packed record
    TSPHeader: TCmdTSPHead_V3;
    ParamCnt :Byte;  //参数总数	UINT8
    //参数项列表:
    //ParamId: LongWord;
    //ParamSize: Byte;
  end;
  PCmdTSPSetAllDevParam_V3 = ^TCmdTSPSetAllDevParam_V3;

  TCmdTSPReadDevParam_V3 = packed record
    TSPHeader: TCmdTSPHead_V3;
//    ParamId: Word;
  end;
  PCmdTSPReadDevParam_V3 = ^TCmdTSPReadDevParam_V3;

  TCmdSrvTermTSPReadDevParam_V3 = packed record
    TSPHeader: TCmdTSPHead_V3;
    RespCmdSNo: Word;//应答流水号
    ParamPackCnt: Byte;
//    ParamId: LongWord;
//    ParamSize: Byte;
  end;
  PCmdSrvTermTSPReadDevParam_V3 = ^TCmdSrvTermTSPReadDevParam_V3;

  TCmdSrvTermGpsDataTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    WarningSign: LongWord;  // 报警标志
    State: Longword; //32位状态位
    Latitude: LongWord; //纬度 X 100 0000 如: 值32123456表示：32.123456度
    Longitude: LongWord; //经度 X 100 0000
    Altitude:word;//sjp zdcl.20110602      海拔高度，单位为米（m）
    Speed: Word; //速度　单位：公里/小时
    Orientation: Word; //方向　正北方向为0度，顺时针增加，单位：2度，数值范围0～178。
    GpsTime: array[0..5] of Byte; // GPS时间
  end;
  PCmdSrvTermGpsDataTSP_V3 = ^TCmdSrvTermGpsDataTSP_V3;

  TDevGpsData_V3 = packed record
    DevIdBCD: TDEV_ID_BCD_ZDCL;
    GpsData: TCmdSrvTermGpsDataTSP_V3;
  end;

  TDevIDGpsDataArray = array of TDevGpsData_V3;

  TCmdSrvTermGpsDataTSPHRB_V3 = packed record
    Header: TCmdTSPHead_V3;
    WarningSign: LongWord;  // 报警标志
    State: Longword; //32位状态位
    Latitude: integer; //纬度 X 100 0000 如: 值32123456表示：32.123456度
    Longitude: integer; //经度 X 100 0000
    Altitude:word;//sjp zdcl.20110602      海拔高度，单位为米（m）
    Speed: Word; //速度　单位：公里/小时
    Orientation: Byte; //方向　正北方向为0度，顺时针增加，单位：2度，数值范围0～178。
    GpsTime: array[0..5] of Byte; // GPS时间
  end;
  PCmdSrvTermGpsDataTSPHRB_V3 = ^TCmdSrvTermGpsDataTSPHRB_V3;

  TCmdTermSrvSendControlInfoHRB_V3 = packed record
    Header: TCmdTSPTHeadHRB_V3;
    ControlCmd:Byte; // 标志
    //调度信息 不定长 ，<=499Byte
  end;
  PCmdTermSrvSendControlInfoHRB_V3 = ^TCmdTermSrvSendControlInfoHRB_V3;

  {终端控制 TERMSRV_CONTROLTERMINAL_V3}
  TCmdTermSrvControlTerminalTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    ControlID: Byte;  //控制命令字	BYTE
    //控制命令参数	STRING     
  end;
  PCmdTermSrvControlTerminalTSP_V3 = ^TCmdTermSrvControlTerminalTSP_V3;

  TCmdTermSrvFindPostionTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
  end;
  PCmdTermSrvFindPostionTSP_V3 = ^TCmdTermSrvFindPostionTSP_V3;

  TCmdTermSrvPursueCarTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    Interval: Word;
    Duration: LongWord;
  end;
  PCmdTermSrvPursueCarTSP_V3 = ^TCmdTermSrvPursueCarTSP_V3;

  TCmdTermSrvSendControlInfoTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    ControlCmd:Byte; // 标志
    //调度信息 不定长 ，<=499Byte
  end;
  PCmdTermSrvSendControlInfoTSP_V3 = ^TCmdTermSrvSendControlInfoTSP_V3;

  TCmdTermSrvSetEventListTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    EventType: Byte;
    //EventCount: Byte;
    //EventPackCount: Byte;
    //事件项列表
  end;
  PCmdTermSrvSetEventListTSP_V3 = ^TCmdTermSrvSetEventListTSP_V3;

  TCmdSrvTermEventUploadTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    EventId: Byte;
  end;
  PCmdSrvTermEventUploadTSP_V3 = ^TCmdSrvTermEventUploadTSP_V3;

  TCmdTermSrvSetAnswerListTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    Flag: Byte;
    QuestionLen: Byte;
    //问题内容
    //候选答案列表
  end;
  PCmdTermSrvSetAnswerListTSP_V3 = ^TCmdTermSrvSetAnswerListTSP_V3;

  TCmdSrvTermQuestionAnswerTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    RespCmdSNo: Word;//应答流水号
    AnswerId: Byte;
  end;
  PCmdSrvTermQuestionAnswerTSP_V3 = ^TCmdSrvTermQuestionAnswerTSP_V3;

  TCmdTermSrvSetInfoMenuTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    SetType: Byte;
//    InfoCount: Byte;
//    PackCount: Byte;
    //信息项列表
  end;
  PCmdTermSrvSetInfoMenuTSP_V3 = ^TCmdTermSrvSetInfoMenuTSP_V3;

  TCmdSrvTermInfoMenuTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    InfoType: Byte; //信息类型
    SelOrQuit: Byte;//点播取消标志 0：取消 1：点播
  end;
  PCmdSrvTermInfoMenuTSP_V3 = ^TCmdSrvTermInfoMenuTSP_V3;

  TCmdTermSrvSendInfoTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    InfoType: Byte;
    InfoLen: Word;
//    PackCount: Byte;
    //信息内容
  end;
  PCmdTermSrvSendInfoTSP_V3 = ^TCmdTermSrvSendInfoTSP_V3;

  TCmdTermSrvCallBackTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    Flag: Byte;//标志  0:普通电话 1：监听
    //电话号码  最长20个字节
  end;
  PCmdTermSrvCallBackTSP_V3 = ^TCmdTermSrvCallBackTSP_V3;

  TCmdTermSrvSetPhoneBookTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    SetType: Byte;
//    PhoneCount: Byte;
//    PackCount: Byte;
    //联系人项
  end;
  PCmdTermSrvSetPhoneBookTSP_V3 = ^TCmdTermSrvSetPhoneBookTSP_V3;

  TCmdTermSrvDevControlTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    ControlCmd: Byte;
  end;
  PCmdTermSrvDevControlTSP_V3 = ^TCmdTermSrvDevControlTSP_V3;

  TCmdSrvTermDevControlTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    CmdSNo: Word;
    WarningSign: LongWord;  // 报警标志
    State: Longword; //32位状态位
    Latitude: integer; //纬度 X 100 0000 如: 值32123456表示：32.123456度
    Longitude: integer; //经度 X 100 0000
    Altitude:word;//sjp zdcl.20110602      海拔高度，单位为米（m）
    Speed: Word; //速度　单位：公里/小时
    Orientation: Word; //方向　正北方向为0度，顺时针增加，单位：2度，数值范围0～178。
    GpsTime: array[0..5] of Byte; // GPS时间
  end;
  PCmdSrvTermDevControlTSP_V3 = ^TCmdSrvTermDevControlTSP_V3;

  TCmdSrvTermFindPosTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    CmdSNo: Word;
    WarningSign: LongWord;  // 报警标志
    State: Longword; //32位状态位
    Latitude: integer; //纬度 X 100 0000 如: 值32123456表示：32.123456度
    Longitude: integer; //经度 X 100 0000
    Altitude:word;//sjp zdcl.20110602      海拔高度，单位为米（m）
    Speed: Word; //速度　单位：公里/小时
    Orientation: Word; //方向　正北方向为0度，顺时针增加，单位：2度，数值范围0～178。
    GpsTime: array[0..5] of Byte; // GPS时间
  end;
  PCmdSrvTermFindPosTSP_V3 = ^TCmdSrvTermFindPosTSP_V3;

  TCmdSrvTermRunRecDataTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    RespCmdNo: Word;
    RunRecFlag: Byte;//行驶记录数据命令字
    //行驶记录数据内容
  end;
  PCmdSrvTermRunRecDataTSP_V3 = ^TCmdSrvTermRunRecDataTSP_V3;

  TERunDataUpload = record
    devId: string;
    carNo: string;
    ERunData: string;
  end;

  TCmdSrvTermERunDataTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    ERunDataLen: LongWord;//电子运单长度
    //电子运单内容
  end;
  PCmdSrvTermERunDataTSP_V3 = ^TCmdSrvTermERunDataTSP_V3;

  TDriverInfoUpload = record
    DevId: string;
    CarNo: string;
    DriverName: string;
    DriverIDNo: String;
    DriverServiceNo: String;
    AgencyName: String;
  end;

  TDriverLogInfo = record
    DriverInfo: TDriverInfoUpload;
    LogType: Byte;//0签到 1签退
    GpsTime: TDateTime;
    Longitude: Double;
    Latitude: Double;
  end;

  RecMediaEventUpload = record
    DevId: string;
    CarNo: string;
    MediaDataId: LongWord;
    MediaType: Byte;
    MediaDataFormat: Byte;
    MediaEventId: Byte;
    MediaChannelId: Byte;
  end;

  RecSrvRunInfo = packed record
    SrvType: Byte;          //服务器类型
    SrvRunTime: LongWord;   //运行时间
    SrvRunStatus: Byte;     //运行状态
    SrvCPUPercent: LongWord;//CPU占用率
    SrvTotalMem: LongWord;  //内存大小
    SrvMemInUse: LongWord;  //使用内存
    SrvMemPercent: LongWord;//内存使用率
  end;

  TCmdSrvTermDriverInfoTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    DriverNameLen: Byte;
    //驾驶员姓名
    //驾驶员身份证编码  20位
    //从业资格证编码    40位
    //发证机构名称长度
    //发证机构名称
  end;
  PCmdSrvTermDriverInfoTSP_V3 = ^TCmdSrvTermDriverInfoTSP_V3;

  TCmdSrvTermMediaEventUploadTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    MediaDataId: LongWord;
    MediaType: Byte;
    MediaFormat: Byte;
    MediaEventId: Byte;
    MediaChannelId: Byte;
  end;
  PCmdSrvTermMediaEventUploadTSP_V3 = ^TCmdSrvTermMediaEventUploadTSP_V3;

  TCmdTermSrvRecordTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    RecFlag: Byte; //0:停止录音 1：开始录音
    RecTime: Word; //录音时间
    RecSaveFlag: Byte;//录音保存标志  0：实时上传 1：保存
    RecSRate: Byte;//0:8k 1:11k 2:23k 3:32k 
  end;
  PCmdTermSrvRecordTSP_V3 = ^TCmdTermSrvRecordTSP_V3;

  TCmdTermSrvTSPDataTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    TSPDataType: Byte;
//    TSPDataLen: LongWord;
//    PackLen: Word;
    //透出数据内容
  end;
  PCmdTermSrvTSPDataTSP_V3 = ^TCmdTermSrvTSPDataTSP_V3;

  TCmdSrvTermTSPDataTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    TSPDataType: Byte;
//    TSPDataLen: LongWord;
//    PackLen: Word;
    //透出数据内容
  end;
  PCmdSrvTermTSPDataTSP_V3 = ^TCmdSrvTermTSPDataTSP_V3;

  TCmdSrvTermCompressedDataTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    CompressedDataLen: LongWord;
    //压缩数据内容
  end;
  PCmdSrvTermCompressedDataTSP_V3 = ^TCmdSrvTermCompressedDataTSP_V3;

  TCmdTermSrvTakeAPhotoTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    CameraIndex: Byte; //摄像头号
    CameraCmd: Word;  // 拍照命令
    PZSJJG: Word;   // 拍照时间间隔
    SaveSign: Byte; // 保存标志
    GetPicSize: Byte; //照片尺寸大小 0=320x240  1=640x480  2-else
    TXZL: Byte; // 图像质量
    LD: Byte;   // 亮度
    DBD: Byte;  // 对比度
    BHD: Byte;  // 饱和度
    SD: Byte;   // 色度
  end;
  PCmdTermSrvTakeAPhotoTSP_V3 = ^TCmdTermSrvTakeAPhotoTSP_V3;

  TCmdTermSrvQueryMediaTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    MediaType: Byte;//多媒体类型  0:图像 1:音频 2:视频
    CameraIndex: Byte;//通道ID(摄像头编号)
    Reason: Byte;//事件项编码(原因)
    SDatetime: array[0..5] of Byte;
    EDatetime: array[0..5] of Byte;
  end;
  PCmdTermSrvQueryMediaTSP_V3 = ^TCmdTermSrvQueryMediaTSP_V3;

  TCmdSrvTermQueryMediaTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    RespCmdNo: Word;//应答流水号
    MediaDataCount: Word;//多媒体数据项总数
    //PackCount: Word;//包项数
    //检索项
  end;
  PCmdSrvTermQueryMediaTSP_V3 = ^TCmdSrvTermQueryMediaTSP_V3;

  TCmdSrvTermQueryMediaMPTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    TotalPackCount: Word;
    CurrPackCount: Word;
    RespCmdNo: Word;//应答流水号
    MediaDataCount: Word;//多媒体数据项总数
    //PackCount: Word;//包项数
    //检索项
  end;
  PCmdSrvTermQueryMediaMPTSP_V3 = ^TCmdSrvTermQueryMediaMPTSP_V3;

  TMediaDataUpload_V3 = packed record
    MediaId: LongWord;//多媒体ID 2011-10-09 808补充文档
    MediaType: Byte;
    MediaChannel: Byte;
    Reason: Byte;
    WarningSign: LongWord;  // 报警标志
    State: Longword; //32位状态位
    Latitude: Longword; //纬度 X 100 0000 如: 值32123456表示：32.123456度
    Longitude: Longword; //经度 X 100 0000
    Altitude:word;//sjp zdcl.20110602      海拔高度，单位为米（m）
    Speed: Word; //速度　单位：公里/小时
    Orientation: Word; //方向　正北方向为0度，顺时针增加，单位：2度，数值范围0～178。
    GpsTime: array[0..5] of Byte; // GPS时间
  end;
  PMediaDataUpload_V3 = ^TMediaDataUpload_V3;

  TCmdTermSrvUploadMediaDataTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    MediaType: Byte;
    MediaChannel: Byte;
    MediaReason: Byte;
    SDateTime: array[0..5] of Byte;
    EDateTime: array[0..5] of Byte;
    DelFlag: Byte;
  end;
  PCmdTermSrvUploadMediaDataTSP_V3 = ^TCmdTermSrvUploadMediaDataTSP_V3;

  TCmdTermSrvUploadMediaDataSingleTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    MediaId: LongWord;
    DelFlag: Byte;
  end;
  PCmdTermSrvUploadMediaDataSingleTSP_V3 = ^TCmdTermSrvUploadMediaDataSingleTSP_V3;

  //驾驶员签到 0x0B01    //驾驶员签退 0x0B02
  TCmdSrvTermDriverLoginTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    GpsTime: array[0..6] of Byte;
    Longitude: LongWord;
    Latitude: LongWord;
    DriverNameLen: Byte;
    //驾驶员姓名
    //驾驶员身份证编码  20位
    //从业资格证编码    40位
    //发证机构名称长度
    //发证机构名称
  end;
  PCmdSrvTermDriverLoginTSP_V3 = ^TCmdSrvTermDriverLoginTSP_V3;


  //运输开始、结束 0x0B03、0x0B04
  TCmdSrvTermTransportStartTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    GpsTime: array[0..6] of Byte;
    Longitude: Longword; //经度 X 100 0000    
    Latitude: Longword; //纬度 X 100 0000 如: 值32123456表示：32.123456度
    //运单号
  end;
  PCmdSrvTermTransportStartTSP_V3 = ^TCmdSrvTermTransportStartTSP_V3;

  TCircleAreaRec = packed record
    AreaId: LongWord;
    AreaProperty: Word;
    CenterLati: LongWord;
    CenterLong: LongWord;
    Radius: LongWord;   //以下四个字段可有可无 其余区域相同
//    SDateTime: array[0..5] of Byte;
//    EDateTime: array[0..5] of Byte;
//    MaxSpeed: Word;
//    OverSpeedTime: Byte;
  end;
  PCircleAreaRec = ^TCircleAreaRec;

  TRectAreaRec = packed record
    AreaId: LongWord;
    AreaProperty: Word;
    LeftTopLati: LongWord;
    LeftTopLong: LongWord;
    RightBottomLati: LongWord;
    RightBottomLong: LongWord;
//    SDateTime: array[0..5] of Byte;
//    EDateTime: array[0..5] of Byte;
//    MaxSpeed: Word;
//    OverSpeedTime: Byte;
  end;
  PRectAreaRec = ^TRectAreaRec;

  TPolygonAreaRec = packed record
    AreaId: LongWord;
    AreaProperty: Word;
//    SDateTime: array[0..5] of Byte;
//    EDateTime: array[0..5] of Byte;
//    MaxSpeed: Word;
//    OverSpeedTime: Byte;
//    AreaPointCount: Word;
//    PackAreaPointCount: Word;
    //点经纬度信息
  end;
  PPolygonAreaRec = ^TPolygonAreaRec;

  TPolyLineAreaRec = packed record
    LineNo: LongWord;
    LineProperty: Word;
//    SDateTime: array[0..5] of Byte;
//    EDateTime: array[0..5] of Byte;
//    AreaPointCount: Word;
//拐点项数据
  end;
  PPolyLineAreaRec = ^TPolyLineAreaRec;

  //此处设为每次只发一个区域   圆形区域
  TCmdTermSrvSetCircleAreaTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    SetType: Byte;
    AreaCount: Byte;
//    PackCount: Byte;
    CircleArea: TCircleAreaRec;
  end;
  PCmdTermSrvSetCircleAreaTSP_V3 = ^TCmdTermSrvSetCircleAreaTSP_V3;

  //此处设为每次只发一个区域  矩形区域
  TCmdTermSrvSetRectAreaTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    SetType: Byte;
    AreaCount: Byte;
//    PackCount: Byte;
    RectArea: TRectAreaRec;
  end;
  PCmdTermSrvSetRectAreaTSP_V3 = ^TCmdTermSrvSetRectAreaTSP_V3;

  //此处设为每次只发一个区域   多边形
  TCmdTermSrvSetPolygonAreaTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    PolygonArea: TPolygonAreaRec;
  end;
  PCmdTermSrvSetPolygonAreaTSP_V3 = ^TCmdTermSrvSetPolygonAreaTSP_V3;

  //此处设为每次只发一个区域   路线
  TCmdTermSrvSetPolyLineAreaTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    PolyLineArea: TPolyLineAreaRec;
  end;
  PCmdTermSrvSetPolyLineAreaTSP_V3 = ^TCmdTermSrvSetPolyLineAreaTSP_V3;

  TCmdTermSrvDelAreaTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    AreaCount: Byte;
  end;
  PCmdTermSrvDelAreaTSP_V3 = ^TCmdTermSrvDelAreaTSP_V3;

  //行驶记录数据采集
  TCmdTermSrvCollectRunRecDataTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    Flag: Byte;
  end;
  PCmdTermSrvCollectRunRecDataTSP_V3 = ^TCmdTermSrvCollectRunRecDataTSP_V3;

//  设置行驶记录仪参数
  TCmdTermSrvSetRunRecParamTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    Flag: Byte;
//    数据块
  end;
  PCmdTermSrvSetRunRecParamTSP_V3 = ^TCmdTermSrvSetRunRecParamTSP_V3;

  //********************************北斗新增********************************
  TCmdTermSrvUpgradeTerminalTSP_BD = packed record
    Header: TCmdTSPHead_V3;
    UpgradeType: Byte;
    MID: array[0..4] of Byte;
    VerLen: Byte;
    //Ver: string;
    //剩余升级包数据由前置填充，监控端发送该命令时忽略该数据
  end;
  PCmdTermSrvUpgradeTerminalTSP_BD = ^TCmdTermSrvUpgradeTerminalTSP_BD;

  TCmdSrvTermUpgradeTerminalRetTSP_BD = packed record
    Header: TCmdTSPHead_V3;
    UpgradeType: Byte;//升级类型  0：终端，12：道路运输证 IC 卡读卡器，52：北斗卫星定位模块。
    UpgradeRet: Byte;//升级结果	BYTE	0：成功；1：失败；2：取消
  end;
  PCmdSrvTermUpgradeTerminalRetTSP_BD = ^TCmdSrvTermUpgradeTerminalRetTSP_BD;

  TCmdTermSrvReadParamSpecTSP_BD = packed record
    Header: TCmdTSPHead_V3;
    ParamCount: Byte;
  end;
  PCmdTermSrvReadParamSpecTSP_BD = ^TCmdTermSrvReadParamSpecTSP_BD;
  //********************************北斗新增********************************

  //透传命令
  TCmdTSP_V3 = packed record
    Header: THead_V3;
    //透传的命令
  end;
  PCmdTSP_V3 = ^TCmdTSP_V3;

  //透传命令
  TCmdTSPHRB_V3 = packed record
    Header: THeadHRB_V3;
    //透传的命令
  end;
  PCmdTSPHRB_V3 = ^TCmdTSPHRB_V3;

  //紧急报警处理
  TCmdSendEmgcyAlarmDeal_V3 = packed record
    Header: THead_V3;
    Flag: Byte; //0: 确认报警 1: 解除报警
  end;
  PCmdSendEmgcyAlarmDeal_V3 = ^TCmdSendEmgcyAlarmDeal_V3;

  //紧急报警处理
  TCmdSendReplyAlarmSupervise_V3 = packed record
    Header: THead_V3;
    AlarmId: Integer;
    Ret: Byte;
//    AlarmType: Word;
  end;
  PCmdSendReplyAlarmSupervise_V3 = ^TCmdSendReplyAlarmSupervise_V3;

  //服务器运行状态
  TCmdSrvRunInfo_V3 = packed record
    Header: THead_V3;
    SrvType: Byte;          //服务器类型
    SrvRunTime: LongWord;   //运行时间
    SrvRunStatus: Byte;     //运行状态
    SrvCPUPercent: LongWord;//CPU占用率
    SrvTotalMem: LongWord;  //内存大小
    SrvMemInUse: LongWord;  //使用内存
    SrvMemPercent: LongWord;//内存使用率
  end;
  PCmdSrvRunInfo_V3 = ^TCmdSrvRunInfo_V3;

  TCmdAlarmSupervise_V3 = packed record
    Header: THead_V3;
    CarNoLen: Byte;
   { CarNo: string;
    AlarmSrc: Byte;
    AlarmType: Word;
    AlarmId: LongWord;
    AlarmLevel: Byte;
    AlarmSupervisorLen: LongWord;
   督办人
    督办人电话长度
    督办人电话
    督办人Email长度
    督办人Email
  }
  end;
  PCmdAlarmSupervise_V3 = ^TCmdAlarmSupervise_V3;

  //政府平台下发信息  平台查岗、报文信息
  TCmdGovInfo_V3 = packed record
    Header: THead_V3;
    ObjType: Byte;//对象类型
    ObjID: TGovObjID;
    MsgId: Integer;
    MsgLen: Integer;
    //Msg: string;
  end;
  PCmdGovInfo_V3 = ^TCmdGovInfo_V3;

  TCmdGovAlarm_V3 = packed record
    Header: THead_V3;
    CarNoLen: Byte;
  { CarNo: string;
    CarCPColor: Byte;
    AlarmSrcType: Byte;
    AlarmType: Word;
    AlarmTime: array[0..6] of byte;
    AlarmMsgLen: Integer;
    AlarmMsg: string;
  }
  end;
  PCmdGovAlarm_V3 = ^TCmdGovAlarm_V3;

  TCmdGovGpsDataCount_V3 = packed record
    Header: THead_V3;
    GpsDataCount: Integer;
    STime: array[0..6] of Byte;
    ETime: array[0..6] of Byte;
  end;
  PCmdGovGpsDataCount_V3 = ^TCmdGovGpsDataCount_V3;

  TGovGpsData_V3 = packed record
    Encrypt: Byte;
    Date: array[0..3] of Byte;
    Time: array[0..2] of Byte;
    Longitude: LongWord;
    Latitude: LongWord;
    Speed: Word;
    Speed_RunRec: Word;//记录仪的速度
    TotalCourse: LongWord;
    Dir: Word;
    Altitude: Word;
    State: LongWord;
    Alarm: LongWord;
  end;
  PGovGpsData_V3 = ^TGovGpsData_V3;

  TCmdGovCarGpsData_V3 = packed record
    Header: THead_V3;
    CarNo: array[0..20] of Byte;
    CarCpColor: Byte;
    GpsData: TGovGpsData_V3;
  end;
  PCmdGovCarGpsData_V3 = ^TCmdGovCarGpsData_V3;

  TCmdGovStartGpsData_V3 = packed record
    Header: THead_V3;
    CarNo: array[0..20] of Byte;
    CarCpColor: Byte;
    Reason: Byte;
  end;
  PCmdGovStartGpsData_V3 = ^TCmdGovStartGpsData_V3;

  TCmdGovApplyGpsData_V3 = packed record
    Header: THead_V3;
    CarNo: array[0..20] of Byte;
    CarCpColor: Byte;
    STime: array[0..6] of Byte;
    ETime: array[0..6] of Byte;
  end;
  PCmdGovApplyGpsData_V3 = ^TCmdGovApplyGpsData_V3;

  TCmdGovCancelGpsData_V3 = packed record
    Header: THead_V3;
    CarNo: array[0..20] of Byte;
    CarCpColor: Byte;
  end;
  PCmdGovCancelGpsData_V3 = ^TCmdGovCancelGpsData_V3;


  TCmdGovAlarmDealReply_V3 = packed record
    Header: THead_V3;
    CarNo: array[0..20] of Byte;
    CarCpColor: Byte;
    AlarmIdManual: Integer;
    DealResult: Byte;
  end;
  PCmdGovAlarmDealReply_V3 = ^TCmdGovAlarmDealReply_V3;
//
//  TCmdSrvTermSetDevParam_V3 = packed record
//    Header: THead_V3;
//    DevParam: TCmdTSPSetDevParam_V3;
//  end;
//  PCmdSrvTermSetDevParam_V3 = ^TCmdSrvTermSetDevParam_V3;
//------------------------------------------------------------------------------

  { Procedure: GetCmdName<br>
     返回命令的名称
     @param const ACmdFlag: Integer
     @Return string
     @see @link()}
function GetCmdName(const ACmdFlag: integer): string;
 { Procedure: CmdToStr<br>
     返回命令的格式化的内容
     @param P: Pointer
     @param
     @Return string
     @see @link()
     }
function CmdToStr(P: Pointer): string;

  {将BCD表示的无符号长整型32bit，转换成无符号长整型}
function BcdToLong(pB: PByte): Longword;
  {将BCD表示的16bit无符号整型转换成16bit无符号整型}
function BcdToWord(pB: PByte): Word;
  {将BCD表示的8bit无符号整型转换成8bit无符号整型}
function BcdToByte(bcd: Byte): Byte;
  {将整型转换为BCD}
function LongToBcd(pB: Longint): Variant;

function StrToBcd1(Value: string): Variant;

  {字节顺序转换}
function ByteOderConvert_Word(AValue: Word): Word;
  {字节顺序转换
  @param AValue:longword
  @return longword
  }
function ByteOderConvert_LongWord(AValue: Longword): Longword;

//从六字节的bcd码北京时间返回 时间类型。
function GetTimeFromBcd(AOrg: array of Byte): TDateTime;
{计算校验和- 异或}
function GetXorSum(Buff: Pointer; ALen : integer):Byte;
// 将字符串转换为整形
function StringToInteger(param: string): Integer; overload;
function StringToInteger(param: string; defValue: Integer): Integer; overload;
// 将字符串转换为整形
function StringToLongWord(param: string): LongWord; overload;
function StringToLongWord(param: string; defValue: LongWord): LongWord; overload;
//
function StringToFloat(param: string): Double; overload;
function StringToFloat(param: string; defValue: Double): Double; overload;

//function GetGpsTime(AOrg: array of Byte): TDateTime;
//  {将 TCmdSrvtermGpsdata 格式的数据转换成 TGpsData格式
//   @param AOrg:TCmdSrvtermGpsdata
//   @param ANew:TGpsData
//   @return 转化成功返回True，否则返回False}
//function TransCmdGpsData(var AOrg: TCmdSrvtermGpsdata; var ANew: TGpsData): Boolean; overload;
//  {V2.0版本中　客户端收到网关传来的定位数据TCmdSrvTermGpsData_V2，转成客户端内部处理用的TGpsData_V2}
//function TransCmdGpsData(var AOrg: TCmdSrvTermGpsData_V2; var ANew: TGpsData_V2): Boolean; overload;
  {V3.0版本，即哈尔滨项目}
function TransCmdGpsData(var AOrg: TCmdSrvTermGpsData_V3; var ANew: TGpsData_V3): Boolean; overload;
function TransCmdGpsData(var AOrg: TCmdSrvTermGpsDataTSP_V3; var ANew: TGpsData_V3): Boolean; overload;
function TransCmdGpsData(var AOrg: TCmdSrvTermGpsDataTSPHRB_V3; var ANew: TGpsData_V3): Boolean; overload;
function TransCmdGpsData(var AOrg: TCmdSrvtermControlCar_V3; var ANew: TGpsData_V3): Boolean; overload;
function TransCmdGpsData(var AOrg: TCmdSrvTermDevControlTSP_V3; var ANew: TGpsData_V3): Boolean; overload;
// 轨迹回放数据
function TransCmdGpsData(var AOrg: TQueryHistoryGpsData_V3; var ANew: THistoryGpsData_V3): Boolean; overload;

implementation
uses
  Sysutils, DateUtils;

function StringToInteger(param: string): Integer; overload;
begin
  if param = '' then
  begin
    Result := 0;
  end
  else begin
    try
      Result := StrToInt(param);
    except
      Result := 0;
    end;
  end;
end;

function StringToInteger(param: string; defValue: Integer): Integer; overload;
begin
  if param = '' then
  begin
    Result := defValue;
  end
  else begin
    try
      Result := StrToInt(param);
    except
      Result := defValue;
    end;
  end;
end;

function StringToLongWord(param: string): LongWord; overload;
begin
  if param = '' then
  begin
    Result := 0;
  end
  else begin
    try
      Result := StrToInt(param);
    except
      Result := 0;
    end;
  end;
end;

function StringToLongWord(param: string; defValue: LongWord): LongWord; overload;
begin
  if param = '' then
  begin
    Result := defValue;
  end
  else begin
    try
      Result := StrToInt(param);
    except
      Result := defValue;
    end;
  end;
end;

function StringToFloat(param: string): Double;
begin
  if param = '' then
  begin
    Result := 0;
  end
  else begin
    try
      Result := StrToFloat(param);
    except
      Result := 0;
    end;
  end;
end;

function StringToFloat(param: string; defValue: Double): Double;
begin
  if param = '' then
  begin
    Result := defValue;
  end
  else begin
    try
      Result := StrToFloat(param);
    except
      Result := defValue;
    end;
  end;
end;


//function TransCmdGpsData(var AOrg: TCmdSrvtermGpsdata; var ANew: TGpsData): Boolean;
//  function GetGpsTime(AOrg: array of Byte): TDateTime;
//  var
//    year, mon, day, hour, min, sec: Word;
//  begin
//    //-------------------在设备刚登录时,在GPS天线坏或有故障，会收到全是0的数据
//    if (AOrg[1] = 0) and (AOrg[2] = 0) and (AOrg[3] = 0) and (AOrg[4] = 0) and (AOrg[5] = 0) then
//    begin
//      Result := EncodeDate(2000, 1, 1) + EncodeTime(0, 0, 0, 0);
//      exit;
//    end;
//    //====================================================
//    year := 2000 + AOrg[0];
//    mon := AOrg[1];
//    day := AOrg[2];
//    hour := AOrg[3];
//    min := AOrg[4];
//    sec := AOrg[5];
//    try
//      Result := EncodeDate(year, mon, day) + EncodeTime(hour, min, sec, 0);
//    except
//      Result := 0; // EncodeDate(2000,1,1)+ EncodeTime(0,0,0,0);
//    end;
//  end;
//begin
//  Result := True;
//  try
//    ANew.Size := SizeOf(ANew);
//    ANew.Id := AOrg.DevId;
//    ANew.Long := AOrg.Long / 1000 / 60;
//    ANew.Lat := AOrg.Lat / 1000 / 60;
//    ANew.GpsTime := GetGpsTime(AOrg.GpsTime);
//    ANew.Speed := AOrg.Speed;
//    ANew.Altitude := AOrg.Altitude;
//    ANew.Angle := AOrg.Angle;
//    ANew.IO := AOrg.Stat;
//    ANew.IO := (ANew.IO shl 8) or AOrg.Switch;
//  except
//    Result := False;
//  end;
//end;
//
//{V2.0版本中　客户端收到网关传来的定位数据TCmdSrvTermGpsData_V2，转成客户端内部处理用的TGpsData_V2}
//
//function TransCmdGpsData(var AOrg: TCmdSrvTermGpsData_V2; var ANew: TGpsData_V2): Boolean;
//  function GetGpsTime(AOrg: array of Byte): TDateTime;
//  var
//    year, mon, day, hour, min, sec: Word;
//    Error: Boolean;
//  begin
//    //-------------------在设备刚登录时,在GPS天线坏或有故障，会收到全是0的数据
//    if (AOrg[1] = 0) and (AOrg[2] = 0) and (AOrg[3] = 0) and (AOrg[4] = 0) and (AOrg[5] = 0) then
//    begin
//      Result := EncodeDate(2000, 1, 1) + EncodeTime(0, 0, 0, 0);
//      exit;
//    end;
//    //====================================================
//    Error := False;
//    year := 2000 + AOrg[0];
//    mon := AOrg[1];
//    if not ((mon > 0) and (mon <= 12)) then Error := True;
//    day := AOrg[2];
//    if not ((day > 0) and (day <= 31)) then Error := True;
//    hour := AOrg[3];
//    if not ((hour >= 0) and (hour <= 23)) then Error := True;
//    min := AOrg[4];
//    if not ((min >= 0) and (min <= 59)) then Error := True;
//    sec := AOrg[5];
//    if not ((sec >= 0) and (sec <= 59)) then Error := True;
//    if Error then
//    begin
//      Result := EncodeDate(2000, 1, 1) + EncodeTime(0, 0, 0, 0);
//      exit;
//    end;
//    try
//      //这里加了8小时了
//      Result := EncodeDate(year, mon, day) + EncodeTime(hour, min, sec, 0) + 1 / 3;
//    except
//      Result := EncodeDate(2000, 1, 1) + EncodeTime(0, 0, 0, 0);
//    end;
//  end;
//begin
//  Result := True;
//  try
//    ANew.Size := SizeOf(ANew);
//    ANew.Id := AOrg.DevId;
//    ANew.Long := AOrg.Longitude / 1000000;
//    ANew.Lat := AOrg.Latitude / 1000000;
//    ANew.Speed := AOrg.Speed;
//    ANew.Orientation := AOrg.Orientation * 2; //Anew.Orientation单位：度 || Aorg.Orientation单位：2度
//    ANew.State := AOrg.State;
//    ANew.GpsTime := GetGpsTime(AOrg.GpsTime);
//  except
//    Result := False;
//  end;
//end;


function GetGpsTime(AOrg: array of Byte): TDateTime;
var
  year, mon, day, hour, min, sec: Word;
  Error: Boolean;
begin
  //-------------------在设备刚登录时,在GPS天线坏或有故障，会收到全是0的数据
  if (AOrg[1] = 0) and (AOrg[2] = 0) and (AOrg[3] = 0) and (AOrg[4] = 0) and (AOrg[5] = 0) then
  begin
    Result := EncodeDate(2000, 1, 1) + EncodeTime(0, 0, 0, 0);
    exit;
  end;
  //====================================================
  Error := False;
  year := 2000 + BcdToByte(AOrg[0]);//StrToInt(IntToHex(AOrg[0], 2));
  mon := BcdToByte(AOrg[1]);//StrToInt(IntToHex(AOrg[1], 2));
  if not ((mon > 0) and (mon <= 12)) then Error := True;
  day := BcdToByte(AOrg[2]);//StrToInt(IntToHex(AOrg[2], 2));
  if not ((day > 0) and (day <= 31)) then Error := True;
  hour := BcdToByte(AOrg[3]);//StrToInt(IntToHex(AOrg[3], 2));
  if not ((hour >= 0) and (hour <= 23)) then Error := True;
  min := BcdToByte(AOrg[4]);//StrToInt(IntToHex(AOrg[4], 2));
  if not ((min >= 0) and (min <= 59)) then Error := True;
  sec := BcdToByte(AOrg[5]);//StrToInt(IntToHex(AOrg[5], 2));
  if not ((sec >= 0) and (sec <= 59)) then Error := True;
  if Error then
  begin
    Result := EncodeDate(2000, 1, 1) + EncodeTime(0, 0, 0, 0);
    exit;
  end;
  try
    //这里加了8小时了
    Result := EncodeDate(year, mon, day) + EncodeTime(hour, min, sec, 0);// + 1 / 3;
  except
    Result := EncodeDate(2000, 1, 1) + EncodeTime(0, 0, 0, 0);
  end;
end;

function TransCmdGpsData(var AOrg: TCmdSrvTermGpsData_V3; var ANew: TGpsData_V3): Boolean;
begin
  Result := True;
  try
    ANew.Size := SizeOf(ANew);
//    ANew.Id :=  BCDToInt(@AOrg.DevId[0]);//AOrg.DevId[4] + AOrg.DevId[3]*256 + AOrg.DevId[2]*256*256 + AOrg.DevId[1]*256*256*256;
    ANew.Id :=  AOrg.Header.DevId;
    ANew.Long := AOrg.Longitude / 1000000;
    ANew.Lat := AOrg.Latitude / 1000000;
    ANew.Altitude := AOrg.Altitude;
    ANew.Speed := AOrg.Speed;
    ANew.Orientation := AOrg.Orientation * 2; //Anew.Orientation单位：度 || Aorg.Orientation单位：2度
    ANew.GpsTime := GetGpsTime(AOrg.GpsTime);
    ANew.State := AOrg.State;
    ANew.WarningSign := AOrg.WarningSign;
  except
    Result := False;
  end;
end;

function TransCmdGpsData(var AOrg: TCmdSrvTermGpsDataTSP_V3; var ANew: TGpsData_V3): Boolean;
begin
  Result := True;
  try
    ANew.Size := SizeOf(ANew);
//    ANew.Id :=  BCDToInt(@AOrg.DevId[0]);//AOrg.DevId[4] + AOrg.DevId[3]*256 + AOrg.DevId[2]*256*256 + AOrg.DevId[1]*256*256*256;
    ANew.Id :=  AOrg.Header.DevId;
    ANew.Long := AOrg.Longitude / 1000000;
    ANew.Lat := AOrg.Latitude / 1000000;
    ANew.Altitude := AOrg.Altitude;
    ANew.Speed := AOrg.Speed;
    ANew.Orientation := AOrg.Orientation * 2; //Anew.Orientation单位：度 || Aorg.Orientation单位：2度
    ANew.GpsTime := GetGpsTime(AOrg.GpsTime);
    ANew.State := AOrg.State;
    ANew.WarningSign := AOrg.WarningSign;
  except
    Result := False;
  end;
end;

function TransCmdGpsData(var AOrg: TCmdSrvTermGpsDataTSPHRB_V3; var ANew: TGpsData_V3): Boolean; overload;
begin
  Result := True;
  try
    ANew.Size := SizeOf(ANew);
//    ANew.Id :=  BCDToInt(@AOrg.DevId[0]);//AOrg.DevId[4] + AOrg.DevId[3]*256 + AOrg.DevId[2]*256*256 + AOrg.DevId[1]*256*256*256;
    ANew.Id :=  AOrg.Header.DevId;
    ANew.Long := AOrg.Longitude / 1000000;
    ANew.Lat := AOrg.Latitude / 1000000;
    ANew.Altitude := AOrg.Altitude;
    ANew.Speed := AOrg.Speed;
    ANew.Orientation := AOrg.Orientation * 2; //Anew.Orientation单位：度 || Aorg.Orientation单位：2度
    ANew.GpsTime := GetGpsTime(AOrg.GpsTime);
    ANew.State := AOrg.State;
    ANew.WarningSign := AOrg.WarningSign;
  except
    Result := False;
  end;
end;

function TransCmdGpsData(var AOrg: TCmdSrvtermControlCar_V3; var ANew: TGpsData_V3): Boolean;
begin
  Result := True;
  try
    ANew.Size := SizeOf(ANew);
    ANew.Id := AOrg.Header.DevId;
//    ANew.Id := BCDToInt(@AOrg.DevId[0]);//AOrg.DevId[4] + AOrg.DevId[3]*256 + AOrg.DevId[2]*256*256 + AOrg.DevId[1]*256*256*256;
    {if (AOrg.FactID = 2) or (AOrg.FactID = 3) then
    begin
      ANew.Long := AOrg.Longitude / 600000;
      ANew.Lat := AOrg.Latitude / 600000;
    end
    else
    begin  }
      ANew.Long := AOrg.Longitude / 1000000;
      ANew.Lat := AOrg.Latitude / 1000000;
    //end;
    ANew.Altitude := AOrg.Altitude;
    ANew.Speed := AOrg.Speed;
    ANew.Orientation := AOrg.Orientation * 2; //Anew.Orientation单位：度 || Aorg.Orientation单位：2度
    ANew.State := AOrg.State;
    ANew.GpsTime := GetGpsTime(AOrg.GpsTime);
    ANew.WarningSign := AOrg.WarningSign;
  except
    Result := False;
  end;
end;

function TransCmdGpsData(var AOrg: TCmdSrvTermDevControlTSP_V3; var ANew: TGpsData_V3): Boolean; overload;
begin
  Result := True;
  try
    ANew.Size := SizeOf(ANew);
    ANew.Id := AOrg.Header.DevId;
    ANew.Long := AOrg.Longitude / 1000000;
    ANew.Lat := AOrg.Latitude / 1000000;
    ANew.Altitude := AOrg.Altitude;
    ANew.Speed := AOrg.Speed;
    ANew.Orientation := AOrg.Orientation * 2; //Anew.Orientation单位：度 || Aorg.Orientation单位：2度
    ANew.State := AOrg.State;
    ANew.GpsTime := GetGpsTime(AOrg.GpsTime);
    ANew.WarningSign := AOrg.WarningSign;
  except
    Result := False;
  end;
end;

function TransCmdGpsData(var AOrg: TQueryHistoryGpsData_V3; var ANew: THistoryGpsData_V3): Boolean;
  function BCDToInt(ABuff:Pointer): Integer; // 将BCD字符串转换为整形
  var
    i:integer;
    temp: string;
  begin
    temp:='';
    inc(PByte(ABuff));
    for i:=0 to 2 do
    begin
      temp:=temp+InttoHex(PByte(ABuff)^,2);
      inc(PByte(ABuff));
    end;
    Result := StringToInteger(temp);
  end;
begin
  Result := True;
  try
    ANew.Size := SizeOf(ANew);
    ANew.Id :=  BCDToInt(@AOrg.DevId[0]);//AOrg.DevId[4] + AOrg.DevId[3]*256 + AOrg.DevId[2]*256*256 + AOrg.DevId[1]*256*256*256;
    ANew.Long := AOrg.Longitude / 1000000;
    ANew.Lat := AOrg.Latitude / 1000000;
    ANew.Speed := AOrg.Speed;
    ANew.Orientation := AOrg.Orientation; //Anew.Orientation单位：度 || Aorg.Orientation单位：2度
    ANew.State := AOrg.State;
    ANew.GpsTime := AOrg.GpsTime;//GetGpsTime(AOrg.GpsTime);
    ANew.WarningSign := AOrg.WarningSign;
    ANew.ServerTime := AOrg.ServerTime;
  except
    Result := False;
  end;
end;

{字节顺序转换,将本机的字节顺序(LITTLE_END)转成BIG_END
@param AValue:Word
@return Word
}

function ByteOderConvert_Word(AValue: Word): Word;
type
  TLongByte = packed record
    a, b: Byte;
  end;
var
  P: ^TLongByte;
  t: Byte;
begin
  P := @AValue;
  t := P^.a;
  P^.a := P^.b;
  P^.b := t;

  Result := AValue;
end;

{字节顺序转换
@param AValue:longword
@return longword
}

function ByteOderConvert_LongWord(AValue: Longword): Longword;
type
  TLongByte = packed record
    a, b, c, d: Byte;
  end;
var
  P: ^TLongByte;
  t: Byte;
begin
  P := @AValue;
  t := P^.a;
  P^.a := P^.d;
  P^.d := t;

  t := P^.b;
  P^.b := P^.c;
  P^.c := t;

  Result := AValue;
end;
{
bcd中保存的是4个字节的浮点表示
"03201.831" 转换成用4个字节的bcd码表示的数 <br>
0x03  0x20  0x18  0x31                     <br>
将0x03  0x20  0x18  0x31 转成8个字节       <br>
 0 ，3，2，0, 1，8，3，1                   <br>
 然后拼成一个longword                      <br>
  (0*6000+3*600+2*60)*1000+
  (0*10000+1*1000+8*100+3*10+1)
 --------
 到客户端再计算时，再除以1000*60
 =32.0305167
}

function BcdToLong(pB: PByte): Longword;
var
  b: array[0..7] of Byte;
  i: integer;
begin
  for i := 0 to 3 do
  begin
    b[i * 2] := pB^ shr 4;
    b[i * 2 + 1] := pB^ and $0F;
    inc(pB);
  end;

  Result :=
    (b[0] * 6000 + b[1] * 600 + b[2] * 60) * 1000 +
    (b[3] * 10000 + b[4] * 1000 + b[5] * 100 + b[6] * 10 + b[7]);
end;

function LongToBcd(pB: Longint): Variant;
var
  b: array of Byte;
  hex: string;
  i: Integer;
  temp: Integer;
begin
  setlength(b, 4);
  b[0] := pB div 1000;
  pB := pB shl 1;
  b[1] := pB div 100;
  pB := pB shl 1;
  b[2] := pB div 10;
  pB := pB shl 1;
  b[3] := pB mod 10;
  hex := IntToHex(pB, 8);
  for i := 0 to 3 do
  begin
    temp := StrToInt('$' + Copy(hex, i*2+1, 2));
    b[i] := ((temp div 10) shl 4) + (temp mod 10);
  end;
  Result := b;
end;

function StrToBcd1(Value: string): Variant;
var
  i, j: Integer;
  temp: string;
  temp1: Integer;
  BCD: array of Byte;
begin
  temp1 := StringToInteger(Value);
  temp := FormatFloat('0000000000', temp1);
  SetLength(BCD, 5);
  j := 1;
  for i:=0 to 4  do
  begin
    BCD[i] := StrToInt('$' + copy(temp,i*2+1,2));
    j := j+1;
  end;
  Result := BCD;
end;

{
bcd中保存的是2个字节的整型表示
1204，可用来表示速度为120.4公里每小时
将其用两个字节的bcd码表示[0x12,0x04]
将0x12 0x04 转成4个字节
    1,2,0,4
 然后拼成一个浮点
 1*1000+2*100+0*10+4;
}

function BcdToWord(pB: PByte): Word;
var
  b: array[0..3] of Byte;
begin

  b[0] := pB^ shr 4;
  b[1] := pB^ and $0F;
  inc(pB);
  b[2] := pB^ shr 4;
  b[3] := pB^ and $0F;

  Result := b[0] * 1000 + b[1] * 100 + b[2] * 10 + b[3];
end;

function BcdToByte(bcd: Byte): Byte;
begin
  Result := (bcd shr 4) * 10 + (bcd and $0F);
end;


function GetCmdName(const ACmdFlag: integer): string;
begin
//  case ACmdFlag of
//    //--------------监控客户端　与　网关 命令
//    TERMSRV_REG: Result := '客户端用户注册发出命令'; //= $02;
//    SRVTERM_REG: Result := '服务器用户注册返回命令'; //= $82;
//    TERMSRV_GETLASTPOS: Result := '客户端查询目标最后位置发出命令'; //= $03;
//    SRVTERM_GETLASTPOS: Result := '服务器查询目标最后位置返回命令'; //= $83;
//    TERMSRV_GETDEVSTAT: Result := '客户端查询目标状态发出命令'; //= $04;
//    SRVTERM_GETDEVSTAT: Result := '服务器查询目标状态返回命令'; //= $84;
//    SRVTERM_GPSDATA: Result := '服务器发送目标的数据到客户端命令'; //= $85;
//    TERMSRV_CALLDEV: Result := '客户端呼叫目标发出命令'; //= $06;
//    SRVTERM_CALLDEV: Result := '服务器呼叫目标返回命令'; //= $86;
//    TERMSRV_SWCTRL: Result := '客户端控制目标发出命令'; //= $07;
//    SRVTERM_SWCTRL: Result := '服务器控制目标返回命令'; //= $87;
//    TERMSRV_SENDDEVMSG: Result := '客户端发送目标信息发出命令'; //= $08;
//    SRVTERM_SENDMSG: Result := '服务器发送消息到客户端命令'; //= $89;
//    TERMSRV_PING: Result := '客户端到服务器的心跳命令'; //= $0A;
//    SRVTERM_PING: Result := '服务器响应客户端的心跳命令'; //= $8A;
//    SRVTERM_NOTIFYMSG: Result := '服务器通知客户端的通知消息'; //= $8B;
//    TERMSRV_CANCELCMD: Result := '客户端通知服务器取消命令扫行发出命令'; //= $0C;
//    SRVTERM_CANCELCMD: Result := '服务器响应取消命令的返回命令'; //= $8C;
//    SRVTERM_LASTGPSDATA: Result := ''; //= $8D;
//   
//  else
//    Result := '未知命令ID:' + IntToStr(ACmdFlag);
//  end;
end;

function CmdToStr(P: Pointer): string;
  function GetTERMSRV_COMMVER(P: Pointer): string;
  begin
    with PCmdTermsrvRegverData(P)^ do
      Result := '客户端注册通讯协议命令 ' + IntToStr(MajorVer) + '.' + IntToStr(MinorVer);
  end;

  function GetSRVTERM_COMMVER(P: Pointer): string;
  begin
    with PCmdSrvtermRegverData(P)^ do
      Result := '服务器响应注册通讯协议命令 ';
  end;

  function GetTERMSRV_REG(P: Pointer): string;
  begin
    with PCmdTermsrvRegUserData(P)^ do
      Result := '客户端注册,用户:' + IntToStr(UserID) + ',Password:******' + '客户端版本号 ';// +
        //IntToStr(MajorVer) + '.' + IntToStr(MinorVer);
  end;

  function GetSRVTERM_REG(P: Pointer): string;
  begin
    with PCmdSrvtermRegUserData(P)^ do
      Result := '服务器响应注册请求，' + IntToStr(PCmdSrvtermRegUserData(P)^.Ret);
  end;

  function GetTERMSRV_GETLASTPOS(P: Pointer): string;
  begin
    with PCmdTermsrvGetlastPosData(P)^ do
      Result := '客户端请求目标的最后位置，ID为' + IntToStr(PCmdTermsrvGetlastPosData(P)^.DevId);
  end;

  function GetSRVTERM_GETLASTPOS(P: Pointer): string;
  begin

  end;

  function GetTERMSRV_GETSTAT(P: Pointer): string;
  begin

  end;

  function GetSRVTERM_GETSTAT(P: Pointer): string;
  begin

  end;

  function GetSRVTERM_GPSDATAV20(P: Pointer): string;
  begin

  end;

  function GetTERMSRV_CALLDEV(P: Pointer): string;
  begin

  end;

  function GetSRVTERM_CALLDEV(P: Pointer): string;
  begin

  end;

  function GetTERMSRV_SWITCHCTRL(P: Pointer): string;
  begin

  end;

  function GetSRVTERM_SWITCHCTRL(P: Pointer): string;
  begin

  end;

  function GetTERMSRV_SENDDEVMSG(P: Pointer): string;
  begin

  end;

  function GetSRVTERM_SENDMSG(P: Pointer): string;
  begin

  end;

  function GetTERMSRV_PING(P: Pointer): string;
  begin

  end;

  function GetSRVTERM_PING(P: Pointer): string;
  begin

  end;

  function GetSRVTERM_NOTIFYSTAT(P: Pointer): string;
  begin

  end;

  function GetTERMSRV_CANCELCMD(P: Pointer): string;
  begin

  end;

  function GetSRVTERM_CANCELCMD(P: Pointer): string;
  begin

  end;

  function GetSRVTERM_LASTGPSDATA(P: Pointer): string;
  begin

  end;

  function PtrAdd(P: Pointer; offset: integer): Pointer;
  begin
    Result := Pointer(integer(P) + offset);
  end;

begin
{
  case PByte(PtrAdd(P,2))^ of
    TERMSRV_COMMVER     :Result := GetTERMSRV_COMMVER(p)      ;//$01
    SRVTERM_COMMVER     :Result := GetSRVTERM_COMMVER(p)      ;//$81
    TERMSRV_REG         :Result := GetTERMSRV_REG(p)          ;//$02
    SRVTERM_REG         :Result := GetSRVTERM_REG(p)          ;//$82
    TERMSRV_GETLASTPOS  :Result := GetTERMSRV_GETLASTPOS(p)   ;//$03
    SRVTERM_GETLASTPOS  :Result := GetSRVTERM_GETLASTPOS(p)   ;//$83
    TERMSRV_GETDEVSTAT  :Result := GetTERMSRV_GETSTAT(p)      ;//$04
    SRVTERM_GETDEVSTAT  :Result := GetSRVTERM_GETSTAT(p)      ;//$84
    SRVTERM_GPSDATA     :Result := GetSRVTERM_GPSDATAV20(p)   ;//$85
    TERMSRV_CALLDEV     :Result := GetTERMSRV_CALLDEV(p)      ;//$06
    SRVTERM_CALLDEV     :Result := GetSRVTERM_CALLDEV(p)      ;//$86
    TERMSRV_SWCTRL      :Result := GetTERMSRV_SWITCHCTRL(p)   ;//$07
    SRVTERM_SWCTRL      :Result := GetSRVTERM_SWITCHCTRL(p)   ;//$87
    TERMSRV_SENDDEVMSG  :Result := GetTERMSRV_SENDDEVMSG(p)   ;//$08
    SRVTERM_SENDMSG     :Result := GetSRVTERM_SENDMSG(p)      ;//$89
    TERMSRV_PING        :Result := GetTERMSRV_PING(p)         ;//$0A
    SRVTERM_PING        :Result := GetSRVTERM_PING(p)         ;//$8A
    SRVTERM_NOTIFYMSG   :Result := GetSRVTERM_NOTIFYSTAT(p)   ;//$8B
    TERMSRV_CANCELCMD   :Result := GetTERMSRV_CANCELCMD(p)    ;//$0C
    SRVTERM_CANCELCMD   :Result := GetSRVTERM_CANCELCMD(p)    ;//$8C
    SRVTERM_LASTGPSDATA :Result := GetSRVTERM_LASTGPSDATA(p)  ;//$8D
  else
    Result := '未知命令';
  end;
 }
end;

 //从六字节的bcd码北京时间返回 时间类型。
function GetTimeFromBcd(AOrg: array of Byte): TDateTime;
var
  year, mon, day, hour, min, sec: Word;
  Error: Boolean;
begin
  AOrg[0] := BcdToByte(AOrg[0]);
  AOrg[1] := BcdToByte(AOrg[1]);
  AOrg[2] := BcdToByte(AOrg[2]);
  AOrg[3] := BcdToByte(AOrg[3]);
  AOrg[4] := BcdToByte(AOrg[4]);
  AOrg[5] := BcdToByte(AOrg[5]);
  if (AOrg[1] = 0) and (AOrg[2] = 0) and (AOrg[3] = 0) and (AOrg[4] = 0) and (AOrg[5] = 0) then
  begin
    Result := EncodeDate(2000, 1, 1) + EncodeTime(0, 0, 0, 0);
    exit;
  end;
  //====================================================
  Error := False;
  year := 2000 + AOrg[0];
  mon := AOrg[1];
  if not ((mon > 0) and (mon <= 12)) then Error := True;
  day := AOrg[2];
  if not ((day > 0) and (day <= 31)) then Error := True;
  hour := AOrg[3];
  if not ((hour >= 0) and (hour <= 23)) then Error := True;
  min := AOrg[4];
  if not ((min >= 0) and (min <= 59)) then Error := True;
  sec := AOrg[5];
  if not ((sec >= 0) and (sec <= 59)) then Error := True;
  if Error then
  begin
    Result := EncodeDate(2000, 1, 1) + EncodeTime(0, 0, 0, 0);
    exit;
  end;
  try
    Result := EncodeDate(year, mon, day) + EncodeTime(hour, min, sec, 0);
  except
    Result := EncodeDate(2000, 1, 1) + EncodeTime(0, 0, 0, 0);
  end;
end;

{计算校验和- 异或}
function GetXorSum(Buff: Pointer; ALen : integer):Byte;
var
  i: integer;
  p: PByte;
  checkSum : Byte;
begin
  p:= PByte(Buff);
  checkSum := 0;
  for i:= 0 to Alen-1 do
  begin
    checkSum := checkSum xor p^;
    Inc(p);
  end;
  Result:= checkSum;
end;

end.
