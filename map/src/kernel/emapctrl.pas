unit emapctrl;

interface
uses
  MapControlUnit, emapker,metadefine;

type
  TLayerCtrl = class(TInterfacedObject,ILayer)
  private
    FLayer: TDrawLayer;
  protected
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

  public
    constructor Create(ALayer: TDrawLayer);
  end;
  TMapCtrl = class(TInterfacedObject,IMap)
  private
    FMap: TMap;
  protected
    function GetLayerCount: Integer;stdcall;
    function GetLayer(ALayerIndex: Integer): ILayer;stdcall;
    procedure SetZOrder(ALayerID: Integer);stdcall;
  public
    constructor Create(AMap: TMap);
  end;

implementation
uses
  DB;
{ TMapCtrl }

constructor TMapCtrl.Create(AMap: TMap);
begin
  FMap := AMap;
end;

function TMapCtrl.GetLayer(ALayerIndex: Integer): ILayer;
begin
  Result := TLayerCtrl.Create(FMap.Layers.GetLayerByIndex(ALayerIndex));
end;

function TMapCtrl.GetLayerCount: Integer;
begin
  Result := FMap.Layers.Count;
end;

procedure TMapCtrl.SetZOrder(ALayerID: Integer);
begin
  FMap.Layers.SetOrder(FMap.Layers.GetLayerIndexByID(ALayerID),0);
end;

{ TLayerCtrl }

procedure TLayerCtrl.ClearLabelText;
begin
//  FLayer.ClearLabelText;
end;

constructor TLayerCtrl.Create(ALayer: TDrawLayer);
begin
  FLayer := ALayer;
end;

{function TLayerCtrl.GetDataFieldCount: Integer;
begin
  if FLayer.Data.DataSet <> nil then
    Result := FLayer.Data.DataSet.FieldCount
  else
    Result := 0;
end;}

{function TLayerCtrl.GetDataFieldName(AFieldIndex: Integer): string;
begin
  Result := FLayer.Data.DataSet.Fields[AFieldIndex].FieldName;
end;   }

function TLayerCtrl.GetFileName: string;
begin
  Result := FLayer.Data.FileName;
end;

function TLayerCtrl.GetId: Integer;
begin
  Result := FLayer.ID;
end;

function TLayerCtrl.GetlabelValue: string;
begin
  Result := FLayer.LabelValue;
end;

function TLayerCtrl.GetLayerFont: TMapFont;
begin
  Result.Name:=FLayer.LabelFont.FontName;
  Result.Size:=FLayer.LabelFont.Size;
  Result.Color:=FLayer.LabelFont.ForeColor;
end;

function TLayerCtrl.GetLayerMaxScale: Double;
begin
  Result := FLayer.MaxScale;
end;

function TLayerCtrl.GetLayerMinScale: Double;
begin
  Result := FLayer.MinScale;
end;

function TLayerCtrl.GetName: string;
begin
  Result := FLayer.LayerName;
end;

function TLayerCtrl.isHaveNotDelete: boolean;
begin
  Result:=FLayer.isHaveNotDelete;
end;

function TLayerCtrl.IsLayerIgnore: Boolean;
begin
  Result := FLayer.EnableScaleLimit;
end;

function TLayerCtrl.IsMetaIgnore: Boolean;
begin
  Result := lyMetaScale in FLayer.State;
end;

function TLayerCtrl.IsSelected: Boolean;
begin
  Result := lySelect in FLayer.State;
end;

function TLayerCtrl.IsShowLabel: Boolean;
begin
  Result := lyLabel in FLayer.State;
end;

function TLayerCtrl.IsVisible: Boolean;
begin
  Result := lyVisible in FLayer.State;
end;

function TLayerCtrl.SetHaveNotDelete(Value:Boolean): boolean;
begin
   FLayer.isHaveNotDelete:=Value;
end;

procedure TLayerCtrl.SetLabelValue(Value: string);
begin
  FLayer.LabelValue := Value;
end;

procedure TLayerCtrl.SetLayerFont(Value: TMapFont);
var
  labelfont:TTrueFontStruct;
begin
    labelfont:=FLayer.LabelFont; //此行是用来初使化用的.  by dxf 2007-02-25
    labelfont.FontName := Value.Name;
    labelfont.Size:= Value.Size;
    labelfont.ForeColor:= Value.Color;
    FLayer.LabelFont:= labelfont;
end;

procedure TLayerCtrl.SetLayerIgnore(Value: Boolean);
begin
  FLayer.EnableScaleLimit := Value;
end;

procedure TLayerCtrl.SetLayerMaxScale(Value: Double);
begin
  FLayer.MaxScale := Value;
end;

procedure TLayerCtrl.SetLayerMinScale(Value: Double);
begin
  FLayer.MinScale := Value;
end;

procedure TLayerCtrl.SetMetaIgnore(Value: Boolean);
begin
  if Value then
    FLayer.State := FLayer.State + [lyMetaScale]
  else
    FLayer.State := FLayer.State - [lyMetaScale]
end;

procedure TLayerCtrl.SetSelected(Value: Boolean);
begin
  if Value then
    FLayer.State := FLayer.State + [lySelect]
  else
    FLayer.State := FLayer.State - [lySelect]
end;

procedure TLayerCtrl.SetShowLabel(Value: Boolean);
begin
  if Value then
    FLayer.State := FLayer.State + [lyLabel]
  else
    FLayer.State := FLayer.State - [lyLabel]
end;

procedure TLayerCtrl.SetVisible(Value: Boolean);
begin
  if Value then
    FLayer.State := FLayer.State + [lyVisible]
  else
    FLayer.State := FLayer.State - [lyVisible]
end;

end.

