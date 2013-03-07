{����ط�ʱ��ε���ʻ��� 2006-2-24
  }
unit FormHisMainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ActnList, GpsLibUnit, BusinessServerUnit,
  mapplatform, ExtCtrls, emapker, DB, udata_display, ComCtrls, //uflash,
  MapControlUnit, MetaDefine, emapctrl, CarUnit, mapoutlook, TrackPlayUnit,
  CmdStructUnit, StdCtrls, ToolWin, ImgList, se_controls, ksskinstatusbar,
  Buttons, Grids,Gauges, ValEdit, KsSkinTrackBars, cxControls, cxContainer,
   cxTrackBar,  AppEvnts,   ADODB,math,
  uFrmRefreshProgress, TeEngine, Series, TeeProcs, Chart, DbChart, DBClient,
  cxSplitter, RzTabs, RemoteTrackPlayUnit,
  TeePrevi,FrmHisListAddrUnit, SHDocVw, RzLabel;

const
  INVALIDSPEED = 300;   //��Ч���ٶ�ֵ
type
  TOutOneInfo = procedure(gpstime:string;speed,longi,lati:Double;locateStr,addr:string) of object;
  TOutSpeedMaxAvgInfo = procedure(s:string) of object;

  TFormHisMain = class;

  TOutAddrListThread = class(TThread)
  protected
    procedure Execute; override;
  private
    gpsTime,locatStr,longiStr,latiStr,addrStr  :string;
    speed:Double;
    maxAvgSpeedStr:string;
    FBufGpsDataAry: array of TQueryHistoryGpsData_V3;
    FBufCnt : Integer;    
  private
    dlg :TFrmHisListAddr;
    progressDlg :TFrmRefreshProgress;

    function ReturnAddrByLongLati(longi, lati: double): string;
    procedure SysOutOneInfo;
    procedure SysShowMaxAvgSpeed;
    procedure SysAddProgress;
    procedure SynCloseDlgProgress;
  public
    constructor Create();
    destructor Destroy(); override;
    procedure SetBufInfo(FTrackPlay :TTrackPlay);
  end;


  //CMap = class(TGpsPlayMap);
  TFormHisMain = class(TForm)
    ActionList1: TActionList;
    TimerPlay: TTimer;
    ActionPlayFile: TAction;
    play_start: TAction;
    play_pause: TAction;
    play_stop: TAction;
    tool_not_select: TAction;
    tool_zoom_in: TAction;
    tool_zoom_out: TAction;
    tool_move: TAction;
    tool_select_point: TAction;
    tool_layer_control: TAction;
    tool_distance: TAction;
    tool_locate: TAction;
    tool_bird_eye: TAction;
    PopupMenu3: TPopupMenu;
    N24: TMenuItem;
    N37: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N29: TMenuItem;
    N36: TMenuItem;
    N30: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N38: TMenuItem;
    N35: TMenuItem;
    N3: TMenuItem;
    play_speed_control: TAction;
    show_car: TAction;
    help_help: TAction;
    help_about: TAction;
    help_exit: TAction;
    ActionPlayServer: TAction;
    play_StepByStep: TAction;
    show_CarTrack: TAction;
    map_OpenLayer: TAction;
    map_CloseLayer: TAction;
    Timer_stepByStep: TTimer;
    play_goOn: TAction;
    set_trackPen: TAction;
    ApplicationEvents1: TApplicationEvents;
    Save_MapLayer: TAction;
    play_BackAStep: TAction;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ActionSaveServerData2File: TAction;
    ActionOutputData: TAction;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    Timer1: TTimer;
    Panel5: TPanel;
    Gauge1: TGauge;
    Panel6: TPanel;
    Label6: TLabel;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton1: TSpeedButton;
    btnStop: TSpeedButton;
    LabelSpeed: TLabel;
    Label_played: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    TrackBar_Play: TSeSkinTrackBar;
    TrackBar_Speed: TSeSkinTrackBar;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    BitBtnShowListInfo: TBitBtn;
    Panel3: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtnOutData: TBitBtn;
    BitBtnCal: TBitBtn;
    EditRunkm: TEdit;
    Panel2: TPanel;
    Label5: TLabel;
    Label11: TLabel;
    EditHisDisplayCarNo: TEdit;
    EditFromTime: TEdit;
    EditToTime: TEdit;
    lblAddGpsCountTip: TRzLabel;
    lblClearGpsHisTip: TRzLabel;
    procedure FormCreate(Sender: TObject);
    procedure TimerPlayTimer(Sender: TObject);
    procedure ActionPlayFileExecute(Sender: TObject);
    procedure TrackBarOutlookChange(Sender: TObject);
    procedure tool_not_selectExecute(Sender: TObject);
    procedure tool_zoom_inExecute(Sender: TObject);
    procedure tool_zoom_outExecute(Sender: TObject);
    procedure tool_moveExecute(Sender: TObject);
    procedure tool_locateExecute(Sender: TObject);
    procedure tool_distanceExecute(Sender: TObject);
    procedure tool_select_pointExecute(Sender: TObject);
    procedure tool_layer_controlExecute(Sender: TObject);
    procedure play_startExecute(Sender: TObject);
    procedure play_pauseExecute(Sender: TObject);
    procedure play_stopExecute(Sender: TObject);
    procedure play_speed_controlExecute(Sender: TObject);
    procedure play_StepByStepExecute(Sender: TObject);
    procedure show_CarTrackExecute(Sender: TObject);
    procedure map_OpenLayerExecute(Sender: TObject);
    procedure map_CloseLayerExecute(Sender: TObject);
    procedure SpeedButton1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedButton1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer_stepByStepTimer(Sender: TObject);
    procedure play_goOnExecute(Sender: TObject);
    procedure set_trackPenExecute(Sender: TObject);
    procedure help_exitExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TrackBar_PlayChange(Sender: TObject);
    procedure TrackBar_PlayMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure Save_MapLayerExecute(Sender: TObject);
    procedure Splitter1AfterOpen(Sender: TObject);
    procedure play_BackAStepExecute(Sender: TObject);
    procedure BitBtnCalClick(Sender: TObject);
    procedure ActionSaveServerData2FileExecute(Sender: TObject);
    procedure ActionOutputDataExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditAPageDrawCnt2KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtnShowListInfoClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    function SaveServerData2File(AFileName: String): Boolean;
    function OutGpsDataForMapinfo(AFileName: String): Boolean;
    procedure DoOnOutAddrListTerminate(Sender: TObject);
  private
    FIsDrawChart:Boolean;  //�Ƿ񻭹�����
    FLastHisDataAddIndex: Integer;//��һ����ӵ���ͼ�ϵĹ켣������
  public
    FDrawLineCnt,FDrawLineCntT : Integer;
    PageCurrent,Pages,PageCurrentT,PagesT:Integer;
    playDevT : TDevice;
    FTrackPlay: TRemoteTrackPlay;
    FCurrentFile,FCurrentFileT:string;
//    FArrSwitchorder :array of integer; //��¼��ǰ�����Ľ�ͷ��
    FBackGoBJ:boolean;//�û���������ʱ�������˵����һ��,���ؼ���켣�㡣=trueʱ��ReceiveGpsData������켣��
    FProgressdlg : TFrmRefreshProgress;
    FLastLong, FLastLat: string;//��¼��һ����ľ�γ��λ�ã�С����ǰ3λ��ͬ�Ĳ����ö�λ�ӿ�
    procedure ClearPlayDevBuffer;
    procedure PlayFile(const AFileName: string;ATimeFrom,ATimeTo:TDateTime);
    procedure PlayFromServer(ADevID: string;  ATimeFrom,ATimeTo: TDateTime);
    procedure ReceiveGpsData;overload;
    procedure ReceiveGpsData_V3(pgpsdata: PHistoryGpsData_V3);
    procedure ReceiveGpsData_PlayBack_V3(pgpsdata: PHistoryGpsData_V3);
    procedure ReceiveGpsData(pgpsdata: PGpsData_V3);overload;
    procedure RecGpsData(pgpsdata: PGpsData_V2);
    function load_PlayInfo(const ATimeFrom,ATimeTo:TDateTime;const Astr:string): Integer;
    function  LoadAllGpsData(Progressdlg :TFrmRefreshProgress): boolean;
    procedure show_GpsData_InListView(pgpsdata: PGpsData_V3); overload;
    procedure show_GpsData_InListView_V3(pgpsdata: PHistoryGpsData_V3);

    procedure SetGpsDataPlay(isPlay:boolean);


    procedure NilFTrackPlay;

    procedure PlayDevChanged;           // ������������
    //���������� ֮��ľ���
    function GetDistance(A, B: TGpsData_V2): double;   overload;
    function GetDistance(StartLat:double;StartLong:double;EndLat:double;EndLong:double):double; overload;
    function GetDistance(A, B: TGpsData_V3): double;   overload;
    function GetDistance(A, B: THistoryGpsData_V3): Double; overload;
    {�ڼ����� ����̺��õ�ǰ�� �ص��û�ԭ���ļ���ǰ��λ��
     OldPos     :����ǰ��λ��= FTrackPlay.Current+1
     IsPlayStart:����ǰ���û��ǵ㿪ʼ�طŵ� = true
                         �û��ǵ㵥���طŵ� = false}
    procedure GotoOldPos(OldPos:Integer;IsPlayStart : Boolean);

    procedure ScrollAxis(Axis: TChartAxis; const Percent: Double);
    procedure DoOnAddGpsData(gpsData: TQueryHistoryGpsData_V3);
  end;

