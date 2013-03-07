unit taxiRundataTjByMonthFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, ImgList, ToolWin,
  Grids, DBGridEh, ADOInt, DBClient, adodb, PrnDbgeh, EhLibADO,  cxSplitter,
  
  IniFiles, PrViewEh, Printers, uGloabVar, CarUnit, TeeProcs, TeEngine,
  Chart, DbChart, Series, ComObj, waitFrmUnit, cxControls,DateUtils, ConstDefineUnit;

type
  TtaxiRundataTjByMonthFrm = class(TForm)
    Panel2: TPanel;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TreeView1: TTreeView;
    cxSplitter1: TcxSplitter;
    ImageList1: TImageList;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    PrintDBGridEh1: TPrintDBGridEh;
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    DBGridEh1: TDBGridEh;
    Panel7: TPanel;
    TabSheet4: TTabSheet;
    Panel8: TPanel;
    Panel9: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    BitBtn3: TBitBtn;
    DataSource3: TDataSource;
    ClientDataSet3: TClientDataSet;
    Panel5: TPanel;
    Panel6: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton6: TSpeedButton;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    BitBtn2: TBitBtn;
    DBGridEh2: TDBGridEh;
    DataSource2: TDataSource;
    ClientDataSet2: TClientDataSet;
    PrintDBGridEh2: TPrintDBGridEh;
    PrintDBGridEh3: TPrintDBGridEh;
    DBGridEh3: TDBGridEh;
    cxSplitter2: TcxSplitter;
    cxSplitter3: TcxSplitter;
    TabSheet5: TTabSheet;
    Panel10: TPanel;
    Panel11: TPanel;
    Label7: TLabel;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    BitBtn4: TBitBtn;
    ComboBox3: TComboBox;
    DBGridEh4: TDBGridEh;
    PrintDBGridEh4: TPrintDBGridEh;
    DataSource4: TDataSource;
    ClientDataSet4: TClientDataSet;
    PageControl3: TPageControl;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    DBChart1: TDBChart;
    Series1: TFastLineSeries;
    DBChart3: TDBChart;
    FastLineSeries2: TBarSeries;
    PageControl4: TPageControl;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    DBChart2: TDBChart;
    FastLineSeries1: TFastLineSeries;
    DBChart4: TDBChart;
    FastLineSeries3: TBarSeries;
    LabelSelectPointInfo: TLabel;
    LabelSelectPointInfoT: TLabel;
    BitBtn8: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEh4Columns15UpdateData(Sender: TObject;
      var Text: String; var Value: Variant; var UseText, Handled: Boolean);
    procedure DBChart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBChart3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
  private
    procedure IniMonth;
    procedure AddDev(id: integer; ANode: TTreeNode);
    procedure EditDbGrid();
    procedure GetQueryReturnInfo(Info: OleVariant);
    procedure GetQueryReturnInfo_TaxiMetaMoneryMonthTj(Info: OleVariant);
    procedure GetQueryReturnInfo_StatTaxRunDataByDay(Info: OleVariant);
    procedure GetQueryReturnInfo_QueryTaxiTj(Info: OleVariant);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  taxiRundataTjByMonthFrm: TtaxiRundataTjByMonthFrm;
  FromDate, ToDate: string;
  CarNo: string;
  group_id: integer = -1;
  group_paranet: string = '';
  fact_id: Integer = -1;
  dev_id: Integer = -1;

  ExcelApp, MyWorkbook: oleVariant;
implementation
uses QueryThreadUnit, ShowMessageInfo;
{$R *.dfm}

procedure TtaxiRundataTjByMonthFrm.EditDbGrid;
var
  i: Integer;
  groupID: Variant;
  grp: TDevGroup;
begin
  for i:=0 to DataSource4.DataSet.RecordCount-1 do
  begin
     DBGridEh4.DataSource.DataSet.Edit;
     groupID := DBGridEh4.DataSource.DataSet.FieldValues['group_id'];
     grp := ADevGroupManage.Find(groupID);
     if grp <> nil then
     begin
       DBGridEh4.Columns[16].Field := TField.Create(DBGridEh4);
      DBGridEh4.Columns[16].Field.Value := grp.Name;
     end;
     DataSource4.DataSet.Next;
  end;
end;

procedure TtaxiRundataTjByMonthFrm.FormCreate(Sender: TObject);
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
  try
    TreeView1.AutoExpand := true;
    TreeView1.Items.Clear;
    if ADevGroupManage.Count = 0 then exit;
    vn_node := TreeView1.Items.add(TreeView1.topitem, '所有车辆');
    vn_node.Data := Pointer(-1); //所有车辆
    vn_node.Expanded := true;
    cnt := ADevGroupManage.Count;
    group_list(0, vn_node, cnt);

    IniMonth;
    ComboBox1.ItemIndex := 0;
    ComboBox3.ItemIndex := 0;
    PageControl1.ActivePage := TabSheet1;

    LabelSelectPointInfo.Top:=-50;
    LabelSelectPointInfoT.Top:=-50;
  finally
  end;
end;

procedure TtaxiRundataTjByMonthFrm.IniMonth;
var
  i: integer;
  t: TDateTime;
begin
  t := now;
  ComboBox1.Items.Clear;
  ComboBox3.Items.Clear;
  for i := 1 to 12 do
  begin
    ComboBox1.Items.Add(FormatDateTime('yyyy-mm', t));
    ComboBox3.Items.Add(FormatDateTime('yyyymm', t));
    t := IncMonth(t, -1);
  end;
  DateTimePicker2.Date := Now;
  DateTimePicker1.Date := EncodeDate(YearOf(now),MonthOf(now),1);//IncMonth(Now, -1);
  DateTimePicker4.Date := Now;
  DateTimePicker3.Date := EncodeDate(YearOf(now),MonthOf(now),1);//IncMonth(Now, -1);
end;

procedure TtaxiRundataTjByMonthFrm.SpeedButton4Click(Sender: TObject);
begin
  close;
end;

procedure TtaxiRundataTjByMonthFrm.AddDev(id: integer; ANode: TTreeNode);
var
  i: integer;
  dev: TDevice;
begin
  try
    //ComboBox2.Items.Clear;
    ComboBox2.ItemIndex := -1;

    for i := 0 to ADeviceManage.Count - 1 do
    begin
      dev := ADeviceManage.Items[i];
      if dev = nil then Continue;
      if dev.GroupID= id then
      begin
        ComboBox2.Items.AddObject(dev.Car.No,dev);
      end;
    end;
  finally
  end;
end;

procedure TtaxiRundataTjByMonthFrm.TreeView1Click(Sender: TObject);
var
  grpId: integer;
  devGrp: TDevGroup;
  Node: TTreeNode;
  i: Integer;
