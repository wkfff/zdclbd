unit ufrmlogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons,db,adodb,dbclient,
  ShlObj, ActiveX, uGloabVar, ShellAPI, IniFiles, jpeg, ComCtrls;

type
  Tfrmlogin = class(TForm)
    Panel2: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    Image12: TImage;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Image8MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation
{$R *.dfm}
uses  SystemConfigFrmUnit, UpdateUnit;
procedure Tfrmlogin.BitBtn1Click(Sender: TObject);
begin
  if edit1.GetTextLen =0 then
  begin
    messagebox(handle,'请您输入用户名！','提示',mb_ok + mb_iconinformation);
    edit1.SetFocus ;
    exit;
  end;
  modalresult:= mrOk;
end;

procedure Tfrmlogin.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key= #13 then edit2.SetFocus ;
end;

procedure Tfrmlogin.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if key= #13 then SpeedButton1Click(sender);
end;

procedure Tfrmlogin.BitBtn3Click(Sender: TObject);
var
 frm: TSystemConfigFrm ;
begin
  frm:=TSystemConfigFrm.Create(nil);
  try
    frm.ShowModal;
    if frm.ModalResult = mrOk then
    begin
      try
        //载入参数文件
        //GlobalParam.LoadFromFile(Application.ExeName + '.config');
      except on E: Exception do
        begin
          ShowMessage(E.Message);
        end;
      end;
    end;
  finally
    frm.Free;
  end;
end;
procedure Tfrmlogin.FormCreate(Sender: TObject);
begin
    {$IFNDEF ForTestUser}
   // BitBtn3.Enabled:=false;
    {$endif}
  SetWindowLong(Edit1.Handle, GWL_EXSTYLE, GetWindowLong(Edit1.Handle, GWL_EXSTYLE) or WS_EX_TRANSPARENT);
  SetWindowLong(Edit2.Handle, GWL_EXSTYLE, GetWindowLong(Edit2.Handle, GWL_EXSTYLE) or WS_EX_TRANSPARENT);

end;

procedure Tfrmlogin.BitBtn4Click(Sender: TObject);
var
  CoerceUpdate: Boolean;
  UpdateExe: string;
  IniFile: TIniFile;
  FilePath: string;
  UpdateFilePath: string;
begin
  IniFile := TIniFile.Create(ExePath + 'Config.ini');
  try
    UpdateExe := IniFile.ReadString('update', 'UpdateExe', 'ClientUpdate.exe');
  finally
    IniFile.Free;
  end;

  UpdateFilePath := ExePath + 'Update\' + UpdateExe;
  FilePath := ExePath + '\' + UpdateExe;

  try
    if FileExists(UpdateFilePath) then
    begin
      if CopyFile(Pchar(UpdateFilePath), Pchar(FilePath), False) then
        DeleteFile(UpdateFilePath);
    end;

    if updateUnit.ExistUpdateFile_ls(CoerceUpdate) then
    begin
      if CoerceUpdate then
      begin
        SetCurrentDir(ExePath);
        shellexecute(handle, 'open', pchar(FilePath), nil, nil, sw_show);
        Application.Terminate;
      end
      else
      begin
        if MessageBox(handle, '升级将关闭监控客户端，是否继续升级', '提示', MB_OKCANCEL + MB_ICONQUESTION) = ID_OK then
        begin
          if FileExists(FilePath) then
          begin
            SetCurrentDir(ExePath);
            shellexecute(handle, 'open', pchar(FilePath), nil, nil, sw_show);
            Application.Terminate;
          end
          else
            MessageBox(handle, '对不起，没有找到升级程序，无法升级！', '提示', MB_OK + MB_ICONINFORMATION);
        end;
      end;
    end
    else
    begin
      MessageBox(Handle, '您的客户端是最新版本，无需升级', '提示', MB_OK);
    end;
  finally
//     TimerUpdate.Interval:=30*60*1000;
//     TimerUpdate.Enabled:=true;
  end;

  {if MessageBox(handle, '升级将关闭监控客户端，是否继续升级', '提示', MB_OKCANCEL + MB_ICONQUESTION) = ID_OK then
  begin
    if FileExists(ExePath + '\HEBGpsClientUpdate.exe') then
    begin
      SetCurrentDir(ExePath);
      shellexecute(handle, 'open', pchar(ExePath + '\HEBGpsClientUpdate.exe'), nil, nil, sw_show);
      Application.Terminate;
      Exit;
    end
    else
      MessageBox(handle, '对不起，没有找到升级程序HEBGpsClientUpdate.exe，无法升级！', '提示', MB_OK + MB_ICONINFORMATION);
  end;      }
