unit QueryPictureListFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, CarUnit, uGloabVar,
  Menus, DateUtils, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxInplaceContainer, cxControls, CmdStructUnit;

type
  TQueryPictureListFrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn_List100: TBitBtn;
    BitBtn_Clr: TBitBtn;
    Panel3: TPanel;
    EventListView: TListView;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    cxTreeList1: TcxTreeList;
    cxTreeList1cxTreeListColumn1: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn2: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn3: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn4: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn5: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn6: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn7: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn8: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn9: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn10: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn11: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn12: TcxTreeListColumn;
    N2: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure BitBtn_ClrClick(Sender: TObject);
    procedure BitBtn_List100Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EventListViewColumnClick(Sender: TObject;
      Column: TListColumn);
    procedure N2Click(Sender: TObject);
  protected
    { Private declarations }
    function GetMediaType(mediaTypeId: Byte): string;
    function GetMediaChannelName(mediaChannelId: Byte): string;//通道名
    function GetReasonName(reasonId: Byte): string;
  public
    function PtrAdd(p: pointer; offset: integer): pointer;
    function ReturnPictureType(Value: Integer): string;
    procedure OnQueryPicture(Buff: PByte; Count: Word; ADev: TObject; Reason: string);
    procedure OnMediaDataUpload(dev: TDevice; mediaData: TMediaDataUpload_V3);
  end;

var
  QueryPictureListFrm: TQueryPictureListFrm;

implementation
uses umainf, UpPictureFrmUnit, Math, FrmUploadMediaSingleUnit;
{$R *.dfm}

function TQueryPictureListFrm.PtrAdd(p: pointer; offset: integer): pointer;
begin
  Result := Pointer(Integer(p) + offset);
end;

function TQueryPictureListFrm.ReturnPictureType(Value: Integer): string;
begin
  Result := '';
  case Value of
    0: Result := '照片';
    1: Result := '音频';
    2: Result := '视频';
    else
      Result := '未知';
  end;
end;

procedure TQueryPictureListFrm.OnQueryPicture(Buff: PByte; Count: Word; ADev: TObject; Reason: string);
var
  node: TListItem ;
  i: Integer;
  p: PQueryPicture_V3_New;
  pBuf: PByte;
  dateTime: TDateTime;
  year: Integer;
  month: Word;
  day: Word;
  hour: Word;
  minute: Word;
  second: Word;
  PictureType: Byte;
