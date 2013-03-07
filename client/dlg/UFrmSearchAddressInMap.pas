{ 地物查询，根据标注的内容，找到图元的UID
　　　　　　根据UID，找到图元的MetaIndex
　　　　　　根据MetaIndex，找到图元
　　　再由图元的类型，找到图元的位置
　-- 支持标注重复的查找：当某图层有多个标注内容名称相重时，可由标注找出所有的图元位置
  -- 支持 模糊查找 及 全字匹配查找

  @author(sha)
  @created(2005-08-01)
  @lastmod(GMT:$Date: 2012/10/29 01:46:42 $) <BR>
  最后更新人:$Author: wfp $  <BR>
  当前版本:$Revision: 1.1.1.1 $  <BR>}

unit UFrmSearchAddressInMap;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,types, ComCtrls, ExtCtrls,emapker,MetaDefine, TextUnit,
  Menus;

type
  //查询结果 (图层，UID值s)
  TSearchAddrResult= record
    Meta  : PMetaStruct;
    LayerName:string;
    MetaName  : String;
    StaticStart:integer;

    pDefineText:PUserDefinedText;
    DataLayer: TDataLayer;
  end;
  PSearchAddrResult = ^TSearchAddrResult;

  TFrmSearchAddressInMap = class(TForm)
    Panel1: TPanel;
    Edit_Address: TEdit;
    Label2: TLabel;
    Panel4: TPanel;
    Splitter2: TSplitter;
    PanelSearchResult: TPanel;
    BitBtnSearchInAllLayers: TBitBtn;
    ListViewSearchResult: TListView;
    EditAddrContent: TEdit;
    Label3: TLabel;
    RBLocatePart: TRadioButton;
    RBLocateAll: TRadioButton;
    Label1: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit_AddressKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtnSearchInAllLayersClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListViewSearchResultSelectItem(Sender: TObject;
      Item: TListItem; Selected: Boolean);
    procedure RBLocatePartClick(Sender: TObject);
    procedure RBLocateAllClick(Sender: TObject);
    procedure ListViewSearchResultDblClick(Sender: TObject);
  private
    { Private declarations }
    FSearchResult:array of TSearchAddrResult;
    FSearchResultCount:integer;
    procedure ShowMetaInMap(meta:PMetaStruct;StaticStart:integer);
    procedure ListViewSelect;
  public
    { Public declarations }
  end;

var
  FrmSearchAddressInMap: TFrmSearchAddressInMap;

implementation
uses uMainf, uGloabVar, DB, MapPubUnit;
{$R *.dfm}

procedure TFrmSearchAddressInMap.FormCreate(Sender: TObject);
begin
  Edit_Address.Text:='';
  EditAddrContent.Text := '';
  //ListViewSearchResult.Columns[4].Width := 0;
end;

procedure TFrmSearchAddressInMap.ShowMetaInMap(meta:PMetaStruct;StaticStart:integer);
var
 // ep   : TEarthPoint;
  wp   : TWorldPoint;
  points_count,sizeofbuffer  : integer;
  FDataBuffer   : TIntegerDynArray;
  isCalculateed_wp : boolean;   //已计算出wp
  x,y:integer;
begin
  isCalculateed_wp := False;
  case meta._type of
    _Symbol:
    begin
      wp :=meta.Symbol.Position;
    end;
    _Line:
    begin
      //ep:= meta.Line.SP;
      wp.x := (meta.Line.SP.x + meta.Line.EP.x) div 2;
      wp.y  := (meta.Line.SP.y  + meta.Line.EP.y) div 2;
    end;
    _Text:
    begin
      wp:= meta.Text.SP;
    end;
    _Rect:
    begin
      wp:= meta.Outbox.TopLeft;
    end;
    _RoundRect:
    begin
      wp:= meta.Outbox.TopLeft;
    end;
    _PolyLine:
    begin
      with Meta.Polyline do 
      begin
        points_count:=SPWAddress-PWAddress;
        sizeofbuffer:=Count*sizeof(integer)+points_count;
        if sizeofbuffer<0 then sizeofbuffer:=0;
        SetLength(FDataBuffer,sizeofbuffer);

        CopyMemory(@FDataBuffer[0],Pointer(PWAddress+StaticStart),sizeofbuffer);
      end;
      wp:= TWorldPointAry(FDataBuffer)[0];
      isCalculateed_wp := true;
    end;
    _PolyRegion:
    begin
      with Meta.PolyRegion do
      begin
        points_count:=SPWAddress-PWAddress;
        sizeofbuffer:=Count*sizeof(integer)+points_count;
        if sizeofbuffer<0 then sizeofbuffer:=0;
        SetLength(FDataBuffer,sizeofbuffer);
        CopyMemory(@FDataBuffer[0],pointer(PWAddress+StaticStart),sizeofbuffer);
      end;
      wp:= TWorldPointAry(FDataBuffer)[0];
      isCalculateed_wp := true;
    end;
  end;    

  //if not isCalculateed_wp then wp := FMap.Projection.LoLa2XY(ep);
  FMap.Zoom(1,wp);
  FMap.Draw;

  FMap.TmpDraw.Canvas.Pen.Color := clred;
  FMap.TmpDraw.Canvas.Pen.Width :=3;
  FMap.TmpDraw.Canvas.Pen.Mode := pmMask ;
  x:= Mainf.FDlg_Map.Panel_Map.Width  div 2;
  y:= Mainf.FDlg_Map.Panel_Map.Height div 2;
  if ListViewSearchResult.Selected=nil then exit;
  FMap.DrawTempEllipseAndText(x,y,ListViewSearchResult.Selected.SubItems.Strings[0]);
