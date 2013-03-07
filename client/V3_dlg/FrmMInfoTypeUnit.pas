unit FrmMInfoTypeUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzButton, ExtCtrls;

type
  TfrmMInfoType = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtTypeNo: TEdit;
    edtTypeName: TEdit;
    edtTypeMemo: TMemo;
    edtTypeId: TEdit;
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure edtTypeNoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation
uses
  umainf, uGloabVar, CarUnit;

{$R *.dfm}

procedure TfrmMInfoType.RzBitBtn1Click(Sender: TObject);
var
  infoType: TInfoType;
begin
  if Trim(edtTypeNo.Text) = '' then
  begin
    ShowTips('��������Ϣ���ͱ��', edtTypeNo);
    edtTypeNo.SetFocus;
    Exit;
  end;
  if Trim(edtTypeName.Text) = '' then
  begin
    ShowTips('��������Ϣ��������', edtTypeName);
    edtTypeName.SetFocus;
    Exit;
  end;
  if StrToInt(edtTypeNo.Text) > 255 then
  begin
    ShowTips('���ͱ�Ų��ܴ���255������������', edtTypeNo);
    edtTypeNo.SetFocus;
    Exit;
  end;  
  infoType := FInfoTypeManage.FindInfoTypeByTypeId(StrToInt(edtTypeNo.Text));
  if (infoType <> nil) and (IntToStr(infoType.Id) <> edtTypeId.Text) then
  begin
    ShowTips('����Ϣ���ͱ�����������ͱ���ظ�������������', edtTypeNo);
    edtTypeNo.SetFocus;
    Exit;
  end;
  infoType := FInfoTypeManage.FindInfoTypeByTypeName(Trim(edtTypeName.Text));
  if (infoType <> nil) and (IntToStr(infoType.Id) <> edtTypeId.Text) then
  begin
    ShowTips('����Ϣ�����������������������ظ�������������', edtTypeName);
    edtTypeName.SetFocus;
    Exit;
  end;
  ModalResult := mrOk;
end;

procedure TfrmMInfoType.RzBitBtn2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmMInfoType.edtTypeNoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

end.
