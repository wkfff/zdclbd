unit tyoGraph;
interface
uses
  windows,
  Classes,
  Math,
  Types,
  metaDefine,
  Sysutils,
  dialogs,
  forms,
  tyoSymbol,
  elog,
  StaticProc,
  Coord,
  Graphics;
const

  {windows画笔}
  WINDOWS_PEN       =0;
  {windows扩展画笔}
  WINDOWS_PEN_EXT   =1;
  {自定制画笔}
  CUSTOM_PEN        =2;

  {线型}
  CU_PS_NULL        = 0;
  CU_PS_SOLID       = 1;
  //CU_PS_SOLID2    =2

  CU_PS_DASH7_1      = 3;
  CU_PS_DASH8_2      = 4;
  CU_PS_DASH4_1      = 5;
  CU_PS_DASH5_2      = 6;
  CU_PS_DASH3_1      = 7;
  CU_PS_DASH4_2      = 8;
  CU_PS_DASH1_3      = 9;
  CU_PS_DASH1_1      = 10;
  CU_PS_DASH10_10    = 11;
  CU_PS_DASH1_6      = 12;
  CU_PS_DASH8_2_1_2  = 13;


  CU_PS_DASH_BEGIN  =3;
  CU_PS_DASH_END    =13;
  {第一个Windows扩充线型的开始位置}
  CU_PS_EXT_BEGIN   =14;
  CU_PS_EXT_END     =21;
  {第一个自定义类型的开始位置}
  CU_PS_CUSTOM_BEGIN=22;
  CU_PS_CUSTOM_END  =27;



  {字体常量,斜体}
  FDW_ITALIC        =$01000000;
  {字体常量,下划线}
  FDW_UNDERLINE     =$02000000;
  {字体常量,删除线}
  FDW_STRIKEOUT     =$04000000;

  BUFFER_INC_SIZE   =1024*8;  //8K
type
  GraphDraw=Class(TObject)
  private
    class procedure PolylineOffSet(DC: HDC; Meta: TMetaStruct;
      DrawCood: TDrawCood; Offset: TPoint);
    class procedure SetPatternBrush(var PatternBitmap: TBitmap;
      ABrush: TBrushStruct);

  public
    class function GetFontHeigth(AFontSize:integer):integer;
    class function GetFontSize(AFontHeight: integer): integer;
    class function SetFont(AFont:TTrueFontStruct;ADC:HDC):HFONT;
    class procedure DelFont(AFont:HFONT;ADC:HDC);
    class function SetFontByHeight(AFont: TTrueFontStruct; ADC: HDC):HFONT;
    class procedure SetPen(DC:HDC;APen:TPenStruct);
    class procedure SetBrush(DC:HDC;ABrush:TBrushStruct);
    class procedure SetColorPen(DC:HDC;AColor:TColor);//创建简单画笔
    class procedure SetColorBrush(DC:HDC;AColor:TColor);//创建实线刷
    class procedure SaveGDI(DC:HDC;var OldPen:HPEN;var OldBrush:HBrush);
    class procedure ReStoreGDI(DC:HDC;OldPen:HPEN;OldBrush:HBrush);
    class procedure TransDraw(destDC:HDC;destX,destY,Width,Height:Integer;
      srcDC:HDC;c:TColor);
    class procedure TransStretch(destDC:HDC;dX,dY,dW,dH:Integer;
      srcDC:HDC;sX,sY,sW,sH:Integer;c:TColor);
    class procedure RotationBitmap(srcDC:HDC;srcRect:TRect;DestDC:HDC;
      DestRect:TRect;angle:integer);
    class procedure DrawArrow(DC:HDC;FromPoint,ToPoint:TPoint;Height,Width:integer);
    class function  DrawBitmapSymbol(DestDC:HDC;DestRect:TRect;SrcDC:HDC;
      SrcRect:TRect;TransparentColor:TColor):boolean;
    class procedure AlphaDraw(fDC:HDC;x,y:Integer;a:Byte;hasAlpha:Boolean);
    class procedure DrawSymbol(DC: HDC; ASymbolStruct: TWorldSymbol;
      APosition: TPoint);
    class procedure tyoDrawLine(DC: HDC; Meta: TMetaStruct);
    class procedure tyoDrawRect(DC: HDC; Meta: TMetaStruct);
    class procedure tyoDrawTrueFontSymbol(ADC:HDC;ATrueFontSymbol:TTrueFontSymbol;
      APosition:TPoint);
    class procedure tyoDrawTrueFont(ADC:HDC;Text:string;ATrueFontStruct:TTrueFontStruct;
      APosition:TPoint);
    class function DrawCustomSymbol(ADC:HDC;CustomSymbol:TCustomSymbol;Position:Tpoint):boolean;
    class procedure DrawRectAngle(ACanvas:TCanvas;TopLeft,
      BottomRight: TPoint;DrawMode:TPenMode;DrawStyle:TPenStyle;
      DrawWidth:Integer);
    class procedure DrawTriAngle(ACanvas:TCanvas;Center:TPoint;Size:Integer;
      DrawMode:TPenMode;DrawStyle:TPenStyle;DrawWidth:Integer;DrawColor:TColor);
    class procedure DrawDouTriAngle(ACanvas:TCanvas;Center:TPoint;Size:Integer;
      DrawMode:TPenMode;DrawStyle:TPenStyle;DrawWidth:Integer;DrawColor:TColor);
    class procedure DrawEllipse(ACanvas:TCanvas;TopLeft,
      BottomRight: TPoint;DrawMode:TPenMode;DrawStyle:TPenStyle;
      DrawWidth:Integer);
    class procedure DrawLine(ACanvas:TCanvas;P1, P2: TPoint;DrawMode:TPenMode;
      DrawStyle:TPenStyle;DrawWidth:Integer;DrawColor:TColor);
    class procedure DrawFrameBox(DC:HDC;X1,Y1,X2,Y2:integer);overload;
    class procedure DrawFrameBox(DC:HDC;Rect:TRect);overload;
    class procedure SetSymbolSize(Symbol:TSymbolStruct;Size:Byte);
    class procedure TyoPolygon(DC:HDC;Meta:TMetaStruct;DrawCood:TDrawCood);
    class procedure TyoPolygonOutlineOffset(DC: HDC; Meta: TMetaStruct;
      DrawCood: TDrawCood;Offset:TPoint);
    class procedure TyoPolyline(DC:HDC;Meta:TMetaStruct;DrawCood:TDrawCood);
    class procedure TyoDrawMeta(DC:HDC;Meta:TMetaStruct;DrawCood:TDrawCood;Offset:TPoint);
    class procedure TyoDrawText(DC: HDC; Meta: TMetaStruct;
      DrawCood: TDrawCood);
    class procedure TyoHighLightSymbol(DC: HDC; ASymbolStruct: TSymbolStruct;
      APosition: TPoint);
    class function TyoPolyPolyLine(APen: TPenStruct; DC: HDC;
      APoints: TWorldPointAry; ASubPolys: TIntegerDynArray;
      const ACount: integer): boolean;
    class function GetPenType(APenPattern:integer):integer;
    class function TyoGetTrueFontRect(Text:string;ATrueFont:TTrueFontStruct;
        APosition:TPoint): TRect;
    //20081209画一个圆
    class procedure DrawCircle(ACanvas:TCanvas;CircleCenter: TPoint;Radius:Integer;DrawMode: TPenMode;
       DrawStyle: TPenStyle;DrawWidth:Integer);
    {class procedure DrawCircle(ACanvas:TCanvas;P1,P2:TPoint;DrawMode: TPenMode;
       DrawStyle: TPenStyle;DrawWidth:Integer); }
  end;

var
  TransBlit: function(p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11:DWord):DWord; stdcall;
  AlphaBlit: function(p1,p2,p3,p4,p5,p6,p7,p8,p9,p10:DWord;p11:TBlendFunction):DWord; stdcall;
  PatternBrushBitmap:TBitmap;
  PublicCustomSymbols:TCustomSymbols;
  PublicPointsBuff:TIntegerDynArray;

implementation

uses
  geome,
  tyoexception,
  RunData,
  tyolstyle{,
  uGloabVar};


class procedure GraphDraw.SetColorPen(DC:HDC;AColor:TColor);
var oldpen:HPen;
begin
  oldPen:=SelectObject(DC,CreatePen(0, 1,AColor));
  if oldPen<>0 then
    DeleteObject(oldPen);
end;

class procedure GraphDraw.SetColorBrush(DC:HDC;AColor:TColor);
var oldBrush:HBrush;
begin
  oldBrush:=SelectObject(DC,CreateSolidBrush(AColor));
  if oldBrush<>0 then
    DeleteObject(oldBrush);
end;

class procedure GraphDraw.SetPen(DC:HDC;APen:TPenStruct);//创建简单画笔
var
  oldpen:HPen;
  seg:array[0..9] of Integer;
  segCount:integer;
  newPen:HPen;
  brush:tagLOGBRUSH;
begin
  segCount:=0;
  case APen.Pattern of
    CU_PS_SOLID,2:
      begin
        try
            oldpen:=SelectObject(DC,CreatePen(PS_SOLID, APen.Width,APen.Color));
        finally
            if oldpen<>0 then
              DeleteObject(oldpen);
        end;
      end;
    CU_PS_DASH_BEGIN..CU_PS_DASH_END:
      begin
        case APen.Pattern of
         CU_PS_DASH7_1:
          begin   //7:1
            seg[0]:=APen.Width*7;
            seg[1]:=1+APen.Width*(1+1);
            segCount:=2;
          end;
         CU_PS_DASH8_2:
          begin   //8:2
            seg[0]:=APen.Width*8;
            seg[1]:=1+APen.Width*(1+2);
            segCount:=2;
          end;
         CU_PS_DASH4_1:
          begin   //4:1
            seg[0]:=APen.Width*4;
            seg[1]:=1+APen.Width*(1+1);
            segCount:=2;
          end;
         CU_PS_DASH5_2:
          begin   //5:2
            seg[0]:=APen.Width*5;
            seg[1]:=1+APen.Width*(1+2);
            segCount:=2;
          end;
         CU_PS_DASH3_1:
          begin   //3:1
            seg[0]:=APen.Width*3;
            seg[1]:=1+APen.Width*(1+1);
            segCount:=2;
          end;
         CU_PS_DASH4_2:
          begin   //4:2
            seg[0]:=APen.Width*4;
            seg[1]:=1+APen.Width*(1+2);
            segCount:=2;
          end;
         CU_PS_DASH1_3:
          begin   //1:3
            seg[0]:=1;
            seg[1]:=1+APen.Width*(1+3);
            segCount:=2;
          end;
         CU_PS_DASH1_1:
          begin   //1:1
            seg[0]:=APen.Width*1;
            seg[1]:=1+APen.Width*(1+1);
            segCount:=2;
          end;
         CU_PS_DASH10_10:
          begin   //10:10
            seg[0]:=APen.Width*10;
            seg[1]:=1+APen.Width*(1+10);
            segCount:=2;
          end;
         CU_PS_DASH1_6:
          begin   //1:6
            seg[0]:=1;
            seg[1]:=1+APen.Width*(1+6);
            segCount:=2;
          end;
         CU_PS_DASH8_2_1_2:
          begin
            seg[0]:=8;
            seg[1]:=2;
            seg[2]:=1;
            seg[3]:=2;
            segCount:=4;
          end;
        end;
        brush.lbStyle:=BS_SOLID;
        brush.lbColor:=APen.color;
        newPen:=ExtCreatePen(PS_GEOMETRIC
          or PS_USERSTYLE
          or PS_DASHDOT
          or PS_ENDCAP_SQUARE
          or PS_JOIN_ROUND
          ,APen.Width,brush,segCount,@seg[0]);
        try
            oldPen:=SelectObject(DC,newPen);
        finally
            if oldPen<>0 then
              DeleteObject(oldpen);
        end;
      end;
    else
      begin
        try
            oldpen:=SelectObject(DC,CreatePen(PS_NULL, APen.Width,APen.Color));
        finally
            if oldpen<>0 then
              DeleteObject(oldpen);
        end;
      end;
  end;
