unit uFrmSelectDevs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Grids, StdCtrls, Buttons, ActnList,
  cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit, cxInplaceContainer,
  cxControls,carUnit, Menus;

type
  TFrmSelectDevs = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    TreeView1: TTreeView;
    Splitter1: TSplitter;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    BitBtn_ok: TBitBtn;
    BitBtn_Cancel: TBitBtn;
    BitBtn_AddSelect: TBitBtn;
    BitBtn_AddAllList: TBitBtn;
    Panel7: TPanel;
    ActionList1: TActionList;
    AddSelect: TAction;
    AddAll: TAction;
    DeleteSelect: TAction;
    DeleteAll: TAction;
    ListAllDev: TAction;
    PopupMenu_Dest: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    DestList: TcxTreeList;
    DestID: TcxTreeListColumn;
    DestCarNO: TcxTreeListColumn;
    Splitter2: TSplitter;
    FromList: TcxTreeList;
    cxTreeListColumn1: TcxTreeListColumn;
    cxTreeListColumn2: TcxTreeListColumn;
    PopupMenu_From: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure ListAllDevExecute(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure FromListClick(Sender: TObject);
    procedure DestListClick(Sender: TObject);
    procedure FromListFocusedNodeChanged(Sender: TObject; APrevFocusedNode,
      AFocusedNode: TcxTreeListNode);
    procedure DestListFocusedNodeChanged(Sender: TObject; APrevFocusedNode,
      AFocusedNode: TcxTreeListNode);
    procedure AddSelectExecute(Sender: TObject);
    procedure AddAllExecute(Sender: TObject);
    procedure BitBtn_okClick(Sender: TObject);
    procedure DeleteSelectExecute(Sender: TObject);
    procedure DeleteAllExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn_CancelClick(Sender: TObject);
  private
    grpId:integer;
    IsStop: Boolean;
    { Private declarations }
    procedure Add2DevList(Alist:TcxTreeList;const ADev: Tdevice);
    procedure Add2DevListToFrom(Alist:TcxTreeList;const ADev: Tdevice);
    procedure FillData(ADev: TDevice; ANode: TcxTreeListNode);
    {选择车辆放到 右边的DestList中}
    procedure InsertDev2DestList(Adev: TDevice);
    function  isInDestList(Dev:TDevice):Boolean;
  public
    { Public declarations }
    FSelectDevGrpID : integer;
    FFromSelectDev,FDestSelectDev : TDevice;
    FFromSelectNode,FDestSelectNode:TcxTreeListNode;
  end;

var
  FrmSelectDevs: TFrmSelectDevs;

implementation
 uses uGloabVar,ConfineAreaUnit,DateUtils,uMainf;
{$R *.dfm}

procedure TFrmSelectDevs.FormCreate(Sender: TObject);
begin
  ListAllDev.Execute;
//  FromList.Images := ResManage.BmpList;
//  DestList.Images := ResManage.BmpList;
  TreeView1Click(TreeView1);
end;

procedure TFrmSelectDevs.ListAllDevExecute(Sender: TObject);
    //子组的组ID号， 节点，当前还余下数
    function ListSon(ASonId:integer;Anode:TTreeNode;leastCnt:integer):integer;
    var
      grp       : TDevGroup;
      leaf_node : TTreeNode;
      j,sonId   : integer;
    begin
      grp:= ADevGroupManage.Find(AsonId);
      leaf_node :=  treeview1.Items.AddChild(
          Anode,grp.name+'('+inttostr(grp.DevListCount)+')');
      leaf_node.Data := pointer(grp.Id);
      leastCnt := leastCnt -1;
      result:=leastCnt;
      if leastCnt =0 then exit;

      if not grp.leaf_nod then
        for j:= 0 to grp.SonListCount -1 do
        begin
          sonId := grp.SonList[j];
          ListSon(sonId,leaf_node,leastCnt);
        end;       
    end;
      //group_list
      //列出所有子组－－－－入参：父组ID，父组节点，当前还余下数
      procedure group_list(AParant_ID:integer;Anode:TTreenode;Acurrent_cnt:integer);
      var
        i,j:integer;
        sonId: integer;           //子级的 组ID
        leaf_node: TTreenode;     //子级的节点
        grp : TDevGroup;
      begin
        for i:= 0 to ADevGroupManage.Count -1 do
        begin
          if Acurrent_cnt =0 then exit;
          
          grp :=ADevGroupManage.Items[i];
          //列出大组--父为0
          if grp.parent =AParant_ID then
          begin
            leaf_node :=  treeview1.Items.AddChild(
              Anode,grp.name+'('+inttostr(grp.DevListCount)+')');
            leaf_node.Data := pointer(grp.Id);
            Acurrent_cnt := Acurrent_cnt -1;
            if Acurrent_cnt =0 then exit;
          
            if not grp.leaf_nod then
              for j:= 0 to grp.SonListCount -1 do
              begin
                sonId := grp.SonList[j];
                Acurrent_cnt := ListSon(sonId,leaf_node,Acurrent_cnt);
              end;
          end;
        end;
      end;
     //----------
var
  vn_node: TTreenode;
  cnt: integer;
begin
  //TreeView1.AutoExpand:= true;
  treeview1.Items.Clear;
  if ADeviceManage.Count=0 then
  begin
    FFromSelectDev := nil;
    FDestSelectDev := nil;
    exit;
  end;
  vn_node:= treeview1.Items.add(treeview1.topitem,'所有车辆');
  vn_node.Data:= pointer(-1);//所有车辆
  vn_node.Selected:=true;
  cnt:= ADevGroupManage.Count;
  group_list(0,vn_node,cnt);
  vn_node.Expanded:=true;
 // TreeView1.AutoExpand:= true;
end;

procedure TFrmSelectDevs.TreeView1Click(Sender: TObject);
var
  tmpGrpId : integer;
  i,j:integer;
  dev: Tdevice;
  devId : string;
  devGrp,tmpDevGrp : TDevGroup;
begin
  grpId := Integer(TreeView1.Selected.Data);
  //if grpId = FSelectDevGrpID then exit; //选择没变化,直接退出
  if grpId = -1 then
  begin
    FromList.BeginUpdate;
    FromList.Clear;
    for i:=0 to ADeviceManage.Count-1 do
    begin
      dev := ADeviceManage.Items[i];
      Add2DevListToFrom(FromList,dev);
    end;
    FromList.EndUpdate;
    FSelectDevGrpID := grpId;
    FFromSelectDev := nil;
    exit;
  end;
  if grpId >=0 then  //某分组车辆
  begin
    //列出某组车辆
    FromList.BeginUpdate;
    FromList.Clear;
    devGrp:= ADevGroupManage.find(grpId);

    for j:= 0 to devGrp.DevListCount-1 do
    begin
      devId:= devGrp.DevList[j];
      dev := ADeviceManage.find(devId);
      Add2DevListToFrom(FromList,dev);
    end;
    FromList.EndUpdate;
  end;
  if FromList.FocusedNode<> nil then
    FromList.FocusedNode := nil;   //

  FSelectDevGrpID := grpId;
  FFromSelectDev := nil;
end;

procedure TFrmSelectDevs.Add2DevList(Alist:TcxTreeList; const ADev: Tdevice);
var
  node : TcxTreeListNode;
begin
    node := AList.Add;
    node.Data := Adev;
    FillData(Adev,node);
    GrpID:=ADev.GroupID;
end;

procedure TFrmSelectDevs.Add2DevListToFrom(Alist:TcxTreeList; const ADev: Tdevice);
begin
  try
    if ADev=nil then exit;
    if not ADev.IsSelected then
      Add2DevList(Alist,ADev)
  finally
  end;
end;



procedure TFrmSelectDevs.FillData(ADev: TDevice; ANode: TcxTreeListNode);
begin
  with ADev,ANode do
  begin
    Data := ADev;
    Values[0]:= ADev.DispLabel; //ADev.IdStr; //dxf 根据顺安达改成显示设备名称
    Values[1]:= ADev.Car.No;
    ImageIndex:= ADev.Car.ResIndex ;
    if ADev.isOnline  then
    begin
      if ADev.Switch[STAT_GPS_LOCATE] then
        StateIndex:=3
      else
        StateIndex:=6;
    end
    else    //如不在线,就显示非定位..
    begin
      StateIndex:=4;
    end;
    SelectedIndex := ADev.Car.ResIndex ;
  end;    
end;

procedure TFrmSelectDevs.FromListClick(Sender: TObject);
begin
  if FromList.FocusedNode = nil  then exit;
  FFromSelectDev :=TDevice(FromList.FocusedNode.Data);
  FFromSelectNode:=FromList.FocusedNode;
end;    

procedure TFrmSelectDevs.FromListFocusedNodeChanged(Sender: TObject;
  APrevFocusedNode, AFocusedNode: TcxTreeListNode);
begin
  //if FromList.FocusedNode = nil  then exit;
 // FFromSelectDev :=TDevice(FromList.FocusedNode.Data);
end;

procedure TFrmSelectDevs.DestListClick(Sender: TObject);
begin
  if DestList.FocusedNode = nil  then exit;
  FDestSelectDev :=TDevice(DestList.FocusedNode.Data);
  FDestSelectNode:=DestList.FocusedNode;
end;

procedure TFrmSelectDevs.DestListFocusedNodeChanged(Sender: TObject;
  APrevFocusedNode, AFocusedNode: TcxTreeListNode);
begin
//  if DestList.FocusedNode = nil  then exit;
//  FDestSelectDev :=TDevice(DestList.FocusedNode.Data);
end;

procedure TFrmSelectDevs.AddSelectExecute(Sender: TObject);
begin
  if FFromSelectDev = nil then
  begin
    if FromList.Count <>0 then
    begin
      FromList.Items[0].Focused:=true;
      FFromSelectDev :=TDevice(FromList.Items[0].Data);
      FFromSelectNode:=FromList.FocusedNode;
    end
    else
      exit;
  end;

  InsertDev2DestList(FFromSelectDev);
  if FFromSelectNode<>nil then
     FFromSelectNode.Delete;

  if FromList.Count <>0 then
  begin
   if FromList.FocusedNode<>nil then
   begin
    FFromSelectDev :=TDevice(FromList.FocusedNode.Data);
    FFromSelectNode:=FromList.FocusedNode;
   end
   else
     FFromSelectDev := nil;
  end
  else
     FFromSelectDev := nil;
end;

procedure TFrmSelectDevs.AddAllExecute(Sender: TObject);
{var
  i: integer;
  dev : Tdevice;}
begin
  while FromList.Count<>0 do
//  for i:=0 to  FromList.Count -1 do
  begin
   { dev := Tdevice(Fromlist.Items[i].Data);
    InsertDev2DestList(dev); }
    Application.ProcessMessages;
    if IsStop then Break;
    AddSelectExecute(Sender);
  end;
//  FromList.Clear;
end;

procedure TFrmSelectDevs.InsertDev2DestList(Adev: TDevice);
var
  find_ListItem : TcxTreeListNode;
begin
  //find_ListItem:=DestList.FindNodeByText(inttostr(Adev.Id),DestList.Columns[0],nil,false,true);
  find_ListItem := FindNodeByTextIncxTreeList(Adev.Idstr,DestList,0);
  if find_ListItem = nil then
    Add2DevList(DestList,Adev)
  else
    FillData(Adev,find_ListItem);
  ADev.IsSelected := True;
end;

procedure TFrmSelectDevs.BitBtn_okClick(Sender: TObject);
begin
  if DestList.Count= 0 then
  begin
    messagebox(handle,pchar('请选择车辆!'),'提示',mb_ok + mb_iconinformation);
    exit;
  end;
  ModalResult := mrOk;
end;

procedure TFrmSelectDevs.DeleteSelectExecute(Sender: TObject);
begin
  if FDestSelectDev= nil then
  begin
    if DestList.Count <>0 then
    begin
      DestList.Items[0].Focused:=true;
      FDestSelectDev:= TDevice(DestList.Items[0].Data);
      FDestSelectNode:=DestList.FocusedNode;
    end
    else
      exit;
  end;
  DestList.DeleteSelection;
  FDestSelectDev.IsSelected := False;
  TreeView1Click(TreeView1);
  if DestList.Count <>0 then  //设置FDestSelectDev
  begin
    if DestList.FocusedNode <> nil then
      FDestSelectDev:= TDevice(DestList.FocusedNode.Data);
  end
  else
    FDestSelectDev := nil;
end;

procedure TFrmSelectDevs.DeleteAllExecute(Sender: TObject);
var
  dev:TDevice;
  i: integer;
begin
  for i:=0 to DestList.Count -1 do
  begin
    dev:=TDevice(DestList.Items[i].Data);
    dev.IsSelected := False;
  end;
  DestList.Clear;
  TreeView1Click(TreeView1);
//  FDestSelectDev := nil;
end;

function  TFrmSelectDevs.isInDestList(Dev:TDevice):Boolean;
var
 i:integer;
begin
  Result:=false;
  for i:=0 to  DestList.Count-1 do
  begin
    if TDevice(DestList.Items[i].Data).Id =Dev.Id  then
    begin
      Result:=true;
      exit;
    end;
  end;
end;
procedure TFrmSelectDevs.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  i: integer;
  dev:TDevice;
begin
  for i:=0 to DestList.Count-1 do
  begin
    dev:= TDevice(DestList.Items[i].Data);
    if dev<> nil then dev.IsSelected := False;
  end;
end;

procedure TFrmSelectDevs.BitBtn_CancelClick(Sender: TObject);
begin
  IsStop := True;
end;

end.
