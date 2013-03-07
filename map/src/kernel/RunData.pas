unit RunData;

interface
uses
  MetaDefine,
  elog;

type
  TRTData=class(TObject)
  private
    FObjectSelectType: Integer;
    FLabelFont: TTrueFontStruct;
    FHelpFile: string;
    FDebugMode: Boolean;
    function GetExeName: string;
    function GetExePath: string;
    function GetProgramPath: string;
    procedure SetObjectSelectType(const Value: Integer);
    procedure SetLabelFont(const Value: TTrueFontStruct);
    procedure SetHelpFile(const Value: string);
    function GetResHandle: Integer;
    procedure SetDebugMode(const Value: Boolean);
    function GetBitmapHandle: Integer;
  protected
    procedure SaveToRegistry;virtual;
    procedure LoadFromRegistry;virtual;
  public
    constructor Create();virtual;
    destructor Destroy();override;
    function GetID:longword;
    {保存数据}
    procedure SaveData;virtual;
    {载入数据}
    procedure LoadData;virtual;
    function GetRegRootkey:Longword;
    function GetRegPath:string;
    procedure LoadResource();
    procedure LoadBitmap();
    property ExeName:string read GetExeName;
    property ExePath:string read GetExePath;
    property ProgramPath:string read GetProgramPath;
    property ObjectSelectType:Integer read FObjectSelectType Write SetObjectSelectType;
    property LabelFont:TTrueFontStruct read FLabelFont write SetLabelFont;
    property HelpFile:string read FHelpFile Write SetHelpFile;
    property ResHandle:Integer read GetResHandle;
    property BitmapHandle: Integer read GetBitmapHandle;
    property DebugMode:Boolean read FDebugMode Write SetDebugMode;
  end;
  function GlobalDebug:TErrorLog;
  function RuntimeData: TRTData;

implementation
uses
  sysutils,
  staticproc,
  windows,
  Forms,
  emapker,
  Controls,
  Registry,
  Graphics,
  tyoexception;
const
  REGROOTKEY=HKEY_LOCAL_MACHINE;
  REGPATH='\SOFTWARE\Toyoyo\';
var
  FRuntimeData: TRTData;
  FGlobalDebug: TErrorLog;
  FID:LongWord;
  FResHandle: Integer = 0;
  FBitMapHandle: Integer = 0;

constructor TRTData.Create;
//var
//  sysdir: PChar;
//  fsavename: string;
begin
  FObjectSelectType:=1;
  with FLabelFont do
  begin
    Size:=12;
    ForeColor:=clBlack;
    BackColor:=clWhite;
    Transparent:=0;
    FontName:='宋体';
    FontStyle:=0;
    Rotation:=0;
  end;
  LoadData;
end;

function TRTData.GetExeName: string;
begin
  Result:=Application.ExeName;
end;

function TRTData.GetExePath: string;
begin
  Result:=ExtractFilePath(ExeName);
end;

function TRTData.GetID: longword;
begin
  inc(FID);
  Result:=FID;
end;

