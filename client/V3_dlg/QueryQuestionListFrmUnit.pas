unit QueryQuestionListFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QueryBaseFrmUnit, PrnDbgeh, DB, cxControls, cxSplitter, Grids,
  DBGridEh, ComCtrls, StdCtrls, Buttons, ExtCtrls, uGloabVar;

type
  TQueryQuestionListFrm = class(TQueryBaseFrm)
    Label1: TLabel;
    Label4: TLabel;
    cbxUserType: TComboBox;
    cbxMessageState: TComboBox;
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
    procedure GetQueryReturnInfo(Info: OleVariant);
  public
    { Public declarations }
  end;

var
  QueryQuestionListFrm: TQueryQuestionListFrm;

implementation
uses uFrmRefreshProgress, ConstDefineUnit, QueryThreadUnit, ShowMessageInfo;
{$R *.dfm}

procedure TQueryQuestionListFrm.GetQueryReturnInfo(Info: OleVariant);
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
        MessageBox(Handle,'对不起，没有符合条件的数据！','提示',MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      DataSource1.DataSet := aqStore;
      DBGridEh1.DataSource := DataSource1;
    except
      on E: Exception do
      begin
        messageErrorBox('查询提问信息结果处理不正确！', e.Message);
        exit;
      end;
    end;
  finally
  end;
end;

procedure TQueryQuestionListFrm.BitBtn5Click(Sender: TObject);
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

    QueryMessageList := TQueryMessageList.Create(FromDate, ToDate, 1, MessageState, UserType,
                                      dev_id, fact_Id, group_Id, group_paranet, BitBtn5);
    QueryMessageList.OnQueryReturn := GetQueryReturnInfo;
  finally
    FCursor := 0;
    if FDlgProgress.Showing then FDlgProgress.Hide;
  end;
end;

end.
