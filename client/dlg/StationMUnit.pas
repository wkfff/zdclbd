unit StationMUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, Buttons, ExtDlgs;

type
  TStationMFrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    StationNameEdit: TEdit;
    Label2: TLabel;
    Panel4: TPanel;
    Label4: TLabel;
    Image1Name: TEdit;
    Label6: TLabel;
    Image2Name: TEdit;
    GroupBox1: TGroupBox;
    Image1: TImage;
    GroupBox2: TGroupBox;
    XEdit: TEdit;
    YEdit: TEdit;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    FontEdit: TEdit;
    BitBtn1: TBitBtn;
    FontDialog1: TFontDialog;
    image1wayPath: TEdit;
    image2wayPath: TEdit;
    BitBtnOK: TBitBtn;
    BitBtnDel: TBitBtn;
    BitBtnClose: TBitBtn;
    OpenPictureDialog1: TOpenPictureDialog;
    memo1: TMemo;
    Image2: TImage;
    OpenPictureDialog2: TOpenPictureDialog;
    Label8: TLabel;
    imagesize: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure Image2DblClick(Sender: TObject);
    procedure BitBtnDelClick(Sender: TObject);
  private
    { Private declarations }
  public
   Font:TFont;
    { Public declarations }
  end;

var
  StationMFrm: TStationMFrm;

implementation

{$R *.dfm}

procedure TStationMFrm.BitBtn1Click(Sender: TObject);
begin
  if FontDialog1.Execute then
  begin
    Font:=FontDialog1.Font;
    FontEdit.Text:=FontDialog1.Font.Name+','+IntToStr(FontDialog1.Font.Size);
  end;
end;

procedure TStationMFrm.FormCreate(Sender: TObject);
begin
  Font:=FontDialog1.Font;
end;

procedure TStationMFrm.Image1DblClick(Sender: TObject);
var
   filename:string;
begin
   filename:='';
   if OpenPictureDialog1.Execute then
   begin
     filename := OpenPictureDialog1.filename;
     if filename='' then exit;
     Image2.Picture.Graphic := nil;
     Image1.Picture.LoadFromFile(filename);
     image1wayPath.Text:=filename;
   
   end;
end;

procedure TStationMFrm.Image2DblClick(Sender: TObject);
var
   filename:string;
begin
   filename:='';

   if OpenPictureDialog2.Execute then
   begin
     filename := OpenPictureDialog2.filename;
     if filename='' then exit;
     Image2.Picture.Graphic := nil;
     Image2.Picture.LoadFromFile(filename);
     image2wayPath.Text:= filename;
   end;

end;

procedure TStationMFrm.BitBtnDelClick(Sender: TObject);
begin
  StationNameEdit.Text:='';
  Self.ModalResult:=MrOK;
end;

end.
