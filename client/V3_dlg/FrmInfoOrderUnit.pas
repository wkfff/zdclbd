unit FrmInfoOrderUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzPanel, RzRadGrp, RzListVw, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, IntegerListUnit;

type
  TfrmInfoOrder = class(TForm)
    Panel4: TPanel;
    Panel8: TPanel;
    BitBtn5: TBitBtn;
    BitBtnSel: TBitBtn;
    ListView1: TListView;
    Panel7: TPanel;
    Panel111: TPanel;
    Panel2: TPanel;
    Panel5: TPanel;
    ProgressBar1: TProgressBar;
    rzListView: TRzListView;
    Panel3: TPanel;
    Panel1: TPanel;
    btnSend: TBitBtn;
    btnCancel: TBitBtn;
    rbgSetOption: TRzRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure BitBtnSelClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    Cancel: Boolean;
    InfoTypeList: TIntegerList;

    procedure showInfoTypes;
    procedure clearInfoTypeList;
    procedure GetSelectedInfoTypes;
  public
    { Public declarations }
  end;

implementation
uses
  CarUnit, uGloabVar, uFrmSelectDevs;

{$R *.dfm}

procedure TfrmInfoOrder.FormShow(Sender: TObject);
begin
  InfoTypeList := TIntegerList.Create;
  showInfoTypes;
end;

procedure TfrmInfoOrder.showInfoTypes;
var
  i: Integer;
  infoType: TInfoType;
begin
  for i := 0 to FInfoTypeManage.Count - 1 do
  begin
    infoType := FInfoTypeManage.Items[i];
    if infoType = nil then Continue;
    with rzListView.Items.Add do
    begin
      Caption := IntToStr(rzListView.Items.Count);
      SubItems.Add(infoType.InfoTypeName);
      SubItems.Add(infoType.Memo);
      Data := infoType;
    end;  
  end;  
end;

procedure TfrmInfoOrder.BitBtnSelClick(Sender: TObject);
var
  frm: TFrmSelectDevs;
  i:integer;
begin
  frm:=TFrmSelectDevs.Create(nil);
  try
    if frm.ShowModal=mrOk then
    begin
      ListView1.Clear;
      for i:=0 to frm.DestList.Count-1 do
      begin
        with ListView1.Items.Add do
        begin
          Caption:=TDevice(frm.DestList.Items[i].Data).Car.No;
          Data:=frm.DestList.Items[i].Data;
        end;
      end;
    end;
  finally
    frm.Free;
  end;
end;

procedure TfrmInfoOrder.BitBtn5Click(Sender: TObject);
begin
  if ListView1.Items.Count =1 then
  begin
     messagebox(handle,'车辆里只有一辆车,不能删除了!','提示',mb_ok + mb_iconinformation);
  end
  else
  begin
    ListView1.DeleteSelected;
  end;
end;

procedure TfrmInfoOrder.btnSendClick(Sender: TObject);
var
  setType: Byte;
  i: Integer;
  D: TDevice;
begin
  if ListView1.Items.Count <= 0 then
  begin
    MessageBox(Handle, '请选择需设置信息点播菜单的车辆', '提示', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  setType := rbgSetOption.ItemIndex;
  if setType = 0 then
  begin//删除所有
    if MessageBox(Handle, '您确认删除所有点播菜单吗？', '确认', MB_YESNO + MB_ICONQUESTION) = IdNo then
      Exit;
    Panel4.Enabled:=false;
    Panel111.Enabled:=false;
    Panel5.Visible:=true;
    ProgressBar1.Max:=ListView1.Items.Count*5*10;
    TbitBtn(Sender).Enabled:=false;
    try
      for i:=0 to ListView1.Items.Count -1 do
      begin
        if Cancel then
        begin
          if messagebox(handle, '是否确实要取消对剩余车辆的操作？', '提示', MB_YESNO + MB_ICONQUESTION) = ID_YES then
          begin
            Close;
            Exit;
          end
          else
          begin
            Cancel := False;
          end;
        end;

        D:=TDevice(ListView1.Items.Item[i].Data);
        ProgressBar1.StepIt;
        ProgressBar1.StepIt;
        DataServer.SetInfoMenu_V3(D, InfoTypeList, setType);
        ProgressBar1.StepIt;
        ProgressBar1.StepIt;
        //Application.ProcessMessages;
      end;
    finally
      Panel4.Enabled:=true;
      Panel111.Enabled:=true;
      Panel5.Visible:=false;
      TbitBtn(Sender).Enabled:=true;
    end;
  end
  else if (setType = 1) or (setType = 2) or (setType = 3) then
  begin//更新、追加、修改
    GetSelectedInfoTypes;
    if InfoTypeList.Count <= 0 then
    begin
      MessageBox(Handle, '请至少选中一个信息类型', '提示', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

    Panel4.Enabled:=false;
    Panel111.Enabled:=false;
    Panel5.Visible:=true;
    ProgressBar1.Max:=ListView1.Items.Count*5*10;
    TbitBtn(Sender).Enabled:=false;
    try
      for i:=0 to ListView1.Items.Count -1 do
      begin
        if Cancel then
        begin
          if messagebox(handle, '是否确实要取消对剩余车辆的操作？', '提示', MB_YESNO + MB_ICONQUESTION) = ID_YES then
          begin
            Close;
            Exit;
          end
          else
          begin
            Cancel := False;
          end;
        end;

        D:=TDevice(ListView1.Items.Item[i].Data);
        ProgressBar1.StepIt;
        ProgressBar1.StepIt;
        DataServer.SetInfoMenu_V3(D, InfoTypeList, setType);
        ProgressBar1.StepIt;
        ProgressBar1.StepIt;
        //Application.ProcessMessages;
      end;
    finally
      Panel4.Enabled:=true;
      Panel111.Enabled:=true;
      Panel5.Visible:=false;
      TbitBtn(Sender).Enabled:=true;
    end;
  end;
  Close;
end;

procedure TfrmInfoOrder.btnCancelClick(Sender: TObject);
begin
  Cancel := True;
end;

procedure TfrmInfoOrder.GetSelectedInfoTypes;
var
  i: Integer;
  listItem: TListItem;
  infoType, nInfoType: TInfoType;
begin
  clearInfoTypeList;
  for i := 0 to rzListView.Items.Count - 1 do
  begin
    listItem := rzListView.Items.Item[i];
    if listItem.Checked then
    begin
      infoType := listItem.Data;
      if infoType <> nil then
      begin
        nInfoType := TInfoType.Create;
        nInfoType.Id := infoType.Id;
        nInfoType.InfoTypeId := infoType.InfoTypeId;
        nInfoType.InfoTypeName := infoType.InfoTypeName;
        InfoTypeList.AddData(nInfoType.Id, nInfoType);
      end;
    end;
  end;
end;

procedure TfrmInfoOrder.clearInfoTypeList;
var
  infoType: TInfoType;
begin
  while InfoTypeList.Count > 0 do
  begin
    infoType := TInfoType(InfoTypeList.Datas[0]);
    InfoTypeList.Delete(0);
    infoType.Free;
  end;  
end;

procedure TfrmInfoOrder.FormDestroy(Sender: TObject);
begin
  clearInfoTypeList;
  InfoTypeList.Free;
end;

end.
