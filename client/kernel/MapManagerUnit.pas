unit MapManagerUnit;

interface
  uses NativeXml,MetaDefine,Contnrs,SysUtils,Classes,ComCtrls,Graphics;

type

  TLayerCfg =record
     FilePath:string;
     Visible:boolean;
     Selected:boolean;
     MetaLimit:boolean;
     ShowLabel:boolean;
     LabelField:string;
     ScaleLimit:boolean;
     MinScale:double;
     MaxScale:double;
     LayOrder:integer;
     OutBox:TWorldRect;
     MapFont:TMapFont;
  end;
  PLayerCfg=^TLayerCfg;
  TLayerCfgManager =class
    private
      FLayerCfg: array of TLayerCfg;
      function GetCount: integer;
      function GetLayerCfgItem(index: integer): PLayerCfg;
    public
      constructor Create;
      destructor Destroy; override;
      //添加图层
      function AddLayerCfg(FilePath:string):PLayerCfg;
      //删除图层
      function DelLayerCfg(FilePath:string):boolean;overload;
      function DelLayerCfg(AIndex:integer):boolean;overload;
      //清除所有图层
      procedure Clear;
      //图层总数
      property Count:integer read GetCount;
      //图层INDEX
      property LayerCfgItem[index : integer]:PLayerCfg read GetLayerCfgItem ;
  end;

  TMapNode = class
    private
      FName: string;
      FParentNode: TMapNode;
      ChildMapNodeList:TObjectList;
      FOutBox:TWorldRect;
      FLayerCfgManager: TLayerCfgManager;
      FisDefault:boolean;
      function GetChildNodeItem(Index: integer): TMapNode;
      function GetChildNodeCount: integer;
    public
      constructor Create(AParentNode:TMapNode);
      destructor Destroy; override;
      //添加子结点
      function AddChildNode(AName:string):TMapNode;overload;
      function AddChildNode(ANode:TMapNode):integer;overload;
      //删除子结点
      function DelChildNode(AIndex:integer):boolean;overload;
      function DelChildNode(ANode:TMapNode):boolean;overload;
      procedure ClearMapNode;
    public
      //结点名称
      property Name:string read FName write FName;
      //父结点
      property ParentNode:TMapNode read FParentNode write FParentNode;
      //子结点
      property ChildNodeItem[Index:integer]:TMapNode read GetChildNodeItem;
      //子结点总数
      property ChildNodeCount:integer read GetChildNodeCount;
      //当前地图外包距型
      property OutBox:TWorldRect read FOutBox write FOutBox;
      //图层管理
      property LayerCfgManager:TLayerCfgManager read FLayerCfgManager;
      //是否为默认启动地图结点
      property isDefault:boolean read FisDefault write FisDefault;
  end;


  TMapManger = class(TObject)
  private
     FRootNode:TMapNode;
     FCurrentNode:TMapNode;
     FDefaultNode:TMapNode;
     //把MapNode结点和MapNode所有的子结点都保存到XxlNode里
     procedure SaveXml(XmlNode: TXmlNode; MapNode: TMapNode);
     //把XmlNode结点和XmlNode所有的子结点都读到MapNode里
     procedure ReadXml(XMLNode: TXMLNode; MapNode: TMapNode);
  public
     constructor Create(RootName:string);
     destructor Destroy; override;
     //查找一个接点
     function Find(Name:string):TMapNode;
     //载入一个(地图管理文件)XML文件
     function LoadFile(AFileName:string):boolean;overload;
     function LoadFile(AFileName:string;MapNode:TMapNode):boolean;overload;
     //把当前地图信息保存到XML文件中
     function SaveFile(AFileName:string):boolean;overload;
     function SaveFile(AFileName:string;AMapNode:TMapNode):boolean;overload;
     //改变结点的名字
     procedure ChangeNodeName(ANewNodeName:string;AMapNode:TMapNode);
     //把地图结点信息显示在TreeView上
     procedure ShowToTreeView(TreeView:TTreeView;isShowFile:boolean);
     //设置默认的地图结点
     procedure SetDefaultNode(AMapNode:TMapNode);
     //根结点
     property RootNode:TMapNode read FRootNode write FRootNode;
     //当前结点
     property CurrentNode:TMapNode read FCurrentNode write FCurrentNode;
     //默认结点
     property DefaultNode:TMapNode read FDefaultNode write SetDefaultNode;
  end;

