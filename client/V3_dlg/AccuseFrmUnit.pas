unit AccuseFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, Grids, DBGrids, ExtCtrls, StdCtrls, ComCtrls,uGloabVar,
  DB, ADODB, Menus, DBClient, uFrmRefreshProgress, DateUtils, DealideaFrmUnit,
  ToolWin, ImgList, CmdStructUnit, ConstDefineUnit, cxControls, cxSplitter;

type
  TAccuseFrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    Panel5: TPanel;
    Panel6: TPanel;
    PanelNew: TPanel;
    PanelDeal: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    ComboBoxType: TComboBox;
    EditAccuse_Carno_old: TEdit;
    Datecase_HappenDate: TDateTimePicker;
    Datecase_HappenTime: TDateTimePicker;
    Memocase_HappenAddr: TMemo;
    MemoAccuse_Reason: TMemo;
    EditpassengerName: TEdit;
    EditPassengerTelNum: TEdit;
    MemoPassengerMemo: TMemo;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    MemoDealContent: TMemo;
    EditDealMan: TEdit;
    EditDealManTel: TEdit;
    EditDealDepartment: TEdit;
    DateDealDate: TDateTimePicker;
    DateDealTime: TDateTimePicker;
    PanelCheck: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    MemoCheck_Result: TMemo;
    EditCheck_man: TEdit;
    Label21: TLabel;
    Label22: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Label23: TLabel;
    FromDate: TDateTimePicker;
    FromTime: TDateTimePicker;
    Label24: TLabel;
    ToDate: TDateTimePicker;
    ToTime: TDateTimePicker;
    btnQuery: TSpeedButton;
    DataSource1: TDataSource;
    ComboBoxState: TComboBox;
    Label25: TLabel;
    Label26: TLabel;
    EditState: TEdit;
    PopupMenu2: TPopupMenu;
    N6: TMenuItem;
    N8: TMenuItem;
    Label27: TLabel;
    MemoDealIdea: TMemo;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    ToolBar1: TToolBar;
    btnNew: TToolButton;
    btnEdit: TToolButton;
    btnCancel: TToolButton;
    btnSave: TToolButton;
    btnRefresh: TToolButton;
    btnSubmit: TToolButton;
    ImageList1: TImageList;
    btnDelete: TToolButton;
    N7: TMenuItem;
    Label42: TLabel;
    editRunDataID: TEdit;
    btnClose: TToolButton;
    edtDriverName: TEdit;
    lblDriverName: TLabel;
    chkIntegral: TCheckBox;
    TimerClose: TTimer;
    TimerShow: TTimer;
    cxSplitter2: TcxSplitter;
    EditAccuse_Carno: TComboBox;
    procedure btnNewClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure btnSubmitClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure editRunDataIDKeyPress(Sender: TObject; var Key: Char);
    procedure EditPassengerTelNumKeyPress(Sender: TObject; var Key: Char);
    procedure btnCloseClick(Sender: TObject);
    procedure TimerCloseTimer(Sender: TObject);
    procedure TimerShowTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDeactivate(Sender: TObject);
    procedure EditAccuse_CarnoChange(Sender: TObject);
    procedure EditAccuse_CarnoKeyPress(Sender: TObject; var Key: Char);
    procedure EditAccuse_CarnoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditAccuse_CarnoSelect(Sender: TObject);
  private
    { Private declarations }
    FDlgProgress:TFrmRefreshProgress;
  public
    { Public declarations }
    DealType: Byte; //0:新建 1:调查中 2:处理中 3:结束
    FSearch: Boolean;
    procedure SaveNew();
    procedure SaveDeal();
    procedure SaveCheck();
    procedure EditNew();

    function CheckNewEdit(): Boolean;

    procedure ReturnState(Value: Byte);

    procedure InitialEdit();

    procedure QueryInfo(bMessage: Boolean = False);

    procedure CreateParams(Var Param:TCreateParams);override;

    function GetPassengerId(const passengerPhone: string): Integer;
  end;

var
  AccuseFrm: TAccuseFrm;
  Accuse_Id: Integer;
  State: Integer;       // 0: 新建; 1: 取证；2：处理；3：结束
  EditBool: Boolean;
  aqStore: TClientDataSet;
implementation
uses CarUnit;
{$R *.dfm}

{ TAccuseFrm }

procedure TAccuseFrm.CreateParams(var Param: TCreateParams);
begin
  Inherited CreateParams(Param);
  Param.wndParent := GetDesktopWindow;
end;

