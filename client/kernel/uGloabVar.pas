unit uGloabVar;

interface
uses
  comCtrls, SysUtils, classes, ExtCtrls, UserUnit, CarUnit, BusinessServerUnit, ParamUnit,
  MapProj, GateWayServerUnit, ResUnit, Forms, windows, Messages, gpslibunit,
  ConfineAreaUnit,cxTL,ParamReadFrmUnit, TextUnit, SystemLog,
  InTheMapAddressName,FamilyName,CallClientUnit,StructDefUnit,
  mapplatform, ReadAreaListUnit, ConstDefineUnit,
  ConnectingBizFrmUnit,DBClient, DB, Graphics,
  CmdStructUnit,IntegerListUnit,OleCtrls,ActiveX, WMPLib_TLB, Controls, DisposeCarUnit, MSNPopUp,
  Types, IdHashMessageDigest, IdGlobal, IdHash;
 {  orderUnit, SendOrderMiniFrmUnit,      }
type

  TReceivePhone = record
    user_id: Integer;
    receiveDateTime: TDateTime;
    Num: Integer;
    sType: Integer;
  end;
  PReceivePhone = ^TReceivePhone;

  TCurrentReceivePhone = record
    ALL: Integer;
    Already: Integer;
  end;

  TPhotoInfo = record
    PicIndex: Integer;
    pInfo: PCmdInfo;
    Dev: TDevice;
    MCUPicIndex: Integer;
  end;
  PPhotoInfo = ^TPhotoInfo;


var
  //===加个全局控制发送命令的动态数组

  current_user    : TUser;
  Logined         : Boolean;
  MapFiles        : Tstrings;
  IsUseVoiceServer: boolean; //是否使用电话服务器
  TelIsRing       : boolean; //电话是否在响铃
  TelIsConnect    : boolean; //电话是否在接通状态
  TelCount        : TClientCountData; //在线电话数量.即可以接外线电话数.
  FMap            : TGpsMap;
  Bs              : TBusinessSeverCom;//业务服务器
  FGis            : TGisPlatform;
  DataServer      : TGateWayServerCom;//网关服务器
  isAdd:boolean;
  currAlarmInfo: TAlarmInfoFromDev;
  
  FactoryAreaManage :TFactoryAreaManage;//工厂工地管理器

  ADevGroupManage : TDevGroupManage;  //组        管理器
  ADeviceManage   : TDeviceManage;    //设备　　　管理器

  AGovDeviceManage: TDeviceManage;    //政府平台发送的设备管理器

  AImgResManage   : TImgResManage;    //资源　　　管理器
  ACarManage      : TCarManage;       //车辆      管理器
  ACarNOManage    : TCarNOManage;
  GlobalParam     : TSystemParam;     //参数      管理器
  Project         : TProjection;
  ACmdManage      : TCmdManage;       //命令      管理器
  GAreaManage     : TAreaManage;      //
  FAllAreaManage     :  TAllAreaMange ;
  GTextManage     : TUserDefinedTextManager;//用户自定义标签管理器
  ADriverManage   : TDriverManage;
//  AOrderManage    : TOrderManage;     //订单      管理器
  AddressName     : MapAddressName;   //地图上的名字...也就是地名..管理器.
  FamilyName      : TFamilyName;
  SystemLog       : TSystemLog;        //系统日志
  //ResManage        : TResList;
//  PassengerManage : TPassengerManage;  //乘客信息管理器

  FNoticeManage: TNoticeManage;
  FTerminalUgpradeVerManage: TTerminalUpgradeVerManage;

  GCurSelectGroupID: integer;        //当前选中的车辆分组的ID ..另：报警车辆-2，所有监控车辆-1
  GCurSelectDev    : TDevice;        //当前选中的车辆
  GCurSelectDev_rundata    : TDevice;        //当前选中的车辆
  GOldFollowDev    : TDevice;        //原跟踪车辆，主要是在报警时记下原跟踪车辆。在报警解除后再对它恢复跟踪
  GCurConfineArea  : TConfineArea;   //当前选中的区域
//  SendOrderListFrm : array of TSendOrderMiniFrm ;
//  FCallClient      : TCallClient;    //电话服务器客户端.
  LastTelephone    : string;         //最后一个通话电话的号码
  LastCallID       : integer;
  VersionFor       : string;
  ReportFooter     : String;//打印报表时，报表的页脚内容 sha 20090122
  CancelMenuFun    : string;
  GSetParamCmdID   : Integer;
  GSetParamCmdID_SMS:Integer; 
  GReadParamCmdID  : integer;
  ReadParamFrm     : TParamReadFrm;
  FrmReadAreaFor:TfrmReadAreaForList;      //读取电子围栏
  ADtimeControl:boolean;//
  carlist1:TList ;      //====南通
  carlist2:TList;
  carlist3:TList;
  carfindTime:integer;
  ExePath          : string;
  onlineP          : string; //在线率

  ConstIP          : string;
  ConstPortOfBiz   : word;
  ConstPortOfGate  : word;
  taxiType : integer;
  FrmConnectingBiz : TConnectingBizFrm; //正在连接业务服务器 窗体
  LastSendMsg : string;//最后一次发送的文本调度信息
  LastSendMsg_NeedAnswer : string; //最后一次发送的需回复文本调度

  RoadManage:TRoadManage; //路段管理器

  SpecialCarList: TList;   // 重点监控车辆

  EarlyWarningCarList:TStringList; //TIntegerList;
  JudgeNotOkList: TIntegerList;
  MediaPlayer: TWindowsMediaPlayer;
  CarTypeManage: TCarTypeManage;

  bAlarm: Boolean;      // true：有紧急报警功能 有权限时，才能听到声音，才能看到地图上该车辆的红色圈标志
  bEarlyAlarm: Boolean; // true：有预警处理功能 有权限是，才能听到声音，才能看到地图上该车辆的粉红色圈标志
//  bOrder: Boolean;      // true：有发送订单的权限,从而可以处理取消订单，完成订单，订单状态改变，发送订单功能
  bReportAnswer: Boolean; // true：有提问应答的权限， 才能看到提问应答列表
  bSeverJudge: Boolean; // true: 有服务评价权限，才能看到服务评价列表

  LvSort: Boolean; //控制ListView的升序或降序转换

//  SaveCMD: TQueryADevGroupManage; // 保存发送命令的线程

//  AssembleWarring: TAssembleWarring;

  ImageListCar: TImageList;
  Image: TImage;
//  FEmptyCount, FFullCount: Integer;

  FComplaintsCount: Integer;  // 投诉量
  FComplainedCount: Integer;  // 投诉处理量

  ReceivePhoneList: TIntegerList;
  CurrentReceivePhone: TCurrentReceivePhone;


  PhotoInfoList: TIntegerList;  // 有照片过来时，通过线程到数据库中查询照片

  IsQueryCarInfo: Boolean;  // 车辆信息已经查询结束，等待解析
  IsQueryDevInfo: Boolean;  // 设备信息已经查询结束，等待解析

  uCarInfo: string;  // 从数据库中查询到的车辆信息，赋给TClientdate.XMLData
  uDevInfo: string;  // 从数据库中查询到的设备信息，赋给TClientdate.XMLData

  DisposeCar: TDisposeCar;

  FAllDevEventList: TDevEventInfoManage;
  FAllDevTelList: TDevTelListManage;
  FInfoTypeManage: TInfoTypeManage;
  FAlarmInfoManage: TAlarmINfoFromDevManage;
  FAlarmSuperviseManage: TAlarmSuperviseManage;
  FGovInfoManage: TGovInfoManage;

  LogOffSet: Integer=0;   // 监控端中的经度传给51地图时的偏移量，默认为南京的偏移量
  LatOffSet: Integer=0;   // 监控端中的纬度度传给51地图时的偏移量，默认为南京的偏移量
  // liusen
  BaseNum: Integer=1;
  AutoFollowDevice: TDevice;

  FGlobalTip: TMyHintWindow;
  //把鼠标当作一个车机来处理.主要是解决当前鼠机显示在哪个省市县
  FMouseDev: TDevice;

  FIsDevOnLineChanged: Boolean = True;
  FIsMapConfigLoaded: Boolean = False;
  VideoChannelUseAry: array[0..15] of Boolean;
  FFrmShowVideoList: TStringList;

