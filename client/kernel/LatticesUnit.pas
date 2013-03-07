unit LatticesUnit;

interface
uses
  Classes, Graphics, Types;
function GetChineseLattice(ChineseText: string; out LatticeData: array of byte;
  Style: Integer): Boolean; overload; //
function GetChineseLattice(bitamp: TBitmap; out LatticeData: array of byte;
  Style: Integer): Boolean; overload;
function GetBitampLattice(bitamp: TBitmap; out LatticeData: array of byte;
  Style: Integer): Boolean;
function ConvertByteEx(inByte: Byte): Byte;
function ConvertByte(inByte: Byte): Byte;
procedure DrawHZ(const buf: array of byte; ca: TCanvas);
procedure DrawHZZ(const buf: array of byte; ca: TCanvas);
function BitStrToHextStr(const ABitStr: string): string;
implementation

uses
  SysUtils;


procedure DrawHZ(const buf: array of byte; ca: TCanvas);
const
  Size = 5;
  mask = $8000;
var
  i, j: Integer;
  b: Word;
  b1, b2, b_conver, b_conver1: Byte;
  arect: TRect;
begin
  arect := rect(0, 0, Size - 1, Size - 1);
  for i := 0 to 15 do
  begin
    //一个word是一行象素
    {转换高低位}
    b1 := Byte(buf[i * 2]);
    b_conver := b1 and $0F;
    b_conver1 := b1 shr 4;
    b1 := b_conver1 or (b_conver shl 4);
    b1 := ConvertByteEx(b1);
    b2 := Byte(buf[i * 2 + 1]);
    b_conver := b2 and $0F;
    b_conver1 := b2 shr 4;
    b2 := b_conver1 or (b_conver shl 4);
    b2 := ConvertByteEx(b2);
    b := b2 or (b1 shl 8);
    for j := 0 to 15 do
    begin
      if (b and mask) = mask then
      begin
        ca.Pen.Color := clBlack;
        ca.Brush.Color := clBlack;
      end
      else
      begin
        ca.Pen.Color := clWhite;
        ca.Brush.Color := clWhite;
      end;
      ca.Rectangle(arect);
      OffsetRect(arect, Size, 0);
      b := b shl 1;
    end;
    OffsetRect(arect, -Size * 16, Size);
  end;
end;

procedure DrawHZZ(const buf: array of byte; ca: TCanvas);
const
  Size = 5;
  mask = $8000;
var
  i, j: Integer;
  b: Word;
  arect: TRect;
  b1, b2, b_conver, b_conver1: Byte;
begin
  arect := rect(0, 0, Size - 1, Size - 1);
  for i := 0 to 15 do
  begin
    //一个word是一列象素
    {转换高低位}
    b1 := Byte(buf[i]);
    b_conver := b1 and $0F;
    b_conver1 := b1 shr 4;
    b1 := b_conver1 or (b_conver shl 4);
    b1 := ConvertByteEx(b1);
    b2 := Byte(buf[16 + i]);
    b_conver := b2 and $0F;
    b_conver1 := b2 shr 4;
    b2 := b_conver1 or (b_conver shl 4);
    b2 := ConvertByteEx(b2);
    b := b2 or (b1 shl 8);
    for j := 0 to 15 do
    begin
      if (b and mask) = mask then
      begin
        ca.Pen.Color := clBlack;
        ca.Brush.Color := clBlack;
      end
      else
      begin
        ca.Pen.Color := clWhite;
        ca.Brush.Color := clWhite;
      end;
      ca.Rectangle(arect);
      OffsetRect(arect, 0, Size);
      b := b shl 1;
    end;
    OffsetRect(arect, Size, -Size * 16);
  end;
end;

function ConvertByteEx(inByte: Byte): Byte;
var
  b1: Byte;
begin
  b1 := inByte and $F;
  b1 := ConvertByte(b1);
  Result := b1;
  b1 := inByte shr 4;
  b1 := ConvertByte(b1);
  Result := b1 shl 4 or Result;
end;

function ConvertByte(inByte: Byte): Byte;
var
  i: Integer;
  b: Byte;
begin
  Result := 0;
  for i := 0 to 3 do
  begin
    b := (inByte shr i) and 1;
    Result := Result or (b shl (3 - i));
  end;
end;

function GetChineseLattice(ChineseText: string; out LatticeData: array of byte;
  Style: Integer): Boolean; //tdcall;
var
  bmp_Text: TBitmap;
  i, j: Integer;
  cb: Byte;

  d: string;
  str: string;
begin
  bmp_Text := TBitmap.Create; //创建背景扫描图

  with bmp_Text do
  begin
    PixelFormat := pf8bit;
    Width := 16;
    Height := 16;
    Canvas.Font.Name := '新宋体';
    Canvas.Font.Size := 12;
    Canvas.Font.Color := clBlack;
    Canvas.TextRect(Rect(0, 0, 16, 16), 0, 0, ChineseText);
    for i := 0 to 15 do //开始扫描
    begin
      d := '';
      for j := 0 to 7 do
      begin
        cb := pbyte(Integer(ScanLine[i]) + j)^;
        if cb = $FF then
          d := d + '0'
        else
          d := d + '1';
      end;
      str := BitStrToHextStr(d);
      LatticeData[i] := StrToInt('$' + str);
    end;

    for i:=0 to 15 do
    begin
      d := '';
      for j := 8 to 15 do
      begin
        cb := pbyte(Integer(ScanLine[i]) + j)^;
        if cb = $FF then
          d := d + '0'
        else
          d := d + '1';
      end;
      str := BitStrToHextStr(d);
      LatticeData[i +16] := StrToInt('$' + str);
    end;
    Free;
  end;
  Result := true;
