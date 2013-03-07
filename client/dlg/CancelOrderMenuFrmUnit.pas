unit CancelOrderMenuFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons,CarUnit;

type
  TCancelOrderMenuFrm = class(TForm)
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    ListView1: TListView;
    Panel6: TPanel;
    TreeView1: TTreeView;
    Panel7: TPanel;
    Label1: TLabel;
    BitBtnAdd: TBitBtn;
    BitBtnInsert: TBitBtn;
    BitBtnEdit: TBitBtn;
    BitBtnDel: TBitBtn;
    EditMenu: TMemo;
    Panel8: TPanel;
    BitBtnSel: TBitBtn;
    BitBtn3: TBitBtn;
    Panel1: TPanel;
    Panel3: TPanel;
    BitBtnOK: TBitBtn;
    BitBtnClose: TBitBtn;
    ProgressBar1: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnAddClick(Sender: TObject);
    procedure BitBtnInsertClick(Sender: TObject);
    procedure BitBtnEditClick(Sender: TObject);
    procedure BitBtnDelClick(Sender: TObject);
    procedure TreeView1Edited(Sender: TObject; Node: TTreeNode;
      var S: String);
    procedure BitBtnOKClick(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtnSelClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtnCloseClick(Sender: TObject);
  private

    { Private declarations }
  public
    procedure ShowCancelMenu(Dev:TDevice);
    { Public declarations }
  end;

var
  CancelOrderMenuFrm: TCancelOrderMenuFrm;

implementation
    uses uFrmSelectDevs,uGloabVar;
{$R *.dfm}

procedure TCancelOrderMenuFrm.FormCreate(Sender: TObject);
begin
  EditMenu.Text:='';
end;

procedure TCancelOrderMenuFrm.BitBtnAddClick(Sender: TObject);
begin
  if TreeView1.Items.Count>10 then
  begin
    messagebox(handle,'对不起,最多只添加10个取消菜单!','提示',mb_ok + mb_iconinformation);
    TreeView1.SetFocus;
    exit;
  end;
  if EditMenu.Text = '' then
  begin
   messagebox(handle,'菜单不能为空!','提示',mb_ok + mb_iconinformation);
   EditMenu.SetFocus;
   exit;
  end;
  TreeView1.Items.AddChild(Treeview1.Items.GetFirstNode,EditMenu.Text);
  Treeview1.Items.GetFirstNode.Expanded:=true;
  editMenu.Text:='';
  EditMenu.SetFocus;
end;

procedure TCancelOrderMenuFrm.BitBtnInsertClick(Sender: TObject);
begin
  if TreeView1.Items.Count>10 then
  begin
    messagebox(handle,'对不起,最多只添加10个取消菜单!','提示',mb_ok + mb_iconinformation);
    TreeView1.SetFocus;
    exit;
  end;
  if EditMenu.Text = '' then
  begin
    messagebox(handle,'插入的菜单不能为空,请在菜单内容里添加!','提示',mb_ok + mb_iconinformation);
    EditMenu.SetFocus;
    exit;
  end;
  if TreeView1.Selected =nil then
  begin
    messagebox(handle,'请选择一个菜单,作为插入接点!','提示',mb_ok + mb_iconinformation);
    TreeView1.SetFocus;
  end;
  if TreeView1.Selected.Level=0 then exit;
  TreeView1.Items.Insert(TreeView1.Selected,editMenu.Text);
  Treeview1.Items.GetFirstNode.Expanded:=true;
  editMenu.Text:='';
  EditMenu.SetFocus;
end;

procedure TCancelOrderMenuFrm.BitBtnEditClick(Sender: TObject);
begin
 if  (TreeView1.Selected<>nil)and(TreeView1.Selected.Level<>0) then
 begin
   TreeView1.ReadOnly:=false;
   TreeView1.Selected.EditText;
   if editmenu.Text <>'' then
   begin
    TreeView1.Selected.Text:=editmenu.Text;
    TreeView1.Selected.EndEdit(false);
    TreeView1.Selected.EditText;
   end;
   editmenu.Text:='';
 end;
end;

procedure TCancelOrderMenuFrm.BitBtnDelClick(Sender: TObject);
begin
 if (TreeView1.Selected<>nil)and(TreeView1.Selected.Level<>0) then
    TreeView1.Selected.Delete;
end;

procedure TCancelOrderMenuFrm.TreeView1Edited(Sender: TObject;
  Node: TTreeNode; var S: String);
begin
 if Length(S)>40 then
   S:=Copy(S,1,40);
 TreeView1.ReadOnly:=true;
end;

procedure TCancelOrderMenuFrm.BitBtnOKClick(Sender: TObject);
 procedure AddToDev(Dev:TDevice);
 var
  i:integer;
  Node:TTreeNode;
  PMenu:PCancelOrderMenu;
 begin
   Node:=TreeView1.Items.GetFirstNode;
   if Node=nil then exit;
   Dev.ClearCancelOrderMenuList;
   for i:=0 to Node.Count-1 do
   begin
    PMenu:=Dev.AddCancelOrderMenu(i+1);
    PMenu^.Name:=Node.Item[i].Text;
   end;
   bs.AddCancelOrderReason(Dev); 
 end;
 procedure SendMenu(Dev:TDevice);
 var
   i:integer;
   Len:integer;
   Cur:integer;
   buf:array of byte;
 begin
   Cur:=0;
   Len:=0;
   for i:=0 to  Dev.CancelOrderMenuCount-1 do
   begin
     Inc(Len,2);
     SetLength(buf,Len);
     buf[Cur]:=Dev.CancelOrderMenuItems[i].ID;
     inc(Cur);
     buf[Cur]:=Length(Dev.CancelOrderMenuItems[i].Name);
     Len:=Len+buf[Cur];
     SetLength(buf,Len);
     inc(Cur);
     CopyMemory(@buf[Cur],@Dev.CancelOrderMenuItems[i].Name[1],buf[Cur-1]);
     Cur:=Cur+buf[Cur-1];
   end;
   DataServer.ModifyCancelOrderMenu(Dev.Id,@buf[0],Len);
 end;
var
  i:integer;
begin
  if ListView1.Items.Count=0 then
  begin
    messagebox(handle,'请选择一辆车!','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  if TreeView1.Items.GetFirstNode.Count=0 then
  begin
    messagebox(handle,'请添加一个取消菜单!','提示',mb_ok + mb_iconinformation);
    EditMenu.SetFocus;
    exit;
  end;
  ProgressBar1.Visible:=true;
  try
    ProgressBar1.Max:=ListView1.Items.Count*10*2;
    for i:=0 to ListView1.Items.Count -1 do
    begin
       ProgressBar1.StepIt;
       AddToDev(TDevice(ListView1.Items.Item[i].Data));
       SendMenu(TDevice(ListView1.Items.Item[i].Data));
       ProgressBar1.StepIt;
       //sleep(50);
       Application.ProcessMessages;
    end;
  finally
    ProgressBar1.Visible:=false;
  end;
  close;
end;

procedure TCancelOrderMenuFrm.ShowCancelMenu(Dev: TDevice);
var
  i:integer;
  Node,N:TTreeNode;
begin
  Treeview1.Items.Clear;
  Node:= Treeview1.Items.AddChild(nil,'取消订单菜单');
  for i:=0 to Dev.CancelOrderMenuCount -1 do
  begin
    N:=Treeview1.Items.AddChild(Node,Dev.CancelOrderMenuItems[i].Name);
    N.Data:=Pointer(Dev.CancelOrderMenuItems[i].ID);
  end;
  Node.Expanded:=true;
end;

procedure TCancelOrderMenuFrm.ListView1Click(Sender: TObject);
begin
  if ListView1.Selected <> nil then
  begin
    ShowCancelMenu(TDevice(ListView1.Selected.Data));
  end;
end;

procedure TCancelOrderMenuFrm.FormShow(Sender: TObject);
begin
   if ListView1.Items.Count = 0 then exit;
   ListView1.Items.Item[0].Selected:=true;
   ListView1Click(ListView1);
end;

procedure TCancelOrderMenuFrm.BitBtnSelClick(Sender: TObject);
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

procedure TCancelOrderMenuFrm.BitBtn3Click(Sender: TObject);
begin
  if ListView1.Selected =nil then exit;
  if ListView1.Items.Count =1 then
  begin
    messagebox(handle,'只有一辆车了，不能删除！','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  ListView1.DeleteSelected ; 
end;

procedure TCancelOrderMenuFrm.BitBtnCloseClick(Sender: TObject);
begin
  close;
end;

end.
