unit QueryPicsByTimeFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit, ExtCtrls,
  StdCtrls, Buttons, cxInplaceContainer, cxControls, Service, jpeg;

type
  TQueryPicsByTimeFrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    cxPicList: TcxTreeList;
    cxDeviceListcxTreeListColumn1: TcxTreeListColumn;
    cxDeviceListcxTreeListColumn2: TcxTreeListColumn;
    cxPicListcxTreeListColumn1: TcxTreeListColumn;
    BitBtn1: TBitBtn;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure cxPicListClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    PicInfoBuf: ArrayOfPicInfo;
    car_no: string;
  end;

var
  QueryPicsByTimeFrm: TQueryPicsByTimeFrm;

implementation

{$R *.dfm}

procedure TQueryPicsByTimeFrm.FormShow(Sender: TObject);
var
  i: Integer;
  ANode: TcxTreeListNode;
begin
  for i:=0 to Length(PicInfoBuf)-1 do
  begin
    ANode := cxPicList.AddFirst;
    try
      cxDeviceListcxTreeListColumn2.SortOrder:=soNone;
      ANode.Data := picInfoBuf[i];
      ANode.Values[0] := car_no;//ADeviceManage.FindToCarNO(info.Dev_id);
      ANode.Values[1] :=  picInfoBuf[i].GpsTime;
      ANode.Values[2]:=picInfoBuf[i].takeBeginTime;//上传时间
      cxDeviceListcxTreeListColumn2.SortOrder:=soDescending;
    except
        ANode.Delete;
    end;
  end;
end;

procedure TQueryPicsByTimeFrm.cxPicListClick(Sender: TObject);
var
  ms : TMemoryStream;
  jpegfile : TJPEGImage;
  info: PicInfo;
  Node: TcxTreeListNode;
begin
  try
      Panel2.Caption:='';
      node:=cxPicList.FocusedNode;
      info := PicInfo(cxPicList.Items[node.Index].Data);
      ms := TMemoryStream.Create;
      jpegfile := TJPEGImage.Create;
      try
        Image1.Picture.Graphic := nil;
        ms.Write(info.Photo[0],length(info.Photo));
        ms.Position := 0;
        jpegfile.LoadFromStream(ms);
        Image1.Picture.Graphic := jpegfile;
      finally
        ms.free;
        jpegfile.Free;
      end;
  except
     Image1.Picture.Bitmap.FreeImage;
     Panel2.Caption:='照片错误';
  end;

end;

end.