end;

class procedure GraphDraw.SetBrush(DC:HDC;ABrush:TBrushStruct);
var
  newBrush:HBrush;
  logBrush:tagLOGBRUSH;
begin
  newBrush:=0;

  if (ABrush.Pattern=1) or (ABrush.Pattern=0) then
  begin
    logBrush.lbStyle:=BS_NULL;
    try
        newBrush:=CreateBrushIndirect(logBrush);
    finally
        DeleteObject(SelectObject(DC,newBrush));
    end;
  end
  else if ABrush.Pattern=2 then
  begin
    try
        newBrush:=CreateSolidBrush(ABrush.ForeColor) //创建实线刷
    finally
        DeleteObject(SelectObject(DC,newBrush));
    end;
  end
  else if (ABrush.Pattern>2) and (ABrush.Pattern<9) then
    begin//windows 阴影刷
      try
          newBrush:=CreateHatchBrush(ABrush.Pattern-3,ABrush.ForeColor);
          if ABrush.Transparent<>0 then
            SetBkMode(DC,Transparent)
          else
            SetBkMode(DC,OPAQUE);
            SetBkColor(DC,ABrush.BackColor);
      finally
          DeleteObject(SelectObject(DC,newBrush));
      end;
    end
  else
  begin //Bitmap刷子
    try
      PatternBrushBitmap.LoadFromResourceName(RuntimeData.ResHandle,'PAT'+IntToStr(ABrush.Pattern));
      SetPatternBrush(PatternBrushBitmap,ABrush);
      try
          newBrush:=CreatePatternBrush(PatternBrushBitmap.handle);
      finally
          DeleteObject(SelectObject(DC,newBrush));
      end;

    except
      //cannot found the resource
    end;
  end;

end;

class procedure GraphDraw.SetPatternBrush(var PatternBitmap:TBitmap;ABrush:TBrushStruct);
var
  x,y:integer;
//  p:PByteArray;
begin
  if PatternBitmap.PixelFormat<>pf8bit then
    PatternBitmap.PixelFormat:=pf8bit;
  for y:=0 to PatternBitmap.Height-1 do
  begin
    //p:=PatternBitmap.ScanLine[y];
    for x:=0 to PatternBitmap.Width-1 do
    begin
      if PatternBitmap.Canvas.Pixels[y,x]=clWhite then
        PatternBitmap.Canvas.Pixels[y,x]:=ABrush.BackColor
      else
        PatternBitmap.Canvas.Pixels[y,x]:=ABrush.ForeColor;
    end;
  end;
end;

class function GraphDraw.GetFontHeigth(AFontSize:integer):integer;
var
  DC: HDC;
  ScreenLogPixels:integer;
begin
  DC := GetDC(0);
  ScreenLogPixels := GetDeviceCaps(DC, LOGPIXELSY);
  ReleaseDC(0,DC);
  Result := -MulDiv(AFontSize, ScreenLogPixels, 72);
end;

class function GraphDraw.GetFontSize(AFontHeight:integer):integer;
var
  DC: HDC;
  ScreenLogPixels:integer;
begin
  DC := GetDC(0);
  ScreenLogPixels := GetDeviceCaps(DC, LOGPIXELSY);
  ReleaseDC(0,DC);
  if AFontHeight<0 then AFontHeight:=abs(AFontHeight);
  Result:=Round(AFontHeight*72.0/ScreenLogPixels);
end;

class procedure GraphDraw.DrawArrow(DC:HDC;FromPoint,ToPoint:TPoint;Height,Width:integer);
var
  SINA,COSA:Double;
  LEN:Double;
  ps:array [0..2] of TPoint;
begin
  Height:=Round(Height /2);
  try
    LEN:=sqrt(sqr(FromPoint.x-ToPoint.x)+sqr(FromPoint.y-ToPoint.y));
  except
    Exit;
  end;
  if (LEN=0) or (LEN<Width *3) then Exit;
  SINA:=(FromPoint.y-ToPoint.y)/LEN;
  COSA:=(FromPoint.x-ToPoint.x)/LEN;

  FromPoint.x:=Round((Width/LEN)*(FromPoint.x-ToPoint.x)+ToPoint.x);
  FromPoint.y:=Round((Width/LEN)*(FromPoint.y-ToPoint.y)+ToPoint.y);

  ps[0]:=Point(Round(FromPoint.x+Height*SINA),Round(FromPoint.y-Height*COSA));
  ps[1]:=ToPoint;
  ps[2]:=Point(Round(FromPoint.x-Height*SINA),Round(FromPoint.y+Height*COSA));
  polyline(DC,ps[0],3);
end;

class function GraphDraw.SetFont(AFont:TTrueFontStruct;ADC:HDC):HFont;
var
  lfont:TLogFont;
  CurrentFont:HFont;
begin
  with lfont do begin
    lfHeight :=GetFontHeigth(AFont.Size);
    lfWidth := 0;
    lfEscapement := Round(AFont.Rotation*10);
    lfWeight := AFont.FontStyle and $00FFFFFF;
    lfItalic := integer((AFont.FontStyle and FDW_ITALIC)>0);
    lfUnderline := integer((AFont.FontStyle and FDW_UNDERLINE)>0);
    lfStrikeOut := integer((AFont.FontStyle and FDW_STRIKEOUT)>0);
    lfCharSet := 1;
    lfOutPrecision := OUT_TT_PRECIS;
    lfClipPrecision:= CLIP_DEFAULT_PRECIS;
    lfQuality := PROOF_QUALITY;
    lfPitchAndFamily := DEFAULT_PITCH;
    lfOrientation:=Round(AFont.Rotation*10);
    StrPCopy(lfFaceName,AFont.FontName);
  end;
  CurrentFont := CreateFontIndirect(lFont);
  //DeleteObject(SelectObject(ADC, CurrentFont))
  Result:=SelectObject(ADC, CurrentFont);

  SetTextColor(ADC,AFont.ForeColor);
  if AFont.Transparent<>0 then
    SetBkMode(ADC,Transparent)
  else
    SetBkColor(ADC,AFont.BackColor);
end;

class function GraphDraw.SetFontByHeight(AFont:TTrueFontStruct;ADC:HDC):HFONT;
var
  lfont:TLogFont;
  CurrentFont:HFont;
begin
  with lfont do begin
    lfHeight :=AFont.Size;
    lfWidth := 0;
    lfEscapement := Round(AFont.Rotation*10);
    lfWeight := AFont.FontStyle and $00FFFFFF;
    lfItalic := integer((AFont.FontStyle and FDW_ITALIC)>0);
    lfUnderline := integer((AFont.FontStyle and FDW_UNDERLINE)>0);
    lfStrikeOut := integer((AFont.FontStyle and FDW_STRIKEOUT)>0);
    lfCharSet := 1;
    lfOutPrecision := OUT_TT_PRECIS;
    lfClipPrecision:= CLIP_DEFAULT_PRECIS;
    lfQuality := PROOF_QUALITY;
    lfPitchAndFamily := DEFAULT_PITCH;
    lfOrientation:=Round(AFont.Rotation*10);
    StrPCopy(lfFaceName,AFont.FontName);
  end;
  CurrentFont := CreateFontIndirect(lFont);
  //DeleteObject(SelectObject(ADC, CurrentFont));
  Result:=SelectObject(ADC, CurrentFont);

  SetTextColor(ADC,AFont.ForeColor);
  if AFont.Transparent<>0 then
    SetBkMode(ADC,Transparent)
  else
    SetBkColor(ADC,AFont.BackColor);
end;

class procedure GraphDraw.DelFont(AFont: HFONT; ADC: HDC);
begin
  DeleteObject(SelectObject(ADC,AFont));
end;

class procedure GraphDraw.TyoDrawTrueFontSymbol(ADC:HDC;ATrueFontSymbol:TTrueFontSymbol;
  APosition:TPoint);
var
  currentfont,oldfont:HFont;
  ch:string;
  fHeight:integer;
  function SetFont(AFont:TTrueFontSymbol;ADC:HDC):Boolean;
  var
    lfont:TLogFont;
  begin
    with lfont do begin
      lfHeight :=fHeight;
      lfWidth :=0;
      lfEscapement := Round(AFont.Rotation*10);
      lfWeight := AFont.FontStyle and $00FFFFFF;
      lfItalic := integer((AFont.FontStyle and FDW_ITALIC)>0);
      lfUnderline := integer((AFont.FontStyle and FDW_UNDERLINE)>0);
      lfStrikeOut := integer((AFont.FontStyle and FDW_STRIKEOUT)>0);
      lfCharSet := 1;
      lfOutPrecision := OUT_TT_PRECIS;
      lfClipPrecision:= CLIP_DEFAULT_PRECIS;
      lfQuality := PROOF_QUALITY;
      lfPitchAndFamily := DEFAULT_PITCH;
      lfOrientation:=Round(AFont.Rotation*10);
      StrPCopy(lfFaceName,AFont.FontName);
    end;
    CurrentFont := CreateFontIndirect(lFont);
    oldFont := SelectObject(ADC, CurrentFont);
    SetTextColor(ADC,AFont.Color);
    SetBkMode(ADC,Transparent);
    Result:=true;
  end;

  function DelFont(ADC:HDC):boolean;
  begin
    Result:=DeleteObject(SelectObject(ADC, oldFont));
  end;
begin
  ch:=chr(ATrueFontSymbol.Shape);
  fHeight:=GraphDraw.GetFontHeigth(ATrueFontSymbol.Size);
  SetFont(ATrueFontSymbol,ADC);
  fHeight:= fHeight div 2;

  if ATrueFontSymbol.Rotation=0 then
    TextOut(ADC,APosition.x+fHeight,APosition.y+fHeight,PChar(ch),1)
  else
  begin
    fHeight:=Round(fHeight*1.414);
    TextOut(ADC,
      APosition.x+Round(fHeight*Cos((ATrueFontSymbol.Rotation-45)*TO_ANGLE)),
      APosition.y-Round(fHeight*Sin((ATrueFontSymbol.Rotation-45)*TO_ANGLE)),
      PChar(ch),1);
  end;


  DelFont(ADC);
end;

class procedure GraphDraw.TyoDrawTrueFont(ADC:HDC;Text:string;ATrueFontStruct: TTrueFontStruct;
  APosition:TPoint);
var
  oldfont:HFont;
  fHeight:integer;
  len:integer;
  W:integer;
  COSA,SINA:double;
