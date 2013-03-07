unit TextUnit;

interface
   uses MetaDefine,Inifiles,Types,SysUtils,Classes,StrUtils;
type

   TUserDefinedText=packed record
     Text:string[100];
     TextFont:TTrueFontStruct;
     Symbol:TSymbolStruct;
     MinScale:integer;
     MaxScale:integer;
   end;
   PUserDefinedText=^TUserDefinedText;
   
   TUserDefinedTextManager=class
     private
       FUserDefinedText:array of TUserDefinedText;
       FCount:integer;
       function GetUserDefinedText(index:integer): PUserDefinedText;
       function GetCount: integer;
       function GetPostion(APoint:TPoint):integer;
     public
       function Add(AText:string;APoint:TPoint):PUserDefinedText;
       function Delete(APoint:TPoint):boolean;overload;
       function Delete(AIndex:integer):boolean;overload;
       function LoadFromFile(AFileName:string):boolean;
       function Find(Point:TPoint):integer;
       function SaveToFile(AFileName:string):boolean;
   
       property Item[index:integer]:PUserDefinedText read GetUserDefinedText;
       property Count:integer read GetCount;
  end;


implementation

{ TUserDefinedTextManager }

function TUserDefinedTextManager.GetPostion(APoint:TPoint):integer;
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
function TUserDefinedTextManager.Add(AText: string;
  APoint: TPoint): PUserDefinedText;
var
  i,post:integer;
begin
  post:=GetPostion(APoint);
  if Post>Count then
  begin
    Result:=Item[Post-Count];
    Result^.Text:=AText;
    exit;
  end;
  SetLength(FUserDefinedText,Count+1);
  Inc(FCount);
  for i:=Count-1 downto Post+1 do
  begin
    FUserDefinedText[i].Text:=FUserDefinedText[i-1].Text;
    FUserDefinedText[i].TextFont:=FUserDefinedText[i-1].TextFont ;
    FUserDefinedText[i].Symbol:=FUserDefinedText[i-1].Symbol;
    FUserDefinedText[i].MinScale:=FUserDefinedText[i-1].MinScale;
    FUserDefinedText[i].MaxScale:=FUserDefinedText[i-1].MaxScale;
  end; 
  Result:=Item[post];
  //Result:=Item[FCount-1];
  Result^.Text:=AText;
  Result^.Symbol.Position:=APoint;
  Result^.MaxScale:=-1;
end;

function TUserDefinedTextManager.Delete(APoint: TPoint): boolean;
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
          FUserDefinedText[ii-1]:=FUserDefinedText[ii];
        end;
        SetLength(FUserDefinedText,Count-1);
        FCount:=FCount-1;
        Result:=true;
        exit;
      end;
  end;
end;

function TUserDefinedTextManager.Delete(AIndex: integer): boolean;
var
  ii:integer;
begin
  Result:=false;
  if(AIndex>=0)and(AIndex<Count)then
  begin
    for ii:=AIndex+1 to Count-1 do
    begin
      FUserDefinedText[ii-1]:=FUserDefinedText[ii];
    end;
    SetLength(FUserDefinedText,Count-1);
    FCount:=FCount-1;
    Result:=true;
  end;
end;

function TUserDefinedTextManager.Find(Point: TPoint): integer;
var
  i,Begini:integer;
  Left,Right,Top,Button:integer;
begin
    Result:=-1;
    Left:=Point.X-200;
    Right:=Point.X+200;
    Top:=Point.Y+200;
    Button:=Point.Y-200;
    Begini:=-1;
    for i:=0 to Count-1 do
    begin
      if Begini<0 then
      begin
        if Item[i]^.Symbol.Position.X>=Left then
        begin
          Begini:=i;
          //判断点
          if(Item[i]^.Symbol.Position.Y>Button)and(Item[i]^.Symbol.Position.Y<Top) then
          begin
            Result:=i;
            exit;
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
          Result:=i;
          exit;
        end;
      end;
    end;
end;

function TUserDefinedTextManager.GetCount: integer;
begin
  Result:=FCount;//Length(FUserDefinedText);
end;

function TUserDefinedTextManager.GetUserDefinedText(index:integer): PUserDefinedText;
begin
  Result:=@(FUserDefinedText[Index]);
end;

function TUserDefinedTextManager.LoadFromFile(AFileName: string): boolean;
var
  inifile:TInifile;
  i:integer;
  s,text:string;
  point:TPoint;
  pp:PUserDefinedText;
begin
  Result:=false;
  if not FileExists(AFileName) then  exit;
  inifile:=Tinifile.Create(AFileName);
  try
    FCount:=0;
    for i:=0 to inifile.ReadInteger('Sys','Count',0)-1 do
    begin
      s:=IntToStr(i);
      text:=inifile.ReadString(s,'Text','');
      if text='' then Continue;
      point.X:=inifile.ReadInteger(s,'X',0);
      point.Y:=Inifile.ReadInteger(s,'Y',0);
      pp:=Self.Add(Text,point);
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
    end;
  finally
    inifile.Free;
  end;
  Result:=true;
end;


function TUserDefinedTextManager.SaveToFile(AFileName: string): boolean;
  procedure WriteText(AIndex:integer;Text:PUserDefinedText;inifile:TInifile);
  var
    s:string;
  begin
    s:=IntToStr(AIndex);
    inifile.WriteString(s,'Text',Text^.Text);
    inifile.WriteInteger(s,'X',text^.Symbol.Position.X);
    Inifile.WriteInteger(s,'Y',text^.Symbol.Position.Y);
    Inifile.WriteInteger(s,'SymbolSize',text^.Symbol.CustomSymbol.Size);
    Inifile.WriteInteger(s,'SymbolColor',text^.Symbol.CustomSymbol.Color);
    Inifile.WriteInteger(s,'SymbolShape',text^.Symbol.CustomSymbol.Shape);
    inifile.WriteString(s,'FontName',text^.TextFont.FontName);  
    inifile.WriteInteger(s,'FontSize',text^.TextFont.Size);
    inifile.WriteInteger(s,'FontColor',text^.TextFont.ForeColor);
    inifile.WriteInteger(s,'FontStyle',text^.TextFont.FontStyle);
    inifile.WriteInteger(s,'MaxScale',text^.MaxScale);
    inifile.WriteInteger(s,'MinScale',text^.MinScale);
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
    Inifile.WriteInteger('Sys','Count',Count);
    for i:=0 to Count-1 do
    begin
      WriteText(i,@FUserDefinedText[i],inifile);
      nameFile.Add(FUserDefinedText[i].Text);
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
