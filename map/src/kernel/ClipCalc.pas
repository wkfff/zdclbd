unit ClipCalc;

interface
uses
  Windows,MetaDefine,Types;

type

  GisClip=class
  private
    class function Liang_BarskeyClip(Xmin,Xmax,Ymin, Ymax: Integer;var P1, P2: TPoint):Boolean;
  public
      {������Ļ����ϵ���߶βü�}
    class function ClipScreenLine(ClipRect:TRect;StartPoint,EndPoint:TPoint;
      var StartPointClip,EndPointClip:TPoint):Boolean;overload;
    {������Ļ����ϵ���߶βü�,ѡ���㷨Ϊ���Ѷ�-Berskey�㷨}
    class function ClipScreenLine(ClipRect:TRect;var StartPoint,EndPoint:TPoint):Boolean;overload;

    {������Ļ����ϵ�Ķ����߲ü�,���޸�ȫ���������,�Է���һ�����϶�����<br>
      ע��,����Ķ����ߵ������뱣֤�Ͳü����н���}
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
  CurrentP:Integer;//��ǰ����ָ��
  ClippedPoint1,ClippedPoint2:TPoint;
  //�������,һ��N����������߶�,�������µĻᱻ�ü�Ϊ����2N-2���ڵ�,N-1���߶εĶ�����
  //���,�ܹ�����N���˵�,M�������߶�,�������µĻᱻ�ü�Ϊ����2N-2*M���ڵ�,N-M���߶εĶ�����
  ResultPoints:TWorldPointAry;
  ResultSubPoly:TIntegerDynArray;
  ResultCurrentP:Integer;//��ǰ�������ָ��
  ResultSubPolyP:Integer;//��ǰ������ָ��
  function EqualPoint(P1,P2:TPoint):Boolean;
  begin
    Result:=(P1.X =P2.X) and (P1.Y=P2.Y);
  end;
  procedure  AddLine(P1,P2:TPoint);
  begin
    if (ResultCurrentP<>-1) and (ResultSubPolyP<>-1) and
      EqualPoint(ResultPoints[ResultCurrentP],P1) then //��β������Ϊ�׵�
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
  //���ý��������
  for i:=0 to PolyCount-1 do
  begin
    CurrentP:=CurrentP+SubPoly[i];
  end;
  SetLength(ResultPoints,2*(CurrentP-PolyCount));
  SetLength(ResultSubPoly,CurrentP-PolyCount);
  ResultSubPolyP:=-1;
  ResultCurrentP:=-1;

  CurrentP:=0;
  //������������
  for i:=0 to PolyCount-1 do
  begin
    for j:=0 to SubPoly[i]-2 do
    begin
      if not EqualPoint(Points[CurrentP],Points[CurrentP+1])     //����ȥ���ظ���
        and ClipScreenLine(ClipRect,Points[CurrentP],Points[CurrentP+1],ClippedPoint1,ClippedPoint2) then
      //�ü��н��
      begin
        //��Ӹ��߶ε��������
        AddLine(ClippedPoint1,ClippedPoint2);
      end;
      CurrentP:=CurrentP+1;//�ƶ�����ָ��
    end;
    CurrentP:=CurrentP+1;//�ƶ�����ָ��
  end;

  if ResultCurrentP<>-1 then
  begin
    //���ƽ�����鵽ԭ����
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

