unit MetaDefine;
interface
{$A-}
uses
  math,
  windows,
  classes,
  Graphics;
const
  {С�ڴ�ֵʱ��Ϊ�ø���ֵΪ0}
  ToZero=1e-15;

  {��󸡵���}
  MaxFloat =MaxDouble;
type
  TMetaType = (_Symbol, _Line, _Text, _PolyLine, _Rect,_RoundRect, _PolyRegion);
  //����
  TPenStruct = record
    Width: Integer;
    Pattern: Integer;
    color: TColor;
  end;
  PPenStruct=^TPenStruct;
  //ˢ��
  TBrushStruct=record
    Pattern:Byte;
    ForeColor:TColor;
    BackColor:TColor;
    Transparent:Byte;
  end;
  PBrushStruct=^TBrushStruct;

  //��������
  TEarthPoint = record
    case integer of
     0:(Longitude,Latitude: double); // ����   //γ��
     1:(x,y:double);
  end;
  PEarthPoint=^TEarthPoint;
  TEarthPointAry=array of TEarthPoint;

  //�����������
  TEarthRect = packed record
    case integer of
      0: (Left, Top, Right, Bottom: double);
      1: (TopLeft, BottomRight: TEarthPoint);
      2: (Xmin,Ymax,Xmax,Ymin:Double;)
  end;
  PEarthRect=^TEarthRect;
  TEarthRectAry=array of TEarthRect;

  //�����������
  TWorldRect = record
    case Integer of
      0: (Left, Top, Right, Bottom: Integer);
      1: (TopLeft, BottomRight: TPoint);
      2: (Xmin,Ymax,Xmax,Ymin: Integer);
  end;
  PWorldRect=^TWorldRect;
  TWorldRectAry=array of TWorldRect;

  //��������
  TWorldPoint = TPoint;
  PWorldPoint=^TWorldPoint;
  TWorldPointAry=array of TWorldPoint;
  TPointAry=array of TPoint;
  {TureFont���嶨��
    @TABB
    @H(��ʶ       |����     |����        |�μ�)
    @R(Size       |Byte     |����ĳߴ�  |)
    @R(ForeColor  |TColor   |�ı�����ɫ  |)
    @R(BackColor  |TColor   |����ɫ      |)
    @R(Transparent|Byte     |�����Ƿ�͸��|)
    @R(FontName   |TString32|�����������|)
    @R(FontStyle  |Integer  |����|)
    @R(Rotation   |Single   |��ת�Ƕ�|)
    @TABE
    0-1000����������Ϣ
    @TABB
    @H(������ʾ����|FontStyle|�μ�)
    @R( FW_DONTCARE|  0      |    )
    @R( FW_THIN    |  100    |    )
    @R( FW_EXTRALIGHT|200    |)
    @R( FW_ULTRALIGHT|200    |)
    @R( FW_LIGHT     |300    |)
    @R( FW_NORMAL    |400    |)
    @R( FW_REGULAR   |400    |)
    @R( FW_MEDIUM    |500    |)
    @R( FW_SEMIBOLD  |600    |)
    @R( FW_DEMIBOLD  |600    |)
    @R( FW_BOLD	     |700    |)
    @R(FW_EXTRABOLD  |800    |)
    @R(FW_HEAVY	     |900    |)
    @TABE
    @TABB
    @H(����$01000000ʱ��λ�ֱ��ʾб���»���ɾ���ߵ�)
    @R(FDW_ITALIC        |$01000000);
    @R(FDW_UNDERLINE     |$02000000);
    @R(FDW_STRIKEOUT     |$04000000);
    @TABE
  }
  TTrueFontStruct=record
    //��С,������ڵ�һ��
    Size:Byte;
    //ǰ��ɫ
    ForeColor:TColor;
    //����ɫ
    BackColor:TColor;
    //�����Ƿ�͸�������͸ʱ�����Ա���ɫ
    Transparent:Byte;
    //�����������
    FontName:string[32];
    FontStyle:Integer;
    {��ת�Ƕ�}
    Rotation:Single;
  end;
  TMapFont =record
      //�����������
      Name:string[32];
      //�ִ�С
      Size:integer;
      //����ɫ
      Color:TColor;
  end;
  PTrueFontStruct=^TTrueFontStruct;
  TCustomSymbol=record
    //��С,������ڵ�һ��
    Size:byte;
    //��ɫ
    Color:TColor;
    //���ͣ���Ӧ��ͬ�ķ���
  	Shape:byte;
  end;
  {�ַ������Ŷ���
    <table>
    <tr bgcolor="#CCCCFF">
    <td>��ʶ<div align="center"><b></b></div></td>
    <td>����<div align="center"><b></b></div></td>
    <td>����<div align="center"><b></b></div></td>
    <td>�μ�<div align="center"><b></b></div></td>
    </tr>
    <tr><td>Size</td><td>Byte</td><td>��С,������ڵ�һ��</td><td>  </td></tr>
    <tr><td>Shape</td><td>Byte</td><td>��������Ӧ��ASCIIֵ  </td><td>  </td></tr>
    <tr><td>Color</td><td>TColor</td><td>��ɫ</td><td>  </td></tr>
    <tr><td>FontName</td><td>@link(TString32)</td><td>���ŵļ�������</td><td>  </td></tr>
    <tr><td>FontStyle</td><td>Integer</td><td>����</td><td>  </td></tr>
    <tr><td>Rotation</td><td>Singer</td><td>��ת�Ƕ�</td><td>  </td></tr>
    </table>
    ���ŵ���ʽ FontStyle
    0    Plain
    1    Bold
    2    Italic
    4    Underline
    16   Outline (only supported on the Macintosh)
    32   Shadow
    256  Halo
    512  All Caps
    1024 Expanded
}
  TTrueFontSymbol=record
    //��С,������ڵ�һ��
    Size:byte;
    //��ɫ
    Color:TColor;
    //��������Ӧ��ASCIIֵ
    Shape:byte;
    //���ŵļ�������
    FontName:string[32];
    {���ŵ���ʽ
    0    Plain
    1    Bold
    2    Italic
    4    Underline
    16   Outline (only supported on the Macintosh)
    32   Shadow
    256  Halo
    512  All Caps
    1024 Expanded
    }
    FontStyle:Integer;
    //��ת�Ƕ�
    Rotation:Single;
  end;
  TBitmapSymbol=record
    //��С,������ڵ�һ��
    Size:byte;
    //��ɫ
    Color:TColor;
    //λͼ���ļ���
  	FileName:string[32];
    {�Զ�����ʽ
    0  Both the Show Background setting and the Apply Color setting are off;
      symbol appears in default state. White pixels in the bitmap appear
      transparent, allowing whatever is behind the symbol to show through.
    1  The Show Background settings is on; white pixels in the image are opaque.
    2  The Apply Color setting is on; non-white colors in the image are
      replaced with the Symbol's color value.
    3 Both Show Background and Apply Color settings are on.
    }
    CustomStyle:byte;
  end;
  TSymbolType=(_Custom,_TrueFont,_Bitmap);
{  TEarthSymbol=record
    //���ŵĴ������
    Point:TEarthPoint;
  	//��������ѡ��
    case Style:TSymbolType of
      //�ڲ�����
      _Custom:(CustomSymbol: TCustomSymbol);
      //�ַ�������
      _TrueFont:(TrueFont: TTrueFontSymbol);
      //�Զ�����ţ�λͼ��
      _Bitmap:(Bitmap: TBitmapSymbol);
  end;  }
  
  TWorldSymbol=record
    Position:TWorldPoint;
  	//��������ѡ��
    case Style:TSymbolType of  //dxf add 
      //�ڲ�����
      _Custom:(CustomSymbol: TCustomSymbol);
      //�ַ�������
      _TrueFont:(TrueFont: TTrueFontSymbol);
      //�Զ�����ţ�λͼ��
      _Bitmap:(Bitmap: TBitmapSymbol);
  end;

  TSymbolStruct=TWorldSymbol;

