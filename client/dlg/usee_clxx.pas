unit usee_clxx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons,ResUnit, ImgList,
  cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit, cxInplaceContainer,
  cxControls ,CarUnit, cxCalendar, cxSplitter, RzButton;

type
  Tsee_clxx = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TreeView1: TTreeView;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    Panel6: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    ComboB_Cph: TComboBox;
    ComboB_SimNum: TComboBox;
    RadioGroupOnline: TRadioGroup;
    RadioGroupISlocate: TRadioGroup;
    DevList: TcxTreeList;
    Dev_Id: TcxTreeListColumn;
    Dev_CarNo: TcxTreeListColumn;
    Dev_Name: TcxTreeListColumn;
    Dev_SimNo: TcxTreeListColumn;
    Dev_ConnType: TcxTreeListColumn;
    Dev_SetupTime: TcxTreeListColumn;
    Dev_GroupName: TcxTreeListColumn;
    Dev_isOnline: TcxTreeListColumn;
    ISlocote: TcxTreeListColumn;
    Dev_GpsDateTime: TcxTreeListColumn;
    cxSplitter1: TcxSplitter;
    BitBtnPrint: TRzBitBtn;
    BitBtn3: TRzBitBtn;
    Dev_CarCpColor: TcxTreeListColumn;
    Dev_CarTypeName: TcxTreeListColumn;
    Dev_CarShipName: TcxTreeListColumn;
    dev_TerminalTypeName: TcxTreeListColumn;
    dev_carMemo: TcxTreeListColumn;
    procedure TreeView1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboB_CphChange(Sender: TObject);
    procedure BitBtnPrintClick(Sender: TObject);
    procedure RadioGroupOnlineClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure DevListClick(Sender: TObject);
  private
    { Private declarations }
    FSelectDevGrpID : integer;
    procedure list_DevGroup;  //在TreeView  列出组
    procedure ListTree;
    procedure Add2DevList(Alist:TcxTreeList;const ADev: Tdevice);
    procedure FillData(ADev: TDevice; ANode: TcxTreeListNode);
  public
    { Public declarations }
  end;

var
  see_clxx: Tsee_clxx;

implementation
uses uGloabVar, umainf;
{$R *.dfm}

procedure Tsee_clxx.list_DevGroup;     //TreeView  列出组
      //group_list
      //列出所有子组－－－－入参：父组ID，父组节点，当前还余下数
      procedure group_list(AParant_ID:integer;Anode:TTreenode;Acurrent_cnt:integer);
      var
        i:integer;
        leaf_id: array of integer;//子级的 ID 数组
        leaf_cnt:integer; //子级的 ID  数组个数
        leaf_node: array of TTreenode;     //子级的节点
      begin
        leaf_cnt:=0;
        for i:=0 to ADevGroupManage.Count - 1 do
        begin
          if ADevGroupManage.Items[i].parent =AParant_ID then
          begin
            leaf_cnt:= leaf_cnt + 1;
            setlength(leaf_id,leaf_cnt);
            setlength(leaf_node,leaf_cnt);
            leaf_id[leaf_cnt -1]:= ADevGroupManage.Items[i].id;
            leaf_node[leaf_cnt -1]:= treeview1.Items.addchild(Anode,trim(ADevGroupManage.items[i].name)+'('+IntToStr(ADevGroupManage.items[i].DevCount)+')');
            leaf_node[leaf_cnt -1].data:= pointer(leaf_id[leaf_cnt -1]);
           { leaf_node[leaf_cnt -1].ImageIndex := 0;
            leaf_node[leaf_cnt -1].StateIndex := -1;
            leaf_node[leaf_cnt -1].SelectedIndex := 1;    }
            Acurrent_cnt:= Acurrent_cnt -1;
            if Acurrent_cnt<=0 then break;

            if ADevGroupManage.Items[i].leaf_nod  = false then
              group_list(leaf_id[leaf_cnt-1],leaf_node[leaf_cnt-1],Acurrent_cnt);
          end;
        end;
      end;
     //----------
var
  vn_node: TTreenode;
  cnt: integer;
begin
  try
    Screen.Cursor := crHourGlass;
    vn_node:= treeview1.Items.add(treeview1.topitem,'所有车辆信息');
    vn_node.Data:=pointer(-1);
    cnt:= ADevGroupManage.Count;
    group_list(0,vn_node,cnt);
   // TreeView1.AutoExpand:= true;
    vn_Node.Expanded:=true;
    vn_Node.Selected:=true;
    TreeView1Click(TreeView1);
  finally
    Screen.Cursor := crDefault;
  end;        
end;

procedure Tsee_clxx.TreeView1Click(Sender: TObject);
var
  grpId,tmpGrpId : integer;
  i,j:integer;
  dev: Tdevice;
  devId : string;
  devGrp,tmpDevGrp : TDevGroup;
begin
  if  TreeView1.Selected = nil then exit;
  grpId := Integer(TreeView1.Selected.Data);
  //选择没变化,直接退出
  //if grpId = FSelectDevGrpID then exit;
  if grpId = -1 then
  begin
    DevList.BeginUpdate;
    DevList.Clear;
    for j:= 0 to ADeviceManage.Count-1 do
    begin
      dev := ADeviceManage.Items[j];
      Add2DevList(DevList,dev);
    end;
    DevList.EndUpdate;
  end;
  if grpId >=0 then  //某分组车辆
  begin
    //列出某组车辆
    DevList.BeginUpdate;
    DevList.Clear;
    devGrp:= ADevGroupManage.find(grpId);

    for j:= 0 to devGrp.DevListCount-1 do
    begin
      devId:= devGrp.DevList[j];
      dev := ADeviceManage.find(devId);
      Add2DevList(DevList,dev);
    end;
    DevList.EndUpdate;
  end;
  if DevList.FocusedNode<> nil then
    DevList.FocusedNode := nil;   //

  FSelectDevGrpID := grpId;
