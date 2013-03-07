unit TjAreaWarnFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ComCtrls, cxControls,
  cxSplitter, ExtCtrls, CarUnit, uGloabVar, DBClient, DB, PrnDbgeh,
  PrViewEh, Printers, EhLibADO;

type
  TTjAreaWarnFrm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel3: TPanel;
    SpeedButtonTjDay: TSpeedButton;
    Label3: TLabel;
    SpeedButtonPrintDay: TSpeedButton;
    Panel4: TPanel;
    cxSplitter2: TcxSplitter;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    TreeView1: TTreeView;
    PanelSelectGroupName: TPanel;
    Label1: TLabel;
    ComboBoxWarnType: TComboBox;
    DataSource1: TDataSource;
    PrintDBGridEh1: TPrintDBGridEh;
    ClientDataSet1: TClientDataSet;
    DBGridEh1: TDBGridEh;
    BitButtonExcelDay: TBitBtn;
    BitBtnClose: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    TabSheet3: TTabSheet;
    PrintDBGridEh2: TPrintDBGridEh;
    DataSource2: TDataSource;
    ClientDataSet2: TClientDataSet;
    cxSplitter1: TcxSplitter;
    Panel1: TPanel;
    DBGridEh2: TDBGridEh;
    Panel2: TPanel;
    SpeedButtonTjMonth: TSpeedButton;
    SpeedButtonPrintMonth: TSpeedButton;
    Label6: TLabel;
    ComboBoxWarnTypeMonth: TComboBox;
    BitBtnExcelMonth: TBitBtn;
    BitBtnCloseMonth: TBitBtn;
    ComboBoxTjYf: TComboBox;
    Label4: TLabel;
    procedure SpeedButtonTjDayClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure SpeedButtonPrintDayClick(Sender: TObject);
    procedure BitBtnCloseClick(Sender: TObject);
    procedure BitButtonExcelDayClick(Sender: TObject);
    procedure SpeedButtonTjMonthClick(Sender: TObject);
    procedure SpeedButtonPrintMonthClick(Sender: TObject);
    procedure BitBtnExcelMonthClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure InitEdit;
    procedure ExpandTreeView;
    procedure ListGroup;
  public
    { Public declarations }
  end;

var
  TjAreaWarnFrm: TTjAreaWarnFrm;
  group_id: integer = -1;

  ExcelApp, MyWorkbook: oleVariant;
implementation
uses ComObj,DateUtils;
{$R *.dfm}


procedure TTjAreaWarnFrm.ExpandTreeView;
var
  i: integer;
begin
  for i := 0 to TreeView1.Items.Count - 1 do
    TreeView1.Items[i].Expanded := True;
end;

procedure TTjAreaWarnFrm.InitEdit;
var
  i: Integer;
begin
  DateTimePicker1.date := now;
  PageControl1.ActivePageIndex := 0;
  ComboBoxTjYf.Clear;
  for i:= 0 to 23 do
    ComboBoxTjYf.Items.Add(FormatDateTime('yyyy-mm', IncMonth(now,-i)));
  ComboBoxTjYf.ItemIndex := 0;
end;

procedure TTjAreaWarnFrm.ListGroup;
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

procedure TTjAreaWarnFrm.SpeedButtonTjDayClick(Sender: TObject);
var
  fromDate, toDate: string;
  warnType: Integer;
begin
  SpeedButtonTjDay.Enabled := False;
  try
    fromDate :=FormatDatetime('yyyy-mm-dd ',DateTimePicker1.Date)+'00:00:00';
    toDate:=FormatDatetime('yyyy-mm-dd ',DateTimePicker1.Date)+'23:59:59';
    if ComboBoxWarnType.ItemIndex =-1 then
      warnType := -1
    else
      warnType := ComboBoxWarnType.ItemIndex+1;

    DataSource1.Enabled := false;
    ClientDataSet1.Data := BS.TjAreaWarn(fromDate, toDate, group_id, warnType);
    DataSource1.Enabled := true;
  finally
    SpeedButtonTjDay.Enabled :=True;
  end;
end;

procedure TTjAreaWarnFrm.FormCreate(Sender: TObject);
begin
  InitEdit;
  ListGroup;
  PageControl1.ActivePageIndex := 0;
  PanelSelectGroupName.Caption := '所有车辆';
end;

procedure TTjAreaWarnFrm.TreeView1Click(Sender: TObject);

var
  devGrp: TDevGroup;
  Node: TTreeNode;
begin
  Node := TreeView1.Selected;
  if Node = nil then exit;
  PanelSelectGroupName.Caption := Node.Text;
  group_id := Integer(Node.Data);
