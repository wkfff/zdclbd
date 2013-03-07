unit SetUpdateDevAllFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SetUpdateDevFrmUnit, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TSetUpdateDevAllFrm = class(TSetUpdateDevFrm)
    Panel8: TPanel;
    Panel9: TPanel;
    BitBtn3: TBitBtn;
    BitBtnSel: TBitBtn;
    ListView1: TListView;
    Panel10: TPanel;
    ProgressBar1: TProgressBar;
    procedure BitBtnOkClick(Sender: TObject);
    procedure BitBtnSelClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SetUpdateDevAllFrm: TSetUpdateDevAllFrm;

implementation
          uses uFrmSelectDevs,Carunit,uGloabVar;
{$R *.dfm}

procedure TSetUpdateDevAllFrm.BitBtnOkClick(Sender: TObject);
var
  URL:string;
  Len:integer;
  i:integer;
  Dev:TDevice;
begin
  BitBtnOk.Enabled:=false;
  ProgressBar1.Visible:=true;
try
  URL:=Memo1.Text;
  url := ReplaceStr(url,'：',':');
  Len:=length(URL);
  if Len =0 then
  begin
     messagebox(handle,'升级地址不能为空!','提示',mb_ok + mb_iconinformation);
     exit;
  end;
  if (copy(url,1,1)<>':') or (copy(url,len,1)<>':')then
  begin
    MessageBox(Handle,'请在升级地址的前后输入":"','提示',MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  if (RadioGroup1.ItemIndex<0)then
  begin
     messagebox(handle,'请选择一个升级类型!','提示',mb_ok + mb_iconinformation);
     exit;
  end;
  ProgressBar1.Max:=ListView1.Items.Count*10;
  for i:=0 to   ListView1.Items.Count-1 do
  begin
    dev:=TDevice(ListView1.Items.Item[i].Data);
    DataServer.UpdateDevFirmware(dev.Id,RadioGroup1.ItemIndex,URL,Len);
    ProgressBar1.StepIt;
    sleep(50);
    Application.ProcessMessages;
  end;
finally
  BitBtnOk.Enabled:=true;
  ProgressBar1.Visible:=false;
end;
  Close;
end;

procedure TSetUpdateDevAllFrm.BitBtnSelClick(Sender: TObject);
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

procedure TSetUpdateDevAllFrm.BitBtn3Click(Sender: TObject);
begin
  if ListView1.Selected =nil then exit;
  if ListView1.Items.Count =1 then
  begin
    messagebox(handle,'只有一辆车了，不能删除！','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  ListView1.DeleteSelected ; 
end;

end.
