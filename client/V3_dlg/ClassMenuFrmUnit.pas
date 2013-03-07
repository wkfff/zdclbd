unit ClassMenuFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrmUnit, ComCtrls, StdCtrls, Buttons, ExtCtrls, cxGraphics,
  cxCustomData, cxStyles, cxTL, cxTextEdit, cxInplaceContainer, cxControls,
  InfoMenuUnit, CarUnit;

type
  TClassMenuFrm = class(TBaseFrm)
    cxDevEventList: TcxTreeList;
    Info_Id: TcxTreeListColumn;
    Info_No: TcxTreeListColumn;
    Info_info: TcxTreeListColumn;
    Infoid: TcxTreeListColumn;
    BitBtn6: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn4: TBitBtn;
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    Dev:TDevice;
  public
    { Public declarations }
    procedure ReLoadEventList(Dev:TDevice);
    function MenuNumSaveToDB(Dev:TDevice):boolean;
  end;

var
  ClassMenuFrm: TClassMenuFrm;

implementation
uses uGloabVar,uFrmSelectDevs;
{$R *.dfm}

procedure TClassMenuFrm.ReLoadEventList(Dev:TDevice);
var
  i: integer;
  pInfo: PclassInfoMenu;
begin
  cxDevEventList.BeginUpdate;
  cxDevEventList.Clear;
  for i:= 0 to Dev.classInfoMenuList.Count-1 do
  begin
    with cxDevEventList.Add do
    begin
      pInfo := Dev.classInfoMenuItems[i];
      data:= pInfo;
      Values[0] := i+1;//序号
      Values[1] := pInfo^.No;
      Values[2] := pInfo^.Info;
      Values[3] := pInfo^.id;
    end;
  end;
  cxDevEventList.EndUpdate;
end;

procedure TClassMenuFrm.BitBtn4Click(Sender: TObject);
var
  dlg : TInfoMenu;
  pInfo: pClassInfoMenu;
  i:integer;
  addClassInfoMenuId: Integer;
begin
  if cxDevEventList.Count>=22 then
  begin
    messagebox(handle,pchar('已有22条菜单信息，不能再添加！'),'提示',mb_ok + mb_iconinformation);
    exit;
  end;

  dlg := TInfoMenu.Create(nil);
  try
    dlg.EditMenuId.Text := '';
    dlg.EditMenuNO.Text := '';
    dlg.memInfo.Text := '';
    dlg.ShowModal;
    if dlg.ModalResult = mrok then
    begin
      //往数据库　该车机电话本中　加一个电话
      addClassInfoMenuId := Bs.AddNewAmbientInfoMenu(StrToInt(Trim(dlg.EditMenuNO.Text)),Trim(dlg.memInfo.Text));
      for i:=0 to cxDevEventList.Count-1 do
      begin
        if cxDevEventList.Items[i].Values[1]=dlg.EditMenuNO.Text then
        begin
          MessageBox(Self.Handle,PChar('菜单表里已存在编号为【'+dlg.EditMenuNO.Text+'】的这个菜单信息'),PChar('提示'),$40);
          exit;
        end;
        {if cxDevEventList.Items[i].Values[2]=dlg.meminfo.Text then
        begin
          MessageBox(Self.Handle,PChar('事件表里已有【'+dlg.meminfo.Text+'】这个事件'),PChar('提示'),$40);
          exit;
        end;  }
      end;
      pInfo := Dev.AddClassInfoMenu(addClassInfoMenuId);
      pInfo^.No := StrToInt(Trim(dlg.EditMenuNO.Text));
      pInfo^.info := dlg.memInfo.Text;
      ReLoadEventList(Dev);
    end;
  finally
    dlg.Free;
  end;
end;

procedure TClassMenuFrm.FormCreate(Sender: TObject);
begin
  inherited;
  Dev:=TDevice.Create;
end;

procedure TClassMenuFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dev.Free;
  inherited;
end;

procedure TClassMenuFrm.BitBtn5Click(Sender: TObject);
var
  dlg: TInfoMenu;
  pInfo: pClassInfoMenu;
  i : Integer;
