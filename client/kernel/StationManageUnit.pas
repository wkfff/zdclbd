unit StationManageUnit;

interface
 uses MetaDefine,Inifiles,Types,SysUtils,Classes,StrUtils;
 type
   TStationEdit=packed record
     StationName:string[100];
     TextFont:TTrueFontStruct;
     Symbol:TSymbolStruct;
     MinScale:integer;    //===大小范围
     MaxScale:integer;
     roadMemo:string;    //====线路设置
     image1name:string;  //图片1名称
     image2name:string;  //图片2名称
     image1way:string;     //图片1路径
     image2way:string;     //图片2路径
     imagesize:string;
   end;
   PStationEdit=^TStationEdit;

   TStationManager=class
   private
     FStationEdit:array of TStationEdit;
     FCount:integer;
    function GetCount: integer;
    function GetStationEdit(index: integer): PStationEdit;
     function GetPostion(APoint:TPoint):integer;
   public
     function Add(AText:string;APoint:TPoint):PStationEdit;
     function Delete(APoint:TPoint):boolean;overload;
     function Delete(AIndex:integer):boolean;overload;
     function Find(Point:TPoint):integer;
     function SaveToFile(AFileName:string):boolean;
     property Item[index:integer]:PStationEdit read GetStationEdit;
     property Count:integer read GetCount;
     function LoadFromFile(AFileName:string):boolean;

 end;
implementation
uses geome;
{ TStationManager }

function TStationManager.Add(AText: string; APoint: TPoint): PStationEdit;
var
  i,post:integer;
begin
  post:=GetPostion(APoint);
  if Post>Count then
  begin
    Result:=Item[Post-Count];
    Result^.StationName:=AText;
    exit;
  end;
  SetLength(FStationEdit,Count+1);
  Inc(FCount);
  for i:=Count-1 downto Post+1 do
  begin
    FStationEdit[i].StationName:=FStationEdit[i-1].StationName;
    FStationEdit[i].TextFont:=FStationEdit[i-1].TextFont ;
    FStationEdit[i].Symbol:=FStationEdit[i-1].Symbol;
    FStationEdit[i].MinScale:=FStationEdit[i-1].MinScale;
    FStationEdit[i].MaxScale:=FStationEdit[i-1].MaxScale;
    FStationEdit[i].roadMemo:=FStationEdit[i-1].roadMemo;
    FStationEdit[i].image1name:=FStationEdit[i-1].image1name;
    FStationEdit[i].image2name:=FStationEdit[i-1].image2name;
    FStationEdit[i].imagesize:=FStationEdit[i-1].imagesize;
    FStationEdit[i].image1way:=FStationEdit[i-1].image1way;
    FStationEdit[i].image2way:=FStationEdit[i-1].image2way;
  end; 
  Result:=Item[post];
  //Result:=Item[FCount-1];
  Result^.StationName:=AText;
  Result^.Symbol.Position:=APoint;
  Result^.MaxScale:=-1;
end;

function TStationManager.Delete(APoint: TPoint): boolean;
var
  i,ii:integer;
begin
  Result:=false;
  for i:=0 to Count-1 do
  begin
    if Self.Item[i]^.Symbol.Position.X=APoint.X then
      if Self.Item[i]^.Symbol.Position.Y=APoint.Y then
      begin
        for ii:=i+1 to Count-1 do
        begin
          FStationEdit[ii-1]:=FStationEdit[ii];
        end;
        SetLength(FStationEdit,Count-1);
        FCount:=FCount-1;
        Result:=true;
        exit;
      end;
  end;
end;

function TStationManager.Delete(AIndex: integer): boolean;
var
  ii:integer;
begin
  Result:=false;
  if(AIndex>=0)and(AIndex<Count)then
  begin
    for ii:=AIndex+1 to Count-1 do
    begin
      FStationEdit[ii-1]:=FStationEdit[ii];
    end;
    SetLength(FStationEdit,Count-1);
    FCount:=FCount-1;
    Result:=true;
  end;
