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
  COMPANY_NAME = '�Ͼ�ͨ�õ�����';
  EKey_NAME = '���ܹ�';
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

    //��Կ
    Fkey: array[0..7] of byte;
    //��λ�󣬿�״̬�ֽڵ��ڷ��ص�rData�е�λ��.  ��ͬ���ε�EKey�����ֽ�λ�ÿ��ܲ�ͬ
    FPos_EKeyStateByte: smallInt;

    procedure SetOnStateStr(const Value: TOnStateStr);
    procedure SetIcDev(const Value: Integer);
  protected
    //��λ��
    function ReSetEKey: boolean;
    function CreateMf(): boolean;
    function CreateDf(): boolean;
    function EndMf: boolean;
    function EndDf: boolean;
    function SelectMf: boolean;
    function SelectDf: Boolean;
    //����MF�µ�Key �ļ�
    function CreateMfKey: boolean;
    function AddMfKey1: boolean;
    function AddMfKey2: boolean;
    //����DF�µ�Key �ļ�
    function CreateDfKey: boolean;
    function AddDfKey1: boolean;
    function AddDfKey2: boolean;
    //����DF�µġ�����EF 0006
    function CreateDfEf0006: boolean;
    //У��MF�µ�KEY
    function VerifyMfKey: boolean;
    //У��DF�µ�KEY
    function VerifyDfKey: boolean;
    //д���ݵ�DF�µ�EF0006��
    function WriteToDfEf0006(Adata: PByte): boolean;
    //�����ݴ�DF�µ�EF0006��
    function ReadFromDfEf0006: PByte;
    //ɾ��MF
    function DelMF: boolean;
    //�Կ����� ��mw_protocol
    function ControlEKey(sLen: Integer): boolean;
    //�����ʾ
    procedure OutPutStr(Astr: string);
    //�ж������Ƿ��еĿ��ṹ
    function IsNjtyEKey: boolean;
  public
    constructor Create;
    destructor Destroy; override;
  published
    function InitEKey: boolean;
    procedure CloseEKey(icdev: Integer);
    //�����ṹ,=>���û�Ӧ��������Ϊ��ʼ��
    function CreateFile: boolean;
    //д����������ֵ
    function WriteData(str1: string): boolean;
    //���� ��������ֵ
    function ReadData: string;
    //���������Ϊ�գ�ɾMF
    function ClrEKey: boolean;
    //ȡ��EKEY�ĵ�ǰ״̬
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
  FsData[8] := $0B; //��Կ����
  FsData[9] := $0E;
  FsData[10] := $EE;
  FsData[11] := $EE;
  FsData[12] := $FF;
  FsData[13] := $01; //����
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
  FsData[8] := $06; //��Կ����
  FsData[9] := $0E;
  FsData[10] := $EE;
  FsData[11] := $EE;
  FsData[12] := $FF;
  FsData[13] := $01; //����
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
  FsData[8] := $0B; //��Կ����
  FsData[9] := $0F;
  FsData[10] := $FF;
  FsData[11] := $FF;
  FsData[12] := $FF;
  FsData[13] := $20; //����
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
  FsData[8] := $06; //��Կ����
  FsData[9] := $0F;
  FsData[10] := $FF;
  FsData[11] := $FF;
  FsData[12] := $FF;
  FsData[13] := $84; //����
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
//1��if ���ǽ����Ŀ��ṹ
//2��  ѡ��MF�ļ�           ��ʶ��1001
//2��  У��MF�µ�KEY
//3��  ɾ��MF
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
    OutPutStr('�������' + IntToStr(Fst));
    exit;
  end;
  if (FrData[FrLen - 2] = $90) and (FrData[FrLen - 2 + 1] = 00) then
    result := true;
end;

constructor TmwEkey.Create;
begin
  //��дMF��DF��EF 0006 ������ʱ�õġ�DES���� ��Կ
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
  FsData[5] := $10; //��ʶ��
  FsData[6] := $01;
  FsData[7] := $EE;
  FsData[8] := $00;
  FsData[9] := $41; // ��
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
  FsData[5] := $00; //��ʶ��
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
  FsData[5] := $00; //��ʶ��
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
  //�����������£�2004-12-29
  //1��Reset EKey ======��λ===========
  //+ �ж���01 :δ��ʼ�� �û��� =>�����Խ������ṹ
  //2��Create MF
  //3��..Create ����Ŀ¼MF��Key  SEF    ��ʶ�� 0001
  //4��....Add ������Կ
  //5��....Add ������Կ
  //6��..Create DF                      ��ʶ�� 1001
  //7��..ѡ��DF
  //8��....Create Ӧ��Ŀ¼DF��Key��SEF  ��ʶ�� 0005
  //9��......Add ������Կ
  //10 ......Add ������Կ
  //11 ....Create ��Ϣ�ļ�EF            ��ʶ�� 0006
  //12 ..End DF
  //13 End MF
  //===================================
  Result := false;

  if not ReSetEKey then exit;
  //�ж���01 :δ��ʼ�� �û��� =>�����Խ������ṹ
  //if FrData[5] <> $01 then
  if FrData[FPos_EKeyStateByte] <> $01 then
  begin
    OutPutStr('��' + EKEY_NAME + '�ѳ�ʼ������Ǳ�ϵͳ��' + EKEY_NAME + '��');
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
  FsData[5] := $FF; //8���ֽڴ������
  FsData[6] := $FF;
  FsData[7] := $FF;
  FsData[8] := $FF;
  FsData[9] := $FF;
  FsData[10] := $FF;
  FsData[11] := $FF;
  FsData[12] := $FF;
  FsData[13] := $0F; //�����ļ�Ȩ��
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
  FsData[5] := $00; //��ʶ��
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
  FsData[5] := $FF; //�������
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
  FsData[3] := $01; //����
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
  FsData[3] := $01; //����
  FsData[4] := $02; //lc
  FsData[5] := $3F;
  FsData[6] := $00;

  result := ControlEKey(7);
