unit mapplatform;

interface
uses
  emapker,
  classes,
  Controls,
  EventDefine,
  emape,
  Para,
  mapoutlook,
  mapMagnifier,
  ObjDefine,
  Types;
type
  TGisPlatform=class(TBasicObj)
  private
    FOverViewCount:Integer;
    FOverViews:array of TOutlook;
    FMagnifierCount:Integer;
    FMagnifiers:array of TGeoMagnifier;
    FMapCount:Integer;
    FMaps:array of TActionMap;
    FOnMapChanged:TNotifyEvent;
    FOnMapsAfterChanged: TMessageEvent;
    function GetMaps(AIndex: Integer): TCustomMap;
    procedure MapClose(const MapGeoID:Longword);
    procedure OverViewClose(Sender:TObject);
    procedure MagnifierClose(Sender:TObject);
    procedure DoMapAfterChanged(Sender:TObject;MsgID:Integer;Param:TGisParams);
    procedure DoMapActionChanged(Sender:TObject);
    procedure MapBeforeMouseMoveEvent(Sender:TObject);
    procedure MapRefreshed(Sender:TObject);
    function GetOverViews(AIndex: Integer): TOutlook;
    function GetMagnifiers(AIndex: Integer): TGeoMagnifier;


    procedure RemoveMagnifier(const APos:Integer);overload;
    procedure RemoveMagnifier(const AGeoID:Longword);overload;
    procedure NotifyMapLayerRefreshed(const AMapID: Longword);
  protected
    OProvider:TLayerProvider;
    procedure CreateProvider();virtual;
    function CreateMap():TActionMap;virtual;
    procedure DoDealMsgEvent(Sender:TObject;MsgID:Integer;Param:TGisParams);override;
    procedure DataLayerClose(Param:TGisParams);virtual;
  public
    constructor Create();override;
    destructor Destroy();override;
    procedure RemoveMap(const APos:Integer);overload;
    procedure RemoveMap(const AGeoID:Longword);overload;
    procedure RemoveOverView(const APos:Integer);overload;
    procedure RemoveOverView(const AGeoID:Longword);overload;
    function Provider():TLayerProvider;
    function AddNewMap:Integer;
    function AddMap(AMap:TActionMap):Integer;
    function AddNewMagnifer:Integer;
    function AddNewOverView:Integer;
    function GetMapPos(AGeoID:Longword):Integer;
    function GetOverViewPos(AGeoID:Longword):Integer;
    function GetMagnifierPos(AGeoID:Longword):Integer;
    procedure ReDrawMap;overload;
    procedure ReDrawMap(AMapGeoID:Longword);overload;
    property Maps[AIndex:Integer]:TCustomMap read GetMaps;
    property MapCount:Integer read FMapCount;
    property OverViews[AIndex:Integer]:TOutlook read GetOverViews;
    property Magnifiers[AIndex:Integer]:TGeoMagnifier read GetMagnifiers;
    property OnMapChanged:TNotifyEvent read FOnMapChanged Write FOnMapChanged;
    property OnMapsAfterChanged:TMessageEvent read FOnMapsAfterChanged
      Write FOnMapsAfterChanged;
  end;
implementation
uses
  Forms,
  Sysutils,
  tyoexception,
  //GeoCommand,
  RunData,
  windows//,
  //TypeDefine,
  //InfoForm
  ;
{ TGisPlatform }

function TGisPlatform.AddMap(AMap: TActionMap): Integer;
begin
  if FMapCount>=Length(FMaps) then
    SetLength(FMaps,FMapCount+10);
  FMaps[FMapCount]:=AMap;
  FMaps[FMapCount].OnMsgEvent:=Self.DoDealMsgEvent;
  FMaps[FMapCount].OnMapAfterChanged:=Self.DoMapAfterChanged;
  FMaps[FMapCount].OnActionChanged:=Self.DoMapActionChanged;
  FMaps[FMapCount].OnMapRefreshed:=Self.MapRefreshed;
  FMaps[FMapCount].OnBeforeMouseMoveEvent:=Self.MapBeforeMouseMoveEvent;
  //FMaps[FMapCount].Color:=GlobalData.BackColor;
  Result:=FMapCount;
  Inc(FMapCount);
