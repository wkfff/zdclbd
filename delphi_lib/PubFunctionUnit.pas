{******************************************************************************}
{*  author: liusen                                                             }
{*  date: 2009-07-29                                                           }
{*  description: 存放本软件中用到的一些公共函数                                }
{******************************************************************************}
unit PubFunctionUnit;

interface
uses Classes, SysUtils, RecordUnit, Windows, Controls;

  // 将黑名单文件中的10位卡外号转换为8位CSN号
  // NO：卡外号
  function ChangInD_OutD(NO: string):string;
  // 封装黑名单信息
  procedure CapsulationBlackList(var blackList: RecBlackList);
  // 获取黑名单路径下最新的黑名单文件
  function GetBlackListFileName(dirPath: string): string;
  // 读取黑名单文件
  function ReadBlackListFile(FileName: string): RecBlackList;
  // 打开异常信息提示框
  procedure messageErrorBox(info: string; error: string);
  //
  function HexStrtoBuf(str: string; len: integer): Variant; overload;
    //将十六进制表示的字符串　转成　字节数组
  function HexStrToBuf(HexStr: string;ABuff: PByte;StrLen: Integer):boolean; overload;
  //将一段存内内容转换成十六进制表示的字符串
  function BuffToHex(ABuff:Pointer;ALen:integer):string;
  //将一段存内内容转换成ASCII表示的字符串
  function BuffToStr(ABuff: Pbyte; Alen: integer): string;
  //BCD码转换为字节
  function BcdToByte(bcd: Byte): Byte;
  //字节转换为BCD码
  function ByteToBcd(AValue: Byte): Byte;
  //
  function ByteOderConvert_Word(AValue: Word): Word;
  //
  function ByteOderConvert_LongWord(AValue: Longword): Longword;
  //将一端字节数组直接转换为字符串的表现形式
  function BuffConvertStr(PBuf: PByte; BufLength: Byte): string;
  {计算校验和- 异或}
  function GetXorSum(Buff: Pointer; ALen : integer):Byte;

  // 字符串向右对齐，左边不足位数补零，超过位数从右开始去sNum长度的字符串
  function RetStr(s: string; sNum: Integer): String;

implementation
uses ErrorInfoUnit;

function HexStrtoBuf(str: string; len: integer): Variant;
var
  buf: array of Byte;
  i: Integer;
begin
  SetLength(buf, len div 2);
  for i:=0 to SizeOf(buf)-1 do
  begin
    buf[i] := StrtoInt('$' + copy(str, i*2+1, 2));
  end;

  Result := buf;
end;

function HexStrToBuf(HexStr: string;ABuff: PByte;StrLen: Integer):boolean;
var
  i: Integer;
  byteLen: integer;
begin
  result := False;
  if strLen mod 2=0 then
    byteLen:= strLen div 2
  else
    byteLen:= strLen div 2 +1;
  for i:= 0 to byteLen -1 do
  begin
    PByte(ABuff)^ := strtoint('$'+copy(hexstr,i*2+1,2));
    inc(PByte(ABuff));
  end;
  result := true;
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

function BuffToStr(ABuff: Pbyte; Alen: integer): string;
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

function BcdToByte(bcd: Byte): Byte;
begin
  Result := (bcd shr 4) * 10 + (bcd and $0F);
end;

function ByteToBcd(AValue: Byte): Byte;
begin
  Result := ((AValue div 10) shl 4) + (AValue mod 10);
end;

{字节顺序转换,将本机的字节顺序(LITTLE_END)转成BIG_END
@param AValue:Word
@return Word
}
function ByteOderConvert_Word(AValue: Word): Word;
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

{字节顺序转换
@param AValue:longword
@return longword
}
function ByteOderConvert_LongWord(AValue: Longword): Longword;
type
  TLongByte = packed record
    a, b, c, d: Byte;
  end;
var
  P: ^TLongByte;
  t: Byte;
begin
  P := @AValue;
  t := P^.a;
  P^.a := P^.d;
  P^.d := t;

  t := P^.b;
  P^.b := P^.c;
  P^.c := t;

  Result := AValue;
end;

function BuffConvertStr(PBuf: PByte; BufLength: Byte): string;
var
  temp: string;
  i: Integer;
begin
  for i := 0 to BufLength - 1 do
  begin
    temp := temp + IntToStr(PBuf^);
    Inc(PBuf);
  end;
  Result := temp;
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
    t := StrToInt(ss[i]);
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
  ss := IntToHex(Integer(StrToInt64(ss)),8);
  Result := ss;
end;

procedure CapsulationBlackList(var blackList: RecBlackList);
var
  sendBlack: RecSendBlack;
  i, j, k, m, n: Integer;        // i,j：计数； k：偏移量，一个黑名单信息的长度是5，
                                 //m：黑名单总记录数除以28的余数，
                                 //n：m>0时为2，m=0时为1，在for循环中用到
