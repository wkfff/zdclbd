unit tyolstyle;
{$R-}
interface
uses
  Graphics, classes, Types, MetaDefine;
const

  GLNULL                =0; //
  GLPolyLineStart       =1; //
  GLPolyLineMid         =2; // --
  GLPolyLineEnd         =3; // --
  GLLine                =4; // --
  GLPoint               =5; // --
  GLPolyLine            =6;
  GLPolygonStart        =7;
  GLPolygonEnd          =8;
  GLinflexionOfLine     =9;
  GLinflexionOfGonS     =10;
  GLinflexionOfGonE     =11;

  //
type

  {每个线元素的数据结构
  @TABB
  @H(标识      |类型   |含义      |参见)
  @R( pointType|integer|点的类型  | )
  @R( x        |integer|点的X坐标 | )
  @R( y        |integer|点的Y坐标 | )
  @R( ID       |integer|点的标识  | )
  @R( relatedID|integer|相关点的标识|)
  @TABE
  如果点的类型是线段的终点，那RelatedID记在的就是线段的起点.}
  TLinePixel=record
    pointType:integer;
    x:integer;
    y:integer;
    ID:integer;
    relatedID:integer;
  end;

  {循环单元中的一个元素}
  TLineElement=record
    pointsCount:integer;
    Points:array of TLinePixel;
  end;

  {线的循环单元}
  TLineLoopUnit=array of TLineElement;
  TLineLoopUnits=array of TLineLoopUnit;

  {线型仓库}
  TGisLineStyles=class
  private
    FList:TLineLoopUnits;
    FCount:integer;
    FLineStyleFileName: string;
    procedure SetLineStyleFileName(const Value: string);
  protected
    procedure LoadLinePattern(AIndex:integer);
    {自定义线型的覆盖方法}
    procedure LoadCustomPattern(var ALineLoopUnit:TLineLoopUnit); virtual;
  public
    constructor Create;
    destructor Destroy;override;
    procedure GetLineStyle(AIndex:integer;var ALoopUnit:TLineLoopUnit);
    property LineStyleFileName:string read FLineStyleFileName write SetLineStyleFileName;
    property Count:integer read FCount;
  end;

  TGisLineStyleManager=class
  private
    FList:TLineLoopUnits;
  public
    constructor Create(ALoopUnit:TLineLoopUnit);
    destructor Destroy; override;
    procedure GetValueByDegree(AAngle:integer;var ALoopUnit:TLineLoopUnit);
  end;

  procedure drawPolyPolyLineWithStyle(AStyleIndex:integer;DC:integer;
    APoints:TWorldPointAry;ASubPolys:TIntegerDynArray;ACount:integer);

  procedure drawLineWithStyle(AStyleIndex:integer;DC:integer;
    X1,Y1,X2,Y2:integer);
var
  PenColor:TColor;
implementation
uses
  windows,
  math,
  MathCalc;

{ TGisLineStyles }

constructor TGisLineStyles.Create;
begin
  FCount:=0;
end;

destructor TGisLineStyles.Destroy;
begin
  inherited;
end;

procedure TGisLineStyles.GetLineStyle(AIndex: integer;
  var ALoopUnit: TLineLoopUnit);
//var
//  i:integer;
begin
  if (AIndex>=Count) then
  begin
    FCount:=AIndex+1;
    SetLength(FList,FCount);
  end;

  if Length(FList[AIndex])<=0 then  //还没有数据,需要从文件中加载
  begin
    LoadLinePattern(AIndex);
  end;

  ALoopUnit:=FList[AIndex];
end;

procedure TGisLineStyles.LoadCustomPattern(
  var ALineLoopUnit: TLineLoopUnit);
begin
  //for ChildClass override
end;

procedure TGisLineStyles.LoadLinePattern(AIndex:integer);
var
  i:integer;
