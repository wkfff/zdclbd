unit FrmInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit, RzButton,
  cxInplaceContainer, cxControls, ExtCtrls, CarUnit;

type
  TfrmInfo = class(TForm)
    Panel1: TPanel;
    cxTreeList1: TcxTreeList;
    cxTreeList1cxTreeListColumn1: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn2: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn3: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn4: TcxTreeListColumn;
    Panel2: TPanel;
    btnAdd: TRzBitBtn;
    btnEdit: TRzBitBtn;
    btnDel: TRzBitBtn;
    btnClose: TRzBitBtn;
    cxTreeList1cxTreeListColumn5: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn6: TcxTreeListColumn;
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure cxTreeList1CustomDrawCell(Sender: TObject;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
      var ADone: Boolean);
  private
    { Private declarations }
    procedure showInfoList;
    procedure addInfoToTreeList(infoTypeName: string; info: TInfo);
  public
    { Public declarations }
  end;


implementation
uses
  uGloabVar, FrmMInfoUtit, DateUtils;

{$R *.dfm}

procedure TfrmInfo.addInfoToTreeList(infoTypeName: string; info: TInfo);
begin
  with cxTreeList1.Add do
  begin
    Data := info;
    Values[0] := info.InfoId;
    Values[1] := infoTypeName;
    Values[2] := info.InfoContent;
    Values[3] := FormatDateTime('hh:nn', info.SendTime);
    Values[4] := info.Memo;
    if info.IsSent then
      Values[5] := '已发送'
    else
      Values[5] := '等待发送或未被点播'
  end;
end;

procedure TfrmInfo.FormShow(Sender: TObject);
begin
  showInfoList;
end;

procedure TfrmInfo.showInfoList;
var
  i, j: Integer;
  infoType: TInfoType;
  info: TInfo;
begin
  for i := 0 to FInfoTypeManage.Count - 1 do
  begin
    infoType := FInfoTypeManage.Items[i];
    for j := 0 to infoType.InfoCount - 1 do
    begin
      info := infoType.InfoItem[j];
      addInfoToTreeList(infoType.InfoTypeName, info);
    end;  
  end;  
end;

procedure TfrmInfo.btnAddClick(Sender: TObject);
var
  dlg: TfrmMInfo;
  id: Integer;
  infoType: TInfoType;
  info: TInfo;
  d: TDateTime;
begin
  dlg := TfrmMInfo.Create(Self);
  try
    d := IncHour(Now, 1);
    dlg.DateTimePicker1.DateTime := d;
    dlg.DateTimePicker2.DateTime := d;
    if dlg.ShowModal = mrOK then
    begin
      infoType := TInfoType(dlg.cbxInfoType.Items.Objects[dlg.cbxInfoType.ItemIndex]);
      if infoType <> nil then
      begin
        id := Bs.AddNewInfo(infoType.InfoTypeId, Trim(dlg.edtContent.Text), dlg.sendTime, Trim(dlg.edtMemo.Text));
        if id > 0 then
        begin
          info := infoType.AddInfo(id);
          info.InfoContent := Trim(dlg.edtContent.Text);
          info.SendTime := StrToDateTime(dlg.sendTime);
          info.Memo := Trim(dlg.edtMemo.Text);
          info.IsSent := False;
          
          addInfoToTreeList(infoType.InfoTypeName, info);
        end
        else
        begin
          MessageBox(Handle, '信息新增失败', '提示', MB_OK + MB_ICONINFORMATION);
        end;
      end
      else
      begin
        MessageBox(Handle, '信息新增失败', '提示', MB_OK + MB_ICONINFORMATION);
      end;  
    end;  
  finally
    dlg.Free;
  end;
end;

procedure TfrmInfo.btnEditClick(Sender: TObject);
var
  oldInfoType, newInfoType: TInfoType;
  oldInfo, newInfo: TInfo;
  dlg: TfrmMInfo;
  infoTypeName: string;
