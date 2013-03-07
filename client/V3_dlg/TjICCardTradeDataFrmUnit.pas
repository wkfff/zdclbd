unit TjICCardTradeDataFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QueryBaseFrmUnit, PrnDbgeh, DB, cxControls, cxSplitter, Grids,
  DBGridEh, ComCtrls, StdCtrls, Buttons, ExtCtrls, uGloabVar, Series,
  TeEngine, TeeProcs, Chart, DbChart, ComObj;

type
  TTjICCardTradeDataFrm = class(TQueryBaseFrm)
    PageControl3: TPageControl;
    TabSheet7: TTabSheet;
    DBChart1: TDBChart;
    FastLineSeries2: TBarSeries;
    Series1: TBarSeries;
    cxSplitter1: TcxSplitter;
    BitBtn1: TBitBtn;
    LabelSelectPointInfo: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure DBChart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TjICCardTradeDataFrm: TTjICCardTradeDataFrm;

implementation
uses uFrmRefreshProgress, ConstDefineUnit, ShowMessageInfo;
{$R *.dfm}

procedure TTjICCardTradeDataFrm.BitBtn1Click(Sender: TObject);
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
      MyWorkbook.worksheets[1].range['A1:H1'].Merge(true);
    //单元格居中
      MyWorkbook.worksheets[1].range['A1:H2'].HorizontalAlignment := $FFFFEFF4;
    //报表头
      if ComboBox2.Text='' then
        Str := FormatDateTime('yyyy-mm-dd', DateTimePicker1.Date) + '至' +
          FormatDateTime('yyyy-mm-dd', DateTimePicker2.Date) +' 刷卡交易统计'
      else
        Str := FormatDateTime('yyyy-mm-dd', DateTimePicker1.Date) + '至' +
          FormatDateTime('yyyy-mm-dd', DateTimePicker2.Date) + '['+ComboBox2.Text +'] 刷卡交易统计';
      MyWorkbook.worksheets[1].Cells[1, 1].value := Str;
      //单元格合并
      MyWorkbook.worksheets[1].range['A2:H2'].Merge(true);
    //表头
      i := 3;
      MyWorkbook.worksheets[1].Cells[i, 1].value := '车机编号';
      MyWorkbook.worksheets[1].Cells[i, 2].value := '车牌号';
      MyWorkbook.worksheets[1].Cells[i, 3].value := '次数';
      MyWorkbook.worksheets[1].Cells[i, 4].value := '金额';
      MyWorkbook.worksheets[1].Cells[i, 5].value := '未结算次数';
      MyWorkbook.worksheets[1].Cells[i, 6].value := '未结算金额';
      MyWorkbook.worksheets[1].Cells[i, 7].value := '已成功结算次数';
      MyWorkbook.worksheets[1].Cells[i, 8].value := '已成功结算金额';

    //字体颜色
      MyWorkbook.worksheets[1].range['A1:H2'].Font.Color := clBlue;
    //字体
      MyWorkbook.worksheets[1].range['A1:H1'].Font.Name := '隶书';
    //字号
      MyWorkbook.worksheets[1].range['A1:H1'].Font.Size := 18;
    //取数
      i := i+1;
      DataSource1.DataSet.First;
       //设置单元格格式
      MyWorkbook.worksheets[1].range['B4:B'+IntToStr(DataSource1.DataSet.RecordCount+4)].NumberFormatLocal := '@';
      MyWorkbook.worksheets[1].range['B'+IntToStr(DataSource1.DataSet.RecordCount+4)+
                                     ':C'+IntToStr(DataSource1.DataSet.RecordCount+4)].NumberFormatLocal := '0';
      MyWorkbook.worksheets[1].range['D4:D'+IntToStr(DataSource1.DataSet.RecordCount+4+1 )].NumberFormatLocal := '0.00';
      MyWorkbook.worksheets[1].range['E4:E'+IntToStr(DataSource1.DataSet.RecordCount+4+1 )].NumberFormatLocal := '0';
      MyWorkbook.worksheets[1].range['F4:F'+IntToStr(DataSource1.DataSet.RecordCount+4+1 )].NumberFormatLocal := '0.00';
      MyWorkbook.worksheets[1].range['G4:G'+IntToStr(DataSource1.DataSet.RecordCount+4+1 )].NumberFormatLocal := '0';
      MyWorkbook.worksheets[1].range['H4:H'+IntToStr(DataSource1.DataSet.RecordCount+4+1 )].NumberFormatLocal := '0.00';
      while not DataSource1.DataSet.Eof do
      begin
        MyWorkbook.worksheets[1].Cells[i, 1].value := DataSource1.DataSet.FieldByName('dev_id').AsString;
        MyWorkbook.worksheets[1].Cells[i, 2].value := DataSource1.DataSet.FieldByName('Car_no').AsString;
        MyWorkbook.worksheets[1].Cells[i, 3].value := DataSource1.DataSet.FieldByName('Count').AsString;
        MyWorkbook.worksheets[1].Cells[i, 4].value := DataSource1.DataSet.FieldByName('TradeMoneySum').AsString;

        MyWorkbook.worksheets[1].Cells[i, 5].value := DataSource1.DataSet.FieldByName('notUpCount').AsString;
        MyWorkbook.worksheets[1].Cells[i, 6].value := DataSource1.DataSet.FieldByName('notUpTradeMoneySum').AsString;
        MyWorkbook.worksheets[1].Cells[i, 7].value := DataSource1.DataSet.FieldByName('upokCount').AsString;
        MyWorkbook.worksheets[1].Cells[i, 8].value := DataSource1.DataSet.FieldByName('upOkTradeMoneySum').AsString;
        DataSource1.DataSet.Next;
        inc(i);
      end;

      //加入合计行 sha
      MyWorkbook.worksheets[1].Cells[i, 1].value :='合计:';
      MyWorkbook.worksheets[1].Cells[i, 2].value := DBGridEh1.Columns[1].Footer.SumValue;
      MyWorkbook.worksheets[1].Cells[i, 3].value := DBGridEh1.Columns[3].Footer.SumValue;
      MyWorkbook.worksheets[1].Cells[i, 4].value := DBGridEh1.Columns[4].Footer.SumValue;

      MyWorkbook.worksheets[1].Cells[i, 5].value := DBGridEh1.Columns[5].Footer.SumValue;
      MyWorkbook.worksheets[1].Cells[i, 6].value := DBGridEh1.Columns[6].Footer.SumValue;
      MyWorkbook.worksheets[1].Cells[i, 7].value := DBGridEh1.Columns[7].Footer.SumValue;
      MyWorkbook.worksheets[1].Cells[i, 8].value := DBGridEh1.Columns[8].Footer.SumValue;

    //设置列宽
      for j := 1 to 8 do
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