procedure TAccuseFrm.btnNewClick(Sender: TObject);
begin
  EditBool := False;
  InitialEdit;

  btnEdit.Enabled := False;
  btnSubmit.Enabled := False;
  
  btnDelete.Enabled := False;

  PanelNew.Enabled := True;
  PanelDeal.Enabled := False;
  PanelCheck.Enabled := False;

  EditState.Text := '新建';
  EditAccuse_Carno.SetFocus;
  State := 0;
end;

procedure TAccuseFrm.SaveNew;
var
  happenDateTime: TDateTime;
  HappenDateTimeStr: string;
  RundataID: Integer;
  orderDriverId: Integer;
  SaveResult: Integer;
  devId: Integer;
  dev: TDevice;
begin
  if not CheckNewEdit() then
    Exit;

  happenDateTime := Datecase_HappenDate.DateTime;
  ReplaceTime(happenDateTime, Datecase_HappenTime.Time);
  HappenDateTimeStr := FormatDatetime('yyyy-mm-dd hh:nn:ss',happenDateTime);
  if Trim(editRunDataID.Text) = '' then
    RundataID := -1
  else
    RundataID := StringToInteger(Trim(editRunDataID.Text));
  try
    if ComboBoxType.ItemIndex = 2 then
    begin
      dev := ADeviceManage.FindDevFromCarNo(Trim(EditAccuse_Carno.Text));
      orderDriverId := -1;
      if dev <> nil then
        orderDriverId := AOrderManage.getOrderDriverId(dev.id, Trim(EditPassengerTelNum.Text), happenDateTime);
      SaveResult := bs.AddNewAccuseDriver_driverId(ComboBoxType.ItemIndex, EditAccuse_Carno.Text,
                            RundataID, HappenDateTimeStr, Memocase_HappenAddr.Text,
                            MemoAccuse_Reason.Text, EditpassengerName.Text,
                            EditPassengerTelNum.Text, MemoPassengerMemo.Text, -1, orderDriverId);
    end
    else
    begin
      SaveResult := Bs.AddNewAccuseDriver(ComboBoxType.ItemIndex, EditAccuse_Carno.Text,
                            RundataID, HappenDateTimeStr, Memocase_HappenAddr.Text,
                            MemoAccuse_Reason.Text, EditpassengerName.Text,
                            EditPassengerTelNum.Text, MemoPassengerMemo.Text, -1);
    end;
    if SaveResult = -1 then
    begin
      messagebox(handle, '保存失败', '提示', mb_ok + mb_iconinformation);
    end
    else
    begin
      InitialEdit;
      PanelNew.Enabled := False;
      EditBool := False;
      btnEdit.Enabled := False;
      btnDelete.Enabled := False;
      QueryInfo(False);
      messagebox(handle, '保存成功', '提示', mb_ok + mb_iconinformation);
    end;
  except
    on E: Exception do
    begin
      messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
      exit;
    end;
  end;
end;

procedure TAccuseFrm.EditNew();
var
  happenDateTime: TDateTime;
  HappenDateTimeStr: string;
  RunDataID: Integer;
begin
  if not CheckNewEdit() then
    Exit;
  happenDateTime := Datecase_HappenDate.DateTime;
  ReplaceTime(happenDateTime, Datecase_HappenTime.Time);
  if Trim(editRunDataID.Text) = '' then
    RunDataID := -1
  else
    RunDataID := StringToInteger(editRunDataID.Text);
  HappenDateTimeStr := FormatDatetime('yyyy-mm-dd hh:nn:ss',happenDateTime);
  try
    if Bs.ModifyAAccuseDriver_BaseInfo(Accuse_Id,ComboBoxType.ItemIndex, EditAccuse_Carno.Text,
                                      RunDataID, HappenDateTimeStr, Memocase_HappenAddr.Text,
                                      MemoAccuse_Reason.Text, EditpassengerName.Text,
                                      EditPassengerTelNum.Text, MemoPassengerMemo.Text, -1, State) = -1 then
    begin
      messagebox(handle, '保存失败', '提示', mb_ok + mb_iconinformation);
    end
    else
    begin
      InitialEdit;
      PanelNew.Enabled := False;
      EditBool := False;
      btnEdit.Enabled := False;
      btnDelete.Enabled := False;
      QueryInfo(False);
      messagebox(handle, '保存成功', '提示', mb_ok + mb_iconinformation);
    end;
  except
    on E: Exception do
    begin
      messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
      exit;
    end;
  end;
end;