end;

procedure Tfrmlogin.SpeedButton1Click(Sender: TObject);
begin
  if edit1.GetTextLen =0 then
  begin
    messagebox(handle,'请您输入用户名！','提示',mb_ok + mb_iconinformation);
    edit1.SetFocus ;
    exit;
  end;
  modalresult:= mrOk;
end;

procedure Tfrmlogin.SpeedButton2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure Tfrmlogin.SpeedButton3Click(Sender: TObject);
var
 frm: TSystemConfigFrm ;
begin
  frm:=TSystemConfigFrm.Create(nil);
  try
    frm.ShowModal;
    if frm.ModalResult = mrOk then
    begin
      try
        //载入参数文件
        //GlobalParam.LoadFromFile(Application.ExeName + '.config');
      except on E: Exception do
        begin
          ShowMessage(E.Message);
        end;
      end;
    end;
  finally
    frm.Free;
  end;
end;

procedure Tfrmlogin.SpeedButton4Click(Sender: TObject);
//var
//  CoerceUpdate: Boolean;
//  UpdateExe: string;
//  IniFile: TIniFile;
//  FilePath: string;
//  UpdateFilePath: string;
begin
//  IniFile := TIniFile.Create(ExePath + 'Config.ini');
//  try
//    UpdateExe := IniFile.ReadString('update', 'UpdateExe', 'ClientUpdate.exe');
//  finally
//    IniFile.Free;
//  end;
//
//  UpdateFilePath := ExePath + 'Update\' + UpdateExe;
//  FilePath := ExePath + '\' + UpdateExe;
//
//  try
//    if FileExists(UpdateFilePath) then
//    begin
//      if CopyFile(Pchar(UpdateFilePath), Pchar(FilePath), False) then
//        DeleteFile(UpdateFilePath);
//    end;
//
//    if updateUnit.ExistUpdateFile_ls(CoerceUpdate) then
//    begin
//      if CoerceUpdate then
//      begin
//        SetCurrentDir(ExePath);
//        shellexecute(handle, 'open', pchar(FilePath), nil, nil, sw_show);
//        Application.Terminate;
//      end
//      else
//      begin
//        if MessageBox(handle, '升级将关闭监控客户端，是否继续升级', '提示', MB_OKCANCEL + MB_ICONQUESTION) = ID_OK then
//        begin
//          if FileExists(FilePath) then
//          begin
//            SetCurrentDir(ExePath);
//            shellexecute(handle, 'open', pchar(FilePath), nil, nil, sw_show);
//            Application.Terminate;
//          end
//          else
//            MessageBox(handle, '对不起，没有找到升级程序，无法升级！', '提示', MB_OK + MB_ICONINFORMATION);
//        end;
//      end;
//    end
//    else
//    begin
//      MessageBox(Handle, '您的客户端是最新版本，无需升级', '提示', MB_OK);
//    end;
//  finally
////     TimerUpdate.Interval:=30*60*1000;
////     TimerUpdate.Enabled:=true;
//  end;

  {if MessageBox(handle, '升级将关闭监控客户端，是否继续升级', '提示', MB_OKCANCEL + MB_ICONQUESTION) = ID_OK then
  begin
    if FileExists(ExePath + '\HEBGpsClientUpdate.exe') then
    begin
      SetCurrentDir(ExePath);
      shellexecute(handle, 'open', pchar(ExePath + '\HEBGpsClientUpdate.exe'), nil, nil, sw_show);
      Application.Terminate;
      Exit;
    end
    else
      MessageBox(handle, '对不起，没有找到升级程序HEBGpsClientUpdate.exe，无法升级！', '提示', MB_OK + MB_ICONINFORMATION);
  end;      }

  //采用公交的升级程序
  if MessageBox(handle, '升级将关闭监控客户端，是否继续升级', '提示', MB_OKCANCEL + MB_ICONQUESTION) = ID_OK then
  begin
    if FileExists(ExePath + 'tyUpdate.exe') then
    begin
      SetCurrentDir(ExePath);
      shellexecute(handle, 'open', pchar(ExePath + 'tyUpdate.exe'), nil, nil, sw_show);
      Application.Terminate;
    end
    else
      MessageBox(handle, '对不起，没有找到升级程序tyUpdate.exe，无法升级！', '提示', MB_OK + MB_ICONINFORMATION);
  end;
end;

procedure Tfrmlogin.Image8MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  SendMessage(Handle, WM_SYSCOMMAND, SC_MOVE + HTCAPTION, 0);
end;

end.
