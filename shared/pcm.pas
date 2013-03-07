unit pcm;

interface
uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;
type

  TWaveHeader = packed record
    fccId:array[0..3] of byte;    // /*   should   be   "RIFF"   */
    dwSize:Cardinal;               //后面的长度 ＝文件总长度-8
    fccType : array[0..3] of byte;   ///*   should   be   "WAVE"
  end;

  TWaveFMT = packed record
    fccID:array[0..3] of byte;       ///*   should   be   "fmt   "   */
    dwSize:Cardinal;     //      /*   should   be   0x10   */
    wFormatTag:word;   //格式标记，PCM=1
    wChannels:word;             //声道数，单声道为1，双声道为2
    dwSamplesPerSec:cardinal; //采样率 （每秒样本数），表示每个通道的播放速度，
    dwAvgBytesPerSec:Cardinal;//波形音频数据传送速率，其值为通道数×每秒数据位数×每样本的数据位数／8。播放软件利用此值可以估计缓冲区的大小
    wBlockAlign:word;    //数据块的调整数（按字节算的），其值为通道数×每样本的数据位值／8。
    uiBitsPerSample:word;  //每样本的数据位数，表示每个声道中各个样本的数据位数。如果有多个声道，对每个声道而言，样本大小都一样。
  end;

  TWaveData =packed record
    fccID:array[0..3] of byte;   //    /*   should   be   "data"   */
    dwSize:Cardinal ;//        /*   byte_number   of   PCM   data   in   byte*/
  end;

    //OkiAdpcm_dec(char mode,char ch,char method,char *indata,unsigned long size,short *res);
  function OkiAdpcm_dec1(mode, ch, method:Byte; indata:PByte;size:Cardinal;res:PWord):Cardinal;
    stdcall; far; external 'dll2.dll' name 'OkiAdpcm_dec1';

const
  DEC_SIZE = 128;
  OKIADPDEC_4ADP2 = $00;
  OKIADPDEC_5ADP2	=	$01;
  OKIADPDEC_6ADP2	=	$02;
  OKIADPDEC_7ADP2	=	$03;
  OKIADPDEC_8ADP2	=	$04;
  OKIADPDEC_4ADP1	=	$05;
  OKIADPDEC_2ADP2	=	$0d;
  //xor密
  CipherAry:array [0..31]of byte =
    (41,35,190,132,225,108,214,174,82,144,73,241,241,187,233,235,179,166,219,60,135,
    12,62,153,36,94,13,28,6,183,71,222);


//将ADP文件转换为pcm,再转换为wav文件
function ConvertAdp2Wav(const adpFileName,waveFileName:String; CodeWay: Byte):Boolean;
//pcm->wav文件。其实是在pcm数据前加一个wav的文件头
function ConvertPcm2Wav(PPcmData:Pbyte;PcmDatalen:integer;wavFileName:string;BitsPerSample,pcmHz:Integer):Boolean;


//将ADP数据 转换为wav文件
function ConvertADPBuff2WavFile(ADPData:PByte;DataLen:Integer;waveFileName:string):Boolean;
function GetFileSize(AFileName: string): integer;

//获取一个wav文件的时间长度。单位：秒
function GetWavFileSeconds(fileName:string):Integer;

implementation


function GetFileSize(AFileName: string): integer;
var
  fs: TFileStream;
begin
  Result := -1 ;
  fs:= TFileStream.Create(AFileName,fmOpenRead);
  try
    Result := fs.Seek(0,2);
    fs.Seek(0,0);
  finally
    fs.Free;
  end;
end;


   //将ADP文件转换为pcm,再转换为wav文件
function ConvertAdp2Wav(const adpFileName,waveFileName:String; CodeWay: Byte):Boolean;
var
  adpFileSize:Integer;
  fs:TFileStream;
  ch,method:Byte;
  indata:array of byte;
  res:array of word;
  tmp:integer;
  i,j,tmpLen :Integer;
  tmp_Res,dwResLen :integer;
  BitsPerSample,pcmHz:Integer;//每个采样的数据位数，采集率