begin
  oldfont:=SetFont(ATrueFontStruct,ADC);
  fHeight:=(-GetFontHeigth(ATrueFontStruct.size));
  len:=Length(Text);
  if ATrueFontStruct.Rotation=0 then
    TextOut(ADC,APosition.x-(fHeight*len div 4),APosition.y-(fHeight div 2),PChar(Text),len)
  else begin
    W:=fHeight*len;
    COSA:=cos(ATrueFontStruct.Rotation*TO_ANGLE);
    SINA:=sin(ATrueFontStruct.Rotation*TO_ANGLE);
    TextOut(ADC,
      Round(APosition.x-(W*COSA/4)-(fHeight*SINA/2)),
      Round(APosition.y+(W*SINA/4)-(fHeight*COSA/2)),
      PChar(Text),
      len);
  end;
  DelFont(oldfont,ADC);
end;

class function GraphDraw.DrawBitmapSymbol(DestDC:HDC;DestRect:TRect;SrcDC:HDC;
  SrcRect:TRect;TransparentColor:TColor):boolean;
var
  MaskBitmap:Tbitmap;
  width,height:integer;
  srcWidth,srcHeight:integer;
begin
try
  width:=DestRect.Right-DestRect.Left;
  height:=DestRect.Bottom-DestRect.Top;

  srcWidth:=srcRect.Right-srcRect.Left;
  srcHeight:=srcRect.Bottom-srcRect.Top;

  MaskBitmap:=TBitmap.Create;
  MaskBitmap.Monochrome:=true;
  MaskBitmap.Width:=Width;
  MaskBitmap.Height:=Height;
  setbkcolor(DestDC,clWhite);
  SetTextColor(DestDC,clBlack);

  setbkcolor(SrcDC,TransparentColor);
  StretchBlt(MaskBitmap.canvas.handle,0,0,width,height,
    SrcDC,SrcRect.Left,SrcRect.Top,srcWidth,srcHeight,cmsrcCopy);

  StretchBlt(DestDC,DestRect.Left,DestRect.Top,width,height,
    SrcDC,SrcRect.Left,SrcRect.Top,srcWidth,srcHeight,cmSrcInvert);
  BitBlt(DestDC,DestRect.Left,DestRect.Top,width,height,
    MaskBitmap.canvas.handle,0,0,cmSrcAnd);
  StretchBlt(DestDC,DestRect.Left,DestRect.Top,width,height,
    SrcDC,SrcRect.Left,SrcRect.Top,srcWidth,srcHeight,cmSrcInvert);

  MaskBitmap.Free;

  result:=true;
except  on E: Exception do
    elog.SystemLog.AddLog(' GraphDraw.DrawBitmapSymbol ',
                               e.Message);
end;
end;

class procedure GraphDraw.RotationBitmap(srcDC:HDC;srcRect:TRect;DestDC:HDC;DestRect:TRect;angle:integer);
var
  Bitmap1,Bitmap2:TBitmap;
  COSA,SINA:double;
  i,j:integer;
  H,x1,y1,x,y:integer; // x2,y2,
  //deltaY,deltaX:integer;
//  R:double;
begin
//  R:=(srcRect.bottom-srcRect.Top)*sqrt(2)/2;
  COSA:=Cos(angle*(pi/180));
  SINA:=Sin(angle*(pi/180));

  //deltaY:=Round(R*SIN((angle-45)*(pi/180))+R*sin(45*pi/180));
  //deltaX:=Round(R*COS((angle-45)*(pi/180))-R*Cos(45*pi/180));

  Bitmap1:=TBitmap.Create;
  Bitmap1.Height:=srcRect.bottom-srcRect.Top;
  Bitmap1.Width:=Bitmap1.Height;
  BitBlt(Bitmap1.canvas.handle,0,0,Bitmap1.width,bitmap1.height,
    srcDC,srcRect.left,srcRect.top,cmSrcCopy);

  Bitmap2:=TBitmap.Create;
  Bitmap2.Height:=Round((srcRect.bottom-srcRect.Top)*1.42);
  Bitmap2.Width:=Bitmap2.Height;

  H:=Bitmap1.Height;

  for i:=SrcRect.Left to SrcRect.Right do
    for j:=SrcRect.Top to SrcRect.Bottom do
    begin
      x1:=i-H div 2;
      y1:=j-H div 2;
      x:=Round(x1*COSA-y1*SINA);//X=xcosα－ysinα
      y:=Round(x1*SINA+y1*COSA);//Y= xsinα＋ycosα
      x:=x+H div 2;
      y:=y+H div 2;
      if (x>=SrcRect.Left)and (x<SrcRect.Right) and
         (y>=SrcRect.Top) and (y<SrcRect.Bottom) then
        Bitmap2.Canvas.Pixels[i,j]:=Bitmap1.Canvas.Pixels[x,y];
    end;
  BitBlt(DestDC,DestRect.left,DestRect.top,Bitmap1.width,bitmap1.height,
    Bitmap2.canvas.handle,0,0,cmSrcCopy);
  Bitmap2.Free;
  Bitmap1.Free;
end;

class procedure GraphDraw.TransDraw(destDC:HDC;destX,destY,Width,Height:Integer;
  srcDC:HDC;c:TColor);
begin
  TransBlit(destDC,destX,destY,Width,Height,srcDC,0,0,Width,Height,c);
end;

class procedure GraphDraw.TransStretch(destDC:HDC;dX,dY,dW,dH:Integer;
  srcDC:HDC;sX,sY,sW,sH:Integer;c:TColor);
begin
  TransBlit(destDC,dX,dY,dW,dH,srcDC,sX,sY,sW,sH,c);
end;

class procedure GraphDraw.AlphaDraw(fDC:HDC;x,y:Integer;a:Byte;hasAlpha:Boolean);
var
  Blend: TBlendFunction;
begin
  Blend.BlendOp:=0;
  Blend.BlendFlags:=0;
  Blend.SourceConstantAlpha:=a;
  Blend.AlphaFormat:=Integer(hasAlpha);
  //AlphaBlit(fDC,x,y,Width,AbsHeight,hDC,0,0,Width,AbsHeight,Blend);
end;

class procedure GraphDraw.DrawSymbol(DC: HDC; ASymbolStruct: TWorldSymbol;APosition:TPoint);
var
  position:TPoint;
  rect,srcRect:TRect;
  fontHeight,fontHeightDiv2:integer;
begin
  //APosition转换成屏幕象素坐标
try
  position:=APosition;
  case ASymbolStruct.Style of
    _Custom:
      DrawCustomSymbol(DC,ASymbolStruct.CustomSymbol,position);
    _TrueFont:
      TyoDrawTrueFontSymbol(DC,ASymbolStruct.TrueFont,position);
    _Bitmap:
      begin
        if Trim(ASymbolStruct.Bitmap.FileName)='' then Exit;
        fontHeight:=0-GraphDraw.GetFontHeigth(ASymbolStruct.Bitmap.Size);
        fontHeightDiv2:=fontHeight shr 1;
        with rect do
        begin
          Left:=Position.x-fontHeightDiv2;
          Right:=Position.x+fontHeightDiv2;
          Top:=Position.y-fontHeightDiv2;
          Bottom:=Position.y+fontHeightDiv2;
        end;
        //if FileExists(ASymbolStruct.Bitmap.FileName) then  //dxf 2007-07-12
        begin
          srcRect:=PublicCustomSymbols.GetSymbolRect(ASymbolStruct.Bitmap.FileName);
          DrawBitmapSymbol(DC,rect,PublicCustomSymbols.GetSymbolDC,srcRect,clWhite);
        end;
        //TransStretch(DC,rect.Left,rect.top,rect.right-rect.left,rect.Bottom-rect.top,
        //  PublicCustomSymbols.getSymbolDC,srcRect.left,srcRect.top,srcRect.right-srcRect.left,
        //  srcRect.bottom-srcRect.top,clWhite);
      end;
  end;
except  on E: Exception do
    elog.SystemLog.AddLog(' GraphDraw.DrawSymbol ',
                               e.Message);
end;
end;

class procedure GraphDraw.TyoHighLightSymbol(DC: HDC;ASymbolStruct: TSymbolStruct;APosition:TPoint);
var
  pos:TPoint;
  Brush:TBrushStruct;
begin
  pos:=APosition;
  Brush.ForeColor:=clGray;
  Brush.Transparent:=0;
  Brush.Pattern:=2;
  Setbrush(DC,Brush);
  rectangle(DC,pos.x-3,pos.y-3,pos.x+3,pos.y+3);
end;

procedure drawSymbol31(DC:HDC;center:Tpoint;size:word;color:TColor);
begin
    // 要求绘制的是不可见的空白符号，故函数体为空
end;

procedure drawSymbol32(DC:HDC;center:Tpoint;size:word;color:TColor);
var
  len:integer;
  points:array[1..4]of TPoint;
begin
  if size=1 then len:=1
  else
  len:=round(size /2);
  GraphDraw.SetColorBrush(DC,Color);
  GraphDraw.SetColorPen(DC,clBlack);

  points[1]:=point(center.x-len,center.y-len);
  points[2]:=point(center.x-len,center.y+len);
  points[3]:=point(center.x+len,center.y+len);
  points[4]:=point(center.x+len,center.y-len);
  Polygon(DC,points,4);
end;
procedure drawSymbol33(DC:HDC;center:Tpoint;size:word;color:TColor);
var
  len :integer;
  points:array[1..4]of TPoint;
begin
  len:=round(size/2);
  GraphDraw.SetColorBrush(DC,Color);
  GraphDraw.SetColorPen(DC,clBlack);

  points[1]:=point(center.x+len,center.y);
  points[2]:=point(center.x,center.y-len);
  points[3]:=point(center.x-len,center.y);
  points[4]:=point(center.x,center.y+len);
  Polygon(DC,points,4);
end;

procedure drawSymbol34(DC:HDC;center:Tpoint;size:word;color:TColor);
var
  r :integer;
begin
  r:=round(size/2);
  GraphDraw.SetColorBrush(DC,Color);
  GraphDraw.SetColorPen(DC,clBlack);
  movetoEx(DC,center.x-r,center.y,nil);
  Ellipse(DC,center.x-r,center.y-r,center.x+r,center.y+r);
end;

procedure drawSymbol35(DC:HDC;center:Tpoint;size:word;color:TColor);
var
  ps : array [1..10] of tpoint;
  r1,r2 :real;
  hsin1,hcos1,hsin2,hcos2 :real;
begin
  r1 :=round(size /2);
  r2 :=round(size/4);

  hsin1:=sin(Pi/10);
  hcos1:=cos(Pi/10);
  hsin2:=sin(Pi/5);
  hcos2:=cos(Pi/5);
  GraphDraw.SetColorBrush(DC,Color);
  GraphDraw.SetColorPen(DC,clBlack);
  ps[1].x:=center.x;  ps[1].y:=center.y-round(r1);
  ps[2].x:=center.x+round(r2*hsin2);  ps[2].y:=center.y-round(r2*hcos2);
  ps[3].x:=center.x+round(r1*hcos1);  ps[3].y:=ps[2].y;
  ps[4].x:=center.x+round(r2*hcos1);  ps[4].y:=center.y+round(r2*hsin1);
  ps[5].x:=center.x+round(r1*hsin2);  ps[5].y:=center.y+round(r1*hcos2);
  ps[6].x:=center.x;  ps[6].y:=center.y+round(r2);
  ps[7].x:=center.x-round(r1*hsin2);  ps[7].y:=ps[5].y;
  ps[8].x:=center.x-round(r2*hcos1);  ps[8].y:=ps[4].y;
  ps[9].x:=center.x-round(r1*hcos1);;  ps[9].y:=ps[2].y;
  ps[10].x:=center.x-round(r2*hsin2);  ps[10].y:=ps[2].y;
  Polygon(DC,ps,10);
end;

