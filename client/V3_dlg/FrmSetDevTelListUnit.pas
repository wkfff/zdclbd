unit FrmSetDevTelListUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzPanel, RzRadGrp, RzListVw, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, IntegerListUnit, CarUnit;

type
  TfrmSetDevTelList = class(TForm)
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
    rzListView: TRzListView;
    Panel3: TPanel;
    Panel1: TPanel;
    btnSend: TBitBtn;
    btnCancel: TBitBtn;
    btnAdd: TBitBtn;
    btnModify: TBitBtn;
    btnDel: TBitBtn;
    rbgSetOption: TRzRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnModifyClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure BitBtnSelClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
    dev: TDevice;
    Cancel: Boolean;
    TelList: TIntegerList;

    procedure clearTelList;
    procedure ReLoadTelList(Dev:TDevice);
    procedure GetSelectedTel;
    procedure AddTelToDev(d: TDevice; setType: Byte);
    function SaveTelListToDB(Dev:TDevice):boolean;    
  public
    { Public declarations }
  end;


implementation
uses
  uFrmSelectDevs, uGloabVar, ConstDefineUnit, TelInfoFrmUnit;

{$R *.dfm}

procedure TfrmSetDevTelList.FormCreate(Sender: TObject);
begin
  dev := TDevice.Create;
  TelList := TIntegerList.Create;
end;

procedure TfrmSetDevTelList.FormShow(Sender: TObject);
begin
  ListView1.Items.Item[0].Selected:=true; 
  ListView1Click(ListView1);
end;

procedure TfrmSetDevTelList.FormDestroy(Sender: TObject);
begin
  dev.Free;
  clearTelList;
  TelList.Free;
end;

procedure TfrmSetDevTelList.clearTelList;
var
  pTel: PTelInfo;
begin
  while TelList.Count > 0 do
  begin
    pTel := TelList.Datas[0];
    TelList.Delete(0);
    Dispose(pTel);
  end;
end;

procedure TfrmSetDevTelList.ReLoadTelList(Dev: TDevice);
var
  i: integer;
  pTel: PTelInfo;
  telType: string;
begin
  rzListView.Clear;
  for i:= 0 to Dev.TelList.Count-1 do
  begin
    with rzListView.Items.Add do
    begin
      pTel := Dev.TelItems[i];
      data:= pTel;
      Caption := IntToStr(i + 1);//序号
      SubItems.Add(pTel^.Name);
      SubItems.Add(pTel^.No);          
      case pTel^.TelType of
        TELSTATE_TALKRESTRICT    : telType := '允许呼入，禁止呼出';
        TELSTATE_ENABLEIN_NOTOUT : telType := '允许呼出，禁止呼入';
        TELSTATE_ENABLEOUT_NOTIN : telType := '允许呼出、呼入';
        TELSTATE_DISABLE : telType := '禁止通话';
      end;
      SubItems.Add(telType);
      SubItems.Add(IntToStr(pTel^.id));
      Checked := True;
    end;
  end;
end;

procedure TfrmSetDevTelList.ListView1Click(Sender: TObject);
var
  D:TDevice;
  J:integer;
  pTel: PTelInfo;
  t: PTelInfo;
begin
  if ListView1.Selected =nil then exit;
  D:=TDevice(ListView1.Selected.Data);
  Dev.ClrTelList;
  for j:=0 to D.TelList.Count-1 do
  begin
    t := FAllDevTelList.GetTelInfoById(D.TelItems[j]^.id);
    if t <> nil then
    begin
      pTel := Dev.AddTelInfo(t^.id);
      pTel^.No := t^.No;
      pTel^.Name := t^.Name;
      pTel^.TelType := t^.TelType;
    end;
  end;
  ReLoadTelList(Dev);
end;

procedure TfrmSetDevTelList.btnAddClick(Sender: TObject);
var
  dlg : TTelInfoFrm;
  addTelId: Integer;
  pTel: PTelInfo;
  i:integer;
