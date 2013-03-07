unit Tj_ServeJudgeFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QueryBaseFrmUnit, PrnDbgeh, DB, cxControls, cxSplitter, Grids,
  DBGridEh, ComCtrls, StdCtrls, Buttons, ExtCtrls,uGloabVar, Series,
  TeEngine, TeeProcs, Chart, DbChart, DBClient, CarUnit, IntegerListUnit, PrViewEh,
  Printers;

type
  Tj_Chart = class
    Count: Integer;
    Desc: string;
    public
      constructor create;
  end;

type
  TTj_ServeJudgeFrm = class(TQueryBaseFrm)
    TabSheet3: TTabSheet;
    Panel5: TPanel;
    Panel6: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label1: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    ComboBox1: TComboBox;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    DateTimePicker5: TDateTimePicker;
    DateTimePicker6: TDateTimePicker;
    Panel8: TPanel;
    DBGridEh2: TDBGridEh;
    cxSplitter1: TcxSplitter;
    PageControl3: TPageControl;
    TabSheet6: TTabSheet;
    DBChart1: TDBChart;
    TabSheet7: TTabSheet;
    DBChart3: TDBChart;
    PageControl4: TPageControl;
    TabSheet4: TTabSheet;
    DBChart2: TDBChart;
    FastLineSeries1: TFastLineSeries;
    TabSheet5: TTabSheet;
    DBChart4: TDBChart;
    BarSeries1: TBarSeries;
    DataSource2: TDataSource;
    cxSplitter3: TcxSplitter;
    Panel10: TPanel;
    BFirstPage: TBitBtn;
    BitBtnLeft: TBitBtn;
    BitBtnRigth: TBitBtn;
    BitBtnZoomIn: TBitBtn;
    ButtonPrevious: TBitBtn;
    ButtonNext: TBitBtn;
    BLastPage: TBitBtn;
    BitBtnZoomOut: TBitBtn;
    ButtonZoomOld: TButton;
    LabelSelectPointInfo: TLabel;
    LabelSelectPointInfoT: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtnZoomInClick(Sender: TObject);
    procedure BitBtnZoomOutClick(Sender: TObject);
    procedure ButtonZoomOldClick(Sender: TObject);
    procedure BitBtnLeftClick(Sender: TObject);
    procedure BitBtnRigthClick(Sender: TObject);
    procedure DBChart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBChart3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);

    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
    procedure GetQueryReturnInfo(Info: OleVariant);
  public
    { Public declarations }
    aqStore2: TClientDataSet;
    procedure WithDbChart1();
    procedure WithDbChart3();
    procedure WithDbChart2();
    procedure WithDbChart4();
    procedure ScrollAxis(Axis: TChartAxis; const Percent: Double);
  end;

var
  Tj_ServeJudgeFrm: TTj_ServeJudgeFrm;

implementation
uses uFrmRefreshProgress, ConstDefineUnit, DateUtils, QueryThreadUnit, ShowMessageInfo;
{$R *.dfm}

procedure TTj_ServeJudgeFrm.FormCreate(Sender: TObject);
begin
  inherited;
  DateTimePicker4.date := now;
  DateTimePicker3.date := IncWeek(now, -1);  //向前1周
  LabelSelectPointInfo.top := -50;
  LabelSelectPointInfoT.Top := -50;
end;

procedure TTj_ServeJudgeFrm.WithDbChart1;
var
  list: TIntegerList;
  function findChart(Value: string): Integer;
  var
    i: Integer;
    temp: string;
    resulti: Integer;
  begin
    resulti := -1;
    for i:=0 to list.Count-1 do
    begin
      temp := Tj_Chart(list.Datas[i]).Desc;
      if temp = Value then
      begin
        resulti := i;
        Break;
      end;
      if i=list.Count-1 then
        resulti := -1;
    end;
    result := resulti;
  end;