end;

function TGisPlatform.AddNewMagnifer: Integer;
begin
  if FMagnifierCount>=Length(FMagnifiers) then
    SetLength(FMagnifiers,FMagnifierCount+10);
  FMagnifiers[FMagnifierCount]:=TGeoMagnifier.Create(nil,Provider);
  FMagnifiers[FMagnifierCount].OnMsgEvent:=Self.DoDealMsgEvent;
  //FMagnifiers[FMagnifierCount].OnClose:=Self.MagnifierClose;
  Result:=FMagnifierCount;
  Inc(FMagnifierCount);
end;

function TGisPlatform.AddNewMap: Integer;
begin
  Result := AddMap(CreateMap);
(*如果一年后还不用就删掉 2002-11-26 by niexin
  if FMapCount>=Length(FMaps) then
    SetLength(FMaps,FMapCount+10);
  FMaps[FMapCount]:=CreateMap;
  FMaps[FMapCount].OnGeoEvent:=Self.DoDealGeoEvent;
  FMaps[FMapCount].OnMapAfterChanged:=Self.DoMapAfterChanged;
  FMaps[FMapCount].OnActionChanged:=Self.DoMapActionChanged;
  FMaps[FMapCount].OnMapRefreshed:=Self.MapRefreshed;
  FMaps[FMapCount].OnBeforeMouseMoveEvent:=Self.MapBeforeMouseMoveEvent;
  //FMaps[FMapCount].Color:=GlobalData.BackColor;
  Result:=FMapCount;
  Inc(FMapCount);
*)
end;

function TGisPlatform.AddNewOverView: Integer;
begin
  if FOverViewCount>=Length(FOverViews) then
    SetLength(FOverViews,FOverViewCount+10);
  FOverViews[FOverViewCount]:=TOutlook.Create(nil,Provider);
  FOverViews[FOverViewCount].OnMsgEvent:=Self.DoDealMsgEvent;
  Result:=FOverViewCount;
  Inc(FOverViewCount);
end;

constructor TGisPlatform.Create;
begin
  inherited;
  CreateProvider;
  Provider.OnMsgEvent:=Self.DoDealMsgEvent;
end;

function TGisPlatform.CreateMap: TActionMap;
begin
  Result:=TActionMap.Create(nil,Provider);
end;

procedure TGisPlatform.CreateProvider;
begin
  try
    OProvider:=TLayerProvider.Create;
  except
    on EInvalidObject do
      OProvider.Free;
  end;
end;

procedure TGisPlatform.DataLayerClose(Param: TGisParams);
var
  i:Integer;
begin
  //处理地图上对应的图层
  for i:=0 to FMapCount - 1 do
    FMaps[i].Layers.closeLayerByDataID(Param.Params[0].AsLongword);
  //处理鹰眼上对应的图层
  //==> 放到mapOutlook.pas的RefreshLayerRemove处理 sha 20041207
  {for i:=0 to FOverViewCount - 1 do
    FOverViews[i].Layers.closeLayerByDataID(Param.Params[0].AsLongword); }
  //处理放大镜上对应的图层
  for i:=0 to FMagnifierCount - 1 do
    FMagnifiers[i].Layers.closeLayerByDataID(Param.Params[0].AsLongword);
//  ReDrawMap;       //by dxf 2006-06-20
  DoMsgEvent(Self,EV_AFTER_MAP_CHANGED,nil);
end;

destructor TGisPlatform.Destroy;
var
  i:Integer;
begin
  for i:=0 to FMapCount - 1 do
    if FMaps[i]<>nil then FMaps[i].Close;
  FreeAndNil(OProvider);
  inherited;
end;

procedure TGisPlatform.DoDealMsgEvent(Sender: TObject; MsgID: Integer;
  Param: TGisParams);
var
  i: Integer;
