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
    //GPS图层
    drawlayer: TGpsDrawLayer;
    datalayer: TGpsDataLayer;
        //区域图层
    userDrawLayer: TAreaDrawLayer;
    userDataLayer: TDataLayer;

    //围栏图层
    AlarmNoSybolLayer: TAlarmNoSybolLayer;
    AlarmNoDataLayer: TDataLayer;

    //用户自定义图层
    TextLayer: TUserDefinedTextLayer;
    TextDataLayer: TDataLayer;

    //地图节点管理器.管理所有的地图配置
    MapManger: TMapManger;
    //把鼠标当作一个车机来处理.主要是解决当前鼠机显示在哪个省市县
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
    Self.Caption := '重点监控车辆 【' + dev.Car.No + '】';
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
  MaxLat,MinLog : Double;       // 左上角 (最大纬度、最小经度)
  MinLat,MaxLog: Double;       // 右下角 (最小纬度，最大经度)
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
  tmpOkStr := '-';//正常
  tmpNoWarnStr := '-';  //否
  try
    if Device = nil then exit;
    if not Device.First then
    begin
      for i := 1 to DeviceStateList.RowCount - 1 do
      begin
        DeviceStateList.Cells[1, i] := '';
      end;
      DeviceStateList.Cells[0, 2] := '东经西经';
      DeviceStateList.Cells[0, 3] := '南纬北纬';
      exit;
    end;

    if Device.Switch[MSG_STATE_0] then
      DeviceStateList.Values['ACC状态'] := '开'
    else
      DeviceStateList.Values['ACC状态'] := '关';

    if Device.Switch[MSG_STATE_1] then
      DeviceStateList.Values['定位状态'] := '定位'
    else
      DeviceStateList.Values['定位状态'] := '非定位';
    if not Device.isOnline then
      DeviceStateList.Values['定位状态'] := '不在线'; //'非定位';sha20110602

    if not Device.Switch[MSG_STATE_2] then
    begin
      DeviceStateList.Cells[0, 2]:= '北纬';
      DeviceStateList.Values['北纬'] := FormatFloat('##0.000000', Device.Latitude);
    end
    else
    begin
      DeviceStateList.Cells[0, 2] := '南纬';
      DeviceStateList.Values['南纬'] := FormatFloat('##0.000000', Device.Latitude);
    end;

    if not Device.Switch[MSG_STATE_3] then
    begin
      DeviceStateList.Cells[0, 3] := '东经';
      DeviceStateList.Values['东经'] := FormatFloat('##0.000000', Device.Longitude);
    end
    else
    begin
      DeviceStateList.Cells[0, 3] := '西经';
      DeviceStateList.Values['西经'] := FormatFloat('##0.000000', Device.Longitude);
    end;
    if Device.GpsTime = 0 then
    begin
      DeviceStateList.Values['GPS时间'] := '';
      DeviceStateList.Values['GPS日期'] := '';
    end
    else
    begin
      DeviceStateList.Values['GPS时间'] := FormatDatetime('hh:nn:ss', Device.GpsTime);
      DeviceStateList.Values['GPS日期'] := FormatDatetime('yyyy-mm-dd', Device.GpsTime);
    end;

    if Device.OilVolume <= 0 then
    begin
      DeviceStateList.Values['油量'] := '';
    end
    else
    begin
      DeviceStateList.Values['油量'] := FormatFloat('#0.0', Device.OilVolume) + '升';
    end;
    if Device.Course <= 0 then
    begin
      DeviceStateList.Values['里程'] := '';
    end
    else
    begin
      DeviceStateList.Values['里程'] := FormatFloat('#0.0', Device.Course) + '公里';
    end;

    DeviceStateList.Values['SIM卡'] := Device.SimNo;

    if Device.Switch[MSG_STATE_4] then
      DeviceStateList.Values['运营状态'] := '停运'
    else
      DeviceStateList.Values['运营状态'] := '营运';

    if not Device.Switch[MSG_STATE_5] then
      DeviceStateList.Values['经纬度状态'] := '未加密'
    else
      DeviceStateList.Values['经纬度状态'] := '已加密';

    if Device.Switch[MSG_STATE_9] then
      DeviceStateList.Values['空车重车'] := '空车'
    else
      DeviceStateList.Values['空车重车'] := '重车';      

    if Device.Switch[MSG_STATE_10] then
      DeviceStateList.Values['车辆油路'] := '断开'
    else
      DeviceStateList.Values['车辆油路'] := tmpOkStr;

   if Device.Switch[MSG_STATE_11] then
      DeviceStateList.Values['车辆电路'] := '断开'
   else
      DeviceStateList.Values['车辆电路'] := tmpOkStr;
    if Device.Switch[MSG_STATE_12] then
      DeviceStateList.Values['车门状态'] := '加锁'
    else
      DeviceStateList.Values['车门状态'] := '解锁';

    //------------------------报警信息
    if Device.Switch_Warning[MSG_WARNING_0] then
      DeviceStateList.Values['紧急报警'] := '是'
    else
      DeviceStateList.Values['紧急报警'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_1] then
      DeviceStateList.Values['超速报警'] := '是'
    else
      DeviceStateList.Values['超速报警'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_2] then
      DeviceStateList.Values['疲劳驾驶报警'] := '是'
    else
      DeviceStateList.Values['疲劳驾驶报警'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_3] then
      DeviceStateList.Values['预警'] := '是'
    else
      DeviceStateList.Values['预警'] := tmpNoWarnStr;


    if Device.Switch_Warning[MSG_WARNING_4] then
      DeviceStateList.Values['GPS模块'] := '故障'
    else
      DeviceStateList.Values['GPS模块'] := tmpOkStr;

    if Device.Switch_Warning[MSG_WARNING_5] then
      DeviceStateList.Values['GPS天线'] := '未接或剪断'
    else
      DeviceStateList.Values['GPS天线'] := tmpOkStr;

    if Device.Switch_Warning[MSG_WARNING_6] then
      DeviceStateList.Values['GPS天线短路'] := '是'
    else
      DeviceStateList.Values['GPS天线短路'] := tmpOkStr;

    if Device.Switch_Warning[MSG_WARNING_7] then
       DeviceStateList.Values['终端主电源欠压报警']:= '是'
    else
      DeviceStateList.Values['终端主电源欠压报警']:= tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_8] then
       DeviceStateList.Values['终端主电源掉电报警']:= '是'
    else
      DeviceStateList.Values['终端主电源掉电报警']:= tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_9] then
      DeviceStateList.Values['终端LCD或显示器'] := '故障'
    else
      DeviceStateList.Values['终端LCD或显示器'] := tmpOkStr;

    if Device.Switch_Warning[MSG_WARNING_10] then
      DeviceStateList.Values['TTS模块'] := '故障'
    else
      DeviceStateList.Values['TTS模块'] := tmpOkStr;

    if Device.Switch_Warning[MSG_WARNING_11] then
      DeviceStateList.Values['摄像头'] := '故障'
    else
      DeviceStateList.Values['摄像头'] := tmpOkStr;


    if Device.Switch_Warning[MSG_WARNING_18] then
      DeviceStateList.Values['当天累计驾驶超时报警'] := '是'
    else
      DeviceStateList.Values['当天累计驾驶超时报警'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_19] then
      DeviceStateList.Values['超时停车报警'] := '是'
    else
      DeviceStateList.Values['超时停车报警'] := tmpNoWarnStr;
    if Device.Switch_Warning[MSG_WARNING_20] then
      DeviceStateList.Values['进出区域报警'] := '是'
    else
      DeviceStateList.Values['进出区域报警'] := tmpNoWarnStr;
    if Device.Switch_Warning[MSG_WARNING_21] then
      DeviceStateList.Values['进出路线报警'] := '是'
    else
      DeviceStateList.Values['进出路线报警'] := tmpNoWarnStr;
    if Device.Switch_Warning[MSG_WARNING_22] then
      DeviceStateList.Values['路段行驶时间'] := '不足或过长'
    else
      DeviceStateList.Values['路段行驶时间'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_23] then
      DeviceStateList.Values['路线偏离报警'] := '是'
    else
      DeviceStateList.Values['路线偏离报警'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_24] then
      DeviceStateList.Values['车辆VSS'] := '故障'
    else
      DeviceStateList.Values['车辆VSS'] :=tmpOkStr;
    if Device.Switch_Warning[MSG_WARNING_25] then
      DeviceStateList.Values['车辆油量'] := '异常'
    else
      DeviceStateList.Values['车辆油量'] :=tmpOkStr;

    if Device.Switch_Warning[MSG_WARNING_26] then
      DeviceStateList.Values['车辆被盗报警'] := '是'
    else
      DeviceStateList.Values['车辆被盗报警'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_27] then
      DeviceStateList.Values['车辆非法点火报警'] := '是'
    else
      DeviceStateList.Values['车辆非法点火报警'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_28] then
      DeviceStateList.Values['车辆非法位移报警'] := '是'
    else
      DeviceStateList.Values['车辆非法位移报警'] := tmpNoWarnStr;

    if Device.Switch_Warning[MSG_WARNING_29] then
      DeviceStateList.Values['碰撞侧翻报警报警'] := '是'
    else
      DeviceStateList.Values['碰撞侧翻报警报警'] := tmpNoWarnStr;

  except on E: Exception do
      uGloabVar.SystemLog.AddLog(' TMainf.ShowState函数报错: ', e.Message);
  end;
