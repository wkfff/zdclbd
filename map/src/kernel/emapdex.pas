unit emapdex;

interface

uses
  Windows, Classes, Graphics, MetaDefine, Coord, geome, DB, elog, Sysutils,
  emapker, tyoList, Controls, staticproc, Types, MathCalc, mapProj,MetaManage,tyoexception;

type
  TMetaEditAction=(meAddSymbol,meRemoveMeta,
    meDeletebyIndex,meDeletebyID,meModifyMeta,
    meReCallbyID,meReCallbyIndex,
    meDeletebyIndexs,meReCallbyIndexs,
    meAddLine,meMoveMetas,
    meAddPointInPoly,meRemovePointFromPoly,
    meModifyPointInPoly,
    meModifyBrush,
    meModifyPen,
    meModifyFont,
    meModifySymbol,
    meModifyIgnorP);
  TMetaEditStat=(esNew,esModify,esDelete);
  TEditingMeta=record
    MetaIndex:integer;
    MetaStat:TMetaEditStat;
  end;
  TEditingMetas=array of TEditingMeta;

  TEditDataLayer=class;
  TEditDataLayer=class(TDataLayer)
  private
    FEditedMetas: TYIntegerList;
    FMetasAutoExtendSize:integer;
    FBusy:boolean;
    FDynMetas: TMemMetaInfoAry;
   // FFlexMetas: TFlexDataManage;
    procedure SetMetasAutoExtendSize(const Value: integer);
    procedure FreeAllocMem;
    procedure RefreshFlexValue(MetaIndex: integer);
    procedure NotifyOutBoxChged;
    procedure CreateFlexValue(MetaIndex:integer);

  protected
    FFixMetas:TWorldMetaAry;
    procedure IncMetaCount(Value: integer);override;
    procedure IncMaxMetaID;override;
    procedure DoClose;override;
    property EditedMetas:TYIntegerList read FEditedMetas write FEditedMetas;
    function RemoveMeta(ID:integer):boolean;virtual;
    function RemoveMetaByIndex(AIndex:integer):boolean;virtual;
    procedure MoveMeta(MetaIndex:integer;Offset:TWorldPoint;AProjection:TProjection);virtual;
  public
    constructor Create;override;
    destructor destroy;override;
    class function GetDelphiDefaultValue(AFieldType:TFieldType):Variant;virtual;
    class function GetIdentification:longword;override;
    function AddSymbol(ASymbol:TWorldSymbol):integer;virtual;
    function ModifyMeta(MetaIndex:integer;Meta:TMetaStruct):boolean;virtual;
    function DelMarkMeta(ID:integer):boolean;virtual;
    function DelMarkMetaByIndex(MetaIndex:integer):boolean;virtual;
    function ReCallMeta(ID:integer):boolean;virtual;
    function ReCallMetaByIndex(MetaIndex:integer):boolean;virtual;
    procedure MoveMetas(MetaIndexs: TIntegerDynArray;Offset:TWorldPoint;PrjType:integer);virtual;
    procedure MergeOutBox(NewMetaOutBox:TWorldRect;MergeFlag:boolean);
    procedure CreateDefualtProjection(const APrjType:Integer);
    function GetMetaPointer(Index: Integer): PMetaStruct;override;
    function GetMeta(Index:integer): PMetaStruct;override;
    property MetasAutoExtendSize:integer read FMetasAutoExtendSize write SetMetasAutoExtendSize;
    property DynMetas:TMemMetaInfoAry read FDynMetas Write FDynMetas;
    //property FlexMetas:TFlexDataManage read FFlexMetas;
  end;

implementation
uses
  Para, math, ADOdb, EventDefine, Dialogs, ObjDefine;

{ TEditDataLayer }

function TEditDataLayer.AddSymbol(ASymbol: TWorldSymbol): integer;
begin
  if FBusy then
  begin
    Result:=-1;
    Exit;
  end;
  FBusy:=True;
  try

    IncMetaCount(1);

    with FFixMetas[MetaCount-1] do
    begin
      ID:=MaxMetaID;
      IncMaxMetaID;
      Enabled:=True;
      Outbox.TopLeft:=ASymbol.Position;
      Outbox.BottomRight:=ASymbol.Position ;
      Anchor:=ASymbol.Position;
      EnableScaleLimit:=True;
