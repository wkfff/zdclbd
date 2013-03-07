unit QueryDevMonthRunInfoFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ComCtrls, cxControls,
  cxSplitter, ExtCtrls, CarUnit, uGloabVar, DBClient, DB, PrnDbgeh,
  PrViewEh, Printers, EhLibADO;

type
  TQueryDevMonthRunInfoFrm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel3: TPanel;
    SpeedButtonTjDay: TSpeedButton;
    SpeedButtonPrintDay: TSpeedButton;
    Panel4: TPanel;
    cxSplitter2: TcxSplitter;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    TreeView1: TTreeView;
    PanelSelectGroupName: TPanel;
    DataSource1: TDataSource;
    PrintDBGridEh1: TPrintDBGridEh;
    ClientDataSet1: TClientDataSet;
    BitButtonExcelDay: TBitBtn;
    BitBtnClose: TBitBtn;
    Label1: TLabel;
    ComboBoxCarNoDay: TComboBox;
    DBGridEh1: TDBGridEh;
    Label7: TLabel;
    ComboBoxTjYf: TComboBox;
    EditSpeed: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure SpeedButtonTjDayClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure SpeedButtonPrintDayClick(Sender: TObject);
    procedure BitBtnCloseClick(Sender: TObject);
    procedure BitButtonExcelDayClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditSpeedKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure InitEdit;
    procedure ExpandTreeView;
    procedure ListGroup;
    procedure AddDev(id: integer; ANode: TTreeNode);
  public
    { Public declarations }
  end;

var
  QueryDevMonthRunInfoFrm: TQueryDevMonthRunInfoFrm;
  group_id: integer = -1;

  ExcelApp, MyWorkbook: oleVariant;
implementation
uses ComObj,DateUtils, BusinessServerUnit;
{$R *.dfm}


procedure TQueryDevMonthRunInfoFrm.ExpandTreeView;
var
  i: integer;
begin
  for i := 0 to TreeView1.Items.Count - 1 do
    TreeView1.Items[i].Expanded := True;
end;

procedure TQueryDevMonthRunInfoFrm.InitEdit;
var
  i: Integer;
begin
  PageControl1.ActivePageIndex := 0;
   ComboBoxTjYf.Clear;
  for i:= 0 to 23 do
    ComboBoxTjYf.Items.Add(FormatDateTime('yyyy-mm', IncMonth(now,-i)));
  ComboBoxTjYf.ItemIndex := 0;
  EditSpeed.Text := '60';
end;

procedure TQueryDevMonthRunInfoFrm.ListGroup;
  function ListSon(ASonId: integer; Anode: TTreeNode; leastCnt: integer): integer;
  var
    grp: TDevGroup;
    leaf_node: TTreeNode;
    j, sonId: integer;
  begin
    grp := ADevGroupManage.Find(AsonId);
    leaf_node := treeview1.Items.AddChild(
      Anode, grp.name + '(' + inttostr(grp.DevListCount) + ')');
    leaf_node.Data := pointer(grp.Id);
    leastCnt := leastCnt - 1;
    result := leastCnt;
    if leastCnt = 0 then exit;

    if not grp.leaf_nod then
      for j := 0 to grp.SonListCount - 1 do
      begin
        sonId := grp.SonList[j];
        ListSon(sonId, leaf_node, leastCnt);
      end;
  end;
  procedure group_list(AParant_ID: integer; Anode: TTreenode; Acurrent_cnt: integer);
  var
    i, j: integer;
    sonId: integer; //子级的 组ID
    leaf_node: TTreenode; //子级的节点
    grp: TDevGroup;
  begin
    for i := 0 to ADevGroupManage.Count - 1 do
    begin
      if Acurrent_cnt = 0 then exit;
      grp := ADevGroupManage.Items[i];
          //列出大组--父为0
      if grp.parent = AParant_ID then
      begin
        leaf_node := treeview1.Items.AddChild(
          Anode, grp.name + '(' + inttostr(grp.DevListCount) + ')');
        leaf_node.Data := pointer(grp.Id);
        Acurrent_cnt := Acurrent_cnt - 1;
        if Acurrent_cnt = 0 then exit;

        if not grp.leaf_nod then
          for j := 0 to grp.SonListCount - 1 do
          begin
            sonId := grp.SonList[j];
            Acurrent_cnt := ListSon(sonId, leaf_node, Acurrent_cnt);
          end;
      end;
    end;
  end;
