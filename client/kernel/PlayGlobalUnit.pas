unit PlayGlobalUnit;

interface
uses
  comCtrls, SysUtils, classes, UserUnit, CarUnit, BusinessServerUnit, ParamUnit,
  MapProj, GateWayServerUnit, ResUnit, Forms, windows, Messages, gpslibunit,dbclient;
var
  PlayDev: TDevice;
  GClientDataSet_Lade: TClientDataSet; //载货明细用的
  GClientDataSet_LadeStat: TClientDataSet; //载货统计用的
  GClientDataSet_Dumpage: TClientDataSet; //可疑倾倒明细
  GClientDataSet_DumpageStat : TClientDataSet; //可疑倾倒统计

implementation


initialization         
  PlayDev := TDevice.Create;
  PlayDev.Car := TCar.Create;
  PlayDev.isOnline:=false;    //===SWP初开始设置
  PlayDev.First:=true;

  GClientDataSet_Lade := TClientDataSet.Create(nil);
  GClientDataSet_LadeStat := TClientDataSet.Create(nil);
  GClientDataSet_Dumpage := TClientDataSet.Create(nil);
  GClientDataSet_DumpageStat := TClientDataSet.Create(nil);
finalization
  PlayDev.Car.Free;
  PlayDev.Free;
  GClientDataSet_Lade.Free;
  GClientDataSet_LadeStat.Free;
  GClientDataSet_Dumpage.Free;
  GClientDataSet_DumpageStat.Free;
end.