//      MinScale :=300;
//      MaxScale:=999999;
      _type := _Symbol;
      Symbol:=ASymbol;
    end;

    MergeOutBox(FFixMetas[MetaCount-1].Outbox,true);

    //CreateFlexValue(MetaCount-1);
    Result:=MetaCount-1;
  finally
    FBusy:=False;
  end;            
end;


constructor TEditDataLayer.Create;
var
  earRect:TWorldRect;
//  defualtWorldOutBox:TWorldRect;
begin
  inherited;
  earRect:= WorldRect(0,0,0,0);

  OutBox := earRect;
{  defualtWorldOutBox.Xmin :=MaxInt div 3;
  defualtWorldOutBox.Xmax :=-MaxInt div 3;
  defualtWorldOutBox.Ymax :=-MaxInt div 3;
  defualtWorldOutBox.Ymin :=MaxInt div 3;
                                         }
  FileName:='';
  LayerName:=FileName;
  State:=[lyVisible,lySelect];
  LabelValue:='';
  MaxScale:=999999;
  MinScale:=1;

  FMetasAutoExtendSize:=10;
  SetIdentification(GetIdentification);
  FBusy:=False;

  EditedMetas:=TYIntegerList.Create;
  EditedMetas.Init(20);
  EditedMetas.AutoExtensive:=20;

end;

destructor TEditDataLayer.destroy;
begin
  FreeAllocMem;   //把有删除标记的图元所占的内存释放
  EditedMetas.Free;
  inherited;
end;

class function TEditDataLayer.GetIdentification: longword;
begin
  Result := TDataLayer.GetIdentification;
end;

function TEditDataLayer.ModifyMeta(MetaIndex: integer;
  Meta: TMetaStruct): boolean;
var
  PMetaFix:PMetaStruct;
begin
  PMetaFix:=GetMetaPointer(MetaIndex);
  PMetaFix^.Enabled  := Meta.Enabled;
//  PMetaFix^.ScaleLimit:= Meta.ScaleLimit;
//  PMetaFix^.MinScale := Meta.MinScale;
//  PMetaFix^.MaxScale := Meta.MaxScale;

  case Meta._type of
    _Symbol:
      begin
//        PMetaFix^.Symbol.Point := Meta.Symbol.Point;
        PMetaFix^.Symbol.Style := Meta.Symbol.Style;
        PMetaFix^.Symbol.Position:=Meta.Symbol.Position;
        case PMetaFix^.Symbol.Style of
          _Custom:
            PMetaFix^.Symbol.CustomSymbol := Meta.Symbol.CustomSymbol;
          _TrueFont:
            PMetaFix^.Symbol.TrueFont := Meta.Symbol.TrueFont;
          _Bitmap:
            PMetaFix^.Symbol.Bitmap   := Meta.Symbol.Bitmap;
        end;
//        PMetaFix^.Anchor := Meta.Symbol.Point;
        RefreshFlexValue(MetaIndex);
        //CreateFlexValue(MetaIndex);/////////////
      end;
  end;
  Result:=True;
end;

procedure TEditDataLayer.MoveMeta(MetaIndex: integer; Offset: TWorldPoint;AProjection:TProjection);
{var
  PMetaFix:PEarthMeta;
  PMetaFlex:PWorldMeta;   }
begin
{  PMetaFix:=GetFixMetaPointer(MetaIndex);
  PMetaFlex:=GetFlexMetaPointer(MetaIndex,AProjection.ProjectionType);
  //外包矩形
  inc(PMetaFlex^.Outbox.Xmin,Offset.x);
  inc(PMetaFlex^.Outbox.Xmax,Offset.x);
  inc(PMetaFlex^.Outbox.Ymin,Offset.y);
  inc(PMetaFlex^.Outbox.Ymax,Offset.y);

  //....
  case PMetaFix^._type of
    _Symbol:
      begin
        inc(PMetaFlex^.Symbol.Position.x,Offset.x);
        inc(PMetaFlex^.Symbol.Position.y,Offset.y);
        PMetaFix^.Symbol.Point:=AProjection.XY2LoLa(PMetaFlex^.Symbol.Position);
        PMetaFix^.Anchor         :=PMetaFix^.Symbol.Point;
        PMetaFix^.Outbox.TopLeft    :=PMetaFix^.Anchor;
        PMetaFix^.Outbox.BottomRight:=PMetaFix^.Anchor;
      end;
  end;               }
 // GeometryCalc.MergeEarthRect(EarthOutBox,PMetaFix^.Outbox);    dxf
