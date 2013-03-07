unit OverSpeedLookUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, DBGridEh, ExtCtrls,
  cxControls, cxSplitter,uGloabVar,CarUnit,IniFiles,DBClient, DB,
  cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit, cxInplaceContainer,DateUtils;

type
  TOverSpeedLookFrm = class(TForm)
    Panel3: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel4: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    TreeView1: TTreeView;
    Label3: TLabel;
    ComboBox2: TComboBox;
    cxSplitter1: TcxSplitter;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    CheckBox1: TCheckBox;
    OverSpeedList: TcxTreeList;
    carname: TcxTreeListColumn;
    Speed: TcxTreeListColumn;
    Time: TcxTreeListColumn;
    longitude: TcxTreeListColumn;
    latitude: TcxTreeListColumn;
    procedure FormShow(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    procedure AddDev(id: integer; ANode: TTreeNode);
  public
    { Public declarations }
  end;

var
  OverSpeedLookFrm: TOverSpeedLookFrm;
  group_id: integer = -1;
implementation

{$R *.dfm}

procedure TOverSpeedLookFrm.AddDev(id: integer; ANode: TTreeNode);
var
  i: integer;
  groupId: integer;
  CarList: TListBox;
  CarNo: string;
  node: TTreeNode;
begin
  try
    CarList := TListBox.Create(nil);
    CarList.Sorted := true;
    CarList.parent := self;
    for i := 0 to ADeviceManage.Count - 1 do
    begin
      groupId := ADeviceManage.Items[i].GroupID;
      if groupId = id then
      begin
        CarNo := ADeviceManage.Items[i].Car.No;
        CarList.Items.Append(CarNo);
      end;
    end;
    ComboBox2.Items.Clear;
    ComboBox2.Text := '';
    for i := 0 to CarList.Items.Count - 1 do
    begin
      ComboBox2.Items.Add(CarList.Items.Strings[i]);
    end;
  finally
    CarList.Free;
  end;
end;

procedure TOverSpeedLookFrm.FormShow(Sender: TObject);
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
var
  vn_node: TTreeNode;
  cnt: integer;
  j: integer;
  iniFile: TIniFile;
begin
  try
    DateTimePicker3.Date:=incday(now(),2);
    DateTimePicker1.Date:=incday(now(),-3);
    TreeView1.AutoExpand := true;
    TreeView1.Items.Clear;
    if ADevGroupManage.Count = 0 then exit;
    vn_node := TreeView1.Items.add(TreeView1.topitem, '所有车辆');
    vn_node.Data := Pointer(-1); //所有车辆
    vn_node.Expanded := true;
    cnt := ADevGroupManage.Count;
    group_list(0,vn_node,cnt);
  finally
    //iniFile.Free;
  end;
end;

procedure TOverSpeedLookFrm.TreeView1Click(Sender: TObject);
var
  devGrp: TDevGroup;
  Node: TTreeNode;
begin
  Node := TreeView1.Selected;
  if Node = nil then exit;
  group_id := Integer(Node.Data);
  if group_id = -1 then
  begin
    Exit;
  end;
  if group_id = -2 then
  begin
    Exit;
  end;
  if (group_id >= 0) then //and (not IsClickDev) and (grpId <> clickParent) then
  begin
    AddDev(group_id, Node);
  end;
end;  

procedure TOverSpeedLookFrm.BitBtn1Click(Sender: TObject);
var
  info: OleVariant;
  carNo:string;
  AFromDate,AEndDate:string;
  AGroupId:integer;
  temp: TClientDataSet;
  i:integer;
  Dev:TDevice;
  devId:string;
begin
  //================================================//
  AGroupId:=group_id;
  carNo:=ComboBox2.Text;
  AFromDate:=formatdatetime('yyyy-mm-dd', DateTimePicker1.Date)+' '+formatdatetime('hh:nn:ss', DateTimePicker2.Time) ;
  AEndDate:=formatdatetime('yyyy-mm-dd', DateTimePicker3.Date)+' '+formatdatetime('hh:nn:ss', DateTimePicker4.Time) ;
  OverSpeedList.Clear;
  if checkbox1.Checked  then
  begin
    info := bs.QueryOverSpeed('',AFromDate,AEndDate,-1);
  end else
  begin
    if  AGroupId>0 then
    begin
      info := bs.QueryOverSpeed(carNo,AFromDate,AEndDate,AGroupId);
    end else
    begin
      exit;
    end;
  end;

  temp := TClientDataSet.Create(nil);
  try
    temp.Data := info;
    for i:=0 to temp.RecordCount-1 do
    begin
      with OverSpeedList.Add do
      begin
         Values[0]:=temp.FieldValues['car_no'];
         Values[1]:=temp.FieldValues['Speed'];
         //Values[2]:=formatdatetime('yyyy-mm-dd hh:nn:ss', strtodateTime(temp.FieldValues['sTime']));
         Values[2]:=temp.FieldValues['sTime'];
         values[3]:=temp.FieldValues['longitude'];
         values[4]:=temp.FieldValues['latitude'];
      end;
      temp.Next;
    end;
  finally
    temp.Free;
  end;

end;

procedure TOverSpeedLookFrm.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure TOverSpeedLookFrm.BitBtn2Click(Sender: TObject);
begin
  cxTreeListToCSVFile(OverSpeedList);
end;

procedure TOverSpeedLookFrm.CheckBox1Click(Sender: TObject);
begin
  if checkbox1.Checked then
  begin
    combobox2.Items.Clear;
  end;
end;

end.
