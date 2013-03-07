unit GpsOffSetService_ImplUnit;

interface
uses GpsOffSetService,SysUtils,StrUtils,Classes, Windows;

type
  TBusinessSevercom_GpsInfo = class(TObject)
  private
    FGpsOffSetSvc:GpsOffSetServiceSoap;
    FBsGps_Port: Integer;
    FBsGps_Ip: String;
    procedure SetBsGps_Ip(const Value: String);
    procedure SetBsGps_Port(const Value: Integer);
  private
    function GetGpsOffSetSvc :GpsOffSetServiceSoap;
    
  public 
    //由经度、纬度，得出地址描述 
    function GetAddrFromLongiLati(longi,lati:Double):string;
    //调用 获取地址描述的webservice 的地址：218.94.158.108:7079
    property BsGps_Ip:String read FBsGps_Ip write SetBsGps_Ip;
    property BsGps_Port:Integer read FBsGps_Port write SetBsGps_Port;
  end;

  function GetAddrSevice(): TBusinessSevercom_GpsInfo;
  
implementation

var
  FAddrSevice : TBusinessSevercom_GpsInfo;
  
{ TBusinessSevercom_GpsInfo }


//由经纬度，获取地址描述
function TBusinessSevercom_GpsInfo.GetAddrFromLongiLati(longi,
  lati: Double): string;
//var
//  ss:string;
//  i:Integer;
//  longS,latiS:string;
begin
//  ss := GetGpsOffSetSvc.offsetCoord(longi,lati);
//  i:= Pos(',',ss);
//  if i>0 then
//  begin
//    longS := LeftStr(ss,i-1);
//    latiS := rightstr(ss,Length(ss)-i);
//    longi := StrToFloat(longs);
//    lati := StrToFloat(latiS);
//  end;

  if (longi<= 0) or (longi > 180)  or (lati <= 0) or (lati > 180) then
  begin
    Result := '';
    exit;
  end;
  Result := GetGpsOffSetSvc.ConGeocoding_51ditu(longi,lati);
  Result := StringReplace(Result,'附近附近','附近',[rfReplaceAll, rfIgnoreCase]);
  //  Result := GetGpsOffSetSvc.ConGeocoding(longi,lati);
end;

function TBusinessSevercom_GpsInfo.GetGpsOffSetSvc: GpsOffSetServiceSoap;
begin
  if FBsGps_Ip ='' then
  begin
    FBsGps_Ip :='218.94.158.108';
    FBsGps_Port :=7079;
  end;
  if FGpsOffSetSvc = nil then
  begin
    try
      GpsOffSetService.IP := FBsGps_Ip;
      GpsOffSetService.PORT := inttostr(FBsGps_Port);
      FGpsOffSetSvc := GetGpsOffSetServiceSoap();
    finally
    end;
  end;  
  Result := FGpsOffSetSvc;
end;

procedure TBusinessSevercom_GpsInfo.SetBsGps_Ip(const Value: String);
begin
  FBsGps_Ip := Value;
end;

procedure TBusinessSevercom_GpsInfo.SetBsGps_Port(const Value: Integer);
begin
  FBsGps_Port := Value;
end;


function GetAddrSevice(): TBusinessSevercom_GpsInfo;
begin
  if FAddrSevice = nil then
    FAddrSevice := TBusinessSevercom_GpsInfo.Create;
  Result := FAddrSevice;
end;

initialization
  FAddrSevice := nil;

finalization
  if FAddrSevice <> nil then
    FAddrSevice.Free;
end.
