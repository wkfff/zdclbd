unit staticproc;

interface
uses
  windows,
  sysutils,
  classes,
  MetaDefine,
  tyoexception;
type
  GisSystem=class
  public
    class procedure WriteResourceToFile(const AResHandle:Integer;const ResourceName,
      ResourceType: PChar; const FileName: AnsiString);
    class procedure GetWidthHeigthOfText(SP,EP:TWorldPoint;MaxCols,Rows:integer;
      var a,b:integer);
    class function FileLength(AFilename:string):integer;
    class function FileNameFromDir(const DirName:string;var FileList:TStrings):boolean;
    class function LoadCustomCur(const AResHandle:Integer;const ResourceName,ResourceType:PChar):THandle;
    class function GetTmpFileName:string;
    class procedure GetRowColOfTextOfMIF(var Text:string;var Rows,Cols:integer);
    class procedure GetRowColOfText(Text: string; var Rows,Cols: integer);
    class function GetLastModifiedTime(const FileName:string):Tdatetime;
    class procedure PtrAdd(var p: Pointer; n: Integer);
  end;

implementation
uses
  Controls,
  Math,
  MathCalc;

class function GisSystem.FileLength(AFilename:string):integer;
var
  fp:file of byte;
begin
  AssignFile(fp,AFilename);
  Reset(fp);
  Result := FileSize(fp);
  CloseFile(fp);
end;

class procedure GisSystem.GetWidthHeigthOfText(SP,EP:TWorldPoint;MaxCols,Rows:integer;var a,b:integer);
var
  deltaX,deltaY:integer;
begin
  deltaX:=abs(EP.x-SP.x);
  deltaY:=abs(EP.y-SP.y);

  if MaxCols=0 then MaxCols:=1;
  a:=deltaX div MaxCols;
  if Rows=0 then Rows:=1;
  b:=deltaY div Rows;
  { TODO : 文本的多行显示 }
end;

class function GisSystem.FileNameFromDir(const DirName: string;
  var FileList: TStrings): boolean;
var
  Ret:Integer;
  FileInfo:TSearchRec;
begin
  Result:=False;
  Ret:=Sysutils.FindFirst(DirName, faArchive, FileInfo);
  if Ret<> No_error  then
  begin
    Result:=False;
    Exit;
  end;
  try
    while Ret=NO_ERROR do
    begin
      Result:=True;
      FileList.Add(FileInfo.Name);
      Ret := Sysutils.FindNext(FileInfo);
    end;
  finally
    Sysutils.FindClose(FileInfo);
  end;
end;

class function GisSystem.LoadCustomCur(const AResHandle:Integer;const ResourceName,
  ResourceType: PChar): THandle;
var
  resstrm :TResourceStream;
  fname   :string;
begin
  fname := ExtractFilePath(paramstr(0))+'tmp.ani';
  resstrm := TResourceStream.Create(AResHandle,ResourceName,ResourceType); //！！！
  resstrm.SaveToFile(fname);
  try
    Result:=LoadCursorFromFile('tmp.ani');
  finally
    DeleteFile(fname);
    resstrm.Free;
  end;
end;


{ Writes a resources to DestDir. Existing files will not be overwritten. }
class procedure GisSystem.WriteResourceToFile(const AResHandle:Integer;const ResourceName, ResourceType: PChar; const FileName: AnsiString);
var
  HResInfo: HRSRC;
  FileHandle, HGlobal: THandle;
  BytesWritten: DWORD;
begin
  HResInfo := FindResource(AResHandle, ResourceName, ResourceType);
  if HResInfo = 0 then Exit;

  HGlobal := LoadResource(AResHandle, HResInfo);
  if HGlobal = 0 then Exit;

  FileHandle := CreateFile(PChar(FileName), GENERIC_WRITE, 0, nil, CREATE_New, FILE_ATTRIBUTE_NORMAL or FILE_FLAG_SEQUENTIAL_SCAN, 0);
  if FileHandle = INVALID_HANDLE_VALUE then Exit;
  try
    WriteFile(FileHandle, LockResource(HGlobal)^, SizeOfResource(AResHandle, HResInfo), BytesWritten, nil)
  finally
    CloseHandle(FileHandle);
  end;
end;

class function GisSystem.GetTmpFileName: string;
var
  tmpPath:PChar;
  tmpName:PChar;
begin
  GetMem(tmpPath,255);
  GetMem(tmpName,255);
  GetTempPath(255,tmpPath);
  GetTempFileName(tmpPath,'tyo',0,tmpName);
  Result:=string(tmpName);
  FreeMem(tmppath);
  FreeMem(tmpName);
end;

class procedure GisSystem.GetRowColOfText(Text: string; var Rows,
  Cols: integer);
var
 strList:TStringList;
 i:integer;
begin
  strList:=TStringList.Create;
  try
    strList.Text:=Text;
    Rows:=strList.Count;
    Cols:=1;
    for i:=0 to strList.Count-1 do
      Cols:=Max(Cols,Length(strList.strings[i]));
  finally
    strList.Free;
  end;
end;

class procedure GisSystem.GetRowColOfTextOfMIF(var Text: string; var Rows,
  Cols: integer);
var
 strList:TStringList;
 i:integer;
begin
  strList:=TStringList.Create;
  try
    Text:=StringReplace(Text,'\n',chr(13)+chr(10),[rfReplaceAll, rfIgnoreCase]);
    strList.Text:=Text;
    Rows:=strList.Count;
    Cols:=1;
    for i:=0 to strList.Count-1 do
      Cols:=Max(Cols,Length(strList.strings[i])-2); //for double qutation mark "子"    
  finally
    strList.Free;
  end;
end;

class function GisSystem.GetLastModifiedTime(
  const FileName: string): Tdatetime;
var
  FileInfo:WIN32_FILE_ATTRIBUTE_DATA;
  systime:SYSTEMTIME;
begin
  GetFileAttributesEx(PChar(FileName),GetFileExInfoStandard,@FileInfo);
  FileTimeToSystemTime(FileInfo.ftLastWriteTime,systime);
  Result:=SystemTimeToDatetime(systime);
end;

class procedure GisSystem.PtrAdd(var p: Pointer; n: Integer);
begin
  p:=Pointer(Integer(p)+n);
end;

end.
