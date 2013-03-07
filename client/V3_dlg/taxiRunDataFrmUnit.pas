unit taxiRunDataFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, ImgList, ToolWin,
  Grids, DBGridEh, ADOInt, DBClient, adodb,
  PrnDbgeh, EhLibADO, cxControls, cxSplitter, 
  IniFiles, PrViewEh, Printers,uGloabVar,CarUnit,uFrmRefreshProgress,
  XMLDoc,xmldom, XMLIntf, msxmldom, Menus, QueryServeJudgeByDRunDataFrmUnit, Service,
  QueryPicsByTimeFrmUnit, ConstDefineUnit, QueryThreadUnit;

type
  TtaxiRunDataFrm = class(TForm)
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
    Label7: TLabel;
    SpeedButtonPage: TSpeedButton;
    fromTime: TDateTimePicker;
    toTime: TDateTimePicker;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    PanelSelectGroupName: TPanel;
    BitBtn5: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButtonOneTimeClick(Sender: TObject);
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
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    procedure AddDev(id: integer; ANode: TTreeNode);
    procedure enabledbutton(flag: boolean);
    procedure ShowData(fromtime: WideString; totime: WideString;
                        PageSize: Integer; CurrPageIndex: Integer;
                        fact_Id: Integer; dev_Id: Integer; group_id: Integer;
                        group_IdList: WideString);
    { Private declarations }
  private
    FDlgProgress:TFrmRefreshProgress;
    FTradeType :String;    //��������
    FOldBizOffTime:Integer; //һ�β�ѯʱ�ݴ桡ҵ��������Ͽ�ʱ�䣬���ѯ���̽ϳ����ڲ�ѯʱ�ų���ʱ�䣬����ڲ�ѯ�����У����ǶϿ�ҵ��������ҵ��

    FInfoArray: array of oleVariant; // ��ҳ��ѯ�Ľ���ŵ���������,����ĳ��Ⱦ�����ҳ��
    
    procedure GetRunDataCount(Count: Integer);
    procedure GetRunData(Info: OleVariant);
  public
    { Public declarations }
    procedure LocalMap();
    procedure LocalHistroyRunData();
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

  group_id: integer = -1;
  group_paranet: string = '';
  fact_id: Integer = -1;
  dev_id: Integer = -1;
implementation

uses umainf,ComObj, DateUtils,waitFrmUnit, ShowMessageInfo;

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
  pageSizeStr: string;
begin
  try
    iniFile := TIniFile.Create(extractfilepath(paramstr(0)) + 'config.ini');
    pageSizeStr := iniFile.ReadString('pageSize', 'pageSize', '');
    IF pageSizeStr = '' then
      pageSize := 40
    else
      try
        pageSize := StrToInt(pageSizeStr);
      except
        pageSize := 40;
      end;
    pRecordCount := 0;
    Label1.Caption := '';
    DateTimePicker2.date := now;
    DateTimePicker1.date := IncWeek(now, -1);  //��ǰ1��
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
  FOldBizOffTime:= 0;
end;

procedure TtaxiRunDataFrm.TreeView1Click(Sender: TObject);
var
  grpId : integer;
  devGrp: TDevGroup;
  Node: TTreeNode;
  i: Integer;
begin
  Node := TreeView1.Selected;
  if Node = nil then exit;
  grpId := Integer(Node.Data);
  PanelSelectGroupName.Caption := Node.Text;
  group_id := grpId;
  group_paranet := '';

  ComboBox2.Clear;
  if (grpId >=0) then //and (not IsClickDev) and (grpId <> clickParent) then
  begin
    AddDev(grpId, Node);

    devGrp := ADevGroupManage.find(grpId);
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
    end
    else
    begin
       group_id := grpId;
       group_paranet := '';
    end;
  end;
end;
procedure TtaxiRunDataFrm.AddDev(id: integer; ANode: TTreeNode);
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

procedure TtaxiRunDataFrm.SpeedButton4Click(Sender: TObject);
begin
  Close;
end;