begin
  case AIndex of
  0: //铁道 ////////////////////////////////////////////////
    begin
      SetLength(FList[AIndex],30);
      for i:=0 to 29 do
      begin
        case i of
          0:
            begin
              FList[AIndex][i].pointsCount:=2;
              SetLength(FList[AIndex][i].Points,2);
              FList[AIndex][i].Points[0].x:=i;
              FList[AIndex][i].Points[0].y:=-2;
              FList[AIndex][i].Points[0].pointType:=GLPolygonStart;
              FList[AIndex][i].Points[0].ID:=0;

              FList[AIndex][i].Points[1].x:=i;
              FList[AIndex][i].Points[1].y:=2;
              FList[AIndex][i].Points[1].pointType:=GLPolygonStart;
              FList[AIndex][i].Points[1].ID:=1;
            end;
          1..19:
            begin
              FList[AIndex][i].pointsCount:=2;
              SetLength(FList[AIndex][i].Points,2);
              FList[AIndex][i].Points[0].x:=i;
              FList[AIndex][i].Points[0].y:=2;
              FList[AIndex][i].Points[0].pointType:=GLinflexionOfGonS;
              FList[AIndex][i].Points[0].ID:=0;

              FList[AIndex][i].Points[1].x:=i;
              FList[AIndex][i].Points[1].y:=-2;
              FList[AIndex][i].Points[1].pointType:=GLinflexionOfGonE;
              FList[AIndex][i].Points[1].ID:=1;
            end;
          20:
            begin
              FList[AIndex][i].pointsCount:=4;
              SetLength(FList[AIndex][i].Points,4);
              FList[AIndex][i].Points[0].x:=i;
              FList[AIndex][i].Points[0].y:=2;
              FList[AIndex][i].Points[0].pointType:=GLPolygonStart;
              FList[AIndex][i].Points[0].relatedID:=0;

              FList[AIndex][i].Points[1].x:=i;
              FList[AIndex][i].Points[1].y:=-2;
              FList[AIndex][i].Points[1].pointType:=GLPolygonEnd;
              FList[AIndex][i].Points[1].relatedID:=0;

              FList[AIndex][i].Points[2].x:=i;
              FList[AIndex][i].Points[2].y:=-2;
              FList[AIndex][i].Points[2].pointType:=GLPolyLineStart;
              FList[AIndex][i].Points[2].ID:=0;

              FList[AIndex][i].Points[3].x:=i;
              FList[AIndex][i].Points[3].y:=2;
              FList[AIndex][i].Points[3].pointType:=GLPolyLineStart;
              FList[AIndex][i].Points[3].ID:=1;
            end;
          29:
            begin
              FList[AIndex][i].pointsCount:=2;
              SetLength(FList[AIndex][i].Points,2);
              FList[AIndex][i].Points[0].x:=i;
              FList[AIndex][i].Points[0].y:=-2;
              FList[AIndex][i].Points[0].pointType:=GLPolyLineEnd;
              FList[AIndex][i].Points[0].relatedID:=0;

              FList[AIndex][i].Points[1].x:=i;
              FList[AIndex][i].Points[1].y:=2;
              FList[AIndex][i].Points[1].pointType:=GLPolyLineEnd;
              FList[AIndex][i].Points[1].relatedID:=1;
            end;
          else
            begin
              FList[AIndex][i].pointsCount:=0;
            end;
        end;
      end;
    end;
  1: //城墙 ////////////////////////////////////////////////
    begin
      SetLength(FList[AIndex],10);
      for i:=0 to 9 do
      begin
        case i of
          0:
            begin
              FList[AIndex][i].pointsCount:=2;
              SetLength(FList[AIndex][i].Points,2);
              FList[AIndex][i].Points[0].x:=i;
              FList[AIndex][i].Points[0].y:=0;
              FList[AIndex][i].Points[0].pointType:=GLPolyLineStart;
              FList[AIndex][i].Points[0].ID:=0;

              FList[AIndex][i].Points[1].x:=i;
              FList[AIndex][i].Points[1].y:=-4;
              FList[AIndex][i].Points[1].pointType:=GLPolyLineMid;
              FList[AIndex][i].Points[1].ID:=1;
              FList[AIndex][i].Points[1].relatedID:=0;
            end;
          5:
            begin
              FList[AIndex][i].pointsCount:=2;
              SetLength(FList[AIndex][i].Points,2);

              FList[AIndex][i].Points[0].x:=i;
              FList[AIndex][i].Points[0].y:=-4;
              FList[AIndex][i].Points[0].pointType:=GLPolyLineMid;
              FList[AIndex][i].Points[0].ID:=2;
              FList[AIndex][i].Points[0].relatedID:=1;

              FList[AIndex][i].Points[1].x:=i;
              FList[AIndex][i].Points[1].y:=0;
              FList[AIndex][i].Points[1].pointType:=GLPolyLineMid;
              FList[AIndex][i].Points[1].ID:=3;
              FList[AIndex][i].Points[1].relatedID:=2;
            end;
          9:
            begin
              FList[AIndex][i].pointsCount:=2;
              SetLength(FList[AIndex][i].Points,2);
              FList[AIndex][i].Points[0].x:=i;
              FList[AIndex][i].Points[0].y:=0;
              FList[AIndex][i].Points[0].pointType:=GLPolyLineEnd;
              FList[AIndex][i].Points[0].ID:=4;
              FList[AIndex][i].Points[0].relatedID:=3;

              FList[AIndex][i].Points[1].x:=i;
              FList[AIndex][i].Points[1].y:=0;
              FList[AIndex][i].Points[1].pointType:=GLPoint;
              FList[AIndex][i].Points[1].ID:=5;
            end;
          else
            begin
              FList[AIndex][i].pointsCount:=0;
            end;
        end;
      end;
    end;
  2://运河 /////////////////////////////////////////////////////////////
    begin
      SetLength(FList[AIndex],6);
      for i:=0 to 5 do
      begin
        case i of
          0:
            begin
              FList[AIndex][i].pointsCount:=2;
              SetLength(FList[AIndex][i].Points,2);
              FList[AIndex][i].Points[0].x:=i;
              FList[AIndex][i].Points[0].y:=0;
              FList[AIndex][i].Points[0].pointType:=GLPolyLineStart;
              FList[AIndex][i].Points[0].ID:=0;

              FList[AIndex][i].Points[1].x:=i;
              FList[AIndex][i].Points[1].y:=-5;
              FList[AIndex][i].Points[1].pointType:=GLPolyLineEnd;
              FList[AIndex][i].Points[1].ID:=1;
              FList[AIndex][i].Points[1].relatedID:=0;
            end;
          else
            begin
              FList[AIndex][i].pointsCount:=1;
              SetLength(FList[AIndex][i].Points,1);
              FList[AIndex][i].Points[0].x:=i;
              FList[AIndex][i].Points[0].y:=0;
              FList[AIndex][i].Points[0].pointType:=GLPoint;
              FList[AIndex][i].Points[0].ID:=2;
            end;
        end;
      end;
    end;
  3: //国界////////////////////////////////////////////////////////////
    begin

      SetLength(FList[AIndex],12);
      for i:=0 to 11 do
      begin
        case i of
          0,8:
            begin
              FList[AIndex][i].pointsCount:=2;
              SetLength(FList[AIndex][i].Points,2);
              FList[AIndex][i].Points[0].x:=i;
              FList[AIndex][i].Points[0].y:=2;
              FList[AIndex][i].Points[0].pointType:=GLPolyLineStart;
              FList[AIndex][i].Points[0].ID:=1+i;

              FList[AIndex][i].Points[1].x:=i;
              FList[AIndex][i].Points[1].y:=-3;
              FList[AIndex][i].Points[1].pointType:=GLPolyLineEnd;
              FList[AIndex][i].Points[1].ID:=1;
              FList[AIndex][i].Points[1].relatedID:=1+i;
            end;
          9,11:
            begin
              FList[AIndex][i].pointsCount:=0;
            end;
          else
            begin
              FList[AIndex][i].pointsCount:=1;
              SetLength(FList[AIndex][i].Points,1);

              FList[AIndex][i].Points[0].x:=i;
              FList[AIndex][i].Points[0].y:=0;
              FList[AIndex][i].Points[0].pointType:=GLPoint;
              FList[AIndex][i].Points[0].ID:=2;
            end;
        end;
      end;
    end;
  4:
    begin
      SetLength(FList[AIndex],20);
      for i:=0 to 19 do
      begin
        case i of
          0:
            begin
              FList[AIndex][i].pointsCount:=2;
              SetLength(FList[AIndex][i].Points,2);
              FList[AIndex][i].Points[0].x:=i;
              FList[AIndex][i].Points[0].y:=-2;
              FList[AIndex][i].Points[0].pointType:=GLPolyLineStart;
              FList[AIndex][i].Points[0].ID:=0;

              FList[AIndex][i].Points[1].x:=i;
              FList[AIndex][i].Points[1].y:=2;
              FList[AIndex][i].Points[1].pointType:=GLPolyLineStart;
              FList[AIndex][i].Points[1].ID:=1;
            end;
          1..18:
            begin
               FList[AIndex][i].pointsCount:=2;
               SetLength(FList[AIndex][i].Points,2);

               FList[AIndex][i].Points[0].x:=i;
               FList[AIndex][i].Points[0].y:=-2;
               FList[AIndex][i].Points[0].pointType:=GLinflexionOfLine;
               FList[AIndex][i].Points[0].relatedID:=0;


               FList[AIndex][i].Points[1].x:=i;
               FList[AIndex][i].Points[1].y:=2;
               FList[AIndex][i].Points[1].pointType:=GLinflexionOfLine;
               FList[AIndex][i].Points[1].relatedID:=1;
            end;
          19:
            begin
              FList[AIndex][i].pointsCount:=2;
              SetLength(FList[AIndex][i].Points,2);
              FList[AIndex][i].Points[0].x:=i;
              FList[AIndex][i].Points[0].y:=-2;
              FList[AIndex][i].Points[0].pointType:=GLPolyLineEnd;
              FList[AIndex][i].Points[0].relatedID:=0;

              FList[AIndex][i].Points[1].x:=i;
              FList[AIndex][i].Points[1].y:=2;
              FList[AIndex][i].Points[1].pointType:=GLPolyLineEnd;
              FList[AIndex][i].Points[1].relatedID:=1;
            end;
          else
            begin
              FList[AIndex][i].pointsCount:=0;
            end;
        end;
      end;
    end;
  5:
    begin
      SetLength(FList[AIndex],16);
      for i:=0 to 15 do
      begin
        case i of
          10:
            begin
              FList[AIndex][i].pointsCount:=2;
              SetLength(FList[AIndex][i].Points,2);
              FList[AIndex][i].Points[0].x:=i;
              FList[AIndex][i].Points[0].y:=2;
              FList[AIndex][i].Points[0].pointType:=GLPolyLineStart;
              FList[AIndex][i].Points[0].ID:=0;

              FList[AIndex][i].Points[1].x:=i;
              FList[AIndex][i].Points[1].y:=-2;
              FList[AIndex][i].Points[1].pointType:=GLPolyLineStart;
              FList[AIndex][i].Points[1].ID:=1;
            end;
          14:
            begin
              FList[AIndex][i].pointsCount:=2;
              SetLength(FList[AIndex][i].Points,2);

              FList[AIndex][i].pointsCount:=2;
              SetLength(FList[AIndex][i].Points,2);
              FList[AIndex][i].Points[0].x:=i;
              FList[AIndex][i].Points[0].y:=-3;
              FList[AIndex][i].Points[0].pointType:=GLPolyLineEnd;
              FList[AIndex][i].Points[0].relatedID:=0;

              FList[AIndex][i].Points[1].x:=i;
              FList[AIndex][i].Points[1].y:=3;
              FList[AIndex][i].Points[1].pointType:=GLPolyLineEnd;
              FList[AIndex][i].Points[1].relatedID:=1;
            end;
          0..8:
            begin
              FList[AIndex][i].pointsCount:=1;
              SetLength(FList[AIndex][i].Points,1);

              FList[AIndex][i].Points[0].x:=i;
              FList[AIndex][i].Points[0].y:=0;
              FList[AIndex][i].Points[0].pointType:=GLPoint;
              FList[AIndex][i].Points[0].ID:=5;
            end;
          else
            begin
              FList[AIndex][i].pointsCount:=0;
            end;
        end;
      end;
    end;
  else
    begin
      LoadcustomPattern(FList[AIndex]);
    end;
  end;
