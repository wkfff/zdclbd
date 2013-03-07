unit FrmSetSleep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls,CarUnit,uGloabVar, ExtCtrls, Buttons,
  ComCtrls;

type
  TFrm_SetSleep = class(TForm)
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    RzBitBtn2: TRzBitBtn;
    RzBitBtn1: TRzBitBtn;
    Panel1: TPanel;
    Panel3: TPanel;
    ListView1: TListView;
    Panel4: TPanel;
    Panel6: TPanel;
    BitBtnSel: TBitBtn;
    BitBtn3: TBitBtn;
    Panel2: TPanel;
    Label4: TLabel;
    ProgressBar1: TProgressBar;
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_SetSleep: TFrm_SetSleep;

implementation

{$R *.dfm}

procedure TFrm_SetSleep.RzBitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_SetSleep.RzBitBtn1Click(Sender: TObject);
var
  dev:TDevice;
  i:Integer;
begin
  if length(Edit1.Text)=0 then
  begin
   MessageBox(handle,'对不起，时间长度不能为空，请输入时间长度！','提示',mb_ok + mb_iconinformation);
   exit;
  end;
  if strtoint(Edit1.Text)>=255 then
  begin
    MessageBox(handle,'对不起，时间长度超过255，请输入时间长度！','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  if ListView1.Items.Count=0 then
  begin
    MessageBox(handle,pchar('命令不能执行，没有指定车辆'),'提示',mb_ok + mb_iconinformation);
    exit;
  end;
  try
    RzBitBtn1.Enabled := False;
    for i:=0 to ListView1.Items.Count -1 do
    begin
      ProgressBar1.StepIt;
      dev:= TDevice(ListView1.Items.Item[i].Data);
      if dev <> nil then
      begin
        DataServer.SetHibernateTime(dev,strtoint(edit1.Text));
        Application.ProcessMessages;
      end;
    end;  
  finally
    ProgressBar1.Visible:=false;
    RzBitBtn1.Enabled:=true;
  end;
  Close;
end;

procedure TFrm_SetSleep.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
   if not (Key in ['0'..'9',#8]) then
     key:=#0;
end;

procedure TFrm_SetSleep.BitBtn3Click(Sender: TObject);
begin
  if ListView1.Selected =nil then exit;
  if ListView1.Items.Count =1 then
  begin
    messagebox(handle,'只有一辆车了，不能删除！','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  ListView1.DeleteSelected;
end;

end.
