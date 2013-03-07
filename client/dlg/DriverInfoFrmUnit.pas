unit DriverInfoFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxInplaceContainer, cxControls, StdCtrls, Buttons, ComCtrls, ExtCtrls,CarUnit,StrUtils,
  cxSplitter;

type
  TDriverInfoFrm = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label7: TLabel;
    Edit1: TEdit;
    Label8: TLabel;
    Edit2: TEdit;
    BitBtn4: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TreeView1: TTreeView;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    DriverList: TcxTreeList;
    DriverNO: TcxTreeListColumn;
    Name: TcxTreeListColumn;
    CarNO: TcxTreeListColumn;
    TEL: TcxTreeListColumn;
    IdentityCard: TcxTreeListColumn;
    Address: TcxTreeListColumn;
    isMain: TcxTreeListColumn;
    id: TcxTreeListColumn;
    CarID: TcxTreeListColumn;
    DevID: TcxTreeListColumn;
    GroupID: TcxTreeListColumn;
    Panel6: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    ComboB_Cph: TComboBox;
    ComboB_SimNum: TComboBox;
    BitBtnPrint: TBitBtn;
    BitBtn3: TBitBtn;
    cxSplitter1: TcxSplitter;
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure ComboB_CphChange(Sender: TObject);
    procedure ComboB_SimNumChange(Sender: TObject);
    procedure BitBtnPrintClick(Sender: TObject);
    procedure DriverListClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
  private
    FSelectDevGrpID : integer;
    procedure ListTree;
    procedure AddLine(Driver:TDriver);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DriverInfoFrm: TDriverInfoFrm;
  control:integer;
var
   SelectDriverInfoNode:TcxTreeListNode;
implementation
uses ugloabvar, ConstDefineUnit, ShowMessageInfo;
{$R *.dfm}

procedure TDriverInfoFrm.ListTree;
    //子组的组ID号， 节点，当前还余下数
    function ListSon(ASonId:integer;Anode:TTreeNode;leastCnt:integer):integer;
    var
      grp       : TDevGroup;
      leaf_node : TTreeNode;
      j,sonId   : integer;
    begin
      grp:= ADevGroupManage.Find(AsonId);
      leaf_node :=  treeview1.Items.AddChild(
          Anode,grp.name{+'('+inttostr(grp.DevListCount)+')'});
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
              Anode,grp.name{+'('+inttostr(grp.DevListCount)+')'});
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
  FSelectDevGrpID := -1;
  group_list(0,vn_node,cnt);
  vn_node.Expanded:=true;

//  TreeView1.AutoExpand:= true;
end;




procedure TDriverInfoFrm.FormCreate(Sender: TObject);
   function isAdd(Name:string):boolean;
   var
     i:integer;
   begin
     Result:=true;
     for i:=0 to ComboB_SimNum.Items.Count-1 do
     begin
        if ComboB_SimNum.Items.Strings[i]=Name then
        begin
          Result:=false;
          exit;
        end;
     end;
   end;
var
  i:integer;
begin
   ListTree;
   for i:=0 to ACarManage.count-1 do
   begin
      ComboB_Cph.Items.Add(ACarManage.Cars[i].No);
   end;
   ComboB_Cph.Text:='';

   for i:=0 to ADriverManage.Count -1 do
   begin
    if isAdd(ADriverManage.Drivers[i].Name) then
     ComboB_SimNum.Items.Add(ADriverManage.Drivers[i].Name);
   end;
   Label4.Caption:=inttostr(ADriverManage.Count) + ' 人';
   //Label6.Caption := inttostr(ADriverManage.Count)+' 人';
   ComboB_SimNum.Text:='';
   {DriverList.BeginUpdate;
   DriverList.Clear;
   for i:=0 to ADriverManage.Count-1 do
   begin
        AddLine(ADriverManage.Drivers[i]);
   end;
   DriverList.EndUpdate;   }
   control:=0;
end;

procedure TDriverInfoFrm.TreeView1Click(Sender: TObject);
var
  GrpID:integer;
  i:integer;// ,DevID
  devGrp : TDevGroup;
  Dev:TDevice;
  j:integer;
  person:integer;
  devIdstr:string;
