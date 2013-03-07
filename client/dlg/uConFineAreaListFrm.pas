{�趨����-- ���� Խ����ʻ��������ᱨ��
    ����������е�ÿ������ �и����ԣ�DevList,��¼���޶��ĳ���ID
    ���������� OutCAreaId��InCAreaId
  ��������Ӧ������  ���ʱ����һ����ɾ��ʱ��һ��ɾ��
  @author()
  @created()
  @lastmod(GMT:$Date: 2012/10/29 01:46:42 $) <BR>
  ��������:$Author: wfp $  <BR>
  ��ǰ�汾:$Revision: 1.1.1.1 $  <BR>}

unit uConfineAreaListFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxCalendar, cxInplaceContainer, cxControls, cxCheckBox, ExtCtrls,
  StdCtrls, Buttons, ComCtrls,
  ConfineAreaUnit, ActnList, Menus, ImgList,
  CarUnit, cxColorComboBox,ConstDefineUnit;

type
  TConfineAreaListFrm = class(TForm)
    cxAreaList: TcxTreeList;
    area_Id: TcxTreeListColumn;
    area_Name: TcxTreeListColumn;
    area_color: TcxTreeListColumn;
    area_Isdraw: TcxTreeListColumn;
    Panel1: TPanel;
    Splitter1: TSplitter;
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
    Panel_CurArea: TPanel;
    PopupMenu_Area: TPopupMenu;
    ActionList1: TActionList;
    Area_Set: TAction;
    Area_del: TAction;
    Area_addDev: TAction;
    Dev_del: TAction;
    Dev_DelAll: TAction;
    N1: TMenuItem;
    N3: TMenuItem;
    PopupMenu_Dev: TPopupMenu;
    Devdel1: TMenuItem;
    Area_Clear: TAction;
    N5: TMenuItem;
    N6: TMenuItem;
    Label1: TLabel;
    Shape_CurrAreaColor: TShape;
    N2: TMenuItem;
    DevDelAll1: TMenuItem;
    N4: TMenuItem;
    N7: TMenuItem;
    area_Type: TcxTreeListColumn;
    ImageList1: TImageList;
    Area_SaveToServer: TAction;
    N8: TMenuItem;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    area_Save: TAction;
    s1: TMenuItem;
    procedure BitBtn_SetAreaClick(Sender: TObject);
    procedure cxAreaListClick(Sender: TObject);
    procedure cxAreaListFocusedNodeChanged(Sender: TObject;
      APrevFocusedNode, AFocusedNode: TcxTreeListNode);
    procedure Area_SetExecute(Sender: TObject);
    procedure Area_delExecute(Sender: TObject);
    procedure Area_ClearExecute(Sender: TObject);
    procedure Area_addDevExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Dev_delExecute(Sender: TObject);
    procedure cxDeviceListClick(Sender: TObject);
    procedure Dev_DelAllExecute(Sender: TObject);
    procedure cxDeviceListFocusedNodeChanged(Sender: TObject;
      APrevFocusedNode, AFocusedNode: TcxTreeListNode);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    {���� �趨�����б��� ��ĳ��}
    procedure cxAreaListEditValueChanged(Sender: TObject;
      AColumn: TcxTreeListColumn);
    procedure cxDeviceListEditValueChanged(Sender: TObject;
      AColumn: TcxTreeListColumn);
    procedure cxDeviceListEditing(Sender: TObject;
      AColumn: TcxTreeListColumn; var Allow: Boolean);
    procedure area_colorPropertiesSelectCustomColor(Sender: TObject;
      var AColor: TColor; var AColorDescription: String;
      var AddToList: Boolean);
    procedure cxDeviceListDblClick(Sender: TObject);
    procedure Area_SaveToServerExecute(Sender: TObject);
    procedure area_SaveExecute(Sender: TObject);
    procedure s1Click(Sender: TObject);
  private
    { Private declarations }
    //FCurrArea:TConfineArea;
    //FSelectDev: TDevice;
    procedure CurrConfineAreaChanged;
    procedure SelectDevChanged;
    {procedure Add2DevList<BR />
    ��cxDeviceList �����һ�С����������Ϣ}
    procedure Add2DevList(const ADev:Tdevice);
    procedure FillData(ADev: TDevice; ANode: TcxTreeListNode);
    //�г���ǰ����� ���� -- ����
    procedure ListCurrConfine_AddDevs;
//    procedure SendMsg2MainF_DelAreaOrDev(ADev:Tdevice;AreaType:byte);
  public
    { Public declarations }
    {������е�����}
    procedure ClearAreas;
    {�г������޶�����s}
    procedure ListConfineAreas;
    {���ļ�����������ڽ����ϱ��ֳ���}
    procedure LoadConfineAreas;
    {�г���ǰ�����  �޶��ĳ���s��ֻ��ˢ��}
    procedure ListCurrConfine_Devs;
    {���ʱ������еĸı�}
    procedure Clear_Changed;
  end;

var
  ConfineAreaListFrm: TConfineAreaListFrm;

implementation
uses uConfineAreaSetFrm,ugloabVar,umainf,uFrmSelectDevs_Add2CArea,uFrmAlarmCar,DateUtils,MetaDefine,Math,uFrmSelectDevs,
    MapPubUnit{liusen};
{$R *.dfm}

procedure TConfineAreaListFrm.BitBtn_SetAreaClick(Sender: TObject);
var
  dlg: TConfineAreaSetFrm;
