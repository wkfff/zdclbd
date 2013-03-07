unit QueryEmergncyAlarmFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ComCtrls, cxControls,
  cxSplitter, ExtCtrls, CarUnit, uGloabVar, DBClient, DB, PrnDbgeh,
  PrViewEh, Printers, EhLibADO;

type
  {//�鿴 ��������ʱ��ϸ�������Ƭ��¼�� }
  TSeeEmergncyAlarmDetailEvent = procedure(ADevIdStr:String;AStartTime,ARemoveTime:String;
    AStartLongi,AStartLati,ARemoveLongi,ARemoveLati:Double) of object;
    
  TQueryEmergncyAlarmFrm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel3: TPanel;
    SpeedButtonTjDay: TSpeedButton;
    SpeedButtonPrintDay: TSpeedButton;
    Panel4: TPanel;
    cxSplitter2: TcxSplitter;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    TreeView1: TTreeView;
    PanelSelectGroupName: TPanel;
    DataSource1: TDataSource;
    PrintDBGridEh1: TPrintDBGridEh;
    ClientDataSet1: TClientDataSet;
    BitButtonExcelDay: TBitBtn;
    BitBtnClose: TBitBtn;
    Label1: TLabel;
    ComboBoxCarNoDay: TComboBox;
    DBGridEh1: TDBGridEh;
    Label7: TLabel;
    Label4: TLabel;
    FromTime: TDateTimePicker;
    FromDate: TDateTimePicker;
    ToDate: TDateTimePicker;
    ToTime: TDateTimePicker;
    cxSplitter1: TcxSplitter;
    procedure SpeedButtonTjDayClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure SpeedButtonPrintDayClick(Sender: TObject);
    procedure BitBtnCloseClick(Sender: TObject);
    procedure BitButtonExcelDayClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    FOnSeeEmergncyAlarmDetailEvent: TSeeEmergncyAlarmDetailEvent;
    { Private declarations }
    procedure InitEdit;
    procedure ExpandTreeView;
    procedure ListGroup;
    procedure AddDev(id: integer; ANode: TTreeNode);
    procedure SetOnSeeEmergncyAlarmDetailEvent(
      const Value: TSeeEmergncyAlarmDetailEvent);
  public
    { Public declarations }
    property OnSeeEmergncyAlarmDetailEvent:TSeeEmergncyAlarmDetailEvent read FOnSeeEmergncyAlarmDetailEvent write SetOnSeeEmergncyAlarmDetailEvent;
  end;

var
  QueryEmergncyAlarmFrm: TQueryEmergncyAlarmFrm;
  group_id: integer = -1;
  group_paranet: string = '';
  ExcelApp, MyWorkbook: oleVariant;
implementation
uses ComObj,DateUtils;
{$R *.dfm}


procedure TQueryEmergncyAlarmFrm.ExpandTreeView;
var
  i: integer;
begin
  for i := 0 to TreeView1.Items.Count - 1 do
    TreeView1.Items[i].Expanded := True;
end;

procedure TQueryEmergncyAlarmFrm.InitEdit;
var
  i: Integer;
begin
  FromDate.date := IncMonth(now, -1);
  ToDate.date := now;
  FromTime.Time := EncodeTime(0,0,0,0);
  ToTime.Time := EncodeTime(23,59,59,59);
  PageControl1.ActivePageIndex := 0;
end;

procedure TQueryEmergncyAlarmFrm.ListGroup;
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

procedure TQueryEmergncyAlarmFrm.SpeedButtonTjDayClick(Sender: TObject);
var
  fromDatetime, toDatetime: string;
  car_id : Integer;
  dev: TDevice;
begin
  TSpeedButton(Sender).Enabled := False;
  try
    fromDatetime :=FormatDatetime('yyyy-mm-dd ',fromDate.Date)+FormatDatetime('hh:nn:ss',fromTime.Time);
    toDatetime:=FormatDatetime('yyyy-mm-dd ',toDate.Date)+FormatDatetime('hh:nn:ss',toTime.Time);

    if ComboBoxCarNoDay.Text ='' then
      car_id := -1
    else
    begin
      dev:=TDevice(ComboBoxCarNoDay.Items.Objects[ComboBoxCarNoDay.ItemIndex]);
      car_Id := dev.Car.id;
    end;

    DataSource1.Enabled := false;
    ClientDataSet1.Data := BS.QueryEmergencyAlarm(fromDatetime, toDatetime,car_id,group_id, group_paranet);
    DataSource1.Enabled := true;
    group_paranet := '';
  finally
    TSpeedButton(Sender).Enabled :=True;
  end;
end;

procedure TQueryEmergncyAlarmFrm.FormCreate(Sender: TObject);
begin
  InitEdit;
  ListGroup;
  PageControl1.ActivePageIndex := 0;
  PanelSelectGroupName.Caption := '���г���';
end;

procedure TQueryEmergncyAlarmFrm.TreeView1Click(Sender: TObject);
var
  devGrp: TDevGroup;
  Node: TTreeNode;
  i:integer;
begin
  Node := TreeView1.Selected;
  if Node = nil then exit;
  PanelSelectGroupName.Caption := Node.Text;
  group_id := Integer(Node.Data);
  ComboBoxCarNoDay.Clear;
  if (group_id >= 0) then
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
          begin
            group_paranet := inttostr(devgrp.SonListItems[i]);
          end else
          begin
            group_paranet := group_paranet + ',' + inttostr(devgrp.SonListItems[i]);
          end;
        end;
      end else
      begin
        group_paranet := '';
      end;
    end;   
  end;
end;

procedure TQueryEmergncyAlarmFrm.AddDev(id: integer; ANode: TTreeNode);
var
  i: integer;
  dev: TDevice;
begin
  try
    //ComboBoxCarNoDay.Clear;
    for i := 0 to ADeviceManage.Count - 1 do
    begin
      dev := ADeviceManage.Items[i];
      if dev = nil then Continue;
      if dev.GroupID= id then
      begin
        ComboBoxCarNoDay.Items.AddObject(dev.Car.No,dev);
      end;
    end; 
  finally
  end;
end;

procedure TQueryEmergncyAlarmFrm.SpeedButtonPrintDayClick(Sender: TObject);
var
  str,s,fromDatetime,toDatetime: string;
begin
  try
    if group_id <>-1 then
      s:= ADevGroupManage.Find(group_id).Name;
    if ComboBoxCarNoDay.Text <>'' then
      s:= s+ '['+ComboBoxCarNoDay.Text+']'
    else
      s:= s+ '[ȫ������]';
    fromDatetime :=FormatDatetime('yyyy-mm-dd ',fromDate.Date)+FormatDatetime('hh:nn:ss',fromTime.Time);
    toDatetime:= FormatDatetime('yyyy-mm-dd ',toDate.Date)+FormatDatetime('hh:nn:ss',toTime.Time);
    str := s+ ' ������������'+#13#10#13#10+'ʱ�Σ�'+fromDatetime+'��'+toDatetime;
    PrintDBGridEh1.PageHeader.CenterText.Clear;
    PrintDBGridEh1.PageHeader.CenterText.add(str);
    PrintDBGridEh1.PageFooter.LeftText.Clear;
    PrintDBGridEh1.PageFooter.LeftText.Add('��ӡʱ�䣺'+FormatDateTime('yyyy-mm-dd hh:nn',now));
    PrintDBGridEh1.PageFooter.RightText.Clear;
    PrintDBGridEh1.PageFooter.RightText.Add(ReportFooter);
    PrinterPreview.Previewer.ViewMode := vmPageWidth;
    PrinterPreview.Orientation := poPortrait;
    PrintDBGridEh1.PageFooter.CenterText.Clear;
    PrintDBGridEh1.PageFooter.CenterText.Add('��&[Page]ҳ����&[Pages]ҳ');
    PrintDBGridEh1.Preview;
  except
  end;
end;

procedure TQueryEmergncyAlarmFrm.BitBtnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TQueryEmergncyAlarmFrm.BitButtonExcelDayClick(Sender: TObject);
var
  i, j: Integer;
  s: string;
  Str: string;
  fromDatetime, toDatetime: string;
  tmpStr: string;
begin
  if ClientDataSet1.RecordCount =0 then exit;
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
      MyWorkbook.worksheets[1].range['A1:D1'].Merge(true);
    //��Ԫ�����
      MyWorkbook.worksheets[1].range['A1:D2'].HorizontalAlignment := $FFFFEFF4;
    //����ͷ
      if group_id <>-1 then
        s:= ADevGroupManage.Find(group_id).Name;
      if ComboBoxCarNoDay.Text <>'' then
        s:= s+ '['+ComboBoxCarNoDay.Text+']'
      else
        s:= s+ '[ȫ������]';
      fromDatetime :=FormatDatetime('yyyy-mm-dd ',fromDate.Date)+FormatDatetime('hh:nn:ss',fromTime.Time);
      toDatetime:= FormatDatetime('yyyy-mm-dd ',toDate.Date)+FormatDatetime('hh:nn:ss',toTime.Time);
      str :=fromDatetime+'��'+toDatetime+ s+ ' ������������';
      MyWorkbook.worksheets[1].Cells[1, 1].value := Str;
    //��ͷ
      i := 2;
      for j:=1 to DBGridEh1.Columns.Count do
      begin
        if not DBGridEh1.Columns.Items[j-1].Visible then Continue;
        MyWorkbook.worksheets[1].Cells[i, j].value := DBGridEh1.Columns.Items[j-1].Title.Caption;
      end;
    //������ɫ
      MyWorkbook.worksheets[1].range['A1:D2'].Font.Color := clBlue;
    //����
      MyWorkbook.worksheets[1].range['A1:D1'].Font.Name := '����';
    //�ֺ�
      MyWorkbook.worksheets[1].range['A1:D1'].Font.Size := 18;
    //ȡ��
      i := 3;
      ClientDataSet1.First;
      while not ClientDataSet1.Eof do
      begin
        for j := 1 to  DBGridEh1.Columns.Count do
        begin
          if not DBGridEh1.Columns.Items[j-1].Visible then Continue;
          tmpStr := DBGridEh1.Columns.Items[j-1].FieldName;
          MyWorkbook.worksheets[1].Cells[i, j].value := ClientDataSet1.FieldValues[tmpStr];
        end;
        ClientDataSet1.Next;
        Inc(i);
      end;

      //����ϼ���  ��
      MyWorkbook.worksheets[1].Cells[i, 1].value :='�ϼ�:';
      MyWorkbook.worksheets[1].Cells[i, 2].value := DBGridEh1.Columns[1].Footer.SumValue;
    //���õ�Ԫ���ʽ
      MyWorkbook.worksheets[1].range['B'+IntToStr(ClientDataSet1.RecordCount+3)+':B'+IntToStr(ClientDataSet1.RecordCount+3)].NumberFormatLocal := '0';

    //�����п�
      for j := 1 to DBGridEh1.Columns.Count do
        MyWorkbook.worksheets[1].Columns[j].ColumnWidth :=10;
      MyWorkbook.worksheets[1].Columns[2].ColumnWidth :=18;
      MyWorkbook.worksheets[1].Columns[3].ColumnWidth :=18;

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

procedure TQueryEmergncyAlarmFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ManualDock(nil);
end;

procedure TQueryEmergncyAlarmFrm.SetOnSeeEmergncyAlarmDetailEvent(
  const Value: TSeeEmergncyAlarmDetailEvent);
begin
  FOnSeeEmergncyAlarmDetailEvent := Value;
end;

procedure TQueryEmergncyAlarmFrm.DBGridEh1DblClick(Sender: TObject);
var
  devIdStr,startTime,removeTime:String;
  startLongi,startLati,removeLongi,removeLati:Double;
begin
  if ClientDataSet1.RecordCount =0 then exit;
  if Assigned(FOnSeeEmergncyAlarmDetailEvent) then
  begin
    devIdStr := ClientDataSet1.FieldByName('devIDStr').AsString;
    startTime := ClientDataSet1.FieldByName('start_Time').AsString;
    removeTime := ClientDataSet1.FieldByName('lift_Time').AsString;
    startLongi := ClientDataSet1.FieldByName('start_longtitude').AsFloat;
    startLati := ClientDataSet1.FieldByName('start_latitude').AsFloat;
    removeLongi := ClientDataSet1.FieldByName('lift_longtitude').AsFloat;
    removeLati := ClientDataSet1.FieldByName('lift_latitude').AsFloat;
    try
      if StrToDateTime(startTime)> StrToDateTime(removeTime) then
      begin
        MessageBox(Handle,'�Բ���ʱ��β���ȷ!���ܲ�ѯ��ϸ��Ƭ','��ʾ',MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    except
      MessageBox(Handle,'��Ч��ʱ��ֵ!','��ʾ',MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
    FOnSeeEmergncyAlarmDetailEvent(devIdStr,startTime,removeTime,
      startLongi,startLati,removeLongi,removeLati);
  end;
end;

end.

