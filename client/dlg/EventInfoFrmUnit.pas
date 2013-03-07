unit EventInfoFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, CmdStructUnit;

type
  TEventInfoFrm = class(TForm)
    Panel1: TPanel;
    memInfo: TMemo;
    Label1: TLabel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    EditEventNO: TEdit;
    Label2: TLabel;
    editEventId: TEdit;
    Label3: TLabel;
    procedure btnOKClick(Sender: TObject);
    procedure EditEventNOKeyPress(Sender: TObject; var Key: Char);
    procedure EditEventNOChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EventInfoFrm: TEventInfoFrm;

implementation

{$R *.dfm}

procedure TEventInfoFrm.btnOKClick(Sender: TObject);
begin
  if Trim(EditEventNO.Text) = '' then
  begin
    messagebox(handle,'请您输入编号！','提示',mb_ok + mb_iconinformation);
    EditEventNO.SetFocus;
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

procedure TEventInfoFrm.EditEventNOKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (Key in [#8, '0'..'9', #22]) then Key := #0;
end;

procedure TEventInfoFrm.EditEventNOChange(Sender: TObject);
begin
  if StringToInteger(EditEventNO.Text) >= 256 then
  begin
    messagebox(handle, ' 编号不能超过256!  ', '提示', mb_ok + mb_iconinformation);
    EditEventNO.Text := '255';
  end;
end;

end.
