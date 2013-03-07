unit DriverOnOffDutyUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxControls,
  cxInplaceContainer, ExtCtrls, StdCtrls, ComCtrls, cxTextEdit, Buttons,
  cxCalendar, Grids, DBGridEh, DB, DBClient, PrnDbgeh,PrViewEh,Printers,comObj,
  EhLibADO;

type
  TDriverOnOffDutyForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    EditDriverNO: TEdit;
    DateTimePickerBegin: TDateTimePicker;
    DateTimePickerEnd: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ComboBoxCarNO: TComboBox;
    Panel5: TPanel;
    BitBtnQuery: TBitBtn;
    PrintDBGridEh1: TPrintDBGridEh;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    DBGridEh1: TDBGridEh;
    BitButtonExcelDay: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtnPrint: TBitBtn;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    TreeView1: TTreeView;
    PanelSelectGroupName: TPanel;
    procedure FormShow(Sender: TObject);
    procedure BitBtnQueryClick(Sender: TObject);
    procedure BitBtnPrintClick(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitButtonExcelDayClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    group_id: Integer;
    procedure ExpandTreeView;
    procedure ListGroup;
    procedure AddDev(AGrpId: integer; ANode: TTreeNode);
  public
    { Public declarations }
  end;

var
  DriverOnOffDutyForm: TDriverOnOffDutyForm;
  ExcelApp, MyWorkbook: oleVariant;
implementation
    uses uGloabVar,CarUnit;
{$R *.dfm}

procedure TDriverOnOffDutyForm.AddDev(AGrpId: integer; ANode: TTreeNode);
var
  i: integer;
  dev: TDevice;
begin
  try
    ComboBoxCarNO.Clear;
    for i := 0 to ADeviceManage.Count - 1 do
    begin
      dev := ADeviceManage.Items[i];
      if dev = nil then Continue;
      if dev.GroupID= AGrpId then
      begin
        ComboBoxCarNO.Items.AddObject(dev.Car.No,dev);
      end;
    end; 
  finally
  end;
end;

procedure TDriverOnOffDutyForm.FormShow(Sender: TObject);
var
  i:integer;
begin
  EditDriverNO.Clear;
  ComboBoxCarNo.Clear;
  for i:=0 to ADeviceManage.Count-1 do
  begin
    ComboBoxCarNo.Items.AddObject(ADeviceManage.Items[i].Car.No,ADeviceManage.Items[i]);
  end;     
end;

procedure TDriverOnOffDutyForm.BitBtnQueryClick(Sender: TObject);
var
  DevID:string;
  dev:TDevice;
  fromDatetime, toDatetime: TDateTime;
begin
  DevID:='';
  dev:=nil;
  if ComboBoxCarNO.ItemIndex>=0 then
  begin
    dev:=TDevice(ComboBoxCarNO.Items.Objects[ComboBoxCarNO.ItemIndex]);
    if Dev<>nil then
    begin
      DevID:=Dev.IdStr;
    end;
  end;
  fromDatetime := DateTimePickerBegin.Date;
  toDatetime :=DateTimePickerEnd.Date;
  ReplaceTime(fromDatetime,EncodeTime(0,0,0,0));
  ReplaceTime(toDateTime,EncodeTime(23,59,59,59));

  DataSource1.Enabled := false;
  ClientDataSet1.Data := BS.QueryDriverOnOffDuty(EditDriverNO.Text,
    fromDatetime ,toDatetime,DevID,group_id).Data;
  DataSource1.Enabled := true;  
end;

procedure TDriverOnOffDutyForm.BitBtnPrintClick(Sender: TObject);
var
  str,s,fromDate,toDate: string;
begin
  try
    if group_id <>-1 then
      s:= ADevGroupManage.Find(group_id).Name;
    if ComboBoxCarNo.Text <>'' then
      s:= s+ '['+ComboBoxCarNo.Text+']'
    else
      s:= s+ '[全部车辆]';
    fromDate :=FormatDatetime('yyyy-mm-dd ',DateTimePickerBegin.Date);
    toDate := FormatDateTime('yyyy-mm-dd', DateTimePickerEnd.Date);
    str := s+ ' 司机上下班报表'+#13#10#13#10+'时间段：'+fromDate+'至'+ toDate;
    PrintDBGridEh1.PageHeader.CenterText.Clear;
    PrintDBGridEh1.PageHeader.CenterText.add(str);
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

procedure TDriverOnOffDutyForm.TreeView1Click(Sender: TObject);
var
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

procedure TDriverOnOffDutyForm.ListGroup;
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

procedure TDriverOnOffDutyForm.FormCreate(Sender: TObject);
begin
  DateTimePickerBegin.DateTime := IncMonth(date, -1);
  DateTimePickerEnd.DateTime := date;
  ListGroup;
  PanelSelectGroupName.Caption := '所有车辆';
  group_id := -1;
end;

procedure TDriverOnOffDutyForm.ExpandTreeView;
var
  i: integer;
begin
  for i := 0 to TreeView1.Items.Count - 1 do
    TreeView1.Items[i].Expanded := True;
end;

procedure TDriverOnOffDutyForm.BitButtonExcelDayClick(Sender: TObject);
var
  i, j: Integer;
  s: string;
  Str: string;
  fromDate, toDate: string;
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
      MyWorkbook.worksheets[1].range['A1:G1'].Merge(true);
    //单元格居中
      MyWorkbook.worksheets[1].range['A1:G2'].HorizontalAlignment := $FFFFEFF4;
    //报表头
      if group_id <>-1 then
        s:= ADevGroupManage.Find(group_id).Name;
      if ComboBoxCarNo.Text <>'' then
        s:= s+ '['+ComboBoxCarNo.Text+']'
      else
        s:= s+ '[全部车辆]';
      fromDate :=FormatDatetime('yyyy-mm-dd ',DateTimePickerBegin.Date);
      toDate := FormatDateTime('yyyy-mm-dd', DateTimePickerEnd.Date);
      str := s+ ' 司机上下班报表'+#13#10#13#10+'时间段：'+fromDate+'至'+ toDate;
      MyWorkbook.worksheets[1].Cells[1, 1].value := Str;
    //表头
      i := 2;
      for j:=1 to DBGridEh1.Columns.Count do
      begin
        if not DBGridEh1.Columns.Items[j-1].Visible then Continue;
        MyWorkbook.worksheets[1].Cells[i, j].value := DBGridEh1.Columns.Items[j-1].Title.Caption;
      end;
    //字体颜色
      MyWorkbook.worksheets[1].range['A1:G2'].Font.Color := clBlue;
    //字体
      MyWorkbook.worksheets[1].range['A1:G1'].Font.Name := '隶书';
    //字号
      MyWorkbook.worksheets[1].range['A1:G1'].Font.Size := 18;
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
      MyWorkbook.worksheets[1].Columns[4].ColumnWidth :=18;
      MyWorkbook.worksheets[1].Columns[5].ColumnWidth :=18;

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

procedure TDriverOnOffDutyForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ManualDock(nil);
end;

procedure TDriverOnOffDutyForm.BitBtn1Click(Sender: TObject);
begin
  close;
end;

end.