begin
  dlg:= TConfineAreaSetFrm.Create(nil);
  try
    dlg.Edit_AreaID.Text     := IntToStr(GCurConfineArea.ID);
    dlg.Edit_AreaName.Text   := GCurConfineArea.Name;
    dlg.Edit_AreaColor.Color := GCurConfineArea.AreaColor;
    dlg.CheckBox_IsDraw.Checked := GCurConfineArea.IsDraw;
    dlg.ShowModal;
    if dlg.ModalResult= mrok then
      ListConfineAreas;
  finally
    dlg.Free;
  end;
end;

procedure TConfineAreaListFrm.ListConfineAreas;
var
  i: integer;
  find_ListItem :TcxTreeListNode;
  area       :  TConfineArea;
begin
  cxAreaList.BeginUpdate;
  //if cxAreaList.FocusedNode<> nil then cxAreaList.FocusedNode := nil;
  //cxAreaList.Clear;
  for i:= 0 to GAreaManage.Count -1 do
  begin
    area := GAreaManage.Items[i];
    //find_ListItem:=cxAreaList.FindNodeByText(inttostr(area.Id),cxAreaList.Columns[0],nil,false,true);
    find_ListItem := FindNodeByTextIncxTreeList(IntToStr(area.Id),cxAreaList,0);
    If find_ListItem = nil then
    begin
      with cxAreaList.Add do
      begin
        Data := area;
        Values[0]:= area.ID;
        Values[1]:= area.Name;
        Values[2]:= area.AreaColor;
        Values[3]:= area.IsDraw;
        case area.AreaType of
          ALARM_OUT                   : Values[4]:='ʻ������';
          ALARM_IN                    : Values[4]:='ʻ�뱨��';
          Alarm_LINEKEYPOINT          : Values[4] := '��·�ؼ����ر���';
//          ALARM_OVER_SPEET            : Values[4]:='����'+IntToStr(area.OverSpeet);
//          ALARM_WAY_OUT               : Values[4]:='·��ʻ������';
//          ALARM_WAY_IN                : Values[4]:='·��ʻ�뱨��';
//          ASSEMBLE_WARRING            : Values[4]:='�ۼ�����';
//          OUT_TOWN                    : Values[4]:='������̨';
//          ANTIFAKE_WARRING            : Values[4]:='��α����';
//          SUSPECTEDPETITIONS_WARRING  : Values[4]:='�����Ϸñ���';
        end;
        {if area.AreaType= ALARM_OUT then
          Values[4]:='Խ�籨��'
        else if area.AreaType = ALARM_IN then
          Values[4]:='ʻ�뱨��';  }
        ImageIndex:= area.AreaType;
        SelectedIndex := area.AreaType;
      end;
    end
    else
    begin
      with find_ListItem do
      begin
        Data := area;
        Values[0]:= area.ID;
        Values[1]:= area.Name;
        Values[2]:= area.AreaColor;
        Values[3]:= area.IsDraw;
        {if area.AreaType= ALARM_OUT then
          Values[4]:='Խ�籨��'
        else if area.AreaType = ALARM_IN then
          Values[4]:='ʻ�뱨��';}
        case area.AreaType of
          ALARM_OUT                   : Values[4]:='ʻ������';
          ALARM_IN                    : Values[4]:='ʻ�뱨��';
          Alarm_LINEKEYPOINT          : Values[4] := '��·�ؼ����ر���';
//          ALARM_OVER_SPEET            : Values[4]:='����'+IntToStr(area.OverSpeet);
//          ALARM_WAY_OUT               : Values[4]:='·��ʻ������';
//          ALARM_WAY_IN                : Values[4]:='·��ʻ�뱨��';
//          ASSEMBLE_WARRING            : Values[4]:='�ۼ�����';
//          OUT_TOWN                    : Values[4]:='������̨';
//          ANTIFAKE_WARRING            : Values[4]:='��α����';
//          SUSPECTEDPETITIONS_WARRING  : Values[4]:='�����Ϸñ���';
        end;
        ImageIndex:= area.AreaType;
        SelectedIndex := area.AreaType;
      end;
    end;
  end;
  cxAreaList.EndUpdate;
end;

procedure TConfineAreaListFrm.cxAreaListClick(Sender: TObject);
var
  confArea: TConfineArea;
  WorldOutBox:TWorldRect;
  wp: TWorldPoint;
  ep: TEarthPoint;
begin
  // liusen ��������
  //if cxAreaList.FocusedNode = nil  then exit;
  if cxAreaList.SelectionCount =0 then exit;

  confArea := TConfineArea(cxAreaList.Selections[0].Data);
  if (GCurConfineArea= nil) or (GCurConfineArea<>confArea)then
  begin
    GCurConfineArea := confArea;
    WorldOutBox:=GCurConfineArea.OutBox;
    CurrConfineAreaChanged;

    wp.X:=(WorldOutBox.Xmin+WorldOutBox.Xmax) div 2;
    wp.Y:=(WorldOutBox.Ymin+WorldOutBox.Ymax) div 2;
    if confArea.Area_Type = 0 then
      ep := confArea.CenterPoint
    else
      ep := Project.XY2LoLa(wp);
    Locate_ConfineArea(ep.Longitude, ep.Latitude);
  end;

end;

