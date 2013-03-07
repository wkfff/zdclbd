unit QueryICCardTradeDataFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, PrnDbgeh, ImgList, cxControls, cxSplitter, Grids, DBGridEh,
  StdCtrls, Buttons, ComCtrls, ExtCtrls, DBClient, adodb,uGloabVar,CarUnit,
  uFrmRefreshProgress,PrViewEh, Printers, DBGrids, ConstDefineUnit;

type
  TQueryICCardTradeDataFrm = class(TForm)
    Panel7: TPanel;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    TreeView1: TTreeView;
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    Panel3: TPanel;
    Label5: TLabel;
    Label2: TLabel;
    SpeedButtonOneTime: TSpeedButton;
    Label3: TLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label6: TLabel;
    Label7: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    ComboBox2: TComboBox;
    ComboBoxIsPrint: TComboBox;
    BitBtnToExcel: TBitBtn;
    fromTime: TDateTimePicker;
    toTime: TDateTimePicker;
    Panel4: TPanel;
    DBGridEh1: TDBGridEh;
    cxSplitter2: TcxSplitter;
    PrintDBGridEh1: TPrintDBGridEh;
    DataSource1: TDataSource;
    BitBtn2: TBitBtn;
    PanelSelectGroupName: TPanel;
    cxSplitter1: TcxSplitter;
    Label1: TLabel;
    ComboBox1: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure SpeedButtonOneTimeClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnToExcelClick(Sender: TObject);
  private
    procedure AddDev(id: integer; ANode: TTreeNode);
    procedure GetQueryReturnInfo(Info: OleVariant);
  private
     FDlgProgress:TFrmRefreshProgress;
     FOldBizOffTime:Integer;
  public
    { Public declarations }
  end;

var
  QueryICCardTradeDataFrm: TQueryICCardTradeDataFrm;
  aqStore: TClientDataSet;
  FromDate, ToDate: string;
  CarNo: string;
  group_id: integer = -1;
  group_paranet: string = '';
  fact_id: Integer = -1;
  dev_id: Integer = -1;
implementation
uses umainf,ComObj, DateUtils,waitFrmUnit, QueryThreadUnit, ShowMessageInfo;
{$R *.dfm}

procedure TQueryICCardTradeDataFrm.AddDev(id: integer; ANode: TTreeNode);
var
  i: integer;
  dev: TDevice;
begin
  try
    //ComboBox2.Items.Clear;
    ComboBox2.ItemIndex := -1;

    for i := 0 to ADeviceManage.Count - 1 do
    begin
      dev := ADeviceManage.Items[i];
      if dev = nil then Continue;
      if dev.GroupID= id then
      begin
        ComboBox2.Items.AddObject(dev.Car.No,dev);
      end;
    end;
  finally
  end;
end;

procedure TQueryICCardTradeDataFrm.FormCreate(Sender: TObject);
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
        sonId: integer;           //�Ӽ��� ��ID
        leaf_node: TTreenode;     //�Ӽ��Ľڵ�
        grp : TDevGroup;
      begin
        for i:= 0 to ADevGroupManage.Count -1 do
        begin
          if Acurrent_cnt =0 then exit;
          grp :=ADevGroupManage.Items[i];
          //�г�����--��Ϊ0
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
begin
  DateTimePicker2.date := now;
  DateTimePicker1.date := IncWeek(now, -1);  //��ǰ1��
  aqStore := TClientDataSet.Create(nil);
  //DataSource1.DataSet := aqStore;

  TreeView1.AutoExpand := true;
  TreeView1.Items.Clear;
  if ADevGroupManage.Count = 0 then exit;
  vn_node := TreeView1.Items.add(TreeView1.topitem, '���г���');
  vn_node.Data := Pointer(-1); //���г���
  vn_node.Expanded := true;
  cnt := ADevGroupManage.Count;
  group_list(0,vn_node,cnt);
end;

procedure TQueryICCardTradeDataFrm.TreeView1Click(Sender: TObject);
var
  grpId : integer;
  devGrp: TDevGroup;
  Node: TTreeNode;
  i: Integer;
