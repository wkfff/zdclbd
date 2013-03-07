unit BaseFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, uFrmSelectDevs,Carunit,
  uGloabVar,ConstDefineUnit;

type
  TBaseFrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    ListView1: TListView;
    Panel4: TPanel;
    Panel6: TPanel;
    BitBtnSel: TBitBtn;
    BitBtn3: TBitBtn;
    Panel5: TPanel;
    Panel7: TPanel;
    PanProgress: TPanel;
    ProgressBar1: TProgressBar;
    procedure BitBtnSelClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Cancel: Boolean;
  end;

var
  BaseFrm: TBaseFrm;

implementation

{$R *.dfm}

procedure TBaseFrm.BitBtnSelClick(Sender: TObject);
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

procedure TBaseFrm.BitBtn3Click(Sender: TObject);
begin
  if ListView1.Selected =nil then exit;
  if ListView1.Items.Count =1 then
  begin
    messagebox(handle,'只有一辆车了，不能删除！','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  ListView1.DeleteSelected ; 
end;

procedure TBaseFrm.BitBtn2Click(Sender: TObject);
begin
  Cancel := True;
end;

end.
