unit SendOrderFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxInplaceContainer, cxControls, StdCtrls, Buttons, ComCtrls, cxCalendar,
  ImgList,Orderunit;

type
  TSendOrderFrm = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel7: TPanel;
    Panel5: TPanel;
    cxOrderList: TcxTreeList;
    cxOrderID: TcxTreeListColumn;
    BitBtnRecord: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtnClose: TBitBtn;
    cxOrderType: TcxTreeListColumn;
    cxOrderDateTime: TcxTreeListColumn;
    cxOrderCustomTel: TcxTreeListColumn;
    cxOrderOKCarNO: TcxTreeListColumn;
    cxOrderState: TcxTreeListColumn;
    BitBtnCancel: TBitBtn;
    cxOrderContent: TcxTreeListColumn;
    cxOrderSendDateTime: TcxTreeListColumn;
    ListView1: TListView;
    GroupBox4: TGroupBox;
    Memo1: TMemo;
    Memo2: TMemo;
    Panel6: TPanel;
    RadioGroupOrderType: TRadioGroup;
    GroupBox2: TGroupBox;
    DateTimePickerTime: TDateTimePicker;
    DateTimePickerDate: TDateTimePicker;
    GroupBox3: TGroupBox;
    EditCustomTel: TEdit;
    GroupBox1: TGroupBox;
    EditOrderID: TEdit;
    GroupBox5: TGroupBox;
    EditOKCarNO: TEdit;
    Timer1: TTimer;
    Panel8: TPanel;
    BitBtn4: TBitBtn;
    BitBtnSel: TBitBtn;
    cxOrderDetailContent: TcxTreeListColumn;
    cxCancelOrderReason: TcxTreeListColumn;
    cxOrderCancelTime: TcxTreeListColumn;
    ImageList3: TImageList;
    GroupBox6: TGroupBox;
    EditState: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnRecordClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure cxOrderListClick(Sender: TObject);
    procedure BitBtnCancelClick(Sender: TObject);
    procedure EditCustomTelKeyPress(Sender: TObject; var Key: Char);
    procedure RadioGroupOrderTypeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtnSelClick(Sender: TObject);
  private
    function FindDevice(DevID: integer): String;
    function ReturnState(State: byte): String;
    { Private declarations }
  public
    Procedure ShowOrder(Order:TOrder);

    { Public declarations }
  end;

var
  SendOrderFrm: TSendOrderFrm;

implementation
   uses uGloabVar,CarUnit,DateUtils,ConstDefineUnit,uFrmSelectDevs;
{$R *.dfm}

procedure TSendOrderFrm.FormCreate(Sender: TObject);
begin
  Panel5.Visible:=false;
  Self.Height:=self.Height-Panel5.Height;
  DateTimePickerDate.Date:=Date;
  DateTimePickerTime.Time:=IncMinute(Time,20);;
  Memo1.Text:='';
  Memo2.Text:='';
  EditOrderID.Text:='';
  EditOKCarNO.Text:='';
  EditCustomTel.Text:='';
  editState.Text:='';
  Panel3.Align:=alBottom;
  Panel2.Align:=alClient;
end;

procedure TSendOrderFrm.BitBtnRecordClick(Sender: TObject);
begin
  Panel5.Visible:=not Panel5.Visible;
  if Panel5.Visible then
  begin
    Panel2.Align:=alTop;
    Panel3.Align:=alTop;
    self.Height:=self.Height+150;
    
  end
  else
  begin
    self.Height:=self.Height-Panel5.Height;
    Panel3.Align:=alBottom;
    Panel2.Align:=alClient;
  end;
end;

procedure TSendOrderFrm.BitBtn2Click(Sender: TObject);
var
  Order:TOrder;
  i:integer;
  Dev:TDevice;
begin
  bitbtn2.Enabled:=false;