//  MSNPopUp: TMSNPopUp;
  function PtrAdd(p: pointer; offset: integer): pointer;
  function CustormSortProc(Item1, Item2: TListItem; ParamSort: Integer): Integer;  stdcall;
  function CustomSortProc(Item1, Item2: TListItem; ParamSort: integer): integer; stdcall;
  function FindNodeByTextIncxTreeList(const FindStr:string;cxTreeList: TcxTreeList;ColumnOrder:Integer): TcxTreeListNode;
  function FindNodeWithChildrenByTextIncxTreeList(const FindStr:string;cxTreeList: TcxTreeList;ColumnOrder:Integer): TcxTreeListNode;
  function FindTreeListNode(const FindStr:string; ColumnOrder:Integer; const FindStr2:string; ColumnOrder2:Integer; cxTreeList: TcxTreeList): TcxTreeListNode;
  function getCmdStat(stat: integer): string;

  procedure Locate_Car(dev: TDevice; desc: string);
  function DelInvalidStr(inStr: string): string; // 去掉无效字符
//  function GetSendOrderFrm:TSendOrderMiniFrm;
//  function GetFocusSendOrderFrm:TSendOrderMiniFrm;
//  function FindSendOrderFrm(OrderID:Integer):TSendOrderMiniFrm;
//  procedure FreeSendOrderFrm;
  function CxTreeListToCSVFile(cxTreeList: TcxTreeList): boolean;
  procedure MediaPalySound(URL: string);
  function BCDToStr1(ABuff: Pointer; len: Integer): string;
  function OpenFile(FilePath: string): string;
  function SafeSql(const s: string): string;
  function getCarAngle(angel: integer): string;
  function AddReceivePhone(User_id: Integer; Num: Integer; sType: Integer): Boolean;
  function AddPhotoInfo(dev: TDevice; picIndex: Integer; pInfo: PCmdInfo; MCUPicIndex: Integer): Boolean;
  function GetDateTimeByID(PictureId: LongWord): string;  // 根据存储照片/音频上传上来的ID的转化为时间
  function PopMsg(Title:string;Msg:string):boolean;
  procedure ShowTips(aTip: string; aCom: TControl);//在aCom组件左下方提示信息
  function StrToBCD(str: string; bcdLen: Integer): TByteDynArray;
  procedure InitByteArray(var byteArray: array of Byte);
  function getMD5Str(sourc: string): string;
  procedure InitStr(var AStr: string; len: Word);
  procedure FillStr(var source: string; destLen: Integer; fillChar: string);
  function GetFormattedLenStr(const srcStr: string; dstLen: Integer; fillChar: string; isFillLeft: Boolean = True; isTruncateFromRight: Boolean = True): string;
  function DevId_StrToBCD(Value: string): TDEV_ID_BCD_ZDCL; //将整形数转换为BCD码
  function DevId_StrToBCDHRB(Value: string): TDEV_ID_BCD_HRB; //将整形数转换为BCD码
  function GetAlarmTypeName(alarmTypeId: Byte): string;
  function EscapeByteBuf(pBuf:Pointer; len: Integer; flag: Byte): TByteDynArray;//字节数组转义
  procedure UnCompressionStream(var ASrcStream:TMemoryStream); //解压缩
  function GetGpsTime(AOrg: array of Byte): TDateTime;
  function GetGpsTime_BCD7(AOrg: array of Byte): TDateTime;
  function GetGovAlarmGpsTime(AOrg: array of Byte): TDateTime;
  function GetDevAreaTypeName(areaType: Integer): string;
  function GetDevAreaTypeNameInQueryAlarm(areaType: Integer): string;
  function GetGpsDataAlarmTypeName(alarmTypeId: Integer): string;
  function GetGpsDataAlarmTypeNameInQuery(alarmTypeId: Integer): string;
  function GetCarNo(devId: string): string;
  function GetAreaName(areaNo: Integer; areaType: Byte): string;
  function GetAlarmDealStatus(status: Integer): string;
  function getSonGroupIdList(parentGroupId: Integer): string;
  function GetMediaType(typeId: Integer): string;
  function GetMediaFormatName(formatId: Integer): string;
  function GetMediaEventName(eventId: Integer): string;
  function GetSrvName(srvType: Integer): string;
  function GetSrvRunStatus(statusId: Integer): string;
  function GetTreeNodeByGroupId(groupId: Integer; aTreeView: TTreeView): TTreeNode;
  function Split(Str: string; Value: Char): Variant;
  function GetDevAlarmDealStatusName(currStatus: Integer; alarmInfo: TAlarmInfoFromDev): string;
  function GetCarCpColor(colorId: Integer): string;
  function GetReplyCmdId(srcCmdId: Integer): Integer;
  //报警信息来源
  function GetGovAlarmSrc(srcId: Integer): string;
  function GetGovAlarmType(typeId: Integer): string;
  //督办级别
  function GetGovAlarmLevel(levelId: Integer): string;

  function GetGovGpsTime(date: array of Byte; time: array of Byte): TDateTime;

  function GetMediaChannel(channelId: Integer): string;
  function GetRunTimeStr(runTime: LongWord): string;
  function ByteArrToHexStr(buf: array of Byte): string;

  function DelFromShowVideoList(devIdChannelId: string): Boolean;

  procedure group_list(AParant_ID: integer; Anode: TTreenode; Acurrent_cnt: integer;Treeview1:TTreeView);
  procedure addSysLog(sLog: string);
  function IsBeiDouDev(dev: TDevice): Boolean;
  procedure showAppMsgBox(msg: string);
  procedure showMyMsgBox(Handle: THandle; msg: string);
  function GetUpgradeTypeName(upgradeType: Integer): string;
  function GetUpgradeTerminalRetStr(upgradeRet: Integer): string;
  function GetParamIdByCheckNo(chkNo: Integer): LongWord;

implementation
uses umainf,Dialogs,elog, Math, DateUtils, ZLib;

function OpenFile(FilePath: string): string;
var
  ft: TextFile;
  data: string;
  temp: string;
begin
  try
    // 读取文件中的内容
    AssignFile(ft, FilePath);
    Reset(ft);
    repeat Readln(ft,data);
      temp := temp + data;
    until eof(ft) = true;
  finally
    CloseFile(ft);
  end;
  Result := temp;
end;

function CustormSortProc(Item1, Item2: TListItem; ParamSort: Integer): Integer;  stdcall;
var
  txt1, txt2: string;
begin
  if (ParamSort <> 0) then
  begin
    txt1 := Item1.SubItems.Strings[ParamSort - 1];
    txt2 := Item2.SubItems.Strings[ParamSort - 1];
    if (LvSort) then
      Result := CompareText(txt1, txt2)
    else
      Result := -CompareText(txt1, txt2);
  end
  else
  begin
    if (LvSort) then
      Result := CompareText(Item1.Caption, Item2.Caption)
    else
      Result := -CompareText(Item1.Caption, Item2.Caption);
  end;
end;

function CustomSortProc(Item1, Item2: TListItem; ParamSort: integer): integer; stdcall;
begin
  if ParamSort>0 then
    Result := CompareText(Item1.SubItems.Strings[ParamSort-1],Item2.SubItems.Strings[ParamSort-1])
  else
    Result := CompareText(Item1.Caption,Item2.Caption);
end;

function FindNodeByTextIncxTreeList(const FindStr:string;cxTreeList: TcxTreeList;ColumnOrder:Integer): TcxTreeListNode;
var
  i:integer;
begin
  result:= nil;
  for i:= 0 to cxTreeList.Count -1 do
  begin
    if cxTreeList.Items[i].Values[ColumnOrder]= FindStr then
    begin
      Result := cxTreeList.Items[i];
      Break;
    end;
  end;
end;

function FindNodeWithChildrenByTextIncxTreeList(const FindStr:string;cxTreeList: TcxTreeList;ColumnOrder:Integer): TcxTreeListNode;
var
  i:integer;
  node: TcxTreeListNode;
