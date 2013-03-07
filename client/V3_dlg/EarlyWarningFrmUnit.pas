unit EarlyWarningFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Menus, uGloabVar, CarUnit, Service,
  jpeg, BackCallTelFrmUnit, ActnList, cxControls, cxSplitter, EarlyWarningDlgUnit;

type
  TEarlyWarningFrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox4: TGroupBox;
    ListView4: TListView;
    PopupMenu1: TPopupMenu;
    Panel4: TPanel;
    GroupBox5: TGroupBox;
    Panel5: TPanel;
    Image1: TImage;
    N1: TMenuItem;
    N2: TMenuItem;
    Splitter5: TSplitter;
    Splitter6: TSplitter;
    GroupBox6: TGroupBox;
    Panel6: TPanel;
    Image2: TImage;
    GroupBox7: TGroupBox;
    Panel7: TPanel;
    Image3: TImage;
    N3: TMenuItem;
    PopupMenu2: TPopupMenu;
    N4: TMenuItem;
    PopupMenu3: TPopupMenu;
    N5: TMenuItem;
    N6: TMenuItem;
    Panel8: TPanel;
    GroupBox1: TGroupBox;
    ListView1: TListView;
    Panel9: TPanel;
    GroupBox2: TGroupBox;
    ListView2: TListView;
    Panel10: TPanel;
    GroupBox3: TGroupBox;
    ListView3: TListView;
    cxSplitter2: TcxSplitter;
    cxSplitter1: TcxSplitter;
    procedure ListView1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure ListView2Click(Sender: TObject);
    procedure ListView3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure ListView1ColumnClick(Sender: TObject; Column: TListColumn);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshEarlyWarningList();
    procedure LocalMap;
  end;

var
  EarlyWarningFrm: TEarlyWarningFrm;

implementation
uses umainf, GetAPictureFrmUnit, CmdStructUnit, UserUnit, EarlyWarningPicFrmUnit;
{$R *.dfm}

{ TEarlyWarningFrm }

procedure TEarlyWarningFrm.RefreshEarlyWarningList;
var
  i: Integer;
  EarlyWaringCar: TEarlyWarningCar;
begin
  ListView1.Clear;
  //ListView4.Clear;
  with EarlyWarningPicFrm do
  begin
    Panel5.Caption:='';
    Panel6.Caption:='';
    Panel7.Caption:='';
    Image1.Picture.Graphic := nil;
    Image2.Picture.Graphic := nil;
    Image3.Picture.Graphic := nil;
  end;

  for i:=0 to EarlyWarningCarList.Count - 1 do
  begin 
    EarlyWaringCar := TEarlyWarningCar(EarlyWarningCarList.Objects[i]);
    case EarlyWaringCar.State of
    0:
      begin
        with ListView1.Items.Add  do
        begin                                       
          Caption:=EarlyWaringCar.Dev.IdStr;
          SubItems.Add(EarlyWaringCar.Dev.Car.No);
          SubItems.Add(DateTimeToStr(EarlyWaringCar.Dev.GpsTime));
          SubItems.Add(DateTimeToStr(Now));
          Data:=EarlyWaringCar;
        end;
      end;
    1:
      begin

      end;
    2:
      begin

      end;
    end;
  end;
  
end;

procedure TEarlyWarningFrm.ListView1Click(Sender: TObject);
var
  EarlyWaringCar: TEarlyWarningCar;
  i: Integer;
  ms : TMemoryStream;
  jpegfile : TJPEGImage;
  buf:array of byte;
  info: PicInfo;
