unit DevVerFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxInplaceContainer, cxControls;

type
  TDevExtendVerFrm = class(TForm)
    cxList: TcxTreeList;
    ColDevName: TcxTreeListColumn;
    ColDevState: TcxTreeListColumn;
    ColDevVer: TcxTreeListColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DevExtendVerFrm: TDevExtendVerFrm;

implementation

{$R *.dfm}

end.
