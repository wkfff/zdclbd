unit OverSpeedRecordUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, cxGraphics, cxCustomData,
  cxStyles, cxTL, cxTextEdit, cxInplaceContainer, cxControls, DB, DBClient,
  PrnDbgeh, Grids, DBGridEh, DBGrids, RzDBGrid, cxMaskEdit, cxDBTL,
  cxTLData;

type
  TOverSpeedRecordForm = class(TForm)
    Panel5: TPanel;
    Panel6: TPanel;
    Label1: TLabel;
    ComboboxCarNO: TComboBox;
    Panel4: TPanel;
    Panel2: TPanel;
    BitBtnPrint: TBitBtn;
    BitBtn3: TBitBtn;
    FromDate: TDateTimePicker;
    FromTime: TDateTimePicker;
    ToDate: TDateTimePicker;
    ToTime: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    BitBtnQuery: TBitBtn;
    DBGridEh1: TDBGridEh;
    PrintDBGridEh1: TPrintDBGridEh;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnQueryClick(Sender: TObject);
    procedure BitBtnPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ShowClientDataSet(ClientDataSet: TClientDataSet;cxTreeList: TcxDBTreeList);
  end;

var
  OverSpeedRecordForm: TOverSpeedRecordForm;

implementation
         uses uGloabVar,CarUnit;
{$R *.dfm}

procedure TOverSpeedRecordForm.FormCreate(Sender: TObject);
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

procedure TOverSpeedRecordForm.BitBtnQueryClick(Sender: TObject);
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
    begin
       dataset:=bs.QueryOverSpeedInfo(fromDatetime,toDatetime,IDstr);
    end
    else
    begin
       dataset:=bs.QueryOverSpeedInfo(fromDatetime,toDatetime,'');
    end;
    if  dataset<>nil then
    begin
       ClientDataSet1.Data:=dataset.Data;
    end;
  //ShowClientDataSet(ClientDataSet1,cxDBTreeList1);
// ClientDataSet1.FieldDefList.Add()
end;

procedure TOverSpeedRecordForm.BitBtnPrintClick(Sender: TObject);
var
  fromDatetime:string;
  toDatetime:string;
begin
fromDatetime:=FormatDatetime('yyyy-mm-dd ',fromDate.Date)+FormatDatetime('hh:nn:ss',fromTime.Time);
toDatetime:=FormatDatetime('yyyy-mm-dd ',toDate.Date)+FormatDatetime('hh:nn:ss',toTime.Time);

   PrintDBGridEh1.Title.Text:='超速信息  从 '+fromDatetime+'  到 '+toDatetime;
   
   PrintDBGridEh1.Preview;
end;

procedure TOverSpeedRecordForm.ShowClientDataSet(
  ClientDataSet: TClientDataSet; cxTreeList: TcxDBTreeList);
var
  i:integer;
  col:TcxDBTreeListColumn;
begin
  if ClientDataSet.FieldCount>0 then
  begin
      for i := 0 to ClientDataSet.FieldCount-1 do
      begin
         Col:=TcxDBTreeListColumn(cxTreeList.CreateColumn(nil));
         //.DataType
         //col.DataBinding.ValueType
         col.Caption.Text:=ClientDataSet.Fields.Fields[i].FieldName;
         col.DataBinding.FieldName:=col.Caption.Text;

      end;



  end;


end;

end.