begin
  ListView4.Clear;
  if ListView1.Selected = nil then
    Exit;
  EarlyWaringCar :=  TEarlyWarningCar(ListView1.Selected.Data);
  {for i:=0 to EarlyWaringCar.FEarlyWarningInfoList.Count -1 do
  begin
    with ListView4.Items.Add  do
    begin
      Caption:=EarlyWaringCar.Dev.IdStr;
      SubItems.Add(EarlyWaringCar.Dev.Car.No);
      SubItems.Add(EarlyWaringCar.EarlyWarningInfoList.strings[i]);
      //SubItems.Add(DateTimeToStr(TDateTime(EarlyWaringCar.EarlyWarningInfoList.Items[i]^)));
    end;
  end;   }

  EarlyWarningPicFrm.Panel5.Caption:='';
  EarlyWarningPicFrm.Panel6.Caption:='';
  EarlyWarningPicFrm.Panel7.Caption:='';
  EarlyWarningPicFrm.Image1.Picture.Graphic := nil;
  EarlyWarningPicFrm.Image2.Picture.Graphic := nil;
  EarlyWarningPicFrm.Image3.Picture.Graphic := nil;

  for i:=0 to EarlyWaringCar.FPicInfoList.Count - 1 do
  begin
    if i=0 then
    begin
      info := PicInfo(EarlyWaringCar.FPicInfoList.Datas[i]);
      ms := TMemoryStream.Create;
      jpegfile := TJPEGImage.Create;
      try
        try
          EarlyWarningPicFrm.Image1.Picture.Graphic := nil;
          ms.Write(info.Photo[0],length(info.Photo));
          ms.Position := 0;
          //Image1.Picture.Graphic.LoadFromStream(ms);
          jpegfile.LoadFromStream(ms);
          EarlyWarningPicFrm.Image1.Picture.Graphic := jpegfile;
        except
          EarlyWarningPicFrm.Image1.Picture.Bitmap.FreeImage;
          EarlyWarningPicFrm.Panel5.Caption:='照片错误';
        end;
      finally
        ms.free;
        jpegfile.Free;
      end;
    end;
    if i=1 then
    begin
      info := PicInfo(EarlyWaringCar.FPicInfoList.Datas[i]);
      ms := TMemoryStream.Create;
      jpegfile := TJPEGImage.Create;
      try
        try
          EarlyWarningPicFrm.Image2.Picture.Graphic := nil;
          ms.Write(info.Photo[0],length(info.Photo));
          ms.Position := 0;
          //Image1.Picture.Graphic.LoadFromStream(ms);
          jpegfile.LoadFromStream(ms);
          EarlyWarningPicFrm.Image2.Picture.Graphic := jpegfile;
        except
          EarlyWarningPicFrm.Image2.Picture.Bitmap.FreeImage;
          EarlyWarningPicFrm.Panel6.Caption:='照片错误';
        end;
      finally
        ms.free;
        jpegfile.Free;
      end;
    end;
    if i=2 then
    begin
      info := PicInfo(EarlyWaringCar.FPicInfoList.Datas[i]);
      ms := TMemoryStream.Create;
      jpegfile := TJPEGImage.Create;
      try
        try
          EarlyWarningPicFrm.Image3.Picture.Graphic := nil;
          ms.Write(info.Photo[0],length(info.Photo));
          ms.Position := 0;
          //Image1.Picture.Graphic.LoadFromStream(ms);
          jpegfile.LoadFromStream(ms);
          EarlyWarningPicFrm.Image3.Picture.Graphic := jpegfile;
        except
          EarlyWarningPicFrm.Image3.Picture.Bitmap.FreeImage;
          EarlyWarningPicFrm.Panel7.Caption:='照片错误';
        end;
      finally
        ms.free;
        jpegfile.Free;
      end;
    end;
  end;

  if EarlyWaringCar.FPicInfoList.Count > 0 then
    EarlyWarningPicFrm.Show;
end;

procedure TEarlyWarningFrm.N1Click(Sender: TObject);
var
  EarlyWaringCar: TEarlyWarningCar;
  i, j: Integer;
  dlg: TEarlyWarningDlg;
  SqlStr: string;
  dev: TDevice;
  NO: string;
  Histroy: string;
  SelectListItem: TListItem;
  PhotoIDs: string;
