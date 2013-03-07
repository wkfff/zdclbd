unit FrmSetDevEventUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzListVw, RzPanel, RzRadGrp, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, CarUnit, IntegerListUnit;

type
  TfrmSetDevEvent = class(TForm)
    Panel4: TPanel;
    Panel8: TPanel;
    BitBtn5: TBitBtn;
    BitBtnSel: TBitBtn;
    ListView1: TListView;
    Panel7: TPanel;
    Panel111: TPanel;
    Panel2: TPanel;
    Panel5: TPanel;
    ProgressBar1: TProgressBar;
    Panel3: TPanel;
    Panel1: TPanel;
    btnSend: TBitBtn;
    btnCancel: TBitBtn;
    btnAdd: TBitBtn;
    btnModify: TBitBtn;
    btnDel: TBitBtn;
    rbgSetOption: TRzRadioGroup;
    devEventList: TRzListView;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnModifyClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure BitBtnSelClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    dev: TDevice;
    Cancel: Boolean;
    eventList: TIntegerList;
    procedure clearEventList;
    procedure ReLoadEventList(Dev:TDevice);
    function  EventNumSaveToDB(Dev: TDevice): Boolean;

    procedure GetSelectedEvent;
    procedure AddEventsToDev(d: TDevice; setType: Byte);
    procedure DelEventsFromDev(d: TDevice);
  public
    { Public declarations }
  end;

implementation
uses
  uFrmSelectDevs, uGloabVar, EventInfoFrmUnit, ConstDefineUnit;

{$R *.dfm}

procedure TfrmSetDevEvent.FormCreate(Sender: TObject);
begin
  dev := TDevice.Create;
  eventList := TIntegerList.Create;
end;

procedure TfrmSetDevEvent.FormDestroy(Sender: TObject);
begin
  dev.Free;
  clearEventList;
  eventList.Free;
end;             

procedure TfrmSetDevEvent.ReLoadEventList(Dev:TDevice);
var
  i: integer;
  pInfo: PEventInfo;
begin
  devEventList.Clear;
  for i:= 0 to Dev.EventList.Count-1 do
  begin
    with devEventList.Items.Add do
    begin
      pInfo := Dev.EventItems[i];
      data:= pInfo;
      Caption := IntToStr(i + 1);//���
      SubItems.Add(IntToStr(pInfo^.No));
      SubItems.Add(pInfo^.Info);
      SubItems.Add(IntToStr(pInfo^.id));
      Checked := True;
    end;
  end;
end;

procedure TfrmSetDevEvent.btnAddClick(Sender: TObject);
var
  dlg : TEventInfoFrm;
  pEvent: PEventInfo;
  i:integer;
  addEventId: Integer;
begin
  if devEventList.Items.Count >= 22 then
  begin
    messagebox(handle,pchar('����22���¼���Ϣ����������ӣ�'),'��ʾ',mb_ok + mb_iconinformation);
    exit;
  end;

  dlg := TEventInfoFrm.Create(nil);
  try
    dlg.EditEventId.Text := '';
    dlg.EditEventNO.Text := IntToStr(devEventList.Items.Count + 1) ;
    dlg.memInfo.Text := '';
    dlg.ShowModal;
    if dlg.ModalResult = mrok then
    begin
      for i:=0 to devEventList.Items.Count - 1 do
      begin
        if devEventList.Items.Item[i].SubItems[0] = dlg.EditEventNO.Text then
        begin
          MessageBox(Self.Handle,PChar('�¼������Ѵ��ڱ��Ϊ��'+dlg.EditEventNO.Text+'��������¼�'),PChar('��ʾ'),$40);
          exit;
        end;
      end;
      try
        addEventId := Bs.AddDevEvent(StrToInt(Trim(dlg.EditEventNO.Text)),Trim(dlg.memInfo.Text));
      except
        on E: exception do
        begin
          messagebox(handle, QUERY_WARNING_INFO, '��ʾ', mb_ok + mb_iconinformation);
          Exit;
        end;
      end;
      pEvent := Dev.AddEventInfo(addEventId);
      pEvent^.No := StrToInt(Trim(dlg.EditEventNO.Text));
      pEvent^.info := dlg.memInfo.Text;

      pEvent := FAllDevEventList.AddDevEventInfo(addEventId);
      pEvent^.No := StrToInt(Trim(dlg.EditEventNO.Text));
      pEvent^.info := dlg.memInfo.Text;

      ReLoadEventList(Dev);
    end;
  finally
    dlg.Free;
  end;
end;


procedure TfrmSetDevEvent.btnModifyClick(Sender: TObject);
var
  dlg: TEventInfoFrm;
  pInfo: PEventInfo;
  i : Integer;
  listItem: TListItem;
