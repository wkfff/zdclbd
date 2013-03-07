unit PictureAlarmFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls,CarUnit, cxGraphics, cxCustomData, cxStyles,
  cxTL, cxTextEdit, cxInplaceContainer, cxControls, cxSplitter, Menus;

type
  TPictureAlarmFrm = class(TForm)
    Image1: TImage;
    PanelPic: TPanel;
    Panel2: TPanel;
    LabeledEditCarNO: TLabeledEdit;
    LabeledEditTime: TLabeledEdit;
    LabeledEditReason: TLabeledEdit;
    LabeledEditPostion: TLabeledEdit;
    cxPicList: TcxTreeList;
    cxCol_CarNo: TcxTreeListColumn;
    cxCol_PicTime: TcxTreeListColumn;
    cxCol_PicReason: TcxTreeListColumn;
    cxCol_PicPosition: TcxTreeListColumn;
    cxCol_PicFileName: TcxTreeListColumn;
    cxSplitter1: TcxSplitter;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure cxPicListClick(Sender: TObject);
    procedure cxPicListKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    function ShowPicture(AFileName: string;AddToListBj:Boolean = False): boolean;
    procedure AddToPicList(const cph, picPostion, picTime,
      picReson,AFileName: String);
    { Private declarations }
  public
    { Public declarations }
    function RcvAlarmPic(ADev: TDevice; PicIndex: Integer;PicReson: Byte):String;
  end;

var
  PictureAlarmFrm: TPictureAlarmFrm;

implementation
uses uGloabVar,BusinessServerUnit,ConstDefineUnit;
{$R *.dfm}

{ TPictureAlarmFrm }

function TPictureAlarmFrm.RcvAlarmPic(ADev: TDevice;
  PicIndex: Integer; PicReson: Byte):String;
var
  fileName:string;
begin
  Result := '';
  LabeledEditCarNO.Text:= ADev.Car.No;
  fileName := bs.QueryPhotoByDevAndPicIndex(Adev,PicIndex);
  if ShowPicture(fileName,True) then
    Result:= fileName;
end;

function TPictureAlarmFrm.ShowPicture(AFileName: string;AddToListBj:Boolean = False): boolean;
var
  filename:string;
  i,tmp:integer;
  s:string;
  cph,picTime,picPosition,picReson:string;
begin
  Result:=false;
  if (AFileName='') or (not FileExists(AFileName)) then
  begin
    Image1.Picture.Bitmap.FreeImage;
    PanelPic.Caption:='无照片';
    self.Caption:= '无照片';
    exit;
  end;
  filename := ExtractFileName(AFileName);
  try
    PanelPic.Caption:='';
    Image1.Picture.LoadFromFile(AFileName);//载入图片文件
  except
    Image1.Picture.Bitmap.FreeImage;
    PanelPic.Caption:='照片错误';
  end;
  Result:= true;
  i:=pos('_',filename);
  cph :=ExtractFileName(copy(filename,1,i-1));//车牌号
  filename:=copy(filename,i+1,Length(filename)-i);
  i:=pos('_',filename);
  s:=copy(filename,1,i-1);//拍照时间
  picTime := copy(s,1,2)+'-'+copy(s,3,2)+'-'+copy(s,5,2)+' '+copy(s,7,2)+':'+copy(s,9,2)+':'+copy(s,11,2);
  filename:=copy(filename,i+1,Length(filename)-i);
  i:=pos('_',filename);
  try
    tmp:=StrToInt(copy(filename,1,i-1)); //拍照原因
  except
    tmp:=$ff;
  end;
  picReson:= ReturnUploadPicReason(tmp);
  filename:=copy(filename,i+1,Length(filename)-i);
  i:=pos('_',filename);
  try
    tmp:=StrToInt(copy(filename,1,i-1));//拍照位置
  except
  end;
  case tmp of
      0:s:='前门';
      1:s:='后门';
      2:s:='司机上方';
  else
      s:='';
  end;
  picPosition := s;
  self.Caption := picReson +'，'+ cph+'，'+picPosition+'，'+picTime;
  if AddToListBj then  //需加入到照片列表中
    AddToPicList(cph,picPosition,picTime,picReson,AFileName);
end;

procedure TPictureAlarmFrm.AddToPicList(const cph,picPostion,picTime,picReson,AFileName:String);
var
  node: TcxTreeListNode;
begin
  try
    node := cxPicList.Add;
    with node do
    begin
      Values[0] := cph;
      Values[1] := picTime;
      Values[2] := picReson;
      Values[3] := picPostion;
      Values[4] := AFileName;
    end;
    cxPicList.FocusedNode := node;
  except
  end;
end;

procedure TPictureAlarmFrm.N1Click(Sender: TObject);   //清除所有
begin
  cxPicList.Clear;
  ShowPicture('');
end;

procedure TPictureAlarmFrm.N2Click(Sender: TObject); //只显示最近一条
var
  node: TcxTreeListNode;
  filename : String;
begin
  if cxPicList.count =0 then exit;
  cxCol_PicTime.SortOrder := soDescending;
  cxPicList.Sorted := true;
  while cxPicList.count >1 do
    cxPicList.Items[cxPicList.count -1].Delete;
  node := cxPicList.Items[0];
  if  node=nil then exit;
  filename:= cxPicList.Items[node.index].Values[4];
  ShowPicture(filename);
end;

procedure TPictureAlarmFrm.N3Click(Sender: TObject); //清除当前一条
var
  node: TcxTreeListNode;
begin
  node :=  cxPicList.FocusedNode;
  if  node=nil then exit;
  cxPicList.Items[node.index].Delete;
  if cxPicList.Count =0 then
    ShowPicture('')
  else
  begin
    cxPicList.Items[0].Focused;
    cxPicListClick(nil);
  end;
end;

procedure TPictureAlarmFrm.cxPicListClick(Sender: TObject);
var
  node: TcxTreeListNode;
  filename : String;
begin
  node := cxPicList.FocusedNode;
  if  node=nil then exit;
  filename:= cxPicList.Items[node.index].Values[4];
  ShowPicture(filename);
end;

procedure TPictureAlarmFrm.cxPicListKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  node: TcxTreeListNode;
  filename : String;
begin
  node := cxPicList.FocusedNode;
  if  node=nil then exit;
  filename:= cxPicList.Items[node.index].Values[4];
  ShowPicture(filename);
end;

end.