begin
  Node := TreeView1.Selected;
  if Node = nil then exit;
  group_id := Integer(Node.Data);
  PanelSelectGroupName.Caption := Node.Text;
  group_paranet := '';
  
  ComboBox2.Clear;
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
        group_id := -1;
      end
      else
        group_paranet:='';
    end;
  end;
  if group_paranet<>'' then group_id := -1;
end;

procedure TQueryICCardTradeDataFrm.SpeedButtonOneTimeClick(Sender: TObject);
var
  m: integer;
  FCursor: TCursor;
  i, aPos: integer;
  Str, aCarNO: string;
  //dlg: TwaitFrm;
  dev:TDevice;
  info :oleVariant;
  startDateTime, endDateTime: Tdatetime;
  xml: string;
  isUpok: Integer;

  Query_ICCardTradeDataList2: TQuery_ICCardTradeDataList2;
begin
  screen.Cursor := FCursor;
  try
    FCursor := -11;
    //������
    DataSource1.DataSet := nil;
    if FDlgProgress = nil then
      FDlgProgress := TFrmRefreshProgress.Create(self);
    FDlgProgress.SetCaption('�����������ݣ������Ժ�...');
    FDlgProgress.Gauge1.MinValue := 0;
    FDlgProgress.Gauge1.MaxValue := 100;

    startDateTime := DateTimePicker1.DateTime;
    endDateTime := DateTimePicker2.DateTime;
    ReplaceTime(startDateTime, fromTime.Time);
    ReplaceTime(endDateTime, toTime.Time);
    FromDate :=  FormatDatetime('yyyy-mm-dd hh:nn:ss',startDateTime);
    ToDate := FormatDatetime('yyyy-mm-dd hh:nn:ss',endDateTime);
    if FromDate > ToDate then
    begin
      messagebox(handle, '��ʼ����ӦС�ڽ������ڣ����飡', '��ʾ��Ϣ', mb_ok + mb_iconinformation);
      exit;
    end;

    aCarNo := '';
    try
      if ComboBox2.Text <> '' then
      begin
        dev := TDevice(ComboBox2.Items.Objects[ComboBox2.ItemIndex]);
        if dev <> nil then
          begin
            dev_id := dev.id;
            fact_id := dev.fact_id;
            group_id := -1;
            group_paranet := '';
            aCarNo := dev.CarNoDeleteDevName;
          end
        else
          aCarNo := '';
      end
      else
      begin
        dev_id := -1;
        fact_id := -1;
      end;
    except
      aCarNo := '';
    end;

    CarNo := aCarNO;

    isUpok := ComboBox1.ItemIndex-1;

    FDlgProgress.Gauge1.Progress := 5;
    FDlgProgress.Show;
    Application.ProcessMessages;

    FDlgProgress.Gauge1.MaxValue := 10 +10;
    FDlgProgress.Gauge1.Progress := 10;
    Application.ProcessMessages;

    Query_ICCardTradeDataList2 := TQuery_ICCardTradeDataList2.Create(FromDate, ToDate, isUpok, dev_Id,
                                                                     fact_Id, group_id, group_paranet,
                                                                     SpeedButtonOneTime);
    Query_ICCardTradeDataList2.OnQueryReturn := GetQueryReturnInfo;

    {try
      xml := BS.Query_ICCardTradeDataList2(FromDate, ToDate, isUpok, dev_Id,
                                          fact_Id, group_id,
                                          group_paranet);
    except
      on E: Exception do
      begin
        if FDlgProgress.Showing then FDlgProgress.Hide;
        messagebox(handle, QUERY_WARNING_INFO, '��ʾ', mb_ok + mb_iconinformation);
        exit;
      end;
    end;

    FDlgProgress.GaugeProcessInc(10);
    aqStore.XMLData := xml;
    aqStore.Open;
    if aqStore.RecordCount  <= 0 then
    begin
      FDlgProgress.Hide;
      MessageBox(Handle,'�Բ���û�з������������ݣ�','��ʾ',MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
    DataSource1.DataSet := aqStore;
    DBGridEh1.DataSource := DataSource1;        }
  finally
    FCursor := 0;
    if FDlgProgress.Showing then FDlgProgress.Hide;
  end;
end;

procedure TQueryICCardTradeDataFrm.SpeedButton3Click(Sender: TObject);
var
  Str, str1: string;
begin
  try
    //Str := '���ʹ�Ӫ����Ϣ';
    Str := FormatDateTime('yyyy-mm-dd', DateTimePicker1.Date) + '��' +
      FormatDateTime('yyyy-mm-dd', DateTimePicker2.Date) + '['+ComboBox2.Text +'] '+ComboBoxIsPrint.Text+' ����������Ϣ';
    PrintDBGridEh1.PageHeader.CenterText.Clear;
    PrintDBGridEh1.PageHeader.CenterText.add(Str);
    PrintDBGridEh1.PageFooter.LeftText.Clear;
    PrintDBGridEh1.PageFooter.LeftText.Add('��ӡʱ�䣺'+FormatDateTime('yyyy-mm-dd hh:nn',now));
    PrintDBGridEh1.PageFooter.RightText.Clear;
    PrintDBGridEh1.PageFooter.RightText.Add(ReportFooter);
    PrinterPreview.Previewer.ViewMode := vmPageWidth;
    PrinterPreview.Orientation := poLandscape;
    PrintDBGridEh1.PageFooter.CenterText.Clear;
    PrintDBGridEh1.PageFooter.CenterText.Add('��&[Page]ҳ����&[Pages]ҳ');
    PrintDBGridEh1.Preview;
  except
  end;
end;

procedure TQueryICCardTradeDataFrm.DBGridEh1CellClick(Column: TColumnEh);
var
  car_No:string;
  Dev_Id: Integer;
begin
  Dev_Id := aqStore.FieldValues['Dev_Id'];
  //GCurSelectDev:=ADeviceManage.FindDevFromCarNo(car_No);
  GCurSelectDev := ADeviceManage.find(Dev_Id);
  if GCurSelectDev = nil then Exit;

  mainf.Edit2.Text := IntToStr(GCurSelectDev.Id);
  mainf.Edit1.Text := GCurSelectDev.Car.No;
  mainf.ShowState(GCurSelectDev);
end;

procedure TQueryICCardTradeDataFrm.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TQueryICCardTradeDataFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    ManualDock(nil);
end;

procedure TQueryICCardTradeDataFrm.BitBtnToExcelClick(Sender: TObject);
var
  i, j: Integer;
  s: string;
  Str: string;
  FromDate, ToDate: string;
  tmpStr: string;
  ExcelApp, MyWorkbook: oleVariant;
begin
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
      MyWorkbook.worksheets[1].range['A1:N1'].Merge(true);
    //��Ԫ�����
      MyWorkbook.worksheets[1].range['A1:N2'].HorizontalAlignment := $FFFFEFF4;
    //����ͷ
      if ComboBox2.Text='' then
        Str := FormatDateTime('yyyy-mm-dd', DateTimePicker1.Date) + '��' +
          FormatDateTime('yyyy-mm-dd', DateTimePicker2.Date) +' '+' ˢ�����׼�¼'
      else
        Str := FormatDateTime('yyyy-mm-dd', DateTimePicker1.Date) + '��' +
          FormatDateTime('yyyy-mm-dd', DateTimePicker2.Date) + '['+ComboBox2.Text +'] ' + ' ˢ�����׼�¼';
      MyWorkbook.worksheets[1].Cells[1, 1].value := Str;
      //��Ԫ��ϲ�
      MyWorkbook.worksheets[1].range['A2:N2'].Merge(true);
      //MyWorkbook.worksheets[1].Cells[2, 1].value := Label1.Caption;
    //��ͷ
      i := 3;
      MyWorkbook.worksheets[1].Cells[i, 1].value := '���ƺ�';
      //MyWorkbook.worksheets[1].Cells[i, 2].value := '���׿���';
      MyWorkbook.worksheets[1].Cells[i, 2].value := 'POS�����';
      MyWorkbook.worksheets[1].Cells[i, 3].value := '��������';
      MyWorkbook.worksheets[1].Cells[i, 4].value := 'PSAM������';
      MyWorkbook.worksheets[1].Cells[i, 5].value := '�ն˽�����ˮ��';
      MyWorkbook.worksheets[1].Cells[i, 6].value := '���д���';
      MyWorkbook.worksheets[1].Cells[i, 7].value := '��������ˮ��';

      MyWorkbook.worksheets[1].Cells[i, 8].value := '������';
      MyWorkbook.worksheets[1].Cells[i, 9].value := '����ǰ���';
      MyWorkbook.worksheets[1].Cells[i, 10].value := '���׽��';
      MyWorkbook.worksheets[1].Cells[i, 11].value := '����ʱ��';
      MyWorkbook.worksheets[1].Cells[i, 12].value := '�����׼�����';
      //MyWorkbook.worksheets[1].Cells[i, 13].value := '������֤��';
      MyWorkbook.worksheets[1].Cells[i, 13].value := '�Ƿ����';
      MyWorkbook.worksheets[1].Cells[i, 14].value := '����ʱ��';
      
    //������ɫ
      MyWorkbook.worksheets[1].range['A1:N2'].Font.Color := clBlue;
    //����
      MyWorkbook.worksheets[1].range['A1:N1'].Font.Name := '����';
    //�ֺ�
      MyWorkbook.worksheets[1].range['A1:N1'].Font.Size := 18;
    //ȡ��
      i := i+1;
      DataSource1.DataSet.First;
      //���õ�Ԫ���ʽ
      MyWorkbook.worksheets[1].range['I4:J'+IntToStr(DataSource1.DataSet.RecordCount+4+1 )].NumberFormatLocal := '0.00';
      MyWorkbook.worksheets[1].range['B4:B'+IntToStr(DataSource1.DataSet.RecordCount+4)].NumberFormatLocal := '@';
      MyWorkbook.worksheets[1].range['D4:D'+IntToStr(DataSource1.DataSet.RecordCount+4)].NumberFormatLocal := '@';
      MyWorkbook.worksheets[1].range['B'+IntToStr(DataSource1.DataSet.RecordCount+4)+
        ':C'+IntToStr(DataSource1.DataSet.RecordCount+4+1)].NumberFormatLocal := '0';
      MyWorkbook.worksheets[1].range['M'+IntToStr(DataSource1.DataSet.RecordCount+4)+
        ':M'+IntToStr(DataSource1.DataSet.RecordCount+4)].NumberFormatLocal := '0';
      MyWorkbook.worksheets[1].range['G4:G'+IntToStr(DataSource1.DataSet.RecordCount+4)].NumberFormatLocal := '@';

      while not DataSource1.DataSet.Eof do
      begin
        MyWorkbook.worksheets[1].Cells[i, 1].value := DataSource1.DataSet.FieldByName('CAR_NO').AsString;
        MyWorkbook.worksheets[1].Cells[i, 2].value := DataSource1.DataSet.FieldByName('POSMachineNo').AsString;
        MyWorkbook.worksheets[1].Cells[i, 3].value := DataSource1.DataSet.FieldByName('TRADETYPESTR').AsString;
        MyWorkbook.worksheets[1].Cells[i, 4].value := DataSource1.DataSet.FieldByName('PSamCardNo').AsString;
        MyWorkbook.worksheets[1].Cells[i, 5].value := DataSource1.DataSet.FieldByName('TradeSerieNumber').AsString;
        MyWorkbook.worksheets[1].Cells[i, 6].value := DataSource1.DataSet.FieldByName('CityCode').AsString;
        MyWorkbook.worksheets[1].Cells[i, 7].value := DataSource1.DataSet.FieldByName('CardIssueSerieNumber').AsString;

        MyWorkbook.worksheets[1].Cells[i, 8].value := DataSource1.DataSet.FieldByName('CARDTYPESTR').AsString;
        MyWorkbook.worksheets[1].Cells[i, 9].value := DataSource1.DataSet.FieldByName('ICCardMoney_Beforetrade').AsString;
        MyWorkbook.worksheets[1].Cells[i, 10].value := DataSource1.DataSet.FieldByName('TradeMoney').AsString;
        MyWorkbook.worksheets[1].Cells[i, 11].value := DataSource1.DataSet.FieldByName('TradeTime').AsString;
        MyWorkbook.worksheets[1].Cells[i, 12].value := DataSource1.DataSet.FieldByName('TradeNumber').AsString;
        //MyWorkbook.worksheets[1].Cells[i, 13].value := DataSource1.DataSet.FieldByName('Tac').AsString;
        MyWorkbook.worksheets[1].Cells[i, 13].value := DataSource1.DataSet.FieldByName('isupokStr').AsString;
        MyWorkbook.worksheets[1].Cells[i, 14].value := DataSource1.DataSet.FieldByName('upoktime').AsString;
        DataSource1.DataSet.Next;
        inc(i);
      end;

      //����ϼ��� sha
      MyWorkbook.worksheets[1].Cells[i, 1].value :='�ϼ�:';
      MyWorkbook.worksheets[1].Cells[i, 2].value := DBGridEh1.Columns[2].Footer.SumValue;
      MyWorkbook.worksheets[1].Cells[i, 3].value := '';
      MyWorkbook.worksheets[1].Cells[i, 4].value := '';
      MyWorkbook.worksheets[1].Cells[i, 5].value := '';//ClientDataSet4.FieldByName('tradDis').AsString;
      MyWorkbook.worksheets[1].Cells[i, 6].value := '';//ClientDataSet4.FieldByName('lyl').AsString;
      MyWorkbook.worksheets[1].Cells[i, 7].value := '';//ClientDataSet4.FieldByName('avgDis').AsString;
      MyWorkbook.worksheets[1].Cells[i, 8].value := '';
      MyWorkbook.worksheets[1].Cells[i, 9].value := '';
      MyWorkbook.worksheets[1].Cells[i, 10].value := DBGridEh1.Columns[16].Footer.SumValue;
      MyWorkbook.worksheets[1].Cells[i, 11].value := '';
      MyWorkbook.worksheets[1].Cells[i, 12].value := '';
      MyWorkbook.worksheets[1].Cells[i, 13].value := DBGridEh1.Columns[20].Footer.SumValue;
      MyWorkbook.worksheets[1].Cells[i, 14].value := '';
      
    //�����п�
      for j := 1 to 14 do
        MyWorkbook.worksheets[1].Columns[j].ColumnWidth :=10;
    //�����и�
      MyWorkbook.worksheets[1].Rows[1].RowHeight := 50;
    //����ͷ����
      MyWorkbook.worksheets[1].Rows[1].VerticalAlignment := $FFFFEFF4;
    {//��������������
      s := 'A1:K' + inttostr(ClientDataSet4.RecordCount - 2);
      MyWorkbook.worksheets[1].range[s].Font.Name := '����';
    //������
      s := 'A2:K' + inttostr(ClientDataSet4.RecordCount + 2);
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

procedure TQueryICCardTradeDataFrm.GetQueryReturnInfo(Info: OleVariant);
begin
  try
    try
      FDlgProgress.GaugeProcessInc(10);
      
      if Info = null then
      begin
        messagebox(0, '�Բ���û�������ѯҪ�����Ϣ��', '��ʾ', mb_ok + MB_ICONWARNING);
        Exit;
      end;

      aqStore.XMLData := Info;

      aqStore.Open;
      if aqStore.RecordCount  <= 0 then
      begin
        MessageBox(Handle,'�Բ���û�з������������ݣ�','��ʾ',MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      DataSource1.DataSet := aqStore;
      DBGridEh1.DataSource := DataSource1;
    except
      on E: Exception do
      begin
        messageErrorBox('һ��ͨˢ�����׽��������ȷ��', e.Message);
        exit;
      end;
    end;
  finally
  end;
end;

end.
