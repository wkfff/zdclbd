unit QueryDriverIntegralFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QueryBaseFrmUnit, PrnDbgeh, DB, cxControls, cxSplitter, Grids,
  DBGridEh, ComCtrls, StdCtrls, Buttons, ExtCtrls, uGloabVar;

type
  TQueryDriverIntegralFrm = class(TQueryBaseFrm)
    rb2: TRadioButton;
    rb1: TRadioButton;
    Label1: TLabel;
    cbbDriver: TComboBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure rb2Click(Sender: TObject);
    procedure rb1Click(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
    function split(str, split: string): TStringList;
  public
    { Public declarations }
  end;

var
  QueryDriverIntegralFrm: TQueryDriverIntegralFrm;

implementation
uses uFrmRefreshProgress, ConstDefineUnit, ShowMessageInfo;
{$R *.dfm}

procedure TQueryDriverIntegralFrm.BitBtn2Click(Sender: TObject);
begin
  inherited;
  //close;
end;

procedure TQueryDriverIntegralFrm.rb2Click(Sender: TObject);
begin
  if rb2.Checked then
  begin
    cbbDriver.Enabled := False;
    DateTimePicker1.Enabled := False;
    fromTime.Enabled := False;
    DateTimePicker2.Enabled := False;
    toTime.Enabled := False;
  end
  else
  begin
    cbbDriver.Enabled := True;
    DateTimePicker1.Enabled := True;
    fromTime.Enabled := True;
    DateTimePicker2.Enabled := True;
    toTime.Enabled := True;
  end;
end;

procedure TQueryDriverIntegralFrm.rb1Click(Sender: TObject);
begin
  if rb1.Checked then
  begin
    cbbDriver.Enabled := True;
    DateTimePicker1.Enabled := True;
    fromTime.Enabled := True;
    DateTimePicker2.Enabled := True;
    toTime.Enabled := True;
  end
  else
  begin
    cbbDriver.Enabled := False;
    DateTimePicker1.Enabled := False;
    fromTime.Enabled := False;
    DateTimePicker2.Enabled := False;
    toTime.Enabled := False;
  end;
end;

procedure TQueryDriverIntegralFrm.TreeView1Click(Sender: TObject);
var
  i, j: Integer;
  grpIdList: TStringList;
begin
  inherited;
  cbbDriver.Clear;
  if (group_id >= 0) then //and (not IsClickDev) and (grpId <> clickParent) then
  begin
    for i := 0 to ADriverManage.Count - 1 do
    begin
      if ADriverManage.Drivers[i].GroupID = group_id then
        cbbDriver.AddItem(ADriverManage.Drivers[i].Name, TObject(ADriverManage.Drivers[i].id));
    end;
  end
  else if group_paranet <> '' then
  begin
    grpIdList := split(group_paranet, ',');
    for j := 0 to grpIdList.Count - 1 do
    begin
      for i := 0 to ADriverManage.Count - 1 do
      begin
        if ADriverManage.Drivers[i].GroupID = StrToInt(grpIdList.Strings[j]) then
          cbbDriver.AddItem(ADriverManage.Drivers[i].Name, TObject(ADriverManage.Drivers[i].id));
      end;
    end;  
  end;  
end;

function TQueryDriverIntegralFrm.split(str, split: string): TStringList;
var
  len,index: Integer;
begin
  Result := TStringList.Create;
  index := Pos(split, str);
  while index > 0 do
  begin
    Result.Add(Copy(str, 1, index - 1));
    len := Length(str) - (index - 1) - Length(split);
    CopyMemory(@str[1], @str[index + Length(split)], len);
    SetLength(str, len);
    index := Pos(split, str);
  end;
  Result.Add(Copy(str, 1, Length(str)));      
end;

procedure TQueryDriverIntegralFrm.BitBtn5Click(Sender: TObject);
var
  xml: string;
  FCursor: TCursor;
  driverId: Integer;
begin
  inherited;
  if QueryContion = False then Exit;
  screen.Cursor := FCursor;
  try
    FCursor := -11;
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
      if rb1.Checked then
      begin
        DBGridEh1.Columns[0].Visible := True;
        DBGridEh1.Columns[2].Visible := True;
        DBGridEh1.Columns[3].Visible := True;
        DBGridEh1.Columns[4].Visible := False;
        if cbbDriver.Text = '' then
          driverId := -1
        else
          driverId := Integer(cbbDriver.Items.Objects[cbbDriver.ItemIndex]);
        xml := Bs.Query_DriverIntegralChg(FromDate, ToDate, driverid, group_id, group_paranet);
      end
      else
      begin
        DBGridEh1.Columns[0].Visible := False;
        DBGridEh1.Columns[2].Visible := False;
        DBGridEh1.Columns[3].Visible := False;
        DBGridEh1.Columns[4].Visible := True;
        xml := BS.Query_Driver_IntegralSort(group_id, group_paranet);
      end;
    except
      on E: Exception do
      begin
        if FDlgProgress.Showing then FDlgProgress.Hide;
        messageErrorBox('查询司机积分信息结果处理不正确！', e.Message);
        exit;
      end;
    end;




    FDlgProgress.GaugeProcessInc(10);
    aqStore.XMLData := xml;
    aqStore.Open;
    if aqStore.RecordCount  <= 0 then
    begin
      FDlgProgress.Hide;
      MessageBox(Handle,'对不起，没有符合条件的数据！','提示',MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

    DataSource1.DataSet := aqStore;
    DBGridEh1.DataSource := DataSource1;

    //EditDbGrid;
  finally
    FCursor := 0;
    if FDlgProgress.Showing then FDlgProgress.Hide;
  end
end;

end.
