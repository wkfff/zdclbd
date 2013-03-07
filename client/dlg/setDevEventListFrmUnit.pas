unit setDevEventListFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit, ActnList,
  StdCtrls, Buttons, cxInplaceContainer, cxControls, ExtCtrls, CarUnit;

type
  TsetDevEventListFrm = class(TForm)
    Panel111: TPanel;
    Panel2: TPanel;
    cxDevEventList: TcxTreeList;
    Event_Id: TcxTreeListColumn;
    Event_No: TcxTreeListColumn;
    Panel3: TPanel;
    Label1: TLabel;
    EditEventNO: TEdit;
    Panel1: TPanel;
    BitBtnOk: TBitBtn;
    BitBtnCancel: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    ActionList1: TActionList;
    AddEvent: TAction;
    ModifyEvent: TAction;
    DelEvent: TAction;
    ClrEvent: TAction;
    Event_info: TcxTreeListColumn;
    eventid: TcxTreeListColumn;
    procedure AddEventExecute(Sender: TObject);
    procedure ModifyEventExecute(Sender: TObject);
    procedure DelEventExecute(Sender: TObject);
    procedure ClrEventExecute(Sender: TObject);
    procedure BitBtnOkClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure AddEventNum(Dev:TDevice);
    procedure ModifyEventNum(Dev:TDevice);
    procedure DelEventNum(Dev:TDevice);
    procedure ClrEventNum(Dev:TDevice);
    function  EventNumSaveToDB(Dev: TDevice): Boolean;
  public
  procedure ReLoadEventList(Dev:TDevice);overload;
    procedure ReLoadEventList;overload;
  end;

var
  setDevEventListFrm: TsetDevEventListFrm;

implementation
uses EventInfoFrmUnit, uGloabvar,ConstDefineUnit;
{$R *.dfm}

procedure TsetDevEventListFrm.ReLoadEventList(Dev:TDevice);
var
  i: integer;
  pInfo: PEventInfo;
begin
  cxDevEventList.BeginUpdate;
  cxDevEventList.Clear;
  for i:= 0 to Dev.EventList.Count-1 do
  begin
    with cxDevEventList.Add do
    begin
      pInfo := Dev.EventItems[i];
      data:= pInfo;
      Values[0] := i+1;//序号
      Values[1] := pInfo^.No;
      Values[2] := pInfo^.Info;
      Values[3] := pInfo^.id;
    end;
  end;
  cxDevEventList.EndUpdate;
end;

procedure TsetDevEventListFrm.ReLoadEventList;
var
  i: integer;
  pInfo: PEventInfo;
begin
  cxDevEventList.BeginUpdate;
  cxDevEventList.Clear;
  for i:= 0 to GCurSelectDev.EventList.Count-1 do
  begin
    with cxDevEventList.Add do
    begin
      pInfo := GCurSelectDev.EventItems[i];
      data:= pInfo;
      Values[0]:= i+1;//序号
      Values[1] := pInfo^.No;
      Values[2] := pInfo^.Info;
      Values[3] := pInfo^.id;
    end;
  end;
  cxDevEventList.EndUpdate;
end;


procedure TsetDevEventListFrm.AddEventExecute(Sender: TObject);
var
  dlg: TEventInfoFrm;
  addEventId: Integer;
  pEvent: PEventInfo;
begin
  if GCurSelectDev.EventList.Count =23 then
  begin
    messagebox(handle,pchar('车机'+GCurSelectDev.car.no+'已有20条电话信息，不能再添加！'),'提示',mb_ok + mb_iconinformation);
    exit;
  end;

  dlg := TEventInfoFrm.Create(nil);
  try
    dlg.memInfo.Text := '';
    dlg.ShowModal;
    if dlg.ModalResult = mrok then
    begin
      //往数据库　该车机事件中加一个事件信息
     // addTelId := Bs.AddDevTel(GCurSelectDev,dlg.EditTelNo.Text,
      //  dlg.EditTelName.Text,dlg.ComboBoxTelType.ItemIndex);
      pEvent := GCurSelectDev.AddEventInfo(addEventId);
      pEvent^.info := dlg.memInfo.Text;
      ReLoadEventList;
    end;
  finally
    dlg.Free;
  end;
