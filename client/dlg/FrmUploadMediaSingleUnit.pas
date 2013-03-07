unit FrmUploadMediaSingleUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UpPictureFrmUnit, StdCtrls, ComCtrls, Buttons, ExtCtrls;

type
  TfrmUploadMediaDataSingle = class(TUpPictureFrm)
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CurrMediaId: LongWord;
  end;

var
  frmUploadMediaDataSingle: TfrmUploadMediaDataSingle;

implementation
uses
  CarUnit, uGloabVar, Math;

{$R *.dfm}

procedure TfrmUploadMediaDataSingle.BitBtn1Click(Sender: TObject);
var
  i,j:integer;
  D:TDevice;
begin
  try
    ProgressBar1.Visible:=true;
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

      DataServer.SendUploadMediaDataSingleTSP_V3(D, CurrMediaId, IfThen(RadioButton1.Checked, 0, 1));

      ProgressBar1.StepIt;
      ProgressBar1.StepIt;
      Sleep(50);
      Application.ProcessMessages;
    end;
  finally
    ProgressBar1.Visible:=False;
    TbitBtn(Sender).Enabled:=true;
  end;
 Close;
end;

end.
