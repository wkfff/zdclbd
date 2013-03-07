{参数类，
 @author(wlei)
 @created(2006-9-26)
 @lastmod(GMT:$Date: 2012/10/29 01:46:44 $) <BR>
 最后更新人:$Author: wfp $  <BR>
 当前版本:$Revision: 1.1.1.1 $  <BR>}
{*****************************************************
 @author:王磊（闲庭信步工作室 http://www.chinaworkroom.com）
 @created(2005-08-15)
 最后更新人:$Author: wfp $  <BR>
 当前版本:$Revision: 1.1.1.1 $  <BR>
*******************************************************}
unit ParamUnit;

interface
uses
  inifiles, SysUtils;
type
  TIniParam = class(TObject)
  private
    FIni: TIniFile;
    FLogDir: string;
    FDbIp: string;
    FDbName: string;
    FDbPass: string;
    FCallCenterServer: Boolean;
    FPhotoSever: Boolean;
    FHistoryServer: Boolean;
    FGpsDataDbIp: string;
    FGpsHisDataDbIp: string;
    FGpsCallCenterDbIp: string;
    FGpsPhotoDbIp: string;
    FGpsPhotoDbUser: string;
    FGpsCallCenterDbUser: string;
    FGpsDataDbUser: string;
    FGpsHisDataDbUser: string;
    FGpsCallCenterDbPass: string;
    FGpsHisDataDbPass: string;
    FGpsDataDbPass: string;
    FGpsPhotoDbPass: string;
    FgpsDataDbName: string;
    FGpsHisDataDbName: string;
    FGpsCallCenterDbName: string;
    FGpsPhotoDbName: string;
    FGpsHistorydataVer: string;
    FGpsBusDbIp: string;
    FGpsBusDbUser: string;
    FGpsBusDbPass: string;
    FGpsBusDbName: string;
    FGpsExtendDbName: string;
    FGpsExtendDbIp: string;
    FGpsExtendDbPass: string;
    FGpsExtendDbUser: string;
    procedure SetDbIp(const Value: string);
    procedure SetLogDri(const Value: string);
    procedure SetDbName(const Value: string);
    procedure SetDbPass(const Value: string);
    procedure SetCallCenterServer(const Value: Boolean);
    procedure SetHistoryServer(const Value: Boolean);
    procedure SetPhotoSever(const Value: Boolean);
    procedure SetGpsCallCenterDbIp(const Value: string);
    procedure SetGpsDataDbIp(const Value: string);
    procedure SetGpsHisDataDbIp(const Value: string);
    procedure SetGpsPhotoDbIp(const Value: string);
    procedure SetGpsCallCenterDbPass(const Value: string);
    procedure SetGpsCallCenterDbUser(const Value: string);
    procedure SetGpsDataDbPass(const Value: string);
    procedure SetGpsDataDbUser(const Value: string);
    procedure SetGpsHisDataDbPass(const Value: string);
    procedure SetGpsHisDataDbUser(const Value: string);
    procedure SetGpsPhotoDbUser(const Value: string);
    procedure SetGpsPhotoDbPass(const Value: string);
    procedure SetGpsCallCenterDbName(const Value: string);
    procedure SetgpsDataDbName(const Value: string);
    procedure SetGpsHisDataDbName(const Value: string);
    procedure SetGpsPhotoDbName(const Value: string);
    procedure SetGpsHistorydataVer(const Value: string);
    procedure SetGpsBusDbIp(const Value: string);
    procedure SetGpsBusDbName(const Value: string);
    procedure SetGpsBusDbPass(const Value: string);
    procedure SetGpsBusDbUser(const Value: string);
    procedure SetGpsExtendDbIp(const Value: string);
    procedure SetGpsExtendDbName(const Value: string);
    procedure SetGpsExtendDbPass(const Value: string);
    procedure SetGpsExtendDbUser(const Value: string);
  protected

  public
    constructor Create;
    destructor Destroy; override;
    procedure SaveParams;
    procedure LoadParams;

    property GpsDataDbIp:string read FGpsDataDbIp write SetGpsDataDbIp;
    property GpsDataDbUser:string read FGpsDataDbUser write SetGpsDataDbUser;
    property GpsDataDbPass:string read FGpsDataDbPass write SetGpsDataDbPass;
    property gpsDataDbName:string read FgpsDataDbName write SetgpsDataDbName;
    property GpsHisDataDbIp:string read FGpsHisDataDbIp write SetGpsHisDataDbIp;
    property GpsHisDataDbUser:string read FGpsHisDataDbUser write SetGpsHisDataDbUser;
    property GpsHisDataDbPass:string read FGpsHisDataDbPass write SetGpsHisDataDbPass;
    property GpsHisDataDbName:string read FGpsHisDataDbName write SetGpsHisDataDbName;
    property GpsPhotoDbIp:string read FGpsPhotoDbIp write SetGpsPhotoDbIp;
    property GpsPhotoDbUser:string read FGpsPhotoDbUser write SetGpsPhotoDbUser;
    property GpsPhotoDbPass:string read FGpsPhotoDbPass write SetGpsPhotoDbPass;
    property GpsPhotoDbName:string read FGpsPhotoDbName write SetGpsPhotoDbName;
    property GpsCallCenterDbIp:string read FGpsCallCenterDbIp write SetGpsCallCenterDbIp;
    property GpsCallCenterDbUser:string read FGpsCallCenterDbUser write SetGpsCallCenterDbUser;
    property GpsCallCenterDbPass:string read FGpsCallCenterDbPass write SetGpsCallCenterDbPass;
    property GpsCallCenterDbName:string read FGpsCallCenterDbName write SetGpsCallCenterDbName;
    property GpsBusDbIp:string read FGpsBusDbIp write SetGpsBusDbIp;
    property GpsBusDbUser:string read FGpsBusDbUser write SetGpsBusDbUser;
    property GpsBusDbPass:string read FGpsBusDbPass write SetGpsBusDbPass;
    property GpsBusDbName:string read FGpsBusDbName write SetGpsBusDbName;
    property GpsExtendDbIp:string read FGpsExtendDbIp write SetGpsExtendDbIp;
    property GpsExtendDbUser:string read FGpsExtendDbUser write SetGpsExtendDbUser;
    property GpsExtendDbPass:string read FGpsExtendDbPass write SetGpsExtendDbPass;
    property GpsExtendDbName:string read FGpsExtendDbName write SetGpsExtendDbName;
    property GpsHistorydataVer:string read FGpsHistorydataVer write SetGpsHistorydataVer;
    property LogDir: string read FLogDir write SetLogDri;
    property PhotoSever: Boolean read FPhotoSever write SetPhotoSever;
    property CallCenterServer: Boolean read FCallCenterServer write SetCallCenterServer;
    property HistoryServer: Boolean read FHistoryServer write SetHistoryServer;
  published

  end;
