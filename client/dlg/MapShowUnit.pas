unit MapShowUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, classes, Graphics, Controls, Forms,
  Dialogs, comCtrls, ToolWin, ExtCtrls, StdCtrls, Buttons, cxControls,
  cxSplitter;

type
  TMapShowFrm = class(TForm)
    Panel_Map: TPanel;
    Panel_BirdEyeSet: TPanel;
    Panel_birdEye: TPanel;
    TrackBarOutlook: TTrackBar;
    CoolBarMapTool: TCoolBar;
    ToolBar_MapTools: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton11: TToolButton;
    ToolButton10: TToolButton;
    ToolButton35: TToolButton;
    ToolButton5: TToolButton;
    ToolButton12: TToolButton;
    ToolButton8: TToolButton;
    ToolButton14: TToolButton;
    ToolButton19: TToolButton;
    ToolButton9: TToolButton;
    PanelDeviceList: TPanel;
    Panel1: TPanel;
    CheckBoxIsShowFile: TCheckBox;
    PanelMapName: TPanel;
    TreeViewMap: TTreeView;
    ToolButton6: TToolButton;
    BitBtnCloseMapManager: TBitBtn;
    StatusBar1: TStatusBar;
    ToolButton7: TToolButton;
    ToolButton13: TToolButton;
    ToolButton15: TToolButton;
    Panel_data_display: TPanel;
    Image4: TImage;
    SpeedButton1: TSpeedButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton20: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure TreeViewMapDblClick(Sender: TObject);
    procedure TreeViewMapContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure Panel_MapResize(Sender: TObject);
    procedure CheckBoxIsShowFileClick(Sender: TObject);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MapShowFrm: TMapShowFrm;

implementation
uses umainf, uGloabVar;
{$R *.dfm}

procedure TMapShowFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Mainf.Show_Map.Checked := false;
end;

procedure TMapShowFrm.FormResize(Sender: TObject);
begin
  if Panel_data_display.Visible then
    Panel_data_display.Visible := false;
  if PanelDeviceList.Visible then
  begin
    PanelDeviceList.Visible:=false;
    PanelDeviceList.Visible:=true;
  end;
end;

procedure TMapShowFrm.TreeViewMapDblClick(Sender: TObject);
begin
  umainf.Mainf.TreeViewMapDblClick(Sender);
end;

procedure TMapShowFrm.TreeViewMapContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  umainf.Mainf.TreeViewMapContextPopup(Sender,Mousepos,Handled);
end;

procedure TMapShowFrm.Panel_MapResize(Sender: TObject);
begin
  if PanelDeviceList.Visible then
    PanelDeviceList.Height:=Panel_Map.Height;
end;

procedure TMapShowFrm.CheckBoxIsShowFileClick(Sender: TObject);
begin
  umainf.Mainf.CheckBoxIsShowFileClick(Sender);
end;


procedure TMapShowFrm.FormMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  umainf.Mainf.FormMouseWheelDown(Sender,Shift,MousePos,Handled);
end;

procedure TMapShowFrm.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  umainf.Mainf.FormMouseWheelUp(Sender,Shift,MousePos,Handled);
end;

procedure TMapShowFrm.FormShow(Sender: TObject);
begin
  //FMap.EnableTimer(True);
end;

procedure TMapShowFrm.SpeedButton1Click(Sender: TObject);
begin
  PanelDeviceList.Visible:=false;
  ToolButton6.Down:=false;
end;

end.
