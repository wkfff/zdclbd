unit DriverBlacklist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, uFrmRefreshProgress, DBClient,
  StdCtrls, Buttons, uGloabVar, DB, cxControls, cxSplitter, ComCtrls;

type
  TfrmDriverBlacklist = class(TForm)
    ds1: TDataSource;
    Panel7: TPanel;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    TreeView1: TTreeView;
    cxSplitter1: TcxSplitter;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btnSetBlacklist: TSpeedButton;
    btnDisBlacklist: TSpeedButton;
    cbbGroup: TComboBox;
    cbbDriver: TComboBox;
    btnQuery: TBitBtn;
    Panel3: TPanel;
    grdBlacklist: TDBGrid;
    cxSplitter2: TcxSplitter;
    SpeedButton4: TSpeedButton;
    PanelSelectGroupName: TPanel;
    procedure btnSetBlacklistClick(Sender: TObject);
    procedure btnDisBlacklistClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbbGroupChange(Sender: TObject);
    procedure grdBlacklistCellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TreeView1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
    FDlgProgress: TFrmRefreshProgress;
    clientDataSet: TClientDataSet;
    rowSelected: Boolean;    
  public
    { Public declarations }
  end;

var
  frmDriverBlacklist: TfrmDriverBlacklist;
  group_id: Integer;
implementation
uses CarUnit, ConstDefineUnit;
{$R *.dfm}

procedure TfrmDriverBlacklist.btnSetBlacklistClick(Sender: TObject);
var
  driver: PDriver;
  Res: Integer;
begin
  if grdBlacklist.DataSource = nil then Exit;
  if grdBlacklist.DataSource.DataSet.RecordCount < 1 then Exit;
  if not rowSelected then Exit;
  //if grdBlacklist.DataSource.DataSet.Bof then Exit;
  if grdBlacklist.DataSource.DataSet.FieldValues['IsBlackStr'] = '是' then
  begin
    MessageBox(Handle, '该司机已被设为黑名单!', '提示', MB_OK + MB_ICONINFORMATION);
    Exit;
  end
  else
  begin
    try
      Res := Bs.SetDriverInBlacklist(grdBlacklist.DataSource.DataSet.FieldValues['Driver_Id'], 1);
    except
      on E: Exception do
      begin
        messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
        exit;
      end;
    end;
    if Res = 1 then
    begin
      MessageBox(Handle, '设为黑名单成功!', '提示', MB_OK + MB_ICONINFORMATION);
      grdBlacklist.DataSource.Edit;
      grdBlacklist.DataSource.DataSet.FieldValues['IsBlackStr'] := '是';

      //当前司机缓存信息同步更新
      driver := ADriverManage.GetDriver(grdBlacklist.DataSource.DataSet.FieldValues['Driver_No']);
      if driver <> nil then
      begin
        driver.isBlacklist := True;
      end;
    end
    else
    begin
      MessageBox(Handle, '设为黑名单失败!', '提示', MB_OK + MB_ICONINFORMATION);
    end;
  end;
end;

procedure TfrmDriverBlacklist.btnDisBlacklistClick(Sender: TObject);
var
  driver: PDriver;
  Res: Integer;
begin
  if grdBlacklist.DataSource = nil then Exit;
  if grdBlacklist.DataSource.DataSet.RecordCount < 1 then Exit;
  if not rowSelected then Exit;
  //if grdBlacklist.DataSource.DataSet.Bof then Exit;
  if grdBlacklist.DataSource.DataSet.FieldValues['IsBlackStr'] = '否' then
  begin
    MessageBox(Handle, '该司机未被设为黑名单!', '提示', MB_OK + MB_ICONINFORMATION);
    Exit;
  end
  else
  begin
    try
      Res := Bs.SetDriverInBlacklist(grdBlacklist.DataSource.DataSet.FieldValues['Driver_Id'], 0);
    except
      on E: Exception do
      begin
        messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
        exit;
      end;
    end;
    if Res = 1 then
    begin
      MessageBox(Handle, '解除黑名单成功!', '提示', MB_OK + MB_ICONINFORMATION);
      grdBlacklist.DataSource.Edit;
      grdBlacklist.DataSource.DataSet.FieldValues['IsBlackStr'] := '否';
      //当前司机缓存信息同步更新
      driver := ADriverManage.GetDriver(grdBlacklist.DataSource.DataSet.FieldValues['Driver_No']);
      if driver <> nil then
      begin
        driver.isBlacklist := False;
      end;
    end
    else
    begin
      MessageBox(Handle, '解除黑名单成功!', '提示', MB_OK + MB_ICONINFORMATION);
    end;
  end;
end;

procedure TfrmDriverBlacklist.btnQueryClick(Sender: TObject);
var
  xml: string;
  i: Integer;
  groupId, driverId: Integer;
