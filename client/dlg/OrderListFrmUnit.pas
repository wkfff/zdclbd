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
      0: Result := '��ʱ����';
      1: Result := 'ԤԼ����';
      2: Result := '���ٶ���';
    end;
  end;
  function ReturnState(State:byte):String;
  begin
    Result:='';
    case State of
      ORDERSTATE_NODEVANSWER_DEL: Result:='�����Զ�ɾ��';
      ORDERSTATE_WAITGRAB: Result:='�ȴ�˾������';
      ORDERSTATE_DEVGRAB : Result:='����˾������';
      ORDERSTATE_SENDINGDEVGRABOK: Result:='�����·���˾�������ɹ�';
      ORDERSTATE_SENDDEVGRABOK_FAIL: Result:='����ʧ��';
      ORDERSTATE_DEVGRABOK: Result:='�����ɹ�';
      ORDERSTATE_SRVCANCEL: Result:='����ȡ������';
      ORDERSTATE_DEVCANCEL: Result:='˾��ȡ������';
      ORDERSTATE_FINISH: Result := '���';
      10:Result:='�ȴ���...';
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
          0: Result := '�¹�';
          1: Result := '�³�';
          2: Result := '����';
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
