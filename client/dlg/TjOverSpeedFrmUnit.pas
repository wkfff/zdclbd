unit TjOverSpeedFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ComCtrls, cxControls,
  cxSplitter, ExtCtrls, CarUnit, uGloabVar, DBClient, DB, PrnDbgeh,
  PrViewEh, Printers, EhLibADO;

type
  TTjOverSpeedFrm = class(TForm)
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
    DataSource1: TDataSource;
    PrintDBGridEh1: TPrintDBGridEh;
    ClientDataSet1: TClientDataSet;
    BitButtonExcelDay: TBitBtn;
    BitBtnClose: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    TabSheet3: TTabSheet;
    PrintDBGridEh2: TPrintDBGridEh;
    DataSource2: TDataSource;
    ClientDataSet2: TClientDataSet;
    cxSplitter1: TcxSplitter;
    Panel1: TPanel;
    Panel2: TPanel;
    SpeedButtonTjMonth: TSpeedButton;
    SpeedButtonPrintMonth: TSpeedButton;
    BitBtnExcelMonth: TBitBtn;
    BitBtnCloseMonth: TBitBtn;
    ComboBoxTjYf: TComboBox;
    Label4: TLabel;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    TabSheet4: TTabSheet;
    cxSplitter3: TcxSplitter;
    Panel5: TPanel;
    DBGridEhDays: TDBGridEh;
    Panel6: TPanel;
    SpeedButtonTjDays: TSpeedButton;
    Label2: TLabel;
    SpeedButtonPrintDays: TSpeedButton;
    BitBtnExcelDays: TBitBtn;
    BitBtnCloseDays: TBitBtn;
    DateTimePickerDayFrom: TDateTimePicker;
    DateTimePickerDayTo: TDateTimePicker;
    PrintDBGridEhDays: TPrintDBGridEh;
    DataSourceDays: TDataSource;
    ClientDataSetDays: TClientDataSet;
    Panel7: TPanel;
    Panel8: TPanel;
    Label1: TLabel;
    ComboBoxCarNoDay: TComboBox;
    Label5: TLabel;
    EditTimeLen: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    EditHighSpeed: TEdit;
    Label8: TLabel;
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
    procedure SpeedButtonTjDaysClick(Sender: TObject);
    procedure SpeedButtonPrintDaysClick(Sender: TObject);
    procedure BitBtnExcelDaysClick(Sender: TObject);
    procedure EditTimeLenKeyPress(Sender: TObject; var Key: Char);
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
  TjOverSpeedFrm: TTjOverSpeedFrm;
  group_id: integer = -1;

  ExcelApp, MyWorkbook: oleVariant;
implementation
uses ComObj,DateUtils;
{$R *.dfm}


procedure TTjOverSpeedFrm.ExpandTreeView;
var
  i: integer;
begin
  for i := 0 to TreeView1.Items.Count - 1 do
    TreeView1.Items[i].Expanded := True;
end;

procedure TTjOverSpeedFrm.InitEdit;
var
  i: Integer;
begin
  DateTimePicker1.date := now;
  DateTimePickerDayTo.Date := date;
  DateTimePickerDayFrom.Date := IncMonth(Date,-1);
  PageControl1.ActivePageIndex := 0;
  ComboBoxTjYf.Clear;
  for i:= 0 to 23 do
    ComboBoxTjYf.Items.Add(FormatDateTime('yyyy-mm', IncMonth(now,-i)));
  ComboBoxTjYf.ItemIndex := 0;
  EditTimeLen.Text := '60';
  EditHighSpeed.Text := '200';
end;

procedure TTjOverSpeedFrm.ListGroup;
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

procedure TTjOverSpeedFrm.SpeedButtonTjDayClick(Sender: TObject);
var
  fromDate, toDate: string;
  car_id : Integer;
  dev: TDevice;
begin
  TSpeedButton(Sender).Enabled := False;
  try
    fromDate :=FormatDatetime('yyyy-mm-dd ',DateTimePicker1.Date)+'00:00:00';
    toDate:=FormatDatetime('yyyy-mm-dd ',DateTimePicker1.Date)+'23:59:59';
    if ComboBoxCarNoDay.Text ='' then
      car_id := -1
    else
    begin
      dev:=TDevice(ComboBoxCarNoDay.Items.Objects[ComboBoxCarNoDay.ItemIndex]);
      car_Id := dev.Car.id;
    end;
    if Trim(EditTimeLen.Text)='' then EditTimeLen.Text := '0';

    DataSource1.Enabled := false;
    ClientDataSet1.Data := BS.TjOverSpeed(fromDate, toDate,car_id,group_id);
    ClientDataSet1.Filter:= 'TimeLen>='+Trim(EditTimeLen.Text);
   // if Trim(EditHighSpeed.Text)<>'' then
   //   ClientDataSet1.Filter := ClientDataSet1.Filter + ' and highspeed<='+Trim(EditHighSpeed.Text);
    ClientDataSet1.Filtered := True;
    DataSource1.Enabled := true;
  finally
    TSpeedButton(Sender).Enabled :=True;
  end;
