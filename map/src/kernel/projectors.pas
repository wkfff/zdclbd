unit projectors;

{**********************************************************************
 main low-level objects to handling projections

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

***************************************************************************** }

{$I proj_flag.inc}
interface
{$T-,J+}
uses
  SysUtils, Classes, Windows, Math;

const
  EN_SIZE         = 5;
  HUGE_VAL        = 1.0E+300;
  HALFPI	        = PI/2;
  FORTPI	        = PI/4;
  TWOPI		        = 2*PI;

  IS_ANAL_XL_YL   = 01;	   //* derivatives of lon analytic */
  IS_ANAL_XP_YP   = 02;	   //* derivatives of lat analytic */
  IS_ANAL_HK	    = 04;		//* h and k analytic */
  IS_ANAL_CONV    = 010;	//* convergence analytic */

type

  TCoordSystem = ( csCartesian, csLatLon, csProjection );

  // commented projections are pending to implement
  TProjectionCode = (
     aea      ,
     //aeqd     ,
     airy     ,
     //aitoff   ,
     //alsk     ,
     //apian    ,
     //august   ,
     //bacon    ,
     //bipc     ,
     //boggs    ,
     //bonne    ,
     //cass     ,
     //cc       ,
     //cea      ,
     //chamb    ,
     //collg    ,
     //crast    ,
     //denoy    ,
     //eck1     ,
     //eck2     ,
     //eck3     ,
     //eck4     ,
     //eck5     ,
     //eck6     ,
     //eqc      ,
     //eqdc     ,
     //euler    ,
     //fahey    ,
     //fouc     ,
     //fouc_s   ,
     //gall     ,
     //gins8    ,
     //gn_sinu  ,
     //gnom     ,
     //goode    ,
     //gs48     ,
     //gs50     ,
     //hammer   ,
     //hatano   ,
     //imw_p    ,
     //kav5     ,
     //kav7     ,
     //labrd    ,
     //laea     ,
     //lagrng   ,
     //larr     ,
     //lask     ,
     lcc      ,
     leac     ,
     //lee_os   ,
     //loxim    ,
     //lsat     ,
     //mbt_s    ,
     //mbt_fps  ,
     //mbtfpp   ,
     //mbtfpq   ,
     //mbtfps   ,
     merc     ,
     //mil_os   ,
     //mill     ,
     //mpoly    ,
     //moll     ,
     //murd1    ,
     //murd2    ,
     //murd3    ,
     //nell     ,
     //nell_h   ,
     //nicol    ,
     Non_Earth,
     //nsper    ,
     //nzmg     ,
     //ob_tran  ,
     //ocea     ,
     //oea      ,
     omerc    ,
     //ortel    ,
     //ortho    ,
     //pconic   ,
     //poly     ,
     //putp1    ,
     //putp2    ,
     //putp3    ,
     //putp3p   ,
     //putp4p   ,
     //putp5    ,
     //putp5p   ,
     //putp6    ,
     //putp6p   ,
     //qua_aut  ,
     //robin    ,
     //rpoly    ,
     //sinu     ,
     //somerc   ,
     //stere    ,
     //tcc      ,
     //tcea     ,
     //tissot   ,
     tmerc    ,
     //tpeqd    ,
     //tpers    ,
     //ups      ,
     //urm5     ,
     //urmfps   ,
     utm
     //vandg    ,
     //vandg2   ,
     //vandg3   ,
     //vandg4   ,
     //vitk1    ,
     //wag1     ,
     //wag2     ,
     //wag3     ,
     //wag4     ,
     //wag5     ,
     //wag6     ,
     //wag7     ,
     //weren    ,
     //wink1    ,
     //wink2    ,
     //wintri
     );

  { future use
  TUV = record
     u, v: Double;
  end;

  TCOMPLEX = record
     r, i: Double;
  end; }

  TXY = record
     x, y: Double;
  end;

  TLP = record
     lam, phi: Double;
  end;

  TPJ_ELLPS = record
      id: String;
      major : String;
      ell : String;
      name : String;
  end;

  TPJ_UNITS = record
      ID : String;
      to_meter : Double;
      name : String;
  end;

  TDERIVS = record
      x_l, x_p: Double;
      y_l, y_p: Double;
  end;

  TFACTORS = record
      der: TDERIVS;
      h,k: Double;
      omega, thetap: Double;
      conv: Double;
      s: Double;
      a,b: Double;
      code: integer;
  end;

  TGeoConvert = class;

  TForward = function (lp: TLP; P: TGeoConvert): TXY;
  TInverse = function (xy: TXY; P: TGeoConvert): TLP;
  TProj    = function (P: TGeoConvert; init:boolean): TGeoConvert;
  TSpecial = procedure(lp: TLP; P: TGeoConvert; var fac: TFACTORS);

  { the list of projections }
  TPJ_LIST = record
      ID: String;
      Descr: String;
      Proj: TProj; //projection entry point
  end;

  { projection parameters handling }
  TProjectParam = class
  private
     fGeoConvert: TGeoConvert;
  public
     constructor Create(GeoConvert: TGeoConvert);
     function Defined(const opt: String): boolean;
     function AsString(const opt: String): String;
     function AsInteger(const opt: String): Integer;
     function AsFloat(const opt: String): Double;
     function AsRadians(const opt: String): Double;
     function AsBoolean(const opt: String): boolean;
  end;

  //--------- the low level conversion object -------------------------//
  TGeoConvert = class
  private
     fParaList: TStringList;
     fpj_param: TProjectParam;
     //fCoordSystem: TCoordSystem;
     function  pj_inv(var xy: TXY): TLP;
     function  pj_fwd(var lp: TLP): TXY;
     function  pj_ell_set(var a,es: Double): integer;
  public
     pj_errno: integer;

     { projection variables }
     fwd: TFarProc;         // procdure pointer for converting from lat/long to projection
     inv: TFarProc;         // procedure pointer for converting from projection to lat/lon
     spc: TFarProc;         // procedure pointer for special processing

     over: boolean;
     geoc: boolean;
     a,  { major axis or radius if es=0 }
     e,  { eccentricity }
     es, { e ^ 2 }
     ra, { 1/A }
     one_es, { 1 - e^2 }
     rone_es, { 1/one_es }
     lam0, phi0, { central longitude, latitude }
     x0, y0, { easting and northing }
     k0,	{ general scaling factor }
     to_meter, fr_meter:Double; { cartesian scaling }
     units: String[8];    { for fast access}

     { additional info for every projection }
     ec: Double;
     n: Double;
     c : Double;
     dd : Double;
     n2 : Double;
     rho0 : Double;
     rho : Double;
     phi1 : Double;
     phi2 : Double;
     ellips : boolean;     // ellipsoid or spheroid

     sinph0 : Double;
     cosph0 : Double;
     M1 : Double;
     N1 : Double;
     Mp : Double;
     He : Double;
     G : Double;
     mode : Integer;

     p_halfpi : Double;
     Cb : Double;
     no_cut:boolean;	{ do not cut at hemisphere limit }

     cosphi1 : Double;

     bacn : Integer;
     ortl : Integer;

     noskew : Integer;

     cphi1 : Double;
     am1 : Double;

     m0 : Double;
     t : Double;
     a1 : Double;
     r : Double;
     d2 : Double;
     a2 : Double;
     tn : Double;

     ap : Double;

     esp : Double;
     ml0 : Double;
     en: array[0..EN_SIZE] of double;
     { oblique mercator data }
     bl: double;
     singam: double;
     al: double;
     el: double;
     cosgam: double;
     u_0: double;
     rot: boolean;
     cosrot: double;
     sinrot: double;
     Gamma: double;
     lamc: double;
     alpha: double;
     lam1: double;
     lam2: double;

     { methods }
     constructor Create;
     destructor Destroy; override;

     function  HasProjection: Boolean;
     procedure Geo_CoordSysInit(Params: TStringList);
     procedure Geo_CoordSysFromLatLong(const long, lat : Double; var x, y: Double);
     procedure Geo_CoordSysToLatLong(const x, y : Double; var long, lat: Double);
     function Geo_Distance(long1,lat1,long2,lat2: double): double;

     property ParaList: TStringList read fParaList;
     //property CoordSystem: TCoordSystem read fCoordSystem write fCoordSystem;
     property pj_param: TProjectParam read fpj_param;
  end;

