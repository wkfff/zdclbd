unit ufrmabout_History;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, jpeg, se_controls, KsSkinLabels, KsSkinGroupBoxs,
  KsSkinButtons;

type
  Tfrmabout_History = class(TForm)
    OKButton: TSeSkinButton;
    SeSkinGroupBox1: TSeSkinGroupBox;
    ProgramIcon: TImage;
    Copyright: TSeSkinLabel;
    ProductName: TSeSkinLabel;
    Label6: TSeSkinLabel;
    SeSkinGroupBox2: TSeSkinGroupBox;
    Label1: TSeSkinLabel;
    Label2: TSeSkinLabel;
    Label3: TSeSkinLabel;
    Label4: TSeSkinLabel;
    ll: TSeSkinLabel;
    Label5: TSeSkinLabel;
    Label7: TSeSkinLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmabout_History: Tfrmabout_History;

implementation
   uses ugloabvar  ;
{$R *.dfm}

end.
