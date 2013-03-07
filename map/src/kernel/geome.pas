unit geome;

interface
uses
  Windows,
  Classes,
  Math,
  Types,
  MetaDefine,
  MapMeasure,
  MathCalc,
  MapMeasureCalc;

const
  TO_ANGLE = PI / 180;
  TO_DEGREE = 180 / PI;
type
  {描述一直线与一个多边形的相交的交点，要求必须是外多边形}
  TIntersect=record
    PIn: TWorldPoint;
    POut: TWorldPoint;
    Length: Integer;
  end;
  TIntersectAry = array of TIntersect;
  TAreaUnit=(auM2,auKM2,auMM2,auDM2);//(平方米,平方公里,平方毫米,平方分米)
  {几何计算类}
  GeometryCalc =class
  private
    class function GetOutBoxArea(Meta: TMetaStruct): double;
  public
    class function InitWorldRect():TWorldRect;
    class function InitEarthRect: TEarthRect;

    class function EqualPoint(P1,P2:TPoint):Boolean;
    class function Gis_P2L_Dist(const Px, Py, BeePx1, BeePy1, BeePx2,
      BeePy2: double): double;//点到线段
    class function Gis_P2P_Dist(const X1, Y1, X2, Y2: double): double;
    class function Gis_P2BL_Dist(const Px, Py, BeePx1, BeePy1, BeePx2,
      BeePy2: double): double;
    class procedure FormatWorldRect(var AWorldRect:TWorldRect);
    class function CalEarthOutBox(Points:TEarthPointAry;PointCount:integer):TEarthRect;
    class function CalWorldOutBox(Points:TWorldPointAry;PointCount:integer):TWorldRect;
    class function LineCrossPoint(p1,p2:TWorldPoint;p3,p4:TWorldPoint;var p:TWorldPoint):integer ;
    class function GetCentrePoint(const AWorldRect:TWorldRect):TWorldPoint;
    class function RectInRect(SmallRect,BigRect:TWorldRect):Boolean;
    class function RectAcross(Rect1,Rect2:TWorldRect):Boolean;overload;
    class function RectAcross(Rect1,Rect2:TEarthRect):Boolean;overload;
    class function PolygonAcrossEllipse(APolygon:TWorldPointAry;AnEllipse:TWorldRect):Boolean;
    class function MergeRect(ARect1,ARect2:TWorldRect):TWorldRect;overload;
    class function MergeRect(APoint:TPoint;ARect:TWorldRect):TWorldRect;overload;
    class function MergeRect(APoint1,APoint2:TPoint):TWorldRect;overload;
    class function MergeRect(ARect1,ARect2:TEarthRect):TEarthRect;overload;
    class function MergeRects(GeoMetaFlexs:TWorldMetaAry):TWorldRect;
    class function MergeEarthRect(ARect1, ARect2: TEarthRect): TEarthRect;overload;
    class function MergeEarthRect(ARect1:TEarthRect;APoint:TEarthPoint):TEarthRect;overload;
    class function MergeEarthRect(P1,P2: TEarthPoint):TEarthRect;overload;
    class function crossLine(PointWanted,Point1,Point2:TPoint):boolean;
    class function RectAcrossLine(AWorldRect:TWorldRect;StartPoint,EndPoint:TPoint):Boolean;
    class function PointInRect(APoint:TWorldPoint;ARect:TWorldRect):Boolean;overload;//点是否在矩形内
    class function PointInRect(APoint:TPoint;ARect:TRect):Boolean;overload;//点是否在矩形内
    class function PointInRect(APoint: TWorldPoint; ARect: TWorldRect;
      margeRatio: double): Boolean;overload;
    class function PointInRound(APoint: TWorldPoint;CenterPoint: TWorldPoint; Radius: Double):Boolean;
    class function PointInEllipse(APoint: TWorldPoint;Outbox:TWorldRect):Boolean;
    class function RectInEllipse(AWorldRect: TWorldRect;Ellipse:TWorldRect):Boolean;
    class function IsLineAcross(StartPoint1,EndPoint1,StartPoint2,EndPoint2:TWorldPoint):boolean;overload;
    class function IsLineAcross(StartPoint,EndPoint:TEarthPoint;AA,BB,CC:DOUBLE):Boolean;overload;
    class function LineAcrossEllipse(StartPoint,EndPoint:TPoint;EllipseRect:TWorldRect):Boolean;
    class function PointInPolygon(APoint:TWorldPoint;APolygon:TWorldPointAry;Start,Length:Integer):Boolean;
    class function PointAcrossPolygon(APoint:TWorldPoint;APolygon:TWorldPointAry;Start,Length:Integer)
      :Integer;
    class function PointToPolyLine(APoint:TPoint;LineNum:Integer;SubLines: TIntegerDynArray;
      SubPoints:TWorldPointAry):Double;
    class function RectAcrossPolyLine(AWorldRect:TWorldRect;LineNum:Integer;SubLines: TIntegerDynArray;
      SubPoints:TWorldPointAry):boolean;//
    class function RectAcrossPolyRegion(AWorldRect:TWorldRect;RegionNum:Integer;SubPoints: TIntegerDynArray;
      Points:TWorldPointAry):boolean;//

    class function PointInPolyRegion(APoint:TPoint;RegionNum:Integer;SubPoints: TIntegerDynArray;
      AWorldPoints:TWorldPointAry):Boolean; //
    class function ReturnOutboxFromLine(AStartPoint,AEndPoint:TPoint): TRect;
    class function WorldRectFromLine(AStartPoint,
        AEndPoint:TWorldPoint): TWorldRect;
    class function SelfAcross(APolygon:TWorldPointAry;var CrossPoint:TWorldPoint):Boolean;
   class procedure pointPositive(p1,p2:TWorldPoint;worldpoints1,worldpoints2:TWorldPointAry;start1,start2:Integer;le1,le2:Integer;var count1,count2:integer);
   class procedure  PolyPolygonPositive(count:integer;subpoints:TIntegerDynArray;
   worldpoints:TWorldPointAry;var Positives:TIntegerDynArray);
    class function World_P2P_Dist(const P1, P2: TWorldPoint): double; //点到点
    class function World_P2P_Dist_Fast(const P1, P2: TWorldPoint): double; //点到点
    class function World_P2BL_Dist(const APoint,P1,P2:TWorldPoint):Double;//点到直线
    class function World_P2L_Dist(const APoint,P1,P2:TWorldPoint):Double;//点到线段
    class function SharpAngleVetical(SharpPoint,StartPoint,EndPoint:TWorldPoint;var VerticalPoint:TWorldPoint):Boolean;
    class function World_PolyLine_Girth(const AWorldPoints: TWorldPointAry;
      Start, Length: integer): double; //
    class function World_Polygon_Girth(const AWorldPoints: TWorldPointAry;
      Start, Length: integer): double;//
    class function World_Polygon_Area(const AWorldPoints: TWorldPointAry;
      Start, Length: integer): double;//
    class function MetaIgnore_Rect(const AWorldRect:TWorldRect;const ARect:TRect):Integer;overload;
    class function MetaIgnore_Rect(const AEarthRect:TEarthRect;const ARect:TRect):Integer;overload;
    class function MetaIgnore_Pixels(const AWorldRect:TWorldRect;Pixels:Integer):Integer;overload;
    class function MetaIgnore_Rect(const AEarthRect:TEarthRect;Pixels:Integer):Integer;overload;
    class function GetMetaAnchor(Meta:PMetaStruct;var Rotation:Single;StaticStart:integer):TWorldPoint;overload;
//    class function GetMetaAnchor(Meta:TWorldMeta):TWorldPoint;overload;

    class function CorrectDegree(degree:integer):integer;
    class function GetLineDegree(StartPoint,EndPoint:TPoint):integer;
    class function GenerateDotsInMeta(Meta: TMetaStruct;DotNum: integer;
      var RstPoints: TWorldPointAry;StaticStart:integer): boolean;
    class function HorizontalLineCrossPolygon(Y0:integer;points:TWorldPointAry;
      var RstPoints:TIntersectAry):boolean;
    class function HorizontalLineCrossPolypolygon(Y0: integer;
      points: TWorldPointAry; subpoly: TIntegerDynArray;
      var RstPoints: TIntersectAry): boolean;
    class function GetMetaDynAnchor(Meta: PMetaStruct;World: TWorldRect;StaticStart:integer): TWorldPoint;overload;
//    class function GetMetaDynAnchor(Meta: TWorldMeta;World: TWorldRect): TWorldPoint;overload;


    class function IntersectRect(Rect1, Rect2:TWorldRect;var RstRect:TWorldRect):boolean;
    class procedure ClearDuplicatePoints(var Points: TWorldPointAry);
    class procedure QuickSortPoints(var A: TWorldPointAry; iLo, iHi: Integer);
    class function GetTextEarthOutbox(Text:TEarthText):TEarthRect;overload;
//    class function GetTextEarthOutbox(Text: TTextStruct): TEarthRect; overload;
    class function GetTextWorldOutBox(SP,EP:TWorldPoint;Angle:double):TWorldRect;
    class function RectAcross(Rect1,Rect2:TRect): Boolean; overload;

  end;
  TWorldPolyRegionCalc=class
  private
    FCount:Integer;
    FSubPosition:TIntegerDynArray;
    FSubWorldOutBoxs:TWorldRectAry;
    FWorldPoints:TWorldPointAry;
    FSubPositives:TIntegerDynArray;
    FPolygons:TPolygons;
    FPointNumber:Integer;
    FIsSelfAcross: Boolean;
    FSelfAcrossPoint: TWorldPoint;
    procedure SetIsSelfAcross(const Value: Boolean);
    procedure SetSelfAcrossPoint(const Value: TWorldPoint);
  protected
    procedure ReBuildPolygon;
  public
    constructor Create();
    procedure LoadFromStream(const PolyRegion:TPolyRegionStruct;StaticStart:integer);
    procedure RebuildTopoLogical;
    function GetArea(AreaUnit:TAreaUnit):Double;
    property Count:Integer read Fcount;
    property SubPosition:TIntegerDynArray read FSubPosition;
    property SubWorldOutBoxs:TWorldRectAry read FSubWorldOutBoxs;
    property WorldPoints:TWorldPointAry read FWorldPoints;
    property SubPositives:TIntegerDynArray read FSubPositives;
    property PointNumber:Integer read FPointNumber;
    property Polygons:TPolygons read FPolygons;
    property IsSelfAcross:Boolean read FIsSelfAcross write SetIsSelfAcross;
    property SelfAcrossPoint:TWorldPoint  read FSelfAcrossPoint write SetSelfAcrossPoint;
  end;

{  TPolyHandle=class
  private
    Ftype: TMetaType;
    FDeletedPolyPoints:TEarthPointAry;
    FDeletedPolyIndex:integer;
    function GetAllPointsCount: integer;
  protected
    OSubPolys:TIntegerDynArray;
    OPoints:array of TEarthPointAry;
    function PointsIndexToSubPointsIndex(PointIndex: integer;
      var SubPolyIndex,SubPointIndex:integer): boolean;
  public
//    class procedure GetPolygons(var APolygons:TPolygons;APMetaFlex:PWorldMeta;   APMetaFix:PEarthMeta);
    constructor Create(PMetaFix:PEarthMeta);
    destructor Destroy;override;
    procedure RemovePoly(PolyIndex:integer);
    procedure InsertPoly(APolyIndex:integer;APoints:TEarthPointAry);
    function RemovePoint(PolyIndex,SubPointIndex:integer):boolean;
    procedure ModifyPoint(PolyIndex,SubPointIndex:integer;
      NewPos:TEarthPoint);
    procedure AddPoint(polyIndex,SubPointIndex:integer;Point:TEarthPoint);
    procedure ReBuildMeta(PMetaFix:PEarthMeta;
      AMemFileAddr:PByte;AMemFileSize:LongInt);
    function GetPrePoint(const SubPolyIndex,SubPointIndex:integer):TEarthPoint;
    function GetNextPoint(const SubPolyIndex,SubPointIndex:integer):TEarthPoint;
    function GetSubPolyPointsCount(SubPolyIndex:integer):integer;
    function GetPoint(PointIndex:integer):TEarthPoint; overload;
    function GetPoint(PolyIndex,SubPointIndex:integer):TEarthPoint; overload;
    property AllPointsCount:integer read GetAllPointsCount;
    property SubPolys:TIntegerDynArray read OSubPolys;
    property GType:TMetaType read FType;
    property DeletedPolyIndex:integer read FDeletedPolyIndex;
    property DeletedPolyPoints:TEarthPointAry read FDeletedPolyPoints;
  end;      }

{  TPolyEditHandle=class(TPolyHandle)
  private
    FNextPoint: TEarthPoint;
    FProPoint: TEarthPoint;
    FSubIndex: Integer;
    FSubPointIndex: Integer;
    procedure SetNextPoint(const Value: TEarthPoint);
    procedure SetPrePoint(const Value: TEarthPoint);
    procedure SetPointIndex(const Value: Integer);
    procedure SetSubIndex(const Value: Integer);
    procedure SetSubPointIndex(const Value: Integer);
  public
    constructor Create;
    procedure ReCreate(PMetaFix: PEarthMeta);virtual;
    property PrePoint:TEarthPoint read FProPoint Write SetPrePoint;
    property NextPoint:TEarthPoint read FNextPoint Write SetNextPoint;
    property SubIndex:Integer read FSubIndex Write SetSubIndex;
    property SubPointIndex:Integer read FSubPointIndex Write SetSubPointIndex;
  end;
                }