var
  FormHisMain: TFormHisMain;
implementation
{$R *.dfm}

uses
  ufrmlogin, uGloabVar, UserUnit, FileTrackPlayUnit, PlayGlobalUnit,uLayer_control,
  uOpenFile, {uselect_dev,} uMap_layer,  //PrivilegeConstUnit ,
  ParamUnit, DebugUnit, DateUtils,umainf, MapPubUnit{liusen}
  ,GpsOffSetService_ImplUnit,ActiveX;

{ TFormHisMain }


{
procedure TFormHisMain.FMapMetaSelected(Sender: TObject);
var
  i: integer;
  Layer: TDrawLayer;
  layerAry:array of TDrawLayer;
  kfieldUidValue: array of Integer;
  cnt : Integer;
begin
  cnt := 0;
  for i := 0 to FMap.Layers.Count - 1 do
  begin
    Layer := FMap.Layers.GetLayerByIndex(i);
    //if not (lyVisible in Layer.State) then continue;
    //if not (lySelect in Layer.State) then continue;
    if Layer.EntityMeta.Count = 0 then continue;
    //if Layer.Data.dataset = nil then continue;
    Inc(cnt);
    SetLength(kfieldUidValue,cnt);
    SetLength(layerAry,cnt);
    kfieldUidValue[cnt -1] := Layer.Data.GetMetaUID(Layer.EntityMeta.GetData(0));
    layerAry[cnt -1]:= Layer;
  end;
  if cnt>0 then //ѡ�е�����ݡ���ʾ
  begin
    FDlg_data_display.InitForm(layerAry,kfieldUidValue);
    if not FDlg_data_display.Showing then
      FDlg_data_display.Show;
  end
  else
  begin
    if FDlg_data_display.Showing then
      FDlg_data_display.Hide;
  end; 
end;
     }
{procedure TFormHisMain.Init;
begin

end;     }
(*
function TFormHisMain.UserLogin: Boolean;
var
  i: Integer;
  dlg: Tfrmlogin;
begin
  dlg := Tfrmlogin.Create(self);
  dlg.Edit1.Text := '';
  dlg.Edit2.Text := '';
  {$ifopt d+}
    dlg.Edit1.Text := 'sha';
    dlg.Edit2.Text := '0';
  {$endif}
  i := 0;
  try
    while True do
    begin
      dlg.ShowModal ;
      Inc(i);
      if dlg.ModalResult = mrok then
      begin
        
//        FFlashDlg.Show ;
//        FFlashDlg.Gauge1.Progress :=5;
        application.ProcessMessages ;
        current_user := Tuser.Create(trim(dlg.Edit1.Text), trim(dlg.Edit2.Text));
        try  //--------���� ��ҵ�������
          bs.ConnectServer ;
          if logined then break;   //����û���¼�ɹ����˳�
          if (i>=3) and (not logined) then
          begin
            messagebox(handle,'�Բ������Ѵ����������Σ����˳�ϵͳ��','��ʾ',mb_ok + mb_iconinformation);
            break;
          end;
        except
          on E:exception do
          begin
            messagebox(handle,pchar(e.Message ),'���ӵ�ҵ�������ʧ�ܣ�',mb_ok + mb_iconinformation);
            ShowMessage('������ϵͳ����Ա��ϵ,���ϵͳ�����ļ�');
          end;
        end;
      end
      else
      //begin
      //  if messagebox(handle,'��ȡ�����˳���ϵͳ����ȷ��Ҫȡ����','��ʾ',mb_yesno + mb_iconquestion)=ID_yes then
          break ;
      //  else
      //    Dec(i);
     // end;
    end;
  finally
    dlg.free;
    Result := Logined;
  end;
end;
       *)
procedure TFormHisMain.FormCreate(Sender: TObject);
begin
  try
    EditHisDisplayCarNo.Text  := '';
    //edit2.Text  := '';  // γ��
    edit3.Text  := '';  // GPSʱ��
    edit4.Text  := '';  // �ٶ�
    edit5.Text  := '';   // �Ƕ�
    editfromtime.Clear;
    edittotime.Clear;
    
    Label_played.Caption :='';
    Timer_stepByStep.Interval := 500;  //������ť��������500msʱ��
    play_speed_controlExecute(play_speed_control);//�趨TimerPlay.Interval
    Timer_stepByStep.Enabled := false;
    TimerPlay.Enabled :=false;

    play_start.Caption      := '��ʼ';
    play_start.Enabled      :=false;
    play_StepByStep.Enabled := false;
    play_BackAStep.Enabled  := False;
    play_pause.Enabled      :=false;
    play_stop.Enabled       :=false;
    TrackBar_Play.Position  := 0;
    TrackBar_Play.Enabled   := false;
    //BitBtnShowListInfo.Enabled := False;

    playDevT := playDev;

    //Ĭ����ʾ�켣��add sha,2006-01-05
    show_CarTrack.Execute;
    FLastHisDataAddIndex := -1;
  finally
    //Progressdlg.Free;
//    FFlashDlg.hide;
  end;

  BitBtnOutData.Visible:= False;
  Gauge1.Visible := False;
  BitBtnCal.Enabled := False;
  EditRunkm.Text := '';

  lblAddGpsCountTip.Caption := '';
  lblClearGpsHisTip.Caption := '';
end;
(*
procedure TFormHisMain.OpenWS;
var
  i,count: Integer;
  m,mm:IMap;
  lay,laym: ILayer;
begin
  m := TMapCtrl.Create(FMap);
  mm := TMapCtrl.Create(uGloabVar.FMap);
  count:=uGloabVar.FMap.Layers.Count;
try
  for i:=count-1 downto 3 do
  begin
    Progressdlg.Gauge1.AddProgress(
                                  trunc((1/count)*80)
                                  );
   //if uGloabVar.FMap.layers.Layers[i].isHaveNotDelete then continue;
    FMap.Layers.AddLayerWithProvider(uGloabVar.FMap.layers.Layers[i].data);
    lay:=m.GetLayer(0);
    laym:=mm.GetLayer(i);
    lay.SetLabelValue(laym.GetlabelValue);
    lay.SetLayerMinScale(laym.GetLayerMinScale);
    lay.SetLayerMaxScale(laym.GetLayerMaxScale);
    lay.SetLayerIgnore(laym.IsLayerIgnore);
    lay.SetVisible(laym.IsVisible);
    lay.SetSelected({laym.IsSelected}true);
    lay.SetMetaIgnore(laym.IsMetaIgnore);
    lay.SetShowLabel(laym.IsShowLabel);
  end;
  FMap.Zoom(uGloabVar.FMap.DrawCood.WorldRect);
  FMap.Draw;
  Progressdlg.Gauge1.AddProgress(5);
finally
  m:=nil;
  mm:=nil;
  lay:=nil;
  laym:=nil;
end;
end;
       *)
procedure TFormHisMain.PlayFile(const AFileName: string;ATimeFrom,ATimeTo:TDateTime);
begin
//  NilFTrackPlay;
//  ClearPlayDevBuffer;
//  FTrackPlay := TFileTrackPlay.Create(AFileName,ATimeFrom,ATimeTo);
end;

procedure TFormHisMain.TimerPlayTimer(Sender: TObject);
begin
  ReceiveGpsData;
  umainf.Mainf.Edit1.Text:=PlayDev.Car.No;
  umainf.Mainf.ComboBoxCarNO.Text:=PlayDev.Car.No;
  GCurSelectDev:=PlayDev;
  umainf.Mainf.ShowState(PlayDev);
end;



procedure TFormHisMain.ActionPlayFileExecute(Sender: TObject);
var dlg:tOpenFile;
    startDateTime,endDateTime:Tdatetime;
begin
  dlg:= Topenfile.Create(self);
  try
    dlg.start_date.Date := Date;
    dlg.end_date.Date := Date;
    dlg.ShowModal;
    if dlg.ModalResult = mrOk then
    begin
      PlayDevChanged;
      FCurrentFile:=dlg.StatusBar1.Panels.Items[0].Text;
//      ShowState(PlayDev);

      startDateTime := dlg.start_date.DateTime;
      ReplaceTime(startDateTime,dlg.start_time.Time);
      endDateTime := dlg.end_date.DateTime;
      ReplaceTime(endDateTime,dlg.end_time.Time);
      PlayFile(FCurrentFile,startDateTime,endDateTime);

      load_PlayInfo(startDateTime,endDateTime,'�ļ�:'+FCurrentFile);
    end;
  finally
    dlg.Free;
  end;
end;

procedure TFormHisMain.TrackBarOutlookChange(Sender: TObject);
begin
//{$ifdef For_OutLook}
{  FOutLook.ZoomRatio := TrackBarOutlook.Position;
  FOutLook.Draw;   }
//{$endif}
end;

procedure TFormHisMain.tool_not_selectExecute(Sender: TObject);
begin
  FMap.MouseAction:=0;
end;

procedure TFormHisMain.tool_zoom_inExecute(Sender: TObject);
begin
  FMap.MouseAction:=2;
end;

procedure TFormHisMain.tool_zoom_outExecute(Sender: TObject);
begin
  FMap.MouseAction:=3;
end;

procedure TFormHisMain.tool_moveExecute(Sender: TObject);
begin
  FMap.MouseAction:=1;
end;

procedure TFormHisMain.tool_locateExecute(Sender: TObject);
begin
  FMap.MouseAction:=4; 
end;

