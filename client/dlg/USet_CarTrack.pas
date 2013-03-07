unit USet_CarTrack;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons,ResUnit, ImgList,
  cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit, cxInplaceContainer,
  cxControls,
  CarUnit;

type
  Tset_CarTrack = class(TForm)
    Panel1: TPanel;
    Splitter1: TSplitter;
    TreeView1: TTreeView;
    Panel2: TPanel;
    Splitter2: TSplitter;
    Panel3: TPanel;
    Edit_CarNo: TEdit;
    Edit_Disp: TEdit;
    Edit_SimNo: TEdit;
    Edit_DevID: TEdit;
    Edit_GrpName: TEdit;
    Edit_CarMemo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    CheckBox_ShowTrack: TCheckBox;
    Label8: TLabel;
    Shape_TrackColor: TShape;
    DevList: TcxTreeList;
    Dev_Id: TcxTreeListColumn;
    Dev_CarNo: TcxTreeListColumn;
    Dev_Name: TcxTreeListColumn;
    Dev_SimNo: TcxTreeListColumn;
    Dev_ConnType: TcxTreeListColumn;
    Dev_Memo: TcxTreeListColumn;
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    Shape_all: TShape;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
//<<<<<<< USet_CarTrack.pas
    Panel5: TPanel;
    BitBtn3: TBitBtn;

    //Shape_all: TShape;
   // Shape_TrackColor: TShape;
   // DevList: TcxTreeList;
  //  Dev_Id: TcxTreeListColumn;
  //  Dev_CarNo: TcxTreeListColumn;
 //   Dev_Name: TcxTreeListColumn;
  //  Dev_SimNo: TcxTreeListColumn;
  //  Dev_ConnType: TcxTreeListColumn;
  //  Dev_Memo: TcxTreeListColumn;
    Label10: TLabel;
