unit FrmViewAlarmDealInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, RzButton, ExtCtrls;

type
  TfrmViewAlarmDealInfo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtCarNo: TEdit;
    edtDevId: TEdit;
    edtAlarmType: TEdit;
    gpsDate: TDateTimePicker;
    gpsTime: TDateTimePicker;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edtAlarmPos: TEdit;
    edtAlarmPerson: TEdit;
    edtAlarmTel: TEdit;
    memoAlarmDealProc: TMemo;
    memoAlarmDealResult: TMemo;
    Label5: TLabel;
    edtDealer: TEdit;
    Label11: TLabel;
    dealDate: TDateTimePicker;
    dealTime: TDateTimePicker;
    RzButton1: TRzButton;
    Label12: TLabel;
    edtAlarmDealStatus: TEdit;
    procedure RzButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmViewAlarmDealInfo: TfrmViewAlarmDealInfo;

implementation

{$R *.dfm}

procedure TfrmViewAlarmDealInfo.RzButton1Click(Sender: TObject);
begin
  Close;
end;

end.
