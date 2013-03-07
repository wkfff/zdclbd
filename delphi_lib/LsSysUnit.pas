unit LsSysUnit;

interface

uses SysUtils, Windows;

  const
     Table_CRC: array[0..255] of word=(
      $0000, $1021, $2042, $3063, $4084, $50a5, $60c6, $70e7,
      $8108, $9129, $a14a, $b16b, $c18c, $d1ad, $e1ce, $f1ef,
      $1231, $0210, $3273, $2252, $52b5, $4294, $72f7, $62d6,
      $9339, $8318, $b37b, $a35a, $d3bd, $c39c, $f3ff, $e3de,
      $2462, $3443, $0420, $1401, $64e6, $74c7, $44a4, $5485,
      $a56a, $b54b, $8528, $9509, $e5ee, $f5cf, $c5ac, $d58d,
      $3653, $2672, $1611, $0630, $76d7, $66f6, $5695, $46b4,
      $b75b, $a77a, $9719, $8738, $f7df, $e7fe, $d79d, $c7bc,
      $48c4, $58e5, $6886, $78a7, $0840, $1861, $2802, $3823,
      $c9cc, $d9ed, $e98e, $f9af, $8948, $9969, $a90a, $b92b,
      $5af5, $4ad4, $7ab7, $6a96, $1a71, $0a50, $3a33, $2a12,
      $dbfd, $cbdc, $fbbf, $eb9e, $9b79, $8b58, $bb3b, $ab1a,
      $6ca6, $7c87, $4ce4, $5cc5, $2c22, $3c03, $0c60, $1c41,
      $edae, $fd8f, $cdec, $ddcd, $ad2a, $bd0b, $8d68, $9d49,
      $7e97, $6eb6, $5ed5, $4ef4, $3e13, $2e32, $1e51, $0e70,
      $ff9f, $efbe, $dfdd, $cffc, $bf1b, $af3a, $9f59, $8f78,
      $9188, $81a9, $b1ca, $a1eb, $d10c, $c12d, $f14e, $e16f,
      $1080, $00a1, $30c2, $20e3, $5004, $4025, $7046, $6067,
      $83b9, $9398, $a3fb, $b3da, $c33d, $d31c, $e37f, $f35e,
      $02b1, $1290, $22f3, $32d2, $4235, $5214, $6277, $7256,
      $b5ea, $a5cb, $95a8, $8589, $f56e, $e54f, $d52c, $c50d,
      $34e2, $24c3, $14a0, $0481, $7466, $6447, $5424, $4405,
      $a7db, $b7fa, $8799, $97b8, $e75f, $f77e, $c71d, $d73c,
      $26d3, $36f2, $0691, $16b0, $6657, $7676, $4615, $5634,
      $d94c, $c96d, $f90e, $e92f, $99c8, $89e9, $b98a, $a9ab,
      $5844, $4865, $7806, $6827, $18c0, $08e1, $3882, $28a3,
      $cb7d, $db5c, $eb3f, $fb1e, $8bf9, $9bd8, $abbb, $bb9a,
      $4a75, $5a54, $6a37, $7a16, $0af1, $1ad0, $2ab3, $3a92,
      $fd2e, $ed0f, $dd6c, $cd4d, $bdaa, $ad8b, $9de8, $8dc9,
      $7c26, $6c07, $5c64, $4c45, $3ca2, $2c83, $1ce0, $0cc1,
      $ef1f, $ff3e, $cf5d, $df7c, $af9b, $bfba, $8fd9, $9ff8,
      $6e17, $7e36, $4e55, $5e74, $2e93, $3eb2, $0ed1, $1ef0
    );

  {
    将字符串转换为整形
    Value: 需要转换的字符串
    DefResult：如果Value为空，默认返回的值
  }
  function StringToInteger(Value: string; DefResult: Integer=0): Integer;

  {
    将字符串转换为整形
    Value: 需要转换的字符串
    DefResult：如果Value为空，默认返回的值
  }
  function StringToLongWord(Value: string; DefResult: LongWord=0): LongWord;

  {
    将字符串转换为int64型
    Value: 需要转换的字符串
    DefResult：如果Value为空，默认返回的值
  }
  function StringToInt64(Value: string; DefResult: Int64=0): Int64;

  {
    将字符串转换为浮点型
    Value: 需要转换的字符串
    DefResult：如果Value为空，默认返回的值
  }
  function StringToFloat(Value: string; DefResult: Double=0): Double;

  {
    获取一个数组的CRC校验码
    Value:
    Size:
  }
  function GetCRC16(Value: PByte; Size: Integer): Variant;

  {
    获取CRC校验码
  }
  function GetCrcSum(PBuf: Pbyte; ACnt: integer): Word;

  {
    将黑名单文件中的10位卡外号转换为8位CSN号
    NO：卡外号
  }
  function ChangInD_OutD(NO: string):string;

  {
    获取系统当前日期时间
  }
  function GetSystemDateTime: TDateTime;

  {
    获取系统当前日期
  }
  function GetSystemDate: TDateTime;

  {
    获取系统当前时间
  }
  function GetSystemTime: TDateTime;

  {
    将一段内存数据转换为16进行形式的字符串
    ABuff：指向一段内存内容的首地址
    ALen：内存内容的长度
  }
  function BuffToHex(ABuff:Pointer;ALen:integer):string;

  {
    将一段存内内容转换成ASCII表示的字符串
    ABuff：指向一段内存内容的首地址
    ALen：内存内容的长度
  }
  function BuffToASCIIStr(ABuff: Pbyte; Alen: integer): string;

  {
    将十六进制表示的字符串　转成字节数组
    HexStr：十六进行表示的字符串
  }
  function HexStrToBuf(HexStr: string): Variant; overload;

  {
    将十六进制表示的字符串　转成字节数组
    HexStr: 十六进行表示的字符串
    ABuff：指向转换后数组的首地址
    StrLen: HexStr字符串的长度
  }
  function HexStrToBuf(HexStr: string;ABuff: PByte;StrLen: Integer):boolean; overload;

  {
    大小端数据转换 Big-Small-Endian
    AValue: 需要转换的Word型数据
  }
  function BigTSmall_Word(AValue: Word): Word;

  {
    字节型数据转换为BCD码
    Value: 需要转换的数据
  }
  function ByteToBCD(Value: Byte): Byte;

  {
    初始化字符串，将字符串全部赋#0
  }
  procedure InitStr(var AStr: string; len: Word);