end;

procedure TEditDataLayer.MoveMetas(MetaIndexs: TIntegerDynArray;
  Offset: TWorldPoint;PrjType:integer);
{var
  i,j:integer;
  pMetaFix:PEarthMeta;
  pMetaFlex:PWorldMeta;
  earthOutBox:TEarthRect;
  Param:TGisParams;
  proj:TProjection;  }
begin
{  proj:=TProjection.Create;
  proj.projectionType:=PrjType;
  try
    for i:=0 to High(MetaIndexs) do
      MoveMeta(MetaIndexs[i],Offset,proj);
    //清除移动图元的标注锚点
    Param:=TGisParams.Create;
    try
      Param.NewParam(2);
      Param.Params[0].AsInteger:=ID;
      Param.Params[0].ParamName:='ID';
      Param.Params[1].PutMemoryBlock(@MetaIndexs[0],Length(MetaIndexs)*SizeOf(Integer));
      Param.Params[1].ParamName:='MetaIndexs';
      DoMsgEvent(self,EV_META_ANCHOR_CHANGED,Param);
    finally
      Param.Free;
    end;

    for i:=0 to FlexMetas.Count-1 do
    begin
      proj.ProjectionType:=FlexMetas.FlexDatas[i].ProjectionType;
      for j:=0 to High(MetaIndexs) do
      begin
        pMetaFix:=GetFixMetaPointer(MetaIndexs[j]);
        pMetaFlex:=@FlexMetas.FlexDatas[i].MetaFLexs[MetaIndexs[j]];
        if FlexMetas.FlexDatas[i].ProjectionType<>PrjType then
          GisMetaMath.ReCalFlex(pMetaFix,pMetaFlex,proj);
        FlexMetas.FlexDatas[i].WorldOutBox:=
          GeometryCalc.MergeRect(FlexMetas.FlexDatas[i].WorldOutBox,pMetaFlex.Outbox);
      end
    end;

    pMetaFix:=GetFixMetaPointer(MetaIndexs[0]);
    earthOutBox:=pMetaFix^.Outbox;
    for j:=1 to High(MetaIndexs) do
    begin
     pMetaFix:=GetFixMetaPointer(MetaIndexs[j]);
     earthOutBox:=GeometryCalc.MergeEarthRect(earthOutBox,pMetaFix^.Outbox);
    end;
    MergeOutBox(earthOutBox,True);
  finally
    proj.Free;
  end;     }
end;

procedure TEditDataLayer.CreateFlexValue(MetaIndex: integer);
{var
  i:integer;
  //pMetaFix:PEarthMeta;
  pMeta:PWorldMeta;
  prj:TProjection;    }
begin
{  pMeta:=@FFixMetas[MetaIndex];
//  prj:=TProjection.Create;
  try
//    for i:=0 to FlexMetas.Count-1 do
    begin
//      prj.ProjectionType:=FlexMetas.FlexDatas[i].ProjectionType;
//      pMetaFlex:=@FlexMetas.FlexDatas[i].MetaFLexs[MetaIndex];
      case pMeta^._type of
        _Symbol:
          with pMeta^ do
          begin
            //GisMetaMath.ReCalFlex(pMetaFix,pMetaFlex,prj);
          end;
      end;
      if Self.MetaCount=1 then
        FlexMetas.FlexDatas[i].WorldOutBox:=pMetaFlex^.Outbox
      else
        FlexMetas.FlexDatas[i].WorldOutBox :=
          GeometryCalc.MergeRect(FlexMetas.FlexDatas[i].WorldOutBox,pMetaFlex^.Outbox);
    end;
  finally
    prj.Free;
  end;         }
end;

procedure TEditDataLayer.RefreshFlexValue(MetaIndex: integer);
{var
  pMetaFix:PEarthMeta;
  pMetaFlex:PWorldMeta;
  prj:TProjection;
  i:integer;   }