{  TSymbolStruct=record
//    Point:TEarthPoint;
    Position:TWorldPoint;
    case Style:TSymbolType of
      _Custom:(CustomSymbol:TCustomSymbol);
      _TrueFont:(TrueFont:TTrueFontSymbol);
      _Bitmap:(Bitmap:TBitmapSymbol);
  end;   }

{  TEarthLine = record
    //�߶ε���ʼ�㣬��������
    SP: TEarthPoint;
    //�߶ε���ֹ�㣬��������
    EP: TEarthPoint;
    //����������ʹ�õĻ���
    Pen:TPenStruct;
  end;    }


  TWorldLine=record
    //�߶ε���ʼ�㣬��������
    SP:TWorldPoint;
    //�߶ε���ֹ�㣬��������
    EP:TWorldPoint;
    //����������ʹ�õĻ��� //dxf add
    Pen:TPenStruct;
  end;
  
  TLineStruct=TWorldLine;
{  TLineStruct = record
    //�߶ε���ʼ�㣬��������
//    SP:TEarthPoint;
    //�߶ε���ֹ�㣬��������
//    EP:TEarthPoint;
    //�߶ε���ʼ�㣬��������
    SPos:TWorldPoint;
    //�߶ε���ֹ�㣬��������
    EPos:TWorldPoint;
    //����������ʹ�õĻ���
    Pen:TPenStruct;
  end;   }
  TRectStruct=record
    //����������ʹ�õĻ���
    Pen:TPenStruct;
    //����������ʹ�õ�ˢ��
    Brush:TBrushStruct;
  end;
  TRoundRectStruct=record
    //����������ʹ�õĻ���
    Pen:TPenStruct;
    //����������ʹ�õ�ˢ��
    Brush:TBrushStruct;
    //Բ�ǵĽǶ�
    Degree:Single;
  end;
{  TEarthPolyLine=record
    //����������ʹ�õĻ���
    Pen:TPenStruct;
    //�����ݣ��������꣩�������ļ��е���ʼλ��
    PtAddress: Integer;
    //�洢ÿһ�����ߵ����ݣ��������꣩�Ķ��ٵ������������ļ��е���ʼλ��
    SPtAddress: Integer;
    //���ߵ�����
    Count: Integer;
  end;         }
  
  TWorldPolyLine=record
    //����������ʹ�õĻ���
    Pen:TPenStruct;     //dxf add 
    //�����ݣ��������꣩�������ļ��е���ʼλ��
    PWAddress:Integer;
    //�洢ÿһ�����ߵ����ݣ��������꣩�Ķ��ٵ������������ļ��е���ʼλ��
    SPWAddress:Integer;
    //���ߵ�����
    Count: Integer;// dxf add
  end;
  TPolyLineStruct=TWorldPolyLine;
  
