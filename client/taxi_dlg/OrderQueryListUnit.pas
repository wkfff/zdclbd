unit OrderQueryListUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxCalendar, cxInplaceContainer, cxControls,OrderUnit, ImgList, StdCtrls,
  Buttons, Grids, DBGridEh, DB,DBClient, ComCtrls;

type
  TOrderQueryListFrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
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
    Panel5: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cxOrderWhoSend: TcxTreeListColumn;
    DataSource1: TDataSource;
    DBGridEh1: TDBGridEh;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure cxOrderListDblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);

  private
    OrderManage:TOrderManage;
  private
    { Private declarations }
    procedure QueryOrder;
    procedure ShowOrderToList(AOrderManage:TOrderManage);
    procedure savegrid(grid:TDBGridEh;filename:string);
    procedure OrderGrid(dataSet:TClientDataset;orderField:string);
  public
    { Public declarations }
  end;

var
  OrderQueryListFrm: TOrderQueryListFrm;
  orderCount:integer;
  orderCountSucess:integer;
  orderDateSet:TClientDataSet;
implementation

{$R *.dfm}
    uses QueryOrdertjFrmUnit,uGloabVar,DateUtils,ConstDefineUnit,CarUnit,SendOrderFrmUnit,DBGridEhImpExp;

{ TOrderQueryListFrm }

procedure TOrderQueryListFrm.FormCreate(Sender: TObject);
begin
 OrderManage:=TOrderManage.Create;
 orderDateSet:= TClientDataSet.Create(nil);  
end;

procedure TOrderQueryListFrm.QueryOrder;
var
  frm: Tqueryordertjfrm;
  i:integer;
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
       if (frm.ComboBoxCarNO.Text<>'') and (ADeviceManage.FindDevFromCarNo(frm.ComboBoxCarNO.Text) <> nil) then
       begin
          //devId := ACarNOManage.GetDevID(Frm.ComboBoxCarNO.Text)
          devId := ADeviceManage.FindDevFromCarNo(frm.ComboBoxCarNO.Text).id;
       end
       else
          devID := 1;
       auser_id:=0;    
       if frm.RadioButton1.Checked then
           auser_id := current_user.id
       else if frm.RadioButton2.Checked then
           auser_id := 0;
        OrderManage.Clear;
      if not frm.CheckBox2.Checked then
      begin
        bs.QueryOrders(atype,fromdate,todate,customtel,devId,auser_id,OrderManage);
        DBGridEh1.Visible:=false;
        cxOrderList.Visible:=true;
      end else
      begin
        orderCountSucess:=0;
        
        orderDateSet:=bs.QueryOrderdates(atype,fromdate,todate,customtel,devId,auser_id,OrderManage);
        
        DataSource1.DataSet:=orderDateSet;
        DBGridEh1.DataSource := DataSource1;
        DBGridEh1.Visible:=true;
        cxOrderList.Visible:=false;
        for i:=0 to DataSource1.DataSet.RecordCount-1 do
        begin
           if DBGridEh1.DataSource.DataSet.FieldValues['cancelTime']<=0 then
           begin
             DBGridEh1.DataSource.DataSet.Edit;
             DBGridEh1.DataSource.DataSet.FieldValues['cancelTime']:=null;
           end;
           if DBGridEh1.DataSource.DataSet.FieldValues['result']=5 then
           begin
              DBGridEh1.DataSource.DataSet.Edit;
              DBGridEh1.DataSource.DataSet.FieldValues['Content']:='抢单成功';
              //DBGridEh1.DataSource.DataSet.FieldValues['result']
              //DBGridEh1.DataSource.DataSet.FieldValues['atype']:='抢单成功';
              orderCountSucess:=orderCountSucess+1;
           end else
           begin
             DBGridEh1.DataSource.DataSet.Edit;
             DBGridEh1.DataSource.DataSet.FieldValues['Content']:='中心自动删除';
             // DBGridEh1.DataSource.DataSet.FieldValues['atype']:='中心自动删除';
           end;
           DataSource1.DataSet.Next;
        end;
        label3.Caption:=inttostr(DataSource1.DataSet.RecordCount)+'条' ;
        label5.Caption:=inttostr(orderCountSucess)+'条' ;
      end;
    end;
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
    orderCount:=orderCount+1;
    if State=ORDERSTATE_DEVGRABOK then
    begin
      orderCountSucess:=orderCountSucess+1;
    end;
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
     if AOrderManage.Count=0 then
     begin
       //MessageBox(Self.Handle,PChar('没有查到订单!'),PChar('提示'),mb_ok + mb_iconinformation);
       //exit;
     end;
     if not AOrderManage.isModified then  exit;
     cxOrderList.Clear;
     orderCount:=0;
     orderCountSucess:=0;
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
         values[11]:= AOrderManage.Item[i].OperationUserName;
       end;
     end;

    label3.Caption:=inttostr(orderCount)+'条' ;
    label5.Caption:=inttostr(orderCountSucess)+'条' ;
    AOrderManage.isModified:=false;
    cxOrderList.Sorted:=true;
    cxOrderList.SortedColumns[0].SortOrder:=soDescending;
