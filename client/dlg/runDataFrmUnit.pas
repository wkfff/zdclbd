unit runDataFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, ImgList, ToolWin,
  Grids, DBGridEh, ADOInt, DBClient, adodb, 
  PrnDbgeh, EhLibADO, cxControls, cxSplitter, EhLibCDS,
  IniFiles, PrViewEh, Printers,uGloabVar,cmdunit;

type
  trunDataFrm = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    Panel3: TPanel;
    Label5: TLabel;
    Edit2: TEdit;
    Panel4: TPanel;
    ImageList1: TImageList;
    DataSource1: TDataSource;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    DBGridEh1: TDBGridEh;
    Label3: TLabel;
    Panel7: TPanel;
    PrintDBGridEh1: TPrintDBGridEh;
    cxSplitter1: TcxSplitter;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    TreeView1: TTreeView;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    SpeedButton3: TSpeedButton;
    GroupBox1: TGroupBox;
    SpeedButton4: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label4: TLabel;
    cxSplitter2: TcxSplitter;
    ComboBox1: TComboBox;
    Label11: TLabel;
    Label1: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure ToolButton19Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure DateTimePicker2KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure DBGridEh1DblClick(Sender: TObject);
  private

    procedure AddDev(id: integer; ANode: TTreeNode);
    procedure ShowData(CarNo, FromDate, ToDate: string; pStartIndex,
      pageSize: integer);
    procedure enabledbutton(flag: boolean);
    procedure DsSort(SortColumn: TColumnEh);

    { Private declarations }
  public
    { Public declarations }
  end;

var
  runDataFrm: trunDataFrm;

  aqStore: TClientDataSet; {�����ݼ���һ��ȡȫ����������adsClone����ʾ��ҳ����}
  pageSize: integer; //ÿҳ��ʾ����
  {��ҳ��Ŀ}
  pCount: integer;
  {��ǰ�ڼ�ҳ��}
  curPage: integer = 1;
  {�ܹ��ʺ������ļ�¼��}
  pRecordCount: integer;
  {��ʼ��ѯ�ĵ�}
  pStartIndex: integer;
  {���ڵĲ�ѯ����}
  FromDate, ToDate: string;
  {
    �Ƿ����һҳ
    �Ƿ񵽵�һҳ
  }
  pageEnd, pageStart: boolean;
  {
    �ж����Ϸ������·�
  }
  onOff: boolean;

  CarNo: string;
implementation
uses CxrunDataFrmUnit;
{$R *.dfm}

procedure trunDataFrm.BitBtn2Click(Sender: TObject);
begin
  if pRecordCount = 0 then exit;
  curPage := curPage - 1;
  if curPage <= 0 then
  begin
    curPage := curPage + 1;
    MessageBox(self.Handle, '�ѵ�����ҳ!', '��ʾ', mb_iconinformation + mb_ok);
    exit;
  end;
  ShowData(CarNo, FromDate, ToDate, (curPage - 1) * pageSize, pageSize);
end;

procedure trunDataFrm.ToolButton19Click(Sender: TObject);
begin
  close;
end;

procedure trunDataFrm.ToolButton6Click(Sender: TObject);
begin
  if pRecordCount = 0 then exit;
  curPage := 1;
  ShowData(CarNo, FromDate, ToDate, (curPage - 1) * pageSize, pageSize);
end;

procedure trunDataFrm.ToolButton3Click(Sender: TObject);
begin
  if pRecordCount = 0 then exit;
  curPage := curPage + 1;
  if curPage > pCount then
  begin
    MessageBox(self.Handle, '�ѵ���ĩҳ!', '��ʾ', mb_iconinformation + mb_ok);
    exit;
  end;
  ShowData(CarNo, FromDate, ToDate, (curPage - 1) * pageSize, pageSize);
end;

