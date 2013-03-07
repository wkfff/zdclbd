unit FrmTSPDataUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ucall_dev, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TfrmTSPData = class(Tcall_dev)
    Memo1: TMemo;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation
uses
  uGloabVar, CarUnit;

{$R *.dfm}

procedure TfrmTSPData.BitBtn1Click(Sender: TObject);
var
  i: Integer;
  dev: TDevice;
begin
  if Trim(Memo1.Lines.Text) = '' then
  begin
    MessageBox(Handle, '��������Ҫ͸������������', '��ʾ', MB_OK + MB_ICONINFORMATION);
    Memo1.SetFocus;
    Exit;
  end;

  if Trim(Edit1.Text) = '' then
  begin
    MessageBox(Handle, '��������������', '��ʾ', MB_OK + MB_ICONINFORMATION);
    Edit1.SetFocus;
    Exit;
  end
  else if (StrToInt(Trim(Edit1.Text)) > 255) or (StrToInt(Trim(Edit1.Text)) < 0) then
  begin
    MessageBox(Handle, '��������ֵ�����0~255֮�䣬����������', '��ʾ', MB_OK + MB_ICONINFORMATION);
    Edit1.SetFocus;
    Exit;
  end;
  if ListView1.Items.Count <= 0 then
  begin
    MessageBox(Handle, '��ѡ����Ҫ����͸�����ݵĳ���', '��ʾ', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  for i := 0 to ListView1.Items.Count - 1 do
  begin
    dev := TDevice(ListView1.Items.Item[i].Data);
    if dev <> nil then
      DataServer.SendTSPData_V3(dev, StrToInt(Trim(Edit1.Text)), Trim(Memo1.Lines.Text));
  end;
  ModalResult := mrOk;
end;

procedure TfrmTSPData.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

end.