function TAccuseFrm.CheckNewEdit(): Boolean;
begin
  Result := True;
  if Length(Trim(ComboBoxType.Text)) = 0 then
  begin
    messagebox(handle, '类型不能为空', '提示', mb_ok + mb_iconinformation);
    ComboBoxType.SetFocus;
    Result := False;
    Exit;
  end;

  if Length(Trim(EditAccuse_Carno.Text)) = 0 then
  begin
    messagebox(handle, '投诉车牌号不能为空', '提示', mb_ok + mb_iconinformation);
    EditAccuse_Carno.SetFocus;
    Result := False;
    Exit;
  end;

  {if Length(Trim(Memocase_HappenAddr.Text)) = 0 then
  begin
    messagebox(handle, '发生地点不能为空', '提示', mb_ok + mb_iconinformation);
    Memocase_HappenAddr.SetFocus;
    Result := False;
    Exit;
  end;   }

  {if Length(Trim(MemoAccuse_Reason.Text)) = 0 then
  begin
    messagebox(handle, '投诉事由不能为空', '提示', mb_ok + mb_iconinformation);
    MemoAccuse_Reason.SetFocus;
    Result := False;
    Exit;
  end;  }

  {if Length(Trim(EditpassengerName.Text)) = 0 then
  begin
    messagebox(handle, '乘客姓名不能为空', '提示', mb_ok + mb_iconinformation);
    EditpassengerName.SetFocus;
    Result := False;
    Exit;
  end;

  if Length(Trim(EditPassengerTelNum.Text)) = 0 then
  begin
    messagebox(handle, '乘客电话不能为空', '提示', mb_ok + mb_iconinformation);
    EditPassengerTelNum.SetFocus;
    Result := False;
    Exit;
  end;   }
end;

procedure TAccuseFrm.SaveCheck;
var
  passengerId: Integer;
begin
  if Length(Trim(MemoCheck_Result.Text)) = 0 then
  begin
    MessageBox(Handle, '处理结果不能为空', '提示', MB_OK + MB_ICONINFORMATION);
    MemoCheck_Result.SetFocus;
    Exit;
  end;

  if Length(Trim(EditCheck_man.Text)) = 0 then
  begin
    MessageBox(Handle, '处理人员不能为空', '提示', MB_OK + MB_ICONINFORMATION);
    EditCheck_man.SetFocus;
    Exit;
  end;
  try
    if Bs.ModifyAAccuseDriver_Check(Accuse_Id, 2, MemoCheck_Result.Text, EditCheck_man.Text, '') = 1 then
    begin
      //扣除积分
      if chkIntegral.Checked and (aqStore.FieldByName('Accuse_Type').AsInteger = 2) then
      begin//乘客投诉扣司机积分，并在积分记录中保存
        Bs.Change_DriverOrPassenger_Integral(0, aqStore.FieldByName('driver_id').AsInteger{aqStore.DataSource.DataSet.FieldValues['driver_id']}, 0, -1, '被乘客投诉，调查属实', Trim(EditDealMan.Text), '');
      end
      else if chkIntegral.Checked and (aqStore.FieldByName('Accuse_Type').AsInteger = 3) then
      begin//司机投诉扣乘客积分，并在积分记录中保存
        passengerId := GetPassengerId(Trim(EditPassengerTelNum.Text));
        Bs.Change_DriverOrPassenger_Integral(1, 0, passengerId, -1, '被驾驶员投诉，调查属实', Trim(EditDealMan.Text), '');
      end;

      InitialEdit;
      PanelCheck.Enabled := False;
      EditBool := False;
      btnEdit.Enabled := False;
      btnDelete.Enabled := False;
      
      QueryInfo(False);
      messagebox(handle, '保存成功', '提示', mb_ok + mb_iconinformation);
    end
    else
    begin
      messagebox(handle, '保存失败', '提示', mb_ok + mb_iconinformation);
    end;
  except
    on E: Exception do
    begin
      messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
      exit;
    end;
  end;
end;

procedure TAccuseFrm.SaveDeal;
var
  DealDateTime: TDateTime;
  DealDateTimeStr: string;
