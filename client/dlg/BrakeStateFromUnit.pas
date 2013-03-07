unit BrakeStateFromUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ucall_dev, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TBrakeStateForm = class(Tcall_dev)
    RadioGroup1: TRadioGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BrakeStateForm: TBrakeStateForm;

implementation

{$R *.dfm}

end.
