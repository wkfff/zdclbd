{�û�ע�ᣬȡ�û����ϵĴ�������������к�
���������SCSIӲ�̲���
 @created(2004-12-20)
 @lastmod(GMT:$Date: 2012/10/29 01:46:42 $) <BR>
 ��������:$Author: wfp $<BR>
 ��ǰ�汾:$Revision: 1.1.1.1 $<BR>}
unit GetIdeNumUnit;

interface
  uses SysUtils,Windows;
  function GetIdeSerialNumber:pchar;
  function GetEncryNum:string;  //�õ����ܺ�ġ���������������к�
  function GetZch(ABackNum :string):string;//  �õ�ע���

implementation


function GetIdeSerialNumber: pchar;
  const IDENTIFY_BUFFER_SIZE = 512;
type
   TIDERegs = packed record
     bFeaturesReg: BYTE; // Used for specifying SMART "commands".
     bSectorCountReg: BYTE; // IDE sector count register
     bSectorNumberReg: BYTE; // IDE sector number register
     bCylLowReg: BYTE; // IDE low order cylinder value
     bCylHighReg: BYTE; // IDE high order cylinder value
     bDriveHeadReg: BYTE; // IDE drive/head register
     bCommandReg: BYTE; // Actual IDE command.
     bReserved: BYTE; // reserved for future use. Must be zero.
  end;
  TSendCmdInParams = packed record
    // Buffer size in bytes
    cBufferSize: DWORD;
    // Structure with drive register values.
    irDriveRegs: TIDERegs;
    // Physical drive number to send command to (0,1,2,3).
    bDriveNumber: BYTE;
    bReserved: array[0..2] of Byte;
    dwReserved: array[0..3] of DWORD;
    bBuffer: array[0..0] of Byte; // Input buffer.
  end;
  TIdSector = packed record
    wGenConfig: Word;
    wNumCyls: Word;
    wReserved: Word;
    wNumHeads: Word;
    wBytesPerTrack: Word;
    wBytesPerSector: Word;
    wSectorsPerTrack: Word;
    wVendorUnique: array[0..2] of Word;
    sSerialNumber: array[0..19] of CHAR;
    wBufferType: Word;
    wBufferSize: Word;
    wECCSize: Word;
    sFirmwareRev: array[0..7] of Char;
    sModelNumber: array[0..39] of Char;
    wMoreVendorUnique: Word;
    wDoubleWordIO: Word;
    wCapabilities: Word;
    wReserved1: Word;
    wPIOTiming: Word;
    wDMATiming: Word;
    wBS: Word;
    wNumCurrentCyls: Word;
    wNumCurrentHeads: Word;
    wNumCurrentSectorsPerTrack: Word;
    ulCurrentSectorCapacity: DWORD;
    wMultSectorStuff: Word;
    ulTotalAddressableSectors: DWORD;
    wSingleWordDMA: Word;
    wMultiWordDMA: Word;
    bReserved: array[0..127] of BYTE;
  end;
  PIdSector = ^TIdSector;
  TDriverStatus = packed record
    // ���������صĴ�����룬�޴��򷵻�0
    bDriverError: Byte;
    // IDE����Ĵ��������ݣ�ֻ�е�bDriverError Ϊ SMART_IDE_ERROR ʱ��Ч
    bIDEStatus: Byte;
    bReserved: array[0..1] of Byte;
    dwReserved: array[0..1] of DWORD;
  end;
  TSendCmdOutParams = packed record
    // bBuffer�Ĵ�С
    cBufferSize: DWORD;
    // ������״̬
    DriverStatus: TDriverStatus;
    // ���ڱ�������������������ݵĻ�������ʵ�ʳ�����cBufferSize����
    bBuffer: array[0..0] of BYTE;
  end;
var
  hDevice: Thandle;
  cbBytesReturned: DWORD;
  SCIP: TSendCmdInParams;
  aIdOutCmd: array[0..(SizeOf(TSendCmdOutParams) + IDENTIFY_BUFFER_SIZE-1)-1] of Byte;
  IdOutCmd: TSendCmdOutParams absolute aIdOutCmd;
  procedure ChangeByteOrder(var Data; Size: Integer);
  var
    ptr: Pchar;
    i: Integer;
    c: Char;
  begin
    ptr := @Data;
    for I := 0 to (Size shr 1) - 1 do begin
      c := ptr^;
      ptr^ := (ptr + 1)^;
      (ptr + 1)^ := c;
      Inc(ptr, 2);
    end;
  end;