var
  i,j,k: Integer;
  temp: string;
  Series: TLineSeries;
  chart: Tj_Chart;
begin

  DBChart1.Title.Text.Clear;
  if DBChart1.SeriesCount > 0 then
  begin
    DBChart1.Series[0].Clear;
    DBChart1.Series[0].Title := '';
    DBChart1.Series[0].Free;
  end;
  if Trim(ComboBox2.Text) = '' then
  begin
    if Trim(PanelSelectGroupName.Caption) <> '' then
      DBChart1.Title.Text.Add(PanelSelectGroupName.Caption + '车辆服务评价分析图')
    else
      DBChart1.Title.Text.Add('所有车辆服务评价分析图');

    DBChart1.BottomAxis.Title.Caption := '车辆';
    list := TIntegerList.Create;
    aqStore.First;
    while not aqStore.Eof do
    begin
      aqStore.FieldByName('judge_Result').AsString;
      aqStore.Next;
      Application.ProcessMessages;
    end;
    
    aqStore.First;
    i:=1;
    while not aqStore.Eof do
    begin
      j := findChart(aqStore.FieldByName('judge_Result').AsString);
      if j >= 0 then
      begin
        Tj_Chart(list.Datas[j]).Count := Tj_Chart(list.Datas[j]).Count + aqStore.FieldByName('cnt_judgeResult').AsInteger;
      end
      else
      begin
        chart := Tj_Chart.Create;
        chart.Count := aqStore.FieldByName('cnt_judgeResult').AsInteger;
        chart.Desc := aqStore.FieldByName('judge_Result').AsString;
        list.AddData(i, chart);
      end;
      aqStore.Next;
      Application.ProcessMessages;
    end;
    Series := TLineSeries.Create(DBChart1);
    //Series.ShowInLegend := False;
    Series.Marks.Visible := True;
    Series.Marks.Style := smsValue;
    Series.LinePen.Width := 2;
    Series.SeriesColor := clRed;
    DBChart1.AddSeries(Series);
    Series.Title := '总体服务评价分析图';
    //DbChart1.Series[0].AddX(0,'', clTeeColor);
    for i:=0 to list.Count-1 do
    begin
      DBChart1.Series[0].AddXY(i+1,Tj_Chart(list.Datas[i]).Count,Tj_Chart(list.Datas[i]).Desc, clTeeColor);
      Application.ProcessMessages;
    end;
  end
  else
  begin
    DBChart1.Title.Text.Add('车辆【' +Trim(ComboBox2.Text) + '】服务评价分析图');
    DBChart1.BottomAxis.Title.Caption := '评价意见';
    Series := TLineSeries.Create(DBChart1);
    Series.Marks.Visible := True;
    Series.Marks.Style := smsValue;
    //Series.Style := DBChart1.Series[0].Style;
    Series.LinePen.Width := 2;
    Series.SeriesColor := clRed;
    DBChart1.AddSeries(Series);
    //DbChart1.Series[0].AddXY(0,0,'', clTeeColor);
    aqStore.First;
    while not aqStore.Eof do
    begin
      aqStore.FieldByName('judge_Result').AsString;
      aqStore.Next;
      Application.ProcessMessages;
    end;         

    aqStore.First;
    for i:=0 to aqStore.RecordCount-1 do
    begin
      DBChart1.Series[0].AddXY(i,aqStore.FieldByName('cnt_judgeResult').AsInteger,aqStore.FieldByName('judge_Result').AsString,clTeeColor);
      aqStore.Next;
      Application.ProcessMessages;
    end;
  end;
end;

procedure TTj_ServeJudgeFrm.WithDbChart3;
var
  list: TIntegerList;
  function findChart(Value: string): Integer;
  var
    i: Integer;
    temp: string;
    resulti: Integer;
  begin
    resulti := -1;
    for i:=0 to list.Count-1 do
    begin
      temp := Tj_Chart(list.Datas[i]).Desc;
      if temp = Value then
      begin
        resulti := i;
        Break;
      end;
      if i=list.Count-1 then
        resulti := -1;
    end;
    result := resulti;
  end;