begin
  Result := False;

  if not FileExists(adpFileName)then
    exit;
  try
    adpFileSize := GetFileSize(adpFileName);
    if adpFileSize =0 then
    begin
      raise Exception.Create('文件大小为0');
      exit;
    end;
    SetLength(indata,adpFileSize);
    fs := TFileStream.Create(adpFileName,fmOpenRead);
    try
      fs.ReadBuffer(indata[0],adpFileSize);
    finally
      fs.free;
    end;
    BitsPerSample := 1;//inData[7]; //bit per sample
    pcmHz := 4000;//inData[8]*256  +inData[9]; //采集率 sample rate
    //解密adp文件中的全体数据
   { i:= 128;  //从第128字节开始解。头128个(0..127)不需解。
    while i < adpFileSize do
    begin
      for j:=0 to 31 do
      begin
        if i + j >= adpFileSize then break;
        inData[i+j] := inData[i+j] xor CipherAry[j];
      end;
      i:= i+ 32;
    end; }

    dwResLen := OkiAdpcm_dec1(0,0,0,0,0,0);
    ch:= 1;
    method :=  CodeWay;//OKIADPDEC_4ADP2;
    if method = $44 then
      method := OKIADPDEC_4ADP2//tmp := 2
    else if method = $42 then
      method := OKIADPDEC_2ADP2;//tmp := 4;
    case method of
      OKIADPDEC_4ADP2: tmp :=2;
      OKIADPDEC_5ADP2,
      OKIADPDEC_6ADP2,
      OKIADPDEC_7ADP2,
      OKIADPDEC_8ADP2: tmp:=1;
      OKIADPDEC_4ADP1: tmp :=2;
      OKIADPDEC_2ADP2: tmp :=4;
    end;         
    setlength(res,2* adpFileSize * tmp);
    //方式一：
    dwResLen := OkiAdpcm_dec1(4,ch,method,@inData[0],adpFileSize,@res[0]);

    Result := ConvertPcm2Wav(@res[0],dwResLen*2,waveFileName,BitsPerSample,pcmHz);
  except on e : Exception do
    raise Exception.Create('将adp转换为wav文件时发生错误：'+e.Message);
  end;
end;

function ConvertPcm2Wav(PPcmData:Pbyte;PcmDatalen:integer;wavFileName:string;BitsPerSample,pcmHz:Integer):Boolean; //pcm->wav文件。其实是在pcm数据前加一个wav的文件头
var
  //以下是为了建立.wav头而准备的变量
  pcmHeader:TWaveHeader;
  pcmFmt:TWaveFMT;
  pcmData:TWaveData;
  fpWav:TFileStream;
  tmps:String;
begin
  Result := False;
  try
    fpWav :=  TFileStream.Create(wavFileName,fmCreate or fmOpenWrite);
    fpWav.Position := 0;
    try
      tmps:= 'RIFF';
      CopyMemory(@pcmHeader.fccId[0],@tmps[1],4);
      tmps:= 'WAVE';
      CopyMemory(@pcmHeader.fccType[0],@tmps[1],4);

      tmps:= 'fmt ';
      CopyMemory(@pcmFmt.fccID[0],@tmps[1],4);
      pcmFmt.dwSize := 16;
      pcmFmt.wFormatTag := 1;
      pcmFmt.wChannels := 1;
      pcmFmt.dwSamplesPerSec:=pcmHz;// 4000;

       //每样本的数据位数，表示每个声道中各个样本的数据位数。如果有多个声道，对每个声道而言，样本大小都一样。
      pcmFmt.uiBitsPerSample := 16;//BitsPerSample;

      //波形音频数据传送速率，其值=通道数×每秒数据位数×每样本的数据位数／8。播放软件利用此值可以估计缓冲区的大小
      pcmFmt.dwAvgBytesPerSec := pcmFmt.wChannels * pcmFmt.dwSamplesPerSec * pcmFmt.uiBitsPerSample div 8;

       //数据块的调整数（按字节算的），其值= 通道数×每样本的数据位值／8。
      pcmFmt.wBlockAlign := pcmFmt.wChannels * pcmFmt.uiBitsPerSample Div 8;

      tmps:= 'data';
      CopyMemory(@pcmData.fccID[0],@tmps[1],4);
      pcmData.dwSize := PcmDatalen;
      pcmHeader.dwSize := sizeOf(TwaveHeader)+sizeOf(TWaveFmt)+sizeOf(TWaveData)+ pcmData.dwSize -8;

      fpwav.WriteBuffer(pcmHeader,sizeOf(TwaveHeader));
      fpwav.WriteBuffer(pcmFmt,sizeOf(TWaveFmt));
      fpwav.WriteBuffer(pcmData,sizeOf(TWaveData));
      fpWav.WriteBuffer(PPcmData^,PcmDatalen);
      Result:= True;
    finally
      fpwav.Free;
    end;
  except on e : Exception do
    raise Exception.Create('将pcm转换为wav文件时发生错误：'+e.Message);
  end;
