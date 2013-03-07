unit uClxxQryForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ValEdit, ExtCtrls;

type
  TFormClxxQry = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    ClxxValueListEditor: TValueListEditor;
    BitBtnClose: TBitBtn;
    Panel1: TPanel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    BitBtnQry: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitBtnQryClick(Sender: TObject);
    procedure ComboBox2DropDown(Sender: TObject);
    procedure BitBtnCloseClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FListCph : TStringList;
    FListSim : TStringList;
  public
    { Public declarations }
    FDevId : string;
  end;


var
  FormClxxQry: TFormClxxQry;

implementation
 uses uGloabVar,CarUnit;
{$R *.dfm}

procedure TFormClxxQry.FormShow(Sender: TObject);
var
  dev : TDevice;
begin
  if FdevId ='' then exit;
  dev := ADeviceManage.Find(FdevId);
  ClxxValueListEditor.Cells[1,1] := dev.Car.No;
  ClxxValueListEditor.Cells[1,2] := dev.DispLabel;
  ClxxValueListEditor.Cells[1,3] := dev.SimNo;
  ClxxValueListEditor.Cells[1,4] :=ADriverManage.GetDriver(Dev).Name;// AConntypeManage.getConnType(dev.ConnTypeID).name;
  ClxxValueListEditor.Cells[1,5] := ADevGroupManage.find(dev.GroupID).Name ;
  ClxxValueListEditor.Cells[1,6] := dev.id;//inttostr(dev.id);
end;

procedure TFormClxxQry.BitBtnQryClick(Sender: TObject);
var
  i,itemNum:integer;
begin
  itemNum := -1 ;
  if ComboBox1.ItemIndex =0 then
  begin
    if trim(ComboBox2.Text) ='' then
    begin
      messagebox(handle,'请选择输入车牌号！','提示',mb_ok + mb_iconinformation);
      ComboBox2.SetFocus;
      exit;
    end;
    for i:= 0 to ADeviceManage.Count - 1 do
      if ADeviceManage.Items[i].Car.No = trim(ComboBox2.Text) then
      begin
        itemNum:=i;
        break;
      end;
  end
  else if ComboBox1.ItemIndex = 1 then
  begin
    if trim(ComboBox2.Text) ='' then
    begin
      messagebox(handle,'请选择输入SIM卡号！','提示',mb_ok + mb_iconinformation);
      ComboBox2.SetFocus;
      exit;
    end;
    for i:= 0 to ADeviceManage.Count - 1 do
      if ADeviceManage.Items[i].SimNo = trim(ComboBox2.Text) then
      begin
        itemNum:=i;
        break;
      end;
  end;
  if itemNum = -1 then
  begin
    ClxxValueListEditor.Cells[1,1] :='没有此车辆';
    ClxxValueListEditor.Cells[1,2] := '';
    ClxxValueListEditor.Cells[1,3] := '';
    ClxxValueListEditor.Cells[1,4] := '';
    ClxxValueListEditor.Cells[1,5] := '';
    ClxxValueListEditor.Cells[1,6] := '';
  end
  else
  begin
    ClxxValueListEditor.Cells[1,1] := ADeviceManage.Items[itemNum].Car.No;
    ClxxValueListEditor.Cells[1,2] := ADeviceManage.Items[itemNum].DispLabel;
    ClxxValueListEditor.Cells[1,3] := ADeviceManage.Items[itemNum].SimNo;
    ClxxValueListEditor.Cells[1,4] := ADriverManage.GetDriver(ADeviceManage.Items[itemNum]).Name; //AConntypeManage.getConnType(ADeviceManage.Items[itemNum].ConnTypeID).name;
    ClxxValueListEditor.Cells[1,5] := ADevGroupManage.Find(ADeviceManage.Items[itemNum].GroupID).Name ;
    ClxxValueListEditor.Cells[1,6] := ADeviceManage.Items[itemNum].id;
  end;
end;

procedure TFormClxxQry.ComboBox2DropDown(Sender: TObject);
var
  i:integer;
begin
  if (ComboBox1.ItemIndex=0) then
  begin
    if FListCph = nil then
    begin
      FListCph := TStringList.Create;
      for i:= 0 to ADeviceManage.Count - 1 do
        FListCph.Add(ADeviceManage.Items[i].Car.No);
    end;
    ComboBox2.Items.Assign(FListCph);
  end
  else if ComboBox1.ItemIndex=1 then
  begin
    if FListSim = nil then
    begin
      FListSim := TStringList.Create;
      for i:= 0 to ADeviceManage.Count - 1 do
        FListSim.Add(ADeviceManage.Items[i].SimNo);
    end;
    ComboBox2.Items.Assign(FListSim);
  end;
end;

procedure TFormClxxQry.BitBtnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TFormClxxQry.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if FListCph <> nil then FListCph.Free;
  if FListSim <> nil then FListSim.Free;
end;

procedure TFormClxxQry.ComboBox1Change(Sender: TObject);
begin
  ComboBox2.Text := ComboBox1.Text;
end;

procedure TFormClxxQry.FormDestroy(Sender: TObject);
begin
  if FListCph <> nil then
    FListCph.Free;

  if FListSim <> nil then
    FListSim.Free;
end;

end.
