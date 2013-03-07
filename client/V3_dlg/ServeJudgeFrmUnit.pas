unit ServeJudgeFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, PrnDbgeh, ImgList, cxControls, cxSplitter, Grids, DBGridEh,
  StdCtrls, Buttons, ComCtrls, ExtCtrls, DBClient, adodb,uGloabVar,CarUnit,
  uFrmRefreshProgress,PrViewEh, Printers, ConstDefineUnit;

type
  TServeJudgeFrm = class(TForm)
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
    Label3: TLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    ComboBox2: TComboBox;
    BitBtnToExcel: TBitBtn;
    fromTime: TDateTimePicker;
    toTime: TDateTimePicker;
    Panel4: TPanel;
    DBGridEh1: TDBGridEh;
    cxSplitter2: TcxSplitter;
    ImageList1: TImageList;
    PrintDBGridEh1: TPrintDBGridEh;
    DataSource1: TDataSource;
    cxSplitter1: TcxSplitter;
    PanelSelectGroupName: TPanel;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnToExcelClick(Sender: TObject);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure BitBtn1Click(Sender: TObject);
  private
    procedure AddDev(id: integer; ANode: TTreeNode);
    //procedure SGDrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState);
   // procedure SGDrawCell(Sender:   TObject;   ACol,   ARow:   Integer;
   //     ARect:   TRect;   AState:   TGridDrawState);
  private
     FDlgProgress:TFrmRefreshProgress;
     FOldBizOffTime:Integer;
     procedure GetQueryReturnInfo(Info: OleVariant);
  public
    { Public declarations }
  end;

var
  ServeJudgeFrm: TServeJudgeFrm;
  aqStore: TClientDataSet;
  FromDate, ToDate: string;
  CarNo: string;
  group_id: integer = -1;
  group_paranet: string = '';
  fact_id: Integer = -1;
  dev_id: Integer = -1;
implementation
uses umainf,ComObj, DateUtils,waitFrmUnit, QueryThreadUnit, ShowMessageInfo;
{$R *.dfm}

procedure TServeJudgeFrm.AddDev(id: integer; ANode: TTreeNode);
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

procedure TServeJudgeFrm.FormCreate(Sender: TObject);
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
  DataSource1.DataSet := aqStore;

  TreeView1.AutoExpand := true;
  TreeView1.Items.Clear;
  if ADevGroupManage.Count = 0 then exit;
  vn_node := TreeView1.Items.add(TreeView1.topitem, '所有车辆');
  vn_node.Data := Pointer(-1); //所有车辆
  vn_node.Expanded := true;
  cnt := ADevGroupManage.Count;
  group_list(0,vn_node,cnt);
end;

procedure TServeJudgeFrm.TreeView1Click(Sender: TObject);
var
  grpId : integer;
  devGrp: TDevGroup;
  Node: TTreeNode;
  i: Integer;
begin
  Node := TreeView1.Selected;
  if Node = nil then exit;
  grpId := Integer(Node.Data);
  PanelSelectGroupName.Caption := Node.Text;
  group_id := grpId;
  group_paranet := '';

  ComboBox2.Clear;
  if (grpId >=0) then //and (not IsClickDev) and (grpId <> clickParent) then
  begin
    AddDev(grpId, Node);

    devGrp := ADevGroupManage.find(grpId);
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
        group_id := -1;
      end
      else
        group_paranet:='';
    end
    else
    begin
       group_id := grpId;
       group_paranet := '';
    end;
  end;
end;

procedure TServeJudgeFrm.SpeedButton3Click(Sender: TObject);
var
  Str: string;
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
      FormatDateTime('yyyy-mm-dd', DateTimePicker2.Date) + '['+ Title +'] '+' 服务评价信息';
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

procedure TServeJudgeFrm.DBGridEh1CellClick(Column: TColumnEh);
var
  car_No:string;
begin
  car_No := aqStore.FieldValues['car_No'];
  GCurSelectDev:=ADeviceManage.FindDevFromCarNo(car_No);
  if GCurSelectDev = nil then Exit;
  
  mainf.Edit2.Text := IntToStr(GCurSelectDev.Id);
  mainf.Edit1.Text := GCurSelectDev.Car.No;
  mainf.ShowState(GCurSelectDev);
end;

procedure TServeJudgeFrm.SpeedButton4Click(Sender: TObject);
begin
Close;
end;

procedure TServeJudgeFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ManualDock(nil);
end;

