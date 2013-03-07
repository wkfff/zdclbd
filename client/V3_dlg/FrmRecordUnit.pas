unit FrmRecordUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons;

type
  TfrmRecord = class(TForm)
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    ListView1: TListView;
    Panel5: TPanel;
    BitBtnSel: TBitBtn;
    BitBtn3: TBitBtn;
    Panel3: TPanel;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtnSelClick(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function checkInput(): Boolean;
  public
    { Public declarations }
  end;


implementation
uses
  uGloabVar, uFrmSelectDevs, CarUnit;
{$R *.dfm}

procedure TfrmRecord.BitBtn1Click(Sender: TObject);
var
  i: Integer;
  dev: TDevice;
  recFlag: Byte;
  recTime: Word;
  recSaveFlag: Byte;
  recSRate: Byte;
begin
  if checkInput() then
  begin
    recFlag := ComboBox1.ItemIndex;
    recTime := StrToInt(Trim(Edit1.Text));
    recSaveFlag := ComboBox2.ItemIndex;
    recSRate := ComboBox3.ItemIndex;
    
    for i := 0 to ListView1.Items.Count - 1 do
    begin
      dev := TDevice(ListView1.Items[i].Data);
      if dev <> nil then
      begin
        DataServer.SendRecordTSP_V3(dev, recFlag, recTime, recSaveFlag, recSRate);
      end;
    end;
    ModalResult := mrOk;
  end;
end;

procedure TfrmRecord.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#8, '0'..'9', #22]) then Key := #0;
end;

procedure TfrmRecord.Edit1Change(Sender: TObject);
var
  i: integer;
begin
  i := length(TEdit(Sender).Text);
  if i > 0 then
    if (StrToInt64(TEdit(Sender).Text) > 65535) or (StrToInt64(TEdit(Sender).Text) < 0) then
    begin
      TEdit(Sender).text := copy(TEdit(Sender).Text, 1, i - 1);
      TEdit(Sender).SelStart := i - 1;
    end;
end;

function TfrmRecord.checkInput: Boolean;
begin
  Result := False;
  if ComboBox1.ItemIndex < 0 then
  begin
    MessageBox(Handle, '请选择录音命令', '提示', MB_OK + MB_ICONINFORMATION);
    ComboBox1.SetFocus;
    Exit;
  end;
  if Trim(Edit1.Text) = '' then
  begin
    MessageBox(Handle, '请输入录音时间', '提示', MB_OK + MB_ICONINFORMATION);
    Edit1.SetFocus;
    Exit;
  end;
  if ComboBox2.ItemIndex < 0 then
  begin
    MessageBox(Handle, '请选择录音保存标志', '提示', MB_OK + MB_ICONINFORMATION);
    ComboBox2.SetFocus;
    Exit;
  end;
  if ComboBox3.ItemIndex < 0 then
  begin
    MessageBox(Handle, '请选择音频采样率', '提示', MB_OK + MB_ICONINFORMATION);
    ComboBox3.SetFocus;
    Exit;
  end;
  if ListView1.Items.Count <= 0 then
  begin
    MessageBox(Handle, '请选择需要录音的车辆', '提示', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;  
  Result := True;
end;

procedure TfrmRecord.BitBtn3Click(Sender: TObject);
begin
  if ListView1.Selected =nil then exit;
  if ListView1.Items.Count =1 then 
  begin
    messagebox(handle,'只有一辆车了，不能删除！','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  ListView1.DeleteSelected ; 
end;

procedure TfrmRecord.BitBtnSelClick(Sender: TObject);
var
  frm: TFrmSelectDevs;
  i:integer;
begin
  frm:=TFrmSelectDevs.Create(nil);
  try
  if frm.ShowModal=mrOk then
  begin
    ListView1.Clear;
    for i:=0 to frm.DestList.Count-1 do
    begin
      with ListView1.Items.Add do
      begin
        Caption:=TDevice(frm.DestList.Items[i].Data).Car.No;
        Data:=frm.DestList.Items[i].Data;
      end;
    end;
  end;
  finally
    frm.Free;
  end;
end;

procedure TfrmRecord.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

end.
