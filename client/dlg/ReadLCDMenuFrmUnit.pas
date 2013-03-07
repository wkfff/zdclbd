unit ReadLCDMenuFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, Menus,CarUnit;

type
  TReadLCDMenuFrm = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
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
    Panel5: TPanel;
    Panel1: TPanel;
    PanelReaded: TPanel;
    TreeViewReaded: TTreeView;
    Panel10: TPanel;
    Panel6: TPanel;
    EditCarNO: TEdit;
    Label2: TLabel;
    BitBtnReLodOld: TBitBtn;
    N2: TMenuItem;
    N3: TMenuItem;
    BitBtnClear: TBitBtn;
    c1: TMenuItem;
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
    procedure BitBtnReLodOldClick(Sender: TObject);
    procedure TreeViewReadedClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtnClearClick(Sender: TObject);
  private
    ReadDev,OldDev:TDevice;
    //列出读取的
    procedure RefreshReadedList;
  protected
      IDs:array of integer;
      MeunContent:array of Byte;
      function SendLCDMenu(Dev:TDevice):boolean;
      procedure Menu_List(Dev:TDevice;AParant_ID:integer;Anode:TTreenode;
        Acurrent_cnt:integer;ATreeview:TTreeView);

  public
    //处理读取到的车机固定菜单---一段内存数据
    function ProcessReaded(ABuf:PByte):Boolean;
  end;

var
  ReadLCDMenuFrm: TReadLCDMenuFrm;

implementation
     uses uGloabVar,ConstDefineUnit,CmdStructUnit;
{$R *.dfm}
procedure TReadLCDMenuFrm.BitBtnAddClick(Sender: TObject);
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

procedure TReadLCDMenuFrm.BitBtnInsertClick(Sender: TObject);
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

procedure TReadLCDMenuFrm.BitBtnEditClick(Sender: TObject);
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

procedure TReadLCDMenuFrm.BitBtnDelClick(Sender: TObject);
begin
 if (TreeView1.Selected<>nil)and(TreeView1.Selected.Level<>0) then
    TreeView1.Selected.Delete;
end;



procedure TReadLCDMenuFrm.BitBtnSendClick(Sender: TObject);
begin
  if TreeView1.Items.Count =1 then
  begin
   MessageBox(Self.Handle,PChar('菜单不能为空,请添加固定菜单!'),'提示',mb_ok + mb_iconinformation);
   exit;
  end;
  if   SendLCDMenu(OldDev) then
  begin
    Close;
  end;
end;

procedure TReadLCDMenuFrm.TreeView1Edited(Sender: TObject; Node: TTreeNode;
  var S: String);
begin
 if Length(S)>LCD_MENU_LENGTH then
   S:=Copy(S,1,LCD_MENU_LENGTH);
 TreeView1.ReadOnly:=true;
end;

procedure TReadLCDMenuFrm.FormShow(Sender: TObject);
begin
  editMenu.Text:='';
end;

procedure TReadLCDMenuFrm.BitBtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TReadLCDMenuFrm.Menu_list(Dev:TDevice; AParant_ID:integer;Anode:TTreenode;
  Acurrent_cnt:integer;ATreeview:TTreeView);
var
  i:integer;
  leaf_node: TTreenode;     //子级的节点
begin
  for i:=0 to Dev.DisplayMenuList.Count- 1 do
  begin
    if Dev.DisPlayMenuItems[i].ParentID =AParant_ID then
    begin
      leaf_node:= ATreeview.Items.addchild(Anode,Dev.DisPlayMenuItems[i].name);
      leaf_node.data:= pointer(Dev.DisPlayMenuItems[i].Id);
      Acurrent_cnt:= Acurrent_cnt -1;
      if Acurrent_cnt<=0 then break;

      if Dev.DisPlayMenuItems[i].IsLeafNode = false then
        begin
          Menu_list(Dev,Dev.DisPlayMenuItems[i].Id,leaf_node,Acurrent_cnt,ATreeview);
        end;
    end;
  end;
end;

function TReadLCDMenuFrm.SendLCDMenu(Dev:TDevice):boolean;
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


