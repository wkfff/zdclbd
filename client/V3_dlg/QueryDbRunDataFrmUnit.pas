unit QueryDbRunDataFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, PrnDbgeh, ImgList, cxControls, cxSplitter, Grids, DBGridEh,
  StdCtrls, Buttons, ComCtrls, ExtCtrls, DBClient, adodb,uGloabVar,CarUnit,
  uFrmRefreshProgress,PrViewEh, Printers, DBGrids, ConstDefineUnit;

type
  TQueryDbRunDataFrm = class(TForm)
    Panel7: TPanel;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    TreeView1: TTreeView;
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    Panel3: TPanel;
    Label5: TLabel;
    Label2: TLabel;
    SpeedButtonOneTime: TSpeedButton;
    Label3: TLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label6: TLabel;
    Label7: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    ComboBox2: TComboBox;
    ComboBoxIsPrint: TComboBox;
    BitBtnToExcel: TBitBtn;
    fromTime: TDateTimePicker;
    toTime: TDateTimePicker;
    Panel4: TPanel;
    DBGridEh1: TDBGridEh;
    cxSplitter2: TcxSplitter;
    ImageList1: TImageList;
    PrintDBGridEh1: TPrintDBGridEh;
    DataSource1: TDataSource;
    BitBtn2: TBitBtn;
    cxSplitter1: TcxSplitter;
    PanelSelectGroupName: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure SpeedButtonOneTimeClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnToExcelClick(Sender: TObject);
  private
    procedure AddDev(id: integer; ANode: TTreeNode);
  private
     xml: string;
     FDlgProgress:TFrmRefreshProgress;
     FOldBizOffTime:Integer;
     procedure ThreadDone(Sender: TObject);
     procedure GetQueryReturnInfo(Info: OleVariant);
  public
    { Public declarations }
  end;

var
  QueryDbRunDataFrm: TQueryDbRunDataFrm;
  aqStore: TClientDataSet;
  FromDate, ToDate: string;
  CarNo: string;
  group_id: integer = -1;
  group_paranet: string = '';
  fact_id: Integer = -1;
  dev_id: Integer = -1;
implementation
uses umainf,ComObj, DateUtils,waitFrmUnit, BusinessServerUnit, QueryThreadUnit, ShowMessageInfo;
{$R *.dfm}

procedure TQueryDbRunDataFrm.AddDev(id: integer; ANode: TTreeNode);
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

procedure TQueryDbRunDataFrm.FormCreate(Sender: TObject);
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
  //DataSource1.DataSet := aqStore;

  TreeView1.AutoExpand := true;
  TreeView1.Items.Clear;
  if ADevGroupManage.Count = 0 then exit;
  vn_node := TreeView1.Items.add(TreeView1.topitem, '所有车辆');
  vn_node.Data := Pointer(-1); //所有车辆
  vn_node.Expanded := true;
  cnt := ADevGroupManage.Count;
  group_list(0,vn_node,cnt);
end;

procedure TQueryDbRunDataFrm.TreeView1Click(Sender: TObject);
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

procedure TQueryDbRunDataFrm.SpeedButtonOneTimeClick(Sender: TObject);
var
  m: integer;
  FCursor: TCursor;
  i, aPos: integer;
  Str, aCarNO: string;
  //dlg: TwaitFrm;
  dev:TDevice;
  info :oleVariant;
  startDateTime, endDateTime: Tdatetime;
  //xml: string;
  t: TQueryInfo;
  Query_DbRunData: TQuery_DbRunData;