end;

procedure TTjOverSpeedFrm.FormCreate(Sender: TObject);
begin
  InitEdit;
  ListGroup;
  PageControl1.ActivePageIndex := 0;
  PanelSelectGroupName.Caption := '所有车辆';
end;

procedure TTjOverSpeedFrm.TreeView1Click(Sender: TObject);

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

procedure TTjOverSpeedFrm.AddDev(id: integer; ANode: TTreeNode);
var
  i: integer;
  dev: TDevice;
begin
  try
    ComboBoxCarNoDay.Clear;
    //ComboBoxCarNoMonth.Clear;
    //ComboBoxCarNoDays.Clear;

    for i := 0 to ADeviceManage.Count - 1 do
    begin
      dev := ADeviceManage.Items[i];
      if dev = nil then Continue;
      if dev.GroupID= id then
      begin
        ComboBoxCarNoDay.Items.AddObject(dev.Car.No,dev);
        //ComboBoxCarNoMonth.Items.AddObject(dev.Car.No,dev);
        //ComboBoxCarNoDays.Items.AddObject(dev.Car.No,dev);
      end;
    end; 
  finally
  end;
end;

procedure TTjOverSpeedFrm.SpeedButtonPrintDayClick(Sender: TObject);
var
  str,s,fromDate: string;
begin
  try
    if group_id <>-1 then
      s:= ADevGroupManage.Find(group_id).Name;
    if ComboBoxCarNoDay.Text <>'' then
      s:= s+ '['+ComboBoxCarNoDay.Text+']'
    else
      s:= s+ '[全部车辆]';
    fromDate :=FormatDatetime('yyyy-mm-dd ',DateTimePicker1.Date);
    str := s+ ' 超速报警日统计报表'+#13#10#13#10+'日期：'+fromDate;
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

procedure TTjOverSpeedFrm.BitBtnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TTjOverSpeedFrm.BitButtonExcelDayClick(Sender: TObject);
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
      MyWorkbook.worksheets[1].range['A1:G1'].Merge(true);
    //单元格居中
      MyWorkbook.worksheets[1].range['A1:G2'].HorizontalAlignment := $FFFFEFF4;
    //报表头
      if group_id <>-1 then
        s:= ADevGroupManage.Find(group_id).Name;
      if ComboBoxCarNoDay.Text <>'' then
        s:= s+ '['+ComboBoxCarNoDay.Text+']'
      else
        s:= s+ '[全部车辆]';
      fromDate :=FormatDatetime('yyyy-mm-dd ',DateTimePicker1.Date);
      str := s+ ' 超速报警日统计报表--日期：'+fromDate;
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

      //加入合计行 sha 　
      MyWorkbook.worksheets[1].Cells[i, 1].value :='合计:';
      MyWorkbook.worksheets[1].Cells[i, 2].value := DBGridEh1.Columns[1].Footer.SumValue;
      MyWorkbook.worksheets[1].Cells[i, 3].value := DBGridEh1.Columns[2].Footer.SumValue;
    //设置单元格格式
      MyWorkbook.worksheets[1].range['B'+IntToStr(ClientDataSet1.RecordCount+3)+':C'+IntToStr(ClientDataSet1.RecordCount+3)].NumberFormatLocal := '0';

    //设置列宽
      for j := 1 to DBGridEh2.Columns.Count do
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

procedure TTjOverSpeedFrm.SpeedButtonTjMonthClick(Sender: TObject);
var
  fromDate, toDate: string;
  dt : TDateTime;
  car_Id : Integer;
  dev: TDevice;
