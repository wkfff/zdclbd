unit aeap;

{**********************************************************************
 albers equal area

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
  Classes,SysUtils, Math, projectors,aasincos;

  procedure aea(P: TGeoConvert; init:boolean);       // Albers Equal Area
  procedure leac(P: TGeoConvert; init:boolean);      // Lambert Equal Area Conic

implementation

(* determine latitude angle phi-1 *)
const
   EPS10	      = 1.0E-10;
   TOL7	      = 1.0E-7;
   N_ITER      = 15;
   EPSILON     = 1.0E-7;
   TOL         = 1.0E-10;

function phi1_(const qs, Te, Tone_es:double):double;
var
	i: integer;
	Phi, sinpi, cospi, con, com, dphi: double;
begin
	Phi := arcsin(0.5 * qs);
	if Te < EPSILON then
   begin
     result:= Phi;
     exit;
   end;
	i := N_ITER;
	repeat
		sinpi := sin (Phi);
		cospi := cos (Phi);
		con := Te * sinpi;
		com := 1.0 - con * con;
		dphi := 0.5 * com * com / cospi * (qs / Tone_es -
		   sinpi / com + 0.5 / Te * ln ((1.0 - con) / (1.0 + con)));
		Phi := Phi + dphi;
	until (abs(dphi) <= TOL) or (i <=0);
  if i > 0 then result := Phi else result := HUGE_VAL;
end;

function e_forward(lp: TLP; P:TGeoConvert): TXY; (* ellipsoid & spheroid *)
var
  tmp:double;
  xy: TXY;
begin
  if P.ellips then
     tmp:= P.n * pj_qsfn(sin(lp.phi),P.e, P.one_es)
  else
     tmp:= P.n2 * sin(lp.phi);
  P.rho := P.c - tmp;
  if P.rho < 0 then
  begin
     P.pj_errno := -20;
     result := xy;
     exit;
  end;
  P.rho := P.dd * sqrt(P.rho);
  lp.lam := lp.lam * P.n;
  xy.x := P.rho * sin( lp.lam );
  xy.y := P.rho0 - P.rho * cos(lp.lam);
  result := xy;
end;

function e_inverse(xy: TXY; P: TGeoConvert): TLP; (* ellipsoid & spheroid *)
var
  lp: TLP;
begin
  xy.y := P.rho0 - xy.y;
  P.rho := hypot(xy.x, xy.y);
	if P.rho<>0 then
   begin
		if P.n < 0 then
      begin
			P.rho := -P.rho;
			xy.x := -xy.x;
			xy.y := -xy.y;
		end;
		lp.phi :=  P.rho / P.dd;
		if P.ellips then
      begin
			lp.phi := (P.c - lp.phi * lp.phi) / P.n;
			if abs(P.ec - abs(lp.phi)) > TOL7 then
         begin
           lp.phi := phi1_(lp.phi, P.e, P.one_es);
				if lp.phi= HUGE_VAL then
            begin
					P.pj_errno := -20; result:=lp; exit;
           end;
			end else
         begin
           if lp.phi <0 then lp.phi:= -HALFPI else lp.phi:= HALFPI;
         end;
		end;
     lp.phi := (P.c - lp.phi * lp.phi) / P.n2;
     if abs(lp.phi) <= 1 then
     begin
			lp.phi := arcsin(lp.phi);
		end else
      begin
        if lp.phi <0 then lp.phi:= -HALFPI else lp.phi:= HALFPI;
     end;
	  lp.lam := arctan2(xy.x, xy.y) / P.n;
	end else
   begin
	  lp.lam := 0;
     if P.n > 0 then lp.phi:= HALFPI else lp.phi:= -HALFPI;
	end;
	result:= lp;
end;

procedure setup(P: TGeoConvert);
var
  cosphi, sinphi: double;
  secant: boolean;
  ml1, m1: double;
  ml2, m2: double;
begin
  if abs(P.phi1 + P.phi2) < EPS10 then
  begin
    P.pj_errno := -21;
    exit;
  end;
  sinphi := sin(P.phi1);
  P.n := sinphi;
  cosphi := cos(P.phi1);
  secant := abs(P.phi1 - P.phi2) >= EPS10;
  P.ellips := P.es > 0;
	if P.ellips then
   begin
     pj_enfn(P);
		m1 := pj_msfn(sinphi, cosphi, P.es);
		ml1 := pj_qsfn(sinphi, P.e, P.one_es);
		if secant then
      begin (* secant cone *)
			sinphi := sin(P.phi2);
			cosphi := cos(P.phi2);
			m2 := pj_msfn(sinphi, cosphi, P.es);
			ml2 := pj_qsfn(sinphi, P.e, P.one_es);
			P.n := (m1 * m1 - m2 * m2) / (ml2 - ml1);
		end;
		P.ec := 1 - 0.5 * P.one_es * ln((1 - P.e) /
			(1 + P.e)) / P.e;
		P.c := m1 * m1 + P.n * ml1;
		P.dd := 1 / P.n;
		P.rho0 := P.dd * sqrt(P.c - P.n * pj_qsfn(sin(P.phi0),
			P.e, P.one_es));
	end else
   begin
		if secant then P.n := 0.5 * (P.n + sin(P.phi2));
		P.n2 := P.n + P.n;
		P.c := cosphi * cosphi + P.n2 * sinphi;
		P.dd := 1 / P.n;
		P.rho0 := P.dd * sqrt(P.c - P.n2 * sin(P.phi0));
	end;
	P.inv := @e_inverse;
   P.fwd := @e_forward;
end;

procedure aea(P: TGeoConvert; init:boolean);
begin
  if init then
  begin
   P.fwd:= nil;
   P.inv:= nil;
   exit;
  end;

  P.phi1 := P.pj_param.AsRadians('lat_1');
  P.phi2 := P.pj_param.AsRadians('lat_2');

  Setup(P);
end;

procedure leac(P: TGeoConvert; init:boolean);
begin
  if init then
  begin
     P.fwd:=nil;
     P.inv:= nil;
     exit;
  end;

  P.phi2 := P.pj_param.asradians('lat_1');
  if P.pj_param.AsBoolean('south') then
     P.phi1 := -HALFPI
  else
     P.phi1 :=  HALFPI;

  Setup(P);
end;

end.
