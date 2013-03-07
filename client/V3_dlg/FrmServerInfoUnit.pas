unit FrmServerInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxInplaceContainer, cxControls, CmdStructUnit;

type
  TfrmSrvRunInfo = class(TForm)
    cxTreeList1: TcxTreeList;
    cxTreeList1cxTreeListColumn1: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn2: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn3: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn4: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn5: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn6: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn7: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn8: TcxTreeListColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    IsInit: Boolean;
    IsConnected: Boolean;//是否通知过连接上
    IsDisconnected: Boolean;//是否通知过断开
    procedure initSrvRunStatus();
  public
    { Public declarations }
    procedure RefreshSrvRunInfo(srvRunInfo: RecSrvRunInfo);
    procedure setAllSrvDisconnect();
  end;

implementation
uses
  uGloabVar, umainf, MMSystem;

{$R *.dfm}

procedure TfrmSrvRunInfo.RefreshSrvRunInfo(srvRunInfo: RecSrvRunInfo);
var
  node: TcxTreeListNode;
begin
  if GetSrvName(srvRunInfo.SrvType) = '' then
    Exit;
  node := FindNodeByTextIncxTreeList(IntToStr(srvRunInfo.SrvType), cxTreeList1, 0);
  if node = nil then
  begin
    node := cxTreeList1.Add;
    if srvRunInfo.SrvRunStatus = 0 then
      PopMsg('服务器连接', GetSrvName(srvRunInfo.SrvType) + #13#10 + '连接正常');
  end
  else
  begin
    if (srvRunInfo.SrvRunStatus = 0) and (node.Values[3] <> GetSrvRunStatus(0)) and IsDisconnected then
    begin
      PopMsg('服务器连接', node.Values[1] + #13#10 + '重新连接正常');
    end;  
  end;
  cxTreeList1.BeginUpdate;
  try
    with node do
    begin
      Values[0] := srvRunInfo.SrvType;
      Values[1] := GetSrvName(srvRunInfo.SrvType);
      Values[2] := GetRunTimeStr(srvRunInfo.SrvRunTime);
      Values[3] := GetSrvRunStatus(srvRunInfo.SrvRunStatus);
      Values[4] := srvRunInfo.SrvCPUPercent;
      Values[5] := srvRunInfo.SrvTotalMem;
      Values[6] := srvRunInfo.SrvMemInUse;
      Values[7] := srvRunInfo.SrvMemPercent;

      if srvRunInfo.SrvRunStatus = 0 then
        node.StateIndex := 22
      else
        node.StateIndex := 21;
    end;
  finally
    cxTreeList1.EndUpdate;
  end;

  if (srvRunInfo.SrvRunStatus > 0) then
  begin
    if IsInit then Exit;
    PopMsg('服务器连接断开', node.Values[1] + #13#10 + node.Values[3]);
    if GlobalParam.AlarmSound_ServerDisConnect <> '' then
    begin
      PlaySound(pchar(GlobalParam.AlarmSound_ServerDisConnect),Hinstance,SND_ASYNC);
    end;
    IsDisconnected := True;
  end
  else
    IsConnected := True;  
end;

procedure TfrmSrvRunInfo.initSrvRunStatus;
var
  srvRunInfo: RecSrvRunInfo;
begin
  srvRunInfo.SrvType := $00;
  srvRunInfo.SrvRunTime := 0;
  srvRunInfo.SrvRunStatus := 2;
  srvRunInfo.SrvCPUPercent := 0;
  srvRunInfo.SrvTotalMem := 0;
  srvRunInfo.SrvMemInUse := 0;
  srvRunInfo.SrvMemPercent := 0;
  RefreshSrvRunInfo(srvRunInfo);
  srvRunInfo.SrvType := $01;
  RefreshSrvRunInfo(srvRunInfo);
  srvRunInfo.SrvType := $07;
  RefreshSrvRunInfo(srvRunInfo);
  srvRunInfo.SrvType := $0A;
  RefreshSrvRunInfo(srvRunInfo);  
  srvRunInfo.SrvType := $09;
  RefreshSrvRunInfo(srvRunInfo);
  srvRunInfo.SrvType := $0B;
  RefreshSrvRunInfo(srvRunInfo);
  srvRunInfo.SrvType := $0D;
  RefreshSrvRunInfo(srvRunInfo);
end;

procedure TfrmSrvRunInfo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Mainf.show_SrvRunInfo.Checked := False;
end;

procedure TfrmSrvRunInfo.FormCreate(Sender: TObject);
begin
  IsInit := True;
  initSrvRunStatus();
  IsInit := False;
  IsDisconnected := False;
  IsConnected := False;
end;

procedure TfrmSrvRunInfo.setAllSrvDisconnect;
var
  i: Integer;
  node: TcxTreeListNode;
begin
  for i := 0 to cxTreeList1.Count - 1 do
  begin
    node := cxTreeList1.Items[i];
    node.Values[3] := '连接断开';
    node.StateIndex := 21;
  end;

  if not IsConnected then Exit;
  PopMsg('服务器断开提示', '所有平台服务器' + #13#10 + '连接断开');
  if GlobalParam.AlarmSound_ServerDisConnect <> '' then
  begin
    PlaySound(pchar(GlobalParam.AlarmSound_ServerDisConnect),Hinstance,SND_ASYNC);
  end;
end;

end.
