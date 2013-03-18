unit FrmDriverInfoUploadUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxInplaceContainer, cxControls, CmdStructUnit, Menus, RzTabs;

type
  TfrmDriverInfo = class(TForm)
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    cxTreeList1: TcxTreeList;
    cxTreeList2cxTreeListColumn1: TcxTreeListColumn;
    cxTreeList2cxTreeListColumn2: TcxTreeListColumn;
    cxTreeList2cxTreeListColumn3: TcxTreeListColumn;
    cxTreeList2cxTreeListColumn4: TcxTreeListColumn;
    cxTreeList2cxTreeListColumn5: TcxTreeListColumn;
    cxTreeList2cxTreeListColumn6: TcxTreeListColumn;
    cxTreeList2cxTreeListColumn7: TcxTreeListColumn;
    cxTreeList2cxTreeListColumn8: TcxTreeListColumn;
    cxTreeList2cxTreeListColumn9: TcxTreeListColumn;
    cxTreeList2cxTreeListColumn10: TcxTreeListColumn;
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
    Values[1] := driverInfo.CarNo;
    Values[2] := driverInfo.LogInOrOut;
    Values[3] := driverInfo.LogTime;
    Values[4] := driverInfo.ICCardRet;
    Values[5] := driverInfo.DriverName;
    Values[6] := driverInfo.DriverServiceNo;
    Values[7] := driverInfo.AgencyName;
    Values[8] := driverInfo.CertificateValidDate;
    Values[9] := driverInfo.DriverIDNo;
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