end;

procedure TZDCLJKFrm.DeviceStateListDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
  procedure DoAlarmProcess(AlarmName,Alarmstr:string); //各类报警
  var
    row: integer;
  begin
    if DeviceStateList.Values[AlarmName] = Alarmstr then
    begin
      DeviceStateList.FindRow(AlarmName, row);
      if Arow = row then
      begin
        TValueListEditorAccess(Sender).Canvas.Brush.Color := $00C0DCC0;
        TValueListEditorAccess(Sender).Canvas.Font.Color := clred; //红色字显示
      end;
    end;
  end;
  procedure DoErrProcess(ErrName,ErrStr:String); //各类故障
  var
    row: integer;
  begin
    if DeviceStateList.Values[ErrName] = ErrStr then
    begin
      DeviceStateList.FindRow(ErrName, row);
      if Arow = row then
      begin
        TValueListEditorAccess(Sender).Canvas.Brush.Color := $00C0DCC0;
        TValueListEditorAccess(Sender).Canvas.Font.Color := clGreen; //绿色字显示
      end;
    end;
  end;      
begin
  TValueListEditorAccess(Sender).OnDrawCell := nil;
  DoErrProcess('定位状态','休眠');

  DoAlarmProcess('紧急报警','是');
  DoAlarmProcess('预警','是');
  DoAlarmProcess('超速报警','是');
  DoAlarmProcess('疲劳驾驶报警','是');
  DoAlarmProcess('终端主电源欠压报警','是');
  DoAlarmProcess('终端主电源掉电报警','是');
  DoAlarmProcess('当天累计驾驶超时报警','是');
  DoAlarmProcess('超时停车报警','是');
  DoAlarmProcess('进出区域报警','是');
  DoAlarmProcess('进出路线报警','是');
  DoAlarmProcess('路段行驶时间','不足或过长');
  DoAlarmProcess('路线偏离报警','是');
  DoAlarmProcess('车辆被盗报警','是');
  DoAlarmProcess('车辆非法点火报警','是');
  DoAlarmProcess('车辆非法位移报警','是');
  DoAlarmProcess('碰撞侧翻报警报警','是');

  DoErrProcess('GPS模块','故障');
  DoErrProcess('GPS天线','未接或剪断');
  DoErrProcess('GPS天线短路','是');
  DoErrProcess('终端LCD或显示器','故障');
  DoErrProcess('TTS模块','故障');
  DoErrProcess('摄像头','故障');
  DoErrProcess('车辆VSS','故障');
  DoErrProcess('车辆油量','异常');

  TValueListEditorAccess(Sender).DrawCell(ACol, ARow, Rect, State);
  TValueListEditorAccess(Sender).OnDrawCell := DeviceStateListDrawCell;
