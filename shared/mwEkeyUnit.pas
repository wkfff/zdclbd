unit mwEkeyUnit;

interface
uses windows, SysUtils, Classes;

function mw_init(port, mode: Integer; icdev: Pinteger): Smallint; stdcall; external 'MwUsbD.dll' name 'mw_init';
function mw_close(icdev: Integer): Smallint; stdcall; external 'MwUsbD.dll' name 'mw_close';

function mw_reset(icdev: Integer; rData: PByte; rLen: PInteger): Smallint; stdcall; external 'MwUsbD.dll' name 'mw_reset';
function mw_protocol(icdev: Integer; sLen: LongWord; sData: PByte; rLen: PInteger; rData: PByte): Smallint; stdcall; external 'MwUsbD.dll' name 'mw_protocol';
function mw_comres(icdev: Integer; sLen: LongWord; sData: PByte; rLen: PInteger; rData: PByte): Smallint; stdcall; external 'MwUsbD.dll' name 'mw_comres';
function mw_GetDevState(pState: PByte): Smallint; stdcall; external 'MwUsbD.dll' name 'Mw_GetDevState';

function DES_Encrypt(PKey: Pbyte; KeyLen: smallInt; PSource: PByte; SrcLen: Cardinal; PResult: PByte): Integer; stdcall; external 'MwUsbD.dll' name 'DES_Encrypt';
function DES_Decrypt(PKey: Pbyte; KeyLen: smallInt; PSource: PByte; SrcLen: Cardinal; PResult: PByte): Integer; stdcall; external 'MwUsbD.dll' name 'DES_Decrypt';

const
  COMPANY_NAME = '南京通用电器厂';
  EKey_NAME = '加密狗';
  MF_NAME = 'njty.key.soft0';

type
  TOnStateStr = procedure(Str: string) of object;

  TmwEkey = class
  private
    FOnStateStr: TOnStateStr;
    FIcDev: Integer;
    Fst: Smallint;
    FsLen: Cardinal;
    FrLen: Cardinal;
    FsData: array[0..200] of byte;
    FrData: array[0..200] of byte;

    //密钥
    Fkey: array[0..7] of byte;
    //复位后，卡状态字节的在返回的rData中的位置.  不同批次的EKey，此字节位置可能不同
    FPos_EKeyStateByte: smallInt;

    procedure SetOnStateStr(const Value: TOnStateStr);
    procedure SetIcDev(const Value: Integer);
  protected
    //复位卡
    function ReSetEKey: boolean;
    function CreateMf(): boolean;
    function CreateDf(): boolean;
    function EndMf: boolean;
    function EndDf: boolean;
    function SelectMf: boolean;
    function SelectDf: Boolean;
    //建立MF下的Key 文件
    function CreateMfKey: boolean;
    function AddMfKey1: boolean;
    function AddMfKey2: boolean;
    //建立DF下的Key 文件
    function CreateDfKey: boolean;
    function AddDfKey1: boolean;
    function AddDfKey2: boolean;
    //建立DF下的　数据EF 0006
    function CreateDfEf0006: boolean;
    //校验MF下的KEY
    function VerifyMfKey: boolean;
    //校验DF下的KEY
    function VerifyDfKey: boolean;
    //写数据到DF下的EF0006中
    function WriteToDfEf0006(Adata: PByte): boolean;
    //读数据从DF下的EF0006中
    function ReadFromDfEf0006: PByte;
    //删除MF
    function DelMF: boolean;
    //对卡操作 用mw_protocol
    function ControlEKey(sLen: Integer): boolean;
    //输出提示
    procedure OutPutStr(Astr: string);
    //判断是我们发行的卡结构
    function IsNjtyEKey: boolean;
  public
    constructor Create;
    destructor Destroy; override;
  published
    function InitEKey: boolean;
    procedure CloseEKey(icdev: Integer);
    //创建结构,=>对用户应用来讲，为初始化
    function CreateFile: boolean;
    //写入相关软件的值
    function WriteData(str1: string): boolean;
    //读出 相关软件的值
    function ReadData: string;
    //清除卡内容为空，删MF
    function ClrEKey: boolean;
    //取得EKEY的当前状态
    function GetEKeyState: boolean;
    property IcDev: Integer read FIcDev write SetIcDev;
    property OnStateStr: TOnStateStr read FOnStateStr write SetOnStateStr;
  end;

