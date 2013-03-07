unit GetAPictureFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ucall_dev, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TGetAPictureFrm = class(Tcall_dev)
    Label5: TLabel;
    editTXZL: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    editLD: TEdit;
    editDBD: TEdit;
    editBHD: TEdit;
    editSD: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label16: TLabel;
    ComboBoxSize: TComboBox;
    ComboBoxCamera: TComboBox;
    ComboBoxCameraCmd: TComboBox;
    editSJJG: TEdit;
    GroupBox1: TGroupBox;
    radio1: TRadioButton;
    radio2: TRadioButton;
    Panel3: TPanel;
    Label10: TLabel;
    editZS: TEdit;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    ProgressBar1: TProgressBar;
    procedure editSJJGKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBoxCameraCmdChange(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure editZSChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    Cancel: Boolean;
  end;

var
  GetAPictureFrm: TGetAPictureFrm;

implementation
uses CmdStructUnit, CarUnit, uGloabVar;
{$R *.dfm}

procedure TGetAPictureFrm.editSJJGKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
if not (Key in [#8, '0'..'9', #22]) then Key := #0;
end;

procedure TGetAPictureFrm.ComboBoxCameraCmdChange(Sender: TObject);
begin
  inherited;
  if ComboBoxCameraCmd.ItemIndex = 2 then
  begin
    Panel3.Visible := True;
    editZS.Text := '1';
    editSJJG.Text := '0';
  end
  else
  begin
    Panel3.Visible := False;
    editSJJG.Text := '0';
  end;
end;

procedure TGetAPictureFrm.BitBtn2Click(Sender: TObject);
begin
  Cancel := True;

end;

procedure TGetAPictureFrm.editZSChange(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  i := StringToInteger(Trim(editZS.Text));
  if i > 1 then
  begin
    editSJJG.Text := '5';
  end
  else
  begin
    editSJJG.Text := '0';
  end;
end;

procedure TGetAPictureFrm.FormShow(Sender: TObject);
begin
  inherited;
  if ComboBoxCameraCmd.ItemIndex = 2 then
  begin
    Panel3.Visible := True;
    editZS.Text := '1';
    editSJJG.Text := '0';
  end
  else
  begin
    Panel3.Visible := False;
  end;
end;

procedure TGetAPictureFrm.BitBtn1Click(Sender: TObject);
var
  i,j:integer;
  Dev: TDevice;

  CameraIndex: Byte; //����ͷ��
  CameraCmd: Word;  // ��������
  PZSJJG: Word;   // ����ʱ����
  SaveSign: Byte; // �����־
  GetPicSize: Byte; //��Ƭ�ߴ��С 0=320x240  1=640x480  2-else
  TXZL: Byte; // ͼ������
  LD: Byte;   // ����
  DBD: Byte;  // �Աȶ�
  BHD: Byte;  // ���Ͷ�
  SD: Byte;
begin
  try

    ProgressBar1.Max:=ListView1.Items.Count*5*10;
    TbitBtn(Sender).Enabled:=false;


    CameraIndex := ComboBoxCamera.ItemIndex + 1;
    if ComboBoxCameraCmd.ItemIndex = 0 then
      CameraCmd := 0
    else if ComboBoxCameraCmd.ItemIndex = 1 then
      CameraCmd := $FFFF
    else
      CameraCmd := StringToInteger(Trim(editZS.Text));    // ��������
    PZSJJG := StringToInteger(Trim(editSJJG.Text));
    if radio1.Checked then
      SaveSign := 1 // �����־
    else if radio2.Checked then
      SaveSign := 0;
    GetPicSize := ComboBoxSize.ItemIndex + 1; //��Ƭ�ߴ��С 0=320x240  1=640x480  2-else
    TXZL := StringToInteger(Trim(editTXZL.Text), 1); // ͼ������
    LD := StringToInteger(Trim(editLD.Text));   // ����
    DBD := StringToInteger(Trim(editDBD.Text));  // �Աȶ�
    BHD := StringToInteger(Trim(editBHD.Text));  // ���Ͷ�
    SD := StringToInteger(Trim(editSD.Text));

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
      Dev:=TDevice(ListView1.Items.Item[i].Data);
      ProgressBar1.StepIt;


      ProgressBar1.StepIt;
      if Dev <> nil then
      begin
        DataServer.GetAPicture(dev, CameraIndex, CameraCmd, PZSJJG, SaveSign, GetPicSize, TXZL, LD, DBD, BHD, SD);
        if currAlarmInfo <> nil then
          currAlarmInfo.SendGetPicCmdStatus := 1;
      end;
      ProgressBar1.StepIt;
      //ProgressBar1.StepIt;
      //Sleep(50);
      //Application.ProcessMessages;
    end;
  finally
    ProgressBar1.Position := 0;
    TbitBtn(Sender).Enabled := true;
    Close;
  end;
end;

end.