var
  i,j,k,l: Integer;
  temp: string;
  Series: TBarSeries;
  SeriesExit: Boolean;
  chart: Tj_Chart;
begin
  DBChart3.Title.Text.Clear;

  if DBChart3.SeriesCount > 0 then
  begin
    DBChart3.Series[0].Clear;
    DBChart3.Series[0].Title := '';
    DBChart3.Series[0].Free;
  end;
  if Trim(ComboBox2.Text) = '' then
  begin
    if Trim(PanelSelectGroupName.Caption) <> '' then
      DBChart3.Title.Text.Add(PanelSelectGroupName.Caption + '车辆服务评价分析图')
    else
    DBChart3.Title.Text.Add('所有车辆服务评价分析图');
    DBChart3.BottomAxis.Title.Caption := '车辆';

    list := TIntegerList.Create;
    aqStore.First;
    for i:=0 to aqStore.RecordCount-1 do
    begin
      j := findChart(aqStore.FieldByName('judge_Result').AsString);
      if j >= 0 then
      begin
        Tj_Chart(list.Datas[j]).Count := Tj_Chart(list.Datas[j]).Count + aqStore.FieldByName('cnt_judgeResult').AsInteger;
      end
      else
      begin
        chart := Tj_Chart.Create;
        chart.Count := aqStore.FieldByName('cnt_judgeResult').AsInteger;
        chart.Desc := aqStore.FieldByName('judge_Result').AsString;
        list.AddData(i, chart);
      end;
      aqStore.Next;
      Application.ProcessMessages;
    end;

    Series := TBarSeries.Create(DBChart3);
    Series.Marks.Visible := True;
    Series.Marks.Style := smsValue;
    Series.SeriesColor := clRed;
    DBChart3.AddSeries(Series);
    Series.Title := '总体服务评价分析图';

    for i:=0 to list.Count-1 do
    begin
      DBChart3.Series[0].AddXY(i,Tj_Chart(list.Datas[i]).Count,Tj_Chart(list.Datas[i]).Desc, clTeeColor);
      Application.ProcessMessages;
    end;

  end
  else
  begin
    DBChart3.Title.Text.Add('车辆【' +Trim(ComboBox2.Text) + '】服务评价分析图');
    DBChart3.BottomAxis.Title.Caption := '评价意见';
    Series := TBarSeries.Create(DBChart3);
    Series.Marks.Visible := True;
    Series.Marks.Style := smsValue; //tseriesmarksStyle
    //Series.Style := DBChart1.Series[0].Style;
    Series.SeriesColor := clRed;
    DBChart3.AddSeries(Series);
    aqStore.First;
    for i:=0 to aqStore.RecordCount-1 do
    begin
      DBChart3.Series[0].AddXY(i,aqStore.FieldByName('cnt_judgeResult').AsInteger,aqStore.FieldByName('judge_Result').AsString,clTeeColor);
      aqStore.Next;
      Application.ProcessMessages;
    end;
  end;
end;

procedure TTj_ServeJudgeFrm.WithDbChart2;
var
  list: TIntegerList;
  function findChart(Value: string): Integer;
  var
    i: Integer;
    temp: string;
    resulti: Integer;
  begin
    resulti := -1;
    for i:=0 to list.Count-1 do
    begin
      temp := Tj_Chart(list.Datas[i]).Desc;
      if temp = Value then
      begin
        resulti := i;
        Break;
      end;
      if i=list.Count-1 then
        resulti := -1;
    end;
    result := resulti;
  end;
var
  i,j,k: Integer;
  temp: string;
  Series: TLineSeries;
  chart: Tj_Chart;
