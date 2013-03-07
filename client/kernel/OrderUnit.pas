unit OrderUnit;

interface
uses
  classes, Windows, CmdStructUnit, IntegerListUnit, MetaDefine, CycListUnit,
  QGraphics ,SysUtils,StrUtils,CarUnit;

type
  
  TOrder = Class(TObject)
  Private
    FID :               integer;     //1��	����ID������ʶ
    FType:              byte;        //2��	��������
    FDateTime:         TDatetime;
    FDate :         TDatetime;   //3��	��������
    FTime:          TDateTime;
    FCustomerTel:       string;      //5��	�ͻ��绰
    FOrderContent:      string;      //6��	��������
    FOrderDetailContent:string;      //7��	������ϸ����
    FSendDatetime:      TDatetime;   //8��	��������ʱ��
    FOperationUser:     integer;      //9��	�·������Ĳ�����Ա
    FSendDevIDs:        TIntegerList;//10��	�·������ĳ���ID���б�
    FSucceedDevID:      integer;     //11��	�����ɹ��ĳ���ID
    FState:             byte;        //12��	����ִ��״̬
    FRemark:            string;      //13��	��ע
    FSucceedDatetime:   TDatetime;   //�ɹ�����ʱ��
    FCancelDatetime:    TDatetime;   //ȡ������ʱ��
    FCancelReasonID:    integer;     //ȡ��ԭ��ID��
    FCmdID:             integer;