implementation

function StringToInteger(Value: string; DefResult: Integer=0): Integer;
begin
  if Trim(Value) = '' then
  begin
    Result := DefResult;
  end
  else begin
    try
      Result := StrToInt(Trim(Value));
    except
      Result := DefResult;
    end;
  end;
end;

function StringToLongWord(Value: string; DefResult: LongWord=0): LongWord;
begin
  if Trim(Value) = '' then
  begin
    Result := DefResult;
  end
  else begin
    try
      Result := StrToInt(Trim(Value));
    except
      Result := DefResult;
    end;
  end;
end;

function StringToInt64(Value: string; DefResult: Int64=0): Int64;
begin
  if Trim(Value) = '' then
  begin
    Result := DefResult;
  end
  else begin
    try
      Result := StrToInt64(Trim(Value));
    except
      Result := DefResult;
    end;
  end;
end;

function StringToFloat(Value: string; DefResult: Double=0): Double;
begin
  if Trim(Value) = '' then
  begin
    Result := DefResult;
  end
  else begin
    try
      Result := StrToFloat(Trim(Value));
    except
      Result := DefResult;
    end;
  end;
end;

function GetCRC16(Value: PByte; Size: Integer): Variant;
var
  crc, i: Word;
  crcBuf: array of Byte;
begin
  SetLength(crcBuf, 2);
  crc := 0;
 // crc := Table_CRC[(Byte((crc shr 8) xor (BufSize shr 8)) and $ff)] xor (crc shl 8);
 // crc := Table_CRC[(Byte((crc shr 8) xor (BufSize and $ff)) and $ff)] xor (crc shl 8);

  for i:= 0 to Size-1 do
  begin
    crc := Table_CRC[(Byte((crc shr 8) xor (PByte(Value)^)) and $ff)] xor (crc shl 8);// xor (PByte(ABuff)^ and $ff)] xor (crc shl 8);
    Inc(Value);
  end;
   crcBuf[0] := Byte(crc shr 8);
   crcBuf[1] := Byte(crc);
   Result := crcBuf;
end;

function GetCrcSum(PBuf: Pbyte; ACnt: integer): Word;
var
  crc: Word;
  i,k: integer;
  bufAry : array of byte;
