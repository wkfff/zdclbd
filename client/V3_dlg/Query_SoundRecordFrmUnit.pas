unit Query_SoundRecordFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxSplitter, Grids, DBGridEh, StdCtrls, Buttons,
  ComCtrls, ExtCtrls, uFrmRefreshProgress, uGloabVar,CarUnit, DBClient, DB,
  PrnDbgeh, PrViewEh, Printers, Menus, Service, pcm, ConstDefineUnit;

type
  TQuery_SoundRecordFrm = class(TForm)
    Panel7: TPanel;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    TreeView1: TTreeView;
    PanelSelectGroupName: TPanel;
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
    ComboBox2: TComboBox;
    BitBtnToExcel: TBitBtn;
    fromTime: TDateTimePicker;
    toTime: TDateTimePicker;
    BitBtn2: TBitBtn;
    Panel4: TPanel;
    DBGridEh1: TDBGridEh;
    cxSplitter2: TcxSplitter;
    Label1: TLabel;
    ComboBox1: TComboBox;
    PrintDBGridEh1: TPrintDBGridEh;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    cxSplitter1: TcxSplitter;
    procedure TreeView1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButtonOneTimeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBGridEh1Columns10UpdateData(Sender: TObject;
      var Text: String; var Value: Variant; var UseText, Handled: Boolean);
    procedure N1Click(Sender: TObject);
  private
    procedure AddDev(id: integer; ANode: TTreeNode);
  private
     FDlgProgress:TFrmRefreshProgress;
  end;

var
  Query_SoundRecordFrm: TQuery_SoundRecordFrm;

  aqStore: TClientDataSet;
  FromDate, ToDate: string;
  CarNo: string;
  group_id: integer = -1;
  group_paranet: string = '';
  fact_id: Integer = -1;
  dev_id: string = '';
  ReasonId: Integer = -1;
implementation
uses umainf,ComObj, DateUtils,waitFrmUnit, ShowMessageInfo;
{$R *.dfm}
procedure TQuery_SoundRecordFrm.AddDev(id: integer; ANode: TTreeNode);
var
  i: integer;
  dev: TDevice;
begin
  try
   // ComboBox2.Items.Clear;
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

procedure TQuery_SoundRecordFrm.TreeView1Click(Sender: TObject);
var
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
    if not devGrp.leaf_nod then //==  说明父节点
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
  if group_paranet<>'' then group_id := -1;
end;

procedure TQuery_SoundRecordFrm.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TQuery_SoundRecordFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
ManualDock(nil);
end;

