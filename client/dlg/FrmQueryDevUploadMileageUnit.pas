unit FrmQueryDevUploadMileageUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FrmBaseQueryUnit, cxGraphics, cxCustomData, cxStyles, cxTL,
  cxInplaceContainer, StdCtrls, Mask, RzEdit, RzButton, ComCtrls, RzDTP,
  RzCmboBx, RzLabel, cxControls, cxSplitter, ExtCtrls, RzPanel, cxTextEdit;

type
  TfrmQueryDevUploadMileage = class(TfrmBaseQuery)
    cxTreeList1cxTreeListColumn1: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn2: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn3: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn4: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn5: TcxTreeListColumn;
    RzLabel4: TRzLabel;
    cbxQueryFlag: TRzComboBox;
    cxTreeList1cxTreeListColumn6: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn7: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn8: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn9: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn10: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn11: TcxTreeListColumn;
    procedure cbxQueryFlagChange(Sender: TObject);
  private
    { Private declarations }
  protected
    function initQueryCondition: Boolean; override;
    procedure DoOnQueryData(AInfo: OleVariant); override;
    procedure setExcelData(ExlApp: Variant; cxTreeList: TcxTreeList); override;
    procedure setExcelFormat(ExlApp: Variant); override;
  public
    { Public declarations }
  end;

implementation
uses
  CarUnit, uGloabVar;

{$R *.dfm}

procedure TfrmQueryDevUploadMileage.DoOnQueryData(AInfo: OleVariant);
var
  i: Integer;
begin
  if (AInfo = null) or (Length(AInfo) = 0) then  Exit;

  try
    FTemp.XMLData := AInfo;
    FTemp.Open;
    FTemp.First;

    for i:= 0 to FTemp.RecordCount - 1 do
    begin
      try
        with cxTreeList1.Add do
        begin
          Values[0] := IntToStr(i + 1);
          Values[1] := FTemp.FieldByName('DEVID').AsString;
          Values[2] := FTemp.FieldByName('CAR_NO').AsString;
          Values[3] := FormatFloat('0.#',FTemp.FieldByName('allMelage').AsInteger / 1000);
          case FQueryCondition.QueryFlag of
            0:
              Values[4] := FQueryCondition.STime + '―' + FQueryCondition.ETime;
            1,2,3:
            begin
              Values[4] := FTemp.FieldByName('UPDAY').AsString;
            end;
          end;
          Values[5] := FormatFloat('0.#',FTemp.FieldByName('emptyMelage').AsInteger / 1000);
          Values[6] := FormatFloat('0.#',FTemp.FieldByName('carryMelage').AsInteger / 1000);
          Values[7] := FormatFloat('0.#',FTemp.FieldByName('emptyOils').AsFloat);
          Values[8] := FormatFloat('0.#',FTemp.FieldByName('carryOils').AsFloat);
          Values[9] := FormatFloat('0.#',FTemp.FieldByName('allOils').AsFloat);
          Values[10] := FTemp.FieldByName('group_name').AsString;
        end;
      except

      end;
      FTemp.Next;
    end;
  except

  end;
  edtCurrPageNo.Text := IntToStr(currPageNo);
end;

function TfrmQueryDevUploadMileage.initQueryCondition: Boolean;
var
  fromDate, ToDate: TDateTime;
  sFromDt, sToDt: string;
  dev: TDevice;