//  metaIndexs: TIntegerDynArray;
begin
  case MsgID of
    EV_ERROR_INFO,EV_WARNING_INFO:
    begin
      DoMsgEvent(Self,MsgID,Param);
      Exit;
    end;
  end;
  if Sender is TOutlook then
  begin
    case MsgID of
      EV_CLOSE_MAP:OverViewClose(Sender);
    end;
  end
  else if Sender is TGeoMagnifier then
  begin
    case MsgID of
      EV_CLOSE_MAP:MagnifierClose(Sender);
    end;
  end
  else if Sender is TActionMap then
  begin
    case MsgID of
      EV_CLOSE_MAP:MapClose(Param.Params[0].AsLongword);
      EV_MAP_ACTION_CHANGED:
      begin
        DoMsgEvent(Self,EV_MAP_ACTION_CHANGED,Param);
      end;
      EV_AFTER_MAP_CHANGED:
      begin
        //NotifyMapLayerRefreshed(param.Params[0].AsLongword);
        DoMsgEvent(Self,EV_AFTER_MAP_CHANGED,Param);
      end;
    end;
  end
  else if  Sender is TLayerProvider then
  begin
    case MsgID of
      EV_CLOSE_DATALAYER:DataLayerClose(Param);
      Ev_AFTER_CLOSE_DATALAYER:DoMsgEvent(Self,MsgID,Param);
      EV_META_LABEL_CHANGED:
      begin
        for i:=0 to FMapCount - 1 do
          FMaps[i].ClearLabelText(Param.Params[0].AsLongword);
      end;
    end;
  end;
end;

procedure TGisPlatform.DoMapActionChanged(Sender: TObject);
begin
  if Assigned(FOnMapChanged) then
    FOnMapChanged(Self);
end;

procedure TGisPlatform.DoMapAfterChanged(Sender: TObject; MsgID: Integer;
  Param: TGisParams);
begin
  if Assigned(FOnMapsAfterChanged) then
    FOnMapsAfterChanged(Self,MsgID,param);
end;

function TGisPlatform.GetMagnifierPos(AGeoID: Longword): Integer;
var
  i:Integer;
begin
  Result:=-1;
  for i:=0 to FMagnifierCount-1 do
    if FMagnifiers[i].ID=AGeoID then
    begin
      Result:=i;
      Break;
    end;
  if Result=-1 then raise EIndexError.Create;
end;

function TGisPlatform.GetMagnifiers(AIndex: Integer): TGeoMagnifier;
begin
  if (AIndex>=0)and(AIndex<FMagnifierCount) then
    Result:=FMagnifiers[AIndex]
  else
    raise EIndexError.Create;
end;

function TGisPlatform.GetMapPos(AGeoID: Longword): Integer;
var
  i:Integer;
begin
  Result:=-1;
  for i:=0 to FMapCount-1 do
    if FMaps[i].ID=AGeoID then
    begin
      Result:=i;
      Break;
    end;
  if Result=-1 then raise EIndexError.Create;
end;

function TGisPlatform.GetMaps(AIndex: Integer): TCustomMap;
begin
  if (AIndex>=0)and(AIndex<FMapCount) then
    Result:=FMaps[AIndex]
  else
    raise EIndexError.Create;
end;

function TGisPlatform.GetOverViewPos(AGeoID: Longword): Integer;
var
  i:Integer;
begin
  Result:=-1;
  for i:=0 to FOverViewCount-1 do
    if FOverViews[i].ID=AGeoID then
    begin
      Result:=i;
      Break;
    end;
  if Result=-1 then raise EIndexError.Create;
end;

function TGisPlatform.GetOverViews(AIndex: Integer): TOutlook;
begin
  if (AIndex>=0)and(AIndex<FOverViewCount) then
    Result:=FOverViews[AIndex]
  else
    raise EIndexError.Create;
end;

procedure TGisPlatform.MagnifierClose(Sender: TObject);
begin
  if Sender is TGeoMagnifier then
    RemoveMagnifier(TGeoMagnifier(Sender).ID);
end;

procedure TGisPlatform.MapBeforeMouseMoveEvent(Sender: TObject);
var
  i:Integer;
begin
  for i:=0 to FMagnifierCount-1 do
    if TCustomMap(Sender).ID=FMagnifiers[i].Map.ID then
      FMagnifiers[i].RefreshMagnifier;
end;

procedure TGisPlatform.MapClose(const MapGeoID: Longword);
begin
  RemoveMap(MapGeoID);
end;

procedure TGisPlatform.MapRefreshed(Sender: TObject);
var
  i:Integer;
