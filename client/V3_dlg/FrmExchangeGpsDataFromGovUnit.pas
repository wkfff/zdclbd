unit FrmExchangeGpsDataFromGovUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, RzButton, ExtCtrls;

type
  TfrmExchangeGpsDataFromGov = class(TForm)
    Panel1: TPanel;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtCarNo: TEdit;
    Label2: TLabel;
    cbxCarCpColor: TComboBox;
    sDate: TDateTimePicker;
    sTime: TDateTimePicker;
    eDate: TDateTimePicker;
    eTime: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    procedure cbxCarCpColorKeyPress(Sender: TObject; var Key: Char);
    procedure RzBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation
uses
  uGloabVar;

{$R *.dfm}

procedure TfrmExchangeGpsDataFromGov.cbxCarCpColorKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := #0;
end;

procedure TfrmExchangeGpsDataFromGov.RzBitBtn1Click(Sender: TObject);
var
  dt1, dt2: TDateTime;
begin
  if Trim(edtCarNo.Text) = '' then
  begin
    ShowTips('请输入车牌号', edtCarNo);
    edtCarNo.SetFocus;
    Exit;
  end;  
  if cbxCarCpColor.ItemIndex < 0 then
  begin
    ShowTips('请选择车牌颜色', cbxCarCpColor);
    cbxCarCpColor.SetFocus;
    Exit;
  end;
  if sDate.Enabled then
  begin
    dt1 := sDate.DateTime;
    ReplaceTime(dt1, sTime.Time);
    dt2 := eDate.DateTime;
    ReplaceTime(dt2, eTime.Time);

    if dt1 > dt2 then
    begin
      ShowTips('结束时间不能小于开始时间，请重新选择时间', eDate);
      eDate.SetFocus;
      Exit;
    end;  
  end;
  ModalResult := mrOk;
end;

end.
