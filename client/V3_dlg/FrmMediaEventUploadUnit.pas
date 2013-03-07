unit FrmMediaEventUploadUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxInplaceContainer, cxControls, Menus, CmdStructUnit;

type
  TfrmMediaEventUpload = class(TForm)
    cxTreeList1: TcxTreeList;
    cxTreeList1cxTreeListColumn1: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn2: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn3: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn4: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn5: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn6: TcxTreeListColumn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    cxTreeList1cxTreeListColumn7: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn8: TcxTreeListColumn;
    procedure N1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AddMediaEventUpload(mediaEvent: RecMediaEventUpload);
  end;


implementation
uses
  uGloabVar, umainf;

{$R *.dfm}

procedure TfrmMediaEventUpload.AddMediaEventUpload(mediaEvent: RecMediaEventUpload);
begin
  if cxTreeList1.Count > 200 then
    cxTreeList1.Clear;

  with cxTreeList1.Add do
  begin
    Values[0] := cxTreeList1.Count;
    Values[1] := mediaEvent.CarNo;
    Values[2] := mediaEvent.MediaDataId;
    Values[3] := GetMediaType(mediaEvent.MediaType);
    Values[4] := GetMediaFormatName(mediaEvent.MediaDataFormat);
    Values[5] := GetMediaEventName(mediaEvent.MediaEventId);
    Values[6] := mediaEvent.MediaChannelId;
    Values[7] := FormatDateTime('yyyy-MM-dd hh:nn:ss', Now);
  end;

  PopMsg('多媒体事件信息上传', mediaEvent.CarNo + '上传了一条' + #13#10 + '多媒体事件信息');
end;

procedure TfrmMediaEventUpload.N1Click(Sender: TObject);
begin
  cxTreeList1.Clear;
end;

procedure TfrmMediaEventUpload.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Mainf.show_MediaEventUpload.Checked := False;
end;

end.
