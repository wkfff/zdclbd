unit MetaDefine;
interface
{$A-}
uses
  math,
  windows,
  classes,
  Graphics;
const
  {小于此值时认为该浮点值为0}
  ToZero=1e-15;

  {最大浮点数}
  MaxFloat =MaxDouble;
type
  TMetaType = (_Symbol, _Line, _Text, _PolyLine, _Rect,_RoundRect, _PolyRegion);
  //画笔
  TPenStruct = record
    Width: Integer;
    Pattern: Integer;
    color: TColor;
  end;
  PPenStruct=^TPenStruct;
  //刷子
  TBrushStruct=record
    Pattern:Byte;
    ForeColor:TColor;
    BackColor:TColor;
    Transparent:Byte;
  end;
  PBrushStruct=^TBrushStruct;

  //地球坐标
  TEarthPoint = record
    case integer of
     0:(Longitude,Latitude: double); // 经度   //纬度
     1:(x,y:double);
  end;
  PEarthPoint=^TEarthPoint;
  TEarthPointAry=array of TEarthPoint;

  //地球坐标巨型
  TEarthRect = packed record
    case integer of
      0: (Left, Top, Right, Bottom: double);
      1: (TopLeft, BottomRight: TEarthPoint);
      2: (Xmin,Ymax,Xmax,Ymin:Double;)
  end;
  PEarthRect=^TEarthRect;
  TEarthRectAry=array of TEarthRect;

  //世界坐标巨型
  TWorldRect = record
    case Integer of
      0: (Left, Top, Right, Bottom: Integer);
      1: (TopLeft, BottomRight: TPoint);
      2: (Xmin,Ymax,Xmax,Ymin: Integer);
  end;
  PWorldRect=^TWorldRect;
  TWorldRectAry=array of TWorldRect;

  //世界坐标
  TWorldPoint = TPoint;
  PWorldPoint=^TWorldPoint;
  TWorldPointAry=array of TWorldPoint;
  TPointAry=array of TPoint;
  {TureFont字体定义
    @TABB
    @H(标识       |类型     |含义        |参见)
    @R(Size       |Byte     |字体的尺寸  |)
    @R(ForeColor  |TColor   |文本的颜色  |)
    @R(BackColor  |TColor   |背景色      |)
    @R(Transparent|Byte     |背景是否透明|)
    @R(FontName   |TString32|字体家族名称|)
    @R(FontStyle  |Integer  |见下|)
    @R(Rotation   |Single   |旋转角度|)
    @TABE
    0-1000描述以下信息
    @TABB
    @H(字体显示类型|FontStyle|参见)
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
    @H(大于$01000000时按位分别表示斜体下划线删除线等)
    @R(FDW_ITALIC        |$01000000);
    @R(FDW_UNDERLINE     |$02000000);
    @R(FDW_STRIKEOUT     |$04000000);
    @TABE
  }
  TTrueFontStruct=record
    //大小,必须放在第一个
    Size:Byte;
    //前景色
    ForeColor:TColor;
    //背景色
    BackColor:TColor;
    //背景是否透明，如果透时，忽略背景色
    Transparent:Byte;
    //字体家族名称
    FontName:string[32];
    FontStyle:Integer;
    {旋转角度}
    Rotation:Single;
  end;
  TMapFont =record
      //字体家族名称
      Name:string[32];
      //字大小
      Size:integer;
      //字颜色
      Color:TColor;
  end;
  PTrueFontStruct=^TTrueFontStruct;
  TCustomSymbol=record
    //大小,必须放在第一个
    Size:byte;
    //颜色
    Color:TColor;
    //类型，对应不同的符号
  	Shape:byte;
  end;
  {字符集符号对象
    <table>
    <tr bgcolor="#CCCCFF">
    <td>标识<div align="center"><b></b></div></td>
    <td>类型<div align="center"><b></b></div></td>
    <td>含义<div align="center"><b></b></div></td>
    <td>参见<div align="center"><b></b></div></td>
    </tr>
    <tr><td>Size</td><td>Byte</td><td>大小,必须放在第一个</td><td>  </td></tr>
    <tr><td>Shape</td><td>Byte</td><td>符号所对应的ASCII值  </td><td>  </td></tr>
    <tr><td>Color</td><td>TColor</td><td>颜色</td><td>  </td></tr>
    <tr><td>FontName</td><td>@link(TString32)</td><td>符号的家族名称</td><td>  </td></tr>
    <tr><td>FontStyle</td><td>Integer</td><td>见下</td><td>  </td></tr>
    <tr><td>Rotation</td><td>Singer</td><td>旋转角度</td><td>  </td></tr>
    </table>
    符号的样式 FontStyle
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
    //大小,必须放在第一个
    Size:byte;
    //颜色
    Color:TColor;
    //符号所对应的ASCII值
    Shape:byte;
    //符号的家族名称
    FontName:string[32];
    {符号的样式
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
    //旋转角度
    Rotation:Single;
  end;
  TBitmapSymbol=record
    //大小,必须放在第一个
    Size:byte;
    //颜色
    Color:TColor;
    //位图的文件名
  	FileName:string[32];
    {自定义样式
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
    //符号的大地坐标
    Point:TEarthPoint;
  	//符号类型选择
    case Style:TSymbolType of
      //内部符号
      _Custom:(CustomSymbol: TCustomSymbol);
      //字符集符号
      _TrueFont:(TrueFont: TTrueFontSymbol);
      //自定义符号（位图）
      _Bitmap:(Bitmap: TBitmapSymbol);
  end;  }
  
  TWorldSymbol=record
    Position:TWorldPoint;
  	//符号类型选择
    case Style:TSymbolType of  //dxf add 
      //内部符号
      _Custom:(CustomSymbol: TCustomSymbol);
      //字符集符号
      _TrueFont:(TrueFont: TTrueFontSymbol);
      //自定义符号（位图）
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
    //线段的起始点，地球坐标
    SP: TEarthPoint;
    //线段的终止点，地球坐标
    EP: TEarthPoint;
    //画出对象所使用的画笔
    Pen:TPenStruct;
  end;    }


  TWorldLine=record
    //线段的起始点，世界坐标
    SP:TWorldPoint;
    //线段的终止点，世界坐标
    EP:TWorldPoint;
    //画出对象所使用的画笔 //dxf add
    Pen:TPenStruct;
  end;
  
  TLineStruct=TWorldLine;
{  TLineStruct = record
    //线段的起始点，地球坐标
//    SP:TEarthPoint;
    //线段的终止点，地球坐标
//    EP:TEarthPoint;
    //线段的起始点，世界坐标
    SPos:TWorldPoint;
    //线段的终止点，世界坐标
    EPos:TWorldPoint;
    //画出对象所使用的画笔
    Pen:TPenStruct;
  end;   }
  TRectStruct=record
    //画出对象所使用的画笔
    Pen:TPenStruct;
    //画出对象所使用的刷子
    Brush:TBrushStruct;
  end;
  TRoundRectStruct=record
    //画出对象所使用的画笔
    Pen:TPenStruct;
    //画出对象所使用的刷子
    Brush:TBrushStruct;
    //圆角的角度
    Degree:Single;
  end;
{  TEarthPolyLine=record
    //画出对象所使用的画笔
    Pen:TPenStruct;
    //点数据（地球坐标）在数据文件中的起始位置
    PtAddress: Integer;
    //存储每一段折线点数据（地球坐标）的多少的数据在数据文件中的起始位置
    SPtAddress: Integer;
    //折线的数量
    Count: Integer;
  end;         }
  
  TWorldPolyLine=record
    //画出对象所使用的画笔
    Pen:TPenStruct;     //dxf add 
    //点数据（世界坐标）在数据文件中的起始位置
    PWAddress:Integer;
    //存储每一段折线点数据（世界坐标）的多少的数据在数据文件中的起始位置
    SPWAddress:Integer;
    //折线的数量
    Count: Integer;// dxf add
  end;
  TPolyLineStruct=TWorldPolyLine;
  
{  TPolyLineStruct = record
    //画出对象所使用的画笔
    Pen:TPenStruct;
    //点数据（地球坐标）在数据文件中的起始位置
    //PtAddress:Integer;
    //存储每一段折线点数据（地球坐标）的多少的数据在数据文件中的起始位置
    //SPtAddress:Integer;

    //点数据（世界坐标）在数据文件中的起始位置
    PWAddress:Integer;
    //存储每一段折线点数据（世界坐标）的多少的数据在数据文件中的起始位置
    SPWAddress:Integer;
    //折线的数量
    Count:Integer;
  end;     }
{  TEarthPolyRegion=record
    //画出对象所使用的画笔
    Pen: TPenStruct;
    //画出对象所使用的刷子
    Brush: TBrushStruct;
    //点数据（地球坐标）在数据文件中的起始位置
    PtAddress: Integer;
    //存储每一个区域点数据（地球坐标）的多少的数据在数据文件中的起始位置
    SPtAddress: Integer;
    //子多边形外包矩形的位置-经纬度坐标
    //@@SOutBoxAddress:Integer;
    //子多边形正负关系
    //@@SPositives:Integer;
    //区域的数量
    Count:Integer;
  end;         }
  TWorldPolyRegion = record
    //画出对象所使用的画笔
    Pen: TPenStruct;
    //画出对象所使用的刷子
    Brush: TBrushStruct;
    //点数据（世界坐标）在数据文件中的起始位置
    PWAddress: Integer;
    //存储每一个区域点数据（世界坐标）的多少的数据在数据文件中的起始位置
    SPWAddress: Integer;
    //子多边形外包矩形的位置-世界坐标
    //@@SWOutboxAddress: Integer;
    //子多边形正负关系
    //@@SWPositives: Integer;
    //区域的数量
    Count:Integer;
  end;
  TPolyRegionStruct=TWorldPolyRegion;

{  TPolyRegionStruct = record
    //画出对象所使用的画笔
    Pen: TPenStruct;
    //画出对象所使用的刷子
    Brush: TBrushStruct;

    //点数据（地球坐标）在数据文件中的起始位置
    //PtAddress: Integer;
    //存储每一个区域点数据（地球坐标）的多少的数据在数据文件中的起始位置
    //SPtAddress: Integer;

    //子多边形外包矩形的位置-经纬度坐标
    //@@SOutBoxAddress: Integer;
    //子多边形正负关系
    //@@SPositives: Integer;
    //点数据（世界坐标）在数据文件中的起始位置
    PWAddress: Integer;
    //存储每一个区域点数据（世界坐标）的多少的数据在数据文件中的起始位置
    SPWAddress: Integer;
    //子多边形外包矩形的位置-世界坐标
    //@@SWOutboxAddress: Integer;
    //子多边形正负关系
    //@@SWPositives: Integer;
    //区域的数量
    Count:Integer;
  end;       }
  TEarthText=record//文本;内部类型 TGeo_Text
    //文本在数据文件中存储的起始位置
    Address: Integer;
    //文本的长度
    Length: Byte;
    //采用的字体信息
    Font: TTrueFontStruct;
    //文本的起始点，地球坐标
    SP: TEarthPoint;
    //文本的终止点，地球坐标
    EP: TEarthPoint;
    //最大列数
    MaxCols :integer;
    //行数
    Rows    :integer;
    //显示样式
    Angle: Double;
  end; 
  TWorldText = record//文本;


    //文本在数据文件中存储的起始位置
    Address: Integer;
    //文本的长度
    Length: Byte;
    //采用的字体信息
    Font: TTrueFontStruct;

    //文本起始点，世界坐标
    SP: TWorldPoint;
    //文本的终止点，世界坐标
    EP: TWorldPoint;
    //最大列数
    MaxCols :integer;
    //行数
    Rows    :integer;
    //显示样式
    Angle: Double;
  end;
  TTextStruct=TWorldText;

{  TTextStruct=record//文本;内部类型 TGeo_Text
    //文本在数据文件中存储的起始位置
    Address: Integer;
    //文本的长度
    Length: Byte;
    //采用的字体信息
    Font: TTrueFontStruct;

    //文本的起始点，地球坐标
    //SP: TEarthPoint;
    //文本的终止点，地球坐标
    //EP: TEarthPoint;

    //文本起始点，世界坐标
    SP: TWorldPoint;
    //文本的终止点，世界坐标
    EP: TWorldPoint;
    //最大列数
    MaxCols :integer;
    //行数
    Rows    :integer;
    //显示样式
    Angle: Integer;
  end;
       }
{  TEarthMeta = record//图元
    ID: Integer;
    Enabled: Boolean;
    Anchor: TEarthPoint;
    Outbox: TEarthRect;
    ScaleLimit: Boolean;
    MinScale: Double;
    MaxScale: Double;
    case _type: TMetatype of
      //符号对象
      _Symbol:(Symbol: TEarthSymbol);
      //线段对象
      _Line:(Line: TEarthLine);
      //矩形对象
      _Rect:(Rect: TRectStruct);
      //圆角矩形对象
      _RoundRect:(RoundRect: TRoundRectStruct);
    	//折线对象
      _Polyline:(Polyline: TEarthPolyLine);
    	//复合区域对象
      _PolyRegion:(PolyRegion: TEarthPolyRegion);
    	//文本对象
      _Text:(Text: TEarthText);
  end;
  PEarthMeta = ^TEarthMeta;
  TEarthMetaAry = array of TEarthMeta;
               }
  TWorldMeta = record//图元
    ID:integer;
    Enabled: Boolean;
    Outbox: TWorldRect;
    //锚点
    Anchor: TWorldPoint;
    NameAddress: integer;   //标注地址
    NameLen: byte;          //标注长度
    case _type: TMetatype of
      //符号对象
      _Symbol:(Symbol:TWorldSymbol);
      //线段对象
      _Line:(Line:TWorldLine);
      //矩形对象
      _Rect:(Rect: TRectStruct);
      //圆角矩形对象
      _RoundRect:(RoundRect: TRoundRectStruct);
    	//折线对象
      _Polyline:(Polyline: TWorldPolyLine);
    	//复合区域对象
      _PolyRegion:(PolyRegion: TWorldPolyRegion);
    	//文本对象
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

{  TMetaStruct=record//图元
    //标识图元的唯一索引号ID
    ID:Integer;
    //是否激活该图元
    Enabled:Boolean;
    //锚点
//    Anchor:TEarthPoint;
    //图元的外包矩形－地球坐标
//    Outbox:TEarthRect;
    //是否考虑比例尺
//    ScaleLimit: Boolean;
    //最小比例尺
//    MinScale: Double;
    //最大比例尺
//    MaxScale: Double;
    //图元的外包矩形－世界坐标
    Outbox: TWorldRect;
    //锚点
    Anchor: TWorldPoint;
    NameAddress: integer;   //标注地址
    NameLen: byte;          //标注长度
    //图元对象类型选择
    case _type: TMetatype of
      //符号对象
      _Symbol:(Symbol: TSymbolStruct);
      //线段对象
      _Line:(Line: TLineStruct);
      //矩形对象
      _Rect:(Rect: TRectStruct);
      //圆角矩形对象
      _RoundRect:(RoundRect: TRoundRectStruct);
    	//折线对象
      _Polyline:(Polyline: TPolyLineStruct);
    	//复合区域对象
      _PolyRegion:(PolyRegion: TPolyRegionStruct);
    	//文本对象
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
  {图元动态属性数组定义}
  TMemMetaInfoAry = array of TMemMetaInfo;

  {DrawLayer 的动态数据}
  TDrawMeta=record
    LabelText: string;
    Anchor: TWorldPoint;
  end;
  TDrawMetaAry = array of TDrawMeta;

  TRealPoint=record
    X:double;
    Y:double;
  end;
  {指向@link(TRealPoint)的指针类型定义}
  PRealPoint=^TRealPoint;
  {指向@link(TRealPoint)的数组类型定义}
  TRealPoints=array of TRealPoint;
  TRealWorldRect = record
  case Integer of
    0: (Left, Top, Right, Bottom: Double);
    1: (Xmin,Ymax,Xmax,Ymin: Double);
  end;
  {指向@link(PRealWorldRect)的指针类型定义}
  PRealWorldRect=^TRealWorldRect;
  {指向@link(TRealWorldRect)的数组类型定义}
  TRealWorldRects=array of TRealWorldRect;
 //实数坐标点数组
  TPolygons = array of TWorldPointAry;


{生成一个WorldRect}
function WorldRect(AXmin, AYmin, AXmax, AYmax: Integer): TWorldRect;
function EarthPoint(ALongitude,ALatitude:Double):TEarthPoint;
{计算折线的点的个数}
function GetPolyLinePointsCount(APWorldMeta: PWorldMeta):integer;
{计算多边形的点的个数}
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

















