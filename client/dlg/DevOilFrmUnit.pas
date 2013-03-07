unit DevOilFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ucall_dev, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TDevOilFrm = class(Tcall_dev)
    Edit1: TEdit;
    Label1: TLabel;
    ProgressBar1: TProgressBar;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure ListView1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DevOilFrm: TDevOilFrm;

implementation
uses CarUnit, uGloabVar;
{$R *.dfm}

procedure TDevOilFrm.FormShow(Sender: TObject);
begin
  inherited;
 // RadioGroup1.ItemIndex:=0;
  if ListView1.Items.Count > 0 then
  begin
    edit1.Text := TDevice(ListView1.Items.Item[0].Data).Param.PursueInterval;
    if edit1.Text = '' then edit1.Text := '30';
    ListView1.Items.Item[0].Selected := true;
    ListView1.SetFocus;
  end;
end;

procedure TDevOilFrm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #8) then exit;
  if not (Key in [#8, '0'..'9']) then
  begin
    Key := #0
  end
  else if StrToInt(Edit1.Text + Key) > 65535 then
  begin
    Key := #0;
  end;
end;

procedure TDevOilFrm.ListView1Click(Sender: TObject);
begin
  if ListView1.Selected <> nil then
  begin
    Edit2.Text := floatToStr(bs.QueryDevOil(TDevice(ListView1.Selected.Data).IdStr));
  end;
end;

procedure TDevOilFrm.BitBtn1Click(Sender: TObject);
var
  i: integer;
  Dev: TDevice;
begin
  ProgressBar1.StepBy(0);
  ProgressBar1.Visible := true;
  ProgressBar1.Max := ListView1.Items.Count * 10;
  Panel2.Enabled := false;
  BitBtn1.Enabled := false;
  try
    if ListView1.Items.Count = 0 then
    begin
      messagebox(handle, pchar('请指定车辆！'), '提示', mb_ok + mb_iconinformation);
      exit;
    end;
    for i := 0 to ListView1.Items.Count - 1 do
    begin
      ProgressBar1.StepIt;
      dev := TDevice(ListView1.Items.Item[i].Data);
      if dev <> nil then
      begin
        BS.SetDevOil(dev.IdStr,Strtofloat(edit2.Text));
        Application.ProcessMessages;
      end;
    end;
  finally
    ProgressBar1.Visible := false;
    Panel2.Enabled := true;
    BitBtn1.Enabled := true;
  end;
  Close;
end;

procedure TDevOilFrm.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in [#8, '0'..'9','.']) then
    Key := #0
  else
  begin
  end;
end;

end.