var
  vn_node: TTreeNode;
  cnt: integer;
  j: integer;
begin
 {*******************************}
  TreeView1.AutoExpand := true;
  TreeView1.Items.Clear;
  if ADevGroupManage.Count = 0 then exit;
  vn_node := TreeView1.Items.add(TreeView1.topitem, '所有车辆');
  vn_node.Data := Pointer(-1); //所有车辆
  vn_node.Expanded := true;
  cnt := ADevGroupManage.Count;
  group_list(0, vn_node, cnt);
  ExpandTreeView;
end;

procedure TQueryDevMonthRunInfoFrm.SpeedButtonTjDayClick(Sender: TObject);
var
  devidStr : string;
  dev: TDevice;
  speed:Integer;
begin
  TSpeedButton(Sender).Enabled := False;
  try
    if ComboBoxCarNoDay.Text = '' then
    begin
      MessageBox(Handle,'请您选择或输入车牌号!','提示',MB_OK + MB_ICONINFORMATION);
      ComboBoxCarNoDay.SetFocus;
      Exit;
    end;
    if ComboBoxTjYf.Text ='' then
    begin
      MessageBox(Handle,'请您选择或输入统计月份!','提示',MB_OK + MB_ICONINFORMATION);
      ComboBoxTjYf.SetFocus;
      Exit;
    end;
    if Trim(EditSpeed.Text)='' then
      EditSpeed.Text := '60';
    speed := StrToInt(EditSpeed.Text);

    dev:=TDevice(ComboBoxCarNoDay.Items.Objects[ComboBoxCarNoDay.ItemIndex]);
    DataSource1.Enabled := false;
    ClientDataSet1.Data := BS.QueryDevMonthRunInfo(dev.IdStr,ComboBoxTjYf.Text,speed);
    DataSource1.Enabled := true;
  finally
    TSpeedButton(Sender).Enabled :=True;
  end;
end;

procedure TQueryDevMonthRunInfoFrm.FormCreate(Sender: TObject);
begin
  InitEdit;
  ListGroup;
  PageControl1.ActivePageIndex := 0;
  PanelSelectGroupName.Caption := '所有车辆';
end;

procedure TQueryDevMonthRunInfoFrm.TreeView1Click(Sender: TObject);

var
  devGrp: TDevGroup;
  Node: TTreeNode;
begin
  Node := TreeView1.Selected;
  if Node = nil then exit;
  PanelSelectGroupName.Caption := Node.Text;
  group_id := Integer(Node.Data);
  if (group_id >= 0) then
  begin
    AddDev(group_id, Node);
  end;
end;

procedure TQueryDevMonthRunInfoFrm.AddDev(id: integer; ANode: TTreeNode);
var
  i: integer;
  dev: TDevice;
begin
  try
    ComboBoxCarNoDay.Clear;
    for i := 0 to ADeviceManage.Count - 1 do
    begin
      dev := ADeviceManage.Items[i];
      if dev = nil then Continue;
      if dev.GroupID= id then
      begin
        ComboBoxCarNoDay.Items.AddObject(dev.Car.No,dev);
      end;
    end; 
  finally
  end;
end;

procedure TQueryDevMonthRunInfoFrm.SpeedButtonPrintDayClick(Sender: TObject);
var
  str,s: string;
begin
  try
    if ComboBoxCarNoDay.Text <>'' then
      s:= '['+ComboBoxCarNoDay.Text+']';
    if group_id <>-1 then
      s:= ADevGroupManage.Find(group_id).Name + #13#10#13#10+ s;
    str := s+ ' 每月报告('+Trim(ComboBoxTjYf.Text)+')';
    PrintDBGridEh1.PageHeader.CenterText.Clear;
    PrintDBGridEh1.PageHeader.CenterText.add(str);
    PrintDBGridEh1.PageFooter.LeftText.Clear;
    PrintDBGridEh1.PageFooter.LeftText.Add('打印时间：'+FormatDateTime('yyyy-mm-dd hh:nn',now));
    PrintDBGridEh1.PageFooter.RightText.Clear;
    PrintDBGridEh1.PageFooter.RightText.Add(ReportFooter);
    PrinterPreview.Previewer.ViewMode := vmPageWidth;
    PrinterPreview.Orientation := poPortrait;
    PrintDBGridEh1.Preview;
  except
  end;
end;

procedure TQueryDevMonthRunInfoFrm.BitBtnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TQueryDevMonthRunInfoFrm.BitButtonExcelDayClick(Sender: TObject);
var
  i, j: Integer;
  s: string;
  Str: string;
  fromDatetime, toDatetime: string;
  tmpStr: string;
