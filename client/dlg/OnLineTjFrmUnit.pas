unit OnLineTjFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, CarUnit, uGloabVar;

type
  TOnLineTjFrm = class(TForm)
    Panel1: TPanel;
    PageControl2: TPageControl;
    TreeView1: TTreeView;
    Panel2: TPanel;
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure List_TreeGroup;
  end;

var
  OnLineTjFrm: TOnLineTjFrm;

implementation

{$R *.dfm}

procedure TOnLineTjFrm.List_TreeGroup;
      //group_list
      //�г��������飭��������Σ�����ID������ڵ㣬��ǰ��������
  procedure group_list(AParant_ID: integer; Anode: TTreenode; Acurrent_cnt: integer);
  var
    i, j: integer;
    leaf_id: array of integer; //�Ӽ��� ID ����
    leaf_cnt: integer; //�Ӽ��� ID  �������
    leaf_node: array of TTreenode; //�Ӽ��Ľڵ�
    devGrp: TDevGroup;
    dev: TDevice;
  begin
    leaf_cnt := 0;
    for i := 0 to ADevGroupManage.Count - 1 do
    begin
      if ADevGroupManage.items[i].parent = AParant_ID then
      begin
        leaf_cnt := leaf_cnt + 1;
        setlength(leaf_id, leaf_cnt);
        setlength(leaf_node, leaf_cnt);
        leaf_id[leaf_cnt - 1] := ADevGroupManage.items[i].id;
        leaf_node[leaf_cnt - 1] := treeview1.Items.addchild(
          Anode,
          trim(ADevGroupManage.items[i].name)+ '��' + ADevGroupManage.items[i].ZXL + '��');

        leaf_node[leaf_cnt - 1].data := pointer(leaf_id[leaf_cnt - 1]);
        Acurrent_cnt := Acurrent_cnt - 1;
        if Acurrent_cnt <= 0 then break;

        if ADevGroupManage.items[i].leaf_nod = false then
          group_list(leaf_id[leaf_cnt - 1], leaf_node[leaf_cnt - 1], Acurrent_cnt);
      end;
    end;
  end;
     //----------
var
  vn_node: TTreenode;
  cnt: Integer;
begin
  TreeView1.AutoExpand := false;
  treeview1.Items.Clear;

  vn_node := treeview1.Items.add(treeview1.topitem, '���г���');
  vn_node.Data := pointer(-1); //���г���
  cnt := ADevGroupManage.Count;

  group_list(0, vn_node, cnt);

  vn_node.Expanded := true;
end;

procedure TOnLineTjFrm.TreeView1Change(Sender: TObject; Node: TTreeNode);
var
  devGroup: TDevGroup;
  groupID: Integer;
begin
  if Node = nil then Exit;
  groupID := Integer(Node.Data);
  devGroup := ADevGroupManage.find(groupID);
  if devGroup = nil then Exit;
  Panel2.Caption := '��˾���ƣ�' + devGroup.Name + '    '+ devGroup.ZXL;
end;

end.