end;

function TStationManager.Find(Point: TPoint): integer;
var
  i,Begini:integer;
  Left,Right,Top,Button:integer;
  aa,bb:double;
  j:integer;
begin
    Result:=-1;
    Left:=Point.X-400;
    Right:=Point.X+400;
    Top:=Point.Y+400;
    Button:=Point.Y-400;
    Begini:=-1;
    j:=0;
    //=====应该提取 最近的距离===//
    bb:=0;
    for i:=0 to count-1 do
    begin
      aa:=GeometryCalc.World_P2P_Dist(Point,Item[i]^.Symbol.Position);
      if i=0 then
      begin
        bb:=aa;
        j:=i;
      end else
      begin
        if aa<=bb then
        begin
          bb:=aa;
          j:=i;
        end;
      end;
    end;

    for i:=0 to Count-1 do
    begin
      if Begini<0 then
      begin
        if Item[i]^.Symbol.Position.X>=Left then
        begin
          Begini:=i;
          //===判断点
          if(Item[i]^.Symbol.Position.Y>Button)and(Item[i]^.Symbol.Position.Y<Top) then
          begin
            if i=j then
            begin
              Result:=i;
              exit;
            end;
          end;
        end;
      end
      else
      begin
        //判断当前点的X有没有过RIGHT
        if Item[i]^.Symbol.Position.X>=Right then
          Break;
        if(Item[i]^.Symbol.Position.Y>Button)and(Item[i]^.Symbol.Position.Y<Top) then
        begin
          if i=j then
          begin
            Result:=i;
            exit;
          end;
        end;
      end;
    end;
end;

function TStationManager.GetCount: integer;
begin
  Result:=FCount;
end;

function TStationManager.GetPostion(APoint: TPoint): integer;
var
  i:integer;
  isFindx:boolean;
begin
  isFindx:=false;
  Result:=Count;
  for i:=0 to Result-1 do
  begin
    if (APoint.X=Item[i]^.Symbol.Position.X)and(APoint.Y=Item[i]^.Symbol.Position.Y)then//判断是否相等
    begin
      Result:=Count+i;  //反回一个大质说明在此点已有标签
      exit;
    end;
    if not isFindx then //查找X
    begin
      if(APoint.X <=Item[i]^.Symbol.Position.X) then
      begin
        isFindx:=true;
        Result:=i;
        if(APoint.Y <Item[i]^.Symbol.Position.Y)then   exit;   //判断Y
      end;
    end
    else//else not isFindx
    begin
      if Item[Result]^.Symbol.Position.X=Item[i]^.Symbol.Position.X then   //查找Y
      begin
        if(APoint.Y <Item[i]^.Symbol.Position.Y)then
        begin
          Result:=i;
          exit;
        end
      end//end not isFindx;
      else
        exit;
    end;
  end;  //end for i
end;

function TStationManager.GetStationEdit(index: integer): PStationEdit;
begin
  Result:=@(FStationEdit[Index]);
end;

function TStationManager.LoadFromFile(AFileName: string): boolean;
var
  inifile:TInifile;
  i:integer;
  s,StationName:string;
  point:TPoint;
  pp:PStationEdit;
