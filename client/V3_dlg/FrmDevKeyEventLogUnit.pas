unit FrmDevKeyEventLogUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxInplaceContainer, cxControls, Menus, CarUnit;

type
  TfrmDevKeyEventLog = class(TForm)
    cxTreeList1: TcxTreeList;
    cxAlarmSuperviseListcxTreeListColumn1: TcxTreeListColumn;
    cxAlarmSuperviseListcxTreeListColumn2: TcxTreeListColumn;
    cxAlarmSuperviseListcxTreeListColumn3: TcxTreeListColumn;
    cxAlarmSuperviseListcxTreeListColumn4: TcxTreeListColumn;
    cxAlarmSuperviseListcxTreeListColumn5: TcxTreeListColumn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DoOnTSPDataUpload(dev: TDevice; msgTitle, msgContent: string);
  end;

implementation
uses
  umainf;

{$R *.dfm}

procedure TfrmDevKeyEventLog.DoOnTSPDataUpload(dev: TDevice; msgTitle,
  msgContent: string);
begin
  with cxTreeList1.Add do
  begin
    Values[0] := dev.Car.No;
    Values[1] := dev.Id;
    Values[2] := msgTitle;
    Values[3] := msgContent;
    Values[4] := FormatDateTime('yyyy-MM-dd hh:nn:ss', Now);
  end;
end;

procedure TfrmDevKeyEventLog.N1Click(Sender: TObject);
begin
  cxTreeList1.Clear;
end;

procedure TfrmDevKeyEventLog.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Mainf.show_DevKeyEventLog.Checked := False;
end;

end.
