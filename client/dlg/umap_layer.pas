unit umap_layer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  Tmap_layer = class(TForm)
    Panel1: TPanel;
    ListBox1: TListBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    OpenDialog1: TOpenDialog;
    Label1: TLabel;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  map_layer: Tmap_layer;

implementation

{$R *.dfm}

procedure Tmap_layer.BitBtn1Click(Sender: TObject);
var isSelect :boolean;
    i:Integer;
begin
  if bitbtn1.Caption ='��ͼ��' then  //----------��ͼ��
  begin
    OpenDialog1.InitialDir := '..\map\';
    if OpenDialog1.Execute then
    begin
      ModalResult := mrOk;
    end;
  end
  else                           //---------ɾ��ͼ��
  begin
    isSelect:= false;
    for i:=0 to listbox1.Count -1 do
      isSelect := isSelect or listbox1.Selected[i];
    if not isSelect then
    begin
      messagebox(handle,'��ѡ��Ҫɾ����ͼ��!','��ʾ',mb_ok + mb_iconinformation);
      exit;
    end;
    ModalResult := mrOk;
  end;
end;

end.