var
  FIniParam: TIniParam;
function ParamCfg: TIniParam;
implementation

{ TIniParam }
function ParamCfg: TIniParam;
begin
  if FIniParam = nil then
    FIniParam := TIniParam.Create;
  Result := FIniParam;
end;
constructor TIniParam.Create;
begin
  inherited;
  FIni := TIniFile.Create(ExtractFilePath(Paramstr(0)) + 'AppServer_config.ini');
end;


destructor TIniParam.Destroy;
begin
  FIni.Free;
  inherited;
end;
procedure TIniParam.LoadParams;
begin
  try
    FGpsDataDbIp := FIni.ReadString('GpsDataDbIp','GpsDataDbIp','127.0.0.1');
    FGpsDataDbUser := FIni.ReadString('GpsDataDbUser','GpsDataDbUser','sa');
    FGpsDataDbPass := FIni.ReadString('GpsDataDbPass','GpsDataDbPass','sa');
    FGpsHisDataDbIp := FIni.ReadString('GpsHisDataDbIp','GpsHisDataDbIp','127.0.0.1');
    FGpsHisDataDbUser := FIni.ReadString('GpsHisDataDbUser','GpsHisDataDbUser','sa');
    FGpsHisDataDbPass := FIni.ReadString('GpsHisDataDbPass','GpsHisDataDbPass','sa');
    FGpsPhotoDbIp :=FIni.ReadString('GpsPhotoDbIp','GpsPhotoDbIp','127.0.0.1');
    FGpsPhotoDbUser := FIni.ReadString('GpsPhotoDbUser','GpsPhotoDbUser','sa');
    FGpsPhotoDbPass := FIni.ReadString('GpsPhotoDbPass','GpsPhotoDbPass','sa');
    FGpsCallCenterDbIp :=FIni.ReadString('GpsCallCenterDbIp','GpsCallCenterDbIp','127.0.0.1');
    FGpsCallCenterDbUser := FIni.ReadString('GpsCallCenterDbUser','GpsCallCenterDbUser','sa');
    FGpsCallCenterDbPass := FIni.ReadString('GpsCallCenterDbPass','GpsCallCenterDbPass','sa');
    FGpsHistorydataVer := FIni.ReadString('GpsHistorydataVer','GpsHistorydataVer','new');
    FgpsDataDbName := FIni.ReadString('gpsDataDbName','gpsDataDbName','GpsData');
    FGpsHisDataDbName := FIni.ReadString('GpsHisDataDbName','GpsHisDataDbName','GpsdataHistory');
    FGpsPhotoDbName := FIni.ReadString('GpsPhotoDbName','GpsPhotoDbName','GpsPhoto');
    FGpsCallCenterDbName := FIni.ReadString('GpsCallCenterDbName','GpsCallCenterDbName','GpsdataCallCenter');
    FGpsBusDbIp := FIni.ReadString('GpsBusDbIp','GpsBusDbIp','127.0.0.1');
    FGpsBusDbUser := FIni.ReadString('GpsBusDbUser','GpsBusDbUser','sa');
    FGpsBusDbPass := FIni.ReadString('GpsBusDbPass','GpsBusDbPass','sa');
    FGpsBusDbName := FIni.ReadString('GpsBusDbName','GpsBusDbName','GpsBus');
    FGpsExtendDbIp :=  FIni.ReadString('GpsExtendDbIp','GpsExtendDbIp','127.0.0.1');
    FGpsExtendDbUser := FIni.ReadString('GpsExtendDbUser','GpsExtendDbUser','sa');
    FGpsExtendDbPass :=  FIni.ReadString('GpsExtendDbPass','GpsExtendDbPass','sa');
    FGpsExtendDbName :=  FIni.ReadString('GpsExtendDbName','GpsExtendDbName','GPSExtendData');
  except
    FGpsDataDbIp := '127.0.0.1';
    FGpsDataDbUser := 'sa';
    FGpsDataDbPass := 'sa';
    FGpsHisDataDbIp := '127.0.0.1';
    FGpsHisDataDbUser := 'sa';
    FGpsHisDataDbPass := 'sa';
    FGpsPhotoDbIp := '127.0.0.1';
    FGpsPhotoDbUser := 'sa';
    FGpsPhotoDbPass := 'sa';
    FGpsCallCenterDbIp := '127.0.0.1';
    FGpsCallCenterDbUser := 'sa';
    FGpsCallCenterDbPass := 'sa';
    FgpsDataDbName := 'gpsdata';
    FGpsHisDataDbName := 'gpsdatahistory';
    FGpsPhotoDbName := 'gpsPhoto';
    FGpsCallCenterDbName := 'gpscallcenter';
    FGpsBusDbIp := '127.0.0.1';
    FGpsBusDbUser := 'sa';
    FGpsBusDbPass := 'sa';
    FGpsBusDbName := 'GpsBus';
    FGpsExtendDbIp :=  '127.0.0.1';
    FGpsExtendDbUser := 'sa';
    FGpsExtendDbPass :=  'sa';
    FGpsExtendDbName :=  'GPSExtendData';
  end;
  try
    FLogDir := FIni.ReadString('LogDir', 'LogDir', 'c:\');
  except
    FLogDir := 'c:\';
  end;
  try
    FPhotoSever := FIni.ReadBool('PhotoServer', 'PhotoServer', true);
  except
    FPhotoSever := true;
  end;
  try
    FCallCenterServer := FIni.ReadBool('CallCenterServer', 'CallCenterServer', true);
  except
    FCallCenterServer := true;
  end;
  try
    FHistoryServer := FIni.ReadBool('HistoryServer', 'HistoryServer', true);
  except
    FHistoryServer := true;
  end;
end;

procedure TIniParam.SaveParams;
begin
  FIni.WriteString('LogDir', 'LogDir', FLogDir);
  FIni.WriteBool('PhotoServer', 'PhotoServer', FPhotoSever);
  FIni.WriteBool('CallCenterServer', 'CallCenterServer', FCallCenterServer);
  FIni.WriteBool('HistoryServer', 'HistoryServer', FHistoryServer);
  FIni.WriteString('GpsDataDbIp','GpsDataDbIp',FGpsDataDbIp);
  FIni.WriteString('GpsHisDataDbIp','GpsHisDataDbIp',FGpsHisDataDbIp);
  FIni.WriteString('GpsPhotoDbIp','GpsPhotoDbIp',FGpsPhotoDbIp);
  FIni.WriteString('GpsCallCenterDbIp','GpsCallCenterDbIp',FGpsCallCenterDbIp);
  FIni.WriteString('GpsDataDbUser','GpsDataDbUser',FGpsDataDbUser);
  FIni.WriteString('GpsDataDbPass','GpsDataDbPass',FGpsDataDbPass);
  FIni.WriteString('GpsPhotoDbUser','GpsPhotoDbUser',FGpsPhotoDbUser);
  FIni.WriteString('GpsPhotoDbPass','GpsPhotoDbPass',FGpsPhotoDbPass);
  FIni.WriteString('GpsHisDataDbUser','GpsHisDataDbUser',FGpsHisDataDbUser);
  FIni.WriteString('GpsHisDataDbPass','GpsHisDataDbPass',FGpsHisDataDbPass);
  FIni.WriteString('GpsCallCenterDbUser','GpsCallCenterDbUser',FGpsCallCenterDbUser);
  FIni.WriteString('GpsCallCenterDbPass','GpsCallCenterDbPass',FGpsCallCenterDbPass);
  FIni.WriteString('GpsHistorydataVer','GpsHistorydataVer',FGpsHistorydataVer);
  FIni.WriteString('gpsDataDbName','gpsDataDbName',FgpsDataDbName);
  FIni.WriteString('GpsHisDataDbName','GpsHisDataDbName',FGpsHisDataDbName);
  FIni.WriteString('GpsPhotoDbName','GpsPhotoDbName',FGpsPhotoDbName);
  FIni.WriteString('GpsCallCenterDbName','GpsCallCenterDbName',FGpsCallCenterDbName);
  Fini.WriteString('GpsBusDbIp','GpsBusDbIp',FGpsBusDbIp);
  Fini.WriteString('GpsBusDbName','GpsBusDbName',FGpsBusDbName);
  FIni.WriteString('GpsBusDbUser','GpsBusDbUser',FGpsBusDbUser);
  FIni.WriteString('GpsBusDbPass','GpsBusDbPass',FGpsBusDbPass);
  Fini.WriteString('GpsExtendDbIp','GpsExtendDbIp',FGpsExtendDbIp);
  Fini.WriteString('GpsExtendDbName','GpsExtendDbName',FGpsExtendDbName);
  FIni.WriteString('GpsExtendDbUser','GpsExtendDbUser',FGpsExtendDbUser);
  FIni.WriteString('GpsExtendDbPass','GpsExtendDbPass',FGpsExtendDbPass);
end;
{procedure TIniParam.SaveGateIp(tempGateIp: string);
begin
  FIni.WriteString('GateIp', 'GateIp', tempGateIp);
  FGateIp := tempGateIp;
end;
procedure TIniParam.LoadIsNotepad;
begin
  try
    FIsNotepad := FIni.ReadBool('IsNotepad', 'IsNotepad', true);
  except
    FIsNotepad := true;
  end;
end; }

procedure TIniParam.SetCallCenterServer(const Value: Boolean);
begin
  FCallCenterServer := Value;
end;

procedure TIniParam.SetDbIp(const Value: string);
begin
  FDbIp := Value;
end;

procedure TIniParam.SetDbName(const Value: string);
begin
  FDbName := Value;
end;

procedure TIniParam.SetDbPass(const Value: string);
begin
  FDbPass := Value;
end;

procedure TIniParam.SetGpsBusDbIp(const Value: string);
begin
  FGpsBusDbIp := Value;
end;

procedure TIniParam.SetGpsBusDbName(const Value: string);
begin
  FGpsBusDbName := Value;
end;

procedure TIniParam.SetGpsBusDbPass(const Value: string);
begin
  FGpsBusDbPass := Value;
end;

procedure TIniParam.SetGpsBusDbUser(const Value: string);
begin
  FGpsBusDbUser := Value;
end;

procedure TIniParam.SetGpsCallCenterDbIp(const Value: string);
begin
  FGpsCallCenterDbIp := Value;
end;

procedure TIniParam.SetGpsCallCenterDbName(const Value: string);
begin
  FGpsCallCenterDbName := Value;
end;

procedure TIniParam.SetGpsCallCenterDbPass(const Value: string);
begin
  FGpsCallCenterDbPass := Value;
end;

procedure TIniParam.SetGpsCallCenterDbUser(const Value: string);
begin
  FGpsCallCenterDbUser := Value;
end;

procedure TIniParam.SetGpsDataDbIp(const Value: string);
begin
  FGpsDataDbIp := Value;
end;

procedure TIniParam.SetgpsDataDbName(const Value: string);
begin
  FgpsDataDbName := Value;
end;

procedure TIniParam.SetGpsDataDbPass(const Value: string);
begin
  FGpsDataDbPass := Value;
end;

procedure TIniParam.SetGpsDataDbUser(const Value: string);
begin
  FGpsDataDbUser := Value;
end;

procedure TIniParam.SetGpsExtendDbIp(const Value: string);
begin
  FGpsExtendDbIp := Value;
end;

procedure TIniParam.SetGpsExtendDbName(const Value: string);
begin
  FGpsExtendDbName := Value;
end;

procedure TIniParam.SetGpsExtendDbPass(const Value: string);
begin
  FGpsExtendDbPass := Value;
end;

procedure TIniParam.SetGpsExtendDbUser(const Value: string);
begin
  FGpsExtendDbUser := Value;
end;

procedure TIniParam.SetGpsHisDataDbIp(const Value: string);
begin
  FGpsHisDataDbIp := Value;
end;

procedure TIniParam.SetGpsHisDataDbName(const Value: string);
begin
  FGpsHisDataDbName := Value;
end;

procedure TIniParam.SetGpsHisDataDbPass(const Value: string);
begin
  FGpsHisDataDbPass := Value;
end;

procedure TIniParam.SetGpsHisDataDbUser(const Value: string);
begin
  FGpsHisDataDbUser := Value;
end;

procedure TIniParam.SetGpsHistorydataVer(const Value: string);
begin
  FGpsHistorydataVer := Value;
end;

procedure TIniParam.SetGpsPhotoDbIp(const Value: string);
begin
  FGpsPhotoDbIp := Value;
end;

procedure TIniParam.SetGpsPhotoDbName(const Value: string);
begin
  FGpsPhotoDbName := Value;
end;

procedure TIniParam.SetGpsPhotoDbPass(const Value: string);
begin
  FGpsPhotoDbPass := Value;
end;

procedure TIniParam.SetGpsPhotoDbUser(const Value: string);
begin
  FGpsPhotoDbUser := Value;
end;

procedure TIniParam.SetHistoryServer(const Value: Boolean);
begin
  FHistoryServer := Value;
end;

procedure TIniParam.SetLogDri(const Value: string);
begin
  FLogDir := Value;
end;

procedure TIniParam.SetPhotoSever(const Value: Boolean);
begin
  FPhotoSever := Value;
end;

initialization
  FIniParam := nil;
  ParamCfg();
  ParamCfg().LoadParams;
finalization
  FIniParam.Free;
end.
