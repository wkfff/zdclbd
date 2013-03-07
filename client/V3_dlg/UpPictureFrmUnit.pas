unit UpPictureFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrmUnit, StdCtrls, ExtCtrls, ComCtrls, Buttons;

type
  TUpPictureFrm = class(TBaseFrm)
    Label1: TLabel;
    ComboBoxCamera: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    beginDate: TDateTimePicker;
    beginTime: TDateTimePicker;
    endDate: TDateTimePicker;
    endTime: TDateTimePicker;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label4: TLabel;
    cbxMediaType: TComboBox;
    Label5: TLabel;
    cbxMediaReason: TComboBox;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UpPictureFrm: TUpPictureFrm;

implementation
uses uFrmSelectDevs,Carunit,uGloabVar,ConstDefineUnit, Math;
{$R *.dfm}

procedure TUpPictureFrm.BitBtn1Click(Sender: TObject);
var
  i,j:integer;
  D:TDevice;
  beginDateTime: TDateTime;
  endDateTime: TDateTime;
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

      beginDateTime := beginDate.Date;
      ReplaceTime(beginDateTime, beginTime.Time);
      endDateTime := endDate.Date;
      ReplaceTime(endDateTime, endTime.Time);

      DataServer.SendUploadMediaDataTSP_V3(D, cbxMediaType.ItemIndex, ComboBoxCamera.ItemIndex, cbxMediaReason.ItemIndex, beginDateTime, endDateTime, IfThen(RadioButton1.Checked, 0, 1));
//      DataServer.SendUpPicture_V3(D, ComboBoxCamera.ItemIndex,FormatDatetime('yyyy-mm-dd hh:nn:ss',beginDateTime),
//                                    FormatDatetime('yyyy-mm-dd hh:nn:ss',endDateTime), RadioDeleteSign.ItemIndex);

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
