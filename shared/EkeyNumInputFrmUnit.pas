unit EkeyNumInputFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFrmInputEkeyNum = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    EditEKeyNum: TEdit;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmInputEkeyNum: TFrmInputEkeyNum;

implementation
uses mwEkeyUnit;

{$R *.dfm}

procedure TFrmInputEkeyNum.BitBtn1Click(Sender: TObject);
var
  str1: string;
  ekey: TmwEkey;
begin
  if length(trim(EditEKeyNum.Text)) <> 32 then
  begin
    messagebox(handle, '��������32λ�ĺ���!', '��ʾ', mb_ok + mb_iconinformation);
    EditEKeyNum.SetFocus;
    exit;
  end;

  ekey := TmwEkey.Create;
  try
    ekey.InitEKey;
    str1 := ekey.ReadData;
    if str1 <> trim(EditEKeyNum.Text) then
    begin
      messagebox(handle, pchar('������ĺ������������' + EKey_NAME + '����Ӧ�������������룡'), '��ʾ', mb_ok + mb_iconinformation);
      EditEKeyNum.SetFocus;
      exit;
    end;
    ModalResult := mrOk;
  finally
    FreeAndNil(ekey);
  end;
end;

procedure TFrmInputEkeyNum.FormCreate(Sender: TObject);
begin
  label1.Caption := '��ʹ�ñ�����Ĺ����У���������' + EKey_NAME + '��';
  label2.Caption := '����������' + EKey_NAME + '����д���룺';
end;

procedure TFrmInputEkeyNum.BitBtn2Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