implementation
uses
  ClipCalc,
  Staticproc;

class function GeometryCalc.GenerateDotsInMeta(Meta:TMetaStruct;DotNum:integer;var RstPoints:TWorldPointAry;StaticStart:integer):boolean;
var
  i:integer; // ,j
  metaOutBoxArea,metaArea:double;
  scanLineNum:integer;
  scanLineSpace:integer; //扫描线间距
  metaWidth,metaHeight:integer;
  points:TWorldPointAry;
  hasValidIntersect:boolean;
  interSects,AllinterSects:TIntersectAry;
  LineLen:int64;
  subpoly:TIntegerDynArray;
  //以下变量分配点时使用
  Dots,DotCount:integer;
  Xpos:integer;
  //
  Polygons: TWorldPolyRegionCalc;
procedure DoExit;
begin
  Result:=false;
  DotNum:=0;
  Exit;
end;
begin
  LineLen:=0;//dxf 2006-09-28
  if DotNum<=0 then
     DoExit;
  if Meta._type<>_polyRegion then //不是面对象就退出
    DoExit;
  //获得图元的面积
  Polygons := TWorldPolyRegionCalc.Create;
  Polygons.LoadFromStream(Meta.PolyRegion,StaticStart);
  metaOutBoxArea:=GetOutBoxArea(Meta);
  metaArea:=Polygons.GetArea(AUDM2);
  metaWidth :=Meta.Outbox.XMax-Meta.Outbox.Xmin;
  metaHeight:=Meta.Outbox.Ymax-Meta.Outbox.Ymin;
  //求出扫描线的条数--即扫描频率
  if (metaArea<ToZero) or (metaHeight=0) then
    DoExit;//面积＝0或者高度＝0 就失败返回


  SetLength(points,(Meta.PolyRegion.SPWAddress-Meta.PolyRegion.PWAddress) div SizeOf(TWorldPoint));
  Copymemory(@points[0],pointer(Meta.PolyRegion.PWAddress),
    Meta.PolyRegion.SPWAddress-Meta.PolyRegion.PWAddress);

  SetLength(subpoly,Meta.PolyRegion.Count);
  Copymemory(@subpoly[0],Pointer(Meta.PolyRegion.SPWAddress),
    Meta.PolyRegion.Count*SizeOf(Integer));

  hasValidIntersect:=false;
  scanLineNum:=Round(sqrt(DotNum*metaOutBoxArea/metaArea*metaWidth/metaHeight));
  scanLineSpace:=Round(metaHeight/(scanLineNum+1));
  while not hasValidIntersect and (scanLineSpace>2) do    //如果没有有有效的交线
  begin
    for i:=0 to scanLineNum-1 do
    begin
      if HorizontalLineCrossPolypolygon(Meta.Outbox.Ymin+scanLineSpace*i,points,subpoly,interSects) then
      begin
        SetLength(AllinterSects,Length(AllinterSects)+Length(interSects));
        Move(interSects[0],AllinterSects[Length(AllinterSects)-Length(interSects)],
          Length(interSects)*SizeOf(TIntersect));
      end;
    end;
    LineLen:=0;
    for i:=0 To high(AllinterSects)do
      LineLen:=LineLen+AllinterSects[i].Length;
    if LineLen>0 then
      hasValidIntersect:=True;
    scanLineSpace:=scanLineSpace div 2;
  end;


  if hasValidIntersect then
  begin
    SetLength(RstPoints,DotNum);
    LineLen:=LineLen div (DotNum+1);
    if lineLen=0 then LineLen:=1;
    DotCount:=0;
    for i:=0 To high(AllinterSects) do
    begin
      Dots:=0;
      Xpos:=AllinterSects[i].PIn.x;
      repeat
        Xpos:=Xpos+LineLen;
        if Xpos<AllinterSects[i].POut.x then
        begin
          inc(Dots);
          inc(DotCount);
          if DotCount>DotNum then
            DotCount:=DotNum;
          RstPoints[DotCount-1].x:=Xpos;
          RstPoints[DotCount-1].y:=AllinterSects[i].PIn.y;
        end;
      until Xpos>=AllinterSects[i].POut.x;
      if i<high(AllinterSects) then
         AllinterSects[i+1].PIn.x:=
         AllinterSects[i+1].PIn.x-(Xpos-AllinterSects[i].POut.x);
      if Dots=0 then
      begin
//        inc(Dots); //dxf del 2007-2-6 因这个代码是多余的.
        inc(DotCount);
        if DotCount>DotNum then
          DotCount:=DotNum;
        RstPoints[DotCount-1].x:=(AllinterSects[i].POut.x+
          AllinterSects[i].PIn.x) div 2;
        RstPoints[DotCount-1].y:=AllinterSects[i].PIn.y;
      end;
    end;
    if DotCount<DotNum then
       SetLength(RstPoints,DotCount);
    Result:=True;
  end
  else Result:=False;
end;

class function GeometryCalc.HorizontalLineCrossPolypolygon(Y0:integer;points:TWorldPointAry;SubPoly:TIntegerDynArray;var RstPoints:TIntersectAry):boolean;
var
  start,len:integer;
  j,i,k:integer;
  bPoint,ePoint:TWorldPoint;//线段的起点终点
  interSect:TWorldPoint;
  interSects:TWorldPointAry;
  Count:integer;
  hasHorizontalLine:boolean;

  subInterSectCount:integer;  //子多边形和扫描线的交点个数
  lastSide:integer;
  firstSide:integer;
  CurrentSide:integer;
procedure AddInterSection;
begin
  inc(Count);
  if Count>=length(interSects) then SetLength(interSects,Count+10);
  interSects[Count-1]:=InterSect;
end;

begin
  SetLength(interSects,10);
  Count:=0;
  start:=0;
  lastSide:=0;
  for j:=0 To High(SubPoly) do
  begin
    len:=SubPoly[j];
    subInterSectCount:=0;
    hasHorizontalLine:=False;
    for i:=start to start+len-2 do
    begin
      bPoint:=points[i];
      ePoint:=points[i+1];

      if (bPoint.y-ePoint.y)=0 then //水平线就忽略，
      begin
        if (bPoint.y=Y0) and (not hasHorizontalLine) and (i>start) then
        begin
          hasHorizontalLine:=True;
          lastSide:=GisMath.Sign(points[i-1].y-Y0);
        end;
        continue;
      end;

      if (bPoint.y=Y0) then  //顶点相交
      begin
        if (not hasHorizontalLine) and (i>start) then
           lastSide:=GisMath.Sign(points[i-1].y-y0)+GisMath.Sign(bPoint.y-y0);
        if (GisMath.Sign(bPoint.y-y0)+GisMath.Sign(ePoint.y-y0)=lastSide) then
        begin //同向忽略
          if subInterSectCount>0 then dec(Count);   //subInterSectCount>0===Count>0
        end else begin end;
        hasHorizontalLine:=False;
        continue;
      end else
      if (ePoint.y=Y0) then  //顶点相交
      begin
        interSect.y:=Y0;
        interSect.x:=ePoint.x;
        AddInterSection;
        inc(subInterSectCount);
        //CurrentSide:=GisMath.Sign(bPoint.y-y0);   by dxf 2007-2-6 因为这个代码是多余的.
        continue;
      end;

      if GisMath.Sign(bPoint.y-y0)<>GisMath.Sign(ePoint.y-y0) then //有普通交点
      begin
        interSect.y:=Y0;
        interSect.x:=bPoint.x+Round(1.0*(ePoint.x-bPoint.x)/(ePoint.y-bPoint.y)*(Y0-bPoint.y));
        AddInterSection;
      end;

    end;

    //处理起点和终点
    if (y0=points[start].y) and (subInterSectCount>0)then
    begin
      CurrentSide:=0;
      for k:=start to start+len-1 do
      begin
        CurrentSide:=GisMath.Sign(points[k].y-y0);
        if CurrentSide<>0 then
          break;
      end;
      firstSide:=0;
      for k:=start+len-1 downto start  do
      begin
        firstSide:=GisMath.Sign(points[k].y-y0);
        if firstSide<>0 then
          break;
      end;
      if CurrentSide=firstSide  then
         dec(Count);
    end;
    start:=start+SubPoly[j];
    {if Count mod 2<>0 then  //err detected!
    begin
      dec(Count);
      inc(Count);
    end;}
  end;

  //整理所有的交点如果交点＝0则返回False
  Result:=False;
  if Count>1 then
  begin
    QuickSortPoints(interSects,0,Count-1);
    SetLength(rstPoints,Count div 2);
    for i:=0 to (Count div 2)-1 do
    begin
      rstPoints[i].PIn:=interSects[i*2];
      rstPoints[i].POut:=interSects[i*2+1];
      rstPoints[i].Length:=rstPoints[i].POut.x-rstPoints[i].PIn.x;
    end;
    Result:=True;
  end;
end;

class function GeometryCalc.HorizontalLineCrossPolygon(Y0:integer;points:TWorldPointAry;var RstPoints:TIntersectAry):boolean;
var
  start,len:integer;
  i:integer;
  bPoint,ePoint:TWorldPoint;//线段的起点终点
  interSect:TWorldPoint;
  interSects:TWorldPointAry;
  Count:integer;
begin
  SetLength(interSects,10);
  Count:=0;
  start:=0;
  len:=high(points)+1;
  for i:=start to start+len-2 do
  begin
    bPoint:=points[i];
    ePoint:=points[i+1];
    if (bPoint.y-ePoint.y)=0 then
    begin //水平线
      //interSect.x:=bPoint.x;
      //interSect.y:=Y0;
    end else
    if GisMath.Sign(bPoint.y-y0)<>GisMath.Sign(ePoint.y-y0) then
    begin //有交点
      interSect.y:=Y0;
      interSect.x:=bPoint.x+Round(1.0*(ePoint.x-bPoint.x)/(ePoint.y-bPoint.y)*(Y0-bPoint.y));

      if (Count>0) and (interSect.x=interSects[Count-1].x) then
      begin
        if ((GisMath.Sign(bPoint.y-y0)+GisMath.Sign(ePoint.y-y0))=
           (GisMath.Sign(points[i-1].y-y0)+GisMath.Sign(points[i].y-y0)))
        then //同向 上一个点也取消
          dec(Count);
          //else Nop//异向保留上一个点，当前点忽略
      end else
      begin //AddInterSect;
        inc(Count);
        if Count>=length(interSects) then SetLength(interSects,Count+10);
        interSects[Count-1]:=InterSect;
      end;
    end;

  end;
  //!!起始点的判断
  if (Count>0) and (InterSects[Count-1].x=InterSects[0].x) then
  begin
    bPoint:=points[1];
    ePoint:=points[start+len-2];
    if GisMath.Sign(bPoint.y-Y0)<>GisMath.Sign(ePoint.y-Y0) then //异向
      dec(Count);
  end;
  Result:=False;
  if Count>1 then
  begin
    QuickSortPoints(interSects,0,Count-1);
    SetLength(rstPoints,Count div 2);
    for i:=0 to (Count div 2)-1 do
    begin
      rstPoints[i].PIn:=interSects[i*2];
      rstPoints[i].POut:=interSects[i*2+1];
      rstPoints[i].Length:=rstPoints[i].POut.x-rstPoints[i].PIn.x;
    end;
    Result:=True;
  end;
end;

class function GeometryCalc.GetOutBoxArea(Meta:TMetaStruct):double;
begin
  Result:=(Meta.Outbox.Xmax-Meta.Outbox.Xmin)*1.0*
    (Meta.Outbox.Ymax-Meta.Outbox.Ymin);
end;

class procedure GeometryCalc.QuickSortPoints(var A:TWorldPointAry; iLo, iHi: Integer);
var
  Lo,Hi:integer;
  Mid,T: TWorldPoint;     //
begin
  Lo := iLo;
  Hi := iHi;
  Mid := A[(Lo + Hi) div 2];
  repeat
    while A[Lo].x < Mid.x do Inc(Lo);  //
    while A[Hi].x > Mid.x do Dec(Hi);  //
    if Lo <= Hi then
    begin
      T := A[Lo];
      A[Lo] := A[Hi];
      A[Hi] := T;
      Inc(Lo);
      Dec(Hi);
    end;
  until Lo > Hi;
  if Hi > iLo then QuickSortPoints(A, iLo, Hi);
  if Lo < iHi then QuickSortPoints(A, Lo, iHi);
end;

class procedure GeometryCalc.ClearDuplicatePoints(var Points:TWorldPointAry);
var
  i:integer;
  Count:integer;
  //lastPoint:TWorldPoint;
begin
  if High(Points)<0 then Exit;
  Count:=0;
  for i:=0 To High(Points) do
  begin
    if (Points[i].x<>Points[Count].x) or (Points[i].y<>Points[Count].y) then
    begin
      inc(Count);
      Points[Count]:=Points[i];
    end;
  end;
  if Count<High(Points) then
    SetLength(Points,Count+1);
end;

class function GeometryCalc.RectInRect(SmallRect,BigRect:TWorldRect):Boolean;
begin
  if (SmallRect.Xmin>=BigRect.Xmin) and
     (SmallRect.Xmax<=BigRect.Xmax) and
     (SmallRect.Ymin>=BigRect.Ymin) and
     (SmallRect.Ymax<=BigRect.Ymax) then
     Result:=true
  else Result:=False;
end;

class function GeometryCalc.RectAcross(Rect1,Rect2:TWorldRect):Boolean;
begin
   Result:=not
    ((Rect1.Xmin > Rect2.Xmax ) or
     (Rect1.Xmax <Rect2.Xmin ) or
     (Rect1.Ymin >Rect2.Ymax ) or
     (Rect1.Ymax <Rect2.Ymin )) ;