procedure TConfineAreaListFrm.cxAreaListFocusedNodeChanged(Sender: TObject;
  APrevFocusedNode, AFocusedNode: TcxTreeListNode);
{  function OutBox(APolygon:TWorldPointAry;Start,Length:Integer):TWorldRect;
  var
    i:Integer;
    WorldOutBox:TWorldRect;
  begin
    //����������
    WorldOutBox.Xmin:=MaxInt;
    WorldOutBox.Ymin:=MaxInt;
    WorldOutBox.Xmax:=-MaxInt;
    WorldOutBox.Ymax:=-MaxInt;
    for i:=Start to Start+Length-2 do
    begin
      WorldOutBox.Xmin:=min(WorldOutBox.Xmin,APolygon[i].x);
      WorldOutBox.Ymin:=min(WorldOutBox.Ymin,APolygon[i].y);
      WorldOutBox.Xmax:=max(WorldOutBox.Xmax,APolygon[i].x);
      WorldOutBox.Ymax:=max(WorldOutBox.Ymax,APolygon[i].y);
    end;
    Result:=WorldOutBox;
  end;    }
{  procedure ReShowArea;
  begin
    //if GCurConfineArea<>nil then
    begin
      GCurConfineArea.IsDraw := not GCurConfineArea.IsDraw;
      //���� ����ͼ
      FMap.Draw;
    end;
  end;
var  
  confArea: TConfineArea;
  WorldOutBox:TWorldRect;
  wp: TWorldPoint; }
  //AScale:double;
begin
  //if cxAreaList.FocusedNode = nil  then exit;
//  if cxAreaList.SelectionCount =0 then exit;
//  GCurConfineArea := TConfineArea(cxAreaList.Selections[0].Data);
{  if (GCurConfineArea= nil) or (GCurConfineArea<>confArea) then
  begin
    GCurConfineArea := confArea;
    WorldOutBox:=GCurConfineArea.OutBox;
    wp.X:=(WorldOutBox.Xmin+WorldOutBox.Xmax) div 2;
    wp.Y:=(WorldOutBox.Ymin+WorldOutBox.Ymax) div 2;
    //AScale:=(WorldOutBox.Xmin+WorldOutBox.Xmax)/(mainf.FMap.Outbox.Xmin+mainf.FMap.Outbox.Xmax);
    FMap.Zoom(1,wp);
    //inc(WorldOutBox.Xmin,-10000);
    //inc(WorldOutBox.Xmax,10000);
    //inc(WorldOutBox.Ymin,-10000);
    //inc(WorldOutBox.Ymax,10000);
    FMap.Zoom(WorldOutBox);
    FMap.Draw;
    //ReShowArea;
    CurrConfineAreaChanged;
    //ReShowArea;
  end;      }
end;

procedure TConfineAreaListFrm.Area_SetExecute(Sender: TObject);
var
  dlg: TConfineAreaSetFrm;
  dt: TDateTime;
begin
  if GCurConfineArea = nil then
  begin
      messagebox(handle,'��ѡ��һ������!','��ʾ',mb_ok + mb_iconinformation);
      exit;
  end;
  dlg:= TConfineAreaSetFrm.Create(nil);
  try
    dlg.Edit_AreaID.Text := IntToStr(GCurConfineArea.ID);
    dlg.Edit_AreaName.Text := GCurConfineArea.Name;
    dlg.Edit_AreaColor.Color := GCurConfineArea.AreaColor;
    dlg.CheckBox_IsDraw.Checked := GCurConfineArea.IsDraw;
    dlg.ComboBox_AreaType.ItemIndex := GCurConfineArea.AreaType;
    dlg.BeginTime.Time:=GCurConfineArea.BeginTime;
    dlg.EndTime.Time:=GCurConfineArea.EndTime;
    dlg.CheckBoxEnabledTime.Checked:=GCurConfineArea.IsEnabledTime;
    dlg.CheckBoxEnabledTimeClick(nil);
    //dlg.ComboBox_AreaType.Enabled := False;
    dlg.ComboBox_AreaType.Color := clSilver;
    dlg.CheckBoxShowPop.Checked:=GCurConfineArea.IsShowPop;
    dlg.Panel2.Visible := False;
    case GCurConfineArea.AreaType of
      Alarm_LINEKEYPOINT:
        begin
          dlg.Panel2.Visible := True;
          dlg.arriveDate.DateTime := GCurConfineArea.ArriveDateTime;
          dlg.arriveTime.DateTime := GCurConfineArea.ArriveDateTime;
          dlg.leaveDate.DateTime := GCurConfineArea.LeaveDateTime;
          dlg.leaveTime.DateTime := GCurConfineArea.LeaveDateTime;
        end;
