unit PitchOn;

interface
uses
  windows, classes, math, Types, coord, geome, metaDefine, tyolist, tyograph;
type
  TSelectType=(stContaintSelect,stCrossSelect);
  TSelectAddType=(satAdd,satAddXor,satAddOr);
  TSelection=class
  private
    FDrawCood: TDrawCood;
    FSelectedList: TYIntegerList;
    FObjMetas: TIntegerDynArray;
    FStart: Integer;
    FLength: Integer;
    procedure SetDrawCood(const Value: TDrawCood);
    procedure SetObjMetas(const Value: TIntegerDynArray);
    procedure SetSelectedList(const Value: TYIntegerList);
    procedure DoSetLength(const Value: Integer);
    procedure SetStart(const Value: Integer);
  protected
    FSelectType:TSelectType;
    FSelectAddType:TSelectAddType;
    FTempPolyPolygon: TWorldPolyRegionCalc;
    FFuryLength:Integer;
    function IsPointInMeta(AWorldPoint:TWorldPoint;AMeta:PMetaStruct;StaticStart:integer):Boolean;virtual;//�ж�ĳ���Ƿ������ͼԪ�� --by  dxf  2006-08-24
  public
    constructor Create;virtual;
    function Select(APoint:TPoint):Boolean;
    function SelectMeta(AWorldPoint: TWorldPoint;AMeta:PMetaStruct;StaticStart:integer):Boolean;overload;
    function SelectMeta(AWorldRect:TWorldRect;AMeta:PMetaStruct;StaticStart:integer):Boolean;overload;
    function SelectMeta(AnEllipse:TWorldRect;Ellipse:Boolean;AMeta:PMetaStruct;StaticStart:integer):Boolean;overload;
    property SelectType:TSelectType read FSelectType Write FSelectType;
    property SelectAddType:TSelectAddType read FSelectAddType Write FSelectAddType;
    property FuryLength:Integer read FFuryLength Write FFuryLength;
    property DrawCood:TDrawCood read FDrawCood write SetDrawCood;
    property SelectedList:TYIntegerList  read FSelectedList write SetSelectedList;
    property ObjMetas:TIntegerDynArray read FObjMetas write SetObjMetas;
    property Start:Integer read FStart write SetStart;
    property Length:Integer read FLength write DoSetLength;
  end;
implementation
uses
  tyoException;

{ TSelection }

constructor TSelection.Create;
begin
  FFuryLength:=4;

end;

function TSelection.IsPointInMeta(AWorldPoint: TWorldPoint;
  AMeta: PMetaStruct;StaticStart:integer): Boolean;
var
  WorldFury,WorldLength:integer ;
  FontPixel:Integer;
  NewOutbox:TWorldRect;
  Points:TWorldPointAry;
  SubPoints:TIntegerDynArray;
  PointLength:Integer;
  Polygons: TWorldPolyRegionCalc;
