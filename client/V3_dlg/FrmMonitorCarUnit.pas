unit FrmMonitorCarUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CarUnit, RzButton, StdCtrls, ExtCtrls;

type
  TfrmMonitorCar = class(TForm)
    Panel2: TPanel;
    edtTel: TEdit;
    Label2: TLabel;
    Label1: TLabel;
    edtCarNo: TEdit;
    RzButton1: TRzButton;
    RzButton2: TRzButton;
    procedure RzButton1Click(Sender: TObject);
    procedure RzButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    dev: TDevice;
  end;

var
  frmMonitorCar: TfrmMonitorCar;

implementation
uses
  uGloabVar;

{$R *.dfm}

procedure TfrmMonitorCar.RzButton1Click(Sender: TObject);
begin
  if Trim(edtTel.Text) = '' then
  begin
    MessageBox(Handle, '请输入平台的电话号码', '提示', MB_OK + MB_ICONINFORMATION);
    edtTel.SetFocus;
    Exit;
  end;
  if dev <> nil then
  begin
    DataServer.SendBackCallTel_V3(dev, 1, Trim(edtTel.Text));
    if currAlarmInfo <> nil then
      currAlarmInfo.SendCallBackCmdStatus := 1;
  end;
  ModalResult := mrOk;
end;

procedure TfrmMonitorCar.RzButton2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmMonitorCar.FormShow(Sender: TObject);
begin
  if dev <> nil then
    edtCarNo.Text := dev.Car.No;
end;

end.
