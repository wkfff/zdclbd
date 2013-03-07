unit TextUnit;

interface
   uses Windows,MetaDefine,Inifiles,Types,SysUtils,Classes,StrUtils,
   uFrmRefreshProgress, Forms, IntegerListUnit;
type

   TUserDefinedText=packed record
     Text:string[100];
     TextFont:TTrueFontStruct;
     Symbol:TSymbolStruct;
     MinScale:integer;
     MaxScale:integer;
     ID: Integer;
     isSave: Boolean;
   end;
   PUserDefinedText=^TUserDefinedText;
   
   TUserDefinedTextManager=class
     private
       FUserDefinedText:array of TUserDefinedText;
       //FUserDefinedTextList: TIntegerList; 
       FCount:integer;
       FMaxID: Integer;
       function GetUserDefinedText(index:integer): PUserDefinedText;
       function GetCount: integer;
       function GetPostion(APoint:TPoint):integer;
     public
       function Add(AText:string;APoint:TPoint):PUserDefinedText; overload;
       function Add(AText: string; APoint: TPoint; ID: Integer): PUserDefinedText; overload;
       function Delete(APoint:TPoint):boolean;overload;
       function Delete(AIndex:integer):boolean;overload;
       function Delete(AIndex: Integer; AFileName: string;IDStr: string): Boolean;overload;
       function LoadFromFile(AFileName:string):boolean;
       function Find(Point:TPoint):integer;    overload;
       function Find(IDStr: Integer): Integer; overload;
       function SaveToFile(AFileName:string):boolean; overload;
       function SaveToFile(AFileName: string; pUserDefined: PUserDefinedText): Boolean; overload;
       function ModifyToFile(AFileName: string; pUserDefined: PUserDefinedText): Boolean;

       property Item[index:integer]:PUserDefinedText read GetUserDefinedText;
       property Count:integer read GetCount;
       property MaxID: Integer read FMaxID;
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
function TUserDefinedTextManager.Add(AText: string; APoint: TPoint): PUserDefinedText;
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
    FUserDefinedText[i].ID := FUserDefinedText[i-1].ID;
    FUserDefinedText[i].isSave := FUserDefinedText[i-1].isSave;
  end;
  Result:=Item[post];
  //Result:=Item[FCount-1];
  Result^.isSave := False;
  Result^.ID := FMaxID; //Count-1;
  Result^.Text:=AText;
  Result^.Symbol.Position:=APoint;
  Result^.MaxScale:=-1;
  Inc(FMaxID);

end;

function TUserDefinedTextManager.Add(AText: string; APoint: TPoint; ID: Integer): PUserDefinedText;
var
  i,post:integer;
begin
  {post:=GetPostion(APoint);
  if Post>Count then
  begin
    Result:=Item[Post-Count];
    Result^.Text:=AText;
    exit;
  end;   }
  SetLength(FUserDefinedText,Count+1);


  {for i:=Count-1 downto Post+1 do
  begin
    FUserDefinedText[i].Text:=FUserDefinedText[i-1].Text;
    FUserDefinedText[i].TextFont:=FUserDefinedText[i-1].TextFont ;
    FUserDefinedText[i].Symbol:=FUserDefinedText[i-1].Symbol;
    FUserDefinedText[i].MinScale:=FUserDefinedText[i-1].MinScale;
    FUserDefinedText[i].MaxScale:=FUserDefinedText[i-1].MaxScale;
  end; }
  Result:=Item[Count];
  Result^.isSave := False;
  Result^.ID := ID; 
  Result^.Text:=AText;
  Result^.Symbol.Position:=APoint;
  Result^.MaxScale:=-1;
  Inc(FCount);
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

function TUserDefinedTextManager.Delete(AIndex: Integer; AFileName: string;IDStr: string): Boolean;
var
  inifile:TInifile;
begin
  Result := False;
  try
    try
      inifile:=TInifile.Create(AFileName);
      Inifile.WriteInteger('Sys','Count',Count-1);
      inifile.EraseSection(IDStr);
      Delete(AIndex);
      if FCount = 0 then
      begin
        FMaxID := 0;
      end
      else
      begin
        if (FMaxID-1) = StrToInt(IDStr) then
        begin
          FMaxID := FMaxID - 1;
        end;
      end;
      Inifile.WriteInteger('Sys','MaxID',FMaxID);
    except
      Result := False;
    end;
  finally
    inifile.Free;
  end;
  Result := True;
end;

function TUserDefinedTextManager.Find(Point: TPoint): integer;
var
  i,Begini:integer;
  Left,Right,Top,Button:integer;
begin
  Result := -1;
  for i := 0 to Count - 1 do
  begin
    if (Item[i]^.Symbol.Position.Y=Point.Y) and (Item[i]^.Symbol.Position.X=Point.X) then
    begin
      Result := i;
      Exit
    end;
  end;

  {Result:=-1;
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
  end;     }
end;

