unit PictureFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls,CarUnit,DateUtils,
  cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit, cxInplaceContainer,
  cxControls, uGloabVar, Service, GR32_Image, GR32_RangeBars, GR32_Transforms,
  GR32, RzBorder, RzPanel;

type
  TPictureFrm = class(TForm)
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    PanelButton: TPanel;
    Label1: TLabel;
    Panel7: TPanel;
    PanelPictureInfo: TPanel;
    LabeledEditCarNO: TLabeledEdit;
    LabeledEditTime: TLabeledEdit;
    LabeledEditReason: TLabeledEdit;
    LabeledEditPostion: TLabeledEdit;
    Panel8: TPanel;
    BitBtnDelAll: TBitBtn;
    BitBtnDel: TBitBtn;
    BitBtnReflash: TBitBtn;
    BitBtnPrev: TBitBtn;
    BitBtnNext: TBitBtn;
    Panel9: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    NotReceivePictureList: TListView;
    Panel3: TPanel;
    ProgressBar1: TProgressBar;
    Panel10: TPanel;
    Image1: TImage;
    Splitter2: TSplitter;
    Panel11: TPanel;
    BitBtnReceive: TBitBtn;
    BitBtnCancel: TBitBtn;
    cxPicList: TcxTreeList;
    cxDeviceListcxTreeListColumn1: TcxTreeListColumn;
    cxDeviceListcxTreeListColumn2: TcxTreeListColumn;
    cxDeviceListcxTreeListColumn3: TcxTreeListColumn;
    cxDeviceListcxTreeListColumn4: TcxTreeListColumn;
    cxPicListcxTreeListColumn1: TcxTreeListColumn;
    Panel12: TPanel;
    Edit1: TEdit;
    cxPicListcxTreeListColumn2: TcxTreeListColumn;
    Splitter1: TSplitter;
    Image321: TImage32;
    RzBorder1: TRzBorder;
    RzBorder3: TRzBorder;
    RzBorder4: TRzBorder;
    RzPanel1: TRzPanel;
    Panel13: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    angle: TGaugeBar;
    procedure BitBtnReceiveClick(Sender: TObject);
    procedure BitBtnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
//    procedure ListViewPictureCarChange(Sender: TObject;
//      Item: TListItem; Change: TItemChange);
    procedure BitBtnNextClick(Sender: TObject);
    procedure BitBtnPrevClick(Sender: TObject);
//    procedure ListBox1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure BitBtnReflashClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Panel12Resize(Sender: TObject);
    procedure cxPicListChange(Sender: TObject);
    procedure BitBtnDelClick(Sender: TObject);
    procedure BitBtnDelAllClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure angleChange(Sender: TObject);
    procedure Panel10Resize(Sender: TObject);
  private
    isCancel:boolean;
    tmpImage: TImage32;
    isRotateImg: Boolean;
//     CurrentCarPictureIndex:integer;
  private
     function  ShowPicture(Index:integer):boolean;overload;
     function  ShowPicture(AFileName:string):boolean;overload;
     procedure ShowPictureCar;

     procedure ScaleRot(Alpha: Single);

     procedure clearList;
//     procedure DeletePicFile;

    { Private declarations }
  public
    procedure CreateQueryPhoto;
    procedure  OnPicUpload(ADev:TObject;PicIndex:Integer;PicReson:Byte; pic: PicInfo);
    procedure AddPicList(AFileName:string;ANode:TcxTreeListNode); overload;
    procedure AddPicList(Data: Pointer; PicIndex: string; ANode: TcxTreeListNode); overload;
    { Public declarations }
  end;

var
  PictureFrm: TPictureFrm;
  ColumnToSort: integer;
  isascsort: boolean;
implementation
uses InTheMapAddressName,ConstDefineUnit,jpeg, umainf, QueryThreadUnit, Math;

var
  QueryPhoto: TQueryPhoto;
{$R *.dfm}

procedure TPictureFrm.BitBtnReceiveClick(Sender: TObject);
var
//  i:integer;
  fileName:string;
  info: PicInfo;
