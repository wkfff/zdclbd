unit uconnect_set;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, DBClient, MConnect,
  SConnect;

type
  Tconnect_set = class(TForm)
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit3: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
   
  private
    { Private declarations }
  public
    { Public declarations }    
  end;

var
  connect_set: Tconnect_set;        
  
implementation

{$R *.dfm}

procedure Tconnect_set.BitBtn1Click(Sender: TObject);
begin

(*
  try
    bs.Socket.Connected := false;

    statusbar1.panels[0].text := '正在连接应用程序服务器，请稍候..';
    statusbar1.refresh;
    Screen.cursor := crHourGlass;
    bs.Socket.Connected := false;
    bs.Socket.Host := edit1.Text ;
    bs.Socket.Port := strtoint(edit3.text);
  except
    MessageBox(0,'连接失败', '提示', mb_iconinformation + mb_defbutton1);
    statusbar1.panels[0].text := '连接失败，请重试..';
    statusbar1.refresh;
    exit;
  end;
*)
end;

procedure Tconnect_set.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then
  begin
    key:=#0;
    showmessage('请输入数字！');
  end;
end;

end.