begin
  screen.Cursor := FCursor;
  try
    FCursor := -11;
    //清数据
    DataSource1.DataSet := nil;


    startDateTime := DateTimePicker1.DateTime;
    endDateTime := DateTimePicker2.DateTime;
    ReplaceTime(startDateTime, fromTime.Time);
    ReplaceTime(endDateTime, toTime.Time);
    FromDate :=  FormatDatetime('yyyy-mm-dd hh:nn:ss',startDateTime);
    ToDate := FormatDatetime('yyyy-mm-dd hh:nn:ss',endDateTime);
    if FromDate > ToDate then
    begin
      MessageBox(Handle,'开始日期应小于结束日期，请检查！', '提示信息', mb_ok + mb_iconinformation);
      exit;
    end;

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

    if FDlgProgress = nil then
      FDlgProgress := TFrmRefreshProgress.Create(self);
    FDlgProgress.SetCaption('正在载入数据，请您稍候...');
    FDlgProgress.Gauge1.MinValue := 0;
    FDlgProgress.Gauge1.MaxValue := 10 +10;
    FDlgProgress.Show;
    Application.ProcessMessages;


    FDlgProgress.Gauge1.Progress := 10;
    Application.ProcessMessages;

    Query_DbRunData := TQuery_DbRunData.Create(FromDate, ToDate, fact_Id, dev_Id, group_id,
                                               group_paranet, SpeedButtonOneTime);
    Query_DbRunData.OnQueryReturn := GetQueryReturnInfo;

    {try
      xml := '';
      //FDlgProgress.SetCaption('正在载入数据...');
      xml := BS.Query_DbRunData(FromDate, ToDate,
                                 fact_Id, dev_Id, group_id,
                                 group_paranet);
      //FDlgProgress.SetCaption('正在载入数据，请您稍候...');
    except
      on E: Exception do
      begin
        if FDlgProgress.Showing then FDlgProgress.Hide;
        messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
        exit;
      end;
    end;

    FDlgProgress.GaugeProcessInc(10);
    aqStore.XMLData := xml;
    aqStore.Open;
    if aqStore.RecordCount  <= 0 then
    begin
      FDlgProgress.Hide;
      MessageBox(Handle,'对不起，没有符合条件的数据！','提示',MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
    DataSource1.DataSet := aqStore;
    DBGridEh1.DataSource := DataSource1;  }
  finally
    FCursor := 0;
    if FDlgProgress.Showing then FDlgProgress.Hide;

  end;
end;

procedure TQueryDbRunDataFrm.SpeedButton3Click(Sender: TObject);
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
      FormatDateTime('yyyy-mm-dd', DateTimePicker2.Date) + '['+ Title +'] 单客次营运信息';
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

procedure TQueryDbRunDataFrm.DBGridEh1CellClick(Column: TColumnEh);
var
  car_No:string;
  Dev_Id: Integer;
begin
  Dev_Id := aqStore.FieldValues['Dev_Id'];
  GCurSelectDev := ADeviceManage.find(Dev_Id);
  //car_No := aqStore.FieldValues['car_No'];
  //GCurSelectDev:=ADeviceManage.FindDevFromCarNo(car_No);
  if GCurSelectDev = nil then Exit;
  mainf.Edit2.Text := IntToStr(GCurSelectDev.Id);
  mainf.Edit1.Text := GCurSelectDev.Car.No;
  mainf.ShowState(GCurSelectDev);
end;

procedure TQueryDbRunDataFrm.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TQueryDbRunDataFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    ManualDock(nil);
end;

procedure TQueryDbRunDataFrm.BitBtnToExcelClick(Sender: TObject);
var
  i, j: Integer;
  s: string;
  Str: string;
  FromDate, ToDate: string;
  tmpStr: string;
  ExcelApp, MyWorkbook: oleVariant;
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
      MyWorkbook.worksheets[1].range['A1:Q1'].Merge(true);
    //单元格居中
      MyWorkbook.worksheets[1].range['A1:Q2'].HorizontalAlignment := $FFFFEFF4;
    //报表头
      if ComboBox2.Text='' then
        Str := FormatDateTime('yyyy-mm-dd', DateTimePicker1.Date) + '至' +
          FormatDateTime('yyyy-mm-dd', DateTimePicker2.Date) +' '+' 单客次营运信息'
      else
        Str := FormatDateTime('yyyy-mm-dd', DateTimePicker1.Date) + '至' +
          FormatDateTime('yyyy-mm-dd', DateTimePicker2.Date) + '['+ComboBox2.Text +'] ' + ' 单客次营运信息';
      MyWorkbook.worksheets[1].Cells[1, 1].value := Str;
      //单元格合并
      MyWorkbook.worksheets[1].range['A2:Q2'].Merge(true);
      //MyWorkbook.worksheets[1].Cells[2, 1].value := Label1.Caption;
    //表头
      i := 3;
      MyWorkbook.worksheets[1].Cells[i, 1].value := '车牌号';
      MyWorkbook.worksheets[1].Cells[i, 2].value := '公司编号';
      MyWorkbook.worksheets[1].Cells[i, 3].value := '司机编号';
      MyWorkbook.worksheets[1].Cells[i, 4].value := '司机姓名';
      MyWorkbook.worksheets[1].Cells[i, 5].value := '当班开始时间';
      MyWorkbook.worksheets[1].Cells[i, 6].value := '当班结束时间';
      MyWorkbook.worksheets[1].Cells[i, 7].value := '当班行驶里程(km)';

      MyWorkbook.worksheets[1].Cells[i, 8].value := '车次';
      MyWorkbook.worksheets[1].Cells[i, 9].value := '计时时间';
      MyWorkbook.worksheets[1].Cells[i, 10].value := '总计金额(元)';
      MyWorkbook.worksheets[1].Cells[i, 11].value := '卡收金额(元)';
      MyWorkbook.worksheets[1].Cells[i, 12].value := '卡次';

      MyWorkbook.worksheets[1].Cells[i, 13].value := '班间里程(km)';
      MyWorkbook.worksheets[1].Cells[i, 14].value := '总行驶里程(km)';
      MyWorkbook.worksheets[1].Cells[i, 15].value := '总营运里程(km)';

      MyWorkbook.worksheets[1].Cells[i, 16].value := '当班营运里程(km)';
      MyWorkbook.worksheets[1].Cells[i, 17].value := '单价(元)';

    //字体颜色
      MyWorkbook.worksheets[1].range['A1:Q2'].Font.Color := clBlue;
    //字体
      MyWorkbook.worksheets[1].range['A1:Q1'].Font.Name := '隶书';
    //字号
      MyWorkbook.worksheets[1].range['A1:Q1'].Font.Size := 18;
    //取数
      i := i+1;
      DataSource1.DataSet.First;
      //设置单元格格式
      MyWorkbook.worksheets[1].range['B4:B'+IntToStr(DataSource1.DataSet.RecordCount+4)].NumberFormatLocal := '@';

      MyWorkbook.worksheets[1].range['B'+IntToStr(DataSource1.DataSet.RecordCount+4)+
                                     ':B'+IntToStr(DataSource1.DataSet.RecordCount+4+1)].NumberFormatLocal := '0';
      MyWorkbook.worksheets[1].range['C4:C'+IntToStr(DataSource1.DataSet.RecordCount+4)].NumberFormatLocal := '@';
      MyWorkbook.worksheets[1].range['G4:G'+IntToStr(DataSource1.DataSet.RecordCount+4+1 )].NumberFormatLocal := '0.00';

      MyWorkbook.worksheets[1].range['H'+IntToStr(DataSource1.DataSet.RecordCount+4)+
                                     ':H'+IntToStr(DataSource1.DataSet.RecordCount+4+1)].NumberFormatLocal := '0';

      MyWorkbook.worksheets[1].range['J4:K'+IntToStr(DataSource1.DataSet.RecordCount+4+1 )].NumberFormatLocal := '0.00';

      MyWorkbook.worksheets[1].range['L'+IntToStr(DataSource1.DataSet.RecordCount+4)+
                                     ':L'+IntToStr(DataSource1.DataSet.RecordCount+4+1)].NumberFormatLocal := '0';
      MyWorkbook.worksheets[1].range['M4:Q'+IntToStr(DataSource1.DataSet.RecordCount+4+1 )].NumberFormatLocal := '0.00';

      while not DataSource1.DataSet.Eof do
      begin
        MyWorkbook.worksheets[1].Cells[i, 1].value := DataSource1.DataSet.FieldByName('CAR_NO').AsString;
        //MyWorkbook.worksheets[1].Cells[i, 2].value := DataSource1.DataSet.FieldByName('ICCardNo').AsString;
        MyWorkbook.worksheets[1].Cells[i, 2].value := DataSource1.DataSet.FieldByName('group_no').AsString;
        MyWorkbook.worksheets[1].Cells[i, 3].value := DataSource1.DataSet.FieldByName('driver_no').AsString;
        MyWorkbook.worksheets[1].Cells[i, 4].value := DataSource1.DataSet.FieldByName('DRIVER_NAME').AsString;
        MyWorkbook.worksheets[1].Cells[i, 5].value := DataSource1.DataSet.FieldByName('DbBeginTime').AsString;
        MyWorkbook.worksheets[1].Cells[i, 6].value := DataSource1.DataSet.FieldByName('DbEndTime').AsString;
        MyWorkbook.worksheets[1].Cells[i, 7].value := DataSource1.DataSet.FieldByName('DbDistance').AsString;

        MyWorkbook.worksheets[1].Cells[i, 8].value := DataSource1.DataSet.FieldByName('DbCount').AsString;
        MyWorkbook.worksheets[1].Cells[i, 9].value := DataSource1.DataSet.FieldByName('DbTime').AsString;
        MyWorkbook.worksheets[1].Cells[i, 10].value := DataSource1.DataSet.FieldByName('zyyje').AsString;
        MyWorkbook.worksheets[1].Cells[i, 11].value := DataSource1.DataSet.FieldByName('Cardyyje').AsString;
        MyWorkbook.worksheets[1].Cells[i, 12].value := DataSource1.DataSet.FieldByName('cardCount').AsString;
        //MyWorkbook.worksheets[1].Cells[i, 13].value := DataSource1.DataSet.FieldByName('Tac').AsString;
        MyWorkbook.worksheets[1].Cells[i, 13].value := DataSource1.DataSet.FieldByName('DbDis_AfterLastOut').AsString;
        MyWorkbook.worksheets[1].Cells[i, 14].value := DataSource1.DataSet.FieldByName('Zxslc').AsString;
        MyWorkbook.worksheets[1].Cells[i, 15].value := DataSource1.DataSet.FieldByName('zyylc').AsString;
        MyWorkbook.worksheets[1].Cells[i, 16].value := DataSource1.DataSet.FieldByName('Dbyylc').AsString;
        MyWorkbook.worksheets[1].Cells[i, 17].value := DataSource1.DataSet.FieldByName('dj').AsString;
        DataSource1.DataSet.Next;
        inc(i);
      end;

      //加入合计行 sha
      MyWorkbook.worksheets[1].Cells[i, 1].value :='合计:';
      MyWorkbook.worksheets[1].Cells[i, 2].value := DBGridEh1.Columns[2].Footer.SumValue;
      MyWorkbook.worksheets[1].Cells[i, 3].value := '';
      MyWorkbook.worksheets[1].Cells[i, 4].value := '';
      MyWorkbook.worksheets[1].Cells[i, 5].value := '';
      MyWorkbook.worksheets[1].Cells[i, 6].value := '';
      MyWorkbook.worksheets[1].Cells[i, 7].value := DBGridEh1.Columns[10].Footer.SumValue;
      MyWorkbook.worksheets[1].Cells[i, 8].value := DBGridEh1.Columns[11].Footer.SumValue;
      MyWorkbook.worksheets[1].Cells[i, 9].value := '';
      MyWorkbook.worksheets[1].Cells[i, 10].value := DBGridEh1.Columns[13].Footer.SumValue;
      MyWorkbook.worksheets[1].Cells[i, 11].value := DBGridEh1.Columns[14].Footer.SumValue;
      MyWorkbook.worksheets[1].Cells[i, 12].value := DBGridEh1.Columns[15].Footer.SumValue;
      MyWorkbook.worksheets[1].Cells[i, 13].value := DBGridEh1.Columns[16].Footer.SumValue;
      MyWorkbook.worksheets[1].Cells[i, 14].value := DBGridEh1.Columns[17].Footer.SumValue;

      MyWorkbook.worksheets[1].Cells[i, 15].value := DBGridEh1.Columns[18].Footer.SumValue;
      MyWorkbook.worksheets[1].Cells[i, 16].value := DBGridEh1.Columns[19].Footer.SumValue;
      MyWorkbook.worksheets[1].Cells[i, 17].value := '';

      //MyWorkbook.worksheets[1].range['M'+IntToStr(DataSource1.DataSet.RecordCount+4)+
      //                               ':M'+IntToStr(DataSource1.DataSet.RecordCount+4+1)].NumberFormatLocal := '0';


    //设置列宽
      for j := 1 to 17 do
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

procedure TQueryDbRunDataFrm.ThreadDone(Sender: TObject);
var
  t: TQueryInfo;
begin
  t := Sender as TQueryInfo;
  xml := t.xml;
end;

procedure TQueryDbRunDataFrm.GetQueryReturnInfo(Info: OleVariant);
begin
  try
    try
      FDlgProgress.GaugeProcessInc(10);
      
      if Info = null then
      begin
        messagebox(0, '对不起，没有满足查询要求的信息！', '提示', mb_ok + MB_ICONWARNING);
        Exit;
      end;

      aqStore.XMLData := Info;

      aqStore.Open;
      if aqStore.RecordCount  <= 0 then
      begin
        MessageBox(Handle,'对不起，没有符合条件的数据！','提示',MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      DataSource1.DataSet := aqStore;
      DBGridEh1.DataSource := DataSource1;
    except
      on E: Exception do
      begin
        messageErrorBox('计价器当班结果处理不正确！', e.Message);
        exit;
      end;
    end;
  finally
  end;
end;

end.
