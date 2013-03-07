unit ReadDevTelListFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, ActnList, Menus, Buttons,
  cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit, cxInplaceContainer,
  cxControls,CarUnit;

type
  TReadDevTelListFrm = class(TForm)
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
    Panel6: TPanel;
    Panel5: TPanel;
    cxReadedList: TcxTreeList;
    cxTreeListColumn1: TcxTreeListColumn;
    cxTreeListColumn2: TcxTreeListColumn;
    cxTreeListColumn3: TcxTreeListColumn;
    cxTreeListColumn4: TcxTreeListColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    PanelProgress: TPanel;
    ProgressBar1: TProgressBar;
    Panel4: TPanel;
    BitBtn_AddAllList: TBitBtn;
    BitBtn_AddSelect: TBitBtn;
    ReloadOldTel: TAction;
    N6: TMenuItem;
    N7: TMenuItem;
    SaveReadedTelListToDB: TAction;
    cxStyle2: TcxStyle;
    procedure AddTelExecute(Sender: TObject);
    procedure ModifyTelExecute(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DelTelExecute(Sender: TObject);
    procedure ClrTelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ReloadOldTelExecute(Sender: TObject);
    procedure BitBtn_AddSelectClick(Sender: TObject);
    procedure BitBtn_AddAllListClick(Sender: TObject);
    procedure SaveReadedTelListToDBExecute(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure AddTelNum(ADev:TDevice);
    procedure ModifyTelNum(ADev:TDevice);
    procedure DelTelNum(ADev:TDevice);
    procedure ClrTelNum(ADev:TDevice);
    function  TelNumSaveToDB(ADev:TDevice):boolean;
  public
    TempDev:TDevice; // 临时交换用，暂存用户设置
    ReadedDev:TDevice; //读取到的车机数据
    OldDev:TDevice; //车机列表中的
    { Public declarations }
    //列出当前车机的　电话本
    procedure ReLoadTelList(ADev:TDevice);
    //刷新读取的电话本
    procedure RefreshReadedList();

    //处理读取到的车机电话本---一段内存数据
    function ProcessReaded(ABuf: PByte):Boolean;
  end;

var
  ReadDevTelListFrm: TReadDevTelListFrm;

implementation
  uses TelInfoFrmUnit,uGloabvar,ConstDefineUnit,CmdStructUnit;
{$R *.dfm}

procedure TReadDevTelListFrm.ReLoadTelList(ADev:TDevice);
var
  i: integer;
  pInfo: PTelInfo;
begin
  cxDevTelList.BeginUpdate;
  cxDevTelList.Clear;
  for i:= 0 to ADev.TelList.Count-1 do
  begin
    with cxDevTelList.Add do
    begin
      pInfo := ADev.TelItems[i];
      data:= pInfo;
      Values[0]:= i+1;//序号
      Values[1]:= pInfo^.No;
      Values[2]:= pInfo^.Name;
      case pInfo^.TelType of
        TELSTATE_TALKRESTRICT    : Values[3] := '允许呼入，允许呼出';
        TELSTATE_ENABLEIN_NOTOUT : Values[3] := '允许呼入，禁止呼出';
        TELSTATE_ENABLEOUT_NOTIN : Values[3] := '允许呼出，禁止呼入';
        TELSTATE_DISABLE : Values[3] := '禁止通话';
      end;
    end;
  end;
  cxDevTelList.EndUpdate;
end;

procedure TReadDevTelListFrm.AddTelExecute(Sender: TObject);
begin
  AddTelNum(TempDev);
end;

procedure TReadDevTelListFrm.AddTelNum(ADev:TDevice);
var
  dlg : TTelInfoFrm;
//  addTelId: Integer;
  pTel: PTelInfo;
  i:integer;
begin
  if cxDevTelList.Count>=20 then
  begin
    messagebox(handle,pchar('已有20条电话信息，不能再添加！'),'提示',mb_ok + mb_iconinformation);
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
      //往数据库　该车机电话本中　加一个电话
      {addTelId := Bs.AddADevTel(GCurSelectADev,dlg.EditTelNo.Text,
        dlg.EditTelName.Text,dlg.ComboBoxTelType.ItemIndex);  }
      dlg.EditTelNo.Text:=Trim(dlg.EditTelNo.Text);
      for i:=0 to cxDevTelList.Count-1 do
      begin
        if cxDevTelList.Items[i].Values[1]=dlg.EditTelNo.Text then
        begin
          MessageBox(Self.Handle,PChar('电话本里已有'+dlg.EditTelNo.Text+'这个号码'),PChar('提示'),$40);
          exit;
        end;
      end;
      pTel := ADev.AddTelInfo;
      pTel^.No := dlg.EditTelNo.Text;
      pTel^.Name := dlg.EditTelName.Text;
      pTel^.TelType := dlg.ComboBoxTelType.ItemIndex;
      ReLoadTelList(ADev);
    end;
  finally
    dlg.Free;
  end;
end;    

procedure TReadDevTelListFrm.ModifyTelExecute(Sender: TObject);
begin
  ModifyTelNum(TempDev);
end;

procedure TReadDevTelListFrm.ModifyTelNum(ADev:TDevice);
var
  dlg: TTelInfoFrm;
  pInfo: PTelInfo;
  i: Integer;
begin
  if cxDevTelList.SelectionCount = 0 then exit;
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
      if pInfo^.No <> dlg.EditTelNo.Text then
      begin
        for i:=0 to cxDevTelList.Count-1 do
        begin
          if cxDevTelList.Items[i].Values[1]=dlg.EditTelNo.Text then
          begin
            MessageBox(Self.Handle,PChar('电话本里已有'+dlg.EditTelNo.Text+'这个号码'),PChar('提示'),$40);
            exit;
          end;
        end;
      end;     
      pInfo := ADev.FindTelInfo(StrToInt(dlg.EditTelId.Text));
      pInfo^.No      := dlg.EditTelNo.Text;
      pInfo^.Name    := dlg.EditTelName.Text;
      pInfo^.TelType := dlg.ComboBoxTelType.ItemIndex;
      //Bs.ModifyADevTelList_ATelInfo(GCurSelectADev,pInfo);
      ReLoadTelList(ADev);
    end;
  finally
    dlg.free;
  end;
end;


procedure TReadDevTelListFrm.BitBtn1Click(Sender: TObject);
var
  j:integer;
  d:TDevice;
  telInfo:PTelInfo;
begin
  if cxDevTelList.Count<=0 then
  begin
    if messagebox(handle,'您确定要删除所有的电话本吗？','删除选项',MB_OKCANCEL + MB_ICONQUESTION)= ID_CANCEL then
       exit;
  end;
  Panel111.Enabled:=false;
  PanelProgress.Visible:=true;
  ProgressBar1.Max:= TempDev.TelList.Count*5;
  TbitBtn(Sender).Enabled:=false;
  try
    d:= OldDev;
    d.ClrTelList;
    ProgressBar1.StepIt;
    Application.ProcessMessages;
    for j:=0 to TempDev.TelList.Count-1 do //当=0时,,是删除电话本里的内容.
    begin
      telInfo:= d.AddTelInfo;
      telInfo^.No:=TempDev.TelItems[j].No;
      telInfo^.Name:=TempDev.TelItems[j].Name;
      telInfo^.TelType:=TempDev.TelItems[j].TelType;
    end;

    ProgressBar1.StepIt;
    Application.ProcessMessages;
    DataServer.SetTelList(d);//
    ProgressBar1.StepIt;
    Application.ProcessMessages;
    TelNumSaveToDB(d);      //
    ProgressBar1.StepIt;
    Application.ProcessMessages;        
  finally
    Panel111.Enabled:=true;
    PanelProgress.Visible:=false;
    TbitBtn(Sender).Enabled:=true;
  end;
 Close;
end;

procedure TReadDevTelListFrm.DelTelExecute(Sender: TObject);
begin
  DelTelNum(TempDev);
end;

procedure TReadDevTelListFrm.DelTelNum(ADev:TDevice);
var
  pTel: PTelInfo;
begin
  if cxDevTelList.SelectionCount =0 then
  begin
    MessageBox(handle,'请您选择要删除的电话信息','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  pTel := PTelInfo(cxDevTelList.Selections[0].Data);
  if MessageBox(handle,pchar('您确定要删除电话 '+pTel^.No+' 的信息?'),
    '提示',MB_YESNO + MB_ICONQUESTION)=Id_No then
    exit;
 // Bs.DeleteADevTelList_ATelInfo(pTel^.Id);
  ADev.DelTelInfo(pTel^.Id);
  ReLoadTelList(ADev);
end;

procedure TReadDevTelListFrm.ClrTelExecute(Sender: TObject);
begin
  ClrTelNum(TempDev);
end;

procedure TReadDevTelListFrm.ClrTelNum(ADev:TDevice);
begin
  if cxDevTelList.Count =0 then
    exit;
  if MessageBox(handle,'您确定要清除电话本，即删除所有电话信息？','提示',MB_YESNO + MB_ICONQUESTION)= id_no then
    exit;
  //Bs.DeleteADevTelList(GCurSelectADev.IdStr);
  ADev.ClrTelList;
  ReLoadTelList(ADev);
end;

function TReadDevTelListFrm.TelNumSaveToDB(ADev:TDevice):boolean;
var
 i:integer;
begin
  Result:=false;
  if ADeviceManage.Find(ADev.Id)=nil then exit;
  Bs.DeleteDevTelList(ADev.IdStr);
  for i:=0 to ADev.TelList.Count -1 do
  begin
    Bs.AddDevTel(ADev.TelItems[i].No,ADev.TelItems[i].Name,ADev.TelItems[i].TelType,'' );
  end;
  Result:=true;
end; 

procedure TReadDevTelListFrm.FormCreate(Sender: TObject);
begin
  TempDev := TDevice.Create;
  ReadedDev := TDevice.Create;
end;

procedure TReadDevTelListFrm.RefreshReadedList();
var
  i: integer;
  pInfo: PTelInfo;
begin
  cxReadedList.BeginUpdate;
  cxReadedList.Clear;
  for i:= 0 to ReadedDev.TelList.Count-1 do
  begin
    with cxReadedList.Add do
    begin
      pInfo := ReadedDev.TelItems[i];
      data:= pInfo;
      Values[0]:= i+1;//序号
      Values[1]:= pInfo^.No;
      Values[2]:= pInfo^.Name;
      case pInfo^.TelType of
        TELSTATE_TALKRESTRICT    : Values[3] := '允许呼入，允许呼出';
        TELSTATE_ENABLEIN_NOTOUT : Values[3] := '允许呼入，禁止呼出';
        TELSTATE_ENABLEOUT_NOTIN : Values[3] := '允许呼出，禁止呼入';
        TELSTATE_DISABLE : Values[3] := '禁止通话';
      end;
    end;
  end;
  cxReadedList.EndUpdate;
end;

function TReadDevTelListFrm.ProcessReaded(ABuf: PByte): Boolean;
var
  pCmd: PCmdSrvTermRetReadDevTelList;
  buf:array of byte;
  bufLen,bufPos: Integer;
  telInfo:PTelInfo;
  telNumber,telName:string;
  telType,telNumberLen: byte;
begin
  Result := False;
  pCmd := PCmdSrvTermRetReadDevTelList(ABuf);
  OldDev := ADeviceManage.find(pCmd^.DevId);
  if OldDev = nil then exit;
  EditCarNO.Text := OldDev.Car.No;
  //列出系统中的电话本 (原有的)
  ReloadOldTel.Execute;
  ReadedDev.Id := OldDev.Id;
  ReadedDev.ClrTelList;
  //读取到的电话本
  bufLen := pCmd^.Size - SizeOf(TCmdSrvTermRetReadDevTelList);
  SetLength(buf,bufLen);
  copyMemory(@buf[0],PByte(Integer(pCmd)+SizeOf(TCmdSrvTermRetReadDevTelList)),buflen);
  bufPos := 0;
  SetLength(telName,8);
  while bufPos < bufLen do
  begin
    try
      telType := buf[bufPos];
      bufPos := bufPos + 1;
      CopyMemory(@telName[1],@buf[bufPos],8);
      bufPos := bufPos + 8;
      telNumberLen := buf[bufPos];
      bufPos := bufPos + 1;
      SetLength(telNumber,telNumberLen);
      CopyMemory(@telNumber[1],@buf[bufPos],telNumberLen);
      bufPos := bufPos + telNumberLen;

      telInfo:= ReadedDev.AddTelInfo;
      telInfo^.No:= telNumber;
      telInfo^.Name:= telName;
      telInfo^.TelType:= telType;
    except
    end;
  end;
  //列出读取到的
  RefreshReadedList;
  Result := True;
end;

procedure TReadDevTelListFrm.ReloadOldTelExecute(Sender: TObject);  //列出原有的 系统中的电话本
var
  j:integer;
  telinfo:PTelInfo;
begin
  TempDev.ClrTelList;
  for j:=0 to OldDev.TelList.Count-1 do
  begin
    telInfo:= TempDev.AddTelInfo;
    telInfo^.No:=OldDev.TelItems[j].No;
    telInfo^.Name:=OldDev.TelItems[j].Name;
    telInfo^.TelType:=OldDev.TelItems[j].TelType;
  end;
  ReLoadTelList(TempDev);
end;

procedure TReadDevTelListFrm.BitBtn_AddSelectClick(Sender: TObject);
var
  pTel,findTel,telInfo : PTelInfo;
begin
  if cxReadedList.SelectionCount =0 then
  begin
    MessageBox(Handle,'请先在左边列表中选择一条要移到右边列表的信息!','提示',MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  pTel := PTelInfo(cxReadedList.Selections[0].Data);

  findTel := TempDev.FindTelInfoByNumber(pTel.No);
  if findTel <> nil then
  begin
    findTel^.Name := pTel^.Name;
    findTel^.TelType := pTel^.TelType;
  end
  else
  begin
    if cxDevTelList.Count>=20 then
    begin
      MessageBox(handle,pchar('已有20条电话信息，不能再添加！'),'提示',mb_ok + mb_iconinformation);
      exit;
    end;
    telInfo := TempDev.AddTelInfo;
    telInfo^.No := pTel^.No;
    telInfo^.Name := pTel^.Name;
    telInfo^.TelType := pTel^.TelType;
  end;
  ReLoadTelList(TempDev);
end;

procedure TReadDevTelListFrm.BitBtn_AddAllListClick(Sender: TObject);
var
  i: Integer;
begin
  for i:= 0 to cxReadedList.Count -1 do
  begin
    cxReadedList.Items[i].Focused:= true;
    BitBtn_AddSelect.Click;
  end;  
end;

procedure TReadDevTelListFrm.SaveReadedTelListToDBExecute(Sender: TObject);
var
  j : Integer;
  telInfo :PTelInfo;
begin
  TelNumSaveToDB(ReadedDev);   //将读取的保存到数据库中。
  OldDev.ClrTelList;                 //将系统中电话本 清空
  for j:= 0 to ReadedDev.TelList.Count -1 do
  begin
    telInfo := OldDev.AddTelInfo;
    telInfo^.No := ReadedDev.TelItems[j].No;
    telInfo^.Name := ReadedDev.TelItems[j].Name;
    telInfo^.TelType := ReadedDev.TelItems[j].TelType;
  end;
  ReloadOldTel.Execute;    //重载系统中的 到临时
  ReLoadTelList(TempDev);
end;

end.