procedure TFormHisMain.tool_distanceExecute(Sender: TObject);
begin
  FMap.MouseAction:=5;
end;

procedure TFormHisMain.tool_select_pointExecute(Sender: TObject);
begin
  FMap.MouseAction:=actPointSelect;
end;

procedure TFormHisMain.tool_layer_controlExecute(Sender: TObject);
var dlg:TLayer_control;
    m: IMap;
begin
  //If not HasPrivilege(PRI_LAYERCTRL) then exit;
  dlg:= TLayer_control.Create(Self);
  m := TMapCtrl.Create(FMap);
  try
    dlg.InitMap(m);
    dlg.StatusBar1.Panels[1].Text :='��ǰ���� '+IntToStr(FMap.DrawCood.Scale); 
    dlg.ShowModal ;
    if dlg.ModalResult = mrOk then
      FMap.Draw;
  finally
    dlg.Free;
  end;
end;

procedure TFormHisMain.play_startExecute(Sender: TObject);
var
  i:integer;
  //orggpsdata: pCmdSrvTermGpsData_V2;
  gpsTime:string;
  orggpsdata:PCmdSrvTermGpsData_V2;
  gpsdata: TGpsData_V2;
begin
  //BitBtnShowListInfo.Enabled := True;
//  if not FIsDrawChart then    //ÿ���������ݺ�ֻ��һ��
//  begin
//    DrawSpeedLine;
//    DrawSpeedLineT;
//    FIsDrawChart:= True;
//  end;

  SetGpsDataPlay(true);
  // liusen
  if FTrackPlay.Current = -1 then //��ʼ
  begin
    ClearHistroyInfo;
    FLastHisDataAddIndex := PutHisGpsNew(FTrackPlay, 0, 150) - 1;
    Timer1.Enabled := True;
    FLastLong := '';
    FLastLat := '';
    FTrackPlay.First;
    TimerPlay.Enabled :=true;
    TrackBar_Play.Enabled := true;
    play_start.Enabled :=false;
    play_start.Caption :='����';
    play_StepByStep.Enabled := false;
    play_BackAStep.Enabled  := False;
    play_pause.Enabled :=true;
    play_stop.Enabled := true;
    TrackBar_Play.Position :=0;
  end
  else //����
  begin
    TimerPlay.Enabled :=true;
    play_stop.Enabled :=true;
    play_pause.Enabled :=true;
    play_StepByStep.Enabled := false;
    play_BackAStep.Enabled  := False;
    play_start.Enabled :=false;
  end;         
end;

procedure TFormHisMain.play_pauseExecute(Sender: TObject);
begin
  Timer1.Enabled := False;
  TimerPlay.Enabled :=false;
  play_pause.Enabled :=false;
  play_StepByStep.Enabled := true;
  play_BackAStep.Enabled  := True;
  //play_goOn.Enabled := true;
  play_start.Enabled := true;
  // liusen
  //SetGpsDataPlay(false);
  //SpeedButton1.Click;
end;

procedure TFormHisMain.play_stopExecute(Sender: TObject);
begin
  lblClearGpsHisTip.Caption := ' ��������켣�ߣ����Ժ�....   ';
  Mainf.stopGetHisThread;
  Timer1.Enabled := False;
  TimerPlay.Enabled :=false;
  play_start.Enabled :=true;
  play_start.Caption := '��ʼ';
  play_StepByStep.Enabled := false;
  play_BackAStep.Enabled  := False;
  play_pause.Enabled :=false;
  play_stop.Enabled :=false;
  TrackBar_Play.Position := 0;
  FTrackPlay.First;
  show_GpsData_InListView_V3(nil);
  StopPlayHistroy;
  lblClearGpsHisTip.Caption := '';
  SetGpsDataPlay(false);

  lblAddGpsCountTip.Caption := '      ';
end;

procedure TFormHisMain.play_speed_controlExecute(Sender: TObject);
begin
  TimerPlay.Interval := (TrackBar_Speed.Position+1)*50;
//  StatusBar.Panels.Items[1].Text :=' �ط��ٶȣ�'+
//    FormatFloat('0.0',1000/TimerPlay.Interval) +'��/��';
  LabelSpeed.Caption := FormatFloat('0.0',1000/TimerPlay.Interval) +'��/��';
end;

function TFormHisMain.load_PlayInfo(const ATimeFrom,ATimeTo:TDateTime;const Astr:string): Integer;  //����playDev�������Ϣ
begin
  Result := 0;
  EditRunkm.Text := '';
  BitBtnCal.Enabled := FTrackPlay.Count >0;
  if FTrackPlay.Count>0 then
  begin
    play_start.Enabled :=true;      //����  ��ʼ ��
    play_StepByStep.Enabled :=true; //Ҳ���� ����
    TrackBar_Play.Max :=  FTrackPlay.Count;
    Label_played.Caption := IntToStr(TrackBar_Play.Position)+'/'+IntToStr(FTrackPlay.Count);
    PlayDev.TraceList.SetOldListSize(FTrackPlay.Count);
    EditHisDisplayCarNo.Text := PlayDev.Car.No;
//    EditFromTime.Text:=FormatDatetime('yyyy-mm-dd hh:nn:ss',FTrackPlay.TimeFrom);
//    EditToTime.Text:=FormatDatetime('yyyy-mm-dd hh:nn:ss',FTrackPlay.TimeTo);
    FIsDrawChart := False; //��û��
    Result := FTrackPlay.Count; 
  end
  else
  begin
    play_start.Enabled :=false;      // ��ʼ
    play_StepByStep.Enabled :=false; // ����
    TrackBar_Play.Enabled := false;
    TrackBar_Play.Max := FTrackPlay.Count;
    Label_played.Caption :='0/0';
//    messagebox(handle,pchar('��ʱ��Ρ�'+FormatDateTime('yyyy-mm-dd hh:nn:ss',ATimeFrom)+
//      '������'+FormatDateTime('yyyy-mm-dd hh:nn:ss',ATimeTo)+'���ڣ�'+
//      playDev.Car.No+'û�����ݵ�!'),'��ʾ',mb_ok + mb_iconinformation);
  end;
end;

procedure TFormHisMain.PlayFromServer(ADevID: string; ATimeFrom,
  ATimeTo: TDateTime);
begin
  NilFTrackPlay;
  ClearPlayDevBuffer;
  FTrackPlay := TRemoteTrackPlay.Create(ADevID,ATimeFrom,ATimeTo);
end;

procedure TFormHisMain.show_GpsData_InListView(pgpsdata: PGpsData_V3);
//var
//  i:integer;
begin
  if pgpsdata= nil then
  begin
    //edit2.Text  := '';  // γ��
    edit3.Text  := '';  // GPSʱ��
    edit4.Text  := '';  // �ٶ�
    edit5.Text  := '';   // �Ƕ�
    //FMap.GpsDrawlayer.AutoFollowDevice.GpsTime := StrToDateTime('1900-01-01 01:01:01');
    //FMap.GpsDrawlayer.AutoFollowDevice.Speed := 0
//    ShowState(nil);
  end
  else
  begin
    EditHisDisplayCarNo.Text := PlayDev.Car.no;
    //edit2.Text := FormatFloat('##0.000000',pgpsdata^.lat);      //γ��
    edit3.Text := FormatDateTime('yyyy-mm-dd hh:nn:ss',pgpsdata^.GpsTime{+1/3}); //GPSʱ��
    edit4.Text := FormatFloat('##0.0',pgpsdata^.Speed/10);  //�ٶ�  LS
    edit5.Text := floattostr(pgpsdata^.Orientation);  //  �Ƕ�
    FMap.GpsDrawlayer.AutoFollowDevice.GpsTime := pgpsdata^.GpsTime;
    FMap.GpsDrawlayer.AutoFollowDevice.Speed := pgpsdata^.Speed;
   // ShowState(playDev);
  end;
end;

procedure TFormHisMain.show_GpsData_InListView_V3(pgpsdata: PHistoryGpsData_V3);
//var
//  i:integer;
begin
  if pgpsdata= nil then
  begin
    //edit2.Text  := '';  // γ��
    edit3.Text  := '';  // GPSʱ��
    edit4.Text  := '';  // �ٶ�
    edit5.Text  := '';   // �Ƕ�
    //FMap.GpsDrawlayer.AutoFollowDevice.GpsTime := StrToDateTime('1900-01-01 01:01:01');
    //FMap.GpsDrawlayer.AutoFollowDevice.Speed := 0
//    ShowState(nil);
  end
  else
  begin
    EditHisDisplayCarNo.Text := PlayDev.Car.no;
    //edit2.Text := FormatFloat('##0.000000',pgpsdata^.lat);      //γ��
    edit3.Text := FormatDateTime('yyyy-mm-dd hh:nn:ss',pgpsdata^.GpsTime{+1/3}); //GPSʱ��
    edit4.Text := FormatFloat('##0.0',pgpsdata^.Speed/10);  //�ٶ�  LS
    edit5.Text := floattostr(pgpsdata^.Orientation);  //  �Ƕ�
    // liusen
    //FMap.GpsDrawlayer.AutoFollowDevice.GpsTime := pgpsdata^.GpsTime;
    //FMap.GpsDrawlayer.AutoFollowDevice.Speed := pgpsdata^.Speed;
   // ShowState(playDev);
  end;
end;

procedure TFormHisMain.ClearPlayDevBuffer;
begin
  playDev.TraceList.Clear;
end;

