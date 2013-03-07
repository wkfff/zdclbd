unit aasincos;

{**********************************************************************
 helper routines

 No Warranty is given for this code by Ingenieria Construmap, S.A de C.V..
 Alterated from orginal C library to Delphi Pascal.  Provided "as is" and
 use at own risk. Copyright from original C file included below.  The below
 copyright license applies only to units containing this notice and does
 not apply or extend to other units, in part or in whole, created and
 copyrighted by Ingenieria Construmap, S.A. de C.V. that use or access
 functions or objects in this unit.

 We encourage you to enhance this code and contribute to others as in
 in the same manner we are doing. Please e-mail us all code enhancements
 you consider useful to other people (and to us, of course).

 Copyright (c) 2000, Frank Warmerdam
 Permission is hereby granted, free of charge, to any person obtaining a
 copy of this software and associated documentation files (the "Software"),
 to deal in the Software without restriction, including without limitation
 the rights to use, copy, modify, merge, publish, distribute, sublicense,
 and/or sell copies of the Software, and to permit persons to whom the
 Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included
 in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 DEALINGS IN THE SOFTWARE.
***************************************************************************** }
{$I proj_flag.inc}
interface

uses
   SysUtils, Math, projectors;

{ general procedures }

   procedure pj_enfn(P: TGeoConvert);
   function pj_mlfn(phi, sphi, cphi:double; P: TGeoConvert):double;
   function pj_inv_mlfn(arg:double; P: TGeoConvert):double;

   function pj_tsfn(phi, sinphi, e:double):double;
   function pj_qsfn(sinphi, e, one_es: double):double;
   function pj_msfn(sinphi, cosphi, es: double):double;
   function adjlon (const lon:double):double;
   function pj_phi2(const ts, e: double):double;
   function aacos(const v:double):double;
   function aasin(const v:double):double;
   function asqrt(const v:double):double;
   function aatan2(const n,d:double):double;

resourcestring
   //serr1=	'no arguments in initialization list'; future use
   //serr2=	'no options found in ''init'' file"';
   //serr3=	'no colon in init= string';
   //serr4=	'projection not named';
   //serr5=	'unknown projection id';
   //serr6=	'effective eccentricity = 1.0';
   //serr7=	'unknown unit conversion id';
   //serr8=	'invalid boolean param argument';
   //serr9=	'unknown elliptical parameter name';
   //serr10=	'reciprocal flattening (1/f) = 0';
   //serr11=	'|radius reference latitude| > 90';
   //serr12=	'squared eccentricity < 0';
   //serr13=	'major axis or radius = 0 or not given';
   //serr14=	'latitude or longitude exceeded limits';
   //serr15=	'invalid x or y';
   //serr16=	'improperly formed DMS value';
   //serr17=	'non-convergent inverse meridinal dist';
   serr18=	'non-convergent inverse phi2';
   serr19=	'acos/asin: |arg| >1.+1e-14';
   //serr20=	'tolerance condition error';
   //serr21=	'conic lat_1 = -lat_2';
   //serr22=	'lat_1 >= 90';
   //serr23=	'lat_1 = 0';
   //serr24=	'lat_ts >= 90';
   //serr25=	'no distance between control points';
   //serr26=	'projection not selected to be rotated';
   //serr27=	'W <= 0 or M <= 0';
   //serr28=	'lsat not in 1-5 range';
   //serr29=	'path not in range';
   //serr30=	'h <= 0';
   //serr31=	'k <= 0';
   serr32=	'lat_0 = 0 or 90 or alpha = 90';
   serr33=	'lat_1=lat_2 or lat_1=0 or lat_2=90';
   serr34=	'elliptical usage required';
   serr35=	'invalid UTM zone number';
   serr36=	'arg(s) out of range for Tcheby eval';
   //serr37=	'failed to find projection to be rotated';
   //serr38=	'failed to load NAD27-83 correction file';
   //serr39=	'both n & m must be spec''d and > 0';
   //serr40=	'n <= 0, n > 1 or not specified';
   //serr41=	'lat_1 or lat_2 not specified';
   //serr42=	'|lat_1| = |lat_2|';
   //serr43=	'lat_0 is pi/2 from mean lat';

   //projection dialog messages
   SToXY = 'X = %.4f, Y = %.4f';
   SToLatLong= 'Long = %.5n, Lat = %.5n';
   SToLatLongCaption= 'Test X,Y to Lon,Lat';

implementation

const
  ONE_TOL	= 1.00000000000001;
  TOL	      = 0.000000001;
  ATOL      = 1E-50;
  SPI		   = 3.14159265359;
  TWOPI	   = 6.2831853071795864769;
  ONEPI   =   3.14159265358979323846;
  HALFPI    = 1.5707963267948966;
  TOL2      = 1.0E-10;
  N_ITER    = 15;
  EPSILON   = 1.0E-7;
  C00       = 1.0;
  C02       = 0.25;
  C04       = 0.046875;
  C06       = 0.01953125;
  C08       = 0.01068115234375;
  C22       = 0.75;
  C44       = 0.46875;
  C46       = 0.01302083333333333333;
  C48       = 0.00712076822916666666;
  C66       = 0.36458333333333333333;
  C68       = 0.00569661458333333333;
  C88       = 0.3076171875;
  EPS       = 1E-11;
  MAX_ITER  = 10;