//------------------------------------------------------------------------------    
    FName:              String;
    FSex:               byte;
    FAddress:           String;
    FAddressQuery:      String;
    FOrderDateTime: TDateTime_V2;
    FOperationUserName: string;
    FCancelDateTime_V2: string;
    FSucceedDateTime_V2: string;

    FPassengerId: Integer;
    FSucceedDriverId: Integer;   //�����ɹ����ĵ�ʱ˾��
    procedure SetOrderDateTime(const Value: Tdatetime_V2);
    procedure SetOperationUserName(const Value: string);
    procedure SetCancelDateTime_V2(const Value: string);
    procedure SetSucceedDateTime_V2(const Value: string);
    procedure SetPassengerId(const Value: Integer);
    procedure SetSucceedDriverId(const Value: Integer);
  private
    procedure SetCustomerTel(const Value: String);
    procedure SetOrderContent(const Value: String);
    procedure SetOrderDetailContent(const Value: String);
    function  GetSendDevID(index :integer):TDevice;
    function  GetSendDevIDInt(index :integer):integer;
    function  GetSendDevCount:integer;
  public
    property ID :               integer Read FID;     //1��	����ID������ʶ
    property OderType:          byte Read FType Write Ftype;        //2��	��������
    property OderDateTime:      TDatetime Read FDatetime Write FDatetime;
    property OrderDateTime_V2:Tdatetime_V2 read FOrderDateTime write SetOrderDateTime;
    property OderDate :         TDatetime Read FDate Write FDate;    //3��	��������
    property OderTime:          TDatetime Read FTime Write FTime;
    property CustomerTel:       string Read FCustomerTel Write SetCustomerTel;      //5��	�ͻ��绰
    property OrderContent:      string Read FOrderContent Write SetOrderContent;      //6��	��������
    property OrderDetailContent:string Read FOrderDetailContent Write SetOrderDetailContent;      //7��	������ϸ����
    property SendDatetime:      TDatetime Read FSendDatetime Write FSendDatetime;   //8��	��������ʱ��
    property OperationUser:     integer Read FOperationUser Write FOperationUser;       //9��	�·������Ĳ�����Ա
    property SendDevIDs[index :integer]:TDevice Read GetSendDevID; //10��	�·������ĳ���ID���б�
    property SendDevIDsInt[index:integer]:integer Read GetSendDevIDInt;
    property SucceedDevID:      integer Read FSucceedDevID Write FSucceedDevID;     //11��	�����ɹ��ĳ���ID
    property State:             byte Read FState Write FState;        //12��	����ִ��״̬
    property Remark:            string Read FRemark Write FRemark;      //13��	��ע
    property CountOfSendDev:integer Read GetSendDevCount;
    property SucceedDatetime:   TDatetime read FSucceedDatetime write FSucceedDatetime;
    property CancelDatetime:    TDatetime read FCancelDatetime  write FCancelDatetime;
    property SucceedDateTime_V2:string read FSucceedDateTime_V2 write SetSucceedDateTime_V2;
    property CancelDateTime_V2:string read FCancelDateTime_V2 write SetCancelDateTime_V2;
    property CancelReasonID:    integer   read FCancelReasonID  write FCancelReasonID;
    property CmdID:             integer   Read FCmdID           write FCmdID;
    property NameOfCustom:      string    Read FName            Write FName;
    Property SexOfCustom:       byte      read FSex             write FSex;
    Property AddressOfCustom:   String    Read FAddress         Write FAddress;
    Property AddressQuery:      string    Read FAddressQuery    write FAddressQuery;
    property OperationUserName:string read FOperationUserName write SetOperationUserName;
    property PassengerId: Integer read FPassengerId write SetPassengerId;
    property SucceedDriverId: Integer read FSucceedDriverId write SetSucceedDriverId;
  public
    constructor Create;
    destructor Destroy;override;
    Function SaveToDataBase:integer;   //�Ѷ����浽���ݿⲢ���ض���ID��
    function AddSendDevID(Dev:TDevice):integer;overload;//���һ������ID��,������INDEX;
    function AddSendDevID(DevID:integer):integer;overload;
    function RefreshOrderInfo:boolean; //��ȡ�����ɹ�������ID,����״̬,��ע.
    function SendOrder:boolean;     //������������͵�����.
    procedure ClearSendDevsList;
    procedure SetOrderID(ID:integer);
  end;

  TOrderManage = class(TObject)
  private
     FOrders:TIntegerList;
     FisModified:boolean;
     FisModifiedSendList: boolean;
  private
     function GetOrder(index:integer):TOrder;
     function GetCount:integer;
     procedure SetisModified(const Value: boolean);
  public
     isModifiedSendList: boolean;
     property Item[index:integer]:TOrder Read GetOrder;
     property Count:integer read GetCount;
     property isModified:boolean Read FisModified Write SetisModified;
    // property isModifiedSendList read FisModifiedSendList write FisModifiedSendList;

  public
     constructor Create;
     destructor Destroy;override;
     function AddOder(Order:TOrder):boolean;
     function Find(OrderID:integer):TOrder;
     function Delete(Index:integer):boolean;
     function DeleteByOrderID(OrderID:integer):boolean;
     function LoadOrdersFromDB:boolean;
     function GetOrderDriverId(const devId: Integer; passengerPhone: string; orderTime: TDateTime): Integer;
     procedure Clear;
  end;


  TPassenger = class (TObject)
  private
    FPassengerId: Integer;     //�˿�Id
    FFamilyName: string;       //�˿�����
    FGender: Byte;             //�˿��Ա�0������1Ůʿ
    FAddress: string;          //�˿���ϸ��ַ
    FPhone: string;            //�˿͵绰
    FLastOrderTime: TDateTime; //�ϴ�Ҫ��ʱ��
    FIntegral: Integer;        //�˿ͻ���
    FIsBlacklist: Boolean;     //�Ƿ���Ϊ�˺�����
    procedure SetAddress(const Value: string);
    procedure SetFamilyName(const Value: string);
    procedure SetLastOrderTime(const Value: TDateTime);
    procedure SetPassengerId(const Value: Integer);
    procedure SetPhone(const Value: string);
    procedure SetGender(const Value: Byte);
    procedure SetIntegral(const Value: Integer);
    procedure SetIsBlacklist(const Value: Boolean);
    //FMemo: string;
  public
    constructor Create;
    destructor Destroy; override;
    property PassengerId: Integer read FPassengerId write SetPassengerId;
    property FamilyName: string read FFamilyName write SetFamilyName;
    property Gender: Byte read FGender write SetGender;
    property Address: string read FAddress write SetAddress;
    property Phone: string read FPhone write SetPhone;
    property LastOrderTime: TDateTime read FLastOrderTime write SetLastOrderTime;
    property Integral: Integer read FIntegral write SetIntegral;
    property IsBlacklist: Boolean read FIsBlacklist write SetIsBlacklist;
  end;

  TPassengerManage = class (TObject)
  private
    FList: TIntegerList;
  private
    function GetItem(Index: Integer): TPassenger;
    function GetCount: Integer;
  public
    property Item[Index: Integer]: TPassenger read GetItem;
    property Count: Integer read GetCount;
  public
    constructor Create;
    destructor Destroy; override;
    function AddPassenger(passenger: TPassenger): Boolean;
    function GetPassenger(const passengerId: Integer): TPassenger; overload;
    function GetPassenger(const phone: string): TPassenger; overload;
    function Delete(const Index: Integer): Boolean;
    function DeleteByPassengerId(const passengerId: Integer): Boolean;
    procedure Clear;
  end;

implementation
     uses uGloabVar,DateUtils;

procedure TOrder.SetCustomerTel(const Value: String);
begin
  if Length(Value)<=20 then
     FCustomerTel:=Value
  else
     FCustomerTel:=Copy(Value,1,20);
end;