begin
  Result:=False;

  case AMeta._Type of
    _Symbol: //����
    begin
      FontPixel:= round(-1*GraphDraw.GetFontHeigth(AMeta.Symbol.CustomSymbol.Size)
        /2*FDrawCood.getrealScale); //����������ظ߶�

      //��������ڵ�ǰ���������µ��������
      NewOutBox.Xmin:=AMeta.Symbol.Position.x-FontPixel;
      NewOutBox.XMax:=AMeta.Symbol.Position.x+FontPixel;
      NewOutBox.ymin:=AMeta.Symbol.Position.y-FontPixel;
      NewOutBox.yMax:=AMeta.Symbol.Position.y+FontPixel;
      //������ת����������Ϊ�����


      if GeometryCalc.PointInRect(AWorldPoint,NewOutbox) then
        Result:=True;
    end;
    _Line:
    begin
      WorldFury:=round(FFuryLength*FDrawCood.GetRealScale());//�������������ѡ��ģ�����
      WorldLength:=round(AMeta.Line.Pen.Width*FDrawCood.GetRealScale()/2);
      if WorldFury<WorldLength then WorldFury:=WorldLength;
      NewOutBox.Xmin :=AMeta.Outbox.Xmin-WorldFury;
      NewOutBox.Ymin :=AMeta.Outbox.Ymin-WorldFury;
      NewOutBox.Xmax :=AMeta.Outbox.Xmax+WorldFury;
      NewOutBox.Ymax :=AMeta.Outbox.Ymax+WorldFury;

      if GeometryCalc.PointInRect(AWorldPoint,NewOutbox) then
      begin
        if GeometryCalc.World_P2L_Dist(AWorldPoint,AMeta.Line.SP,
          AMeta.Line.EP)<WorldFury then
          Result:=True;
      end;
    end;
    _Text: //�ı�
    begin
      NewOutBox:=AMeta.Outbox;
      if GeometryCalc.PointInRect(AWorldPoint,NewOutbox) then
        Result:=True;
    end;
    _PolyLine:  //������
    begin
      WorldFury:=round(FFuryLength*FDrawCood.GetRealScale());//�������������ѡ��ģ�����
      WorldLength:=round(AMeta.Line.Pen.Width*FDrawCood.GetRealScale()/2);
      if WorldFury<WorldLength then WorldFury:=WorldLength;
      NewOutBox.Xmin :=AMeta.Outbox.Xmin-WorldFury;
      NewOutBox.Ymin :=AMeta.Outbox.Ymin-WorldFury;
      NewOutBox.Xmax :=AMeta.Outbox.Xmax+WorldFury;
      NewOutBox.Ymax :=AMeta.Outbox.Ymax+WorldFury;
      if GeometryCalc.PointInRect(AWorldPoint,NewOutbox) then
      begin
        SetLength(SubPoints,AMeta.Polyline.Count);
        copymemory(@subpoints[0],pointer(AMeta.Polyline.SPWAddress+StaticStart),AMeta.Polyline.Count*SizeOf(Integer));
        PointLength:=sumint(SubPoints);
        SetLength(Points,PointLength);
        copymemory(@points[0],pointer(AMeta.Polyline.PWAddress+StaticStart),PointLength*SizeOf(TWorldPoint));
        //WorldLength:=round(AMeta.PolyLine.Pen.Width*FDrawCood.GetRealScale());
        if GeometryCalc.PointToPolyLine(AWorldPoint,AMeta.PolyLine.Count,SubPoints,Points)
          <WorldFury then
          Result:=True;
      end;
    end;
    _Rect: //����,դ��ͼ
    begin
      NewOutBox:=AMeta.Outbox;
      if GeometryCalc.PointInRect(AWorldPoint,NewOutBox) then
        Result:=True;
    end;
    _RoundRect: //԰�Ǿ���
    begin
      { TODO -o�۽� : ԰�Ǿ���ѡ���ж� }
      NewOutBox:=AMeta.Outbox;
    end;
    _PolyRegion: //�����
    begin
      NewOutBox:=AMeta.Outbox;
      if GeometryCalc.PointInRect(AWorldPoint,NewOutBox) then
      begin
        Polygons:= TWorldPolyRegionCalc.Create;
        Polygons.LoadFromStream(AMeta.PolyRegion,StaticStart);
        if GeometryCalc.PointInPolyRegion(AWorldPoint,Polygons.Count,Polygons.SubPosition,Polygons.WorldPoints) then
        begin
          Result:=True;
        end;
        Polygons.Free;
      end;
    end;
  end;

end;

function TSelection.Select(APoint: TPoint): Boolean;
//var i:Integer;
begin
//  Result:=False;
//  for i:=FStart to FStart+Length-1 do
//  begin
//    if SelectMeta(APoint,TMetaStruct(FObjMetas[i])) then
//    begin
//        Result:=True;//����ѡ���н��
//{        case FSelectAddType of
//         satAdd: FSelectedList.Add(FDrawLayer.FMetaInScreen.GetData(i));
//          satAddXor: FSelectedList.AddXor(FDrawLayer.FMetaInScreen.GetData(i));
//          satAddOr: FSelectedList.AddOr(FDrawLayer.FMetaInScreen.GetData(i));
//        end;}
//    end;
//  end;
  raise ENotComplete.Create;
end;


function TSelection.SelectMeta(AWorldPoint: TWorldPoint;AMeta: PMetaStruct;StaticStart:integer): Boolean;
begin
  Result:=False;
  //��ʼ����
  if ispointinmeta(AWorldPoint,AMeta,StaticStart) then
    Result:=True;
