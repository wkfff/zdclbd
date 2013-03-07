unit UserDefinedTextFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ImgList, ComCtrls;

type
  TUserDefinedTextForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    EditName: TLabeledEdit;
    EditX: TLabeledEdit;
    EditY: TLabeledEdit;
    BitBtnOK: TBitBtn;
    BitBtnClose: TBitBtn;
    EditFont: TLabeledEdit;
    EditType: TLabeledEdit;
    ButtonFont: TButton;
    FontDialog1: TFontDialog;
    BitBtnDel: TBitBtn;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Label5: TLabel;
    Edit3: TEdit;
    editIDStr: TEdit;
    procedure ButtonFontClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtnDelClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    Font:TFont;
    //Point:TPoint;
    { Public declarations }
  end;

var
  UserDefinedTextForm: TUserDefinedTextForm;

implementation

{$R *.dfm}

procedure TUserDefinedTextForm.ButtonFontClick(Sender: TObject);
begin
  if FontDialog1.Execute then
  begin
    Font:=FontDialog1.Font;
    EditFont.Text:=FontDialog1.Font.Name+','+IntToStr(FontDialog1.Font.Size);
  end;
end;

procedure TUserDefinedTextForm.FormCreate(Sender: TObject);
begin
  Font:=FontDialog1.Font;
end;

procedure TUserDefinedTextForm.BitBtnDelClick(Sender: TObject);
begin
  EditName.Text:='';
  Self.ModalResult:=MrOK;
end;

procedure TUserDefinedTextForm.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    GroupBox1.Enabled:=true;
    Edit1.Color:=clWindow;
  end
  else
  begin
    GroupBox1.Enabled:=false;
    Edit1.Color:=clBtnFace;
  end;
  Edit2.Color:=Edit1.Color;
end;

procedure TUserDefinedTextForm.Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
     if not (key in['0'..'9',#8,'.']) then key:=#0;
end;

end.
