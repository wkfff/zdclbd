{*****************************************************************************}
{                                                                             }
{系统用户、角色、权限类单元                                                   }
{                                                                             }
{同过这些类来联合数据库操作系统中的数据                                       }
{                                                                             }
{作者:杨桦                                                                    }
{                                                                             }
{时间:2008-8-3                                                                }
{                                                                             }
{*****************************************************************************}
unit SysUsers;

interface

uses
  Types, IntegerListUnit;

type
  TUsers = class(TObject)
  private
    FUserID: Integer;
    FUserName: string;
    FUserPwd: string;
    FRoleID: Integer;
    FUserStat: Integer;
    FMemo: string;
    FUserGroups: TIntegerDynArray;
    procedure SetUserID(const Value: Integer);
    procedure SetUserName(const Value: string);
    procedure SetUserPwd(const Value: string);
    procedure SetRoleID(const Value: Integer);
    procedure SetUserStat(const Value: Integer);
    procedure SetMemo(const Value: string);
    procedure SetUserGroups(const Value: TIntegerDynArray);
  public
    constructor Create;
    destructor Destroy; override;
  published
    property UserID: Integer read FUserID write SetUserID;
    property UserName: string read FUserName write SetUserName;
    property UserPwd: string read FUserPwd write SetUserPwd;
    property RoleID: Integer read FRoleID write SetRoleID;
    property UserStat: Integer read FUserStat write SetUserStat;
    property Memo: string read FMemo write SetMemo;
    property UserGroups: TIntegerDynArray read FUserGroups write SetUserGroups;
  end;

  TUsersManage = class(TObject)
  private
    FList: TIntegerList;
    function GetItems(Index: Integer): TUsers;
    function GetCount: Integer;
  public
    constructor Create;
    destructor Destroy; override;

    function Add(const AUserID: Integer): TUsers;
    procedure Delete(const AUserID: Integer);
    function Find(const AUserID: Integer): TUsers;
    procedure Clear;

    property Items[Index: Integer]: TUsers read GetItems;
    property Count: Integer read GetCount;
  end;

  TRole = class(TObject)
  private
    FRoleID: Integer;
    FRoleName: string;
    FRoleDesc: string;

    procedure SetRoleID(const Value: Integer);
    procedure SetRoleName(const Value: string);
    procedure SetRoleDesc(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;

  published
    property RoleID: Integer read FRoleID write SetRoleID;
    property RoleName: string read FRoleName write SetRoleName;
    property RoleDesc: string read FRoleDesc write SetRoleDesc;
  end;

  TRoleManage = class(TObject)
  private
    FList: TIntegerList;
    function GetCount: Integer;
    function GetItems(Index: Integer): TRole;
  public
    constructor Create;
    destructor Destroy; override;

    function Add(const ARoleID: Integer): TRole;
    procedure Delete(const ARoleID: Integer);
    function Find(const ARoleID: Integer): TRole;
    procedure Clear;

    property Items[Index: Integer]: TRole read GetItems;
    property Count: Integer read GetCount;
  end;

  TPrivilege = class(TObject)
  private
    FPID: Integer;
    FPName: string;
    FPParent: Integer;
    FPLeafNOD: Integer;
    FPrivilege: Integer;

    procedure SetPID(const Value: Integer);
    procedure SetPName(const Value: string);
    procedure SetPParent(const Value: Integer);
    procedure SetPLeafNOD(const Value: Integer);
    procedure SetPrivilege(const Value: Integer);
  public
    constructor Create;
    destructor Destroy; override;
  published
    property PID: Integer read FPID write SetPID;
    property PName: string read FPName write SetPName;
    property PParent: Integer read FPParent write SetPParent;
    property PLeafNOD: Integer read FPLeafNOD write SetPLeafNOD;
    property Privilege: Integer read FPrivilege write SetPrivilege;
  end;

  TPrivilegeManage = class(TObject)
  private
    FList: TIntegerList;
    function GetItems(Index: Integer): TPrivilege;
    function GetCount: Integer;

  public
    constructor Create;
    destructor Destroy; override;

    function Add(const APrivilegeID: Integer): TPrivilege;
    procedure Delete(const APrivilegeID: Integer);
    function Find(const APrivilegeID: Integer): TPrivilege;
    function FindNO(const APrivilegeNO: integer): TPrivilege;
    procedure Clear;

    property Items[Index: Integer]: TPrivilege read GetItems;
    property Count: Integer read GetCount;
  end;

implementation

constructor TUsers.Create;
begin
  inherited;
end;

destructor TUsers.Destroy;
begin
  inherited;
end;

procedure TUsers.SetUserID(const Value: Integer);
begin
  FUserID := Value;
end;

procedure TUsers.SetUserName(const Value: string);
begin
  FUserName := Value;
end;

procedure TUsers.SetUserPwd(const Value: string);
begin
  FUserPwd := Value;
end;

procedure TUsers.SetRoleID(const Value: Integer);
begin
  FRoleID := Value;
end;

procedure TUsers.SetUserStat(const Value: Integer);
begin
  FUserStat := Value;
end;

procedure TUsers.SetMemo(const Value: string);
begin
  FMemo := Value;
end;

procedure TUsers.SetUserGroups(const Value: TIntegerDynArray);
begin
  FUserGroups := Value;
end;

constructor TUsersManage.Create;
begin
  FList := TIntegerList.Create;
  FList.Sorted := True;
end;

destructor TUsersManage.Destroy;
var
  i:Integer;
  m:TUsers;
begin
  i := 0;
  while (i<FList.Count) do
  begin
    m := TUsers(FList.Datas[i]);
    FList.Delete(i);
    m.Free;
  end;
  FList.Free;
  inherited;
end;

function TUsersManage.GetItems(Index: Integer): TUsers;
begin
  Result := TUsers(FList.Datas[Index]);
end;

function TUsersManage.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TUsersManage.Add(const AUserID: Integer): TUsers;
var
  i: Integer;
begin
  i := FList.IndexOf(AUserID);
  if (i >= 0) then
    Result := Items[i]
  else
  begin
    Result := TUsers.Create;
    Result.UserID := AUserID;
    FList.AddData(AUserID, Result);
  end;
end;

procedure TUsersManage.Delete(const AUserID: Integer);
var
  i: Integer;
  m: TUsers;
begin
  i := FList.IndexOf(AUserID);
  if (i >= 0) then
  begin
    m := TUsers(FList.Datas[i]);
    FList.Delete(i);
    m.Free;
  end;
end;

function TUsersManage.Find(const AUserID: Integer): TUsers;
var
  i: Integer;
begin
  Result := nil;
  i := FList.IndexOf(AUserID);
  if (i >= 0) then
    Result := TUsers(FList.Datas[i]);
end;

procedure TUsersManage.Clear;
var
  i: Integer;
begin
  i := 0;
  while (i < Count) do
    Delete(Items[i].UserID);
end;


constructor TRole.Create;
begin
  inherited;
end;

destructor TRole.Destroy;
begin
  inherited;
end;

procedure TRole.SetRoleID(const Value: Integer);
begin
  FRoleID := Value;
end;

procedure TRole.SetRoleName(const Value: string);
begin
  FRoleName := Value;
end;

procedure TRole.SetRoleDesc(const Value: string);
begin
  FRoleDesc := Value;
end;

constructor TRoleManage.Create;
begin
  FList := TIntegerList.Create;
  FList.Sorted := True;
end;

destructor TRoleManage.Destroy;
var
  i:Integer;
  m:TRole;
begin
  i := 0;
  while (i<FList.Count) do
  begin
    m := TRole(FList.Datas[i]);
    FList.Delete(i);
    m.Free;
  end;
  FList.Free;
  inherited;
end;

function TRoleManage.Add(const ARoleID: Integer): TRole;
var
  i: Integer;
begin
  i := FList.IndexOf(ARoleID);
  if (i >= 0) then
    Result := Items[i]
  else
  begin
    Result := TRole.Create;
    Result.RoleID := ARoleID;
    FList.AddData(ARoleID, Result);
  end;
end;

procedure TRoleManage.Delete(const ARoleID: Integer);
var
  i: Integer;
  m: TRole;
begin
  i := FList.IndexOf(ARoleID);
  if (i >= 0) then
  begin
    m := TRole(FList.Datas[i]);
    FList.Delete(i);
    m.Free;
  end;
end;

function TRoleManage.Find(const ARoleID: Integer): TRole;
var
  i: Integer;
begin
  Result := nil;
  i := FList.IndexOf(ARoleID);
  if (i >= 0) then
    Result := TRole(Items[i]);
end;

procedure TRoleManage.Clear;
var
  i: Integer;
begin
  i := 0;
  while (i < Count) do
    Delete(Items[i].RoleID);
end;

function TRoleManage.GetItems(Index: Integer): TRole;
begin
  Result := TRole(FList.Datas[Index]);
end;

function TRoleManage.GetCount: Integer;
begin
  Result := FList.Count;
end;


constructor TPrivilege.Create;
begin
  inherited;
end;

destructor TPrivilege.Destroy;
begin
  inherited;
end;

procedure TPrivilege.SetPID(const Value: Integer);
begin
  FPID := Value;
end;

procedure TPrivilege.SetPName(const Value: string);
begin
  FPName := Value;
end;

procedure TPrivilege.SetPParent(const Value: Integer);
begin
  FPParent := Value;
end;

procedure TPrivilege.SetPLeafNOD(const Value: Integer);
begin
  FPLeafNOD := Value;
end;

procedure TPrivilege.SetPrivilege(const Value: Integer);
begin
  FPrivilege := Value;
end;

constructor TPrivilegeManage.Create;
begin
  FList := TIntegerList.Create;
  FList.Sorted := True;
end;

destructor TPrivilegeManage.Destroy;
var
  i:Integer;
  m:TPrivilege;
begin
  i := 0;
  while (i<FList.Count) do
  begin
    m := TPrivilege(FList.Datas[i]);
    FList.Delete(i);
    m.Free;
  end;
  FList.Free;
  inherited;
end;

function TPrivilegeManage.Add(const APrivilegeID: Integer): TPrivilege;
var
  i: Integer;
begin
  i := FList.IndexOf(APrivilegeID);
  if (i >= 0) then
    Result := Items[i]
  else
  begin
    Result := TPrivilege.Create;
    Result.PID := APrivilegeID;
    FList.AddData(APrivilegeID, Result);
  end;
end;

procedure TPrivilegeManage.Delete(const APrivilegeID: Integer);
var
  i: Integer;
  m: TPrivilege;
begin
  i := FList.IndexOf(APrivilegeID);
  if (i >= 0) then
  begin
    m := TPrivilege(FList.Datas[i]);
    FList.Delete(i);
    m.Free;
  end;
end;

function TPrivilegeManage.Find(const APrivilegeID: Integer): TPrivilege;
var
  i: Integer;
begin
  Result := nil;
  i := FList.IndexOf(APrivilegeID);
  if (i >= 0) then
    Result := Items[i];
end;

procedure TPrivilegeManage.Clear;
var
  i: Integer;
begin
  i := 0;
  while (i < Count) do
    Delete(Items[i].PID);
end;

function TPrivilegeManage.GetItems(Index: Integer): TPrivilege;
begin
  Result := TPrivilege(FList.Datas[Index]);
end;

function TPrivilegeManage.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TPrivilegeManage.FindNO(const APrivilegeNO: integer): TPrivilege;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
  begin
    if (Items[i].Privilege = APrivilegeNO) then
    begin
      Result := Items[i];
      break;
    end;
  end;
end;

end.
