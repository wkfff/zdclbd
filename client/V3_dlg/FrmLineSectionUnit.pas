unit FrmLineSectionUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzButton, StdCtrls, Buttons;

type
  TfrmSetLineSection = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Notebook2: TNotebook;
    rbNLat: TRadioButton;
    rbSLat: TRadioButton;
    Notebook3: TNotebook;
    rbELong: TRadioButton;
    rbWLong: TRadioButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    edtLineSectionMaxSpeed: TEdit;
    edtLineSectionOverspeedTime: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtLineSectionRunMaxTime: TEdit;
    edtLineSectionRunMinTime: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label1: TLabel;
    edtLineSectionWidth: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    edtLineSectionId: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure edtLineSectionWidthKeyPress(Sender: TObject; var Key: Char);
    procedure edtLineSectionWidthExit(Sender: TObject);
    procedure edtLineSectionRunMaxTimeExit(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    function GetLineSectionProperty: Byte;
  public
    { Public declarations }
    LineSectionWidth: Byte;
    LineSectionProperty: Byte;
    LineSectionRunMaxTime: Word;
    LineSectionRunMinTime: Word;
    LineSectionMaxSpeed: Word;
    LineSectionOverspeedTime: Byte;
  end;

implementation
uses
  Math;
{$R *.dfm}

procedure TfrmSetLineSection.edtLineSectionWidthKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#8, '0'..'9', #22]) then Key := #0;
end;

procedure TfrmSetLineSection.edtLineSectionWidthExit(Sender: TObject);
var
  edit: TEdit;
begin
  edit := TEdit(Sender);
  if Trim(edit.Text) = '' then
  begin
    MessageBox(Handle, PChar('请输入' + edit.Hint), '提示', MB_OK + MB_ICONINFORMATION);
    edit.SetFocus;
    Exit;
  end;
  if (StrToInt(edit.Text) > 255) or (StrToInt(edit.Text) < 0) then
  begin
    MessageBox(Handle, PChar(edit.Hint + '需介于0~255之间，请重新输入'), '提示', MB_OK + MB_ICONINFORMATION);
    edit.SetFocus;
  end;
end;

procedure TfrmSetLineSection.edtLineSectionRunMaxTimeExit(Sender: TObject);
var
  edit: TEdit;
begin
  edit := TEdit(Sender);
  if Trim(edit.Text) = '' then
  begin
    MessageBox(Handle, PChar('请输入' + edit.Hint), '提示', MB_OK + MB_ICONINFORMATION);
    edit.SetFocus;
    Exit;
  end;
  if (StrToInt(edit.Text) > 65535) or (StrToInt(edit.Text) < 0) then
  begin
    MessageBox(Handle, PChar(edit.Hint + '需介于0~65535之间，请重新输入'), '提示', MB_OK + MB_ICONINFORMATION);
    edit.SetFocus;
  end;
end;

procedure TfrmSetLineSection.CheckBox1Click(Sender: TObject);
begin
  edtLineSectionRunMaxTime.Enabled := CheckBox1.Checked;
  edtLineSectionRunMinTime.Enabled := CheckBox1.Checked;
end;

procedure TfrmSetLineSection.CheckBox2Click(Sender: TObject);
begin
  edtLineSectionMaxSpeed.Enabled := CheckBox2.Checked;
  edtLineSectionOverspeedTime.Enabled := CheckBox2.Checked;
end;

function TfrmSetLineSection.GetLineSectionProperty: Byte;
var
  b: array[0..7] of byte;
  tmp: Byte;
  i: Integer;
begin
  Result := $FF;
  FillChar(b, 8, 0);
  b[0] := IfThen(CheckBox1.Checked, 1, 0);
  b[1] := IfThen(CheckBox2.Checked, 1, 0);
  b[2] := IfThen(rbNLat.Checked, 0, 1);
  b[3] := IfThen(rbELong.Checked, 0, 1);

  tmp := 0;
  for i := 0 to 7 do
  begin
    tmp := tmp + (b[i] shl i);
  end;
  Result := Result and tmp;
end;

procedure TfrmSetLineSection.BitBtn1Click(Sender: TObject);
begin
  if Trim(edtLineSectionWidth.Text) = '' then
  begin
    MessageBox(Handle, PChar('请输入' + edtLineSectionWidth.Hint), '提示', MB_OK + MB_ICONINFORMATION);
    edtLineSectionWidth.SetFocus;
    Exit;
  end;
  if CheckBox1.Checked then
  begin
    if Trim(edtLineSectionRunMaxTime.Text) = '' then
    begin
      MessageBox(Handle, PChar('请输入' + edtLineSectionRunMaxTime.Hint), '提示', MB_OK + MB_ICONINFORMATION);
      edtLineSectionRunMaxTime.SetFocus;
      Exit;
    end;
    if Trim(edtLineSectionRunMinTime.Text) = '' then
    begin
      MessageBox(Handle, PChar('请输入' + edtLineSectionRunMinTime.Text), '提示', MB_OK + MB_ICONINFORMATION);
      edtLineSectionRunMinTime.SetFocus;
      Exit;
    end;
  end;
  if CheckBox2.Checked then
  begin
    if Trim(edtLineSectionMaxSpeed.Text) = '' then
    begin
      MessageBox(Handle, PChar('请输入' + edtLineSectionMaxSpeed.Hint), '提示', MB_OK + MB_ICONINFORMATION);
      edtLineSectionMaxSpeed.SetFocus;
      Exit;
    end;
    if Trim(edtLineSectionOverspeedTime.Text) = '' then
    begin
      MessageBox(Handle, PChar('请输入' + edtLineSectionOverspeedTime.Hint), '提示', MB_OK + MB_ICONINFORMATION);
      edtLineSectionOverspeedTime.SetFocus;
      Exit;
    end;
  end;
  LineSectionWidth := StrToInt(edtLineSectionWidth.Text);
  LineSectionProperty := GetLineSectionProperty;
  LineSectionRunMaxTime := StrToInt(edtLineSectionRunMaxTime.Text);
  LineSectionRunMinTime := StrToInt(edtLineSectionRunMinTime.Text);
  LineSectionMaxSpeed := StrToInt(edtLineSectionMaxSpeed.Text);
  LineSectionOverspeedTime := StrToInt(edtLineSectionOverspeedTime.Text);
  ModalResult := mrOk;
end;

procedure TfrmSetLineSection.BitBtn2Click(Sender: TObject);
begin
  if Trim(edtLineSectionWidth.Text) = '' then
  begin
    MessageBox(Handle, PChar('请输入' + edtLineSectionWidth.Hint), '提示', MB_OK + MB_ICONINFORMATION);
    edtLineSectionWidth.SetFocus;
    Exit;
  end;
  if CheckBox1.Checked then
  begin
    if Trim(edtLineSectionRunMaxTime.Text) = '' then
    begin
      MessageBox(Handle, PChar('请输入' + edtLineSectionRunMaxTime.Hint), '提示', MB_OK + MB_ICONINFORMATION);
      edtLineSectionRunMaxTime.SetFocus;
      Exit;
    end;
    if Trim(edtLineSectionRunMinTime.Text) = '' then
    begin
      MessageBox(Handle, PChar('请输入' + edtLineSectionRunMinTime.Text), '提示', MB_OK + MB_ICONINFORMATION);
      edtLineSectionRunMinTime.SetFocus;
      Exit;
    end;
  end;
  if CheckBox2.Checked then
  begin
    if Trim(edtLineSectionMaxSpeed.Text) = '' then
    begin
      MessageBox(Handle, PChar('请输入' + edtLineSectionMaxSpeed.Hint), '提示', MB_OK + MB_ICONINFORMATION);
      edtLineSectionMaxSpeed.SetFocus;
      Exit;
    end;
    if Trim(edtLineSectionOverspeedTime.Text) = '' then
    begin
      MessageBox(Handle, PChar('请输入' + edtLineSectionOverspeedTime.Hint), '提示', MB_OK + MB_ICONINFORMATION);
      edtLineSectionOverspeedTime.SetFocus;
      Exit;
    end;
  end;
  LineSectionWidth := StrToInt(edtLineSectionWidth.Text);
  LineSectionProperty := GetLineSectionProperty;
  LineSectionRunMaxTime := StrToInt(edtLineSectionRunMaxTime.Text);
  LineSectionRunMinTime := StrToInt(edtLineSectionRunMinTime.Text);
  LineSectionMaxSpeed := StrToInt(edtLineSectionMaxSpeed.Text);
  LineSectionOverspeedTime := StrToInt(edtLineSectionOverspeedTime.Text);
  ModalResult := mrYes;
end;

end.