procedure TOrder.SetOrderContent(const Value: String);
begin
  if Length(Value)<=200 then
     FOrderContent:=Value
  else
     FOrderContent:=Copy(Value,1,200);
end;

procedure TOrder.SetOrderDetailContent(const Value: String);
begin
  if Length(Value)<=200 then
     FOrderDetailContent:=Value
  else
     FOrderDetailContent:=Copy(Value,1,200);
end;

function  TOrder.GetSendDevID(index :integer):TDevice;
begin
   Result := TDevice(FSendDevIDs.Datas[Index]);
end;

function  TOrder.GetSendDevCount:integer;
begin
  Result:=FSendDevIDs.Count;
end;

constructor TOrder.Create;
begin
    FID :=-1;                 //1��	����ID������ʶ
    FType:=$FF;                     //2��	��������
//    FDatetime :=0;            //3��	��������
    FCustomerTel:='';             //5��	�ͻ��绰
    FOrderContent:='';            //6��	��������
    FOrderDetailContent:='';      //7��	������ϸ����
    FSendDatetime:=0;         //8��	��������ʱ��
    FSendDevIDs:= TIntegerList.Create;//10��	�·������ĳ���ID���б�
    FSucceedDevID:=-1;           //11��	�����ɹ��ĳ���ID
    FState:=$FF;                     //12��	����ִ��״̬
    FRemark:='';                  //13��	��ע
end;

destructor TOrder.Destroy;
begin
  FSendDevIDs.Free;
end;

function TOrder.AddSendDevID(Dev:TDevice):integer;//���һ������ID��,������INDEX;
var
 i:integer;
begin
  if Dev=nil then exit;
  i:=FSendDevIDs.IndexOf(Dev.Id);
  if i>=0 then
  begin
    Result:=i;
  end
  else
  begin
    Result:=FSendDevIDs.AddData(Dev.Id,Dev);
  end;
end;

procedure TOrder.ClearSendDevsList;
begin
  fSendDevIds.Clear;
end;

Function TOrder.SaveToDataBase:integer;   //�Ѷ����浽���ݿⲢ���ض���ID��
begin
  Result:=-1;
  if Self.State = 100 then
    Self.FID := Bs.AddReservedOrder(Self)
  else
    Self.FID:=bs.AddOrder(Self);
  Result:=Self.FID;
end;

function TOrder.RefreshOrderInfo:boolean; //��ȡ�����ɹ�������ID,����״̬,��ע.
begin
  Result:=false;
  Result:=bs.RefreshOrder(Self);
end;

function TOrder.SendOrder:boolean;     //������������͵�����.
begin
  Result:=DataServer.SendOrder_V2(self);
end;

constructor TOrderManage.Create;
begin
  FOrders:=TIntegerList.Create;
end;
destructor TOrderManage.Destroy;
begin
  FOrders.Free;
end;


function TOrderManage.GetOrder(index:integer):TOrder;
begin
  Result:=TOrder(FOrders.Datas[index]);
end;

function TOrderManage.GetCount:integer;
begin
 Result:=  FOrders.Count;

end;

function TOrderManage.AddOder(Order:TOrder):boolean;
begin
  Result:=false;
  if find(order.ID)<>nil then exit;
  FOrders.AddData(Order.ID,Order);
  FisModified:=true;
  Result:=true;
end;

function TOrderManage.Find(OrderID:integer):TOrder;
var
 i:integer;
begin
  i:=FOrders.IndexOf(OrderID);
  if i>=0 then
    Result:=TOrder(FOrders.Datas[i])
  else
    Result:=nil;
end;

function TOrderManage.Delete(Index:integer):boolean;
begin
  Result:=false;
  TOrder(FOrders.Datas[Index]).Free;
  FOrders.Delete(index);
  FisModified:=true;
  Result:=true;
end;

function TOrderManage.DeleteByOrderID(OrderID:integer):boolean;
var
 i:integer;
begin
  Result:=false;
  i:=FOrders.IndexOf(OrderID);
  if i>=0 then
  begin
    Result:=Delete(i);
    FisModified:=true;
  end;
end;

procedure TOrderManage.Clear;
begin
  while Self.Count>0 do
  begin
    Delete(0);
  end;
end;

function TOrderManage.LoadOrdersFromDB: boolean;
begin
  Bs.QueryOrders(-1,incHour(now,-8),now,'',1,Current_user.id,Self);
  Result:=true;
end;

procedure TOrder.SetOrderID(ID: integer);
begin
  FID:=ID;
end;

procedure TOrderManage.SetisModified(const Value: boolean);
begin
 if  Value then
 begin
   isModifiedSendList:=Value;
 end;
 FisModified:=Value;
end;

function TOrder.GetSendDevIDInt(index: integer): integer;
begin
  Result:=FSendDevIDs.Integers[Index];