begin
  if cxTreeList1.Count <= 0 then
    Exit;

  if cxTreeList1.SelectionCount <= 0 then
  begin
    MessageBox(Handle, '请选择需要修改的信息', '提示', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  oldInfo := TInfo(cxTreeList1.Selections[0].Data);
  if oldInfo <> nil then
  begin
    oldInfoType := FInfoTypeManage.FindInfoTypeByTypeId(oldInfo.InfoTypeId);
    dlg := TfrmMInfo.Create(Self);
    try
      dlg.edtInfoId.Text := IntToStr(oldInfo.InfoId);
      infoTypeName := cxTreeList1.Selections[0].Values[1];
      dlg.cbxInfoType.ItemIndex := dlg.cbxInfoType.Items.IndexOf(infoTypeName);
      dlg.DateTimePicker1.DateTime := oldInfo.SendTime;
      dlg.DateTimePicker2.DateTime := oldInfo.SendTime;
      dlg.edtContent.Text := oldInfo.InfoContent;
      dlg.edtMemo.Text := oldInfo.Memo;
      if dlg.ShowModal = mrOK then
      begin
        newInfoType := TInfoType(dlg.cbxInfoType.Items.Objects[dlg.cbxInfoType.ItemIndex]);
        if newInfoType <> nil then
        begin
          if Bs.ModifyAInfo(oldInfo.InfoId, newInfoType.InfoTypeId, Trim(dlg.edtContent.Text), dlg.sendTime, Trim(dlg.edtMemo.Text)) then
          begin
            newInfo := newInfoType.AddInfo(oldInfo.InfoId);
            newInfo.InfoContent := Trim(dlg.edtContent.Text);
            newInfo.SendTime := StrToDateTime(dlg.sendTime);
            newInfo.Memo := Trim(dlg.edtMemo.Text);
            if (newInfoType <> oldInfoType) and (oldInfoType <> nil) then
            begin//如果改变了信息的信息类型，则在原来信息类型下删除该信息
              oldInfoType.DeleteInfo(oldInfo.InfoId);
            end;
            newInfo.IsSent := False;

            with cxTreeList1.Selections[0] do
            begin
              Data := newInfo;
              Values[0] := newInfo.InfoId;
              Values[1] := newInfoType.infoTypeName;
              Values[2] := newInfo.InfoContent;
              Values[3] := FormatDateTime('hh:nn', newInfo.SendTime);
              Values[4] := newInfo.Memo;
              if newInfo.IsSent then
                Values[5] := '已过发送时间'
              else
                Values[5] := '等待发送或未被点播'
            end;  
          end;  
        end;
      end;
    finally
      dlg.Free;
    end;
  end
  else
  begin
    MessageBox(Handle, '该信息类型有误，无法维护', '提示', MB_OK + MB_ICONINFORMATION);
  end;
end;

procedure TfrmInfo.btnDelClick(Sender: TObject);
var
  infoType: TInfoType;
  info: TInfo;
  i: Integer;
  dev: TDevice;
begin
  if cxTreeList1.Count <= 0 then
    Exit;

  if cxTreeList1.SelectionCount <= 0 then
  begin
    MessageBox(Handle, '请选择需要删除的信息', '提示', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  if MessageBox(Handle, '您确认删除该信息吗？', '确认', MB_YESNO + MB_ICONQUESTION) = IdNo then
    Exit;

  info := TInfo(cxTreeList1.Selections[0].Data);
  if info <> nil then
  begin
    infoType := FInfoTypeManage.FindInfoTypeByTypeId(info.InfoTypeId);
    if infoType <> nil then
    begin
      if Bs.DelInfo(info.InfoId) then
      begin
        infoType.DeleteInfo(info.InfoId);
        cxTreeList1.Selections[0].Delete;
      end;
    end
    else
    begin
      MessageBox(Handle, '该信息有误，无法删除', '提示', MB_OK + MB_ICONINFORMATION);
    end;
  end
  else
  begin
    MessageBox(Handle, '该信息有误，无法删除', '提示', MB_OK + MB_ICONINFORMATION);
  end;  
end;

procedure TfrmInfo.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmInfo.cxTreeList1CustomDrawCell(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
var
  info: TInfo;
  node: TcxTreeListNode;
begin
  node := AViewInfo.Node;
  info := TInfo(node.Data);
  if info <> nil then
  begin
    if info.IsSent then
    begin
      ACanvas.Font.Color := $003988B3;
      if node.Values[5] <> '已发送' then
        node.Values[5] := '已发送'
    end
    else
    begin
      ACanvas.Font.Color := clWindowText;
    end;
  end;
end;

end.