procedure drawSymbol36(DC:HDC;center:Tpoint;size:word;color:TColor);
var
  v,h,l :integer;
  points:array[1..3]of TPoint;
begin
  if size<3 then
  begin
    v:=1;
    h:=1;
    l:=0;
  end
  else
  begin
    v:=round(size/ 2);
    h:=round(size /2);
    l:=round(size *4/9);
  end;
  GraphDraw.SetColorBrush(DC,Color);
  GraphDraw.SetColorPen(DC,clBlack);

  points[1]:=point(center.x,center.y-v);
  points[2]:=point(center.x-h,center.y+l);
  points[3]:=point(center.x+h,center.y+l);
  Polygon(DC,points,3);
end;

procedure drawSymbol37(DC:HDC;center:Tpoint;size:word;color:TColor);
var
  v,h,l :integer;
  points:array[1..3]of TPoint;
begin
  if size<3 then
  begin
    v:=1;
    h:=1;
    l:=0
  end
  else
  begin
    v:=round(size/2);
    h:=round(size/2);
    l:=round(size*4/9);
  end;
  GraphDraw.SetColorBrush(DC,Color);
  GraphDraw.SetColorPen(DC,clBlack);

  points[1]:=point(center.x,center.y+l);
  points[2]:=point(center.x-h,center.y-v);
  points[3]:=point(center.x+h,center.y-v);
  Polygon(DC,points,3);
end;

procedure drawSymbol38(DC:HDC;center:Tpoint;size:word;color:TColor);
var
  len :integer;
  points:array[1..4]of TPoint;
begin
  len:=round(size /2);
  GraphDraw.SetColorPen(DC,Color);
  points[1]:=point(center.x-len,center.y-len);
  points[2]:=point(center.x-len,center.y+len);
  points[3]:=point(center.x+len,center.y+len);
  points[4]:=point(center.x+len,center.y-len);
  Polygon(DC,points,4);
end;

procedure drawSymbol39(DC:HDC;center:Tpoint;size:word;color:TColor);
var
  len :integer;
  points:array[1..4]of TPoint;
begin
  len:=round(size /2);
  GraphDraw.SetColorPen(DC,Color);

  points[1]:=point(center.x+len,center.y);
  points[2]:=point(center.x,center.y-len);
  points[3]:=point(center.x-len,center.y);
  points[4]:=point(center.x,center.y+len);
  Polygon(DC,points,4);
end;

procedure drawSymbol40(DC:HDC;center:Tpoint;size:word;color:TColor);
var
  r :integer;
begin
  r:=round(size/2) ;
  GraphDraw.SetColorPen(DC,Color);
  movetoEx(DC,center.x-r,center.y,nil);
  Ellipse(DC,center.x-r,center.y-r,center.x+r,center.y+r);
end;

procedure drawSymbol41(DC:HDC;center:Tpoint;size:word;color:TColor);
var
  ps : array [1..10] of tpoint;
  r1,r2 :real;
  hsin1,hcos1,hsin2,hcos2 :real;
begin
  r1 :=round(size/2);
  r2 :=round(size/4);

  hsin1:=sin(Pi/10);
  hcos1:=cos(Pi/10);
  hsin2:=sin(Pi/5);
  hcos2:=cos(Pi/5);
  GraphDraw.SetColorPen(DC,Color);
  ps[1].x:=center.x;  ps[1].y:=center.y-round(r1);
  ps[2].x:=center.x+round(r2*hsin2);  ps[2].y:=center.y-round(r2*hcos2);
  ps[3].x:=center.x+round(r1*hcos1);  ps[3].y:=ps[2].y;
  ps[4].x:=center.x+round(r2*hcos1);  ps[4].y:=center.y+round(r2*hsin1);
  ps[5].x:=center.x+round(r1*hsin2);  ps[5].y:=center.y+round(r1*hcos2);
  ps[6].x:=center.x;  ps[6].y:=center.y+round(r2);
  ps[7].x:=center.x-round(r1*hsin2);  ps[7].y:=ps[5].y;
  ps[8].x:=center.x-round(r2*hcos1);  ps[8].y:=ps[4].y;
  ps[9].x:=center.x-round(r1*hcos1);;  ps[9].y:=ps[2].y;
  ps[10].x:=center.x-round(r2*hsin2);  ps[10].y:=ps[2].y;
  Polygon(DC,ps,10);
end;

procedure drawSymbol42(DC:HDC;center:Tpoint;size:word;color:TColor);
var
  v,h,l:integer;
  points:array[1..3]of TPoint;
begin
  v:=round(size/2);
  h:=round(size/2);
  l:=round(size *4/9);
  GraphDraw.SetColorPen(DC,Color);
  points[1]:=point(center.x,center.y-v);
  points[2]:=point(center.x-h,center.y+l);
  points[3]:=point(center.x+h,center.y+l);
  Polygon(DC,points,3);
end;

procedure drawSymbol43(DC:HDC;center:Tpoint;size:word;color:TColor);
var
  v,h,l:integer;
  points:array[1..3]of TPoint;
begin
  v:=round(size/2);
  h:=round(size/2);
  l:=round(size *4/9);
  GraphDraw.SetColorPen(DC,Color);
  points[1]:=point(center.x,center.y+l);
  points[2]:=point(center.x-h,center.y-v);
  points[3]:=point(center.x+h,center.y-v);
  Polygon(DC,points,3);
end;

procedure drawSymbol44(DC:HDC;center:Tpoint;size:word;color:TColor);
var
  w1,w2,h1,len:integer;
  points:array[1..6]of TPoint;
begin
  size:=round(size*4/5);
  len:=round(size/2);
  w1:=len+3;
  w2:=3;
  h1:=len+3;

  drawSymbol32(DC,center,size,color);
  GraphDraw.SetColorBrush(DC,clBlack);
  GraphDraw.SetColorPen(DC,clBlack);

  points[1]:=point(center.x-len,center.y+len);
  points[2]:=point(center.x+len,center.y+len);
  points[3]:=point(center.x+len,center.y-len);
  points[4]:=point(center.x+w1,center.y-len+w2);
  points[5]:=point(center.x+w1,center.y+h1);
  points[6]:=point(center.x-len+w2,center.y+h1);

  Polygon(DC,points,6);
end;

procedure drawSymbol45(DC:HDC;center:Tpoint;size:word;color:TColor);
var
  v,l,h,w1,w2,w3,h1:integer;
  points:array[1..6]of TPoint;
begin
  size:=round(size*5/6);
  drawSymbol36(DC,center,size,color);
  v:=round(size/ 2);
  h:=round(size /2);
  l:=round(size *4/9);
  w1:=v+2;
  w2:=v-2;
  h1:=h+2;
  w3:=2;
  GraphDraw.SetColorBrush(DC,ClBlack);
  GraphDraw.SetColorPen(DC,clBlack);

  points[1]:=point(center.x,center.y-v);
  points[2]:=point(center.x+h,center.y+l);
  points[3]:=point(center.x-h,center.y+l);
  points[4]:=point(center.x-w2,center.y+h1);
  points[5]:=point(center.x+w1+w3,center.y+h1);
  points[6]:=point (center.x+w3,center.y-h);
  Polygon(DC,points,6);
end;

procedure drawSymbol46(DC:HDC;center:Tpoint;size:word;color:TColor);
var
  p:Tpoint;
begin
  size:=round(size*5/6);
  if size <5 then
  begin
    p.x:=center.x - 3;
    p.y:=center.y + 3;
  end;
  p.x:=center.x+round(size  / 8);
  p.y:=center.y+round(size  / 8);
  drawSymbol34(DC,p,size,clBlack); //颜色加深多少
  drawSymbol34(DC,center,size,color);
end;

procedure drawSymbol47(DC:HDC;center:Tpoint;size:word;color:TColor);
var
  h1,h2:integer;
  points:array[1..7]of TPoint;
begin
  h1:=round(size / 2);
  h2:=round(size / 4);
  GraphDraw.SetColorBrush(DC,Color);
  GraphDraw.SetColorPen(DC,clBlack);

  points[1]:=point(center.x+h1,center.y-h1);
  points[2]:=point(center.x+h1,center.y+h2);
  points[3]:=point(center.x+h2,center.y);
  points[4]:=point(center.x-h2,center.y+h1);
  points[5]:=point(center.x-h1,center.y+h2);
  points[6]:=point(center.x,center.y-h2);
  points[7]:=point(center.x-h2,center.y-h1);
  Polygon(DC,points,7);
end;

procedure drawSymbol48(DC:HDC;center:Tpoint;size:word;color:TColor);
var
  h1,h2:integer;
  points:array[1..7]of TPoint;
begin
  h1:=round(size / 2);
  h2:=round(size / 4);
  GraphDraw.SetColorBrush(DC,Color);
  GraphDraw.SetColorPen(DC,clBlack);
  points[1]:=point(center.x-h1,center.y+h1);
  points[2]:=point(center.x-h1,center.y-h2);
  points[3]:=point(center.x-h2,center.y);
  points[4]:=point(center.x+h2,center.y-h1);
  points[5]:=point(center.x+h1,center.y-h2);
  points[6]:=point(center.x,center.y+h2);
  points[7]:=point(center.x+h2,center.y+h1);
  Polygon(DC,points,7);
end;

procedure drawSymbol49(DC:HDC;center:Tpoint;size:word;color:TColor);
var
  len:integer;
begin
  len:=round(size / 2);
  GraphDraw.SetColorPen(DC,Color);
  movetoEx(DC,center.x-len,center.y,nil);
  lineto(DC,center.x+len,center.y);
  movetoEx(DC,center.x,center.y+len,nil);
  lineto(DC,center.x,center.y-len);
end;

procedure drawSymbol50(DC:HDC;center:Tpoint;size:word;color:TColor);
var
  len:integer;
begin
  len:=round(size / 2);
  GraphDraw.SetColorPen(DC,Color);
  movetoEx(DC,center.x-len,center.y+len,nil);
  lineto(DC,center.x+len,center.y-len);
  movetoEx(DC,center.x+len,center.y+len,nil);
  lineto(DC,center.x-len,center.y-len);
end;

procedure drawSymbol51(DC:HDC;center:Tpoint;size:word;color:TColor);
begin
  drawSymbol49(DC,center,size,color);
  drawSymbol50(DC,center,size,color);
end;

procedure drawSymbol52(DC:HDC;center:Tpoint;size:word;color:TColor);
var
  w1,w2,w3:integer;
  h1,h2,h4:integer;
  points:array[1..13]of TPoint;
begin
  w1:=round(size/16);
  w2:=round(size/8);
  w3:=round(size/2);
  h1:=round(size*3/8);
  h2:=round(size/8);
  h4:=round(size/2);
  GraphDraw.SetColorPen(DC,Color);
  GraphDraw.SetColorBrush(DC,Color);
  points[1]:=point(center.x,center.y-h4);
  points[2]:=point(center.x-w1,center.y-h1);
  points[3]:=point(center.x-w1,center.y-h2);
  points[4]:=point(center.x-w3,center.y+h2);
  points[5]:=point(center.x-w1,center.y);
  points[6]:=point(center.x-w1,center.y+h1);
  points[7]:=point(center.x-w2,center.y+h4);
  points[8]:=point(center.x+w2,center.y+h4);
  points[9]:=point(center.x+w1,center.y+h1);
  points[10]:=point(center.x+w1,center.y);
  points[11]:=point(center.x+w3,center.y+h2);
  points[12]:=point(center.x+w1,center.y-h2);
  points[13]:=point(center.x+w1,center.y-h1);
  Polygon(DC,points,13) ;
