unit UserRegFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFrmUserReg = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    EditZc: TEdit;
    EditBack: TEdit;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    FIDeNum:string;
  public
    { Public declarations }
  end;

var
  FrmUserReg: TFrmUserReg;

implementation
  uses GetIdeNumUnit,uFrmAbout;

{$R *.dfm}

procedure TFrmUserReg.BitBtn3Click(Sender: TObject);
var dlg:TFrmAbout;
begin
  dlg:= Tfrmabout.Create(self);
  try
    dlg.ShowModal;
  finally
    dlg.Free;
  end; 
end;

procedure TFrmUserReg.BitBtn1Click(Sender: TObject);
var
  zcxx :string;
begin
  if trim(EditZc.Text)='' then
  begin
    messagebox(handle,'��������ע��ţ�','��ʾ',mb_ok + mb_iconinformation);
    exit;
  end;
  zcxx:= GetZch(Trim(EditBack.text));
  if zcxx= Trim(EditZc.Text) then
  begin
    messagebox(handle,'ע��ɹ���','��ʾ',mb_ok + mb_iconinformation);
    ModalResult:= mrOk;
  end
  else
  begin
    if messagebox(handle,'��������Ƿ����䣿','��ʾ',mb_ok + mb_iconinformation)= IDNO then
      close;
  end;
end;

end.
