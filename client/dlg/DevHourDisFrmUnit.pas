unit DevHourDisFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ComCtrls, cxControls,
  cxSplitter, ExtCtrls, CarUnit, uGloabVar, DBClient, DB, PrnDbgeh,
  PrViewEh, Printers,EhLibADO;

type
  TDevHourDisFrm = class(TForm)
    Panel7: TPanel;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    TreeView1: TTreeView;
    cxSplitter1: TcxSplitter;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    Panel3: TPanel;
    Label5: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    ComboBoxCarNo: TComboBox;
    Panel4: TPanel;
    DBGridEh1: TDBGridEh;
    cxSplitter2: TcxSplitter;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    PrintDBGridEh1: TPrintDBGridEh;
    TabSheet3: TTabSheet;
    Panel1: TPanel;
    Panel5: TPanel;
    Label4: TLabel;
    SpeedButtonMonthTj: TSpeedButton;
    Label6: TLabel;
    SpeedButtonPrintMonthTj: TSpeedButton;
    SpeedButton6: TSpeedButton;
    ComboBoxTjCarNo: TComboBox;
    Panel6: TPanel;
    cxSplitter3: TcxSplitter;
    DataSource2: TDataSource;
    ClientDataSet2: TClientDataSet;
    ComboBoxTjYf: TComboBox;
    PrintDBGridEh2: TPrintDBGridEh;
    PanelSelectGroupName: TPanel;
    DBGridEh2: TDBGridEh;
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButtonMonthTjClick(Sender: TObject);
    procedure SpeedButtonPrintMonthTjClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure AddDev(id: integer; ANode: TTreeNode);
    procedure InitEdit;
    procedure ExpandTreeView;
    procedure ListGroup;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DevHourDisFrm: TDevHourDisFrm;
  group_id: integer = -1;
implementation
uses DateUtils;
{$R *.dfm}

procedure TDevHourDisFrm.FormCreate(Sender: TObject);
begin
  InitEdit;
  ListGroup;
  PageControl1.ActivePage := TabSheet1;
  PanelSelectGroupName.Caption :='所有车辆';
end;

procedure TDevHourDisFrm.ListGroup;
  function ListSon(ASonId: integer; Anode: TTreeNode; leastCnt: integer): integer;
  var
    grp: TDevGroup;
    leaf_node: TTreeNode;
    j, sonId: integer;
  begin
    grp := ADevGroupManage.Find(AsonId);
    leaf_node := treeview1.Items.AddChild(
      Anode, grp.name + '(' + inttostr(grp.DevListCount) + ')');
    leaf_node.Data := pointer(grp.Id);
    leastCnt := leastCnt - 1;
    result := leastCnt;
    if leastCnt = 0 then exit;

    if not grp.leaf_nod then
      for j := 0 to grp.SonListCount - 1 do
      begin
        sonId := grp.SonList[j];
        ListSon(sonId, leaf_node, leastCnt);
      end;
  end;
  procedure group_list(AParant_ID: integer; Anode: TTreenode; Acurrent_cnt: integer);
  var
    i, j: integer;
    sonId: integer; //子级的 组ID
    leaf_node: TTreenode; //子级的节点
    grp: TDevGroup;
  begin
    for i := 0 to ADevGroupManage.Count - 1 do
    begin
      if Acurrent_cnt = 0 then exit;
      grp := ADevGroupManage.Items[i];
          //列出大组--父为0
      if grp.parent = AParant_ID then
      begin
        leaf_node := treeview1.Items.AddChild(
          Anode, grp.name + '(' + inttostr(grp.DevListCount) + ')');
        leaf_node.Data := pointer(grp.Id);
        Acurrent_cnt := Acurrent_cnt - 1;
        if Acurrent_cnt = 0 then exit;

        if not grp.leaf_nod then
          for j := 0 to grp.SonListCount - 1 do
          begin
            sonId := grp.SonList[j];
            Acurrent_cnt := ListSon(sonId, leaf_node, Acurrent_cnt);
          end;
      end;
    end;
  end;
var
  vn_node: TTreeNode;
  cnt: integer;
  j: integer;
begin
 {*******************************}
  TreeView1.AutoExpand := true;
  TreeView1.Items.Clear;
  if ADevGroupManage.Count = 0 then exit;
  vn_node := TreeView1.Items.add(TreeView1.topitem, '所有车辆');
  vn_node.Data := Pointer(-1); //所有车辆
  vn_node.Expanded := true;
  cnt := ADevGroupManage.Count;
  group_list(0, vn_node, cnt);
  ExpandTreeView;
end;


procedure TDevHourDisFrm.ExpandTreeView;
var
  i: integer;
begin
  for i:= 0 to TreeView1.Items.Count -1 do
    TreeView1.Items[i].Expanded := True;
end;

procedure TDevHourDisFrm.InitEdit;
var
  i: integer;
begin
  DateTimePicker2.date := now;
  DateTimePicker1.date := IncMonth(now, -1);
  ComboBoxCarNo.Clear;
  ComboBoxTjCarNo.Clear;
  ComboBoxTjYf.Clear;
  for i:= 0 to 23 do
    ComboBoxTjYf.Items.Add(FormatDateTime('yyyy-mm', IncMonth(now,-i)));
  ComboBoxTjYf.ItemIndex := 0;
end;

procedure TDevHourDisFrm.TreeView1Click(Sender: TObject);
var
  devGrp: TDevGroup;
  Node: TTreeNode;
begin
  Node := TreeView1.Selected;
  if Node = nil then exit;
  PanelSelectGroupName.Caption := Node.Text;
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

