unit QueryAudioFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrmUnit, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TQueryAudioFrm = class(TBaseFrm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    CheckBox1: TCheckBox;
    beginDate: TDateTimePicker;
    beginTime: TDateTimePicker;
    endDate: TDateTimePicker;
    endTime: TDateTimePicker;
    Label4: TLabel;
    ComboBoxReason: TComboBox;
    Label1: TLabel;
    ComboBoxCamera: TComboBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ComboBoxCameraKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBoxReasonKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QueryAudioFrm: TQueryAudioFrm;

implementation
uses uFrmSelectDevs,Carunit,uGloabVar,ConstDefineUnit;
{$R *.dfm}

procedure TQueryAudioFrm.BitBtn1Click(Sender: TObject);
var
  i,j:integer;
  D:TDevice;
  beginDateTime: TDateTime;
  endDateTime: TDateTime;
begin
  try
    if CheckBox1.Checked then
    begin
      beginDateTime := beginDate.Date;
      ReplaceTime(beginDateTime, beginTime.Time);
      endDateTime := endDate.Date;
      ReplaceTime(endDateTime, endTime.Time);
      if beginDateTime > endDateTime then
      begin
        if beginDateTime > endDateTime then
        begin
          MessageBox(Handle, '起始时间不能大于结束时间，请重新选择时间', '提示', MB_OK + MB_ICONINFORMATION);
          endTime.SetFocus;
          Exit;
        end;
      end;  
    end;
    
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
      if CheckBox1.Checked then
      begin
        DataServer.SendQueryAudio_V3(D, ComboBoxCamera.ItemIndex, ComboBoxReason.ItemIndex, FormatDatetime('yyyy-mm-dd hh:nn:ss',beginDateTime),
                                      FormatDatetime('yyyy-mm-dd hh:nn:ss',endDateTime), true);
      end
      else
        DataServer.SendQueryAudio_V3(D, ComboBoxCamera.ItemIndex, ComboBoxReason.ItemIndex, '', '', False);
      ProgressBar1.StepIt;
      ProgressBar1.StepIt;
      //Sleep(50);
      //Application.ProcessMessages;
    end;
  finally
    ProgressBar1.Visible:=False;
    TbitBtn(Sender).Enabled:=true;
  end;
 Close;
end;

procedure TQueryAudioFrm.FormShow(Sender: TObject);
begin
  beginDate.DateTime := Now - 1;
  beginTime.DateTime := Now - 1;
  endDate.DateTime := Now;
  endTime.DateTime := Now;

end;

procedure TQueryAudioFrm.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    beginDate.Color := clWindow;
    beginDate.Enabled := True;
    beginTime.Color := clWindow;
    beginTime.Enabled := True;
    endDate.Color := clWindow;
    endDate.Enabled := True;
    endTime.Color := clWindow;
    endTime.Enabled := True;
  end
  else
  begin
    beginDate.Color := clBtnFace;
    beginDate.Enabled := False;
    beginTime.Color := clBtnFace;
    beginTime.Enabled := False;
    endDate.Color := clBtnFace;
    endDate.Enabled := False;
    endTime.Color := clBtnFace;
    endTime.Enabled := False;
  end;
end;

procedure TQueryAudioFrm.ComboBoxCameraKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := #0;
end;

procedure TQueryAudioFrm.ComboBoxReasonKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := #0;
end;

end.
