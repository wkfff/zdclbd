unit SetDevTelListFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, ActnList, Menus, Buttons,
  cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit, cxInplaceContainer,
  cxControls,CarUnit;

type
  TSetDevTelListFrm = class(TForm)
    ActionList1: TActionList;
    AddTel: TAction;
    ModifyTel: TAction;
    DelTel: TAction;
    ClrTel: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Panel111: TPanel;
    Panel2: TPanel;
    cxDevTelList: TcxTreeList;
    Tel_Id: TcxTreeListColumn;
    Tel_No: TcxTreeListColumn;
    Tel_Name: TcxTreeListColumn;
    Tel_Type: TcxTreeListColumn;
    Panel3: TPanel;
    Label1: TLabel;
    EditCarNO: TEdit;
    Panel1: TPanel;
    BitBtnOk: TBitBtn;
    BitBtnCancel: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Telid: TcxTreeListColumn;
    procedure AddTelExecute(Sender: TObject);
    procedure ModifyTelExecute(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DelTelExecute(Sender: TObject);
    procedure ClrTelExecute(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure AddTelNum(Dev:TDevice);
    procedure ModifyTelNum(Dev:TDevice);
    procedure DelTelNum(Dev:TDevice);
    procedure ClrTelNum(Dev:TDevice);
    function  TelNumSaveToDB(Dev:TDevice):boolean;
  public
    { Public declarations }
    //�г���ǰ�����ġ��绰��
    procedure ReLoadTelList(Dev:TDevice);overload;
    procedure ReLoadTelList;overload;
  end;

var
  SetDevTelListFrm: TSetDevTelListFrm;

implementation
  uses TelInfoFrmUnit,uGloabvar,ConstDefineUnit;
{$R *.dfm}


procedure TSetDevTelListFrm.ReLoadTelList;
var
  i: integer;
  pInfo: PTelInfo;
begin
  cxDevTelList.BeginUpdate;
  cxDevTelList.Clear;
  for i:= 0 to GCurSelectDev.TelList.Count-1 do
  begin
    with cxDevTelList.Add do
    begin
      pInfo := GCurSelectDev.TelItems[i];
      data:= pInfo;
      Values[0]:= i+1;//���
      Values[1]:= pInfo^.No;
      Values[2]:= pInfo^.Name;
      case pInfo^.TelType of
        TELSTATE_TALKRESTRICT    : Values[3] := '������룬�������';
        TELSTATE_ENABLEIN_NOTOUT : Values[3] := '������룬��ֹ����';
        TELSTATE_ENABLEOUT_NOTIN : Values[3] := '�������������';
        TELSTATE_DISABLE : Values[3] := '��ֹͨ��';
      end;
    end;
  end;
  cxDevTelList.EndUpdate;
end;

procedure TSetDevTelListFrm.ReLoadTelList(Dev:TDevice);
var
  i: integer;
  pInfo: PTelInfo;
begin
  cxDevTelList.BeginUpdate;
  cxDevTelList.Clear;
  for i:= 0 to Dev.TelList.Count-1 do
  begin
    with cxDevTelList.Add do
    begin
      pInfo := Dev.TelItems[i];
      data:= pInfo;
      Values[0]:= i+1;//���
      Values[1]:= pInfo^.No;
      Values[2]:= pInfo^.Name;
      case pInfo^.TelType of
        TELSTATE_TALKRESTRICT    : Values[3] := '������룬��ֹ����';
        TELSTATE_ENABLEIN_NOTOUT : Values[3] := '�����������ֹ����';
        TELSTATE_ENABLEOUT_NOTIN : Values[3] := '�������������';
        TELSTATE_DISABLE : Values[3] := '��ֹͨ��';
      end;
      Values[4] := pInfo^.id;
    end;
  end;
  cxDevTelList.EndUpdate;
end;

procedure TSetDevTelListFrm.AddTelExecute(Sender: TObject);
var
  dlg : TTelInfoFrm;
  addTelId: Integer;
  pTel: PTelInfo;
begin
  if GCurSelectDev.TelList.Count =20 then
  begin
    messagebox(handle,pchar('����'+GCurSelectDev.car.no+'����20���绰��Ϣ����������ӣ�'),'��ʾ',mb_ok + mb_iconinformation);
    exit;
  end;

  dlg := TTelInfoFrm.Create(nil);
  try
    dlg.EditTelId.Text := '';
    dlg.EditTelNo.Text := '';
    dlg.EditTelName.Text := '';
    dlg.PanelControl.Caption := AddTel.Caption;
    dlg.ComboBoxTelType.ItemIndex:=1;
    dlg.ShowModal;
    if dlg.ModalResult = mrok then
    begin
      //�����ݿ⡡�ó����绰���С���һ���绰
      addTelId := Bs.AddDevTel(dlg.EditTelNo.Text,
        dlg.EditTelName.Text,dlg.ComboBoxTelType.ItemIndex,'');
      pTel := GCurSelectDev.AddTelInfo(addTelId);
      pTel^.No := dlg.EditTelNo.Text;
      pTel^.Name := dlg.EditTelName.Text;
      pTel^.TelType := dlg.ComboBoxTelType.ItemIndex;
      ReLoadTelList;
    end;
  finally
    dlg.Free;
  end;
end;

procedure TSetDevTelListFrm.AddTelNum(Dev:TDevice);
var
  dlg : TTelInfoFrm;
  addTelId: Integer;
  pTel: PTelInfo;
  i:integer;
begin
  if cxDevTelList.Count>=15 then
  begin
    messagebox(handle,pchar('����15���绰��Ϣ����������ӣ�'),'��ʾ',mb_ok + mb_iconinformation);
    exit;
  end;

  dlg := TTelInfoFrm.Create(nil);
  try
    dlg.EditTelId.Text := '';
    dlg.EditTelNo.Text := '';
    dlg.EditTelName.Text := '';
    dlg.PanelControl.Caption := AddTel.Caption;
    dlg.ShowModal;
    if dlg.ModalResult = mrok then
    begin
      dlg.EditTelNo.Text:=Trim(dlg.EditTelNo.Text);
      for i:=0 to cxDevTelList.Count-1 do
      begin
        if cxDevTelList.Items[i].Values[1]=dlg.EditTelNo.Text then
        begin
          MessageBox(Self.Handle,PChar('�绰��������'+dlg.EditTelNo.Text+'�������'),PChar('��ʾ'),$40);
          exit;
        end;
      end;

            //�����ݿ⡡�ó����绰���С���һ���绰
      try
        addTelId := Bs.AddDevTel(dlg.EditTelNo.Text,
          dlg.EditTelName.Text,dlg.ComboBoxTelType.ItemIndex+1,'');
      except
      on E: Exception do
      begin
        messagebox(handle, QUERY_WARNING_INFO, '��ʾ', mb_ok + mb_iconinformation);
        exit;
      end;
    end;

      pTel := Dev.AddTelInfo(addTelId);
      pTel^.No := dlg.EditTelNo.Text;
      pTel^.Name := dlg.EditTelName.Text;
      pTel^.TelType := dlg.ComboBoxTelType.ItemIndex+1;
      ReLoadTelList(Dev);
    end;
  finally
    dlg.Free;
  end;
end;



procedure TSetDevTelListFrm.ModifyTelExecute(Sender: TObject);
var
  dlg: TTelInfoFrm;
  pInfo: PTelInfo;
begin
  if cxDevTelList.SelectionCount =0 then exit;
  pInfo := PTelInfo(cxDevTelList.Selections[0].Data);
  dlg := TTelInfoFrm.Create(nil);
  try
    dlg.EditTelId.Text   := IntToStr(pInfo^.Id);
    dlg.EditTelNo.Text   := pInfo^.No;
    dlg.EditTelName.Text := pInfo^.Name;
    dlg.ComboBoxTelType.ItemIndex := pInfo^.TelType;
    dlg.PanelControl.Caption := ModifyTel.Caption;
    dlg.ShowModal;
    if dlg.ModalResult = mrok then
    begin
      pInfo := GCurSelectDev.FindTelInfo(StrToInt(dlg.EditTelId.Text));
      pInfo^.No      := dlg.EditTelNo.Text;
      pInfo^.Name    := dlg.EditTelName.Text;
      pInfo^.TelType := dlg.ComboBoxTelType.ItemIndex;
      Bs.ModifyDevTelList_ATelInfo(GCurSelectDev,pInfo);
      ReLoadTelList;
    end;
  finally
    dlg.free;
  end;
end;

procedure TSetDevTelListFrm.ModifyTelNum(Dev:TDevice);
var
  dlg: TTelInfoFrm;
  pInfo: PTelInfo;
  i : Integer;
begin
  if cxDevTelList.SelectionCount =0 then exit;
  pInfo := PTelInfo(cxDevTelList.Selections[0].Data);
  dlg := TTelInfoFrm.Create(nil);
  try
    dlg.EditTelId.Text   := IntToStr(pInfo^.Id);
    dlg.EditTelNo.Text   := pInfo^.No;
    dlg.EditTelName.Text := pInfo^.Name;
    dlg.ComboBoxTelType.ItemIndex := pInfo^.TelType-1;
    dlg.PanelControl.Caption := ModifyTel.Caption;
    dlg.ShowModal;
    if dlg.ModalResult = mrok then
    begin
      if pInfo^.No <> dlg.EditTelNo.Text then
      begin
        for i:=0 to cxDevTelList.Count-1 do
        begin
          if cxDevTelList.Items[i].Values[1]=dlg.EditTelNo.Text then
          begin
            MessageBox(Self.Handle,PChar('�绰��������'+dlg.EditTelNo.Text+'�������'),PChar('��ʾ'),$40);
            exit;
          end;
        end;
      end;
      pInfo := Dev.FindTelInfo(StrToInt(dlg.EditTelId.Text));
      pInfo^.No      := dlg.EditTelNo.Text;
      pInfo^.Name    := dlg.EditTelName.Text;
      pInfo^.TelType := dlg.ComboBoxTelType.ItemIndex+1;
      try
        Bs.ModifyDevTelList_ATelInfo(GCurSelectDev,pInfo);
      except
        on E: Exception do
        begin
          messagebox(handle, QUERY_WARNING_INFO, '��ʾ', mb_ok + mb_iconinformation);
          exit;
        end;
      end;
      ReLoadTelList(Dev);
    end;
  finally
    dlg.free;
  end;
end;


procedure TSetDevTelListFrm.BitBtn1Click(Sender: TObject);
begin
  if cxDevTelList.Count =0 then
  begin
    messagebox(handle,'���ڳ����绰��Ϊ�գ�����ӵ绰��Ϣ��','��ʾ',mb_ok + mb_iconinformation);
    exit;
  end;
  ModalResult := mrOk;
end;

procedure TSetDevTelListFrm.DelTelExecute(Sender: TObject);
var
  pTel: PTelInfo;
begin
  if cxDevTelList.SelectionCount =0 then
  begin
    MessageBox(handle,'����ѡ��Ҫɾ���ĵ绰��Ϣ','��ʾ',mb_ok + mb_iconinformation);
    exit;
  end;
  pTel := PTelInfo(cxDevTelList.Selections[0].Data);
  if MessageBox(handle,pchar('��ȷ��Ҫɾ���绰 '+pTel^.No+' ����Ϣ?'),
    '��ʾ',MB_YESNO + MB_ICONQUESTION)=Id_No then
    exit;
  Bs.DeleteDevTelList_ATelInfo(pTel^.Id);
  GCurSelectDev.DelTelInfo(pTel^.Id);
  ReLoadTelList;
end;

procedure TSetDevTelListFrm.DelTelNum(Dev:TDevice);
var
  pTel: PTelInfo;
begin
  if cxDevTelList.SelectionCount =0 then
  begin
    MessageBox(handle,'����ѡ��Ҫɾ���ĵ绰��Ϣ','��ʾ',mb_ok + mb_iconinformation);
    exit;
  end;
  pTel := PTelInfo(cxDevTelList.Selections[0].Data);
  if MessageBox(handle,pchar('��ȷ��Ҫɾ���绰 '+pTel^.No+' ����Ϣ?'),
    '��ʾ',MB_YESNO + MB_ICONQUESTION)=Id_No then
    exit;
  try
    Bs.DeleteDevTelList_ATelInfo(pTel^.Id);
  except
    on E: Exception do
    begin
      messagebox(handle, QUERY_WARNING_INFO, '��ʾ', mb_ok + mb_iconinformation);
      exit;
    end;
  end;
  Dev.DelTelInfo(pTel^.Id);
  ReLoadTelList(Dev);
end;

procedure TSetDevTelListFrm.ClrTelExecute(Sender: TObject);
begin
  if cxDevTelList.Count =0 then
    exit;
  if MessageBox(handle,'��ȷ��Ҫ����绰������ɾ�����е绰��Ϣ��','��ʾ',MB_YESNO + MB_ICONQUESTION)= id_no then
    exit;
  Bs.DeleteDevTelList(GCurSelectDev.IdStr);
  GCurSelectDev.ClrTelList;
  ReLoadTelList;
end;

procedure TSetDevTelListFrm.ClrTelNum(Dev:TDevice);
begin
  if cxDevTelList.Count =0 then
    exit;
  if MessageBox(handle,'��ȷ��Ҫ����绰������ɾ�����е绰��Ϣ��','��ʾ',MB_YESNO + MB_ICONQUESTION)= id_no then
    exit;
  //Bs.DeleteDevTelList(GCurSelectDev.IdStr);
  Dev.ClrTelList;
  ReLoadTelList(Dev);
end;

function TSetDevTelListFrm.TelNumSaveToDB(Dev:TDevice):boolean;
var
 i:integer;
 idList: string;
begin
  idList := '';
  Result:=false;
  if ADeviceManage.Find(Dev.IdStr)=nil then exit; 
  //Bs.DeleteDevTelList(Dev.IdStr);
  if Dev.TelList.Count >= 1 then
  begin
    idList := IntToStr(Dev.TelItems[0].id);
  end;
  for i:=1 to Dev.TelList.Count -1 do
  begin

    idList := idList + ',' + IntToStr(Dev.TelItems[i].id);
  end;
  Bs.ModifyDev_TelList(Dev.id, idList);
  Result:=true;
end;



end.
