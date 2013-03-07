unit QueryOrderListFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QueryBaseFrmUnit, PrnDbgeh, DB, cxControls, cxSplitter, Grids,
  DBGridEh, StdCtrls, Buttons, ComCtrls, ExtCtrls, uGloabVar, ADODB;

type
  TQueryOrderListFrm = class(TQueryBaseFrm)
    Label1: TLabel;
    cbxOrderType: TComboBox;
    Label4: TLabel;
    cbxUserType: TComboBox;
    chkShowSucc: TCheckBox;
    chkShowCancel: TCheckBox;
    procedure SpeedButtonOneTimeClick(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure EditDbGrid();
    function  Split(Str: String; Value: Char): Variant;
  end;

var
  QueryOrderListFrm: TQueryOrderListFrm;

implementation
uses uFrmRefreshProgress, ConstDefineUnit, SendOrderFrmUnit, ShowMessageInfo;
{$R *.dfm}

procedure TQueryOrderListFrm.EditDbGrid;
var
  i: Integer;
begin
  for i:=0 to DataSource1.DataSet.RecordCount-1 do
  begin
     if DBGridEh1.DataSource.DataSet.FieldValues['cancelTime']<='2000-1-1' then
     begin
       DBGridEh1.DataSource.DataSet.Edit;
       DBGridEh1.DataSource.DataSet.FieldValues['cancelTime']:=null;
     end;
     if DBGridEh1.DataSource.DataSet.FieldValues['DevCancelReasonIDStr'] = '-1' then
     begin
       DBGridEh1.DataSource.DataSet.Edit;
       DBGridEh1.DataSource.DataSet.FieldValues['DevCancelReasonIDStr']:='';
     end;
     
     {DBGridEh1.DataSource.DataSet.Edit;
     case DBGridEh1.DataSource.DataSet.FieldValues['result'] of
        ORDERSTATE_NODEVANSWER_DEL: DBGridEh1.DataSource.DataSet.FieldValues['memo']:='中心自动删除';
        ORDERSTATE_WAITGRAB: DBGridEh1.DataSource.DataSet.FieldValues['memo']:='等待司机抢单';
        ORDERSTATE_DEVGRAB : DBGridEh1.DataSource.DataSet.FieldValues['memo']:='已有司机抢单';
        ORDERSTATE_SENDINGDEVGRABOK: DBGridEh1.DataSource.DataSet.FieldValues['memo']:='正在下发给司机抢单成功';
        ORDERSTATE_SENDDEVGRABOK_FAIL: DBGridEh1.DataSource.DataSet.FieldValues['memo']:='抢单失败';
        ORDERSTATE_DEVGRABOK: DBGridEh1.DataSource.DataSet.FieldValues['memo']:='抢单成功';
        ORDERSTATE_SRVCANCEL: DBGridEh1.DataSource.DataSet.FieldValues['memo']:='中心取消订单';
        ORDERSTATE_DEVCANCEL: DBGridEh1.DataSource.DataSet.FieldValues['memo']:='车机取消订单';
        ORDERSTATE_FINISH: DBGridEh1.DataSource.DataSet.FieldValues['memo']:='完成';
        else
          DBGridEh1.DataSource.DataSet.FieldValues['memo']:='等待中...';

        //orderCountSucess:=orderCountSucess+1;
     end;          }
     DataSource1.DataSet.Next;
  end;
end;

procedure TQueryOrderListFrm.SpeedButtonOneTimeClick(Sender: TObject);
var
  OrderType: Integer;
  UserType: Boolean;
  resultStr, xml: string;
  FCursor: TCursor;
  recordCount: Integer;
  pageSize: Integer;
  pages: Integer;
  i: Integer;
  index: Integer;
  orderResultList: string;
begin
  inherited;
  DataSource1.DataSet := nil;
  if QueryContion = False then Exit;
  OrderType := cbxOrderType.ItemIndex - 1;
  UserType := (cbxUserType.ItemIndex and 1) = 1;
  orderResultList := '';
  if chkShowSucc.Checked then
  begin
    if orderResultList = '' then
      orderResultList := orderResultList + '8'
    else
      orderResultList := orderResultList + ',8';
  end;

  if chkShowCancel.Checked then
  begin
    if orderResultList = '' then
      orderResultList := orderResultList + '6,7'
    else
      orderResultList := orderResultList + ',6,7';
  end;    

  screen.Cursor := FCursor;
  try
    FCursor := -11;               
    //清数据
    //DataSource1.DataSet := nil;
    if FDlgProgress = nil then
      FDlgProgress := TFrmRefreshProgress.Create(self);
    FDlgProgress.SetCaption('正在载入数据，请您稍候...');
    FDlgProgress.Gauge1.MinValue := 0;
    FDlgProgress.Gauge1.MaxValue := 100;

    FDlgProgress.Gauge1.Progress := 5;
    FDlgProgress.Show;
    Application.ProcessMessages;

    FDlgProgress.Gauge1.MaxValue := 10 +10;
    FDlgProgress.Gauge1.Progress := 10;
    Application.ProcessMessages;


    pageSize := 50;
    try
      recordCount := Bs.QueryOrderListCount(FromDate, ToDate, OrderType, UserType, dev_id, fact_id, group_id, group_paranet, orderResultList);
    except
      on E: Exception do
      begin
        messageErrorBox('查询订单信息结果处理不正确！', e.Message);
        exit;
      end;
    end;
    if recordCount <= 0 then Exit;
    pages := recordCount div pageSize;
    if recordCount mod pageSize > 0 then
      pages := pages + 1;

    xml := '';
    for i := 1 to pages do
    begin
      try
        resultStr := Bs.QueryOrderListByPage(FromDate, ToDate, OrderType, UserType, dev_id, fact_id, group_id, group_paranet, pageSize, i, orderResultList);
      except
        on E: Exception do
        begin
          messageErrorBox('查询订单信息结果处理不正确！', e.Message);
          exit;
        end;
      end;

      if xml = '' then
        xml := Copy(resultStr, 1, Length(resultStr) - 23)
      else
      begin
        index := Pos('<ROWDATA>', resultStr);
        xml := xml + Copy(resultStr, index + 9, Length(resultStr) - (index + 9 -1) - 23);
      end;
    end;

    xml := xml + '</ROWDATA></DATAPACKET>';
    FDlgProgress.GaugeProcessInc(10);
    aqStore.XMLData := xml;
    aqStore.Open;
    if aqStore.RecordCount  <= 0 then
    begin
      FDlgProgress.Hide;
      MessageBox(Handle,'对不起，没有符合条件的数据！','提示',MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

    //过滤条件
    {with aqStore do
    begin
      Filtered := False;
      if chkShowSucc.Checked and chkShowCancel.Checked then//显示成功和取消
        filterStr := filterStr + ' and result in (5, 6, 7)'
      else if chkShowSucc.Checked then                     //显示成功
        filterStr := filterStr + ' and result = 5'
      else if chkShowCancel.Checked then                   //显示取消
        filterStr := filterStr + ' and result in (6, 7)';

      Filter := filterStr;
      Filtered := True;
    end; }
    DataSource1.DataSet := aqStore;
    DBGridEh1.DataSource := DataSource1;
    EditDbGrid;
  finally
    FCursor := 0;
    if FDlgProgress.Showing then FDlgProgress.Hide;
  end;

end;

procedure TQueryOrderListFrm.DBGridEh1DblClick(Sender: TObject);
var
 frm:  TSendOrderFrm;
 ID,OderType,OderTime,CustomerTel,OrderContent,OrderDetailContent,SucceedDevID,State,OperationUserName:string;
 msStream: TMemoryStream;
 orderDevIDArray: array of string;

begin
  if DBGridEh1.SelectedRows<>nil then
  begin
    frm:=TSendOrderFrm.Create(Self);
    try
    //frm.ShowOrder(TOrder(cxOrderList.FocusedNode.Data));
     //ID:=DBGridEh1.DataSource.DataSet.FieldValues['id'];
     State:=DBGridEh1.DataSource.DataSet.FieldValues['memo'];
     OderTime:=DBGridEh1.DataSource.DataSet.FieldValues['adatetime'];
     CustomerTel:=DBGridEh1.DataSource.DataSet.FieldValues['usertel'];
     OrderContent:=DBGridEh1.DataSource.DataSet.FieldValues['content'];
     OrderDetailContent:=DBGridEh1.DataSource.DataSet.FieldValues['partContent'];
     SucceedDevID:=DBGridEh1.DataSource.DataSet.FieldValues['Dev_ID'];
     OperationUserName:=DBGridEh1.DataSource.DataSet.FieldValues['Senduser_name'];
     orderDevIDArray := Split(DBGridEh1.DataSource.DataSet.FieldValues['DevIDAry'],',');
     {if not DBGridEh1.DataSource.DataSet.FieldByName('DevIDAry').IsNull  then
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
     end;      }
     frm.ShowAllinfo(ID,OderTime,CustomerTel,OrderContent,OrderDetailContent,SucceedDevID,State,OperationUserName,orderDevIDArray);
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

function TQueryOrderListFrm.Split(Str: string; Value: Char): Variant;
var
  buf: array of string;
  count: Integer;
  i,j: Integer;
  temp: string;
begin
  if Length(str) <= 0 then
    Exit;

  if (Length(str) > 0) and (Pos(Value, str) = 0) then
  begin
    SetLength(buf, 1);
    buf[0] := Str;
    Result := buf;
  end
  else
  begin
    j := 0;
    temp := str;
    while Length(temp)>0 do
    begin
      if  Pos(Value, temp)>0 then
      begin
        j := j + 1;
        temp := Copy(temp, Pos(Value, temp)+1, Length(temp));
        if Pos(Value, temp) <= 0 then
          temp := '';
      end;
    end;

    j := j + 1;
    SetLength(buf, j);
    temp := Str;
    i := 0;
    while Length(temp)>0 do
    begin
      if i+1=j then
      begin
        buf[i] := Copy(temp, 0, Length(temp));
        Break;
      end
      else
        buf[i] := Copy(temp, 0, Pos(Value, temp)-1);
      temp := Copy(temp, Pos(Value, temp) + 1, Length(temp));
      i := i + 1;
    end;
    Result := buf;
  end;
end;

procedure TQueryOrderListFrm.BitBtn5Click(Sender: TObject);
var
  OrderType: Integer;
  UserType: Boolean;
  resultStr, xml: string;
  FCursor: TCursor;
  recordCount: Integer;
  pageSize: Integer;
  pages: Integer;
  i: Integer;
  index: Integer;
  orderResultList: string;
begin
  inherited;
  DataSource1.DataSet := nil;
  if QueryContion = False then Exit;
  OrderType := cbxOrderType.ItemIndex - 1;
  UserType := (cbxUserType.ItemIndex and 1) = 1;
  orderResultList := '';
  if chkShowSucc.Checked then
  begin
    if orderResultList = '' then
      orderResultList := orderResultList + '8'
    else
      orderResultList := orderResultList + ',8';
  end;

  if chkShowCancel.Checked then
  begin
    if orderResultList = '' then
      orderResultList := orderResultList + '6,7'
    else
      orderResultList := orderResultList + ',6,7';
  end;    

  screen.Cursor := FCursor;
  try
    FCursor := -11;               
    //清数据
    //DataSource1.DataSet := nil;
    if FDlgProgress = nil then
      FDlgProgress := TFrmRefreshProgress.Create(self);
    FDlgProgress.SetCaption('正在载入数据，请您稍候...');
    FDlgProgress.Gauge1.MinValue := 0;
    FDlgProgress.Gauge1.MaxValue := 100;

    FDlgProgress.Gauge1.Progress := 5;
    FDlgProgress.Show;
    Application.ProcessMessages;

    FDlgProgress.Gauge1.MaxValue := 10 +10;
    FDlgProgress.Gauge1.Progress := 10;
    Application.ProcessMessages;


    pageSize := 50;
    try
      recordCount := Bs.QueryOrderListCount(FromDate, ToDate, OrderType, UserType, dev_id, fact_id, group_id, group_paranet, orderResultList);
    except
      on E: Exception do
      begin
        messageErrorBox('查询订单信息结果处理不正确！', e.Message);
        exit;
      end;
    end;
    if recordCount <= 0 then Exit;
    pages := recordCount div pageSize;
    if recordCount mod pageSize > 0 then
      pages := pages + 1;

    xml := '';
    for i := 1 to pages do
    begin
      try
        resultStr := Bs.QueryOrderListByPage(FromDate, ToDate, OrderType, UserType, dev_id, fact_id, group_id, group_paranet, pageSize, i, orderResultList);
      except
        on E: Exception do
        begin
          messageErrorBox('查询订单信息结果处理不正确！', e.Message);
          exit;
        end;
      end;

      if xml = '' then
        xml := Copy(resultStr, 1, Length(resultStr) - 23)
      else
      begin
        index := Pos('<ROWDATA>', resultStr);
        xml := xml + Copy(resultStr, index + 9, Length(resultStr) - (index + 9 -1) - 23);
      end;
    end;

    xml := xml + '</ROWDATA></DATAPACKET>';
    FDlgProgress.GaugeProcessInc(10);
    aqStore.XMLData := xml;
    aqStore.Open;
    if aqStore.RecordCount  <= 0 then
    begin
      FDlgProgress.Hide;
      MessageBox(Handle,'对不起，没有符合条件的数据！','提示',MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

    //过滤条件
    {with aqStore do
    begin
      Filtered := False;
      if chkShowSucc.Checked and chkShowCancel.Checked then//显示成功和取消
        filterStr := filterStr + ' and result in (5, 6, 7)'
      else if chkShowSucc.Checked then                     //显示成功
        filterStr := filterStr + ' and result = 5'
      else if chkShowCancel.Checked then                   //显示取消
        filterStr := filterStr + ' and result in (6, 7)';

      Filter := filterStr;
      Filtered := True;
    end; }
    DataSource1.DataSet := aqStore;
    DBGridEh1.DataSource := DataSource1;
    EditDbGrid;
  finally
    FCursor := 0;
    if FDlgProgress.Showing then FDlgProgress.Hide;
  end;
end;

end.
