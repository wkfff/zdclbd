unit ControlMCUFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrmUnit, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TControlMCUFrm = class(TBaseFrm)
    Edit1: TEdit;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    count: Byte;
  end;

var
  ControlMCUFrm: TControlMCUFrm;

implementation
uses uFrmSelectDevs,Carunit,uGloabVar,ConstDefineUnit;
{$R *.dfm}

procedure TControlMCUFrm.BitBtn1Click(Sender: TObject);
var
  i:integer;
  D:TDevice;
begin
  if Trim(Edit1.Text) = '' then
  begin
    messagebox(handle,'密码不能为空号!','提示',mb_ok + mb_iconinformation);
    Edit1.SetFocus;
    Exit;
  end;

  if Trim(Edit1.Text) <> current_user.Password then
  begin
    messagebox(handle,'密码不正确!','提示',mb_ok + mb_iconinformation);
    count := count + 1;
    if count >= 3 then
    begin
      messagebox(handle,'3次输入密码都不正确，此窗体将关闭!','提示',mb_ok + mb_iconinformation);
      Close;
    end;
    Edit1.SetFocus;
    Exit;
  end
  else
  begin
    try
      PanProgress.Visible:=true;
      ProgressBar1.Max:=ListView1.Items.Count*5*10;
      TbitBtn(Sender).Enabled:=false;

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
        ProgressBar1.StepIt;

        ProgressBar1.StepIt;

        DataServer.SendControlMCU_V3(D);

        ProgressBar1.StepIt;
        ProgressBar1.StepIt;
        Sleep(50);
        Application.ProcessMessages;
      end;
    finally
      PanProgress.Visible:=False;
      TbitBtn(Sender).Enabled:=true;
    end;
    Close;
  end;
end;

procedure TControlMCUFrm.FormShow(Sender: TObject);
begin
  count := 0;
end;

end.