begin
  if rzListView.Items.Count >= 15 then
  begin
    messagebox(handle,pchar('已有15条电话信息，不能再添加！'),'提示',mb_ok + mb_iconinformation);
    exit;
  end;

  dlg := TTelInfoFrm.Create(nil);
  try
    dlg.EditTelId.Text := '';
    dlg.EditTelNo.Text := '';
    dlg.EditTelName.Text := '';
    dlg.PanelControl.Caption := '增加电话信息';
    if dlg.ShowModal = mrok then
    begin
      dlg.EditTelNo.Text:=Trim(dlg.EditTelNo.Text);
      for i:=0 to rzListView.Items.Count-1 do
      begin
        if rzListView.Items.Item[i].SubItems[0] = dlg.EditTelName.Text then
        begin
          MessageBox(Self.Handle,PChar('电话本里已设置了联系人['+dlg.EditTelName.Text+']的号码'),PChar('提示'),$40);
          exit;
        end;
      end;

      try
        addTelId := Bs.AddDevTel(dlg.EditTelNo.Text, dlg.EditTelName.Text, dlg.ComboBoxTelType.ItemIndex + 1,'');
      except
        on E: Exception do
        begin
          messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
          exit;
        end;
      end;

      if addTelId > 0 then
      begin
        pTel := Dev.AddTelInfo(addTelId);
        pTel^.No := dlg.EditTelNo.Text;
        pTel^.Name := dlg.EditTelName.Text;
        pTel^.TelType := dlg.ComboBoxTelType.ItemIndex+1;

        pTel := FAllDevTelList.AddTelInfo(addTelId);
        pTel^.No := dlg.EditTelNo.Text;
        pTel^.Name := dlg.EditTelName.Text;
        pTel^.TelType := dlg.ComboBoxTelType.ItemIndex+1;
                
        ReLoadTelList(Dev);
      end;
    end;
  finally
    dlg.Free;
  end;
end;

procedure TfrmSetDevTelList.btnModifyClick(Sender: TObject);
var
  dlg: TTelInfoFrm;
  pInfo: PTelInfo;
  i : Integer;
begin
  if rzListView.SelCount = 0 then exit;
  pInfo := PTelInfo(rzListView.Selected.Data);
  dlg := TTelInfoFrm.Create(nil);
  try
    dlg.EditTelId.Text   := IntToStr(pInfo^.Id);
    dlg.EditTelNo.Text   := pInfo^.No;
    dlg.EditTelName.Text := pInfo^.Name;
    dlg.ComboBoxTelType.ItemIndex := pInfo^.TelType-1;
    dlg.PanelControl.Caption := '修改电话信息';
    if dlg.ShowModal = mrok then
    begin
      if pInfo^.No <> dlg.EditTelNo.Text then
      begin
        for i:=0 to rzListView.Items.Count-1 do
        begin
          if rzListView.Items.Item[i].SubItems[0] = dlg.EditTelNo.Text then
          begin
            MessageBox(Self.Handle,PChar('电话本里已有'+dlg.EditTelNo.Text+'这个号码'),PChar('提示'),$40);
            exit;
          end;
        end;
      end;
      pInfo := Dev.FindTelInfo(StrToInt(dlg.EditTelId.Text));
      if pInfo <> nil then
      begin
        pInfo^.No      := dlg.EditTelNo.Text;
        pInfo^.Name    := dlg.EditTelName.Text;
        pInfo^.TelType := dlg.ComboBoxTelType.ItemIndex+1;

        pInfo := FAllDevTelList.GetTelInfoById(pInfo^.id);
        if pInfo <> nil then
        begin
          pInfo^.No      := dlg.EditTelNo.Text;
          pInfo^.Name    := dlg.EditTelName.Text;
          pInfo^.TelType := dlg.ComboBoxTelType.ItemIndex+1;

          try
            Bs.ModifyDevTelList_ATelInfo(GCurSelectDev,pInfo);
          except
            on E: Exception do
            begin
              messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
              exit;
            end;
          end;
        end;
        ReLoadTelList(Dev);
      end;
    end;
  finally
    dlg.free;
  end;
end;

procedure TfrmSetDevTelList.btnDelClick(Sender: TObject);
var
  pTel: PTelInfo;