begin
  DBChart2.Title.Text.Clear;

  while DBChart2.SeriesCount > 0 do
  begin
    DBChart2.Series[0].Clear;
    DBChart2.Series[0].Title := '';
    DBChart2.Series[0].Free;
  end;

  if Trim(ComboBox1.Text) = '' then
  begin
    if Trim(PanelSelectGroupName.Caption) <> '' then
      DBChart2.Title.Text.Add(PanelSelectGroupName.Caption + '车辆不满意项分析图')
    else
      DBChart2.Title.Text.Add('所有车辆不满意项分析图');
    DBChart2.BottomAxis.Title.Caption := '车辆';
    aqStore2.First;

    list := TIntegerList.Create;
    aqStore2.First;
    for i:=0 to aqStore2.RecordCount-1 do
    begin
      j := findChart(aqStore2.FieldByName('notOk_Desc').AsString);
      if j >= 0 then
      begin
        Tj_Chart(list.Datas[j]).Count := Tj_Chart(list.Datas[j]).Count + aqStore2.FieldByName('cnt_NotOk').AsInteger;
      end
      else
      begin
        chart := Tj_Chart.Create;
        chart.Count := aqStore2.FieldByName('cnt_NotOk').AsInteger;
        chart.Desc := aqStore2.FieldByName('notOk_Desc').AsString;
        list.AddData(i, chart);
      end;
      aqStore2.Next;
    end;
      Series := TLineSeries.Create(DBChart2);
      Series.LinePen.Width := 2;
      Series.SeriesColor := clRed;
      DBChart2.AddSeries(Series);
      Series.Title := '总体不满意项分析图';
      //DbChart2.Series[0].AddXY(0,0,'', clTeeColor);
    for i:=0 to list.Count-1 do
    begin
      DBChart2.Series[0].AddXY(i,Tj_Chart(list.Datas[i]).Count,Tj_Chart(list.Datas[i]).Desc, clTeeColor);
    end;
  end
  else
  begin
    DBChart2.Title.Text.Add('车辆【' +Trim(ComboBox1.Text) + '】不满意项分析图');
    DBChart2.BottomAxis.Title.Caption := '评价意见';
    Series := TLineSeries.Create(DBChart2);
    //Series.Style := DBChart1.Series[0].Style;
    Series.LinePen.Width := 2;
    Series.SeriesColor := clRed;
    DBChart2.AddSeries(Series);
    //DbChart2.Series[0].AddXY(0,0,'', clTeeColor);
    aqStore2.First;
    for i:=0 to aqStore2.RecordCount-1 do
    begin
      DBChart2.Series[0].AddXY(i,aqStore2.FieldByName('cnt_NotOk').AsInteger,aqStore2.FieldByName('notOk_Desc').AsString,clTeeColor);
      aqStore2.Next;
    end;
  end;
end;

procedure TTj_ServeJudgeFrm.WithDbChart4;
var
  list: TIntegerList;
  function findChart(Value: string): Integer;
  var
    i: Integer;
    temp: string;
    resulti: Integer;
  begin
    resulti := -1;
    for i:=0 to list.Count-1 do
    begin
      temp := Tj_Chart(list.Datas[i]).Desc;
      if temp = Value then
      begin
        resulti := i;
        Break;
      end;
      if i=list.Count-1 then
        resulti := -1;
    end;
    result := resulti;
  end;
var
  i,j,k,l: Integer;
  temp: string;
  Series: TBarSeries;
  SeriesExit: Boolean;
  chart: Tj_Chart;
