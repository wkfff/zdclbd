{ 用一个线程
 刷新界面上的车辆列表，命令列表，当前车的接头

 实验证明：用线程刷新界面控件的效果很不好，会闪。虽然降低优先级、加了sleep
 @created(2004-12-02)
 @lastmod(GMT:$Date: 2012/10/29 01:46:42 $) <BR>
 最后更新人:$Author: wfp $<BR>
 当前版本:$Revision: 1.1.1.1 $<BR>}
unit RefreshInfoUnit;

interface
  uses  Classes, syncobjs, Windows;
type
  TRefreshInfo = class(TThread)
  private
    procedure Refresh_ServerStat;
  protected
    procedure Execute; override;
  public
    constructor Create; 
    destructor Destroy; override;
  published

  end;
  
implementation
 uses umainf,uGloabVar,uWatch_car;

{ TRefreshInfo }

constructor TRefreshInfo.Create;
begin
  inherited Create(false);
  Priority := tpLower; 
end;

destructor TRefreshInfo.Destroy;
begin                             
  inherited;
end;

procedure TRefreshInfo.Execute;
begin
  while true do
  begin
    if Terminated then Break;
    Refresh_ServerStat;//
    if mainf.PageControlBottom.ActivePage.Caption ='车辆列表' then
       mainf.FDlg_Watch_Car.Refresh_WatchCar
    else if mainf.PageControlBottom.ActivePage.Caption ='发送命令' then
       mainf.FDlg_Sended_Cmd.Refresh_SendedCmd ;

    if GCurSelectDev<> nil then mainf.ShowDeviceSwitch(GCurSelectDev);
    sleep(500);  //不加sleep，闪得快，加了500还是闪，加了1000还是闪
  end;
end;

procedure TRefreshInfo.Refresh_ServerStat;
begin
  if Bs<>nil then
    if Bs.Active =true then
      mainf.StatusBar1.Panels.Items[3].ImageIndex :=3
    else
      mainf.StatusBar1.Panels.Items[3].ImageIndex := 4;
  if DataServer<> nil then
    if DataServer.Active =true then
      mainf.StatusBar1.Panels.Items[4].ImageIndex :=3
    else
      mainf.StatusBar1.Panels.Items[4].ImageIndex :=4;
end;


end.