implementation

{ TMapNode }

procedure TMapManger.SaveXml(XmlNode:TXmlNode;MapNode:TMapNode);
var
i:integer;
tempXmlNode:TXmlNode;
ppLayerCfg:PLayerCfg;
begin
if MapNode.isDefault then
  XmlNode.WriteAttributeInteger('isDefault',1)
else
  XmlNode.WriteAttributeInteger('isDefault',0);
XmlNode.WriteAttributeInteger('Left',MapNode.OutBox.Left);
XmlNode.WriteAttributeInteger('Top',MapNode.OutBox.Top);
XmlNode.WriteAttributeInteger('Right',MapNode.OutBox.Right);
XmlNode.WriteAttributeInteger('Bottom',MapNode.OutBox.Bottom);

for i:=0 to MapNode.LayerCfgManager.Count-1 do
begin
  tempXmlNode:=XmlNode.NodeNew('Layer_'+MapNode.Name);
  ppLayerCfg:=MapNode.LayerCfgManager.LayerCfgItem[i];
  tempXmlNode.WriteString('FilePath',ppLayerCfg^.FilePath);
  tempXmlNode.WriteBool('Visible',ppLayerCfg^.Visible);
  tempXmlNode.WriteBool('Selected',ppLayerCfg^.Selected);
  tempXmlNode.WriteBool('MetaLimit',ppLayerCfg^.MetaLimit);
  tempXmlNode.WriteBool('ShowLabel',ppLayerCfg^.ShowLabel);
  tempXmlNode.WriteString('LabelField',ppLayerCfg^.LabelField);
  tempXmlNode.WriteBool('ScaleLimit',ppLayerCfg^.ScaleLimit);
  tempXmlNode.WriteFloat('MinScale',ppLayerCfg^.MinScale);
  tempXmlNode.WriteFloat('MaxScale',ppLayerCfg^.MaxScale);
  tempXmlNode.WriteInteger('LayOrder',ppLayerCfg^.LayOrder);
  tempXmlNode.WriteAttributeInteger('Left',ppLayerCfg^.OutBox.Left);
  tempXmlNode.WriteAttributeInteger('Top',ppLayerCfg^.OutBox.Top);
  tempXmlNode.WriteAttributeInteger('Right',ppLayerCfg^.OutBox.Right);
  tempXmlNode.WriteAttributeInteger('Bottom',ppLayerCfg^.OutBox.Bottom);

  tempXmlNode.WriteString('FontName',ppLayerCfg^.MapFont.Name);
  tempXmlNode.WriteInteger('FontSize',ppLayerCfg^.MapFont.Size);
  tempXmlNode.WriteColor('FontColor',ppLayerCfg^.MapFont.Color);
end;
for i:=0 to MapNode.ChildNodeCount-1 do
begin
  SaveXml(XmlNode.NodeNew(MapNode.ChildNodeItem[i].Name),MapNode.ChildNodeItem[i]);
end;
end;

function TMapNode.AddChildNode(AName: string): TMapNode;
var
  ANode:TMapNode;
begin
  ANode:=TMapNode.Create(Self);
  ANode.Name:=AName;
  AddChildNode(ANode);
  Result:=ANode;
end;

function TMapNode.AddChildNode(ANode: TMapNode): integer;
begin
  Result:=ChildMapNodeList.Add(ANode); 
end;

function TMapNode.GetChildNodeCount: integer;
begin
 Result:=ChildMapNodeList.Count;
end;

function TMapNode.DelChildNode(AIndex: integer): boolean;
var
  node: TMapNode;
