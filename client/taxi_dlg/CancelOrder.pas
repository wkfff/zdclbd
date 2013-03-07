unit CancelOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, cxGraphics, cxCustomData,
  cxStyles, cxTL, cxTextEdit, cxInplaceContainer, cxControls, uGloabVar,
  OrderUnit, DateUtils, CarUnit, ConstDefineUnit, cxSplitter;

type
  TfrmCancelOrder = class(TForm)
    Panel7: TPanel;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    TreeView1: TTreeView;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel6: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtPassengerPhone: TEdit;
    dtpDate: TDateTimePicker;
    dtpTime: TDateTimePicker;
    btnFindOrderInfo: TBitBtn;
    Panel3: TPanel;
    Panel5: TPanel;
    Label7: TLabel;
    listViewOrderInfo: TListView;
    Panel4: TPanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    cxSplitter1: TcxSplitter;
    cxSplitter2: TcxSplitter;
    edtCarNo: TComboBox;
    SpeedButton4: TSpeedButton;
    PanelSelectGroupName: TPanel;
    procedure btnOkClick(Sender: TObject);
    procedure btnFindOrderInfoClick(Sender: TObject);
    procedure edtPassengerPhoneExit(Sender: TObject);
    procedure edtPassengerPhoneKeyPress(Sender: TObject; var Key: Char);
    procedure dtpDateKeyPress(Sender: TObject; var Key: Char);
    procedure dtpTimeKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure listViewOrderInfoDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FSelectedOrderList: TStringList;
    procedure RefreshSelOrderLabel;
    function GetCarNo(devId: Integer): string;
    procedure CancelOrderByPassenger;
    procedure AddSystemLog(const strLog: string);
    procedure AddDev(id: integer; ANode: TTreeNode);
  public
    { Public declarations }
  end;

var
  frmCancelOrder: TfrmCancelOrder;
  CarNo: string;
  group_id: integer = -1;
  group_paranet: string = '';
  fact_id: Integer = -1;
  dev_id: Integer = -1;
implementation

{$R *.dfm}

procedure TfrmCancelOrder.btnOkClick(Sender: TObject);
  function GetOrderId: string;
  var
    i: Integer;
  begin
    Result := '';
    for i := 0 to FSelectedOrderList.Count - 1 do
    begin
      if i = 0 then
        Result := Result + FSelectedOrderList.Strings[i]
      else
        Result := Result + '��' + FSelectedOrderList.Strings[i];
    end;
  end;
var
  i: Integer;
  msg: string;