{  TPolyLineStruct = record
    //����������ʹ�õĻ���
    Pen:TPenStruct;
    //�����ݣ��������꣩�������ļ��е���ʼλ��
    //PtAddress:Integer;
    //�洢ÿһ�����ߵ����ݣ��������꣩�Ķ��ٵ������������ļ��е���ʼλ��
    //SPtAddress:Integer;

    //�����ݣ��������꣩�������ļ��е���ʼλ��
    PWAddress:Integer;
    //�洢ÿһ�����ߵ����ݣ��������꣩�Ķ��ٵ������������ļ��е���ʼλ��
    SPWAddress:Integer;
    //���ߵ�����
    Count:Integer;
  end;     }
{  TEarthPolyRegion=record
    //����������ʹ�õĻ���
    Pen: TPenStruct;
    //����������ʹ�õ�ˢ��
    Brush: TBrushStruct;
    //�����ݣ��������꣩�������ļ��е���ʼλ��
    PtAddress: Integer;
    //�洢ÿһ����������ݣ��������꣩�Ķ��ٵ������������ļ��е���ʼλ��
    SPtAddress: Integer;
    //�Ӷ����������ε�λ��-��γ������
    //@@SOutBoxAddress:Integer;
    //�Ӷ����������ϵ
    //@@SPositives:Integer;
    //���������
    Count:Integer;
  end;         }
  TWorldPolyRegion = record
    //����������ʹ�õĻ���
    Pen: TPenStruct;
    //����������ʹ�õ�ˢ��
    Brush: TBrushStruct;
    //�����ݣ��������꣩�������ļ��е���ʼλ��
    PWAddress: Integer;
    //�洢ÿһ����������ݣ��������꣩�Ķ��ٵ������������ļ��е���ʼλ��
    SPWAddress: Integer;
    //�Ӷ����������ε�λ��-��������
    //@@SWOutboxAddress: Integer;
    //�Ӷ����������ϵ
    //@@SWPositives: Integer;
    //���������
    Count:Integer;
  end;
  TPolyRegionStruct=TWorldPolyRegion;