try
  if memo1.Text ='' then
  begin
    messagebox(handle,'请输入订单内容!','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  if Listview1.Items.Count = 0 then
  begin
    messagebox(handle,'请选择发往的车辆!','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  i:=0;
  
  while i< ListView1.Items.Count do
  begin
    Dev:=ADeviceManage.Find(ACarNoManage.GetDevID(ListView1.Items.Item[i].Caption));
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
    else
    begin
      ListView1.Items.Item[i].Data:=Pointer(Dev);
      inc(i);
    end;
  end;
  
  if Memo2.Text ='' then memo2.Text:=memo1.Text;
  Order:=Torder.Create;
  RadioGroupOrderTypeClick(nil);
  Order.OderType:=RadioGroupOrderType.ItemIndex;
  Order.OderDateTime:=EncodeDateTime(Yearof(DateTimePickerDate.Date),
                                     MonthOf(DateTimePickerDate.Date),
                                     Dayof(DateTimePickerDate.Date),
                                     Hourof(DateTimePickerTime.Time),
                                     MinuteOf(DateTimePickerTime.Time),
                                     SecondOf(DateTimePickerTime.Time),0);
  Order.OderDate:=dateof(DateTimePickerDate.Date);
  Order.OderTime:=timeof(DateTimePickerTime.Time);
  Order.CustomerTel:=EditCustomTel.Text;
  Order.OrderContent:=Memo1.Text;
  Order.OrderDetailContent:=Memo2.Text;
  Order.OperationUser:=current_user.id;
  Order.State:=10;
  if (IncMinute(Order.OderDateTime,-10)<now)and(RadioGroupOrderType.ItemIndex=1) then
  begin
    order.Free;
    messagebox(handle,'预约时必须在十分钟以后,如果十分钟内请选择即时订单!','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  i:=0;
  while ListView1.Items.Count>i do
  begin
   if ListView1.Items.Item[i].Data <> nil then
   begin
     Order.AddSendDevID(TDevice(ListView1.Items.Item[i].Data));
     inc(i);
   end
   else
   begin
    if messagebox(handle,PChar('您没有权限操作'+ListView1.Items.Item[i].Caption+'车,是否发送?'),
       '提示',MB_OKCANCEL + MB_ICONQUESTION)= ID_CANCEL then exit;
    ListView1.Items.Item[i].Delete;
   end;
  end;

  Order.SaveToDataBase;
 if order.ID  <0 then
 begin
   order.Free;
   exit;
 end;
 EditOrderID.Text:=IntToStr(Order.ID);
 AOrderManage.AddOder(Order);
 DataServer.SendOrder(Order);
 Close;
finally
  bitbtn2.Enabled:=true;
end;

end;
function TSendOrderFrm.ReturnState(State:byte):String;
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
  ORDERSTATE_DEVCANCEL: Result:='司机取消订单';
  10:Result:='等待中...';
 end;
end;
procedure TSendOrderFrm.Timer1Timer(Sender: TObject);
function OrderTypeToStr(OrderType:byte):string;
begin
  case OrderType of
   0:Result:='即时订单';
   1:Result:='预约订单';
   end;
end;
function FindCancelReasonName(Order:TOrder):String;
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

var
  i:integer;
begin
  if AOrderManage.isModifiedSendList  then
  begin
     cxOrderList.Clear;
     for i:=AOrderManage.Count-1 downto 0 do
     begin

       with  cxOrderList.Add do
       begin
         Data:=Pointer(AOrderManage.Item[i]);
         Values[0]:=AOrderManage.Item[i].ID;
         Values[1]:=OrderTypeToStr(AOrderManage.Item[i].OderType) ;
         Values[2]:=AOrderManage.Item[i].OderDateTime;
         Values[3]:=AOrderManage.Item[i].SendDatetime;
         Values[4]:=ReturnState(AOrderManage.Item[i].State);
         Values[5]:=AOrderManage.Item[i].CustomerTel ;
         Values[6]:=FindDevice(AOrderManage.Item[i].SucceedDevID);
         Values[7]:=AOrderManage.Item[i].OrderContent;
         Values[8]:=AOrderManage.Item[i].OrderDetailContent;
         Values[9]:=FindCancelReasonName(AOrderManage.Item[i]);
         if AOrderManage.Item[i].CancelDatetime<>0 then
           Values[10]:=AOrderManage.Item[i].CancelDatetime;
         StateIndex:=AOrderManage.Item[i].State;
       end;
     end;
    AOrderManage.isModifiedSendList:=false;
    cxOrderList.Sorted:=true;
    cxOrderList.SortedColumns[0].SortOrder:=soDescending;
  end;
end;

function TSendOrderFrm.FindDevice(DevID:integer):String;
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

procedure TSendOrderFrm.cxOrderListClick(Sender: TObject);
var
  Order:TOrder;
begin
   if cxOrderList.FocusedNode<>nil then
   begin
      Order:=TOrder(cxOrderList.FocusedNode.Data);
      ShowOrder(Order);
   end;
end;

procedure TSendOrderFrm.BitBtnCancelClick(Sender: TObject);
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

  if messagebox(handle,PChar('是否确定取消订单号:'+EditOrderID.Text+#13#10+Memo1.Text),
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

procedure TSendOrderFrm.EditCustomTelKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (Key in [#8,'0'..'9','-',#22]) then Key := #0;
end;

procedure TSendOrderFrm.RadioGroupOrderTypeClick(Sender: TObject);
begin
  if RadioGroupOrderType.ItemIndex=0 then
  begin
    GroupBox2.Enabled:=false;
    DateTimePickerDate.Date:=Date;
    DateTimePickerDate.Color:=clBtnFace;
    DateTimePickertime.Time:=IncMinute(Time,10);
  end
  else
  begin
    DateTimePickerDate.Color:=clWindow;
    if Sender <>nil then 
      DateTimePickertime.Time:=IncMinute(Time,20);
    GroupBox2.Enabled:=true;
  end;
  DateTimePickertime.Color:=DateTimePickerDate.Color
end;

procedure TSendOrderFrm.FormShow(Sender: TObject);
begin
   EditCustomTel.SetFocus;
end;

procedure TSendOrderFrm.BitBtn4Click(Sender: TObject);
begin
 if ListView1.Selected <>nil then ListView1.Selected.Delete;
end;

procedure TSendOrderFrm.BitBtnSelClick(Sender: TObject);
var
  dlg: TFrmSelectDevs;
  i:integer;
  dev: Tdevice;
begin
  dlg:= TFrmSelectDevs.Create(nil);
  try
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



procedure TSendOrderFrm.ShowOrder(Order: TOrder);
var
 i:integer;
 s:String;
begin
      if Order = nil then exit;
      EditOrderID.Text:=intToStr(Order.ID);
      RadioGroupOrderType.ItemIndex:=Order.OderType;
      DateTimePickerDate.Date:=Order.OderDate;
      DateTimePickertime.Time:=Order.OderTime;
      EditCustomTel.Text:=Order.CustomerTel;
      Memo1.Text:=Order.OrderContent;
      Memo2.Text:=Order.OrderDetailContent;
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
end;

end.