end;

procedure TGisLineStyles.SetLineStyleFileName(const Value: string);
begin
  FLineStyleFileName:=Value;
end;

{ TGisLineStyleManager }

constructor TGisLineStyleManager.Create(ALoopUnit: TLineLoopUnit);
var
  i,j:integer;
begin
  setLength(FList,360);
  SetLength(FList[0],Length(ALoopUnit));

  for i:=0 to high(ALoopUnit) do
  begin
    FList[0][i].pointsCount:=ALoopUnit[i].pointsCount;
    SetLength(FList[0][i].Points,ALoopUnit[i].pointsCount);
    for j:=0 to ALoopUnit[i].pointsCount-1 do
    begin
      FList[0][i].Points[j]:=ALoopUnit[i].Points[j];
      FList[0][i].Points[j].x:=0;
    end;

    {CopyMemory(@FList[0][i].Points[0],
      @ALoopUnit[i].Points[0],
      ALoopUnit[i].pointsCount*SizeOf(FList[0][i].Points[0]));
    }
  end;

end;

destructor TGisLineStyleManager.Destroy;
begin
  inherited;
end;

procedure TGisLineStyleManager.GetValueByDegree(AAngle: integer;var ALoopUnit:TLineLoopUnit);
var
  i,j:integer;
  x,y:integer;
  COSA,SINA:double;
