unit DevModifyFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, ComCtrls, ToolWin, StdCtrls, CarUnit, uGloabVar,
  DB, DBClient, ConstDefineUnit, Buttons, cxControls, cxSplitter, DateUtils;

type
  TDevModifyFrm = class(TForm)
    Splitter1: TSplitter;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    aqStore: TClientDataSet;
    DataSource1: TDataSource;
    Panel4: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Memo1: TMemo;
    Edit1: TEdit;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    ToolBar1: TToolBar;
    btnNew: TToolButton;
    btnEdit: TToolButton;
    btnDelete: TToolButton;
    btnCancel: TToolButton;
    btnSave: TToolButton;
    btnQuery: TToolButton;
    btnClose: TToolButton;
    Memo2: TMemo;
    ComboBox1: TComboBox;
    editID: TEdit;
    editNO: TEdit;
    cbxType: TComboBox;
    Edit2: TEdit;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    editQueryCarNo: TEdit;
    datQueryBeginDate: TDateTimePicker;
    datQueryBeginTime: TDateTimePicker;
    datQueryEndDate: TDateTimePicker;
    datQueryEndTime: TDateTimePicker;
    btnOK: TBitBtn;
    SplitterRight: TcxSplitter;
    procedure btnSaveClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Select(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btnCancelClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FSearch: Boolean;
    procedure InitComponent;
    procedure EnableComponent(b: Boolean);
  end;

var
  DevModifyFrm: TDevModifyFrm;
  EditBool: Boolean;

implementation

{$R *.dfm}

procedure TDevModifyFrm.btnSaveClick(Sender: TObject);
var
  SqlStr: string;
  DateTime: TDateTime;
  MaintainDateTime: string;
  DealDateTime: string;
  DevIdStr: string;
  NO: string;
  dev: TDevice;
begin

  if ComboBox1.Text = '' then
  begin
    MessageBox(handle, '报警车辆不能为空！', '提示', MB_OK + MB_ICONINFORMATION);
    ComboBox1.SetFocus;
    Exit;
  end;

  DateTime := DateTimePicker1.DateTime;
  ReplaceTime(DateTime, DateTimePicker2.Time);
  MaintainDateTime := FormatDatetime('yyyy-mm-dd hh:nn:ss',DateTime);

  DateTime := DateTimePicker3.DateTime;
  ReplaceTime(DateTime, DateTimePicker4.Time);
  DealDateTime := FormatDatetime('yyyy-mm-dd hh:nn:ss',DateTime);


  NO := FormatDatetime('yyyymmddhhnnss',DateTime);

  dev := ADeviceManage.FindDevFromCarNo(Trim(ComboBox1.Text));


  if EditBool then
  begin

  end
  else
  begin
    SqlStr := 'insert into TAB_DEVMAINTAININFO(DEVIDSTR, MAINTAINTIME, REASON, RESULT, USERID, '
            + '                             USERNAME, DEALTIME, CARNO, NO) '
            + '                       values('+ SafeSql(dev.idStr) + ', to_date(' + SafeSql(MaintainDateTime) + ',' + SafeSql('YYYY-MM-DD HH24:MI:SS')+'),'
            +                                SafeSql(trim(memo2.text)) + ',' + SafeSql(trim(memo1.text)) +','
            +                                IntToStr(current_user.id) + ',' + SafeSql(current_user.UserName) + ','
            +                                ' to_date(' + SafeSql(DealDateTime) + ',' + SafeSql('YYYY-MM-DD HH24:MI:SS')+'),' + SafeSql(dev.Car.No) + ',' + SafeSql(NO)+')';
    if Bs.AddSql(SqlStr, 'TAB_DEVMAINTAININFO', '保存一条车辆维修台帐信息：') > 0 then
    begin
      MessageBox(handle, '保存成功！', '提示', MB_OK + MB_ICONINFORMATION);
      InitComponent;
      EnableComponent(False);
      btnSave.Enabled := False;
      btnNew.Enabled := True;
    end
    else
    begin
      MessageBox(handle, '保存失败！', '提示', MB_OK + MB_ICONINFORMATION);
    end;
  end;
end;

procedure TDevModifyFrm.btnNewClick(Sender: TObject);
begin
  EditBool := False;
  EnableComponent(True);
  InitComponent;

  DateTimePicker1.DateTime := Now;
  DateTimePicker2.Time := Now;
  DateTimePicker3.DateTime := Now;
  DateTimePicker4.DateTime := Now;
  Edit1.Text := current_user.UserName;

  btnNew.Enabled := False;
  btnSave.Enabled := True;
end;

procedure TDevModifyFrm.ComboBox1Change(Sender: TObject);
var
  i: integer;
  carNo, setNo: string;
begin
  if FSearch then
  begin
    setNo := ComboBox1.Text;
    if setNO = '' then
    begin
      ComboBox1.DroppedDown := false;
      exit;
    end;

    ComboBox1.Items.BeginUpdate;
    ComboBox1.Items.Clear;
    for i := 0 to ADeviceManage.Count - 1 do
    begin
      carNo := ADeviceManage.Items[i].Car.No;
      if pos(setNo, carNo) > 0 then
      begin
        if ComboBox1.Items.Count <= 50 then
          ComboBox1.Items.Add(carNo)
        else
          break;
      end;
    end;
    ComboBox1.Items.EndUpdate;
    ComboBox1.SelStart := Length(ComboBox1.Text);
    ComboBox1.DroppedDown := false;
  end;
end;

procedure TDevModifyFrm.ComboBox1KeyPress(Sender: TObject; var Key: Char);
var
  dev: TDevice;
  i: Integer;
begin
  if (Key = #13) then
  begin
    for i := 0 to ADeviceManage.Count - 1 do
    begin
      dev := ADeviceManage.Items[i];
      if dev.Car.No = ComboBox1.Text then
      begin
        Edit2.Text := dev.DriverNameTeL;
      end;
    end;
    exit;
  end;
  FSearch := true;
end;

procedure TDevModifyFrm.ComboBox1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if FSearch and (Key <> 8) then
  begin
    if ComboBox1.Items.Count > 0 then
      ComboBox1.DroppedDown := true;
    FSearch := false;
  end;
end;

procedure TDevModifyFrm.ComboBox1Select(Sender: TObject);
begin
  FSearch := false;
end;

procedure TDevModifyFrm.btnQueryClick(Sender: TObject);
var
  xml: string;
begin
  try
    xml := Bs.QuerySql('select * from TAB_DEVMAINTAININFO where 1=1 order by DEALTIME', 'TAB_DEVMAINTAININFO', '查询车辆维修台帐');
  except
    on E: Exception do
    begin
      messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
      exit;
    end;
  end;
  aqStore.XMLData := xml;
  aqStore.Open;

  aqStore.First;
  DataSource1.DataSet := aqStore;
  DBGrid1.DataSource := DataSource1;
end;

procedure TDevModifyFrm.DBGrid1CellClick(Column: TColumn);
begin
  editID.Text := aqStore.Fields.FieldByName('ID').AsString;
  editNO.Text := aqStore.Fields.FieldByName('NO').AsString;
  ComboBox1.Text := aqStore.Fields.FieldByName('CARNO').AsString;
  DateTimePicker1.DateTime := aqStore.Fields.FieldByName('MAINTAINTIME').AsDateTime;
  DateTimePicker2.DateTime := aqStore.Fields.FieldByName('MAINTAINTIME').AsDateTime;


  Memo2.Text := aqStore.Fields.FieldByName('REASON').AsString;
  Memo1.Text := aqStore.Fields.FieldByName('RESULT').AsString;
  Edit1.Text := aqStore.Fields.FieldByName('USERNAME').AsString;
  DateTimePicker3.DateTime := aqStore.Fields.FieldByName('DEALTIME').AsDateTime;
  DateTimePicker4.DateTime := aqStore.Fields.FieldByName('DEALTIME').AsDateTime;

  btnDelete.Enabled := True;
end;

procedure TDevModifyFrm.btnCancelClick(Sender: TObject);
begin
  btnNew.Enabled := True;
  btnSave.Enabled := False;
  InitComponent;
  EnableComponent(False);
end;

procedure TDevModifyFrm.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TDevModifyFrm.btnDeleteClick(Sender: TObject);
var
  SqlStr: string;
begin
  if Trim(editNO.Text) = '' then
  begin
    MessageBox(handle, '请选择一条记录！', '提示', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  SqlStr := 'delete from TAB_DEVMAINTAININFO where NO=' + SafeSql(editNO.Text);
  if Bs.ModifySql(SqlStr, 'TAB_DEVMAINTAININFO', '删除一条车辆维修台帐信息：') = 'OK' then
  begin
    MessageBox(handle, '删除成功！', '提示', MB_OK + MB_ICONINFORMATION);
    editNO.Text := '';
    //btnDelete.Enabled := False;
  end
  else
  begin
    MessageBox(handle, '删除失败！', '提示', MB_OK + MB_ICONINFORMATION);
  end;

  btnQuery.Click;
end;

procedure TDevModifyFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ManualDock(nil);
end;

procedure TDevModifyFrm.InitComponent;
begin
  ComboBox1.Text := '';
  Memo1.Text := '';
  Memo2.Text := '';
  Edit1.Text := '';
  editID.Text := '';
  editNO.Text := '';

  DateTimePicker1.DateTime := Now;
  DateTimePicker2.Time := Now;
  DateTimePicker3.DateTime := Now;
  DateTimePicker4.DateTime := Now;

  datQueryBeginDate.DateTime := Now;
  datQueryBeginTime.Time := IncHour(Now, -2);
  datQueryEndDate.DateTime := Now;
  datQueryEndTime.Time := Now;
end;

procedure TDevModifyFrm.EnableComponent(b: Boolean);
begin
  ComboBox1.Enabled := b;
  Memo1.Enabled := b;
  Memo2.Enabled := b;

  DateTimePicker1.Enabled := b;
  DateTimePicker2.Enabled := b;

end;

procedure TDevModifyFrm.FormShow(Sender: TObject);
begin
  InitComponent;
  EnableComponent(False);
end;

procedure TDevModifyFrm.SpeedButton1Click(Sender: TObject);
begin
  if Panel3.Width = 255 then
  begin
    Panel3.Width := 18;
    SpeedButton1.Caption := '《';
    SpeedButton1.Left := 1;
  end
  else
  begin
    Panel3.Width := 18;
    SpeedButton1.Caption := '》';
    SpeedButton1.Left := 1;
  end;
end;

procedure TDevModifyFrm.btnOKClick(Sender: TObject);
var
  xml: string;
  BeginDateTime, EndDateTime: string;
  DateTime: TDateTime;
  sqlstr: string;
begin
  try
    DateTime := datQueryBeginDate.DateTime;
    ReplaceTime(DateTime, datQueryBeginTime.Time);
    BeginDateTime := FormatDatetime('yyyy-mm-dd hh:nn:ss',DateTime);

    DateTime := datQueryEndDate.DateTime;
    ReplaceTime(DateTime, datQueryEndTime.Time);
    EndDateTime := FormatDatetime('yyyy-mm-dd hh:nn:ss',DateTime);

    SqlStr := 'select * '
            + 'from TAB_DEVMAINTAININFO '
            + 'where CARNO like '+ SafeSql('%'+editQueryCarNo.Text+'%')
            + ' and  MAINTAINTIME>=to_date(' + SafeSql(BeginDateTime) + ',' + SafeSql('YYYY-MM-DD HH24:MI:SS')+')'
            + ' and MAINTAINTIME<=to_date(' + SafeSql(EndDateTime) + ',' + SafeSql('YYYY-MM-DD HH24:MI:SS')+')';


    xml := Bs.QuerySql(SqlStr, 'TAB_DEVMAINTAININFO', '查询车辆维修台帐');
  except
    on E: Exception do
    begin
      messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
      exit;
    end;
  end;
  aqStore.XMLData := xml;
  aqStore.Open;

  aqStore.First;
  DataSource1.DataSet := aqStore;
  DBGrid1.DataSource := DataSource1;
end;

end.