begin
{  pMetaFix:=GetFixMetaPointer(MetaIndex);
  prj:=TProjection.Create;
  try
    for i:=0 to FlexMetas.Count-1 do
    begin
      prj.ProjectionType:=FlexMetas.FlexDatas[i].ProjectionType;
      pMetaFlex:=@FlexMetas.FlexDatas[i].MetaFLexs[MetaIndex];
      GisMetaMath.ReCalFlex(pMetaFix,pMetaFlex,prj);
      FlexMetas.FlexDatas[i].WorldOutBox:=
        GeometryCalc.MergeRect(FlexMetas.FlexDatas[i].WorldOutBox,pMetaFlex.Outbox);
    end;
  finally
    prj.Free;
  end;   }
end;

function TEditDataLayer.RemoveMeta(ID: integer): boolean;
var
  metaIndex:integer;
begin
  metaIndex:=GetMetaIndex(ID);
  self.RemoveMetaByIndex(metaIndex);
  Result := True;
end;

function TEditDataLayer.RemoveMetaByIndex(AIndex: integer): boolean;
//var
//  len,i:integer;
begin
 { Result := False;
  if AIndex<0 then Exit;
  len:=(MetaCount-1-AIndex);

  if len>0 then
  begin
    Copymemory(@FFixMetas[AIndex],@FFixMetas[AIndex+1],
      len*SizeOf(TEarthMeta));
    Copymemory(@FDynMetas[AIndex],@FDynMetas[AIndex+1],
      len*SizeOf(TMemMetaInfo));
    for i:=0 to FlexMetas.Count - 1 do
      Copymemory(@FlexMetas.FlexDatas[i].MetaFLexs[AIndex],
        @FlexMetas.FlexDatas[i].MetaFLexs[AIndex+1],
        len*SizeOf(TWorldMeta));
  end;
  self.IncMetaCount(-1);    }
end;

procedure TEditDataLayer.SetMetasAutoExtendSize(const Value: integer);
begin
  if Value<0 then
    FMetasAutoExtendSize:=1
  else
    FMetasAutoExtendSize := Value;
end;

procedure TEditDataLayer.MergeOutBox(NewMetaOutBox:TWorldRect;MergeFlag:boolean);
var
  oldOutBox:TWorldRect;
begin
  oldOutBox := OutBox;
  if MetaCount=1 then OutBox := NewMetaOutBox
  else
  if MergeFlag then //合并
  begin
    OutBox := GeometryCalc.MergeRect(oldOutBox,NewMetaOutBox);
  end;
  //else raise ENotComplete.Create;//分离

  if (OutBox.Left <> oldOutBox.Left) or
     (OutBox.Right <> oldOutBox.Right) or
     (OutBox.Top <> oldOutBox.Top) or
     (OutBox.Bottom <> oldOutBox.Bottom) then
  begin
    NotifyOutBoxChged;
  end;
  //合并外包矩形，如果外包矩形有所变化就通知关联的Map也刷新
end;

procedure TEditDataLayer.IncMetaCount(Value: integer);
//var
//  i:integer;
//  j:integer;

function GetAutoExtendSize(AMetaCount:integer):integer;
begin
  case AMetaCount of
    0..1000:Result:=500;
    1001..10000:Result:=5000;
  else
    Result:=AMetaCount div 4;
  end;
end;

begin
  //inherited IncMetaCount(Value);
  Inc(FMetaCount,Value);
  MetasAutoExtendSize:=GetAutoExtendSize(MetaCount);

  if MetaCount>Length(FFixMetas) then
  begin
    setLength(FFixMetas,MetaCount+MetasAutoExtendSize);
    SetLength(FDynMetas,MetaCount+MetasAutoExtendSize);
  end;

{  for i:=0 to FlexMetas.Count - 1 do //Flex数组添加..
  begin
    if MetaCount>Length(FlexMetas.FlexDatas[i].MetaFLexs) then
      FlexMetas.FlexDatas[i].SetMetaFlexsLength(MetaCount+MetasAutoExtendSize);
  end;

  //记录集添加一行并赋值uID
  if (DataSet<>nil) and (Value>0) then
  for j:=1 to Value do
  begin
    DataSet.Append;
    DataSet.FieldValues['UID']:=MaxMetaID;
    for i:=0 to DataSet.Fields.Count -1 do
    begin
      if (UpperCase(DataSet.Fields.Fields[i].FieldName)='UID') or
         (UpperCase(DataSet.Fields.Fields[i].FieldName)='RECID')
      then
        continue;
      case DataSet.Fields.Fields[i].DataType of
        ftString  : DataSet.Fields.Fields[i].Value:=
          GetDelphiDefaultValue(ftString);
        ftSmallint: DataSet.Fields.Fields[i].Value:=
          GetDelphiDefaultValue(ftSmallint);
        ftInteger : DataSet.Fields.Fields[i].Value:=
          GetDelphiDefaultValue(ftInteger);
        ftDate    : DataSet.Fields.Fields[i].Value:=
          GetDelphiDefaultValue(ftDate);
        ftBoolean : DataSet.Fields.Fields[i].Value:=
          GetDelphiDefaultValue(ftBoolean);
        ftFloat   : DataSet.Fields.Fields[i].Value:=
          GetDelphiDefaultValue(ftFloat);
        else DataSet.Fields.Fields[i].Value:=
          GetDelphiDefaultValue(ftUnKnown);
      end;
    end;
    DataSet.Post;
  end;        }