procedure TReadLCDMenuFrm.EditMenuChange(Sender: TObject);
begin
 if Length(EditMenu.Text)>LCD_MENU_LENGTH then
 begin
   EditMenu.Text:=copy(EditMenu.Text,1,LCD_MENU_LENGTH);
   EditMenu.SelStart:=LCD_MENU_LENGTH;
 end;
end;

procedure TReadLCDMenuFrm.FormCreate(Sender: TObject);
begin
  ReadDev := TDevice.Create;
end;


function TReadLCDMenuFrm.ProcessReaded(ABuf: PByte): Boolean;
var
  pCmd: PCmdSrvTermRetReadDevDisplayFixedMenu;
  buf:array of byte;
  bufLen,bufPos,i: Integer;
  menuId,parentMenuId,menuLen:Byte;
  menuContent:string;
  j: integer;
  pMenu:PDisplayMenu;
begin
  Result := False;
  pCmd := PCmdSrvTermRetReadDevDisplayFixedMenu(ABuf);
  OldDev := ADeviceManage.find(pCmd^.DevId);
  if OldDev = nil then exit;
  EditCarNO.Text := OldDev.Car.No;
  ReadDev.id := OldDev.id;
  ReadDev.ClrDisplayMenuList;
  //列出系统中的原有的
  BitBtnReLodOld.Click;
  //读取到的
  bufLen := pCmd^.Size - SizeOf(TCmdSrvTermRetReadDevDisplayFixedMenu);
  SetLength(buf,bufLen);
  copyMemory(@buf[0],PByte(Integer(pCmd)+SizeOf(TCmdSrvTermRetReadDevDisplayFixedMenu)),buflen);
  bufPos := 0;
  j:= 0;
  while bufPos < bufLen do
  begin
    try
      menuId := buf[bufPos];
      bufPos := bufPos + 1;
      parentMenuId := buf[bufPos];
      bufPos := bufPos + 1;
      menuLen := buf[bufPos];
      bufPos := bufPos + 1;
      SetLength(menuContent,menuLen);
      CopyMemory(@menuContent[1],@buf[bufPos],menuLen);
      bufPos := bufPos + menuLen;

      pMenu := ReadDev.AddDisplayMenu(menuId);
      pMenu^.Name := menuContent;
      pMenu^.ParentID := parentMenuId;
      pMenu^.IsLeafNode := not (parentMenuId =0);
    except
    end;
  end;
  //列出读取到的
  RefreshReadedList;
  Result := True;
end;

procedure TReadLCDMenuFrm.RefreshReadedList;  //列出读取到的
var
  node :TTreeNode;
  i:Integer;
begin
  TreeViewReaded.Items.Clear;
  node:=TreeViewReaded.Items.AddFirst(nil,'车机存储的显示屏菜单');
  if ReadDev<>nil then
  begin
    Menu_List(ReadDev,0,node,ReadDev.DisplayMenuList.Count,TreeViewReaded);
  end;
  for i:=0 to TreeViewReaded.Items.Count -1 do
    TreeViewReaded.Items[i].Expanded := True;
end;

procedure TReadLCDMenuFrm.BitBtnReLodOldClick(Sender: TObject);
var
  node :TTreeNode;
  i:Integer;
begin
  TreeView1.Items.Clear;
  Node:=TreeView1.Items.AddFirst(nil,'显示屏菜单');
  if OldDev<>nil then
  begin
    Menu_List(OldDev,0,Node,OldDev.DisplayMenuList.Count,TreeView1);
  end;
  for i:=0 to TreeView1.Items.Count -1 do
    TreeView1.Items[i].Expanded := True;
end;

procedure TReadLCDMenuFrm.TreeViewReadedClick(Sender: TObject);
begin
  if TreeViewReaded.Selected = nil then Exit;
  if TreeViewReaded.Selected.Text ='车机存储的显示屏菜单' then Exit;
  EditMenu.Text := TreeViewReaded.Selected.Text;
end;

procedure TReadLCDMenuFrm.BitBtnClearClick(Sender: TObject);
begin
  if MessageBox(Handle,'您确定要清除固定菜单列表？','提示',MB_YESNO + MB_ICONQUESTION) = idno then Exit;
  TreeView1.Items.Clear;
  TreeView1.Items.AddFirst(nil,'显示屏菜单');
end;

end.