end;

function ConvertADPBuff2WavFile(ADPData:PByte;DataLen:Integer;waveFileName:string):Boolean;
var
  adpFileSize:Integer;
  ch,method:Byte;

  indata:array of byte;
  res:array of word;
  tmp:integer;
  i,j,tmpLen :Integer;
  tmp_Res,dwResLen :integer;

  BitsPerSample,pcmHz:Integer;
begin
  Result := False;

  try
    adpFileSize := Datalen;
    SetLength(inData,adpFileSize);
    copyMemory(@indata[0],AdpData,DataLen);

    dwResLen := OkiAdpcm_dec1(0,0,0,0,0,0);
    ch:= 1;
    method :=  OKIADPDEC_4ADP2;
    case method of
      OKIADPDEC_4ADP2: tmp :=2;
      OKIADPDEC_5ADP2,
      OKIADPDEC_6ADP2,
      OKIADPDEC_7ADP2,
      OKIADPDEC_8ADP2: tmp:=1;
      OKIADPDEC_4ADP1: tmp :=2;
      OKIADPDEC_2ADP2: tmp :=4;
    end;
    SetLength(res,2* adpFileSize * tmp);

     //解密adp文件中的全体数据
    i:= 128;  //从第128字节开始解。头128个(0..127)不需解。
    while i < adpFileSize do
    begin
      for j:=0 to 31 do
      begin
        if i + j >= adpFileSize then break;
        inData[i+j] := inData[i+j] xor CipherAry[j];
      end;
      i:= i+ 32;
    end;    
    //方式一：
    dwResLen := OkiAdpcm_dec1(4,ch,method,@inData[0],adpFileSize,@res[0]);
    BitsPerSample := inData[7]; //bit per sample
    pcmHz := inData[8]*256  +inData[9]; //采集率 sample rate
    Result := ConvertPcm2Wav(@res[0],dwResLen*2,waveFileName,BitsPerSample,pcmHz);
  except
    Result := False;
  end;    
end;      

//获取一个wav文件的时间长度。单位：秒
function GetWavFileSeconds(fileName:string):Integer;
var
  fs : TFileStream;
  pcmHeader:TWaveHeader;
  pcmFmt:TWaveFMT;
  pcmData:TWaveData;
begin
  if not FileExists(fileName) then
  begin
    Result := 0;
    exit;
  end;
  try
    fs := TFileStream.Create(fileName,fmOpenRead);
    try
      fs.ReadBuffer(pcmHeader,sizeOf(TWaveHeader));
      fs.ReadBuffer(pcmFmt,sizeof(TWaveFMT));
      fs.ReadBuffer(pcmData,sizeof(TWaveData));
      Result := Round(pcmData.dwSize / pcmFmt.dwAvgBytesPerSec);
    finally
      fs.Free;
    end;
  except on e: Exception do
    MessageBox(0,pchar(e.Message),'提示',MB_OK + MB_ICONINFORMATION);

  end;
end;

end.