end;

procedure TZDCLJKFrm.DeviceStateList_HEB_V3;
begin
  DeviceStateList.Strings.Clear;
  DeviceStateList.Strings.Add('定位状态=');
  DeviceStateList.Strings.Add('西经东经=');
  DeviceStateList.Strings.Add('南纬北纬=');
  DeviceStateList.Strings.Add('ACC状态=');
  DeviceStateList.Strings.Add('空车重车=');
  DeviceStateList.Strings.Add('运营状态=');
  DeviceStateList.Strings.Add('车辆油路=');
  DeviceStateList.Strings.Add('车辆电路=');
  DeviceStateList.Strings.Add('预约状态=');
  DeviceStateList.Strings.Add('车门状态=');
  
  DeviceStateList.Strings.Add('紧急报警=');
  DeviceStateList.Strings.Add('预警=');
  DeviceStateList.Strings.Add('GPS模块=');
  DeviceStateList.Strings.Add('GPS天线=');
  DeviceStateList.Strings.Add('GPS天线短路=');
  DeviceStateList.Strings.Add('终端主电源欠压=');
  DeviceStateList.Strings.Add('终端主电源掉电=');
  DeviceStateList.Strings.Add('终端LCD或显示器=');
  DeviceStateList.Strings.Add('TTS模块=');
  DeviceStateList.Strings.Add('摄像头=');
  DeviceStateList.Strings.Add('计价器=');

  DeviceStateList.Strings.Add('服务评价器=');
  DeviceStateList.Strings.Add('LED广告屏=');
  DeviceStateList.Strings.Add('LCD显示屏=');
  DeviceStateList.Strings.Add('TSM安全模块=');
  DeviceStateList.Strings.Add('LED顶灯=');

  DeviceStateList.Strings.Add('超速报警=');
  DeviceStateList.Strings.Add('连续驾驶=');
  DeviceStateList.Strings.Add('当天累计驾驶=');
  DeviceStateList.Strings.Add('停车=');
 // DeviceStateList.Strings.Add('进出区域/路线=');

  DeviceStateList.Strings.Add('路段行驶时间=');
  DeviceStateList.Strings.Add('禁行路段行驶=');
  DeviceStateList.Strings.Add('车辆VSS=');
  //DeviceStateList.Strings.Add('车辆油量=');
  //DeviceStateList.Strings.Add('车辆被盗=');
  DeviceStateList.Strings.Add('车辆点火=');
  DeviceStateList.Strings.Add('车辆移位=');

  DeviceStateList.Strings.Add('GPS日期=');
  DeviceStateList.Strings.Add('GPS时间=');