end;

function TOrder.AddSendDevID(DevID: integer): integer;
var
 i:integer;
begin
  i:=FSendDevIDs.IndexOf(DevID);
  if i>=0 then
  begin
    Result:=i;
  end
  else
  begin
    Result:=FSendDevIDs.AddData(DevID,nil);
  end;
end;

procedure TOrder.SetOrderDateTime(const Value: Tdatetime_V2);
begin
  FOrderDateTime[0] := Value[0];
  FOrderDateTime[1] := Value[1];
  FOrderDateTime[2] := Value[2];
  FOrderDateTime[3] := Value[3];
  FOrderDateTime[4] := Value[4];
  FOrderDateTime[5] := Value[5];
end;

procedure TOrder.SetOperationUserName(const Value: string);
begin
  FOperationUserName := Value;
end;

procedure TOrder.SetCancelDateTime_V2(const Value: string);
begin
  FCancelDateTime_V2 := Value;
end;

procedure TOrder.SetSucceedDateTime_V2(const Value: string);
begin
  FSucceedDateTime_V2 := Value;
end;

{ TPassenger }

constructor TPassenger.Create;
begin
  FPassengerId := -1;
  FFamilyName := '';
  FGender := 0;
  FAddress := '';
  FPhone := '';
  FLastOrderTime := Now;
end;

destructor TPassenger.Destroy;
begin

  inherited;
end;

procedure TPassenger.SetAddress(const Value: string);
begin
  FAddress := Value;
end;

procedure TPassenger.SetFamilyName(const Value: string);
begin
  FFamilyName := Value;
end;

procedure TPassenger.SetLastOrderTime(const Value: TDateTime);
begin
  FLastOrderTime := Value;
end;

procedure TPassenger.SetPassengerId(const Value: Integer);
begin
  FPassengerId := Value;
end;

procedure TPassenger.SetPhone(const Value: string);
begin
  FPhone := Value;
end;

procedure TPassenger.SetGender(const Value: Byte);
begin
  FGender := Value;
end;

procedure TPassenger.SetIntegral(const Value: Integer);
begin
  FIntegral := Value;
end;

procedure TPassenger.SetIsBlacklist(const Value: Boolean);
begin
  FIsBlacklist := Value;
end;

{ TPassengerManage }

function TPassengerManage.AddPassenger(passenger: TPassenger): Boolean;
begin
  Result := False;
  if GetPassenger(passenger.PassengerId) <> nil then Exit;
  FList.AddData(passenger.PassengerId, passenger);
  Result := True;
end;

procedure TPassengerManage.Clear;
begin
  while Self.Count > 0 do
  begin
    Delete(0);
  end;
end;

constructor TPassengerManage.Create;
begin
  FList := TIntegerList.Create;

end;

function TPassengerManage.Delete(const Index: Integer): Boolean;
begin
  Result := False;
  TPassenger(FList.Datas[Index]).Free;
  FList.Delete(Index);
  Result := True;
end;

function TPassengerManage.DeleteByPassengerId(
  const passengerId: Integer): Boolean;
var
  i: Integer;
begin
  Result := False;
  i := FList.IndexOf(passengerId);
  if i >= 0 then
  begin
    Result := Delete(i);
  end;  
end;

destructor TPassengerManage.Destroy;
begin
  Clear;
  FList.Free;
end;

function TPassengerManage.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TPassengerManage.GetItem(Index: Integer): TPassenger;
begin
  Result := TPassenger(FList.Datas[Index]);
end;

function TPassengerManage.GetPassenger(const phone: string): TPassenger;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
  begin
    if Item[i].Phone = phone then
    begin
      Result := Item[i];
      Break;
    end;
  end;
end;

function TPassengerManage.GetPassenger(
  const passengerId: Integer): TPassenger;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
  begin
    if Item[i].PassengerId = passengerId then
    begin
      Result := Item[i];
      Break;
    end;  
  end;  
end;

procedure TOrder.SetPassengerId(const Value: Integer);
begin
  FPassengerId := Value;
end;

procedure TOrder.SetSucceedDriverId(const Value: Integer);
begin
  FSucceedDriverId := Value;
end;

function TOrderManage.GetOrderDriverId(const devId: Integer;
  passengerPhone: string; orderTime: TDateTime): Integer;
var
  i: Integer;
begin
  Result := -1;
  for i := 0 to Count - 1 do
  begin
    if (Item[i].SucceedDevID = devId) and (Item[i].CustomerTel = passengerPhone) and (MinutesBetween(orderTime, Item[i].OderDateTime) < 60) then
    begin
      Result := Item[i].SucceedDriverId;
      Break;
    end;  
  end;
end;

end.