function TRTData.GetProgramPath: string;
//var
//  i:Integer;
begin
  Result := ExtractFilePath(ExeName);
  Result := ExpandFileName(Result+'..\');
end;

procedure TRTData.LoadData;
begin
  LoadFromRegistry;
end;

procedure TRTData.SaveData;
begin
  SaveToRegistry;
end;

procedure TRTData.LoadFromRegistry;
var
  reg:TRegistry;
begin
  reg := TRegistry.Create;
  try
    try
      reg.RootKey:=REGROOTKEY;
      if reg.OpenKey(REGPATH+'RT\ACT\',False) then
      begin
        //start load
        FObjectSelectType:=reg.ReadInteger('ObjectSelectType');
      end;
      if reg.OpenKey(REGPATH+'RT\MAP\',False) then
      begin
        reg.ReadBinaryData('LabelFont',FLabelFont,SizeOf(FLabelFont));
      end;
    except

    end;
  finally
    reg.Free;
  end;
end;

procedure TRTData.SaveToRegistry;
var
  reg:TRegistry;
begin
  reg := TRegistry.Create;
  try
    reg.RootKey:=REGROOTKEY;
    if reg.OpenKey(REGPATH+'RT\ACT\',True) then
    begin
      //start save
      reg.WriteInteger('ObjectSelectType',FObjectSelectType);
    end;
    if reg.OpenKey(REGPATH+'RT\MAP\',True) then
    begin
      reg.WriteBinaryData('LabelFont',FLabelFont,SizeOf(FLabelFont));
    end;
  finally
    reg.Free;
  end;
end;

function GlobalDebug:TErrorLog;
begin
  if FGlobalDebug = nil then
    FGlobalDebug := TErrorLog.Create;
  Result:=FGlobalDebug;
end;

function RuntimeData: TRTData;
begin
  if FRuntimeData=nil then
  begin
    FRuntimeData:=TRTData.Create();
    FRuntimeData.LoadData;
  end;
  Result := FRuntimeData;
end;


procedure TRTData.SetObjectSelectType(const Value: Integer);
begin
  FObjectSelectType := Value;
end;

function TRTData.GetRegPath: string;
begin
  Result:=REGPATH;
end;

function TRTData.GetRegRootkey: Longword;
begin
  Result:=REGROOTKEY;
end;

procedure TRTData.SetLabelFont(const Value: TTrueFontStruct);
begin
  FLabelFont := Value;
end;

procedure TRTData.SetHelpFile(const Value: string);
begin
  FHelpFile := Value;
end;

procedure TRTData.LoadResource;//载入光标资源--sha 注
var
  modalName: string;
begin
  if FResHandle<>0 then Exit;
  modalName:=ExePath+'action.dll';
  FResHandle:=LoadLibrary(PChar(modalName));
  if FResHandle=0 then raise ENotFoundResource.Create; //dxf
  Screen.Cursors[crHandCursor]:=LoadCursor(FResHandle,'move');
  Screen.Cursors[crMoveHandCursor]:=LoadCursor(FResHandle,'Move');
  Screen.Cursors[crZoomIn]:=LoadCursor(FResHandle,'ZoomIn');
  Screen.Cursors[crZoomOut]:=LoadCursor(FResHandle,'ZoomOut');
  Screen.Cursors[crGetEntifyInfo]:=LoadCursor(FResHandle,'check');
  Screen.Cursors[crMeasure]:=LoadCursor(FResHandle,'measure');
  Screen.Cursors[crAniRectSelectCursor]:=LoadCursor(FResHandle,'RectSelect');
  Screen.Cursors[crPointSelect]:=LoadCursor(FResHandle,'PointSelect');
  try
    Screen.Cursors[crDevAreaCircle]:=LoadCursor(FResHandle,'circle');//车机区域_圆形 sha 20110610
    Screen.Cursors[crDevAreaRect]:=LoadCursor(FResHandle,'Rect');
    Screen.Cursors[crDevAreaPolygon]:=LoadCursor(FResHandle,'polygen');
  except
    Screen.Cursors[crDevAreaCircle]:=LoadCursor(FResHandle,'check');
    Screen.Cursors[crDevAreaRect]:=LoadCursor(FResHandle,'check');
    Screen.Cursors[crDevAreaPolygon]:=LoadCursor(FResHandle,'check');
  end;
end;

destructor TRTData.Destroy;
begin
  SaveData;
  if FResHandle<>0 then
    FreeLibrary(FResHandle);
  if FBitMapHandle <> 0 then
    FreeLibrary(FBitMapHandle);
  inherited;
end;

function TRTData.GetResHandle: Integer;
begin
  Result:=FResHandle;
end;

procedure TRTData.SetDebugMode(const Value: Boolean);
begin
  FDebugMode := Value;
end;

procedure TRTData.LoadBitmap;
var
  modalName: string;
begin
  if FBitMapHandle<>0 then Exit;
  modalName := ExePath+'graph.dll';
  FBitMapHandle := LoadLibrary(PChar(modalName));
  if FBitMapHandle = 0 then raise ENotFoundResource.Create;
end;

function TRTData.GetBitmapHandle: Integer;
begin
  Result := FBitMapHandle;
end;

initialization
  FGlobalDebug:=nil;
  FID:=0;

finalization
  if FRuntimeData <> nil then
    FRuntimeData.Free;
  FGlobalDebug.Free;
end.
