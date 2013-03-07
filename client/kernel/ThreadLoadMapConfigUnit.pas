unit ThreadLoadMapConfigUnit;

interface
uses
  Classes;

type
  TThreadLoadMapConfig = class(TThread)
  private
    FConfigFilePath: string;
    procedure LoadMapConfig;
  protected
    procedure Execute; override;
  public
    constructor Create(filePath: string); virtual;
    destructor Destroy; override;
  end;

implementation
uses
  uGloabVar, MapPubUnit, MapManagerUnit;

{ TThreadLoadMapConfig }

constructor TThreadLoadMapConfig.Create(filePath: string);
begin
  inherited Create(False);
  FConfigFilePath := filePath;
  FreeOnTerminate := True;
end;

destructor TThreadLoadMapConfig.Destroy;
begin

  inherited;
end;

procedure TThreadLoadMapConfig.Execute;
begin
  LoadMapConfig;     
end;

procedure TThreadLoadMapConfig.LoadMapConfig;
begin
  MapManger := TMapManger.Create('È«¹ú');
  MapManger.LoadFile(FConfigFilePath);
  FIsMapConfigLoaded := True;
end;

end.
