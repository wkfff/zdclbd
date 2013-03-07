unit airyp;

{**********************************************************************
 airy

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

  procedure airy(P: TGeoConvert; init:boolean);      // Airy

implementation

const
   EPS        = 1.E-10;
   N_POLE	   = 0;
   S_POLE     = 1;
   EQUIT	   = 2;
   OBLIQ	   = 3;

function s_forward(lp: TLP; P:TGeoConvert): TXY; (* spheroid *)
var
  xy: TXY;
  sinlam, coslam, cosphi, sinphi, t, s, Krho, cosz: double;
begin
	sinlam := sin(lp.lam);
	coslam := cos(lp.lam);
	case P.mode of
     EQUIT, OBLIQ:
        begin
           sinphi := sin(lp.phi);
           cosphi := cos(lp.phi);
           cosz := cosphi * coslam;
           if P.mode = OBLIQ then
              cosz := P.sinph0 * sinphi + P.cosph0 * cosz;
           if (P.no_cut=false) and (cosz < -EPS) then
           begin
              P.pj_errno := -20;
              result:= xy;
              exit;
           end;
           s := 1 - cosz;
           if abs(s) > EPS then
           begin
              t := 0.5 * (1 + cosz);
              Krho := -ln(t)/s - P.Cb / t;
           end else
              Krho := 0.5 - P.Cb;
           xy.x := Krho * cosphi * sinlam;
           if P.mode = OBLIQ then
              xy.y := Krho * (P.cosph0 * sinphi -	P.sinph0 * cosphi * coslam)
           else
              xy.y := Krho * sinphi;
        end;
     S_POLE, N_POLE:
        begin
           lp.phi := abs(P.p_halfpi - lp.phi);
           if (P.no_cut=false) and ((lp.phi - EPS) > HALFPI) then
           begin
              P.pj_errno := -20;
              result:= xy;
              exit;
           end;
           lp.phi := lp.phi * 0.5;
           if lp.phi > EPS then
           begin
              t := tan(lp.phi);
              Krho := -2 * (ln(cos(lp.phi)) / t + t * P.Cb);
              xy.x := Krho * sinlam;
              xy.y := Krho * coslam;
              if P.mode = N_POLE then
                 xy.y := -xy.y
           end else
           begin
              xy.y := 0;
              xy.x := 0;
           end;
        end;
	end;
	result := xy;
end;

procedure airy(P: TGeoConvert; init:boolean);
var
  beta: double;
begin
  if init then begin
   P.fwd:=nil;
   P.inv:= nil;
   exit;
  end;

	P.no_cut := P.pj_param.asboolean('no_cut');
	beta := 0.5 * (HALFPI - P.pj_param.asradians('lat_b'));
	if abs(beta) < EPS then
		P.Cb := -0.5
	else
   begin
		P.Cb := 1/tan(beta);
		P.Cb := P.Cb * P.Cb * ln(cos(beta));
	end;
	if abs(abs(P.phi0) - HALFPI) < EPS then
   begin
		if P.phi0 < 0 then
      begin
			P.p_halfpi := -HALFPI;
			P.mode := S_POLE;
		end else
      begin
			P.p_halfpi :=  HALFPI;
			P.mode := N_POLE;
		end;
	end else
   begin
		if abs(P.phi0) < EPS then
			P.mode := EQUIT
		else
      begin
			P.mode := OBLIQ;
			P.sinph0 := sin(P.phi0);
			P.cosph0 := cos(P.phi0);
		end;
	end;
	P.fwd := @s_forward;
	P.es := 0;

end;

end.

