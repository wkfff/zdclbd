unit FrmSetCarRunStatePlanUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, ComCtrls, RzDTP, StdCtrls, RzEdit, Mask, ExtCtrls,
  RzPanel;

type
  TfrmSetCarRunStataePlan = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    edtCarNo: TRzEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtsAddr: TRzEdit;
    edteAddr: TRzEdit;
    RzMemo1: TRzMemo;
    sDate: TRzDateTimePicker;
    sTime: TRzDateTimePicker;
    eDate: TRzDateTimePicker;
    eTime: TRzDateTimePicker;
    Label7: TLabel;
    Label9: TLabel;
    RzBitBtn1: TRzBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FCurrDevId: string;
    FId: Integer;
  end;

implementation
uses
  uGloabVar, DateUtils;

{$R *.dfm}

procedure TfrmSetCarRunStataePlan.FormCreate(Sender: TObject);
var
  d: TDateTime;
  hour, minute: Integer;
  time: TDateTime;
begin
  FId := -1;
  d := Now;
  hour := HourOfTheDay(d);
  minute := MinuteOfTheHour(d);
  if minute > 30 then
  begin
    minute := 0;
    time := EncodeTime(hour, minute, 0, 0);
    ReplaceTime(d, time);
    d := IncHour(d);
  end
  else
  begin
    minute := 30;
    time := EncodeTime(hour, minute, 0, 0);
    ReplaceTime(d, time);
  end;

  sDate.Date := d;
  sTime.Time := d;

  d := IncHour(d, 4);
  eDate.Date := d;
  eTime.Time := d;
end;

procedure TfrmSetCarRunStataePlan.RzBitBtn1Click(Sender: TObject);
var
  sDevId: string;
  dtS, dtE: TDateTime;
  sAddr, eAddr: string;
  sMemo: string;
begin
  if FCurrDevId = '' then
  begin
    MessageBox(Handle, '��ǰ��ѡ�г�������رպ�ѡ����������', '��ʾ', MB_OK);
    Exit;
  end;

  dtS := sdate.Date;
  ReplaceTime(dtS, sTime.Time);
  dtE := eDate.Date;
  ReplaceTime(dtE, eTime.Time);

  if (dtS > dtE) then
  begin
    FGlobalTip.ShowHint('����ʱ�䲻��С��ʼ��ʱ�䣬������ѡ��ʱ��', sTime);
    Exit;
  end;  

  sAddr := Trim(edtsAddr.Text);
  eAddr := Trim(edteAddr.Text);

  if (sAddr = '') then
  begin
    FGlobalTip.ShowHint('������ʼ����', edtsAddr);
    Exit;
  end;
  if (eAddr = '') then
  begin
    FGlobalTip.ShowHint('������Ŀ�ĵ�', edteAddr);
    Exit;
  end;

  sMemo := Trim(RzMemo1.Text);

  if FId <= 0 then
  begin
    if Bs.AddSetCarRunStatePlan(FCurrDevId, dtS, dtE, sAddr, eAddr, sMemo, current_user.UserName) then
    begin
      MessageBox(Handle, '����ɹ�', '��ʾ', MB_OK + MB_ICONINFORMATION);
      ModalResult := mrOk;
    end
    else
    begin
      MessageBox(Handle, '����ʧ�ܣ���ȷ�����ݿ���������', '��ʾ', MB_OK);
    end;
  end
  else
  begin
    if Bs.ModifySetCarRunStatePlan(FId, FCurrDevId, dtS, dtE, sAddr, eAddr, sMemo, current_user.UserName) then
    begin
      MessageBox(Handle, '����ɹ�', '��ʾ', MB_OK + MB_ICONINFORMATION);
      ModalResult := mrOk;
    end
    else
    begin
      MessageBox(Handle, '����ʧ�ܣ���ȷ�����ݿ���������', '��ʾ', MB_OK);
    end;
  end;
end;

procedure TfrmSetCarRunStataePlan.FormShow(Sender: TObject);
begin
  if FId > 0 then
  begin
    Caption := '�޸ĳ����������мƻ�';
  end;  
  edtsAddr.SetFocus;
end;

end.
