unit SelectDevsFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmSelectDevs, cxGraphics, cxCustomData, cxStyles, cxTL,
  cxTextEdit, Menus, ActnList, StdCtrls, Buttons, cxInplaceContainer,
  cxControls, ComCtrls, ExtCtrls;

type
  TSelectDevsFrm = class(TFrmSelectDevs)
    BitBtnDel: TBitBtn;
    BitBtnDelAll: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelectDevsFrm: TSelectDevsFrm;

implementation

{$R *.dfm}

end.
