{包含了内存文件操作类
  @created(2001 年 11 月 1 日)
  @lastmod(2001 年 11 月 1 日)
}

unit MemMapping;
interface

uses Windows, SysUtils, Classes;

type
  EMMFError = class(Exception);

  TMemMapFile = class
  private
    // File name of the mapped file.
    FFileName: String;
    // Size of the mapped view
    FSize: Longint;
    // Actual File Size
    FFileSize: Longint;
    // File access mode
    FFileMode: Integer;
    // File handle
    FFileHandle: Integer;
    // Handle to the file mapping object.
    FMapHandle: Integer;
    // Pointer to the file's data
    FData: PByte;
    // Determines whether or not to map view of immediately.
    FMapNow: Boolean;

    { Retrieves a handle to the disk file. }
    procedure AllocFileHandle;
    { Retrieves a file-mapping object handle }
    procedure AllocFileMapping;
    { Maps a view to the file }
    procedure AllocFileView;
    { Returns the size of the mapped view }
    function GetSize: Longint;
  public
    { Creates Memory Mapped view of FileName file.
      FileName: Full pathname of file.
      FileMode: Use fmXXX constants.
      Size: size of memory map.  Pass zero as the size to use the
            file's own size.
    }
    constructor Create(FileName: String; FileMode: integer;
                       Size: integer; MapNow: Boolean); virtual;
    destructor Destroy; override;
    { This method unmaps the view of the file from this process's address
      space. }
    procedure FreeMapping;
    property Data: PByte read FData;
    property Size: Longint read GetSize;
    property FileName: String read FFileName;
    property FileHandle: Integer read FFileHandle;
    property MapHandle: Integer read FMapHandle;
  end;

implementation

constructor TMemMapFile.Create(FileName: String; FileMode: integer;
                               Size: integer; MapNow: Boolean);
{ Creates Memory Mapped view of FileName file.
  FileName: Full pathname of file.
  FileMode: Use fmXXX constants.
  Size: size of memory map.  Pass zero as the size to use the
        file's own size.
}
begin

  { Initialize private fields }
  FMapNow := MapNow;
  FFileName := FileName;
  FFileMode := FileMode;

  try
    AllocFileHandle;  // Obtain a file handle of the disk file.
  { Assume file is < 2 gig  }

    FFileSize := GetFileSize(FFileHandle, Nil);
    FSize := Size;

    AllocFileMapping; // Get the file mapping object handle.
  except
    on EMMFError do
    begin
      CloseHandle(FFileHandle);  // close file handle on error
      FFileHandle := 0;          // set handle back to 0 for clean up
      raise;                     // re-raise exception
    end;
  end;
  if FMapNow then
    AllocFileView;  // Map the view of the file
end;

destructor TMemMapFile.Destroy;
begin

  if FFileHandle <> 0 then
    CloseHandle(FFileHandle); // Release file handle.

  { Release file mapping object handle }
  if FMapHandle <> 0 then
    CloseHandle(FMapHandle);

  FreeMapping; { Unmap the file mapping view . }
  inherited Destroy;
end;

procedure TMemMapFile.FreeMapping;
{ This method unmaps the view of the file from this process's address
  space. }
begin
  if FData <> Nil then
  begin
    UnmapViewOfFile(FData);
    FData := Nil;
  end;
end;

function TMemMapFile.GetSize: Longint;
begin
  if FSize <> 0 then
    Result := FSize
  else
    Result := FFileSize;
end;

procedure TMemMapFile.AllocFileHandle;
{ creates or opens disk file before creating memory mapped file }
begin
  if FFileMode = fmCreate then
    FFileHandle := FileCreate(FFileName)
  else
    FFileHandle := FileOpen(FFileName, FFileMode);

  if FFileHandle < 0 then
    raise EMMFError.Create('Failed to open or create file');
end;

procedure TMemMapFile.AllocFileMapping;
var
  ProtAttr: DWORD;
begin
  if FFileMode = fmOpenRead then  // obtain correct protection attribute
    ProtAttr := Page_ReadOnly
  else
    ProtAttr := Page_ReadWrite;
  { attempt to create file mapping of disk file.
    Raise exception on error. }
  FMapHandle := CreateFileMapping(FFileHandle, Nil, ProtAttr,
      0, FSize, Nil);
  if FMapHandle = 0 then
    raise EMMFError.Create('Failed to create file mapping');
end;

procedure TMemMapFile.AllocFileView;
var
  Access: Longint;
begin
  if FFileMode = fmOpenRead then // obtain correct file mode
    Access := File_Map_Read
  else
    Access := File_Map_All_Access;
  FData := MapViewOfFile(FMapHandle, Access, 0, 0, FSize);
  if FData = Nil then
    raise EMMFError.Create('Failed to map view of file');
end;

end.