begin
  if ListView1.Selected = nil then Exit;
  SelectListItem := ListView1.Selected;
  i := EarlyWarningCarList.IndexOf(SelectListItem.Caption);
  if i>=0 then
  begin
    try
      dlg := TEarlyWarningDlg.Create(Self);
      dlg.editDevID.Text := SelectListItem.Caption;
      dlg.editCarNo.Text := SelectListItem.SubItems[0];
      dlg.ShowModal;
      if dlg.ModalResult = mrOk then
      begin
        EarlyWaringCar := TEarlyWarningCar(EarlyWarningCarList.Objects[i]);
        DataServer.ConfirmEarlyWarning_V3(EarlyWaringCar.FDevId);
        dev := ADeviceManage.find(EarlyWaringCar.FDevId);

        //EarlyWaringCar.EarlyWarningInfoList.Clear;
        //EarlyWaringCar.PicInfoList.Clear;
        with EarlyWarningPicFrm do
        begin
          Image1.Picture.Graphic := nil;
          Image2.Picture.Graphic := nil;
          Image3.Picture.Graphic := nil;
        end;
        //ListView4.Clear;

        SelectListItem.Delete;
        with ListView2.Items.Add  do
        begin
          EarlyWaringCar.State := 1;
          Caption:=EarlyWaringCar.Dev.IdStr;
          SubItems.Add(EarlyWaringCar.Dev.Car.No);
          SubItems.Add(DateTimeToStr(EarlyWaringCar.Dev.GpsTime));
          SubItems.Add(DateTimeToStr(Now));
          Data:=EarlyWaringCar;
        end;

        PhotoIDs := '';
        for j := 0 to EarlyWaringCar.PicInfoList.Count - 1 do
        begin
          if j = 0 then
            PhotoIDs := IntToStr(EarlyWaringCar.PicInfoList.Integers[j])
          else
            PhotoIDs := PhotoIDs + ',' + IntToStr(EarlyWaringCar.PicInfoList.Integers[j]);
        end;

        NO := FormatDatetime('yyyymmddhhnnss',Now);
        Histroy := FormatDateTime('YYYY-MM-DD HH:NN:SS', Now)+ ' ' +current_user.UserName + ' 确认报警：' + Trim(dlg.Memo1.Text) + '；';
        SqlStr := 'insert into TAB_DEVALARMINFO(DEVIDSTR, BEGINDATETIME, ENDDATETIME, PERSON, TEL, '
            + '                             ADDRESS, RESULT, USERID, USERNAME, DEALTIME, CARNO, NO, '
            + '                             Histroy, PhotoIDs) '
            + '                       values('+ SafeSql(dev.idStr) + ', to_date(' + SafeSql(DateTimeToStr(EarlyWaringCar.Dev.GpsTime)) + ',' + SafeSql('YYYY-MM-DD HH24:MI:SS')+'),'
            +                                ' to_date(' + SafeSql(DateTimeToStr(Now)) + ',' + SafeSql('YYYY-MM-DD HH24:MI:SS')+'),'
            +                                SafeSql(dev.Login_DriverName) + ',' + SafeSql('') +','
            +                                SafeSql('') + ',' + SafeSql('') + ','
            +                                IntToStr(current_user.id) + ',' + SafeSql(current_user.UserName) + ','
            +                                ' to_date(' + SafeSql(DateTimeToStr(Now)) + ',' + SafeSql('YYYY-MM-DD HH24:MI:SS')+'),' + SafeSql(dev.Car.No) + ',' + SafeSql(NO)+','
            +                                SafeSql(Histroy) + ',' + SafeSql(PhotoIDs) + ')';
        if Bs.AddSql(SqlStr, 'TAB_DEVALARMINFO', '保存一条报警台帐信息：') > 0 then
        begin

        end;
      end;
    finally
      dlg.Free;
    end;
  end;
end;

procedure TEarlyWarningFrm.N2Click(Sender: TObject);
var
  EarlyWaringCar: TEarlyWarningCar;
  i, j: Integer;
  dlg: TEarlyWarningDlg;
  SqlStr: string;
  dev: TDevice;
  NO: string;
  Histroy: string;
  SelectListItem: TListItem;
  PhotoIDs: string;