function adjlon (const lon:double):double;
begin

//Ô¼Êøµ½2 pi
  if Abs(lon)<= spi then
    Result:=lon
  else
  begin
    result:=lon+ONEPI;
    result:=frac(result/TWOPI);
    Result:=Result-ONEPI;
  end;

end;

// arc sin, cosine, tan2 and sqrt that will NOT fail
function aasin(const v:double):double;
var
  av:double;
begin
  av := abs(v);
	if av >= 1.0 then
   begin
		if av > ONE_TOL then
      begin
        raise Exception.Create(serr19);
        //pj_errno := -19;
        exit;
     end;
     if v<0 then result:=-HALFPI else result:= HALFPI;
     exit;
	end;
	result:= arcsin(v);
end;

function aacos(const v:double):double;
var
  av:double;
begin
  av:=abs(v);
	if av >= 1.0 then
   begin
		if av > ONE_TOL then
      begin
        raise Exception.Create(serr19);
        //pj_errno := -19;
        exit;
     end;
     if v < 0 then result:= PI else result:= 0;
     exit;
	end;
	result:= arccos(v);
end;

function asqrt(const v: double):double;
begin
 if v <= 0 then result:=0 else result:= sqrt(v);
end;

function aatan2(const n,d:double):double;
begin
  if (abs(n)<ATOL) and (abs(d)<ATOL) then result:=0 else result:= arctan2(n,d);
end;

function pj_phi2(const ts, e: double): double;
var
	eccnth, Phi, con, dphi:double;
	i:integer;
begin
	eccnth := 0.5 * e;
	Phi := HALFPI - 2 * arctan (ts);
	i := N_ITER;
	repeat
		con := e * sin (Phi);
		dphi := HALFPI - 2 * arctan (ts * power((1 - con) /
		   (1 + con), eccnth)) - Phi;
		Phi := Phi + dphi;
     Dec( i );
	until (abs(dphi) <= TOL2) or (i <= 0);
	if i <= 0 then
     raise Exception.Create(serr18);
		//pj_errno := -18;
	result := Phi;
end;


function pj_msfn(sinphi, cosphi, es: double):double;
begin
	result:= (cosphi / sqrt (1 - es * sinphi * sinphi));
end;


//---------------------------
function pj_qsfn(sinphi, e, one_es: double):double;
var
	con: double;
begin
	if e >= EPSILON then
   begin
		con := e * sinphi;
		result:= (one_es * (sinphi / (1 - con * con) -
		   (0.5 / e) * ln ((1 - con) / (1 + con))));
	end else
		result:= sinphi + sinphi;
end;


//---------------------------------------
function pj_tsfn(phi, sinphi, e:double):double;
begin
  sinphi := sinphi * e;
  result:= (tan (0.5 * (HALFPI - phi)) /
            power((1.0 - sinphi) / (1.0 + sinphi), 0.5 * e));
end;


//-------------------------------------------------------------------//
(* meridiOnal distance for ellipsoid and inverse
**	8th degree - accurate to < 1e-5 meters when used in conjunction
**		with typical major axis values.
**	Inverse determines phi to EPS (1e-11) radians, about 1e-6 seconds.
*)
procedure pj_enfn(P: TGeoConvert);
var
  t,es: double;
begin
  es:= P.es;
  P.en[0] := C00 - es * (C02 + es * (C04 + es * (C06 + es * C08)));
  P.en[1] := es * (C22 - es * (C04 + es * (C06 + es * C08)));
  t := es * es;
  P.en[2] := t * (C44 - es * (C46 + es * C48));
  t:= t * es;
  P.en[3] := t * (C66 - es * C68);
  P.en[4] := t * es * C88;
end;

function pj_mlfn(phi, sphi, cphi:double; P: TGeoConvert):double;
begin
	cphi := cphi * sphi;
	sphi := sphi * sphi;
	result:= (P.en[0] * phi - cphi * (P.en[1] + sphi*(P.en[2]
             + sphi*(P.en[3] + sphi*P.en[4]))));
end;

function pj_inv_mlfn(arg: double; P: TGeoConvert):double;
var
	s, t, phi, k, es:double;
	i:integer;
begin
  es:= P.es;
  k := 1.0/(1.0-es);

  phi := arg;
  for i := 1 to MAX_ITER do
  begin    (* rarely goes over 2 iterations *)
		s := sin(phi);
		t := 1.0 - es * s * s;
      t := (pj_mlfn(phi, s, cos(phi), P) - arg) * (t * sqrt(t)) * k;
		phi := phi - t;
		if abs(t) < EPS then
      begin
         result:= phi; exit;
      end;
	end;
	//pj_errno := -17;
	result := phi;
end;

end.
