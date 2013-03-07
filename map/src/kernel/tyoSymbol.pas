unit tyoSymbol;
interface
uses
   Windows,
   Classes,
   Graphics,
   MetaDefine,
   elog,
   Sysutils,
   forms,
   extctrls;

type
  TSymbolName = string[32];
  TCustomSymbolIndex=record
    Index:integer;
    FileName: TSymbolName;
  end;

  TCustomSymbols=Class(TObject)
  private
    FCustomSymbolIndex:array of TCustomSymbolIndex;
    FBitMap:TBitMap;
    FSymbolHeight:integer;  //符号长宽相等.
    FSymbolCount:integer;
    FLoadSwitchBitMap:TBitmap;
    FTransparentColor:TColor;
    FPath:string;
  public
    constructor Create;
    destructor Destroy;override;
    procedure SetPath(APath:string);
    function GetPath:string;
    procedure GetSymbolOffset(AFileName: TSymbolName;var X,Y:integer);
    function GetSymbolRect(AFileName: TSymbolName):TRect;
    function GetSymbolDC:HDC;
    property TransparentColor:TColor
      read FTransparentColor Write FTransparentColor;
  end;
implementation
uses
  tyoGraph, RunData;
constructor TCustomSymbols.Create;
begin
  SetLength(FCustomSymbolIndex,20);
  FBitMap:=TBitMap.Create;

  FTransparentColor:=clWhite;
  FSymbolHeight:=32;  //符号长宽相等.
  FSymbolCount:=0;
  FBitMap.Width:=FSymbolHeight;
  FBitMap.Height:=20*FSymbolHeight;
  //FPath:=ExtractFilePath(Application.ExeName)+'..\GISSYMB\';
  FPath:=ExtractFilePath(Application.ExeName)+'GISSYMB\';
end;

destructor TCustomSymbols.Destroy;
begin
  FBitMap.Free;
end;

function TCustomSymbols.GetPath: string;
begin
  Result:=FPath;
end;

function TCustomSymbols.GetSymbolDC: HDC;
begin
  Result:=FBitmap.Canvas.Handle;
end;

procedure TCustomSymbols.GetSymbolOffset(AFileName: TSymbolName; var X,
  Y: integer);
var
  i:integer;
  rect:TRect;
  n: string;
begin
  for i:=0 to FSymbolCount-1 do
  begin
    if FCustomSymbolIndex[i].FileName=AFilename then
    begin
      X:=0;
      Y:=i*FSymbolHeight;
      Exit;
    end;
  end;
  //符号不在队列中需要从文件载入
  Inc(FSymbolCount);
  if FSymbolCount>Length(FCustomSymbolIndex) then
  begin
    SetLength(FCustomSymbolIndex,Length(FCustomSymbolIndex)+20);
    FBitmap.Height:= FBitmap.Height+20*FSymbolHeight;
  end;
  try
    try
      FLoadSwitchBitMap:=TBitmap.Create;
      rect.Left:=0;
      rect.Top:=(FSymbolCount-1)*FSymbolHeight;
      rect.Right:=rect.Left+FSymbolHeight;
      rect.Bottom:=rect.Top+FSymbolHeight;
      n := ChangeFileExt(AFileName,'');
      FLoadSwitchBitMap.Handle := LoadBitmap(RuntimeData.BitmapHandle,PChar(n));
      if FLoadSwitchBitMap.Handle = 0 then
        FLoadSwitchBitMap.Handle := LoadBitmap(RuntimeData.BitmapHandle,'PIN1-32.BMP');

      if FileExists(FPath+AFileName) then
        FLoadSwitchBitMap.LoadFromFile(FPath+AFileName)
      else
      begin
        FLoadSwitchBitMap.LoadFromFile(FPath+'PIN1-32.BMP');
      end;

      FBitmap.Canvas.StretchDraw(rect,FLoadSwitchBitMap);
      X:=rect.Left;
      Y:=rect.Top;
      FCustomSymbolIndex[FSymbolCount-1].FileName:=AFileName;
      FCustomSymbolIndex[FSymbolCount-1].Index:=FSymbolCount;
    except

    end;
  finally
    FLoadSwitchBitMap.Free;
  end;

end;

function TCustomSymbols.GetSymbolRect(AFileName: TSymbolName): TRect;
var x,y:integer;
begin
  AFileName:=UPPERCASE(AFileName);
  GetSymbolOffset(AFileName,x,y);
  Result.Left:=x;
  Result.Top:=y;
  Result.Right:=FSymbolHeight+Result.Left;
  Result.Bottom:=FSymbolHeight+Result.Top;
end;

procedure TCustomSymbols.SetPath(APath:string);
begin
  FPath:=APath;
  if (FPath[Length(FPath)]='/') or (FPath[Length(FPath)]='\') then
  else FPath:=FPath+'\';
end;


end.
