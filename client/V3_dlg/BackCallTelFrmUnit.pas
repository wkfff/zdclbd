unit BackCallTelFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrmUnit, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TBackCallTelFrm = class(TBaseFrm)
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    editTel: TEdit;
    procedure editTelKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BackCallTelFrm: TBackCallTelFrm;

implementation
uses uFrmSelectDevs,Carunit,uGloabVar,ConstDefineUnit;
{$R *.dfm}

procedure TBackCallTelFrm.editTelKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9','-','*','?',#8]) then
  begin
    Key := #0;
    ShowTips('�����������ֻ�ֻ��š�-����ͨ�����*����?����', editTel);
    editTel.SetFocus;
  end;

end;

procedure TBackCallTelFrm.BitBtn1Click(Sender: TObject);
var
  i,j:integer;
  D:TDevice;
begin
  if Trim(editTel.Text) = '' then
  begin
    ShowTips('������绰����', editTel);
    editTel.SetFocus;
    Exit;
  end;  
  try
    PanProgress.Visible:=true;
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
      DataServer.SendBackCallTel_V3(D, RadioGroup1.ItemIndex ,Trim(editTel.Text));
      ProgressBar1.StepIt;
      ProgressBar1.StepIt;
      //Sleep(50);
      //Application.ProcessMessages;
    end;
  finally
    PanProgress.Visible:=False;
    TbitBtn(Sender).Enabled:=true;
  end;
 Close;
end;

end.