end;

procedure drawSymbol53(DC:HDC;center:Tpoint;size:word;color:TColor);
var
  len,h1,h2,h3:integer;
  points:array[1..4]of TPoint;
begin
  len:=round(size*3 / 8);
  h1:=round(size / 2);
  h2:=round(size / 6);
  h3:=round(size / 3);
  GraphDraw.SetColorPen(DC,Color);
  GraphDraw.SetColorBrush(DC,Color);
  points[1]:=point(center.x+len,center.y+h1);
  points[2]:=point(center.x+len,center.y+h2);
  points[3]:=point(center.x-len,center.y+h2);
  points[4]:=point(center.x-len,center.y+h1);
  Polygon(DC,points,4) ;
  movetoEx(DC,center.x,center.y-h2,nil);
  lineto(DC,center.x+len,center.y-h3);
  lineto(DC,center.x,center.y-h1);
  lineto(DC,center.x,center.y+h2);
end;

procedure drawSymbol54(DC:HDC;center:Tpoint;size:word;color:TColor);
var
  len,h1,h2,h3:integer;
  points:array[1..3]of TPoint;
begin
  len :=round(size*2 / 5);
  h1:=round(size / 2);
  h2:=round(size / 3);
  h3:=round(size / 6);
  GraphDraw.SetColorPen(DC,Color);
  movetoEx(DC,center.x,center.y-h3,nil);
  lineto(DC,center.x,center.y+h1);
  GraphDraw.SetColorBrush(DC,Color);
  points[1]:=point(center.x,center.y-h3);
  points[2]:=point(center.x+len,center.y-h2);
  points[3]:=point(center.x,center.y-h1);
  Polygon(DC,points,3);
end;

procedure drawSymbol55(DC:HDC;center:Tpoint;size:word;color:TColor);
var
  w1,w2,y1,y2:integer;
begin
  w1:=round(size /5);
  w2:=round(size*2 /5);
  y1:=round(size /3);
  y2:=round(size/2);
  GraphDraw.SetColorBrush(DC,Color);
  GraphDraw.SetColorPen(DC,Color);

  movetoEx(DC, center.x+w2,center.y+y2,nil);
  lineto(DC,center.x+w2,center.y-y2);
  lineto(DC,center.x-w2,center.y-y2);
  lineto(DC,center.x-w2,center.y+y2);
  lineto(DC,center.x+w2,center.y+y2);
  movetoEx(DC, center.x+w1,center.y+y1,nil);
  lineto(DC,center.x+w1,center.y-y1);
  movetoEx(DC,center.x-w1,center.y+y1,nil);
  lineto(DC,center.x-w1,center.y-y1);
  movetoEx(DC,center.x-w1,center.y,nil);
  lineto(DC,center.x+w1,center.y);
end;

procedure drawSymbol56(DC:HDC;center:Tpoint;size:word;color:TColor);
var
  len1,len2:integer ;
  points:array[1..12]of TPoint;
begin
  len1:=round(size / 2);
  len2:=round(size / 6);
  GraphDraw.SetColorPen(DC,Color);
  GraphDraw.SetColorBrush(DC,Color);
  points[1]:=point(center.x+len2,center.y+len1);
  points[2]:=point(center.x+len2,center.y+len2);
  points[3]:=point(center.x+len1,center.y+len2);
  points[4]:=point(center.x+len1,center.y-len2);
  points[5]:=point(center.x+len2,center.y-len2);
  points[6]:=point(center.x+len2,center.y-len1);
  points[7]:=point(center.x-len2,center.y-len1);
  points[8]:=point(center.x-len2,center.y-len2);
  points[9]:=point(center.x-len1,center.y-len2);
  points[10]:=point(center.x-len1,center.y+len2);
  points[11]:=point(center.x-len2,center.y+len2);
  points[12]:=point(center.x-len2,center.y+len1);
  Polygon(DC,points,12);
end;

procedure drawSymbol57(DC:HDC;center:Tpoint;size:word;color:TColor);
var
  w0,w1,w2,h1,h2:integer;
  points:array[1..6]of TPoint;
begin
  w0:=round(size/2);
  w1:=round(size/4);
  w2:=round(size/5);
  h1:=round(size*3/10);
  h2:=round(size/5);
  GraphDraw.SetColorPen(DC,Color);
  GraphDraw.SetColorBrush(DC,Color);
  points[1]:=point(center.x,center.y-h1);
  points[2]:=point(center.x+w0,center.y+w0);
  points[3]:=point(center.x+w1,center.y+w0);
  points[4]:=point(center.x,center.y+h2);
  points[5]:=point(center.x-w1,center.y+w0);
  points[6]:=point(center.x-w0,center.y+w0);
  Polygon(DC,points,6);
  movetoEx(DC,center.x,center.y-h1,nil);
  lineto(DC,center.x-w2,center.y-w0);
  movetoEx(DC,center.x,center.y-h1,nil);
  lineto(DC,center.x+w2,center.y-w0);
end;
procedure drawSymbol58(DC:HDC;center:Tpoint;size:word;color:TColor);
var
  w0,w1,h1:integer;
begin
  w0:=round(size/2);
  w1:=round(size/5);
  h1:=round(size*3/10);
  GraphDraw.SetColorPen(DC,Color);
  movetoEx(DC,center.x,center.y-w0,nil);
  lineto(DC,center.x,center.y+w0);
  movetoEx(DC,center.x-w1,center.y-h1,nil);
  lineto(DC,center.x+w1,center.y-h1);

  arc(DC,center.x-size,center.y-size-w0,center.x+size,center.y+w0,
  center.x-w0,center.y+w0,center.x+w0,center.y+w0);
end;

procedure drawSymbol59(DC:HDC;center:Tpoint;size:word;color:TColor);
var
  len :integer;
  points:array[1..4]of TPoint;
begin
  drawSymbol40(DC,center,size,clBlack);
  len:=round(size/4);
  GraphDraw.SetColorBrush(DC,Color);
  GraphDraw.SetColorPen(DC,Color);
  points[1]:=point(center.x+len,center.y);
  points[2]:=point(center.x,center.y-len);
  points[3]:=point(center.x-len,center.y);
  points[4]:=point(center.x,center.y+len);
  Polygon(DC,points,4);
end;

procedure drawSymbol60(DC:HDC;center:Tpoint;size:word;color:TColor);
var
  w0,w1,w2,w3:integer;
  h1,h2,h3,h4:integer;
  points:array[1..7]of TPoint;
begin
  w0:=round(size/2);
  w1:=round(size*3/8);
  w2:=round(size*2/7);
  w3:=round(size/7);
  h1:=round(size/6);
  h2:=w2;
  h3:=round(size*2/5);
  h4:=round(size/2);
  GraphDraw.SetColorPen(DC,Color);
  points[1]:=point(center.x,center.y-h3);
  points[2]:=point(center.x+w0,center.y);
  points[3]:=point(center.x+w1,center.y);
  points[4]:=point(center.x+w1,center.y+h3);
  points[5]:=point(center.x-w1,center.y+h3);
  points[6]:=point(center.x-w1,center.y);
  points[7]:=point(center.x-w0,center.y);
  Polygon(DC,points,7);
  movetoEx(DC,center.x-w1,center.y,nil);
  lineto(DC,center.x+w1,center.y);
  movetoEx(DC,center.x-w2,center.y-h1,nil);
  lineto(DC,center.x-w2,center.y-h4);
  lineto(DC,center.x-w3,center.y-h4);
  lineto(DC,center.x-w3,center.y-h2);
end;

procedure drawSymbol61(DC:HDC;center:Tpoint;size:word;color:TColor);
var
  ps:array [1..4]of tpoint;
  w0,w1,w2,h1,h2:integer;
begin
  w0:=round(size/2);
  w1:=round(size/5);
  w2:=round(size*2/5);
  h1:=round(size*3/10);
  h2:=round(size/4);
  GraphDraw.SetColorPen(DC,Color);
  movetoEx(DC,center.x-w2,center.y-w0,nil);
  lineto(DC,center.x-w0,center.y-h2);
  movetoEx(DC,center.x+w2,center.y-w0,nil);
  lineto(DC,center.x+w0,center.y-h2);
  lineto(DC,center.x-w0,center.y-h2);

  ps[1]:=point(center.x-w2,center.y-w0);
  ps[2]:=point(center.x-w1,center.y-h1);
  ps[3]:=ps[2];
  ps[4]:=point(center.x,center.y-w0);
  PolyBezier(DC,ps,4);

  ps[1]:=point(center.x+w2,center.y-w0);
  ps[2]:=point(center.x+w1,center.y-h1);
  ps[3]:=ps[2];
  ps[4]:=point(center.x,center.y-w0);
  PolyBezier(DC,ps,4);

  ps[1]:=point(center.x-w0,center.y-h2);
  ps[2]:=point(center.x-w2,center.y+h2);
  ps[3]:=ps[2];
  ps[4]:=point(center.x,center.y+w0);
  PolyBezier(DC,ps,4);

  ps[1]:=point(center.x,center.y+w0);
  ps[2]:=point(center.x+w2,center.y+h2);
  ps[3]:=ps[2];
  ps[4]:=point(center.x+w0,center.y-h2);
  PolyBezier(DC,ps,4);
end;

procedure drawSymbol62(DC:HDC;center:Tpoint;size:word;color:TColor);
var
  ps:array [1..4]of tpoint;
  w0,w1,w2,w3,w4,w5,h1,h2,h3:integer;
begin
  w0:=round(size/2);
  w1:=round(size/5);
  w2:=round(size*2/5);
  w3:=round(size/8);
  w4:=round(size*3/8);
  w5:=round(size*13/30);
  h1:=round(size*3/10);
  h2:=round(size/4);
  h3:=w4;
  GraphDraw.SetColorPen(DC,Color);
  movetoEx(DC,center.x-w2,center.y-w0,nil);
  lineto(DC,center.x-w0,center.y-h2);
  lineto(DC,center.x-w5,center.y-h2);
  lineto(DC,center.x-w5,center.y+h2);

  movetoEx(DC,center.x+w2,center.y-w0,nil);
  lineto(DC,center.x+w0,center.y-h2);
  lineto(DC,center.x+w5,center.y-h2);
  lineto(DC,center.x+w5,center.y+h2);

  ps[1]:=point(center.x-w2,center.y-w0);
  ps[2]:=point(center.x-w1,center.y-h1);
  ps[3]:=ps[2];
  ps[4]:=point(center.x,center.y-w0);
  PolyBezier(DC,ps,4);

  ps[1]:=point(center.x,center.y-w0);
  ps[2]:=point(center.x+w1,center.y-h1);
  ps[3]:=ps[2];
  ps[4]:=point(center.x+w2,center.y-w0);
  PolyBezier(DC,ps,4);

  ps[1]:=point(center.x-w5,center.y+h2);
  ps[2]:=point(center.x-w4,center.y+h3);
  ps[3]:=point(center.x-w3,center.y+h3);
  ps[4]:=point(center.x,center.y+w0);
  PolyBezier(DC,ps,4);

  ps[1]:=point(center.x,center.y+w0);
  ps[2]:=point(center.x+w3,center.y+h3);
  ps[3]:=point(center.x+w4,center.y+h3);
  ps[4]:=point(center.x+w5,center.y+h2);
  PolyBezier(DC,ps,4);
end;