procedure TFormHisMain.play_StepByStepExecute(Sender: TObject);
begin
  // liusen
  //SetGpsDataPlay(true);
  if FTrackPlay.Current = -1 then //��ͷ��ʼʱ��������й켣��
  begin
    playDev.TraceList.Clear;
    TrackBar_Play.Enabled := true;
    play_start.Caption := '����';
    // liusen
    ClearHistroyInfo;
  end;
  play_start.Enabled :=true;
  //play_goOn.Enabled :=true;
  play_BackAStep.Enabled  := True;
  play_stop.Enabled := true;
  ReceiveGpsData;

  // liusen
  PlayNextHistroyGpsData;

  umainf.Mainf.Edit1.Text:=PlayDev.Car.No;
  umainf.Mainf.ComboBoxCarNO.Text:=PlayDev.Car.No;
  GCurSelectDev:=PlayDev;
  umainf.Mainf.ShowState(PlayDev);
  // liusen
  //SetGpsDataPlay(true);
end;

procedure TFormHisMain.show_CarTrackExecute(Sender: TObject);
begin          
  with (sender as TAction) do
  begin
    checked:=not Checked ;
    playDev.DrawTrack := checked;
  end;
end;

procedure TFormHisMain.map_OpenLayerExecute(Sender: TObject);
var r: TWorldRect;
    OpenDialog1: TOpenDialog;
begin
  OpenDialog1 := TOpenDialog.Create(self);
  try
    OpenDialog1.InitialDir := '..\map\';
    OpenDialog1.Filter :='*.tyo|*.tyo';
    OpenDialog1.Options :=  OpenDialog1.Options +[ofAllowMultiSelect];
    if OpenDialog1.Execute then
    begin
      r.Left   := FMap.DrawCood.WorldRect.Left;
      r.Right  := FMap.DrawCood.WorldRect.Right;
      r.Top    := FMap.DrawCood.WorldRect.Top;
      r.Bottom := FMap.DrawCood.WorldRect.Bottom;
      Fmap.LoadFromFiles(OpenDialog1.Files );
      FMap.Zoom(r);
      FMap.Draw;
    end;
  finally
    OpenDialog1.Free;
  end;
end;

procedure TFormHisMain.map_CloseLayerExecute(Sender: TObject);
var i:integer;
    dlg:TMap_layer;
    r: TWorldRect;
begin
  //If not HasPrivilege(PRI_LOCALSET) Then exit;
  dlg:= Tmap_layer.Create(self);
  try
    dlg.ListBox1.Clear;
    for i:=0 to Fmap.Layers.Count  - 1  do
      dlg.ListBox1.Items.Add(Fmap.Layers.Layer[i].LayerName);
    dlg.bitbtn1.caption:='�ر�ͼ��';
    r.Left   := FMap.DrawCood.WorldRect.Left;
    r.Right  := FMap.DrawCood.WorldRect.Right;
    r.Top    := FMap.DrawCood.WorldRect.Top;
    r.Bottom := FMap.DrawCood.WorldRect.Bottom;
    dlg.ShowModal;
    if dlg.ModalResult = mrOk then
    begin
      i:=0;
      while i< dlg.ListBox1.Count do //
      //-for i:=0 to dlg.ListBox1.Count -1 do
      begin
        if dlg.ListBox1.Selected[i] Then
        begin
          //If dlg.ListBox1.Items.Strings[i]<>'GPSͼ��' then  //dxf 2006-07-13
          if not FMap.Layers.Layer[i].isHaveNotDelete then
          begin
            //FGis.Provider.GetLayerFromIndex(i).Close;
            FMap.Layers.Layer[i].Data.Close;
            dlg.ListBox1.Items.Delete(i);
          end
          else
          begin
            messagebox(handle,pchar(dlg.ListBox1.Items.Strings[i]+'GPSͼ�㲻��ɾ��!'),'��ʾ',mb_ok + mb_iconinformation);
            i:= i+1;
          end;
        end
        else
          i:= i+1;
      end;
      FMap.Zoom(r);
      FMap.Draw;
    end;
  finally
    dlg.Free;
  end;
end;

procedure TFormHisMain.SpeedButton1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Timer_stepByStep.Enabled :=true;
end;

procedure TFormHisMain.SpeedButton1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Timer_stepByStep.Enabled := false;   
end;

procedure TFormHisMain.Timer_stepByStepTimer(Sender: TObject);
begin
  play_StepByStepExecute(play_StepByStep);
end;

procedure TFormHisMain.play_goOnExecute(Sender: TObject);
begin
  TimerPlay.Enabled :=true;
  play_stop.Enabled :=true;
  play_pause.Enabled :=true;
  play_StepByStep.Enabled := false;
  play_BackAStep.Enabled  := False;
  play_goOn.Enabled := false;
end;

procedure TFormHisMain.set_trackPenExecute(Sender: TObject);
var
  colorDialog1:TColorDialog;
   tmpPen:TPenStruct;
begin
  colorDialog1:= TColorDialog.Create(nil);
  try
    if colorDialog1.Execute then
      tmpPen.color :=colorDialog1.Color;
    tmpPen.Width :=1;
    playdev.TrackPen := tmpPen;
  finally
    colorDialog1.free;
  end;
end;



procedure TFormHisMain.help_exitExecute(Sender: TObject);
begin
  close;
end;

procedure TFormHisMain.FormDestroy(Sender: TObject);
begin
  if FTrackPlay  <> nil then
  begin
    FreeAndNil(FTrackPlay);
  end;
end;
 (*
procedure TFormHisMain.FMapMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);

begin

end;   *)

procedure TFormHisMain.TrackBar_PlayChange(Sender: TObject);
begin
  try
    if FTrackPlay = nil then Exit;
//    if TrackBar_Play.Position = 0 then
//      MoveHisDev(TrackBar_Play.Position)
//    else
//      MoveHisDev(TrackBar_Play.Position - 1);
    Label_played.Caption := IntToStr(TrackBar_Play.Position)+'/'+IntToStr(FTrackPlay.Count);
  except
  end;
end;

procedure TFormHisMain.TrackBar_PlayMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  i,t:integer;
  gpsdata: THistoryGpsData_V3; //TGpsData_V3;//TGpsData_V2; //TGpsData;
  orggpsdata: TQueryHistoryGpsData_V3;//TCmdSrvTermGpsData_V3;//TCmdSrvTermGpsData_V2; //TCmdSrvtermGpsdata;
  p: TWorldPoint;
begin
  if FTrackPlay = nil then Exit;
  if FTrackPlay.Buf.Count < FTrackPlay.Count then
  begin
    TrackBar_Play.Position := FTrackPlay.Current + 1;
    messagebox(handle,'���������������ݣ��������϶�!','��ʾ',mb_ok + mb_iconinformation);
    exit;
  end;
  if TrackBar_Play.Position = FTrackPlay.Current + 1 then exit;//�������У���һ��
  if (TrackBar_Play.Position < FTrackPlay.Current + 1) then  //��
  begin
    if TrackBar_Play.Position = 0 then //�˵�ͷ��
    begin
      FTrackPlay.First;
    end
    else
    begin
      t:= abs(TrackBar_Play.Position -(FTrackPlay.Current + 1));

      for i:=0 to t-1 do     //t��
      begin
        if FTrackPlay.Prev then
        begin
//          orggpsdata := FTrackPlay.Data^;
//          TransCmdGpsData(orggpsdata,gpsdata);
//          p := Project.LoLa2XY(EarthPoint(gpsdata.Long,gpsdata.lat));
//          playDev.TraceList.DelPoint(p);
        end;
      end;
    end;
  end
  else if TrackBar_Play.Position > FTrackPlay.Current + 1 then    //��
  begin
    //������ӵ�һ�㿪ʼ��  ���ǵ�һ�λطţ�
    if FTrackPlay.Current=-1 then
    begin
      PlayDev.TraceList.Clear;
      play_start.Caption :='����';
    end;
    t:=  TrackBar_Play.Position -(FTrackPlay.Current + 1) ;
    
    for i:= 0 to t - 1 do     //t��
    begin
      if FTrackPlay.Next then
      begin
//        orggpsdata := FTrackPlay.Data^;
//        TransCmdGpsData(orggpsdata,gpsdata);
//        p := Project.LoLa2XY(EarthPoint(gpsdata.Long,gpsdata.lat));
        //playDev.TraceList.AddPoint(p,FTrackPlay.Current);
        //playDev.TraceList.AddPoint(p);
      end
      else
      if FTrackPlay.Eof then //�طŵ������� �� ����βʱ
        play_stopExecute(play_stop);
    end;  //end for
  end;

  if (TrackBar_Play.Position = FTrackPlay.Count) or (FTrackPlay.Current=-1) then  //����β ���˵�ͷʱ
    play_stopExecute(play_stop)
  else
  begin
    //ȡ�����˵ġ����һ�㡣���ؼ���켣��
    FBackGoBJ := true;
    ReceiveGpsData_V3(@gpsdata);
    FBackGoBJ:= false;   //��ʱ�õı��
    show_GpsData_InListView_V3(@gpsdata);
  end;
end;

procedure TFormHisMain.NilFTrackPlay;
begin
  if FTrackPlay  <> nil then
  begin
    play_stopExecute(play_stop);
    FreeAndNil(FTrackPlay);
    //��� ��ͼ�ϵ�ԭ�еĳ��������ַ�����
    //-----By sha 2005.04.18
    //FMap.RemoveMeta;
    //FMap.DrawGpsMap_ClearDraw;
    //---- �ڶ��ַ������漰����ͼ�ײ㣬������
    //FMap.DrawGpsMap_Clear;
  end;
