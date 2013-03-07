unit LCDMenuFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, Menus,CarUnit;

type
  TLCDMenuFrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    TreeView1: TTreeView;
    BitBtnAdd: TBitBtn;
    Label1: TLabel;
    BitBtnInsert: TBitBtn;
    BitBtnEdit: TBitBtn;
    BitBtnDel: TBitBtn;
    BitBtnSend: TBitBtn;
    BitBtnCancel: TBitBtn;
    PopupMenu1: TPopupMenu;
    A1: TMenuItem;
    I1: TMenuItem;
    E1: TMenuItem;
    D1: TMenuItem;
    N1: TMenuItem;
    EditMenu: TMemo;
    BitBtnClear: TBitBtn;
    N2: TMenuItem;
    procedure BitBtnAddClick(Sender: TObject);
    procedure BitBtnInsertClick(Sender: TObject);
    procedure BitBtnEditClick(Sender: TObject);
    procedure BitBtnDelClick(Sender: TObject);
    procedure BitBtnSendClick(Sender: TObject);
    procedure TreeView1Edited(Sender: TObject; Node: TTreeNode;
      var S: String);
    procedure FormShow(Sender: TObject);
    procedure BitBtnCancelClick(Sender: TObject);
    procedure EditMenuChange(Sender: TObject);
    procedure BitBtnClearClick(Sender: TObject);
  private

    { Private declarations }
  protected
      IDs:array of integer;
      MeunContent:array of Byte;
      function SendLCDMenu(Dev:TDevice):boolean;
      procedure Menu_List(Dev:TDevice;AParant_ID:integer;Anode:TTreenode;Acurrent_cnt:integer);

  public

  end;

var
  LCDMenuFrm: TLCDMenuFrm;

implementation
     uses uGloabVar,ConstDefineUnit;
{$R *.dfm}
procedure TLCDMenuFrm.BitBtnAddClick(Sender: TObject);
begin
  if EditMenu.Text ='' then
  begin
    messagebox(handle,'添加的菜单不能为空,请在菜单内容里添加!','提示',mb_ok + mb_iconinformation);
    EditMenu.SetFocus;
    exit;
  end;
  if TreeView1.Items.Count>LCD_MENU_COUNT then
  begin
    messagebox(handle,'对不起,最多只添加128个固定菜单!','提示',mb_ok + mb_iconinformation);
    TreeView1.SetFocus;
    exit;
  end;

 TreeView1.SetFocus;
  if TreeView1.Selected<>nil then
  begin
    TreeView1.Items.AddChild(TreeView1.Selected,editMenu.Text);
    TreeView1.Selected.Expanded:=true;
    TreeView1.Selected.Selected:=true;
  end
  else
  begin
    TreeView1.Items.AddChild(TreeView1.Items.GetFirstNode,editMenu.Text);
    TreeView1.Items.GetFirstNode.Expanded:=true;
    TreeView1.Items.GetFirstNode.Selected:=true;
  end;
 editmenu.Text:='';
  
end;

procedure TLCDMenuFrm.BitBtnInsertClick(Sender: TObject);
begin
  if EditMenu.Text ='' then
  begin
    messagebox(handle,'插入的菜单不能为空,请在菜单内容里添加!','提示',mb_ok + mb_iconinformation);
    EditMenu.SetFocus;
    exit;
  end;
  if TreeView1.Items.Count>LCD_MENU_COUNT then
  begin
    messagebox(handle,'对不起,最多只添加128个固定菜单!','提示',mb_ok + mb_iconinformation);
    TreeView1.SetFocus;
    exit;
  end;
  if  TreeView1.Selected<>nil then
  begin
     if TreeView1.Selected.Level=0 then exit;
     TreeView1.Items.Insert(TreeView1.Selected,editMenu.Text);
  end
  else
  begin
    messagebox(handle,'请选择一个菜单,作为插入接点!','提示',mb_ok + mb_iconinformation);
  end;
end;

procedure TLCDMenuFrm.BitBtnEditClick(Sender: TObject);
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

procedure TLCDMenuFrm.BitBtnDelClick(Sender: TObject);
begin
 if (TreeView1.Selected<>nil)and(TreeView1.Selected.Level<>0) then
    TreeView1.Selected.Delete;
end;



procedure TLCDMenuFrm.BitBtnSendClick(Sender: TObject);
begin
if TreeView1.Items.Count =1 then
begin
 MessageBox(Self.Handle,PChar('菜单不能为,请添加!'),'提示',mb_ok + mb_iconinformation);
 exit;
end;
if   SendLCDMenu(GCurSelectDev) then
begin
  Close;
end;
end;

procedure TLCDMenuFrm.TreeView1Edited(Sender: TObject; Node: TTreeNode;
  var S: String);
