unit FrmQueryDevGroupOnlineUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxInplaceContainer, StdCtrls, Mask, RzEdit, RzButton, ComCtrls, Buttons,
  cxControls, cxSplitter, ExtCtrls, DBClient;

type
  TfrmQueryDevGroupOnline = class(TForm)
    Panel7: TPanel;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    TreeView1: TTreeView;
    cxSplitter3: TcxSplitter;
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    Panel3: TPanel;
    btnQuery: TSpeedButton;
    Label2: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    BitBtnToExcel: TBitBtn;
    BitBtn2: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    Panel4: TPanel;
    Panel5: TPanel;
    lblAlarmDataCountTip: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    cbxPageSize: TComboBox;
    btnPageFirst: TRzButton;
    btnPagePrevious: TRzButton;
    btnPageNext: TRzButton;
    btnPageLast: TRzButton;
    edtCurrPageNo: TRzEdit;
    edtTotalPageCount: TRzEdit;
    cxTreeList1: TcxTreeList;
    cxSplitter2: TcxSplitter;
    cxTreeList1cxTreeListColumn1: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn2: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn3: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn4: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn5: TcxTreeListColumn;
    edtDevGroupName: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure BitBtnToExcelClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FTemp: TClientDataSet;

    procedure refreshTotalDataCount();
    procedure refreshPageNo();

    procedure GetQueryReturnInfo(Info: OleVariant);
  public
    { Public declarations }
  end;

var
  group_id: Integer = -1;
  queryGroupId: Integer = -1;
  querySonGroupList: string = '';
  querySTime: string;
  queryETime: string;

  pageSize: Integer = 20;     //每页大小
  totalPageCount: Integer = 0;//总页数
  currPageNo: Integer = 0;    //当前页码
  totalDataCount: Integer = 0;//总记录数

implementation

uses
  uGloabVar, CarUnit, QueryThreadUnit, ComObj;

{$R *.dfm}

procedure ExportToExcel(Caption: string; LvData: TcxTreeList);
var
  ExlApp: Variant;
  i, j: Integer;
begin
  try
    ExlApp := CreateOleObject('Excel.Application');
    ExlApp.Workbooks.Add;
    ExlApp.Visible := True;
    ExlApp.Caption := Caption;
    ExlApp.Workbooks[1].WorkSheets[1].Rows[1].Font.Bold := True;
  except
    on E: Exception do
    begin
      Application.MessageBox(PChar('初始化Microsoft Excel失败:' + E.Message), '提示', MB_OK + MB_ICONERROR);
      ExlApp.Quit;
      Exit;
    end;
  end;

  Application.Restore;
  Application.BringToFront;

  for i := 0 to LvData.ColumnCount - 1 do
  begin
    ExlApp.Cells(1, i + 1) := LvData.Columns[i].Caption.Text;
    if not LvData.Columns[i].Visible then
      ExlApp.ActiveSheet.Columns[i + 1].Hidden := True;
  end;

  for i := 0 to LvData.Count - 1 do
  begin
    for j := 0 to LvData.Items[i].ValueCount-1 do
    begin
      ExlApp.Cells[i + 2, j+1 ] := LvData.Items[i].Values[j];
    end;
  end;
  //设置格式和宽度
  ExlApp.range['B2:B'+inttostr(LvData.Count+1)].NumberFormatLocal := 'yyyy-mm-dd hh:mm:ss';
  ExlApp.Columns[1].ColumnWidth :=12;
  ExlApp.Columns[2].ColumnWidth :=20;
//  ExlApp.Columns[9].ColumnWidth :=15;
end;

procedure TfrmQueryDevGroupOnline.FormCreate(Sender: TObject);
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
  i,j:integer;
  vn_node: TTreeNode;
  cnt: integer;
begin

  TreeView1.AutoExpand := true;
  TreeView1.Items.Clear;
  if ADevGroupManage.Count = 0 then exit;
  vn_node := TreeView1.Items.add(TreeView1.topitem, '所有车组');
  vn_node.Data := Pointer(-1); //所有车辆
  vn_node.Expanded := true;
  cnt := ADevGroupManage.Count;
  group_list(0,vn_node,cnt);

  DateTimePicker1.Date:=now;
  DateTimePicker2.Time:=StrToTime('00:00:00');
  DateTimePicker3.Date:=now;
  DateTimePicker4.Time:=StrToTime('23:59:59');

  FTemp := TClientDataSet.Create(nil);
end;

