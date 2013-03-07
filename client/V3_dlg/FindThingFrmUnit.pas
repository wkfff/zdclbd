unit FindThingFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxControls, cxSplitter, ComCtrls, StdCtrls,
  cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit, cxCheckBox,
  cxInplaceContainer, Buttons, XMLDoc, xmldom, XMLIntf, Menus, CarUnit;

type
  TFindThingFrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxSplitter1: TcxSplitter;
    Panel3: TPanel;
    Panel4: TPanel;
    cxSplitter2: TcxSplitter;
    Panel5: TPanel;
    TreeView1: TTreeView;
    cxDeviceList: TcxTreeList;
    dev_Id: TcxTreeListColumn;
    dev_carNo: TcxTreeListColumn;
    dev_long: TcxTreeListColumn;
    dev_lat: TcxTreeListColumn;
    dev_speed: TcxTreeListColumn;
    dev_Gpstime: TcxTreeListColumn;
    dev_Altitude: TcxTreeListColumn;
    dev_angle: TcxTreeListColumn;
    switch_8: TcxTreeListColumn;
    switch_9: TcxTreeListColumn;
    dev_Track: TcxTreeListColumn;
    dev_DrawTrack: TcxTreeListColumn;
    dev_Hide: TcxTreeListColumn;
    dev_Name: TcxTreeListColumn;
    dev_SIMNO: TcxTreeListColumn;
    dev_trun: TcxTreeListColumn;
    dev_login_driver: TcxTreeListColumn;
    Panel6: TPanel;
    BtnQuery: TBitBtn;
    Panel7: TPanel;
    ComboBoxCarNo: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    EditColor: TEdit;
    Label3: TLabel;
    BeginDate: TDateTimePicker;
    BeginTime: TDateTimePicker;
    Label5: TLabel;
    EndDate: TDateTimePicker;
    EndTime: TDateTimePicker;
    Label6: TLabel;
    Label4: TLabel;
    ComboBoxCarType: TComboBox;
    Panel8: TPanel;
    Panel9: TPanel;
    ListView1: TListView;
    Timer1: TTimer;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Label8: TLabel;
    Label9: TLabel;
    Panel10: TPanel;
    Label7: TLabel;
    CheckBox1: TCheckBox;
    EditCarNo: TEdit;
    ProgressBar1: TProgressBar;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnQueryClick(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure EditCarNoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N2Click(Sender: TObject);
    procedure cxDeviceListClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure cxDeviceListDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure AddDev(id: integer; ANode: TTreeNode);
    procedure Add2DevList(const ADev: Tdevice);
    procedure FillData(ADev: TDevice; ANode: TcxTreeListNode);
    procedure LocalMap;
    procedure LocalHistroyRunData();
    procedure LocalRunData;

    procedure GetQueryReturnInfo(Info: OleVariant);
  public
    FromDate, ToDate: string;
    CarNo: string;
    group_id: integer;
    group_paranet: string;
    factid: Integer;
    devid: Integer;

    BeginX, BeginY, EndX, EndY: Double;

    FirstCarNo ,LastCarNo: string;
    procedure List_TreeGroup;
  end;

var
  FindThingFrm: TFindThingFrm;

implementation
uses uGloabVar, ConstDefineUnit, umainf, CmdStructUnit, DateUtils, QueryThreadUnit,
    ShowMessageInfo;
{$R *.dfm}

procedure TFindThingFrm.Timer1Timer(Sender: TObject);
var
  i: Integer;
  dev: TDevice;
begin
  if FirstCarNo <> LastCarNo then
  begin
    ListView1.Clear;
    for i:=0 to ADeviceManage.Count-1 do
    begin
      dev := ADeviceManage.Items[i];
      if Pos(FirstCarNo, dev.Car.No) > 0 then
      begin
        with ListView1.Items.Add do
        begin
          Caption := dev.Car.No;
          Data := ADeviceManage.Items[i];
        end;
      end;
    end;
    LastCarNo := FirstCarNo;
  end;
end;

procedure TFindThingFrm.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  BeginDate.date := now;
  EndDate.date := Now;  //向前1周

  group_id := -1;
  group_paranet := '';
  factid := -1;
  devid := -1;

  BeginX := 0;
  BeginY := 0;
  EndX := 0;
  EndY := 0;

  //DataSource1.DataSet := aqStore;
  for i := 0 to CarTypeManage.Count - 1 do
  begin
    ComboBoxCarType.AddItem(CarTypeManage.Items[i].CarTypeName, CarTypeManage.Items[i]);
  end;

  List_TreeGroup;
end;

procedure TFindThingFrm.Add2DevList(const ADev: Tdevice);
var
  node: TcxTreeListNode;
begin
  if ADev = nil then exit;
  try
    with cxDeviceList do
    begin
      node := cxDeviceList.Add;
      node.Data := Adev;
      FillData(ADev, Node);
    end;
  finally
  end;
end;

procedure TFindThingFrm.FillData(ADev: TDevice; ANode: TcxTreeListNode);

  function getCarAngle(angel: integer): string;
  begin
    Result := '';
    case angel*100 of
      0..2250: begin
          Result := '正北';
        end;
      2251..6750: begin
          result := '东北';
        end;
      6751..11250: begin
          result := '正东';
        end;
      11251..15750: begin
          result := '东南';
        end;
      15751..20250: begin
          Result := '正南';
        end;
      20251..24750: begin
          Result := '西南';
        end;
      24751..29250: begin
          Result := '正西';
        end;
      29251..33750: begin
          Result := '西北';
        end;
      33751..36000: begin
          Result := '正北';
        end else
      begin
        Result := ' ';
      end;
    end;
  end;
begin
  with ADev, ANode do
  begin
    Data := ADev;
    Values[0] := ADev.IdStr;
    Values[1] := ADev.Car.No;
    Values[2] := FormatFloat('##0.000000', ADev.Longitude);
    Values[3] := FormatFloat('##0.000000', ADev.Latitude);
    Values[4] := FormatFloat('##0.0', ADev.Speed/10); //* 1852/10000
    if ADev.GpsTime = 0 then
      Values[5] := ''
    else
      Values[5] := FormatDateTime('yyyy-mm-dd hh:nn:ss', ADev.GpsTime);


    if not ADev.Switch[STAT_GPS_LOCATE] then
    begin
      Values[8] := '定位';
      Values[7] := getCarAngle(ADev.Orientation);
    end
    else
      Values[8] := '非定位';
    if ADev.isOnline then
    begin
      Values[9] := '在线';
      if not ADev.Switch[STAT_GPS_LOCATE] then
        ANode.StateIndex := 3
      else
        ANode.StateIndex := 6;
    end
    else //如不在线,就显示非定位..
    begin
      Values[7]:='';
      Values[8] := '非定位';
      Values[9] := '不在线';
      ANode.StateIndex := 4;
    end;

    Values[10] := FMap.GpsDrawlayer.AutoFollowDevice = ADev;
    Values[11] := ADev.DrawTrack;
    Values[12] := ADev.Hide;
    Values[13] := ADev.Car.ZBH;
    Values[14] := ADev.SimNo;
    Values[16] := ADev.Login_DriverName+'('+ADev.Login_Driver+')';

    ImageIndex := ADev.Car.ResIndex;
    SelectedIndex := ADev.Car.ResIndex;
  end;
end;

procedure TFindThingFrm.BtnQueryClick(Sender: TObject);
var
  startDateTime, endDateTime: Tdatetime;
  Cartype_id: Integer;
  CarColor: string;
  devIdList: TStrings;
  devIdListStr: string;
  i: Integer;
  dev: TDevice;
  xml: string;
  XMLDoc: TXMLDocument;
  t: TComponent;
  node: IXMLNode;

  DevIdStr: string;
  FactId, devId: Integer;

  FindCarInArea: TFindCarInArea;
begin
  if (BeginX = 0) and (BeginY = 0) and (EndX = 0) and (EndY = 0) then
  begin
    messagebox(handle, '请在地图上划定搜索区域', '提示', mb_ok + mb_iconinformation);
    exit;
  end;
  startDateTime := BeginDate.DateTime;
  endDateTime := EndDate.DateTime;
  ReplaceTime(startDateTime, BeginTime.Time);
  ReplaceTime(endDateTime, EndTime.Time);
  FromDate :=  FormatDatetime('yyyy-mm-dd hh:nn:ss',startDateTime);
  ToDate := FormatDatetime('yyyy-mm-dd hh:nn:ss',endDateTime);
  if FromDate > ToDate then
  begin
    messagebox(handle, '开始日期应小于结束日期，请检查！', '提示信息', mb_ok + mb_iconinformation);
    exit;
  end;

  if DaysBetween(EndDate.date, BeginDate.date) > 1 then
  begin
    messagebox(handle,'请将查询时间范围缩短至两天内!','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  
  ProgressBar1.Max := 100;
  ProgressBar1.Visible := True;
  ProgressBar1.Position:=0;
  Cartype_id := -1;
  if Trim(ComboBoxCarType.Text) = '' then
    Cartype_id := -1
  else
    Cartype_id := TCarType(ComboBoxCarType.Items.Objects[ComboBoxCarType.ItemIndex]).CarTypeID;
  CarColor := Trim(EditColor.Text);
  ProgressBar1.Position:=10;
  if CheckBox1.Checked then
  begin
    for i:=0 to ListView1.Items.Count-1 do
    begin
      if i = 0 then
      begin
        dev:=TDevice(ListView1.Items.Item[i].Data);
        devIdListStr := FormatCurr('00' ,dev.fact_id) +  FormatCurr('00000000' ,dev.Id);
      end
      else
      begin
        dev:=TDevice(ListView1.Items.Item[i].Data);
        devIdListStr := devIdListStr + ',' + FormatCurr('00' ,dev.fact_id) +  FormatCurr('00000000' ,dev.Id);
      end;
    end;
  end
  else
  begin
    if ComboBoxCarNo.Text <> '' then
      begin
        dev := TDevice(ComboBoxCarNo.Items.Objects[ComboBoxCarNo.ItemIndex]);
        if dev <> nil then
        begin
          devIdListStr := FormatCurr('00' ,dev.fact_id) +  FormatCurr('00000000' ,dev.Id);
        end
      end
      else
      begin
        devIdListStr := '';
      end;
  end;
  ProgressBar1.Position:=20;
  FindCarInArea := TFindCarInArea.Create(Cartype_id, CarColor, devIdListStr, group_Id, group_paranet, FromDate, ToDate,
                                         BeginY, BeginX, EndY, EndX, BtnQuery, ProgressBar1);
  FindCarInArea.OnQueryReturn := GetQueryReturnInfo;
  {try
    try

      Xml := Bs.FindCarInArea(Cartype_id, CarColor, devIdListStr, group_Id, group_paranet, FromDate, ToDate,
                              BeginY, BeginX, EndY, EndX);

      t := TComponent.Create(nil);
      XMLDoc := TXMLDocument.create(t);
        try
          xml :='<?xml version="1.0" encoding="GB2312"?>' +  xml;

          XMLDoc.XML.Text :=  xml;
          XMLDoc.Active := true;
          XMLDoc.Encoding := 'gb2312';
          ProgressBar1.Position:=50;
          node := XMLDoc.DocumentElement.ChildNodes['Table'];
          if node.ChildNodes.Count <= 0 then
          begin
            ProgressBar1.Position:=100;
            messagebox(handle, '无查询记录', '提示', mb_ok + mb_iconinformation);
            ProgressBar1.Position:=0;
            ProgressBar1.Visible := False;
            Exit;
          end;
          cxDeviceList.Clear;
          ProgressBar1.Position:=80;
          while (node <> nil ) do
          begin
            DevIdStr := node.ChildNodes['DEVID'].Text;
            FactId := StringToInteger(copy(devIdStr, 1, 2));
            devId := StringToInteger(copy(devIdStr, 5, length(DevIdStr)));
            dev := ADeviceManage.find(devId);
            Add2DevList(dev);
            node := node.NextSibling;
          end;
          ProgressBar1.Position:=100;
        except
          begin
            ProgressBar1.Position:=0;
            ProgressBar1.Visible := False;
          end;
        end;
    except
      on E: Exception do
      begin
        messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
        ProgressBar1.Position:=0;
        exit;
      end;
    end;
  finally
    XMLDoc.Free;
    t.Free;
    ProgressBar1.Position:=0;
    ProgressBar1.Visible := False;
  end; }
end;

procedure TFindThingFrm.TreeView1Click(Sender: TObject);
var
  devGrp: TDevGroup;
  Node: TTreeNode;
  i: Integer;
begin
  Node := TreeView1.Selected;
  if Node = nil then exit;
  group_id := Integer(Node.Data);

  group_paranet := '';

  ComboBoxCarNo.Clear;
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

procedure TFindThingFrm.AddDev(id: integer; ANode: TTreeNode);
var
  i: integer;
  dev: TDevice;
begin
  try
    ComboBoxCarNo.ItemIndex := -1;

    for i := 0 to ADeviceManage.Count - 1 do
    begin
      dev := ADeviceManage.Items[i];
      if dev = nil then Continue;
      if dev.GroupID= id then
      begin
        ComboBoxCarNo.Items.AddObject(dev.Car.No,dev);
      end;
    end;
  finally
  end;
end;

procedure TFindThingFrm.CheckBox1Click(Sender: TObject);
begin
  EditCarNo.Enabled := CheckBox1.Checked;
  Timer1.Enabled := CheckBox1.Checked;
  if CheckBox1.Checked then
  begin
    EditCarNo.Color := clWindow;
  end
  else
  begin
    EditCarNo.Color := clBtnFace;
  end;

end;

procedure TFindThingFrm.EditCarNoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FirstCarNo := Trim(EditCarNo.Text);
end;

procedure TFindThingFrm.N2Click(Sender: TObject);
begin
  try
    if GCurSelectDev_rundata <> nil then
    begin
      LocalMap;
      LocalHistroyRunData;
      umainf.Mainf.ShowHistoryRunData(StrToDateTime(FromDate), StrToDateTime(ToDate), GCurSelectDev_rundata);
    end;
  except
  end;
end;

procedure TFindThingFrm.cxDeviceListClick(Sender: TObject);
begin
  if cxDeviceList.FocusedNode = nil then exit;
  GCurSelectDev_rundata := TDevice(cxDeviceList.FocusedNode.Data);
end;

procedure TFindThingFrm.LocalMap;
var
  i: Integer;
begin
  with umainf.Mainf do
  begin
    //show_GPSHostory.Execute;
    if (not FDlg_Map.Visible) or (FDlg_Map.Floating) then
    begin
      FDlg_Map.ManualDock(PageControl_Center, nil, alLeft);
      FDlg_Map.show;
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

    if not show_Map.Checked then
      show_Map.Checked := True;
  end;
end;

procedure TFindThingFrm.LocalHistroyRunData();
var
  i: Integer;
begin
  with umainf.Mainf do
  begin
    if (not FDlg_HisForm.Visible) or (FDlg_HisForm.Floating) then
    begin
      FDlg_HisForm.ManualDock(PageControlBottom, nil, alLeft);
      FDlg_HisForm.Show;
    end;

    if PageControlBottom.PageCount >1 then
    begin
      //设置 地图窗口为　活动层
      for i := 0 to PageControlBottom.PageCount - 1 do
      begin
        if PageControlBottom.Pages[i].Caption = FDlg_HisForm.Caption then
        begin
          try
            PageControlBottom.ActivePageIndex := i;
          except
            break;
          end;
          break;
        end;
      end;
    end;

    if not show_GPSHostory.Checked then
      show_GPSHostory.Checked := True;
  end;
end;

procedure TFindThingFrm.LocalRunData;
begin
  
end;

procedure TFindThingFrm.N1Click(Sender: TObject);
begin
//  try
//    if GCurSelectDev_rundata <> nil then
//    begin
//      LocalRunData;
//      with umainf.Mainf do
//      begin
//        FDlg_DRunData.ComboBox2.Clear;
//        FDlg_DRunData.ComboBox2.AddItem(GCurSelectDev_rundata.Car.No, GCurSelectDev_rundata);
//        FDlg_DRunData.ComboBox2.ItemIndex := 0;
//        FDlg_DRunData.DateTimePicker1.DateTime := BeginDate.DateTime;
//        FDlg_DRunData.fromTime.DateTime := BeginTime.DateTime;
//        FDlg_DRunData.DateTimePicker2.DateTime := EndDate.DateTime;
//        FDlg_DRunData.toTime.DateTime := EndTime.DateTime;
//        FDlg_DRunData.SpeedButtonPage.Click;
//      end;
//    end;
//  except
//  end;

end;

procedure TFindThingFrm.cxDeviceListDblClick(Sender: TObject);
begin
  if cxDeviceList.FocusedNode = nil then exit;
  GCurSelectDev_rundata := TDevice(cxDeviceList.FocusedNode.Data);
  GCurSelectDev := GCurSelectDev_rundata;
  mainf.Edit2.Text := IntToStr(GCurSelectDev.Id);
  mainf.Edit1.Text := GCurSelectDev.Car.No;
  umainf.Mainf.fun_Locate_Car.Execute;
  {with umainf.Mainf do
  begin
    ep.Longitude := GCurSelectDev_rundata.Longitude;
    ep.Latitude := GCurSelectDev_rundata.Latitude;
    if (ep.Longitude = 0) and (ep.Latitude = 0) then
      PopMsg('提示', '对不起，此车没有GPS数据!无法定位!')
     // messagebox(handle,'对不起，现在该车没有GPS数据!无法定位!','提示',mb_ok + mb_iconinformation)
    else
    begin
      if GlobalParam.isAutoChangeMap then fun_ChangeMap.Execute;
      wp := FMap.Projection.LoLa2XY(ep);
      FMap.Zoom(1, wp);
      FMap.Draw;
    end;
  end;  }
end;

procedure TFindThingFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Mainf.show_FindThing.Checked := false;
end;

procedure TFindThingFrm.GetQueryReturnInfo(Info: OleVariant);
var
  xml: string;
  XMLDoc: TXMLDocument;
  t: TComponent;
  node: IXMLNode;

  i: Integer;
  dev: TDevice;
  DevIdStr: string;
  FactId, devId: Integer;
begin
  try
    try

      Xml := Info;

      t := TComponent.Create(nil);
      XMLDoc := TXMLDocument.create(t);

      //xml :='<?xml version="1.0" encoding="GB2312"?>' +  xml;

      XMLDoc.XML.Text :=  xml;
      XMLDoc.Active := true;
      XMLDoc.Encoding := 'gb2312';
      ProgressBar1.Position:=50;
      node := XMLDoc.DocumentElement.ChildNodes['Table'];
      if node.ChildNodes.Count <= 0 then
      begin
        ProgressBar1.Position:=100;
        messagebox(handle, '无查询记录', '提示', mb_ok + mb_iconinformation);
        ProgressBar1.Position:=0;
        ProgressBar1.Visible := False;
        Exit;
      end;
      cxDeviceList.Clear;
      ProgressBar1.Position:=80;
      while (node <> nil ) do
      begin
        DevIdStr := node.ChildNodes['DEVID'].Text;
        FactId := StringToInteger(copy(devIdStr, 1, 2));
        devId := StringToInteger(copy(devIdStr, 5, length(DevIdStr)));
        dev := ADeviceManage.find(devId);
        Add2DevList(dev);
        node := node.NextSibling;
      end;
      ProgressBar1.Position:=100;
    except
      on E: Exception do
      begin
        //messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
        messageErrorBox('失物查询结果处理不正确！', e.Message);
        ProgressBar1.Position:=0;
        exit;
      end;
    end;
  finally
    XMLDoc.Free;
    t.Free;
    ProgressBar1.Position:=0;
    ProgressBar1.Visible := False;
  end;
end;

procedure TFindThingFrm.List_TreeGroup;
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
end;

end.