end;

procedure TOrderQueryListFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  { OrderManage.Free;
   if orderDateSet<>nil then
   begin
     orderDateSet.Free;
   end; }
   ManualDock(nil);
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

procedure TOrderQueryListFrm.BitBtn3Click(Sender: TObject);
begin
  if DBGridEh1.Visible  then
  begin
     savegrid(DBGridEh1,'')
  end else
  begin
    cxTreeListToCSVFile(cxOrderList);
  end;
end;

procedure TOrderQueryListFrm.savegrid(grid: TDBGridEh; filename: string);
var
   ExpClass:TDBGridEhExportclass;
   Ext:String;
   savedlg:tsavedialog;
begin
   savedlg:=tsavedialog.Create(nil);
   savedlg.Filter:='Excel 文档 (*.xls)|*.XLS|Text files (*.txt)|*.TXT|Comma separated values (*.csv)|*.CSV|HTML file (*.htm)|*.HTM|Rich Text Format (*.rtf)|*.RTF';
   SaveDlg.FileName := filename;
   SaveDlg.DefaultExt := 'csv';
   if SaveDlg.Execute then
     begin
       case SaveDlg.FilterIndex of
           1: begin ExpClass := TDBGridEhExportAsXLS; Ext := 'csv'; end;
           2: begin ExpClass := TDBGridEhExportAsText; Ext := 'txt'; end;
           3: begin ExpClass := TDBGridEhExportAsCSV; Ext := 'xls'; end;
           4: begin ExpClass := TDBGridEhExportAsHTML; Ext := 'htm'; end;
           5: begin ExpClass := TDBGridEhExportAsRTF; Ext := 'rtf'; end;
       else
            ExpClass := nil; Ext := '';
       end;
       if ExpClass <> nil then    begin
          if UpperCase(Copy(SaveDlg.FileName,Length(SaveDlg.FileName)-2,3)) <> UpperCase(Ext) then
              SaveDlg.FileName := SaveDlg.FileName + '.' + Ext;
          SaveDBGridEhToExportFile(ExpClass,grid,SaveDlg.FileName,true);
     end;
   end;
   Savedlg.Destroy;
end;

procedure TOrderQueryListFrm.OrderGrid(dataSet: TClientDataset;
  orderField: string);
var
  i:integer;
begin
   if dataSet.IndexFieldNames<>'' then
  begin
    i:= DataSet.IndexDefs.IndexOf('i'+orderField);
    if i=-1 then
    begin
      with Dataset.IndexDefs.AddIndexDef do
      begin
        Name:='i'+orderField;
        Fields:=orderField;
        DescFields:=orderField;
      end;
    end;
    dataSet.IndexFieldNames:='';
    dataSet.IndexName:='i'+orderField;
  end
  else
  begin
    dataSet.IndexName:='';
    dataSet.IndexFieldNames:=orderfield;
  end;
end;

procedure TOrderQueryListFrm.DBGridEh1DblClick(Sender: TObject);
var
 frm:  TSendOrderFrm;
 ID,OderType,OderTime,CustomerTel,OrderContent,OrderDetailContent,SucceedDevID,State,OperationUserName:string;
 msStream: TMemoryStream;
 orderDevIDArray: array of integer;

begin
  if DBGridEh1.SelectedRows<>nil then
  begin
    frm:=TSendOrderFrm.Create(Self);
    try
    //frm.ShowOrder(TOrder(cxOrderList.FocusedNode.Data));
     ID:=DBGridEh1.DataSource.DataSet.FieldValues['id'];
     State:=DBGridEh1.DataSource.DataSet.FieldValues['atype'];
     OderTime:=DBGridEh1.DataSource.DataSet.FieldValues['adatetime'];
     CustomerTel:=DBGridEh1.DataSource.DataSet.FieldValues['usertel'];
     OrderContent:=DBGridEh1.DataSource.DataSet.FieldValues['content'];
     OrderDetailContent:=DBGridEh1.DataSource.DataSet.FieldValues['partContent'];
     SucceedDevID:=DBGridEh1.DataSource.DataSet.FieldValues['DevID'];
     OperationUserName:=DBGridEh1.DataSource.DataSet.FieldValues['username'];
     if not DBGridEh1.DataSource.DataSet.FieldByName('DevIDAry').IsNull  then
     begin
       msStream := TMemoryStream.Create;
       try
         (DBGridEh1.DataSource.DataSet.FieldByName('DevIDAry') as TBlobField).SaveToStream(msStream);
          msStream.Position := 0;
         if msStream.Size >= 4 then
         begin
           SetLength(orderDevIDArray, msStream.Size div 4);
           msStream.Read(orderDevIDArray[0], msStream.Size);
         end;
       finally
         msStream.Free;
       end;
     end;
     //frm.ShowAllinfo(ID,OderTime,CustomerTel,OrderContent,OrderDetailContent,SucceedDevID,State,OperationUserName,orderDevIDArray);
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
end;

procedure TOrderQueryListFrm.DBGridEh1TitleClick(Column: TColumnEh);
begin
  OrderGrid(orderDateSet,Column.FieldName);
end;

end.
