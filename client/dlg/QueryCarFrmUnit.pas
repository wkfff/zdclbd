unit QueryCarFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, cxGraphics, cxCustomData,
  cxStyles, cxTL, cxTextEdit, cxInplaceContainer, cxControls,DBClient, Service,
  jpeg, cxSplitter, FileCtrl, Menus, RzTrkBar, RzButton, OleCtrls,
  WMPLib_TLB, DSPack, ImgList, ToolWin, RzLabel;

type
  TQueryCarPictureFrm = class(TForm)
    Panel2: TPanel;
    ProgressBar1: TProgressBar;
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
    BitBtnQuery: TBitBtn;
    BitBtnClose: TBitBtn;
    Panel7: TPanel;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    TreeView1: TTreeView;
    PanelSelectGroupName: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    cxPicList: TcxTreeList;
    cxDeviceListcxTreeListColumn1: TcxTreeListColumn;
    cxDeviceListcxTreeListColumn2: TcxTreeListColumn;
    cxDeviceListcxTreeListColumn3: TcxTreeListColumn;
    cxDeviceListcxTreeListColumn4: TcxTreeListColumn;
    cxPicListcxTreeListColumn2: TcxTreeListColumn;
    cxPicListcxTreeListColumn1: TcxTreeListColumn;
    Panel6: TPanel;
    cxSplitter1: TcxSplitter;
    cxSplitter2: TcxSplitter;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    SaveDialog1: TSaveDialog;
    cxPicListcxTreeListColumn3: TcxTreeListColumn;
    cxPicListcxTreeListColumn4: TcxTreeListColumn;
    Notebook1: TNotebook;
    Image1: TImage;
    Panel9: TPanel;
    BitBtnPlay: TRzBitBtn;
    BitBtnPause: TRzBitBtn;
    BitBtnFastForward: TRzBitBtn;
    BitBtnStop: TRzBitBtn;
    Panel8: TPanel;
    Panel10: TPanel;
    TrackBarPlay: TRzTrackBar;
    WindowsMediaPlayer: TWindowsMediaPlayer;
    Timer1: TTimer;
    lblProcess: TLabel;
    cxPicListcxTreeListColumn5: TcxTreeListColumn;
    Panel11: TPanel;
    VideoWindow1: TVideoWindow;
    Panel12: TPanel;
    ToolBar: TToolBar;
    btPlay: TToolButton;
    btPause: TToolButton;
    ToolButton1: TToolButton;
    btFullScreen: TToolButton;
    SoundLevel: TTrackBar;
    ImageList: TImageList;
    FilterGraph1: TFilterGraph;
    TrackBar: TDSTrackBar;
    lblPlayProgress: TRzLabel;
    procedure BitBtnQueryClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxPicListClick(Sender: TObject);
    procedure cxPicListFocusedNodeChanged(Sender: TObject;
      APrevFocusedNode, AFocusedNode: TcxTreeListNode);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnCloseClick(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure cxPicListChange(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure SaveDialog1TypeChange(Sender: TObject);
    procedure BitBtnPlayClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtnPauseClick(Sender: TObject);
    procedure BitBtnFastForwardClick(Sender: TObject);
    procedure BitBtnStopClick(Sender: TObject);
    procedure TrackBarPlayMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TrackBarPlayMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure TrackBarPlayMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btFullScreenClick(Sender: TObject);
    procedure VideoWindow1DblClick(Sender: TObject);
    procedure btPauseClick(Sender: TObject);
    procedure SoundLevelChange(Sender: TObject);
    procedure TrackBarTimer(sender: TObject; CurrentPos,
      StopPos: Cardinal);
    procedure btPlayClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FIsPlaying : Boolean;   //���ڲ��ű��
    FMouseDowned: Boolean;  //

    FIsVideoRendered: Boolean;
    FIsAudioStarting: Boolean;
    function ShowPicture(AFileName: string): boolean;
    procedure ShowAPicture;
    procedure ResetVideoPage();
  public
    procedure AddDev(id: integer; ANode: TTreeNode);
  end;

var
  QueryCarPictureFrm: TQueryCarPictureFrm;

  group_id: integer = -1;
  group_paranet: string = '';
  fact_id: Integer = -1;
  dev_id: Integer = -1;
  ReasonId: Integer = -1;

implementation
uses uGloabVar,carUnit,ConstDefineUnit, ShowMessageInfo, DXSUtil, pcm;
{$R *.dfm}

procedure TQueryCarPictureFrm.BitBtnQueryClick(Sender: TObject);
var
  i,j,jj:integer;
  b,e:TDatetime;
  temp:TClientDataSet;
  node:TcxTreeListNode;
  s,fileName:string;
  dev:TDevice;
  picIndex:integer;
  PicInfoBuf: ArrayOfPicInfo;
  ms : TMemoryStream;
  jpegfile : TJPEGImage;
  fs: TFileStream;
  fromDate, ToDate: string;
begin
  try
//    if ComboBox1.ItemIndex<0 then
//    begin
//      messagebox(handle,pchar('��ѡ��һ����!'),'��ʾ',mb_ok + mb_iconinformation);
//      exit;
//    end;

    b:=Trunc(DateTimePicker1.Date)+DateTimePicker2.Time-Trunc(DateTimePicker2.Time);
    e:=Trunc(DateTimePicker3.Date)+DateTimePicker4.Time-Trunc(DateTimePicker4.Time);

    fromDate := FormatDateTime('YYYY-MM-DD hh:nn:ss',b);
    ToDate := FormatDateTime('YYYY-MM-DD hh:nn:ss',e);

    if FromDate > ToDate then
    begin
      ShowTips('��ʼ����ӦС�ڽ������ڣ����飡', DateTimePicker3);
      DateTimePicker3.SetFocus;
      exit;
    end;

    if e - b > 2 then
    begin
      ShowTips('��ѯ��ý����Ϣ��ʱ�䲻�ܳ���2�죬������ѡ��', DateTimePicker3);
      DateTimePicker3.SetFocus;
      Exit;
    end;  

    if ComboBox1.ItemIndex < 0 then
      dev := nil
    else
      dev:=TDevice(ComboBox1.Items.Objects[ComboBox1.ItemIndex]);

    ProgressBar1.Position:=10;
    Application.ProcessMessages;
    
    cxPicList.Clear;
    if BitBtnStop.Enabled then
      BitBtnStop.Click;
    try
      if dev <> nil then
        PicInfoBuf := bs.QueryPicsByTime(dev.fact_id, dev.id, fromDate, ToDate)
      else
        PicInfoBuf := bs.QueryPicsByTime(-1, '', fromDate, ToDate);
    except
      on E: Exception do
      begin
        ProgressBar1.Position:=0;
        messageErrorBox('��ѯ��ý����Ϣ���������ȷ��', e.Message);
        exit;
      end;
    end;

    if PicInfoBuf = nil then
    begin
      MessageBox(self.Handle, '������ò�ѯ�����Ķ�ý����Ϣ!', '��ʾ', mb_iconinformation + mb_ok);
      Exit;
    end;
    ProgressBar1.Position:=0;
    ProgressBar1.Max:=Length(PicInfoBuf)*10+10;
    cxPicList.Clear;

    for i:=0 to Length(PicInfoBuf)-1 do
    begin
      node := cxPicList.AddFirst;
      try
        node.Data := picInfoBuf[i];
        PicIndex := picInfoBuf[i].PhotoId;
        node.Values[0] := PicIndex;
        node.Values[1] :=  picInfoBuf[i].GpsTime;
        j := picInfoBuf[i].PhotoReasonID;
        node.Values[2]:= ReturnUploadPicReason(j);
        jj:=picInfoBuf[i].CameraNo;
        case jj of
          1: s := '˾���Ϸ�';
          2: s := 'ǰ��';
          3: s := 'ǰ����';
          4: s := '����';
          5: s := 'ǰ����';
        else
          s := 'δ֪';
        end;
        node.Values[3]:= s;
        if PicInfoBuf[i].PhotoMeasure = -2 then
        begin
          node.Values[7] := '��Ƶ';
          node.StateIndex := 12;
        end
        else if PicInfoBuf[i].PhotoMeasure <= 1 then
        begin
          node.Values[7] := '��Ƭ';
          node.StateIndex := 11;
        end
        else if (PicInfoBuf[i].PhotoMeasure <= 3) then
        begin
          node.Values[7] := '��Ƶ';
          node.StateIndex := 12;
        end
        else if PicInfoBuf[i].PhotoMeasure = 4 then
        begin
          node.Values[7] := '��Ƶ';
          node.StateIndex := 13;
        end
        else
        begin
          node.Values[7] := '����';
        end;    

        node.Values[4]:= PicInfoBuf[i].takeBeginTime;
        {if Length(PicInfoBuf[i].Photo) = 0 then
        begin
          fileName := '��';
        end
        else
        begin
          fileName := ExePath+'Photo\';
          if not DirectoryExists(fileName) then
              if not ForceDirectories(fileName) then
          begin
            MessageBox(self.Handle, PAnsiChar('���ܴ���' + fileName + 'Ŀ¼'), '��ʾ', mb_iconinformation + mb_ok);
            Exit;
          end;

          filename:=fileName+Dev.Car.No;
          if not DirectoryExists(fileName) then
              if not ForceDirectories(fileName) then
          begin
            MessageBox(self.Handle, PAnsiChar('���ܴ���' + fileName + 'Ŀ¼'), '��ʾ', mb_iconinformation + mb_ok);
            Exit;
          end;
          fileName:=fileName+'\'+Dev.Car.No+'_'+FormatDatetime('yymmddhhnnss',b);
          fileName:=fileName+'_'+IntToHex(j,1);
          fileName:=fileName+'_'+IntToHex(jj,1);  //
          fileName:=fileName+'_'+IntToStr(PicIndex)+'.jpg';
          if not FileExists(fileName) then
          begin
            try
              fs := TFileStream.Create(FileName, fmCreate or fmShareDenyWrite);
              fs.Position := 0; //fs.Size;
              fs.Write(picInfoBuf[i].Photo[0], Length(PicInfoBuf[i].Photo));
            finally
              fs.Free;
            end;
          end;
        end;                     }
        node.Values[5]:=fileName;
        node.Values[6] := GetCarNo(PicInfoBuf[i].Dev_id);
        node.Values[8] := '';

      except
          node.Delete;
      end;
      ProgressBar1.StepIt;
    end;
  finally
    ProgressBar1.Position:=0;
//    ShowPicture(fileName);
    ShowAPicture;
  end;

end;

procedure TQueryCarPictureFrm.FormCreate(Sender: TObject);
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
        sonId: integer;           //�Ӽ��� ��ID
        leaf_node: TTreenode;     //�Ӽ��Ľڵ�
        grp : TDevGroup;
      begin
        for i:= 0 to ADevGroupManage.Count -1 do
        begin
          if Acurrent_cnt =0 then exit;
          grp :=ADevGroupManage.Items[i];
          //�г�����--��Ϊ0
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
  vn_node := TreeView1.Items.add(TreeView1.topitem, '���г���');
  vn_node.Data := Pointer(-1); //���г���
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
  Notebook1.PageIndex := 0;
  if BitBtnStop.Enabled then
    BitBtnStop.Click;
end;

procedure TQueryCarPictureFrm.cxPicListClick(Sender: TObject);
begin
//  if  cxPicList.FocusedNode=nil then exit;
//  ShowPicture(cxPicList.FocusedNode.Values[5]);
end;

function TQueryCarPictureFrm.ShowPicture(AFileName: string): boolean;
begin
  try
    Panel4.Caption:='';
    if AFileName = '��' then
    begin
      Panel4.Caption := '����Ƭ';
      Image1.Picture.Bitmap.FreeImage;
    end
    else
    begin
      Panel4.Caption := '';
      image1.Picture.LoadFromFile(AFileName);
    end;
  except
    Image1.Picture.Bitmap.FreeImage;
    Panel4.Caption:='��Ƭ����';
  end;
end;

procedure TQueryCarPictureFrm.cxPicListFocusedNodeChanged(Sender: TObject;
  APrevFocusedNode, AFocusedNode: TcxTreeListNode);
begin
//  if  cxPicList.FocusedNode=nil then exit;
//  ShowPicture(cxPicList.FocusedNode.Values[5]);
end;

procedure TQueryCarPictureFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ManualDock(nil);
end;

procedure TQueryCarPictureFrm.BitBtnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TQueryCarPictureFrm.AddDev(id: integer; ANode: TTreeNode);
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

procedure TQueryCarPictureFrm.TreeView1Click(Sender: TObject);
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
    if not devGrp.leaf_nod then //==  ˵�����ڵ�
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

procedure TQueryCarPictureFrm.ShowAPicture;
var
  Node: TcxTreeListNode;
  ms : TMemoryStream;
  jpegfile : TJPEGImage;
  info: PicInfo;
begin
  if cxPicList.FocusedNode = nil then Exit;
  Node := cxPicList.FocusedNode;

  Panel6.Caption:='';

  info := PicInfo(Node.Data);
  if info.PhotoMeasure = -2 then
  begin//adp�ļ�
    Notebook1.PageIndex := 1;
  end
  else if info.PhotoMeasure <= 1 then
  begin
    Notebook1.PageIndex := 0;
    ms := TMemoryStream.Create;
    jpegfile := TJPEGImage.Create;
    try
      try
        Image1.Picture.Graphic := nil;
        ms.Write(info.Photo[0],length(info.Photo));
        ms.Position := 0;
        //Image1.Picture.Graphic.LoadFromStream(ms);
        jpegfile.LoadFromStream(ms);
        Image1.Picture.Graphic := jpegfile;
      except
        Image1.Picture.Bitmap.FreeImage;
        Panel6.Caption:='��Ƭ����';
      end;
    finally
      ms.free;
      jpegfile.Free;
    end;
  end
  else if info.PhotoMeasure <= 3 then
  begin
    Notebook1.PageIndex := 1;
  end
  else
  begin
    Notebook1.PageIndex := 2;
  end;
end;

procedure TQueryCarPictureFrm.cxPicListChange(Sender: TObject);
begin
  if cxPicList.FocusedNode = nil then Exit;
  Panel10.Hint := '';
  if BitBtnStop.Enabled and not FIsAudioStarting then
    BitBtnStop.Click;
  ShowAPicture;
  ResetVideoPage;
end;

procedure TQueryCarPictureFrm.N1Click(Sender: TObject);
var
  fileName: string;
  fs: TFileStream;
  Node: TcxTreeListNode;
  mediaData: PicInfo;
begin
  try
    if cxPicList.FocusedNode = nil then Exit;
    Node:=cxPicList.FocusedNode;
    mediaData := PicInfo(Node.Data);
    SaveDialog1.Filter := 'JPEG(*.jpeg,*.jpg)|(*.jpg,*.jpeg)|TIF(*.tif,*.tiff)|(*.tif,*.tiff)|MP3(*.mp3)|(*.mp3)|WAV(*.wav)|(*.wav)|WMV(*.wmv)|(*.wmv)';

    if mediaData.PhotoMeasure = 0 then
      SaveDialog1.DefaultExt := 'jpg'
    else if mediaData.PhotoMeasure = 1 then
      SaveDialog1.DefaultExt := 'tif'
    else if mediaData.PhotoMeasure = 2 then
      SaveDialog1.DefaultExt := 'mp3'
    else if mediaData.PhotoMeasure = 3 then
      SaveDialog1.DefaultExt := 'wav'
    else
      SaveDialog1.DefaultExt := 'wmv';

    SaveDialog1.FilterIndex := mediaData.PhotoMeasure + 1;

    if SaveDialog1.Execute then
    begin//ֱ�ӵ���savedialog.filename��׺���������
      fileName := Copy(SaveDialog1.FileName, 1, Pos(ExtractFileExt(SaveDialog1.FileName), SaveDialog1.FileName) - 1) + '.' + SaveDialog1.DefaultExt;
      try
        //fileName := fileName + '.jpg';
        fs := TFileStream.Create(FileName, fmCreate or fmShareDenyWrite);
        fs.Position := 0; //fs.Size;
        fs.Write(PicInfo(Node.Data).Photo[0], Length(PicInfo(Node.Data).Photo));
      finally
        fs.Free;
      end;
      MessageBox(Handle, '����ɹ�', '��ʾ', MB_OK + MB_ICONINFORMATION);
    end;
  except
    on e: Exception do
    begin
      messageErrorBox('����ʧ�ܣ�', e.Message);
    end;
  end;
end;

procedure TQueryCarPictureFrm.SaveDialog1TypeChange(Sender: TObject);
begin
  if SaveDialog1.FilterIndex = 1 then
    SaveDialog1.DefaultExt := 'jpg'
  else if SaveDialog1.FilterIndex = 2 then
    SaveDialog1.DefaultExt := 'tif'
  else if SaveDialog1.FilterIndex = 3 then
    SaveDialog1.DefaultExt := 'mp3'
  else if SaveDialog1.FilterIndex = 4 then
    SaveDialog1.DefaultExt := 'wav'
  else
    SaveDialog1.DefaultExt := 'wmv';
end;

procedure TQueryCarPictureFrm.BitBtnPlayClick(Sender: TObject);
var
  node: TcxTreeListNode;
  audioData: PicInfo;
  fileName: string;
  dstFileName: string;
  fs: TFileStream;
begin
  cxPicList.OnChange := nil;
  try
    if Panel10.Hint = '' then
    begin
      node := cxPicList.FocusedNode;
      if node = nil then  Exit;
      fileName := node.Values[8];
      if fileName <> '' then
      begin
        if FileExists(fileName) then//�����Ƶ�ļ��Ѿ����Ź��ˣ��������ٴ�ת��Ϊ�����ļ�
          Panel10.Hint := fileName;//
      end
      else
      begin
        Panel10.Caption := '���ڼ�����Ƶ�ļ������Ժ򣮣���';
        try
          audioData := PicInfo(node.Data);
          if audioData = nil then
          begin
            MessageBox(Handle, '��Ƶ������Ч���޷�����', '��ʾ', MB_OK + MB_ICONINFORMATION);
            Exit;
          end;
          if not ((audioData.PhotoMeasure in [2, 3]) or (audioData.PhotoMeasure = -2)) then
          begin
            MessageBox(Handle, '����Ƶ���ݣ��޷�����', '��ʾ', MB_OK + MB_ICONINFORMATION);
            Exit;
          end;

          fileName := ExePath + 'Audio\';
          if not DirectoryExists(fileName) then
            if not CreateDir(fileName) then
            begin
              MessageBox(self.Handle, '�޷�������Ƶ�ļ���������', '��ʾ', mb_iconinformation + mb_ok);
              Exit;
            end;

          filename := fileName + node.Values[6];
          if not DirectoryExists(fileName) then
            if not CreateDir(fileName) then
            begin
              MessageBox(self.Handle, '�޷�������Ƶ�ļ���������', '��ʾ', mb_iconinformation + mb_ok);
              Exit;
            end;
          fileName:=fileName+'\'+ node.Values[6] +'_'+FormatDatetime('yymmddhhnnss',now);
          if audioData.PhotoMeasure = 2 then
          begin
            fileName := fileName + '.mp3';
            dstFileName := fileName;
          end
          else if audioData.PhotoMeasure = 3 then
          begin
            fileName := fileName + '.wav';
            dstFileName := fileName;
          end
          else if audioData.PhotoMeasure = -2 then
          begin
            dstFileName := fileName + '.wav';
            fileName := fileName + '.adp';
          end;

          try
            fs := TFileStream.Create(fileName, fmCreate or fmShareDenyWrite);
            fs.Position := 0;
            fs.Write(audioData.Photo[0], Length(audioData.Photo));
          finally
            fs.Free;
          end;

          if dstFileName <> fileName then
          begin
            ConvertAdp2Wav(fileName, dstFileName, $00);
          end;

          Panel10.Hint := dstFileName;
        finally
          Panel10.Caption := '��Ƶ�ļ�';
        end;
        node.Values[8] := dstFileName;
      end;
    end;
    if Panel10.Hint = '' then
    begin
      MessageBox(Handle, '�޷�������Ƶ�ļ�', '��ʾ', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
    WindowsMediaPlayer.URL := Panel10.Hint;
    if not TrackBarPlay.Enabled then
      TrackBarPlay.Enabled:= True;

    FIsPlaying := True;
    BitBtnPlay.Enabled := False;
    BitBtnFastForward.Enabled := True;
    BitBtnStop.Enabled := True;
    BitBtnPause.Enabled := True;
    WindowsMediaPlayer.controls.play;
    TrackBarPlay.Enabled := True;
    Timer1.Enabled := True;
    FIsAudioStarting := True;
  finally
    cxPicList.OnChange := cxPicListChange;
  end;
end;

procedure TQueryCarPictureFrm.Timer1Timer(Sender: TObject);
begin
  TrackBarPlay.Max :=  Round(WindowsMediaPlayer.currentMedia.duration*100);
  TrackBarPlay.Position := round(WindowsMediaPlayer.controls.currentPosition*100);
  //LabelProcess.Caption := GetMinuteAndSecond(WindowsMediaPlayer.controls.currentPosition)+
  //  ' / '+GetMinuteAndSecond(WindowsMediaPlayer.currentMedia.duration);
  lblProcess.Caption := WindowsMediaPlayer.controls.currentPositionString +
    '/'+ WindowsMediaPlayer.currentMedia.durationString + '  ';

  if (WindowsMediaPlayer.controls.currentPosition <> 0) and (WindowsMediaPlayer.controls.currentPositionString = WindowsMediaPlayer.currentMedia.durationString) then
  begin
    BitBtnStop.Click;
  end;
  FIsAudioStarting := False;
end;

procedure TQueryCarPictureFrm.BitBtnPauseClick(Sender: TObject);
begin
  if BitBtnPause.Caption = '��ͣ' then
  begin
    FIsPlaying := False;
    WindowsMediaPlayer.controls.pause;
    Timer1.Enabled := False;
    BitBtnPause.Caption := '����';
  end
  else if BitBtnPause.Caption = '����' then
  begin
    FIsPlaying := True;
    WindowsMediaPlayer.controls.play;
    Timer1.Enabled := True;
    BitBtnPause.Caption := '��ͣ';
  end;
end;

procedure TQueryCarPictureFrm.BitBtnFastForwardClick(Sender: TObject);
begin
  FIsPlaying := True;
  WindowsMediaPlayer.controls.pause;
  WindowsMediaPlayer.settings.rate := 2;
  WindowsMediaPlayer.controls.play;
  BitBtnPlay.Enabled := True;
  BitBtnFastForward.Enabled :=False;
  BitBtnStop.Enabled := True;
  BitBtnPause.Enabled := True;
  Timer1.Enabled :=True;
end;

procedure TQueryCarPictureFrm.BitBtnStopClick(Sender: TObject);
begin
  if FIsPlaying then WindowsMediaPlayer.controls.stop;
  BitBtnPlay.Enabled := True;
  BitBtnFastForward.Enabled :=True;
  BitBtnStop.Enabled := False;
  BitBtnPause.Enabled := False;
  Timer1.Enabled := False;
  TrackBarPlay.Position := 0;
  LblProcess.Caption := '';
  FIsPlaying := False;
end;

procedure TQueryCarPictureFrm.TrackBarPlayMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) and (Shift = [ssleft]) then
  begin
    try
      FMouseDowned := True;
      WindowsMediaPlayer.controls.pause;
      Timer1.Enabled := False;
      TrackBarPlay.Position := round(TrackBarPlay.Max * X /TrackBarPlay.Width);  //����TrackBar��λ��
      WindowsMediaPlayer.controls.currentPosition := TrackBarPlay.Position /100;
      LblProcess.Caption := WindowsMediaPlayer.controls.currentPositionString+
        '/'+WindowsMediaPlayer.currentMedia.durationString + '  ';
    except

    end;
  end;
end;

procedure TQueryCarPictureFrm.TrackBarPlayMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if FMouseDowned then
  begin
    try
      WindowsMediaPlayer.controls.currentPosition := TrackBarPlay.Position /100;
      lblProcess.Caption := WindowsMediaPlayer.controls.currentPositionString+
        '/'+WindowsMediaPlayer.currentMedia.durationString + '  ';
    except

    end;
  end;
end;

procedure TQueryCarPictureFrm.TrackBarPlayMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if FMouseDowned then
  begin
    FMouseDowned :=False;
    BitBtnPlay.Click;
  end;
end;

procedure TQueryCarPictureFrm.ResetVideoPage;
begin
  btPlay.Down := False;
  btPause.Enabled := False;
  lblPlayProgress.Caption := '';
  FilterGraph1.ClearGraph;
  FIsVideoRendered := False;
  FilterGraph1.Active := False;
  TrackBar.Position := 0;
  Panel12.Hint := '';
end;

procedure TQueryCarPictureFrm.btFullScreenClick(Sender: TObject);
begin
  VideoWindow1.FullScreen := not VideoWindow1.FullScreen;
  btFullScreen.Down := VideoWindow1.FullScreen;
end;

procedure TQueryCarPictureFrm.VideoWindow1DblClick(Sender: TObject);
begin
  btFullScreenClick(Sender);
end;

procedure TQueryCarPictureFrm.btPauseClick(Sender: TObject);
begin
  FilterGraph1.Pause;
end;

procedure TQueryCarPictureFrm.SoundLevelChange(Sender: TObject);
begin
  FilterGraph1.Volume := SoundLevel.Position;
end;

procedure TQueryCarPictureFrm.TrackBarTimer(sender: TObject; CurrentPos,
  StopPos: Cardinal);
begin
  lblPlayProgress.Caption := Format('%s/%s', [TimeToStr(CurrentPos / MiliSecPerDay), TimeToStr(StopPos / MiliSecPerDay)]);
  if (CurrentPos = StopPos) then
  begin
    ResetVideoPage;
  end;  
end;

procedure TQueryCarPictureFrm.btPlayClick(Sender: TObject);
var
  node: TcxTreeListNode;
  videoData: PicInfo;
  fileName: string;
  fs: TFileStream;
  rfr: HResult;
begin
  if Panel12.Hint = '' then
  begin
    node := cxPicList.FocusedNode;
    if node = nil then  Exit;
//    fileName := node.Values[8];
//    if fileName <> '' then
//    begin
//      if FileExists(fileName) then//�����Ƶ�ļ��Ѿ����Ź��ˣ��������ٴ�ת��Ϊ�����ļ�
//        Panel12.Hint := fileName;//
//    end
//    else
    begin
      Panel12.Caption := '���ڼ�����Ƶ�ļ������Ժ򣮣���';
      try
        videoData := PicInfo(node.Data);
        if videoData = nil then
        begin
          MessageBox(Handle, '��Ƶ������Ч���޷�����', '��ʾ', MB_OK + MB_ICONINFORMATION);
          Exit;
        end;

        fileName := ExePath + 'Video\';
        if not DirectoryExists(fileName) then
          if not CreateDir(fileName) then
          begin
            MessageBox(self.Handle, '�޷�������Ƶ�ļ���������', '��ʾ', mb_iconinformation + mb_ok);
            Exit;
          end;

        filename := fileName + node.Values[6];
        if not DirectoryExists(fileName) then
          if not CreateDir(fileName) then
          begin
            MessageBox(self.Handle, '�޷�������Ƶ�ļ���������', '��ʾ', mb_iconinformation + mb_ok);
            Exit;
          end;
        fileName:=fileName+'\'+ node.Values[6] +'_'+FormatDatetime('yymmddhhnnss',now) + '.avi';
        try
          fs := TFileStream.Create(fileName, fmCreate or fmShareDenyWrite);
          fs.Position := 0;
          fs.Write(videoData.Photo[0], Length(videoData.Photo));
        finally
          fs.Free;
        end;
        Panel12.Hint := fileName;
      finally
        Panel12.Caption := '��Ƶ�ļ�';
      end;
//      node.Values[8] := fileName;
    end;
  end;
  if Panel12.Hint = '' then
  begin
    MessageBox(Handle, '�޷�������Ƶ�ļ�', '��ʾ', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  if not FilterGraph1.Active then
    FilterGraph1.Active := True;

  if not FIsVideoRendered then
  begin
    try
      rfr := FilterGraph1.RenderFile(Panel12.Hint);
    except

    end;
    if Failed(rfr) then
    begin
      MessageBox(Handle, '�����ļ�ʧ�ܣ�������', '��ʾ', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
    FIsVideoRendered := True;
  end;

  FilterGraph1.Play;
  btPause.Enabled := True;
end;

procedure TQueryCarPictureFrm.FormDestroy(Sender: TObject);
begin
  FilterGraph1.Stop;
  FilterGraph1.ClearGraph;
end;

end.
