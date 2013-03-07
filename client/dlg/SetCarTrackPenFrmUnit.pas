unit SetCarTrackPenFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TSetCarTrackPenFrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ColorDialog1: TColorDialog;
    Shape1: TShape;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    EditLineWidth: TEdit;
    Panel3: TPanel;
    BitBtnOk: TBitBtn;
    BitBtnCancel: TBitBtn;
    RadioButtonSolid: TRadioButton;
    RadioButtonDot: TRadioButton;
    Label3: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtnOkClick(Sender: TObject);
    procedure EditLineWidthKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SetCarTrackPenFrm: TSetCarTrackPenFrm;

implementation

{$R *.dfm}

procedure TSetCarTrackPenFrm.SpeedButton1Click(Sender: TObject);
var
  colorDialog1:TColorDialog;
begin
  try
    colorDialog1:= TColorDialog.Create(nil);
    if colorDialog1.Execute then
      Shape1.Brush.Color :=colorDialog1.Color;
  finally
    colorDialog1.Free;
  end;
end;

procedure TSetCarTrackPenFrm.BitBtnOkClick(Sender: TObject);
var
  t : Integer;
begin
  t := StrToInt(EditLineWidth.Text);
  if not (t in [1..10]) then
  begin
    MessageBox(Handle,'请您输入1到10之间的数','提示',MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  ModalResult := mrOk;
end;

procedure TSetCarTrackPenFrm.EditLineWidthKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then
    key := #0;
end;

end.
