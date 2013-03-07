unit FangWeiFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls, ExtDlgs;

type
  TFangWeiFrm = class(TForm)
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Panel3: TPanel;
    ListView1: TListView;
    Panel4: TPanel;
    Panel6: TPanel;
    BitBtnSel: TBitBtn;
    BitBtn3: TBitBtn;
    Panel5: TPanel;
    Panel7: TPanel;
    PanProgress: TPanel;
    ProgressBar1: TProgressBar;
    GroupBox1: TGroupBox;
    CheckBox3: TCheckBox;
    RadioButton2: TRadioButton;
    RadioButton1: TRadioButton;
    OpenPictureDialog1: TOpenPictureDialog;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    EditInfo: TEdit;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    BitBtn4: TBitBtn;
    Bevel1: TBevel;
    Image1: TImage;
    CheckBox2: TCheckBox;
    CheckBox1: TCheckBox;
    procedure BitBtnSelClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
  private
    { Private declarations }
  public
    Cancel: Boolean;
  end;

var
  FangWeiFrm: TFangWeiFrm;

implementation
uses uFrmSelectDevs,Carunit,uGloabVar,ConstDefineUnit;
{$R *.dfm}

procedure TFangWeiFrm.BitBtnSelClick(Sender: TObject);
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

procedure TFangWeiFrm.BitBtn3Click(Sender: TObject);
begin
  if ListView1.Selected =nil then exit;
  if ListView1.Items.Count =1 then
  begin
    messagebox(handle,'只有一辆车了，不能删除！','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  ListView1.DeleteSelected ; 
end;

procedure TFangWeiFrm.BitBtn1Click(Sender: TObject);
var
  i,j:integer;
  D:TDevice;
  ShuXing: Integer;
begin
  try
    ShuXing := 0;
    PanProgress.Visible:=true;
    ProgressBar1.Max:=ListView1.Items.Count*5*10;
    TbitBtn(Sender).Enabled:=false;
    if RadioButton1.Checked then
      ShuXing := 0;
    if RadioButton2.Checked then
      ShuXing := 4;
    if CheckBox3.Checked then
      ShuXing := ShuXing + 8;

    for i:=0 to ListView1.Items.Count -1 do
    begin
      if Cancel then
      begin
        if messagebox(handle, '是否确实要取消对剩余车辆的操作？', '提示', MB_YESNO + MB_ICONQUESTION) = ID_YES then
        begin
          Close;
          Exit;
        end
        else
        begin
          Cancel := False;
        end;
      end;

      D:=TDevice(ListView1.Items.Item[i].Data);
      ProgressBar1.StepIt;

      ProgressBar1.StepIt;

      if CheckBox1.Checked then
      begin
        DataServer.SendAntiFake_V3(D, Trim(editInfo.Text), ShuXing);
      end;

      if CheckBox2.Checked then
      begin
        DataServer.SendAntiFake_V3_new(D, Image1.Picture.Bitmap, ShuXing);
      end;

      ProgressBar1.StepIt;
      ProgressBar1.StepIt;
      //Sleep(50);
      Application.ProcessMessages;
    end;
  finally
    PanProgress.Visible:=False;
    TbitBtn(Sender).Enabled:=true;
  end;
 Close;
end;

procedure TFangWeiFrm.BitBtn2Click(Sender: TObject);
begin
  Cancel := False;
end;

procedure TFangWeiFrm.BitBtn4Click(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
  begin
    Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
  end;
end;

procedure TFangWeiFrm.CheckBox1Click(Sender: TObject);
begin
  CheckBox2.Checked := not CheckBox1.Checked;
  GroupBox2.Enabled := CheckBox1.Checked;
  GroupBox3.Enabled := not CheckBox1.Checked;
end;

procedure TFangWeiFrm.CheckBox2Click(Sender: TObject);
begin
  CheckBox1.Checked := not CheckBox2.Checked;
  GroupBox3.Enabled := CheckBox2.Checked;
  GroupBox2.Enabled := not CheckBox2.Checked;
end;

end.
