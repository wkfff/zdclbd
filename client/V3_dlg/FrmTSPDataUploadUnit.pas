unit FrmTSPDataUploadUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxControls,
  cxInplaceContainer, cxTextEdit, Menus, CarUnit;

type
  TfrmTSPDataUpload = class(TForm)
    cxAlarmSuperviseList: TcxTreeList;
    cxAlarmSuperviseListcxTreeListColumn1: TcxTreeListColumn;
    cxAlarmSuperviseListcxTreeListColumn2: TcxTreeListColumn;
    cxAlarmSuperviseListcxTreeListColumn3: TcxTreeListColumn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    cxAlarmSuperviseListcxTreeListColumn4: TcxTreeListColumn;
    cxAlarmSuperviseListcxTreeListColumn5: TcxTreeListColumn;
    procedure N1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DoOnTSPDataUpload(dev: TDevice; msgType: Integer; msg: string);
  end;

implementation
uses
  umainf;

{$R *.dfm}

{ TForm1 }

function GetTSPDataType(msgTypeId: Integer): string;
begin
  case msgTypeId of
    0: Result := '盲区数据';
    1: Result := '版本信息';
  else
    Result := '其他';
  end;
end;  

procedure TfrmTSPDataUpload.DoOnTSPDataUpload(dev: TDevice; msgType: Integer; msg: string);
begin
  if cxAlarmSuperviseList.Count >= 100 then
    cxAlarmSuperviseList.Clear;
  with cxAlarmSuperviseList.Add do
  begin
    Values[0] := GetTSPDataType(msgType);
    Values[1] := msg ;
    Values[2] := FormatDateTime('yyyy-MM-dd hh:nn:ss', Now);
    Values[3] := dev.Car.No;
    Values[4] := dev.Id;
  end;  
end;

procedure TfrmTSPDataUpload.N1Click(Sender: TObject);
begin
  cxAlarmSuperviseList.Clear;
end;

procedure TfrmTSPDataUpload.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Mainf.show_tspDataUpload.Checked := False;
end;

end.