begin
  try
    try
      ds1.DataSet := nil;
      if FDlgProgress = nil then
        FDlgProgress := TFrmRefreshProgress.Create(Self);

      FDlgProgress.Gauge1.Progress := 5;
      FDlgProgress.Show;
      Application.ProcessMessages;

      FDlgProgress.Gauge1.MaxValue := 10 +10;
      FDlgProgress.Gauge1.Progress := 10;
      Application.ProcessMessages;

      if cbbGroup.Text = '' then
        groupId := -1
      else
        groupId := Integer(cbbGroup.Items.Objects[cbbGroup.ItemIndex]);

      if cbbDriver.Text = '' then
        driverId := -1
      else
        driverId := Integer(cbbDriver.Items.Objects[cbbDriver.ItemIndex]);
      try
        xml := Bs.QueryDriverWithCond(group_id, driverId);
      except
        on E: Exception do
        begin
          if FDlgProgress.Showing then FDlgProgress.Hide;
          messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
          exit;
        end;
      end;
      if xml = '' then
      begin
        MessageBox(Handle, ' 查询失败，请检查网络是否正常!', '提示', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      clientDataSet.XMLData := xml;
      clientDataSet.Open;
      clientDataSet.First;
      if clientDataSet.RecordCount < 1 then
      begin
        FDlgProgress.Hide;
        MessageBox(Handle, '没有符合条件的数据!', '提示', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      ds1.DataSet := clientDataSet;
      grdBlacklist.DataSource := ds1;
      rowSelected := False;
    except
      on E: Exception do
      begin
        uGloabVar.SystemLog.AddLog('司机信息查询异常:' + E.Message);
      end;  
    end;
  finally
    if FDlgProgress.Showing then
      FDlgProgress.Hide;
  end;
end;

procedure TfrmDriverBlacklist.FormCreate(Sender: TObject);
     function ListSon(ASonId:integer;Anode:TTreeNode;leastCnt:integer):integer;
    var
      grp       : TDevGroup;
      leaf_node : TTreeNode;
      j,sonId   : integer;
    begin
      grp:= ADevGroupManage.Find(AsonId);
      leaf_node :=  treeview1.Items.AddChild(
          Anode,grp.name);
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
              Anode,grp.name);
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
begin
  TreeView1.AutoExpand := true;
  TreeView1.Items.Clear;
  if ADevGroupManage.Count = 0 then exit;
  vn_node := TreeView1.Items.add(TreeView1.topitem, '所有公司');
  vn_node.Data := Pointer(-1); //所有车辆
  vn_node.Expanded := true;
  cnt := ADevGroupManage.Count;
  group_list(0,vn_node,cnt);
  
  clientDataSet := TClientDataSet.Create(nil);
  rowSelected := False;
end;

procedure TfrmDriverBlacklist.FormDestroy(Sender: TObject);
begin
  ds1.DataSet := nil;
  ds1 := nil;
  clientDataSet.Free;
end;

procedure TfrmDriverBlacklist.FormShow(Sender: TObject);
var
  i: Integer;
begin
  cbbGroup.Clear;
  cbbGroup.Items.Add('');
  for i := 0 to ADevGroupManage.Count - 1 do
  begin
    if ADevGroupManage.Items[i].leaf_nod then
    begin
      cbbGroup.AddItem(ADevGroupManage.Items[i].Name, TObject(ADevGroupManage.Items[i].id));
    end;
  end;
  cbbGroup.ItemIndex := 0;
end;

procedure TfrmDriverBlacklist.cbbGroupChange(Sender: TObject);
var
  i: Integer;
begin
  cbbDriver.Clear;
  cbbDriver.Items.Add('');
  for i := 0 to ADriverManage.Count - 1 do
  begin
    if ADriverManage.Drivers[i].GroupID = Integer(cbbGroup.Items.Objects[cbbGroup.ItemIndex]) then
    begin
      cbbDriver.AddItem(ADriverManage.Drivers[i].Name, TObject(ADriverManage.Drivers[i].id));
    end;  
  end;
  cbbDriver.ItemIndex := 0;
end;

procedure TfrmDriverBlacklist.grdBlacklistCellClick(Column: TColumn);
begin
  rowSelected := True;
end;

procedure TfrmDriverBlacklist.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
ManualDock(nil);
end;

procedure TfrmDriverBlacklist.TreeView1Click(Sender: TObject);
var
  i: Integer;
  grpId : integer;
  devGrp: TDevGroup;
  Node: TTreeNode;
begin
  Node := TreeView1.Selected;
  if Node = nil then exit;
  grpId := Integer(Node.Data);
  PanelSelectGroupName.Caption := Node.Text;
  if grpId = -1 then
  begin
    group_id := grpId;
  end;
  if grpId = -2 then
  begin
    Exit;
  end;

  group_id := grpId;
  cbbDriver.Clear;
  cbbDriver.Items.Add('');
  for i := 0 to ADriverManage.Count - 1 do
  begin
    if ADriverManage.Drivers[i].GroupID = grpId then
    begin
      cbbDriver.AddItem(ADriverManage.Drivers[i].Name, TObject(ADriverManage.Drivers[i].id));
    end;  
  end;
  cbbDriver.ItemIndex := 0;
end;

procedure TfrmDriverBlacklist.SpeedButton4Click(Sender: TObject);
begin
  Close;
end;

end.
