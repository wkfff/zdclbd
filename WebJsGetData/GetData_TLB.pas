unit GetData_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 2011-10-12 16:01:09 from Type Library described below.

// ************************************************************************  //
// Type Lib: E:\Delphi\两客一危车辆监控客户端\JKClient\WebJsGetData\GetData.tlb (1)
// LIBID: {10FF751A-2BAA-4AD2-9A25-C9C6AEB112EF}
// LCID: 0
// Helpfile: 
// HelpString: Project1 Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\SYSTEM32\STDOLE2.TLB)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  GetDataMajorVersion = 1;
  GetDataMinorVersion = 0;

  LIBID_GetData: TGUID = '{10FF751A-2BAA-4AD2-9A25-C9C6AEB112EF}';

  IID_IGetData: TGUID = '{99700A44-ABE8-476D-8158-7CDDF547173F}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IGetData = interface;
  IGetDataDisp = dispinterface;

// *********************************************************************//
// Interface: IGetData
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {99700A44-ABE8-476D-8158-7CDDF547173F}
// *********************************************************************//
  IGetData = interface(IDispatch)
    ['{99700A44-ABE8-476D-8158-7CDDF547173F}']
    function DoSearchData(ASQL: OleVariant): OleVariant; safecall;
    procedure OnCarAction(const DevIdStr: WideString); safecall;
    procedure EndPlayHistroy; safecall;
    procedure SelectDevList(const DevListStr: WideString); safecall;
    function UserDefinedText(const log: WideString; const lat: WideString): OleVariant; safecall;
    function GetDefinedTextList: OleVariant; safecall;
    function SetConfineArea(const LogLatStr: WideString): OleVariant; safecall;
    function GetExePath: OleVariant; safecall;
    function GetDefaultMap: OleVariant; safecall;
    procedure OpenRefreshDev; safecall;
    procedure SendSearchOrderPoints(AddressList: OleVariant); safecall;
    function SetConfineAreaToDev(const AreaType: WideString; const LogLatStr: WideString; 
                                 const CenterPoint: WideString; const Radius: WideString): OleVariant; safecall;
    function SetToLineToDev(const LogLatStr: WideString): OleVariant; safecall;
    procedure BrowseSeekCar(const LogLatList: WideString); safecall;
    function SetCircleArea(const Radius: WideString; const CenterPoint: WideString; 
                           const LastPoint: WideString): OleVariant; safecall;
    function GetDistance(const BeginPoint: WideString; const EndPoint: WideString): OleVariant; safecall;
    function GetConfineAreaToDev: OleVariant; safecall;
    function GetConfineArea: OleVariant; safecall;
    procedure SetDevGeocodeSearch(const DevIdStr: WideString; const Result: WideString); safecall;
    function GetCenterCityLngLat(const CityName: WideString): OleVariant; safecall;
    procedure InitMap; safecall;
    function GetMapIP: OleVariant; safecall;
  end;

// *********************************************************************//
// DispIntf:  IGetDataDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {99700A44-ABE8-476D-8158-7CDDF547173F}
// *********************************************************************//
  IGetDataDisp = dispinterface
    ['{99700A44-ABE8-476D-8158-7CDDF547173F}']
    function DoSearchData(ASQL: OleVariant): OleVariant; dispid 201;
    procedure OnCarAction(const DevIdStr: WideString); dispid 202;
    procedure EndPlayHistroy; dispid 203;
    procedure SelectDevList(const DevListStr: WideString); dispid 204;
    function UserDefinedText(const log: WideString; const lat: WideString): OleVariant; dispid 205;
    function GetDefinedTextList: OleVariant; dispid 206;
    function SetConfineArea(const LogLatStr: WideString): OleVariant; dispid 207;
    function GetExePath: OleVariant; dispid 208;
    function GetDefaultMap: OleVariant; dispid 209;
    procedure OpenRefreshDev; dispid 210;
    procedure SendSearchOrderPoints(AddressList: OleVariant); dispid 211;
    function SetConfineAreaToDev(const AreaType: WideString; const LogLatStr: WideString; 
                                 const CenterPoint: WideString; const Radius: WideString): OleVariant; dispid 212;
    function SetToLineToDev(const LogLatStr: WideString): OleVariant; dispid 213;
    procedure BrowseSeekCar(const LogLatList: WideString); dispid 214;
    function SetCircleArea(const Radius: WideString; const CenterPoint: WideString; 
                           const LastPoint: WideString): OleVariant; dispid 215;
    function GetDistance(const BeginPoint: WideString; const EndPoint: WideString): OleVariant; dispid 216;
    function GetConfineAreaToDev: OleVariant; dispid 217;
    function GetConfineArea: OleVariant; dispid 218;
    procedure SetDevGeocodeSearch(const DevIdStr: WideString; const Result: WideString); dispid 219;
    function GetCenterCityLngLat(const CityName: WideString): OleVariant; dispid 220;
    procedure InitMap; dispid 221;
    function GetMapIP: OleVariant; dispid 222;
  end;

implementation

uses ComObj;

end.