begin
  Result:=false;
  if not FileExists(AFileName) then  exit;
  inifile:=Tinifile.Create(AFileName);
  try
    FCount:=0;
    for i:=0 to inifile.ReadInteger('Station','Count',0)-1 do
    begin
      s:=IntToStr(i);
      StationName:=inifile.ReadString(s,'StationName','');
      if StationName='' then Continue;
      point.X:=inifile.ReadInteger(s,'X',0);
      point.Y:=Inifile.ReadInteger(s,'Y',0);
      pp:=Self.Add(StationName,point);

      pp^.Symbol.Style:=_Custom;

      pp^.Symbol.CustomSymbol.Size:=Inifile.ReadInteger(s,'SymbolSize',0);
      pp^.Symbol.CustomSymbol.Color:=Inifile.ReadInteger(s,'SymbolColor',0);
      pp^.Symbol.CustomSymbol.Shape:=Inifile.ReadInteger(s,'SymbolShape',0);

      pp^.TextFont.FontName:=inifile.ReadString(s,'FontName','');
      pp^.TextFont.Size:=inifile.ReadInteger(s,'FontSize',0);
      pp^.TextFont.ForeColor:=inifile.ReadInteger(s,'FontColor',0);
      pp^.TextFont.Transparent:=1;
      pp^.TextFont.FontStyle:=inifile.ReadInteger(s,'FontStyle',0);
      pp^.MinScale:=inifile.ReadInteger(s,'MinScale',0);
      pp^.MaxScale:=inifile.ReadInteger(s,'MaxScale',-1);
      pp^.image1way:= inifile.ReadString(s,'image1way','');
      pp^.image2way:= inifile.ReadString(s,'image2way','');
      pp^.image1name:=inifile.ReadString(s,'image1name','');
      pp^.image2name:=inifile.ReadString(s,'image2name','');
      pp^.roadMemo:= inifile.ReadString(s,'roadMemo','');
      pp^.imagesize:=inifile.ReadString(s,'imagesize','');

    end;
  finally
    inifile.Free;
  end;
  Result:=true;
end;

  function TStationManager.SaveToFile(AFileName: string): boolean;
 procedure WriteText(AIndex:integer;Station:PStationEdit;inifile:TInifile);
  var
    s:string;
  begin
    s:=IntToStr(AIndex);
    inifile.WriteString(s,'StationName',Station^.StationName);
    inifile.WriteInteger(s,'X',Station^.Symbol.Position.X);
    Inifile.WriteInteger(s,'Y',Station^.Symbol.Position.Y);
    Inifile.WriteInteger(s,'SymbolSize',Station^.Symbol.CustomSymbol.Size);
    Inifile.WriteInteger(s,'SymbolColor',Station^.Symbol.CustomSymbol.Color);
    Inifile.WriteInteger(s,'SymbolShape',Station^.Symbol.CustomSymbol.Shape);
    inifile.WriteString(s,'FontName',Station^.TextFont.FontName);
    inifile.WriteInteger(s,'FontSize',Station^.TextFont.Size);
    inifile.WriteInteger(s,'FontColor',Station^.TextFont.ForeColor);
    inifile.WriteInteger(s,'FontStyle',Station^.TextFont.FontStyle);
    inifile.WriteInteger(s,'MaxScale',Station^.MaxScale);
    inifile.WriteInteger(s,'MinScale',Station^.MinScale);
    inifile.WriteString(s,'roadMemo',Station^.roadMemo);
    inifile.WriteString(s,'image1name',Station^.image1name);
    inifile.WriteString(s,'image2name',Station^.image2name);
    inifile.WriteString(s,'image1way',Station^.image1way);
    inifile.WriteString(s,'image2way',Station^.image2way);
    IF Station^.imagesize='' THEN
    begin
      Station^.imagesize:='10';
    end;
    inifile.WriteString(s,'imagesize',Station^.imagesize);
  end;
var
  i:integer;
  inifile:TInifile;
  nameFile:TStringList;
begin
  if FileExists(AFileName) then
  begin
    DeleteFile(AFileName);
  end;
  inifile:=TInifile.Create(AFileName);
  nameFile:=TStringList.Create;
  try
    Inifile.WriteInteger('Station','Count',Count);
    for i:=0 to Count-1 do
    begin
      WriteText(i,@FStationEdit[i],inifile);
      nameFile.Add(FStationEdit[i].StationName);
    end;
    inifile.UpdateFile;
    nameFile.SaveToFile(LeftStr(AFileName,length(AFileName)-4)+'.name');
  finally
    inifile.Free;
    nameFile.Free;
  end;
  Result:=true;
end;

end.