const
  { As projections are implemented, they will be uncommented }
  pj_list: array[TProjectionCode] of TPJ_LIST = (
     (id:'aea';    descr:'Albers Equal Area'                     ; proj:nil),
     //(id:'aeqd';   descr:'Azimuthal Equidistant'                 ; proj:nil),
     (id:'airy';   descr:'Airy'                                  ; proj:nil),
     //(id:'aitoff'; descr:'Aitoff'                                ; proj:nil),
     //(id:'alsk';   descr:'Mod. Stererographics of Alaska'        ; proj:nil),
     //(id:'apian';  descr:'Apian Globular I'                      ; proj:nil),
     //(id:'august'; descr:'August Epicycloidal'                   ; proj:nil),
     //(id:'bacon';  descr:'Bacon Globular'                        ; proj:nil),
     //(id:'bipc';   descr:'Bipolar conic of western hemisphere'   ; proj:nil),
     //(id:'boggs';  descr:'Boggs Eumorphic'                       ; proj:nil),
     //(id:'bonne';  descr:'Bonne (Werner lat_1=90)'               ; proj:nil),
     //(id:'cass';   descr:'Cassini'                               ; proj:nil),
     //(id:'cc';     descr:'Central Cylindrical'                   ; proj:nil),
     //(id:'cea';    descr:'Equal Area Cylindrical'                ; proj:nil),
     //(id:'chamb';  descr:'Chamberlin Trimetric'                  ; proj:nil),
     //(id:'collg';  descr:'Collignon'                             ; proj:nil),
     //(id:'crast';  descr:'Craster Parabolic (Putnins P4)'        ; proj:nil),
     //(id:'denoy';  descr:'Denoyer Semi-Elliptical'               ; proj:nil),
     //(id:'eck1';   descr:'Eckert I'                              ; proj:nil),
     //(id:'eck2';   descr:'Eckert II'                             ; proj:nil),
     //(id:'eck3';   descr:'Eckert III'                            ; proj:nil),
     //(id:'eck4';   descr:'Eckert IV'                             ; proj:nil),
     //(id:'eck5';   descr:'Eckert V'                              ; proj:nil),
     //(id:'eck6';   descr:'Eckert VI'                             ; proj:nil),
     //(id:'eqc';    descr:'Equidistant Cylindrical (Plate Caree)' ; proj:nil),
     //(id:'eqdc';   descr:'Equidistant Conic'                     ; proj:nil),
     //(id:'euler';  descr:'Euler'                                 ; proj:nil),
     //(id:'fahey';  descr:'Fahey'                                 ; proj:nil),
     //(id:'fouc';   descr:'Foucaut'                               ; proj:nil),
     //(id:'fouc_s'; descr:'Foucaut Sinusoidal'                    ; proj:nil),
     //(id:'gall';   descr:'Gall (Gall Stereographic)'             ; proj:nil),
     //(id:'gins8';  descr:'Ginsburg VIII (TsNIIGAiK)'             ; proj:nil),
     //(id:'gn_sinu';descr:'General Sinusoidal Series'             ; proj:nil),
     //(id:'gnom';   descr:'Gnomonic'                              ; proj:nil),
     //(id:'goode';  descr:'Goode Homolosine'                      ; proj:nil),
     //(id:'gs48';   descr:'Mod. Stererographics of 48 U.S.'       ; proj:nil),
     //(id:'gs50';   descr:'Mod. Stererographics of 50 U.S.'       ; proj:nil),
     //(id:'hammer'; descr:'Hammer & Eckert-Greifendorff'          ; proj:nil),
     //(id:'hatano'; descr:'Hatano Asymmetrical Equal Area'        ; proj:nil),
     //(id:'imw_p';  descr:'Internation Map of the World Polyconic'; proj:nil),
     //(id:'kav5';   descr:'Kavraisky V'                           ; proj:nil),
     //(id:'kav7';   descr:'Kavraisky VII'                         ; proj:nil),
     //(id:'labrd';  descr:'Laborde'                               ; proj:nil),
     //(id:'laea';   descr:'Lambert Azimuthal Equal Area'          ; proj:nil),
     //(id:'lagrng'; descr:'Lagrange'                              ; proj:nil),
     //(id:'larr';   descr:'Larrivee'                              ; proj:nil),
     //(id:'lask';   descr:'Laskowski'                             ; proj:nil),
     (id:'lcc';    descr:'Lambert Conformal Conic'               ; proj:nil),
     (id:'leac';   descr:'Lambert Equal Area Conic'              ; proj:nil),
     //(id:'lee_os'; descr:'Lee Oblated Stereographic'             ; proj:nil),
     //(id:'loxim';  descr:'Loximuthal'                            ; proj:nil),
     //(id:'lsat';   descr:'Space oblique for LANDSAT'             ; proj:nil),
     //(id:'mbt_s';  descr:'McBryde-Thomas Flat-Polar Sine'        ; proj:nil),
     //(id:'mbt_fps';descr:'McBryde-Thomas Flat-Pole Sine (No. 2)' ; proj:nil),
     //(id:'mbtfpp'; descr:'McBride-Thomas Flat-Polar Parabolic'   ; proj:nil),
     //(id:'mbtfpq'; descr:'McBryde-Thomas Flat-Polar Quartic'     ; proj:nil),
     //(id:'mbtfps'; descr:'McBryde-Thomas Flat-Polar Sinusoidal'  ; proj:nil),
     (id:'merc';   descr:'Mercator'                              ; proj:nil),
     //(id:'mil_os'; descr:'Miller Oblated Stereographic'          ; proj:nil),
     //(id:'mill';   descr:'Miller Cylindrical'                    ; proj:nil),
     //(id:'mpoly';  descr:'Modified Polyconic'                    ; proj:nil),
     //(id:'moll';   descr:'Mollweide'                             ; proj:nil),
     //(id:'murd1';  descr:'Murdoch I'                             ; proj:nil),
     //(id:'murd2';  descr:'Murdoch II'                            ; proj:nil),
     //(id:'murd3';  descr:'Murdoch III'                           ; proj:nil),
     //(id:'nell';   descr:'Nell'                                  ; proj:nil),
     //(id:'nell_h'; descr:'Nell-Hammer'                           ; proj:nil),
     //(id:'nicol';  descr:'Nicolosi Globular'                     ; proj:nil),
     (id:'Non_Earth';  descr:'Non_Earth'                      ; proj:nil),

     //(id:'nsper';  descr:'Near-sided perspective'                ; proj:nil),
     //(id:'nzmg';   descr:'New Zealand Map Grid'                  ; proj:nil),
     //(id:'ob_tran';descr:'General Oblique Transformation'        ; proj:nil),
     //(id:'ocea';   descr:'Oblique Cylindrical Equal Area'        ; proj:nil),
     //(id:'oea';    descr:'Oblated Equal Area'                    ; proj:nil),
     (id:'omerc';  descr:'Oblique Mercator'                      ; proj:nil),
     //(id:'ortel';  descr:'Ortelius Oval'                         ; proj:nil),
     //(id:'ortho';  descr:'Orthographic'                          ; proj:nil),
     //(id:'pconic'; descr:'Perspective Conic'                     ; proj:nil),
     //(id:'poly';   descr:'Polyconic (American)'                  ; proj:nil),
     //(id:'putp1';  descr:'Putnins P1'                            ; proj:nil),
     //(id:'putp2';  descr:'Putnins P2'                            ; proj:nil),
     //(id:'putp3';  descr:'Putnins P3'                            ; proj:nil),
     //(id:'putp3p'; descr:'Putnins P3'''                          ; proj:nil),
     //(id:'putp4p'; descr:'Putnins P4'''                          ; proj:nil),
     //(id:'putp5';  descr:'Putnins P5'                            ; proj:nil),
     //(id:'putp5p'; descr:'Putnins P5'''                          ; proj:nil),
     //(id:'putp6';  descr:'Putnins P6'                            ; proj:nil),
     //(id:'putp6p'; descr:'Putnins P6'''                          ; proj:nil),
     //(id:'qua_aut';descr:'Quartic Authalic'                      ; proj:nil),
     //(id:'robin';  descr:'Robinson'                              ; proj:nil),
     //(id:'rpoly';  descr:'Rectangular Polyconic'                 ; proj:nil),
     //(id:'sinu';   descr:'Sinusoidal (Sanson-Flamsteed)'         ; proj:nil),
     //(id:'somerc'; descr:'Swiss. Obl. Mercator'                  ; proj:nil),
     //(id:'stere';  descr:'Stereographic'                         ; proj:nil),
     //(id:'tcc';    descr:'Transverse Central Cylindrical'        ; proj:nil),
     //(id:'tcea';   descr:'Transverse Cylindrical Equal Area'     ; proj:nil),
     //(id:'tissot'; descr:'Tissot Conic'                          ; proj:nil),
     (id:'tmerc';  descr:'Transverse Mercator/Gauss Kruger'                   ; proj:nil),
     //(id:'tpeqd';  descr:'Two Point Equidistant'                 ; proj:nil),
     //(id:'tpers';  descr:'Tilted perspective'                    ; proj:nil),
     //(id:'ups';    descr:'Universal Polar Stereographic'         ; proj:nil),
     //(id:'urm5';   descr:'Urmaev V'                              ; proj:nil),
     //(id:'urmfps'; descr:'Urmaev Flat-Polar Sinusoidal'          ; proj:nil),
     (id:'utm';    descr:'Universal Transverse Mercator (UTM)'   ; proj:nil)
     //(id:'vandg';  descr:'van der Grinten (I)'                   ; proj:nil),
     //(id:'vandg2'; descr:'van der Grinten II'                    ; proj:nil),
     //(id:'vandg3'; descr:'van der Grinten III'                   ; proj:nil),
     //(id:'vandg4'; descr:'van der Grinten IV'                    ; proj:nil),
     //(id:'vitk1';  descr:'Vitkovsky I'                           ; proj:nil),
     //(id:'wag1';   descr:'Wagner I (Kavraisky VI)'               ; proj:nil),
     //(id:'wag2';   descr:'Wagner II'                             ; proj:nil),
     //(id:'wag3';   descr:'Wagner III'                            ; proj:nil),
     //(id:'wag4';   descr:'Wagner IV'                             ; proj:nil),
     //(id:'wag5';   descr:'Wagner V'                              ; proj:nil),
     //(id:'wag6';   descr:'Wagner VI'                             ; proj:nil),
     //(id:'wag7';   descr:'Wagner VII'                            ; proj:nil),
     //(id:'weren';  descr:'Werenskiold I'                         ; proj:nil),
     //(id:'wink1';  descr:'Winkel I'                              ; proj:nil),
     //(id:'wink2';  descr:'Winkel II'                             ; proj:nil),
     //(id:'wintri'; descr:'Winkel Tripel'                         ; proj:nil)
     );

  { units }
  pj_units: array[0..20] of TPJ_UNITS = (
    (id:'km'   ;   to_meter:1000            ;   name:'公里'),
    (id:'m'    ;   to_meter:1.0             ;   name:'米'),
    (id:'dm'   ;   to_meter:0.10            ;   name:'分米'),
    (id:'cm'   ;   to_meter:0.01            ;   name:'厘米'),
    (id:'mm'   ;   to_meter:0.001           ;   name:'毫米'),
    (id:'kmi'  ;   to_meter:1852.0          ;   name:'海里'),
    (id:'in'   ;   to_meter:0.0254          ;   name:'英寸'),
    (id:'ft'   ;   to_meter:0.3048          ;   name:'英尺'),
    (id:'yd'   ;   to_meter:0.9144          ;   name:'码'),
    (id:'mi'   ;   to_meter:1609.344        ;   name:'英里'),
    (id:'fath' ;   to_meter:1.8288          ;   name:'International Fathom'),
    (id:'ch'   ;   to_meter:20.1168         ;   name:'链'),
    (id:'link' ;   to_meter:0.201168        ;   name:'International Link'),
    (id:'us-in';   to_meter:0.0254000508001 ;   name:'U.S. Surveyor''s Inch'),
    (id:'us-ft';   to_meter:0.304800609601219;  name:'U.S. Surveyor''s Foot'),
    (id:'us-yd';   to_meter:0.914401828803658;  name:'U.S. Surveyor''s Yard'),
    (id:'us-ch';   to_meter:20.11684023368047;  name:'U.S. Surveyor''s Chain'),
    (id:'us-mi';   to_meter:1609.347218694437;  name:'U.S. Surveyor''s Statute Mile'),
    (id:'ind-yd';  to_meter:0.91439523      ;   name:'Indian Yard'),
    (id:'ind-ft';  to_meter:0.30479841      ;   name:'Indian Foot'),
    (id:'ll';  to_meter:1     ;   name:'度米')
    );

  { ellipsoid data }
  pj_ellps: array[0..41] of TPJ_ELLPS = (
    (id:'MERIT';     major:'a=6378137.0';    ell:'rf=298.257';        name:'MERIT 1983';                    ),
    (id:'SGS85';     major:'a=6378136.0';    ell:'rf=298.257';        name:'Soviet Geodetic System 85';     ),
    (id:'GRS80';     major:'a=6378137.0';    ell:'rf=298.257222101';  name:'GRS 1980(IUGG, 1980)';          ),
    (id:'IAU76';     major:'a=6378140.0';    ell:'rf=298.257';        name:'IAU 1976';                      ),
    (id:'airy';      major:'a=6377563.396';  ell:'b=6356256.910';     name:'Airy 1830';                     ),
    (id:'APL4.9';    major:'a=6378137.0.';   ell:'rf=298.25';         name:'Appl. Physics. 1965';           ),
    (id:'NWL9D';     major:'a=6378145.0.';   ell:'rf=298.25';         name:'Naval Weapons Lab., 1965';      ),
    (id:'mod_airy';  major:'a=6377340.189';  ell:'b=6356034.446';     name:'Modified Airy';                 ),
    (id:'andrae';    major:'a=6377104.43';   ell:'rf=300.0'; 	        name:'Andrae 1876 (Den., Iclnd.)';    ),
    (id:'aust_SA';   major:'a=6378160.0';    ell:'rf=298.25';         name:'Australian Natl & S. Amer. 196';),
    (id:'GRS67';     major:'a=6378160.0';    ell:'rf=298.2471674270'; name:'GRS 67(IUGG 1967)';             ),
    (id:'bessel';    major:'a=6377397.155';  ell:'rf=299.1528128';    name:'Bessel 1841';                   ),
    (id:'bess_nam';  major:'a=6377483.865';  ell:'rf=299.1528128';    name:'Bessel 1841 (Namibia)';         ),
    (id:'clrk66';    major:'a=6378206.4';    ell:'b=6356583.8';       name:'Clarke 1866 (NAD-27)';          ),
    (id:'clrk80';    major:'a=6378249.145';  ell:'rf=293.4663';       name:'Clarke 1880 mod.';              ),
    (id:'CPM';       major:'a=6375738.7';    ell:'rf=334.29';         name:'Comm. des Poids et Mesures 179';),
    (id:'delmbr';    major:'a=6376428.';     ell:'rf=311.5';          name:'Delambre 1810 (Belgium)';       ),
    (id:'engelis';   major:'a=6378136.05';   ell:'rf=298.2566';       name:'Engelis 1985';                  ),
    (id:'evrst30';   major:'a=6377276.345';  ell:'rf=300.8017';       name:'Everest 1830';                  ),
    (id:'evrst48';   major:'a=6377304.063';  ell:'rf=300.8017';       name:'Everest 1948';                  ),
    (id:'evrst56';   major:'a=6377301.243';  ell:'rf=300.8017';       name:'Everest 1956';                  ),
    (id:'evrst69';   major:'a=6377295.664';  ell:'rf=300.8017';       name:'Everest 1969';                  ),
    (id:'evrstSS';   major:'a=6377298.556';  ell:'rf=300.8017';       name:'Everest (Sabah & Sarawak)';     ),
    (id:'fschr60';   major:'a=6378166.';     ell:'rf=298.3';          name:'Fischer (Mercury Datum) 1960';  ),
    (id:'fschr60m';  major:'a=6378155.';     ell:'rf=298.3';          name:'Modified Fischer 1960';         ),
    (id:'fschr68';   major:'a=6378150.';     ell:'rf=298.3';          name:'Fischer 1968';                  ),
    (id:'helmert';   major:'a=6378200.';     ell:'rf=298.3';          name:'Helmert 1906';                  ),
    (id:'hough';     major:'a=6378270.0';    ell:'rf=297.';           name:'Hough';                         ),
    (id:'intl';      major:'a=6378388.0';    ell:'rf=297.';           name:'International 1909 (Hayford)';  ),
    (id:'krass';     major:'a=6378245.0';    ell:'rf=298.3';          name:'Krassovsky, 1942';              ),
    (id:'kaula';     major:'a=6378163.';     ell:'rf=298.24';         name:'Kaula 1961';                    ),
    (id:'lerch';     major:'a=6378139.';     ell:'rf=298.257';        name:'Lerch 1979';                    ),
    (id:'mprts';     major:'a=6397300.';     ell:'rf=191.';           name:'Maupertius 1738';               ),
    (id:'new_intl';  major:'a=6378157.5';    ell:'b=6356772.2';       name:'New International 1967';        ),
    (id:'plessis';   major:'a=6376523.';     ell:'b=6355863.';        name:'Plessis 1817 (France)';         ),
    (id:'SEasia';    major:'a=6378155.0';    ell:'b=6356773.3205';    name:'Southeast Asia';                ),
    (id:'walbeck';   major:'a=6376896.0';    ell:'b=6355834.8467';    name:'Walbeck';                       ),
    (id:'WGS60';     major:'a=6378165.0';    ell:'rf=298.3';          name:'WGS 60';                        ),
    (id:'WGS66';     major:'a=6378145.0';    ell:'rf=298.25';         name:'WGS 66';                        ),
    (id:'WGS72';     major:'a=6378135.0';    ell:'rf=298.26';         name:'WGS 72';                        ),
    (id:'WGS84';     major:'a=6378137.0';    ell:'rf=298.257223563';  name:'WGS 84';                        ),
    (id:'ITRFMEX';   major:'a=6378137';      ell:'b=6356752.3141';    name:'ITRF (Mexico)')                 );

  function ProjCodeFromID(const id: String): TProjectionCode;
  function EllpsCodeFromID(const id:String) : Integer;
  function UnitcodeFromID(const id:String) : Integer;
  function UnitCodeFromName(const name:String) : Integer;
  function dmstor(const ins: string): double;