{  TPolyRegionStruct = record
    //����������ʹ�õĻ���
    Pen: TPenStruct;
    //����������ʹ�õ�ˢ��
    Brush: TBrushStruct;

    //�����ݣ��������꣩�������ļ��е���ʼλ��
    //PtAddress: Integer;
    //�洢ÿһ����������ݣ��������꣩�Ķ��ٵ������������ļ��е���ʼλ��
    //SPtAddress: Integer;

    //�Ӷ����������ε�λ��-��γ������
    //@@SOutBoxAddress: Integer;
    //�Ӷ����������ϵ
    //@@SPositives: Integer;
    //�����ݣ��������꣩�������ļ��е���ʼλ��
    PWAddress: Integer;
    //�洢ÿһ����������ݣ��������꣩�Ķ��ٵ������������ļ��е���ʼλ��
    SPWAddress: Integer;
    //�Ӷ����������ε�λ��-��������
    //@@SWOutboxAddress: Integer;
    //�Ӷ����������ϵ
    //@@SWPositives: Integer;
    //���������
    Count:Integer;
  end;       }
  TEarthText=record//�ı�;�ڲ����� TGeo_Text
    //�ı��������ļ��д洢����ʼλ��
    Address: Integer;
    //�ı��ĳ���
    Length: Byte;
    //���õ�������Ϣ
    Font: TTrueFontStruct;
    //�ı�����ʼ�㣬��������
    SP: TEarthPoint;
    //�ı�����ֹ�㣬��������
    EP: TEarthPoint;
    //�������
    MaxCols :integer;
    //����
    Rows    :integer;
    //��ʾ��ʽ
    Angle: Double;
  end; 
  TWorldText = record//�ı�;


    //�ı��������ļ��д洢����ʼλ��
    Address: Integer;
    //�ı��ĳ���
    Length: Byte;
    //���õ�������Ϣ
    Font: TTrueFontStruct;

    //�ı���ʼ�㣬��������
    SP: TWorldPoint;
    //�ı�����ֹ�㣬��������
    EP: TWorldPoint;
    //�������
    MaxCols :integer;
    //����
    Rows    :integer;
    //��ʾ��ʽ
    Angle: Double;
  end;
  TTextStruct=TWorldText;

{  TTextStruct=record//�ı�;�ڲ����� TGeo_Text
    //�ı��������ļ��д洢����ʼλ��
    Address: Integer;
    //�ı��ĳ���
    Length: Byte;
    //���õ�������Ϣ
    Font: TTrueFontStruct;

    //�ı�����ʼ�㣬��������
    //SP: TEarthPoint;
    //�ı�����ֹ�㣬��������
    //EP: TEarthPoint;

    //�ı���ʼ�㣬��������
    SP: TWorldPoint;
    //�ı�����ֹ�㣬��������
    EP: TWorldPoint;
    //�������
    MaxCols :integer;
    //����
    Rows    :integer;
    //��ʾ��ʽ
    Angle: Integer;
  end;
       }
{  TEarthMeta = record//ͼԪ
    ID: Integer;
    Enabled: Boolean;
    Anchor: TEarthPoint;
    Outbox: TEarthRect;
    ScaleLimit: Boolean;
    MinScale: Double;
    MaxScale: Double;
    case _type: TMetatype of
      //���Ŷ���
      _Symbol:(Symbol: TEarthSymbol);
      //�߶ζ���
      _Line:(Line: TEarthLine);
      //���ζ���
      _Rect:(Rect: TRectStruct);
      //Բ�Ǿ��ζ���
      _RoundRect:(RoundRect: TRoundRectStruct);
    	//���߶���
      _Polyline:(Polyline: TEarthPolyLine);
    	//�����������
      _PolyRegion:(PolyRegion: TEarthPolyRegion);
    	//�ı�����
      _Text:(Text: TEarthText);
  end;
  PEarthMeta = ^TEarthMeta;
  TEarthMetaAry = array of TEarthMeta;
               }
  TWorldMeta = record//ͼԪ
    ID:integer;
    Enabled: Boolean;
    Outbox: TWorldRect;
    //ê��
    Anchor: TWorldPoint;
    NameAddress: integer;   //��ע��ַ
    NameLen: byte;          //��ע����
    case _type: TMetatype of
      //���Ŷ���
      _Symbol:(Symbol:TWorldSymbol);
      //�߶ζ���
      _Line:(Line:TWorldLine);
      //���ζ���
      _Rect:(Rect: TRectStruct);
      //Բ�Ǿ��ζ���
      _RoundRect:(RoundRect: TRoundRectStruct);
    	//���߶���
      _Polyline:(Polyline: TWorldPolyLine);
    	//�����������
      _PolyRegion:(PolyRegion: TWorldPolyRegion);
    	//�ı�����
      _Text:(Text:TWorldText);
  end;
  PWorldMeta = ^TWorldMeta;
  TWorldMetaAry = array of TWorldMeta;
  TPointerMeta=record
//    PEarth: PEarthMeta;
    PWorld: PWorldMeta;
  end;
  PPointerMeta = ^TPointerMeta;
  TPointerMetaAry = array of TPointerMeta;
  
  TMetaStruct=TWorldMeta;

