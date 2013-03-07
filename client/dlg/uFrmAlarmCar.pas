{���������б�
 ���û��鿴��˾������������Ϣʱ����������Ķ�ʱ�� ��ʱˢ�¡�Խ�缰ʻ�뱨������ʱˢ��
��˾����������
  Խ�����򱨾�  ����� For_ConfineArea���ſɼ�
  ʻ�����򱨾���Ҳ��ӡ�For_ConfineArea���ſɼ���add 2005.07.26

��@author()
  @created()
  @lastmod(GMT:$Date: 2012/10/29 01:46:42 $) <BR>
  ��������:$Author: wfp $  <BR>
  ��ǰ�汾:$Revision: 1.1.1.1 $  <BR>}
  
unit uFrmAlarmCar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, cxGraphics, cxCustomData,
  cxStyles, cxTL, cxTextEdit,
  cxInplaceContainer,
  cxControls,
  cxCalendar,
  Buttons,
  cxCheckBox,
  StdCtrls,
  ToolWin,
  ImgList,
  carunit,
  ActnList,
  UGloabVar,
  Menus,
  ConfineAreaUnit,
  ConstDefineUnit, DateUtils;

type
  TFrmAlarmCar = class(TForm)
    PopupMenu_DelStopAlarmList: TPopupMenu;
    ActionList1: TActionList;
    Del_StopAlarmDevs: TAction;
    PopupMenu_DelOutCAreaList: TPopupMenu;
    Del_OutCAreaDevs: TAction;
    N1: TMenuItem;
    Del_InCAreaDevs: TAction;
    PopupMenu_DelInCAreaList: TPopupMenu;
    N3: TMenuItem;
    NotShowOutPop: TAction;
    N4: TMenuItem;
    NotShowAllOutPop: TAction;
    N2: TMenuItem;
    PopupMenu1: TPopupMenu;
    N5: TMenuItem;
    PopupMenu2: TPopupMenu;
    N6: TMenuItem;
    PageControl1: TPageControl;
    TabSheet_AlarmList: TTabSheet;
    Splitter_Alarm: TSplitter;
    cxAlarmList: TcxTreeList;
    alarm_ID: TcxTreeListColumn;
    alarm_carNo: TcxTreeListColumn;
    alarm_startTime: TcxTreeListColumn;
    alarm_stop: TcxTreeListColumn;
    alarm_count: TcxTreeListColumn;
    alarm_long: TcxTreeListColumn;
    alarm_lat: TcxTreeListColumn;
    cxStopAlarmList: TcxTreeList;
    cxTreeListColumn1: TcxTreeListColumn;
    cxTreeListColumn2: TcxTreeListColumn;
    cxTreeListColumn3: TcxTreeListColumn;
    cxTreeListColumn4: TcxTreeListColumn;
    stopAlarm_count: TcxTreeListColumn;
    cxTreeListColumn5: TcxTreeListColumn;
    cxTreeListColumn6: TcxTreeListColumn;
    TabSheet2: TTabSheet;
    cxOtherKindsAlarmList: TcxTreeList;
    cxTreeListColumnOtherList_DevId: TcxTreeListColumn;
    cxTreeListColumnOtherList_CarNo: TcxTreeListColumn;
    cxTreeListColumnOtherList_AlarmType: TcxTreeListColumn;
    cxTreeListColumnOtherList_GpsTime: TcxTreeListColumn;
    cxTreeListColumnOtherList_longitude: TcxTreeListColumn;
    cxTreeListColumnOtherList_latitude: TcxTreeListColumn;
    cxTreeListColumnOtherList_Speed: TcxTreeListColumn;
    cxTreeListColumnOtherList_Time: TcxTreeListColumn;
    TabSheet_OutCAreaList: TTabSheet;
    Splitter1: TSplitter;
    cxOutCAreaList: TcxTreeList;
    Outdev_Id: TcxTreeListColumn;
    Outdev_carNo: TcxTreeListColumn;
    Outdev_StartTime: TcxTreeListColumn;
    Outdev_endTime: TcxTreeListColumn;
    Outdev_ConfineAreaID: TcxTreeListColumn;
    cxOutCAreaListcxTreeListColumn1: TcxTreeListColumn;
    cxOutCAreaList_History: TcxTreeList;
    cxTreeListColumn7: TcxTreeListColumn;
    cxTreeListColumn8: TcxTreeListColumn;
    cxTreeListColumn9: TcxTreeListColumn;
    cxTreeListColumn10: TcxTreeListColumn;
    cxTreeListColumn14: TcxTreeListColumn;
    cxTreeListColumn15: TcxTreeListColumn;
    TabSheet_InCAreaList: TTabSheet;
    Splitter2: TSplitter;
    cxInCAreaList: TcxTreeList;
    InArea_Id: TcxTreeListColumn;
    InArea_CarNo: TcxTreeListColumn;
    InArea_StartTime: TcxTreeListColumn;
    InArea_EndTime: TcxTreeListColumn;
    InArea_ConfineAreaID: TcxTreeListColumn;
    cxInCAreaList_History: TcxTreeList;
    cxTreeListColumn24: TcxTreeListColumn;
    cxTreeListColumn25: TcxTreeListColumn;
    cxTreeListColumn26: TcxTreeListColumn;
    cxTreeListColumn27: TcxTreeListColumn;
    cxTreeListColumn28: TcxTreeListColumn;
    cxTreeListColumn29: TcxTreeListColumn;
    TabSheet1: TTabSheet;
    Splitter3: TSplitter;
    OutTownList: TcxTreeList;
    dev_id: TcxTreeListColumn;
    car_no: TcxTreeListColumn;
    OutToTownTime: TcxTreeListColumn;
    GoToTownTime: TcxTreeListColumn;
    long: TcxTreeListColumn;
    lat: TcxTreeListColumn;
    speed: TcxTreeListColumn;
    receiveTime: TcxTreeListColumn;
    OutTownListcxTreeListColumn1: TcxTreeListColumn;
    HistoryDevList: TcxTreeList;
    cxTreeListColumn11: TcxTreeListColumn;
    cxTreeListColumn12: TcxTreeListColumn;
    cxTreeListColumn13: TcxTreeListColumn;
    cxTreeListColumn16: TcxTreeListColumn;
    cxTreeListColumn17: TcxTreeListColumn;
    cxTreeListColumn18: TcxTreeListColumn;
    HistoryDevListcxTreeListColumn1: TcxTreeListColumn;
    HistoryDevListcxTreeListColumn2: TcxTreeListColumn;
    TabSheet3: TTabSheet;
    Splitter4: TSplitter;
    AssembleWarringList: TcxTreeList;
    cxTreeListColumn23: TcxTreeListColumn;
    cxTreeListColumn19: TcxTreeListColumn;
    cxTreeListColumn20: TcxTreeListColumn;
    cxTreeListColumn21: TcxTreeListColumn;
    cxTreeListColumn22: TcxTreeListColumn;
    cxTreeList2: TcxTreeList;
    cxTreeListColumn34: TcxTreeListColumn;
    cxTreeListColumn35: TcxTreeListColumn;
    cxTreeListColumn41: TcxTreeListColumn;
    cxTreeListColumn38: TcxTreeListColumn;
    cxTreeListColumn39: TcxTreeListColumn;
    cxTreeListColumn40: TcxTreeListColumn;
    N7: TMenuItem;
    cxTreeList2cxTreeListColumn1: TcxTreeListColumn;
    cxTreeList2cxTreeListColumn2: TcxTreeListColumn;
    PopupMenu3: TPopupMenu;
    N8: TMenuItem;
    TabSheet4: TTabSheet;
    SuspectedPetitionsWarringList: TcxTreeList;
    cxTreeListColumn30: TcxTreeListColumn;
    cxTreeListColumn31: TcxTreeListColumn;
    cxTreeListColumn32: TcxTreeListColumn;
    Splitter5: TSplitter;
    cxTreeList3: TcxTreeList;
    cxTreeListColumn37: TcxTreeListColumn;
    cxTreeListColumn42: TcxTreeListColumn;
    cxTreeListColumn43: TcxTreeListColumn;
    cxTreeListColumn44: TcxTreeListColumn;
    cxTreeListColumn45: TcxTreeListColumn;
    cxTreeListColumn46: TcxTreeListColumn;
    cxTreeListColumn47: TcxTreeListColumn;
    cxTreeListColumn48: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn1: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn2: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn3: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn4: TcxTreeListColumn;
    cxTreeList3cxTreeListColumn1: TcxTreeListColumn;
    cxTreeList2cxTreeListColumn3: TcxTreeListColumn;
    TabSheet5: TTabSheet;
    cxAreaAlarmList: TcxTreeList;
    areaAlarm_Type: TcxTreeListColumn;
    areaAlarm_CarNo: TcxTreeListColumn;
    areaAlarm_Time: TcxTreeListColumn;
    areaAlarm_areaName: TcxTreeListColumn;
    PopupMenu_AreaAlarmUpload: TPopupMenu;
    N9: TMenuItem;
    areaAlarm_Memo: TcxTreeListColumn;
    TabSheet6: TTabSheet;
    cxTreeList1: TcxTreeList;
    cxTreeListColumn49: TcxTreeListColumn;
    cxTreeListColumn50: TcxTreeListColumn;
    cxTreeListColumn51: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn5: TcxTreeListColumn;
    TabSheet7: TTabSheet;
    cxTreeList4: TcxTreeList;
    cxTreeListColumn36: TcxTreeListColumn;
    cxTreeListColumn52: TcxTreeListColumn;
    cxTreeListColumn53: TcxTreeListColumn;
    cxTreeList4cxTreeListColumn1: TcxTreeListColumn;
    cxTreeList4cxTreeListColumn2: TcxTreeListColumn;
    cxTreeList4cxTreeListColumn3: TcxTreeListColumn;
    cxTreeList4cxTreeListColumn4: TcxTreeListColumn;
    PopupMenu_AccoffMoveAlarm: TPopupMenu;
    menuDealAlarm: TMenuItem;
    MenuItem1: TMenuItem;
    menuDelNotConfirmedAlarm: TMenuItem;
    menuDelAllNotConfirmedAlarm: TMenuItem;
    MenuItem2: TMenuItem;
    menuDelDealedAlarm: TMenuItem;
    menuDelAllDealedAlarm: TMenuItem;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    procedure FormShow(Sender: TObject);
    procedure cxAlarmListFocusedNodeChanged(Sender: TObject;
      APrevFocusedNode, AFocusedNode: TcxTreeListNode);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxOutCAreaListClick(Sender: TObject);
    procedure cxAlarmListClick(Sender: TObject);
    procedure Del_StopAlarmDevsExecute(Sender: TObject);
    procedure Del_OutCAreaDevsExecute(Sender: TObject);
    procedure Del_InCAreaDevsExecute(Sender: TObject);
    procedure cxInCAreaListFocusedNodeChanged(Sender: TObject;
      APrevFocusedNode, AFocusedNode: TcxTreeListNode);
    procedure cxInCAreaListClick(Sender: TObject);
    procedure cxAlarmListDblClick(Sender: TObject);
    procedure cxOverSpeetDblClick(Sender: TObject);
    procedure NotShowOutPopExecute(Sender: TObject);
    procedure cxOutCAreaListEditValueChanged(Sender: TObject;
      AColumn: TcxTreeListColumn);
    procedure NotShowAllOutPopExecute(Sender: TObject);
    procedure OutTownListCustomDrawCell(Sender: TObject;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
      var ADone: Boolean);
    procedure N5Click(Sender: TObject);
    procedure OutTownListEditValueChanged(Sender: TObject;
      AColumn: TcxTreeListColumn);
    procedure N6Click(Sender: TObject);
    procedure AssembleWarringListClick(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure SuspectedPetitionsWarringListClick(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure menuDealAlarmClick(Sender: TObject);
    procedure menuDelNotConfirmedAlarmClick(Sender: TObject);
    procedure menuDelAllNotConfirmedAlarmClick(Sender: TObject);
    procedure menuDelDealedAlarmClick(Sender: TObject);
    procedure menuDelAllDealedAlarmClick(Sender: TObject);
    procedure cxTreeList4CustomDrawCell(Sender: TObject;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
      var ADone: Boolean);

  private
    { Private declarations }
    procedure FillData_OutCAreaDev(Adev: TDevice; ANode: TcxTreeListNode;AArea:TConfineArea);
    procedure FillData_InCAreaDev(Adev: TDevice;ANode:TcxTreeListNode;AArea:TConfineArea);

    procedure DoProcessOverSpeed(Dev: TDevice);
    procedure DoProcessDevCutPower(Dev: TDevice);
    procedure DoProcessDevFortify(Dev: TDevice);
    procedure DoProcessDevLowPower(Dev: TDevice);
    procedure DoProcessDriverFatigue(Dev: TDevice);
    procedure DoProcessInDevArea(Dev: TDevice);
    procedure DoProcessOutDevArea(Dev: TDevice);
    procedure DoProcessOutLine(Dev: TDevice);
  public
    procedure Add2DevList(const ADev: Tdevice; TreeList: TcxTreeList);
    procedure FillData(ADev: TDevice; ANode: TcxTreeListNode);
    procedure DoOnDevOtherAlarmEvent(Dev:TDevice;AlarmType:Byte); //������������� ���౨��
    procedure DevAlarm_OutorInConfineArea(ADev: Tdevice; AlarmType: Byte; AddorDel: boolean; AArea: TConfineArea);  // �������򱨾�
    //�������б��� ԭ�е�Խ���ʻ�뱨����Ϣ��������ʷ,�����б���ԭ��ɾ��
    //MoveCause:
    //����1��������Խ�絽��Խ�磬���ʻ�뵽ʻ����
    //����2���û��ڵ���Χ���б���ɾ��ĳ�����ĳ�����޶��ĳ���

    procedure RemoveOutorInCAData2History(ADev: TDevice; AlarmType: byte; const MoveCause: string);

    procedure DoOnCarIOAreaAlarm(dev: TDevice; alarmType: Integer; alarmTime: TDateTime; memo: string);
    procedure DoOnCarAccOffMoveAlarm(dev: TDevice; alarmTime: TDateTime; memo: string);

    { Public declarations }
    //ˢ�µ�ǰҳ
    procedure Refresh_AlarmCar;
//    procedure Refresh_OutCAreaList;
//    procedure Refresh_InCAreaList;
    //���뵽Խ���ʻ�뱨���б���
    procedure AddData_OutCAreaDev(Adev: TDevice;AArea:TConfineArea);
    procedure AddData_InCAreaDev(Adev: TDevice;AArea:TConfineArea);
    // ������̨
    procedure AddData_OutToTown(Adev: TDevice; AArea: TConfineArea);
    // �ۼ�����
    procedure AddData_AssembleWarring(Adev: TDevice; AArea: TConfineArea; BDel: Boolean);
    // �����Ϸñ���
    procedure AddData_SuspectedPetitionsWarring(ADev: TDevice; AArea: TConfineArea; BDel: Boolean);
    // ���ǳ�ʱ����
    procedure Dev_OutToTown_Error(Adev: TDevice; AArea: TConfineArea);

    //��Խ���ʻ�뱨���б��� ԭ�е�������ʷ,�����б���ԭ��ɾ����
    //MoveCause:
    //����1��������Խ�絽��Խ�磬���ʻ�뵽ʻ����
    //����2���û��ڵ���Χ���б���ɾ��ĳ�����ĳ�����޶��ĳ���
    //    3���û���ˢ����Ϣ�󣬳�����Ϣ�ѱ���ϵͳ�����ɾ������ʱ�û���û�в鿴�ó���Ȩ��
    procedure MoveData2OutCAreaHistoryList(ADev:TDevice;ANode: TcxTreeListNode;const MoveCause:string);
    procedure MoveData2InCAreaHistoryList(ADev:TDevice;ANode:TcxTreeListNode;const MoveCause:string);
    //�û�ˢ������ʱ�������ϵͳ������г�����ɾ���ˣ���ʱӦ���ó���Խ�缰ʻ�뱨���б���ɾ����
    procedure UserRefresh_IfDevDeleted_CheckCAList;
    function  stop_Alarm:boolean;

    procedure DoOnDevAreaAlarm(dev: TDevice; area: TBaseArea; alarmType: Byte);
    procedure DoOnCarOverSpeedAlarm(dev: TDevice; areaType: Byte; alarmAreaId: Integer);
    procedure DoOnCarInOutAreaAlarm(dev: TDevice; areaType: Byte; alarmAreaId: Integer; flag: Byte);
    procedure DoOnCarRunTimeAlarm(dev: TDevice; alarmLineSectionId: Integer; runTime: Integer; flag: Byte);
  end;                       


implementation
  uses umainf,GPsLibUnit,BleepInt,MMSystem,SystemLog, MetaDefine, FrmDealAlarmInfoUnit;
{$R *.dfm}

procedure TFrmAlarmCar.Refresh_AlarmCar;
var
  i:integer;
  dev: TDevice;
  find_ListItem : TcxTreeListNode;
begin
  try
    if ADeviceManage.Count =0 then exit;
    if PageControl1.ActivePage = TabSheet_AlarmList then    //˾��������������
    begin
      cxAlarmList.BeginUpdate;
      for i:=0 to ADeviceManage.Count-1 do
      begin
        dev := ADeviceManage.Items[i];
        find_ListItem:= FindNodeByTextIncxTreeList(dev.IdStr,cxAlarmList,0);

        if not dev.Alarm then
        begin
          if find_ListItem <> nil then
          begin
            find_ListItem.Delete;
            Continue;
          end
          else
            Continue;
        end;
        //find_ListItem:=cxAlarmList.FindNodeByText(inttostr(dev.Id),cxAlarmList.Columns[0],nil,false,true);

        If find_ListItem = nil then
        begin
          with cxAlarmList.Add do
          begin
            Data := dev;
            Values[0]:= dev.IdStr;
            Values[1]:= dev.Car.No;
            Values[2]:= dev.Alarm_startTime ;
            if dev.Alarm_endTime =0 then
              Values[3] := ''
            else
              Values[3]:= FormatDateTime('yyyy-mm-dd hh:nn:ss',dev.Alarm_endTime) ;
            Values[4]:= dev.AlarmCount;
            Values[5]:= FormatFloat('##0.000000',dev.Longitude);
            Values[6]:= FormatFloat('##0.000000',dev.Latitude);

            ImageIndex := dev.Car.ResIndex;
            SelectedIndex := dev.Car.ResIndex ;
          end;
        end
        else
        begin
          with find_ListItem do
          begin
            Data := dev;
            Values[4]:= dev.AlarmCount;
            Values[5]:= FormatFloat('##0.000000',dev.Longitude);
            Values[6]:= FormatFloat('##0.000000',dev.Latitude);
          end;
        end;
        Application.ProcessMessages;
      end;
      cxAlarmList.EndUpdate;
    end
    else if PageControl1.ActivePage = TabSheet3 then     // �ۼ�����
    begin
      AddData_AssembleWarring(nil, nil, true);
    end
    else if PageControl1.ActivePage = TabSheet4 then     // �����Ϸñ���
    begin
      AddData_SuspectedPetitionsWarring(nil, nil, True);
    end;
    {else if PageControl1.ActivePage = TabSheet_OutCAreaList then    //Խ�糵��
    begin
      Refresh_OutCAreaList;
    end
    else if PageControl1.ActivePage = TabSheet_InCAreaList then    //ʻ�뱨������
    begin
      Refresh_InCAreaList;
    end;   }
  except  on E: Exception do
      uGloabVar.SystemLog.AddLog(' TFrmAlarmCar.Refresh_AlarmCar��������: ',e.Message);
  end;
end;

procedure TFrmAlarmCar.FormShow(Sender: TObject);
begin
  //PageControl1.ActivePage:= TabSheet_AlarmList;
  //PageControl1.ActivePage := TabSheet5;
  PageControl1.ActivePageIndex := 0;
  TabSheet_AlarmList.TabVisible := False;
  TabSheet2.TabVisible := False;
//  TabSheet_OutCAreaList.TabVisible := False;
//  TabSheet_InCAreaList.TabVisible := False;
  TabSheet1.TabVisible := False;
  TabSheet3.TabVisible := False;
  TabSheet4.TabVisible := False;
  TabSheet5.TabVisible := False;
end;

procedure TFrmAlarmCar.cxAlarmListClick(Sender: TObject);
var
  str: string;
begin
  if TcxTreelist(Sender).FocusedNode = nil  then exit;
  //������ˢ�º�cxAlarmList.FocusedNode.Data����ָ��������Ѳ������ڵĳ��������Բ���ȡ��ֵ
  //GCurSelectDev :=TDevice(cxAlarmList.FocusedNode.Data);
  str:= TcxTreelist(Sender).FocusedNode.Values[0];
  GCurSelectDev := ADeviceManage.find(str);
  if GCurSelectDev= nil then
  begin
    //messagebox(handle,'�˳������ѱ�ɾ������ǰ�û���Ȩ�鿴!','��ʾ',mb_ok + mb_iconinformation);
    exit;
  end;
  mainf.Edit2.Text := (GCurSelectDev.Id);
  mainf.Edit1.Text := GCurSelectDev.Car.No;
end;

procedure TFrmAlarmCar.cxAlarmListFocusedNodeChanged(Sender: TObject;
  APrevFocusedNode, AFocusedNode: TcxTreeListNode);
var
  str : string;
begin
  if cxAlarmList.FocusedNode = nil then exit;
  //������ˢ�º�cxAlarmList.FocusedNode.Data����ָ��������Ѳ������ڵĳ��������Բ���ȡ��ֵ
  //GCurSelectDev :=TDevice(cxAlarmList.FocusedNode.Data);
  str:= cxAlarmList.FocusedNode.Values[0];
  GCurSelectDev := ADeviceManage.Find(str);
  if GCurSelectDev= nil then
  begin
    messagebox(handle,'�˳������ѱ�ɾ������ǰ�û���Ȩ�鿴!','��ʾ',mb_ok + mb_iconinformation);
    exit;
  end;
  mainf.Edit2.Text := (GCurSelectDev.Id);
  mainf.Edit1.Text := GCurSelectDev.Car.No;
end;

procedure TFrmAlarmCar.FormCreate(Sender: TObject);
begin
  //PageControl1.ActivePage := TabSheet_AlarmList;
//  cxAlarmList.Images     := ResManage.BmpList;
//  cxStopAlarmList.Images := ResManage.BmpList;
//  cxOutCAreaList.Images  := ResManage.BmpList;
//  cxOutCAreaList_History.Images := ResManage.BmpList;
//  cxInCAreaList.Images   := ResManage.BmpList;
//  cxInCAreaList_History.Images := ResManage.BmpList;
//  cxOtherKindsAlarmList.Images := ResManage.BmpList;
  ADeviceManage.OnDevOtherAlarmEvent := DoOnDevOtherAlarmEvent;

  ADeviceManage.OnDevAlarm_OutorInCArea := DevAlarm_OutorInConfineArea;
  ADeviceManage.OnCarIOAreaOnTimeAlarmEvent := DoOnCarIOAreaAlarm;
  ADeviceManage.OnCarAccOffMoveAlarmEvent := DoOnCarAccOffMoveAlarm;
end;


procedure TFrmAlarmCar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Mainf.show_AlarmLists.Checked := false;
end;

procedure TFrmAlarmCar.cxOutCAreaListClick(Sender: TObject);
var
  str: string;
begin
  if cxOutCAreaList.FocusedNode = nil  then exit;
  //������ˢ�º�cxAlarmList.FocusedNode.Data����ָ��������Ѳ������ڵĳ��������Բ���ȡ��ֵ
  //GCurSelectDev :=TDevice(cxOutCAreaList.FocusedNode.Data);
  str := cxOutCAreaList.FocusedNode.Values[0];
  GCurSelectDev := ADeviceManage.Find(str);
  if GCurSelectDev=nil then GCurSelectDev:=ADevicemanage.FindDevFromCarNo(str);
  if GCurSelectDev<>nil then
  begin
    mainf.Edit2.Text := (GCurSelectDev.Id);
    mainf.Edit1.Text := GCurSelectDev.Car.No;
  end;
end;

procedure TFrmAlarmCar.Del_StopAlarmDevsExecute(Sender: TObject);
begin
  cxStopAlarmList.BeginUpdate;
  cxStopAlarmList.Clear;
  cxStopAlarmList.EndUpdate;
end;

procedure TFrmAlarmCar.Del_OutCAreaDevsExecute(Sender: TObject);
begin
  cxOutCAreaList_History.BeginUpdate;
  cxOutCAreaList_History.Clear;
  cxOutCAreaList_History.EndUpdate;
end;


procedure TFrmAlarmCar.AddData_OutCAreaDev(Adev: TDevice;AArea:TConfineArea);
var
  node : TcxTreeListNode;
  log:TSystemLog;
  group:TDevGroup;
  s:string;
//  AreaName:String;
begin
//  if Adev.OutCAreaId = -1 then exit;
  cxOutCAreaList.BeginUpdate;
  node := cxOutCAreaList.Add;
  FillData_OutCAreaDev(aDev,node,AArea);
  cxOutCAreaList.EndUpdate;
  group:=ADevGroupManage.find(ADev.GroupID);
  if group<>nil then
     s:=group.Name;

  Log:=TSystemLog.Create;
  try
    Log.LogFile:=ExePath+'Alarm\OutArea';
    Log.BufferSize:=0;
    Log.ExtendName:='csv';
    Log.BeginString:='ʱ��,���ƺ�,����,��������,�ٶ�,����,γ��';
    Log.AddLog(FormatDatetime('yyyy-mm-dd hh:nn:ss',now)+
               ','+ADev.Car.No+
               ','+s+
               ','+AArea.Name+
               ','+FormatFloat('##0.0', ADev.Speed/10)+ {IntToStr(ADev.Speed)+ //ls}
               ','+FormatFloat('##0.000000',ADev.Longitude)+
               ','+FormatFloat('##0.000000',ADev.Latitude));
  finally
    Log.Free;
  end;


end;

procedure TFrmAlarmCar.AddData_InCAreaDev(Adev: TDevice;AArea:TConfineArea);
var
  node : TcxTreeListNode;
  Log:TSystemLog;
  group:TDevGroup;
  s:string;
begin
  cxInCAreaList.BeginUpdate;
  node := cxInCAreaList.Add;
  FillData_InCAreaDev(ADev,node,AArea);
  cxInCAreaList.EndUpdate;
  group:=ADevGroupManage.find(ADev.GroupID);
  if group<>nil then
     s:=group.Name;
  Log:=TSystemLog.Create;
  try
    Log.LogFile:=ExePath+'Alarm\InArea';
    Log.BufferSize:=0;
    Log.ExtendName:='csv';
    Log.BeginString:='ʱ��,���ƺ�,����,��������,�ٶ�,����,γ��';
    Log.AddLog(FormatDatetime('yyyy-mm-dd hh:nn:ss',now)+
               ','+ADev.Car.No+
               ','+s+
               ','+AArea.Name+
               ','+FormatFloat('##0.0', ADev.Speed/10)+ {IntToStr(ADev.Speed)+ //LS}
               ','+FormatFloat('##0.000000',ADev.Longitude)+
               ','+FormatFloat('##0.000000',ADev.Latitude));
  finally
    Log.Free;
  end;
end;

procedure TFrmAlarmCar.FillData_OutCAreaDev(Adev: TDevice;
  ANode: TcxTreeListNode;AArea:TConfineArea);
begin
  with ANode do
  begin
    Data := Adev;
    Values[0]:= Adev.IdStr;
    Values[1]:= Adev.Car.No;
    Values[2]:= FormatDateTime('yyyy-mm-dd hh:nn:ss',Adev.AlarmStart_OutCArea);
    {if Adev.AlarmEnd_OutCArea =0 then
      Values[3] := ''
    else
      Values[3]:= FormatDateTime('yyyy-mm-dd hh:nn:ss',Adev.AlarmEnd_OutCArea) ;
    if Adev.OutCAreaId = -1 then
      Values[4]:= 'ԭ�����ѱ�ɾ������ԭ�����Ѳ��޶��ó�'
    else  }
      Values[4]:=AArea.Name;// IntToStr(Adev.OutCAreaId);
      Values[5]:=Adev.Alarm_OutCAreaIsShowPop;

    ImageIndex := Adev.Car.ResIndex;
    SelectedIndex := Adev.Car.ResIndex ;
  end;
end;

procedure TFrmAlarmCar.FillData_InCAreaDev(Adev: TDevice;
  ANode: TcxTreeListNode;AArea:TConfineArea);
begin
  with ANode do
  begin
    Data := Adev;
    Values[0]:= Adev.IdStr;
    Values[1]:= Adev.Car.No;
    Values[2]:= FormatDateTime('yyyy-mm-dd hh:nn:ss',Adev.AlarmStart_InCArea);
    {if Adev.AlarmEnd_InCArea =0 then
      Values[3] := ''
    else
      Values[3]:= FormatDateTime('yyyy-mm-dd hh:nn:ss',Adev.AlarmEnd_InCArea);
    if Adev.InCAreaId = -1 then
      Values[4]:= 'ԭ�����ѱ�ɾ������ԭ�����Ѳ��޶��ó�'
    else    }
      Values[4]:=AArea.Name;//IntToStr(Adev.InCAreaId);
    ImageIndex := Adev.Car.ResIndex;
    SelectedIndex := Adev.Car.ResIndex ;
  end;
end;

procedure TFrmAlarmCar.MoveData2OutCAreaHistoryList(ADev:TDevice;ANode: TcxTreeListNode;const MoveCause: string);
var
  Log:TSystemLog;
  group:TDevGroup;
  s:string;
begin
  if ANode = nil then exit;
  //cxOutCAreaList.BeginUpdate;

  if  cxOutCAreaList_History.Count>=100 then
  begin
    cxOutCAreaList_History.BeginUpdate;
    cxTreeListColumn10.SortOrder:=soDescending;
    while  cxOutCAreaList_History.Count>10 do
    begin
       cxOutCAreaList_History.Items[cxOutCAreaList_History.Count-1].Delete;
    end;
    cxOutCAreaList_History.EndUpdate;
  end;
  cxOutCAreaList_History.BeginUpdate;
  try
    with cxOutCAreaList_History.Add do
    begin
      Values[0]:= ANode.Values[0];
      values[1]:= ANode.Values[1];
      Values[2]:= ANode.Values[2];
      values[3]:= FormatDateTime('yyyy-mm-dd hh:nn:ss',now);//ANode.Values[3];
      Values[4]:= ANode.Values[4];
      Values[5]:= MoveCause;
    end;
    group:=ADevGroupManage.find(ADev.GroupID);
    if group<>nil then
       s:=group.Name;
    Log:=TSystemLog.Create;
    try
      Log.LogFile:=ExePath+'Alarm\OutAreaHistoryList';
      Log.BufferSize:=0;
      Log.ExtendName:='csv';

      Log.BeginString:='ʱ��,���ƺ�,����,��������,��ʼʱ��,����ʱ��,ԭ��';
      Log.AddLog(FormatDatetime('yyyy-mm-dd hh:nn:ss',now)+
                 ','+ADev.Car.No+
                 ','+s+
                 ','+ANode.Values[4]+
                 ','+ANode.Values[2]+
                 ','+FormatDateTime('yyyy-mm-dd hh:nn:ss',now)+
                 ','+MoveCause);

    finally
      Log.Free;
    end;
   ANode.Delete;
  finally
    cxOutCAreaList_History.EndUpdate;
  end;
end;

procedure TFrmAlarmCar.MoveData2InCAreaHistoryList(ADev:TDevice;ANode: TcxTreeListNode;const MoveCause:string);
var
  Log:TSystemLog;
  group:TDevGroup;
  s:string;
begin
  if ANode = nil then exit;
  
  if cxInCAreaList_History.Count>=100 then
  begin
     cxInCAreaList_History.BeginUpdate;
     while cxInCAreaList_History.Count>10 do
     begin
       cxInCAreaList_History.Items[cxInCAreaList_History.Count-1].Delete;
     end;
     cxInCAreaList_History.EndUpdate;
  end;
  
  cxInCAreaList_History.BeginUpdate;
  try
    with cxInCAreaList_History.Add do
    begin
      Values[0]:= ANode.Values[0];
      values[1]:= ANode.Values[1];
      Values[2]:= ANode.Values[2];
      values[3]:= FormatDateTime('yyyy-mm-dd hh:nn:ss',now);//ANode.Values[3];
      Values[4]:= ANode.Values[4];
      Values[5]:= MoveCause;
    end;


    group:=ADevGroupManage.find(ADev.GroupID);
    if group<>nil then
       s:=group.Name;
    Log:=TSystemLog.Create;
    try
      Log.LogFile:=ExePath+'Alarm\InCAreaHistoryList';
      Log.BufferSize:=0;
      Log.ExtendName:='csv';


      Log.BeginString:='ʱ��,���ƺ�,����,��������,��ʼʱ��,����ʱ��,ԭ��';
      Log.AddLog(FormatDatetime('yyyy-mm-dd hh:nn:ss',now)+
                 ','+ADev.Car.No+
                 ','+s+
                 ','+ANode.Values[4]+
                 ','+ANode.Values[2]+
                 ','+FormatDateTime('yyyy-mm-dd hh:nn:ss',now)+
                 ','+MoveCause);
{      Log.AddLog(FormatDatetime('yyyy-mm-dd hh:nn:ss',now)+
                 ',���ƺ�:,'+ANode.Values[1]+
                 //' ����ID:'+IntToStr(AArea.ID)+
                 ',��������:,'+ANode.Values[4]+
                 ',��ʼʱ��:,'+ANode.Values[2]+
                 ',����ʱ��:,'+FormatDateTime('yyyy-mm-dd hh:nn:ss',now)+
                 ',ԭ��:,'+MoveCause);}
    finally
      Log.Free;
    end;
    ANode.Delete;
  finally
    cxInCAreaList_History.EndUpdate;
  end;
end;

procedure TFrmAlarmCar.Del_InCAreaDevsExecute(Sender: TObject);
begin
  cxInCAreaList_History.BeginUpdate;
  cxInCAreaList_History.Clear;
  cxInCAreaList_History.EndUpdate;
end;


procedure TFrmAlarmCar.cxInCAreaListFocusedNodeChanged(Sender: TObject;
  APrevFocusedNode, AFocusedNode: TcxTreeListNode);
begin
 { if cxInCAreaList.FocusedNode = nil  then exit;
  //������ˢ�º�cxAlarmList.FocusedNode.Data����ָ��������Ѳ������ڵĳ��������Բ���ȡ��ֵ
  //GCurSelectDev :=TDevice(cxInCAreaList.FocusedNode.Data);
  GCurSelectDev := ADeviceManage.Find(cxInCAreaList.FocusedNode.Values[0]);
  if GCurSelectDev<>nil then
  begin
    mainf.Edit2.Text := (GCurSelectDev.Id);
    mainf.Edit1.Text := GCurSelectDev.Car.No;
  end;         }
end;

procedure TFrmAlarmCar.cxInCAreaListClick(Sender: TObject);
var
  str : string;
begin
  if cxInCAreaList.FocusedNode = nil  then exit;
  //������ˢ�º�cxAlarmList.FocusedNode.Data����ָ��������Ѳ������ڵĳ��������Բ���ȡ��ֵ
  //GCurSelectDev :=TDevice(cxInCAreaList.FocusedNode.Data);
  str := cxInCAreaList.FocusedNode.Values[0];
  GCurSelectDev := ADeviceManage.Find(str);
  if GCurSelectDev<>nil then
  begin
    mainf.Edit2.Text := (GCurSelectDev.Id);
    mainf.Edit1.Text := GCurSelectDev.Car.No;
  end;
end;

{procedure TFrmAlarmCar.Refresh_OutCAreaList;
var
  i: integer;
  dev :TDevice;
  str :string;
begin
  try
    i:= 0;                        
    cxOutCAreaList.BeginUpdate;
    while i < cxOutCAreaList.Count do
    begin
      str:= cxOutCAreaList.Items[i].Values[0];
      dev:= ADeviceManage.Find(str);
      if dev<> nil then
      begin
        FillData_OutCAreaDev(dev,cxOutCAreaList.Items[i]);
        i:= i+1;
      end;
    end;
    cxOutCAreaList.EndUpdate;
  except
    exit;
  end;
end;           }

{procedure TFrmAlarmCar.Refresh_InCAreaList;
var
  i: integer;
  dev : TDevice;
  str : string;
begin
  try
    i:= 0;
    cxInCAreaList.BeginUpdate;
    while i < cxInCAreaList.Count do
    begin
      str:=cxInCAreaList.Items[i].Values[0];
      dev:= ADeviceManage.Find(str);
      if dev<> nil then
      begin
        FillData_InCAreaDev(dev,cxInCAreaList.Items[i]);
        i:= i+1;
      end;
    end;
    cxInCAreaList.EndUpdate;
  except
    exit;
  end;        
end;        }

procedure TFrmAlarmCar.UserRefresh_IfDevDeleted_CheckCAList;
var
  i: integer;
  dev : Tdevice;
  str : string;
begin
  if cxOutCAreaList.Count <>0 then
  begin
    i:= 0;
    while i< cxOutCAreaList.count do
    begin
      str := cxOutCAreaList.Items[i].Values[0];
      dev:= ADeviceManage.Find(str);
      if dev = nil then
        MoveData2OutCAreaHistoryList(dev,cxOutCAreaList.Items[i],'�����ѱ�ɾ������ǰ�û���Ȩ�鿴')
      else
        i:= i+1;
    end;
  end;
  if cxInCAreaList.Count <> 0 then
  begin
    i:= 0;
    while i< cxInCAreaList.Count do
    begin
      str:=cxInCAreaList.Items[i].Values[0];
      dev:=ADeviceManage.Find(str);
      if dev= nil then
        MoveData2InCAreaHistoryList(dev,cxInCAreaList.Items[i],'�����ѱ�ɾ������ǰ�û���Ȩ�鿴')
      else
        i:= i+1;
    end;
  end;
end;


function TFrmAlarmCar.stop_Alarm:boolean;
var
  dev: TDevice;
begin
  Result:=false;
  If cxAlarmList.FocusedNode= nil then exit;
  dev:= TDevice(cxAlarmList.FocusedNode.Data);
  if dev= nil then exit;
  //�����������
  DataServer.RemoveAlarm_V3(dev.Id);
  dev.Alarm_endTime := now;              
//  Timer.Enabled :=False;
  cxAlarmList.FocusedNode.Delete;
  with cxStopAlarmList.Add do
  begin
    Data := dev;
    Values[0]:= dev.IdStr;
    Values[1]:= dev.Car.No;
    Values[2]:= dev.Alarm_startTime ;
    Values[3]:= FormatDateTime('yyyy-mm-dd hh:nn:ss',dev.Alarm_endTime);
    Values[4]:= dev.AlarmCount;
    Values[5]:= FormatFloat('##0.000000',dev.Longitude);
    Values[6]:= FormatFloat('##0.000000',dev.Latitude);
    ImageIndex := dev.Car.ResIndex;
    SelectedIndex := dev.Car.ResIndex ;
  end;
  dev.Alarm := false;
  dev.Switch[16]:= False;
  Result:=true;
  if (FMap.GpsDrawlayer.AutoFollowDevice <> nil) and (FMap.GpsDrawlayer.AutoFollowDevice.IdStr = dev.IdStr) then //ȡ���Ա��������ĸ���
  begin
    FMap.GpsDrawlayer.AutoFollowDevice := nil;
    FMap.DrawGpsMap_ClearDraw;//��GPSͼ�㲢�ػ���
  end;
  //�ָ���ԭ���ٳ����ġ�����
{  if GOldFollowDev <> nil then
  begin
    FMap.GpsDrawlayer.AutoFollowDevice := GOldFollowDev;
    StatusBar1.Panels.Items[2].Text :='��ǰ���ٳ�����'+GOldFollowDev.Car.No;
  end
  else
    fun_watch_car.Execute;   }
//  Timer.Enabled :=True;
end;

procedure TFrmAlarmCar.cxAlarmListDblClick(Sender: TObject);
var
  str:string;
begin
  {if TcxTreelist(Sender).FocusedNode = nil  then exit;
  str:= TcxTreelist(Sender).FocusedNode.Values[0];
  GCurSelectDev := ADeviceManage.Find(str);
  if GCurSelectDev<>nil then
  begin
    mainf.Edit2.Text := (GCurSelectDev.Id);
    mainf.Edit1.Text := GCurSelectDev.Car.No;
    umainf.Mainf.fun_Locate_Car.Execute;
  end;   }
end;

procedure TFrmAlarmCar.cxOverSpeetDblClick(Sender: TObject);
var
  str:string;
begin
  if TcxTreelist(Sender).FocusedNode = nil  then exit;
  str:= TcxTreelist(Sender).FocusedNode.Values[0];
  GCurSelectDev := ADeviceManage.FindDevFromCarNo(str);
  if GCurSelectDev<>nil then
  begin
    umainf.Mainf.Edit1.Text:=GCurSelectDev.Car.No;
    umainf.Mainf.fun_Locate_Car.Execute;
  end;
end;

procedure TFrmAlarmCar.NotShowOutPopExecute(Sender: TObject);
var
  dev:TDevice;
begin
   //
   if cxOutCAreaList.FocusedNode =nil then
   begin
       messagebox(handle,'��ѡ��һ����','��ʾ',mb_ok + mb_iconinformation);
       exit;
   end;
   dev:=TDevice(cxOutCAreaList.FocusedNode.Data);
   //if messagebox(handle,PChar('��ȷ������ʾ'+dev.Car.No+'ʻ����ʾ?'),'��ʾ',MB_OKCANCEL + MB_ICONQUESTION)= ID_OK then
   begin
       dev.Alarm_OutCAreaIsShowPop:=not dev.Alarm_OutCAreaIsShowPop;
       cxOutCAreaList.FocusedNode.Values[5]:=dev.Alarm_OutCAreaIsShowPop;
   end;

end;



procedure TFrmAlarmCar.cxOutCAreaListEditValueChanged(Sender: TObject;
  AColumn: TcxTreeListColumn);
var
  dev:TDevice;
begin
     if cxOutCAreaList.FocusedNode =nil then exit;
     dev:=TDevice(cxOutCAreaList.FocusedNode.Data);
       dev.Alarm_OutCAreaIsShowPop:=not cxOutCAreaList.FocusedNode.Values[5]
      //cxOutCAreaList.FocusedNode.Values[5]:=dev.Alarm_OutCAreaIsShowPop;


     //
end;

procedure TFrmAlarmCar.NotShowAllOutPopExecute(Sender: TObject);
var
  i:integer;
  dev:TDevice;
begin
  for i:=0 to cxOutCAreaList.Count-1 do
  begin
      cxOutCAreaList.Items[i].Values[5]:=false;
      dev:=TDevice(cxOutCAreaList.Items[i].Data);
      dev.Alarm_OutCAreaIsShowPop:=false;
  end;
end;

procedure TFrmAlarmCar.DoOnDevOtherAlarmEvent(Dev: TDevice;
  AlarmType: Byte);
var
  Log:TSystemLog;
begin
  if Dev = nil then exit;
  Log:=TSystemLog.Create;
  try
    Log.LogFile:=ExePath+'Alarm\'+ReturnDevAlarmType(AlarmType);
    Log.BufferSize:=0;
    Log.ExtendName:='csv';
    Log.BeginString:='ʱ��,���ƺ�,����,GPSʱ��,����,γ��,�ٶ�';
    Log.AddLog(FormatDatetime('yyyy-mm-dd hh:nn:ss',now)+','+
              Dev.Car.No+','+
              ReturnDevAlarmType(AlarmType)+','+
              FormatDateTime('yyyy-mm-dd hh:nn:ss',Dev.GpsTime)+','+
              FormatFloat('0.000000',Dev.Longitude)+ ','+
              FormatFloat('0.000000',Dev.Latitude)+','+
              FormatFloat('##0.0', Dev.Speed/10)); {FormatFloat('0.0',Dev.Speed)) //LS};
  finally
    Log.Free;
  end;
  //������100��ʱ��ֻ�����10��
  if cxOtherKindsAlarmList.Count>100 then
  begin
    cxOtherKindsAlarmList.BeginUpdate;
    cxTreeListColumnOtherList_Time.SortOrder:=soDescending;
    while cxOtherKindsAlarmList.Count>=10 do
      cxOtherKindsAlarmList.Items[cxOtherKindsAlarmList.Count-1].Delete;
    cxOtherKindsAlarmList.EndUpdate;
  end;

  cxOtherKindsAlarmList.BeginUpdate;
  with  cxOtherKindsAlarmList.Add do
  begin
    Data:=Pointer(Dev);
    Values[0] := Dev.IdStr;
    Values[1] := Dev.Car.No;
    values[2] := ReturnDevAlarmType(AlarmType);
    Values[3] := Dev.gpsTime;  //now;
    Values[4] := FormatFloat('##0.000000',Dev.Longitude);
    Values[5] := FormatFloat('##0.000000',Dev.Latitude);
    Values[6] := FormatFloat('##0.0', Dev.Speed/10); {Dev.Speed; //LS}
    Values[7] := FormatDateTime('yyyy-mm-dd hh:nn:ss',now);
    ImageIndex := dev.Car.ResIndex;
    SelectedIndex := dev.Car.ResIndex ;
  end;
  cxOtherKindsAlarmList.EndUpdate;

  case AlarmType of
    MSG_Warning_16 : DoProcessOverSpeed(Dev);     //���ٱ���;��17λ
    //GPSALARM_DEVCUTPOWER : DoProcessDevCutPower(Dev);    //�ϵ籨��(Dev);��18λ	1��
    MSG_Warning_17 : DoProcessDriverFatigue(Dev);//ƣ�ͼ�ʻ����(Dev);��19λ	1��
    MSG_Warning_18 : ;
    MSG_Warning_19 : ;
    //GPSALARM_INDEVAREA : DoProcessInDevArea(Dev);        //������(����)����(Dev);��20λ	1��
    //GPSALARM_OUTDEVAREA : DoProcessOutDevArea(Dev);      //������(����)����(Dev);��21λ	1��
    //GPSALARM_OUTLINE : DoProcessOutLine(Dev);            //ƫ��·�߱���(Dev);��22λ	1��
    //GPSALARM_FORTIFY : DoProcessDevFortify(Dev);         //�������(Dev);��23λ	1: Result :  �Ƿ���������
    //GPSALARM_DEVLOWPOWER : DoProcessDevLowPower(Dev);    //��ѹ����;��26λ	1��
  end;
end;


procedure TFrmAlarmCar.DoProcessOverSpeed(Dev: TDevice); //���ٱ�����ʾ
var
  s : string;
begin
  if GlobalParam.IsOverSpeedAlarm then
    PopMsg('����',dev.Car.No+#13+#10+'����!');
  if (DataServer.Active)and(GlobalParam.IsDriverOverSpeet) then
  begin
    s :=GlobalParam.OverSpeetHintStr;
    //DataServer.SendControlInfo(Dev.Id,Dev.IdStr,s,Length(s),-1,false);
    DataServer.SendControlInfo_Alarm_V3(-1, Dev,Trim(s),Length(Trim(s)),5);
  end;
  //s := ExpandFileName(GlobalParam.AlarmSound_OverSpeet);
  //if FileExists(s) then
    MediaPalySound(GlobalParam.AlarmSound_OverSpeet);
    //PlaySound(pchar(s),Hinstance,SND_FILENAME);
end;

procedure TFrmAlarmCar.DoProcessDevCutPower(Dev: TDevice);
begin
  if GlobalParam.isEletrShutDownAlarm then
    popmsg('�ϵ���ʾ', Dev.Car.No + #13 + #10 + '�ϵ籨��!');
end;

procedure TFrmAlarmCar.DoProcessDriverFatigue(Dev: TDevice);
begin
  if GlobalParam.isAlarmDriverFatigue then
    popmsg('ƣ�ͼ�ʻ��ʾ', Dev.Car.No + #13 + #10 + 'ƣ�ͼ�ʻ����!');
end;

procedure TFrmAlarmCar.DoProcessInDevArea(Dev: TDevice);
begin
  if GlobalParam.isAlarmInDevArea then
    popmsg('������������ʾ', Dev.Car.No + #13 + #10 + '���������򱨾�!');
end;

procedure TFrmAlarmCar.DoProcessOutDevArea(Dev: TDevice);
begin
  if GlobalParam.isAlarmOutDevArea then
    popmsg('������������ʾ', Dev.Car.No + #13 + #10 + '���������򱨾�!');
end;

procedure TFrmAlarmCar.DoProcessOutLine(Dev: TDevice);
begin
  if GlobalParam.isAlarmOutLine then
    popmsg('ƫ��·����ʾ', Dev.Car.No + #13 + #10 + 'ƫ��·�߱���!');
end;

procedure TFrmAlarmCar.DoProcessDevFortify(Dev: TDevice);
begin
  if GlobalParam.isAlarmOutLine then
    popmsg('�Ƿ�������ʾ', Dev.Car.No + #13 + #10 + '�������!');
end;

procedure TFrmAlarmCar.DoProcessDevLowPower(Dev: TDevice);
begin
  if GlobalParam.isAlarmOutLine then
    popmsg('�Ƿ�������ʾ', Dev.Car.No + #13 + #10 + '�������!');
end;

procedure TFrmAlarmCar.AddData_AssembleWarring(Adev: TDevice; AArea: TConfineArea; BDel: Boolean);
var
  node : TcxTreeListNode;
  LogA:TSystemLog;
  group:TDevGroup;
  s:string;
  find_ListItem : TcxTreeListNode;
  i: Integer;
  Area: TConfineArea;
begin
  AssembleWarringList.BeginUpdate;

  if not BDel then
  begin
    find_ListItem:= FindNodeByTextIncxTreeList(IntToStr(AArea.Id),AssembleWarringList,0);
    If find_ListItem = nil then
    begin
      with AssembleWarringList.Add do
      begin
        Data := AArea;
        Values[0]:= AArea.Id;
        Values[1]:= AArea.Name;
        Values[2]:= '�ۼ�����';
        Values[3]:= AArea.OverSpeet;
        Values[4]:= AArea.DevList.Count;

        //ImageIndex := Adev.Car.ResIndex;
        //SelectedIndex := Adev.Car.ResIndex ;
      end;
    end;
  end
  else
  begin
    for i:=0 to GAreaManage.Count - 1 do
    begin
      Area := GAreaManage.Items[i];
      if Area.AreaType = ASSEMBLE_WARRING then
      begin
        find_ListItem:= FindNodeByTextIncxTreeList(IntToStr(Area.Id),AssembleWarringList,0);
        if find_ListItem <> nil then
        begin
          if TConfineArea(find_ListItem.Data).DevList.Count <= 0 then
          begin
            find_ListItem.Delete;
            cxTreeList2.Clear;
            Continue;
          end
          else
          begin
            find_ListItem.Values[4]:= Area.DevList.Count;
          end;
        end
        else if Area.DevList.Count > 0 then
        begin
          with AssembleWarringList.Add do
          begin
            Data := Area;
            Values[0]:= Area.Id;
            Values[1]:= Area.Name;
            Values[2]:= '�ۼ�����';
            Values[3]:= Area.OverSpeet;
            Values[4]:= Area.DevList.Count;
          end;
        end;
      end;
      Application.ProcessMessages;
    end;
  end;
  AssembleWarringList.EndUpdate;
end;

procedure TFrmAlarmCar.AddData_SuspectedPetitionsWarring(ADev: TDevice; AArea: TConfineArea; BDel: Boolean);
var
  node : TcxTreeListNode;
  LogA:TSystemLog;
  group:TDevGroup;
  s:string;
  find_ListItem : TcxTreeListNode;
  i: Integer;
  Area: TConfineArea;
begin
  SuspectedPetitionsWarringList.BeginUpdate;

  if not BDel then
  begin
    find_ListItem:= FindNodeByTextIncxTreeList(IntToStr(AArea.Id),SuspectedPetitionsWarringList,0);
    If find_ListItem = nil then
    begin
      with SuspectedPetitionsWarringList.Add do
      begin
        Data := AArea;
        Values[0]:= AArea.Id;
        Values[1]:= AArea.Name;
        Values[2]:= '�����Ϸñ���';
        Values[3]:= AArea.OverSpeet;
        Values[4]:= AArea.MinSpeed;
        Values[5]:= AArea.MaintainTime;
        Values[6]:= AArea.DevList.Count;

      end;
    end;
  end
  else
  begin
    for i:=0 to GAreaManage.Count - 1 do
    begin
      Area := GAreaManage.Items[i];
      if Area.AreaType = SUSPECTEDPETITIONS_WARRING then
      begin
        find_ListItem:= FindNodeByTextIncxTreeList(IntToStr(Area.Id),SuspectedPetitionsWarringList,0);
        if find_ListItem <> nil then
        begin
          if TConfineArea(find_ListItem.Data).DevList.Count <= 0 then
          begin
            find_ListItem.Delete;
            cxTreeList3.Clear;
            Continue;
          end
          else
          begin
            find_ListItem.Values[6]:= Area.DevList.Count;
          end;
        end
        else if Area.DevList.Count > Area.OverSpeet then
        begin
          with SuspectedPetitionsWarringList.Add do
          begin
            Data := Area;
            Values[0]:= Area.Id;
            Values[1]:= Area.Name;
            Values[2]:= '�����Ϸñ���';
            Values[3]:= Area.OverSpeet;
            Values[4]:= Area.MinSpeed;
            Values[5]:= Area.MaintainTime;
            Values[6]:= Area.DevList.Count;        
          end;
        end;
      end;
      Application.ProcessMessages;
    end;
  end;
  SuspectedPetitionsWarringList.EndUpdate;
end;

procedure TFrmAlarmCar.AddData_OutToTown(Adev: TDevice;
  AArea: TConfineArea);
var
  node : TcxTreeListNode;
  LogA:TSystemLog;
  group:TDevGroup;
  s:string;
  find_ListItem : TcxTreeListNode;
begin
  OutTownList.BeginUpdate;

  find_ListItem:= FindNodeByTextIncxTreeList(Adev.IdStr,OutTownList,0);
  If (find_ListItem = nil) and (Adev.OutToTown) then
  begin
    with OutTownList.Add do
    begin
      Data := Adev;
      Values[0]:= Adev.IdStr;
      Values[1]:= Adev.Car.No;
      if Adev.OutToTownTime =0 then
        Values[2] := ''
      else
        Values[2]:= FormatDateTime('yyyy-mm-dd hh:nn:ss',Adev.OutToTownTime) ;
      Values[3]:= 'Ԥ��' + IntToStr(AArea.OverSpeet) + '���Ӻ�س�';
      Values[4]:= FormatFloat('##0.000000',Adev.Longitude);
      Values[5]:= FormatFloat('##0.000000',Adev.Latitude);
      Values[6]:= FormatFloat('##0.0', ADev.Speed/10); {Adev.speed; //LS}
      Values[7]:= FormatDateTime('yyyy-mm-dd hh:nn:ss',now);
      Values[8]:=Adev.OutToTownAlarm;

      ImageIndex := Adev.Car.ResIndex;
      SelectedIndex := Adev.Car.ResIndex ;
    end;
  end
  else if not Adev.OutToTown then
  begin
    with find_ListItem do
    begin
      Data := Adev;                 
      if Adev.OutToTownTime =0 then
        Values[2] := ''
      else
        Values[2]:= FormatDateTime('yyyy-mm-dd hh:nn:ss',Adev.OutToTownTime) ;
      if Adev.GoToTown =0 then
        Values[3] := ''
      else
        Values[3]:= FormatDateTime('yyyy-mm-dd hh:nn:ss',Adev.GoToTown) ;
      Values[4]:= FormatFloat('##0.000000',Adev.Longitude);
      Values[5]:= FormatFloat('##0.000000',Adev.Latitude);
      Values[6]:= FormatFloat('##0.0', ADev.Speed/10); {Adev.speed;//ls}
      Values[7]:= FormatDateTime('yyyy-mm-dd hh:nn:ss',now);
      Values[8]:=Adev.OutToTownAlarm;
    end;
    OutTownList.FocusedNode.Values[8]:=Adev.OutToTownAlarm;
  end;

  OutTownList.EndUpdate;



  LogA := TSystemLog.Create;
  try
    LogA.LogFile := ExePath + 'Alarm\���Ǳ���';
    LogA.ExtendName := 'csv';
    LogA.BufferSize := 0;
    LogA.BeginString:='ʱ��,���ƺ�,����ʱ��,����ʱ��,GPSʱ��,����,γ��,�ٶ�';

    LogA.AddLog(FormatDatetime('yyyy-mm-dd hh:nn:ss',now)+','+
              Adev.Car.No+','+ FormatDateTime('yyyy-mm-dd hh:nn:ss',Adev.OutToTownTime)+','+
              FormatDateTime('yyyy-mm-dd hh:nn:ss',Adev.GoToTown)+','+
              FormatDateTime('yyyy-mm-dd hh:nn:ss',Adev.GpsTime)+','+
              FormatFloat('0.000000',Adev.Longitude)+ ','+
              FormatFloat('0.000000',Adev.Latitude)+','+
              FormatFloat('##0.0', ADev.Speed/10)); {FormatFloat('0.0',Adev.Speed)); //LS}

  finally
    LogA.Free
  end;
end;

procedure TFrmAlarmCar.Dev_OutToTown_Error(Adev: TDevice; AArea: TConfineArea);
var
  node : TcxTreeListNode;
  LogA:TSystemLog;
  group:TDevGroup;
  s:string;
  find_ListItem : TcxTreeListNode;
begin
  OutTownList.BeginUpdate;

  find_ListItem:= FindNodeByTextIncxTreeList(Adev.IdStr,OutTownList,0);
  If (find_ListItem = nil) and (Adev.OutToTown) then
  begin
    with OutTownList.Add do
    begin
      Data := Adev;            
      Values[0]:= Adev.IdStr;         
      Values[1]:= Adev.Car.No;              
      if Adev.OutToTownTime =0 then
        Values[2] := ''
      else
        Values[2]:= FormatDateTime('yyyy-mm-dd hh:nn:ss',Adev.OutToTownTime) ;
      Values[3]:= 'Ԥ��' + IntToStr(AArea.OverSpeet) + '���Ӻ�س�, �ֳ�ʱδ�س�';
      Values[4]:= FormatFloat('##0.000000',Adev.Longitude);
      Values[5]:= FormatFloat('##0.000000',Adev.Latitude);
      Values[6]:= FormatFloat('##0.0', ADev.Speed/10); {Adev.speed; //LS}
      Values[7]:= FormatDateTime('yyyy-mm-dd hh:nn:ss',now);
      Values[8]:=Adev.OutToTownAlarm;

      ImageIndex := Adev.Car.ResIndex;
      SelectedIndex := Adev.Car.ResIndex ;
    end;
  end
  else if (find_ListItem <> nil) and (Adev.OutToTown) then
  begin
    with find_ListItem do
    begin
      Data := Adev;                  
      if Adev.OutToTownTime =0 then
        Values[2] := ''
      else
        Values[2]:= FormatDateTime('yyyy-mm-dd hh:nn:ss',Adev.OutToTownTime) ;

      Values[3]:= 'Ԥ��' + IntToStr(AArea.OverSpeet) + '���Ӻ�س�, �ֳ�ʱδ�س�' ;
      Values[4]:= FormatFloat('##0.000000',Adev.Longitude);
      Values[5]:= FormatFloat('##0.000000',Adev.Latitude);
      Values[6]:= FormatFloat('##0.0', ADev.Speed/10); {Adev.speed; //LS}
      Values[7]:= FormatDateTime('yyyy-mm-dd hh:nn:ss',now);
      Values[8]:=Adev.OutToTownAlarm;
    end;
  end;

  OutTownList.EndUpdate;



  LogA := TSystemLog.Create;
  try
    LogA.LogFile := ExePath + 'Alarm\���Ǳ���';
    LogA.ExtendName := 'csv';
    LogA.BufferSize := 0;
    LogA.BeginString:='ʱ��,���ƺ�,����ʱ��,����ʱ��,GPSʱ��,����,γ��,�ٶ�';

    LogA.AddLog(FormatDatetime('yyyy-mm-dd hh:nn:ss',now)+','+
              Adev.Car.No+','+ FormatDateTime('yyyy-mm-dd hh:nn:ss',Adev.OutToTownTime)+','+
              FormatDateTime('yyyy-mm-dd hh:nn:ss',Adev.GoToTown)+','+
              FormatDateTime('yyyy-mm-dd hh:nn:ss',Adev.GpsTime)+','+
              FormatFloat('0.000000',Adev.Longitude)+ ','+
              FormatFloat('0.000000',Adev.Latitude)+','+
              FormatFloat('##0.0', ADev.Speed/10)); {FormatFloat('0.0',Adev.Speed));//LS}

  finally
    LogA.Free
  end;
end;

procedure TFrmAlarmCar.OutTownListCustomDrawCell(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
   procedure DoErrProcess(ErrStr:String); //�������
  var
    row: integer;
    NodeRect:   TRect;
  begin
    for row:=1 to OutTownList.Count-1 do
    begin
      if Pos(ErrStr, OutTownList.Items[row].Values[3])>0 then
      begin
        NodeRect := OutTownList.Items[row].DisplayRect(True);
        OutTownList.Canvas.Brush.Color := $00C0DCC0;               
        OutTownList.Canvas.Font.Color := clred; //��ɫ����ʾ
      end;
    end;
  end;
begin
  //DoErrProcess('�س�');
end;

procedure TFrmAlarmCar.N5Click(Sender: TObject);
var
  dev:TDevice;
begin
   //
   if OutTownList.FocusedNode =nil then
   begin
       messagebox(handle,'��ѡ��һ����','��ʾ',mb_ok + mb_iconinformation);
       exit;
   end;
   dev:=TDevice(OutTownList.FocusedNode.Data);
   //if messagebox(handle,PChar('��ȷ������ʾ'+dev.Car.No+'ʻ����ʾ?'),'��ʾ',MB_OKCANCEL + MB_ICONQUESTION)= ID_OK then
   begin
       dev.OutToTownAlarm :=not dev.OutToTownAlarm;
       OutTownList.FocusedNode.Values[8]:=dev.OutToTownAlarm;
   end;
end;

procedure TFrmAlarmCar.OutTownListEditValueChanged(Sender: TObject;
  AColumn: TcxTreeListColumn);
var
  dev:TDevice;
begin
     if OutTownList.FocusedNode =nil then exit;
     dev:=TDevice(OutTownList.FocusedNode.Data);
       dev.OutToTownAlarm := not OutTownList.FocusedNode.Values[8];
end;

procedure TFrmAlarmCar.N6Click(Sender: TObject);
begin
  HistoryDevList.BeginUpdate;
  HistoryDevList.Clear;
  HistoryDevList.EndUpdate;
end;

procedure TFrmAlarmCar.Add2DevList(const ADev: Tdevice; TreeList: TcxTreeList);
var
  node : TcxTreeListNode;
begin
  try
    with TreeList do
    begin
      node := TreeList.Add;
      node.Data := Adev;
      FillData(Adev,node);
    end;
  finally
  end;
end;

procedure TFrmAlarmCar.FillData(ADev: TDevice;
  ANode: TcxTreeListNode);
//var
//  Downtime:TDatetime;
var
  devGroup: TDevGroup;
begin
  with ADev,ANode do
  begin
    Data:= ADev;
    Values[0]:= ADev.IdStr;
    Values[1]:= ADev.Car.No;
    Values[2]:= ADev.Login_DriverName+'('+ADev.Login_Driver+')';
    Values[3]:= FormatFloat('##0.000000',ADev.Longitude);
    Values[4]:= FormatFloat('##0.000000',ADev.Latitude);
    Values[5]:= FormatFloat('##0.0', ADev.Speed/10); {FormatFloat('##0.0',ADev.Speed ); //* 1852/10000 //LS}
    devGroup := ADevGroupManage.find(ADev.GroupID);
    if devGroup <> nil then
    begin
      Values[6] := devGroup.Name;
      Values[7] := devGroup.TelPhone;
    end;
    Values[8] := IntToStr(MinutesBetween(now, ADev.OnMinSpeedTime));

    ImageIndex:= ADev.Car.ResIndex ;
    SelectedIndex := ADev.Car.ResIndex ;
  end;
end;

procedure TFrmAlarmCar.AssembleWarringListClick(Sender: TObject);
  procedure ReShowArea;
  begin
    //if GCurConfineArea<>nil then
    begin
      GCurConfineArea.IsDraw := not GCurConfineArea.IsDraw;
      //���� ����ͼ
      FMap.Draw;
    end;
  end;
var
  i: integer;
  dev: Tdevice;
  confArea: TConfineArea;

  //confArea: TConfineArea;
  WorldOutBox:TWorldRect;
  wp: TWorldPoint;
begin

  if AssembleWarringList.SelectionCount =0 then exit;

  if cxTreeList2.FocusedNode <> nil then
    cxTreeList2.FocusedNode := nil;   //

  confArea := TConfineArea(AssembleWarringList.Selections[0].Data);
  if confArea <> nil then
  begin
    if confArea.DevList.Count> 0 then
    begin
      cxTreeList2.BeginUpdate;
      cxTreeList2.Clear;
      for i:= 0 to confArea.DevList.Count -1 do
      begin
        dev:= ADeviceManage.Find(confArea.DevList[i]);
        if dev= nil then Continue;
        Add2DevList(dev, cxTreeList2);
      end;
      cxTreeList2.EndUpdate;
    end;

    GCurConfineArea := confArea;
    WorldOutBox:=GCurConfineArea.OutBox;

    FMap.Zoom(WorldOutBox);

    FMap.Draw;
  end;
end;

procedure TFrmAlarmCar.N8Click(Sender: TObject);
begin
  CxTreeListToCSVFile(cxTreeList2);
end;

procedure TFrmAlarmCar.SuspectedPetitionsWarringListClick(Sender: TObject);
  procedure ReShowArea;
  begin
    //if GCurConfineArea<>nil then
    begin
      GCurConfineArea.IsDraw := not GCurConfineArea.IsDraw;
      //���� ����ͼ
      FMap.Draw;
    end;
  end;
var
  i: integer;
  dev: Tdevice;
  confArea: TConfineArea;

  //confArea: TConfineArea;
  WorldOutBox:TWorldRect;
  wp: TWorldPoint;
begin

  if SuspectedPetitionsWarringList.SelectionCount =0 then exit;

  if cxTreeList3.FocusedNode <> nil then
    cxTreeList3.FocusedNode := nil;   //

  confArea := TConfineArea(SuspectedPetitionsWarringList.Selections[0].Data);
  if confArea <> nil then
  begin
    if confArea.DevList.Count> 0 then
    begin
      cxTreeList3.BeginUpdate;
      cxTreeList3.Clear;
      for i:= 0 to confArea.DevList.Count -1 do
      begin
        dev:= ADeviceManage.Find(confArea.DevList[i]);
        if dev= nil then Continue;
        Add2DevList(dev, cxTreeList3);
      end;
      cxTreeList3.EndUpdate;
    end;

    GCurConfineArea := confArea;
    WorldOutBox:=GCurConfineArea.OutBox;

    FMap.Zoom(WorldOutBox);

    FMap.Draw;
  end;
end;

procedure TFrmAlarmCar.DevAlarm_OutorInConfineArea(ADev: Tdevice;
  AlarmType: Byte; AddorDel: boolean; AArea: TConfineArea);
var
  str: string;
begin
  if AddorDel then //=---add ����µġ�Խ���ʻ�롡��������
  begin
    //��������
    try
      screen.Cursor := crHourGlass;
      if AlarmType = ALARM_OUT then
        str := ExpandFileName(GlobalParam.AlarmSound_OutCArea)
      else if AlarmType = ALARM_IN then
        str := ExpandFileName(GlobalParam.AlarmSound_InCArea);
        MediaPalySound(str);
    except
    end;
    screen.Cursor := crDefault;

    if (AlarmType = ALARM_OUT) or (AlarmType = ALARM_WAY_OUT) then //���뵽Խ�籨���б�
      AddData_OutCAreaDev(Adev, AArea)
    else if (AlarmType = ALARM_IN) or (AlarmType = ALARM_WAY_IN) then //���뵽ʻ�뱨���б�
      AddData_InCAreaDev(Adev, AArea)
    else if AlarmType = OUT_TOWN then
      AddData_OutToTown(ADev, AArea)
    else if AlarmType = OUT_TOWN_ERROR then
      Dev_OutToTown_Error(ADev, AArea)
    else if AlarmType = ASSEMBLE_WARRING then
      AddData_AssembleWarring(nil, AArea, False)
    else if AlarmType = SUSPECTEDPETITIONS_WARRING then
      AddData_SuspectedPetitionsWarring(nil, AArea, False);

//    if GlobalParam.isAreaAlarmSendInfoToDriver then
    if GlobalParam.IsSendTextWhenAlarm then 
    begin
      case AlarmType of

        ALARM_OUT: str := '���Ѿ��������Χ����������̨��ط�Χ����ע�ⰲȫ��С�ļ�ʻ��ף��һ·˳�硣';
        ALARM_IN: str := '����ʹ��' + AArea.Name + '����,���뿪' + AArea.Name + '����';
        ALARM_WAY_OUT: str := '����ʹ��' + AArea.Name + '·��,��ص�' + AArea.Name + '·��';
        ALARM_WAY_IN: str := '����ʹ��' + AArea.Name + '·��,���뿪' + AArea.Name + '·��';
        OUT_TOWN: str := '���Ѿ�����������ע�ⰲȫ����ʱ�سǣ�С�ļ�ʻ��ף��һ·˳�硣 '
      end;
      if AlarmType <> OUT_TOWN_ERROR then
        DataServer.SendControlInfo_Alarm_V3(-1, ADev,Trim(str),Length(Trim(str)),5);
    end;   
  end
  else //=del ��Խ�絽��Խ�磬���ʻ�뵽ʻ�������б���ԭ�еı�����Ϣ��������ʷ,�����б���ԭ��ɾ��
  begin
    if AlarmType = ALARM_OUT then
      str := '�����Ѳ�ʻ������'
    else if AlarmType = ALARM_IN then
      str := '�����Ѳ�ʻ������'
    else if AlarmType = ALARM_WAY_OUT then
      str := '�����Ѳ�ʻ��·��'
    else if AlarmType = ALARM_WAY_IN then
      str := '�����Ѳ�ʻ��·��'
    else if AlarmType = OUT_TOWN then
      str := '�����Ѿ��س�';
    if AlarmType = ASSEMBLE_WARRING then
    begin
      AddData_AssembleWarring(nil, AArea, True);
    end
    else if AlarmType = SUSPECTEDPETITIONS_WARRING then
    begin
      AddData_SuspectedPetitionsWarring(nil, AArea, True);
    end
    else
    begin
      RemoveOutorInCAData2History(ADev, AlarmType, str);
    end;
  end;
end;

procedure TFrmAlarmCar.RemoveOutorInCAData2History(ADev: TDevice;
  AlarmType: byte; const MoveCause: string);
var
  find_ListItem: TcxTreeListNode;
begin
  if (AlarmType = ALARM_OUT) or (AlarmType = ALARM_WAY_OUT) then //��Խ�絽��Խ��
  begin
    Adev.Alarm_OutCArea := false;
    find_ListItem := FindNodeByTextIncxTreeList(ADev.IdStr, cxOutCAreaList, 0);
    if find_ListItem <> nil then
    begin
      cxOutCAreaList.BeginUpdate;
      try
        MoveData2OutCAreaHistoryList(ADev, find_ListItem, MoveCause);
      finally
        cxOutCAreaList.EndUpdate;
      end;
    end;
  end
  else if (AlarmType = ALARM_IN) or (AlarmType = ALARM_WAY_IN) then //��ʻ�뵽ʻ��
  begin
    Adev.Alarm_InCArea := false;
    find_ListItem := FindNodeByTextIncxTreeList(ADev.IdStr, cxInCAreaList, 0);
    if find_ListItem <> nil then
    begin
      cxInCAreaList.BeginUpdate;
      try
        MoveData2InCAreaHistoryList(ADev, find_ListItem, MoveCause);
      finally
        cxInCAreaList.EndUpdate;
      end;
    end;
  end
  else if AlarmType = OUT_TOWN then
  begin
    find_ListItem := FindNodeByTextIncxTreeList(ADev.IdStr, OutTownList, 0);
    if find_ListItem <> nil then
    begin
      with HistoryDevList.Add do
      begin
        Data := find_ListItem.Data;
        Values[0]:= find_ListItem.Values[0];
        Values[1]:= find_ListItem.Values[1];
        Values[2]:= find_ListItem.Values[2] ;
        if Adev.GoToTown =0 then
          Values[3] := ''
        else
          Values[3]:= FormatDateTime('yyyy-mm-dd hh:nn:ss',Adev.GoToTown) ;
        Values[4]:= find_ListItem.Values[4];
        Values[5]:= find_ListItem.Values[5];
        Values[6]:= find_ListItem.Values[6];
        Values[7]:= find_ListItem.Values[7];
        ImageIndex := ADev.Car.ResIndex;
        SelectedIndex := ADev.Car.ResIndex ;
      end;
      find_ListItem.Delete;
    end;
  end;
end;

procedure TFrmAlarmCar.DoOnDevAreaAlarm(dev: TDevice; area: TBaseArea; alarmType: Byte);
begin
  if cxAreaAlarmList.Count > 200 then
    cxAreaAlarmList.Clear;
  cxAreaAlarmList.BeginUpdate;
  try
    with cxAreaAlarmList.Add do
    begin
      Values[0] := area.AreaID;
      Values[1] := area.AreaName;
      Values[2] := GetAlarmTypeName(alarmType);
      Values[3] := dev.Car.No;
      Values[4] := FormatDateTime('yyyy-MM-dd hh:nn:ss', Now);
    end;
  finally
    cxAreaAlarmList.EndUpdate;
  end;
end;

procedure TFrmAlarmCar.N9Click(Sender: TObject);
begin
  cxAreaAlarmList.Clear;
end;

procedure TFrmAlarmCar.DoOnCarInOutAreaAlarm(dev: TDevice; areaType: Byte;
  alarmAreaId: Integer; flag: Byte);
var
  area: TBaseArea;
begin
  area := FAllAreaManage.findByAreaNo(alarmAreaId);
  if area <> nil then
  begin
    if cxAreaAlarmList.Count > 200 then
      cxAreaAlarmList.Clear;
    cxAreaAlarmList.BeginUpdate;
    try
      with cxAreaAlarmList.Add do
      begin
        Values[0] := '��������/·�߱���';

        Values[1] := GetDevAreaTypeName(areaType) + '[' + area.AreaName + ']';

        Values[2] := dev.Car.No;
        Values[3] := FormatDateTime('yyyy-MM-dd hh:nn:ss', dev.GpsTime);
        if flag = 0 then
          Values[4] := '��' + Values[1]
        else
          Values[4] := '��' + Values[1];
      end;
    finally
      cxAreaAlarmList.EndUpdate;
    end;
  end;  
end;

procedure TFrmAlarmCar.DoOnCarOverSpeedAlarm(dev: TDevice; areaType: Byte;
  alarmAreaId: Integer);
var
  area: TBaseArea;
  polyLineArea: TPolyLineArea;
  lineSection: TLineSection;
begin
  if cxAreaAlarmList.Count > 200 then
    cxAreaAlarmList.Clear;
  cxAreaAlarmList.BeginUpdate;
  try
    with cxAreaAlarmList.Add do
    begin
      Values[0] := '���ٱ���';
      if alarmAreaId = 0 then
      begin
        Values[1] := '';
        Values[4] := '��ǰ�ٶ�:' + IntToStr(dev.Speed);
      end
      else
      begin
        Values[4] := '��ǰ�ٶ�:' + FormatFloat('##0.0', dev.Speed/10);
        if areaType < 3 then
        begin
          area := FAllAreaManage.findByAreaNo(alarmAreaId);
          if area <> nil then
          begin
            Values[1] := GetDevAreaTypeName(areaType) + '[' + area.AreaName + ']';
            Values[4] := '���������ֵΪ' + IntToStr(area.maxSpeed) + ',' + Values[4];
          end;
        end
        else
        begin
          polyLineArea := FAllAreaManage.findByLineSectionNo(alarmAreaId);
          if (polyLineArea <> nil) then
          begin
            lineSection := polyLineArea.FindLineSection(alarmAreaId);
            if (lineSection <> nil) then
            begin
              Values[1] := '·��[' + polyLineArea.AreaName + ']��·��[' + IntToStr(alarmAreaId) + ']';
              Values[4] := '·�ε�����ֵΪ' + IntToStr(lineSection.LineSectionMaxSpeed) + ',' + Values[4];
            end;
          end;
        end;
      end;

      Values[2] := dev.Car.No;
      Values[3] := FormatDateTime('yyyy-MM-dd hh:nn:ss', dev.GpsTime);

    end;
  finally
    cxAreaAlarmList.EndUpdate;
  end;
end;

procedure TFrmAlarmCar.DoOnCarRunTimeAlarm(dev: TDevice;
  alarmLineSectionId, runTime: Integer; flag: Byte);
var
  polyLineArea: TPolyLineArea;
  lineSection: TLineSection;
begin
  polyLineArea := FAllAreaManage.findByLineSectionNo(alarmLineSectionId);
  if (polyLineArea <> nil) then
  begin
    lineSection := polyLineArea.FindLineSection(alarmLineSectionId);
    if (lineSection = nil) then Exit;
    
    if cxAreaAlarmList.Count > 200 then
      cxAreaAlarmList.Clear;
    cxAreaAlarmList.BeginUpdate;
    try
      with cxAreaAlarmList.Add do
      begin
        if flag = 0 then
        begin
          Values[0] := '·����ʻʱ�䲻�㱨��';
          Values[4] := '�ڸ�·����ʻʱ��:' + IntToStr(runTime) + '��,��·���趨�������ʻʱ��:' + IntToStr(lineSection.LineSectionRunMinTime) + '��';
        end
        else
        begin
          Values[0] := '·����ʻʱ���������';
          Values[4] := '�ڸ�·����ʻʱ��:' + IntToStr(runTime) + '��,��·���趨�����ʻʱ��:' + IntToStr(lineSection.LineSectionRunMaxTime) + '��';
        end;  

        Values[1] := '·��[' + polyLineArea.AreaName + ']·��[' + IntToStr(alarmLineSectionId) + ']';

        Values[2] := dev.Car.No;
        Values[3] := FormatDateTime('yyyy-MM-dd hh:nn:ss', dev.GpsTime);
      end;
    finally
      cxAreaAlarmList.EndUpdate;
    end;
  end;
end;

procedure TFrmAlarmCar.DoOnCarIOAreaAlarm(dev: TDevice; alarmType: Integer;
  alarmTime: TDateTime; memo: string);
begin
  if cxTreeList1.Count >= 200 then
  begin
    cxTreeList1.Clear;
  end;

  with cxTreeList1.Add do
  begin
    if alarmType = 0 then
      Values[0] := 'δ��ʱ���ﱨ��'
    else
      Values[0] := 'δ��ʱ�뿪����';

    Values[1] := dev.Car.No;
    Values[2] := FormatDateTime('yyyy-MM-dd hh:nn:ss', alarmTime);
    Values[3] := memo;
  end;
end;

procedure TFrmAlarmCar.DoOnCarAccOffMoveAlarm(dev: TDevice;
  alarmTime: TDateTime; memo: string);
var
  alarmInfo: TAlarmInfoFromDev;
begin
  //if Bs.AddDevAlarmInfo(dev.Id, 52, FormatDateTime('yyyy-MM-dd hh:nn:ss', dev.GpsTime), dev.Latitude * 1000000, dev.Longitude * 1000000, dev.Speed, 0, 0, 0, 0, 0, 0, 0, 0) > 0 then
  begin//��ʱ�Ȳ���÷Ƿ��ƶ�������A6ת��ı�����Ϣ̫�࣬���������Ҫ���棬�������̵߳����������ݣ�����̫��ı������ݽ������ʱ�����
    if cxTreeList4.Count >= 200 then
    begin
      cxTreeList4.Clear;
    end;

    with cxTreeList4.Add do
    begin
      Values[0] := dev.Car.No;
      Values[1] := FormatDateTime('yyyy-MM-dd hh:nn:ss', alarmTime);
      Values[2] := memo;
      Values[3] := '����δȷ��';
      Values[4] := -1;
      Values[5] := 52;

      alarmInfo := FAlarmInfoManage.Add(-1);
      Values[6] := alarmInfo.Id;
      alarmInfo.DevId := dev.Id;
      alarmInfo.CarNo := Values[0];
      alarmInfo.AlarmType := Values[5];
      alarmInfo.AlarmTime := dev.GpsTime;
      alarmInfo.AlarmDealStatus := Values[4];

      Data := alarmInfo;
    end;
  end
end;

procedure TFrmAlarmCar.menuDealAlarmClick(Sender: TObject);
var
  dlg: TfrmDealDevAlarmInfo;
  selNode: TcxTreeListNode;
  alarmInfo: TAlarmInfoFromDev;
begin
  if cxTreeList4.FocusedNode <> nil then
  begin
    selNode := cxTreeList4.FocusedNode;
    if selNode.Values[4] = 2 then
    begin
      MessageBox(Handle, '����������¼�Ѿ������޷��ٴδ���', '��ʾ', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
    alarmInfo := TAlarmInfoFromDev(selNode.Data);
    dlg := TfrmDealDevAlarmInfo.Create(Self);
    try
      dlg.currStatus := selNode.Values[4];
      dlg.edtCarNo.Text := selNode.Values[0];
      dlg.devId := alarmInfo.DevId;
      dlg.alarmType := selNode.Values[5];

      dlg.alarmGpsTime := selNode.Values[1];
      dlg.Notebook1.PageIndex := selNode.Values[4] + 1;
      if dlg.Notebook1.PageIndex = 0 then
      begin
        dlg.edtAlarmType.Text := '����դ����������';
      end;
      currAlarmInfo := alarmInfo;
      if dlg.ShowModal = mrOK then
      begin
        selNode.Values[3] := GetDevAlarmDealStatusName(dlg.currStatus, alarmInfo);
        selNode.Values[4] := dlg.currStatus;
      end
      else
      begin
        selNode.Values[3] := GetDevAlarmDealStatusName(dlg.currStatus, alarmInfo);
        selNode.Values[4] := dlg.currStatus;
      end;    
    finally
      dlg.Free;
      currAlarmInfo := nil;
    end;
  end;
end;

procedure TFrmAlarmCar.menuDelNotConfirmedAlarmClick(Sender: TObject);
var
  selNode: TcxTreeListNode;
begin
  if cxTreeList4.FocusedNode <> nil then
  begin
    selNode := cxTreeList4.FocusedNode;
    if selNode.Values[7] >= 0 then
    begin
      MessageBox(Handle, '�ñ�����Ϣ�Ѿ���ȷ�ϣ�����ɾ��', '��ʾ', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
    FAlarmInfoManage.Delete(selNode.Values[9]);
    selNode.Delete;
  end;
end;

procedure TFrmAlarmCar.menuDelAllNotConfirmedAlarmClick(Sender: TObject);
var
  i: Integer;
  node: TcxTreeListNode;
begin
  i := 0;
  while i < cxTreeList4.Nodes.Count do
  begin
    node := cxTreeList4.Items[i];
    if node.Values[7] < 0 then
    begin
      FAlarmInfoManage.Delete(node.Values[9]);
      node.Delete;
    end
    else
    begin
      Inc(i);
    end;
  end;
end;

procedure TFrmAlarmCar.menuDelDealedAlarmClick(Sender: TObject);
var
  selNode: TcxTreeListNode;
begin
  if cxTreeList4.FocusedNode <> nil then
  begin
    selNode := cxTreeList4.FocusedNode;
    if selNode.Values[7] < 2 then
    begin
      MessageBox(Handle, '�ñ�����Ϣ��δ�������������ɾ��', '��ʾ', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
    FAlarmInfoManage.Delete(selNode.Values[9]);
    selNode.Delete;
  end;
end;

procedure TFrmAlarmCar.menuDelAllDealedAlarmClick(Sender: TObject);
var
  i: Integer;
  node: TcxTreeListNode;
begin
  i := 0;
  while i < cxTreeList4.Nodes.Count do
  begin
    node := cxTreeList4.Items[i];
    if node.Values[7] = 2 then
    begin
      FAlarmInfoManage.Delete(node.Values[9]);
      node.Delete;
    end
    else
    begin
      Inc(i);
    end;
  end;
end;

procedure TFrmAlarmCar.cxTreeList4CustomDrawCell(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
begin
  if AViewInfo.Node.Values[4] >= 1 then
    ACanvas.Font.Color := clWindowText
  else
    ACanvas.Font.Color := clRed;
end;

end.
