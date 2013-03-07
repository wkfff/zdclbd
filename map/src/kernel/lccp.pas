unit lccp;

{**********************************************************************
 lamber conformal conic

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
  Classes, SysUtils, Math, projectors, aasincos;

  procedure lcc(P: TGeoConvert; init:boolean);    // Lambert Conformal Conic

implementation

const
  EPS10	   = 1.E-10;

function e_forward(lp: TLP; const P: TGeoConvert): TXY; (* ellipsoid & spheroid *)
var
  xy: TXY;
  tmp: double;
begin
	if abs(abs(lp.phi) - HALFPI) < EPS10 then
   begin
		if (lp.phi * P.n) <= 0 then
      begin
         P.pj_errno := -20;
         result:= xy;
         exit;
      end;
		P.rho := 0;
  end else
  begin
     if P.ellips then
        tmp:= power(pj_tsfn(lp.phi, sin(lp.phi), P.e), P.n)
     else
        tmp:= power(tan(FORTPI + 0.5 * lp.phi), -P.n);
		P.rho := P.c * tmp;
  end;
  lp.lam := lp.lam * P.n;
	xy.x := P.k0 * (P.rho * sin(lp.lam));
	xy.y := P.k0 * (P.rho0 - P.rho * cos(lp.lam));
  result:=xy;
end;

function e_inverse(xy:TXY; P: TGeoConvert): TLP; (* ellipsoid & spheroid *)
var
  lp: TLP;
begin
	xy.x := xy.x / P.k0;
	xy.y := xy.y / P.k0;
  xy.y := P.rho0 - xy.y;
  P.rho := hypot(xy.x, xy.y);
	if P.rho <> 0 then
   begin
		if P.n < 0 then
      begin
			P.rho:= -P.rho;
			xy.x := -xy.x;
			xy.y := -xy.y;
		end;
		if P.ellips then
      begin
        lp.phi := pj_phi2(power(P.rho / P.c, 1/P.n), P.e);
		  if lp.phi = HUGE_VAL then
        begin
           P.pj_errno := -20;
           result:= lp;
           exit;
        end;
		end else
			lp.phi := 2 * arctan(power(P.c / P.rho, 1/P.n)) - HALFPI;
		lp.lam := arctan2(xy.x, xy.y) / P.n;
	end else
   begin
		lp.lam := 0;
     if P.n > 0 then lp.phi := HALFPI else lp.phi := -HALFPI;
	end;
	result:= lp;
end;

procedure factors(lp: TLP; P: TGeoConvert; var fac: TFACTORS);
var
  tmp: double;
begin
	if abs(abs(lp.phi) - HALFPI) < EPS10 then
   begin
		if (lp.phi * P.n) <= 0 then exit;
		P.rho := 0;
	end else
   begin
     if P.ellips then
        tmp:= power(pj_tsfn(lp.phi, sin(lp.phi),P.e), P.n)
     else
        tmp:= power(tan(FORTPI + 0.5 * lp.phi), -P.n);
		P.rho := P.c * tmp;
  end;
  fac.code := fac.code or (IS_ANAL_HK + IS_ANAL_CONV);
  fac.h := P.k0 * P.n * P.rho / pj_msfn(sin(lp.phi), cos(lp.phi), P.es);
  fac.k := fac.h;
  fac.conv := -P.n * lp.lam;
end;

procedure lcc(P: TGeoConvert; init:boolean);
var
	cosphi, sinphi: double;
	secant: boolean;
  ml1, m1, tmp : double;
begin
  if init then begin
   P.fwd:=nil;
   P.inv:= nil;
   exit;
  end;

	P.phi1 := P.pj_param.asradians('lat_1');
	if P.pj_param.defined('lat_2') then
		P.phi2 := P.pj_param.asradians('lat_2')
	else
   begin
		P.phi2 := P.phi1;
		if not P.pj_param.defined('lat_0') then
			P.phi0 := P.phi1;
	end;
	if abs(P.phi1 + P.phi2) < EPS10 then
   begin
     P.pj_errno:= -21;
     exit;
  end;
  sinphi := sin(P.phi1);
  P.n := sinphi;
  cosphi := cos(P.phi1);
  secant := abs(P.phi1 - P.phi2) >= EPS10;
  P.ellips := P.es <> 0;
  if P.ellips then
  begin
     P.e := sqrt(P.es);
     m1 := pj_msfn(sinphi, cosphi, P.es);
     ml1 := pj_tsfn(P.phi1, sinphi, P.e);
     if secant then
     begin (* secant cone *)
       sinphi := sin(P.phi2);
        P.n := ln(m1 / pj_msfn(sinphi, cos(P.phi2), P.es));
        P.n := P.n / ln(ml1 / pj_tsfn(P.phi2, sinphi, P.e));
     end;
    P.rho0 := m1 * power(ml1, -P.n) / P.n;
     P.c := P.rho0;
    if abs(abs(P.phi0) - HALFPI) < EPS10 then
       tmp:= 0
    else
       tmp:= power(pj_tsfn(P.phi0, sin(P.phi0), P.e), P.n);
     P.rho0 := P.rho0 * tmp;
  end else
  begin
     if secant then
        P.n := ln(cosphi / cos(P.phi2)) /
           ln(tan(FORTPI + 0.5 * P.phi2) /
           tan(FORTPI + 0.5 * P.phi1));
     P.c := cosphi * power(tan(FORTPI + 0.5 * P.phi1), P.n) / P.n;
    if abs(abs(P.phi0) - HALFPI) < EPS10 then
       tmp:=0
    else
       tmp:= P.c * power(tan(FORTPI + 0.5 * P.phi0), -P.n);
     P.rho0 := tmp;
  end;
  P.inv := @e_inverse;
  P.fwd := @e_forward;
  P.spc := @factors;

end;

end.
