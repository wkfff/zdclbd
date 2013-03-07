unit ReadDevHourDisFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ucall_dev, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TReadDevHourDisFrm = class(Tcall_dev)
    Edit1: TEdit;
    Label1: TLabel;
    ProgressBar1: TProgressBar;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    DateTimePicker2: TDateTimePicker;
    Label6: TLabel;
    Edit3: TEdit;
    Label7: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure ListView1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReadDevHourDisFrm: TReadDevHourDisFrm;

implementation
uses CarUnit, uGloabVar;
{$R *.dfm}

procedure TReadDevHourDisFrm.FormShow(Sender: TObject);
begin
  inherited;
 // RadioGroup1.ItemIndex:=0;
 DateTimePicker1.Date:=now;
 DateTimePicker2.Date:=now;
  if ListView1.Items.Count > 0 then
  begin
    edit1.Text := TDevice(ListView1.Items.Item[0].Data).Param.PursueInterval;
    if edit1.Text = '' then edit1.Text := '30';
    ListView1.Items.Item[0].Selected := true;
    ListView1.SetFocus;
  end;
end;

procedure TReadDevHourDisFrm.Edit1KeyPress(Sender: TObject; var Key: Char);
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

procedure TReadDevHourDisFrm.ListView1Click(Sender: TObject);
begin
  { ListView1.Selected <> nil then
  begin
    edit1.Text := TDevice(ListView1.Selected.Data).Param.PursueInterval;
    if edit1.Text = '' then
    begin
      edit1.Text := '30';
    end;
  end; }
end;

procedure TReadDevHourDisFrm.BitBtn1Click(Sender: TObject);
var
  i, j: integer;
  Dev: TDevice;
  bTime, eTime: array[0..3] of byte;
  tmpStr, str: string;
begin
  ProgressBar1.StepBy(0);
  ProgressBar1.Visible := true;
  ProgressBar1.Max := ListView1.Items.Count * 10;
  Panel2.Enabled := false;
  BitBtn1.Enabled := false;
  try
    if ListView1.Items.Count = 0 then
    begin
      messagebox(handle, pchar('命令不能执行，没有指定车辆'), '提示', mb_ok + mb_iconinformation);
      exit;
    end;
    for i := 0 to ListView1.Items.Count - 1 do
    begin
      ProgressBar1.StepIt;
      dev := TDevice(ListView1.Items.Item[i].Data);
      if dev <> nil then
      begin
        tmpStr := FormatDateTime('yyyymmdd', DateTimePicker1.Date);
        tmpStr := tmpStr + Edit2.Text;
        for j := 0 to 3 do
        begin
          str := copy(tmpStr, j * 2 + 3, 2);
          bTime[j] := StrtoInt('$' + str);
        end;
        tmpStr := FormatDateTime('yyyymmdd', DateTimePicker2.Date);
        tmpStr := tmpStr + Edit3.Text;
        for j := 0 to 3 do
        begin
          eTime[j] := StrtoInt('$' + copy(tmpStr, j * 2 + 3, 2));
        end;
        DataServer.ReadDevHourDis(dev.id, bTime, eTime);
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

procedure TReadDevHourDisFrm.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in [#8, '0'..'9']) then
    Key := #0
  else
  begin
    if Key = #8 then exit;
    if StrToInt(edit2.Text + Key) > 23 then
    begin
      Key := #0;
    end;
  end;
end;

procedure TReadDevHourDisFrm.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in [#8, '0'..'9']) then
    Key := #0
  else
  begin
    if Key = #8 then exit;
    if StrToInt(edit3.Text + Key) > 23 then
    begin
      Key := #0;
    end;
  end;
end;

end.
