unit QueryOverSpeedInfoFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ComCtrls, cxControls,
  cxSplitter, ExtCtrls, CarUnit, uGloabVar, DBClient, DB, PrnDbgeh,
  PrViewEh, Printers, EhLibADO;

type
  TQueryOverSpeedInfoFrm = class(TForm)
    PageControl1: TPageControl;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    TreeView1: TTreeView;
    PanelSelectGroupName: TPanel;
    PrintDBGridEh2: TPrintDBGridEh;
    DataSource2: TDataSource;
    ClientDataSet2: TClientDataSet;
    TabSheet3: TTabSheet;
    cxSplitter1: TcxSplitter;
    DBGridEh2: TDBGridEh;
    Panel1: TPanel;
    Label6: TLabel;
    SpeedButtonQryOverSpeed: TSpeedButton;
    Label7: TLabel;
    SpeedButtonPrintOverSpeed: TSpeedButton;
    ComboBoxCarNoOverSpeed: TComboBox;
    BitBtnExcelOverSpeed: TBitBtn;
    BitBtn2: TBitBtn;
    FromTime: TDateTimePicker;
    FromDate: TDateTimePicker;
    Label4: TLabel;
    ToDate: TDateTimePicker;
    ToTime: TDateTimePicker;
    Label5: TLabel;
    EditTimeLen: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    EditHighSpeed: TEdit;
    Label8: TLabel;
    cxSplitter2: TcxSplitter;
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure BitBtnCloseClick(Sender: TObject);
    procedure BitBtnExcelOverSpeedClick(Sender: TObject);
    procedure SpeedButtonPrintOverSpeedClick(Sender: TObject);
    procedure SpeedButtonQryOverSpeedClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditTimeLenKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure AddDev(id: integer; ANode: TTreeNode);
    procedure InitEdit;
    procedure ExpandTreeView;
    procedure ListGroup;
  public
    { Public declarations }
  end;

var
  QueryOverSpeedInfoFrm: TQueryOverSpeedInfoFrm;
  group_id: integer = -1;
  group_paranet: string = '';
  ExcelApp, MyWorkbook: oleVariant;
implementation
uses ComObj,DateUtils,umainf;
{$R *.dfm}

procedure TQueryOverSpeedInfoFrm.AddDev(id: integer; ANode: TTreeNode);
var
  i: integer;
  node: TTreeNode;
  dev: TDevice;
begin
  try
    //ComboBoxCarNoOverSpeed.Clear;
    ComboBoxCarNoOverSpeed.ItemIndex := -1;

    for i := 0 to ADeviceManage.Count - 1 do
    begin
      dev := ADeviceManage.Items[i];
      if dev = nil then Continue;
      if dev.GroupID= id then
      begin
        ComboBoxCarNoOverSpeed.Items.AddObject(dev.Car.No,dev);
      end;
    end; 
  finally
  end;
end;

procedure TQueryOverSpeedInfoFrm.ExpandTreeView;
var
  i: integer;
begin
  for i := 0 to TreeView1.Items.Count - 1 do
    TreeView1.Items[i].Expanded := True;

end;

procedure TQueryOverSpeedInfoFrm.InitEdit;
begin
  ComboBoxCarNoOverspeed.clear;

  FromDate.date := IncMonth(now, -1);
  ToDate.date := now;
  FromTime.Time := EncodeTime(0,0,0,0);
  ToTime.Time := EncodeTime(23,59,59,59);

  PageControl1.ActivePageIndex := 0;
  EditTimeLen.Text := '60';
  EditHighSpeed.Text := '200';
end;

procedure TQueryOverSpeedInfoFrm.ListGroup;
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
    sonId: integer; //�Ӽ��� ��ID
    leaf_node: TTreenode; //�Ӽ��Ľڵ�
    grp: TDevGroup;
  begin
    for i := 0 to ADevGroupManage.Count - 1 do
    begin
      if Acurrent_cnt = 0 then exit;
      grp := ADevGroupManage.Items[i];
          //�г�����--��Ϊ0
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
  vn_node := TreeView1.Items.add(TreeView1.topitem, '���г���');
  vn_node.Data := Pointer(-1); //���г���
  vn_node.Expanded := true;
  cnt := ADevGroupManage.Count;
  group_list(0, vn_node, cnt);
  ExpandTreeView;

end;

procedure TQueryOverSpeedInfoFrm.FormCreate(Sender: TObject);
begin
  InitEdit;
  ListGroup;
  PanelSelectGroupName.Caption := '���г���';
  DBGridEh2.Columns[3].Visible := umainf.Mainf.SetAreaAlarmToDev.Visible; //����������һ���Ƿ񿴵�
end;

procedure TQueryOverSpeedInfoFrm.TreeView1Click(Sender: TObject);
var
  devGrp: TDevGroup;
  Node: TTreeNode;
  i: integer;