begin
  result:= nil;
  for i:= 0 to cxTreeList.Count -1 do
  begin
    node := cxTreeList.Items[i];
    if node.HasChildren and (node.Values[ColumnOrder]= FindStr) then
    begin
      Result := node;
      Break;
    end;
  end;
end;

function FindTreeListNode(const FindStr:string; ColumnOrder:Integer; const FindStr2:string; ColumnOrder2:Integer; cxTreeList: TcxTreeList): TcxTreeListNode;
var
  i:integer;
begin
  result:= nil;
  for i:= 0 to cxTreeList.Count -1 do
  begin
    if (cxTreeList.Items[i].Values[ColumnOrder]= FindStr) and (cxTreeList.Items[i].Values[ColumnOrder2]= FindStr2) then
    begin
      Result := cxTreeList.Items[i];
      Break;
    end;
  end;
end;

function getCmdStat(stat: integer): string;
begin
  case stat of
     CMD_SNDNODO          : result := '正在发送...';  //  =0   // 已发送未执行
     CMD_DONE             : result := '已执行!';      //  =1   // 已执行
     CMD_DOERROR          : result := '执行错!';      //  =2   // 执行出错
     CMD_CANCELByUSER     : result := '正在取消...';  //  =3   // 被用户取消
     CMD_CANCELED         : result := '已取消!';      //  =4   // 已取消
     CMD_CANCELFAIL       : result := '取消失败!';    //  =5   // 取消失败
     CMD_RESND            : result := '再次发送...';  //  =6   // 重发
     CMD_DELETED          : result := '被删除';       //  =7   // 被删除
     CMD_REPLACE          : result := '被替代';       //  =8   // 被替代
     CMD_OVERTIME         : result := '超时';         //  =9   // 超时
     CMD_SND2SMSSENDSVR   : result := '已转给SMS发送服务器';   // =10
     CMD_INVALIDDEV       : result := '无效的车机ID号';//=11
     CMD_NOPIC            : Result := '没有符合条件的照片';//=12
  end;
end;

function StrToBCD(str: string; bcdLen: Integer): TByteDynArray;
var
  i,j: Integer;
  temp: string;
begin
  SetLength(Result, bcdLen);
  temp := str;
  try
    for i:=0 to bcdLen - 1 do
    begin
      Result[i] := StrToInt('$' + copy(temp,i*2+1,2));
    end;
  except
    InitByteArray(Result);
  end;
end;

procedure InitByteArray(var byteArray: array of Byte);
var
  i: Integer;
begin
  for i := 0 to Length(byteArray) - 1 do
  begin
    byteArray[i] := 0;
  end;
end;

function getMD5Str(sourc: string): string;
var
  md5: TIdHashMessageDigest5;
  d: T4x4LongWordRecord;
begin
  md5 := TIdHashMessageDigest5.Create;
  try
    try
      d := md5.HashValue(sourc);
      Result := md5.AsHex(d);
    except
      Result := '00000000000000000000000000000000'
    end;
  finally
    md5.Free;
  end;
end;

procedure InitStr(var AStr: string; len: Word);
var
  i: integer;
begin
  SetLength(AStr, len);
  for i := 1 to len+1 do
    AStr[i] := #0;
end;

procedure FillStr(var source: string; destLen: Integer; fillChar: string);
var
  i: Integer;
  srcLen: Integer;
begin
  srcLen := Length(source);
  if (srcLen < destLen) then
  begin
    for i := 0 to destLen - srcLen - 1 do
    begin
      source := fillChar + source;
    end;
  end;
end;

//获取指定长度的字符串，不足填充，过长截取，isFillLeft=true 左填充  isTruncateFromRight=true从右截取
function GetFormattedLenStr(const srcStr: string; dstLen: Integer; fillChar: string; isFillLeft: Boolean = True; isTruncateFromRight: Boolean = True): string;
var
  dstStr: string;
  srcLen: Integer;
  i: Integer;
begin
  dstStr := srcStr;
  srcLen := Length(srcStr);
  if dstLen > srcLen then//填充
  begin
    if isFillLeft then
    begin
      for i := 1 to (dstLen - srcLen) do
      begin
        dstStr := fillChar + dstStr;
      end;  
    end
    else
    begin
      for i := 1 to (dstLen - srcLen) do
      begin
        dstStr := dstStr + fillChar;
      end;
    end;    
  end
  else if dstLen < srcLen then//截取
  begin
    if isTruncateFromRight then
    begin
      dstStr := Copy(srcStr, 1, dstLen);
    end
    else
    begin
      dstStr := Copy(srcStr, srcLen - dstLen + 1, dstLen);
    end;  
  end;
  Result := dstStr;
end;

function DevId_StrToBCD(Value: string): TDEV_ID_BCD_ZDCL; //将整形数转换为BCD码
var
  BCD: TDEV_ID_BCD_ZDCL;
  i,j: Integer;
  temp: string;
begin
  temp := Value;
  if (Length(temp) < 12) then
  begin
    FillStr(temp, 12, '0');
  end;  
  for i:=0 to 5 do
  begin
    try
      BCD[i] := StrToInt('$' + copy(temp,i*2+1,2));
    except
      BCD[i] := 0;
    end;
  end;
  Result := BCD;
end;

function DevId_StrToBCDHRB(Value: string): TDEV_ID_BCD_HRB; //将整形数转换为BCD码
var
  BCD: TDEV_ID_BCD_HRB;
  i,j: Integer;
  temp: string;
begin
  temp := Value;
  if (Length(temp) < 10) then
  begin
    FillStr(temp, 10, '0');
  end;  
  for i:=0 to 4 do
  begin
    try
      BCD[i] := StrToInt('$' + copy(temp,i*2+1,2));
    except
      BCD[i] := 0;
    end;
  end;
  Result := BCD;
end;

function GetAlarmTypeName(alarmTypeId: Byte): string;
begin
  Result := '报警类型未知(ID=' + IntToStr(alarmTypeId) + ')';
  case alarmTypeId of
    0: Result := '出区域报警';
    1: Result := '进区域报警';
    2: Result := '路线报警';
    3: Result := '聚集报警';
    4: Result := '出城溜台';
    5: Result := '疑似上访';
  end;
end;

{
  数据转义可能不需要客户端转义了，此改为flag为1时转义 2时还原 其他则返回原数据内容
  原调用该函数进行转义的地方无需改变
}
function EscapeByteBuf(pBuf:Pointer; len: Integer; flag: Byte): TByteDynArray;
var
  buf: TByteDynArray;
  p: PByte;
  p2: PByte;
  i: Integer;
  count: Integer;//记录转义了几次
begin
  SetLength(buf, len);
  CopyMemory(@buf[0], pBuf, len);
  count := 0;
  if (flag = 1) then
  begin//转义
    for i := 1 to len - 2 do//从消息头开始到校验码
    begin
      p := PByte(PtrAdd(pBuf, i));
      if (p^ = ESCAPEBYTE1) then
      begin
        SetLength(buf, Length(buf) + 1);
        CopyMemory(@buf[i + count + 2], PtrAdd(pBuf, i + 1), len - 1 - i);
        buf[i + count] := ESCAPEBYTE2;
        buf[i + 1 + count] := $02;
        Inc(count);
      end
      else if (p^ = ESCAPEBYTE2) then
      begin
        SetLength(buf, Length(buf) + 1);
        CopyMemory(@buf[i + count + 2], PtrAdd(pBuf, i + 1), len - 1 - i);
        buf[i + 1 + count] := $01;
        Inc(count);
      end;
    end;
  end
  else if (flag = 2) then
  begin//还原
    for i := 1 to len - 3 do//从消息头开始到校验码
    begin
      p := PByte(PtrAdd(pBuf, i));
      p2 := PByte(PtrAdd(pBuf, i + 1));
      if (p^ = ESCAPEBYTE2) and (p2^ = $02) then
      begin
        buf[i - count] := ESCAPEBYTE1;
        CopyMemory(@buf[i - count + 1], PtrAdd(pBuf, i + 2), len - 1 - i - 1);
        SetLength(buf, Length(buf) - 1);
        Inc(count);
      end
      else if (p^ = ESCAPEBYTE2) and (p2^ = $01) then
      begin
        CopyMemory(@buf[i - count + 1], PtrAdd(pBuf, i + 2), len - 1 - i - 1 );
        SetLength(buf, Length(buf) - 1);
        Inc(count);
      end;
    end;
  end;
  Result := buf;
