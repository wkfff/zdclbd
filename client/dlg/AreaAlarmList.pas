unit AreaAlarmList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ComCtrls, cxControls,
  cxSplitter, ExtCtrls, CarUnit, uGloabVar, DBClient, DB, PrnDbgeh,
  PrViewEh, Printers, EhLibADO;

type
  TArea_AlarmList = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel3: TPanel;
    Label5: TLabel;
    Label2: TLabel;
    SpeedButtonQryAreaOutIn: TSpeedButton;
    Label3: TLabel;
    SpeedButtonPrintAreaOutIn: TSpeedButton;
    ComboBoxCarNo: TComboBox;
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
    BitButtonExcelAreaOutIn: TBitBtn;
    BitBtnClose: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    DateTimePickerFromTime: TDateTimePicker;
    Label9: TLabel;
    DateTimePicker2: TDateTimePicker;
    DateTimePickerToTime: TDateTimePicker;
    procedure SpeedButtonQryAreaOutInClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButtonPrintAreaOutInClick(Sender: TObject);
    procedure BitBtnCloseClick(Sender: TObject);
    procedure BitButtonExcelAreaOutInClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure AddDev(id: integer; ANode: TTreeNode);
    procedure InitEdit;
    procedure ExpandTreeView;
    procedure ListGroup;
  public
    { Public declarations }
  end;

var
  Area_AlarmList: TArea_AlarmList;
  group_id: integer = -1;

  ExcelApp, MyWorkbook: oleVariant;
implementation
uses ComObj,DateUtils;
{$R *.dfm}

procedure TArea_AlarmList.AddDev(id: integer; ANode: TTreeNode);
var
  i: integer;
  dev: TDevice;
begin
  try
    ComboBoxCarNo.Items.Clear;
    ComboBoxCarNo.ItemIndex := -1;

    for i := 0 to ADeviceManage.Count - 1 do
    begin
      dev := ADeviceManage.Items[i];
      if dev = nil then Continue;
      if dev.GroupID= id then
      begin
        ComboboxCarNO.Items.AddObject(dev.Car.No,dev);
      end;
    end;
  finally
  end;
end;

procedure TArea_AlarmList.ExpandTreeView;
var
  i: integer;
begin
  for i := 0 to TreeView1.Items.Count - 1 do
    TreeView1.Items[i].Expanded := True;

end;

procedure TArea_AlarmList.InitEdit;
var
  i: integer;
begin
  DateTimePicker2.date := now;
  DateTimePicker1.date := IncMonth(now, -1);
  DateTimePickerFromTime.Time := EncodeTime(0,0,0,0);
  DateTimePickerToTime.Time := EncodeTime(23,59,59,59);

  ComboBoxCarNo.Clear;
  PageControl1.ActivePageIndex := 0;
end;

procedure TArea_AlarmList.ListGroup;
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

procedure TArea_AlarmList.SpeedButtonQryAreaOutInClick(Sender: TObject);
var
  fromDate, toDate: string;
  warnType: Integer;
  dev:TDevice;
  aCarNo:String;
begin
  SpeedButtonQryAreaOutIn.Enabled := False;
  try
    fromDate :=FormatDatetime('yyyy-mm-dd ',DateTimePicker1.Date)+FormatDatetime('hh:nn:ss',DateTimePickerFromTime.Time);
    toDate:=FormatDatetime('yyyy-mm-dd ',DateTimePicker2.Date)+FormatDatetime('hh:nn:ss',DateTimePickerToTime.Time);
    if ComboBoxWarnType.ItemIndex =-1 then
      warnType := -1
    else
      warnType := ComboBoxWarnType.ItemIndex+1;

    aCarNo := '';
    try
      if ComboBoxCarNo.Text <> '' then
      begin
        dev := TDevice(ComboBoxCarNo.Items.Objects[ComboBoxCarNo.ItemIndex]);
        if dev <> nil then
          aCarNo := dev.CarNoDeleteDevName
        else
          aCarNo := '';
      end;
    except
      aCarNo := '';
    end;
    
    DataSource1.Enabled := false;
    ClientDataSet1.Data := BS.QueryAreaWarn(aCarNo, fromDate, toDate, group_id, warnType);
    DataSource1.Enabled := true;
  finally
    SpeedButtonQryAreaOutIn.Enabled :=True;
  end;
end;

procedure TArea_AlarmList.FormCreate(Sender: TObject);
begin
  InitEdit;
  ListGroup;
  PageControl1.ActivePage := TabSheet1;
  PanelSelectGroupName.Caption := '所有车辆';
end;

