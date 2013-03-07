{*****************************************************************************}
{                                                                             }
{用户信息操作窗口                                                             }
{                                                                             }
{对系统内可操作的用户信息的添加、删除、修改等信息                             }
{                                                                             }
{作者: liusen                                                                   }
{                                                                             }
{时间: 2010-01-11                                                                 }
{                                                                             }
{*****************************************************************************}
unit frmUsers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, RzPanel, StdCtrls, RzLabel, Mask, RzEdit,
  ImgList, BusinessUnit, SysUsers, RzRadGrp, RzCmboBx, RzButton, RzListVw,
  RzTreeVw, Types, DBClient, DB, SysDev;

type
  TmpUser = packed record
    UserID: Integer;
    UserName: string;
    UserPwd: string;
    UserRole: string;
    RoleID: Integer;
    UserStat: Integer;
    UserMemo: string;
  end;

  TFrm_Users = class(TForm)
    ImageList1: TImageList;
    RzPanel1: TRzPanel;
    RzPanel3: TRzPanel;
    btnSave: TRzBitBtn;
    btnClose: TRzBitBtn;
    RzPanel2: TRzPanel;
    RzLabel5: TRzLabel;
    mUsers: TRzMemo;
    RzPanel4: TRzPanel;
    RzLabel1: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    edtUserName: TRzEdit;
    cmbRole: TRzComboBox;
    rgState: TRzRadioGroup;
    lvUsers: TRzListView;
    RzPanel5: TRzPanel;
    tvDevGroup: TRzCheckTree;
    RzLabel6: TRzLabel;
    btnNew: TRzBitBtn;
    rzbtEdit: TRzBitBtn;
    lbl2: TLabel;
    spl1: TSplitter;
    spl2: TSplitter;
    RzLabel2: TRzLabel;
    edtPwd: TRzEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnCancel: TRzBitBtn;
    btnDel: TRzBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure lvUsersClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure lvUsersColumnClick(Sender: TObject; Column: TListColumn);
    procedure rzbtEditClick(Sender: TObject);
    procedure tvDevGroupStateChanging(Sender: TObject; Node: TTreeNode;
      NewState: TRzCheckState; var AllowChange: Boolean);
    procedure btnCancelClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
  private
    { Private declarations }
    cUser: TmpUser;
    TmpGroupData: TIntegerDynArray;
    UserGroupID: WideString;
    TmpSuperRole:TClientDataSet;
    fEdit:Boolean;
    procedure LoadRoleName;
    procedure InitForm;
    procedure InitLvUsers;
    procedure ClearAll;
    procedure InitDevGroup;
    procedure AddLineNode;
    procedure AddNode(ParentID: Integer; Node: TTreeNode);
    function IsExistUsers(UserName: string): Boolean; overload;
    function IsExistUsers(UserName: string; UserID: Integer): Boolean; overload;
    procedure AddRow(aUser: TmpUser);
    procedure DisplayRecord(SelIndex: Integer);
    procedure LoadUserGroupData(UserID: Integer);
    procedure SetUserGroup(UserID: Integer);
    procedure SaveUserGroup(UserID: Integer);
    function IsSuperRole(RoleID:integer):Boolean;
    function CheckNodeIsCanSaveGroup(Node:TTreeNode):Boolean;
    procedure EnableEdit(enable:Boolean);
    procedure ButtonControl;
  public
    { Public declarations }
  end;

var
  Frm_Users: TFrm_Users;

implementation
uses Pub, frmWaitInfo;
{$R *.dfm}

procedure TFrm_Users.ButtonControl;
begin
  btnNew.Enabled := not btnNew.Enabled;
  rzbtEdit.Enabled := not rzbtEdit.Enabled;
  btnCancel.Enabled := not btnCancel.Enabled;
  btnSave.Enabled := not btnSave.Enabled;
  btnDel.Enabled := not btnSave.Enabled;
end;  