function TUserDefinedTextManager.Find(IDStr: Integer): Integer;
var
  i: Integer;
begin
  Result := -1;
  for i := 0 to Count - 1 do
  begin
    if Item[i]^.ID = IDStr then
    begin
      Result := i;
      Exit
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
    FMaxID := inifile.ReadInteger('Sys','MaxID',0);
    FCount:=0;
    for i:=0 to MaxID-1 do //inifile.ReadInteger('Sys','Count',0)-1 do
    begin
      s:=IntToStr(i);
      if inifile.SectionExists(s) then
      begin
        text:=inifile.ReadString(s,'Text','');
        if text='' then Continue;
        point.X:=inifile.ReadInteger(s,'X',0);
        point.Y:=Inifile.ReadInteger(s,'Y',0);
        pp:=Self.Add(Text, point, i);
        pp^.isSave := False;
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
        pp^.ID := inifile.ReadInteger(s,'IDStr', i);
      end;
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
  dlg: TFrmRefreshProgress;
  AFileNameBak: string;
begin
  Result := False;
  try
    try
      AFileNameBak := AFileName + '.definebak';

      inifile:=TInifile.Create(AFileNameBak);     // 先保存为备份文件，等保存成功后再覆盖原先的文件，并备份原先的文件
      nameFile:=TStringList.Create;

      dlg := TFrmRefreshProgress.Create(nil);
      dlg.Label1.Caption := '正在保存自定义标签...';
      dlg.Show;
      dlg.Gauge1.MaxValue := Count;
      Application.ProcessMessages;

      Inifile.WriteInteger('Sys','Count',Count);
      for i:=0 to Count-1 do
      begin
        WriteText(i,@FUserDefinedText[i],inifile);
        nameFile.Add(FUserDefinedText[i].Text);
        dlg.Gauge1.AddProgress(1);
        Application.ProcessMessages;
      end;
      inifile.UpdateFile;
      nameFile.SaveToFile(LeftStr(AFileName,length(AFileName)-4)+'.name');

      if FileExists(AFileName) then
      begin
        if CopyFile(PChar(AFileName),Pchar(AFileName+'.Tybak'),False) then   // 备份原先的文件
        begin
          DeleteFile(AFileName);                                             // 删除原先的文件
          if FileExists(AFileNameBak) then
          begin
            if CopyFile(PChar(AFileNameBak), PChar(AFileName), False) then   // 将这次保存的文件还原为UserDefinedText.ini文件
            begin
              DeleteFile(AFileNameBak);                                      // 删除这次保存的备份文件
              Result := True;
            end;
          end
          else
          begin
            CopyFile(Pchar(AFileName+'.Tybak'),PChar(AFileName),False);
            Result := False;
          end;
        end;
      end
      else
      begin
        if CopyFile(PChar(AFileNameBak), PChar(AFileName), False) then       // 将这次保存的文件还原为UserDefinedText.ini文件
        begin
          DeleteFile(AFileNameBak);                                          // 删除这次保存的备份文件
          Result:=true;
        end
        else
        begin
          Result := False;
        end;
      end;
    except
      Result := False;
    end;
  finally
    inifile.Free;
    nameFile.Free;
    dlg.Free;
  end;
end;

function TUserDefinedTextManager.SaveToFile(AFileName: string; pUserDefined: PUserDefinedText): Boolean;
  procedure WriteText(Text:PUserDefinedText;inifile:TInifile);
  var
    s:string;
  begin
    s:= IntToStr(Text^.ID);
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
    inifile.WriteString(s,'IDStr', s);
  end;
var
  i:integer;
  inifile:TInifile;

  MAXIDStr: string;
  userDefinedText: PUserDefinedText;
begin
  Result := False;
  inifile := nil;
  try
    try
      if pUserDefined <> nil then
      begin
        inifile:=TInifile.Create(AFileName);
        Inifile.WriteInteger('Sys','Count',Count);
        inifile.WriteInteger('Sys', 'MaxID', MaxID);

        WriteText(pUserDefined, inifile);
      end;
    except
      Result := False;
    end;
  finally
    if inifile <> nil then
      inifile.Free;
  end;
  Result := True;
end;

function TUserDefinedTextManager.ModifyToFile(AFileName: string; pUserDefined: PUserDefinedText): Boolean;
  procedure WriteText(Text:PUserDefinedText;inifile:TInifile);
  var
    s:string;
  begin
    s:= IntToStr(Text^.ID);
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
    inifile.WriteString(s,'IDStr', s);
  end;
var
  i:integer;
  inifile:TInifile;

  MAXIDStr: string;
  userDefinedText: PUserDefinedText;
begin
  Result := False;
  inifile := nil;
  try
    try
      if pUserDefined <> nil then
      begin
        inifile:=TInifile.Create(AFileName);

        WriteText(pUserDefined, inifile);
      end;
    except
      Result := False;
    end;
  finally
    if inifile <> nil then
      inifile.Free;
  end;
  Result := True;
end;

end.