procedure drawSymbol63(DC:HDC;center:Tpoint;size:word;color:TColor);
var
  w1,w2,w3,h1,h2:integer;
begin
  w1:=round(size / 2);
  w2:=round(size*3 / 10);
  w3:=round(size / 5);
  h1:=round(size / 2);
  h2:=round(size / 4);
  GraphDraw.SetColorBrush(DC,Color);
  GraphDraw.SetColorPen(DC,Color);
  movetoEx(DC,center.x+w1,center.y+h1,nil);
  lineto(DC,center.x+w3,center.y-h1);
  lineto(DC,center.x-w3,center.y-h1);
  lineto(DC,center.x-w1,center.y+h1);
  lineto(DC,center.x+w2,center.y-h2);
  lineto(DC,center.x-w2,center.y-h2);
  lineto(DC,center.x+w1,center.y+h1);
end;

procedure drawSymbol64(DC:HDC;center:Tpoint;size:word;color:TColor);
var
  w1,w2,w3,h1,h2,h3:integer;
begin
  w1:= round(size/2);
  w2:= round(size/3);
  w3:= round(size/6);
  h1:= w1;
  h2:= w2;
  h3:= w3;
  GraphDraw.SetColorBrush(DC,Color);
  GraphDraw.SetColorPen(DC,Color);
  movetoEx(DC,center.x-w1,center.y-h3,nil);
  lineto(DC,center.x-w3,center.y-h1);
  movetoEx(DC,center.x+w3,center.y-h1,nil);
  lineto(DC,center.x+w1,center.y-h3);
  movetoEx(DC,center.x-w2,center.y+h2,nil);
  lineto(DC,center.x+w2,center.y-h2);
  movetoEx(DC,center.x-w2,center.y-h2,nil);
  lineto(DC,center.x+w2,center.y+h2);
end;

procedure drawSymbol65(DC:HDC;center:Tpoint;size:word;color:TColor);
var
  w1,w2,h1,h2  :integer;
  points:array[1..4]of TPoint;
begin
  w1:=round(size*2 / 9);
  w2:=round(size / 3);
  h1:=round(size / 2);
  h2:=round(size /4);
  GraphDraw.SetColorBrush(DC,Color);
  GraphDraw.SetColorPen(DC,Color);

  movetoEx(DC,center.x-w1,center.y-h2,nil);
  lineto(DC,center.x+w1,center.y-h2);
  movetoEx(DC,center.x,center.y-h1,nil);
  lineto(DC,center.x,center.y);
  points[1]:=point(center.x-w2,center.y);
  points[2]:=point(center.x+w2,center.y);
  points[3]:=point(center.x+w2,center.y+h1);
  points[4]:=point(center.x-w2,center.y+h1);
  Polygon(DC,points,4);
end;

procedure drawSymbol66(DC:HDC;center:Tpoint;size:word;color:TColor);
var
  w1,w2,h1,h2:integer;
  points:array[1..9]of TPoint;
begin
  w1:=round(size / 3);
  w2:=round(size/ 6);
  h1:=round(size/ 2);
  h2:=round(size*3/10);
  GraphDraw.SetColorBrush(DC,Color);
  GraphDraw.SetColorPen(DC,clBlack);
  points[1]:=point(center.x,center.y-h1);
  points[2]:=point(center.x+w2,center.y-h2);
  points[3]:=point(center.x+w2,center.y+h2);
  points[4]:=point(center.x+w1,center.y+h2);
  points[5]:=point(center.x+w1,center.y+h1);
  points[6]:=point(center.x-w1,center.y+h1);
  points[7]:=point(center.x-w1,center.y+h2);
  points[8]:=point(center.x-w2,center.y+h2);
  points[9]:=point(center.x-w2,center.y-h2);
  Polygon(DC,points,9);
end;

procedure drawSymbol67(DC:HDC;center:Tpoint;size:word;color:TColor);
var
  w1,w2:integer;
  h0,h1,h2,h4,h5:integer;
  points:array[1..7]of TPoint;
begin
  h0:=round(size/2);
  h1:=round(size/4);
  h2:=round(size/3);
  h4:=round(size*5/12);
  h5:=round(size/6);

  w1:=h1;
  w2:=round(size/8);
  GraphDraw.SetColorPen(DC,clBlack);
  GraphDraw.SetColorBrush(DC,Color);
  points[1]:=point(center.x,center.y+h0);
  points[2]:=point(center.x-h5,center.y+h2);
  points[3]:=point(center.x+h5,center.y+h2);
  Polygon(DC,points,3);
  points[4]:=point(center.x-w2,center.y-h2);
  points[5]:=point(center.x-w2,center.y+w2);
  points[6]:=point(center.x+w2,center.y+w2);
  points[7]:=point(center.x+w2,center.y-h2);
  Polygon(DC,points[4],4);
  ellipse(DC,center.x-h2,center.y,center.x+h2,center.y+h4);
  ellipse(DC,center.x-w1,center.y-h0,center.x+w1,center.y-h1);
end;


function darwSymbol(DC:HDC;center :tpoint;shape:byte;size:integer;color:tcolor):boolean;
begin
  result:=true;
  case shape of
    31    : drawSymbol31(DC,center,size,color);
    32    : drawSymbol32(DC,center,size,color);
    33    : drawSymbol33(DC,center,size,color);
    34    : drawSymbol34(DC,center,size,color);
    35    : drawSymbol35(DC,center,size,color);
    36    : drawSymbol36(DC,center,size,color);
    37    : drawSymbol37(DC,center,size,color);
    38    : drawSymbol38(DC,center,size,color);
    39    : drawSymbol39(DC,center,size,color);
    40    : drawSymbol40(DC,center,size,color);
    41    : drawSymbol41(DC,center,size,color);
    42    : drawSymbol42(DC,center,size,color);
    43    : drawSymbol43(DC,center,size,color);
    44    : drawSymbol44(DC,center,size,color);
    45    : drawSymbol45(DC,center,size,color);
    46    : drawSymbol46(DC,center,size,color);
    47    : drawSymbol47(DC,center,size,color);
    48    : drawSymbol48(DC,center,size,color);
    49    : drawSymbol49(DC,center,size,color);
    50    : drawSymbol50(DC,center,size,color);
    51    : drawSymbol51(DC,center,size,color);
    52    : drawSymbol52(DC,center,size,color);
    53    : drawSymbol53(DC,center,size,color);
    54    : drawSymbol54(DC,center,size,color);
    55    : drawSymbol55(DC,center,size,color);
    56    : drawSymbol56(DC,center,size,color);
    57    : drawSymbol57(DC,center,size,color);
    58    : drawSymbol58(DC,center,size,color);
    59    : drawSymbol59(DC,center,size,color);
    60    : drawSymbol60(DC,center,size,color);
    61    : drawSymbol61(DC,center,size,color);
    62    : drawSymbol62(DC,center,size,color);
    63    : drawSymbol63(DC,center,size,color);
    64    : drawSymbol64(DC,center,size,color);
    65    : drawSymbol65(DC,center,size,color);
    66    : drawSymbol66(DC,center,size,color);
    67    : drawSymbol67(DC,center,size,color);
  else
    Result:=False;
  end;
end;

class function GraphDraw.DrawCustomSymbol(ADC:HDC;CustomSymbol:TCustomSymbol;Position:Tpoint):boolean;
var
  Size:Word;
begin
  Size:=0-GetFontHeigth(CustomSymbol.Size);
  Result:=darwSymbol(ADC,Position,CustomSymbol.Shape,Size,CustomSymbol.Color);
end;


//======================初始化========================
var
  hMSIMG32: HINST;

class procedure GraphDraw.DrawRectAngle(ACanvas: TCanvas; TopLeft,
  BottomRight: TPoint;DrawMode:TPenMode;DrawStyle:TPenStyle;
  DrawWidth:Integer);
var
  oldPenMode:TPenMode;
  oldPenStyle:TPenStyle;
begin
//save
  oldPenMode:=ACanvas.Pen.Mode;
  oldPenStyle:=ACanvas.Pen.Style;
//set
  ACanvas.Pen.Mode:=DrawMode;
  ACanvas.Pen.Style:=DrawStyle;
//draw
  ACanvas.MoveTo(TopLeft.x,TopLeft.y);
  ACanvas.LineTo(TopLeft.x,BottomRight.y);
  ACanvas.LineTo(BottomRight.x,BottomRight.y);
  ACanvas.LineTo(BottomRight.x,TopLeft.y);
  ACanvas.LineTo(TopLeft.x,TopLeft.y);
//restore
  ACanvas.Pen.Mode:=oldPenMode;
  ACanvas.Pen.Style:=oldPenStyle;
end;

class procedure GraphDraw.DrawLine(ACanvas:TCanvas;P1, P2: TPoint; DrawMode: TPenMode;
  DrawStyle: TPenStyle;DrawWidth:Integer;DrawColor:TColor);
var
//  oldPen:TPen;
  oldPenMode:TPenMode;
  oldPenStyle:TPenStyle;
  oldPenWidth:Integer;
  oldPenColor:TColor;
begin
//save
  oldPenMode:=ACanvas.Pen.Mode;
  oldPenStyle:=ACanvas.Pen.Style;
  oldPenWidth:=ACanvas.Pen.Width;
  oldPenColor:=ACanvas.Pen.Color;
//set
  ACanvas.Pen.Mode:=DrawMode;
  ACanvas.Pen.Style:=DrawStyle;
  ACanvas.Pen.Width:=DrawWidth;
  ACanvas.Pen.Color:=DrawColor;
//draw
  ACanvas.MoveTo(P1.x,P1.y);
  ACanvas.LineTo(P2.x,P2.y);
//restore
  ACanvas.Pen.Mode:=oldPenMode;
  ACanvas.Pen.Style:=oldPenStyle;
  ACanvas.Pen.Width:=oldPenWidth;
  ACanvas.Pen.Color:=oldPenColor;
end;

class procedure GraphDraw.DrawFrameBox(DC:HDC; X1, Y1, X2, Y2: integer);
begin
  MoveToEx(DC,X1,Y1,nil);
  LineTo(DC,X2,Y1);
  LineTo(DC,X2,Y2);
  LineTo(DC,X1,Y2);
  LineTo(DC,X1,Y1);
end;

class procedure GraphDraw.DrawFrameBox(DC:HDC; Rect: TRect);
begin
  DrawFrameBox(DC,rect.left,rect.top,rect.right,rect.bottom);
end;

class procedure GraphDraw.SetSymbolSize(Symbol: TSymbolStruct;
  Size: Byte);
begin
  Symbol.CustomSymbol.Size := Size;
(*考虑到Union结构，以下语句不需要写了
  case Symbol.Style of
      _Custom:
        Symbol.CustomSymbol.Size:=Size;
      _TrueFont:
        Symbol.TrueFont.Size:=Size;
      _Bitmap:
        Symbol.Custom.Size:=Size;
  end;
*)
end;

class procedure GraphDraw.TyoPolygon(DC:HDC;Meta:TMetaStruct; DrawCood: TDrawCood);
var
  points_count,sizeofbuffer:integer;