begin
  Result := ''; // ��������򷵻ؿմ�
  if SysUtils.Win32Platform = VER_PLATFORM_WIN32_NT then
  begin // Windows NT, Windows 2000
    // ��ʾ! �ı����ƿ���������������������ڶ����������� '\\.\PhysicalDrive1\'
    hDevice := CreateFile('\\.\PhysicalDrive0', GENERIC_READ or GENERIC_WRITE,
    FILE_SHARE_READ or FILE_SHARE_WRITE, nil, OPEN_EXISTING, 0, 0);
  end
  else // Version Windows 95 OSR2, Windows 98
    hDevice := CreateFile('\\.\SMARTVSD', 0, 0, nil, CREATE_NEW, 0, 0);
  if hDevice = INVALID_HANDLE_VALUE then Exit;
  try
    FillChar(SCIP, SizeOf(TSendCmdInParams) - 1, #0);
    FillChar(aIdOutCmd, SizeOf(aIdOutCmd), #0);
    cbBytesReturned := 0;
    // Set up data structures for IDENTIFY command.
    with SCIP do
    begin
      cBufferSize := IDENTIFY_BUFFER_SIZE;
      // bDriveNumber := 0;
      with irDriveRegs do
      begin
        bSectorCountReg := 1;
        bSectorNumberReg := 1;
        // if Win32Platform=VER_PLATFORM_WIN32_NT then bDriveHeadReg := $A0
        // else bDriveHeadReg := $A0 or ((bDriveNum and 1) shl 4);
        bDriveHeadReg := $A0;
        bCommandReg := $EC;
      end;
    end;
    if not DeviceIoControl(hDevice, $0007C088, @SCIP, SizeOf(TSendCmdInParams) - 1,
      @aIdOutCmd, SizeOf(aIdOutCmd), cbBytesReturned, nil) then Exit;
  finally
    CloseHandle(hDevice);
  end;
  with PIdSector(@IdOutCmd.bBuffer)^ do
  begin
    ChangeByteOrder(sSerialNumber, SizeOf(sSerialNumber));
    (Pchar(@sSerialNumber) + SizeOf(sSerialNumber))^:= #0;
    Result := Pchar(@sSerialNumber);
  end;
end;

function GetEncryNum:string;
var
  ideNum,str1:string;
  ideJm1,ideJm2:Integer;
  tmpInt1,tmpInt2:Integer;
  i:integer;
  //endNum1,endNum2:string;
begin
  result:= '';
  ideNum := '';
  str1:= Trim(strpas(GetIdeSerialNumber)); //ȡ�ó������к�
  for i:= 1 to length(str1) do
  begin
    if not (str1[i] in ['0'..'9']) then   //��ĸ
      ideNum := ideNum + IntToStr(ord(str1[i]))
    else
      ideNum:= ideNum + str1[i];
  end;
  
  try
    ideJm1 := StrToInt(copy(ideNum,1,8));
  except
    ideJm1 := 12345678;
  end;
  try
    ideJm2 := StrToInt(copy(ideNum,9,8));
  except
    ideJm2 :=65432105;
  end;
  tmpInt1 := (ideJm1 xor 31198112) or  $11223efa;
  tmpInt2 := (ideJm2 and 79092806) xor $8EBCF3a7;

  ideNum:= IntTohex(tmpInt1,8)+ IntToHex(tmpInt2,8);
  while length(ideNum)<16 do
   ideNum := ideNum + IntTostr(random(50));

  //��16λ
  result:=copy(ideNum,1,16);
end;

function GetZch(ABackNum :string):string;
var
  ideNum,str1   : string;
  ideJm1,ideJm2 : Integer;
  tmpInt1,tmpInt2:Integer;
  i : integer;
begin
  result:= '';
  ideNum:= ABackNum;
  ideJm1 := StrToInt('$'+copy(ideNum,1,4)+ copy(ideNum,9,4));
  ideJm2 := StrToInt('$'+copy(ideNum,5,4)+ copy(ideNum,13,4));
  tmpInt1 := (ideJm1 xor $123e2210) and $DE1C90e3;
  tmpInt2 := (ideJm2 and $1EBe869a) xor $993324DC;
  ideNum:= IntToHex(tmpInt1,8)+ IntToHex(tmpInt2,8);
  while length(ideNum)<16 do
   ideNum := ideNum + IntTostr(random(50));
  result:=copy(ideNum,1,16);
end;

end.
