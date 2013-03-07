unit ufrm_exit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, se_controls, KsSkinForms,
  KsSkinButtons, KsSkinLabels, KsSkinGroupBoxs, KsSkinPanels,adodb,
  KsSkinEngine;

type
  Tfrm_exit = class(TForm)
    SeSkinForm1: TSeSkinForm;
    SeSkinEngine1: TSeSkinEngine;
    Image1: TImage;
    Label1: TSeSkinLabel;
    BitBtn2: TSeSkinButton;
    BitBtn3: TSeSkinButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_exit: Tfrm_exit;

implementation
    uses uGloabVar;
{$R *.dfm}

procedure Tfrm_exit.FormCreate(Sender: TObject);
begin
  SeSkinEngine1.SkinFile := GlobalParam.SkinName ;
end;

end.