implementation
{ TmwEkey }

function TmwEkey.AddDfKey1: boolean;
begin
  Result := false;
  //80 d4 00 00 0e 01 01 00 0b 0e ee ee ff 01 39 05 16 43 87
  FsData[0] := $80;
  FsData[1] := $D4;
  FsData[2] := $00;
  FsData[3] := $00;
  FsData[4] := $0E; //lc
  FsData[5] := $01;
  FsData[6] := $01;
  FsData[7] := $00;
  FsData[8] := $0B; //密钥类型
  FsData[9] := $0E;
  FsData[10] := $EE;
  FsData[11] := $EE;
  FsData[12] := $FF;
  FsData[13] := $01; //密码
  FsData[14] := $39;
  FsData[15] := $05;
  FsData[16] := $16;
  FsData[17] := $43;
  FsData[18] := $87;

  result := ControlEKey(19);
end;

function TmwEkey.AddDfKey2: boolean;
begin
  Result := false;
  //80 d4 00 00 0e 02 01 00 06 0e ee ee ff 01 38 01 59 89 87
  FsData[0] := $80;
  FsData[1] := $D4;
  FsData[2] := $00;
  FsData[3] := $00;
  FsData[4] := $0E; //lc
  FsData[5] := $02;
  FsData[6] := $01;
  FsData[7] := $00;
  FsData[8] := $06; //密钥类型
  FsData[9] := $0E;
  FsData[10] := $EE;
  FsData[11] := $EE;
  FsData[12] := $FF;
  FsData[13] := $01; //密码
  FsData[14] := $38;
  FsData[15] := $01;
  FsData[16] := $59;
  FsData[17] := $89;
  FsData[18] := $87;

  result := ControlEKey(19);
end;

function TmwEkey.AddMfKey1: boolean;
begin
  Result := false;
  //80 d4 00 00 0e 01 01 00 0b 0f ff ff ff 20041229 45 47
  FsData[0] := $80;
  FsData[1] := $D4;
  FsData[2] := $00;
  FsData[3] := $00;
  FsData[4] := $0E; //lc
  FsData[5] := $01;
  FsData[6] := $01;
  FsData[7] := $00;
  FsData[8] := $0B; //密钥类型
  FsData[9] := $0F;
  FsData[10] := $FF;
  FsData[11] := $FF;
  FsData[12] := $FF;
  FsData[13] := $20; //密码
  FsData[14] := $04;
  FsData[15] := $12;
  FsData[16] := $29;
  FsData[17] := $45;
  FsData[18] := $47;

  result := ControlEKey(19);
end;

function TmwEkey.AddMfKey2: boolean;
begin
  Result := false;
  //80 d4 00 00 0e 02 01 00 06 0f ff ff ff 84854895 00 25
  FsData[0] := $80;
  FsData[1] := $D4;
  FsData[2] := $00;
  FsData[3] := $00;
  FsData[4] := $0E; //lc
  FsData[5] := $02;
  FsData[6] := $01;
  FsData[7] := $00;
  FsData[8] := $06; //密钥类型
  FsData[9] := $0F;
  FsData[10] := $FF;
  FsData[11] := $FF;
  FsData[12] := $FF;
  FsData[13] := $84; //密码
  FsData[14] := $85;
  FsData[15] := $48;
  FsData[16] := $95;
  FsData[17] := $00;
  FsData[18] := $25;

  result := ControlEKey(19);
end;

procedure TmwEkey.CloseEKey(icdev: Integer);
begin
  Fst := mw_close(icdev);
end;

