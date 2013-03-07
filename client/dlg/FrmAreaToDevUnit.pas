unit FrmAreaToDevUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MetaDefine,
  Dialogs, StdCtrls, Mask, RzEdit, RzRadChk, RzButton, ComCtrls, Buttons, FrmAlarmNoSybol, FrmRectangle,
  ExtCtrls, Menus, RzPanel, cxControls, cxSplitter, RzTabs, ConfineAreaUnit, CarUnit,
  Contnrs, FrmAllArea, IntegerListUnit, CmdStructUnit;

type

  TCMD = class
    areaID: integer;
    cmdid: integer;
    state: integer;
  end;

  TFrm_AreaToDev = class(TForm)
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    TabSheet3: TRzTabSheet;
    ListView2: TListView;
    ListView3: TListView;
    RzPanel1: TRzPanel;
    RzBitBtn2: TRzBitBtn;
    RzBitBtn1: TRzBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Timer1: TTimer;
    N2: TMenuItem;
    N3: TMenuItem;
    cxSplitter1: TcxSplitter;
    Panel2: TPanel;
    ListView5: TListView;
    Panel3: TPanel;
    ListView6: TListView;
    cxSplitter2: TcxSplitter;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    PopupMenu3: TPopupMenu;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    SplitterBottom: TcxSplitter;
    Panel1: TPanel;
    ListView4: TListView;
    ListView1: TListView;
    TabSheet4: TRzTabSheet;
    Panel4: TPanel;
    ListView7: TListView;
    cxSplitter3: TcxSplitter;
    ListView8: TListView;
    PopupMenu4: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListView2Click(Sender: TObject);
    procedure ListView3Click(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure ListView2DblClick(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure ListView3DblClick(Sender: TObject);
    procedure RzPageControl1Change(Sender: TObject);
    procedure ListView8Click(Sender: TObject);
    procedure ListView8DblClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OnSendDelete(Main_Id:integer;AssistantDev_IDstr: string;isdeleteAssistant: boolean);
    procedure addKindToListView(area: integer);
    procedure refershListview;
    procedure OnRefreshAreaDevList(areaType: Byte; flag: Byte);
  end;

var
  Frm_AreaToDev: TFrm_AreaToDev;
  DeletebaseArea: TBaseArea;
  cmdlist: Tobjectlist;
implementation
uses umainf, uGloabVar, ConstDefineUnit, FrmSetLineUnit, MapPubUnit{liusen};
{$R *.dfm}

{ TFrm_AreaToDev }

procedure TFrm_AreaToDev.addKindToListView(
  area: integer);
var
  i, kind: integer;
  baseArea: TBaseArea;
  CircleArea: TCircleArea;
  RectangleArea: TRectangleArea;
  NoSymbolArea: TNoSymbolArea;
  PolyLineArea: TPolyLineArea;
begin
  ListView1.Clear;
  ListView2.Clear;
  ListView3.Clear;
  ListView8.Clear;
  for i := FAllAreaManage.ALLCircleList.Count - 1 downto 0 do
  begin
    baseArea := TBaseArea(FAllAreaManage.ALLCircleList.Items[i]);
    kind := baseArea.AreaPictureKind;
    case kind of
      0: begin
          ListView1.Items.BeginUpdate;
          CircleArea := TCircleArea(baseArea);
          with ListView1.Items.Add do
          begin
            Caption := inttostr(CircleArea.AreaID);
            SubItems.Add(IntToStr(CircleArea.areaNO));
            subitems.Add(CircleArea.AreaName);
            subitems.Add(IntToStr(CircleArea.AreaAlarmKind));
            {case CircleArea.AreaAlarmKind of
              0: begin
                  subitems.Add('不报警');
                end;
              1: begin
                  subitems.Add('进区域报警');
                end;
              2: begin
                  subitems.Add('出区域报警');
                end;
            end; }
            subitems.Add(inttostr(CircleArea.maxSpeed));
            subitems.Add(inttostr(CircleArea.continueTime));
            subitems.Add(formatfloat('0.000', CircleArea.ACircle.X) + ',' + formatfloat('0.000', CircleArea.ACircle.y));
            subitems.Add(inttostr(CircleArea.radius));
          end;
          ListView1.Items.EndUpdate;
        end;
      1: begin
          ListView2.Items.BeginUpdate;
          RectangleArea := TRectangleArea(baseArea);
          with ListView2.Items.Add do
          begin
            Caption := inttostr(RectangleArea.AreaID);
            SubItems.Add(IntToStr(RectangleArea.areaNO));
            subitems.Add(RectangleArea.AreaName);
            subitems.Add(IntToStr(RectangleArea.AreaAlarmKind));
            {case RectangleArea.AreaAlarmKind of
              0: begin
                  subitems.Add('不报警');
                end;
              1: begin
                  subitems.Add('进区域报警');
                end;
              2: begin
                  subitems.Add('出区域报警');
                end;
            end;  }
            subitems.Add(inttostr(RectangleArea.maxSpeed));
            subitems.Add(inttostr(RectangleArea.continueTime));
            subitems.Add(formatfloat('0.000', RectangleArea.leftPoint.Longitude) + ',' + formatfloat('0.000', RectangleArea.leftPoint.Latitude));
            subitems.Add(formatfloat('0.000', RectangleArea.RightPoint.Longitude) + ',' + formatfloat('0.000', RectangleArea.RightPoint.Latitude));
          end;
          ListView2.Items.EndUpdate;
        end;
      2: begin
          ListView3.Items.BeginUpdate;
          NoSymbolArea := TNoSymbolArea(baseArea);
          with ListView3.Items.Add do
          begin
            Caption := inttostr(NoSymbolArea.AreaID);
            SubItems.Add(IntToStr(NoSymbolArea.areaNO));
            subitems.Add(NoSymbolArea.AreaName);
            subitems.Add(IntToStr(NoSymbolArea.AreaAlarmKind));
            {case NoSymbolArea.AreaAlarmKind of
              0: begin
                  subitems.Add('不报警');
                end;
              1: begin
                  subitems.Add('进区域报警');
                end;
              2: begin
                  subitems.Add('出区域报警');
                end;
            end; }
            subitems.Add(inttostr(NoSymbolArea.maxSpeed));
            subitems.Add(inttostr(NoSymbolArea.continueTime));
            subitems.Add(NoSymbolArea.AreaParMcu);

          end;
          ListView3.Items.EndUpdate;
        end;
      3:begin
          ListView8.Items.BeginUpdate;
          try
            PolyLineArea := TPolyLineArea(baseArea);
            with ListView8.Items.Add do
            begin
              Caption := inttostr(PolyLineArea.AreaID);
              SubItems.Add(IntToStr(PolyLineArea.areaNO));
              subitems.Add(PolyLineArea.AreaName);
              SubItems.Add(IntToStr(PolyLineArea.LineSectionCount));
            end;
          finally
            ListView8.Items.EndUpdate;
          end;
        end;
      
    end;
  end;
end;

procedure TFrm_AreaToDev.N1Click(Sender: TObject);
var
  areaId, areaNo, i: integer;
  dev: TDevice;
  Area: array of byte;
  cmd: TCMD;
  AreaList: TStringList;
begin
  //删除区域
  try
    if listview1.Selected <> nil then
    begin
      AreaList := TStringList.Create;
      areaId := strtoint(listview1.Selected.Caption);
      areaNo := StrToInt(ListView1.Selected.SubItems.Strings[0]);
      AreaList.Add(IntToStr(areaNo));
      //先发送删除车辆区域对应关系
      if listview4.Items.Count = 0 then //未分配的时候直接删除
      begin
        FAllAreaManage.Delete(areaId);
        bs.DeleteArea_New(areaId);
        listview1.Selected.Delete;
        // liusen
        DeleteACircleToDev(areaId);
        //fmap.Draw;
      end else
      begin
        //根据ID号找DEV
        setlength(area, 2);
        for i := 0 to listview4.Items.Count - 1 do
        begin
          cmd := Tcmd.Create;
          dev := ADeviceManage.find(listview4.Items.Item[i].Caption);
          if dev <> nil then
          begin
            DataServer.SendDeleteAreaListForDev_V3(TERMSRV_DELCIRCLEAREA_V3 ,dev, AreaList, True);
          end;
        end;
      end;
    end;
  finally
    AreaList.Free;
  end;
end;

procedure TFrm_AreaToDev.FormShow(Sender: TObject);
begin
  ListView1.Clear;
  ListView2.Clear;
  ListView3.Clear;
  ListView8.Clear;
  refershListview;
end;

procedure TFrm_AreaToDev.refershListview;
var
  i: integer;
  kind: integer;
  CircleArea: TCircleArea;
  RectangleArea: TRectangleArea;
  NoSymbolArea: TNoSymbolArea;
  polyLineArea: TPolyLineArea;
begin
  for i := FAllAreaManage.ALLCircleList.Count - 1 downto 0 do
  begin
    kind := TBaseArea(FAllAreaManage.ALLCircleList.Items[i]).AreaPictureKind;
    case kind of
      0: begin
          ListView1.Items.BeginUpdate;
          CircleArea := TCircleArea(FAllAreaManage.ALLCircleList.Items[i]);
          with ListView1.Items.Add do
          begin
            Caption := inttostr(CircleArea.AreaID);
            SubItems.Add(IntToStr(CircleArea.areaNO));
            subitems.Add(CircleArea.AreaName);
            SubItems.Add(IntToStr(CircleArea.AreaAlarmKind));
            {case CircleArea.AreaAlarmKind of
              0: begin
                  subitems.Add('不报警');
                end;
              1: begin
                  subitems.Add('进区域报警');
                end;
              2: begin
                  subitems.Add('出区域报警');
                end;
              else
                SubItems.Add('圆形报警');
            end;  }
            subitems.Add(inttostr(CircleArea.maxSpeed));
            subitems.Add(inttostr(CircleArea.continueTime));
            subitems.Add(formatfloat('0.000', CircleArea.ACircle.X) + ',' + formatfloat('0.000', CircleArea.ACircle.y));
            subitems.Add(inttostr(CircleArea.radius));
          end;
          ListView1.Items.EndUpdate;
        end;
      1: begin
          ListView2.Items.BeginUpdate;
          RectangleArea := TRectangleArea(FAllAreaManage.ALLCircleList.Items[i]);
          with ListView2.Items.Add do
          begin
            Caption := inttostr(RectangleArea.AreaID);
            SubItems.Add(IntToStr(RectangleArea.areaNO));
            subitems.Add(RectangleArea.AreaName);
            SubItems.Add(IntToStr(RectangleArea.AreaAlarmKind));
            {case RectangleArea.AreaAlarmKind of
              0: begin
                  subitems.Add('不报警');
                end;
              1: begin
                  subitems.Add('进区域报警');
                end;
              2: begin
                  subitems.Add('出区域报警');
                end;
            end;  }
            subitems.Add(inttostr(RectangleArea.maxSpeed));
            subitems.Add(inttostr(RectangleArea.continueTime));
            subitems.Add(formatfloat('0.000', RectangleArea.leftPoint.Longitude) + ',' + formatfloat('0.000', RectangleArea.leftPoint.Latitude));
            subitems.Add(formatfloat('0.000', RectangleArea.RightPoint.Longitude) + ',' + formatfloat('0.000', RectangleArea.RightPoint.Latitude));
          end;
          ListView2.Items.EndUpdate;
        end;
      2: begin
          ListView3.Items.BeginUpdate;
          NoSymbolArea := TNoSymbolArea(FAllAreaManage.ALLCircleList.Items[i]);
          with ListView3.Items.Add do
          begin
            Caption := inttostr(NoSymbolArea.AreaID);
            SubItems.Add(IntToStr(NoSymbolArea.areaNO));
            subitems.Add(NoSymbolArea.AreaName);
            SubItems.Add(IntToStr(NoSymbolArea.AreaAlarmKind));
            {case NoSymbolArea.AreaAlarmKind of
              0: begin
                  subitems.Add('不报警');
                end;
              1: begin
                  subitems.Add('进区域报警');
                end;
              2: begin
                  subitems.Add('出区域报警');
                end;
            end;   }
            subitems.Add(inttostr(NoSymbolArea.maxSpeed));
            subitems.Add(inttostr(NoSymbolArea.continueTime));
            subitems.Add(NoSymbolArea.AreaParMcu);

          end;
          ListView3.Items.EndUpdate;
        end;
      3:begin
          ListView8.Items.BeginUpdate;
          polyLineArea := TPolyLineArea(FAllAreaManage.AllCircleList.Items[i]);
          with ListView8.Items.Add do
          begin
            Caption := inttostr(PolyLineArea.AreaID);
            SubItems.Add(IntToStr(PolyLineArea.areaNO));
            subitems.Add(PolyLineArea.AreaName);
            SubItems.Add(IntToStr(PolyLineArea.LineSectionCount));
          end;
          ListView8.Items.EndUpdate;
        end;
    end;
  end;

end;

procedure TFrm_AreaToDev.ListView1Click(Sender: TObject);
var
  area_id, i: integer;
  BaseArea: TBaseArea;
  devID: string;
  dev: TDevice;
begin
  //根据 ID号  找到对应的区域 找到对应的车辆列表

  if listview1.Selected <> nil then
  begin
    listview4.Items.Clear;
    area_id := strtoint(listview1.Selected.Caption);
    BaseArea := FAllAreaManage.find(area_id);
    if BaseArea <> nil then
    begin
      listview4.Items.BeginUpdate;
      for i := 0 to BaseArea.AreaDevList.Count - 1 do
      begin
        with listview4.Items.Add do
        begin
          devID := BaseArea.AreaDevList.Strings[i];
          dev := ADeviceManage.find(devID);
          caption := dev.IdStr;
          subitems.Add(dev.Car.No);
        end;
      end;
      listview4.Items.EndUpdate;
    end;
  end;
end;

procedure TFrm_AreaToDev.Timer1Timer(Sender: TObject);
var
  i: integer;
begin
  if DeletebaseArea <> nil then
  begin
    if DeletebaseArea.AreaDevList.Count = 0 then //删除的对象  如果等到  全部命令处理结束 就返回结果
    begin
      FAllAreaManage.Delete(DeletebaseArea.AreaID);
      DeletebaseArea := nil;
    end else
    begin
      //返回处理  根据命令序号  检查  是否完全处理结束  当处理结束时候 执行状态修改


    end;

  end;
end;

procedure TFrm_AreaToDev.FormCreate(Sender: TObject);
begin
  cmdlist := TobjectList.Create;
end;

procedure TFrm_AreaToDev.ListView2Click(Sender: TObject);
var
  area_id, i: integer;
  BaseArea: TBaseArea;
  devID: string;
  dev: TDevice;
begin
  //根据 ID号  找到对应的区域 找到对应的车辆列表
  {for i := 0 to FAllAreaManage.AllCircleList.Count - 1 do
  begin
    BaseArea := TBaseArea(FAllAreaManage.AllCircleList.Items[i]);
    BaseArea.isshow := false;
  end;}

  if listview2.Selected <> nil then
  begin
    listview5.Items.Clear;
    area_id := strtoint(listview2.Selected.Caption);
    BaseArea := FAllAreaManage.find(area_id);
    if BaseArea <> nil then
    begin
      BaseArea.isshow := true;
      listview5.Items.BeginUpdate;
      for i := 0 to BaseArea.AreaDevList.Count - 1 do
      begin
        with listview5.Items.Add do
        begin
          devID := BaseArea.AreaDevList.Strings[i];
          dev := ADeviceManage.find(devID);
          caption := dev.IdStr;
          subitems.Add(dev.Car.No);
        end;
      end;
      listview5.Items.EndUpdate;
    end;
  end;
end;


procedure TFrm_AreaToDev.ListView3Click(Sender: TObject);
var
  area_id, i: integer;
  BaseArea: TBaseArea;
  devID: string;
  dev: TDevice;
begin
  //根据 ID号  找到对应的区域 找到对应的车辆列表
  if listview3.Selected <> nil then
  begin
    listview6.Clear;
    area_id := strtoint(listview3.Selected.Caption);
    BaseArea := FAllAreaManage.find(area_id);
    if BaseArea <> nil then
    begin
      listview6.Items.BeginUpdate;
      for i := 0 to BaseArea.AreaDevList.Count - 1 do
      begin
        with listview6.Items.Add do
        begin
          devID := BaseArea.AreaDevList.Strings[i];
          dev := ADeviceManage.find(devID);
          caption := dev.IdStr;
          subitems.Add(dev.Car.No);
        end;
      end;
      listview6.Items.EndUpdate;
    end;
  end;
end;


procedure TFrm_AreaToDev.ListView1DblClick(Sender: TObject);
var
  ep: TEarthPoint;
  wp: TWorldPoint;
  area_id: integer;
  BaseArea: TBaseArea;
begin
  //居中 处理

  if listview1.Selected <> nil then
  begin
    area_id := strtoint(listview1.Selected.Caption);
    BaseArea := FAllAreaManage.find(area_id);
    if BaseArea <> nil then
    begin
      if GlobalParam.isAutoChangeMap then Mainf.fun_ChangeMap.Execute;
      ep := TCircleArea(FAllAreaManage.find(area_id)).ACircle;
      // liusen
      Locate_ConfineArea(ep.Longitude, ep.Latitude);

      //wp := FMap.Projection.LoLa2XY(ep);
      //FMap.Zoom(1, wp);
      //FMap.Draw;
    end;
  end;

end;

procedure TFrm_AreaToDev.ListView2DblClick(Sender: TObject);
var
  ep: TEarthPoint;
  wp: TWorldPoint;
  area_id: integer;
  BaseArea: TBaseArea;
begin
  //居中 处理

  if listview2.Selected <> nil then
  begin
    area_id := strtoint(listview2.Selected.Caption);
    BaseArea := FAllAreaManage.find(area_id);
    if BaseArea <> nil then
    begin
      if GlobalParam.isAutoChangeMap then Mainf.fun_ChangeMap.Execute;
      ep := TRectangleArea(FAllAreaManage.find(area_id)).leftPoint;
      // liusen
      Locate_ConfineArea(ep.Longitude, ep.Latitude);
      //wp := FMap.Projection.LoLa2XY(ep);
      //FMap.Zoom(1, wp);
      //FMap.Draw;
    end;
  end;
end;

procedure TFrm_AreaToDev.RzBitBtn2Click(Sender: TObject);
begin
  case RzPageControl1.ActivePageIndex of
    0: begin
        if ListView1.Selected <> nil then
        begin
          messagebox(handle, '请选择要删除的电子围栏！', '提示', mb_ok + mb_iconinformation);
          exit;
        end;
        N1.Click;
      end;
    1: begin
        if ListView2.Selected <> nil then
        begin
          messagebox(handle, '请选择要删除的电子围栏！', '提示', mb_ok + mb_iconinformation);
          exit;
        end;
        MenuItem1.Click;
      end;
    2: begin
        if ListView3.Selected <> nil then
        begin
          messagebox(handle, '请选择要删除的电子围栏！', '提示', mb_ok + mb_iconinformation);
          exit;
        end;
        MenuItem4.Click;
      end;
  end;
end;

procedure TFrm_AreaToDev.MenuItem3Click(Sender: TObject);
var
  dlg: TFrm_AllArea;
  i: integer;
  dev: TDevice;
  RectangleArea: TRectangleArea;
  tempComponent: TComponent;
  setType: Byte;
begin
  if ListView2.Selected = nil then exit;
  try
    RectangleArea := TRectangleArea(FAllAreaManage.find(strtoint(ListView2.Selected.Caption)));
    if RectangleArea = nil then exit;

    dlg := TFrm_AllArea.Create(self);
    dlg.Notebook1.PageIndex := AREASHAPE_RECT;

    dlg.areaID.Text := inttostr(RectangleArea.AreaID);
    dlg.Edit_NO.Text := IntToStr(RectangleArea.areaNO);
    dlg.Edit2.Text := RectangleArea.AreaName;
    dlg.Edit4.Text := '矩形';

    dlg.EditLeftLong.Text := formatfloat('0.000',RectangleArea.leftPoint.Longitude);
    dlg.EditLeftLat.Text := formatfloat('0.000',RectangleArea.leftPoint.Latitude);
    dlg.EditRightLong.Text := formatfloat('0.000',RectangleArea.RightPoint.Longitude);
    dlg.EditRightLat.Text := formatfloat('0.000',RectangleArea.RightPoint.Latitude);

    dlg.CheckBoxEveryDay.Checked := RectangleArea.IsEveryDay;
    dlg.beginDate.DateTime := RectangleArea.beginDateTiem;
    dlg.beginTime.DateTime := RectangleArea.beginDateTiem;
    dlg.endDate.DateTime := RectangleArea.endDateTime;
    dlg.endTime.Time := RectangleArea.endDateTime;

    dlg.Edit_MaxSpeed.Text := inttostr(RectangleArea.maxSpeed);
    dlg.Edit_time.Text := inttostr(RectangleArea.continueTime);
    dlg.Area_Property := RectangleArea.AreaAlarmKind;

    for i:=0 to 7 do
    begin
      if (dlg.Area_Property and $1) = 1 then
      begin
        tempComponent := dlg.FindComponent('checkBox' + IntToStr(i+1));
        TCheckBox(tempComponent).Checked := True;
      end;
      dlg.Area_Property := dlg.Area_Property shr 1;
    end;

    if RectangleArea.isshow then
    begin
      dlg.ComboBox1.ItemIndex := 0;
    end else
    begin
      dlg.ComboBox1.ItemIndex := 1;
    end;
    dlg.GroupBox3.Enabled := False;
//    if listview5.Items.Count > 0 then
//    begin
//      for i := 0 to ListView5.Items.Count - 1 do
//      begin
//        dev := ADeviceManage.find(ListView5.Items.Item[i].Caption);
//        if dev <> nil then
//        begin
//          with dlg.ListView1.Items.Add do
//          begin
//            caption := ListView5.Items.Item[i].SubItems[0];
//            data := dev;
//          end;
//        end;
//      end;
//    end;
    if dlg.ShowModal = mrOk then
    begin
      if dlg.rbUpdate.Checked then
        setType := 0
      else if dlg.rbAttach.Checked then
        setType := 1
      else if dlg.rbModify.Checked then
        setType := 2
      else
        setType := 1;
      for i:=0 to dlg.listview1.Items.Count-1 do
      begin
        dev := TDevice(dlg.listview1.Items.Item[i].Data);
        if dev <> nil then
          DataServer.SendSetRectangleArea_New_V3(dev, RectangleArea, setType);
      end;
    end;
//    ListView2.Selected.SubItems.Strings[0] := IntToStr(RectangleArea.AreaNo);
//    ListView2.Selected.SubItems.Strings[1] := RectangleArea.AreaName;
//    ListView2.Selected.SubItems.Strings[2] := IntToStr(dlg.Area_Property);
//    ListView2.Selected.SubItems.Strings[3] := inttostr(RectangleArea.maxSpeed);
//    ListView2.Selected.SubItems.Strings[4] := inttostr(RectangleArea.continueTime);
//    ListView2.Selected.SubItems.Strings[5] := formatfloat('0.000', RectangleArea.leftPoint.Longitude) + ',' + formatfloat('0.000', RectangleArea.leftPoint.Latitude);
//    ListView2.Selected.SubItems.Strings[6] := formatfloat('0.000', RectangleArea.RightPoint.Longitude) + ',' + formatfloat('0.000', RectangleArea.RightPoint.Latitude)
  finally
    dlg.Free;
  end;
end;

procedure TFrm_AreaToDev.MenuItem6Click(Sender: TObject);

var
  dlg: TFrm_AllArea;
  i: integer;
  dev: TDevice;
  NoSymbolArea: TNoSymbolArea;
  tempComponent: TComponent;
begin
  if ListView3.Selected = nil then exit;
  try
    NoSymbolArea := TNoSymbolArea(FAllAreaManage.find(strtoint(ListView3.Selected.Caption)));
    if NoSymbolArea = nil then exit;

    dlg := TFrm_AllArea.Create(self);
    dlg.Notebook1.PageIndex := AREASHAPE_POLY;
    dlg.areaID.Text := inttostr(NoSymbolArea.AreaID);
    dlg.Edit_NO.Text := IntToStr(NoSymbolArea.areaNO);
    dlg.Edit2.Text := NoSymbolArea.AreaName;
    dlg.Edit4.Text := '不规则图形';

    dlg.beginDate.DateTime := NoSymbolArea.beginDateTiem;
    dlg.beginTime.DateTime := NoSymbolArea.beginDateTiem;
    dlg.endDate.DateTime := NoSymbolArea.endDateTime;
    dlg.endTime.Time := NoSymbolArea.endDateTime;

    dlg.Edit_MaxSpeed.Text := inttostr(NoSymbolArea.maxSpeed);
    dlg.Edit_time.Text := inttostr(NoSymbolArea.continueTime);
    dlg.Area_Property := NoSymbolArea.AreaAlarmKind;

    for i:=0 to 7 do
    begin
      if (dlg.Area_Property and $1) = 1 then
      begin
        tempComponent := dlg.FindComponent('checkBox' + IntToStr(i+1));
        TCheckBox(tempComponent).Checked := True;
      end;
      dlg.Area_Property := dlg.Area_Property shr 1;
    end;

    if NoSymbolArea.isshow then
    begin
      dlg.ComboBox1.ItemIndex := 0;
    end else
    begin
      dlg.ComboBox1.ItemIndex := 1;
    end;
    dlg.GroupBox3.Enabled := False;
//    if listview6.Items.Count > 0 then
//    begin
//      for i := 0 to ListView6.Items.Count - 1 do
//      begin
//        dev := ADeviceManage.find(ListView6.Items.Item[i].Caption);
//        if dev <> nil then
//        begin
//          with dlg.ListView1.Items.Add do
//          begin
//            caption := ListView6.Items.Item[i].SubItems[0];
//            data := dev;
//          end;
//        end;
//      end;
//    end;
    dlg.rbUpdate.Visible := False;
    dlg.rbAttach.Visible := False;
    dlg.rbModify.Visible := False;
    if dlg.ShowModal = mrOk then
    begin
      for i:=0 to dlg.listview1.Items.Count-1 do
      begin
        dev := TDevice(dlg.listview1.Items.Item[i].Data);
        if dev <> nil then
          DataServer.SendSetNoSymbolArea_New_V3(dev, NoSymbolArea)
      end;
    end;
//    ListView3.Selected.SubItems.Strings[0] := inttostr(NoSymbolArea.areaNO);
//    ListView3.Selected.SubItems.Strings[1] := NoSymbolArea.AreaName;
//    ListView3.Selected.SubItems.Strings[2] := IntToStr(dlg.Area_Property);
//    ListView3.Selected.SubItems.Strings[3] := inttostr(NoSymbolArea.maxSpeed);
//    ListView3.Selected.SubItems.Strings[4] := inttostr(NoSymbolArea.continueTime);
//    ListView3.Selected.SubItems.Strings[5] := NoSymbolArea.AreaParMCU;
  finally
    dlg.Free;
  end;
end;

procedure TFrm_AreaToDev.MenuItem4Click(Sender: TObject);

var
  areaId, areaNo, i: integer;
  dev: TDevice;
//  Area: array of byte;
  cmd: TCMD;
  AreaList: TStringList;
begin
  //删除区域
  try
    if listview3.Selected <> nil then
    begin
      AreaList := TStringList.Create;
      areaId := strtoint(listview3.Selected.Caption);
      areaNo := StrToInt(ListView3.Selected.SubItems.Strings[0]);
      AreaList.Add(IntToStr(areaNo));
      //先发送删除车辆区域对应关系
      if listview6.Items.Count = 0 then //未分配的时候直接删除
      begin
        FAllAreaManage.Delete(areaId);
        bs.DeleteArea_New(areaId);
        listview3.Selected.Delete;
        // liusen
        DeleteAConfineAreaToDev(areaId);
      end else
      begin
        //根据ID号找DEV
//        setlength(area, 2);
        for i := 0 to listview6.Items.Count - 1 do
        begin
//          cmd := Tcmd.Create;
          dev := ADeviceManage.find(listview6.Items.Item[i].Caption);
//          area[0] := strtoint('$' + copy(inttohex(area_id, 4), 3, 2));
//          area[1] := strtoint('$' + copy(inttohex(area_id, 4), 1, 2));
          if dev <> nil then
          begin
             DataServer.SendDeleteAreaListForDev_V3(TERMSRV_DELPOLYGONAREA_V3 ,dev, AreaList, True);
            //cmd.state := 0;
            //cmd.cmdid := DataServer.SendDeleteAreaListForDev(dev, Area);
          end;
        end;

      end;
      // liusen
      //Fmap.Draw;
    end;
  finally
    AreaList.Free;
  end;
end;

procedure TFrm_AreaToDev.N3Click(Sender: TObject);
var
  dlg: TFrm_AllArea;
  i: integer;
  dev: TDevice;
  CircleArea: TCircleArea;
  tempComponent: TComponent;
  setType: Byte;
begin
  if ListView1.Selected = nil then exit;
  try
    CircleArea := TCircleArea(FAllAreaManage.find(strtoint(ListView1.Selected.Caption)));
    if CircleArea = nil then exit;

    dlg := TFrm_AllArea.Create(self);
    dlg.Notebook1.PageIndex := AREASHAPE_CIRCLE;
    dlg.areaID.Text := inttostr(CircleArea.AreaID);
    dlg.Edit_NO.Text := IntToStr(CircleArea.areaNO);
    dlg.Edit2.Text := CircleArea.AreaName;
    dlg.Edit4.Text := '圆形';

    dlg.Edit3.Text := floattostr(CircleArea.ACircle.Longitude);
    dlg.Edit5.Text := floattostr(CircleArea.ACircle.Latitude);
    dlg.Edit6.Text := inttostr(CircleArea.radius);

    dlg.CheckBoxEveryDay.Checked := CircleArea.IsEveryDay;
    dlg.beginDate.DateTime := CircleArea.beginDateTiem;
    dlg.beginTime.DateTime := CircleArea.beginDateTiem;
    dlg.endDate.DateTime := CircleArea.endDateTime;
    dlg.endTime.Time := CircleArea.endDateTime;

    dlg.Edit_MaxSpeed.Text := inttostr(CircleArea.maxSpeed);
    dlg.Edit_time.Text := inttostr(CircleArea.continueTime);
    dlg.Area_Property := CircleArea.AreaAlarmKind;
    
    for i:=0 to 7 do
    begin
      if (dlg.Area_Property and $1) = 1 then
      begin
        tempComponent := dlg.FindComponent('checkBox' + IntToStr(i+1));
        TCheckBox(tempComponent).Checked := True;
      end;
      dlg.Area_Property := dlg.Area_Property shr 1;
    end;

    if CircleArea.isshow then
    begin
      dlg.ComboBox1.ItemIndex := 0;
    end else
    begin
      dlg.ComboBox1.ItemIndex := 1;
    end;
    dlg.GroupBox3.Enabled := False;
    {已经设置过的就不在重复设置
    if listview4.Items.Count > 0 then
    begin
      for i := 0 to ListView4.Items.Count - 1 do
      begin
        dev := ADeviceManage.find(ListView4.Items.Item[i].Caption);
        if dev <> nil then
        begin
          with dlg.ListView1.Items.Add do
          begin
            caption := ListView4.Items.Item[i].SubItems[0];
            data := dev;
          end;
        end;
      end;
    end; }
    if dlg.ShowModal = mrOk then
    begin
      if dlg.rbUpdate.Checked then
        setType := 0
      else if dlg.rbAttach.Checked then
        setType := 1
      else if dlg.rbModify.Checked then
        setType := 2
      else
        setType := 1;

      for i:=0 to dlg.listview1.Items.Count-1 do
      begin
        dev := TDevice(dlg.listview1.Items.Item[i].Data);
        if dev <> nil then
          DataServer.SendSetCircleArea_New_V3(dev, CircleArea, setType);
      end;
    end;
//    ListView1.Selected.SubItems.Strings[0] := IntToStr(CircleArea.areaNO);
//    ListView1.Selected.SubItems.Strings[1] := CircleArea.AreaName;
//    ListView1.Selected.SubItems.Strings[2] := IntToStr(dlg.Area_Property);
//    ListView1.Selected.SubItems.Strings[3] := inttostr(CircleArea.maxSpeed);
//    ListView1.Selected.SubItems.Strings[4] := inttostr(CircleArea.continueTime);
//    ListView1.Selected.SubItems.Strings[5] := formatfloat('0.000', CircleArea.ACircle.X) + ',' + formatfloat('0.000', CircleArea.ACircle.y);
//    ListView1.Selected.SubItems.Strings[6] := inttostr(CircleArea.radius);
  finally
    dlg.Free;
  end;
end;

procedure TFrm_AreaToDev.MenuItem1Click(Sender: TObject);

var
  areaId, areaNo, i: integer;
  dev: TDevice;
  Area: array of byte;
  cmd: TCMD;
  AreaList: TStringList;
begin
  //删除区域
  try
    if listview2.Selected <> nil then
    begin
      AreaList := TStringList.Create;
      areaId := strtoint(listview2.Selected.Caption);
      areaNo := StrToInt(ListView2.Selected.SubItems.Strings[0]);
      AreaList.Add(IntToStr(areaNo));
      //先发送删除车辆区域对应关系
      if listview5.Items.Count = 0 then //未分配的时候直接删除
      begin
        FAllAreaManage.Delete(areaId);
        bs.DeleteArea_New(areaId);
        listview2.Selected.Delete;
        // liusen
        DeleteAConfineAreaToDev(areaId);
      end else
      begin
        //根据ID号找DEV
        setlength(area, 2);
        for i := 0 to listview5.Items.Count - 1 do
        begin
//          cmd := Tcmd.Create;
          dev := ADeviceManage.find(listview5.Items.Item[i].Caption);
//          area[0] := strtoint('$' + copy(inttohex(area_id, 4), 3, 2));
//          area[1] := strtoint('$' + copy(inttohex(area_id, 4), 1, 2));
          if dev <> nil then
          begin
            DataServer.SendDeleteAreaListForDev_V3(TERMSRV_DELRECTAREA_V3 ,dev, AreaList, True);
            //cmd.state := 0;
            //cmd.cmdid := DataServer.SendDeleteAreaListForDev(dev, Area);
          end;
        end;

      end;
      Fmap.Draw;
    end;
  finally
    AreaList.Free;
  end;
end;

procedure TFrm_AreaToDev.ListView3DblClick(Sender: TObject);

var
  ep: TEarthPoint;
  wp: TWorldPoint;
  area_id: integer;
  BaseArea: TBaseArea;
begin
  //居中 处理

  if listview3.Selected <> nil then
  begin
    area_id := strtoint(listview3.Selected.Caption);
    BaseArea := FAllAreaManage.find(area_id);
    if BaseArea <> nil then
    begin
      if GlobalParam.isAutoChangeMap then Mainf.fun_ChangeMap.Execute;

      wp := TNoSymbolArea(FAllAreaManage.find(area_id)).WorldPointAry[0];

      // liusen
      ep := Project.XY2LoLa(wp);
      Locate_ConfineArea(ep.Longitude, ep.Latitude);
      //FMap.Zoom(1, wp);
      //FMap.Draw;
    end;
  end; //
end;

procedure TFrm_AreaToDev.RzPageControl1Change(Sender: TObject);
begin
  case RzPageControl1.ActivePageIndex of
    0: begin

      end;
    1: begin
      end;
    2: begin
      end;
  end;
end;

procedure TFrm_AreaToDev.OnSendDelete(Main_Id: integer;
  AssistantDev_IDstr: string; isdeleteAssistant: boolean);
begin

end;

//刷新区域关联的车机
procedure TFrm_AreaToDev.OnRefreshAreaDevList(areaType: Byte; flag: Byte);
begin
  if flag = 0 then
  begin
    case areaType of
      0: ListView1Click(nil);
      1: ListView2Click(nil);
      2: ListView3Click(nil);
      3: ListView8Click(nil);
    end;
  end
  else if flag = 1 then
  begin
    ListView1.Clear;
    ListView2.Clear;
    ListView3.Clear;
    ListView4.Clear;
    ListView5.Clear;
    ListView6.Clear;
    ListView7.Clear;
    ListView8.Clear;
    refershListview;
  end;  
end;

procedure TFrm_AreaToDev.ListView8Click(Sender: TObject);
var
  area_id, i: integer;
  BaseArea: TBaseArea;
  devID: string;
  dev: TDevice;
begin
  //根据 ID号  找到对应的区域 找到对应的车辆列表
  if listview8.Selected <> nil then
  begin
    listview7.Clear;
    area_id := strtoint(listview8.Selected.Caption);
    BaseArea := FAllAreaManage.find(area_id);
    if BaseArea <> nil then
    begin
      listview7.Items.BeginUpdate;
      for i := 0 to BaseArea.AreaDevList.Count - 1 do
      begin
        with listview7.Items.Add do
        begin
          devID := BaseArea.AreaDevList.Strings[i];
          dev := ADeviceManage.find(devID);
          caption := dev.IdStr;
          subitems.Add(dev.Car.No);
        end;
      end;
      listview7.Items.EndUpdate;
    end;
  end;
end;

procedure TFrm_AreaToDev.ListView8DblClick(Sender: TObject);
var
  ep: TEarthPoint;
  wp: TWorldPoint;
  area_id: integer;
  BaseArea: TBaseArea;
begin
  //居中 处理
  if listview8.Selected <> nil then
  begin
    area_id := strtoint(listview8.Selected.Caption);
    BaseArea := FAllAreaManage.find(area_id);
    if BaseArea <> nil then
    begin
      if GlobalParam.isAutoChangeMap then Mainf.fun_ChangeMap.Execute;

      wp := TPolyLineArea(FAllAreaManage.find(area_id)).WorldPointAry[0];

      // liusen
      ep := Project.XY2LoLa(wp);
      Locate_ConfineArea(ep.Longitude, ep.Latitude);

      //FMap.Zoom(1, wp);
      //FMap.Draw;
    end;
  end; //
end;

//删除路线
procedure TFrm_AreaToDev.N4Click(Sender: TObject);
var
  areaId, areaNo, i: integer;
  dev: TDevice;
  cmd: TCMD;
  AreaList: TStringList;
begin
  try
    if listview8.Selected <> nil then
    begin
      AreaList := TStringList.Create;
      areaId := strtoint(listview8.Selected.Caption);
      areaNo := strtoint(listview8.Selected.SubItems.Strings[0]);
      AreaList.Add(IntToStr(areaNo));
      //先发送删除车辆区域对应关系
      if listview7.Items.Count = 0 then //未分配的时候直接删除
      begin
        bs.DeleteArea_New(areaId);
        listview8.Selected.Delete;
        // liusen
        DeleteLines(areaId);
        FAllAreaManage.Delete(areaId);
      end else
      begin
        for i := 0 to listview7.Items.Count - 1 do
        begin
          dev := ADeviceManage.find(listview7.Items.Item[i].Caption);
          if dev <> nil then
          begin
            DataServer.SendDeleteAreaListForDev_V3(TERMSRV_DELLINE_V3 ,dev, AreaList, True);
          end;
        end;
      end;
    end;
  finally
    AreaList.Free;
  end;
end;

procedure TFrm_AreaToDev.N6Click(Sender: TObject);
var
  i: Integer;
  dlg: TfrmSetLine;
  tempComponent: TComponent;
  polyLineArea: TPolyLineArea;
  dev: TDevice;
begin
  if ListView8.Selected = nil then exit;
  try
    polyLineArea := TPolyLineArea(FAllAreaManage.find(strtoint(ListView8.Selected.Caption)));
    if polyLineArea = nil then exit;

    dlg := TfrmSetLine.Create(self);
    dlg.edtLineNo.Text := IntToStr(polyLineArea.areaNO);
    dlg.edtLineName.Text := polyLineArea.AreaName;

    dlg.beginDate.DateTime := polyLineArea.beginDateTiem;
    dlg.beginTime.DateTime := polyLineArea.beginDateTiem;
    dlg.endDate.DateTime := polyLineArea.endDateTime;
    dlg.endTime.Time := polyLineArea.endDateTime;

    dlg.LineProperty := polyLineArea.AreaAlarmKind;

    for i:=0 to 7 do
    begin
      if (dlg.LineProperty and $1) = 1 then
      begin
        tempComponent := dlg.FindComponent('checkBox' + IntToStr(i+1));
        if tempComponent <> nil then
          TCheckBox(tempComponent).Checked := True;
      end;
      dlg.LineProperty := dlg.LineProperty shr 1;
    end;
    dlg.Panel1.Enabled := False;
    if dlg.ShowModal = mrOK then
    begin
      for i := 0 to dlg.ListView1.Items.Count - 1 do
      begin
        dev := TDevice(dlg.ListView1.Items.Item[i].Data);
        if dev <> nil then
        begin
          DataServer.SendSetLineToDev_V3(dev, polyLineArea);
        end;  
      end;  
    end;
  finally
    dlg.Free;
  end;
end;

procedure TFrm_AreaToDev.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Mainf.show_areaToDev.Checked := False;
end;

procedure TFrm_AreaToDev.FormDestroy(Sender: TObject);
begin
  if cmdlist <> nil then
    cmdlist.Free;
end;

end.

