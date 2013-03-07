unit DebugUnit;

interface
uses
  SystemLog, Forms;
type
  TDebug = class;
  TDebug = class
  private
    FLog: TSystemLog;
    procedure SetDebugFile(const Value: string);
    function GetDebugFile: string;
  public
    class function GetInstance: TDebug;
    constructor Create;
    destructor Destroy; override;
    procedure SendDebug(const DebugContent: string); overload;
    procedure SendDebug(const DebugName, DebugContent: string); overload;
    property DebugFile: string read GetDebugFile write SetDebugFile;
  end;
implementation

uses SysUtils;

var
  localDebug: TDebug = nil;
{ TDebug }

constructor TDebug.Create;
begin
  inherited;
  FLog := TSystemLog.Create;
  FLog.LogFile := Application.ExeName + '.err.log';
end;

destructor TDebug.Destroy;
begin
  FLog.Free;
  inherited;
end;

function TDebug.GetDebugFile: string;
begin
  Result := FLog.LogFile;
end;

class function TDebug.GetInstance: TDebug;
begin
  if localDebug = nil then
  begin
    localDebug := TDebug.Create;
    localDebug.DebugFile := Application.ExeName + '.err.log';
    localDebug.FLog.WriteImmediate := true;
  end;
  Result := localDebug;
end;

procedure TDebug.SendDebug(const DebugContent: string);
begin
  FLog.AddLog(DebugContent);
end;

procedure TDebug.SendDebug(const DebugName, DebugContent: string);
begin
  FLog.AddLog(DebugName, DebugContent);
end;

procedure TDebug.SetDebugFile(const Value: string);
begin
  FLog.LogFile := Value;
end;
initialization
finalization
  FreeAndNil(localDebug);
end.
