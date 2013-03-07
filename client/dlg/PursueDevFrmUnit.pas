unit PursueDevFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ucall_dev, ComCtrls, StdCtrls, Buttons, ExtCtrls, CmdStructUnit;

type
  TPursueDevFrm = class(Tcall_dev)
    RadioGroup1: TRadioGroup;
    Panel3: TPanel;
    ProgressBar1: TProgressBar;
    lbl2: TLabel;
    Label2: TLabel;
    lbl1: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    Edit1: TEdit;
    comboxShuXing: TComboBox;
    Edit2: TEdit;
    procedure FormShow(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure ListView1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure comboxShuXingChange(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    procedure EditLable(lb1: string; lb2: string; lb3: string; lb4: string);
  public
    Cancel: Boolean;
  end;

var
  PursueDevFrm: TPursueDevFrm;
   ShuXing: Byte = $00;
implementation
uses CarUnit,uGloabVar;
{$R *.dfm}

procedure TPursueDevFrm.EditLable(lb1: string; lb2: string; lb3: string; lb4: string);
begin
  lbl1.Caption := lb1;
  lbl2.Caption := lb2;
  lbl3.Caption := lb3;
  lbl4.Caption := lb4;
end;

procedure TPursueDevFrm.FormShow(Sender: TObject);
begin
  inherited;
  comboxShuXing.ItemIndex :=0;
 // RadioGroup1.ItemIndex:=0;
  if ListView1.Items.Count >0 then
  begin
    edit1.Text:= TDevice(ListView1.Items.Item[0].Data).Param.PursueInterval ;
    if edit1.Text='' then edit1.Text:='30';
    Edit2.Text := '1';
    ListView1.Items.Item[0].Selected:=true;
    ListView1.SetFocus;
  end;
end;

procedure TPursueDevFrm.RadioGroup1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex=0 then
  begin
    Edit1.Enabled:=true;
    Edit1.Text:='30';
  end
  else
  begin
    Edit1.Text :='0';
    Edit1.Enabled:=False;
  end;

end;

procedure TPursueDevFrm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
   if (Key=#8) then exit;
   if not (Key in [#8,'0'..'9']) then
   begin
      Key := #0
   end
   else if StrToInt(Edit1.Text+Key)>65535 then
   begin
      Key := #0;
   end;
end;

procedure TPursueDevFrm.ListView1Click(Sender: TObject);
begin
 {if ListView1.Selected <>nil then
 begin
   edit1.Text:= TDevice(ListView1.Selected.Data).Param.PursueInterval ;
   if edit1.Text='' then
   begin
    edit1.Text:='30';
    RadioGroup1.ItemIndex:=0;
   end;
 end; }
end;

procedure TPursueDevFrm.BitBtn1Click(Sender: TObject);
var
 i:integer;
 Dev:TDevice;
 ContinueTime: LongWord;
begin
  ProgressBar1.StepBy(0);
  ProgressBar1.Visible:=true;
  ProgressBar1.Max:=ListView1.Items.Count*10;
  Panel2.Enabled:=false;
  BitBtn1.Enabled:=false;
  ContinueTime := 0;
  if (ShuXing = $00) or (ShuXing = $10) then
  begin
    ContinueTime := StringToInteger(Edit2.Text) * 60;
  end
  else
  begin
    ContinueTime := StringToInteger(Edit2.Text);
  end;
   
  try
    if ListView1.Items.Count=0 then
    begin
      messagebox(handle,pchar('命令不能执行，没有指定车辆'),'提示',mb_ok + mb_iconinformation);
      exit;
    end;
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
      ProgressBar1.StepIt;
      dev:= TDevice(ListView1.Items.Item[i].Data);
      if dev <> nil then
      begin
        DataServer.PursueCar_V3(dev, ShuXing, StringToInteger(Edit1.Text), ContinueTime{StringToInteger(Edit2.Text)});
        //Application.ProcessMessages;
      end;
    end;
  finally
    ProgressBar1.Visible:=false;
    Panel2.Enabled:=true;
    BitBtn1.Enabled:=true;
  end;
  Close;
end;

procedure TPursueDevFrm.comboxShuXingChange(Sender: TObject);
begin
  with comboxShuXing do
  begin
    case ItemIndex of
      0:
        begin
          ShuXing := $00;
          EditLable('时间间隔：','秒','持续时间：','分钟');
        end;
      1:
        begin
          ShuXing := $11;
          EditLable('距离间隔：','米','持续距离：','米');
        end;
      2:
        begin
          ShuXing := $01;
          EditLable('时间间隔：','秒','持续距离：','米');
        end;
      3:
        begin
          ShuXing := $10;
          EditLable('距离间隔：','米','持续时间：','分钟');
        end;
      4:
        begin
          Edit1.Text := '0';
          Edit2.Text := '0';
          ShuXing := $FF;
        end;
    end;
  end;

end;

procedure TPursueDevFrm.BitBtn2Click(Sender: TObject);
begin
  Cancel := True;

end;

end.