function TFrm_Users.IsSuperRole(RoleID:integer):Boolean;
begin
  Result := False;
  TmpSuperRole.First;
  while (not TmpSuperRole.Eof) do
  begin
    if (RoleID=TmpSuperRole.FieldByName('Role_ID').AsInteger) then
    begin
      Result := True;
      break;
    end;
    TmpSuperRole.Next;
  end;
end;

procedure TFrm_Users.LoadRoleName;
var
  i: Integer;
begin
  cmbRole.Items.Clear;
  for i := 0 to RoleManage.Count - 1 do
  begin
    cmbRole.Items.AddObject(RoleManage.Items[i].RoleName, RoleManage.Items[i]);
  end;
end;

procedure TFrm_Users.InitLvUsers;
var
  i: Integer;
  ItemValue: TListItem;
begin
  lvUsers.Items.Clear;
  for i := 0 to UsersManage.Count - 1 do
  begin
      ItemValue := lvUsers.Items.Add;
      ItemValue.Caption := IntToStr(UsersManage.Items[i].UserID);
      ItemValue.SubItems.Add(UsersManage.Items[i].UserName);
      ItemValue.SubItems.Add(UsersManage.Items[i].UserPwd);
      if (RoleManage.Find(UsersManage.Items[i].RoleID) = nil) then
        ItemValue.SubItems.Add('')
      else
        ItemValue.SubItems.Add(RoleManage.Find(UsersManage.Items[i].RoleID).RoleName);
      if (UsersManage.Items[i].UserStat = 0) then
        ItemValue.SubItems.Add('可用')
      else
        ItemValue.SubItems.Add('禁用');
      ItemValue.SubItems.Add(UsersManage.Items[i].Memo);
  end;
end;

procedure TFrm_Users.ClearAll;
var
  i: Integer;
begin
  for i := 0 to tvDevGroup.Items.Count - 1 do
    tvDevGroup.ItemState[i] := csUnChecked;

  edtUserName.Hint := '';
  edtUserName.Text := '';
  edtPwd.Text := '';
  cmbRole.ItemIndex := -1;
  rgState.ItemIndex := 0;
  mUsers.Text :='';
  //edtUserName.SetFocus;
end;

procedure TFrm_Users.AddLineNode;
var
  i, j: Integer;
  ANode: TTreeNode;
  DevGroup:TDevGroup;
begin
  for i := 0 to BusLineManage.Count - 1 do
  begin
    for j := 1 to tvDevGroup.Items.Count - 1 do
    begin
      if (Assigned(tvDevGroup.Items[j].Data)) then
      begin
        DevGroup := TDevGroup(tvDevGroup.Items[j].Data);

        if (BusLineManage.Items[i].GroupID = DevGroup.GroupID)
          and (tvDevGroup.Items[j].ImageIndex=1) and
          (InCanUserBusLine(BusLineManage.Items[i].BusLineID)) then
        begin
          ANode := tvDevGroup.Items.AddChild(tvDevGroup.Items[j], BusLineManage.Items[i].BusLineName);
          ANode.StateIndex := BusLineManage.Items[i].BusLineID;
          ANode.ImageIndex := 0;   //线路
          ANode.SelectedIndex := 0;
          break;
        end;
      end;
    end;
  end;
end;

procedure TFrm_Users.AddNode(ParentID: Integer; Node: TTreeNode);
var
  i: Integer;
  ANode: TTreeNode;
begin
  for i := 0 to DevGroupManage.Count - 1 do
  begin      
    if ((ParentID = DevGroupManage.Items[i].GroupParent) ) then
    begin
      ANode := tvDevGroup.Items.AddChild(Node, DevGroupManage.Items[i].GroupName);
      ANode.OverlayIndex := DevGroupManage.Items[i].GroupID;
      ANode.Data := DevGroupManage.Items[i];
      if DevGroupManage.Items[i].GroupParent = 0 then
        ANode.ImageIndex := 1
      else
        ANode.ImageIndex := 0;
      ANode.SelectedIndex := ANode.ImageIndex;
      if (DevGroupManage.Items[i].LeafNod = 0) then
        AddNode(DevGroupManage.Items[i].GroupID, ANode);
    end;
  end;
  //tvDevGroup.FullExpand;
