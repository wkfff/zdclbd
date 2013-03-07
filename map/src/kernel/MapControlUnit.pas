unit MapControlUnit;

interface
uses MetaDefine;
type
  ILayer = Interface
    function GetId: Integer;stdcall;
    function GetName: string;stdcall;
    function GetFileName:string;stdcall;
    function IsVisible: Boolean;stdcall;
    function IsSelected: Boolean;stdcall;
    function IsMetaIgnore: Boolean;stdcall;
    function IsShowLabel: Boolean;stdcall;
    function GetlabelValue: string;stdcall;
    function IsLayerIgnore: Boolean;stdcall;
    function GetLayerMinScale: Double;stdcall;
    function GetLayerMaxScale: Double;stdcall;
//    function GetDataFieldCount: Integer;stdcall;
//    function GetDataFieldName(AFieldIndex: Integer): string;stdcall;
    procedure SetVisible(Value: Boolean);stdcall;
    procedure SetSelected(Value: Boolean);stdcall;
    procedure SetMetaIgnore(Value: Boolean);stdcall;
    procedure SetShowLabel(Value: Boolean);stdcall;
    procedure SetLabelValue(Value: string);stdcall;
    procedure SetLayerIgnore(Value: Boolean);stdcall;
    procedure SetLayerMinScale(Value: Double);stdcall;
    procedure SetLayerMaxScale(Value: Double);stdcall;
    procedure ClearLabelText;stdcall;
    function  isHaveNotDelete:boolean;stdcall;
    function  SetHaveNotDelete(Value:Boolean):boolean;stdcall;
    function  GetLayerFont:TMapFont;stdcall;
    procedure SetLayerFont(Value:TMapFont);stdcall;
  end;

  IMap = Interface
    function GetLayerCount: Integer;stdcall;
    function GetLayer(ALayerIndex: Integer): ILayer;stdcall;
    procedure SetZOrder(ALayerID: Integer);stdcall;
  end;
implementation

end.