begin
  if Meta._Type <> _PolyRegion then Exit;

  with Meta.PolyRegion do
  begin
    points_count:=SPWAddress-PWAddress;
    sizeofbuffer:=Count*sizeof(integer)+points_count;
    if sizeofbuffer>length(PublicPointsBuff) then //容量不够－扩容
      SetLength(PublicPointsBuff,sizeofbuffer+BUFFER_INC_SIZE);
    CopyMemory(@PublicPointsBuff[0],pointer(PWAddress),sizeofbuffer);
    DrawCood.ConvertSPs(0,points_count div SizeOf(TWorldPoint),TWorldPointAry(PublicPointsBuff)); //坐标变换
    if not polypolygon(dc,PublicPointsBuff[0],PublicPointsBuff[points_count div SizeOf(Integer)],Count)
    then begin
      TErrorLog.ErrLog(ErrFormat
        ('Drawmeta','Polygon ID:'+IntToStr(Meta.ID)));
    end;
  end;
end;

class procedure GraphDraw.TyoPolygonOutlineOffset(DC:HDC;Meta:TMetaStruct;
  DrawCood: TDrawCood;Offset:TPoint);
var
  points_count,sizeofbuffer:integer;
  worldp:TWorldPointAry;
  i:integer;
begin
  if Meta._Type <> _PolyRegion then Exit;

  with Meta.PolyRegion do
  begin
    points_count:=SPWAddress-PWAddress;
    sizeofbuffer:=Count*sizeof(integer)+points_count;
    if sizeofbuffer>length(PublicPointsBuff) then //容量不够－扩容
      SetLength(PublicPointsBuff,sizeofbuffer+BUFFER_INC_SIZE);
    CopyMemory(@PublicPointsBuff[0],pointer(PWAddress),sizeofbuffer);
    DrawCood.ConvertSPs(0,points_count div SizeOf(TWorldPoint),TWorldPointAry(PublicPointsBuff)); //坐标变换

    worldp:=TWorldPointAry(PublicPointsBuff);
    for i:=0 to points_count div SizeOf(TWorldPoint)-1 do
    begin
      inc(worldp[i].x,Offset.x);
      inc(worldp[i].y,Offset.y);
    end;

    if not polypolyLine(dc,PublicPointsBuff[0],PublicPointsBuff[points_count div SizeOf(Integer)],Count)
    then begin
      TErrorLog.ErrLog(ErrFormat
        ('Drawmeta','Polygon ID:'+IntToStr(Meta.ID)));
    end;
  end;
end;

class procedure GraphDraw.TyoPolyline(DC:HDC;Meta:TMetaStruct; DrawCood: TDrawCood);
var
  points_count,sizeofbuffer:integer;
begin
  if Meta._Type <> _PolyLine then Exit;
  with Meta.Polyline do
  begin
    points_count:=SPWAddress-PWAddress;
    sizeofbuffer:=Count*sizeof(integer)+points_count;
    if sizeofbuffer>length(PublicPointsBuff) then //容量不够－扩容
      SetLength(PublicPointsBuff,sizeofbuffer+BUFFER_INC_SIZE);
    CopyMemory(@PublicPointsBuff[0],pointer(PWAddress),sizeofbuffer);
    DrawCood.ConvertSPs(0,points_count div SizeOf(TWorldPoint),TWorldPointAry(PublicPointsBuff)); //坐标变换
    if not polypolyline(dc,PublicPointsBuff[0],PublicPointsBuff[points_count div SizeOf(Integer)],Count)
    then begin
      TErrorLog.ErrLog(ErrFormat
        ('Drawmeta','Polygon ID:'+IntToStr(Meta.ID)));
    end;
  end;
end;

class procedure GraphDraw.PolylineOffSet(DC:HDC;Meta:TMetaStruct; DrawCood: TDrawCood;Offset:TPoint);
var
  points_count,sizeofbuffer:integer;
  i:integer;
  worldp:TWorldPointAry;
begin
  if Meta._Type <> _PolyLine then Exit;
  with Meta.Polyline do
  begin
    points_count:=SPWAddress-PWAddress;
    sizeofbuffer:=Count*sizeof(integer)+points_count;
    if sizeofbuffer>length(PublicPointsBuff) then //容量不够－扩容
      SetLength(PublicPointsBuff,sizeofbuffer+BUFFER_INC_SIZE);
    CopyMemory(@PublicPointsBuff[0],pointer(PWAddress),sizeofbuffer);
    DrawCood.ConvertSPs(0,points_count div SizeOf(TWorldPoint),TWorldPointAry(PublicPointsBuff)); //坐标变换
    worldp:=TWorldPointAry(PublicPointsBuff);
    for i:=0 to points_count div SizeOf(TWorldPoint)-1 do
    begin
      inc(worldp[i].x,Offset.x);
      inc(worldp[i].y,Offset.y);
    end;
    if not polypolyline(dc,PublicPointsBuff[0],PublicPointsBuff[points_count div SizeOf(Integer)],Count)
    then begin
      TErrorLog.ErrLog(ErrFormat
        ('Drawmeta','Polygon ID:'+IntToStr(Meta.ID)));
    end;
  end;
end;

class procedure GraphDraw.TyoDrawText(DC:HDC;Meta:TMetaStruct;DrawCood: TDrawCood);
var
  oldFont:HFont; //currentfont,
  str:string;
//  rect:TRect;
  hi_of_text,width_of_text:integer;
  ATextWorldOutBox:TWorldRect;
  AText: TTextStruct;
  sp:TPoint;
  strList:TStringList;
  i:integer;
begin
  if Meta._Type <> _Text then Exit;
  ATextWorldOutBox:=Meta.Outbox;
  AText:=Meta.Text;

  Setlength(str,AText.Length);
  CopyMemory(@str[1],Pointer(AText.Address),AText.Length);

  AText.Font.Rotation:=AText.Angle;

  GisSystem.GetWidthHeigthOfText(AText.SP,AText.EP,
    AText.MaxCols,AText.Rows,width_of_text,hi_of_text);

  width_of_text:=Round(width_of_text/DrawCood.GetRealscale);
  hi_of_text:=Round(hi_of_text/DrawCood.GetRealscale);

  if Min(width_of_text,hi_of_text)<6 then Exit;//字太小忽略
  if hi_of_text>=255 then  //字体的最大值 Size的类型为Byte;
    AText.Font.Size:=255
  else
    AText.Font.Size:=hi_of_text;

  sp:=DrawCood.ConvertSP(AText.SP);
  oldFont:=GraphDraw.SetFontByHeight(AText.Font,DC);

  if AText.Rows=1 then
    TextOut(DC,sp.x,sp.y,Pchar(str),Length(str))
  else if AText.Rows>1 then
  begin
    strList:=TStringList.Create;
    try
      strList.Text:=str;
      for i:=0 to strList.Count-1 do
      begin
        TextOut(DC,sp.x,sp.y,Pchar(strList.Strings[i]),Length(strList.Strings[i]));
        sp.x:=sp.x+Round(hi_of_text*sin(DegToRad(AText.Angle)));
        sp.y:=sp.y+Round(hi_of_text*cos(DegToRad(AText.Angle)));
      end
    finally
      strList.Free;
    end;
  end;

  delFont(oldFont,DC);
end;


class function GraphDraw.TyoPolyPolyLine(APen:TPenStruct;DC:HDC;
  APoints:TWorldPointAry;ASubPolys:TIntegerDynArray;const ACount:integer):boolean;
var
  brush:TBrushStruct;
  pen:TPenStruct;
begin
  case APen.Pattern of
   CU_PS_NULL..CU_PS_DASH_END:
      begin
        SetPen(DC,APen);
        PolyPolyline(DC,APoints[0],ASubPolys[0],ACount);
      end;
    CU_PS_EXT_BEGIN://内置的几种windows扩展画笔支持的线型
      begin //铁道线   可改 边框颜色
        pen.Width:=APen.Width+2;
        pen.color:=APen.color;
        pen.Pattern:=CU_PS_SOLID;
        SetPen(DC,pen);
        PolyPolyline(DC,APoints[0],ASubPolys[0],ACount);
        pen.Pattern:=CU_PS_DASH10_10;
        pen.Width:=APen.Width;
        pen.color:=clWhite;
        SetPen(DC,pen);
        PolyPolyline(DC,APoints[0],ASubPolys[0],ACount);
      end;
    CU_PS_EXT_BEGIN+1:
      begin
        pen.Width:=APen.Width;
        pen.color:=APen.color;
        pen.Pattern:=CU_PS_SOLID;
        SetPen(DC,pen);
        PolyPolyline(DC,APoints[0],ASubPolys[0],ACount);
        pen.Pattern:=CU_PS_DASH1_6;
        pen.Width:=APen.Width+4;
        pen.color:=APen.color;
        SetPen(DC,pen);
        PolyPolyline(DC,APoints[0],ASubPolys[0],ACount);
      end;
    CU_PS_EXT_BEGIN+2:
      begin
        pen.Width:=APen.Width;
        pen.color:=APen.color;
        pen.Pattern:=CU_PS_SOLID;
        SetPen(DC,pen);
        PolyPolyline(DC,APoints[0],ASubPolys[0],ACount);
        pen.Pattern:=CU_PS_DASH1_3;
        pen.Width:=APen.Width+4;
        pen.color:=APen.color;
        SetPen(DC,pen);
        PolyPolyline(DC,APoints[0],ASubPolys[0],ACount);
      end;
    CU_PS_EXT_BEGIN+3:   //可改边框颜色的平行线
      begin
        pen.Width:=APen.Width+2;
        pen.color:=APen.color;
        pen.Pattern:=CU_PS_SOLID;
        SetPen(DC,pen);
        PolyPolyline(DC,APoints[0],ASubPolys[0],ACount);
        pen.Pattern:=CU_PS_SOLID;
        pen.Width:=APen.Width;
        pen.color:=clWhite;
        SetPen(DC,pen);
        PolyPolyline(DC,APoints[0],ASubPolys[0],ACount);
      end;
    CU_PS_EXT_BEGIN+4:   //可改内部颜色的平行线
      begin
        pen.Width:=APen.Width+2;
        pen.color:=clBlack;
        pen.Pattern:=CU_PS_SOLID;
        SetPen(DC,pen);
        PolyPolyline(DC,APoints[0],ASubPolys[0],ACount);
        pen.Pattern:=CU_PS_SOLID;
        pen.Width:=APen.Width;
        pen.color:=APen.color;
        SetPen(DC,pen);
        PolyPolyline(DC,APoints[0],ASubPolys[0],ACount);
      end;
    CU_PS_EXT_BEGIN+5:
      begin //铁道线   可改 内部颜色
        pen.Width:=APen.Width+2;
        pen.color:=clBlack;
        pen.Pattern:=CU_PS_SOLID;
        SetPen(DC,pen);
        PolyPolyline(DC,APoints[0],ASubPolys[0],ACount);
        pen.Pattern:=CU_PS_DASH10_10;
        pen.Width:=APen.Width;
        pen.color:=APen.color;
        SetPen(DC,pen);
        PolyPolyline(DC,APoints[0],ASubPolys[0],ACount);
      end;
    CU_PS_EXT_BEGIN+6:
      begin //县界 可改变边框颜色和宽度
        pen.Width:=APen.Width+2;
        pen.color:=APen.color;
        pen.Pattern:=CU_PS_SOLID;
        SetPen(DC,pen);
        PolyPolyline(DC,APoints[0],ASubPolys[0],ACount);

        pen.Pattern:=CU_PS_DASH8_2_1_2;
        pen.Width:=1;
        pen.color:=clBlack;
        SetPen(DC,pen);
        PolyPolyline(DC,APoints[0],ASubPolys[0],ACount);
      end;
    CU_PS_EXT_BEGIN+7..CU_PS_EXT_END:
      begin
        pen.Width:=APen.Width;
        pen.color:=APen.color;
        pen.Pattern:=CU_PS_DASH4_2;
        SetPen(DC,pen);
        PolyPolyline(DC,APoints[0],ASubPolys[0],ACount);
        pen.Pattern:=CU_PS_DASH1_3;
        pen.Width:=APen.Width+4;
        pen.color:=APen.color;
        SetPen(DC,pen);
        PolyPolyline(DC,APoints[0],ASubPolys[0],ACount);
      end;
    CU_PS_CUSTOM_BEGIN..CU_PS_CUSTOM_END: //用户自定义的线型  CU_PS_CUSTOM_BEGIN
      begin
        brush.Pattern:=2; //SOLID_BRUSH
        brush.ForeColor:=APen.color;
        pen.Pattern:=CU_PS_SOLID;
        pen.color:=APen.color;
        pen.Width:=APen.Width;
        SetBrush(DC,brush);
        SetPen(DC,pen);
        tyolstyle.PenColor:=APen.color;
        drawPolyPolyLineWithStyle(APen.Pattern-CU_PS_CUSTOM_BEGIN,DC,APoints,ASubPolys,ACount);
      end;
    else;
  end;
