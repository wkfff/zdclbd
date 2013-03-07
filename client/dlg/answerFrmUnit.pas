unit answerFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TanswerFrm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    editAnswer: TEdit;
    btnOK: TBitBtn;
    btnNext: TBitBtn;
    btnCancel: TBitBtn;
    procedure btnOKClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  answerFrm: TanswerFrm;

implementation
uses sendQuestionFrmUnit;
{$R *.dfm}

procedure TanswerFrm.btnOKClick(Sender: TObject);
begin
  if Trim(editAnswer.Text) = '' then
  begin
    messagebox(handle,'您没有输入候选答案！','提示',mb_ok + mb_iconinformation);
    editAnswer.SetFocus;
    Exit;
  end;
  ModalResult := mrOk;
  
end;

procedure TanswerFrm.btnNextClick(Sender: TObject);
var
  i: integer;
begin
  if Trim(editAnswer.Text) = '' then
  begin
    messagebox(handle,'您没有输入候选答案！','提示',mb_ok + mb_iconinformation);
    editAnswer.SetFocus;
    Exit;
  end;
  i := 0;
//  With sendQuestionFrm do
//  begin
//    with cxDevAnswerList.Add do
//    begin
//      Values[0]:= i+1;//序号
//      Values[1]:= editAnswer.text;
//    end;
//  end;

  editAnswer.Text := '';
  
end;

end.
