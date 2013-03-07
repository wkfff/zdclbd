unit ClipCalc;

interface
uses
  Windows,MetaDefine,Types;

type

  GisClip=class
  private
    class function Liang_BarskeyClip(Xmin,Xmax,Ymin, Ymax: Integer;var P1, P2: TPoint):Boolean;
  public
      {基于屏幕坐标系的线段裁剪}
    class function ClipScreenLine(ClipRect:TRect;StartPoint,EndPoint:TPoint;
      var StartPointClip,EndPointClip:TPoint):Boolean;overload;
    {基于屏幕坐标系的线段裁剪,选用算法为梁友栋-Berskey算法}
    class function ClipScreenLine(ClipRect:TRect;var StartPoint,EndPoint:TPoint):Boolean;overload;

    {基于屏幕坐标系的多义线裁剪,会修改全部传入参数,以返回一条复合多义线<br>
      注意,传入的多义线的外框必须保证和裁剪区有交点}
    class function ClipPolyPolyLine(ClipRect:TRect;var PolyCount:Integer;var SubPoly:TIntegerDynArray;
      var Points:TWorldPointAry):Boolean;
  end;
implementation
uses math;





class function GisClip.ClipPolyPolyLine(ClipRect: TRect;
  var PolyCount: Integer; var SubPoly: TIntegerDynArray;
  var Points: TWorldPointAry): Boolean;
var
  i,j:Integer;
  CurrentP:Integer;//当前数组指针
  ClippedPoint1,ClippedPoint2:TPoint;
  //结果数组,一根N个点的连续线段,最差情况下的会被裁剪为具有2N-2个节点,N-1条线段的多义线
  //因此,总共具有N个端点,M条连续线段,最差情况下的会被裁剪为具有2N-2*M个节点,N-M条线段的多义线
  ResultPoints:TWorldPointAry;
  ResultSubPoly:TIntegerDynArray;
  ResultCurrentP:Integer;//当前结果数组指针
  ResultSubPolyP:Integer;//当前子数组指针
  function EqualPoint(P1,P2:TPoint):Boolean;
  begin
    Result:=(P1.X =P2.X) and (P1.Y=P2.Y);
  end;
  procedure  AddLine(P1,P2:TPoint);
  begin
    if (ResultCurrentP<>-1) and (ResultSubPolyP<>-1) and
      EqualPoint(ResultPoints[ResultCurrentP],P1) then //首尾相连或为首点
    begin
      ResultSubPoly[ResultSubPolyP]:=ResultSubPoly[ResultSubPolyP]+1;
      ResultCurrentP:=ResultCurrentP+1;
      ResultPoints[ResultCurrentP]:=P2;
    end
    else
    begin
      ResultSubPolyP:=ResultSubPolyP+1;
      ResultSubPoly[ResultSubPolyP]:=2;
      ResultPoints[ResultCurrentP+1]:=P1;
      ResultPoints[ResultCurrentP+2]:=P2;
      ResultCurrentP:=ResultCurrentP+2;
    end;
  end;
begin
  Result:=false;
  CurrentP:=0;
  //设置结果集长度
  for i:=0 to PolyCount-1 do
  begin
    CurrentP:=CurrentP+SubPoly[i];
  end;
  SetLength(ResultPoints,2*(CurrentP-PolyCount));
  SetLength(ResultSubPoly,CurrentP-PolyCount);
  ResultSubPolyP:=-1;
  ResultCurrentP:=-1;

  CurrentP:=0;
  //遍历整个数组
  for i:=0 to PolyCount-1 do
  begin
    for j:=0 to SubPoly[i]-2 do
    begin
      if not EqualPoint(Points[CurrentP],Points[CurrentP+1])     //考虑去除重复点
        and ClipScreenLine(ClipRect,Points[CurrentP],Points[CurrentP+1],ClippedPoint1,ClippedPoint2) then
      //裁剪有结果
      begin
        //添加该线段到结果数组
        AddLine(ClippedPoint1,ClippedPoint2);
      end;
      CurrentP:=CurrentP+1;//移动数组指针
    end;
    CurrentP:=CurrentP+1;//移动数组指针
  end;

  if ResultCurrentP<>-1 then
  begin
    //复制结果数组到原数组
    PolyCount:=ResultSubPolyP+1;

    SetLength(SubPoly,PolyCount);
    SubPoly:=Copy(ResultSubPoly,0,PolyCount);

    SetLength(Points,ResultCurrentP+1);
    Points:=Copy(ResultPoints,0,ResultCurrentP+1);

    Result:=True;
  end;
end;

class function GisClip.ClipScreenLine(ClipRect:TRect;StartPoint, EndPoint: TPoint;
  var StartPointClip, EndPointClip: TPoint): Boolean;

begin
  StartPointClip:=StartPoint;
  EndPointClip:=EndPoint;
  Result:=ClipScreenLine(ClipRect,StartPointClip,EndPointClip);
end;

class function GisClip.ClipScreenLine(ClipRect: TRect; var StartPoint,
  EndPoint: TPoint): Boolean;
begin
  Result:=Liang_BarskeyClip(ClipRect.Left,ClipRect.Right,ClipRect.Top,ClipRect.Bottom,
    StartPoint,EndPoint);
end;

class function GisClip.Liang_BarskeyClip(Xmin,  Xmax,Ymin, Ymax: Integer;
  var P1, P2: TPoint): Boolean;
var
  u1,u2:Double;
  dx,dy:Integer;
  function ClipTest(P,Q:Double;var u1,u2:Double):Boolean;
  var R:Double;
  begin
    Result:=True;
    if P<0 then
    begin
      R:=Q/P;
      if R>u2 then Result:=False
      else
        if R>u1 then u1:=R;
    end
    else
      if P>0 then
      begin
        R:=Q/P;
        if R<u1 then
          Result:=False
        else
          if R<u2 then u2:=R;
      end
      else
        if Q<0 then
          Result:=False;
  end;
begin

  u1:=0;
  u2:=1;
  dx:=P2.x-P1.x;
  Result:=False;
  if cliptest(-dx,P1.x-Xmin,u1,u2) then
    if cliptest(dx,Xmax-P1.x,u1,u2) then
    begin
      dy:=P2.y-P1.y;
      if cliptest(-dy,P1.y-Ymin,u1,u2) then
        if ClipTest(dy,Ymax-P1.y,u1,u2) then
        begin
          if u2<1 then
          begin
            P2.x:=P1.x+round(u2*dx);
            P2.y:=P1.y+round(u2*dy);
          end;
          if u1>0 then
          begin
            Inc(P1.x,round(u1*dx));
            Inc(P1.y,round(u1*dy));
          end;
          Result:=True;
        end;
    end;
end;

end.