begin
  Node := TreeView1.Selected;
  if Node = nil then exit;
  PanelSelectGroupName.Caption := Node.Text;
  group_id := Integer(Node.Data);
 
  ComboBoxCarNoOverSpeed.Clear;
  if (group_id >= 0) then //and (not IsClickDev) and (grpId <> clickParent) then
  begin
    AddDev(group_id, Node);
    devGrp := ADevGroupManage.find(group_id);
    if not devGrp.leaf_nod then //==  ˵�����ڵ�
    begin
      if devGrp.SonList.Count > 0 then
      begin
        for i := 0 to devGrp.SonList.Count - 1 do
        begin
          AddDev(devgrp.SonListItems[i], Node);
          if i = 0 then
            group_paranet := inttostr(devgrp.SonListItems[i])
          else
            group_paranet := group_paranet + ',' + inttostr(devgrp.SonListItems[i]);
        end;
      end
      else
        group_paranet:='';
    end;
  end;
end;

procedure TQueryOverSpeedInfoFrm.SpeedButton4Click(Sender: TObject);
begin
  close;
end;

procedure TQueryOverSpeedInfoFrm.BitBtnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TQueryOverSpeedInfoFrm.BitBtnExcelOverSpeedClick(Sender: TObject);
var
  i, j: Integer;
  s: string;
  Str: string;
  fromDatetime, toDatetime: string;
  tmpStr: string;
begin
  if ClientDataSet2.RecordCount =0 then exit;
  screen.Cursor := crHourGlass;
  try
    try
      ExcelApp := CreateOleObject('Excel.Application');
      MyWorkbook := CreateOleObject('Excel.Sheet');
    except
      on Exception do raise Exception.Create('�޷�����EXCEL!��ȷ���Ѱ�װ!')
    end;
    try
      ExcelApp.Visible := true;
    //����һ��������
      MyWorkbook := ExcelApp.workBooks.add;
    //��Ԫ��ϲ�
      MyWorkbook.worksheets[1].range['A1:H1'].Merge(true);
    //��Ԫ�����
      MyWorkbook.worksheets[1].range['A1:H2'].HorizontalAlignment := $FFFFEFF4;
    //����ͷ
      if group_id <>-1 then
        s:= ADevGroupManage.Find(group_id).Name;
      if ComboBoxCarNoOverSpeed.Text <>'' then
        s:= s+ '['+ComboBoxCarNoOverSpeed.Text+']'
      else
        s:= s+ '[ȫ������]';
      fromDatetime :=FormatDatetime('yyyy-mm-dd ',fromDate.Date)+FormatDatetime('hh:nn:ss',fromTime.Time);
      toDatetime:=FormatDatetime('yyyy-mm-dd ',toDate.Date)+FormatDatetime('hh:nn:ss',toTime.Time);
      Str := fromDatetime+ '��' + toDatetime +s+ ' ���ٱ�����ѯ';

      MyWorkbook.worksheets[1].Cells[1, 1].value := Str;
    //��ͷ
      i := 2;
      for j := 1 to DBGridEh2.Columns.Count do
      begin
        if not DBGridEh2.Columns.Items[j-1].Visible then continue;
        MyWorkbook.worksheets[1].Cells[i, j].value := DBGridEh2.Columns.Items[j-1].Title.Caption;
      end;
    //������ɫ
      MyWorkbook.worksheets[1].range['A1:H2'].Font.Color := clBlue;
    //����
      MyWorkbook.worksheets[1].range['A1:H1'].Font.Name := '����';
    //�ֺ�
      MyWorkbook.worksheets[1].range['A1:H1'].Font.Size := 18;
    //ȡ��
      i := 3;
      ClientDataSet2.First;
      while not ClientDataSet2.Eof do
      begin
        for j := 1 to  DBGridEh2.Columns.Count do
        begin
          if not DBGridEh2.Columns.Items[j-1].Visible then continue;
          tmpStr := DBGridEh2.Columns.Items[j-1].FieldName;
          MyWorkbook.worksheets[1].Cells[i, j].value := ClientDataSet2.FieldValues[tmpStr];
        end;
        ClientDataSet2.Next;
        Inc(i);
      end;

      //����ϼ��� sha 20081118
      MyWorkbook.worksheets[1].Cells[i, 1].value :='�ϼ�:';
      MyWorkbook.worksheets[1].Cells[i, 2].value := DBGridEh2.Columns[1].Footer.SumValue;
          //���õ�Ԫ���ʽ
      MyWorkbook.worksheets[1].range['B'+IntToStr(ClientDataSet2.RecordCount+3)+':B'+IntToStr(ClientDataSet2.RecordCount+3)].NumberFormatLocal := '0';
    //�����п�
      MyWorkbook.worksheets[1].Columns[1].ColumnWidth := 12;
      MyWorkbook.worksheets[1].Columns[2].ColumnWidth := 18;
      MyWorkbook.worksheets[1].Columns[3].ColumnWidth := 18;
      for j := 4 to DBGridEh2.Columns.Count do
        MyWorkbook.worksheets[1].Columns[j].ColumnWidth := 12;  
    //�����и�
      MyWorkbook.worksheets[1].Rows[1].RowHeight := 50;
    //����ͷ����
      MyWorkbook.worksheets[1].Rows[1].VerticalAlignment := $FFFFEFF4;
    {//��������������
      s := 'A1:K' + inttostr(ClientDataSet1.RecordCount - 2);
      MyWorkbook.worksheets[1].range[s].Font.Name := '����';
    //������
      s := 'A2:K' + inttostr(ClientDataSet1.RecordCount + 2);
      MyWorkbook.worksheets[1].range[s].Borders.LineStyle := 1;  }
    //����ҳ��
      MyWorkbook.worksheets[1].PageSetup.CenterHorizontally := true;
      MyWorkbook.worksheets[1].PageSetup.PrintTitleRows := 'A1';
      MyWorkbook.worksheets[1].PageSetup.PaperSize := $9;
    except
    end;
  finally
    screen.Cursor := crDefault;
  end;