procedure TQuery_SoundRecordFrm.SpeedButtonOneTimeClick(Sender: TObject);
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
  screen.Cursor := FCursor;
  try
    FCursor := -11;
    //清数据
    DataSource1.DataSet := nil;

    startDateTime := DateTimePicker1.DateTime;
    endDateTime := DateTimePicker2.DateTime;
    ReplaceTime(startDateTime, fromTime.Time);
    ReplaceTime(endDateTime, toTime.Time);
    FromDate :=  FormatDatetime('yyyy-mm-dd hh:nn:ss',startDateTime);
    ToDate := FormatDatetime('yyyy-mm-dd hh:nn:ss',endDateTime);
    if FromDate > ToDate then
    begin
      MessageBox(Handle,'开始日期应小于结束日期，请检查！', '提示信息', mb_ok + mb_iconinformation);
      exit;
    end;

    if FDlgProgress = nil then
      FDlgProgress := TFrmRefreshProgress.Create(self);
    FDlgProgress.SetCaption('正在载入数据，请您稍候...');
    FDlgProgress.Gauge1.MinValue := 0;
    FDlgProgress.Gauge1.MaxValue := 100;

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
        dev_id := '';
        fact_id := -1;
      end;
    except
      aCarNo := '';
    end;

    CarNo := aCarNO;
    ReasonId := ComboBox1.ItemIndex-1;
    FDlgProgress.Gauge1.Progress := 5;
    FDlgProgress.Show;
    Application.ProcessMessages;

    FDlgProgress.Gauge1.MaxValue := 10 +10;
    FDlgProgress.Gauge1.Progress := 10;
    Application.ProcessMessages;

    try
      xml := BS.Query_SoundRecord(ReasonId,FromDate, ToDate,
                                 fact_Id, dev_Id, group_id,
                                 group_paranet);
    except
      on E: Exception do
      begin
        if FDlgProgress.Showing then FDlgProgress.Hide;
        messageErrorBox('查询录音信息结果处理不正确！', e.Message);
        exit;
      end;
    end;

    FDlgProgress.GaugeProcessInc(10);
    aqStore.XMLData := xml;
    aqStore.Open;
    if aqStore.RecordCount  <= 0 then
    begin
      FDlgProgress.Hide;
      MessageBox(Handle,'对不起，没有符合条件的数据！','提示',MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
    DataSource1.DataSet := aqStore;
    DBGridEh1.DataSource := DataSource1;
  finally
    FCursor := 0;
    if FDlgProgress.Showing then FDlgProgress.Hide;
  end;
end;

procedure TQuery_SoundRecordFrm.FormCreate(Sender: TObject);
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
  vn_node: TTreeNode;
  cnt: integer;
begin
  DateTimePicker2.date := now;
  DateTimePicker1.date := IncWeek(now, -1);  //向前1周
  aqStore := TClientDataSet.Create(nil);
  //DataSource1.DataSet := aqStore;

  TreeView1.AutoExpand := true;
  TreeView1.Items.Clear;
  if ADevGroupManage.Count = 0 then exit;
  vn_node := TreeView1.Items.add(TreeView1.topitem, '所有车辆');
  vn_node.Data := Pointer(-1); //所有车辆
  vn_node.Expanded := true;
  cnt := ADevGroupManage.Count;
  group_list(0,vn_node,cnt);
end;

procedure TQuery_SoundRecordFrm.SpeedButton3Click(Sender: TObject);
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
        Title := '所有车辆'
      end;
    end;
    //Str := '单客次营运信息';
    Str := FormatDateTime('yyyy-mm-dd', DateTimePicker1.Date) + '至' +
      FormatDateTime('yyyy-mm-dd', DateTimePicker2.Date) + '['+ Title +']  录音信息';
    PrintDBGridEh1.PageHeader.CenterText.Clear;
    PrintDBGridEh1.PageHeader.CenterText.add(Str);
    PrintDBGridEh1.PageFooter.LeftText.Clear;
    PrintDBGridEh1.PageFooter.LeftText.Add('打印时间：'+FormatDateTime('yyyy-mm-dd hh:nn',now));
    PrintDBGridEh1.PageFooter.RightText.Clear;
    PrintDBGridEh1.PageFooter.RightText.Add(ReportFooter);
    PrinterPreview.Previewer.ViewMode := vmPageWidth;
    PrinterPreview.Orientation := poLandscape;
    PrintDBGridEh1.PageFooter.CenterText.Clear;
    PrintDBGridEh1.PageFooter.CenterText.Add('第&[Page]页，共&[Pages]页');
    PrintDBGridEh1.Preview;
  except
  end;
end;

procedure TQuery_SoundRecordFrm.DBGridEh1Columns10UpdateData(
  Sender: TObject; var Text: String; var Value: Variant; var UseText,
  Handled: Boolean);
begin
  case Value of
    0: Value := '正常录音';
    1: Value := '投诉录音';
  end;
end;

procedure TQuery_SoundRecordFrm.N1Click(Sender: TObject);
var
  Record_Id : Integer;
  Dev_Id:String;
  BeginDateTime, EndDateTime: string;
  Dev: TDevice;
  info: SoundRecordData;

  adpFileName, fileName, wavFileName: string;
  ms : TMemoryStream;
  fs: TFileStream;
  b: TDateTime;
begin
  try
    Record_Id := aqStore.FieldValues['Record_Id'];
    Dev_Id := aqStore.FieldValues['Dev_Id'];
    Dev := ADeviceManage.find(Dev_Id);
    b:=Trunc(DateTimePicker1.Date)+fromTime.Time-Trunc(fromTime.Time);
    if Dev <> nil then
    begin

      fileName := ExePath + 'Audio\';
      if not DirectoryExists(fileName) then
        if not CreateDir(fileName) then
      begin
        MessageBox(self.Handle, PAnsiChar('不能创建' + fileName + '目录'), '提示', mb_iconinformation + mb_ok);
        Exit;
      end;

      filename:=fileName + dev.Car.No;
      if not DirectoryExists(fileName) then
          if not CreateDir(fileName) then
      begin
        MessageBox(self.Handle, PAnsiChar('不能创建' + fileName + '目录'), '提示', mb_iconinformation + mb_ok);
        Exit;
      end;

      fileName:=fileName + '\' + Dev.Car.No + '_' + FormatDatetime('yymmddhhnnss',b);

      adpFileName := fileName + '_' + (dev.Id) + '_' + IntToStr(Record_Id) + '.adp';
      wavFileName := fileName + '_' + (dev.Id) + '_' + IntToStr(Record_Id) + '.wav';

      if FileExists(wavFileName) then
      begin
        umainf.Mainf.PlayQuerySound(wavFileName);
      end
      else
      begin

        info := bs.Query_SoundRecord_SoundData(Record_Id);
        if info = nil then
        begin
          fileName := '无';
        end
        else
        begin
          if not FileExists(adpFileName) then
          begin
            try
              fs := TFileStream.Create(adpFileName, fmCreate or fmShareDenyWrite);
              fs.Position := 0; //fs.Size;
              fs.Write(info.SoundData[0], Length(info.SoundData));
            finally
              fs.Free;
            end;
          end;

          if ConvertAdp2Wav(adpFileName, wavFileName, info.CodeWay) then
          begin
            umainf.Mainf.PlayQuerySound(wavFileName);
          end;

        end;
      end;
    end;
  except
  end;
end;

end.