begin
  if ListView1.Selected = nil then Exit;
  SelectListItem := ListView1.Selected;
  i := EarlyWarningCarList.IndexOf(SelectListItem.Caption);
  if i>=0 then
  begin
    try
      dlg := TEarlyWarningDlg.Create(Self);
      dlg.editDevID.Text := SelectListItem.Caption;
      dlg.editCarNo.Text := SelectListItem.SubItems[0];
      dlg.Caption := '预警取消原因';
      dlg.ShowModal;
      if dlg.ModalResult = mrOk then
      begin
        EarlyWaringCar := TEarlyWarningCar(EarlyWarningCarList.Objects[i]);
        DataServer.CancelEarlyWarning_V3(EarlyWaringCar.FDevId);
        dev := ADeviceManage.find(EarlyWaringCar.FDevId);

        //EarlyWaringCar.EarlyWarningInfoList.Clear;
        //EarlyWaringCar.PicInfoList.Clear;
        with EarlyWarningPicFrm do
        begin
          Image1.Picture.Graphic := nil;
          Image2.Picture.Graphic := nil;
          Image3.Picture.Graphic := nil;
        end;
        //ListView4.Clear;

        SelectListItem.Delete;
        with ListView3.Items.Add  do
        begin
          EarlyWaringCar.State := 2;
          Caption:=EarlyWaringCar.Dev.IdStr;
          SubItems.Add(EarlyWaringCar.Dev.Car.No);
          SubItems.Add(DateTimeToStr(EarlyWaringCar.Dev.GpsTime));
          SubItems.Add(DateTimeToStr(Now));
          Data:=EarlyWaringCar;
        end;

        PhotoIDs := '';
        for j := 0 to EarlyWaringCar.PicInfoList.Count - 1 do
        begin
          if j = 0 then
            PhotoIDs := IntToStr(EarlyWaringCar.PicInfoList.Integers[j])
          else
            PhotoIDs := PhotoIDs + ',' + IntToStr(EarlyWaringCar.PicInfoList.Integers[j]);
        end;

        NO := FormatDatetime('yyyymmddhhnnss',Now);
        Histroy := FormatDateTime('YYYY-MM-DD HH:NN:SS', Now)+ ' ' +current_user.UserName + ' 取消报警：' + Trim(dlg.Memo1.Text) + '；';
        SqlStr := 'insert into TAB_DEVALARMINFO(DEVIDSTR, BEGINDATETIME, ENDDATETIME, PERSON, TEL, '
            + '                             ADDRESS, RESULT, USERID, USERNAME, DEALTIME, CARNO, NO, '
            + '                             Histroy, PhotoIDs) '
            + '                       values('+ SafeSql(dev.idStr) + ', to_date(' + SafeSql(DateTimeToStr(EarlyWaringCar.Dev.GpsTime)) + ',' + SafeSql('YYYY-MM-DD HH24:MI:SS')+'),'
            +                                ' to_date(' + SafeSql(DateTimeToStr(Now)) + ',' + SafeSql('YYYY-MM-DD HH24:MI:SS')+'),'
            +                                SafeSql(dev.Login_DriverName) + ',' + SafeSql('') +','
            +                                SafeSql('') + ',' + SafeSql('') + ','
            +                                IntToStr(current_user.id) + ',' + SafeSql(current_user.UserName) + ','
            +                                ' to_date(' + SafeSql(DateTimeToStr(Now)) + ',' + SafeSql('YYYY-MM-DD HH24:MI:SS')+'),' + SafeSql(dev.Car.No) + ',' + SafeSql(NO)+','
            +                                SafeSql(Histroy) + ',' + SafeSql(PhotoIDs) + ')';
        if Bs.AddSql(SqlStr, 'TAB_DEVALARMINFO', '保存一条报警台帐信息：') > 0 then
        begin
        
        end;
      end;
    finally
      dlg.Free;
    end;
  end;
end;

procedure TEarlyWarningFrm.N3Click(Sender: TObject);
var
  dlg: TBackCallTelFrm;
begin
  if ListView1.Selected = nil then Exit;
  dlg := TBackCallTelFrm.Create(self);
  try
    with dlg.ListView1.Items.Add do
    begin
      caption := ListView1.Selected.SubItems[0];
      data := TDevice(ADeviceManage.find(ListView1.Selected.Caption));
    end;
    dlg.ShowModal;
  finally
    dlg.Free;
  end;
end;

procedure TEarlyWarningFrm.ListView2Click(Sender: TObject);
var
  EarlyWaringCar: TEarlyWarningCar;
  i: Integer;
  ms : TMemoryStream;
  jpegfile : TJPEGImage;
  buf:array of byte;
  info: PicInfo;
