unit uChangePass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons,BusinessServerUnit;

type
  TChangePass = class(TForm)
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
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  ChangePass: TChangePass;

implementation
uses ugloabvar;

{$R *.dfm}

procedure TChangePass.FormCreate(Sender: TObject);

begin
  edit1.Text:= current_user.UserName ;
  edit2.Text:='';
  edit3.Text:='';
  edit4.Text:='';

end;

procedure TChangePass.BitBtn1Click(Sender: TObject);
var bs:TBusinessSevercom  ;
begin
  if trim(edit3.text)<>trim(edit4.text) then
  begin
    messagebox(handle,'<新密码>和<新密码确认>不一致！请重新输入<新密码>和<新密码确认>!','提示',mb_ok + mb_iconinformation);
    edit3.SetFocus ;
    exit;
  end;

  if trim(edit2.text)<> current_user.Password then
  begin
    messagebox(handle,'<旧密码>不正确！请重新输入<旧密码>!','提示',mb_ok + mb_iconinformation);
    edit2.SetFocus ;
    exit;
  end;

  bs:= TBusinessSevercom.Create ;
  try
    if bs.ChangePassword(current_user,trim(edit3.text)) then
    begin
      messagebox(handle,'密码修改完成！','提示',mb_ok + mb_iconinformation);
      close;
    end else
    begin
      { ChangePassword error}
    end;
  finally
    bs.Free ;
  end;
end;

procedure TChangePass.BitBtn2Click(Sender: TObject);
begin
  close;
end;

end.