begin
   if TreeView1.Selected = nil then exit;
   grpId := Integer(TreeView1.Selected.Data);
   if grpId = FSelectDevGrpID then  exit;
   FSelectDevGrpID :=grpId;
   person:=0;
    if GrpID=-1 then
    begin
       DriverList.BeginUpdate;
       DriverList.Clear;
       for i:=0 to ADriverManage.Count-1 do
       begin
         // if (ADriverManage.Drivers[i].GroupID=GrpID) or (grpId=-1) then
          begin
            AddLine(ADriverManage.Drivers[i]);
          end;
       end;
       DriverList.EndUpdate;
       Label6.Caption:=Label4.Caption;
       exit;
    end;

    DriverList.BeginUpdate;
    DriverList.Clear;
    devGrp:= ADevGroupManage.find(grpId);
    for i:= 0 to devGrp.DevListCount-1 do
    begin
      devIdstr:= devGrp.DevList[i];
      dev := ADeviceManage.find(devIdstr);
      if Dev = nil then Continue;
      for j:=0 to ADriverManage.Count-1 do
      begin
      if ADriverManage.Drivers[j].CarID= Dev.Car.Id then
      begin
        AddLine(ADriverManage.Drivers[j]);
        inc(person);
      end;
      end;
    end;
    DriverList.EndUpdate;
    //Label4.Caption := IntToStr(person) + '人';
    label6.Caption := IntToStr(person) + '人';
end;
{
 TDriver = record
    id: integer;
    Name: string;
    CarID: integer;
    DevID:integer;
    GroupID: integer;
    DriverNO: string[10];
    TEL: string;
    Address: string;
    IdentityCard: string;
    LoginTime:TDatetime;
    isMain: Boolean;
  end;
}
procedure TDriverInfoFrm.AddLine(Driver:TDriver);
begin
  if  Driver.DriverNO='' then exit;
   with DriverList.Add do
   begin
      //Data:=Pointer(ADriverManage.Drivers[i]);
      Values[0]:=rightstr(Driver.DriverNO,12);
      Values[1]:=Driver.Name;
      Values[2]:=ACarManage.GetCar(Driver.CarID).No;
      Values[3]:=Driver.TEL;
      Values[4]:=Driver.IdentityCard;

      Values[5]:=Driver.Address;
      if  Driver.isMain  then
        Values[6]:='主'
      else
        Values[6]:='副';
      values[7]:=Driver.id;
      values[8]:=Driver.CarID;
      values[9]:=Driver.DevID;
      values[10]:=Driver.GroupID;
   end;
end;


procedure TDriverInfoFrm.ComboB_CphChange(Sender: TObject);
var
  i:integer;
  CarID:integer;
begin
  ComboB_SimNum.Text:='';
  CarID:=-1;
  for i:=0 to ACarManage.count-1 do
  begin
    if ACarManage.Cars[i].No=ComboB_Cph.Text then
    begin
       CarID:= ACarManage.Cars[i].Id;
       Break;
    end;
  end;
  DriverList.BeginUpdate;
  DriverList.Clear;
  for i:=0 to  ADriverManage.Count-1 do
  begin
    if ADriverManage.Drivers[i].CarID=CarID then
    begin
       AddLine(ADriverManage.Drivers[i]);
    end;
  end;
  DriverList.EndUpdate;
end;

procedure TDriverInfoFrm.ComboB_SimNumChange(Sender: TObject);
var
 i:integer;
begin
  ComboB_Cph.Text:='';
  DriverList.BeginUpdate;
  DriverList.Clear;
  for i:=0 to  ADriverManage.Count-1 do
  begin
    if ADriverManage.Drivers[i].Name = ComboB_SimNum.Text then
    begin
       AddLine(ADriverManage.Drivers[i]);
    end;
  end;
  DriverList.EndUpdate;
end;

procedure TDriverInfoFrm.BitBtnPrintClick(Sender: TObject);
begin
  cxTreeListToCSVFile(DriverList);