end;

procedure UnCompressionStream(var ASrcStream:TMemoryStream); //解压缩
var
  nTmpStream:TDecompressionStream;
  nDestStream:TMemoryStream;
  nBuf: array[1..512] of Byte;
  nSrcCount: integer;
begin
  ASrcStream.Position := 0;
  nDestStream := TMemoryStream.Create;
  nTmpStream := TDecompressionStream.Create(ASrcStream);
  try
    repeat
      //读入实际大小
      nSrcCount := nTmpStream.Read(nBuf, SizeOf(nBuf));
      if nSrcCount > 0 then
        nDestStream.Write(nBuf, nSrcCount);
    until (nSrcCount = 0);
    ASrcStream.Clear;
    ASrcStream.LoadFromStream(nDestStream);
    ASrcStream.Position := 0;
  finally
    nDestStream.Clear;
    nDestStream.Free;
    nTmpStream.Free;
  end;
end;

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

function GetGpsTime_BCD7(AOrg: array of Byte): TDateTime;
var
  year, mon, day, hour, min, sec: Word;
  Error: Boolean;
begin
  //-------------------在设备刚登录时,在GPS天线坏或有故障，会收到全是0的数据
  if (AOrg[1] = 0) and (AOrg[2] = 0) and (AOrg[3] = 0) and (AOrg[4] = 0) and (AOrg[5] = 0) and (AOrg[6] = 0)then
  begin
    Result := EncodeDate(2000, 1, 1) + EncodeTime(0, 0, 0, 0);
    exit;
  end;
  //====================================================
  Error := False;
  year := BcdToByte(AOrg[0]) * 100 + BcdToByte(AOrg[1]);//StrToInt(IntToHex(AOrg[0], 2));
  mon := BcdToByte(AOrg[2]);//StrToInt(IntToHex(AOrg[1], 2));
  if not ((mon > 0) and (mon <= 12)) then Error := True;
  day := BcdToByte(AOrg[3]);//StrToInt(IntToHex(AOrg[2], 2));
  if not ((day > 0) and (day <= 31)) then Error := True;
  hour := BcdToByte(AOrg[4]);//StrToInt(IntToHex(AOrg[3], 2));
  if not ((hour >= 0) and (hour <= 23)) then Error := True;
  min := BcdToByte(AOrg[5]);//StrToInt(IntToHex(AOrg[4], 2));
  if not ((min >= 0) and (min <= 59)) then Error := True;
  sec := BcdToByte(AOrg[6]);//StrToInt(IntToHex(AOrg[5], 2));
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

function GetGovAlarmGpsTime(AOrg: array of Byte): TDateTime;
var
  year, mon, day, hour, min, sec: Word;
  Error: Boolean;
begin
  Error := False;
  year := BcdToByte(AOrg[0]) * 100 + BcdToByte(AOrg[1]);//StrToInt(IntToHex(AOrg[0], 2));
  mon := BcdToByte(AOrg[2]);//StrToInt(IntToHex(AOrg[1], 2));
  if not ((mon > 0) and (mon <= 12)) then Error := True;
  day := BcdToByte(AOrg[3]);//StrToInt(IntToHex(AOrg[2], 2));
  if not ((day > 0) and (day <= 31)) then Error := True;
  hour := BcdToByte(AOrg[4]);//StrToInt(IntToHex(AOrg[3], 2));
  if not ((hour >= 0) and (hour <= 23)) then Error := True;
  min := BcdToByte(AOrg[5]);//StrToInt(IntToHex(AOrg[4], 2));
  if not ((min >= 0) and (min <= 59)) then Error := True;
  sec := BcdToByte(AOrg[6]);//StrToInt(IntToHex(AOrg[5], 2));
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

function GetDevAreaTypeName(areaType: Integer): string;
begin
  case areaType of
    0: Result := '圆形区域';
    1: Result := '矩形区域';
    2: Result := '不规则图形区域';
    3: Result := '路线';
  else
    Result := '未知区域';
  end;
end;

function GetDevAreaTypeNameInQueryAlarm(areaType: Integer): string;
begin
  case areaType of
    1: Result := '圆形区域';
    2: Result := '矩形区域';
    3: Result := '不规则图形区域';
    4: Result := '路线';
  else
    Result := '未知区域';
  end;
end;

function GetGpsDataAlarmTypeName(alarmTypeId: Integer): string;
begin
  Result := '未知报警[' + IntToStr(alarmTypeId) + ']';
  case alarmTypeId of
    0: Result := '紧急报警';
    1: Result := '超速报警';
    2: Result := '疲劳驾驶';
    3: Result := '预警';
    4: Result := 'GNSS模块发生故障';
    5: Result := 'GNSS天线未接或被剪断';
    6: Result := 'GNSS天线短路';
    7: Result := '终端主电源欠压';
    8: Result := '终端主电源掉电';
    9: Result := '终端LCD或显示器故障';
   10: Result := 'TTS模块故障';
   11: Result := '摄像头故障';
   12: Result := '道路运输证IC卡模块故障';
   13: Result := '超速预警';
   14: Result := '疲劳驾驶预警';
//   15: Result := '超速报警';
//   16: Result := '紧急报警';
//   17: Result := '超速报警';
   18: Result := '当天累计驾驶超时';
   19: Result := '超时停车';
   20: Result := '进出区域';
   21: Result := '进出路线';
   22: Result := '路段行驶时间不足/过长';
   23: Result := '路线偏离报警';
   24: Result := '车辆VSS故障';
   25: Result := '车辆油量异常';
   26: Result := '车辆被盗报警';
   27: Result := '车辆非法点火';
   28: Result := '车辆非法位移';
   29: Result := '碰撞侧翻报警';
   30: Result := '侧翻预警';
   31: Result := '非法开门报警';
  end;
end;

function GetGpsDataAlarmTypeNameInQuery(alarmTypeId: Integer): string;
begin
  Result := '未知报警[' + IntToStr(alarmTypeId) + ']';
  case alarmTypeId of
    0: Result := '紧急报警';
    1: Result := '超速报警';
    2: Result := '疲劳驾驶';
    3: Result := '预警';
    4: Result := 'GNSS模块发生故障';
    5: Result := 'GNSS天线未接或被剪断';
    6: Result := 'GNSS天线短路';
    7: Result := '终端主电源欠压';
    8: Result := '终端主电源掉电';
    9: Result := '终端LCD或显示器故障';
   10: Result := 'TTS模块故障';
   11: Result := '摄像头故障';
   12: Result := '道路运输证IC卡模块故障';
   13: Result := '超速预警';
   14: Result := '疲劳驾驶预警';
//   15: Result := '超速报警';
//   16: Result := '紧急报警';
//   17: Result := '超速报警';
   18: Result := '当天累计驾驶超时';
   19: Result := '超时停车';
   20: Result := '进出区域';
   21: Result := '进出路线';
   22: Result := '路段行驶时间不足/过长';
   23: Result := '路线偏离报警';
   24: Result := '车辆VSS故障';
   25: Result := '车辆油量异常';
   26: Result := '车辆被盗报警';
   27: Result := '车辆非法点火';
   28: Result := '车辆非法位移';
   29: Result := '碰撞侧翻报警';
   30: Result := '侧翻预警';
   31: Result := '非法开门报警';
   49: Result := '超速报警(附加)';
   50: Result := '进出区域/路线(附加)';
   51: Result := '路段行驶时间不足/过长(附加)';
   52: Result := '地理栅栏防盗报警';
  end;
end;

function GetCarNo(devId: string): string;
var
  dev: TDevice;
begin
  Result := '车牌号未知,设备号[' + devId + ']';
  dev := ADeviceManage.find(devId);
  if dev <> nil then
  begin
    Result := dev.Car.No;
  end;  
