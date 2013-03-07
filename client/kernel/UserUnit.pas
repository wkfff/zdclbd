unit UserUnit;
//----------------
// �û���Ϣ
// 2004-03-22
//----------------

interface
uses
    Classes,IntegerListUnit;
type
  TPrivilege = record
    Id  : Integer;
   // Name:string;
    Visible: boolean;
    Enabled: boolean;
  end;
  PPrivilege = ^TPrivilege;
  
  TUser = class(TObject)
  private
    FPassword: string;
    FPriList:TIntegerList;
    FPrivilegeList:array of TPrivilege;

    FUserGroupList: TintegerList;
    FroleID: integer;
    FUserStat: integer;
    FUserName: string;
    Fid: integer;
    FLoginDatetime:TDatetime;
    FBJYW: Boolean;
    FHYGL: Boolean;
    FDZDD: Boolean;
    FSBWH: Boolean;
    procedure SetroleID(const Value: integer);
    procedure SetUserName(const Value: string);
    procedure SetUserStat(const Value: integer);
    procedure Setid(const Value: integer);
    procedure SetPassword(const Value: string);
    function  PrivilegeCount:integer;
    function  GetPrivilege(Index:integer):TPrivilege;
  public
    constructor Create(const AName,APassword: string);
    destructor Destroy;override;

    { Procedure: AddPrivilege<br>
       Ϊ�û����һ��Ȩ��
       @param const APrivilegeValue: Integer Ȩ��ֵ
       @Return None
       @see @link()}
    //procedure AddPrivilege(const APrivilegeValue: Integer);
    function AddPrivilege(const APrivilegeID: Integer):PPrivilege;
    procedure ClearPrivilege;

    //Ϊ�û����һ���ܴ򿪣��鿴����
    procedure AddGroup(const AGroupID:integer);

    { Procedure: HasPrivilege<br>
    ���ظ��û��Ƿ����ָ����Ȩ��
     @param const APrivilegeValue: Integer ��Ҫ�жϵ�Ȩ��ֵ
     @Return Boolean �����Ƿ���Ȩ��}
   function HasPrivilege(const APrivilegeID: Integer):TPrivilege;
   //�û��ܷ�򿪣��鿴��ĳ��
    function HasGroup(AGroupID:integer):boolean;

    property id:integer read Fid write Setid;
    property UserName: string  read FUserName write SetUserName;  //�û�����
    property Password: string read FPassword write SetPassword;                     // �û���Password
    property roleID:integer read FroleID write SetroleID;         //��ɫ����
    property UserStat:integer read FUserStat write SetUserStat;
    Property Privilege[index:integer]:TPrivilege Read GetPrivilege;
    property LoginDatetime:TDatetime Read FLoginDatetime Write FLoginDatetime;
    property BJYW: Boolean read FBJYW write FBJYW;
    property HYGL: Boolean read FHYGL write FHYGL;
    property DZDD: Boolean read FDZDD write FDZDD;
    property SBWH: Boolean read FSBWH write FSBWH;
  end;

implementation

{ TUser }      
function  TUser.PrivilegeCount:integer;
begin
 Result:=Length(FPrivilegeList);
end;

procedure TUser.AddGroup(const AGroupID: integer);
begin
   FUserGrouplist.Add(AGroupID) ;
end;

function TUser.AddPrivilege(const APrivilegeID: Integer):PPrivilege;
var
  i: Integer;
  find: Boolean;
begin
  Result:=nil;
  find := False;
  for i := 0 to PrivilegeCount - 1 do
  begin
    if FPrivilegeList[i].Id = APrivilegeID then
    begin
      Result := @FPrivilegeList[i];
      find := True;
      Break;
    end;
  end;
  if not find then
  begin
    SetLength(FPrivilegeList,PrivilegeCount+1);  // .. Count=length(FConns)
    Result := @FPrivilegeList[PrivilegeCount-1];
    FPrivilegeList[PrivilegeCount-1].Id:=APrivilegeID;
  end;
end;


procedure TUser.ClearPrivilege;
begin
  SetLength(FPrivilegeList,0);
end;


constructor TUser.Create(const AName, APassword: string);
begin
  FUserName := AName;
  FPassword := APassword;
  
  FPriList  := TIntegerList.Create;
  FUserGroupList:= Tintegerlist.Create ;
end;

destructor TUser.Destroy;
begin
  ClearPrivilege ;
  FUserGroupList.Free;
  FPriList.Free;
  inherited;
end;


function TUser.HasGroup(AGroupID: integer): boolean;
begin
  Result := FUserGroupList.IndexOf(AGroupID) >= 0;
end;

function TUser.HasPrivilege(const APrivilegeID: Integer): TPrivilege;
var
 i:integer;
begin
  Result.Id:=-1;
  Result.Visible:=false;
  Result.Enabled:=false;
  for i:=0 to PrivilegeCount-1 do
  begin
    if  Privilege[i].Id =  APrivilegeID  then
    begin
      Result:=Privilege[i];
      exit;
    end;
  end;
end;



 {
procedure TUser.SetOwner(const Value: TOwner);
begin
  FOwner := Value;
end;}

procedure TUser.Setid(const Value: integer);
begin
  Fid := Value;
end;

procedure TUser.SetPassword(const Value: string);
begin
  FPassword := Value;
end;

procedure TUser.SetroleID(const Value: integer);
begin
  FroleID := Value;
end;

procedure TUser.SetUserName(const Value: string);
begin
  FUserName := Value;
end;

procedure TUser.SetUserStat(const Value: integer);
begin
  FUserStat := Value;
end;

function  TUser.GetPrivilege(Index:integer):TPrivilege;
begin
   Result:= FPrivilegeList[Index];
end;



end.
