unit MediaPlayUnit;

interface
uses SysUtils,  WMPLib_TLB;

     procedure MediaPalySound(URL: string);

var
   MediaPlayer:TWindowsMediaPlayer;

   
implementation
procedure MediaPalySound(URL: string);
begin
  if FileExists(URL) then
  begin
    MediaPlayer.URL := URL;
    MediaPlayer.controls.play;
  end;
end;
end.
