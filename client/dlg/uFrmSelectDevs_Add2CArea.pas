unit uFrmSelectDevs_Add2CArea;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Grids, StdCtrls, Buttons, ActnList,
  cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit, cxInplaceContainer,
  cxControls,carUnit, Menus;

type
  TFrmSelectDevs_Add2CArea = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    TreeView1: TTreeView;
    Splitter1: TSplitter;
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
    Label_CurArea: TLabel;
    DestList: TcxTreeList;
    DestID: TcxTreeListColumn;
    DestCarNO: TcxTreeListColumn;
    Splitter2: TSplitter;
    PopupMenu_From: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Panel8: TPanel;
    FromList: TcxTreeList;
    cxTreeListColumn1: TcxTreeListColumn;
    cxTreeListColumn2: TcxTreeListColumn;
    cxHasCADevList: TcxTreeList;
    HasCADev_Id: TcxTreeListColumn;
    HasCADev_No: TcxTreeListColumn;
    Panel4: TPanel;
    Splitter3: TSplitter;
    ComboBox_AreaType: TComboBox;
    Label_CurAreaType: TLabel;
    HasCADev_CAId: TcxTreeListColumn;
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
    procedure ComboBox_AreaTypeChange(Sender: TObject);
  private
    { Private declarations }
    //IsHasCA:是否已指定区域
    procedure Add2DevList(Alist:TcxTreeList;const ADev: Tdevice;IsHasCA:boolean);
    procedure FillData(ADev: TDevice; ANode: TcxTreeListNode;IsHasCA:boolean);
    {选择车辆放到 右边的DestList中}
    procedure InsertDev2DestList(Adev: TDevice);
    procedure MoveDev2FromList(ADev: TDevice);
  public
    { Public declarations }
    FSelectDevGrpID : integer;
    //FFromSelectDev,FDestSelectDev : TDevice;
  end;

var
  FrmSelectDevs_Add2CArea: TFrmSelectDevs_Add2CArea;

implementation
 uses uGloabVar,ConfineAreaUnit,umainf;
{$R *.dfm}

procedure TFrmSelectDevs_Add2CArea.FormCreate(Sender: TObject);
begin
  ListAllDev.Execute;
//  FromList.Images := ResManage.BmpList;
  FromList.StateImages:=umainf.Mainf.ImageList1;
  DestList.StateImages:=umainf.Mainf.ImageList1;
//  DestList.Images := ResManage.BmpList;
//  cxHasCADevList.Images := ResManage.BmpList;
  cxHasCADevList.StateImages:=umainf.Mainf.ImageList1;
end;

procedure TFrmSelectDevs_Add2CArea.ListAllDevExecute(Sender: TObject);
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
  TreeView1.AutoExpand:= true;
  treeview1.Items.Clear;
  if ADeviceManage.Count=0 then
  begin
   // FFromSelectDev := nil;
   // FDestSelectDev := nil;
    exit;
  end;
  vn_node:= treeview1.Items.add(treeview1.topitem,'所有车辆');
  vn_node.Data:= pointer(-1);//所有车辆
  cnt:= ADevGroupManage.Count;
  FSelectDevGrpID := -1;
  group_list(0,vn_node,cnt);
  TreeView1.AutoExpand:= true;
end;

procedure TFrmSelectDevs_Add2CArea.TreeView1Click(Sender: TObject);
var
  grpId : integer;//,tmpGrpId ,tmpDevGrp i,
  j:integer;
  dev: Tdevice;
  devId : string;
  devGrp : TDevGroup;
begin
  grpId := Integer(TreeView1.Selected.Data);
  //选择没变化,直接退出
  if grpId = FSelectDevGrpID then exit;
  if grpId = -1 then exit;
  {if selectedItem = -1 then //监控车辆 --所有车辆
  begin
    Panel_Alarm.Visible := false;
    Panel_device.Visible := true;
    //列出所有车辆
    cxDeviceList.BeginUpdate;
    cxDeviceList.Clear;
    for i:=0 to ADeviceManage.Count -1 do
    begin
      devId:= ADeviceManage.Items[i].Id;
      Add2DevList(devId);
    end;
    cxDeviceList.EndUpdate;
  end
  else }if grpId >=0 then  //某分组车辆
  begin
    //列出某组车辆
    FromList.BeginUpdate;
    FromList.Clear;
    cxHasCADevList.BeginUpdate;
    cxHasCADevList.Clear;
    devGrp:= ADevGroupManage.find(grpId);

    for j:= 0 to devGrp.DevListCount-1 do
    begin
      devId:= devGrp.DevList[j];
      dev := ADeviceManage.find(devId);
      {if ((ComboBox_AreaType.ItemIndex = ALARM_OUT) and (dev.OutCAreaId <>-1))
        or ((ComboBox_AreaType.ItemIndex = ALARM_In) and (dev.InCAreaId <>-1))then
        Add2DevList(cxHasCADevList,dev,True)
      else     }
        Add2DevList(FromList,dev,False);
    end;
    FromList.EndUpdate;
    cxHasCADevList.EndUpdate;
  end;

  if FromList.FocusedNode<> nil then FromList.FocusedNode := nil;////
  if cxHasCADevList.FocusedNode<>nil then cxHasCADevList.FocusedNode := nil;
  FSelectDevGrpID := grpId;
  //FFromSelectDev := nil;
end;

