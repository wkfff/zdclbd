unit ScaleDraw;

interface
uses
  windows,
  Graphics,
  Sysutils,
  tyograph,
  MetaDefine;

type
  TScale=class(TObject)
  private
    FMaxWidth:integer;
    FWidth:integer;
    FHeight:integer;
    FFontHeight:integer;
    FFColor:TColor;
    FBColor:TColor;
    FMarge:integer;
    FPixelPerUnit:double;
    FMUnit:string;
    FUnit:string;
    FKUnit:string;
    FPixelsOfScale:integer;
    FRealPixelsOfScale:double;
    FLabelPerScale:integer;
    FNumOfScale:integer;
    FValue:integer;
    FFont:TTrueFontStruct;
    function Formatint(i:integer):integer;
    function Formatint2(i: integer): integer;
  public
    constructor Create;
    destructor Destroy;override;

    procedure Draw(DC:HDC;X,Y:integer);
    procedure PreDraw;
    procedure SetUnit(Mstr,Str,KStr:string);
    property PixelPerunit:double read FPixelPerUnit write FPixelPerUnit;
    property Width:integer read FWidth;
    property MaxWidth:integer read FMaxWidth write FMaxWidth;
    property FontHeight:integer read FFontHeight write FFontHeight;
    property FColor:TColor read FFColor write FFColor;
    property BColor:TColor read FBColor write FBColor;
    property Marge:integer read FMarge write FMarge;
  end;

implementation

{ TScale }

constructor TScale.Create;
begin
  FMaxWidth:=50;
  FWidth:=0;
  FPixelsOfScale:=20;
  FHeight:=16;
  FFontHeight:=8;
  FFColor:=clGray;
  FBColor:=clWhite;
  FMarge:=4;
  FPixelPerUnit:=30;
  FMUnit:='mm';
  FUnit:='m';
  FKunit:='km';

  FFont.ForeColor:=clBlack;
  FFont.BackColor:=clWhite;
  FFont.Size:=8;
  FFont.Transparent:=1;
  FFont.FontName:='MS Sans Serif';
end;

destructor TScale.Destroy;
begin
  inherited;
end;

procedure TScale.Draw(DC:HDC;X, Y: integer);
var
  i:integer;
  Str:string;
  oldFont:HFONT;
begin
  moveToEx(DC,X,Y,nil);
  LineTo(DC,X+Round(FNumOfScale*FRealPixelsOfScale),Y);
  for i:=0 to FNumOfScale do  //!! or -1吕洪波2001-11-22晚<注>
  begin
    moveToEx(DC,X+Round(i*self.FRealPixelsOfScale),Y-2,nil);
    LineTo(DC,X+Round(i*self.FRealPixelsOfScale),Y+2);
    Str:=IntToStr(FValue*i);
    if (FValue)>=500 then
    begin
      Str:=IntToStr((FValue*i) div 1000);
      if ((FValue*i) mod 1000)=0 then
      else
        Str:=Str+'.'+IntToStr(Round(((FValue*i) mod 1000)/100));
      if i=0 then
        Str:=Str+FKUnit;
    end
    else if i=0 then Str:=Str+FUnit;
    if i mod FLabelPerScale =0 then
    begin
      oldFont:=GraphDraw.SetFont(FFont,DC);
      TextOut(DC,X+Round(i*self.FRealPixelsOfScale)-4,Y+4,Pchar(Str),Length(Str));
      GraphDraw.DelFont(oldFont,DC);
    end;
  end;
end;

function TScale.Formatint(i: integer): integer;
var j:integer;
begin
  //截整
  j:=1;
  repeat
    j:=j*10;
  until (i div j)<10;
  j:=j div 10;
  i:= (i div j)*j;
  Result:=i;
end;

function TScale.Formatint2(i: integer): integer;
var j:integer;
begin
  j:=1;
  repeat
    j:=j*10;
  until (i div j)<10;
  i:= Round(i/j);
  case i of
    1: Result:=1*j;
    2: Result:=2*j;
    3..7: Result:=5*j;
    8..10: Result:=10*j;
    else Result:=1*j;
  end;
end;

procedure TScale.PreDraw;
var
  TotalLen:integer;
//  i,a,n:integer;
  Str:string;
begin
  TotalLen:=Round(FMaxWidth*FPixelPerUnit);
  TotalLen:=FormatInt(TotalLen);
  //调整FPixelsOfScale为每一刻度为1,2,5的倍数
  FRealPixelsOfScale:=FPixelsOfScale;
  FValue:=Formatint2(Round(FRealPixelsOfScale*FPixelPerUnit));
  FNumOfScale:=Round(TotalLen/FValue); //计算可以画多少个
  FRealPixelsOfScale:=FValue/FPixelPerUnit;

  //计算最大文字标注的长度，决定每隔几个刻度标注一个值
  Str:=IntToStr(TotalLen);
  FLabelPerScale:=1;
  while (FFontHeight*Length(Str)-FLabelPerScale*FRealPixelsOfScale>0) do
  begin
    inc(FLabelPerScale);
  end;

  //返回实际的 FWidth
end;

procedure TScale.SetUnit(Mstr,Str,Kstr: string);
begin
  FMUnit:=MStr;
  FUnit:=Str;
  FKUnit:=KStr;
end;

end.