function TmwEkey.ClrEKey: boolean;
begin
//===================================
//1、if 我们建立的卡结构
//2、  选择MF文件           标识符1001
//2、  校验MF下的KEY
//3、  删除MF
//===================================
  Result := false;
  if IsNjtyEKey then
  begin
    if not SelectMf then exit;
    if not VerifyMfKey then exit;
    if not DelMF then exit;
    Result := true;
  end;
end;

function TmwEkey.ControlEKey(sLen: Integer): boolean;
begin
  result := false;
  FrLen := 200;
  Fst := mw_protocol(FIcDev, sLen, @FsData[0], @FrLen, @FrData[0]);
  if (Fst <> 0) then
  begin
    OutPutStr('传输错误！' + IntToStr(Fst));
    exit;
  end;
  if (FrData[FrLen - 2] = $90) and (FrData[FrLen - 2 + 1] = 00) then
    result := true;
end;

constructor TmwEkey.Create;
begin
  //读写MF－DF－EF 0006 中数据时用的　DES加密 密钥
  Fkey[0] := $16;
  Fkey[1] := $27;
  Fkey[2] := $38;
  Fkey[3] := $49;
  Fkey[4] := $AA;
  Fkey[5] := $BB;
  Fkey[6] := $7C;
  Fkey[7] := $8E;
end;

function TmwEkey.CreateDf: boolean;
begin
  Result := false;
  //80 e0 01 00 09 1001 ee 00 4142434445
  FsData[0] := $80;
  FsData[1] := $E0;
  FsData[2] := $01;
  FsData[3] := $00;
  FsData[4] := $09; //lc
  FsData[5] := $10; //标识符
  FsData[6] := $01;
  FsData[7] := $EE;
  FsData[8] := $00;
  FsData[9] := $41; // 名
  FsData[10] := $42;
  FsData[11] := $43;
  FsData[12] := $44;
  FsData[13] := $45;

  result := ControlEKey(14);
end;

function TmwEkey.CreateDfEf0006: boolean;
begin
  Result := false;
  //80 e0 02 00 07 0006 00 ee ee 00 20
  FsData[0] := $80;
  FsData[1] := $E0;
  FsData[2] := $02;
  FsData[3] := $00;
  FsData[4] := $07; //lc
  FsData[5] := $00; //标识符
  FsData[6] := $06;
  FsData[7] := $00;
  FsData[8] := $EE;
  FsData[9] := $EE;
  FsData[10] := $00;
  FsData[11] := $20;

  result := ControlEKey(12);
end;

function TmwEkey.CreateDfKey: boolean;
begin
  Result := false;
  //80 e0 02 00 07 0005 05 ee 00 02 00
  FsData[0] := $80;
  FsData[1] := $E0;
  FsData[2] := $02;
  FsData[3] := $00;
  FsData[4] := $07; //lc
  FsData[5] := $00; //标识符
  FsData[6] := $05;
  FsData[7] := $05;
  FsData[8] := $EE;
  FsData[9] := $00;
  FsData[10] := $02;
  FsData[11] := $00;

  result := ControlEKey(12);
end;

function TmwEkey.CreateFile: boolean;
begin
  //===================================
  //操作步骤如下：2004-12-29
  //1、Reset EKey ======复位===========
  //+ 判断是01 :未初始化 用户卡 =>　可以建立卡结构
  //2、Create MF
  //3、..Create 主控目录MF的Key  SEF    标识符 0001
  //4、....Add 个人密钥
  //5、....Add 解锁密钥
  //6、..Create DF                      标识符 1001
  //7、..选择DF
  //8、....Create 应用目录DF的Key　SEF  标识符 0005
  //9、......Add 个人密钥
  //10 ......Add 解锁密钥
  //11 ....Create 信息文件EF            标识符 0006
  //12 ..End DF
  //13 End MF
  //===================================
  Result := false;

  if not ReSetEKey then exit;
  //判断是01 :未初始化 用户卡 =>　可以建立卡结构
  //if FrData[5] <> $01 then
  if FrData[FPos_EKeyStateByte] <> $01 then
  begin
    OutPutStr('此' + EKEY_NAME + '已初始化，或非本系统的' + EKEY_NAME + '！');
    exit;
  end;
  if not CreateMf then exit;
  if not CreateMfKey then exit;
  if not AddMfKey1 then exit;
  if not AddMfKey2 then exit;
  if not CreateDf then exit;
  if not SelectDf then exit;
  if not CreateDfKey then exit;
  if not AddDfKey1 then exit;
  if not AddDfKey2 then exit;
  if not CreateDfEf0006 then exit;
  if not EndDf then exit;
  if not EndMf then exit;
  Result := true;