begin
  if rzListView.SelCount = 0 then
  begin
    MessageBox(handle,'请您单击选中要删除的电话信息','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  pTel := rzListView.Selected.Data;
  if pTel <> nil then
  begin
    if MessageBox(handle,pchar('您确定要删除电话【 '+pTel^.No+' 】信息?'),
      '提示',MB_YESNO + MB_ICONQUESTION)=Id_No then
      exit;
    try //暂不删除数据库中的电话信息
      //Bs.DeleteDevTelList_ATelInfo(pTel^.Id);
    except
      on E: exception do
      begin
        messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
        Exit;
      end;
    end;
    Dev.DelTelInfo(pTel^.Id);
    ReLoadTelList(Dev);
  end;
end;

procedure TfrmSetDevTelList.btnCancelClick(Sender: TObject);
begin
  Cancel := True;
end;

procedure TfrmSetDevTelList.btnSendClick(Sender: TObject);
var
  setType: Byte;
  i: Integer;
  D: TDevice;
begin
  if ListView1.Items.Count <= 0 then
  begin
    MessageBox(Handle, '请选择需设置事件的车辆', '提示', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  setType := rbgSetOption.ItemIndex;
  if setType = 0 then
  begin//删除所有
    if MessageBox(Handle, '您确认删除所有电话本吗？', '确认', MB_YESNO + MB_ICONQUESTION) = IdNo then
      Exit;
    Panel4.Enabled:=false;
    Panel111.Enabled:=false;
    Panel5.Visible:=true;
    ProgressBar1.Max:=ListView1.Items.Count*5*10;
    TbitBtn(Sender).Enabled:=false;
    clearTelList;
    try
      for i:=0 to ListView1.Items.Count -1 do
      begin
        if Cancel then
        begin
          if messagebox(handle, '是否确实要取消对剩余车辆的操作？', '提示', MB_YESNO + MB_ICONQUESTION) = ID_YES then
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
        D.ClrTelList;
        ProgressBar1.StepIt;
        ProgressBar1.StepIt;
        DataServer.SetTelList(D, TelList, setType); // 发送数据
        ProgressBar1.StepIt;
        SaveTelListToDB(D);
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
  else if (setType = 1) or (setType = 2) or (setType = 3) then
  begin//更新、追加、修改
    GetSelectedTel;
    if TelList.Count <= 0 then
    begin
      MessageBox(Handle, '请至少选中一个联系人电话', '提示', MB_OK + MB_ICONINFORMATION);
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
          if messagebox(handle, '是否确实要取消对剩余车辆的操作？', '提示', MB_YESNO + MB_ICONQUESTION) = ID_YES then
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
        DataServer.SetTelList(D, TelList, setType); // 发送数据
        ProgressBar1.StepIt;
        AddTelToDev(D, setType);
        SaveTelListToDB(D);
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

procedure TfrmSetDevTelList.BitBtnSelClick(Sender: TObject);
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

procedure TfrmSetDevTelList.BitBtn5Click(Sender: TObject);
begin
  if ListView1.Items.Count =1 then
  begin
     messagebox(handle,'车辆里只有一辆车,不能删除了!','提示',mb_ok + mb_iconinformation);
  end
  else
  begin
    ListView1.DeleteSelected;
  end;
end;

function TfrmSetDevTelList.SaveTelListToDB(Dev: TDevice): boolean;
var
 i:integer;
 idList: string;
begin
  idList := '';
  Result:=false;
  if Dev = nil then exit;
  if Dev.TelList.Count >= 1 then
  begin
    idList := IntToStr(Dev.TelItems[0]^.id);
  end;
  for i:=1 to Dev.TelList.Count -1 do
  begin
    idList := idList + ',' + IntToStr(Dev.TelItems[i]^.id);
  end;
  Bs.ModifyDev_TelList(Dev.id, idList);
  Result:=true;
end;

procedure TfrmSetDevTelList.GetSelectedTel;
var
  i: Integer;
  listItem: TListItem;
  pTel: PTelInfo;
  p: PTelInfo;
begin
  clearTelList;
  for i := 0 to rzListView.Items.Count - 1 do
  begin
    listItem := rzListView.Items.Item[i];
    if listItem.Checked then
    begin
      pTel := listItem.Data;
      if pTel <> nil then
      begin
        New(p);
        p^.id := pTel^.id;
        p^.No := pTel^.No;
        p^.Name := pTel^.Name;
        p^.TelType := pTel^.TelType;
        TelList.AddData(p^.id, p);
      end;
    end;
  end;
end;

procedure TfrmSetDevTelList.AddTelToDev(d: TDevice; setType: Byte);
var
  i: Integer;
  pTel: PTelInfo;
  devTel: PTelInfo;
begin
  devTel := nil;
  if setType = 1 then
  begin//更新事件时，先清空，再追加
    d.ClrTelList;
  end;
  for i := 0 to TelList.Count - 1 do
  begin
    pTel := TelList.Datas[i];
    {
      如果之前已经有事件编号与现在的设置相同则将 原车机绑定的事件ID换为新事件ID
      如果没有相同编号，是追加则直接根据ID添加，如果是更新、修改则不处理
    }

    if setType = 1 then
    begin//更新的直接追加
      devTel := d.AddTelInfo(pTel^.id);
    end
    else if setType in [2, 3] then
    begin
      devTel := d.FindTelInfoByName(pTel^.Name);
      if (devTel = nil) and (setType = 2) then
        devTel := d.AddTelInfo(pTel^.id);
    end;

    if devTel <> nil then
    begin
      devTel^.id := pTel^.id;
      devTel^.No := pTel^.No;
      devTel^.Name := pTel^.Name;
      devTel^.TelType := pTel^.TelType;
    end;
  end;
end;

end.
