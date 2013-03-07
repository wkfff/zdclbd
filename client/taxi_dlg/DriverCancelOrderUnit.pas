unit DriverCancelOrderUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TdlgDriverCancelOrder = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnAgree: TBitBtn;
    btnDisagree: TBitBtn;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtCarNo: TEdit;
    Label3: TLabel;
    mmoOrderDes: TMemo;
    rgCancelReason: TRadioGroup;
    procedure btnAgreeClick(Sender: TObject);
    procedure btnDisagreeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dlgDriverCancelOrder: TdlgDriverCancelOrder;

implementation

{$R *.dfm}

procedure TdlgDriverCancelOrder.btnAgreeClick(Sender: TObject);
begin
//
end;

procedure TdlgDriverCancelOrder.btnDisagreeClick(Sender: TObject);
begin
//
end;

end.