end;

procedure TFormHisMain.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
begin
  //messagebox(handle,pchar(E.Message),'������ʾ',mb_ok + mb_iconinformation);
 // TDebug.GetInstance.SendDebug(FormatDateTime('yyyy-mm-dd hh:nn:ss',now)+E.Message);
end;
(*
procedure TFormHisMain.ShowState(ADev: TDevice);
var
 i:integer;
begin
   if (Adev=nil) or (not ADev.Switch[32]) then
   begin
     for i:=1 to  DeviceStateList.RowCount-1  do
     begin
       DeviceStateList.Cells[1,i]:='';
     end;
     exit;
   end;
   if  ADev.Switch[0] then
       DeviceStateList.Values['��λ״̬']:='��λ'
   else
       DeviceStateList.Values['��λ״̬']:='�Ƕ�λ';

   if  ADev.Switch[1] then
       DeviceStateList.Values['��γ��γ']:='��γ'
   else
       DeviceStateList.Values['��γ��γ']:='��γ';

   if  ADev.Switch[2] then
       DeviceStateList.Values['��������']:='����'
   else
       DeviceStateList.Values['��������']:='����';

  { if  ADev.Switch[3] then
       DeviceStateList.Values['�Ƽ�������']:='����'
   else
       DeviceStateList.Values['�Ƽ�������']:='�ϵ�';   }

   if  ADev.Switch[8] then
       DeviceStateList.Values['ACC״̬']:='��'
   else
       DeviceStateList.Values['ACC״̬']:='��';

   if  ADev.Switch[9] then
       DeviceStateList.Values['�ճ��س�']:='�س�'
   else
       DeviceStateList.Values['�ճ��س�']:='�ճ�';

   if  ADev.Switch[10] then
       DeviceStateList.Values['��Ӫ״̬']:='ͣ��'
   else
       DeviceStateList.Values['��Ӫ״̬']:='Ӫ��';

   if  ADev.Switch[16] then
       DeviceStateList.Values['��������']:='��'
   else
       DeviceStateList.Values['��������']:='��';

   if  ADev.Switch[17] then
       DeviceStateList.Values['���ٱ���']:='��'
   else
       DeviceStateList.Values['���ٱ���']:='��';

   if  ADev.Switch[24] then
       DeviceStateList.Values['GPSģ��']:='����'
   else
       DeviceStateList.Values['GPSģ��']:='����';

   if  ADev.Switch[25] then
       DeviceStateList.Values['GPS����']:='�Ͽ�'
   else
       DeviceStateList.Values['GPS����']:='��ͨ';

   if  ADev.Switch[26] then
       DeviceStateList.Values['��ѹ����']:='��ѹ'
   else
       DeviceStateList.Values['��ѹ����']:='����';

   if  ADev.Switch[27] then
       DeviceStateList.Values['��ʾ��']:='����'
   else
       DeviceStateList.Values['��ʾ��']:='����';

   if  ADev.Switch[28] then
       DeviceStateList.Values['�Ƽ���']:='����'
   else
       DeviceStateList.Values['�Ƽ���']:='����';
end;
       *)
procedure TFormHisMain.PlayDevChanged;
begin
  PlayDev.TraceList.HistoryDisplayBj := True;
  if show_CarTrack.Checked then PlayDev.DrawTrack := True;
end;

procedure TFormHisMain.Save_MapLayerExecute(Sender: TObject);
begin

end;
{
procedure TFormHisMain.SaveWS;
var
  layer: TLayerParamArray;
  i,j,n: Integer;
  m: IMap;
  lay: ILayer;
begin
  GlobalParam.MapLeft := FMap.DrawCood.WorldRect.Left;
  GlobalParam.MapRight := FMap.DrawCood.WorldRect.Right;
  GlobalParam.MapTop := FMap.DrawCood.WorldRect.Top;
  GlobalParam.MapBottom := FMap.DrawCood.WorldRect.Bottom;
  SetLength(layer,FMap.Layers.Count);
  m := TMapCtrl.Create(FMap);
  i:= 0;   //
  j:=i;    //
  n:=FMap.Layers.Count-1; //
  while j<= n do
  begin
    lay := m.GetLayer(i);
    If FMap.Layers.Layer[i].Data.FileName  ='' then
    begin
      i:= i+1;  //
      n:= n-1;  //
      SetLength(layer,n + 1);//
      Continue;
    end;
    layer[j].FilePath := ExtractRelativePath(Application.ExeName,FMap.Layers.layer[i].Data.FileName);
    layer[j].Visible := lay.IsVisible;
    layer[j].Selected := lay.IsSelected;
    layer[j].MetaLimit := lay.IsMetaIgnore;
    layer[j].ShowLabel := lay.IsShowLabel;
    layer[j].LabelField := lay.GetlabelValue;
    layer[j].ScaleLimit := lay.IsLayerIgnore;
    layer[j].MinScale := lay.GetLayerMinScale;
    layer[j].MaxScale := lay.GetLayerMaxScale;
    layer[j].lay_Order := j;
    lay := nil;
    i:= i + 1;   //
    j:= j + 1;   //
  end;
  m := nil;
  GlobalParam.LayerParam := layer;
end;
       }
procedure TFormHisMain.Splitter1AfterOpen(Sender: TObject);
begin
  show_car.Checked := not show_car.Checked;
end;

procedure TFormHisMain.play_BackAStepExecute(Sender: TObject);  //��һ��
var
//  i,t: integer;
  gpsdata: THistoryGpsData_V3; //TGpsData_V3;//TGpsData_V2; //TGpsData;
  orggpsdata: TQueryHistoryGpsData_V3; //TCmdSrvTermGpsData_V3;//TCmdSrvTermGpsData_V2; //TCmdSrvtermGpsdata;
  p: TWorldPoint;
begin
  if FTrackPlay = nil then Exit;
  // liusen
  //SetGpsDataPlay(true);
  TrackBar_Play.Position := TrackBar_Play.Position -1;//��һ��
  if (TrackBar_Play.Position < FTrackPlay.Current + 1) then  //��
  begin
    if TrackBar_Play.Position = 0 then //�˵�ͷ��
    begin
      FTrackPlay.First;
      playDev.TraceList.Clear;  // ����Ѽ���Ĺ켣��
    end
    else
    begin
      if FTrackPlay.Prev then
      begin
        orggpsdata := FTrackPlay.Data^;
        TransCmdGpsData(orggpsdata,gpsdata);
        p := Project.LoLa2XY(EarthPoint(gpsdata.Long,gpsdata.lat));
        playDev.TraceList.DelPoint(p);

        // liusen
        PlayPreviousHistroyGpsData;
      end;
    end;
  end;

  if (TrackBar_Play.Position = FTrackPlay.Count) or (FTrackPlay.Current=-1) then  //����β ���˵�ͷʱ
    play_stopExecute(play_stop)
  else
  begin
    //ȡ�����˵ġ����һ�㡣���ؼ���켣��
    FBackGoBJ := true;
    //ReceiveGpsData_V3(@gpsdata);
    ReceiveGpsData_PlayBack_V3(@gpsdata);
    FBackGoBJ:= false;   //��ʱ�õı��
    show_GpsData_InListView_V3(@gpsdata);
  end;

  umainf.Mainf.Edit1.Text:=PlayDev.Car.No;
  umainf.Mainf.ComboBoxCarNO.Text:=PlayDev.Car.No;
  GCurSelectDev:=PlayDev;
  umainf.Mainf.ShowState(PlayDev);

  // liusen
  //SetGpsDataPlay(true);
end;

procedure TFormHisMain.BitBtnCalClick(Sender: TObject);
var
  i: integer;
  thisGpsData,lastGpsData: THistoryGpsData_V3; //TGpsData_V3;
  km1,kmCount :double;
  seconds: Integer;
  gpsSrvTermData: TQueryHistoryGpsData_V3; //TCmdSrvTermGpsData_V3;
begin
  if FTrackPlay = nil then Exit; 
  screen.Cursor := crHourGlass;
  Gauge1.Visible := True;
  try
    Gauge1.MaxValue :=  FTrackPlay.Count;
    lastGpsData.Size := 0;
    kmCount := 0;
    for i:= 0 to FTrackPlay.Count -1 do
    begin
      Gauge1.Progress := i;
      gpsSrvTermData := TQueryHistoryGpsData_V3(FTrackPlay.Buf.Data[i]);
      TransCmdGpsData(gpsSrvTermData,thisGpsData);
      if lastGpsData.Size = 0 then //�ǵ�һ��
        lastGpsData := thisGpsData
      else
      begin                         //���ǵ�һ��ʱ
        if not ((thisGpsData.State and $1) =$1) then //��λ��
        begin
          //���ĳ���ٶ�Ϊ0����ǰһ���ٶ�ҲΪ0ʱ��������̡�
          if (thisGpsData.Speed = 0) and (lastGpsData.Speed = 0) then Continue;
          //���������� �ٶ�ֵ>300 km/h���������
          try
            km1 := GetDistance(lastGpsData,thisGpsData);
          except  on E: Exception do
            begin
              SystemLog.AddLog('GetDistance(LastGpsData,thisGpsData)'+e.Message);
              Continue;
            end;
          end;
          seconds := SecondsBetween(lastGpsData.GpsTime,thisGpsData.GpsTime);
          if seconds =0 then
            Continue;
          if 3600* km1/seconds > INVALIDSPEED then Continue;
          kmCount := kmCount + km1;
          LastGpsData := thisGpsData;
        end;
      end;
    end;
    EditRunkm.Text := FormatFloat('0.000',kmCount);
  finally
    Gauge1.Visible := False;
    screen.Cursor := crDefault;
  end;