begin
  if NotReceivePictureList.Items.Count<=0 then exit;
  ProgressBar1.Max:=(NotReceivePictureList.Items.Count+1)*10;
  Application.ProcessMessages;
  ProgressBar1.StepIt;
  isCancel:=false;
  BitBtnReceive.Visible:=false;
  BitBtnCancel.Visible:=true;
  try
      while NotReceivePictureList.Items.Count>0 do
      begin
          try
              if isCancel then   break;

                  //fileName:=bs.QueryPhotoByDevAndPicIndex(TDevice(NotReceivePictureList.Items.Item[0].Data),
                  //                           StrToInt(NotReceivePictureList.Items.Item[0].Caption));

              //AddPicList(fileName, cxPicList.AddFirst);

              try
                info := PicInfo(NotReceivePictureList.Items.Item[0].data); //bs.QueryPhoteByPicIndex(strtoint(NotReceivePictureList.Items.Item[0].Caption));
              except
                on E: Exception do
                begin
                  messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
                  exit;
                end;
              end;

              if info = nil then
              begin
                MessageBox(self.Handle,'没有照片信息','提示',mb_ok + mb_iconinformation);
                Exit;
              end;   

              fileName := NotReceivePictureList.Items.Item[0].Caption;
              //AddPicList(NotReceivePictureList.Items.Item[0].Data ,NotReceivePictureList.Items.Item[0].Caption, cxPicList.AddFirst);
              AddPicList(info ,NotReceivePictureList.Items.Item[0].Caption, cxPicList.AddFirst);
              NotReceivePictureList.Items.Item[0].Delete;
              ProgressBar1.StepIt;
              Application.ProcessMessages;
          except

          end;
      end;
      if cxPicList.Count > 0 then
        ShowPicture(0);
  finally
      BitBtnReceive.Visible:=true;
      BitBtnCancel.Visible:=false;
      ProgressBar1.Position:=0;
  end;
end;

procedure TPictureFrm.BitBtnCancelClick(Sender: TObject);
begin
  isCancel:=true;
end;

procedure TPictureFrm.FormCreate(Sender: TObject);
var
  filename:string;
begin
  filename:=ExePath+'Photo\';
  if not DirectoryExists(fileName) then
    if not CreateDir(fileName) then
         raise Exception.Create('不能创建'+fileName+'目录');         
//  DeletePicFile;
//  ShowPictureCar;
  tmpImage := TImage32.Create(Panel10);
  tmpImage.AutoSize := True;
  tmpImage.Visible := False;
  isRotateImg := False;
end;


function TPictureFrm.ShowPicture(Index: integer):boolean;
var
  filename:string;
//  i,tmp:integer;
//  s:string;
begin
  Result:=false;
  if cxPicList.Count<=0 then exit;
  if(Index<0)or(Index>=cxPicList.Count)then exit;
  //filename:=cxPicList.Items[Index].Values[4];
  cxPicList.FocusedNode:=cxPicList.Items[Index];
  ShowPicture(IntToStr(index));

  Label1.Caption:=IntToStr(index+1)+'/'+IntToStr(cxPicList.Count);

  //ListBox1.ItemIndex:=CurrentCarPicture.Count-index-1;
end;

procedure TPictureFrm.BitBtnNextClick(Sender: TObject);
begin
  if cxPicList.Count<=0 then exit;
  if cxPicList.FocusedNode =nil then
      cxPicList.FocusedNode:=cxPicList.Items[0];

  ShowPicture(cxPicList.FocusedNode.Index+1);
end;

procedure TPictureFrm.BitBtnPrevClick(Sender: TObject);
begin
  if cxPicList.Count<=0 then exit;
  if cxPicList.FocusedNode =nil then
      cxPicList.FocusedNode:=cxPicList.Items[cxPicList.Count-1];
  ShowPicture(cxPicList.FocusedNode.Index-1);
end;



