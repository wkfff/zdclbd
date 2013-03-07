unit CarRouteUnit;
//车行驶路线类

interface
uses Types ;

procedure GetPoint(A:TPoint;B:TPoint;var OutA1:TPoint;var OutA2:TPoint;
                                    var OutB1:TPoint;var OutB2:TPoint; Distance:longint);


implementation
{
已知两点A(x1,y1)  B(x2,y2);
斜率k1=(y2-y1)/(x2-x1);
直接方程:y-y1=k1(x-x1);
垂直方程:y-y1=(-1/k1)(x-x1);
Distance距离
k2=-k1;
k2=(y-y1)/(x-x1)

如下方程组:
|-(x-x1)^2+(y-y1)^2=a^2;
|
|-(y-y1)/(x-x1)=k2;

设(x-x1)=Q  (y-y1)=P

|-Q^2+P^2=a^2;
|
|-P/Q=k2;

Q=(-+)sqrt(Distance^2/(1+k2^2))


x=(-+)sqrt(Distance^2/(1+k2^2))
y=k2(x-x1)+y2
}

procedure GetPoint(A:TPoint;B:TPoint;var OutA1:TPoint;var OutA2:TPoint;
                                    var OutB1:TPoint;var OutB2:TPoint; Distance:longint);
var
  k1,k2:longint;
  temp:Extended;
begin
  k1:=round((b.Y-a.Y)/(b.X-a.X));
  k2:=round(-1/k1);
  temp:=Sqrt((Distance*Distance)/(1+k2*k2));
  OutA1.X:=round(temp+A.X);
  OutA2.X:=round(-temp+A.X);

  OutA1.Y:=k2*(OutA1.X-A.X)+A.Y;

  OutA2.Y:=k2*(OutA2.X-A.X)+A.Y;

  OutB1.X:=round(temp+B.X);
  OutB2.X:=round(-temp+B.X);
  OutB1.Y:=k2*(OutA1.X-B.X)+B.Y;
  OutB2.Y:=k2*(OutA2.X-B.X)+B.Y;
end;


end.
