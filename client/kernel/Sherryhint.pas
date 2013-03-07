unit SherryHint;

interface

uses
  Windows, Messages, Classes, Controls, Forms, CommCtrl;

type
  THintWin=class(THintWindow)
  private
    FLastActive: THandle;
    FHintPause:integer;
    hWndTip:DWORD;
    procedure AddTipTool(hWnd: DWORD; IconType: Integer; Title, Text: PChar);
  public
    
    procedure ActivateHint(Rect:TRect;Const AHint:string);override;
    property HintPause:integer Read FHintPause Write FHintPause;
  end;

implementation

procedure THintWin.AddTipTool(hWnd: DWORD; IconType: Integer; Title, Text: PChar);
const
  TTS_BALLOON =$0040;
  TTM_SETTITLE=WM_USER + 32;
var
  ToolInfo: TToolInfo;
begin
  if hWndTip = 0 then
  hWndTip:=CreateWindow(TOOLTIPS_CLASS, nil,
          WS_POPUP or TTS_NOPREFIX or TTS_BALLOON or TTS_ALWAYSTIP,
          0, 0, 0, 0, hWnd, 0, HInstance, nil);
  if (hWndTip<>0) then
  begin
    ToolInfo.cbSize:=SizeOf(ToolInfo);
    ToolInfo.uFlags:=TTF_IDISHWND or TTF_SUBCLASS or TTF_TRANSPARENT;
    ToolInfo.uId:=hWnd;
    ToolInfo.lpszText:=Text;
    SendMessage(hWndTip,TB_SETBITMAPSIZE,IconType,Integer(Title));
    SendMessage(hWndTip,TTM_ADDTOOL,1,Integer(@ToolInfo));
  end;
  InitCommonControls();
end;

procedure THintWin.ActivateHint(Rect:TRect;const AHint:string);
var
  Title:String;
  i:integer;
  Hint:String;
begin
  i:=Pos(#13,AHint);
  if i<=0 then
  begin
     Title:='ÌבÊ¾';
     Hint:=AHint;
  end
  else
  begin
     Title:=Copy(AHint,1,i-1);
     Hint:=Copy(AHint,i+2,Length(AHint)-i);
  end;

  //if FLastActive<>WindowFromPoint(Mouse.CursorPos) then
  AddTipTool(WindowFromPoint(Mouse.CursorPos),1,PChar(Title), PChar(Hint));//Application.Hint));
  FLastActive:=WindowFromPoint(Mouse.CursorPos);
end;

initialization
{ Application.HintPause:=0;
 Application.ShowHint:=False;
 HintWindowClass:=THintWin;
 Application.ShowHint:=True;}
end. 