begin
  //ListView4.Clear;
  if ListView2.Selected = nil then
    Exit;
  EarlyWaringCar :=  TEarlyWarningCar(ListView2.Selected.Data);
  {for i:=0 to EarlyWaringCar.FEarlyWarningInfoList.Count -1 do
  begin
    with ListView4.Items.Add  do
    begin
      Caption:=EarlyWaringCar.Dev.IdStr;
      SubItems.Add(EarlyWaringCar.Dev.Car.No);
      SubItems.Add(EarlyWaringCar.EarlyWarningInfoList.strings[i]);
      //SubItems.Add(DateTimeToStr(TDateTime(EarlyWaringCar.EarlyWarningInfoList.Items[i]^)));
    end;
  end;  }

  with EarlyWarningPicFrm do
  begin
    Panel5.Caption:='';
    Panel6.Caption:='';
    Panel7.Caption:='';
    Image1.Picture.Graphic := nil;
    Image2.Picture.Graphic := nil;
    Image3.Picture.Graphic := nil;

    for i:=0 to EarlyWaringCar.FPicInfoList.Count - 1 do
    begin
      if i=0 then
      begin
        info := PicInfo(EarlyWaringCar.FPicInfoList.Datas[i]);
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
            Panel5.Caption:='照片错误';
          end;
        finally
          ms.free;
          jpegfile.Free;
        end;
      end;
      if i=1 then
      begin
        info := PicInfo(EarlyWaringCar.FPicInfoList.Datas[i]);
        ms := TMemoryStream.Create;
        jpegfile := TJPEGImage.Create;
        try
          try
            Image2.Picture.Graphic := nil;
            ms.Write(info.Photo[0],length(info.Photo));
            ms.Position := 0;
            //Image1.Picture.Graphic.LoadFromStream(ms);
            jpegfile.LoadFromStream(ms);
            Image2.Picture.Graphic := jpegfile;
          except
            Image2.Picture.Bitmap.FreeImage;
            Panel6.Caption:='照片错误';
          end;
        finally
          ms.free;
          jpegfile.Free;
        end;
      end;
      if i=2 then
      begin
        info := PicInfo(EarlyWaringCar.FPicInfoList.Datas[i]);
        ms := TMemoryStream.Create;
        jpegfile := TJPEGImage.Create;
        try
          try
            Image3.Picture.Graphic := nil;
            ms.Write(info.Photo[0],length(info.Photo));
            ms.Position := 0;
            //Image1.Picture.Graphic.LoadFromStream(ms);
            jpegfile.LoadFromStream(ms);
            Image3.Picture.Graphic := jpegfile;
          except
            Image3.Picture.Bitmap.FreeImage;
            Panel7.Caption:='照片错误';
          end;
        finally
          ms.free;
          jpegfile.Free;
        end;
      end;
    end;
  end;
  if EarlyWaringCar.FPicInfoList.Count > 0 then
    EarlyWarningPicFrm.Show;
end;

procedure TEarlyWarningFrm.ListView3Click(Sender: TObject);
var
  EarlyWaringCar: TEarlyWarningCar;
  i: Integer;
  ms : TMemoryStream;
  jpegfile : TJPEGImage;
  buf:array of byte;
  info: PicInfo;
