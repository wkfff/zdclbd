unit uSended_Message;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Buttons, StdCtrls, ComCtrls, ExtCtrls, DB, DBclient,
  DBGrids, types, ADODB, cxGraphics, cxCustomData, cxStyles, cxTL,
  cxTextEdit, cxCalendar, cxInplaceContainer, cxControls, Menus, ActnList,
  ImgList;

type
  TSended_Message = class(TForm)
    Panel3: TPanel;
    Panel8: TPanel;
    ListViewTo: TListView;
    Panel7: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    start_date: TDateTimePicker;
    start_time: TDateTimePicker;
    end_date: TDateTimePicker;
    end_time: TDateTimePicker;
    Panel10: TPanel;
    SB_Query: TSpeedButton;
    Splitter1: TSplitter;
    MsgList: TcxTreeList;
    MsgId: TcxTreeListColumn;
    DevId: TcxTreeListColumn;
    MsgSendTime: TcxTreeListColumn;
    MsgRcvTime: TcxTreeListColumn;
    MsgRespondTime: TcxTreeListColumn;
    MsgType: TcxTreeListColumn;
    MsgStat: TcxTreeListColumn;
    MsgContent: TcxTreeListColumn;
    DevCarNo: TcxTreeListColumn;
    CheckBox1: TCheckBox;
    ComboBox1: TComboBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    ActionList1: TActionList;
    SelectDevs: TAction;
    DelDev: TAction;
    InsertAll: TAction;
    DeleteAll: TAction;
    ImageList1: TImageList;
    N3: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    MsgMemo: TcxTreeListColumn;
    MsgSender: TcxTreeListColumn;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure SB_QueryClick(Sender: TObject);
    procedure InsertAllExecute(Sender: TObject);
    procedure DelDevExecute(Sender: TObject);
    procedure DeleteAllExecute(Sender: TObject);
    procedure SelectDevsExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
    //function CxTreeListToCSVFile(cxTreeList:TcxTreeList):boolean;
  public
    { Public declarations }
  end;

var
  Sended_Message: TSended_Message;

implementation
  uses uGloabVar, BusinessServerUnit, constDefineUnit,uMainf, carUnit,uFrmSelectDevs,
  StrUtils;
{$R *.dfm}

procedure TSended_Message.SB_QueryClick(Sender: TObject);
var
  devStr          : string;
  fromTime,toTime : TDateTime ;
  i,msgState      : integer;
  info            : OleVariant;
  saveCursor      : TCursor;
  temp            : TClientDataSet;
  devIdStr        : string;
begin
  if ListViewTo.Items.Count =0 then
  begin
    messagebox(0,'请先选择要查询的车辆!','提示',mb_ok + mb_iconinformation);
    exit;
  end ;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  devStr := '';
  for i:=0 to ListViewTo.Items.Count -1 do
    devStr := devStr+TDevice(ListViewTo.Items.Item[i].Data).IdStr+',';
  devStr := LeftStr(devStr,Length(devStr)-1);

  try
    fromTime := start_date.DateTime;
    ReplaceTime(fromTime,start_time.Time);
    toTime := end_date.DateTime;
    ReplaceTime(toTime,end_time.Time);
    if checkbox1.Checked then
    begin
      case combobox1.ItemIndex of
        0: msgState := MSGSTAT_UNSEND ;//消息未发送
        1: msgState := MSGSTAT_SENDED ;//消息已发送
        2: msgState := MSGSTAT_RECVED ;//消息已接收
        3: msgState := MSGSTAT_REPLYED;//消息已应答
        4: msgState := MSGSTAT_FAILED ;//消息发送失败
      end;
      info := bs.QueryMsgList_state(devStr,fromTime,toTime,msgState);
    end
    else
      info := bs.QueryMsgList(devStr,fromTime,toTime);     

    temp := TClientDataSet.Create(nil);
    try
      temp.Data := info;
      if temp.RecordCount= 0 then
      begin
        messagebox(handle,'对不起，没有满足查询要求的信息！','提示',mb_ok + mb_iconinformation);
        MsgList.Clear;
        exit;
      end;                                                                              
      MsgList.BeginUpdate;
      MsgList.Clear;
      for i:= 0 to temp.RecordCount- 1 do
      begin
        with MsgList.Add do
        begin
          //data:=
          Values[0]:= temp.FieldValues['msg_id'];
          devIdStr  := temp.FieldValues['dev_id'];
          values[1]:= devIdStr;
          values[2]:= ADeviceManage.Find(devIdStr).Car.No;
          values[3]:= temp.FieldValues['msg_sendtime'];
          values[4]:= temp.FieldValues['msg_recvtime'];
          values[5]:= temp.FieldValues['msg_reptime'];
          case temp.FieldValues['msg_type'] of
            MSGTYPE_NORMAL     : Values[6]:= '文本调度信息';
            MSGTYPE_NEEDANSWER : Values[6]:= '需回复的调度信息';
          end;
          case temp.FieldValues['msg_state'] of
            MSGSTAT_UNSEND : values[7]:='消息已发送'; //= 0
            MSGSTAT_SENDED : values[7]:='消息已发送'; //= 1
            MSGSTAT_RECVED : values[7]:='消息已接收'; //= 2;
            MSGSTAT_REPLYED: values[7]:='消息已应答'; //= 3;
            MSGSTAT_FAILED : values[7]:='消息发送失败';// = 9;
          end;
          values[8]:= temp.FieldValues['msg_content'];
          Values[9]:= temp.FieldValues['msg_memo'];
          Values[10]:= temp.FieldValues['sendusername'];
        end;
        temp.Next;
      end;
      MsgList.EndUpdate;
    finally
      temp.Free;
    end;
  finally
    Screen.Cursor := saveCursor;
  end;