end;

class function GeometryCalc.MergeRect(ARect1,ARect2:TWorldRect):TWorldRect;
begin
  Result.Xmin:=Min(ARect1.Xmin,ARect2.Xmin);
  Result.Ymin:=Min(ARect1.Ymin,ARect2.Ymin);
  Result.Xmax:=Max(ARect1.Xmax,ARect2.Xmax);
  Result.Ymax:=Max(ARect1.Ymax,ARect2.Ymax);
end;

class function GeometryCalc.MergeEarthRect(ARect1,ARect2:TEarthRect):TEarthRect;
begin
  Result.Left:=Min(ARect1.Left,ARect2.Left);
  Result.Top:=Max(ARect1.Top,ARect2.Top);
  Result.Bottom:=Min(ARect1.Bottom,ARect2.Bottom);
  Result.Right:=Max(ARect1.Right,ARect2.Right);
end;

class function GeometryCalc.MergeEarthRect(ARect1:TEarthRect;APoint:TEarthPoint):TEarthRect;
begin
  Result.Left:=Min(ARect1.Left,APoint.Longitude);
  Result.Top:=Max(ARect1.Top,APoint.Latitude);
  Result.Bottom:=Min(ARect1.Bottom,APoint.Latitude);
  Result.Right:=Max(ARect1.Right,APoint.Longitude);
end;

class function GeometryCalc.GetCentrePoint(const AWorldRect:TWorldRect):TWorldPoint;
begin
  Result.x:=(AWorldRect.Left+AWorldRect.Right) div 2;
  Result.y:=(AWorldRect.Top+AWorldRect.Bottom) div 2;
end;

class function GeometryCalc.ReturnOutboxFromLine(AStartPoint,
        AEndPoint:TPoint): TRect;
begin
  if AStartPoint.x < AEndPoint.x then
  begin
    Result.Left:=AStartPoint.x;
    Result.Right:=AEndPoint.x;
  end
  else
  begin
    Result.Left:=AEndPoint.x;
    Result.Right:=AStartPoint.x;
  end;
  if AStartPoint.y < AEndPoint.y then
  begin
    Result.Top:=AStartPoint.y;
    Result.Bottom:=AEndPoint.y;
  end
  else
  begin
    Result.Top:=AEndPoint.y;
    Result.Bottom:=AStartPoint.y;
  end;
end;

class function GeometryCalc.WorldRectFromLine(AStartPoint,
        AEndPoint:TWorldPoint): TWorldRect;
begin
  Result.Xmin :=Min(AStartPoint.x,AEndPoint.x);
  Result.Xmax :=Max(AStartPoint.x,AEndPoint.x);
  Result.Ymin :=Min(AStartPoint.Y,AEndPoint.Y);
  Result.Ymax :=Max(AStartPoint.Y,AEndPoint.Y);

end;


class function GeometryCalc.World_P2P_Dist(const P1, P2: TWorldPoint): double; //点到点
var
  xx,yy:Double;
begin
  xx:=P2.x - P1.x;
  yy:=P2.y - P1.y;
  Result := Sqrt(xx*xx+yy*yy);
end;

class function GeometryCalc.World_P2BL_Dist(const APoint,P1,P2:TWorldPoint):Double;//点到直线
var
  aa, bb, cc: double;//三角形边长
  aa2,bb2,cc2,all:Double; //
begin
  bb := World_P2P_Dist(APoint,P1);
  cc := World_P2P_Dist(APoint,P2);
  aa := World_P2P_Dist(P1,P2);
  aa2:=aa*aa;
  bb2:=bb*bb;
  cc2:=cc*cc;
  if aa>ToZero then  // 计算点到直线距离
  begin
    all:=(aa2+bb2-cc2)/2/aa;
    Result:=sqrt(abs(bb2-all*all));
  end
  else
    Result := Abs(APoint.x - P1.y);

end;

class function GeometryCalc.World_P2L_Dist(const APoint,P1,P2:TWorldPoint):Double;//点到线段
var
  SinHalfAngle: double;//sin(A/2)
  aa, bb, cc,ss: double;//三角形边长,半周长
begin

  bb := World_P2P_Dist(APoint,P1);
  cc := World_P2P_Dist(APoint,P2);
  aa := World_P2P_Dist(P1,P2);
  ss := (aa + bb + cc) / 2;
  if aa<0.1 then  //如果线段过短,认为线段就是一个点
    Result:= World_P2P_Dist(P1,APoint)
  else
  if (bb > ToZero) and (cc > ToZero) then
  begin
    if bb > cc then
    begin
      SinHalfAngle := sqrt((ss - cc) * (ss - aa) / (aa * cc));

      if SinHalfAngle > 0.5 then
        Result := CC
      else
        Result := World_P2BL_Dist(APoint, P1,P2);
    end
    else
    begin
      SinHalfAngle := sqrt((ss - bb) * (ss - aa) / (aa * bb));
      if SinHalfAngle > 0.5 then
        Result := bb
      else
        Result := World_P2BL_Dist(APoint,P1,P2);
    end;
  end
  else
    Result := 0;
end;

class function GeometryCalc.World_PolyLine_Girth(const AWorldPoints: TWorldPointAry;
  Start, Length: integer): double;
var
  i: integer;
begin
  Result:=0;
  for i := 0 to Length - 2 do
  begin
    Result := Result + World_P2P_Dist(AWorldPoints[Start + i],
      AWorldPoints[Start + i + 1]);
  end;
  Result := Result + World_P2P_Dist(AWorldPoints[Start + Length - 1],
    AWorldPoints[Start]);
end;

class function GeometryCalc.World_Polygon_Girth(const AWorldPoints: TWorldPointAry;
  Start, Length: integer): double;//多边形周长
var
  i: integer;
begin
  Result:=0;
  for i := 0 to Length - 2 do
  begin
    Result := Result + World_P2P_Dist(AWorldPoints[Start + i],
      AWorldPoints[Start + i + 1]);
  end;
  Result := Result + World_P2P_Dist(AWorldPoints[Start + Length - 2],
    AWorldPoints[Start + Length - 1]);
end;

class function GeometryCalc.World_Polygon_Area(const AWorldPoints: TWorldPointAry;
  Start, Length: integer): double;//多边形面积
var
  i: integer;
  sum:Double;
begin
  sum:=0;
  for i:=0 to Length-2 do
  begin
    sum:=sum+1.0*AWorldPoints[i+start].X   * AWorldPoints[i+start+1].Y -
      1.0*AWorldPoints[i+start+1].X * AWorldPoints[i+start].Y
  end;
  Result:=abs(0.5*sum);
end;

class function GeometryCalc.MetaIgnore_Rect(const AWorldRect:TWorldRect;const ARect:TRect):Integer;
var sx,sy:Double;
begin
  sx:=(AWorldRect.Xmax*1.0 - AWorldRect.Xmin*1.0)/(ARect.Right -ARect.Left ) ;
  sy:=(AWorldRect.Ymax*1.0 - AWorldRect.Ymin*1.0)/(ARect.Bottom -ARect.Top ) ;
  if sy>sx then
  begin
    Result:=trunc(sy);
  end
  else
  begin
    Result:=trunc(sx);
  end;

end;

class function GeometryCalc.MetaIgnore_Pixels(const AWorldRect:TWorldRect;Pixels:Integer):Integer;
var ARect:TRect;
begin
  ARect:=Rect(0,0,Pixels,Pixels);
  Result:=MetaIgnore_Rect(AWorldRect,ARect);
end;

class function GeometryCalc.crossLine(PointWanted,Point1,Point2:TPoint):boolean; //pointwanted的右向延长线是否与线段有交点
var
    p1,p2:tpoint; //temppoint,
    TempResult:Double;
    DeltaY:Integer;
begin
    Result:=False;
    //coordinate system transform
//    tempresult:=0;
    p1.x:=point1.x-pointwanted.x ;
    p1.y:=point1.y-pointwanted.y ;
    p2.x:=point2.x-pointwanted.x ;
    p2.y:=point2.y-pointwanted.y ;

  if (p1.y =0) or (p2.Y=0) then
    Exit//与端点平行不算在内
  else
    if (((p1.y>0) and (p2.y>0)) or ((p1.y<0) and (p2.y<0))) then  //如果不与Y轴相交
        result:=false
    else
        if ((p1.x<0) and (p2.x<0)) then  //线段在X轴左边
            result:=false
        else
            if ((p1.x>0) and (p2.x>0)) then //线段在X轴右边
                result:=true
            else
                begin
                  DeltaY:=(p2.y-p1.y);
                  TempResult:=p2.y/DeltaY*p1.x-p2.x/DeltaY*p1.y;
                  if TempResult>=0 then
                    Result:=True
                  else
                    Result:=False;
                end;

end;

class function GeometryCalc.RectAcrossLine(AWorldRect:TWorldRect;StartPoint,EndPoint:TPoint):Boolean;
begin
  Result:=False;
  if PointInRect(StartPoint,AWorldRect) or PointInRect(EndPoint,AWorldRect)
  or IsLineAcross(StartPoint,EndPoint,AWorldRect.TopLeft,Point(AWorldRect.Right,AWorldRect.Top))
  or IsLineAcross(StartPoint,EndPoint,AWorldRect.BottomRight,Point(AWorldRect.Right,AWorldRect.Top))
  or IsLineAcross(StartPoint,EndPoint,AWorldRect.BottomRight ,Point(AWorldRect.Left,AWorldRect.Bottom))
  or IsLineAcross(StartPoint,EndPoint,AWorldRect.TopLeft ,Point(AWorldRect.left,AWorldRect.Bottom)) then
    Result:=True;
end;

class function GeometryCalc.PointInRect(APoint:TWorldPoint;ARect:TWorldRect):Boolean;
begin
  if (APoint.x<=Arect.Xmax) and (APoint.x>=Arect.Xmin) and
     (APoint.y<=Arect.Ymax) and (APoint.y>=Arect.Ymin) then
     Result:=True
  else
    Result:=False;
end;

class function GeometryCalc.PointInRect(APoint:TPoint;ARect:TRect):Boolean;
begin
  if (APoint.x<=Arect.Right) and (APoint.x>=Arect.Left) and
     (APoint.y<=Arect.Bottom) and (APoint.y>=Arect.Top) then
     Result:=True
  else Result:=False;
end;

class function GeometryCalc.IsLineAcross(StartPoint1,EndPoint1,StartPoint2,EndPoint2:TWorldPoint):boolean;
var
  I1,I2,AA, BB, CC: double;//Ax+By+C=0
  Result1,Result2:Boolean;//两次计算的结果保留值
  DoubleOne:double;
  WR1,WR2:TWorldRect;
begin
  Result:=False;
  WR1:=WorldRectFromLine(StartPoint1,EndPoint1);
  WR2:=WorldRectFromLine(StartPoint2,EndPoint2);
  if rectacross(WR1,WR2) then
  begin
    //先计算第一条线段和第二条线段两点间的关系
    doubleOne:=1;    //变为浮点
    AA := StartPoint1.y - EndPoint1.y;
    BB := EndPoint1.x - StartPoint1.x;
    CC := doubleOne*StartPoint1.x * EndPoint1.y - doubleOne*EndPoint1.x * StartPoint1.y;
    I1:=AA*StartPoint2.x+BB*StartPoint2.y+CC;
    I2:=AA*EndPoint2.x+BB*EndPoint2.y+CC;
    if ((I1<=0) and (I2>=0)) or ((I1>=0) and (I2<=0)) then
      Result1:=True
    else
      Result1:=False;

    //计算第二条线段和第一条线段两点间的关系
    AA := StartPoint2.y - EndPoint2.y;
    BB := EndPoint2.x - StartPoint2.x;
    CC := doubleOne*StartPoint2.x * EndPoint2.y - doubleOne*EndPoint2.x * StartPoint2.y;
    I1:=AA*StartPoint1.x+BB*StartPoint1.y+CC;
    I2:=AA*EndPoint1.x+BB*EndPoint1.y+CC;
    if ((I1<=0) and (I2>=0)) or ((I1>=0) and (I2<=0)) then
      Result2:=True
    else
      Result2:=False;
    Result:=Result1 and Result2;
  end;
end;

class function GeometryCalc.PointAcrossPolygon(APoint:TWorldPoint;APolygon:TWorldPointAry;Start,Length:Integer):Integer;
var
  i:Integer;
  WorldOutBox:TWorldRect;
