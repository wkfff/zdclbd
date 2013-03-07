unit SendOrderMiniFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, cxGraphics, cxCustomData,
  cxStyles, cxTL, cxTextEdit, cxInplaceContainer, cxControls,OrderUnit,emapker,MetaDefine,Types,
  textUnit,StrUtils,CmdStructUnit, Math, CarUnit;

type

  TSearchAddrResult= record
   // DrawLayer  : TDrawLayer;
   // FieldName  : String;
   // SeekUIDAry : TIntegerDynArray;
   // UIDIndex:integer;
//     IsUserDefinedText:boolean;
     pDefineText:PUserDefinedText;
     DataLayer: TDataLayer;
     pMeta:PMetaStruct;
  end;
  PSearchAddrResult = ^TSearchAddrResult;


  TSendOrderMiniFrm = class(TForm)
    Panel2: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    EditCustomTel: TEdit;
    EditOrderID: TEdit;
    EditOKCarNO: TEdit;
    EditState: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    ComboBoxName: TComboBox;
    Label7: TLabel;
    ComboBoxType: TComboBox;
    DateTimePickerDate: TDateTimePicker;
    DateTimePickerTime: TDateTimePicker;
    Label2: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    EditCancelReason: TEdit;
    Panel5: TPanel;
    Panel9: TPanel;
    cxAddressList: TcxTreeList;
    cxAddress: TcxTreeListColumn;
    BitBtnQuery: TBitBtn;
    Panel7: TPanel;
    ListView1: TListView;
    Panel10: TPanel;
    BitBtnSend: TBitBtn;
    BitBtnCancel: TBitBtn;
    BitBtnClose: TBitBtn;
    BitBtnSel: TBitBtn;
    BitBtn4: TBitBtn;
    TimerShow: TTimer;
    TimerClose: TTimer;
    cxAddressListcxTreeListColumn1: TcxTreeListColumn;
    EditName: TComboBox;
    ComboBoxAddress: TComboBox;
    EditAddress: TMemo;
    Label8: TLabel;
    Label10: TLabel;
    memoDesc: TMemo;
    rgSendOption: TRadioGroup;
    Label11: TLabel;
    Label12: TLabel;
    Edit1: TEdit;

    procedure FormShow(Sender: TObject);
    

    procedure BitBtnCloseClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BitBtnSendClick(Sender: TObject);
    procedure TimerCloseTimer(Sender: TObject);
    procedure TimerShowTimer(Sender: TObject);
    procedure ComboBoxTypeChange(Sender: TObject);
    procedure EditCustomTelKeyPress(Sender: TObject; var Key: Char);
    procedure EditNameKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBoxNameKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBoxTypeKeyPress(Sender: TObject; var Key: Char);
    procedure DateTimePickerDateKeyPress(Sender: TObject; var Key: Char);
    procedure DateTimePickerTimeKeyPress(Sender: TObject; var Key: Char);
    procedure EditAddressKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBoxQueryKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtnCancelClick(Sender: TObject);
    procedure BitBtnSelClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtnQueryClick(Sender: TObject);
    procedure cxAddressListDblClick(Sender: TObject);
    procedure EditAddressChange(Sender: TObject);
    procedure EditNameEnter(Sender: TObject);
    procedure ComboBoxAddressChange(Sender: TObject);
    procedure ComboBoxAddressKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBoxAddressSelect(Sender: TObject);
    procedure EditNameChange(Sender: TObject);
    procedure EditNameSelect(Sender: TObject);
    procedure ComboBoxAddressExit(Sender: TObject);
    procedure EditCustomTelExit(Sender: TObject);
    procedure DateTimePickerDateExit(Sender: TObject);
    procedure DateTimePickerTimeExit(Sender: TObject);
  private
      FSearchResult:array of TSearchAddrResult;
      isAddAddress:boolean;
      isAddName:boolean;
      ep: TEarthPoint;
    function FindDevice(DevID: integer): String;
    function ReturnState(State: byte): String;
    function FindCancelReasonName(Order: TOrder): String;
    procedure ShowMetaInMap(meta: PMetaStruct;StaticStart:integer);
    procedure SendOldOrder(SendStr: string);
    procedure SendNewOrder(SendStr: string);
    procedure sortDeviceManage(var deviceManage: TDeviceManage; var devIdArrWith, devIdArrWithout: array of Integer; sortType: Byte);
    procedure saveReservedOrder(SendStr: string);
    function GetDistance(const StartLat, StartLong, EndLat, EndLong: Double): Double;

    { Private declarations }
  public
    { Public declarations }
     LastActivate:Longword;
     x:integer;
     y:integer;
  public
     procedure CreateParams(Var Param:TCreateParams);override;
     procedure ShowOrder(Order: TOrder);
  end;

var
  SendOrderMiniFrm: TSendOrderMiniFrm;

implementation

{$R *.dfm}
uses uGloabVar,DateUtils,ConstDefineUnit,uFrmSelectDevs,DB,
  umainf;
{ TSendOrderMiniFrm }{umainf,}

procedure TSendOrderMiniFrm.CreateParams(var Param: TCreateParams);
begin
   Inherited CreateParams(Param);
   Param.wndParent := GetDesktopWindow; //getforegroundwindow
end;

procedure TSendOrderMiniFrm.FormShow(Sender: TObject);
begin
  Self.Top:=Screen.Height;//-Self.Height-30;
  if Self.WindowState=wsMinimized then
  begin
    Self.Top:=Screen.Height-Self.Height;
    Self.WindowState:=wsMinimized;
  end;
  Self.Width:=Screen.Width;
  Self.Left:=0;
  TimerShow.Enabled:=true;
  Panel2.Enabled:=false;
  ListView1.Column[0].Width:=ListView1.Width-20;
  ListView1.Clear;
  EditCustomTel.Text:='';
  EditOrderID.Text:='';
  EditOKCarNO.Text:='';
  EditState.Text:='';
  EditCancelReason.Text:='';
  EditName.Text:='';
  EditAddress.Text:='';
  memoDesc.Text := '';
  DateTimePickerDate.DateTime:=now;
  DateTimePickertime.DateTime:=now;
  COMBOBOXADDRESS.Text:='';
  ComboBoxName.ItemIndex:=0;
  ComboBoxType.ItemIndex:=0;
  ComboBoxTypeChange(ComboBoxType);
  cxAddressList.Clear;
  AddressName.Find('',ComboBoxAddress.Items);
  FamilyName.Find('',EditName.Items);
  if (GlobalParam.IsUseTelServer)and(FCallClient.Work) then  BitBtnClose.Enabled:=true
  else
    BitBtnClose.Enabled:=false;


  ComboBoxType.ItemIndex:=0;
  ComboBoxTypeChange(nil);
end;

procedure TSendOrderMiniFrm.TimerShowTimer(Sender: TObject);
begin
 if Self.WindowState=wsMinimized then
 begin
   FlashWindow(Self.Handle,true);
   TimerShow.Interval:=2000;
   exit;
 end;
 if  Self.Top <= Screen.Height-Self.Height-25 then
 begin
    TimerShow.Enabled:=false;
    Panel2.Enabled:=true;
    exit;
 end;
 TimerShow.Interval:=1;
 Self.Top:=Self.top-10;
end;

procedure TSendOrderMiniFrm.TimerCloseTimer(Sender: TObject);
begin
try
 if  (Self.Top <= Screen.Height)and(Self.Top >=(Screen.Height-Self.Height-40))then
 begin
    Self.Top:=Self.top+15;
    exit;
 end;
 Timerclose.Enabled:=false;
 Self.Hide;
 BitBtnClose.Enabled:=true;
 BitBtnClose.Parent.Enabled:=true;
except
   BitBtnClose.Enabled:=true;
   BitBtnClose.Parent.Enabled:=true;
end;
end;

procedure TSendOrderMiniFrm.BitBtnCloseClick(Sender: TObject);
begin
BitBtnClose.Enabled:=false;
try
  if (FCallClient.Work)and TelIsConnect then
  begin
    FCallClient.NotifyServerErrorCall;
    close;
  end;
finally
 BitBtnClose.Enabled:=true;
end;  
end;

procedure TSendOrderMiniFrm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   CanClose:=false;
   TimerClose.Enabled:=true;
end;

