unit ResUnit;

interface
uses
  imglist, windows, Graphics, Types, classes;
type
  TDrawBmp = record
    HDC: HDC;
    Rect: TRect;
  end;
  TResList = class(TObject)
  private
    FBmpList: TCustomImageList;
    FResIDList: TIntegerDynArray;
    FTmp: TBitmap;
  public
    constructor Create();
    destructor Destroy;override;
    function GetDrawBmp(AResIndex: Integer): TDrawBmp;
    function DrawBmpByID(AResID: Integer): TDrawBmp;
    function Find(AResId: Integer; var Index: Integer): Boolean;
    function AddBitmap(AResId: Integer; Stream: TStream): Integer;
    procedure Clear;
    property BmpList: TCustomImageList read FBmpList;
  end;
implementation

uses SysUtils;

{ TResList }

function TResList.AddBitmap(AResId: Integer; Stream: TStream): Integer;
begin
  if Find(AResId, Result) then Exit;
  FTmp.LoadFromStream(Stream);
  //Result := FBmpList.Add(FTmp,nil);
  Result := FBmpList.AddMasked(FTmp,FTmp.TransparentColor);
  //Result := FBmpList.AddMasked(FTmp,16711935);
  SetLength(FResIDList,FBmpList.Count);
  FResIDList[Result] := AResId;
end;

procedure TResList.Clear;
begin
  SetLength(FResIDList,0);
  FBmplist.Clear;
end;

constructor TResList.Create;
begin
  FBmpList := TCustomImageList.Create(nil);
  FBmpList.Masked := True;
  FTmp := TBitmap.Create;
end;

destructor TResList.Destroy;
begin
  FBmpList.Free;
  FTmp.Free;
  inherited;
end;

function TResList.DrawBmpByID(AResID: Integer): TDrawBmp;
var
  i: Integer;
begin
  if Find(AResID,i) then
    Result := GetDrawBmp(i)
  else
    raise Exception.Create('不能发现指定的资源');
end;

function TResList.Find(AResId: Integer; var Index: Integer): Boolean;
var
  i: Integer;
begin
  Result := False;
  Index := -1;
  for i := 0 to Length(FResIDList) - 1 do
    if FResIDList[i] = AResId then
    begin
      Index := i;
      Result := True;
      Break;
    end;
end;

function TResList.GetDrawBmp(AResIndex: Integer): TDrawBmp;
begin
  if FBmpList.GetBitmap(0,FTmp) then
  begin
    Result.HDC := FTmp.Handle;
    Result.Rect := FTmp.Canvas.ClipRect;
  end;
end;

end.