begin
  DBChart4.Title.Text.Clear;

  while DBChart4.SeriesCount > 0 do
  begin
    DBChart4.Series[0].Clear;
    DBChart4.Series[0].Title := '';
    DBChart4.Series[0].Free;
  end;
  if Trim(ComboBox1.Text) = '' then
  begin
    if Trim(PanelSelectGroupName.Caption) <> '' then
      DBChart4.Title.Text.Add(PanelSelectGroupName.Caption + '车辆不满意项分析图')
    else
    DBChart4.Title.Text.Add('所有车辆不满意项分析图');
    DBChart4.BottomAxis.Title.Caption := '车辆';
    aqStore2.First;

    list := TIntegerList.Create;
    aqStore2.First;
    for i:=0 to aqStore2.RecordCount-1 do
    begin
      j := findChart(aqStore2.FieldByName('notOk_Desc').AsString);
      if j >= 0 then
      begin
        Tj_Chart(list.Datas[j]).Count := Tj_Chart(list.Datas[j]).Count + aqStore2.FieldByName('cnt_NotOk').AsInteger;
      end
      else
      begin
        chart := Tj_Chart.Create;
        chart.Count := aqStore2.FieldByName('cnt_NotOk').AsInteger;
        chart.Desc := aqStore2.FieldByName('notOk_Desc').AsString;
        list.AddData(i, chart);
      end;
      aqStore2.Next;
    end;
      Series := TBarSeries.Create(DBChart4);
      Series.Marks.Visible := True;
      Series.SeriesColor := clRed;
      DBChart4.AddSeries(Series);
      Series.Title := '总体不满意项分析图';
    for i:=0 to list.Count-1 do
    begin
      DBChart4.Series[0].AddXY(i,Tj_Chart(list.Datas[i]).Count,Tj_Chart(list.Datas[i]).Desc, clTeeColor);
    end;

  end
  else
  begin
    DBChart4.Title.Text.Add('车辆【' +Trim(ComboBox1.Text) + '】不满意项分析图');
    DBChart4.BottomAxis.Title.Caption := '评价意见';
    Series := TBarSeries.Create(DBChart4);
    Series.Marks.Visible := True;
    //Series.Style := DBChart1.Series[0].Style;
    Series.SeriesColor := clRed;
    DBChart4.AddSeries(Series);
    aqStore2.First;
    for i:=0 to aqStore2.RecordCount-1 do
    begin
      DBChart4.Series[0].AddXY(i,aqStore2.FieldByName('cnt_NotOk').AsInteger,aqStore2.FieldByName('notOk_Desc').AsString,clTeeColor);
      aqStore2.Next;
    end;
  end;
end;

procedure TTj_ServeJudgeFrm.TreeView1Click(Sender: TObject);
var
  i: integer;
  dev: TDevice;
begin
  inherited;

  try
   // ComboBox2.Items.Clear;
    ComboBox1.Clear;
    ComboBox1.ItemIndex := -1;
    for i:=0 to ComboBox2.Items.Count-1 do
    begin
      //dev := TDevice(combob);
      ComboBox1.Items.AddObject(ComboBox2.Items[i], TDevice(ComboBox2.Items.Objects[i]));
    end;

    {for i := 0 to ADeviceManage.Count - 1 do
    begin
      dev := ADeviceManage.Items[i];
      if dev = nil then Continue;
      if dev.GroupID= id then
      begin
        ComboBox2.Items.AddObject(dev.Car.No,dev);
      end;
    end;  }
  finally
  end;
end;

{ Tj_Chart }

constructor Tj_Chart.create;
begin
  Count := 0;
end;

procedure TTj_ServeJudgeFrm.SpeedButton3Click(Sender: TObject);
begin
  PrintDBGridEh1.DBGridEh := DBGridEh1;
  inherited;

end;

procedure TTj_ServeJudgeFrm.SpeedButton2Click(Sender: TObject);
var
  str: string;
  Title: string;
begin
  PrintDBGridEh1.DBGridEh := DBGridEh2;
  try
    Title := '';
    if Length(Trim(ComboBox1.Text)) > 0 then
    begin
      Title := Trim(ComboBox1.Text);
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
    Str := FormatDateTime('yyyy-mm-dd', DateTimePicker3.Date) + '至' +
      FormatDateTime('yyyy-mm-dd', DateTimePicker4.Date) + '['+ Title +']' + Self.Caption;
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