begin
 if Length(S)>LCD_MENU_LENGTH then
   S:=Copy(S,1,LCD_MENU_LENGTH);
 TreeView1.ReadOnly:=true;
end;

procedure TLCDMenuFrm.FormShow(Sender: TObject);
var
  Node:TTreeNode;
  i: Integer;
begin
  editMenu.Text:='';
  TreeView1.Items.Clear;
  Node:=TreeView1.Items.AddFirst(nil,'显示屏菜单');
  if GCurSelectDev<>nil then
  begin
    Menu_List(GCurSelectDev,0,Node,GCurSelectDev.DisplayMenuList.Count);
  end;
  for i:=0 to TreeView1.Items.Count -1 do
    TreeView1.Items[i].Expanded := True;
end;

procedure TLCDMenuFrm.BitBtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TLCDMenuFrm.Menu_list(Dev:TDevice; AParant_ID:integer;Anode:TTreenode;Acurrent_cnt:integer);
var
  i:integer;
  leaf_node: TTreenode;     //子级的节点
begin
  for i:=0 to Dev.DisplayMenuList.Count- 1 do
  begin
    if Dev.DisPlayMenuItems[i].ParentID =AParant_ID then
    begin
      leaf_node:= treeview1.Items.addchild(Anode,Dev.DisPlayMenuItems[i].name);
      leaf_node.data:= pointer(Dev.DisPlayMenuItems[i].Id);
      Acurrent_cnt:= Acurrent_cnt -1;
      if Acurrent_cnt<=0 then break;

      if Dev.DisPlayMenuItems[i].IsLeafNode = false then
        begin
          Menu_list(Dev,Dev.DisPlayMenuItems[i].Id,leaf_node,Acurrent_cnt);
        end;
    end;
  end;   
end;

function TLCDMenuFrm.SendLCDMenu(Dev:TDevice):boolean;
var
   i,p,len:integer;
   MeunLong:integer;
   PMenu: PDisplayMenu;
begin
  Result:=false;
  MeunLong:=0;
  SetLength(IDs,TreeView1.Items.Count);
  Dev.ClrDisplayMenuList;
  for i:=0 to TreeView1.Items.Count-1 do
  begin
    if TreeView1.Items.Item[i].Level<>0 then
    begin
       MeunLong:=MeunLong+3;
       MeunLong:=MeunLong+Length(TreeView1.Items.Item[i].Text);
    end;
    IDs[i]:=i;
    TreeView1.Items.Item[i].Data:=@IDs[i];
  end;

  SetLength(MeunContent,MeunLong);
  P:=0;
  Dev.DisplayMenuList.Clear;
  for i:=0 to TreeView1.Items.Count-1 do
  begin
    if TreeView1.Items.Item[i].Level<>0 then
    begin
       MeunContent[P]:=i;
       inc(p);
       MeunContent[P]:=Pinteger(TreeView1.Items.Item[i].Parent.Data)^;
       Inc(p);
       Len:=Length(TreeView1.Items.Item[i].Text);
       if Len=0 then
       begin
          messagebox(handle,'菜单不能为空!','提示',mb_ok + mb_iconinformation);
          TreeView1.Items.Item[i].Selected:=true;
          TreeView1.ReadOnly:=false;
          TreeView1.Items.Item[i].EditText;
          exit;
       end;
       MeunContent[p]:=Len;
       Inc(p);
       CopyMemory(@MeunContent[p],@(TreeView1.Items.Item[i].Text)[1],Len);
       P:=p+len;

       PMenu:=Dev.AddDisplayMenu(i);
       PMenu^.Name:=TreeView1.Items.Item[i].Text;
       PMenu^.ParentID:=Pinteger(TreeView1.Items.Item[i].Parent.Data)^;
       PMenu^.isLeafNode:=(TreeView1.Items.Item[i].Count=0);
    end;
  end;
 Result:=DataServer.ModifyDevDisplayFixedMenu(Dev.Id,@MeunContent[0],MeunLong);
 Bs.UpdateDevMenu(Dev);
end;


procedure TLCDMenuFrm.EditMenuChange(Sender: TObject);
begin
 if Length(EditMenu.Text)>LCD_MENU_LENGTH then
 begin
   EditMenu.Text:=copy(EditMenu.Text,1,LCD_MENU_LENGTH);
   EditMenu.SelStart:=LCD_MENU_LENGTH;
 end;
end;


procedure TLCDMenuFrm.BitBtnClearClick(Sender: TObject);
begin
  if MessageBox(Handle,'您确定要清除固定菜单列表？','提示',MB_YESNO + MB_ICONQUESTION) = idno then Exit;
  TreeView1.Items.Clear;
  TreeView1.Items.AddFirst(nil,'显示屏菜单');
end;

end.
