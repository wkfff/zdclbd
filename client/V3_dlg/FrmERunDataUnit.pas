unit FrmERunDataUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxInplaceContainer, cxControls, CmdStructUnit, Menus;

type
  TfrmERunData = class(TForm)
    cxTreeList1: TcxTreeList;
    cxTreeList1cxTreeListColumn1: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn3: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn2: TcxTreeListColumn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AddERunData(eRunData: TERunDataUpload);
  end;

var
  frmERunData: TfrmERunData;

implementation
uses
  uGloabVar, umainf;

{$R *.dfm}

{ TfrmERunData }

procedure TfrmERunData.AddERunData(ERunData: TERunDataUpload);
begin
  if cxTreeList1.Count >= 200 then
    cxTreeList1.Clear;
  with cxTreeList1.Add do
  begin
    Values[0] := cxTreeList1.Count;
    Values[1] := eRunData.carNo;
    Values[2] := eRunData.ERunData;
  end;

  PopMsg('电子运单', eRunData.carNo + '上报了一条' + #13#10 + '电子运单信息');
end;

procedure TfrmERunData.N1Click(Sender: TObject);
begin
  cxTreeList1.Clear;
end;

procedure TfrmERunData.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Mainf.show_ERunDataList.Checked := False;
end;

end.