procedure TSendOrderMiniFrm.FormActivate(Sender: TObject);
begin
  LastActivate:=GetTickCount;
  if Self.WindowState=wsMinimized then TimerShow.Enabled:=false;
  Panel2.Enabled:=true;
end;

procedure TSendOrderMiniFrm.FormDeactivate(Sender: TObject);
begin
  TimerShow.Enabled:=true;
end;

procedure TSendOrderMiniFrm.BitBtnSendClick(Sender: TObject);
var
  Order:TOrder;
  i:integer;
  Dev:TDevice;
  SendStr:string;
  sendTel:string;
  driver: TDriver;
var
   dt:TDateTime;
   dt2:TDateTime;
   j: Integer;
   passenger: TPassenger;
   isSend2HeavyCar: Boolean;
   isSend2DriverInBlacklist: Boolean;
   orderDateTime: TDateTime;
begin
  BitBtnSend.Enabled:=false;
  isSend2HeavyCar := False;
  isSend2DriverInBlacklist := False;
  try

    if Trim(EditAddress.Text) = '' then
    begin
      messagebox(handle,'请输入乘车的地址!','提示',mb_ok + mb_iconinformation);
      EditAddress.SetFocus;
      exit;
    end;

    if Trim(EditCustomTel.Text) = '' then
    begin
      messagebox(handle,'请输入乘客的电话!','提示',mb_ok + mb_iconinformation);
      EditCustomTel.SetFocus;
      exit;
    end
    else//乘客被列为黑名单判断是否继续发送
    begin
      passenger := PassengerManage.GetPassenger(Trim(EditCustomTel.Text));
      if passenger <> nil then
      begin
        if passenger.IsBlacklist then
        begin
          if Messagebox(handle,pchar('该乘客已被设为黑名单,是否删除继续发送!')
              ,'提示',MB_OKCANCEL + MB_ICONQUESTION)= ID_CANCEL then
          begin
            Exit;
          end;
        end;  
      end;
    end;

    EditAddress.Text:=DelInvalidStr(EditAddress.Text);

    if (ComboBoxType.ItemIndex = 1) then
    begin
      orderDateTime := EncodeDateTime(Yearof(DateTimePickerDate.Date),
                                      MonthOf(DateTimePickerDate.Date),
                                      Dayof(DateTimePickerDate.Date),
                                      Hourof(DateTimePickerTime.Time),
                                      MinuteOf(DateTimePickerTime.Time),
                                      SecondOf(DateTimePickerTime.Time), 0);
      if (MinutesBetween(orderDateTime, Now) > 30) and (orderDateTime > Now) then
      begin//对于刚登记的预约订单，先保存，后定时发送
        saveReservedOrder(memoDesc.Text);
        MessageBox(Handle, '该预约订单已保存，订单会提前30分钟提示发送，请保持客户端开启!', '提示', MB_OK + MB_ICONINFORMATION);
        Close;
        Exit;
      end{
      else if (MinutesBetween(orderDateTime, Now) <= 30) and (orderDateTime > Now) then
      begin//预约订单开始发送

      end};
    end;

    if Listview1.Items.Count = 0 then
    begin
      messagebox(handle,'请选择发送的车辆!','提示',mb_ok + mb_iconinformation);
      exit;
    end;
    
    if (ComboBoxType.ItemIndex = 0) and (ListView1.items.Count > 30) then   // 即时订单
    begin
      MessageBox(Handle, '选择发送的车辆不能大于30辆，请确认!', '提示', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

    if (ComboBoxType.ItemIndex = 2) and (ListView1.Items.Count > 1) then    // 急召订单
    begin
      MessageBox(Handle, '急召只能选择一辆车!', '提示', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
    
    i:=0;
    SendStr:=memoDesc.Text; //EditAddress.Text+'有一位'+EditName.Text+ComboBoxName.Text+'要车';
    
    while i< ListView1.Items.Count do
    begin
      Dev:=ADeviceManage.FindDevFromCarNo(ListView1.Items.Item[i].Caption);    //.Find(ACarNoManage.GetDevID(ListView1.Items.Item[i].Caption));
      if Dev=nil then
      begin
        if messagebox(handle,pchar('您没有权限对'+ListView1.Items.Item[i].Caption+'操作,是否删除继续发送!')
                    ,'提示',MB_OKCANCEL + MB_ICONQUESTION)= ID_OK then
        begin
           ListView1.Items.Item[i].Delete;
        end
        else
        begin
           exit;
        end;
      end
      else if not isSend2HeavyCar then
      begin
        //即时和急召订单过滤重车
        if (ComboBoxType.ItemIndex = 0) or (ComboBoxType.ItemIndex = 2) then
        begin
          if Dev.Switch[MSG_STATE_9] then
          begin
            if messagebox(handle,pchar('待发送车辆中有重车，是否过滤重车继续发送!')
                        ,'提示',MB_OKCANCEL + MB_ICONQUESTION)= ID_OK then
            begin
              ListView1.Items.Item[i].Delete;
              //isSend2HeavyCar := True;
            end
            else
            begin
              Exit;
            end;
          end;
        end;

        //过滤黑名单
        if not isSend2DriverInBlacklist and (Dev.Login_Driver <> '司机签退') and (Dev.Login_Driver <> '未登录') and (Dev.Login_Driver <> '') then
        begin
          driver.id := -1;
          for j := 0 to ADriverManage.Count - 1 do
          begin
            if ADriverManage.Drivers[i].DriverNO = Dev.Login_Driver then
            begin
              driver := ADriverManage.Drivers[i];
              Break;
            end;
          end;
          if (driver.id <> - 1) and driver.isBlacklist then
          begin
            if Dev.Switch[MSG_STATE_9] then
            begin
              if messagebox(handle,pchar('待发送车辆的当前司机中有被设为黑名单的司机，是否过滤该司机的车辆继续发送!')
                          ,'提示',MB_OKCANCEL + MB_ICONQUESTION)= ID_OK then
              begin
                ListView1.Items.Item[i].Delete;
                //isSend2DriverInBlacklist := True;
              end
              else
              begin
                Exit;
              end;
            end;
          end;  
        end;

        ListView1.Items.Item[i].Data:=Pointer(Dev);
        inc(i);
      end;
    end;

    if ListView1.Items.Count <= 0 then
    begin
      Exit; // 经过上面的过滤后已经没有待发送的车辆了
    end;
                                         
    SendNewOrder(SendStr);
    ep.Latitude := -1;
    ep.Longitude := -1;
    Close;
  finally
    BitBtnSend.Enabled:=true;
  end;
end;

procedure TSendOrderMiniFrm.SendNewOrder(SendStr: string);
var
  Order: TOrder;
  OrderDateTime_V2: TDateTime_V2;
  i: integer;
  tempDeviceManage: TDeviceManage;
  curPassenger: TPassenger;
  devIdArrWith, devIdArrWithout: array of Integer;
  dev: TDevice;
begin
  try
    if Trim(EditOrderID.Text) <> '' then
      Order := AOrderManage.Find(StrToInt(Trim(EditOrderID.Text)))
    else
      Order := nil;
    if Order = nil then
    begin
      Order := Torder.Create;
      Order.OderType := ComboBoxType.ItemIndex;
      Order.OderDateTime := EncodeDateTime(Yearof(DateTimePickerDate.Date),
                                          MonthOf(DateTimePickerDate.Date),
                                          Dayof(DateTimePickerDate.Date),
                                          Hourof(DateTimePickerTime.Time),
                                          MinuteOf(DateTimePickerTime.Time),
                                          SecondOf(DateTimePickerTime.Time), 0);
      OrderDateTime_V2[0] := StrToInt('$'+IntToStr(YearOf(DateTimePickerDate.Date) - 2000));
      OrderDateTime_V2[1] := StrToInt('$'+IntToStr(MonthOf(DateTimePickerDate.Date)));
      OrderDateTime_V2[2] := StrToInt('$'+IntToStr(DayOf(DateTimePickerDate.Date)));
      OrderDateTime_V2[3] := StrToInt('$'+IntToStr(HourOf(DateTimePickerTime.Time)));
      OrderDateTime_V2[4] := StrToInt('$'+IntToStr(MinuteOf(DateTimePickerTime.Time)));
      OrderDateTime_V2[5] := StrToInt('$'+IntToStr(SecondOf(DateTimePickerTime.Time)));
      Order.OrderDateTime_V2 := OrderDateTime_V2;
      Order.OderDate := dateof(DateTimePickerDate.Date);
      Order.OderTime := timeof(DateTimePickerTime.Time);
      Order.CustomerTel := EditCustomTel.Text;
      Order.OrderContent := EditAddress.Text; //Memo1.Text;
      Order.OrderDetailContent := SendStr; //Memo2.Text;
      Order.OperationUser := current_user.id;
      Order.State := 10;
      Order.NameOfCustom := EditName.Text;
      Order.SexOfCustom := ComboBoxName.ItemIndex;
      Order.AddressOfCustom := EditAddress.Text;
      Order.AddressQuery := ComboBoxAddress.Text;
      {if (IncMinute(Order.OderDateTime, -10) < now) and (ComboBoxType.ItemIndex = 1) then
      begin
        order.Free;
        messagebox(handle, '预约时必须在十分钟以后,如果十分钟内请选择即时订单!', '提示', mb_ok + mb_iconinformation);
        exit;
      end;}
      i := 0;

      tempDeviceManage := TDeviceManage.Create;
      while ListView1.Items.Count > i do
      begin
        if ListView1.Items.Item[i].Data <> nil then
        begin
          //Order.AddSendDevID(TDevice(ListView1.Items.Item[i].Data));
          tempDeviceManage.Add(TDevice(ListView1.Items.Item[i].Data));
        
          inc(i);
        end
        else
        begin
          if messagebox(handle, PChar('您没有权限操作' + ListView1.Items.Item[i].Caption + '车,是否发送?'),
            '提示', MB_OKCANCEL + MB_ICONQUESTION) = ID_CANCEL then exit;
          ListView1.Items.Item[i].Delete;
        end;
      end;
      if tempDeviceManage.Count > 0 then
      begin
        if tempDeviceManage.Count = 1 then
        begin
          Order.AddSendDevID(tempDeviceManage.Items[0]);
        end
        else
        begin
          SetLength(devIdArrWith, tempDeviceManage.Count);
          SetLength(devIdArrWithout, tempDeviceManage.Count);
          for i := 0 to tempDeviceManage.Count - 1 do
          begin
            devIdArrWith[i] := -1;
            devIdArrWithout[i] := -1;
          end;

          if rgSendOption.ItemIndex = 0 then
          begin//按积分高低发送
            sortDeviceManage(tempDeviceManage, devIdArrWith, devIdArrWithout, 0);
            i := 0;
            while i < Length(devIdArrWith) do
            begin
              if devIdArrWith[i] > 0 then
              begin
                dev := ADeviceManage.find(devIdArrWith[i]);
                if dev <> nil then
                  Order.AddSendDevID(dev);
              end;
              Inc(i);
            end;
            i := 0;
            while i < Length(devIdArrWithout) do
            begin
              if devIdArrWithout[i] > 0 then
              begin
                dev := ADeviceManage.find(devIdArrWithout[i]);
                if dev <> nil then
                  Order.AddSendDevID(dev);
              end;
              Inc(i);
            end;
          end
          else// 有在地图上定位地点
          begin//按距离远近发送
            sortDeviceManage(tempDeviceManage, devIdArrWith, devIdArrWithout, 1);
            i := 0;
            while i < Length(devIdArrWith) do
            begin
              if devIdArrWith[i] > 0 then
              begin
                dev := ADeviceManage.find(devIdArrWith[i]);
                if dev <> nil then
                  Order.AddSendDevID(dev);
              end;
              Inc(i);
            end;
            i := 0;
            while i < Length(devIdArrWithout) do
            begin
              if devIdArrWithout[i] > 0 then
              begin
                dev := ADeviceManage.find(devIdArrWithout[i]);
                if dev <> nil then
                  Order.AddSendDevID(dev);
              end;
              Inc(i);
            end;
          end;
        end;
      end;
      tempDeviceManage.Free;

      //如果passengerManage里没有当前电话乘客的信息则将其存库，如果已经有则更新信息，最后再将其加入当前乘客信息管理器
      curPassenger := PassengerManage.GetPassenger(Trim(EditCustomTel.Text));
      if curPassenger = nil then
      begin
        curPassenger := TPassenger.Create;
        curPassenger.FamilyName := EditName.Text;
        curPassenger.Gender := ComboBoxName.ItemIndex;
        curPassenger.Address := EditAddress.Text;
        curPassenger.Phone := Trim(EditCustomTel.Text);
        curPassenger.LastOrderTime := Now;
        curPassenger.PassengerId := Bs.addPassengerInfo(curPassenger);
      end
      else
      begin
        curPassenger.FamilyName := EditName.Text;
        curPassenger.Gender := ComboBoxName.ItemIndex;
        curPassenger.Address := EditAddress.Text;
        curPassenger.LastOrderTime := Now;
        Bs.updatePassengerInfo(curPassenger);
      end;

      if curPassenger.PassengerId < 0 then
      begin
        curPassenger.Free;
        curPassenger := nil;
        Exit;
      end;

      Order.PassengerId := curPassenger.PassengerId;

      try
        Order.SaveToDataBase; //保存数据库...
      except
        on E: Exception do
        begin
          messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
          exit;
        end;
      end;
      
      if order.ID < 0 then
      begin
        order.Free;
        exit;
      end;
      EditOrderID.Text := IntToStr(Order.ID);
      AOrderManage.AddOder(Order);
    end
    else
    begin
      i := 0;

      Order.State := 10;
      tempDeviceManage := TDeviceManage.Create;
      while ListView1.Items.Count > i do
      begin
        if ListView1.Items.Item[i].Data <> nil then
        begin
          //Order.AddSendDevID(TDevice(ListView1.Items.Item[i].Data));
          tempDeviceManage.Add(TDevice(ListView1.Items.Item[i].Data).IdStr);
          inc(i);
        end
        else
        begin
          if messagebox(handle, PChar('您没有权限操作' + ListView1.Items.Item[i].Caption + '车,是否发送?'),
            '提示', MB_OKCANCEL + MB_ICONQUESTION) = ID_CANCEL then exit;
          ListView1.Items.Item[i].Delete;
        end;
      end;
      if tempDeviceManage.Count > 0 then
      begin
        if tempDeviceManage.Count = 1 then
        begin
          Order.AddSendDevID(tempDeviceManage.Items[i]);
        end
        else
        begin
          SetLength(devIdArrWith, tempDeviceManage.Count);
          SetLength(devIdArrWithout, tempDeviceManage.Count);
          for i := 0 to tempDeviceManage.Count - 1 do
          begin
            devIdArrWith[i] := -1;
            devIdArrWithout[i] := -1;
          end;

          if rgSendOption.ItemIndex = 0 then
          begin//按积分高低发送
            sortDeviceManage(tempDeviceManage, devIdArrWith, devIdArrWithout, 0);
            i := 0;
            while i < Length(devIdArrWith) do
            begin
              if devIdArrWith[i] > 0 then
              begin
                dev := ADeviceManage.find(devIdArrWith[i]);
                if dev <> nil then
                  Order.AddSendDevID(dev);
              end;
              Inc(i);
            end;
            i := 0;
            while i < Length(devIdArrWithout) do
            begin
              if devIdArrWithout[i] > 0 then
              begin
                dev := ADeviceManage.find(devIdArrWithout[i]);
                if dev <> nil then
                  Order.AddSendDevID(dev);
              end;
              Inc(i);
            end;
          end
          else// 有在地图上定位地点
          begin//按距离远近发送
            sortDeviceManage(tempDeviceManage, devIdArrWith, devIdArrWithout, 1);
            i := 0;
            while i < Length(devIdArrWith) do
            begin
              if devIdArrWith[i] > 0 then
              begin
                dev := ADeviceManage.find(devIdArrWith[i]);
                if dev <> nil then
                  Order.AddSendDevID(dev);
              end;
              Inc(i);
            end;
            i := 0;
            while i < Length(devIdArrWithout) do
            begin
              if devIdArrWithout[i] > 0 then
              begin
                dev := ADeviceManage.find(devIdArrWithout[i]);
                if dev <> nil then
                  Order.AddSendDevID(dev);
              end;
              Inc(i);
            end;            
          end;
        end;
      end;
      tempDeviceManage.Free;
    end;
    DataServer.SendOrder_V3(Order);
  except
    on E: Exception do
    begin
      uGloabVar.SystemLog.AddLog('发送订单异常:' + E.Message);
    end;  
  end;
end;

procedure TSendOrderMiniFrm.SendOldOrder(SendStr: string);
var
  Order: TOrder;
  i: integer;
begin
  Order := Torder.Create;
  Order.OderType := ComboBoxType.ItemIndex;
  Order.OderDateTime := EncodeDateTime(Yearof(DateTimePickerDate.Date),
    MonthOf(DateTimePickerDate.Date),
    Dayof(DateTimePickerDate.Date),
    Hourof(DateTimePickerTime.Time),
    MinuteOf(DateTimePickerTime.Time),
    SecondOf(DateTimePickerTime.Time), 0);
  Order.OderDate := dateof(DateTimePickerDate.Date);
  Order.OderTime := timeof(DateTimePickerTime.Time);
  Order.CustomerTel := EditCustomTel.Text;
  Order.OrderContent := SendStr; //Memo1.Text;
  Order.OrderDetailContent := SendStr; //Memo2.Text;
  Order.OperationUser := current_user.id;
  Order.State := 10;
  Order.NameOfCustom := EditName.Text;
  Order.SexOfCustom := ComboBoxName.ItemIndex;
  Order.AddressOfCustom := EditAddress.Text;
  Order.AddressQuery := ComboBoxAddress.Text;
  if (IncMinute(Order.OderDateTime, -10) < now) and (ComboBoxType.ItemIndex = 1) then
  begin
    order.Free;
    messagebox(handle, '预约时必须在十分钟以后,如果十分钟内请选择即时订单!', '提示', mb_ok + mb_iconinformation);
    exit;
  end;
  i := 0;
  while ListView1.Items.Count > i do
  begin
    if ListView1.Items.Item[i].Data <> nil then
    begin
      Order.AddSendDevID(TDevice(ListView1.Items.Item[i].Data));
      inc(i);
    end
    else
    begin
      if messagebox(handle, PChar('您没有权限操作' + ListView1.Items.Item[i].Caption + '车,是否发送?'),
        '提示', MB_OKCANCEL + MB_ICONQUESTION) = ID_CANCEL then exit;
      ListView1.Items.Item[i].Delete;
    end;
  end;

  Order.SaveToDataBase; //保存数据库...
  if order.ID < 0 then
  begin
    order.Free;
    exit;
  end;
  EditOrderID.Text := IntToStr(Order.ID);
  AOrderManage.AddOder(Order);
  DataServer.SendOrder(Order);
end;

procedure TSendOrderMiniFrm.ComboBoxTypeChange(Sender: TObject);
var
  da:TdateTime;
begin
  if (ComboBoxType.ItemIndex=0) or (ComboBoxType.ItemIndex = 2) then
  begin
    DateTimePickerDate.Enabled:=false;
    DateTimePickerDate.Date:=Date;
    DateTimePickerDate.Color:=clBtnFace;
    DateTimePickertime.Time:=IncMinute(Time, 5);
    ComboBoxAddress.Enabled := True;
    BitBtnQuery.Enabled := True;
    cxAddressList.Enabled := True;
    ListView1.Enabled := True;
    ListView1.Color := clWindow;
    BitBtnSend.Caption := '发送';
    BitBtnSend.Width := 75;
    BitBtnSel.Enabled := True;
    BitBtn4.Enabled := True;
    rgSendOption.Enabled := True;
  end
  else
  begin
    DateTimePickerDate.Color:=clWindow;
    da:=DateTimePickerdate.DateTime;
    da:=IncMinute(da,40);
    if formatDateTime('yyyy-mm-dd',da)<>formatDateTime('yyyy-mm-dd',DateTimePickerdate.DateTime) then
    begin
      da:=DateTimePickerTime.Date;
      DateTimePickerDate.Date:=IncDay(da,1);
    end ;
    DateTimePickertime.Time:=IncMinute(Time,40);
    DateTimePickerDate.Enabled:=true;

    ComboBoxAddress.Enabled := False;
    BitBtnQuery.Enabled := False;
    cxAddressList.Enabled := False;
    ListView1.Enabled := False;
    ListView1.Color := clBtnFace;
    BitBtnSend.Caption := '保存定时发送';
    BitBtnSend.Width := 100;
    BitBtnSel.Enabled := False;
    BitBtn4.Enabled := False;
    rgSendOption.Enabled := False;
  end;
  DateTimePickerTime.Enabled:=DateTimePickerDate.Enabled;
  DateTimePickertime.Color:=DateTimePickerDate.Color
end;

procedure TSendOrderMiniFrm.EditCustomTelKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key=#13 then  editName.SetFocus;
 if not (Key in [#8,'0'..'9','-',#22]) then Key := #0;
end;

procedure TSendOrderMiniFrm.EditNameKeyPress(Sender: TObject;
  var Key: Char);
var
 C:string;
begin
   if not (Key in [#8,'a'..'z','A'..'Z','0'..'9']) then
      isAddName:=false
   else
   begin
     isAddName:=true;
     EditName.DroppedDown:=true;
   end;

   if (Key=#13)or(Key=' ')then
   begin
     if EditName.Text <>'' then
     begin
       C:= copy(EditName.Text,1,1) ;
       if (C[1] in['A'..'Z'])and(EditName.Items.Count>0)  then
          EditName.Text:=EditName.Items.Strings[0];
     end;
     ComboBoxName.SetFocus;
     Key:=#0;
   end;
end;

procedure TSendOrderMiniFrm.ComboBoxNameKeyPress(Sender: TObject;
  var Key: Char);
begin
    ComboBoxName.DroppedDown:=true;
    if (Key=#13)or(Key=' ') then
    begin
      ComboBoxType.SetFocus;
      Key:=#0; 
    end;
end;

procedure TSendOrderMiniFrm.ComboBoxTypeKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key=#13 then
   begin
     if DateTimePickerDate.Enabled then
        DateTimePickerDate.SetFocus
     else
       ;// ComboBoxAddress.SetFocus;
   end;
end;

procedure TSendOrderMiniFrm.DateTimePickerDateKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key=#13 then DateTimePickerTime.SetFocus;
end;

procedure TSendOrderMiniFrm.DateTimePickerTimeKeyPress(Sender: TObject;
  var Key: Char);
begin
    // if Key=#13 then ComboBoxAddress.SetFocus;
end;

procedure TSendOrderMiniFrm.EditAddressKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then EditName.SetFocus;
end;

procedure TSendOrderMiniFrm.ComboBoxQueryKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key=#13 then BitBtnQuery.SetFocus;
end;

procedure TSendOrderMiniFrm.ShowOrder(Order: TOrder);
var
 i:integer;
 s:String;
begin
  if Order = nil then exit;
  EditOrderID.Text:=intToStr(Order.ID);
  ComboBoxType.ItemIndex:=Order.OderType;
  DateTimePickerDate.Date:=Order.OderDate;
  DateTimePickertime.Time:=Order.OderTime;
  EditCustomTel.Text:=Order.CustomerTel;
      
  EditName.Text:=Order.NameOfCustom;
  ComboBoxName.ItemIndex:=Order.SexOfCustom;
  EditCancelReason.Text:=FindCancelReasonName(Order);
  EditAddress.Text:=Order.AddressOfCustom;
  memoDesc.Text := Order.OrderDetailContent;
  
  EditOKCarNO.Text:=FindDevice(Order.SucceedDevID);
  EditState.Text:=ReturnState(Order.State);
  ListView1.Clear;
  for i:=0 to Order.CountOfSendDev-1 do
  begin
     s:=ACarNOManage.GetCarNO(Order.SendDevIDsInt[i]);
     if s<>'' then
     begin
       with ListView1.Items.Add do
       begin
          Caption:=s;
          Data:=nil;
       end;
     end;
  end;

  //界面中控制不让操作
  {EditCustomTel.ReadOnly := True;
  EditCustomTel.Color := clBtnFace;
  EditAddress.ReadOnly := True;
  EditAddress.Color := clBtnFace;
  memoDesc.ReadOnly := True;
  memoDesc.Color := clBtnFace;
  EditName.Enabled := False;
  ComboBoxName.Enabled := False;
  ComboBoxType.Enabled := False;
  DateTimePickerDate.Enabled := False;
  DateTimePickerTime.Enabled := False;
  ComboBoxAddress.Enabled := False;
  BitBtnQuery.Enabled := False;
  BitBtnSend.Enabled := False;
  BitBtnSel.Enabled := False;
  BitBtn4.Enabled := False;
  rgSendOption.Enabled := False;   }
end;

function TSendOrderMiniFrm.FindDevice(DevID:integer):String;
var
  Dev:TDevice;
begin
 Result:='';
 Dev:= ADeviceManage.Find(DevID);
 if Dev <>nil then
 begin
   Result:=Dev.Car.No;
 end;
end;

function TSendOrderMiniFrm.ReturnState(State:byte):String;
begin
 Result:='';
 Case State of
  ORDERSTATE_NODEVANSWER_DEL: Result:='中心自动删除';
  ORDERSTATE_WAITGRAB: Result:='等待司机抢单';
  ORDERSTATE_DEVGRAB : Result:='已有司机抢单';
  ORDERSTATE_SENDINGDEVGRABOK: Result:='正在下发给司机抢单成功';
  ORDERSTATE_SENDDEVGRABOK_FAIL: Result:='抢单失败';
  ORDERSTATE_DEVGRABOK: Result:='抢单成功';
  ORDERSTATE_SRVCANCEL: Result:='中心取消订单';
  ORDERSTATE_DEVCANCEL: Result:='车机取消订单';
  10:Result:='等待中...';
 end;
end;

function TSendOrderMiniFrm.FindCancelReasonName(Order:TOrder):String;
var
  Dev:TDevice;
begin
 Result:='';
 Dev:= ADeviceManage.Find(Order.SucceedDevID);
 if Dev <>nil then
 begin
   Result:=Dev.FindCancelOrderMenu(Order.CancelReasonID).Name; 
 end;
end;


procedure TSendOrderMiniFrm.BitBtnCancelClick(Sender: TObject);
var
  Order:TOrder;
begin
  BitBtnCancel.Enabled:=false;
  try
    if EditOrderID.Text='' then
    begin
      messagebox(handle,'请选择一个订单!','提示',mb_ok + mb_iconinformation);
      exit;
    end;
    Order:=AOrderManage.Find(StrToInt(EditOrderID.Text));
    if Order=nil then
    begin
      messagebox(handle,'没有找到此订单,不能取消!','提示',mb_ok + mb_iconinformation);
      exit;
    end;
    if Order.State=ORDERSTATE_NODEVANSWER_DEL then
    begin
      messagebox(handle,'此订单已被中心删除,不能取消!','提示',mb_ok + mb_iconinformation);
      exit;
    end;
    if Order.State=ORDERSTATE_SENDDEVGRABOK_FAIL then
    begin
      messagebox(handle,'此订单抢单失败,不能取消!','提示',mb_ok + mb_iconinformation);
      exit;
    end;
    if Order.State=ORDERSTATE_SRVCANCEL then
    begin
      messagebox(handle,'中心已经取消此订单!','提示',mb_ok + mb_iconinformation);
      exit;
    end;

    if Order.State=ORDERSTATE_DEVCANCEL then
    begin
      messagebox(handle,'司机已经取消此订单!','提示',mb_ok + mb_iconinformation);
      exit;
    end;
    if Order.OderDateTime<now then
    begin
      messagebox(handle,'订单已过期,不能取消!','提示',mb_ok + mb_iconinformation);
      exit;
    end;

    if messagebox(handle,PChar('是否确定取消订单号:'+EditOrderID.Text+#13#10+Order.OrderContent),
                  '取消提示',MB_YESNO + MB_ICONQUESTION)= ID_NO then exit;

    if Order<>nil then
    begin
      DataServer.CancelOrder(Order);
    end;
  finally
    BitBtnCancel.Enabled:=true;
  end;
  Close;
end;


procedure TSendOrderMiniFrm.BitBtnSelClick(Sender: TObject);
var
  dlg: TFrmSelectDevs;
  i:integer;
  dev: Tdevice;
begin
  dlg:= TFrmSelectDevs.Create(nil);
  try
    dlg.Top := 0;
    dlg.FormStyle := fsStayOnTop;
    dlg.ShowModal;
    if dlg.ModalResult = mrok then
    begin
      ListView1.Clear;
      for i:= 0 to dlg.DestList.Count -1 do
        with ListView1.Items.Add do
        begin
          dev:=TDevice(dlg.DestList.Items[i].Data) ;
          caption:= dev.Car.No;
          data   := dev;
        end;
    end;
  finally
    dlg.Free;
  end;
end; 


procedure TSendOrderMiniFrm.BitBtn4Click(Sender: TObject);
begin
  if ListView1.Selected =nil then exit;
  if ListView1.Items.Count =1 then
  begin
    messagebox(handle,'只有一辆车了，不能删除！','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  ListView1.DeleteSelected ;
end;


procedure TSendOrderMiniFrm.BitBtnQueryClick(Sender: TObject);
var
  i,j,searchLayerCnt: integer;
  tmpDrawLayer: TDrawLayer;
  tmpDataLayer: TDataLayer;
  seekAry: TIntegerDynArray;
  searchName,tempStr:string;
  locateOptions: TLocateOptions;
  tempMeta:PMetaStruct;
begin
BitBtnQuery.Enabled:=false;
try
  if Trim(ComboBoxAddress.Text)='' then
  begin
    messagebox(handle,'请您输入要查找的内容！','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  searchName := Trim(ComboBoxAddress.Text);
  locateOptions := [loPartialKey];

  cxAddressList.Clear;
  searchLayerCnt := 0;
  SetLength(FSearchResult,searchLayerCnt);

  for i:=0 to GTextManage.Count-1 do
  begin
      if pos(searchName,GTextManage.Item[i]^.Text)>0 then
      begin
         inc(searchLayerCnt);
         SetLength(FSearchResult,searchLayerCnt);
         //FSearchResult[searchLayerCnt-1].IsUserDefinedText:=true;
         FSearchResult[searchLayerCnt-1].pDefineText:=GTextManage.Item[i];
         FSearchResult[searchLayerCnt-1].DataLayer:=nil;
      end;
      

  end;



  for i:= 0 to FMap.Layers.Count -1 do
  begin
    tmpDrawLayer := Fmap.Layers.Layer[i];
   // if (tmpDrawLayer.LayerName='GPS图层') or (tmpDrawLayer.LayerName=UserDrawAreaLayerName) then
    if tmpDrawLayer.isHaveNotDelete then   Continue;
    tmpDataLayer:=TDataLayer(tmpDrawLayer.Data);
    for j:= 0 to tmpDataLayer.MetaCount -1 do
    begin
      tempMeta:=tmpDataLayer.GetMeta(j);
      tempStr:=tmpDataLayer.GetMetaName(tempMeta);
      if pos(searchName,tempStr)>0 then
      begin
         inc(searchLayerCnt);
         SetLength(FSearchResult,searchLayerCnt);
         //FSearchResult[searchLayerCnt-1].IsUserDefinedText:=false;
         FSearchResult[searchLayerCnt-1].pMeta:=tempMeta;
         FSearchResult[searchLayerCnt-1].DataLayer:=tmpDataLayer;
      end;

      if searchLayerCnt>100 then
      break;


     {
      fldName:= tmpDrawLayer.Data.DataSet.Fields[j].FieldName; //字段名称
      //只找 string 类型的字段
      if tmpDrawLayer.Data.DataSet.FieldByName(fldName).DataType <> ftString then
        Continue;
      SetLength(seekAry,0);
      try
        seekAry := TDataLayer(tmpDrawLayer.Data).GetUIDFromLabelValue(fldName,searchName,locateOptions);
      except
        exit;
      end;
      if Length(seekAry)>0 then
      begin
        searchLayerCnt := searchLayerCnt+1;
        SetLength(FSearchResult,searchLayerCnt);
        FSearchResult[searchLayerCnt-1].DrawLayer := tmpDrawLayer;
        FSearchResult[searchLayerCnt-1].FieldName := fldName;
        SetLength(FSearchResult[searchLayerCnt-1].SeekUIDAry,Length(seekAry));
        FSearchResult[searchLayerCnt-1].SeekUIDAry := seekAry;
       // FSearchResult[searchLayerCnt-1].UIDIndex:=j;
      end;}
    end;
  end;   
  //找到了
  if Length(FSearchResult)>0 then
  begin


    //列出找到的所有图元
    for i:= 0 to Length(FSearchResult)-1 do
    begin

        if FSearchResult[i].DataLayer<>nil then
        begin
            with cxAddressList.Add do
            begin
              Values[0]:=FSearchResult[i].DataLayer.GetMetaName(FSearchResult[i].pMeta);//FSearchResult[i].FieldName;
              Values[1]:=i;
              Data := @FSearchResult[i];
            end;
        end
        else
        begin
            with cxAddressList.Add do
            begin
              Values[0]:=FSearchResult[i].pDefineText^.Text;
              Values[1]:=i;
              Data := @FSearchResult[i];
            end;
        end;

    end;

    if cxAddressList.Count >0 then
    begin
     cxAddressList.Items[0].Selected:=true;
     cxAddressList.Items[0].Focused:=true;
    end;
    cxAddressListDblClick(nil);
  end;
finally
  BitBtnQuery.Enabled:=true;
end;

end;

procedure TSendOrderMiniFrm.cxAddressListDblClick(Sender: TObject);
var
  tmpAddr:TSearchAddrResult;
  metaUID,metaIndex : integer;
  meta : PMetaStruct;
  j: integer;
  dev: TDevice;
  i: Integer;

  r: Double;
  distance: Double;
  list: TStringList;
begin
  try
    if cxAddressList.FocusedNode  = nil then exit;
    tmpAddr:= PSearchAddrResult(cxAddressList.FocusedNode.Data)^;
    ComboBoxAddress.Text:=cxAddressList.FocusedNode.Values[0];
    EditAddress.Text := cxAddressList.FocusedNode.Values[0];
    memoDesc.Text := '在' + EditAddress.Text + '有位乘客要车';
    //j:=cxAddressList.FocusedNode.Values[1];
   // metaUID:= tmpAddr.SeekUIDAry[j];
    //metaIndex := tmpAddr.DrawLayer.Data.GetMetaIndex(metaUID);
    if tmpAddr.DataLayer<>nil then
    begin
        meta := tmpAddr.pMeta;//.Data.GetMeta(metaIndex{,FMap.Projection.ProjectionType});
        ShowMetaInMap(meta,tmpAddr.DataLayer.StaticStart);
    end
    else
    begin
        FMap.Zoom(1,tmpAddr.pDefineText.Symbol.Position);
        ep := FMap.Projection.XY2LoLa(tmpAddr.pDefineText.Symbol.Position);
        FMap.Draw;
    end;

    //将当前在线的2km之内的在线车辆自动加入待发送车辆列表中
    if Trim(Edit1.Text) = '' then
      Edit1.Text := '1.0';
    r := StrToFloat(Trim(Edit1.Text));

    ListView1.Items.Clear;
    list := TStringList.Create;
    list.Clear;
    for i := 0 to ADeviceManage.Count - 1 do
    begin
      dev := ADeviceManage.Items[i];
      if dev.isOnline and (dev.Longitude > 0) and (dev.Latitude >0) then
      begin//只添加在线车辆
        distance := GetDistance(ep.Latitude, ep.Longitude, dev.Latitude, dev.Longitude);
        if distance < r then
        begin
          list.AddObject(FormatFloat('0.000',distance), dev);
        end;  
      end;  
    end;

    list.Sort;
    for i := 0 to list.Count - 1 do
    begin
      with ListView1.Items.Add do
      begin
        Caption := TDevice(list.Objects[i]).Car.No;
        SubItems.Add(list.Strings[i]);
        Data := TDevice(list.Objects[i]);
      end;
    end;

    if ListView1.Items.Count <= 0 then
    begin
      Edit1.SetFocus;
      Edit1.SelectAll;
      EditAddress.Text := '';
    end;
  except
  end;
end;


procedure TSendOrderMiniFrm.ShowMetaInMap(meta:PMetaStruct;StaticStart:integer);
var
//  ep   : TEarthPoint;
  wp   : TWorldPoint;
  points_count,sizeofbuffer  : integer;
  FDataBuffer   : TIntegerDynArray;
  isCalculateed_wp : boolean;   //已计算出wp
  
//  i:integer;
begin
  isCalculateed_wp := False;
  case meta._type of
    _Symbol:
    begin
      wp :=meta.Symbol.Position;
    end;
    _Line:
    begin
      //ep:= meta.Line.SP;
      wp.x := (meta.Line.SP.x + meta.Line.EP.x) div 2;
      wp.y  := (meta.Line.SP.y  + meta.Line.EP.y) div 2;
    end;
    _Text:
    begin
      wp:= meta.Text.SP;
    end;
    _Rect:
    begin
      wp:= meta.Outbox.TopLeft;
    end;
    _RoundRect:
    begin
      wp:= meta.Outbox.TopLeft;
    end;
    _PolyLine:
    begin
      with Meta.Polyline do 
      begin
        points_count:=SPWAddress-PWAddress;
        sizeofbuffer:=Count*sizeof(integer)+points_count;
        if sizeofbuffer<0 then sizeofbuffer:=0;
        SetLength(FDataBuffer,sizeofbuffer);

        CopyMemory(@FDataBuffer[0],Pointer(PWAddress+StaticStart),sizeofbuffer);
      end;
      wp:= TWorldPointAry(FDataBuffer)[0];
      isCalculateed_wp := true;
    end;
    _PolyRegion:
    begin
      with Meta.PolyRegion do
      begin
        points_count:=SPWAddress-PWAddress;
        sizeofbuffer:=Count*sizeof(integer)+points_count;
        if sizeofbuffer<0 then sizeofbuffer:=0;
        SetLength(FDataBuffer,sizeofbuffer);
        CopyMemory(@FDataBuffer[0],pointer(PWAddress+StaticStart),sizeofbuffer);
      end;
      wp:= TWorldPointAry(FDataBuffer)[0];
      isCalculateed_wp := true;
    end;
  end;    

  //if not isCalculateed_wp then wp := FMap.Projection.LoLa2XY(ep);

  ep := FMap.Projection.XY2LoLa(wp);
  FMap.Zoom(1,wp);
  FMap.Draw;
  FMap.TmpDraw.Canvas.Pen.Color := clred;
  FMap.TmpDraw.Canvas.Pen.Width :=3;
  FMap.TmpDraw.Canvas.Pen.Mode := pmMask ;
  x:=Mainf.FDlg_Map.Panel_Map.Width  div 2;
  y:=Mainf.FDlg_Map.Panel_Map.Height div 2;
  FMap.DrawTempEllipseAndText(x,y,ComboBoxAddress.Text);
//  mainf.FMap.TmpDraw.Canvas.TextOut(x-(length(ComboBoxAddress.Text)*3),y-7,ComboBoxAddress.Text);
//  mainf.FMap.TmpDraw.Canvas.Ellipse(x-10,Y-10,X+10,Y+10);
//  mainf.FMap.Refresh;
end;



procedure TSendOrderMiniFrm.EditAddressChange(Sender: TObject);
//var
//  i:integer;
//  Len:integer;
begin
{  ComboBoxQuery.Items.Clear;
  Len:=Length(EditAddress.Text);
  if Len>20 then Len:=20;
  Len:=Len div 2;
  for i:=0 to Len-1 do
  begin
    ComboBoxQuery.Items.Add(Copy(EditAddress.Text,1,(i+1)*2));
  end;  }
//  ComboBoxQuery.Text:=Copy(EditAddress.Text,1,4);
end;

procedure TSendOrderMiniFrm.EditNameEnter(Sender: TObject);
begin
  editName.SelectAll;
  editName.ImeName:='';

end;

procedure TSendOrderMiniFrm.ComboBoxAddressChange(Sender: TObject);
begin
  //if not isAddAddress then exit;
    AddressName.Find(ComboBoxAddress.Text,ComboBoxAddress.Items);
    ComboBoxAddress.SelStart:=Length(ComboBoxAddress.Text);
    EditAddress.Text := ComboBoxAddress.Text;
    memoDesc.Text := '在' + EditAddress.Text + '有位乘客要车';
    {if ComboBoxAddress.Items.Count >0 then
      if  editAddress.Text='' then
      begin
         editAddress.Text:=ComboBoxAddress.Items.Strings[0];
         memoDesc.Text := '在' + EditAddress.Text + '有位乘客要车';
      end
      else
      begin
         editAddress.Text:=ComboBoxAddress.Items.Strings[0];//+editAddress.Text;
         memoDesc.Text := '在' + EditAddress.Text + '有位乘客要车';
      end;   }

end;

procedure TSendOrderMiniFrm.ComboBoxAddressKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (Key in [#8,'a'..'z','A'..'Z','0'..'9']) then isAddAddress:=false
   else
   begin
     isAddAddress:=true;
     ComboBoxAddress.DroppedDown:=true;
   end;
   if (Key=#13)or(Key=' ')then
   begin
     BitBtnQueryClick(nil); 
     {EditAddress.SetFocus;
     if ComboBoxAddress.Items.Count>0 then
     if (ComboBoxAddress.ItemIndex <0) then
        ComboBoxAddress.Text:=ComboBoxAddress.Items.Strings[0]
     else
       ComboBoxAddress.Text:=ComboBoxAddress.Items.Strings[ComboBoxAddress.ItemIndex];
     EditAddress.SelStart:=Length(EditAddress.Text);
     Key:=#0;
    // BitBtnQueryClick(nil);   }
   end;
end;

procedure TSendOrderMiniFrm.ComboBoxAddressSelect(Sender: TObject);
begin
   isAddAddress:=false;
   editAddress.Text:=ComboBoxAddress.Text;
end;

procedure TSendOrderMiniFrm.EditNameChange(Sender: TObject);
begin
   if not isAddName then exit;
    FamilyName.Find(EditName.Text,EditName.Items);
    EditName.SelStart:=Length(EditName.Text);
end;

procedure TSendOrderMiniFrm.EditNameSelect(Sender: TObject);
begin
   isAddName:=false;
end;

procedure TSendOrderMiniFrm.ComboBoxAddressExit(Sender: TObject);
begin
  if ComboBoxAddress.Text<>'' then   BitBtnQueryClick(nil);
end;

//根据乘客电话查找乘客信息
procedure TSendOrderMiniFrm.EditCustomTelExit(Sender: TObject);
var
  curPassenger: TPassenger;
begin
  curPassenger := PassengerManage.GetPassenger(Trim(EditCustomTel.Text));
  if curPassenger <> nil then
  begin
    EditName.Text := curPassenger.FamilyName;
    case curPassenger.Gender of
      0: ComboBoxName.ItemIndex := 0;
      1: ComboBoxName.ItemIndex := 1;
    end;
    EditAddress.Text := curPassenger.Address;
  end;
end;

procedure TSendOrderMiniFrm.sortDeviceManage(var deviceManage: TDeviceManage; var devIdArrWith, devIdArrWithout: array of Integer; sortType: Byte);
  function GetMaxIntegralIndex(intArr: array of Integer): Integer;
  var
    maxInt: Integer;
    i: Integer;
  begin
    Result := 0;
    maxInt := intArr[0];
    for i := 1 to Length(intArr) - 1 do
    begin
      if intArr[i] > maxInt then
      begin
        maxInt := intArr[i];
        Result := i;
      end;
    end;
  end;
  function GetMaxDoubleIndex(doubleArr: array of Double): Integer;
  var
    maxDouble: Double;
    i: Integer;
  begin
    Result := 0;
    maxDouble := doubleArr[0];
    for i := 0 to Length(doubleArr) - 1 do
    begin
      if doubleArr[i] > maxDouble then
      begin
        maxDouble := doubleArr[i];
        Result:= i;
      end;
    end;
  end;
  function GetMinDoubleIndex(doubleArr: array of Double): Integer;
  var
    minDouble: Double;
    i: Integer;
  begin
    Result := 0;
    minDouble := doubleArr[0];
    for i := 1 to Length(doubleArr) - 1 do
    begin
      if doubleArr[i] < minDouble then
      begin
        minDouble := doubleArr[i];
        Result:= i;
      end;
    end;
  end;
  function GetDis(dev: TDevice; ep: TEarthPoint): Double;
  begin
    Result := Sqrt(Power(dev.Longitude - ep.Longitude, 2) + Power(dev.Latitude - ep.Latitude, 2));
  end;  
var
  i, j: Integer;
  driver: TDriver;
  driverNo: string;
  driverIntegral: Integer;
  intArr: array of Integer;
  doubleArr: array of Double;
  arrLen: Integer;
  arrIndex: Integer;
  dev: TDevice;
  curWithArrIndex, curWithoutArrIndex: Integer;
begin
  i := 0;
  SetLength(intArr, 0);
  SetLength(doubleArr, 0);
  curWithArrIndex := 0;
  curWithoutArrIndex := 0;
  while i < deviceManage.Count do
  begin
    if sortType = 0 then
    begin
      if (deviceManage.Items[i].Login_Driver = '司机签退') or (deviceManage.Items[i].Login_Driver = '未登录')
        or (deviceManage.Items[i].Login_Driver = '') then
      begin//如果当前记的是签退状态的司机，算作没有登录司机
        //deviceManageWithout.Add(deviceManage.Items[i].IdStr);
        if curWithoutArrIndex < Length(devIdArrWithout) then
        begin
          devIdArrWithout[curWithoutArrIndex] := deviceManage.Items[i].Id;
          Inc(curWithoutArrIndex);
        end;
        deviceManage.Delete(deviceManage.Items[i].Id);
      end
      else
      begin//有登录司机，获取司机积分存在intArr中
        driverNo := deviceManage.Items[i].Login_Driver;
        driver.id := -1;
        j := 0;
        while j < ADriverManage.Count do
        begin
          if ADriverManage.Drivers[i].DriverNO = driverNo then
          begin
            driver := ADriverManage.Drivers[i];
            Break;
          end;
          Inc(j);
        end;
        if driver.id = -1 then
        begin//根据driverNo找不到该司机，也算作没有登录司机
          //deviceManageWithout.Add(deviceManage.Items[i].IdStr);
          if curWithoutArrIndex < Length(devIdArrWithout) then
          begin
            devIdArrWithout[curWithoutArrIndex] := deviceManage.Items[i].Id;
            Inc(curWithoutArrIndex);
          end;
          deviceManage.Delete(deviceManage.Items[i].Id);
        end
        else
        begin
          arrLen := Length(intArr);
          SetLength(intArr, arrLen + 1);
          intArr[arrLen] := driver.Integral;
          Inc(i);
        end;
      end;
    end
    else if sortType = 1 then
    begin
      dev := ADeviceManage.find(deviceManage.Items[i].id);
      if dev <> nil then
      begin
        if (dev.Longitude <= 0) or (dev.Latitude <= 0) or (ep.Longitude < 0) or (ep.Latitude < 0)then
        begin
          //deviceManageWithout.Add(deviceManage.Items[i].IdStr);
          if curWithoutArrIndex < Length(devIdArrWithout) then
          begin
            devIdArrWithout[curWithoutArrIndex] := deviceManage.Items[i].Id;
            Inc(curWithoutArrIndex);
          end;
          deviceManage.Delete(deviceManage.Items[i].Id);
        end
        else
        begin//有经纬度获取相应的距离存在doubleArr中
          arrLen := Length(doubleArr);
          SetLength(doubleArr, arrLen + 1);
          doubleArr[arrLen] := GetDis(dev, ep);
          Inc(i);
        end;  
      end
      else
      begin
        deviceManage.Delete(deviceManage.Items[i].id);
      end;
    end;
  end;

  i := 0;
  if sortType = 0 then
  begin
    while i < Length(intArr) do
    begin
      arrIndex := GetMaxIntegralIndex(intArr);
      //deviceManageWith.Add(deviceManage.Items[arrIndex]);
      if curWithArrIndex < Length(devIdArrWith) then
      begin
        devIdArrWith[curWithArrIndex] := deviceManage.Items[arrIndex].Id;
        Inc(curWithArrIndex)
      end;

      deviceManage.Delete(deviceManage.Items[arrIndex].id);
      if arrIndex = Length(intArr) - 1 then
      begin
        SetLength(intArr, Length(intArr) - 1);
      end
      else
      begin
        CopyMemory(@intArr[arrIndex], @intArr[arrIndex + 1], (Length(intArr) - arrIndex - 1) * 4);
        SetLength(intArr, Length(intArr) - 1);
      end;
    end;
  end
  else if sortType = 1 then
  begin
    while i < Length(doubleArr) do
    begin
      arrIndex := GetMinDoubleIndex(doubleArr);
      //deviceManageWith.Add(deviceManage.Items[arrIndex].IdStr);
      if curWithArrIndex < Length(devIdArrWith) then
      begin
        devIdArrWith[curWithArrIndex] := deviceManage.Items[arrIndex].Id;
        Inc(curWithArrIndex)
      end;

      deviceManage.Delete(deviceManage.Items[arrIndex].id);
      if arrIndex = Length(doubleArr) - 1 then
      begin//最近的刚好是最后一个
        SetLength(doubleArr, Length(doubleArr) - 1);
      end
      else
      begin//不是最后一个，将这个元素之后的数据向之前拷贝，并减小数组长度
        CopyMemory(@doubleArr[arrIndex], @doubleArr[arrIndex + 1], (Length(doubleArr) - arrIndex - 1) * 8);
        SetLength(doubleArr, Length(doubleArr) - 1);
      end;
    end;
  end;
end;

procedure TSendOrderMiniFrm.saveReservedOrder(SendStr: string);
var
  order: TOrder;
  curPassenger: TPassenger;
  OrderDateTime_V2: TDateTime_V2;
begin
  Order := Torder.Create;
  Order.OderType := 1;
  Order.OderDateTime := EncodeDateTime(Yearof(DateTimePickerDate.Date),
                                      MonthOf(DateTimePickerDate.Date),
                                      Dayof(DateTimePickerDate.Date),
                                      Hourof(DateTimePickerTime.Time),
                                      MinuteOf(DateTimePickerTime.Time),
                                      SecondOf(DateTimePickerTime.Time), 0);
  OrderDateTime_V2[0] := StrToInt('$'+IntToStr(YearOf(DateTimePickerDate.Date) - 2000));
  OrderDateTime_V2[1] := StrToInt('$'+IntToStr(MonthOf(DateTimePickerDate.Date)));
  OrderDateTime_V2[2] := StrToInt('$'+IntToStr(DayOf(DateTimePickerDate.Date)));
  OrderDateTime_V2[3] := StrToInt('$'+IntToStr(HourOf(DateTimePickerTime.Time)));
  OrderDateTime_V2[4] := StrToInt('$'+IntToStr(MinuteOf(DateTimePickerTime.Time)));
  OrderDateTime_V2[5] := StrToInt('$'+IntToStr(SecondOf(DateTimePickerTime.Time)));
  Order.OrderDateTime_V2 := OrderDateTime_V2;
  Order.OderDate := dateof(DateTimePickerDate.Date);
  Order.OderTime := timeof(DateTimePickerTime.Time);
  Order.CustomerTel := EditCustomTel.Text;
  Order.OrderContent := EditAddress.Text; //Memo1.Text;
  Order.OrderDetailContent := SendStr; //Memo2.Text;
  Order.OperationUser := current_user.id;
  Order.State := 100;//表示预约状态下的未发的订单
  Order.NameOfCustom := EditName.Text;
  Order.SexOfCustom := ComboBoxName.ItemIndex;
  Order.AddressOfCustom := EditAddress.Text;
  Order.AddressQuery := ComboBoxAddress.Text;

  //如果passengerManage里没有当前电话乘客的信息则将其存库，如果已经有则更新信息，最后再将其加入当前乘客信息管理器
  curPassenger := PassengerManage.GetPassenger(Trim(EditCustomTel.Text));
  if curPassenger = nil then
  begin
    curPassenger := TPassenger.Create;
    curPassenger.FamilyName := EditName.Text;
    curPassenger.Gender := ComboBoxName.ItemIndex;
    curPassenger.Address := EditAddress.Text;
    curPassenger.Phone := Trim(EditCustomTel.Text);
    curPassenger.LastOrderTime := Now;
    curPassenger.PassengerId := Bs.addPassengerInfo(curPassenger);
  end
  else
  begin
    curPassenger.FamilyName := EditName.Text;
    curPassenger.Gender := ComboBoxName.ItemIndex;
    curPassenger.Address := EditAddress.Text;
    curPassenger.LastOrderTime := Now;
    Bs.updatePassengerInfo(curPassenger);
  end;

  if curPassenger.PassengerId < 0 then
  begin
    curPassenger.Free;
    curPassenger := nil;
    Exit;
  end;

  Order.PassengerId := curPassenger.PassengerId;

  Order.SaveToDataBase; //保存数据库...
  if order.ID < 0 then
  begin
    order.Free;
    exit;
  end;
  AOrderManage.AddOder(Order);
end;

procedure TSendOrderMiniFrm.DateTimePickerDateExit(Sender: TObject);
var
  orderDateTime: TDateTime;
begin
  orderDateTime := EncodeDateTime(Yearof(DateTimePickerDate.Date),
                                        MonthOf(DateTimePickerDate.Date),
                                        Dayof(DateTimePickerDate.Date),
                                        Hourof(DateTimePickerTime.Time),
                                        MinuteOf(DateTimePickerTime.Time),
                                        SecondOf(DateTimePickerTime.Time), 0);
  if (ComboBoxType.ItemIndex = 1) and (IncMinute(Now, 30) > orderDateTime) then
  begin
    MessageBox(Handle, '预约订单需提前30分钟以上，请重新选择时间或订单类型!', '提示', MB_OK + MB_ICONINFORMATION);
    DateTimePickerDate.SetFocus;
    Exit;
  end;
end;

procedure TSendOrderMiniFrm.DateTimePickerTimeExit(Sender: TObject);
var
  orderDateTime: TDateTime;
begin
  orderDateTime := EncodeDateTime(Yearof(DateTimePickerDate.Date),
                                        MonthOf(DateTimePickerDate.Date),
                                        Dayof(DateTimePickerDate.Date),
                                        Hourof(DateTimePickerTime.Time),
                                        MinuteOf(DateTimePickerTime.Time),
                                        SecondOf(DateTimePickerTime.Time), 0);
  if (ComboBoxType.ItemIndex = 1) and (IncMinute(Now, 30) > orderDateTime) then
  begin
    MessageBox(Handle, '预约订单需提前30分钟以上，请重新选择时间或订单类型!', '提示', MB_OK + MB_ICONINFORMATION);
    DateTimePickerTime.SetFocus;
    Exit;
  end;
end;

function TSendOrderMiniFrm.GetDistance(const StartLat, StartLong, EndLat,
  EndLong: Double): Double;
var
  fPhimean: Double;
  fdLambda: Double;
  fdPhi: Double;
  fAlpha: Double;
  fRho: Double;
  fNu: Double;
  fR: Double;
  fz: Double;
  fTemp: Double;
  Distance: Double;
  Bearing: Double;
const
  D2R: Double = 0.017453;
  R2D: Double = 57.295781;
  a: Double = 6378137.0;
  b: Double = 6356752.314245;
  e2: Double = 0.006739496742337;
  f: Double = 0.003352810664747;   
begin
  fdLambda := (StartLong - EndLong) * D2R;
  fdPhi := (StartLat - EndLat) * D2R;
  fPhimean := ((StartLat + EndLat) / 2.0) * D2R;
  fTemp := 1 - e2 * (Power(Sin(fPhimean),2));
  fRho := (a * (1 - e2)) / Power(fTemp, 1.5);
  fNu := a / (Sqrt(1 - e2 * (Sin(fPhimean) * Sin(fPhimean))));
  fz := Sqrt(Power(Sin(fdPhi/2.0),2)+Cos(EndLat*D2R)*Cos(StartLat*D2R)*Power(Sin(fdLambda/2.0),2)) ;
  fz := 2 * ArcSin(fz);
  fAlpha := Cos(EndLat * D2R) * Sin(fdLambda) * 1 / Sin(fz);
  fAlpha := ArcSin(fAlpha);
  fR := (fRho * fNu) / ((fRho * Power(Sin(fAlpha),2)) + (fNu * Power(Cos(fAlpha),2)));
  Distance := (fz * fR);
  if((StartLat < EndLat) and (StartLong < EndLong)) then
    Bearing := Abs(fAlpha * R2D)
  else if ((StartLat < EndLat) and (StartLong > EndLong)) then
    Bearing := 360 - Abs(fAlpha * R2D)
  else if ((StartLat > EndLat) and (StartLong > EndLong)) then
    Bearing := 180 + Abs(fAlpha * R2D)
  else if ((StartLat > EndLat) and (StartLong < EndLong)) then
    Bearing := 180 - Abs(fAlpha * R2D);

  Result := Distance / 1000;      //km
end;           

end.
