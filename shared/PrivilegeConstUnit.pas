unit PrivilegeConstUnit;

interface
uses
  Types;
const
  PRI_LOGIN = $1; //�����¼
  PRI_SENDMSG = $2; //�����򳵻�������Ϣ
  PRI_TARGETSET = $3; //�������ó�������
  PRI_LOCALSET = $4; //�������ñ��ز���
  PRI_CALL = $5; //������г���
  PRI_TARCTRL = $6; //������Ƴ���
  PRI_GETSTAT = $7; //�����ѯ����״̬
  PRI_ADVCTRL = $8; //����߼�����
  PRI_ADVPROP = $9; //����鿴�߼�����
  PRI_ADDPROP = $A; //����鿴��������
  PRI_QUERYHIS = $B; //����鿴��ʷ��¼
  PRI_LAYERCTRL = $C; // �����ͼ�����
  PRI_QUERYMSG = $E; //�����ѯ��Ϣ

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
  Result[0] := PRI_LOGIN; //�����¼
  Result[1] := PRI_SENDMSG; //�����򳵻�������Ϣ
  Result[2] := PRI_TARGETSET; //�������ó�������
  Result[3] := PRI_LOCALSET; //�������ñ��ز���
  Result[4] := PRI_CALL; //������г���
  Result[5] := PRI_TARCTRL; //������Ƴ���
  Result[6] := PRI_GETSTAT; //�����ѯ����״̬
  Result[7] := PRI_ADVCTRL; //����߼�����
  Result[8] := PRI_ADVPROP; //����鿴�߼�����
  Result[9] := PRI_ADDPROP; //����鿴��������
  Result[10] := PRI_QUERYHIS; //����鿴��ʷ��¼
  Result[11] := PRI_LAYERCTRL; // �����ͼ�����
  Result[12] := PRI_QUERYMSG; //�����ѯ��Ϣ
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
    PRI_LOGIN: Result := '��¼';
    PRI_SENDMSG: Result := '�����豸������Ϣ';
    PRI_TARGETSET: Result := '���ó����豸����';
    PRI_LOCALSET: Result := '���ñ��ز���';
    PRI_CALL: Result := '���г����豸';
    PRI_TARCTRL: Result := '���Ƴ����豸';
    PRI_GETSTAT: Result := '��ѯ�����豸״̬';
    PRI_ADVCTRL: Result := '�߼�����';
    PRI_ADVPROP: Result := '�鿴�߼�����';
    PRI_ADDPROP: Result := '�鿴��������';
    PRI_QUERYHIS: Result := '��ѯ��ʷ��¼';
    PRI_LAYERCTRL: Result := 'ͼ�����';
    PRI_QUERYMSG: Result := '��ѯ��Ϣ'; //�����ѯ��Ϣ
    PRI_SYSADMIN: Result := 'ϵͳ����Ա';
  else
    Result := 'δ֪Ȩ��';
  end;
end;
end.