end;

procedure TSelection.SetDrawCood(const Value: TDrawCood);
begin
  FDrawCood := Value;
end;

procedure TSelection.DoSetLength(const Value: Integer);
begin
  FLength := Value;
end;

procedure TSelection.SetObjMetas(const Value: TIntegerDynArray);
begin
  FObjMetas := Value;
end;

procedure TSelection.SetSelectedList(const Value: TYIntegerList);
begin
  FSelectedList := Value;
end;

procedure TSelection.SetStart(const Value: Integer);
begin
  FStart := Value;
end;

function TSelection.SelectMeta(AWorldRect: TWorldRect;
  AMeta: PMetaStruct;StaticStart:integer): Boolean;
var
//  WorldFury,WorldLength:integer ;
  FontPixel:Integer;
  NewOutbox:TWorldRect;
  Points:TWorldPointAry;
  SubPoints:TIntegerDynArray;
  PointLength:Integer;
//  Polygons: TWorldPolyRegionCalc;
//  i,j:Integer;
begin
Result:=False;
case FSelectType of
  stContaintSelect://����ѡ��
  begin
    case AMeta._Type of
      _Symbol: //����
      begin
        FontPixel:= round(-1*GraphDraw.GetFontHeigth(AMeta.Symbol.CustomSymbol.Size)
          /2*FDrawCood.getrealScale); //����������ظ߶�

        //��������ڵ�ǰ���������µ��������
        NewOutBox.Xmin:=AMeta.Symbol.Position.x-FontPixel;
        NewOutBox.XMax:=AMeta.Symbol.Position.x+FontPixel;
        NewOutBox.ymin:=AMeta.Symbol.Position.y-FontPixel;
        NewOutBox.yMax:=AMeta.Symbol.Position.y+FontPixel;

        if GeometryCalc.RectInRect(NewOutbox,AWorldRect) then
          Result:=True;
      end;
      _Line:
      begin
        //����߶��ڵ�ǰ���������µ��������
        NewOutBox:=AMeta.Outbox;
        if GeometryCalc.RectInRect(NewOutbox,AWorldRect) then
          Result:=True;
      end;
      _Text: //�ı�
      begin
        NewOutBox:=AMeta.Outbox;
        if GeometryCalc.RectInRect(NewOutbox,AWorldRect) then
          Result:=True;
      end;
      _PolyLine:  //������
      begin
        NewOutBox:=AMeta.Outbox;
        if GeometryCalc.RectInRect(NewOutbox,AWorldRect) then
          Result:=True;
      end;
      _Rect: //����,դ��ͼ
      begin
        NewOutbox :=AMeta.Outbox;
        if GeometryCalc.RectInRect(NewOutbox,AWorldRect) then
          Result:=True;
      end;
      _RoundRect: //԰�Ǿ���
      begin
        NewOutbox :=AMeta.Outbox;
        if GeometryCalc.RectInRect(NewOutbox,AWorldRect) then
          Result:=True;
      end;
      _PolyRegion: //�����
      begin
        NewOutbox :=AMeta.Outbox;
        if GeometryCalc.RectInRect(NewOutbox,AWorldRect) then
          Result:=True;
      end;
    end;
  end ;