begin
  Result:=0;
  //求出外包矩形
  WorldOutBox.Xmin:=MaxInt;
  WorldOutBox.Ymin:=MaxInt;
  WorldOutBox.Xmax:=-MaxInt;
  WorldOutBox.Ymax:=-MaxInt;
  for i:=Start to Start+Length-1 do
  begin
    WorldOutBox.Xmin:=min(WorldOutBox.Xmin,APolygon[i].x);
    WorldOutBox.Ymin:=min(WorldOutBox.Ymin,APolygon[i].y);
    WorldOutBox.Xmax:=max(WorldOutBox.Xmax,APolygon[i].x);
    WorldOutBox.Ymax:=max(WorldOutBox.Ymax,APolygon[i].y);
  end;
  if Pointinrect(APoint,WorldOutBox) then  //如果在外包矩形内
  begin
      for i:=Start to Start+Length-2 do
      begin
        //顶点判定
        //--当判点与顶点的y相等时，判点的y在该顶点的前后点的y值中间,认为穿过了顶点--sha 注2005-7-28
        if apoint.y=APolygon[i].y then
        begin
          if i=start then //起点
          begin
            {if (apoint.x<APolygon[i].x) and  //如果目标点在顶点的左边
              (((apoint.y>=APolygon[i+1].y) and (apoint.y<=APolygon[Start+Length-2].y)) or
              ((apoint.y<=APolygon[i+1].y) and (apoint.y>=APolygon[Start+Length-2].y))) then
                Result:=Result+1;  }
            //2005-7-28 sha. 改如下：Start+Length-2 ==> Start+Length-1
            if (apoint.x<APolygon[i].x) and  //如果目标点在顶点的左边
              (((apoint.y>=APolygon[i+1].y) and (apoint.y<=APolygon[Start+Length-1].y)) or
              ((apoint.y<=APolygon[i+1].y) and (apoint.y>=APolygon[Start+Length-1].y))) then
                Result:=Result+1;
          end
          else
          begin
            if (apoint.x<APolygon[i].x) and
              (((apoint.y>=APolygon[i+1].y) and (apoint.y<=APolygon[i-1].y)) or
              ((apoint.y<=APolygon[i+1].y) and (apoint.y>=APolygon[i-1].y))) then
                Result:=Result+1;
          end;
        end
        else
        begin
          //线段判定
          //------------- add by sha 如果是起点，则还需判断 是否穿过了 起点与最后一点 间的线段
          if i=start then //起点
          begin
            if crossLine(APoint,APolygon[i],APolygon[Start+Length-1]) then
              Result:=Result+1;
          end;
          //============= sha at 2005-7-28.
          if crossLine(APoint,APolygon[i],APolygon[i+1]) then
            Result:=Result+1;
        end;
      end;
  end;
end;

class function GeometryCalc.PointToPolyLine(APoint:TPoint;LineNum:Integer;SubLines:TIntegerDynArray;
  SubPoints:TWorldPointAry):Double;
var i,j,p:Integer;
    P1,P2:TWorldPoint;
begin
  Result:=World_P2P_Dist(APoint,SubPoints[0]);
  p:=0;
  for i:=0 to LineNum-1 do
  begin
    for j:=0 to SubLines[i]-2 do
    begin
      p1:=SubPoints[p];
      p2:=SubPoints[p+1];
      Result:=Min(World_P2L_Dist(APoint,P1,P2),Result);
      p:=p+1;
    end;
    p:=p+1;
  end;
end;

class function GeometryCalc.PointInPolyRegion(APoint:TPoint;RegionNum:Integer;SubPoints:TIntegerDynArray;
  AWorldPoints:TWorldPointAry):Boolean;
var i:Integer;//,p
    CrossNum:Integer;
    PointNum:Integer;
begin
  CrossNum:=0;
  PointNum:=0;
  for i:=0 to RegionNum-1 do
  begin
    CrossNum:=CrossNum+PointAcrossPolygon(APoint,AWorldPoints,PointNum,SubPoints[i]);
    PointNum:=PointNum+ SubPoints[i];
  end;
  Result:=odd(CrossNum);
end;

{ TWorldPolyRegionCalc }

constructor TWorldPolyRegionCalc.Create;
begin
  FCount:=0;
  SetLength(fsubposition,0);
  SetLength(fsubpositives,0);
  SetLength(FSubWorldOutBoxs,0);
  SetLength(FWorldPoints,0);

end;

function TWorldPolyRegionCalc.GetArea(AreaUnit:TAreaUnit):Double;
var
  i:Integer;
begin
  Result:=0;
  if FCount>0 then
  begin
    for i:=0 to FCount-1 do
    begin
      if FSubPositives[i]=0 then
        Result:=Result+GeometryCalc.World_Polygon_Area(FPolygons[i],0,High(FPolygons[i])+1)
      else
        Result:=Result+GeometryCalc.World_Polygon_Area(FPolygons[i],0,High(FPolygons[i])+1);

    end;
    case AreaUnit of
    auM2:Result:=Result/100;
    auKM2:Result:=Result/100/1000/1000;
    aumm2:Result:=Result*100*100;
    end;
  end
  else
    Result:=0;
end;

procedure TWorldPolyRegionCalc.LoadFromStream(const PolyRegion: TPolyRegionStruct;StaticStart:integer);
var i,POffset:Integer;

begin
  //读取多边形数量
  FCount:=PolyRegion.Count;
  //读取子多边形的点数量
  SetLength(FSubPosition,FCount);

  //WorldStream.Position:=PolyRegion.SubPosFlex;
  //.read(FSubPosition[0],SizeOf(FSubPosition[0])*FCount);
  copymemory(@FSubPosition[0],Pointer(PolyRegion.SPWAddress+StaticStart),SizeOf(FSubPosition[0])*FCount);
  //读取整体点数组
  FPointNumber:=SumInt(FSubPosition);
  SetLength(FWorldPoints,FPointNumber);
//  WorldStream.Position:=PolyRegion.PosFlex;
//  WorldStream.Read(FWorldPoints[0],SizeOf(FWorldPoints[0])*FPointNumber);
  copymemory(@FWorldPoints[0],Pointer(PolyRegion.PWAddress+StaticStart),SizeOf(FWorldPoints[0])*FPointNumber);

  //读取外包矩形数组
  SetLength(FSubWorldOutBoxs,FCount);
  //WorldStream.Position:=PolyRegion.SubWorldOubboxs2st;
  //WorldStream.read(FSubWorldOutBoxs[0],SizeOf(FSubWorldOutBoxs[0])*FCount);
  //@@copymemory(@SubWorldOutBoxs[0],Pointer(PolyRegion.SWOutboxAddress),SizeOf(SubWorldOutBoxs[0])*FCount);

  //读取正负号数组
  SetLength(FSubPositives,FCount);
  //WorldStream.Position:=PolyRegion.SubPositives2st;
  //WorldStream.read(FSubPositives[0],SizeOf(FSubPositives[0])*FCount);
  //@@copymemory(@FSubPositives[0],Pointer(PolyRegion.SPositives),SizeOf(FSubPositives[0])*FCount);

  //读取子多边形数组
  SetLength(FPolygons,PolyRegion.Count);
//  WorldStream.Position:=PolyRegion.PosFlex;

  POffset:= PolyRegion.PWAddress+StaticStart;
  for i:=0 to Count-1 do
  begin
    SetLength(FPolygons[i],FSubPosition[i]);
    copymemory(@FPolygons[i][0],Pointer(POffset),SizeOf(FPolygons[i][0])*FSubPosition[i]);
    POffset:=Poffset+ SizeOf(FPolygons[i][0])*FSubPosition[i];
  end;

end;

procedure TWorldPolyRegionCalc.ReBuildPolygon;
begin

end;

procedure TWorldPolyRegionCalc.RebuildTopoLogical;
var i:Integer;
  CrossPoint:TWorldPoint;
begin
//检测是否自交
  SetIsSelfAcross(false);
  for i:=0 to FCount-1 do
  begin
    if GeometryCalc.SelfAcross(fpolygons[i],CrossPoint) then
    begin
      SetSelfAcrossPoint(crosspoint);
      SetIsSelfAcross(True);
      Exit;
    end;
  end;
end;

procedure TWorldPolyRegionCalc.SetIsSelfAcross(const Value: Boolean);
begin
  FIsSelfAcross := Value;
end;

procedure TWorldPolyRegionCalc.SetSelfAcrossPoint(const Value: TWorldPoint);
begin
  FSelfAcrossPoint := Value;
end;

class function GeometryCalc.GetMetaDynAnchor(Meta: PMetaStruct;World:TWorldRect;StaticStart:integer): TWorldPoint;
var
  len:integer;
  points:TWorldPointAry;
  interSects:TIntersectAry;
  subpoly:TIntegerDynArray;
  Y0:integer;
  icount:integer;
begin
   Y0:=(World.Ymax+World.Ymin) div 2;
   case Meta._type of
     _Polyline:
       with Meta.Polyline do
      begin
        len:=(SPWAddress-PWAddress) div SizeOf(TWorldPoint);
        setLength(points,len);
        CopyMemory(@points[0],pointer(PWAddress+StaticStart),len*sizeOf(TWorldPoint));

        SetLength(subpoly,Count);
        Copymemory(@subpoly[0],Pointer(SPWAddress+StaticStart),Count*SizeOf(Integer));

        icount:=Count;
        Result:=points[0];
        if GisClip.ClipPolyPolyLine(
          Rect(World.Left,World.Bottom,World.Right,World.Top)
          ,icount,subpoly,points)then
        begin
          if subpoly[0]>2 then
          begin
            Result.x:=(points[subpoly[0] div 2].x);
            Result.y:=(points[subpoly[0] div 2].y);
          end else
          begin
            Result.x:=(points[0].x+points[1].x) div 2;
            Result.y:=(points[0].y+points[1].y) div 2;
          end;
        end;
      end;
     _PolyRegion:
      with Meta.PolyRegion do
      begin
        len:=(SPWAddress-PWAddress) div SizeOf(TWorldPoint);
        setLength(points,len);
        CopyMemory(@points[0],pointer(PWAddress+StaticStart),len*sizeOf(TWorldPoint));

        SetLength(subpoly,Count);
        Copymemory(@subpoly[0],Pointer(SPWAddress+StaticStart),Count*SizeOf(Integer));

        HorizontalLineCrossPolypolygon(Y0,points,subpoly,interSects);
        if Length(interSects)>0 then
        begin
          Result.x:=(interSects[0].PIn.x+interSects[0].POut.x) div 2;
          Result.y:=(interSects[0].PIn.y+interSects[0].POut.y) div 2;
        end;
      end;
    else
      with Meta.Outbox do
      begin
        Result.x:=(Xmin+Xmax) div 2;
        Result.y:=(Ymin+Ymax) div 2;
      end;
    end;
end;

{class function GeometryCalc.GetMetaDynAnchor(Meta: TWorldMeta;World:TWorldRect): TWorldPoint;
var
  len:integer;
  points:TWorldPointAry;
  interSects:TIntersectAry;
  subpoly:TIntegerDynArray;
  Y0:integer;
  icount:integer;
begin
   Y0:=(World.Ymax+World.Ymin) div 2;
   case Meta._type of
     _Polyline:
       with Meta.Polyline do
      begin
        len:=(SPWAddress-PWAddress) div SizeOf(TWorldPoint);
        setLength(points,len);
        CopyMemory(@points[0],pointer(PWAddress),len*sizeOf(TWorldPoint));

        SetLength(subpoly,Count);
        Copymemory(@subpoly[0],Pointer(SPWAddress),Count*SizeOf(Integer));

        icount:=Count;
        Result:=points[0];
        if GisClip.ClipPolyPolyLine(
          Rect(World.Left,World.Bottom,World.Right,World.Top)
          ,icount,subpoly,points)then
        begin
          if subpoly[0]>2 then
          begin
            Result.x:=(points[subpoly[0] div 2].x);
            Result.y:=(points[subpoly[0] div 2].y);
          end else
          begin
            Result.x:=(points[0].x+points[1].x) div 2;
            Result.y:=(points[0].y+points[1].y) div 2;
          end;
        end;
      end;
     _PolyRegion:
      with Meta.PolyRegion do
      begin
        len:=(SPWAddress-PWAddress) div SizeOf(TWorldPoint);
        setLength(points,len);
        CopyMemory(@points[0],pointer(PWAddress),len*sizeOf(TWorldPoint));

        SetLength(subpoly,Count);
        Copymemory(@subpoly[0],Pointer(SPWAddress),Count*SizeOf(Integer));

        HorizontalLineCrossPolypolygon(Y0,points,subpoly,interSects);
        if Length(interSects)>0 then
        begin
          Result.x:=(interSects[0].PIn.x+interSects[0].POut.x) div 2;
          Result.y:=(interSects[0].PIn.y+interSects[0].POut.y) div 2;
        end;
      end;
    else
      with Meta.Outbox do
      begin
        Result.x:=(Xmin+Xmax) div 2;
        Result.y:=(Ymin+Ymax) div 2;
      end;
    end;
end;
      }


class function GeometryCalc.GetMetaAnchor(Meta: PMetaStruct;var Rotation:Single;StaticStart:integer): TWorldPoint;
var
  len,tlen:integer;
  points:TWorldPointAry;
  interSects:TIntersectAry;
  subpoly:TIntegerDynArray;
  Y0:integer;
  b,e:integer;
