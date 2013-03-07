unit SendOrderMiniFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, cxGraphics, cxCustomData,
  cxStyles, cxTL, cxTextEdit, cxInplaceContainer, cxControls,OrderUnit,emapker,MetaDefine,Types,
  XPMenu,textUnit;

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
  private
      FSearchResult:array of TSearchAddrResult;
      isAddAddress:boolean;
      isAddName:boolean;
    function FindDevice(DevID: integer): String;
    function ReturnState(State: byte): String;
    function FindCancelReasonName(Order: TOrder): String;
    procedure ShowMetaInMap(meta: PMetaStruct;StaticStart:integer);
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
    uses carunit,uGloabVar,DateUtils,ConstDefineUnit,uFrmSelectDevs,DB,
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


  ComboBoxType.ItemIndex:=1;
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
begin
  BitBtnSend.Enabled:=false;
try
  EditAddress.Text:=DelInvalidStr(EditAddress.Text);
  if EditAddress.Text ='' then
  begin
    messagebox(handle,'请输入乘客的地址!','提示',mb_ok + mb_iconinformation);
    EditAddress.SetFocus;
    exit;
  end;
  if Listview1.Items.Count = 0 then
  begin
    messagebox(handle,'请选择发往的车辆!','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  i:=0;
  SendStr:=EditAddress.Text+'有一位'+EditName.Text+ComboBoxName.Text+'要车';
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
    else
    begin
      ListView1.Items.Item[i].Data:=Pointer(Dev);
      inc(i);
    end;
  end;
  
 // if Memo2.Text ='' then memo2.Text:=memo1.Text;
  Order:=Torder.Create;
 // RadioGroupOrderTypeClick(nil);
  Order.OderType:=ComboBoxType.ItemIndex;
  Order.OderDateTime:=EncodeDateTime(Yearof(DateTimePickerDate.Date),
                                     MonthOf(DateTimePickerDate.Date),
                                     Dayof(DateTimePickerDate.Date),
                                     Hourof(DateTimePickerTime.Time),
                                     MinuteOf(DateTimePickerTime.Time),
                                     SecondOf(DateTimePickerTime.Time),0);
  Order.OderDate:=dateof(DateTimePickerDate.Date);
  Order.OderTime:=timeof(DateTimePickerTime.Time);
  Order.CustomerTel:=EditCustomTel.Text;
  Order.OrderContent:=SendStr;//Memo1.Text;
  Order.OrderDetailContent:=SendStr;//Memo2.Text;
  Order.OperationUser:=current_user.id;
  Order.State:=10;
  Order.NameOfCustom:=EditName.Text;
  Order.SexOfCustom:=ComboBoxName.ItemIndex;
  Order.AddressOfCustom:=EditAddress.Text;
  Order.AddressQuery:=ComboBoxAddress.Text;
  if (IncMinute(Order.OderDateTime,-10)<now)and(ComboBoxType.ItemIndex=1) then
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

 Order.SaveToDataBase;  //保存数据库...
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
  BitBtnSend.Enabled:=true;
end;

end;


procedure TSendOrderMiniFrm.ComboBoxTypeChange(Sender: TObject);
begin
   if ComboBoxType.ItemIndex=0 then
   begin
      DateTimePickerDate.Enabled:=false;
      DateTimePickerDate.Date:=Date;
      DateTimePickerDate.Color:=clBtnFace;
      DateTimePickertime.Time:=IncMinute(Time,10);
   end
   else
   begin
      DateTimePickerDate.Color:=clWindow;
      //if Sender <>nil then
      DateTimePickertime.Time:=IncMinute(Time,20);
      DateTimePickerDate.Enabled:=true;
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
  ORDERSTATE_DEVCANCEL: Result:='司机取消订单';
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
begin
  try
    if cxAddressList.FocusedNode  = nil then exit;
    tmpAddr:= PSearchAddrResult(cxAddressList.FocusedNode.Data)^;
    ComboBoxAddress.Text:=cxAddressList.FocusedNode.Values[0];
    //j:=cxAddressList.FocusedNode.Values[1];
   // metaUID:= tmpAddr.SeekUIDAry[j];
    //metaIndex := tmpAddr.DrawLayer.Data.GetMetaIndex(metaUID);
    if tmpAddr.DataLayer<>nil then
    begin
        meta      := tmpAddr.pMeta;//.Data.GetMeta(metaIndex{,FMap.Projection.ProjectionType});
        ShowMetaInMap(meta,tmpAddr.DataLayer.StaticStart);
    end
    else
    begin
        FMap.Zoom(1,tmpAddr.pDefineText.Symbol.Position);
        FMap.Draw;
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
  if not isAddAddress then exit;
    AddressName.Find(ComboBoxAddress.Text,ComboBoxAddress.Items);
    ComboBoxAddress.SelStart:=Length(ComboBoxAddress.Text);
    if ComboBoxAddress.Items.Count >0 then
      if  editAddress.Text='' then
         editAddress.Text:=ComboBoxAddress.Items.Strings[0]
      else
         editAddress.Text:=ComboBoxAddress.Items.Strings[0];//+editAddress.Text;

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
     EditAddress.SetFocus;
     if ComboBoxAddress.Items.Count>0 then
     if (ComboBoxAddress.ItemIndex <0) then
        ComboBoxAddress.Text:=ComboBoxAddress.Items.Strings[0]
     else
       ComboBoxAddress.Text:=ComboBoxAddress.Items.Strings[ComboBoxAddress.ItemIndex];
     EditAddress.SelStart:=Length(EditAddress.Text);
     Key:=#0;
    // BitBtnQueryClick(nil);
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

end.
