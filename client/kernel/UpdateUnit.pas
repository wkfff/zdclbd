unit UpdateUnit;

interface
uses IdHTTP,Classes,inifiles,SysUtils;

  function ExistUpdateFile(var CoerceUpdate:boolean): Boolean;
  function ExistUpdateFile_ls(var CoerceUpdate:boolean): Boolean;
  function GetFileDate(const filename2: string; var d: TDateTime): Boolean;

  function ExistNewFile(url: string; sys_id: string): Boolean;

implementation
  uses uGloabVar;

function ExistNewFile(url: string; sys_id: string): Boolean;
var i: integer;
  filestr: TStringList;
  files: TStringList;
  HTTPFiles: TIdHttp;
  AppIni: TIniFile;
  DownloadCount: integer;
  fd: TDatetime;
  tmpStr:string;
begin
  result := false;
  filestr := TStringList.Create;
  HTTPFiles := TidHttp.Create(nil);
  SetCurrentDir(ExePath);
  AppIni := nil;
  files := nil;
  if not DirectoryExists(ExePath+'Update') then
  begin
    if not CreateDir(ExePath+'Update') then
    begin
      PopMsg('�Զ�����ʧ��','Update�ļ����޷�����');
      Exit;
    end;
  end;
  try
    try
      if copy(url, length(url), 1) <> '/' then url := url + '/';
      try
        filestr.Add(HTTPFiles.Get(url + sys_id + '.txt'));
      except
        PopMsg('�Զ�����ʧ��','���ط�������ַ����'+#13#10+url);
        Exit;
      end;
      filestr.SaveToFile(ExePath + 'update\update.ini');
      filestr.Free;
    except
      exit;
    end;
  //=========================================================================
  //�ж���û���ļ�Ҫ����
  //=========================================================================
    try
      files := TStringList.Create;
      AppIni := TIniFile.Create(ExePath + '\update\update.ini');
      AppIni.ReadSections(files);
      DownloadCount := 0;
      SetCurrentDir(ExePath);
      for i := 0 to files.Count - 1 do
      begin
        if getfiledate(ExePath + files[i], fd) then
        begin
          tmpStr := Appini.ReadString(files[i],'datetime','');
          if (tmpStr <> '') and (fd < strtodatetime(tmpStr)) then
          begin
            SystemLog.AddLog(files[i] + '�и���,����ʱ��' + FormatDateTime('yyyy-MM-dd hh:nn:ss', fd) + ',������ʱ��' + tmpStr);
            inc(DownloadCount);
          end
        end
        else
        begin
          SystemLog.AddLog(files[i] + '�����������');
          inc(DownloadCount);
        end;
        if DownloadCount > 0 then
        begin
          result := true;
          break;
        end;
      end;
    except
      Exit;
    end;
  finally
    if AppIni <> nil then
      AppIni.Free;
    if files <> nil then
      files.Free;
    HTTPFiles.Free;
  end;
end;  

function ExistUpdateFile(var CoerceUpdate:boolean): Boolean;
var
  filestr: TStringList;
  HTTPFiles:TIdHttp;
  url:string;
  servers:TStringList;
  appini:TiniFile;
  files:TStringList;
  DownloadCount:integer;
  i:integer;
  fd:TDatetime;
begin
  result := false;
  CoerceUpdate:=false;
  SetCurrentDir(ExePath);
  if not DirectoryExists(ExePath+'Update') then
  begin
    if not CreateDir(ExePath+'Update') then
      raise Exception.Create('Cannot create '+ExePath+'Update'+'. ');
  end
  else
    DeleteFile(ExePath + 'update\update.dat');
  //=========================================================================
  // ��Config.ini���ȡURL
  //=========================================================================
  if copy(ExePath, length(ExePath), 1) <> '\' then ExePath := ExePath + '\';
  AppIni := TIniFile.Create(ExePath + 'Config.ini');
  servers := TStringList.Create;
  try
      AppIni.ReadSectionValues('update', servers);
      if servers.Count >0 then
         url := copy(servers[0], pos('=', servers[0]) + 1, length(servers[0]));
  finally
      AppIni.Free;
      servers.Free;
  end;
  //=========================================================================
  if url='' then exit;


  //=========================================================================
  //����update.htm�ļ�
  //=========================================================================
  filestr := TStringList.Create;
  HTTPFiles:=TidHttp.Create(nil);
  //HTTPFiles.ReadTimeout:=30;
  try
      try
          if copy(url, length(url), 1) <> '/' then url := url + '/';
          filestr.Add(HTTPFiles.Get(url));// + 'update.htm'));//�����ļ�
          filestr.SaveToFile(ExePath + 'update\update.dat');
      except
          exit;
      end;
  finally
      filestr.Free;
      HTTPFiles.Free;
  end;
  //=========================================================================


  //=========================================================================
  //�ж���û���ļ�Ҫ����
  //=========================================================================
  files:= TStringList.Create;
  try
      AppIni := TIniFile.Create(ExePath + '\update\update.dat');
      AppIni.ReadSections(files);   //Reads the names of all sections in an INI file into a string list.
      CoerceUpdate:=AppIni.ReadBool('system','CoerceUpdate',false);
      DownloadCount:=0;
      SetCurrentDir(ExePath);
      for i := 0 to files.Count - 1 do
      begin
          if files.Strings[i]='system' then continue;
          if getfiledate(ExePath+files[i], fd) then
          begin
              if fd < strtodatetime(Appini.ReadString(files[i], 'datetime', '')) then
              begin
                  inc(DownloadCount);
                  //listview_files.Items[i].SubItems.Append('��Ҫ����');
              end
          end
          else
          begin
              inc(DownloadCount);
          end;
          if DownloadCount>0 then
          begin
              result := true;
              break;
          end;
      end;
  finally
      AppIni.Free;
  end;
  //==========================================================================
end;

function ExistUpdateFile_ls(var CoerceUpdate:boolean): Boolean;
var
  filestr: TStringList;
  HTTPFiles:TIdHttp;
  url:string;
  servers:TStringList;
  appini:TiniFile;
  files:TStringList;
  DownloadCount:integer;
  i:integer;
  fd:TDatetime;
  Sys_id: string;
begin
  result := false;
  CoerceUpdate:=false;
  SetCurrentDir(ExePath);
  if not DirectoryExists(ExePath+'Update') then
  begin
    if not CreateDir(ExePath+'Update') then
      raise Exception.Create('Cannot create '+ExePath+'Update'+'. ');
  end
  else
    DeleteFile(ExePath + 'update\update.dat');
  //=========================================================================
  // ��Config.ini���ȡURL
  //=========================================================================
  if copy(ExePath, length(ExePath), 1) <> '\' then ExePath := ExePath + '\';
  AppIni := TIniFile.Create(ExePath + 'Config.ini');
  Sys_id := appini.ReadString('update', 'SubSys', '');
  servers := TStringList.Create;
  try
      AppIni.ReadSectionValues('update', servers);
      if servers.Count >0 then
         url := copy(servers[0], pos('=', servers[0]) + 1, length(servers[0]));
  finally
      AppIni.Free;
      servers.Free;
  end;
  //=========================================================================
  url := GlobalParam.UpdateURL;
  if url='' then exit;


  //=========================================================================
  //����update.htm�ļ�
  //=========================================================================
  filestr := TStringList.Create;
  HTTPFiles:=TidHttp.Create(nil);
  //HTTPFiles.ReadTimeout:=30;
  try
      try
          if copy(url, length(url), 1) <> '/' then url := url + '/';
          filestr.Add(HTTPFiles.Get(url+ sys_id + '.txt'));// + 'update.htm'));//�����ļ�
          filestr.SaveToFile(ExePath + 'update\update.dat');
      except
          exit;
      end;
  finally
      filestr.Free;
      HTTPFiles.Free;
  end;
  //=========================================================================


  //=========================================================================
  //�ж���û���ļ�Ҫ����
  //=========================================================================
  files:= TStringList.Create;
  try
    AppIni := TIniFile.Create(ExePath + '\update\update.dat');
    AppIni.ReadSections(files);   //Reads the names of all sections in an INI file into a string list.
    CoerceUpdate:=AppIni.ReadBool('system','CoerceUpdate',false);
    DownloadCount:=0;
    SetCurrentDir(ExePath);
    for i := 0 to files.Count - 1 do
    begin
        if files.Strings[i]='system' then continue;
        if getfiledate(ExePath+files[i], fd) then
        begin
            if fd < strtodatetime(Appini.ReadString(files[i], 'datetime', '')) then
            begin
                inc(DownloadCount);
                //listview_files.Items[i].SubItems.Append('��Ҫ����');
            end
        end
        else
        begin
            inc(DownloadCount);
        end;
        if DownloadCount>0 then
        begin
            result := true;
            break;
        end;
    end;
  finally
    files.Free;
    AppIni.Free;
  end;
  //==========================================================================
end;

function GetFileDate(const filename2: string; var d: TDateTime): Boolean;
var
  DosFileTime: integer;
begin
  result := false;
  DosFileTime := FileAge(filename2);
  if DosFileTime <> -1 then //����-1��ʾ�ļ�������
  begin
    d := FileDateToDateTime(DosFileTime);
    result := true;
  end;
end;



end.
