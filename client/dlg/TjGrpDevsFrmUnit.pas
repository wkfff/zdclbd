unit TjGrpDevsFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, Grids, DBGridEh, DB, DBClient,
  PrnDbgeh, ExtCtrls,
  PrViewEh, Printers, EhLibADO, ConstDefineUnit;

type
  TTjGrpDevsFrm = class(TForm)
    PrintDBGridEh1: TPrintDBGridEh;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    Panel1: TPanel;
    Panel3: TPanel;
    SpeedButtonQryOverSpeed: TSpeedButton;
    SpeedButtonPrintOverSpeed: TSpeedButton;
    BitBtnExcelOverSpeed: TBitBtn;
    BitBtn2: TBitBtn;
    RadioButtonCurrentUserGrp: TRadioButton;
    RadioButtonAllGrp: TRadioButton;
    DbGridEh1: TDBGridEh;
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButtonQryOverSpeedClick(Sender: TObject);
    procedure SpeedButtonPrintOverSpeedClick(Sender: TObject);
    procedure BitBtnExcelOverSpeedClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    ExcelApp, MyWorkbook: oleVariant;
  end;

var
  TjGrpDevsFrm: TTjGrpDevsFrm;

implementation
uses uGloabVar,comObj, ShowMessageInfo;
{$R *.dfm}

procedure TTjGrpDevsFrm.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TTjGrpDevsFrm.SpeedButtonQryOverSpeedClick(Sender: TObject);
var
  userId:Integer;
begin
  SpeedButtonQryOverSpeed.Enabled := False;
  try
    if RadioButtonCurrentUserGrp.Checked then
      userId := current_user.id
    else
      userID := -1;//所有车组

    DataSource1.Enabled := false;
    try
      ClientDataSet1.XMLData := BS.QueryGrpDevs(userId);
    except
      on E: Exception do
      begin
        messageErrorBox('查询车辆安装情况处理不正确！', e.Message);
        exit;
      end;
    end;

    if ClientDataSet1.RecordCount  <= 0 then
    begin
      MessageBox(Handle,'对不起，没有符合条件的数据！','提示',MB_OK + MB_ICONINFORMATION);
    end;
    DataSource1.Enabled := true;
  finally
    SpeedButtonQryOverSpeed.Enabled :=True;
  end;
end;

procedure TTjGrpDevsFrm.SpeedButtonPrintOverSpeedClick(Sender: TObject);
var
  s: string;
begin
  try
    if RadioButtonCurrentUserGrp.Checked then
      s:= RadioButtonCurrentUserGrp.Caption
    else
      s := RadioButtonAllGrp.Caption ;//所有车组

    s := self.Caption +#13#10#13#10+s;
    PrintDBGridEh1.PageHeader.CenterText.Clear;
    PrintDBGridEh1.PageHeader.CenterText.add(s);
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

procedure TTjGrpDevsFrm.BitBtnExcelOverSpeedClick(Sender: TObject);
var
  i, j: Integer;
  s: string;
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
      MyWorkbook.worksheets[1].range['A1:B1'].Merge(true);
    //单元格居中
      MyWorkbook.worksheets[1].range['A1:B2'].HorizontalAlignment := $FFFFEFF4;
    //报表头
      if RadioButtonCurrentUserGrp.Checked then
        s:= RadioButtonCurrentUserGrp.Caption
      else
        s := RadioButtonAllGrp.Caption ;//所有车组

      s := self.Caption +' --'+s;
      MyWorkbook.worksheets[1].Cells[1, 1].value := s;
    //表头
      i := 2;
      for j:=1 to DBGridEh1.Columns.Count do
      begin
        if not DBGridEh1.Columns.Items[j-1].Visible then Continue;
        MyWorkbook.worksheets[1].Cells[i, j].value := DBGridEh1.Columns.Items[j-1].Title.Caption;
      end;
    //字体颜色
      MyWorkbook.worksheets[1].range['A1:B2'].Font.Color := clBlue;
    //字体
      MyWorkbook.worksheets[1].range['A1:B1'].Font.Name := '隶书';
    //字号
      MyWorkbook.worksheets[1].range['A1:B1'].Font.Size := 18;
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
    //设置单元格格式
      MyWorkbook.worksheets[1].range['B'+IntToStr(ClientDataSet1.RecordCount+3)+':B'+IntToStr(ClientDataSet1.RecordCount+3)].NumberFormatLocal := '0';

    //设置列宽
      for j := 1 to DBGridEh1.Columns.Count do
        MyWorkbook.worksheets[1].Columns[j].ColumnWidth :=20;  

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

procedure TTjGrpDevsFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ManualDock(nil);
end;

end.