begin
  if Length(Trim(EditDealMan.Text)) = 0 then
  begin
    messagebox(handle, '调查人员不能为空', '提示', mb_ok + mb_iconinformation);
    EditDealMan.SetFocus;
    Exit;
  end;

  if Length(Trim(EditDealManTel.Text)) = 0 then
  begin
    MessageBox(Handle, '调查人员电话不能为空', '提示', MB_OK + MB_ICONINFORMATION);
    EditDealManTel.SetFocus;
    Exit;
  end;

  if Length(Trim(EditDealDepartment.Text)) = 0 then
  begin
    MessageBox(Handle, '调查人员部门不能为空', '提示', MB_OK + MB_ICONINFORMATION);
    EditDealDepartment.SetFocus;
    Exit;
  end;

  if Length(Trim(MemoDealContent.Text)) = 0 then
  begin
    MessageBox(Handle, '调查情况不能为空', '提示', MB_OK + MB_ICONINFORMATION);
    MemoDealContent.SetFocus;
    Exit;
  end;

  DealDateTime := Datecase_HappenDate.DateTime;
  ReplaceTime(DealDateTime, Datecase_HappenTime.Time);
  DealDateTimeStr := FormatDatetime('yyyy-mm-dd hh:nn:ss',DealDateTime);
  try
    if Bs.ModifyAAccuseDriver_Deal(Accuse_Id, 1, MemoDealContent.Text, EditDealDepartment.Text,
                                  EditDealMan.Text, EditDealManTel.Text, DealDateTimeStr) = 1 then
    begin
      InitialEdit;
      PanelDeal.Enabled := False;
      EditBool := False;
      btnEdit.Enabled := False;
      btnDelete.Enabled := False;
      QueryInfo(False);
      messagebox(handle, '保存成功', '提示', mb_ok + mb_iconinformation);
    end
    else
    begin
      messagebox(handle, '保存失败', '提示', mb_ok + mb_iconinformation);
    end;
  except
    on E: Exception do
    begin
      messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
      exit;
    end;
  end;

end;

procedure TAccuseFrm.btnSaveClick(Sender: TObject);
begin
  if EditBool then
  begin
    case State of
    0: EditNew;
    1: SaveDeal;
    2: SaveCheck;
    end;
  end
  else
  begin
    case State of
    0: SaveNew;
    1: SaveDeal;
    2: SaveCheck;
    end;
  end;
end;

procedure TAccuseFrm.btnEditClick(Sender: TObject);
begin
  EditBool := True;
  btnSubmit.Enabled := False;
  case State of
  0:
    begin
      PanelNew.Enabled := True;
      PanelDeal.Enabled := False;
      PanelCheck.Enabled := False;
      EditAccuse_Carno.SetFocus;
    end;
  1:
    begin
      PanelNew.Enabled := False;
      PanelDeal.Enabled := True;
      DateDealDate.DateTime := Now;
      DateDealTime.DateTime := Now;
      PanelCheck.Enabled := False;
      EditDealMan.SetFocus;
    end;
  2:
    begin
      PanelNew.Enabled := False;
      PanelDeal.Enabled := False;
      PanelCheck.Enabled := True;
      MemoCheck_Result.SetFocus;
    end;
  end;
end;

procedure TAccuseFrm.QueryInfo(bMessage: Boolean = False);
var
  FCursor: TCursor;
  FromDateTime: TDateTime;
  FromDateTimeStr: string;
  ToDateTime: TDateTime;
  ToDateTimeStr: string;
  filterStr: string;
  xml: string;