begin
  Result := 0;
  crc:= 0;
  SetLength(bufAry,ACnt);
  CopyMemory(@bufAry[0],PBuf,ACnt);
  for k:= 0 to ACnt-1 do
  begin
    crc :=crc xor (bufAry[k] shl 8);
    i:=8;
    while(i>0)do
    begin
      if (crc and $8000)<>0 then
        crc := (crc shl 1) xor $1021
      else
        crc := crc shl 1;
      i:= i-1;
    end;
  end;
  Result := crc;
end;

function ChangInD_OutD(NO:string):string;
  procedure ChangChar(var a,b:char);
  var
    c :Char;
  begin
    c := a;
    a := b;
    b := c;
  end;
var
  ss : string;
 // c :Char;
  i,t : integer;
begin
  Result := '';
  ss := NO;
  ChangChar(ss[1],ss[5]);
  ChangChar(ss[2],ss[4]);
  ChangChar(ss[3],ss[8]);
  ChangChar(ss[6],ss[10]);
  ChangChar(ss[7],ss[9]);
  for i:=1 to Length(ss) do
  begin
    t := StringToInteger(ss[i]);
    case t of
      1 : ss[i] := '2';
      2 : ss[i] := '1';
      3 : ss[i] := '4';
      4 : ss[i] := '3';
      5 : ss[i] := '6';
      6 : ss[i] := '5';
      7 : ss[i] := '8';
      8 : ss[i] := '7';
      9 : ss[i] := '0';
      0 : ss[i] := '9';
    end;
  end;
  ss := IntToHex(Integer(StringToInt64(ss)),8);
  Result := ss;
end;

function GetSystemDateTime: TDateTime;
begin
  Result := Now;
end;

function GetSystemDate: TDateTime;
begin
  Result := Date;
end;

function GetSystemTime: TDateTime;
begin
  Result := Time;
end;

function BuffToHex(ABuff:Pointer;ALen:integer):string;
var
  i:integer;
begin
  Result:='';
  for i:=0 to ALen-1 do
  begin
    Result:=Result+InttoHex(PByte(ABuff)^,2);
    inc(PByte(ABuff));
  end;
end;

function BuffToASCIIStr(ABuff: Pbyte; Alen: integer): string;
var
  i: integer;
begin
  Result := '';
  for i := 0 to Alen - 1 do
  begin
    Result := Result + Chr(ABuff^);
    inc(ABuff);
  end;
end;

function HexStrToBuf(HexStr: string): Variant;
var
  buf: array of Byte;
  StrLen, bufLen: Integer;
  i: Integer;
begin
  try
    try
      StrLen := Length(HexStr);
      if StrLen mod 2 = 0 then
        bufLen := StrLen div 2
      else
        bufLen := (StrLen div 2) + 1;

      SetLength(buf, bufLen);
      for i:=0 to Length(buf)-1 do
      begin
        buf[i] := StringToInteger('$' + copy(HexStr, i*2+1, 2));
      end;
    except

    end;
  finally
    Result := buf;
  end;
end;

function HexStrToBuf(HexStr: string; ABuff: PByte; StrLen: Integer):boolean;
var
  i: Integer;
  byteLen: integer;
begin
  try
    result := False;
    if strLen mod 2=0 then
      byteLen:= strLen div 2
    else
      byteLen:= strLen div 2 +1;
    for i:= 0 to byteLen -1 do
    begin
      PByte(ABuff)^ := StringToInteger('$'+copy(hexstr,i*2+1,2));
      inc(PByte(ABuff));
    end;
    Result := True;
  except
    Result := False;
  end;
end;

function BigTSmall_Word(AValue: Word): Word;
  type
    TLongByte = packed record
      a, b: Byte;
  end;
var
  P: ^TLongByte;
  t: Byte;
begin
  P := @AValue;
  t := P^.a;
  P^.a := P^.b;
  P^.b := t;

  Result := AValue;
end;

function ByteToBCD(Value: Byte): Byte;
var
  temp: string;
begin
  temp := '$' + IntToStr(Value);
  Result := StringToInteger(temp);
end;

procedure InitStr(var AStr: string; len: Word);
var
  i: integer;
begin
  SetLength(AStr, len);
  for i := 1 to len do
    AStr[i] := #0;
end;

end.
