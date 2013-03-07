unit QueryBaseFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PrnDbgeh, DB, cxControls, cxSplitter, Grids, DBGridEh, StdCtrls,
  Buttons, ComCtrls, ExtCtrls,uFrmRefreshProgress, uGloabVar,CarUnit, DBClient,
  PrViewEh, Printers;

type
  TQueryBaseFrm = class(TForm)
    Panel7: TPanel;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    TreeView1: TTreeView;
    PanelSelectGroupName: TPanel;
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    Panel3: TPanel;
    SpeedButtonOneTime: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    BitBtnToExcel: TBitBtn;
    BitBtn2: TBitBtn;
    Panel4: TPanel;
    cxSplitter2: TcxSplitter;
    DataSource1: TDataSource;
    PrintDBGridEh1: TPrintDBGridEh;
    Label2: TLabel;
    ComboBox2: TComboBox;
    Label5: TLabel;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    fromTime: TDateTimePicker;
    toTime: TDateTimePicker;
    DBGridEh1: TDBGridEh;
    BitBtn5: TBitBtn;
    cxSplitter3: TcxSplitter;
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure SpeedButtonOneTimeClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtnToExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AddDev(id: integer; ANode: TTreeNode);
  protected
    aqStore: TClientDataSet;
    FromDate, ToDate: string;
    CarNo: string;
    group_id: integer;
    group_paranet: string;
    fact_id: Integer;
    dev_id: string;
    FDlgProgress:TFrmRefreshProgress;
    QueryContion: Boolean;
  end;

var
  QueryBaseFrm: TQueryBaseFrm;

const
  RangeBuf: array[0..26] of string=('',
          'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N' ,
          'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
        );

implementation
uses DateUtils, ComObj;
{$R *.dfm}

procedure TQueryBaseFrm.FormCreate(Sender: TObject);
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
begin
  DateTimePicker2.date := now;
  DateTimePicker1.date := IncWeek(now, -1);  //向前1周
  aqStore := TClientDataSet.Create(nil);
  group_id := -1;
  group_paranet := '';
  fact_id := -1;
  dev_id := '';

  //DataSource1.DataSet := aqStore;

  TreeView1.AutoExpand := true;
  TreeView1.Items.Clear;
  if ADevGroupManage.Count = 0 then exit;
  vn_node := TreeView1.Items.add(TreeView1.topitem, '所有车辆');
  vn_node.Data := Pointer(-1); //所有车辆
  vn_node.Expanded := true;
  cnt := ADevGroupManage.Count;
  group_list(0,vn_node,cnt);

  QueryContion := True;
end;

procedure TQueryBaseFrm.AddDev(id: integer; ANode: TTreeNode);
var
  i: integer;
  dev: TDevice;
begin
  try
   // ComboBox2.Items.Clear;
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

procedure TQueryBaseFrm.TreeView1Click(Sender: TObject);
var
  devGrp: TDevGroup;
  Node: TTreeNode;
  i: Integer;
begin
  Node := TreeView1.Selected;
  if Node = nil then exit;
  group_id := Integer(Node.Data);
  PanelSelectGroupName.Caption := Node.Text;
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
end;

procedure TQueryBaseFrm.SpeedButtonOneTimeClick(Sender: TObject);
var
  startDateTime, endDateTime: Tdatetime;
  dev:TDevice;

begin
  startDateTime := DateTimePicker1.DateTime;
  endDateTime := DateTimePicker2.DateTime;
  ReplaceTime(startDateTime, fromTime.Time);
  ReplaceTime(endDateTime, toTime.Time);
  FromDate :=  FormatDatetime('yyyy-mm-dd hh:nn:ss',startDateTime);
  ToDate := FormatDatetime('yyyy-mm-dd hh:nn:ss',endDateTime);
  if FromDate > ToDate then
  begin
    messagebox(handle, '开始日期应小于结束日期，请检查！', '提示信息', mb_ok + mb_iconinformation);
    QueryContion := False;
    exit;
  end;

  if ComboBox2.Text <> '' then
  begin
    dev := TDevice(ComboBox2.Items.Objects[ComboBox2.ItemIndex]);
    if dev <> nil then
    begin
      dev_id := dev.id;
      fact_id := dev.fact_id;
      group_id := -1;
      group_paranet := '';
    end;
  end
  else
  begin
    dev_id := '';
    fact_id := -1;
  end;
  //清数据
  DataSource1.DataSet := nil;
  QueryContion := True;
end;

procedure TQueryBaseFrm.SpeedButton3Click(Sender: TObject);
var
  Str, str1: string;
  Title: string;
begin
  try
    Title := '';
    if Length(Trim(ComboBox2.Text)) > 0 then
    begin
      Title := Trim(ComboBox2.Text);
    end
    else
    begin
      if Length(Trim(PanelSelectGroupName.Caption)) > 0 then
      begin
        Title := Trim(PanelSelectGroupName.Caption);
      end
      else
      begin
        Title := '所有车辆'
      end;
    end;
    //Str := '单客次营运信息';
    Str := FormatDateTime('yyyy-mm-dd', DateTimePicker1.Date) + '至' +
      FormatDateTime('yyyy-mm-dd', DateTimePicker2.Date) + '['+ Title +']' + Self.Caption;
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

procedure TQueryBaseFrm.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TQueryBaseFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   ManualDock(nil);
end;

procedure TQueryBaseFrm.BitBtn5Click(Sender: TObject);
var
  startDateTime, endDateTime: Tdatetime;
  dev:TDevice;

