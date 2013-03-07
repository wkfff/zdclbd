unit ZDCLJKFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, ToolWin,uGloabVar,GpsLibUnit, emapker,MapControlUnit,
  IniFiles,MetaDefine,MapManagerUnit, emapctrl,ConstDefineUnit, CarUnit,
  Grids, ValEdit, cxControls, cxSplitter, StdCtrls, Menus, ActnList,
  OleCtrls, SHDocVw, ExternalContainer;

type
  TValueListEditorAccess = class(TValueListEditor)
  end;

type
  TZDCLJKFrm = class(TForm)
    Panel_Map: TPanel;
    Panel_BirdEyeSet: TPanel;
    Panel_birdEye: TPanel;
    TrackBarOutlook: TTrackBar;
    Panel_data_display: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DeviceStateList: TValueListEditor;
    Timer1: TTimer;
    SplitterRight: TcxSplitter;
    Button1: TButton;
    PopupMenu_funDev: TPopupMenu;
    N282: TMenuItem;
    N17: TMenuItem;
    N62: TMenuItem;
    N125: TMenuItem;
    N91: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N3: TMenuItem;
    ActionList1: TActionList;
    Hot_zoom_out: TAction;
    Hot_zoom_in: TAction;
    N5: TMenuItem;
    WebBrowser1: TWebBrowser;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure DeviceStateListDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure ToolButton6Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N62Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N125Click(Sender: TObject);
    procedure N91Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Panel_MapCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure WebBrowser1DocumentComplete(Sender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
  private
    { Private declarations }
    f: TExternalContainer;
    FListView_SelectDevs: TListView;
    procedure  ApplicationEvents1Message(var   Msg:   tagMSG;
      var   Handled:   Boolean);
    procedure showMap;
  public
    { Public declarations }
    Dev: TDevice;
    //GPSͼ��
    drawlayer: TGpsDrawLayer;
    datalayer: TGpsDataLayer;
        //����ͼ��
    userDrawLayer: TAreaDrawLayer;
    userDataLayer: TDataLayer;

    //Χ��ͼ��
    AlarmNoSybolLayer: TAlarmNoSybolLayer;
    AlarmNoDataLayer: TDataLayer;

    //�û��Զ���ͼ��
    TextLayer: TUserDefinedTextLayer;
    TextDataLayer: TDataLayer;

    //��ͼ�ڵ������.�������еĵ�ͼ����
    MapManger: TMapManger;
    //����굱��һ������������.��Ҫ�ǽ����ǰ�����ʾ���ĸ�ʡ����
    MouseDev: TDevice;
    FMap1 : TGpsMap;
    procedure ShowState(Device: TDevice);
    procedure DeviceStateList_HEB_V3;
    procedure Add_A_Device;
  end;

var
  ZDCLJKFrm: TZDCLJKFrm;
implementation
uses umainf, PursueDevFrmUnit, GetAPictureFrmUnit, CmdStructUnit, BackCallTelFrmUnit,
     ControlCarFrmUnit, ControlTerminalFrmUnit, uSendMsg2dev, MSHTML
     {$IFDEF ForAddEKey}, EKeyUseUnit{$ENDIF};
{$R *.dfm}

procedure TZDCLJKFrm.FormShow(Sender: TObject);
var
  FileName, path: string;
  ep: TEarthPoint;
  wp: TWorldPoint;
begin
  try
    Self.Caption := '�ص��س��� ��' + dev.Car.No + '��';
    Dev.SpecialCar := True;

    MouseDev := TDevice.Create;

    Application.OnMessage := ApplicationEvents1Message;
    showMap;
  except on E: Exception do
    begin
      ShowMessage(E.Message);
    end;
  end;
  
end;

procedure TZDCLJKFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Dev.SpecialCar := False;
  SpecialCarList.Remove(@dev.Car.No);
end;

procedure TZDCLJKFrm.Timer1Timer(Sender: TObject);
var
  json: string;
  log, lat: string;
  ColorStr: string;
  GpsTime: string;
  BoundsLatLng: string;
  bounds: array of string;
  MaxLat,MinLog : Double;       // ���Ͻ� (���γ�ȡ���С����)
  MinLat,MaxLog: Double;       // ���½� (��Сγ�ȣ���󾭶�)
  j: Integer;
begin
  try
    if (dev.Switch_Warning[MSG_Warning_0]) or (dev.Switch_Warning[MSG_Warning_1]) or (dev.Switch_Warning[MSG_Warning_2])
      or (dev.Switch_Warning[MSG_Warning_3]) then
    begin
      ColorStr := '2';
    end else
    begin
      ColorStr := '1';
    end;
    if dev.GpsTime = 0 then
      GpsTime := ''
    else
      GpsTime := FormatDateTime('YYYY-MM-DD hh:nn:ss', dev.GpsTime);


    BoundsLatLng := WebBrowser1.OleObject.document.parentWindow.GetBoundsLatLng();
    bounds := Split(BoundsLatLng, ';');
    if Length(bounds) = 2 then
    begin
      j := Pos(',', bounds[0]);
      MinLog := StrToFloat(Copy(bounds[0], 1, j-1));
      MaxLat := StrToFloat(Copy(bounds[0], j+1, Length(bounds[0])));

      j := Pos(',', bounds[1]);
      MaxLog := StrToFloat(Copy(bounds[1], 1, j-1));
      MinLat := StrToFloat(Copy(bounds[1], j+1, Length(bounds[1])));
    end;
    if (dev.Longitude > MinLog) and (dev.Longitude < MaxLog)
        and (dev.Latitude > MinLat) and (dev.Latitude < MaxLat) then
    begin
      log := FloatToStr(dev.Longitude);
      lat := FloatToStr(dev.Latitude);

      json := '{''log'':' + log + ',''lat'':' + lat + ',''IdStr'':'''+ dev.IdStr
          + ''',''CarNo'':''' + dev.Car.No + ''',''ColorStr'':''' + ColorStr
          + ''',''Driver'':''' + Dev.Login_DriverName + '('+Dev.Login_Driver+')' +''',''SIM'':''' + dev.SimNo
          + ''',''SPEED'':''' + FormatFloat('##0.0', Dev.Speed/10)
          + ''',''Orientation'':''' + IntToStr(Dev.Orientation)
          + ''',''OrientationStr'':''' + getCarAngle(Dev.Orientation)
          + ''',''CarColor'':''' + Dev.Car.CPColorStr
          + ''',''City'':''' + Dev.Car.ShengName + Dev.Car.ShiName
          + ''',''IndustryName'':''' + Dev.Car.IndustryName
          + ''',''GpsTime'':''' + GpsTime + '''}';
      json := '[' + json + ']';
      WebBrowser1.OleObject.document.parentWindow.RefreshDevList(json);
    end else
    begin
      WebBrowser1.OleObject.document.parentWindow.Locate_car(dev.Longitude + LogOffSet,
                                                        dev.Latitude + LatOffSet,
                                                        dev.IdStr, dev.car.No, ColorStr,
                                                        Dev.Login_DriverName + '('+Dev.Login_Driver+')', dev.SimNo,
                                                        FormatFloat('##0.0', Dev.Speed/10), Dev.Orientation,
                                                        getCarAngle(Dev.Orientation),
                                                        GpsTime, dev.Car.CPColorStr, dev.Car.IndustryName,
                                                        dev.Car.ShengName + dev.Car.ShiName);
    end;

    ShowState(Dev);
  except
  end;
end;

procedure TZDCLJKFrm.ShowState(Device: TDevice);
var
  i: integer;
  tmpOkStr,tmpNoWarnStr:string;
begin
  tmpOkStr := '-';//����
  tmpNoWarnStr := '-';  //��
  try
    if Device = nil then exit;
    if not Device.First then
    begin
      for i := 1 to DeviceStateList.RowCount - 1 do
      begin
        DeviceStateList.Cells[1, i] := '';
      end;
      DeviceStateList.Cells[0, 2] := '��������';
      DeviceStateList.Cells[0, 3] := '��γ��γ';
      exit;
    end;

    if Device.Switch[MSG_STATE_0] then
      DeviceStateList.Values['ACC״̬'] := '��'
    else
      DeviceStateList.Values['ACC״̬'] := '��';

    if Device.Switch[MSG_STATE_1] then
      DeviceStateList.Values['��λ״̬'] := '��λ'
    else
      DeviceStateList.Values['��λ״̬'] := '�Ƕ�λ';
    if not Device.isOnline then
      DeviceStateList.Values['��λ״̬'] := '������'; //'�Ƕ�λ';sha20110602

    if not Device.Switch[MSG_STATE_2] then
    begin
      DeviceStateList.Cells[0, 2]:= '��γ';
      DeviceStateList.Values['��γ'] := FormatFloat('##0.000000', Device.Latitude);
    end
    else
    begin
      DeviceStateList.Cells[0, 2] := '��γ';
      DeviceStateList.Values['��γ'] := FormatFloat('##0.000000', Device.Latitude);
    end;

    if not Device.Switch[MSG_STATE_3] then
    begin
      DeviceStateList.Cells[0, 3] := '����';
      DeviceStateList.Values['����'] := FormatFloat('##0.000000', Device.Longitude);
    end
    else
    begin
      DeviceStateList.Cells[0, 3] := '����';
      DeviceStateList.Values['����'] := FormatFloat('##0.000000', Device.Longitude);
    end;
    if Device.GpsTime = 0 then
    begin
      DeviceStateList.Values['GPSʱ��'] := '';
      DeviceStateList.Values['GPS����'] := '';
    end
    else
    begin
      DeviceStateList.Values['GPSʱ��'] := FormatDatetime('hh:nn:ss', Device.GpsTime);
      DeviceStateList.Values['GPS����'] := FormatDatetime('yyyy-mm-dd', Device.GpsTime);
    end;

    if Device.OilVolume <= 0 then
    begin
      DeviceStateList.Values['����'] := '';
    end
    else
    begin
      DeviceStateList.Values['����'] := FormatFloat('#0.0', Device.OilVolume) + '��';
    end;
    if Device.Course <= 0 then
    begin
      DeviceStateList.Values['���'] := '';
    end
    else
    begin
      DeviceStateList.Values['���'] := FormatFloat('#0.0', Device.Course) + '����';
    end;

    DeviceStateList.Values['SIM��'] := Device.SimNo;

    if Device.Switch[MSG_STATE_4] then
      DeviceStateList.Values['��Ӫ״̬'] := 'ͣ��'
    else
      DeviceStateList.Values['��Ӫ״̬'] := 'Ӫ��';

    if not Device.Switch[MSG_STATE_5] then
      DeviceStateList.Values['��γ��״̬'] := 'δ����'
    else
      DeviceStateList.Values['��γ��״̬'] := '�Ѽ���';

    if Device.Switch[MSG_STATE_9] then
      DeviceStateList.Values['�ճ��س�'] := '�ճ�'
    else
      DeviceStateList.Values['�ճ��س�'] := '�س�';      

    if Device.Switch[MSG_STATE_10] then
      DeviceStateList.Values['������·'] := '�Ͽ�'
    else
      DeviceStateList.Values['������·'] := tmpOkStr;

   if Device.Switch[MSG_STATE_11] then
      DeviceStateList.Values['������·'] := '�Ͽ�'
   else
      DeviceStateList.Values['������·'] := tmpOkStr;
    if Device.Switch[MSG_STATE_12] then
      DeviceStateList.Values['����״̬'] := '����'
    else
      DeviceStateList.Values['����״̬'] := '����';

    //------------------------������Ϣ
    if Device.Switch_Warning[MSG_WARNING_0] then
      DeviceStateList.Values['��������'] := '��'
    else
      DeviceStateList.Values['��������'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_1] then
      DeviceStateList.Values['���ٱ���'] := '��'
    else
      DeviceStateList.Values['���ٱ���'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_2] then
      DeviceStateList.Values['ƣ�ͼ�ʻ����'] := '��'
    else
      DeviceStateList.Values['ƣ�ͼ�ʻ����'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_3] then
      DeviceStateList.Values['Ԥ��'] := '��'
    else
      DeviceStateList.Values['Ԥ��'] := tmpNoWarnStr;


    if Device.Switch_Warning[MSG_WARNING_4] then
      DeviceStateList.Values['GPSģ��'] := '����'
    else
      DeviceStateList.Values['GPSģ��'] := tmpOkStr;

    if Device.Switch_Warning[MSG_WARNING_5] then
      DeviceStateList.Values['GPS����'] := 'δ�ӻ����'
    else
      DeviceStateList.Values['GPS����'] := tmpOkStr;

    if Device.Switch_Warning[MSG_WARNING_6] then
      DeviceStateList.Values['GPS���߶�·'] := '��'
    else
      DeviceStateList.Values['GPS���߶�·'] := tmpOkStr;

    if Device.Switch_Warning[MSG_WARNING_7] then
       DeviceStateList.Values['�ն�����ԴǷѹ����']:= '��'
    else
      DeviceStateList.Values['�ն�����ԴǷѹ����']:= tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_8] then
       DeviceStateList.Values['�ն�����Դ���籨��']:= '��'
    else
      DeviceStateList.Values['�ն�����Դ���籨��']:= tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_9] then
      DeviceStateList.Values['�ն�LCD����ʾ��'] := '����'
    else
      DeviceStateList.Values['�ն�LCD����ʾ��'] := tmpOkStr;

    if Device.Switch_Warning[MSG_WARNING_10] then
      DeviceStateList.Values['TTSģ��'] := '����'
    else
      DeviceStateList.Values['TTSģ��'] := tmpOkStr;

    if Device.Switch_Warning[MSG_WARNING_11] then
      DeviceStateList.Values['����ͷ'] := '����'
    else
      DeviceStateList.Values['����ͷ'] := tmpOkStr;


    if Device.Switch_Warning[MSG_WARNING_18] then
      DeviceStateList.Values['�����ۼƼ�ʻ��ʱ����'] := '��'
    else
      DeviceStateList.Values['�����ۼƼ�ʻ��ʱ����'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_19] then
      DeviceStateList.Values['��ʱͣ������'] := '��'
    else
      DeviceStateList.Values['��ʱͣ������'] := tmpNoWarnStr;
    if Device.Switch_Warning[MSG_WARNING_20] then
      DeviceStateList.Values['�������򱨾�'] := '��'
    else
      DeviceStateList.Values['�������򱨾�'] := tmpNoWarnStr;
    if Device.Switch_Warning[MSG_WARNING_21] then
      DeviceStateList.Values['����·�߱���'] := '��'
    else
      DeviceStateList.Values['����·�߱���'] := tmpNoWarnStr;
    if Device.Switch_Warning[MSG_WARNING_22] then
      DeviceStateList.Values['·����ʻʱ��'] := '��������'
    else
      DeviceStateList.Values['·����ʻʱ��'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_23] then
      DeviceStateList.Values['·��ƫ�뱨��'] := '��'
    else
      DeviceStateList.Values['·��ƫ�뱨��'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_24] then
      DeviceStateList.Values['����VSS'] := '����'
    else
      DeviceStateList.Values['����VSS'] :=tmpOkStr;
    if Device.Switch_Warning[MSG_WARNING_25] then
      DeviceStateList.Values['��������'] := '�쳣'
    else
      DeviceStateList.Values['��������'] :=tmpOkStr;

    if Device.Switch_Warning[MSG_WARNING_26] then
      DeviceStateList.Values['������������'] := '��'
    else
      DeviceStateList.Values['������������'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_27] then
      DeviceStateList.Values['�����Ƿ���𱨾�'] := '��'
    else
      DeviceStateList.Values['�����Ƿ���𱨾�'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_28] then
      DeviceStateList.Values['�����Ƿ�λ�Ʊ���'] := '��'
    else
      DeviceStateList.Values['�����Ƿ�λ�Ʊ���'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_29] then
      DeviceStateList.Values['��ײ�෭��������'] := '��'
    else
      DeviceStateList.Values['��ײ�෭��������'] := tmpNoWarnStr;

  except on E: Exception do
      uGloabVar.SystemLog.AddLog(' TMainf.ShowState��������: ', e.Message);
  end;
end;

procedure TZDCLJKFrm.DeviceStateListDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
  procedure DoAlarmProcess(AlarmName,Alarmstr:string); //���౨��
  var
    row: integer;
  begin
    if DeviceStateList.Values[AlarmName] = Alarmstr then
    begin
      DeviceStateList.FindRow(AlarmName, row);
      if Arow = row then
      begin
        TValueListEditorAccess(Sender).Canvas.Brush.Color := $00C0DCC0;
        TValueListEditorAccess(Sender).Canvas.Font.Color := clred; //��ɫ����ʾ
      end;
    end;
  end;
  procedure DoErrProcess(ErrName,ErrStr:String); //�������
  var
    row: integer;
  begin
    if DeviceStateList.Values[ErrName] = ErrStr then
    begin
      DeviceStateList.FindRow(ErrName, row);
      if Arow = row then
      begin
        TValueListEditorAccess(Sender).Canvas.Brush.Color := $00C0DCC0;
        TValueListEditorAccess(Sender).Canvas.Font.Color := clGreen; //��ɫ����ʾ
      end;
    end;
  end;      
begin
  TValueListEditorAccess(Sender).OnDrawCell := nil;
  DoErrProcess('��λ״̬','����');

  DoAlarmProcess('��������','��');
  DoAlarmProcess('Ԥ��','��');
  DoAlarmProcess('���ٱ���','��');
  DoAlarmProcess('ƣ�ͼ�ʻ����','��');
  DoAlarmProcess('�ն�����ԴǷѹ����','��');
  DoAlarmProcess('�ն�����Դ���籨��','��');
  DoAlarmProcess('�����ۼƼ�ʻ��ʱ����','��');
  DoAlarmProcess('��ʱͣ������','��');
  DoAlarmProcess('�������򱨾�','��');
  DoAlarmProcess('����·�߱���','��');
  DoAlarmProcess('·����ʻʱ��','��������');
  DoAlarmProcess('·��ƫ�뱨��','��');
  DoAlarmProcess('������������','��');
  DoAlarmProcess('�����Ƿ���𱨾�','��');
  DoAlarmProcess('�����Ƿ�λ�Ʊ���','��');
  DoAlarmProcess('��ײ�෭��������','��');

  DoErrProcess('GPSģ��','����');
  DoErrProcess('GPS����','δ�ӻ����');
  DoErrProcess('GPS���߶�·','��');
  DoErrProcess('�ն�LCD����ʾ��','����');
  DoErrProcess('TTSģ��','����');
  DoErrProcess('����ͷ','����');
  DoErrProcess('����VSS','����');
  DoErrProcess('��������','�쳣');

  TValueListEditorAccess(Sender).DrawCell(ACol, ARow, Rect, State);
  TValueListEditorAccess(Sender).OnDrawCell := DeviceStateListDrawCell;
end;

procedure TZDCLJKFrm.DeviceStateList_HEB_V3;
begin
  DeviceStateList.Strings.Clear;
  DeviceStateList.Strings.Add('��λ״̬=');
  DeviceStateList.Strings.Add('��������=');
  DeviceStateList.Strings.Add('��γ��γ=');
  DeviceStateList.Strings.Add('ACC״̬=');
  DeviceStateList.Strings.Add('�ճ��س�=');
  DeviceStateList.Strings.Add('��Ӫ״̬=');
  DeviceStateList.Strings.Add('������·=');
  DeviceStateList.Strings.Add('������·=');
  DeviceStateList.Strings.Add('ԤԼ״̬=');
  DeviceStateList.Strings.Add('����״̬=');
  
  DeviceStateList.Strings.Add('��������=');
  DeviceStateList.Strings.Add('Ԥ��=');
  DeviceStateList.Strings.Add('GPSģ��=');
  DeviceStateList.Strings.Add('GPS����=');
  DeviceStateList.Strings.Add('GPS���߶�·=');
  DeviceStateList.Strings.Add('�ն�����ԴǷѹ=');
  DeviceStateList.Strings.Add('�ն�����Դ����=');
  DeviceStateList.Strings.Add('�ն�LCD����ʾ��=');
  DeviceStateList.Strings.Add('TTSģ��=');
  DeviceStateList.Strings.Add('����ͷ=');
  DeviceStateList.Strings.Add('�Ƽ���=');

  DeviceStateList.Strings.Add('����������=');
  DeviceStateList.Strings.Add('LED�����=');
  DeviceStateList.Strings.Add('LCD��ʾ��=');
  DeviceStateList.Strings.Add('TSM��ȫģ��=');
  DeviceStateList.Strings.Add('LED����=');

  DeviceStateList.Strings.Add('���ٱ���=');
  DeviceStateList.Strings.Add('������ʻ=');
  DeviceStateList.Strings.Add('�����ۼƼ�ʻ=');
  DeviceStateList.Strings.Add('ͣ��=');
 // DeviceStateList.Strings.Add('��������/·��=');

  DeviceStateList.Strings.Add('·����ʻʱ��=');
  DeviceStateList.Strings.Add('����·����ʻ=');
  DeviceStateList.Strings.Add('����VSS=');
  //DeviceStateList.Strings.Add('��������=');
  //DeviceStateList.Strings.Add('��������=');
  DeviceStateList.Strings.Add('�������=');
  DeviceStateList.Strings.Add('������λ=');

  DeviceStateList.Strings.Add('GPS����=');
  DeviceStateList.Strings.Add('GPSʱ��=');
end;

procedure TZDCLJKFrm.ToolButton6Click(Sender: TObject);
var
  ep: TEarthPoint;
  wp: TWorldPoint;
begin
  ep.Longitude := dev.Longitude;
  ep.Latitude := dev.Latitude;
  if (ep.Longitude = 0) and (ep.Latitude = 0) then
    PopMsg('��ʾ', '�Բ��𣬴˳�û��GPS����!�޷���λ!')
  else
  begin
    //if GlobalParam.isAutoChangeMap then Mainf.fun_ChangeMap.Execute;
    wp := FMap1.Projection.LoLa2XY(ep);
    FMap1.Zoom(1, wp);
    FMap1.Draw;
  end;
end;

procedure TZDCLJKFrm.Add_A_Device;
begin
  if FListView_SelectDevs = nil then exit;
  if Dev = nil then exit;
  FListView_SelectDevs.Clear;
  with FListView_SelectDevs.Items.Add do
  begin
    caption := Dev.Car.No;
    data := Dev;
  end;
end;

procedure TZDCLJKFrm.N17Click(Sender: TObject);
var
  frm: TPursueDevFrm;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  frm := TPursueDevFrm.Create(Self);
  try
    //frm.ListView1.PopupMenu := umainf.PopupMenu_SelectDevs; {����ѡ���� ��ͳһ��ѡ��������}
    FListView_SelectDevs := frm.ListView1;
    Add_A_Device;
    frm.ShowModal;
  finally
    frm.Free;
  end;
end;

procedure TZDCLJKFrm.N62Click(Sender: TObject);
var
  dlg: TGetAPictureFrm;
  i, n: integer;
  dev: TDevice;

  CameraIndex: Byte; //����ͷ��
  CameraCmd: Word;  // ��������
  PZSJJG: Word;   // ����ʱ����
  SaveSign: Byte; // �����־
  GetPicSize: Byte; //��Ƭ�ߴ��С 0=320x240  1=640x480  2-else
  TXZL: Byte; // ͼ������
  LD: Byte;   // ����
  DBD: Byte;  // �Աȶ�
  BHD: Byte;  // ���Ͷ�
  SD: Byte;
//  grp: TDevGroup;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  //If not HasPrivilege(PRI_CALL) then exit;
  dlg := TGetAPictureFrm.Create(self);
  try
    {����ѡ���� ��ͳһ��ѡ��������}
    FListView_SelectDevs := dlg.ListView1;

    Add_A_Device;

    dlg.ShowModal;
    if dlg.ModalResult = mrok then //������ȡ����
    begin
      n := dlg.ListView1.Items.Count;
      if n = 0 then
      begin
        messagebox(handle, pchar('�����ִ�У�û��ָ������'), '��ʾ', mb_ok + mb_iconinformation);
        exit;
      end;

      for i := 0 to dlg.ListView1.Items.Count - 1 do
      begin
        if dlg.Cancel then
        begin
          if messagebox(handle, '�Ƿ�ȷʵҪȡ����ʣ�೵���Ĳ�����', '��ʾ', MB_YESNO + MB_ICONQUESTION) = ID_YES then
          begin
            dlg.Close;
            Exit;
          end
          else
          begin
            dlg.Cancel := False;
          end;
        end;
        dev := TDevice(dlg.ListView1.Items.Item[i].Data);
        if dev <> nil then
        begin
          CameraIndex := dlg.ComboBoxCamera.ItemIndex;
          if dlg.ComboBoxCameraCmd.ItemIndex = 0 then
            CameraCmd := 0
          else if dlg.ComboBoxCameraCmd.ItemIndex = 1 then
            CameraCmd := $FFFF
          else
            CameraCmd := StringToInteger(Trim(dlg.editZS.Text));    // ��������
          PZSJJG := StringToInteger(Trim(dlg.editSJJG.Text));
          if dlg.radio1.Checked then
            SaveSign := 1 // �����־
          else if dlg.radio2.Checked then
            SaveSign := 0;
          GetPicSize := dlg.ComboBoxSize.ItemIndex; //��Ƭ�ߴ��С 0=320x240  1=640x480  2-else
          TXZL := StringToInteger(Trim(dlg.editTXZL.Text), 1); // ͼ������
          LD := StringToInteger(Trim(dlg.editLD.Text));   // ����
          DBD := StringToInteger(Trim(dlg.editDBD.Text));  // �Աȶ�
          BHD := StringToInteger(Trim(dlg.editBHD.Text));  // ���Ͷ�
          SD := StringToInteger(Trim(dlg.editSD.Text));
          DataServer.GetAPicture(dev, CameraIndex, CameraCmd, PZSJJG, SaveSign, GetPicSize, TXZL, LD, DBD, BHD, SD);
        end;
        sleep(50);
        Application.ProcessMessages;
      end;
    end;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TZDCLJKFrm.N4Click(Sender: TObject);
var
  dlg: TBackCallTelFrm;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  dlg := TBackCallTelFrm.Create(self);
  try
    {����ѡ���� ��ͳһ��ѡ��������}
    //dlg.ListView1.PopupMenu := PopupMenu_SelectDevs;
    FListView_SelectDevs := dlg.ListView1;
    Add_A_Device;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TZDCLJKFrm.N125Click(Sender: TObject);
var
  dlg: TControlCarFrm;
  password: string;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  if InputQuery('����������', '���룺   ', password) then
  begin
    if password <> current_user.Password then
    begin
      MessageBox(Handle, '���벻��ȷ', '��ʾ', MB_OK + MB_ICONWARNING);
      Exit;
    end;
  end
  else
    Exit;

  dlg := TControlCarFrm.Create(self);
  try
    {����ѡ���� ��ͳһ��ѡ��������}
    FListView_SelectDevs := dlg.ListView1;
    Add_A_Device;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TZDCLJKFrm.N91Click(Sender: TObject);
var
  dlg: TControlTerminalFrm;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  dlg := TControlTerminalFrm.Create(self);
  try
    {����ѡ���� ��ͳһ��ѡ��������}
    FListView_SelectDevs := dlg.ListView1;
    Add_A_Device;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;

procedure TZDCLJKFrm.N2Click(Sender: TObject);
var
  dlg: TSendMsg2Dev;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  dlg := TsendMsg2dev.Create(self);
  try
    dlg.Tag := MSGTYPE_NEEDANSWER;
    dlg.Memo1.Lines.Clear;
    if LastSendMsg_NeedAnswer <> '' then dlg.Memo1.Lines.Add(LastSendMsg_NeedAnswer);
    FListView_SelectDevs := dlg.ListView1;
    dlg.Caption := '������Ϣ';
    Add_A_Device;
    dlg.ShowModal;
  finally
    dlg.Free;
    FListView_SelectDevs := nil;
  end;
end;



procedure TZDCLJKFrm.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
var
  mPoint: TPoint;
begin
  if IsChild(WebBrowser1.Handle, Msg.Hwnd)   and
     ((Msg.Message = WM_RBUTTONDOWN) or (Msg.Message = WM_RBUTTONUP)) then
  begin
      GetCursorPos(mPoint);
      PopupMenu_funDev.Popup(mPoint.X, mPoint.Y);
      Handled:=True;
  end;
end;

procedure TZDCLJKFrm.Panel_MapCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  try
    WebBrowser1.OleObject.document.parentWindow.SetMapDiv(NewWidth, NewHeight);
  except
  end;
end;

procedure TZDCLJKFrm.FormCreate(Sender: TObject);
begin
  f := TExternalContainer.Create(WebBrowser1);
end;

procedure TZDCLJKFrm.FormDestroy(Sender: TObject);
begin
  f.Free;
  MouseDev.Free;
end;

procedure TZDCLJKFrm.WebBrowser1DocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
var
  s: string;
begin
  s := (WebBrowser1.Document as IHTMLDocument2).body.innerText;
  if (Pos('HTTP Status 404', s) > 0) then
  begin
    showMap;
  end;
end;

procedure TZDCLJKFrm.showMap;
var
  url: string;
begin
  try
    url := 'http://'+ GlobalParam.MapServerIp;
    if GlobalParam.MapServerPort <> 0 then
      url := url + ':' + IntToStr(GlobalParam.MapServerPort);
    url := url + '/ZDJKmap.html';
    WebBrowser1.Navigate(url);
  except on E: Exception do
    begin
      ShowMessage(E.Message);
    end;
  end;
end;

end.