begin
  //ListView4.Clear;
  if ListView3.Selected = nil then
    Exit;
  EarlyWaringCar :=  TEarlyWarningCar(ListView3.Selected.Data);
  {for i:=0 to EarlyWaringCar.FEarlyWarningInfoList.Count -1 do
  begin
    with ListView4.Items.Add  do
    begin
      Caption:=EarlyWaringCar.Dev.IdStr;
      SubItems.Add(EarlyWaringCar.Dev.Car.No);
      SubItems.Add(EarlyWaringCar.EarlyWarningInfoList.strings[i]);
      //SubItems.Add(DateTimeToStr(TDateTime(EarlyWaringCar.EarlyWarningInfoList.Items[i]^)));
    end;
  end;    }
  with EarlyWarningPicFrm do
  begin
    Panel5.Caption:='';
    Panel6.Caption:='';
    Panel7.Caption:='';
    Image1.Picture.Graphic := nil;
    Image2.Picture.Graphic := nil;
    Image3.Picture.Graphic := nil;

    for i:=0 to EarlyWaringCar.FPicInfoList.Count - 1 do
    begin
      if i=0 then
      begin
        info := PicInfo(EarlyWaringCar.FPicInfoList.Datas[i]);
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
            Panel5.Caption:='照片错误';
          end;
        finally
          ms.free;
          jpegfile.Free;
        end;
      end;
      if i=1 then
      begin
        info := PicInfo(EarlyWaringCar.FPicInfoList.Datas[i]);
        ms := TMemoryStream.Create;
        jpegfile := TJPEGImage.Create;
        try
          try
            Image2.Picture.Graphic := nil;
            ms.Write(info.Photo[0],length(info.Photo));
            ms.Position := 0;
            //Image1.Picture.Graphic.LoadFromStream(ms);
            jpegfile.LoadFromStream(ms);
            Image2.Picture.Graphic := jpegfile;
          except
            Image2.Picture.Bitmap.FreeImage;
            Panel6.Caption:='照片错误';
          end;
        finally
          ms.free;
          jpegfile.Free;
        end;
      end;
      if i=2 then
      begin
        info := PicInfo(EarlyWaringCar.FPicInfoList.Datas[i]);
        ms := TMemoryStream.Create;
        jpegfile := TJPEGImage.Create;
        try
          try
            Image3.Picture.Graphic := nil;
            ms.Write(info.Photo[0],length(info.Photo));
            ms.Position := 0;
            //Image1.Picture.Graphic.LoadFromStream(ms);
            jpegfile.LoadFromStream(ms);
            Image3.Picture.Graphic := jpegfile;
          except
            Image3.Picture.Bitmap.FreeImage;
            Panel7.Caption:='照片错误';
          end;
        finally
          ms.free;
          jpegfile.Free;
        end;
      end;
    end;
  end;
  if EarlyWaringCar.FPicInfoList.Count > 0 then
    EarlyWarningPicFrm.Show;
end;

procedure TEarlyWarningFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Mainf.show_EarlyWarningCar.Checked := False;
end;

procedure TEarlyWarningFrm.N4Click(Sender: TObject);
begin
  ListView2.Clear;
end;

procedure TEarlyWarningFrm.N5Click(Sender: TObject);
begin
  ListView3.Clear;
end;

procedure TEarlyWarningFrm.N6Click(Sender: TObject);
var
  dlg: TGetAPictureFrm;
  i, n: integer;
  dev: TDevice;

  CameraIndex: Byte; //摄像头号
  CameraCmd: Word;  // 拍照命令
  PZSJJG: Word;   // 拍照时间间隔
  SaveSign: Byte; // 保存标志
  GetPicSize: Byte; //照片尺寸大小 0=320x240  1=640x480  2-else
  TXZL: Byte; // 图像质量
  LD: Byte;   // 亮度
  DBD: Byte;  // 对比度
  BHD: Byte;  // 饱和度
  SD: Byte;
