unit tmercp;

{**********************************************************************
 mercator projections

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

  procedure tmerc(P: TGeoConvert; init: boolean);     // Transverse Mercator
  procedure utm(P: TGeoConvert; init: boolean);       // Universal Transverse Mercator (UTM)
  procedure omerc(P: TGeoConvert; init: boolean);     // Oblique mercator

implementation

const
  EPS10   = 1.E-10;
  FC1     = 1.0;
  FC2     = 0.5;
  FC3     = 0.16666666666666666666;
  FC4     = 0.08333333333333333333;
  FC5     = 0.05;
  FC6     = 0.03333333333333333333;
  FC7     = 0.02380952380952380952;
  FC8     = 0.01785714285714285714;

function e_forward(lp: TLP; P:TGeoConvert): TXY; // ellipse
var
  xy: TXY;
	al, als, n, cosphi, sinphi, t:double;
begin
	sinphi := sin(lp.phi); cosphi := cos(lp.phi);
  if abs(cosphi)>1e-10 then t:=sinphi/cosphi else t:=0;
	t := t*t;
	al := cosphi * lp.lam;
	als := al * al;
	al := al/sqrt(1.0- P.es * sinphi * sinphi);
	n := P.esp * cosphi * cosphi;
	xy.x := P.k0 * al * (FC1 +
		FC3 * als * (1.0- t + n +
		FC5 * als * (5.0+ t * (t - 18) + n * (14.0- 58.0* t)
		+ FC7 * als * (61.0+ t * ( t * (179.0- t) - 479.0) )
		)));
	xy.y := P.k0 * (pj_mlfn(lp.phi, sinphi, cosphi, P) - P.ml0 +
		sinphi * al * lp.lam * FC2 * ( 1.0+
		FC4 * als * (5.0- t + n * (9.0 + 4.0* n) +
		FC6 * als * (61.0+ t * (t - 58.0) + n * (270.0- 330 * t)
		+ FC8 * als * (1385.0+ t * ( t * (543.0 - t) - 3111.0) )
		))));
	result:=xy;
end;

function s_forward(lp: TLP; P: TGeoConvert): TXY; // spheroid
var
  xy: TXY;
	b, cosphi:double;
begin
  cosphi := cos(lp.phi);
	b := cosphi * sin(lp.lam);
	if abs(abs(b) - 1.0) <= EPS10 then
   begin
      P.pj_errno := -20; result:= xy;
   end;
	xy.x := P.ml0 * ln((1.0+ b) / (1.0- b));    //falta checar funcion log
  xy.y := cosphi * cos(lp.lam) / sqrt(1.0- b * b);
  b := abs( xy.y );
	if b >= 1.0 then
   begin
		if (b - 1.0) > EPS10 then
      begin
         P.pj_errno := -20; result:=xy;
      end
		else xy.y := 0.0;
	end else
		xy.y := arccos(xy.y);
	if lp.phi < 0 then xy.y := -xy.y;
	xy.y := P.esp * (xy.y - P.phi0);
	result:=xy;
end;

function e_inverse(xy:TXY; P: TGeoConvert): TLP; // ellipsoid
var
  lp: TLP;
	n, con, cosphi, d, ds, sinphi, t:double;
begin
	lp.phi := pj_inv_mlfn(P.ml0 + xy.y / P.k0, P);
	if abs(lp.phi) >= HALFPI then
   begin
     if xy.y < 0.0 then lp.phi := -HALFPI else lp.phi := HALFPI;
		lp.lam := 0.0;
	end else
   begin
		sinphi := sin(lp.phi);
		cosphi := cos(lp.phi);
     if abs(cosphi) > 1e-10 then t:=sinphi/cosphi else t:=0;
		n := P.esp * cosphi * cosphi;
     con := 1.0- P.es * sinphi * sinphi;
		d := xy.x * sqrt(con) / P.k0;
		con := con*t;
		t := t*t;
		ds := d * d;
		lp.phi := lp.phi-(con * ds / (1.0-P.es)) * FC2 * (1.0 -
			ds * FC4 * (5.0 + t * (3.0 - 9.0 *  n) + n * (1.0 - 4 * n) -
			ds * FC6 * (61.0 + t * (90.0 - 252.0 * n +
				45.0 * t) + 46.0 * n
		   - ds * FC8 * (1385.0 + t * (3633.0 + t * (4095.0 + 1574.0 * t)) )
			)));
		lp.lam := d*(FC1 -
			ds*FC3*( 1.0+ 2.*t + n -
			ds*FC5*(5.0+ t*(28.0+ 24.0*t + 8.*n) + 6.0*n
		   - ds * FC7 * (61.0+ t * (662.0+ t * (1320.0+ 720.0* t)) )
		))) / cosphi;
	end;
	result:=lp;
end;

function s_inverse(xy:TXY; P: TGeoConvert): TLP; // sphere
var
  lp: TLP;
	h, g:double;
begin
	h := exp(xy.x / P.esp);
	g := 0.5 * (h - 1.0/ h);
	h := cos(P.phi0 + xy.y / P.esp);
	lp.phi := arcsin(sqrt((1.0- h * h) / (1.0+ g * g)));
	if xy.y < 0 then lp.phi := -lp.phi;
  if (g<>0) and (h<>0) then lp.lam:= arctan2(g,h) else lp.lam:=0;
	result:=lp;
end;

procedure setup(P: TGeoConvert);
begin
	if P.es <> 0 then
   begin
    pj_enfn(P);
		P.ml0 := pj_mlfn(P.phi0, sin(P.phi0), cos(P.phi0), P);
		P.esp := P.es / (1.0- P.es);
		P.inv := @e_inverse;
		P.fwd := @e_forward;
	end else
   begin
		P.esp := P.k0;
		P.ml0 := 0.5 * P.esp;
		P.inv := @s_inverse;
		P.fwd := @s_forward;
	end;
end;

procedure tmerc(P: TGeoConvert; init:boolean);
begin
  if init then begin
    P.fwd:=nil;
    P.inv:= nil;
    exit;
  end;

  setup( P );
end;

procedure utm(P: TGeoConvert; init: boolean);
var
	zone:integer;
begin
  if init then begin
     P.fwd:= nil;
     P.inv:= nil;
     exit;
  end;

  if p.es = 0 then raise Exception.Create(SErr34);
  if P.pj_param.asboolean('south') then p.y0:= 10000000.0 else p.y0:=0;
  p.x0 := 500000.;
  if P.pj_param.defined('zone') then
  begin //* zone input ? */
     zone := P.pj_param.asinteger('zone');
     if (zone > 0) and (zone <= 60) then
        Dec(zone)
     else
        raise Exception.Create(SErr35);
  end else
  begin //* nearest central meridian input */
     zone := floor((adjlon(P.lam0) + PI) * 30. / PI);
     if zone < 0 then
        zone := 0
     else if zone >= 60 then
        zone := 59;
  end;
  p.lam0 := (zone + 0.5) * PI / 30.0 - PI;
  p.k0 := 0.9996;
  p.phi0 := 0.0;

  setup(P);
end;


{ oblique mercator }
const TOL	= 1.e-7;
const EPS	= 1.e-10;

function TSFN0(const x: double): double;
begin
  result:= tan(0.5 * (HALFPI - x));
end;

function omerc_forward(lp: TLP; P:TGeoConvert): TXY; // ellipsoid & spheroid */
var
	con, q, s, ul, us, vl, vs, temp: double;
  xy: TXY;
begin
	vl := sin(P.bl * lp.lam);
	if (abs(abs(lp.phi) - HALFPI) <= EPS) then
  begin
    if lp.phi < 0 then ul:= -P.singam else ul:= P.singam;
		us := P.al * lp.phi / P.bl;
	end else
  begin
    if P.ellips then
      temp:= power(pj_tsfn(lp.phi, sin(lp.phi), P.e), P.bl)
    else
      temp:= TSFN0(lp.phi);
		q := P.el / temp;
		s := 0.5 * (q - 1 / q);
		ul := 2 * (s * P.singam - vl * P.cosgam) / (q + 1 / q);
		con := cos(P.bl * lp.lam);
		if (abs(con) >= TOL) then
    begin
			us := P.al * arctan((s * P.cosgam + vl * P.singam) / con) / P.bl;
			if (con < 0) then
				us := us + PI * P.al / P.bl;
		end else
			us := P.al * P.bl * lp.lam;
	end;
	if (abs(abs(ul) - 1) <= EPS) then exit;//F_ERROR;
	vs := 0.5 * P.al * ln((1 - ul) / (1 + ul)) / P.bl;    // falta checar si log = ln
	us := us - P.u_0;
	if P.rot then
  begin
		xy.x := us;
		xy.y := vs;
	end else
  begin
		xy.x := vs * P.cosrot + us * P.sinrot;
		xy.y := us * P.cosrot - vs * P.sinrot;
	end;
	result:= xy;
end;

function omerc_inverse(xy:TXY; P: TGeoConvert): TLP; // ellipsoid & spheroid */
var
	q, s, ul, us, vl, vs: double;
  lp: TLP;
begin
	if P.rot then
  begin
		us := xy.x;
		vs := xy.y;
	end else
  begin
		vs := xy.x * P.cosrot - xy.y * P.sinrot;
		us := xy.y * P.cosrot + xy.x * P.sinrot;
	end;
	us := us + P.u_0;
	q := exp(-P.bl * vs / P.al);
	s := 0.5 * (q - 1 / q);
	vl := sin(P.bl * us / P.al);
	ul := 2 * (vl * P.cosgam + s * P.singam) / (q + 1 / q);
	if (abs(abs(ul) - 1) < EPS) then
  begin
		lp.lam := 0;
    if ul < 0 then lp.phi := -HALFPI else lp.phi := HALFPI;
	end else
  begin
		lp.phi := P.el / sqrt((1 + ul) / (1 - ul));
		if P.ellips then
    begin
      lp.phi := pj_phi2(power(lp.phi, 1 / P.bl), P.e);
			if (lp.phi = HUGE_VAL) then exit; // I_ERROR;
		end else
			lp.phi := HALFPI - 2 * abs(lp.phi);
		lp.lam := -aatan2((s * P.cosgam - vl * P.singam), cos(P.bl * us / P.al)) / P.bl;
	end;
	result:= lp;
end;


procedure omerc(P: TGeoConvert; init:boolean);
var
	con, com, cosph0, d, f, h, l, sinph0, pd, j: double;
	azi: boolean;
begin
	P.rot	:= P.pj_param.asboolean('no_rot')=false;
  azi:= P.pj_param.defined('alpha');
  if azi then
  begin
		P.lamc	:= P.pj_param.asradians('lonc');
		P.alpha	:= P.pj_param.asradians('alpha');
		if ((abs(P.alpha) <= TOL) or
			(abs(abs(P.phi0) - HALFPI) <= TOL) or
			(abs(abs(P.alpha) - HALFPI) <= TOL)) then
      raise Exception.Create(SErr32);
			//E_ERROR(-32);
	end else
  begin
		P.lam1 := P.pj_param.asradians('lon_1');
		P.phi1 := P.pj_param.asradians('lat_1');
		P.lam2 := P.pj_param.asradians('lon_2');
		P.phi2	:= P.pj_param.asradians('lat_2');
    con := abs(P.phi1);
		if ((abs(P.phi1 - P.phi2) <= TOL) or
			(con <= TOL) or
			(abs(con - HALFPI) <= TOL) or
			(abs(abs(P.phi0) - HALFPI) <= TOL) or
			(abs(abs(P.phi2) - HALFPI) <= TOL)) then
      raise Exception.Create(SErr33);
      //  E_ERROR(-33);
	end;
  P.ellips := P.es>0;
  if P.ellips then com := sqrt(P.one_es) else com := 1;
	if (abs(P.phi0) > EPS) then
  begin
		sinph0 := sin(P.phi0);
		cosph0 := cos(P.phi0);
		if (P.ellips) then
    begin
			con := 1 - P.es * sinph0 * sinph0;
			P.bl := cosph0 * cosph0;
			P.bl := sqrt(1 + P.es * P.bl * P.bl / P.one_es);
			P.al := P.bl * P.k0 * com / con;
			d := P.bl * com / (cosph0 * sqrt(con));
		end else
    begin
			P.bl := 1;
			P.al := P.k0;
			d := 1 / cosph0;
		end;
    f := d * d - 1;
		if (f <= 0) then
			f := 0
		else
    begin
			f := sqrt(f);
			if (P.phi0 < 0) then
				f := -f;
		end;
    f:= f + d;
		P.el := f;
		if (P.ellips) then
      P.el := P.el * power(pj_tsfn(P.phi0, sinph0, P.e), P.bl)
		else
      P.el := P.el * TSFN0(P.phi0);
	end else
  begin
		P.bl := 1 / com;
		P.al := P.k0;
    f := 1;
    d := 1;
		P.el := 1;
	end;
	if azi then
  begin
		P.Gamma := arcsin(sin(P.alpha) / d);
		P.lam0 := P.lamc - arcsin((0.5 * (f - 1 / f)) * tan(P.Gamma)) / P.bl;
	end else
  begin
		if (P.ellips) then
    begin
			h := power(pj_tsfn(P.phi1, sin(P.phi1), P.e), P.bl);
			l := power(pj_tsfn(P.phi2, sin(P.phi2), P.e), P.bl);
		end else
    begin
			h := TSFN0(P.phi1);
			l := TSFN0(P.phi2);
		end;
		f := P.el / h;
		pd := (l - h) / (l + h);
		j := P.el * P.el;
		j := (j - l * h) / (j + l * h);
    con := P.lam1 - P.lam2;
		if (con < -PI) then
			P.lam2 := P.lam2 - TWOPI
		else if (con > PI) then
			P.lam2 := P.lam2 + TWOPI;
		P.lam0 := adjlon(0.5 * (P.lam1 + P.lam2) - arctan(
		   j * tan(0.5 * P.bl * (P.lam1 - P.lam2)) / pd) / P.bl);
		P.Gamma := arctan(2 * sin(P.bl * adjlon(P.lam1 - P.lam0)) /
		   (f - 1 / f));
		P.alpha := arcsin(d * sin(P.Gamma));
	end;
	P.singam := sin(P.Gamma);
	P.cosgam := cos(P.Gamma);
  if P.pj_param.asboolean('rot_conv') then f:= P.Gamma else f:= P.alpha;
	P.sinrot := sin(f);
	P.cosrot := cos(f);
  if P.pj_param.asboolean('no_uoff') then P.u_0 := 0 else
    P.u_0 := abs(P.al * arctan(sqrt(d * d - 1) / P.cosrot) / P.bl);
	if P.phi0 < 0 then
		P.u_0 := -P.u_0;
	P.inv := @omerc_inverse;
	P.fwd := @omerc_forward;
end;


end.