end;

procedure TTjAreaWarnFrm.SpeedButtonPrintDayClick(Sender: TObject);
var
  str,tmpStr,fromDate: string;
begin
  try
    if group_id <>-1 then
      str:= ADevGroupManage.Find(group_id).Name
    else
      str:= '全部车辆';
    if ComboBoxWarnType.Text <>'' then
      tmpStr :='--'+ComboBoxWarnType.Text
    else
      tmpStr := '--驶入和驶出';
    fromDate :=FormatDatetime('yyyy-mm-dd ',DateTimePicker1.Date);
    Str := str +' '+ fromDate + ' 进出区域报警日统计'+tmpStr;
    PrintDBGridEh1.PageHeader.CenterText.Clear;
    PrintDBGridEh1.PageHeader.CenterText.add(Str);
    PrintDBGridEh1.PageFooter.LeftText.Clear;
    PrintDBGridEh1.PageFooter.LeftText.Add('打印时间：'+FormatDateTime('yyyy-mm-dd hh:nn',now));
    PrintDBGridEh1.PageFooter.RightText.Clear;
    PrintDBGridEh1.PageFooter.RightText.Add(ReportFooter);
    PrinterPreview.Previewer.ViewMode := vmPageWidth;
    PrinterPreview.Orientation := poPortrait;
    PrintDBGridEh1.PageFooter.CenterText.Clear;
    PrintDBGridEh1.PageFooter.CenterText.Add('第&[Page]页，共&[Pages]页');
    PrintDBGridEh1.Preview;
  except
  end;
end;

procedure TTjAreaWarnFrm.BitBtnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TTjAreaWarnFrm.BitButtonExcelDayClick(Sender: TObject);
var
  i, j: Integer;
  s: string;
  Str: string;
  FromDate, ToDate: string;
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
      MyWorkbook.worksheets[1].range['A1:C1'].Merge(true);
    //单元格居中
      MyWorkbook.worksheets[1].range['A1:C2'].HorizontalAlignment := $FFFFEFF4;
    //报表头
      if group_id <>-1 then
        s:= ADevGroupManage.Find(group_id).Name
      else
        s:= '全部车辆';
      if ComboBoxWarnType.Text <>'' then
        tmpStr :='--'+ComboBoxWarnType.Text
      else
        tmpStr := '--驶入和驶出';
      fromDate :=FormatDatetime('yyyy-mm-dd ',DateTimePicker1.Date);
      Str := s+ ' ' + fromDate + ' 进出区域报警日统计'+tmpStr;
      MyWorkbook.worksheets[1].Cells[1, 1].value := Str;
    //表头
      i := 2;
      for j:=1 to DBGridEh1.Columns.Count do
      begin
        if not DBGridEh1.Columns.Items[j-1].Visible then Continue;
        MyWorkbook.worksheets[1].Cells[i, j].value := DBGridEh1.Columns.Items[j-1].Title.Caption;
      end;
    //字体颜色
      MyWorkbook.worksheets[1].range['A1:B2'].Font.Color := clBlue;
    //字体
      MyWorkbook.worksheets[1].range['A1:B1'].Font.Name := '隶书';
    //字号
      MyWorkbook.worksheets[1].range['A1:B1'].Font.Size := 18;
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

      //加入合计行 sha 　
      MyWorkbook.worksheets[1].Cells[i, 1].value :='合计:';
      MyWorkbook.worksheets[1].Cells[i, 2].value := DBGridEh1.Columns[1].Footer.SumValue;
    //设置单元格格式
      MyWorkbook.worksheets[1].range['B'+IntToStr(ClientDataSet1.RecordCount+3)+':B'+IntToStr(ClientDataSet1.RecordCount+3)].NumberFormatLocal := '0';

    //设置列宽
      MyWorkbook.worksheets[1].Columns[1].ColumnWidth := 20;
      MyWorkbook.worksheets[1].Columns[2].ColumnWidth := 20;
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

procedure TTjAreaWarnFrm.SpeedButtonTjMonthClick(Sender: TObject);
var
  fromDate, toDate: string;
  dt : TDateTime;
  warnType: Integer;
begin
  SpeedButtonTjMonth.Enabled := False;
  try
    fromDate :=  ComboBoxTjYf.Text+'-01 00:00:00';
    dt := StrToDateTime(fromDate);
    toDate := DateTimeToStr(incMonth(dt,1));
    if ComboBoxWarnTypeMonth.ItemIndex =-1 then
      warnType := -1
    else
      warnType := ComboBoxWarnTypeMonth.ItemIndex+1;

    DataSource2.Enabled := false;
    ClientDataSet2.Data := BS.TjAreaWarn(fromDate, toDate, group_id, warnType);
    DataSource2.Enabled := true;
  finally
    SpeedButtonTjMonth.Enabled :=True;
  end;