{  TMetaStruct=record//ͼԪ
    //��ʶͼԪ��Ψһ������ID
    ID:Integer;
    //�Ƿ񼤻��ͼԪ
    Enabled:Boolean;
    //ê��
//    Anchor:TEarthPoint;
    //ͼԪ��������Σ���������
//    Outbox:TEarthRect;
    //�Ƿ��Ǳ�����
//    ScaleLimit: Boolean;
    //��С������
//    MinScale: Double;
    //��������
//    MaxScale: Double;
    //ͼԪ��������Σ���������
    Outbox: TWorldRect;
    //ê��
    Anchor: TWorldPoint;
    NameAddress: integer;   //��ע��ַ
    NameLen: byte;          //��ע����
    //ͼԪ��������ѡ��
    case _type: TMetatype of
      //���Ŷ���
      _Symbol:(Symbol: TSymbolStruct);
      //�߶ζ���
      _Line:(Line: TLineStruct);
      //���ζ���
      _Rect:(Rect: TRectStruct);
      //Բ�Ǿ��ζ���
      _RoundRect:(RoundRect: TRoundRectStruct);
    	//���߶���
      _Polyline:(Polyline: TPolyLineStruct);
    	//�����������
      _PolyRegion:(PolyRegion: TPolyRegionStruct);
    	//�ı�����
      _Text:(Text: TTextStruct);
  end;         }
  PMetaStruct = ^TMetaStruct;
  TMetaStructAry = array of TMetaStruct;
  TMemMetaInfo = record
    LabelText: string;
    Edit: Boolean;
    Delete: Boolean;
    Visible: Boolean;
    VisibleLabel: Boolean;
  end;
  PMemMetaInfo = ^TMemMetaInfo;
  {ͼԪ��̬�������鶨��}
  TMemMetaInfoAry = array of TMemMetaInfo;

  {DrawLayer �Ķ�̬����}
  TDrawMeta=record
    LabelText: string;
    Anchor: TWorldPoint;
  end;
  TDrawMetaAry = array of TDrawMeta;

  TRealPoint=record
    X:double;
    Y:double;
  end;
  {ָ��@link(TRealPoint)��ָ�����Ͷ���}
  PRealPoint=^TRealPoint;
  {ָ��@link(TRealPoint)���������Ͷ���}
  TRealPoints=array of TRealPoint;
  TRealWorldRect = record
  case Integer of
    0: (Left, Top, Right, Bottom: Double);
    1: (Xmin,Ymax,Xmax,Ymin: Double);
  end;
  {ָ��@link(PRealWorldRect)��ָ�����Ͷ���}
  PRealWorldRect=^TRealWorldRect;
  {ָ��@link(TRealWorldRect)���������Ͷ���}
  TRealWorldRects=array of TRealWorldRect;
 //ʵ�����������
  TPolygons = array of TWorldPointAry;


{����һ��WorldRect}
function WorldRect(AXmin, AYmin, AXmax, AYmax: Integer): TWorldRect;
function EarthPoint(ALongitude,ALatitude:Double):TEarthPoint;
{�������ߵĵ�ĸ���}
function GetPolyLinePointsCount(APWorldMeta: PWorldMeta):integer;
{�������εĵ�ĸ���}
function GetPolyGonPointsCount(APWorldMeta: PWorldMeta):integer;
implementation

function WorldRect(AXmin, AYmin, AXmax, AYmax: Integer): TWorldRect;
begin
  with Result do
  begin
    Xmin := AXmin;
    Ymin := AYmin;
    Xmax := AXmax;
    Ymax := AYmax;
  end;
end;
function EarthPoint(ALongitude,ALatitude:Double):TEarthPoint;
begin
  with Result do
  begin
    Longitude:=ALongitude;
    Latitude:= ALatitude;
  end;
end;

function GetPolyLinePointsCount(APWorldMeta: PWorldMeta):integer;
begin
  Result:=0;
  if APWorldMeta^._type <> _PolyLine then Exit;
  with APWorldMeta^.Polyline do
    Result:=(SPWAddress-PWAddress) div SizeOf(TWorldPoint);
end;

function GetPolyGonPointsCount(APWorldMeta: PWorldMeta):integer;
begin
  Result:=0;
  if APWorldMeta^._type <> _PolyRegion then Exit;
  with APWorldMeta^.PolyRegion do
    Result:=(SPWAddress-PWAddress)div SizeOf(TWorldPoint);
end;


end.

