procedure TtaxiRunDataFrm.SpeedButtonOneTimeClick(Sender: TObject); //һ�β�ѯ
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
begin
  if GlobalParam.BizOffTime <120000 then  //С��2����
  begin
    FOldBizOffTime:= GlobalParam.BizOffTime;
    //Bs.SetBizOffTime(240*1000);//4����
  end;
  screen.Cursor := FCursor;
  enabledbutton(False);
  ComboBox1.Enabled := False;
  label1.caption := '';
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
    //������Ͻ������� =0,1,2,3
   { if ComboBoxIsPrint.Text ='' then
      FTradeType := ''
    else
      FTradeType := IntToStr(ComboBoxIsPrint.ItemIndex);    }

    FDlgProgress.Gauge1.Progress := 5;
    FDlgProgress.Show;
    Application.ProcessMessages;
    try
      pRecordCount := BS.QueryRunDataCount_Cs(FromDate, ToDate, fact_id, dev_id, group_id,
                                                group_paranet);

    except
      on E: Exception do
      begin
        FDlgProgress.Hide;
        MessageBox(0, pchar(E.Message), '��ʾ��Ϣ', mb_ok + mb_iconinformation);
        exit;
      end;
    end;
    if pRecordCount=0 then
    begin
      FDlgProgress.Hide;
      MessageBox(Handle,'�Բ���û�з������������ݣ�','��ʾ',MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

    m := pRecordCount mod pageSize;
    if m = 0 then
      pCount := pRecordCount div pageSize       //ȡ���ٴ�
    else
      pCount := pRecordCount div pageSize + 1;
    FDlgProgress.Gauge1.MaxValue := pCount +10;
    FDlgProgress.Gauge1.Progress := 10;
    Application.ProcessMessages;
    curPage := 1;

    for i:=0 to pCount -1 do
    begin
      xml := BS.QueryRunData_Cs(FromDate, ToDate,
                                 pageSize, curPage,
                                 fact_Id, dev_Id, group_id,
                                 group_paranet);


      //��info�Ĵ���
      if i=0 then
        aqStore.XMLData := xml
      else
        aqStore.XMLData := xml;
        //aqStore.AppendData(info,False);
      FDlgProgress.GaugeProcessInc(1);
      curPage := curPage + 1;
    end;
    aqStore.Open;
    DataSource1.DataSet := aqStore;
    DBGridEh1.DataSource := DataSource1;
  finally
    FCursor := 0;
    if FDlgProgress.Showing then FDlgProgress.Hide;
    if FOldBizOffTime <>0 then
      //Bs.SetBizOffTime(FOldBizOffTime);
  end; 
end;

procedure TtaxiRunDataFrm.enabledbutton(flag: boolean);
begin
  BitBtn1.Enabled := flag;
  BitBtn2.Enabled := flag;
  BitBtn3.Enabled := flag;
  BitBtn4.Enabled := flag;
end;

procedure TtaxiRunDataFrm.ShowData(fromtime: WideString; totime: WideString;
                                PageSize: Integer; CurrPageIndex: Integer;
                                fact_Id: Integer; dev_Id: Integer; group_id: Integer;
                                group_IdList: WideString);
var
  Count: integer;
  info: oleVariant;
  Str, aCarNO: string;
  aPos: integer;
  dlg: TwaitFrm;
  xml: string;

  QueryRunData: TQueryTaxiRunData;
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
      messagebox(handle, '���յ�ǰ�Ĳ�ѯ����û��Ӫ�˼�¼��', '��ʾ��Ϣ', mb_ok + mb_iconinformation);
      exit;
    end;

    if FInfoArray[curPage-1] = null then
    begin
      QueryRunData := TQueryTaxiRunData.Create(fromtime, totime,pageSize, curPage,fact_Id, dev_Id, group_id,
                                               group_paranet,GroupBox1);
      QueryRunData.OnQueryReturn := GetRunData;
    end
    else
    begin
      GetRunData(FInfoArray[curPage-1]); //aqStore.Data := FInfoArray[curPage-1];//info;
    end;

    {try
      xml := BS.QueryRunData_Cs(fromtime, totime,pageSize, curPage,fact_Id, dev_Id, group_id,
                                group_paranet);
    except
      on E: Exception do
      begin
        dlg.Hide;
        messagebox(handle, QUERY_WARNING_INFO, '��ʾ', mb_ok + mb_iconinformation);
        exit;
      end;
    end;
    aqStore.XMLData := xml;

    aqStore.Open;
    DataSource1.DataSet := aqStore;
    DBGridEh1.DataSource := DataSource1;

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
    end;    }
  finally
    dlg.Free;
    screen.Cursor := crDefault;
  end;
end;
procedure TtaxiRunDataFrm.SpeedButton3Click(Sender: TObject);
var
  Str, str1: string;
  Title: string;
begin
  try
    Title := '';
    if Length(Trim(ComboBox2.Text)) > 0 then
    begin
      Title := Trim(ComboBox2.Text);
    end
    else
    begin
      if Length(Trim(PanelSelectGroupName.Caption)) > 0 then
      begin
        Title := Trim(PanelSelectGroupName.Caption);
      end
      else
      begin
        Title := '���г���'
      end;
    end;

    //Str := '���ʹ�Ӫ����Ϣ';
    Str := FormatDateTime('yyyy-mm-dd', DateTimePicker1.Date) + '��' +
      FormatDateTime('yyyy-mm-dd', DateTimePicker2.Date) + '['+ Title +'] '+' �ʹ���ϸ';
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

procedure TtaxiRunDataFrm.BitBtn1Click(Sender: TObject);
begin
  if pRecordCount = 0 then exit;
  curPage := 1;
  ShowData(FromDate, ToDate, pageSize, curPage,fact_Id, dev_Id, group_id,group_paranet);
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
  ShowData(FromDate, ToDate, pageSize, curPage,fact_Id, dev_Id, group_id,group_paranet);
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
  ShowData(FromDate, ToDate, pageSize, curPage,fact_Id, dev_Id, group_id,group_paranet);
end;

procedure TtaxiRunDataFrm.BitBtn4Click(Sender: TObject);
begin
  if pRecordCount = 0 then exit;
  curPage := pCount;
  ShowData(FromDate, ToDate, pageSize, curPage,fact_Id, dev_Id, group_id,group_paranet);
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
    messagebox(handle, '���յ�ǰ�Ĳ�ѯ����û��Ӫ�˼�¼��', '��ʾ��Ϣ', mb_ok + mb_iconinformation);
    exit;
  end;
  try
    pageCount := strtoint(ComboBox1.Text);
  except
    self.ComboBox1.Text := '';
    messagebox(handle, '����ȷ����Ҫ��ѯ��ҳ��', '��ʾ��Ϣ', mb_ok + mb_iconinformation);
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
  ShowData(FromDate, ToDate, pageSize, curPage,fact_Id, dev_Id, group_id,group_paranet);
end;

procedure TtaxiRunDataFrm.DBGridEh1DblClick(Sender: TObject);
var
  car_No:string;
  Dev_Id: Integer;
begin
  try
    Dev_Id := aqStore.FieldValues['DEV_ID'];
    GCurSelectDev_rundata  := ADeviceManage.find(Dev_Id);
    //car_No := aqStore.FieldValues['car_No'];
    //GCurSelectDev_rundata:=ADeviceManage.FindDevFromCarNo(car_No);
    if GCurSelectDev_rundata <> nil then
    begin
      GCurSelectDev_rundata.Longitude := aqStore.FieldValues['Onlongitude'];
      GCurSelectDev_rundata.Latitude := aqStore.FieldValues['OnLatitude'];
      LocalMap;
      umainf.Mainf.fun_Locate_CarExecute_rundata('�ϳ��ص�');
    end;
  except
  end;
end;

procedure TtaxiRunDataFrm.DBGridEh1CellClick(Column: TColumnEh);
var
  car_No:string;
  Dev_Id: Integer;
begin
  Dev_Id := aqStore.FieldValues['Dev_Id'];
  GCurSelectDev := ADeviceManage.find(Dev_Id);
  //car_No := aqStore.FieldValues['car_No'];
  //GCurSelectDev:=ADeviceManage.FindDevFromCarNo(car_No);
  if GCurSelectDev = nil then Exit;
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
          FormatDateTime('yyyy-mm-dd', DateTimePicker2.Date) + ' �ʹ���Ϣ'
      else
        Str := FormatDateTime('yyyy-mm-dd', DateTimePicker1.Date) + '��' +
          FormatDateTime('yyyy-mm-dd', DateTimePicker2.Date) + '['+ComboBox2.Text +'] ' + ' �ʹ���Ϣ';
      MyWorkbook.worksheets[1].Cells[1, 1].value := Str;
      //��Ԫ��ϲ�
      MyWorkbook.worksheets[1].range['A2:I2'].Merge(true);
      MyWorkbook.worksheets[1].Cells[2, 1].value := Label1.Caption;
    //��ͷ
      i := 3;
      MyWorkbook.worksheets[1].Cells[i, 1].value := '���ƺ�';
      //MyWorkbook.worksheets[1].Cells[i, 2].value := '�ϳ�����';
      MyWorkbook.worksheets[1].Cells[i, 2].value := '�ϳ�ʱ��';
      MyWorkbook.worksheets[1].Cells[i, 3].value := '�³�ʱ��';
      MyWorkbook.worksheets[1].Cells[i, 4].value := '����';
      MyWorkbook.worksheets[1].Cells[i, 5].value := 'Ӫ�˽��';
      MyWorkbook.worksheets[1].Cells[i, 6].value := 'Ӫ�����';
      MyWorkbook.worksheets[1].Cells[i, 7].value := '��ʻ���';
      MyWorkbook.worksheets[1].Cells[i, 8].value := '�Ⱥ�ʱ��';

    //������ɫ
      MyWorkbook.worksheets[1].range['A1:I2'].Font.Color := clBlue;
    //����
      MyWorkbook.worksheets[1].range['A1:I1'].Font.Name := '����';
    //�ֺ�
      MyWorkbook.worksheets[1].range['A1:I1'].Font.Size := 18;
    //ȡ��
      i := i+1;
      DataSource1.DataSet.First;
       //���õ�Ԫ���ʽ
      MyWorkbook.worksheets[1].range['E4:H'+IntToStr(DataSource1.DataSet.RecordCount+4+1 )].NumberFormatLocal := '0.00';
      MyWorkbook.worksheets[1].range['B'+IntToStr(DataSource1.DataSet.RecordCount+4)+
                                     ':C'+IntToStr(DataSource1.DataSet.RecordCount+4+1)].NumberFormatLocal := '0';

      while not DataSource1.DataSet.Eof do
      begin
        MyWorkbook.worksheets[1].Cells[i, 1].value := DataSource1.DataSet.FieldByName('Car_no').AsString;
        //MyWorkbook.worksheets[1].Cells[i, 2].value := DataSource1.DataSet.FieldByName('Ondate').AsString;
        MyWorkbook.worksheets[1].Cells[i, 2].value := DataSource1.DataSet.FieldByName('ONTIME').AsString;
        MyWorkbook.worksheets[1].Cells[i, 3].value := DataSource1.DataSet.FieldByName('OFFTIME').AsString;
        MyWorkbook.worksheets[1].Cells[i, 4].value := DataSource1.DataSet.FieldByName('DJ').AsString;
        MyWorkbook.worksheets[1].Cells[i, 5].value := DataSource1.DataSet.FieldByName('YYJE').AsString;
        MyWorkbook.worksheets[1].Cells[i, 6].value := DataSource1.DataSet.FieldByName('YYLC').AsString;
        MyWorkbook.worksheets[1].Cells[i, 7].value := DataSource1.DataSet.FieldByName('KSLC').AsString;
        MyWorkbook.worksheets[1].Cells[i, 8].value := DataSource1.DataSet.FieldByName('WAITTIME').AsString;
        DataSource1.DataSet.Next;
        inc(i);
      end;

      //����ϼ��� sha
      MyWorkbook.worksheets[1].Cells[i, 1].value :='�ϼ�:';
      MyWorkbook.worksheets[1].Cells[i, 2].value := DBGridEh1.Columns[1].Footer.SumValue;
      MyWorkbook.worksheets[1].Cells[i, 3].value := '';
      MyWorkbook.worksheets[1].Cells[i, 4].value := '';
      MyWorkbook.worksheets[1].Cells[i, 5].value := DBGridEh1.Columns[7].Footer.SumValue;//ClientDataSet4.FieldByName('tradDis').AsString;
      MyWorkbook.worksheets[1].Cells[i, 6].value := DBGridEh1.Columns[8].Footer.SumValue;//ClientDataSet4.FieldByName('lyl').AsString;
      MyWorkbook.worksheets[1].Cells[i, 7].value := DBGridEh1.Columns[9].Footer.SumValue;//ClientDataSet4.FieldByName('avgDis').AsString;
      MyWorkbook.worksheets[1].Cells[i, 8].value := '';

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
  ManualDock(nil);
  //Mainf.show_TaxiMetaRunData.Checked := False;
end;

function GetTime(onDateTime: TDateTime; offTime: TTime): string;
var
 onYear: Integer;
 onMonth: Word;
 onDay: Word;
 onHour: Word;
 onMintue: Word;
 onSecond: Word;
 
 offHour: Word;
 offMintue: Word;
 offSecond: Word;
 LeapYear: Boolean;

 dateTime: TDateTime;
begin
  LeapYear := False;

  if (onYear mod 4 = 0) and ((onYear mod 100 <> 0) or (onYear mod 400 = 0)) then
    LeapYear := True;

  onYear := YearOf(onDateTime);
  onMonth := MonthOf(onDateTime);
  onDay := DayOf(onDateTime);
  onHour := HourOf(onDateTime);
  //onMintue := MinuteOf(onDateTime);
  //onSecond := SecondOf(onDateTime);

  offHour := HourOf(offTime);
  offMintue := MinuteOf(offTime);
  offSecond := SecondOf(offTime);

  if offHour < onHour then
  begin
    case onMonth of
      1,3,5,7,8,10,12:
        begin
          onDay := onDay + 1;
          if onDay = 32 then
          begin
            onMonth := onMonth + 1;
            onDay := onDay - 1;
          end;
          if onMonth = 13 then
          begin
            onYear := onYear + 1;
            onMonth := onMonth - 1;
          end;
        end; // 31
      2:
        begin
          onDay := onDay + 1;
          if (LeapYear = True) and (onDay = 30) then
          begin
            onMonth := onMonth + 1;
            onDay := onDay - 1;
          end;
          if (LeapYear = False) and (onDay = 29) then
          begin
            onMonth := onMonth + 1;
            onDay := onDay - 1;
          end;
          if onMonth = 13 then
          begin
            onYear := onYear + 1;
            onMonth := onMonth - 1;
          end;

        end;
      4,6,9,11:
        begin
          onDay := onDay + 1;
          if onDay = 31 then
          begin
            onMonth := onMonth + 1;
            onDay := onDay - 1;
          end;
          if onMonth = 13 then
          begin
            onYear := onYear + 1;
            onMonth := onMonth - 1;
          end;
        end;        //30
    end;
  end;
  dateTime := EncodeDate(onYear, onMonth, onDay);
  ReplaceTime(dateTime, EncodeTime(offHour, offMintue, offSecond,0));
  Result := FormatDateTime('yyyy-mm-dd hh:nn:ss', dateTime);

end;

procedure TtaxiRunDataFrm.N1Click(Sender: TObject);
var
  fact_id: Integer;
  dev_id: Integer;
  onTime: string;
  offTime: string;
  info: string;
  dlg: TQueryServeJudgeByDRunDataFrm;
begin
  fact_id := DBGridEh1.FieldColumns['FACT_ID'].Field.AsInteger;
  dev_id := DBGridEh1.FieldColumns['DEV_ID'].Field.AsInteger;
  onTime := FormatDateTime('YYYY-MM-DD hh:nn:ss', StrToDateTime(DBGridEh1.FieldColumns['onTime'].Field.AsString));
  offTime :=GetTime(StrToDateTime(DBGridEh1.FieldColumns['onTime'].Field.AsString),
             StrToTime(DBGridEh1.FieldColumns['offTime'].Field.AsString));
  try
    info := bs.QueryServeJudgeByDRunData(fact_id, dev_id, onTime, offTime);
  except
    on E: Exception do
    begin
      messagebox(handle, QUERY_WARNING_INFO, '��ʾ', mb_ok + mb_iconinformation);
      exit;
    end;
  end;
  if info = '' then
  begin
    MessageBox(self.Handle, '�ü�¼��������Ϣ!', '��ʾ', mb_iconinformation + mb_ok);
    Exit;
  end;

  try
    dlg := TQueryServeJudgeByDRunDataFrm.create(self);
    dlg.xml :=  info;
    dlg.ShowModal;
  finally
    dlg.Free;
  end;
  
end;

procedure TtaxiRunDataFrm.N2Click(Sender: TObject);
var
  fact_id: Integer;
  dev_id: Integer;
  onTime: string;
  offTime: string;
  info: ArrayOfPicInfo;
  dlg: TQueryPicsByTimeFrm;
begin
  fact_id := DBGridEh1.FieldColumns['FACT_ID'].Field.AsInteger;
  dev_id := DBGridEh1.FieldColumns['DEV_ID'].Field.AsInteger;
  onTime := FormatDateTime('YYYY-MM-DD hh:nn:ss', StrToDateTime(DBGridEh1.FieldColumns['onTime'].Field.AsString));
  offTime :=GetTime(StrToDateTime(DBGridEh1.FieldColumns['onTime'].Field.AsString),
             StrToTime(DBGridEh1.FieldColumns['offTime'].Field.AsString));
  try
    info := bs.QueryPicsByTime(fact_id, dev_id, onTime, offTime);
  except
    on E: Exception do
    begin
      messagebox(handle, QUERY_WARNING_INFO, '��ʾ', mb_ok + mb_iconinformation);
      exit;
    end;
  end;
  if info = nil then
  begin
    MessageBox(self.Handle, '�ü�¼����Ƭ��Ϣ!', '��ʾ', mb_iconinformation + mb_ok);
    Exit;
  end;

  try
    dlg := TQueryPicsByTimeFrm.create(self);
    dlg.PicInfoBuf := info;
    dlg.car_no := DBGridEh1.FieldColumns['CAR_NO'].Field.AsString;
    dlg.ShowModal;
  finally
    dlg.Free;
  end;
end;

procedure TtaxiRunDataFrm.N4Click(Sender: TObject);
var
  car_No:string;
  Dev_Id: Integer;
begin
  try
    Dev_Id := aqStore.FieldValues['DEV_ID'];
    GCurSelectDev_rundata  := ADeviceManage.find(Dev_Id);
    //car_No := aqStore.FieldValues['car_No'];
    //GCurSelectDev_rundata:=ADeviceManage.FindDevFromCarNo(car_No);
    if GCurSelectDev_rundata <> nil then
    begin
       GCurSelectDev_rundata.Longitude := aqStore.FieldValues['longitude'];
       GCurSelectDev_rundata.Latitude := aqStore.FieldValues['Latitude'];
       LocalMap;
      umainf.Mainf.fun_Locate_CarExecute_rundata('�³��ص�');
    end;
  except
  end;
end;

procedure TtaxiRunDataFrm.N3Click(Sender: TObject);
var
  car_No:string;
  Dev_Id: Integer;
begin
  try
    Dev_Id := aqStore.FieldValues['DEV_ID'];
    GCurSelectDev_rundata  := ADeviceManage.find(Dev_Id);
    //car_No := aqStore.FieldValues['car_No'];
    //GCurSelectDev_rundata:=ADeviceManage.FindDevFromCarNo(car_No);
    if GCurSelectDev_rundata <> nil then
    begin
      GCurSelectDev_rundata.Longitude := aqStore.FieldValues['Onlongitude'];
      GCurSelectDev_rundata.Latitude := aqStore.FieldValues['OnLatitude'];
      LocalMap;
      umainf.Mainf.fun_Locate_CarExecute_rundata('�ϳ��ص�');
    end;
  except
  end;
end;

procedure TtaxiRunDataFrm.N5Click(Sender: TObject);
var
  car_No:string;
  BeginDateTime, EndDateTime: string;
  Dev_Id: Integer;
  i: Integer;
begin
  try
    Dev_Id := aqStore.FieldValues['DEV_ID'];
    GCurSelectDev_rundata  := ADeviceManage.find(Dev_Id);
    //car_No := aqStore.FieldValues['car_No'];
    //GCurSelectDev_rundata:=ADeviceManage.FindDevFromCarNo(car_No);
    if GCurSelectDev_rundata <> nil then
    begin
      BeginDateTime := FormatDateTime('YYYY-MM-DD hh:nn:ss', StrToDateTime(DBGridEh1.FieldColumns['onTime'].Field.AsString));
      EndDateTime :=GetTime(StrToDateTime(DBGridEh1.FieldColumns['onTime'].Field.AsString),
             StrToTime(DBGridEh1.FieldColumns['offTime'].Field.AsString + ':59'));
      LocalMap;
      LocalHistroyRunData;
      umainf.Mainf.ShowHistoryRunData(StrToDateTime(BeginDateTime), StrToDateTime(EndDateTime), GCurSelectDev_rundata);
    end;
  except
  end;
end;

procedure TtaxiRunDataFrm.LocalMap;
var
  i: Integer;
begin
  with umainf.Mainf do
  begin
    if (not FDlg_Map.Visible) or (FDlg_Map.Floating) then
    begin
      FDlg_Map.ManualDock(PageControl_Center, nil, alLeft);
      FDlg_Map.Show;
    end;

    if PageControl_Center.PageCount >1 then
    begin
      //���� ��ͼ����Ϊ�����
      for i := 0 to PageControl_Center.PageCount - 1 do
      begin
        if PageControl_Center.Pages[i].Caption = FDlg_Map.Caption then
        begin
          try
            PageControl_Center.ActivePageIndex := i;
          except
            break;
          end;
          break;
        end;
      end;
    end;
  end;
end;

procedure TtaxiRunDataFrm.LocalHistroyRunData();
var
  i: Integer;
begin
  with umainf.Mainf do
  begin
    if (not FDlg_HisForm.Visible) or (FDlg_HisForm.Floating) then
    begin
      FDlg_HisForm.ManualDock(PageControlBottom, nil, alLeft);
      FDlg_HisForm.Show;
    end;

    if PageControlBottom.PageCount >1 then
    begin
      //���� ��ͼ����Ϊ�����
      for i := 0 to PageControlBottom.PageCount - 1 do
      begin
        if PageControlBottom.Pages[i].Caption = FDlg_HisForm.Caption then
        begin
          try
            PageControlBottom.ActivePageIndex := i;
          except
            break;
          end;
          break;
        end;
      end;
    end;

    if not show_GPSHostory.Checked then
      show_GPSHostory.Checked := True;
  end;
end;

procedure TtaxiRunDataFrm.GetRunData(Info: OleVariant);
begin
  try
    try
      if Info = null then
      begin
        messagebox(0, '��ѯ���Ϊ��', '��ʾ', mb_ok + MB_ICONWARNING);
        Exit;
      end;

      FInfoArray[curPage-1] := Info;
      aqStore.XMLData := FInfoArray[curPage-1];
      //aqStore.Open;
      DataSource1.DataSet := aqStore;
      DBGridEh1.DataSource := DataSource1;
      DataSource1.Enabled := True;

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
    except
      on e: Exception do
      begin
        messageErrorBox('�ʹ���ϸ���������ȷ��', e.Message);
      end;
    end;
  finally
  end;
end;

procedure TtaxiRunDataFrm.GetRunDataCount(Count: Integer);
var
  m: integer;
  i: integer;
  Str, aCarNO: string;
  dev:TDevice;
begin
  try
    pRecordCount := Count;
    m := pRecordCount mod pageSize;
    if m = 0 then
      pCount := pRecordCount div pageSize
    else
      pCount := pRecordCount div pageSize + 1;

    SetLength(FInfoArray, pCount);
    for i:=0 to pCount-1 do
    begin
      FInfoArray[i] := null;
    end;

    curPage := 1;
    ComboBox1.Enabled :=True;
    ComboBox1.Items.Clear;
    for i := 1 to pCount do
      ComboBox1.Items.add(inttostr(i));

    for i := 0 to DBGridEh1.Columns.Count - 1 do
      DBGridEh1.Columns.Items[i].Title.TitleButton := true;

    //ShowData(CarNo, FromDate, ToDate, (curPage - 1) * pageSize, pageSize, GroupBox1);
    ShowData(FromDate, ToDate, pageSize, curPage, fact_Id, dev_Id, group_id,group_paranet);
  except
    on e: Exception do
    begin
      messageErrorBox('�ʹ���ϸ���������ȷ��', e.Message);
    end;
  end;
end;

procedure TtaxiRunDataFrm.BitBtn5Click(Sender: TObject);
var
  m: integer;
  FCursor: TCursor;
  i, aPos: integer;
  Str, aCarNO: string;
  dlg: TwaitFrm;
  dev:TDevice;
  startDateTime, endDateTime: Tdatetime;

  QueryRunData: TQueryTaxiRunDataCount;
begin
  screen.Cursor := FCursor;
  enabledbutton(False);                   
  label1.caption := '';
  try
    FCursor := -11;
    //������
    DataSource1.DataSet := nil;

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

    dlg := TwaitFrm.Create(nil);
    dlg.Show;
    Application.ProcessMessages;
    CarNo := trim(ComboBox2.Text);

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
    //������Ͻ������� =0,1,2,3
    if ComboBoxIsPrint.Text ='' then
      FTradeType := ''
    else
      FTradeType := IntToStr(ComboBoxIsPrint.ItemIndex);

    QueryRunData := TQueryTaxiRunDataCount.Create(FromDate, ToDate, fact_id, dev_id, group_id,
                                                  group_paranet, BitBtn5);
    QueryRunData.OnQueryReturn := GetRunDataCount;

  finally
    dlg.Free;
    FCursor := 0;
  end;
end;

end.