procedure TTj_ServeJudgeFrm.BitBtnZoomInClick(Sender: TObject);
begin
  inherited;
  DBChart1.ZoomPercent(120);
  ButtonZoomOld.Enabled:=True;
end;

procedure TTj_ServeJudgeFrm.BitBtnZoomOutClick(Sender: TObject);
begin
  inherited;
  DBChart1.ZoomPercent(80);     
  ButtonZoomOld.Enabled:=True;
end;

procedure TTj_ServeJudgeFrm.ButtonZoomOldClick(Sender: TObject);
begin
  inherited;
  DBChart1.UndoZoom;
  ButtonZoomOld.Enabled:= False;
  //CalPage;
end;

procedure TTj_ServeJudgeFrm.BitBtnLeftClick(Sender: TObject);
begin
  inherited;
ScrollAxis(dbChart1.BottomAxis, 50);
end;

procedure TTj_ServeJudgeFrm.BitBtnRigthClick(Sender: TObject);
begin
  inherited;
  ScrollAxis(dbChart1.BottomAxis, -50);
end;

procedure TTj_ServeJudgeFrm.ScrollAxis(Axis: TChartAxis;
  const Percent: Double);
var
  Amount: Double;
begin
  with Axis do
  begin
    Amount := -((Maximum - Minimum) / (100.0 / Percent));
    SetMinMax(Minimum - Amount, Maximum - Amount);
  end;
end;