begin
  Result := False;
  if (AIndex < 0) or (AIndex >= Self.ChildNodeCount) then
    Exit;
  try
    node := TMapNode(ChildMapNodeList.Items[AIndex]);
    if node <> nil then
    begin
      node.Free;
      ChildMapNodeList.Delete(AIndex);
    end;
    Result:=true;
  except
  end;
end;

function TMapNode.DelChildNode(ANode: TMapNode): boolean;
var
  i:integer;
begin
  Result := False;
  i:= ChildMapNodeList.IndexOf(ANode);
  if i >= 0 then
  begin
    ANode.Free;
    ChildMapNodeList.Delete(i);
    Result := True;
  end;
end;

function TMapNode.GetChildNodeItem(Index: integer): TMapNode;
begin
  Result:=TMapNode(ChildMapNodeList.Items[Index]);
end;



constructor TMapNode.Create(AParentNode: TMapNode);
begin
  Self.ParentNode:=AParentNode;
  ChildMapNodeList:=TObjectList.Create;
  ChildMapNodeList.OwnsObjects := False;
  ChildMapNodeList.Clear;
  FLayerCfgManager:=TLayerCfgManager.Create;
  FOutBox.Xmin:=0;
  FOutBox.Ymin:=0;
  FOutBox.Xmax:=0;
  FOutBox.Ymax:=0;
end;

destructor TMapNode.Destroy;
begin
  //ClearMapNode;
  ChildMapNodeList.Free;
  FLayerCfgManager.Free;
  inherited;
end;

procedure TMapNode.ClearMapNode;
begin
  ChildMapNodeList.Clear;
end;

{ TLayerCfgManager }

function TLayerCfgManager.AddLayerCfg(FilePath: string): PLayerCfg;
var
  i:integer;
begin
  for i:=0 to Count-1 do
  begin
    if LayerCfgItem[i].FilePath=FilePath then
    begin
      Result:=@FLayerCfg[i];
      exit;
    end;
  end;
  i:=Count;
  SetLength(FLayerCfg,i+1);
  Result:=@FLayerCfg[i];
  Result.FilePath:=FilePath;
end;

function TLayerCfgManager.DelLayerCfg(FilePath: string): boolean;
var
  i:integer;
begin
  Result:=false;
  for i:=0 to Count-1 do
    if FLayerCfg[i].FilePath =FilePath then
      Result:=DelLayerCfg(i);
end;



procedure TLayerCfgManager.Clear;
begin
  SetLength(FLayerCfg,0);
end;

function TLayerCfgManager.DelLayerCfg(AIndex: integer): boolean;
var
  i:integer;
begin
  Result:=false;
  if (AIndex>=0)and(AIndex<Count) then
  begin
    for i:=AIndex+1 to Count-1 do
    begin
      FLayerCfg[i-1]:=FLayerCfg[i];
    end;
    SetLength(FLayerCfg,Count-1);
    Result:=true;
  end;
end;

function TLayerCfgManager.GetCount: integer;
begin
  Result:=Length(FLayerCfg);
end;

function TLayerCfgManager.GetLayerCfgItem(index: integer): PLayerCfg;
begin
  Result:=@FLayerCfg[index];
end;



constructor TLayerCfgManager.Create;
begin
  Self.Clear;
end;

destructor TLayerCfgManager.Destroy;
begin
  Self.Clear;
  inherited;
end;

{ TMapManger }

constructor TMapManger.Create(RootName: string);
begin
  FRootNode:=TMapNode.Create(nil);
  FRootNode.Name:=RootName;
  FCurrentNode:=nil;
  FDefaultNode:=nil;
end;

destructor TMapManger.Destroy;
  procedure FreeMap(MapNode:TMapNode);
  var
    i:integer;
  begin
//    if MapNode.ChildNodeCount=0 then
//    begin
//      MapNode.Free;
//    end
//    else
//    begin
//      for i:=0 to MapNode.ChildNodeCount-1 do
//      begin
//        FreeMap(MapNode.ChildNodeItem[i]);
//      end;
//    end;
    for i:=0 to MapNode.ChildNodeCount-1 do
    begin
      FreeMap(MapNode.ChildNodeItem[i]);
    end;
    FreeAndNil(MapNode);
  end;
