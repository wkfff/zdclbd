unit QueryUpdateRecordFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QueryBaseFrmUnit, PrnDbgeh, DB, cxControls, cxSplitter, Grids,
  DBGridEh, ComCtrls, StdCtrls, Buttons, ExtCtrls, cxGraphics,
  cxCustomData, cxStyles, cxTL, cxTextEdit, cxInplaceContainer, IntegerListUnit,
  Menus;

type
  TQueryUpdateRecordFrm = class(TQueryBaseFrm)
    Label1: TLabel;
    cbxUpdateRes: TComboBox;
    Label4: TLabel;
    cbxDevType: TComboBox;
    Label6: TLabel;
    editHardVer: TEdit;
    Label7: TLabel;
    editSoftVer: TEdit;
    Label8: TLabel;
    cbxDevFact: TComboBox;
    PageControl3: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    cxOtherCarList: TcxTreeList;
    CxCarNo: TcxTreeListColumn;
    CxGroupName: TcxTreeListColumn;
    CxTel: TcxTreeListColumn;
    CxDevIdStr: TcxTreeListColumn;
    DBGridEh2: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    PopupMenu2: TPopupMenu;
    N2: TMenuItem;
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbxDevTypeChange(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
    CarList: TStringList;
    procedure GetQueryReturnInfo(Info: OleVariant);
    procedure AddOtherCarList;
    procedure AddDev(GroupId: Integer);
  public
    { Public declarations }
  end;

var
  QueryUpdateRecordFrm: TQueryUpdateRecordFrm;

implementation
uses StrUtils, QueryThreadUnit, uFrmRefreshProgress, ShowMessageInfo, DBClient, uGloabVar,
     CarUnit;
{$R *.dfm}

procedure TQueryUpdateRecordFrm.BitBtn5Click(Sender: TObject);
var
  MessageState: Integer;
  UserType: Boolean;
  xml: string;
  FCursor: TCursor;
  DevType, DevFact: Integer;
  QueryAllDevUpdateRecord: TQueryAllDevUpdateRecord;
begin
  inherited;
  DataSource1.DataSet := nil;
  if QueryContion = False then Exit;

  //screen.Cursor := FCursor;
  try
    //FCursor := -11;
    //清数据
    //DataSource1.DataSet := nil;
    if FDlgProgress = nil then
      FDlgProgress := TFrmRefreshProgress.Create(self);
    FDlgProgress.SetCaption('正在载入数据，请您稍候...');
    FDlgProgress.Gauge1.MinValue := 0;
    FDlgProgress.Gauge1.MaxValue := 100;

    FDlgProgress.Gauge1.Progress := 5;
    FDlgProgress.Show;
    Application.ProcessMessages;

    FDlgProgress.Gauge1.MaxValue := 10 + 10;
    FDlgProgress.Gauge1.Progress := 10;
    Application.ProcessMessages;

    if cbxDevType.ItemIndex < 0 then
    begin
      DevType := -1;
    end else
    begin
      DevType := Integer(cbxDevType.Items.Objects[cbxDevType.ItemIndex]);
    end;

    if cbxDevFact.ItemIndex < 0 then
    begin
        DevFact := -1;
    end else
    begin
      DevFact := Integer(cbxDevFact.Items.Objects[cbxDevFact.ItemIndex])
    end;

    QueryAllDevUpdateRecord := TQueryAllDevUpdateRecord.Create(dev_id, group_Id, group_paranet,
                                                              DevType, DevFact,
                                                              FromDate, ToDate, cbxUpdateRes.ItemIndex-1,
                                                              Trim(editHardVer.Text), Trim(editSoftVer.Text),
                                                              BitBtn5);
    QueryAllDevUpdateRecord.OnQueryReturn := GetQueryReturnInfo;

  finally
    //FCursor := 0;
    if FDlgProgress.Showing then FDlgProgress.Hide;
  end;
end;

procedure TQueryUpdateRecordFrm.GetQueryReturnInfo(Info: OleVariant);
var
  i: Integer;
begin
  try
    try
      FDlgProgress.GaugeProcessInc(10);
      
      if Info = null then
      begin
        messagebox(0, '对不起，没有满足查询要求的信息！', '提示', mb_ok + MB_ICONWARNING);
        Exit;
      end;

      aqStore.XMLData := Info;

      aqStore.Open;
      if aqStore.RecordCount  <= 0 then
      begin
        MessageBox(Handle,'对不起，没有符合条件的数据！','提示',MB_OK + MB_ICONINFORMATION);
        Exit;
      end;

      try
        CarList.Clear;
        aqStore.First;
        for i := 0 to aqStore.RecordCount - 1 do
        begin
          try
            CarList.Add(RightStr(aqStore.FieldByName('DEVID').AsString, 6));
          finally
            aqStore.Next;
          end;
        end;
      except
      end;

      DataSource1.DataSet := aqStore;
      DBGridEh2.DataSource := DataSource1;
    except
      on E: Exception do
      begin
        messageErrorBox('查询升级记录信息结果处理不正确！', e.Message);
        exit;
      end;
    end;
  finally
  end;
end;

procedure TQueryUpdateRecordFrm.FormCreate(Sender: TObject);
var
  FTemp: Tclientdataset;
  i: Integer;
begin
  inherited;

  try
    cbxDevType.Clear;
    FTemp := TClientDataSet.Create(nil);
    try
      FTemp.XMLData := Bs.DevUpdate_QueryAllDevType;

      FTemp.First;
      for i:=0 to FTemp.RecordCount-1 do
      begin
        cbxDevType.AddItem(FTemp.Fields.FieldByName('TYPENAME').AsString, TObject(FTemp.Fields.FieldByName('DEVTYPE').AsInteger));
        FTemp.Next;
      end;
    except
      //on E: Exception do
      //begin
      //  messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
      //  exit;
      //end;
    end;
  finally
    FTemp.Free;
  end;

  CarList := TStringList.Create;
  DBGridEh1 := DBGridEh2;
end;

procedure TQueryUpdateRecordFrm.cbxDevTypeChange(Sender: TObject);
var
  FTemp: Tclientdataset;
  i: Integer;
begin
  inherited;
  try
    cbxDevFact.Clear;
    FTemp := TClientDataSet.Create(nil);
    if cbxDevType.ItemIndex < 0 then Exit;
    try
      FTemp.XMLData := Bs.DevUpdate_QueryAllDevFact(Integer(cbxDevType.Items.Objects[cbxDevType.ItemIndex]));

      FTemp.First;
      for i:=0 to FTemp.RecordCount-1 do
      begin
        cbxDevFact.AddItem(FTemp.Fields.FieldByName('FACTNAME').AsString, TObject(FTemp.Fields.FieldByName('DEVFACTID').AsInteger));
        FTemp.Next;
      end;
    except
      //on E: Exception do
      //begin
      //  messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
      //  exit;
      //end;
    end;
  finally
    FTemp.Free;
  end;
end;

procedure TQueryUpdateRecordFrm.AddOtherCarList;
var
  i, j: Integer;
  dev: TDevice;
  devGrp: TDevGroup;
  Node: TTreeNode;
  GroupId: Integer;
begin
  Node := TreeView1.Selected;
  if Node = nil then
    GroupId := -1
  else
    GroupId := Integer(Node.Data);
  
  AddDev(GroupId);
  if GroupId >= 0 then
  begin
    devGrp := ADevGroupManage.find(GroupId);
    if not devGrp.leaf_nod then //==  说明父节点
    begin
      if devGrp.SonList.Count > 0 then
      begin
        for i := 0 to devGrp.SonList.Count - 1 do
        begin
          AddDev(devgrp.SonListItems[i]);
        end;
      end;
    end;
  end;
end;

procedure TQueryUpdateRecordFrm.AddDev(GroupId: Integer);
var
  i: Integer;
  dev: TDevice;
  devGrp: TDevGroup;
begin
  try
    cxOtherCarList.BeginUpdate;
    if GroupId < 0 then
    begin
      for i := 0 to ADeviceManage.Count - 1 do
      begin
        dev := ADeviceManage.Items[i];
        if dev = nil then Exit;
        if CarList.IndexOf(dev.id) < 0 then
        begin
          with cxOtherCarList.Add do
          begin
            Data := dev;
            Values[0] := dev.IdStr;
            Values[1] := dev.Car.No;
            devGrp := ADevGroupManage.find(dev.GroupID);
            if devGrp <> nil then
            begin
              Values[2] := devGrp.Name;
              Values[3] := devGrp.TelPhone;
            end
            else
            begin
              Values[2] := '';
              Values[3] := '';
            end;
          end;
        end;
      end;
    end else
    begin
      devGrp := ADevGroupManage.find(GroupId);
      if devGrp = nil then Exit;
      for i :=0 to devGrp.DevListCount - 1 do
      begin
        if CarList.IndexOf(devGrp.DevListItems[i]) < 0 then
        begin
          dev := ADeviceManage.find(devGrp.DevListItems[i]);
          if dev = nil then Continue;
          if dev.GroupID <> devGrp.id then Continue;
          with cxOtherCarList.Add do
          begin
            Data := dev;
            Values[0] := dev.IdStr;
            Values[1] := dev.Car.No;

            Values[2] := devGrp.Name;
            Values[3] := devGrp.TelPhone;
          end;
        end;
      end;
    end;
  finally
    cxOtherCarList.EndUpdate;
  end;
end;

procedure TQueryUpdateRecordFrm.N1Click(Sender: TObject);
begin
  try
    cxOtherCarList.Clear;
    AddOtherCarList;
  except
  end;
end;

procedure TQueryUpdateRecordFrm.N2Click(Sender: TObject);
begin
  cxTreeListToCSVFile(cxOtherCarList);
end;

end.
