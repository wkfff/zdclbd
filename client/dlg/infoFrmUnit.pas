unit infoFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ImgList, se_controls, ksskinstatusbar,
  Buttons;

type
  TinfoFrm = class(TForm)
    Timer1: TTimer;
    Timer2: TTimer;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    ImageList1: TImageList;
    StatusBar2: TSeSkinStatusBar;
    StatusBar1: TSeSkinStatusBar;
    Panel3: TPanel;
    GroupBox3: TGroupBox;
    lblPause: TLabel;
    lblBusy: TLabel;
    lblReady: TLabel;
    lblBusyCount: TLabel;
    lblReadyCount: TLabel;
    lblPauseCount: TLabel;
    Panel4: TPanel;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    lblCurrentALL: TLabel;
    lblCurrentAlready: TLabel;
    Label3: TLabel;
    lblCurrentLv: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetFormNameAt(const Pos: TPoint): string;
    procedure showCurrentReceivePhone(ALL: Integer; Already: Integer);
  end;

var
  infoFrm: TinfoFrm;

implementation
uses umainf;
{$R *.dfm}

function TinfoFrm.GetFormNameAt(const Pos: TPoint): string;
var
  w: TWinControl;
begin
  //得到鼠标指针下的VCL可视组件
  w:= FindVclWindow(Pos);
  if (w <> nil) then
  begin
    //当W的上级Parent不为空时就继续往上找
    while w.Parent <> nil do
      w:= w.Parent;
    //最后返回窗体的名称Name
    Result:= w.Name;
  end
  else
    Result:= '';                                         
end;

procedure TinfoFrm.Timer1Timer(Sender: TObject);
var
  winPos: TPoint;
  t: integer;
  b: boolean;
begin
  b:= false;
  if (infoFrm.Top <= 3) then
  begin
    b:= true;
    t:= 0;
  end
  else if infoFrm.Left + infoFrm.Width - Screen.Width >= 0 then
  begin
    b:= true;
    t:= infoFrm.Top;
  end
  else
    t:= infoFrm.Top;


  if b then
  begin
    //得到当前鼠标指针的在屏幕上的坐标
    GetCursorPos(winPos);
    //当鼠标指针下的窗体的Name等于frmMain.name时
    if infoFrm.Name = GetFormNameAt(winPos) then
    {在此我们可以为frmMain取一个特别的名称，以防有别的窗体名称与它相同}
    begin
      //停用Timer2
      infoFrm.timer2.Enabled:= false;
      //frmMain的Top与屏幕对齐
      infoFrm.Top:= t;
      if t <> 0 then
        infoFrm.Left:= Screen.Width - infoFrm.Width;
    end
    else begin
      infoFrm.Timer2.Enabled:= true;
    end;
  end;
end;

procedure TinfoFrm.Timer2Timer(Sender: TObject);
begin
// 当 top 距屏幕上侧 20 像素时,自动隐藏
  if infoFrm.Top <= 20 then
  begin
    //将frmMain向上移，在屏幕上方露出3像素
    infoFrm.Top:= -(infoFrm.Height - 3);
    if (infoFrm.Left + infoFrm.Width > Screen.Width) then
      infoFrm.Left:= Screen.Width - infoFrm.Width;
  end
  // 当 left 距屏幕下侧 20 像素时,自动隐藏
  else if infoFrm.Left + infoFrm.Width - Screen.Width >= -20 then
    //将frmMain向右移，在屏幕右方露出4像素
    infoFrm.Left:= Screen.Width - 4;
end;

procedure TinfoFrm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  if NewWidth < 170 then
    NewWidth:= 170;
  if NewHeight < 310 then
    NewHeight:= 310;
end;

procedure TinfoFrm.showCurrentReceivePhone(ALL, Already: Integer);
var
  lv: Double;
begin
  try
    lblCurrentALL.Caption := IntToStr(ALL);
    lblCurrentAlready.Caption := IntToStr(Already);
    if ALL = 0 then
      lblCurrentLv.Caption := '0%'
    else
    begin
      lv := (Already/ALL)*100;
      lblCurrentLv.Caption := FormatFloat('0.00', lv) + '%';
    end;
  except
  end;
end;

procedure TinfoFrm.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
  var
  winPos: TPoint;
begin
  GetCursorPos(winPos);
    //当鼠标指针下的窗体的Name等于frmMain.name时
    if infoFrm.Name = GetFormNameAt(winPos) then
    {在此我们可以为frmMain取一个特别的名称，以防有别的窗体名称与它相同}
    begin
      //停用Timer2
      infoFrm.timer2.Enabled:= false;
      //frmMain的Top与屏幕对齐
      
    end
    else begin
      infoFrm.Timer2.Enabled:= true;
    end;
end;

procedure TinfoFrm.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
var
  winPos: TPoint;
begin
    GetCursorPos(winPos);
    //当鼠标指针下的窗体的Name等于frmMain.name时
    if infoFrm.Name = GetFormNameAt(winPos) then
    {在此我们可以为frmMain取一个特别的名称，以防有别的窗体名称与它相同}
    begin
      //停用Timer2
      infoFrm.timer2.Enabled:= false;
      //frmMain的Top与屏幕对齐

    end
    else begin
      infoFrm.Timer2.Enabled:= true;
    end;
end;

end.
