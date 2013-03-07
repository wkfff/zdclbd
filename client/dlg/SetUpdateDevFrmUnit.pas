unit SetUpdateDevFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TSetUpdateDevFrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel5: TPanel;
    Memo1: TMemo;
    Panel6: TPanel;
    Panel4: TPanel;
    RadioGroup1: TRadioGroup;
    Panel3: TPanel;
    Panel7: TPanel;
    BitBtnOk: TBitBtn;
    BitBtnCancel: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitBtnCancelClick(Sender: TObject);
    procedure BitBtnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ReplaceStr(s, oldstr, newstr: string): string;
  end;

var
  SetUpdateDevFrm: TSetUpdateDevFrm;

implementation
     uses uGloabVar ;
{$R *.dfm}

procedure TSetUpdateDevFrm.FormShow(Sender: TObject);
begin
  memo1.Text:='';
end;

procedure TSetUpdateDevFrm.BitBtnCancelClick(Sender: TObject);
begin
 Close;
end;

procedure TSetUpdateDevFrm.BitBtnOkClick(Sender: TObject);
var
  URL:string;
  Len:integer;
begin
  URL:=Memo1.Text;
  url := ReplaceStr(url,'：',':');
  Len:=length(URL);
  if Len =0 then
  begin
     messagebox(handle,'升级地址不能为空!','提示',mb_ok + mb_iconinformation);
     exit;
  end;
  if (copy(url,1,1)<>':') or (copy(url,len,1)<>':')then
  begin
    MessageBox(Handle,'请在升级地址的前后输入":"','提示',MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  if RadioGroup1.ItemIndex<0 then
  begin
     messagebox(handle,'请选择一个升级类型!','提示',mb_ok + mb_iconinformation);
     exit;
  end;
  Memo1.Text := url;
  //DataServer.UpdateDevFirmware(GCurSelectDev.Id,RadioGroup1.ItemIndex,URL,Len);
  //Close;
  modalResult := mrok;
end;

function TSetUpdateDevFrm.ReplaceStr(s,oldstr,newstr:string):string;
var
  strlen,oldlen:integer;
  strpos:integer;
  str1,str2:string;
begin   
  strlen:=length(s);   
  oldlen:=length(oldStr);
  strPos:=pos(oldstr,s);
  while strpos>0 do
  begin
    str1:=copy(s,1,strPos-1);
    str2:=copy(s,strpos+oldlen,strlen-strpos-oldlen+1);
    s:=str1+newstr+str2;
    strPos:=pos(oldstr,s);
  end;
  result := s;
end;


end.
