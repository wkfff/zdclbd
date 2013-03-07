unit FrmRecvRunRecDataUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Types, CarUnit;

type
  TfrmRunRecDataUpload = class(TForm)
    Memo1: TMemo;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure AddDataToMemo(s: string);
  public
    { Public declarations }
    procedure OnRunRecDataUpload(cmdFlag: Byte; data: TByteDynArray; dev: TDevice);
  end;


implementation
uses
  umainf;

{$R *.dfm}

procedure TfrmRunRecDataUpload.AddDataToMemo(s: string);
begin
  if Trim(s) <> '' then
  begin
    Memo1.Lines.Add(FormatDateTime('yyyy-MM-dd hh:nn:ss', Now) + '   ' + Trim(s));
  end;  
end;

procedure TfrmRunRecDataUpload.N1Click(Sender: TObject);
begin
  Memo1.Clear;
end;

procedure TfrmRunRecDataUpload.OnRunRecDataUpload(cmdFlag: Byte;
  data: TByteDynArray; dev: TDevice);
var
  s1: string;
  s: string;
  arr: array of Byte;
  i: Integer;
begin
  s := '';
  case cmdFlag of
    $01://驾驶员代码及对应的机动车驾驶证号码
      begin
        SetLength(arr, 3);
        CopyMemory(@arr[0], @data[0], 3);
        i := arr[0] * 65536 + arr[1] * 256 + arr[2];
        SetLength(s1, Length(data));
        CopyMemory(@s1[1], @data[3], Length(data) - 3);
        s := '车辆(车牌号:' + dev.Car.No + ',设备号:' + dev.Id + ')当前驾驶人信息:驾驶员代码[' + IntToStr(i) + '] 机动车驾驶证号码[' + Trim(s1) + ']';
      end;
    $02://记录仪的实时时钟
      begin
        s := '车辆(车牌号:' + dev.Car.No + ',设备号:' + dev.Id + ')的记录仪实时时间:20' + IntToHex(data[0], 2) + '-' + IntToHex(data[1], 2) + '-' + IntToHex(data[2], 2) + ' ' + IntToHex(data[3], 2) + ':' + IntToHex(data[4], 2) + ':' + IntToHex(data[5], 2);
      end;
    $04://车辆特征系数
      begin
        SetLength(arr, 3);
        CopyMemory(@arr[0], @data[0], 3);
        i := arr[0] * 65536 + arr[1] * 256 + arr[2];
        s := '车辆(车牌号:' + dev.Car.No + ',设备号:' + dev.Id + ')特征系数:[' + IntToStr(i) + ']';
      end;  
    $06://采集记录仪中的车辆特征系数
      begin
        SetLength(s1, 17);
        CopyMemory(@s1[1], @data[0], 17);
        s := '车辆(车牌号:' + dev.Car.No + ',设备号:' + dev.Id + ')车辆VIN号[' + Trim(s1) + ']';
        SetLength(s1, 12);
        CopyMemory(@s1[1], @data[17], 12);
        s := s + ',车牌号码[' + Trim(s1) + ']';
        SetLength(s1, 12);
        CopyMemory(@s1[1], @data[29], 12);
        s := s + ',车牌分类[' + Trim(s1) + ']';
        s := '车辆信息:' + s;
      end;
    {
    $00:
      begin
        s := '车辆(车牌号:' + dev.Car.No + ',设备号:' + dev.Id + ')记录仪执行标准版本:记录仪执行标准年号[' + IntToHex(data[0], 2) + '],修改单号[' + IntToStr(data[1]) + ']';
      end;
    $01:
      begin
        SetLength(s1, Length(data));
        CopyMemory(@s1[1], @data[0], Length(data));
        s := '车辆(车牌号:' + dev.Car.No + ',设备号:' + dev.Id + ')当前驾驶人信息:机动车驾驶证号码[' + s1 + ']';
      end;
    $02:
      begin
        s := '车辆(车牌号:' + dev.Car.No + ',设备号:' + dev.Id + ')的记录仪实时时间:20' + IntToHex(data[0], 2) + '-' + IntToHex(data[1], 2) + '-' + IntToHex(data[2], 2) + ' ' + IntToHex(data[3], 2) + ':' + IntToHex(data[4], 2) + ':' + IntToHex(data[5], 2);
      end;
    $03:
      begin
        s := '车辆(车牌号:' + dev.Car.No + ',设备号:' + dev.Id + ')累计行驶里程:记录仪实时时间[20' + IntToHex(data[0], 2) + '-' + IntToHex(data[1], 2) + '-' + IntToHex(data[2], 2) + ' ' + IntToHex(data[3], 2) + ':' + IntToHex(data[4], 2) + ':' + IntToHex(data[5], 2) + '],'
                         + '记录仪初次安装时间[' + IntToHex(data[6], 2) + '-' + IntToHex(data[7], 2) + '-' + IntToHex(data[8], 2) + ' ' + IntToHex(data[9], 2) + ':' + IntToHex(data[10], 2) + ':' + IntToHex(data[11], 2) + '],'
                         + '初始里程[' + FormatFloat('#0.0', StrToInt(IntToHex(data[12], 2) + IntToHex(data[13], 2) + IntToHex(data[14], 2) + IntToHex(data[15], 2) + IntToHex(data[16], 2) + IntToHex(data[17], 2)) * 0.1) + '],'
                         + '累计行驶里程[' + FormatFloat('#0.0', StrToInt(IntToHex(data[18], 2) + IntToHex(data[19], 2) + IntToHex(data[20], 2) + IntToHex(data[21], 2) + IntToHex(data[22], 2) + IntToHex(data[23], 2)) * 0.1) + ']';
      end;
    $04:
      begin
        s := '车辆(车牌号:' + dev.Car.No + ',设备号:' + dev.Id + ')记录仪脉冲系数:记录仪实时时间[20' + IntToHex(data[0], 2) + '-' + IntToHex(data[1], 2) + '-' + IntToHex(data[2], 2) + ' ' + IntToHex(data[3], 2) + ':' + IntToHex(data[4], 2) + ':' + IntToHex(data[5], 2) + '],'
                          + '脉冲系数[' + IntToStr(data[6] * 255 + data[7]) + '(' + IntToHex(data[6], 2) + IntToHex(data[7], 2)+ ')]';
      end;
    $05:
      begin
        SetLength(s1, 17);
        CopyMemory(@s1[1], @data[0], 17);
        s := '车辆(车牌号:' + dev.Car.No + ',设备号:' + dev.Id + ')车辆识别代号[' + s1 + ']';
        SetLength(s1, 12);
        CopyMemory(@s1[1], @data[17], 12);
        s := s + ',机动车号牌号码[' + s1 + ']';
        SetLength(s1, 12);
        CopyMemory(@s1[1], @data[29], 12);
        s := s + ',机动车号牌分类[' + s1 + ']';
        s := '车辆信息:' + s;
      end;
    $07:
      begin
        SetLength(s1, 7);
        CopyMemory(@s1[1], @data[0], 7);
        s := '车辆(车牌号:' + dev.Car.No + ',设备号:' + dev.Id + ')生产厂CCC认证代码[' + s1 + ']';
        SetLength(s1, 16);
        CopyMemory(@s1[1], @data[7], 16);
        s := s + ',认证产品型号[' + s1 + ']';
        s := s + ',生产日期[' + IntToHex(data[23], 2) + '-' + IntToHex(data[24], 2) + '-' + IntToHex(data[25], 2) + ']';
        s := s + ',生产流水号[' + IntToStr(LongWord(@data[26])) + '(' + IntToHex(data[26], 2) + IntToHex(data[27], 2) + IntToHex(data[28], 2) + IntToHex(data[29], 2) + ')]'
      end;}
  end;
  AddDataToMemo(s);
end;

procedure TfrmRunRecDataUpload.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Mainf.show_RunRecData.Checked := False;
end;

end.