end;       

function TFormHisMain.GetDistance(A,B:TGpsData_V2):double;
begin
  if (A.Lat = B.Lat) and (A.Long =B.Long) then
    Result :=0
  else
    Result := GetDistance(A.Lat,A.Long,B.Lat,B.Long);
end;

function TFormHisMain.GetDistance(StartLat, StartLong, EndLat,
  EndLong: double): double;
var
  fPhimean: Double;
  fdLambda: Double;
  fdPhi: Double;
  fAlpha: Double;
  fRho: Double;
  fNu: Double;
  fR: Double;
  fz: Double;
  fTemp: Double;
  Distance: Double;
  Bearing: Double;
const
  D2R: Double = 0.017453;
  R2D: Double = 57.295781;
  a: Double = 6378137.0;
  b: Double = 6356752.314245;
  e2: Double = 0.006739496742337;
  f: Double = 0.003352810664747;   
begin
  fdLambda := (StartLong - EndLong) * D2R;
  fdPhi := (StartLat - EndLat) * D2R;
  fPhimean := ((StartLat + EndLat) / 2.0) * D2R;
  fTemp := 1 - e2 * (Power(Sin(fPhimean),2));
  fRho := (a * (1 - e2)) / Power(fTemp, 1.5);
  fNu := a / (Sqrt(1 - e2 * (Sin(fPhimean) * Sin(fPhimean))));
  fz := Sqrt(Power(Sin(fdPhi/2.0),2)+Cos(EndLat*D2R)*Cos(StartLat*D2R)*Power(Sin(fdLambda/2.0),2)) ;
  fz := 2 * ArcSin(fz);
  fAlpha := Cos(EndLat * D2R) * Sin(fdLambda) * 1 / Sin(fz);
  fAlpha := ArcSin(fAlpha);
  fR := (fRho * fNu) / ((fRho * Power(Sin(fAlpha),2)) + (fNu * Power(Cos(fAlpha),2)));
  Distance := (fz * fR);
  if((StartLat < EndLat) and (StartLong < EndLong)) then
    Bearing := Abs(fAlpha * R2D)
  else if ((StartLat < EndLat) and (StartLong > EndLong)) then
    Bearing := 360 - Abs(fAlpha * R2D)
  else if ((StartLat > EndLat) and (StartLong > EndLong)) then
    Bearing := 180 + Abs(fAlpha * R2D)
  else if ((StartLat > EndLat) and (StartLong < EndLong)) then
    Bearing := 180 - Abs(fAlpha * R2D);

  Result := Distance / 1000;      //km
end;           

function TFormHisMain.GetDistance(A, B: TGpsData_V3): double;
begin
  if (A.Lat = B.Lat) and (A.Long =B.Long) then
    Result :=0
  else
    Result := GetDistance(A.Lat,A.Long,B.Lat,B.Long);
end;

function TFormHisMain.GetDistance(A, B: THistoryGpsData_V3): Double;
begin
  if (A.Lat = B.Lat) and (A.Long =B.Long) then
    Result :=0
  else
    Result := GetDistance(A.Lat,A.Long,B.Lat,B.Long);
end;

procedure TFormHisMain.GotoOldPos(OldPos: Integer;IsPlayStart : Boolean);
var
  i: Integer;
begin
  FTrackPlay.First;  //�ӵ�һ�㿪ʼ
  for i:= 0 to OldPos -1 do
    FTrackPlay.Next;
  TrackBar_Play.Position := OldPos;

  play_start.Caption := '����';
  if IsPlayStart then   //���� �����ط�
  begin
    play_start.Enabled := True;
    play_start.Execute;
  end
  else
  begin  
    play_start.Enabled := True;
    play_pause.Enabled := False;
    play_StepByStep.Enabled := True;
    play_BackAStep.Enabled  := True;
    play_stop.Enabled       := True;
  end;
end;

function TFormHisMain.LoadAllGpsData(Progressdlg :TFrmRefreshProgress) :boolean;
var
  i,n: Integer;
begin
  Result := False;
  if FTrackPlay = nil then Exit;
  if FTrackPlay.Buf.Count<>FTrackPlay.Count then
  begin
    //Progressdlg := TFrmRefreshProgress.Create(Self);
      Progressdlg.Show;

      if FTrackPlay.Count mod 50 =0 then
        n := FTrackPlay.Count div 50
      else
        n := FTrackPlay.Count div 50 +1;
      //Progressdlg.Gauge1.Progress:=0;
      Progressdlg.Gauge1.MaxValue :=n+8;
      Application.ProcessMessages;
      for i:= 0 to n-1 do
      begin
        if not Progressdlg.Showing then  exit;
        FTrackPlay.Next;
        Progressdlg.Gauge1.AddProgress(1);
        Application.ProcessMessages;
      end;
  end;
  FTrackPlay.First;

  Result := True;
end;


procedure TFormHisMain.SetGpsDataPlay(isPlay: boolean);
begin
    // liusen
  SetIsPlayHistroy(isPlay);
//    if isPlay then
//    begin
//        FMap.GpsDrawlayer.AutoFollowDevice:= PlayDev;
//        FMap.EnableTimer(true); 
//        FMap.IsPlayGpsData:=true;
//        GCurSelectDev:=PlayDev;
//        //PlayDev.isOnline:=true;
//    end
//    else
//    begin
//        FMap.GpsDrawlayer.AutoFollowDevice:= nil;
//        FMap.IsPlayGpsData:=false;
//        GCurSelectDev:=ADeviceManage.Find(PlayDev.Id);
//        FMap.Draw;
//        //GCurSelectDev:=PlayDev;
//        //PlayDev.isOnline:=true;
//    end;
end;

function TFormHisMain.SaveServerData2File(AFileName:String):Boolean;
var
  i,len: integer;
  firstTime,endTime:TDateTime; //ʱ���
  hdr: TGpsFileHeader;
  fs : TFileStream;
  arrayRec : array of TGpsDataRecord;
  gpsSrvTermData: TQueryHistoryGpsData_V3; //TCmdSrvTermGpsData_V3;
  gpsData: THistoryGpsData_V3; //TGpsData_V3;
  ss : string;
begin
  Result := false;
  if PlayDev = nil then exit;
  try
    //�����һ������һ�㣬�Է��ӳ�ʼ�����ݿ⣽��ÿ���ӷ�һ���յ�����
    firstTime := StrToDatetime(EditFromTime.Text);
    FProgressDlg.GaugeProcessInc(5);
    endTime := StrToDatetime(EditToTime.Text);
    FProgressDlg.GaugeProcessInc(5);
    fs := TFileStream.Create(AFileName, fmCreate or fmOpenReadWrite);
    try
      hdr.FileVerMaj := 1;//FILEVER_MAJOR; //�����ļ��İ汾Ϊ1.1
      hdr.FileVerMin := 1;//FILEVER_MINOR;
      hdr.DevId := PlayDev.Id;
      hdr.RecCount := FTrackPlay.Count;
      hdr.FirstDataSrvTime := firstTime;
      hdr.FirstDataGpsTime := firstTime;
      hdr.LastDataSrvTime := endTime;
      hdr.LastDataGpsTime := endTime;
      ss := Trim(PlayDev.Car.No);
      len:= Length(ss);
      if len>11 then len:=11;
      hdr.Reserved[0] :=  len; //������ �ĵ�0�ֽڷź������ݵĳ���
      CopyMemory(@hdr.Reserved[1],@ss[1],Len);//������ �Ĵӵ�1�ֽڿ�ʼ�ų��ƺ�
      SetLength(arrayRec,FTrackPlay.Count);
      for i:= 0 to FTrackPlay.Count -1 do
      begin
        arrayRec[i].DevId :=  PlayDev.Id;
        gpsSrvTermData := TQueryHistoryGpsData_V3(FTrackPlay.Buf.Data[i]);
        TransCmdGpsData(gpsSrvTermData,gpsData);
        arrayRec[i].Stime := gpsData.GpsTime;
        arrayRec[i].Gtime := gpsData.GpsTime;
        CopyMemory(@(arrayRec[i].GData),@gpsSrvTermData,sizeof(TQueryHistoryGpsData_V3));
        FProgressDlg.GaugeProcessInc(1);
      end;
      fs.Position := 0;
      fs.Write(hdr, sizeof(hdr));
      fs.Write(arrayRec[0],FTrackPlay.Count*sizeof(TGpsDataRecord));
      Result := True;
    finally
      fs.Free;
    end;
  except on E: Exception do
    begin
      Exception.Create(E.Message);
    end;
  end;
end;


procedure TFormHisMain.ActionSaveServerData2FileExecute(Sender: TObject);
var
  //oldCurrent : Integer;
  saveDlg:TSaveDialog;
  ss: string;