procedure TfrmQueryDevGroupOnline.FormDestroy(Sender: TObject);
begin
  FTemp.Free;
end;

procedure TfrmQueryDevGroupOnline.TreeView1Click(Sender: TObject);
var
  devGrp: TDevGroup;
  Node: TTreeNode;
begin
  Node := TreeView1.Selected;
  if Node = nil then exit;
  edtDevGroupName.Text := '';
  group_id := Integer(Node.Data);
  devGrp := ADevGroupManage.find(group_id);
  if devGrp <> nil then
  begin
    if devGrp.leaf_nod then
      edtDevGroupName.Text := devGrp.Name;
  end;
end;

procedure TfrmQueryDevGroupOnline.btnQueryClick(Sender: TObject);
var
  fromDate, ToDate: TDateTime;
  devGroup: TDevGroup;
  queryCountThread: TQueryDataThread;
begin
  if edtDevGroupName.Text = '' then
  begin
    ShowTips('请在左边选择车辆组', edtDevGroupName);
    Exit;
  end;

  fromDate := DateTimePicker1.Date;
  ReplaceTime(fromDate, DateTimePicker2.Time);

  ToDate := DateTimePicker3.Date;
  ReplaceTime(ToDate, DateTimePicker4.Time);

  if FromDate > ToDate then
  begin
    ShowTips('开始日期应小于结束日期，请检查！', DateTimePicker3);
    DateTimePicker3.SetFocus;
    exit;
  end;

  if ToDate - fromDate > 1 then
  begin
    ShowTips('查询车组在线率时间跨度不能超过1天，请确认', DateTimePicker4);
    DateTimePicker4.SetFocus;
    Exit;
  end;  

  queryGroupId := group_id;
//  if queryGroupId > 0 then
//  begin
//    devGroup := ADevGroupManage.find(queryGroupId);
//    if devGroup <> nil then
//    begin
//      if not devGroup.leaf_nod then
//        querySonGroupList := getSonGroupIdList(queryGroupId);
//    end
//    else
//    begin
//      querySonGroupList := '';
//    end;    
//  end
//  else
//  begin
//    queryGroupId := -1;
//    querySonGroupList := getSonGroupIdList(0);
//  end;
//  if querySonGroupList <> '' then
//    queryGroupId := -1;

  querySTime := FormatDateTime('yyyy-MM-dd hh:nn:ss', fromDate);
  queryETime := FormatDateTime('yyyy-MM-dd hh:nn:ss', ToDate);

//  totalDataCount := 0;
//  totalPageCount := 0;
//  currPageNo := 0;
//  refreshTotalDataCount;
//  refreshPageNo;
  cxTreeList1.Clear;
  queryCountThread := TQueryDataThread.Create(querySTime, queryETime, queryGroupId, querySonGroupList);
  queryCountThread.OnQueryReturn := GetQueryReturnInfo;
end;

procedure TfrmQueryDevGroupOnline.refreshPageNo;
begin
  edtCurrPageNo.Text := IntToStr(currPageNo);
  edtTotalPageCount.Text := IntToStr(totalPageCount);
end;

procedure TfrmQueryDevGroupOnline.refreshTotalDataCount;
begin
  lblAlarmDataCountTip.Caption := '共' + IntToStr(totalDataCount) + '条记录';
end;

procedure TfrmQueryDevGroupOnline.GetQueryReturnInfo(Info: OleVariant);
var
  i: Integer;
begin
  if (Info = null) or (Length(info) = 0) then  Exit;

  FTemp.XMLData := Info;
  FTemp.Open;
  FTemp.First;

  for i:= 0 to FTemp.RecordCount - 1 do
  begin
    with cxTreeList1.Add do
    begin
      Values[0] := FTemp.FieldByName('group_name').AsString;
      Values[1] := FTemp.FieldByName('stime').AsString;
      Values[2] := FTemp.FieldByName('inlinedevnum').AsString;
      Values[3] := FTemp.FieldByName('groupdevnum').AsInteger;
      Values[4] := FormatFloat('#0.00', FTemp.FieldByName('percentage').AsFloat) + '%';
    end;
    FTemp.Next;
  end;
end;

procedure TfrmQueryDevGroupOnline.BitBtnToExcelClick(Sender: TObject);
begin
  ExportToExcel('车辆组在线率统计', cxTreeList1);
end;

procedure TfrmQueryDevGroupOnline.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmQueryDevGroupOnline.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ManualDock(nil);
end;

end.
