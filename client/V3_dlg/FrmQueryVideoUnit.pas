unit FrmQueryVideoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QueryAudioFrmUnit, StdCtrls, ComCtrls, Buttons, ExtCtrls;

type
  TfrmQueryVideo = class(TQueryAudioFrm)
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation
uses
  CarUnit, uGloabVar;
  
{$R *.dfm}

procedure TfrmQueryVideo.BitBtn1Click(Sender: TObject);
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
          MessageBox(Handle, '��ʼʱ�䲻�ܴ��ڽ���ʱ�䣬������ѡ��ʱ��', '��ʾ', MB_OK + MB_ICONINFORMATION);
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
        if messagebox(handle, '�Ƿ�ȷʵҪȡ����ʣ�೵���Ĳ�����', '��ʾ', MB_YESNO + MB_ICONQUESTION) = ID_YES then
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
        DataServer.SendQueryVideo_V3(D, ComboBoxCamera.ItemIndex, ComboBoxReason.ItemIndex, FormatDatetime('yyyy-mm-dd hh:nn:ss',beginDateTime),
                                      FormatDatetime('yyyy-mm-dd hh:nn:ss',endDateTime), true);
      end
      else
        DataServer.SendQueryVideo_V3(D, ComboBoxCamera.ItemIndex, ComboBoxReason.ItemIndex, '', '', False);
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

end.
