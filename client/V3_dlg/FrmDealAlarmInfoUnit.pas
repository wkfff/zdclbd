unit FrmDealAlarmInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, RzButton, RzPanel, CarUnit;

type
  TfrmDealDevAlarmInfo = class(TForm)
    Panel1: TPanel;
    Notebook1: TNotebook;
    Panel2: TPanel;
    Label2: TLabel;
    edtCarNo: TEdit;
    Memo1: TMemo;
    RzButton1: TRzButton;
    RzButton2: TRzButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox4: TCheckBox;
    memoText: TMemo;
    btnMonitorCar: TRzButton;
    btnTakePhoto: TRzButton;
    btnSendText: TRzButton;
    Label6: TLabel;
    edtAlarmPos: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edtAlarmPerson: TEdit;
    edtAlarmTel: TEdit;
    memoAlarmDealProc: TMemo;
    memoAlarmDealResult: TMemo;
    RzButton3: TRzButton;
    Label1: TLabel;
    edtAlarmType: TEdit;
    btnRemoveAlarm: TRzButton;
    CheckBox3: TCheckBox;
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure RzButton1Click(Sender: TObject);
    procedure RzButton2Click(Sender: TObject);
    procedure RzButton3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnMonitorCarClick(Sender: TObject);
    procedure btnTakePhotoClick(Sender: TObject);
    procedure btnSendTextClick(Sender: TObject);
    procedure btnRemoveAlarmClick(Sender: TObject);
  private
    { Private declarations }
    curDev: TDevice;


    procedure SetCaption();
  public
    { Public declarations }
    devId: string;
    alarmType: Integer;
    alarmGpsTime: string;
    currStatus: Integer;
    alarmInfo: TAlarmInfoFromDev;

    areaType: Byte;
    ioFlag: Byte;
  end;

var
  frmDealDevAlarmInfo: TfrmDealDevAlarmInfo;

implementation

uses
  uGloabVar, FrmMonitorCarUnit, GetAPictureFrmUnit;

{$R *.dfm}

procedure TfrmDealDevAlarmInfo.CheckBox1Click(Sender: TObject);
begin
  btnMonitorCar.Enabled := CheckBox1.Checked;
end;

procedure TfrmDealDevAlarmInfo.CheckBox2Click(Sender: TObject);
begin
  btnTakePhoto.Enabled := CheckBox2.Checked;
end;

procedure TfrmDealDevAlarmInfo.CheckBox3Click(Sender: TObject);
begin
  btnRemoveAlarm.Enabled := CheckBox3.Checked;
end;

procedure TfrmDealDevAlarmInfo.CheckBox4Click(Sender: TObject);
begin
  btnSendText.Enabled := CheckBox4.Checked;
  memoText.Enabled := CheckBox4.Checked;
  if memoText.Enabled then
    memoText.Color := clWindow
  else
    memoText.Color := clInfoBk;
end;

procedure TfrmDealDevAlarmInfo.RzButton1Click(Sender: TObject);
  function GetAlarmType_PT(const alarmType: Integer): Integer;
  begin
    Result := $00FF;
    case alarmType of
      0: Result := $0003;//��������
      49: Result := $0001;//���ٱ���
      2: Result := $0002;//ƣ�ͼ�ʻ����
      18: Result := $000D;//��ʱ��ʻ����
      50:
        begin
          if areaType = 2 then
          begin//����
            if ioFlag = 1 then//����ָ�����򱨾�
              Result := $0004
            else if ioFlag = 2 then//�뿪ָ�����򱨾�
              Result := $0005;
          end
          else if areaType = 1 then
          begin//·��
            if ioFlag = 2 then
              Result := $0008;//��·��(Խ�籨��)
          end;  
        end;
      23: Result := $000B;//·��ƫ�뱨��
      26: Result := $0009;//������������
      28: Result := $000C;//�����Ƿ�λ�Ʊ���
    end;
  end;
var
  tip: string;
  dev: TDevice;
  strRet: string;
  i: Integer;