begin
  if cxDevEventList.SelectionCount =0 then exit;
  pInfo := pClassInfoMenu(cxDevEventList.Selections[0].Data);
  dlg := TInfoMenu.Create(nil);
  try
    dlg.editMenuId.Text := IntToStr(pInfo^.Id);
    dlg.EditMenuNO.Text := IntToStr(pInfo^.No);
    dlg.memInfo.Text := pInfo^.Info;
    dlg.ShowModal;
    if dlg.ModalResult = mrok then
    begin
      if pInfo^.info <> dlg.memInfo.Text then
      begin
        for i:=0 to cxDevEventList.Count-1 do
        begin
          if cxDevEventList.Items[i].Values[1]=dlg.memInfo.Text then
          begin
            MessageBox(Self.Handle,PChar('菜单列表里已有'+dlg.memInfo.Text+'这个菜单'),PChar('提示'),$40);
            exit;
          end;
        end;
      end;
      pInfo := Dev.FindClassInfoMenu(StrToInt(dlg.editMenuId.Text));
      pInfo^.No := StrToInt(dlg.EditMenuNO.Text);
      pInfo^.Info := dlg.memInfo.Text;
      Bs.ModifyAAmbientInfoMenu(pInfo);
      ReLoadEventList(Dev);
    end;
  finally
    dlg.free;
  end;
end;

procedure TClassMenuFrm.BitBtn6Click(Sender: TObject);
var
  pInfo: pClassInfoMenu;
begin
  if cxDevEventList.SelectionCount =0 then
  begin
    MessageBox(handle,'请您选择要删除的菜单信息','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  pInfo := pClassInfoMenu(cxDevEventList.Selections[0].Data);
  if MessageBox(handle,pchar('您确定要删除菜单【 '+pInfo^.Info+' 】信息?'),
    '提示',MB_YESNO + MB_ICONQUESTION)=Id_No then
    exit;
  Bs.DeleteAAmbientInfoMenu(pInfo^.Id);
  Dev.DelClassInfoMenu(pInfo^.Id);
  ReLoadEventList(Dev);
end;

procedure TClassMenuFrm.BitBtn1Click(Sender: TObject);
var
  i,j:integer;
  D:TDevice;
  pInfo:pClassInfoMenu;
begin
  if cxDevEventList.Count<=0 then
  begin
    if messagebox(handle,'您确定要删除所有的菜单信息吗？','删除选项',MB_OKCANCEL + MB_ICONQUESTION)= ID_CANCEL then
       exit;
  end;
  PanProgress.Visible:=true;
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
      D.ClrClassInfoMenuList;
      ProgressBar1.StepIt;
      for j:=0 to Dev.ClassInfoMenuList.Count-1 do //当=0时,,是删除事件列表里的内容.
      begin
        pInfo:= D.AddClassInfoMenu(Dev.ClassInfoMenuItems[j].id);
        pInfo^.No := Dev.ClassInfoMenuItems[j].No;
        pInfo^.Info:=Dev.ClassInfoMenuItems[j].Info
      end;

      ProgressBar1.StepIt;
      DataServer.SetClassInfoMenu_V3(D); // 发送数据
      ProgressBar1.StepIt;
      MenuNumSaveToDB(D);
      ProgressBar1.StepIt;
      Sleep(50);
      Application.ProcessMessages;
    end;

  finally
    PanProgress.Visible:=false;
    TbitBtn(Sender).Enabled:=true;
  end;
 Close;
end;

function TClassMenuFrm.MenuNumSaveToDB(Dev:TDevice):boolean;
var
 i:integer;
 idList: string;
begin
  idList := '';
  Result:=false;
  if ADeviceManage.Find(Dev.IdStr)=nil then exit;
  if Dev.ClassInfoMenuList.Count >= 1 then
  begin
    idList := IntToStr(Dev.classinfomenuitems[0].id);
  end;
  for i:=1 to Dev.ClassInfoMenuList.Count -1 do
  begin

    idList := idList + ',' + IntToStr(Dev.classinfomenuitems[i].id);
  end;
  Bs.ModifyDev_AmbientInfoMenuList(Dev.fact_id, Dev.id, idList);
  Result:=true;
end;

end.