procedure TFrmSelectDevs_Add2CArea.Add2DevList(Alist:TcxTreeList; const ADev: Tdevice;IsHasCA:boolean);
var
  node : TcxTreeListNode;
begin
  try
    node := AList.Add;
    node.Data := Adev;
    FillData(Adev,node,IsHasCA);
  finally
  end;
end;

procedure TFrmSelectDevs_Add2CArea.FillData(ADev: TDevice; ANode: TcxTreeListNode;IsHasCA:boolean);
begin
//del by dxf 2007-1-6 因为不用了.
{  with ADev,ANode do
  begin
    Data := ADev;
    Values[0]:= ADev.IdStr;
    Values[1]:= ADev.Car.No;
    if IsHasCA then
    begin
      if ComboBox_AreaType.ItemIndex= ALARM_OUT then
        Values[2]:= ADev.OutCAreaId
      else if ComboBox_AreaType.ItemIndex = ALARM_IN then
        Values[2]:= ADEV.InCAreaId;
    end;
    ImageIndex:= ADev.Car.ResIndex ;
    if ADev.isOnline then
    begin
      if ADev.Switch[0] then
        ANode.StateIndex:=3
      else
        ANode.StateIndex:=6;
    end
    else
    begin
      ANode.StateIndex:=4;
    end;
    SelectedIndex := ADev.Car.ResIndex ;
  end;  }
end;

procedure TFrmSelectDevs_Add2CArea.FromListClick(Sender: TObject);
begin
//  if FromList.FocusedNode = nil  then exit;
//  FFromSelectDev :=TDevice(FromList.FocusedNode.Data);
end;    

procedure TFrmSelectDevs_Add2CArea.FromListFocusedNodeChanged(Sender: TObject;
  APrevFocusedNode, AFocusedNode: TcxTreeListNode);
begin
//  if FromList.FocusedNode = nil  then exit;
//  FFromSelectDev :=TDevice(FromList.FocusedNode.Data);
end;

procedure TFrmSelectDevs_Add2CArea.DestListClick(Sender: TObject);
begin
//  if DestList.FocusedNode = nil  then exit;
//  FDestSelectDev :=TDevice(DestList.FocusedNode.Data);
end;

procedure TFrmSelectDevs_Add2CArea.DestListFocusedNodeChanged(Sender: TObject;
  APrevFocusedNode, AFocusedNode: TcxTreeListNode);
begin
//  if DestList.FocusedNode = nil  then exit;
//  FDestSelectDev :=TDevice(DestList.FocusedNode.Data);
end;

procedure TFrmSelectDevs_Add2CArea.AddSelectExecute(Sender: TObject);
var
  i:integer;
begin
  if FromList.SelectionCount>0 then
  begin
    for i:= 0 to FromList.SelectionCount -1 do
      InsertDev2DestList(TDevice(FromList.Selections[i].Data));
  end;
end;

procedure TFrmSelectDevs_Add2CArea.AddAllExecute(Sender: TObject);
var
  i: integer;
  dev : Tdevice;
begin
  for i:=0 to  FromList.Count -1 do
  begin
    dev := Tdevice(Fromlist.Items[i].Data);
    InsertDev2DestList(dev);
  end;
end;

procedure TFrmSelectDevs_Add2CArea.InsertDev2DestList(Adev: TDevice);
var
  find_ListItem : TcxTreeListNode;
begin
  //find_ListItem:=DestList.FindNodeByText(inttostr(Adev.Id),DestList.Columns[0],nil,false,true);
  find_ListItem:= FindNodeByTextIncxTreeList(Adev.IdStr,DestList,0);
  if find_ListItem = nil then
    Add2DevList(DestList,Adev,False)
  else
    FillData(Adev,find_ListItem,False);
end;

procedure TFrmSelectDevs_Add2CArea.MoveDev2FromList(ADev: TDevice);
var
  find_ListItem : TcxTreeListNode;
begin
  //find_ListItem:=DestList.FindNodeByText(inttostr(Adev.Id),DestList.Columns[0],nil,false,true);
  find_ListItem:= FindNodeByTextIncxTreeList(Adev.IdStr,FromList,0);
  if find_ListItem = nil then
    Add2DevList(FromList,Adev,False)
  else
    FillData(Adev,find_ListItem,False);
end;

procedure TFrmSelectDevs_Add2CArea.BitBtn_okClick(Sender: TObject);
begin
  if DestList.Count= 0 then
  begin
    messagebox(handle,pchar('请选择要添加到<'+Label_CurArea.Caption+'>的车辆!'),'提示',mb_ok + mb_iconinformation);
    exit;
  end;
  ModalResult := mrOk;
end;

procedure TFrmSelectDevs_Add2CArea.DeleteSelectExecute(Sender: TObject);
begin
  if DestList.SelectionCount>0 then
    destlist.DeleteSelection; 
end;

procedure TFrmSelectDevs_Add2CArea.DeleteAllExecute(Sender: TObject);
begin
  DestList.Clear;
end;

procedure TFrmSelectDevs_Add2CArea.ComboBox_AreaTypeChange(
  Sender: TObject);
begin
   if ComboBox_AreaType.ItemIndex=2 then
   begin
     cxHasCADevList.Visible:=false;
     Splitter3.Visible:=false;
   end
   else
   begin
     Splitter3.Visible:=true;
     cxHasCADevList.Visible:=true;
   end;
end;

end.
