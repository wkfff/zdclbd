unit tyodefine;

interface
{$A-}

type
  TFileHead = record
    HeadSize: Integer; //此结合体的大小 SizeOf(FFileHead);
    Identification: Integer; //辩证,Identification := 1;
    Version: Integer; //版本Version := 3;
    Charset: Byte;//字符类型Charset := GB2312_CHARSET
    MetaCount: Integer; //图元总数
    MaxMetaID: Integer; //图元的最大ID号
//    OutBoxLeft: Double; //此图层的外包矩形的Left
//    OutBoxRight: Double;
//    OutBoxTop: Double;
//    OutBoxBottom: Double;
    WorldBoxLeft: Integer;
    WorldBoxRight: Integer;
    WorldBoxTop: Integer;
    WorldBoxBottom: Integer;
    PropType: Byte;
//    EarthIndexOffset: Integer;
//    EarthIndexLength: Integer;
//    EarthDataOffset: Integer;
//    EarthDataLength: Integer;
    WorldIndexOffset: Integer;
    WorldIndexLength: Integer;
    WorldDataOffset: Integer;
    WorldDataLength: Integer;
    PropDataOffset: Integer;
    PropDataLength: Integer;
    FileSize: Integer;
  end;
  PFileHead = ^TFileHead;
  
implementation

end.
