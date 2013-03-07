unit taxiRunDataFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, ImgList, ToolWin,
  Grids, DBGridEh, ADOInt, DBClient, adodb,
  PrnDbgeh, EhLibADO, cxControls, cxSplitter,
   EhLibCDS,
  IniFiles, PrViewEh, Printers,uGloabVar,CarUnit,waitFrmUnit;

type
  TtaxiRunDataFrm = class(TForm)
    Panel1: TPanel;
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
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label11: TLabel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    ComboBox1: TComboBox;
    Panel4: TPanel;
    DBGridEh1: TDBGridEh;
    cxSplitter2: TcxSplitter;
    Panel7: TPanel;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    TreeView1: TTreeView;
    cxSplitter1: TcxSplitter;
    ImageList1: TImageList;
    DataSource1: TDataSource;
    PrintDBGridEh1: TPrintDBGridEh;
    ComboBox2: TComboBox;
    Label6: TLabel;
    ComboBoxIsPrint: TComboBox;
    BitBtnToExcel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1Change(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure BitBtnToExcelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure AddDev(id: integer; ANode: TTreeNode);
    procedure enabledbutton(flag: boolean);
    procedure ShowData(CarNo, FromDate, ToDate: string; pStartIndex,
      pageSize: integer);
    { Private declarations }
  public
    { Public declarations }
    FTradeType :String;    //��������
  end;

var
  taxiRunDataFrm: TtaxiRunDataFrm;

  aqStore: TClientDataSet; {�����ݼ���һ��ȡȫ����������adsClone����ʾ��ҳ����}
  pageSize: integer; //ÿҳ��ʾ����
  {��ҳ��Ŀ}
  pCount: integer;
  {��ǰ�ڼ�ҳ��}
  curPage: integer = 1;
  {�ܹ��ʺ������ļ�¼��}
  pRecordCount: integer;
  {��ʼ��ѯ�ĵ�}
  pStartIndex: integer;
  {���ڵĲ�ѯ����}
  FromDate, ToDate: string;
  {
    �Ƿ����һҳ
    �Ƿ񵽵�һҳ
  }
  pageEnd, pageStart: boolean;
  {
    �ж����Ϸ������·�
  }
  onOff: boolean;

  CarNo: string;

  IsClickDev:Boolean = false;
  clickParent:integer;
implementation

uses umainf,ComObj;

{$R *.dfm}

procedure TtaxiRunDataFrm.FormCreate(Sender: TObject);
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
  j: integer;
  iniFile: TIniFile;
begin
  try
    iniFile := TIniFile.Create(extractfilepath(paramstr(0)) + 'config.ini');
    try
      pageSize := strtoint(iniFile.ReadString('pageSize', 'pageSize', ''));
    except
      pageSize := 40;
    end;
    pRecordCount := 0;
    Label1.Caption := '';
    DateTimePicker2.date := now;
    DateTimePicker1.date := IncMonth(now, -1);
    aqStore := TClientDataSet.Create(nil);
    DataSource1.DataSet := aqStore;
 {*******************************}
    TreeView1.AutoExpand := true;
    TreeView1.Items.Clear;
    if ADevGroupManage.Count = 0 then exit;
    vn_node := TreeView1.Items.add(TreeView1.topitem, '���г���');
    vn_node.Data := Pointer(-1); //���г���
    vn_node.Expanded := true;
    cnt := ADevGroupManage.Count;
    group_list(0,vn_node,cnt);
  finally
    iniFile.Free;
  end;

end;

procedure TtaxiRunDataFrm.TreeView1Click(Sender: TObject);
var
  grpId : integer;
  devGrp: TDevGroup;
  Node: TTreeNode;
begin
  Node := TreeView1.Selected;
  if Node = nil then exit;
  grpId := Integer(Node.Data);
  if grpId = -1 then
  begin
    Exit;
  end;
  if grpId = -2 then
  begin
    Exit;
  end;
  if (grpId >=0) then //and (not IsClickDev) and (grpId <> clickParent) then
  begin
    AddDev(grpId, Node);
  end;
end;
procedure TtaxiRunDataFrm.AddDev(id: integer; ANode: TTreeNode);
var
  i: integer;
  dev: TDevice;
begin
  try
    ComboBox2.Items.Clear;
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

procedure TtaxiRunDataFrm.SpeedButton4Click(Sender: TObject);
begin
  Close;
end;

procedure TtaxiRunDataFrm.SpeedButton1Click(Sender: TObject);
var
  m: integer;
  FCursor: TCursor;
  i, aPos: integer;
  Str, aCarNO: string;
  dlg: TwaitFrm;
  dev:TDevice;
begin
  screen.Cursor := FCursor;
  try
    FCursor := -11;
    dlg := TwaitFrm.Create(nil);
    dlg.Show;
    Application.ProcessMessages;
    CarNo := trim(ComboBox2.Text);
    FromDate := FormatDateTime('yyyy-mm-dd', DateTimePicker1.date);
    ToDate := FormatDateTime('yyyy-mm-dd', DateTimePicker2.date);
    if FromDate > ToDate then
    begin
      Application.MessageBox('��ʼ����ӦС�ڽ������ڣ����飡', '��ʾ��Ϣ', mb_ok + mb_iconinformation);
      exit;
    end;

    aCarNo := '';
    try
      if ComboBox2.Text <> '' then
      begin
        dev := TDevice(ComboBox2.Items.Objects[ComboBox2.ItemIndex]);
        if dev <> nil then
          aCarNo := dev.CarNoDeleteDevName
        else
          aCarNo := '';
      end;
    except
      aCarNo := '';
    end;
    //������Ͻ������� =0,1,2,3
    if ComboBoxIsPrint.Text ='' then
      FTradeType := ''
    else
      FTradeType := IntToStr(ComboBoxIsPrint.ItemIndex);

    try
      pRecordCount := BS.QueryRunDataCount_Cs(aCarNO, FromDate, ToDate,FTradeType);
    except
      on E: Exception do
      begin
        MessageBox(0, pchar(E.Message), '��ʾ��Ϣ', mb_ok + mb_iconinformation);
        exit;
      end;
    end;
   { if Length(CarNo) = 0 then
    begin
      enabledbutton(false);
      Application.MessageBox('����ȷ��д��Ҫ��ѯ�ĳ��ƺ���!', '��ʾ��Ϣ', mb_ok + mb_iconinformation);
      exit;
    end; }
    m := pRecordCount mod pageSize;
    if m = 0 then
      pCount := pRecordCount div pageSize
    else
      pCount := pRecordCount div pageSize + 1;
    curPage := 1;
    ShowData(CarNo, FromDate, ToDate, (curPage - 1) * pageSize, pageSize);
    ComboBox1.Items.Clear;
    for i := 1 to pCount do
      ComboBox1.Items.add(inttostr(i));

    for i := 0 to DBGridEh1.Columns.Count - 1 do
      DBGridEh1.Columns.Items[i].Title.TitleButton := true;
  finally
    dlg.Free;
    FCursor := 0;
  end;
end;
procedure TtaxiRunDataFrm.enabledbutton(flag: boolean);
begin
  BitBtn1.Enabled := flag;
  BitBtn2.Enabled := flag;
  BitBtn3.Enabled := flag;
  BitBtn4.Enabled := flag;
end;
procedure TtaxiRunDataFrm.ShowData(CarNo, FromDate, ToDate: string; pStartIndex, pageSize: integer);
var
  Count: integer;
  info: oleVariant;
  Str, aCarNO: string;
  aPos: integer;
  dlg: TwaitFrm;
begin
  try
    screen.Cursor := crHourGlass;
    Label1.Visible := true;
    dlg := TwaitFrm.Create(nil);
    dlg.Show;
    Application.ProcessMessages;
    if pRecordCount = 0 then
    begin
      enabledbutton(false);
      DataSource1.Enabled := false;
      ComboBox1.Items.Clear;
      ComboBox1.Text := '';
      Label1.Visible := false;
      Application.MessageBox('���յ�ǰ�Ĳ�ѯ����û��Ӫ�˼�¼��', '��ʾ��Ϣ', mb_ok + mb_iconinformation);
      exit;
    end;

    aPos := pos('(', CarNo);
    if aPos > 0 then
      aCarNO := Copy(CarNo, 1, aPos - 1)
    else
      aCarNO := CarNo;

    Count := BS.QueryRunData_Cs(aCarNO, FromDate, ToDate, pStartIndex, pageSize, info,FTradeType);
    aqStore.Data := info;
    ComboBox1.Text := inttostr(curPage);
    if curPage < pCount then
      Label1.Caption := '����: ' + inttostr(pCount) + ' ҳ' + '  ' + '����: ' + inttostr(pRecordCount) + ' ����¼' +
        ' ��ǰ��¼: ' + inttostr((curPage - 1) * pageSize + 1) + '-' +
        inttostr(curPage * pageSize)
    else
      Label1.Caption := '����: ' + inttostr(pCount) + ' ҳ' + '  ' + '����: ' + inttostr(pRecordCount) + ' ����¼' +
        ' ��ǰ��¼: ' + inttostr((curPage - 1) * pageSize + 1) + '-' + inttostr(pRecordCount);

    DataSource1.Enabled := true;
    if (curPage = 1) and (curPage = pCount) then
    begin
      BitBtn1.Enabled := false;
      BitBtn2.Enabled := false;
      BitBtn3.Enabled := false;
      BitBtn4.Enabled := false;
    end
    else if (curPage > 1) and (curPage < pCount) then
    begin
      BitBtn1.Enabled := true;
      BitBtn2.Enabled := true;
      BitBtn3.Enabled := true;
      BitBtn4.Enabled := true;
    end
    else if curPage = pCount then
    begin
      BitBtn1.Enabled := true;
      BitBtn2.Enabled := true;
      BitBtn3.Enabled := false;
      BitBtn4.Enabled := false;
    end
    else if (curPage = 1) and (pCount > 1) then
    begin
      BitBtn1.Enabled := false;
      BitBtn2.Enabled := false;
      BitBtn3.Enabled := true;
      BitBtn4.Enabled := true;
    end;
  finally
    dlg.Free;
    screen.Cursor := crDefault;
  end;
end;
procedure TtaxiRunDataFrm.SpeedButton3Click(Sender: TObject);
var
  Str, str1: string;
begin
  try
    Str := '���ʹ�Ӫ����Ϣ';
    PrintDBGridEh1.PageHeader.CenterText.Clear;
    PrintDBGridEh1.PageHeader.CenterText.add(Str);
    PrintDBGridEh1.PageFooter.LeftText.Clear;
    PrintDBGridEh1.PageFooter.LeftText.Add('��ӡʱ�䣺'+FormatDateTime('yyyy-mm-dd hh:nn',now));
    PrintDBGridEh1.PageFooter.RightText.Clear;
    PrintDBGridEh1.PageFooter.RightText.Add(ReportFooter);
    PrinterPreview.Previewer.ViewMode := vmPageWidth;
    PrinterPreview.Orientation := poLandscape;
    PrintDBGridEh1.Preview;
  except
  end;
end;

procedure TtaxiRunDataFrm.BitBtn1Click(Sender: TObject);
begin
  if pRecordCount = 0 then exit;
  curPage := 1;
  ShowData(CarNo, FromDate, ToDate, (curPage - 1) * pageSize, pageSize);
end;

procedure TtaxiRunDataFrm.BitBtn2Click(Sender: TObject);
begin
  if pRecordCount = 0 then exit;
  curPage := curPage - 1;
  if curPage <= 0 then
  begin
    curPage := curPage + 1;
    MessageBox(self.Handle, '�ѵ�����ҳ!', '��ʾ', mb_iconinformation + mb_ok);
    exit;
  end;
  ShowData(CarNo, FromDate, ToDate, (curPage - 1) * pageSize, pageSize);
end;

procedure TtaxiRunDataFrm.BitBtn3Click(Sender: TObject);
begin
  if pRecordCount = 0 then exit;
  curPage := curPage + 1;
  if curPage > pCount then
  begin
    curPage := curPage - 1;
    MessageBox(self.Handle, '�ѵ���ĩҳ!', '��ʾ', mb_iconinformation + mb_ok);
    exit;
  end;
  ShowData(CarNo, FromDate, ToDate, (curPage - 1) * pageSize, pageSize);
end;

procedure TtaxiRunDataFrm.BitBtn4Click(Sender: TObject);
begin
  if pRecordCount = 0 then exit;
  curPage := pCount;
  ShowData(CarNo, FromDate, ToDate, (curPage - 1) * pageSize, pageSize);
end;

procedure TtaxiRunDataFrm.ComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
if not (Key in [#8, '0'..'9']) then Key := #0;
end;

procedure TtaxiRunDataFrm.ComboBox1Change(Sender: TObject);
var
  pageCount: integer;
begin
  if pRecordCount = 0 then
  begin
    self.ComboBox1.Text := '';
    Application.MessageBox('���յ�ǰ�Ĳ�ѯ����û��Ӫ�˼�¼��', '��ʾ��Ϣ', mb_ok + mb_iconinformation);
    exit;
  end;
  try
    pageCount := strtoint(ComboBox1.Text);
  except
    self.ComboBox1.Text := '';
    Application.MessageBox('����ȷ����Ҫ��ѯ��ҳ��', '��ʾ��Ϣ', mb_ok + mb_iconinformation);
    exit;
  end;
  if pageCount <= 0 then exit;
  if pageCount > pCount then
  begin
    pageCount := pCount;
    curPage := pCount;
    ComboBox1.Text := inttostr(pageCount);
  end else
  begin
    curPage := pageCount;
  end;
  ShowData(CarNo, FromDate, ToDate, (curPage - 1) * pageSize, pageSize);
end;

procedure TtaxiRunDataFrm.DBGridEh1DblClick(Sender: TObject);
var
  car_No:string;
begin
 try
      car_No := aqStore.FieldValues['car_No'];
      GCurSelectDev_rundata:=ADeviceManage.FindDevFromCarNo(car_No);
      if GCurSelectDev_rundata <> nil then
      begin
         GCurSelectDev_rundata.Longitude := aqStore.FieldValues['longitude'];
         GCurSelectDev_rundata.Latitude := aqStore.FieldValues['Latitude'];
      end;
      umainf.Mainf.fun_Locate_CarExecute_rundata;
 except
 end;
end;

procedure TtaxiRunDataFrm.DBGridEh1CellClick(Column: TColumnEh);
var
  car_No:string;
begin
  car_No := aqStore.FieldValues['car_No'];
  GCurSelectDev:=ADeviceManage.FindDevFromCarNo(car_No);

  mainf.Edit2.Text := IntToStr(GCurSelectDev.Id);
  mainf.Edit1.Text := GCurSelectDev.Car.No;
  mainf.ShowState(GCurSelectDev);
end;

procedure TtaxiRunDataFrm.BitBtnToExcelClick(Sender: TObject);
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
      MyWorkbook.worksheets[1].range['A1:I1'].Merge(true);
    //��Ԫ�����
      MyWorkbook.worksheets[1].range['A1:I2'].HorizontalAlignment := $FFFFEFF4;
    //����ͷ
      if ComboBox2.Text='' then
        Str := FormatDateTime('yyyy-mm-dd', DateTimePicker1.Date) + '��' +
          FormatDateTime('yyyy-mm-dd', DateTimePicker2.Date) +''+ ComboBoxIsPrint.Text+' �ʹ���Ϣ'
      else
        Str := FormatDateTime('yyyy-mm-dd', DateTimePicker1.Date) + '��' +
          FormatDateTime('yyyy-mm-dd', DateTimePicker2.Date) + '['+ComboBox2.Text +'] '+ComboBoxIsPrint.Text+' �ʹ���Ϣ';
      MyWorkbook.worksheets[1].Cells[1, 1].value := Str;
      //��Ԫ��ϲ�
      MyWorkbook.worksheets[1].range['A2:I2'].Merge(true);
      MyWorkbook.worksheets[1].Cells[2, 1].value := Label1.Caption;
    //��ͷ
      i := 3;
      MyWorkbook.worksheets[1].Cells[i, 1].value := '���ƺ�';
      MyWorkbook.worksheets[1].Cells[i, 2].value := '�ϳ�����';
      MyWorkbook.worksheets[1].Cells[i, 3].value := '�ϳ�ʱ��';
      MyWorkbook.worksheets[1].Cells[i, 4].value := '�³�ʱ��';
      MyWorkbook.worksheets[1].Cells[i, 5].value := '����';
      MyWorkbook.worksheets[1].Cells[i, 6].value := 'Ӫ�˽��';
      MyWorkbook.worksheets[1].Cells[i, 7].value := 'Ӫ�����';
      MyWorkbook.worksheets[1].Cells[i, 8].value := '��ʻ���';
      MyWorkbook.worksheets[1].Cells[i, 9].value := '�Ⱥ�ʱ��';

    //������ɫ
      MyWorkbook.worksheets[1].range['A1:I2'].Font.Color := clBlue;
    //����
      MyWorkbook.worksheets[1].range['A1:I1'].Font.Name := '����';
    //�ֺ�
      MyWorkbook.worksheets[1].range['A1:I1'].Font.Size := 18;
    //ȡ��
      i := i+1;
      DataSource1.DataSet.First;
      while not DataSource1.DataSet.Eof do
      begin
        MyWorkbook.worksheets[1].Cells[i, 1].value := DataSource1.DataSet.FieldByName('Car_no').AsString;
        MyWorkbook.worksheets[1].Cells[i, 2].value := DataSource1.DataSet.FieldByName('Ondate').AsString;
        MyWorkbook.worksheets[1].Cells[i, 3].value := DataSource1.DataSet.FieldByName('ontime').AsString;
        MyWorkbook.worksheets[1].Cells[i, 4].value := DataSource1.DataSet.FieldByName('offtime').AsString;
        MyWorkbook.worksheets[1].Cells[i, 5].value := DataSource1.DataSet.FieldByName('dj').AsString;
        MyWorkbook.worksheets[1].Cells[i, 6].value := DataSource1.DataSet.FieldByName('yyje').AsString;
        MyWorkbook.worksheets[1].Cells[i, 7].value := DataSource1.DataSet.FieldByName('xslc').AsString;
        MyWorkbook.worksheets[1].Cells[i, 8].value := DataSource1.DataSet.FieldByName('kslc').AsString;
        MyWorkbook.worksheets[1].Cells[i, 9].value := DataSource1.DataSet.FieldByName('waitTime').AsString;
        DataSource1.DataSet.Next;
        inc(i);
      end;

      //����ϼ��� sha
      MyWorkbook.worksheets[1].Cells[i, 1].value :='�ϼ�:';
      MyWorkbook.worksheets[1].Cells[i, 2].value := DBGridEh1.Columns[1].Footer.SumValue;
      MyWorkbook.worksheets[1].Cells[i, 3].value := '';
      MyWorkbook.worksheets[1].Cells[i, 4].value := '';
      MyWorkbook.worksheets[1].Cells[i, 5].value := '';
      MyWorkbook.worksheets[1].Cells[i, 6].value := DBGridEh1.Columns[5].Footer.SumValue;//ClientDataSet4.FieldByName('tradDis').AsString;
      MyWorkbook.worksheets[1].Cells[i, 7].value := DBGridEh1.Columns[6].Footer.SumValue;//ClientDataSet4.FieldByName('lyl').AsString;
      MyWorkbook.worksheets[1].Cells[i, 8].value := DBGridEh1.Columns[7].Footer.SumValue;//ClientDataSet4.FieldByName('avgDis').AsString;
      MyWorkbook.worksheets[1].Cells[i, 9].value := '';
      //���õ�Ԫ���ʽ
      MyWorkbook.worksheets[1].range['E4:H'+IntToStr(DataSource1.DataSet.RecordCount+4+1 )].NumberFormatLocal := '0.00';
      MyWorkbook.worksheets[1].range['B'+IntToStr(DataSource1.DataSet.RecordCount+4)+
        ':C'+IntToStr(DataSource1.DataSet.RecordCount+4+1)].NumberFormatLocal := '0';
    //�����п�
      for j := 1 to 12 do
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

procedure TtaxiRunDataFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Mainf.show_TaxiMetaRunData.Checked := False;
end;

end.
