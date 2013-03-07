unit uSet_SendToDTE_Data;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  Tset_SendToDTE_Data = class(TForm)
    Panel_Basic: TPanel;
    Label1: TLabel;
    Memo1: TMemo;
    Panel3: TPanel;
    ListView1: TListView;
    Panel4: TPanel;
    Panel6: TPanel;
    BitBtn3: TBitBtn;
    Splitter1: TSplitter;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  set_SendToDTE_Data: Tset_SendToDTE_Data;

implementation

{$R *.dfm}

procedure Tset_SendToDTE_Data.BitBtn1Click(Sender: TObject);
begin
  if trim(memo1.Lines.Text)='' then
  begin
    messagebox(handle,'请输入数据!','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  ModalResult := mrOk;
end;

procedure Tset_SendToDTE_Data.BitBtn3Click(Sender: TObject);
begin
  if ListView1.Selected =nil then exit;
  if ListView1.Items.Count =1 then 
  begin
    messagebox(handle,'只有一辆车了，不能删除！','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  ListView1.DeleteSelected ;
end;

end.
