unit FrmMInfoUtit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzButton, ExtCtrls, ComCtrls;

type
  TfrmMInfo = class(TForm)
    Panel2: TPanel;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtMemo: TMemo;
    edtInfoId: TEdit;
    cbxInfoType: TComboBox;
    edtContent: TMemo;
    Label4: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sendTime: string;
  end;

implementation
uses
  CarUnit, uGloabVar;

{$R *.dfm}

procedure TfrmMInfo.RzBitBtn1Click(Sender: TObject);
var
  t: TDateTime;
begin
  if cbxInfoType.ItemIndex < 0 then
  begin
    ShowTips('请选择信息类型', cbxInfoType);
    cbxInfoType.SetFocus;
    Exit;
  end;
  t := DateTimePicker1.DateTime;
  ReplaceTime(t, DateTimePicker2.Time);
  if t < Now then
  begin
    ShowTips('发送时间不能在当前时间之前，请重新选择时间', DateTimePicker2);
    DateTimePicker2.SetFocus;
    Exit;
  end;
  if Trim(edtContent.Text) = '' then
  begin
    ShowTips('请输入信息内容', edtContent);
    edtContent.SetFocus;
    Exit;
  end;
  sendTime := FormatDateTime('yyyy-MM-dd hh:nn:ss', t);
  ModalResult := mrOk;
end;

procedure TfrmMInfo.RzBitBtn2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmMInfo.FormCreate(Sender: TObject);
var
  i: Integer;
  infoType: TInfoType;
begin
  cbxInfoType.Clear;
  for i := 0 to FInfoTypeManage.Count - 1 do
  begin
    infoType := FInfoTypeManage.Items[i];
    cbxInfoType.AddItem(infoType.InfoTypeName, infoType);
  end;
  cbxInfoType.ItemIndex := 0;
end;

end.