procedure trunDataFrm.FormCreate(Sender: TObject);
  procedure group_list(AParant_ID:integer;Anode:TTreenode;Acurrent_cnt:integer);
      var
        i:integer;
        leaf_id: array of integer;//�Ӽ��� ID ����
        leaf_cnt:integer; //�Ӽ��� ID  �������
        leaf_node: array of TTreenode;     //�Ӽ��Ľڵ�
      begin
        leaf_cnt:=0;
        for i:=0 to ADevGroupManage.Count - 1 do
        begin
          if ADevGroupManage.Items[i].parent =AParant_ID then
          begin
            leaf_cnt:= leaf_cnt + 1;
            setlength(leaf_id,leaf_cnt);
            setlength(leaf_node,leaf_cnt);
            leaf_id[leaf_cnt -1]:= ADevGroupManage.Items[i].id;
            leaf_node[leaf_cnt -1]:= treeview1.Items.addchild(Anode,trim(ADevGroupManage.items[i].name)+'('+IntToStr(ADevGroupManage.items[i].DevCount)+')');
            leaf_node[leaf_cnt -1].data:= pointer(leaf_id[leaf_cnt -1]);
            Acurrent_cnt:= Acurrent_cnt -1;
            if Acurrent_cnt<=0 then break;

            if ADevGroupManage.Items[i].leaf_nod  = false then
              group_list(leaf_id[leaf_cnt-1],leaf_node[leaf_cnt-1],Acurrent_cnt);
          end;
        end;
      end;
var
  vn_node: TTreeNode;
  cnt: integer;
  j: integer;
  iniFile: TIniFile;
begin
  try
    iniFile := TIniFile.Create(extractfilepath(paramstr(0)) + 'config.ini');
    try
      pageSize := strtoint(iniFile.ReadString('pageSize', 'pageSize', ''));
    except
      pageSize := 48;
    end;
    pRecordCount := 0;
    Label1.Caption := '';
    DateTimePicker2.date := now;
    DateTimePicker1.date := IncMonth(now, -1);
    aqStore := TClientDataSet.Create(nil);
    DataSource1.DataSet := aqStore;
 {*******************************}
    TreeView1.AutoExpand := true;
    TreeView1.Items.Clear;
    if ADevGroupManage.Count = 0 then exit;
    vn_node := TreeView1.Items.add(TreeView1.topitem, '���г���');
    vn_node.Data := Pointer(-1); //���г���
    vn_node.Expanded := true;
    cnt := ADevGroupManage.Count;
    group_list(0,vn_node,cnt);
  finally
    iniFile.Free;
  end;
end;

procedure trunDataFrm.FormDestroy(Sender: TObject);
begin
  aqStore.Free;
end;
procedure trunDataFrm.AddDev(id: integer; ANode: TTreeNode);
var
  i: integer;
  groupId: integer;
  CarList: TListBox;
  CarNo: string;
begin
  try
    CarList := TListBox.Create(nil);
    CarList.Sorted := true;
    CarList.parent := self;
    for i := 0 to ADeviceManage.Count - 1 do
    begin
      groupId := ADeviceManage.Items[i].GroupID;
      if groupId = id then
      begin
        CarNo := ADeviceManage.Items[i].Car.No;
        CarList.Items.Append(CarNo);
      end;
    end;
    for i := 0 to CarList.Items.Count - 1 do
      TreeView1.Items.AddChild(ANode, CarList.Items.Strings[i]);
  finally
    CarList.Free;
  end;
end;
procedure trunDataFrm.enabledbutton(flag: boolean);
begin
  BitBtn1.Enabled := flag;
  BitBtn2.Enabled := flag;
  BitBtn3.Enabled := flag;
  BitBtn4.Enabled := flag;
end;
procedure trunDataFrm.SpeedButton1Click(Sender: TObject);
var
  m: integer;
  FCursor: TCursor;
  i, aPos: integer;
  Str, aCarNO: string;