stCrossSelect:
  begin
    case AMeta._Type of
      _Symbol: //����
      begin
        FontPixel:= round(-1*GraphDraw.GetFontHeigth(AMeta.Symbol.CustomSymbol.Size)
          /2*FDrawCood.getrealScale); //����������ظ߶�

        //��������ڵ�ǰ���������µ��������
        NewOutBox.Xmin:=AMeta.Symbol.Position.x-FontPixel;
        NewOutBox.XMax:=AMeta.Symbol.Position.x+FontPixel;
        NewOutBox.ymin:=AMeta.Symbol.Position.y-FontPixel;
        NewOutBox.yMax:=AMeta.Symbol.Position.y+FontPixel;

        if GeometryCalc.RectAcross(NewOutbox,AWorldRect) then
          Result:=True;
      end;
      _Line: //�߶�
      begin
        if GeometryCalc.PointInRect(AMeta.Line.SP,AWorldRect) or
          GeometryCalc.PointInRect(AMeta.Line.EP,AWorldRect) or
          GeometryCalc.RectAcrossLine(AWorldRect,AMeta.Line.SP,AMeta.Line.EP) then
          Result:=True;

      end;
      _Text: //�ı�
      begin
        NewOutBox:=AMeta.Outbox;
        if GeometryCalc.RectInRect(NewOutbox,AWorldRect) then
          Result:=True;
      end;
      _PolyLine: //������
      begin
        NewOutbox :=AMeta.Outbox;
        if GeometryCalc.RectAcross(AWorldRect,NewOutbox) then
        begin
          SetLength(SubPoints,AMeta.Polyline.Count);
          copymemory(@subpoints[0],pointer(AMeta.Polyline.SPWAddress),AMeta.Polyline.Count*SizeOf(Integer));
          PointLength:=sumint(SubPoints);
          SetLength(Points,PointLength);
          copymemory(@points[0],pointer(AMeta.Polyline.PWAddress),PointLength*SizeOf(TWorldPoint));
          if GeometryCalc.rectacrosspolyline(AWorldRect,AMeta.PolyLine.Count,SubPoints,Points) then
            Result:=True;
        end;
      end;
      _Rect: //����,դ��ͼ
      begin
        if GeometryCalc.RectAcross(AWorldRect,AMeta.Outbox) then
          Result:=True;
      end;
      _RoundRect://԰�Ǿ���
      begin

      end;
      _PolyRegion://�����
      begin
        NewOutbox :=AMeta.Outbox;
        if GeometryCalc.RectAcross(AWorldRect,NewOutbox) then
        begin
          SetLength(SubPoints,AMeta.PolyRegion.Count);
          copymemory(@subpoints[0],pointer(AMeta.PolyRegion.SPWAddress),AMeta.PolyRegion.Count*SizeOf(Integer));
          PointLength:=sumint(SubPoints);
          SetLength(Points,PointLength);
          copymemory(@points[0],pointer(AMeta.PolyRegion.PWAddress),PointLength*SizeOf(TWorldPoint));
          if GeometryCalc.PointInPolyRegion(AWorldRect.TopLeft,AMeta.PolyRegion.Count,SubPoints,Points) or
            GeometryCalc.PointInPolyRegion(AWorldRect.BottomRight,AMeta.PolyRegion.Count,SubPoints,Points) or
            GeometryCalc.PointInPolyRegion(POINT(AWorldRect.Left,AWorldRect.Bottom),AMeta.PolyRegion.Count,SubPoints,Points) or
            GeometryCalc.PointInPolyRegion(POINT(AWorldRect.right,AWorldRect.top),AMeta.PolyRegion.Count,SubPoints,Points) or
            GeometryCalc.rectacrossPolyRegion(AWorldRect,AMeta.PolyRegion.Count,SubPoints,Points) then
            Result:=True;
        end;

      end;
    end;
  end;
end;
end;

function TSelection.SelectMeta(AnEllipse: TWorldRect; Ellipse: Boolean;
  AMeta: PMetaStruct;StaticStart:integer): Boolean;
var
//  WorldFury,WorldLength:integer ;
  FontPixel:Integer;
  NewOutbox:TWorldRect;
//  Points:TWorldPointAry;
  SubPoints:TIntegerDynArray;
  PointLength:Integer;
//  Polygons: TWorldPolyRegionCalc;
  i,j:Integer;
  objPoint,P1,P2:TWorldPoint;
  startpoint,endpoint:TWorldPoint;
  PointPosition:Integer;
  APoints:TWorldPointAry;
  APolyRegion: TWorldPolyRegionCalc;