end;

procedure TTjAreaWarnFrm.SpeedButtonPrintMonthClick(Sender: TObject);
var
  str,tmpStr: string;
begin
  try
    if group_id <>-1 then
      str:= ADevGroupManage.Find(group_id).Name
    else
      str:= '全部车辆';
    if ComboBoxWarnTypeMonth.Text <>'' then
      tmpStr :='--'+ComboBoxWarnTypeMonth.Text
    else
      tmpStr := '--驶入和驶出';
    Str := Str +' '+ ComboBoxTjYf.Text + ' 进出区域报警月统计'+tmpStr;
    PrintDBGridEh2.PageHeader.CenterText.Clear;
    PrintDBGridEh2.PageHeader.CenterText.add(Str);
    PrintDBGridEh2.PageFooter.LeftText.Clear;
    PrintDBGridEh2.PageFooter.LeftText.Add('打印时间：'+FormatDateTime('yyyy-mm-dd hh:nn',now));
    PrintDBGridEh2.PageFooter.RightText.Clear;
    PrintDBGridEh2.PageFooter.RightText.Add(ReportFooter);
    PrinterPreview.Previewer.ViewMode := vmPageWidth;
    PrinterPreview.Orientation := poPortrait;
    PrintDBGridEh2.PageFooter.CenterText.Clear;
    PrintDBGridEh2.PageFooter.CenterText.Add('第&[Page]页，共&[Pages]页');
    PrintDBGridEh2.Preview;
  except
  end;
end;

procedure TTjAreaWarnFrm.BitBtnExcelMonthClick(Sender: TObject);
var
  i, j: Integer;
  s: string;
  Str: string;
  FromDate, ToDate: string;
  tmpStr: string;
begin
  if ClientDataSet2.RecordCount =0 then exit;
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
      MyWorkbook.worksheets[1].range['A1:C1'].Merge(true);
    //单元格居中
      MyWorkbook.worksheets[1].range['A1:C2'].HorizontalAlignment := $FFFFEFF4;
    //报表头
      if group_id <>-1 then
        str:= ADevGroupManage.Find(group_id).Name
      else
        str:= '全部车辆';
      if ComboBoxWarnTypeMonth.Text <>'' then
        tmpStr :='--'+ComboBoxWarnTypeMonth.Text
      else
        tmpStr := '--驶入和驶出';
      Str := str +' ' + ComboBoxTjYf.Text + ' 进出区域报警月统计'+tmpStr;
      MyWorkbook.worksheets[1].Cells[1, 1].value := Str;
    //表头
      i := 2;
      for j:=1 to DBGridEh2.Columns.Count do
      begin
        if not DBGridEh2.Columns.Items[j-1].Visible then Continue;
        MyWorkbook.worksheets[1].Cells[i, j].value := DBGridEh2.Columns.Items[j-1].Title.Caption;
      end;
    //字体颜色
      MyWorkbook.worksheets[1].range['A1:B2'].Font.Color := clBlue;
    //字体
      MyWorkbook.worksheets[1].range['A1:B1'].Font.Name := '隶书';
    //字号
      MyWorkbook.worksheets[1].range['A1:B1'].Font.Size := 18;
    //取数
      i := 3;
      ClientDataSet2.First;
      while not ClientDataSet2.Eof do
      begin
        for j := 1 to  DBGridEh2.Columns.Count do
        begin
          if not DBGridEh2.Columns.Items[j-1].Visible then Continue;
          tmpStr := DBGridEh2.Columns.Items[j-1].FieldName;
          MyWorkbook.worksheets[1].Cells[i, j].value := ClientDataSet2.FieldValues[tmpStr];
        end;
        ClientDataSet2.Next;
        Inc(i);
      end;

      //加入合计行 sha 　
      MyWorkbook.worksheets[1].Cells[i, 1].value :='合计:';
      MyWorkbook.worksheets[1].Cells[i, 2].value := DBGridEh2.Columns[1].Footer.SumValue;
    //设置单元格格式
      MyWorkbook.worksheets[1].range['B'+IntToStr(ClientDataSet2.RecordCount+3)+':B'+IntToStr(ClientDataSet2.RecordCount+3)].NumberFormatLocal := '0';

    //设置列宽
      MyWorkbook.worksheets[1].Columns[1].ColumnWidth := 20;
      MyWorkbook.worksheets[1].Columns[2].ColumnWidth := 20;
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

procedure TTjAreaWarnFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ManualDock(nil);
end;

end.

