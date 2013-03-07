unit CarNoEmptyUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, cxGraphics, cxCustomData, cxStyles,
  cxTL, cxTextEdit, ExtCtrls, cxInplaceContainer, cxControls, TeEngine,
  Series, TeeProcs, Chart, DbChart, DB, ADODB,DateUtils, cxSplitter,uGloabVar;

type
  TCarNoEmptyFrm = class(TForm)
    GroupBox1: TGroupBox;
    AdInfoList: TcxTreeList;
    AdInfoListcxTreeListColumn1: TcxTreeListColumn;
    AdInfoListcxTreeListColumn2: TcxTreeListColumn;
    Panel3: TPanel;
    Panel2: TPanel;
    SpeedButton4: TSpeedButton;
    Button1: TButton;
    DateTimePicker1: TDateTimePicker;
    Button2: TButton;
    DBChart1: TDBChart;
    FastLineSeries1: TLineSeries;
    Label1: TLabel;
    ADOQuery1: TADOQuery;
    AdInfoListcxTreeListColumn3: TcxTreeListColumn;
    cxSplitter2: TcxSplitter;
    AdInfoListcxTreeListColumn4: TcxTreeListColumn;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CarNoEmptyFrm: TCarNoEmptyFrm;

implementation

uses umainf,StrUtils;

{$R *.dfm}

procedure TCarNoEmptyFrm.FormShow(Sender: TObject);
begin
   DateTimePicker1.Date:=now;
    with DBChart1.Series[0] do
     begin
      Clear;
      AddXY(0, 0, '0');
      AddXY(0.5, 0, '0.5');
      AddXY(1, 0, '1');
      AddXY(1.5, 0, '1.5');
      AddXY(2, 0, '2');
      AddXY(2.5, 0, '2.5');
      AddXY(3, 0, '3');
      AddXY(3.5, 0, '3.5');
      AddXY(4, 0, '4');
      AddXY(4.5, 0, '4.5');
      AddXY(5, 0, '5');
      AddXY(5.5, 0, '5.5');
      AddXY(6, 0, '6');
      AddXY(6.5, 0, '6.5');
      AddXY(7, 0, '7');
      AddXY(7.5, 0, '7.5');
      AddXY(8, 0, '8');
      AddXY(8.5, 0, '8.5');
      AddXY(9, 0, '9');
      AddXY(9.5, 0, '9.5');
      AddXY(10, 0, '10');
      AddXY(10.5, 0, '10.5');
      AddXY(11, 0, '11');
      AddXY(11.5, 0, '11.5');
      AddXY(12,0, '12');
      AddXY(12.5, 0, '12.5');
      AddXY(13, 0, '13');
      AddXY(13.5, 0, '13.5');
      AddXY(14, 0, '14');
      AddXY(14.5, 0, '14.5');
      AddXY(15, 0, '15');
      AddXY(15.5, 0, '15.5');
      AddXY(16, 0, '16');
      AddXY(16.5, 0, '16.5');
      AddXY(17, 0, '17');
      AddXY(17.5, 0, '17.5');
      AddXY(18, 0, '18');
      AddXY(18.5, 0, '18.5');
      AddXY(19, 0, '19');
      AddXY(19.5, 0, '19.5');
      AddXY(20, 0, '20');
      AddXY(20.5, 0, '20.5');
      AddXY(21, 0, '21');
      AddXY(21.5, 0, '21.5');
      AddXY(22, 0, '22');
      AddXY(22.5, 0, '22.5');
      AddXY(23, 0, '23');
      AddXY(23.5, 0, '23.5');
    end;
end;

procedure TCarNoEmptyFrm.Button2Click(Sender: TObject);
begin
  cxTreeListToCSVFile(AdInfoList);
end;

procedure TCarNoEmptyFrm.SpeedButton4Click(Sender: TObject);
begin
  close;
end;

end.