end;

procedure TFrm_Users.InitDevGroup;
var
  PNode: TTreeNode;
begin
  PNode := tvDevGroup.Items.Add(nil, '车辆分组');
  PNode.ImageIndex := 1;
  PNode.SelectedIndex := PNode.ImageIndex;
  PNode.OverlayIndex := 0;
  AddNode(0, PNode);
end;

function TFrm_Users.IsExistUsers(UserName: string): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to lvUsers.Items.Count - 1 do
  begin
    if (UserName = lvUsers.Items[i].SubItems.Strings[0]) then
    begin
      Result := True;
      break;
    end;
  end;
end;

function TFrm_Users.IsExistUsers(UserName: string; UserID: Integer): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to lvUsers.Items.Count - 1 do
  begin
    if (UserName = lvUsers.Items[i].SubItems.Strings[0]) and (UserID <> StrToInt(lvUsers.Items[i].Caption)) then
    begin
      Result := True;
      break;
    end;
  end;
end;

procedure TFrm_Users.AddRow(aUser: TmpUser);
var
  i: Integer;
  ExistsFlag: Boolean;
  ItemValue: TListItem;
begin
  ExistsFlag := False;
  for i := 0 to lvUsers.Items.Count - 1 do
  begin
    if (IntToStr(aUser.UserID) = lvUsers.Items[i].Caption) then
    begin
      ExistsFlag := True;
      break;
    end;
  end;

  if (ExistsFlag) then
  begin
    lvUsers.Items[i].SubItems.Strings[0] := aUser.UserName;
    lvUsers.Items[i].SubItems.Strings[1] := aUser.UserPwd;
    lvUsers.Items[i].SubItems.Strings[2] := aUser.UserRole;
    if (aUser.UserStat = 0) then
      lvUsers.Items[i].SubItems.Strings[3] := '可用'
    else
      lvUsers.Items[i].SubItems.Strings[3] := '禁用';
    lvUsers.Items[i].SubItems.Strings[4] := aUser.UserMemo;
    lvUsers.Items[i].Selected := True;
    lvUsers.Items[i].MakeVisible(True);
  end
  else
  begin
    ItemValue := lvUsers.Items.Add;
    ItemValue.Caption := IntToStr(aUser.UserID);
    ItemValue.SubItems.Add(aUser.UserName);
    ItemValue.SubItems.Add(aUser.UserPwd);
    ItemValue.SubItems.Add(aUser.UserRole);
    if (aUser.UserStat = 0) then
      ItemValue.SubItems.Add('可用')
    else
      ItemValue.SubItems.Add('禁用');
    ItemValue.SubItems.Add(aUser.UserMemo);
    ItemValue.Selected := True;
    ItemValue.MakeVisible(True);
  end;
end;

procedure TFrm_Users.DisplayRecord(SelIndex: Integer);
begin
  edtUserName.Hint := Trim(lvUsers.Items[SelIndex].Caption);
  edtUserName.Text := Trim(lvUsers.Items[SelIndex].SubItems.Strings[0]);
  edtPwd.Text := Trim(lvUsers.Items[SelIndex].SubItems.Strings[1]);
  cmbRole.Text := Trim(lvUsers.Items[SelIndex].SubItems.Strings[2]);
  if (lvUsers.Items[SelIndex].SubItems.Strings[3] = '可用') then
    rgState.ItemIndex := 0
  else
    rgState.ItemIndex := 1;
  mUsers.Text := Trim(lvUsers.Items[SelIndex].SubItems.Strings[4]);
end;

procedure TFrm_Users.LoadUserGroupData(UserID: Integer);
var
  i, j: Integer;