begin
  screen.Cursor := FCursor;
  try
    FCursor := -11;
    Application.ProcessMessages;
    CarNo := trim(Edit2.Text);
    FromDate := FormatDateTime('yyyy-mm-dd', DateTimePicker1.date);
    ToDate := FormatDateTime('yyyy-mm-dd', DateTimePicker2.date);
    if FromDate > ToDate then
    begin
      Application.MessageBox('��ʼ����ӦС�ڽ������ڣ����飡', '��ʾ��Ϣ', mb_ok + mb_iconinformation);
      exit;
    end;

    aPos := pos('(', CarNo);
    if aPos > 0 then
      aCarNO := Copy(CarNo, 1, aPos - 1)
    else
      aCarNO := CarNo;

    try
      pRecordCount := BS.QueryRunDataCount(aCarNO, FromDate, ToDate);
    except
      on E: Exception do
      begin
        MessageBox(0, pchar(E.Message), '��ʾ��Ϣ', mb_ok + mb_iconinformation);
        exit;
      end;
    end;
    if Length(CarNo) = 0 then
    begin
      enabledbutton(false);
      Application.MessageBox('����ȷ��д��Ҫ��ѯ�ĳ��ƺ���!', '��ʾ��Ϣ', mb_ok + mb_iconinformation);
      exit;
    end;
    m := pRecordCount mod pageSize;
    if m = 0 then
      pCount := pRecordCount div pageSize
    else
      pCount := pRecordCount div pageSize + 1;
    curPage := 1;
    ShowData(CarNo, FromDate, ToDate, (curPage - 1) * pageSize, pageSize);
    ComboBox1.Items.Clear;
    for i := 1 to pCount do
      ComboBox1.Items.add(inttostr(i));

    for i := 0 to DBGridEh1.Columns.Count - 1 do
      DBGridEh1.Columns.Items[i].Title.TitleButton := true;
  finally
    FCursor := 0;
  end;
end;

procedure trunDataFrm.ShowData(CarNo, FromDate, ToDate: string; pStartIndex, pageSize: integer);
var
  Count: integer;
  info: oleVariant;
  Str, aCarNO: string;
  aPos: integer;
    //opts : TIndexOptions;
begin
  try
    screen.Cursor := crHourGlass;
    Label1.Visible := true;
    if pRecordCount = 0 then
    begin
      enabledbutton(false);
      DataSource1.Enabled := false;
      ComboBox1.Items.Clear;
      ComboBox1.Text := '';
      Label1.Visible := false;
      Application.MessageBox('���յ�ǰ�Ĳ�ѯ����û��Ӫ�˼�¼��', '��ʾ��Ϣ', mb_ok + mb_iconinformation);
      exit;
    end;

    aPos := pos('(', CarNo);
    if aPos > 0 then
      aCarNO := Copy(CarNo, 1, aPos - 1)
    else
      aCarNO := CarNo;

    Count := BS.QueryRunData(aCarNO, FromDate, ToDate, pStartIndex, pageSize, info);
    aqStore.Data := info;
    ComboBox1.Text := inttostr(curPage);
    if curPage < pCount then
      Label1.Caption := '����: ' + inttostr(pCount) + ' ҳ' + '  ' + '����: ' + inttostr(pRecordCount) + ' ����¼' +
        ' ��ǰ��¼: ' + inttostr((curPage - 1) * pageSize + 1) + '-' +
        inttostr(curPage * pageSize)
    else
      Label1.Caption := '����: ' + inttostr(pCount) + ' ҳ' + '  ' + '����: ' + inttostr(pRecordCount) + ' ����¼' +
        ' ��ǰ��¼: ' + inttostr((curPage - 1) * pageSize + 1) + '-' + inttostr(pRecordCount);

    DataSource1.Enabled := true;
    if (curPage = 1) and (curPage = pCount) then
    begin
      BitBtn1.Enabled := false;
      BitBtn2.Enabled := false;
      BitBtn3.Enabled := false;
      BitBtn4.Enabled := false;
    end
    else if (curPage > 1) and (curPage < pCount) then
    begin
      BitBtn1.Enabled := true;
      BitBtn2.Enabled := true;
      BitBtn3.Enabled := true;
      BitBtn4.Enabled := true;
    end
    else if curPage = pCount then
    begin
      BitBtn1.Enabled := true;
      BitBtn2.Enabled := true;
      BitBtn3.Enabled := false;
      BitBtn4.Enabled := false;
    end
    else if (curPage = 1) and (pCount > 1) then
    begin
      BitBtn1.Enabled := false;
      BitBtn2.Enabled := false;
      BitBtn3.Enabled := true;
      BitBtn4.Enabled := true;
    end;
  finally
    screen.Cursor := crDefault;
  end;
