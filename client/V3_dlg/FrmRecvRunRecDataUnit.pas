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
    $01://��ʻԱ���뼰��Ӧ�Ļ�������ʻ֤����
      begin
        SetLength(arr, 3);
        CopyMemory(@arr[0], @data[0], 3);
        i := arr[0] * 65536 + arr[1] * 256 + arr[2];
        SetLength(s1, Length(data));
        CopyMemory(@s1[1], @data[3], Length(data) - 3);
        s := '����(���ƺ�:' + dev.Car.No + ',�豸��:' + dev.Id + ')��ǰ��ʻ����Ϣ:��ʻԱ����[' + IntToStr(i) + '] ��������ʻ֤����[' + Trim(s1) + ']';
      end;
    $02://��¼�ǵ�ʵʱʱ��
      begin
        s := '����(���ƺ�:' + dev.Car.No + ',�豸��:' + dev.Id + ')�ļ�¼��ʵʱʱ��:20' + IntToHex(data[0], 2) + '-' + IntToHex(data[1], 2) + '-' + IntToHex(data[2], 2) + ' ' + IntToHex(data[3], 2) + ':' + IntToHex(data[4], 2) + ':' + IntToHex(data[5], 2);
      end;
    $04://��������ϵ��
      begin
        SetLength(arr, 3);
        CopyMemory(@arr[0], @data[0], 3);
        i := arr[0] * 65536 + arr[1] * 256 + arr[2];
        s := '����(���ƺ�:' + dev.Car.No + ',�豸��:' + dev.Id + ')����ϵ��:[' + IntToStr(i) + ']';
      end;  
    $06://�ɼ���¼���еĳ�������ϵ��
      begin
        SetLength(s1, 17);
        CopyMemory(@s1[1], @data[0], 17);
        s := '����(���ƺ�:' + dev.Car.No + ',�豸��:' + dev.Id + ')����VIN��[' + Trim(s1) + ']';
        SetLength(s1, 12);
        CopyMemory(@s1[1], @data[17], 12);
        s := s + ',���ƺ���[' + Trim(s1) + ']';
        SetLength(s1, 12);
        CopyMemory(@s1[1], @data[29], 12);
        s := s + ',���Ʒ���[' + Trim(s1) + ']';
        s := '������Ϣ:' + s;
      end;
    {
    $00:
      begin
        s := '����(���ƺ�:' + dev.Car.No + ',�豸��:' + dev.Id + ')��¼��ִ�б�׼�汾:��¼��ִ�б�׼���[' + IntToHex(data[0], 2) + '],�޸ĵ���[' + IntToStr(data[1]) + ']';
      end;
    $01:
      begin
        SetLength(s1, Length(data));
        CopyMemory(@s1[1], @data[0], Length(data));
        s := '����(���ƺ�:' + dev.Car.No + ',�豸��:' + dev.Id + ')��ǰ��ʻ����Ϣ:��������ʻ֤����[' + s1 + ']';
      end;
    $02:
      begin
        s := '����(���ƺ�:' + dev.Car.No + ',�豸��:' + dev.Id + ')�ļ�¼��ʵʱʱ��:20' + IntToHex(data[0], 2) + '-' + IntToHex(data[1], 2) + '-' + IntToHex(data[2], 2) + ' ' + IntToHex(data[3], 2) + ':' + IntToHex(data[4], 2) + ':' + IntToHex(data[5], 2);
      end;
    $03:
      begin
        s := '����(���ƺ�:' + dev.Car.No + ',�豸��:' + dev.Id + ')�ۼ���ʻ���:��¼��ʵʱʱ��[20' + IntToHex(data[0], 2) + '-' + IntToHex(data[1], 2) + '-' + IntToHex(data[2], 2) + ' ' + IntToHex(data[3], 2) + ':' + IntToHex(data[4], 2) + ':' + IntToHex(data[5], 2) + '],'
                         + '��¼�ǳ��ΰ�װʱ��[' + IntToHex(data[6], 2) + '-' + IntToHex(data[7], 2) + '-' + IntToHex(data[8], 2) + ' ' + IntToHex(data[9], 2) + ':' + IntToHex(data[10], 2) + ':' + IntToHex(data[11], 2) + '],'
                         + '��ʼ���[' + FormatFloat('#0.0', StrToInt(IntToHex(data[12], 2) + IntToHex(data[13], 2) + IntToHex(data[14], 2) + IntToHex(data[15], 2) + IntToHex(data[16], 2) + IntToHex(data[17], 2)) * 0.1) + '],'
                         + '�ۼ���ʻ���[' + FormatFloat('#0.0', StrToInt(IntToHex(data[18], 2) + IntToHex(data[19], 2) + IntToHex(data[20], 2) + IntToHex(data[21], 2) + IntToHex(data[22], 2) + IntToHex(data[23], 2)) * 0.1) + ']';
      end;
    $04:
      begin
        s := '����(���ƺ�:' + dev.Car.No + ',�豸��:' + dev.Id + ')��¼������ϵ��:��¼��ʵʱʱ��[20' + IntToHex(data[0], 2) + '-' + IntToHex(data[1], 2) + '-' + IntToHex(data[2], 2) + ' ' + IntToHex(data[3], 2) + ':' + IntToHex(data[4], 2) + ':' + IntToHex(data[5], 2) + '],'
                          + '����ϵ��[' + IntToStr(data[6] * 255 + data[7]) + '(' + IntToHex(data[6], 2) + IntToHex(data[7], 2)+ ')]';
      end;
    $05:
      begin
        SetLength(s1, 17);
        CopyMemory(@s1[1], @data[0], 17);
        s := '����(���ƺ�:' + dev.Car.No + ',�豸��:' + dev.Id + ')����ʶ�����[' + s1 + ']';
        SetLength(s1, 12);
        CopyMemory(@s1[1], @data[17], 12);
        s := s + ',���������ƺ���[' + s1 + ']';
        SetLength(s1, 12);
        CopyMemory(@s1[1], @data[29], 12);
        s := s + ',���������Ʒ���[' + s1 + ']';
        s := '������Ϣ:' + s;
      end;
    $07:
      begin
        SetLength(s1, 7);
        CopyMemory(@s1[1], @data[0], 7);
        s := '����(���ƺ�:' + dev.Car.No + ',�豸��:' + dev.Id + ')������CCC��֤����[' + s1 + ']';
        SetLength(s1, 16);
        CopyMemory(@s1[1], @data[7], 16);
        s := s + ',��֤��Ʒ�ͺ�[' + s1 + ']';
        s := s + ',��������[' + IntToHex(data[23], 2) + '-' + IntToHex(data[24], 2) + '-' + IntToHex(data[25], 2) + ']';
        s := s + ',������ˮ��[' + IntToStr(LongWord(@data[26])) + '(' + IntToHex(data[26], 2) + IntToHex(data[27], 2) + IntToHex(data[28], 2) + IntToHex(data[29], 2) + ')]'
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