begin
   Rotation:=0;
   Y0:=(Meta.Outbox.Ymax+Meta.Outbox.Ymin) div 2;
   case Meta._type of
     _Polyline:
       with Meta.Polyline do
      begin
        len:=(SPWAddress-PWAddress) div SizeOf(TWorldPoint);
        setLength(points,len);
        CopyMemory(@points[0],pointer(PWAddress+StaticStart),len*sizeOf(TWorldPoint));

        SetLength(subpoly,Count);
        Copymemory(@subpoly[0],Pointer(SPWAddress+StaticStart),Count*SizeOf(Integer));
        HorizontalLineCrossPolypolygon(Y0,points,subpoly,interSects);

        tlen:=len div 2;
        e:=tlen+1;
        b:=tlen-1;
        if len<=2 then
        begin
           b:=0;
           e:=1;
           if len=1 then
           begin
               b:=0;
               e:=0;
           end;
        end;
        if points[b].Y<points[e].Y then
        begin
            tlen:=e;
            e:=b;
            b:=tlen;
        end;

        if (points[b].x-points[e].x)=0 then
        begin
           Rotation:=90;
        end
        else if (points[b].Y-points[e].Y)=0 then
        begin
           Rotation:=0;
        end
        else
        begin
            Rotation:=RadToDeg(ArcTan(//斜率转角度
                                     (points[b].Y-points[e].Y)/(points[b].x-points[e].x)
                                     ));
        end;
        if Rotation>45 then Rotation:=Rotation-180;
        if Rotation<-180 then Rotation:=Rotation+180;
        
        len:=Length(interSects);
        if len>0 then
        begin
            Result.x:=(interSects[0].PIn.x+interSects[0].POut.x) div 2;
            Result.y:=(interSects[0].PIn.y+interSects[0].POut.y) div 2;
        end;

      end;
     _PolyRegion:
      with Meta.PolyRegion do
      begin
        len:=(SPWAddress-PWAddress) div SizeOf(TWorldPoint);
        setLength(points,len);
        CopyMemory(@points[0],pointer(PWAddress+StaticStart),len*sizeOf(TWorldPoint));

        SetLength(subpoly,Count);
        Copymemory(@subpoly[0],Pointer(SPWAddress+StaticStart),Count*SizeOf(Integer));
        HorizontalLineCrossPolypolygon(Y0,points,subpoly,interSects);
        if Length(interSects)>0 then
        begin
            Result.x:=(interSects[0].PIn.x+interSects[0].POut.x) div 2;
            Result.y:=(interSects[0].PIn.y+interSects[0].POut.y) div 2;
        end;
      end;
     _Line:
      with Meta^.Line do
      begin
          Result.x:=(Meta^.Line.SP.X+Meta^.Line.eP.X)div 2;
          Result.y:=(Meta^.Line.SP.y+Meta^.Line.eP.y)div 2;

        if (Meta^.Line.SP.X-Meta^.Line.eP.X)=0 then
        begin
           Rotation:=90;
        end
        else if (Meta^.Line.SP.y-Meta^.Line.eP.y)=0 then
        begin
           Rotation:=0;
        end
        else
        begin
            if(Meta^.Line.SP.y>Meta^.Line.eP.y)then
            Rotation:=RadToDeg(ArcTan(//斜率转角度
                                     (Meta^.Line.SP.y-Meta^.Line.eP.y)/(Meta^.Line.SP.X-Meta^.Line.eP.X)
                                     ))
            else
            Rotation:=RadToDeg(ArcTan(//斜率转角度
                                     (Meta^.Line.eP.y-Meta^.Line.sP.y)/(Meta^.Line.eP.X-Meta^.Line.sP.X)
                                     ));

        end;
        if Rotation>45 then Rotation:=Rotation-180;
        if Rotation<-180 then Rotation:=Rotation+180;

      end;
    else
      with Meta.Outbox do
      begin
        Result.x:=(Xmin+Xmax) div 2;
        Result.y:=(Ymin+Ymax) div 2;

        //Rotation:=ArcTan2((Meta.Outbox.YMax-Meta.Outbox.YMin),
                         // (Meta.Outbox.Xmax-Meta.Outbox.XMin));
      end;
    end;
end;

{class function GeometryCalc.GetMetaAnchor(Meta: TWorldMeta): TWorldPoint;
var
  len:integer;
  points:TWorldPointAry;
  interSects:TIntersectAry;
  subpoly:TIntegerDynArray;
  Y0:integer;
//  i:integer;
begin
   case Meta._type of
     _Polyline:
       with Meta.Polyline do
      begin
        Y0:=(Meta.Outbox.Ymax+Meta.Outbox.Ymin) div 2;
        len:=(SPWAddress-PWAddress) div SizeOf(TWorldPoint);
        setLength(points,len);
        CopyMemory(@points[0],pointer(PWAddress),len*sizeOf(TWorldPoint));

        SetLength(subpoly,Count);
        Copymemory(@subpoly[0],Pointer(SPWAddress),Count*SizeOf(Integer));
        HorizontalLineCrossPolypolygon(Y0,points,subpoly,interSects);
        if Length(interSects)>0 then
        begin
          Result.x:=(interSects[0].PIn.x+interSects[0].POut.x) div 2;
          Result.y:=(interSects[0].PIn.y+interSects[0].POut.y) div 2;
        end;
      end;
     _PolyRegion:
      with Meta.PolyRegion do
      begin
        len:=(SPWAddress-PWAddress) div SizeOf(TWorldPoint);
        setLength(points,len);
        CopyMemory(@points[0],pointer(PWAddress),len*sizeOf(TWorldPoint));

        SetLength(subpoly,Count);
        Copymemory(@subpoly[0],Pointer(SPWAddress),Count*SizeOf(Integer));
        HorizontalLineCrossPolypolygon(Y0,points,subpoly,interSects);
        if Length(interSects)>0 then
        begin
          Result.x:=(interSects[0].PIn.x+interSects[0].POut.x) div 2;
          Result.y:=(interSects[0].PIn.y+interSects[0].POut.y) div 2;
        end;
      end;
    else
      with Meta.Outbox do
      begin
        Result:=Meta.Anchor;
       // Result.x:=(Xmin+Xmax) div 2;  //del by dxf 2007-2-1
       // Result.y:=(Ymin+Ymax) div 2;
      end;
    end;
end;     }

class function GeometryCalc.CorrectDegree(degree:integer):integer;
begin
  degree:=90-degree;
  if degree<0 then
    degree:=degree+360;
  Result:=degree;
end;

class function GeometryCalc.GetLineDegree(StartPoint,EndPoint:TPoint):integer;
var deltaX,deltaY:integer;
begin
  deltaX:=EndPoint.x-StartPoint.x;
  deltaY:=EndPoint.y-StartPoint.y;

  if deltaY>0 then//1,2象限
  begin
    if abs(deltaX)<=ToZero then
    begin
      Result:=90;
      exit;
    end;
    if deltaX>0 then  //1象限
      Result:=Round(arctan(abs(deltaY/deltaX))*TO_DEGREE)
    else        //2象限
      Result:=180-Round(arctan(abs(deltaY/deltaX))*TO_DEGREE);
  end
  else begin  //3,4象限
    if abs(deltaX)<=ToZero then
    begin
      Result:=270;
      exit;
    end;
    if deltaX>0 then  //4象限
       Result:=360-Round(arctan(abs(deltaY/deltaX))*TO_DEGREE)
    else      //3象限
       Result:=180+Round(arctan(abs(deltaY/deltaX))*TO_DEGREE);
  end;

  if deltaY=0 then
  begin
    if deltaX>=0 then
      Result:=0
    else
      Result:=180;
  end;
end;


class function GeometryCalc.linecrossPoint(p1, p2, p3, p4: TWorldPoint;
  var p: TWorldPoint): integer;
//var

begin
  if islineacross(p1,p2,p3,p4) then
  //求交点
  begin

    result:=1;
  end
  else
  begin
    result:=-1;
  end;


end;


class function GeometryCalc.IntersectRect(Rect1,Rect2:TWorldRect;var RstRect:TWorldRect):boolean;
function RectIsValid(const R: TWorldRect): Boolean;
begin
  with R do
    Result := (Xmin<Xmax) and (Ymin<Ymax);
end;
begin
  with RstRect do
  begin
    Xmin := Max(Rect1.Xmin,Rect2.Xmin);
    Ymin := Max(Rect1.Ymin,Rect2.Ymin);
    Ymax := Min(Rect1.Ymax,Rect2.Ymax);
    Xmax := Min(Rect1.Xmax,Rect2.Xmax);
  end;
  if not RectIsValid(RstRect) then
    Result :=false
  else
    Result :=True;
end;

class function GeometryCalc.PointInRect(APoint:TWorldPoint;ARect:TWorldRect;margeRatio:double):Boolean;
var
  margeX,margeY:integer;
begin
  margeX:=Round((Arect.Xmax-Arect.Xmin)*margeRatio);
  margeY:=Round((Arect.Ymax-Arect.Ymin)*margeRatio);
  if (APoint.x<=Arect.Xmax-margeX) and (APoint.x>=Arect.Xmin+margeX) and
     (APoint.y<=Arect.Ymax-margeY) and (APoint.y>=Arect.Ymin+margeY) then
     Result:=True
  else
    Result:=False;
end;

class function GeometryCalc.SelfAcross(APolygon: TWorldPointAry;var Crosspoint:TWorldPoint): Boolean;
var i,j:Integer;
begin
  Result:=false;
  for i:=0 to High(APolygon)-3 do
  begin
    for j:=i+2 to High(APolygon)-1 do
    begin
      if IsLineacross(apolygon[i],apolygon[i+1],apolygon[j],apolygon[j+1]) then
      begin
        linecrosspoint(apolygon[i],apolygon[i+1],apolygon[j],apolygon[j+1],CrossPoint);
        Result:=True;
        //Exit;
      end;
    end;
  end;
end;

class function GeometryCalc.PointInEllipse(APoint:TWorldPoint;Outbox: TWorldRect): Boolean;
var
  x,y,a,b:double;
  Dis:Double;
begin
//判定依据为椭圆坐标方程 X2/a2+y2/b2 =1
//如果>1说明在椭圆外,如果<1 说明在椭圆内
  x:=APoint.x-(Outbox.Xmin +(Outbox.Xmax-Outbox.Xmin)/2);
  y:=APoint.y-(Outbox.ymin +(Outbox.ymax-Outbox.ymin)/2);
  a:=(Outbox.Xmax-Outbox.Xmin )/2 ;
  b:=(Outbox.Ymax -Outbox.Ymin )/2 ;
  //b可能为0
  if (a=0) or (b=0) then
  begin
    Result:=False;
    Exit;
  end;

  Dis:=1.0*x*x/a/a+1.0*y*y/b/b;
  if Dis>1 then                                    
    Result:=false
  else
    Result:=True;
//另一种解法:
//将坐标系原点平移到椭圆中心,按照椭圆的比例变换坐标系,使椭圆变为正圆,再进行比较
end;

class function GeometryCalc.RectAcrossPolyLine(AWorldRect: TWorldRect;
  LineNum: Integer; SubLines: TIntegerDynArray;
  SubPoints: TWorldPointAry): boolean;
var i,j,p:Integer;
    P1,P2:TWorldPoint;
begin
  Result:=false;
  p:=0 ;
  //检测是否有端点在矩形内
  for i:=0 to LineNum-1 do
  begin
    for j:=0 to SubLines[i]-1 do
    begin
      p1:=SubPoints[p];
      if pointinrect(P1,AWorldRect) then
      begin
        Result:=True;
        Exit; //如果有点在矩形内,立刻返回
      end;
    end;
    p:=p+1;
  end;
  p:=0;
  //检测是否有和矩形有交点
  for i:=0 to LineNum-1 do
  begin
    for j:=0 to SubLines[i]-2 do
    begin
      p1:=SubPoints[p];
      p2:=SubPoints[p+1];
      if rectacrossline(AWorldRect,P1,P2) then
      begin
        Result:=True;
        Exit; //如果有点和矩形相交,立刻返回
      end;
      p:=p+1;
    end;
    p:=p+1;
  end;

end;
class function GeometryCalc.RectAcrossPolyRegion(AWorldRect: TWorldRect;
  RegionNum: Integer; SubPoints: TIntegerDynArray;
  Points: TWorldPointAry): boolean;
var i,j,p:Integer;
    P1,P2:TWorldPoint;
begin
  Result:=false;
  p:=0 ;
  
  //检测是否有端点在矩形内
  for i:=0 to RegionNum-1 do
  begin
    for j:=0 to SubPoints[i]-1 do
    begin
      p1:=Points[p];
      if pointinrect(P1,AWorldRect) then
      begin
        Result:=True;
        Exit; //如果有点在矩形内,立刻返回
      end;
    end;
    p:=p+1;
  end;
  p:=0;
  //检测是否有和矩形有交点
  for i:=0 to RegionNum-1 do
  begin
    for j:=0 to SubPoints[i]-2 do
    begin
      p1:=Points[p];
      p2:=Points[p+1];
      if rectacrossline(AWorldRect,P1,P2) then
      begin
        Result:=True;
        Exit; //如果有点和矩形相交,立刻返回
      end;
      p:=p+1;
    end;
    p:=p+1;
  end;

end;

class function GeometryCalc.PointInRound(APoint, CenterPoint: TWorldPoint;
  Radius: Double): Boolean;
begin
  Result:=(GeometryCalc.World_P2P_Dist(CenterPoint,APoint)<=Radius)
end;

class procedure GeometryCalc.pointPositive(p1,p2:TWorldPoint;worldpoints1,worldpoints2:TWorldPointAry;start1,start2:Integer;le1,le2:Integer;var count1,count2:integer);
//var
 // i:integer;
begin
  if GeometryCalc .PointAcrossPolygon(p1,worldpoints2,start2,le2) mod 2=1 then
    count1:=count1+1
  else
  begin
    if GeometryCalc .PointAcrossPolygon(p2,worldpoints1,start1,le1)mod 2=1 then
      count2:=count2+1;

  end;
end;

class procedure  GeometryCalc.PolyPolygonPositive(count:integer;subpoints:TIntegerDynArray;
 worldpoints:TWorldPointAry;var Positives:TIntegerDynArray);
 var
  cnpoint1,cnpoint2:TWorldPoint;
  i,j,start1,end1,start2,end2:integer; //,tempcount
 begin
//  start1:=0;
  end1:=0;