end;

procedure trunDataFrm.DsSort(SortColumn: TColumnEh);
var
  OldIndex: string;
begin
  if (SortColumn.Grid.DataSource = nil) or (SortColumn.Grid.DataSource.DataSet = nil) or (not SortColumn.Grid.DataSource.DataSet.Active) then exit;
  OldIndex := TClientDataSet(SortColumn.Field.DataSet).IndexName;
  if OldIndex <> '' then
  begin
    TClientDataSet(SortColumn.Field.DataSet).IndexName := '';
    TClientDataSet(SortColumn.Field.DataSet).DeleteIndex(OldIndex);
  end;
  case SortColumn.Title.SortMarker of
    smNoneEh,
      smUpEh: TClientDataSet(SortColumn.Field.DataSet).AddIndex('px', SortColumn.Field.FieldName, [ixDescending]);
    smDownEh: TClientDataSet(SortColumn.Field.DataSet).AddIndex('px', SortColumn.Field.FieldName, [ixPrimary]);
  end;
  TClientDataSet(SortColumn.Field.DataSet).IndexName := 'px';
end;

procedure trunDataFrm.TreeView1Click(Sender: TObject);
var
  Node: TTreeNode;
  id: integer;
begin
  Node := TreeView1.Selected;
  if Node = nil then exit;
  if not Node.HasChildren then
  begin
    try
      id := PDevGroup(Node.Data)^.id;
    except
      if Assigned(runDataFrm) = true then
        runDataFrm.Edit2.Text := Node.Text;
      exit;
    end;
    AddDev(id, Node);
  end;
end;

procedure trunDataFrm.SpeedButton2Click(Sender: TObject);
var
  pageCount: integer;
begin
  if pRecordCount = 0 then
  begin
    Application.MessageBox('���յ�ǰ�Ĳ�ѯ����û��Ӫ�˼�¼��', '��ʾ��Ϣ', mb_ok + mb_iconinformation);
    exit;
  end;
  try
    pageCount := strtoint(ComboBox1.Text);
  except
    Application.MessageBox('������Ҫ��ѯ����ȷҳ��', '��ʾ��Ϣ', mb_ok + mb_iconinformation);
    exit;
  end;
  if pageCount > pCount then
  begin
    pageCount := pCount;
    curPage := pCount;
    ComboBox1.Text := inttostr(pageCount);
  end else
  begin
    curPage := pageCount;
  end;
  ShowData(CarNo, FromDate, ToDate, (curPage - 1) * pageSize, pageSize);
end;

procedure trunDataFrm.ToolButton1Click(Sender: TObject);
begin
  PrintDBGridEh1.Preview;
end;

procedure trunDataFrm.BitBtn1Click(Sender: TObject);
begin
  if pRecordCount = 0 then exit;
  curPage := 1;
  ShowData(CarNo, FromDate, ToDate, (curPage - 1) * pageSize, pageSize);
end;

procedure trunDataFrm.BitBtn3Click(Sender: TObject);
begin
  if pRecordCount = 0 then exit;
  curPage := curPage + 1;
  if curPage > pCount then
  begin
    curPage := curPage - 1;
    MessageBox(self.Handle, '�ѵ���ĩҳ!', '��ʾ', mb_iconinformation + mb_ok);
    exit;
  end;
  ShowData(CarNo, FromDate, ToDate, (curPage - 1) * pageSize, pageSize);
end;

procedure trunDataFrm.BitBtn4Click(Sender: TObject);
begin
  if pRecordCount = 0 then exit;
  curPage := pCount;
  ShowData(CarNo, FromDate, ToDate, (curPage - 1) * pageSize, pageSize);
end;

procedure trunDataFrm.SpeedButton3Click(Sender: TObject);
var
  Str, str1: string;
