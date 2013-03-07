unit EmptyWordUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls,uGloabVar,CarUnit,uFrmSelectDevs;

type
  TEmptyWordFrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    CheckBox1: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    ListView1: TListView;
    memo2: TMemo;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    CheckBox2: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EmptyWordFrm: TEmptyWordFrm;

implementation

{$R *.dfm}

procedure TEmptyWordFrm.FormShow(Sender: TObject);
begin
   memo2.Clear;
   if GCurSelectDev<>nil then
    begin
    with ListView1.Items.Add do
    begin
      caption:=GCurSelectDev.Car.No;
      Data:=GCurSelectDev;
    end;
  end;
end;

procedure TEmptyWordFrm.BitBtn1Click(Sender: TObject);
var
  i:integer;
  wordtype,wordEdit: byte;
  wordInfo: String ;
begin
  if RadioButton1.Checked then
  begin
    wordEdit:=0;
  end;
  if RadioButton2.Checked then
  begin
    wordEdit:=1;
  end;
  if RadioButton3.Checked then
  begin
    wordEdit:=2;
  end;
  if RadioButton4.Checked then
  begin
    wordEdit:=3;
  end;
  if not checkbox1.Checked  and not checkbox2.Checked  then
  begin
     messagebox(handle,'请选择进入重车或者退出重车方式!','提示',mb_ok + mb_iconinformation);
     exit;
  end;
  if checkbox1.Checked then
  begin
    wordtype:=0;
  end else
  begin
    wordtype:=1;
  end;
  if length(memo2.Text)=0 then
  begin
    messagebox(handle,'请输入语音提示!','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  for i:=0 to ListView1.Items.Count-1 do
  begin
    DataServer.SetEmptyCarWord(TDevice(ListView1.Items.Item[i].Data),wordtype,wordEdit,trim(memo2.Text));
  end;
  close;
end;

procedure TEmptyWordFrm.CheckBox1Click(Sender: TObject);
begin
  CheckBox1.Font.Color := clWindowText;
  CheckBox2.Font.Color := clWindowText;
  if checkbox1.Checked  then
  begin
    checkbox2.Checked :=False;
    CheckBox1.Font.Color := clBlue;
  end;
end;

procedure TEmptyWordFrm.CheckBox2Click(Sender: TObject);
begin
  CheckBox1.Font.Color := clWindowText;
  CheckBox2.Font.Color := clWindowText;
  if checkbox2.Checked  then
  begin
    checkbox1.Checked :=false;
    CheckBox2.Font.Color := clBlue;
  end;
end;

procedure TEmptyWordFrm.BitBtn5Click(Sender: TObject);
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

procedure TEmptyWordFrm.BitBtn4Click(Sender: TObject);
begin
  memo2.Clear;
end;

procedure TEmptyWordFrm.BitBtn3Click(Sender: TObject);
begin
  close;
end;

end.
