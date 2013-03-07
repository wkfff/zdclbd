unit FrmQueryVideoListUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QueryPictureListFrmUnit, cxGraphics, cxCustomData, cxStyles,
  cxTL, cxTextEdit, Menus, cxInplaceContainer, cxControls, ComCtrls,
  StdCtrls, Buttons, ExtCtrls, CarUnit, CmdStructUnit;

type
  TfrmQueryVideoList = class(TQueryPictureListFrm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OnVideoDataUpload(dev: TDevice; mediaData: TMediaDataUpload_V3);
  end;

var
  frmQueryVideoList: TfrmQueryVideoList;

implementation
uses
  uGloabVar, umainf;

{$R *.dfm}

{ TfrmQueryVideoList }

procedure TfrmQueryVideoList.OnVideoDataUpload(dev: TDevice;
  mediaData: TMediaDataUpload_V3);
begin
  with cxTreeList1.AddFirst do
  begin
    Values[0] := dev.Id;
    Values[1] := dev.Car.No;
    Values[2] := GetMediaType(mediaData.MediaType);
    Values[3] := GetMediaChannelName(mediaData.MediaChannel);
    Values[4] := FormatDateTime('yyyy-MM-dd hh:nn:ss', GetGpsTime(mediaData.GpsTime));
    Values[5] := GetReasonName(mediaData.Reason);
    Values[6] := FormatDateTime('yyyy-MM-dd hh:nn:ss', Now);
    Values[7] := mediaData.MediaType;
    Values[8] := mediaData.MediaChannel;
    Values[9] := mediaData.Reason;
    Values[10] := GetMediaChannel(mediaData.MediaChannel);
    Values[11] := ByteOderConvert_LongWord(mediaData.MediaId);
    Data := @dev;
  end;
end;

procedure TfrmQueryVideoList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Mainf.show_QueryVideoList.Checked := False;
end;

end.
