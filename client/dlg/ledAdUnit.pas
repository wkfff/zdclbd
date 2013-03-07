unit ledAdUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxCalendar, StdCtrls, Buttons, cxInplaceContainer, cxControls, DBClient,
  ComCtrls, ExtCtrls, cxSplitter, cxCheckBox;

type
  TledAdUnitFrm = class(TForm)
    GroupBox1: TGroupBox;
    AdInfoList: TcxTreeList;
    cxID: TcxTreeListColumn;
    LedMemo: TcxTreeListColumn;
    DataType: TcxTreeListColumn;
    DataSpeed: TcxTreeListColumn;
    InType: TcxTreeListColumn;
    ExitType: TcxTreeListColumn;
    x: TcxTreeListColumn;
    y: TcxTreeListColumn;
    StopTime: TcxTreeListColumn;
    Font: TcxTreeListColumn;
    IsDisTime: TcxTreeListColumn;
    ExTend: TcxTreeListColumn;
    RunTime: TcxTreeListColumn;
    EndTime: TcxTreeListColumn;
    CusTerm: TcxTreeListColumn;
    custermper: TcxTreeListColumn;
    custermtel: TcxTreeListColumn;
    memo: TcxTreeListColumn;
    ComboBox1: TComboBox;
    cxSplitter2: TcxSplitter;
    Panel1: TPanel;
    ListView2: TListView;
    Button1: TButton;
    Button2: TButton;
    Timer1: TTimer;
    SendChose: TcxTreeListColumn;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    CheckBox1: TCheckBox;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    Timer2: TTimer;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AdInfoListEditing(Sender: TObject;
      AColumn: TcxTreeListColumn; var Allow: Boolean);
    procedure AdInfoListClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    function getIndexNextid: integer;
  public
    { Public declarations }

  end;

var
  ledAdUnitFrm: TledAdUnitFrm;
  readAD: integer;
  proLength: integer;
  stateCmd: Integer;
  HaveErrorIsSet: boolean;
  SendP: integer;
  adlenID: integer;
implementation
uses uGloabVar, uFrmSelectDevs, CarUnit, ConstDefineUnit;
{$R *.dfm}

procedure TledAdUnitFrm.FormShow(Sender: TObject);
var
  i, speedjb: integer;
var
  DataSet: TClientDataSet;
  node: TcxTreeListNode;
begin
  if ADtimeControl then
  begin
    timer1.Enabled := true;
  end;
  label1.Caption := '';
  ListView2.Items.Clear;
  if GCurSelectDev <> nil then
  begin
    with ListView2.Items.Add do
    begin
      caption := GCurSelectDev.Car.No;
      Data := GCurSelectDev;
    end;
  end;
end;

procedure TledAdUnitFrm.SpeedButton2Click(Sender: TObject);
begin
  ADtimeControl := false;
  close;
end;

procedure TledAdUnitFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Timer1.Enabled :=false;
  Timer2.Enabled :=false;
  if ledAdUnitFrm <> nil then
  begin
    ledAdUnitFrm := nil;
    action := cafree;
  end;
end;

procedure TledAdUnitFrm.SpeedButton1Click(Sender: TObject);
var
  i: integer;
  find_ListItem: TListItem;
begin
  proLength := 0;
  SendP := 0;
  i := 0;
  if checkbox1.Checked then
  begin
    if ListView2.Items.Count <= 0 then exit;
    for i := 0 to listview2.Items.Count - 1 do
    begin
      DataServer.DeleteAllAdInfo(TDevice(ListView2.Items.Item[i].Data));
    end;
  end else
  begin
     //====���͵������
    ProgressBar1.Position := 0;
    find_ListItem := listview2.Selected;
    if find_ListItem = nil then exit;
    for i := 0 to AdInfoList.Count - 1 do
    begin
      if AdInfoList.Nodes.Items[i].Values[0] then
      begin
        inc(proLength);
      end;
    end;

    ProgressBar1.Max := proLength * 10 + 10;
    for i := 0 to AdInfoList.Count - 1 do
    begin
      if AdInfoList.Nodes.Items[i].Values[0] then
      begin
        if listview2.Items.Item[0].Data <> nil then
        begin
          DataServer.DeleteLenAdInfo(TDevice(find_ListItem.Data), AdInfoList.Nodes.Items[i].Values[1]);
          stateCmd := DataServer.cmdAdIDSend;
          Timer2.Enabled := true;
          adlenID := i + 1; //===��ס��һ��  ��λ��
          ProgressBar1.StepIt;
          exit;
        end;
      end;
    end;
  end;