end;

procedure TsetDevEventListFrm.AddEventNum(Dev:TDevice);
var
  dlg : TEventInfoFrm;
  pEvent: PEventInfo;
  i:integer;
  addEventId: Integer;
begin
  if cxDevEventList.Count>=22 then
  begin
    messagebox(handle,pchar('已有22条事件信息，不能再添加！'),'提示',mb_ok + mb_iconinformation);
    exit;
  end;

  dlg := TEventInfoFrm.Create(nil);
  try
    dlg.EditEventId.Text := '';
    dlg.EditEventNO.Text := IntToStr(cxDevEventList.Count + 1) ;
    dlg.memInfo.Text := '';
    dlg.ShowModal;
    if dlg.ModalResult = mrok then
    begin

      for i:=0 to cxDevEventList.Count-1 do
      begin
        if cxDevEventList.Items[i].Values[1]=dlg.EditEventNO.Text then
        begin
          MessageBox(Self.Handle,PChar('事件表里已存在编号为【'+dlg.EditEventNO.Text+'】的这个事件'),PChar('提示'),$40);
          exit;
        end;
        {if cxDevEventList.Items[i].Values[2]=dlg.meminfo.Text then
        begin
          MessageBox(Self.Handle,PChar('事件表里已有【'+dlg.meminfo.Text+'】这个事件'),PChar('提示'),$40);
          exit;
        end; }
      end;
      //往数据库　该车机电话本中　加一个电话
      try
        addEventId := Bs.AddDevEvent(StrToInt(Trim(dlg.EditEventNO.Text)),Trim(dlg.memInfo.Text));
      except
        on E: exception do
        begin
          messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
          Exit;
        end;
      end;
      pEvent := Dev.AddEventInfo(addEventId);
      pEvent^.No := StrToInt(Trim(dlg.EditEventNO.Text));
      pEvent^.info := dlg.memInfo.Text;
      ReLoadEventList(Dev);
    end;
  finally
    dlg.Free;
  end;
end;

procedure TsetDevEventListFrm.ModifyEventNum(Dev:TDevice);
var
  dlg: TEventInfoFrm;
  pInfo: PEventInfo;
  i : Integer;
begin
  if cxDevEventList.SelectionCount =0 then exit;
  pInfo := PEventInfo(cxDevEventList.Selections[0].Data);
  dlg := TEventInfoFrm.Create(nil);
  try
    dlg.EditEventId.Text := IntToStr(pInfo^.Id);
    dlg.EditEventNO.Text := IntToStr(pInfo^.No);
    dlg.memInfo.Text := pInfo^.Info;
    dlg.ShowModal;
    if dlg.ModalResult = mrok then
    begin
      if pInfo^.info <> dlg.memInfo.Text then
      begin
        for i:=0 to cxDevEventList.Count-1 do
        begin
          if cxDevEventList.Items[i].Values[1]=dlg.memInfo.Text then
          begin
            MessageBox(Self.Handle,PChar('事件列表里已有'+dlg.memInfo.Text+'这个事件'),PChar('提示'),$40);
            exit;
          end;
        end;
      end;
      pInfo := Dev.FindEventInfo(StrToInt(dlg.EditEventId.Text));
      pInfo^.No := StrToInt(dlg.EditEventNO.Text);
      pInfo^.Info := dlg.memInfo.Text;
      try
        Bs.ModifyDevEventList_AEventInfo(pInfo);
      except
        on E: exception do
        begin
          messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
          Exit;
        end;
      end;
      ReLoadEventList(Dev);
    end;
  finally
    dlg.free;
  end;
end;

procedure TsetDevEventListFrm.ModifyEventExecute(Sender: TObject);
var
  dlg: TEventInfoFrm;
  pInfo: PEventInfo;
