{�ṩ�����ƻ��浽�ɼ��ַ�֮���ת��
 @author()
 @created(2002-11-04)
 @lastmod(GMT:$Date: 2012/10/29 01:46:42 $) <BR>
 ��������:$Author: wfp $  <BR>
 ��ǰ�汾:$Revision: 1.1.1.1 $  <BR>}
unit MemFormatUnit;

interface
uses
  Sysutils;

  {��һ�δ�������ת����ʮ�����Ʊ�ʾ���ַ���
  @param ABuff:Pointer Ҫת�����ڴ�����ַ
  @parem ALen:integer   ת�����ݳ���
  @return ���ظ�ʽ������ַ���
  @ver(,2003-9-10,
  ����޸�:NULL,2003-9-10)}
function BuffToHex(ABuff: Pointer; ALen: integer): string;

implementation
uses
  windows;

function BuffToHex(ABuff: Pointer; ALen: integer): string;
var
  i: integer;
begin
  Result := '';
  for i := 0 to ALen - 1 do
  begin
    Result := Result + InttoHex(PByte(ABuff)^, 2);
    inc(PByte(ABuff));
  end;
end;


end.