begin
  if Sender is TCustomMap then
  begin
    if FOverViewCount>0 then
      for i:=0 to FOverViewCount-1 do
        if FOverViews[i].Map.ID=TCustomMap(Sender).ID then
          FOverViews[i].Refresh;
  end;
end;

procedure TGisPlatform.NotifyMapLayerRefreshed(const AMapID: Longword);
var
  i: Integer;
begin
  for i := 0 to FOverViewCount - 1 do
  begin
    if FOverViews[i].Map.ID = AMapID then
    begin
      FOverViews[i].RefreshLayerRemove;
      FOverViews[i].RefreshLayerAdd;
    end;
  end;
  for i := 0 to FMagnifierCount - 1 do
  begin
    if FMagnifiers[i].Map.ID = AMapID then
    begin
      FMagnifiers[i].RefreshLayerRemove;
      FMagnifiers[i].RefreshLayerAdd;
    end;
  end;
end;

procedure TGisPlatform.OverViewClose(Sender: TObject);
begin
  if Sender is TOutlook then
    RemoveOverView(TOutlook(Sender).ID);
end;

function TGisPlatform.Provider: TLayerProvider;
begin
  Result:=OProvider;
end;

procedure TGisPlatform.ReDrawMap;
var
  i:Integer;
begin
  if FMapCount>0 then
    for i:=0 to FMapCount-1 do
      FMaps[i].Draw;   
end;

procedure TGisPlatform.ReDrawMap(AMapGeoID: Longword);
var
  mapPos:Integer;
begin
  mapPos:=GetMapPos(AMapGeoID);
  if mapPos>=0 then
    FMaps[mapPos].Draw;
end;

procedure TGisPlatform.RemoveMagnifier(const AGeoID: Longword);
begin
  RemoveMagnifier(GetMagnifierPos(AGeoID));
end;

procedure TGisPlatform.RemoveMagnifier(const APos: Integer);
var
  i:Integer;
begin
  if (APos>=0)and(APos<FMagnifierCount)then
  begin
    FMagnifiers[APos].Free;
    for i:=APos to FMagnifierCount-2 do
      FMagnifiers[i]:=FMagnifiers[i+1];
    FMagnifiers[FMagnifierCount-1]:=nil;
    Dec(FMagnifierCount);
  end
  else
    raise EIndexError.Create;
end;

procedure TGisPlatform.RemoveMap(const AGeoID: Longword);
begin
  RemoveMap(GetMapPos(AGeoID));
end;

procedure TGisPlatform.RemoveMap(const APos: Integer);
var
  i:Integer;
begin
  if (APos>=0)and(APos<FMapCount)then
  begin
    for i:=0 to FOverViewCount - 1 do
      with FOverViews[i] do
        if Map.ID=FMaps[APos].ID then
        begin
          FOverViews[i].Close;
//          if (Parent<>nil)and(Parent.Parent<>nil) then
//            TCustomForm(Parent.Parent).Close;
//          Break;
        end;
    for i:=0 to FMagnifierCount - 1 do
      with FMagnifiers[i] do
        if Map.ID=FMaps[APos].ID then
        begin
          FMagnifiers[i].Close;
//          if (Parent<>nil)and(Parent.Parent<>nil) then
//            TCustomForm(Parent.Parent).Close;
//          Break;
        end;
    //处理信息窗口
//    formInfo().CloseMap(FMaps[APos].GeoID);
    FMaps[APos].Free;
    for i:=APos to FMapCount-2 do
      FMaps[i]:=FMaps[i+1];
    FMaps[FMapCount-1]:=nil;
    Dec(FMapCount);
  end
  else
    raise EIndexError.Create;
end;

procedure TGisPlatform.RemoveOverView(const AGeoID: Longword);
begin
  RemoveOverView(GetOverViewPos(AGeoID));
end;

procedure TGisPlatform.RemoveOverView(const APos: Integer);
var
  i:Integer;
begin
  if (APos>=0)and(APos<FOverViewCount)then
  begin
    FOverViews[APos].Free;
    for i:=APos to FOverViewCount-2 do
      FOverViews[i]:=FOverViews[i+1];
    FOverViews[FOverViewCount-1]:=nil;
    Dec(FOverViewCount);
  end
  else
    raise EIndexError.Create;
end;

end.
