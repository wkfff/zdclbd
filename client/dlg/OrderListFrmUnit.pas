unit OrderListFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit, ExtCtrls,
  cxInplaceContainer, cxControls, cxCalendar, ImgList;

type
  TOrderListFrm = class(TForm)
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
  private
    function FindDevice(DevID: integer): String;

    { Private declarations }
  public
    procedure RefreshOrderList;
    { Public declarations }
  end;

var
  OrderListFrm: TOrderListFrm;

implementation
uses Orderunit,uGloabVar,CarUnit,DateUtils,ConstDefineUnit,uFrmSelectDevs, umainf;
{$R *.dfm}
procedure TOrderListFrm.RefreshOrderList;
 function OrderTypeToStr(OrderType:byte):string;
  begin
    case OrderType of
      0: Result := '即时订单';
      1: Result := '预约订单';
      2: Result := '急召订单';
    end;
  end;
  function ReturnState(State:byte):String;
  begin
    Result:='';
    case State of
      ORDERSTATE_NODEVANSWER_DEL: Result:='中心自动删除';
      ORDERSTATE_WAITGRAB: Result:='等待司机抢单';
      ORDERSTATE_DEVGRAB : Result:='已有司机抢单';
      ORDERSTATE_SENDINGDEVGRABOK: Result:='正在下发给司机抢单成功';
      ORDERSTATE_SENDDEVGRABOK_FAIL: Result:='抢单失败';
      ORDERSTATE_DEVGRABOK: Result:='抢单成功';
      ORDERSTATE_SRVCANCEL: Result:='中心取消订单';
      ORDERSTATE_DEVCANCEL: Result:='司机取消订单';
      ORDERSTATE_FINISH: Result := '完成';
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
      case Order.CancelReasonID of
          0: Result := '事故';
          1: Result := '堵车';
          2: Result := '其他';
          else
            Result := '';
      end;
      //Result:=Dev.FindCancelOrderMenu(Order.CancelReasonID).Name;
    end;
  end;
var
  i:integer;
begin
  try
    if AOrderManage.isModified  then
    begin
      cxOrderList.Clear;
      for i:=AOrderManage.Count-1 downto 0 do
      begin
        if AOrderManage.Item[i].State <> 100 then
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
        Application.ProcessMessages;
      end;
      AOrderManage.isModified:=false;
      cxOrderList.Sorted:=true;
      cxOrderList.SortedColumns[0].SortOrder:=soDescending;
    end;
  except  on E: Exception do
    uGloabVar.SystemLog.AddLog('TOrderListFrm.RefreshOrderList',e.Message);
  end;
end;


function TOrderListFrm.FindDevice(DevID:integer):String;
var
  Dev:TDevice; 
begin
  //Result:=ACarNOManage.GetCarNO(DevID);

  Result:='';
  Dev:= ADeviceManage.Find(DevID);
  if Dev <>nil then
  begin
   Result:=Dev.Car.No;
  end;
end;


end.
