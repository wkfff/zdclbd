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
    messagebox(handle, '请您输入32位的号码!', '提示', mb_ok + mb_iconinformation);
    EditEKeyNum.SetFocus;
    exit;
  end;

  ekey := TmwEkey.Create;
  try
    ekey.InitEKey;
    str1 := ekey.ReadData;
    if str1 <> trim(EditEKeyNum.Text) then
    begin
      messagebox(handle, pchar('您输入的号码与所插入的' + EKey_NAME + '不对应，请您重新输入！'), '提示', mb_ok + mb_iconinformation);
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
  label1.Caption := '在使用本软件的过程中，请您插入' + EKey_NAME + '！';
  label2.Caption := '请输入您的' + EKey_NAME + '上所写号码：';
end;

procedure TFrmInputEkeyNum.BitBtn2Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