end;

procedure TSended_Message.InsertAllExecute(Sender: TObject);
var
  i: integer;
  dev: Tdevice;
begin
  ListViewTo.Items.Clear;
  if ADeviceManage.Count >500 then
    messagebox(handle,'一次查询最多只能选择500辆车，现在只列出500辆车！','提示',mb_ok + mb_iconinformation);
  for i:= 0 to ADeviceManage.Count -1 do
  begin
    if i=500 then break;
    with ListViewTo.Items.Add do
    begin
      dev:= ADeviceManage.Items[i];
      Data := dev;
      Caption := dev.Car.No;
     // SubItems.Add(dev.IdStr);
    end;
  end;
end;

procedure TSended_Message.DelDevExecute(Sender: TObject);
begin
  if ListViewTo.Selected <> nil then
    ListViewTo.Selected.Delete;
end;

procedure TSended_Message.DeleteAllExecute(Sender: TObject);
begin
  ListViewTo.Items.Clear;
end;

procedure TSended_Message.SelectDevsExecute(Sender: TObject);
var
  dlg : TFrmSelectDevs;
  i   : integer;
  dev : Tdevice;
begin
  dlg:= TFrmSelectDevs.Create(nil);
  try
    dlg.ShowModal;
    if dlg.ModalResult = mrOk then
    begin
      ListViewTo.Items.Clear;
      if dlg.DestList.Count >0 then
      begin
        for i:= 0 to dlg.DestList.Count - 1 do
        begin
          dev:= Tdevice(dlg.DestList.Items[i].Data);
          if dev= nil then Continue;
          with ListViewTo.Items.Add do
          begin
            Data := dev;
            Caption := dev.Car.No;
            //SubItems.Add(dev.IdStr);
          end;
        end;
      end;
    end;
  finally
    dlg.Free;
  end;
end;

procedure TSended_Message.FormCreate(Sender: TObject);
begin
  start_date.Date := Date;
  end_date.Date := Date;
  start_time.Time := EncodeTime(0,0,0,0);
  end_time.Time   := EncodeTime(23,59,59,0);  
end;

procedure TSended_Message.BitBtn3Click(Sender: TObject);
begin
 CxTreeListToCSVFile(MsgList);
end;

{function TSended_Message.CxTreeListToCSVFile(cxTreeList: TcxTreeList): boolean;

var
  List:TStringList;
  SaveDialog:TSaveDialog;
  i,ii:integer;
  s:string;
begin
  Result:=false;
  List:=TStringList.Create;
  try
    List.Clear;
    s:='';
    for i:=0 to cxTreeList.ColumnCount-1 do
    begin
      if i=0 then
        s:=s+cxTreeList.Columns[i].Caption.Text
      else
        s:=s+','+cxTreeList.Columns[i].Caption.Text;
    end;
    List.Add(s); 
    for i:=0 to cxTreeList.Count-1 do
    begin
      s:='';
      for ii:=0 to cxTreeList.Items[i].ValueCount-1 do
      begin
        if ii=0 then
          s:=s+ cxTreeList.Items[i].Texts[ii]
        else
          s:=s+','+cxTreeList.Items[i].Texts[ii];
      end;
      List.Add(s);
    end;

    SaveDialog:=TSaveDialog.Create(Self);
    SaveDialog.Filter:='Execl文件(*.CSV)|*.CSV';
    try
      if SaveDialog.Execute  then
      begin
       List.SaveToFile(SaveDialog.FileName+'.CSV');
       Result:=true;
      end;
    finally
      SaveDialog.Free;
    end;
  finally
    List.Free;
  end;
end;    }

procedure TSended_Message.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ManualDock(nil);
end;

procedure TSended_Message.BitBtn4Click(Sender: TObject);
begin
  close;
end;

end.
