unit QueryServeJudgeByDRunDataFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls, StdCtrls, Buttons, DB,DBClient;

type
  TQueryServeJudgeByDRunDataFrm = class(TForm)
    Panel4: TPanel;
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    xml: string;
  end;

var
  QueryServeJudgeByDRunDataFrm: TQueryServeJudgeByDRunDataFrm;

implementation

{$R *.dfm}

procedure TQueryServeJudgeByDRunDataFrm.FormShow(Sender: TObject);
var
  aqStore: TClientDataSet;
begin
  aqStore := TClientDataSet.Create(nil);
  DataSource1.DataSet := aqStore;

   aqStore.XMLData := xml;
    aqStore.Open;
    if aqStore.RecordCount  <= 0 then
    begin
      MessageBox(Handle,'对不起，没有符合条件的数据！','提示',MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
    DataSource1.DataSet := aqStore;
    DBGridEh1.DataSource := DataSource1;
end;

end.
