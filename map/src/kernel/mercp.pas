unit mercp;

{**********************************************************************
 mercator

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
  Classes,SysUtils, Math, projectors, aasincos;

  procedure merc(P: TGeoConvert; init:boolean);      // Mercator

implementation

const
  EPS10    = 1.E-10;

function e_forward(lp: TLP; P: TGeoConvert): TXY; (* ellipsoid *)
var
  xy: TXY;
begin
   if abs(abs(lp.phi) - HALFPI) <= EPS10 then
   begin
     P.pj_errno := -20;
     result:= xy;
     exit;
   end;
	xy.x := P.k0 * lp.lam;
	xy.y := - P.k0 * ln(pj_tsfn(lp.phi, sin(lp.phi), P.e));
	result:= xy;
end;

function s_forward(lp: TLP; P:TGeoConvert): TXY; (* spheroid *)
var
  xy: TXY;
begin
   if abs(abs(lp.phi) - HALFPI) <= EPS10 then
   begin
     P.pj_errno := -20;
     result:= xy;
     exit;
   end;
	xy.x := P.k0 * lp.lam;
	xy.y := P.k0 * ln(tan(FORTPI + 0.5 * lp.phi));
	result:= xy;
end;

function e_inverse(xy: TXY; P: TGeoConvert): TLP; (* ellipsoid *)
var
  lp: TLP;
begin
   lp.phi := pj_phi2(exp(- xy.y / P.k0), P.e);
   if lp.phi = HUGE_VAL then
   begin
      P.pj_errno := -20;
      result:= lp;
      exit;
   end;
	lp.lam := xy.x / P.k0;
	result:= lp;
end;

function s_inverse(xy: TXY; P: TGeoConvert): TLP; (* spheroid *)
begin
	result.phi := HALFPI - 2 * arctan(exp(-xy.y / P.k0));
	result.lam := xy.x / P.k0;
end;

procedure merc(P: TGeoConvert; init:boolean);
var
  phits: double;
  is_phits: boolean;
begin
  if init then begin
   P.fwd:=nil;
   P.inv:= nil;
   exit;
  end;
  phits:=0;
  is_phits := P.pj_param.defined('lat_ts');
	if is_phits then
   begin
		phits := abs(P.pj_param.asradians('lat_ts'));
		if phits >= HALFPI then
      begin
        P.pj_errno := -24;
        exit;
     end;
	end;
	if P.es <> 0 then
   begin (* ellipsoid *)
		if is_phits then
			P.k0 := pj_msfn(sin(phits), cos(phits), P.es);
		P.inv := @e_inverse;
		P.fwd := @e_forward;
	end else
   begin (* sphere *)
		if is_phits then
			P.k0 := cos(phits);
		P.inv := @s_inverse;
		P.fwd := @s_forward;
	end;
end;

end.
