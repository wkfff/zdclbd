unit Bitmaps;

interface
uses
  Windows,
  Classes,
  MetaDefine,
  shellapi,
  Sysutils,
  Types,
  Graphics,
  Dialogs;
  { TODO -o吕洪波 : 位图List }
type
  TBitmapList=Class(TObject)
  private
    FBitmap:TBitMap;
    FIndex:TIntegerDynArray;
    {** 每一个子位图的宽度}
    FWidth:integer;
    {** 每一个子位图的高度}
    FHeight:integer;
    FCount:integer;
  public
    constructor Create(Width,Height:integer);
    destructor Destroy;override;
    function GetDC:HDC;
    procedure AddBitmap(Index:integer;Bitmap:TBitmap);
    procedure AddBitmapFromFile(Index:integer;FileName:string);
    procedure AddBitmapFromDC(Index:integer;SrcDC:HDC;SrcRect:TRect);
    function GetBitmap(Index:integer;var BitmapDC:HDC;var Rect:TRect):boolean;
    procedure GetLastBitmap(var BitmapDC:HDC;var Rect:TRect);
  end;

  TBitmapObj=record
    FileName:string;
    Bitmap:TBitmap;
  end;
  TBitmapObjs=array of TBitmapObj;
  {}
  TBitmapObjList=Class
  private
    FBitmaps:TBitmapObjs;
    FBufferLen: integer;
    FCount:integer;
    FAutoExt:integer;
    FLoopIndex:integer;
    procedure SetBufferLen(const Value: integer);
  public
    constructor Create;
    destructor Destroy;override;
    function GetBitmapByIndex(Index:integer):TBitmap;
    function GetBitmapByFileName(AFileName:string):TBitmap;
    function GetFileNameByIndex(Index:integer):string;
    property BufferLen:integer read FBufferLen write SetBufferLen;
    property Count:integer read FCount;
  end;

implementation
uses
  tyoexception;
{=============================  TBitmapList  ============================}

procedure TBitmapList.AddBitmap(Index:integer;Bitmap:TBitmap);
var rect:TRect;
begin
  rect.Left:=0;
  rect.Right:=Bitmap.Width;
  rect.top:=0;
  rect.Bottom:=Bitmap.Height;
  AddBitmapFromDC(Index,Bitmap.canvas.handle,rect);
end;

procedure TBitmapList.AddBitmapFromDC(Index:integer;SrcDC: HDC; SrcRect: TRect);
var
  y:integer;
  DestDC:HDC;
begin //这是最基本的添加位图的函数:)
  inc(FCount);
  if FCount>Length(FIndex) then
  begin
    SetLength(FIndex,Fcount+20);
    FBitmap.Height:=(Fcount+20)*FHeight;
  end;
  FIndex[FCount-1]:=Index;
  y:=(FCount-1)*FHeight;
  DestDC:=FBitmap.Canvas.Handle;
  StretchBlt(DestDC,0,y,FWidth,FHeight,SrcDC,
    SrcRect.Left,SrcRect.Top,
    SrcRect.Right-SrcRect.Left,SrcRect.Bottom-SrcRect.Top,cmSrcCopy);
end;

procedure TBitmapList.AddBitmapFromFile(Index:integer;FileName: string);
var
  Bitmap:TBitmap;
begin
  Bitmap:=TBitmap.Create;
  try
   Bitmap.LoadFromFile(FileName);
   AddBitmap(Index,Bitmap);
  finally
   Bitmap.Free;
  end;
end;

constructor TBitmapList.Create(Width,Height:integer);
begin
  inherited Create;
  FBitmap:=TBitmap.Create;
  FWidth:=width;
  FHeight:=height;
  SetLength(FIndex,20);
  FBitmap.Width:=FWidth;
  FBitmap.Height:=FHeight*20;

  FCount:=0;
end;

destructor TBitmapList.Destroy;
begin
  FBitmap.Free;
  inherited;