end;

function GetAreaName(areaNo: Integer; areaType: Byte): string;
var
  area: TBaseArea;
begin
  Result := '';
  if areaType < 5 then
    area := FAllAreaManage.findByAreaNo(areaNo)
  else
    area := FAllAreaManage.findByLineSectionNo(areaNo);
  if area <> nil then
  begin
    Result := area.AreaName;
  end
  else
  begin
    if areaType < 4 then
      Result := '未知区域[' + IntToStr(areaNo) + ']'
    else if areaType = 4 then
      Result := '未知路线[' + IntToStr(areaNo) + ']'
    else if areaType = 5 then
      Result := '未知路线';
  end;
end;

function GetAlarmDealStatus(status: Integer): string;
begin
  Result := '未知';
  case status of
    0: Result := '报警已确认，未处理';
    1: Result := '报警已处理，未登记';
    2: Result := '报警处理结束';
  end;
end;

function getSonGroupIdList(parentGroupId: Integer): string;
var
  devGroup: TDevGroup;
  i: Integer;
  s: string;
begin
  Result := '';
  for i := 0 to ADevGroupManage.Count - 1 do
  begin
    devGroup := ADevGroupManage.Items[i];
    if devGroup.Parent = parentGroupId then
    begin
      if Result = '' then
        Result := IntToStr(devGroup.id)
      else
        Result := Result + ',' + IntToStr(devGroup.id);

      if not devGroup.leaf_nod then
      begin
        s := getSonGroupIdList(devGroup.id);
        if s <> '' then
          Result := Result + ',' + s;
      end;
    end;
  end;
end;

function GetMediaType(typeId: Integer): string;
begin
  Result := '其他';
  case typeId of
    0: Result := '图像';
    1: Result := '音频';
    2: Result := '视频';
  end;
end;

function GetMediaFormatName(formatId: Integer): string;
begin
  Result := '其他';
  case formatId of
    0: Result := 'JPEG';
    1: Result := 'TIF';
    2: Result := 'MP3';
    3: Result := 'WAV';
    4: Result := 'WMV';
  end;
end;

function GetMediaEventName(eventId: Integer): string;
begin
  Result := '其他';
  case eventId of
    0: Result := '平台下发指令';
    1: Result := '定时动作';
    2: Result := '抢劫报警触发';
    3: Result := '碰撞侧翻报警触发';
    4: Result := '疲劳报警触发';
  end;
end;

function GetSrvName(srvType: Integer): string;
begin
  Result := '';
  case srvType of
    $00: Result := '中心网关服务器';
    $01: Result := '前置网关服务器';
    $07: Result := '轨迹存储服务器';
    $08: Result := '动态稽查服务器';
    $09: Result := '记录仪数据存储服务器';
    $0A: Result := '多媒体数据存储服务器';
    $0B: Result := '政府平台交换服务器';
    $0D: Result := '南京安监扩展服务器';
  end;
end;

function GetSrvRunStatus(statusId: Integer): string;
begin
  Result := '未知';
  case statusId of
    0: Result := '正常';
    1: Result := 'UDP连接断开';
    2: Result := 'TCP连接断开';
  end;
end;

function GetTreeNodeByGroupId(groupId: Integer; aTreeView: TTreeView): TTreeNode;
var
  node: TTreeNode;
begin
  Result := nil;
  if aTreeView = nil then Exit;
  node := aTreeView.TopItem;
  while node <> nil do
  begin
    if groupId = Integer(node.Data) then
    begin
      Result := node;
      Break;
    end;
    node := node.GetNext;
  end;
end;      


function PtrAdd(p: pointer; offset: integer): pointer;
begin
  Result := Pointer(Integer(p) + offset);
end;

function PopMsg(Title:string;Msg:string):boolean;
begin
  with umainf.mainf do
  begin
    MSNPopUp1.Title:=Title+'  ';
    MSNPopUp1.Text:=Msg;
    Result:=MSNPopUp1.ShowPopUp;
  end;
end;

procedure ShowTips(aTip: string; aCom: TControl);
begin
  FGlobalTip.ShowHint(aTip, aCom);
end;

procedure Locate_Car(dev: TDevice; desc: string);
begin
  //GCurSelectDev_rundata.Longitude := dev.Longitude;
  //GCurSelectDev_rundata.Latitude := dev.Latitude;
  GCurSelectDev_rundata := dev;
  umainf.Mainf.fun_Locate_CarExecute_rundata(desc);
end;

// 去掉无效字符
function DelInvalidStr(inStr: string): string;
var
  i,n : integer;
  tmpByte,byte2 : byte;
begin
  i:=1;
  n:= length(inStr);
  while i<=n do
  begin
    tmpByte:= ord(inStr[i]);
    if (tmpByte<$20) or ((tmpByte>$7f) and (tmpByte<$A1)) then
    begin
      delete(inStr,i,1);
      i:= i-1;
    end
    else if tmpByte>=$A1 then
    begin
      byte2:= ord(inStr[i+1]);
      if (tmpByte> $F7) or (byte2< $A0) then
      begin
        delete(inStr,i,2);
        i:= i-1;
      end
      else
        i:= i+1;
    end;
    i:= i+1;
    n:= length(inStr);
  end;
  Result:= inStr;
end;

//function GetSendOrderFrm:TSendOrderMiniFrm;
//var
// i:integer;
// len:integer;
//begin
//  Len:=Length(SendOrderListFrm);
//  if Len>5 then
//  begin
//    for i:=Len-1 downto 5 do
//    begin
//      if not SendOrderListFrm[i].Showing then
//      begin
//         SendOrderListFrm[i].Free;
//         SendOrderListFrm[i]:=nil;
//         SetLength(SendOrderListFrm,i);
//      end
//      else
//      begin
//         break;   //跳出循环...
//      end;
//    end;
//  end;
//  Len:=Length(SendOrderListFrm);
//  for i:=0 to Len-1 do
//  begin
//     if not SendOrderListFrm[i].Showing then
//     begin
//         Result:=SendOrderListFrm[i];
//         exit;   //跳出函数...
//     end;
//  end;
//  SetLength(SendOrderListFrm,len+1);
//  SendOrderListFrm[Len]:= TSendOrderMiniFrm.Create(nil);
//  Result:=SendOrderListFrm[Len];
//end;
//
//
//function GetFocusSendOrderFrm:TSendOrderMiniFrm;
//var
//  i:integer;
//begin
//  Result:=nil;
//  for i:=0 to Length(SendOrderListFrm)-1 do
//  begin
//    if (SendOrderListFrm[i].Showing)and(SendOrderListFrm[i].WindowState<>wsMinimized) then
//    begin
//      if Result=nil then
//      begin
//        Result:=SendOrderListFrm[i];
//      end
//      else
//      begin
//        if Result.LastActivate < SendOrderListFrm[i].LastActivate then
//           Result:=SendOrderListFrm[i];
//      end;
//    end;
//  end;
//end;
//
//function FindSendOrderFrm(OrderID:Integer):TSendOrderMiniFrm;
//var
//  i:integer;
//begin
//  for i:=0 to  Length(SendOrderListFrm)-1 do
//  begin
//   try
//    if SendOrderListFrm[i].Showing then
//    begin
//      try
//        if StrToInt(SendOrderListFrm[i].EditOrderID.Text)=OrderID then
//        begin
//          Result:=SendOrderListFrm[i];
//          exit;
//        end;
//      except
//        continue;
//      end;
//    end;
//   except
//     continue;
//   end;
//  end;
//  Result:=nil;
//end;
//
//procedure FreeSendOrderFrm;
//var
//  i:integer;
//begin
//  for i:=0 to  Length(SendOrderListFrm)-1 do
//  begin
//    SendOrderListFrm[i].Free;
//  end;
//end;

function CxTreeListToCSVFile(cxTreeList: TcxTreeList): boolean;
var
  List:TStringList;
  SaveDialog:TSaveDialog;
  i,ii:integer;
  s,temp:string;
  Flags: TReplaceFlags;