end;

procedure TFrmSearchAddressInMap.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Mainf.show_SearchAddress.Checked := False;
end;

procedure TFrmSearchAddressInMap.Edit_AddressKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key= #13 then BitBtnSearchInAllLayers.Click;
end;

procedure TFrmSearchAddressInMap.BitBtnSearchInAllLayersClick(
  Sender: TObject);
var
  i,j,n,searchLayerCnt: integer;
  tmpDrawLayer: TDrawLayer;
  seekAry: TIntegerDynArray;
  searchName,metaname:string;
//  str : string;
  locateOptions: TLocateOptions;
  meta:PMetaStruct;
  ep: TEarthPoint;
begin
  if Trim(Edit_Address.Text)='' then
  begin
    messagebox(handle,'请您输入要查找的内容！','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  searchName := Trim(Edit_Address.Text);
  if RBLocateAll.Checked then
    locateOptions := [loCaseInsensitive]
  else if RBLocatePart.Checked then
    locateOptions := [loPartialKey];

  ListViewSearchResult.Clear;
  EditAddrContent.Text := '';
  PanelSearchResult.Caption :='　查询结果：0处';
  searchLayerCnt := 0;
  FSearchResultCount:=0;
  SetLength(FSearchResult, 0);

  for i:=0 to GTextManage.Count-1 do
  begin
    if pos(searchName,GTextManage.Item[i]^.Text)>0 then
    begin
       inc(FSearchResultCount);
       SetLength(FSearchResult,FSearchResultCount);
       FSearchResult[FSearchResultCount-1].pDefineText:=GTextManage.Item[i];
       FSearchResult[FSearchResultCount-1].DataLayer:=nil;
    end;
  end;

  //找到了
  if Length(FSearchResult)>0 then
  begin
    //列出找到的所有图元
//    n:= 0;
    for i:= 0 to Length(FSearchResult)-1 do
    begin
        with ListViewSearchResult.Items.Add do
        begin
          Data := @FSearchResult[i];
          caption:=IntToStr(i+1);
          if FSearchResult[i].DataLayer<>nil then
          begin
          end else
          begin
            subitems.Add(FSearchResult[i].pDefineText^.Text);

            ep := project.XY2LoLa(FSearchResult[i].pDefineText^.Symbol.Position);
            subitems.Add(FormatFloat('##0.000000', ep.Longitude));
            subitems.Add(FormatFloat('##0.000000', ep.Latitude));
          end;
        end;
    end;
    PanelSearchResult.Caption :='　查询结果：'+IntToStr(FSearchResultCount)+'处';
    //显示找到的第一个图层的第一个图元
    ListViewSearchResult.SetFocus;
    ListViewSearchResult.Selected := ListViewSearchResult.TopItem;
  end;
end;

procedure TFrmSearchAddressInMap.FormShow(Sender: TObject);
begin
  //if Edit_Address.Enabled then Edit_Address.SetFocus;
end;

procedure TFrmSearchAddressInMap.ListViewSearchResultSelectItem(
  Sender: TObject; Item: TListItem; Selected: Boolean);
begin
//  if Selected then ListViewSelect;
end;

procedure TFrmSearchAddressInMap.ListViewSelect;
var
  tmpAddr:TSearchAddrResult;
  metaUID,metaIndex : integer;
  meta : PMetaStruct;
  j: integer;
  ep: TEarthPoint;
  sp: Tpoint;
begin
  try
    if ListViewSearchResult.Selected = nil then exit;
    tmpAddr:= PSearchAddrResult(ListViewSearchResult.Selected.Data)^;

    if tmpAddr.DataLayer<>nil then
    begin
    end else
    begin
      Locate_DefinedText(tmpAddr.pDefineText^.ID);
      //FMap.Zoom(1,tmpAddr.pDefineText^.Symbol.Position);
      //ep := FMap.Projection.XY2LoLa(tmpAddr.pDefineText^.Symbol.Position);
      //FMap.Draw;

      //sp := FMap.DrawCood.ConvertSP(tmpAddr.pDefineText^.Symbol.Position);
      //FMap.TmpDraw.Canvas.Pen.Color := clred;
      //FMap.TmpDraw.Canvas.Pen.Width := 3;
      //FMap.TmpDraw.Canvas.Pen.Mode := pmMask;
      //FMap.DrawTempEllipseAndText(sp.x, sp.y, tmpAddr.pDefineText^.Text);
    end;
  except
  end;
end;

procedure TFrmSearchAddressInMap.RBLocatePartClick(Sender: TObject);
begin
  if RBLocatePart.Checked then
  begin
    RBLocatePart.Font.Color := clBlue;
    RBLocateAll.Font.Color := clWindowText;
  end;
end;

procedure TFrmSearchAddressInMap.RBLocateAllClick(Sender: TObject);
begin
  if RBLocateAll.Checked then
  begin
    RBLocateAll.Font.Color := clBlue;
    RBLocatePart.Font.Color := clWindowText;
  end;
end;



procedure TFrmSearchAddressInMap.ListViewSearchResultDblClick(
  Sender: TObject);
begin
  ListViewSelect;
end;

end.
