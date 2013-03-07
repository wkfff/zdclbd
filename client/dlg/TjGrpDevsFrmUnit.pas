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
      userID := -1;//���г���

    DataSource1.Enabled := false;
    try
      ClientDataSet1.XMLData := BS.QueryGrpDevs(userId);
    except
      on E: Exception do
      begin
        messageErrorBox('��ѯ������װ���������ȷ��', e.Message);
        exit;
      end;
    end;

    if ClientDataSet1.RecordCount  <= 0 then
    begin
      MessageBox(Handle,'�Բ���û�з������������ݣ�','��ʾ',MB_OK + MB_ICONINFORMATION);
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
      s := RadioButtonAllGrp.Caption ;//���г���

    s := self.Caption +#13#10#13#10+s;
    PrintDBGridEh1.PageHeader.CenterText.Clear;
    PrintDBGridEh1.PageHeader.CenterText.add(s);
    PrintDBGridEh1.PageFooter.LeftText.Clear;
    PrintDBGridEh1.PageFooter.LeftText.Add('��ӡʱ�䣺'+FormatDateTime('yyyy-mm-dd hh:nn',now));
    PrintDBGridEh1.PageFooter.RightText.Clear;
    PrintDBGridEh1.PageFooter.RightText.Add(ReportFooter);
    PrinterPreview.Previewer.ViewMode := vmPageWidth;
    PrinterPreview.Orientation := poPortrait;
    PrintDBGridEh1.PageFooter.CenterText.Clear;
    PrintDBGridEh1.PageFooter.CenterText.Add('��&[Page]ҳ����&[Pages]ҳ');
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
      on Exception do raise Exception.Create('�޷�����EXCEL!��ȷ���Ѱ�װ!')
    end;
    try
      ExcelApp.Visible := true;
    //����һ��������
      MyWorkbook := ExcelApp.workBooks.add;
    //��Ԫ��ϲ�
      MyWorkbook.worksheets[1].range['A1:B1'].Merge(true);
    //��Ԫ�����
      MyWorkbook.worksheets[1].range['A1:B2'].HorizontalAlignment := $FFFFEFF4;
    //����ͷ
      if RadioButtonCurrentUserGrp.Checked then
        s:= RadioButtonCurrentUserGrp.Caption
      else
        s := RadioButtonAllGrp.Caption ;//���г���

      s := self.Caption +' --'+s;
      MyWorkbook.worksheets[1].Cells[1, 1].value := s;
    //��ͷ
      i := 2;
      for j:=1 to DBGridEh1.Columns.Count do
      begin
        if not DBGridEh1.Columns.Items[j-1].Visible then Continue;
        MyWorkbook.worksheets[1].Cells[i, j].value := DBGridEh1.Columns.Items[j-1].Title.Caption;
      end;
    //������ɫ
      MyWorkbook.worksheets[1].range['A1:B2'].Font.Color := clBlue;
    //����
      MyWorkbook.worksheets[1].range['A1:B1'].Font.Name := '����';
    //�ֺ�
      MyWorkbook.worksheets[1].range['A1:B1'].Font.Size := 18;
    //ȡ��
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

      //����ϼ��� sha ��
      MyWorkbook.worksheets[1].Cells[i, 1].value :='�ϼ�:';
      MyWorkbook.worksheets[1].Cells[i, 2].value := DBGridEh1.Columns[1].Footer.SumValue;
    //���õ�Ԫ���ʽ
      MyWorkbook.worksheets[1].range['B'+IntToStr(ClientDataSet1.RecordCount+3)+':B'+IntToStr(ClientDataSet1.RecordCount+3)].NumberFormatLocal := '0';

    //�����п�
      for j := 1 to DBGridEh1.Columns.Count do
        MyWorkbook.worksheets[1].Columns[j].ColumnWidth :=20;  

    //�����и�
      MyWorkbook.worksheets[1].Rows[1].RowHeight := 50;
    //����ͷ����
      MyWorkbook.worksheets[1].Rows[1].VerticalAlignment := $FFFFEFF4;
    {//��������������
      s := 'A1:K' + inttostr(ClientDataSet1.RecordCount - 2);
      MyWorkbook.worksheets[1].range[s].Font.Name := '����';
    //������
      s := 'A2:K' + inttostr(ClientDataSet1.RecordCount + 2);
      MyWorkbook.worksheets[1].range[s].Borders.LineStyle := 1;  }
    //����ҳ��
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