end;

procedure TQueryOverSpeedInfoFrm.SpeedButtonPrintOverSpeedClick(Sender: TObject);
var
  str,s: string;
  fromDatetime:string;
  toDatetime:string;
begin
  try
    s := '';
    if group_id <>-1 then
      s:= ADevGroupManage.Find(group_id).Name;
    if ComboBoxCarNoOverSpeed.Text <>'' then
      s:= s+ '['+ComboBoxCarNoOverSpeed.Text+']'
    else
      s:= s+ '[ȫ������]';

    fromDatetime :=FormatDatetime('yyyy-mm-dd ',fromDate.Date)+FormatDatetime('hh:nn:ss',fromTime.Time);
    toDatetime:=FormatDatetime('yyyy-mm-dd ',toDate.Date)+FormatDatetime('hh:nn:ss',toTime.Time);
    Str := s+ '���ٱ�����ϸ����'+#13#10#13#10+'ʱ�䣺'+fromDatetime + '��' + toDatetime;
    PrintDBGridEh2.PageHeader.CenterText.Clear;
    PrintDBGridEh2.PageHeader.CenterText.add(Str);  
    PrintDBGridEh2.PageFooter.LeftText.Clear;
    PrintDBGridEh2.PageFooter.LeftText.Add('��ӡʱ�䣺'+FormatDateTime('yyyy-mm-dd hh:nn',now));
    PrintDBGridEh2.PageFooter.RightText.Clear;
    PrintDBGridEh2.PageFooter.RightText.Add(ReportFooter);
    PrinterPreview.Previewer.ViewMode := vmPageWidth;
    PrinterPreview.Orientation := poPortrait;
    PrintDBGridEh2.PageFooter.CenterText.Clear;
    PrintDBGridEh2.PageFooter.CenterText.Add('��&[Page]ҳ����&[Pages]ҳ');   
    PrintDBGridEh2.Preview;
  except
  end;
end;

procedure TQueryOverSpeedInfoFrm.SpeedButtonQryOverSpeedClick(Sender: TObject);
var
  fromDatetime:string;
  toDatetime:string;
  ind:integer;
  IDStr:string;
  dev: TDevice;
  dataset:TClientDataSet;
begin
  SpeedButtonQryOverSpeed.Enabled := False;
  try
    fromDatetime :=FormatDatetime('yyyy-mm-dd ',fromDate.Date)+FormatDatetime('hh:nn:ss',fromTime.Time);
    toDatetime:=FormatDatetime('yyyy-mm-dd ',toDate.Date)+FormatDatetime('hh:nn:ss',toTime.Time);
    IDStr := '';
    if ComboBoxCarNoOverSpeed.Text<>'' then
    begin
      ind:=ComboBoxCarNoOverSpeed.Items.IndexOf(ComboBoxCarNoOverSpeed.Text);
      dev:=TDevice(ComboBoxCarNoOverSpeed.Items.Objects[ind]);
      if dev<>nil then
        IDstr:=dev.IdStr;
    end;
    if Trim(EditTimeLen.Text)='' then EditTimeLen.Text := '0';

    DataSource2.Enabled := false;
    dataset := BS.QueryOverSpeedInfo(fromDatetime,toDatetime,IDstr,group_id, group_paranet);
    ClientDataSet2.Data := dataset.Data;
    ClientDataSet2.Filter:= 'TimeLen>='+Trim(EditTimeLen.Text);
    if Trim(EditHighSpeed.Text)<>'' then 
      ClientDataSet2.Filter := ClientDataSet2.Filter + ' and highspeed<='+Trim(EditHighSpeed.Text);
    ClientDataSet2.Filtered := True;
    DataSource2.Enabled := true;
    group_paranet := '';
  finally
    SpeedButtonQryOverSpeed.Enabled :=True;
  end;
end;

procedure TQueryOverSpeedInfoFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    ManualDock(nil);
end;

procedure TQueryOverSpeedInfoFrm.EditTimeLenKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then
    key := #0;
end;

end.

