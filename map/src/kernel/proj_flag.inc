{$define TESTING}               { Remove for the finished program }
{.$define MAP_CS}                { client server definition }
{.$define ISOPENDWG}
{.$define ISACTIVEX}
{.$DEFINE ISPROTECTED}
{.$define ISSIGMAP}
{.$define cybermaps}
{.$define REGKEY_SERVER}
{.$define AM_THREADSAFE}
{.$DEFINE SQLSUPPORT}       // uncomment if you want SQL support
{.$DEFINE PRO_VERSION}

{ ==== Do not change from here ==== }
{$ifdef REGKEY_SERVER}
   {$undef ISPROTECTED}
{$endif}
{.$define WITHBDE}                { use BDE some processing }
{$ifdef ISOPENDWG}
   {$define ACAD_EXTENSION}       { use AUTOCAD EXTENSION (READ/WRITE DWG/DXF/BDX FILES FROM VERSION 2.5 TO 14 OF AUTOCAD }
{$endif}
{$define ACAD_LOADONCALL}         { ONLY LOAD DLL WHEN NEEDED }
{$ifdef ISPROTECTED}
   {$define PROTECTION}           { SOFTWARE PROTECTION/REGISTRATION flag }
{$endif}
{$ifdef ISSIGMAP}
   {$define USEADO}                  { use ADO features that comes with Delphi 5 }
{$endif}
{$ifdef ISACTIVEX}
   {$define GEN_ACTIVEX}          {This switch is used to create an ActiveX/OCX }
{$endif}

{ ==== Determination of compiler and others (do NOT change) ==== }
{$ifdef VER100}      // Delphi 3
{$define LEVEL3}
{$define DELPHI}
{$endif}

{$ifdef VER110}      // C++ Builder 3
{$define LEVEL3}
{$define BCB3}
{$endif}

{$ifdef VER120}      // Delphi 4
{$define LEVEL4}
{$define DELPHI}
{$endif}

{$ifdef VER130}      // Delphi 5
{$define LEVEL4}
{$define LEVEL5}
{$define DELPHI}
{$endif}

{$ifdef VER125}      // C++ Builder 4
{$define LEVEL4}
{$define BCB4}
{$endif}

{$IFDEF VER140}      // Delphi 6
{$DEFINE LEVEL4}
{$DEFINE LEVEL5}
{$DEFINE LEVEL6}
{$DEFINE DELPHI}
{$ENDIF}
//***********************************************************************

{$A-}

{$BOOLEVAL OFF}   // no complete boolean eval
{$IFDEF TESTING}
{$ASSERTIONS ON}
{$D+} {Enables and disables the generation of debug information}
{$L+} {Enables or disables the generation of local symbol information}
{$ELSE}
{$ASSERTIONS OFF}
{$D-} {Enables and disables the generation of debug information}
{$L-} {Enables or disables the generation of local symbol information}
{$ENDIF}

{==== Global fixed compiler options (do NOT change) ====}
{---Delphi 3---}
  {$IFDEF level3}
  {$B- Incomplete boolean evaluation}
  {$H+ Long string support}
  {$J+ Writeable typed constants}
  {$P- No open string parameters}
  {$Q- No arithmetic overflow checking}
  {$R- No range checking}
  {$T- No type-checked pointers}
  {$V- No var string checking}
  {$X+ Extended syntax}
  {$Z1 Enumerations are word sized}
  {$ENDIF}
{---Delphi 4---}
  {$IFDEF level4}
  {$B- Incomplete boolean evaluation}
  {$H+ Long string support}
  {$J+ Writeable typed constants}
  {$P- No open string parameters}
  {$Q- No arithmetic overflow checking}
  {$R- No range checking}
  {$T- No type-checked pointers}
  {$V- No var string checking}
  {$X+ Extended syntax}
  {$Z1 Enumerations are word sized}
  {$ENDIF}
{---Delphi 5---}
  {$IFDEF level5}
  {$B- Incomplete boolean evaluation}
  {$H+ Long string support}
  {$J+ Writeable typed constants}
  {$P- No open string parameters}
  {$Q- No arithmetic overflow checking}
  {$R- No range checking}
  {$T- No type-checked pointers}
  {$V- No var string checking}
  {$X+ Extended syntax}
  {$Z1 Enumerations are word sized}
  {$ENDIF}
{---Delphi 6---}
  {$IFDEF level6}
  {$B- Incomplete boolean evaluation}
  {$H+ Long string support}
  {$J+ Writeable typed constants}
  {$P- No open string parameters}
  {$Q- No arithmetic overflow checking}
  {$R- No range checking}
  {$T- No type-checked pointers}
  {$V- No var string checking}
  {$X+ Extended syntax}
  {$Z1 Enumerations are word sized}
  {$ENDIF}
{---C++Builder 3---}
  {$IFDEF bcb3}
  {$B- Incomplete boolean evaluation}
  {$H+ Long string support}
  {$J+ Writeable typed constants}
  {$P- No open string parameters}
  {$Q- No arithmetic overflow checking}
  {$R- No range checking}
  {$T- No type-checked pointers}
  {$V- No var string checking}
  {$X+ Extended syntax}
  {$Z1 Enumerations are word sized}
  {$OBJEXPORTALL ON}
  {$ENDIF}
{---C++Builder 4---}
  {$IFDEF bcb4}
  {$B- Incomplete boolean evaluation}
  {$H+ Long string support}
  {$J+ Writeable typed constants}
  {$P- No open string parameters}
  {$Q- No arithmetic overflow checking}
  {$R- No range checking}
  {$T- No type-checked pointers}
  {$V- No var string checking}
  {$X+ Extended syntax}
  {$Z1 Enumerations are word sized}
  {$OBJEXPORTALL ON}
  {$ENDIF}