begin
  Result:=False;
  case FSelectType of
    stContaintSelect :
    begin //����ѡ��
      case AMeta._Type of
        _Symbol: //����
        begin
          FontPixel:= round(-1*GraphDraw.GetFontHeigth(AMeta.Symbol.CustomSymbol.Size)
            /2*FDrawCood.getrealScale); //����������ظ߶�
          //��������ڵ�ǰ���������µ��������
          NewOutBox.Xmin:=AMeta.Symbol.Position.x-FontPixel;
          NewOutBox.XMax:=AMeta.Symbol.Position.x+FontPixel;
          NewOutBox.ymin:=AMeta.Symbol.Position.y-FontPixel;
          NewOutBox.yMax:=AMeta.Symbol.Position.y+FontPixel;
          if GeometryCalc.RectInRect(NewOutbox,AnEllipse) then
            Result:=GeometryCalc.PointInEllipse(AMeta.Symbol.Position,AnEllipse);
        end;
        _Line:
        begin
          //����߶��ڵ�ǰ���������µ��������
          NewOutBox:=AMeta.Outbox;
          if GeometryCalc.RectInRect(NewOutbox,AnEllipse) then
          Result:=GeometryCalc.PointInEllipse(AMeta.Line.SP,AnEllipse)
            and GeometryCalc.PointInEllipse(AMeta.Line.EP,AnEllipse)
        end;
        _Text: //�ı�
        begin
          //����ı��ڵ�ǰ���������µ��������
          NewOutBox:=AMeta.Outbox;
          if GeometryCalc.RectInRect(NewOutbox,AnEllipse) then
          begin
            P1:=Point(AMeta.Outbox.Right,AMeta.Outbox.Top);
            P2:=Point(AMeta.Outbox.Left,AMeta.Outbox.Bottom);
            Result:=GeometryCalc.PointInEllipse(AMeta.Outbox.TopLeft,AnEllipse)
              and GeometryCalc.PointInEllipse(AMeta.Outbox.BottomRight,AnEllipse)
              and GeometryCalc.PointInEllipse(p1,AnEllipse)
              and GeometryCalc.PointInEllipse(p2,AnEllipse);
          end;
        end;
        _PolyLine:  //������
        begin
          //����������ڵ�ǰ���������µ��������
          NewOutBox:=AMeta.Outbox;
          if GeometryCalc.RectInRect(NewOutbox,AnEllipse) then
          begin
            SetLength(SubPoints,AMeta.Polyline.Count);
            copymemory(@subpoints[0],pointer(AMeta.Polyline.SPWAddress),AMeta.Polyline.Count*SizeOf(Integer));
            PointLength:=SumInt(SubPoints);//�������
            for i:=0 to PointLength-1 do
            begin
              CopyMemory(@objpoint,pointer(AMeta.Polyline.PWAddress+i*sizeof(objpoint)),sizeof(objPoint));
              Result :=GeometryCalc.PointInEllipse(objPoint,AnEllipse);
              if not Result then
                break;
            end;
          end;
        end;
        _Rect: //����,դ��ͼ
        begin
          //��������ڵ�ǰ���������µ��������
          NewOutBox:=AMeta.Outbox;
          if GeometryCalc.RectInRect(NewOutbox,AnEllipse) then
          begin
            P1:=Point(AMeta.Outbox.Right,AMeta.Outbox.Top);
            P2:=Point(AMeta.Outbox.Left,AMeta.Outbox.Bottom);
            Result:=GeometryCalc.PointInEllipse(AMeta.Outbox.TopLeft,AnEllipse)
              and GeometryCalc.PointInEllipse(AMeta.Outbox.BottomRight,AnEllipse)
              and GeometryCalc.PointInEllipse(p1,AnEllipse)
              and GeometryCalc.PointInEllipse(p2,AnEllipse);
          end;
        end;
        _PolyRegion:
        begin
          //��������ڵ�ǰ���������µ��������
          NewOutBox:=AMeta.Outbox;
          if GeometryCalc.RectInRect(NewOutbox,AnEllipse) then
          begin
            SetLength(SubPoints,AMeta.PolyRegion.Count);
            copymemory(@subpoints[0],pointer(AMeta.PolyRegion.SPWAddress),AMeta.PolyRegion.Count*SizeOf(Integer));
            PointLength:=SumInt(SubPoints);//�������
            for i:=0 to PointLength-1 do
            begin
              CopyMemory(@objpoint,pointer(AMeta.PolyRegion.PWAddress+i*sizeof(objpoint)),sizeof(objPoint));
              Result :=GeometryCalc.PointInEllipse(objPoint,AnEllipse);
              if not Result then
                break;
            end;

          end;
        end;
      end;
    end;
    stCrossSelect://�ཻѡ��
    begin
      case AMeta._Type of
        _Symbol:
        begin
          FontPixel:= round(-1*GraphDraw.GetFontHeigth(AMeta.Symbol.CustomSymbol.Size)
            /2*FDrawCood.getrealScale); //����������ظ߶�
          //��������ڵ�ǰ���������µ��������
          NewOutBox.Xmin:=AMeta.Symbol.Position.x-FontPixel;
          NewOutBox.XMax:=AMeta.Symbol.Position.x+FontPixel;
          NewOutBox.ymin:=AMeta.Symbol.Position.y-FontPixel;
          NewOutBox.yMax:=AMeta.Symbol.Position.y+FontPixel;
          if GeometryCalc.RectAcross(NewOutbox,AnEllipse) then
            Result:=GeometryCalc.PointInEllipse(AMeta.Symbol.Position,AnEllipse);
        end;
        _Line:
        begin
          //����߶��ڵ�ǰ���������µ��������
          NewOutBox:=AMeta.Outbox;
          if GeometryCalc.RectAcross(NewOutbox,AnEllipse) then
          Result:=GeometryCalc.LineAcrossEllipse(AMeta.Line.SP,AMeta.Line.EP,AnEllipse)
        end;
        _PolyLine:
        begin
          //����߶��ڵ�ǰ���������µ��������
          NewOutBox:=AMeta.Outbox;
          if GeometryCalc.RectAcross(NewOutbox,AnEllipse) then
          begin
            SetLength(SubPoints,AMeta.Polyline.Count);
            copymemory(@subpoints[0],pointer(AMeta.Polyline.SPWAddress),AMeta.Polyline.Count*SizeOf(Integer));
            PointPosition :=0;
            for i:=0 to AMeta.Polyline.Count-1 do
            begin
              for j:=0 to subpoints[i]-2 do
              begin
                CopyMemory(@startpoint,Pointer(AMeta.Polyline.PWAddress+PointPosition*SizeOf(startpoint)),SizeOf(startpoint));
                CopyMemory(@Endpoint,Pointer(AMeta.Polyline.PWAddress+(PointPosition+1)*SizeOf(Endpoint)),SizeOf(Endpoint));
                Result:=GeometryCalc.LineAcrossEllipse(startpoint,endpoint,AnEllipse);

                if Result then
                  break;
                PointPosition:=PointPosition+1;
              end;
              if Result then
                Break;
              PointPosition:=PointPosition+2;
            end;
          end;
        end;
        _Rect: //����,դ��ͼ
        begin
          NewOutBox:=AMeta.Outbox;
          if GeometryCalc.RectAcross(NewOutbox,AnEllipse) then
          begin
            setlength(Apoints,5);
            APoints[0].x:=AMeta.Outbox.Left;
            APoints[0].y:=AMeta.Outbox.Top;
            APoints[1].x:=AMeta.Outbox.Right;
            APoints[1].y:=AMeta.Outbox.Top;
            APoints[2].x:=AMeta.Outbox.Right;
            APoints[2].y:=AMeta.Outbox.Bottom;
            APoints[3].x:=AMeta.Outbox.Left;
            APoints[3].y:=AMeta.Outbox.Bottom;
            APoints[4].x:=AMeta.Outbox.Left;
            APoints[4].y:=AMeta.Outbox.Top;
            Result:=GeometryCalc.PolygonAcrossEllipse(APoints,AnEllipse);
          end;
        end;
        _RoundRect:
        begin
        end;
        _PolyRegion:
        begin
          NewOutBox:=AMeta.Outbox;
          if GeometryCalc.RectAcross(NewOutbox,AnEllipse) then
          begin
            APolyRegion := TWorldPolyRegionCalc.Create;
            try
              APolyRegion.LoadFromStream(AMeta.PolyRegion,StaticStart);
              for i:=0 to APolyRegion.Count-1 do
              begin
                Result:=GeometryCalc.PolygonAcrossEllipse(APolyRegion.Polygons[i],AnEllipse);
                if Result then
                  break;
              end;
            finally
              APolyRegion.Free;
            end;
          end;
        end;
      end;
    end;
  end;
end;
end.