//  start2:=0;
//  end2:=0;
  for i:=0 to count-2 do
  begin
      start1:=end1;
      end1:=start1+subpoints[i];
      end2:=end1;
      cnpoint1.x:=round(worldpoints[start1].x/2+worldpoints[start1+1].x/2) ;
      cnpoint1.y:=round(worldpoints[start1].y/2+worldpoints[start1+1].y/2) ;

      for j:=i+1 to count-1 do
      begin
          start2:=end2;
          end2:=start2+subpoints[j];
          cnpoint2.x:=round(worldpoints[start2].x/2+worldpoints[start2+1].x/2);
          cnpoint2.y:=round(worldpoints[start2].y/2+worldpoints[start2+1].y/2) ;
          pointpositive(cnpoint1,cnpoint2,worldpoints,worldpoints,start1,start2,subpoints[i],
                       subpoints[j],positives[i],positives[j]);
      end;
  end;
  for i:=0 to count-1 do
    if positives[i] mod 2 =0 then
       positives[i]:=1
    else
       positives[i]:=-1;
end;

class function GeometryCalc.MetaIgnore_Rect(const AEarthRect: TEarthRect;
  const ARect: TRect): Integer;
var
  Dist:integer;
  AWorldRect:TWorldRect;
begin
  Dist:=round(GisMeasure.GetGisDistance(AEarthRect.TopLeft,AEarthRect.BottomRight)*10);
  AWorldRect:=WorldRect(0,0,Dist,Dist);
  Result:=MetaIgnore_Rect(AWorldRect,ARect);
end;

class function GeometryCalc.MetaIgnore_Rect(const AEarthRect: TEarthRect;
  Pixels: Integer): Integer;
var ARect:TRect;
begin
  ARect:=Rect(0,0,Pixels,Pixels);
  Result:=MetaIgnore_Rect(AEarthRect,ARect);

end;
class function GeometryCalc.MergeRect(APoint:TPoint;ARect:TWorldRect):TWorldRect;
begin
  Result.Xmin :=Min(APoint.x,ARect.Xmin);
  Result.Xmax :=Max(APoint.x,ARect.Xmax);
  Result.Ymin :=Min(APoint.Y,ARect.Ymin);
  Result.Ymax :=Max(APoint.Y,ARect.Ymax);
end;

class function GeometryCalc.MergeRect(APoint1, APoint2: TPoint): TWorldRect;
begin
  Result.Xmin:=Min(APoint1.x,APoint2.x);
  Result.Xmax:=Max(APoint1.x,APoint2.x);
  Result.ymin:=Min(APoint1.y,APoint2.y);
  Result.ymax:=Max(APoint1.y,APoint2.y);
end;

class function GeometryCalc.MergeEarthRect(P1, P2: TEarthPoint): TEarthRect;
begin
  Result.left:=Min(P1.Longitude,P2.Longitude);
  Result.right:=Max(P1.Longitude,P2.Longitude);
  Result.bottom:=Min(P1.Latitude,P2.Latitude);
  Result.top:=Max(P1.Latitude,P2.Latitude);
end;

class function GeometryCalc.LineAcrossEllipse(StartPoint, EndPoint:TPoint;
  EllipseRect: TWorldRect): Boolean;
var
  PsRect:TWorldRect;//线段的外包矩形
  FLoatPoint1,FloatPoint2,CenterPoint:TRealPoint;
  FloatRect:TEarthRect;
  K:Double;//椭圆的比例
  A,B:Double;//长半径,短半径
  R:Double;//变换后的圆半径
begin
  Result:=False;
  PsRect:=MergeRect(startpoint,endpoint);
  if rectacross(PsRect,EllipseRect) then
  begin
    Result:=(PointInRect(StartPoint,EllipseRect) or PointInRect(Endpoint,EllipseRect));
    if not Result then
    begin
      //坐标变换
      CenterPoint.X:=EllipseRect.Xmin/2+EllipseRect.Xmax/2;
      CenterPoint.Y:=EllipseRect.Ymin/2+EllipseRect.Ymax/2;
      FloatRect.Xmin:=EllipseRect.Xmin -CenterPoint.X;
      FloatRect.Ymax:=EllipseRect.Ymax-CenterPoint.Y;
      FloatRect.Xmax:=EllipseRect.Xmax-CenterPoint.X;
      FloatRect.Ymin:=EllipseRect.Ymin -CenterPoint.Y;
      FLoatPoint1.X :=StartPoint.x - CenterPoint.X;
      FLoatPoint1.y :=StartPoint.y - CenterPoint.y;
      FLoatPoint2.X :=EndPoint.x - CenterPoint.X;
      FLoatPoint2.y :=EndPoint.y - CenterPoint.Y;
      A:= abs(FloatRect.Xmax-FloatRect.Xmin)/2;
      B:= abs(FloatRect.Ymax-FloatRect.Ymin)/2;

      if B>tozero then
      begin
         K:=A/B;
         FloatRect.Ymin:=FloatRect.Ymin*K;
         FloatRect.Ymax:=FloatRect.Ymax*K;
         FLoatPoint1.y :=FLoatPoint1.Y *K;
         FLoatPoint2.y :=FLoatPoint2.Y *K;
         R:=A;
         if GeometryCalc.Gis_P2L_Dist(0,0,FLoatPoint1.X ,FLoatPoint1.Y,FloatPoint2.x,
          FloatPoint2.Y)<=R then
          Result:=True;
      end;
    end;
  end;
end;

class function GeometryCalc.RectInEllipse(AWorldRect,
  Ellipse: TWorldRect): Boolean;
begin
  Result:=False;
  if rectinrect(AWorldRect,Ellipse) then
  begin
    Result:=pointinellipse(AWorldRect.TopLeft,Ellipse) and
      pointinellipse(AWorldRect.BottomRight,Ellipse) and
      pointinellipse(Point(AWorldRect.Left,AWorldRect.Bottom),Ellipse) and
      pointinellipse(Point(AWorldRect.Right,AWorldRect.Top),Ellipse);
  end;
end;

class procedure GeometryCalc.FormatWorldRect(var AWorldRect: TWorldRect);

begin
  if AWorldRect.Xmin =AWorldRect.Xmax then
  begin
    Inc(AWorldRect.Xmax);
    Dec(AWorldRect.Xmin);
  end
  else
  begin
    if AWorldRect.Xmin >AWorldRect.Xmax then
      GisMath.SwapValue(AWorldRect.Xmin,AWorldRect.Xmax)
  end;

  if AWorldRect.Ymin =AWorldRect.Ymax then
  begin
    Inc(AWorldRect.Ymax);
    Dec(AWorldRect.Ymin);
  end
  else
  begin
    if AWorldRect.Ymin >AWorldRect.Ymax then
      GisMath.SwapValue(AWorldRect.Ymin,AWorldRect.Ymax)
  end;

end;

class function GeometryCalc.World_P2P_Dist_Fast(const P1,
  P2: TWorldPoint): double;
begin
  Result :=Max(abs(P2.x - P1.x),abs(P2.y - P1.y)); //Sqrt(xx*xx+yy*yy);
end;

class function GeometryCalc.CalEarthOutBox(Points: TEarthPointAry;
  PointCount: integer): TEarthRect;
var
  i:integer;
begin
  Result.TopLeft:=Points[0];
  Result.BottomRight:=Points[0];
  for i:=1 to PointCount-1 do
  begin
    Result.Xmin:=Min(Result.Xmin,Points[i].Longitude);
    Result.Xmax:=Max(Result.Xmax,Points[i].Longitude);
    Result.Ymin:=Min(Result.Ymin,Points[i].Latitude);
    Result.Ymax:=Max(Result.Ymax,Points[i].Latitude);
  end;
end;

class function GeometryCalc.CalWorldOutBox(Points: TWorldPointAry;
  PointCount: integer): TWorldRect;
var
  i:integer;
begin
  Result.TopLeft:=Points[0];
  Result.BottomRight:=Points[0];
  for i:=1 to PointCount-1 do
  begin
    Result.Xmin:=Min(Result.Xmin,Points[i].x);
    Result.Xmax:=Max(Result.Xmax,Points[i].x);
    Result.Ymin:=Min(Result.Ymin,Points[i].y);
    Result.Ymax:=Max(Result.Ymax,Points[i].y);
  end;
end;

class function GeometryCalc.InitWorldRect: TWorldRect;
begin
  Result.Xmin :=MaxInt;
  Result.Xmax :=-MaxInt;
  Result.Ymin :=MaxInt;
  Result.Ymax :=-MaxInt;
end;

class function GeometryCalc.InitEarthRect: TEarthRect;
begin
  Result.Xmin :=MaxFloat;
  Result.Xmax :=-MaxFloat;
  Result.Ymin :=MaxFloat;
  Result.Ymax :=-MaxFloat;
end;


class function GeometryCalc.MergeRects(GeoMetaFlexs: TWorldMetaAry): TWorldRect;
var i:Integer;
begin
  Result.Xmin :=MaxInt;
  Result.Xmax :=-MaxInt;
  Result.Ymin :=MaxInt;
  Result.Ymax :=-MaxInt;

  for i:=0 to High(GeoMetaFlexs) do
  begin
    Result:=mergerect(Result,GeoMetaFlexs[i].Outbox);
  end;
end;

class function GeometryCalc.PolygonAcrossEllipse(APolygon: TWorldPointAry;
  AnEllipse: TWorldRect): Boolean;
var
  i:Integer;
  TempPoint:TWorldPoint;
begin
  Result:=False;
  for i:=0 to High(APolygon)-1 do
  begin
    Result:=Self.LineAcrossEllipse(APolygon[i],APolygon[i+1],AnEllipse);
    if Result then Break;
  end;
  if not Result then   //无相交线段也无在椭圆内的点
  begin
    TempPoint.x:=round(AnEllipse.Left/2+AnEllipse.right/2);
    TempPoint.y:=round(AnEllipse.Top/2+AnEllipse.Bottom/2);
    Result:=PointInPolygon(TempPoint,APolygon,0,High(APolygon)+1);
  end;
end;

class function GeometryCalc.PointInPolygon(APoint: TWorldPoint;
  APolygon: TWorldPointAry; Start, Length: Integer): Boolean;
begin
  Result:= Odd(PointAcrossPolygon(APoint,APolygon,Start, Length))
end;

class function GeometryCalc.Gis_P2BL_Dist(const Px, Py, BeePx1, BeePy1, BeePx2,
  BeePy2: double): double;
var
  aa, bb, cc: double;//三角形边长
  aa2,bb2,cc2,all:Double; //
begin
  bb := Gis_P2P_Dist(Px,Py,BeePx1, BeePy1);
  cc := Gis_P2P_Dist(Px,Py,BeePx2, BeePy2);
  aa := Gis_P2P_Dist(BeePx1, BeePy1, BeePx2,BeePy2);
  aa2:=aa*aa;
  bb2:=bb*bb;
  cc2:=cc*cc;
  if aa>ToZero then  // 计算点到直线距离
  begin
    all:=(aa2+bb2-cc2)/2/aa;
    Result:=sqrt(abs(bb2-all*all));
  end
  else
    Result := Abs(Px - BeePy1);

end;

class function GeometryCalc.Gis_P2P_Dist(const X1, Y1, X2, Y2: double): double;
begin
  Result := Sqrt((X2 - X1) * (X2 - X1) + (Y2 - Y1) * (Y2 - Y1));
end;

class function GeometryCalc.Gis_P2L_Dist(const Px, Py, BeePx1, BeePy1, BeePx2,
  BeePy2: double): double;//点到线段
var
  SinHalfAngle: double;//sin(A/2)
  aa, bb, cc, ss: double;//三角形边长,半周长
begin
  bb := Gis_P2P_Dist(Px,Py,BeePx1, BeePy1);
  cc := Gis_P2P_Dist(Px,Py,BeePx2, BeePy2);
  aa := Gis_P2P_Dist(BeePx1, BeePy1, BeePx2,BeePy2);
  ss := (aa + bb + cc) / 2;
  if aa<0.1 then  //如果线段过短,认为线段就是一个点
    Result:= bb
  else
  if (bb > ToZero) and (cc > ToZero) then
  begin
    if bb > cc then
    begin
      SinHalfAngle := sqrt((ss - cc) * (ss - aa) / (aa * cc));

      if SinHalfAngle > 0.5 then
        Result := CC
      else
        Result := Gis_P2BL_Dist(Px, Py, BeePx1, BeePy1, BeePx2,BeePy2);
    end
    else
    begin
      SinHalfAngle := sqrt((ss - bb) * (ss - aa) / (aa * bb));
      if SinHalfAngle > 0.5 then
        Result := bb
      else
        Result := Gis_P2BL_Dist(Px, Py, BeePx1, BeePy1, BeePx2,BeePy2);
    end;
  end
  else
    Result := 0;
end;


class function GeometryCalc.GetTextEarthOutbox(Text: TEarthText): TEarthRect;
var
  p1,p2,p3,p4:TEarthPoint;
  dx,dy:double;
  COSA,SINA:double;
begin
  COSA:=cos(GisMath.DegToRad(Text.Angle));
  SINA:=sin(GisMath.DegToRad(Text.Angle));
  dx:=abs(Text.SP.Longitude-Text.EP.Longitude);
  dy:=abs(Text.SP.Latitude-Text.EP.Latitude);

  p1:=Text.SP;

  p2.Longitude:=p1.Longitude+dx*COSA;
  p2.Latitude:=p1.Latitude+dx*SINA;

  p3.Longitude:=p2.Longitude+dy*SINA;
  p3.Latitude:=p2.Latitude-dy*COSA;

  p4.Longitude:=p1.Longitude+dy*SINA;
  p4.Latitude:=p2.Latitude-dy*COSA;

  Result.Xmax:=max(p1.Longitude,p3.Longitude);
  Result.Xmin:=min(p1.Longitude,p3.Longitude);

  Result.Ymax:=max(p2.Latitude,p4.Latitude);
  Result.Ymin:=min(p2.Latitude,p4.Latitude);