begin
  if ClientDataSet1.RecordCount =0 then exit;
  screen.Cursor := crHourGlass;
  try
    try
      ExcelApp := CreateOleObject('Excel.Application');
      MyWorkbook := CreateOleObject('Excel.Sheet');
    except
      on Exception do raise Exception.Create('无法运行EXCEL!请确认已安装!')
    end;
    try
      ExcelApp.Visible := true;
    //增加一个工作表
      MyWorkbook := ExcelApp.workBooks.add;
    //单元格合并
      MyWorkbook.worksheets[1].range['A1:I1'].Merge(true);
    //单元格居中
      MyWorkbook.worksheets[1].range['A1:I2'].HorizontalAlignment := $FFFFEFF4;
    //报表头
      if ComboBoxCarNoDay.Text <>'' then
        s:= '['+ComboBoxCarNoDay.Text+']';
      if group_id <>-1 then
        s:= ADevGroupManage.Find(group_id).Name + #13#10#13#10+ s;
      str := s+ ' 每月报告('+Trim(ComboBoxTjYf.Text)+')';
      MyWorkbook.worksheets[1].Cells[1, 1].value := Str;
    //表头
      i := 2;
      for j:=1 to DBGridEh1.Columns.Count do
      begin
        if not DBGridEh1.Columns.Items[j-1].Visible then Continue;
        MyWorkbook.worksheets[1].Cells[i, j].value := DBGridEh1.Columns.Items[j-1].Title.Caption;
      end;
    //字体颜色
      MyWorkbook.worksheets[1].range['A1:I2'].Font.Color := clBlue;
    //字体
      MyWorkbook.worksheets[1].range['A1:I1'].Font.Name := '隶书';
    //字号
      MyWorkbook.worksheets[1].range['A1:I1'].Font.Size := 18;
    //取数
      i := 3;
      ClientDataSet1.First;
      while not ClientDataSet1.Eof do
      begin
        for j := 1 to  DBGridEh1.Columns.Count do
        begin
          if not DBGridEh1.Columns.Items[j-1].Visible then Continue;
          tmpStr := DBGridEh1.Columns.Items[j-1].FieldName;
          MyWorkbook.worksheets[1].Cells[i, j].value := ClientDataSet1.FieldValues[tmpStr];
        end;
        ClientDataSet1.Next;
        Inc(i);
      end;

      //加入合计行  　
      MyWorkbook.worksheets[1].Cells[i, 1].value :='合计:';
      MyWorkbook.worksheets[1].Cells[i, 2].value := DBGridEh1.Columns[1].Footer.SumValue;
    //设置单元格格式
      MyWorkbook.worksheets[1].range['B'+IntToStr(ClientDataSet1.RecordCount+3)+':B'+IntToStr(ClientDataSet1.RecordCount+3)].NumberFormatLocal := '0';

    //设置列宽
      for j := 1 to DBGridEh1.Columns.Count do
        MyWorkbook.worksheets[1].Columns[j].ColumnWidth :=10;
      MyWorkbook.worksheets[1].Columns[2].ColumnWidth :=18;
      MyWorkbook.worksheets[1].Columns[3].ColumnWidth :=18;

    //设置行高
      MyWorkbook.worksheets[1].Rows[1].RowHeight := 50;
    //报表头居中
      MyWorkbook.worksheets[1].Rows[1].VerticalAlignment := $FFFFEFF4;
    {//设置数据行字体
      s := 'A1:K' + inttostr(ClientDataSet1.RecordCount - 2);
      MyWorkbook.worksheets[1].range[s].Font.Name := '仿宋';
    //划表线
      s := 'A2:K' + inttostr(ClientDataSet1.RecordCount + 2);
      MyWorkbook.worksheets[1].range[s].Borders.LineStyle := 1;  }
    //设置页面
      MyWorkbook.worksheets[1].PageSetup.CenterHorizontally := true;
      MyWorkbook.worksheets[1].PageSetup.PrintTitleRows := 'A1';
      MyWorkbook.worksheets[1].PageSetup.PaperSize := $9;
    except
    end;
  finally
    screen.Cursor := crDefault;
  end;               
end;

procedure TQueryDevMonthRunInfoFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ManualDock(nil);
end;


procedure TQueryDevMonthRunInfoFrm.EditSpeedKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then
    key := #0;
end;

end.