begin
    Node := TreeView1.Selected;
  if Node = nil then exit;
  group_id := Integer(Node.Data);
  Panel7.Caption := Node.Text;
  group_paranet := '';
  
  ComboBox2.Clear;
  if (group_id >= 0) then //and (not IsClickDev) and (grpId <> clickParent) then
  begin
    AddDev(group_id, Node);
    devGrp := ADevGroupManage.find(group_id);
    if not devGrp.leaf_nod then //==  说明父节点
    begin
      if devGrp.SonList.Count > 0 then
      begin
        for i := 0 to devGrp.SonList.Count - 1 do
        begin
          AddDev(devgrp.SonListItems[i], Node);
          if i = 0 then
            group_paranet := inttostr(devgrp.SonListItems[i])
          else
            group_paranet := group_paranet + ',' + inttostr(devgrp.SonListItems[i]);
        end;
      end
      else
        group_paranet:='';
    end;
  end;
  if group_paranet<>'' then group_id := -1;
  {Node := TreeView1.Selected;
  if Node = nil then exit;
  grpId := Integer(Node.Data);
  if grpId = -1 then
  begin
    Panel7.Caption := Node.Text;
    group_id := Integer(Node.Data);
    Exit;
  end;
  if grpId = -2 then
  begin
    Exit;
  end;
  if (grpId >= 0) then
  begin
    Panel7.Caption := Node.Text;
    group_id := Integer(Node.Data);
    AddDev(grpId, Node);
  end;      }
end;

procedure TtaxiRundataTjByMonthFrm.SpeedButton5Click(Sender: TObject);
var
  Str, str1: string;
begin
  try
    Str := ComboBox1.Text + '月营运信息按月分布';
    PrintDBGridEh1.PageHeader.CenterText.Clear;
    PrintDBGridEh1.PageHeader.CenterText.add(Str);
    PrintDBGridEh1.PageFooter.LeftText.Clear;
    PrintDBGridEh1.PageFooter.LeftText.Add('打印时间：'+FormatDateTime('yyyy-mm-dd hh:nn',now));
    PrintDBGridEh1.PageFooter.RightText.Clear;
    PrintDBGridEh1.PageFooter.RightText.Add(ReportFooter);
    PrinterPreview.Previewer.ViewMode := vmPageWidth;
    PrinterPreview.Orientation := poLandscape;
    PrintDBGridEh1.PageFooter.CenterText.Clear;
    PrintDBGridEh1.PageFooter.CenterText.Add('第&[Page]页，共&[Pages]页');
    PrintDBGridEh1.Preview;
  except
  end;
end;

procedure TtaxiRundataTjByMonthFrm.SpeedButton6Click(Sender: TObject);
var
  Str, str1: string;
begin
  try
    Str := FormatDateTime('yyyy-mm-dd', DateTimePicker1.Date) + '至' +
      FormatDateTime('yyyy-mm-dd', DateTimePicker2.Date) + '营运信息按天分布';
    PrintDBGridEh2.PageHeader.CenterText.Clear;
    PrintDBGridEh2.PageHeader.CenterText.add(Str);
    PrintDBGridEh2.PageFooter.LeftText.Clear;
    PrintDBGridEh2.PageFooter.LeftText.Add('打印时间：'+FormatDateTime('yyyy-mm-dd hh:nn',now));
    PrintDBGridEh2.PageFooter.RightText.Clear;
    PrintDBGridEh2.PageFooter.RightText.Add(ReportFooter);
    PrinterPreview.Previewer.ViewMode := vmPageWidth;
    PrinterPreview.Orientation := poLandscape;
    PrintDBGridEh2.PageFooter.CenterText.Clear;
    PrintDBGridEh2.PageFooter.CenterText.Add('第&[Page]页，共&[Pages]页');
    PrintDBGridEh2.Preview;
  except
  end;
end;

procedure TtaxiRundataTjByMonthFrm.SpeedButton9Click(Sender: TObject);
var
  Str, str1: string;
begin
  try
    Str := FormatDateTime('yyyy-mm-dd', DateTimePicker1.Date) + '至' +
      FormatDateTime('yyyy-mm-dd', DateTimePicker2.Date) + '营运情况调查表';
    PrintDBGridEh3.PageHeader.CenterText.Clear;
    PrintDBGridEh3.PageHeader.CenterText.add(Str);
    PrintDBGridEh3.PageFooter.LeftText.Clear;
    PrintDBGridEh3.PageFooter.LeftText.Add('打印时间：'+FormatDateTime('yyyy-mm-dd hh:nn',now));
    PrintDBGridEh3.PageFooter.RightText.Clear;
    PrintDBGridEh3.PageFooter.RightText.Add(ReportFooter);
    PrinterPreview.Previewer.ViewMode := vmPageWidth;
    PrinterPreview.Orientation := poPortrait;
    PrintDBGridEh3.PageFooter.CenterText.Clear;
    PrintDBGridEh3.PageFooter.CenterText.Add('第&[Page]页，共&[Pages]页');
    PrintDBGridEh3.Preview;
  except
  end;
end;

procedure TtaxiRundataTjByMonthFrm.SpeedButton12Click(Sender: TObject);
var
  Str, str1: string;
begin
  try
    Str := ComboBox3.Text + '月营运数据情况表';
    PrintDBGridEh4.PageHeader.CenterText.Clear;
    PrintDBGridEh4.PageHeader.CenterText.add(Str);
    PrintDBGridEh4.PageFooter.LeftText.Clear;
    PrintDBGridEh4.PageFooter.LeftText.Add('打印时间：'+FormatDateTime('yyyy-mm-dd hh:nn',now));
    PrintDBGridEh4.PageFooter.RightText.Clear;
    PrintDBGridEh4.PageFooter.RightText.Add(ReportFooter);
    //PrinterPreview.Previewer.ViewMode := vmPageWidth;
    PrinterPreview.Orientation := poLandscape;
    PrintDBGridEh4.PageFooter.CenterText.Clear;
    PrintDBGridEh4.PageFooter.CenterText.Add('第&[Page]页，共&[Pages]页');
    PrintDBGridEh4.Preview;
  except
  end;
end;

procedure TtaxiRundataTjByMonthFrm.BitBtn1Click(Sender: TObject);
var
  i, j: Integer;
  s: string;
  Str: string;
  FromDate, ToDate: string;
  tmpStr: string;
begin
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
      MyWorkbook.worksheets[1].range['A1:AG1'].Merge(true);
    //单元格居中
      MyWorkbook.worksheets[1].range['A1:AG2'].HorizontalAlignment := $FFFFEFF4;
    //报表头
      Str := ComboBox1.Text + '月营运金额按月分布';
      MyWorkbook.worksheets[1].Cells[1, 1].value := Str;
    //表头
      i := 2;
      MyWorkbook.worksheets[1].Cells[i, 1].value := '车牌号码';
      for j := 2 to 32 do
      begin
        tmpStr := IntToStr(j - 1);
        MyWorkbook.worksheets[1].Cells[i, j].value := tmpStr;
      end;
      MyWorkbook.worksheets[1].Cells[i, 33].value := '小计';
    //字体颜色
      MyWorkbook.worksheets[1].range['A1:AG2'].Font.Color := clBlue;
    //字体
      MyWorkbook.worksheets[1].range['A1:AG1'].Font.Name := '隶书';
    //字号
      MyWorkbook.worksheets[1].range['A1:AG1'].Font.Size := 18;
    //取数
      i := 3;
      ClientDataSet1.First;
      while not ClientDataSet1.Eof do
      begin
        MyWorkbook.worksheets[1].Cells[i, 1].value := ClientDataSet1.FieldByName('car_No').AsString;
        for j := 2 to 32 do
        begin
          tmpStr := 'd' + IntToStr(j - 1);
          MyWorkbook.worksheets[1].Cells[i, j].value := ClientDataSet1.FieldValues[tmpStr];
        end;
        MyWorkbook.worksheets[1].Cells[i, 33].value :=ClientDataSet1.FieldValues['MSum'];
        ClientDataSet1.Next;
        Inc(i);
      end;

      //加入合计行 sha 20081118
      MyWorkbook.worksheets[1].Cells[i, 1].value :='合计:';
      for j := 2 to 33 do
        MyWorkbook.worksheets[1].Cells[i, j].value := DBGridEh1.Columns[j].Footer.SumValue;
    //设置单元格格式
      MyWorkbook.worksheets[1].range['B3:AG'+IntToStr(ClientDataSet1.RecordCount+3)].NumberFormatLocal := '0.00';

    //设置列宽
      MyWorkbook.worksheets[1].Columns[1].ColumnWidth := 11;
      for j := 2 to 33 do
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

