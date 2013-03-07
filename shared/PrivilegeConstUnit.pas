unit PrivilegeConstUnit;

interface
uses
  Types;
const
  PRI_LOGIN = $1; //允许登录
  PRI_SENDMSG = $2; //允许向车机发送消息
  PRI_TARGETSET = $3; //允许设置车机参数
  PRI_LOCALSET = $4; //允许设置本地参数
  PRI_CALL = $5; //允许呼叫车机
  PRI_TARCTRL = $6; //允许控制车机
  PRI_GETSTAT = $7; //允许查询车机状态
  PRI_ADVCTRL = $8; //允许高级控制
  PRI_ADVPROP = $9; //允许查看高级属性
  PRI_ADDPROP = $A; //允许查看附加属性
  PRI_QUERYHIS = $B; //允许查看历史记录
  PRI_LAYERCTRL = $C; // 允许打开图层控制
  PRI_QUERYMSG = $E; //允许查询消息

  PRI_SYSADMIN = $1000;

const
  SYSTEM_SUPERUSER_ID: Integer = $8FFFFFF;
  DISPATCH_SUPERUSER_ID: Integer = $7FFFFFF;

function GetPrivilegeListValue: TIntegerDynArray;
function GetPrivilegeListName: TStringDynArray;
function GetPrivilegeName(const APrivilegeValue: Integer): string;
implementation

function GetPrivilegeListValue: TIntegerDynArray;
begin
  SetLength(Result, 14);
  Result[0] := PRI_LOGIN; //允许登录
  Result[1] := PRI_SENDMSG; //允许向车机发送消息
  Result[2] := PRI_TARGETSET; //允许设置车机参数
  Result[3] := PRI_LOCALSET; //允许设置本地参数
  Result[4] := PRI_CALL; //允许呼叫车机
  Result[5] := PRI_TARCTRL; //允许控制车机
  Result[6] := PRI_GETSTAT; //允许查询车机状态
  Result[7] := PRI_ADVCTRL; //允许高级控制
  Result[8] := PRI_ADVPROP; //允许查看高级属性
  Result[9] := PRI_ADDPROP; //允许查看附加属性
  Result[10] := PRI_QUERYHIS; //允许查看历史记录
  Result[11] := PRI_LAYERCTRL; // 允许打开图层控制
  Result[12] := PRI_QUERYMSG; //允许查询消息
  Result[13] := PRI_SYSADMIN;

end;

function GetPrivilegeListName: TStringDynArray;
var
  pri: TIntegerDynArray;
  i: Integer;
begin
  pri := GetPrivilegeListValue;
  SetLength(Result, Length(pri));
  for i := 0 to Length(pri) - 1 do
    Result[i] := GetPrivilegeName(pri[i]);
end;

function GetPrivilegeName(const APrivilegeValue: Integer): string;
begin
  case APrivilegeValue of
    PRI_LOGIN: Result := '登录';
    PRI_SENDMSG: Result := '向车载设备发送消息';
    PRI_TARGETSET: Result := '设置车载设备参数';
    PRI_LOCALSET: Result := '设置本地参数';
    PRI_CALL: Result := '呼叫车载设备';
    PRI_TARCTRL: Result := '控制车载设备';
    PRI_GETSTAT: Result := '查询车载设备状态';
    PRI_ADVCTRL: Result := '高级控制';
    PRI_ADVPROP: Result := '查看高级属性';
    PRI_ADDPROP: Result := '查看附加属性';
    PRI_QUERYHIS: Result := '查询历史记录';
    PRI_LAYERCTRL: Result := '图层控制';
    PRI_QUERYMSG: Result := '查询消息'; //允许查询消息
    PRI_SYSADMIN: Result := '系统管理员';
  else
    Result := '未知权限';
  end;
end;
end.