procedure TArea_AlarmList.TreeView1Click(Sender: TObject);
var
  devGrp: TDevGroup;
  Node: TTreeNode;
begin
  Node := TreeView1.Selected;
  if Node = nil then exit;
  PanelSelectGroupName.Caption := Node.Text;
  group_id := Integer(Node.Data);
  if (group_id >= 0) then //and (not IsClickDev) and (grpId <> clickParent) then
  begin
    AddDev(group_id, Node);
  end;
end;

procedure TArea_AlarmList.SpeedButton4Click(Sender: TObject);
begin
  close;
end;

procedure TArea_AlarmList.SpeedButtonPrintAreaOutInClick(Sender: TObject);
var
  str,s,tmpStr,fromDate,toDate: string;
begin
  try
    if group_id <>-1 then
      s:= ADevGroupManage.Find(group_id).Name;
    if ComboBoxCarNo.Text <>'' then
      s:= s+ '['+ComboBoxCarNo.Text+']'
    else
      s:= s+ '[全部车辆]';
      if ComboBoxWarnType.Text <>'' then
        tmpStr :='--'+ComboBoxWarnType.Text
      else
        tmpStr := '--驶入和驶出';
    fromDate :=FormatDatetime('yyyy-mm-dd ',DateTimePicker1.Date)+FormatDatetime('hh:nn:ss',DateTimePickerFromTime.Time);
    toDate:=FormatDatetime('yyyy-mm-dd ',DateTimePicker2.Date)+FormatDatetime('hh:nn:ss',DateTimePickerToTime.Time);
     Str := fromDate + '至' +
        toDate  +#13#10#13#10+s+ ' 进出区域报警查询'+tmpStr;
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

procedure TArea_AlarmList.BitBtnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TArea_AlarmList.BitButtonExcelAreaOutInClick(Sender: TObject);
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
      MyWorkbook.worksheets[1].range['A1:E1'].Merge(true);
    //单元格居中
      MyWorkbook.worksheets[1].range['A1:E2'].HorizontalAlignment := $FFFFEFF4;
    //报表头
      if group_id <>-1 then
        s:= ADevGroupManage.Find(group_id).Name;
      if ComboBoxCarNo.Text <>'' then
        s:= s+ '['+ComboBoxCarNo.Text+']'
      else
        s:= s+ '[全部车辆]';
      if ComboBoxWarnType.Text <>'' then
        tmpStr :='--'+ComboBoxWarnType.Text
      else
        tmpStr := '--驶入和驶出';
      fromDate :=FormatDatetime('yyyy-mm-dd ',DateTimePicker1.Date)+FormatDatetime('hh:nn:ss',DateTimePickerFromTime.Time);
      toDate:=FormatDatetime('yyyy-mm-dd ',DateTimePicker2.Date)+FormatDatetime('hh:nn:ss',DateTimePickerToTime.Time);
      Str := fromDate+ '至' +toDate +s + '进出区域报警查询'+tmpStr;
      MyWorkbook.worksheets[1].Cells[1, 1].value := Str;
    //表头
      i := 2;
      for j:=1 to DBGridEh1.Columns.Count do
      begin
        if not DBGridEh1.Columns.Items[j-1].Visible then Continue;
        MyWorkbook.worksheets[1].Cells[i, j].value := DBGridEh1.Columns.Items[j-1].Title.Caption;
      end;
    //字体颜色
      MyWorkbook.worksheets[1].range['A1:E2'].Font.Color := clBlue;
    //字体
      MyWorkbook.worksheets[1].range['A1:E1'].Font.Name := '隶书';
    //字号
      MyWorkbook.worksheets[1].range['A1:E1'].Font.Size := 18;
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

      //加入合计行 sha 20081118
      MyWorkbook.worksheets[1].Cells[i, 1].value :='合计:';
      MyWorkbook.worksheets[1].Cells[i, 2].value := DBGridEh1.Columns[1].Footer.SumValue;
    //设置单元格格式
      MyWorkbook.worksheets[1].range['B'+IntToStr(ClientDataSet1.RecordCount+3)+':B'+IntToStr(ClientDataSet1.RecordCount+3)].NumberFormatLocal := '0';

    //设置列宽
      MyWorkbook.worksheets[1].Columns[1].ColumnWidth := 11;
      MyWorkbook.worksheets[1].Columns[2].ColumnWidth := 20;
      //MyWorkbook.worksheets[1].Columns[3].ColumnWidth := 20;
      for j := 3 to DBGridEh1.Columns.Count do
        MyWorkbook.worksheets[1].Columns[j].ColumnWidth := 8;   
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

procedure TArea_AlarmList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ManualDock(nil);
end;

end.