end;

function GetChineseLattice(bitamp: TBitmap; out LatticeData: array of byte;
  Style: Integer): Boolean; //tdcall;
{
Style:   0表示横向取模，从左至右，从上至下，字模排列顺序为高位在右，低位在左
              1表示纵向取模，从上至下，从左至右，字模排列顺序为高位在下，低位在上
}
var
  bmp_Text: TBitmap;
  i, j: Integer;
  cb: Byte;
  d: string;
  str: string;
begin
  bmp_Text := TBitmap.Create; //创建背景扫描图

  with bmp_Text do
  begin
    PixelFormat := pf8bit;
    Width := 16;
    Height := 16;
    Canvas.Font.Name := '宋体';
    Canvas.Font.Size := 12;
    Canvas.Font.Color := clBlack;
    Canvas.CopyRect(Rect(0, 0, 16, 16), bitamp.Canvas, Rect(0, 0, 16, 16));
    Canvas.Refresh;
    for i := 0 to 15 do //开始扫描
    begin
      d := '';
      for j := 0 to 7 do
      begin
        cb := pbyte(Integer(ScanLine[i]) + j)^;
        if cb = $FF then
          d := d + '0'
        else
          d := d + '1';
      end;
      str := BitStrToHextStr(d);
      LatticeData[i] := StrToInt('$' + str);
    end;

    for i := 0 to 15 do
    begin
      d := '';
      for j := 8 to 15 do
      begin
        cb := pbyte(Integer(ScanLine[i]) + j)^;
        if cb = $FF then
          d := d + '0'
        else
          d := d + '1';
      end;
      str := BitStrToHextStr(d);
      LatticeData[i + 16] := StrToInt('$' + str);
    end;
    {for i := 0 to 15 do //开始扫描
    begin
      d := '';
      for j := 0 to 7 do
      begin
        cb := pbyte(Integer(ScanLine[i]) + j)^;
        if cb = $FF then
          d := d + '0'
        else
          d := d + '1';
      end;
      str := BitStrToHextStr(d);
      LatticeData[i * 2] := StrToInt('$' + str);
      d := '';
      for j := 8 to 15 do
      begin
        cb := pbyte(Integer(ScanLine[i]) + j)^;
        if cb = $FF then
          d := d + '0'
        else
          d := d + '1';
      end;
      str := BitStrToHextStr(d);
      LatticeData[i * 2 + 1] := StrToInt('$' + str);
    end;       }
    Free;
  end;
  Result := true;
end;

function GetBitampLattice(bitamp: TBitmap; out LatticeData: array of byte;
  Style: Integer): Boolean;
var
  bmp_Text: TBitmap;
  i, j: Integer;
  cb: Byte;
  d: string;
  str: string;
begin
  bmp_Text := TBitmap.Create; //创建背景扫描图

  with bmp_Text do
  begin
    PixelFormat := pf8bit;
    Width := 16;
    Height := 16;
    Canvas.Font.Name := '宋体';
    Canvas.Font.Size := 12;
    Canvas.Font.Color := clBlack;
    Canvas.CopyRect(Rect(0, 0, 16, 16), bitamp.Canvas, Rect(0, 0, 16, 16));
    Canvas.Refresh;
    for i := 0 to 15 do //开始扫描
    begin
      d := '';
      for j := 0 to 7 do
      begin
        cb := pbyte(Integer(ScanLine[i]) + j)^;
        if cb = $FF then
          d := d + '0'
        else
          d := d + '1';
      end;
      str := BitStrToHextStr(d);
      LatticeData[i] := StrToInt('$' + str);
      d := '';
      for j := 8 to 15 do
      begin
        cb := pbyte(Integer(ScanLine[i]) + j)^;
        if cb = $FF then
          d := d + '0'
        else
          d := d + '1';
      end;
      str := BitStrToHextStr(d);
      LatticeData[i+16] := StrToInt('$' + str);
    end;
    Free;
  end;
  Result := true;
end;

function BitStrToHextStr(const ABitStr: string): string;
var
  vD: Byte;
  I: Integer;
  vHextStr: string;
  vP: PChar;
  vLen: Integer;
begin
  vLen := Length(ABitStr);
  if vLen mod 4 > 0 then SetLength(vHextStr, vLen div 4 + 1)
  else SetLength(vHextStr, vLen div 4);

          //初始化
  vD := 0;
  vP := PChar(ABitStr);
  I := 0; //开始计数
  vLen := 0;

  while vP^ <> #0 do
  begin
    vD := vD shl 1;

    if vP^ = '1' then vD := vD + 1;

    Inc(vP);
    Inc(I);

    if I = 4 then
    begin
      Inc(vLen);
      case vD of
        0..9: vHextStr[vLen] := Chr(vD + $30);
        10..15: vHextStr[vLen] := Chr(vD - 10 + $41);
      end;

      I := 0;
      vD := 0;
    end;
  end;

  if I > 0 then
  begin
    Inc(vLen);
    case vD of
      0..9: vHextStr[vLen] := Chr(vD + $30);
      10..15: vHextStr[vLen] := Chr(vD + $41);
    end;
  end;

  Result := vHextStr;
end;

end.