begin
  if blackList.DataList.Count > 20000 then
  begin
    blackList.BlackListNum := 20000;
  end;

  if blackList.BlackListNum <= 28 then           // 如果黑名单小于等于28，此时就不需要在分包了，就把这些数据当做
                                                // 一包数据封装起来，其余用$ff填充
  begin
    sendBlack := RecSendBlack.Create;
    FillChar(sendBlack.blackData, SizeOf(sendBlack.blackData), $ff);
    k := 0;
    for i := 0 to blackList.DataList.Count - 1 do
    begin
      CopyMemory(@sendBlack.blackData[k], @(RecBlack(blackList.DataList.Items[i]).buf[0]), 5);
      k := k + 5;
    end;
    blackList.SendList.Add(sendBlack);
  end else
  if blackList.BlackListNum > 28 then          //大于28，此时就需要分包了
  begin
    m := blackList.BlackListNum mod 28;
    if m > 0 then
    begin
      blackList.DataNum := blackList.BlackListNum div 28 + 1;
      n := 2;
    end else
    begin
      blackList.DataNum := blackList.BlackListNum div 28;
      n := 1;
    end;

    for i := 0 to blackList.DataNum - n do
    begin
      k := 0;
      sendBlack := RecSendBlack.Create;
      sendBlack.CurrentNO := i + 1;
      for j := i*28 to i*28 + 27 do
      begin
         CopyMemory(@sendBlack.blackData[k], @(RecBlack(blackList.DataList.Items[j]).buf[0]), 5);
         k := k + 5;
      end;
      blackList.SendList.Add(sendBlack); 
    end;

    if m > 0 then
    begin
      sendBlack := RecSendBlack.Create;
      sendBlack.CurrentNO := blackList.DataNum;
      FillChar(sendBlack.blackData, SizeOf(sendBlack.blackData), $ff);
      k := 0;
      for i := j to blackList.BlackListNum - 1 do
      begin
        CopyMemory(@sendBlack.blackData[k], @(RecBlack(blackList.DataList.Items[i]).buf[0]), 5);
        k := k + 5;
      end;
      blackList.SendList.Add(sendBlack);
    end;
  end;
  blackList.CurrentNO := 0;

end;

function GetBlackListFileName(dirPath: string): string;

  function compareInt(a, b: Pointer): Integer;       // 比较数值
  begin
     if Integer(a^)> Integer(b^) then                  // 升序排序
      Result := 1
     else if Integer(a^)= Integer(b^) then
      Result := 0
     else
      Result := -1;
  end;

  function CompareStr(a, b: Pointer): Integer;      // 比较字符串
  begin
    Result := 0-CompareText(string(a^), string(b^));  // 降序排序
  end;

var
  TmpList:TList;
  FileRec:TSearchrec;
begin
  if not DirectoryExists(dirPath) then
  begin
    exit;
  end;

  TmpList:=TList.Create;
  TmpList.Clear;

  if FindFirst(dirPath + '\hm_*',faAnyfile,FileRec) = 0 then
  begin
    repeat
      if ((FileRec.Attr and faDirectory) = 0) then
      begin
        TmpList.Add(@FileRec.Name);
      end;
    until FindNext(FileRec)<>0;
  end;
  SysUtils.FindClose(FileRec);

  if TmpList.Count <= 0 then
  begin
    Result := '';
    Exit;
  end else
  begin
    TmpList.Sort(@CompareStr);
    Result := dirPath + '\' + string(TmpList.Items[0]^)
  end;
end;

function ReadBlackListFile(FileName: string): RecBlackList;
  function Compare(a, b: Pointer): Integer;      // 先比较等级，再比较黑名单卡号
  var
    i: Integer;
  begin
    i := 0 - CompareText(IntToStr(RecBlack(a).Grade), IntToStr(RecBlack(b).Grade));
    if i = 0 then
    begin
      i := CompareText(RecBlack(a).CSN, RecBlack(b).CSN);
    end;
    Result := i;
  end;
var
  ft: TextFile;
  data: string;
  blackList: RecBlackList;
  black: RecBlack;
  buf: array of Byte;
begin

  blackList.DataList := TList.Create;
  blackList.SendList := TList.Create;
  // 读取文件中的内容
  AssignFile(ft, FileName);
  Reset(ft);

  Readln(ft, data);
  if data <> '' then
  begin
    blackList.Version := Copy(data,1,8);                       // 黑名单版本号
    blackList.BlackListNum := StrToInt(Copy(data, 9, 6));      // 黑名单总条数
  end else
  begin
    raise Exception.Create('黑名单文件中第一行无数据，该行所表达的信息应该是黑名单的版本号和总条数');
  end;

  repeat Readln(ft,data);
    black := RecBlack.Create;
    black.CSN := ChangInD_OutD(Copy(data, 1, 10));
    black.Grade := StrToInt(Copy(data, 11, 2));
    buf := HexStrtoBuf(black.CSN, 8);
    CopyMemory(@(black.buf[0]), @buf[0], 4);
    black.buf[4] := black.Grade;
    blackList.DataList.Add(black);
  until eof(ft) = true;
  blackList.DataList.Sort(@Compare);

  if blackList.DataList.Count <> blackList.BlackListNum then
  begin
    // 实际读到的记录条数和文件中给定的记录条数不相等
    raise Exception.Create('实际读到的记录条数和文件中给定的记录条数不相等');
  end;
  //------------上面是读黑名单文件
  //------------下面是对读取的数据进行适当的处理
  CapsulationBlackList(blackList);

  Result := blackList;
end;

procedure messageErrorBox(info: string; error: string);
var
  dlg: TErrorInfoFrm;
begin
  try
    dlg := TErrorInfoFrm.create(nil);
    dlg.lblInfo.Caption := info;
    dlg.memInfo.Text := error;
    if dlg.ShowModal = mrok then
    begin
    end;
  finally
    dlg.Free;
  end;
end;

{计算校验和- 异或}
function GetXorSum(Buff: Pointer; ALen : integer):Byte;
var
  i: integer;
  p: PByte;
  checkSum : Byte;
begin
  p:= PByte(Buff);
  checkSum := 0;
  for i:= 0 to Alen-1 do
  begin
    checkSum := checkSum xor p^;
    Inc(p);
  end;
  Result:= checkSum;
end;

function RetStr(s:string;sNum:Integer):String;
begin
  if length(s)>snum then
    s := RightStr(s,snum)
  else
  begin
    while length(s)<snum do
      s := '0'+s;
  end;
  Result := s;
end;

end.
