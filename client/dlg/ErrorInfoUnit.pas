unit ErrorInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TErrorInfoFrm = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    lblInfo: TLabel;
    btnInfo: TBitBtn;
    Panel2: TPanel;
    memInfo: TMemo;
    btnOK: TBitBtn;
    procedure btnInfoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ErrorInfoFrm: TErrorInfoFrm;

implementation

{$R *.dfm}

procedure TErrorInfoFrm.btnInfoClick(Sender: TObject);
begin
  Panel2.Visible := not Panel2.Visible;
  if Panel2.Visible then
  begin
    Self.Height := 286;
  end else
  begin
    Self.Height := 140;
  end;
end;

procedure TErrorInfoFrm.FormShow(Sender: TObject);
begin
  Self.Height := 140;
end;

end.
