unit FrmInfoTypeUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxControls,
  cxInplaceContainer, ExtCtrls, cxTextEdit, RzButton, CarUnit;

type
  TfrmInfoType = class(TForm)
    Panel1: TPanel;
    cxTreeList1: TcxTreeList;
    Panel2: TPanel;
    cxTreeList1cxTreeListColumn1: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn2: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn3: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn4: TcxTreeListColumn;
    btnAdd: TRzBitBtn;
    btnEdit: TRzBitBtn;
    btnDel: TRzBitBtn;
    btnClose: TRzBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
    procedure AddInfoTypeToTreeList(infoType: TInfoType);
    procedure showInfoTypes();

  public
    { Public declarations }
  end;

implementation
uses
  umainf, uGloabVar, FrmMInfoTypeUnit;
{$R *.dfm}

procedure TfrmInfoType.AddInfoTypeToTreeList(infoType: TInfoType);
begin
  with cxTreeList1.Add do
  begin
    Data := infoType;
    Values[0] := infoType.Id;
    Values[1] := infoType.InfoTypeId;
    Values[2] := infoType.InfoTypeName;
    Values[3] := infoType.Memo;
  end;  
end;

procedure TfrmInfoType.FormShow(Sender: TObject);
begin
  showInfoTypes;
end;

procedure TfrmInfoType.showInfoTypes;
var
  i: Integer;
  infoType: TInfoType;
begin
  for i := 0 to FInfoTypeManage.Count - 1 do
  begin
    infoType := FInfoTypeManage.Items[i];
    AddInfoTypeToTreeList(infoType);
  end;  
end;

procedure TfrmInfoType.btnAddClick(Sender: TObject);
var
  dlg: TfrmMInfoType;
  id: Integer;
  infoType: TInfoType;
begin
  if cxTreeList1.Count > 255 then
  begin
    MessageBox(Handle, '信息类型最多有255个，不能再新增', '提示', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  dlg := TfrmMInfoType.Create(Self);
  try
    if dlg.ShowModal = mrOK then
    begin
      id := Bs.AddNewInfoType(StrToInt(dlg.edtTypeNo.Text), Trim(dlg.edtTypeName.Text), Trim(dlg.edtTypeMemo.Text));
      if id > 0 then
      begin
        infoType := FInfoTypeManage.AddInfoType(id);
        infoType.InfoTypeId := StrToInt(dlg.edtTypeNo.Text);
        infoType.InfoTypeName := Trim(dlg.edtTypeName.Text);
        infoType.Memo := Trim(dlg.edtTypeMemo.Text);

        AddInfoTypeToTreeList(infoType);
      end
      else
      begin
        MessageBox(Handle, '信息类型新增失败', '提示', MB_OK + MB_ICONINFORMATION);
      end;    
    end;  
  finally
    dlg.Free;
  end;
end;

procedure TfrmInfoType.btnEditClick(Sender: TObject);
var
  infoType: TInfoType;
  dlg: TfrmMInfoType;
begin
  if cxTreeList1.Count <= 0 then
    Exit;

  if cxTreeList1.SelectionCount <= 0 then
  begin
    MessageBox(Handle, '请选择需要修改的信息类型', '提示', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  infoType := TInfoType(cxTreeList1.Selections[0].Data);
  if infoType <> nil then
  begin
    if infoType.DevIdList.Count > 0 then
    begin
      if MessageBox(Handle, '该信息类型已经被点播，您确认要修改该信息类型吗？', '确认', MB_YESNO + MB_ICONQUESTION) = IdNo then
        Exit;
    end;
    dlg := TfrmMInfoType.Create(Self);
    try
      dlg.edtTypeId.Text := IntToStr(infoType.Id);
      dlg.edtTypeNo.Text := IntToStr(infoType.InfoTypeId);
      dlg.edtTypeName.Text := infoType.InfoTypeName;
      dlg.edtTypeMemo.Text := infoType.Memo;
      if dlg.ShowModal = mrOK then
      begin
        if Bs.ModifyAInfoType(infoType.Id, StrToInt(dlg.edtTypeNo.Text), Trim(dlg.edtTypeName.Text), Trim(dlg.edtTypeMemo.Text)) then
        begin
          infoType.InfoTypeId := StrToInt(dlg.edtTypeNo.Text);
          infoType.InfoTypeName := Trim(dlg.edtTypeName.Text);
          infoType.Memo := Trim(dlg.edtTypeMemo.Text);

          with cxTreeList1.Selections[0] do
          begin
            Values[0] := infoType.Id;
            Values[1] := infoType.InfoTypeId;
            Values[2] := infoType.InfoTypeName;
            Values[3] := infoType.Memo;
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

procedure TfrmInfoType.btnDelClick(Sender: TObject);
var
  infoType: TInfoType;
  i: Integer;
  dev: TDevice;
begin
  if cxTreeList1.Count <= 0 then
    Exit;

  if cxTreeList1.SelectionCount <= 0 then
  begin
    MessageBox(Handle, '请选择需要删除的信息类型', '提示', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  if MessageBox(Handle, '您确认删除该信息类型吗？', '确认', MB_YESNO + MB_ICONQUESTION) = IdNo then
    Exit;
  infoType := TInfoType(cxTreeList1.Selections[0].Data);
  if infoType <> nil then
  begin
    if infoType.DevIdList.Count > 0 then
    begin
      if MessageBox(Handle, '该信息类型已经被点播，您确认要删除该信息类型吗？', '确认', MB_YESNO + MB_ICONQUESTION) = IdNo then
        Exit;
    end;
    if Bs.DelInfoType(infoType.Id) then
    begin
      if infoType.DevIdList.Count > 0 then
      begin
        for i := 0 to infoType.DevIdList.Count - 1 do
        begin
          dev := ADeviceManage.find(infoType.DevIdList[i]);
          if dev <> nil then
            dev.DeleteInfoTypeId(infoType.InfoTypeId);
        end;  
      end;
      FInfoTypeManage.DeleteInfoType(infoType.Id);
      cxTreeList1.Selections[0].Delete;
    end;
  end
  else
  begin
    MessageBox(Handle, '该信息类型有误，无法删除', '提示', MB_OK + MB_ICONINFORMATION);
  end;
end;


procedure TfrmInfoType.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
