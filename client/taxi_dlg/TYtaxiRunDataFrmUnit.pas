unit TYtaxiRunDataFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, ImgList, ToolWin,
  Grids, DBGridEh, ADOInt, DBClient, adodb, cmdunit,
  PrnDbgeh, EhLibADO, cxControls, cxSplitter,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, EhLibCDS,
  IniFiles, PrViewEh, Printers,uGloabVar,CarUnit;

type
  TTYtaxiRunDataFrm = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    Panel3: TPanel;
    Label5: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label11: TLabel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    ComboBox1: TComboBox;
    Panel4: TPanel;
    DBGridEh1: TDBGridEh;
    cxSplitter2: TcxSplitter;
    Panel7: TPanel;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    TreeView1: TTreeView;
    cxSplitter1: TcxSplitter;
    ImageList1: TImageList;
    DataSource1: TDataSource;
    PrintDBGridEh1: TPrintDBGridEh;
    ComboBox2: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1Change(Sender: TObject);
  private
    procedure AddDev(id: integer; ANode: TTreeNode);
    procedure enabledbutton(flag: boolean);
    procedure ShowData(CarNo, FromDate, ToDate: string; pStartIndex,
      pageSize: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TYtaxiRunDataFrm: TTYtaxiRunDataFrm;

  aqStore: TClientDataSet; {主数据集，一次取全部出来，用adsClone来显示分页数据}
  pageSize: integer; //每页显示条数
  {分页数目}
  pCount: integer;
  {当前第几页码}
  curPage: integer = 1;
  {总共适合条件的记录数}
  pRecordCount: integer;
  {起始查询的点}
  pStartIndex: integer;
  {日期的查询条件}
  FromDate, ToDate: string;
  {
    是否到最后一页
    是否到第一页
  }
  pageEnd, pageStart: boolean;
  {
    判断是上翻还上下翻
  }
  onOff: boolean;

  CarNo: string;

  IsClickDev:Boolean = false;
  clickParent:integer;
implementation

uses CxrunDataFrmUnit;

{$R *.dfm}

procedure TTYtaxiRunDataFrm.FormCreate(Sender: TObject);
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
        sonId: integer;           //子级的 组ID
        leaf_node: TTreenode;     //子级的节点
        grp : TDevGroup;
      begin
        for i:= 0 to ADevGroupManage.Count -1 do
        begin
          if Acurrent_cnt =0 then exit;
          grp :=ADevGroupManage.Items[i];
          //列出大组--父为0
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
    vn_node := TreeView1.Items.add(TreeView1.topitem, '所有车辆');
    vn_node.Data := Pointer(-1); //所有车辆
    vn_node.Expanded := true;
    cnt := ADevGroupManage.Count;
    group_list(0,vn_node,cnt);
  finally
    iniFile.Free;
  end; 
end;

procedure TTYtaxiRunDataFrm.TreeView1Click(Sender: TObject);
var
  grpId : integer;
  devGrp: TDevGroup;
  Node: TTreeNode;
begin
  Node := TreeView1.Selected;
  if Node = nil then exit;
  grpId := Integer(Node.Data);
  if grpId = -1 then
  begin
    Exit;
  end;
  if grpId = -2 then
  begin
    Exit;
  end;
  if (grpId >=0) then //and (not IsClickDev) and (grpId <> clickParent) then
  begin
    AddDev(grpId, Node);
  end;
end;
procedure TTYtaxiRunDataFrm.AddDev(id: integer; ANode: TTreeNode);
var
  i: integer;
  groupId: integer;
  CarList: TListBox;
  CarNo: string;
  node:TTreeNode;
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
    ComboBox2.Items.Clear;
    ComboBox2.Text := '';
    for i:=0 to CarList.Items.Count - 1 do
    begin
      ComboBox2.Items.Add(CarList.Items.Strings[i]);
    end;
  finally
    CarList.Free;
  end;
end;
procedure TTYtaxiRunDataFrm.SpeedButton4Click(Sender: TObject);
begin
  Close;
end;

procedure TTYtaxiRunDataFrm.SpeedButton1Click(Sender: TObject);
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
    CarNo := trim(ComboBox2.Text);
    FromDate := FormatDateTime('yyyy-mm-dd', DateTimePicker1.date);
    ToDate := FormatDateTime('yyyy-mm-dd', DateTimePicker2.date);
    if FromDate > ToDate then
    begin
      Application.MessageBox('开始日期应小于结束日期，请检查！', '提示信息', mb_ok + mb_iconinformation);
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
        MessageBox(0, pchar(E.Message), '提示信息', mb_ok + mb_iconinformation);
        exit;
      end;
    end;
    if Length(CarNo) = 0 then
    begin
      enabledbutton(false);
      Application.MessageBox('请正确填写您要查询的车牌号码!', '提示信息', mb_ok + mb_iconinformation);
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
procedure TTYtaxiRunDataFrm.enabledbutton(flag: boolean);
begin
  BitBtn1.Enabled := flag;
  BitBtn2.Enabled := flag;
  BitBtn3.Enabled := flag;
  BitBtn4.Enabled := flag;
end;
procedure TTYtaxiRunDataFrm.ShowData(CarNo, FromDate, ToDate: string; pStartIndex, pageSize: integer);
var
  Count: integer;
  info: oleVariant;
  Str, aCarNO: string;
  aPos: integer;
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
      Application.MessageBox('按照当前的查询条件没有营运记录！', '提示信息', mb_ok + mb_iconinformation);
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
      Label1.Caption := '共有: ' + inttostr(pCount) + ' 页' + '  ' + '共有: ' + inttostr(pRecordCount) + ' 条记录' +
        ' 当前记录: ' + inttostr((curPage - 1) * pageSize + 1) + '-' +
        inttostr(curPage * pageSize)
    else
      Label1.Caption := '共有: ' + inttostr(pCount) + ' 页' + '  ' + '共有: ' + inttostr(pRecordCount) + ' 条记录' +
        ' 当前记录: ' + inttostr((curPage - 1) * pageSize + 1) + '-' + inttostr(pRecordCount);

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
procedure TTYtaxiRunDataFrm.SpeedButton3Click(Sender: TObject);
var
  Str, str1: string;
begin
  try
    Str := '单客次营运信息';
    PrintDBGridEh1.PageHeader.CenterText.Clear;
    PrintDBGridEh1.PageHeader.CenterText.add(Str);
    PrinterPreview.Previewer.ViewMode := vmPageWidth;
    PrinterPreview.Orientation := poLandscape;
    PrintDBGridEh1.Preview;
  except
  end;
end;

procedure TTYtaxiRunDataFrm.BitBtn1Click(Sender: TObject);
begin
  if pRecordCount = 0 then exit;
  curPage := 1;
  ShowData(CarNo, FromDate, ToDate, (curPage - 1) * pageSize, pageSize);
end;

procedure TTYtaxiRunDataFrm.BitBtn2Click(Sender: TObject);
begin
  if pRecordCount = 0 then exit;
  curPage := curPage - 1;
  if curPage <= 0 then
  begin
    curPage := curPage + 1;
    MessageBox(self.Handle, '已到了首页!', '提示', mb_iconinformation + mb_ok);
    exit;
  end;
  ShowData(CarNo, FromDate, ToDate, (curPage - 1) * pageSize, pageSize);
end;

procedure TTYtaxiRunDataFrm.BitBtn3Click(Sender: TObject);
begin
  if pRecordCount = 0 then exit;
  curPage := curPage + 1;
  if curPage > pCount then
  begin
    curPage := curPage - 1;
    MessageBox(self.Handle, '已到了末页!', '提示', mb_iconinformation + mb_ok);
    exit;
  end;
  ShowData(CarNo, FromDate, ToDate, (curPage - 1) * pageSize, pageSize);
end;

procedure TTYtaxiRunDataFrm.BitBtn4Click(Sender: TObject);
begin
  if pRecordCount = 0 then exit;
  curPage := pCount;
  ShowData(CarNo, FromDate, ToDate, (curPage - 1) * pageSize, pageSize);
end;

procedure TTYtaxiRunDataFrm.ComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
if not (Key in [#8, '0'..'9']) then Key := #0;
end;

procedure TTYtaxiRunDataFrm.ComboBox1Change(Sender: TObject);
var
  pageCount: integer;
begin
  if pRecordCount = 0 then
  begin
    self.ComboBox1.Text := '';
    Application.MessageBox('按照当前的查询条件没有营运记录！', '提示信息', mb_ok + mb_iconinformation);
    exit;
  end;
  try
    pageCount := strtoint(ComboBox1.Text);
  except
    self.ComboBox1.Text := '';
    Application.MessageBox('请正确输入要查询的页码', '提示信息', mb_ok + mb_iconinformation);
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

end.