procedure TTjICCardTradeDataFrm.DBChart1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
   tmp:integer;
begin
    {if  DBChart1.SeriesCount > 1 then
    begin
      With DBChart1.Series[0] do
      begin
        tmp:=Clicked(x,y);
        if tmp<> -1 then
        begin
            LabelSelectPointInfo.top:= y - 30;
            LabelSelectPointInfo.left:= x+10 ;
            LabelSelectPointInfo.caption:='金额:'+trim(ValueMarkText[tmp])+#13#10+'次数:'+formatfloat('#.#',GetMarkValue(tmp));
            if LabelSelectPointInfo.left+ LabelSelectPointInfo.Width > DBChart1.Width then
              LabelSelectPointInfo.left := DBChart1.Width - LabelSelectPointInfo.Width-5;
        end
        else
        begin
            LabelSelectPointInfo.Top:=-50;
        end;
      end;
    end;      }
end;

procedure TTjICCardTradeDataFrm.FormCreate(Sender: TObject);
begin
  inherited;
  LabelSelectPointInfo.Top:=-50;
end;

procedure TTjICCardTradeDataFrm.BitBtn5Click(Sender: TObject);
var
  FCursor: TCursor;
  xml: string;
  i: Integer;
begin
  inherited;
  DataSource1.DataSet := nil;
  DBChart1.Series[0].Clear;
  DBChart1.Series[1].Clear;

  if QueryContion = False then Exit;
  screen.Cursor := FCursor;
  try
    FCursor := -11;
    //清数据
    //DataSource1.DataSet := nil;
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

    try
      xml := BS.Tj_ICCardTradeDataList(FromDate, ToDate, dev_id, fact_Id, group_Id, group_paranet);
    except
      on E: Exception do
      begin
        if FDlgProgress.Showing then FDlgProgress.Hide;
        messageErrorBox('刷卡交易统计结果处理不正确！', e.Message);
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
    DBGridEh1.DataSource := DataSource1;

    //DBChart1.Series[0].Clear;
    //DBChart1.Series[1].Clear;

    aqStore.First;
    while not aqStore.Eof do
    begin
      aqStore.FieldByName('TradeMoneySum').AsFloat;
      aqStore.Next;
      Application.ProcessMessages;
    end;

    aqStore.First;
    for i:=0 to aqStore.RecordCount-1 do
    begin
      with DBChart1.Series[0] do
      begin
        AddXY(i, aqStore.FieldByName('TradeMoneySum').AsFloat, aqStore.FieldByName('CAR_NO').AsString);
      end;
      with DBChart1.Series[1] do
      begin
        AddXY(i, aqStore.FieldByName('Count').AsInteger, aqStore.FieldByName('CAR_NO').AsString);
      end;
      aqStore.Next;
      Application.ProcessMessages;
    end;
  finally
    FCursor := 0;
    if FDlgProgress.Showing then FDlgProgress.Hide;
  end;
end;

end.