implementation

uses
  aasincos,
  tmercp,
  lccp,
  aeap,
  airyp,
  mercp;

{ Convert DMS string to radians }
function dmstor(const ins: string): double;
const
  sym = 'NnEeSsWw';
var
  i, p, nl, last, code: integer;
  sign: char;
  work,temp: string;
  v, tv: Double;
begin
  result:= 0;
  work:= Trim(UpperCase(ins));
  if length(work)=0 then exit;             //+46.65d57'8.660"N
  val(work,v,code);
  if code=0 then
  begin
    result:=v;
    exit;
  end;
  if (length(work)>1) and (work[length(work)]='R') then
  begin
    val(copy(work,1,length(work)-1),v,code);
    if code=0 then
    begin
      result:=v;
      exit;
    end;
  end;
  sign := work[1];
  if not(sign in ['+','-']) then sign:= '+';
  i:= 1;
  last:=i;
  v:= 0;
  nl:= 0;
  // +46.65d57'8.660"N
  while i<=length(work) do
  begin
    if work[i] in ['D',#39,#34] then
    begin
      tv:= StrToFloat(copy(work,last,(i-last)));
      case work[i] of
        'D':
          begin
          v:= v + tv * 0.0174532925199433;
          nl:=1;
          end;
        #39:
          begin
          v:= v + tv * 0.0002908882086657216;
          nl:=2;
          end;
        #34:
          begin
          v:= v + tv * 0.0000048481368110953599;
          nl:=3;
          end;
      end;
      last:=i+1;
    end;
    inc(i);
  end;
  if last<=length(work) then
  begin
    p:= AnsiPos(work[length(work)], sym);
    if p>0 then
    begin
      temp:= copy(work,last,length(work)-last);
      if p>=4 then sign:= '-' else sign:= '+';
    end else
    begin
      temp:= copy(work,last,length(work));
    end;
    if length(temp)>0 then
    begin
      tv:= StrToFloat(temp);
      case nl of
        0: v:= v + tv * 0.0174532925199433;
        1: v:= v + tv * 0.0002908882086657216;
        2: v:= v + tv * 0.0000048481368110953599;
      end;
    end;
  end;
  if sign='-' then v:= -v;
	result:= v;
end;


{ SOLUTION OF THE GEODETIC INVERSE PROBLEM
  MODIFIED RAINSFORD'S METHOD WITH HELMERT'S ELLIPTICAL TERMS
  EFFECTIVE IN ANY AZIMUTH AND AT ANY DISTANCE SHORT OF ANTIPODAL
  STANDPOINT / FOREPOINT MUST NOT BE THE GEOGRAPHIC POLE

  A IS THE SEMI-MAJOR AXIS OF THE REFERENCE ELLIPSOID
  F IS THE FLATTENING (NOT RECIPROCAL) OF THE REFERENCE ELLIPSOID
  LATITUDES AND LONGITUDES IN RADIANS POSITIVE NORTH AND EAST
  FORWARD AZIMUTHS AT BOTH POINTS RETURNED IN RADIANS FROM NORTH }
procedure invert1( const glat1, glon1, glat2, glon2, a, f: Double;
  var faz, baz, s: Double );
const
  EPS = 0.5E-13;
var
   r,tu1,tu2,cu1,su1,cu2,x,sx,cx,sy,cy,y,sa,c2a,cz,e,c,d : Double;
begin
   r := 1.0 - f;
   tu1 := r * sin(glat1) / cos(glat1);
   tu2 := r * sin(glat2) / cos(glat2);
   cu1 := 1.0 / sqrt(tu1 * tu1 + 1.0);
   su1 := cu1 * tu1;
   cu2 := 1.0 / sqrt(tu2 * tu2 + 1.0);
   s := cu1 * cu2;
   baz := s * tu2;
   faz := baz * tu1;
   x := glon2 - glon1;
   repeat
      sx := sin(x);
      cx := cos(x);
      tu1 := cu2 * sx;
      tu2 := baz - su1 * cu2 * cx;
      sy := sqrt(tu1 * tu1 + tu2 * tu2);
      cy := s * cx + faz;
      y := Math.arctan2(sy,cy);
      sa := s * sx / sy;
      c2a :=  - sa * sa + 1.0;
      cz := faz + faz;
      if c2a > 0 then cz :=  - cz / c2a + cy;
      e := cz * cz * 2.0 - 1.0;
      c := (( - 3.0 * c2a + 4.0) * f + 4.0) * c2a * f / 16.0;
      d := x;
      x := ((e * cy * c + cz) * sy * c + y) * sa;
      x := (1.0 - c) * x * f + glon2 - glon1;
   until abs(d - x)<=EPS;
   faz := Math.arctan2(tu1,tu2);
   baz := Math.arctan2(cu1 * sx,baz * cx - su1 * cu2) + System.PI;
   x := sqrt((1.0 / r / r - 1.0) * c2a + 1.0) + 1.0;
   x := (x - 2.0) / x;
   c := 1.0 - x;
   c := (x * x / 4.0 + 1.0) / c;
   d := (0.375 * x * x - 1.0) * x;
   x := e * cy;
   s := 1.0 - e - e;
   s := ((((sy * sy * 4.0 - 3.0) * s * cz * d / 6.0 - x) * d / 4.0 + cz) * sy * d + y) * c * a * r;
end;

function ProjCodeFromID(const ID: String): TProjectionCode;
var
  i: TProjectionCode;
begin
  result :=  Low(TProjectionCode);
  for i :=  Low(pj_list) to High(pj_list) do
     if AnsiCompareText(pj_list[i].id,ID)=0 then
     begin
        result :=  i;
        exit;
     end;
end;

function EllpsCodeFromID(const ID: String) : Integer;
var
  i : Integer;
begin
  result :=  Low(pj_ellps);
  for i :=  Low(pj_ellps) to High(pj_ellps) do
     if AnsiCompareText(pj_ellps[i].ID,ID)=0 then
     begin
        result :=  i;
        exit;
     end;
end;

function UnitCodeFromID(const ID:String) : Integer;
var
  i : Integer;
begin
  result :=  1;    // meter the default
  for i :=  Low(pj_units) to High(pj_units) do
     if AnsiCompareText(pj_units[i].ID,ID)=0 then
     begin
        result :=  i;
        exit;
     end;
end;

function UnitCodeFromName(const Name:String) : Integer;
var
  i : Integer;
begin
  result :=  1;    // meter the default
  for i :=  Low(pj_units) to High(pj_units) do
     if AnsiCompareText(pj_units[i].name,Name)=0 then
     begin
        result :=  i;
        exit;
     end;
end;


//  -------------------------------------------------------------------- //
constructor TProjectParam.Create(GeoConvert: TGeoConvert);
begin
  inherited Create;
  fGeoConvert := GeoConvert;
end;

function TProjectParam.Defined(const opt: String): boolean;
begin
  result :=  Length( fGeoConvert.fParaList.Values[opt] ) > 0;
end;

function TProjectParam.AsString(const opt: String): String;
begin
  Result := AnsiLowerCase(fGeoConvert.fParaList.Values[opt]);
end;

function TProjectParam.AsInteger(const opt: String): Integer;
var
  Value: String;
begin
  Value := AnsiLowerCase(fGeoConvert.fParaList.Values[opt]);
  if Length(Value) > 0 then
     result := StrToInt(Value)
  else
     result := 0;
end;

function TProjectParam.AsFloat(const opt: String): Double;
var
  Value: String;
begin
  Value := AnsiLowerCase(fGeoConvert.fParaList.Values[opt]);
  if Length(Value) > 0 then
     result := StrToFloat(Value)
  else
     result := 0;
end;

function TProjectParam.AsBoolean(const opt: String): boolean;
begin
  result := AnsiCompareText(fGeoConvert.fParaList.Values[opt],'t')=0;
end;

function TProjectParam.AsRadians(const opt: String): Double;
var
  Value: String;
begin
  Value := AnsiLowerCase(fGeoConvert.fParaList.Values[opt]);
  if Length(Value) > 0 then
     result := dmstor(Value)
  else
     result := 0;
end;


//  -------------------------------------------------------------------- //
const
   SIXTH  = 0.1666666666666666667;    // 1/6
   RA4    = 0.04722222222222222222;   // 17/360
   RA6    = 0.02215608465608465608;   // 67/3024
   RV4    = 0.06944444444444444444;   // 5/72
   RV6    = 0.04243827160493827160;   // 55/1296

constructor TGeoConvert.Create;
begin
  inherited Create;
  fpj_param := TProjectParam.Create(Self);
  fParaList := TStringList.Create;
  { default parameters }
  fParaList.Add( 'units=m' );
  fParaList.Add( 'ellps=WGS84' );
  fParaList.Add( 'proj=utm' );
  fParaList.Add( 'zone=12' );    // our zone :-)
end;

destructor TGeoConvert.Destroy;
begin
  fpj_param.free;
  fParaList.free;
  inherited Destroy;
end;

{ initialize geographic shape parameters }
function TGEoConvert.pj_ell_set(var a,es: Double): integer;
label
  bomb;
var
  i,last : Integer;
  b, e : Double;
  name,s: String;
  found, defined: boolean;
  tmp, tmp2: Double;
  pl: TStringList;
begin
  i:=0;
  b:=0;
  Result:=0;
  pl := fParaList;

  last := pl.count;
	// check for varying forms of ellipsoid input
  a := 0; es := 0;
	// R takes precedence
	if pj_param.Defined( 'R' ) then
		a := pj_param.AsFloat( 'R' )
	else
   begin { probable elliptical figure }
      name :=  pj_param.AsString( 'ellps' );
		{ check if ellps present and temporarily append its values to pl }
		if Length(name) > 0 then
      begin
        found := false;
        for i := low(pj_ellps) to high(pj_ellps) do
           if AnsiCompareText(pj_ellps[i].ID,Name)=0 then
           begin
              pl.add(pj_ellps[i].major);
              pl.add(pj_ellps[i].ell);
              found := true;
              break;
           end;
        if not found then
        begin
           pj_errno :=  - 9;
           exit;
        end;
		end;
		a := pj_param.AsFloat('a');
		if pj_param.Defined('es') then { eccentricity squared }
			es := pj_param.AsFloat('es')
		else if pj_param.Defined('e') then
      begin { eccentricity }
			e  := pj_param.AsFloat('e');
			es := e * e;
		end else if pj_param.Defined('rf') then
      begin { reciprocal flattening }
			es := pj_param.AsFloat('rf');
			if es=0 then
         begin
				pj_errno := -10;
				goto bomb;
			end;
			es := 1 / es;
			es := es * (2 - es);
		end else if pj_param.Defined('f') then
      begin { flattening }
			es := pj_param.AsFloat('f');
			es := es * (2 - es);
		end else if pj_param.Defined('b') then
      begin { minor axis }
			b := pj_param.AsFloat('b');
			es := 1  - (b * b) / (a * a);
		end;     { else es = 0 and sphere of radius a }
		if b = 0 then
			b := a * sqrt(1 - es);
		{ following options turn ellipsoid into equivalent sphere }
		if pj_param.AsBoolean('R_A') then
      begin { sphere -- area of ellipsoid }
			a := a * (1 - es * (SIXTH + es * (RA4 + es * RA6)));
			es := 0;
		end else if pj_param.AsBoolean('R_V') then
      begin { sphere -- vol. of ellipsoid }
			a := a * (1 - es * (SIXTH + es * (RV4 + es * RV6)));
			es := 0.0;
		end else if pj_param.AsBoolean('R_a') then
      begin { sphere -- arithmetic mean }
			a := 0.5 * (a + b);
			es := 0;
		end else if pj_param.AsBoolean('R_g') then
      begin { sphere -- geometric mean }
			a := sqrt(a * b);
			es := 0.0;
		end else if pj_param.AsBoolean('R_h') then
      begin { sphere -- harmonic mean }
			a := 2 * a * b / (a + b);
			es := 0;
		end else
      begin
        defined := pj_param.Defined('R_lat_a');
        if defined or { sphere -- arith. }
           pj_param.Defined('R_lat_g') then
        begin { or geom. mean at latitude }
           if defined then s :=  'R_lat_a' else s :=  'R_lat_g';
           tmp := Sin(pj_param.AsFloat(s));
           if abs(tmp) > HALFPI then
           begin
              pj_errno := -11;
              goto bomb;
           end;
           tmp := 1 - es * tmp * tmp;
           if i <> 0 then
              tmp2 :=  0.5 * (1 - es + tmp) / ( tmp * sqrt(tmp))
           else
              tmp2 :=  sqrt(1 - es) / tmp;
           a := a * tmp2;
           es := 0;
        end;
		end;
bomb:
    for i := last to pl.count - 1 do
      pl.delete(last);
		if pj_errno <> 0 then
      begin
         result := 1;
         exit;
      end;
	end;
	{ some remaining checks }
	if es < 0 then
   begin
		pj_errno := -12;
      result := 1;
      exit;
   end;
	if a <= 0 then
   begin
		pj_errno := -13;
      result := 1;
      exit;
   end;
   result := 0;
end;

// ----------------------------------------------------------------------
const
  EPS  = 1.0E-12;

{ forward projection entry }
function TGeoConvert.pj_fwd(var lp: TLP): TXY;
var
	xy: TXY;
	t : Double;
begin
	{ check for forward and latitude or longitude overange }
   t := abs(lp.phi) - HALFPI;
	if (t > EPS) or (abs(lp.lam) > 10) then
   begin
     xy.y := HUGE_VAL;
	  xy.x := xy.y;
	  pj_errno := -14;
	end else
   begin { proceed with projection }
     pj_errno := 0;
     if abs(t) <= EPS then
     begin
       if lp.phi < 0 then lp.phi := -HALFPI else lp.phi := HALFPI;
     end else if geoc then
        lp.phi := arctan( rone_es * tan(lp.phi) );
     lp.lam := lp.lam - lam0;	{ compute del lp.lam }
     if not over then
        lp.lam := adjlon( lp.lam ); { adjust del longitude }
     xy := TForward(fwd)(lp, self); { project }
     if pj_errno <> 0 then
     begin
       xy.y := HUGE_VAL;
       xy.x := xy.y;
     end else
     begin
		   { adjust for major axis and easting/northings }
			xy.x := fr_meter * (a * xy.x + x0);
			xy.y := fr_meter * (a * xy.y + y0);
		end;
	end;
	result :=  xy;
end;

// ------------------------------------------------------------------ //
{ inverse projection entry }
function TGeoConvert.pj_inv(var xy: TXY): TLP;
var
  lp: TLP;
begin
	{ can't do as much preliminary checking as with forward }
	if (xy.x = HUGE_VAL) or (xy.y = HUGE_VAL) then
   begin
     lp.phi := HUGE_VAL; lp.lam := lp.phi;
	  pj_errno :=-15; exit;
	end;
   pj_errno := 0;
	xy.x := (xy.x * to_meter- x0) * ra; { de-scale and de-offset }
	xy.y := (xy.y * to_meter- y0) * ra;
	lp := TInverse(inv)(xy, Self); { inverse project }
	if pj_errno<> 0 then
   begin
     lp.phi := HUGE_VAL;
	  lp.lam := lp.phi;
	end else
   begin
		lp.lam := lp.lam + lam0; { reduce from del lp.lam }
		if not over then
			lp.lam := adjlon(lp.lam); { adjust longitude to CM }
		if geoc and (abs(abs(lp.phi) - HALFPI) > EPS) then
			lp.phi := arctan(one_es * tan(lp.phi));
	end;
	result := lp;
end;

// ------------------------------------------------------------------ //
procedure TGeoConvert.Geo_CoordSysInit(Params: TStringList);
var
  name,s,temp: String;
  proj: TProj;
  pc: TProjectionCode;
  found: boolean;
  pl: TStringList;

  procedure SetUnits;
  var
     i: integer;
  begin
     { set units }
     s := '';
     name := pj_param.AsString('units');
     if Length(name) > 0 then
     begin
       units := name;
       found := false;
       for i := low(pj_units) to high(pj_units) do
       begin
         if AnsiCompareText(pj_units[i].ID,Name)=0 then
         begin
            found := true;
            break;
         end;
       end;
       if not found then
       begin
         pj_errno := -7;
         exit;
       end;
       s := FloatToStr(pj_units[i].to_meter);
     end;
     temp := pj_param.AsString( 'to_meter' );
     if Length(temp) > 0 then s := temp;
     if Length(s) > 0 then
     begin
        to_meter := StrToFloat(s);
        fr_meter := 1 / to_meter;
     end else
     begin
        fr_meter := 1;
        to_meter := fr_meter;
     end;
  end;

begin
  { this signals as not having a projection }
  fwd:=nil;
  inv:=nil;
  spc:=nil;

  fParaList.Assign(Params);

  pl := fParaList;
  pj_errno := 0;

  if pl.count = 0 then
  begin
    pj_errno := -1;
    exit;
  end;

  { find projection selection }
  name := pj_param.AsString( 'proj' );
  if Length(name) = 0 then
  begin
     pj_errno := -4;
     exit;
  end;
  found := false;
  for pc := low(pj_list) to high(pj_list) do
  begin
     if AnsiCompareText(pj_list[pc].id,name)=0 then
     begin
        found := true;
        break;
     end;
  end;
  if not found then
  begin
     pj_errno := -5;
     exit;
  end;
  proj := pj_list[pc].proj;
  { initialize projection structure }
  proj(self,true);
  { set ellipsoid/sphere parameters }
  if pj_ell_set(a, es) <> 0 then
  begin
     exit;
  end;
  e := sqrt(es);
  ra := 1 / a;
  one_es := 1 - es;
  if one_es = 0 then
  begin
     pj_errno :=-6;
     exit;
  end;
  rone_es := 1 / one_es;
  { set PIN.geoc coordinate system }
  self.geoc := (es <> 0) and pj_param.AsBoolean('geoc');
  { over-ranging flag }
  self.over := pj_param.AsBoolean('over');
  { central meridian }
  self.lam0 := pj_param.AsRadians('lon_0');
  { central latitude }
  self.phi0 := pj_param.AsRadians('lat_0');
  { false easting and northing }
  self.x0 := pj_param.asfloat('x_0');
  self.y0 := pj_param.asfloat('y_0');
  { general scaling factor }
  if pj_param.Defined('k_0') then
     self.k0 := pj_param.asfloat('k_0')
  else if pj_param.Defined('k') then
     self.k0 := pj_param.asfloat('k')
  else
  	  self.k0 := 1;
  if self.k0 <= 0 then
  begin
  	  pj_errno := -31;
  	  exit;
  end;

  { 设置单位 }
  SetUnits;
  if pj_errno <> 0 then
  begin
     exit;
  end;

  { projection specific initialization }
  proj( self, false );
  if pj_errno <> 0 then
  begin
     // you can raise error here and clean up some memory if needed (not now)
  end;
end;

function TGeoConvert.HasProjection: Boolean;
begin
  result := fwd <>  nil;
end;

procedure TGeoConvert.Geo_CoordSysToLatLong(const x, y : Double; var long, lat: Double);
var
  lp: TLP;
  xy: TXY;
begin
  { returns long, lat in degrees }
  xy.x := x;
  xy.y :=  y;
  lp :=  pj_inv(xy);
  long :=  RadToDeg( lp.lam );
  lat := RadToDeg( lp.phi );
end;

procedure TGeoConvert.Geo_CoordSysFromLatLong(const long, lat : Double; var x, y: Double);
var
  lp: TLP;
  xy: TXY;
begin
  { receives long,lat in degrees }
  lp.lam := DegToRad(long);
  lp.phi := DegToRad(lat);
  xy := pj_fwd(lp);
  x := xy.x;
  y := xy.y;
end;

{calculate distance from (long1,lat1) to (long2,lat2)
 geodetic inverse problem is used}
function TGeoConvert.Geo_Distance(long1,lat1,long2,lat2: double): double;
var
  faz, baz, b: double;      //Forward and Backward azimuth
begin
  b := a * sqrt(1 - es);
  invert1(DegToRad(lat1),DegToRad(long1),DegToRad(lat2),DegToRad(long2),
     a,(a-b)/a,faz,baz,Result);
  Result:= Result * fr_meter;  // return in units configured, example feet
end;
// ----------------------------------------------------------------------

procedure init_projs;
begin
  pj_list[aea      ].proj := @aeap.aea;
  //pj_list[aeqd     ].proj := nil;
  pj_list[airy     ].proj := @airyp.airy;
  //pj_list[aitoff   ].proj := nil;
  //pj_list[alsk     ].proj := nil;
  //pj_list[apian    ].proj := nil;
  //pj_list[august   ].proj := nil;
  //pj_list[bacon    ].proj := nil;
  //pj_list[bipc     ].proj := nil;
  //pj_list[boggs    ].proj := nil;
  //pj_list[bonne    ].proj := nil;
  //pj_list[cass     ].proj := nil;
  //pj_list[cc       ].proj := nil;
  //pj_list[cea      ].proj := nil;
  //pj_list[chamb    ].proj := nil;
  //pj_list[collg    ].proj := nil;
  //pj_list[crast    ].proj := nil;
  //pj_list[denoy    ].proj := nil;
  //pj_list[eck1     ].proj := nil;
  //pj_list[eck2     ].proj := nil;
  //pj_list[eck3     ].proj := nil;
  //pj_list[eck4     ].proj := nil;
  //pj_list[eck5     ].proj := nil;
  //pj_list[eck6     ].proj := nil;
  //pj_list[eqc      ].proj := nil;
  //pj_list[eqdc     ].proj := nil;
  //pj_list[euler    ].proj := nil;
  //pj_list[fahey    ].proj := nil;
  //pj_list[fouc     ].proj := nil;
  //pj_list[fouc_s   ].proj := nil;
  //pj_list[gall     ].proj := nil;
  //pj_list[gins8    ].proj := nil;
  //pj_list[gn_sinu  ].proj := nil;
  //pj_list[gnom     ].proj := nil;
  //pj_list[goode    ].proj := nil;
  //pj_list[gs48     ].proj := nil;
  //pj_list[gs50     ].proj := nil;
  //pj_list[hammer   ].proj := nil;
  //pj_list[hatano   ].proj := nil;
  //pj_list[imw_p    ].proj := nil;
  //pj_list[kav5     ].proj := nil;
  //pj_list[kav7     ].proj := nil;
  //pj_list[labrd    ].proj := nil;
  //pj_list[laea     ].proj := nil;
  //pj_list[lagrng   ].proj := nil;
  //pj_list[larr     ].proj := nil;
  //pj_list[lask     ].proj := nil;
  pj_list[lcc      ].proj := @lccp.lcc;
  pj_list[leac     ].proj := @aeap.leac;
  //pj_list[lee_os   ].proj := nil;
  //pj_list[loxim    ].proj := nil;
  //pj_list[lsat     ].proj := nil;
  //pj_list[mbt_s    ].proj := nil;
  //pj_list[mbt_fps  ].proj := nil;
  //pj_list[mbtfpp   ].proj := nil;
  //pj_list[mbtfpq   ].proj := nil;
  //pj_list[mbtfps   ].proj := nil;
  pj_list[merc     ].proj := @mercp.merc;
  //pj_list[mil_os   ].proj := nil;
  //pj_list[mill     ].proj := nil;
  //pj_list[mpoly    ].proj := nil;
  //pj_list[moll     ].proj := nil;
  //pj_list[murd1    ].proj := nil;
  //pj_list[murd2    ].proj := nil;
  //pj_list[murd3    ].proj := nil;
  //pj_list[nell     ].proj := nil;
  //pj_list[nell_h   ].proj := nil;
  //pj_list[nicol    ].proj := nil;
  //pj_list[nsper    ].proj := nil;
  //pj_list[nzmg     ].proj := nil;
  //pj_list[ob_tran  ].proj := nil;
  //pj_list[ocea     ].proj := nil;
  //pj_list[oea      ].proj := nil;
  pj_list[omerc    ].proj := @tmercp.omerc;
  //pj_list[ortel    ].proj := nil;
  //pj_list[ortho    ].proj := nil;
  //pj_list[pconic   ].proj := nil;
  //pj_list[poly     ].proj := nil;
  //pj_list[putp1    ].proj := nil;
  //pj_list[putp2    ].proj := nil;
  //pj_list[putp3    ].proj := nil;
  //pj_list[putp3p   ].proj := nil;
  //pj_list[putp4p   ].proj := nil;
  //pj_list[putp5    ].proj := nil;
  //pj_list[putp5p   ].proj := nil;
  //pj_list[putp6    ].proj := nil;
  //pj_list[putp6p   ].proj := nil;
  //pj_list[qua_aut  ].proj := nil;
  //pj_list[robin    ].proj := nil;
  //pj_list[rpoly    ].proj := nil;
  //pj_list[sinu     ].proj := nil;
  //pj_list[somerc   ].proj := nil;
  //pj_list[stere    ].proj := nil;
  //pj_list[tcc      ].proj := nil;
  //pj_list[tcea     ].proj := nil;
  //pj_list[tissot   ].proj := nil;
  pj_list[tmerc    ].proj := @tmercp.tmerc;
  //pj_list[tpeqd    ].proj := nil;
  //pj_list[tpers    ].proj := nil;
  //pj_list[ups      ].proj := nil;
  //pj_list[urm5     ].proj := nil;
  //pj_list[urmfps   ].proj := nil;
  pj_list[utm      ].proj := @tmercp.utm;
  //pj_list[vandg    ].proj := nil;
  //pj_list[vandg2   ].proj := nil;
  //pj_list[vandg3   ].proj := nil;
  //pj_list[vandg4   ].proj := nil;
  //pj_list[vitk1    ].proj := nil;
  //pj_list[wag1     ].proj := nil;
  //pj_list[wag2     ].proj := nil;
  //pj_list[wag3     ].proj := nil;
  //pj_list[wag4     ].proj := nil;
  //pj_list[wag5     ].proj := nil;
  //pj_list[wag6     ].proj := nil;
  //pj_list[wag7     ].proj := nil;
  //pj_list[weren    ].proj := nil;
  //pj_list[wink1    ].proj := nil;
  //pj_list[wink2    ].proj := nil;
  //pj_list[wintri   ].proj := nil;
end;

initialization
  init_projs;

end.