begin
  if AAngle >=360 then AAngle:=AAngle mod 360;
  if AAngle <0 then AAngle:=AAngle+360;
  if Length(FList[AAngle])=0 then
  begin
    SetLength(FList[AAngle],Length(FList[0]));
    COSA:=Cos(AAngle*(pi/180));
    SINA:=Sin(AAngle*(pi/180));

      for i:=0 to high(FList[0]) do
      begin
        SetLength(FList[AAngle][i].Points,FList[0][i].pointsCount);
        FList[AAngle][i].pointsCount:=FList[0][i].pointsCount;
        for j:=0 to FList[0][i].pointsCount-1 do
        begin
          x:=Round(-FList[0][i].Points[j].y*SINA);//X=xcosα－ysinα
          y:=Round(FList[0][i].Points[j].y*COSA);//Y= xsinα＋ycosα
          FList[AAngle][i].Points[j].y:=y;
          FList[AAngle][i].Points[j].x:=x;
          FList[AAngle][i].Points[j].ID:=FList[0][i].Points[j].ID;
          FList[AAngle][i].Points[j].relatedID:=FList[0][i].Points[j].relatedID;
          FList[AAngle][i].Points[j].pointType:=FList[0][i].Points[j].pointType;
        end;
      end;

  end;

  ALoopUnit:=FList[AAngle];