begin
  if cxDevEventList.SelectionCount =0 then exit;
  pInfo := PEventInfo(cxDevEventList.Selections[0].Data);
  dlg := TEventInfoFrm.Create(nil);
  try
    dlg.EditEventId.Text   := IntToStr(pInfo^.Id);
    //dlg.EditTelName.Text := pInfo^.Name;
   // dlg.ComboBoxTelType.ItemIndex := pInfo^.TelType;
   // dlg.PanelControl.Caption := ModifyTel.Caption;
    dlg.ShowModal;
    if dlg.ModalResult = mrok then
    begin
      pInfo := GCurSelectDev.FindEventInfo(StrToInt(dlg.EditEventId.Text));
     // pInfo^.No      := dlg.EditTelNo.Text;
    //  pInfo^.Name    := dlg.EditTelName.Text;
    //  pInfo^.TelType := dlg.ComboBoxTelType.ItemIndex;
    //  Bs.ModifyDevTelList_ATelInfo(GCurSelectDev,pInfo);
      ReLoadEventList;
    end;
  finally
    dlg.free;
  end;
end;

procedure TsetDevEventListFrm.DelEventExecute(Sender: TObject);
var
  pEvent: PEventInfo;
begin
  if cxDevEventList.SelectionCount =0 then
  begin
    MessageBox(handle,'请您选择要删除的事件信息','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  pEvent := PEventInfo(cxDevEventList.Selections[0].Data);
  if MessageBox(handle,pchar('您确定要删除事件【 '+pEvent^.info+' 】的信息?'),
    '提示',MB_YESNO + MB_ICONQUESTION)=Id_No then
    exit;
  //Bs.DeleteDevTelList_ATelInfo(pTel^.Id);
  //GCurSelectDev.DelTelInfo(pTel^.Id);
  ReLoadEventList;
end;

procedure TsetDevEventListFrm.DelEventNum(Dev:TDevice);
var
  pEvent: PEventInfo;
begin
  if cxDevEventList.SelectionCount =0 then
  begin
    MessageBox(handle,'请您选择要删除的事件信息','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  pEvent := PEventInfo(cxDevEventList.Selections[0].Data);
  if MessageBox(handle,pchar('您确定要删除事件【 '+pEvent^.Info+' 】信息?'),
    '提示',MB_YESNO + MB_ICONQUESTION)=Id_No then
    exit;
  try
    Bs.DeleteDevEventList_AEventInfo(pEvent^.Id);
  except
    on E: exception do
    begin
      messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
      Exit;
    end;
  end;
  Dev.DelEventInfo(pEvent^.Id);
  ReLoadEventList(Dev);
end;

procedure TsetDevEventListFrm.ClrEventNum(Dev:TDevice);
begin
  if cxDevEventList.Count =0 then
    exit;
  if MessageBox(handle,'您确定要清除电话本，即删除所有电话信息？','提示',MB_YESNO + MB_ICONQUESTION)= id_no then
    exit;
  //Bs.DeleteDevTelList(GCurSelectDev.IdStr);
  Dev.ClrEventList;
  ReLoadEventList(Dev);
end;

procedure TsetDevEventListFrm.ClrEventExecute(Sender: TObject);
begin
  if cxDevEventList.Count =0 then
    exit;
  if MessageBox(handle,'您确定要清除事件列表，即删除所有事件信息？','提示',MB_YESNO + MB_ICONQUESTION)= id_no then
    exit;
  //Bs.DeleteDevEventList(GCurSelectDev.IdStr);
  GCurSelectDev.ClrEventList;
  ReLoadEventList;
end;

procedure TsetDevEventListFrm.BitBtnOkClick(Sender: TObject);
begin
  if cxDevEventList.Count =0 then
  begin
    messagebox(handle,'现在车机事件列表为空，请添加事件信息！','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  ModalResult := mrOk;
end;

function TsetDevEventListFrm.EventNumSaveToDB(Dev:TDevice):boolean;
var
 i:integer;
 idList: string;
begin
  idList := '';
  Result:=false;
  if ADeviceManage.Find(Dev.IdStr)=nil then exit;
  if Dev.EventList.Count >= 1 then
  begin
    idList := IntToStr(Dev.EventItems[0].id);
  end;
  for i:=1 to Dev.EventList.Count -1 do
  begin

    idList := idList + ',' + IntToStr(Dev.EventItems[i].id);
  end;
  Bs.ModifyDev_EventList(Dev.id, idList);
  Result:=true;
end;

end.
