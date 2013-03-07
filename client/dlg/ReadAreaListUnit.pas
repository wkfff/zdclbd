unit ReadAreaListUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, RzTabs, RzButton, ExtCtrls;

type
  TfrmReadAreaForList = class(TForm)
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    ListView1: TListView;
    TabSheet2: TRzTabSheet;
    TabSheet3: TRzTabSheet;
    ListView3: TListView;
    Panel1: TPanel;
    Panel2: TPanel;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    ListView2: TListView;
    Timer1: TTimer;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    CheckBox1: TCheckBox;
    Edit2: TEdit;
    procedure FormShow(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function FindItemByTextIncxListview(const FindStr: string; ListView: TListView; ColumnOrder: Integer): TListItem;
  end;

var
  frmReadAreaForList: TfrmReadAreaForList;

implementation
uses uGloabVar, CarUnit;
{$R *.dfm}

procedure TfrmReadAreaForList.FormShow(Sender: TObject);
begin
  //===加载电子围栏信息

end;

procedure TfrmReadAreaForList.RzBitBtn2Click(Sender: TObject);
begin
  timer1.Enabled := false;
  close;
end;

procedure TfrmReadAreaForList.RzBitBtn1Click(Sender: TObject);
var
  area_id, i: integer;
  dev: TDevice;
  Area: array of byte;
  cmdid: integer;
begin
  // 选择删除
  if checkbox1.Checked then
  begin
    dev := ADeviceManage.find(trim(edit1.Text));
    area_id := strtoint(trim(edit2.Text));
    setlength(area, 2);
    area[0] := strtoint('$' + copy(inttohex(area_id, 4), 3, 2));
    area[1] := strtoint('$' + copy(inttohex(area_id, 4), 1, 2));
    cmdID := DataServer.SendDeleteAreaListForDev(dev, Area);

    exit;
  end;
  case RzPageControl1.ActivePageIndex of
    0:
      begin
        if listview1.Selected = nil then
        begin
          messagebox(handle, '请选择你要删除的电子围栏信息！', '提示', mb_ok + mb_iconinformation);
          exit;
        end;
        dev := ADeviceManage.find(trim(edit1.Text));
        area_id := strtoint(listview1.Selected.Caption);

        setlength(area, 2);
        area[0] := strtoint('$' + copy(inttohex(area_id, 4), 3, 2));
        area[1] := strtoint('$' + copy(inttohex(area_id, 4), 1, 2));

        if dev <> nil then
        begin
          cmdID := DataServer.SendDeleteAreaListForDev(dev, Area);
          listview1.Selected.SubItems.Strings[6] := inttostr(cmdID);
        end;

      end;
    1: begin
        if listview2.Selected = nil then
        begin
          messagebox(handle, '请选择你要删除的电子围栏信息！', '提示', mb_ok + mb_iconinformation);
          exit;
        end;
        dev := ADeviceManage.find(trim(edit1.Text));
        area_id := strtoint(listview2.Selected.Caption);
        setlength(area, 2);
        area[0] := strtoint('$' + copy(inttohex(area_id, 4), 3, 2));
        area[1] := strtoint('$' + copy(inttohex(area_id, 4), 1, 2));
        if dev <> nil then
        begin
          cmdID := DataServer.SendDeleteAreaListForDev(dev, Area);
          listview2.Selected.SubItems.Strings[6] := inttostr(cmdID);
        end;
      end;
    2: begin
        if listview3.Selected = nil then
        begin
          messagebox(handle, '请选择你要删除的电子围栏信息！', '提示', mb_ok + mb_iconinformation);
          exit;
        end;
        dev := ADeviceManage.find(trim(edit1.Text));
        area_id := strtoint(listview3.Selected.Caption);

        setlength(area, 2);
        area[0] := strtoint('$' + copy(inttohex(area_id, 4), 3, 2));
        area[1] := strtoint('$' + copy(inttohex(area_id, 4), 1, 2));

        if dev <> nil then
        begin
          cmdID := DataServer.SendDeleteAreaListForDev(dev, Area);
          listview3.Selected.SubItems.Strings[6] := inttostr(cmdID);
        end;
      end;
  end;
  timer1.Enabled:=true;
end;

procedure TfrmReadAreaForList.Timer1Timer(Sender: TObject);
var
  ListItem: TListItem;
  i: integer;
  cmdID: integer;
begin
  //查找删除 对应的值
  for i := 0 to listview1.Items.Count - 1 do
  begin
    if length(listview1.Items.Item[i].SubItems.Strings[6]) > 0 then
    begin
      //根据命令字检查
      cmdID := strtoint(listview1.Items.Item[i].SubItems.Strings[6]);
      if ACmdManage.Find(cmdID) <> nil then
      begin
       //找到对应的ID 号码 并删除
        if ACmdManage.Find(cmdID).State = 1 then
        begin
          listview1.Items.Item[i].Delete;
          break;
        end;
        if ACmdManage.Find(cmdID).State = 2 then
        begin
          listview1.Items.Item[i].SubItems.Strings[6] := '';
        end;
      end;
    end;
  end;
  for i := 0 to listview2.Items.Count - 1 do
  begin
    if length(listview2.Items.Item[i].SubItems.Strings[6]) > 0 then
    begin
      //根据命令字检查
      cmdID := strtoint(listview2.Items.Item[i].SubItems.Strings[6]);
      if ACmdManage.Find(cmdID) <> nil then
      begin
       //找到对应的ID 号码 并删除
        if ACmdManage.Find(cmdID).State = 1 then
        begin
          listview2.Items.Item[i].Delete;
          break;
        end;
        if ACmdManage.Find(cmdID).State = 2 then
        begin
          listview2.Items.Item[i].SubItems.Strings[6] := '';
        end;
      end;
    end;
  end;
end;

function TfrmReadAreaForList.FindItemByTextIncxListview(
  const FindStr: string; ListView: TListView;
  ColumnOrder: Integer): TListItem;
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


end.