begin
  screen.Cursor := FCursor;
  try
    FCursor := -11;

    FromDateTime := FromDate.DateTime;
    ReplaceTime(FromDateTime, FromTime.Time);
    FromDateTimeStr := FormatDatetime('yyyy-mm-dd hh:nn:ss',FromDateTime);

    ToDateTime := ToDate.DateTime;
    ReplaceTime(ToDateTime, ToTime.Time);
    ToDateTimeStr := FormatDatetime('yyyy-mm-dd hh:nn:ss',ToDateTime);

    if FromDateTimeStr > ToDateTimeStr then
    begin
      messagebox(handle, '开始日期应小于结束日期，请检查！', '提示信息', mb_ok + mb_iconinformation);
      exit;
    end;

    //清数据
    DataSource1.DataSet := nil;
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
      xml := Bs.Query_AccuseDriver(ComboBoxState.ItemIndex-1, FromDateTimeStr, ToDateTimeStr);
    except
      on E: Exception do
      begin
        messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
        exit;
      end;
    end;
    aqStore.XMLData := xml;
    aqStore.Open;

    if DealType = 0 then  // 对于新建的记录，自己只能看到自己的
    begin
      try
        with aqStore do
        begin
          Filtered := false;
            filterStr := 'User_Id=' + IntToStr(current_user.id);
          Filter := filterStr;
          Filtered := True;
        end;
      except
      end;
    end;

    try
      with aqStore do
      begin
        Filtered := false;
        filterStr := ' Accuse_Type = 0 or Accuse_Type = 1 or Accuse_Type = 2 or Accuse_Type = 3 ';
        Filter := filterStr;
        Filtered := True;
      end;
    except
    end;

    aqStore.First;
    if (bMessage = True) and (aqStore.RecordCount  <= 0) then
    begin
      FDlgProgress.Hide;
      MessageBox(Handle,'对不起，没有符合条件的数据！','提示',MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
    DataSource1.DataSet := aqStore;
    DBGrid1.DataSource := DataSource1;
  finally
    FCursor := 0;
    if FDlgProgress.Showing then FDlgProgress.Hide;
  end;
end;

procedure TAccuseFrm.btnQueryClick(Sender: TObject);
begin
  QueryInfo(True);  
end;

procedure TAccuseFrm.FormCreate(Sender: TObject);
begin
  ToDate.date := now;
  FromDate.date := IncWeek(now, -1);  //向前1周
  aqStore := TClientDataSet.Create(nil);
  State := -1;
end;

procedure TAccuseFrm.DBGrid1CellClick(Column: TColumn);
begin
  if aqStore.RecordCount <= 0 then Exit;
  Accuse_Id := aqStore.Fields.FieldByName('Accuse_Id').AsInteger;
  ComboBoxType.ItemIndex := aqStore.Fields.FieldByName('Accuse_Type').AsInteger;

  if DealType > 0 then
  begin
    if aqStore.Fields.FieldByName('Accuse_Type').AsInteger = 2 then
    begin
      lblDriverName.Visible := True;
      edtDriverName.Visible := True;
      edtDriverName.Enabled := False;
      if DealType = 2 then
        chkIntegral.Visible := True;
    end
    else if aqStore.FieldByName('Accuse_Type').AsInteger = 3 then
    begin
      lblDriverName.Visible := False;
      edtDriverName.Visible := False;
      if DealType = 2 then
        chkIntegral.Visible := True;
    end
    else
    begin
      lblDriverName.Visible := False;
      edtDriverName.Visible := False;
      chkIntegral.Visible := False;
    end;
  end;


  EditAccuse_Carno.Text :=  aqStore.Fields.FieldByName('Accuse_Carno').AsString;
  editRunDataID.Text := aqStore.Fields.FieldByName('TAXIRUNID').AsString;
  Datecase_HappenDate.DateTime := aqStore.Fields.FieldByName('Accuse_Time').AsDateTime;
  Datecase_HappenTime.DateTime := aqStore.Fields.FieldByName('Accuse_Time').AsDateTime;
  Memocase_HappenAddr.Text := aqStore.Fields.FieldByName('case_HappenAddr').AsString;
  MemoAccuse_Reason.Text := aqStore.Fields.FieldByName('Accuse_Reason').AsString;
  EditpassengerName.Text := aqStore.Fields.FieldByName('passengerName').AsString;
  EditPassengerTelNum.Text := aqStore.Fields.FieldByName('passengerTelNum').AsString;
  MemoPassengerMemo.Text := aqStore.Fields.FieldByName('passengerMemo').AsString;
  State := aqStore.Fields.FieldByName('DealState').AsInteger;
  ReturnState(State);

  EditDealMan.Text := aqStore.Fields.FieldByName('DealMan').AsString;
  EditDealManTel.Text := aqStore.Fields.FieldByName('DealManTel').AsString;
  EditDealDepartment.Text := aqStore.Fields.FieldByName('DealDepartment').AsString;
  if aqStore.Fields.FieldByName('DealTime').AsString <> '' then
  begin
    DateDealDate.DateTime := aqStore.Fields.FieldByName('DealTime').AsDateTime;
    DateDealTime.DateTime := aqStore.Fields.FieldByName('DealTime').AsDateTime;
  end;
  MemoDealContent.Text := aqStore.Fields.FieldByName('DealContent').AsString;
  MemoDealIdea.Text := aqStore.Fields.FieldByName('Check_Idea').AsString;

  MemoCheck_Result.Text := aqStore.Fields.FieldByName('Check_Result').AsString;
  EditCheck_man.Text := aqStore.Fields.FieldByName('Check_man').AsString;

  btnEdit.Enabled := True;
  btnSubmit.Enabled := True;
  btnDelete.Enabled := True;
end;

procedure TAccuseFrm.FormShow(Sender: TObject);
begin
  lblDriverName.Visible := False;
  edtDriverName.Visible := False;
  edtDriverName.Enabled := False;
  edtDriverName.Color := clBtnFace;
  chkIntegral.Visible := False;
  case DealType of
  0:
    begin
      N8.Enabled := False;
      N8.Visible := False;
    end;
  1:
    begin
      btnNew.Enabled := False;
      btnNew.Visible := False;
      N8.Enabled := False;
      N8.Visible := False;
      N1.Enabled := False;
      N1.Visible := False;
      btnEdit.Left := 11;
      btnCancel.Left := 56;
      btnSave.Left := 101;
      btnRefresh.Left := 146;
      btnClose.Left := 191;
      btnSubmit.Left := 236;
    end;
  2:
    begin
      btnNew.Enabled := False;
      btnNew.Visible := False;
      N1.Enabled := False;
      N1.Visible := False;
      btnEdit.Left := 11;
      btnCancel.Left := 56;
      btnSave.Left := 101;
      btnRefresh.Left := 146;
      btnClose.Left := 191;
      btnSubmit.Left := 236;
    end;
  3:
    begin
      Panel5.Visible := False;
      DBGrid1.PopupMenu := nil;
    end;
  4:
    begin
      N8.Enabled := False;
      N8.Visible := False;

      EditBool := False;

      btnEdit.Enabled := False;
      btnSubmit.Enabled := False;
      btnDelete.Enabled := False;

      PanelNew.Enabled := True;
      PanelDeal.Enabled := False;
      PanelCheck.Enabled := False;

      EditState.Text := '新建';
      EditAccuse_Carno.SetFocus;
      State := 0;
    end;
  end;

  Self.Top:=Screen.Height;//-Self.Height-30;
  if Self.WindowState=wsMinimized then
  begin
    Self.Top:=Screen.Height-Self.Height;
    Self.WindowState:=wsMinimized;
  end;
  //Self.Width:=Screen.Width;
  Self.Left:=Screen.Width - Self.Width;
  TimerShow.Enabled:=true;

  //QueryInfo(False);
end;

procedure TAccuseFrm.ReturnState(Value: Byte);
begin
  case Value of
    0: EditState.Text := '新建';
    1: EditState.Text := '调查中';
    2: EditState.Text := '处理中';
    3: EditState.Text := '结束';
  else
    begin
      EditState.Text := '未知';
    end;
  end;
end;

procedure TAccuseFrm.N6Click(Sender: TObject);
begin
  if State < 0 then
  begin
    messagebox(handle, '请选择投诉信息再提交', '提示', mb_ok + mb_iconinformation);
    Exit;
  end;
  if State = 0 then
  begin
    if not CheckNewEdit() then
      Exit;
  end
  else if State = 1 then
  begin
    if Length(Trim(EditDealMan.Text)) = 0 then
    begin
      messagebox(handle, '调查人员不能为空', '提示', mb_ok + mb_iconinformation);
      EditDealMan.SetFocus;
      Exit;
    end;

    if Length(Trim(EditDealManTel.Text)) = 0 then
    begin
      MessageBox(Handle, '调查人员电话不能为空', '提示', MB_OK + MB_ICONINFORMATION);
      EditDealManTel.SetFocus;
      Exit;
    end;

    if Length(Trim(EditDealDepartment.Text)) = 0 then
    begin
      MessageBox(Handle, '调查人员部门不能为空', '提示', MB_OK + MB_ICONINFORMATION);
      EditDealDepartment.SetFocus;
      Exit;
    end;

    if Length(Trim(MemoDealContent.Text)) = 0 then
    begin
      MessageBox(Handle, '调查情况不能为空', '提示', MB_OK + MB_ICONINFORMATION);
      MemoDealContent.SetFocus;
      Exit;
    end;
  end
  else if State = 2 then
  begin
    if Length(Trim(MemoCheck_Result.Text)) = 0 then
    begin
      MessageBox(Handle, '处理结果不能为空', '提示', MB_OK + MB_ICONINFORMATION);
      MemoCheck_Result.SetFocus;
      Exit;
    end;

    if Length(Trim(EditCheck_man.Text)) = 0 then
    begin
      MessageBox(Handle, '处理人员不能为空', '提示', MB_OK + MB_ICONINFORMATION);
      EditCheck_man.SetFocus;
      Exit;
    end;
  end
  else if State = 3 then
    Exit;
  State := State + 1;
  try
    if Bs.ModifyAAccuseDriver_DealState(Accuse_Id, State) = 1 then
    begin
      if State = 3 then
        FComplainedCount := FComplainedCount + 1;
      QueryInfo(False);
      InitialEdit;
      messagebox(handle, '提交成功', '提示', mb_ok + mb_iconinformation);
    end
    else
    begin
      messagebox(handle, '提交失败', '提示', mb_ok + mb_iconinformation);
    end;
  except
    on E: Exception do
    begin
      messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
      exit;
    end;
  end;

end;

procedure TAccuseFrm.InitialEdit;
begin

  State := -1;

  editRunDataID.Text := '';

  ComboBoxType.ItemIndex := 1;
  EditAccuse_Carno.Text := '';
  Datecase_HappenDate.DateTime := Now;
  Datecase_HappenTime.DateTime := Now;
  Memocase_HappenAddr.Text := '';
  MemoAccuse_Reason.Text := '';
  EditpassengerName.Text := '';
  EditPassengerTelNum.Text := '';
  MemoPassengerMemo.Text := '';
  MemoDealIdea.Text := '';

  EditState.Text := '';  

  EditDealMan.Text := '';
  EditDealManTel.Text := '';
  EditDealDepartment.Text := '';
  DateDealDate.DateTime := Now;
  DateDealTime.DateTime := Now;
  MemoDealContent.Text := '';

  MemoCheck_Result.Text := '';
  EditCheck_man.Text := '';
end;

procedure TAccuseFrm.btnRefreshClick(Sender: TObject);
begin
  State := -1;
  QueryInfo(False);
end;

procedure TAccuseFrm.btnCancelClick(Sender: TObject);
begin
  InitialEdit;
  btnEdit.Enabled := False;
  btnDelete.Enabled := False;
  btnSubmit.Enabled := False;
  PanelNew.Enabled := False;
  PanelDeal.Enabled := False;
  PanelCheck.Enabled := False;
end;

procedure TAccuseFrm.N8Click(Sender: TObject);
var
  dlg: TDealideaFrm;
  DealIdea: string;
begin
  if State = 2 then
  begin
    try
      dlg := TDealideaFrm.Create(Self);
      dlg.ShowModal;
      if dlg.ModalResult = mrok then //处理　读取车辆
      begin
        DealIdea := Trim(dlg.Memo1.Text);
        
        DealIdea :=  '退回意见：' + DealIdea + '； ';

        DealIdea := Trim(MemoDealIdea.Text) + DealIdea;

        State := State - 1;
        try
          if Bs.ModifyAAccuseDriver_Check(Accuse_Id, State, '', '', DealIdea) = 1 then
          begin
            QueryInfo(False);
            InitialEdit;
            messagebox(handle, '退回成功', '提示', mb_ok + mb_iconinformation);
          end
          else
          begin
            messagebox(handle, '退回失败', '提示', mb_ok + mb_iconinformation);
          end;
        except
          on E: Exception do
          begin
            messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
            exit;
          end;
        end;
      end;
    finally
      dlg.Free;
    end;
  end
  else
  begin
    messagebox(handle, '该状态下不能退回', '提示', mb_ok + mb_iconinformation);
  end;
end;

procedure TAccuseFrm.btnSubmitClick(Sender: TObject);
begin
  if State < 0 then
  begin
    messagebox(handle, '请选择投诉信息再提交', '提示', mb_ok + mb_iconinformation);
    Exit;
  end;
  if State = 0 then
  begin
    if not CheckNewEdit() then
      Exit;
  end
  else if State = 1 then
  begin
    if Length(Trim(EditDealMan.Text)) = 0 then
    begin
      messagebox(handle, '调查人员不能为空', '提示', mb_ok + mb_iconinformation);
      EditDealMan.SetFocus;
      Exit;
    end;

    if Length(Trim(EditDealManTel.Text)) = 0 then
    begin
      MessageBox(Handle, '调查人员电话不能为空', '提示', MB_OK + MB_ICONINFORMATION);
      EditDealManTel.SetFocus;
      Exit;
    end;

    if Length(Trim(EditDealDepartment.Text)) = 0 then
    begin
      MessageBox(Handle, '调查人员部门不能为空', '提示', MB_OK + MB_ICONINFORMATION);
      EditDealDepartment.SetFocus;
      Exit;
    end;

    if Length(Trim(MemoDealContent.Text)) = 0 then
    begin
      MessageBox(Handle, '调查情况不能为空', '提示', MB_OK + MB_ICONINFORMATION);
      MemoDealContent.SetFocus;
      Exit;
    end;
  end
  else if State = 2 then
  begin
    if Length(Trim(MemoCheck_Result.Text)) = 0 then
    begin
      MessageBox(Handle, '处理结果不能为空', '提示', MB_OK + MB_ICONINFORMATION);
      MemoCheck_Result.SetFocus;
      Exit;
    end;

    if Length(Trim(EditCheck_man.Text)) = 0 then
    begin
      MessageBox(Handle, '处理人员不能为空', '提示', MB_OK + MB_ICONINFORMATION);
      EditCheck_man.SetFocus;
      Exit;
    end;
  end
  else if State = 3 then
    Exit;
  State := State + 1;
  try
    if Bs.ModifyAAccuseDriver_DealState(Accuse_Id, State) = 1 then
    begin
      if State = 3 then
        FComplainedCount := FComplainedCount + 1;
      QueryInfo(False);
      InitialEdit;
      messagebox(handle, '提交成功', '提示', mb_ok + mb_iconinformation);
    end
    else
    begin
      messagebox(handle, '提交失败', '提示', mb_ok + mb_iconinformation);
    end;
  except
    on E: Exception do
    begin
      messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
      exit;
    end;
  end;
end;

procedure TAccuseFrm.btnDeleteClick(Sender: TObject);
begin
  if State < 0 then
  begin
    messagebox(handle, '请选择投诉信息再删除', '提示', mb_ok + mb_iconinformation);
    Exit;
  end;

  if MessageBox(Handle, '您确实要删除该投诉信息吗？', '提示', MB_OKCANCEL + MB_ICONQUESTION) = 1 then
  begin
    try
      if Bs.DelAAccuseDriver(Accuse_Id) = 1 then
      begin
        btnRefresh.Click;
        btnEdit.Enabled := False;
        btnDelete.Enabled := False;
        btnSubmit.Enabled := False;
        InitialEdit;
        messagebox(handle, '删除成功', '提示', mb_ok + mb_iconinformation);
      end
      else
        messagebox(handle, '删除失败', '提示', mb_ok + mb_iconinformation);
    except
      on E: Exception do
      begin
        messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
        exit;
      end;
    end;
  end;
end;

procedure TAccuseFrm.editRunDataIDKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#8, '0'..'9', #22]) then Key := #0;
end;

procedure TAccuseFrm.EditPassengerTelNumKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in [#8, '0'..'9', '-', #22]) then Key := #0;
end;

procedure TAccuseFrm.btnCloseClick(Sender: TObject);
begin
  Close;
end;

function TAccuseFrm.GetPassengerId(const passengerPhone: string): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to PassengerManage.Count - 1 do
  begin
    if PassengerManage.Item[i].Phone = passengerPhone then
    begin
      Result := PassengerManage.Item[i].PassengerId;
      Break;
    end;  
  end;  
end;

procedure TAccuseFrm.TimerCloseTimer(Sender: TObject);
begin
  try
   if  (Self.Top <= Screen.Height)and(Self.Top >=(Screen.Height-Self.Height-40))then
   begin
      Self.Top:=Self.top+15;
      exit;
   end;
   Timerclose.Enabled:=false;
   Self.Hide;
  except
  end;
end;

procedure TAccuseFrm.TimerShowTimer(Sender: TObject);
begin
  if Self.WindowState=wsMinimized then
  begin
   FlashWindow(Self.Handle,true);
   TimerShow.Interval:=2000;
   exit;
  end;
  if  Self.Top <= Screen.Height-Self.Height-25 then
  begin
    TimerShow.Enabled:=false;
    //Panel2.Enabled:=true;
    exit;
  end;
  TimerShow.Interval:=1;
  Self.Top:=Self.top-10;
end;

procedure TAccuseFrm.FormActivate(Sender: TObject);
begin
  if Self.WindowState=wsMinimized then TimerShow.Enabled:=false
end;

procedure TAccuseFrm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := False;
  TimerClose.Enabled:=true;
end;

procedure TAccuseFrm.FormDeactivate(Sender: TObject);
begin
  TimerShow.Enabled:=true;
end;

procedure TAccuseFrm.EditAccuse_CarnoChange(Sender: TObject);
var
  i: integer;
  carNo, setNo: string;
begin
  if FSearch then
  begin
    setNo := EditAccuse_Carno.Text;
    if setNO = '' then
    begin
      EditAccuse_Carno.DroppedDown := false;
      exit;
    end;

    EditAccuse_Carno.Items.BeginUpdate;
    EditAccuse_Carno.Items.Clear;
    for i := 0 to ADeviceManage.Count - 1 do
    begin
      carNo := ADeviceManage.Items[i].Car.No;
      if pos(setNo, carNo) > 0 then
      begin
        if EditAccuse_Carno.Items.Count <= 50 then
          EditAccuse_Carno.Items.Add(carNo)
        else
          break;
      end;
    end;
    EditAccuse_Carno.Items.EndUpdate;
    EditAccuse_Carno.SelStart := Length(EditAccuse_Carno.Text);
    EditAccuse_Carno.DroppedDown := false;
  end;
end;

procedure TAccuseFrm.EditAccuse_CarnoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
  begin
    exit;
  end;
  FSearch := true;
end;

procedure TAccuseFrm.EditAccuse_CarnoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if FSearch and (Key <> 8) then
  begin
    if EditAccuse_Carno.Items.Count > 0 then
      EditAccuse_Carno.DroppedDown := true;
    FSearch := false;
  end;
end;

procedure TAccuseFrm.EditAccuse_CarnoSelect(Sender: TObject);
begin
  FSearch := false;
end;

end.