begin
  if listViewOrderInfo.Items.Count < 1 then
  begin
    MessageBox(Handle, 'û�пɹ�ȡ���Ķ�������ȷ��!', '��ʾ', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  if FSelectedOrderList.Count < 1 then
  begin
    MessageBox(Handle, 'û��ѡ����Ҫȡ���Ķ�������ȷ��!', '��ʾ', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  msg := '��ȷ��ȡ��������Ϊ' + GetOrderId + '�Ķ�����';
  if MessageBox(Handle, PChar(msg), 'ȷ��ȡ������', MB_OKCANCEL + MB_ICONQUESTION) = IDOK then
  begin
    CancelOrderByPassenger;
    Close;
  end;  
end;

procedure TfrmCancelOrder.btnFindOrderInfoClick(Sender: TObject);
var
  i, j: Integer;
  aOrder: TOrder;
  orderTime: TDateTime;
  orderCarNo: string;
begin
  listViewOrderInfo.Items.Clear;
  j := 0;
  listViewOrderInfo.Items.BeginUpdate;
  for i := 0 to AOrderManage.Count - 1 do
  begin
    aOrder := AOrderManage.Item[i];
    if Trim(edtPassengerPhone.Text) <> '' then
    begin
      if Pos(Trim(edtPassengerPhone.Text), aOrder.CustomerTel) <= 0 then
        Continue;
    end;
    {if Trim(edtPassengerName.Text) <> '' then
    begin
      if Pos(Trim(edtPassengerName.Text), aOrder.NameOfCustom) <= 0 then
        Continue;
    end;}
    if Trim(edtCarNo.Text) <> '' then
    begin
      orderCarNo := GetCarNo(aOrder.SucceedDevID);
      if Pos(Trim(edtCarNo.Text), orderCarNo) <=0 then
        Continue;
    end;
    orderTime := EncodeDateTime(YearOf(dtpDate.Date), MonthOf(dtpDate.Date), DayOf(dtpDate.Date),
                                HourOf(dtpTime.Time), MinuteOf(dtpTime.Time), SecondOf(dtpTime.Time), 0);
    if not ((IncMinute(orderTime, -30) <= aOrder.SendDatetime) and (aOrder.SendDatetime <= IncMinute(orderTime, 30))) then
      Continue;
    with listViewOrderInfo.Items.Add do
    begin
      Data := @aOrder;
      Caption := IntToStr(j + 1);
      SubItems.Add(IntToStr(aOrder.ID));
      case aOrder.State of
        ORDERSTATE_NODEVANSWER_DEL:
          SubItems.Add('������ɾ��');
        ORDERSTATE_WAITGRAB:
          SubItems.Add('�ȴ�˾������');
        ORDERSTATE_DEVGRAB :
          SubItems.Add('����˾������');
        ORDERSTATE_SENDINGDEVGRABOK:
         SubItems.Add('�����·���˾�������ɹ�');
        ORDERSTATE_DEVGRABOK:
          SubItems.Add('˾�������ɹ�');
        ORDERSTATE_SENDDEVGRABOK_FAIL:
          SubItems.Add('����ʧ��');
        ORDERSTATE_SRVCANCEL:
          SubItems.Add('������ȡ��');
        ORDERSTATE_DEVCANCEL:
          SubItems.Add('˾��ȡ��');
        ORDERSTATE_FINISH:
          SubItems.Add('���');
      else
        SubItems.Add('�ȴ���...');
      end;
      SubItems.Add(aOrder.CustomerTel);
      SubItems.Add(aOrder.NameOfCustom);
      SubItems.Add(GetCarNo(aOrder.SucceedDevID));
      SubItems.Add(FormatDateTime('yyyy-MM-dd hh:nn:ss', aOrder.SendDatetime));
      SubItems.Add(aOrder.OrderContent);
      SubItems.Add(aOrder.OrderDetailContent);
    end;
    j := j + 1;
  end;
  listViewOrderInfo.Items.EndUpdate;
end;

procedure TfrmCancelOrder.edtPassengerPhoneExit(Sender: TObject);
begin
  btnFindOrderInfo.Click;  
end;

procedure TfrmCancelOrder.edtPassengerPhoneKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
    edtCarNo.SetFocus;

  if not (Key in [#8,'0'..'9','-',#22]) then
    Key := #0;
end;

procedure TfrmCancelOrder.dtpDateKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    dtpTime.SetFocus;
end;

procedure TfrmCancelOrder.dtpTimeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnFindOrderInfo.SetFocus;
end;

procedure TfrmCancelOrder.FormCreate(Sender: TObject);
     function ListSon(ASonId:integer;Anode:TTreeNode;leastCnt:integer):integer;
    var
      grp       : TDevGroup;
      leaf_node : TTreeNode;
      j,sonId   : integer;
    begin
      grp:= ADevGroupManage.Find(AsonId);
      leaf_node :=  treeview1.Items.AddChild(
          Anode,grp.name+'('+inttostr(grp.DevListCount)+')');
      leaf_node.Data := pointer(grp.Id);
      leastCnt := leastCnt -1;
      result:=leastCnt;
      if leastCnt =0 then exit;

      if not grp.leaf_nod then
        for j:= 0 to grp.SonListCount -1 do
        begin
          sonId := grp.SonList[j];
          ListSon(sonId,leaf_node,leastCnt);
        end;       
    end;
    procedure group_list(AParant_ID:integer;Anode:TTreenode;Acurrent_cnt:integer);
      var
        i,j:integer;
        sonId: integer;           //�Ӽ��� ��ID
        leaf_node: TTreenode;     //�Ӽ��Ľڵ�
        grp : TDevGroup;
      begin
        for i:= 0 to ADevGroupManage.Count -1 do
        begin
          if Acurrent_cnt =0 then exit;
          grp :=ADevGroupManage.Items[i];
          //�г�����--��Ϊ0
          if grp.parent =AParant_ID then
          begin
            leaf_node :=  treeview1.Items.AddChild(
              Anode,grp.name+'('+inttostr(grp.DevListCount)+')');
            leaf_node.Data := pointer(grp.Id);
            Acurrent_cnt := Acurrent_cnt -1;
            if Acurrent_cnt =0 then exit;

            if not grp.leaf_nod then
              for j:= 0 to grp.SonListCount -1 do
              begin
                sonId := grp.SonList[j];
                Acurrent_cnt := ListSon(sonId,leaf_node,Acurrent_cnt);
              end;
          end;
        end;
      end;
var
  vn_node: TTreeNode;
  cnt: integer;
begin
  TreeView1.AutoExpand := true;
  TreeView1.Items.Clear;
  if ADevGroupManage.Count = 0 then exit;
  vn_node := TreeView1.Items.add(TreeView1.topitem, '���г���');
  vn_node.Data := Pointer(-1); //���г���
  vn_node.Expanded := true;
  cnt := ADevGroupManage.Count;
  group_list(0,vn_node,cnt);
  
  edtPassengerPhone.Text := '';
  //edtPassengerName.Text := '';
  edtCarNo.Text := '';
  dtpDate.Date := DateOf(Now);
  dtpTime.Time := TimeOf(Now);

  FSelectedOrderList := TStringList.Create;
  FSelectedOrderList.Sorted := True;
end;

//˫��ѡ���ȡ��ѡ�ж���
procedure TfrmCancelOrder.listViewOrderInfoDblClick(Sender: TObject);
var
  i: Integer;
  count: Integer;
  order: TOrder;
begin
  if listViewOrderInfo.Selected = nil then exit;
  order := AOrderManage.Find(StrToInt(listViewOrderInfo.Selected.SubItems.Strings[0]));
  case order.State of
    ORDERSTATE_NODEVANSWER_DEL:
    begin
      messagebox(handle,'�˶����ѱ�����ɾ��,����ȡ��!','��ʾ',mb_ok + mb_iconinformation);
      exit;
    end;
    ORDERSTATE_SENDDEVGRABOK_FAIL:
    begin
      messagebox(handle,'�˶�������ʧ��,����ȡ��!','��ʾ',mb_ok + mb_iconinformation);
      exit;
    end;
    ORDERSTATE_SRVCANCEL:
    begin
      messagebox(handle,'�����Ѿ�ȡ���˶���!','��ʾ',mb_ok + mb_iconinformation);
      exit;
    end;
    ORDERSTATE_DEVCANCEL:                         
    begin
      messagebox(handle,'˾���Ѿ�ȡ���˶���!','��ʾ',mb_ok + mb_iconinformation);
      exit;
    end;
    ORDERSTATE_FINISH:
    begin
      MessageBox(Handle, '�˶����Ѿ���ɣ�', '��ʾ', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
  end;
  if Order.OderDateTime<now then
  begin
    messagebox(handle,'�����ѹ���,����ȡ��!','��ʾ',mb_ok + mb_iconinformation);
    exit;
  end;

  count := FSelectedOrderList.Count;
  i := FSelectedOrderList.IndexOf(listViewOrderInfo.Selected.SubItems.Strings[0]);
  if i >= 0 then
  begin
    FSelectedOrderList.Delete(i);
  end
  else
  begin
    FSelectedOrderList.Add(listViewOrderInfo.Selected.SubItems.Strings[0]);
  end;
  if count <> FSelectedOrderList.Count then
  begin
    RefreshSelOrderLabel;
  end;
end;

procedure TfrmCancelOrder.RefreshSelOrderLabel;
var
  i: Integer;
begin
  Label7.Caption := '��ѡ�еĴ�ȡ�������Ķ����ţ�';
  for i := 0 to FSelectedOrderList.Count - 1 do
  begin
    if i = 0 then
      Label7.Caption := Label7.Caption + FSelectedOrderList.Strings[i]
    else
      Label7.Caption := Label7.Caption + '��' + FSelectedOrderList.Strings[i];
  end;
end;

procedure TfrmCancelOrder.FormDestroy(Sender: TObject);
begin
  FSelectedOrderList.Free;
end;

function TfrmCancelOrder.GetCarNo(devId: Integer): string;
var
  dev: TDevice;
begin
  Result := '';
  dev := ADeviceManage.find(devId);
  if dev <> nil then
  begin
    Result := dev.Car.No;
  end;  
end;

procedure TfrmCancelOrder.CancelOrderByPassenger;
var
  i: Integer;
  orderId: Integer;
begin
  for i := 0 to FSelectedOrderList.Count - 1 do
  begin
    try
      orderId := StrToInt(FSelectedOrderList.Strings[i]);
      DataServer.CancelOrder_V3(orderId);
    except
      on E: Exception do
      begin
        AddSystemLog('CancelOrderByPassenger��ѭ�������쳣:' + E.Message);
      end;
    end;
  end;
end;

procedure TfrmCancelOrder.AddSystemLog(const strLog: string);
begin
  if Trim(strLog) <> '' then
  begin
    uGloabVar.SystemLog.AddLog(FormatDateTime('hh:nn:ss', Now) + ' ' + strLog);
  end;  
end;

procedure TfrmCancelOrder.AddDev(id: integer; ANode: TTreeNode);
var
  i: integer;
  dev: TDevice;
begin
  try
    //ComboBox2.Items.Clear;
    edtCarNo.ItemIndex := -1;

    for i := 0 to ADeviceManage.Count - 1 do
    begin
      dev := ADeviceManage.Items[i];
      if dev = nil then Continue;
      if dev.GroupID= id then
      begin
        edtCarNo.Items.AddObject(dev.Car.No,dev);
      end;
    end;
  finally
  end;
end;

procedure TfrmCancelOrder.TreeView1Click(Sender: TObject);
var
  grpId : integer;
  devGrp: TDevGroup;
  Node: TTreeNode;
  i: Integer;
begin
  Node := TreeView1.Selected;
  if Node = nil then exit;
  grpId := Integer(Node.Data);
  PanelSelectGroupName.Caption := Node.Text;
  if grpId = -1 then
  begin
    group_id := grpId;
  end;
  if grpId = -2 then
  begin
    Exit;
  end;
  edtCarNo.Clear;
  if (grpId >=0) then //and (not IsClickDev) and (grpId <> clickParent) then
  begin
    AddDev(grpId, Node);

    devGrp := ADevGroupManage.find(grpId);
    if not devGrp.leaf_nod then //==  ˵�����ڵ�
    begin
      if devGrp.SonList.Count > 0 then
      begin

        for i := 0 to devGrp.SonList.Count - 1 do
        begin
          AddDev(devgrp.SonListItems[i], Node);
          if i = 0 then
            group_paranet := inttostr(devgrp.SonListItems[i])
          else
            group_paranet := group_paranet + ',' + inttostr(devgrp.SonListItems[i]);
        end;
      end
      else
        group_paranet:='';
    end
    else
    begin
       group_id := grpId;
       group_paranet := '';
    end;
  end;
end;

procedure TfrmCancelOrder.SpeedButton4Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmCancelOrder.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ManualDock(nil);
end;

procedure TfrmCancelOrder.FormShow(Sender: TObject);
begin
  FSelectedOrderList.Clear;
  Label7.Caption := '��ѡ�еĴ�ȡ�������Ķ����ţ�';
end;

end.
