unit RcvDevUploadPicTimesInfoFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxInplaceContainer, cxControls, StdCtrls, Buttons, ComCtrls,
  CarUnit, cxSplitter;

type
  TRcvDevUploadPicTimesInfoFrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxTreeListRcvDevUploadPicTimesInfo: TcxTreeList;
    cxTreeList1cxTreeListColumn1: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn2: TcxTreeListColumn;
    GroupBox1: TGroupBox;
    DateTimePickerToDate: TDateTimePicker;
    DateTimePickerToTime: TDateTimePicker;
    Label2: TLabel;
    ComboBoxReadType: TComboBox;
    BitBtnReadThePic: TBitBtn;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    Panel3: TPanel;
    Label1: TLabel;
    RadioButtonAllPic: TRadioButton;
    RadioButtonOnePic: TRadioButton;
    Panel4: TPanel;
    Label3: TLabel;
    EditCarNo: TEdit;
    LabelNoPic: TLabel;
    cxSplitter1: TcxSplitter;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnReadThePicClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    procedure AddALineToCxTreeList(Value0, Value1: String);
    { Private declarations }
  private
    FReadDev:TDevice;
    FNoPicBj:Boolean;                  //����Ƭ =True
    FFirstDateTime:String;
    FLastDateTime:String;
    FPicCount_UnKnowType:Byte;         //���Բ�������Ƭ����
    FPicCount_OpenFrontDoor:Byte;      //��ǰ��
    FPicCount_CloseFrontDoor:Byte;     //��ǰ��
    FPicCount_OpenBackDoor:Byte;       //������
    FPicCount_CloseBackDoor:Byte;      //�غ���
    FPicCount_SrvAsk:Byte;             //��������Ҫ��
    FPicCount_ChangeToEmpty:Byte;      // ��ճ�
    FPicCount_ChangeToFull:Byte;       //���س�
    FPicCount_EmergentAlarm:Byte;     //����������Ƭ����
    FPicCount_CutAntennaAlarm:Byte;   // �����жϱ���
    FPicCount_OverSpeed:Byte; //������Ƭ����
    FPicCount_Fatigue:Byte;   //ƣ����Ƭ����

    procedure ShowPicInfo;
  public
    procedure SetReadInfo(ADev: TDevice; ANoPicBj: Boolean;
      AFirstDateTime, ALastDateTime: String; ABuf: PByte;ABufCount: Integer);
  end;

var
  RcvDevUploadPicTimesInfoFrm: TRcvDevUploadPicTimesInfoFrm;

implementation
uses uGloabVar;
{$R *.dfm}

{ TRcvDevUploadPicTimesInfoFrm }

procedure TRcvDevUploadPicTimesInfoFrm.ShowPicInfo;
begin
  cxTreeListRcvDevUploadPicTimesInfo.BeginUpdate;
  try
    cxTreeListRcvDevUploadPicTimesInfo.Clear;
    if FNoPicBj then       //����Ƭ
    begin
      LabelNoPic.Visible := True;
      BitBtnReadThePic.Enabled := False;
      exit;
    end;
    try
      DateTimePickerToDate.Date := StrToDateTime(FLastDateTime);
    except
      DateTimePickerToDate.Date := Date;
    end;
    try
      DateTimePickerToTime.Time := StrToDateTime(FLastDateTime);
    except
      DateTimePickerToTime.Time := Time;
    end;

    cxTreeListRcvDevUploadPicTimesInfo.Clear;
    AddALineToCxTreeList('��Ƭ��ʼʱ�䣺',FFirstDateTime);
    AddALineToCxTreeList('��Ƭ����ʱ�䣺',FLastDateTime);
    AddALineToCxTreeList('���Բ�������Ƭ��',IntToStr(FPicCount_UnKnowType)+'��');
    AddALineToCxTreeList('��ǰ�ţ�',IntToStr(FPicCount_OpenFrontDoor)+'��');
    AddALineToCxTreeList('��ǰ�ţ�',IntToStr(FPicCount_CloseFrontDoor)+'��');
    AddALineToCxTreeList('�����ţ�',IntToStr(FPicCount_OpenBackDoor)+'��');
    AddALineToCxTreeList('�غ��ţ�',IntToStr(FPicCount_CloseBackDoor)+'��');
    AddALineToCxTreeList('��������Ҫ��',IntToStr(FPicCount_SrvAsk)+'��');
    AddALineToCxTreeList('��ճ���',IntToStr(FPicCount_ChangeToEmpty)+'��');
    AddALineToCxTreeList('���س���',IntToStr(FPicCount_ChangeToFull)+'��');
    AddALineToCxTreeList('����������',IntToStr(FPicCount_EmergentAlarm)+'��');
    AddALineToCxTreeList('�����жϱ�����',IntToStr(FPicCount_CutAntennaAlarm)+'��');
    AddALineToCxTreeList('���٣�',IntToStr(FPicCount_OverSpeed)+'��');
    AddALineToCxTreeList('ƣ�ͣ�',IntToStr(FPicCount_Fatigue)+'��');
  finally
    cxTreeListRcvDevUploadPicTimesInfo.EndUpdate;
  end;