end;

procedure TledAdUnitFrm.Button2Click(Sender: TObject);
var
  find_ListItem: TListItem;
begin
  ProgressBar1.Position := 0;
  AdInfoList.Clear;
  if listview2.Items.Count = 0 then
  begin
    messagebox(handle, '��ѡ��Ҫ��ȡ�Ĺ�泵��!', '��ʾ', mb_ok + mb_iconinformation);
    exit;
  end;
  find_ListItem := listview2.ItemFocused;
  if find_ListItem <> nil then
  begin
    DataServer.ReadAllAdInfo(find_ListItem.data);
    application.ProcessMessages;
    ProgressBar1.Position := ProgressBar1.Max;
    readAD := GSetParamCmdID;
    ComboBox1.Items.Clear;
    label1.Caption := ' ���ڶ�ȡ' + find_listitem.Caption + ' �Ĺ������,���Ե�!';
    timer1.Enabled := true;
  end;
end;

procedure TledAdUnitFrm.Button1Click(Sender: TObject);

var
  frm: TFrmSelectDevs;
  i: integer;
begin
  frm := TFrmSelectDevs.Create(nil);
  try
    if frm.ShowModal = mrOk then
    begin
      ListView2.Clear;
      for i := 0 to frm.DestList.Count - 1 do
      begin
        with ListView2.Items.Add do
        begin
          Caption := TDevice(frm.DestList.Items[i].Data).Car.No;
          Data := frm.DestList.Items[i].Data;
        end;
      end;
    end;
  finally
    frm.Free;
  end;

end;

procedure TledAdUnitFrm.Timer1Timer(Sender: TObject);
var
  State: byte;
  i, speedjb: integer;

  DataSet: TClientDataSet;
  node: TcxTreeListNode;
begin
  State := ACmdManage.Find(readAD)^.State;
  if State = CMD_SNDNODO then
  begin
    exit;
  end;
  if State = CMD_DONE then
  begin
    speedjb := 0;
    AdInfoList.Clear;
    bs.ConnectServer;
    for i := 0 to ComboBox1.Items.Count do
    begin
      if length(combobox1.Items.Strings[i]) > 0 then
      begin
        DataSet := bs.QueryLedAd(strtoint(combobox1.Items.Strings[i]));
        if dataset.RecordCount > 0 then
        begin
          node := AdInfoList.Add;
          node.Values[0] := 0;
          node.Values[1] := DataSet.FieldValues['ID'];
          node.Values[2] := DataSet.FieldValues['LedMemo'];
          node.Values[3] := DataSet.FieldValues['DataType'];
          speedjb := DataSet.FieldValues['DisSpeed'];
          case speedjb of
            1: begin
                node.Values[4] := 'һ��';
              end;
            2: begin
                node.Values[4] := '����';
              end;
            3: begin
                node.Values[4] := '����';
              end;
            4: begin
                node.Values[4] := '�ļ�';
              end;
            5: begin
                node.Values[4] := '�弶';
              end;
            6: begin
                node.Values[4] := '����';
              end;
            7: begin
                node.Values[4] := '�߼�';
              end;
            8: begin
                node.Values[4] := '�˼�';
              end;
          end;
          node.Values[5] := DataSet.FieldValues['InType'];
          node.Values[6] := DataSet.FieldValues['ExitType'];
          node.Values[9] := DataSet.FieldValues['StopTime'];
          node.Values[10] := DataSet.FieldValues['Font'];
          if DataSet.FieldValues['IsDisTime'] = 0 then
          begin
            node.Values[11] := '��ʾʱ��';
          end else
          begin
            node.Values[11] := '����ʾʱ��';
          end;
          node.Values[13] := strtodateTime(DataSet.FieldValues['RunTime']);
          node.Values[14] := strtodateTime(DataSet.FieldValues['endTime']);
          node.Values[15] := DataSet.FieldValues['CusTerm'];
          node.Values[16] := DataSet.FieldValues['custermPer'];
          node.Values[17] := DataSet.FieldValues['custermTel'];
          node.Values[18] := DataSet.FieldValues['Memo'];
          DataSet.Next;
        end;
        Timer1.Enabled := false;
      end;
    end;
    label1.Caption := '��ǰ���д洢�����ϢΪ' + inttostr(ComboBox1.Items.Count) + '��';
  end else
  begin
    label1.Caption := '�Բ��𣬶�ȡ���й����Ϣʧ��,��ȷ����������!';
    timer1.Enabled := false;
  end;

