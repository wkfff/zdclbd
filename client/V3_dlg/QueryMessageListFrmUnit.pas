unit QueryMessageListFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QueryBaseFrmUnit, PrnDbgeh, DB, cxControls, cxSplitter, Grids,
  DBGridEh, ComCtrls, StdCtrls, Buttons, ExtCtrls, uGloabVar, ADODB;

type
  TQueryMessageListFrm = class(TQueryBaseFrm)
    Label1: TLabel;
    cbxUserType: TComboBox;
    Label4: TLabel;
    cbxMessageState: TComboBox;
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
    procedure GetQueryReturnInfo(Info: OleVariant);
  public
    { Public declarations }
    procedure EditDbGrid;
  end;

var
  QueryMessageListFrm: TQueryMessageListFrm;

implementation
uses uFrmRefreshProgress, ConstDefineUnit, QueryThreadUnit, ShowMessageInfo;

{$R *.dfm}

procedure TQueryMessageListFrm.EditDbGrid;
var
  i: Integer;
begin
  for i:=0 to DataSource1.DataSet.RecordCount-1 do
  begin
    if DBGridEh1.DataSource.DataSet.FieldValues['MSG_SENDTIME']<='2000-1-1' then
    begin
     DBGridEh1.DataSource.DataSet.Edit;
     DBGridEh1.DataSource.DataSet.FieldValues['MSG_SENDTIME']:=null;
    end;

    if DBGridEh1.DataSource.DataSet.FieldValues['MSG_RECVTIME']<='2000-1-1' then
    begin
     DBGridEh1.DataSource.DataSet.Edit;
     DBGridEh1.DataSource.DataSet.FieldValues['MSG_RECVTIME']:=null;
    end;

    DBGridEh1.DataSource.DataSet.Edit;
    case DBGridEh1.DataSource.DataSet.FieldValues['msg_state'] of
      0: DBGridEh1.DataSource.DataSet.FieldValues['msg_memo']:='δ����';
      1: DBGridEh1.DataSource.DataSet.FieldValues['msg_memo']:='�ѷ���';
      2: DBGridEh1.DataSource.DataSet.FieldValues['msg_memo']:='�����ѽ���';
      9: DBGridEh1.DataSource.DataSet.FieldValues['msg_memo']:='����ʧ��';
      else
        DBGridEh1.DataSource.DataSet.FieldValues['msg_memo']:='δ֪';

      //orderCountSucess:=orderCountSucess+1;
    end;
    DataSource1.DataSet.Next;
  end;
end;

procedure TQueryMessageListFrm.GetQueryReturnInfo(Info: OleVariant);
begin
  try
    try
      FDlgProgress.GaugeProcessInc(10);
      
      if Info = null then
      begin
        messagebox(0, '�Բ���û�������ѯҪ�����Ϣ��', '��ʾ', mb_ok + MB_ICONWARNING);
        Exit;
      end;

      aqStore.XMLData := Info;

      aqStore.Open;
      if aqStore.RecordCount  <= 0 then
      begin
        MessageBox(Handle,'�Բ���û�з������������ݣ�','��ʾ',MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      DataSource1.DataSet := aqStore;
      DBGridEh1.DataSource := DataSource1;
    except
      on E: Exception do
      begin
        messageErrorBox('��ѯ�ı���Ϣ���������ȷ��', e.Message);
        exit;
      end;
    end;
  finally
  end;
end;

procedure TQueryMessageListFrm.BitBtn5Click(Sender: TObject);
var
  MessageState: Integer;
  UserType: Boolean;
  xml: string;
  FCursor: TCursor;
  QueryMessageList: TQueryMessageList;
begin
  inherited;
  DataSource1.DataSet := nil;
  if QueryContion = False then Exit;
  if cbxMessageState.ItemIndex = 4 then
    MessageState := 9
  else
    MessageState := cbxMessageState.ItemIndex - 1;
  UserType := (cbxUserType.ItemIndex and 1) = 1;

  screen.Cursor := FCursor;
  try
    FCursor := -11;
    //������
    //DataSource1.DataSet := nil;
    if FDlgProgress = nil then
      FDlgProgress := TFrmRefreshProgress.Create(self);
    FDlgProgress.SetCaption('�����������ݣ������Ժ�...');
    FDlgProgress.Gauge1.MinValue := 0;
    FDlgProgress.Gauge1.MaxValue := 100;

    FDlgProgress.Gauge1.Progress := 5;
    FDlgProgress.Show;
    Application.ProcessMessages;

    FDlgProgress.Gauge1.MaxValue := 10 +10;
    FDlgProgress.Gauge1.Progress := 10;
    Application.ProcessMessages;

    QueryMessageList := TQueryMessageList.Create(FromDate, ToDate, 0, MessageState, UserType,
                                      dev_id, fact_Id, group_Id, group_paranet, BitBtn5);
    QueryMessageList.OnQueryReturn := GetQueryReturnInfo;

  finally
    FCursor := 0;
    if FDlgProgress.Showing then FDlgProgress.Hide;
  end;
end;

end.