end;

function TmwEkey.CreateMf: boolean;
begin
  Result := false;
  // '80e0000018ffffffffffffffff0f00'//njty.key.soft0
  FsData[0] := $80;
  FsData[1] := $E0;
  FsData[2] := $00;
  FsData[3] := $00;
  FsData[4] := $18; //lc
  FsData[5] := $FF; //8个字节传输代码
  FsData[6] := $FF;
  FsData[7] := $FF;
  FsData[8] := $FF;
  FsData[9] := $FF;
  FsData[10] := $FF;
  FsData[11] := $FF;
  FsData[12] := $FF;
  FsData[13] := $0F; //建立文件权限
  FsData[14] := $00;
  FsData[15] := ord(MF_NAME[1]); //njty.key.soft0
  FsData[16] := ord(MF_NAME[2]);
  FsData[17] := ord(MF_NAME[3]);
  FsData[18] := ord(MF_NAME[4]);
  FsData[19] := ord(MF_NAME[5]);
  FsData[20] := ord(MF_NAME[6]);
  FsData[21] := ord(MF_NAME[7]);
  FsData[22] := ord(MF_NAME[8]);
  FsData[23] := ord(MF_NAME[9]);
  FsData[24] := ord(MF_NAME[10]);
  FsData[25] := ord(MF_NAME[11]);
  FsData[26] := ord(MF_NAME[12]);
  FsData[27] := ord(MF_NAME[13]);
  FsData[28] := ord(MF_NAME[14]);

  result := ControlEKey(29);
end;

function TmwEkey.CreateMfKey: boolean;
begin
  Result := false;
  //80 e0 02 00 07 0001 05 ff 00 02 00
  FsData[0] := $80;
  FsData[1] := $E0;
  FsData[2] := $02;
  FsData[3] := $00;
  FsData[4] := $07; //lc
  FsData[5] := $00; //标识符
  FsData[6] := $01;
  FsData[7] := $05;
  FsData[8] := $FF;
  FsData[9] := $00;
  FsData[10] := $02;
  FsData[11] := $00;

  result := ControlEKey(12);
end;

function TmwEkey.DelMF: boolean;
begin
  Result := false;
  //80 0e 00 00 08 ffff ffff ffff ffff
  FsData[0] := $80;
  FsData[1] := $0E;
  FsData[2] := $00;
  FsData[3] := $00;
  FsData[4] := $08; //lc
  FsData[5] := $FF; //传输代码
  FsData[6] := $FF;
  FsData[7] := $FF;
  FsData[8] := $FF;
  FsData[9] := $FF;
  FsData[10] := $FF;
  FsData[11] := $FF;
  FsData[12] := $FF;

  result := ControlEKey(13);
end;

destructor TmwEkey.Destroy;
begin
  if FIcDev > 0 then CloseEKey(FIcDev);
  inherited;
end;

function TmwEkey.EndDf: boolean;
begin
  Result := false;
  //80 e0 01 01 02 1001
  FsData[0] := $80;
  FsData[1] := $E0;
  FsData[2] := $01;
  FsData[3] := $01; //结束
  FsData[4] := $02; //lc
  FsData[5] := $10;
  FsData[6] := $01;

  result := ControlEKey(7);
end;

function TmwEkey.EndMf: boolean;
begin
  Result := false;
  //80 e0 00 01 02 3f 00
  FsData[0] := $80;
  FsData[1] := $E0;
  FsData[2] := $00;
  FsData[3] := $01; //结束
  FsData[4] := $02; //lc
  FsData[5] := $3F;
  FsData[6] := $00;

  result := ControlEKey(7);