begin
  startDateTime := DateTimePicker1.DateTime;
  endDateTime := DateTimePicker2.DateTime;
  ReplaceTime(startDateTime, fromTime.Time);
  ReplaceTime(endDateTime, toTime.Time);
  FromDate :=  FormatDatetime('yyyy-mm-dd hh:nn:ss',startDateTime);
  ToDate := FormatDatetime('yyyy-mm-dd hh:nn:ss',endDateTime);
  if FromDate > ToDate then
  begin
    messagebox(handle, '开始日期应小于结束日期，请检查！', '提示信息', mb_ok + mb_iconinformation);
    QueryContion := False;
    exit;
  end;

  if ComboBox2.Text <> '' then
  begin
    dev := TDevice(ComboBox2.Items.Objects[ComboBox2.ItemIndex]);
    if dev <> nil then
    begin
      dev_id := dev.id;
      fact_id := dev.fact_id;
      group_id := -1;
      group_paranet := '';
    end;
  end
  else
  begin
    dev_id := '';
    fact_id := -1;
  end;
  //清数据
  DataSource1.DataSet := nil;
  QueryContion := True;
end;

procedure TQueryBaseFrm.BitBtnToExcelClick(Sender: TObject);
var
  j, k: Integer;
  s: string;
  Str: string;
  FromDate, ToDate: string;
  tmpStr: string;
  ExcelApp, MyWorkbook: oleVariant;
  ColumnCount, VisibleColumnCount, RowCount: Integer;
  RowIndex: Integer;
  Ranges: string;
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

      ColumnCount := DBGridEh1.Columns.Count;
      RowCount := DBGridEh1.RowCount;

      VisibleColumnCount := 0;
      for j := 0 to ColumnCount-1 do
      begin
        if DBGridEh1.Columns[j].Visible then
          inc(VisibleColumnCount);
      end;

      //增加一个工作表
      MyWorkbook := ExcelApp.workBooks.add;

      //单元格合并
      Ranges := 'A1:' + RangeBuf[VisibleColumnCount] + '1';
      MyWorkbook.worksheets[1].range[Ranges].Merge(true);                       // 'A1:D1'
      //字体
      MyWorkbook.worksheets[1].range[Ranges].Font.Name := '隶书';
      //字号
      MyWorkbook.worksheets[1].range[Ranges].Font.Size := 18;

      //单元格居中
      Ranges := 'A1:' + RangeBuf[VisibleColumnCount] + '2';
      MyWorkbook.worksheets[1].range[Ranges].HorizontalAlignment := $FFFFEFF4;  // 'A1:D2'
      //字体颜色
      MyWorkbook.worksheets[1].range[Ranges].Font.Color := clBlue;

      //报表头
      if ComboBox2.Text='' then
        Str := FormatDateTime('yyyy-mm-dd', DateTimePicker1.Date) + '至' +
          FormatDateTime('yyyy-mm-dd', DateTimePicker2.Date) + self.Caption
      else
        Str := FormatDateTime('yyyy-mm-dd', DateTimePicker1.Date) + '至' +
          FormatDateTime('yyyy-mm-dd', DateTimePicker2.Date) + '['+ComboBox2.Text +']' + self.Caption;
          
      MyWorkbook.worksheets[1].Cells[1, 1].value := Str;
      //单元格合并
      Ranges := 'A2:' + RangeBuf[VisibleColumnCount] + '2';
      MyWorkbook.worksheets[1].range[Ranges].Merge(true);                      // 'A2:D2'
      
      //表头
      RowIndex := 3;
      k := 1;
      for j := 1 to ColumnCount do
      begin
        if DBGridEh1.Columns[j-1].Visible then
        begin
          MyWorkbook.worksheets[1].Cells[RowIndex, k].value := DBGridEh1.Columns[j-1].Title.Caption;
          inc(k);
        end;
      end;


      //取数
      RowIndex := RowIndex+1;
      DataSource1.DataSet.First;
      //设置单元格格式
      //MyWorkbook.worksheets[1].range['B4:B'+IntToStr(DataSource1.DataSet.RecordCount+4)].NumberFormatLocal := '@';
      //MyWorkbook.worksheets[1].range['B'+IntToStr(DataSource1.DataSet.RecordCount+4)+
      //                               ':B'+IntToStr(DataSource1.DataSet.RecordCount+4+1)].NumberFormatLocal := '0';

      // 单元格内容
      while not DataSource1.DataSet.Eof do
      begin
        k := 1;
        for j := 1 to ColumnCount do
        begin
          if DBGridEh1.Columns[j-1].Visible then
          begin
            MyWorkbook.worksheets[1].Cells[RowIndex, k].value := DataSource1.DataSet.FieldByName(DBGridEh1.Columns[j-1].FieldName).AsString;
            Inc(k);
          end;
        end;
        DataSource1.DataSet.Next;
        inc(RowIndex);
      end;

      k := 1;
      for j := 1 to ColumnCount do
      begin
        if DBGridEh1.Columns[j-1].Visible then
        begin
          case DBGridEh1.Columns[j-1].Footer.ValueType of
            fvtStaticText:
              begin
                MyWorkbook.worksheets[1].Cells[RowIndex, k].value := DBGridEh1.Columns[j-1].Footer.Value;
              end;
            fvtSum, fvtAvg, fvtCount:
              begin
                MyWorkbook.worksheets[1].Cells[RowIndex, k].value := IntToStr(DBGridEh1.Columns[j-1].Footer.SumValue);
              end;
          end;
          inc(k);
        end;
      end;

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

end.