//      ALARM_OVER_SPEET:
//        begin
//          dlg.Edit_LimitSpeet.Text := IntToStr(GCurConfineArea.OverSpeet);
//          dlg.Edit_LimitSpeet.Visible:=true;
//          dlg.Label5.Visible:=true;
//          dlg.Label5.Caption := '���٣�';
//          dlg.Label6.Caption := '����/ʱ';
//          dlg.Label6.Visible:=true;
//        end;
//      BUSLINE_WAY:
//        begin
//          dlg.Edit_LimitSpeet.Text := IntToStr(GCurConfineArea.OverSpeet);
//          dlg.Edit_LimitSpeet.Visible:=true;
//          dlg.Label10.Visible:=true;
//          dlg.Label11.Visible:=true;
//        end;
//      OUT_TOWN:
//        begin
//          dlg.Edit_LimitSpeet.Text := IntToStr(GCurConfineArea.OverSpeet);
//          dlg.Edit_LimitSpeet.Visible:=true;
//          dlg.Label5.Visible:=true;
//          dlg.Label5.Caption := '��ʱ��';
//          dlg.Label6.Caption := '����';
//          dlg.Label6.Visible:=true;
//        end;
//      ANTIFAKE_WARRING:
//        begin
//          dlg.Panel2.Visible := True;
//          dlg.Notebook1.PageIndex := 0;
//          dlg.editText.Text := GCurConfineArea.AntiFakeText;
//          dlg.editFilePath.Text := GCurConfineArea.AntiFakePicFilePath;
//          if GCurConfineArea.AntiFakeType = 0 then
//            dlg.RadioButton1.Checked
//          else if GCurConfineArea.AntiFakeType = 1 then
//            dlg.RadioButton2.Checked;
//        end;
//      SUSPECTEDPETITIONS_WARRING:
//        begin
//          dlg.Panel2.Visible := True;
//          dlg.Notebook1.PageIndex := 1;
//          dlg.editMinSpeed.Text := IntToStr(GCurConfineArea.MinSpeed);
//          dlg.editMaintainTime.Text := IntToStr(GCurConfineArea.MaintainTime);
//
//          dlg.Edit_LimitSpeet.Text := IntToStr(GCurConfineArea.OverSpeet);
//          dlg.Edit_LimitSpeet.Visible:=true;
//          dlg.Label10.Visible:=true;
//          dlg.Label11.Visible:=true;
//        end;
    end;
    dlg.ShowModal;
    if dlg.ModalResult= mrok then
    begin
      GCurConfineArea.Name := trim(dlg.Edit_AreaName.Text);
      GCurConfineArea.AreaType:=dlg.ComboBox_AreaType.ItemIndex;

      GCurConfineArea.IsEnabledTime:=dlg.CheckBoxEnabledTime.Checked;
      GCurConfineArea.BeginTime:=dlg.BeginTime.Time-Trunc(dlg.BeginTime.Time);
      GCurConfineArea.EndTime:=dlg.EndTime.Time-Trunc(dlg.EndTime.Time);
      GCurConfineArea.IsShowPop:=dlg.CheckBoxShowPop.Checked;

      dt := dlg.arriveDate.DateTime;
      ReplaceTime(dt, dlg.arriveTime.Time);
      GCurConfineArea.ArriveDateTime := dt;
      dt := dlg.leaveDate.DateTime;
      ReplaceTime(dt, dlg.leaveTime.Time);
      GCurConfineArea.LeaveDateTime := dt;

      if dlg.Edit_LimitSpeet.Visible then //�ж��Ƿ��г�������
        begin
          if dlg.Edit_LimitSpeet.Text <> '' then
            GCurConfineArea.OverSpeet := StrToInt(dlg.Edit_LimitSpeet.Text);
        end;

      GCurConfineArea.AntiFakeText := trim(dlg.editText.Text);
      GCurConfineArea.AntiFakePicFilePath := trim(dlg.editFilePath.Text);
      if dlg.RadioButton1.Checked then
        GCurConfineArea.AntiFakeType := 0
      else if dlg.RadioButton2.Checked then
        GCurConfineArea.AntiFakeType := 1;

      if dlg.ComboBox_AreaType.ItemIndex = SUSPECTEDPETITIONS_WARRING then
      begin
        GCurConfineArea.MinSpeed := StrToInt(Trim(dlg.editMinSpeed.Text));
        GCurConfineArea.MaintainTime := StrToInt(Trim(dlg.editMaintainTime.Text));
      end;

      if (GCurConfineArea.IsDraw <> dlg.CheckBox_IsDraw.Checked)
        or (GCurConfineArea.AreaColor <> dlg.Edit_AreaColor.Color) then
      begin
        GCurConfineArea.IsDraw := dlg.CheckBox_IsDraw.Checked;
        GCurConfineArea.AreaColor := dlg.Edit_AreaColor.Color;
        ModifyAConfineArea(GCurConfineArea.ID, GCurConfineArea.Name, IntToStr(GCurConfineArea.AreaColor)); // liusen
      end;
      HideOrShowAConfieArea(GCurConfineArea.ID, GCurConfineArea.Area_Type, GCurConfineArea.IsDraw);
      CurrConfineAreaChanged;
      ListConfineAreas;
    end;
  finally
    dlg.Free;
  end;
end;

procedure TConfineAreaListFrm.Area_delExecute(Sender: TObject);
var
  i: integer;
  dev: TDevice;
  moveCause : string;
begin          
  if cxAreaList.SelectionCount =0 then exit;
  if GCurConfineArea = nil then
    GCurConfineArea := TConfineArea(cxAreaList.Selections[0].Data);
  if messagebox(handle,pchar('��ȷ��Ҫɾ��ѡ������:'+GCurConfineArea.name+'��'),
    '��ʾ',MB_YESNO + MB_ICONQUESTION)= id_no then exit;
  moveCause :='ԭ�����ѱ��û�ɾ��';
  FMap.EnableTimer(False);
  for i:=0 to GCurConfineArea.DevList.Count -1 do
  begin
    //������ ���� ��Ӧ����--�޶�����ID ɾ��
    dev := ADeviceManage.Find(GCurConfineArea.DevList[i]);
    if dev=nil then continue;
    dev.AreaList.Remove(GCurConfineArea);
    case GCurConfineArea.AreaType  of
      ALARM_OUT:
      begin
          dev.Alarm_OutCArea:=false;
          mainf.RemoveOutorInCAData2History(dev,ALARM_OUT,moveCause);
      end;
      ALARM_IN:
      begin
          dev.Alarm_InCArea:=false;
          mainf.RemoveOutorInCAData2History(dev,ALARM_IN,moveCause);
      end;
//      ALARM_WAY_OUT:
//      begin
//          dev.Alarm_WayOutCArea:=false;
//          mainf.RemoveOutorInCAData2History(dev,ALARM_WAY_OUT,moveCause);
//      end;
//      ALARM_WAY_IN:
//      begin
//          dev.Alarm_WayInCArea:=false;
//          mainf.RemoveOutorInCAData2History(dev,ALARM_WAY_IN,moveCause);
//      end;
//      OUT_TOWN:
//      begin
//        dev.OutToTown := False;
//        Mainf.RemoveOutorInCAData2History(dev, OUT_TOWN, moveCause);
//      end;
//      ASSEMBLE_WARRING:
//      begin
//          Mainf.RemoveArea(GCurConfineArea);
//      end;
//      SUSPECTEDPETITIONS_WARRING:
//      begin
//          Mainf.RemoveArea(GCurConfineArea);
//      end;
    end;
  end;
  //�ٴ�����������У�ɾ��������
  GAreaManage.Delete(GCurConfineArea.ID);
  DeleteAConfineArea(GCurConfineArea); // liusen
  
  GCurConfineArea :=nil;
  CurrConfineAreaChanged;
  ClearAreas;       //ɾ�������б�
  ListConfineAreas; //�г�ʣ�µ� ����
