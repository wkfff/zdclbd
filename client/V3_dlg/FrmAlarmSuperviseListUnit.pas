unit FrmAlarmSuperviseListUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxInplaceContainer, cxControls, CarUnit, Menus;

type
  TfrmAlarmSuperviseList = class(TForm)
    cxAlarmSuperviseList: TcxTreeList;
    cxAreaAlarmListcxTreeListColumn1: TcxTreeListColumn;
    cxAreaAlarmListcxTreeListColumn2: TcxTreeListColumn;
    cxAreaAlarmListcxTreeListColumn3: TcxTreeListColumn;
    cxAreaAlarmListcxTreeListColumn4: TcxTreeListColumn;
    cxAreaAlarmListcxTreeListColumn5: TcxTreeListColumn;
    cxAreaAlarmListcxTreeListColumn6: TcxTreeListColumn;
    cxAreaAlarmListcxTreeListColumn7: TcxTreeListColumn;
    cxAreaAlarmListcxTreeListColumn8: TcxTreeListColumn;
    cxAreaAlarmListcxTreeListColumn9: TcxTreeListColumn;
    cxAreaAlarmListcxTreeListColumn10: TcxTreeListColumn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    cxAlarmSuperviseListcxTreeListColumn1: TcxTreeListColumn;
    cxAlarmSuperviseListcxTreeListColumn2: TcxTreeListColumn;
    cxAlarmSuperviseListcxTreeListColumn3: TcxTreeListColumn;
    cxAlarmSuperviseListcxTreeListColumn4: TcxTreeListColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure DoOnAlarmSupervise(alarmSupervise: TAlarmSupervise);
  end;

implementation
uses
  FrmReplyAlarmSuperviseUnit, uGloabVar, umainf;

{$R *.dfm}

{ TfrmAlarmSuperviseList }

procedure TfrmAlarmSuperviseList.DoOnAlarmSupervise(
  alarmSupervise: TAlarmSupervise);
var
  i: Integer;
  node: TcxTreeListNode;
  msg: string;
begin
  if alarmSupervise <> nil then
  begin
    if cxAlarmSuperviseList.Count >= 200 then
    begin
      i := 0;
      while i < 20 do
      begin
        node := cxAlarmSuperviseList.Items[0];
        node.Delete;
        Inc(i);
      end;
    end;

    with cxAlarmSuperviseList.Add do
    begin
      Data := alarmSupervise;

      Values[0] := alarmSupervise.Id;
      Values[1] := GetGovAlarmSrc(alarmSupervise.AlarmSrc);
      Values[2] := GetGovAlarmType(alarmSupervise.AlarmType);
      Values[3] := GetGovAlarmLevel(alarmSupervise.AlarmLevel);
      Values[4] := alarmSupervise.CarNo;
      Values[5] := alarmSupervise.AlarmSupervisor;
      Values[6] := alarmSupervise.AlarmTel;
      Values[7] := alarmSupervise.AlarmEmail;
      Values[8] := '未回复处理结果';
      Values[9] := alarmSupervise.AlarmDealStatus;
      Values[10] := GetCarCpColor(alarmSupervise.CarCpColor);
      Values[11] := FormatDateTime('yyyy-MM-dd hh:nn:ss', Now);
      Values[12] := FormatDateTime('yyyy-MM-dd hh:nn:ss', alarmSupervise.AlarmTime);
      Values[13] := FormatDateTime('yyyy-MM-dd hh:nn:ss', alarmSupervise.AlarmDeadLineTime);

      msg := Values[1] + '下发了督办报警信息';
      PopMsg('督办报警', msg);
      Mainf.resetScrollLabelCaptionWithTemp(msg);
      alarmSupervise.AlarmDealStatus := 0;
      DataServer.SendReplyAlarmSupverise(alarmSupervise.DevId, alarmSupervise.CarNo, alarmSupervise.AlarmId, alarmSupervise.AlarmDealStatus, alarmSupervise.AlarmSrc);
      Values[8] := '已回复:处理中';
      Values[9] := alarmSupervise.AlarmDealStatus;
    end;
  end;
end;

procedure TfrmAlarmSuperviseList.N1Click(Sender: TObject);
  function getDealStatusName(statusId: Integer): String;
  begin
    Result := '未回复处理结果';
    case statusId of
      0: Result := '已回复:处理中';
      1: Result := '已回复:已处理完毕';
      2: Result := '已回复:不作处理';
      3: Result := '已回复:将来处理';
    end;
  end;
var
  dlg: TfrmReplyAlarmSupervise;
  node: TCxTreeListNode;
  alarm: TAlarmSupervise;
begin
  node := cxAlarmSuperviseList.FocusedNode;
  if node = nil then Exit;
  alarm := TAlarmSupervise(node.Data);
  if alarm = nil then
  begin
    MessageBox(Handle, '该报警信息有误,无法处理', '提示', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  if node.Values[9] >= 0 then
  begin
    if MessageBox(Handle, '该条督办报警信息已汇报过处理结果，您确认需要重新汇报吗？', '确认', MB_YESNO + MB_ICONQUESTION) = IdNo then
      Exit;
  end;  

  dlg := TfrmReplyAlarmSupervise.Create(Self);
  try
    dlg.cbxResult.ItemIndex := 0;
    dlg.edtSrc.Text := node.Values[1];
    dlg.edtType.Text := node.Values[2];
    dlg.edtLevel.Text := node.Values[3];
    dlg.edtSupervisor.Text := node.Values[5];
    dlg.edtTel.Text := node.Values[6];
    dlg.edtEmail.Text := node.Values[7];
    if dlg.ShowModal = mrOk then
    begin
      node.Values[8] := getDealStatusName(dlg.cbxResult.ItemIndex);
      node.Values[9] := dlg.cbxResult.ItemIndex;
      DataServer.SendReplyAlarmSupverise(alarm.DevId, alarm.CarNo, alarm.AlarmId, dlg.cbxResult.ItemIndex, alarm.AlarmSrc);
    end;
  finally
    dlg.Free;
  end;
end;

procedure TfrmAlarmSuperviseList.N3Click(Sender: TObject);
var
  node: TcxTreeListNode;
begin
  node := cxAlarmSuperviseList.FocusedNode;
  if node = nil then Exit;
  if node.Values[9] < 0 then
  begin
    if MessageBox(Handle, '该条督办报警信息还未汇报处理结果，您确认删除吗？', '确认', MB_YESNO + MB_ICONQUESTION) = IdNo then
      Exit;
  end
  else if MessageBox(Handle, '您确认删除该条督办报警信息吗？', '确认', MB_YESNO + MB_ICONQUESTION) = IdNo then
    Exit;

  node.Delete;
  FAlarmSuperviseManage.Delete(node.Values[0]);
end;

procedure TfrmAlarmSuperviseList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Mainf.show_AlarmSupervise.Checked := False;
end;

end.