end;

type
 DDAP=procedure(x,y,dc:integer); stdcall;

var
  FGisLineStyles:TGisLineStyles;
  FCurLoopUnit:TLineLoopUnit; //全局的线段循环单元

var
  orgX,orgY,GOffSet:integer;
  FDrawing:boolean;
  Spoints:TWorldPointAry;
  //SPolygon:array[0..1]of TPoint;
  points:array[0..3] of TPoint;
  pCount:integer;
//  Color:TColor;

procedure PushPoint(AX,AY,AID:integer);
begin
  if Length(Spoints)<=AID then
    SetLength(Spoints,AID+10);
  Spoints[AID].x:=AX;
  Spoints[AID].y:=AY;
end;
function GetPoint(AID:integer):TPoint;
begin
  Result:=Spoints[AID];
end;

procedure insertPolygonPoint(x,y:integer);
begin
  points[pCount].x:=x;
  points[pCount].y:=y;
  inc(pCount);
end;

procedure LineDDAProc(X,Y,DC:integer); stdcall;
var
  offset:integer;
  i:integer;
  lp:TPoint;//,p1,p2
begin
  begin
    offset:=(max(abs(X-orgX),abs(Y-orgY))+GOffSet )mod length(FCurLoopUnit);
    for i:=0 to FCurLoopUnit[offset].pointsCount-1 do
    begin
      case FCurLoopUnit[offset].Points[i].pointType of
        GLNULL:;
        GLPolyLineStart:
          begin
            PushPoint(x+FCurLoopUnit[offset].Points[i].x,
              y+FCurLoopUnit[offset].Points[i].y,FCurLoopUnit[offset].Points[i].ID);
          end;
        GLPolyLineMid:
          begin
            lp:=GetPoint(FCurLoopUnit[offset].Points[i].relatedID);

            MoveToEx(DC,lp.x,lp.y,nil);
            LineTo(DC,x+FCurLoopUnit[offset].Points[i].x,y+FCurLoopUnit[offset].Points[i].y);

            PushPoint(x+FCurLoopUnit[offset].Points[i].x,
              y+FCurLoopUnit[offset].Points[i].y,FCurLoopUnit[offset].Points[i].ID);
          end;
        GLPolyLineEnd:
          begin
            MoveToEx(DC,
              GetPoint(FCurLoopUnit[offset].Points[i].relatedID).x,
              GetPoint(FCurLoopUnit[offset].Points[i].relatedID).y,nil);
            LineTo(DC,x+FCurLoopUnit[offset].Points[i].x,y+FCurLoopUnit[offset].Points[i].y);
          end;
        GLPolygonStart:
          begin
            insertPolygonPoint(x+FCurLoopUnit[offset].points[i].x,y+FCurLoopUnit[offset].points[i].y);
          end;
        GLPolygonEnd:
          begin
            insertPolygonPoint(x+FCurLoopUnit[offset].points[i].x,y+FCurLoopUnit[offset].points[i].y);
            Polygon(DC,points[0],4);
            pCount:=0;
          end;
        GLPoint:
          SetPixel(HDC(DC),x+FCurLoopUnit[offset].Points[i].x,y+FCurLoopUnit[offset].Points[i].y,PenColor);
      end;
    end;
  end;
