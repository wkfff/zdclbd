unit FrmQuerySetCarRunStatePlanUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FrmBaseQueryUnit, cxGraphics, cxCustomData, cxStyles, cxTL,
  cxInplaceContainer, StdCtrls, Mask, RzEdit, RzButton, ComCtrls, RzDTP,
  RzCmboBx, RzLabel, cxControls, cxSplitter, ExtCtrls, RzPanel, cxTextEdit,
  Menus;

type
  TfrmQuerySetCarRunState = class(TfrmBaseQuery)
    cxTreeList1cxTreeListColumn1: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn2: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn3: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn4: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn5: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn6: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn7: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn8: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn9: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn10: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn11: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn12: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn13: TcxTreeListColumn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    cxTreeList1cxTreeListColumn14: TcxTreeListColumn;
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
    procedure refreshSNo;
  protected
    function initQueryCondition: Boolean; override;
    procedure DoOnQueryData(AInfo: OleVariant); override;
  public
    { Public declarations }
  end;

implementation
uses
  FrmSetCarRunStatePlanUnit, DateUtils, uGloabVar;

{$R *.dfm}

{ TfrmQuerySetCarRunState }

procedure TfrmQuerySetCarRunState.DoOnQueryData(AInfo: OleVariant);
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
          Values[0] := IntToStr(FTemp.FieldByName('ID').AsInteger);
          Values[1] := IntToStr(i + 1);
          Values[2] := FTemp.FieldByName('CAR_NO').AsString;
          Values[3] := FTemp.FieldByName('DEV_ID').AsString;
          Values[4] := FTemp.FieldByName('group_name').AsString;
          Values[5] := FormatDateTime('yyyy-MM-dd hh:nn', FTemp.FieldByName('STARTTIME').AsDateTime);
          Values[6] := FormatDateTime('yyyy-MM-dd hh:nn', FTemp.FieldByName('ENDTIME').AsDateTime);
          Values[7] := FTemp.FieldByName('STARTADDR').AsString;
          Values[8] := FTemp.FieldByName('ENDADDR').AsString;
          Values[9] := FTemp.FieldByName('MEMO').AsString;
          Values[10] := FTemp.FieldByName('MODIFYUSER').AsString;
          Values[11] := FormatDateTime('yyyy-MM-dd hh:nn:ss', FTemp.FieldByName('MODIFYTIME').AsDateTime);
          Values[12] := FTemp.FieldByName('CREATEUSER').AsString;
          Values[13] := FormatDateTime('yyyy-MM-dd hh:nn:ss', FTemp.FieldByName('CREATETIME').AsDateTime);
        end;
      except

      end;
      FTemp.Next;
    end;
  except

  end;
  edtCurrPageNo.Text := IntToStr(currPageNo);
end;

function TfrmQuerySetCarRunState.initQueryCondition: Boolean;
begin
  inherited initQueryCondition;
  FQueryCondition.Flag := 2;
end;

procedure TfrmQuerySetCarRunState.FormShow(Sender: TObject);
begin
  inherited;
  cxTreeList1cxTreeListColumn1.Visible := False;
  cxTreeList1cxTreeListColumn9.Visible := False;
  cxTreeList1cxTreeListColumn10.Visible := False;
end;

//修改记录
procedure TfrmQuerySetCarRunState.N1Click(Sender: TObject);
var
  node: TcxTreeListNode;
  dlg: TfrmSetCarRunStataePlan;
  dt: TDateTime;
begin
  if (cxTreeList1.SelectionCount > 0) then
  begin
    node := cxTreeList1.Selections[0];
    dlg := TfrmSetCarRunStataePlan.Create(nil);
    try
      with node do
      begin
        dlg.FId := Values[0];
        dlg.FCurrDevId := Values[3];

        dlg.edtCarNo.Text := Values[2];
        dlg.edtsAddr.Text := Values[7];
        dlg.edteAddr.Text := Values[8];
        dlg.RzMemo1.Text := Values[9];

        dt := StrToDateTime(Values[5]);
        dlg.sDate.Date := DateOf(dt);
        dlg.sTime.Time := TimeOf(dt);
        dt := StrToDateTime(Values[6]);
        dlg.eDate.Date := DateOf(dt);
        dlg.eTime.Time := TimeOf(dt);
      end;
      
      if dlg.ShowModal = mrOk then
      begin
        dt := dlg.sDate.Date;
        ReplaceTime(dt, dlg.sTime.Time);
        node.Values[5] := FormatDateTime('yyyy-MM-dd hh:nn', dt);
        dt := dlg.eDate.Date;
        ReplaceTime(dt, dlg.eTime.Time);
        node.Values[6] := FormatDateTime('yyyy-MM-dd hh:nn', dt);
        node.Values[7] := Trim(dlg.edtsAddr.Text);
        node.Values[8] := Trim(dlg.edteAddr.Text);
        node.Values[9] := Trim(dlg.RzMemo1.Text);
        node.Values[10] := current_user.UserName;
        node.Values[11] := FormatDateTime('yyyy-MM-dd hh:nn:ss', Now);
      end;
    finally
      dlg.Free;
    end;
  end;  
end;

//删除记录
procedure TfrmQuerySetCarRunState.N2Click(Sender: TObject);
var
  node: TcxTreeListNode;
  dt: TDateTime;
begin
  if (cxTreeList1.SelectionCount > 0) then
  begin
    node := cxTreeList1.Selections[0];
    if MessageBox(Handle, '您确认删除该条重载运行计划吗？', '确认', MB_YESNO + MB_ICONQUESTION) = IdYes then
    begin
      if Bs.DeleteSetCarRunStatePlan(node.Values[0]) then
      begin
        node.Delete;
        refreshSNo;
        MessageBox(Handle, '删除成功', '提示', MB_OK + MB_ICONINFORMATION);
      end
      else
      begin
        MessageBox(Handle, '删除失败', '提示', MB_OK + MB_ICONINFORMATION);
      end;
    end;  
  end;  
end;

procedure TfrmQuerySetCarRunState.refreshSNo;
var
  i: Integer;
  node: TcxTreeListNode;
begin
  for i := 0 to cxTreeList1.Count - 1 do
  begin
    node := cxTreeList1.Nodes[i];
    node.Values[1] := IntToStr(i + 1);
  end;  
end;

end.