begin
  FreeMap(FRootNode);
  inherited;
end;

function TMapManger.Find(Name: string): TMapNode;
  function FindNode(Name:string;ANode:TMapNode):TMapNode;
  var
    i:integer;
  begin
    Result:=nil;
    if ANode.Name=Name then
    begin
      Result:=ANode
    end
    else
    begin
      for i:=0 to ANode.ChildNodeCount-1 do
      begin
        Result:=FindNode(Name,ANode.ChildNodeItem[i]);
        if Result<>nil then break;
      end;
    end;
  end;
begin
  Result:=FindNode(Name,FRootNode);
end;

procedure TMapManger.ReadXml(XMLNode:TXMLNode;MapNode:TMapNode);
var
  i:integer;
  OutBox:TWorldRect;
  AList: TList;
  tempXmlNode:TXmlNode;
  pLcfg:PLayerCfg;
  layerName:string;
begin
  if (XMLNode.ReadAttributeInteger('isDefault')=0)or(Self.FDefaultNode<>nil) then
    MapNode.isDefault:=False
  else
  begin
    MapNode.isDefault:=True;
    Self.FDefaultNode:=MapNode;
    //Self.FCurrentNode:=MapNode;
  end;
  OutBox.Left:=XMLNode.ReadAttributeInteger('Left');
  OutBox.Top:=XMLNode.ReadAttributeInteger('Top');
  OutBox.Right:=XMLNode.ReadAttributeInteger('Right');
  OutBox.Bottom:=XMLNode.ReadAttributeInteger('Bottom');
  MapNode.OutBox:=OutBox;
  AList:=TList.Create;
  try
    layerName:='Layer_'+XMLNode.Name;
    XMLNode.NodesByName(layerName,AList);
    for i:=0 to AList.Count-1 do
    begin
      tempXmlNode:=TXMLNode(AList.Items[i]);
      pLcfg:=MapNode.LayerCfgManager.AddLayerCfg(tempXmlNode.ReadString('FilePath'));
      pLcfg^.Visible:=tempXmlNode.ReadBool('Visible');
      pLcfg^.Selected:=tempXmlNode.ReadBool('Selected');
      Plcfg^.MetaLimit:=tempXmlNode.ReadBool('MetaLimit');
      pLcfg^.ShowLabel:=tempXmlNode.ReadBool('ShowLabel');
      pLcfg^.LabelField:=tempXmlNode.ReadString('LabelField');
      pLcfg^.ScaleLimit:=tempXmlNode.ReadBool('ScaleLimit');
      pLcfg^.MinScale:=tempXmlNode.ReadFloat('MinScale');
      pLcfg^.MaxScale:=tempXmlNode.ReadFloat('MaxScale');
      pLcfg^.LayOrder:=tempXmlNode.ReadInteger('LayOrder');
      PLcfg^.OutBox.Left:=tempXmlNode.ReadAttributeInteger('Left');
      PLcfg^.OutBox.Top:=tempXmlNode.ReadAttributeInteger('Top');
      pLcfg^.OutBox.Right:=tempXmlNode.ReadAttributeInteger('Right');
      pLcfg^.OutBox.Bottom:=tempXmlNode.ReadAttributeInteger('Bottom');

      pLcfg^.MapFont.Name:=tempXmlNode.ReadString('FontName','宋体');
      pLcfg^.MapFont.Size:=tempXmlNode.ReadInteger('FontSize',10);
      pLcfg^.MapFont.Color:=tempXmlNode.ReadColor('FontColor',clBlack);
    end;
  finally
    AList.Free;
  end;
  for i:=0 to XMLNode.NodeCount-1 do
  begin
    if XMLNode.Nodes[i].Name<>layerName then
    begin
      ReadXML(XMLNode.Nodes[i],MapNode.AddChildNode(XMLNode.Nodes[i].Name));
    end;
  end;
end;

function TMapManger.LoadFile(AFileName: string): boolean;