end;

procedure TConfineAreaListFrm.Area_ClearExecute(Sender: TObject);
var
  i,j: integer;
  dev: Tdevice;
  conArea : TConfineArea;
  moveCause :string;
begin
  if GAreaManage.Count =0 then exit;
  if messagebox(handle,'��ȷ��Ҫ������е���Χ������',
    '��ʾ',MB_YESNO + MB_ICONQUESTION)= id_no then exit;
    
  FMap.EnableTimer(False);
  moveCause :='ԭ�����ѱ��û�ɾ��';
  //�� ÿ�������� ���������ǵ� OutCAreaId Ϊ-1
  for i:= 0 to GAreaManage.Count -1 do
  begin
    conArea:= GAreaManage.Items[i];
    for j:=0 to conArea.DevList.Count -1 do
    begin
      dev:= ADeviceManage.Find(conArea.DevList[j]);
      if dev= nil then Continue;
      dev.AreaList.Remove(conArea);

      case conArea.AreaType  of
        ALARM_OUT:
        begin
            dev.Alarm_OutCArea:=false;
            mainf.RemoveOutorInCAData2History(dev,ALARM_OUT,moveCause);
        end;
        ALARM_IN:
        begin
            dev.Alarm_InCArea:=false;
            mainf.RemoveOutorInCAData2History(dev,ALARM_IN,moveCause);
        end;
//        ALARM_WAY_OUT:
//        begin
//            //dev.Alarm_WayOutCArea:=false;
//            mainf.RemoveOutorInCAData2History(dev,ALARM_WAY_OUT,moveCause);
//        end;
//        ALARM_WAY_IN:
//        begin
//            //dev.Alarm_WayInCArea:=false;
//            mainf.RemoveOutorInCAData2History(dev,ALARM_WAY_IN,moveCause);
//        end;
//        OUT_TOWN:
//        begin
//            Mainf.RemoveOutorInCAData2History(dev, OUT_TOWN, moveCause);
//        end;
//        ASSEMBLE_WARRING:
//        begin
//            Mainf.RemoveArea(conArea);
//        end;
//        SUSPECTEDPETITIONS_WARRING:
//        begin
//            Mainf.RemoveArea(conArea);
//        end;
      end;




     { if conArea.AreaType = ALARM_OUT then
      begin
        mainf.RemoveOutorInCAData2History(dev,ALARM_OUT,moveCause);
      end
      else if conArea.AreaType = ALARM_IN then
      begin
        mainf.RemoveOutorInCAData2History(dev,ALARM_IN,moveCause);
      end
      else if GCurConfineArea.AreaType = ALARM_WAY_OUT then
      begin
        mainf.RemoveOutorInCAData2History(dev,ALARM_WAY_OUT,moveCause);
      end
      else if GCurConfineArea.AreaType = ALARM_WAY_IN then
      begin
        mainf.RemoveOutorInCAData2History(dev,ALARM_WAY_IN,moveCause);
      end;  }
    end;
  end;

  GAreaManage.Clear;
  GCurConfineArea := nil;
  CurrConfineAreaChanged;
  ClearAreas;    //ɾ�������б�
  DeleteAllConfineArea;// liusen
end;

procedure TConfineAreaListFrm.CurrConfineAreaChanged;
begin
  if GCurConfineArea = nil then
    Shape_CurrAreaColor.Brush.Color := Panel_CurArea.Color
  else
    Shape_CurrAreaColor.Brush.Color := GCurConfineArea.AreaColor;

  //�г���ǰ����� �޶����� - - ��GCurConfineArea = nil ʱ����ʵ�� ��
  ListCurrConfine_AddDevs;
end;

procedure TConfineAreaListFrm.SelectDevChanged;
begin
  if GCurSelectDev <> nil then
  begin
    mainf.Edit2.Text := (GCurSelectDev.Id);
    mainf.Edit1.Text := GCurSelectDev.Car.No;
  end;
end;

procedure TConfineAreaListFrm.Area_addDevExecute(Sender: TObject);
var
  dlg: TFrmSelectDevs;//TFrmSelectDevs_Add2CArea;
  dev :Tdevice;
  i: integer;
