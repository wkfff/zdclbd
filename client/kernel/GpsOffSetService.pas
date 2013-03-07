// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://218.94.158.108:7079/GpsOffSetService.asmx?wsdl
// Encoding : utf-8
// Version  : 1.0
// (2012-10-23 13:10:39 - 1.33.2.5)
// ************************************************************************ //

unit GpsOffSetService;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:double          - "http://www.w3.org/2001/XMLSchema"



  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // soapAction: http://tempuri.org/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // binding   : GpsOffSetServiceSoap
  // service   : GpsOffSetService
  // port      : GpsOffSetServiceSoap
  // URL       : http://218.94.158.108:7079/GpsOffSetService.asmx
  // ************************************************************************ //
  GpsOffSetServiceSoap = interface(IInvokable)
  ['{FFDFB7F6-9756-4E6D-888F-1701617B0090}']
    function  HelloWorld: WideString; stdcall;
    function  offsetCoord(const x: Double; const y: Double): WideString; stdcall;
    function  ConGeocoding(const x: Double; const y: Double): WideString; stdcall;
    function  ConGeocoding_51ditu(const x: Double; const y: Double): WideString; stdcall;
  end;

function GetGpsOffSetServiceSoap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): GpsOffSetServiceSoap;

var
  IP: string;
  PORT: string;
  
implementation

function GetGpsOffSetServiceSoap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): GpsOffSetServiceSoap;
const
  defWSDL = 'http://218.94.158.108:7079/GpsOffSetService.asmx?wsdl';
  defURL  = 'http://218.94.158.108:7079/GpsOffSetService.asmx';
  defSvc  = 'GpsOffSetService';
  defPrt  = 'GpsOffSetServiceSoap';
var
  RIO: THTTPRIO;
begin
  Result := nil;
   if (Addr = '') then
  begin
    if UseWSDL then
      Addr := 'http://' +IP+':'+PORT+'/GpsOffSetService.asmx?wsdl'//defWSDL     /VGpsWebServiceV3
    else
      Addr := 'http://' +IP+':'+PORT+'/GpsOffSetService.asmx';//defURL;
  end;

  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    RIO.HTTPWebNode.UseUTF8InHeader := True;
    Result := (RIO as GpsOffSetServiceSoap);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  InvRegistry.RegisterInterface(TypeInfo(GpsOffSetServiceSoap), 'http://tempuri.org/', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(GpsOffSetServiceSoap), 'http://tempuri.org/%operationName%');
  
  InvRegistry.RegisterInvokeOptions(TypeInfo(GpsOffSetServiceSoap),ioDocument);
end. 