begin
  Result:=false;
  List:=TStringList.Create;
  //Flags
  try
    List.Clear;
    s:='';
    for i:=0 to cxTreeList.ColumnCount-1 do
    begin
      if i=0 then
        s:=s+cxTreeList.Columns[i].Caption.Text
      else
        s:=s+','+cxTreeList.Columns[i].Caption.Text;
    end;
    List.Add(s);
    for i:=0 to cxTreeList.Count-1 do
    begin
      temp:=trim(cxTreeList.Items[i].Texts[0]);
      if pos(',',temp)>0 then
      temp:=StringReplace(temp,',','","',Flags);
      s:=temp;
      for ii:=1 to cxTreeList.Items[i].ValueCount-1 do
      begin
          temp:=trim(cxTreeList.Items[i].Texts[ii]);
          if pos(',',temp)>0 then
          //temp:=StringReplace(temp,',','","',Flags);
          temp:='"'+temp+'"';
          s:=s+','+temp;
      end;
      List.Add(s);
    end;

    SaveDialog:=TSaveDialog.Create(Application.MainForm);
    SaveDialog.Filter:='Execl文件(*.CSV)|*.CSV';
    try
      if SaveDialog.Execute  then
      begin
       List.SaveToFile(SaveDialog.FileName+'.CSV');
       Result:=true;
      end;
    finally
      SaveDialog.Free;
    end;
  finally
    List.Free;
  end;
end;

procedure MediaPalySound(URL: string);
begin
  if FileExists(URL) then
  begin
    MediaPlayer.URL := URL;
    MediaPlayer.controls.play;
  end;
end;

function BCDToStr1(ABuff: Pointer; len: Integer): string;
var
  i: Integer;
  temp: string;
begin
  temp:='';
  try
    for i:=0 to len - 1 do
    begin
      temp:=temp+InttoHex((PByte(ABuff)^),2);
      inc(PByte(ABuff));
    end;
  except
    Result := ''
  end;
  Result := temp;
end;

