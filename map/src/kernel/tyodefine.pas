unit tyodefine;

interface
{$A-}

type
  TFileHead = record
    HeadSize: Integer; //�˽����Ĵ�С SizeOf(FFileHead);
    Identification: Integer; //��֤,Identification := 1;
    Version: Integer; //�汾Version := 3;
    Charset: Byte;//�ַ�����Charset := GB2312_CHARSET
    MetaCount: Integer; //ͼԪ����
    MaxMetaID: Integer; //ͼԪ�����ID��
//    OutBoxLeft: Double; //��ͼ���������ε�Left
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