end;


procedure TRcvDevUploadPicTimesInfoFrm.AddALineToCxTreeList(Value0,Value1:String);
begin
  with cxTreeListRcvDevUploadPicTimesInfo.Add do
    begin
      Values[0] := Value0;
      Values[1] := Value1;
    end;
end;

procedure TRcvDevUploadPicTimesInfoFrm.FormCreate(Sender: TObject);
begin
  LabelNoPic.Visible :=False;
  DateTimePickerToDate.Date := Date;
  DateTimePickerToTime.Time := Time;
  ComboBoxReadType.ItemIndex := -1;
  ComboBoxReadType.Text := '';
end;

procedure TRcvDevUploadPicTimesInfoFrm.SetReadInfo(ADev: TDevice;
  ANoPicBj: Boolean; AFirstDateTime, ALastDateTime: String; ABuf: PByte;
  ABufCount: Integer);
var
  buf:array of byte;
begin
  FReadDev:= ADev;
  EditCarNo.Text := ADev.Car.No;
  FNoPicBj := ANoPicBj;
  try
    FFirstDateTime := AFirstDateTime;
  except
  end;
  try
    FLastDateTime := ALastDateTime;
  except
  end;
  SetLength(buf,ABufCount);
  CopyMemory(@buf[0],Abuf,ABufCount);
  if ABufCount>=12 then
  begin
    FPicCount_UnKnowType:= buf[0];         //���Բ�������Ƭ����
    FPicCount_OpenFrontDoor:= buf[1];      //��ǰ��
    FPicCount_CloseFrontDoor:= buf[2];     //��ǰ��
    FPicCount_OpenBackDoor:= buf[3];       //������
    FPicCount_CloseBackDoor:= buf[4];      //�غ���
    FPicCount_SrvAsk:= buf[5];             //��������Ҫ��
    FPicCount_ChangeToEmpty:= buf[6];      // ��ճ�
    FPicCount_ChangeToFull:= buf[7];       //���س�
    FPicCount_EmergentAlarm:= buf[8];     //����������Ƭ����
    FPicCount_CutAntennaAlarm:= buf[9];   // �����жϱ���
    FPicCount_OverSpeed:= buf[10];        //������Ƭ����
    FPicCount_Fatigue:= buf[11];         //ƣ����Ƭ����
  end;

  ShowPicInfo;
end;

procedure TRcvDevUploadPicTimesInfoFrm.BitBtnReadThePicClick(
  Sender: TObject);
begin
  if ComboBoxReadType.Text ='' then
  begin
    MessageBox(Handle,'����ѡ��Ҫ��ȡ����Ƭ���ͣ�','��ʾ',MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  ModalResult := mrok;
end;

procedure TRcvDevUploadPicTimesInfoFrm.BitBtn2Click(Sender: TObject);
begin
  close;
end;

end.