end;

procedure TledAdUnitFrm.SpeedButton3Click(Sender: TObject);
begin
  Timer2.Enabled := false;
  ProgressBar1.Position := 0;
  Label1.Caption := '';
end;

procedure TledAdUnitFrm.Timer2Timer(Sender: TObject);
  function CheckCanSend: boolean;
  var
    i: integer;
    state: byte;
  begin
    Result := false;
    for i := 0 to ListView2.Items.Count - 1 do
    begin
      state := ACmdManage.Find(stateCmd)^.State;
      if state = CMD_SNDNODO then //�����һ�������ڷ���״̬,����Ϊû�з�����,�����ȴ�.
      begin
        exit;
      end
      else if not (State = CMD_DONE) or (State = CMD_REPLACE) then // �����һ�����ʹ���,�ͱ���,�����û��Ƿ���ŷ���.
      begin
        if HaveErrorIsSet then continue;
        timer2.Enabled := false;
        if messagebox(handle, Pchar('����' + ADeviceManage.FindToCarNO(ACmdManage.Find(stateCmd).DevId) + '����!�Ƿ��������?'), pchar('��ʾ'), MB_YESNO) = ID_YES then
        begin
          HaveErrorIsSet := true;
          timer2.Enabled := true;
        end
        else
        begin
          timer2.Enabled := false;
          exit;
        end;
      end;
    end;
    Result := true;
  end;

var
  i, j: integer;
begin
  if CheckCanSend then
  begin
    Inc(SendP);
    if SendP >= proLength then
    begin
      timer2.Enabled := false;
      ProgressBar1.Position := 0;
      exit;
    end;
    adlenID := getIndexNextid;
    if adlenID > 0 then
    begin
      DataServer.DeleteLenAdInfo(TDevice(ListView2.Items.Item[0].Data), AdInfoList.Nodes.Items[getIndexNextid].Values[1]);
    end;
    inc(adlenID);
    ProgressBar1.StepIt;
    Application.ProcessMessages;
  end;
end;

function TledAdUnitFrm.getIndexNextid: integer;
var
  i: integer;
begin
  result := -1;
  for i := adlenID to AdInfoList.Count - 1 do
  begin
    if AdInfoList.Nodes.Items[i].Values[0] then
    begin
      result := i;
      exit;
    end;
  end;
end;

procedure TledAdUnitFrm.FormCreate(Sender: TObject);
begin
  HaveErrorIsSet := false;
end;

procedure TledAdUnitFrm.AdInfoListEditing(Sender: TObject;
  AColumn: TcxTreeListColumn; var Allow: Boolean);
begin
  if AdInfoList.FocusedNode = nil then exit;

  AColumn := SendChose;
  AColumn.Value := Allow;
end;

procedure TledAdUnitFrm.AdInfoListClick(Sender: TObject);
begin
  if AdInfoList.Count > 0 then
  begin
    AdInfoList.FocusedNode.Selected := true;
  end;
end;

procedure TledAdUnitFrm.CheckBox1Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to AdInfoList.Count - 1 do
    AdInfoList.Nodes.Items[i].Values[0] := checkbox1.Checked;
end;

end.

