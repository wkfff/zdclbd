unit AdNew_AdUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxCalendar, cxInplaceContainer, cxControls, StdCtrls, Buttons, DBClient, CarUnit,
  cxSplitter, ComCtrls, ExtDlgs, cxCheckBox, RzButton, RzRadChk;

type
  TAdNew_AdFrm = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Panel3: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    AdInfoList: TcxTreeList;
    cxID: TcxTreeListColumn;
    DataSpeed: TcxTreeListColumn;
    InType: TcxTreeListColumn;
    ExitType: TcxTreeListColumn;
    x: TcxTreeListColumn;
    y: TcxTreeListColumn;
    StopTime: TcxTreeListColumn;
    Font: TcxTreeListColumn;
    IsDisTime: TcxTreeListColumn;
    ExTend: TcxTreeListColumn;
    LedMemo: TcxTreeListColumn;
    RunTime: TcxTreeListColumn;
    EndTime: TcxTreeListColumn;
    CusTerm: TcxTreeListColumn;
    custermper: TcxTreeListColumn;
    custermtel: TcxTreeListColumn;
    memo: TcxTreeListColumn;
    DataType: TcxTreeListColumn;
    cxSplitter1: TcxSplitter;
    Panel6: TPanel;
    SpeedButton3: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    OpenPictureDialog1: TOpenPictureDialog;
    SpeedButton4: TSpeedButton;
    AdInfoSendState: TcxTreeListColumn;
    ListView2: TListView;
    Panel5: TPanel;
    GroupBox1: TGroupBox;
    Label10: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label14: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label15: TLabel;
    a: TLabel;
    Edit2: TEdit;
    Edit1: TEdit;
    ComboBox3: TComboBox;
    ComboBox6: TComboBox;
    ComboBox8: TComboBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox7: TComboBox;
    Edit3: TEdit;
    Edit4: TEdit;
    ComboBox4: TComboBox;
    LedMemo1: TEdit;
    CusTerm1: TEdit;
    custermTel1: TEdit;
    custermPer1: TEdit;
    Panel8: TPanel;
    Image1: TImage;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Memo1: TMemo;
    cxSplitter2: TcxSplitter;
    SpeedButton6: TSpeedButton;
    ListView1: TListView;
    ListView3: TListView;
    ListView4: TListView;
    BitBtnSend: TBitBtn;
    SpeedButton7: TSpeedButton;
    adinfoSend: TcxTreeListColumn;
    Timer2: TTimer;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Panel7: TPanel;
    ProgressBar1: TProgressBar;
    Label20: TLabel;
    BitBtn5: TBitBtn;
    Panel9: TPanel;
    SpeedButton5: TSpeedButton;
    CheckBox2: TCheckBox;
    GroupBox2: TGroupBox;
    Label21: TLabel;
    Edit5: TEdit;
    Label22: TLabel;
    Edit6: TEdit;
    CheckBox1: TCheckBox;
    Label23: TLabel;
    Label24: TLabel;
    CheckBox3: TCheckBox;
    BitBtn6: TBitBtn;
    RzBitBtn1: TRzBitBtn;
    GroupBox3: TGroupBox;
    RzBitBtn2: TRzBitBtn;
    RzCheckBox1: TRzCheckBox;
    Label25: TLabel;
    ComboBox5: TComboBox;
    Label26: TLabel;
    ComboBox9: TComboBox;
    RzBitBtn3: TRzBitBtn;
    Edit7: TEdit;
    Edit8: TEdit;
    RzBitBtn4: TRzBitBtn;
    procedure SpeedButton1Click(Sender: TObject);
    procedure AdInfoListClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure DevListDblClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure BitBtnSendClick(Sender: TObject);
    procedure AdInfoListEditing(Sender: TObject;
      AColumn: TcxTreeListColumn; var Allow: Boolean);
    procedure Timer2Timer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure AdInfoListChange(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure ListView2DblClick(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn3Click(Sender: TObject);
    procedure RzCheckBox1Click(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzBitBtn4Click(Sender: TObject);
  private
    { Private declarations }
    function QueryADid(id: integer): boolean;
  public
    { Public declarations }
    SelectAdInfoNode: TcxTreeListNode;

    procedure textClear;
    procedure Refresh_SendedAdCmd;
    procedure Refresh_sendedAdallcmd;
    function FindItemByTextIncxListview(const FindStr: string; ListView: TListView; ColumnOrder: Integer): TListItem;
    function FindNodeByADTextIncxTreeList(const FindStr: string; cxTreeList: TcxTreeList; ColumnOrder: Integer): TcxTreeListNode;
    function getIndexID(content: string): integer;
    function getIndexNextid: integer;
    function getIndexNexCombox(content: string): integer;
  end;

var
  CmdIDList: array of integer;
  SendP: integer;
  HaveErrorIsSet: boolean;
  AdNew_AdFrm: TAdNew_AdFrm;
  filename: string;
  adlenID: integer;
  addnewControl: boolean;
  addnewcontrola: integer;
  proLength: integer;
var
  CmdIDADList: array of integer;
implementation
uses uGloabVar, blackpastFrm, uFrmSelectDevs, ConstDefineUnit;
{$R *.dfm}

procedure TAdNew_AdFrm.SpeedButton1Click(Sender: TObject);
var
  i, j: integer;
  buff: array[0..13] of byte;
  node: TcxTreeListNode;
begin
  bs.ConnectServer;
  addnewControl := false;
  if combobox8.ItemIndex = 1 then
  begin
    if image1.Picture = nil then
    begin
      Application.messagebox('请选择广告图片', '提示信息', mb_ok + mb_iconinformation);
      Exit;
    end;
  end else
  begin
    if length(LedMemo1.Text) = 0 then
    begin
      Application.messagebox('请输入广告内容', '提示信息', mb_ok + mb_iconinformation);
      Exit;
    end;
  end;
  if length(trim(edit4.Text)) = 0 then
  begin
    Application.messagebox('请输入停留时间！', '提示信息', mb_ok + mb_iconinformation);
    Exit;
  end;
  if length(edit3.Text) = 0 then
  begin
    edit3.Text := '0';
  end;
  i := 0;
  buff[0] := combobox8.ItemIndex + 1; //数据类型
  buff[1] := combobox3.ItemIndex + 1; // 数据速度
  buff[2] := combobox1.ItemIndex + 1; //进入方式
  buff[3] := combobox2.ItemIndex + 1; //退出方式
  buff[4] := $FF;
  buff[5] := $FF;
  buff[6] := $FF;
  buff[7] := $FF;
  buff[8] := combobox6.ItemIndex; //==字库
  buff[9] := combobox7.ItemIndex; //时间标本
  buff[10] := $FF;
  buff[11] := $FF;
  buff[12] := $FF;
  buff[13] := $FF;

  if combobox8.ItemIndex = 0 then
  begin
    j := bs.AddNewLedAd(trim(combobox8.Text), buff[1], trim(combobox1.Text), trim(combobox2.Text), '0', '0', (strtoint(edit3.Text) * 60 + strtoint(edit4.Text)), trim(combobox6.Text), buff[9], '0', trim(LedMemo1.Text), dateTimeTostr(DateTimePicker1.Time), dateTimeTostr(DateTimePicker2.Time), trim(CusTerm1.Text), trim(custermPer1.Text), trim(custermTel1.Text), trim(Memo1.Text));
  end else
  begin
    j := bs.AddNewLedAd(trim(combobox8.Text), buff[1], trim(combobox1.Text), trim(combobox2.Text), '0', '0', (strtoint(edit3.Text) * 60 + strtoint(edit4.Text)), combobox6.Text, buff[9], '0', filename, dateTimeTostr(DateTimePicker1.Time), dateTimeTostr(DateTimePicker2.Time), trim(CusTerm1.Text), trim(custermPer1.Text), trim(custermTel1.Text), trim(Memo1.Text));
  end;

  if j > 0 then
  begin
    node := AdInfoList.Add;
    node.Values[0] := 0;
    node.Values[1] := j;
    if combobox8.ItemIndex = 0 then
    begin
      node.Values[2] := ledmemo1.Text;
    end else
    begin
      node.Values[2] := filename;
    end;
    node.Values[3] := trim(combobox8.Text);
    node.Values[4] := trim(combobox3.Text);
    node.Values[5] := trim(combobox1.Text);
    node.Values[6] := trim(combobox2.Text);
    node.Values[9] := (strtoint(edit3.Text) * 60 + strtoint(edit4.Text));
    node.Values[10] := trim(combobox6.Text);
    node.Values[11] := trim(combobox7.Text);
    node.Values[13] := FormatDateTime('yyyy-mm-dd', DateTimePicker1.Time); //投放时间
    node.Values[14] := FormatDateTime('yyyy-mm-dd', DateTimePicker2.Time); //结束时间
    node.Values[15] := trim(CusTerm1.Text);
    node.Values[16] := trim(custermPer1.Text);
    node.Values[17] := trim(custermTel1.Text);
    node.Values[18] := trim(Memo1.Text);
    textClear;
  end else
  begin
    messagebox(handle, '对不起，添加广告失败！', '提示', mb_ok + mb_iconinformation);
    exit;
  end;
  addnewControl := true;
end;

procedure TAdNew_AdFrm.AdInfoListClick(Sender: TObject);
var
  DataSet: TClientDataSet;
  i: integer;
  node: TcxTreeListNode;
  dev: Tdevice;
  devid: string;
begin
  SelectAdInfoNode := AdInfoList.FocusedNode;
  if SelectAdInfoNode <> nil then
  begin
    image1.Picture.Graphic := nil;
    LedMemo1.Text := SelectAdInfoNode.Values[2];
    if SelectAdInfoNode.Values[3] = '文本' then
    begin
      combobox8.ItemIndex := 0;
    end else
    begin
      combobox8.ItemIndex := 1;
      try
        image1.Picture.LoadFromFile(SelectAdInfoNode.Values[2]);
        image1.Stretch := true;
      except
      end;
    end;
    combobox1.ItemIndex := getIndexNexCombox(SelectAdInfoNode.Values[5]) - 1;
    combobox2.ItemIndex := getIndexNexCombox(SelectAdInfoNode.Values[6]) - 1;
    combobox3.ItemIndex := getIndexNexCombox(SelectAdInfoNode.Values[4]) - 1;
    edit3.Text := SelectAdInfoNode.Values[9] div 60;
    edit4.Text := SelectAdInfoNode.Values[9] mod 60;
    combobox6.Text := SelectAdInfoNode.Values[10];
    combobox7.Text := SelectAdInfoNode.Values[11];

    DateTimePicker1.DateTime := strtodateTime(SelectAdInfoNode.Values[13]);
    DateTimePicker2.DateTime := strtodateTime(SelectAdInfoNode.Values[14]);
    CusTerm1.Text := SelectAdInfoNode.Values[15];
    custermPer1.Text := SelectAdInfoNode.Values[16];
    custermTel1.Text := SelectAdInfoNode.Values[17];
    memo1.Text := SelectAdInfoNode.Values[18];
    ListView3.Clear;
    if checkbox3.Checked then
    begin

      bs.ConnectServer;
      if not bs.Active then
      begin
        popmsg('连接业务服务器失败', '刷新失败!');
        exit;
      end;
      DataSet := bs.QueryAdByID(SelectAdInfoNode.Values[1], '');
      if DataSet = nil then exit;
      for i := 0 to DataSet.RecordCount - 1 do
      begin
        try
          devid := DataSet.FieldValues['DevId'];
          Dev := ADeviceManage.find(devid);
        except
        end;
        if dev <> nil then
        begin
          listview3.Items.BeginUpdate;
          with listview3.Items.Add do
          begin
            caption := dev.Car.No;
            subitems.Add(devid);
            if trim(SelectAdInfoNode.Values[18]) = '' then
            begin
              subitems.add('正常');
            end else
            begin
              subitems.add(trim(SelectAdInfoNode.Values[18]));
            end;
            if DataSet.FieldValues['LedNo'] = 0 then
            begin
              subitems.Add('后');
            end else
            begin
              subitems.add('前');
            end;
          end;
          listview3.Items.EndUpdate;
        end;
        DataSet.Next;
      end;
    end;
  end;
end;

procedure TAdNew_AdFrm.FormCreate(Sender: TObject);
  //====显示全部广告===//
var
  DataSet: TClientDataSet;
  i: integer;
  node: TcxTreeListNode;
  speedjb: integer;
begin
  bs.ConnectServer;
  GroupBox2.Enabled := false;
  edit5.Color := clBtnFace;
  edit6.Color := clBtnFace;
  ListView2.Items.Clear;
  if GCurSelectDev <> nil then
  begin
    with ListView2.Items.Add do
    begin
      caption := GCurSelectDev.Car.No;
      Data := GCurSelectDev;
    end;
  end;
  label20.Caption := '';
  adlenID := 0;
  AdInfoList.Clear;
  DataSet := bs.QueryLedAd(-1);
  if DataSet = nil then exit;
  for i := 0 to DataSet.RecordCount - 1 do
  begin
    node := AdInfoList.Add;
    node.Values[1] := DataSet.FieldValues['ID'];
    node.Values[2] := DataSet.FieldValues['LedMemo'];
    node.Values[3] := DataSet.FieldValues['DataType'];
    speedjb := DataSet.FieldValues['DisSpeed'];
    case speedjb of
      1: begin
          node.Values[4] := '一级';
        end;
      2: begin
          node.Values[4] := '二级';
        end;
      3: begin
          node.Values[4] := '三级';
        end;
      4: begin
          node.Values[4] := '四级';
        end;
      5: begin
          node.Values[4] := '五级';
        end;
      6: begin
          node.Values[4] := '六级';
        end;
      7: begin
          node.Values[4] := '七级';
        end;
      8: begin
          node.Values[4] := '八级';
        end;
    end;
    node.Values[5] := DataSet.FieldValues['InType'];
    node.Values[6] := DataSet.FieldValues['ExitType'];
    node.Values[9] := DataSet.FieldValues['StopTime'];
    node.Values[10] := DataSet.FieldValues['Font'];
    if DataSet.FieldValues['IsDisTime'] = 0 then
    begin
      node.Values[11] := '显示时间';
    end else
    begin
      node.Values[11] := '不显示时间';
    end;

    node.Values[13] := FormatDateTime('yyyy-mm-dd', strtodatetime(DataSet.FieldValues['RunTime']));
    node.Values[14] := FormatDateTime('yyyy-mm-dd', strtodatetime(DataSet.FieldValues['endTime']));
    node.Values[15] := DataSet.FieldValues['CusTerm'];
    node.Values[16] := DataSet.FieldValues['custermPer'];
    node.Values[17] := DataSet.FieldValues['custermTel'];
    node.Values[18] := DataSet.FieldValues['Memo'];
    node.Values[0] := 0;
    DataSet.Next;

  end;
  textClear;
end;


procedure TAdNew_AdFrm.SpeedButton2Click(Sender: TObject);
var
  node: TcxTreeListNode;
  I: integer;
  devid: string;
  Dev: TDevice;
  DataSet: TClientDataSet;
begin
  if AdInfoList.FocusedNode = nil then
  begin
    messagebox(handle, '请选择要删除的广告信息！', '提示', mb_ok + mb_iconinformation);
    exit;
  end;
  if Application.messagebox('请确认是否要删除信息!', '警告信息', mb_iconinformation + mb_yesno) = IDno then exit;
  node := SelectAdInfoNode;
  bs.ConnectServer;
  if DataSet <> nil then
  begin
    dataset := nil;
  end;
  DataSet := bs.QueryAdByID(SelectAdInfoNode.Values[1], '');
  if dataset.RecordCount > 0 then
  begin
    if messagebox(handle, PChar('您确定要删除[' + LedMemo1.Text + ']广告'), '提示', MB_OKCANCEL + MB_ICONQUESTION) = ID_OK then
    begin
      if listview3.Items.Count > 0 then
      begin
        Label20.Caption := '正在删除广告...';
      end;
      for i := 0 to listview3.Items.Count - 1 do
      begin
        devid := listview3.Items.Item[i].SubItems.Strings[0];
        Dev := ADeviceManage.find(devid);
        if Dev <> nil then
        begin
          DataServer.DeleteLenAdInfo(Dev, node.Values[1]); //定时器检查ＩＤ
          node.Values[18] := '正在删除...';
          with listview1.Items.Add do
          begin
            caption := inttostr(dataserver.cmdAdIDSend);
            subitems.Add(devid);
            subitems.Add('删除广告');
          end;
          with listview4.Items.Add do
          begin
            caption := node.Values[1]; //===增加LED_ID
            subitems.Add(inttostr(DataServer.cmdAdIDSend)); //====cmd  控制
            subitems.Add(dev.IdStr); //====根据 车机ID 号     目的在定时器里面就检查
            subitems.Add('0'); //0  未处理  1 成功 2  失败
            subitems.Add(inttostr(listview3.Items.Count));
          end;
        end
        else
        begin
          messagebox(0, pchar('没有找到' + listview3.Items.Item[i].SubItems.Strings[0] + '信息'), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    end;
  end else
  begin
    bs.DeleteLedAd(node.Values[1]); //===删除广告====//
    node.Delete;
    textClear;
  end;
end;

procedure TAdNew_AdFrm.Image1DblClick(Sender: TObject);
var
  m: integer;

  bmp: Tbitmap;
  backbmp: Tbitmap;
begin
  //====加载图片====转化为图片的128*16  的三倍==//
  if combobox8.ItemIndex = 0 then
  begin
    Application.messagebox('请选择图片数据格式！', '提示信息', mb_ok + mb_iconinformation);
    Exit;
  end;

  filename := '';
  if OpenPictureDialog1.Execute then
  begin
    Image1.Picture.Graphic := nil;
    filename := OpenPictureDialog1.filename;
    if uppercase(extractfileext(filename)) <> '.BMP' then
    begin
      Application.messagebox('请选择位图', '提示信息', mb_ok + mb_iconinformation);
      Exit;
    end;
    Image1.Picture.LoadFromFile(filename);

    backbmp := Tbitmap.Create;
    backbmp.Assign(image1.Picture.Bitmap);
    try
      bmp := Tbitmap.Create;
      bmp.PixelFormat := pf24bit;
      image1.AutoSize := true;
      bmp.Width := 128 * 4;
      bmp.Height := 16 * 4;
      //===保持最大不失真
      SetStretchbltmode(bmp.Canvas.Handle, halfTone);

      stretchblt(bmp.Canvas.Handle, 0, 0, bmp.Width, bmp.Height, backBMP.Canvas.Handle, 0, 0, BACKBMP.Width, BACKBMP.Height, SRCCOPY);

      image1.Picture.Bitmap.Assign(bmp);

      bmp.PixelFormat := pf24bit;
    except
    end;
  end;
end;

procedure TAdNew_AdFrm.textClear;
begin
  LedMemo1.Text := '';
  CusTerm1.Text := '';
  custermTel1.Text := '';
  custermPer1.Text := '';
  edit3.Text := '1';
  edit4.Text := '0';
end;

procedure TAdNew_AdFrm.DevListDblClick(Sender: TObject);
begin
  //=====//
end;

procedure TAdNew_AdFrm.SpeedButton5Click(Sender: TObject);
var
  devid: string;
  Dev: TDevice;
  fSelectItem: TListItem;
  fAddDeleteItem: TListItem;
  i: integer;
begin

  if CheckBox2.Checked then
  begin
    for i := 0 to listview3.Items.Count - 1 do
    begin
      devid := listview3.Items.Item[i].SubItems.Strings[0];
      Dev := ADeviceManage.find(devid);
      if Dev <> nil then
      begin
        DataServer.DeleteLenAdInfo(Dev, SelectAdInfoNode.Values[1]);
        listview3.Items.Item[i].SubItems.Strings[1] := '正在发送删除...';
        fAddDeleteItem := FindItemByTextIncxListview(listview3.Items.Item[i].SubItems.Strings[0], listview1, 1);
        if fAddDeleteItem <> nil then //=== 说明找到了
        begin
          fAddDeleteItem.Caption := inttostr(dataserver.cmdAdIDSend);
        end else
        begin
          with listview1.Items.Add do
          begin
            caption := inttostr(dataserver.cmdAdIDSend);
            subitems.Add(devid);
            subitems.Add('删除广告');
          end;
        end;
      end;
    end;
  end else
  begin
    fSelectItem := ListView3.Selected;
    devid := fSelectItem.SubItems.Strings[0];
    Dev := ADeviceManage.find(devid);
    if Dev <> nil then
    begin
      DataServer.DeleteLenAdInfo(Dev, SelectAdInfoNode.Values[1]);
      fSelectItem.SubItems.Strings[1] := '正在发送删除...';
      fAddDeleteItem := FindItemByTextIncxListview(fSelectItem.SubItems.Strings[0], listview1, 1);
      if fAddDeleteItem <> nil then //=== 说明找到了
      begin
        fAddDeleteItem.Caption := inttostr(dataserver.cmdAdIDSend);
      end else
      begin
        with listview1.Items.Add do
        begin
          caption := inttostr(dataserver.cmdAdIDSend);
          subitems.Add(devid);
          subitems.Add('删除广告');
        end;
      end;
    end;
  end;
end;

procedure TAdNew_AdFrm.FormShow(Sender: TObject);
begin
  textClear;
end;

procedure TAdNew_AdFrm.SpeedButton3Click(Sender: TObject);
var
  i, j: integer;
  buff: array[0..13] of byte;
  node: TcxTreeListNode;
begin
  if SelectAdInfoNode = nil then
  begin
    Application.messagebox('请选择要修改的广告信息！', '提示信息', mb_ok + mb_iconinformation);
    Exit;
  end;
  if combobox8.ItemIndex = 1 then
  begin
    if image1.Picture = nil then
    begin
      Application.messagebox('请选择广告图片', '提示信息', mb_ok + mb_iconinformation);
      Exit;
    end;
  end else
  begin
    if length(LedMemo1.Text) = 0 then
    begin
      Application.messagebox('请输入广告内容', '提示信息', mb_ok + mb_iconinformation);
      Exit;
    end;
  end;
  i := 0;
  buff[0] := combobox8.ItemIndex + 1; //数据类型
  buff[1] := combobox3.ItemIndex + 1; // 数据速度
  buff[2] := combobox1.ItemIndex + 1; //进入方式
  buff[3] := combobox2.ItemIndex + 1; //退出方式
  buff[4] := $FF;
  buff[5] := $FF;
  buff[6] := $FF;
  buff[7] := $FF;
  buff[8] := combobox6.ItemIndex; //==字库
  buff[9] := combobox7.ItemIndex; //时间标本
  buff[10] := $FF;
  buff[11] := $FF;
  buff[12] := $FF;
  buff[13] := $FF;

  if combobox8.ItemIndex = 0 then
  begin
    bs.ModifyLedAd(SelectAdInfoNode.Values[0], combobox8.Text, buff[1], combobox1.Text, combobox2.Text, '0', '0', (strtoint(edit3.Text) * 60 + strtoint(edit4.Text)), combobox6.Text, buff[9], '0', LedMemo1.Text, dateTimeTostr(DateTimePicker1.Time), dateTimeTostr(DateTimePicker2.Time), CusTerm1.Text, custermPer1.Text, custermTel1.Text, Memo1.Text);
  end else
  begin
    bs.ModifyLedAd(SelectAdInfoNode.Values[0], combobox8.Text, buff[1], combobox1.Text, combobox2.Text, '0', '0', (strtoint(edit3.Text) * 60 + strtoint(edit4.Text)), combobox6.Text, buff[9], '0', filename, dateTimeTostr(DateTimePicker1.Time), dateTimeTostr(DateTimePicker2.Time), CusTerm1.Text, custermPer1.Text, custermTel1.Text, Memo1.Text);
  end;
  if combobox8.ItemIndex = 0 then
  begin
    SelectAdInfoNode.Values[1] := ledmemo1.Text;
  end else
  begin
    SelectAdInfoNode.Values[1] := filename;
  end;
  SelectAdInfoNode.Values[2] := combobox8.Text;
  SelectAdInfoNode.Values[3] := combobox3.Text;
  SelectAdInfoNode.Values[4] := combobox1.Text;
  SelectAdInfoNode.Values[5] := combobox2.Text;
  SelectAdInfoNode.Values[8] := (strtoint(edit3.Text) * 60 + strtoint(edit4.Text));
  SelectAdInfoNode.Values[9] := combobox6.Text;
  SelectAdInfoNode.Values[10] := combobox7.Text;
  SelectAdInfoNode.Values[12] := DateTimePicker1.Time; //投放时间
  SelectAdInfoNode.Values[13] := DateTimePicker2.Time; //结束时间
  SelectAdInfoNode.Values[14] := CusTerm1.Text;
  SelectAdInfoNode.Values[15] := custermPer1.Text;
  SelectAdInfoNode.Values[16] := custermTel1.Text;
  SelectAdInfoNode.Values[17] := Memo1.Text;
end;

procedure TAdNew_AdFrm.SpeedButton4Click(Sender: TObject);
begin
  Timer2.Enabled := false;
  close;
end;

function TAdNew_AdFrm.QueryADid(id: integer): boolean;
var
  i: integer;
  flag: boolean;
begin
  flag := false;
  try
  finally
    result := flag;
  end;
end;

procedure TAdNew_AdFrm.Refresh_SendedAdCmd;
var
  i: integer;
  find_ListItem: TListItem;
  find_2listitem: TListItem;
begin
  for i := 0 to ACmdManage.count - 1 do
  begin
    find_ListItem := FindItemByTextIncxListview(IntToStr(ACmdManage.Items[i].Id), listview1, 0); //命令ID 号
    if find_ListItem <> nil then
    begin
      find_2listitem := FindItemByTextIncxListview(find_ListItem.SubItems.Strings[0], listview3, 1); //车机id  号码
      if find_ListItem = nil then continue;
      with find_ListItem do
      begin
        if ACmdManage.Items[i].addesc = 1 then //===删除成功
        begin
              //根据车机id 号关联 删除车机
          if find_2listitem <> nil then
          begin
            find_2listitem.Delete;
            find_ListItem.Delete;
          end;
        end;
        if ACmdManage.Items[i].addesc = 2 then //===超时----删除失败----等状况
        begin
          find_ListItem.Delete;
          find_2listitem.SubItems.Strings[1] := '发送删除失败';
        end;
      end;
    end;
  end;


end;

function TAdNew_AdFrm.FindItemByTextIncxListview(const FindStr: string;
  ListView: TListView; ColumnOrder: Integer): TListItem;
var
  i: integer;
begin
  result := nil;
  for i := 0 to ListView.Items.Count - 1 do
  begin
    if ColumnOrder = 0 then
    begin
      if ListView.Items.Item[i].Caption = FindStr then
      begin
        Result := ListView.Items[i];
        Break;
      end;
    end else
    begin
      if ListView.Items.Item[i].SubItems.Strings[ColumnOrder - 1] = FindStr then
      begin
        Result := ListView.Items[i];
        Break;
      end;
    end;
  end;
end;

procedure TAdNew_AdFrm.Timer1Timer(Sender: TObject);
begin
  // Refresh_SendedAdCmd;
  // Refresh_sendedAdallcmd;
end;

procedure TAdNew_AdFrm.Refresh_sendedAdallcmd;
var
  i, j: integer;
  find_ListItem: TListItem;
  find_2listitem: TListItem;
  find_3ListItem: TListItem;
var
  find_ListADItem: TcxTreeListNode;
begin
  for i := 0 to ACmdManage.count - 1 do
  begin
    find_ListItem := FindItemByTextIncxListview(IntToStr(ACmdManage.Items[i].Id), listview4, 1); //命令ID 号
    if find_ListItem <> nil then
    begin
        //0===未处理 1==成功 2  失败
      if ACmdManage.Items[i].addesc = 1 then //===删除成功
      begin
        find_ListItem.SubItems.Strings[2] := '1';
      end;
      if ACmdManage.Items[i].addesc = 2 then //===超时----删除失败----等状况
      begin
        find_ListItem.SubItems.Strings[2] := '2';
      end;
           //===根据LEDid 号码 判断所有这个广告的处理状况
      for j := 0 to listview4.Items.Count - 1 do
      begin
        if find_ListItem.Caption = listview4.Items.Item[j].Caption then
        begin
                //====就需要判断 listview4 里面 LEDid 号码  处理结果情况
          if listview4.Items.Item[j].SubItems.Strings[2] = '0' then //还有未处理
          begin
            exit;
          end;
          if listview4.Items.Item[j].SubItems.Strings[2] = '1' then //处理的 提示
          begin
            find_3ListItem := FindItemByTextIncxListview(find_ListItem.Caption, listview4, 1); // 根据判断 是否车辆全部发送成功
            if find_3ListItem = nil then
            begin
              find_ListADItem := FindNodeByADTextIncxTreeList(listview4.Items.Item[j].Caption, AdInfoList, 1);
              if find_ListADItem <> nil then
              begin
                listview4.Items.Item[j].Delete;
                bs.DeleteLedAd(find_ListADItem.Values[1]); //===删除广告====//
                exit;
              end;
            end;
          end;
          if listview4.Items.Item[j].SubItems.Strings[2] = '2' then
          begin
                   //====提示  删除 失败   再根据ID 号码找到 删除的广告内容
            find_ListADItem := FindNodeByADTextIncxTreeList(listview4.Items.Item[j].Caption, AdInfoList, 1);
            if find_ListADItem <> nil then
            begin
              find_ListADItem.Values[18] := '删除失败！';
              label20.Caption := '删除编号' + inttostr(find_ListADItem.Values[1]) + '广告失败';
              listview4.Items.Item[j].Delete;
              exit;
            end;
          end;
        end;
      end;

    end;
  end;


end;


function TAdNew_AdFrm.FindNodeByADTextIncxTreeList(const FindStr: string;
  cxTreeList: TcxTreeList; ColumnOrder: Integer): TcxTreeListNode;
var
  i: integer;
begin
  result := nil;
  for i := 0 to cxTreeList.Count - 1 do
  begin
    if cxTreeList.Items[i].Values[ColumnOrder] = FindStr then
    begin
      Result := cxTreeList.Items[i];
      Break;
    end;
  end;
end;

procedure TAdNew_AdFrm.SpeedButton6Click(Sender: TObject);
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

procedure TAdNew_AdFrm.BitBtnSendClick(Sender: TObject);
var
  i, j: integer;
  buff: array[0..13] of byte;
  adinfo: string;
begin
  Timer2.Enabled := false;
  if AdInfoList.Count <= 0 then exit;
  if ListView2.Items.Count <= 0 then
  begin
    messagebox(handle, '请选择要发送的车辆!', '提示', mb_ok + mb_iconinformation);
    exit;
  end;
  proLength := 0;
  SendP := 0;
  ProgressBar1.Position := 0;
  for i := 0 to AdInfoList.Count - 1 do
  begin
    if AdInfoList.Nodes.Items[i].Values[0] then
    begin
      inc(proLength);
    end;
  end;
  ProgressBar1.Max := proLength * 10 + 10;
  Timer2.Enabled := true;
  SetLength(CmdIDList, ListView2.Items.Count);
  for i := 0 to AdInfoList.Count - 1 do
  begin
    if AdInfoList.Nodes.Items[i].Values[0] then
    begin
      //===发送===//
      buff[0] := getIndexID(AdInfoList.Nodes.Items[i].Values[3]); //数据类型
      buff[1] := getIndexID(AdInfoList.Nodes.Items[i].Values[4]); // 数据速度
      buff[2] := getIndexID(AdInfoList.Nodes.Items[i].Values[5]); //进入方式
      buff[3] := getIndexID(AdInfoList.Nodes.Items[i].Values[6]); //退出方式
      buff[4] := $FF;
      buff[5] := $FF;
      buff[6] := $FF;
      buff[7] := $FF;
      buff[8] := getIndexID(AdInfoList.Nodes.Items[i].Values[10]); //==字库
      buff[9] := getIndexID(AdInfoList.Nodes.Items[i].Values[11]); //时间标本

      buff[10] := $FF;
      buff[11] := $FF;
      buff[12] := $FF;
      buff[13] := $FF;
      if AdInfoList.Nodes.Items[i].Values[2] = null then
      begin
        adinfo := '';
      end else
      begin
        adinfo := AdInfoList.Nodes.Items[i].Values[2];
      end;
      for j := 0 to listview2.Items.Count - 1 do
      begin
        DataServer.SendAdNEWInfo(TDevice(ListView2.Items.Item[j].Data), getIndexID(combobox4.Text), AdInfoList.Nodes.Items[i].Values[1], buff, adinfo, AdInfoList.Nodes.Items[i].Values[9]);
        CmdIDList[j] := GSetParamCmdID;
      end;
      label20.Caption := '正在发送...';
      adlenID := i + 1; //===记住第一次  的位置
      ProgressBar1.StepIt;
      Application.ProcessMessages;
      exit;
    end;
  end;
end;

function TAdNew_AdFrm.getIndexID(content: string): integer;
var
  ii: integer;
begin
  result := 0;
  if content = '从右到左' then ii := 1;
  if content = '从左到右' then ii := 2;
  if content = '从上到下' then ii := 3;
  if content = '从下到上' then ii := 4;
  if content = '整屏进入' then ii := 5;
  if content = '整屏退出' then ii := 5;
  if content = '显示时间' then ii := 1;
  if content = '不显示时间' then ii := 0;
  if content = '文本' then ii := 1;
  if content = '图片' then ii := 2;
  if content = '一级' then ii := 1;
  if content = '二级' then ii := 2;
  if content = '三级' then ii := 3;
  if content = '四级' then ii := 4;
  if content = '五级' then ii := 5;
  if content = '六级' then ii := 6;
  if content = '七级' then ii := 7;
  if content = '八级' then ii := 8;
  if content = '简体' then ii := 0;
  if content = '其它' then ii := 1;
  if content = '一号屏' then ii := 0;
  if content = '二号屏' then ii := 1;
  if content = '三号屏' then ii := 2;
  result := ii;
end;

procedure TAdNew_AdFrm.AdInfoListEditing(Sender: TObject;
  AColumn: TcxTreeListColumn; var Allow: Boolean);
begin

  if AdInfoList.FocusedNode = nil then exit;

end;

procedure TAdNew_AdFrm.Timer2Timer(Sender: TObject);
  function CheckCanSend: boolean;
  var
    i: integer;
    state: byte;
  begin
    Result := false;
    for i := 0 to ListView2.Items.Count - 1 do
    begin
      if ACmdManage.Find(CmdIDList[i]) = nil then exit;
      state := (ACmdManage.Find(CmdIDList[i]))^.State;
      if state = CMD_SNDNODO then //如果有一个还处于发送状态,就认为没有发送完,继续等待.
      begin
        exit;
      end
      else if not (State = CMD_DONE) or (State = CMD_REPLACE) then // 如果有一个发送错误,就报错,告诉用户是否接着发送.
      begin
        if HaveErrorIsSet then continue;
        timer2.Enabled := false;
        if messagebox(handle, Pchar('发送' + ADeviceManage.FindToCarNO(ACmdManage.Find(CmdIDList[i]).DevId) + '出错!是否继续发送?'), pchar('提示'), MB_YESNO) = ID_YES then
        begin
          HaveErrorIsSet := true;
          timer2.Enabled := true;
        end
        else
        begin
          timer2.Enabled := false;
          ProgressBar1.Position := 0;
          exit;
        end;
      end;
    end;
    Result := true;
  end;
var
  i, j: integer;
  buff: array[0..13] of byte;
  Dev: TDevice; ledNo: byte;
  ledID: integer; config: array of byte; AdInfo: string;
  stopTime: integer;
begin
  if CheckCanSend then
  begin
    Inc(SendP);
    if SendP >= proLength then
    begin
      timer2.Enabled := false;
      ProgressBar1.Position := 0;
      SendP := 0;
      proLength := 0;
      label20.Caption := '发送结束...';
      exit;
    end;
    for j := 0 to ListView2.Items.Count - 1 do
    begin


      adlenID := getIndexNextid;
      if adlenID > 0 then
      begin
        try
          bs.ConnectServer;
          buff[0] := getIndexID(AdInfoList.Nodes.Items[adlenID].Values[3]); //数据类型
          buff[1] := getIndexID(AdInfoList.Nodes.Items[adlenID].Values[4]); // 数据速度
          buff[2] := getIndexID(AdInfoList.Nodes.Items[adlenID].Values[5]); //进入方式
          buff[3] := getIndexID(AdInfoList.Nodes.Items[adlenID].Values[6]); //退出方式
          buff[4] := $FF;
          buff[5] := $FF;
          buff[6] := $FF;
          buff[7] := $FF;
          buff[8] := getIndexID(AdInfoList.Nodes.Items[adlenID].Values[10]); //==字库
          buff[9] := getIndexID(AdInfoList.Nodes.Items[adlenID].Values[11]); //时间标本

          buff[10] := $FF;
          buff[11] := $FF;
          buff[12] := $FF;
          buff[13] := $FF;
          ledNo := getIndexID(combobox4.Text);
          ledID := AdInfoList.Nodes.Items[adlenID].Values[1];
          if AdInfoList.Nodes.Items[adlenID].Values[2] = null then
          begin
            AdInfo := '';
          end else
          begin
            AdInfo := AdInfoList.Nodes.Items[adlenID].Values[2];
          end;
          AdInfo := trim(AdInfoList.Nodes.Items[adlenID].Values[2]);
          stopTime := AdInfoList.Nodes.Items[adlenID].Values[9];
          DataServer.SendAdNEWInfo(TDevice(ListView2.Items.Item[j].Data), ledNo, ledID, buff, AdInfo, stopTime);
          CmdIDList[j] := GSetParamCmdID;
        except
          on E: Exception do
          begin
            messagebox(handle, pchar(e.Message), '提示！', mb_ok + mb_iconinformation);
          end;
        end;
      end;
    end;
    inc(adlenID);
    ProgressBar1.StepIt;
    Application.ProcessMessages;
  end;

end;

function TAdNew_AdFrm.getIndexNextid: integer;
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

procedure TAdNew_AdFrm.BitBtn1Click(Sender: TObject);
begin
  timer2.Enabled := false;
  ProgressBar1.Position := 0;
  label20.Caption := '';
end;

procedure TAdNew_AdFrm.SpeedButton7Click(Sender: TObject);
var
  i, j: integer;
  buff: array[0..13] of byte;
  adinfo: string;
begin
  ProgressBar1.Position := 0;
  if AdInfoList.FocusedNode = nil then
  begin
    messagebox(handle, '请选择要发送的广告信息!', '提示', mb_ok + mb_iconinformation);
    exit;
  end;

  if ListView2.Items.Count <= 0 then
  begin
    messagebox(handle, '请选择要发送的车辆!', '提示', mb_ok + mb_iconinformation);
    exit;
  end;
  buff[0] := getIndexID(ComboBox8.Text); //数据类型
  buff[1] := getIndexID(combobox3.Text); // 数据速度
  buff[2] := getIndexID(combobox1.Text); //进入方式
  buff[3] := getIndexID(combobox2.Text);
  buff[4] := $FF;
  buff[5] := $FF;
  buff[6] := $FF;
  buff[7] := $FF;
  buff[8] := getIndexID(AdInfoList.FocusedNode.Values[10]); //==字库

  buff[9] := getIndexID(combobox7.Text); //时间标本
  buff[10] := $FF;
  buff[11] := $FF;
  buff[12] := $FF;
  buff[13] := $FF;
  SetLength(CmdIDList, ListView2.Items.Count);
  if AdInfoList.FocusedNode.Values[2] = null then
  begin
    adinfo := '';
  end else
  begin
    adinfo := AdInfoList.FocusedNode.Values[2];
  end;
  for j := 0 to listview2.Items.Count - 1 do
  begin
    DataServer.SendShowAdInfo(TDevice(ListView2.Items.Item[j].Data), getIndexID(combobox4.Text), AdInfoList.FocusedNode.Values[1], buff, AdInfoList.FocusedNode.Values[2], (strtoint(edit3.Text) * 60 + strtoint(edit4.Text)));
    CmdIDList[j] := GSetParamCmdID;
  end;
  ProgressBar1.Position := ProgressBar1.Max;
  Application.ProcessMessages;
end;

procedure TAdNew_AdFrm.BitBtn2Click(Sender: TObject);
begin
  addnewcontrola := 1;
  textClear;
  edit3.Text := '0';
  AdInfoList.Enabled := false;
  BitBtn2.Enabled := false;
  BitBtn3.Enabled := false;
  bs.ConnectServer;
end;

procedure TAdNew_AdFrm.BitBtn4Click(Sender: TObject);
begin
  AdInfoList.Enabled := true;
  BitBtn3.Enabled := true;
  BitBtn2.Enabled := true;
  BitBtn6.Enabled := true;
  addnewcontrola := 0;
end;

procedure TAdNew_AdFrm.BitBtn3Click(Sender: TObject);
begin
  speedbutton2.Click;
  addnewcontrola := 0;
end;

procedure TAdNew_AdFrm.BitBtn5Click(Sender: TObject);


begin
  if addnewcontrola = 1 then
  begin
    SpeedButton1.Click;
    addnewcontrola := 0;
    BitBtn2.Enabled := true;
    AdInfoList.Enabled := true;
    BitBtn2.Enabled := true;
  end;
  if addnewcontrola = 2 then
  begin
    addnewcontrola := 0;
    SelectAdInfoNode.Values[2] := trim(LedMemo1.Text);
    SelectAdInfoNode.Values[3] := trim(combobox8.Text);
    SelectAdInfoNode.Values[4] := trim(combobox3.Text);
    SelectAdInfoNode.Values[5] := trim(combobox1.Text);
    SelectAdInfoNode.Values[6] := trim(combobox2.Text);
    SelectAdInfoNode.Values[9] := (strtoint(edit3.Text) * 60 + strtoint(edit4.Text));
    SelectAdInfoNode.Values[11] := trim(ComboBox7.Text);
    SelectAdInfoNode.Values[15] := trim(CusTerm1.Text);
    SelectAdInfoNode.Values[16] := trim(custermTel1.Text);
    SelectAdInfoNode.Values[17] := trim(custermPer1.Text);
    bs.ModifyLedAd(SelectAdInfoNode.Values[1], combobox8.Text, combobox3.ItemIndex + 1, combobox1.Text, combobox2.Text, '0', '0', (strtoint(edit3.Text) * 60 + strtoint(edit4.Text)), combobox6.Text, combobox7.ItemIndex, '0', LedMemo1.Text, dateTimeTostr(DateTimePicker1.Time), dateTimeTostr(DateTimePicker2.Time), trim(CusTerm1.Text), trim(custermPer1.Text), trim(custermTel1.Text), trim(Memo1.Text));

    BitBtn3.Enabled := true;
    BitBtn6.Enabled := true;
    BitBtn2.Enabled := true;
    AdInfoList.Enabled := true;
  end;
end;

procedure TAdNew_AdFrm.CheckBox1Click(Sender: TObject);
begin
  if checkbox1.Checked then
  begin
    GroupBox2.Enabled := true;
    edit5.Color := clWindow;
    edit6.Color := clWindow;
  end else
  begin
    GroupBox2.Enabled := false;
    edit5.Color := clBtnFace;

    edit6.Color := clBtnFace;
  end;
end;

procedure TAdNew_AdFrm.ComboBox1Change(Sender: TObject);
begin
  if (ComboBox1.ItemIndex = 2) or (ComboBox1.ItemIndex = 3) then
  begin
    ComboBox3.ItemIndex := 0;
  end else
  begin
    ComboBox3.ItemIndex := 2;
  end;
end;

procedure TAdNew_AdFrm.AdInfoListChange(Sender: TObject);
begin
  SelectAdInfoNode := AdInfoList.FocusedNode;
  if SelectAdInfoNode <> nil then
  begin
    combobox1.Text := SelectAdInfoNode.Values[5];
    combobox2.Text := SelectAdInfoNode.Values[6];
  end;
end;

function TAdNew_AdFrm.getIndexNexCombox(content: string): integer;
var
  ii: integer;
begin
  result := 0;
  if content = '从右到左' then ii := 1;
  if content = '从左到右' then ii := 2;
  if content = '从上到下' then ii := 3;
  if content = '从下到上' then ii := 4;
  if content = '一级' then ii := 1;
  if content = '二级' then ii := 2;
  if content = '三级' then ii := 3;
  if content = '四级' then ii := 4;
  if content = '五级' then ii := 5;
  if content = '六级' then ii := 6;
  if content = '七级' then ii := 7;
  if content = '八级' then ii := 8;
  if content = '整屏进入' then ii := 5;
  if content = '整屏退出' then ii := 5;
  result := ii;
end;

procedure TAdNew_AdFrm.BitBtn6Click(Sender: TObject);
begin
  if SelectAdInfoNode <> nil then
  begin
    addnewcontrola := 2;
    BitBtn6.Enabled := false;
    BitBtn3.Enabled := false;
    BitBtn2.Enabled := false;
    AdInfoList.Enabled := false;
  end else
  begin
    messagebox(handle, '请选择你要修改的广告信息！', '提示', mb_ok + mb_iconinformation);
    exit;
  end;
end;

procedure TAdNew_AdFrm.ListView2DblClick(Sender: TObject);
var
  SelectItemList: TListItem;
begin
  SelectItemList := listview2.Selected;
  if SelectItemList <> nil then
  begin
    SelectItemList.Delete;
  end;
end;

procedure TAdNew_AdFrm.RzBitBtn2Click(Sender: TObject);

var
  time: array[0..7] of byte;
  Timth: word;
  ledjg: word;
  str: string;
  i: integer;
begin
  str := Copy(FormatDateTime('yymmddhhmmss', now), 1, 6) + inttohex((dayofweek(now) - 1), 2) + Copy(FormatDateTime('yymmddhhmmss', now), 7, 6);
  for i := 0 to 6 do
  begin
    time[i] := StrToInt(Copy(str, i * 2 + 1, 2));
  end;
  Timth := strtoint(edit5.Text);
  ledjg := strtoint(edit6.Text);
  ProgressBar1.Position := 0;

  for i := 0 to listview2.Items.Count - 1 do
  begin
    DataServer.SendADinfoTime(TDevice(ListView2.Items.Item[i].Data), time, Timth, ledjg);
  end;
  ProgressBar1.Position := ProgressBar1.Max;
end;

procedure TAdNew_AdFrm.RzBitBtn3Click(Sender: TObject);
var
  front: byte;
  back: byte;
var
  i: integer;
begin
  front := combobox5.ItemIndex;
  back := combobox9.ItemIndex;
  ProgressBar1.Position := 0;
  for i := 0 to listview2.Items.Count - 1 do
  begin
    DataServer.SendLedseat_New(TDevice(ListView2.Items.Item[i].Data), front, back);
  end;
  ProgressBar1.Position := ProgressBar1.Max;
end;

procedure TAdNew_AdFrm.RzCheckBox1Click(Sender: TObject);
begin
  if RzCheckBox1.Checked then
  begin
    GroupBox3.Enabled := true;
  end else
  begin
    GroupBox3.Enabled := false;
  end;
end;

procedure TAdNew_AdFrm.RzBitBtn1Click(Sender: TObject);
var
  j: integer;
begin
  ProgressBar1.Position := 0;
  if AdInfoList.FocusedNode = nil then
  begin
    messagebox(handle, '请选择要发送的广告信息!', '提示', mb_ok + mb_iconinformation);
    exit;
  end;

  if ListView2.Items.Count <= 0 then
  begin
    messagebox(handle, '请选择要发送的车辆!', '提示', mb_ok + mb_iconinformation);
    exit;
  end;
  for j := 0 to listview2.Items.Count - 1 do
  begin
    DataServer.SendShowLedSaveID(TDevice(ListView2.Items.Item[j].Data), AdInfoList.FocusedNode.Values[1]);
    sleep(50);
  end;
  ProgressBar1.Position := ProgressBar1.Max;
  Application.ProcessMessages;
end;

procedure TAdNew_AdFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := cafree;
end;

procedure TAdNew_AdFrm.RzBitBtn4Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to AdInfoList.Count - 1 do
  begin
    if (AdInfoList.Nodes.Items[i].Values[1] >= strtoint(edit7.Text)) and (AdInfoList.Nodes.Items[i].Values[1] <= strtoint(edit8.Text)) then
    begin
      AdInfoList.Nodes.Items[i].Values[0] := true;
    end;
  end;
end;

end.