end;      

{class function GeometryCalc.GetTextEarthOutbox(Text: TTextStruct): TEarthRect;
var
  p1,p2,p3,p4:TEarthPoint;
  dx,dy:double;
  COSA,SINA:double;
begin
  COSA:=cos(GisMath.DegToRad(Text.Angle));
  SINA:=sin(GisMath.DegToRad(Text.Angle));
  dx:=abs(Text.SP.Longitude-Text.EP.Longitude);
  dy:=abs(Text.SP.Latitude-Text.EP.Latitude);

  p1:=Text.SP;

  p2.Longitude:=p1.Longitude+dx*COSA;
  p2.Latitude:=p1.Latitude+dx*SINA;

  p3.Longitude:=p2.Longitude+dy*SINA;
  p3.Latitude:=p2.Latitude-dy*COSA;

  p4.Longitude:=p1.Longitude+dy*SINA;
  p4.Latitude:=p2.Latitude-dy*COSA;

  Result.Xmax:=max(p1.Longitude,p3.Longitude);
  Result.Xmax:=max(Result.Xmax, p2.Longitude);
  Result.Xmax:=max(Result.Xmax, p4.Longitude);

  Result.Xmin:=min(p1.Longitude,p3.Longitude);
  Result.Xmin:=min(Result.Xmin ,p2.Longitude);
  Result.Xmin:=min(Result.Xmin ,p4.Longitude);

  Result.Ymax:=max(p2.Latitude,p4.Latitude);
  Result.Ymax:=max(Result.Ymax,p1.Latitude);
  Result.Ymax:=max(Result.Ymax,p3.Latitude);


  Result.Ymin:=min(p2.Latitude,p4.Latitude);
  Result.Ymin:=min(Result.Ymin,p1.Latitude);
  Result.Ymin:=min(Result.Ymin,p3.Latitude);
end;   }

class function GeometryCalc.GetTextWorldOutBox(SP, EP: TWorldPoint;
  Angle: double): TWorldRect;
var
  p1,p2,p3,p4:TWorldPoint;
  dx,dy:integer;
  COSA,SINA:double;
begin
  COSA:=cos(GisMath.DegToRad(Angle));
  SINA:=sin(GisMath.DegToRad(Angle));
  dx:=abs(SP.x-EP.x);
  dy:=abs(SP.y-EP.y);

  p1:=SP;
  p2.x:=Round(SP.x+dx*COSA);
  p2.y:=Round(SP.y+dx*SINA);

  p3.x:=Round(p2.x+dy*SINA);
  p3.y:=Round(p2.y-dy*COSA);

  p4.x:=Round(p1.x+dy*SINA);
  p4.y:=Round(p1.y-dy*COSA);

  Result.Xmax:=max(p1.x,p3.x);
  Result.Xmax:=max(Result.Xmax,p2.x);
  Result.Xmax:=max(Result.Xmax,p4.x);

  Result.Xmin:=min(p1.x,p3.x);
  Result.Xmin:=min(Result.Xmin,p2.x);
  Result.Xmin:=min(Result.Xmin,p4.x);

  Result.Ymax:=max(p2.y,p4.y);
  Result.Ymax:=max(Result.Ymax,p1.y);
  Result.Ymax:=max(Result.Ymax,p3.y);

  Result.Ymin:=min(p2.y,p4.y);
  Result.Ymin:=min(Result.Ymin,p1.y);
  Result.Ymin:=min(Result.Ymin,p3.y);
end;



{ TPolyHandle }