begin
  if (PlayDev = nil) or (FTrackPlay = nil)then
  begin
    MessageBox(handle,'������ѡ����','��ʾ',MB_OK + MB_ICONINFORMATION);
    exit;
  end;
  //��ס �û�ԭ���طŵ�λ��
  //oldCurrent := FTrackPlay.Current+1;
  Panel6.Enabled := False;
  try
      FProgressDlg := TFrmRefreshProgress.Create(self);
      FProgressDlg.SetCaption('���ڴ洢���ݣ����Ժ�...');
      FProgressDlg.Gauge1.MaxValue := FTrackPlay.Count+10;
      FProgressDlg.Gauge1.Progress := 0;
      FProgressDlg.Show;
      Self.Enabled := False;
      saveDlg := TSaveDialog.Create(self);
      try
        saveDlg.Title := '���������GPS����Ϊ�����ļ�';
        ss := PlayDev.Car.No +'_'+ editfromtime.Text+
          '_'+edittotime.Text;
        ss :=StringReplace(ss,':','',[rfReplaceAll]);
        saveDlg.FileName := StringReplace(ss,'-','',[rfReplaceAll]);
        saveDlg.Filter := '*.gps|*.gps';
        saveDlg.DefaultExt := 'gps';
        if saveDlg.Execute then
        begin
          if not SaveServerData2File(saveDlg.FileName) then exit;
        end;
      finally
        FProgressDlg.Free;
        Self.Enabled := True;
      end;
  finally
    //�ָ���ԭ����λ�ã����������
    Panel6.Enabled := True;
    //GotoOldPos(oldCurrent);
  end;
end;


function TFormHisMain.OutGpsDataForMapinfo(AFileName:String):Boolean;
var
  i: integer;
  firstTime,endTime:TDateTime; //ʱ���
  fs : TFileStream;
  sBuf: string;
  gpsSrvTermData: TQueryHistoryGpsData_V3;//TCmdSrvTermGpsData_V3;
  gpsData: THistoryGpsData_V3; //TGpsData_V3;
begin
  Result := false;
  if PlayDev = nil then exit;
  try
    //�����һ������һ�㣬�Է��ӳ�ʼ�����ݿ⣽��ÿ���ӷ�һ���յ�����
    firstTime := StrToDatetime(EditFromTime.Text);
    FProgressDlg.GaugeProcessInc(5);
    endTime := StrToDatetime(EditToTime.Text);
    FProgressDlg.GaugeProcessInc(5);
    fs := TFileStream.Create(AFileName, fmCreate or fmOpenReadWrite);
    try
      sBuf:= '';
      for i:= 0 to FTrackPlay.Count -1 do
      begin
        gpsSrvTermData := TQueryHistoryGpsData_V3(FTrackPlay.Buf.Data[i]);
        TransCmdGpsData(gpsSrvTermData,gpsData);
        sBuf := sBuf + FormatFloat('0.000000',gpsData.Long)+ ','+FormatFloat('0.000000',gpsData.Lat)+#13#10;
        FProgressDlg.GaugeProcessInc(1);
      end;
      fs.Position := 0;
      fs.Write(sBuf[1],length(sBuf));
      Result := True;
    finally
      fs.Free;
    end;
  except on E: Exception do
    begin
      Exception.Create(E.Message);
    end;
  end;
end;

procedure TFormHisMain.ActionOutputDataExecute(Sender: TObject);
var
  saveDlg:TSaveDialog;
  ss: string;
begin
  if (PlayDev = nil) or (FTrackPlay = nil)then
  begin
    MessageBox(handle,'������ѡ����','��ʾ',MB_OK + MB_ICONINFORMATION);
    exit;
  end;
  Panel6.Enabled := False;
  try
    FProgressDlg := TFrmRefreshProgress.Create(self);
    FProgressDlg.SetCaption('���ڵ������ݣ����Ժ�...');
    FProgressDlg.Gauge1.MaxValue := FTrackPlay.Count+10;
    FProgressDlg.Gauge1.Progress := 0;
    FProgressDlg.Show;
    Self.Enabled := False;
    saveDlg := TSaveDialog.Create(self);
    try
      saveDlg.Title := '����GPS����--Mapinfo����ͼ��';
        ss := PlayDev.Car.No +'_'+ editfromtime.Text+
          '_'+edittotime.Text;
      ss :=StringReplace(ss,':','',[rfReplaceAll]);
      saveDlg.FileName := StringReplace(ss,'-','',[rfReplaceAll]);
      saveDlg.Filter := '*.txt|*.txt';
      saveDlg.DefaultExt := 'txt';
      if saveDlg.Execute then
      begin
        if not OutGpsDataForMapinfo(saveDlg.FileName) then exit;
      end;
    finally
      FProgressDlg.Free;
      Self.Enabled := True;
    end;
  finally
    Panel6.Enabled := True;
  end;
end;


procedure TFormHisMain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   umainf.Mainf.show_GPSHostory.Checked:=false;
end;

procedure TFormHisMain.ScrollAxis(Axis: TChartAxis; const Percent: Double);
var
  Amount: Double;
begin
  with Axis do
    begin
      Amount := -((Maximum - Minimum) / (100.0 / Percent));
      SetMinMax(Minimum - Amount, Maximum - Amount);
    end;
end;

procedure TFormHisMain.RecGpsData(pgpsdata: PGpsData_V2);
var
  i: Integer;
  m: TDevice;
  TempLongWord: longWord;
begin
  m := playDevT;
  TempLongWord :=PGpsData.State;
  for i:=0 to 31 do
  begin
    m.Switch[i]:= (TempLongWord and $1)=$1;
    TempLongWord:=TempLongWord shr 1;
  end;
  m.Switch[32]:=true;
end;

procedure TFormHisMain.EditAPageDrawCnt2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9',#3,#8,#20]) then
    key := #0;
end;

procedure TFormHisMain.ReceiveGpsData(pgpsdata: PGpsData_V3);
var
  i: Integer;
  m: TDevice;
  p: TWorldPoint;
  TempLongWord: longWord;
//  isGpsLocate : Boolean;
begin
  m := playDev;

  TempLongWord :=PGpsData.State;
  for i:=0 to 31 do
  begin
     m.Switch[i]:= (TempLongWord and $1)=$1;
     TempLongWord:=TempLongWord shr 1;
  end;
  m.Switch[32]:=true;

  TempLongWord :=PGpsData.WarningSign;
  for i:=0 to 31 do
  begin
     m.Switch_Warning[i]:= (TempLongWord and $1)=$1;
     TempLongWord:=TempLongWord shr 1;
  end;
  m.Switch_Warning[32]:=true;


  p := Project.LoLa2XY(EarthPoint(PGpsData^.Long,PGpsData^.lat));
  if not FBackGoBJ then m.TraceList.AddPoint(p);//����켣��
  m.Longitude := PGpsData^.Long;
  m.Latitude  := PGpsData^.lat;

  if m.Switch[STAT_GPS_LOCATE] then
  begin
      m.Speed     := PGpsData^.Speed;
      m.Orientation :=PGpsData^.Orientation;
      m.GpsTime := PGpsData^.GpsTime;
  end;
  m.Point:=p;   

  for i := 0 to 7 do
    m.State[i] := True;

  m.State[STAT_NEWDATA_GIS] := True;
  m.State[STAT_DEVICE_CONNECTED] := true;

  ADeviceManage.FindMapName(m,p);
  ADeviceManage.JudgeDevOutOrInCArea(m);
end;

procedure TFormHisMain.ReceiveGpsData_V3(pgpsdata: PHistoryGpsData_V3);
var
  i: Integer;
  m: TDevice;
  p: TWorldPoint;
  TempLongWord: longWord;
//  isGpsLocate : Boolean;
begin
  if PlayDev.GpsTime < PGpsData^.GpsTime then
  begin
    m := playDev;

    TempLongWord :=PGpsData.State;
    for i:=0 to 31 do
    begin
       m.Switch[i]:= (TempLongWord and $1)=$1;
       TempLongWord:=TempLongWord shr 1;
    end;
    m.Switch[32]:=true;

    TempLongWord :=PGpsData.WarningSign;
    for i:=0 to 31 do
    begin
       m.Switch_Warning[i]:= (TempLongWord and $1)=$1;
       TempLongWord:=TempLongWord shr 1;
    end;
    m.Switch_Warning[32]:=true;


    p := Project.LoLa2XY(EarthPoint(PGpsData^.Long,PGpsData^.lat));
    //if not FBackGoBJ then m.TraceList.AddPoint(p);//����켣��
    m.Longitude := PGpsData^.Long;
    m.Latitude  := PGpsData^.lat;

//    if m.Switch[STAT_GPS_LOCATE] then
//    begin
        m.Speed     := PGpsData^.Speed;
        m.Orientation :=PGpsData^.Orientation;
        m.GpsTime := PGpsData^.GpsTime;
//    end;
    m.Point:=p;

    for i := 0 to 7 do
      m.State[i] := True;

    m.State[STAT_NEWDATA_GIS] := True;
    m.State[STAT_DEVICE_CONNECTED] := true;

    m.SetOnline_PlayHis(True);

    ADeviceManage.FindMapName(m,p);
    ADeviceManage.JudgeDevOutOrInCArea(m);
  end;
end;

procedure TFormHisMain.ReceiveGpsData_PlayBack_V3(pgpsdata: PHistoryGpsData_V3);
var
  i: Integer;
  m: TDevice;
  p: TWorldPoint;
  TempLongWord: longWord;