begin
  SpeedButtonTjMonth.Enabled := False;
  try
    fromDate :=  ComboBoxTjYf.Text+'-01 00:00:00';
    dt := StrToDateTime(fromDate);
    toDate := DateTimeToStr(incMonth(dt,1));
    if ComboBoxCarNoDay.Text ='' then
      car_Id := -1
    else
    begin
      dev:=TDevice(ComboBoxCarNoDay.Items.Objects[ComboBoxCarNoDay.ItemIndex]);
      car_Id := dev.Car.id;
    end;
    if Trim(EditTimeLen.Text)='' then EditTimeLen.Text := '0';
    
    DataSource2.Enabled := false;
    ClientDataSet2.Data := BS.TjOverSpeed(fromDate, toDate,car_Id, group_id);
    ClientDataSet2.Filter:= 'TimeLen>='+Trim(EditTimeLen.Text);
    //if Trim(EditHighSpeed.Text)<>'' then
    //  ClientDataSet2.Filter := ClientDataSet2.Filter + ' and highspeed<='+Trim(EditHighSpeed.Text);
    ClientDataSet2.Filtered := True;
    DataSource2.Enabled := true;
  finally
    SpeedButtonTjMonth.Enabled :=True;
  end;

end;

procedure TTjOverSpeedFrm.SpeedButtonPrintMonthClick(Sender: TObject);
var
  str,s: string;
begin
  try
    if group_id <>-1 then
      s:= ADevGroupManage.Find(group_id).Name;
    if ComboBoxCarNoDay.Text <>'' then
      s:= s+ '['+ComboBoxCarNoDay.Text+']'
    else
      s:= s+ '[全部车辆]';
    str := s+ ' 超速报警月统计报表'+#13#10#13#10+'月份：'+ComboBoxTjYf.Text;
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

procedure TTjOverSpeedFrm.BitBtnExcelMonthClick(Sender: TObject);
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
      MyWorkbook.worksheets[1].range['A1:G1'].Merge(true);
    //单元格居中
      MyWorkbook.worksheets[1].range['A1:G2'].HorizontalAlignment := $FFFFEFF4;
    //报表头
      if group_id <>-1 then
        s:= ADevGroupManage.Find(group_id).Name;
      if ComboBoxCarNoDay.Text <>'' then
        s:= s+ '['+ComboBoxCarNoDay.Text+']'
      else
        s:= s+ '[全部车辆]';
      str := s+ ' 超速报警月统计报表--月份：'+ComboBoxTjYf.Text;
      MyWorkbook.worksheets[1].Cells[1, 1].value := Str;
    //表头
      i := 2;
      for j:=1 to DBGridEh2.Columns.Count do
      begin
        if not DBGridEh2.Columns.Items[j-1].Visible then Continue;
        MyWorkbook.worksheets[1].Cells[i, j].value := DBGridEh2.Columns.Items[j-1].Title.Caption;
      end;
    //字体颜色
      MyWorkbook.worksheets[1].range['A1:G2'].Font.Color := clBlue;
    //字体
      MyWorkbook.worksheets[1].range['A1:G1'].Font.Name := '隶书';
    //字号
      MyWorkbook.worksheets[1].range['A1:G1'].Font.Size := 18;
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
      MyWorkbook.worksheets[1].Cells[i, 3].value := DBGridEh2.Columns[2].Footer.SumValue;
    //设置单元格格式
      MyWorkbook.worksheets[1].range['B'+IntToStr(ClientDataSet2.RecordCount+3)+':C'+IntToStr(ClientDataSet2.RecordCount+3)].NumberFormatLocal := '0';


    //设置列宽
      for j := 1 to DBGridEh2.Columns.Count do
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

procedure TTjOverSpeedFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ManualDock(nil);
end;

procedure TTjOverSpeedFrm.SpeedButtonTjDaysClick(Sender: TObject);
var
  fromDate, toDate: string;
  car_id : Integer;
  dev: TDevice;
begin
  TSpeedButton(Sender).Enabled := False;
  try
    fromDate :=FormatDatetime('yyyy-mm-dd ',DateTimePickerDayFrom.Date)+'00:00:00';
    toDate:=FormatDatetime('yyyy-mm-dd ',DateTimePickerDayTo.Date)+'23:59:59';
    if ComboBoxCarNoDay.Text ='' then
      car_id := -1
    else
    begin
      dev:=TDevice(ComboBoxCarNoDay.Items.Objects[ComboBoxCarNoDay.ItemIndex]);
      car_Id := dev.Car.id;
    end;
    if Trim(EditTimeLen.Text)='' then EditTimeLen.Text := '0';

    DataSourceDays.Enabled := false;
    ClientDataSetDays.Data := BS.TjOverSpeed(fromDate, toDate,car_id,group_id);
    ClientDataSetDays.Filter:= 'TimeLen>='+Trim(EditTimeLen.Text);
    //if Trim(EditHighSpeed.Text)<>'' then
    //  ClientDataSetDays.Filter := ClientDataSetDays.Filter + ' and highspeed<='+Trim(EditHighSpeed.Text);
    ClientDataSetDays.Filtered := True;
    DataSourceDays.Enabled := true;
  finally
    TSpeedButton(Sender).Enabled :=True;
  end;
