unit LCDMenuALLFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LCDMenuFrmUnit, Menus, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TLCDMenuALLFrm = class(TLCDMenuFrm)
    Panel5: TPanel;
    Panel6: TPanel;
    BitBtn3: TBitBtn;
    BitBtnSel: TBitBtn;
    ListView1: TListView;
    Panel7: TPanel;
    ProgressBar1: TProgressBar;
    procedure BitBtnSendClick(Sender: TObject);
    procedure BitBtnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure BitBtnSelClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LCDMenuALLFrm: TLCDMenuALLFrm;

implementation
  uses CarUnit,uFrmSelectDevs;
{$R *.dfm}

procedure TLCDMenuALLFrm.BitBtnSendClick(Sender: TObject);
var
 i:integer;
begin
  BitBtnSend.Enabled:=false;
  ProgressBar1.Visible:=true;
  try
    if TreeView1.Items.Count =1 then
    begin
      MessageBox(Self.Handle,PChar('菜单不能为空,请添加!'),'提示',mb_ok + mb_iconinformation);
      exit;
    end;
    ProgressBar1.Max:=ListView1.Items.Count*10;
    for i:=0 to ListView1.Items.Count -1 do
    begin
      ProgressBar1.StepIt;
      SendLCDMenu(TDevice(ListView1.Items.Item[i].Data));
      Sleep(50);
      Application.ProcessMessages;
    end;
  finally
    BitBtnSend.Enabled:=true;
    ProgressBar1.Visible:=false;
  end;
  Close;
end;

procedure TLCDMenuALLFrm.BitBtnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TLCDMenuALLFrm.FormShow(Sender: TObject);
var
  Node:TTreeNode;
  Dev: TDevice;
  i: Integer;
begin
  editMenu.Text:='';
  TreeView1.Items.Clear;
  Node:=TreeView1.Items.AddFirst(nil,'显示屏菜单');
  if ListView1.Items.Count =0 then exit;
  ListView1.Items.Item[0].Focused:=true;
  Dev:=TDevice(ListView1.Items.Item[0].Data);
  if Dev<>nil then
  begin
    Menu_List(Dev,0,Node,Dev.DisplayMenuList.Count);
  end;
  for i:=0 to TreeView1.Items.Count -1 do
    TreeView1.Items[i].Expanded := True;
  ListView1.SetFocus;
  if ListView1.Items.Count >0 then 
  ListView1.Items.Item[0].Selected:=true;
end;

procedure TLCDMenuALLFrm.ListView1Click(Sender: TObject);
var
  Node:TTreeNode;
  Dev: TDevice;
  i: Integer;
begin
  if ListView1.Selected=nil then exit;
  TreeView1.Items.Clear;
  Node:=TreeView1.Items.AddFirst(nil,'显示屏菜单');
  if ListView1.Items.Count =0 then exit;

  Dev:=TDevice(ListView1.Selected.Data);
  if Dev<>nil then
  begin
    Menu_List(Dev,0,Node,Dev.DisplayMenuList.Count);
  end;
  for i:=0 to TreeView1.Items.Count -1 do
    TreeView1.Items[i].Expanded := True;
end;

procedure TLCDMenuALLFrm.BitBtnSelClick(Sender: TObject);
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

procedure TLCDMenuALLFrm.BitBtn3Click(Sender: TObject);
begin
  if ListView1.Selected =nil then exit;
  if ListView1.Items.Count =1 then
  begin
    messagebox(handle,'只有一辆车了，不能删除！','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  ListView1.DeleteSelected ; 
end;

end.