end;

procedure drawLineWithStyle(AStyleIndex:integer;DC:integer;
  X1,Y1,X2,Y2:integer);
var
  pointsArray:TWorldPointAry;
  subPolys:TIntegerDynArray;
begin
  SetLength(subPolys,1);
  subPolys[0]:=2;
  SetLength(pointsArray,2);
  pointsArray[0].x:=x1;
  pointsArray[0].y:=y1;
  pointsArray[1].x:=x2;
  pointsArray[1].y:=y2;

  drawPolyPolyLineWithStyle(AStyleIndex,DC,
    pointsArray,subPolys,1);
end;

procedure drawPolyPolyLineWithStyle(AStyleIndex:integer;DC:integer;
  APoints:TWorldPointAry;ASubPolys:TIntegerDynArray;ACount:integer);
var
  d:DDAP;
  p:pointer absolute d;
  angle:integer;
  i,ii,iSubCount:integer;
  X1,X2,Y1,Y2:integer;

  p1,p2,lp:TPoint;
  offset:integer;
  geoLineStyleManager:TGisLineStyleManager;
  lineLoopUnit:TLineLoopUnit;
  iOffset:integer;
begin
  if FDrawing then Exit;
  FDrawing:=True;

  FGisLineStyles.GetLineStyle(AStyleIndex,lineLoopUnit);
  if length(lineLoopUnit)=0 then
  begin
    FDrawing:=False;
    Exit;
  end;
  
  try
    geoLineStyleManager:=TGisLineStyleManager.Create(lineLoopUnit);
  //=============================================================
    begin
      d:=LineDDAProc;
      if Length(APoints)<2 then exit;

      iOffset:=0;
      for iSubCount:=0 to High(ASubPolys) do
      begin
        GOffSet:=0;
        pCount:=0;
        for i:=0 to ASubPolys[iSubCount]-2 do
        begin
          X1:=Apoints[i+iOffset].x;
          X2:=Apoints[i+1+iOffset].x;
          Y1:=Apoints[i+iOffset].y;
          Y2:=Apoints[i+1+iOffset].y;

          angle:=Round(GisMath.RadToDeg(ArcTan2(Y2-Y1,
            X2-X1)));
          geoLineStyleManager.GetValueByDegree(angle,FCurLoopUnit);

          orgX:=X1; orgY:=Y1;

            offset:=(GOffSet)mod length(FCurLoopUnit);
            for ii:=0 to FCurLoopUnit[offset].pointsCount-1 do
            begin
              if FCurLoopUnit[offset].Points[ii].pointType=GLinflexionOfLine then
                begin
                    p1:=GetPoint(FCurLoopUnit[offset].Points[ii].relatedID);
                    p2.x:=x1+FCurLoopUnit[offset].Points[ii].x;
                    p2.y:=y1+FCurLoopUnit[offset].Points[ii].y;

                    lp:=p2;
                    MoveToEx(DC,p1.x,p1.y,nil);
                    LineTo(DC,lp.x,lp.y);

                    PushPoint(lp.x,lp.y,FCurLoopUnit[offset].Points[ii].relatedID);
                end;
              if FCurLoopUnit[offset].Points[ii].pointType=GLinflexionOfgonS then
              begin
                p2.x:=x1+FCurLoopUnit[offset].Points[ii].x;
                p2.y:=y1+FCurLoopUnit[offset].Points[ii].y;
                insertPolygonPoint(p2.x,p2.y);
              end;
              if FCurLoopUnit[offset].Points[ii].pointType=GLinflexionOfgonE then
              begin
                p2.x:=x1+FCurLoopUnit[offset].Points[ii].x;
                p2.y:=y1+FCurLoopUnit[offset].Points[ii].y;
                insertPolygonPoint(p2.x,p2.y);
                Polygon(DC,points,4);
                points[0]:=points[3];
                points[1]:=points[2];
                pCount:=2;
              end;

            end;

          LineDDA(X1,Y1,X2,Y2,p,DC);
          //处理最后一点
            offset:=(max(abs(X2-orgX),abs(Y2-orgY))+GOffSet )mod length(FCurLoopUnit);
            for ii:=0 to FCurLoopUnit[offset].pointsCount-1 do
            begin
              if FCurLoopUnit[offset].Points[ii].pointType=GLinflexionOfLine then
                begin
                    p1:=GetPoint(FCurLoopUnit[offset].Points[ii].relatedID);
                    p2.x:=x2+FCurLoopUnit[offset].Points[ii].x;
                    p2.y:=y2+FCurLoopUnit[offset].Points[ii].y;

                    lp:=p2;
                    MoveToEx(DC,p1.x,p1.y,nil);
                    LineTo(DC,lp.x,lp.y);
                    PushPoint(lp.x,lp.y,FCurLoopUnit[offset].Points[ii].relatedID);
                end;
              if FCurLoopUnit[offset].Points[ii].pointType=GLinflexionOfgonS then
              begin
                p2.x:=x2+FCurLoopUnit[offset].Points[ii].x;
                p2.y:=y2+FCurLoopUnit[offset].Points[ii].y;
                insertPolygonPoint(p2.x,p2.y);
              end;
              if FCurLoopUnit[offset].Points[ii].pointType=GLinflexionOfgonE then
              begin
                p2.x:=x2+FCurLoopUnit[offset].Points[ii].x;
                p2.y:=y2+FCurLoopUnit[offset].Points[ii].y;
                insertPolygonPoint(p2.x,p2.y);
                Polygon(DC,points,4);
                points[0]:=points[3];
                points[1]:=points[2];
                pCount:=2;
              end;
            end;

          GOffSet:=GOffSet+(max(abs(X2-X1),abs(Y2-Y1)))mod length(FCurLoopUnit);
        end;
        iOffset:=iOffset+ASubPolys[iSubCount];
      end;
    end;
    //==============================================================
  finally
    FDrawing:=False;
    if geoLineStyleManager<>nil then
      geoLineStyleManager.Free;
  end;
end;

initialization
  FGisLineStyles:=TGisLineStyles.Create;
finalization
  FGisLineStyles.Free;
end.