end;


procedure Tsee_clxx.FormCreate(Sender: TObject);
var
  i: integer;
begin     
  ComboB_Cph.Text:='';
  ComboB_SimNum.Text:= '';
  //list_DevGroup;
  ListTree;

  for i:= 0 to ADeviceManage.Count - 1 do
  begin
    ComboB_Cph.Items.Add(ADeviceManage.Items[i].Car.No);
    ComboB_SimNum.Items.Add(ADeviceManage.Items[i].SimNo);
  end;

  //DevList.Images :=ResManage.BmpList;
end;

procedure Tsee_clxx.ListTree;
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

  vn_node:= treeview1.Items.add(treeview1.topitem,'所有车辆');
  vn_node.Data:= pointer(-1);//所有车辆
  cnt:= ADevGroupManage.Count;
 // FSelectDevGrpID := -1;
  group_list(0,vn_node,cnt);
  vn_Node.Expanded:=true;
  vn_node.Selected:=true;
  TreeView1Click(TreeView1);
  //TreeView1.AutoExpand:= true;
end;

procedure Tsee_clxx.Add2DevList(Alist: TcxTreeList; const ADev: Tdevice);
var
  node : TcxTreeListNode;
begin
  if ADev = nil then exit;

  if (RadioGroupOnline.ItemIndex=1) and (not ADev.isOnline) then exit;

  if (RadioGroupOnline.ItemIndex=2) and  (ADev.isOnline)  then exit;

  if (RadioGroupISlocate.ItemIndex=1) then
  begin
    if adev.Switch[0] then exit;
    if not adev.isOnline then exit;
  end;

  if (RadioGroupISlocate.ItemIndex=2)  then
  begin
    if  (not adev.Switch[0]) and (adev.isOnline) then exit;
  end;


  try
    node := AList.Add;
    node.Data := Adev;
    FillData(Adev,node);

  finally
  end;
end;

procedure Tsee_clxx.FillData(ADev: TDevice; ANode: TcxTreeListNode);
var
  grp: TDevGroup;
begin
  try
    with ADev,ANode do
    begin
      Data := ADev;
      Values[0]:= ADev.IdStr;
      Values[1]:= ADev.Car.No;
      //values[2]:= ADev.DispLabel;
      values[3]:= ADev.SimNo;
      values[4]:= ADev.Login_DriverName;//ADriverManage.GetDriver(ADev).Name;
      values[5]:= ADev.Car.SetupTime;//.Memo;
      grp := ADevGroupManage.Find(ADev.GroupID);
      if grp <> nil then
        Values[6]:= grp.name
      else
        Values[6]:='';
        
      if ADev.isOnline then
      begin
        Values[7]:='在线';
        if ADev.Switch[STAT_GPS_LOCATE] then
          ANode.StateIndex := 3
        else
          ANode.StateIndex := 6;
      end
      else
      begin
        Values[7]:='不在线';
        ANode.StateIndex := 4;
      end;

      if not adev.Switch[0] then
        values[8]:='定位'
      else
        values[8]:='非定位';
      if not adev.isOnline then  values[8]:='非定位';
      //if ADev.Switch[4] then Values[8] := '休眠';
      if ADev.GpsTime =0 then
        Values[9]:= ''
      else
        Values[9]:= FormatDateTime('yyyy-mm-dd hh:nn:ss', ADev.GpsTime);
      Values[10] := ADev.Car.CPColorStr;
      Values[11] := ADev.Car.CarKind;
      Values[12] := ADev.Car.CarShipName;
      Values[13] := Adev.TerminalTypeName;
      Values[14] := ADev.Car.Memo;
      //ImageIndex:= ADev.Car.ResIndex ;
      SelectedIndex := ADev.Car.ResIndex ;
    end;
  except
  end;
end;



procedure Tsee_clxx.ComboB_CphChange(Sender: TObject);
var
  i: integer;
  dev: TDevice;
begin
  if TComboBox(Sender) = ComboB_SimNum then
  begin
    ComboB_Cph.Text:='';
  end
  else
  begin
    ComboB_SimNum.Text:='';
  end;
  for i:= 0 to ADeviceManage.Count - 1 do
    if (ADeviceManage.Items[i].Car.No = trim(ComboB_Cph.Text))
      or (ADeviceManage.Items[i].SimNo = trim(ComboB_SimNum.Text)) then
    begin
      dev:=ADeviceManage.Items[i];
      if Dev<>nil then
      begin
        DevList.BeginUpdate;
        DevList.Clear;
        Add2DevList(DevList,dev);
        DevList.EndUpdate;
      end;
    end;
end;

procedure Tsee_clxx.BitBtnPrintClick(Sender: TObject);
begin
  cxTreeListToCSVFile(DevList);
end;

procedure Tsee_clxx.RadioGroupOnlineClick(Sender: TObject);
begin
  TreeView1Click(nil);
end;

procedure Tsee_clxx.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ManualDock(nil);
end;

procedure Tsee_clxx.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure Tsee_clxx.DevListClick(Sender: TObject);
var
  dev: TDevice;
begin
  umainf.Mainf.PageControl1.ActivePageIndex := 0;
  if DevList.FocusedNode = nil then exit;
  GCurSelectDev := TDevice(DevList.FocusedNode.Data);

  mainf.Edit2.Text := (GCurSelectDev.Id);
  mainf.Edit1.Text := GCurSelectDev.Car.No;
  mainf.ShowState(GCurSelectDev);
end;

end.
