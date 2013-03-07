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
  //�õ����ָ���µ�VCL�������
  w:= FindVclWindow(Pos);
  if (w <> nil) then
  begin
    //��W���ϼ�Parent��Ϊ��ʱ�ͼ���������
    while w.Parent <> nil do
      w:= w.Parent;
    //��󷵻ش��������Name
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
    //�õ���ǰ���ָ�������Ļ�ϵ�����
    GetCursorPos(winPos);
    //�����ָ���µĴ����Name����frmMain.nameʱ
    if infoFrm.Name = GetFormNameAt(winPos) then
    {�ڴ����ǿ���ΪfrmMainȡһ���ر�����ƣ��Է��б�Ĵ�������������ͬ}
    begin
      //ͣ��Timer2
      infoFrm.timer2.Enabled:= false;
      //frmMain��Top����Ļ����
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
// �� top ����Ļ�ϲ� 20 ����ʱ,�Զ�����
  if infoFrm.Top <= 20 then
  begin
    //��frmMain�����ƣ�����Ļ�Ϸ�¶��3����
    infoFrm.Top:= -(infoFrm.Height - 3);
    if (infoFrm.Left + infoFrm.Width > Screen.Width) then
      infoFrm.Left:= Screen.Width - infoFrm.Width;
  end
  // �� left ����Ļ�²� 20 ����ʱ,�Զ�����
  else if infoFrm.Left + infoFrm.Width - Screen.Width >= -20 then
    //��frmMain�����ƣ�����Ļ�ҷ�¶��4����
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
    //�����ָ���µĴ����Name����frmMain.nameʱ
    if infoFrm.Name = GetFormNameAt(winPos) then
    {�ڴ����ǿ���ΪfrmMainȡһ���ر�����ƣ��Է��б�Ĵ�������������ͬ}
    begin
      //ͣ��Timer2
      infoFrm.timer2.Enabled:= false;
      //frmMain��Top����Ļ����
      
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
    //�����ָ���µĴ����Name����frmMain.nameʱ
    if infoFrm.Name = GetFormNameAt(winPos) then
    {�ڴ����ǿ���ΪfrmMainȡһ���ر�����ƣ��Է��б�Ĵ�������������ͬ}
    begin
      //ͣ��Timer2
      infoFrm.timer2.Enabled:= false;
      //frmMain��Top����Ļ����

    end
    else begin
      infoFrm.Timer2.Enabled:= true;
    end;
end;

end.