{procedure TPolyHandle.AddPoint(polyIndex,SubPointIndex:integer;Point:TEarthPoint);
begin
  if SubPointIndex<0 then
  begin  //插入点在首点
    OSubPolys[polyIndex]:= OSubPolys[polyIndex]+1;

    SetLength(OPoints[PolyIndex],OSubPolys[PolyIndex]);
    CopyMemory(@OPoints[PolyIndex][1],@OPoints[PolyIndex][0],
      (OSubPolys[PolyIndex]-1)*SizeOf(TEarthPoint));

    OPoints[PolyIndex][0]:=Point;
    if Ftype = _PolyRegion then
      OPoints[PolyIndex][OSubPolys[polyIndex]-1]:=OPoints[PolyIndex][0];
  end else

  if SubPointIndex>=OSubPolys[polyIndex] then
  begin  //插入点在末点
    OSubPolys[polyIndex]:= OSubPolys[polyIndex]+1;

    SetLength(OPoints[PolyIndex],OSubPolys[PolyIndex]);
    OPoints[PolyIndex][OSubPolys[polyIndex]-1]:=Point;
    if Ftype = _PolyRegion then
      OPoints[PolyIndex][0]:=OPoints[PolyIndex][OSubPolys[polyIndex]-1];
  end else

  begin //一般情况
    OSubPolys[polyIndex]:= OSubPolys[polyIndex]+1;

    SetLength(OPoints[PolyIndex],OSubPolys[PolyIndex]);
    CopyMemory(@OPoints[PolyIndex][SubPointIndex+2],
      @OPoints[PolyIndex][SubPointIndex+1],
      (OSubPolys[PolyIndex]-SubPointIndex-2)*SizeOf(TEarthPoint));

    OPoints[PolyIndex][SubPointIndex+1]:=Point;
  end;
end;

constructor TPolyHandle.Create(PMetaFix: PEarthMeta);
var
  i:integer;
  pointsCopyed:integer;
begin
  FDeletedPolyIndex:=-1;
  Ftype:=PMetaFix^._type;
  if Ftype = _PolyLine then
  with PMetaFix^.Polyline do
  begin
    SetLength(OSubPolys,Count);
    CopyMemory(@OSubPolys[0],Pointer(SPtAddress),Count*SizeOf(Integer));
    SetLength(OPoints,Count);
    pointsCopyed:=0;
    for i:=0 to Count-1 do
    begin
      SetLength(OPoints[i],OSubPolys[i]);
      CopyMemory(@OPoints[i][0],
        pointer(PtAddress+pointsCopyed*SizeOf(TEarthPoint)),
        OSubPolys[i]*SizeOf(TEarthPoint));
      pointsCopyed:=pointsCopyed+OSubPolys[i];
    end;
  end else
  if Ftype = _PolyRegion then
  with PMetaFix^.PolyRegion do
  begin
    SetLength(OSubPolys,Count);
    CopyMemory(@OSubPolys[0],Pointer(SPtAddress),Count*SizeOf(Integer));
    SetLength(OPoints,Count);
    pointsCopyed:=0;
    for i:=0 to Count-1 do
    begin
      SetLength(OPoints[i],OSubPolys[i]);
      CopyMemory(@OPoints[i][0],
        pointer(PtAddress+pointsCopyed*SizeOf(TEarthPoint)),
        OSubPolys[i]*SizeOf(TEarthPoint));
      pointsCopyed:=pointsCopyed+OSubPolys[i];
    end;
  end;
end;

destructor TPolyHandle.Destroy;
begin
  inherited;
end;

procedure TPolyHandle.ModifyPoint(PolyIndex, SubPointIndex: integer;
  NewPos: TEarthPoint);
begin
  if (Ftype = _PolyRegion) and
     ((SubPointIndex=0) or
     (SubPointIndex=OSubPolys[PolyIndex]-1)) then
  begin
    OPoints[PolyIndex][0]:=NewPos;
    OPoints[PolyIndex][OSubPolys[PolyIndex]-1]:=NewPos;
  end
  else
    OPoints[PolyIndex][SubPointIndex]:=NewPos;
end;

function TPolyHandle.GetNextPoint(const SubPolyIndex,
  SubPointIndex: integer): TEarthPoint;
var
  count:integer;
begin
  count:=OSubpolys[SubPolyIndex];
  if Ftype = _PolyLine then
  begin
//    if SubPointIndex>=count-1 then Raise EInvalidParam.Create;
    Result:=OPoints[SubPolyIndex][SubPointIndex+1];
  end else
  if Ftype = _PolyRegion then
  begin
    if SubPointIndex>=count-1 then
      Result:=OPoints[SubPolyIndex][1]
    else
      Result:=OPoints[SubPolyIndex][SubPointIndex+1];
  end;
end;

function TPolyHandle.PointsIndexToSubPointsIndex(
  PointIndex: integer;var SubPolyIndex,SubPointIndex:integer): boolean;
var
  i:integer;
begin
  if PointIndex<0 then
  begin
    Result:=False;
    Exit;
  end;

  for i:=0 to High(OSubPolys) do
  begin
    if OSubPolys[i]>PointIndex then
    begin
      SubPolyIndex:=i;
      SubPointIndex:=PointIndex;
      Result:=True;
      Exit;
    end else
    PointIndex:=PointIndex-OSubPolys[i];
  end;
  Result:=False;
end;

function TPolyHandle.GetPrePoint(const SubPolyIndex,
  SubPointIndex: integer): TEarthPoint;
var
  count:integer;
begin
  count:=OSubpolys[SubPolyIndex];
  if Ftype = _PolyLine then
  begin
//    if SubPointIndex=0 then Raise EInvalidParam.Create;
    Result:=OPoints[SubPolyIndex][SubPointIndex-1];
  end else
  if Ftype = _PolyRegion then
  begin
    if (SubPointIndex=0)or (SubPointIndex=count-1) then
      Result:=OPoints[SubPolyIndex][count-2]
    else
      Result:=OPoints[SubPolyIndex][SubPointIndex-1];
  end;
end;

procedure TPolyHandle.ReBuildMeta(PMetaFix: PEarthMeta;
  AMemFileAddr:PByte;AMemFileSize:LongInt);
var
  i,j,allPoints,pointsCopyed:integer;
  p:pointer;
  outBox:TEarthRect;
begin
  if (Ftype = _PolyLine)and (PMetaFix^._type = _PolyLine) then
  with PMetaFix^.Polyline do
  begin
    allPoints:=SumInt(OSubPolys);
    Count:=Length(OSubPolys);
    
    if (PtAddress >= Integer(AMemFileAddr)+AMemFileSize) or
       (PtAddress<Integer(AMemFileAddr)) then
    begin//不在内存文件中
      try
        p:=pointer(PtAddress);
        ReAllocMem(p,allPoints*SizeOf(TEarthPoint)+Length(OsubPolys)*
          SizeOf(Integer));
      except
        p:=nil;
        ReAllocMem(p,allPoints*SizeOf(TEarthPoint)+Length(OsubPolys)*
          SizeOf(Integer));
      end;
    end else
    begin
      p:=nil;
      ReAllocMem(p,allPoints*SizeOf(TEarthPoint)+Length(OsubPolys)*
        SizeOf(Integer));
    end;


    PtAddress := Integer(p);
    SPtAddress := integer(p)+allPoints*SizeOf(TEarthPoint);
    pointsCopyed:=0;
    for i:=0 to Count-1 do
    begin
      CopyMemory(Pointer(PtAddress+pointsCopyed*SizeOf(TEarthPoint)),
        @Opoints[i][0],Osubpolys[i]*SizeOf(TEarthPoint));
      pointsCopyed:=pointsCopyed+OsubPolys[i];
    end;
    CopyMemory(Pointer(SPtAddress),@OsubPolys[0],Count*SizeOf(Integer));
  end else


  if (Ftype = _PolyRegion) and (PMetaFix^._type = _PolyRegion) then
  with PMetaFix^.PolyRegion do
  begin
    allPoints:=SumInt(OSubPolys);
    Count:=Length(OSubPolys);

    if (PtAddress >= Integer(AMemFileAddr)+AMemFileSize) or
       (PtAddress < Integer(AMemFileAddr)) then
    begin
      try
        p:=pointer(PtAddress);
        ReAllocMem(p,allPoints*SizeOf(TEarthPoint)+Length(OsubPolys)*
          (SizeOf(Integer)+Sizeof(TWorldRect)+Sizeof(Integer)));
      except
        p:=nil;
        ReAllocMem(p,allPoints*SizeOf(TEarthPoint)+Length(OsubPolys)*
          (SizeOf(Integer)+Sizeof(TWorldRect)+Sizeof(Integer)));
      end;
    end else
    begin
      p:=nil;
      ReAllocMem(p,allPoints*SizeOf(TEarthPoint)+Length(OsubPolys)*
        (SizeOf(Integer)+Sizeof(TWorldRect)+Sizeof(Integer)));
    end;

    PtAddress := Integer(p);
    SPtAddress := integer(p)+allPoints*SizeOf(TEarthPoint);

    //@@SOutBoxAddress := SPtAddress + Count*SizeOf(Integer);
    //@@SPositives := SOutBoxAddress + Count*SizeOf(TWorldRect);
    pointsCopyed:=0;
    for i:=0 to Count-1 do
    begin
      CopyMemory(Pointer(PtAddress+pointsCopyed*SizeOf(TEarthPoint)),
        @Opoints[i][0],Osubpolys[i]*SizeOf(TEarthPoint));
      pointsCopyed:=pointsCopyed+OsubPolys[i];
      //Copy SubOutBoxsFix
      //Copy SubPositivesFix
    end;
    CopyMemory(Pointer(SPtAddress),@OsubPolys[0],Count*SizeOf(Integer));
  end;

  if High(OSubPolys)>=0 then
  begin
    outBox.Xmin:=Opoints[0][0].Longitude;
    outBox.Xmax:=Opoints[0][0].Longitude;
    outBox.Ymin:=Opoints[0][0].Latitude;
    outBox.Ymax:=Opoints[0][0].Latitude;
    for i:=0 to High(OSubPolys) do
    begin
      for j:=0 to High(Opoints[i])do
      begin
        outBox.Xmin:=Min(outBox.Xmin,Opoints[i][j].Longitude);
        outBox.Xmax:=Max(outBox.Xmax,Opoints[i][j].Longitude);
        outBox.Ymin:=Min(outBox.Ymin,Opoints[i][j].Latitude);
        outBox.Ymax:=Max(outBox.Ymax,Opoints[i][j].Latitude);
      end;
    end;
  end;
  PMetaFix^.Outbox:=outBox;

end;

function TPolyHandle.RemovePoint(PolyIndex,SubPointIndex:integer):boolean;
var
  count:integer;
  value:integer;
begin
  Result:=False;
  count:=Length(OSubPolys);
  if (Ftype <> _PolyRegion) and (Ftype <> _PolyLine) then Exit;

  if (Ftype = _PolyLine) then value:=2;
  if (Ftype = _PolyRegion) then value:=4;

  if(count=1) and (OSubPolys[0]<=value) then Exit;
  if OSubPolys[PolyIndex]<=value then
  begin
    //RemovePoly(PolyIndex);  //子多边形点个数<Value 删除子多边形
    //Result:=True;        现在不允许删除？原因Undo没做完
    Exit;
  end;

  OSubPolys[PolyIndex]:=OSubPolys[PolyIndex]-1;
  CopyMemory(@OPoints[PolyIndex][SubPointIndex],
    @OPoints[PolyIndex][SubPointIndex+1],
    (OSubPolys[PolyIndex]-SubPointIndex)*SizeOf(TEarthPoint));
  SetLength(OPoints[PolyIndex],OSubPolys[PolyIndex]);
  if (SubPointIndex=0) and (Ftype = _PolyRegion) then  //第一个点
  begin
    OPoints[PolyIndex][OSubPolys[PolyIndex]-1]:=OPoints[PolyIndex][0];
    //OSubPolys[High(OSubPolys)]:=OSubPolys[0];
  end else
  if (SubPointIndex>OSubPolys[PolyIndex]) and (Ftype = _PolyRegion) then  //最后一个点
  begin
    OPoints[PolyIndex][0]:=OPoints[PolyIndex][OSubPolys[PolyIndex]-1];
    //OSubPolys[0]:=OSubPolys[High(OSubPolys)];
  end;

  Result:=True;
end;

procedure TPolyHandle.RemovePoly(PolyIndex: integer);
var
  i,Count:integer;
begin
  Count:=Length(OSubPolys);
  if (PolyIndex>=0) and (PolyIndex<Count) then
  begin
    //保存被删除的点
    FDeletedPolyIndex:=PolyIndex;
    SetLength(FDeletedPolyPoints,Length(OPoints[PolyIndex]));
    CopyMemory(@FDeletedPolyPoints[0],@OPoints[PolyIndex][0],
      Length(FDeletedPolyPoints)*SizeOf(TEarthPoint));
    //保存完毕
    
    SetLength(OPoints[PolyIndex],0);
    for i:=PolyIndex to Count-2 do
    begin
      Opoints[i]:=OPoints[i+1];
      OSubPolys[i]:=OSubPolys[i+1];
    end;
    dec(Count);
    SetLength(Opoints,Count);
    SetLength(OSubPolys,Count);
  end;
end;

procedure TPolyHandle.InsertPoly(APolyIndex:integer;APoints:TEarthPointAry);
var
  i,Count:integer;
begin
  Count:=Length(OSubPolys);
  if (APolyIndex>=0) and (Length(APoints)>0) then
  begin
    inc(Count);
    SetLength(Opoints,Count);
    SetLength(OSubPolys,Count);

    for i:=APolyIndex to Count-2 do
    begin
      Opoints[i+1]:=OPoints[i];
      OSubPolys[i+1]:=OSubPolys[i];
    end;

    OSubPolys[APolyIndex]:=Length(APoints);
    SetLength(OPoints[APolyIndex],Length(APoints));
    CopyMemory(@OPoints[APolyIndex][0],@APoints[0],
      Length(APoints)*SizeOf(TEarthPoint));
  end;
end;





function TPolyHandle.GetSubPolyPointsCount(
  SubPolyIndex: integer): integer;
begin
  if (SubPolyIndex>=0) and (SubPolyIndex<Length(OSubPolys))then
    Result:=OSubPolys[SubPolyIndex]
  else
//    EIndexError.Create;
end;

function TPolyHandle.GetAllPointsCount: integer;
begin
  Result:=SumInt(OSubpolys);
end;

function TPolyHandle.GetPoint(PointIndex:integer): TEarthPoint;
var
  subPolyIndex,subPolyPointIndex:integer;
begin
  PointsIndexToSubPointsIndex(PointIndex,subPolyIndex,subPolyPointIndex);
  Result:=OPoints[subPolyIndex][subPolyPointIndex];
end;


function TPolyHandle.GetPoint(PolyIndex,
  SubPointIndex: integer): TEarthPoint;
begin
  if (PolyIndex>=0) and (PolyIndex<Length(OPoints)) and
     (SubPointIndex>=0)and(SubPointIndex<Length(OPoints[PolyIndex])) then
    Result:=OPoints[PolyIndex][SubPointIndex]
  else
//    raise EIndexError.Create;
end;

class procedure TPolyHandle.GetPolygons(var APolygons: TPolygons;
  APMetaFlex: PWorldMeta; APMetaFix: PEarthMeta);
var
  i,j,pointsCopyed,pointsDeleted:integer;
  pointsCount:TIntegerDynArray;
  currentPoint:PWorldPoint;
  lastPoint:TWorldPoint;
begin
  if APMetaFlex^._type <> _PolyRegion then Exit;

  SetLength(APolygons,APMetaFix^.PolyRegion.Count);
  SetLength(pointsCount,APMetaFix^.PolyRegion.Count);
  CopyMemory(@pointsCount[0],Pointer(APMetaFix^.PolyRegion.SPtAddress),
    APMetaFix^.PolyRegion.Count*SizeOf(Integer));
  pointsCopyed:=0;

  for i:=0 to APMetaFix^.PolyRegion.Count-1 do
  begin
    SetLength(APolygons[i],pointsCount[i]);

   // CopyMemory(@APolygons[i][0],
   //   Pointer(APMetaFlex^.PolyRegion.PosFlex+pointsCopyed*SizeOf(TWorldPoint)),
  //    pointsCount[i]*SizeOf(TWorldPoint));

    pointsDeleted:=0;
    currentPoint:=Pointer(APMetaFlex^.PolyRegion.PWAddress+pointsCopyed*SizeOf(TWorldPoint));
    lastPoint.x:=currentPoint^.x+1;

    for j:=0 to pointsCount[i]-1 do
    begin

      if (currentPoint^.x<>lastPoint.x) or (currentPoint^.y<>lastPoint.y) then
      begin
        APolygons[i][j-pointsDeleted]:=currentPoint^;
        lastPoint:=currentPoint^;
      end
      else
        inc(pointsDeleted);
      GisSystem.PtrAdd(Pointer(currentPoint),2*SizeOf(Integer));
    end;

    if pointsDeleted>0 then
    begin
      pointsCount[i]:=pointsCount[i]-pointsDeleted;
      SetLength(APolygons[i],pointsCount[i]);
    end;
    pointsCopyed:=pointsCopyed+pointsCount[i];
  end;
end;
       }
{ TPolyEditHandle }
{
constructor TPolyEditHandle.Create;
begin

end;


procedure TPolyEditHandle.ReCreate(PMetaFix: PEarthMeta);
var
  i:integer;
  pointsCopyed:integer;
begin
  Ftype:=PMetaFix^._type;
  if Ftype = _PolyLine then
  with PMetaFix^.Polyline do
  begin
    SetLength(OSubPolys,Count);
    CopyMemory(@OSubPolys[0],Pointer(SPtAddress),Count*SizeOf(Integer));
    SetLength(OPoints,Count);
    pointsCopyed:=0;
    for i:=0 to Count-1 do
    begin
      SetLength(OPoints[i],OSubPolys[i]);
      CopyMemory(@OPoints[i][0],
        pointer(PtAddress+pointsCopyed*SizeOf(TEarthPoint)),
        OSubPolys[i]*SizeOf(TEarthPoint));
      pointsCopyed:=pointsCopyed+OSubPolys[i];
    end;
  end else
  if Ftype = _PolyRegion then
  with PMetaFix^.PolyRegion do
  begin
    SetLength(OSubPolys,Count);
    CopyMemory(@OSubPolys[0],Pointer(SPtAddress),Count*SizeOf(Integer));
    SetLength(OPoints,Count);
    pointsCopyed:=0;
    for i:=0 to Count-1 do
    begin
      SetLength(OPoints[i],OSubPolys[i]);
      CopyMemory(@OPoints[i][0],
        pointer(PtAddress+pointsCopyed*SizeOf(TEarthPoint)),
        OSubPolys[i]*SizeOf(TEarthPoint));
      pointsCopyed:=pointsCopyed+OSubPolys[i];
    end;
  end;
end;

procedure TPolyEditHandle.SetNextPoint(const Value: TEarthPoint);
begin
  FNextPoint := Value;
end;

procedure TPolyEditHandle.SetPointIndex(const Value: Integer);
begin

end;

procedure TPolyEditHandle.SetPrePoint(const Value: TEarthPoint);
begin
  FProPoint := Value;
end;

procedure TPolyEditHandle.SetSubIndex(const Value: Integer);
begin
  FSubIndex := Value;
end;

procedure TPolyEditHandle.SetSubPointIndex(const Value: Integer);
begin
  FSubPointIndex := Value;
end;

                       }

class function GeometryCalc.SharpAngleVetical(SharpPoint, StartPoint,
  EndPoint: TWorldPoint;var VerticalPoint:TWorldPoint): Boolean;
var
  H:Double;//垂线距离
//  TempDistance:Double;
  bb,cc,aa:Double;//,ss 三角形的三条边 和半周长
//  K:Double;//斜率
  L1,L2:Double;//垂点分割线长度
  lenmda:double;//分割线长度比例
//  SinHalfAngle:Double;//半角
begin
//先平移坐标系 ,以SharpPoint为原点
  StartPoint.x:=StartPoint.x-SharpPoint.x;
  EndPoint.x:=EndPoint.x-SharpPoint.x;
  StartPoint.y:=StartPoint.y-SharpPoint.y;
  EndPoint.y:=EndPoint.y-SharpPoint.y;
//  求出高
  aa:=World_P2P_Dist(StartPoint,EndPoint);
  bb:=sqrt(StartPoint.x*StartPoint.x+ StartPoint.y*StartPoint.y);
  cc:=sqrt(EndPoint.x*EndPoint.x+ EndPoint.y*EndPoint.y);
  H :=World_P2BL_Dist(SharpPoint ,StartPoint,EndPoint);
  L1:=sqrt(abs(bb*bb-H*H));
  L2:=sqrt(abs(cc*cc-H*H));

  if ((aa-Max(L1,L2))>0)  then //锐角
  begin
    lenmda:=L1/L2;
    VerticalPoint.x:=round((StartPoint.x+lenmda*EndPoint.x)/(1+lenmda))+SharpPoint.x;
    VerticalPoint.y:=round((StartPoint.y+lenmda*EndPoint.y)/(1+lenmda))+SharpPoint.y;
    Result:=True;
  end
  else
    Result:=False;

//
end;



class function GeometryCalc.EqualPoint(P1, P2: TPoint): Boolean;
begin
  Result:=(P1.x=P2.x) and (P1.y=P2.y);
end;

class function GeometryCalc.IsLineAcross(StartPoint, EndPoint: TEarthPoint; AA, BB,
  CC: DOUBLE): Boolean;
var
  I1,I2:Double;
begin
  I1:=StartPoint.x*AA+StartPoint.y*BB+CC;
  I2:=EndPoint.x*AA+EndPoint.y*BB+CC;
  Result:=GisMath.DiffSign(I1,I2)
end;

class function GeometryCalc.RectAcross(Rect1, Rect2: TEarthRect): Boolean;
begin
   Result:=not   
    ((Rect1.Xmin>Rect2.Xmax) or
     (Rect1.Xmax<Rect2.Xmin) or
     (Rect1.Ymin>Rect2.Ymax) or
     (Rect1.Ymax<Rect2.Ymin)) ;
end;

class function GeometryCalc.MergeRect(ARect1, ARect2: TEarthRect): TEarthRect;
begin
  Result.Xmin:=Min(ARect1.Xmin,ARect2.Xmin);
  Result.Ymin:=Min(ARect1.Ymin,ARect2.Ymin);
  Result.Xmax:=Max(ARect1.Xmax,ARect2.Xmax);
  Result.Ymax:=Max(ARect1.Ymax,ARect2.Ymax);
end;

class function GeometryCalc.RectAcross(Rect1,Rect2:TRect): Boolean;
const
  delta = 2;
begin
   Result:=not
    ((Rect1.Left - delta>Rect2.Right + delta) or
     (Rect1.Right + delta<Rect2.Left - delta) or
     (Rect1.Top - delta>Rect2.Bottom + delta) or
     (Rect1.Bottom + delta<Rect2.Top - delta)) ;
end;


end.