begin
  if GCurConfineArea = nil then
  begin
      messagebox(handle,'��ѡ��һ������!','��ʾ',mb_ok + mb_iconinformation);
      exit;
  end;
  if GCurConfineArea.AreaType = ASSEMBLE_WARRING then
  begin
    MessageBox(Handle, '�ۼ���������ѡ����', '��ʾ', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  dlg:= TFrmSelectDevs.Create(Self);
  try
    //dlg.Label_CurArea.Caption := '��ǰ�������ƣ�'+GCurConfineArea.Name;
    //dlg.ComboBox_AreaType.ItemIndex := GCurConfineArea.AreaType;
    //dlg.ComboBox_AreaTypeChange(nil);
    dlg.ShowModal;
    if dlg.ModalResult= mrok then
    begin
      for i:=0 to ADeviceManage.Count-1 do //�����г�����������ɾ��
      begin
        ADeviceManage.Items[i].AreaList.Remove(GCurConfineArea);
      end;
      for i:= 0 to dlg.DestList.Count -1 do//�ѳ���ӵ�������,�ٰ�������ӵ�����
      begin
        dev := TDevice(dlg.DestList.Items[i].data);
        GCurConfineArea.AddDevId(dev.Id);
        dev.AreaList.Add(GCurConfineArea);
        if GCurConfineArea.AreaType = ALARM_OUT then
        begin
          //dev.OutCAreaId := GCurConfineArea.ID;
          dev.Alarm_OutCArea := False;
        end
        else if GCurConfineArea.AreaType = ALARM_IN then
        begin
          //dev.InCAreaId := GCurConfineArea.ID;
          dev.Alarm_InCArea := False;
        end;
      end;
      if dlg.DestList.Count>0 then //���� �г���ǰ��� ����
        ListCurrConfine_AddDevs;
    end;
  finally
    dlg.Free;
  end;
end;

procedure TConfineAreaListFrm.FormCreate(Sender: TObject);
begin
//  cxDeviceList.Images := ResManage.BmpList;
  Shape_CurrAreaColor.Brush.Color := Panel_CurArea.Color;
end;

procedure TConfineAreaListFrm.ListCurrConfine_Devs;
var
  i:integer;
  dev: Tdevice;
//  find_ListItem : TcxTreeListNode;
begin
  //----���� (��ˢ��ʱ����FindNodeByText�������Ƿ��г�����������ӡ�)���ַ�������ֺܶ�ͬ������
try
  if GCurConfineArea = nil then exit;
  if GCurConfineArea.DevList.Count =0 then exit;
  if cxDeviceList.Count =0 then //���뵽�б�
    ListCurrConfine_AddDevs
  else                          //�Ѽ��������ˢ���б� 
  begin
    cxDeviceList.BeginUpdate;
    for i:= 0 to cxDeviceList.Count -1 do
    begin
      dev:= TDevice(cxDeviceList.Items[i].Data);
      FillData(dev,cxDeviceList.Items[i]);
      Application.ProcessMessages;
    end;
    cxDeviceList.EndUpdate;
  end;

except  on E: Exception do
     uGloabVar.SystemLog.AddLog(' TConfineAreaListFrm.ListCurrConfine_Devs��������: ',e.Message);
end;
end;

procedure TConfineAreaListFrm.Dev_delExecute(Sender: TObject);
var                                  
  moveCause: string;
begin
  if cxDeviceList.SelectionCount =0 then exit;
  if GCurSelectDev= nil then
    GCurSelectDev := TDevice(cxDeviceList.Selections[0].Data);
  moveCause :='�û���ԭ����ɾ���˶Ըó����޶�';
  if messagebox(handle,pchar('��ȷ�����ڵ�ǰ�������޶����� '
    +Trim(GCurSelectDev.car.No)+'��'),'��ʾ',MB_YESNO + MB_ICONQUESTION)= idYes then
  begin
    FMap.EnableTimer(False);
    GCurSelectDev.AreaList.Remove(GCurConfineArea);//2007-1-4  by dxf for һ���ɶ�Ӧ������
    case GCurConfineArea.AreaType  of
      ALARM_OUT:
      begin
          GCurSelectDev.Alarm_OutCArea:=false;
          mainf.RemoveOutorInCAData2History(GCurSelectDev,ALARM_OUT,moveCause);
      end;
      ALARM_IN:
      begin
          GCurSelectDev.Alarm_InCArea:=false;
          mainf.RemoveOutorInCAData2History(GCurSelectDev,ALARM_IN,moveCause);
      end;
//      ALARM_WAY_OUT:
//      begin
//          GCurSelectDev.Alarm_WayOutCArea:=false;
//          mainf.RemoveOutorInCAData2History(GCurSelectDev,ALARM_WAY_OUT,moveCause);
//      end;
//      ALARM_WAY_IN:
//      begin
//          GCurSelectDev.Alarm_WayInCArea:=false;
//          mainf.RemoveOutorInCAData2History(GCurSelectDev,ALARM_WAY_IN,moveCause);
//      end;
    end;



{   if GCurConfineArea.AreaType = ALARM_OUT then
    begin
      //GCurSelectDev.OutCAreaId := -1;
      mainf.RemoveOutorInCAData2History(GCurSelectDev,ALARM_OUT,moveCause);
    end
    else if GCurConfineArea.AreaType = ALARM_IN then
    begin
      mainf.RemoveOutorInCAData2History(GCurSelectDev,ALARM_IN,moveCause);
    end;
}


    GCurConfineArea.DeleteDevID(GCurSelectDev.Id);
    FMap.EnableTimer(True);
    FMap.DrawGpsMap_ClearDraw; //��GPSͼ�� ���ػ���
    cxDeviceList.BeginUpdate;
    cxDeviceList.DeleteSelection;
    cxDeviceList.EndUpdate;
    GCurSelectDev := nil;
    SelectDevChanged;
  end;
end;
           
procedure TConfineAreaListFrm.Dev_DelAllExecute(Sender: TObject);
var
  i:integer;
  dev: TDevice;
  moveCause: string;
begin
  if GCurConfineArea = nil then exit;
  if cxDeviceList.Count =0 then exit;
  
  moveCause :='�û���ԭ����ɾ���˶Ըó����޶�';
  if messagebox(handle,'��ȷ��Ҫɾ����ǰ����������޶�������','��ʾ',
    MB_YESNO + MB_ICONQUESTION)= idYes then
  begin
    cxDeviceList.BeginUpdate;
    cxDeviceList.FocusedNode := nil;
    cxDeviceList.Clear;
    cxDeviceList.EndUpdate;
    FMap.EnableTimer(False);//
    for i:=0 to GCurConfineArea.DevList.Count -1 do
    begin
      //������ ���� ��Ӧ����--�޶�����ID ɾ��
      dev := ADeviceManage.Find(GCurConfineArea.DevList[i]);
      dev.AreaList.Remove(GCurConfineArea); //2007-1-4 by dxf for  һ����Ӧ������

      case GCurConfineArea.AreaType  of
        ALARM_OUT:
        begin
            dev.Alarm_OutCArea:=false;
            mainf.RemoveOutorInCAData2History(dev,ALARM_OUT,moveCause);
        end;
        ALARM_IN:
        begin
            dev.Alarm_InCArea:=false;
            mainf.RemoveOutorInCAData2History(dev,ALARM_IN,moveCause);
        end;
//        ALARM_WAY_OUT:
//        begin
//            //GCurSelectDev.Alarm_WayOutCArea:=false;
//            mainf.RemoveOutorInCAData2History(dev,ALARM_WAY_OUT,moveCause);
//        end;
//        ALARM_WAY_IN:
//        begin
//            //dev.Alarm_WayInCArea:=false;
//            mainf.RemoveOutorInCAData2History(dev,ALARM_WAY_IN,moveCause);
//        end;
      end;

    end;
    GCurConfineArea.ClearDevId;
    FMap.EnableTimer(True);
    FMap.DrawGpsMap_ClearDraw; //��GPSͼ�� ���ػ���
    GCurSelectDev := nil;
    SelectDevChanged;
  end;
end;

procedure TConfineAreaListFrm.cxDeviceListClick(Sender: TObject);
begin
  if cxDeviceList.SelectionCount =0 then exit;
  GCurSelectDev := TDevice(cxDeviceList.Selections[0].Data);
  SelectDevChanged;
end;
   
procedure TConfineAreaListFrm.cxDeviceListFocusedNodeChanged(
  Sender: TObject; APrevFocusedNode, AFocusedNode: TcxTreeListNode);
begin
  {if cxDeviceList.FocusedNode = nil  then exit;
  GCurSelectDev :=TDevice(cxDeviceList.FocusedNode.Data);
  SelectDevChanged;  }
  if cxDeviceList.SelectionCount =0 then exit;
  GCurSelectDev := TDevice(cxDeviceList.Selections[0].Data);
  SelectDevChanged;
end;    

procedure TConfineAreaListFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Mainf.show_ConfineAreaList.Checked := false;
end;

procedure TConfineAreaListFrm.cxAreaListEditValueChanged(Sender: TObject;
  AColumn: TcxTreeListColumn);
begin
  if cxAreaList.FocusedNode = nil then exit;
  if GCurConfineArea = nil then
    GCurConfineArea  := TConfineArea(cxAreaList.FocusedNode.Data);
  //if AColumn = area_Isdraw then
  begin
    //GCurConfineArea.IsDraw := not GCurConfineArea.IsDraw;
    GCurConfineArea.IsDraw:=cxAreaList.FocusedNode.Values[3];
    //���� ����ͼ
    //FMap.Draw;
  end;
end;

procedure TConfineAreaListFrm.Clear_Changed;
begin
  CurrConfineAreaChanged;
  SelectDevChanged;
end;

procedure TConfineAreaListFrm.cxDeviceListEditValueChanged(Sender: TObject;
  AColumn: TcxTreeListColumn);
begin
  if cxDeviceList.FocusedNode = nil then exit;
  if AColumn =dev_Track then
    mainf.fun_watch_car.Execute
  else if AColumn = dev_DrawTrack then
    mainf.fun_ShowACarTrack.Execute;
end;

procedure TConfineAreaListFrm.Add2DevList(const ADev: Tdevice);
var
  node : TcxTreeListNode;
begin
  try
    with cxDeviceList do
    begin
      node := cxDeviceList.Add;
      node.Data := Adev;
      FillData(Adev,node);
    end;
  finally
  end;
end;

procedure TConfineAreaListFrm.FillData(ADev: TDevice;
  ANode: TcxTreeListNode);
//var
//  Downtime:TDatetime;
begin
  with ADev,ANode do
  begin
    Data:= ADev;
    Values[0]:= ADev.IdStr;
    Values[1]:= ADev.Car.No;
    Values[2]:= FormatFloat('##0.000000',ADev.Longitude);
    Values[3]:= FormatFloat('##0.000000',ADev.Latitude);
    Values[4]:= FormatFloat('##0.0', ADev.Speed/10); {FormatFloat('##0.0',ADev.Speed ); //* 1852/10000//ls}
    if ADev.GpsTime =0 then
      Values[5]:= '0'
    else
      Values[5]:= FormatDateTime('yyyy-mm-dd hh:nn:ss',ADev.GpsTime + 1/3 );
    //Values[6]:= ADev.Altitude;
    Values[7]:= ADev.Orientation;
    if ADev.Switch[STAT_GPS_LOCATE] then
      Values[8]:= '��λ'
    else
      Values[8]:= '�Ƕ�λ';

    //Downtime:=StrToInt(ADev.Param.PursueInterval)*5;
    //if Downtime=0 then Downtime:=30*5;SecondsBetween(now,ADev.LastConnectTime)<=Downtime

    if ADev.isOnline  then
    begin
      Values[9]:= '����';
      if ADev.Switch[STAT_GPS_LOCATE] then
        ANode.StateIndex:=3
      else
        ANode.StateIndex:=6;
    end
    else    //�粻����,����ʾ�Ƕ�λ..
    begin
      Values[8]:= '�Ƕ�λ';
      Values[9]:= '������';
      ANode.StateIndex:=4;
    end;
//    if ADev.Switch[4] then
//    begin
//      Values[8] := '����';
//      ANode.StateIndex := 7;
//    end;

{    if ADev.Switch[STAT_GPRS_ONLINE] then
      Values[9]:= '����'
    else
      Values[9]:= '������';  }
    //..
//    Values[10] := FMap.GpsDrawlayer.AutoFollowDevice = ADev;
    Values[11] := ADev.DrawTrack;
    ImageIndex:= ADev.Car.ResIndex ;
    SelectedIndex := ADev.Car.ResIndex ;
  end;
end;

procedure TConfineAreaListFrm.cxDeviceListEditing(Sender: TObject;
  AColumn: TcxTreeListColumn; var Allow: Boolean);
var
  dev: TDevice;
begin
  if cxDeviceList.FocusedNode = nil then exit;
  dev := Tdevice(cxDeviceList.FocusedNode.Data);
  if (AColumn =dev_Track) and (dev.Longitude =0) and  (dev.Latitude = 0) then
  begin
    Allow:= False;
    messagebox(handle,'Ŀǰ�ó��޶�λ���ݣ����ܸ���!','��ʾ',mb_ok + mb_iconinformation);
  end;
end;

procedure TConfineAreaListFrm.ListCurrConfine_AddDevs;
var
  i: integer;
  dev: Tdevice;
begin
  cxDeviceList.BeginUpdate;
  if cxDeviceList.FocusedNode <> nil then
    cxDeviceList.FocusedNode := nil;   //
  cxDeviceList.Clear; 
  if GCurConfineArea <> nil then
  begin
    if GCurConfineArea.DevList.Count <> 0 then
    begin
      for i:= 0 to GCurConfineArea.DevList.Count -1 do
      begin
        dev:= ADeviceManage.Find(GCurConfineArea.DevList[i]);
        if dev= nil then Continue;
        Add2DevList(dev);
      end;
    end;
  end;
  cxDeviceList.EndUpdate;
end;

procedure TConfineAreaListFrm.area_colorPropertiesSelectCustomColor(
  Sender: TObject; var AColor: TColor; var AColorDescription: String;
  var AddToList: Boolean);
begin
  if cxAreaList.FocusedNode<> nil then
    cxAreaList.FocusedNode.Values[2]:= AColor;
end;

procedure TConfineAreaListFrm.LoadConfineAreas;
var
  i: integer;
begin
  //�г����е�����
  ListConfineAreas;
  //����GCurConfineArea,����ߵ������б���focuesd��GCurConfineArea�ϣ����ұ��б��ϱߵ���ɫ
  if GCurConfineArea <> nil then
  begin
    for i:= 0 to cxAreaList.Count -1 do
      if cxAreaList.Items[i].Data = GCurConfineArea then
        cxAreaList.FocusedNode := cxAreaList.Items[i];
    CurrConfineAreaChanged;
  end;
end;

procedure TConfineAreaListFrm.ClearAreas;
begin
  cxAreaList.BeginUpdate;
  if cxAreaList.FocusedNode<> nil then cxAreaList.FocusedNode := nil;
  cxAreaList.Clear;
  cxAreaList.EndUpdate;
end;

//procedure TConfineAreaListFrm.SendMsg2MainF_DelAreaOrDev(ADev: Tdevice;
//  AreaType: byte);
//var
//  RvHandle: integer;
//begin
  //���ڻ����stack Overflow�����Բ�����Ϣȥ�����棨-����������ˢ��ɾ�����������ڱ��������б���ˢ�µ�ʱ��ɾ��
  {//����Ϣ
  RvHandle := FindWindow(MY_APP_NAME, nil);
  if RvHandle > 0 then
    PostMessage(RvHandle, CM_DELAlarmListDev_OutORInCA, ADev.Id, AreaType); }
//end;

procedure TConfineAreaListFrm.cxDeviceListDblClick(Sender: TObject);
begin
  if cxDeviceList.SelectionCount =0 then exit;
  GCurSelectDev := TDevice(cxDeviceList.Selections[0].Data);
  umainf.Mainf.fun_Locate_Car.Execute;
end;

procedure TConfineAreaListFrm.Area_SaveToServerExecute(Sender: TObject);
var
  i,ii:integer;
  area:TConfineArea;
  id:integer;
begin

  for i:=0 to  GAreaManage.Count-1 do
  begin
      area:=GAreaManage.Items[i];
      id:=bs.AddNewArea(area.ID,area.Name,area.AreaType,area.PointCount,area.OverSpeet);
      for ii:=0 to  area.DevList.Count -1 do
      begin
          bs.AddNewDevAreas(ADeviceManage.Find(area.DevList.Strings[ii]).Id,ID);
      end;
      for ii:=0 to area.PointCount -1 do
      begin
          bs.AddNewAreaInfo(id,area.WorldPointAry[ii].X,area.WorldPointAry[ii].Y);
      end;
  end;
end;

procedure TConfineAreaListFrm.area_SaveExecute(Sender: TObject);
begin
    GAreaManage.SaveCurrentAreasToFile(ExtractFilePath(application.ExeName)+current_User.UserName+'_areas.ini')
end;

procedure TConfineAreaListFrm.s1Click(Sender: TObject);
var
  dlg: TFrmSelectDevs;//TFrmSelectDevs_Add2CArea;
  dev :Tdevice;
  i: integer;
begin
  if GCurConfineArea = nil then
  begin
      messagebox(handle,'��ѡ��һ������!','��ʾ',mb_ok + mb_iconinformation);
      exit;
  end;
  dlg:= TFrmSelectDevs.Create(Self);
  try
    dlg.ShowModal;
    if dlg.ModalResult= mrok then
    begin

      for i:= 0 to dlg.DestList.Count -1 do//�ѳ���ӵ�������,�ٰ�������ӵ�����
      begin
        dev := TDevice(dlg.DestList.Items[i].data);
  


      end;
    end;
  finally
    dlg.Free;
  end;
end;

end.
