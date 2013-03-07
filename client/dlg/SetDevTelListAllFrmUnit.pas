unit SetDevTelListAllFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SetDevTelListFrmUnit, cxGraphics, cxCustomData, cxStyles, cxTL,
  cxTextEdit, Menus, ActnList, cxInplaceContainer, cxControls, StdCtrls,
  Buttons, ExtCtrls,CarUnit, ComCtrls;

type
  TSetDevTelListAllFrm = class(TSetDevTelListFrm)
    Panel4: TPanel;
    Panel8: TPanel;
    BitBtn5: TBitBtn;
    BitBtnSel: TBitBtn;
    ListView1: TListView;
    Panel7: TPanel;
    Panel5: TPanel;
    ProgressBar1: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure AddTelExecute(Sender: TObject);
    procedure ModifyTelExecute(Sender: TObject);
    procedure DelTelExecute(Sender: TObject);
    procedure ClrTelExecute(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtnSelClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtnCancelClick(Sender: TObject);
  private
    Dev:TDevice;
    { Private declarations }
  public
    Cancel: Boolean;
  end;

var
  SetDevTelListAllFrm: TSetDevTelListAllFrm;

implementation
    uses uGloabVar,uFrmSelectDevs;
{$R *.dfm}

procedure TSetDevTelListAllFrm.FormCreate(Sender: TObject);
begin
  inherited;
  Dev:=TDevice.Create;
end;

procedure TSetDevTelListAllFrm.FormDestroy(Sender: TObject);
begin
  Dev.Free;
  inherited;
end;

procedure TSetDevTelListAllFrm.AddTelExecute(Sender: TObject);
begin
  AddTelNum(Dev);
end;

procedure TSetDevTelListAllFrm.ModifyTelExecute(Sender: TObject);
begin
  ModifyTelNum(Dev);
end;

procedure TSetDevTelListAllFrm.DelTelExecute(Sender: TObject);
begin
  DelTelNum(Dev);
end;

procedure TSetDevTelListAllFrm.ClrTelExecute(Sender: TObject);
begin
   ClrTelnum(dev);
end;

procedure TSetDevTelListAllFrm.BitBtn1Click(Sender: TObject);
var
  i,j:integer;
  D:TDevice;
  Telinfo:PTelInfo;
begin
  if cxDevTelList.Count<=0 then
  begin
    if messagebox(handle,'您确定要删除所有的电话本吗？','删除选项',MB_OKCANCEL + MB_ICONQUESTION)= ID_CANCEL then
       exit;
  end;
  Panel4.Enabled:=false;
  Panel111.Enabled:=false;
  Panel5.Visible:=true;
  ProgressBar1.Max:=ListView1.Items.Count*5*10;
  TbitBtn(Sender).Enabled:=false;
  try
    for i:=0 to ListView1.Items.Count -1 do
    begin
      if Cancel then
      begin
        if messagebox(handle, '是否确实要取消对剩余车辆的操作？', '提示', MB_YESNO + MB_ICONQUESTION) = ID_YES then
        begin
          Close;
          Exit;
        end
        else
        begin
          Cancel := False;
        end;
      end;
      D:=TDevice(ListView1.Items.Item[i].Data);
      D.ClrTelList;
      ProgressBar1.StepIt;
      for j:=0 to Dev.TelList.Count-1 do //当=0时,,是删除电话本里的内容.
      begin
        TelInfo:= D.AddTelInfo(Dev.TelItems[j].id);
        TelInfo^.No:=Dev.TelItems[j].No;
        TelInfo^.Name:=Dev.TelItems[j].Name;
        TelInfo^.TelType:=Dev.TelItems[j].TelType;
      end;

      ProgressBar1.StepIt;
      DataServer.SetTelList(D);
      ProgressBar1.StepIt;
      TelNumSaveToDB(D);
      ProgressBar1.StepIt;
      //Sleep(50);
      Application.ProcessMessages;
    end;

  finally
    Panel4.Enabled:=true;
    Panel111.Enabled:=true;
    Panel5.Visible:=false;
    TbitBtn(Sender).Enabled:=true;
  end;
 Close;
end;

procedure TSetDevTelListAllFrm.BitBtnSelClick(Sender: TObject);
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

procedure TSetDevTelListAllFrm.BitBtn5Click(Sender: TObject);
begin
  if ListView1.Items.Count =1 then
  begin
     messagebox(handle,'车辆里只有一辆车,不能删除了!','提示',mb_ok + mb_iconinformation);
  end
  else
  begin
    ListView1.DeleteSelected;
  end;
end;




procedure TSetDevTelListAllFrm.ListView1Click(Sender: TObject);
var
  D:TDevice;
  J:integer;
  Telinfo:PTelInfo;
begin
    if ListView1.Selected =nil then exit;
    D:=TDevice(ListView1.Selected.Data);
    Dev.ClrTelList;
    for j:=0 to D.TelList.Count-1 do
    begin
      TelInfo:= Dev.AddTelInfo(D.TelItems[J].id);
      TelInfo^.No:=D.TelItems[j].No;
      TelInfo^.Name:=D.TelItems[j].Name;
      TelInfo^.TelType:=D.TelItems[j].TelType;
    end;
    ReLoadTelList(Dev);
end;

procedure TSetDevTelListAllFrm.FormShow(Sender: TObject);
begin
  ListView1.Items.Item[0].Selected:=true; 
  ListView1Click(ListView1);
end;

procedure TSetDevTelListAllFrm.BitBtnCancelClick(Sender: TObject);
begin
  Cancel := True;

end;

end.
