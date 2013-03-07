unit USelect_dev;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons,ResUnit, ImgList;

type
  Tselect_dev = class(TForm)
    Panel1: TPanel;
    Splitter1: TSplitter;
    TreeView1: TTreeView;
    Panel2: TPanel;
    Splitter2: TSplitter;
    ListView1: TListView;
    Panel3: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel4: TPanel;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    Panel5: TPanel;
    Label7: TLabel;
    start_date: TDateTimePicker;
    start_time: TDateTimePicker;
    end_date: TDateTimePicker;
    end_time: TDateTimePicker;
    Label8: TLabel;
    procedure TreeView1Click(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListView1ColumnClick(Sender: TObject; Column: TListColumn);
    procedure BitBtn3Click(Sender: TObject);
    procedure start_dateChange(Sender: TObject);
  private
    { Private declarations }
    procedure list_DevGroup;  //在TreeView  列出组
    procedure list_device;    //在 ListView1　中列出所有车辆     
  public
    { Public declarations }
  end;

var
  select_dev: Tselect_dev;

implementation
  uses ugloabvar,carUnit;
{$R *.dfm}

procedure Tselect_dev.list_DevGroup;     //TreeView  列出组
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
          if ADevGroupManage.items[i].parent =AParant_ID then
          begin
            leaf_cnt:= leaf_cnt + 1;
            setlength(leaf_id,leaf_cnt);
            setlength(leaf_node,leaf_cnt);
            leaf_id[leaf_cnt -1]:= ADevGroupManage.items[i].id;
            //leaf_node[leaf_cnt -1]:= treeview1.Items.addchild(Anode,trim(ADevGroupManage.items[i].name)+'('+inttostr(ADevGroupManage.items[i].id));
            leaf_node[leaf_cnt -1]:= treeview1.Items.addchild(
                Anode,
                trim(ADevGroupManage.items[i].name)
                +'('+ IntToStr(ADevGroupManage.items[i].DevListCount)+')');
            leaf_node[leaf_cnt -1].data:= pointer(leaf_id[leaf_cnt -1]);
           { leaf_node[leaf_cnt -1].ImageIndex := 0;
            leaf_node[leaf_cnt -1].StateIndex := -1;
            leaf_node[leaf_cnt -1].SelectedIndex := 1;    }
            Acurrent_cnt:= Acurrent_cnt -1;
            if Acurrent_cnt<=0 then break;

            if ADevGroupManage.items[i].leaf_nod  = false then
              group_list(leaf_id[leaf_cnt-1],leaf_node[leaf_cnt-1],Acurrent_cnt);
          end;
        end;
        Anode.Expanded := true;
      end;
     //----------
var
  vn_node: TTreenode;
  cnt: integer;
begin
  vn_node:= treeview1.Items.add(treeview1.topitem,'车辆组信息');
  vn_node.Data:=pointer(-1);
  cnt:= ADevGroupManage.Count;
  group_list(0,vn_node,cnt);
end;


procedure Tselect_dev.list_Device;//在 ListView1　中列出所有车辆
var i:integer;
begin
//  listview1.SmallImages := ResManage.BmpList ;
  ListView1.Items.Clear;
  for i:=0 to ADeviceManage.Count - 1 do
  begin
    with ListView1.Items.Add do
    begin
      Data:= ADeviceManage.Items[i];
      caption:=  ADeviceManage.Items[i].Car.No;;
      SubItems.Add(ADeviceManage.Items[i].DispLabel);
      SubItems.Add(ADeviceManage.Items[i].SimNo );
      //SubItems.Add(AConntypeManage.getConnType(ADeviceManage.Items[i].ConnTypeID).name );   //接线方案
      SubItems.Add(ADevGroupManage.find(ADeviceManage.Items[i].GroupID).Name) ;
      SubItems.Add(ADeviceManage.Items[i].IdStr);
      ImageIndex := ADeviceManage.Items[i].Car.ResIndex ;
    end;
  end;
end;


procedure Tselect_dev.TreeView1Click(Sender: TObject);
  //----------------   递归调用    --加入 所有子下的、子的子下的　所有叶子下的车辆
   procedure get_leaf_car(nod:TTreeNode);
   var i,childcount:integer;
       a_nod,b_nod:TTreeNode;
       nod_id,t:integer;
   begin
      if nod.HasChildren then  //－－aa－－有子
      begin
        childcount := nod.Count;
        if childcount>0 then
        begin
          a_nod:= nod.getFirstChild;
          get_leaf_car(a_nod);
          childcount:= childcount -1;
          while childcount>1 do
          begin
            b_nod:= nod.GetNextChild(a_nod);
            get_leaf_car(b_nod);
            childcount := childcount -1;
            a_nod:= b_nod;
          end;
          if childcount=1 then get_leaf_car(nod.GetLastChild );
        end;
      end
      else
      begin    //－－aa－－是　叶子
        nod_id:= integer(nod.Data);
        //----在treeview中列出车辆
        for i:=0 to ADeviceManage.Count - 1 do
        begin
          if ADeviceManage.Items[i].GroupID =nod_id then
            with ListView1.Items.Add do
            begin
              data := ADeviceManage.Items[i];
              caption:=  ADeviceManage.Items[i].Car.No;;
              SubItems.Add(ADeviceManage.Items[i].DispLabel);
              SubItems.Add(ADeviceManage.Items[i].SimNo );
              //SubItems.Add(AConntypeManage.getConnType(ADeviceManage.Items[i].ConnTypeID).name ); //接线方案
              SubItems.Add(ADevGroupManage.find(ADeviceManage.Items[i].GroupID).Name) ;
              SubItems.Add(ADeviceManage.Items[i].id);
              ImageIndex := ADeviceManage.Items[i].Car.ResIndex ;
            end;
        end;
      end;
   end;
   //---------------------------
var
   group_name:string;
begin
  try
    if treeview1.selected=nil then exit;
    group_name :=  treeview1.selected.Text;
    if group_name='车辆组信息' then   //在地图中显示 所有车辆
    begin
      list_Device;    //在 ListView2　中列出所有车辆
    end
    else
    begin
       //--取出该点下所有的叶子
      ListView1.Items.Clear;
      get_leaf_car(treeview1.Selected);  // -(递归)--列出 所有子下的、子的子下的　所有叶子下的车辆 ,并在地图中显示     　
    end;
  except
    on E:exception do
       begin
         messagebox(0,pchar(e.Message ),'提示',mb_ok + mb_iconinformation);
       end;
  end;
end;

procedure Tselect_dev.ListView1Click(Sender: TObject);
var
  devId:integer;
  res_id,res_index:integer;
  dev :TDevice;
begin
  if listview1.SelCount=0 then exit;
  dev := TDevice(ListView1.Selected.Data);
  if dev= nil then exit;
  edit1.Text := dev.Car.No ;
  edit2.text := dev.DispLabel;
  edit3.Text := dev.SimNo;
  edit4.Text := dev.IdStr;
  edit5.Text := listview1.Selected.SubItems.Strings[3];
  edit6.Text := dev.Car.Memo;
end;

procedure Tselect_dev.FormShow(Sender: TObject);
begin
  edit1.Text:='';
  edit2.Text:='';
  edit3.Text:='';
  edit4.Text:='';
  edit5.Text:='';
  edit6.Text:='';
  list_DevGroup;
  list_device;
  TreeView1.Selected := TreeView1.Items.Item[0];
  TreeView1.SetFocus;
end;


procedure Tselect_dev.ListView1ColumnClick(Sender: TObject;
  Column: TListColumn);
begin
  listview1.CustomSort(@customsortproc,Column.Index);
end;

procedure Tselect_dev.BitBtn3Click(Sender: TObject);
begin
  if trim(Edit4.Text)='' then
  begin
    messagebox(handle,'请先选择车辆！','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  if (start_date.date> end_date.date)  or
    ((start_date.date = end_date.date) and (start_time.Time>end_time.Time))then
  begin
    messagebox(handle,'请重新输入 回放时间段!','提示',mb_ok + mb_iconinformation);
    exit;
  end
  else
    ModalResult := mrOk;
end;

procedure Tselect_dev.start_dateChange(Sender: TObject);
begin
  if end_date.date<start_date.date then
    end_date.Date:= start_date.Date;
end;

end.