var
  XML:TNativeXml;
begin
  Result:=false;
  if FileExists(AFileName) then
  begin
    XML:=TNativeXml.Create;
    try
      XML.LoadFromFile(AFileName);
      FRootNode.Name:=XML.Root.Name;
      ReadXml(XML.Root,FRootNode);
      Result:=true;
    finally
      XML.Free;
    end;
  end;
end;

function TMapManger.SaveFile(AFileName: string): boolean;
var
  XML:TNativeXml;
begin
    XML:=TNativeXml.Create;
    try
      XML.Root.Name:=FRootNode.Name;
      SaveXml(XML.Root,FRootNode);
      try
        Xml.EncodingString:='GB2312';
        Xml.SaveToFile(AFileName);
      except
        Result:=false;
      end;
      Result:=true;
    finally
      XML.Free;
    end;
end;

function TMapManger.SaveFile(AFileName: string; AMapNode:
  TMapNode): boolean;
var
  XML:TNativeXml;
begin
    XML:=TNativeXml.Create;
    try
      XML.Root.Name:=AMapNode.Name;
      SaveXml(XML.Root,AMapNode);
      try
        Xml.EncodingString:='GB2312';
        Xml.SaveToFile(AFileName);
      except
        Result:=false;
      end;
      Result:=true;
    finally
      XML.Free;
    end;
end;

procedure TMapManger.SetDefaultNode(AMapNode: TMapNode);
  procedure SetDefault(Node:TMapNode);
  var
    i:integer;
  begin
    Node.isDefault:=false;
    for i:=0 to Node.ChildNodeCount-1 do
    begin
      SetDefault(Node.ChildNodeItem[i]);
    end;
  end;
begin
  SetDefault(Self.FRootNode);
  AMapNode.isDefault:=true;
  Self.FDefaultNode:=AMapNode;
end;

procedure TMapManger.ShowToTreeView(TreeView: TTreeView;isShowFile:boolean);
  procedure ShowMapCfg(MapNode:TMapNode;TreeNode:TTreeNode);
  var
    i:integer;
    tempTreeNode:TTreeNode;
  begin
    TreeNode.Text:=MapNode.Name;
    TreeNode.Data:=MapNode;
    TreeNode.SelectedIndex:=6;
    if MapNode.isDefault then
    begin
       TreeNode.ImageIndex:=72;
       TreeNode.SelectedIndex:=72;
    end
    else
    begin
      TreeNode.ImageIndex:=3;
    end;
    for i:=0 to MapNode.ChildNodeCount-1 do
    begin
      ShowMapCfg(MapNode.ChildNodeItem[i],Treeview.Items.AddChild(TreeNode,''));
    end;
    if isShowFile then
      for i:=0 to MapNode.LayerCfgManager.Count -1 do
      begin
        tempTreeNode:=Treeview.Items.AddChild(TreeNode,MapNode.LayerCfgManager.LayerCfgItem[i].FilePath);
        tempTreeNode.Data:=nil;
        tempTreeNode.ImageIndex:=-1;
        tempTreeNode.SelectedIndex:=-1;
      end;
    TreeNode.Expanded:=false;
  end;
begin
  TreeView.Items.Clear;
  ShowMapCfg(RootNode,TreeView.Items.AddChildFirst(nil,''));
  TreeView.Items.GetFirstNode.Expanded:=true;
end;

function TMapManger.LoadFile(AFileName: string;
  MapNode: TMapNode): boolean;
var
  XML:TNativeXml;
begin
  Result:=false;
  if FileExists(AFileName) then
  begin
    XML:=TNativeXml.Create;
    try
      XML.LoadFromFile(AFileName);
      MapNode.Name:=XML.Root.Name;
      ReadXml(XML.Root,MapNode);
      Result:=true;
    finally
      XML.Free;
    end;
  end;
end;

procedure TMapManger.ChangeNodeName(ANewNodeName: string; AMapNode: TMapNode);
begin
  AMapNode.Name:=ANewNodeName;
end;

end.
