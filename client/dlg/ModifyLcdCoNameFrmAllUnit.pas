unit ModifyLcdCoNameFrmAllUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ModifyLcdCoNameFrmUnit, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TModifyLcdCoNameAllFrm = class(TModifyLcdCoNameFrm)
    Panel4: TPanel;
    Panel6: TPanel;
    BitBtn3: TBitBtn;
    BitBtnSel: TBitBtn;
    ListView1: TListView;
    Panel5: TPanel;
    ProgressBar1: TProgressBar;
    procedure BitBtnSelClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ModifyLcdCoNameAllFrm: TModifyLcdCoNameAllFrm;

implementation
      uses uFrmSelectDevs,Carunit,uGloabVar;
{$R *.dfm}

procedure TModifyLcdCoNameAllFrm.BitBtnSelClick(Sender: TObject);
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


procedure TModifyLcdCoNameAllFrm.BitBtn3Click(Sender: TObject);
begin
  if ListView1.Selected =nil then exit;
  if ListView1.Items.Count =1 then
  begin
    messagebox(handle,'只有一辆车了，不能删除！','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  ListView1.DeleteSelected ; 
end;


procedure TModifyLcdCoNameAllFrm.ListView1Click(Sender: TObject);
begin
  if ListView1.Selected <> nil then
  begin
    EditCoName.Text:=TDevice(ListView1.Selected.Data).DisPlayCoName;
  end;
end;

procedure TModifyLcdCoNameAllFrm.FormShow(Sender: TObject);
begin
  if ListView1.Items.Count>0 then
  begin
    ListView1.Items.Item[0].Selected:=true;
    ListView1Click(Sender);
    ListView1.SetFocus;
  end;
  EditCoName.SetFocus;
end;

procedure TModifyLcdCoNameAllFrm.BitBtnOkClick(Sender: TObject);
var
 tmpStr:string;
 Dev:TDevice;
 i:integer;
begin
  if ListView1.Items.Count=0 then
  begin
    messagebox(handle,'命令不能执行，没有指定车辆！','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  ProgressBar1.StepBy(0);
  ProgressBar1.Visible:=true;
  BitBtnOK.Enabled:=false;
  try
      ProgressBar1.Max:= ListView1.Items.Count*10*2;
      tmpStr:= trim(EditCoName.Text);
      // 去掉无效字符
      tmpstr := DelInvalidStr(tmpStr);
      for i:=0 to ListView1.Items.Count -1 do
      begin
       try
          Dev:=TDevice(ListView1.Items.Item[i].Data);
          if Dev=nil then
          begin
           ProgressBar1.StepIt;
           ProgressBar1.StepIt;
           continue;
          end;
          Dev.DisPlayCoName := tmpStr;
          ProgressBar1.StepIt;
          DataServer.ModifyDevDisplayName(Dev.Id,tmpStr,length(tmpStr));
          Bs.ModifyDev_DisplayName(Dev);
          ProgressBar1.StepIt;
         // Sleep(50);
          Application.ProcessMessages;
       except
         Continue;
       end;
      end;
   finally
     ProgressBar1.StepBy(0);
     ProgressBar1.Visible:=false;
     BitBtnOK.Enabled:=true;
   end;
   Close;

end;

end.
