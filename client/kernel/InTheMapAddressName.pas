unit InTheMapAddressName;

interface
uses
   classes, Windows;
type
   MapAddressName = class(TObject)
   private
      FAddressName:TStringList;  
   public
      constructor Create;
      destructor Destroy;override;
      procedure LoadAddressName(const Path, FileType: string);
      Procedure Find(IMCodeStr:string;Strings:TStrings);
      procedure Clear;
   end;
      procedure GetDIRAllFile(const Path: string;FileType:string;FileList:TStringList);   //获取一个文件夹，包括子目录的所有文件的文件名

implementation
  uses IMCode,SysUtils,StrUtils;

{ MapAddressName }

constructor MapAddressName.Create;
begin
   FAddressName:=TStringList.Create;
   FAddressName.Sorted:=true;
end;

destructor MapAddressName.Destroy;
begin
   FAddressName.Free;
   inherited;
end;

procedure MapAddressName.LoadAddressName(const Path, FileType: string);
var
  i,j,len:integer;
  FileList:TStringList;
  MapFile:TStringList;
  S:string;
begin
  MapFile:=TStringList.Create;
  FileList:=TStringList.Create;
  GetDirAllFile(Path,FileType,FileList);
  //FAddressName.Clear;
  try

    for i:=0 to FileList.Count-1 do
    begin
        if FileExists(FileList.Strings[i]) then
        MapFile.LoadFromFile(FileList.Strings[i])
        else Continue;
        for j:=0 to MapFile.Count-1 do
        begin
           S:=MapFile.Strings[j];
           Len:=Length(s);
           if Len<=1 then continue;
           //S:=Copy(S,2,Len-2);
           S:=GetSpellCode(S,4,255)+'_'+S;
           FAddressName.Add(S);
        end;
    end;
  finally
    MapFile.Free;
    FileList.Free;
  end;
end;

//获取一个文件夹，包括子目录的所有文件的文件名
procedure GetDIRAllFile(const Path: string;FileType:string;FileList:TStringList);
var
  f: TSearchRec;
  Ret: Integer;
  P,i:integer;
begin

  Ret:=FindFirst(Path+'*.*', faAnyFile, f);
  while Ret=0 do
  begin
    if f.Attr=faDirectory then
    begin
      if (f.Name<>'.') and (f.Name<>'..') then
        GetDIRAllFile(Path+f.Name+'\',FileType,FileList)
    end
    else
    begin
      p:=pos('.',f.Name);
      i:=Length(f.Name);
      if  copy(f.Name,p+1,i-p)=FileType then
        FileList.Add(Path+f.Name);
    end;
    Ret:=FindNext(f)
  end;
  FindClose(f);
end;


procedure MapAddressName.Find(IMCodeStr: string; Strings: TStrings);
var
  i,j,p:integer;
  tempStrings:TStringList;
begin



  Strings.Clear;
  Strings.BeginUpdate;
  tempStrings:=TStringList.Create;
  try
  FAddressName.Find(IMCodeStr,I);
  for j:=i to i+3 do
  begin
    if j>=FAddressname.Count then break;
    p:=pos('_',FAddressName.Strings[j]);
    tempStrings.Append(Copy(FAddressname.Strings[j],p+1,50));
  end;


  if IMCodeStr<>'' then
  begin
      j:=0;
      for i:=0 to FAddressName.Count-1 do
      begin
         if j>15 then break;
         if pos(IMCodeStr,FAddressName.Strings[i])>0 then
         begin
             p:=pos('_',FAddressName.Strings[i]);
             tempStrings.Append(Copy(FAddressname.Strings[i],p+1,50));
             inc(j);
         end;
      end;
  end;
  Strings.AddStrings(tempStrings);



  FAddressName.Find(IMCodeStr,I);
  for j:=i+3 to i+10 do
  begin
    if j>=FAddressname.Count then break;
    p:=pos('_',FAddressName.Strings[j]);
    Strings.Append(Copy(FAddressname.Strings[j],p+1,50));
  end;

  


  finally

      Strings.EndUpdate;
      tempStrings.Free;
  end;
end;



procedure MapAddressName.Clear;
begin
  FAddressName.Clear;
end;

end.