end;

function TEditDataLayer.DelMarkMeta(ID: integer): boolean;
var
  metaIndex:integer;
begin
  metaIndex:=GetMetaIndex(ID);
  DelMarkMetaByIndex(metaIndex);
  Result := True;
end;

function TEditDataLayer.DelMarkMetaByIndex(MetaIndex: integer): boolean;
{var
  pMetaFix:PEarthMeta;     }
begin
{  pMetaFix:=GetFixMetaPointer(MetaIndex);
  pMetaFix^.Enabled:=False;
  FDynMetas[MetaIndex].Delete:=True;
  Result := True;    }
end;

function TEditDataLayer.ReCallMeta(ID: integer): boolean;
var
  metaIndex:integer;
begin
  metaIndex:=GetMetaIndex(ID);
  ReCallMetaByIndex(metaIndex);
  Result := True;
end;

function TEditDataLayer.ReCallMetaByIndex(MetaIndex: integer): boolean;
{var
  pMetaFix:PEarthMeta;  }
begin
{  pMetaFix:=GetFixMetaPointer(MetaIndex);
  pMetaFix^.Enabled:=True;
  FDynMetas[MetaIndex].Delete:=False;
  Result := True;    }
end;



procedure TEditDataLayer.CreateDefualtProjection(const APrjType:Integer);
begin
  if APrjType<>ProjectionType then
    ProjectionType:=APrjType;
end;

procedure TEditDataLayer.FreeAllocMem;
{var
  i:integer;
  pMetaFix:PEarthMeta;
  MetaIndex:integer;     }
begin
{  for i:=0 to FEditedMetas.Count-1 do
  begin
    MetaIndex:=FEditedMetas.GetData(i);
    pMetaFix:=GetFixMetaPointer(MetaIndex);
      ///////////////
      try
      case pMetaFix^._type of
        _Symbol:;
        _Line:;
        _Rect:;
        _RoundRect:;
      end;
      except
        TErrorLog.ErrLog(ErrFormat('TEditDataLayer.FreeAllocMem','FixMeta'));
      end;
  end;    }
end;

procedure TEditDataLayer.DoClose;
begin
  inherited DoClose;
end;

procedure TEditDataLayer.NotifyOutBoxChged;
var
  Param:TGisParams;
begin
  Param := TGisParams.Create;
  try
    Param.NewParam(1);
    Param.Params[0].AsInteger:=self.ID;
    Param.Params[0].ParamName:='ID';
    DoMsgEvent(self,EV_LAYER_OUTBOX_CHANGED,Param);
  finally
    Param.Free;
  end;
end;

class function TEditDataLayer.GetDelphiDefaultValue(
  AFieldType: TFieldType): Variant;
begin
  case AFieldType of
    ftString:Result:='';
    ftSmallint:Result:=0;
    ftInteger:Result:=0;
    ftBoolean:Result:=False;
    ftFloat:Result:=0.0;
    ftDate:Result:=Date;
  end;
end;

function TEditDataLayer.GetMetaPointer(Index: Integer): PMetaStruct;
begin
  if (Index>=0)and(Index<MetaCount)then
  begin
    Result:=@FFixMetas[Index];
  end
  else
    raise EIndexError.Create;
end;

function TEditDataLayer.GetMeta(Index: integer): PMetaStruct;
begin
  if (Index>=0)and(Index<MetaCount)then
  begin
    Result:=@FFixMetas[Index];
  end
  else
    raise EIndexError.Create;
end;

procedure TEditDataLayer.IncMaxMetaID;
begin
  Inc(FMetaCount);
end;

end.