begin
  if devEventList.SelCount = 0 then exit;
  pInfo := PEventInfo(devEventList.Selected.Data);
  dlg := TEventInfoFrm.Create(nil);
  try
    dlg.EditEventId.Text := IntToStr(pInfo^.Id);
    dlg.EditEventNO.Text := IntToStr(pInfo^.No);
    dlg.EditEventNO.ReadOnly := True; //��ֹ�޸��¼����
    dlg.EditEventNO.Color := clInfoBk;
    dlg.memInfo.Text := pInfo^.Info;
    dlg.ShowModal;
    if dlg.ModalResult = mrok then
    begin
      if IntToStr(pInfo^.No) <> dlg.EditEventNO.Text then
      begin
        for i := 0 to devEventList.Items.Count - 1 do
        begin
          listItem := devEventList.Items.Item[i];
          if (listItem.SubItems[0] = dlg.EditEventNO.Text) and (listItem.SubItems[2] <> IntToStr(pInfo^.id)) then
          begin
            MessageBox(Self.Handle,PChar('�¼������Ѵ��ڱ��Ϊ��'+dlg.EditEventNO.Text+'�����¼�'),PChar('��ʾ'),$40);
            exit;
          end;  
        end;
      end;
      {û��˵�����¼����ݲ�����ͬ
      if pInfo^.info <> dlg.memInfo.Text then
      begin
        for i:=0 to devEventList.Items.Count - 1 do
        begin
          listItem := devEventList.Items.Item[i];
          if listItem.SubItems[1] = dlg.memInfo.Text then
          begin
            MessageBox(Self.Handle,PChar('�¼��б�������'+dlg.memInfo.Text+'����¼�'),PChar('��ʾ'),$40);
            exit;
          end;
        end;
      end;}
      pInfo := Dev.FindEventInfo(StrToInt(dlg.EditEventId.Text));
      if pInfo <> nil then
      begin
        pInfo^.No := StrToInt(dlg.EditEventNO.Text);
        pInfo^.Info := dlg.memInfo.Text;

        pInfo := FAllDevEventList.AddDevEventInfo(pInfo^.id);
        if pInfo <> nil then
        begin{//�޸��¼���Ϣ�󣬽�ȫ�ֱ����еĸ��¼���Ϣ�޸�
              (����ֳ������̨��һ�µ��������Ϊֻ��һ���������¼��·����ǻ���ֳ������̨��һ�£����Դ˴�һ���޸����¼���Ϣ���͸���)}
          pInfo^.No := StrToInt(dlg.EditEventNO.Text);
          pInfo^.Info := dlg.memInfo.Text;
          try
            Bs.ModifyDevEventList_AEventInfo(pInfo);
          except
            on E: exception do
            begin
              messagebox(handle, QUERY_WARNING_INFO, '��ʾ', mb_ok + mb_iconinformation);
              Exit;
            end;
          end;
        end;
      end;
      ReLoadEventList(Dev);
    end;
  finally
    dlg.free;
  end;
end;

procedure TfrmSetDevEvent.btnDelClick(Sender: TObject);
var
  pEvent: PEventInfo;
begin
  if devEventList.SelCount = 0 then
  begin
    MessageBox(handle,'��������ѡ��Ҫɾ�����¼���Ϣ','��ʾ',mb_ok + mb_iconinformation);
    exit;
  end;
  pEvent := PEventInfo(devEventList.Selected.Data);
  if pEvent <> nil then
  begin
    if MessageBox(handle,pchar('��ȷ��Ҫɾ���¼��� '+pEvent^.Info+' ����Ϣ?'),
      '��ʾ',MB_YESNO + MB_ICONQUESTION)=Id_No then
      exit;
    try //�ݲ�ɾ�����ݿ��е��¼���Ϣ
      //Bs.DeleteDevEventList_AEventInfo(pEvent^.Id);
    except
      on E: exception do
      begin
        messagebox(handle, QUERY_WARNING_INFO, '��ʾ', mb_ok + mb_iconinformation);
        Exit;
      end;
    end;
    Dev.DelEventInfo(pEvent^.Id);
    ReLoadEventList(Dev);
  end;
end;

procedure TfrmSetDevEvent.BitBtnSelClick(Sender: TObject);
var
  frm: TFrmSelectDevs;
  i:integer;
begin
  frm:=TFrmSelectDevs.Create(nil);
  try
  if frm.ShowModal=mrOk then
  begin
    ListView1.Clear;
    for i:=0 to frm.DestList.Count-1 do
    begin
      with ListView1.Items.Add do
      begin
        Caption:=TDevice(frm.DestList.Items[i].Data).Car.No;
        Data:=frm.DestList.Items[i].Data;
      end;
    end;
  end;
  finally
    frm.Free;
  end;
