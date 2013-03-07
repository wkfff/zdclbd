unit frmSendUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrmUnit, StdCtrls, ComCtrls, Buttons, ExtCtrls;

type
  TfrmSend = class(TBaseFrm)
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Memo2: TMemo;
    Label3: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSend: TfrmSend;

implementation
uses uFrmSelectDevs,Carunit,uGloabVar,ConstDefineUnit, CmdStructUnit;
{$R *.dfm}

procedure TfrmSend.BitBtn1Click(Sender: TObject);
var
  i,j:integer;
  D:TDevice;
  MCUType: Byte;
  Flag: Byte;
begin
  if (Length(Trim(Memo1.Text)) mod 2 ) <> 0 then
  begin
    messagebox(handle, PChar('数据的长度为'+IntToStr(Length(Trim(Memo1.Text)))+' 不是偶数'), '提示', MB_OK + MB_ICONINFORMATION);
    Memo1.SetFocus;
    Exit;
  end;

  try

    if RadioButton1.Checked then
    begin
      Flag := TERMSRV_TSM_V3;
      MCUType := TSM_TYPEID;
    end
    else if RadioButton2.Checked then
    begin
      Flag := TERMSRV_MCU_V3;
      MCUType := LIGHT_TYPEID;
    end
    else if RadioButton3.Checked then
    begin
      Flag := TERMSRV_METER_V3;
      MCUType := METER_TYPEID;
    end
    else if RadioButton4.Checked then
    begin
      Flag := SRVTERM_SENDVIDEW_V3;
      MCUType := LCD_TYPEID;
    end
    else if RadioButton5.Checked then
    begin
      Flag := TERMSRV_LED_V3;
      MCUType := LED_TYPEID;
    end;

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

      DataServer.Send_V3(D, Flag, MCUType, Trim(Memo1.Text));

      ProgressBar1.StepIt;
      ProgressBar1.StepIt;
      Sleep(50);
      Application.ProcessMessages;
    end;
  finally
    PanProgress.Visible:=False;
    TbitBtn(Sender).Enabled:=true;
  end;
 //Close;
end;

end.