//  grp: TDevGroup;
begin
  if ListView1.Selected = nil then Exit;
{$IFDEF ForAddEKey}
  ConnectedEkey_monitor;
{$ENDIF}
  dlg := TGetAPictureFrm.Create(self);
  try
    with dlg.ListView1.Items.Add do
    begin
      caption := ListView1.Selected.SubItems[0];
      data := TDevice(ADeviceManage.find(ListView1.Selected.Caption));
    end;

    dlg.ComboBoxCameraCmd.ItemIndex := 2;
    dlg.ShowModal;
    if dlg.ModalResult = mrok then //处理　读取车辆
    begin
      n := dlg.ListView1.Items.Count;
      if n = 0 then
      begin
        messagebox(handle, pchar('命令不能执行，没有指定车辆'), '提示', mb_ok + mb_iconinformation);
        exit;
      end;

      for i := 0 to dlg.ListView1.Items.Count - 1 do
      begin
        if dlg.Cancel then
        begin
          if messagebox(handle, '是否确实要取消对剩余车辆的操作？', '提示', MB_YESNO + MB_ICONQUESTION) = ID_YES then
          begin
            dlg.Close;
            Exit;
          end
          else
          begin
            dlg.Cancel := False;
          end;
        end;
        dev := TDevice(dlg.ListView1.Items.Item[i].Data);
        if dev <> nil then
        begin
          CameraIndex := dlg.ComboBoxCamera.ItemIndex;
          if dlg.ComboBoxCameraCmd.ItemIndex = 0 then
            CameraCmd := 0
          else if dlg.ComboBoxCameraCmd.ItemIndex = 1 then
            CameraCmd := $FFFF
          else
            CameraCmd := StringToInteger(Trim(dlg.editZS.Text));    // 拍照命令
          PZSJJG := StringToInteger(Trim(dlg.editSJJG.Text));
          if dlg.radio1.Checked then
            SaveSign := 1 // 保存标志
          else if dlg.radio2.Checked then
            SaveSign := 0;
          GetPicSize := dlg.ComboBoxSize.ItemIndex; //照片尺寸大小 0=320x240  1=640x480  2-else
          TXZL := StringToInteger(Trim(dlg.editTXZL.Text), 1); // 图像质量
          LD := StringToInteger(Trim(dlg.editLD.Text));   // 亮度
          DBD := StringToInteger(Trim(dlg.editDBD.Text));  // 对比度
          BHD := StringToInteger(Trim(dlg.editBHD.Text));  // 饱和度
          SD := StringToInteger(Trim(dlg.editSD.Text));
          DataServer.GetAPicture(dev, CameraIndex, CameraCmd, PZSJJG, SaveSign, GetPicSize, TXZL, LD, DBD, BHD, SD);
        end;
        sleep(50);
        Application.ProcessMessages;
      end;
    end;
  finally
    dlg.Free;
  end;
end;

procedure TEarlyWarningFrm.FormShow(Sender: TObject);
  procedure SetEnViable(Sender: TObject; Pr: TPrivilege);
  begin
    if Sender is TAction then
    begin
      TAction(Sender).Enabled := Pr.Enabled;
      TAction(Sender).Visible := Pr.Visible;
    end;
    if Sender is TMenuItem then
    begin
      TMenuItem(Sender).Enabled := Pr.Enabled;
      TMenuItem(Sender).Visible := Pr.Visible;
    end;
  end;
var
  Pr: TPrivilege;
begin
  Pr := current_user.HasPrivilege(132100); //拍照
  SetEnViable(N6, Pr);

  Pr := current_user.HasPrivilege(132700); //下发回拨电话
  SetEnViable(N3, Pr);
end;

procedure TEarlyWarningFrm.LocalMap;
var
  i: Integer;
begin
  with umainf.Mainf do
  begin
    if (not FDlg_Map.Visible) or (FDlg_Map.Floating) then
    begin
//      FDlg_DRunData.ManualDock(PageControl_Center, nil, alLeft);
//      FDlg_DRunD-ata.show;
    end;

    if PageControl_Center.PageCount >1 then
    begin
      //设置 地图窗口为　活动层
      for i := 0 to PageControl_Center.PageCount - 1 do
      begin
        if PageControl_Center.Pages[i].Caption = FDlg_Map.Caption then
        begin
          try
            PageControl_Center.ActivePageIndex := i;
          except
            break;
          end;
          break;
        end;
      end;
    end;
    if not show_EarlyWarningCar.Checked then
      show_EarlyWarningCar.Checked := True;
  end;
end;

procedure TEarlyWarningFrm.ListView1DblClick(Sender: TObject);
var
  dev: TDevice;
begin
  if ListView1.Selected = nil then Exit;
  dev := ADeviceManage.find(ListView1.Selected.Caption);
  if dev = nil then Exit;
  GCurSelectDev := dev;
  LocalMap;
  mainf.Edit2.Text := (GCurSelectDev.Id);
  mainf.Edit1.Text := GCurSelectDev.Car.No;
  umainf.Mainf.fun_Locate_Car.Execute;
end;

procedure TEarlyWarningFrm.ListView1ColumnClick(Sender: TObject;
  Column: TListColumn);
begin
  ListView1.CustomSort(@CustormSortProc, Column.Index);
  LvSort := not LvSort;
end;

end.