procedure TServeJudgeFrm.BitBtnToExcelClick(Sender: TObject);
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
      MyWorkbook.worksheets[1].range['A1:D1'].Merge(true);
    //单元格居中
      MyWorkbook.worksheets[1].range['A1:D2'].HorizontalAlignment := $FFFFEFF4;
    //报表头
      if ComboBox2.Text='' then
        Str := FormatDateTime('yyyy-mm-dd', DateTimePicker1.Date) + '至' +
          FormatDateTime('yyyy-mm-dd', DateTimePicker2.Date) +' 服务评价信息'
      else
        Str := FormatDateTime('yyyy-mm-dd', DateTimePicker1.Date) + '至' +
          FormatDateTime('yyyy-mm-dd', DateTimePicker2.Date) + '['+ComboBox2.Text +'] 服务评价信息';
      MyWorkbook.worksheets[1].Cells[1, 1].value := Str;
      //单元格合并
      MyWorkbook.worksheets[1].range['A2:D2'].Merge(true);
    //表头
      i := 3;
      MyWorkbook.worksheets[1].Cells[i, 1].value := '车牌号';
      MyWorkbook.worksheets[1].Cells[i, 2].value := '司机编号';
      MyWorkbook.worksheets[1].Cells[i, 3].value := '评价时间';
      MyWorkbook.worksheets[1].Cells[i, 4].value := '评价描述';

    //字体颜色
      MyWorkbook.worksheets[1].range['A1:D2'].Font.Color := clBlue;
    //字体
      MyWorkbook.worksheets[1].range['A1:D1'].Font.Name := '隶书';
    //字号
      MyWorkbook.worksheets[1].range['A1:D1'].Font.Size := 18;
    //取数
      i := i+1;
      DataSource1.DataSet.First;
       //设置单元格格式
      MyWorkbook.worksheets[1].range['B4:B'+IntToStr(DataSource1.DataSet.RecordCount+4)].NumberFormatLocal := '@';
      MyWorkbook.worksheets[1].range['B'+IntToStr(DataSource1.DataSet.RecordCount+4)+
                                     ':B'+IntToStr(DataSource1.DataSet.RecordCount+4+1)].NumberFormatLocal := '0';

      while not DataSource1.DataSet.Eof do
      begin
        MyWorkbook.worksheets[1].Cells[i, 1].value := DataSource1.DataSet.FieldByName('Car_no').AsString;
        MyWorkbook.worksheets[1].Cells[i, 2].value := DataSource1.DataSet.FieldByName('DriverServeNum').AsString;
        MyWorkbook.worksheets[1].Cells[i, 3].value := DataSource1.DataSet.FieldByName('Judge_Time').AsString;
        MyWorkbook.worksheets[1].Cells[i, 4].value := DataSource1.DataSet.FieldByName('Judge_Result').AsString;
        DataSource1.DataSet.Next;
        inc(i);
      end;

      //加入合计行 sha
      MyWorkbook.worksheets[1].Cells[i, 1].value :='合计:';
      MyWorkbook.worksheets[1].Cells[i, 2].value := DBGridEh1.Columns[2].Footer.SumValue;
      MyWorkbook.worksheets[1].Cells[i, 3].value := '';
      MyWorkbook.worksheets[1].Cells[i, 4].value := '';

    //设置列宽
      //for j := 1 to 4 do
      MyWorkbook.worksheets[1].Columns[1].ColumnWidth :=10;
      MyWorkbook.worksheets[1].Columns[2].ColumnWidth :=25;
      MyWorkbook.worksheets[1].Columns[3].ColumnWidth :=25;
      MyWorkbook.worksheets[1].Columns[4].ColumnWidth :=30;
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

procedure TServeJudgeFrm.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  {//隔行的背景色不同
   if DBGridEh1.SumList.RecNo mod 2 = 1 then
      Background := $00FFC4C4
   else
      Background := $00FFDDDD; }

end;


