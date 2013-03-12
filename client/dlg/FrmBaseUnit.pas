unit FrmBaseUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, RzButton, ExtCtrls, RzPanel, Carunit;

type
  TfrmBase = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    RzPanel3: TRzPanel;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzPanel4: TRzPanel;
    RzPanel5: TRzPanel;
    RzBitBtn3: TRzBitBtn;
    RzBitBtn4: TRzBitBtn;
    ListView1: TListView;
    procedure RzBitBtn3Click(Sender: TObject);
    procedure RzBitBtn4Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  protected
    function isConditionValid: Boolean; virtual;
  public
    procedure addADev(Dev: TDevice);
  end;

implementation
uses
  uFrmSelectDevs, uGloabVar;

{$R *.dfm}

procedure TfrmBase.RzBitBtn3Click(Sender: TObject);
var
  frm: TFrmSelectDevs;
  i:integer;
begin
  frm:=TFrmSelectDevs.Create(nil);
  try
    if frm.ShowModal=mrOk then
    begin
      ListView1.Clear;
      for i:=0 to frm.DestList.Count-1 do
      begin
        with ListView1.Items.Add do
        begin
          Caption:=TDevice(frm.DestList.Items[i].Data).Car.No;
          Data:=frm.DestList.Items[i].Data;
        end;
      end;
    end;
  finally
    frm.Free;
  end;
end;

procedure TfrmBase.RzBitBtn4Click(Sender: TObject);
begin
  if ListView1.Selected =nil then exit;
  
  if ListView1.Items.Count =1 then
  begin
    messagebox(handle,'只有一辆车了，不能删除！','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  ListView1.DeleteSelected ;
end;

procedure TfrmBase.RzBitBtn2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

function TfrmBase.isConditionValid: Boolean;
begin
  Result := True;
  if (ListView1.Items.Count <= 0) then
  begin
    Result := False;
    FGlobalTip.ShowHint('请至少选择一辆车', ListView1);
  end;  
end;

procedure TfrmBase.addADev(Dev: TDevice);
begin
  if (Dev <> nil) then
  begin
    with ListView1.Items.Add do
    begin
      Caption := Dev.Car.No;
      Data := Dev;
    end;
  end;
end;

end.
