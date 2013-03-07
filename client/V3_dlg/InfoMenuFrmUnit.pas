unit InfoMenuFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrmUnit, ComCtrls, StdCtrls, Buttons, ExtCtrls, cxGraphics,
  cxCustomData, cxStyles, cxTL, cxTextEdit, cxInplaceContainer, cxControls,
  InfoMenuUnit, CarUnit;

type
  TInfoMenuFrm = class(TBaseFrm)
    cxDevEventList: TcxTreeList;
    Info_Id: TcxTreeListColumn;
    Info_No: TcxTreeListColumn;
    Info_info: TcxTreeListColumn;
    Infoid: TcxTreeListColumn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListView1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    Dev:TDevice;
  public
    procedure ReLoadEventList(Dev:TDevice);
    function MenuNumSaveToDB(Dev:TDevice):boolean;
  end;

var
  InfoMenuFrm: TInfoMenuFrm;

implementation
uses uGloabVar,uFrmSelectDevs;
{$R *.dfm}

procedure TInfoMenuFrm.ReLoadEventList(Dev:TDevice);
var
  i: integer;
  pInfo: PInfoMenu;
begin
  cxDevEventList.BeginUpdate;
  cxDevEventList.Clear;
  for i:= 0 to Dev.InfoMenuList.Count-1 do
  begin
    with cxDevEventList.Add do
    begin
      pInfo := Dev.InfoMenuItems[i];
      data:= pInfo;
      Values[0] := i+1;//序号
      Values[1] := pInfo^.No;
      Values[2] := pInfo^.Info;
      Values[3] := pInfo^.id;
    end;
  end;
  cxDevEventList.EndUpdate;
end;

procedure TInfoMenuFrm.BitBtn4Click(Sender: TObject);
var
  dlg : TInfoMenu;
  pInfo: PInfoMenu;
  i:integer;
  addInfoMenuId: Integer;
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
      addInfoMenuId := Bs.AddNewInfoDemandMenu(StrToInt(Trim(dlg.EditMenuNO.Text)),Trim(dlg.memInfo.Text));
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
      pInfo := Dev.AddInfoMenu(addInfoMenuId);
      pInfo^.No := StrToInt(Trim(dlg.EditMenuNO.Text));
      pInfo^.info := dlg.memInfo.Text;
      ReLoadEventList(Dev);
    end;
  finally
    dlg.Free;
  end;
end;

procedure TInfoMenuFrm.FormCreate(Sender: TObject);
begin
  inherited;
  Dev:=TDevice.Create;
end;

procedure TInfoMenuFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Dev.Free;
  inherited;
end;

procedure TInfoMenuFrm.ListView1Click(Sender: TObject);
var
  D:TDevice;
  J:integer;
  InfoMenu:PInfoMenu;
begin
    if ListView1.Selected =nil then exit;
    D:=TDevice(ListView1.Selected.Data);
    Dev.ClrInfoMenuList;
    for j:=0 to D.InfoMenuList.Count-1 do
    begin
      InfoMenu:= Dev.AddInfoMenu(D.InfoMenuItems[J].id);;
      //EventInfo^.id:=D.EventItems[j].id;
      InfoMenu^.No := D.InfoMenuItems[j].No;
      InfoMenu^.Info:=D.InfoMenuItems[j].info;
    end;
    ReLoadEventList(Dev);
end;

procedure TInfoMenuFrm.BitBtn5Click(Sender: TObject);
var
  dlg: TInfoMenu;
  pInfo: PInfoMenu;
  i : Integer;
begin
  if cxDevEventList.SelectionCount =0 then exit;
  pInfo := PInfoMenu(cxDevEventList.Selections[0].Data);
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
      pInfo := Dev.FindInfoMenu(StrToInt(dlg.editMenuId.Text));
      pInfo^.No := StrToInt(dlg.EditMenuNO.Text);
      pInfo^.Info := dlg.memInfo.Text;
      Bs.ModifyAInfoDemandMenu(pInfo);
      ReLoadEventList(Dev);
    end;
  finally
    dlg.free;
  end;
end;

procedure TInfoMenuFrm.BitBtn6Click(Sender: TObject);
var
  pInfo: PInfoMenu;
begin
  if cxDevEventList.SelectionCount =0 then
  begin
    MessageBox(handle,'请您选择要删除的菜单信息','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  pInfo := PInfoMenu(cxDevEventList.Selections[0].Data);
  if MessageBox(handle,pchar('您确定要删除菜单【 '+pInfo^.Info+' 】信息?'),
    '提示',MB_YESNO + MB_ICONQUESTION)=Id_No then
    exit;
  Bs.DeleteAInfoDemandMenu(pInfo^.Id);
  Dev.DelInfoMenu(pInfo^.Id);
  ReLoadEventList(Dev);
end;

procedure TInfoMenuFrm.BitBtn1Click(Sender: TObject);
var
  i,j:integer;
  D:TDevice;
  pInfo:PInfoMenu;
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
      D.ClrInfoMenuList;
      ProgressBar1.StepIt;
      for j:=0 to Dev.InfoMenuList.Count-1 do //当=0时,,是删除事件列表里的内容.
      begin
        pInfo:= D.AddInfoMenu(Dev.InfomenuItems[j].id);
        pInfo^.No := Dev.InfomenuItems[j].No;
        pInfo^.Info:=Dev.InfomenuItems[j].Info;
      end;

      ProgressBar1.StepIt;
      DataServer.SetInfoMenu_V3(D); // 发送数据
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

function TInfoMenuFrm.MenuNumSaveToDB(Dev:TDevice):boolean;
var
 i:integer;
 idList: string;
begin
  idList := '';
  Result:=false;
  if ADeviceManage.Find(Dev.IdStr)=nil then exit;
  if Dev.InfoMenuList.Count >= 1 then
  begin
    idList := IntToStr(Dev.infomenuitems[0].id);
  end;
  for i:=1 to Dev.InfoMenuList.Count -1 do
  begin

    idList := idList + ',' + IntToStr(Dev.infomenuitems[i].id);
  end;
  Bs.ModifyDev_InfoDemandMenuList(Dev.fact_id, Dev.id, idList);
  Result:=true;
end;

end.