procedure TDevHourDisFrm.AddDev(id: integer; ANode: TTreeNode);
var
  i: integer;
  dev: TDevice;
begin
  try
    ComboBoxCarNo.Items.Clear;
    ComboBoxCarNo.ItemIndex := -1;
    ComboBoxTjCarNo.Items.Clear;
    ComboBoxTjCarNo.ItemIndex := -1;

    for i := 0 to ADeviceManage.Count - 1 do
    begin
      dev := ADeviceManage.Items[i];
      if dev = nil then Continue;
      if dev.GroupID= id then
      begin
        ComboboxCarNO.Items.AddObject(dev.Car.No,dev);
        ComboBoxTjCarNo.Items.AddObject(dev.Car.No,dev);
      end;
    end;
  finally
  end;
end;

procedure TDevHourDisFrm.SpeedButton4Click(Sender: TObject);
begin
  close;
end;

procedure TDevHourDisFrm.SpeedButton1Click(Sender: TObject);
var
  fromDate, toDate: string;
  dev:TDevice;
  aCarNo:String;
begin
  fromDate := FormatDateTime('yyyy-mm-dd', DateTimePicker1.Date);
  toDate := FormatDateTime('yyyy-mm-dd',IncDay(DateTimePicker2.Date,1));

  aCarNo := '';
  try
    if ComboBoxCarNo.Text <> '' then
    begin
      dev := TDevice(ComboBoxCarNo.Items.Objects[ComboBoxCarNo.ItemIndex]);
      if dev <> nil then
        aCarNo := dev.CarNoDeleteDevName
      else
        aCarNo := '';
    end;
  except
    aCarNo := '';
  end;    

  DataSource1.Enabled := false;
  ClientDataSet1.Data := BS.QueryDevHourDis(aCarNo, fromDate, toDate, group_id);
  DataSource1.Enabled := true;
end;

procedure TDevHourDisFrm.SpeedButton3Click(Sender: TObject);
var
  s: string;
begin
  try
    if group_id <>-1 then
      s:= ADevGroupManage.Find(group_id).Name;
    if ComboBoxCarNo.Text <>'' then
      s:= s+ '['+ComboBoxCarNo.Text+']'
    else
      s:= s+ '[全部车辆]';
    s := s + FormatDateTime('yyyy-mm-dd', DateTimePicker1.Date) + '至' +
      FormatDateTime('yyyy-mm-dd', DateTimePicker2.Date) + ' 车辆每小时行驶里程明细';
    PrintDBGridEh1.PageHeader.CenterText.Clear;
    PrintDBGridEh1.PageHeader.CenterText.add(s);
    PrintDBGridEh1.PageFooter.LeftText.Clear;
    PrintDBGridEh1.PageFooter.LeftText.Add('打印时间：'+FormatDateTime('yyyy-mm-dd hh:nn',now));
    PrintDBGridEh1.PageFooter.RightText.Clear;
    PrintDBGridEh1.PageFooter.RightText.Add(ReportFooter);
    PrinterPreview.Previewer.ViewMode := vmPageWidth;
    PrinterPreview.Orientation := poPortrait;
    PrintDBGridEh1.PageFooter.CenterText.Clear;
    PrintDBGridEh1.PageFooter.CenterText.Add('第&[Page]页，共&[Pages]页');
    PrintDBGridEh1.Preview;
  except
  end;
end;

procedure TDevHourDisFrm.SpeedButtonMonthTjClick(Sender: TObject);
var
  dev:TDevice;
  aCarNo:String;
begin
  aCarNo := '';
  try
    if ComboBoxCarNo.Text <> '' then
    begin
      dev := TDevice(ComboBoxCarNo.Items.Objects[ComboBoxCarNo.ItemIndex]);
      if dev <> nil then
        aCarNo := dev.CarNoDeleteDevName
      else
        aCarNo := '';
    end;
  except
    aCarNo := '';
  end;

  DataSource2.Enabled := false;
  ClientDataSet2.Data := BS.QueryDevMonthDis(aCarNo,ComboBoxTjYf.Text, group_id);
  DataSource2.Enabled := true;
end;

procedure TDevHourDisFrm.SpeedButtonPrintMonthTjClick(Sender: TObject);
var
  s: string;
begin
  try
    if group_id <>-1 then
      s:= ADevGroupManage.Find(group_id).Name;
    if ComboBoxTjCarNo.Text <>'' then
      s:= s+ '['+ComboBoxTjCarNo.Text+']'
    else
      s:= s+ '[全部车辆]';
    if ComboBoxTjYf.Text<> '' then s:= s + ComboBoxTjYf.Text+'月份';
    s := s + ' 车辆行驶里程统计';
    PrintDBGridEh2.PageHeader.CenterText.Clear;
    PrintDBGridEh2.PageHeader.CenterText.add(s);
    PrintDBGridEh2.PageFooter.LeftText.Clear;
    PrintDBGridEh2.PageFooter.LeftText.Add('打印时间：'+FormatDateTime('yyyy-mm-dd hh:nn',now));
    PrintDBGridEh2.PageFooter.RightText.Clear;
    PrintDBGridEh2.PageFooter.RightText.Add(ReportFooter);
    PrinterPreview.Previewer.ViewMode := vmPageWidth;
    PrinterPreview.Orientation := poPortrait;
    PrintDBGridEh2.PageFooter.CenterText.Clear;
    PrintDBGridEh2.PageFooter.CenterText.Add('第&[Page]页，共&[Pages]页');
    PrintDBGridEh2.Preview;
  except
  end;
end;

procedure TDevHourDisFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ManualDock(nil);
end;

end.