begin
  for i := 0 to tvDevGroup.Items.Count - 1 do
    tvDevGroup.ItemState[i] := csUnChecked;

  //因为是系统管理员时，TmpGroupData返回为nil，所以加上此句
  if UsersManage.Find(UserID).RoleID = 2 then
  begin
    for i := 0 to tvDevGroup.Items.Count - 1 do
      tvDevGroup.ItemState[i] := csChecked;
    Exit;  
  end;

  FBusiness.QueryUser_GroupList(UserID, TmpGroupData);
  if  (TmpGroupData[0] = -1) then Exit;

  for i := Low(TmpGroupData) to High(TmpGroupData) do
  begin
    for j := 1 to tvDevGroup.Items.Count - 1 do     // and (tvDevGroup.Items[j].ImageIndex=0)
    if (tvDevGroup.Items[j].OverlayIndex = TmpGroupData[i])  then
    begin
      if (tvDevGroup.Items[j].HasChildren) then
        tvDevGroup.ItemState[j] := csPartiallyChecked
      else
        tvDevGroup.ItemState[j] := csChecked;
      break;
    end;
  end;
end;

function TFrm_Users.CheckNodeIsCanSaveGroup(Node:TTreeNode):Boolean;
var
  i:Integer;
begin
  Result := False;
  if (Node.ImageIndex=1) and (Node.HasChildren) then
  begin
    for i := 0 to Node.Count - 1 do
    begin
      if (Node.Item[i].ImageIndex = 0) then
      begin
        Result := True;
        break;
      end;
    end;
  end;
end;

procedure TFrm_Users.SetUserGroup(UserID: Integer);
  function NoSelData: Boolean;
  var
    i: Integer;
  begin
    Result := True;
    if (tvDevGroup.Items[0].HasChildren) then
    begin
      for i := 0 to tvDevGroup.Items.Count - 1 do
      begin
        if (tvDevGroup.ItemState[i] = csChecked) or (tvDevGroup.ItemState[i] = csPartiallyChecked) then
        begin
          Result := False;
          break;
        end;
      end;
    end;
  end;
var
  i, j, k: Integer;
begin
  if (not NoSelData) then
  begin
    j := 0;
    k := 0;
    for i := 1 to tvDevGroup.Items.Count - 1 do
    begin
      if (not (tvDevGroup.ItemState[i] = csUnchecked)) then
      begin
      //  if (CheckNodeIsCanSaveGroup(tvDevGroup.Items[i])) then
          Inc(k);
      end;
    end;
   // SetLength(UserGroupID,j);

    j := 0;
    UserGroupID := '';
    for i := 1 to tvDevGroup.Items.Count - 1 do
    begin
      if (not (tvDevGroup.ItemState[i] = csUnchecked)) then
      begin
        //if (tvDevGroup.Items[i].ImageIndex=1) then
          Inc(j);
          if (Assigned(tvDevGroup.Items[i].Data)) then
          begin
            if j <> k then
              UserGroupID := UserGroupID + IntToStr(TDevGroup(tvDevGroup.Items[i].Data).GroupID) + ','
            else
             UserGroupID := UserGroupID + IntToStr(TDevGroup(tvDevGroup.Items[i].Data).GroupID);
          end;
      end;
    end;
  end
  else
  begin
    UserGroupID := '';
    //UserGroupID[0] := -1;
  end;

  Application.ProcessMessages;
  Frm_WaitInfo.lbInfo.Caption := '正在保存用户分组信息...';
  FBusiness.ModifyUserGroupList(UserID, UserGroupID);
 // FBusiness.ModifyUserBusLineList(UserID,UserBusLineID);
end;

procedure TFrm_Users.SaveUserGroup(UserID: Integer);
begin
  if (UsersManage.Find(UserID).UserStat = 0) then
    SetUserGroup(UserID)
  else
    Exit;

end;