end;

procedure TfrmSetDevEvent.BitBtn5Click(Sender: TObject);
begin
  if ListView1.Items.Count =1 then
  begin
     messagebox(handle,'������ֻ��һ����,����ɾ����!','��ʾ',mb_ok + mb_iconinformation);
  end
  else
  begin
    ListView1.DeleteSelected;
  end;
end;

procedure TfrmSetDevEvent.ListView1Click(Sender: TObject);
var
  D:TDevice;
  J:integer;
  EventInfo:PEventInfo;
  e: PEventInfo;
begin
  if ListView1.Selected =nil then exit;
  D:=TDevice(ListView1.Selected.Data);
  Dev.ClrEventList;
  for j:=0 to D.EventList.Count-1 do
  begin
    e := FAllDevEventList.GetDevEventInfoById(D.Eventitems[j].id);
    if e <> nil then
    begin
      EventInfo:= Dev.AddEventInfo(e^.id);
      EventInfo^.No := e^.No;
      EventInfo^.Info:=e^.info;
    end;
  end;
  ReLoadEventList(Dev);
end;

procedure TfrmSetDevEvent.btnSendClick(Sender: TObject);
var
  setType: Byte;
  i: Integer;
  D: TDevice;
begin
  if ListView1.Items.Count <= 0 then
  begin
    MessageBox(Handle, '��ѡ���������¼��ĳ���', '��ʾ', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  setType := rbgSetOption.ItemIndex;
  if setType = 0 then
  begin//ɾ�������¼���Ϣ
    if MessageBox(Handle, '��ȷ��ɾ�������¼���', 'ȷ��', MB_YESNO + MB_ICONQUESTION) = IdNo then
      Exit;
    Panel4.Enabled:=false;
    Panel111.Enabled:=false;
    Panel5.Visible:=true;
    ProgressBar1.Max:=ListView1.Items.Count*5*10;
    TbitBtn(Sender).Enabled:=false;
    clearEventList;
    try
      for i:=0 to ListView1.Items.Count -1 do
      begin
        if Cancel then
        begin
          if messagebox(handle, '�Ƿ�ȷʵҪȡ����ʣ�೵���Ĳ�����', '��ʾ', MB_YESNO + MB_ICONQUESTION) = ID_YES then
          begin
            Close;
            Exit;
          end
          else
          begin
            Cancel := False;
          end;
        end;

        D:=TDevice(ListView1.Items.Item[i].Data);
        D.ClrEventList;
        ProgressBar1.StepIt;
        ProgressBar1.StepIt;
        DataServer.SetEventList(D, eventList, setType); // ��������
        ProgressBar1.StepIt;
        EventNumSaveToDB(D);
        ProgressBar1.StepIt;
        //Sleep(50);
        //Application.ProcessMessages;
      end;

    finally
      Panel4.Enabled:=true;
      Panel111.Enabled:=true;
      Panel5.Visible:=false;
      TbitBtn(Sender).Enabled:=true;
    end;
  end
  else if (setType = 1) or (setType = 2) or (setType = 3) then
  begin//���¡�׷�ӡ��޸��¼�
    GetSelectedEvent;
    if eventList.Count <= 0 then
    begin
      MessageBox(Handle, '������ѡ��һ���¼�', '��ʾ', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

    Panel4.Enabled:=false;
    Panel111.Enabled:=false;
    Panel5.Visible:=true;
    ProgressBar1.Max:=ListView1.Items.Count*5*10;
    TbitBtn(Sender).Enabled:=false;
    try
      for i:=0 to ListView1.Items.Count -1 do
      begin
        if Cancel then
        begin
          if messagebox(handle, '�Ƿ�ȷʵҪȡ����ʣ�೵���Ĳ�����', '��ʾ', MB_YESNO + MB_ICONQUESTION) = ID_YES then
          begin
            Close;
            Exit;
          end
          else
          begin
            Cancel := False;
          end;
        end;

        D:=TDevice(ListView1.Items.Item[i].Data);
        ProgressBar1.StepIt;
        ProgressBar1.StepIt;
        DataServer.SetEventList(D, eventList, setType); // ��������
        ProgressBar1.StepIt;
        AddEventsToDev(D, setType);
        EventNumSaveToDB(D);
        ProgressBar1.StepIt;
        //Application.ProcessMessages;
      end;

    finally
      Panel4.Enabled:=true;
      Panel111.Enabled:=true;
      Panel5.Visible:=false;
      TbitBtn(Sender).Enabled:=true;
    end;
  end
  else if setType = 4 then
  begin//ɾ���ض������¼�
    GetSelectedEvent;
    if eventList.Count <= 0 then
    begin
      MessageBox(Handle, '������ѡ��һ���¼�', '��ʾ', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
    Panel4.Enabled:=false;
    Panel111.Enabled:=false;
    Panel5.Visible:=true;
    ProgressBar1.Max:=ListView1.Items.Count*5*10;
    TbitBtn(Sender).Enabled:=false;
    try
      for i:=0 to ListView1.Items.Count -1 do
      begin
        if Cancel then
        begin
          if messagebox(handle, '�Ƿ�ȷʵҪȡ����ʣ�೵���Ĳ�����', '��ʾ', MB_YESNO + MB_ICONQUESTION) = ID_YES then
          begin
            Close;
            Exit;
          end
          else
          begin
            Cancel := False;
          end;
        end;

        D:=TDevice(ListView1.Items.Item[i].Data);
        ProgressBar1.StepIt;
        ProgressBar1.StepIt;
        DataServer.SetEventList(D, eventList, setType); // ��������
        ProgressBar1.StepIt;
        DelEventsFromDev(D);
        EventNumSaveToDB(D);
        ProgressBar1.StepIt;
        //Application.ProcessMessages;
      end;

    finally
      Panel4.Enabled:=true;
      Panel111.Enabled:=true;
      Panel5.Visible:=false;
      TbitBtn(Sender).Enabled:=true;
    end;
  end;
  Close;     
end;

procedure TfrmSetDevEvent.btnCancelClick(Sender: TObject);
begin
  Cancel := True;
end;

function TfrmSetDevEvent.EventNumSaveToDB(Dev: TDevice): Boolean;
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

procedure TfrmSetDevEvent.clearEventList;
var
  eventInfo: PEventInfo;
begin
  while eventList.Count > 0 do
  begin
    eventInfo := eventList.Datas[0];
    eventList.Delete(0);
    Dispose(eventInfo);
  end;  
end;

procedure TfrmSetDevEvent.GetSelectedEvent;
var
  i: Integer;
  listItem: TListItem;
  eventInfo: PEventInfo;
  e: PEventInfo;
begin
  clearEventList;
  for i := 0 to devEventList.Items.Count - 1 do
  begin
    listItem := devEventList.Items.Item[i];
    if listItem.Checked then
    begin
      eventInfo := listItem.Data;
      if eventInfo <> nil then
      begin
        New(e);
        e^.id := eventInfo^.id;
        e^.No := eventInfo^.No;
        e^.Info := eventInfo^.Info;

        eventList.AddData(e^.id, e);
      end;
    end;
  end;
end;

procedure TfrmSetDevEvent.AddEventsToDev(d: TDevice; setType: Byte);
var
  i: Integer;
  eventInfo: PEventInfo;
  devEvent: PEventInfo;
begin
  devEvent := nil;
  if setType = 1 then
  begin//�����¼�ʱ������գ���׷��
    d.ClrEventList;
  end;
  for i := 0 to eventList.Count - 1 do
  begin
    eventInfo := eventList.Datas[i];
    {
      ���֮ǰ�Ѿ����¼���������ڵ�������ͬ�� ԭ�����󶨵��¼�ID��Ϊ���¼�ID
      ���û����ͬ��ţ���׷����ֱ�Ӹ���ID��ӣ�����Ǹ��¡��޸��򲻴���
    }

    if setType = 1 then
    begin//���µ�ֱ��׷��
      devEvent := d.AddEventInfo(eventInfo^.id);
    end
    else if setType in [2, 3] then
    begin
      devEvent := d.FindEventByEventNo(eventInfo^.No);
      if (devEvent = nil) and (setType = 2) then
        devEvent := d.AddEventInfo(eventInfo^.id);
    end;

    if devEvent <> nil then
    begin
      devEvent^.id := eventInfo^.id;
      devEvent^.No := eventInfo^.No;
      devEvent^.Info := eventInfo^.Info;
    end;
  end;  
end;

procedure TfrmSetDevEvent.DelEventsFromDev(d: TDevice);
var
  i: Integer;
  eventInfo: PEventInfo;
begin
  for i := 0 to eventList.Count - 1 do
  begin
    eventInfo := eventList.Datas[i];
    d.DelEventInfo(eventInfo^.id);
  end;  
end;

procedure TfrmSetDevEvent.FormShow(Sender: TObject);
begin
  ListView1.Items.Item[0].Selected:=true; 
  ListView1Click(ListView1);
end;

end.
