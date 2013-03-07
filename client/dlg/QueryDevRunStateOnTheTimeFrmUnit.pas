unit QueryDevRunStateOnTheTimeFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ComCtrls, cxControls,
  cxSplitter, ExtCtrls, CarUnit, uGloabVar, DBClient, DB, PrnDbgeh,
  PrViewEh, Printers, EhLibADO,uFrmRefreshProgress,QueryThreadUnit,
  AdvWiiProgressBar;
const
  CM_TONEXT = WM_USER + $1007;
type
  TQueryDevRunStateOnTheTimeFrm = class;
  
  TOutFromNowThread = class(TThread)
  protected
    procedure AddMemo(s:string);
    procedure Execute; override;
  private
    frm:TQueryDevRunStateOnTheTimeFrm;
    group_id:Integer; 
    procedure OutExcel_outFromNow;
  public
    FOutFromNow_OutTime : TDateTime;//�������𵼳���������ʱ��
    running:boolean;
    constructor Create();
    destructor Destroy(); override;
  end;

  TQueryDevRunStateOnTheTimeFrm = class(TForm)
    PageControl1: TPageControl;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    TreeView1: TTreeView;
    PanelSelectGroupName: TPanel;
    PrintDBGridEh2: TPrintDBGridEh;
    DataSource2: TDataSource;
    ClientDataSet2: TClientDataSet;
    TabSheetOutThePoint: TTabSheet;
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
    cxSplitter2: TcxSplitter;
    Label1: TLabel;
    Label2: TLabel;
    Timer1: TTimer;
    TabSheetOutTheTimes: TTabSheet;
    Panel2: TPanel;
    Label3: TLabel;
    SpeedButtonOut: TSpeedButton;
    Label4: TLabel;
    ComboBoxOut: TComboBox;
    BitBtn3: TBitBtn;
    DateTimePicker_outFromTime: TDateTimePicker;
    DateTimePicker_outFromDate: TDateTimePicker;
    DateTimePicker_outEndDate: TDateTimePicker;
    DateTimePicker_outEndTime: TDateTimePicker;
    Label5: TLabel;
    EditOutTimeDelay: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    EditOutExcelPath: TEdit;
    ClientDataSetOut: TClientDataSet;
    DataSourceOut: TDataSource;
    PrintDBGridEhOut: TPrintDBGridEh;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    TabSheet4: TTabSheet;
    TimerOutFromNow: TTimer;
    MemoOutFromNow: TMemo;
    Panel3: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Edit_OutFromNow_Interval: TEdit;
    Edit_OutFromNow_OutPath: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    DateTimePicker_OutFromNow_Date: TDateTimePicker;
    DateTimePicker_OutFromNow_Time: TDateTimePicker;
    BitBtnOutFromNow: TBitBtn;
    SpeedButton_OutFromNow_SelectOutPath: TSpeedButton;
    BitBtn1: TBitBtn;
    Label20: TLabel;
    SpeedButton1: TSpeedButton;
    DBGridEhOut: TDBGridEh;
    PanelShowNowOut: TPanel;
    Label21: TLabel;
    AdvWiiProgressBar1: TAdvWiiProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure BitBtnCloseClick(Sender: TObject);
    procedure BitBtnExcelOverSpeedClick(Sender: TObject);
    procedure SpeedButtonPrintOverSpeedClick(Sender: TObject);
    procedure SpeedButtonQryOverSpeedClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditTimeLenKeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButtonOutClick(Sender: TObject);
    procedure SpeedButton_OutFromNow_SelectOutPathClick(Sender: TObject);
    procedure BitBtnOutFromNowClick(Sender: TObject);
    procedure Edit_OutFromNow_IntervalKeyPress(Sender: TObject;
      var Key: Char);
    procedure TimerOutFromNowTimer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ComboBoxCarNoOverSpeedChange(Sender: TObject);
    procedure ComboBoxCarNoOverSpeedKeyPress(Sender: TObject;
      var Key: Char);
    procedure ComboBoxCarNoOverSpeedKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBoxCarNoOverSpeedSelect(Sender: TObject);
    procedure ComboBoxOutChange(Sender: TObject);
    procedure ComboBoxOutKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBoxOutKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBoxOutSelect(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    FOutFromNowThread:TOutFromNowThread;
    FisClosed :boolean;
    FSearch: Boolean;
    FProgressdlg : TFrmRefreshProgress;
    FProgressdlg_ThePoint : TFrmRefreshProgress;
    FQueryFromTime:TDateTime;//��ѯ��ʼʱ�䣬����Ϊ��ѯ��ʱ�õģ�������
    FOut_EndDatetime:TDateTime;//������ѯ�Ľ���ʱ��
    FQueryDevRunStateOnTheTime_Times:TQueryDevRunStateOnTheTimeThd;
    FQueryDevRunStateOnTheTime_D:TQueryDevRunStateOnTheTimeThd;
    FQueryBj:integer;//��2-������0 -������
    FQueryBj_D:Integer;//1-ĳʱ����ѯ  0 -������
    FQueryTime:TDateTime;   //������ѯ�ĵ�ǰ��ѯʱ��
    FOutExcelOkCnt:integer;//�ɹ���ѯ�����ı������

    procedure AddDev(grpId: integer);
    procedure InitEdit;
    procedure ExpandTreeView;
    procedure ListGroup;
    function ReturnAddrByLongLati(longi, lati: double):string;
    procedure OnQueryReturnInfo_Times(AInfo: string);
    procedure OnQueryReturnInfo_D(AInfo: string);
    procedure QueryOut;
    //����excel,���յ���ѯһ��ʱ���Ľ��ʱ(���ڲ�ѯ��������ҳ��)
    procedure outExcel_AtRcvQueryResult(FQueryTime: TDateTime);
    procedure AddMemo(Str: string);

    procedure DealFreeTheThread();
  public
    { Public declarations }
    function IsProgressDlgVisible: Boolean;
  end;

var
  QueryDevRunStateOnTheTimeFrm: TQueryDevRunStateOnTheTimeFrm;
  group_id: integer = -1;
  group_paranet: string = '';

implementation
uses ComObj,DateUtils,umainf,metadefine, StrUtils,SelectDirFrmUnit,
  GpsOffSetService_ImplUnit,ActiveX;
{$R *.dfm}

procedure TQueryDevRunStateOnTheTimeFrm.AddDev(grpId: integer);
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
      if dev.GroupID= grpId then
      begin
        ComboBoxCarNoOverSpeed.Items.AddObject(dev.Car.No,dev);
      end;
    end; 
  finally
  end;
end;

procedure TQueryDevRunStateOnTheTimeFrm.ExpandTreeView;
var
  i: integer;
begin
  for i := 0 to TreeView1.Items.Count - 1 do
    TreeView1.Items[i].Expanded := True;
end;

procedure TQueryDevRunStateOnTheTimeFrm.InitEdit;
begin
  ComboBoxCarNoOverspeed.clear;
  FromDate.date := now;
  FromTime.Time := EncodeTime(0,0,0,0);
  PageControl1.ActivePageIndex := 0;

  DateTimePicker_outFromDate.Date := now;
  DateTimePicker_outFromTime.Time := EncodeTime(0,0,0,0);
  DateTimePicker_outEndDate.Date := now;
  DateTimePicker_outEndTime.Time := now;
  EditOutExcelPath.Text := ExtractFilePath(Application.ExeName);

  DateTimePicker_OutFromNow_Date.Date := now;
  DateTimePicker_OutFromNow_Time.Time := EncodeTime(HourOf(now)+1,0,0,0);
//  DateTimePicker_OutFromNow_Time.Time := now;
  Edit_OutFromNow_OutPath.Text := ExtractFilePath(Application.ExeName);    
  MemoOutFromNow.Clear;
end;

procedure TQueryDevRunStateOnTheTimeFrm.ListGroup;
var
  vn_node: TTreeNode;
  cnt: integer;
  j: integer;
begin
 {*******************************}
  TreeView1.Items.Clear;
  if ADevGroupManage.Count = 0 then exit;
  vn_node := TreeView1.Items.add(TreeView1.topitem, '���г���');
  vn_node.Data := Pointer(-1); //���г���
  cnt := ADevGroupManage.Count;
  group_list(0, vn_node, cnt,treeview1);
  vn_Node.Expanded:=true;       //ExpandTreeView;
end;

procedure TQueryDevRunStateOnTheTimeFrm.FormCreate(Sender: TObject);
begin
  PanelShowNowOut.Visible := False;

  FisClosed := false;
  InitEdit;
  ListGroup;
  PanelSelectGroupName.Caption := '���г���';
end;

procedure TQueryDevRunStateOnTheTimeFrm.TreeView1Click(Sender: TObject);
  procedure ListGrpDev_groupParent(devGrp:TDevGroup);
  var
    i: integer;
    grp: TDevGroup;
  begin
    if not devGrp.leaf_nod then //==  ˵���Ǹ��ڵ�
    begin   
      if devGrp.SonList.Count > 0 then
      begin 
        for i := 0 to devGrp.SonList.Count - 1 do
        begin
          grp := ADevGroupManage.find(devgrp.SonListItems[i]);
          if grp =nil then Continue;
          if grp.leaf_nod then
          begin
            AddDev(grp.id);
            group_paranet := group_paranet + ',' + inttostr(devgrp.SonListItems[i]);
          end
          else
            ListGrpDev_groupParent(grp);
        end;
      end;
    end;
  end;
var
  devGrp: TDevGroup;
  Node: TTreeNode;
begin
  Node := TreeView1.Selected;
  if Node = nil then exit;
  PanelSelectGroupName.Caption := Node.Text;
  group_id := Integer(Node.Data);

  group_paranet:='';
  ComboBoxCarNoOverSpeed.Clear;
  if (group_id >= 0) then //and (not IsClickDev) and (grpId <> clickParent) then
  begin
    AddDev(group_id);
    devGrp := ADevGroupManage.find(group_id);
    group_paranet :='';
    if devGrp <>nil then
      ListGrpDev_groupParent(devGrp);
    if group_paranet =',' then
      group_paranet :=''
    else
    begin
      if LeftStr(group_paranet,1)=',' then
        group_paranet := RightStr(group_paranet,length(group_paranet)-1);
      if RightStr(group_paranet,1)=',' then
        group_paranet := LeftStr(group_paranet,Length(group_paranet)-1);
    end;
  end;
//  Label2.Caption := group_paranet;
end;

procedure TQueryDevRunStateOnTheTimeFrm.SpeedButton4Click(Sender: TObject);
begin
  close;
end;

procedure TQueryDevRunStateOnTheTimeFrm.BitBtnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TQueryDevRunStateOnTheTimeFrm.BitBtnExcelOverSpeedClick(Sender: TObject);
var
  i, j,k: Integer;
  s: string;
  Str: string;
  fromDatetime, toDatetime: string;
  tmpStr: string;
   ExcelApp, MyWorkbook: oleVariant;
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
      MyWorkbook.worksheets[1].range['A1:I1'].Merge(true);
    //��Ԫ�����
      MyWorkbook.worksheets[1].range['A1:I2'].HorizontalAlignment := $FFFFEFF4;
    //����ͷ
      if group_id <>-1 then
        s:= ADevGroupManage.Find(group_id).Name;
      if ComboBoxCarNoOverSpeed.Text <>'' then
        s:= s+ '['+ComboBoxCarNoOverSpeed.Text+']'
      else
        s:= s+ '[ȫ������]';
      fromDatetime :=FormatDatetime('yyyy-mm-dd ',fromDate.Date)+FormatDatetime('hh:nn:ss',fromTime.Time);
      Str := fromDatetime+   s+ ' ����״̬��ѯ';

      MyWorkbook.worksheets[1].Cells[1, 1].value := Str;
    //��ͷ
      i := 2;
      k:= 1;
      for j := 1 to DBGridEh2.Columns.Count do
      begin
        if not DBGridEh2.Columns.Items[j-1].Visible then continue;
        MyWorkbook.worksheets[1].Cells[i, k].value := DBGridEh2.Columns.Items[j-1].Title.Caption;
        k:= k+1;
      end;
    //������ɫ
      MyWorkbook.worksheets[1].range['A1:K2'].Font.Color := clBlue;
    //����
      MyWorkbook.worksheets[1].range['A1:K1'].Font.Name := '����';
    //�ֺ�
      MyWorkbook.worksheets[1].range['A1:K1'].Font.Size := 18;
    //ȡ��
      i := 3;
      ClientDataSet2.First;
      while not ClientDataSet2.Eof do
      begin
        k:= 1;
        for j := 1 to  DBGridEh2.Columns.Count do
        begin
          if not DBGridEh2.Columns.Items[j-1].Visible then continue;
          tmpStr := DBGridEh2.Columns.Items[j-1].FieldName;
          MyWorkbook.worksheets[1].Cells[i, k].value := ClientDataSet2.FieldValues[tmpStr];
          k:= k+1;
        end;
        ClientDataSet2.Next;
        Inc(i);
      end;

      //����ϼ��� sha 20081118
      MyWorkbook.worksheets[1].Cells[i, 1].value :='�ϼ�:';
      MyWorkbook.worksheets[1].Cells[i, 2].value := DBGridEh2.Columns[1].Footer.SumValue;
      MyWorkbook.worksheets[1].Cells[i, 6].value := DBGridEh2.Columns[6].Footer.SumValue;
          //���úϼƵ�Ԫ���ʽ
      MyWorkbook.worksheets[1].range['B'+IntToStr(3)+':B'+IntToStr(ClientDataSet2.RecordCount+3)].NumberFormatLocal := '0';
      MyWorkbook.worksheets[1].range['F'+IntToStr(ClientDataSet2.RecordCount+3)+':F'+IntToStr(ClientDataSet2.RecordCount+3)].NumberFormatLocal := '0';
      //�������ڸ�ʽ
      MyWorkbook.worksheets[1].range['D'+IntToStr(3)+':D'+IntToStr(ClientDataSet2.RecordCount+3)].NumberFormatLocal := 'yyyy-mm-dd hh:mm:ss';
    //�����п�
      MyWorkbook.worksheets[1].Columns[1].ColumnWidth := 12;
      MyWorkbook.worksheets[1].Columns[2].ColumnWidth := 18;
      MyWorkbook.worksheets[1].Columns[3].ColumnWidth := 18;
      MyWorkbook.worksheets[1].Columns[4].ColumnWidth := 20;
      for j := 5 to DBGridEh2.Columns.Count do
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
    MyWorkbook := Unassigned;
    ExcelApp := Unassigned;
  end;
end;

procedure TQueryDevRunStateOnTheTimeFrm.SpeedButtonPrintOverSpeedClick(Sender: TObject);
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
    Str := s+ '����״̬����'+#13#10#13#10+'ʱ�䣺'+fromDatetime ;
    PrintDBGridEh2.PageHeader.CenterText.Clear;
    PrintDBGridEh2.PageHeader.CenterText.add(Str);  
    PrintDBGridEh2.PageFooter.LeftText.Clear;
    PrintDBGridEh2.PageFooter.LeftText.Add('��ӡʱ�䣺'+FormatDateTime('yyyy-mm-dd hh:nn',now));
    PrintDBGridEh2.PageFooter.RightText.Clear;
    PrintDBGridEh2.PageFooter.RightText.Add(ReportFooter);
    PrinterPreview.Previewer.ViewMode := vmPageWidth;
    PrinterPreview.Orientation := poLandscape;
    PrintDBGridEh2.PageFooter.CenterText.Clear;
    PrintDBGridEh2.PageFooter.CenterText.Add('��&[Page]ҳ����&[Pages]ҳ');   
    PrintDBGridEh2.Preview;
  except
  end;
end;

procedure TQueryDevRunStateOnTheTimeFrm.SpeedButtonQryOverSpeedClick(Sender: TObject);
var
  fromDatetime:string;
  toDatetime:string;
  ind:integer;
  IDStr:string;
  dev: TDevice;
  dataset:TClientDataSet;
  conditionStr:string;
  i:integer;
  devGrp: TDevGroup;
  group_Id_Input:integer;
begin
  if FQueryBj_D=1 then
  begin
    MessageBox(Handle,'ǰһ�β�ѯ��δ���������Ժ�������ѯ','��ʾ',MB_OK+MB_ICONWARNING);
    exit;
  end;

//  label1.caption := FormatDatetime('hh:nn:ss',now);
  SpeedButtonQryOverSpeed.Enabled := False;
  FreeandNil(FProgressdlg_ThePoint);
  FProgressdlg_ThePoint := TFrmRefreshProgress.create(TabSheetOutThePoint);
  FProgressdlg_ThePoint.SetCaption('���ڼ������ݣ����Ժ�...');
  FProgressdlg_ThePoint.Gauge1.MinValue := 0;
  FProgressdlg_ThePoint.Gauge1.MaxValue := 20;
  FProgressdlg_ThePoint.Gauge1.Progress := 0;
  FQueryFromTime := Now;
  Timer1.Enabled := False;
    if (group_id <>-1 ) then
    begin
      devGrp := ADevGroupManage.find(group_id);
      if devGrp = nil then Exit;
      FProgressdlg_ThePoint.Gauge1.MaxValue :=7+devGrp.DevListCount;
      Timer1.Interval := 3000;
      Timer1.Enabled := True;
    end;

  try
    fromDatetime :=FormatDatetime('yyyy-mm-dd ',fromDate.Date)+FormatDatetime('hh:nn:ss',fromTime.Time);

    IDStr := '';
    if ComboBoxCarNoOverSpeed.Text<>'' then
    begin
      ind:=ComboBoxCarNoOverSpeed.Items.IndexOf(ComboBoxCarNoOverSpeed.Text);
      dev:=TDevice(ComboBoxCarNoOverSpeed.Items.Objects[ind]);
      if dev<>nil then
        IDstr:=dev.IdStr;
    end;
    FProgressdlg_ThePoint.Show;
    FProgressdlg_ThePoint.GaugeProcessInc(2);
    Application.ProcessMessages;

    FProgressdlg_ThePoint.GaugeProcessInc(5);
    Application.ProcessMessages;

    DataSource2.Enabled := false;
    FQueryBj_D := 1;
    group_Id_Input := group_id;
    if group_paranet<>'' then  group_Id_Input :=-1;
    if FQueryDevRunStateOnTheTime_D <> nil then
      DealFreeTheThread();
    FQueryDevRunStateOnTheTime_D := TQueryDevRunStateOnTheTimeThd.Create(fromDatetime,group_Id_Input,group_paranet,
      IDStr);
    FQueryDevRunStateOnTheTime_D.QueryType := 1;
    FQueryDevRunStateOnTheTime_D.OnQueryReturn := OnQueryReturnInfo_D;   
  finally
  end;
end;

procedure TQueryDevRunStateOnTheTimeFrm.DealFreeTheThread();
begin
  try
    FQueryDevRunStateOnTheTime_D.terminate;
    FreeAndNil(FQueryDevRunStateOnTheTime_D);
  except
  end;
end;

procedure TQueryDevRunStateOnTheTimeFrm.OnQueryReturnInfo_D(AInfo: string);
var
  i:Integer;
  n:Integer;
begin
  if FisClosed then exit;
  Timer1.Enabled := False;

//  label1.caption :=label1.caption+'  '+#13#10+ FormatDatetime('hh:nn:ss',now);
  try
    try
      DataSource2.Enabled := false;
      ClientDataSet2.ReadOnly := False;
      ClientDataSet2.XMLData := AInfo;
      if ClientDataSet2.RecordCount <= 0 then
      begin
        FProgressdlg_ThePoint.Hide;
        MessageBox(Handle,'�Բ���û�з������������ݣ�','��ʾ',MB_OK + MB_ICONINFORMATION);
        Exit;
      end;

      FProgressdlg_ThePoint.Gauge1.MaxValue := ClientDataSet2.RecordCount+1;
      FProgressdlg_ThePoint.Gauge1.Progress := 1;
      FProgressdlg_ThePoint.SetCaption('���ڷ������ݣ����Ժ�...');
      Application.ProcessMessages;
      ClientDataSet2.First;
      n := 0;
      for i:= 0 to ClientDataSet2.RecordCount -1 do
      begin
        if ClientDataSet2.FieldByName('Longitude').AsFloat<>0 then
        begin
          ClientDataSet2.Edit;
          ClientDataSet2.FieldByName('addr').AsString :=
            ReturnAddrByLongLati(ClientDataSet2.FieldByName('Longitude').AsFloat,
            ClientDataSet2.FieldByName('Latitude').AsFloat);
          n:= n+1;
        end;
        ClientDataSet2.Next;
        FProgressdlg_ThePoint.Gauge1.AddProgress(1);
        Application.ProcessMessages;
      end;
      ClientDataSet2.ReadOnly := True;
      DataSource2.Enabled := true;
//        label2.caption := FormatDatetime('hh:nn:ss',now)+ ' ���ߣ�'+inttostr(n);
    except
      FProgressdlg_ThePoint.Hide;
      MessageBox(Handle,'�Բ���û�з������������ݣ����ѯʧ�ܣ�','��ʾ',MB_OK + MB_ICONINFORMATION);
    end;
  finally
    SpeedButtonQryOverSpeed.Enabled := True ;
    FQueryBj_D := 0;
    FProgressdlg_ThePoint.Hide;
    FQueryDevRunStateOnTheTime_D.Terminate;
  end;
end;



//
//procedure TQueryDevRunStateOnTheTimeFrm.SendMsg_QueryOk_goNext;
//begin
////  RvHandle := FindWindow(MY_APP_NAME, nil); //����Ϣ --�г�������
////      if RvHandle > 0 then PostMessage(RvHandle, CM_DEVALARM, m.id, 0);
//PostMessage(self.handle,CM_TONEXT,0,0);
//SendMessage(
//
//
//end;
//
//procedure TQueryDevRunStateOnTheTimeFrm.RcvMsg_QueryOk_goNext;
//begin
//
//end;

function TQueryDevRunStateOnTheTimeFrm.ReturnAddrByLongLati(longi,lati:double):string;
//var
//  wp:TWorldPoint;
//  ep:TEarthPoint;
//  metaIndex:Integer;
//  ss,sn:string;
begin
  if (longi<= 0) or (longi > 180)  or (lati <= 0) or (lati > 180) then
  begin
    Result := '';
    exit;
  end;
  result := GetAddrSevice().GetAddrFromLongiLati(longi,lati);
//  sn := '';
//  try
//    ep.Longitude := longi;
//    ep.Latitude := lati;
//    wp := Project.LoLa2XY(ep);
//    metaIndex:= -1;
//
//
//    ss := ADeviceManage.ShengLayer.PointInMetaName(metaIndex,wp);
//    if ss <>'' then
//      sn := ss +',';
//    ss := ADeviceManage.ShiLayer.PointInMetaName(metaIndex,wp);
//    if ss <> '' then
//      sn := sn +ss +',';
//    ss :=  ADeviceManage.XianLayer.PointInMetaName(metaIndex,wp);
//    if ss <> '' then
//      sn := sn +ss+',';
//    if RightStr(sn,1) =',' then
//      sn := LeftStr(sn,length(sn)-1);
//  except
//  end;
//  result := sn;
end;

procedure TQueryDevRunStateOnTheTimeFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  PanelShowNowOut.Visible := False;
  SpeedButtonOut.Enabled :=  True;
  FQueryBj := 0;
  if FProgressdlg_ThePoint <>nil then FreeAndNil(FProgressdlg_ThePoint);
  if FProgressdlg<> nil then FreeAndNil(FProgressdlg);
  Timer1.Enabled := False;
  TimerOutFromNow.Enabled := False;
  ManualDock(nil);
end;

procedure TQueryDevRunStateOnTheTimeFrm.EditTimeLenKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then
    key := #0;
end;

procedure TQueryDevRunStateOnTheTimeFrm.Timer1Timer(Sender: TObject);
begin
  if FQueryBj_D =1 then
  begin
    if FProgressdlg_ThePoint<> nil then
    begin
      FProgressdlg_ThePoint.GaugeProcessInc(1);
      Application.ProcessMessages;
    end;
  end
  else if FQueryBj =2 then
  begin
    if FProgressdlg<> nil then
    begin
      FProgressdlg.GaugeProcessInc(1);
      Application.ProcessMessages;
    end;
  end;
end;

procedure TQueryDevRunStateOnTheTimeFrm.SpeedButtonOutClick(
  Sender: TObject);
var
  fromDatetime:TDateTime;
  ind:integer;
   devGrp: TDevGroup;
begin
//  Label11.Caption := FormatDatetime('hh:nn:ss',now);
//  if FQueryBj=2 then
//  begin
//    MessageBox(Handle,'ǰһ�β�ѯ��δ�����������Ժ�������ѯ','��ʾ',MB_OK+MB_ICONWARNING);
//    exit;
//  end;
  fromDatetime := DateTimePicker_outFromDate.Date;
  ReplaceTime(fromDatetime,DateTimePicker_outFromTime.Time);
  FOut_EndDatetime := DateTimePicker_outEndDate.Date;
  ReplaceTime(FOut_EndDatetime,DateTimePicker_outEndTime.Time);
  if (fromDatetime>FOut_EndDatetime) then
  begin
    MessageBox(Handle,'��ѯ�Ŀ�ʼʱ����ڽ���ʱ�䣬������������!','��ʾ',MB_OK+MB_ICONWARNING);
    exit;
  end;
  if StrToInt(Trim(EditOutTimeDelay.Text))=0 then
  begin
    MessageBox(Handle,'���������ʱ��������Ϊ0��������������!','��ʾ',MB_OK+MB_ICONWARNING);
    EditOutTimeDelay.SetFocus;
    exit;
  end;
  if not DirectoryExists(EditOutExcelPath.Text) then
  begin
    MessageBox(Handle,'���������·�������ڣ�������������!','��ʾ',MB_OK+MB_ICONWARNING);
    EditOutExcelPath.SetFocus;
    exit;
  end;
//  try
//    ExcelApp_out := CreateOleObject('Excel.Application');
//    MyWorkbook_out := CreateOleObject('Excel.Sheet');
//  except on Exception do
//    begin
//      raise Exception.Create('�޷�����EXCEL!��ȷ���Ѱ�װ!') ;
//      Exit;
//    end;
//  end;
  FOutExcelOkCnt := 0;
  FQueryTime := fromDatetime;
  SpeedButtonOut.Enabled := False;
  if FQueryDevRunStateOnTheTime_Times <> nil then
  begin
    FQueryDevRunStateOnTheTime_Times.Terminate;
    FreeAndNil(FQueryDevRunStateOnTheTime_Times);
  end;
  QueryOut();
end;

procedure TQueryDevRunStateOnTheTimeFrm.QueryOut(); // ��ѯ����������ȡ�����ĺ�����ÿ��ʱ������һ��
var
   devGrp: TDevGroup;
//   queryOutThread : TQueryDevRunStateOnTheTimeThd ;
   IDStr:string;
   group_Id_Input:integer;
begin
  if FProgressdlg=nil then
    FProgressdlg := TFrmRefreshProgress.create(TabSheetOutTheTimes);
  FProgressdlg.SetCaption('���ڼ��㲢������'+inttostr(FOutExcelOkCnt+1)+'���������ݣ����Ժ�...');
  FProgressdlg.Gauge1.MinValue := 0;
  FProgressdlg.Gauge1.MaxValue := 20;
  FProgressdlg.Gauge1.Progress := 0;
  FQueryFromTime := Now;
  Timer1.Enabled := False;
    if (group_id <>-1 ) then
    begin
      devGrp := ADevGroupManage.find(group_id);
      if devGrp = nil then Exit;
      FProgressdlg.Gauge1.MaxValue :=7+devGrp.DevListCount;  
      Timer1.Interval := 3000;
      Timer1.Enabled := True;
    end;

  IDStr := '';
//    if ComboBoxOut.Text<>'' then
//    begin
//      ind:=ComboBoxOut.Items.IndexOf(ComboBoxOut.Text);
//      dev:=TDevice(ComboBoxOut.Items.Objects[ind]);
//      if dev<>nil then
//        IDstr:=dev.IdStr;
//    end;

  try
    FProgressdlg.Show;
    FProgressdlg.GaugeProcessInc(5);
    Application.ProcessMessages;

    DataSourceOut.Enabled := false;
    FQueryBj := 2;
    group_Id_Input := group_id;
    if group_paranet<>'' then  group_Id_Input :=-1;
    
//    queryOutThread := TQueryDevRunStateOnTheTimeThd.Create(
//      FormatDateTime('yyyy-mm-dd hh:nn:ss',FQueryTime),group_Id_Input,group_paranet,'');
//    queryOutThread.OnQueryReturn := OnQueryReturnInfo;
    if FQueryDevRunStateOnTheTime_Times <> nil then
    begin     
      FQueryDevRunStateOnTheTime_Times.SetParams(
        FormatDateTime('yyyy-mm-dd hh:nn:ss',FQueryTime),group_Id_Input,group_paranet,'');
    end
    else
    begin
      FQueryDevRunStateOnTheTime_Times := TQueryDevRunStateOnTheTimeThd.Create(
        FormatDateTime('yyyy-mm-dd hh:nn:ss',FQueryTime),group_Id_Input,group_paranet,
        IDStr) ;
      FQueryDevRunStateOnTheTime_Times.QueryType := 1;
    end;
    FQueryDevRunStateOnTheTime_Times.OnQueryReturn := OnQueryReturnInfo_Times;
  finally
  end;
end;

procedure TQueryDevRunStateOnTheTimeFrm.OnQueryReturnInfo_Times(AInfo: string);
var
  i:Integer;
  n:Integer;
begin
  if FisClosed then exit;
  Timer1.Enabled := False;

//  label1.caption :=label1.caption+'  '+#13#10+ FormatDatetime('hh:nn:ss',now);
  try
    try
      DataSourceOut.Enabled := false;
      ClientDataSetOut.ReadOnly := False;
      ClientDataSetOut.XMLData := AInfo;
      if ClientDataSetOut.RecordCount > 0 then
      begin              
        ClientDataSetOut.First;
        n := 0;
        for i:= 0 to ClientDataSetOut.RecordCount -1 do
        begin
          if ClientDataSetOut.FieldByName('Longitude').AsFloat<>0 then
          begin
            ClientDataSetOut.Edit;
            ClientDataSetOut.FieldByName('addr').AsString :=
              ReturnAddrByLongLati(ClientDataSetOut.FieldByName('Longitude').AsFloat,
              ClientDataSetOut.FieldByName('Latitude').AsFloat);
            n:= n+1;
          end;
          ClientDataSetOut.Next;
        end;
        ClientDataSetOut.ReadOnly := True;
        DataSourceOut.Enabled := true;
      end;
      outExcel_AtRcvQueryResult(FQueryTime);
      if IncHour(FQueryTime,StrToInt(EditOutTimeDelay.Text))< FOut_EndDatetime then
      begin
        FQueryTime := IncHour(FQueryTime,StrToInt(EditOutTimeDelay.Text));
        QueryOut;
        //������Ϣ�������ϣ������߳��з��ص�
       // SendMsg_QueryOk_goNext;
      end
      else
      begin
        SpeedButtonOut.Enabled :=  True;
        FQueryBj := 0;
//          Label12.Caption := FormatDatetime('hh:nn:ss',now);
        FProgressdlg.Hide;
        MessageBox(Handle,pchar('��ѯ��ɣ�������'+IntToStr(FOutExcelOkCnt)+'������'),'��ʾ',MB_OK);
        FQueryDevRunStateOnTheTime_Times.Terminate;
      end;
    except
        FProgressdlg.Hide;
      MessageBox(Handle,'�Բ���û�з������������ݣ����ѯʧ�ܣ�','��ʾ',MB_OK + MB_ICONINFORMATION);
    end;
  finally
  end;
end;
          //����excel,���յ���ѯһ��ʱ���Ľ��ʱ(���ڲ�ѯ��������ҳ��)
procedure TQueryDevRunStateOnTheTimeFrm.outExcel_AtRcvQueryResult(FQueryTime:TDateTime);
var
  i, j,k: Integer;
  s: string;
  Str: string;
  fromDatetime, toDatetime: string;
  tmpStr: string;
  FileName:String;
  MyWorkbook_out: oleVariant;      
  ExcelApp_out : oleVariant;
begin
  if ClientDataSetOut.RecordCount =0 then exit;

  screen.Cursor := crHourGlass;
  try
    try
      ExcelApp_out := CreateOleObject('Excel.Application');
      MyWorkbook_out := CreateOleObject('Excel.Sheet');
    except on Exception do
      begin
        raise Exception.Create('�޷�����EXCEL!��ȷ���Ѱ�װ!') ;
        Exit;
      end;
    end;
    try
      ExcelApp_out.Visible := false;
    //����һ��������
      MyWorkbook_out := ExcelApp_out.workBooks.add;
    //��Ԫ��ϲ�
      MyWorkbook_out.worksheets[1].range['A1:I1'].Merge(true);
    //��Ԫ�����
      MyWorkbook_out.worksheets[1].range['A1:I2'].HorizontalAlignment := $FFFFEFF4;
    //����ͷ
      s := '';
      if group_id <>-1 then
        s:= ADevGroupManage.Find(group_id).Name;
//      if ComboBoxCarNoOverSpeed.Text <>'' then
//        s:= s+ '['+ComboBoxCarNoOverSpeed.Text+']'
//      else
//        s:= s+ '[ȫ������]';
      FileName := EditOutExcelPath.Text +FormatDatetime('yyyy_mm_dd hh_nn_ss',FQueryTime)+ s+ '��������״̬��ѯ.xls';
      MyWorkbook_out.worksheets[1].Cells[1, 1].value := FormatDatetime('yyyy-mm-dd hh:nn:ss',FQueryTime) +s +' ��������״̬��ѯ';
    //��ͷ
      i := 2;
      k:= 1;
      for j := 1 to DBGridEhOut.Columns.Count do
      begin
        if not DBGridEhOut.Columns.Items[j-1].Visible then continue;
        MyWorkbook_out.worksheets[1].Cells[i, k].value := DBGridEhOut.Columns.Items[j-1].Title.Caption;
        k:= k+1;
      end;
    //������ɫ
      MyWorkbook_out.worksheets[1].range['A1:K2'].Font.Color := clBlue;
    //����
      MyWorkbook_out.worksheets[1].range['A1:K1'].Font.Name := '����';
    //�ֺ�
      MyWorkbook_out.worksheets[1].range['A1:K1'].Font.Size := 18;
    //ȡ��
      i := 3;
      ClientDataSetOut.First;
      while not ClientDataSetOut.Eof do
      begin
        k:= 1;
        for j := 1 to  DBGridEhOut.Columns.Count do
        begin
          if not DBGridEhOut.Columns.Items[j-1].Visible then continue;
          tmpStr := DBGridEhOut.Columns.Items[j-1].FieldName;
          MyWorkbook_out.worksheets[1].Cells[i, k].value := ClientDataSetOut.FieldValues[tmpStr];
          k:= k+1;
        end;
        ClientDataSetOut.Next;
        Inc(i);
      end;

      //����ϼ��� sha 20081118
      MyWorkbook_out.worksheets[1].Cells[i, 1].value :='�ϼ�:';
      MyWorkbook_out.worksheets[1].Cells[i, 2].value := DBGridEhOut.Columns[1].Footer.SumValue;
      MyWorkbook_out.worksheets[1].Cells[i, 6].value := DBGridEhOut.Columns[6].Footer.SumValue;
          //���úϼƵ�Ԫ���ʽ
      MyWorkbook_out.worksheets[1].range['B'+IntToStr(3)+':B'+IntToStr(ClientDataSetOut.RecordCount+3)].NumberFormatLocal := '0';
      MyWorkbook_out.worksheets[1].range['F'+IntToStr(ClientDataSetOut.RecordCount+3)+':F'+IntToStr(ClientDataSetOut.RecordCount+3)].NumberFormatLocal := '0';
      //�������ڸ�ʽ
      MyWorkbook_out.worksheets[1].range['D'+IntToStr(3)+':D'+IntToStr(ClientDataSetOut.RecordCount+3)].NumberFormatLocal := 'yyyy-mm-dd hh:mm:ss';
    //�����п�
      MyWorkbook_out.worksheets[1].Columns[1].ColumnWidth := 12;
      MyWorkbook_out.worksheets[1].Columns[2].ColumnWidth := 18;
      MyWorkbook_out.worksheets[1].Columns[3].ColumnWidth := 18;
      MyWorkbook_out.worksheets[1].Columns[4].ColumnWidth := 20;
      for j := 5 to DBGridEhOut.Columns.Count do
        MyWorkbook_out.worksheets[1].Columns[j].ColumnWidth := 12;  
    //�����и�
      MyWorkbook_out.worksheets[1].Rows[1].RowHeight := 50;
    //����ͷ����
      MyWorkbook_out.worksheets[1].Rows[1].VerticalAlignment := $FFFFEFF4;
     
    //����ҳ��
      MyWorkbook_out.worksheets[1].PageSetup.CenterHorizontally := true;
      MyWorkbook_out.worksheets[1].PageSetup.PrintTitleRows := 'A1';
      MyWorkbook_out.worksheets[1].PageSetup.PaperSize := $9;
      ExcelApp_out.Workbooks[1].SaveAs(FileName);
//      ExcelApp_out.Visible := true;
      Inc(FOutExcelOkCnt);
      ExcelApp_out.Quit; //���
    except
    end;
  finally
    screen.Cursor := crDefault;
    MyWorkbook_out:= Unassigned;
    ExcelApp_out := Unassigned;
  end;
end;


procedure TQueryDevRunStateOnTheTimeFrm.SpeedButton_OutFromNow_SelectOutPathClick(Sender: TObject);
var
  dlg:TSelectDirFrm;
begin
  dlg := TSelectDirFrm.Create(self);
  try
    if dlg.ShowModal= mrok then
      Edit_OutFromNow_OutPath.Text := dlg.RzEdit1.Text;
  finally
    dlg.Free;
  end;
end;

procedure TQueryDevRunStateOnTheTimeFrm.BitBtnOutFromNowClick(
  Sender: TObject);
var
  dt :TDateTime;
begin
//  TimerOutFromNow.Enabled := False;

  if Trim(Edit_OutFromNow_Interval.Text)='' then
  begin
    MessageBox(handle,pchar('����ʱ��������Ϊ�գ�������������!'),'',MB_OK+MB_ICONWARNING);
    Edit_OutFromNow_Interval.SetFocus;
    exit;
  end;
  if StrToInt(Edit_OutFromNow_Interval.Text)=0 then
  begin
    MessageBox(handle,pchar('����ʱ��������Ϊ0��������������!'),'',MB_OK+MB_ICONWARNING);
    Edit_OutFromNow_Interval.SetFocus;
    exit;
  end;
  if not DirectoryExists(Edit_OutFromNow_OutPath.Text) then
  begin
    MessageBox(handle,pchar('����ѡ�񵼳������ļ���·��!'),'',MB_OK+MB_ICONWARNING);
    SpeedButton_OutFromNow_SelectOutPath.Click;
    exit;
  end;
  dt := DateTimePicker_OutFromNow_Date.Date;
  ReplaceTime(dt,DateTimePicker_OutFromNow_Time.Time);
  if dt<now then
  begin
    if MessageBox(handle,pchar('�����õĿ�ʼ����ʱ�������С���Ƿ������'+#13#10#13#10+
      '�㡰�ǡ�����Ϊ�������ڿ�ʼ��������!'),'��ʾ',MB_YESNO+MB_ICONQUESTION)= idyes then
    begin
      DateTimePicker_OutFromNow_Date.Date := Date;
      DateTimePicker_OutFromNow_Time.Time := Time;
      dt := now;
    end
    else
      exit;
  end;
//  FOutFromNow_OutTime := dt;
  if FOutFromNowThread <> nil then
    AddMemo('׼��Ϊ�����µ�������...')
  else
    AddMemo('׼��Ϊ����������...');
  AddMemo('����·����'+Edit_OutFromNow_OutPath.Text);
  if PanelSelectGroupName.Caption='' then
    AddMemo('�����ĳ������飺���г���')
  else
    AddMemo('�����ĳ������飺'+PanelSelectGroupName.Caption);

  if FOutFromNowThread <> nil then
  begin
    try
      FOutFromNowThread.running := false;
      FOutFromNowThread.Terminate;
      FreeAndNil(FOutFromNowThread);
    except
    end;
  end;
  FOutFromNowThread := TOutFromNowThread.Create;
  PanelShowNowOut.Left :=(Width - PanelShowNowOut.Width ) div 2;
  FOutFromNowThread.frm := self;
  FOutFromNowThread.FOutFromNow_OutTime := dt;
  FOutFromNowThread.group_id := group_id;
  FOutFromNowThread.Resume;       
//  TimerOutFromNow.Enabled := True;
end;



procedure TQueryDevRunStateOnTheTimeFrm.AddMemo(Str:string);
begin
  MemoOutFromNow.Lines.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss',now)+' '+str);
end;

procedure TQueryDevRunStateOnTheTimeFrm.Edit_OutFromNow_IntervalKeyPress(
  Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then
  begin
    key := #0;
  end;
end;

procedure TQueryDevRunStateOnTheTimeFrm.TimerOutFromNowTimer(
  Sender: TObject);
begin
  TimerOutFromNow.Enabled := False;
//  if (FOutFromNow_OutTime<now) and (MinutesBetween(now,FOutFromNow_OutTime)<1) then
//  begin
//    try
//      AddMemo('���ڵ�������...');
//      OutExcel_outFromNow();
//
//      MemoOutFromNow.Lines.Add('');
//    except on E:exception do
//      AddMemo('����ʧ��:'+e.Message);
//    end;
//    try
//      FOutFromNow_OutTime:= IncHour(FOutFromNow_OutTime,Strtoint(Edit_OutFromNow_Interval.Text));
//    except
//      FOutFromNow_OutTime:= IncHour(FOutFromNow_OutTime,1);
//    end;
////    try
////      FOutFromNow_OutTime:= IncMinute(FOutFromNow_OutTime,Strtoint(Edit_OutFromNow_Interval.Text));
////    except
////      FOutFromNow_OutTime:= IncMinute(FOutFromNow_OutTime,1);
////    end;
//  end;
//  TimerOutFromNow.Enabled := True;
end;



procedure TQueryDevRunStateOnTheTimeFrm.SpeedButton1Click(Sender: TObject);
var
  dlg:TSelectDirFrm;
begin
  dlg := TSelectDirFrm.Create(self);
  try
    if dlg.ShowModal= mrok then
      EditOutExcelPath.Text := dlg.RzEdit1.Text;
  finally
    dlg.Free;
  end;

end;

procedure TQueryDevRunStateOnTheTimeFrm.ComboBoxCarNoOverSpeedChange(
  Sender: TObject);
var
  i: integer;
  carNo, setNo: string;
  Dev: TDevice;
begin
  if FSearch then
  begin
    setNo := ComboBoxCarNoOverSpeed.Text;
    if setNO = '' then
    begin
      ComboBoxCarNoOverSpeed.DroppedDown := false;
      exit;
    end;

    ComboBoxCarNoOverSpeed.Items.BeginUpdate;
    ComboBoxCarNoOverSpeed.Items.Clear;
    for i := 0 to ADeviceManage.Count - 1 do
    begin
      Dev := ADeviceManage.Items[i];
      carNo := Dev.Car.No; //ADeviceManage.Items[i].Car.No;
      if pos(setNo, carNo) > 0 then
      begin
        if ComboBoxCarNoOverSpeed.Items.Count <= 50 then
          ComboBoxCarNoOverSpeed.Items.AddObject(Dev.Car.No,dev)//ComboBox2.Items.Add(carNo)
        else
          break;
      end;
    end;
    ComboBoxCarNoOverSpeed.Items.EndUpdate;
    ComboBoxCarNoOverSpeed.SelStart := Length(ComboBoxCarNoOverSpeed.Text);
    ComboBoxCarNoOverSpeed.DroppedDown := false;
  end;
end;

procedure TQueryDevRunStateOnTheTimeFrm.ComboBoxCarNoOverSpeedKeyPress(
  Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    exit;
  end;
  FSearch := true;
end;

procedure TQueryDevRunStateOnTheTimeFrm.ComboBoxCarNoOverSpeedKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if FSearch and (Key <> 8) then
  begin
    if ComboBoxCarNoOverSpeed.Items.Count > 0 then
      ComboBoxCarNoOverSpeed.DroppedDown := true;
    FSearch := false;
  end;
end;

procedure TQueryDevRunStateOnTheTimeFrm.ComboBoxCarNoOverSpeedSelect(
  Sender: TObject);
begin
  FSearch := false;
end;

procedure TQueryDevRunStateOnTheTimeFrm.ComboBoxOutChange(Sender: TObject);
var
  i: integer;
  carNo, setNo: string;
  Dev: TDevice;
begin
  if FSearch then
  begin
    setNo := ComboBoxOut.Text;
    if setNO = '' then
    begin
      ComboBoxOut.DroppedDown := false;
      exit;
    end;

    ComboBoxOut.Items.BeginUpdate;
    ComboBoxOut.Items.Clear;
    for i := 0 to ADeviceManage.Count - 1 do
    begin
      Dev := ADeviceManage.Items[i];
      carNo := Dev.Car.No; //ADeviceManage.Items[i].Car.No;
      if pos(setNo, carNo) > 0 then
      begin
        if ComboBoxOut.Items.Count <= 50 then
          ComboBoxOut.Items.AddObject(Dev.Car.No,dev)//ComboBox2.Items.Add(carNo)
        else
          break;
      end;
    end;
    ComboBoxOut.Items.EndUpdate;
    ComboBoxOut.SelStart := Length(ComboBoxOut.Text);
    ComboBoxOut.DroppedDown := false;
  end;
end;

procedure TQueryDevRunStateOnTheTimeFrm.ComboBoxOutKeyPress(
  Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    exit;
  end;
  FSearch := true;
end;

procedure TQueryDevRunStateOnTheTimeFrm.ComboBoxOutKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if FSearch and (Key <> 8) then
  begin
    if ComboBoxOut.Items.Count > 0 then
      ComboBoxOut.DroppedDown := true;
    FSearch := false;
  end;
end;

procedure TQueryDevRunStateOnTheTimeFrm.ComboBoxOutSelect(Sender: TObject);
begin
  FSearch := false;
end;

procedure TQueryDevRunStateOnTheTimeFrm.FormDestroy(Sender: TObject);
begin
  FisClosed := True;
  if FOutFromNowThread<> nil then
  begin
    FOutFromNowThread.running := False;
    FOutFromNowThread.Terminate;
    FreeAndNil(FOutFromNowThread);
  end;

  if FQueryDevRunStateOnTheTime_Times <> nil then
  begin
    FQueryDevRunStateOnTheTime_Times.Terminate;
    FreeAndNil(FQueryDevRunStateOnTheTime_Times);
  end;
  if FQueryDevRunStateOnTheTime_D <> nil then
  begin
    FQueryDevRunStateOnTheTime_D.Terminate;
    FreeAndNil(FQueryDevRunStateOnTheTime_D);
  end;
end;

{ TOutFromNowThread }

procedure TOutFromNowThread.AddMemo(s: string);
begin
  Frm.MemoOutFromNow.Lines.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss',now)+' '+s);
end;

constructor TOutFromNowThread.Create;
begin
  inherited Create(true);
  running := true;
end;

destructor TOutFromNowThread.Destroy;
begin
  running := false;
  inherited;
end;

procedure TOutFromNowThread.Execute;
begin
  while (running) do
  begin
    if (FOutFromNow_OutTime<now) and (MinutesBetween(now,FOutFromNow_OutTime)<1) then
    begin
      try
        frm.TreeView1.enabled := false;
        frm.PanelShowNowOut.Visible := True;
        AddMemo('���ڵ�������(��ʱ���ڲ���ѡ�����)...');
        OutExcel_outFromNow();
      except on E:exception do
        AddMemo('����ʧ��:'+e.Message);
      end;
      frm.TreeView1.enabled := True;
      frm.PanelShowNowOut.Visible := False;
      try
        FOutFromNow_OutTime:= IncHour(FOutFromNow_OutTime,Strtoint(frm.Edit_OutFromNow_Interval.Text));
      except
        FOutFromNow_OutTime:= IncHour(FOutFromNow_OutTime,1);
      end;
      AddMemo('��һ�ε���ʱ�䣺'+formatdatetime('yyyy-mm-dd hh:nn:ss',FOutFromNow_OutTime));
      frm.MemoOutFromNow.Lines.Add('');
    end
    else
    begin
      Sleep(1000);
      if not frm.TreeView1.enabled  then frm.TreeView1.enabled := True;
      if frm.PanelShowNowOut.Visible then frm.PanelShowNowOut.Visible := False;
    end;
  end;
end;

procedure TOutFromNowThread.OutExcel_outFromNow;   //����excel�����ڵ��������ڿ�ʼ��һ������
var
  cnt,onlineCnt:integer;
  procedure OutToExcel(dev:TDevice;i:Integer;MyWorkbook_out:OleVariant);
  begin
    MyWorkbook_out.worksheets[1].Cells[i, 1].value := dev.Car.No; //'���ƺ�';
    MyWorkbook_out.worksheets[1].Cells[i, 2].value := dev.IdStr; //'����ID��';
    MyWorkbook_out.worksheets[1].Cells[i, 3].value := dev.TerminalTypeName; //�����ġ�shajp.
    MyWorkbook_out.worksheets[1].Cells[i, 4].value := ADevGroupManage.find(dev.GroupID).Name; //'����';
    MyWorkbook_out.worksheets[1].Cells[i, 6].value := dev.Speed/10; //'�ٶ�';
    if dev.isOnline then
    begin
      MyWorkbook_out.worksheets[1].Cells[i, 7].value :='����';
      MyWorkbook_out.worksheets[1].Cells[i, 5].value := dev.GpsTime; //'GPSʱ��';
      onlineCnt := onlineCnt +1;
    end
    else
    begin
      MyWorkbook_out.worksheets[1].Cells[i, 7].value :='������';
      MyWorkbook_out.worksheets[1].Cells[i, 5].value := ''; //'GPSʱ��';
    end;
    if dev.Switch[0] then
      MyWorkbook_out.worksheets[1].Cells[i, 8].value :='��λ'
    else
      MyWorkbook_out.worksheets[1].Cells[i, 8].value :='�Ƕ�λ';
    if not dev.isOnline then  MyWorkbook_out.worksheets[1].Cells[i, 8].value :='�Ƕ�λ';
    if dev.Switch[4] then MyWorkbook_out.worksheets[1].Cells[i, 8].value := '����';
    MyWorkbook_out.worksheets[1].Cells[i, 9].value := dev.Longitude; //'����';
    MyWorkbook_out.worksheets[1].Cells[i, 10].value := dev.Latitude; //'γ��';
    MyWorkbook_out.worksheets[1].Cells[i, 11].value := frm.ReturnAddrByLongLati(dev.Longitude,dev.Latitude);//'��ַ';
    MyWorkbook_out.worksheets[1].Rows[i].RowHeight :=  18;
  end;
var
  i, j,k,m: Integer;
  s: string;
  Str: string;
  fromDatetime, toDatetime: string;
  tmpStr: string;
  fileName:String;
  devGrp :TDevGroup;
  MyWorkbook_out: oleVariant;      
  ExcelApp_out : oleVariant;
  dev :TDevice;
begin
  coinitialize(nil);
//  screen.Cursor := crHourGlass;
  try
    try
      ExcelApp_out := CreateOleObject('Excel.Application');
      MyWorkbook_out := CreateOleObject('Excel.Sheet');
    except on Exception do
      begin
        raise Exception.Create('�޷�����EXCEL!��ȷ���Ѱ�װ!') ;
        Exit;
      end;
    end;
    try
      ExcelApp_out.Visible := false;
    //����һ��������
      MyWorkbook_out := ExcelApp_out.workBooks.add;
    //��Ԫ��ϲ�
      MyWorkbook_out.worksheets[1].range['A1:I1'].Merge(true);
    //��Ԫ�����
      MyWorkbook_out.worksheets[1].range['A1:I2'].HorizontalAlignment := $FFFFEFF4;
    //����ͷ
      s := '';
      if group_id <>-1 then
        s:= ADevGroupManage.Find(group_id).Name;
      fileName := frm.Edit_OutFromNow_OutPath.Text +FormatDatetime('yyyy_mm_dd hh_nn_ss',FOutFromNow_OutTime)+ s+ '��������״̬��ѯ-ʵʱ.xls';
      MyWorkbook_out.worksheets[1].Cells[1, 1].value := FormatDatetime('yyyy-mm-dd hh:nn:ss',FOutFromNow_OutTime) +s +' ��������״̬��ѯ-ʵʱ';
    //��ͷ
      i := 2;
      k:= 1;
      m:=1 ;
      MyWorkbook_out.worksheets[1].Cells[2, m].value :='���ƺ�';   inc(m);
      MyWorkbook_out.worksheets[1].Cells[2, m].value :='����ID��'; inc(m);
      MyWorkbook_out.worksheets[1].Cells[2, m].value :='�ն�����'; inc(m);
      MyWorkbook_out.worksheets[1].Cells[2, m].value :='����';     inc(m);
      MyWorkbook_out.worksheets[1].Cells[2, m].value :='GPSʱ��';  inc(m);
      MyWorkbook_out.worksheets[1].Cells[2, m].value :='�ٶ�';     inc(m);
      MyWorkbook_out.worksheets[1].Cells[2, m].value :='����';     inc(m);
      MyWorkbook_out.worksheets[1].Cells[2, m].value :='��λ';     inc(m);
      MyWorkbook_out.worksheets[1].Cells[2, m].value :='����';     inc(m);
      MyWorkbook_out.worksheets[1].Cells[2, m].value :='γ��';     inc(m);
      MyWorkbook_out.worksheets[1].Cells[2, m].value :='��ַ';    inc(m);

    //������ɫ
      MyWorkbook_out.worksheets[1].range['A1:K2'].Font.Color := clBlue;
    //����
      MyWorkbook_out.worksheets[1].range['A1:K1'].Font.Name := '����';
    //�ֺ�
      MyWorkbook_out.worksheets[1].range['A1:K1'].Font.Size := 18;
    //ȡ����
      if group_id = -1 then
      begin
        cnt:= ADeviceManage.Count;
        for k:= 0 to ADeviceManage.Count-1 do
        begin
          if not running then exit;  //
          dev:= ADeviceManage.Items[k];
          OutToExcel(dev,k+3,MyWorkbook_out);
          Application.ProcessMessages;
        end;
      end
      else
      begin
        devGrp:= ADevGroupManage.find(group_id);
        cnt:=  devGrp.DevListCount;
        for k:= 0 to devGrp.DevListCount-1 do
        begin
          if not running then exit;//
          dev := ADeviceManage.find(devGrp.DevList[k]);
          OutToExcel(dev,k+3,MyWorkbook_out);
          Application.ProcessMessages;
        end;
      end;
      i:= cnt+3;
      //����ϼ��� sha 20081118
      MyWorkbook_out.worksheets[1].Cells[i, 1].value := '�ϼƣ�';
      MyWorkbook_out.worksheets[1].Cells[i, 2].value := '������:'+IntToStr(cnt);
      MyWorkbook_out.worksheets[1].Cells[i, 3].value := '���ߣ�'+IntToStr(onlineCnt);
          //���úϼƵ�Ԫ���ʽ
      MyWorkbook_out.worksheets[1].range['B'+IntToStr(3)+':B'+IntToStr(cnt+3)].NumberFormatLocal := '0';
      MyWorkbook_out.worksheets[1].range['F'+IntToStr(cnt+3)+':F'+IntToStr(cnt+3)].NumberFormatLocal := '0';
      //�������ڸ�ʽ
      MyWorkbook_out.worksheets[1].range['D'+IntToStr(3)+':D'+IntToStr(cnt+3)].NumberFormatLocal := 'yyyy-mm-dd hh:mm:ss';
    //�����п�
      for i := 1 to 10 do
       MyWorkbook_out.worksheets[1].Columns[i].EntireColumn.AutoFit;
    //�����и�
      MyWorkbook_out.worksheets[1].Rows[1].RowHeight := 50;
    //����ͷ����
      MyWorkbook_out.worksheets[1].Rows[1].VerticalAlignment := $FFFFEFF4;
     
    //����ҳ��
      MyWorkbook_out.worksheets[1].PageSetup.CenterHorizontally := true;
      MyWorkbook_out.worksheets[1].PageSetup.PrintTitleRows := 'A1';
      MyWorkbook_out.worksheets[1].PageSetup.PaperSize := $9;
      ExcelApp_out.Workbooks[1].SaveAs(FileName);
//      ExcelApp_out.Visible := true;
      ExcelApp_out.Quit; //���
      AddMemo('����һ������ɹ�:'+fileName);
    except on e:Exception do
      AddMemo('����һ������ʧ��:'+e.Message+'���ļ�����'+fileName);
    end;
  finally
//    screen.Cursor := crDefault;
    MyWorkbook_out:= Unassigned;
    ExcelApp_out := Unassigned;
    CoUninitialize;
  end;
end;

  
procedure TQueryDevRunStateOnTheTimeFrm.FormShow(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
end;

function TQueryDevRunStateOnTheTimeFrm.IsProgressDlgVisible: Boolean;
begin
  Result := ((FProgressdlg <> nil) and FProgressdlg.Visible) or ((FProgressdlg_ThePoint <> nil) and FProgressdlg_ThePoint.Visible);
end;

procedure TQueryDevRunStateOnTheTimeFrm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if IsProgressDlgVisible then
  begin
    MessageBox(Handle, '���ڲ�ѯ�����Ժ�ر�', '��ʾ', MB_OK + MB_ICONWARNING);
    CanClose := False;
  end;  
end;

end.

