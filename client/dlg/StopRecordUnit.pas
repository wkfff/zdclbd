unit StopRecordUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, cxGraphics, cxCustomData,
  cxStyles, cxTL, cxTextEdit, cxInplaceContainer, cxControls, Grids,
  DBGridEh, DB, DBClient, PrnDbgeh;

type
  TStopRecordForm = class(TForm)
    Panel5: TPanel;
    Panel6: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ComboboxCarNO: TComboBox;
    fromDate: TDateTimePicker;
    fromTime: TDateTimePicker;
    toDate: TDateTimePicker;
    toTime: TDateTimePicker;
    BitBtnQuery: TBitBtn;
    Panel4: TPanel;
    Panel2: TPanel;
    BitBtnPrint: TBitBtn;
    BitBtn3: TBitBtn;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ClientDataSet2: TClientDataSet;
    PrintDBGridEh2: TPrintDBGridEh;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnQueryClick(Sender: TObject);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure ClientDataSet1AfterScroll(DataSet: TDataSet);
    procedure BitBtnPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StopRecordForm: TStopRecordForm;

implementation
      uses uGloabVar,CarUnit;
{$R *.dfm}

procedure TStopRecordForm.FormCreate(Sender: TObject);
var
  i:integer;
begin
  ComboboxCarNO.Clear;
  for i:=0 to ADeviceManage.Count-1 do
  begin
      ComboboxCarNO.Items.AddObject(ADeviceManage.Items[i].Car.No,ADeviceManage.Items[i]);
  end;
  FromDate.Date:=Date;
  FromTime.Time:=StrToTime('00:00:00');
  ToDate.Date:=Date;
  ToTime.Time:=StrToTime('23:59:59');                                                  
end;

procedure TStopRecordForm.BitBtnQueryClick(Sender: TObject);
var
  fromDatetime:string;
  toDatetime:string;
  dataset:TClientDataSet;
  ind:integer;
  IDStr:string;
  dev:TDevice;
begin
//
  fromDatetime:=FormatDatetime('yyyy-mm-dd ',fromDate.Date)+FormatDatetime('hh:nn:ss',fromTime.Time);
toDatetime:=FormatDatetime('yyyy-mm-dd ',toDate.Date)+FormatDatetime('hh:nn:ss',toTime.Time);
if ComboboxCarNO.Text<>'' then
begin
    ind:=ComboboxCarNO.Items.IndexOf(ComboboxCarNO.Text);
    dev:=TDevice(ComboboxCarNO.Items.Objects[ind]);
    if dev<>nil then
       IDstr:=Dev.IdStr;
end;
if IDstr<>'' then
dataset:=bs.QueryStopTime(IDStr,fromDatetime,
                      toDatetime
                      )
else
  dataset:=bs.QueryStopTime('',fromDatetime
                      ,toDatetime
                      );
if  dataset<>nil then
begin
   ClientDataSet1.Data:=dataset.Data;
end;

end;

procedure TStopRecordForm.DBGridEh1CellClick(Column: TColumnEh);
var
  dataset:TClientDataSet;
begin
{   if(DBGridEh1.SelectedIndex>=0)and(DBGridEh1.SelectedIndex<ClientDataSet1.RecordCount)  then
   begin
      dataset:=bs.QueryStopInfo(ClientDataSet1.FieldByName('ID').AsInteger);
      if dataset<>nil then
        ClientDataSet2.Data:=dataset.Data;
   end;    }
end;

procedure TStopRecordForm.ClientDataSet1AfterScroll(DataSet: TDataSet);
var
  ds:TClientDataSet;
begin
   if(DBGridEh1.SelectedIndex>=0)and(DBGridEh1.SelectedIndex<ClientDataSet1.RecordCount)  then
   begin
      ds:=bs.QueryStopInfo(ClientDataSet1.FieldByName('ID').AsInteger);
      if ds<>nil then
        ClientDataSet2.Data:=ds.Data;
   end;
end;

procedure TStopRecordForm.BitBtnPrintClick(Sender: TObject);
begin
   PrintDBGridEh2.Title.Text:='停车信息  车牌号:'+ClientDataSet1.FieldByName('Car_NO').AsString+
                              '  停车时间:'+ClientDataSet1.FieldByName('StopTime').AsString;
   PrintDBGridEh2.Preview;
end;

end.