procedure TtaxiRundataTjByMonthFrm.BitBtn2Click(Sender: TObject);
var
  i, j: Integer;
  s: string;
  Str: string;
  FromDate, ToDate: string;
  tmpStr: string;
begin
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
      MyWorkbook.worksheets[1].range['A1:Z1'].Merge(true);
    //单元格居中
      MyWorkbook.worksheets[1].range['A1:Z2'].HorizontalAlignment := $FFFFEFF4;
    //报表头
      Str := FormatDateTime('yyyy-mm-dd', DateTimePicker1.Date) + '至' +
        FormatDateTime('yyyy-mm-dd', DateTimePicker2.Date) + '营运金额按天分布';
      MyWorkbook.worksheets[1].Cells[1, 1].value := Str;
    //表头
      i := 2;
      MyWorkbook.worksheets[1].Cells[i, 1].value := '车牌号码';
      MyWorkbook.worksheets[1].Cells[i, 2].value := '日期';
      for j := 3 to 26 do
      begin
        tmpStr := IntToStr(j - 3);
        if Length(tmpStr) = 1 then tmpStr := '0' + tmpStr;
        MyWorkbook.worksheets[1].Cells[i, j].value := tmpStr;
      end;
      MyWorkbook.worksheets[1].Cells[i, 27].value :='小计';
    //字体颜色
      MyWorkbook.worksheets[1].range['A1:AA2'].Font.Color := clBlue;
    //字体
      MyWorkbook.worksheets[1].range['A1:AA1'].Font.Name := '隶书';
    //字号
      MyWorkbook.worksheets[1].range['A1:AA1'].Font.Size := 18;
    //取数
      i := 3;
      ClientDataSet2.First;
      while not ClientDataSet2.Eof do
      begin
        MyWorkbook.worksheets[1].Cells[i, 1].value := ClientDataSet2.FieldByName('car_No').AsString;
        MyWorkbook.worksheets[1].Cells[i, 2].value := ClientDataSet2.FieldByName('D').AsString;

        for j := 3 to 26 do
        begin
          tmpStr := 'h' + IntToStr(j - 3);
          MyWorkbook.worksheets[1].Cells[i, j].value := ClientDataSet2.FieldValues[tmpStr];
        end;
        MyWorkbook.worksheets[1].Cells[i, 27].value := ClientDataSet2.FieldValues['hsum'];
        ClientDataSet2.Next;
        Inc(i);
      end;
      //加入合计行 sha 20081117
      MyWorkbook.worksheets[1].Cells[i, 1].value :='合计:';
      for j := 3 to 27 do
        MyWorkbook.worksheets[1].Cells[i, j].value := DBGridEh2.Columns[j-1].Footer.SumValue;
    //设置单元格格式
      MyWorkbook.worksheets[1].range['C3:AA'+IntToStr(ClientDataSet2.RecordCount+3)].NumberFormatLocal := '0.00';

    //设置列宽
      s := 'A1:K' + inttostr(i + 2);
      MyWorkbook.worksheets[1].Columns[1].ColumnWidth := 12;
      MyWorkbook.worksheets[1].Columns[2].ColumnWidth := 10;
      for j := 3 to 27 do
        MyWorkbook.worksheets[1].Columns[j].ColumnWidth := 9;
    //设置行高
      MyWorkbook.worksheets[1].Rows[1].RowHeight := 50;
    //报表头居中
      MyWorkbook.worksheets[1].Rows[1].VerticalAlignment := $FFFFEFF4;
    {//设置数据行字体
      s := 'A1:K' + inttostr(ClientDataSet2.RecordCount - 2);
      MyWorkbook.worksheets[1].range[s].Font.Name := '仿宋';
    //划表线
      s := 'A2:K' + inttostr(ClientDataSet2.RecordCount + 2);
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

procedure TtaxiRundataTjByMonthFrm.BitBtn3Click(Sender: TObject);
var
  i, j: Integer;
  s: string;
  Str: string;
  FromDate, ToDate: string;
  tmpStr: string;
begin
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
      MyWorkbook.worksheets[1].range['A1:L1'].Merge(true);
    //单元格居中
      MyWorkbook.worksheets[1].range['A1:L2'].HorizontalAlignment := $FFFFEFF4;
    //报表头
      Str := FormatDateTime('yyyy-mm-dd', DateTimePicker1.Date) + '至' +
        FormatDateTime('yyyy-mm-dd', DateTimePicker2.Date) + '营运情况调查表';
      MyWorkbook.worksheets[1].Cells[1, 1].value := Str;
    //表头
      i := 2;
      MyWorkbook.worksheets[1].Cells[i, 1].value := '车牌号码';
      MyWorkbook.worksheets[1].Cells[i, 2].value := '调查时段';
      MyWorkbook.worksheets[1].Cells[i, 3].value := '营运金额';
      MyWorkbook.worksheets[1].Cells[i, 4].value := '行驶里程';
      MyWorkbook.worksheets[1].Cells[i, 5].value := '营运次数';
      MyWorkbook.worksheets[1].Cells[i, 6].value := '空驶里程';
      MyWorkbook.worksheets[1].Cells[i, 7].value := '营运里程';
      MyWorkbook.worksheets[1].Cells[i, 8].value := '日均营运金额';
      MyWorkbook.worksheets[1].Cells[i, 9].value := '日均空驶里程';
      MyWorkbook.worksheets[1].Cells[i, 10].value := '日均营运里程';
      MyWorkbook.worksheets[1].Cells[i, 11].value := '日均空驶里程';
      MyWorkbook.worksheets[1].Cells[i, 12].value := '空驶率';

    //字体颜色
      MyWorkbook.worksheets[1].range['A1:L2'].Font.Color := clBlue;
    //字体
      MyWorkbook.worksheets[1].range['A1:L1'].Font.Name := '隶书';
    //字号
      MyWorkbook.worksheets[1].range['A1:L1'].Font.Size := 18;
    //取数
      i := 3;
      ClientDataSet3.First;
      while not ClientDataSet3.Eof do
      begin
        MyWorkbook.worksheets[1].Cells[i, 1].value := ClientDataSet3.FieldByName('car_No').AsString;
        MyWorkbook.worksheets[1].Cells[i, 2].value := ClientDataSet3.FieldByName('beginDate').AsString + '至' +
          ClientDataSet3.FieldByName('endDate').AsString;
        MyWorkbook.worksheets[1].Cells[i, 3].value := FormatFloat('0.00',ClientDataSet3.FieldByName('syyje').AsFloat);
        MyWorkbook.worksheets[1].Cells[i, 4].value := FormatFloat('0.00',ClientDataSet3.FieldByName('xslc').AsFloat);
        MyWorkbook.worksheets[1].Cells[i, 5].value := ClientDataSet3.FieldByName('nums').AsString;
        MyWorkbook.worksheets[1].Cells[i, 6].value := FormatFloat('0.00',ClientDataSet3.FieldByName('kslc').AsFloat);
        MyWorkbook.worksheets[1].Cells[i, 7].value := FormatFloat('0.00',ClientDataSet3.FieldByName('fzklc').AsFloat);
        MyWorkbook.worksheets[1].Cells[i, 8].value := FormatFloat('0.00',ClientDataSet3.FieldByName('rjyyje').AsFloat);
        MyWorkbook.worksheets[1].Cells[i, 9].value := FormatFloat('0.00',ClientDataSet3.FieldByName('rjkslc').AsFloat);
        MyWorkbook.worksheets[1].Cells[i, 10].value := FormatFloat('0.00',ClientDataSet3.FieldByName('rjzklc').AsFloat);
        MyWorkbook.worksheets[1].Cells[i, 11].value := FormatFloat('0.00',ClientDataSet3.FieldByName('rjkslc').AsFloat);
        MyWorkbook.worksheets[1].Cells[i, 12].value := FormatFloat('0.00',ClientDataSet3.FieldByName('ksl').AsFloat);
        ClientDataSet3.Next;
        Inc(i);
      end;
       //加入合计行 sha 20081117
      MyWorkbook.worksheets[1].Cells[i, 1].value :='平均:';
      MyWorkbook.worksheets[1].Cells[i, 2].value := DBGridEh3.Columns[1].Footers[0].SumValue;
      for j:= 3 to 12 do
        MyWorkbook.worksheets[1].Cells[i, j].value := DBGridEh3.Columns[j].Footers[0].SumValue;
      Inc(i);
      MyWorkbook.worksheets[1].Cells[i, 1].value :='合计:';
      MyWorkbook.worksheets[1].Cells[i, 2].value := DBGridEh3.Columns[1].Footer.SumValue;
      for j:= 3 to 12 do
        MyWorkbook.worksheets[1].Cells[i, j].value := DBGridEh3.Columns[j].Footer.SumValue;
      //设置单元格格式
      MyWorkbook.worksheets[1].range['B3:L'+IntToStr(ClientDataSet3.RecordCount+4)].NumberFormatLocal := '0.00';
      MyWorkbook.worksheets[1].range['E3:E'+IntToStr(ClientDataSet3.RecordCount+4)].NumberFormatLocal := '0';

    //设置列宽
      MyWorkbook.worksheets[1].Columns[1].ColumnWidth := 12;
      MyWorkbook.worksheets[1].Columns[2].ColumnWidth := 23;
      for j := 3 to 7 do
        MyWorkbook.worksheets[1].Columns[j].ColumnWidth := 10;
      for j:= 8 to 12 do
        MyWorkbook.worksheets[1].Columns[j].ColumnWidth := 12;
    //设置行高
      MyWorkbook.worksheets[1].Rows[1].RowHeight := 50;
    //报表头居中
      MyWorkbook.worksheets[1].Rows[1].VerticalAlignment := $FFFFEFF4;
    {//设置数据行字体
      s := 'A1:K' + inttostr(ClientDataSet3.RecordCount - 2);
      MyWorkbook.worksheets[1].range[s].Font.Name := '仿宋';
    //划表线
      s := 'A2:K' + inttostr(ClientDataSet3.RecordCount + 2);
      MyWorkbook.worksheets[1].range[s].Borders.LineStyle := 1;}
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

procedure TtaxiRundataTjByMonthFrm.BitBtn4Click(Sender: TObject);
var
  i, j: Integer;
  s: string;
  Str: string;
  FromDate, ToDate: string;
  tmpStr: string;
begin
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
      MyWorkbook.worksheets[1].range['A1:M1'].Merge(true);
    //单元格居中
      MyWorkbook.worksheets[1].range['A1:M2'].HorizontalAlignment := $FFFFEFF4;
    //报表头
      Str := FormatDateTime('yyyy-mm-dd', DateTimePicker1.Date) + '至' +
        FormatDateTime('yyyy-mm-dd', DateTimePicker2.Date) + '营运情况';
      MyWorkbook.worksheets[1].Cells[1, 1].value := Str;
    //表头
      i := 2;
      MyWorkbook.worksheets[1].Cells[i, 1].value := '日期';
      MyWorkbook.worksheets[1].Cells[i, 2].value := '车组';
      MyWorkbook.worksheets[1].Cells[i, 3].value := '营运车辆';
      MyWorkbook.worksheets[1].Cells[i, 4].value := '总车次';
      MyWorkbook.worksheets[1].Cells[i, 5].value := '营运（元）';
      MyWorkbook.worksheets[1].Cells[i, 6].value := '行驶里程（KM）';
      MyWorkbook.worksheets[1].Cells[i, 7].value := '载客里程（KM）';
      MyWorkbook.worksheets[1].Cells[i, 8].value := '公里利用率';
      MyWorkbook.worksheets[1].Cells[i, 9].value := '平均运距';
      MyWorkbook.worksheets[1].Cells[i, 10].value := '百公里营收';
      MyWorkbook.worksheets[1].Cells[i, 11].value := '平均行驶公里';
      MyWorkbook.worksheets[1].Cells[i, 12].value := '平均营收';
      MyWorkbook.worksheets[1].Cells[i, 13].value := '平均服务车次';

    //字体颜色
      MyWorkbook.worksheets[1].range['A1:M2'].Font.Color := clBlue;
    //字体
      MyWorkbook.worksheets[1].range['A1:K1'].Font.Name := '隶书';
    //字号
      MyWorkbook.worksheets[1].range['A1:K1'].Font.Size := 18;
    //取数
      i := 3;
      ClientDataSet4.First;
      while not ClientDataSet4.Eof do
      begin
        MyWorkbook.worksheets[1].Cells[i, 1].value := ClientDataSet4.FieldByName('rq').AsString;
        MyWorkbook.worksheets[1].Cells[i, 2].value := ClientDataSet4.FieldByName('group_name').AsString;
        MyWorkbook.worksheets[1].Cells[i, 3].value := ClientDataSet4.FieldByName('carNums').AsString;
        MyWorkbook.worksheets[1].Cells[i, 4].value := ClientDataSet4.FieldByName('runNums').AsString;
        MyWorkbook.worksheets[1].Cells[i, 5].value := ClientDataSet4.FieldByName('runMonery').AsString;
        MyWorkbook.worksheets[1].Cells[i, 6].value := ClientDataSet4.FieldByName('runDis').AsString;
        MyWorkbook.worksheets[1].Cells[i, 7].value := ClientDataSet4.FieldByName('tradDis').AsString;
        MyWorkbook.worksheets[1].Cells[i, 8].value := ClientDataSet4.FieldByName('lyl').AsString;
        MyWorkbook.worksheets[1].Cells[i, 9].value := ClientDataSet4.FieldByName('avgDis').AsString;
        MyWorkbook.worksheets[1].Cells[i, 10].value := ClientDataSet4.FieldByName('avgMoneryDis').AsString;
        MyWorkbook.worksheets[1].Cells[i, 11].value := ClientDataSet4.FieldByName('avgrunDis').AsString;
        MyWorkbook.worksheets[1].Cells[i, 12].value := ClientDataSet4.FieldByName('avgMonery').AsString;
        MyWorkbook.worksheets[1].Cells[i, 13].value := ClientDataSet4.FieldByName('avgNums').AsString;
        ClientDataSet4.Next;
        inc(i);
      end;

      //加入合计行 sha 20081117
      MyWorkbook.worksheets[1].Cells[i, 1].value :='平均:';
      MyWorkbook.worksheets[1].Cells[i, 2].value := '';
      MyWorkbook.worksheets[1].Cells[i, 3].value := DBGridEh4.Columns[2].Footers[0].SumValue;
      MyWorkbook.worksheets[1].Cells[i, 4].value := DBGridEh4.Columns[3].Footers[0].SumValue;//runNums
      MyWorkbook.worksheets[1].Cells[i, 5].value := DBGridEh4.Columns[4].Footers[0].SumValue;//ClientDataSet4.FieldByName('runMonery').AsString;
      MyWorkbook.worksheets[1].Cells[i, 6].value := DBGridEh4.Columns[5].Footers[0].SumValue;//ClientDataSet4.FieldByName('runDis').AsString;
      MyWorkbook.worksheets[1].Cells[i, 7].value := DBGridEh4.Columns[6].Footers[0].SumValue;//ClientDataSet4.FieldByName('tradDis').AsString;
      MyWorkbook.worksheets[1].Cells[i, 8].value := DBGridEh4.Columns[7].Footers[0].SumValue;//ClientDataSet4.FieldByName('lyl').AsString;
      MyWorkbook.worksheets[1].Cells[i, 9].value := DBGridEh4.Columns[10].Footers[0].SumValue;//ClientDataSet4.FieldByName('avgDis').AsString;
      MyWorkbook.worksheets[1].Cells[i, 10].value := DBGridEh4.Columns[11].Footers[0].SumValue;//ClientDataSet4.FieldByName('avgMoneryDis').AsString;
      MyWorkbook.worksheets[1].Cells[i, 11].value := DBGridEh4.Columns[13].Footers[0].SumValue;//ClientDataSet4.FieldByName('avgrunDis').AsString;
      MyWorkbook.worksheets[1].Cells[i, 12].value := DBGridEh4.Columns[14].Footers[0].SumValue;//ClientDataSet4.FieldByName('avgMonery').AsString;
      MyWorkbook.worksheets[1].Cells[i, 13].value := DBGridEh4.Columns[15].Footers[0].SumValue;//ClientDataSet4.FieldByName('avgNums').AsString;
      Inc(i);
      MyWorkbook.worksheets[1].Cells[i, 1].value :='合计:';
      MyWorkbook.worksheets[1].Cells[i, 2].value := '';
      MyWorkbook.worksheets[1].Cells[i, 3].value := DBGridEh4.Columns[2].Footer.SumValue;
      MyWorkbook.worksheets[1].Cells[i, 4].value := DBGridEh4.Columns[3].Footer.SumValue;//runNums
      MyWorkbook.worksheets[1].Cells[i, 5].value := DBGridEh4.Columns[4].Footer.SumValue;//ClientDataSet4.FieldByName('runMonery').AsString;
      MyWorkbook.worksheets[1].Cells[i, 6].value := DBGridEh4.Columns[5].Footer.SumValue;//ClientDataSet4.FieldByName('runDis').AsString;
      MyWorkbook.worksheets[1].Cells[i, 7].value := DBGridEh4.Columns[6].Footer.SumValue;//ClientDataSet4.FieldByName('tradDis').AsString;
      MyWorkbook.worksheets[1].Cells[i, 8].value := DBGridEh4.Columns[7].Footer.SumValue;//ClientDataSet4.FieldByName('lyl').AsString;
      MyWorkbook.worksheets[1].Cells[i, 9].value := DBGridEh4.Columns[10].Footer.SumValue;//ClientDataSet4.FieldByName('avgDis').AsString;
      MyWorkbook.worksheets[1].Cells[i, 10].value := DBGridEh4.Columns[11].Footer.SumValue;//ClientDataSet4.FieldByName('avgMoneryDis').AsString;
      MyWorkbook.worksheets[1].Cells[i, 11].value := DBGridEh4.Columns[13].Footer.SumValue;//ClientDataSet4.FieldByName('avgrunDis').AsString;
      MyWorkbook.worksheets[1].Cells[i, 12].value := DBGridEh4.Columns[14].Footer.SumValue;//ClientDataSet4.FieldByName('avgMonery').AsString;
      MyWorkbook.worksheets[1].Cells[i, 13].value := DBGridEh4.Columns[15].Footer.SumValue;//ClientDataSet4.FieldByName('avgNums').AsString;
      //设置单元格格式
      MyWorkbook.worksheets[1].range['E3:M'+IntToStr(ClientDataSet4.RecordCount+4)].NumberFormatLocal := '0.00';
      MyWorkbook.worksheets[1].range['C3:D'+IntToStr(ClientDataSet4.RecordCount+4)].NumberFormatLocal := '0';
      MyWorkbook.worksheets[1].range['C'+IntToStr(ClientDataSet4.RecordCount+3)+':D'+IntToStr(ClientDataSet4.RecordCount+3)].NumberFormatLocal := '0.00';
    //设置列宽
      for j := 1 to 12 do
        MyWorkbook.worksheets[1].Columns[j].ColumnWidth :=10;
    //设置行高
      MyWorkbook.worksheets[1].Rows[1].RowHeight := 50;
    //报表头居中
      MyWorkbook.worksheets[1].Rows[1].VerticalAlignment := $FFFFEFF4;
    {//设置数据行字体
      s := 'A1:K' + inttostr(ClientDataSet4.RecordCount - 2);
      MyWorkbook.worksheets[1].range[s].Font.Name := '仿宋';
    //划表线
      s := 'A2:K' + inttostr(ClientDataSet4.RecordCount + 2);
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

procedure TtaxiRundataTjByMonthFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ManualDock(nil);
end;

procedure TtaxiRundataTjByMonthFrm.DBGridEh4Columns15UpdateData(
  Sender: TObject; var Text: String; var Value: Variant; var UseText,
  Handled: Boolean);
var
  grp: TDevGroup;
begin
  grp := ADevGroupManage.Find(Value);
  if grp <> nil then
  begin
    Value := grp.Name;
  end;
end;

procedure TtaxiRundataTjByMonthFrm.DBChart1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
   tmp:integer;
begin
    {if  DBChart1.SeriesCount > 0 then
    begin
      With DBChart1.Series[0] do
      begin
        tmp:=Clicked(x,y);
        if tmp<> -1 then
        begin
            LabelSelectPointInfo.top:= y - 30;
            LabelSelectPointInfo.left:= x+10 ;
            LabelSelectPointInfo.caption:='月份:'+trim(ValueMarkText[tmp])+#13#10+'金额:'+formatfloat('#.##',GetMarkValue(tmp));
            if LabelSelectPointInfo.left+ LabelSelectPointInfo.Width > DBChart1.Width then
              LabelSelectPointInfo.left := DBChart1.Width - LabelSelectPointInfo.Width-5;
        end
        else
        begin
            LabelSelectPointInfo.Top:=-50;
        end;
      end;
    end;     }
end;

procedure TtaxiRundataTjByMonthFrm.DBChart3MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
   tmp:integer;
begin
    {if  DBChart3.SeriesCount > 0 then
    begin
      With DBChart3.Series[0] do
      begin
        tmp:=Clicked(x,y);
        if tmp<> -1 then
        begin
            LabelSelectPointInfoT.top:= y - 30;
            LabelSelectPointInfoT.left:= x+10 ;
            LabelSelectPointInfoT.caption:='月份:'+trim(ValueMarkText[tmp])+#13#10+'金额:'+formatfloat('#.##',GetMarkValue(tmp));
            if LabelSelectPointInfoT.left+ LabelSelectPointInfoT.Width > DBChart3.Width then
              LabelSelectPointInfoT.left := DBChart3.Width - LabelSelectPointInfoT.Width-5;
        end
        else
        begin
            LabelSelectPointInfoT.Top:=-50;
        end;
      end;
    end;  }
end;

procedure TtaxiRundataTjByMonthFrm.GetQueryReturnInfo_TaxiMetaMoneryMonthTj(
  Info: OleVariant);
begin
  try
    try
      if Info = null then
      begin
        messagebox(0, '对不起，没有满足查询要求的信息！', '提示', mb_ok + MB_ICONWARNING);
        Exit;
      end;
      
      DataSource1.Enabled := false;

      ClientDataSet1.XMLData := Info;

      if ClientDataSet1.RecordCount <= 0 then
      begin
        MessageBox(Handle,'对不起，没有符合条件的数据！','提示',MB_OK + MB_ICONINFORMATION);
        Exit;
      end;

      DataSource1.Enabled := true;

      with DBChart1.Series[0] do
      begin
        Clear;
        AddXY(1, DBGridEh1.FieldColumns['d1'].Footer.SumValue, '1');
        AddXY(2, DBGridEh1.FieldColumns['d2'].Footer.SumValue, '2');
        AddXY(3, DBGridEh1.FieldColumns['d3'].Footer.SumValue, '3');
        AddXY(4, DBGridEh1.FieldColumns['d4'].Footer.SumValue, '4');
        AddXY(5, DBGridEh1.FieldColumns['d5'].Footer.SumValue, '5');
        AddXY(6, DBGridEh1.FieldColumns['d6'].Footer.SumValue, '6');
        AddXY(7, DBGridEh1.FieldColumns['d7'].Footer.SumValue, '7');
        AddXY(8, DBGridEh1.FieldColumns['d8'].Footer.SumValue, '8');
        AddXY(9, DBGridEh1.FieldColumns['d9'].Footer.SumValue, '9');
        AddXY(10, DBGridEh1.FieldColumns['d10'].Footer.SumValue, '10');
        AddXY(11, DBGridEh1.FieldColumns['d11'].Footer.SumValue, '11');
        AddXY(12, DBGridEh1.FieldColumns['d12'].Footer.SumValue, '12');
        AddXY(13, DBGridEh1.FieldColumns['d13'].Footer.SumValue, '13');
        AddXY(14, DBGridEh1.FieldColumns['d14'].Footer.SumValue, '14');
        AddXY(15, DBGridEh1.FieldColumns['d15'].Footer.SumValue, '15');
        AddXY(16, DBGridEh1.FieldColumns['d16'].Footer.SumValue, '16');
        AddXY(17, DBGridEh1.FieldColumns['d17'].Footer.SumValue, '17');
        AddXY(18, DBGridEh1.FieldColumns['d18'].Footer.SumValue, '18');
        AddXY(19, DBGridEh1.FieldColumns['d19'].Footer.SumValue, '19');
        AddXY(20, DBGridEh1.FieldColumns['d20'].Footer.SumValue, '20');
        AddXY(21, DBGridEh1.FieldColumns['d21'].Footer.SumValue, '21');
        AddXY(22, DBGridEh1.FieldColumns['d22'].Footer.SumValue, '22');
        AddXY(23, DBGridEh1.FieldColumns['d23'].Footer.SumValue, '23');
        AddXY(24, DBGridEh1.FieldColumns['d24'].Footer.SumValue, '24');
        AddXY(25, DBGridEh1.FieldColumns['d25'].Footer.SumValue, '25');
        AddXY(26, DBGridEh1.FieldColumns['d26'].Footer.SumValue, '26');
        AddXY(27, DBGridEh1.FieldColumns['d27'].Footer.SumValue, '27');
        AddXY(28, DBGridEh1.FieldColumns['d28'].Footer.SumValue, '28');
        AddXY(29, DBGridEh1.FieldColumns['d29'].Footer.SumValue, '29');
        AddXY(30, DBGridEh1.FieldColumns['d30'].Footer.SumValue, '30');
        AddXY(31, DBGridEh1.FieldColumns['d31'].Footer.SumValue, '31');
      end;
      with DBChart3.Series[0] do
      begin
        Clear;
        AddXY(1, DBGridEh1.FieldColumns['d1'].Footer.SumValue, '1');
        AddXY(2, DBGridEh1.FieldColumns['d2'].Footer.SumValue, '2');
        AddXY(3, DBGridEh1.FieldColumns['d3'].Footer.SumValue, '3');
        AddXY(4, DBGridEh1.FieldColumns['d4'].Footer.SumValue, '4');
        AddXY(5, DBGridEh1.FieldColumns['d5'].Footer.SumValue, '5');
        AddXY(6, DBGridEh1.FieldColumns['d6'].Footer.SumValue, '6');
        AddXY(7, DBGridEh1.FieldColumns['d7'].Footer.SumValue, '7');
        AddXY(8, DBGridEh1.FieldColumns['d8'].Footer.SumValue, '8');
        AddXY(9, DBGridEh1.FieldColumns['d9'].Footer.SumValue, '9');
        AddXY(10, DBGridEh1.FieldColumns['d10'].Footer.SumValue, '10');
        AddXY(11, DBGridEh1.FieldColumns['d11'].Footer.SumValue, '11');
        AddXY(12, DBGridEh1.FieldColumns['d12'].Footer.SumValue, '12');
        AddXY(13, DBGridEh1.FieldColumns['d13'].Footer.SumValue, '13');
        AddXY(14, DBGridEh1.FieldColumns['d14'].Footer.SumValue, '14');
        AddXY(15, DBGridEh1.FieldColumns['d15'].Footer.SumValue, '15');
        AddXY(16, DBGridEh1.FieldColumns['d16'].Footer.SumValue, '16');
        AddXY(17, DBGridEh1.FieldColumns['d17'].Footer.SumValue, '17');
        AddXY(18, DBGridEh1.FieldColumns['d18'].Footer.SumValue, '18');
        AddXY(19, DBGridEh1.FieldColumns['d19'].Footer.SumValue, '19');
        AddXY(20, DBGridEh1.FieldColumns['d20'].Footer.SumValue, '20');
        AddXY(21, DBGridEh1.FieldColumns['d21'].Footer.SumValue, '21');
        AddXY(22, DBGridEh1.FieldColumns['d22'].Footer.SumValue, '22');
        AddXY(23, DBGridEh1.FieldColumns['d23'].Footer.SumValue, '23');
        AddXY(24, DBGridEh1.FieldColumns['d24'].Footer.SumValue, '24');
        AddXY(25, DBGridEh1.FieldColumns['d25'].Footer.SumValue, '25');
        AddXY(26, DBGridEh1.FieldColumns['d26'].Footer.SumValue, '26');
        AddXY(27, DBGridEh1.FieldColumns['d27'].Footer.SumValue, '27');
        AddXY(28, DBGridEh1.FieldColumns['d28'].Footer.SumValue, '28');
        AddXY(29, DBGridEh1.FieldColumns['d29'].Footer.SumValue, '29');
        AddXY(30, DBGridEh1.FieldColumns['d30'].Footer.SumValue, '30');
        AddXY(31, DBGridEh1.FieldColumns['d31'].Footer.SumValue, '31');
      end;
    except
      on E: Exception do
      begin
        messageErrorBox('营运金额按月分布结果处理不正确！', e.Message);
        exit;
      end;
    end;
  finally
  end;
end;

procedure TtaxiRundataTjByMonthFrm.GetQueryReturnInfo_StatTaxRunDataByDay(
  Info: OleVariant);
begin
  try
    try
      if Info = null then
      begin
        messagebox(0, '对不起，没有满足查询要求的信息！', '提示', mb_ok + MB_ICONWARNING);
        Exit;
      end;

      DataSource2.Enabled := false;

      ClientDataSet2.XMLData := Info;

      if ClientDataSet2.RecordCount  <= 0 then
      begin
        MessageBox(Handle,'对不起，没有符合条件的数据！','提示',MB_OK + MB_ICONINFORMATION);
        Exit;
      end;

      DataSource2.Enabled := true;

      with DBChart2.Series[0] do
      begin
        Clear;
        AddXY(1, DBGridEh2.FieldColumns['h0'].Footer.SumValue, '00');
        AddXY(2, DBGridEh2.FieldColumns['h1'].Footer.SumValue, '01');
        AddXY(3, DBGridEh2.FieldColumns['h2'].Footer.SumValue, '02');
        AddXY(4, DBGridEh2.FieldColumns['h3'].Footer.SumValue, '03');
        AddXY(5, DBGridEh2.FieldColumns['h4'].Footer.SumValue, '04');
        AddXY(6, DBGridEh2.FieldColumns['h5'].Footer.SumValue, '05');
        AddXY(7, DBGridEh2.FieldColumns['h6'].Footer.SumValue, '06');
        AddXY(8, DBGridEh2.FieldColumns['h7'].Footer.SumValue, '07');
        AddXY(9, DBGridEh2.FieldColumns['h8'].Footer.SumValue, '08');
        AddXY(10, DBGridEh2.FieldColumns['h9'].Footer.SumValue, '09');
        AddXY(11, DBGridEh2.FieldColumns['h10'].Footer.SumValue, '10');
        AddXY(12, DBGridEh2.FieldColumns['h11'].Footer.SumValue, '11');
        AddXY(13, DBGridEh2.FieldColumns['h12'].Footer.SumValue, '12');
        AddXY(14, DBGridEh2.FieldColumns['h13'].Footer.SumValue, '13');
        AddXY(15, DBGridEh2.FieldColumns['h14'].Footer.SumValue, '14');
        AddXY(16, DBGridEh2.FieldColumns['h15'].Footer.SumValue, '15');
        AddXY(17, DBGridEh2.FieldColumns['h16'].Footer.SumValue, '16');
        AddXY(18, DBGridEh2.FieldColumns['h17'].Footer.SumValue, '17');
        AddXY(19, DBGridEh2.FieldColumns['h18'].Footer.SumValue, '18');
        AddXY(20, DBGridEh2.FieldColumns['h19'].Footer.SumValue, '19');
        AddXY(21, DBGridEh2.FieldColumns['h20'].Footer.SumValue, '20');
        AddXY(22, DBGridEh2.FieldColumns['h21'].Footer.SumValue, '21');
        AddXY(23, DBGridEh2.FieldColumns['h22'].Footer.SumValue, '22');
        AddXY(24, DBGridEh2.FieldColumns['h23'].Footer.SumValue, '23');
      end;
      with DBChart4.Series[0] do
      begin
        Clear;
        AddXY(1, DBGridEh2.FieldColumns['h0'].Footer.SumValue, '00');
        AddXY(2, DBGridEh2.FieldColumns['h1'].Footer.SumValue, '01');
        AddXY(3, DBGridEh2.FieldColumns['h2'].Footer.SumValue, '02');
        AddXY(4, DBGridEh2.FieldColumns['h3'].Footer.SumValue, '03');
        AddXY(5, DBGridEh2.FieldColumns['h4'].Footer.SumValue, '04');
        AddXY(6, DBGridEh2.FieldColumns['h5'].Footer.SumValue, '05');
        AddXY(7, DBGridEh2.FieldColumns['h6'].Footer.SumValue, '06');
        AddXY(8, DBGridEh2.FieldColumns['h7'].Footer.SumValue, '07');
        AddXY(9, DBGridEh2.FieldColumns['h8'].Footer.SumValue, '08');
        AddXY(10, DBGridEh2.FieldColumns['h9'].Footer.SumValue, '09');
        AddXY(11, DBGridEh2.FieldColumns['h10'].Footer.SumValue, '10');
        AddXY(12, DBGridEh2.FieldColumns['h11'].Footer.SumValue, '11');
        AddXY(13, DBGridEh2.FieldColumns['h12'].Footer.SumValue, '12');
        AddXY(14, DBGridEh2.FieldColumns['h13'].Footer.SumValue, '13');
        AddXY(15, DBGridEh2.FieldColumns['h14'].Footer.SumValue, '14');
        AddXY(16, DBGridEh2.FieldColumns['h15'].Footer.SumValue, '15');
        AddXY(17, DBGridEh2.FieldColumns['h16'].Footer.SumValue, '16');
        AddXY(18, DBGridEh2.FieldColumns['h17'].Footer.SumValue, '17');
        AddXY(19, DBGridEh2.FieldColumns['h18'].Footer.SumValue, '18');
        AddXY(20, DBGridEh2.FieldColumns['h19'].Footer.SumValue, '19');
        AddXY(21, DBGridEh2.FieldColumns['h20'].Footer.SumValue, '20');
        AddXY(22, DBGridEh2.FieldColumns['h21'].Footer.SumValue, '21');
        AddXY(23, DBGridEh2.FieldColumns['h22'].Footer.SumValue, '22');
        AddXY(24, DBGridEh2.FieldColumns['h23'].Footer.SumValue, '23');
      end;
    except
      on E: Exception do
      begin
        messageErrorBox('营运金额按天分布结果处理不正确！', e.Message);
        exit;
      end;
    end;
  finally
  end;
end;

procedure TtaxiRundataTjByMonthFrm.GetQueryReturnInfo(Info: OleVariant);
begin
  try
    try
      if Info = null then
      begin
        messagebox(0, '对不起，没有满足查询要求的信息！', '提示', mb_ok + MB_ICONWARNING);
        Exit;
      end;

      DataSource3.Enabled := false;

      ClientDataSet3.XMLData := Info;

      if ClientDataSet3.RecordCount  <= 0 then
      begin
        MessageBox(Handle,'对不起，没有符合条件的数据！','提示',MB_OK + MB_ICONINFORMATION);
        Exit;
      end;

      DataSource3.Enabled := true;
    except
      on E: Exception do
      begin
        messageErrorBox('营运情况调查结果处理不正确！', e.Message);
        exit;
      end;
    end;
  finally
  end;
end;

procedure TtaxiRundataTjByMonthFrm.GetQueryReturnInfo_QueryTaxiTj(
  Info: OleVariant);
begin
  try
    try
      if Info = null then
      begin
        messagebox(0, '对不起，没有满足查询要求的信息！', '提示', mb_ok + MB_ICONWARNING);
        Exit;
      end;

      DataSource4.Enabled := false;

      ClientDataSet4.XMLData := Info;

      if ClientDataSet4.RecordCount  <= 0 then
      begin
        MessageBox(Handle,'对不起，没有符合条件的数据！','提示',MB_OK + MB_ICONINFORMATION);
        Exit;
      end;

      DataSource4.Enabled := true;
    except
      on E: Exception do
      begin
        messageErrorBox('营运数据情况处理不正确！', e.Message);
        exit;
      end;
    end;
  finally
  end;
end;

procedure TtaxiRundataTjByMonthFrm.BitBtn8Click(Sender: TObject);
var
  tmpDS: TClientDataSet;
  dlg: TwaitFrm;
  dev:TDevice;
  aCarNo:String;

  TaxiMetaMoneryMonthTj: TTaxiMetaMoneryMonthTj;
begin
  if ComboBox1.Text = '' then
  begin
    messagebox(handle, '请先选择统计的月份!', '提示信息', MB_OK);
    Exit;
  end;
  try
    dlg := TwaitFrm.Create(nil);
    dlg.Show;
    Application.ProcessMessages;
    {aCarNo := '';
    try
      if ComboBox2.Text <> '' then
      begin
        dev := TDevice(ComboBox2.Items.Objects[ComboBox2.ItemIndex]);
        if dev <> nil then
          aCarNo := dev.CarNoDeleteDevName
        else
          aCarNo := '';
      end;
    except
      aCarNo := '';
    end;   }

    aCarNo := '';
    try
      if ComboBox2.Text <> '' then
      begin
        dev := TDevice(ComboBox2.Items.Objects[ComboBox2.ItemIndex]);
        if dev <> nil then
          begin
            dev_id := dev.id;
            fact_id := dev.fact_id;
            group_id := -1;
            group_paranet := '';
            aCarNo := dev.CarNoDeleteDevName;
          end
        else
          aCarNo := '';
      end
      else
      begin
        dev_id := -1;
        fact_id := -1;
      end;
    except
      aCarNo := '';
    end;

    CarNo := aCarNO;

    TaxiMetaMoneryMonthTj := TTaxiMetaMoneryMonthTj.Create(ComboBox1.Text, fact_id, dev_id, group_id, group_paranet, BitBtn8);
    TaxiMetaMoneryMonthTj.OnQueryReturn := GetQueryReturnInfo_TaxiMetaMoneryMonthTj;
  finally
    //tmpDS.Free;
    dlg.Free;
  end;
end;

procedure TtaxiRundataTjByMonthFrm.BitBtn5Click(Sender: TObject);
var
  fromDate, toDate: string;
  tmpDS: TClientDataSet;
  dlg: TwaitFrm;

  StatTaxRunDataByDay: TStatTaxRunDataByDay;
begin
  try

    fromDate := FormatDateTime('yyyy-mm-dd', DateTimePicker3.Date);
    toDate := FormatDateTime('yyyy-mm-dd', DateTimePicker4.Date);
    if FromDate > ToDate then
    begin
      MessageBox(Handle, '开始日期应小于结束日期，请检查！', '提示信息', mb_ok + mb_iconinformation);
      exit;
    end;

    dlg := TwaitFrm.Create(nil);
    dlg.Show;
    Application.ProcessMessages;

    StatTaxRunDataByDay := TStatTaxRunDataByDay.Create(fromDate, toDate, group_id, group_paranet, BitBtn5);
    StatTaxRunDataByDay.OnQueryReturn := GetQueryReturnInfo_StatTaxRunDataByDay;
  finally
    dlg.Free;
  end;
end;

procedure TtaxiRundataTjByMonthFrm.BitBtn6Click(Sender: TObject);
var
  fromDate, toDate: string;
  dlg: TwaitFrm;

  QueryTaxiRunDataTjByMonth: TTaxiRunDataTjByMonth;
begin
  try
    fromDate := FormatDateTime('yyyy-mm-dd hh:nn:ss', DateTimePicker1.Date);
    toDate := FormatDateTime('yyyy-mm-dd hh:nn:ss', DateTimePicker2.Date);
    if FromDate > ToDate then
    begin
      MessageBox(Handle, '开始日期应小于结束日期，请检查！', '提示信息', mb_ok + mb_iconinformation);
      exit;
    end;

    dlg := TwaitFrm.Create(nil);
    dlg.Show;
    Application.ProcessMessages;

    QueryTaxiRunDataTjByMonth := TTaxiRunDataTjByMonth.Create(fromDate, toDate, group_id, group_paranet, BitBtn6);
    QueryTaxiRunDataTjByMonth.OnQueryReturn := GetQueryReturnInfo;
  finally
    dlg.Free;
  end;
end;

procedure TtaxiRundataTjByMonthFrm.BitBtn7Click(Sender: TObject);
var
  dlg: TwaitFrm;
  filterStr: string;
  QueryTaxiTj: TQueryTaxiTj;
begin
  if ComboBox3.Text = '' then
  begin
    messagebox(handle, '请先选择统计的月份!', '提示信息', MB_OK);
    Exit;
  end;
  try
    dlg := TwaitFrm.Create(nil);
    dlg.Show;
    Application.ProcessMessages;

    QueryTaxiTj := TQueryTaxiTj.Create(ComboBox3.Text, group_id, group_paranet, BitBtn7);
    QueryTaxiTj.OnQueryReturn := GetQueryReturnInfo_QueryTaxiTj;
  finally
    dlg.Free;
  end;
end;

end.

