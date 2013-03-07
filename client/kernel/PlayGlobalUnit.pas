unit PlayGlobalUnit;

interface
uses
  comCtrls, SysUtils, classes, UserUnit, CarUnit, BusinessServerUnit, ParamUnit,
  MapProj, GateWayServerUnit, ResUnit, Forms, windows, Messages, gpslibunit,dbclient;
var
  PlayDev: TDevice;
  GClientDataSet_Lade: TClientDataSet; //�ػ���ϸ�õ�
  GClientDataSet_LadeStat: TClientDataSet; //�ػ�ͳ���õ�
  GClientDataSet_Dumpage: TClientDataSet; //�����㵹��ϸ
  GClientDataSet_DumpageStat : TClientDataSet; //�����㵹ͳ��

implementation


initialization         
  PlayDev := TDevice.Create;
  PlayDev.Car := TCar.Create;
  PlayDev.isOnline:=false;    //===SWP����ʼ����
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
