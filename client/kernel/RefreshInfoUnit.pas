{ ��һ���߳�
 ˢ�½����ϵĳ����б������б���ǰ���Ľ�ͷ

 ʵ��֤�������߳�ˢ�½���ؼ���Ч���ܲ��ã���������Ȼ�������ȼ�������sleep
 @created(2004-12-02)
 @lastmod(GMT:$Date: 2012/10/29 01:46:42 $) <BR>
 ��������:$Author: wfp $<BR>
 ��ǰ�汾:$Revision: 1.1.1.1 $<BR>}
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
    if mainf.PageControlBottom.ActivePage.Caption ='�����б�' then
       mainf.FDlg_Watch_Car.Refresh_WatchCar
    else if mainf.PageControlBottom.ActivePage.Caption ='��������' then
       mainf.FDlg_Sended_Cmd.Refresh_SendedCmd ;

    if GCurSelectDev<> nil then mainf.ShowDeviceSwitch(GCurSelectDev);
    sleep(500);  //����sleep�����ÿ죬����500������������1000������
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