//>>>>>>> 1.7
    procedure TreeView1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure CheckBox_ShowTrackClick(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure Shape_allMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Shape_TrackColorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure DevListClick(Sender: TObject);
    procedure DevListFocusedNodeChanged(Sender: TObject; APrevFocusedNode,
      AFocusedNode: TcxTreeListNode);
  private
    { Private declarations }
    FSelectDevGrpID:Integer;
    {在TreeView  列出组  }
    procedure ListTree;
   
    procedure Add2DevList(Alist:TcxTreeList;const ADev: Tdevice);
    procedure FillData(ADev: TDevice; ANode: TcxTreeListNode);

  public
    { Public declarations }
  end;

var
  set_CarTrack: Tset_CarTrack;

implementation
  uses ugloabvar,StrUtils;
{$R *.dfm}


procedure Tset_CarTrack.ListTree;
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
//  TreeView1.AutoExpand:= true;
  treeview1.Items.Clear;

  vn_node:= treeview1.Items.add(treeview1.topitem,'所有车辆');
  vn_node.Data:= pointer(-1);//所有车辆
  cnt:= ADevGroupManage.Count;
 // FSelectDevGrpID := -1;
  group_list(0,vn_node,cnt);
  Vn_node.Expanded:=true;
  vn_node.Selected:=true;

end;


procedure Tset_CarTrack.TreeView1Click(Sender: TObject);
var
  grpId : integer; // ,tmpGrpId
  i,j:integer;
  dev: Tdevice;
  devId : string;
  devGrp : TDevGroup;// ,tmpDevGrp
begin
  grpId := Integer(TreeView1.Selected.Data);
  //选择没变化,直接退出
  if grpId = FSelectDevGrpID then exit;
 // if grpId = -1 then exit;
  if grpId = -1 then //监控车辆 --所有车辆
  begin
   // Panel_Alarm.Visible := false;
   // Panel_device.Visible := true;
    //列出所有车辆
    DevList.BeginUpdate;
    DevList.Clear;
    for i:=0 to ADeviceManage.Count -1 do
    begin
      Add2DevList(DevList,ADeviceManage.Items[i]);
    end;
    DevList.EndUpdate;
  end
  else if grpId >=0 then  //某分组车辆
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

procedure Tset_CarTrack.FormShow(Sender: TObject);
begin
  Edit_CarNo.Text:='';
  Edit_Disp.Text:='';
  Edit_SimNo.Text:='';
  Edit_DevID.Text:='';
  Edit_GrpName.Text:='';
  Edit_CarMemo.Text:='';
  CheckBox_ShowTrack.Checked := false;
  RadioButton1.Checked :=false;
  RadioButton2.Checked :=false;
  RadioButton3.Checked :=true;
  ListTree;

  TreeView1Click(TreeView1);
end; 

procedure Tset_CarTrack.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure Tset_CarTrack.CheckBox_ShowTrackClick(Sender: TObject);
var
  DevID:string;
  Dev:TDevice;
begin
  if Edit_DevID.text ='' then
  begin
    messagebox(handle,'请选择一辆车','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  //DevID:=StrToInt64(RightStr(Edit_DevID.text,10));
  DevID := Edit_DevID.text;
  Dev:= ADeviceManage.Find(DevID);
  if Dev<>nil then
     Dev.DrawTrack := CheckBox_ShowTrack.Checked;
end;

procedure Tset_CarTrack.RadioButton1Click(Sender: TObject);
var i:integer;
begin
  for i:= 0 to ADeviceManage.Count -1 do
    ADeviceManage.Items[i].DrawTrack := true;

  if trim(Edit_DevID.Text)<>''then CheckBox_ShowTrack.Checked :=true;
end;

procedure Tset_CarTrack.RadioButton2Click(Sender: TObject);
var i:integer;
begin
  for i:= 0 to ADeviceManage.Count -1 do
    ADeviceManage.Items[i].DrawTrack := false;

  if trim(Edit_DevID.Text)<>''then CheckBox_ShowTrack.Checked :=false;
end;

procedure Tset_CarTrack.RadioButton4Click(Sender: TObject);
var i:integer;
begin
  for i:= 0 to ADeviceManage.Count -1 do
    ADeviceManage.SetDevTrackPen(ADeviceManage.Items[i],shape_all.brush.Color);
  if trim(Edit_DevID.Text)<>''then Shape_TrackColor.brush.Color := shape_all.brush.Color;
end;

procedure Tset_CarTrack.Shape_allMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  clDialog:TColorDialog;
begin
  clDialog:=TColorDialog.Create(self);
  try
    clDialog.Color := shape_all.brush.Color;
    if clDialog.Execute then
      shape_all.brush.Color := clDialog.Color;
    if RadioButton4.Checked then RadioButton4Click(RadioButton4);
  finally
    clDialog.Free;
  end;
end;

procedure Tset_CarTrack.Shape_TrackColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   clDialog:TColorDialog;
   DevID:integer;
   dev:TDevice;
begin
  if  Edit_DevID.text='' then
  begin
    messagebox(handle,'请选择一辆车','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  clDialog:=TColorDialog.Create(self);
  try
    clDialog.Color := Shape_TrackColor.brush.Color;
    if clDialog.Execute then
      Shape_TrackColor.brush.Color := clDialog.Color;    
   // DevID:=StrToInt64(RightStr(Edit_DevID.text,10));
    dev := ADeviceManage.find(Edit_DevID.text);
    if dev = nil then exit;
    ADeviceManage.SetDevTrackPen(dev,clDialog.Color);
  finally
    clDialog.Free;
  end;
end;


procedure Tset_CarTrack.Add2DevList(Alist: TcxTreeList;
  const ADev: Tdevice);
var
  node : TcxTreeListNode;
begin
  if ADev=nil then exit;
  try
    node := AList.Add;
    node.Data := Adev;
    FillData(Adev,node);
  finally
  end;
end;

procedure Tset_CarTrack.FillData(ADev: TDevice; ANode: TcxTreeListNode);
begin
  with ADev,ANode do
  begin
    Data := ADev;
    Values[0]:= ADev.IdStr;
    Values[1]:= ADev.Car.No;
    values[2]:= ADev.DispLabel;
    values[3]:= ADev.SimNo;
    values[4]:= ADriverManage.GetDriver(ADev).Name;   //AConntypeManage.getConnType(ADev.ConnTypeID).name;
    values[5]:= ADev.Car.Memo;
    ImageIndex:= ADev.Car.ResIndex ;
    SelectedIndex := ADev.Car.ResIndex ;
  end;
end;

procedure Tset_CarTrack.FormCreate(Sender: TObject);
begin
  //DevList.Images :=ResManage.BmpList;
end;

procedure Tset_CarTrack.DevListClick(Sender: TObject);
var
  dev :Tdevice;
begin
  if DevList.FocusedNode = nil then exit;
  dev:= TDevice(DevList.FocusedNode.Data);
  Edit_CarNo.Text := dev.Car.No;
  Edit_Disp.Text := dev.DispLabel;
  Edit_SimNo.Text := dev.SimNo;
  Edit_DevID.Text := dev.Id;
  Edit_GrpName.Text :=ADriverManage.GetDriver(Dev).Name;  //AConntypeManage.getConnType(dev.ConnTypeID).name;
  Edit_CarMemo.Text := dev.Car.Memo;
  CheckBox_ShowTrack.Checked := dev.DrawTrack;
  Shape_TrackColor.Brush.Color := dev.TrackPen.color;
end;

procedure Tset_CarTrack.DevListFocusedNodeChanged(Sender: TObject;
  APrevFocusedNode, AFocusedNode: TcxTreeListNode);
var
  dev :Tdevice;
begin
  if DevList.FocusedNode = nil then exit;
  dev:= TDevice(DevList.FocusedNode.Data);
  Edit_CarNo.Text := dev.Car.No;
  Edit_Disp.Text := dev.DispLabel;
  Edit_SimNo.Text := dev.SimNo;
  Edit_DevID.Text := dev.Id;
  Edit_GrpName.Text :=ADriverManage.GetDriver(Dev).Name;//  AConntypeManage.getConnType(dev.ConnTypeID).name;
  Edit_CarMemo.Text := dev.Car.Memo;
  CheckBox_ShowTrack.Checked := dev.DrawTrack;
  Shape_TrackColor.Brush.Color := dev.TrackPen.color;
end;

end.
