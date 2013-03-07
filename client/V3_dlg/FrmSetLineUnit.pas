unit FrmSetLineUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, ExtCtrls, ComCtrls;

type
  TfrmSetLine = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    CheckBox1: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    beginDate: TDateTimePicker;
    beginTime: TDateTimePicker;
    endDate: TDateTimePicker;
    endTime: TDateTimePicker;
    Label1: TLabel;
    edtLineNo: TEdit;
    Label2: TLabel;
    edtLineName: TEdit;
    Panel2: TPanel;
    RzButton1: TRzButton;
    RzButton2: TRzButton;
    GroupBox2: TGroupBox;
    ListView1: TListView;
    RzBitBtn3: TRzBitBtn;
    RzBitBtn4: TRzBitBtn;
    procedure CheckBox1Click(Sender: TObject);
    procedure RzButton1Click(Sender: TObject);
    procedure edtLineNoExit(Sender: TObject);
    procedure RzBitBtn4Click(Sender: TObject);
    procedure RzBitBtn3Click(Sender: TObject);
    procedure edtLineNoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function checkTimeValid(): Boolean;
    function GetLineProperty: Word;
  public
    { Public declarations }
    LineNo: Integer;
    LineName: string;
    LineProperty: Word;
    STime, ETime: TDateTime;
  end;

implementation
uses
  Math, uGloabVar, uFrmSelectDevs, CarUnit, ConstDefineUnit;

{$R *.dfm}

procedure TfrmSetLine.CheckBox1Click(Sender: TObject);
begin
  with CheckBox1 do
  begin
    beginDate.Enabled := Checked;
    beginTime.Enabled := Checked;
    endDate.Enabled := Checked;
    endTime.Enabled := Checked;
    if Checked then
    begin
      beginDate.Color := clWindow;
      beginTime.Color := clWindow;
      endDate.Color := clWindow;
      endTime.Color := clWindow;
    end
    else
    begin
      beginDate.Color := clBtnFace;
      beginTime.Color := clBtnFace;
      endDate.Color := clBtnFace;
      endTime.Color := clBtnFace;
    end;  
  end;
end;

procedure TfrmSetLine.RzButton1Click(Sender: TObject);
var
  t: TDateTime;
begin
  if Trim(edtLineNo.Text) = '' then
  begin
    MessageBox(Handle, PChar('请输入路线编号'), '提示', MB_OK + MB_ICONINFORMATION);
    edtLineNo.SetFocus;
    Exit;
  end;
  if Trim(edtLineName.Text) = '' then
  begin
    MessageBox(Handle, PChar('请输入路线名称'), '提示', MB_OK + MB_ICONINFORMATION);
    edtLineName.SetFocus;
    Exit;
  end;
  if CheckBox1.Checked then
  begin
    if not checkTimeValid then
    begin
      MessageBox(Handle, '结束时间不能小于开始时间，请重新选择', '提示', MB_OK + MB_ICONINFORMATION);
      endTime.SetFocus;
      Exit;
    end;
  end;
  LineNo := StrToInt(edtLineNo.Text);
  LineName := Trim(edtLineName.Text);
  LineProperty := GetLineProperty;
  t := beginDate.DateTime;
  ReplaceTime(t, beginTime.DateTime);
  STime := t;
  t := endDate.DateTime;
  ReplaceTime(t, endTime.DateTime);
  ETime := t;
  ModalResult := mrOk;
end;

function TfrmSetLine.checkTimeValid: Boolean;
var
  sDateTime: TDateTime;
  eDateTime: TDateTime;
begin
  sDateTime := beginDate.DateTime;
  ReplaceTime(sDateTime, beginTime.DateTime);
  eDateTime := endDate.DateTime;
  ReplaceTime(eDateTime, endTime.DateTime);
  if sDateTime < eDateTime then
    Result := True
  else
    Result := False;
end;

procedure TfrmSetLine.edtLineNoExit(Sender: TObject);
begin
  if Trim(edtLineNo.Text) <> '' then
  begin
    if (StrToInt64(Trim(edtLineNo.Text)) > MAXLONGWORD) or (StrToInt64(Trim(edtLineNo.Text)) < 1) then
    begin
      messagebox(handle, '区域编号必须介于1~4294967295，请重新输入', '提示', mb_ok + mb_iconinformation);
      edtLineNo.SetFocus;
      Exit;          
    end;
    if FAllAreaManage.findByAreaNo(StrToInt(edtLineNo.Text)) <> nil then
    begin
      messagebox(handle, '该编号已经存在，不能使用!', '提示', mb_ok + mb_iconinformation);
      edtLineNo.SetFocus;
    end;
  end;
end;

function TfrmSetLine.GetLineProperty: Word;
var
  b: array[0..7] of byte;
  tmp: Word;
  i: Integer;
begin
  Result := $00FF;
  FillChar(b, 8, 0);
  b[0] := IfThen(CheckBox1.Checked, 1, 0);
  b[2] := IfThen(CheckBox3.Checked, 1, 0);
  b[3] := IfThen(CheckBox4.Checked, 1, 0);
  b[4] := IfThen(CheckBox4.Checked, 1, 0);
  b[5] := IfThen(CheckBox4.Checked, 1, 0);

  tmp := 0;
  for i := 0 to 7 do
  begin
    tmp := tmp + (b[i] shl i);
  end;
  Result := Result and tmp;
end;

procedure TfrmSetLine.RzBitBtn4Click(Sender: TObject);
begin
  if ListView1.Selected<>nil then
  begin
    ListView1.Selected.Delete;
  end;
end;

procedure TfrmSetLine.RzBitBtn3Click(Sender: TObject);
var
  frm: TFrmSelectDevs;
  i: integer;
begin
  frm := TFrmSelectDevs.Create(nil);
  try
    if frm.ShowModal = mrOk then
    begin
      ListView1.Clear;
      for i := 0 to frm.DestList.Count - 1 do
      begin
        with ListView1.Items.Add do
        begin
          Caption := TDevice(frm.DestList.Items[i].Data).Car.No;
          Data := frm.DestList.Items[i].Data;
        end;
      end;
    end;
  finally
    frm.Free;
  end;
end;

procedure TfrmSetLine.edtLineNoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#8, '0'..'9', #22]) then Key := #0;
end;

end.
