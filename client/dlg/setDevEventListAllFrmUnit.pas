unit setDevEventListAllFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, setDevEventListFrmUnit, cxGraphics, cxCustomData, cxStyles,
  cxTL, cxTextEdit, ActnList, StdCtrls, Buttons, cxInplaceContainer,
  cxControls, ExtCtrls, ComCtrls, CarUnit, RzPanel, RzRadGrp;

type
  TsetDevEventListAllFrm = class(TsetDevEventListFrm)
    Panel4: TPanel;
    Panel8: TPanel;
    BitBtn5: TBitBtn;
    BitBtnSel: TBitBtn;
    ListView1: TListView;
    Panel7: TPanel;
    Panel5: TPanel;
    ProgressBar1: TProgressBar;
    RzRadioGroup1: TRzRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddEventExecute(Sender: TObject);
    procedure ModifyEventExecute(Sender: TObject);
    procedure DelEventExecute(Sender: TObject);
    procedure ClrEventExecute(Sender: TObject);
    procedure BitBtnOkClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtnSelClick(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtnCancelClick(Sender: TObject);
  private
    Dev:TDevice;
  public
    Cancel: Boolean;
  end;

var
  setDevEventListAllFrm: TsetDevEventListAllFrm;

implementation
uses uGloabVar,uFrmSelectDevs;
{$R *.dfm}


procedure TsetDevEventListAllFrm.FormCreate(Sender: TObject);
begin
  inherited;
  Dev:=TDevice.Create;
end;

procedure TsetDevEventListAllFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Dev.Free;
  inherited;
end;

procedure TsetDevEventListAllFrm.AddEventExecute(Sender: TObject);
begin
  AddEventNum(dev);

end;

procedure TsetDevEventListAllFrm.ModifyEventExecute(Sender: TObject);
begin
  ModifyEventNum(Dev);
end;

procedure TsetDevEventListAllFrm.DelEventExecute(Sender: TObject);
begin
  DelEventNum(Dev);

end;

procedure TsetDevEventListAllFrm.ClrEventExecute(Sender: TObject);
begin
  ClrEventnum(dev);

end;

procedure TsetDevEventListAllFrm.BitBtnOkClick(Sender: TObject);
var
  i,j:integer;
  D:TDevice;
  EventInfo:PEventInfo;
begin
  if cxDevEventList.Count<=0 then
  begin
    if messagebox(handle,'您确定要删除所有的事件信息吗？','删除选项',MB_OKCANCEL + MB_ICONQUESTION)= ID_CANCEL then
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
      D.ClrEventList;
      ProgressBar1.StepIt;
      for j:=0 to Dev.EventList.Count-1 do //当=0时,,是删除事件列表里的内容.
      begin
        EventInfo:= D.AddEventInfo(Dev.EventItems[j].id);
        EventInfo^.No := Dev.EventItems[j].No;
        EventInfo^.Info:=Dev.EventItems[j].Info;
      end;

      ProgressBar1.StepIt;
      DataServer.SetEventList(D, RzRadioGroup1.ItemIndex); // 发送数据
      ProgressBar1.StepIt;
      EventNumSaveToDB(D);
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

procedure TsetDevEventListAllFrm.BitBtn5Click(Sender: TObject);
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

procedure TsetDevEventListAllFrm.BitBtnSelClick(Sender: TObject);
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

procedure TsetDevEventListAllFrm.ListView1Click(Sender: TObject);
var
  D:TDevice;
  J:integer;
  EventInfo:PEventInfo;
begin
    if ListView1.Selected =nil then exit;
    D:=TDevice(ListView1.Selected.Data);
    Dev.ClrEventList;
    for j:=0 to D.EventList.Count-1 do
    begin
      EventInfo:= Dev.AddEventInfo(D.EventItems[J].id);;
      //EventInfo^.id:=D.EventItems[j].id;
      EventInfo^.No := D.EventItems[j].No;
      EventInfo^.Info:=D.EventItems[j].info;
    end;
    ReLoadEventList(Dev);
end;

procedure TsetDevEventListAllFrm.FormShow(Sender: TObject);
begin
  ListView1.Items.Item[0].Selected:=true; 
  ListView1Click(ListView1);
end;

procedure TsetDevEventListAllFrm.BitBtnCancelClick(Sender: TObject);
begin
  Cancel := True;

end;

end.