procedure TPictureFrm.FormResize(Sender: TObject);
begin
  if Self.Height>=300 then
  begin
    PanelPictureInfo.Align:=alNone;
    PanelPictureInfo.Parent:=PanelButton;
    PanelPictureInfo.Align:=alClient;
    PanelPictureInfo.Width:=140;
    Panel1.Align:=alTop;
    Panel1.Height:=160;
    Panel5.Align:=alNone;
    Panel5.Parent:=Panel9;
    Panel5.Align:=alClient;
  end;
  if Self.Height<300 then
  begin
    PanelPictureInfo.Align:=alNone;
    PanelPictureInfo.Parent:=Panel7;
    PanelPictureInfo.Align:=alRight;
    PanelPictureInfo.Width:=140;

    Splitter1.Align := alNone;
    Splitter1.Parent := Panel4;
    Splitter1.Align := alLeft;
    Splitter1.Visible := False;
    
    Panel5.Align:=alNone;
    Panel5.Parent:=Panel4;
    Panel5.Align:=alLeft;
    Panel1.Align:=alClient;
    Panel5.Width:=180;

    Panel9.Width:=180;
  end;
end;
procedure TPictureFrm.ShowPictureCar;
var
  i:integer; // ,tmp
//  s,s1:string;
  AllPicture:TStringList;
  node:TcxTreeListNode;
