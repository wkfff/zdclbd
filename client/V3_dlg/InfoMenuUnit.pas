unit InfoMenuUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, CmdStructUnit;

type
  TInfoMenu = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    memInfo: TMemo;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    EditMenuNO: TEdit;
    editMenuId: TEdit;
    procedure btnOKClick(Sender: TObject);
    procedure EditMenuNOKeyPress(Sender: TObject; var Key: Char);
    procedure EditMenuNOChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InfoMenu: TInfoMenu;

implementation

{$R *.dfm}

procedure TInfoMenu.btnOKClick(Sender: TObject);
begin
  if Trim(EditMenuNO.Text) = '' then
  begin
    messagebox(handle,'请您输入编号！','提示',mb_ok + mb_iconinformation);
    EditMenuNO.SetFocus;
    Exit;
  end;
  if Trim(memInfo.Text)='' then
  begin
    messagebox(handle,'请您输入事件内容！','提示',mb_ok + mb_iconinformation);
    memInfo.SetFocus;
    Exit;
  end;
  ModalResult := mrOk;
end;

procedure TInfoMenu.EditMenuNOKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in [#8, '0'..'9', #22]) then Key := #0;
end;

procedure TInfoMenu.EditMenuNOChange(Sender: TObject);
begin
  if StringToInteger(EditMenuNO.Text) >= 256 then
  begin
    messagebox(handle, ' 编号不能超过256!  ', '提示', mb_ok + mb_iconinformation);
    EditMenuNO.Text := '255';
  end;
end;

end.
