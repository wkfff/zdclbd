unit DevAlarmInfoFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Grids, DBGrids, ToolWin, CarUnit, uGloabVar,
  DB, DBClient, ConstDefineUnit, DateUtils, Buttons, cxControls, cxSplitter,
  Menus, Service, jpeg;

type
  TDevAlarmInfoFrm = class(TForm)
    Splitter1: TSplitter;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    aqStore: TClientDataSet;
    DataSource1: TDataSource;
    Panel3: TPanel;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    btnNew: TToolButton;
    btnEdit: TToolButton;
    btnDelete: TToolButton;
    btnCancel: TToolButton;
    btnSave: TToolButton;
    btnQuery: TToolButton;
    btnClose: TToolButton;
    SplitterRight: TcxSplitter;
    Panel4: TPanel;
    SpeedButton1: TSpeedButton;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    editQueryCarNo: TEdit;
    datQueryBeginDate: TDateTimePicker;
    datQueryBeginTime: TDateTimePicker;
    datQueryEndDate: TDateTimePicker;
    datQueryEndTime: TDateTimePicker;
    btnOK: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Panel5: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label13: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Memo1: TMemo;
    Edit1: TEdit;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    ComboBox1: TComboBox;
    DateTimePicker5: TDateTimePicker;
    DateTimePicker6: TDateTimePicker;
    Edit2: TEdit;
    Edit3: TEdit;
    Memo2: TMemo;
    editID: TEdit;
    editNO: TEdit;
    Memo3: TMemo;
    Panel6: TPanel;
    GroupBox1: TGroupBox;
    Panel7: TPanel;
    Splitter2: TSplitter;
    Panel8: TPanel;
    Panel9: TPanel;
    Splitter3: TSplitter;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Select(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btnCancelClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FSearch: Boolean;
    procedure InitComponent;
    procedure EnableComponent(b: Boolean);
  end;

var
  DevAlarmInfoFrm: TDevAlarmInfoFrm;
  EditBool: Boolean;

implementation

{$R *.dfm}

procedure TDevAlarmInfoFrm.ComboBox1Change(Sender: TObject);
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

procedure TDevAlarmInfoFrm.ComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
  begin
    exit;
  end;
  FSearch := true;
end;

procedure TDevAlarmInfoFrm.ComboBox1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if FSearch and (Key <> 8) then
  begin
    if ComboBox1.Items.Count > 0 then
      ComboBox1.DroppedDown := true;
    FSearch := false;
  end;
end;

procedure TDevAlarmInfoFrm.ComboBox1Select(Sender: TObject);
begin
  FSearch := false;
end;

procedure TDevAlarmInfoFrm.btnSaveClick(Sender: TObject);
var
  SqlStr: string;
  DateTime: TDateTime;
  BeginDateTime, EndDateTime: string;
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
  BeginDateTime := FormatDatetime('yyyy-mm-dd hh:nn:ss',DateTime);

  DateTime := DateTimePicker5.DateTime;
  ReplaceTime(DateTime, DateTimePicker6.Time);
  EndDateTime := FormatDatetime('yyyy-mm-dd hh:nn:ss',DateTime);

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
    SqlStr := 'insert into TAB_DEVALARMINFO(DEVIDSTR, BEGINDATETIME, ENDDATETIME, PERSON, TEL, '
            + '                             ADDRESS, RESULT, USERID, USERNAME, DEALTIME, CARNO, NO) '
            + '                       values('+ SafeSql(dev.idStr) + ', to_date(' + SafeSql(BeginDateTime) + ',' + SafeSql('YYYY-MM-DD HH24:MI:SS')+'),'
            +                                ' to_date(' + SafeSql(EndDateTime) + ',' + SafeSql('YYYY-MM-DD HH24:MI:SS')+'),'
            +                                SafeSql(trim(edit2.text)) + ',' + SafeSql(trim(edit3.text)) +','
            +                                SafeSql(Trim(memo2.text)) + ',' + SafeSql(Trim(memo1.text)) + ','
            +                                IntToStr(current_user.id) + ',' + SafeSql(current_user.UserName) + ','
            +                                ' to_date(' + SafeSql(DealDateTime) + ',' + SafeSql('YYYY-MM-DD HH24:MI:SS')+'),' + SafeSql(dev.Car.No) + ',' + SafeSql(NO)+')';
    if Bs.AddSql(SqlStr, 'TAB_DEVALARMINFO', '保存一条报警台帐信息：') > 0 then
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

procedure TDevAlarmInfoFrm.btnNewClick(Sender: TObject);
begin
  EditBool := False;
  EnableComponent(True);
  InitComponent;
  DateTimePicker1.DateTime := Now;
  DateTimePicker2.Time := inchour(Now, -1);
  DateTimePicker3.DateTime := Now;
  DateTimePicker4.DateTime := Now;
  DateTimePicker5.DateTime := Now;
  DateTimePicker6.DateTime := Now;
  Edit1.Text := current_user.UserName;

  btnNew.Enabled := False;
  btnSave.Enabled := True;
end;

procedure TDevAlarmInfoFrm.btnQueryClick(Sender: TObject);
var
  xml: string;
begin
  try
      xml := Bs.QuerySql('select * from tab_devalarminfo where 1=1 order by DEALTIME', 'TAB_DEVALARMINFO', '查询报警台帐');
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

procedure TDevAlarmInfoFrm.DBGrid1CellClick(Column: TColumn);
begin
  editID.Text := aqStore.Fields.FieldByName('ID').AsString;
  editNO.Text := aqStore.Fields.FieldByName('NO').AsString;
  ComboBox1.Text := aqStore.Fields.FieldByName('CARNO').AsString;
  DateTimePicker1.DateTime := aqStore.Fields.FieldByName('BEGINDATETIME').AsDateTime;
  DateTimePicker2.DateTime := aqStore.Fields.FieldByName('BEGINDATETIME').AsDateTime;
  DateTimePicker5.DateTime := aqStore.Fields.FieldByName('ENDDATETIME').AsDateTime;
  DateTimePicker6.DateTime := aqStore.Fields.FieldByName('ENDDATETIME').AsDateTime;
  Edit2.Text := aqStore.Fields.FieldByName('PERSON').AsString;
  Edit3.Text := aqStore.Fields.FieldByName('TEL').AsString;
  Memo2.Text := aqStore.Fields.FieldByName('ADDRESS').AsString;
  Memo1.Text := aqStore.Fields.FieldByName('RESULT').AsString;
  Edit1.Text := aqStore.Fields.FieldByName('USERNAME').AsString;
  DateTimePicker3.DateTime := aqStore.Fields.FieldByName('DEALTIME').AsDateTime;
  DateTimePicker4.DateTime := aqStore.Fields.FieldByName('DEALTIME').AsDateTime;
  Memo3.Text := aqStore.Fields.FieldByName('HISTROY').AsString;

  btnDelete.Enabled := True;
end;

procedure TDevAlarmInfoFrm.btnCancelClick(Sender: TObject);
begin
  btnNew.Enabled := True;
  btnSave.Enabled := False;
  InitComponent;
  EnableComponent(False);
end;

procedure TDevAlarmInfoFrm.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TDevAlarmInfoFrm.btnDeleteClick(Sender: TObject);
var
  SqlStr: string;
begin
  if Trim(editNO.Text) = '' then
  begin
    MessageBox(handle, '请选择一条记录！', '提示', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  SqlStr := 'delete from tab_devalarminfo where NO=' + SafeSql(editNO.Text);
  if Bs.ModifySql(SqlStr, 'tab_devalarminfo', '删除一条报警台帐信息：') = 'OK' then
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

procedure TDevAlarmInfoFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ManualDock(nil);
end;

procedure TDevAlarmInfoFrm.InitComponent;
begin
  ComboBox1.Text := '';
  Edit2.Text := '';
  Edit3.Text := '';
  Memo1.Text := '';
  Memo2.Text := '';
  Edit1.Text := '';
  editID.Text := '';
  editNO.Text := '';
  Memo3.Text := '';

  DateTimePicker1.DateTime := Now;
  DateTimePicker2.Time := inchour(Now, -1);
  DateTimePicker3.DateTime := Now;
  DateTimePicker4.DateTime := Now;
  DateTimePicker5.DateTime := Now;
  DateTimePicker6.DateTime := Now;

  datQueryBeginDate.DateTime := Now;
  datQueryBeginTime.Time := IncHour(Now, -2);
  datQueryEndDate.DateTime := Now;
  datQueryEndTime.Time := Now;
end;

procedure TDevAlarmInfoFrm.EnableComponent(b: Boolean);
begin
  ComboBox1.Enabled := b;
  Edit2.Enabled := b;
  Edit3.Enabled := b;
  Memo1.Enabled := b;
  Memo2.Enabled := b;

  DateTimePicker1.Enabled := b;
  DateTimePicker2.Enabled := b;

  DateTimePicker5.Enabled := b;
  DateTimePicker6.Enabled := b;
end;

procedure TDevAlarmInfoFrm.FormShow(Sender: TObject);
begin
  InitComponent;
  EnableComponent(False);
end;

procedure TDevAlarmInfoFrm.btnOKClick(Sender: TObject);
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
            + 'from tab_devalarminfo '
            + 'where CARNO like '+ SafeSql('%'+editQueryCarNo.Text+'%')
            + ' and  BEGINDATETIME>=to_date(' + SafeSql(BeginDateTime) + ',' + SafeSql('YYYY-MM-DD HH24:MI:SS')+')'
            + ' and ENDDATETIME<=to_date(' + SafeSql(EndDateTime) + ',' + SafeSql('YYYY-MM-DD HH24:MI:SS')+')';


    xml := Bs.QuerySql(SqlStr, 'tab_devalarminfo', '查询车辆维修台帐');
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

procedure TDevAlarmInfoFrm.N1Click(Sender: TObject);
  procedure LoadPic(image: TImage; pic: PicInfo; panel: TPanel);
  var
    ms : TMemoryStream;
    jpegfile : TJPEGImage;
  begin
    try
      try
        ms := TMemoryStream.Create;
        jpegfile := TJPEGImage.Create;
        image.Picture.Graphic := nil;
        ms.Write(pic.Photo[0],length(pic.Photo));
        ms.Position := 0;
        jpegfile.LoadFromStream(ms);
        image.Picture.Graphic := jpegfile;
      except
        panel.Caption := '照片异常';
      end;
    finally
      ms.free;
      jpegfile.Free;
    end;
  end;
var
  PhotoIDs: string;
  picInfoBuf: ArrayOfPicInfo;
  info: PicInfo;
  i: Integer;
begin
  Panel7.Caption:='无照片';
  Panel8.Caption:='无照片';
  Panel9.Caption:='无照片';
  Image1.Picture.Graphic := nil;
  Image2.Picture.Graphic := nil;
  Image3.Picture.Graphic := nil;
  
  PhotoIDs := aqStore.Fields.FieldByName('PhotoIDs').AsString;
  try
    picInfoBuf := bs.QueryPicsByPhotoIDs(PhotoIDs);
  except
    on E: Exception do
    begin
      messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
      exit;
    end;
  end;
  if picInfoBuf = nil then
  begin
    MessageBox(self.Handle, '该记录无照片信息!', '提示', mb_iconinformation + mb_ok);
    Exit;
  end;

  for i:=0 to Length(picInfoBuf)-1 do
  begin
    try
      info :=  picInfoBuf[i];
      case i of
        0: LoadPic(Image1, info, Panel7);
        1: LoadPic(Image2, info, Panel8);
        2: LoadPic(Image3, info, Panel9);
      end;
    except
    end;
  end;
end;

end.
