unit PassengerBlacklist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Grids, DBGrids, ExtCtrls, DB, uFrmRefreshProgress,
  DBClient, uGloabVar, cxControls, cxSplitter, ComCtrls;

type
  TfrmPassengerBlacklist = class(TForm)
    ds1: TDataSource;
    Panel7: TPanel;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    TreeView1: TTreeView;
    cxSplitter1: TcxSplitter;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    btnSetBlacklist: TSpeedButton;
    btnDisBlacklist: TSpeedButton;
    edtPhone: TEdit;
    btnQuery: TBitBtn;
    Panel3: TPanel;
    grdBlacklist: TDBGrid;
    cxSplitter2: TcxSplitter;
    SpeedButton4: TSpeedButton;
    procedure btnQueryClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSetBlacklistClick(Sender: TObject);
    procedure btnDisBlacklistClick(Sender: TObject);
    procedure grdBlacklistCellClick(Column: TColumn);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
    FDlgProgress: TFrmRefreshProgress;
    clientDataSet: TClientDataSet;
    rowSelected: Boolean;
  public
    { Public declarations }
  end;

var
  frmPassengerBlacklist: TfrmPassengerBlacklist;

implementation
uses OrderUnit, ConstDefineUnit;
{$R *.dfm}

procedure TfrmPassengerBlacklist.btnQueryClick(Sender: TObject);
var
  xml: string;
  i: Integer;
begin
  try
    try
      ds1.DataSet := nil;
      if FDlgProgress = nil then
        FDlgProgress := TFrmRefreshProgress.Create(Self);

      FDlgProgress.Gauge1.Progress := 5;
      FDlgProgress.Show;
      Application.ProcessMessages;

      FDlgProgress.Gauge1.MaxValue := 10 +10;
      FDlgProgress.Gauge1.Progress := 10;
      Application.ProcessMessages;

      try
        xml := Bs.QueryPassengerByPhone(Trim(edtPhone.Text));
      except
        on E: Exception do
        begin
          if FDlgProgress.Showing then FDlgProgress.Hide;
          messagebox(handle, QUERY_WARNING_INFO, '��ʾ', mb_ok + mb_iconinformation);
          exit;
        end;
      end;

      if xml = '' then
      begin
        MessageBox(Handle, ' ��ѯʧ�ܣ����������Ƿ�����!', '��ʾ', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      clientDataSet.XMLData := xml;
      clientDataSet.Open;
      clientDataSet.First;
      if clientDataSet.RecordCount < 1 then
      begin
        FDlgProgress.Hide;
        MessageBox(Handle, 'û�з�������������!', '��ʾ', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      ds1.DataSet := clientDataSet;
      grdBlacklist.DataSource := ds1;
      rowSelected := False;
    except
      on E: Exception do
      begin
        uGloabVar.SystemLog.AddLog('�˿���Ϣ��ѯ�쳣:' + E.Message);
      end;  
    end;
  finally
    if FDlgProgress.Showing then
      FDlgProgress.Hide;
  end;
end;

procedure TfrmPassengerBlacklist.FormCreate(Sender: TObject);
begin
  clientDataSet := TClientDataSet.Create(nil);
  rowSelected := False;
end;

procedure TfrmPassengerBlacklist.FormDestroy(Sender: TObject);
begin
  ds1.DataSet := nil;
  ds1 := nil;
  clientDataSet.Free;
end;

procedure TfrmPassengerBlacklist.btnSetBlacklistClick(Sender: TObject);
var
  passeneger: TPassenger;
  Res: Integer;
begin
  if grdBlacklist.DataSource = nil then Exit;
  if grdBlacklist.DataSource.DataSet.RecordCount < 1 then Exit;
  if not rowSelected then Exit;
  if grdBlacklist.DataSource.DataSet.FieldValues['IsBlackStr'] = '��' then
  begin
    MessageBox(Handle, '�ó˿��ѱ���Ϊ������!', '��ʾ', MB_OK + MB_ICONINFORMATION);
    Exit;
  end
  else
  begin
    try
      Res := Bs.SetPassengerInBlacklist(grdBlacklist.DataSource.DataSet.FieldValues['Passenger_Id'], 1);
    except
      on E: Exception do
      begin
        messagebox(handle, QUERY_WARNING_INFO, '��ʾ', mb_ok + mb_iconinformation);
        exit;
      end;
    end;
    
    if Res = 1 then
    begin
      MessageBox(Handle, '��Ϊ�������ɹ�!', '��ʾ', MB_OK + MB_ICONINFORMATION);
      grdBlacklist.DataSource.Edit;
      grdBlacklist.DataSource.DataSet.FieldValues['IsBlackStr'] := '��';

      //��ǰ�˿ͻ�����Ϣͬ������
      passeneger := PassengerManage.GetPassenger(grdBlacklist.DataSource.DataSet.FieldValues['Passenger_Id']);
      if passeneger <> nil then
      begin
        passeneger.IsBlacklist := True;
      end;  
    end
    else
    begin
      MessageBox(Handle, '��Ϊ������ʧ��!', '��ʾ', MB_OK + MB_ICONINFORMATION);
    end;
  end;
end;

procedure TfrmPassengerBlacklist.btnDisBlacklistClick(Sender: TObject);
var
  passeneger: TPassenger;
  Res: Integer;
begin
  if grdBlacklist.DataSource = nil then Exit;
  if grdBlacklist.DataSource.DataSet.RecordCount < 1 then Exit;
  if not rowSelected then Exit;
  if grdBlacklist.DataSource.DataSet.FieldValues['IsBlackStr'] = '��' then
  begin
    MessageBox(Handle, '�ó˿�δ����Ϊ������!', '��ʾ', MB_OK + MB_ICONINFORMATION);
    Exit;
  end
  else
  begin
    try
      Res := Bs.SetPassengerInBlacklist(grdBlacklist.DataSource.DataSet.FieldValues['Passenger_Id'], 0);
    except
      on E: Exception do
      begin
        messagebox(handle, QUERY_WARNING_INFO, '��ʾ', mb_ok + mb_iconinformation);
        exit;
      end;
    end;
    
    if Res = 1 then
    begin
      MessageBox(Handle, '����������ɹ�!', '��ʾ', MB_OK + MB_ICONINFORMATION);
      grdBlacklist.DataSource.Edit;
      grdBlacklist.DataSource.DataSet.FieldValues['IsBlackStr'] := '��';

      //��ǰ�˿ͻ�����Ϣͬ������
      passeneger := PassengerManage.GetPassenger(grdBlacklist.DataSource.DataSet.FieldValues['Passenger_Id']);
      if passeneger <> nil then
      begin
        passeneger.IsBlacklist := False;
      end;
    end
    else
    begin
      MessageBox(Handle, '����������ɹ�!', '��ʾ', MB_OK + MB_ICONINFORMATION);
    end;
  end;
end;

procedure TfrmPassengerBlacklist.grdBlacklistCellClick(Column: TColumn);
begin
  rowSelected := True;
end;

procedure TfrmPassengerBlacklist.SpeedButton4Click(Sender: TObject);
begin
  Close;
end;

end.