end;

procedure TTjOverSpeedFrm.SpeedButtonPrintDaysClick(Sender: TObject);
var
  str,s,fromDate: string;
begin
  try
    if group_id <>-1 then
      s:= ADevGroupManage.Find(group_id).Name;
    if ComboBoxCarNoDay.Text <>'' then
      s:= s+ '['+ComboBoxCarNoDay.Text+']'
    else
      s:= s+ '[全部车辆]';
    fromDate :=FormatDatetime('yyyy-mm-dd ',DateTimePickerDayFrom.Date)+'到'+
      FormatDateTime('yyyy-mm-dd',DateTimePickerDayTo.Date);
    str := s+ ' 超速报警统计报表'+#13#10#13#10+'时间段：'+fromDate;
    PrintDBGridEhDays.PageHeader.CenterText.Clear;
    PrintDBGridEhDays.PageHeader.CenterText.add(str);
    PrintDBGridEhDays.PageFooter.LeftText.Clear;
    PrintDBGridEhDays.PageFooter.LeftText.Add('打印时间：'+FormatDateTime('yyyy-mm-dd hh:nn',now));
    PrintDBGridEhDays.PageFooter.RightText.Clear;
    PrintDBGridEhDays.PageFooter.RightText.Add(ReportFooter);
    PrinterPreview.Previewer.ViewMode := vmPageWidth;
    PrinterPreview.Orientation := poPortrait;
    PrintDBGridEhDays.PageFooter.CenterText.Clear;
    PrintDBGridEhDays.PageFooter.CenterText.Add('第&[Page]页，共&[Pages]页');
    PrintDBGridEhDays.Preview;
  except
  end;
end;

procedure TTjOverSpeedFrm.BitBtnExcelDaysClick(Sender: TObject);
var
  i, j: Integer;
  s: string;
  Str: string;
  FromDate, ToDate: string;
  tmpStr: string;
begin
  if ClientDataSetDays.RecordCount =0 then exit;
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
      if ComboBoxCarNoDay.Text <>'' then
        s:= s+ '['+ComboBoxCarNoDay.Text+']'
      else
        s:= s+ '[全部车辆]';
      fromDate :=FormatDatetime('yyyy-mm-dd ',DateTimePickerDayFrom.Date)+'到'+
        FormatDateTime('yyyy-mm-dd',DateTimePickerDayTo.Date);
      str := s+ ' 超速报警统计报表--时间段：'+fromDate;  
      MyWorkbook.worksheets[1].Cells[1, 1].value := Str;
    //表头
      i := 2;
      for j:=1 to DBGridEhDays.Columns.Count do
      begin
        if not DBGridEhDays.Columns.Items[j-1].Visible then Continue;
        MyWorkbook.worksheets[1].Cells[i, j].value := DBGridEhDays.Columns.Items[j-1].Title.Caption;
      end;
    //字体颜色
      MyWorkbook.worksheets[1].range['A1:G2'].Font.Color := clBlue;
    //字体
      MyWorkbook.worksheets[1].range['A1:G1'].Font.Name := '隶书';
    //字号
      MyWorkbook.worksheets[1].range['A1:G1'].Font.Size := 18;
    //取数
      i := 3;
      ClientDataSetDays.First;
      while not ClientDataSetDays.Eof do
      begin
        for j := 1 to  DBGridEhDays.Columns.Count do
        begin
          if not DBGridEhDays.Columns.Items[j-1].Visible then Continue;
          tmpStr := DBGridEhDays.Columns.Items[j-1].FieldName;
          MyWorkbook.worksheets[1].Cells[i, j].value := ClientDataSetDays.FieldValues[tmpStr];
        end;
        ClientDataSetDays.Next;
        Inc(i);
      end;

      //加入合计行 sha 　
      MyWorkbook.worksheets[1].Cells[i, 1].value :='合计:';
      MyWorkbook.worksheets[1].Cells[i, 2].value := DBGridEhDays.Columns[1].Footer.SumValue;
      MyWorkbook.worksheets[1].Cells[i, 3].value := DBGridEhDays.Columns[2].Footer.SumValue;
    //设置单元格格式
      MyWorkbook.worksheets[1].range['B'+IntToStr(ClientDataSetDays.RecordCount+3)+':C'+IntToStr(ClientDataSetDays.RecordCount+3)].NumberFormatLocal := '0';

    //设置列宽
      for j := 1 to DBGridEhDays.Columns.Count do
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

procedure TTjOverSpeedFrm.EditTimeLenKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then
    key := #0;
end;

end.