end;

procedure TDriverInfoFrm.DriverListClick(Sender: TObject);

begin
   SelectDriverInfoNode:=DriverList.FocusedNode;
   if SelectDriverInfoNode<>nil then
   begin
   //  edit1.ReadOnly:=true;
   //  edit2.ReadOnly:=true;
     edit1.Text:=trim( SelectDriverInfoNode.Values[1]);
     edit2.Text:=trim( SelectDriverInfoNode.Values[3]);
   end;
end;

procedure TDriverInfoFrm.BitBtn1Click(Sender: TObject);
begin
  edit1.ReadOnly:=false;
  edit2.ReadOnly:=false;
  edit1.Color:=clwindow;
  edit2.Color:=clwindow;
  control:=1;
  BitBtn1.Enabled:=false;
end;

procedure TDriverInfoFrm.BitBtn2Click(Sender: TObject);
var
  ADriverID,ACarID,AGroupID,ADriverKind:integer;
  ADriverName,ADriverTel ,ADriverAddr ,ADriverCard,ADriverNo:string;
  ADriverPhoto: OleVariant;
  driver: PDriver;
begin
  if SelectDriverInfoNode=nil then
  begin
    messagebox(handle,'请选择要修改的司机信息!','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  try
    if control=1 then
    begin
     { ADriverPhoto:=null;
      ADriverID:=SelectDriverInfoNode.Values[7];
      SelectDriverInfoNode.Values[1]:=edit1.Text;
      ADriverName:=trim(edit1.Text);
      SelectDriverInfoNode.Values[3]:=trim(edit2.Text);
      ADriverTel:=trim(edit2.Text);
      ADriverAddr:=SelectDriverInfoNode.Values[5];
      ADriverCard:=SelectDriverInfoNode.Values[4];
      ACarID:=SelectDriverInfoNode.Values[8];
      AGroupID:= SelectDriverInfoNode.Values[10];
      ADriverNo:=SelectDriverInfoNode.Values[0];

      ADriverKind:=0;   }

      ADriverID := SelectDriverInfoNode.Values[7];
      ADriverName := Trim(Edit1.Text);
      ADriverTel := Trim(Edit2.Text);
      if control=1 then
      begin
        try
          if bs.ModifyADriver_Client(ADriverID, ADriverName, ADriverTel) = 'OK' then
          begin
            driver := ADriverManage.GetDriver(SelectDriverInfoNode.Values[0]);
            if driver <> nil then
            begin
              driver^.Name := ADriverName;
              driver^.TEL := ADriverTel;
            end;
            SelectDriverInfoNode.Values[1] := ADriverName;
            SelectDriverInfoNode.Values[3] := ADriverTel;
            Edit1.Text := '';
            Edit2.Text := '';
            messagebox(handle,'修改成功!','提示',mb_ok + mb_iconinformation);
          end
          else
            messagebox(handle,'修改失败!','提示',mb_ok + mb_iconinformation);
        except
          on E: Exception do
          begin
            messageErrorBox('修改司机信息出现错误', E.Message);
            exit;
          end;
        end;
        //bs.ModifyDriver(ADriverID,ADriverName,ADriverTel,ADriverAddr,ADriverCard,ADriverPhoto,ACarID,AGroupID,ADriverNo,ADriverKind);
      end;
    end;
  finally
    control:=0;
    edit1.ReadOnly:=true;
    edit2.ReadOnly:=true;
    edit1.Color:=clMenu;
    edit2.Color:=clMenu;
    BitBtn1.Enabled:=true;
  end;
end;

procedure TDriverInfoFrm.BitBtn4Click(Sender: TObject);
begin
   control:=0;
  // edit1.ReadOnly:=true;
  // edit2.ReadOnly:=true;
   edit1.Color:=clMenu;
   edit2.Color:=clMenu;
   BitBtn1.Enabled:=true;
end;

procedure TDriverInfoFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ManualDock(nil);
end;

procedure TDriverInfoFrm.BitBtn3Click(Sender: TObject);
begin
  close;
end;

end.