end;

function TmwEkey.GetEKeyState: boolean;
begin
//......是我们建立的 ,已建立结构 => 对用户来讲，为初始化了
  Result := false;
  if IsNjtyEKey then
  begin
    OutPutStr(EKEY_NAME + '已初始化！');
    result := true;
  end;
end;

function TmwEkey.InitEKey: boolean;
var
  i: integer;
begin
  result := false;
  //get ekey state
  Fst := mw_GetDevState(@FrData[0]);
  if (Fst <> 0) then
  begin
    OutPutStr('传输错误！' + IntToStr(Fst));
    exit;
  end;
  for i := 0 to 7 do
  begin
    if FrData[i] = $31 then
    begin
      //Connect
      Fst := mw_init(i, 1, @FIcDev);
      if FIcDev < 0 then continue;
      //OutPutStr('当前连接:MWDEV'+IntToStr(i));
      Result := true;
      break;
    end;
  end;
  if FIcDev <= 0 then
  begin
    OutPutStr('没有检测到' + EKEY_NAME + '!');
    exit;
  end;
end;

function TmwEkey.IsNjtyEKey: boolean;
var
  i, ipos, nameLc: Integer;
  str1: string;
begin
//复位。
//..如果为61，则卡已个人化，用户卡
//....卡已个人化，选择MF，看MF是否为我们建立的
//......是我们建立的，
//......不是我们建立的，则不认    =>非本系统卡，无法识别!
//..如果为01, 未个人化用户卡 　　 =>空卡
//=====================================
  Result := false;
  if not ReSetEKey then exit;
  //..如果为61，则卡已个人化，用户卡
  //if FrData[5]= $61 then
  if FrData[FPos_EKeyStateByte] = $61 then
  begin
    //....卡已个人化，选择MF，看MF是否为我们建立的
    if not SelectMf then exit;
    //$84后为: 长度 + MF名
    for i := 0 to FrLen - 1 do
      if FrData[i] = $84 then break;
    nameLc := FrData[i + 1];
    ipos := i + 2;
    if nameLc <> 14 then
    begin
      OutPutStr('非' + COMPANY_NAME + '发行的' + EKEY_NAME + '！');
      exit;
    end
    else
    begin
      for i := 0 to 13 do
        if (FrData[iPos + i]) <> ord(MF_NAME[i + 1]) then
        begin
          OutPutStr('非' + COMPANY_NAME + '发行的' + EKEY_NAME + '！');
          exit;
        end;
    end;
    // nameLc =14 ,且MF名=njty.key.soft0 ===>是我们建立的卡
    Result := true;
  end
  else if FrData[FPos_EKeyStateByte] = $01 then
    OutPutStr('空白' + EKEY_NAME + '！')
  else
    OutPutStr('不能识别的' + EKEY_NAME + '！');
end;

procedure TmwEkey.OutPutStr(Astr: string);
begin
  if Assigned(FOnStateStr) then
    FOnStateStr(AStr);
end;

function TmwEkey.ReadData: string;
var
  pp: Pbyte;
begin
//===================================
//1、if 我们建立的卡结构
//2、  选择DF文件           标识符1001
//2、  校验DF下的KEY
//3、  从EF读相关软件信息   标识符0006
//===================================
  Result := '';
  if IsNjtyEKey then
  begin
    if not SelectDf then exit;
    if not VerifyDfKey then exit;

    pp := ReadFromDfEf0006;
     //解密
    SetLength(Result, 32);
    DES_Decrypt(@Fkey[0], 8, pp, 32, @Result[1]);
  end;
end;

function TmwEkey.ReadFromDfEf0006: PByte;
begin
  Result := nil;
  //00 b0 86 00 20
  FsData[0] := $00;
  FsData[1] := $B0;
  FsData[2] := $86; // 100 00110
  FsData[3] := $00; //读的偏移量？
  FsData[4] := $20; //要读取的字节数

  if ControlEKey(5) then
    Result := @FrData[0];