end;

function TmwEkey.GetEKeyState: boolean;
begin
//......�����ǽ����� ,�ѽ����ṹ => ���û�������Ϊ��ʼ����
  Result := false;
  if IsNjtyEKey then
  begin
    OutPutStr(EKEY_NAME + '�ѳ�ʼ����');
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
    OutPutStr('�������' + IntToStr(Fst));
    exit;
  end;
  for i := 0 to 7 do
  begin
    if FrData[i] = $31 then
    begin
      //Connect
      Fst := mw_init(i, 1, @FIcDev);
      if FIcDev < 0 then continue;
      //OutPutStr('��ǰ����:MWDEV'+IntToStr(i));
      Result := true;
      break;
    end;
  end;
  if FIcDev <= 0 then
  begin
    OutPutStr('û�м�⵽' + EKEY_NAME + '!');
    exit;
  end;
end;

function TmwEkey.IsNjtyEKey: boolean;
var
  i, ipos, nameLc: Integer;
  str1: string;
begin
//��λ��
//..���Ϊ61�����Ѹ��˻����û���
//....���Ѹ��˻���ѡ��MF����MF�Ƿ�Ϊ���ǽ�����
//......�����ǽ����ģ�
//......�������ǽ����ģ�����    =>�Ǳ�ϵͳ�����޷�ʶ��!
//..���Ϊ01, δ���˻��û��� ���� =>�տ�
//=====================================
  Result := false;
  if not ReSetEKey then exit;
  //..���Ϊ61�����Ѹ��˻����û���
  //if FrData[5]= $61 then
  if FrData[FPos_EKeyStateByte] = $61 then
  begin
    //....���Ѹ��˻���ѡ��MF����MF�Ƿ�Ϊ���ǽ�����
    if not SelectMf then exit;
    //$84��Ϊ: ���� + MF��
    for i := 0 to FrLen - 1 do
      if FrData[i] = $84 then break;
    nameLc := FrData[i + 1];
    ipos := i + 2;
    if nameLc <> 14 then
    begin
      OutPutStr('��' + COMPANY_NAME + '���е�' + EKEY_NAME + '��');
      exit;
    end
    else
    begin
      for i := 0 to 13 do
        if (FrData[iPos + i]) <> ord(MF_NAME[i + 1]) then
        begin
          OutPutStr('��' + COMPANY_NAME + '���е�' + EKEY_NAME + '��');
          exit;
        end;
    end;
    // nameLc =14 ,��MF��=njty.key.soft0 ===>�����ǽ����Ŀ�
    Result := true;
  end
  else if FrData[FPos_EKeyStateByte] = $01 then
    OutPutStr('�հ�' + EKEY_NAME + '��')
  else
    OutPutStr('����ʶ���' + EKEY_NAME + '��');
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
//1��if ���ǽ����Ŀ��ṹ
//2��  ѡ��DF�ļ�           ��ʶ��1001
//2��  У��DF�µ�KEY
//3��  ��EF����������Ϣ   ��ʶ��0006
//===================================
  Result := '';
  if IsNjtyEKey then
  begin
    if not SelectDf then exit;
    if not VerifyDfKey then exit;

    pp := ReadFromDfEf0006;
     //����
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
  FsData[3] := $00; //����ƫ������
  FsData[4] := $20; //Ҫ��ȡ���ֽ���

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
    OutPutStr('�������' + IntToStr(Fst));
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
    OutPutStr('��λ����!');
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
  FsData[5] := $10; //��ʶ��
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
  FsData[5] := $3F; //��ʶ��
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
//1��if ���ǽ����Ŀ��ṹ
//2��  ѡ��DF�ļ�           ��ʶ��1001
//2��  У��DF�µ�KEY
//3��  д��������Ϣ��EF   ��ʶ��0006
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
  //00 d6 86 00 20 //д�������
  FsData[0] := $00;
  FsData[1] := $D6;
  FsData[2] := $86; // 100 00 0006
  FsData[3] := $00; //д��ƫ����
  FsData[4] := $20; //Ҫд���ֽ���

  CopyMemory(@FsData[5], Adata, 32);
  result := ControlEKey(37);
end;

end.
