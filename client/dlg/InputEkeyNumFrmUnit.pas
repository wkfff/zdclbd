unit InputEkeyNumFrmUnit;

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
  private
    { Private declarations }
    FIDeNum:string;
  public
    { Public declarations }
  end;

var
  FrmInputEkeyNum: TFrmInputEkeyNum;

implementation
  uses ugloabVar,mwEkeyUnit;

{$R *.dfm}

procedure TFrmInputEkeyNum.BitBtn1Click(Sender: TObject);
var
  str1:string;
  rdata:array[0..31] of byte;
  i:integer;
begin
  if length(trim(EditEKeyNum.Text))<> 32 then
  begin
    messagebox(handle,'��������32λ�ĺ���!','��ʾ',mb_ok + mb_iconinformation);
    EditEKeyNum.SetFocus;
    exit;
  end;
  
  GEkey.InitEKey;
  str1 := GEkey.ReadData;  
  if str1<> trim(EditEKeyNum.Text) then
  begin
    messagebox(handle,pchar('������ĺ������������'+EKey_NAME+'����Ӧ�������������룡'),'��ʾ',mb_ok + mb_iconinformation);
    EditEKeyNum.SetFocus;
    exit;
  end;
  ModalResult := mrOk;
end;

procedure TFrmInputEkeyNum.FormCreate(Sender: TObject);
begin
  label1.Caption := '��ʹ�ñ�����Ĺ����У���������'+ EKey_NAME+'��';
  label2.Caption := '����������'+EKey_NAME+'����д���룺';
end;

end.
