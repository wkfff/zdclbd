unit SelectDirFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, RzTreeVw, RzFilSys, StdCtrls, Mask, RzEdit,
  RzButton, RzPanel;

type
  TSelectDirFrm = class(TForm)
    RzEdit1: TRzEdit;
    RzDirectoryTree1: TRzDirectoryTree;
    Panel2: TPanel;
    BitBtnPlay: TRzBitBtn;
    BitBtnPause: TRzBitBtn;
    procedure RzDirectoryTree1Click(Sender: TObject);
    procedure BitBtnPlayClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RzEdit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelectDirFrm: TSelectDirFrm;

implementation

uses StrUtils;

{$R *.dfm}

procedure TSelectDirFrm.RzDirectoryTree1Click(Sender: TObject);
begin
  RzEdit1.Text := RzDirectoryTree1.Directory;
  if RightStr(RzEdit1.Text,1)<>'\'then
    RzEdit1.Text := RzEdit1.Text +'\';
end;

procedure TSelectDirFrm.BitBtnPlayClick(Sender: TObject);
begin
  if Trim(RzEdit1.Text)<>'' then
    ModalResult := mrok;
end;

procedure TSelectDirFrm.FormCreate(Sender: TObject);
begin
  RzEdit1.Text := '';
end;

procedure TSelectDirFrm.RzEdit1Change(Sender: TObject);
begin
  try
    if (RzEdit1.Text <> RzDirectoryTree1.Directory) and (Trim(RzEdit1.Text)<>'') then
      RzDirectoryTree1.Directory := RzEdit1.Text;
  except
  end;
end;

end.
