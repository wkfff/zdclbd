unit FrmDriverInfoUploadUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxInplaceContainer, cxControls, CmdStructUnit, Menus;

type
  TfrmDriverInfo = class(TForm)
    cxTreeList1: TcxTreeList;
    cxTreeList1cxTreeListColumn1: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn2: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn3: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn4: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn5: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn6: TcxTreeListColumn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AddDriverInfo(driverInfo: TDriverInfoUpload);
  end;

var
  frmDriverInfo: TfrmDriverInfo;

implementation
uses
  uGloabVar, umainf;

{$R *.dfm}

{ TfrmDriverInfo }

procedure TfrmDriverInfo.AddDriverInfo(driverInfo: TDriverInfoUpload);
begin
  if cxTreeList1.Count >= 200 then
    cxTreeList1.Clear;

  with cxTreeList1.Add do
  begin
    Values[0] := cxTreeList1.Count;
    Values[1] := driverInfo.DriverName;
    Values[2] := driverInfo.DriverServiceNo;
    Values[3] := driverInfo.AgencyName;
    Values[4] := driverInfo.DriverIDNo;
    Values[5] := driverInfo.CarNo;
  end;

  PopMsg('驾驶员身份信息', driverInfo.CarNo + '上报了一条' + #13#10 + '驾驶员身份信息');
end;

procedure TfrmDriverInfo.N1Click(Sender: TObject);
begin
  cxTreeList1.Clear;
end;

procedure TfrmDriverInfo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Mainf.show_DriverUploadInfoList.Checked := False;
end;

end.
