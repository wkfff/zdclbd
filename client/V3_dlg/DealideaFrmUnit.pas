unit DealideaFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TDealideaFrm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CreateParams(Var Param:TCreateParams);override;
  end;

var
  DealideaFrm: TDealideaFrm;

implementation

{$R *.dfm}

procedure TDealideaFrm.CreateParams(var Param: TCreateParams);
begin
  Inherited CreateParams(Param);
  Param.wndParent := GetDesktopWindow;
end;

procedure TDealideaFrm.BitBtn1Click(Sender: TObject);
begin
  if Length(Trim(Memo1.Text)) = 0 then
  begin
    messagebox(handle, '请输入个人意见', '提示', mb_ok + mb_iconinformation);
    Memo1.SetFocus;
    Exit;
  end;
  ModalResult := mrok;
end;

end.