end;

class procedure GraphDraw.TyoDrawLine(DC:HDC;Meta:TMetaStruct);
begin
  if Meta._Type <> _line then Exit;
  with Meta.Line do
  begin
    SetPen(DC,Meta.Line.Pen);
    MoveToEx(DC,SP.x,SP.y,nil);
    LineTo(DC,EP.x,EP.y);
  end;
end;

class procedure GraphDraw.TyoDrawRect(DC:HDC;Meta:TMetaStruct);
begin
  if Meta._Type <> _Rect then Exit;
  SetPen(DC,Meta.Rect.Pen);
  SetBrush(DC,Meta.Rect.Brush);
  with Meta.Outbox do
  Rectangle(DC,Left,Top,Right,Bottom);
end;

class procedure GraphDraw.DrawEllipse(ACanvas: TCanvas; TopLeft,
  BottomRight: TPoint; DrawMode: TPenMode; DrawStyle: TPenStyle;
  DrawWidth: Integer);
var
  oldPenMode:TPenMode;
  oldPenStyle:TPenStyle;
begin
//save
  oldPenMode:=ACanvas.Pen.Mode;
  oldPenStyle:=ACanvas.Pen.Style;
//set
  ACanvas.Pen.Mode:=DrawMode;
  ACanvas.Pen.Style:=DrawStyle;
//draw
  ACanvas.Ellipse(TopLeft.x,TopLeft.y,BottomRight.x,BottomRight.y);
//restore
  ACanvas.Pen.Mode:=oldPenMode;
  ACanvas.Pen.Style:=oldPenStyle;
end;

class procedure GraphDraw.TyoDrawMeta(DC: HDC; Meta: TMetaStruct;
  DrawCood: TDrawCood;Offset:TPoint);
var
  startP,endP:TPoint;
begin
  case Meta._Type of
    _Symbol:
      begin
        startP:=DrawCood.ConvertSP(Meta.Symbol.Position);
        inc(startP.x,Offset.x);
        inc(startP.y,Offset.y);
      end;
    _Line:
      begin
        startP:=DrawCood.ConvertSP(Meta.Line.SP);
        endP  :=DrawCood.ConvertSP(Meta.Line.EP);
        MoveToEx(DC,startP.x+Offset.x,startP.y+Offset.y,nil);
        LineTo(DC,endP.x+Offset.x,endP.y+Offset.y);
      end;
    _Rect:
      begin
      {$IFDEF DEBUG}
        raise ENotComplete.Create;
      {$ENDIF}
      end;
    _RoundRect:
      begin
      {$IFDEF DEBUG}
        raise ENotComplete.Create;
      {$ENDIF}
      end;
    _Polyline:
      begin
        PolyLineOffset(DC,Meta,DrawCood,Offset);
      end;
    _PolyRegion:
      begin
        TyoPolygonOutlineOffset(DC,Meta,DrawCood,Offset);
      end;
    _Text:
      begin
      end;
  end;
end;

class procedure GraphDraw.ReStoreGDI(DC: HDC; OldPen: HPEN;
  OldBrush: HBrush);
begin
  DeleteObject(SelectObject(DC,oldPen));
  DeleteObject(SelectObject(DC,oldBrush));
end;

class procedure GraphDraw.SaveGDI(DC: HDC; var OldPen: HPEN;
  var OldBrush: HBrush);
begin
  oldpen:=SelectObject(DC,CreatePen(0, 1,clWhite));
  oldBrush:=SelectObject(DC,CreateSolidBrush(clWhite));
end;

class procedure GraphDraw.DrawTriAngle(ACanvas: TCanvas; Center: TPoint;
  Size: Integer; DrawMode: TPenMode; DrawStyle: TPenStyle;
  DrawWidth: Integer; DrawColor: TColor);
var
  oldPenMode:TPenMode;
  oldPenStyle:TPenStyle;
  v,h,l:integer;
  points:array[0..3]of TPoint;
  i:Integer;
begin
//save
  oldPenMode:=ACanvas.Pen.Mode;
  oldPenStyle:=ACanvas.Pen.Style;
//set
  ACanvas.Pen.Mode:=DrawMode;
  ACanvas.Pen.Style:=DrawStyle;
  ACanvas.Pen.Color:=DrawColor;
  Size:=Size*2;
  v:=round(size/2);
  h:=round(size/2);
  l:=round(size *4/9);
  points[0]:=point(center.x,center.y-v);
  points[1]:=point(center.x-h,center.y+l);
  points[2]:=point(center.x+h,center.y+l);
  points[3]:=points[0];
//draw
  ACanvas.MoveTo(points[0].x,points[0].y);
  for i:=1 to 3 do
    ACanvas.LineTo(points[i].x,points[i].y);
//restore
  ACanvas.Pen.Mode:=oldPenMode;
  ACanvas.Pen.Style:=oldPenStyle;
end;

class procedure GraphDraw.DrawDouTriAngle(ACanvas: TCanvas;
  Center: TPoint; Size: Integer; DrawMode: TPenMode; DrawStyle: TPenStyle;
  DrawWidth: Integer; DrawColor: TColor);
var
  oldPenMode:TPenMode;
  oldPenStyle:TPenStyle;
  points:array[0..3]of TPoint;
  i:Integer;
begin
//save
  oldPenMode:=ACanvas.Pen.Mode;
  oldPenStyle:=ACanvas.Pen.Style;
//set
  ACanvas.Pen.Mode:=DrawMode;
  ACanvas.Pen.Style:=DrawStyle;
  ACanvas.Pen.Color:=DrawColor;
  points[0]:=point(center.x-Size,center.y-Size);
  points[1]:=point(center.x+Size,center.y-Size);
  points[2]:=point(center.x-Size,center.y+Size);
  points[3]:=point(center.x+Size,center.y+Size);
//draw
  ACanvas.MoveTo(points[0].x,points[0].y);
  for i:=1 to 3 do
    ACanvas.LineTo(points[i].x,points[i].y);
  ACanvas.LineTo(points[0].x,points[0].y);
//restore
  ACanvas.Pen.Mode:=oldPenMode;
  ACanvas.Pen.Style:=oldPenStyle;
end;

class function GraphDraw.GetPenType(APenPattern: integer): integer;
begin
  if APenPattern<CU_PS_EXT_BEGIN then
    Result:=WINDOWS_PEN
  else if APenPattern <CU_PS_CUSTOM_BEGIN then
    Result:=WINDOWS_PEN_EXT
  else
    Result:=CUSTOM_PEN;
end;

class function GraphDraw.TyoGetTrueFontRect(Text:string;
    ATrueFont:TTrueFontStruct; APosition:TPoint): TRect;
var
  fHeight:integer;
  len:integer;
  COSA,SINA:double;
    W:integer;
begin
  fHeight:=(-GetFontHeigth(ATrueFont.size));
  len:=Length(Text);
  //if ATrueFont.Rotation=0 then
  begin
  Result.Left := APosition.x-(fHeight*len div 4);
  Result.Top := APosition.y-(fHeight div 2);
  Result.Bottom := APosition.y+(fHeight div 2);
  Result.Right := Result.Left + (fHeight*len div 2);//找到他们前以一个BUG  by dxf 2007-10-06
  end
 { else
  begin
     W:=fHeight*len;
     COSA:=cos(ATrueFont.Rotation*TO_ANGLE);
     SINA:=sin(ATrueFont.Rotation*TO_ANGLE);
     Result.Left :=Round(APosition.x-(W*COSA/4)-(fHeight*SINA/2));
     Result.Top :=Round(APosition.y+(W*SINA/4)-(fHeight*COSA/2));
     Result.Bottom :=Round(APosition.x-(W*COSA/4)+(fHeight*SINA/2));
     Result.Right :=Round(APosition.y+(W*SINA/4)+(fHeight*COSA/2));
  end;     }


{    
  if ATrueFontStruct.Rotation=0 then
    TextOut(ADC,APosition.x-(fHeight*len div 4),APosition.y-(fHeight div 2),PChar(Text),len)
  else begin
    W:=fHeight*len;
    COSA:=cos(ATrueFontStruct.Rotation*TO_ANGLE);
    SINA:=sin(ATrueFontStruct.Rotation*TO_ANGLE);
    TextOut(ADC,
      Round(APosition.x-(W*COSA/4)-(fHeight*SINA/2)),
      Round(APosition.y+(W*SINA/4)-(fHeight*COSA/2)),
      PChar(Text),
      len);
  end;  }
end;


class procedure GraphDraw.DrawCircle(ACanvas: TCanvas;
  CircleCenter: TPoint; Radius: Integer; {P1,P2:TPoint;}DrawMode: TPenMode;
  DrawStyle: TPenStyle; DrawWidth: Integer);
var
  oldPenMode:TPenMode;
  oldPenStyle:TPenStyle;
  oldPenWidth:Integer;
  oldPenColor:TColor;
begin
//save
  oldPenMode:=ACanvas.Pen.Mode;
  oldPenStyle:=ACanvas.Pen.Style;
  oldPenWidth:=ACanvas.Pen.Width;
  oldPenColor:=ACanvas.Pen.Color;
//set
  ACanvas.Pen.Mode:=DrawMode;
  ACanvas.Pen.Style:=DrawStyle;
  ACanvas.Pen.Width:=DrawWidth;
//draw
  ACanvas.Ellipse(CircleCenter.X-Radius,CircleCenter.Y -Radius,
   CircleCenter.X +Radius,CircleCenter.Y + Radius);
 // ACanvas.Ellipse(p1.X,p1.Y,p2.X,p2.Y);
//restore
  ACanvas.Pen.Mode:=oldPenMode;
  ACanvas.Pen.Style:=oldPenStyle;
  ACanvas.Pen.Width:=oldPenWidth;
  ACanvas.Pen.Color:=oldPenColor;
end;

initialization
  hMSIMG32:=LoadLibrary('msimg32.dll');
  @TransBlit:=GetProcAddress(hMSIMG32,'TransparentBlt');
  @AlphaBlit:=GetProcAddress(hMSIMG32,'AlphaBlend');
  PatternBrushBitmap:=TBitmap.Create;
  PublicCustomSymbols:=TCustomSymbols.Create;

finalization

  FreeLibrary(hMSIMG32);
  PatternBrushBitmap.Free;
  PublicCustomSymbols.Free;
end.