begin
  PictureType := 0;
  {if Count = 0 then
  begin
    //MessageBox(Handle, '无照片/音频列表', '提示', MB_OK + MB_ICONINFORMATION);
    PopMsg('来图像/音频文件', TDevice(ADev).Car.No + #13 + #10 + '无图像/音频文件了');
    Exit;
  end
  else
  begin
    PopMsg('来图像/音频文件', TDevice(ADev).Car.No + #13 + #10 + '上传图像/音频文件了');
  end;  }

  New(pBuf);
  for i:=0 to Count-1 do
  begin
    //if i>=128 then
    //  Break; 
    CopyMemory(pBuf, Buff, SizeOf(TQueryPicture_V3_New));
    P := PQueryPicture_V3_New(pBuf);
    if EventListView.Items.Count =0 then
    begin
      with EventListView.Items.Add  do
      begin
        Caption:=TDevice(ADev).IdStr;
        SubItems.Add(TDevice(ADev).Car.No);
        SubItems.Add(ReturnPictureType(0));
        SubItems.Add(IntToStr(p^.PictureId));

        SubItems.Add(GetDateTimeByID(p^.PictureId));//(DateTimeToStr(Now));
        SubItems.Add(IntToStr(0));
        SubItems.Add(Reason);
        SubItems.Add(DateTimeToStr(Now));
        Data:=@PictureType;
      end;
    end
    else
    begin
      node := EventListView.Items.Insert(0);
      node.Caption:=TDevice(ADev).IdStr;
      node.SubItems.Add(TDevice(ADev).Car.No);
      node.SubItems.Add(ReturnPictureType(PictureType));
      node.SubItems.Add(IntToStr(p^.PictureId));   

      node.SubItems.Add(GetDateTimeByID(p^.PictureId));//(DateTimeToStr(Now));
      node.SubItems.Add(IntToStr(PictureType));
      node.SubItems.Add(Reason);
      node.SubItems.Add(DateTimeToStr(Now));
      node.Data:=@PictureType;
    end;
    Buff := PtrAdd(Buff, SizeOf(TQueryPicture_V3_New));
  end;
end;

procedure TQueryPictureListFrm.N1Click(Sender: TObject);
var
  dlg: TUpPictureFrm;
  dateTime: TDateTime;
  dev: TDevice;
  PictureType: Byte;
  PictureId: Integer;
  node: TcxTreeListNode;
  p: PByte;
begin
  {if EventListView.Selected = nil then Exit;

  dev := ADeviceManage.find(EventListView.Selected.Caption);
  if dev <> nil then
  begin
    PictureType := StrToInt(EventListView.Selected.SubItems.Strings[4]); //Byte(EventListView.Selected.Data^);
    PictureId := StrToInt(EventListView.Selected.SubItems.Strings[2]);
    DataServer.SendUpPicture_V3_New(dev, PictureType, PictureId);
  end
  else
  begin
    messagebox(handle, pchar('该车辆不存在，无法发送命令！'), '提示', mb_ok + mb_iconinformation);
  end;}

  node := cxTreeList1.FocusedNode;
  if node = nil then Exit;
  dev := ADeviceManage.find(node.Values[0]);
  if dev = nil then Exit;
  dlg := TUpPictureFrm.Create(self);
  try
    dlg.cbxMediaType.ItemIndex := node.Values[7];
    dlg.ComboBoxCamera.ItemIndex := node.Values[8];
    dlg.cbxMediaReason.ItemIndex := node.Values[9];
    dateTime := StrToDateTime(node.Values[4]);
    dlg.beginDate.DateTime := dateTime;
    dlg.beginTime.DateTime := dateTime;
    dlg.endDate.DateTime := dateTime +  1/720;  // 往后加2分钟
    dlg.endTime.DateTime := dateTime +  1/720;  // 往后加2分钟

//    dev := ADeviceManage.find(StrToInt(EventListView.Selected.Caption));
    if dev <> nil then
    begin
      with dlg.ListView1.Items.Add do
      begin
        caption := node.Values[1];
        data := dev;
      end;
    end;

    dlg.ShowModal;
  finally
    dlg.Free;
  end;
end;

procedure TQueryPictureListFrm.BitBtn_ClrClick(Sender: TObject);
begin
//  EventListView.Clear;
  cxTreeList1.Clear;
end;

procedure TQueryPictureListFrm.BitBtn_List100Click(Sender: TObject);
var
  i: Integer;
begin
//  while EventListView.Items.Count > 10 do
//  begin
//    EventListView.Items.Delete(EventListView.Items.Count-1);
//  end;
  while cxTreeList1.Count > 10 do
    cxTreeList1.Items[cxTreeList1.Count - 1].Delete;
end;

procedure TQueryPictureListFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Mainf.Show_QueryPictureList.Checked := False;
end;

procedure TQueryPictureListFrm.EventListViewColumnClick(Sender: TObject;
  Column: TListColumn);
begin
  EventListView.CustomSort(@CustormSortProc, Column.Index);
  LvSort := not LvSort;
end;

procedure TQueryPictureListFrm.OnMediaDataUpload(dev: TDevice;
  mediaData: TMediaDataUpload_V3);
begin
  with cxTreeList1.AddFirst do
  begin
    Values[0] := dev.Id;
    Values[1] := dev.Car.No;
    Values[2] := GetMediaType(mediaData.MediaType);
    Values[3] := GetMediaChannelName(mediaData.MediaChannel);
    Values[4] := FormatDateTime('yyyy-MM-dd hh:nn:ss', GetGpsTime(mediaData.GpsTime));
    Values[5] := GetReasonName(mediaData.Reason);
    Values[6] := FormatDateTime('yyyy-MM-dd hh:nn:ss', Now);
    Values[7] := mediaData.MediaType;
    Values[8] := mediaData.MediaChannel;
    Values[9] := mediaData.Reason;
    Values[10] := GetMediaChannel(mediaData.MediaChannel);
    Values[11] := ByteOderConvert_LongWord(mediaData.MediaId);
    Data := @dev;
  end;
end;

function TQueryPictureListFrm.GetMediaType(mediaTypeId: Byte): string;
begin
  case mediaTypeId of
    0: Result := '图像';
    1: Result := '音频';
    2: Result := '视频';
  else
    Result := '未知';
  end;
end;

function TQueryPictureListFrm.GetMediaChannelName(
  mediaChannelId: Byte): string;
begin
  case mediaChannelId of
    1: Result := '司机上方';
    2: Result := '前车';
    3: Result := '前车厢';
    4: Result := '后车厢';
    5: Result := '前车外';
  else
    Result := '未知';
  end;
end;

function TQueryPictureListFrm.GetReasonName(reasonId: Byte): string;
begin
  case reasonId of
    0: Result := '中心下发';
    1: Result := '定时动作';
    2: Result := '抢劫报警';
    3: Result := '碰撞侧翻报警';
    4: Result := '疲劳报警';
  else
    Result := '未知';
  end;
end;

procedure TQueryPictureListFrm.N2Click(Sender: TObject);
var
  dlg: TfrmUploadMediaDataSingle;
  dateTime: TDateTime;
  dev: TDevice;
  PictureType: Byte;
  PictureId: Integer;
  node: TcxTreeListNode;
  p: PByte;
begin
  node := cxTreeList1.FocusedNode;
  if node = nil then Exit;
  dev := ADeviceManage.find(node.Values[0]);
  if dev = nil then Exit;
  dlg := TfrmUploadMediaDataSingle.Create(self);
  try
    dlg.CurrMediaId := node.Values[11];

    if dev <> nil then
    begin
      with dlg.ListView1.Items.Add do
      begin
        caption := node.Values[1];
        data := dev;
      end;
    end;

    dlg.ShowModal;
  finally
    dlg.Free;
  end;
end;

end.