end;

function TBitmapList.GetBitmap(Index: integer; var BitmapDC:HDC;
  var Rect: TRect): boolean;
var
  i:integer;
begin
  for i:=0 to FCount-1 do
    if FIndex[i]=index then
    begin
      BitmapDC:=GetDC;
      Rect.Left:=0;
      Rect.Top:=i*FHeight;
      Rect.Right:=FWidth;
      Rect.Bottom:=Rect.Top+FHeight;
      Result:=True;
      Exit;
    end;
  Result:=False;
end;

function TBitmapList.GetDC:HDC;
begin
  Result:=FBitmap.canvas.handle;
end;

procedure TBitmapList.GetLastBitmap(var BitmapDC:HDC; var Rect: TRect);
begin
  BitmapDC:=GetDC;
  Rect.Left:=0;
  Rect.Top:=(FCount-1)*FHeight;
  Rect.Right:=FWidth;
  Rect.Bottom:=Rect.Top+FHeight;
end;

{ TBitmapObjList }

constructor TBitmapObjList.Create;
begin
  FBufferLen:=MaxInt;
  FAutoExt:=6;
  FCount:=0;
  FLoopIndex:=0;
  SetLength(FBitmaps,FAutoExt);
end;

destructor TBitmapObjList.Destroy;
var i:integer;
begin
  for i:=0 to FCount-1 do
    FBitmaps[i].Bitmap.Free;
  inherited;
end;


function TBitmapObjList.GetBitmapByFileName(AFileName: string): TBitmap;
var
  i:integer;
begin
  AFileName:=UpperCase(AFileName);
  for i:=0 to FCount-1 do
    if FBitmaps[i].FileName=AFileName then
    begin
      Result:=FBitmaps[i].Bitmap;
      Exit;
    end;

  if FCount<FBufferLen then  //不超过缓冲区大小
  begin
    if Length(FBitmaps)<=FCount then
    begin
      if FCount+FAutoExt<FBufferLen then
        SetLength(FBitmaps,FCount+FAutoExt)
      else
        SetLength(FBitmaps,FBufferLen);
    end;
    FBitmaps[FCount].Bitmap:=TBitmap.Create;
    try
      FBitmaps[FCount].Bitmap.LoadFromFile(AFileName);
      FBitmaps[FCount].FileName:=AFileName;
      Result:=FBitmaps[FCount].Bitmap;
      inc(FCount);
    except
      Result:=nil;
      FBitmaps[FCount].Bitmap.Free;
    end;
  end else   //超过缓冲区大小
  begin
    i:=FLoopIndex mod FCount;
    try
      FBitmaps[i].Bitmap.LoadFromFile(AFileName);
      FBitmaps[i].FileName:=AFileName;
      Result:=FBitmaps[i].Bitmap;
      inc(FLoopIndex);
    except
      Result:=nil;
    end;
  end;
end;

function TBitmapObjList.GetBitmapByIndex(Index: integer): TBitmap;
begin
  if (Index>=0) and (Index<FCount) then
    Result:=FBitmaps[Index].Bitmap
  else
    raise EIndexError.Create;
end;

function TBitmapObjList.GetFileNameByIndex(Index: integer): string;
begin
  if (Index>=0) and (Index<FCount) then
    Result:=FBitmaps[Index].FileName
  else
    raise EIndexError.Create;
end;

procedure TBitmapObjList.SetBufferLen(const Value: integer);
begin
  FBufferLen:=Value;
  if FBufferLen>=FCount then
    FBufferLen:=FCount;
end;

var
  FBitmapList:TBitmapObjList;

function BitmapList:TBitmapObjList;
begin
  if FBitmapList=nil then
    FBitmapList:=TBitmapObjList.Create;

  Result:=FBitmapList;
end;

initialization
  FBitmapList:=nil;
finalization
  if FBitmapList<>nil then
    FBitmapList.Free;

end.