{procedure TServeJudgeFrm.SGDrawCell(Sender:   TObject;   ACol,   ARow:   Integer;
        ARect:   TRect;   AState:   TGridDrawState);
  var
  r:TRect;
  d:TDBGridEh; //TStringGrid;
  s:string;   
  ts:TStrings;
  i,n:integer;   
  fixed:Boolean;
  begin

  d:= TDBGridEh(sender);
  if   (Acol=2)   and   (ARow=0)   then
  begin
    r.left:=ARect.left-1-d.colwidths[ACol-1];
    r.top:=Arect.top-1;
    r.right:=Arect.right;
    r.bottom:=Arect.bottom;
    s:=d.cells[ACol-1,ARow];
  end   else
  if   (Acol=1)   and   (ARow=0)   then
  begin
    r.left:=ARect.left-1;
    r.top:=Arect.top-1;
    r.right:=Arect.right+d.colwidths[ACol+1];
    r.bottom:=Arect.bottom;
    s:=d.cells[ACol,ARow];
  end       //////////以上列合并
  else   
  if   (Acol=0)   and   (ARow=2)   then
  begin   
    r.left:=ARect.left-1;
    r.top:=Arect.top-1-d.RowHeights[ARow-1];
    r.right:=Arect.right;
    r.bottom:=Arect.bottom;
    s:=d.cells[ACol,ARow-1];
  end   else   
  if   (Acol=1)   and   (ARow=0)   then
  begin   
    r.left:=ARect.left-1;
    r.top:=Arect.top-1;
    r.right:=Arect.right;
    r.bottom:=Arect.bottom+d.RowHeights[ARow+1];
    s:=d.cells[ACol,ARow];
  end     ////////以上为行合并
  else
  begin   
    r.left:=ARect.left-1;
    r.top:=Arect.top-1;
    r.right:=Arect.right;
    r.bottom:=Arect.bottom;
    s:=d.cells[ACol,ARow];
  end;   

  d.Canvas.brush.color:=d.color;   
  d.canvas.Font.color:=$ff0000;
    
  Fixed:=false;
  if   (Arow<d.FixedRows)   or   (ACol<d.Fixedcols)   then   
  begin
    d.Canvas.brush.color:=d.FixedColor;   
    d.Canvas.Font.color:=$ff00ff;
    Fixed:=True;   
    //d.Canvas.Font.style:=d.Canvas.Font.style+[fsBold];
  end;   
  if   gdfocused   in   astate   then
  begin   
    d.canvas.Brush.color:=$00ff00;
  end;
  if   fixed   then
  begin
    d.Canvas.Pen.color:=$0;
    d.canvas.Rectangle(r);

    d.Canvas.Pen.color:=$f0f0f0;
    d.Canvas.Pen.Width:=2;
    d.canvas.Moveto(r.left+1,r.top+2);
    d.canvas.Lineto(r.left+r.right,r.top+2);

    d.Canvas.Pen.color:=$808080;
    d.Canvas.Pen.Width:=1;
    d.canvas.Moveto(r.Left+1,r.bottom-1);
    d.canvas.Lineto(r.left+r.right,r.bottom-1);

  end   else
  begin
    d.Canvas.Pen.color:=$0;
    d.Canvas.Pen.Width:=1;
    d.canvas.Rectangle(r);
  end;
  n:=r.top+4;
  ts:=TStringList.Create;
  ts.CommaText:=s;
  for   i:=0   to   ts.Count-1   do
  begin
    d.canvas.Textout(r.left+4,n,ts[i]);
    inc(n,d.RowHeights[ARow]);
  end;
  end;   }

procedure TServeJudgeFrm.GetQueryReturnInfo(Info: OleVariant);
begin
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
      messageErrorBox('查询服务评价信息出现错误', E.Message);
      Exit;
    end;
  end;
end;

procedure TServeJudgeFrm.BitBtn1Click(Sender: TObject);
var
  m: integer;
  FCursor: TCursor;
  i, aPos: integer;
  Str, aCarNO: string;
  //dlg: TwaitFrm;
  dev:TDevice;
  info :oleVariant;
  startDateTime, endDateTime: Tdatetime;
  xml: string;
  Query_ServeJudge: TQuery_ServeJudge;
begin
  //DBGridEh1.Columns[2].KeyValue := True;

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
      messagebox(handle, '开始日期应小于结束日期，请检查！', '提示信息', mb_ok + mb_iconinformation);
      exit;
    end;

    if FDlgProgress = nil then
      FDlgProgress := TFrmRefreshProgress.Create(self);
    FDlgProgress.SetCaption('正在载入数据，请您稍候...');
    FDlgProgress.Gauge1.MinValue := 0;
    FDlgProgress.Gauge1.MaxValue := 100;

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

    FDlgProgress.Gauge1.Progress := 5;
    FDlgProgress.Show;
    Application.ProcessMessages;

    FDlgProgress.Gauge1.MaxValue := 10 +10;
    FDlgProgress.Gauge1.Progress := 10;
    Application.ProcessMessages;

    Query_ServeJudge := TQuery_ServeJudge.Create(FromDate, ToDate, fact_Id, dev_Id, group_id,
                                                 group_paranet, BitBtn1);
    Query_ServeJudge.OnQueryReturn := GetQueryReturnInfo;

  finally
    FCursor := 0;
    if FDlgProgress.Showing then FDlgProgress.Hide;
  end;
end;

end.
