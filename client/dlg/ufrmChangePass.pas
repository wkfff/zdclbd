unit ufrmChangePass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, RzPrgres;

type
  TfrmChangePass = class(TForm)
    Panel1: TPanel;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Label3: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit4: TEdit;
    Label4: TLabel;
    RzProgressBar1: TRzProgressBar;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit3Exit(Sender: TObject);
  private
    { Private declarations }
    function checkNewPassValid: Boolean;
  public
    { Public declarations }
  end;

var
  frmChangePass: TfrmChangePass;

implementation   
 uses ugloabvar;
{$R *.dfm}

procedure TfrmChangePass.BitBtn1Click(Sender: TObject);
begin
  if trim(edit3.text)<>trim(edit4.text) then
  begin
    messagebox(handle,'<新密码>和<新密码确认>不一致！请重新输入<新密码>和<新密码确认>!','提示',mb_ok + mb_iconinformation);
    edit3.SetFocus ;
    exit;
  end;

  if trim(edit2.text) <> current_user.Password then
  begin
    messagebox(handle,'<旧密码>不正确！请重新输入<旧密码>!','提示',mb_ok + mb_iconinformation);
    edit2.SetFocus ;
    exit;
  end;

  ModalResult:= mrok;
  
end;

function TfrmChangePass.checkNewPassValid: Boolean;
var
  i: Integer;
  b: array[0..3] of Byte;
  b1: Byte;
  s: string;
begin
  Result := False;
  s := Trim(Edit3.Text);
  if Length(s) < 6 then
  begin
    RzProgressBar1.Percent := 33;
    RzProgressBar1.BarColor := clRed;
    RzProgressBar1.Hint := '密码强度弱';
    Exit;
  end;

  for i := 0 to 3 do
  begin
    b[i] := 0;
  end;  

  for i := 1 to Length(s) do
  begin
    if s[i] in ['a'..'z', 'A'..'Z'] then
      b[0] := 1
    else if s[i] = '_' then
      b[1] := 1
    else if s[i] in ['0'..'9'] then
      b[2] := 1
    else
      b[3] := 1;
  end;

  b1 := b[0] + b[1] + b[2] + b[3];
  if b1 <= 1 then
  begin
    RzProgressBar1.Percent := 33;
    RzProgressBar1.BarColor := clRed;
    RzProgressBar1.Hint := '密码强度弱';
  end
  else if b1 = 2 then
  begin
    RzProgressBar1.Percent := 66;
    RzProgressBar1.BarColor := $0000F9F9;
    RzProgressBar1.Hint := '密码强度中';
  end
  else
  begin
    RzProgressBar1.Percent := 100;
    RzProgressBar1.BarColor := clLime;
    RzProgressBar1.Hint := '密码强度强'
  end;    
end;

procedure TfrmChangePass.Edit3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  RzProgressBar1.Visible := True;
  checkNewPassValid;
end;

procedure TfrmChangePass.Edit3Exit(Sender: TObject);
begin
  if Length(Trim(Edit3.Text)) < 6 then
  begin
    FGlobalTip.ShowHint('为了账号安全，密码长度建议6位以上，且以字母、数字、下划线组成', Edit3);
    Edit3.SetFocus;
    Exit;
  end;  
end;

end.