//  isGpsLocate : Boolean;
begin
  if PlayDev.GpsTime > PGpsData^.GpsTime then
  begin
    m := playDev;

    TempLongWord :=PGpsData.State;
    for i:=0 to 31 do
    begin
       m.Switch[i]:= (TempLongWord and $1)=$1;
       TempLongWord:=TempLongWord shr 1;
    end;
    m.Switch[32]:=true;

    TempLongWord :=PGpsData.WarningSign;
    for i:=0 to 31 do
    begin
       m.Switch_Warning[i]:= (TempLongWord and $1)=$1;
       TempLongWord:=TempLongWord shr 1;
    end;
    m.Switch_Warning[32]:=true;


    p := Project.LoLa2XY(EarthPoint(PGpsData^.Long,PGpsData^.lat));
    if not FBackGoBJ then m.TraceList.AddPoint(p);//����켣��
    m.Longitude := PGpsData^.Long;
    m.Latitude  := PGpsData^.lat;

    if m.Switch[STAT_GPS_LOCATE] then
    begin
        m.Speed     := PGpsData^.Speed;
        m.Orientation :=PGpsData^.Orientation;
        m.GpsTime := PGpsData^.GpsTime;
    end;
    m.Point:=p;

    for i := 0 to 7 do
      m.State[i] := True;

    m.State[STAT_NEWDATA_GIS] := True;
    m.State[STAT_DEVICE_CONNECTED] := true;

    ADeviceManage.FindMapName(m,p);
    ADeviceManage.JudgeDevOutOrInCArea(m);
  end;
end;

procedure TFormHisMain.ReceiveGpsData;
var
  gpsdata: THistoryGpsData_V3; //TGpsData_V3;//TGpsData_V2; //TGpsData;
  orggpsdata: TQueryHistoryGpsData_V3; //TCmdSrvTermGpsData_V3;//TCmdSrvTermGpsData_V2;//TCmdSrvtermGpsdata;
  sLog, sLat: string;
begin
  if FTrackPlay = nil then Exit;
  if (FTrackPlay.Next) and (FTrackPlay.Data <> nil) then
  begin
    if FTrackPlay.Current = FTrackPlay.Count - 1 then
    begin
      play_pauseExecute(play_pause);
    end
    else
    begin
      orggpsdata := FTrackPlay.Data^;
      TransCmdGpsData(orggpsdata,gpsdata);
      ReceiveGpsData_V3(@gpsdata);
      show_GpsData_InListView_V3(@gpsdata);

      sLog := FormatFloat('0.000', gpsdata.Long);
      sLat := FormatFloat('0.000', gpsdata.Lat);
      if (sLog <> FLastLong) or (sLat <> FLastLong) then
      begin
        locateCar(PlayDev.Car.No, gpsdata.Long, gpsdata.Lat, gpsdata.Speed, gpsdata.Orientation, '');
        FLastLong := sLog;
        FLastLat := sLat;
      end;
      TrackBar_Play.Position:= TrackBar_Play.Position + 1;
    end;
  end
  else if (FTrackPlay.Eof) then //�طŵ�������
    play_stopExecute(play_stop);
end;

procedure TFormHisMain.BitBtnShowListInfoClick(Sender: TObject);
var
  thd:TOutAddrListThread;
  dlg:TFrmHisListAddr;
  progressDlg: TFrmRefreshProgress;
begin
  if FTrackPlay.Count <= 0 then
    Exit;
    
  BitBtnShowListInfo.Enabled := False;
  
  dlg := umainf.Mainf.ShowList_HisAddr();
  dlg.cxTreeList1.Clear;
  dlg.panelBottom.caption :='';

  if FTrackPlay = nil then exit;
  progressDlg := TFrmRefreshProgress.Create(self);
  thd := TOutAddrListThread.Create;
  thd.FreeOnTerminate := true;
  thd.OnTerminate := DoOnOutAddrListTerminate;
  thd.dlg := dlg;
  thd.progressDlg := progressDlg;
  progressDlg.Gauge1.MaxValue := FTrackPlay.Count+1;
  progressDlg.SetCaption('���ڽ������ݣ����Ժ�...');
  progressDlg.show;
  progressDlg.GaugeProcessInc(1);
  thd.SetBufInfo(FTrackPlay);

  thd.Resume;
end;

procedure TFormHisMain.DoOnOutAddrListTerminate(Sender: TObject);
begin
  umainf.Mainf.ShowHisAddrList_ToFront;
end;


{ TOutAddrListThread }

constructor TOutAddrListThread.Create;
begin
  inherited Create(true);

end;

destructor TOutAddrListThread.Destroy;
begin

  inherited;
end;

procedure TOutAddrListThread.Execute;
var
  j: Integer;
  sumSpeed,maxSpeed :Double;
  gpsSrvTermData: TQueryHistoryGpsData_V3; //TCmdSrvTermGpsData_V3;
  gpsData: THistoryGpsData_V3; //TGpsData_V3;
  lastLong, lastLati: Double;
  lastAddr: string;
begin
  coinitialize(nil);
  try
    try
      lastLong := 0;
      lastLati := 0;
      lastAddr := '';
      for j:=0 to FBufCnt -1 do
      begin
        try
          gpsSrvTermData := TQueryHistoryGpsData_V3(FBufGpsDataAry[j]);
          TransCmdGpsData(gpsSrvTermData,gpsData);
          gpsTime := FormatDateTime('yyyy-mm-dd hh:nn:ss',gpsdata.GpsTime);
          speed := StringToFloat(FormatFloat('##0.0', gpsData.Speed/10));
          sumSpeed := sumSpeed +speed;
          if maxSpeed <  speed then
            maxSpeed := speed;
          locatStr := '����λ';
          //��λͼ
          if ((gpsdata.State and $02)=$02) then
          begin
            locatStr := '��λ';
          end;

          longiStr := FormatFloat('0.000000',gpsData.Long);
          latiStr  := FormatFloat('0.000000',gpsData.Lat);
          //if (gpsData.Long = lastLong) and (gpsData.Lat = lastLati) then
          if (FormatFloat('0.000', gpsData.Long) = FormatFloat('0.000', lastLong))
          and (FormatFloat('0.000', gpsData.Lat) = FormatFloat('0.000', lastLati)) then
          begin
            //addrStr := lastAddr;
            Continue;
          end
          else
          begin
            addrStr := ReturnAddrByLongLati(gpsData.Long,gpsData.Lat);
          end;
          Synchronize(SysOutOneInfo);
          Synchronize(SysAddProgress);

          lastLong := gpsData.Long;
          lastLati := gpsData.Lat;
          lastAddr := addrStr;
        except
        end;
      end;
      maxAvgSpeedStr :='����ٶ�:'+FormatFloat('0.0', maxSpeed)+
        'km/h, ƽ���ٶȣ�'+FormatFloat('0.0', sumSpeed / FBufCnt)+'km/h';

      Synchronize(SysShowMaxAvgSpeed);
    finally
      Synchronize(SynCloseDlgProgress);
    end;
  except on e:Exception do
    MessageBox(Handle,PChar(e.Message),'��ʾ',MB_OK + MB_ICONINFORMATION);
  end;
  CoUninitialize;
  terminate;  
end;

procedure TOutAddrListThread.SysAddProgress;
begin
  progressDlg.GaugeProcessInc(1);
end;


function TOutAddrListThread.ReturnAddrByLongLati(longi,
  lati: double): string;
begin
  result := GetAddrSevice().GetAddrFromLongiLati(longi,lati);
end;

procedure TOutAddrListThread.SysOutOneInfo;
begin
  dlg.cxTreeList1.BeginUpdate;
  try
    with dlg.cxTreeList1.Add do       
    begin
      Values[0] := gpsTime;
      Values[1] := speed;
      Values[2] := longiStr;
      Values[3] := latiStr;
      Values[4] := locatStr;
      Values[5] := addrStr;
    end;
  finally
    dlg.cxTreeList1.EndUpdate;
//    Application.ProcessMessages;
  end;
end;

procedure TOutAddrListThread.SysShowMaxAvgSpeed;
begin
  dlg.PanelBottom.Caption := maxAvgSpeedStr;
end;

procedure TOutAddrListThread.SetBufInfo(FTrackPlay: TTrackPlay);
var
  i:integer;
begin
  FBufCnt := FTrackPlay.Count;
  SetLength(FBufGpsDataAry,FBufCnt);
  for i:=0 to FBufCnt- 1 do
  begin
    FBufGpsDataAry[i] := FTrackPlay.Buf.Data[i];
  end;

end;

procedure TOutAddrListThread.SynCloseDlgProgress;
begin
  if (Assigned(progressDlg)) then
    progressDlg.Free;
  Mainf.FDlg_HisForm.BitBtnShowListInfo.Enabled := True;
end;

procedure TFormHisMain.Timer1Timer(Sender: TObject);
var
  addCount: Integer;
begin
  try
    if FTrackPlay.Count - (FLastHisDataAddIndex + 1) > 0 then
    begin
      addCount := 400;
      FLastHisDataAddIndex := FLastHisDataAddIndex + PutHisGpsNew(FTrackPlay, FLastHisDataAddIndex, addCount) - 1;
      lblAddGpsCountTip.Caption := '��ͼ�Ϲ켣���Ѽ��ص�����' + IntToStr(FLastHisDataAddIndex + 1) + ' ';
    end;
  except
    on E: Exception do
    begin
      addSysLog('�켣�ط�Timer1�쳣:' + E.Message);
    end;  
  end;
end;

procedure TFormHisMain.DoOnAddGpsData(gpsData: TQueryHistoryGpsData_V3);
begin
  FTrackPlay.SetNewCount(FTrackPlay.Count + 1);
  FTrackPlay.AddGpsData(gpsData);
  TrackBar_Play.Max := FTrackPlay.Count;
end;

end.