procedure TFrm_Users.InitForm;
begin
  LvSort := False;

  //TmpSuperRole := TClientDataSet.Create(nil);

  Application.ProcessMessages;
  //Frm_WaitInfo.lbInfo.Caption := '正在加载用户信息...';
  FBusiness.QueryUserList;

  Application.ProcessMessages;
  //Frm_WaitInfo.lbInfo.Caption := '正在加载用户角色信息...';
  FBusiness.QueryRoleList;
  //TmpSuperRole.Data := FBusiness.QuerySuperRole;
  InitLvUsers;
  LoadRoleName;

  Application.ProcessMessages;
  //Frm_WaitInfo.lbInfo.Caption := '正在加载分组信息...';
  FBusiness.QueryDevGroupList;
  InitDevGroup;

  tvDevGroup.FullExpand;
end;

procedure TFrm_Users.FormShow(Sender: TObject);
begin
  try

    //FormWaitInfoShow;
    InitForm;
    EnableEdit(false);
  finally
    //Frm_WaitInfo.Free;
    //FormWaitInfoHide;
  end;
end;

procedure TFrm_Users.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TmpSuperRole.Free;
  Action := caFree;
end;

procedure TFrm_Users.btnSaveClick(Sender: TObject);
var
  aUser: TUsers;
  Success: string;
begin
  if (Trim(edtUserName.Text) = '') then
  begin
    Application.MessageBox('请输入用户名！', '提示', MB_OK + MB_ICONINFORMATION);
    if edtUserName.Enabled  then edtUserName.SetFocus;
    Exit;
  end;

  if (Trim(edtPwd.Text) = '') then
  begin
    Application.MessageBox('请输入用户密码！', '提示', MB_OK + MB_ICONINFORMATION);
    if edtPwd.Enabled then edtPwd.SetFocus;
    Exit;
  end;

  if (Trim(cmbRole.Text) = '') or (cmbRole.ItemIndex = -1) then
  begin
    Application.MessageBox('请选择用户角色或你输入的用户角色不存在列表中！', '提示', MB_OK + MB_ICONINFORMATION);
    if cmbRole.Enabled then cmbRole.SetFocus;
    Exit;
  end;

  cUser.UserName := Trim(edtUserName.Text);
  cUser.UserPwd := Trim(edtPwd.Text);
  cUser.UserRole := Trim(cmbRole.Text);
  cUser.RoleID := TRole(cmbRole.Items.Objects[cmbRole.ItemIndex]).RoleID;
  cUser.UserStat := rgState.ItemIndex;
  cUser.UserMemo := Trim(mUsers.Text);

  try
    {Frm_WaitInfo := TFrm_WaitInfo.Create(nil);
    Frm_WaitInfo.Show;
    LoadAvi;
    Frm_WaitInfo.Update;}
    FormWaitInfoShow;
    
    Application.ProcessMessages;
    Frm_WaitInfo.lbInfo.Caption := '正在保存用户信息！';

    if (Trim(edtUserName.Hint) = '') then //新添加
    begin
      if (IsExistUsers(cUser.UserName)) then
      begin
        Application.MessageBox(PChar(cUser.UserName + '此用户信息已存在！'), '提示', MB_OK + MB_ICONINFORMATION);
        edtUserName.SetFocus;
        Exit;
      end;

      cUser.UserID := FBusiness.AddUser(cUser.UserName, cUser.UserPwd, cUser.RoleID,
         cUser.UserMemo, Success);
      if (Success = 'OK') then
      begin
        aUser := UsersManage.Add(cUser.UserID);
        aUser.Username := cUser.UserName;
        aUser.UserPwd := cUser.UserPwd;
        aUser.RoleID := cUser.RoleID;
        aUser.UserStat := cUser.UserStat;
        aUser.Memo := cUser.UserMemo;
        SaveUserGroup(aUser.UserID);
      end;
    end
    else
    begin //修改
      cUser.UserID := StrToInt(edtUserName.Hint);
      if (IsExistUsers(cUser.UserName, cUser.UserID)) then
      begin
        Application.MessageBox(PChar(cUser.UserName + '此用户信息已存在！'), '提示', MB_OK + MB_ICONINFORMATION);
        edtUserName.SetFocus;
        Exit;
      end;

      aUser := UsersManage.Find(cUser.UserID);
      aUser.Username := cUser.UserName;
      aUser.UserPwd := cUser.UserPwd;
      aUser.RoleID := cUser.RoleID;
      aUser.UserStat := cUser.UserStat;
      aUser.Memo := cUser.UserMemo;

      FBusiness.ModifyUser(cUser.UserID, cUser.Username, aUser.UserPwd, cUser.RoleID,
        cUser.UserMemo, cUser.UserStat, Success);
      if (Success = 'OK') then
        SaveUserGroup(cUser.UserID);
    end;
  finally
    //Frm_WaitInfo.Free;
    FormWaitInfoHide;
  end;

  if (Success = 'OK') then
    AddRow(cUser);
 
  lvUsersClick(self);
  ClearAll;
  EnableEdit(false);
  ButtonControl;
  