end;

function TmwEkey.ReSetEKey: boolean;
var
  i: integer;
  str: string;
begin
  Result := false;
  FrLen := 200;
  Fst := mw_reset(FIcDev, @FrData[0], @FrLen);
  if Fst <> 0 then
  begin
    OutPutStr('传输错误！' + IntToStr(Fst));
    exit;
  end;
  FPos_EKeyStateByte := 0;
  for i := 0 to FrLen - 2 do
  begin
    if (FrData[i] = $86) and (FrData[i + 1] = $38) then
    begin
      FPos_EKeyStateByte := i - 1;
      break;
    end;
  end;
  if FPos_EKeyStateByte > 0 then
    Result := True
  else
    OutPutStr('复位错误!');
end;

function TmwEkey.SelectDf: Boolean;
begin
  Result := false;
  //00 a4 00 00 02 1001
  FsData[0] := $00;
  FsData[1] := $A4;
  FsData[2] := $00;
  FsData[3] := $00;
  FsData[4] := $02; //lc
  FsData[5] := $10; //标识符
  FsData[6] := $01;

  result := ControlEKey(7);
end;

function TmwEkey.SelectMf: boolean;
begin
  Result := false;
  //00 a4 00 00 02 3f 00
  FsData[0] := $00;
  FsData[1] := $A4;
  FsData[2] := $00;
  FsData[3] := $00;
  FsData[4] := $02; //lc
  FsData[5] := $3F; //标识符
  FsData[6] := $00;

  result := ControlEKey(7);
end;

procedure TmwEkey.SetIcDev(const Value: Integer);
begin
  FIcDev := Value;
end;

procedure TmwEkey.SetOnStateStr(const Value: TOnStateStr);
begin
  FOnStateStr := Value;
end;

function TmwEkey.VerifyDfKey: boolean;
begin
  Result := false;
  //00 20 00 00 06 01 39 05 16 43 87
  FsData[0] := $00;
  FsData[1] := $20;
  FsData[2] := $00;
  FsData[3] := $00;
  FsData[4] := $06; //lc
  FsData[5] := $01;
  FsData[6] := $39;
  FsData[7] := $05;
  FsData[8] := $16;
  FsData[9] := $43;
  FsData[10] := $87;

  result := ControlEKey(11);
end;

function TmwEkey.VerifyMfKey: boolean;
begin
  Result := false;
  //00 20 00 00 06 2004 12 29 45 47
  FsData[0] := $00;
  FsData[1] := $20;
  FsData[2] := $00;
  FsData[3] := $00;
  FsData[4] := $06; //lc
  FsData[5] := $20;
  FsData[6] := $04;
  FsData[7] := $12;
  FsData[8] := $29;
  FsData[9] := $45;
  FsData[10] := $47;

  result := ControlEKey(11);
end;

function TmwEkey.WriteData(str1: string): boolean;
var
  sdata: array[0..31] of byte;
begin
//===================================
//1、if 我们建立的卡结构
//2、  选择DF文件           标识符1001
//2、  校验DF下的KEY
//3、  写相关软件信息到EF   标识符0006
//===================================
  Result := false;
  DES_Encrypt(@Fkey[0], 8, @str1[1], 32, @sdata[0]);
  if IsNjtyEKey then
  begin
    if not SelectDf then exit;
    if not VerifyDfKey then exit;
    if not WriteToDfEf0006(@sdata[0]) then exit;
  end;
  Result := true;
end;

function TmwEkey.WriteToDfEf0006(Adata: PByte): boolean;
begin
  Result := false;
  //00 d6 86 00 20 //写入的数据
  FsData[0] := $00;
  FsData[1] := $D6;
  FsData[2] := $86; // 100 00 0006
  FsData[3] := $00; //写的偏移量
  FsData[4] := $20; //要写的字节数

  CopyMemory(@FsData[5], Adata, 32);
  result := ControlEKey(37);
end;

end.