begin
  cxPicList.Clear;
  AllPicture:=TStringList.Create;
  try
    InTheMapAddressName.GetDIRAllFile(ExePath+'photo\','jpg',AllPicture);
    for i:=0 to AllPicture.Count-1 do
    begin
      node:=cxPicList.Add;
      //AddPicList(AllPicture.Strings[i],node);
    end;
  finally
     AllPicture.Free;
  end;
end;

procedure TPictureFrm.BitBtnReflashClick(Sender: TObject);
begin
  ShowPictureCar;
end;

procedure TPictureFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  BitBtnReceiveClick(nil);
  Mainf.show_Picture.Checked := False;
end;

procedure TPictureFrm.OnPicUpload(ADev: TObject; PicIndex: Integer;PicReson:Byte; pic: PicInfo);
var
  i: Integer;
begin
  for i:=0 to NotReceivePictureList.Items.Count-1 do
  begin
    if PicIndex = strtoint(NotReceivePictureList.Items.Item[i].Caption) then
      Exit
  end;
  
  with NotReceivePictureList.Items.Add  do
  begin
    Caption:=IntToStr(PicIndex);
    Data:= pic;//ADev;
    SubItems.Add(TDevice(ADev).Car.No);
    SubItems.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss', Now));//ReturnUploadPicReason(PicReson));
  end;
  BitBtnReceive.Click;
//  if GlobalParam.IsPhotoShowhit then
//    PopMsg('来照片了', TDevice(ADev).Car.No + '来照片了');
end;

function TPictureFrm.ShowPicture(AFileName: string): boolean;
var
  filename:string;
  i,tmp:integer;
  s:string;
  ms : TMemoryStream;
  jpegfile : TJPEGImage;
  buf:array of byte;
  info: PicInfo;
begin
  Result:=false;
  {filename:=ExtractFileName(AFileName);
  if not FileExists(AFileName) then
  begin
      exit;
  end;
  edit1.Text:=AFileName; }
  try
      Panel10.Caption:='';
     { info := bs.QueryPhoteByPicIndex(strtoint(AFileName));
      if info = nil then
      begin
        MessageBox(self.Handle,'没有照片信息','提示',mb_ok + mb_iconinformation);
        Exit;
      end; }
      info := PicInfo(cxPicList.Items[StrToInt(AFileName)].Data);
      ms := TMemoryStream.Create;
      jpegfile := TJPEGImage.Create;
      try
        Image1.Picture.Graphic := nil;
        ms.Write(info.Photo[0],length(info.Photo));
        ms.Position := 0;
//        Image1.Picture.Graphic.LoadFromStream(ms);
        jpegfile.LoadFromStream(ms);
        Image1.Picture.Graphic := jpegfile;

        tmpImage.Bitmap.Assign(jpegfile);
//        tmpImage.Bitmap.LoadFromFile(jpegfile.GetNamePath);
        angle.Enabled := True;
        Image321.Bitmap.SetSize(tmpImage.Bitmap.Width, tmpImage.Bitmap.Height);
        //Image321.Bitmap.SetSize(320, 240);
        SetBorderTransparent(tmpImage.Bitmap, tmpImage.Bitmap.BoundsRect);
        angle.Position := 0;
        ScaleRot(0);

        LabeledEditCarNO.Text := ADeviceManage.FindToCarNO(info.Dev_id); //cxPicList.Items[Index].Values[0];

        if info.GpsTime <> '' then
          LabeledEditTime.Text := info.GpsTime
        else
          LabeledEditTime.Text := FormatDateTime('yyyy-MM-dd hh:nn:ss', Now);

        LabeledEditReason.Text := cxPicList.Items[StrToInt(AFileName)].Values[2];
        LabeledEditPostion.Text := cxPicList.Items[StrToInt(AFileName)].Values[3];
      finally
        ms.free;
        jpegfile.Free;
      end;
      //Image1.Picture.LoadFromFile(AFileName);//载入图片文件
  except
    tmpImage.Bitmap.Clear;
    Image321.Bitmap.Clear;
    angle.Enabled := False;
    isRotateImg := False;
//     Image1.Picture.Bitmap.FreeImage;
     Panel10.Caption:='照片错误';
      //Label1.Caption:=IntToStr(CurrentCarPicture.Count-index)+'/'+IntToStr(CurrentCarPicture.Count);
  end;
  Result:=true;
 { i:=pos('_',filename);
  LabeledEditCarNO.Text:=ExtractFileName(copy(filename,1,i-1));//车牌号
  filename:=copy(filename,i+1,Length(filename)-i);
  i:=pos('_',filename);
  s:=copy(filename,1,i-1);//拍照时间
  LabeledEditTime.Text:=copy(s,1,2)+'-'+copy(s,3,2)+'-'+copy(s,5,2)+' '+copy(s,7,2)+':'+copy(s,9,2)+':'+copy(s,11,2);
  filename:=copy(filename,i+1,Length(filename)-i);
  i:=pos('_',filename);
  try
    tmp:=StrToInt(copy(filename,1,i-1)); //拍照原因
  except
    tmp:=$ff;
  end;
  LabeledEditReason.Text:=ReturnUploadPicReason(tmp);
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
  LabeledEditPostion.Text:=s;  }
end;

{procedure TPictureFrm.DeletePicFile;
var
  i,tmp:integer;
  s:string;
  datetime:TDateTime;
begin
  if(AllPicture.Count>1000)then
  begin
     i:=0;
     while i<AllPicture.Count do
     begin
        datetime:=FileDateToDateTime(FileAge(AllPicture.Strings[i]));
        if DaysBetween(datetime,now)>30 then
        begin
            DeleteFile(AllPicture.Strings[i]);
            AllPicture.Delete(i);
        end
        else
        begin
            inc(i);
        end;
     end;
  end;
end;
         }


procedure TPictureFrm.AddPicList(Data: Pointer; PicIndex: string; ANode: TcxTreeListNode);
var
  //dev: TDevice;
  info: PicInfo;
begin
  info := PicInfo(Data);
  //dev := TDevice(Data);

  try
//      cxPicList.SortedColumns[1].SortOrder:=soNone;
      cxDeviceListcxTreeListColumn2.SortOrder:=soNone;
      ANode.Data := Data;
      ANode.Values[0] := ADeviceManage.FindToCarNO(info.Dev_id);
      if info.GpsTime <> '' then
        ANode.Values[1] :=  info.GpsTime
      else
        ANode.Values[1] := FormatDateTime('yyyy-MM-dd hh:nn:ss', Now);
      case info.PhotoReasonID of
        0: ANode.Values[2] := '平台下发';
        1: ANode.Values[2] := '定时动作';
        2: ANode.Values[2] := '抢劫报警';
        3: ANode.Values[2] := '碰撞侧翻报警';
        4: ANode.Values[2] := '疲劳报警';
      else
        begin
          ANode.Values[2] :=  '不明原因';
        end;
      end;
      case info.CameraNo of
        1:  ANode.Values[3] :=  '司机上方';
        2:  ANode.Values[3] :=  '前门';
        3:  ANode.Values[3] :=  '前车厢';
        4:  ANode.Values[3] :=  '后车厢';
        5:  ANode.Values[3] :=  '前车外';
      else
        begin
          ANode.Values[3] :=  '未知';
        end;
      end;
      ANode.Values[4]:=PicIndex;//文件名
      ANode.Values[5]:=info.takeBeginTime;//上传时间
      cxDeviceListcxTreeListColumn2.SortOrder:=soDescending;
  except
      ANode.Delete;
  end;
end;

procedure TPictureFrm.AddPicList(AFileName: string;
  ANode: TcxTreeListNode);
var
  s:string;
  fileName:string;
  i,tmp:integer;
begin
  if AFileName='' then
  begin
      ANode.Delete;
      exit;
  end;
  try
//      cxPicList.SortedColumns[1].SortOrder:=soNone;
      cxDeviceListcxTreeListColumn2.SortOrder:=soNone;
     { fileName:=ExtractFileName(AFileName);
      i:=pos('_',filename);
      s:=copy(filename,1,i-1);//车牌号
      ANode.Values[0]:=s;
      filename:=copy(filename,i+1,Length(filename)-i);
      i:=pos('_',filename);
      s:=copy(filename,1,i-1);//拍照时间
      ANode.Values[1]:=copy(s,1,2)+'-'+copy(s,3,2)+'-'+copy(s,5,2)+' '+copy(s,7,2)+':'+copy(s,9,2)+':'+copy(s,11,2);
      filename:=copy(filename,i+1,Length(filename)-i);


      i:=pos('_',filename);
      try
        tmp:=StrToInt(copy(filename,1,i-1)); //拍照原因
      except
        tmp:=$ff;
      end;
      ANode.Values[2]:=ReturnUploadPicReason(tmp);    //拍照原因
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
      end;     }
      ANode.Values[3]:=s;        //拍照位置
      ANode.Values[4]:=AFileName;//文件名
      cxDeviceListcxTreeListColumn2.SortOrder:=soDescending;
//      cxPicList.SortedColumns[1].SortOrder:=soDescending;
  except
      ANode.Delete;
  end;
end;

procedure TPictureFrm.Panel12Resize(Sender: TObject);
begin
  edit1.Width:=Panel12.Width;
end;

procedure TPictureFrm.cxPicListChange(Sender: TObject);
var
  Node: TcxTreeListNode;
begin
  //ShowPicture('20');
  node:=cxPicList.FocusedNode;
  if  node=nil then exit;
  ShowPicture(node.Index);
end;

procedure TPictureFrm.BitBtnDelClick(Sender: TObject);
var
  Node: TcxTreeListNode;
  s:string;
begin
  node:=cxPicList.FocusedNode;
  if node=nil then
  begin
      MessageBox(self.Handle,'请选择一张照片','提示',mb_ok + mb_iconinformation);
      exit;
  end;
  s:='确定要删除'+node.Values[4]+'?';
  if MessageBox(Self.Handle,PChar(s),PChar('提示'),MB_OKCANCEL + MB_ICONQUESTION)=ID_CANCEL then
  begin
      exit;
  end;
  if FileExists(node.Values[4]) then
  begin
      DeleteFile(node.Values[4]);
  end;
  node.Delete;
  Image1.Picture.Graphic := nil;
  LabeledEditCarNO.Text := '';
  LabeledEditTime.Text := '';
  LabeledEditReason.Text := '';
  LabeledEditPostion.Text := '';
end;

procedure TPictureFrm.BitBtnDelAllClick(Sender: TObject);
var
  Node: TcxTreeListNode;
//  i:integer;
begin
  if cxPicList.Count<=0 then
  begin
      MessageBox(self.Handle,'没有可删除的照片','提示',mb_ok + mb_iconinformation);
      exit;
  end;
  if MessageBox(Self.Handle,PChar('确定全部删除?'),PChar('提示'),MB_OKCANCEL + MB_ICONQUESTION)=ID_CANCEL then
  begin
      exit;
  end;
  while cxPicList.Count>0 do
  begin
      Node:=cxPicList.Items[0];
      if FileExists(node.Values[4]) then
      begin
          DeleteFile(node.Values[4]);
      end;
      node.Delete;
  end;
  Image1.Picture.Graphic := nil;
  LabeledEditCarNO.Text := '';
  LabeledEditTime.Text := '';
  LabeledEditReason.Text := '';
  LabeledEditPostion.Text := '';

end;

procedure TPictureFrm.CreateQueryPhoto;
begin
  QueryPhoto := TQueryPhoto.Create();
end;

procedure TPictureFrm.FormDestroy(Sender: TObject);
begin
  QueryPhoto.Terminate;
  QueryPhoto.WaitFor;
  //QueryPhoto.Free;
  tmpImage.Free;
  clearList;
end;

procedure TPictureFrm.ScaleRot(Alpha: Single);
var
  SrcR: Integer;
  SrcB: Integer;
  T: TAffineTransformation;
  Sx, Sy, Scale: Single;
begin
  SrcR := tmpImage.Bitmap.Width - 1;
  SrcB := tmpImage.Bitmap.Height - 1;
  T := TAffineTransformation.Create;
  T.SrcRect := FloatRect(0, 0, SrcR + 1, SrcB + 1);
  try
    // shift the origin
    T.Clear;

    // move the origin to a center for scaling and rotation
    T.Translate(-SrcR * 0.5, -SrcB * 0.5);
    T.Rotate(0, 0, Alpha);
    Alpha := Alpha * PI / 180;

    // get the width and height of rotated image (without scaling)
    Sx := Abs(SrcR * Cos(Alpha)) + Abs(SrcB * Sin(Alpha));
    Sy := Abs(SrcR * Sin(Alpha)) + Abs(SrcB * Cos(Alpha));

    // calculate a new scale so that the image fits in original boundaries
    Sx := tmpImage.Bitmap.Width / Sx;
    Sy := tmpImage.Bitmap.Height / Sy;
    scale := Min(Sx, Sy);

    T.Scale(Scale, Scale);

    // move the origin back
    T.Translate(SrcR * 0.5, SrcB * 0.5);

    // transform the bitmap
    Image321.BeginUpdate;
    Image321.Bitmap.Clear(clBlack32);
    Transform(Image321.Bitmap, tmpImage.Bitmap, T);
    Image321.EndUpdate;
    Image321.Repaint;
  finally
    T.Free;
  end;
end;

procedure TPictureFrm.angleChange(Sender: TObject);
begin
  ScaleRot(-Angle.Position);
end;


procedure TPictureFrm.Panel10Resize(Sender: TObject);
begin
  if Panel10.Width > 320 then
  begin
    RzBorder1.Width := (Panel10.Width - 320) div 2;
    RzBorder4.Width := RzBorder1.Width;
  end
  else
  begin
    RzBorder1.Width := 0;
    RzBorder4.Width := 0;
  end;

  if Panel10.Height > 240 + Panel13.Height * 2 then
  begin
    RzBorder3.Height := (Panel10.Height - 240) div 2;
    RzPanel1.Height := RzBorder3.Height;
  end
  else
  begin
    RzPanel1.Height := Panel13.Height;
    RzBorder3.Height := 0;
  end;
end;

procedure TPictureFrm.clearList;
var
  pic: PicInfo;
begin
  while cxPicList.Count > 0 do
  begin
    pic := PicInfo(cxPicList.Items[0].Data);
    if pic <> nil then
      pic.Free;
    cxPicList.Items[0].Delete;
  end;  
end;

end.




