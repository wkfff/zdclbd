unit QueryStopCarOverTimeAlarmFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ComCtrls, cxControls,
  cxSplitter, ExtCtrls, CarUnit, uGloabVar, DBClient, DB, PrnDbgeh,
  PrViewEh, Printers, EhLibADO;

type
  {//查看 紧急报警时详细情况：照片、录音 }
  TSeeEmergncyAlarmDetailEvent = procedure(ADevIdStr:String;AStartTime,ARemoveTime:String;
    AStartLongi,AStartLati,ARemoveLongi,ARemoveLati:Double) of object;
    
  TQueryStopCarOverTimeAlarmFrm = class(TForm)
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
    Label4: TLabel;
    FromTime: TDateTimePicker;
    FromDate: TDateTimePicker;
    ToDate: TDateTimePicker;
    ToTime: TDateTimePicker;
    cxSplitter1: TcxSplitter;
    procedure SpeedButtonTjDayClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure SpeedButtonPrintDayClick(Sender: TObject);
    procedure BitBtnCloseClick(Sender: TObject);
    procedure BitButtonExcelDayClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
  QueryStopCarOverTimeAlarmFrm: TQueryStopCarOverTimeAlarmFrm;
  group_id: integer = -1;
  group_paranet: string = '';
  ExcelApp, MyWorkbook: oleVariant;
implementation
uses ComObj,DateUtils;
{$R *.dfm}


procedure TQueryStopCarOverTimeAlarmFrm.ExpandTreeView;
var
  i: integer;
begin
  for i := 0 to TreeView1.Items.Count - 1 do
    TreeView1.Items[i].Expanded := True;
end;

procedure TQueryStopCarOverTimeAlarmFrm.InitEdit;
var
  i: Integer;
begin
  FromDate.date := IncMonth(now, -1);
  ToDate.date := now;
  FromTime.Time := EncodeTime(0,0,0,0);
  ToTime.Time := EncodeTime(23,59,59,59);
  PageControl1.ActivePageIndex := 0;
end;

procedure TQueryStopCarOverTimeAlarmFrm.ListGroup;
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

procedure TQueryStopCarOverTimeAlarmFrm.SpeedButtonTjDayClick(Sender: TObject);
var
  fromDatetime, toDatetime,devIdStr: string;
  dev: TDevice;
begin
  TSpeedButton(Sender).Enabled := False;
  try
    fromDatetime :=FormatDatetime('yyyy-mm-dd ',fromDate.Date)+FormatDatetime('hh:nn:ss',fromTime.Time);
    toDatetime:=FormatDatetime('yyyy-mm-dd ',toDate.Date)+FormatDatetime('hh:nn:ss',toTime.Time);

    if ComboBoxCarNoDay.Text ='' then
      devIdStr := ''
    else
    begin
      dev:=TDevice(ComboBoxCarNoDay.Items.Objects[ComboBoxCarNoDay.ItemIndex]);
      devIdStr := dev.IdStr;

    end;

    DataSource1.Enabled := false;
    ClientDataSet1.Data := BS.QueryStopCarOverTimeAlarm(devIdStr,fromDatetime,toDatetime,group_id,group_paranet);
    DataSource1.Enabled := true;
    group_paranet := '';
  finally
    TSpeedButton(Sender).Enabled :=True;
  end;
end;

procedure TQueryStopCarOverTimeAlarmFrm.FormCreate(Sender: TObject);
begin
  InitEdit;
  ListGroup;
  PageControl1.ActivePageIndex := 0;
  PanelSelectGroupName.Caption := '所有车辆';
end;

procedure TQueryStopCarOverTimeAlarmFrm.TreeView1Click(Sender: TObject);
var
  devGrp: TDevGroup;
  Node: TTreeNode;
  i:integer;
begin
  Node := TreeView1.Selected;
  if Node = nil then exit;
  PanelSelectGroupName.Caption := Node.Text;
  group_id := Integer(Node.Data);
  ComboBoxCarNoDay.Clear;
  if (group_id >= 0) then
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
          begin
            group_paranet := inttostr(devgrp.SonListItems[i]);
          end else
          begin
            group_paranet := group_paranet + ',' + inttostr(devgrp.SonListItems[i]);
          end;
        end;
      end else
      begin
        group_paranet := '';
      end;
    end;   
  end;
end;

procedure TQueryStopCarOverTimeAlarmFrm.AddDev(id: integer; ANode: TTreeNode);
var
  i: integer;
  dev: TDevice;
begin
  try
    //ComboBoxCarNoDay.Clear;
    for i := 0 to ADeviceManage.Count - 1 do
    begin
      dev := ADeviceManage.Items[i];
      if dev = nil then Continue;
      if dev.GroupID= id then
      begin
        ComboBoxCarNoDay.Items.AddObject(dev.DispLabel,dev);
      end;
    end; 
  finally
  end;
end;

procedure TQueryStopCarOverTimeAlarmFrm.SpeedButtonPrintDayClick(Sender: TObject);
var
  str,s,fromDatetime,toDatetime: string;
begin
  try
    if group_id <>-1 then
      s:= ADevGroupManage.Find(group_id).Name;
    if ComboBoxCarNoDay.Text <>'' then
      s:= s+ '['+ComboBoxCarNoDay.Text+']';
    fromDatetime :=FormatDatetime('yyyy-mm-dd ',fromDate.Date)+FormatDatetime('hh:nn:ss',fromTime.Time);
    toDatetime:= FormatDatetime('yyyy-mm-dd ',toDate.Date)+FormatDatetime('hh:nn:ss',toTime.Time);
    str := s+ ' 停车超时报警报表'+#13#10#13#10+'时段：'+fromDatetime+'至'+toDatetime;
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

procedure TQueryStopCarOverTimeAlarmFrm.BitBtnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TQueryStopCarOverTimeAlarmFrm.BitButtonExcelDayClick(Sender: TObject);
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
      MyWorkbook.worksheets[1].range['A1:F1'].Merge(true);
    //单元格居中
      MyWorkbook.worksheets[1].range['A1:F2'].HorizontalAlignment := $FFFFEFF4;
    //报表头
      if group_id <>-1 then
        s:= ADevGroupManage.Find(group_id).Name;
      if ComboBoxCarNoDay.Text <>'' then
        s:= s+ '['+ComboBoxCarNoDay.Text+']';

      fromDatetime :=FormatDatetime('yyyy-mm-dd ',fromDate.Date)+FormatDatetime('hh:nn:ss',fromTime.Time);
      toDatetime:= FormatDatetime('yyyy-mm-dd ',toDate.Date)+FormatDatetime('hh:nn:ss',toTime.Time);
      str :=fromDatetime+'至'+toDatetime+ s+ ' 停车超时报警报表';
      MyWorkbook.worksheets[1].Cells[1, 1].value := Str;
    //表头
      i := 2;
      for j:=1 to DBGridEh1.Columns.Count do
      begin
        if not DBGridEh1.Columns.Items[j-1].Visible then Continue;
        MyWorkbook.worksheets[1].Cells[i, j].value := DBGridEh1.Columns.Items[j-1].Title.Caption;
      end;
    //字体颜色
      MyWorkbook.worksheets[1].range['A1:F2'].Font.Color := clBlue;
    //字体
      MyWorkbook.worksheets[1].range['A1:F1'].Font.Name := '隶书';
    //字号
      MyWorkbook.worksheets[1].range['A1:F1'].Font.Size := 18;
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

procedure TQueryStopCarOverTimeAlarmFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ManualDock(nil);
end;

end.