function SafeSql(const s: string): string;
begin
  Result := StringReplace(s, #13#10, '', [rfReplaceAll]);
  Result := QuotedStr(Result);
end;

function getCarAngle(angel: integer): string;
begin
  Result := '';
  case angel*100 of
    0..2250: begin
        Result := '正北';
      end;
    2251..6750: begin
        result := '东北';
      end;
    6751..11250: begin
        result := '正东';
      end;
    11251..15750: begin
        result := '东南';
      end;
    15751..20250: begin
        Result := '正南';
      end;
    20251..24750: begin
        Result := '西南';
      end;
    24751..29250: begin
        Result := '正西';
      end;
    29251..33750: begin
        Result := '西北';
      end;
    33751..36000: begin
        Result := '正北';
      end else
    begin
      Result := ' ';
    end;
  end;
end;

function AddPhotoInfo(dev: TDevice; picIndex: Integer; pInfo: PCmdInfo; MCUPicIndex: Integer): Boolean;
var
  p: PPhotoInfo;
begin
  try
    new(p);
    p^.PicIndex := picIndex;
    p^.pInfo := pInfo;
    p^.dev := dev;
    p^.MCUPicIndex := MCUPicIndex;
    PhotoInfoList.AddData(p^.picIndex, p);
  except
  end;
  Result := True;
end;

function GetDateTimeByID(PictureId: LongWord): string;
var
  i: Integer;
  DateTime: string;
  Year, Month, Day, Hour, Minute, Second: Integer;
  temp: Integer;
begin
  try
    Year := 0;
    Month := 0;
    Day := 0;
    Hour := 0;
    Minute := 0;
    Second := 0;

    for i:=0 to 5 do    // 秒
    begin
      temp := PictureId and $1;  
      Second := Second + temp * StrToInt(FloatToStr(Power(2, i)));
      PictureId := PictureId shr 1;
    end;

    for i:=0 to 5 do   // 分
    begin
      temp := PictureId and $1;
      Minute := Minute + temp * StrToInt(FloatToStr(Power(2, i))); ;
      PictureId := PictureId shr 1;
    end;

    for i:=0 to 4 do   // 时
    begin
      temp := PictureId and $1;
      Hour := Hour + temp * StrToInt(FloatToStr(Power(2, i)));
      PictureId := PictureId shr 1;
    end;

    for i:=0 to 4 do   // 日
    begin
      temp := PictureId and $1;
      Day := Day + temp * StrToInt(FloatToStr(Power(2, i)));
      PictureId := PictureId shr 1;
    end;

    for i:=0 to 3 do   // 月
    begin
      temp := PictureId and $1;
      Month := Month + temp * StrToInt(FloatToStr(Power(2, i)));
      PictureId := PictureId shr 1;
    end;

    for i:=0 to 5 do   // 年
    begin
      temp := PictureId and $1;
      Year := Year + temp * StrToInt(FloatToStr(Power(2, i))); 
      PictureId := PictureId shr 1;
    end;

    Year := 2000 + Year;//StrToInt('20' +  FormatCurr('00',Year));

    try
      DateTime := FormatDateTime('yyyy-mm-dd hh:nn:ss', EncodeDateTime(Year, Month, Day, Hour, Minute, Second, 0));
    except
      DateTime := FormatDateTime('yyyy-mm-dd hh:nn:ss', Now);
    end;
  except
    DateTime := FormatDateTime('yyyy-mm-dd hh:nn:ss', Now);
  end;
  Result := DateTime;
end;

function AddReceivePhone(User_id: Integer; Num: Integer; sType: Integer): Boolean;
var
  p: PReceivePhone;
begin
  try
    new(p);
    p^.user_id := current_user.id;
    p^.receiveDateTime := Now;
    p^.Num := Num;
    p^.sType := sType;
    ReceivePhoneList.AddData(ReceivePhoneList.Count, p);
  except
  end;
  Result := True;
end;

function Split(Str: string; Value: Char): Variant;
var
  buf: array of string;
  count: Integer;
  i,j: Integer;
  temp: string;
begin
  if Length(str) <= 0 then
    Exit;

  if (Length(str) > 0) and (Pos(Value, str) = 0) then
  begin
    SetLength(buf, 1);
    buf[0] := Str;
    Result := buf;
  end
  else
  begin
    j := 0;
    temp := str;
    while Length(temp)>0 do
    begin
      if  Pos(Value, temp)>0 then
      begin
        j := j + 1;
        temp := Copy(temp, Pos(Value, temp)+1, Length(temp));
        if Pos(Value, temp) <= 0 then
          temp := '';
      end;
    end;

    j := j + 1;
    SetLength(buf, j);
    temp := Str;
    i := 0;
    while Length(temp)>0 do
    begin
      if i+1=j then
      begin
        buf[i] := Copy(temp, 0, Length(temp));
        Break;
      end
      else
        buf[i] := Copy(temp, 0, Pos(Value, temp)-1);
      temp := Copy(temp, Pos(Value, temp) + 1, Length(temp));
      i := i + 1;
    end;
    Result := buf;
  end;
end;

function GetDevAlarmDealStatusName(currStatus: Integer; alarmInfo: TAlarmInfoFromDev): string;
var
  sendCBCmdStauts: string;
  sendGPCmdStauts: string;
  sendTxtCmdStatus: string;
  sendRACmdStatus: string;
  s: string;
begin
  Result := '报警未确认';
  sendCBCmdStauts := '';
  sendGPCmdStauts := '';
  sendTxtCmdStatus := '';
  sendRACmdStatus := '';

  s := '';

  if alarmInfo <> nil then
  begin
    case alarmInfo.SendCallBackCmdStatus of
      1: sendCBCmdStauts := '监听命令正在下发';
      2: sendCBCmdStauts := '监听命令下发成功';
      3: sendCBCmdStauts := '监听命令下发失败';
    end;

    case alarmInfo.SendGetPicCmdStatus of
      1: sendGPCmdStauts := '拍照命令正在下发';
      2: sendGPCmdStauts := '拍照命令下发成功';
      3: sendGPCmdStauts := '拍照命令下发失败';
    end;

    case alarmInfo.SendTextCmdStatus of
      1: sendTxtCmdStatus := '报文命令正在下发';
      2: sendTxtCmdStatus := '报文命令下发成功';
      3: sendTxtCmdStatus := '报文命令下发失败';
    end;

    case alarmInfo.SendRemoveAlarmCmdStatus of
      1: sendRACmdStatus := '解除报警命令正在下发';
      2: sendRACmdStatus := '解除报警命令下发成功';
      3: sendRACmdStatus := '解除报警命令下发失败';
    end;

    if sendCBCmdStauts <> '' then
    begin
      s := '(' + sendCBCmdStauts;
    end;

    if (sendGPCmdStauts <> '') then
    begin
      if s = '' then
        s := '(' + sendGPCmdStauts
      else
        s := s + ',' + sendGPCmdStauts;
    end;

    if (sendTxtCmdStatus <> '') then
    begin
      if s = '' then
        s := '(' + sendTxtCmdStatus
      else
         s := s + ',' + sendTxtCmdStatus;
    end;

    if (sendRACmdStatus <> '') then
    begin
      if s = '' then
        s := '(' + sendRACmdStatus
      else
         s := s + ',' + sendRACmdStatus;
    end;

    if s <> '' then
      s := s + ')';
  end;

  case currStatus of
    0: Result := '报警已确认，正处理' + s;
    1: Result := '报警已处理' + s + '，未登记';
    2: Result := '报警处理结束';
  end;
end;

function GetCarCpColor(colorId: Integer): string;
begin
  Result := '未知[' + inttostr(colorId) + ']';
  case colorId of
    1: Result := '蓝色';
    2: Result := '黄色';
    3: Result := '黑色';
    4: Result := '白色';
    9: Result := '其他';
  end;
end;

function GetReplyCmdId(srcCmdId: Integer): Integer;
begin
  Result := -1;
  case srcCmdId of
    SRVTERM_GOV_CHECKDUTY: Result := TERMSRV_REPLYGOVCHECKDUTY;
//    SRVTERM_GOV_TEXTINFO:  Result := TERMSRV_REPLYGOVTEXTINFO;
  end;
end;

//报警信息来源
function GetGovAlarmSrc(srcId: Integer): string;
begin
  Result := '未知';
  case srcId of
    $01:  Result := '车载终端';
    $02:  Result := '企业监控平台';
    $03:  Result := '政府监管平台';
    $09:  Result := '其他';
  end;
end;

function GetGovAlarmType(typeId: Integer): string;
begin
  Result := '其他报警';
  case typeId of
    $0001: Result := '超速报警';
    $0002: Result := '疲劳驾驶报警';
    $0003: Result := '紧急报警';
    $0004: Result := '进入指定区域报警';
    $0005: Result := '离开指定区域报警';
    $0006: Result := '路段堵塞报警';
    $0007: Result := '危险路段报警';
    $0008: Result := '越界报警';
    $0009: Result := '盗警';
    $000A: Result := '劫警';
    $000B: Result := '偏离路线报警';
    $000C: Result := '车辆移动报警';
    $000D: Result := '超时驾驶报警';
  end;
end;

//督办级别
function GetGovAlarmLevel(levelId: Integer): string;
begin
  if levelId = $00 then
    Result := '紧急'
  else
    Result := '一般';
end;

function GetGovGpsTime(date: array of Byte; time: array of Byte): TDateTime;
var
  year, month, day: Word;
  hour, minute, second: Word;
  dt: TDateTime;
begin
  year := ByteOderConvert_Word(PWord(@date[2])^);
  month := date[1];
  day := date[0];

  hour := time[0];
  minute := time[1];
  second := time[2];

  if TryEncodeDateTime(year, month, day, hour, minute, second, 0, dt) then
    Result := IncHour(dt, 8)
  else
    Result := EncodeDate(2000, 1, 1) + EncodeTime(0, 0, 0, 0);
end;

function GetMediaChannel(channelId: Integer): string;
begin
  Result := '其他[' + IntToStr(channelId) + ']';
  case channelId of
    1:  Result := '司机上方';
    2:  Result := '前门';
    3:  Result := '前车厢';
    4:  Result := '后车厢';
    5:  Result := '前车外';
  end;
end;

function GetRunTimeStr(runTime: LongWord): string;
var
  days, hours, minutes: Integer;
  seconds: LongWord;
begin
  Result := '';
  seconds := runTime;
  days := seconds div SecondsPerDay;
  if days > 0 then
  begin
    seconds := seconds mod SecondsPerDay;
    Result := Result + IntToStr(days) + '天';
  end;

  hours := seconds div SecondsPerHour;
  if hours > 0 then
  begin
    seconds := seconds mod SecondsPerHour;
    Result := Result + IntToStr(hours) + '小时';
  end;

  minutes := seconds div SecondsPerMinute;
  if minutes > 0 then
  begin
    seconds := seconds mod SecondsPerMinute;
    Result := Result + IntToStr(minutes) + '分钟';
  end;
  Result := Result + IntToStr(seconds) + '秒';
end;

function ByteArrToHexStr(buf: array of Byte): string;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to Length(buf) - 1 do
  begin
    Result := Result + IntToHex(buf[i], 2);
  end;  
end;

function DelFromShowVideoList(devIdChannelId: string): Boolean;
var
  i: Integer;
begin
  i := FFrmShowVideoList.IndexOf(devIdChannelId);
  if i >= 0 then
    FFrmShowVideoList.Delete(i);
end;

procedure group_list(AParant_ID: integer; Anode: TTreenode; Acurrent_cnt: integer;Treeview1:TTreeView);
var
  i: integer;
  leaf_id: array of integer; //子级的 ID 数组
  leaf_cnt: integer; //子级的 ID  数组个数
  leaf_node: array of TTreenode; //子级的节点
  grp: TDevGroup;
begin
  leaf_cnt := 0;
  for i := 0 to ADevGroupManage.Count - 1 do
  begin
    grp := ADevGroupManage.items[i];
    if grp=nil then Continue;
    if grp.parent = AParant_ID then
    begin
      leaf_cnt := leaf_cnt + 1;
      setlength(leaf_id, leaf_cnt);
      setlength(leaf_node, leaf_cnt);
      leaf_id[leaf_cnt - 1] := grp.id;
      leaf_node[leaf_cnt - 1] := treeview1.Items.addchild(
        Anode, trim(grp.name)+ '(' + IntToStr(grp.DevListCount) + ')');
      leaf_node[leaf_cnt - 1].data := pointer(leaf_id[leaf_cnt - 1]);
      Acurrent_cnt := Acurrent_cnt - 1;
      if Acurrent_cnt <= 0 then break;

      if grp.leaf_nod = false then
        group_list(leaf_id[leaf_cnt - 1], leaf_node[leaf_cnt - 1], Acurrent_cnt,treeview1);
    end;
  end;
end;

procedure addSysLog(sLog: string);
begin
  SystemLog.AddLog(FormatDateTime('hh:nn:ss.zzz', Now) + ' ' + sLog);
end;
function IsBeiDouDev(dev: TDevice): Boolean;
begin
  Result := False;
  if (dev <> nil) then
  begin
    Result := Pos(BEIDOU, dev.TerminalTypeName) > 0;
  end;  
end;  

procedure showAppMsgBox(msg: string);
begin
  Application.MessageBox(PChar(msg), '提示', MB_OK + MB_ICONINFORMATION);
end;

procedure showMyMsgBox(Handle: THandle; msg: string);
begin
  MessageBox(Handle, PChar(msg), '提示', MB_OK + MB_ICONINFORMATION);
end;  

function GetUpgradeTypeName(upgradeType: Integer): string;
begin
  Result := '未知类型(' + IntToStr(upgradeType) + ')';
  case upgradeType of
    0:  Result := '终端';
    12: Result := '道路运输证 IC 卡读卡器';
    52: Result := '北斗卫星定位模块';
  end;
end;

function GetUpgradeTerminalRetStr(upgradeRet: Integer): string;
begin
  Result := '结果未知(' + IntToStr(upgradeRet) + ')';
  case upgradeRet of
    0:  Result := '成功';
    1: Result := '失败';
    2: Result := '取消';
  end;
end;

function GetParamIdByCheckNo(chkNo: Integer): LongWord;
var
  ret: LongWord;
begin
  case chkNo of
    12 : ret := $0001;
    34 : ret := $0002;
    13 : ret := $0003;
    85 : ret := $0004;
    86 : ret := $0005;
    59 : ret := $0006;
    60 : ret := $0007;
    6  : ret := $0010;
    61 : ret := $0011;
    62 : ret := $0012;
    7  : ret := $0013;
    63 : ret := $0014;
    11 : ret := $0015;
    64 : ret := $0016;
    9  : ret := $0017;
    65 : ret := $0018;
    87 : ret := $0019;
    102: ret := $001A;
    104: ret := $001B;
    105: ret := $001C;
    103: ret := $001D;
    14 : ret := $0020;
    15 : ret := $0021;
    351: ret := $0022;
    361: ret := $0027;
    362: ret := $0028;
    90 : ret := $0029;
    91 : ret := $002C;
    352: ret := $002D;
    364: ret := $002E;
    365: ret := $002F;
    363: ret := $0030;
    98 : ret := $0031;
    66 : ret := $0040;
    3  : ret := $0041;
    67 : ret := $0042;
    4  : ret := $0043;
    5  : ret := $0044;
    57 : ret := $0045;
    55 : ret := $0046;
    68 : ret := $0047;
    2  : ret := $0048;
    92 : ret := $0049;
    56 : ret := $0050;
    77 : ret := $0051;
    78 : ret := $0052;
    79 : ret := $0053;
    80 : ret := $0054;
    16 : ret := $0055;
    47 : ret := $0056;
    422: ret := $0057;
    424: ret := $0058;
    421: ret := $0059;
    423: ret := $005A;
    106: ret := $005B;
    107: ret := $005C;
    108: ret := $005D;
    109: ret := $005E;
    110: ret := $0064;
    111: ret := $0065;
    69 : ret := $0070;
    70 : ret := $0071;
    71 : ret := $0072;
    72 : ret := $0073;
    73 : ret := $0074;
    74 : ret := $0080;
    75 : ret := $0081;
    76 : ret := $0082;
    88 : ret := $0083;
    89 : ret := $0084;

    112: ret := $0090;
    113: ret := $0091;
    114: ret := $0092;
    115: ret := $0093;
    116: ret := $0094;//如果读94命令，则后跟95命令
    117: ret := $0100;
    118: ret := $0101;
    119: ret := $0102;
    120: ret := $0103;
    121: ret := $0110;

    93 : ret := $F001;
    94 : ret := $F002;
    97 : ret := $F003;
    95 : ret := $F004;
    96 : ret := $F005;
   122 : ret := $F006;
   101 : ret := $F008;

  end;
  Result := ret;
end;

initialization
  CoInitialize(nil);
  DateSeparator := '-';
  FAllAreaManage:=TAllAreaMange.Create;
  //ResManage := TResList.Create;
  GlobalParam := TSystemParam.Create;
  ACmdManage:= TCmdManage.create;
  ACarNOManage:=TCarNOManage.Create;
  Project := TProjection.Create;

  ADevGroupManage:= TDevGroupManage.Create;
  ACarManage := TCarManage.Create ;
  ADeviceManage := TDeviceManage.Create ;
  AGovDeviceManage := TDeviceManage.Create;
  GAreaManage:= TAreaManage.Create;
  ADriverManage:= TDriverManage.Create;
  FNoticeManage := TNoticeManage.Create;
  FTerminalUgpradeVerManage := TTerminalUpgradeVerManage.Create;
//  AOrderManage:= TOrderManage.Create;
  AddressName:= MapAddressName.Create;
  FamilyName:= TFamilyName.Create;
//  FCallClient:= TCallClient.Create(nil);
  GTextManage:= TUserDefinedTextManager.Create;
  SystemLog  := elog.SystemLog;
  SystemLog.WriteImmediate := True;
  FactoryAreaManage :=TFactoryAreaManage.Create;
  FrmReadAreaFor:=TfrmReadAreaForList.Create(nil);
  carlist1:=TList.Create;
  carlist2:=TList.Create;
  carlist3:=TList.Create;
  carfindTime:=0;

  SpecialCarList := TList.Create;

  EarlyWarningCarList := TStringlist.create; //TIntegerList.Create;
  JudgeNotOkList := TIntegerList.Create;
  MediaPlayer := TWindowsMediaPlayer.Create(nil);

//  PassengerManage := TPassengerManage.Create;
  CarTypeManage := TCarTypeManage.Create;

  bAlarm := False;
  bEarlyAlarm := False;
//  bOrder := False;
  bReportAnswer := False;
  bSeverJudge := False;

//  SaveCMD := TQueryADevGroupManage.Create;
  Image := TImage.Create(nil);

  ReceivePhoneList := TIntegerList.Create;
  PhotoInfoList := TIntegerList.Create;

  FAllDevEventList := TDevEventInfoManage.Create;
  FAllDevTelList := TDevTelListManage.Create;
  FInfoTypeManage := TInfoTypeManage.Create;
  FAlarmInfoManage := TAlarmINfoFromDevManage.Create;
  FAlarmSuperviseManage := TAlarmSuperviseManage.Create;
  FGovInfoManage := TGovInfoManage.Create;
  FGlobalTip := TMyHintWindow.Create(nil);

  CurrentReceivePhone.ALL := 0;
  CurrentReceivePhone.Already := 0;

  IsQueryCarInfo := False;
  IsQueryDevInfo := False;

  DisposeCar := TDisposeCar.Create;
  FMouseDev := TDevice.Create;
  FFrmShowVideoList := TStringList.Create;

//  MSNPopUp := TMSNPopUp.Create(nil);
//  MSNPopUp.TimeOut := 5;
//  if FileExists(ExePath + 'MSNPopImage.bmp') then
//    MSNPopUp.BackgroundImage.LoadFromFile(ExePath + 'MSNPopImage.bmp');
//  MSNPopUp.TitleFont.Color := clRed;
//  MSNPopUp.TitleFont.Height := -13;
//  MSNPopUp.TitleFont.Size := 10;
//  MSNPopUp.TitleFont.Name := '宋体';
//
//  MSNPopUp.Font.Height := -13;
//  MSNPopUp.Font.Size := 10;
//  MSNPopUp.Font.Name := '宋体';
//
//  MSNPopUp.Height := 100;
//  MSNPopUp.Width := 160;

  //CoInitialize;
finalization
  //业务服务器在主窗口Free
  carlist1.Free;
  carlist2.Free;
  carlist3.Free;
  //ResManage.Free;
  GlobalParam.Free;
  ACmdManage.Free;
  ACarNOManage.Free;
  Project.Free;
  ADeviceManage.Free;
  AGovDeviceManage.Free;
  GAreaManage.Free;
  ADevGroupManage.Free;
  ACarManage.Free;
  ADriverManage.Free;
  FNoticeManage.Free;
  FTerminalUgpradeVerManage.Free;
//  AOrderManage.Free;
//  FreeSendOrderFrm;
  AddressName.Free;
  FamilyName.Free;
//  FCallClient.Free;
  GTextManage.Free;
  FactoryAreaManage.Free;
  FAllAreaManage.Free;
  FrmReadAreaFor.Free;
 // SystemLog.Free;

  SpecialCarList.Free;

  EarlyWarningCarList.Free;
  JudgeNotOkList.Free;
  MediaPlayer.Free;

//  PassengerManage.Free;
  CarTypeManage.Free;
  Image.Free;

  ReceivePhoneList.Free;
  PhotoInfoList.Free;
  FAllDevEventList.Free;
  FAllDevTelList.Free;
  FInfoTypeManage.Free;
  FAlarmInfoManage.Free;
  FAlarmSuperviseManage.Free;
  FGovInfoManage.Free;
  FGlobalTip.Free;

  FMouseDev.Free;

  DisposeCar.Free;
  FFrmShowVideoList.Free;
//  MSNPopUp.Free;

  //AssembleWarring.Free;
  //SaveCMD.Free;
  CoUninitialize();

end.