end;

procedure TFrm_Users.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFrm_Users.lvUsersClick(Sender: TObject);
begin
  if (lvUsers.Items.Count = 0) or (lvUsers.SelCount <= 0) then
    Exit;

  fEdit := True;
  DisplayRecord(lvUsers.Selected.Index);
  LoadUserGroupData(StrToInt(lvUsers.Selected.Caption));
  EnableEdit(false);
end;

procedure TFrm_Users.btnNewClick(Sender: TObject);
begin
  EnableEdit(true);
  ClearAll;
  ButtonControl;
end;

procedure TFrm_Users.lvUsersColumnClick(Sender: TObject;
  Column: TListColumn);
begin
  lvUsers.CustomSort(@CustormSortProc, Column.Index);
  LvSort := not LvSort;
end;

procedure TFrm_Users.EnableEdit(enable:Boolean);
begin
  edtUserName.Enabled := enable;
  cmbRole.Enabled := enable;
  edtPwd.Enabled := enable;
  mUsers.Enabled := enable;
  rgState.Enabled := enable;
  fEdit := enable;
end;

procedure TFrm_Users.rzbtEditClick(Sender: TObject);
begin
  if edtUserName.Text = '' then
  begin
    Application.MessageBox('请选择需要编辑的用户信息！','提示');
    exit;
  end;

  EnableEdit(true);
  ButtonControl;
end;

procedure TFrm_Users.tvDevGroupStateChanging(Sender: TObject;
  Node: TTreeNode; NewState: TRzCheckState; var AllowChange: Boolean);
begin
   if fEdit then
    AllowChange := true
  else
    AllowChange := False;
end;

procedure TFrm_Users.btnCancelClick(Sender: TObject);
begin
  EnableEdit(False);
  ButtonControl;
end;

procedure TFrm_Users.btnDelClick(Sender: TObject);
var
  Success: string;
begin

  if(lvUsers.Items.Count = 0 ) or (lvUsers.SelCount <= 0) or (edtUserName.Text = '') then
  begin
    Application.MessageBox('请选择要删除的用户信息！', '提示');
    Exit; 
  end;

  if (Application.MessageBox('是否删除当前用户信息！', '提示', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION) = IDYES) then
  begin
    try
      FormWaitInfoShow;

      Application.ProcessMessages;
      Frm_WaitInfo.lbInfo.Caption := '正在删除用户信息！';

      FBusiness.DelUser(StrToInt(edtUserName.hint), Success);
    finally
      FormWaitInfoHide;
    end;

    if (Success = 'OK') then
    begin
      UsersManage.Delete(StrToInt(edtUserName.Hint));
      lvUsers.Selected.Delete;
    end;
    ClearAll;
  end;

end;

end.
