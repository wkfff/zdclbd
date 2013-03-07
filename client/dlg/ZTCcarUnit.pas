unit ZTCcarUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxSplitter, ComCtrls, ExtCtrls, ToolWin, Menus,
  ImgList;

type
  TZTCcarUnitFrm = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    TreeView1: TTreeView;
    Panel2: TPanel;
    SplitterBottom: TcxSplitter;
    ImageList1: TImageList;
    ToolButton1: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ZTCcarUnitFrm: TZTCcarUnitFrm;

implementation

{$R *.dfm}

procedure TZTCcarUnitFrm.FormShow(Sender: TObject);
begin
  TreeView1.AutoExpand:=true;
end;

end.
