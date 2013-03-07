unit FrmDevAreaListUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, RzListVw, ExtCtrls, CarUnit, ConfineAreaUnit;

type
  TfrmDevAreaList = class(TForm)
    Panel1: TPanel;
    RzListView1: TRzListView;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    rbUpdate: TRadioButton;
    rbAttach: TRadioButton;
    rbModify: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure addAreaToList(area: TBaseArea);
  public
    { Public declarations }
    areaIds: TStringList;
    procedure addDevAreaToList(dev: TDevice);
    procedure AddAllAreaToList();
  end;

var
  frmDevAreaList: TfrmDevAreaList;

implementation
uses
  uGloabVar;

{$R *.dfm}

procedure TfrmDevAreaList.addDevAreaToList(dev: TDevice);
var
  i: Integer;
  area: TBaseArea;
begin
  if dev <> nil then
  begin
    for i := 0 to dev.DevAreaList.Count - 1 do
    begin
      area := TBaseArea(dev.DevAreaList.Datas[i]);
      addAreaToList(area);
    end;
  end;
end;

procedure TfrmDevAreaList.FormCreate(Sender: TObject);
begin
  areaIds := TStringList.Create;
end;

procedure TfrmDevAreaList.FormDestroy(Sender: TObject);
begin
  areaIds.Free;
end;

procedure TfrmDevAreaList.BitBtn1Click(Sender: TObject);
var
  i: Integer;
  area: TBaseArea;
begin
  areaIds.Clear;
  for i := 0 to RzListView1.Items.Count - 1 do
  begin
    if RzListView1.Items.Item[i].Checked then
    begin
      area := TBaseArea(RzListView1.Items.Item[i].Data);
      areaIds.Add(IntToStr(area.AreaID));
    end;
  end;
  if areaIds.Count <= 0 then
  begin
    MessageBox(Handle, '请至少选择一个区域', '提示', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  ModalResult := mrOk;
end;

procedure TfrmDevAreaList.AddAllAreaToList;
var
  i: Integer;
  area: TBaseArea;
begin
  for i := 0 to FAllAreaManage.AllCircleList.Count - 1 do
  begin
    area := TBaseArea(FAllAreaManage.AllCircleList.Items[i]);
    addAreaToList(area);
  end;  
end;

procedure TfrmDevAreaList.addAreaToList(area: TBaseArea);
begin
  if area <> nil then
  begin
    with RzListView1.Items.Add do
    begin
      Caption := GetDevAreaTypeName(area.AreaPictureKind);
      SubItems.Add(IntToStr(area.areaNO));
      SubItems.Add(area.AreaName);
      Data := area;
    end;
  end;
end;

end.