begin
  if MessageBox(Handle, '��ȷ�ϵ�ǰ������Ϣ��', 'ȷ��', MB_YESNO + MB_ICONQUESTION) = IdYes then
  begin
    strRet := Bs.AddNewAlarmDeal(devId, alarmType, alarmGpsTime, 0, FormatDateTime('yyyy-MM-dd hh:nn:ss', Now), GetAlarmType_PT(alarmType));
    if strRet = '-1' then
    begin
      MessageBox(Handle, '������Ϣȷ�ϱ���ʧ�ܣ���ȷ�������ݿ�����������', '��ʾ', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
    i := Pos('|', strRet);
    if i > 0 then
    begin
      tip := Copy(strRet, i + 1, Length(strRet) - i);
      if MessageBox(Handle, PChar(tip + #13#10 + '��ȷ���޸���'), 'ȷ��', MB_YESNO + MB_ICONINFORMATION) = IdNo then
        Exit
      else
        strRet := Copy(strRet, 1, i - 1);
    end;
    if (curDev <> nil) and (alarmType = 0) then
    begin
      DataServer.SendEmergencyAlarmDeal(curDev, 0);
    end;
    currAlarmInfo.AlarmDealId := StrToInt(strRet);
    currStatus := 0;
    Notebook1.PageIndex := 1;
    SetCaption;
  end;
end;

procedure TfrmDealDevAlarmInfo.RzButton2Click(Sender: TObject);
var
  strSql: string;
begin
  if MessageBox(Handle, '��ȷ�ϱ�����Ϣ�Ѵ�����ϲ����еǼ���', 'ȷ��', MB_YESNO + MB_ICONQUESTION) = IdYes then
  begin
    if Bs.ModifyAlarmDeal_DealOk(currAlarmInfo.AlarmDealId, 1, FormatDateTime('yyyy-MM-dd hh:nn:ss', Now)) then
    begin
      currStatus := 1;
      Notebook1.PageIndex := 2;
      SetCaption;
    end
    else
    begin
      MessageBox(Handle, '������Ϣ���ñ���ʧ�ܣ���ȷ�������ݿ�����������', '��ʾ', MB_OK + MB_ICONINFORMATION);
    end;
  end;
end;

procedure TfrmDealDevAlarmInfo.RzButton3Click(Sender: TObject);
var
  strSql: string;
begin
  if Trim(edtAlarmPos.Text) = '' then
  begin
    MessageBox(Handle, '�����뱨���ص�', '��ʾ', MB_OK + MB_ICONINFORMATION);
    edtAlarmPos.SetFocus;
    Exit;
  end;

  if Trim(memoAlarmDealProc.Text) = '' then
  begin
    MessageBox(Handle, '�����뱨����Ϣ�������', '��ʾ', MB_OK + MB_ICONINFORMATION);
    memoAlarmDealProc.SetFocus;
    Exit;
  end;

  if Trim(memoAlarmDealResult.Text) = '' then
  begin
    MessageBox(Handle, '�����뱨����Ϣ������', '��ʾ', MB_OK + MB_ICONINFORMATION);
    memoAlarmDealResult.SetFocus;
    Exit;
  end;
  if MessageBox(Handle, '��ȷ�ϱ�����Ϣ�Ѵ�����ϲ����еǼ���', 'ȷ��', MB_YESNO + MB_ICONQUESTION) = IdYes then
  begin
    if Bs.ModifyAlarmDeal_DealEnd(currAlarmInfo.AlarmDealId, 2, FormatDateTime('yyyy-MM-dd hh:nnss', Now), Trim(edtAlarmPerson.Text),
                                  Trim(edtAlarmTel.Text), Trim(edtAlarmPos.Text), Trim(memoAlarmDealProc.Text), Trim(memoAlarmDealResult.Text)) then
    begin
      currStatus := 2;
      ModalResult := mrOk;
      SetCaption;
    end
    else
    begin
      MessageBox(Handle, '������Ϣ���ñ���ʧ�ܣ���ȷ�������ݿ�����������', '��ʾ', MB_OK + MB_ICONINFORMATION);
    end;
  end;

end;

procedure TfrmDealDevAlarmInfo.SetCaption;
begin
  if currStatus < 0 then
  begin
    Caption := '������Ϣ����(����δȷ��)';
  end
  else if currStatus = 0 then
  begin
    Caption := '������Ϣ����(������ȷ��,�ȴ�����)';
  end
  else if currStatus = 1 then
  begin
    Caption := '������Ϣ����(�����Ѵ���δ�Ǽ�)';
  end;  
end;

procedure TfrmDealDevAlarmInfo.FormShow(Sender: TObject);
begin
  SetCaption;
  curDev := ADeviceManage.find(devId);
  if not (alarmType in [0, 3, 20..22, 27, 28]) then
  begin
    CheckBox3.Visible := False;
    btnRemoveAlarm.Visible := False;
  end;
end;

procedure TfrmDealDevAlarmInfo.btnMonitorCarClick(Sender: TObject);
var
  dlg: TfrmMonitorCar;
  dev: TDevice;
begin
  dev := ADeviceManage.find(devId);
  if dev = nil then
  begin
    MessageBox(Handle, '�޷��ҵ���ǰ��������Ϣ���޷����м���', '��ʾ', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  dlg := TfrmMonitorCar.Create(Self);
  try
    dlg.dev := dev;
    dlg.edtTel.Text := GlobalParam.CallBackTel;
    dlg.ShowModal;
  finally
    dlg.Free;
  end;
end;

procedure TfrmDealDevAlarmInfo.btnTakePhotoClick(Sender: TObject);
var
  dlg: TGetAPictureFrm;
  dev: TDevice;
begin
  dev := ADeviceManage.find(devId);
  if dev = nil then
  begin
    MessageBox(Handle, '�޷��ҵ���ǰ��������Ϣ���޷���������', '��ʾ', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  dlg := TGetAPictureFrm.Create(self);
  try
    with dlg.ListView1.Items.Add do
    begin
      caption := dev.Car.No;
      data := dev;
    end;
    dlg.Panel1.Enabled := False;
    dlg.ComboBoxCamera.Enabled := False;
    dlg.ComboBoxCameraCmd.Enabled := False;
    dlg.Panel5.Enabled := False;
    dlg.ShowModal;
  finally
    dlg.Free;
  end;
end;

procedure TfrmDealDevAlarmInfo.btnSendTextClick(Sender: TObject);
var
  dlg: TGetAPictureFrm;
  dev: TDevice;
begin
  dev := ADeviceManage.find(devId);
  if dev = nil then
  begin
    MessageBox(Handle, '�޷��ҵ���ǰ��������Ϣ���޷������ı���Ϣ�·�', '��ʾ', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  if Trim(memoText.Text) <> '' then
  begin
    if DataServer.SendControlInfo_Alarm_V3(-1, dev, Trim(memoText.Text), Length(Trim(memoText.Text)), $0C) then
    begin
      if currAlarmInfo <> nil then
        currAlarmInfo.SendTextCmdStatus := 1;
      MessageBox(Handle, '�ı���Ϣ�·��ɹ�', '��ʾ', MB_OK + MB_ICONINFORMATION);
    end;
  end
  else
  begin
    MessageBox(Handle, '������Ҫ�·����ı���Ϣ����', '��ʾ', MB_OK + MB_ICONINFORMATION);
  end;
end;

procedure TfrmDealDevAlarmInfo.btnRemoveAlarmClick(Sender: TObject);
begin
  if curDev <> nil then
  begin
    if not curDev.Switch_Warning[0] then
    begin
      MessageBox(Handle, '��ǰ��δ���ڽ�������״̬����ȷ��', '��ʾ', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;  
    if MessageBox(Handle, '��ȷ�Ͻ���ó��Ľ���������', 'ȷ��', MB_YESNO + MB_ICONQUESTION) = IdYes then
    begin
      DataServer.SendEmergencyAlarmDeal(curDev, 1);
      if currAlarmInfo <> nil then
        currAlarmInfo.SendRemoveAlarmCmdStatus := 1;
    end;
  end
  else
  begin
    MessageBox(Handle, '�޷��ҵ��ó�����Ϣ���޷���������ȷ��', '��ʾ', MB_OK + MB_ICONINFORMATION);
  end;  
end;

end.
