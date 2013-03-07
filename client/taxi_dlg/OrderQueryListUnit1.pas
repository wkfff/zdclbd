unit OrderQueryListUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxCalendar, cxInplaceContainer, cxControls,OrderUnit, ImgList, StdCtrls,
  Buttons;

type
  TOrderQueryListFrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    cxOrderList: TcxTreeList;
    cxOrderID: TcxTreeListColumn;
    cxOrderType: TcxTreeListColumn;
    cxOrderDateTime: TcxTreeListColumn;
    cxOrderSendDateTime: TcxTreeListColumn;
    cxOrderState: TcxTreeListColumn;
    cxOrderCustomTel: TcxTreeListColumn;
    cxOrderOKCarNO: TcxTreeListColumn;
    cxOrderContent: TcxTreeListColumn;
    cxOrderDetailContent: TcxTreeListColumn;
    cxCancelOrderReason: TcxTreeListColumn;
    cxOrderCancelTime: TcxTreeListColumn;
    ImageList3: TImageList;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Timer1: TTimer;
    BitBtn3: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure cxOrderListDblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    OrderManage:TOrderManage;
  private
    { Private declarations }
    procedure QueryOrder;
    procedure ShowOrderToList(AOrderManage:TOrderManage);
  public
    { Public declarations }
  end;

var
  OrderQueryListFrm: TOrderQueryListFrm;

implementation

{$R *.dfm}
    uses QueryOrdertjFrmUnit,uGloabVar,DateUtils,ConstDefineUnit,CarUnit,SendOrderFrmUnit;

{ TOrderQueryListFrm }

procedure TOrderQueryListFrm.FormCreate(Sender: TObject);
begin
 OrderManage:=TOrderManage.Create;
end;

procedure TOrderQueryListFrm.QueryOrder;
var
  frm: Tqueryordertjfrm;

  fromDate,toDate:TDateTime;
  atype,auser_id,devId:Integer;
  customTel : string;
begin
  frm:=Tqueryordertjfrm.Create(Self);
  try
    frm.ShowModal;
    if frm.ModalResult = mrOK then
    begin
       if frm.CheckBox1.Checked then
       begin
          fromDate := StrToDateTime(FormatDateTime('yyyy-mm-dd',frm.DateTimePicker1.Date)+' '+
                                   FormatDateTime('hh:mm:ss',frm.DateTimePicker2.Time));
          ToDate := StrToDateTime(FormatDateTime('yyyy-mm-dd',frm.DateTimePicker3.Date)+' '+
                                   FormatDateTime('hh:mm:ss',frm.DateTimePicker4.Time));
       end else
       begin
           fromDate := IncYear(now,-100);
           ToDate := IncYear(now,100);
       end;

       if frm.ComboBox1.Text<>'' then
          AType := frm.ComboBox1.ItemIndex
       else
          AType := -1;
       customTel :=frm.Edit1.Text;
       if frm.ComboBoxCarNO.Text<>'' then
          devId := ACarNOManage.GetDevID(Frm.ComboBoxCarNO.Text)
       else
          devID := 1;
       auser_id:=0;    
       if frm.RadioButton1.Checked then
           auser_id := current_user.id
       else if frm.RadioButton2.Checked then
           auser_id := 0;
        OrderManage.Clear;
        bs.QueryOrders(atype,fromdate,todate,customtel,devId,auser_id,OrderManage);
        timer1.Tag:=0;
    end
    else
      timer1.Tag:=1;

  finally
    frm.Free;
  end;

end;

procedure TOrderQueryListFrm.ShowOrderToList(AOrderManage:TOrderManage);
function OrderTypeToStr(OrderType:byte):string;
begin
  case OrderType of
   0:Result:='即时订单';
   1:Result:='预约订单';
   end;
end;
function ReturnState(State:byte):String;
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
     if timer1.Tag=1 then exit;
     if AOrderManage.Count=0 then
     begin
       MessageBox(Self.Handle,PChar('没有查到订单!'),PChar('提示'),mb_ok + mb_iconinformation);
       exit;
     end;
     if not AOrderManage.isModified then  exit;
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
         Values[6]:=ACarNOManage.GetCarNO(AOrderManage.Item[i].SucceedDevID);
         Values[7]:=AOrderManage.Item[i].OrderContent;
         Values[8]:=AOrderManage.Item[i].OrderDetailContent;
         Values[9]:=FindCancelReasonName(AOrderManage.Item[i]);
         if  AOrderManage.Item[i].CancelDatetime<>0 then
         Values[10]:=AOrderManage.Item[i].CancelDatetime;
         StateIndex:=AOrderManage.Item[i].State;
       end;
     end;
    AOrderManage.isModified:=false;
    cxOrderList.Sorted:=true;
    cxOrderList.SortedColumns[0].SortOrder:=soDescending;
end;

procedure TOrderQueryListFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   OrderManage.Free;
end;

procedure TOrderQueryListFrm.FormShow(Sender: TObject);
begin
  QueryOrder;
 if timer1.Tag =1 then
 begin
   timer1.Enabled:=true;
   exit;
 end;
  ShowOrderToList(OrderManage);
end;

procedure TOrderQueryListFrm.BitBtn2Click(Sender: TObject);
begin
  QueryOrder;
  ShowOrderToList(OrderManage);
end;

procedure TOrderQueryListFrm.cxOrderListDblClick(Sender: TObject);
var
 frm:  TSendOrderFrm;
begin
  if  cxOrderList.FocusedNode=nil then exit;
  frm:=TSendOrderFrm.Create(Self);
  try
   frm.ShowOrder(TOrder(cxOrderList.FocusedNode.Data));
   frm.BitBtnRecord.Visible:=false;
   frm.BitBtn2.Visible:=false;
   frm.BitBtnCancel.Visible:=false;
   frm.BitBtn4.Visible:=false;
   frm.BitBtnSel.Visible:=false;
   frm.Panel8.Visible:=false;
   frm.Caption:='订单查询';
   frm.Panel1.Caption:=frm.Caption;
   frm.ShowModal;
  finally
   frm.Free;
  end;
end;

procedure TOrderQueryListFrm.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TOrderQueryListFrm.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:=false;
  Close;
end;

procedure TOrderQueryListFrm.BitBtn3Click(Sender: TObject);
begin
  cxTreeListToCSVFile(cxOrderList);
end;

end.