begin
  Result := False;
  fromDate := RzDateTimePicker1.Date;
  ReplaceTime(fromDate, RzDateTimePicker2.Time);

  ToDate := RzDateTimePicker3.Date;
  ReplaceTime(ToDate, RzDateTimePicker4.Time);

  sFromDt := FormatDateTime('yyyy-MM-dd hh:nn:ss', fromDate);
  sToDt := FormatDateTime('yyyy-MM-dd hh:nn:ss', toDate);
  FQueryCondition.STime := sFromDt;
  FQueryCondition.ETime := sToDt;
  case cbxQueryFlag.ItemIndex of
    1:
      begin
        sFromDt := FormatDateTime('yyyy-MM-dd hh', fromDate);
        sToDt := FormatDateTime('yyyy-MM-dd hh', toDate);
        FQueryCondition.STime := sFromDt + ':00:00';
        FQueryCondition.ETime := sToDt + ':59:59';
      end;
    2:
      begin
        sFromDt := FormatDateTime('yyyy-MM-dd', fromDate);
        sToDt := FormatDateTime('yyyy-MM-dd', toDate);
        FQueryCondition.STime := sFromDt + ' 00:00:00';
        FQueryCondition.ETime := sToDt + ' 23:59:59';
      end;
    3:
      begin
        sFromDt := FormatDateTime('yyyy-MM', fromDate);
        sToDt := FormatDateTime('yyyy-MM', IncMonth(ToDate, 1));
        FQueryCondition.STime := sFromDt + '-01 00:00:00';
        FQueryCondition.ETime := sToDt + '-01 00:00:00';
      end;  
  end;

  if sFromDt > sToDt then
  begin
    ShowTips('开始时间应小于结束时间，请检查！', RzDateTimePicker3);
    RzDateTimePicker3.SetFocus;
    exit;
  end;

  totalDataCount := 0;
  totalPageCount := 0;
  currPageNo := 0;
  refreshTotalDataCount;
  refreshPageNo;
  cxTreeList1.Clear;

  if cbxCarNo.ItemIndex < 0 then
  begin
    FQueryCondition.DevId := '';
  end
  else
  begin
    dev := TDevice(cbxCarNo.Items.Objects[cbxCarNo.ItemIndex]);
    if (dev = nil) then
      FQueryCondition.DevId := ''
    else
      FQueryCondition.DevId := dev.IdStr;
  end;
  if FQueryCondition.DevId = '' then
  begin
    FQueryCondition.GroupId := group_id;
    FQueryCondition.GroupIdList := group_parent;
    if FQueryCondition.GroupIdList <> '' then
      FQueryCondition.GroupId := -1;    
  end
  else
  begin
    FQueryCondition.GroupId := -1;
    FQueryCondition.GroupIdList := '';
  end;
  FQueryCondition.Flag := 1;
  FQueryCondition.QueryFlag := cbxQueryFlag.ItemIndex;
  Result := True;
end;

procedure TfrmQueryDevUploadMileage.cbxQueryFlagChange(Sender: TObject);
begin
  case cbxQueryFlag.ItemIndex of
    0://总计
      begin
        RzDateTimePicker1.Format := 'yyyy-MM-dd';
        RzDateTimePicker2.Visible := True;
        RzDateTimePicker3.Format := 'yyyy-MM-dd';
        RzDateTimePicker4.Visible := True;
        RzDateTimePicker2.Format := 'HH:mm:ss';
        RzDateTimePicker4.Format := 'HH:mm:ss';
      end;
    1://按时
      begin
        RzDateTimePicker1.Format := 'yyyy-MM-dd';
        RzDateTimePicker2.Visible := True;
        RzDateTimePicker3.Format := 'yyyy-MM-dd';
        RzDateTimePicker4.Visible := True;

        RzDateTimePicker2.Format := 'HH';
        RzDateTimePicker4.Format := 'HH';
      end;
    2://按天
      begin
        RzDateTimePicker1.Format := 'yyyy-MM-dd';
        RzDateTimePicker2.Visible := False;
        RzDateTimePicker3.Format := 'yyyy-MM-dd';
        RzDateTimePicker4.Visible := False;
      end;
    3://按月
      begin
        RzDateTimePicker1.Format := 'yyyy-MM';
        RzDateTimePicker2.Visible := False;
        RzDateTimePicker3.Format := 'yyyy-MM';
        RzDateTimePicker4.Visible := False;
      end;
  end;
end;

procedure TfrmQueryDevUploadMileage.setExcelData(ExlApp: Variant;
  cxTreeList: TcxTreeList);
begin
  inherited;

end;

procedure TfrmQueryDevUploadMileage.setExcelFormat(ExlApp: Variant);
begin
  inherited;
  ExlApp.Caption := Caption + '-' + cbxQueryFlag.Text;
  ExlApp.Columns[1].ColumnWidth :=6;
  ExlApp.Columns[2].ColumnWidth :=12;
  ExlApp.Columns[3].ColumnWidth :=12;
  ExlApp.Columns[4].ColumnWidth :=14;
  ExlApp.Columns[5].ColumnWidth :=42;
end;

end.