procedure TTj_ServeJudgeFrm.DBChart1MouseMove(Sender: TObject;
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
            LabelSelectPointInfo.caption:='评价意见:'+trim(ValueMarkText[tmp])+#13#10+'次数:'+formatfloat('#',GetMarkValue(tmp));
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

procedure TTj_ServeJudgeFrm.DBChart3MouseMove(Sender: TObject;
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
            LabelSelectPointInfoT.caption:='评价意见:'+trim(ValueMarkText[tmp])+#13#10+'次数:'+formatfloat('#',GetMarkValue(tmp));
            if LabelSelectPointInfoT.left+ LabelSelectPointInfoT.Width > DBChart3.Width then
              LabelSelectPointInfoT.left := DBChart3.Width - LabelSelectPointInfoT.Width-5;
        end
        else
        begin
            LabelSelectPointInfoT.Top:=-50;
        end;
      end;
    end;           }
end;

procedure TTj_ServeJudgeFrm.GetQueryReturnInfo(Info: OleVariant);
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
        FDlgProgress.Hide;
        MessageBox(Handle,'对不起，没有符合条件的数据！','提示',MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      DataSource1.DataSet := aqStore;
      DBGridEh1.DataSource := DataSource1;

      WithDbChart1;
      WithDbChart3;
    except
      on E: Exception do
      begin
        messageErrorBox('服务评价统计结果处理不正确！', e.Message);
        exit;
      end;
    end;
  finally
  end;
end;

procedure TTj_ServeJudgeFrm.BitBtn5Click(Sender: TObject);
var
  FCursor: TCursor;
  xml: string;
  startDateTime, endDateTime: Tdatetime;
  dev:TDevice;

  Tj_ServeJudge: TTj_ServeJudge;
begin
  {if PageControl1.ActivePageIndex = 1 then
  begin
    ComboBox2.Text := ComboBox1.Text;
    DateTimePicker1.DateTime := DateTimePicker3.DateTime;
    fromTime.DateTime := DateTimePicker5.DateTime;
    DateTimePicker2.DateTime := DateTimePicker4.DateTime;
    toTime.DateTime := DateTimePicker6.DateTime;
  end;    }
  if PageControl1.ActivePageIndex = 0 then
    DataSource1.DataSet := nil;
  inherited;
  if QueryContion = False then Exit;
  screen.Cursor := FCursor;
  try
    FCursor := -11;
    //清数据
    if FDlgProgress = nil then
      FDlgProgress := TFrmRefreshProgress.Create(self);
    FDlgProgress.SetCaption('正在载入数据，请您稍候...');
    FDlgProgress.Gauge1.MinValue := 0;
    FDlgProgress.Gauge1.MaxValue := 100;

    FDlgProgress.Gauge1.Progress := 5;
    FDlgProgress.Show;
    Application.ProcessMessages;

    FDlgProgress.Gauge1.MaxValue := 10 +10;
    FDlgProgress.Gauge1.Progress := 10;
    Application.ProcessMessages;

    if PageControl1.ActivePageIndex = 0 then
    begin
       DBChart1.Title.Text.Clear;

      while DBChart1.SeriesCount > 0 do
      begin
        DBChart1.Series[0].Clear;
        DBChart1.Series[0].Title := '';
        DBChart1.Series[0].Free;
      end;

      DBChart3.Title.Text.Clear;

      while DBChart3.SeriesCount > 0 do
      begin
        DBChart3.Series[0].Clear;
        DBChart3.Series[0].Title := '';
        DBChart3.Series[0].Free;
      end;

      Tj_ServeJudge := TTj_ServeJudge.Create(FromDate, ToDate, fact_Id, dev_id,  group_Id,
                                             group_paranet, BitBtn5);
      Tj_ServeJudge.OnQueryReturn := GetQueryReturnInfo;

    end
    else if PageControl1.ActivePageIndex = 1 then
    begin

      startDateTime := DateTimePicker3.DateTime;
      endDateTime := DateTimePicker4.DateTime;
      ReplaceTime(startDateTime, DateTimePicker5.Time);
      ReplaceTime(endDateTime, DateTimePicker6.Time);
      FromDate :=  FormatDatetime('yyyy-mm-dd hh:nn:ss',startDateTime);
      ToDate := FormatDatetime('yyyy-mm-dd hh:nn:ss',endDateTime);
      if FromDate > ToDate then
      begin
        messagebox(handle, '开始日期应小于结束日期，请检查！', '提示信息', mb_ok + mb_iconinformation);
        exit;
      end;

      if ComboBox1.Text <> '' then
      begin
        dev := TDevice(ComboBox1.Items.Objects[ComboBox1.ItemIndex]);
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
        dev_id := -1;
        fact_id := -1;
      end;

      DBChart2.Title.Text.Clear;

      while DBChart2.SeriesCount > 0 do
      begin
        DBChart2.Series[0].Clear;
        DBChart2.Series[0].Title := '';
        DBChart2.Series[0].Free;
      end;

      DBChart4.Title.Text.Clear;

      while DBChart4.SeriesCount > 0 do
      begin
        DBChart4.Series[0].Clear;
        DBChart4.Series[0].Title := '';
        DBChart4.Series[0].Free;
      end;


      DataSource2.DataSet := nil;
      aqStore2 := TClientDataSet.Create(nil);
      
      try
        xml := BS.Tj_ServeJudge_NotOk(FromDate, ToDate, fact_Id,
                                        dev_id,  group_Id,
                                        group_paranet);
      except
        on E: exception do
        begin
          if FDlgProgress.Showing then FDlgProgress.Hide;
          messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
          Exit;
        end;
      end;

      FDlgProgress.GaugeProcessInc(10);
      aqStore2.XMLData := xml;
      aqStore2.Open;
      if aqStore2.RecordCount  <= 0 then
      begin
        FDlgProgress.Hide;
        MessageBox(Handle,'对不起，没有符合条件的数据！','提示',MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      DataSource2.DataSet := aqStore2;
      DBGridEh2.DataSource := DataSource2;
      WithDbChart2;
      WithDbChart4;
    end;

  finally
    FCursor := 0;
    if FDlgProgress.Showing then FDlgProgress.Hide;
  end;
end;

end.

