unit FrmQueryPhotoPosUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit, StdCtrls,
  Mask, RzEdit, RzButton, cxInplaceContainer, Buttons, ComCtrls,
  cxControls, cxSplitter, ExtCtrls, RzBorder, OleCtrls, SHDocVw, CarUnit,
  Service, RzLabel, RzPanel, ExternalContainer, cxContainer, cxEdit,
  cxImage, Menus;

type
  TfrmQueryPhotoPos = class(TForm)
    Panel7: TPanel;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    TreeView1: TTreeView;
    PanelSelectGroupName: TPanel;
    cxSplitter1: TcxSplitter;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    Panel5: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    cxTreeList1: TcxTreeList;
    cxDeviceListcxTreeListColumn3: TcxTreeListColumn;
    cxDeviceListcxTreeListColumn4: TcxTreeListColumn;
    cxPicListcxTreeListColumn2: TcxTreeListColumn;
    cxPicListcxTreeListColumn3: TcxTreeListColumn;
    cxPicListcxTreeListColumn4: TcxTreeListColumn;
    Label4: TLabel;
    ComboBox2: TComboBox;
    btnQuery: TRzBitBtn;
    RzBitBtn1: TRzBitBtn;
    cxTreeList1cxTreeListColumn1: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn2: TcxTreeListColumn;
    RzPanel2: TRzPanel;
    Panel6: TPanel;
    RzPanel1: TRzPanel;
    RzLabel1: TRzLabel;
    WebBrowser1: TWebBrowser;
    RzPanel3: TRzPanel;
    lblAlarmDataCountTip: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    cbxPageSize: TComboBox;
    edtCurrPageNo: TRzEdit;
    edtTotalPageCount: TRzEdit;
    ScrollBox1: TScrollBox;
    RzPanel4: TRzPanel;
    cxImage1: TcxImage;
    lblSpeed1: TRzLabel;
    lblGpsTime1: TRzLabel;
    RzPanel5: TRzPanel;
    lblSpeed2: TRzLabel;
    lblGpsTime2: TRzLabel;
    cxImage2: TcxImage;
    RzPanel6: TRzPanel;
    lblSpeed3: TRzLabel;
    lblGpsTime3: TRzLabel;
    cxImage3: TcxImage;
    RzPanel7: TRzPanel;
    lblSpeed4: TRzLabel;
    lblGpsTime4: TRzLabel;
    cxImage4: TcxImage;
    btnPageFirst: TRzBitBtn;
    btnPagePrevious: TRzBitBtn;
    btnPageNext: TRzBitBtn;
    btnPageLast: TRzBitBtn;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    cxTreeList1cxTreeListColumn3: TcxTreeListColumn;
    PopupMenu1: TPopupMenu;
    S1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure cbxPageSizeChange(Sender: TObject);
    procedure btnPageFirstClick(Sender: TObject);
    procedure btnPagePreviousClick(Sender: TObject);
    procedure btnPageNextClick(Sender: TObject);
    procedure btnPageLastClick(Sender: TObject);
    procedure edtCurrPageNoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCurrPageNoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnQueryClick(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Panel6CanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure WebBrowser1DocumentComplete(Sender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
    procedure cxTreeList1Click(Sender: TObject);
    procedure cxTreeList1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxImage1Click(Sender: TObject);
    procedure cxImage1DblClick(Sender: TObject);
    procedure S1Click(Sender: TObject);
  private
    { Private declarations }
    f: TExternalContainer;
    FCxImages: array of TcxImage;
    FLblGpsTime: array of TRzLabel;
    FLblSpeed: array of TRzLabel;
    procedure refreshTotalDataCount();
    procedure refreshPageNo();

    procedure queryDataByPage(pageNo: Integer);

    procedure DoOnQueryCount(DataCount: Integer);
    procedure DoOnQueryData(AInfo: ArrayOfPicInfo);

    procedure showPhotos;
    procedure locate(node: TcxTreeListNode);
    procedure showLargePhoto(node: TCxtreeListNode);
    procedure showMap;
  public
    { Public declarations }
    procedure AddDev(id: integer; ANode: TTreeNode);
  end;

var
  frmQueryPhotoPos: TfrmQueryPhotoPos;

  group_id: integer = -1;
  group_paranet: string = '';
  fact_id: Integer = -1;
  dev_id: Integer = -1;
  ReasonId: Integer = -1;

  queryMediaType: Integer = 0;
  querySTime: string;
  queryETime: string;
  queryPhotoReason: Integer;
  queryCamerano: Integer = -1;
  queryCarNo: string = '';
  querySim_no: string = '';
  queryDevId: string;
  queryGroupId: Integer;
  queryGroupList: string;

  pageSize: Integer = 4;     //每页大小
  totalPageCount: Integer = 0;//总页数
  currPageNo: Integer = 0;    //当前页码
  totalDataCount: Integer = 0;//总记录数

implementation
uses
  uGloabVar, BusinessServerUnit, ConstDefineUnit, SimplePicFrmUnit, jpeg, Math,
  MSHTML;

{$R *.dfm}

procedure TfrmQueryPhotoPos.AddDev(id: integer; ANode: TTreeNode);
var
  i: integer;
  dev: TDevice;
begin
  try
   // ComboBox2.Items.Clear;
    ComboBox1.ItemIndex := -1;

    for i := 0 to ADeviceManage.Count - 1 do
    begin
      dev := ADeviceManage.Items[i];
      if dev = nil then Continue;
      if dev.GroupID= id then
      begin
        ComboBox1.Items.AddObject(dev.Car.No,dev);
      end;
    end;
  finally
  end;
end;

procedure TfrmQueryPhotoPos.FormCreate(Sender: TObject);
    function ListSon(ASonId:integer;Anode:TTreeNode;leastCnt:integer):integer;
    var
      grp       : TDevGroup;
      leaf_node : TTreeNode;
      j,sonId   : integer;
    begin
      grp:= ADevGroupManage.Find(AsonId);
      leaf_node :=  treeview1.Items.AddChild(
          Anode,grp.name+'('+inttostr(grp.DevListCount)+')');
      leaf_node.Data := pointer(grp.Id);
      leastCnt := leastCnt -1;
      result:=leastCnt;
      if leastCnt =0 then exit;

      if not grp.leaf_nod then
        for j:= 0 to grp.SonListCount -1 do
        begin
          sonId := grp.SonList[j];
          ListSon(sonId,leaf_node,leastCnt);
        end;       
    end;
    procedure group_list(AParant_ID:integer;Anode:TTreenode;Acurrent_cnt:integer);
      var
        i,j:integer;
        sonId: integer;           //子级的 组ID
        leaf_node: TTreenode;     //子级的节点
        grp : TDevGroup;
      begin
        for i:= 0 to ADevGroupManage.Count -1 do
        begin
          if Acurrent_cnt =0 then exit;
          grp :=ADevGroupManage.Items[i];
          //列出大组--父为0
          if grp.parent =AParant_ID then
          begin
            leaf_node :=  treeview1.Items.AddChild(
              Anode,grp.name+'('+inttostr(grp.DevListCount)+')');
            leaf_node.Data := pointer(grp.Id);
            Acurrent_cnt := Acurrent_cnt -1;
            if Acurrent_cnt =0 then exit;

            if not grp.leaf_nod then
              for j:= 0 to grp.SonListCount -1 do
              begin
                sonId := grp.SonList[j];
                Acurrent_cnt := ListSon(sonId,leaf_node,Acurrent_cnt);
              end;
          end;
        end;
      end;
var
  i,j:integer;
  vn_node: TTreeNode;
  cnt: integer;
begin

  TreeView1.AutoExpand := true;
  TreeView1.Items.Clear;
  if ADevGroupManage.Count = 0 then exit;
  vn_node := TreeView1.Items.add(TreeView1.topitem, '所有车辆');
  vn_node.Data := Pointer(-1); //所有车辆
  vn_node.Expanded := true;
  cnt := ADevGroupManage.Count;
  group_list(0,vn_node,cnt);

  for i:=0 to ADeviceManage.Count-1 do
  begin
    ComboBox1.AddItem(ADeviceManage.Items[i].Car.No,ADeviceManage.Items[i]);
  end;
  if GCurSelectDev <> nil then
    ComboBox1.Text := GCurSelectDev.Car.No;
  DateTimePicker1.Date:=now;
  DateTimePicker2.Time:=StrToTime('00:00:00');
  DateTimePicker3.Date:=now;
  DateTimePicker4.Time:=StrToTime('23:59:59');

  f := TExternalContainer.Create(WebBrowser1);

  SetLength(FCxImages, 4);
  SetLength(FLblGpsTime, 4);
  SetLength(FLblSpeed, 4);
  FCxImages[0] := cxImage1;
  FCxImages[1] := cxImage2;
  FCxImages[2] := cxImage3;
  FCxImages[3] := cxImage4;

  FLblGpsTime[0] := lblGpsTime1;
  FLblGpsTime[1] := lblGpsTime2;
  FLblGpsTime[2] := lblGpsTime3;
  FLblGpsTime[3] := lblGpsTime4;

  FLblSpeed[0] := lblSpeed1;
  FLblSpeed[1] := lblSpeed2;
  FLblSpeed[2] := lblSpeed3;
  FLblSpeed[3] := lblSpeed4;
end;

procedure TfrmQueryPhotoPos.TreeView1Click(Sender: TObject);
var
  devGrp: TDevGroup;
  Node: TTreeNode;
  i: Integer;
begin
  Node := TreeView1.Selected;
  if Node = nil then exit;
  group_id := Integer(Node.Data);
  PanelSelectGroupName.Caption := Node.Text;
  group_paranet := '';

  ComboBox1.Clear;
  if (group_id >= 0) then //and (not IsClickDev) and (grpId <> clickParent) then
  begin
    AddDev(group_id, Node);
    devGrp := ADevGroupManage.find(group_id);
    if not devGrp.leaf_nod then //==  说明父节点
    begin
      if devGrp.SonList.Count > 0 then
      begin
        for i := 0 to devGrp.SonList.Count - 1 do
        begin
          AddDev(devgrp.SonListItems[i], Node);
          if i = 0 then
            group_paranet := inttostr(devgrp.SonListItems[i])
          else
            group_paranet := group_paranet + ',' + inttostr(devgrp.SonListItems[i]);
        end;
      end
      else
        group_paranet:='';
    end;
  end;
  if group_paranet<>'' then group_id := -1;
end;

procedure TfrmQueryPhotoPos.cbxPageSizeChange(Sender: TObject);
begin
  pageSize := StrToInt(cbxPageSize.Text);
  btnQuery.Click;
end;

procedure TfrmQueryPhotoPos.btnPageFirstClick(Sender: TObject);
begin
  if currPageNo <= 1 then Exit;

  cxTreeList1.Clear;
  queryDataByPage(1);
end;

procedure TfrmQueryPhotoPos.queryDataByPage(pageNo: Integer);
var
  queryMediaDataThread: TQueryMediaData;
begin
  queryMediaDataThread := TQueryMediaData.Create(queryMediaType, querySTime, queryETime, queryPhotoReason, queryCamerano, queryCarNo,
                                                  querySim_no, queryDevId, queryGroupId, queryGroupList, pageSize, pageNo);
  queryMediaDataThread.OnQueryData := DoOnQueryData;
  currPageNo := pageNo;
end;

procedure TfrmQueryPhotoPos.refreshPageNo;
begin
  edtCurrPageNo.Text := IntToStr(currPageNo);
  edtTotalPageCount.Text := IntToStr(totalPageCount);
end;

procedure TfrmQueryPhotoPos.refreshTotalDataCount;
begin
  lblAlarmDataCountTip.Caption := '共' + IntToStr(totalDataCount) + '条记录';
end;

procedure TfrmQueryPhotoPos.btnPagePreviousClick(Sender: TObject);
begin
  if currPageNo <= 1 then Exit;

  cxTreeList1.Clear;
  queryDataByPage(currPageNo - 1);
end;

procedure TfrmQueryPhotoPos.btnPageNextClick(Sender: TObject);
begin
  if currPageNo >= totalPageCount then Exit;

  cxTreeList1.Clear;
  queryDataByPage(currPageNo + 1);
end;

procedure TfrmQueryPhotoPos.btnPageLastClick(Sender: TObject);
begin
  if currPageNo >= totalPageCount then Exit;

  cxTreeList1.Clear;
  queryDataByPage(totalPageCount);
end;

procedure TfrmQueryPhotoPos.edtCurrPageNoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then Key := #0;
end;

procedure TfrmQueryPhotoPos.edtCurrPageNoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  i: Integer;
begin
  if Key = 13 then
  begin
    i := StrToInt(edtCurrPageNo.Text);
    if (i <= 0) or (i > totalPageCount) or (i = currPageNo) then Exit;

    cxTreeList1.Clear;
    queryDataByPage(i);
  end;
end;

procedure TfrmQueryPhotoPos.btnQueryClick(Sender: TObject);
var
  fromDate, ToDate: TDateTime;
  dev:TDevice;
  queryCountThread: TQueryMediaCount;
begin
  fromDate := DateTimePicker1.Date;
  ReplaceTime(fromDate, DateTimePicker2.Time);

  ToDate := DateTimePicker3.Date;
  ReplaceTime(ToDate, DateTimePicker4.Time);

  if FromDate > ToDate then
  begin
    ShowTips('开始时间应小于结束时间，请检查！', DateTimePicker3);
    DateTimePicker3.SetFocus;
    exit;
  end;

  totalDataCount := 0;
  totalPageCount := 0;
  currPageNo := 0;
  refreshTotalDataCount;
  refreshPageNo;
  cxTreeList1.Clear;  

  querySTime := FormatDateTime('yyyy-MM-dd hh:nn:ss', fromDate);
  queryETime := FormatDateTime('yyyy-MM-dd hh:nn:ss', ToDate);

  if ComboBox1.ItemIndex < 0 then
  begin
    dev := nil;
    queryDevId := '';
  end
  else
  begin
    dev := TDevice(ComboBox1.Items.Objects[ComboBox1.ItemIndex]);
    queryDevId := dev.IdStr;
  end;
  queryPhotoReason := ComboBox2.ItemIndex - 1;
  queryGroupId := group_id;
  queryGroupList := group_paranet;

  queryCountThread := TQueryMediaCount.Create(queryMediaType, querySTime, queryETime, queryPhotoReason, queryCamerano,
                                              queryCarNo, querySim_no, queryDevId, queryGroupId, queryGroupList);
  queryCountThread.OnQueryCount := DoOnQueryCount;
end;

procedure TfrmQueryPhotoPos.DoOnQueryCount(DataCount: Integer);
var
  queryMediaDataThread: TQueryMediaData;
begin
  try
    if DataCount <= 0 then
    begin
      MessageBox(Handle,'对不起，没有符合条件的数据！','提示',MB_OK + MB_ICONINFORMATION);
      Exit;
    end
    else
    begin
      if DataCount mod pageSize <> 0 then
        totalPageCount := DataCount div pageSize + 1
      else
        totalPageCount := DataCount div pageSize;

      totalDataCount := DataCount;
      edtTotalPageCount.Text := IntToStr(totalPageCount)
    end;
    queryMediaDataThread := TQueryMediaData.Create(queryMediaType, querySTime, queryETime, queryPhotoReason, queryCamerano, queryCarNo,
                                                    querySim_no, queryDevId, queryGroupId, queryGroupList, pageSize, currPageNo + 1);
    queryMediaDataThread.OnQueryData := DoOnQueryData;
    currPageNo := 1;
    refreshTotalDataCount;
  except
    on E: Exception do
    begin
      MessageBox(Handle, '查询失败', '提示', MB_OK + MB_ICONINFORMATION);
      exit;
    end;
  end;
end;

procedure TfrmQueryPhotoPos.DoOnQueryData(AInfo: ArrayOfPicInfo);
var
  PicInfoBuf: ArrayOfPicInfo;
  i, j: Integer;
  s: string;
  node: TcxTreeListNode;
begin
  cxTreeList1.Clear;
  
  PicInfoBuf := AInfo;
  if PicInfoBuf = nil then
  begin
    MessageBox(self.Handle, '无满足该查询条件的多媒体信息!', '提示', mb_iconinformation + mb_ok);
    Exit;
  end;

  for i:=0 to Length(PicInfoBuf)-1 do
  begin
    node := cxTreeList1.Add;
    try
      node.Data := picInfoBuf[i];
      node.Values[0] := IntToStr(i + 1);
      node.Values[1] :=  picInfoBuf[i].car_No;
      node.Values[2] := picInfoBuf[i].GpsTime;
      j := picInfoBuf[i].PhotoReasonID;
      node.Values[3]:= ReturnUploadPicReason(j);
      j:=picInfoBuf[i].CameraNo;
      case j of
        1: s := '司机上方';
        2: s := '前门';
        3: s := '前车厢';
        4: s := '后车厢';
        5: s := '前车外';
      else
        s := '未知';
      end;
      node.Values[4]:= s;
      node.Values[5] := FormatFloat('0.000000', picInfoBuf[i].longitude);
      node.Values[6] := FormatFloat('0.000000', picInfoBuf[i].latitude);
      node.Values[7] := FormatFloat('0.#', picInfoBuf[i].speed);
    except
        node.Delete;
    end;
  end;
  edtCurrPageNo.Text := IntToStr(currPageNo);
  showPhotos;
end;

procedure TfrmQueryPhotoPos.RzBitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmQueryPhotoPos.FormShow(Sender: TObject);
begin
  showMap;
end;

procedure TfrmQueryPhotoPos.FormDestroy(Sender: TObject);
begin
  f.Free;
end;

procedure TfrmQueryPhotoPos.Panel6CanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  try
    WebBrowser1.OleObject.document.parentWindow.SetMapDiv(NewWidth, NewHeight);
  except
  end;
end;

procedure TfrmQueryPhotoPos.WebBrowser1DocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
var
  s: string;
begin
  s := (WebBrowser1.Document as IHTMLDocument2).body.innerText;
  if (Pos('HTTP Status 404', s) > 0) then
  begin
    showMap;
    Exit;
  end;

  WebBrowser1.OleObject.Document.Body.Scroll := 'no';
  WebBrowser1.OleObject.Document.Body.style.border := 'none';
  webbrowser1.OleObject.Document.Body.Style.margin := '0px';
  if (cxSplitter1.State = ssOpened) then
  begin
    cxSplitter1.CloseSplitter;
    cxSplitter1.OpenSplitter;
  end;
end;

procedure TfrmQueryPhotoPos.cxTreeList1Click(Sender: TObject);
var
  node: TcxTreeListNode;
  pic: PicInfo;
begin
  node := cxTreeList1.FocusedNode;
  if (node.Index >= 0) and (node.Index < Length(FCxImages)) then
  begin
    FCxImages[node.Index].SetFocus;
  end;
  locate(node);
end;

procedure TfrmQueryPhotoPos.cxTreeList1DblClick(Sender: TObject);
var
  node: TcxTreeListNode;
begin
  Exit;
  node := cxTreeList1.FocusedNode;
  
end;

procedure TfrmQueryPhotoPos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ManualDock(nil);
end;

procedure TfrmQueryPhotoPos.showPhotos;
var
  i: Integer;
  c: Integer;
  node: TcxTreeListNode;
  pic: PicInfo;
  ms : TMemoryStream;
  jpegfile : TJPEGImage;  
begin
  for i := 0 to Length(FCxImages) - 1 do
  begin
    FCxImages[i].Clear;
    FLblGpsTime[i].Caption := '';
    FLblSpeed[i].Caption := '';
  end;
  c := Math.Min(4, cxTreeList1.Count);
  for i := 0 to c - 1 do
  begin
    node := cxTreeList1.Nodes[i];
    pic := PicInfo(node.Data);
    if pic <> nil then
    begin
      ms := TMemoryStream.Create;
      jpegfile := TJPEGImage.Create;
      try
        try
          //picFrm.Image1.Picture.Graphic := nil;
          ms.Write(pic.Photo[0],length(pic.Photo));
          ms.Position := 0;
          jpegfile.LoadFromStream(ms);
          FCxImages[i].Picture.Graphic := jpegfile;
          FLblGpsTime[i].Caption := ' 时间：' + pic.GpsTime;
          FLblSpeed[i].Caption := ' 速度：' + FormatFloat('0.#', pic.speed) + 'km/h';
          if pic.PhotoReasonID = 4 then
          begin
            FLblGpsTime[i].Font.Color := clRed;
            FLblSpeed[i].Font.Color := clRed;
          end
          else
          begin
            FLblGpsTime[i].Font.Color := $00408000;
            FLblSpeed[i].Font.Color := $00408000;
          end;    
        except
          FCxImages[i].Picture.Bitmap.FreeImage;
        end;
      finally
        ms.free;
        jpegfile.Free;
      end;
    end;
  end;
end;

procedure TfrmQueryPhotoPos.cxImage1Click(Sender: TObject);
var
  cxImage: TcxImage;
  node: TcxTreeListNode;
begin
  try
    cxImage := Sender as TcxImage;
    if (cxImage <> nil) then
    begin
      node := cxTreeList1.Nodes.Items[StrToInt(Copy(cxImage.Name, 8, 1)) - 1];
      node.Focused := True;
      locate(node);
    end;
  except

  end;
//
end;

procedure TfrmQueryPhotoPos.locate(node: TcxTreeListNode);
var
  pic: PicInfo;
  longitude, latitude: Double;
begin
  pic := PicInfo(node.Data);
  if (pic <> nil) then
  begin
    longitude := pic.longitude;
    latitude := pic.latitude;
    if (longitude > 0) and (longitude < 180) and (latitude > 0) and (latitude < 90) then
    begin
      try
        //WebBrowser1.OleObject.document.parentWindow.Locate_Map(longitude, latitude, 14);
        WebBrowser1.OleObject.document.parentWindow.LocalAPoint(longitude, latitude, '', '', 14);
      except

      end;
    end;
  end;
end;

procedure TfrmQueryPhotoPos.showLargePhoto(node: TCxtreeListNode);
var
  pic: PicInfo;
  picFrm: TSimplePicFrm;
  ms : TMemoryStream;
  jpegfile : TJPEGImage;
begin
  if node = nil then
    Exit;
  pic := PicInfo(node.Data);
  picFrm := TSimplePicFrm.Create(nil);
  try
    picFrm.photoTip := '';
    if (pic <> nil) then
    begin
      ms := TMemoryStream.Create;
      jpegfile := TJPEGImage.Create;
      try
        try
          //picFrm.Image1.Picture.Graphic := nil;
          ms.Write(pic.Photo[0],length(pic.Photo));
          ms.Position := 0;
          jpegfile.LoadFromStream(ms);
          picFrm.Image1.Picture.Graphic := jpegfile;
        except
          picFrm.Image1.Visible := False;
          picFrm.Image3.Visible := True;
          //picFrm.Image1.Picture.Bitmap.FreeImage;
        end;
        picFrm.photoTip := pic.car_No + '_' + FormatDateTime('yyyyMMdd-hhnnss', StrToDateTime(pic.GpsTime));
        picFrm.ShowModal;
      finally
        ms.free;
        jpegfile.Free;
      end;
    end
    else
    begin
      picFrm.ShowModal;
    end;
  finally
    picFrm.Free;
  end;
end;

procedure TfrmQueryPhotoPos.cxImage1DblClick(Sender: TObject);
begin
  showLargePhoto(cxTreeList1.FocusedNode);
end;

procedure TfrmQueryPhotoPos.showMap;
var
  url: string;
begin
  try
    url := 'http://'+ GlobalParam.MapServerIp;
    if GlobalParam.MapServerPort <> 0 then
      url := url + ':' + IntToStr(GlobalParam.MapServerPort);
    url := url + '/ZDJKmap.html';
    WebBrowser1.Navigate(url);
  except on E: Exception do
    begin
      ShowMessage(E.Message);
    end;
  end;
end;

procedure TfrmQueryPhotoPos.S1Click(Sender: TObject);
var
  cxImage: TcxImage;
  node: TcxTreeListNode;
  pic: PicInfo;
  imgIndex: Integer;
  fileName: string;
begin
  cxImage := PopupMenu1.PopupComponent as TcxImage;
  if (cxImage <> nil) then
  begin
    try
      imgIndex := StrToInt(Copy(cxImage.Name, 8, 1)) - 1;
      node := cxTreeList1.Nodes[imgIndex];
      if node <> nil then
      begin
        pic := PicInfo(node.Data);
        if (pic <> nil) then
        begin
          fileName := pic.car_No + '_' + FormatDateTime('yyyyMMdd-hhnnss', StrToDateTime(pic.GpsTime));
          cxImage.Picture.SaveToFile(ExePath + 'Photo\' + fileName + '.jpg');
          ShowTips('保存成功！'#13#10 + '保存位置：' + ExePath + 'Photo'#13#10 + '　文件名：' + fileName + '.jpg', cxImage);
        end;
      end;
    except

    end;
  end;
end;

end.
