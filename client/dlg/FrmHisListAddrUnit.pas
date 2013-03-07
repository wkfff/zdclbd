unit FrmHisListAddrUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit, StdCtrls,
  cxInplaceContainer, cxControls, Buttons, ExtCtrls;

type
  TFrmHisListAddr = class(TForm)
    Panel3: TPanel;
    BitBtnToExcel: TBitBtn;
    BitBtn2: TBitBtn;
    cxTreeList1: TcxTreeList;
    cxTreeList1cxTreeListColumn1: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn2: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn3: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn4: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn5: TcxTreeListColumn;
    Label5: TLabel;
    Label11: TLabel;
    EditHisDisplayCarNo: TEdit;
    EditFromTime: TEdit;
    EditToTime: TEdit;
    cxTreeList1cxTreeListColumn6: TcxTreeListColumn;
    PanelBottom: TPanel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtnToExcelClick(Sender: TObject);
  private
    procedure ExportToExcel(saveFileCaption,Caption: string; LvData: TcxTreeList);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmHisListAddr: TFrmHisListAddr;

implementation
uses ComObj;
{$R *.dfm}

procedure TFrmHisListAddr.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TFrmHisListAddr.BitBtnToExcelClick(Sender: TObject);
begin
  ExportToExcel('轨迹详细列表--'+EditHisDisplayCarNo.Text,'['+EditFromTime.Text+'到'+EditToTime.Text+']',cxTreeList1);
end;

procedure TFrmHisListAddr.ExportToExcel(saveFileCaption,Caption: string; LvData: TcxTreeList);
var
  ExlApp: Variant;
  i, j: Integer;
  fileName :string;
begin
  try
    ExlApp := CreateOleObject('Excel.Application');
    ExlApp.Workbooks.Add;
    ExlApp.Visible := false;
    ExlApp.Caption := Caption;
    ExlApp.Workbooks[1].WorkSheets[1].Rows[1].Font.Bold := True;
  except
    on E: Exception do
    begin
      Application.MessageBox(PChar('初始化Microsoft Excel失败:' + E.Message), '提示', MB_OK + MB_ICONERROR);
      ExlApp.Quit;
      Exit;
    end;
  end;
  try
    fileName :=ExtractFilePath(Application.ExeName)+ saveFileCaption +'.xls';
    Application.Restore;
    Application.BringToFront;

    // 第一行
    ExlApp.Cells(1, 1)  := saveFileCaption+' '+ Caption;
    //单元格合并
    ExlApp.worksheets[1].range['A1:F1'].Merge(true);
    
    for i := 0 to LvData.ColumnCount - 1 do
    begin
      ExlApp.Cells(2, i + 1) := LvData.Columns[i].Caption.Text;
//      if not LvData.Columns[i].Visible then
//        ExlApp.ActiveSheet.Columns[i + 1].Hidden := True;
    end;

    for i := 0 to LvData.Count - 1 do
    begin
      for j := 0 to LvData.Items[i].ValueCount-1 do
      begin
        ExlApp.Cells[i +3, j+1 ] := LvData.Items[i].Values[j];
      end;
    end;
    //合适的列宽
    for i := 1 to LvData.ColumnCount do
      ExlApp.Columns[i].EntireColumn.AutoFit;
    ExlApp.Workbooks[1].SaveAs(fileName);
    ExlApp.Visible :=true;
  finally               
    //ExlApp.Quit; //★★
    ExlApp := Unassigned;
  end;
end;


end.