begin
  try
    Str := '���ʹ�Ӫ����Ϣ';
    PrintDBGridEh1.PageHeader.CenterText.Clear;
    PrintDBGridEh1.PageHeader.CenterText.add(Str);
    PrinterPreview.Previewer.ViewMode := vmPageWidth;
    PrinterPreview.Orientation := poLandscape;
    PrintDBGridEh1.Preview;
  except
  end;
end;

procedure trunDataFrm.SpeedButton4Click(Sender: TObject);
begin
  close;
end;

procedure trunDataFrm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#8, '0'..'9']) then Key := #0;
end;

procedure trunDataFrm.ComboBox1Change(Sender: TObject);
var
  pageCount: integer;
begin
  if pRecordCount = 0 then
  begin
    self.ComboBox1.Text := '';
    Application.MessageBox('���յ�ǰ�Ĳ�ѯ����û��Ӫ�˼�¼��', '��ʾ��Ϣ', mb_ok + mb_iconinformation);
    exit;
  end;
  try
    pageCount := strtoint(ComboBox1.Text);
  except
    self.ComboBox1.Text := '';
    Application.MessageBox('����ȷ����Ҫ��ѯ��ҳ��', '��ʾ��Ϣ', mb_ok + mb_iconinformation);
    exit;
  end;
  if pageCount <= 0 then exit;
  if pageCount > pCount then
  begin
    pageCount := pCount;
    curPage := pCount;
    ComboBox1.Text := inttostr(pageCount);
  end else
  begin
    curPage := pageCount;
  end;
  ShowData(CarNo, FromDate, ToDate, (curPage - 1) * pageSize, pageSize);
end;

procedure trunDataFrm.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#8, '0'..'9']) then Key := #0;
end;

procedure trunDataFrm.DateTimePicker2Change(Sender: TObject);
begin
// SpeedButton1.Click;
end;

procedure trunDataFrm.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    DateTimePicker1.SetFocus;
end;

procedure trunDataFrm.DateTimePicker2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    SpeedButton1.Click; ;
end;

procedure trunDataFrm.DBGridEh1TitleClick(Column: TColumnEh);
begin
 //DsSort(Column);
end;

procedure trunDataFrm.DBGridEh1DblClick(Sender: TObject);
var
  frm: TCxrunDataFrm;
begin
  try
    try
      frm := TCxrunDataFrm.Create(nil);
      frm.Edit1.Text := aqStore.FieldValues['carNo'];
      frm.Edit2.Text := aqStore.FieldValues['TradeType'];
      frm.Edit3.Text := aqStore.FieldValues['OnDate'];
      frm.Edit4.Text := aqStore.FieldValues['OnTime'];
      frm.Edit5.Text := aqStore.FieldValues['OffTime'];
      frm.Edit6.Text := aqStore.FieldValues['WaitTime'];
      frm.Edit7.Text := FormatFloat('0.00',aqStore.FieldValues['xslc']);
      frm.Edit8.Text := FormatFloat('0.00',aqStore.FieldValues['yyje']);
      frm.Edit9.Text := FormatFloat('0.00',aqStore.FieldValues['dj']);
      frm.Edit10.Text := FormatFloat('0.00',aqStore.FieldValues['kslc']);
      if frm.Edit2.Text <> '�ֽ�' then
      begin
        frm.Edit11.Text := aqStore.FieldValues['ICCardFaceNo'];
        frm.Edit12.Text := aqStore.FieldValues['ICCardInNO'];
        frm.Edit13.Text := aqStore.FieldValues['ICCardMoney_BeforeTrade'];
        frm.Edit14.Text := aqStore.FieldValues['ICCardMoney_AfterTrade'];
        frm.Edit15.Text := aqStore.FieldValues['ICCardTradeNumber'];
        frm.Edit16.Text := aqStore.FieldValues['TradeNo'];
        frm.Edit17.Text := aqStore.FieldValues['Tac'];
        frm.Edit18.Text := aqStore.FieldValues['DriverNo'];
        frm.Edit19.Text := aqStore.FieldValues['PSAMCardNo'];
        frm.Edit20.Text := aqStore.FieldValues['PosMachineNo'];
      end;
    except
    end;
    frm.ShowModal;
  finally
    frm.Free;
  end;
end;

end.