end;

procedure TZDCLJKFrm.ToolButton6Click(Sender: TObject);
var
  ep: TEarthPoint;
  wp: TWorldPoint;
begin
  ep.Longitude := dev.Longitude;
  ep.Latitude := dev.Latitude;
  if (ep.Longitude = 0) and (ep.Latitude = 0) then
    PopMsg('提示', '对不起，此车没有GPS数据!无法定位!')
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
    //frm.ListView1.PopupMenu := umainf.PopupMenu_SelectDevs; {重新选择车辆 用统一的选择车辆窗体}
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

  CameraIndex: Byte; //摄像头号
  CameraCmd: Word;  // 拍照命令
  PZSJJG: Word;   // 拍照时间间隔
  SaveSign: Byte; // 保存标志
  GetPicSize: Byte; //照片尺寸大小 0=320x240  1=640x480  2-else
  TXZL: Byte; // 图像质量
  LD: Byte;   // 亮度
  DBD: Byte;  // 对比度
  BHD: Byte;  // 饱和度
  SD: Byte;
//  grp: TDevGroup;
begin
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  //If not HasPrivilege(PRI_CALL) then exit;
  dlg := TGetAPictureFrm.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
    FListView_SelectDevs := dlg.ListView1;

    Add_A_Device;

    dlg.ShowModal;
    if dlg.ModalResult = mrok then //处理　读取车辆
    begin
      n := dlg.ListView1.Items.Count;
      if n = 0 then
      begin
        messagebox(handle, pchar('命令不能执行，没有指定车辆'), '提示', mb_ok + mb_iconinformation);
        exit;
      end;

      for i := 0 to dlg.ListView1.Items.Count - 1 do
      begin
        if dlg.Cancel then
        begin
          if messagebox(handle, '是否确实要取消对剩余车辆的操作？', '提示', MB_YESNO + MB_ICONQUESTION) = ID_YES then
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
            CameraCmd := StringToInteger(Trim(dlg.editZS.Text));    // 拍照命令
          PZSJJG := StringToInteger(Trim(dlg.editSJJG.Text));
          if dlg.radio1.Checked then
            SaveSign := 1 // 保存标志
          else if dlg.radio2.Checked then
            SaveSign := 0;
          GetPicSize := dlg.ComboBoxSize.ItemIndex; //照片尺寸大小 0=320x240  1=640x480  2-else
          TXZL := StringToInteger(Trim(dlg.editTXZL.Text), 1); // 图像质量
          LD := StringToInteger(Trim(dlg.editLD.Text));   // 亮度
          DBD := StringToInteger(Trim(dlg.editDBD.Text));  // 对比度
          BHD := StringToInteger(Trim(dlg.editBHD.Text));  // 饱和度
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
    {重新选择车辆 用统一的选择车辆窗体}
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
  if InputQuery('请输入密码', '密码：   ', password) then
  begin
    if password <> current_user.Password then
    begin
      MessageBox(Handle, '密码不正确', '提示', MB_OK + MB_ICONWARNING);
      Exit;
    end;
  end
  else
    Exit;

  dlg := TControlCarFrm.Create(self);
  try
    {重新选择车辆 用统一的选择车辆窗体}
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
    {重新选择车辆 用统一的选择车辆窗体}
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
    dlg.Caption := '发送信息';
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
