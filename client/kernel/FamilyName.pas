unit FamilyName;

interface
uses
   classes, Windows;
type
   TFamilyName = Class(TObject)
   private
      FFamilyName:TStringList;
   public
      constructor Create;
      destructor Destroy;override;
      procedure LoadFamilyName(const FileName: string);
      Procedure Find(IMCodeStr:string;Strings:TStrings);
   end;


implementation
  uses IMCode,SysUtils,StrUtils;

{ TFamilyName }

constructor TFamilyName.Create;
begin
  FFamilyName:=TStringList.Create;
  FFamilyName.Sorted:=true;
end;

destructor TFamilyName.Destroy;
begin
  FFamilyName.Free;
  inherited;
end;

procedure TFamilyName.Find(IMCodeStr: string; Strings: TStrings);
var
  i,j,p:integer;
begin
  FFamilyName.Find(IMCodeStr,i);
  Strings.BeginUpdate;
  Strings.Clear;
  for j:=i to i+25 do
  begin
    if j>=FFamilyName.Count then break;
    p:=pos('_',FFamilyName.Strings[j]);
    Strings.Append(Copy(FFamilyName.Strings[j],p+1,50));
  end;
  Strings.EndUpdate;
end;

procedure TFamilyName.LoadFamilyName(const FileName: string);
var
  i:integer;
  FileList:TStringList;
  s:string;
begin
  FileList:=TStringList.Create;
  try
    if FileExists(FileName) then
      FileList.LoadFromFile(FileName);
    for i:=0 to FileList.Count-1 do
    begin
      s:=FileList.Strings[i];
      Trim(s);
      if length(s)<2 then continue;
      s:=GetSpellCode(s,1,255)+'_'+s;
      FFamilyName.Add(s);
    end;
  finally
    FileList.Free;
  end;
end;

end.
